# Package path_test

## Index

* [Variables](#var)
    * [var basetests](#basetests)
    * [var cleantests](#cleantests)
    * [var dirtests](#dirtests)
    * [var exttests](#exttests)
    * [var isAbsTests](#isAbsTests)
    * [var jointests](#jointests)
    * [var matchTests](#matchTests)
    * [var splittests](#splittests)
* [Types](#type)
    * [type ExtTest struct](#ExtTest)
    * [type IsAbsTest struct](#IsAbsTest)
    * [type JoinTest struct](#JoinTest)
    * [type MatchTest struct](#MatchTest)
    * [type PathTest struct](#PathTest)
    * [type SplitTest struct](#SplitTest)
* [Functions](#func)
    * [func ExampleBase()](#ExampleBase)
    * [func ExampleClean()](#ExampleClean)
    * [func ExampleDir()](#ExampleDir)
    * [func ExampleExt()](#ExampleExt)
    * [func ExampleIsAbs()](#ExampleIsAbs)
    * [func ExampleJoin()](#ExampleJoin)
    * [func ExampleMatch()](#ExampleMatch)
    * [func ExampleSplit()](#ExampleSplit)
    * [func TestBase(t *testing.T)](#TestBase)
    * [func TestClean(t *testing.T)](#TestClean)
    * [func TestCleanMallocs(t *testing.T)](#TestCleanMallocs)
    * [func TestDir(t *testing.T)](#TestDir)
    * [func TestExt(t *testing.T)](#TestExt)
    * [func TestIsAbs(t *testing.T)](#TestIsAbs)
    * [func TestJoin(t *testing.T)](#TestJoin)
    * [func TestMatch(t *testing.T)](#TestMatch)
    * [func TestSplit(t *testing.T)](#TestSplit)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="basetests" href="#basetests">var basetests</a>

```
searchKey: path_test.basetests
tags: [variable array struct private]
```

```Go
var basetests = ...
```

### <a id="cleantests" href="#cleantests">var cleantests</a>

```
searchKey: path_test.cleantests
tags: [variable array struct private]
```

```Go
var cleantests = ...
```

### <a id="dirtests" href="#dirtests">var dirtests</a>

```
searchKey: path_test.dirtests
tags: [variable array struct private]
```

```Go
var dirtests = ...
```

### <a id="exttests" href="#exttests">var exttests</a>

```
searchKey: path_test.exttests
tags: [variable array struct private]
```

```Go
var exttests = ...
```

### <a id="isAbsTests" href="#isAbsTests">var isAbsTests</a>

```
searchKey: path_test.isAbsTests
tags: [variable array struct private]
```

```Go
var isAbsTests = ...
```

### <a id="jointests" href="#jointests">var jointests</a>

```
searchKey: path_test.jointests
tags: [variable array struct private]
```

```Go
var jointests = ...
```

### <a id="matchTests" href="#matchTests">var matchTests</a>

```
searchKey: path_test.matchTests
tags: [variable array struct private]
```

```Go
var matchTests = ...
```

### <a id="splittests" href="#splittests">var splittests</a>

```
searchKey: path_test.splittests
tags: [variable array struct private]
```

```Go
var splittests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="ExtTest" href="#ExtTest">type ExtTest struct</a>

```
searchKey: path_test.ExtTest
tags: [struct private]
```

```Go
type ExtTest struct {
	path, ext string
}
```

### <a id="IsAbsTest" href="#IsAbsTest">type IsAbsTest struct</a>

```
searchKey: path_test.IsAbsTest
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
searchKey: path_test.JoinTest
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
searchKey: path_test.MatchTest
tags: [struct private]
```

```Go
type MatchTest struct {
	pattern, s string
	match      bool
	err        error
}
```

### <a id="PathTest" href="#PathTest">type PathTest struct</a>

```
searchKey: path_test.PathTest
tags: [struct private]
```

```Go
type PathTest struct {
	path, result string
}
```

### <a id="SplitTest" href="#SplitTest">type SplitTest struct</a>

```
searchKey: path_test.SplitTest
tags: [struct private]
```

```Go
type SplitTest struct {
	path, dir, file string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="ExampleBase" href="#ExampleBase">func ExampleBase()</a>

```
searchKey: path_test.ExampleBase
tags: [function private]
```

```Go
func ExampleBase()
```

### <a id="ExampleClean" href="#ExampleClean">func ExampleClean()</a>

```
searchKey: path_test.ExampleClean
tags: [function private]
```

```Go
func ExampleClean()
```

### <a id="ExampleDir" href="#ExampleDir">func ExampleDir()</a>

```
searchKey: path_test.ExampleDir
tags: [function private]
```

```Go
func ExampleDir()
```

### <a id="ExampleExt" href="#ExampleExt">func ExampleExt()</a>

```
searchKey: path_test.ExampleExt
tags: [function private]
```

```Go
func ExampleExt()
```

### <a id="ExampleIsAbs" href="#ExampleIsAbs">func ExampleIsAbs()</a>

```
searchKey: path_test.ExampleIsAbs
tags: [function private]
```

```Go
func ExampleIsAbs()
```

### <a id="ExampleJoin" href="#ExampleJoin">func ExampleJoin()</a>

```
searchKey: path_test.ExampleJoin
tags: [function private]
```

```Go
func ExampleJoin()
```

### <a id="ExampleMatch" href="#ExampleMatch">func ExampleMatch()</a>

```
searchKey: path_test.ExampleMatch
tags: [function private]
```

```Go
func ExampleMatch()
```

### <a id="ExampleSplit" href="#ExampleSplit">func ExampleSplit()</a>

```
searchKey: path_test.ExampleSplit
tags: [function private]
```

```Go
func ExampleSplit()
```

### <a id="TestBase" href="#TestBase">func TestBase(t *testing.T)</a>

```
searchKey: path_test.TestBase
tags: [method private test]
```

```Go
func TestBase(t *testing.T)
```

### <a id="TestClean" href="#TestClean">func TestClean(t *testing.T)</a>

```
searchKey: path_test.TestClean
tags: [method private test]
```

```Go
func TestClean(t *testing.T)
```

### <a id="TestCleanMallocs" href="#TestCleanMallocs">func TestCleanMallocs(t *testing.T)</a>

```
searchKey: path_test.TestCleanMallocs
tags: [method private test]
```

```Go
func TestCleanMallocs(t *testing.T)
```

### <a id="TestDir" href="#TestDir">func TestDir(t *testing.T)</a>

```
searchKey: path_test.TestDir
tags: [method private test]
```

```Go
func TestDir(t *testing.T)
```

### <a id="TestExt" href="#TestExt">func TestExt(t *testing.T)</a>

```
searchKey: path_test.TestExt
tags: [method private test]
```

```Go
func TestExt(t *testing.T)
```

### <a id="TestIsAbs" href="#TestIsAbs">func TestIsAbs(t *testing.T)</a>

```
searchKey: path_test.TestIsAbs
tags: [method private test]
```

```Go
func TestIsAbs(t *testing.T)
```

### <a id="TestJoin" href="#TestJoin">func TestJoin(t *testing.T)</a>

```
searchKey: path_test.TestJoin
tags: [method private test]
```

```Go
func TestJoin(t *testing.T)
```

### <a id="TestMatch" href="#TestMatch">func TestMatch(t *testing.T)</a>

```
searchKey: path_test.TestMatch
tags: [method private test]
```

```Go
func TestMatch(t *testing.T)
```

### <a id="TestSplit" href="#TestSplit">func TestSplit(t *testing.T)</a>

```
searchKey: path_test.TestSplit
tags: [method private test]
```

```Go
func TestSplit(t *testing.T)
```

