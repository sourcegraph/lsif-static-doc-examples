# Package poll_test

## Index

* [Variables](#var)
    * [var eofErrorTests](#eofErrorTests)
* [Functions](#func)
    * [func badStateFile() (*os.File, error)](#badStateFile)
    * [func isBadStateFileError(err error) (string, bool)](#isBadStateFileError)
    * [func TestReadError(t *testing.T)](#TestReadError)
    * [func parseReadError(nestedErr error, verify func(error) (string, bool)) error](#parseReadError)
    * [func TestMutexLock(t *testing.T)](#TestMutexLock)
    * [func TestMutexClose(t *testing.T)](#TestMutexClose)
    * [func TestMutexCloseUnblock(t *testing.T)](#TestMutexCloseUnblock)
    * [func TestMutexPanic(t *testing.T)](#TestMutexPanic)
    * [func TestMutexOverflowPanic(t *testing.T)](#TestMutexOverflowPanic)
    * [func TestMutexStress(t *testing.T)](#TestMutexStress)
    * [func TestEOFError(t *testing.T)](#TestEOFError)
    * [func TestRead(t *testing.T)](#TestRead)
    * [func specialFiles() []string](#specialFiles)
    * [func TestConsume(t *testing.T)](#TestConsume)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="eofErrorTests" href="#eofErrorTests">var eofErrorTests</a>

```
searchKey: poll_test.eofErrorTests
tags: [private]
```

```Go
var eofErrorTests = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="badStateFile" href="#badStateFile">func badStateFile() (*os.File, error)</a>

```
searchKey: poll_test.badStateFile
tags: [private]
```

```Go
func badStateFile() (*os.File, error)
```

### <a id="isBadStateFileError" href="#isBadStateFileError">func isBadStateFileError(err error) (string, bool)</a>

```
searchKey: poll_test.isBadStateFileError
tags: [private]
```

```Go
func isBadStateFileError(err error) (string, bool)
```

### <a id="TestReadError" href="#TestReadError">func TestReadError(t *testing.T)</a>

```
searchKey: poll_test.TestReadError
tags: [private]
```

```Go
func TestReadError(t *testing.T)
```

### <a id="parseReadError" href="#parseReadError">func parseReadError(nestedErr error, verify func(error) (string, bool)) error</a>

```
searchKey: poll_test.parseReadError
tags: [private]
```

```Go
func parseReadError(nestedErr error, verify func(error) (string, bool)) error
```

### <a id="TestMutexLock" href="#TestMutexLock">func TestMutexLock(t *testing.T)</a>

```
searchKey: poll_test.TestMutexLock
tags: [private]
```

```Go
func TestMutexLock(t *testing.T)
```

### <a id="TestMutexClose" href="#TestMutexClose">func TestMutexClose(t *testing.T)</a>

```
searchKey: poll_test.TestMutexClose
tags: [private]
```

```Go
func TestMutexClose(t *testing.T)
```

### <a id="TestMutexCloseUnblock" href="#TestMutexCloseUnblock">func TestMutexCloseUnblock(t *testing.T)</a>

```
searchKey: poll_test.TestMutexCloseUnblock
tags: [private]
```

```Go
func TestMutexCloseUnblock(t *testing.T)
```

### <a id="TestMutexPanic" href="#TestMutexPanic">func TestMutexPanic(t *testing.T)</a>

```
searchKey: poll_test.TestMutexPanic
tags: [private]
```

```Go
func TestMutexPanic(t *testing.T)
```

### <a id="TestMutexOverflowPanic" href="#TestMutexOverflowPanic">func TestMutexOverflowPanic(t *testing.T)</a>

```
searchKey: poll_test.TestMutexOverflowPanic
tags: [private]
```

```Go
func TestMutexOverflowPanic(t *testing.T)
```

### <a id="TestMutexStress" href="#TestMutexStress">func TestMutexStress(t *testing.T)</a>

```
searchKey: poll_test.TestMutexStress
tags: [private]
```

```Go
func TestMutexStress(t *testing.T)
```

### <a id="TestEOFError" href="#TestEOFError">func TestEOFError(t *testing.T)</a>

```
searchKey: poll_test.TestEOFError
tags: [private]
```

```Go
func TestEOFError(t *testing.T)
```

### <a id="TestRead" href="#TestRead">func TestRead(t *testing.T)</a>

```
searchKey: poll_test.TestRead
tags: [private]
```

```Go
func TestRead(t *testing.T)
```

### <a id="specialFiles" href="#specialFiles">func specialFiles() []string</a>

```
searchKey: poll_test.specialFiles
tags: [private]
```

```Go
func specialFiles() []string
```

### <a id="TestConsume" href="#TestConsume">func TestConsume(t *testing.T)</a>

```
searchKey: poll_test.TestConsume
tags: [private]
```

```Go
func TestConsume(t *testing.T)
```

