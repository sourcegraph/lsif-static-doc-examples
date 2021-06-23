# Package embedtest

## Index

* [Variables](#var)
    * [var global](#global)
    * [var concurrency](#concurrency)
    * [var glass](#glass)
    * [var testDirAll](#testDirAll)
    * [var testHiddenDir](#testHiddenDir)
    * [var testHiddenStar](#testHiddenStar)
* [Functions](#func)
    * [func testFiles(t *testing.T, f embed.FS, name, data string)](#testFiles)
    * [func testString(t *testing.T, s, name, data string)](#testString)
    * [func testDir(t *testing.T, f embed.FS, name string, expect ...string)](#testDir)
    * [func TestGlobal(t *testing.T)](#TestGlobal)
    * [func TestDir(t *testing.T)](#TestDir)
    * [func TestHidden(t *testing.T)](#TestHidden)
    * [func TestUninitialized(t *testing.T)](#TestUninitialized)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="global" href="#global">var global</a>

```
searchKey: embedtest.global
tags: [private]
```

```Go
var global embed.FS
```

### <a id="concurrency" href="#concurrency">var concurrency</a>

```
searchKey: embedtest.concurrency
tags: [private]
```

```Go
var concurrency string
```

### <a id="glass" href="#glass">var glass</a>

```
searchKey: embedtest.glass
tags: [private]
```

```Go
var glass []byte
```

### <a id="testDirAll" href="#testDirAll">var testDirAll</a>

```
searchKey: embedtest.testDirAll
tags: [private]
```

```Go
var testDirAll embed.FS
```

### <a id="testHiddenDir" href="#testHiddenDir">var testHiddenDir</a>

```
searchKey: embedtest.testHiddenDir
tags: [private]
```

```Go
var testHiddenDir embed.FS
```

### <a id="testHiddenStar" href="#testHiddenStar">var testHiddenStar</a>

```
searchKey: embedtest.testHiddenStar
tags: [private]
```

```Go
var testHiddenStar embed.FS
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="testFiles" href="#testFiles">func testFiles(t *testing.T, f embed.FS, name, data string)</a>

```
searchKey: embedtest.testFiles
tags: [private]
```

```Go
func testFiles(t *testing.T, f embed.FS, name, data string)
```

### <a id="testString" href="#testString">func testString(t *testing.T, s, name, data string)</a>

```
searchKey: embedtest.testString
tags: [private]
```

```Go
func testString(t *testing.T, s, name, data string)
```

### <a id="testDir" href="#testDir">func testDir(t *testing.T, f embed.FS, name string, expect ...string)</a>

```
searchKey: embedtest.testDir
tags: [private]
```

```Go
func testDir(t *testing.T, f embed.FS, name string, expect ...string)
```

### <a id="TestGlobal" href="#TestGlobal">func TestGlobal(t *testing.T)</a>

```
searchKey: embedtest.TestGlobal
tags: [private]
```

```Go
func TestGlobal(t *testing.T)
```

### <a id="TestDir" href="#TestDir">func TestDir(t *testing.T)</a>

```
searchKey: embedtest.TestDir
tags: [private]
```

```Go
func TestDir(t *testing.T)
```

### <a id="TestHidden" href="#TestHidden">func TestHidden(t *testing.T)</a>

```
searchKey: embedtest.TestHidden
tags: [private]
```

```Go
func TestHidden(t *testing.T)
```

### <a id="TestUninitialized" href="#TestUninitialized">func TestUninitialized(t *testing.T)</a>

```
searchKey: embedtest.TestUninitialized
tags: [private]
```

```Go
func TestUninitialized(t *testing.T)
```

