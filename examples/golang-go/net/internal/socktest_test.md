# Package socktest_test

## Index

* [Variables](#var)
    * [var sw](#sw)
    * [var socketFunc](#socketFunc)
    * [var closeFunc](#closeFunc)
* [Functions](#func)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestSwitch(t *testing.T)](#TestSwitch)
    * [func TestSocket(t *testing.T)](#TestSocket)
    * [func installTestHooks()](#installTestHooks)
    * [func uninstallTestHooks()](#uninstallTestHooks)


## <a id="var" href="#var">Variables</a>

### <a id="sw" href="#sw">var sw</a>

```
searchKey: socktest_test.sw
```

```Go
var sw socktest.Switch
```

### <a id="socketFunc" href="#socketFunc">var socketFunc</a>

```
searchKey: socktest_test.socketFunc
```

```Go
var socketFunc func(int, int, int) (int, error)
```

### <a id="closeFunc" href="#closeFunc">var closeFunc</a>

```
searchKey: socktest_test.closeFunc
```

```Go
var closeFunc func(int) error
```

## <a id="func" href="#func">Functions</a>

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: socktest_test.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestSwitch" href="#TestSwitch">func TestSwitch(t *testing.T)</a>

```
searchKey: socktest_test.TestSwitch
```

```Go
func TestSwitch(t *testing.T)
```

### <a id="TestSocket" href="#TestSocket">func TestSocket(t *testing.T)</a>

```
searchKey: socktest_test.TestSocket
```

```Go
func TestSocket(t *testing.T)
```

### <a id="installTestHooks" href="#installTestHooks">func installTestHooks()</a>

```
searchKey: socktest_test.installTestHooks
```

```Go
func installTestHooks()
```

### <a id="uninstallTestHooks" href="#uninstallTestHooks">func uninstallTestHooks()</a>

```
searchKey: socktest_test.uninstallTestHooks
```

```Go
func uninstallTestHooks()
```

