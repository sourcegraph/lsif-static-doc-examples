# Package fs_test

## Index

* [Variables](#var)
    * [var globTests](#globTests)
    * [var isValidPathTests](#isValidPathTests)
    * [var sysValue](#sysValue)
    * [var testFsys](#testFsys)
    * [var tree](#tree)
* [Types](#type)
    * [type Node struct](#Node)
    * [type globOnly struct](#globOnly)
        * [func (globOnly) Open(name string) (File, error)](#globOnly.Open)
    * [type openOnly struct](#openOnly)
    * [type readDirOnly struct](#readDirOnly)
        * [func (readDirOnly) Open(name string) (File, error)](#readDirOnly.Open)
    * [type readFileOnly struct](#readFileOnly)
        * [func (readFileOnly) Open(name string) (File, error)](#readFileOnly.Open)
    * [type statOnly struct](#statOnly)
        * [func (statOnly) Open(name string) (File, error)](#statOnly.Open)
    * [type subOnly struct](#subOnly)
        * [func (subOnly) Open(name string) (File, error)](#subOnly.Open)
* [Functions](#func)
    * [func ExampleWalkDir()](#ExampleWalkDir)
    * [func TestFileInfoToDirEntry(t *testing.T)](#TestFileInfoToDirEntry)
    * [func TestGlob(t *testing.T)](#TestGlob)
    * [func TestGlobError(t *testing.T)](#TestGlobError)
    * [func TestGlobMethod(t *testing.T)](#TestGlobMethod)
    * [func TestReadDir(t *testing.T)](#TestReadDir)
    * [func TestReadFile(t *testing.T)](#TestReadFile)
    * [func TestStat(t *testing.T)](#TestStat)
    * [func TestSub(t *testing.T)](#TestSub)
    * [func TestValidPath(t *testing.T)](#TestValidPath)
    * [func TestWalkDir(t *testing.T)](#TestWalkDir)
    * [func checkMarks(t *testing.T, report bool)](#checkMarks)
    * [func contains(vector []string, s string) bool](#contains)
    * [func makeTree(t *testing.T) FS](#makeTree)
    * [func mark(entry DirEntry, err error, errors *[]error, clear bool) error](#mark)
    * [func markTree(n *Node)](#markTree)
    * [func walkTree(n *Node, path string, f func(path string, n *Node))](#walkTree)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="globTests" href="#globTests">var globTests</a>

```
searchKey: fs_test.globTests
tags: [variable array struct private]
```

```Go
var globTests = ...
```

### <a id="isValidPathTests" href="#isValidPathTests">var isValidPathTests</a>

```
searchKey: fs_test.isValidPathTests
tags: [variable array struct private]
```

```Go
var isValidPathTests = ...
```

### <a id="sysValue" href="#sysValue">var sysValue</a>

```
searchKey: fs_test.sysValue
tags: [variable number private]
```

```Go
var sysValue int
```

### <a id="testFsys" href="#testFsys">var testFsys</a>

```
searchKey: fs_test.testFsys
tags: [variable object private]
```

```Go
var testFsys = ...
```

### <a id="tree" href="#tree">var tree</a>

```
searchKey: fs_test.tree
tags: [variable struct private]
```

```Go
var tree = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Node" href="#Node">type Node struct</a>

```
searchKey: fs_test.Node
tags: [struct private]
```

```Go
type Node struct {
	name    string
	entries []*Node // nil if the entry is a file
	mark    int
}
```

### <a id="globOnly" href="#globOnly">type globOnly struct</a>

```
searchKey: fs_test.globOnly
tags: [struct private]
```

```Go
type globOnly struct{ GlobFS }
```

#### <a id="globOnly.Open" href="#globOnly.Open">func (globOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.globOnly.Open
tags: [method private]
```

```Go
func (globOnly) Open(name string) (File, error)
```

### <a id="openOnly" href="#openOnly">type openOnly struct</a>

```
searchKey: fs_test.openOnly
tags: [struct private]
```

```Go
type openOnly struct{ FS }
```

### <a id="readDirOnly" href="#readDirOnly">type readDirOnly struct</a>

```
searchKey: fs_test.readDirOnly
tags: [struct private]
```

```Go
type readDirOnly struct{ ReadDirFS }
```

#### <a id="readDirOnly.Open" href="#readDirOnly.Open">func (readDirOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.readDirOnly.Open
tags: [method private]
```

```Go
func (readDirOnly) Open(name string) (File, error)
```

### <a id="readFileOnly" href="#readFileOnly">type readFileOnly struct</a>

```
searchKey: fs_test.readFileOnly
tags: [struct private]
```

```Go
type readFileOnly struct{ ReadFileFS }
```

#### <a id="readFileOnly.Open" href="#readFileOnly.Open">func (readFileOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.readFileOnly.Open
tags: [method private]
```

```Go
func (readFileOnly) Open(name string) (File, error)
```

### <a id="statOnly" href="#statOnly">type statOnly struct</a>

```
searchKey: fs_test.statOnly
tags: [struct private]
```

```Go
type statOnly struct{ StatFS }
```

#### <a id="statOnly.Open" href="#statOnly.Open">func (statOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.statOnly.Open
tags: [method private]
```

```Go
func (statOnly) Open(name string) (File, error)
```

### <a id="subOnly" href="#subOnly">type subOnly struct</a>

```
searchKey: fs_test.subOnly
tags: [struct private]
```

```Go
type subOnly struct{ SubFS }
```

#### <a id="subOnly.Open" href="#subOnly.Open">func (subOnly) Open(name string) (File, error)</a>

```
searchKey: fs_test.subOnly.Open
tags: [method private]
```

```Go
func (subOnly) Open(name string) (File, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="ExampleWalkDir" href="#ExampleWalkDir">func ExampleWalkDir()</a>

```
searchKey: fs_test.ExampleWalkDir
tags: [function private]
```

```Go
func ExampleWalkDir()
```

### <a id="TestFileInfoToDirEntry" href="#TestFileInfoToDirEntry">func TestFileInfoToDirEntry(t *testing.T)</a>

```
searchKey: fs_test.TestFileInfoToDirEntry
tags: [method private test]
```

```Go
func TestFileInfoToDirEntry(t *testing.T)
```

### <a id="TestGlob" href="#TestGlob">func TestGlob(t *testing.T)</a>

```
searchKey: fs_test.TestGlob
tags: [method private test]
```

```Go
func TestGlob(t *testing.T)
```

### <a id="TestGlobError" href="#TestGlobError">func TestGlobError(t *testing.T)</a>

```
searchKey: fs_test.TestGlobError
tags: [method private test]
```

```Go
func TestGlobError(t *testing.T)
```

### <a id="TestGlobMethod" href="#TestGlobMethod">func TestGlobMethod(t *testing.T)</a>

```
searchKey: fs_test.TestGlobMethod
tags: [method private test]
```

```Go
func TestGlobMethod(t *testing.T)
```

### <a id="TestReadDir" href="#TestReadDir">func TestReadDir(t *testing.T)</a>

```
searchKey: fs_test.TestReadDir
tags: [method private test]
```

```Go
func TestReadDir(t *testing.T)
```

### <a id="TestReadFile" href="#TestReadFile">func TestReadFile(t *testing.T)</a>

```
searchKey: fs_test.TestReadFile
tags: [method private test]
```

```Go
func TestReadFile(t *testing.T)
```

### <a id="TestStat" href="#TestStat">func TestStat(t *testing.T)</a>

```
searchKey: fs_test.TestStat
tags: [method private test]
```

```Go
func TestStat(t *testing.T)
```

### <a id="TestSub" href="#TestSub">func TestSub(t *testing.T)</a>

```
searchKey: fs_test.TestSub
tags: [method private test]
```

```Go
func TestSub(t *testing.T)
```

### <a id="TestValidPath" href="#TestValidPath">func TestValidPath(t *testing.T)</a>

```
searchKey: fs_test.TestValidPath
tags: [method private test]
```

```Go
func TestValidPath(t *testing.T)
```

### <a id="TestWalkDir" href="#TestWalkDir">func TestWalkDir(t *testing.T)</a>

```
searchKey: fs_test.TestWalkDir
tags: [method private test]
```

```Go
func TestWalkDir(t *testing.T)
```

### <a id="checkMarks" href="#checkMarks">func checkMarks(t *testing.T, report bool)</a>

```
searchKey: fs_test.checkMarks
tags: [method private]
```

```Go
func checkMarks(t *testing.T, report bool)
```

### <a id="contains" href="#contains">func contains(vector []string, s string) bool</a>

```
searchKey: fs_test.contains
tags: [method private]
```

```Go
func contains(vector []string, s string) bool
```

contains reports whether vector contains the string s. 

### <a id="makeTree" href="#makeTree">func makeTree(t *testing.T) FS</a>

```
searchKey: fs_test.makeTree
tags: [method private]
```

```Go
func makeTree(t *testing.T) FS
```

### <a id="mark" href="#mark">func mark(entry DirEntry, err error, errors *[]error, clear bool) error</a>

```
searchKey: fs_test.mark
tags: [method private]
```

```Go
func mark(entry DirEntry, err error, errors *[]error, clear bool) error
```

Assumes that each node name is unique. Good enough for a test. If clear is true, any incoming error is cleared before return. The errors are always accumulated, though. 

### <a id="markTree" href="#markTree">func markTree(n *Node)</a>

```
searchKey: fs_test.markTree
tags: [method private]
```

```Go
func markTree(n *Node)
```

### <a id="walkTree" href="#walkTree">func walkTree(n *Node, path string, f func(path string, n *Node))</a>

```
searchKey: fs_test.walkTree
tags: [method private]
```

```Go
func walkTree(n *Node, path string, f func(path string, n *Node))
```

