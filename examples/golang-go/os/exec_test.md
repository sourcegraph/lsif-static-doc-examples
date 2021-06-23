# Package exec_test

## Index

* [Constants](#const)
    * [const stdinCloseTestString](#stdinCloseTestString)
* [Variables](#var)
    * [var haveUnexpectedFDs](#haveUnexpectedFDs)
    * [var unfinalizedFiles](#unfinalizedFiles)
* [Types](#type)
    * [type delayedInfiniteReader struct{}](#delayedInfiniteReader)
        * [func (delayedInfiniteReader) Read(b []byte) (int, error)](#delayedInfiniteReader.Read)
    * [type badWriter struct{}](#badWriter)
        * [func (w *badWriter) Write(data []byte) (int, error)](#badWriter.Write)
* [Functions](#func)
    * [func ExampleLookPath()](#ExampleLookPath)
    * [func ExampleCommand()](#ExampleCommand)
    * [func ExampleCommand_environment()](#ExampleCommand_environment)
    * [func ExampleCmd_Output()](#ExampleCmd_Output)
    * [func ExampleCmd_Run()](#ExampleCmd_Run)
    * [func ExampleCmd_Start()](#ExampleCmd_Start)
    * [func ExampleCmd_StdoutPipe()](#ExampleCmd_StdoutPipe)
    * [func ExampleCmd_StdinPipe()](#ExampleCmd_StdinPipe)
    * [func ExampleCmd_StderrPipe()](#ExampleCmd_StderrPipe)
    * [func ExampleCmd_CombinedOutput()](#ExampleCmd_CombinedOutput)
    * [func ExampleCommandContext()](#ExampleCommandContext)
    * [func TestCredentialNoSetGroups(t *testing.T)](#TestCredentialNoSetGroups)
    * [func TestWaitid(t *testing.T)](#TestWaitid)
    * [func init()](#init.exec_test.go)
    * [func helperCommandContext(t *testing.T, ctx context.Context, s ...string) (cmd *exec.Cmd)](#helperCommandContext)
    * [func helperCommand(t *testing.T, s ...string) *exec.Cmd](#helperCommand)
    * [func TestEcho(t *testing.T)](#TestEcho)
    * [func TestCommandRelativeName(t *testing.T)](#TestCommandRelativeName)
    * [func TestCatStdin(t *testing.T)](#TestCatStdin)
    * [func TestEchoFileRace(t *testing.T)](#TestEchoFileRace)
    * [func TestCatGoodAndBadFile(t *testing.T)](#TestCatGoodAndBadFile)
    * [func TestNoExistExecutable(t *testing.T)](#TestNoExistExecutable)
    * [func TestExitStatus(t *testing.T)](#TestExitStatus)
    * [func TestExitCode(t *testing.T)](#TestExitCode)
    * [func TestPipes(t *testing.T)](#TestPipes)
    * [func TestStdinClose(t *testing.T)](#TestStdinClose)
    * [func TestStdinCloseRace(t *testing.T)](#TestStdinCloseRace)
    * [func TestPipeLookPathLeak(t *testing.T)](#TestPipeLookPathLeak)
    * [func numOpenFDsAndroid(t *testing.T) (n int, lsof []byte)](#numOpenFDsAndroid)
    * [func TestExtraFilesFDShuffle(t *testing.T)](#TestExtraFilesFDShuffle)
    * [func TestExtraFiles(t *testing.T)](#TestExtraFiles)
    * [func TestExtraFilesRace(t *testing.T)](#TestExtraFilesRace)
    * [func TestHelperProcess(*testing.T)](#TestHelperProcess)
    * [func TestIgnorePipeErrorOnSuccess(t *testing.T)](#TestIgnorePipeErrorOnSuccess)
    * [func TestClosePipeOnCopyError(t *testing.T)](#TestClosePipeOnCopyError)
    * [func TestOutputStderrCapture(t *testing.T)](#TestOutputStderrCapture)
    * [func TestContext(t *testing.T)](#TestContext)
    * [func TestContextCancel(t *testing.T)](#TestContextCancel)
    * [func TestDedupEnvEcho(t *testing.T)](#TestDedupEnvEcho)
    * [func TestString(t *testing.T)](#TestString)
    * [func TestStringPathNotResolved(t *testing.T)](#TestStringPathNotResolved)
    * [func TestChildCriticalEnv(t *testing.T)](#TestChildCriticalEnv)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="stdinCloseTestString" href="#stdinCloseTestString">const stdinCloseTestString</a>

```
searchKey: exec_test.stdinCloseTestString
tags: [private]
```

```Go
const stdinCloseTestString = "Some test string."
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="haveUnexpectedFDs" href="#haveUnexpectedFDs">var haveUnexpectedFDs</a>

```
searchKey: exec_test.haveUnexpectedFDs
tags: [private]
```

```Go
var haveUnexpectedFDs bool
```

haveUnexpectedFDs is set at init time to report whether any file descriptors were open at program start. 

### <a id="unfinalizedFiles" href="#unfinalizedFiles">var unfinalizedFiles</a>

```
searchKey: exec_test.unfinalizedFiles
tags: [private]
```

```Go
var unfinalizedFiles []*os.File
```

unfinalizedFiles holds files that should not be finalized, because that would close the associated file descriptor, which we don't want to do. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="delayedInfiniteReader" href="#delayedInfiniteReader">type delayedInfiniteReader struct{}</a>

```
searchKey: exec_test.delayedInfiniteReader
tags: [private]
```

```Go
type delayedInfiniteReader struct{}
```

#### <a id="delayedInfiniteReader.Read" href="#delayedInfiniteReader.Read">func (delayedInfiniteReader) Read(b []byte) (int, error)</a>

```
searchKey: exec_test.delayedInfiniteReader.Read
tags: [private]
```

```Go
func (delayedInfiniteReader) Read(b []byte) (int, error)
```

### <a id="badWriter" href="#badWriter">type badWriter struct{}</a>

```
searchKey: exec_test.badWriter
tags: [private]
```

```Go
type badWriter struct{}
```

#### <a id="badWriter.Write" href="#badWriter.Write">func (w *badWriter) Write(data []byte) (int, error)</a>

```
searchKey: exec_test.badWriter.Write
tags: [private]
```

```Go
func (w *badWriter) Write(data []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleLookPath" href="#ExampleLookPath">func ExampleLookPath()</a>

```
searchKey: exec_test.ExampleLookPath
tags: [private]
```

```Go
func ExampleLookPath()
```

### <a id="ExampleCommand" href="#ExampleCommand">func ExampleCommand()</a>

```
searchKey: exec_test.ExampleCommand
tags: [private]
```

```Go
func ExampleCommand()
```

### <a id="ExampleCommand_environment" href="#ExampleCommand_environment">func ExampleCommand_environment()</a>

```
searchKey: exec_test.ExampleCommand_environment
tags: [private]
```

```Go
func ExampleCommand_environment()
```

### <a id="ExampleCmd_Output" href="#ExampleCmd_Output">func ExampleCmd_Output()</a>

```
searchKey: exec_test.ExampleCmd_Output
tags: [private]
```

```Go
func ExampleCmd_Output()
```

### <a id="ExampleCmd_Run" href="#ExampleCmd_Run">func ExampleCmd_Run()</a>

```
searchKey: exec_test.ExampleCmd_Run
tags: [private]
```

```Go
func ExampleCmd_Run()
```

### <a id="ExampleCmd_Start" href="#ExampleCmd_Start">func ExampleCmd_Start()</a>

```
searchKey: exec_test.ExampleCmd_Start
tags: [private]
```

```Go
func ExampleCmd_Start()
```

### <a id="ExampleCmd_StdoutPipe" href="#ExampleCmd_StdoutPipe">func ExampleCmd_StdoutPipe()</a>

```
searchKey: exec_test.ExampleCmd_StdoutPipe
tags: [private]
```

```Go
func ExampleCmd_StdoutPipe()
```

### <a id="ExampleCmd_StdinPipe" href="#ExampleCmd_StdinPipe">func ExampleCmd_StdinPipe()</a>

```
searchKey: exec_test.ExampleCmd_StdinPipe
tags: [private]
```

```Go
func ExampleCmd_StdinPipe()
```

### <a id="ExampleCmd_StderrPipe" href="#ExampleCmd_StderrPipe">func ExampleCmd_StderrPipe()</a>

```
searchKey: exec_test.ExampleCmd_StderrPipe
tags: [private]
```

```Go
func ExampleCmd_StderrPipe()
```

### <a id="ExampleCmd_CombinedOutput" href="#ExampleCmd_CombinedOutput">func ExampleCmd_CombinedOutput()</a>

```
searchKey: exec_test.ExampleCmd_CombinedOutput
tags: [private]
```

```Go
func ExampleCmd_CombinedOutput()
```

### <a id="ExampleCommandContext" href="#ExampleCommandContext">func ExampleCommandContext()</a>

```
searchKey: exec_test.ExampleCommandContext
tags: [private]
```

```Go
func ExampleCommandContext()
```

### <a id="TestCredentialNoSetGroups" href="#TestCredentialNoSetGroups">func TestCredentialNoSetGroups(t *testing.T)</a>

```
searchKey: exec_test.TestCredentialNoSetGroups
tags: [private]
```

```Go
func TestCredentialNoSetGroups(t *testing.T)
```

### <a id="TestWaitid" href="#TestWaitid">func TestWaitid(t *testing.T)</a>

```
searchKey: exec_test.TestWaitid
tags: [private]
```

```Go
func TestWaitid(t *testing.T)
```

For issue #19314: make sure that SIGSTOP does not cause the process to appear done. 

### <a id="init.exec_test.go" href="#init.exec_test.go">func init()</a>

```
searchKey: exec_test.init
tags: [private]
```

```Go
func init()
```

### <a id="helperCommandContext" href="#helperCommandContext">func helperCommandContext(t *testing.T, ctx context.Context, s ...string) (cmd *exec.Cmd)</a>

```
searchKey: exec_test.helperCommandContext
tags: [private]
```

```Go
func helperCommandContext(t *testing.T, ctx context.Context, s ...string) (cmd *exec.Cmd)
```

### <a id="helperCommand" href="#helperCommand">func helperCommand(t *testing.T, s ...string) *exec.Cmd</a>

```
searchKey: exec_test.helperCommand
tags: [private]
```

```Go
func helperCommand(t *testing.T, s ...string) *exec.Cmd
```

### <a id="TestEcho" href="#TestEcho">func TestEcho(t *testing.T)</a>

```
searchKey: exec_test.TestEcho
tags: [private]
```

```Go
func TestEcho(t *testing.T)
```

### <a id="TestCommandRelativeName" href="#TestCommandRelativeName">func TestCommandRelativeName(t *testing.T)</a>

```
searchKey: exec_test.TestCommandRelativeName
tags: [private]
```

```Go
func TestCommandRelativeName(t *testing.T)
```

### <a id="TestCatStdin" href="#TestCatStdin">func TestCatStdin(t *testing.T)</a>

```
searchKey: exec_test.TestCatStdin
tags: [private]
```

```Go
func TestCatStdin(t *testing.T)
```

### <a id="TestEchoFileRace" href="#TestEchoFileRace">func TestEchoFileRace(t *testing.T)</a>

```
searchKey: exec_test.TestEchoFileRace
tags: [private]
```

```Go
func TestEchoFileRace(t *testing.T)
```

### <a id="TestCatGoodAndBadFile" href="#TestCatGoodAndBadFile">func TestCatGoodAndBadFile(t *testing.T)</a>

```
searchKey: exec_test.TestCatGoodAndBadFile
tags: [private]
```

```Go
func TestCatGoodAndBadFile(t *testing.T)
```

### <a id="TestNoExistExecutable" href="#TestNoExistExecutable">func TestNoExistExecutable(t *testing.T)</a>

```
searchKey: exec_test.TestNoExistExecutable
tags: [private]
```

```Go
func TestNoExistExecutable(t *testing.T)
```

### <a id="TestExitStatus" href="#TestExitStatus">func TestExitStatus(t *testing.T)</a>

```
searchKey: exec_test.TestExitStatus
tags: [private]
```

```Go
func TestExitStatus(t *testing.T)
```

### <a id="TestExitCode" href="#TestExitCode">func TestExitCode(t *testing.T)</a>

```
searchKey: exec_test.TestExitCode
tags: [private]
```

```Go
func TestExitCode(t *testing.T)
```

### <a id="TestPipes" href="#TestPipes">func TestPipes(t *testing.T)</a>

```
searchKey: exec_test.TestPipes
tags: [private]
```

```Go
func TestPipes(t *testing.T)
```

### <a id="TestStdinClose" href="#TestStdinClose">func TestStdinClose(t *testing.T)</a>

```
searchKey: exec_test.TestStdinClose
tags: [private]
```

```Go
func TestStdinClose(t *testing.T)
```

Issue 6270. 

### <a id="TestStdinCloseRace" href="#TestStdinCloseRace">func TestStdinCloseRace(t *testing.T)</a>

```
searchKey: exec_test.TestStdinCloseRace
tags: [private]
```

```Go
func TestStdinCloseRace(t *testing.T)
```

Issue 17647. It used to be the case that TestStdinClose, above, would fail when run under the race detector. This test is a variant of TestStdinClose that also used to fail when run under the race detector. This test is run by cmd/dist under the race detector to verify that the race detector no longer reports any problems. 

### <a id="TestPipeLookPathLeak" href="#TestPipeLookPathLeak">func TestPipeLookPathLeak(t *testing.T)</a>

```
searchKey: exec_test.TestPipeLookPathLeak
tags: [private]
```

```Go
func TestPipeLookPathLeak(t *testing.T)
```

Issue 5071 

### <a id="numOpenFDsAndroid" href="#numOpenFDsAndroid">func numOpenFDsAndroid(t *testing.T) (n int, lsof []byte)</a>

```
searchKey: exec_test.numOpenFDsAndroid
tags: [private]
```

```Go
func numOpenFDsAndroid(t *testing.T) (n int, lsof []byte)
```

### <a id="TestExtraFilesFDShuffle" href="#TestExtraFilesFDShuffle">func TestExtraFilesFDShuffle(t *testing.T)</a>

```
searchKey: exec_test.TestExtraFilesFDShuffle
tags: [private]
```

```Go
func TestExtraFilesFDShuffle(t *testing.T)
```

### <a id="TestExtraFiles" href="#TestExtraFiles">func TestExtraFiles(t *testing.T)</a>

```
searchKey: exec_test.TestExtraFiles
tags: [private]
```

```Go
func TestExtraFiles(t *testing.T)
```

### <a id="TestExtraFilesRace" href="#TestExtraFilesRace">func TestExtraFilesRace(t *testing.T)</a>

```
searchKey: exec_test.TestExtraFilesRace
tags: [private]
```

```Go
func TestExtraFilesRace(t *testing.T)
```

### <a id="TestHelperProcess" href="#TestHelperProcess">func TestHelperProcess(*testing.T)</a>

```
searchKey: exec_test.TestHelperProcess
tags: [private]
```

```Go
func TestHelperProcess(*testing.T)
```

TestHelperProcess isn't a real test. It's used as a helper process for TestParameterRun. 

### <a id="TestIgnorePipeErrorOnSuccess" href="#TestIgnorePipeErrorOnSuccess">func TestIgnorePipeErrorOnSuccess(t *testing.T)</a>

```
searchKey: exec_test.TestIgnorePipeErrorOnSuccess
tags: [private]
```

```Go
func TestIgnorePipeErrorOnSuccess(t *testing.T)
```

Issue 9173: ignore stdin pipe writes if the program completes successfully. 

### <a id="TestClosePipeOnCopyError" href="#TestClosePipeOnCopyError">func TestClosePipeOnCopyError(t *testing.T)</a>

```
searchKey: exec_test.TestClosePipeOnCopyError
tags: [private]
```

```Go
func TestClosePipeOnCopyError(t *testing.T)
```

### <a id="TestOutputStderrCapture" href="#TestOutputStderrCapture">func TestOutputStderrCapture(t *testing.T)</a>

```
searchKey: exec_test.TestOutputStderrCapture
tags: [private]
```

```Go
func TestOutputStderrCapture(t *testing.T)
```

### <a id="TestContext" href="#TestContext">func TestContext(t *testing.T)</a>

```
searchKey: exec_test.TestContext
tags: [private]
```

```Go
func TestContext(t *testing.T)
```

### <a id="TestContextCancel" href="#TestContextCancel">func TestContextCancel(t *testing.T)</a>

```
searchKey: exec_test.TestContextCancel
tags: [private]
```

```Go
func TestContextCancel(t *testing.T)
```

### <a id="TestDedupEnvEcho" href="#TestDedupEnvEcho">func TestDedupEnvEcho(t *testing.T)</a>

```
searchKey: exec_test.TestDedupEnvEcho
tags: [private]
```

```Go
func TestDedupEnvEcho(t *testing.T)
```

test that environment variables are de-duped. 

### <a id="TestString" href="#TestString">func TestString(t *testing.T)</a>

```
searchKey: exec_test.TestString
tags: [private]
```

```Go
func TestString(t *testing.T)
```

### <a id="TestStringPathNotResolved" href="#TestStringPathNotResolved">func TestStringPathNotResolved(t *testing.T)</a>

```
searchKey: exec_test.TestStringPathNotResolved
tags: [private]
```

```Go
func TestStringPathNotResolved(t *testing.T)
```

### <a id="TestChildCriticalEnv" href="#TestChildCriticalEnv">func TestChildCriticalEnv(t *testing.T)</a>

```
searchKey: exec_test.TestChildCriticalEnv
tags: [private]
```

```Go
func TestChildCriticalEnv(t *testing.T)
```

start a child process without the user code explicitly starting with a copy of the parent's. (The Windows SYSTEMROOT issue: Issue 25210) 

