# Package race

Package race contains helper functions for manually instrumenting code for the race detector. 

The runtime package intentionally exports these functions only in the race build; this package exports them unconditionally but without the "race" build tag they are no-ops. 

## Index

* [Constants](#const)
    * [const Enabled](#Enabled)
* [Functions](#func)
    * [func Acquire(addr unsafe.Pointer)](#Acquire)
    * [func Disable()](#Disable)
    * [func Enable()](#Enable)
    * [func Errors() int](#Errors)
    * [func Read(addr unsafe.Pointer)](#Read)
    * [func ReadRange(addr unsafe.Pointer, len int)](#ReadRange)
    * [func Release(addr unsafe.Pointer)](#Release)
    * [func ReleaseMerge(addr unsafe.Pointer)](#ReleaseMerge)
    * [func Write(addr unsafe.Pointer)](#Write)
    * [func WriteRange(addr unsafe.Pointer, len int)](#WriteRange)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="Enabled" href="#Enabled">const Enabled</a>

```
searchKey: race.Enabled
tags: [constant boolean]
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
tags: [function]
```

```Go
func Acquire(addr unsafe.Pointer)
```

### <a id="Disable" href="#Disable">func Disable()</a>

```
searchKey: race.Disable
tags: [function]
```

```Go
func Disable()
```

### <a id="Enable" href="#Enable">func Enable()</a>

```
searchKey: race.Enable
tags: [function]
```

```Go
func Enable()
```

### <a id="Errors" href="#Errors">func Errors() int</a>

```
searchKey: race.Errors
tags: [function]
```

```Go
func Errors() int
```

### <a id="Read" href="#Read">func Read(addr unsafe.Pointer)</a>

```
searchKey: race.Read
tags: [function]
```

```Go
func Read(addr unsafe.Pointer)
```

### <a id="ReadRange" href="#ReadRange">func ReadRange(addr unsafe.Pointer, len int)</a>

```
searchKey: race.ReadRange
tags: [function]
```

```Go
func ReadRange(addr unsafe.Pointer, len int)
```

### <a id="Release" href="#Release">func Release(addr unsafe.Pointer)</a>

```
searchKey: race.Release
tags: [function]
```

```Go
func Release(addr unsafe.Pointer)
```

### <a id="ReleaseMerge" href="#ReleaseMerge">func ReleaseMerge(addr unsafe.Pointer)</a>

```
searchKey: race.ReleaseMerge
tags: [function]
```

```Go
func ReleaseMerge(addr unsafe.Pointer)
```

### <a id="Write" href="#Write">func Write(addr unsafe.Pointer)</a>

```
searchKey: race.Write
tags: [function]
```

```Go
func Write(addr unsafe.Pointer)
```

### <a id="WriteRange" href="#WriteRange">func WriteRange(addr unsafe.Pointer, len int)</a>

```
searchKey: race.WriteRange
tags: [function]
```

```Go
func WriteRange(addr unsafe.Pointer, len int)
```

