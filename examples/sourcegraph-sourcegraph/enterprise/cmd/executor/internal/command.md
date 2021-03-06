# Package command

## Index

* [Constants](#const)
    * [const ScriptsPath](#ScriptsPath)
    * [const firecrackerContainerDir](#firecrackerContainerDir)
* [Variables](#var)
    * [var ErrIllegalCommand](#ErrIllegalCommand)
    * [var allowedBinaries](#allowedBinaries)
    * [var commandComparer](#commandComparer)
    * [var commonFirecrackerFlags](#commonFirecrackerFlags)
    * [var defaultRunner](#defaultRunner)
    * [var igniteRunLock](#igniteRunLock)
    * [var imagePattern](#imagePattern)
* [Types](#type)
    * [type CommandRunnerRunCommandFunc struct](#CommandRunnerRunCommandFunc)
        * [func (f *CommandRunnerRunCommandFunc) History() []CommandRunnerRunCommandFuncCall](#CommandRunnerRunCommandFunc.History)
        * [func (f *CommandRunnerRunCommandFunc) PushHook(hook func(context.Context, command, *Logger) error)](#CommandRunnerRunCommandFunc.PushHook)
        * [func (f *CommandRunnerRunCommandFunc) PushReturn(r0 error)](#CommandRunnerRunCommandFunc.PushReturn)
        * [func (f *CommandRunnerRunCommandFunc) SetDefaultHook(hook func(context.Context, command, *Logger) error)](#CommandRunnerRunCommandFunc.SetDefaultHook)
        * [func (f *CommandRunnerRunCommandFunc) SetDefaultReturn(r0 error)](#CommandRunnerRunCommandFunc.SetDefaultReturn)
        * [func (f *CommandRunnerRunCommandFunc) appendCall(r0 CommandRunnerRunCommandFuncCall)](#CommandRunnerRunCommandFunc.appendCall)
        * [func (f *CommandRunnerRunCommandFunc) nextHook() func(context.Context, command, *Logger) error](#CommandRunnerRunCommandFunc.nextHook)
    * [type CommandRunnerRunCommandFuncCall struct](#CommandRunnerRunCommandFuncCall)
        * [func (c CommandRunnerRunCommandFuncCall) Args() []interface{}](#CommandRunnerRunCommandFuncCall.Args)
        * [func (c CommandRunnerRunCommandFuncCall) Results() []interface{}](#CommandRunnerRunCommandFuncCall.Results)
    * [type CommandSpec struct](#CommandSpec)
    * [type FirecrackerOptions struct](#FirecrackerOptions)
    * [type Logger struct](#Logger)
        * [func NewLogger(replacements map[string]string) *Logger](#NewLogger)
        * [func (l *Logger) Entries() (entries []workerutil.ExecutionLogEntry)](#Logger.Entries)
        * [func (l *Logger) Log(entry workerutil.ExecutionLogEntry)](#Logger.Log)
    * [type MockCommandRunner struct](#MockCommandRunner)
        * [func NewMockCommandRunner() *MockCommandRunner](#NewMockCommandRunner)
        * [func NewMockCommandRunnerFrom(i surrogateMockCommandRunner) *MockCommandRunner](#NewMockCommandRunnerFrom)
        * [func (m *MockCommandRunner) RunCommand(v0 context.Context, v1 command, v2 *Logger) error](#MockCommandRunner.RunCommand)
    * [type Operations struct](#Operations)
        * [func NewOperations(observationContext *observation.Context) *Operations](#NewOperations)
    * [type Options struct](#Options)
    * [type ResourceOptions struct](#ResourceOptions)
    * [type Runner interface](#Runner)
        * [func NewRunner(dir string, logger *Logger, options Options, operations *Operations) Runner](#NewRunner)
    * [type command struct](#command)
        * [func formatFirecrackerCommand(spec CommandSpec, name, repoDir string, options Options) command](#formatFirecrackerCommand)
        * [func formatRawOrDockerCommand(spec CommandSpec, dir string, options Options) command](#formatRawOrDockerCommand)
    * [type commandRunner interface](#commandRunner)
    * [type dockerRunner struct](#dockerRunner)
        * [func (r *dockerRunner) Run(ctx context.Context, command CommandSpec) error](#dockerRunner.Run)
        * [func (r *dockerRunner) Setup(ctx context.Context, imageNames, scriptPaths []string) error](#dockerRunner.Setup)
        * [func (r *dockerRunner) Teardown(ctx context.Context) error](#dockerRunner.Teardown)
    * [type firecrackerRunner struct](#firecrackerRunner)
        * [func (r *firecrackerRunner) Run(ctx context.Context, command CommandSpec) error](#firecrackerRunner.Run)
        * [func (r *firecrackerRunner) Setup(ctx context.Context, imageNames, scriptPaths []string) error](#firecrackerRunner.Setup)
        * [func (r *firecrackerRunner) Teardown(ctx context.Context) error](#firecrackerRunner.Teardown)
    * [type runnerWrapper struct{}](#runnerWrapper)
        * [func (runnerWrapper) RunCommand(ctx context.Context, command command, logger *Logger) error](#runnerWrapper.RunCommand)
    * [type surrogateMockCommandRunner interface](#surrogateMockCommandRunner)
* [Functions](#func)
    * [func TestFlatten(t *testing.T)](#TestFlatten)
    * [func TestFormatFirecrackerCommandDockerCommand(t *testing.T)](#TestFormatFirecrackerCommandDockerCommand)
    * [func TestFormatFirecrackerCommandDockerScript(t *testing.T)](#TestFormatFirecrackerCommandDockerScript)
    * [func TestFormatFirecrackerCommandRaw(t *testing.T)](#TestFormatFirecrackerCommandRaw)
    * [func TestFormatRawOrDockerCommandDockerCommand(t *testing.T)](#TestFormatRawOrDockerCommandDockerCommand)
    * [func TestFormatRawOrDockerCommandDockerScript(t *testing.T)](#TestFormatRawOrDockerCommandDockerScript)
    * [func TestFormatRawOrDockerCommandRaw(t *testing.T)](#TestFormatRawOrDockerCommandRaw)
    * [func TestIntersperse(t *testing.T)](#TestIntersperse)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestRunCommandEmptyCommand(t *testing.T)](#TestRunCommandEmptyCommand)
    * [func TestRunCommandIllegalCommand(t *testing.T)](#TestRunCommandIllegalCommand)
    * [func TestSanitizeImage(t *testing.T)](#TestSanitizeImage)
    * [func TestSetupFirecracker(t *testing.T)](#TestSetupFirecracker)
    * [func TestTeardownFirecracker(t *testing.T)](#TestTeardownFirecracker)
    * [func compareStrings(x, y []string) bool](#compareStrings)
    * [func dockerEntrypointFlags() []string](#dockerEntrypointFlags)
    * [func dockerEnvFlags(env []string) []string](#dockerEnvFlags)
    * [func dockerResourceFlags(options ResourceOptions) []string](#dockerResourceFlags)
    * [func dockerVolumeFlags(wd, scriptPath string) []string](#dockerVolumeFlags)
    * [func dockerWorkingdirectoryFlags(dir string) []string](#dockerWorkingdirectoryFlags)
    * [func firecrackerCopyfileFlags(dir string, imageKeys []string, options Options) []string](#firecrackerCopyfileFlags)
    * [func firecrackerResourceFlags(options ResourceOptions) []string](#firecrackerResourceFlags)
    * [func flatten(values ...interface{}) []string](#flatten)
    * [func intersperse(flag string, values []string) []string](#intersperse)
    * [func makeTestOperation() *observation.Operation](#makeTestOperation)
    * [func monitorCommand(ctx context.Context, cmd *exec.Cmd, pipeReaderWaitGroup *sync.WaitGroup) (int, error)](#monitorCommand)
    * [func prepCommand(ctx context.Context, command command) (cmd *exec.Cmd, stdout, stderr io.ReadCloser, err error)](#prepCommand)
    * [func readProcessPipes(stdout, stderr io.Reader) (*bytes.Buffer, *sync.WaitGroup)](#readProcessPipes)
    * [func redact(entry workerutil.ExecutionLogEntry, replacer *strings.Replacer) workerutil.ExecutionLogEntry](#redact)
    * [func runCommand(ctx context.Context, command command, logger *Logger) (err error)](#runCommand)
    * [func sanitizeImage(image string) string](#sanitizeImage)
    * [func setupFirecracker(ctx context.Context, runner commandRunner, logger *Logger, name, repoDir string, imageNames, scriptPaths []string, options Options, operations *Operations) error](#setupFirecracker)
    * [func tarfilePathInVM(key string) string](#tarfilePathInVM)
    * [func tarfilePathOnHost(key string, options Options) string](#tarfilePathOnHost)
    * [func teardownFirecracker(ctx context.Context, runner commandRunner, logger *Logger, name string, options Options, operations *Operations) error](#teardownFirecracker)
    * [func validateCommand(command []string) error](#validateCommand)
    * [func watchWaitGroup(wg *sync.WaitGroup) <-chan struct{}](#watchWaitGroup)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="ScriptsPath" href="#ScriptsPath">const ScriptsPath</a>

```
searchKey: command.ScriptsPath
tags: [constant string]
```

```Go
const ScriptsPath = ".sourcegraph-executor"
```

ScriptsPath is the location relative to the executor workspace where the executor will write scripts required for the execution of the job. 

### <a id="firecrackerContainerDir" href="#firecrackerContainerDir">const firecrackerContainerDir</a>

```
searchKey: command.firecrackerContainerDir
tags: [constant string private]
```

```Go
const firecrackerContainerDir = "/work"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrIllegalCommand" href="#ErrIllegalCommand">var ErrIllegalCommand</a>

```
searchKey: command.ErrIllegalCommand
tags: [variable interface]
```

```Go
var ErrIllegalCommand = errors.New("illegal command")
```

### <a id="allowedBinaries" href="#allowedBinaries">var allowedBinaries</a>

```
searchKey: command.allowedBinaries
tags: [variable array string private]
```

```Go
var allowedBinaries = []string{
	"docker",
	"git",
	"ignite",
	"src",
}
```

### <a id="commandComparer" href="#commandComparer">var commandComparer</a>

```
searchKey: command.commandComparer
tags: [variable interface private]
```

```Go
var commandComparer = ...
```

### <a id="commonFirecrackerFlags" href="#commonFirecrackerFlags">var commonFirecrackerFlags</a>

```
searchKey: command.commonFirecrackerFlags
tags: [variable array string private]
```

```Go
var commonFirecrackerFlags = ...
```

### <a id="defaultRunner" href="#defaultRunner">var defaultRunner</a>

```
searchKey: command.defaultRunner
tags: [variable struct private]
```

```Go
var defaultRunner = &runnerWrapper{}
```

### <a id="igniteRunLock" href="#igniteRunLock">var igniteRunLock</a>

```
searchKey: command.igniteRunLock
tags: [variable struct private]
```

```Go
var igniteRunLock sync.Mutex
```

We've recently seen issues with concurent VM creation. It's likely we can do better here and run an empty VM at application startup, but I want to do this quick and dirty to see if we can raise our concurrency without other issues. 

[https://github.com/weaveworks/ignite/issues/559](https://github.com/weaveworks/ignite/issues/559) Following up in [https://github.com/sourcegraph/sourcegraph/issues/21377](https://github.com/sourcegraph/sourcegraph/issues/21377). 

### <a id="imagePattern" href="#imagePattern">var imagePattern</a>

```
searchKey: command.imagePattern
tags: [variable struct private]
```

```Go
var imagePattern = lazyregexp.New(`([^:@]+)(?::([^@]+))?(?:@sha256:([a-z0-9]{64}))?`)
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CommandRunnerRunCommandFunc" href="#CommandRunnerRunCommandFunc">type CommandRunnerRunCommandFunc struct</a>

```
searchKey: command.CommandRunnerRunCommandFunc
tags: [struct private]
```

```Go
type CommandRunnerRunCommandFunc struct {
	defaultHook func(context.Context, command, *Logger) error
	hooks       []func(context.Context, command, *Logger) error
	history     []CommandRunnerRunCommandFuncCall
	mutex       sync.Mutex
}
```

CommandRunnerRunCommandFunc describes the behavior when the RunCommand method of the parent MockCommandRunner instance is invoked. 

#### <a id="CommandRunnerRunCommandFunc.History" href="#CommandRunnerRunCommandFunc.History">func (f *CommandRunnerRunCommandFunc) History() []CommandRunnerRunCommandFuncCall</a>

```
searchKey: command.CommandRunnerRunCommandFunc.History
tags: [method private]
```

```Go
func (f *CommandRunnerRunCommandFunc) History() []CommandRunnerRunCommandFuncCall
```

History returns a sequence of CommandRunnerRunCommandFuncCall objects describing the invocations of this function. 

#### <a id="CommandRunnerRunCommandFunc.PushHook" href="#CommandRunnerRunCommandFunc.PushHook">func (f *CommandRunnerRunCommandFunc) PushHook(hook func(context.Context, command, *Logger) error)</a>

```
searchKey: command.CommandRunnerRunCommandFunc.PushHook
tags: [method private]
```

```Go
func (f *CommandRunnerRunCommandFunc) PushHook(hook func(context.Context, command, *Logger) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the RunCommand method of the parent MockCommandRunner instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="CommandRunnerRunCommandFunc.PushReturn" href="#CommandRunnerRunCommandFunc.PushReturn">func (f *CommandRunnerRunCommandFunc) PushReturn(r0 error)</a>

```
searchKey: command.CommandRunnerRunCommandFunc.PushReturn
tags: [method private]
```

```Go
func (f *CommandRunnerRunCommandFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="CommandRunnerRunCommandFunc.SetDefaultHook" href="#CommandRunnerRunCommandFunc.SetDefaultHook">func (f *CommandRunnerRunCommandFunc) SetDefaultHook(hook func(context.Context, command, *Logger) error)</a>

```
searchKey: command.CommandRunnerRunCommandFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *CommandRunnerRunCommandFunc) SetDefaultHook(hook func(context.Context, command, *Logger) error)
```

SetDefaultHook sets function that is called when the RunCommand method of the parent MockCommandRunner instance is invoked and the hook queue is empty. 

#### <a id="CommandRunnerRunCommandFunc.SetDefaultReturn" href="#CommandRunnerRunCommandFunc.SetDefaultReturn">func (f *CommandRunnerRunCommandFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: command.CommandRunnerRunCommandFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *CommandRunnerRunCommandFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="CommandRunnerRunCommandFunc.appendCall" href="#CommandRunnerRunCommandFunc.appendCall">func (f *CommandRunnerRunCommandFunc) appendCall(r0 CommandRunnerRunCommandFuncCall)</a>

```
searchKey: command.CommandRunnerRunCommandFunc.appendCall
tags: [method private]
```

```Go
func (f *CommandRunnerRunCommandFunc) appendCall(r0 CommandRunnerRunCommandFuncCall)
```

#### <a id="CommandRunnerRunCommandFunc.nextHook" href="#CommandRunnerRunCommandFunc.nextHook">func (f *CommandRunnerRunCommandFunc) nextHook() func(context.Context, command, *Logger) error</a>

```
searchKey: command.CommandRunnerRunCommandFunc.nextHook
tags: [method private]
```

```Go
func (f *CommandRunnerRunCommandFunc) nextHook() func(context.Context, command, *Logger) error
```

### <a id="CommandRunnerRunCommandFuncCall" href="#CommandRunnerRunCommandFuncCall">type CommandRunnerRunCommandFuncCall struct</a>

```
searchKey: command.CommandRunnerRunCommandFuncCall
tags: [struct private]
```

```Go
type CommandRunnerRunCommandFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 command
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 *Logger
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

CommandRunnerRunCommandFuncCall is an object that describes an invocation of method RunCommand on an instance of MockCommandRunner. 

#### <a id="CommandRunnerRunCommandFuncCall.Args" href="#CommandRunnerRunCommandFuncCall.Args">func (c CommandRunnerRunCommandFuncCall) Args() []interface{}</a>

```
searchKey: command.CommandRunnerRunCommandFuncCall.Args
tags: [method private]
```

```Go
func (c CommandRunnerRunCommandFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="CommandRunnerRunCommandFuncCall.Results" href="#CommandRunnerRunCommandFuncCall.Results">func (c CommandRunnerRunCommandFuncCall) Results() []interface{}</a>

```
searchKey: command.CommandRunnerRunCommandFuncCall.Results
tags: [method private]
```

```Go
func (c CommandRunnerRunCommandFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="CommandSpec" href="#CommandSpec">type CommandSpec struct</a>

```
searchKey: command.CommandSpec
tags: [struct]
```

```Go
type CommandSpec struct {
	Key        string
	Image      string
	ScriptPath string
	Command    []string
	Dir        string
	Env        []string
	Operation  *observation.Operation
}
```

CommandSpec represents a command that can be run on a machine, whether that is the host, in a virtual machine, or in a docker container. If an image is supplied, then the command will be run in a one-shot docker container. 

### <a id="FirecrackerOptions" href="#FirecrackerOptions">type FirecrackerOptions struct</a>

```
searchKey: command.FirecrackerOptions
tags: [struct]
```

```Go
type FirecrackerOptions struct {
	// Enabled determines if commands will be run in Firecracker virtual machines.
	Enabled bool

	// Image is the base image used for all Firecracker virtual machines.
	Image string

	// ImageArchivesPath is a path on the host where docker image tarfiles will be stored.
	ImageArchivesPath string
}
```

### <a id="Logger" href="#Logger">type Logger struct</a>

```
searchKey: command.Logger
tags: [struct]
```

```Go
type Logger struct {
	replacer *strings.Replacer
	entries  []workerutil.ExecutionLogEntry
}
```

Logger tracks command invocations and stores the command's output and error stream values. 

#### <a id="NewLogger" href="#NewLogger">func NewLogger(replacements map[string]string) *Logger</a>

```
searchKey: command.NewLogger
tags: [function]
```

```Go
func NewLogger(replacements map[string]string) *Logger
```

NewLogger creates a new logger instance with the given replacement map. When the log messages are serialized, any occurrence of sensitive values are replace with a non-sensitive value. 

#### <a id="Logger.Entries" href="#Logger.Entries">func (l *Logger) Entries() (entries []workerutil.ExecutionLogEntry)</a>

```
searchKey: command.Logger.Entries
tags: [method]
```

```Go
func (l *Logger) Entries() (entries []workerutil.ExecutionLogEntry)
```

Entries returns a copy of the stored log entries. 

#### <a id="Logger.Log" href="#Logger.Log">func (l *Logger) Log(entry workerutil.ExecutionLogEntry)</a>

```
searchKey: command.Logger.Log
tags: [method]
```

```Go
func (l *Logger) Log(entry workerutil.ExecutionLogEntry)
```

Log redacts secrets from the given log entry and stores it. 

### <a id="MockCommandRunner" href="#MockCommandRunner">type MockCommandRunner struct</a>

```
searchKey: command.MockCommandRunner
tags: [struct private]
```

```Go
type MockCommandRunner struct {
	// RunCommandFunc is an instance of a mock function object controlling
	// the behavior of the method RunCommand.
	RunCommandFunc *CommandRunnerRunCommandFunc
}
```

MockCommandRunner is a mock implementation of the commandRunner interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/executor/internal/command) used for unit testing. 

#### <a id="NewMockCommandRunner" href="#NewMockCommandRunner">func NewMockCommandRunner() *MockCommandRunner</a>

```
searchKey: command.NewMockCommandRunner
tags: [function private]
```

```Go
func NewMockCommandRunner() *MockCommandRunner
```

NewMockCommandRunner creates a new mock of the commandRunner interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockCommandRunnerFrom" href="#NewMockCommandRunnerFrom">func NewMockCommandRunnerFrom(i surrogateMockCommandRunner) *MockCommandRunner</a>

```
searchKey: command.NewMockCommandRunnerFrom
tags: [function private]
```

```Go
func NewMockCommandRunnerFrom(i surrogateMockCommandRunner) *MockCommandRunner
```

NewMockCommandRunnerFrom creates a new mock of the MockCommandRunner interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockCommandRunner.RunCommand" href="#MockCommandRunner.RunCommand">func (m *MockCommandRunner) RunCommand(v0 context.Context, v1 command, v2 *Logger) error</a>

```
searchKey: command.MockCommandRunner.RunCommand
tags: [method private]
```

```Go
func (m *MockCommandRunner) RunCommand(v0 context.Context, v1 command, v2 *Logger) error
```

RunCommand delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="Operations" href="#Operations">type Operations struct</a>

```
searchKey: command.Operations
tags: [struct]
```

```Go
type Operations struct {
	SetupGitInit              *observation.Operation
	SetupGitFetch             *observation.Operation
	SetupAddRemote            *observation.Operation
	SetupGitCheckout          *observation.Operation
	SetupDockerPull           *observation.Operation
	SetupDockerSave           *observation.Operation
	SetupDockerLoad           *observation.Operation
	SetupFirecrackerStart     *observation.Operation
	SetupRm                   *observation.Operation
	TeardownFirecrackerStop   *observation.Operation
	TeardownFirecrackerRemove *observation.Operation
	Exec                      *observation.Operation
}
```

#### <a id="NewOperations" href="#NewOperations">func NewOperations(observationContext *observation.Context) *Operations</a>

```
searchKey: command.NewOperations
tags: [function]
```

```Go
func NewOperations(observationContext *observation.Context) *Operations
```

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: command.Options
tags: [struct]
```

```Go
type Options struct {
	// ExecutorName is a unique identifier for the requesting executor.
	ExecutorName string

	// FirecrackerOptions configures the behavior of Firecracker virtual machine creation.
	FirecrackerOptions FirecrackerOptions

	// ResourceOptions configures the resource limits of docker container and Firecracker
	// virtual machines running on the executor.
	ResourceOptions ResourceOptions
}
```

### <a id="ResourceOptions" href="#ResourceOptions">type ResourceOptions struct</a>

```
searchKey: command.ResourceOptions
tags: [struct]
```

```Go
type ResourceOptions struct {
	// NumCPUs is the number of virtual CPUs a container or VM can use.
	NumCPUs int

	// Memory is the maximum amount of memory a container or VM can use.
	Memory string

	// DiskSpace is the maximum amount of disk a container or VM can use.
	DiskSpace string
}
```

### <a id="Runner" href="#Runner">type Runner interface</a>

```
searchKey: command.Runner
tags: [interface]
```

```Go
type Runner interface {
	// Setup prepares the runner to invoke a series of commands.
	Setup(ctx context.Context, imageNames, scriptPaths []string) error

	// Teardown disposes of any resources created in Setup.
	Teardown(ctx context.Context) error

	// Run invokes a command in the runner context.
	Run(ctx context.Context, command CommandSpec) error
}
```

Runner is the interface between an executor and the host on which commands are invoked. Having this interface at this level allows us to use the same code paths for local development (via shell + docker) as well as production usage (via Firecracker). 

#### <a id="NewRunner" href="#NewRunner">func NewRunner(dir string, logger *Logger, options Options, operations *Operations) Runner</a>

```
searchKey: command.NewRunner
tags: [function]
```

```Go
func NewRunner(dir string, logger *Logger, options Options, operations *Operations) Runner
```

NewRunner creates a new runner with the given options. 

### <a id="command" href="#command">type command struct</a>

```
searchKey: command.command
tags: [struct private]
```

```Go
type command struct {
	Key       string
	Command   []string
	Dir       string
	Env       []string
	Operation *observation.Operation
}
```

#### <a id="formatFirecrackerCommand" href="#formatFirecrackerCommand">func formatFirecrackerCommand(spec CommandSpec, name, repoDir string, options Options) command</a>

```
searchKey: command.formatFirecrackerCommand
tags: [function private]
```

```Go
func formatFirecrackerCommand(spec CommandSpec, name, repoDir string, options Options) command
```

formatFirecrackerCommand constructs the command to run on the host via a Firecracker virtual machine in order to invoke the given spec. If the spec specifies an image, then the command will be run inside of a container inside of the VM. Otherwise, the command will be run inside of the VM. The containers are one-shot and subject to the resource limits specified in the given options. 

The name value supplied here refers to the Firecracker virtual machine, which must have also been the name supplied to a successful invocation of setupFirecracker. Additionally, the virtual machine must not yet have been torn down (via teardownFirecracker). 

#### <a id="formatRawOrDockerCommand" href="#formatRawOrDockerCommand">func formatRawOrDockerCommand(spec CommandSpec, dir string, options Options) command</a>

```
searchKey: command.formatRawOrDockerCommand
tags: [function private]
```

```Go
func formatRawOrDockerCommand(spec CommandSpec, dir string, options Options) command
```

formatRawOrDockerCommand constructs the command to run on the host in order to invoke the given spec. If the spec does not specify an image, then the command will be run _directly_ on the host. Otherwise, the command will be run inside of a one-shot docker container subject to the resource limits specified in the given options. 

### <a id="commandRunner" href="#commandRunner">type commandRunner interface</a>

```
searchKey: command.commandRunner
tags: [interface private]
```

```Go
type commandRunner interface {
	RunCommand(ctx context.Context, command command, logger *Logger) error
}
```

### <a id="dockerRunner" href="#dockerRunner">type dockerRunner struct</a>

```
searchKey: command.dockerRunner
tags: [struct private]
```

```Go
type dockerRunner struct {
	dir     string
	logger  *Logger
	options Options
}
```

#### <a id="dockerRunner.Run" href="#dockerRunner.Run">func (r *dockerRunner) Run(ctx context.Context, command CommandSpec) error</a>

```
searchKey: command.dockerRunner.Run
tags: [method private]
```

```Go
func (r *dockerRunner) Run(ctx context.Context, command CommandSpec) error
```

#### <a id="dockerRunner.Setup" href="#dockerRunner.Setup">func (r *dockerRunner) Setup(ctx context.Context, imageNames, scriptPaths []string) error</a>

```
searchKey: command.dockerRunner.Setup
tags: [method private]
```

```Go
func (r *dockerRunner) Setup(ctx context.Context, imageNames, scriptPaths []string) error
```

#### <a id="dockerRunner.Teardown" href="#dockerRunner.Teardown">func (r *dockerRunner) Teardown(ctx context.Context) error</a>

```
searchKey: command.dockerRunner.Teardown
tags: [method private]
```

```Go
func (r *dockerRunner) Teardown(ctx context.Context) error
```

### <a id="firecrackerRunner" href="#firecrackerRunner">type firecrackerRunner struct</a>

```
searchKey: command.firecrackerRunner
tags: [struct private]
```

```Go
type firecrackerRunner struct {
	name       string
	dir        string
	logger     *Logger
	options    Options
	operations *Operations
}
```

#### <a id="firecrackerRunner.Run" href="#firecrackerRunner.Run">func (r *firecrackerRunner) Run(ctx context.Context, command CommandSpec) error</a>

```
searchKey: command.firecrackerRunner.Run
tags: [method private]
```

```Go
func (r *firecrackerRunner) Run(ctx context.Context, command CommandSpec) error
```

#### <a id="firecrackerRunner.Setup" href="#firecrackerRunner.Setup">func (r *firecrackerRunner) Setup(ctx context.Context, imageNames, scriptPaths []string) error</a>

```
searchKey: command.firecrackerRunner.Setup
tags: [method private]
```

```Go
func (r *firecrackerRunner) Setup(ctx context.Context, imageNames, scriptPaths []string) error
```

#### <a id="firecrackerRunner.Teardown" href="#firecrackerRunner.Teardown">func (r *firecrackerRunner) Teardown(ctx context.Context) error</a>

```
searchKey: command.firecrackerRunner.Teardown
tags: [method private]
```

```Go
func (r *firecrackerRunner) Teardown(ctx context.Context) error
```

### <a id="runnerWrapper" href="#runnerWrapper">type runnerWrapper struct{}</a>

```
searchKey: command.runnerWrapper
tags: [struct private]
```

```Go
type runnerWrapper struct{}
```

#### <a id="runnerWrapper.RunCommand" href="#runnerWrapper.RunCommand">func (runnerWrapper) RunCommand(ctx context.Context, command command, logger *Logger) error</a>

```
searchKey: command.runnerWrapper.RunCommand
tags: [method private]
```

```Go
func (runnerWrapper) RunCommand(ctx context.Context, command command, logger *Logger) error
```

### <a id="surrogateMockCommandRunner" href="#surrogateMockCommandRunner">type surrogateMockCommandRunner interface</a>

```
searchKey: command.surrogateMockCommandRunner
tags: [interface private]
```

```Go
type surrogateMockCommandRunner interface {
	RunCommand(context.Context, command, *Logger) error
}
```

surrogateMockCommandRunner is a copy of the commandRunner interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/executor/internal/command). It is redefined here as it is unexported in the source package. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestFlatten" href="#TestFlatten">func TestFlatten(t *testing.T)</a>

```
searchKey: command.TestFlatten
tags: [function private test]
```

```Go
func TestFlatten(t *testing.T)
```

### <a id="TestFormatFirecrackerCommandDockerCommand" href="#TestFormatFirecrackerCommandDockerCommand">func TestFormatFirecrackerCommandDockerCommand(t *testing.T)</a>

```
searchKey: command.TestFormatFirecrackerCommandDockerCommand
tags: [function private test]
```

```Go
func TestFormatFirecrackerCommandDockerCommand(t *testing.T)
```

### <a id="TestFormatFirecrackerCommandDockerScript" href="#TestFormatFirecrackerCommandDockerScript">func TestFormatFirecrackerCommandDockerScript(t *testing.T)</a>

```
searchKey: command.TestFormatFirecrackerCommandDockerScript
tags: [function private test]
```

```Go
func TestFormatFirecrackerCommandDockerScript(t *testing.T)
```

### <a id="TestFormatFirecrackerCommandRaw" href="#TestFormatFirecrackerCommandRaw">func TestFormatFirecrackerCommandRaw(t *testing.T)</a>

```
searchKey: command.TestFormatFirecrackerCommandRaw
tags: [function private test]
```

```Go
func TestFormatFirecrackerCommandRaw(t *testing.T)
```

### <a id="TestFormatRawOrDockerCommandDockerCommand" href="#TestFormatRawOrDockerCommandDockerCommand">func TestFormatRawOrDockerCommandDockerCommand(t *testing.T)</a>

```
searchKey: command.TestFormatRawOrDockerCommandDockerCommand
tags: [function private test]
```

```Go
func TestFormatRawOrDockerCommandDockerCommand(t *testing.T)
```

### <a id="TestFormatRawOrDockerCommandDockerScript" href="#TestFormatRawOrDockerCommandDockerScript">func TestFormatRawOrDockerCommandDockerScript(t *testing.T)</a>

```
searchKey: command.TestFormatRawOrDockerCommandDockerScript
tags: [function private test]
```

```Go
func TestFormatRawOrDockerCommandDockerScript(t *testing.T)
```

### <a id="TestFormatRawOrDockerCommandRaw" href="#TestFormatRawOrDockerCommandRaw">func TestFormatRawOrDockerCommandRaw(t *testing.T)</a>

```
searchKey: command.TestFormatRawOrDockerCommandRaw
tags: [function private test]
```

```Go
func TestFormatRawOrDockerCommandRaw(t *testing.T)
```

### <a id="TestIntersperse" href="#TestIntersperse">func TestIntersperse(t *testing.T)</a>

```
searchKey: command.TestIntersperse
tags: [function private test]
```

```Go
func TestIntersperse(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: command.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestRunCommandEmptyCommand" href="#TestRunCommandEmptyCommand">func TestRunCommandEmptyCommand(t *testing.T)</a>

```
searchKey: command.TestRunCommandEmptyCommand
tags: [function private test]
```

```Go
func TestRunCommandEmptyCommand(t *testing.T)
```

### <a id="TestRunCommandIllegalCommand" href="#TestRunCommandIllegalCommand">func TestRunCommandIllegalCommand(t *testing.T)</a>

```
searchKey: command.TestRunCommandIllegalCommand
tags: [function private test]
```

```Go
func TestRunCommandIllegalCommand(t *testing.T)
```

### <a id="TestSanitizeImage" href="#TestSanitizeImage">func TestSanitizeImage(t *testing.T)</a>

```
searchKey: command.TestSanitizeImage
tags: [function private test]
```

```Go
func TestSanitizeImage(t *testing.T)
```

### <a id="TestSetupFirecracker" href="#TestSetupFirecracker">func TestSetupFirecracker(t *testing.T)</a>

```
searchKey: command.TestSetupFirecracker
tags: [function private test]
```

```Go
func TestSetupFirecracker(t *testing.T)
```

### <a id="TestTeardownFirecracker" href="#TestTeardownFirecracker">func TestTeardownFirecracker(t *testing.T)</a>

```
searchKey: command.TestTeardownFirecracker
tags: [function private test]
```

```Go
func TestTeardownFirecracker(t *testing.T)
```

### <a id="compareStrings" href="#compareStrings">func compareStrings(x, y []string) bool</a>

```
searchKey: command.compareStrings
tags: [function private]
```

```Go
func compareStrings(x, y []string) bool
```

### <a id="dockerEntrypointFlags" href="#dockerEntrypointFlags">func dockerEntrypointFlags() []string</a>

```
searchKey: command.dockerEntrypointFlags
tags: [function private]
```

```Go
func dockerEntrypointFlags() []string
```

### <a id="dockerEnvFlags" href="#dockerEnvFlags">func dockerEnvFlags(env []string) []string</a>

```
searchKey: command.dockerEnvFlags
tags: [function private]
```

```Go
func dockerEnvFlags(env []string) []string
```

### <a id="dockerResourceFlags" href="#dockerResourceFlags">func dockerResourceFlags(options ResourceOptions) []string</a>

```
searchKey: command.dockerResourceFlags
tags: [function private]
```

```Go
func dockerResourceFlags(options ResourceOptions) []string
```

### <a id="dockerVolumeFlags" href="#dockerVolumeFlags">func dockerVolumeFlags(wd, scriptPath string) []string</a>

```
searchKey: command.dockerVolumeFlags
tags: [function private]
```

```Go
func dockerVolumeFlags(wd, scriptPath string) []string
```

### <a id="dockerWorkingdirectoryFlags" href="#dockerWorkingdirectoryFlags">func dockerWorkingdirectoryFlags(dir string) []string</a>

```
searchKey: command.dockerWorkingdirectoryFlags
tags: [function private]
```

```Go
func dockerWorkingdirectoryFlags(dir string) []string
```

### <a id="firecrackerCopyfileFlags" href="#firecrackerCopyfileFlags">func firecrackerCopyfileFlags(dir string, imageKeys []string, options Options) []string</a>

```
searchKey: command.firecrackerCopyfileFlags
tags: [function private]
```

```Go
func firecrackerCopyfileFlags(dir string, imageKeys []string, options Options) []string
```

### <a id="firecrackerResourceFlags" href="#firecrackerResourceFlags">func firecrackerResourceFlags(options ResourceOptions) []string</a>

```
searchKey: command.firecrackerResourceFlags
tags: [function private]
```

```Go
func firecrackerResourceFlags(options ResourceOptions) []string
```

### <a id="flatten" href="#flatten">func flatten(values ...interface{}) []string</a>

```
searchKey: command.flatten
tags: [function private]
```

```Go
func flatten(values ...interface{}) []string
```

flatten combines string values and (non-recursive) string slice values into a single string slice. 

### <a id="intersperse" href="#intersperse">func intersperse(flag string, values []string) []string</a>

```
searchKey: command.intersperse
tags: [function private]
```

```Go
func intersperse(flag string, values []string) []string
```

intersperse returns a slice following the pattern `flag, v1, flag, v2, ...`. 

### <a id="makeTestOperation" href="#makeTestOperation">func makeTestOperation() *observation.Operation</a>

```
searchKey: command.makeTestOperation
tags: [function private]
```

```Go
func makeTestOperation() *observation.Operation
```

### <a id="monitorCommand" href="#monitorCommand">func monitorCommand(ctx context.Context, cmd *exec.Cmd, pipeReaderWaitGroup *sync.WaitGroup) (int, error)</a>

```
searchKey: command.monitorCommand
tags: [function private]
```

```Go
func monitorCommand(ctx context.Context, cmd *exec.Cmd, pipeReaderWaitGroup *sync.WaitGroup) (int, error)
```

monitorCommand starts the given command and waits for the given wait group to complete. This function returns a non-nil error only if there was a system issue - commands that run but fail due to a non-zero exit code will return a nil error and the exit code. 

### <a id="prepCommand" href="#prepCommand">func prepCommand(ctx context.Context, command command) (cmd *exec.Cmd, stdout, stderr io.ReadCloser, err error)</a>

```
searchKey: command.prepCommand
tags: [function private]
```

```Go
func prepCommand(ctx context.Context, command command) (cmd *exec.Cmd, stdout, stderr io.ReadCloser, err error)
```

### <a id="readProcessPipes" href="#readProcessPipes">func readProcessPipes(stdout, stderr io.Reader) (*bytes.Buffer, *sync.WaitGroup)</a>

```
searchKey: command.readProcessPipes
tags: [function private]
```

```Go
func readProcessPipes(stdout, stderr io.Reader) (*bytes.Buffer, *sync.WaitGroup)
```

### <a id="redact" href="#redact">func redact(entry workerutil.ExecutionLogEntry, replacer *strings.Replacer) workerutil.ExecutionLogEntry</a>

```
searchKey: command.redact
tags: [function private]
```

```Go
func redact(entry workerutil.ExecutionLogEntry, replacer *strings.Replacer) workerutil.ExecutionLogEntry
```

### <a id="runCommand" href="#runCommand">func runCommand(ctx context.Context, command command, logger *Logger) (err error)</a>

```
searchKey: command.runCommand
tags: [function private]
```

```Go
func runCommand(ctx context.Context, command command, logger *Logger) (err error)
```

runCommand invokes the given command on the host machine. The standard output and standard error streams of the invoked command are written to the given logger. 

### <a id="sanitizeImage" href="#sanitizeImage">func sanitizeImage(image string) string</a>

```
searchKey: command.sanitizeImage
tags: [function private]
```

```Go
func sanitizeImage(image string) string
```

sanitizeImage sanitizes the given docker image for use by ignite. The ignite utility has some issue parsing docker tags that include a sha256 hash, so we try to remove it from any of the image references before passing it to the ignite command. 

### <a id="setupFirecracker" href="#setupFirecracker">func setupFirecracker(ctx context.Context, runner commandRunner, logger *Logger, name, repoDir string, imageNames, scriptPaths []string, options Options, operations *Operations) error</a>

```
searchKey: command.setupFirecracker
tags: [function private]
```

```Go
func setupFirecracker(ctx context.Context, runner commandRunner, logger *Logger, name, repoDir string, imageNames, scriptPaths []string, options Options, operations *Operations) error
```

setupFirecracker invokes a set of commands to provision and prepare a Firecracker virtual machine instance. This is done in several steps: 

```
- For each of the docker images supplied, issue a `docker pull` and a `docker save`
  to ensure we have an up-to-date tar archive of the requested image on the host.
  These can be shared between different jobs.
- Provision a Firecracker VM (via ignite) subject to the resource limits specified
  in the given options, and copy the contents of the working directory as well as
  the docker image tar archives.
- Inside of the Firecracker VM, run docker load over all of the copied tarfiles so
  that we do not need to pull the images from inside the VM, which has an empty
  docker cache and would require us to pull images on every job.

```
### <a id="tarfilePathInVM" href="#tarfilePathInVM">func tarfilePathInVM(key string) string</a>

```
searchKey: command.tarfilePathInVM
tags: [function private]
```

```Go
func tarfilePathInVM(key string) string
```

### <a id="tarfilePathOnHost" href="#tarfilePathOnHost">func tarfilePathOnHost(key string, options Options) string</a>

```
searchKey: command.tarfilePathOnHost
tags: [function private]
```

```Go
func tarfilePathOnHost(key string, options Options) string
```

### <a id="teardownFirecracker" href="#teardownFirecracker">func teardownFirecracker(ctx context.Context, runner commandRunner, logger *Logger, name string, options Options, operations *Operations) error</a>

```
searchKey: command.teardownFirecracker
tags: [function private]
```

```Go
func teardownFirecracker(ctx context.Context, runner commandRunner, logger *Logger, name string, options Options, operations *Operations) error
```

teardownFirecracker issues a stop and a remove request for the Firecracker VM with the given name. 

### <a id="validateCommand" href="#validateCommand">func validateCommand(command []string) error</a>

```
searchKey: command.validateCommand
tags: [function private]
```

```Go
func validateCommand(command []string) error
```

### <a id="watchWaitGroup" href="#watchWaitGroup">func watchWaitGroup(wg *sync.WaitGroup) <-chan struct{}</a>

```
searchKey: command.watchWaitGroup
tags: [function private]
```

```Go
func watchWaitGroup(wg *sync.WaitGroup) <-chan struct{}
```

