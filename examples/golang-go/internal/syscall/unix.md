# Package unix

## Index

* [Constants](#const)
    * [const AT_REMOVEDIR](#AT_REMOVEDIR)
    * [const AT_SYMLINK_NOFOLLOW](#AT_SYMLINK_NOFOLLOW)
* [Functions](#func)
    * [func Fstatat(dirfd int, path string, stat *syscall.Stat_t, flags int) error](#Fstatat)
    * [func GetEntropy(p []byte) error](#GetEntropy)
    * [func IsNonblock(fd int) (nonblocking bool, err error)](#IsNonblock)
    * [func Openat(dirfd int, path string, flags int, perm uint32) (int, error)](#Openat)
    * [func Unlinkat(dirfd int, path string, flags int) error](#Unlinkat)
    * [func fcntl(fd int, cmd int, arg int) (int, error)](#fcntl)
    * [func fstatat(dirfd int, path string, stat *syscall.Stat_t, flags int) error](#fstatat)
    * [func libc_getentropy_trampoline()](#libc_getentropy_trampoline)
    * [func openat(dirfd int, path string, flags int, perm uint32) (int, error)](#openat)
    * [func syscall_syscall(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err syscall.Errno)](#syscall_syscall)
    * [func unlinkat(dirfd int, path string, flags int) error](#unlinkat)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="AT_REMOVEDIR" href="#AT_REMOVEDIR">const AT_REMOVEDIR</a>

```
searchKey: unix.AT_REMOVEDIR
tags: [constant number]
```

```Go
const AT_REMOVEDIR = 0x80
```

### <a id="AT_SYMLINK_NOFOLLOW" href="#AT_SYMLINK_NOFOLLOW">const AT_SYMLINK_NOFOLLOW</a>

```
searchKey: unix.AT_SYMLINK_NOFOLLOW
tags: [constant number]
```

```Go
const AT_SYMLINK_NOFOLLOW = 0x0020
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Fstatat" href="#Fstatat">func Fstatat(dirfd int, path string, stat *syscall.Stat_t, flags int) error</a>

```
searchKey: unix.Fstatat
tags: [method]
```

```Go
func Fstatat(dirfd int, path string, stat *syscall.Stat_t, flags int) error
```

### <a id="GetEntropy" href="#GetEntropy">func GetEntropy(p []byte) error</a>

```
searchKey: unix.GetEntropy
tags: [method]
```

```Go
func GetEntropy(p []byte) error
```

GetEntropy calls the macOS getentropy system call. 

### <a id="IsNonblock" href="#IsNonblock">func IsNonblock(fd int) (nonblocking bool, err error)</a>

```
searchKey: unix.IsNonblock
tags: [method]
```

```Go
func IsNonblock(fd int) (nonblocking bool, err error)
```

### <a id="Openat" href="#Openat">func Openat(dirfd int, path string, flags int, perm uint32) (int, error)</a>

```
searchKey: unix.Openat
tags: [method]
```

```Go
func Openat(dirfd int, path string, flags int, perm uint32) (int, error)
```

### <a id="Unlinkat" href="#Unlinkat">func Unlinkat(dirfd int, path string, flags int) error</a>

```
searchKey: unix.Unlinkat
tags: [method]
```

```Go
func Unlinkat(dirfd int, path string, flags int) error
```

### <a id="fcntl" href="#fcntl">func fcntl(fd int, cmd int, arg int) (int, error)</a>

```
searchKey: unix.fcntl
tags: [method private]
```

```Go
func fcntl(fd int, cmd int, arg int) (int, error)
```

Implemented in the syscall package. 

### <a id="fstatat" href="#fstatat">func fstatat(dirfd int, path string, stat *syscall.Stat_t, flags int) error</a>

```
searchKey: unix.fstatat
tags: [method private]
```

```Go
func fstatat(dirfd int, path string, stat *syscall.Stat_t, flags int) error
```

### <a id="libc_getentropy_trampoline" href="#libc_getentropy_trampoline">func libc_getentropy_trampoline()</a>

```
searchKey: unix.libc_getentropy_trampoline
tags: [function private]
```

```Go
func libc_getentropy_trampoline()
```

### <a id="openat" href="#openat">func openat(dirfd int, path string, flags int, perm uint32) (int, error)</a>

```
searchKey: unix.openat
tags: [method private]
```

```Go
func openat(dirfd int, path string, flags int, perm uint32) (int, error)
```

### <a id="syscall_syscall" href="#syscall_syscall">func syscall_syscall(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err syscall.Errno)</a>

```
searchKey: unix.syscall_syscall
tags: [method private]
```

```Go
func syscall_syscall(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err syscall.Errno)
```

### <a id="unlinkat" href="#unlinkat">func unlinkat(dirfd int, path string, flags int) error</a>

```
searchKey: unix.unlinkat
tags: [method private]
```

```Go
func unlinkat(dirfd int, path string, flags int) error
```

