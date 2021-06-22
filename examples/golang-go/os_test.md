# Package os_test

## Index

* [Constants](#const)
    * [const executable_EnvVar](#executable_EnvVar)
    * [const testExecutableDeletion](#testExecutableDeletion)
* [Variables](#var)
    * [var expandTests](#expandTests)
    * [var global](#global)
    * [var setenvEinvalTests](#setenvEinvalTests)
    * [var shellSpecialVarTests](#shellSpecialVarTests)
    * [var isExistTests](#isExistTests)
    * [var isPermissionTests](#isPermissionTests)
    * [var dot](#dot)
    * [var sysdir](#sysdir)
    * [var sfdir](#sfdir)
    * [var sfname](#sfname)
    * [var openErrorTests](#openErrorTests)
    * [var testLargeWrite](#testLargeWrite)
    * [var nilFileMethodTests](#nilFileMethodTests)
    * [var isReadonlyError](#isReadonlyError)
    * [var noDeadline](#noDeadline)
    * [var readTimeoutTests](#readTimeoutTests)
    * [var writeTimeoutTests](#writeTimeoutTests)
* [Types](#type)
    * [type isExistTest struct](#isExistTest)
    * [type isPermissionTest struct](#isPermissionTest)
    * [type myErrorIs struct](#myErrorIs)
        * [func (e myErrorIs) Is(target error) bool](#myErrorIs.Is)
    * [type sysDir struct](#sysDir)
    * [type openErrorTest struct](#openErrorTest)
    * [type syscallDescriptor int](#syscallDescriptor)
    * [type neverEnding byte](#neverEnding)
        * [func (b neverEnding) Read(p []byte) (int, error)](#neverEnding.Read)
* [Functions](#func)
    * [func testGetenv(s string) string](#testGetenv)
    * [func TestExpand(t *testing.T)](#TestExpand)
    * [func BenchmarkExpand(b *testing.B)](#BenchmarkExpand)
    * [func TestConsistentEnviron(t *testing.T)](#TestConsistentEnviron)
    * [func TestUnsetenv(t *testing.T)](#TestUnsetenv)
    * [func TestClearenv(t *testing.T)](#TestClearenv)
    * [func TestLookupEnv(t *testing.T)](#TestLookupEnv)
    * [func TestSetenvUnixEinval(t *testing.T)](#TestSetenvUnixEinval)
    * [func TestExpandEnvShellSpecialVar(t *testing.T)](#TestExpandEnvShellSpecialVar)
    * [func TestErrIsExist(t *testing.T)](#TestErrIsExist)
    * [func testErrNotExist(t *testing.T, name string) string](#testErrNotExist)
    * [func TestErrIsNotExist(t *testing.T)](#TestErrIsNotExist)
    * [func checkErrorPredicate(predName string, pred func(error) bool, err, target error) string](#checkErrorPredicate)
    * [func TestIsExist(t *testing.T)](#TestIsExist)
    * [func TestIsPermission(t *testing.T)](#TestIsPermission)
    * [func TestErrPathNUL(t *testing.T)](#TestErrPathNUL)
    * [func TestPathErrorUnwrap(t *testing.T)](#TestPathErrorUnwrap)
    * [func TestErrorIsMethods(t *testing.T)](#TestErrorIsMethods)
    * [func init()](#init)
    * [func ExampleOpenFile()](#ExampleOpenFile)
    * [func ExampleOpenFile_append()](#ExampleOpenFile_append)
    * [func ExampleChmod()](#ExampleChmod)
    * [func ExampleChtimes()](#ExampleChtimes)
    * [func ExampleFileMode()](#ExampleFileMode)
    * [func ExampleIsNotExist()](#ExampleIsNotExist)
    * [func ExampleExpand()](#ExampleExpand)
    * [func ExampleExpandEnv()](#ExampleExpandEnv)
    * [func ExampleLookupEnv()](#ExampleLookupEnv)
    * [func ExampleGetenv()](#ExampleGetenv)
    * [func ExampleUnsetenv()](#ExampleUnsetenv)
    * [func ExampleReadDir()](#ExampleReadDir)
    * [func ExampleMkdirTemp()](#ExampleMkdirTemp)
    * [func ExampleMkdirTemp_suffix()](#ExampleMkdirTemp_suffix)
    * [func ExampleCreateTemp()](#ExampleCreateTemp)
    * [func ExampleCreateTemp_suffix()](#ExampleCreateTemp_suffix)
    * [func ExampleReadFile()](#ExampleReadFile)
    * [func ExampleWriteFile()](#ExampleWriteFile)
    * [func TestErrProcessDone(t *testing.T)](#TestErrProcessDone)
    * [func TestExecutable(t *testing.T)](#TestExecutable)
    * [func sameFile(fn1, fn2 string) bool](#sameFile)
    * [func init()](#init)
    * [func TestExecutableDeleted(t *testing.T)](#TestExecutableDeleted)
    * [func TestFifoEOF(t *testing.T)](#TestFifoEOF)
    * [func size(name string, t *testing.T) int64](#size)
    * [func equal(name1, name2 string) (r bool)](#equal)
    * [func localTmp() string](#localTmp)
    * [func newFile(testName string, t *testing.T) (f *File)](#newFile)
    * [func newDir(testName string, t *testing.T) (name string)](#newDir)
    * [func TestStat(t *testing.T)](#TestStat)
    * [func TestStatError(t *testing.T)](#TestStatError)
    * [func TestFstat(t *testing.T)](#TestFstat)
    * [func TestLstat(t *testing.T)](#TestLstat)
    * [func TestRead0(t *testing.T)](#TestRead0)
    * [func TestReadClosed(t *testing.T)](#TestReadClosed)
    * [func testReaddirnames(dir string, contents []string, t *testing.T)](#testReaddirnames)
    * [func testReaddir(dir string, contents []string, t *testing.T)](#testReaddir)
    * [func testReadDir(dir string, contents []string, t *testing.T)](#testReadDir)
    * [func TestFileReaddirnames(t *testing.T)](#TestFileReaddirnames)
    * [func TestFileReaddir(t *testing.T)](#TestFileReaddir)
    * [func TestFileReadDir(t *testing.T)](#TestFileReadDir)
    * [func benchmarkReaddirname(path string, b *testing.B)](#benchmarkReaddirname)
    * [func benchmarkReaddir(path string, b *testing.B)](#benchmarkReaddir)
    * [func benchmarkReadDir(path string, b *testing.B)](#benchmarkReadDir)
    * [func BenchmarkReaddirname(b *testing.B)](#BenchmarkReaddirname)
    * [func BenchmarkReaddir(b *testing.B)](#BenchmarkReaddir)
    * [func BenchmarkReadDir(b *testing.B)](#BenchmarkReadDir)
    * [func benchmarkStat(b *testing.B, path string)](#benchmarkStat)
    * [func benchmarkLstat(b *testing.B, path string)](#benchmarkLstat)
    * [func BenchmarkStatDot(b *testing.B)](#BenchmarkStatDot)
    * [func BenchmarkStatFile(b *testing.B)](#BenchmarkStatFile)
    * [func BenchmarkStatDir(b *testing.B)](#BenchmarkStatDir)
    * [func BenchmarkLstatDot(b *testing.B)](#BenchmarkLstatDot)
    * [func BenchmarkLstatFile(b *testing.B)](#BenchmarkLstatFile)
    * [func BenchmarkLstatDir(b *testing.B)](#BenchmarkLstatDir)
    * [func smallReaddirnames(file *File, length int, t *testing.T) []string](#smallReaddirnames)
    * [func TestReaddirnamesOneAtATime(t *testing.T)](#TestReaddirnamesOneAtATime)
    * [func TestReaddirNValues(t *testing.T)](#TestReaddirNValues)
    * [func touch(t *testing.T, name string)](#touch)
    * [func TestReaddirStatFailures(t *testing.T)](#TestReaddirStatFailures)
    * [func TestReaddirOfFile(t *testing.T)](#TestReaddirOfFile)
    * [func TestHardLink(t *testing.T)](#TestHardLink)
    * [func chtmpdir(t *testing.T) func()](#chtmpdir)
    * [func TestSymlink(t *testing.T)](#TestSymlink)
    * [func TestLongSymlink(t *testing.T)](#TestLongSymlink)
    * [func TestRename(t *testing.T)](#TestRename)
    * [func TestRenameOverwriteDest(t *testing.T)](#TestRenameOverwriteDest)
    * [func TestRenameFailed(t *testing.T)](#TestRenameFailed)
    * [func TestRenameNotExisting(t *testing.T)](#TestRenameNotExisting)
    * [func TestRenameToDirFailed(t *testing.T)](#TestRenameToDirFailed)
    * [func TestRenameCaseDifference(pt *testing.T)](#TestRenameCaseDifference)
    * [func exec(t *testing.T, dir, cmd string, args []string, expect string)](#exec)
    * [func TestStartProcess(t *testing.T)](#TestStartProcess)
    * [func checkMode(t *testing.T, path string, mode FileMode)](#checkMode)
    * [func TestChmod(t *testing.T)](#TestChmod)
    * [func checkSize(t *testing.T, f *File, size int64)](#checkSize)
    * [func TestFTruncate(t *testing.T)](#TestFTruncate)
    * [func TestTruncate(t *testing.T)](#TestTruncate)
    * [func TestChtimes(t *testing.T)](#TestChtimes)
    * [func TestChtimesDir(t *testing.T)](#TestChtimesDir)
    * [func testChtimes(t *testing.T, name string)](#testChtimes)
    * [func TestFileChdir(t *testing.T)](#TestFileChdir)
    * [func TestChdirAndGetwd(t *testing.T)](#TestChdirAndGetwd)
    * [func TestProgWideChdir(t *testing.T)](#TestProgWideChdir)
    * [func TestSeek(t *testing.T)](#TestSeek)
    * [func TestSeekError(t *testing.T)](#TestSeekError)
    * [func TestOpenError(t *testing.T)](#TestOpenError)
    * [func TestOpenNoName(t *testing.T)](#TestOpenNoName)
    * [func runBinHostname(t *testing.T) string](#runBinHostname)
    * [func testWindowsHostname(t *testing.T, hostname string)](#testWindowsHostname)
    * [func TestHostname(t *testing.T)](#TestHostname)
    * [func TestReadAt(t *testing.T)](#TestReadAt)
    * [func TestReadAtOffset(t *testing.T)](#TestReadAtOffset)
    * [func TestReadAtNegativeOffset(t *testing.T)](#TestReadAtNegativeOffset)
    * [func TestWriteAt(t *testing.T)](#TestWriteAt)
    * [func TestWriteAtNegativeOffset(t *testing.T)](#TestWriteAtNegativeOffset)
    * [func TestWriteAtInAppendMode(t *testing.T)](#TestWriteAtInAppendMode)
    * [func writeFile(t *testing.T, fname string, flag int, text string) string](#writeFile)
    * [func TestAppend(t *testing.T)](#TestAppend)
    * [func TestStatDirWithTrailingSlash(t *testing.T)](#TestStatDirWithTrailingSlash)
    * [func TestNilProcessStateString(t *testing.T)](#TestNilProcessStateString)
    * [func TestSameFile(t *testing.T)](#TestSameFile)
    * [func testDevNullFileInfo(t *testing.T, statname, devNullName string, fi FileInfo, ignoreCase bool)](#testDevNullFileInfo)
    * [func testDevNullFile(t *testing.T, devNullName string, ignoreCase bool)](#testDevNullFile)
    * [func TestDevNullFile(t *testing.T)](#TestDevNullFile)
    * [func TestLargeWriteToConsole(t *testing.T)](#TestLargeWriteToConsole)
    * [func TestStatDirModeExec(t *testing.T)](#TestStatDirModeExec)
    * [func TestStatStdin(t *testing.T)](#TestStatStdin)
    * [func TestStatRelativeSymlink(t *testing.T)](#TestStatRelativeSymlink)
    * [func TestReadAtEOF(t *testing.T)](#TestReadAtEOF)
    * [func TestLongPath(t *testing.T)](#TestLongPath)
    * [func testKillProcess(t *testing.T, processKiller func(p *Process))](#testKillProcess)
    * [func TestSleep(t *testing.T)](#TestSleep)
    * [func TestKillStartProcess(t *testing.T)](#TestKillStartProcess)
    * [func TestGetppid(t *testing.T)](#TestGetppid)
    * [func TestKillFindProcess(t *testing.T)](#TestKillFindProcess)
    * [func TestNilFileMethods(t *testing.T)](#TestNilFileMethods)
    * [func mkdirTree(t *testing.T, root string, level, max int)](#mkdirTree)
    * [func TestRemoveAllRace(t *testing.T)](#TestRemoveAllRace)
    * [func TestPipeThreads(t *testing.T)](#TestPipeThreads)
    * [func testDoubleCloseError(t *testing.T, path string)](#testDoubleCloseError)
    * [func TestDoubleCloseError(t *testing.T)](#TestDoubleCloseError)
    * [func TestUserHomeDir(t *testing.T)](#TestUserHomeDir)
    * [func TestDirSeek(t *testing.T)](#TestDirSeek)
    * [func TestReaddirSmallSeek(t *testing.T)](#TestReaddirSmallSeek)
    * [func isDeadlineExceeded(err error) bool](#isDeadlineExceeded)
    * [func TestOpenFileKeepsPermissions(t *testing.T)](#TestOpenFileKeepsPermissions)
    * [func TestDirFS(t *testing.T)](#TestDirFS)
    * [func TestDirFSPathsValid(t *testing.T)](#TestDirFSPathsValid)
    * [func TestReadFileProc(t *testing.T)](#TestReadFileProc)
    * [func TestWriteStringAlloc(t *testing.T)](#TestWriteStringAlloc)
    * [func init()](#init)
    * [func checkUidGid(t *testing.T, path string, uid, gid int)](#checkUidGid)
    * [func TestChown(t *testing.T)](#TestChown)
    * [func TestFileChown(t *testing.T)](#TestFileChown)
    * [func TestLchown(t *testing.T)](#TestLchown)
    * [func TestReaddirRemoveRace(t *testing.T)](#TestReaddirRemoveRace)
    * [func TestMkdirStickyUmask(t *testing.T)](#TestMkdirStickyUmask)
    * [func newFileTest(t *testing.T, blocking bool)](#newFileTest)
    * [func TestNewFileBlock(t *testing.T)](#TestNewFileBlock)
    * [func TestNewFileNonBlock(t *testing.T)](#TestNewFileNonBlock)
    * [func TestSplitPath(t *testing.T)](#TestSplitPath)
    * [func TestMkdirAll(t *testing.T)](#TestMkdirAll)
    * [func TestMkdirAllWithSymlink(t *testing.T)](#TestMkdirAllWithSymlink)
    * [func TestMkdirAllAtSlash(t *testing.T)](#TestMkdirAllAtSlash)
    * [func TestEPIPE(t *testing.T)](#TestEPIPE)
    * [func TestStdPipe(t *testing.T)](#TestStdPipe)
    * [func TestStdPipeHelper(t *testing.T)](#TestStdPipeHelper)
    * [func testClosedPipeRace(t *testing.T, read bool)](#testClosedPipeRace)
    * [func TestClosedPipeRaceRead(t *testing.T)](#TestClosedPipeRaceRead)
    * [func TestClosedPipeRaceWrite(t *testing.T)](#TestClosedPipeRaceWrite)
    * [func TestReadNonblockingFd(t *testing.T)](#TestReadNonblockingFd)
    * [func TestCloseWithBlockingReadByNewFile(t *testing.T)](#TestCloseWithBlockingReadByNewFile)
    * [func TestCloseWithBlockingReadByFd(t *testing.T)](#TestCloseWithBlockingReadByFd)
    * [func testCloseWithBlockingRead(t *testing.T, r, w *os.File)](#testCloseWithBlockingRead)
    * [func TestPipeEOF(t *testing.T)](#TestPipeEOF)
    * [func TestFdRace(t *testing.T)](#TestFdRace)
    * [func TestFdReadRace(t *testing.T)](#TestFdReadRace)
    * [func TestRawConnReadWrite(t *testing.T)](#TestRawConnReadWrite)
    * [func checkNamedSize(t *testing.T, path string, size int64)](#checkNamedSize)
    * [func TestReadFile(t *testing.T)](#TestReadFile)
    * [func TestWriteFile(t *testing.T)](#TestWriteFile)
    * [func TestReadOnlyWriteFile(t *testing.T)](#TestReadOnlyWriteFile)
    * [func TestReadDir(t *testing.T)](#TestReadDir)
    * [func TestRemoveAll(t *testing.T)](#TestRemoveAll)
    * [func TestRemoveAllLarge(t *testing.T)](#TestRemoveAllLarge)
    * [func TestRemoveAllLongPath(t *testing.T)](#TestRemoveAllLongPath)
    * [func TestRemoveAllDot(t *testing.T)](#TestRemoveAllDot)
    * [func TestRemoveAllDotDot(t *testing.T)](#TestRemoveAllDotDot)
    * [func TestRemoveReadOnlyDir(t *testing.T)](#TestRemoveReadOnlyDir)
    * [func TestRemoveAllButReadOnlyAndPathError(t *testing.T)](#TestRemoveAllButReadOnlyAndPathError)
    * [func TestRemoveUnreadableDir(t *testing.T)](#TestRemoveUnreadableDir)
    * [func TestRemoveAllWithMoreErrorThanReqSize(t *testing.T)](#TestRemoveAllWithMoreErrorThanReqSize)
    * [func testStatAndLstat(t *testing.T, path string, isLink bool, statCheck, lstatCheck func(*testing.T, string, fs.FileInfo))](#testStatAndLstat)
    * [func testIsDir(t *testing.T, path string, fi fs.FileInfo)](#testIsDir)
    * [func testIsSymlink(t *testing.T, path string, fi fs.FileInfo)](#testIsSymlink)
    * [func testIsFile(t *testing.T, path string, fi fs.FileInfo)](#testIsFile)
    * [func testDirStats(t *testing.T, path string)](#testDirStats)
    * [func testFileStats(t *testing.T, path string)](#testFileStats)
    * [func testSymlinkStats(t *testing.T, path string, isdir bool)](#testSymlinkStats)
    * [func testSymlinkSameFile(t *testing.T, path, link string)](#testSymlinkSameFile)
    * [func TestDirAndSymlinkStats(t *testing.T)](#TestDirAndSymlinkStats)
    * [func TestFileAndSymlinkStats(t *testing.T)](#TestFileAndSymlinkStats)
    * [func TestSymlinkWithTrailingSlash(t *testing.T)](#TestSymlinkWithTrailingSlash)
    * [func TestCreateTemp(t *testing.T)](#TestCreateTemp)
    * [func TestCreateTempPattern(t *testing.T)](#TestCreateTempPattern)
    * [func TestCreateTempBadPattern(t *testing.T)](#TestCreateTempBadPattern)
    * [func TestMkdirTemp(t *testing.T)](#TestMkdirTemp)
    * [func TestMkdirTempBadDir(t *testing.T)](#TestMkdirTempBadDir)
    * [func TestMkdirTempBadPattern(t *testing.T)](#TestMkdirTempBadPattern)
    * [func TestNonpollableDeadline(t *testing.T)](#TestNonpollableDeadline)
    * [func TestReadTimeout(t *testing.T)](#TestReadTimeout)
    * [func TestReadTimeoutMustNotReturn(t *testing.T)](#TestReadTimeoutMustNotReturn)
    * [func TestWriteTimeout(t *testing.T)](#TestWriteTimeout)
    * [func TestWriteTimeoutMustNotReturn(t *testing.T)](#TestWriteTimeoutMustNotReturn)
    * [func timeoutReader(r *os.File, d, min, max time.Duration, ch chan<- error)](#timeoutReader)
    * [func TestReadTimeoutFluctuation(t *testing.T)](#TestReadTimeoutFluctuation)
    * [func timeoutWriter(w *os.File, d, min, max time.Duration, ch chan<- error)](#timeoutWriter)
    * [func TestWriteTimeoutFluctuation(t *testing.T)](#TestWriteTimeoutFluctuation)
    * [func TestVariousDeadlines(t *testing.T)](#TestVariousDeadlines)
    * [func TestVariousDeadlines1Proc(t *testing.T)](#TestVariousDeadlines1Proc)
    * [func TestVariousDeadlines4Proc(t *testing.T)](#TestVariousDeadlines4Proc)
    * [func testVariousDeadlines(t *testing.T)](#testVariousDeadlines)
    * [func TestReadWriteDeadlineRace(t *testing.T)](#TestReadWriteDeadlineRace)
    * [func TestRacyRead(t *testing.T)](#TestRacyRead)
    * [func TestRacyWrite(t *testing.T)](#TestRacyWrite)
    * [func TestTTYClose(t *testing.T)](#TestTTYClose)


## <a id="const" href="#const">Constants</a>

### <a id="executable_EnvVar" href="#executable_EnvVar">const executable_EnvVar</a>

```
searchKey: os_test.executable_EnvVar
```

```Go
const executable_EnvVar = "OSTEST_OUTPUT_EXECPATH"
```

### <a id="testExecutableDeletion" href="#testExecutableDeletion">const testExecutableDeletion</a>

```
searchKey: os_test.testExecutableDeletion
```

```Go
const testExecutableDeletion = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="expandTests" href="#expandTests">var expandTests</a>

```
searchKey: os_test.expandTests
```

```Go
var expandTests = ...
```

### <a id="global" href="#global">var global</a>

```
searchKey: os_test.global
```

```Go
var global interface{}
```

### <a id="setenvEinvalTests" href="#setenvEinvalTests">var setenvEinvalTests</a>

```
searchKey: os_test.setenvEinvalTests
```

```Go
var setenvEinvalTests = ...
```

### <a id="shellSpecialVarTests" href="#shellSpecialVarTests">var shellSpecialVarTests</a>

```
searchKey: os_test.shellSpecialVarTests
```

```Go
var shellSpecialVarTests = ...
```

### <a id="isExistTests" href="#isExistTests">var isExistTests</a>

```
searchKey: os_test.isExistTests
```

```Go
var isExistTests = ...
```

### <a id="isPermissionTests" href="#isPermissionTests">var isPermissionTests</a>

```
searchKey: os_test.isPermissionTests
```

```Go
var isPermissionTests = ...
```

### <a id="dot" href="#dot">var dot</a>

```
searchKey: os_test.dot
```

```Go
var dot = ...
```

### <a id="sysdir" href="#sysdir">var sysdir</a>

```
searchKey: os_test.sysdir
```

```Go
var sysdir = ...
```

### <a id="sfdir" href="#sfdir">var sfdir</a>

```
searchKey: os_test.sfdir
```

```Go
var sfdir = sysdir.name
```

### <a id="sfname" href="#sfname">var sfname</a>

```
searchKey: os_test.sfname
```

```Go
var sfname = sysdir.files[0]
```

### <a id="openErrorTests" href="#openErrorTests">var openErrorTests</a>

```
searchKey: os_test.openErrorTests
```

```Go
var openErrorTests = ...
```

### <a id="testLargeWrite" href="#testLargeWrite">var testLargeWrite</a>

```
searchKey: os_test.testLargeWrite
```

```Go
var testLargeWrite = ...
```

### <a id="nilFileMethodTests" href="#nilFileMethodTests">var nilFileMethodTests</a>

```
searchKey: os_test.nilFileMethodTests
```

```Go
var nilFileMethodTests = ...
```

### <a id="isReadonlyError" href="#isReadonlyError">var isReadonlyError</a>

```
searchKey: os_test.isReadonlyError
```

```Go
var isReadonlyError = func(error) bool { return false }
```

### <a id="noDeadline" href="#noDeadline">var noDeadline</a>

```
searchKey: os_test.noDeadline
```

```Go
var noDeadline time.Time
```

noDeadline is a zero time.Time value, which cancels a deadline. 

### <a id="readTimeoutTests" href="#readTimeoutTests">var readTimeoutTests</a>

```
searchKey: os_test.readTimeoutTests
```

```Go
var readTimeoutTests = ...
```

### <a id="writeTimeoutTests" href="#writeTimeoutTests">var writeTimeoutTests</a>

```
searchKey: os_test.writeTimeoutTests
```

```Go
var writeTimeoutTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="isExistTest" href="#isExistTest">type isExistTest struct</a>

```
searchKey: os_test.isExistTest
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
```

```Go
type myErrorIs struct{ error }
```

#### <a id="myErrorIs.Is" href="#myErrorIs.Is">func (e myErrorIs) Is(target error) bool</a>

```
searchKey: os_test.myErrorIs.Is
```

```Go
func (e myErrorIs) Is(target error) bool
```

### <a id="sysDir" href="#sysDir">type sysDir struct</a>

```
searchKey: os_test.sysDir
```

```Go
type sysDir struct {
	name  string
	files []string
}
```

### <a id="openErrorTest" href="#openErrorTest">type openErrorTest struct</a>

```
searchKey: os_test.openErrorTest
```

```Go
type openErrorTest struct {
	path  string
	mode  int
	error error
}
```

### <a id="syscallDescriptor" href="#syscallDescriptor">type syscallDescriptor int</a>

```
searchKey: os_test.syscallDescriptor
```

```Go
type syscallDescriptor = int
```

For TestRawConnReadWrite. 

### <a id="neverEnding" href="#neverEnding">type neverEnding byte</a>

```
searchKey: os_test.neverEnding
```

```Go
type neverEnding byte
```

#### <a id="neverEnding.Read" href="#neverEnding.Read">func (b neverEnding) Read(p []byte) (int, error)</a>

```
searchKey: os_test.neverEnding.Read
```

```Go
func (b neverEnding) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="testGetenv" href="#testGetenv">func testGetenv(s string) string</a>

```
searchKey: os_test.testGetenv
```

```Go
func testGetenv(s string) string
```

testGetenv gives us a controlled set of variables for testing Expand. 

### <a id="TestExpand" href="#TestExpand">func TestExpand(t *testing.T)</a>

```
searchKey: os_test.TestExpand
```

```Go
func TestExpand(t *testing.T)
```

### <a id="BenchmarkExpand" href="#BenchmarkExpand">func BenchmarkExpand(b *testing.B)</a>

```
searchKey: os_test.BenchmarkExpand
```

```Go
func BenchmarkExpand(b *testing.B)
```

### <a id="TestConsistentEnviron" href="#TestConsistentEnviron">func TestConsistentEnviron(t *testing.T)</a>

```
searchKey: os_test.TestConsistentEnviron
```

```Go
func TestConsistentEnviron(t *testing.T)
```

### <a id="TestUnsetenv" href="#TestUnsetenv">func TestUnsetenv(t *testing.T)</a>

```
searchKey: os_test.TestUnsetenv
```

```Go
func TestUnsetenv(t *testing.T)
```

### <a id="TestClearenv" href="#TestClearenv">func TestClearenv(t *testing.T)</a>

```
searchKey: os_test.TestClearenv
```

```Go
func TestClearenv(t *testing.T)
```

### <a id="TestLookupEnv" href="#TestLookupEnv">func TestLookupEnv(t *testing.T)</a>

```
searchKey: os_test.TestLookupEnv
```

```Go
func TestLookupEnv(t *testing.T)
```

### <a id="TestSetenvUnixEinval" href="#TestSetenvUnixEinval">func TestSetenvUnixEinval(t *testing.T)</a>

```
searchKey: os_test.TestSetenvUnixEinval
```

```Go
func TestSetenvUnixEinval(t *testing.T)
```

### <a id="TestExpandEnvShellSpecialVar" href="#TestExpandEnvShellSpecialVar">func TestExpandEnvShellSpecialVar(t *testing.T)</a>

```
searchKey: os_test.TestExpandEnvShellSpecialVar
```

```Go
func TestExpandEnvShellSpecialVar(t *testing.T)
```

### <a id="TestErrIsExist" href="#TestErrIsExist">func TestErrIsExist(t *testing.T)</a>

```
searchKey: os_test.TestErrIsExist
```

```Go
func TestErrIsExist(t *testing.T)
```

### <a id="testErrNotExist" href="#testErrNotExist">func testErrNotExist(t *testing.T, name string) string</a>

```
searchKey: os_test.testErrNotExist
```

```Go
func testErrNotExist(t *testing.T, name string) string
```

### <a id="TestErrIsNotExist" href="#TestErrIsNotExist">func TestErrIsNotExist(t *testing.T)</a>

```
searchKey: os_test.TestErrIsNotExist
```

```Go
func TestErrIsNotExist(t *testing.T)
```

### <a id="checkErrorPredicate" href="#checkErrorPredicate">func checkErrorPredicate(predName string, pred func(error) bool, err, target error) string</a>

```
searchKey: os_test.checkErrorPredicate
```

```Go
func checkErrorPredicate(predName string, pred func(error) bool, err, target error) string
```

### <a id="TestIsExist" href="#TestIsExist">func TestIsExist(t *testing.T)</a>

```
searchKey: os_test.TestIsExist
```

```Go
func TestIsExist(t *testing.T)
```

### <a id="TestIsPermission" href="#TestIsPermission">func TestIsPermission(t *testing.T)</a>

```
searchKey: os_test.TestIsPermission
```

```Go
func TestIsPermission(t *testing.T)
```

### <a id="TestErrPathNUL" href="#TestErrPathNUL">func TestErrPathNUL(t *testing.T)</a>

```
searchKey: os_test.TestErrPathNUL
```

```Go
func TestErrPathNUL(t *testing.T)
```

### <a id="TestPathErrorUnwrap" href="#TestPathErrorUnwrap">func TestPathErrorUnwrap(t *testing.T)</a>

```
searchKey: os_test.TestPathErrorUnwrap
```

```Go
func TestPathErrorUnwrap(t *testing.T)
```

### <a id="TestErrorIsMethods" href="#TestErrorIsMethods">func TestErrorIsMethods(t *testing.T)</a>

```
searchKey: os_test.TestErrorIsMethods
```

```Go
func TestErrorIsMethods(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: os_test.init
```

```Go
func init()
```

### <a id="ExampleOpenFile" href="#ExampleOpenFile">func ExampleOpenFile()</a>

```
searchKey: os_test.ExampleOpenFile
```

```Go
func ExampleOpenFile()
```

### <a id="ExampleOpenFile_append" href="#ExampleOpenFile_append">func ExampleOpenFile_append()</a>

```
searchKey: os_test.ExampleOpenFile_append
```

```Go
func ExampleOpenFile_append()
```

### <a id="ExampleChmod" href="#ExampleChmod">func ExampleChmod()</a>

```
searchKey: os_test.ExampleChmod
```

```Go
func ExampleChmod()
```

### <a id="ExampleChtimes" href="#ExampleChtimes">func ExampleChtimes()</a>

```
searchKey: os_test.ExampleChtimes
```

```Go
func ExampleChtimes()
```

### <a id="ExampleFileMode" href="#ExampleFileMode">func ExampleFileMode()</a>

```
searchKey: os_test.ExampleFileMode
```

```Go
func ExampleFileMode()
```

### <a id="ExampleIsNotExist" href="#ExampleIsNotExist">func ExampleIsNotExist()</a>

```
searchKey: os_test.ExampleIsNotExist
```

```Go
func ExampleIsNotExist()
```

### <a id="ExampleExpand" href="#ExampleExpand">func ExampleExpand()</a>

```
searchKey: os_test.ExampleExpand
```

```Go
func ExampleExpand()
```

### <a id="ExampleExpandEnv" href="#ExampleExpandEnv">func ExampleExpandEnv()</a>

```
searchKey: os_test.ExampleExpandEnv
```

```Go
func ExampleExpandEnv()
```

### <a id="ExampleLookupEnv" href="#ExampleLookupEnv">func ExampleLookupEnv()</a>

```
searchKey: os_test.ExampleLookupEnv
```

```Go
func ExampleLookupEnv()
```

### <a id="ExampleGetenv" href="#ExampleGetenv">func ExampleGetenv()</a>

```
searchKey: os_test.ExampleGetenv
```

```Go
func ExampleGetenv()
```

### <a id="ExampleUnsetenv" href="#ExampleUnsetenv">func ExampleUnsetenv()</a>

```
searchKey: os_test.ExampleUnsetenv
```

```Go
func ExampleUnsetenv()
```

### <a id="ExampleReadDir" href="#ExampleReadDir">func ExampleReadDir()</a>

```
searchKey: os_test.ExampleReadDir
```

```Go
func ExampleReadDir()
```

### <a id="ExampleMkdirTemp" href="#ExampleMkdirTemp">func ExampleMkdirTemp()</a>

```
searchKey: os_test.ExampleMkdirTemp
```

```Go
func ExampleMkdirTemp()
```

### <a id="ExampleMkdirTemp_suffix" href="#ExampleMkdirTemp_suffix">func ExampleMkdirTemp_suffix()</a>

```
searchKey: os_test.ExampleMkdirTemp_suffix
```

```Go
func ExampleMkdirTemp_suffix()
```

### <a id="ExampleCreateTemp" href="#ExampleCreateTemp">func ExampleCreateTemp()</a>

```
searchKey: os_test.ExampleCreateTemp
```

```Go
func ExampleCreateTemp()
```

### <a id="ExampleCreateTemp_suffix" href="#ExampleCreateTemp_suffix">func ExampleCreateTemp_suffix()</a>

```
searchKey: os_test.ExampleCreateTemp_suffix
```

```Go
func ExampleCreateTemp_suffix()
```

### <a id="ExampleReadFile" href="#ExampleReadFile">func ExampleReadFile()</a>

```
searchKey: os_test.ExampleReadFile
```

```Go
func ExampleReadFile()
```

### <a id="ExampleWriteFile" href="#ExampleWriteFile">func ExampleWriteFile()</a>

```
searchKey: os_test.ExampleWriteFile
```

```Go
func ExampleWriteFile()
```

### <a id="TestErrProcessDone" href="#TestErrProcessDone">func TestErrProcessDone(t *testing.T)</a>

```
searchKey: os_test.TestErrProcessDone
```

```Go
func TestErrProcessDone(t *testing.T)
```

### <a id="TestExecutable" href="#TestExecutable">func TestExecutable(t *testing.T)</a>

```
searchKey: os_test.TestExecutable
```

```Go
func TestExecutable(t *testing.T)
```

### <a id="sameFile" href="#sameFile">func sameFile(fn1, fn2 string) bool</a>

```
searchKey: os_test.sameFile
```

```Go
func sameFile(fn1, fn2 string) bool
```

### <a id="init" href="#init">func init()</a>

```
searchKey: os_test.init
```

```Go
func init()
```

### <a id="TestExecutableDeleted" href="#TestExecutableDeleted">func TestExecutableDeleted(t *testing.T)</a>

```
searchKey: os_test.TestExecutableDeleted
```

```Go
func TestExecutableDeleted(t *testing.T)
```

### <a id="TestFifoEOF" href="#TestFifoEOF">func TestFifoEOF(t *testing.T)</a>

```
searchKey: os_test.TestFifoEOF
```

```Go
func TestFifoEOF(t *testing.T)
```

Issue 24164. 

### <a id="size" href="#size">func size(name string, t *testing.T) int64</a>

```
searchKey: os_test.size
```

```Go
func size(name string, t *testing.T) int64
```

### <a id="equal" href="#equal">func equal(name1, name2 string) (r bool)</a>

```
searchKey: os_test.equal
```

```Go
func equal(name1, name2 string) (r bool)
```

### <a id="localTmp" href="#localTmp">func localTmp() string</a>

```
searchKey: os_test.localTmp
```

```Go
func localTmp() string
```

localTmp returns a local temporary directory not on NFS. 

### <a id="newFile" href="#newFile">func newFile(testName string, t *testing.T) (f *File)</a>

```
searchKey: os_test.newFile
```

```Go
func newFile(testName string, t *testing.T) (f *File)
```

### <a id="newDir" href="#newDir">func newDir(testName string, t *testing.T) (name string)</a>

```
searchKey: os_test.newDir
```

```Go
func newDir(testName string, t *testing.T) (name string)
```

### <a id="TestStat" href="#TestStat">func TestStat(t *testing.T)</a>

```
searchKey: os_test.TestStat
```

```Go
func TestStat(t *testing.T)
```

### <a id="TestStatError" href="#TestStatError">func TestStatError(t *testing.T)</a>

```
searchKey: os_test.TestStatError
```

```Go
func TestStatError(t *testing.T)
```

### <a id="TestFstat" href="#TestFstat">func TestFstat(t *testing.T)</a>

```
searchKey: os_test.TestFstat
```

```Go
func TestFstat(t *testing.T)
```

### <a id="TestLstat" href="#TestLstat">func TestLstat(t *testing.T)</a>

```
searchKey: os_test.TestLstat
```

```Go
func TestLstat(t *testing.T)
```

### <a id="TestRead0" href="#TestRead0">func TestRead0(t *testing.T)</a>

```
searchKey: os_test.TestRead0
```

```Go
func TestRead0(t *testing.T)
```

Read with length 0 should not return EOF. 

### <a id="TestReadClosed" href="#TestReadClosed">func TestReadClosed(t *testing.T)</a>

```
searchKey: os_test.TestReadClosed
```

```Go
func TestReadClosed(t *testing.T)
```

Reading a closed file should return ErrClosed error 

### <a id="testReaddirnames" href="#testReaddirnames">func testReaddirnames(dir string, contents []string, t *testing.T)</a>

```
searchKey: os_test.testReaddirnames
```

```Go
func testReaddirnames(dir string, contents []string, t *testing.T)
```

### <a id="testReaddir" href="#testReaddir">func testReaddir(dir string, contents []string, t *testing.T)</a>

```
searchKey: os_test.testReaddir
```

```Go
func testReaddir(dir string, contents []string, t *testing.T)
```

### <a id="testReadDir" href="#testReadDir">func testReadDir(dir string, contents []string, t *testing.T)</a>

```
searchKey: os_test.testReadDir
```

```Go
func testReadDir(dir string, contents []string, t *testing.T)
```

### <a id="TestFileReaddirnames" href="#TestFileReaddirnames">func TestFileReaddirnames(t *testing.T)</a>

```
searchKey: os_test.TestFileReaddirnames
```

```Go
func TestFileReaddirnames(t *testing.T)
```

### <a id="TestFileReaddir" href="#TestFileReaddir">func TestFileReaddir(t *testing.T)</a>

```
searchKey: os_test.TestFileReaddir
```

```Go
func TestFileReaddir(t *testing.T)
```

### <a id="TestFileReadDir" href="#TestFileReadDir">func TestFileReadDir(t *testing.T)</a>

```
searchKey: os_test.TestFileReadDir
```

```Go
func TestFileReadDir(t *testing.T)
```

### <a id="benchmarkReaddirname" href="#benchmarkReaddirname">func benchmarkReaddirname(path string, b *testing.B)</a>

```
searchKey: os_test.benchmarkReaddirname
```

```Go
func benchmarkReaddirname(path string, b *testing.B)
```

### <a id="benchmarkReaddir" href="#benchmarkReaddir">func benchmarkReaddir(path string, b *testing.B)</a>

```
searchKey: os_test.benchmarkReaddir
```

```Go
func benchmarkReaddir(path string, b *testing.B)
```

### <a id="benchmarkReadDir" href="#benchmarkReadDir">func benchmarkReadDir(path string, b *testing.B)</a>

```
searchKey: os_test.benchmarkReadDir
```

```Go
func benchmarkReadDir(path string, b *testing.B)
```

### <a id="BenchmarkReaddirname" href="#BenchmarkReaddirname">func BenchmarkReaddirname(b *testing.B)</a>

```
searchKey: os_test.BenchmarkReaddirname
```

```Go
func BenchmarkReaddirname(b *testing.B)
```

### <a id="BenchmarkReaddir" href="#BenchmarkReaddir">func BenchmarkReaddir(b *testing.B)</a>

```
searchKey: os_test.BenchmarkReaddir
```

```Go
func BenchmarkReaddir(b *testing.B)
```

### <a id="BenchmarkReadDir" href="#BenchmarkReadDir">func BenchmarkReadDir(b *testing.B)</a>

```
searchKey: os_test.BenchmarkReadDir
```

```Go
func BenchmarkReadDir(b *testing.B)
```

### <a id="benchmarkStat" href="#benchmarkStat">func benchmarkStat(b *testing.B, path string)</a>

```
searchKey: os_test.benchmarkStat
```

```Go
func benchmarkStat(b *testing.B, path string)
```

### <a id="benchmarkLstat" href="#benchmarkLstat">func benchmarkLstat(b *testing.B, path string)</a>

```
searchKey: os_test.benchmarkLstat
```

```Go
func benchmarkLstat(b *testing.B, path string)
```

### <a id="BenchmarkStatDot" href="#BenchmarkStatDot">func BenchmarkStatDot(b *testing.B)</a>

```
searchKey: os_test.BenchmarkStatDot
```

```Go
func BenchmarkStatDot(b *testing.B)
```

### <a id="BenchmarkStatFile" href="#BenchmarkStatFile">func BenchmarkStatFile(b *testing.B)</a>

```
searchKey: os_test.BenchmarkStatFile
```

```Go
func BenchmarkStatFile(b *testing.B)
```

### <a id="BenchmarkStatDir" href="#BenchmarkStatDir">func BenchmarkStatDir(b *testing.B)</a>

```
searchKey: os_test.BenchmarkStatDir
```

```Go
func BenchmarkStatDir(b *testing.B)
```

### <a id="BenchmarkLstatDot" href="#BenchmarkLstatDot">func BenchmarkLstatDot(b *testing.B)</a>

```
searchKey: os_test.BenchmarkLstatDot
```

```Go
func BenchmarkLstatDot(b *testing.B)
```

### <a id="BenchmarkLstatFile" href="#BenchmarkLstatFile">func BenchmarkLstatFile(b *testing.B)</a>

```
searchKey: os_test.BenchmarkLstatFile
```

```Go
func BenchmarkLstatFile(b *testing.B)
```

### <a id="BenchmarkLstatDir" href="#BenchmarkLstatDir">func BenchmarkLstatDir(b *testing.B)</a>

```
searchKey: os_test.BenchmarkLstatDir
```

```Go
func BenchmarkLstatDir(b *testing.B)
```

### <a id="smallReaddirnames" href="#smallReaddirnames">func smallReaddirnames(file *File, length int, t *testing.T) []string</a>

```
searchKey: os_test.smallReaddirnames
```

```Go
func smallReaddirnames(file *File, length int, t *testing.T) []string
```

Read the directory one entry at a time. 

### <a id="TestReaddirnamesOneAtATime" href="#TestReaddirnamesOneAtATime">func TestReaddirnamesOneAtATime(t *testing.T)</a>

```
searchKey: os_test.TestReaddirnamesOneAtATime
```

```Go
func TestReaddirnamesOneAtATime(t *testing.T)
```

Check that reading a directory one entry at a time gives the same result as reading it all at once. 

### <a id="TestReaddirNValues" href="#TestReaddirNValues">func TestReaddirNValues(t *testing.T)</a>

```
searchKey: os_test.TestReaddirNValues
```

```Go
func TestReaddirNValues(t *testing.T)
```

### <a id="touch" href="#touch">func touch(t *testing.T, name string)</a>

```
searchKey: os_test.touch
```

```Go
func touch(t *testing.T, name string)
```

### <a id="TestReaddirStatFailures" href="#TestReaddirStatFailures">func TestReaddirStatFailures(t *testing.T)</a>

```
searchKey: os_test.TestReaddirStatFailures
```

```Go
func TestReaddirStatFailures(t *testing.T)
```

### <a id="TestReaddirOfFile" href="#TestReaddirOfFile">func TestReaddirOfFile(t *testing.T)</a>

```
searchKey: os_test.TestReaddirOfFile
```

```Go
func TestReaddirOfFile(t *testing.T)
```

Readdir on a regular file should fail. 

### <a id="TestHardLink" href="#TestHardLink">func TestHardLink(t *testing.T)</a>

```
searchKey: os_test.TestHardLink
```

```Go
func TestHardLink(t *testing.T)
```

### <a id="chtmpdir" href="#chtmpdir">func chtmpdir(t *testing.T) func()</a>

```
searchKey: os_test.chtmpdir
```

```Go
func chtmpdir(t *testing.T) func()
```

chtmpdir changes the working directory to a new temporary directory and provides a cleanup function. 

### <a id="TestSymlink" href="#TestSymlink">func TestSymlink(t *testing.T)</a>

```
searchKey: os_test.TestSymlink
```

```Go
func TestSymlink(t *testing.T)
```

### <a id="TestLongSymlink" href="#TestLongSymlink">func TestLongSymlink(t *testing.T)</a>

```
searchKey: os_test.TestLongSymlink
```

```Go
func TestLongSymlink(t *testing.T)
```

### <a id="TestRename" href="#TestRename">func TestRename(t *testing.T)</a>

```
searchKey: os_test.TestRename
```

```Go
func TestRename(t *testing.T)
```

### <a id="TestRenameOverwriteDest" href="#TestRenameOverwriteDest">func TestRenameOverwriteDest(t *testing.T)</a>

```
searchKey: os_test.TestRenameOverwriteDest
```

```Go
func TestRenameOverwriteDest(t *testing.T)
```

### <a id="TestRenameFailed" href="#TestRenameFailed">func TestRenameFailed(t *testing.T)</a>

```
searchKey: os_test.TestRenameFailed
```

```Go
func TestRenameFailed(t *testing.T)
```

### <a id="TestRenameNotExisting" href="#TestRenameNotExisting">func TestRenameNotExisting(t *testing.T)</a>

```
searchKey: os_test.TestRenameNotExisting
```

```Go
func TestRenameNotExisting(t *testing.T)
```

### <a id="TestRenameToDirFailed" href="#TestRenameToDirFailed">func TestRenameToDirFailed(t *testing.T)</a>

```
searchKey: os_test.TestRenameToDirFailed
```

```Go
func TestRenameToDirFailed(t *testing.T)
```

### <a id="TestRenameCaseDifference" href="#TestRenameCaseDifference">func TestRenameCaseDifference(pt *testing.T)</a>

```
searchKey: os_test.TestRenameCaseDifference
```

```Go
func TestRenameCaseDifference(pt *testing.T)
```

### <a id="exec" href="#exec">func exec(t *testing.T, dir, cmd string, args []string, expect string)</a>

```
searchKey: os_test.exec
```

```Go
func exec(t *testing.T, dir, cmd string, args []string, expect string)
```

### <a id="TestStartProcess" href="#TestStartProcess">func TestStartProcess(t *testing.T)</a>

```
searchKey: os_test.TestStartProcess
```

```Go
func TestStartProcess(t *testing.T)
```

### <a id="checkMode" href="#checkMode">func checkMode(t *testing.T, path string, mode FileMode)</a>

```
searchKey: os_test.checkMode
```

```Go
func checkMode(t *testing.T, path string, mode FileMode)
```

### <a id="TestChmod" href="#TestChmod">func TestChmod(t *testing.T)</a>

```
searchKey: os_test.TestChmod
```

```Go
func TestChmod(t *testing.T)
```

### <a id="checkSize" href="#checkSize">func checkSize(t *testing.T, f *File, size int64)</a>

```
searchKey: os_test.checkSize
```

```Go
func checkSize(t *testing.T, f *File, size int64)
```

### <a id="TestFTruncate" href="#TestFTruncate">func TestFTruncate(t *testing.T)</a>

```
searchKey: os_test.TestFTruncate
```

```Go
func TestFTruncate(t *testing.T)
```

### <a id="TestTruncate" href="#TestTruncate">func TestTruncate(t *testing.T)</a>

```
searchKey: os_test.TestTruncate
```

```Go
func TestTruncate(t *testing.T)
```

### <a id="TestChtimes" href="#TestChtimes">func TestChtimes(t *testing.T)</a>

```
searchKey: os_test.TestChtimes
```

```Go
func TestChtimes(t *testing.T)
```

Use TempDir (via newFile) to make sure we're on a local file system, so that timings are not distorted by latency and caching. On NFS, timings can be off due to caching of meta-data on NFS servers (Issue 848). 

### <a id="TestChtimesDir" href="#TestChtimesDir">func TestChtimesDir(t *testing.T)</a>

```
searchKey: os_test.TestChtimesDir
```

```Go
func TestChtimesDir(t *testing.T)
```

Use TempDir (via newDir) to make sure we're on a local file system, so that timings are not distorted by latency and caching. On NFS, timings can be off due to caching of meta-data on NFS servers (Issue 848). 

### <a id="testChtimes" href="#testChtimes">func testChtimes(t *testing.T, name string)</a>

```
searchKey: os_test.testChtimes
```

```Go
func testChtimes(t *testing.T, name string)
```

### <a id="TestFileChdir" href="#TestFileChdir">func TestFileChdir(t *testing.T)</a>

```
searchKey: os_test.TestFileChdir
```

```Go
func TestFileChdir(t *testing.T)
```

### <a id="TestChdirAndGetwd" href="#TestChdirAndGetwd">func TestChdirAndGetwd(t *testing.T)</a>

```
searchKey: os_test.TestChdirAndGetwd
```

```Go
func TestChdirAndGetwd(t *testing.T)
```

### <a id="TestProgWideChdir" href="#TestProgWideChdir">func TestProgWideChdir(t *testing.T)</a>

```
searchKey: os_test.TestProgWideChdir
```

```Go
func TestProgWideChdir(t *testing.T)
```

Test that Chdir+Getwd is program-wide. 

### <a id="TestSeek" href="#TestSeek">func TestSeek(t *testing.T)</a>

```
searchKey: os_test.TestSeek
```

```Go
func TestSeek(t *testing.T)
```

### <a id="TestSeekError" href="#TestSeekError">func TestSeekError(t *testing.T)</a>

```
searchKey: os_test.TestSeekError
```

```Go
func TestSeekError(t *testing.T)
```

### <a id="TestOpenError" href="#TestOpenError">func TestOpenError(t *testing.T)</a>

```
searchKey: os_test.TestOpenError
```

```Go
func TestOpenError(t *testing.T)
```

### <a id="TestOpenNoName" href="#TestOpenNoName">func TestOpenNoName(t *testing.T)</a>

```
searchKey: os_test.TestOpenNoName
```

```Go
func TestOpenNoName(t *testing.T)
```

### <a id="runBinHostname" href="#runBinHostname">func runBinHostname(t *testing.T) string</a>

```
searchKey: os_test.runBinHostname
```

```Go
func runBinHostname(t *testing.T) string
```

### <a id="testWindowsHostname" href="#testWindowsHostname">func testWindowsHostname(t *testing.T, hostname string)</a>

```
searchKey: os_test.testWindowsHostname
```

```Go
func testWindowsHostname(t *testing.T, hostname string)
```

### <a id="TestHostname" href="#TestHostname">func TestHostname(t *testing.T)</a>

```
searchKey: os_test.TestHostname
```

```Go
func TestHostname(t *testing.T)
```

### <a id="TestReadAt" href="#TestReadAt">func TestReadAt(t *testing.T)</a>

```
searchKey: os_test.TestReadAt
```

```Go
func TestReadAt(t *testing.T)
```

### <a id="TestReadAtOffset" href="#TestReadAtOffset">func TestReadAtOffset(t *testing.T)</a>

```
searchKey: os_test.TestReadAtOffset
```

```Go
func TestReadAtOffset(t *testing.T)
```

Verify that ReadAt doesn't affect seek offset. In the Plan 9 kernel, there used to be a bug in the implementation of the pread syscall, where the channel offset was erroneously updated after calling pread on a file. 

### <a id="TestReadAtNegativeOffset" href="#TestReadAtNegativeOffset">func TestReadAtNegativeOffset(t *testing.T)</a>

```
searchKey: os_test.TestReadAtNegativeOffset
```

```Go
func TestReadAtNegativeOffset(t *testing.T)
```

Verify that ReadAt doesn't allow negative offset. 

### <a id="TestWriteAt" href="#TestWriteAt">func TestWriteAt(t *testing.T)</a>

```
searchKey: os_test.TestWriteAt
```

```Go
func TestWriteAt(t *testing.T)
```

### <a id="TestWriteAtNegativeOffset" href="#TestWriteAtNegativeOffset">func TestWriteAtNegativeOffset(t *testing.T)</a>

```
searchKey: os_test.TestWriteAtNegativeOffset
```

```Go
func TestWriteAtNegativeOffset(t *testing.T)
```

Verify that WriteAt doesn't allow negative offset. 

### <a id="TestWriteAtInAppendMode" href="#TestWriteAtInAppendMode">func TestWriteAtInAppendMode(t *testing.T)</a>

```
searchKey: os_test.TestWriteAtInAppendMode
```

```Go
func TestWriteAtInAppendMode(t *testing.T)
```

Verify that WriteAt doesn't work in append mode. 

### <a id="writeFile" href="#writeFile">func writeFile(t *testing.T, fname string, flag int, text string) string</a>

```
searchKey: os_test.writeFile
```

```Go
func writeFile(t *testing.T, fname string, flag int, text string) string
```

### <a id="TestAppend" href="#TestAppend">func TestAppend(t *testing.T)</a>

```
searchKey: os_test.TestAppend
```

```Go
func TestAppend(t *testing.T)
```

### <a id="TestStatDirWithTrailingSlash" href="#TestStatDirWithTrailingSlash">func TestStatDirWithTrailingSlash(t *testing.T)</a>

```
searchKey: os_test.TestStatDirWithTrailingSlash
```

```Go
func TestStatDirWithTrailingSlash(t *testing.T)
```

### <a id="TestNilProcessStateString" href="#TestNilProcessStateString">func TestNilProcessStateString(t *testing.T)</a>

```
searchKey: os_test.TestNilProcessStateString
```

```Go
func TestNilProcessStateString(t *testing.T)
```

### <a id="TestSameFile" href="#TestSameFile">func TestSameFile(t *testing.T)</a>

```
searchKey: os_test.TestSameFile
```

```Go
func TestSameFile(t *testing.T)
```

### <a id="testDevNullFileInfo" href="#testDevNullFileInfo">func testDevNullFileInfo(t *testing.T, statname, devNullName string, fi FileInfo, ignoreCase bool)</a>

```
searchKey: os_test.testDevNullFileInfo
```

```Go
func testDevNullFileInfo(t *testing.T, statname, devNullName string, fi FileInfo, ignoreCase bool)
```

### <a id="testDevNullFile" href="#testDevNullFile">func testDevNullFile(t *testing.T, devNullName string, ignoreCase bool)</a>

```
searchKey: os_test.testDevNullFile
```

```Go
func testDevNullFile(t *testing.T, devNullName string, ignoreCase bool)
```

### <a id="TestDevNullFile" href="#TestDevNullFile">func TestDevNullFile(t *testing.T)</a>

```
searchKey: os_test.TestDevNullFile
```

```Go
func TestDevNullFile(t *testing.T)
```

### <a id="TestLargeWriteToConsole" href="#TestLargeWriteToConsole">func TestLargeWriteToConsole(t *testing.T)</a>

```
searchKey: os_test.TestLargeWriteToConsole
```

```Go
func TestLargeWriteToConsole(t *testing.T)
```

### <a id="TestStatDirModeExec" href="#TestStatDirModeExec">func TestStatDirModeExec(t *testing.T)</a>

```
searchKey: os_test.TestStatDirModeExec
```

```Go
func TestStatDirModeExec(t *testing.T)
```

### <a id="TestStatStdin" href="#TestStatStdin">func TestStatStdin(t *testing.T)</a>

```
searchKey: os_test.TestStatStdin
```

```Go
func TestStatStdin(t *testing.T)
```

### <a id="TestStatRelativeSymlink" href="#TestStatRelativeSymlink">func TestStatRelativeSymlink(t *testing.T)</a>

```
searchKey: os_test.TestStatRelativeSymlink
```

```Go
func TestStatRelativeSymlink(t *testing.T)
```

### <a id="TestReadAtEOF" href="#TestReadAtEOF">func TestReadAtEOF(t *testing.T)</a>

```
searchKey: os_test.TestReadAtEOF
```

```Go
func TestReadAtEOF(t *testing.T)
```

### <a id="TestLongPath" href="#TestLongPath">func TestLongPath(t *testing.T)</a>

```
searchKey: os_test.TestLongPath
```

```Go
func TestLongPath(t *testing.T)
```

### <a id="testKillProcess" href="#testKillProcess">func testKillProcess(t *testing.T, processKiller func(p *Process))</a>

```
searchKey: os_test.testKillProcess
```

```Go
func testKillProcess(t *testing.T, processKiller func(p *Process))
```

### <a id="TestSleep" href="#TestSleep">func TestSleep(t *testing.T)</a>

```
searchKey: os_test.TestSleep
```

```Go
func TestSleep(t *testing.T)
```

TestSleep emulates "sleep 1". It is a helper for testKillProcess, so we don't have to rely on an external "sleep" command being available. 

### <a id="TestKillStartProcess" href="#TestKillStartProcess">func TestKillStartProcess(t *testing.T)</a>

```
searchKey: os_test.TestKillStartProcess
```

```Go
func TestKillStartProcess(t *testing.T)
```

### <a id="TestGetppid" href="#TestGetppid">func TestGetppid(t *testing.T)</a>

```
searchKey: os_test.TestGetppid
```

```Go
func TestGetppid(t *testing.T)
```

### <a id="TestKillFindProcess" href="#TestKillFindProcess">func TestKillFindProcess(t *testing.T)</a>

```
searchKey: os_test.TestKillFindProcess
```

```Go
func TestKillFindProcess(t *testing.T)
```

### <a id="TestNilFileMethods" href="#TestNilFileMethods">func TestNilFileMethods(t *testing.T)</a>

```
searchKey: os_test.TestNilFileMethods
```

```Go
func TestNilFileMethods(t *testing.T)
```

Test that all File methods give ErrInvalid if the receiver is nil. 

### <a id="mkdirTree" href="#mkdirTree">func mkdirTree(t *testing.T, root string, level, max int)</a>

```
searchKey: os_test.mkdirTree
```

```Go
func mkdirTree(t *testing.T, root string, level, max int)
```

### <a id="TestRemoveAllRace" href="#TestRemoveAllRace">func TestRemoveAllRace(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllRace
```

```Go
func TestRemoveAllRace(t *testing.T)
```

Test that simultaneous RemoveAll do not report an error. As long as it gets removed, we should be happy. 

### <a id="TestPipeThreads" href="#TestPipeThreads">func TestPipeThreads(t *testing.T)</a>

```
searchKey: os_test.TestPipeThreads
```

```Go
func TestPipeThreads(t *testing.T)
```

Test that reading from a pipe doesn't use up a thread. 

### <a id="testDoubleCloseError" href="#testDoubleCloseError">func testDoubleCloseError(t *testing.T, path string)</a>

```
searchKey: os_test.testDoubleCloseError
```

```Go
func testDoubleCloseError(t *testing.T, path string)
```

### <a id="TestDoubleCloseError" href="#TestDoubleCloseError">func TestDoubleCloseError(t *testing.T)</a>

```
searchKey: os_test.TestDoubleCloseError
```

```Go
func TestDoubleCloseError(t *testing.T)
```

### <a id="TestUserHomeDir" href="#TestUserHomeDir">func TestUserHomeDir(t *testing.T)</a>

```
searchKey: os_test.TestUserHomeDir
```

```Go
func TestUserHomeDir(t *testing.T)
```

### <a id="TestDirSeek" href="#TestDirSeek">func TestDirSeek(t *testing.T)</a>

```
searchKey: os_test.TestDirSeek
```

```Go
func TestDirSeek(t *testing.T)
```

### <a id="TestReaddirSmallSeek" href="#TestReaddirSmallSeek">func TestReaddirSmallSeek(t *testing.T)</a>

```
searchKey: os_test.TestReaddirSmallSeek
```

```Go
func TestReaddirSmallSeek(t *testing.T)
```

### <a id="isDeadlineExceeded" href="#isDeadlineExceeded">func isDeadlineExceeded(err error) bool</a>

```
searchKey: os_test.isDeadlineExceeded
```

```Go
func isDeadlineExceeded(err error) bool
```

isDeadlineExceeded reports whether err is or wraps os.ErrDeadlineExceeded. We also check that the error has a Timeout method that returns true. 

### <a id="TestOpenFileKeepsPermissions" href="#TestOpenFileKeepsPermissions">func TestOpenFileKeepsPermissions(t *testing.T)</a>

```
searchKey: os_test.TestOpenFileKeepsPermissions
```

```Go
func TestOpenFileKeepsPermissions(t *testing.T)
```

Test that opening a file does not change its permissions.  Issue 38225. 

### <a id="TestDirFS" href="#TestDirFS">func TestDirFS(t *testing.T)</a>

```
searchKey: os_test.TestDirFS
```

```Go
func TestDirFS(t *testing.T)
```

### <a id="TestDirFSPathsValid" href="#TestDirFSPathsValid">func TestDirFSPathsValid(t *testing.T)</a>

```
searchKey: os_test.TestDirFSPathsValid
```

```Go
func TestDirFSPathsValid(t *testing.T)
```

### <a id="TestReadFileProc" href="#TestReadFileProc">func TestReadFileProc(t *testing.T)</a>

```
searchKey: os_test.TestReadFileProc
```

```Go
func TestReadFileProc(t *testing.T)
```

### <a id="TestWriteStringAlloc" href="#TestWriteStringAlloc">func TestWriteStringAlloc(t *testing.T)</a>

```
searchKey: os_test.TestWriteStringAlloc
```

```Go
func TestWriteStringAlloc(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: os_test.init
```

```Go
func init()
```

### <a id="checkUidGid" href="#checkUidGid">func checkUidGid(t *testing.T, path string, uid, gid int)</a>

```
searchKey: os_test.checkUidGid
```

```Go
func checkUidGid(t *testing.T, path string, uid, gid int)
```

### <a id="TestChown" href="#TestChown">func TestChown(t *testing.T)</a>

```
searchKey: os_test.TestChown
```

```Go
func TestChown(t *testing.T)
```

### <a id="TestFileChown" href="#TestFileChown">func TestFileChown(t *testing.T)</a>

```
searchKey: os_test.TestFileChown
```

```Go
func TestFileChown(t *testing.T)
```

### <a id="TestLchown" href="#TestLchown">func TestLchown(t *testing.T)</a>

```
searchKey: os_test.TestLchown
```

```Go
func TestLchown(t *testing.T)
```

### <a id="TestReaddirRemoveRace" href="#TestReaddirRemoveRace">func TestReaddirRemoveRace(t *testing.T)</a>

```
searchKey: os_test.TestReaddirRemoveRace
```

```Go
func TestReaddirRemoveRace(t *testing.T)
```

Issue 16919: Readdir must return a non-empty slice or an error. 

### <a id="TestMkdirStickyUmask" href="#TestMkdirStickyUmask">func TestMkdirStickyUmask(t *testing.T)</a>

```
searchKey: os_test.TestMkdirStickyUmask
```

```Go
func TestMkdirStickyUmask(t *testing.T)
```

Issue 23120: respect umask when doing Mkdir with the sticky bit 

### <a id="newFileTest" href="#newFileTest">func newFileTest(t *testing.T, blocking bool)</a>

```
searchKey: os_test.newFileTest
```

```Go
func newFileTest(t *testing.T, blocking bool)
```

See also issues: 22939, 24331 

### <a id="TestNewFileBlock" href="#TestNewFileBlock">func TestNewFileBlock(t *testing.T)</a>

```
searchKey: os_test.TestNewFileBlock
```

```Go
func TestNewFileBlock(t *testing.T)
```

### <a id="TestNewFileNonBlock" href="#TestNewFileNonBlock">func TestNewFileNonBlock(t *testing.T)</a>

```
searchKey: os_test.TestNewFileNonBlock
```

```Go
func TestNewFileNonBlock(t *testing.T)
```

### <a id="TestSplitPath" href="#TestSplitPath">func TestSplitPath(t *testing.T)</a>

```
searchKey: os_test.TestSplitPath
```

```Go
func TestSplitPath(t *testing.T)
```

### <a id="TestMkdirAll" href="#TestMkdirAll">func TestMkdirAll(t *testing.T)</a>

```
searchKey: os_test.TestMkdirAll
```

```Go
func TestMkdirAll(t *testing.T)
```

### <a id="TestMkdirAllWithSymlink" href="#TestMkdirAllWithSymlink">func TestMkdirAllWithSymlink(t *testing.T)</a>

```
searchKey: os_test.TestMkdirAllWithSymlink
```

```Go
func TestMkdirAllWithSymlink(t *testing.T)
```

### <a id="TestMkdirAllAtSlash" href="#TestMkdirAllAtSlash">func TestMkdirAllAtSlash(t *testing.T)</a>

```
searchKey: os_test.TestMkdirAllAtSlash
```

```Go
func TestMkdirAllAtSlash(t *testing.T)
```

### <a id="TestEPIPE" href="#TestEPIPE">func TestEPIPE(t *testing.T)</a>

```
searchKey: os_test.TestEPIPE
```

```Go
func TestEPIPE(t *testing.T)
```

### <a id="TestStdPipe" href="#TestStdPipe">func TestStdPipe(t *testing.T)</a>

```
searchKey: os_test.TestStdPipe
```

```Go
func TestStdPipe(t *testing.T)
```

### <a id="TestStdPipeHelper" href="#TestStdPipeHelper">func TestStdPipeHelper(t *testing.T)</a>

```
searchKey: os_test.TestStdPipeHelper
```

```Go
func TestStdPipeHelper(t *testing.T)
```

This is a helper for TestStdPipe. It's not a test in itself. 

### <a id="testClosedPipeRace" href="#testClosedPipeRace">func testClosedPipeRace(t *testing.T, read bool)</a>

```
searchKey: os_test.testClosedPipeRace
```

```Go
func testClosedPipeRace(t *testing.T, read bool)
```

### <a id="TestClosedPipeRaceRead" href="#TestClosedPipeRaceRead">func TestClosedPipeRaceRead(t *testing.T)</a>

```
searchKey: os_test.TestClosedPipeRaceRead
```

```Go
func TestClosedPipeRaceRead(t *testing.T)
```

### <a id="TestClosedPipeRaceWrite" href="#TestClosedPipeRaceWrite">func TestClosedPipeRaceWrite(t *testing.T)</a>

```
searchKey: os_test.TestClosedPipeRaceWrite
```

```Go
func TestClosedPipeRaceWrite(t *testing.T)
```

### <a id="TestReadNonblockingFd" href="#TestReadNonblockingFd">func TestReadNonblockingFd(t *testing.T)</a>

```
searchKey: os_test.TestReadNonblockingFd
```

```Go
func TestReadNonblockingFd(t *testing.T)
```

Issue 20915: Reading on nonblocking fd should not return "waiting for unsupported file type." Currently it returns EAGAIN; it is possible that in the future it will simply wait for data. 

### <a id="TestCloseWithBlockingReadByNewFile" href="#TestCloseWithBlockingReadByNewFile">func TestCloseWithBlockingReadByNewFile(t *testing.T)</a>

```
searchKey: os_test.TestCloseWithBlockingReadByNewFile
```

```Go
func TestCloseWithBlockingReadByNewFile(t *testing.T)
```

### <a id="TestCloseWithBlockingReadByFd" href="#TestCloseWithBlockingReadByFd">func TestCloseWithBlockingReadByFd(t *testing.T)</a>

```
searchKey: os_test.TestCloseWithBlockingReadByFd
```

```Go
func TestCloseWithBlockingReadByFd(t *testing.T)
```

### <a id="testCloseWithBlockingRead" href="#testCloseWithBlockingRead">func testCloseWithBlockingRead(t *testing.T, r, w *os.File)</a>

```
searchKey: os_test.testCloseWithBlockingRead
```

```Go
func testCloseWithBlockingRead(t *testing.T, r, w *os.File)
```

Test that we don't let a blocking read prevent a close. 

### <a id="TestPipeEOF" href="#TestPipeEOF">func TestPipeEOF(t *testing.T)</a>

```
searchKey: os_test.TestPipeEOF
```

```Go
func TestPipeEOF(t *testing.T)
```

Issue 24164, for pipes. 

### <a id="TestFdRace" href="#TestFdRace">func TestFdRace(t *testing.T)</a>

```
searchKey: os_test.TestFdRace
```

```Go
func TestFdRace(t *testing.T)
```

Issue 24481. 

### <a id="TestFdReadRace" href="#TestFdReadRace">func TestFdReadRace(t *testing.T)</a>

```
searchKey: os_test.TestFdReadRace
```

```Go
func TestFdReadRace(t *testing.T)
```

### <a id="TestRawConnReadWrite" href="#TestRawConnReadWrite">func TestRawConnReadWrite(t *testing.T)</a>

```
searchKey: os_test.TestRawConnReadWrite
```

```Go
func TestRawConnReadWrite(t *testing.T)
```

### <a id="checkNamedSize" href="#checkNamedSize">func checkNamedSize(t *testing.T, path string, size int64)</a>

```
searchKey: os_test.checkNamedSize
```

```Go
func checkNamedSize(t *testing.T, path string, size int64)
```

### <a id="TestReadFile" href="#TestReadFile">func TestReadFile(t *testing.T)</a>

```
searchKey: os_test.TestReadFile
```

```Go
func TestReadFile(t *testing.T)
```

### <a id="TestWriteFile" href="#TestWriteFile">func TestWriteFile(t *testing.T)</a>

```
searchKey: os_test.TestWriteFile
```

```Go
func TestWriteFile(t *testing.T)
```

### <a id="TestReadOnlyWriteFile" href="#TestReadOnlyWriteFile">func TestReadOnlyWriteFile(t *testing.T)</a>

```
searchKey: os_test.TestReadOnlyWriteFile
```

```Go
func TestReadOnlyWriteFile(t *testing.T)
```

### <a id="TestReadDir" href="#TestReadDir">func TestReadDir(t *testing.T)</a>

```
searchKey: os_test.TestReadDir
```

```Go
func TestReadDir(t *testing.T)
```

### <a id="TestRemoveAll" href="#TestRemoveAll">func TestRemoveAll(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAll
```

```Go
func TestRemoveAll(t *testing.T)
```

### <a id="TestRemoveAllLarge" href="#TestRemoveAllLarge">func TestRemoveAllLarge(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllLarge
```

```Go
func TestRemoveAllLarge(t *testing.T)
```

Test RemoveAll on a large directory. 

### <a id="TestRemoveAllLongPath" href="#TestRemoveAllLongPath">func TestRemoveAllLongPath(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllLongPath
```

```Go
func TestRemoveAllLongPath(t *testing.T)
```

### <a id="TestRemoveAllDot" href="#TestRemoveAllDot">func TestRemoveAllDot(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllDot
```

```Go
func TestRemoveAllDot(t *testing.T)
```

### <a id="TestRemoveAllDotDot" href="#TestRemoveAllDotDot">func TestRemoveAllDotDot(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllDotDot
```

```Go
func TestRemoveAllDotDot(t *testing.T)
```

### <a id="TestRemoveReadOnlyDir" href="#TestRemoveReadOnlyDir">func TestRemoveReadOnlyDir(t *testing.T)</a>

```
searchKey: os_test.TestRemoveReadOnlyDir
```

```Go
func TestRemoveReadOnlyDir(t *testing.T)
```

Issue #29178. 

### <a id="TestRemoveAllButReadOnlyAndPathError" href="#TestRemoveAllButReadOnlyAndPathError">func TestRemoveAllButReadOnlyAndPathError(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllButReadOnlyAndPathError
```

```Go
func TestRemoveAllButReadOnlyAndPathError(t *testing.T)
```

Issue #29983. 

### <a id="TestRemoveUnreadableDir" href="#TestRemoveUnreadableDir">func TestRemoveUnreadableDir(t *testing.T)</a>

```
searchKey: os_test.TestRemoveUnreadableDir
```

```Go
func TestRemoveUnreadableDir(t *testing.T)
```

### <a id="TestRemoveAllWithMoreErrorThanReqSize" href="#TestRemoveAllWithMoreErrorThanReqSize">func TestRemoveAllWithMoreErrorThanReqSize(t *testing.T)</a>

```
searchKey: os_test.TestRemoveAllWithMoreErrorThanReqSize
```

```Go
func TestRemoveAllWithMoreErrorThanReqSize(t *testing.T)
```

Issue 29921 

### <a id="testStatAndLstat" href="#testStatAndLstat">func testStatAndLstat(t *testing.T, path string, isLink bool, statCheck, lstatCheck func(*testing.T, string, fs.FileInfo))</a>

```
searchKey: os_test.testStatAndLstat
```

```Go
func testStatAndLstat(t *testing.T, path string, isLink bool, statCheck, lstatCheck func(*testing.T, string, fs.FileInfo))
```

testStatAndLstat verifies that all os.Stat, os.Lstat os.File.Stat and os.Readdir work. 

### <a id="testIsDir" href="#testIsDir">func testIsDir(t *testing.T, path string, fi fs.FileInfo)</a>

```
searchKey: os_test.testIsDir
```

```Go
func testIsDir(t *testing.T, path string, fi fs.FileInfo)
```

testIsDir verifies that fi refers to directory. 

### <a id="testIsSymlink" href="#testIsSymlink">func testIsSymlink(t *testing.T, path string, fi fs.FileInfo)</a>

```
searchKey: os_test.testIsSymlink
```

```Go
func testIsSymlink(t *testing.T, path string, fi fs.FileInfo)
```

testIsSymlink verifies that fi refers to symlink. 

### <a id="testIsFile" href="#testIsFile">func testIsFile(t *testing.T, path string, fi fs.FileInfo)</a>

```
searchKey: os_test.testIsFile
```

```Go
func testIsFile(t *testing.T, path string, fi fs.FileInfo)
```

testIsFile verifies that fi refers to file. 

### <a id="testDirStats" href="#testDirStats">func testDirStats(t *testing.T, path string)</a>

```
searchKey: os_test.testDirStats
```

```Go
func testDirStats(t *testing.T, path string)
```

### <a id="testFileStats" href="#testFileStats">func testFileStats(t *testing.T, path string)</a>

```
searchKey: os_test.testFileStats
```

```Go
func testFileStats(t *testing.T, path string)
```

### <a id="testSymlinkStats" href="#testSymlinkStats">func testSymlinkStats(t *testing.T, path string, isdir bool)</a>

```
searchKey: os_test.testSymlinkStats
```

```Go
func testSymlinkStats(t *testing.T, path string, isdir bool)
```

### <a id="testSymlinkSameFile" href="#testSymlinkSameFile">func testSymlinkSameFile(t *testing.T, path, link string)</a>

```
searchKey: os_test.testSymlinkSameFile
```

```Go
func testSymlinkSameFile(t *testing.T, path, link string)
```

### <a id="TestDirAndSymlinkStats" href="#TestDirAndSymlinkStats">func TestDirAndSymlinkStats(t *testing.T)</a>

```
searchKey: os_test.TestDirAndSymlinkStats
```

```Go
func TestDirAndSymlinkStats(t *testing.T)
```

### <a id="TestFileAndSymlinkStats" href="#TestFileAndSymlinkStats">func TestFileAndSymlinkStats(t *testing.T)</a>

```
searchKey: os_test.TestFileAndSymlinkStats
```

```Go
func TestFileAndSymlinkStats(t *testing.T)
```

### <a id="TestSymlinkWithTrailingSlash" href="#TestSymlinkWithTrailingSlash">func TestSymlinkWithTrailingSlash(t *testing.T)</a>

```
searchKey: os_test.TestSymlinkWithTrailingSlash
```

```Go
func TestSymlinkWithTrailingSlash(t *testing.T)
```

see issue 27225 for details 

### <a id="TestCreateTemp" href="#TestCreateTemp">func TestCreateTemp(t *testing.T)</a>

```
searchKey: os_test.TestCreateTemp
```

```Go
func TestCreateTemp(t *testing.T)
```

### <a id="TestCreateTempPattern" href="#TestCreateTempPattern">func TestCreateTempPattern(t *testing.T)</a>

```
searchKey: os_test.TestCreateTempPattern
```

```Go
func TestCreateTempPattern(t *testing.T)
```

### <a id="TestCreateTempBadPattern" href="#TestCreateTempBadPattern">func TestCreateTempBadPattern(t *testing.T)</a>

```
searchKey: os_test.TestCreateTempBadPattern
```

```Go
func TestCreateTempBadPattern(t *testing.T)
```

### <a id="TestMkdirTemp" href="#TestMkdirTemp">func TestMkdirTemp(t *testing.T)</a>

```
searchKey: os_test.TestMkdirTemp
```

```Go
func TestMkdirTemp(t *testing.T)
```

### <a id="TestMkdirTempBadDir" href="#TestMkdirTempBadDir">func TestMkdirTempBadDir(t *testing.T)</a>

```
searchKey: os_test.TestMkdirTempBadDir
```

```Go
func TestMkdirTempBadDir(t *testing.T)
```

test that we return a nice error message if the dir argument to TempDir doesn't exist (or that it's empty and TempDir doesn't exist) 

### <a id="TestMkdirTempBadPattern" href="#TestMkdirTempBadPattern">func TestMkdirTempBadPattern(t *testing.T)</a>

```
searchKey: os_test.TestMkdirTempBadPattern
```

```Go
func TestMkdirTempBadPattern(t *testing.T)
```

### <a id="TestNonpollableDeadline" href="#TestNonpollableDeadline">func TestNonpollableDeadline(t *testing.T)</a>

```
searchKey: os_test.TestNonpollableDeadline
```

```Go
func TestNonpollableDeadline(t *testing.T)
```

### <a id="TestReadTimeout" href="#TestReadTimeout">func TestReadTimeout(t *testing.T)</a>

```
searchKey: os_test.TestReadTimeout
```

```Go
func TestReadTimeout(t *testing.T)
```

### <a id="TestReadTimeoutMustNotReturn" href="#TestReadTimeoutMustNotReturn">func TestReadTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: os_test.TestReadTimeoutMustNotReturn
```

```Go
func TestReadTimeoutMustNotReturn(t *testing.T)
```

### <a id="TestWriteTimeout" href="#TestWriteTimeout">func TestWriteTimeout(t *testing.T)</a>

```
searchKey: os_test.TestWriteTimeout
```

```Go
func TestWriteTimeout(t *testing.T)
```

### <a id="TestWriteTimeoutMustNotReturn" href="#TestWriteTimeoutMustNotReturn">func TestWriteTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: os_test.TestWriteTimeoutMustNotReturn
```

```Go
func TestWriteTimeoutMustNotReturn(t *testing.T)
```

### <a id="timeoutReader" href="#timeoutReader">func timeoutReader(r *os.File, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: os_test.timeoutReader
```

```Go
func timeoutReader(r *os.File, d, min, max time.Duration, ch chan<- error)
```

### <a id="TestReadTimeoutFluctuation" href="#TestReadTimeoutFluctuation">func TestReadTimeoutFluctuation(t *testing.T)</a>

```
searchKey: os_test.TestReadTimeoutFluctuation
```

```Go
func TestReadTimeoutFluctuation(t *testing.T)
```

### <a id="timeoutWriter" href="#timeoutWriter">func timeoutWriter(w *os.File, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: os_test.timeoutWriter
```

```Go
func timeoutWriter(w *os.File, d, min, max time.Duration, ch chan<- error)
```

### <a id="TestWriteTimeoutFluctuation" href="#TestWriteTimeoutFluctuation">func TestWriteTimeoutFluctuation(t *testing.T)</a>

```
searchKey: os_test.TestWriteTimeoutFluctuation
```

```Go
func TestWriteTimeoutFluctuation(t *testing.T)
```

### <a id="TestVariousDeadlines" href="#TestVariousDeadlines">func TestVariousDeadlines(t *testing.T)</a>

```
searchKey: os_test.TestVariousDeadlines
```

```Go
func TestVariousDeadlines(t *testing.T)
```

### <a id="TestVariousDeadlines1Proc" href="#TestVariousDeadlines1Proc">func TestVariousDeadlines1Proc(t *testing.T)</a>

```
searchKey: os_test.TestVariousDeadlines1Proc
```

```Go
func TestVariousDeadlines1Proc(t *testing.T)
```

### <a id="TestVariousDeadlines4Proc" href="#TestVariousDeadlines4Proc">func TestVariousDeadlines4Proc(t *testing.T)</a>

```
searchKey: os_test.TestVariousDeadlines4Proc
```

```Go
func TestVariousDeadlines4Proc(t *testing.T)
```

### <a id="testVariousDeadlines" href="#testVariousDeadlines">func testVariousDeadlines(t *testing.T)</a>

```
searchKey: os_test.testVariousDeadlines
```

```Go
func testVariousDeadlines(t *testing.T)
```

### <a id="TestReadWriteDeadlineRace" href="#TestReadWriteDeadlineRace">func TestReadWriteDeadlineRace(t *testing.T)</a>

```
searchKey: os_test.TestReadWriteDeadlineRace
```

```Go
func TestReadWriteDeadlineRace(t *testing.T)
```

### <a id="TestRacyRead" href="#TestRacyRead">func TestRacyRead(t *testing.T)</a>

```
searchKey: os_test.TestRacyRead
```

```Go
func TestRacyRead(t *testing.T)
```

TestRacyRead tests that it is safe to mutate the input Read buffer immediately after cancellation has occurred. 

### <a id="TestRacyWrite" href="#TestRacyWrite">func TestRacyWrite(t *testing.T)</a>

```
searchKey: os_test.TestRacyWrite
```

```Go
func TestRacyWrite(t *testing.T)
```

TestRacyWrite tests that it is safe to mutate the input Write buffer immediately after cancellation has occurred. 

### <a id="TestTTYClose" href="#TestTTYClose">func TestTTYClose(t *testing.T)</a>

```
searchKey: os_test.TestTTYClose
```

```Go
func TestTTYClose(t *testing.T)
```

Closing a TTY while reading from it should not hang.  Issue 23943. 

