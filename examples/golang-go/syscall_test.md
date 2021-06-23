# Package syscall_test

## Index

* [Constants](#const)
    * [const MNT_WAIT](#MNT_WAIT)
    * [const MNT_NOWAIT](#MNT_NOWAIT)
* [Types](#type)
    * [type command struct](#command)
        * [func create(t *testing.T) *command](#create)
        * [func (c *command) Info() (pid, pgrp int)](#command.Info)
        * [func (c *command) Start()](#command.Start)
        * [func (c *command) Stop()](#command.Stop)
* [Functions](#func)
    * [func TestDirent(t *testing.T)](#TestDirent)
    * [func TestDirentRepeat(t *testing.T)](#TestDirentRepeat)
    * [func parent() (pid, pgrp int)](#parent)
    * [func TestZeroSysProcAttr(t *testing.T)](#TestZeroSysProcAttr)
    * [func TestSetpgid(t *testing.T)](#TestSetpgid)
    * [func TestPgid(t *testing.T)](#TestPgid)
    * [func TestForeground(t *testing.T)](#TestForeground)
    * [func TestForegroundSignal(t *testing.T)](#TestForegroundSignal)
    * [func TestInvalidExec(t *testing.T)](#TestInvalidExec)
    * [func TestExec(t *testing.T)](#TestExec)
    * [func TestExecHelper(t *testing.T)](#TestExecHelper)
    * [func TestGetdirentries(t *testing.T)](#TestGetdirentries)
    * [func testGetdirentries(t *testing.T, count int)](#testGetdirentries)
    * [func TestMmap(t *testing.T)](#TestMmap)
    * [func TestGetfsstat(t *testing.T)](#TestGetfsstat)
    * [func TestExecPtrace(t *testing.T)](#TestExecPtrace)
    * [func testSetGetenv(t *testing.T, key, value string)](#testSetGetenv)
    * [func TestEnv(t *testing.T)](#TestEnv)
    * [func TestExecErrPermutedFds(t *testing.T)](#TestExecErrPermutedFds)
    * [func TestGettimeofday(t *testing.T)](#TestGettimeofday)
    * [func TestFcntlFlock(t *testing.T)](#TestFcntlFlock)
    * [func TestPassFD(t *testing.T)](#TestPassFD)
    * [func passFDChild()](#passFDChild)
    * [func TestUnixRightsRoundtrip(t *testing.T)](#TestUnixRightsRoundtrip)
    * [func TestRlimit(t *testing.T)](#TestRlimit)
    * [func TestSeekFailure(t *testing.T)](#TestSeekFailure)
    * [func TestSetsockoptString(t *testing.T)](#TestSetsockoptString)
    * [func TestENFILETemporary(t *testing.T)](#TestENFILETemporary)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="MNT_WAIT" href="#MNT_WAIT">const MNT_WAIT</a>

```
searchKey: syscall_test.MNT_WAIT
tags: [private]
```

```Go
const MNT_WAIT = 1
```

### <a id="MNT_NOWAIT" href="#MNT_NOWAIT">const MNT_NOWAIT</a>

```
searchKey: syscall_test.MNT_NOWAIT
tags: [private]
```

```Go
const MNT_NOWAIT = 2
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="command" href="#command">type command struct</a>

```
searchKey: syscall_test.command
tags: [private]
```

```Go
type command struct {
	pipe io.WriteCloser
	proc *exec.Cmd
	test *testing.T
}
```

#### <a id="create" href="#create">func create(t *testing.T) *command</a>

```
searchKey: syscall_test.create
tags: [private]
```

```Go
func create(t *testing.T) *command
```

#### <a id="command.Info" href="#command.Info">func (c *command) Info() (pid, pgrp int)</a>

```
searchKey: syscall_test.command.Info
tags: [private]
```

```Go
func (c *command) Info() (pid, pgrp int)
```

#### <a id="command.Start" href="#command.Start">func (c *command) Start()</a>

```
searchKey: syscall_test.command.Start
tags: [private]
```

```Go
func (c *command) Start()
```

#### <a id="command.Stop" href="#command.Stop">func (c *command) Stop()</a>

```
searchKey: syscall_test.command.Stop
tags: [private]
```

```Go
func (c *command) Stop()
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestDirent" href="#TestDirent">func TestDirent(t *testing.T)</a>

```
searchKey: syscall_test.TestDirent
tags: [private]
```

```Go
func TestDirent(t *testing.T)
```

### <a id="TestDirentRepeat" href="#TestDirentRepeat">func TestDirentRepeat(t *testing.T)</a>

```
searchKey: syscall_test.TestDirentRepeat
tags: [private]
```

```Go
func TestDirentRepeat(t *testing.T)
```

### <a id="parent" href="#parent">func parent() (pid, pgrp int)</a>

```
searchKey: syscall_test.parent
tags: [private]
```

```Go
func parent() (pid, pgrp int)
```

### <a id="TestZeroSysProcAttr" href="#TestZeroSysProcAttr">func TestZeroSysProcAttr(t *testing.T)</a>

```
searchKey: syscall_test.TestZeroSysProcAttr
tags: [private]
```

```Go
func TestZeroSysProcAttr(t *testing.T)
```

### <a id="TestSetpgid" href="#TestSetpgid">func TestSetpgid(t *testing.T)</a>

```
searchKey: syscall_test.TestSetpgid
tags: [private]
```

```Go
func TestSetpgid(t *testing.T)
```

### <a id="TestPgid" href="#TestPgid">func TestPgid(t *testing.T)</a>

```
searchKey: syscall_test.TestPgid
tags: [private]
```

```Go
func TestPgid(t *testing.T)
```

### <a id="TestForeground" href="#TestForeground">func TestForeground(t *testing.T)</a>

```
searchKey: syscall_test.TestForeground
tags: [private]
```

```Go
func TestForeground(t *testing.T)
```

### <a id="TestForegroundSignal" href="#TestForegroundSignal">func TestForegroundSignal(t *testing.T)</a>

```
searchKey: syscall_test.TestForegroundSignal
tags: [private]
```

```Go
func TestForegroundSignal(t *testing.T)
```

### <a id="TestInvalidExec" href="#TestInvalidExec">func TestInvalidExec(t *testing.T)</a>

```
searchKey: syscall_test.TestInvalidExec
tags: [private]
```

```Go
func TestInvalidExec(t *testing.T)
```

Test a couple of cases that SysProcAttr can't handle. Issue 29458. 

### <a id="TestExec" href="#TestExec">func TestExec(t *testing.T)</a>

```
searchKey: syscall_test.TestExec
tags: [private]
```

```Go
func TestExec(t *testing.T)
```

TestExec is for issue #41702. 

### <a id="TestExecHelper" href="#TestExecHelper">func TestExecHelper(t *testing.T)</a>

```
searchKey: syscall_test.TestExecHelper
tags: [private]
```

```Go
func TestExecHelper(t *testing.T)
```

TestExecHelper is used by TestExec. It does nothing by itself. In testing on macOS 10.14, this used to fail with "signal: illegal instruction" more than half the time. 

### <a id="TestGetdirentries" href="#TestGetdirentries">func TestGetdirentries(t *testing.T)</a>

```
searchKey: syscall_test.TestGetdirentries
tags: [private]
```

```Go
func TestGetdirentries(t *testing.T)
```

### <a id="testGetdirentries" href="#testGetdirentries">func testGetdirentries(t *testing.T, count int)</a>

```
searchKey: syscall_test.testGetdirentries
tags: [private]
```

```Go
func testGetdirentries(t *testing.T, count int)
```

### <a id="TestMmap" href="#TestMmap">func TestMmap(t *testing.T)</a>

```
searchKey: syscall_test.TestMmap
tags: [private]
```

```Go
func TestMmap(t *testing.T)
```

### <a id="TestGetfsstat" href="#TestGetfsstat">func TestGetfsstat(t *testing.T)</a>

```
searchKey: syscall_test.TestGetfsstat
tags: [private]
```

```Go
func TestGetfsstat(t *testing.T)
```

### <a id="TestExecPtrace" href="#TestExecPtrace">func TestExecPtrace(t *testing.T)</a>

```
searchKey: syscall_test.TestExecPtrace
tags: [private]
```

```Go
func TestExecPtrace(t *testing.T)
```

### <a id="testSetGetenv" href="#testSetGetenv">func testSetGetenv(t *testing.T, key, value string)</a>

```
searchKey: syscall_test.testSetGetenv
tags: [private]
```

```Go
func testSetGetenv(t *testing.T, key, value string)
```

### <a id="TestEnv" href="#TestEnv">func TestEnv(t *testing.T)</a>

```
searchKey: syscall_test.TestEnv
tags: [private]
```

```Go
func TestEnv(t *testing.T)
```

### <a id="TestExecErrPermutedFds" href="#TestExecErrPermutedFds">func TestExecErrPermutedFds(t *testing.T)</a>

```
searchKey: syscall_test.TestExecErrPermutedFds
tags: [private]
```

```Go
func TestExecErrPermutedFds(t *testing.T)
```

Check that permuting child process fds doesn't interfere with reporting of fork/exec status. See Issue 14979. 

### <a id="TestGettimeofday" href="#TestGettimeofday">func TestGettimeofday(t *testing.T)</a>

```
searchKey: syscall_test.TestGettimeofday
tags: [private]
```

```Go
func TestGettimeofday(t *testing.T)
```

### <a id="TestFcntlFlock" href="#TestFcntlFlock">func TestFcntlFlock(t *testing.T)</a>

```
searchKey: syscall_test.TestFcntlFlock
tags: [private]
```

```Go
func TestFcntlFlock(t *testing.T)
```

TestFcntlFlock tests whether the file locking structure matches the calling convention of each kernel. On some Linux systems, glibc uses another set of values for the commands and translates them to the correct value that the kernel expects just before the actual fcntl syscall. As Go uses raw syscalls directly, it must use the real value, not the glibc value. Thus this test also verifies that the Flock_t structure can be roundtripped with F_SETLK and F_GETLK. 

### <a id="TestPassFD" href="#TestPassFD">func TestPassFD(t *testing.T)</a>

```
searchKey: syscall_test.TestPassFD
tags: [private]
```

```Go
func TestPassFD(t *testing.T)
```

TestPassFD tests passing a file descriptor over a Unix socket. 

This test involved both a parent and child process. The parent process is invoked as a normal test, with "go test", which then runs the child process by running the current test binary with args "-test.run=^TestPassFD$" and an environment variable used to signal that the test should become the child process instead. 

### <a id="passFDChild" href="#passFDChild">func passFDChild()</a>

```
searchKey: syscall_test.passFDChild
tags: [private]
```

```Go
func passFDChild()
```

passFDChild is the child process used by TestPassFD. 

### <a id="TestUnixRightsRoundtrip" href="#TestUnixRightsRoundtrip">func TestUnixRightsRoundtrip(t *testing.T)</a>

```
searchKey: syscall_test.TestUnixRightsRoundtrip
tags: [private]
```

```Go
func TestUnixRightsRoundtrip(t *testing.T)
```

TestUnixRightsRoundtrip tests that UnixRights, ParseSocketControlMessage, and ParseUnixRights are able to successfully round-trip lists of file descriptors. 

### <a id="TestRlimit" href="#TestRlimit">func TestRlimit(t *testing.T)</a>

```
searchKey: syscall_test.TestRlimit
tags: [private]
```

```Go
func TestRlimit(t *testing.T)
```

### <a id="TestSeekFailure" href="#TestSeekFailure">func TestSeekFailure(t *testing.T)</a>

```
searchKey: syscall_test.TestSeekFailure
tags: [private]
```

```Go
func TestSeekFailure(t *testing.T)
```

### <a id="TestSetsockoptString" href="#TestSetsockoptString">func TestSetsockoptString(t *testing.T)</a>

```
searchKey: syscall_test.TestSetsockoptString
tags: [private]
```

```Go
func TestSetsockoptString(t *testing.T)
```

### <a id="TestENFILETemporary" href="#TestENFILETemporary">func TestENFILETemporary(t *testing.T)</a>

```
searchKey: syscall_test.TestENFILETemporary
tags: [private]
```

```Go
func TestENFILETemporary(t *testing.T)
```

