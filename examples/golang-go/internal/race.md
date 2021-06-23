# Package race

Package race contains helper functions for manually instrumenting code for the race detector. 

The runtime package intentionally exports these functions only in the race build; this package exports them unconditionally but without the "race" build tag they are no-ops. 

## Index

* [Constants](#const)
    * [const Enabled](#Enabled)
* [Functions](#func)
    * [func Acquire(addr unsafe.Pointer)](#Acquire)
    * [func Release(addr unsafe.Pointer)](#Release)
    * [func ReleaseMerge(addr unsafe.Pointer)](#ReleaseMerge)
    * [func Disable()](#Disable)
    * [func Enable()](#Enable)
    * [func Read(addr unsafe.Pointer)](#Read)
    * [func Write(addr unsafe.Pointer)](#Write)
    * [func ReadRange(addr unsafe.Pointer, len int)](#ReadRange)
    * [func WriteRange(addr unsafe.Pointer, len int)](#WriteRange)
    * [func Errors() int](#Errors)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="Enabled" href="#Enabled">const Enabled</a>

```
searchKey: race.Enabled
```

```Go
const Enabled = false
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Acquire" href="#Acquire">func Acquire(addr unsafe.Pointer)</a>

```
searchKey: race.Acquire
```

```Go
func Acquire(addr unsafe.Pointer)
```

### <a id="Release" href="#Release">func Release(addr unsafe.Pointer)</a>

```
searchKey: race.Release
```

```Go
func Release(addr unsafe.Pointer)
```

### <a id="ReleaseMerge" href="#ReleaseMerge">func ReleaseMerge(addr unsafe.Pointer)</a>

```
searchKey: race.ReleaseMerge
```

```Go
func ReleaseMerge(addr unsafe.Pointer)
```

### <a id="Disable" href="#Disable">func Disable()</a>

```
searchKey: race.Disable
```

```Go
func Disable()
```

### <a id="Enable" href="#Enable">func Enable()</a>

```
searchKey: race.Enable
```

```Go
func Enable()
```

### <a id="Read" href="#Read">func Read(addr unsafe.Pointer)</a>

```
searchKey: race.Read
```

```Go
func Read(addr unsafe.Pointer)
```

### <a id="Write" href="#Write">func Write(addr unsafe.Pointer)</a>

```
searchKey: race.Write
```

```Go
func Write(addr unsafe.Pointer)
```

### <a id="ReadRange" href="#ReadRange">func ReadRange(addr unsafe.Pointer, len int)</a>

```
searchKey: race.ReadRange
```

```Go
func ReadRange(addr unsafe.Pointer, len int)
```

### <a id="WriteRange" href="#WriteRange">func WriteRange(addr unsafe.Pointer, len int)</a>

```
searchKey: race.WriteRange
```

```Go
func WriteRange(addr unsafe.Pointer, len int)
```

### <a id="Errors" href="#Errors">func Errors() int</a>

```
searchKey: race.Errors
```

```Go
func Errors() int
```

