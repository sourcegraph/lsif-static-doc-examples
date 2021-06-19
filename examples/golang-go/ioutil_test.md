# Package ioutil_test

## Index

* [Constants](#const)
    * [const patternHasSeparator](#patternHasSeparator)
* [Functions](#func)
    * [func ExampleReadAll()](#ExampleReadAll)
    * [func ExampleReadDir()](#ExampleReadDir)
    * [func ExampleTempDir()](#ExampleTempDir)
    * [func ExampleTempDir_suffix()](#ExampleTempDir_suffix)
    * [func ExampleTempFile()](#ExampleTempFile)
    * [func ExampleTempFile_suffix()](#ExampleTempFile_suffix)
    * [func ExampleReadFile()](#ExampleReadFile)
    * [func ExampleWriteFile()](#ExampleWriteFile)
    * [func checkSize(t *testing.T, path string, size int64)](#checkSize)
    * [func TestReadFile(t *testing.T)](#TestReadFile)
    * [func TestWriteFile(t *testing.T)](#TestWriteFile)
    * [func TestReadOnlyWriteFile(t *testing.T)](#TestReadOnlyWriteFile)
    * [func TestReadDir(t *testing.T)](#TestReadDir)
    * [func TestTempFile(t *testing.T)](#TestTempFile)
    * [func TestTempFile_pattern(t *testing.T)](#TestTempFile_pattern)
    * [func TestTempFile_BadPattern(t *testing.T)](#TestTempFile_BadPattern)
    * [func TestTempDir(t *testing.T)](#TestTempDir)
    * [func TestTempDir_BadDir(t *testing.T)](#TestTempDir_BadDir)
    * [func TestTempDir_BadPattern(t *testing.T)](#TestTempDir_BadPattern)


## <a id="const" href="#const">Constants</a>

### <a id="patternHasSeparator" href="#patternHasSeparator">const patternHasSeparator</a>

```
searchKey: ioutil_test.patternHasSeparator
```

```Go
const patternHasSeparator = "pattern contains path separator"
```

This string is from os.errPatternHasSeparator. 

## <a id="func" href="#func">Functions</a>

### <a id="ExampleReadAll" href="#ExampleReadAll">func ExampleReadAll()</a>

```
searchKey: ioutil_test.ExampleReadAll
```

```Go
func ExampleReadAll()
```

### <a id="ExampleReadDir" href="#ExampleReadDir">func ExampleReadDir()</a>

```
searchKey: ioutil_test.ExampleReadDir
```

```Go
func ExampleReadDir()
```

### <a id="ExampleTempDir" href="#ExampleTempDir">func ExampleTempDir()</a>

```
searchKey: ioutil_test.ExampleTempDir
```

```Go
func ExampleTempDir()
```

### <a id="ExampleTempDir_suffix" href="#ExampleTempDir_suffix">func ExampleTempDir_suffix()</a>

```
searchKey: ioutil_test.ExampleTempDir_suffix
```

```Go
func ExampleTempDir_suffix()
```

### <a id="ExampleTempFile" href="#ExampleTempFile">func ExampleTempFile()</a>

```
searchKey: ioutil_test.ExampleTempFile
```

```Go
func ExampleTempFile()
```

### <a id="ExampleTempFile_suffix" href="#ExampleTempFile_suffix">func ExampleTempFile_suffix()</a>

```
searchKey: ioutil_test.ExampleTempFile_suffix
```

```Go
func ExampleTempFile_suffix()
```

### <a id="ExampleReadFile" href="#ExampleReadFile">func ExampleReadFile()</a>

```
searchKey: ioutil_test.ExampleReadFile
```

```Go
func ExampleReadFile()
```

### <a id="ExampleWriteFile" href="#ExampleWriteFile">func ExampleWriteFile()</a>

```
searchKey: ioutil_test.ExampleWriteFile
```

```Go
func ExampleWriteFile()
```

### <a id="checkSize" href="#checkSize">func checkSize(t *testing.T, path string, size int64)</a>

```
searchKey: ioutil_test.checkSize
```

```Go
func checkSize(t *testing.T, path string, size int64)
```

### <a id="TestReadFile" href="#TestReadFile">func TestReadFile(t *testing.T)</a>

```
searchKey: ioutil_test.TestReadFile
```

```Go
func TestReadFile(t *testing.T)
```

### <a id="TestWriteFile" href="#TestWriteFile">func TestWriteFile(t *testing.T)</a>

```
searchKey: ioutil_test.TestWriteFile
```

```Go
func TestWriteFile(t *testing.T)
```

### <a id="TestReadOnlyWriteFile" href="#TestReadOnlyWriteFile">func TestReadOnlyWriteFile(t *testing.T)</a>

```
searchKey: ioutil_test.TestReadOnlyWriteFile
```

```Go
func TestReadOnlyWriteFile(t *testing.T)
```

### <a id="TestReadDir" href="#TestReadDir">func TestReadDir(t *testing.T)</a>

```
searchKey: ioutil_test.TestReadDir
```

```Go
func TestReadDir(t *testing.T)
```

### <a id="TestTempFile" href="#TestTempFile">func TestTempFile(t *testing.T)</a>

```
searchKey: ioutil_test.TestTempFile
```

```Go
func TestTempFile(t *testing.T)
```

### <a id="TestTempFile_pattern" href="#TestTempFile_pattern">func TestTempFile_pattern(t *testing.T)</a>

```
searchKey: ioutil_test.TestTempFile_pattern
```

```Go
func TestTempFile_pattern(t *testing.T)
```

### <a id="TestTempFile_BadPattern" href="#TestTempFile_BadPattern">func TestTempFile_BadPattern(t *testing.T)</a>

```
searchKey: ioutil_test.TestTempFile_BadPattern
```

```Go
func TestTempFile_BadPattern(t *testing.T)
```

### <a id="TestTempDir" href="#TestTempDir">func TestTempDir(t *testing.T)</a>

```
searchKey: ioutil_test.TestTempDir
```

```Go
func TestTempDir(t *testing.T)
```

### <a id="TestTempDir_BadDir" href="#TestTempDir_BadDir">func TestTempDir_BadDir(t *testing.T)</a>

```
searchKey: ioutil_test.TestTempDir_BadDir
```

```Go
func TestTempDir_BadDir(t *testing.T)
```

test that we return a nice error message if the dir argument to TempDir doesn't exist (or that it's empty and os.TempDir doesn't exist) 

### <a id="TestTempDir_BadPattern" href="#TestTempDir_BadPattern">func TestTempDir_BadPattern(t *testing.T)</a>

```
searchKey: ioutil_test.TestTempDir_BadPattern
```

```Go
func TestTempDir_BadPattern(t *testing.T)
```

