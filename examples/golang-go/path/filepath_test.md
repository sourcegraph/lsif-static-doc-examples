# Package filepath_test

## Index

* [Constants](#const)
    * [const lsep](#lsep)
    * [const sep](#sep)
* [Variables](#var)
    * [var EvalSymlinksTestDirs](#EvalSymlinksTestDirs)
    * [var EvalSymlinksTests](#EvalSymlinksTests)
    * [var absTestDirs](#absTestDirs)
    * [var absTests](#absTests)
    * [var basetests](#basetests)
    * [var cleantests](#cleantests)
    * [var dirtests](#dirtests)
    * [var exttests](#exttests)
    * [var globSymlinkTests](#globSymlinkTests)
    * [var globTests](#globTests)
    * [var isabstests](#isabstests)
    * [var jointests](#jointests)
    * [var matchTests](#matchTests)
    * [var reltests](#reltests)
    * [var slashtests](#slashtests)
    * [var splitlisttests](#splitlisttests)
    * [var tree](#tree)
    * [var unixsplittests](#unixsplittests)
    * [var volumenametests](#volumenametests)
    * [var winbasetests](#winbasetests)
    * [var wincleantests](#wincleantests)
    * [var windirtests](#windirtests)
    * [var winisabstests](#winisabstests)
    * [var winjointests](#winjointests)
    * [var winreltests](#winreltests)
    * [var winsplitlisttests](#winsplitlisttests)
    * [var winsplittests](#winsplittests)
* [Types](#type)
    * [type EvalSymlinksTest struct](#EvalSymlinksTest)
    * [type ExtTest struct](#ExtTest)
    * [type IsAbsTest struct](#IsAbsTest)
    * [type JoinTest struct](#JoinTest)
    * [type MatchTest struct](#MatchTest)
    * [type Node struct](#Node)
    * [type PathTest struct](#PathTest)
    * [type RelTests struct](#RelTests)
    * [type SplitListTest struct](#SplitListTest)
    * [type SplitTest struct](#SplitTest)
    * [type VolumeNameTest struct](#VolumeNameTest)
    * [type globTest struct](#globTest)
        * [func (test *globTest) buildWant(root string) []string](#globTest.buildWant)
        * [func (test *globTest) globAbs(root, rootPattern string) error](#globTest.globAbs)
        * [func (test *globTest) globRel(root string) error](#globTest.globRel)
    * [type statDirEntry struct](#statDirEntry)
        * [func (d *statDirEntry) Info() (fs.FileInfo, error)](#statDirEntry.Info)
        * [func (d *statDirEntry) IsDir() bool](#statDirEntry.IsDir)
        * [func (d *statDirEntry) Name() string](#statDirEntry.Name)
        * [func (d *statDirEntry) Type() fs.FileMode](#statDirEntry.Type)
* [Functions](#func)
    * [func ExampleBase()](#ExampleBase)
    * [func ExampleDir()](#ExampleDir)
    * [func ExampleExt()](#ExampleExt)
    * [func ExampleIsAbs()](#ExampleIsAbs)
    * [func ExampleJoin()](#ExampleJoin)
    * [func ExampleMatch()](#ExampleMatch)
    * [func ExampleRel()](#ExampleRel)
    * [func ExampleSplit()](#ExampleSplit)
    * [func ExampleSplitList()](#ExampleSplitList)
    * [func ExampleWalk()](#ExampleWalk)
    * [func TestAbs(t *testing.T)](#TestAbs)
    * [func TestAbsEmptyString(t *testing.T)](#TestAbsEmptyString)
    * [func TestBase(t *testing.T)](#TestBase)
    * [func TestBug3486(t *testing.T)](#TestBug3486)
    * [func TestClean(t *testing.T)](#TestClean)
    * [func TestDir(t *testing.T)](#TestDir)
    * [func TestDriveLetterInEvalSymlinks(t *testing.T)](#TestDriveLetterInEvalSymlinks)
    * [func TestEvalSymlinks(t *testing.T)](#TestEvalSymlinks)
    * [func TestEvalSymlinksAboveRoot(t *testing.T)](#TestEvalSymlinksAboveRoot)
    * [func TestEvalSymlinksAboveRootChdir(t *testing.T)](#TestEvalSymlinksAboveRootChdir)
    * [func TestEvalSymlinksIsNotExist(t *testing.T)](#TestEvalSymlinksIsNotExist)
    * [func TestExt(t *testing.T)](#TestExt)
    * [func TestFromAndToSlash(t *testing.T)](#TestFromAndToSlash)
    * [func TestGlob(t *testing.T)](#TestGlob)
    * [func TestGlobError(t *testing.T)](#TestGlobError)
    * [func TestGlobSymlink(t *testing.T)](#TestGlobSymlink)
    * [func TestGlobUNC(t *testing.T)](#TestGlobUNC)
    * [func TestIsAbs(t *testing.T)](#TestIsAbs)
    * [func TestIssue13582(t *testing.T)](#TestIssue13582)
    * [func TestIssue29372(t *testing.T)](#TestIssue29372)
    * [func TestJoin(t *testing.T)](#TestJoin)
    * [func TestMatch(t *testing.T)](#TestMatch)
    * [func TestNonWindowsGlobEscape(t *testing.T)](#TestNonWindowsGlobEscape)
    * [func TestRel(t *testing.T)](#TestRel)
    * [func TestSplit(t *testing.T)](#TestSplit)
    * [func TestSplitList(t *testing.T)](#TestSplitList)
    * [func TestVolumeName(t *testing.T)](#TestVolumeName)
    * [func TestWalk(t *testing.T)](#TestWalk)
    * [func TestWalkDir(t *testing.T)](#TestWalkDir)
    * [func TestWalkFileError(t *testing.T)](#TestWalkFileError)
    * [func TestWalkSkipDirOnFile(t *testing.T)](#TestWalkSkipDirOnFile)
    * [func TestWalkSymlink(t *testing.T)](#TestWalkSymlink)
    * [func TestWindowsGlob(t *testing.T)](#TestWindowsGlob)
    * [func chdir(t *testing.T, dir string)](#chdir)
    * [func checkMarks(t *testing.T, report bool)](#checkMarks)
    * [func chtmpdir(t *testing.T) (restore func())](#chtmpdir)
    * [func contains(vector []string, s string) bool](#contains)
    * [func errp(e error) string](#errp)
    * [func makeTree(t *testing.T)](#makeTree)
    * [func mark(d fs.DirEntry, err error, errors *[]error, clear bool) error](#mark)
    * [func markTree(n *Node)](#markTree)
    * [func prepareTestDirTree(tree string) (string, error)](#prepareTestDirTree)
    * [func simpleJoin(dir, path string) string](#simpleJoin)
    * [func tempDirCanonical(t *testing.T) string](#tempDirCanonical)
    * [func testEvalSymlinks(t *testing.T, path, want string)](#testEvalSymlinks)
    * [func testEvalSymlinksAfterChdir(t *testing.T, wd, path, want string)](#testEvalSymlinksAfterChdir)
    * [func testWalk(t *testing.T, walk func(string, fs.WalkDirFunc) error, errVisit int)](#testWalk)
    * [func testWalkSymlink(t *testing.T, mklink func(target, link string) error)](#testWalkSymlink)
    * [func touch(t *testing.T, name string)](#touch)
    * [func walkTree(n *Node, path string, f func(path string, n *Node))](#walkTree)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="lsep" href="#lsep">const lsep</a>

```
searchKey: filepath_test.lsep
tags: [constant number private]
```

```Go
const lsep = filepath.ListSeparator
```

### <a id="sep" href="#sep">const sep</a>

```
searchKey: filepath_test.sep
tags: [constant number private]
```

```Go
const sep = filepath.Separator
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="EvalSymlinksTestDirs" href="#EvalSymlinksTestDirs">var EvalSymlinksTestDirs</a>

```
searchKey: filepath_test.EvalSymlinksTestDirs
tags: [variable array struct private]
```

```Go
var EvalSymlinksTestDirs = ...
```

### <a id="EvalSymlinksTests" href="#EvalSymlinksTests">var EvalSymlinksTests</a>

```
searchKey: filepath_test.EvalSymlinksTests
tags: [variable array struct private]
```

```Go
var EvalSymlinksTests = ...
```

### <a id="absTestDirs" href="#absTestDirs">var absTestDirs</a>

```
searchKey: filepath_test.absTestDirs
tags: [variable array string private]
```

```Go
var absTestDirs = []string{
	"a",
	"a/b",
	"a/b/c",
}
```

Test directories relative to temporary directory. The tests are run in absTestDirs[0]. 

### <a id="absTests" href="#absTests">var absTests</a>

```
searchKey: filepath_test.absTests
tags: [variable array string private]
```

```Go
var absTests = ...
```

Test paths relative to temporary directory. $ expands to the directory. The tests are run in absTestDirs[0]. We create absTestDirs first. 

### <a id="basetests" href="#basetests">var basetests</a>

```
searchKey: filepath_test.basetests
tags: [variable array struct private]
```

```Go
var basetests = ...
```

### <a id="cleantests" href="#cleantests">var cleantests</a>

```
searchKey: filepath_test.cleantests
tags: [variable array struct private]
```

```Go
var cleantests = ...
```

### <a id="dirtests" href="#dirtests">var dirtests</a>

```
searchKey: filepath_test.dirtests
tags: [variable array struct private]
```

```Go
var dirtests = ...
```

### <a id="exttests" href="#exttests">var exttests</a>

```
searchKey: filepath_test.exttests
tags: [variable array struct private]
```

```Go
var exttests = ...
```

### <a id="globSymlinkTests" href="#globSymlinkTests">var globSymlinkTests</a>

```
searchKey: filepath_test.globSymlinkTests
tags: [variable array struct private]
```

```Go
var globSymlinkTests = ...
```

### <a id="globTests" href="#globTests">var globTests</a>

```
searchKey: filepath_test.globTests
tags: [variable array struct private]
```

```Go
var globTests = ...
```

### <a id="isabstests" href="#isabstests">var isabstests</a>

```
searchKey: filepath_test.isabstests
tags: [variable array struct private]
```

```Go
var isabstests = ...
```

### <a id="jointests" href="#jointests">var jointests</a>

```
searchKey: filepath_test.jointests
tags: [variable array struct private]
```

```Go
var jointests = ...
```

### <a id="matchTests" href="#matchTests">var matchTests</a>

```
searchKey: filepath_test.matchTests
tags: [variable array struct private]
```

```Go
var matchTests = ...
```

### <a id="reltests" href="#reltests">var reltests</a>

```
searchKey: filepath_test.reltests
tags: [variable array struct private]
```

```Go
var reltests = ...
```

### <a id="slashtests" href="#slashtests">var slashtests</a>

```
searchKey: filepath_test.slashtests
tags: [variable array struct private]
```

```Go
var slashtests = ...
```

### <a id="splitlisttests" href="#splitlisttests">var splitlisttests</a>

```
searchKey: filepath_test.splitlisttests
tags: [variable array struct private]
```

```Go
var splitlisttests = ...
```

### <a id="tree" href="#tree">var tree</a>

```
searchKey: filepath_test.tree
tags: [variable struct private]
```

```Go
var tree = ...
```

### <a id="unixsplittests" href="#unixsplittests">var unixsplittests</a>

```
searchKey: filepath_test.unixsplittests
tags: [variable array struct private]
```

```Go
var unixsplittests = ...
```

### <a id="volumenametests" href="#volumenametests">var volumenametests</a>

```
searchKey: filepath_test.volumenametests
tags: [variable array struct private]
```

```Go
var volumenametests = ...
```

### <a id="winbasetests" href="#winbasetests">var winbasetests</a>

```
searchKey: filepath_test.winbasetests
tags: [variable array struct private]
```

```Go
var winbasetests = ...
```

### <a id="wincleantests" href="#wincleantests">var wincleantests</a>

```
searchKey: filepath_test.wincleantests
tags: [variable array struct private]
```

```Go
var wincleantests = ...
```

### <a id="windirtests" href="#windirtests">var windirtests</a>

```
searchKey: filepath_test.windirtests
tags: [variable array struct private]
```

```Go
var windirtests = ...
```

### <a id="winisabstests" href="#winisabstests">var winisabstests</a>

```
searchKey: filepath_test.winisabstests
tags: [variable array struct private]
```

```Go
var winisabstests = ...
```

### <a id="winjointests" href="#winjointests">var winjointests</a>

```
searchKey: filepath_test.winjointests
tags: [variable array struct private]
```

```Go
var winjointests = ...
```

### <a id="winreltests" href="#winreltests">var winreltests</a>

```
searchKey: filepath_test.winreltests
tags: [variable array struct private]
```

```Go
var winreltests = ...
```

### <a id="winsplitlisttests" href="#winsplitlisttests">var winsplitlisttests</a>

```
searchKey: filepath_test.winsplitlisttests
tags: [variable array struct private]
```

```Go
var winsplitlisttests = ...
```

### <a id="winsplittests" href="#winsplittests">var winsplittests</a>

```
searchKey: filepath_test.winsplittests
tags: [variable array struct private]
```

```Go
var winsplittests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="EvalSymlinksTest" href="#EvalSymlinksTest">type EvalSymlinksTest struct</a>

```
searchKey: filepath_test.EvalSymlinksTest
tags: [struct private]
```

```Go
type EvalSymlinksTest struct {
	// If dest is empty, the path is created; otherwise the dest is symlinked to the path.
	path, dest string
}
```

### <a id="ExtTest" href="#ExtTest">type ExtTest struct</a>

```
searchKey: filepath_test.ExtTest
tags: [struct private]
```

```Go
type ExtTest struct {
	path, ext string
}
```

### <a id="IsAbsTest" href="#IsAbsTest">type IsAbsTest struct</a>

```
searchKey: filepath_test.IsAbsTest
tags: [struct private]
```

```Go
type IsAbsTest struct {
	path  string
	isAbs bool
}
```

### <a id="JoinTest" href="#JoinTest">type JoinTest struct</a>

```
searchKey: filepath_test.JoinTest
tags: [struct private]
```

```Go
type JoinTest struct {
	elem []string
	path string
}
```

### <a id="MatchTest" href="#MatchTest">type MatchTest struct</a>

```
searchKey: filepath_test.MatchTest
tags: [struct private]
```

```Go
type MatchTest struct {
	pattern, s string
	match      bool
	err        error
}
```

### <a id="Node" href="#Node">type Node struct</a>

```
searchKey: filepath_test.Node
tags: [struct private]
```

```Go
type Node struct {
	name    string
	entries []*Node // nil if the entry is a file
	mark    int
}
```

### <a id="PathTest" href="#PathTest">type PathTest struct</a>

```
searchKey: filepath_test.PathTest
tags: [struct private]
```

```Go
type PathTest struct {
	path, result string
}
```

### <a id="RelTests" href="#RelTests">type RelTests struct</a>

```
searchKey: filepath_test.RelTests
tags: [struct private]
```

```Go
type RelTests struct {
	root, path, want string
}
```

### <a id="SplitListTest" href="#SplitListTest">type SplitListTest struct</a>

```
searchKey: filepath_test.SplitListTest
tags: [struct private]
```

```Go
type SplitListTest struct {
	list   string
	result []string
}
```

### <a id="SplitTest" href="#SplitTest">type SplitTest struct</a>

```
searchKey: filepath_test.SplitTest
tags: [struct private]
```

```Go
type SplitTest struct {
	path, dir, file string
}
```

### <a id="VolumeNameTest" href="#VolumeNameTest">type VolumeNameTest struct</a>

```
searchKey: filepath_test.VolumeNameTest
tags: [struct private]
```

```Go
type VolumeNameTest struct {
	path string
	vol  string
}
```

### <a id="globTest" href="#globTest">type globTest struct</a>

```
searchKey: filepath_test.globTest
tags: [struct private]
```

```Go
type globTest struct {
	pattern string
	matches []string
}
```

#### <a id="globTest.buildWant" href="#globTest.buildWant">func (test *globTest) buildWant(root string) []string</a>

```
searchKey: filepath_test.globTest.buildWant
tags: [method private]
```

```Go
func (test *globTest) buildWant(root string) []string
```

#### <a id="globTest.globAbs" href="#globTest.globAbs">func (test *globTest) globAbs(root, rootPattern string) error</a>

```
searchKey: filepath_test.globTest.globAbs
tags: [method private]
```

```Go
func (test *globTest) globAbs(root, rootPattern string) error
```

#### <a id="globTest.globRel" href="#globTest.globRel">func (test *globTest) globRel(root string) error</a>

```
searchKey: filepath_test.globTest.globRel
tags: [method private]
```

```Go
func (test *globTest) globRel(root string) error
```

### <a id="statDirEntry" href="#statDirEntry">type statDirEntry struct</a>

```
searchKey: filepath_test.statDirEntry
tags: [struct private]
```

```Go
type statDirEntry struct {
	info fs.FileInfo
}
```

#### <a id="statDirEntry.Info" href="#statDirEntry.Info">func (d *statDirEntry) Info() (fs.FileInfo, error)</a>

```
searchKey: filepath_test.statDirEntry.Info
tags: [function private]
```

```Go
func (d *statDirEntry) Info() (fs.FileInfo, error)
```

#### <a id="statDirEntry.IsDir" href="#statDirEntry.IsDir">func (d *statDirEntry) IsDir() bool</a>

```
searchKey: filepath_test.statDirEntry.IsDir
tags: [function private]
```

```Go
func (d *statDirEntry) IsDir() bool
```

#### <a id="statDirEntry.Name" href="#statDirEntry.Name">func (d *statDirEntry) Name() string</a>

```
searchKey: filepath_test.statDirEntry.Name
tags: [function private]
```

```Go
func (d *statDirEntry) Name() string
```

#### <a id="statDirEntry.Type" href="#statDirEntry.Type">func (d *statDirEntry) Type() fs.FileMode</a>

```
searchKey: filepath_test.statDirEntry.Type
tags: [function private]
```

```Go
func (d *statDirEntry) Type() fs.FileMode
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="ExampleBase" href="#ExampleBase">func ExampleBase()</a>

```
searchKey: filepath_test.ExampleBase
tags: [function private]
```

```Go
func ExampleBase()
```

### <a id="ExampleDir" href="#ExampleDir">func ExampleDir()</a>

```
searchKey: filepath_test.ExampleDir
tags: [function private]
```

```Go
func ExampleDir()
```

### <a id="ExampleExt" href="#ExampleExt">func ExampleExt()</a>

```
searchKey: filepath_test.ExampleExt
tags: [function private]
```

```Go
func ExampleExt()
```

### <a id="ExampleIsAbs" href="#ExampleIsAbs">func ExampleIsAbs()</a>

```
searchKey: filepath_test.ExampleIsAbs
tags: [function private]
```

```Go
func ExampleIsAbs()
```

### <a id="ExampleJoin" href="#ExampleJoin">func ExampleJoin()</a>

```
searchKey: filepath_test.ExampleJoin
tags: [function private]
```

```Go
func ExampleJoin()
```

### <a id="ExampleMatch" href="#ExampleMatch">func ExampleMatch()</a>

```
searchKey: filepath_test.ExampleMatch
tags: [function private]
```

```Go
func ExampleMatch()
```

### <a id="ExampleRel" href="#ExampleRel">func ExampleRel()</a>

```
searchKey: filepath_test.ExampleRel
tags: [function private]
```

```Go
func ExampleRel()
```

### <a id="ExampleSplit" href="#ExampleSplit">func ExampleSplit()</a>

```
searchKey: filepath_test.ExampleSplit
tags: [function private]
```

```Go
func ExampleSplit()
```

### <a id="ExampleSplitList" href="#ExampleSplitList">func ExampleSplitList()</a>

```
searchKey: filepath_test.ExampleSplitList
tags: [function private]
```

```Go
func ExampleSplitList()
```

### <a id="ExampleWalk" href="#ExampleWalk">func ExampleWalk()</a>

```
searchKey: filepath_test.ExampleWalk
tags: [function private]
```

```Go
func ExampleWalk()
```

### <a id="TestAbs" href="#TestAbs">func TestAbs(t *testing.T)</a>

```
searchKey: filepath_test.TestAbs
tags: [method private test]
```

```Go
func TestAbs(t *testing.T)
```

### <a id="TestAbsEmptyString" href="#TestAbsEmptyString">func TestAbsEmptyString(t *testing.T)</a>

```
searchKey: filepath_test.TestAbsEmptyString
tags: [method private test]
```

```Go
func TestAbsEmptyString(t *testing.T)
```

Empty path needs to be special-cased on Windows. See golang.org/issue/24441. We test it separately from all other absTests because the empty string is not a valid path, so it can't be used with os.Stat. 

### <a id="TestBase" href="#TestBase">func TestBase(t *testing.T)</a>

```
searchKey: filepath_test.TestBase
tags: [method private test]
```

```Go
func TestBase(t *testing.T)
```

### <a id="TestBug3486" href="#TestBug3486">func TestBug3486(t *testing.T)</a>

```
searchKey: filepath_test.TestBug3486
tags: [method private test]
```

```Go
func TestBug3486(t *testing.T)
```

### <a id="TestClean" href="#TestClean">func TestClean(t *testing.T)</a>

```
searchKey: filepath_test.TestClean
tags: [method private test]
```

```Go
func TestClean(t *testing.T)
```

### <a id="TestDir" href="#TestDir">func TestDir(t *testing.T)</a>

```
searchKey: filepath_test.TestDir
tags: [method private test]
```

```Go
func TestDir(t *testing.T)
```

### <a id="TestDriveLetterInEvalSymlinks" href="#TestDriveLetterInEvalSymlinks">func TestDriveLetterInEvalSymlinks(t *testing.T)</a>

```
searchKey: filepath_test.TestDriveLetterInEvalSymlinks
tags: [method private test]
```

```Go
func TestDriveLetterInEvalSymlinks(t *testing.T)
```

### <a id="TestEvalSymlinks" href="#TestEvalSymlinks">func TestEvalSymlinks(t *testing.T)</a>

```
searchKey: filepath_test.TestEvalSymlinks
tags: [method private test]
```

```Go
func TestEvalSymlinks(t *testing.T)
```

### <a id="TestEvalSymlinksAboveRoot" href="#TestEvalSymlinksAboveRoot">func TestEvalSymlinksAboveRoot(t *testing.T)</a>

```
searchKey: filepath_test.TestEvalSymlinksAboveRoot
tags: [method private test]
```

```Go
func TestEvalSymlinksAboveRoot(t *testing.T)
```

Issue 30520 part 1. 

### <a id="TestEvalSymlinksAboveRootChdir" href="#TestEvalSymlinksAboveRootChdir">func TestEvalSymlinksAboveRootChdir(t *testing.T)</a>

```
searchKey: filepath_test.TestEvalSymlinksAboveRootChdir
tags: [method private test]
```

```Go
func TestEvalSymlinksAboveRootChdir(t *testing.T)
```

Issue 30520 part 2. 

### <a id="TestEvalSymlinksIsNotExist" href="#TestEvalSymlinksIsNotExist">func TestEvalSymlinksIsNotExist(t *testing.T)</a>

```
searchKey: filepath_test.TestEvalSymlinksIsNotExist
tags: [method private test]
```

```Go
func TestEvalSymlinksIsNotExist(t *testing.T)
```

### <a id="TestExt" href="#TestExt">func TestExt(t *testing.T)</a>

```
searchKey: filepath_test.TestExt
tags: [method private test]
```

```Go
func TestExt(t *testing.T)
```

### <a id="TestFromAndToSlash" href="#TestFromAndToSlash">func TestFromAndToSlash(t *testing.T)</a>

```
searchKey: filepath_test.TestFromAndToSlash
tags: [method private test]
```

```Go
func TestFromAndToSlash(t *testing.T)
```

### <a id="TestGlob" href="#TestGlob">func TestGlob(t *testing.T)</a>

```
searchKey: filepath_test.TestGlob
tags: [method private test]
```

```Go
func TestGlob(t *testing.T)
```

### <a id="TestGlobError" href="#TestGlobError">func TestGlobError(t *testing.T)</a>

```
searchKey: filepath_test.TestGlobError
tags: [method private test]
```

```Go
func TestGlobError(t *testing.T)
```

### <a id="TestGlobSymlink" href="#TestGlobSymlink">func TestGlobSymlink(t *testing.T)</a>

```
searchKey: filepath_test.TestGlobSymlink
tags: [method private test]
```

```Go
func TestGlobSymlink(t *testing.T)
```

### <a id="TestGlobUNC" href="#TestGlobUNC">func TestGlobUNC(t *testing.T)</a>

```
searchKey: filepath_test.TestGlobUNC
tags: [method private test]
```

```Go
func TestGlobUNC(t *testing.T)
```

### <a id="TestIsAbs" href="#TestIsAbs">func TestIsAbs(t *testing.T)</a>

```
searchKey: filepath_test.TestIsAbs
tags: [method private test]
```

```Go
func TestIsAbs(t *testing.T)
```

### <a id="TestIssue13582" href="#TestIssue13582">func TestIssue13582(t *testing.T)</a>

```
searchKey: filepath_test.TestIssue13582
tags: [method private test]
```

```Go
func TestIssue13582(t *testing.T)
```

### <a id="TestIssue29372" href="#TestIssue29372">func TestIssue29372(t *testing.T)</a>

```
searchKey: filepath_test.TestIssue29372
tags: [method private test]
```

```Go
func TestIssue29372(t *testing.T)
```

### <a id="TestJoin" href="#TestJoin">func TestJoin(t *testing.T)</a>

```
searchKey: filepath_test.TestJoin
tags: [method private test]
```

```Go
func TestJoin(t *testing.T)
```

### <a id="TestMatch" href="#TestMatch">func TestMatch(t *testing.T)</a>

```
searchKey: filepath_test.TestMatch
tags: [method private test]
```

```Go
func TestMatch(t *testing.T)
```

### <a id="TestNonWindowsGlobEscape" href="#TestNonWindowsGlobEscape">func TestNonWindowsGlobEscape(t *testing.T)</a>

```
searchKey: filepath_test.TestNonWindowsGlobEscape
tags: [method private test]
```

```Go
func TestNonWindowsGlobEscape(t *testing.T)
```

### <a id="TestRel" href="#TestRel">func TestRel(t *testing.T)</a>

```
searchKey: filepath_test.TestRel
tags: [method private test]
```

```Go
func TestRel(t *testing.T)
```

### <a id="TestSplit" href="#TestSplit">func TestSplit(t *testing.T)</a>

```
searchKey: filepath_test.TestSplit
tags: [method private test]
```

```Go
func TestSplit(t *testing.T)
```

### <a id="TestSplitList" href="#TestSplitList">func TestSplitList(t *testing.T)</a>

```
searchKey: filepath_test.TestSplitList
tags: [method private test]
```

```Go
func TestSplitList(t *testing.T)
```

### <a id="TestVolumeName" href="#TestVolumeName">func TestVolumeName(t *testing.T)</a>

```
searchKey: filepath_test.TestVolumeName
tags: [method private test]
```

```Go
func TestVolumeName(t *testing.T)
```

### <a id="TestWalk" href="#TestWalk">func TestWalk(t *testing.T)</a>

```
searchKey: filepath_test.TestWalk
tags: [method private test]
```

```Go
func TestWalk(t *testing.T)
```

### <a id="TestWalkDir" href="#TestWalkDir">func TestWalkDir(t *testing.T)</a>

```
searchKey: filepath_test.TestWalkDir
tags: [method private test]
```

```Go
func TestWalkDir(t *testing.T)
```

### <a id="TestWalkFileError" href="#TestWalkFileError">func TestWalkFileError(t *testing.T)</a>

```
searchKey: filepath_test.TestWalkFileError
tags: [method private test]
```

```Go
func TestWalkFileError(t *testing.T)
```

### <a id="TestWalkSkipDirOnFile" href="#TestWalkSkipDirOnFile">func TestWalkSkipDirOnFile(t *testing.T)</a>

```
searchKey: filepath_test.TestWalkSkipDirOnFile
tags: [method private test]
```

```Go
func TestWalkSkipDirOnFile(t *testing.T)
```

### <a id="TestWalkSymlink" href="#TestWalkSymlink">func TestWalkSymlink(t *testing.T)</a>

```
searchKey: filepath_test.TestWalkSymlink
tags: [method private test]
```

```Go
func TestWalkSymlink(t *testing.T)
```

### <a id="TestWindowsGlob" href="#TestWindowsGlob">func TestWindowsGlob(t *testing.T)</a>

```
searchKey: filepath_test.TestWindowsGlob
tags: [method private test]
```

```Go
func TestWindowsGlob(t *testing.T)
```

### <a id="chdir" href="#chdir">func chdir(t *testing.T, dir string)</a>

```
searchKey: filepath_test.chdir
tags: [method private]
```

```Go
func chdir(t *testing.T, dir string)
```

chdir changes the current working directory to the named directory, and then restore the original working directory at the end of the test. 

### <a id="checkMarks" href="#checkMarks">func checkMarks(t *testing.T, report bool)</a>

```
searchKey: filepath_test.checkMarks
tags: [method private]
```

```Go
func checkMarks(t *testing.T, report bool)
```

### <a id="chtmpdir" href="#chtmpdir">func chtmpdir(t *testing.T) (restore func())</a>

```
searchKey: filepath_test.chtmpdir
tags: [method private]
```

```Go
func chtmpdir(t *testing.T) (restore func())
```

### <a id="contains" href="#contains">func contains(vector []string, s string) bool</a>

```
searchKey: filepath_test.contains
tags: [method private]
```

```Go
func contains(vector []string, s string) bool
```

contains reports whether vector contains the string s. 

### <a id="errp" href="#errp">func errp(e error) string</a>

```
searchKey: filepath_test.errp
tags: [method private]
```

```Go
func errp(e error) string
```

### <a id="makeTree" href="#makeTree">func makeTree(t *testing.T)</a>

```
searchKey: filepath_test.makeTree
tags: [method private]
```

```Go
func makeTree(t *testing.T)
```

### <a id="mark" href="#mark">func mark(d fs.DirEntry, err error, errors *[]error, clear bool) error</a>

```
searchKey: filepath_test.mark
tags: [method private]
```

```Go
func mark(d fs.DirEntry, err error, errors *[]error, clear bool) error
```

Assumes that each node name is unique. Good enough for a test. If clear is true, any incoming error is cleared before return. The errors are always accumulated, though. 

### <a id="markTree" href="#markTree">func markTree(n *Node)</a>

```
searchKey: filepath_test.markTree
tags: [method private]
```

```Go
func markTree(n *Node)
```

### <a id="prepareTestDirTree" href="#prepareTestDirTree">func prepareTestDirTree(tree string) (string, error)</a>

```
searchKey: filepath_test.prepareTestDirTree
tags: [method private]
```

```Go
func prepareTestDirTree(tree string) (string, error)
```

### <a id="simpleJoin" href="#simpleJoin">func simpleJoin(dir, path string) string</a>

```
searchKey: filepath_test.simpleJoin
tags: [method private]
```

```Go
func simpleJoin(dir, path string) string
```

simpleJoin builds a file name from the directory and path. It does not use Join because we don't want ".." to be evaluated. 

### <a id="tempDirCanonical" href="#tempDirCanonical">func tempDirCanonical(t *testing.T) string</a>

```
searchKey: filepath_test.tempDirCanonical
tags: [method private]
```

```Go
func tempDirCanonical(t *testing.T) string
```

tempDirCanonical returns a temporary directory for the test to use, ensuring that the returned path does not contain symlinks. 

### <a id="testEvalSymlinks" href="#testEvalSymlinks">func testEvalSymlinks(t *testing.T, path, want string)</a>

```
searchKey: filepath_test.testEvalSymlinks
tags: [method private]
```

```Go
func testEvalSymlinks(t *testing.T, path, want string)
```

### <a id="testEvalSymlinksAfterChdir" href="#testEvalSymlinksAfterChdir">func testEvalSymlinksAfterChdir(t *testing.T, wd, path, want string)</a>

```
searchKey: filepath_test.testEvalSymlinksAfterChdir
tags: [method private]
```

```Go
func testEvalSymlinksAfterChdir(t *testing.T, wd, path, want string)
```

### <a id="testWalk" href="#testWalk">func testWalk(t *testing.T, walk func(string, fs.WalkDirFunc) error, errVisit int)</a>

```
searchKey: filepath_test.testWalk
tags: [method private]
```

```Go
func testWalk(t *testing.T, walk func(string, fs.WalkDirFunc) error, errVisit int)
```

### <a id="testWalkSymlink" href="#testWalkSymlink">func testWalkSymlink(t *testing.T, mklink func(target, link string) error)</a>

```
searchKey: filepath_test.testWalkSymlink
tags: [method private]
```

```Go
func testWalkSymlink(t *testing.T, mklink func(target, link string) error)
```

### <a id="touch" href="#touch">func touch(t *testing.T, name string)</a>

```
searchKey: filepath_test.touch
tags: [method private]
```

```Go
func touch(t *testing.T, name string)
```

### <a id="walkTree" href="#walkTree">func walkTree(n *Node, path string, f func(path string, n *Node))</a>

```
searchKey: filepath_test.walkTree
tags: [method private]
```

```Go
func walkTree(n *Node, path string, f func(path string, n *Node))
```

