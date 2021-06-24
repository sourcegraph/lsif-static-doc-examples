# Package exec

Package exec runs external commands. It wraps os.StartProcess to make it easier to remap stdin and stdout, connect I/O with pipes, and do other adjustments. 

Unlike the "system" library call from C and other languages, the os/exec package intentionally does not invoke the system shell and does not expand any glob patterns or handle other expansions, pipelines, or redirections typically done by shells. The package behaves more like C's "exec" family of functions. To expand glob patterns, either call the shell directly, taking care to escape any dangerous input, or use the path/filepath package's Glob function. To expand environment variables, use package os's ExpandEnv. 

Note that the examples in this package assume a Unix system. They may not run on Windows, and they do not run in the Go Playground used by golang.org and godoc.org. 

## Index

* [Variables](#var)
    * [var ErrNotFound](#ErrNotFound)
    * [var nonExistentPaths](#nonExistentPaths)
    * [var skipStdinCopyError](#skipStdinCopyError)
* [Types](#type)
    * [type Cmd struct](#Cmd)
        * [func Command(name string, arg ...string) *Cmd](#Command)
        * [func CommandContext(ctx context.Context, name string, arg ...string) *Cmd](#CommandContext)
        * [func (c *Cmd) CombinedOutput() ([]byte, error)](#Cmd.CombinedOutput)
        * [func (c *Cmd) Output() ([]byte, error)](#Cmd.Output)
        * [func (c *Cmd) Run() error](#Cmd.Run)
        * [func (c *Cmd) Start() error](#Cmd.Start)
        * [func (c *Cmd) StderrPipe() (io.ReadCloser, error)](#Cmd.StderrPipe)
        * [func (c *Cmd) StdinPipe() (io.WriteCloser, error)](#Cmd.StdinPipe)
        * [func (c *Cmd) StdoutPipe() (io.ReadCloser, error)](#Cmd.StdoutPipe)
        * [func (c *Cmd) String() string](#Cmd.String)
        * [func (c *Cmd) Wait() error](#Cmd.Wait)
        * [func (c *Cmd) argv() []string](#Cmd.argv)
        * [func (c *Cmd) closeDescriptors(closers []io.Closer)](#Cmd.closeDescriptors)
        * [func (c *Cmd) envv() ([]string, error)](#Cmd.envv)
        * [func (c *Cmd) stderr() (f *os.File, err error)](#Cmd.stderr)
        * [func (c *Cmd) stdin() (f *os.File, err error)](#Cmd.stdin)
        * [func (c *Cmd) stdout() (f *os.File, err error)](#Cmd.stdout)
        * [func (c *Cmd) writerDescriptor(w io.Writer) (f *os.File, err error)](#Cmd.writerDescriptor)
    * [type Error struct](#Error)
        * [func (e *Error) Error() string](#Error.Error)
        * [func (e *Error) Unwrap() error](#Error.Unwrap)
    * [type ExitError struct](#ExitError)
        * [func (e *ExitError) Error() string](#ExitError.Error)
    * [type closeOnce struct](#closeOnce)
        * [func (c *closeOnce) Close() error](#closeOnce.Close)
        * [func (c *closeOnce) close()](#closeOnce.close)
    * [type prefixSuffixSaver struct](#prefixSuffixSaver)
        * [func (w *prefixSuffixSaver) Bytes() []byte](#prefixSuffixSaver.Bytes)
        * [func (w *prefixSuffixSaver) Write(p []byte) (n int, err error)](#prefixSuffixSaver.Write)
        * [func (w *prefixSuffixSaver) fill(dst *[]byte, p []byte) (pRemain []byte)](#prefixSuffixSaver.fill)
* [Functions](#func)
    * [func BenchmarkExecHostname(b *testing.B)](#BenchmarkExecHostname)
    * [func LookPath(file string) (string, error)](#LookPath)
    * [func TestDedupEnv(t *testing.T)](#TestDedupEnv)
    * [func TestLookPathNotFound(t *testing.T)](#TestLookPathNotFound)
    * [func TestLookPathUnixEmptyPath(t *testing.T)](#TestLookPathUnixEmptyPath)
    * [func TestPrefixSuffixSaver(t *testing.T)](#TestPrefixSuffixSaver)
    * [func addCriticalEnv(env []string) []string](#addCriticalEnv)
    * [func dedupEnv(env []string) []string](#dedupEnv)
    * [func dedupEnvCase(caseInsensitive bool, env []string) []string](#dedupEnvCase)
    * [func findExecutable(file string) error](#findExecutable)
    * [func init()](#init.exec_unix.go)
    * [func interfaceEqual(a, b interface{}) bool](#interfaceEqual)
    * [func lookExtensions(path, dir string) (string, error)](#lookExtensions)
    * [func minInt(a, b int) int](#minInt)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="ErrNotFound" href="#ErrNotFound">var ErrNotFound</a>

```
searchKey: exec.ErrNotFound
tags: [variable interface]
```

```Go
var ErrNotFound = errors.New("executable file not found in $PATH")
```

ErrNotFound is the error resulting if a path search failed to find an executable file. 

### <a id="nonExistentPaths" href="#nonExistentPaths">var nonExistentPaths</a>

```
searchKey: exec.nonExistentPaths
tags: [variable array string private]
```

```Go
var nonExistentPaths = []string{
	"some-non-existent-path",
	"non-existent-path/slashed",
}
```

### <a id="skipStdinCopyError" href="#skipStdinCopyError">var skipStdinCopyError</a>

```
searchKey: exec.skipStdinCopyError
tags: [variable function private]
```

```Go
var skipStdinCopyError func(error) bool
```

skipStdinCopyError optionally specifies a function which reports whether the provided stdin copy error should be ignored. 

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Cmd" href="#Cmd">type Cmd struct</a>

```
searchKey: exec.Cmd
tags: [struct]
```

```Go
type Cmd struct {
	// Path is the path of the command to run.
	//
	// This is the only field that must be set to a non-zero
	// value. If Path is relative, it is evaluated relative
	// to Dir.
	Path string

	// Args holds command line arguments, including the command as Args[0].
	// If the Args field is empty or nil, Run uses {Path}.
	//
	// In typical use, both Path and Args are set by calling Command.
	Args []string

	// Env specifies the environment of the process.
	// Each entry is of the form "key=value".
	// If Env is nil, the new process uses the current process's
	// environment.
	// If Env contains duplicate environment keys, only the last
	// value in the slice for each duplicate key is used.
	// As a special case on Windows, SYSTEMROOT is always added if
	// missing and not explicitly set to the empty string.
	Env []string

	// Dir specifies the working directory of the command.
	// If Dir is the empty string, Run runs the command in the
	// calling process's current directory.
	Dir string

	// Stdin specifies the process's standard input.
	//
	// If Stdin is nil, the process reads from the null device (os.DevNull).
	//
	// If Stdin is an *os.File, the process's standard input is connected
	// directly to that file.
	//
	// Otherwise, during the execution of the command a separate
	// goroutine reads from Stdin and delivers that data to the command
	// over a pipe. In this case, Wait does not complete until the goroutine
	// stops copying, either because it has reached the end of Stdin
	// (EOF or a read error) or because writing to the pipe returned an error.
	Stdin io.Reader

	// Stdout and Stderr specify the process's standard output and error.
	//
	// If either is nil, Run connects the corresponding file descriptor
	// to the null device (os.DevNull).
	//
	// If either is an *os.File, the corresponding output from the process
	// is connected directly to that file.
	//
	// Otherwise, during the execution of the command a separate goroutine
	// reads from the process over a pipe and delivers that data to the
	// corresponding Writer. In this case, Wait does not complete until the
	// goroutine reaches EOF or encounters an error.
	//
	// If Stdout and Stderr are the same writer, and have a type that can
	// be compared with ==, at most one goroutine at a time will call Write.
	Stdout io.Writer
	Stderr io.Writer

	// ExtraFiles specifies additional open files to be inherited by the
	// new process. It does not include standard input, standard output, or
	// standard error. If non-nil, entry i becomes file descriptor 3+i.
	//
	// ExtraFiles is not supported on Windows.
	ExtraFiles []*os.File

	// SysProcAttr holds optional, operating system-specific attributes.
	// Run passes it to os.StartProcess as the os.ProcAttr's Sys field.
	SysProcAttr *syscall.SysProcAttr

	// Process is the underlying process, once started.
	Process *os.Process

	// ProcessState contains information about an exited process,
	// available after a call to Wait or Run.
	ProcessState *os.ProcessState

	ctx             context.Context // nil means none
	lookPathErr     error           // LookPath error, if any.
	finished        bool            // when Wait was called
	childFiles      []*os.File
	closeAfterStart []io.Closer
	closeAfterWait  []io.Closer
	goroutine       []func() error
	errch           chan error // one send per goroutine
	waitDone        chan struct{}
}
```

Cmd represents an external command being prepared or run. 

A Cmd cannot be reused after calling its Run, Output or CombinedOutput methods. 

#### <a id="Command" href="#Command">func Command(name string, arg ...string) *Cmd</a>

```
searchKey: exec.Command
tags: [method]
```

```Go
func Command(name string, arg ...string) *Cmd
```

Command returns the Cmd struct to execute the named program with the given arguments. 

It sets only the Path and Args in the returned structure. 

If name contains no path separators, Command uses LookPath to resolve name to a complete path if possible. Otherwise it uses name directly as Path. 

The returned Cmd's Args field is constructed from the command name followed by the elements of arg, so arg should not include the command name itself. For example, Command("echo", "hello"). Args[0] is always name, not the possibly resolved Path. 

On Windows, processes receive the whole command line as a single string and do their own parsing. Command combines and quotes Args into a command line string with an algorithm compatible with applications using CommandLineToArgvW (which is the most common way). Notable exceptions are msiexec.exe and cmd.exe (and thus, all batch files), which have a different unquoting algorithm. In these or other similar cases, you can do the quoting yourself and provide the full command line in SysProcAttr.CmdLine, leaving Args empty. 

#### <a id="CommandContext" href="#CommandContext">func CommandContext(ctx context.Context, name string, arg ...string) *Cmd</a>

```
searchKey: exec.CommandContext
tags: [method]
```

```Go
func CommandContext(ctx context.Context, name string, arg ...string) *Cmd
```

CommandContext is like Command but includes a context. 

The provided context is used to kill the process (by calling os.Process.Kill) if the context becomes done before the command completes on its own. 

#### <a id="Cmd.CombinedOutput" href="#Cmd.CombinedOutput">func (c *Cmd) CombinedOutput() ([]byte, error)</a>

```
searchKey: exec.Cmd.CombinedOutput
tags: [function]
```

```Go
func (c *Cmd) CombinedOutput() ([]byte, error)
```

CombinedOutput runs the command and returns its combined standard output and standard error. 

#### <a id="Cmd.Output" href="#Cmd.Output">func (c *Cmd) Output() ([]byte, error)</a>

```
searchKey: exec.Cmd.Output
tags: [function]
```

```Go
func (c *Cmd) Output() ([]byte, error)
```

Output runs the command and returns its standard output. Any returned error will usually be of type *ExitError. If c.Stderr was nil, Output populates ExitError.Stderr. 

#### <a id="Cmd.Run" href="#Cmd.Run">func (c *Cmd) Run() error</a>

```
searchKey: exec.Cmd.Run
tags: [function]
```

```Go
func (c *Cmd) Run() error
```

Run starts the specified command and waits for it to complete. 

The returned error is nil if the command runs, has no problems copying stdin, stdout, and stderr, and exits with a zero exit status. 

If the command starts but does not complete successfully, the error is of type *ExitError. Other error types may be returned for other situations. 

If the calling goroutine has locked the operating system thread with runtime.LockOSThread and modified any inheritable OS-level thread state (for example, Linux or Plan 9 name spaces), the new process will inherit the caller's thread state. 

#### <a id="Cmd.Start" href="#Cmd.Start">func (c *Cmd) Start() error</a>

```
searchKey: exec.Cmd.Start
tags: [function]
```

```Go
func (c *Cmd) Start() error
```

Start starts the specified command but does not wait for it to complete. 

If Start returns successfully, the c.Process field will be set. 

The Wait method will return the exit code and release associated resources once the command exits. 

#### <a id="Cmd.StderrPipe" href="#Cmd.StderrPipe">func (c *Cmd) StderrPipe() (io.ReadCloser, error)</a>

```
searchKey: exec.Cmd.StderrPipe
tags: [function]
```

```Go
func (c *Cmd) StderrPipe() (io.ReadCloser, error)
```

StderrPipe returns a pipe that will be connected to the command's standard error when the command starts. 

Wait will close the pipe after seeing the command exit, so most callers need not close the pipe themselves. It is thus incorrect to call Wait before all reads from the pipe have completed. For the same reason, it is incorrect to use Run when using StderrPipe. See the StdoutPipe example for idiomatic usage. 

#### <a id="Cmd.StdinPipe" href="#Cmd.StdinPipe">func (c *Cmd) StdinPipe() (io.WriteCloser, error)</a>

```
searchKey: exec.Cmd.StdinPipe
tags: [function]
```

```Go
func (c *Cmd) StdinPipe() (io.WriteCloser, error)
```

StdinPipe returns a pipe that will be connected to the command's standard input when the command starts. The pipe will be closed automatically after Wait sees the command exit. A caller need only call Close to force the pipe to close sooner. For example, if the command being run will not exit until standard input is closed, the caller must close the pipe. 

#### <a id="Cmd.StdoutPipe" href="#Cmd.StdoutPipe">func (c *Cmd) StdoutPipe() (io.ReadCloser, error)</a>

```
searchKey: exec.Cmd.StdoutPipe
tags: [function]
```

```Go
func (c *Cmd) StdoutPipe() (io.ReadCloser, error)
```

StdoutPipe returns a pipe that will be connected to the command's standard output when the command starts. 

Wait will close the pipe after seeing the command exit, so most callers need not close the pipe themselves. It is thus incorrect to call Wait before all reads from the pipe have completed. For the same reason, it is incorrect to call Run when using StdoutPipe. See the example for idiomatic usage. 

#### <a id="Cmd.String" href="#Cmd.String">func (c *Cmd) String() string</a>

```
searchKey: exec.Cmd.String
tags: [function]
```

```Go
func (c *Cmd) String() string
```

String returns a human-readable description of c. It is intended only for debugging. In particular, it is not suitable for use as input to a shell. The output of String may vary across Go releases. 

#### <a id="Cmd.Wait" href="#Cmd.Wait">func (c *Cmd) Wait() error</a>

```
searchKey: exec.Cmd.Wait
tags: [function]
```

```Go
func (c *Cmd) Wait() error
```

Wait waits for the command to exit and waits for any copying to stdin or copying from stdout or stderr to complete. 

The command must have been started by Start. 

The returned error is nil if the command runs, has no problems copying stdin, stdout, and stderr, and exits with a zero exit status. 

If the command fails to run or doesn't complete successfully, the error is of type *ExitError. Other error types may be returned for I/O problems. 

If any of c.Stdin, c.Stdout or c.Stderr are not an *os.File, Wait also waits for the respective I/O loop copying to or from the process to complete. 

Wait releases any resources associated with the Cmd. 

#### <a id="Cmd.argv" href="#Cmd.argv">func (c *Cmd) argv() []string</a>

```
searchKey: exec.Cmd.argv
tags: [function private]
```

```Go
func (c *Cmd) argv() []string
```

#### <a id="Cmd.closeDescriptors" href="#Cmd.closeDescriptors">func (c *Cmd) closeDescriptors(closers []io.Closer)</a>

```
searchKey: exec.Cmd.closeDescriptors
tags: [method private]
```

```Go
func (c *Cmd) closeDescriptors(closers []io.Closer)
```

#### <a id="Cmd.envv" href="#Cmd.envv">func (c *Cmd) envv() ([]string, error)</a>

```
searchKey: exec.Cmd.envv
tags: [function private]
```

```Go
func (c *Cmd) envv() ([]string, error)
```

#### <a id="Cmd.stderr" href="#Cmd.stderr">func (c *Cmd) stderr() (f *os.File, err error)</a>

```
searchKey: exec.Cmd.stderr
tags: [function private]
```

```Go
func (c *Cmd) stderr() (f *os.File, err error)
```

#### <a id="Cmd.stdin" href="#Cmd.stdin">func (c *Cmd) stdin() (f *os.File, err error)</a>

```
searchKey: exec.Cmd.stdin
tags: [function private]
```

```Go
func (c *Cmd) stdin() (f *os.File, err error)
```

#### <a id="Cmd.stdout" href="#Cmd.stdout">func (c *Cmd) stdout() (f *os.File, err error)</a>

```
searchKey: exec.Cmd.stdout
tags: [function private]
```

```Go
func (c *Cmd) stdout() (f *os.File, err error)
```

#### <a id="Cmd.writerDescriptor" href="#Cmd.writerDescriptor">func (c *Cmd) writerDescriptor(w io.Writer) (f *os.File, err error)</a>

```
searchKey: exec.Cmd.writerDescriptor
tags: [method private]
```

```Go
func (c *Cmd) writerDescriptor(w io.Writer) (f *os.File, err error)
```

### <a id="Error" href="#Error">type Error struct</a>

```
searchKey: exec.Error
tags: [struct]
```

```Go
type Error struct {
	// Name is the file name for which the error occurred.
	Name string
	// Err is the underlying error.
	Err error
}
```

Error is returned by LookPath when it fails to classify a file as an executable. 

#### <a id="Error.Error" href="#Error.Error">func (e *Error) Error() string</a>

```
searchKey: exec.Error.Error
tags: [function]
```

```Go
func (e *Error) Error() string
```

#### <a id="Error.Unwrap" href="#Error.Unwrap">func (e *Error) Unwrap() error</a>

```
searchKey: exec.Error.Unwrap
tags: [function]
```

```Go
func (e *Error) Unwrap() error
```

### <a id="ExitError" href="#ExitError">type ExitError struct</a>

```
searchKey: exec.ExitError
tags: [struct]
```

```Go
type ExitError struct {
	*os.ProcessState

	// Stderr holds a subset of the standard error output from the
	// Cmd.Output method if standard error was not otherwise being
	// collected.
	//
	// If the error output is long, Stderr may contain only a prefix
	// and suffix of the output, with the middle replaced with
	// text about the number of omitted bytes.
	//
	// Stderr is provided for debugging, for inclusion in error messages.
	// Users with other needs should redirect Cmd.Stderr as needed.
	Stderr []byte
}
```

An ExitError reports an unsuccessful exit by a command. 

#### <a id="ExitError.Error" href="#ExitError.Error">func (e *ExitError) Error() string</a>

```
searchKey: exec.ExitError.Error
tags: [function]
```

```Go
func (e *ExitError) Error() string
```

### <a id="closeOnce" href="#closeOnce">type closeOnce struct</a>

```
searchKey: exec.closeOnce
tags: [struct private]
```

```Go
type closeOnce struct {
	*os.File

	once sync.Once
	err  error
}
```

#### <a id="closeOnce.Close" href="#closeOnce.Close">func (c *closeOnce) Close() error</a>

```
searchKey: exec.closeOnce.Close
tags: [function private]
```

```Go
func (c *closeOnce) Close() error
```

#### <a id="closeOnce.close" href="#closeOnce.close">func (c *closeOnce) close()</a>

```
searchKey: exec.closeOnce.close
tags: [function private]
```

```Go
func (c *closeOnce) close()
```

### <a id="prefixSuffixSaver" href="#prefixSuffixSaver">type prefixSuffixSaver struct</a>

```
searchKey: exec.prefixSuffixSaver
tags: [struct private]
```

```Go
type prefixSuffixSaver struct {
	N         int // max size of prefix or suffix
	prefix    []byte
	suffix    []byte // ring buffer once len(suffix) == N
	suffixOff int    // offset to write into suffix
	skipped   int64
}
```

prefixSuffixSaver is an io.Writer which retains the first N bytes and the last N bytes written to it. The Bytes() methods reconstructs it with a pretty error message. 

#### <a id="prefixSuffixSaver.Bytes" href="#prefixSuffixSaver.Bytes">func (w *prefixSuffixSaver) Bytes() []byte</a>

```
searchKey: exec.prefixSuffixSaver.Bytes
tags: [function private]
```

```Go
func (w *prefixSuffixSaver) Bytes() []byte
```

#### <a id="prefixSuffixSaver.Write" href="#prefixSuffixSaver.Write">func (w *prefixSuffixSaver) Write(p []byte) (n int, err error)</a>

```
searchKey: exec.prefixSuffixSaver.Write
tags: [method private]
```

```Go
func (w *prefixSuffixSaver) Write(p []byte) (n int, err error)
```

#### <a id="prefixSuffixSaver.fill" href="#prefixSuffixSaver.fill">func (w *prefixSuffixSaver) fill(dst *[]byte, p []byte) (pRemain []byte)</a>

```
searchKey: exec.prefixSuffixSaver.fill
tags: [method private]
```

```Go
func (w *prefixSuffixSaver) fill(dst *[]byte, p []byte) (pRemain []byte)
```

fill appends up to len(p) bytes of p to *dst, such that *dst does not grow larger than w.N. It returns the un-appended suffix of p. 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkExecHostname" href="#BenchmarkExecHostname">func BenchmarkExecHostname(b *testing.B)</a>

```
searchKey: exec.BenchmarkExecHostname
tags: [method private benchmark]
```

```Go
func BenchmarkExecHostname(b *testing.B)
```

### <a id="LookPath" href="#LookPath">func LookPath(file string) (string, error)</a>

```
searchKey: exec.LookPath
tags: [method]
```

```Go
func LookPath(file string) (string, error)
```

LookPath searches for an executable named file in the directories named by the PATH environment variable. If file contains a slash, it is tried directly and the PATH is not consulted. The result may be an absolute path or a path relative to the current directory. 

### <a id="TestDedupEnv" href="#TestDedupEnv">func TestDedupEnv(t *testing.T)</a>

```
searchKey: exec.TestDedupEnv
tags: [method private test]
```

```Go
func TestDedupEnv(t *testing.T)
```

### <a id="TestLookPathNotFound" href="#TestLookPathNotFound">func TestLookPathNotFound(t *testing.T)</a>

```
searchKey: exec.TestLookPathNotFound
tags: [method private test]
```

```Go
func TestLookPathNotFound(t *testing.T)
```

### <a id="TestLookPathUnixEmptyPath" href="#TestLookPathUnixEmptyPath">func TestLookPathUnixEmptyPath(t *testing.T)</a>

```
searchKey: exec.TestLookPathUnixEmptyPath
tags: [method private test]
```

```Go
func TestLookPathUnixEmptyPath(t *testing.T)
```

### <a id="TestPrefixSuffixSaver" href="#TestPrefixSuffixSaver">func TestPrefixSuffixSaver(t *testing.T)</a>

```
searchKey: exec.TestPrefixSuffixSaver
tags: [method private test]
```

```Go
func TestPrefixSuffixSaver(t *testing.T)
```

### <a id="addCriticalEnv" href="#addCriticalEnv">func addCriticalEnv(env []string) []string</a>

```
searchKey: exec.addCriticalEnv
tags: [method private]
```

```Go
func addCriticalEnv(env []string) []string
```

addCriticalEnv adds any critical environment variables that are required (or at least almost always required) on the operating system. Currently this is only used for Windows. 

### <a id="dedupEnv" href="#dedupEnv">func dedupEnv(env []string) []string</a>

```
searchKey: exec.dedupEnv
tags: [method private]
```

```Go
func dedupEnv(env []string) []string
```

dedupEnv returns a copy of env with any duplicates removed, in favor of later values. Items not of the normal environment "key=value" form are preserved unchanged. 

### <a id="dedupEnvCase" href="#dedupEnvCase">func dedupEnvCase(caseInsensitive bool, env []string) []string</a>

```
searchKey: exec.dedupEnvCase
tags: [method private]
```

```Go
func dedupEnvCase(caseInsensitive bool, env []string) []string
```

dedupEnvCase is dedupEnv with a case option for testing. If caseInsensitive is true, the case of keys is ignored. 

### <a id="findExecutable" href="#findExecutable">func findExecutable(file string) error</a>

```
searchKey: exec.findExecutable
tags: [method private]
```

```Go
func findExecutable(file string) error
```

### <a id="init.exec_unix.go" href="#init.exec_unix.go">func init()</a>

```
searchKey: exec.init
tags: [function private]
```

```Go
func init()
```

### <a id="interfaceEqual" href="#interfaceEqual">func interfaceEqual(a, b interface{}) bool</a>

```
searchKey: exec.interfaceEqual
tags: [method private]
```

```Go
func interfaceEqual(a, b interface{}) bool
```

interfaceEqual protects against panics from doing equality tests on two interfaces with non-comparable underlying types. 

### <a id="lookExtensions" href="#lookExtensions">func lookExtensions(path, dir string) (string, error)</a>

```
searchKey: exec.lookExtensions
tags: [method private]
```

```Go
func lookExtensions(path, dir string) (string, error)
```

lookExtensions finds windows executable by its dir and path. It uses LookPath to try appropriate extensions. lookExtensions does not search PATH, instead it converts `prog` into `.\prog`. 

### <a id="minInt" href="#minInt">func minInt(a, b int) int</a>

```
searchKey: exec.minInt
tags: [method private]
```

```Go
func minInt(a, b int) int
```

