# Package filepath_test

## Index

* [Constants](#const)
    * [const sep](#sep)
    * [const lsep](#lsep)
* [Variables](#var)
    * [var matchTests](#matchTests)
    * [var globTests](#globTests)
    * [var globSymlinkTests](#globSymlinkTests)
    * [var cleantests](#cleantests)
    * [var wincleantests](#wincleantests)
    * [var slashtests](#slashtests)
    * [var splitlisttests](#splitlisttests)
    * [var winsplitlisttests](#winsplitlisttests)
    * [var unixsplittests](#unixsplittests)
    * [var winsplittests](#winsplittests)
    * [var jointests](#jointests)
    * [var winjointests](#winjointests)
    * [var exttests](#exttests)
    * [var tree](#tree)
    * [var basetests](#basetests)
    * [var winbasetests](#winbasetests)
    * [var dirtests](#dirtests)
    * [var windirtests](#windirtests)
    * [var isabstests](#isabstests)
    * [var winisabstests](#winisabstests)
    * [var EvalSymlinksTestDirs](#EvalSymlinksTestDirs)
    * [var EvalSymlinksTests](#EvalSymlinksTests)
    * [var absTestDirs](#absTestDirs)
    * [var absTests](#absTests)
    * [var reltests](#reltests)
    * [var winreltests](#winreltests)
    * [var volumenametests](#volumenametests)
* [Types](#type)
    * [type MatchTest struct](#MatchTest)
    * [type globTest struct](#globTest)
        * [func (test *globTest) buildWant(root string) []string](#globTest.buildWant)
        * [func (test *globTest) globAbs(root, rootPattern string) error](#globTest.globAbs)
        * [func (test *globTest) globRel(root string) error](#globTest.globRel)
    * [type PathTest struct](#PathTest)
    * [type SplitListTest struct](#SplitListTest)
    * [type SplitTest struct](#SplitTest)
    * [type JoinTest struct](#JoinTest)
    * [type ExtTest struct](#ExtTest)
    * [type Node struct](#Node)
    * [type statDirEntry struct](#statDirEntry)
        * [func (d *statDirEntry) Name() string](#statDirEntry.Name)
        * [func (d *statDirEntry) IsDir() bool](#statDirEntry.IsDir)
        * [func (d *statDirEntry) Type() fs.FileMode](#statDirEntry.Type)
        * [func (d *statDirEntry) Info() (fs.FileInfo, error)](#statDirEntry.Info)
    * [type IsAbsTest struct](#IsAbsTest)
    * [type EvalSymlinksTest struct](#EvalSymlinksTest)
    * [type RelTests struct](#RelTests)
    * [type VolumeNameTest struct](#VolumeNameTest)
* [Functions](#func)
    * [func ExampleExt()](#ExampleExt)
    * [func ExampleSplitList()](#ExampleSplitList)
    * [func ExampleRel()](#ExampleRel)
    * [func ExampleSplit()](#ExampleSplit)
    * [func ExampleJoin()](#ExampleJoin)
    * [func ExampleMatch()](#ExampleMatch)
    * [func ExampleBase()](#ExampleBase)
    * [func ExampleDir()](#ExampleDir)
    * [func ExampleIsAbs()](#ExampleIsAbs)
    * [func prepareTestDirTree(tree string) (string, error)](#prepareTestDirTree)
    * [func ExampleWalk()](#ExampleWalk)
    * [func errp(e error) string](#errp)
    * [func TestMatch(t *testing.T)](#TestMatch)
    * [func contains(vector []string, s string) bool](#contains)
    * [func TestGlob(t *testing.T)](#TestGlob)
    * [func TestGlobError(t *testing.T)](#TestGlobError)
    * [func TestGlobUNC(t *testing.T)](#TestGlobUNC)
    * [func TestGlobSymlink(t *testing.T)](#TestGlobSymlink)
    * [func TestWindowsGlob(t *testing.T)](#TestWindowsGlob)
    * [func TestNonWindowsGlobEscape(t *testing.T)](#TestNonWindowsGlobEscape)
    * [func TestClean(t *testing.T)](#TestClean)
    * [func TestFromAndToSlash(t *testing.T)](#TestFromAndToSlash)
    * [func TestSplitList(t *testing.T)](#TestSplitList)
    * [func TestSplit(t *testing.T)](#TestSplit)
    * [func TestJoin(t *testing.T)](#TestJoin)
    * [func TestExt(t *testing.T)](#TestExt)
    * [func walkTree(n *Node, path string, f func(path string, n *Node))](#walkTree)
    * [func makeTree(t *testing.T)](#makeTree)
    * [func markTree(n *Node)](#markTree)
    * [func checkMarks(t *testing.T, report bool)](#checkMarks)
    * [func mark(d fs.DirEntry, err error, errors *[]error, clear bool) error](#mark)
    * [func chdir(t *testing.T, dir string)](#chdir)
    * [func chtmpdir(t *testing.T) (restore func())](#chtmpdir)
    * [func tempDirCanonical(t *testing.T) string](#tempDirCanonical)
    * [func TestWalk(t *testing.T)](#TestWalk)
    * [func TestWalkDir(t *testing.T)](#TestWalkDir)
    * [func testWalk(t *testing.T, walk func(string, fs.WalkDirFunc) error, errVisit int)](#testWalk)
    * [func touch(t *testing.T, name string)](#touch)
    * [func TestWalkSkipDirOnFile(t *testing.T)](#TestWalkSkipDirOnFile)
    * [func TestWalkFileError(t *testing.T)](#TestWalkFileError)
    * [func TestBase(t *testing.T)](#TestBase)
    * [func TestDir(t *testing.T)](#TestDir)
    * [func TestIsAbs(t *testing.T)](#TestIsAbs)
    * [func simpleJoin(dir, path string) string](#simpleJoin)
    * [func testEvalSymlinks(t *testing.T, path, want string)](#testEvalSymlinks)
    * [func testEvalSymlinksAfterChdir(t *testing.T, wd, path, want string)](#testEvalSymlinksAfterChdir)
    * [func TestEvalSymlinks(t *testing.T)](#TestEvalSymlinks)
    * [func TestEvalSymlinksIsNotExist(t *testing.T)](#TestEvalSymlinksIsNotExist)
    * [func TestIssue13582(t *testing.T)](#TestIssue13582)
    * [func TestAbs(t *testing.T)](#TestAbs)
    * [func TestAbsEmptyString(t *testing.T)](#TestAbsEmptyString)
    * [func TestRel(t *testing.T)](#TestRel)
    * [func TestVolumeName(t *testing.T)](#TestVolumeName)
    * [func TestDriveLetterInEvalSymlinks(t *testing.T)](#TestDriveLetterInEvalSymlinks)
    * [func TestBug3486(t *testing.T)](#TestBug3486)
    * [func testWalkSymlink(t *testing.T, mklink func(target, link string) error)](#testWalkSymlink)
    * [func TestWalkSymlink(t *testing.T)](#TestWalkSymlink)
    * [func TestIssue29372(t *testing.T)](#TestIssue29372)
    * [func TestEvalSymlinksAboveRoot(t *testing.T)](#TestEvalSymlinksAboveRoot)
    * [func TestEvalSymlinksAboveRootChdir(t *testing.T)](#TestEvalSymlinksAboveRootChdir)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="sep" href="#sep">const sep</a>

```
searchKey: filepath_test.sep
tags: [private]
```

```Go
const sep = filepath.Separator
```

### <a id="lsep" href="#lsep">const lsep</a>

```
searchKey: filepath_test.lsep
tags: [private]
```

```Go
const lsep = filepath.ListSeparator
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="matchTests" href="#matchTests">var matchTests</a>

```
searchKey: filepath_test.matchTests
tags: [private]
```

```Go
var matchTests = ...
```

### <a id="globTests" href="#globTests">var globTests</a>

```
searchKey: filepath_test.globTests
tags: [private]
```

```Go
var globTests = ...
```

### <a id="globSymlinkTests" href="#globSymlinkTests">var globSymlinkTests</a>

```
searchKey: filepath_test.globSymlinkTests
tags: [private]
```

```Go
var globSymlinkTests = ...
```

### <a id="cleantests" href="#cleantests">var cleantests</a>

```
searchKey: filepath_test.cleantests
tags: [private]
```

```Go
var cleantests = ...
```

### <a id="wincleantests" href="#wincleantests">var wincleantests</a>

```
searchKey: filepath_test.wincleantests
tags: [private]
```

```Go
var wincleantests = ...
```

### <a id="slashtests" href="#slashtests">var slashtests</a>

```
searchKey: filepath_test.slashtests
tags: [private]
```

```Go
var slashtests = ...
```

### <a id="splitlisttests" href="#splitlisttests">var splitlisttests</a>

```
searchKey: filepath_test.splitlisttests
tags: [private]
```

```Go
var splitlisttests = ...
```

### <a id="winsplitlisttests" href="#winsplitlisttests">var winsplitlisttests</a>

```
searchKey: filepath_test.winsplitlisttests
tags: [private]
```

```Go
var winsplitlisttests = ...
```

### <a id="unixsplittests" href="#unixsplittests">var unixsplittests</a>

```
searchKey: filepath_test.unixsplittests
tags: [private]
```

```Go
var unixsplittests = ...
```

### <a id="winsplittests" href="#winsplittests">var winsplittests</a>

```
searchKey: filepath_test.winsplittests
tags: [private]
```

```Go
var winsplittests = ...
```

### <a id="jointests" href="#jointests">var jointests</a>

```
searchKey: filepath_test.jointests
tags: [private]
```

```Go
var jointests = ...
```

### <a id="winjointests" href="#winjointests">var winjointests</a>

```
searchKey: filepath_test.winjointests
tags: [private]
```

```Go
var winjointests = ...
```

### <a id="exttests" href="#exttests">var exttests</a>

```
searchKey: filepath_test.exttests
tags: [private]
```

```Go
var exttests = ...
```

### <a id="tree" href="#tree">var tree</a>

```
searchKey: filepath_test.tree
tags: [private]
```

```Go
var tree = ...
```

### <a id="basetests" href="#basetests">var basetests</a>

```
searchKey: filepath_test.basetests
tags: [private]
```

```Go
var basetests = ...
```

### <a id="winbasetests" href="#winbasetests">var winbasetests</a>

```
searchKey: filepath_test.winbasetests
tags: [private]
```

```Go
var winbasetests = ...
```

### <a id="dirtests" href="#dirtests">var dirtests</a>

```
searchKey: filepath_test.dirtests
tags: [private]
```

```Go
var dirtests = ...
```

### <a id="windirtests" href="#windirtests">var windirtests</a>

```
searchKey: filepath_test.windirtests
tags: [private]
```

```Go
var windirtests = ...
```

### <a id="isabstests" href="#isabstests">var isabstests</a>

```
searchKey: filepath_test.isabstests
tags: [private]
```

```Go
var isabstests = ...
```

### <a id="winisabstests" href="#winisabstests">var winisabstests</a>

```
searchKey: filepath_test.winisabstests
tags: [private]
```

```Go
var winisabstests = ...
```

### <a id="EvalSymlinksTestDirs" href="#EvalSymlinksTestDirs">var EvalSymlinksTestDirs</a>

```
searchKey: filepath_test.EvalSymlinksTestDirs
tags: [private]
```

```Go
var EvalSymlinksTestDirs = ...
```

### <a id="EvalSymlinksTests" href="#EvalSymlinksTests">var EvalSymlinksTests</a>

```
searchKey: filepath_test.EvalSymlinksTests
tags: [private]
```

```Go
var EvalSymlinksTests = ...
```

### <a id="absTestDirs" href="#absTestDirs">var absTestDirs</a>

```
searchKey: filepath_test.absTestDirs
tags: [private]
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
tags: [private]
```

```Go
var absTests = ...
```

Test paths relative to temporary directory. $ expands to the directory. The tests are run in absTestDirs[0]. We create absTestDirs first. 

### <a id="reltests" href="#reltests">var reltests</a>

```
searchKey: filepath_test.reltests
tags: [private]
```

```Go
var reltests = ...
```

### <a id="winreltests" href="#winreltests">var winreltests</a>

```
searchKey: filepath_test.winreltests
tags: [private]
```

```Go
var winreltests = ...
```

### <a id="volumenametests" href="#volumenametests">var volumenametests</a>

```
searchKey: filepath_test.volumenametests
tags: [private]
```

```Go
var volumenametests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="MatchTest" href="#MatchTest">type MatchTest struct</a>

```
searchKey: filepath_test.MatchTest
tags: [private]
```

```Go
type MatchTest struct {
	pattern, s string
	match      bool
	err        error
}
```

### <a id="globTest" href="#globTest">type globTest struct</a>

```
searchKey: filepath_test.globTest
tags: [private]
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
tags: [private]
```

```Go
func (test *globTest) buildWant(root string) []string
```

#### <a id="globTest.globAbs" href="#globTest.globAbs">func (test *globTest) globAbs(root, rootPattern string) error</a>

```
searchKey: filepath_test.globTest.globAbs
tags: [private]
```

```Go
func (test *globTest) globAbs(root, rootPattern string) error
```

#### <a id="globTest.globRel" href="#globTest.globRel">func (test *globTest) globRel(root string) error</a>

```
searchKey: filepath_test.globTest.globRel
tags: [private]
```

```Go
func (test *globTest) globRel(root string) error
```

### <a id="PathTest" href="#PathTest">type PathTest struct</a>

```
searchKey: filepath_test.PathTest
tags: [private]
```

```Go
type PathTest struct {
	path, result string
}
```

### <a id="SplitListTest" href="#SplitListTest">type SplitListTest struct</a>

```
searchKey: filepath_test.SplitListTest
tags: [private]
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
tags: [private]
```

```Go
type SplitTest struct {
	path, dir, file string
}
```

### <a id="JoinTest" href="#JoinTest">type JoinTest struct</a>

```
searchKey: filepath_test.JoinTest
tags: [private]
```

```Go
type JoinTest struct {
	elem []string
	path string
}
```

### <a id="ExtTest" href="#ExtTest">type ExtTest struct</a>

```
searchKey: filepath_test.ExtTest
tags: [private]
```

```Go
type ExtTest struct {
	path, ext string
}
```

### <a id="Node" href="#Node">type Node struct</a>

```
searchKey: filepath_test.Node
tags: [private]
```

```Go
type Node struct {
	name    string
	entries []*Node // nil if the entry is a file
	mark    int
}
```

### <a id="statDirEntry" href="#statDirEntry">type statDirEntry struct</a>

```
searchKey: filepath_test.statDirEntry
tags: [private]
```

```Go
type statDirEntry struct {
	info fs.FileInfo
}
```

#### <a id="statDirEntry.Name" href="#statDirEntry.Name">func (d *statDirEntry) Name() string</a>

```
searchKey: filepath_test.statDirEntry.Name
tags: [private]
```

```Go
func (d *statDirEntry) Name() string
```

#### <a id="statDirEntry.IsDir" href="#statDirEntry.IsDir">func (d *statDirEntry) IsDir() bool</a>

```
searchKey: filepath_test.statDirEntry.IsDir
tags: [private]
```

```Go
func (d *statDirEntry) IsDir() bool
```

#### <a id="statDirEntry.Type" href="#statDirEntry.Type">func (d *statDirEntry) Type() fs.FileMode</a>

```
searchKey: filepath_test.statDirEntry.Type
tags: [private]
```

```Go
func (d *statDirEntry) Type() fs.FileMode
```

#### <a id="statDirEntry.Info" href="#statDirEntry.Info">func (d *statDirEntry) Info() (fs.FileInfo, error)</a>

```
searchKey: filepath_test.statDirEntry.Info
tags: [private]
```

```Go
func (d *statDirEntry) Info() (fs.FileInfo, error)
```

### <a id="IsAbsTest" href="#IsAbsTest">type IsAbsTest struct</a>

```
searchKey: filepath_test.IsAbsTest
tags: [private]
```

```Go
type IsAbsTest struct {
	path  string
	isAbs bool
}
```

### <a id="EvalSymlinksTest" href="#EvalSymlinksTest">type EvalSymlinksTest struct</a>

```
searchKey: filepath_test.EvalSymlinksTest
tags: [private]
```

```Go
type EvalSymlinksTest struct {
	// If dest is empty, the path is created; otherwise the dest is symlinked to the path.
	path, dest string
}
```

### <a id="RelTests" href="#RelTests">type RelTests struct</a>

```
searchKey: filepath_test.RelTests
tags: [private]
```

```Go
type RelTests struct {
	root, path, want string
}
```

### <a id="VolumeNameTest" href="#VolumeNameTest">type VolumeNameTest struct</a>

```
searchKey: filepath_test.VolumeNameTest
tags: [private]
```

```Go
type VolumeNameTest struct {
	path string
	vol  string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleExt" href="#ExampleExt">func ExampleExt()</a>

```
searchKey: filepath_test.ExampleExt
tags: [private]
```

```Go
func ExampleExt()
```

### <a id="ExampleSplitList" href="#ExampleSplitList">func ExampleSplitList()</a>

```
searchKey: filepath_test.ExampleSplitList
tags: [private]
```

```Go
func ExampleSplitList()
```

### <a id="ExampleRel" href="#ExampleRel">func ExampleRel()</a>

```
searchKey: filepath_test.ExampleRel
tags: [private]
```

```Go
func ExampleRel()
```

### <a id="ExampleSplit" href="#ExampleSplit">func ExampleSplit()</a>

```
searchKey: filepath_test.ExampleSplit
tags: [private]
```

```Go
func ExampleSplit()
```

### <a id="ExampleJoin" href="#ExampleJoin">func ExampleJoin()</a>

```
searchKey: filepath_test.ExampleJoin
tags: [private]
```

```Go
func ExampleJoin()
```

### <a id="ExampleMatch" href="#ExampleMatch">func ExampleMatch()</a>

```
searchKey: filepath_test.ExampleMatch
tags: [private]
```

```Go
func ExampleMatch()
```

### <a id="ExampleBase" href="#ExampleBase">func ExampleBase()</a>

```
searchKey: filepath_test.ExampleBase
tags: [private]
```

```Go
func ExampleBase()
```

### <a id="ExampleDir" href="#ExampleDir">func ExampleDir()</a>

```
searchKey: filepath_test.ExampleDir
tags: [private]
```

```Go
func ExampleDir()
```

### <a id="ExampleIsAbs" href="#ExampleIsAbs">func ExampleIsAbs()</a>

```
searchKey: filepath_test.ExampleIsAbs
tags: [private]
```

```Go
func ExampleIsAbs()
```

### <a id="prepareTestDirTree" href="#prepareTestDirTree">func prepareTestDirTree(tree string) (string, error)</a>

```
searchKey: filepath_test.prepareTestDirTree
tags: [private]
```

```Go
func prepareTestDirTree(tree string) (string, error)
```

### <a id="ExampleWalk" href="#ExampleWalk">func ExampleWalk()</a>

```
searchKey: filepath_test.ExampleWalk
tags: [private]
```

```Go
func ExampleWalk()
```

### <a id="errp" href="#errp">func errp(e error) string</a>

```
searchKey: filepath_test.errp
tags: [private]
```

```Go
func errp(e error) string
```

### <a id="TestMatch" href="#TestMatch">func TestMatch(t *testing.T)</a>

```
searchKey: filepath_test.TestMatch
tags: [private]
```

```Go
func TestMatch(t *testing.T)
```

### <a id="contains" href="#contains">func contains(vector []string, s string) bool</a>

```
searchKey: filepath_test.contains
tags: [private]
```

```Go
func contains(vector []string, s string) bool
```

contains reports whether vector contains the string s. 

### <a id="TestGlob" href="#TestGlob">func TestGlob(t *testing.T)</a>

```
searchKey: filepath_test.TestGlob
tags: [private]
```

```Go
func TestGlob(t *testing.T)
```

### <a id="TestGlobError" href="#TestGlobError">func TestGlobError(t *testing.T)</a>

```
searchKey: filepath_test.TestGlobError
tags: [private]
```

```Go
func TestGlobError(t *testing.T)
```

### <a id="TestGlobUNC" href="#TestGlobUNC">func TestGlobUNC(t *testing.T)</a>

```
searchKey: filepath_test.TestGlobUNC
tags: [private]
```

```Go
func TestGlobUNC(t *testing.T)
```

### <a id="TestGlobSymlink" href="#TestGlobSymlink">func TestGlobSymlink(t *testing.T)</a>

```
searchKey: filepath_test.TestGlobSymlink
tags: [private]
```

```Go
func TestGlobSymlink(t *testing.T)
```

### <a id="TestWindowsGlob" href="#TestWindowsGlob">func TestWindowsGlob(t *testing.T)</a>

```
searchKey: filepath_test.TestWindowsGlob
tags: [private]
```

```Go
func TestWindowsGlob(t *testing.T)
```

### <a id="TestNonWindowsGlobEscape" href="#TestNonWindowsGlobEscape">func TestNonWindowsGlobEscape(t *testing.T)</a>

```
searchKey: filepath_test.TestNonWindowsGlobEscape
tags: [private]
```

```Go
func TestNonWindowsGlobEscape(t *testing.T)
```

### <a id="TestClean" href="#TestClean">func TestClean(t *testing.T)</a>

```
searchKey: filepath_test.TestClean
tags: [private]
```

```Go
func TestClean(t *testing.T)
```

### <a id="TestFromAndToSlash" href="#TestFromAndToSlash">func TestFromAndToSlash(t *testing.T)</a>

```
searchKey: filepath_test.TestFromAndToSlash
tags: [private]
```

```Go
func TestFromAndToSlash(t *testing.T)
```

### <a id="TestSplitList" href="#TestSplitList">func TestSplitList(t *testing.T)</a>

```
searchKey: filepath_test.TestSplitList
tags: [private]
```

```Go
func TestSplitList(t *testing.T)
```

### <a id="TestSplit" href="#TestSplit">func TestSplit(t *testing.T)</a>

```
searchKey: filepath_test.TestSplit
tags: [private]
```

```Go
func TestSplit(t *testing.T)
```

### <a id="TestJoin" href="#TestJoin">func TestJoin(t *testing.T)</a>

```
searchKey: filepath_test.TestJoin
tags: [private]
```

```Go
func TestJoin(t *testing.T)
```

### <a id="TestExt" href="#TestExt">func TestExt(t *testing.T)</a>

```
searchKey: filepath_test.TestExt
tags: [private]
```

```Go
func TestExt(t *testing.T)
```

### <a id="walkTree" href="#walkTree">func walkTree(n *Node, path string, f func(path string, n *Node))</a>

```
searchKey: filepath_test.walkTree
tags: [private]
```

```Go
func walkTree(n *Node, path string, f func(path string, n *Node))
```

### <a id="makeTree" href="#makeTree">func makeTree(t *testing.T)</a>

```
searchKey: filepath_test.makeTree
tags: [private]
```

```Go
func makeTree(t *testing.T)
```

### <a id="markTree" href="#markTree">func markTree(n *Node)</a>

```
searchKey: filepath_test.markTree
tags: [private]
```

```Go
func markTree(n *Node)
```

### <a id="checkMarks" href="#checkMarks">func checkMarks(t *testing.T, report bool)</a>

```
searchKey: filepath_test.checkMarks
tags: [private]
```

```Go
func checkMarks(t *testing.T, report bool)
```

### <a id="mark" href="#mark">func mark(d fs.DirEntry, err error, errors *[]error, clear bool) error</a>

```
searchKey: filepath_test.mark
tags: [private]
```

```Go
func mark(d fs.DirEntry, err error, errors *[]error, clear bool) error
```

Assumes that each node name is unique. Good enough for a test. If clear is true, any incoming error is cleared before return. The errors are always accumulated, though. 

### <a id="chdir" href="#chdir">func chdir(t *testing.T, dir string)</a>

```
searchKey: filepath_test.chdir
tags: [private]
```

```Go
func chdir(t *testing.T, dir string)
```

chdir changes the current working directory to the named directory, and then restore the original working directory at the end of the test. 

### <a id="chtmpdir" href="#chtmpdir">func chtmpdir(t *testing.T) (restore func())</a>

```
searchKey: filepath_test.chtmpdir
tags: [private]
```

```Go
func chtmpdir(t *testing.T) (restore func())
```

### <a id="tempDirCanonical" href="#tempDirCanonical">func tempDirCanonical(t *testing.T) string</a>

```
searchKey: filepath_test.tempDirCanonical
tags: [private]
```

```Go
func tempDirCanonical(t *testing.T) string
```

tempDirCanonical returns a temporary directory for the test to use, ensuring that the returned path does not contain symlinks. 

### <a id="TestWalk" href="#TestWalk">func TestWalk(t *testing.T)</a>

```
searchKey: filepath_test.TestWalk
tags: [private]
```

```Go
func TestWalk(t *testing.T)
```

### <a id="TestWalkDir" href="#TestWalkDir">func TestWalkDir(t *testing.T)</a>

```
searchKey: filepath_test.TestWalkDir
tags: [private]
```

```Go
func TestWalkDir(t *testing.T)
```

### <a id="testWalk" href="#testWalk">func testWalk(t *testing.T, walk func(string, fs.WalkDirFunc) error, errVisit int)</a>

```
searchKey: filepath_test.testWalk
tags: [private]
```

```Go
func testWalk(t *testing.T, walk func(string, fs.WalkDirFunc) error, errVisit int)
```

### <a id="touch" href="#touch">func touch(t *testing.T, name string)</a>

```
searchKey: filepath_test.touch
tags: [private]
```

```Go
func touch(t *testing.T, name string)
```

### <a id="TestWalkSkipDirOnFile" href="#TestWalkSkipDirOnFile">func TestWalkSkipDirOnFile(t *testing.T)</a>

```
searchKey: filepath_test.TestWalkSkipDirOnFile
tags: [private]
```

```Go
func TestWalkSkipDirOnFile(t *testing.T)
```

### <a id="TestWalkFileError" href="#TestWalkFileError">func TestWalkFileError(t *testing.T)</a>

```
searchKey: filepath_test.TestWalkFileError
tags: [private]
```

```Go
func TestWalkFileError(t *testing.T)
```

### <a id="TestBase" href="#TestBase">func TestBase(t *testing.T)</a>

```
searchKey: filepath_test.TestBase
tags: [private]
```

```Go
func TestBase(t *testing.T)
```

### <a id="TestDir" href="#TestDir">func TestDir(t *testing.T)</a>

```
searchKey: filepath_test.TestDir
tags: [private]
```

```Go
func TestDir(t *testing.T)
```

### <a id="TestIsAbs" href="#TestIsAbs">func TestIsAbs(t *testing.T)</a>

```
searchKey: filepath_test.TestIsAbs
tags: [private]
```

```Go
func TestIsAbs(t *testing.T)
```

### <a id="simpleJoin" href="#simpleJoin">func simpleJoin(dir, path string) string</a>

```
searchKey: filepath_test.simpleJoin
tags: [private]
```

```Go
func simpleJoin(dir, path string) string
```

simpleJoin builds a file name from the directory and path. It does not use Join because we don't want ".." to be evaluated. 

### <a id="testEvalSymlinks" href="#testEvalSymlinks">func testEvalSymlinks(t *testing.T, path, want string)</a>

```
searchKey: filepath_test.testEvalSymlinks
tags: [private]
```

```Go
func testEvalSymlinks(t *testing.T, path, want string)
```

### <a id="testEvalSymlinksAfterChdir" href="#testEvalSymlinksAfterChdir">func testEvalSymlinksAfterChdir(t *testing.T, wd, path, want string)</a>

```
searchKey: filepath_test.testEvalSymlinksAfterChdir
tags: [private]
```

```Go
func testEvalSymlinksAfterChdir(t *testing.T, wd, path, want string)
```

### <a id="TestEvalSymlinks" href="#TestEvalSymlinks">func TestEvalSymlinks(t *testing.T)</a>

```
searchKey: filepath_test.TestEvalSymlinks
tags: [private]
```

```Go
func TestEvalSymlinks(t *testing.T)
```

### <a id="TestEvalSymlinksIsNotExist" href="#TestEvalSymlinksIsNotExist">func TestEvalSymlinksIsNotExist(t *testing.T)</a>

```
searchKey: filepath_test.TestEvalSymlinksIsNotExist
tags: [private]
```

```Go
func TestEvalSymlinksIsNotExist(t *testing.T)
```

### <a id="TestIssue13582" href="#TestIssue13582">func TestIssue13582(t *testing.T)</a>

```
searchKey: filepath_test.TestIssue13582
tags: [private]
```

```Go
func TestIssue13582(t *testing.T)
```

### <a id="TestAbs" href="#TestAbs">func TestAbs(t *testing.T)</a>

```
searchKey: filepath_test.TestAbs
tags: [private]
```

```Go
func TestAbs(t *testing.T)
```

### <a id="TestAbsEmptyString" href="#TestAbsEmptyString">func TestAbsEmptyString(t *testing.T)</a>

```
searchKey: filepath_test.TestAbsEmptyString
tags: [private]
```

```Go
func TestAbsEmptyString(t *testing.T)
```

Empty path needs to be special-cased on Windows. See golang.org/issue/24441. We test it separately from all other absTests because the empty string is not a valid path, so it can't be used with os.Stat. 

### <a id="TestRel" href="#TestRel">func TestRel(t *testing.T)</a>

```
searchKey: filepath_test.TestRel
tags: [private]
```

```Go
func TestRel(t *testing.T)
```

### <a id="TestVolumeName" href="#TestVolumeName">func TestVolumeName(t *testing.T)</a>

```
searchKey: filepath_test.TestVolumeName
tags: [private]
```

```Go
func TestVolumeName(t *testing.T)
```

### <a id="TestDriveLetterInEvalSymlinks" href="#TestDriveLetterInEvalSymlinks">func TestDriveLetterInEvalSymlinks(t *testing.T)</a>

```
searchKey: filepath_test.TestDriveLetterInEvalSymlinks
tags: [private]
```

```Go
func TestDriveLetterInEvalSymlinks(t *testing.T)
```

### <a id="TestBug3486" href="#TestBug3486">func TestBug3486(t *testing.T)</a>

```
searchKey: filepath_test.TestBug3486
tags: [private]
```

```Go
func TestBug3486(t *testing.T)
```

### <a id="testWalkSymlink" href="#testWalkSymlink">func testWalkSymlink(t *testing.T, mklink func(target, link string) error)</a>

```
searchKey: filepath_test.testWalkSymlink
tags: [private]
```

```Go
func testWalkSymlink(t *testing.T, mklink func(target, link string) error)
```

### <a id="TestWalkSymlink" href="#TestWalkSymlink">func TestWalkSymlink(t *testing.T)</a>

```
searchKey: filepath_test.TestWalkSymlink
tags: [private]
```

```Go
func TestWalkSymlink(t *testing.T)
```

### <a id="TestIssue29372" href="#TestIssue29372">func TestIssue29372(t *testing.T)</a>

```
searchKey: filepath_test.TestIssue29372
tags: [private]
```

```Go
func TestIssue29372(t *testing.T)
```

### <a id="TestEvalSymlinksAboveRoot" href="#TestEvalSymlinksAboveRoot">func TestEvalSymlinksAboveRoot(t *testing.T)</a>

```
searchKey: filepath_test.TestEvalSymlinksAboveRoot
tags: [private]
```

```Go
func TestEvalSymlinksAboveRoot(t *testing.T)
```

Issue 30520 part 1. 

### <a id="TestEvalSymlinksAboveRootChdir" href="#TestEvalSymlinksAboveRootChdir">func TestEvalSymlinksAboveRootChdir(t *testing.T)</a>

```
searchKey: filepath_test.TestEvalSymlinksAboveRootChdir
tags: [private]
```

```Go
func TestEvalSymlinksAboveRootChdir(t *testing.T)
```

Issue 30520 part 2. 

