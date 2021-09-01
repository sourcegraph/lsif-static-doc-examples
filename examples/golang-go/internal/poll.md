# Package poll

Package poll supports non-blocking I/O on file descriptors with polling. This supports I/O operations that block only a goroutine, not a thread. This is used by the net and os packages. It uses a poller built into the runtime, with support from the runtime scheduler. 

## Index

* [Constants](#const)
    * [const maxRW](#maxRW)
    * [const mutexClosed](#mutexClosed)
    * [const mutexRLock](#mutexRLock)
    * [const mutexRMask](#mutexRMask)
    * [const mutexRWait](#mutexRWait)
    * [const mutexRef](#mutexRef)
    * [const mutexRefMask](#mutexRefMask)
    * [const mutexWLock](#mutexWLock)
    * [const mutexWMask](#mutexWMask)
    * [const mutexWWait](#mutexWWait)
    * [const overflowMsg](#overflowMsg)
    * [const pollErrClosing](#pollErrClosing)
    * [const pollErrNotPollable](#pollErrNotPollable)
    * [const pollErrTimeout](#pollErrTimeout)
    * [const pollNoError](#pollNoError)
* [Variables](#var)
    * [var AcceptFunc](#AcceptFunc)
    * [var CloseFunc](#CloseFunc)
    * [var Consume](#Consume)
    * [var ErrDeadlineExceeded](#ErrDeadlineExceeded)
    * [var ErrFileClosing](#ErrFileClosing)
    * [var ErrNetClosing](#ErrNetClosing)
    * [var ErrNoDeadline](#ErrNoDeadline)
    * [var ErrNotPollable](#ErrNotPollable)
    * [var TestHookDidWritev](#TestHookDidWritev)
    * [var errEAGAIN](#errEAGAIN)
    * [var errEINVAL](#errEINVAL)
    * [var errENOENT](#errENOENT)
    * [var serverInit](#serverInit)
    * [var tryDupCloexec](#tryDupCloexec)
* [Types](#type)
    * [type DeadlineExceededError struct{}](#DeadlineExceededError)
        * [func (e *DeadlineExceededError) Error() string](#DeadlineExceededError.Error)
        * [func (e *DeadlineExceededError) Temporary() bool](#DeadlineExceededError.Temporary)
        * [func (e *DeadlineExceededError) Timeout() bool](#DeadlineExceededError.Timeout)
    * [type FD struct](#FD)
        * [func (fd *FD) Accept() (int, syscall.Sockaddr, string, error)](#FD.Accept)
        * [func (fd *FD) Close() error](#FD.Close)
        * [func (fd *FD) Dup() (int, string, error)](#FD.Dup)
        * [func (fd *FD) EOFError(n int, err error) error](#FD.EOFError)
        * [func (fd *FD) Fchdir() error](#FD.Fchdir)
        * [func (fd *FD) Fchmod(mode uint32) error](#FD.Fchmod)
        * [func (fd *FD) Fchown(uid, gid int) error](#FD.Fchown)
        * [func (fd *FD) Fstat(s *syscall.Stat_t) error](#FD.Fstat)
        * [func (fd *FD) Fsync() error](#FD.Fsync)
        * [func (fd *FD) Ftruncate(size int64) error](#FD.Ftruncate)
        * [func (fd *FD) Init(net string, pollable bool) error](#FD.Init)
        * [func (fd *FD) OpenDir() (uintptr, string, error)](#FD.OpenDir)
        * [func (fd *FD) Pread(p []byte, off int64) (int, error)](#FD.Pread)
        * [func (fd *FD) Pwrite(p []byte, off int64) (int, error)](#FD.Pwrite)
        * [func (fd *FD) RawControl(f func(uintptr)) error](#FD.RawControl)
        * [func (fd *FD) RawRead(f func(uintptr) bool) error](#FD.RawRead)
        * [func (fd *FD) RawWrite(f func(uintptr) bool) error](#FD.RawWrite)
        * [func (fd *FD) Read(p []byte) (int, error)](#FD.Read)
        * [func (fd *FD) ReadDirent(buf []byte) (int, error)](#FD.ReadDirent)
        * [func (fd *FD) ReadFrom(p []byte) (int, syscall.Sockaddr, error)](#FD.ReadFrom)
        * [func (fd *FD) ReadMsg(p []byte, oob []byte, flags int) (int, int, int, syscall.Sockaddr, error)](#FD.ReadMsg)
        * [func (fd *FD) Seek(offset int64, whence int) (int64, error)](#FD.Seek)
        * [func (fd *FD) SetBlocking() error](#FD.SetBlocking)
        * [func (fd *FD) SetDeadline(t time.Time) error](#FD.SetDeadline)
        * [func (fd *FD) SetReadDeadline(t time.Time) error](#FD.SetReadDeadline)
        * [func (fd *FD) SetWriteDeadline(t time.Time) error](#FD.SetWriteDeadline)
        * [func (fd *FD) SetsockoptByte(level, name int, arg byte) error](#FD.SetsockoptByte)
        * [func (fd *FD) SetsockoptIPMreq(level, name int, mreq *syscall.IPMreq) error](#FD.SetsockoptIPMreq)
        * [func (fd *FD) SetsockoptIPv6Mreq(level, name int, mreq *syscall.IPv6Mreq) error](#FD.SetsockoptIPv6Mreq)
        * [func (fd *FD) SetsockoptInet4Addr(level, name int, arg [4]byte) error](#FD.SetsockoptInet4Addr)
        * [func (fd *FD) SetsockoptInt(level, name, arg int) error](#FD.SetsockoptInt)
        * [func (fd *FD) SetsockoptLinger(level, name int, l *syscall.Linger) error](#FD.SetsockoptLinger)
        * [func (fd *FD) Shutdown(how int) error](#FD.Shutdown)
        * [func (fd *FD) WaitWrite() error](#FD.WaitWrite)
        * [func (fd *FD) Write(p []byte) (int, error)](#FD.Write)
        * [func (fd *FD) WriteMsg(p []byte, oob []byte, sa syscall.Sockaddr) (int, int, error)](#FD.WriteMsg)
        * [func (fd *FD) WriteOnce(p []byte) (int, error)](#FD.WriteOnce)
        * [func (fd *FD) WriteTo(p []byte, sa syscall.Sockaddr) (int, error)](#FD.WriteTo)
        * [func (fd *FD) Writev(v *[][]byte) (int64, error)](#FD.Writev)
        * [func (fd *FD) decref() error](#FD.decref)
        * [func (fd *FD) destroy() error](#FD.destroy)
        * [func (fd *FD) eofError(n int, err error) error](#FD.eofError)
        * [func (fd *FD) incref() error](#FD.incref)
        * [func (fd *FD) readLock() error](#FD.readLock)
        * [func (fd *FD) readUnlock()](#FD.readUnlock)
        * [func (fd *FD) writeLock() error](#FD.writeLock)
        * [func (fd *FD) writeUnlock()](#FD.writeUnlock)
    * [type FDMutex struct](#FDMutex)
        * [func (mu *FDMutex) Decref() bool](#FDMutex.Decref)
        * [func (mu *FDMutex) Incref() bool](#FDMutex.Incref)
        * [func (mu *FDMutex) IncrefAndClose() bool](#FDMutex.IncrefAndClose)
        * [func (mu *FDMutex) RWLock(read bool) bool](#FDMutex.RWLock)
        * [func (mu *FDMutex) RWUnlock(read bool) bool](#FDMutex.RWUnlock)
    * [type errNetClosing struct{}](#errNetClosing)
        * [func (e errNetClosing) Error() string](#errNetClosing.Error)
        * [func (e errNetClosing) Temporary() bool](#errNetClosing.Temporary)
        * [func (e errNetClosing) Timeout() bool](#errNetClosing.Timeout)
    * [type fdMutex struct](#fdMutex)
        * [func (mu *fdMutex) decref() bool](#fdMutex.decref)
        * [func (mu *fdMutex) incref() bool](#fdMutex.incref)
        * [func (mu *fdMutex) increfAndClose() bool](#fdMutex.increfAndClose)
        * [func (mu *fdMutex) rwlock(read bool) bool](#fdMutex.rwlock)
        * [func (mu *fdMutex) rwunlock(read bool) bool](#fdMutex.rwunlock)
    * [type pollDesc struct](#pollDesc)
        * [func (pd *pollDesc) close()](#pollDesc.close)
        * [func (pd *pollDesc) evict()](#pollDesc.evict)
        * [func (pd *pollDesc) init(fd *FD) error](#pollDesc.init.fd_poll_runtime.go)
        * [func (pd *pollDesc) pollable() bool](#pollDesc.pollable)
        * [func (pd *pollDesc) prepare(mode int, isFile bool) error](#pollDesc.prepare)
        * [func (pd *pollDesc) prepareRead(isFile bool) error](#pollDesc.prepareRead)
        * [func (pd *pollDesc) prepareWrite(isFile bool) error](#pollDesc.prepareWrite)
        * [func (pd *pollDesc) wait(mode int, isFile bool) error](#pollDesc.wait)
        * [func (pd *pollDesc) waitCanceled(mode int)](#pollDesc.waitCanceled)
        * [func (pd *pollDesc) waitRead(isFile bool) error](#pollDesc.waitRead)
        * [func (pd *pollDesc) waitWrite(isFile bool) error](#pollDesc.waitWrite)
* [Functions](#func)
    * [func DupCloseOnExec(fd int) (int, string, error)](#DupCloseOnExec)
    * [func IsPollDescriptor(fd uintptr) bool](#IsPollDescriptor)
    * [func accept(s int) (int, syscall.Sockaddr, string, error)](#accept)
    * [func consume(v *[][]byte, n int64)](#consume)
    * [func convertErr(res int, isFile bool) error](#convertErr)
    * [func dupCloseOnExecOld(fd int) (int, string, error)](#dupCloseOnExecOld)
    * [func errClosing(isFile bool) error](#errClosing)
    * [func errnoErr(e syscall.Errno) error](#errnoErr)
    * [func fcntl(fd int, cmd int, arg int) (int, error)](#fcntl)
    * [func fdopendir(fd int) (dir uintptr, err error)](#fdopendir)
    * [func ignoringEINTR(fn func() error) error](#ignoringEINTR)
    * [func ignoringEINTRIO(fn func(fd int, p []byte) (int, error), fd int, p []byte) (int, error)](#ignoringEINTRIO)
    * [func newIovecWithBase(base *byte) syscall.Iovec](#newIovecWithBase)
    * [func runtimeNano() int64](#runtimeNano)
    * [func runtime_Semacquire(sema *uint32)](#runtime_Semacquire)
    * [func runtime_Semrelease(sema *uint32)](#runtime_Semrelease)
    * [func runtime_isPollServerDescriptor(fd uintptr) bool](#runtime_isPollServerDescriptor)
    * [func runtime_pollClose(ctx uintptr)](#runtime_pollClose)
    * [func runtime_pollOpen(fd uintptr) (uintptr, int)](#runtime_pollOpen)
    * [func runtime_pollReset(ctx uintptr, mode int) int](#runtime_pollReset)
    * [func runtime_pollServerInit()](#runtime_pollServerInit)
    * [func runtime_pollSetDeadline(ctx uintptr, d int64, mode int)](#runtime_pollSetDeadline)
    * [func runtime_pollUnblock(ctx uintptr)](#runtime_pollUnblock)
    * [func runtime_pollWait(ctx uintptr, mode int) int](#runtime_pollWait)
    * [func runtime_pollWaitCanceled(ctx uintptr, mode int) int](#runtime_pollWaitCanceled)
    * [func setDeadlineImpl(fd *FD, t time.Time, mode int) error](#setDeadlineImpl)
    * [func writev(fd int, iovecs []syscall.Iovec) (uintptr, error)](#writev)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="maxRW" href="#maxRW">const maxRW</a>

```
searchKey: poll.maxRW
tags: [constant number private]
```

```Go
const maxRW = 1 << 30
```

Darwin and FreeBSD can't read or write 2GB+ files at a time, even on 64-bit systems. The same is true of socket implementations on many systems. See golang.org/issue/7812 and golang.org/issue/16266. Use 1GB instead of, say, 2GB-1, to keep subsequent reads aligned. 

### <a id="mutexClosed" href="#mutexClosed">const mutexClosed</a>

```
searchKey: poll.mutexClosed
tags: [constant number private]
```

```Go
const mutexClosed = 1 << 0
```

fdMutex.state is organized as follows: 1 bit - whether FD is closed, if set all subsequent lock operations will fail. 1 bit - lock for read operations. 1 bit - lock for write operations. 20 bits - total number of references (read+write+misc). 20 bits - number of outstanding read waiters. 20 bits - number of outstanding write waiters. 

### <a id="mutexRLock" href="#mutexRLock">const mutexRLock</a>

```
searchKey: poll.mutexRLock
tags: [constant number private]
```

```Go
const mutexRLock = 1 << 1
```

fdMutex.state is organized as follows: 1 bit - whether FD is closed, if set all subsequent lock operations will fail. 1 bit - lock for read operations. 1 bit - lock for write operations. 20 bits - total number of references (read+write+misc). 20 bits - number of outstanding read waiters. 20 bits - number of outstanding write waiters. 

### <a id="mutexRMask" href="#mutexRMask">const mutexRMask</a>

```
searchKey: poll.mutexRMask
tags: [constant number private]
```

```Go
const mutexRMask = (1<<20 - 1) << 23
```

fdMutex.state is organized as follows: 1 bit - whether FD is closed, if set all subsequent lock operations will fail. 1 bit - lock for read operations. 1 bit - lock for write operations. 20 bits - total number of references (read+write+misc). 20 bits - number of outstanding read waiters. 20 bits - number of outstanding write waiters. 

### <a id="mutexRWait" href="#mutexRWait">const mutexRWait</a>

```
searchKey: poll.mutexRWait
tags: [constant number private]
```

```Go
const mutexRWait = 1 << 23
```

fdMutex.state is organized as follows: 1 bit - whether FD is closed, if set all subsequent lock operations will fail. 1 bit - lock for read operations. 1 bit - lock for write operations. 20 bits - total number of references (read+write+misc). 20 bits - number of outstanding read waiters. 20 bits - number of outstanding write waiters. 

### <a id="mutexRef" href="#mutexRef">const mutexRef</a>

```
searchKey: poll.mutexRef
tags: [constant number private]
```

```Go
const mutexRef = 1 << 3
```

fdMutex.state is organized as follows: 1 bit - whether FD is closed, if set all subsequent lock operations will fail. 1 bit - lock for read operations. 1 bit - lock for write operations. 20 bits - total number of references (read+write+misc). 20 bits - number of outstanding read waiters. 20 bits - number of outstanding write waiters. 

### <a id="mutexRefMask" href="#mutexRefMask">const mutexRefMask</a>

```
searchKey: poll.mutexRefMask
tags: [constant number private]
```

```Go
const mutexRefMask = (1<<20 - 1) << 3
```

fdMutex.state is organized as follows: 1 bit - whether FD is closed, if set all subsequent lock operations will fail. 1 bit - lock for read operations. 1 bit - lock for write operations. 20 bits - total number of references (read+write+misc). 20 bits - number of outstanding read waiters. 20 bits - number of outstanding write waiters. 

### <a id="mutexWLock" href="#mutexWLock">const mutexWLock</a>

```
searchKey: poll.mutexWLock
tags: [constant number private]
```

```Go
const mutexWLock = 1 << 2
```

fdMutex.state is organized as follows: 1 bit - whether FD is closed, if set all subsequent lock operations will fail. 1 bit - lock for read operations. 1 bit - lock for write operations. 20 bits - total number of references (read+write+misc). 20 bits - number of outstanding read waiters. 20 bits - number of outstanding write waiters. 

### <a id="mutexWMask" href="#mutexWMask">const mutexWMask</a>

```
searchKey: poll.mutexWMask
tags: [constant number private]
```

```Go
const mutexWMask = (1<<20 - 1) << 43
```

fdMutex.state is organized as follows: 1 bit - whether FD is closed, if set all subsequent lock operations will fail. 1 bit - lock for read operations. 1 bit - lock for write operations. 20 bits - total number of references (read+write+misc). 20 bits - number of outstanding read waiters. 20 bits - number of outstanding write waiters. 

### <a id="mutexWWait" href="#mutexWWait">const mutexWWait</a>

```
searchKey: poll.mutexWWait
tags: [constant number private]
```

```Go
const mutexWWait = 1 << 43
```

fdMutex.state is organized as follows: 1 bit - whether FD is closed, if set all subsequent lock operations will fail. 1 bit - lock for read operations. 1 bit - lock for write operations. 20 bits - total number of references (read+write+misc). 20 bits - number of outstanding read waiters. 20 bits - number of outstanding write waiters. 

### <a id="overflowMsg" href="#overflowMsg">const overflowMsg</a>

```
searchKey: poll.overflowMsg
tags: [constant string private]
```

```Go
const overflowMsg = "too many concurrent operations on a single file or socket (max 1048575)"
```

### <a id="pollErrClosing" href="#pollErrClosing">const pollErrClosing</a>

```
searchKey: poll.pollErrClosing
tags: [constant number private]
```

```Go
const pollErrClosing = 1
```

Error values returned by runtime_pollReset and runtime_pollWait. These must match the values in runtime/netpoll.go. 

### <a id="pollErrNotPollable" href="#pollErrNotPollable">const pollErrNotPollable</a>

```
searchKey: poll.pollErrNotPollable
tags: [constant number private]
```

```Go
const pollErrNotPollable = 3
```

Error values returned by runtime_pollReset and runtime_pollWait. These must match the values in runtime/netpoll.go. 

### <a id="pollErrTimeout" href="#pollErrTimeout">const pollErrTimeout</a>

```
searchKey: poll.pollErrTimeout
tags: [constant number private]
```

```Go
const pollErrTimeout = 2
```

Error values returned by runtime_pollReset and runtime_pollWait. These must match the values in runtime/netpoll.go. 

### <a id="pollNoError" href="#pollNoError">const pollNoError</a>

```
searchKey: poll.pollNoError
tags: [constant number private]
```

```Go
const pollNoError = 0
```

Error values returned by runtime_pollReset and runtime_pollWait. These must match the values in runtime/netpoll.go. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="AcceptFunc" href="#AcceptFunc">var AcceptFunc</a>

```
searchKey: poll.AcceptFunc
tags: [variable function]
```

```Go
var AcceptFunc func(int) (int, syscall.Sockaddr, error) = syscall.Accept
```

AcceptFunc is used to hook the accept call. 

### <a id="CloseFunc" href="#CloseFunc">var CloseFunc</a>

```
searchKey: poll.CloseFunc
tags: [variable function]
```

```Go
var CloseFunc func(int) error = syscall.Close
```

CloseFunc is used to hook the close call. 

### <a id="Consume" href="#Consume">var Consume</a>

```
searchKey: poll.Consume
tags: [variable function private]
```

```Go
var Consume = consume
```

### <a id="ErrDeadlineExceeded" href="#ErrDeadlineExceeded">var ErrDeadlineExceeded</a>

```
searchKey: poll.ErrDeadlineExceeded
tags: [variable interface]
```

```Go
var ErrDeadlineExceeded error = &DeadlineExceededError{}
```

ErrDeadlineExceeded is returned for an expired deadline. This is exported by the os package as os.ErrDeadlineExceeded. 

### <a id="ErrFileClosing" href="#ErrFileClosing">var ErrFileClosing</a>

```
searchKey: poll.ErrFileClosing
tags: [variable interface]
```

```Go
var ErrFileClosing = errors.New("use of closed file")
```

ErrFileClosing is returned when a file descriptor is used after it has been closed. 

### <a id="ErrNetClosing" href="#ErrNetClosing">var ErrNetClosing</a>

```
searchKey: poll.ErrNetClosing
tags: [variable struct]
```

```Go
var ErrNetClosing = errNetClosing{}
```

ErrNetClosing is returned when a network descriptor is used after it has been closed. 

### <a id="ErrNoDeadline" href="#ErrNoDeadline">var ErrNoDeadline</a>

```
searchKey: poll.ErrNoDeadline
tags: [variable interface]
```

```Go
var ErrNoDeadline = errors.New("file type does not support deadline")
```

ErrNoDeadline is returned when a request is made to set a deadline on a file type that does not use the poller. 

### <a id="ErrNotPollable" href="#ErrNotPollable">var ErrNotPollable</a>

```
searchKey: poll.ErrNotPollable
tags: [variable interface]
```

```Go
var ErrNotPollable = errors.New("not pollable")
```

ErrNotPollable is returned when the file or socket is not suitable for event notification. 

### <a id="TestHookDidWritev" href="#TestHookDidWritev">var TestHookDidWritev</a>

```
searchKey: poll.TestHookDidWritev
tags: [variable function]
```

```Go
var TestHookDidWritev = func(wrote int) {}
```

TestHookDidWritev is a hook for testing writev. 

### <a id="errEAGAIN" href="#errEAGAIN">var errEAGAIN</a>

```
searchKey: poll.errEAGAIN
tags: [variable interface private]
```

```Go
var errEAGAIN error = syscall.EAGAIN
```

Do the interface allocations only once for common Errno values. 

### <a id="errEINVAL" href="#errEINVAL">var errEINVAL</a>

```
searchKey: poll.errEINVAL
tags: [variable interface private]
```

```Go
var errEINVAL error = syscall.EINVAL
```

Do the interface allocations only once for common Errno values. 

### <a id="errENOENT" href="#errENOENT">var errENOENT</a>

```
searchKey: poll.errENOENT
tags: [variable interface private]
```

```Go
var errENOENT error = syscall.ENOENT
```

Do the interface allocations only once for common Errno values. 

### <a id="serverInit" href="#serverInit">var serverInit</a>

```
searchKey: poll.serverInit
tags: [variable struct private]
```

```Go
var serverInit sync.Once
```

### <a id="tryDupCloexec" href="#tryDupCloexec">var tryDupCloexec</a>

```
searchKey: poll.tryDupCloexec
tags: [variable number private]
```

```Go
var tryDupCloexec = int32(1)
```

tryDupCloexec indicates whether F_DUPFD_CLOEXEC should be used. If the kernel doesn't support it, this is set to 0. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="DeadlineExceededError" href="#DeadlineExceededError">type DeadlineExceededError struct{}</a>

```
searchKey: poll.DeadlineExceededError
tags: [struct]
```

```Go
type DeadlineExceededError struct{}
```

DeadlineExceededError is returned for an expired deadline. 

#### <a id="DeadlineExceededError.Error" href="#DeadlineExceededError.Error">func (e *DeadlineExceededError) Error() string</a>

```
searchKey: poll.DeadlineExceededError.Error
tags: [method]
```

```Go
func (e *DeadlineExceededError) Error() string
```

Implement the net.Error interface. The string is "i/o timeout" because that is what was returned by earlier Go versions. Changing it may break programs that match on error strings. 

#### <a id="DeadlineExceededError.Temporary" href="#DeadlineExceededError.Temporary">func (e *DeadlineExceededError) Temporary() bool</a>

```
searchKey: poll.DeadlineExceededError.Temporary
tags: [method]
```

```Go
func (e *DeadlineExceededError) Temporary() bool
```

#### <a id="DeadlineExceededError.Timeout" href="#DeadlineExceededError.Timeout">func (e *DeadlineExceededError) Timeout() bool</a>

```
searchKey: poll.DeadlineExceededError.Timeout
tags: [method]
```

```Go
func (e *DeadlineExceededError) Timeout() bool
```

### <a id="FD" href="#FD">type FD struct</a>

```
searchKey: poll.FD
tags: [struct]
```

```Go
type FD struct {
	// Lock sysfd and serialize access to Read and Write methods.
	fdmu fdMutex

	// System file descriptor. Immutable until Close.
	Sysfd int

	// I/O poller.
	pd pollDesc

	// Writev cache.
	iovecs *[]syscall.Iovec

	// Semaphore signaled when file is closed.
	csema uint32

	// Non-zero if this file has been set to blocking mode.
	isBlocking uint32

	// Whether this is a streaming descriptor, as opposed to a
	// packet-based descriptor like a UDP socket. Immutable.
	IsStream bool

	// Whether a zero byte read indicates EOF. This is false for a
	// message based socket connection.
	ZeroReadIsEOF bool

	// Whether this is a file rather than a network socket.
	isFile bool
}
```

FD is a file descriptor. The net and os packages use this type as a field of a larger type representing a network connection or OS file. 

#### <a id="FD.Accept" href="#FD.Accept">func (fd *FD) Accept() (int, syscall.Sockaddr, string, error)</a>

```
searchKey: poll.FD.Accept
tags: [method]
```

```Go
func (fd *FD) Accept() (int, syscall.Sockaddr, string, error)
```

Accept wraps the accept network call. 

#### <a id="FD.Close" href="#FD.Close">func (fd *FD) Close() error</a>

```
searchKey: poll.FD.Close
tags: [method]
```

```Go
func (fd *FD) Close() error
```

Close closes the FD. The underlying file descriptor is closed by the destroy method when there are no remaining references. 

#### <a id="FD.Dup" href="#FD.Dup">func (fd *FD) Dup() (int, string, error)</a>

```
searchKey: poll.FD.Dup
tags: [method]
```

```Go
func (fd *FD) Dup() (int, string, error)
```

Dup duplicates the file descriptor. 

#### <a id="FD.EOFError" href="#FD.EOFError">func (fd *FD) EOFError(n int, err error) error</a>

```
searchKey: poll.FD.EOFError
tags: [method private]
```

```Go
func (fd *FD) EOFError(n int, err error) error
```

#### <a id="FD.Fchdir" href="#FD.Fchdir">func (fd *FD) Fchdir() error</a>

```
searchKey: poll.FD.Fchdir
tags: [method]
```

```Go
func (fd *FD) Fchdir() error
```

Fchdir wraps syscall.Fchdir. 

#### <a id="FD.Fchmod" href="#FD.Fchmod">func (fd *FD) Fchmod(mode uint32) error</a>

```
searchKey: poll.FD.Fchmod
tags: [method]
```

```Go
func (fd *FD) Fchmod(mode uint32) error
```

Fchmod wraps syscall.Fchmod. 

#### <a id="FD.Fchown" href="#FD.Fchown">func (fd *FD) Fchown(uid, gid int) error</a>

```
searchKey: poll.FD.Fchown
tags: [method]
```

```Go
func (fd *FD) Fchown(uid, gid int) error
```

Fchown wraps syscall.Fchown. 

#### <a id="FD.Fstat" href="#FD.Fstat">func (fd *FD) Fstat(s *syscall.Stat_t) error</a>

```
searchKey: poll.FD.Fstat
tags: [method]
```

```Go
func (fd *FD) Fstat(s *syscall.Stat_t) error
```

Fstat wraps syscall.Fstat 

#### <a id="FD.Fsync" href="#FD.Fsync">func (fd *FD) Fsync() error</a>

```
searchKey: poll.FD.Fsync
tags: [method]
```

```Go
func (fd *FD) Fsync() error
```

Fsync invokes SYS_FCNTL with SYS_FULLFSYNC because on OS X, SYS_FSYNC doesn't fully flush contents to disk. See Issue #26650 as well as the man page for fsync on OS X. 

#### <a id="FD.Ftruncate" href="#FD.Ftruncate">func (fd *FD) Ftruncate(size int64) error</a>

```
searchKey: poll.FD.Ftruncate
tags: [method]
```

```Go
func (fd *FD) Ftruncate(size int64) error
```

Ftruncate wraps syscall.Ftruncate. 

#### <a id="FD.Init" href="#FD.Init">func (fd *FD) Init(net string, pollable bool) error</a>

```
searchKey: poll.FD.Init
tags: [method]
```

```Go
func (fd *FD) Init(net string, pollable bool) error
```

Init initializes the FD. The Sysfd field should already be set. This can be called multiple times on a single FD. The net argument is a network name from the net package (e.g., "tcp"), or "file". Set pollable to true if fd should be managed by runtime netpoll. 

#### <a id="FD.OpenDir" href="#FD.OpenDir">func (fd *FD) OpenDir() (uintptr, string, error)</a>

```
searchKey: poll.FD.OpenDir
tags: [method]
```

```Go
func (fd *FD) OpenDir() (uintptr, string, error)
```

OpenDir returns a pointer to a DIR structure suitable for ReadDir. In case of an error, the name of the failed syscall is returned along with a syscall.Errno. 

#### <a id="FD.Pread" href="#FD.Pread">func (fd *FD) Pread(p []byte, off int64) (int, error)</a>

```
searchKey: poll.FD.Pread
tags: [method]
```

```Go
func (fd *FD) Pread(p []byte, off int64) (int, error)
```

Pread wraps the pread system call. 

#### <a id="FD.Pwrite" href="#FD.Pwrite">func (fd *FD) Pwrite(p []byte, off int64) (int, error)</a>

```
searchKey: poll.FD.Pwrite
tags: [method]
```

```Go
func (fd *FD) Pwrite(p []byte, off int64) (int, error)
```

Pwrite wraps the pwrite system call. 

#### <a id="FD.RawControl" href="#FD.RawControl">func (fd *FD) RawControl(f func(uintptr)) error</a>

```
searchKey: poll.FD.RawControl
tags: [method]
```

```Go
func (fd *FD) RawControl(f func(uintptr)) error
```

RawControl invokes the user-defined function f for a non-IO operation. 

#### <a id="FD.RawRead" href="#FD.RawRead">func (fd *FD) RawRead(f func(uintptr) bool) error</a>

```
searchKey: poll.FD.RawRead
tags: [method]
```

```Go
func (fd *FD) RawRead(f func(uintptr) bool) error
```

RawRead invokes the user-defined function f for a read operation. 

#### <a id="FD.RawWrite" href="#FD.RawWrite">func (fd *FD) RawWrite(f func(uintptr) bool) error</a>

```
searchKey: poll.FD.RawWrite
tags: [method]
```

```Go
func (fd *FD) RawWrite(f func(uintptr) bool) error
```

RawWrite invokes the user-defined function f for a write operation. 

#### <a id="FD.Read" href="#FD.Read">func (fd *FD) Read(p []byte) (int, error)</a>

```
searchKey: poll.FD.Read
tags: [method]
```

```Go
func (fd *FD) Read(p []byte) (int, error)
```

Read implements io.Reader. 

#### <a id="FD.ReadDirent" href="#FD.ReadDirent">func (fd *FD) ReadDirent(buf []byte) (int, error)</a>

```
searchKey: poll.FD.ReadDirent
tags: [method]
```

```Go
func (fd *FD) ReadDirent(buf []byte) (int, error)
```

ReadDirent wraps syscall.ReadDirent. We treat this like an ordinary system call rather than a call that tries to fill the buffer. 

#### <a id="FD.ReadFrom" href="#FD.ReadFrom">func (fd *FD) ReadFrom(p []byte) (int, syscall.Sockaddr, error)</a>

```
searchKey: poll.FD.ReadFrom
tags: [method]
```

```Go
func (fd *FD) ReadFrom(p []byte) (int, syscall.Sockaddr, error)
```

ReadFrom wraps the recvfrom network call. 

#### <a id="FD.ReadMsg" href="#FD.ReadMsg">func (fd *FD) ReadMsg(p []byte, oob []byte, flags int) (int, int, int, syscall.Sockaddr, error)</a>

```
searchKey: poll.FD.ReadMsg
tags: [method]
```

```Go
func (fd *FD) ReadMsg(p []byte, oob []byte, flags int) (int, int, int, syscall.Sockaddr, error)
```

ReadMsg wraps the recvmsg network call. 

#### <a id="FD.Seek" href="#FD.Seek">func (fd *FD) Seek(offset int64, whence int) (int64, error)</a>

```
searchKey: poll.FD.Seek
tags: [method]
```

```Go
func (fd *FD) Seek(offset int64, whence int) (int64, error)
```

Seek wraps syscall.Seek. 

#### <a id="FD.SetBlocking" href="#FD.SetBlocking">func (fd *FD) SetBlocking() error</a>

```
searchKey: poll.FD.SetBlocking
tags: [method]
```

```Go
func (fd *FD) SetBlocking() error
```

SetBlocking puts the file into blocking mode. 

#### <a id="FD.SetDeadline" href="#FD.SetDeadline">func (fd *FD) SetDeadline(t time.Time) error</a>

```
searchKey: poll.FD.SetDeadline
tags: [method]
```

```Go
func (fd *FD) SetDeadline(t time.Time) error
```

SetDeadline sets the read and write deadlines associated with fd. 

#### <a id="FD.SetReadDeadline" href="#FD.SetReadDeadline">func (fd *FD) SetReadDeadline(t time.Time) error</a>

```
searchKey: poll.FD.SetReadDeadline
tags: [method]
```

```Go
func (fd *FD) SetReadDeadline(t time.Time) error
```

SetReadDeadline sets the read deadline associated with fd. 

#### <a id="FD.SetWriteDeadline" href="#FD.SetWriteDeadline">func (fd *FD) SetWriteDeadline(t time.Time) error</a>

```
searchKey: poll.FD.SetWriteDeadline
tags: [method]
```

```Go
func (fd *FD) SetWriteDeadline(t time.Time) error
```

SetWriteDeadline sets the write deadline associated with fd. 

#### <a id="FD.SetsockoptByte" href="#FD.SetsockoptByte">func (fd *FD) SetsockoptByte(level, name int, arg byte) error</a>

```
searchKey: poll.FD.SetsockoptByte
tags: [method]
```

```Go
func (fd *FD) SetsockoptByte(level, name int, arg byte) error
```

SetsockoptByte wraps the setsockopt network call with a byte argument. 

#### <a id="FD.SetsockoptIPMreq" href="#FD.SetsockoptIPMreq">func (fd *FD) SetsockoptIPMreq(level, name int, mreq *syscall.IPMreq) error</a>

```
searchKey: poll.FD.SetsockoptIPMreq
tags: [method]
```

```Go
func (fd *FD) SetsockoptIPMreq(level, name int, mreq *syscall.IPMreq) error
```

SetsockoptIPMreq wraps the setsockopt network call with an IPMreq argument. 

#### <a id="FD.SetsockoptIPv6Mreq" href="#FD.SetsockoptIPv6Mreq">func (fd *FD) SetsockoptIPv6Mreq(level, name int, mreq *syscall.IPv6Mreq) error</a>

```
searchKey: poll.FD.SetsockoptIPv6Mreq
tags: [method]
```

```Go
func (fd *FD) SetsockoptIPv6Mreq(level, name int, mreq *syscall.IPv6Mreq) error
```

SetsockoptIPv6Mreq wraps the setsockopt network call with an IPv6Mreq argument. 

#### <a id="FD.SetsockoptInet4Addr" href="#FD.SetsockoptInet4Addr">func (fd *FD) SetsockoptInet4Addr(level, name int, arg [4]byte) error</a>

```
searchKey: poll.FD.SetsockoptInet4Addr
tags: [method]
```

```Go
func (fd *FD) SetsockoptInet4Addr(level, name int, arg [4]byte) error
```

SetsockoptInet4Addr wraps the setsockopt network call with an IPv4 address. 

#### <a id="FD.SetsockoptInt" href="#FD.SetsockoptInt">func (fd *FD) SetsockoptInt(level, name, arg int) error</a>

```
searchKey: poll.FD.SetsockoptInt
tags: [method]
```

```Go
func (fd *FD) SetsockoptInt(level, name, arg int) error
```

SetsockoptInt wraps the setsockopt network call with an int argument. 

#### <a id="FD.SetsockoptLinger" href="#FD.SetsockoptLinger">func (fd *FD) SetsockoptLinger(level, name int, l *syscall.Linger) error</a>

```
searchKey: poll.FD.SetsockoptLinger
tags: [method]
```

```Go
func (fd *FD) SetsockoptLinger(level, name int, l *syscall.Linger) error
```

SetsockoptLinger wraps the setsockopt network call with a Linger argument. 

#### <a id="FD.Shutdown" href="#FD.Shutdown">func (fd *FD) Shutdown(how int) error</a>

```
searchKey: poll.FD.Shutdown
tags: [method]
```

```Go
func (fd *FD) Shutdown(how int) error
```

Shutdown wraps syscall.Shutdown. 

#### <a id="FD.WaitWrite" href="#FD.WaitWrite">func (fd *FD) WaitWrite() error</a>

```
searchKey: poll.FD.WaitWrite
tags: [method]
```

```Go
func (fd *FD) WaitWrite() error
```

WaitWrite waits until data can be read from fd. 

#### <a id="FD.Write" href="#FD.Write">func (fd *FD) Write(p []byte) (int, error)</a>

```
searchKey: poll.FD.Write
tags: [method]
```

```Go
func (fd *FD) Write(p []byte) (int, error)
```

Write implements io.Writer. 

#### <a id="FD.WriteMsg" href="#FD.WriteMsg">func (fd *FD) WriteMsg(p []byte, oob []byte, sa syscall.Sockaddr) (int, int, error)</a>

```
searchKey: poll.FD.WriteMsg
tags: [method]
```

```Go
func (fd *FD) WriteMsg(p []byte, oob []byte, sa syscall.Sockaddr) (int, int, error)
```

WriteMsg wraps the sendmsg network call. 

#### <a id="FD.WriteOnce" href="#FD.WriteOnce">func (fd *FD) WriteOnce(p []byte) (int, error)</a>

```
searchKey: poll.FD.WriteOnce
tags: [method]
```

```Go
func (fd *FD) WriteOnce(p []byte) (int, error)
```

WriteOnce is for testing only. It makes a single write call. 

#### <a id="FD.WriteTo" href="#FD.WriteTo">func (fd *FD) WriteTo(p []byte, sa syscall.Sockaddr) (int, error)</a>

```
searchKey: poll.FD.WriteTo
tags: [method]
```

```Go
func (fd *FD) WriteTo(p []byte, sa syscall.Sockaddr) (int, error)
```

WriteTo wraps the sendto network call. 

#### <a id="FD.Writev" href="#FD.Writev">func (fd *FD) Writev(v *[][]byte) (int64, error)</a>

```
searchKey: poll.FD.Writev
tags: [method]
```

```Go
func (fd *FD) Writev(v *[][]byte) (int64, error)
```

Writev wraps the writev system call. 

#### <a id="FD.decref" href="#FD.decref">func (fd *FD) decref() error</a>

```
searchKey: poll.FD.decref
tags: [method private]
```

```Go
func (fd *FD) decref() error
```

decref removes a reference from fd. It also closes fd when the state of fd is set to closed and there is no remaining reference. 

#### <a id="FD.destroy" href="#FD.destroy">func (fd *FD) destroy() error</a>

```
searchKey: poll.FD.destroy
tags: [method private]
```

```Go
func (fd *FD) destroy() error
```

Destroy closes the file descriptor. This is called when there are no remaining references. 

#### <a id="FD.eofError" href="#FD.eofError">func (fd *FD) eofError(n int, err error) error</a>

```
searchKey: poll.FD.eofError
tags: [method private]
```

```Go
func (fd *FD) eofError(n int, err error) error
```

eofError returns io.EOF when fd is available for reading end of file. 

#### <a id="FD.incref" href="#FD.incref">func (fd *FD) incref() error</a>

```
searchKey: poll.FD.incref
tags: [method private]
```

```Go
func (fd *FD) incref() error
```

incref adds a reference to fd. It returns an error when fd cannot be used. 

#### <a id="FD.readLock" href="#FD.readLock">func (fd *FD) readLock() error</a>

```
searchKey: poll.FD.readLock
tags: [method private]
```

```Go
func (fd *FD) readLock() error
```

readLock adds a reference to fd and locks fd for reading. It returns an error when fd cannot be used for reading. 

#### <a id="FD.readUnlock" href="#FD.readUnlock">func (fd *FD) readUnlock()</a>

```
searchKey: poll.FD.readUnlock
tags: [method private]
```

```Go
func (fd *FD) readUnlock()
```

readUnlock removes a reference from fd and unlocks fd for reading. It also closes fd when the state of fd is set to closed and there is no remaining reference. 

#### <a id="FD.writeLock" href="#FD.writeLock">func (fd *FD) writeLock() error</a>

```
searchKey: poll.FD.writeLock
tags: [method private]
```

```Go
func (fd *FD) writeLock() error
```

writeLock adds a reference to fd and locks fd for writing. It returns an error when fd cannot be used for writing. 

#### <a id="FD.writeUnlock" href="#FD.writeUnlock">func (fd *FD) writeUnlock()</a>

```
searchKey: poll.FD.writeUnlock
tags: [method private]
```

```Go
func (fd *FD) writeUnlock()
```

writeUnlock removes a reference from fd and unlocks fd for writing. It also closes fd when the state of fd is set to closed and there is no remaining reference. 

### <a id="FDMutex" href="#FDMutex">type FDMutex struct</a>

```
searchKey: poll.FDMutex
tags: [struct private]
```

```Go
type FDMutex struct {
	fdMutex
}
```

#### <a id="FDMutex.Decref" href="#FDMutex.Decref">func (mu *FDMutex) Decref() bool</a>

```
searchKey: poll.FDMutex.Decref
tags: [method private]
```

```Go
func (mu *FDMutex) Decref() bool
```

#### <a id="FDMutex.Incref" href="#FDMutex.Incref">func (mu *FDMutex) Incref() bool</a>

```
searchKey: poll.FDMutex.Incref
tags: [method private]
```

```Go
func (mu *FDMutex) Incref() bool
```

#### <a id="FDMutex.IncrefAndClose" href="#FDMutex.IncrefAndClose">func (mu *FDMutex) IncrefAndClose() bool</a>

```
searchKey: poll.FDMutex.IncrefAndClose
tags: [method private]
```

```Go
func (mu *FDMutex) IncrefAndClose() bool
```

#### <a id="FDMutex.RWLock" href="#FDMutex.RWLock">func (mu *FDMutex) RWLock(read bool) bool</a>

```
searchKey: poll.FDMutex.RWLock
tags: [method private]
```

```Go
func (mu *FDMutex) RWLock(read bool) bool
```

#### <a id="FDMutex.RWUnlock" href="#FDMutex.RWUnlock">func (mu *FDMutex) RWUnlock(read bool) bool</a>

```
searchKey: poll.FDMutex.RWUnlock
tags: [method private]
```

```Go
func (mu *FDMutex) RWUnlock(read bool) bool
```

### <a id="errNetClosing" href="#errNetClosing">type errNetClosing struct{}</a>

```
searchKey: poll.errNetClosing
tags: [struct private]
```

```Go
type errNetClosing struct{}
```

errNetClosing is the type of the variable ErrNetClosing. This is used to implement the net.Error interface. 

#### <a id="errNetClosing.Error" href="#errNetClosing.Error">func (e errNetClosing) Error() string</a>

```
searchKey: poll.errNetClosing.Error
tags: [method private]
```

```Go
func (e errNetClosing) Error() string
```

Error returns the error message for ErrNetClosing. Keep this string consistent because of issue #4373: since historically programs have not been able to detect this error, they look for the string. 

#### <a id="errNetClosing.Temporary" href="#errNetClosing.Temporary">func (e errNetClosing) Temporary() bool</a>

```
searchKey: poll.errNetClosing.Temporary
tags: [method private]
```

```Go
func (e errNetClosing) Temporary() bool
```

#### <a id="errNetClosing.Timeout" href="#errNetClosing.Timeout">func (e errNetClosing) Timeout() bool</a>

```
searchKey: poll.errNetClosing.Timeout
tags: [method private]
```

```Go
func (e errNetClosing) Timeout() bool
```

### <a id="fdMutex" href="#fdMutex">type fdMutex struct</a>

```
searchKey: poll.fdMutex
tags: [struct private]
```

```Go
type fdMutex struct {
	state uint64
	rsema uint32
	wsema uint32
}
```

fdMutex is a specialized synchronization primitive that manages lifetime of an fd and serializes access to Read, Write and Close methods on FD. 

#### <a id="fdMutex.decref" href="#fdMutex.decref">func (mu *fdMutex) decref() bool</a>

```
searchKey: poll.fdMutex.decref
tags: [method private]
```

```Go
func (mu *fdMutex) decref() bool
```

decref removes a reference from mu. It reports whether there is no remaining reference. 

#### <a id="fdMutex.incref" href="#fdMutex.incref">func (mu *fdMutex) incref() bool</a>

```
searchKey: poll.fdMutex.incref
tags: [method private]
```

```Go
func (mu *fdMutex) incref() bool
```

incref adds a reference to mu. It reports whether mu is available for reading or writing. 

#### <a id="fdMutex.increfAndClose" href="#fdMutex.increfAndClose">func (mu *fdMutex) increfAndClose() bool</a>

```
searchKey: poll.fdMutex.increfAndClose
tags: [method private]
```

```Go
func (mu *fdMutex) increfAndClose() bool
```

increfAndClose sets the state of mu to closed. It returns false if the file was already closed. 

#### <a id="fdMutex.rwlock" href="#fdMutex.rwlock">func (mu *fdMutex) rwlock(read bool) bool</a>

```
searchKey: poll.fdMutex.rwlock
tags: [method private]
```

```Go
func (mu *fdMutex) rwlock(read bool) bool
```

lock adds a reference to mu and locks mu. It reports whether mu is available for reading or writing. 

#### <a id="fdMutex.rwunlock" href="#fdMutex.rwunlock">func (mu *fdMutex) rwunlock(read bool) bool</a>

```
searchKey: poll.fdMutex.rwunlock
tags: [method private]
```

```Go
func (mu *fdMutex) rwunlock(read bool) bool
```

unlock removes a reference from mu and unlocks mu. It reports whether there is no remaining reference. 

### <a id="pollDesc" href="#pollDesc">type pollDesc struct</a>

```
searchKey: poll.pollDesc
tags: [struct private]
```

```Go
type pollDesc struct {
	runtimeCtx uintptr
}
```

#### <a id="pollDesc.close" href="#pollDesc.close">func (pd *pollDesc) close()</a>

```
searchKey: poll.pollDesc.close
tags: [method private]
```

```Go
func (pd *pollDesc) close()
```

#### <a id="pollDesc.evict" href="#pollDesc.evict">func (pd *pollDesc) evict()</a>

```
searchKey: poll.pollDesc.evict
tags: [method private]
```

```Go
func (pd *pollDesc) evict()
```

Evict evicts fd from the pending list, unblocking any I/O running on fd. 

#### <a id="pollDesc.init.fd_poll_runtime.go" href="#pollDesc.init.fd_poll_runtime.go">func (pd *pollDesc) init(fd *FD) error</a>

```
searchKey: poll.pollDesc.init
tags: [method private]
```

```Go
func (pd *pollDesc) init(fd *FD) error
```

#### <a id="pollDesc.pollable" href="#pollDesc.pollable">func (pd *pollDesc) pollable() bool</a>

```
searchKey: poll.pollDesc.pollable
tags: [method private]
```

```Go
func (pd *pollDesc) pollable() bool
```

#### <a id="pollDesc.prepare" href="#pollDesc.prepare">func (pd *pollDesc) prepare(mode int, isFile bool) error</a>

```
searchKey: poll.pollDesc.prepare
tags: [method private]
```

```Go
func (pd *pollDesc) prepare(mode int, isFile bool) error
```

#### <a id="pollDesc.prepareRead" href="#pollDesc.prepareRead">func (pd *pollDesc) prepareRead(isFile bool) error</a>

```
searchKey: poll.pollDesc.prepareRead
tags: [method private]
```

```Go
func (pd *pollDesc) prepareRead(isFile bool) error
```

#### <a id="pollDesc.prepareWrite" href="#pollDesc.prepareWrite">func (pd *pollDesc) prepareWrite(isFile bool) error</a>

```
searchKey: poll.pollDesc.prepareWrite
tags: [method private]
```

```Go
func (pd *pollDesc) prepareWrite(isFile bool) error
```

#### <a id="pollDesc.wait" href="#pollDesc.wait">func (pd *pollDesc) wait(mode int, isFile bool) error</a>

```
searchKey: poll.pollDesc.wait
tags: [method private]
```

```Go
func (pd *pollDesc) wait(mode int, isFile bool) error
```

#### <a id="pollDesc.waitCanceled" href="#pollDesc.waitCanceled">func (pd *pollDesc) waitCanceled(mode int)</a>

```
searchKey: poll.pollDesc.waitCanceled
tags: [method private]
```

```Go
func (pd *pollDesc) waitCanceled(mode int)
```

#### <a id="pollDesc.waitRead" href="#pollDesc.waitRead">func (pd *pollDesc) waitRead(isFile bool) error</a>

```
searchKey: poll.pollDesc.waitRead
tags: [method private]
```

```Go
func (pd *pollDesc) waitRead(isFile bool) error
```

#### <a id="pollDesc.waitWrite" href="#pollDesc.waitWrite">func (pd *pollDesc) waitWrite(isFile bool) error</a>

```
searchKey: poll.pollDesc.waitWrite
tags: [method private]
```

```Go
func (pd *pollDesc) waitWrite(isFile bool) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="DupCloseOnExec" href="#DupCloseOnExec">func DupCloseOnExec(fd int) (int, string, error)</a>

```
searchKey: poll.DupCloseOnExec
tags: [function]
```

```Go
func DupCloseOnExec(fd int) (int, string, error)
```

DupCloseOnExec dups fd and marks it close-on-exec. 

### <a id="IsPollDescriptor" href="#IsPollDescriptor">func IsPollDescriptor(fd uintptr) bool</a>

```
searchKey: poll.IsPollDescriptor
tags: [function]
```

```Go
func IsPollDescriptor(fd uintptr) bool
```

IsPollDescriptor reports whether fd is the descriptor being used by the poller. This is only used for testing. 

### <a id="accept" href="#accept">func accept(s int) (int, syscall.Sockaddr, string, error)</a>

```
searchKey: poll.accept
tags: [function private]
```

```Go
func accept(s int) (int, syscall.Sockaddr, string, error)
```

Wrapper around the accept system call that marks the returned file descriptor as nonblocking and close-on-exec. 

### <a id="consume" href="#consume">func consume(v *[][]byte, n int64)</a>

```
searchKey: poll.consume
tags: [function private]
```

```Go
func consume(v *[][]byte, n int64)
```

consume removes data from a slice of byte slices, for writev. 

### <a id="convertErr" href="#convertErr">func convertErr(res int, isFile bool) error</a>

```
searchKey: poll.convertErr
tags: [function private]
```

```Go
func convertErr(res int, isFile bool) error
```

### <a id="dupCloseOnExecOld" href="#dupCloseOnExecOld">func dupCloseOnExecOld(fd int) (int, string, error)</a>

```
searchKey: poll.dupCloseOnExecOld
tags: [function private]
```

```Go
func dupCloseOnExecOld(fd int) (int, string, error)
```

dupCloseOnExecOld is the traditional way to dup an fd and set its O_CLOEXEC bit, using two system calls. 

### <a id="errClosing" href="#errClosing">func errClosing(isFile bool) error</a>

```
searchKey: poll.errClosing
tags: [function private]
```

```Go
func errClosing(isFile bool) error
```

Return the appropriate closing error based on isFile. 

### <a id="errnoErr" href="#errnoErr">func errnoErr(e syscall.Errno) error</a>

```
searchKey: poll.errnoErr
tags: [function private]
```

```Go
func errnoErr(e syscall.Errno) error
```

errnoErr returns common boxed Errno values, to prevent allocations at runtime. 

### <a id="fcntl" href="#fcntl">func fcntl(fd int, cmd int, arg int) (int, error)</a>

```
searchKey: poll.fcntl
tags: [function private]
```

```Go
func fcntl(fd int, cmd int, arg int) (int, error)
```

Implemented in the syscall package. 

### <a id="fdopendir" href="#fdopendir">func fdopendir(fd int) (dir uintptr, err error)</a>

```
searchKey: poll.fdopendir
tags: [function private]
```

```Go
func fdopendir(fd int) (dir uintptr, err error)
```

Implemented in syscall/syscall_darwin.go. 

### <a id="ignoringEINTR" href="#ignoringEINTR">func ignoringEINTR(fn func() error) error</a>

```
searchKey: poll.ignoringEINTR
tags: [function private]
```

```Go
func ignoringEINTR(fn func() error) error
```

ignoringEINTR makes a function call and repeats it if it returns an EINTR error. This appears to be required even though we install all signal handlers with SA_RESTART: see #22838, #38033, #38836, #40846. Also #20400 and #36644 are issues in which a signal handler is installed without setting SA_RESTART. None of these are the common case, but there are enough of them that it seems that we can't avoid an EINTR loop. 

### <a id="ignoringEINTRIO" href="#ignoringEINTRIO">func ignoringEINTRIO(fn func(fd int, p []byte) (int, error), fd int, p []byte) (int, error)</a>

```
searchKey: poll.ignoringEINTRIO
tags: [function private]
```

```Go
func ignoringEINTRIO(fn func(fd int, p []byte) (int, error), fd int, p []byte) (int, error)
```

ignoringEINTRIO is like ignoringEINTR, but just for IO calls. 

### <a id="newIovecWithBase" href="#newIovecWithBase">func newIovecWithBase(base *byte) syscall.Iovec</a>

```
searchKey: poll.newIovecWithBase
tags: [function private]
```

```Go
func newIovecWithBase(base *byte) syscall.Iovec
```

### <a id="runtimeNano" href="#runtimeNano">func runtimeNano() int64</a>

```
searchKey: poll.runtimeNano
tags: [function private]
```

```Go
func runtimeNano() int64
```

runtimeNano returns the current value of the runtime clock in nanoseconds. 

### <a id="runtime_Semacquire" href="#runtime_Semacquire">func runtime_Semacquire(sema *uint32)</a>

```
searchKey: poll.runtime_Semacquire
tags: [function private]
```

```Go
func runtime_Semacquire(sema *uint32)
```

Implemented in runtime package. 

### <a id="runtime_Semrelease" href="#runtime_Semrelease">func runtime_Semrelease(sema *uint32)</a>

```
searchKey: poll.runtime_Semrelease
tags: [function private]
```

```Go
func runtime_Semrelease(sema *uint32)
```

### <a id="runtime_isPollServerDescriptor" href="#runtime_isPollServerDescriptor">func runtime_isPollServerDescriptor(fd uintptr) bool</a>

```
searchKey: poll.runtime_isPollServerDescriptor
tags: [function private]
```

```Go
func runtime_isPollServerDescriptor(fd uintptr) bool
```

### <a id="runtime_pollClose" href="#runtime_pollClose">func runtime_pollClose(ctx uintptr)</a>

```
searchKey: poll.runtime_pollClose
tags: [function private]
```

```Go
func runtime_pollClose(ctx uintptr)
```

### <a id="runtime_pollOpen" href="#runtime_pollOpen">func runtime_pollOpen(fd uintptr) (uintptr, int)</a>

```
searchKey: poll.runtime_pollOpen
tags: [function private]
```

```Go
func runtime_pollOpen(fd uintptr) (uintptr, int)
```

### <a id="runtime_pollReset" href="#runtime_pollReset">func runtime_pollReset(ctx uintptr, mode int) int</a>

```
searchKey: poll.runtime_pollReset
tags: [function private]
```

```Go
func runtime_pollReset(ctx uintptr, mode int) int
```

### <a id="runtime_pollServerInit" href="#runtime_pollServerInit">func runtime_pollServerInit()</a>

```
searchKey: poll.runtime_pollServerInit
tags: [function private]
```

```Go
func runtime_pollServerInit()
```

### <a id="runtime_pollSetDeadline" href="#runtime_pollSetDeadline">func runtime_pollSetDeadline(ctx uintptr, d int64, mode int)</a>

```
searchKey: poll.runtime_pollSetDeadline
tags: [function private]
```

```Go
func runtime_pollSetDeadline(ctx uintptr, d int64, mode int)
```

### <a id="runtime_pollUnblock" href="#runtime_pollUnblock">func runtime_pollUnblock(ctx uintptr)</a>

```
searchKey: poll.runtime_pollUnblock
tags: [function private]
```

```Go
func runtime_pollUnblock(ctx uintptr)
```

### <a id="runtime_pollWait" href="#runtime_pollWait">func runtime_pollWait(ctx uintptr, mode int) int</a>

```
searchKey: poll.runtime_pollWait
tags: [function private]
```

```Go
func runtime_pollWait(ctx uintptr, mode int) int
```

### <a id="runtime_pollWaitCanceled" href="#runtime_pollWaitCanceled">func runtime_pollWaitCanceled(ctx uintptr, mode int) int</a>

```
searchKey: poll.runtime_pollWaitCanceled
tags: [function private]
```

```Go
func runtime_pollWaitCanceled(ctx uintptr, mode int) int
```

### <a id="setDeadlineImpl" href="#setDeadlineImpl">func setDeadlineImpl(fd *FD, t time.Time, mode int) error</a>

```
searchKey: poll.setDeadlineImpl
tags: [function private]
```

```Go
func setDeadlineImpl(fd *FD, t time.Time, mode int) error
```

### <a id="writev" href="#writev">func writev(fd int, iovecs []syscall.Iovec) (uintptr, error)</a>

```
searchKey: poll.writev
tags: [function private]
```

```Go
func writev(fd int, iovecs []syscall.Iovec) (uintptr, error)
```

Implemented in syscall/syscall_darwin.go. 

