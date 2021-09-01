# Package socktest_test

## Index

* [Variables](#var)
    * [var closeFunc](#closeFunc)
    * [var socketFunc](#socketFunc)
    * [var sw](#sw)
* [Functions](#func)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestSocket(t *testing.T)](#TestSocket)
    * [func TestSwitch(t *testing.T)](#TestSwitch)
    * [func installTestHooks()](#installTestHooks)
    * [func uninstallTestHooks()](#uninstallTestHooks)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="closeFunc" href="#closeFunc">var closeFunc</a>

```
searchKey: socktest_test.closeFunc
tags: [variable function private]
```

```Go
var closeFunc func(int) error
```

### <a id="socketFunc" href="#socketFunc">var socketFunc</a>

```
searchKey: socktest_test.socketFunc
tags: [variable function private]
```

```Go
var socketFunc func(int, int, int) (int, error)
```

### <a id="sw" href="#sw">var sw</a>

```
searchKey: socktest_test.sw
tags: [variable struct private]
```

```Go
var sw socktest.Switch
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: socktest_test.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestSocket" href="#TestSocket">func TestSocket(t *testing.T)</a>

```
searchKey: socktest_test.TestSocket
tags: [function private test]
```

```Go
func TestSocket(t *testing.T)
```

### <a id="TestSwitch" href="#TestSwitch">func TestSwitch(t *testing.T)</a>

```
searchKey: socktest_test.TestSwitch
tags: [function private test]
```

```Go
func TestSwitch(t *testing.T)
```

### <a id="installTestHooks" href="#installTestHooks">func installTestHooks()</a>

```
searchKey: socktest_test.installTestHooks
tags: [function private]
```

```Go
func installTestHooks()
```

### <a id="uninstallTestHooks" href="#uninstallTestHooks">func uninstallTestHooks()</a>

```
searchKey: socktest_test.uninstallTestHooks
tags: [function private]
```

```Go
func uninstallTestHooks()
```

