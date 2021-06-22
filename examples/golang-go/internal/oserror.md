# Package oserror

Package oserror defines errors values used in the os package. 

These types are defined here to permit the syscall package to reference them. 

## Index

* [Variables](#var)
    * [var ErrInvalid](#ErrInvalid)
    * [var ErrPermission](#ErrPermission)
    * [var ErrExist](#ErrExist)
    * [var ErrNotExist](#ErrNotExist)
    * [var ErrClosed](#ErrClosed)


## <a id="var" href="#var">Variables</a>

### <a id="ErrInvalid" href="#ErrInvalid">var ErrInvalid</a>

```
searchKey: oserror.ErrInvalid
tags: [exported]
```

```Go
var ErrInvalid = errors.New("invalid argument")
```

### <a id="ErrPermission" href="#ErrPermission">var ErrPermission</a>

```
searchKey: oserror.ErrPermission
tags: [exported]
```

```Go
var ErrPermission = errors.New("permission denied")
```

### <a id="ErrExist" href="#ErrExist">var ErrExist</a>

```
searchKey: oserror.ErrExist
tags: [exported]
```

```Go
var ErrExist = errors.New("file already exists")
```

### <a id="ErrNotExist" href="#ErrNotExist">var ErrNotExist</a>

```
searchKey: oserror.ErrNotExist
tags: [exported]
```

```Go
var ErrNotExist = errors.New("file does not exist")
```

### <a id="ErrClosed" href="#ErrClosed">var ErrClosed</a>

```
searchKey: oserror.ErrClosed
tags: [exported]
```

```Go
var ErrClosed = errors.New("file already closed")
```

