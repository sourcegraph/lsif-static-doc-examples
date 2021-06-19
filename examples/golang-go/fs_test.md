# Package fs_test

## Index

* [Variables](#var)
    * [var isValidPathTests](#isValidPathTests)
    * [var globTests](#globTests)
    * [var testFsys](#testFsys)
    * [var sysValue](#sysValue)
    * [var tree](#tree)
* [Types](#type)
    * [type globOnly struct](#globOnly)
        * [func (globOnly) Open(name string) (File, error)](#globOnly.Open)
    * [type readDirOnly struct](#readDirOnly)
        * [func (readDirOnly) Open(name string) (File, error)](#readDirOnly.Open)
    * [type readFileOnly struct](#readFileOnly)
        * [func (readFileOnly) Open(name string) (File, error)](#readFileOnly.Open)
    * [type openOnly struct](#openOnly)
    * [type statOnly struct](#statOnly)
        * [func (statOnly) Open(name string) (File, error)](#statOnly.Open)
    * [type subOnly struct](#subOnly)
        * [func (subOnly) Open(name string) (File, error)](#subOnly.Open)
    * [type Node struct](#Node)
* [Functions](#func)
    * [func ExampleWalkDir()](#ExampleWalkDir)
    * [func TestValidPath(t *testing.T)](#TestValidPath)
    * [func TestGlob(t *testing.T)](#TestGlob)
    * [func TestGlobError(t *testing.T)](#TestGlobError)
    * [func contains(vector []string, s string) bool](#contains)
    * [func TestGlobMethod(t *testing.T)](#TestGlobMethod)
    * [func TestReadDir(t *testing.T)](#TestReadDir)
    * [func TestFileInfoToDirEntry(t *testing.T)](#TestFileInfoToDirEntry)
    * [func TestReadFile(t *testing.T)](#TestReadFile)
    * [func TestStat(t *testing.T)](#TestStat)
    * [func TestSub(t *testing.T)](#TestSub)
    * [func walkTree(n *Node, path string, f func(path string, n *Node))](#walkTree)
    * [func makeTree(t *testing.T) FS](#makeTree)
    * [func markTree(n *Node)](#markTree)
    * [func checkMarks(t *testing.T, report bool)](#checkMarks)
    * [func mark(entry DirEntry, err error, errors *[]error, clear bool) error](#mark)
    * [func TestWalkDir(t *testing.T)](#TestWalkDir)


## <a id="var" href="#var">Variables</a>

### <a id="isValidPathTests" href="#isValidPathTests">var isValidPathTests</a>

```
searchKey: fs_test.isValidPathTests
```

```Go
var isValidPathTests = ...
```

### <a id="globTests" href="#globTests">var globTests</a>

```
searchKey: fs_test.globTests
```

```Go
var globTests = ...
```

### <a id="testFsys" href="#testFsys">var testFsys</a>

```
searchKey: fs_test.testFsys
```

```Go
var testFsys = ...
```

### <a id="sysValue" href="#sysValue">var sysValue</a>

```
searchKey: fs_test.sysValue
```

```Go
var sysValue int
```

### <a id="tree" href="#tree">var tree</a>

```
searchKey: fs_test.tree
```

```Go
var tree = ...
```

## <a id="type" href="#type">Types</a>

### <a id="globOnly" href="#globOnly">type globOnly struct</a>

```
searchKey: fs_test.globOnly
```

```Go
type globOnly struct{ GlobFS }
```

#### <a id="globOnly.Open" href="#globOnly.Open">func (globOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.globOnly.Open
```

```Go
func (globOnly) Open(name string) (File, error)
```

### <a id="readDirOnly" href="#readDirOnly">type readDirOnly struct</a>

```
searchKey: fs_test.readDirOnly
```

```Go
type readDirOnly struct{ ReadDirFS }
```

#### <a id="readDirOnly.Open" href="#readDirOnly.Open">func (readDirOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.readDirOnly.Open
```

```Go
func (readDirOnly) Open(name string) (File, error)
```

### <a id="readFileOnly" href="#readFileOnly">type readFileOnly struct</a>

```
searchKey: fs_test.readFileOnly
```

```Go
type readFileOnly struct{ ReadFileFS }
```

#### <a id="readFileOnly.Open" href="#readFileOnly.Open">func (readFileOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.readFileOnly.Open
```

```Go
func (readFileOnly) Open(name string) (File, error)
```

### <a id="openOnly" href="#openOnly">type openOnly struct</a>

```
searchKey: fs_test.openOnly
```

```Go
type openOnly struct{ FS }
```

### <a id="statOnly" href="#statOnly">type statOnly struct</a>

```
searchKey: fs_test.statOnly
```

```Go
type statOnly struct{ StatFS }
```

#### <a id="statOnly.Open" href="#statOnly.Open">func (statOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.statOnly.Open
```

```Go
func (statOnly) Open(name string) (File, error)
```

### <a id="subOnly" href="#subOnly">type subOnly struct</a>

```
searchKey: fs_test.subOnly
```

```Go
type subOnly struct{ SubFS }
```

#### <a id="subOnly.Open" href="#subOnly.Open">func (subOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.subOnly.Open
```

```Go
func (subOnly) Open(name string) (File, error)
```

### <a id="Node" href="#Node">type Node struct</a>

```
searchKey: fs_test.Node
```

```Go
type Node struct {
	name    string
	entries []*Node // nil if the entry is a file
	mark    int
}
```

## <a id="func" href="#func">Functions</a>

### <a id="ExampleWalkDir" href="#ExampleWalkDir">func ExampleWalkDir()</a>

```
searchKey: fs_test.ExampleWalkDir
```

```Go
func ExampleWalkDir()
```

### <a id="TestValidPath" href="#TestValidPath">func TestValidPath(t *testing.T)</a>

```
searchKey: fs_test.TestValidPath
```

```Go
func TestValidPath(t *testing.T)
```

### <a id="TestGlob" href="#TestGlob">func TestGlob(t *testing.T)</a>

```
searchKey: fs_test.TestGlob
```

```Go
func TestGlob(t *testing.T)
```

### <a id="TestGlobError" href="#TestGlobError">func TestGlobError(t *testing.T)</a>

```
searchKey: fs_test.TestGlobError
```

```Go
func TestGlobError(t *testing.T)
```

### <a id="contains" href="#contains">func contains(vector []string, s string) bool</a>

```
searchKey: fs_test.contains
```

```Go
func contains(vector []string, s string) bool
```

contains reports whether vector contains the string s. 

### <a id="TestGlobMethod" href="#TestGlobMethod">func TestGlobMethod(t *testing.T)</a>

```
searchKey: fs_test.TestGlobMethod
```

```Go
func TestGlobMethod(t *testing.T)
```

### <a id="TestReadDir" href="#TestReadDir">func TestReadDir(t *testing.T)</a>

```
searchKey: fs_test.TestReadDir
```

```Go
func TestReadDir(t *testing.T)
```

### <a id="TestFileInfoToDirEntry" href="#TestFileInfoToDirEntry">func TestFileInfoToDirEntry(t *testing.T)</a>

```
searchKey: fs_test.TestFileInfoToDirEntry
```

```Go
func TestFileInfoToDirEntry(t *testing.T)
```

### <a id="TestReadFile" href="#TestReadFile">func TestReadFile(t *testing.T)</a>

```
searchKey: fs_test.TestReadFile
```

```Go
func TestReadFile(t *testing.T)
```

### <a id="TestStat" href="#TestStat">func TestStat(t *testing.T)</a>

```
searchKey: fs_test.TestStat
```

```Go
func TestStat(t *testing.T)
```

### <a id="TestSub" href="#TestSub">func TestSub(t *testing.T)</a>

```
searchKey: fs_test.TestSub
```

```Go
func TestSub(t *testing.T)
```

### <a id="walkTree" href="#walkTree">func walkTree(n *Node, path string, f func(path string, n *Node))</a>

```
searchKey: fs_test.walkTree
```

```Go
func walkTree(n *Node, path string, f func(path string, n *Node))
```

### <a id="makeTree" href="#makeTree">func makeTree(t *testing.T) FS</a>

```
searchKey: fs_test.makeTree
```

```Go
func makeTree(t *testing.T) FS
```

### <a id="markTree" href="#markTree">func markTree(n *Node)</a>

```
searchKey: fs_test.markTree
```

```Go
func markTree(n *Node)
```

### <a id="checkMarks" href="#checkMarks">func checkMarks(t *testing.T, report bool)</a>

```
searchKey: fs_test.checkMarks
```

```Go
func checkMarks(t *testing.T, report bool)
```

### <a id="mark" href="#mark">func mark(entry DirEntry, err error, errors *[]error, clear bool) error</a>

```
searchKey: fs_test.mark
```

```Go
func mark(entry DirEntry, err error, errors *[]error, clear bool) error
```

Assumes that each node name is unique. Good enough for a test. If clear is true, any incoming error is cleared before return. The errors are always accumulated, though. 

### <a id="TestWalkDir" href="#TestWalkDir">func TestWalkDir(t *testing.T)</a>

```
searchKey: fs_test.TestWalkDir
```

```Go
func TestWalkDir(t *testing.T)
```

