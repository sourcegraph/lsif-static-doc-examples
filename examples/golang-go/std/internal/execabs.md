# Package execabs

Package execabs is a drop-in replacement for os/exec that requires PATH lookups to find absolute paths. That is, execabs.Command("cmd") runs the same PATH lookup as exec.Command("cmd"), but if the result is a path which is relative, the Run and Start methods will report an error instead of running the executable. 

## Index

* [Variables](#var)
    * [var ErrNotFound](#ErrNotFound)
* [Types](#type)
    * [type Cmd exec.Cmd](#Cmd)
        * [func CommandContext(ctx context.Context, name string, arg ...string) *exec.Cmd](#CommandContext)
        * [func Command(name string, arg ...string) *exec.Cmd](#Command)
    * [type Error exec.Error](#Error)
    * [type ExitError exec.ExitError](#ExitError)
* [Functions](#func)
    * [func relError(file, path string) error](#relError)
    * [func LookPath(file string) (string, error)](#LookPath)
    * [func fixCmd(name string, cmd *exec.Cmd)](#fixCmd)
    * [func TestFixCmd(t *testing.T)](#TestFixCmd)
    * [func TestCommand(t *testing.T)](#TestCommand)
    * [func TestLookPath(t *testing.T)](#TestLookPath)


## <a id="var" href="#var">Variables</a>

### <a id="ErrNotFound" href="#ErrNotFound">var ErrNotFound</a>

```
searchKey: execabs.ErrNotFound
tags: [exported]
```

```Go
var ErrNotFound = exec.ErrNotFound
```

## <a id="type" href="#type">Types</a>

### <a id="Cmd" href="#Cmd">type Cmd exec.Cmd</a>

```
searchKey: execabs.Cmd
tags: [exported]
```

```Go
type Cmd = exec.Cmd
```

#### <a id="CommandContext" href="#CommandContext">func CommandContext(ctx context.Context, name string, arg ...string) *exec.Cmd</a>

```
searchKey: execabs.CommandContext
tags: [exported]
```

```Go
func CommandContext(ctx context.Context, name string, arg ...string) *exec.Cmd
```

#### <a id="Command" href="#Command">func Command(name string, arg ...string) *exec.Cmd</a>

```
searchKey: execabs.Command
tags: [exported]
```

```Go
func Command(name string, arg ...string) *exec.Cmd
```

### <a id="Error" href="#Error">type Error exec.Error</a>

```
searchKey: execabs.Error
tags: [exported]
```

```Go
type Error = exec.Error
```

### <a id="ExitError" href="#ExitError">type ExitError exec.ExitError</a>

```
searchKey: execabs.ExitError
tags: [exported]
```

```Go
type ExitError = exec.ExitError
```

## <a id="func" href="#func">Functions</a>

### <a id="relError" href="#relError">func relError(file, path string) error</a>

```
searchKey: execabs.relError
```

```Go
func relError(file, path string) error
```

### <a id="LookPath" href="#LookPath">func LookPath(file string) (string, error)</a>

```
searchKey: execabs.LookPath
tags: [exported]
```

```Go
func LookPath(file string) (string, error)
```

### <a id="fixCmd" href="#fixCmd">func fixCmd(name string, cmd *exec.Cmd)</a>

```
searchKey: execabs.fixCmd
```

```Go
func fixCmd(name string, cmd *exec.Cmd)
```

### <a id="TestFixCmd" href="#TestFixCmd">func TestFixCmd(t *testing.T)</a>

```
searchKey: execabs.TestFixCmd
```

```Go
func TestFixCmd(t *testing.T)
```

### <a id="TestCommand" href="#TestCommand">func TestCommand(t *testing.T)</a>

```
searchKey: execabs.TestCommand
```

```Go
func TestCommand(t *testing.T)
```

### <a id="TestLookPath" href="#TestLookPath">func TestLookPath(t *testing.T)</a>

```
searchKey: execabs.TestLookPath
```

```Go
func TestLookPath(t *testing.T)
```

