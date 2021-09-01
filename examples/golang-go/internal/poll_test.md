# Package poll_test

## Index

* [Variables](#var)
    * [var eofErrorTests](#eofErrorTests)
* [Functions](#func)
    * [func TestConsume(t *testing.T)](#TestConsume)
    * [func TestEOFError(t *testing.T)](#TestEOFError)
    * [func TestMutexClose(t *testing.T)](#TestMutexClose)
    * [func TestMutexCloseUnblock(t *testing.T)](#TestMutexCloseUnblock)
    * [func TestMutexLock(t *testing.T)](#TestMutexLock)
    * [func TestMutexOverflowPanic(t *testing.T)](#TestMutexOverflowPanic)
    * [func TestMutexPanic(t *testing.T)](#TestMutexPanic)
    * [func TestMutexStress(t *testing.T)](#TestMutexStress)
    * [func TestRead(t *testing.T)](#TestRead)
    * [func TestReadError(t *testing.T)](#TestReadError)
    * [func badStateFile() (*os.File, error)](#badStateFile)
    * [func isBadStateFileError(err error) (string, bool)](#isBadStateFileError)
    * [func parseReadError(nestedErr error, verify func(error) (string, bool)) error](#parseReadError)
    * [func specialFiles() []string](#specialFiles)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="eofErrorTests" href="#eofErrorTests">var eofErrorTests</a>

```
searchKey: poll_test.eofErrorTests
tags: [variable array struct private]
```

```Go
var eofErrorTests = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestConsume" href="#TestConsume">func TestConsume(t *testing.T)</a>

```
searchKey: poll_test.TestConsume
tags: [function private test]
```

```Go
func TestConsume(t *testing.T)
```

### <a id="TestEOFError" href="#TestEOFError">func TestEOFError(t *testing.T)</a>

```
searchKey: poll_test.TestEOFError
tags: [function private test]
```

```Go
func TestEOFError(t *testing.T)
```

### <a id="TestMutexClose" href="#TestMutexClose">func TestMutexClose(t *testing.T)</a>

```
searchKey: poll_test.TestMutexClose
tags: [function private test]
```

```Go
func TestMutexClose(t *testing.T)
```

### <a id="TestMutexCloseUnblock" href="#TestMutexCloseUnblock">func TestMutexCloseUnblock(t *testing.T)</a>

```
searchKey: poll_test.TestMutexCloseUnblock
tags: [function private test]
```

```Go
func TestMutexCloseUnblock(t *testing.T)
```

### <a id="TestMutexLock" href="#TestMutexLock">func TestMutexLock(t *testing.T)</a>

```
searchKey: poll_test.TestMutexLock
tags: [function private test]
```

```Go
func TestMutexLock(t *testing.T)
```

### <a id="TestMutexOverflowPanic" href="#TestMutexOverflowPanic">func TestMutexOverflowPanic(t *testing.T)</a>

```
searchKey: poll_test.TestMutexOverflowPanic
tags: [function private test]
```

```Go
func TestMutexOverflowPanic(t *testing.T)
```

### <a id="TestMutexPanic" href="#TestMutexPanic">func TestMutexPanic(t *testing.T)</a>

```
searchKey: poll_test.TestMutexPanic
tags: [function private test]
```

```Go
func TestMutexPanic(t *testing.T)
```

### <a id="TestMutexStress" href="#TestMutexStress">func TestMutexStress(t *testing.T)</a>

```
searchKey: poll_test.TestMutexStress
tags: [function private test]
```

```Go
func TestMutexStress(t *testing.T)
```

### <a id="TestRead" href="#TestRead">func TestRead(t *testing.T)</a>

```
searchKey: poll_test.TestRead
tags: [function private test]
```

```Go
func TestRead(t *testing.T)
```

### <a id="TestReadError" href="#TestReadError">func TestReadError(t *testing.T)</a>

```
searchKey: poll_test.TestReadError
tags: [function private test]
```

```Go
func TestReadError(t *testing.T)
```

### <a id="badStateFile" href="#badStateFile">func badStateFile() (*os.File, error)</a>

```
searchKey: poll_test.badStateFile
tags: [function private]
```

```Go
func badStateFile() (*os.File, error)
```

### <a id="isBadStateFileError" href="#isBadStateFileError">func isBadStateFileError(err error) (string, bool)</a>

```
searchKey: poll_test.isBadStateFileError
tags: [function private]
```

```Go
func isBadStateFileError(err error) (string, bool)
```

### <a id="parseReadError" href="#parseReadError">func parseReadError(nestedErr error, verify func(error) (string, bool)) error</a>

```
searchKey: poll_test.parseReadError
tags: [function private]
```

```Go
func parseReadError(nestedErr error, verify func(error) (string, bool)) error
```

### <a id="specialFiles" href="#specialFiles">func specialFiles() []string</a>

```
searchKey: poll_test.specialFiles
tags: [function private]
```

```Go
func specialFiles() []string
```

