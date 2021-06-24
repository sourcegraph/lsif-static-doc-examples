# Package oserror

Package oserror defines errors values used in the os package. 

These types are defined here to permit the syscall package to reference them. 

## Index

* [Variables](#var)
    * [var ErrClosed](#ErrClosed)
    * [var ErrExist](#ErrExist)
    * [var ErrInvalid](#ErrInvalid)
    * [var ErrNotExist](#ErrNotExist)
    * [var ErrPermission](#ErrPermission)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ErrClosed" href="#ErrClosed">var ErrClosed</a>

```
searchKey: oserror.ErrClosed
tags: [variable interface]
```

```Go
var ErrClosed = errors.New("file already closed")
```

### <a id="ErrExist" href="#ErrExist">var ErrExist</a>

```
searchKey: oserror.ErrExist
tags: [variable interface]
```

```Go
var ErrExist = errors.New("file already exists")
```

### <a id="ErrInvalid" href="#ErrInvalid">var ErrInvalid</a>

```
searchKey: oserror.ErrInvalid
tags: [variable interface]
```

```Go
var ErrInvalid = errors.New("invalid argument")
```

### <a id="ErrNotExist" href="#ErrNotExist">var ErrNotExist</a>

```
searchKey: oserror.ErrNotExist
tags: [variable interface]
```

```Go
var ErrNotExist = errors.New("file does not exist")
```

### <a id="ErrPermission" href="#ErrPermission">var ErrPermission</a>

```
searchKey: oserror.ErrPermission
tags: [variable interface]
```

```Go
var ErrPermission = errors.New("permission denied")
```

