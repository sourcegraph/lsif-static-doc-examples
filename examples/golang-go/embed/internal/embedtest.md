# Package embedtest

## Index

* [Variables](#var)
    * [var concurrency](#concurrency)
    * [var glass](#glass)
    * [var global](#global)
    * [var testDirAll](#testDirAll)
    * [var testHiddenDir](#testHiddenDir)
    * [var testHiddenStar](#testHiddenStar)
* [Functions](#func)
    * [func TestDir(t *testing.T)](#TestDir)
    * [func TestGlobal(t *testing.T)](#TestGlobal)
    * [func TestHidden(t *testing.T)](#TestHidden)
    * [func TestUninitialized(t *testing.T)](#TestUninitialized)
    * [func testDir(t *testing.T, f embed.FS, name string, expect ...string)](#testDir)
    * [func testFiles(t *testing.T, f embed.FS, name, data string)](#testFiles)
    * [func testString(t *testing.T, s, name, data string)](#testString)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="concurrency" href="#concurrency">var concurrency</a>

```
searchKey: embedtest.concurrency
tags: [variable string private]
```

```Go
var concurrency string
```

### <a id="glass" href="#glass">var glass</a>

```
searchKey: embedtest.glass
tags: [variable array number private]
```

```Go
var glass []byte
```

### <a id="global" href="#global">var global</a>

```
searchKey: embedtest.global
tags: [variable struct private]
```

```Go
var global embed.FS
```

### <a id="testDirAll" href="#testDirAll">var testDirAll</a>

```
searchKey: embedtest.testDirAll
tags: [variable struct private]
```

```Go
var testDirAll embed.FS
```

### <a id="testHiddenDir" href="#testHiddenDir">var testHiddenDir</a>

```
searchKey: embedtest.testHiddenDir
tags: [variable struct private]
```

```Go
var testHiddenDir embed.FS
```

### <a id="testHiddenStar" href="#testHiddenStar">var testHiddenStar</a>

```
searchKey: embedtest.testHiddenStar
tags: [variable struct private]
```

```Go
var testHiddenStar embed.FS
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestDir" href="#TestDir">func TestDir(t *testing.T)</a>

```
searchKey: embedtest.TestDir
tags: [method private test]
```

```Go
func TestDir(t *testing.T)
```

### <a id="TestGlobal" href="#TestGlobal">func TestGlobal(t *testing.T)</a>

```
searchKey: embedtest.TestGlobal
tags: [method private test]
```

```Go
func TestGlobal(t *testing.T)
```

### <a id="TestHidden" href="#TestHidden">func TestHidden(t *testing.T)</a>

```
searchKey: embedtest.TestHidden
tags: [method private test]
```

```Go
func TestHidden(t *testing.T)
```

### <a id="TestUninitialized" href="#TestUninitialized">func TestUninitialized(t *testing.T)</a>

```
searchKey: embedtest.TestUninitialized
tags: [method private test]
```

```Go
func TestUninitialized(t *testing.T)
```

### <a id="testDir" href="#testDir">func testDir(t *testing.T, f embed.FS, name string, expect ...string)</a>

```
searchKey: embedtest.testDir
tags: [method private]
```

```Go
func testDir(t *testing.T, f embed.FS, name string, expect ...string)
```

### <a id="testFiles" href="#testFiles">func testFiles(t *testing.T, f embed.FS, name, data string)</a>

```
searchKey: embedtest.testFiles
tags: [method private]
```

```Go
func testFiles(t *testing.T, f embed.FS, name, data string)
```

### <a id="testString" href="#testString">func testString(t *testing.T, s, name, data string)</a>

```
searchKey: embedtest.testString
tags: [method private]
```

```Go
func testString(t *testing.T, s, name, data string)
```

