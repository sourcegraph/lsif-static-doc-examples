# Package os_test

## Index

* [Constants](#const)
    * [const executable_EnvVar](#executable_EnvVar)
    * [const testExecutableDeletion](#testExecutableDeletion)
* [Variables](#var)
    * [var dot](#dot)
    * [var expandTests](#expandTests)
    * [var global](#global)
    * [var isExistTests](#isExistTests)
    * [var isPermissionTests](#isPermissionTests)
    * [var isReadonlyError](#isReadonlyError)
    * [var nilFileMethodTests](#nilFileMethodTests)
    * [var noDeadline](#noDeadline)
    * [var openErrorTests](#openErrorTests)
    * [var readTimeoutTests](#readTimeoutTests)
    * [var setenvEinvalTests](#setenvEinvalTests)
    * [var sfdir](#sfdir)
    * [var sfname](#sfname)
    * [var shellSpecialVarTests](#shellSpecialVarTests)
    * [var sysdir](#sysdir)
    * [var testLargeWrite](#testLargeWrite)
    * [var writeTimeoutTests](#writeTimeoutTests)
* [Types](#type)
    * [type isExistTest struct](#isExistTest)
    * [type isPermissionTest struct](#isPermissionTest)
    * [type myErrorIs struct](#myErrorIs)
        * [func (e myErrorIs) Is(target error) bool](#myErrorIs.Is)
    * [type neverEnding byte](#neverEnding)
        * [func (b neverEnding) Read(p []byte) (int, error)](#neverEnding.Read)
    * [type openErrorTest struct](#openErrorTest)
    * [type sysDir struct](#sysDir)
    * [type syscallDescriptor int](#syscallDescriptor)
* [Functions](#func)
    * [func BenchmarkExpand(b *testing.B)](#BenchmarkExpand)
    * [func BenchmarkLstatDir(b *testing.B)](#BenchmarkLstatDir)
    * [func BenchmarkLstatDot(b *testing.B)](#BenchmarkLstatDot)
    * [func BenchmarkLstatFile(b *testing.B)](#BenchmarkLstatFile)
    * [func BenchmarkReadDir(b *testing.B)](#BenchmarkReadDir)
    * [func BenchmarkReaddir(b *testing.B)](#BenchmarkReaddir)
    * [func BenchmarkReaddirname(b *testing.B)](#BenchmarkReaddirname)
    * [func BenchmarkStatDir(b *testing.B)](#BenchmarkStatDir)
    * [func BenchmarkStatDot(b *testing.B)](#BenchmarkStatDot)
    * [func BenchmarkStatFile(b *testing.B)](#BenchmarkStatFile)
    * [func ExampleChmod()](#ExampleChmod)
    * [func ExampleChtimes()](#ExampleChtimes)
    * [func ExampleCreateTemp()](#ExampleCreateTemp)
    * [func ExampleCreateTemp_suffix()](#ExampleCreateTemp_suffix)
    * [func ExampleExpand()](#ExampleExpand)
    * [func ExampleExpandEnv()](#ExampleExpandEnv)
    * [func ExampleFileMode()](#ExampleFileMode)
    * [func ExampleGetenv()](#ExampleGetenv)
    * [func ExampleIsNotExist()](#ExampleIsNotExist)
    * [func ExampleLookupEnv()](#ExampleLookupEnv)
    * [func ExampleMkdirTemp()](#ExampleMkdirTemp)
    * [func ExampleMkdirTemp_suffix()](#ExampleMkdirTemp_suffix)
    * [func ExampleOpenFile()](#ExampleOpenFile)
    * [func ExampleOpenFile_append()](#ExampleOpenFile_append)
    * [func ExampleReadDir()](#ExampleReadDir)
    * [func ExampleReadFile()](#ExampleReadFile)
    * [func ExampleUnsetenv()](#ExampleUnsetenv)
    * [func ExampleWriteFile()](#ExampleWriteFile)
    * [func TestAppend(t *testing.T)](#TestAppend)
    * [func TestChdirAndGetwd(t *testing.T)](#TestChdirAndGetwd)
    * [func TestChmod(t *testing.T)](#TestChmod)
    * [func TestChown(t *testing.T)](#TestChown)
    * [func TestChtimes(t *testing.T)](#TestChtimes)
    * [func TestChtimesDir(t *testing.T)](#TestChtimesDir)
    * [func TestClearenv(t *testing.T)](#TestClearenv)
    * [func TestCloseWithBlockingReadByFd(t *testing.T)](#TestCloseWithBlockingReadByFd)
    * [func TestCloseWithBlockingReadByNewFile(t *testing.T)](#TestCloseWithBlockingReadByNewFile)
    * [func TestClosedPipeRaceRead(t *testing.T)](#TestClosedPipeRaceRead)
    * [func TestClosedPipeRaceWrite(t *testing.T)](#TestClosedPipeRaceWrite)
    * [func TestConsistentEnviron(t *testing.T)](#TestConsistentEnviron)
    * [func TestCreateTemp(t *testing.T)](#TestCreateTemp)
    * [func TestCreateTempBadPattern(t *testing.T)](#TestCreateTempBadPattern)
    * [func TestCreateTempPattern(t *testing.T)](#TestCreateTempPattern)
    * [func TestDevNullFile(t *testing.T)](#TestDevNullFile)
    * [func TestDirAndSymlinkStats(t *testing.T)](#TestDirAndSymlinkStats)
    * [func TestDirFS(t *testing.T)](#TestDirFS)
    * [func TestDirFSPathsValid(t *testing.T)](#TestDirFSPathsValid)
    * [func TestDirSeek(t *testing.T)](#TestDirSeek)
    * [func TestDoubleCloseError(t *testing.T)](#TestDoubleCloseError)
    * [func TestEPIPE(t *testing.T)](#TestEPIPE)
    * [func TestErrIsExist(t *testing.T)](#TestErrIsExist)
    * [func TestErrIsNotExist(t *testing.T)](#TestErrIsNotExist)
    * [func TestErrPathNUL(t *testing.T)](#TestErrPathNUL)
    * [func TestErrProcessDone(t *testing.T)](#TestErrProcessDone)
    * [func TestErrorIsMethods(t *testing.T)](#TestErrorIsMethods)
    * [func TestExecutable(t *testing.T)](#TestExecutable)
    * [func TestExecutableDeleted(t *testing.T)](#TestExecutableDeleted)
    * [func TestExpand(t *testing.T)](#TestExpand)
    * [func TestExpandEnvShellSpecialVar(t *testing.T)](#TestExpandEnvShellSpecialVar)
    * [func TestFTruncate(t *testing.T)](#TestFTruncate)
    * [func TestFdRace(t *testing.T)](#TestFdRace)
    * [func TestFdReadRace(t *testing.T)](#TestFdReadRace)
    * [func TestFifoEOF(t *testing.T)](#TestFifoEOF)
    * [func TestFileAndSymlinkStats(t *testing.T)](#TestFileAndSymlinkStats)
    * [func TestFileChdir(t *testing.T)](#TestFileChdir)
    * [func TestFileChown(t *testing.T)](#TestFileChown)
    * [func TestFileReadDir(t *testing.T)](#TestFileReadDir)
    * [func TestFileReaddir(t *testing.T)](#TestFileReaddir)
    * [func TestFileReaddirnames(t *testing.T)](#TestFileReaddirnames)
    * [func TestFstat(t *testing.T)](#TestFstat)
    * [func TestGetppid(t *testing.T)](#TestGetppid)
    * [func TestHardLink(t *testing.T)](#TestHardLink)
    * [func TestHostname(t *testing.T)](#TestHostname)
    * [func TestIsExist(t *testing.T)](#TestIsExist)
    * [func TestIsPermission(t *testing.T)](#TestIsPermission)
    * [func TestKillFindProcess(t *testing.T)](#TestKillFindProcess)
    * [func TestKillStartProcess(t *testing.T)](#TestKillStartProcess)
    * [func TestLargeWriteToConsole(t *testing.T)](#TestLargeWriteToConsole)
    * [func TestLchown(t *testing.T)](#TestLchown)
    * [func TestLongPath(t *testing.T)](#TestLongPath)
    * [func TestLongSymlink(t *testing.T)](#TestLongSymlink)
    * [func TestLookupEnv(t *testing.T)](#TestLookupEnv)
    * [func TestLstat(t *testing.T)](#TestLstat)
    * [func TestMkdirAll(t *testing.T)](#TestMkdirAll)
    * [func TestMkdirAllAtSlash(t *testing.T)](#TestMkdirAllAtSlash)
    * [func TestMkdirAllWithSymlink(t *testing.T)](#TestMkdirAllWithSymlink)
    * [func TestMkdirStickyUmask(t *testing.T)](#TestMkdirStickyUmask)
    * [func TestMkdirTemp(t *testing.T)](#TestMkdirTemp)
    * [func TestMkdirTempBadDir(t *testing.T)](#TestMkdirTempBadDir)
    * [func TestMkdirTempBadPattern(t *testing.T)](#TestMkdirTempBadPattern)
    * [func TestNewFileBlock(t *testing.T)](#TestNewFileBlock)
    * [func TestNewFileNonBlock(t *testing.T)](#TestNewFileNonBlock)
    * [func TestNilFileMethods(t *testing.T)](#TestNilFileMethods)
    * [func TestNilProcessStateString(t *testing.T)](#TestNilProcessStateString)
    * [func TestNonpollableDeadline(t *testing.T)](#TestNonpollableDeadline)
    * [func TestOpenError(t *testing.T)](#TestOpenError)
    * [func TestOpenFileKeepsPermissions(t *testing.T)](#TestOpenFileKeepsPermissions)
    * [func TestOpenNoName(t *testing.T)](#TestOpenNoName)
    * [func TestPathErrorUnwrap(t *testing.T)](#TestPathErrorUnwrap)
    * [func TestPipeEOF(t *testing.T)](#TestPipeEOF)
    * [func TestPipeThreads(t *testing.T)](#TestPipeThreads)
    * [func TestProgWideChdir(t *testing.T)](#TestProgWideChdir)
    * [func TestRacyRead(t *testing.T)](#TestRacyRead)
    * [func TestRacyWrite(t *testing.T)](#TestRacyWrite)
    * [func TestRawConnReadWrite(t *testing.T)](#TestRawConnReadWrite)
    * [func TestRead0(t *testing.T)](#TestRead0)
    * [func TestReadAt(t *testing.T)](#TestReadAt)
    * [func TestReadAtEOF(t *testing.T)](#TestReadAtEOF)
    * [func TestReadAtNegativeOffset(t *testing.T)](#TestReadAtNegativeOffset)
    * [func TestReadAtOffset(t *testing.T)](#TestReadAtOffset)
    * [func TestReadClosed(t *testing.T)](#TestReadClosed)
    * [func TestReadDir(t *testing.T)](#TestReadDir)
    * [func TestReadFile(t *testing.T)](#TestReadFile)
    * [func TestReadFileProc(t *testing.T)](#TestReadFileProc)
    * [func TestReadNonblockingFd(t *testing.T)](#TestReadNonblockingFd)
    * [func TestReadOnlyWriteFile(t *testing.T)](#TestReadOnlyWriteFile)
    * [func TestReadTimeout(t *testing.T)](#TestReadTimeout)
    * [func TestReadTimeoutFluctuation(t *testing.T)](#TestReadTimeoutFluctuation)
    * [func TestReadTimeoutMustNotReturn(t *testing.T)](#TestReadTimeoutMustNotReturn)
    * [func TestReadWriteDeadlineRace(t *testing.T)](#TestReadWriteDeadlineRace)
    * [func TestReaddirNValues(t *testing.T)](#TestReaddirNValues)
    * [func TestReaddirOfFile(t *testing.T)](#TestReaddirOfFile)
    * [func TestReaddirRemoveRace(t *testing.T)](#TestReaddirRemoveRace)
    * [func TestReaddirSmallSeek(t *testing.T)](#TestReaddirSmallSeek)
    * [func TestReaddirStatFailures(t *testing.T)](#TestReaddirStatFailures)
    * [func TestReaddirnamesOneAtATime(t *testing.T)](#TestReaddirnamesOneAtATime)
    * [func TestRemoveAll(t *testing.T)](#TestRemoveAll)
    * [func TestRemoveAllButReadOnlyAndPathError(t *testing.T)](#TestRemoveAllButReadOnlyAndPathError)
    * [func TestRemoveAllDot(t *testing.T)](#TestRemoveAllDot)
    * [func TestRemoveAllDotDot(t *testing.T)](#TestRemoveAllDotDot)
    * [func TestRemoveAllLarge(t *testing.T)](#TestRemoveAllLarge)
    * [func TestRemoveAllLongPath(t *testing.T)](#TestRemoveAllLongPath)
    * [func TestRemoveAllRace(t *testing.T)](#TestRemoveAllRace)
    * [func TestRemoveAllWithMoreErrorThanReqSize(t *testing.T)](#TestRemoveAllWithMoreErrorThanReqSize)
    * [func TestRemoveReadOnlyDir(t *testing.T)](#TestRemoveReadOnlyDir)
    * [func TestRemoveUnreadableDir(t *testing.T)](#TestRemoveUnreadableDir)
    * [func TestRename(t *testing.T)](#TestRename)
    * [func TestRenameCaseDifference(pt *testing.T)](#TestRenameCaseDifference)
    * [func TestRenameFailed(t *testing.T)](#TestRenameFailed)
    * [func TestRenameNotExisting(t *testing.T)](#TestRenameNotExisting)
    * [func TestRenameOverwriteDest(t *testing.T)](#TestRenameOverwriteDest)
    * [func TestRenameToDirFailed(t *testing.T)](#TestRenameToDirFailed)
    * [func TestSameFile(t *testing.T)](#TestSameFile)
    * [func TestSeek(t *testing.T)](#TestSeek)
    * [func TestSeekError(t *testing.T)](#TestSeekError)
    * [func TestSetenvUnixEinval(t *testing.T)](#TestSetenvUnixEinval)
    * [func TestSleep(t *testing.T)](#TestSleep)
    * [func TestSplitPath(t *testing.T)](#TestSplitPath)
    * [func TestStartProcess(t *testing.T)](#TestStartProcess)
    * [func TestStat(t *testing.T)](#TestStat)
    * [func TestStatDirModeExec(t *testing.T)](#TestStatDirModeExec)
    * [func TestStatDirWithTrailingSlash(t *testing.T)](#TestStatDirWithTrailingSlash)
    * [func TestStatError(t *testing.T)](#TestStatError)
    * [func TestStatRelativeSymlink(t *testing.T)](#TestStatRelativeSymlink)
    * [func TestStatStdin(t *testing.T)](#TestStatStdin)
    * [func TestStdPipe(t *testing.T)](#TestStdPipe)
    * [func TestStdPipeHelper(t *testing.T)](#TestStdPipeHelper)
    * [func TestSymlink(t *testing.T)](#TestSymlink)
    * [func TestSymlinkWithTrailingSlash(t *testing.T)](#TestSymlinkWithTrailingSlash)
    * [func TestTTYClose(t *testing.T)](#TestTTYClose)
    * [func TestTruncate(t *testing.T)](#TestTruncate)
    * [func TestUnsetenv(t *testing.T)](#TestUnsetenv)
    * [func TestUserHomeDir(t *testing.T)](#TestUserHomeDir)
    * [func TestVariousDeadlines(t *testing.T)](#TestVariousDeadlines)
    * [func TestVariousDeadlines1Proc(t *testing.T)](#TestVariousDeadlines1Proc)
    * [func TestVariousDeadlines4Proc(t *testing.T)](#TestVariousDeadlines4Proc)
    * [func TestWriteAt(t *testing.T)](#TestWriteAt)
    * [func TestWriteAtInAppendMode(t *testing.T)](#TestWriteAtInAppendMode)
    * [func TestWriteAtNegativeOffset(t *testing.T)](#TestWriteAtNegativeOffset)
    * [func TestWriteFile(t *testing.T)](#TestWriteFile)
    * [func TestWriteStringAlloc(t *testing.T)](#TestWriteStringAlloc)
    * [func TestWriteTimeout(t *testing.T)](#TestWriteTimeout)
    * [func TestWriteTimeoutFluctuation(t *testing.T)](#TestWriteTimeoutFluctuation)
    * [func TestWriteTimeoutMustNotReturn(t *testing.T)](#TestWriteTimeoutMustNotReturn)
    * [func benchmarkLstat(b *testing.B, path string)](#benchmarkLstat)
    * [func benchmarkReadDir(path string, b *testing.B)](#benchmarkReadDir)
    * [func benchmarkReaddir(path string, b *testing.B)](#benchmarkReaddir)
    * [func benchmarkReaddirname(path string, b *testing.B)](#benchmarkReaddirname)
    * [func benchmarkStat(b *testing.B, path string)](#benchmarkStat)
    * [func checkErrorPredicate(predName string, pred func(error) bool, err, target error) string](#checkErrorPredicate)
    * [func checkMode(t *testing.T, path string, mode FileMode)](#checkMode)
    * [func checkNamedSize(t *testing.T, path string, size int64)](#checkNamedSize)
    * [func checkSize(t *testing.T, f *File, size int64)](#checkSize)
    * [func checkUidGid(t *testing.T, path string, uid, gid int)](#checkUidGid)
    * [func chtmpdir(t *testing.T) func()](#chtmpdir)
    * [func equal(name1, name2 string) (r bool)](#equal)
    * [func exec(t *testing.T, dir, cmd string, args []string, expect string)](#exec)
    * [func init()](#init.error_unix_test.go)
    * [func init()](#init.executable_test.go)
    * [func init()](#init.os_unix_test.go)
    * [func isDeadlineExceeded(err error) bool](#isDeadlineExceeded)
    * [func localTmp() string](#localTmp)
    * [func mkdirTree(t *testing.T, root string, level, max int)](#mkdirTree)
    * [func newDir(testName string, t *testing.T) (name string)](#newDir)
    * [func newFile(testName string, t *testing.T) (f *File)](#newFile)
    * [func newFileTest(t *testing.T, blocking bool)](#newFileTest)
    * [func runBinHostname(t *testing.T) string](#runBinHostname)
    * [func sameFile(fn1, fn2 string) bool](#sameFile)
    * [func size(name string, t *testing.T) int64](#size)
    * [func smallReaddirnames(file *File, length int, t *testing.T) []string](#smallReaddirnames)
    * [func testChtimes(t *testing.T, name string)](#testChtimes)
    * [func testCloseWithBlockingRead(t *testing.T, r, w *os.File)](#testCloseWithBlockingRead)
    * [func testClosedPipeRace(t *testing.T, read bool)](#testClosedPipeRace)
    * [func testDevNullFile(t *testing.T, devNullName string, ignoreCase bool)](#testDevNullFile)
    * [func testDevNullFileInfo(t *testing.T, statname, devNullName string, fi FileInfo, ignoreCase bool)](#testDevNullFileInfo)
    * [func testDirStats(t *testing.T, path string)](#testDirStats)
    * [func testDoubleCloseError(t *testing.T, path string)](#testDoubleCloseError)
    * [func testErrNotExist(t *testing.T, name string) string](#testErrNotExist)
    * [func testFileStats(t *testing.T, path string)](#testFileStats)
    * [func testGetenv(s string) string](#testGetenv)
    * [func testIsDir(t *testing.T, path string, fi fs.FileInfo)](#testIsDir)
    * [func testIsFile(t *testing.T, path string, fi fs.FileInfo)](#testIsFile)
    * [func testIsSymlink(t *testing.T, path string, fi fs.FileInfo)](#testIsSymlink)
    * [func testKillProcess(t *testing.T, processKiller func(p *Process))](#testKillProcess)
    * [func testReadDir(dir string, contents []string, t *testing.T)](#testReadDir)
    * [func testReaddir(dir string, contents []string, t *testing.T)](#testReaddir)
    * [func testReaddirnames(dir string, contents []string, t *testing.T)](#testReaddirnames)
    * [func testStatAndLstat(t *testing.T, path string, isLink bool, statCheck, lstatCheck func(*testing.T, string, fs.FileInfo))](#testStatAndLstat)
    * [func testSymlinkSameFile(t *testing.T, path, link string)](#testSymlinkSameFile)
    * [func testSymlinkStats(t *testing.T, path string, isdir bool)](#testSymlinkStats)
    * [func testVariousDeadlines(t *testing.T)](#testVariousDeadlines)
    * [func testWindowsHostname(t *testing.T, hostname string)](#testWindowsHostname)
    * [func timeoutReader(r *os.File, d, min, max time.Duration, ch chan<- error)](#timeoutReader)
    * [func timeoutWriter(w *os.File, d, min, max time.Duration, ch chan<- error)](#timeoutWriter)
    * [func touch(t *testing.T, name string)](#touch)
    * [func writeFile(t *testing.T, fname string, flag int, text string) string](#writeFile)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="executable_EnvVar" href="#executable_EnvVar">const executable_EnvVar</a>

```
searchKey: os_test.executable_EnvVar
tags: [constant string private]
```

```Go
const executable_EnvVar = "OSTEST_OUTPUT_EXECPATH"
```

### <a id="testExecutableDeletion" href="#testExecutableDeletion">const testExecutableDeletion</a>

```
searchKey: os_test.testExecutableDeletion
tags: [constant string private]
```

```Go
const testExecutableDeletion = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="dot" href="#dot">var dot</a>

```
searchKey: os_test.dot
tags: [variable array string private]
```

```Go
var dot = ...
```

### <a id="expandTests" href="#expandTests">var expandTests</a>

```
searchKey: os_test.expandTests
tags: [variable array struct private]
```

```Go
var expandTests = ...
```

### <a id="global" href="#global">var global</a>

```
searchKey: os_test.global
tags: [variable interface private]
```

```Go
var global interface{}
```

### <a id="isExistTests" href="#isExistTests">var isExistTests</a>

```
searchKey: os_test.isExistTests
tags: [variable array struct private]
```

```Go
var isExistTests = ...
```

### <a id="isPermissionTests" href="#isPermissionTests">var isPermissionTests</a>

```
searchKey: os_test.isPermissionTests
tags: [variable array struct private]
```

```Go
var isPermissionTests = ...
```

### <a id="isReadonlyError" href="#isReadonlyError">var isReadonlyError</a>

```
searchKey: os_test.isReadonlyError
tags: [variable function private]
```

```Go
var isReadonlyError = func(error) bool { return false }
```

### <a id="nilFileMethodTests" href="#nilFileMethodTests">var nilFileMethodTests</a>

```
searchKey: os_test.nilFileMethodTests
tags: [variable array struct private]
```

```Go
var nilFileMethodTests = ...
```

### <a id="noDeadline" href="#noDeadline">var noDeadline</a>

```
searchKey: os_test.noDeadline
tags: [variable struct private]
```

```Go
var noDeadline time.Time
```

noDeadline is a zero time.Time value, which cancels a deadline. 

### <a id="openErrorTests" href="#openErrorTests">var openErrorTests</a>

```
searchKey: os_test.openErrorTests
tags: [variable array struct private]
```

```Go
var openErrorTests = ...
```

### <a id="readTimeoutTests" href="#readTimeoutTests">var readTimeoutTests</a>

```
searchKey: os_test.readTimeoutTests
tags: [variable array struct private]
```

```Go
var readTimeoutTests = ...
```

### <a id="setenvEinvalTests" href="#setenvEinvalTests">var setenvEinvalTests</a>

```
searchKey: os_test.setenvEinvalTests
tags: [variable array struct private]
```

```Go
var setenvEinvalTests = ...
```

### <a id="sfdir" href="#sfdir">var sfdir</a>

```
searchKey: os_test.sfdir
tags: [variable string private]
```

```Go
var sfdir = sysdir.name
```

### <a id="sfname" href="#sfname">var sfname</a>

```
searchKey: os_test.sfname
tags: [variable string private]
```

```Go
var sfname = sysdir.files[0]
```

### <a id="shellSpecialVarTests" href="#shellSpecialVarTests">var shellSpecialVarTests</a>

```
searchKey: os_test.shellSpecialVarTests
tags: [variable array struct private]
```

```Go
var shellSpecialVarTests = ...
```

### <a id="sysdir" href="#sysdir">var sysdir</a>

```
searchKey: os_test.sysdir
tags: [variable struct private]
```

```Go
var sysdir = ...
```

### <a id="testLargeWrite" href="#testLargeWrite">var testLargeWrite</a>

```
searchKey: os_test.testLargeWrite
tags: [variable boolean private]
```

```Go
var testLargeWrite = ...
```

### <a id="writeTimeoutTests" href="#writeTimeoutTests">var writeTimeoutTests</a>

```
searchKey: os_test.writeTimeoutTests
tags: [variable array struct private]
```

```Go
var writeTimeoutTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="isExistTest" href="#isExistTest">type isExistTest struct</a>

```
searchKey: os_test.isExistTest
tags: [struct private]
```

```Go
type isExistTest struct {
	err   error
	is    bool
	isnot bool
}
```

### <a id="isPermissionTest" href="#isPermissionTest">type isPermissionTest struct</a>

```
searchKey: os_test.isPermissionTest
tags: [struct private]
```

```Go
type isPermissionTest struct {
	err  error
	want bool
}
```

### <a id="myErrorIs" href="#myErrorIs">type myErrorIs struct</a>

```
searchKey: os_test.myErrorIs
tags: [struct private]
```

```Go
type myErrorIs struct{ error }
```

#### <a id="myErrorIs.Is" href="#myErrorIs.Is">func (e myErrorIs) Is(target error) bool</a>

```
searchKey: os_test.myErrorIs.Is
tags: [method private]
```

```Go
func (e myErrorIs) Is(target error) bool
```

### <a id="neverEnding" href="#neverEnding">type neverEnding byte</a>

```
searchKey: os_test.neverEnding
tags: [number private]
```

```Go
type neverEnding byte
```

#### <a id="neverEnding.Read" href="#neverEnding.Read">func (b neverEnding) Read(p []byte) (int, error)</a>

```
searchKey: os_test.neverEnding.Read
tags: [method private]
```

```Go
func (b neverEnding) Read(p []byte) (int, error)
```

### <a id="openErrorTest" href="#openErrorTest">type openErrorTest struct</a>

```
searchKey: os_test.openErrorTest
tags: [struct private]
```

```Go
type openErrorTest struct {
	path  string
	mode  int
	error error
}
```

### <a id="sysDir" href="#sysDir">type sysDir struct</a>

```
searchKey: os_test.sysDir
tags: [struct private]
```

```Go
type sysDir struct {
	name  string
	files []string
}
```

### <a id="syscallDescriptor" href="#syscallDescriptor">type syscallDescriptor int</a>

```
searchKey: os_test.syscallDescriptor
tags: [number private]
```

```Go
type syscallDescriptor = int
```

For TestRawConnReadWrite. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkExpand" href="#BenchmarkExpand">func BenchmarkExpand(b *testing.B)</a>

```
searchKey: os_test.BenchmarkExpand
tags: [function private benchmark]
```

```Go
func BenchmarkExpand(b *testing.B)
```

### <a id="BenchmarkLstatDir" href="#BenchmarkLstatDir">func BenchmarkLstatDir(b *testing.B)</a>

```
searchKey: os_test.BenchmarkLstatDir
tags: [function private benchmark]
```

```Go
func BenchmarkLstatDir(b *testing.B)
```

### <a id="BenchmarkLstatDot" href="#BenchmarkLstatDot">func BenchmarkLstatDot(b *testing.B)</a>

```
searchKey: os_test.BenchmarkLstatDot
tags: [function private benchmark]
```

```Go
func BenchmarkLstatDot(b *testing.B)
```

### <a id="BenchmarkLstatFile" href="#BenchmarkLstatFile">func BenchmarkLstatFile(b *testing.B)</a>

```
searchKey: os_test.BenchmarkLstatFile
tags: [function private benchmark]
```

```Go
func BenchmarkLstatFile(b *testing.B)
```

### <a id="BenchmarkReadDir" href="#BenchmarkReadDir">func BenchmarkReadDir(b *testing.B)</a>

```
searchKey: os_test.BenchmarkReadDir
tags: [function private benchmark]
```

```Go
func BenchmarkReadDir(b *testing.B)
```

### <a id="BenchmarkReaddir" href="#BenchmarkReaddir">func BenchmarkReaddir(b *testing.B)</a>

```
searchKey: os_test.BenchmarkReaddir
tags: [function private benchmark]
```

```Go
func BenchmarkReaddir(b *testing.B)
```

### <a id="BenchmarkReaddirname" href="#BenchmarkReaddirname">func BenchmarkReaddirname(b *testing.B)</a>

```
searchKey: os_test.BenchmarkReaddirname
tags: [function private benchmark]
```

```Go
func BenchmarkReaddirname(b *testing.B)
```

### <a id="BenchmarkStatDir" href="#BenchmarkStatDir">func BenchmarkStatDir(b *testing.B)</a>

```
searchKey: os_test.BenchmarkStatDir
tags: [function private benchmark]
```

```Go
func BenchmarkStatDir(b *testing.B)
```

### <a id="BenchmarkStatDot" href="#BenchmarkStatDot">func BenchmarkStatDot(b *testing.B)</a>

```
searchKey: os_test.BenchmarkStatDot
tags: [function private benchmark]
```

```Go
func BenchmarkStatDot(b *testing.B)
```

### <a id="BenchmarkStatFile" href="#BenchmarkStatFile">func BenchmarkStatFile(b *testing.B)</a>

```
searchKey: os_test.BenchmarkStatFile
tags: [function private benchmark]
```

```Go
func BenchmarkStatFile(b *testing.B)
```

### <a id="ExampleChmod" href="#ExampleChmod">func ExampleChmod()</a>

```
searchKey: os_test.ExampleChmod
tags: [function private]
```

```Go
func ExampleChmod()
```

### <a id="ExampleChtimes" href="#ExampleChtimes">func ExampleChtimes()</a>

```
searchKey: os_test.ExampleChtimes
tags: [function private]
```

```Go
func ExampleChtimes()
```

### <a id="ExampleCreateTemp" href="#ExampleCreateTemp">func ExampleCreateTemp()</a>

```
searchKey: os_test.ExampleCreateTemp
tags: [function private]
```

```Go
func ExampleCreateTemp()
```

### <a id="ExampleCreateTemp_suffix" href="#ExampleCreateTemp_suffix">func ExampleCreateTemp_suffix()</a>

```
searchKey: os_test.ExampleCreateTemp_suffix
tags: [function private]
```

```Go
func ExampleCreateTemp_suffix()
```

### <a id="ExampleExpand" href="#ExampleExpand">func ExampleExpand()</a>

```
searchKey: os_test.ExampleExpand
tags: [function private]
```

```Go
func ExampleExpand()
```

### <a id="ExampleExpandEnv" href="#ExampleExpandEnv">func ExampleExpandEnv()</a>

```
searchKey: os_test.ExampleExpandEnv
tags: [function private]
```

```Go
func ExampleExpandEnv()
```

### <a id="ExampleFileMode" href="#ExampleFileMode">func ExampleFileMode()</a>

```
searchKey: os_test.ExampleFileMode
tags: [function private]
```

```Go
func ExampleFileMode()
```

### <a id="ExampleGetenv" href="#ExampleGetenv">func ExampleGetenv()</a>

```
searchKey: os_test.ExampleGetenv
tags: [function private]
```

```Go
func ExampleGetenv()
```

### <a id="ExampleIsNotExist" href="#ExampleIsNotExist">func ExampleIsNotExist()</a>

```
searchKey: os_test.ExampleIsNotExist
tags: [function private]
```

```Go
func ExampleIsNotExist()
```

### <a id="ExampleLookupEnv" href="#ExampleLookupEnv">func ExampleLookupEnv()</a>

```
searchKey: os_test.ExampleLookupEnv
tags: [function private]
```

```Go
func ExampleLookupEnv()
```

### <a id="ExampleMkdirTemp" href="#ExampleMkdirTemp">func ExampleMkdirTemp()</a>

```
searchKey: os_test.ExampleMkdirTemp
tags: [function private]
```

```Go
func ExampleMkdirTemp()
```

### <a id="ExampleMkdirTemp_suffix" href="#ExampleMkdirTemp_suffix">func ExampleMkdirTemp_suffix()</a>

```
searchKey: os_test.ExampleMkdirTemp_suffix
tags: [function private]
```

```Go
func ExampleMkdirTemp_suffix()
```

### <a id="ExampleOpenFile" href="#ExampleOpenFile">func ExampleOpenFile()</a>

```
searchKey: os_test.ExampleOpenFile
tags: [function private]
```

```Go
func ExampleOpenFile()
```

### <a id="ExampleOpenFile_append" href="#ExampleOpenFile_append">func ExampleOpenFile_append()</a>

```
searchKey: os_test.ExampleOpenFile_append
tags: [function private]
```

```Go
func ExampleOpenFile_append()
```

### <a id="ExampleReadDir" href="#ExampleReadDir">func ExampleReadDir()</a>

```
searchKey: os_test.ExampleReadDir
tags: [function private]
```

```Go
func ExampleReadDir()
```

### <a id="ExampleReadFile" href="#ExampleReadFile">func ExampleReadFile()</a>

```
searchKey: os_test.ExampleReadFile
tags: [function private]
```

```Go
func ExampleReadFile()
```

### <a id="ExampleUnsetenv" href="#ExampleUnsetenv">func ExampleUnsetenv()</a>

```
searchKey: os_test.ExampleUnsetenv
tags: [function private]
```

```Go
func ExampleUnsetenv()
```

### <a id="ExampleWriteFile" href="#ExampleWriteFile">func ExampleWriteFile()</a>

```
searchKey: os_test.ExampleWriteFile
tags: [function private]
```

```Go
func ExampleWriteFile()
```

### <a id="TestAppend" href="#TestAppend">func TestAppend(t *testing.T)</a>

```
searchKey: os_test.TestAppend
tags: [function private test]
```

```Go
func TestAppend(t *testing.T)
```

### <a id="TestChdirAndGetwd" href="#TestChdirAndGetwd">func TestChdirAndGetwd(t *testing.T)</a>

```
searchKey: os_test.TestChdirAndGetwd
tags: [function private test]
```

```Go
func TestChdirAndGetwd(t *testing.T)
```

### <a id="TestChmod" href="#TestChmod">func TestChmod(t *testing.T)</a>

```
searchKey: os_test.TestChmod
tags: [function private test]
```

```Go
func TestChmod(t *testing.T)
```

### <a id="TestChown" href="#TestChown">func TestChown(t *testing.T)</a>

```
searchKey: os_test.TestChown
tags: [function private test]
```

```Go
func TestChown(t *testing.T)
```

### <a id="TestChtimes" href="#TestChtimes">func TestChtimes(t *testing.T)</a>

```
searchKey: os_test.TestChtimes
tags: [function private test]
```

```Go
func TestChtimes(t *testing.T)
```

Use TempDir (via newFile) to make sure we're on a local file system, so that timings are not distorted by latency and caching. On NFS, timings can be off due to caching of meta-data on NFS servers (Issue 848). 

### <a id="TestChtimesDir" href="#TestChtimesDir">func TestChtimesDir(t *testing.T)</a>

```
searchKey: os_test.TestChtimesDir
tags: [function private test]
```

```Go
func TestChtimesDir(t *testing.T)
```

Use TempDir (via newDir) to make sure we're on a local file system, so that timings are not distorted by latency and caching. On NFS, timings can be off due to caching of meta-data on NFS servers (Issue 848). 

### <a id="TestClearenv" href="#TestClearenv">func TestClearenv(t *testing.T)</a>

```
searchKey: os_test.TestClearenv
tags: [function private test]
```

```Go
func TestClearenv(t *testing.T)
```

### <a id="TestCloseWithBlockingReadByFd" href="#TestCloseWithBlockingReadByFd">func TestCloseWithBlockingReadByFd(t *testing.T)</a>

```
searchKey: os_test.TestCloseWithBlockingReadByFd
tags: [function private test]
```

```Go
func TestCloseWithBlockingReadByFd(t *testing.T)
```

### <a id="TestCloseWithBlockingReadByNewFile" href="#TestCloseWithBlockingReadByNewFile">func TestCloseWithBlockingReadByNewFile(t *testing.T)</a>

```
searchKey: os_test.TestCloseWithBlockingReadByNewFile
tags: [function private test]
```

```Go
func TestCloseWithBlockingReadByNewFile(t *testing.T)
```

### <a id="TestClosedPipeRaceRead" href="#TestClosedPipeRaceRead">func TestClosedPipeRaceRead(t *testing.T)</a>

```
searchKey: os_test.TestClosedPipeRaceRead
tags: [function private test]
```

```Go
func TestClosedPipeRaceRead(t *testing.T)
```

### <a id="TestClosedPipeRaceWrite" href="#TestClosedPipeRaceWrite">func TestClosedPipeRaceWrite(t *testing.T)</a>

```
searchKey: os_test.TestClosedPipeRaceWrite
tags: [function private test]
```

```Go
func TestClosedPipeRaceWrite(t *testing.T)
```

### <a id="TestConsistentEnviron" href="#TestConsistentEnviron">func TestConsistentEnviron(t *testing.T)</a>

```
searchKey: os_test.TestConsistentEnviron
tags: [function private test]
```

```Go
func TestConsistentEnviron(t *testing.T)
```

### <a id="TestCreateTemp" href="#TestCreateTemp">func TestCreateTemp(t *testing.T)</a>

```
searchKey: os_test.TestCreateTemp
tags: [function private test]
```

```Go
func TestCreateTemp(t *testing.T)
```

### <a id="TestCreateTempBadPattern" href="#TestCreateTempBadPattern">func TestCreateTempBadPattern(t *testing.T)</a>

```
searchKey: os_test.TestCreateTempBadPattern
tags: [function private test]
```

```Go
func TestCreateTempBadPattern(t *testing.T)
```

### <a id="TestCreateTempPattern" href="#TestCreateTempPattern">func TestCreateTempPattern(t *testing.T)</a>

```
searchKey: os_test.TestCreateTempPattern
tags: [function private test]
```

```Go
func TestCreateTempPattern(t *testing.T)
```

### <a id="TestDevNullFile" href="#TestDevNullFile">func TestDevNullFile(t *testing.T)</a>

```
searchKey: os_test.TestDevNullFile
tags: [function private test]
```

```Go
func TestDevNullFile(t *testing.T)
```

### <a id="TestDirAndSymlinkStats" href="#TestDirAndSymlinkStats">func TestDirAndSymlinkStats(t *testing.T)</a>

```
searchKey: os_test.TestDirAndSymlinkStats
tags: [function private test]
```

```Go
func TestDirAndSymlinkStats(t *testing.T)
```

### <a id="TestDirFS" href="#TestDirFS">func TestDirFS(t *testing.T)</a>

```
searchKey: os_test.TestDirFS
tags: [function private test]
```

```Go
func TestDirFS(t *testing.T)
```

### <a id="TestDirFSPathsValid" href="#TestDirFSPathsValid">func TestDirFSPathsValid(t *testing.T)</a>

```
searchKey: os_test.TestDirFSPathsValid
tags: [function private test]
```

```Go
func TestDirFSPathsValid(t *testing.T)
```

### <a id="TestDirSeek" href="#TestDirSeek">func TestDirSeek(t *testing.T)</a>

```
searchKey: os_test.TestDirSeek
tags: [function private test]
```

```Go
func TestDirSeek(t *testing.T)
```

### <a id="TestDoubleCloseError" href="#TestDoubleCloseError">func TestDoubleCloseError(t *testing.T)</a>

```
searchKey: os_test.TestDoubleCloseError
tags: [function private test]
```

```Go
func TestDoubleCloseError(t *testing.T)
```

### <a id="TestEPIPE" href="#TestEPIPE">func TestEPIPE(t *testing.T)</a>

```
searchKey: os_test.TestEPIPE
tags: [function private test]
```

```Go
func TestEPIPE(t *testing.T)
```

### <a id="TestErrIsExist" href="#TestErrIsExist">func TestErrIsExist(t *testing.T)</a>

```
searchKey: os_test.TestErrIsExist
tags: [function private test]
```

```Go
func TestErrIsExist(t *testing.T)
```

### <a id="TestErrIsNotExist" href="#TestErrIsNotExist">func TestErrIsNotExist(t *testing.T)</a>

```
searchKey: os_test.TestErrIsNotExist
tags: [function private test]
```

```Go
func TestErrIsNotExist(t *testing.T)
```

### <a id="TestErrPathNUL" href="#TestErrPathNUL">func TestErrPathNUL(t *testing.T)</a>

```
searchKey: os_test.TestErrPathNUL
tags: [function private test]
```

```Go
func TestErrPathNUL(t *testing.T)
```

### <a id="TestErrProcessDone" href="#TestErrProcessDone">func TestErrProcessDone(t *testing.T)</a>

```
searchKey: os_test.TestErrProcessDone
tags: [function private test]
```

```Go
func TestErrProcessDone(t *testing.T)
```

### <a id="TestErrorIsMethods" href="#TestErrorIsMethods">func TestErrorIsMethods(t *testing.T)</a>

```
searchKey: os_test.TestErrorIsMethods
tags: [function private test]
```

```Go
func TestErrorIsMethods(t *testing.T)
```

### <a id="TestExecutable" href="#TestExecutable">func TestExecutable(t *testing.T)</a>

```
searchKey: os_test.TestExecutable
tags: [function private test]
```

```Go
func TestExecutable(t *testing.T)
```

### <a id="TestExecutableDeleted" href="#TestExecutableDeleted">func TestExecutableDeleted(t *testing.T)</a>

```
searchKey: os_test.TestExecutableDeleted
tags: [function private test]
```

```Go
func TestExecutableDeleted(t *testing.T)
```

### <a id="TestExpand" href="#TestExpand">func TestExpand(t *testing.T)</a>

```
searchKey: os_test.TestExpand
tags: [function private test]
```

```Go
func TestExpand(t *testing.T)
```

### <a id="TestExpandEnvShellSpecialVar" href="#TestExpandEnvShellSpecialVar">func TestExpandEnvShellSpecialVar(t *testing.T)</a>

```
searchKey: os_test.TestExpandEnvShellSpecialVar
tags: [function private test]
```

```Go
func TestExpandEnvShellSpecialVar(t *testing.T)
```

### <a id="TestFTruncate" href="#TestFTruncate">func TestFTruncate(t *testing.T)</a>

```
searchKey: os_test.TestFTruncate
tags: [function private test]
```

```Go
func TestFTruncate(t *testing.T)
```

### <a id="TestFdRace" href="#TestFdRace">func TestFdRace(t *testing.T)</a>

```
searchKey: os_test.TestFdRace
tags: [function private test]
```

```Go
func TestFdRace(t *testing.T)
```

Issue 24481. 

### <a id="TestFdReadRace" href="#TestFdReadRace">func TestFdReadRace(t *testing.T)</a>

```
searchKey: os_test.TestFdReadRace
tags: [function private test]
```

```Go
func TestFdReadRace(t *testing.T)
```

### <a id="TestFifoEOF" href="#TestFifoEOF">func TestFifoEOF(t *testing.T)</a>

```
searchKey: os_test.TestFifoEOF
tags: [function private test]
```

```Go
func TestFifoEOF(t *testing.T)
```

Issue 24164. 

### <a id="TestFileAndSymlinkStats" href="#TestFileAndSymlinkStats">func TestFileAndSymlinkStats(t *testing.T)</a>

```
searchKey: os_test.TestFileAndSymlinkStats
tags: [function private test]
```

```Go
func TestFileAndSymlinkStats(t *testing.T)
```

### <a id="TestFileChdir" href="#TestFileChdir">func TestFileChdir(t *testing.T)</a>

```
searchKey: os_test.TestFileChdir
tags: [function private test]
```

```Go
func TestFileChdir(t *testing.T)
```

### <a id="TestFileChown" href="#TestFileChown">func TestFileChown(t *testing.T)</a>

```
searchKey: os_test.TestFileChown
tags: [function private test]
```

```Go
func TestFileChown(t *testing.T)
```

### <a id="TestFileReadDir" href="#TestFileReadDir">func TestFileReadDir(t *testing.T)</a>

```
searchKey: os_test.TestFileReadDir
tags: [function private test]
```

```Go
func TestFileReadDir(t *testing.T)
```

### <a id="TestFileReaddir" href="#TestFileReaddir">func TestFileReaddir(t *testing.T)</a>

```
searchKey: os_test.TestFileReaddir
tags: [function private test]
```

```Go
func TestFileReaddir(t *testing.T)
```

### <a id="TestFileReaddirnames" href="#TestFileReaddirnames">func TestFileReaddirnames(t *testing.T)</a>

```
searchKey: os_test.TestFileReaddirnames
tags: [function private test]
```

```Go
func TestFileReaddirnames(t *testing.T)
```

### <a id="TestFstat" href="#TestFstat">func TestFstat(t *testing.T)</a>

```
searchKey: os_test.TestFstat
tags: [function private test]
```

```Go
func TestFstat(t *testing.T)
```

### <a id="TestGetppid" href="#TestGetppid">func TestGetppid(t *testing.T)</a>

```
searchKey: os_test.TestGetppid
tags: [function private test]
```

```Go
func TestGetppid(t *testing.T)
```

### <a id="TestHardLink" href="#TestHardLink">func TestHardLink(t *testing.T)</a>

```
searchKey: os_test.TestHardLink
tags: [function private test]
```

```Go
func TestHardLink(t *testing.T)
```

### <a id="TestHostname" href="#TestHostname">func TestHostname(t *testing.T)</a>

```
searchKey: os_test.TestHostname
tags: [function private test]
```

```Go
func TestHostname(t *testing.T)
```

### <a id="TestIsExist" href="#TestIsExist">func TestIsExist(t *testing.T)</a>

```
searchKey: os_test.TestIsExist
tags: [function private test]
```

```Go
func TestIsExist(t *testing.T)
```

### <a id="TestIsPermission" href="#TestIsPermission">func TestIsPermission(t *testing.T)</a>

```
searchKey: os_test.TestIsPermission
tags: [function private test]
```

```Go
func TestIsPermission(t *testing.T)
```

### <a id="TestKillFindProcess" href="#TestKillFindProcess">func TestKillFindProcess(t *testing.T)</a>

```
searchKey: os_test.TestKillFindProcess
tags: [function private test]
```

```Go
func TestKillFindProcess(t *testing.T)
```

### <a id="TestKillStartProcess" href="#TestKillStartProcess">func TestKillStartProcess(t *testing.T)</a>

```
searchKey: os_test.TestKillStartProcess
tags: [function private test]
```

```Go
func TestKillStartProcess(t *testing.T)
```

### <a id="TestLargeWriteToConsole" href="#TestLargeWriteToConsole">func TestLargeWriteToConsole(t *testing.T)</a>

```
searchKey: os_test.TestLargeWriteToConsole
tags: [function private test]
```

```Go
func TestLargeWriteToConsole(t *testing.T)
```

### <a id="TestLchown" href="#TestLchown">func TestLchown(t *testing.T)</a>

```
searchKey: os_test.TestLchown
tags: [function private test]
```

```Go
func TestLchown(t *testing.T)
```

### <a id="TestLongPath" href="#TestLongPath">func TestLongPath(t *testing.T)</a>

```
searchKey: os_test.TestLongPath
tags: [function private test]
```

```Go
func TestLongPath(t *testing.T)
```

### <a id="TestLongSymlink" href="#TestLongSymlink">func TestLongSymlink(t *testing.T)</a>

```
searchKey: os_test.TestLongSymlink
tags: [function private test]
```

```Go
func TestLongSymlink(t *testing.T)
```

### <a id="TestLookupEnv" href="#TestLookupEnv">func TestLookupEnv(t *testing.T)</a>

```
searchKey: os_test.TestLookupEnv
tags: [function private test]
```

```Go
func TestLookupEnv(t *testing.T)
```

### <a id="TestLstat" href="#TestLstat">func TestLstat(t *testing.T)</a>

```
searchKey: os_test.TestLstat
tags: [function private test]
```

```Go
func TestLstat(t *testing.T)
```

### <a id="TestMkdirAll" href="#TestMkdirAll">func TestMkdirAll(t *testing.T)</a>

```
searchKey: os_test.TestMkdirAll
tags: [function private test]
```

```Go
func TestMkdirAll(t *testing.T)
```

### <a id="TestMkdirAllAtSlash" href="#TestMkdirAllAtSlash">func TestMkdirAllAtSlash(t *testing.T)</a>

```
searchKey: os_test.TestMkdirAllAtSlash
tags: [function private test]
```

```Go
func TestMkdirAllAtSlash(t *testing.T)
```

### <a id="TestMkdirAllWithSymlink" href="#TestMkdirAllWithSymlink">func TestMkdirAllWithSymlink(t *testing.T)</a>

```
searchKey: os_test.TestMkdirAllWithSymlink
tags: [function private test]
```

```Go
func TestMkdirAllWithSymlink(t *testing.T)
```

### <a id="TestMkdirStickyUmask" href="#TestMkdirStickyUmask">func TestMkdirStickyUmask(t *testing.T)</a>

```
searchKey: os_test.TestMkdirStickyUmask
tags: [function private test]
```

```Go
func TestMkdirStickyUmask(t *testing.T)
```

Issue 23120: respect umask when doing Mkdir with the sticky bit 

### <a id="TestMkdirTemp" href="#TestMkdirTemp">func TestMkdirTemp(t *testing.T)</a>

```
searchKey: os_test.TestMkdirTemp
tags: [function private test]
```

```Go
func TestMkdirTemp(t *testing.T)
```

### <a id="TestMkdirTempBadDir" href="#TestMkdirTempBadDir">func TestMkdirTempBadDir(t *testing.T)</a>

```
searchKey: os_test.TestMkdirTempBadDir
tags: [function private test]
```

```Go
func TestMkdirTempBadDir(t *testing.T)
```

test that we return a nice error message if the dir argument to TempDir doesn't exist (or that it's empty and TempDir doesn't exist) 

### <a id="TestMkdirTempBadPattern" href="#TestMkdirTempBadPattern">func TestMkdirTempBadPattern(t *testing.T)</a>

```
searchKey: os_test.TestMkdirTempBadPattern
tags: [function private test]
```

```Go
func TestMkdirTempBadPattern(t *testing.T)
```

### <a id="TestNewFileBlock" href="#TestNewFileBlock">func TestNewFileBlock(t *testing.T)</a>

```
searchKey: os_test.TestNewFileBlock
tags: [function private test]
```

```Go
func TestNewFileBlock(t *testing.T)
```

### <a id="TestNewFileNonBlock" href="#TestNewFileNonBlock">func TestNewFileNonBlock(t *testing.T)</a>

```
searchKey: os_test.TestNewFileNonBlock
tags: [function private test]
```

```Go
func TestNewFileNonBlock(t *testing.T)
```

### <a id="TestNilFileMethods" href="#TestNilFileMethods">func TestNilFileMethods(t *testing.T)</a>

```
searchKey: os_test.TestNilFileMethods
tags: [function private test]
```

```Go
func TestNilFileMethods(t *testing.T)
```

Test that all File methods give ErrInvalid if the receiver is nil. 

### <a id="TestNilProcessStateString" href="#TestNilProcessStateString">func TestNilProcessStateString(t *testing.T)</a>

```
searchKey: os_test.TestNilProcessStateString
tags: [function private test]
```

```Go
func TestNilProcessStateString(t *testing.T)
```

### <a id="TestNonpollableDeadline" href="#TestNonpollableDeadline">func TestNonpollableDeadline(t *testing.T)</a>

```
searchKey: os_test.TestNonpollableDeadline
tags: [function private test]
```

```Go
func TestNonpollableDeadline(t *testing.T)
```

### <a id="TestOpenError" href="#TestOpenError">func TestOpenError(t *testing.T)</a>

```
searchKey: os_test.TestOpenError
tags: [function private test]
```

```Go
func TestOpenError(t *testing.T)
```

### <a id="TestOpenFileKeepsPermissions" href="#TestOpenFileKeepsPermissions">func TestOpenFileKeepsPermissions(t *testing.T)</a>

```
searchKey: os_test.TestOpenFileKeepsPermissions
tags: [function private test]
```

```Go
func TestOpenFileKeepsPermissions(t *testing.T)
```

Test that opening a file does not change its permissions.  Issue 38225. 

### <a id="TestOpenNoName" href="#TestOpenNoName">func TestOpenNoName(t *testing.T)</a>

```
searchKey: os_test.TestOpenNoName
tags: [function private test]
```

```Go
func TestOpenNoName(t *testing.T)
```

### <a id="TestPathErrorUnwrap" href="#TestPathErrorUnwrap">func TestPathErrorUnwrap(t *testing.T)</a>

```
searchKey: os_test.TestPathErrorUnwrap
tags: [function private test]
```

```Go
func TestPathErrorUnwrap(t *testing.T)
```

### <a id="TestPipeEOF" href="#TestPipeEOF">func TestPipeEOF(t *testing.T)</a>

```
searchKey: os_test.TestPipeEOF
tags: [function private test]
```

```Go
func TestPipeEOF(t *testing.T)
```

Issue 24164, for pipes. 

### <a id="TestPipeThreads" href="#TestPipeThreads">func TestPipeThreads(t *testing.T)</a>

```
searchKey: os_test.TestPipeThreads
tags: [function private test]
```

```Go
func TestPipeThreads(t *testing.T)
```

Test that reading from a pipe doesn't use up a thread. 

### <a id="TestProgWideChdir" href="#TestProgWideChdir">func TestProgWideChdir(t *testing.T)</a>

```
searchKey: os_test.TestProgWideChdir
tags: [function private test]
```

```Go
func TestProgWideChdir(t *testing.T)
```

Test that Chdir+Getwd is program-wide. 

### <a id="TestRacyRead" href="#TestRacyRead">func TestRacyRead(t *testing.T)</a>

```
searchKey: os_test.TestRacyRead
tags: [function private test]
```

```Go
func TestRacyRead(t *testing.T)
```

TestRacyRead tests that it is safe to mutate the input Read buffer immediately after cancellation has occurred. 

### <a id="TestRacyWrite" href="#TestRacyWrite">func TestRacyWrite(t *testing.T)</a>

```
searchKey: os_test.TestRacyWrite
tags: [function private test]
```

```Go
func TestRacyWrite(t *testing.T)
```

TestRacyWrite tests that it is safe to mutate the input Write buffer immediately after cancellation has occurred. 

### <a id="TestRawConnReadWrite" href="#TestRawConnReadWrite">func TestRawConnReadWrite(t *testing.T)</a>

```
searchKey: os_test.TestRawConnReadWrite
tags: [function private test]
```

```Go
func TestRawConnReadWrite(t *testing.T)
```

### <a id="TestRead0" href="#TestRead0">func TestRead0(t *testing.T)</a>

```
searchKey: os_test.TestRead0
tags: [function private test]
```

```Go
func TestRead0(t *testing.T)
```

Read with length 0 should not return EOF. 

### <a id="TestReadAt" href="#TestReadAt">func TestReadAt(t *testing.T)</a>

```
searchKey: os_test.TestReadAt
tags: [function private test]
```

```Go
func TestReadAt(t *testing.T)
```

### <a id="TestReadAtEOF" href="#TestReadAtEOF">func TestReadAtEOF(t *testing.T)</a>

```
searchKey: os_test.TestReadAtEOF
tags: [function private test]
```

```Go
func TestReadAtEOF(t *testing.T)
```

### <a id="TestReadAtNegativeOffset" href="#TestReadAtNegativeOffset">func TestReadAtNegativeOffset(t *testing.T)</a>

```
searchKey: os_test.TestReadAtNegativeOffset
tags: [function private test]
```

```Go
func TestReadAtNegativeOffset(t *testing.T)
```

Verify that ReadAt doesn't allow negative offset. 

### <a id="TestReadAtOffset" href="#TestReadAtOffset">func TestReadAtOffset(t *testing.T)</a>

```
searchKey: os_test.TestReadAtOffset
tags: [function private test]
```

```Go
func TestReadAtOffset(t *testing.T)
```

Verify that ReadAt doesn't affect seek offset. In the Plan 9 kernel, there used to be a bug in the implementation of the pread syscall, where the channel offset was erroneously updated after calling pread on a file. 

### <a id="TestReadClosed" href="#TestReadClosed">func TestReadClosed(t *testing.T)</a>

```
searchKey: os_test.TestReadClosed
tags: [function private test]
```

```Go
func TestReadClosed(t *testing.T)
```

Reading a closed file should return ErrClosed error 

### <a id="TestReadDir" href="#TestReadDir">func TestReadDir(t *testing.T)</a>

```
searchKey: os_test.TestReadDir
tags: [function private test]
```

```Go
func TestReadDir(t *testing.T)
```

### <a id="TestReadFile" href="#TestReadFile">func TestReadFile(t *testing.T)</a>

```
searchKey: os_test.TestReadFile
tags: [function private test]
```

```Go
func TestReadFile(t *testing.T)
```

### <a id="TestReadFileProc" href="#TestReadFileProc">func TestReadFileProc(t *testing.T)</a>

```
searchKey: os_test.TestReadFileProc
tags: [function private test]
```

```Go
func TestReadFileProc(t *testing.T)
```

### <a id="TestReadNonblockingFd" href="#TestReadNonblockingFd">func TestReadNonblockingFd(t *testing.T)</a>

```
searchKey: os_test.TestReadNonblockingFd
tags: [function private test]
```

```Go
func TestReadNonblockingFd(t *testing.T)
```

Issue 20915: Reading on nonblocking fd should not return "waiting for unsupported file type." Currently it returns EAGAIN; it is possible that in the future it will simply wait for data. 

### <a id="TestReadOnlyWriteFile" href="#TestReadOnlyWriteFile">func TestReadOnlyWriteFile(t *testing.T)</a>

```
searchKey: os_test.TestReadOnlyWriteFile
tags: [function private test]
```

```Go
func TestReadOnlyWriteFile(t *testing.T)
```

### <a id="TestReadTimeout" href="#TestReadTimeout">func TestReadTimeout(t *testing.T)</a>

```
searchKey: os_test.TestReadTimeout
tags: [function private test]
```

```Go
func TestReadTimeout(t *testing.T)
```

### <a id="TestReadTimeoutFluctuation" href="#TestReadTimeoutFluctuation">func TestReadTimeoutFluctuation(t *testing.T)</a>

```
searchKey: os_test.TestReadTimeoutFluctuation
tags: [function private test]
```

```Go
func TestReadTimeoutFluctuation(t *testing.T)
```

### <a id="TestReadTimeoutMustNotReturn" href="#TestReadTimeoutMustNotReturn">func TestReadTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: os_test.TestReadTimeoutMustNotReturn
tags: [function private test]
```

```Go
func TestReadTimeoutMustNotReturn(t *testing.T)
```

### <a id="TestReadWriteDeadlineRace" href="#TestReadWriteDeadlineRace">func TestReadWriteDeadlineRace(t *testing.T)</a>

```
searchKey: os_test.TestReadWriteDeadlineRace
tags: [function private test]
```

```Go
func TestReadWriteDeadlineRace(t *testing.T)
```

### <a id="TestReaddirNValues" href="#TestReaddirNValues">func TestReaddirNValues(t *testing.T)</a>

```
searchKey: os_test.TestReaddirNValues
tags: [function private test]
```

```Go
func TestReaddirNValues(t *testing.T)
```

### <a id="TestReaddirOfFile" href="#TestReaddirOfFile">func TestReaddirOfFile(t *testing.T)</a>

```
searchKey: os_test.TestReaddirOfFile
tags: [function private test]
```

```Go
func TestReaddirOfFile(t *testing.T)
```

Readdir on a regular file should fail. 

### <a id="TestReaddirRemoveRace" href="#TestReaddirRemoveRace">func TestReaddirRemoveRace(t *testing.T)</a>

```
searchKey: os_test.TestReaddirRemoveRace
tags: [function private test]
```

```Go
func TestReaddirRemoveRace(t *testing.T)
```

Issue 16919: Readdir must return a non-empty slice or an error. 

### <a id="TestReaddirSmallSeek" href="#TestReaddirSmallSeek">func TestReaddirSmallSeek(t *testing.T)</a>

```
searchKey: os_test.TestReaddirSmallSeek
tags: [function private test]
```

```Go
func TestReaddirSmallSeek(t *testing.T)
```

### <a id="TestReaddirStatFailures" href="#TestReaddirStatFailures">func TestReaddirStatFailures(t *testing.T)</a>

```
searchKey: os_test.TestReaddirStatFailures
tags: [function private test]
```

```Go
func TestReaddirStatFailures(t *testing.T)
```

### <a id="TestReaddirnamesOneAtATime" href="#TestReaddirnamesOneAtATime">func TestReaddirnamesOneAtATime(t *testing.T)</a>

```
searchKey: os_test.TestReaddirnamesOneAtATime
tags: [function private test]
```

```Go
func TestReaddirnamesOneAtATime(t *testing.T)
```

Check that reading a directory one entry at a time gives the same result as reading it all at once. 

### <a id="TestRemoveAll" href="#TestRemoveAll">func TestRemoveAll(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAll
tags: [function private test]
```

```Go
func TestRemoveAll(t *testing.T)
```

### <a id="TestRemoveAllButReadOnlyAndPathError" href="#TestRemoveAllButReadOnlyAndPathError">func TestRemoveAllButReadOnlyAndPathError(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllButReadOnlyAndPathError
tags: [function private test]
```

```Go
func TestRemoveAllButReadOnlyAndPathError(t *testing.T)
```

Issue #29983. 

### <a id="TestRemoveAllDot" href="#TestRemoveAllDot">func TestRemoveAllDot(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllDot
tags: [function private test]
```

```Go
func TestRemoveAllDot(t *testing.T)
```

### <a id="TestRemoveAllDotDot" href="#TestRemoveAllDotDot">func TestRemoveAllDotDot(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllDotDot
tags: [function private test]
```

```Go
func TestRemoveAllDotDot(t *testing.T)
```

### <a id="TestRemoveAllLarge" href="#TestRemoveAllLarge">func TestRemoveAllLarge(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllLarge
tags: [function private test]
```

```Go
func TestRemoveAllLarge(t *testing.T)
```

Test RemoveAll on a large directory. 

### <a id="TestRemoveAllLongPath" href="#TestRemoveAllLongPath">func TestRemoveAllLongPath(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllLongPath
tags: [function private test]
```

```Go
func TestRemoveAllLongPath(t *testing.T)
```

### <a id="TestRemoveAllRace" href="#TestRemoveAllRace">func TestRemoveAllRace(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllRace
tags: [function private test]
```

```Go
func TestRemoveAllRace(t *testing.T)
```

Test that simultaneous RemoveAll do not report an error. As long as it gets removed, we should be happy. 

### <a id="TestRemoveAllWithMoreErrorThanReqSize" href="#TestRemoveAllWithMoreErrorThanReqSize">func TestRemoveAllWithMoreErrorThanReqSize(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllWithMoreErrorThanReqSize
tags: [function private test]
```

```Go
func TestRemoveAllWithMoreErrorThanReqSize(t *testing.T)
```

Issue 29921 

### <a id="TestRemoveReadOnlyDir" href="#TestRemoveReadOnlyDir">func TestRemoveReadOnlyDir(t *testing.T)</a>

```
searchKey: os_test.TestRemoveReadOnlyDir
tags: [function private test]
```

```Go
func TestRemoveReadOnlyDir(t *testing.T)
```

Issue #29178. 

### <a id="TestRemoveUnreadableDir" href="#TestRemoveUnreadableDir">func TestRemoveUnreadableDir(t *testing.T)</a>

```
searchKey: os_test.TestRemoveUnreadableDir
tags: [function private test]
```

```Go
func TestRemoveUnreadableDir(t *testing.T)
```

### <a id="TestRename" href="#TestRename">func TestRename(t *testing.T)</a>

```
searchKey: os_test.TestRename
tags: [function private test]
```

```Go
func TestRename(t *testing.T)
```

### <a id="TestRenameCaseDifference" href="#TestRenameCaseDifference">func TestRenameCaseDifference(pt *testing.T)</a>

```
searchKey: os_test.TestRenameCaseDifference
tags: [function private test]
```

```Go
func TestRenameCaseDifference(pt *testing.T)
```

### <a id="TestRenameFailed" href="#TestRenameFailed">func TestRenameFailed(t *testing.T)</a>

```
searchKey: os_test.TestRenameFailed
tags: [function private test]
```

```Go
func TestRenameFailed(t *testing.T)
```

### <a id="TestRenameNotExisting" href="#TestRenameNotExisting">func TestRenameNotExisting(t *testing.T)</a>

```
searchKey: os_test.TestRenameNotExisting
tags: [function private test]
```

```Go
func TestRenameNotExisting(t *testing.T)
```

### <a id="TestRenameOverwriteDest" href="#TestRenameOverwriteDest">func TestRenameOverwriteDest(t *testing.T)</a>

```
searchKey: os_test.TestRenameOverwriteDest
tags: [function private test]
```

```Go
func TestRenameOverwriteDest(t *testing.T)
```

### <a id="TestRenameToDirFailed" href="#TestRenameToDirFailed">func TestRenameToDirFailed(t *testing.T)</a>

```
searchKey: os_test.TestRenameToDirFailed
tags: [function private test]
```

```Go
func TestRenameToDirFailed(t *testing.T)
```

### <a id="TestSameFile" href="#TestSameFile">func TestSameFile(t *testing.T)</a>

```
searchKey: os_test.TestSameFile
tags: [function private test]
```

```Go
func TestSameFile(t *testing.T)
```

### <a id="TestSeek" href="#TestSeek">func TestSeek(t *testing.T)</a>

```
searchKey: os_test.TestSeek
tags: [function private test]
```

```Go
func TestSeek(t *testing.T)
```

### <a id="TestSeekError" href="#TestSeekError">func TestSeekError(t *testing.T)</a>

```
searchKey: os_test.TestSeekError
tags: [function private test]
```

```Go
func TestSeekError(t *testing.T)
```

### <a id="TestSetenvUnixEinval" href="#TestSetenvUnixEinval">func TestSetenvUnixEinval(t *testing.T)</a>

```
searchKey: os_test.TestSetenvUnixEinval
tags: [function private test]
```

```Go
func TestSetenvUnixEinval(t *testing.T)
```

### <a id="TestSleep" href="#TestSleep">func TestSleep(t *testing.T)</a>

```
searchKey: os_test.TestSleep
tags: [function private test]
```

```Go
func TestSleep(t *testing.T)
```

TestSleep emulates "sleep 1". It is a helper for testKillProcess, so we don't have to rely on an external "sleep" command being available. 

### <a id="TestSplitPath" href="#TestSplitPath">func TestSplitPath(t *testing.T)</a>

```
searchKey: os_test.TestSplitPath
tags: [function private test]
```

```Go
func TestSplitPath(t *testing.T)
```

### <a id="TestStartProcess" href="#TestStartProcess">func TestStartProcess(t *testing.T)</a>

```
searchKey: os_test.TestStartProcess
tags: [function private test]
```

```Go
func TestStartProcess(t *testing.T)
```

### <a id="TestStat" href="#TestStat">func TestStat(t *testing.T)</a>

```
searchKey: os_test.TestStat
tags: [function private test]
```

```Go
func TestStat(t *testing.T)
```

### <a id="TestStatDirModeExec" href="#TestStatDirModeExec">func TestStatDirModeExec(t *testing.T)</a>

```
searchKey: os_test.TestStatDirModeExec
tags: [function private test]
```

```Go
func TestStatDirModeExec(t *testing.T)
```

### <a id="TestStatDirWithTrailingSlash" href="#TestStatDirWithTrailingSlash">func TestStatDirWithTrailingSlash(t *testing.T)</a>

```
searchKey: os_test.TestStatDirWithTrailingSlash
tags: [function private test]
```

```Go
func TestStatDirWithTrailingSlash(t *testing.T)
```

### <a id="TestStatError" href="#TestStatError">func TestStatError(t *testing.T)</a>

```
searchKey: os_test.TestStatError
tags: [function private test]
```

```Go
func TestStatError(t *testing.T)
```

### <a id="TestStatRelativeSymlink" href="#TestStatRelativeSymlink">func TestStatRelativeSymlink(t *testing.T)</a>

```
searchKey: os_test.TestStatRelativeSymlink
tags: [function private test]
```

```Go
func TestStatRelativeSymlink(t *testing.T)
```

### <a id="TestStatStdin" href="#TestStatStdin">func TestStatStdin(t *testing.T)</a>

```
searchKey: os_test.TestStatStdin
tags: [function private test]
```

```Go
func TestStatStdin(t *testing.T)
```

### <a id="TestStdPipe" href="#TestStdPipe">func TestStdPipe(t *testing.T)</a>

```
searchKey: os_test.TestStdPipe
tags: [function private test]
```

```Go
func TestStdPipe(t *testing.T)
```

### <a id="TestStdPipeHelper" href="#TestStdPipeHelper">func TestStdPipeHelper(t *testing.T)</a>

```
searchKey: os_test.TestStdPipeHelper
tags: [function private test]
```

```Go
func TestStdPipeHelper(t *testing.T)
```

This is a helper for TestStdPipe. It's not a test in itself. 

### <a id="TestSymlink" href="#TestSymlink">func TestSymlink(t *testing.T)</a>

```
searchKey: os_test.TestSymlink
tags: [function private test]
```

```Go
func TestSymlink(t *testing.T)
```

### <a id="TestSymlinkWithTrailingSlash" href="#TestSymlinkWithTrailingSlash">func TestSymlinkWithTrailingSlash(t *testing.T)</a>

```
searchKey: os_test.TestSymlinkWithTrailingSlash
tags: [function private test]
```

```Go
func TestSymlinkWithTrailingSlash(t *testing.T)
```

see issue 27225 for details 

### <a id="TestTTYClose" href="#TestTTYClose">func TestTTYClose(t *testing.T)</a>

```
searchKey: os_test.TestTTYClose
tags: [function private test]
```

```Go
func TestTTYClose(t *testing.T)
```

Closing a TTY while reading from it should not hang.  Issue 23943. 

### <a id="TestTruncate" href="#TestTruncate">func TestTruncate(t *testing.T)</a>

```
searchKey: os_test.TestTruncate
tags: [function private test]
```

```Go
func TestTruncate(t *testing.T)
```

### <a id="TestUnsetenv" href="#TestUnsetenv">func TestUnsetenv(t *testing.T)</a>

```
searchKey: os_test.TestUnsetenv
tags: [function private test]
```

```Go
func TestUnsetenv(t *testing.T)
```

### <a id="TestUserHomeDir" href="#TestUserHomeDir">func TestUserHomeDir(t *testing.T)</a>

```
searchKey: os_test.TestUserHomeDir
tags: [function private test]
```

```Go
func TestUserHomeDir(t *testing.T)
```

### <a id="TestVariousDeadlines" href="#TestVariousDeadlines">func TestVariousDeadlines(t *testing.T)</a>

```
searchKey: os_test.TestVariousDeadlines
tags: [function private test]
```

```Go
func TestVariousDeadlines(t *testing.T)
```

### <a id="TestVariousDeadlines1Proc" href="#TestVariousDeadlines1Proc">func TestVariousDeadlines1Proc(t *testing.T)</a>

```
searchKey: os_test.TestVariousDeadlines1Proc
tags: [function private test]
```

```Go
func TestVariousDeadlines1Proc(t *testing.T)
```

### <a id="TestVariousDeadlines4Proc" href="#TestVariousDeadlines4Proc">func TestVariousDeadlines4Proc(t *testing.T)</a>

```
searchKey: os_test.TestVariousDeadlines4Proc
tags: [function private test]
```

```Go
func TestVariousDeadlines4Proc(t *testing.T)
```

### <a id="TestWriteAt" href="#TestWriteAt">func TestWriteAt(t *testing.T)</a>

```
searchKey: os_test.TestWriteAt
tags: [function private test]
```

```Go
func TestWriteAt(t *testing.T)
```

### <a id="TestWriteAtInAppendMode" href="#TestWriteAtInAppendMode">func TestWriteAtInAppendMode(t *testing.T)</a>

```
searchKey: os_test.TestWriteAtInAppendMode
tags: [function private test]
```

```Go
func TestWriteAtInAppendMode(t *testing.T)
```

Verify that WriteAt doesn't work in append mode. 

### <a id="TestWriteAtNegativeOffset" href="#TestWriteAtNegativeOffset">func TestWriteAtNegativeOffset(t *testing.T)</a>

```
searchKey: os_test.TestWriteAtNegativeOffset
tags: [function private test]
```

```Go
func TestWriteAtNegativeOffset(t *testing.T)
```

Verify that WriteAt doesn't allow negative offset. 

### <a id="TestWriteFile" href="#TestWriteFile">func TestWriteFile(t *testing.T)</a>

```
searchKey: os_test.TestWriteFile
tags: [function private test]
```

```Go
func TestWriteFile(t *testing.T)
```

### <a id="TestWriteStringAlloc" href="#TestWriteStringAlloc">func TestWriteStringAlloc(t *testing.T)</a>

```
searchKey: os_test.TestWriteStringAlloc
tags: [function private test]
```

```Go
func TestWriteStringAlloc(t *testing.T)
```

### <a id="TestWriteTimeout" href="#TestWriteTimeout">func TestWriteTimeout(t *testing.T)</a>

```
searchKey: os_test.TestWriteTimeout
tags: [function private test]
```

```Go
func TestWriteTimeout(t *testing.T)
```

### <a id="TestWriteTimeoutFluctuation" href="#TestWriteTimeoutFluctuation">func TestWriteTimeoutFluctuation(t *testing.T)</a>

```
searchKey: os_test.TestWriteTimeoutFluctuation
tags: [function private test]
```

```Go
func TestWriteTimeoutFluctuation(t *testing.T)
```

### <a id="TestWriteTimeoutMustNotReturn" href="#TestWriteTimeoutMustNotReturn">func TestWriteTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: os_test.TestWriteTimeoutMustNotReturn
tags: [function private test]
```

```Go
func TestWriteTimeoutMustNotReturn(t *testing.T)
```

### <a id="benchmarkLstat" href="#benchmarkLstat">func benchmarkLstat(b *testing.B, path string)</a>

```
searchKey: os_test.benchmarkLstat
tags: [function private]
```

```Go
func benchmarkLstat(b *testing.B, path string)
```

### <a id="benchmarkReadDir" href="#benchmarkReadDir">func benchmarkReadDir(path string, b *testing.B)</a>

```
searchKey: os_test.benchmarkReadDir
tags: [function private]
```

```Go
func benchmarkReadDir(path string, b *testing.B)
```

### <a id="benchmarkReaddir" href="#benchmarkReaddir">func benchmarkReaddir(path string, b *testing.B)</a>

```
searchKey: os_test.benchmarkReaddir
tags: [function private]
```

```Go
func benchmarkReaddir(path string, b *testing.B)
```

### <a id="benchmarkReaddirname" href="#benchmarkReaddirname">func benchmarkReaddirname(path string, b *testing.B)</a>

```
searchKey: os_test.benchmarkReaddirname
tags: [function private]
```

```Go
func benchmarkReaddirname(path string, b *testing.B)
```

### <a id="benchmarkStat" href="#benchmarkStat">func benchmarkStat(b *testing.B, path string)</a>

```
searchKey: os_test.benchmarkStat
tags: [function private]
```

```Go
func benchmarkStat(b *testing.B, path string)
```

### <a id="checkErrorPredicate" href="#checkErrorPredicate">func checkErrorPredicate(predName string, pred func(error) bool, err, target error) string</a>

```
searchKey: os_test.checkErrorPredicate
tags: [function private]
```

```Go
func checkErrorPredicate(predName string, pred func(error) bool, err, target error) string
```

### <a id="checkMode" href="#checkMode">func checkMode(t *testing.T, path string, mode FileMode)</a>

```
searchKey: os_test.checkMode
tags: [function private]
```

```Go
func checkMode(t *testing.T, path string, mode FileMode)
```

### <a id="checkNamedSize" href="#checkNamedSize">func checkNamedSize(t *testing.T, path string, size int64)</a>

```
searchKey: os_test.checkNamedSize
tags: [function private]
```

```Go
func checkNamedSize(t *testing.T, path string, size int64)
```

### <a id="checkSize" href="#checkSize">func checkSize(t *testing.T, f *File, size int64)</a>

```
searchKey: os_test.checkSize
tags: [function private]
```

```Go
func checkSize(t *testing.T, f *File, size int64)
```

### <a id="checkUidGid" href="#checkUidGid">func checkUidGid(t *testing.T, path string, uid, gid int)</a>

```
searchKey: os_test.checkUidGid
tags: [function private]
```

```Go
func checkUidGid(t *testing.T, path string, uid, gid int)
```

### <a id="chtmpdir" href="#chtmpdir">func chtmpdir(t *testing.T) func()</a>

```
searchKey: os_test.chtmpdir
tags: [function private]
```

```Go
func chtmpdir(t *testing.T) func()
```

chtmpdir changes the working directory to a new temporary directory and provides a cleanup function. 

### <a id="equal" href="#equal">func equal(name1, name2 string) (r bool)</a>

```
searchKey: os_test.equal
tags: [function private]
```

```Go
func equal(name1, name2 string) (r bool)
```

### <a id="exec" href="#exec">func exec(t *testing.T, dir, cmd string, args []string, expect string)</a>

```
searchKey: os_test.exec
tags: [function private]
```

```Go
func exec(t *testing.T, dir, cmd string, args []string, expect string)
```

### <a id="init.error_unix_test.go" href="#init.error_unix_test.go">func init()</a>

```
searchKey: os_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.executable_test.go" href="#init.executable_test.go">func init()</a>

```
searchKey: os_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.os_unix_test.go" href="#init.os_unix_test.go">func init()</a>

```
searchKey: os_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="isDeadlineExceeded" href="#isDeadlineExceeded">func isDeadlineExceeded(err error) bool</a>

```
searchKey: os_test.isDeadlineExceeded
tags: [function private]
```

```Go
func isDeadlineExceeded(err error) bool
```

isDeadlineExceeded reports whether err is or wraps os.ErrDeadlineExceeded. We also check that the error has a Timeout method that returns true. 

### <a id="localTmp" href="#localTmp">func localTmp() string</a>

```
searchKey: os_test.localTmp
tags: [function private]
```

```Go
func localTmp() string
```

localTmp returns a local temporary directory not on NFS. 

### <a id="mkdirTree" href="#mkdirTree">func mkdirTree(t *testing.T, root string, level, max int)</a>

```
searchKey: os_test.mkdirTree
tags: [function private]
```

```Go
func mkdirTree(t *testing.T, root string, level, max int)
```

### <a id="newDir" href="#newDir">func newDir(testName string, t *testing.T) (name string)</a>

```
searchKey: os_test.newDir
tags: [function private]
```

```Go
func newDir(testName string, t *testing.T) (name string)
```

### <a id="newFile" href="#newFile">func newFile(testName string, t *testing.T) (f *File)</a>

```
searchKey: os_test.newFile
tags: [function private]
```

```Go
func newFile(testName string, t *testing.T) (f *File)
```

### <a id="newFileTest" href="#newFileTest">func newFileTest(t *testing.T, blocking bool)</a>

```
searchKey: os_test.newFileTest
tags: [function private]
```

```Go
func newFileTest(t *testing.T, blocking bool)
```

See also issues: 22939, 24331 

### <a id="runBinHostname" href="#runBinHostname">func runBinHostname(t *testing.T) string</a>

```
searchKey: os_test.runBinHostname
tags: [function private]
```

```Go
func runBinHostname(t *testing.T) string
```

### <a id="sameFile" href="#sameFile">func sameFile(fn1, fn2 string) bool</a>

```
searchKey: os_test.sameFile
tags: [function private]
```

```Go
func sameFile(fn1, fn2 string) bool
```

### <a id="size" href="#size">func size(name string, t *testing.T) int64</a>

```
searchKey: os_test.size
tags: [function private]
```

```Go
func size(name string, t *testing.T) int64
```

### <a id="smallReaddirnames" href="#smallReaddirnames">func smallReaddirnames(file *File, length int, t *testing.T) []string</a>

```
searchKey: os_test.smallReaddirnames
tags: [function private]
```

```Go
func smallReaddirnames(file *File, length int, t *testing.T) []string
```

Read the directory one entry at a time. 

### <a id="testChtimes" href="#testChtimes">func testChtimes(t *testing.T, name string)</a>

```
searchKey: os_test.testChtimes
tags: [function private]
```

```Go
func testChtimes(t *testing.T, name string)
```

### <a id="testCloseWithBlockingRead" href="#testCloseWithBlockingRead">func testCloseWithBlockingRead(t *testing.T, r, w *os.File)</a>

```
searchKey: os_test.testCloseWithBlockingRead
tags: [function private]
```

```Go
func testCloseWithBlockingRead(t *testing.T, r, w *os.File)
```

Test that we don't let a blocking read prevent a close. 

### <a id="testClosedPipeRace" href="#testClosedPipeRace">func testClosedPipeRace(t *testing.T, read bool)</a>

```
searchKey: os_test.testClosedPipeRace
tags: [function private]
```

```Go
func testClosedPipeRace(t *testing.T, read bool)
```

### <a id="testDevNullFile" href="#testDevNullFile">func testDevNullFile(t *testing.T, devNullName string, ignoreCase bool)</a>

```
searchKey: os_test.testDevNullFile
tags: [function private]
```

```Go
func testDevNullFile(t *testing.T, devNullName string, ignoreCase bool)
```

### <a id="testDevNullFileInfo" href="#testDevNullFileInfo">func testDevNullFileInfo(t *testing.T, statname, devNullName string, fi FileInfo, ignoreCase bool)</a>

```
searchKey: os_test.testDevNullFileInfo
tags: [function private]
```

```Go
func testDevNullFileInfo(t *testing.T, statname, devNullName string, fi FileInfo, ignoreCase bool)
```

### <a id="testDirStats" href="#testDirStats">func testDirStats(t *testing.T, path string)</a>

```
searchKey: os_test.testDirStats
tags: [function private]
```

```Go
func testDirStats(t *testing.T, path string)
```

### <a id="testDoubleCloseError" href="#testDoubleCloseError">func testDoubleCloseError(t *testing.T, path string)</a>

```
searchKey: os_test.testDoubleCloseError
tags: [function private]
```

```Go
func testDoubleCloseError(t *testing.T, path string)
```

### <a id="testErrNotExist" href="#testErrNotExist">func testErrNotExist(t *testing.T, name string) string</a>

```
searchKey: os_test.testErrNotExist
tags: [function private]
```

```Go
func testErrNotExist(t *testing.T, name string) string
```

### <a id="testFileStats" href="#testFileStats">func testFileStats(t *testing.T, path string)</a>

```
searchKey: os_test.testFileStats
tags: [function private]
```

```Go
func testFileStats(t *testing.T, path string)
```

### <a id="testGetenv" href="#testGetenv">func testGetenv(s string) string</a>

```
searchKey: os_test.testGetenv
tags: [function private]
```

```Go
func testGetenv(s string) string
```

testGetenv gives us a controlled set of variables for testing Expand. 

### <a id="testIsDir" href="#testIsDir">func testIsDir(t *testing.T, path string, fi fs.FileInfo)</a>

```
searchKey: os_test.testIsDir
tags: [function private]
```

```Go
func testIsDir(t *testing.T, path string, fi fs.FileInfo)
```

testIsDir verifies that fi refers to directory. 

### <a id="testIsFile" href="#testIsFile">func testIsFile(t *testing.T, path string, fi fs.FileInfo)</a>

```
searchKey: os_test.testIsFile
tags: [function private]
```

```Go
func testIsFile(t *testing.T, path string, fi fs.FileInfo)
```

testIsFile verifies that fi refers to file. 

### <a id="testIsSymlink" href="#testIsSymlink">func testIsSymlink(t *testing.T, path string, fi fs.FileInfo)</a>

```
searchKey: os_test.testIsSymlink
tags: [function private]
```

```Go
func testIsSymlink(t *testing.T, path string, fi fs.FileInfo)
```

testIsSymlink verifies that fi refers to symlink. 

### <a id="testKillProcess" href="#testKillProcess">func testKillProcess(t *testing.T, processKiller func(p *Process))</a>

```
searchKey: os_test.testKillProcess
tags: [function private]
```

```Go
func testKillProcess(t *testing.T, processKiller func(p *Process))
```

### <a id="testReadDir" href="#testReadDir">func testReadDir(dir string, contents []string, t *testing.T)</a>

```
searchKey: os_test.testReadDir
tags: [function private]
```

```Go
func testReadDir(dir string, contents []string, t *testing.T)
```

### <a id="testReaddir" href="#testReaddir">func testReaddir(dir string, contents []string, t *testing.T)</a>

```
searchKey: os_test.testReaddir
tags: [function private]
```

```Go
func testReaddir(dir string, contents []string, t *testing.T)
```

### <a id="testReaddirnames" href="#testReaddirnames">func testReaddirnames(dir string, contents []string, t *testing.T)</a>

```
searchKey: os_test.testReaddirnames
tags: [function private]
```

```Go
func testReaddirnames(dir string, contents []string, t *testing.T)
```

### <a id="testStatAndLstat" href="#testStatAndLstat">func testStatAndLstat(t *testing.T, path string, isLink bool, statCheck, lstatCheck func(*testing.T, string, fs.FileInfo))</a>

```
searchKey: os_test.testStatAndLstat
tags: [function private]
```

```Go
func testStatAndLstat(t *testing.T, path string, isLink bool, statCheck, lstatCheck func(*testing.T, string, fs.FileInfo))
```

testStatAndLstat verifies that all os.Stat, os.Lstat os.File.Stat and os.Readdir work. 

### <a id="testSymlinkSameFile" href="#testSymlinkSameFile">func testSymlinkSameFile(t *testing.T, path, link string)</a>

```
searchKey: os_test.testSymlinkSameFile
tags: [function private]
```

```Go
func testSymlinkSameFile(t *testing.T, path, link string)
```

### <a id="testSymlinkStats" href="#testSymlinkStats">func testSymlinkStats(t *testing.T, path string, isdir bool)</a>

```
searchKey: os_test.testSymlinkStats
tags: [function private]
```

```Go
func testSymlinkStats(t *testing.T, path string, isdir bool)
```

### <a id="testVariousDeadlines" href="#testVariousDeadlines">func testVariousDeadlines(t *testing.T)</a>

```
searchKey: os_test.testVariousDeadlines
tags: [function private]
```

```Go
func testVariousDeadlines(t *testing.T)
```

### <a id="testWindowsHostname" href="#testWindowsHostname">func testWindowsHostname(t *testing.T, hostname string)</a>

```
searchKey: os_test.testWindowsHostname
tags: [function private]
```

```Go
func testWindowsHostname(t *testing.T, hostname string)
```

### <a id="timeoutReader" href="#timeoutReader">func timeoutReader(r *os.File, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: os_test.timeoutReader
tags: [function private]
```

```Go
func timeoutReader(r *os.File, d, min, max time.Duration, ch chan<- error)
```

### <a id="timeoutWriter" href="#timeoutWriter">func timeoutWriter(w *os.File, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: os_test.timeoutWriter
tags: [function private]
```

```Go
func timeoutWriter(w *os.File, d, min, max time.Duration, ch chan<- error)
```

### <a id="touch" href="#touch">func touch(t *testing.T, name string)</a>

```
searchKey: os_test.touch
tags: [function private]
```

```Go
func touch(t *testing.T, name string)
```

### <a id="writeFile" href="#writeFile">func writeFile(t *testing.T, fname string, flag int, text string) string</a>

```
searchKey: os_test.writeFile
tags: [function private]
```

```Go
func writeFile(t *testing.T, fname string, flag int, text string) string
```

