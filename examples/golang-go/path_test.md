# Package path_test

## Index

* [Variables](#var)
    * [var matchTests](#matchTests)
    * [var cleantests](#cleantests)
    * [var splittests](#splittests)
    * [var jointests](#jointests)
    * [var exttests](#exttests)
    * [var basetests](#basetests)
    * [var dirtests](#dirtests)
    * [var isAbsTests](#isAbsTests)
* [Types](#type)
    * [type MatchTest struct](#MatchTest)
    * [type PathTest struct](#PathTest)
    * [type SplitTest struct](#SplitTest)
    * [type JoinTest struct](#JoinTest)
    * [type ExtTest struct](#ExtTest)
    * [type IsAbsTest struct](#IsAbsTest)
* [Functions](#func)
    * [func ExampleBase()](#ExampleBase)
    * [func ExampleClean()](#ExampleClean)
    * [func ExampleDir()](#ExampleDir)
    * [func ExampleExt()](#ExampleExt)
    * [func ExampleIsAbs()](#ExampleIsAbs)
    * [func ExampleJoin()](#ExampleJoin)
    * [func ExampleMatch()](#ExampleMatch)
    * [func ExampleSplit()](#ExampleSplit)
    * [func TestMatch(t *testing.T)](#TestMatch)
    * [func TestClean(t *testing.T)](#TestClean)
    * [func TestCleanMallocs(t *testing.T)](#TestCleanMallocs)
    * [func TestSplit(t *testing.T)](#TestSplit)
    * [func TestJoin(t *testing.T)](#TestJoin)
    * [func TestExt(t *testing.T)](#TestExt)
    * [func TestBase(t *testing.T)](#TestBase)
    * [func TestDir(t *testing.T)](#TestDir)
    * [func TestIsAbs(t *testing.T)](#TestIsAbs)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="matchTests" href="#matchTests">var matchTests</a>

```
searchKey: path_test.matchTests
tags: [private]
```

```Go
var matchTests = ...
```

### <a id="cleantests" href="#cleantests">var cleantests</a>

```
searchKey: path_test.cleantests
tags: [private]
```

```Go
var cleantests = ...
```

### <a id="splittests" href="#splittests">var splittests</a>

```
searchKey: path_test.splittests
tags: [private]
```

```Go
var splittests = ...
```

### <a id="jointests" href="#jointests">var jointests</a>

```
searchKey: path_test.jointests
tags: [private]
```

```Go
var jointests = ...
```

### <a id="exttests" href="#exttests">var exttests</a>

```
searchKey: path_test.exttests
tags: [private]
```

```Go
var exttests = ...
```

### <a id="basetests" href="#basetests">var basetests</a>

```
searchKey: path_test.basetests
tags: [private]
```

```Go
var basetests = ...
```

### <a id="dirtests" href="#dirtests">var dirtests</a>

```
searchKey: path_test.dirtests
tags: [private]
```

```Go
var dirtests = ...
```

### <a id="isAbsTests" href="#isAbsTests">var isAbsTests</a>

```
searchKey: path_test.isAbsTests
tags: [private]
```

```Go
var isAbsTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="MatchTest" href="#MatchTest">type MatchTest struct</a>

```
searchKey: path_test.MatchTest
tags: [private]
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
tags: [private]
```

```Go
type PathTest struct {
	path, result string
}
```

### <a id="SplitTest" href="#SplitTest">type SplitTest struct</a>

```
searchKey: path_test.SplitTest
tags: [private]
```

```Go
type SplitTest struct {
	path, dir, file string
}
```

### <a id="JoinTest" href="#JoinTest">type JoinTest struct</a>

```
searchKey: path_test.JoinTest
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
searchKey: path_test.ExtTest
tags: [private]
```

```Go
type ExtTest struct {
	path, ext string
}
```

### <a id="IsAbsTest" href="#IsAbsTest">type IsAbsTest struct</a>

```
searchKey: path_test.IsAbsTest
tags: [private]
```

```Go
type IsAbsTest struct {
	path  string
	isAbs bool
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleBase" href="#ExampleBase">func ExampleBase()</a>

```
searchKey: path_test.ExampleBase
tags: [private]
```

```Go
func ExampleBase()
```

### <a id="ExampleClean" href="#ExampleClean">func ExampleClean()</a>

```
searchKey: path_test.ExampleClean
tags: [private]
```

```Go
func ExampleClean()
```

### <a id="ExampleDir" href="#ExampleDir">func ExampleDir()</a>

```
searchKey: path_test.ExampleDir
tags: [private]
```

```Go
func ExampleDir()
```

### <a id="ExampleExt" href="#ExampleExt">func ExampleExt()</a>

```
searchKey: path_test.ExampleExt
tags: [private]
```

```Go
func ExampleExt()
```

### <a id="ExampleIsAbs" href="#ExampleIsAbs">func ExampleIsAbs()</a>

```
searchKey: path_test.ExampleIsAbs
tags: [private]
```

```Go
func ExampleIsAbs()
```

### <a id="ExampleJoin" href="#ExampleJoin">func ExampleJoin()</a>

```
searchKey: path_test.ExampleJoin
tags: [private]
```

```Go
func ExampleJoin()
```

### <a id="ExampleMatch" href="#ExampleMatch">func ExampleMatch()</a>

```
searchKey: path_test.ExampleMatch
tags: [private]
```

```Go
func ExampleMatch()
```

### <a id="ExampleSplit" href="#ExampleSplit">func ExampleSplit()</a>

```
searchKey: path_test.ExampleSplit
tags: [private]
```

```Go
func ExampleSplit()
```

### <a id="TestMatch" href="#TestMatch">func TestMatch(t *testing.T)</a>

```
searchKey: path_test.TestMatch
tags: [private]
```

```Go
func TestMatch(t *testing.T)
```

### <a id="TestClean" href="#TestClean">func TestClean(t *testing.T)</a>

```
searchKey: path_test.TestClean
tags: [private]
```

```Go
func TestClean(t *testing.T)
```

### <a id="TestCleanMallocs" href="#TestCleanMallocs">func TestCleanMallocs(t *testing.T)</a>

```
searchKey: path_test.TestCleanMallocs
tags: [private]
```

```Go
func TestCleanMallocs(t *testing.T)
```

### <a id="TestSplit" href="#TestSplit">func TestSplit(t *testing.T)</a>

```
searchKey: path_test.TestSplit
tags: [private]
```

```Go
func TestSplit(t *testing.T)
```

### <a id="TestJoin" href="#TestJoin">func TestJoin(t *testing.T)</a>

```
searchKey: path_test.TestJoin
tags: [private]
```

```Go
func TestJoin(t *testing.T)
```

### <a id="TestExt" href="#TestExt">func TestExt(t *testing.T)</a>

```
searchKey: path_test.TestExt
tags: [private]
```

```Go
func TestExt(t *testing.T)
```

### <a id="TestBase" href="#TestBase">func TestBase(t *testing.T)</a>

```
searchKey: path_test.TestBase
tags: [private]
```

```Go
func TestBase(t *testing.T)
```

### <a id="TestDir" href="#TestDir">func TestDir(t *testing.T)</a>

```
searchKey: path_test.TestDir
tags: [private]
```

```Go
func TestDir(t *testing.T)
```

### <a id="TestIsAbs" href="#TestIsAbs">func TestIsAbs(t *testing.T)</a>

```
searchKey: path_test.TestIsAbs
tags: [private]
```

```Go
func TestIsAbs(t *testing.T)
```

