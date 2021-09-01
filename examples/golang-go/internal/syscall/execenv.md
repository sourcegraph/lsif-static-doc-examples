# Package execenv

## Index

* [Functions](#func)
    * [func Default(sys *syscall.SysProcAttr) ([]string, error)](#Default)


## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Default" href="#Default">func Default(sys *syscall.SysProcAttr) ([]string, error)</a>

```
searchKey: execenv.Default
tags: [function]
```

```Go
func Default(sys *syscall.SysProcAttr) ([]string, error)
```

Default will return the default environment variables based on the process attributes provided. 

Defaults to syscall.Environ() on all platforms other than Windows. 

