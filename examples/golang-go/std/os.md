# Package os

Package os provides a platform-independent interface to operating system functionality. The design is Unix-like, although the error handling is Go-like; failing calls return values of type error rather than error numbers. Often, more information is available within the error. For example, if a call that takes a file name fails, such as Open or Stat, the error will include the failing file name when printed and will be of type *PathError, which may be unpacked for more information. 

The os interface is intended to be uniform across all operating systems. Features not generally available appear in the system-specific package syscall. 

Here is a simple example, opening a file and reading some of it. 

```
file, err := os.Open("file.go") // For read access.
if err != nil {
	log.Fatal(err)
}

```
If the open fails, the error string will be self-explanatory, like 

```
open file.go: no such file or directory

```
The file's data can then be read into a slice of bytes. Read and Write take their byte counts from the length of the argument slice. 

```
data := make([]byte, 100)
count, err := file.Read(data)
if err != nil {
	log.Fatal(err)
}
fmt.Printf("read %d bytes: %q\n", count, data[:count])

```
Note: The maximum number of concurrent operations on a File may be limited by the OS or the system. The number should be high, but exceeding it may degrade performance or cause other issues. 

## Index

* Subpages
  * [std/os/exec](os/exec.md)
  * [std/os/exec_test](os/exec_test.md)
  * [std/os/signal](os/signal.md)
  * [std/os/signal_test](os/signal_test.md)
  * [std/os/user](os/user.md)
* [Constants](#const)
    * [const readdirName](#readdirName)
    * [const readdirDirEntry](#readdirDirEntry)
    * [const readdirFileInfo](#readdirFileInfo)
    * [const isBigEndian](#isBigEndian)
    * [const O_RDONLY](#O_RDONLY)
    * [const O_WRONLY](#O_WRONLY)
    * [const O_RDWR](#O_RDWR)
    * [const O_APPEND](#O_APPEND)
    * [const O_CREATE](#O_CREATE)
    * [const O_EXCL](#O_EXCL)
    * [const O_SYNC](#O_SYNC)
    * [const O_TRUNC](#O_TRUNC)
    * [const SEEK_SET](#SEEK_SET)
    * [const SEEK_CUR](#SEEK_CUR)
    * [const SEEK_END](#SEEK_END)
    * [const kindNewFile](#kindNewFile)
    * [const kindOpenFile](#kindOpenFile)
    * [const kindPipe](#kindPipe)
    * [const kindNonBlock](#kindNonBlock)
    * [const DevNull](#DevNull)
    * [const PathSeparator](#PathSeparator)
    * [const PathListSeparator](#PathListSeparator)
    * [const supportsCreateWithStickyBit](#supportsCreateWithStickyBit)
    * [const hex](#hex)
    * [const supportsCloseOnExec](#supportsCloseOnExec)
    * [const ModeDir](#ModeDir)
    * [const ModeAppend](#ModeAppend)
    * [const ModeExclusive](#ModeExclusive)
    * [const ModeTemporary](#ModeTemporary)
    * [const ModeSymlink](#ModeSymlink)
    * [const ModeDevice](#ModeDevice)
    * [const ModeNamedPipe](#ModeNamedPipe)
    * [const ModeSocket](#ModeSocket)
    * [const ModeSetuid](#ModeSetuid)
    * [const ModeSetgid](#ModeSetgid)
    * [const ModeCharDevice](#ModeCharDevice)
    * [const ModeSticky](#ModeSticky)
    * [const ModeIrregular](#ModeIrregular)
    * [const ModeType](#ModeType)
    * [const ModePerm](#ModePerm)
* [Variables](#var)
    * [var testingForceReadDirLstat](#testingForceReadDirLstat)
    * [var ErrInvalid](#ErrInvalid)
    * [var ErrPermission](#ErrPermission)
    * [var ErrExist](#ErrExist)
    * [var ErrNotExist](#ErrNotExist)
    * [var ErrClosed](#ErrClosed)
    * [var ErrNoDeadline](#ErrNoDeadline)
    * [var ErrDeadlineExceeded](#ErrDeadlineExceeded)
    * [var ErrProcessDone](#ErrProcessDone)
    * [var Interrupt](#Interrupt)
    * [var Kill](#Kill)
    * [var executablePath](#executablePath)
    * [var initCwd](#initCwd)
    * [var initCwdErr](#initCwdErr)
    * [var Stdin](#Stdin)
    * [var Stdout](#Stdout)
    * [var Stderr](#Stderr)
    * [var errWriteAtInAppendMode](#errWriteAtInAppendMode)
    * [var lstat](#lstat)
    * [var getwdCache](#getwdCache)
    * [var Args](#Args)
    * [var errPatternHasSeparator](#errPatternHasSeparator)
    * [var Atime](#Atime)
    * [var LstatP](#LstatP)
    * [var ErrWriteAtInAppendMode](#ErrWriteAtInAppendMode)
    * [var TestingForceReadDirLstat](#TestingForceReadDirLstat)
    * [var ErrPatternHasSeparator](#ErrPatternHasSeparator)
    * [var SplitPath](#SplitPath)
* [Types](#type)
    * [type readdirMode int](#readdirMode)
    * [type DirEntry fs.DirEntry](#DirEntry)
        * [func newUnixDirent(parent, name string, typ FileMode) (DirEntry, error)](#newUnixDirent)
    * [type dirInfo struct](#dirInfo)
        * [func (d *dirInfo) close()](#dirInfo.close)
    * [type timeout interface](#timeout)
    * [type PathError fs.PathError](#PathError)
    * [type SyscallError struct](#SyscallError)
        * [func (e *SyscallError) Error() string](#SyscallError.Error)
        * [func (e *SyscallError) Unwrap() error](#SyscallError.Unwrap)
        * [func (e *SyscallError) Timeout() bool](#SyscallError.Timeout)
    * [type syscallErrorType syscall.Errno](#syscallErrorType)
        * [func readdir_r(dir uintptr, entry *syscall.Dirent, result **syscall.Dirent) (res syscall.Errno)](#readdir_r)
    * [type Process struct](#Process)
        * [func newProcess(pid int, handle uintptr) *Process](#newProcess)
        * [func FindProcess(pid int) (*Process, error)](#FindProcess)
        * [func StartProcess(name string, argv []string, attr *ProcAttr) (*Process, error)](#StartProcess)
        * [func startProcess(name string, argv []string, attr *ProcAttr) (p *Process, err error)](#startProcess)
        * [func findProcess(pid int) (p *Process, err error)](#findProcess)
        * [func (p *Process) setDone()](#Process.setDone)
        * [func (p *Process) done() bool](#Process.done)
        * [func (p *Process) Release() error](#Process.Release)
        * [func (p *Process) Kill() error](#Process.Kill)
        * [func (p *Process) Wait() (*ProcessState, error)](#Process.Wait)
        * [func (p *Process) Signal(sig Signal) error](#Process.Signal)
        * [func (p *Process) kill() error](#Process.kill)
        * [func (p *Process) wait() (ps *ProcessState, err error)](#Process.wait)
        * [func (p *Process) signal(sig Signal) error](#Process.signal)
        * [func (p *Process) release() error](#Process.release)
        * [func (p *Process) blockUntilWaitable() (bool, error)](#Process.blockUntilWaitable)
    * [type ProcAttr struct](#ProcAttr)
    * [type Signal interface](#Signal)
    * [type ProcessState struct](#ProcessState)
        * [func (p *ProcessState) UserTime() time.Duration](#ProcessState.UserTime)
        * [func (p *ProcessState) SystemTime() time.Duration](#ProcessState.SystemTime)
        * [func (p *ProcessState) Exited() bool](#ProcessState.Exited)
        * [func (p *ProcessState) Success() bool](#ProcessState.Success)
        * [func (p *ProcessState) Sys() interface{}](#ProcessState.Sys)
        * [func (p *ProcessState) SysUsage() interface{}](#ProcessState.SysUsage)
        * [func (p *ProcessState) Pid() int](#ProcessState.Pid)
        * [func (p *ProcessState) exited() bool](#ProcessState.exited)
        * [func (p *ProcessState) success() bool](#ProcessState.success)
        * [func (p *ProcessState) sys() interface{}](#ProcessState.sys)
        * [func (p *ProcessState) sysUsage() interface{}](#ProcessState.sysUsage)
        * [func (p *ProcessState) String() string](#ProcessState.String)
        * [func (p *ProcessState) ExitCode() int](#ProcessState.ExitCode)
        * [func (p *ProcessState) userTime() time.Duration](#ProcessState.userTime)
        * [func (p *ProcessState) systemTime() time.Duration](#ProcessState.systemTime)
    * [type LinkError struct](#LinkError)
        * [func (e *LinkError) Error() string](#LinkError.Error)
        * [func (e *LinkError) Unwrap() error](#LinkError.Unwrap)
    * [type onlyWriter struct](#onlyWriter)
    * [type dirFS string](#dirFS)
        * [func (dir dirFS) Open(name string) (fs.File, error)](#dirFS.Open)
        * [func (dir dirFS) Stat(name string) (fs.FileInfo, error)](#dirFS.Stat)
    * [type file struct](#file)
        * [func (file *file) close() error](#file.close)
    * [type newFileKind int](#newFileKind)
    * [type unixDirent struct](#unixDirent)
        * [func (d *unixDirent) Name() string](#unixDirent.Name)
        * [func (d *unixDirent) IsDir() bool](#unixDirent.IsDir)
        * [func (d *unixDirent) Type() FileMode](#unixDirent.Type)
        * [func (d *unixDirent) Info() (FileInfo, error)](#unixDirent.Info)
    * [type rawConn struct](#rawConn)
        * [func newRawConn(file *File) (*rawConn, error)](#newRawConn)
        * [func (c *rawConn) Control(f func(uintptr)) error](#rawConn.Control)
        * [func (c *rawConn) Read(f func(uintptr) bool) error](#rawConn.Read)
        * [func (c *rawConn) Write(f func(uintptr) bool) error](#rawConn.Write)
    * [type File struct](#File)
        * [func Open(name string) (*File, error)](#Open)
        * [func Create(name string) (*File, error)](#Create)
        * [func OpenFile(name string, flag int, perm FileMode) (*File, error)](#OpenFile)
        * [func NewFile(fd uintptr, name string) *File](#NewFile)
        * [func newFile(fd uintptr, name string, kind newFileKind) *File](#newFile)
        * [func openFileNolog(name string, flag int, perm FileMode) (*File, error)](#openFileNolog)
        * [func Pipe() (r *File, w *File, err error)](#Pipe)
        * [func openFdAt(dirfd int, name string) (*File, error)](#openFdAt)
        * [func CreateTemp(dir, pattern string) (*File, error)](#CreateTemp)
        * [func (f *File) Readdir(n int) ([]FileInfo, error)](#File.Readdir)
        * [func (f *File) Readdirnames(n int) (names []string, err error)](#File.Readdirnames)
        * [func (f *File) ReadDir(n int) ([]DirEntry, error)](#File.ReadDir)
        * [func (f *File) readdir(n int, mode readdirMode) (names []string, dirents []DirEntry, infos []FileInfo, err error)](#File.readdir)
        * [func (f *File) Name() string](#File.Name)
        * [func (f *File) Read(b []byte) (n int, err error)](#File.Read)
        * [func (f *File) ReadAt(b []byte, off int64) (n int, err error)](#File.ReadAt)
        * [func (f *File) ReadFrom(r io.Reader) (n int64, err error)](#File.ReadFrom)
        * [func (f *File) Write(b []byte) (n int, err error)](#File.Write)
        * [func (f *File) WriteAt(b []byte, off int64) (n int, err error)](#File.WriteAt)
        * [func (f *File) Seek(offset int64, whence int) (ret int64, err error)](#File.Seek)
        * [func (f *File) WriteString(s string) (n int, err error)](#File.WriteString)
        * [func (f *File) wrapErr(op string, err error) error](#File.wrapErr)
        * [func (f *File) Chmod(mode FileMode) error](#File.Chmod)
        * [func (f *File) SetDeadline(t time.Time) error](#File.SetDeadline)
        * [func (f *File) SetReadDeadline(t time.Time) error](#File.SetReadDeadline)
        * [func (f *File) SetWriteDeadline(t time.Time) error](#File.SetWriteDeadline)
        * [func (f *File) SyscallConn() (syscall.RawConn, error)](#File.SyscallConn)
        * [func (f *File) Close() error](#File.Close)
        * [func (f *File) read(b []byte) (n int, err error)](#File.read)
        * [func (f *File) pread(b []byte, off int64) (n int, err error)](#File.pread)
        * [func (f *File) write(b []byte) (n int, err error)](#File.write)
        * [func (f *File) pwrite(b []byte, off int64) (n int, err error)](#File.pwrite)
        * [func (f *File) chmod(mode FileMode) error](#File.chmod)
        * [func (f *File) Chown(uid, gid int) error](#File.Chown)
        * [func (f *File) Truncate(size int64) error](#File.Truncate)
        * [func (f *File) Sync() error](#File.Sync)
        * [func (f *File) Chdir() error](#File.Chdir)
        * [func (f *File) setDeadline(t time.Time) error](#File.setDeadline)
        * [func (f *File) setReadDeadline(t time.Time) error](#File.setReadDeadline)
        * [func (f *File) setWriteDeadline(t time.Time) error](#File.setWriteDeadline)
        * [func (f *File) checkValid(op string) error](#File.checkValid)
        * [func (f *File) Fd() uintptr](#File.Fd)
        * [func (f *File) seek(offset int64, whence int) (ret int64, err error)](#File.seek)
        * [func (f *File) readFrom(r io.Reader) (n int64, handled bool, err error)](#File.readFrom)
        * [func (f *File) Stat() (FileInfo, error)](#File.Stat)
    * [type FileInfo fs.FileInfo](#FileInfo)
        * [func Stat(name string) (FileInfo, error)](#Stat)
        * [func Lstat(name string) (FileInfo, error)](#Lstat)
        * [func statNolog(name string) (FileInfo, error)](#statNolog)
        * [func lstatNolog(name string) (FileInfo, error)](#lstatNolog)
    * [type FileMode fs.FileMode](#FileMode)
        * [func dtToType(typ uint8) FileMode](#dtToType)
    * [type fileStat struct](#fileStat)
        * [func (fs *fileStat) Name() string](#fileStat.Name)
        * [func (fs *fileStat) IsDir() bool](#fileStat.IsDir)
        * [func (fs *fileStat) Size() int64](#fileStat.Size)
        * [func (fs *fileStat) Mode() FileMode](#fileStat.Mode)
        * [func (fs *fileStat) ModTime() time.Time](#fileStat.ModTime)
        * [func (fs *fileStat) Sys() interface{}](#fileStat.Sys)
* [Functions](#func)
    * [func ReadDir(name string) ([]DirEntry, error)](#ReadDir)
    * [func closedir(dir uintptr) (err error)](#closedir)
    * [func Expand(s string, mapping func(string) string) string](#Expand)
    * [func ExpandEnv(s string) string](#ExpandEnv)
    * [func isShellSpecialVar(c uint8) bool](#isShellSpecialVar)
    * [func isAlphaNum(c uint8) bool](#isAlphaNum)
    * [func getShellName(s string) (string, int)](#getShellName)
    * [func Getenv(key string) string](#Getenv)
    * [func LookupEnv(key string) (string, bool)](#LookupEnv)
    * [func Setenv(key, value string) error](#Setenv)
    * [func Unsetenv(key string) error](#Unsetenv)
    * [func Clearenv()](#Clearenv)
    * [func Environ() []string](#Environ)
    * [func errClosed() error](#errClosed)
    * [func errNoDeadline() error](#errNoDeadline)
    * [func errDeadlineExceeded() error](#errDeadlineExceeded)
    * [func NewSyscallError(syscall string, err error) error](#NewSyscallError)
    * [func IsExist(err error) bool](#IsExist)
    * [func IsNotExist(err error) bool](#IsNotExist)
    * [func IsPermission(err error) bool](#IsPermission)
    * [func IsTimeout(err error) bool](#IsTimeout)
    * [func underlyingErrorIs(err, target error) bool](#underlyingErrorIs)
    * [func underlyingError(err error) error](#underlyingError)
    * [func wrapSyscallError(name string, err error) error](#wrapSyscallError)
    * [func Getpid() int](#Getpid)
    * [func Getppid() int](#Getppid)
    * [func Executable() (string, error)](#Executable)
    * [func executable() (string, error)](#executable)
    * [func genericReadFrom(f *File, r io.Reader) (int64, error)](#genericReadFrom)
    * [func Mkdir(name string, perm FileMode) error](#Mkdir)
    * [func setStickyBit(name string) error](#setStickyBit)
    * [func Chdir(dir string) error](#Chdir)
    * [func Rename(oldpath, newpath string) error](#Rename)
    * [func fixCount(n int, err error) (int, error)](#fixCount)
    * [func TempDir() string](#TempDir)
    * [func UserCacheDir() (string, error)](#UserCacheDir)
    * [func UserConfigDir() (string, error)](#UserConfigDir)
    * [func UserHomeDir() (string, error)](#UserHomeDir)
    * [func Chmod(name string, mode FileMode) error](#Chmod)
    * [func isWindowsNulName(name string) bool](#isWindowsNulName)
    * [func DirFS(dir string) fs.FS](#DirFS)
    * [func containsAny(s, chars string) bool](#containsAny)
    * [func ReadFile(name string) ([]byte, error)](#ReadFile)
    * [func WriteFile(name string, data []byte, perm FileMode) error](#WriteFile)
    * [func sigpipe()](#sigpipe)
    * [func syscallMode(i FileMode) (o uint32)](#syscallMode)
    * [func chmod(name string, mode FileMode) error](#chmod)
    * [func Chown(name string, uid, gid int) error](#Chown)
    * [func Lchown(name string, uid, gid int) error](#Lchown)
    * [func Chtimes(name string, atime time.Time, mtime time.Time) error](#Chtimes)
    * [func ignoringEINTR(fn func() error) error](#ignoringEINTR)
    * [func fixLongPath(path string) string](#fixLongPath)
    * [func rename(oldname, newname string) error](#rename)
    * [func epipecheck(file *File, e error)](#epipecheck)
    * [func Truncate(name string, size int64) error](#Truncate)
    * [func Remove(name string) error](#Remove)
    * [func tempDir() string](#tempDir)
    * [func Link(oldname, newname string) error](#Link)
    * [func Symlink(oldname, newname string) error](#Symlink)
    * [func Readlink(name string) (string, error)](#Readlink)
    * [func Getwd() (dir string, err error)](#Getwd)
    * [func MkdirAll(path string, perm FileMode) error](#MkdirAll)
    * [func RemoveAll(path string) error](#RemoveAll)
    * [func endsWithDot(path string) bool](#endsWithDot)
    * [func IsPathSeparator(c uint8) bool](#IsPathSeparator)
    * [func basename(name string) string](#basename)
    * [func splitPath(path string) (string, string)](#splitPath)
    * [func fixRootDirectory(p string) string](#fixRootDirectory)
    * [func init()](#init)
    * [func runtime_args() []string](#runtime_args)
    * [func Getuid() int](#Getuid)
    * [func Geteuid() int](#Geteuid)
    * [func Getgid() int](#Getgid)
    * [func Getegid() int](#Getegid)
    * [func Getgroups() ([]int, error)](#Getgroups)
    * [func Exit(code int)](#Exit)
    * [func runtime_beforeExit()](#runtime_beforeExit)
    * [func removeAll(path string) error](#removeAll)
    * [func removeAllFrom(parent *File, base string) error](#removeAllFrom)
    * [func fillFileStatFromSys(fs *fileStat, name string)](#fillFileStatFromSys)
    * [func timespecToTime(ts syscall.Timespec) time.Time](#timespecToTime)
    * [func atime(fi FileInfo) time.Time](#atime)
    * [func itox(val int) string](#itox)
    * [func uitox(val uint) string](#uitox)
    * [func Hostname() (name string, err error)](#Hostname)
    * [func hostname() (name string, err error)](#hostname)
    * [func fastrand() uint32](#fastrand)
    * [func nextRandom() string](#nextRandom)
    * [func prefixAndSuffix(pattern string) (prefix, suffix string, err error)](#prefixAndSuffix)
    * [func MkdirTemp(dir, pattern string) (string, error)](#MkdirTemp)
    * [func joinPath(dir, name string) string](#joinPath)
    * [func lastIndex(s string, sep byte) int](#lastIndex)
    * [func Getpagesize() int](#Getpagesize)
    * [func SameFile(fi1, fi2 FileInfo) bool](#SameFile)
    * [func sameFile(fs1, fs2 *fileStat) bool](#sameFile)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="readdirName" href="#readdirName">const readdirName</a>

```
searchKey: os.readdirName
```

```Go
const readdirName readdirMode = iota
```

### <a id="readdirDirEntry" href="#readdirDirEntry">const readdirDirEntry</a>

```
searchKey: os.readdirDirEntry
```

```Go
const readdirDirEntry
```

### <a id="readdirFileInfo" href="#readdirFileInfo">const readdirFileInfo</a>

```
searchKey: os.readdirFileInfo
```

```Go
const readdirFileInfo
```

### <a id="isBigEndian" href="#isBigEndian">const isBigEndian</a>

```
searchKey: os.isBigEndian
```

```Go
const isBigEndian = false
```

### <a id="O_RDONLY" href="#O_RDONLY">const O_RDONLY</a>

```
searchKey: os.O_RDONLY
tags: [exported]
```

```Go
const O_RDONLY int = syscall.O_RDONLY // open the file read-only.

```

Flags to OpenFile wrapping those of the underlying system. Not all flags may be implemented on a given system. 

Exactly one of O_RDONLY, O_WRONLY, or O_RDWR must be specified. 

### <a id="O_WRONLY" href="#O_WRONLY">const O_WRONLY</a>

```
searchKey: os.O_WRONLY
tags: [exported]
```

```Go
const O_WRONLY int = syscall.O_WRONLY // open the file write-only.

```

Flags to OpenFile wrapping those of the underlying system. Not all flags may be implemented on a given system. 

### <a id="O_RDWR" href="#O_RDWR">const O_RDWR</a>

```
searchKey: os.O_RDWR
tags: [exported]
```

```Go
const O_RDWR int = syscall.O_RDWR // open the file read-write.

```

Flags to OpenFile wrapping those of the underlying system. Not all flags may be implemented on a given system. 

### <a id="O_APPEND" href="#O_APPEND">const O_APPEND</a>

```
searchKey: os.O_APPEND
tags: [exported]
```

```Go
const O_APPEND int = syscall.O_APPEND // append data to the file when writing.

```

Flags to OpenFile wrapping those of the underlying system. Not all flags may be implemented on a given system. 

The remaining values may be or'ed in to control behavior. 

### <a id="O_CREATE" href="#O_CREATE">const O_CREATE</a>

```
searchKey: os.O_CREATE
tags: [exported]
```

```Go
const O_CREATE int = syscall.O_CREAT // create a new file if none exists.

```

Flags to OpenFile wrapping those of the underlying system. Not all flags may be implemented on a given system. 

### <a id="O_EXCL" href="#O_EXCL">const O_EXCL</a>

```
searchKey: os.O_EXCL
tags: [exported]
```

```Go
const O_EXCL int = syscall.O_EXCL // used with O_CREATE, file must not exist.

```

Flags to OpenFile wrapping those of the underlying system. Not all flags may be implemented on a given system. 

### <a id="O_SYNC" href="#O_SYNC">const O_SYNC</a>

```
searchKey: os.O_SYNC
tags: [exported]
```

```Go
const O_SYNC int = syscall.O_SYNC // open for synchronous I/O.

```

Flags to OpenFile wrapping those of the underlying system. Not all flags may be implemented on a given system. 

### <a id="O_TRUNC" href="#O_TRUNC">const O_TRUNC</a>

```
searchKey: os.O_TRUNC
tags: [exported]
```

```Go
const O_TRUNC int = syscall.O_TRUNC // truncate regular writable file when opened.

```

Flags to OpenFile wrapping those of the underlying system. Not all flags may be implemented on a given system. 

### <a id="SEEK_SET" href="#SEEK_SET">const SEEK_SET</a>

```
searchKey: os.SEEK_SET
tags: [exported]
```

```Go
const SEEK_SET int = 0 // seek relative to the origin of the file

```

Seek whence values. 

Deprecated: Use io.SeekStart, io.SeekCurrent, and io.SeekEnd. 

### <a id="SEEK_CUR" href="#SEEK_CUR">const SEEK_CUR</a>

```
searchKey: os.SEEK_CUR
tags: [exported]
```

```Go
const SEEK_CUR int = 1 // seek relative to the current offset

```

Seek whence values. 

Deprecated: Use io.SeekStart, io.SeekCurrent, and io.SeekEnd. 

### <a id="SEEK_END" href="#SEEK_END">const SEEK_END</a>

```
searchKey: os.SEEK_END
tags: [exported]
```

```Go
const SEEK_END int = 2 // seek relative to the end

```

Seek whence values. 

Deprecated: Use io.SeekStart, io.SeekCurrent, and io.SeekEnd. 

### <a id="kindNewFile" href="#kindNewFile">const kindNewFile</a>

```
searchKey: os.kindNewFile
```

```Go
const kindNewFile newFileKind = iota
```

### <a id="kindOpenFile" href="#kindOpenFile">const kindOpenFile</a>

```
searchKey: os.kindOpenFile
```

```Go
const kindOpenFile
```

### <a id="kindPipe" href="#kindPipe">const kindPipe</a>

```
searchKey: os.kindPipe
```

```Go
const kindPipe
```

### <a id="kindNonBlock" href="#kindNonBlock">const kindNonBlock</a>

```
searchKey: os.kindNonBlock
```

```Go
const kindNonBlock
```

### <a id="DevNull" href="#DevNull">const DevNull</a>

```
searchKey: os.DevNull
tags: [exported]
```

```Go
const DevNull = "/dev/null"
```

DevNull is the name of the operating system's `null device.' On Unix-like systems, it is "/dev/null"; on Windows, "NUL". 

### <a id="PathSeparator" href="#PathSeparator">const PathSeparator</a>

```
searchKey: os.PathSeparator
tags: [exported]
```

```Go
const PathSeparator = '/' // OS-specific path separator

```

### <a id="PathListSeparator" href="#PathListSeparator">const PathListSeparator</a>

```
searchKey: os.PathListSeparator
tags: [exported]
```

```Go
const PathListSeparator = ':' // OS-specific path list separator

```

### <a id="supportsCreateWithStickyBit" href="#supportsCreateWithStickyBit">const supportsCreateWithStickyBit</a>

```
searchKey: os.supportsCreateWithStickyBit
```

```Go
const supportsCreateWithStickyBit = false
```

According to sticky(8), neither open(2) nor mkdir(2) will create a file with the sticky bit set. 

### <a id="hex" href="#hex">const hex</a>

```
searchKey: os.hex
```

```Go
const hex = "0123456789abcdef"
```

### <a id="supportsCloseOnExec" href="#supportsCloseOnExec">const supportsCloseOnExec</a>

```
searchKey: os.supportsCloseOnExec
```

```Go
const supportsCloseOnExec = true
```

supportsCloseOnExec reports whether the platform supports the O_CLOEXEC flag. On Darwin, the O_CLOEXEC flag was introduced in OS X 10.7 (Darwin 11.0.0). See [https://support.apple.com/kb/HT1633](https://support.apple.com/kb/HT1633). On FreeBSD, the O_CLOEXEC flag was introduced in version 8.3. 

### <a id="ModeDir" href="#ModeDir">const ModeDir</a>

```
searchKey: os.ModeDir
tags: [exported]
```

```Go
const ModeDir = fs.ModeDir // d: is a directory

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

The single letters are the abbreviations used by the String method's formatting. 

### <a id="ModeAppend" href="#ModeAppend">const ModeAppend</a>

```
searchKey: os.ModeAppend
tags: [exported]
```

```Go
const ModeAppend = fs.ModeAppend // a: append-only

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeExclusive" href="#ModeExclusive">const ModeExclusive</a>

```
searchKey: os.ModeExclusive
tags: [exported]
```

```Go
const ModeExclusive = fs.ModeExclusive // l: exclusive use

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeTemporary" href="#ModeTemporary">const ModeTemporary</a>

```
searchKey: os.ModeTemporary
tags: [exported]
```

```Go
const ModeTemporary = fs.ModeTemporary // T: temporary file; Plan 9 only

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSymlink" href="#ModeSymlink">const ModeSymlink</a>

```
searchKey: os.ModeSymlink
tags: [exported]
```

```Go
const ModeSymlink = fs.ModeSymlink // L: symbolic link

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeDevice" href="#ModeDevice">const ModeDevice</a>

```
searchKey: os.ModeDevice
tags: [exported]
```

```Go
const ModeDevice = fs.ModeDevice // D: device file

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeNamedPipe" href="#ModeNamedPipe">const ModeNamedPipe</a>

```
searchKey: os.ModeNamedPipe
tags: [exported]
```

```Go
const ModeNamedPipe = fs.ModeNamedPipe // p: named pipe (FIFO)

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSocket" href="#ModeSocket">const ModeSocket</a>

```
searchKey: os.ModeSocket
tags: [exported]
```

```Go
const ModeSocket = fs.ModeSocket // S: Unix domain socket

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSetuid" href="#ModeSetuid">const ModeSetuid</a>

```
searchKey: os.ModeSetuid
tags: [exported]
```

```Go
const ModeSetuid = fs.ModeSetuid // u: setuid

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSetgid" href="#ModeSetgid">const ModeSetgid</a>

```
searchKey: os.ModeSetgid
tags: [exported]
```

```Go
const ModeSetgid = fs.ModeSetgid // g: setgid

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeCharDevice" href="#ModeCharDevice">const ModeCharDevice</a>

```
searchKey: os.ModeCharDevice
tags: [exported]
```

```Go
const ModeCharDevice = fs.ModeCharDevice // c: Unix character device, when ModeDevice is set

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSticky" href="#ModeSticky">const ModeSticky</a>

```
searchKey: os.ModeSticky
tags: [exported]
```

```Go
const ModeSticky = fs.ModeSticky // t: sticky

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeIrregular" href="#ModeIrregular">const ModeIrregular</a>

```
searchKey: os.ModeIrregular
tags: [exported]
```

```Go
const ModeIrregular // ?: non-regular file; nothing else is known about this file
 = ...
```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeType" href="#ModeType">const ModeType</a>

```
searchKey: os.ModeType
tags: [exported]
```

```Go
const ModeType = fs.ModeType
```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

Mask for the type bits. For regular files, none will be set. 

### <a id="ModePerm" href="#ModePerm">const ModePerm</a>

```
searchKey: os.ModePerm
tags: [exported]
```

```Go
const ModePerm = fs.ModePerm // Unix permission bits, 0o777

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="testingForceReadDirLstat" href="#testingForceReadDirLstat">var testingForceReadDirLstat</a>

```
searchKey: os.testingForceReadDirLstat
```

```Go
var testingForceReadDirLstat bool
```

testingForceReadDirLstat forces ReadDir to call Lstat, for testing that code path. This can be difficult to provoke on some Unix systems otherwise. 

### <a id="ErrInvalid" href="#ErrInvalid">var ErrInvalid</a>

```
searchKey: os.ErrInvalid
tags: [exported]
```

```Go
var ErrInvalid = fs.ErrInvalid // "invalid argument"

```

Portable analogs of some common system call errors. 

Errors returned from this package may be tested against these errors with errors.Is. 

ErrInvalid indicates an invalid argument. Methods on File will return this error when the receiver is nil. 

### <a id="ErrPermission" href="#ErrPermission">var ErrPermission</a>

```
searchKey: os.ErrPermission
tags: [exported]
```

```Go
var ErrPermission = fs.ErrPermission // "permission denied"

```

Portable analogs of some common system call errors. 

Errors returned from this package may be tested against these errors with errors.Is. 

### <a id="ErrExist" href="#ErrExist">var ErrExist</a>

```
searchKey: os.ErrExist
tags: [exported]
```

```Go
var ErrExist = fs.ErrExist // "file already exists"

```

Portable analogs of some common system call errors. 

Errors returned from this package may be tested against these errors with errors.Is. 

### <a id="ErrNotExist" href="#ErrNotExist">var ErrNotExist</a>

```
searchKey: os.ErrNotExist
tags: [exported]
```

```Go
var ErrNotExist = fs.ErrNotExist // "file does not exist"

```

Portable analogs of some common system call errors. 

Errors returned from this package may be tested against these errors with errors.Is. 

### <a id="ErrClosed" href="#ErrClosed">var ErrClosed</a>

```
searchKey: os.ErrClosed
tags: [exported]
```

```Go
var ErrClosed = fs.ErrClosed // "file already closed"

```

Portable analogs of some common system call errors. 

Errors returned from this package may be tested against these errors with errors.Is. 

### <a id="ErrNoDeadline" href="#ErrNoDeadline">var ErrNoDeadline</a>

```
searchKey: os.ErrNoDeadline
tags: [exported]
```

```Go
var ErrNoDeadline = errNoDeadline() // "file type does not support deadline"

```

Portable analogs of some common system call errors. 

Errors returned from this package may be tested against these errors with errors.Is. 

### <a id="ErrDeadlineExceeded" href="#ErrDeadlineExceeded">var ErrDeadlineExceeded</a>

```
searchKey: os.ErrDeadlineExceeded
tags: [exported]
```

```Go
var ErrDeadlineExceeded = errDeadlineExceeded() // "i/o timeout"

```

Portable analogs of some common system call errors. 

Errors returned from this package may be tested against these errors with errors.Is. 

### <a id="ErrProcessDone" href="#ErrProcessDone">var ErrProcessDone</a>

```
searchKey: os.ErrProcessDone
tags: [exported]
```

```Go
var ErrProcessDone = errors.New("os: process already finished")
```

ErrProcessDone indicates a Process has finished. 

### <a id="Interrupt" href="#Interrupt">var Interrupt</a>

```
searchKey: os.Interrupt
tags: [exported]
```

```Go
var Interrupt Signal = syscall.SIGINT
```

The only signal values guaranteed to be present in the os package on all systems are os.Interrupt (send the process an interrupt) and os.Kill (force the process to exit). On Windows, sending os.Interrupt to a process with os.Process.Signal is not implemented; it will return an error instead of sending a signal. 

### <a id="Kill" href="#Kill">var Kill</a>

```
searchKey: os.Kill
tags: [exported]
```

```Go
var Kill Signal = syscall.SIGKILL
```

The only signal values guaranteed to be present in the os package on all systems are os.Interrupt (send the process an interrupt) and os.Kill (force the process to exit). On Windows, sending os.Interrupt to a process with os.Process.Signal is not implemented; it will return an error instead of sending a signal. 

### <a id="executablePath" href="#executablePath">var executablePath</a>

```
searchKey: os.executablePath
```

```Go
var executablePath string // set by ../runtime/os_darwin.go

```

### <a id="initCwd" href="#initCwd">var initCwd</a>

```
searchKey: os.initCwd
```

```Go
var initCwd, initCwdErr = Getwd()
```

### <a id="initCwdErr" href="#initCwdErr">var initCwdErr</a>

```
searchKey: os.initCwdErr
```

```Go
var initCwd, initCwdErr = Getwd()
```

### <a id="Stdin" href="#Stdin">var Stdin</a>

```
searchKey: os.Stdin
tags: [exported]
```

```Go
var Stdin = NewFile(uintptr(syscall.Stdin), "/dev/stdin")
```

Stdin, Stdout, and Stderr are open Files pointing to the standard input, standard output, and standard error file descriptors. 

Note that the Go runtime writes to standard error for panics and crashes; closing Stderr may cause those messages to go elsewhere, perhaps to a file opened later. 

### <a id="Stdout" href="#Stdout">var Stdout</a>

```
searchKey: os.Stdout
tags: [exported]
```

```Go
var Stdout = NewFile(uintptr(syscall.Stdout), "/dev/stdout")
```

Stdin, Stdout, and Stderr are open Files pointing to the standard input, standard output, and standard error file descriptors. 

Note that the Go runtime writes to standard error for panics and crashes; closing Stderr may cause those messages to go elsewhere, perhaps to a file opened later. 

### <a id="Stderr" href="#Stderr">var Stderr</a>

```
searchKey: os.Stderr
tags: [exported]
```

```Go
var Stderr = NewFile(uintptr(syscall.Stderr), "/dev/stderr")
```

Stdin, Stdout, and Stderr are open Files pointing to the standard input, standard output, and standard error file descriptors. 

Note that the Go runtime writes to standard error for panics and crashes; closing Stderr may cause those messages to go elsewhere, perhaps to a file opened later. 

### <a id="errWriteAtInAppendMode" href="#errWriteAtInAppendMode">var errWriteAtInAppendMode</a>

```
searchKey: os.errWriteAtInAppendMode
```

```Go
var errWriteAtInAppendMode = errors.New("os: invalid use of WriteAt on file opened with O_APPEND")
```

### <a id="lstat" href="#lstat">var lstat</a>

```
searchKey: os.lstat
```

```Go
var lstat = Lstat
```

lstat is overridden in tests. 

### <a id="getwdCache" href="#getwdCache">var getwdCache</a>

```
searchKey: os.getwdCache
```

```Go
var getwdCache struct {
	sync.Mutex
	dir string
}
```

### <a id="Args" href="#Args">var Args</a>

```
searchKey: os.Args
tags: [exported]
```

```Go
var Args []string
```

Args hold the command-line arguments, starting with the program name. 

### <a id="errPatternHasSeparator" href="#errPatternHasSeparator">var errPatternHasSeparator</a>

```
searchKey: os.errPatternHasSeparator
```

```Go
var errPatternHasSeparator = errors.New("pattern contains path separator")
```

### <a id="Atime" href="#Atime">var Atime</a>

```
searchKey: os.Atime
```

```Go
var Atime = atime
```

### <a id="LstatP" href="#LstatP">var LstatP</a>

```
searchKey: os.LstatP
```

```Go
var LstatP = &lstat
```

### <a id="ErrWriteAtInAppendMode" href="#ErrWriteAtInAppendMode">var ErrWriteAtInAppendMode</a>

```
searchKey: os.ErrWriteAtInAppendMode
```

```Go
var ErrWriteAtInAppendMode = errWriteAtInAppendMode
```

### <a id="TestingForceReadDirLstat" href="#TestingForceReadDirLstat">var TestingForceReadDirLstat</a>

```
searchKey: os.TestingForceReadDirLstat
```

```Go
var TestingForceReadDirLstat = &testingForceReadDirLstat
```

### <a id="ErrPatternHasSeparator" href="#ErrPatternHasSeparator">var ErrPatternHasSeparator</a>

```
searchKey: os.ErrPatternHasSeparator
```

```Go
var ErrPatternHasSeparator = errPatternHasSeparator
```

### <a id="SplitPath" href="#SplitPath">var SplitPath</a>

```
searchKey: os.SplitPath
```

```Go
var SplitPath = splitPath
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="readdirMode" href="#readdirMode">type readdirMode int</a>

```
searchKey: os.readdirMode
```

```Go
type readdirMode int
```

### <a id="DirEntry" href="#DirEntry">type DirEntry fs.DirEntry</a>

```
searchKey: os.DirEntry
tags: [exported]
```

```Go
type DirEntry = fs.DirEntry
```

A DirEntry is an entry read from a directory (using the ReadDir function or a File's ReadDir method). 

#### <a id="newUnixDirent" href="#newUnixDirent">func newUnixDirent(parent, name string, typ FileMode) (DirEntry, error)</a>

```
searchKey: os.newUnixDirent
```

```Go
func newUnixDirent(parent, name string, typ FileMode) (DirEntry, error)
```

### <a id="dirInfo" href="#dirInfo">type dirInfo struct</a>

```
searchKey: os.dirInfo
```

```Go
type dirInfo struct {
	dir uintptr // Pointer to DIR structure from dirent.h
}
```

Auxiliary information if the File describes a directory 

#### <a id="dirInfo.close" href="#dirInfo.close">func (d *dirInfo) close()</a>

```
searchKey: os.dirInfo.close
```

```Go
func (d *dirInfo) close()
```

### <a id="timeout" href="#timeout">type timeout interface</a>

```
searchKey: os.timeout
```

```Go
type timeout interface {
	Timeout() bool
}
```

### <a id="PathError" href="#PathError">type PathError fs.PathError</a>

```
searchKey: os.PathError
tags: [exported]
```

```Go
type PathError = fs.PathError
```

PathError records an error and the operation and file path that caused it. 

### <a id="SyscallError" href="#SyscallError">type SyscallError struct</a>

```
searchKey: os.SyscallError
tags: [exported]
```

```Go
type SyscallError struct {
	Syscall string
	Err     error
}
```

SyscallError records an error from a specific system call. 

#### <a id="SyscallError.Error" href="#SyscallError.Error">func (e *SyscallError) Error() string</a>

```
searchKey: os.SyscallError.Error
tags: [exported]
```

```Go
func (e *SyscallError) Error() string
```

#### <a id="SyscallError.Unwrap" href="#SyscallError.Unwrap">func (e *SyscallError) Unwrap() error</a>

```
searchKey: os.SyscallError.Unwrap
tags: [exported]
```

```Go
func (e *SyscallError) Unwrap() error
```

#### <a id="SyscallError.Timeout" href="#SyscallError.Timeout">func (e *SyscallError) Timeout() bool</a>

```
searchKey: os.SyscallError.Timeout
tags: [exported]
```

```Go
func (e *SyscallError) Timeout() bool
```

Timeout reports whether this error represents a timeout. 

### <a id="syscallErrorType" href="#syscallErrorType">type syscallErrorType syscall.Errno</a>

```
searchKey: os.syscallErrorType
```

```Go
type syscallErrorType = syscall.Errno
```

#### <a id="readdir_r" href="#readdir_r">func readdir_r(dir uintptr, entry *syscall.Dirent, result **syscall.Dirent) (res syscall.Errno)</a>

```
searchKey: os.readdir_r
```

```Go
func readdir_r(dir uintptr, entry *syscall.Dirent, result **syscall.Dirent) (res syscall.Errno)
```

### <a id="Process" href="#Process">type Process struct</a>

```
searchKey: os.Process
tags: [exported]
```

```Go
type Process struct {
	Pid    int
	handle uintptr      // handle is accessed atomically on Windows
	isdone uint32       // process has been successfully waited on, non zero if true
	sigMu  sync.RWMutex // avoid race between wait and signal
}
```

Process stores the information about a process created by StartProcess. 

#### <a id="newProcess" href="#newProcess">func newProcess(pid int, handle uintptr) *Process</a>

```
searchKey: os.newProcess
```

```Go
func newProcess(pid int, handle uintptr) *Process
```

#### <a id="FindProcess" href="#FindProcess">func FindProcess(pid int) (*Process, error)</a>

```
searchKey: os.FindProcess
tags: [exported]
```

```Go
func FindProcess(pid int) (*Process, error)
```

FindProcess looks for a running process by its pid. 

The Process it returns can be used to obtain information about the underlying operating system process. 

On Unix systems, FindProcess always succeeds and returns a Process for the given pid, regardless of whether the process exists. 

#### <a id="StartProcess" href="#StartProcess">func StartProcess(name string, argv []string, attr *ProcAttr) (*Process, error)</a>

```
searchKey: os.StartProcess
tags: [exported]
```

```Go
func StartProcess(name string, argv []string, attr *ProcAttr) (*Process, error)
```

StartProcess starts a new process with the program, arguments and attributes specified by name, argv and attr. The argv slice will become os.Args in the new process, so it normally starts with the program name. 

If the calling goroutine has locked the operating system thread with runtime.LockOSThread and modified any inheritable OS-level thread state (for example, Linux or Plan 9 name spaces), the new process will inherit the caller's thread state. 

StartProcess is a low-level interface. The os/exec package provides higher-level interfaces. 

If there is an error, it will be of type *PathError. 

#### <a id="startProcess" href="#startProcess">func startProcess(name string, argv []string, attr *ProcAttr) (p *Process, err error)</a>

```
searchKey: os.startProcess
```

```Go
func startProcess(name string, argv []string, attr *ProcAttr) (p *Process, err error)
```

#### <a id="findProcess" href="#findProcess">func findProcess(pid int) (p *Process, err error)</a>

```
searchKey: os.findProcess
```

```Go
func findProcess(pid int) (p *Process, err error)
```

#### <a id="Process.setDone" href="#Process.setDone">func (p *Process) setDone()</a>

```
searchKey: os.Process.setDone
```

```Go
func (p *Process) setDone()
```

#### <a id="Process.done" href="#Process.done">func (p *Process) done() bool</a>

```
searchKey: os.Process.done
```

```Go
func (p *Process) done() bool
```

#### <a id="Process.Release" href="#Process.Release">func (p *Process) Release() error</a>

```
searchKey: os.Process.Release
tags: [exported]
```

```Go
func (p *Process) Release() error
```

Release releases any resources associated with the Process p, rendering it unusable in the future. Release only needs to be called if Wait is not. 

#### <a id="Process.Kill" href="#Process.Kill">func (p *Process) Kill() error</a>

```
searchKey: os.Process.Kill
tags: [exported]
```

```Go
func (p *Process) Kill() error
```

Kill causes the Process to exit immediately. Kill does not wait until the Process has actually exited. This only kills the Process itself, not any other processes it may have started. 

#### <a id="Process.Wait" href="#Process.Wait">func (p *Process) Wait() (*ProcessState, error)</a>

```
searchKey: os.Process.Wait
tags: [exported]
```

```Go
func (p *Process) Wait() (*ProcessState, error)
```

Wait waits for the Process to exit, and then returns a ProcessState describing its status and an error, if any. Wait releases any resources associated with the Process. On most operating systems, the Process must be a child of the current process or an error will be returned. 

#### <a id="Process.Signal" href="#Process.Signal">func (p *Process) Signal(sig Signal) error</a>

```
searchKey: os.Process.Signal
tags: [exported]
```

```Go
func (p *Process) Signal(sig Signal) error
```

Signal sends a signal to the Process. Sending Interrupt on Windows is not implemented. 

#### <a id="Process.kill" href="#Process.kill">func (p *Process) kill() error</a>

```
searchKey: os.Process.kill
```

```Go
func (p *Process) kill() error
```

#### <a id="Process.wait" href="#Process.wait">func (p *Process) wait() (ps *ProcessState, err error)</a>

```
searchKey: os.Process.wait
```

```Go
func (p *Process) wait() (ps *ProcessState, err error)
```

#### <a id="Process.signal" href="#Process.signal">func (p *Process) signal(sig Signal) error</a>

```
searchKey: os.Process.signal
```

```Go
func (p *Process) signal(sig Signal) error
```

#### <a id="Process.release" href="#Process.release">func (p *Process) release() error</a>

```
searchKey: os.Process.release
```

```Go
func (p *Process) release() error
```

#### <a id="Process.blockUntilWaitable" href="#Process.blockUntilWaitable">func (p *Process) blockUntilWaitable() (bool, error)</a>

```
searchKey: os.Process.blockUntilWaitable
```

```Go
func (p *Process) blockUntilWaitable() (bool, error)
```

blockUntilWaitable attempts to block until a call to p.Wait will succeed immediately, and reports whether it has done so. It does not actually call p.Wait. This version is used on systems that do not implement waitid, or where we have not implemented it yet. 

### <a id="ProcAttr" href="#ProcAttr">type ProcAttr struct</a>

```
searchKey: os.ProcAttr
tags: [exported]
```

```Go
type ProcAttr struct {
	// If Dir is non-empty, the child changes into the directory before
	// creating the process.
	Dir string
	// If Env is non-nil, it gives the environment variables for the
	// new process in the form returned by Environ.
	// If it is nil, the result of Environ will be used.
	Env []string
	// Files specifies the open files inherited by the new process. The
	// first three entries correspond to standard input, standard output, and
	// standard error. An implementation may support additional entries,
	// depending on the underlying operating system. A nil entry corresponds
	// to that file being closed when the process starts.
	// On Unix systems, StartProcess will change these File values
	// to blocking mode, which means that SetDeadline will stop working
	// and calling Close will not interrupt a Read or Write.
	Files []*File

	// Operating system-specific process creation attributes.
	// Note that setting this field means that your program
	// may not execute properly or even compile on some
	// operating systems.
	Sys *syscall.SysProcAttr
}
```

ProcAttr holds the attributes that will be applied to a new process started by StartProcess. 

### <a id="Signal" href="#Signal">type Signal interface</a>

```
searchKey: os.Signal
tags: [exported]
```

```Go
type Signal interface {
	String() string
	Signal() // to distinguish from other Stringers
}
```

A Signal represents an operating system signal. The usual underlying implementation is operating system-dependent: on Unix it is syscall.Signal. 

### <a id="ProcessState" href="#ProcessState">type ProcessState struct</a>

```
searchKey: os.ProcessState
tags: [exported]
```

```Go
type ProcessState struct {
	pid    int                // The process's id.
	status syscall.WaitStatus // System-dependent status info.
	rusage *syscall.Rusage
}
```

ProcessState stores information about a process, as reported by Wait. 

#### <a id="ProcessState.UserTime" href="#ProcessState.UserTime">func (p *ProcessState) UserTime() time.Duration</a>

```
searchKey: os.ProcessState.UserTime
tags: [exported]
```

```Go
func (p *ProcessState) UserTime() time.Duration
```

UserTime returns the user CPU time of the exited process and its children. 

#### <a id="ProcessState.SystemTime" href="#ProcessState.SystemTime">func (p *ProcessState) SystemTime() time.Duration</a>

```
searchKey: os.ProcessState.SystemTime
tags: [exported]
```

```Go
func (p *ProcessState) SystemTime() time.Duration
```

SystemTime returns the system CPU time of the exited process and its children. 

#### <a id="ProcessState.Exited" href="#ProcessState.Exited">func (p *ProcessState) Exited() bool</a>

```
searchKey: os.ProcessState.Exited
tags: [exported]
```

```Go
func (p *ProcessState) Exited() bool
```

Exited reports whether the program has exited. 

#### <a id="ProcessState.Success" href="#ProcessState.Success">func (p *ProcessState) Success() bool</a>

```
searchKey: os.ProcessState.Success
tags: [exported]
```

```Go
func (p *ProcessState) Success() bool
```

Success reports whether the program exited successfully, such as with exit status 0 on Unix. 

#### <a id="ProcessState.Sys" href="#ProcessState.Sys">func (p *ProcessState) Sys() interface{}</a>

```
searchKey: os.ProcessState.Sys
tags: [exported]
```

```Go
func (p *ProcessState) Sys() interface{}
```

Sys returns system-dependent exit information about the process. Convert it to the appropriate underlying type, such as syscall.WaitStatus on Unix, to access its contents. 

#### <a id="ProcessState.SysUsage" href="#ProcessState.SysUsage">func (p *ProcessState) SysUsage() interface{}</a>

```
searchKey: os.ProcessState.SysUsage
tags: [exported]
```

```Go
func (p *ProcessState) SysUsage() interface{}
```

SysUsage returns system-dependent resource usage information about the exited process. Convert it to the appropriate underlying type, such as *syscall.Rusage on Unix, to access its contents. (On Unix, *syscall.Rusage matches struct rusage as defined in the getrusage(2) manual page.) 

#### <a id="ProcessState.Pid" href="#ProcessState.Pid">func (p *ProcessState) Pid() int</a>

```
searchKey: os.ProcessState.Pid
tags: [exported]
```

```Go
func (p *ProcessState) Pid() int
```

Pid returns the process id of the exited process. 

#### <a id="ProcessState.exited" href="#ProcessState.exited">func (p *ProcessState) exited() bool</a>

```
searchKey: os.ProcessState.exited
```

```Go
func (p *ProcessState) exited() bool
```

#### <a id="ProcessState.success" href="#ProcessState.success">func (p *ProcessState) success() bool</a>

```
searchKey: os.ProcessState.success
```

```Go
func (p *ProcessState) success() bool
```

#### <a id="ProcessState.sys" href="#ProcessState.sys">func (p *ProcessState) sys() interface{}</a>

```
searchKey: os.ProcessState.sys
```

```Go
func (p *ProcessState) sys() interface{}
```

#### <a id="ProcessState.sysUsage" href="#ProcessState.sysUsage">func (p *ProcessState) sysUsage() interface{}</a>

```
searchKey: os.ProcessState.sysUsage
```

```Go
func (p *ProcessState) sysUsage() interface{}
```

#### <a id="ProcessState.String" href="#ProcessState.String">func (p *ProcessState) String() string</a>

```
searchKey: os.ProcessState.String
tags: [exported]
```

```Go
func (p *ProcessState) String() string
```

#### <a id="ProcessState.ExitCode" href="#ProcessState.ExitCode">func (p *ProcessState) ExitCode() int</a>

```
searchKey: os.ProcessState.ExitCode
tags: [exported]
```

```Go
func (p *ProcessState) ExitCode() int
```

ExitCode returns the exit code of the exited process, or -1 if the process hasn't exited or was terminated by a signal. 

#### <a id="ProcessState.userTime" href="#ProcessState.userTime">func (p *ProcessState) userTime() time.Duration</a>

```
searchKey: os.ProcessState.userTime
```

```Go
func (p *ProcessState) userTime() time.Duration
```

#### <a id="ProcessState.systemTime" href="#ProcessState.systemTime">func (p *ProcessState) systemTime() time.Duration</a>

```
searchKey: os.ProcessState.systemTime
```

```Go
func (p *ProcessState) systemTime() time.Duration
```

### <a id="LinkError" href="#LinkError">type LinkError struct</a>

```
searchKey: os.LinkError
tags: [exported]
```

```Go
type LinkError struct {
	Op  string
	Old string
	New string
	Err error
}
```

LinkError records an error during a link or symlink or rename system call and the paths that caused it. 

#### <a id="LinkError.Error" href="#LinkError.Error">func (e *LinkError) Error() string</a>

```
searchKey: os.LinkError.Error
tags: [exported]
```

```Go
func (e *LinkError) Error() string
```

#### <a id="LinkError.Unwrap" href="#LinkError.Unwrap">func (e *LinkError) Unwrap() error</a>

```
searchKey: os.LinkError.Unwrap
tags: [exported]
```

```Go
func (e *LinkError) Unwrap() error
```

### <a id="onlyWriter" href="#onlyWriter">type onlyWriter struct</a>

```
searchKey: os.onlyWriter
```

```Go
type onlyWriter struct {
	io.Writer
}
```

### <a id="dirFS" href="#dirFS">type dirFS string</a>

```
searchKey: os.dirFS
```

```Go
type dirFS string
```

#### <a id="dirFS.Open" href="#dirFS.Open">func (dir dirFS) Open(name string) (fs.File, error)</a>

```
searchKey: os.dirFS.Open
```

```Go
func (dir dirFS) Open(name string) (fs.File, error)
```

#### <a id="dirFS.Stat" href="#dirFS.Stat">func (dir dirFS) Stat(name string) (fs.FileInfo, error)</a>

```
searchKey: os.dirFS.Stat
```

```Go
func (dir dirFS) Stat(name string) (fs.FileInfo, error)
```

### <a id="file" href="#file">type file struct</a>

```
searchKey: os.file
```

```Go
type file struct {
	pfd         poll.FD
	name        string
	dirinfo     *dirInfo // nil unless directory being read
	nonblock    bool     // whether we set nonblocking mode
	stdoutOrErr bool     // whether this is stdout or stderr
	appendMode  bool     // whether file is opened for appending
}
```

file is the real representation of *File. The extra level of indirection ensures that no clients of os can overwrite this data, which could cause the finalizer to close the wrong file descriptor. 

#### <a id="file.close" href="#file.close">func (file *file) close() error</a>

```
searchKey: os.file.close
```

```Go
func (file *file) close() error
```

### <a id="newFileKind" href="#newFileKind">type newFileKind int</a>

```
searchKey: os.newFileKind
```

```Go
type newFileKind int
```

newFileKind describes the kind of file to newFile. 

### <a id="unixDirent" href="#unixDirent">type unixDirent struct</a>

```
searchKey: os.unixDirent
```

```Go
type unixDirent struct {
	parent string
	name   string
	typ    FileMode
	info   FileInfo
}
```

#### <a id="unixDirent.Name" href="#unixDirent.Name">func (d *unixDirent) Name() string</a>

```
searchKey: os.unixDirent.Name
```

```Go
func (d *unixDirent) Name() string
```

#### <a id="unixDirent.IsDir" href="#unixDirent.IsDir">func (d *unixDirent) IsDir() bool</a>

```
searchKey: os.unixDirent.IsDir
```

```Go
func (d *unixDirent) IsDir() bool
```

#### <a id="unixDirent.Type" href="#unixDirent.Type">func (d *unixDirent) Type() FileMode</a>

```
searchKey: os.unixDirent.Type
```

```Go
func (d *unixDirent) Type() FileMode
```

#### <a id="unixDirent.Info" href="#unixDirent.Info">func (d *unixDirent) Info() (FileInfo, error)</a>

```
searchKey: os.unixDirent.Info
```

```Go
func (d *unixDirent) Info() (FileInfo, error)
```

### <a id="rawConn" href="#rawConn">type rawConn struct</a>

```
searchKey: os.rawConn
```

```Go
type rawConn struct {
	file *File
}
```

rawConn implements syscall.RawConn. 

#### <a id="newRawConn" href="#newRawConn">func newRawConn(file *File) (*rawConn, error)</a>

```
searchKey: os.newRawConn
```

```Go
func newRawConn(file *File) (*rawConn, error)
```

#### <a id="rawConn.Control" href="#rawConn.Control">func (c *rawConn) Control(f func(uintptr)) error</a>

```
searchKey: os.rawConn.Control
```

```Go
func (c *rawConn) Control(f func(uintptr)) error
```

#### <a id="rawConn.Read" href="#rawConn.Read">func (c *rawConn) Read(f func(uintptr) bool) error</a>

```
searchKey: os.rawConn.Read
```

```Go
func (c *rawConn) Read(f func(uintptr) bool) error
```

#### <a id="rawConn.Write" href="#rawConn.Write">func (c *rawConn) Write(f func(uintptr) bool) error</a>

```
searchKey: os.rawConn.Write
```

```Go
func (c *rawConn) Write(f func(uintptr) bool) error
```

### <a id="File" href="#File">type File struct</a>

```
searchKey: os.File
tags: [exported]
```

```Go
type File struct {
	*file // os specific
}
```

File represents an open file descriptor. 

#### <a id="Open" href="#Open">func Open(name string) (*File, error)</a>

```
searchKey: os.Open
tags: [exported]
```

```Go
func Open(name string) (*File, error)
```

Open opens the named file for reading. If successful, methods on the returned file can be used for reading; the associated file descriptor has mode O_RDONLY. If there is an error, it will be of type *PathError. 

#### <a id="Create" href="#Create">func Create(name string) (*File, error)</a>

```
searchKey: os.Create
tags: [exported]
```

```Go
func Create(name string) (*File, error)
```

Create creates or truncates the named file. If the file already exists, it is truncated. If the file does not exist, it is created with mode 0666 (before umask). If successful, methods on the returned File can be used for I/O; the associated file descriptor has mode O_RDWR. If there is an error, it will be of type *PathError. 

#### <a id="OpenFile" href="#OpenFile">func OpenFile(name string, flag int, perm FileMode) (*File, error)</a>

```
searchKey: os.OpenFile
tags: [exported]
```

```Go
func OpenFile(name string, flag int, perm FileMode) (*File, error)
```

OpenFile is the generalized open call; most users will use Open or Create instead. It opens the named file with specified flag (O_RDONLY etc.). If the file does not exist, and the O_CREATE flag is passed, it is created with mode perm (before umask). If successful, methods on the returned File can be used for I/O. If there is an error, it will be of type *PathError. 

#### <a id="NewFile" href="#NewFile">func NewFile(fd uintptr, name string) *File</a>

```
searchKey: os.NewFile
tags: [exported]
```

```Go
func NewFile(fd uintptr, name string) *File
```

NewFile returns a new File with the given file descriptor and name. The returned value will be nil if fd is not a valid file descriptor. On Unix systems, if the file descriptor is in non-blocking mode, NewFile will attempt to return a pollable File (one for which the SetDeadline methods work). 

After passing it to NewFile, fd may become invalid under the same conditions described in the comments of the Fd method, and the same constraints apply. 

#### <a id="newFile" href="#newFile">func newFile(fd uintptr, name string, kind newFileKind) *File</a>

```
searchKey: os.newFile
```

```Go
func newFile(fd uintptr, name string, kind newFileKind) *File
```

newFile is like NewFile, but if called from OpenFile or Pipe (as passed in the kind parameter) it tries to add the file to the runtime poller. 

#### <a id="openFileNolog" href="#openFileNolog">func openFileNolog(name string, flag int, perm FileMode) (*File, error)</a>

```
searchKey: os.openFileNolog
```

```Go
func openFileNolog(name string, flag int, perm FileMode) (*File, error)
```

openFileNolog is the Unix implementation of OpenFile. Changes here should be reflected in openFdAt, if relevant. 

#### <a id="Pipe" href="#Pipe">func Pipe() (r *File, w *File, err error)</a>

```
searchKey: os.Pipe
tags: [exported]
```

```Go
func Pipe() (r *File, w *File, err error)
```

Pipe returns a connected pair of Files; reads from r return bytes written to w. It returns the files and an error, if any. 

#### <a id="openFdAt" href="#openFdAt">func openFdAt(dirfd int, name string) (*File, error)</a>

```
searchKey: os.openFdAt
```

```Go
func openFdAt(dirfd int, name string) (*File, error)
```

openFdAt opens path relative to the directory in fd. Other than that this should act like openFileNolog. This acts like openFileNolog rather than OpenFile because we are going to (try to) remove the file. The contents of this file are not relevant for test caching. 

#### <a id="CreateTemp" href="#CreateTemp">func CreateTemp(dir, pattern string) (*File, error)</a>

```
searchKey: os.CreateTemp
tags: [exported]
```

```Go
func CreateTemp(dir, pattern string) (*File, error)
```

CreateTemp creates a new temporary file in the directory dir, opens the file for reading and writing, and returns the resulting file. The filename is generated by taking pattern and adding a random string to the end. If pattern includes a "*", the random string replaces the last "*". If dir is the empty string, CreateTemp uses the default directory for temporary files, as returned by TempDir. Multiple programs or goroutines calling CreateTemp simultaneously will not choose the same file. The caller can use the file's Name method to find the pathname of the file. It is the caller's responsibility to remove the file when it is no longer needed. 

#### <a id="File.Readdir" href="#File.Readdir">func (f *File) Readdir(n int) ([]FileInfo, error)</a>

```
searchKey: os.File.Readdir
tags: [exported]
```

```Go
func (f *File) Readdir(n int) ([]FileInfo, error)
```

Readdir reads the contents of the directory associated with file and returns a slice of up to n FileInfo values, as would be returned by Lstat, in directory order. Subsequent calls on the same file will yield further FileInfos. 

If n > 0, Readdir returns at most n FileInfo structures. In this case, if Readdir returns an empty slice, it will return a non-nil error explaining why. At the end of a directory, the error is io.EOF. 

If n <= 0, Readdir returns all the FileInfo from the directory in a single slice. In this case, if Readdir succeeds (reads all the way to the end of the directory), it returns the slice and a nil error. If it encounters an error before the end of the directory, Readdir returns the FileInfo read until that point and a non-nil error. 

Most clients are better served by the more efficient ReadDir method. 

#### <a id="File.Readdirnames" href="#File.Readdirnames">func (f *File) Readdirnames(n int) (names []string, err error)</a>

```
searchKey: os.File.Readdirnames
tags: [exported]
```

```Go
func (f *File) Readdirnames(n int) (names []string, err error)
```

Readdirnames reads the contents of the directory associated with file and returns a slice of up to n names of files in the directory, in directory order. Subsequent calls on the same file will yield further names. 

If n > 0, Readdirnames returns at most n names. In this case, if Readdirnames returns an empty slice, it will return a non-nil error explaining why. At the end of a directory, the error is io.EOF. 

If n <= 0, Readdirnames returns all the names from the directory in a single slice. In this case, if Readdirnames succeeds (reads all the way to the end of the directory), it returns the slice and a nil error. If it encounters an error before the end of the directory, Readdirnames returns the names read until that point and a non-nil error. 

#### <a id="File.ReadDir" href="#File.ReadDir">func (f *File) ReadDir(n int) ([]DirEntry, error)</a>

```
searchKey: os.File.ReadDir
tags: [exported]
```

```Go
func (f *File) ReadDir(n int) ([]DirEntry, error)
```

ReadDir reads the contents of the directory associated with the file f and returns a slice of DirEntry values in directory order. Subsequent calls on the same file will yield later DirEntry records in the directory. 

If n > 0, ReadDir returns at most n DirEntry records. In this case, if ReadDir returns an empty slice, it will return an error explaining why. At the end of a directory, the error is io.EOF. 

If n <= 0, ReadDir returns all the DirEntry records remaining in the directory. When it succeeds, it returns a nil error (not io.EOF). 

#### <a id="File.readdir" href="#File.readdir">func (f *File) readdir(n int, mode readdirMode) (names []string, dirents []DirEntry, infos []FileInfo, err error)</a>

```
searchKey: os.File.readdir
```

```Go
func (f *File) readdir(n int, mode readdirMode) (names []string, dirents []DirEntry, infos []FileInfo, err error)
```

#### <a id="File.Name" href="#File.Name">func (f *File) Name() string</a>

```
searchKey: os.File.Name
tags: [exported]
```

```Go
func (f *File) Name() string
```

Name returns the name of the file as presented to Open. 

#### <a id="File.Read" href="#File.Read">func (f *File) Read(b []byte) (n int, err error)</a>

```
searchKey: os.File.Read
tags: [exported]
```

```Go
func (f *File) Read(b []byte) (n int, err error)
```

Read reads up to len(b) bytes from the File. It returns the number of bytes read and any error encountered. At end of file, Read returns 0, io.EOF. 

#### <a id="File.ReadAt" href="#File.ReadAt">func (f *File) ReadAt(b []byte, off int64) (n int, err error)</a>

```
searchKey: os.File.ReadAt
tags: [exported]
```

```Go
func (f *File) ReadAt(b []byte, off int64) (n int, err error)
```

ReadAt reads len(b) bytes from the File starting at byte offset off. It returns the number of bytes read and the error, if any. ReadAt always returns a non-nil error when n < len(b). At end of file, that error is io.EOF. 

#### <a id="File.ReadFrom" href="#File.ReadFrom">func (f *File) ReadFrom(r io.Reader) (n int64, err error)</a>

```
searchKey: os.File.ReadFrom
tags: [exported]
```

```Go
func (f *File) ReadFrom(r io.Reader) (n int64, err error)
```

ReadFrom implements io.ReaderFrom. 

#### <a id="File.Write" href="#File.Write">func (f *File) Write(b []byte) (n int, err error)</a>

```
searchKey: os.File.Write
tags: [exported]
```

```Go
func (f *File) Write(b []byte) (n int, err error)
```

Write writes len(b) bytes to the File. It returns the number of bytes written and an error, if any. Write returns a non-nil error when n != len(b). 

#### <a id="File.WriteAt" href="#File.WriteAt">func (f *File) WriteAt(b []byte, off int64) (n int, err error)</a>

```
searchKey: os.File.WriteAt
tags: [exported]
```

```Go
func (f *File) WriteAt(b []byte, off int64) (n int, err error)
```

WriteAt writes len(b) bytes to the File starting at byte offset off. It returns the number of bytes written and an error, if any. WriteAt returns a non-nil error when n != len(b). 

If file was opened with the O_APPEND flag, WriteAt returns an error. 

#### <a id="File.Seek" href="#File.Seek">func (f *File) Seek(offset int64, whence int) (ret int64, err error)</a>

```
searchKey: os.File.Seek
tags: [exported]
```

```Go
func (f *File) Seek(offset int64, whence int) (ret int64, err error)
```

Seek sets the offset for the next Read or Write on file to offset, interpreted according to whence: 0 means relative to the origin of the file, 1 means relative to the current offset, and 2 means relative to the end. It returns the new offset and an error, if any. The behavior of Seek on a file opened with O_APPEND is not specified. 

If f is a directory, the behavior of Seek varies by operating system; you can seek to the beginning of the directory on Unix-like operating systems, but not on Windows. 

#### <a id="File.WriteString" href="#File.WriteString">func (f *File) WriteString(s string) (n int, err error)</a>

```
searchKey: os.File.WriteString
tags: [exported]
```

```Go
func (f *File) WriteString(s string) (n int, err error)
```

WriteString is like Write, but writes the contents of string s rather than a slice of bytes. 

#### <a id="File.wrapErr" href="#File.wrapErr">func (f *File) wrapErr(op string, err error) error</a>

```
searchKey: os.File.wrapErr
```

```Go
func (f *File) wrapErr(op string, err error) error
```

wrapErr wraps an error that occurred during an operation on an open file. It passes io.EOF through unchanged, otherwise converts poll.ErrFileClosing to ErrClosed and wraps the error in a PathError. 

#### <a id="File.Chmod" href="#File.Chmod">func (f *File) Chmod(mode FileMode) error</a>

```
searchKey: os.File.Chmod
tags: [exported]
```

```Go
func (f *File) Chmod(mode FileMode) error
```

Chmod changes the mode of the file to mode. If there is an error, it will be of type *PathError. 

#### <a id="File.SetDeadline" href="#File.SetDeadline">func (f *File) SetDeadline(t time.Time) error</a>

```
searchKey: os.File.SetDeadline
tags: [exported]
```

```Go
func (f *File) SetDeadline(t time.Time) error
```

SetDeadline sets the read and write deadlines for a File. It is equivalent to calling both SetReadDeadline and SetWriteDeadline. 

Only some kinds of files support setting a deadline. Calls to SetDeadline for files that do not support deadlines will return ErrNoDeadline. On most systems ordinary files do not support deadlines, but pipes do. 

A deadline is an absolute time after which I/O operations fail with an error instead of blocking. The deadline applies to all future and pending I/O, not just the immediately following call to Read or Write. After a deadline has been exceeded, the connection can be refreshed by setting a deadline in the future. 

If the deadline is exceeded a call to Read or Write or to other I/O methods will return an error that wraps ErrDeadlineExceeded. This can be tested using errors.Is(err, os.ErrDeadlineExceeded). That error implements the Timeout method, and calling the Timeout method will return true, but there are other possible errors for which the Timeout will return true even if the deadline has not been exceeded. 

An idle timeout can be implemented by repeatedly extending the deadline after successful Read or Write calls. 

A zero value for t means I/O operations will not time out. 

#### <a id="File.SetReadDeadline" href="#File.SetReadDeadline">func (f *File) SetReadDeadline(t time.Time) error</a>

```
searchKey: os.File.SetReadDeadline
tags: [exported]
```

```Go
func (f *File) SetReadDeadline(t time.Time) error
```

SetReadDeadline sets the deadline for future Read calls and any currently-blocked Read call. A zero value for t means Read will not time out. Not all files support setting deadlines; see SetDeadline. 

#### <a id="File.SetWriteDeadline" href="#File.SetWriteDeadline">func (f *File) SetWriteDeadline(t time.Time) error</a>

```
searchKey: os.File.SetWriteDeadline
tags: [exported]
```

```Go
func (f *File) SetWriteDeadline(t time.Time) error
```

SetWriteDeadline sets the deadline for any future Write calls and any currently-blocked Write call. Even if Write times out, it may return n > 0, indicating that some of the data was successfully written. A zero value for t means Write will not time out. Not all files support setting deadlines; see SetDeadline. 

#### <a id="File.SyscallConn" href="#File.SyscallConn">func (f *File) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: os.File.SyscallConn
tags: [exported]
```

```Go
func (f *File) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw file. This implements the syscall.Conn interface. 

#### <a id="File.Close" href="#File.Close">func (f *File) Close() error</a>

```
searchKey: os.File.Close
tags: [exported]
```

```Go
func (f *File) Close() error
```

Close closes the File, rendering it unusable for I/O. On files that support SetDeadline, any pending I/O operations will be canceled and return immediately with an error. Close will return an error if it has already been called. 

#### <a id="File.read" href="#File.read">func (f *File) read(b []byte) (n int, err error)</a>

```
searchKey: os.File.read
```

```Go
func (f *File) read(b []byte) (n int, err error)
```

read reads up to len(b) bytes from the File. It returns the number of bytes read and an error, if any. 

#### <a id="File.pread" href="#File.pread">func (f *File) pread(b []byte, off int64) (n int, err error)</a>

```
searchKey: os.File.pread
```

```Go
func (f *File) pread(b []byte, off int64) (n int, err error)
```

pread reads len(b) bytes from the File starting at byte offset off. It returns the number of bytes read and the error, if any. EOF is signaled by a zero count with err set to nil. 

#### <a id="File.write" href="#File.write">func (f *File) write(b []byte) (n int, err error)</a>

```
searchKey: os.File.write
```

```Go
func (f *File) write(b []byte) (n int, err error)
```

write writes len(b) bytes to the File. It returns the number of bytes written and an error, if any. 

#### <a id="File.pwrite" href="#File.pwrite">func (f *File) pwrite(b []byte, off int64) (n int, err error)</a>

```
searchKey: os.File.pwrite
```

```Go
func (f *File) pwrite(b []byte, off int64) (n int, err error)
```

pwrite writes len(b) bytes to the File starting at byte offset off. It returns the number of bytes written and an error, if any. 

#### <a id="File.chmod" href="#File.chmod">func (f *File) chmod(mode FileMode) error</a>

```
searchKey: os.File.chmod
```

```Go
func (f *File) chmod(mode FileMode) error
```

See docs in file.go:(*File).Chmod. 

#### <a id="File.Chown" href="#File.Chown">func (f *File) Chown(uid, gid int) error</a>

```
searchKey: os.File.Chown
tags: [exported]
```

```Go
func (f *File) Chown(uid, gid int) error
```

Chown changes the numeric uid and gid of the named file. If there is an error, it will be of type *PathError. 

On Windows, it always returns the syscall.EWINDOWS error, wrapped in *PathError. 

#### <a id="File.Truncate" href="#File.Truncate">func (f *File) Truncate(size int64) error</a>

```
searchKey: os.File.Truncate
tags: [exported]
```

```Go
func (f *File) Truncate(size int64) error
```

Truncate changes the size of the file. It does not change the I/O offset. If there is an error, it will be of type *PathError. 

#### <a id="File.Sync" href="#File.Sync">func (f *File) Sync() error</a>

```
searchKey: os.File.Sync
tags: [exported]
```

```Go
func (f *File) Sync() error
```

Sync commits the current contents of the file to stable storage. Typically, this means flushing the file system's in-memory copy of recently written data to disk. 

#### <a id="File.Chdir" href="#File.Chdir">func (f *File) Chdir() error</a>

```
searchKey: os.File.Chdir
tags: [exported]
```

```Go
func (f *File) Chdir() error
```

Chdir changes the current working directory to the file, which must be a directory. If there is an error, it will be of type *PathError. 

#### <a id="File.setDeadline" href="#File.setDeadline">func (f *File) setDeadline(t time.Time) error</a>

```
searchKey: os.File.setDeadline
```

```Go
func (f *File) setDeadline(t time.Time) error
```

setDeadline sets the read and write deadline. 

#### <a id="File.setReadDeadline" href="#File.setReadDeadline">func (f *File) setReadDeadline(t time.Time) error</a>

```
searchKey: os.File.setReadDeadline
```

```Go
func (f *File) setReadDeadline(t time.Time) error
```

setReadDeadline sets the read deadline. 

#### <a id="File.setWriteDeadline" href="#File.setWriteDeadline">func (f *File) setWriteDeadline(t time.Time) error</a>

```
searchKey: os.File.setWriteDeadline
```

```Go
func (f *File) setWriteDeadline(t time.Time) error
```

setWriteDeadline sets the write deadline. 

#### <a id="File.checkValid" href="#File.checkValid">func (f *File) checkValid(op string) error</a>

```
searchKey: os.File.checkValid
```

```Go
func (f *File) checkValid(op string) error
```

checkValid checks whether f is valid for use. If not, it returns an appropriate error, perhaps incorporating the operation name op. 

#### <a id="File.Fd" href="#File.Fd">func (f *File) Fd() uintptr</a>

```
searchKey: os.File.Fd
tags: [exported]
```

```Go
func (f *File) Fd() uintptr
```

Fd returns the integer Unix file descriptor referencing the open file. If f is closed, the file descriptor becomes invalid. If f is garbage collected, a finalizer may close the file descriptor, making it invalid; see runtime.SetFinalizer for more information on when a finalizer might be run. On Unix systems this will cause the SetDeadline methods to stop working. Because file descriptors can be reused, the returned file descriptor may only be closed through the Close method of f, or by its finalizer during garbage collection. Otherwise, during garbage collection the finalizer may close an unrelated file descriptor with the same (reused) number. 

As an alternative, see the f.SyscallConn method. 

#### <a id="File.seek" href="#File.seek">func (f *File) seek(offset int64, whence int) (ret int64, err error)</a>

```
searchKey: os.File.seek
```

```Go
func (f *File) seek(offset int64, whence int) (ret int64, err error)
```

seek sets the offset for the next Read or Write on file to offset, interpreted according to whence: 0 means relative to the origin of the file, 1 means relative to the current offset, and 2 means relative to the end. It returns the new offset and an error, if any. 

#### <a id="File.readFrom" href="#File.readFrom">func (f *File) readFrom(r io.Reader) (n int64, handled bool, err error)</a>

```
searchKey: os.File.readFrom
```

```Go
func (f *File) readFrom(r io.Reader) (n int64, handled bool, err error)
```

#### <a id="File.Stat" href="#File.Stat">func (f *File) Stat() (FileInfo, error)</a>

```
searchKey: os.File.Stat
tags: [exported]
```

```Go
func (f *File) Stat() (FileInfo, error)
```

Stat returns the FileInfo structure describing file. If there is an error, it will be of type *PathError. 

### <a id="FileInfo" href="#FileInfo">type FileInfo fs.FileInfo</a>

```
searchKey: os.FileInfo
tags: [exported]
```

```Go
type FileInfo = fs.FileInfo
```

A FileInfo describes a file and is returned by Stat and Lstat. 

#### <a id="Stat" href="#Stat">func Stat(name string) (FileInfo, error)</a>

```
searchKey: os.Stat
tags: [exported]
```

```Go
func Stat(name string) (FileInfo, error)
```

Stat returns a FileInfo describing the named file. If there is an error, it will be of type *PathError. 

#### <a id="Lstat" href="#Lstat">func Lstat(name string) (FileInfo, error)</a>

```
searchKey: os.Lstat
tags: [exported]
```

```Go
func Lstat(name string) (FileInfo, error)
```

Lstat returns a FileInfo describing the named file. If the file is a symbolic link, the returned FileInfo describes the symbolic link. Lstat makes no attempt to follow the link. If there is an error, it will be of type *PathError. 

#### <a id="statNolog" href="#statNolog">func statNolog(name string) (FileInfo, error)</a>

```
searchKey: os.statNolog
```

```Go
func statNolog(name string) (FileInfo, error)
```

statNolog stats a file with no test logging. 

#### <a id="lstatNolog" href="#lstatNolog">func lstatNolog(name string) (FileInfo, error)</a>

```
searchKey: os.lstatNolog
```

```Go
func lstatNolog(name string) (FileInfo, error)
```

lstatNolog lstats a file with no test logging. 

### <a id="FileMode" href="#FileMode">type FileMode fs.FileMode</a>

```
searchKey: os.FileMode
tags: [exported]
```

```Go
type FileMode = fs.FileMode
```

A FileMode represents a file's mode and permission bits. The bits have the same definition on all systems, so that information about files can be moved from one system to another portably. Not all bits apply to all systems. The only required bit is ModeDir for directories. 

#### <a id="dtToType" href="#dtToType">func dtToType(typ uint8) FileMode</a>

```
searchKey: os.dtToType
```

```Go
func dtToType(typ uint8) FileMode
```

### <a id="fileStat" href="#fileStat">type fileStat struct</a>

```
searchKey: os.fileStat
```

```Go
type fileStat struct {
	name    string
	size    int64
	mode    FileMode
	modTime time.Time
	sys     syscall.Stat_t
}
```

A fileStat is the implementation of FileInfo returned by Stat and Lstat. 

#### <a id="fileStat.Name" href="#fileStat.Name">func (fs *fileStat) Name() string</a>

```
searchKey: os.fileStat.Name
```

```Go
func (fs *fileStat) Name() string
```

#### <a id="fileStat.IsDir" href="#fileStat.IsDir">func (fs *fileStat) IsDir() bool</a>

```
searchKey: os.fileStat.IsDir
```

```Go
func (fs *fileStat) IsDir() bool
```

#### <a id="fileStat.Size" href="#fileStat.Size">func (fs *fileStat) Size() int64</a>

```
searchKey: os.fileStat.Size
```

```Go
func (fs *fileStat) Size() int64
```

#### <a id="fileStat.Mode" href="#fileStat.Mode">func (fs *fileStat) Mode() FileMode</a>

```
searchKey: os.fileStat.Mode
```

```Go
func (fs *fileStat) Mode() FileMode
```

#### <a id="fileStat.ModTime" href="#fileStat.ModTime">func (fs *fileStat) ModTime() time.Time</a>

```
searchKey: os.fileStat.ModTime
```

```Go
func (fs *fileStat) ModTime() time.Time
```

#### <a id="fileStat.Sys" href="#fileStat.Sys">func (fs *fileStat) Sys() interface{}</a>

```
searchKey: os.fileStat.Sys
```

```Go
func (fs *fileStat) Sys() interface{}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="ReadDir" href="#ReadDir">func ReadDir(name string) ([]DirEntry, error)</a>

```
searchKey: os.ReadDir
tags: [exported]
```

```Go
func ReadDir(name string) ([]DirEntry, error)
```

ReadDir reads the named directory, returning all its directory entries sorted by filename. If an error occurs reading the directory, ReadDir returns the entries it was able to read before the error, along with the error. 

### <a id="closedir" href="#closedir">func closedir(dir uintptr) (err error)</a>

```
searchKey: os.closedir
```

```Go
func closedir(dir uintptr) (err error)
```

### <a id="Expand" href="#Expand">func Expand(s string, mapping func(string) string) string</a>

```
searchKey: os.Expand
tags: [exported]
```

```Go
func Expand(s string, mapping func(string) string) string
```

Expand replaces ${var} or $var in the string based on the mapping function. For example, os.ExpandEnv(s) is equivalent to os.Expand(s, os.Getenv). 

### <a id="ExpandEnv" href="#ExpandEnv">func ExpandEnv(s string) string</a>

```
searchKey: os.ExpandEnv
tags: [exported]
```

```Go
func ExpandEnv(s string) string
```

ExpandEnv replaces ${var} or $var in the string according to the values of the current environment variables. References to undefined variables are replaced by the empty string. 

### <a id="isShellSpecialVar" href="#isShellSpecialVar">func isShellSpecialVar(c uint8) bool</a>

```
searchKey: os.isShellSpecialVar
```

```Go
func isShellSpecialVar(c uint8) bool
```

isShellSpecialVar reports whether the character identifies a special shell variable such as $*. 

### <a id="isAlphaNum" href="#isAlphaNum">func isAlphaNum(c uint8) bool</a>

```
searchKey: os.isAlphaNum
```

```Go
func isAlphaNum(c uint8) bool
```

isAlphaNum reports whether the byte is an ASCII letter, number, or underscore 

### <a id="getShellName" href="#getShellName">func getShellName(s string) (string, int)</a>

```
searchKey: os.getShellName
```

```Go
func getShellName(s string) (string, int)
```

getShellName returns the name that begins the string and the number of bytes consumed to extract it. If the name is enclosed in {}, it's part of a ${} expansion and two more bytes are needed than the length of the name. 

### <a id="Getenv" href="#Getenv">func Getenv(key string) string</a>

```
searchKey: os.Getenv
tags: [exported]
```

```Go
func Getenv(key string) string
```

Getenv retrieves the value of the environment variable named by the key. It returns the value, which will be empty if the variable is not present. To distinguish between an empty value and an unset value, use LookupEnv. 

### <a id="LookupEnv" href="#LookupEnv">func LookupEnv(key string) (string, bool)</a>

```
searchKey: os.LookupEnv
tags: [exported]
```

```Go
func LookupEnv(key string) (string, bool)
```

LookupEnv retrieves the value of the environment variable named by the key. If the variable is present in the environment the value (which may be empty) is returned and the boolean is true. Otherwise the returned value will be empty and the boolean will be false. 

### <a id="Setenv" href="#Setenv">func Setenv(key, value string) error</a>

```
searchKey: os.Setenv
tags: [exported]
```

```Go
func Setenv(key, value string) error
```

Setenv sets the value of the environment variable named by the key. It returns an error, if any. 

### <a id="Unsetenv" href="#Unsetenv">func Unsetenv(key string) error</a>

```
searchKey: os.Unsetenv
tags: [exported]
```

```Go
func Unsetenv(key string) error
```

Unsetenv unsets a single environment variable. 

### <a id="Clearenv" href="#Clearenv">func Clearenv()</a>

```
searchKey: os.Clearenv
tags: [exported]
```

```Go
func Clearenv()
```

Clearenv deletes all environment variables. 

### <a id="Environ" href="#Environ">func Environ() []string</a>

```
searchKey: os.Environ
tags: [exported]
```

```Go
func Environ() []string
```

Environ returns a copy of strings representing the environment, in the form "key=value". 

### <a id="errClosed" href="#errClosed">func errClosed() error</a>

```
searchKey: os.errClosed
```

```Go
func errClosed() error
```

### <a id="errNoDeadline" href="#errNoDeadline">func errNoDeadline() error</a>

```
searchKey: os.errNoDeadline
```

```Go
func errNoDeadline() error
```

### <a id="errDeadlineExceeded" href="#errDeadlineExceeded">func errDeadlineExceeded() error</a>

```
searchKey: os.errDeadlineExceeded
```

```Go
func errDeadlineExceeded() error
```

errDeadlineExceeded returns the value for os.ErrDeadlineExceeded. This error comes from the internal/poll package, which is also used by package net. Doing this this way ensures that the net package will return os.ErrDeadlineExceeded for an exceeded deadline, as documented by net.Conn.SetDeadline, without requiring any extra work in the net package and without requiring the internal/poll package to import os (which it can't, because that would be circular). 

### <a id="NewSyscallError" href="#NewSyscallError">func NewSyscallError(syscall string, err error) error</a>

```
searchKey: os.NewSyscallError
tags: [exported]
```

```Go
func NewSyscallError(syscall string, err error) error
```

NewSyscallError returns, as an error, a new SyscallError with the given system call name and error details. As a convenience, if err is nil, NewSyscallError returns nil. 

### <a id="IsExist" href="#IsExist">func IsExist(err error) bool</a>

```
searchKey: os.IsExist
tags: [exported]
```

```Go
func IsExist(err error) bool
```

IsExist returns a boolean indicating whether the error is known to report that a file or directory already exists. It is satisfied by ErrExist as well as some syscall errors. 

This function predates errors.Is. It only supports errors returned by the os package. New code should use errors.Is(err, fs.ErrExist). 

### <a id="IsNotExist" href="#IsNotExist">func IsNotExist(err error) bool</a>

```
searchKey: os.IsNotExist
tags: [exported]
```

```Go
func IsNotExist(err error) bool
```

IsNotExist returns a boolean indicating whether the error is known to report that a file or directory does not exist. It is satisfied by ErrNotExist as well as some syscall errors. 

This function predates errors.Is. It only supports errors returned by the os package. New code should use errors.Is(err, fs.ErrNotExist). 

### <a id="IsPermission" href="#IsPermission">func IsPermission(err error) bool</a>

```
searchKey: os.IsPermission
tags: [exported]
```

```Go
func IsPermission(err error) bool
```

IsPermission returns a boolean indicating whether the error is known to report that permission is denied. It is satisfied by ErrPermission as well as some syscall errors. 

This function predates errors.Is. It only supports errors returned by the os package. New code should use errors.Is(err, fs.ErrPermission). 

### <a id="IsTimeout" href="#IsTimeout">func IsTimeout(err error) bool</a>

```
searchKey: os.IsTimeout
tags: [exported]
```

```Go
func IsTimeout(err error) bool
```

IsTimeout returns a boolean indicating whether the error is known to report that a timeout occurred. 

This function predates errors.Is, and the notion of whether an error indicates a timeout can be ambiguous. For example, the Unix error EWOULDBLOCK sometimes indicates a timeout and sometimes does not. New code should use errors.Is with a value appropriate to the call returning the error, such as os.ErrDeadlineExceeded. 

### <a id="underlyingErrorIs" href="#underlyingErrorIs">func underlyingErrorIs(err, target error) bool</a>

```
searchKey: os.underlyingErrorIs
```

```Go
func underlyingErrorIs(err, target error) bool
```

### <a id="underlyingError" href="#underlyingError">func underlyingError(err error) error</a>

```
searchKey: os.underlyingError
```

```Go
func underlyingError(err error) error
```

underlyingError returns the underlying error for known os error types. 

### <a id="wrapSyscallError" href="#wrapSyscallError">func wrapSyscallError(name string, err error) error</a>

```
searchKey: os.wrapSyscallError
```

```Go
func wrapSyscallError(name string, err error) error
```

wrapSyscallError takes an error and a syscall name. If the error is a syscall.Errno, it wraps it in a os.SyscallError using the syscall name. 

### <a id="Getpid" href="#Getpid">func Getpid() int</a>

```
searchKey: os.Getpid
tags: [exported]
```

```Go
func Getpid() int
```

Getpid returns the process id of the caller. 

### <a id="Getppid" href="#Getppid">func Getppid() int</a>

```
searchKey: os.Getppid
tags: [exported]
```

```Go
func Getppid() int
```

Getppid returns the process id of the caller's parent. 

### <a id="Executable" href="#Executable">func Executable() (string, error)</a>

```
searchKey: os.Executable
tags: [exported]
```

```Go
func Executable() (string, error)
```

Executable returns the path name for the executable that started the current process. There is no guarantee that the path is still pointing to the correct executable. If a symlink was used to start the process, depending on the operating system, the result might be the symlink or the path it pointed to. If a stable result is needed, path/filepath.EvalSymlinks might help. 

Executable returns an absolute path unless an error occurred. 

The main use case is finding resources located relative to an executable. 

### <a id="executable" href="#executable">func executable() (string, error)</a>

```
searchKey: os.executable
```

```Go
func executable() (string, error)
```

### <a id="genericReadFrom" href="#genericReadFrom">func genericReadFrom(f *File, r io.Reader) (int64, error)</a>

```
searchKey: os.genericReadFrom
```

```Go
func genericReadFrom(f *File, r io.Reader) (int64, error)
```

### <a id="Mkdir" href="#Mkdir">func Mkdir(name string, perm FileMode) error</a>

```
searchKey: os.Mkdir
tags: [exported]
```

```Go
func Mkdir(name string, perm FileMode) error
```

Mkdir creates a new directory with the specified name and permission bits (before umask). If there is an error, it will be of type *PathError. 

### <a id="setStickyBit" href="#setStickyBit">func setStickyBit(name string) error</a>

```
searchKey: os.setStickyBit
```

```Go
func setStickyBit(name string) error
```

setStickyBit adds ModeSticky to the permission bits of path, non atomic. 

### <a id="Chdir" href="#Chdir">func Chdir(dir string) error</a>

```
searchKey: os.Chdir
tags: [exported]
```

```Go
func Chdir(dir string) error
```

Chdir changes the current working directory to the named directory. If there is an error, it will be of type *PathError. 

### <a id="Rename" href="#Rename">func Rename(oldpath, newpath string) error</a>

```
searchKey: os.Rename
tags: [exported]
```

```Go
func Rename(oldpath, newpath string) error
```

Rename renames (moves) oldpath to newpath. If newpath already exists and is not a directory, Rename replaces it. OS-specific restrictions may apply when oldpath and newpath are in different directories. If there is an error, it will be of type *LinkError. 

### <a id="fixCount" href="#fixCount">func fixCount(n int, err error) (int, error)</a>

```
searchKey: os.fixCount
```

```Go
func fixCount(n int, err error) (int, error)
```

Many functions in package syscall return a count of -1 instead of 0. Using fixCount(call()) instead of call() corrects the count. 

### <a id="TempDir" href="#TempDir">func TempDir() string</a>

```
searchKey: os.TempDir
tags: [exported]
```

```Go
func TempDir() string
```

TempDir returns the default directory to use for temporary files. 

On Unix systems, it returns $TMPDIR if non-empty, else /tmp. On Windows, it uses GetTempPath, returning the first non-empty value from %TMP%, %TEMP%, %USERPROFILE%, or the Windows directory. On Plan 9, it returns /tmp. 

The directory is neither guaranteed to exist nor have accessible permissions. 

### <a id="UserCacheDir" href="#UserCacheDir">func UserCacheDir() (string, error)</a>

```
searchKey: os.UserCacheDir
tags: [exported]
```

```Go
func UserCacheDir() (string, error)
```

UserCacheDir returns the default root directory to use for user-specific cached data. Users should create their own application-specific subdirectory within this one and use that. 

On Unix systems, it returns $XDG_CACHE_HOME as specified by [https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) if non-empty, else $HOME/.cache. On Darwin, it returns $HOME/Library/Caches. On Windows, it returns %LocalAppData%. On Plan 9, it returns $home/lib/cache. 

If the location cannot be determined (for example, $HOME is not defined), then it will return an error. 

### <a id="UserConfigDir" href="#UserConfigDir">func UserConfigDir() (string, error)</a>

```
searchKey: os.UserConfigDir
tags: [exported]
```

```Go
func UserConfigDir() (string, error)
```

UserConfigDir returns the default root directory to use for user-specific configuration data. Users should create their own application-specific subdirectory within this one and use that. 

On Unix systems, it returns $XDG_CONFIG_HOME as specified by [https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) if non-empty, else $HOME/.config. On Darwin, it returns $HOME/Library/Application Support. On Windows, it returns %AppData%. On Plan 9, it returns $home/lib. 

If the location cannot be determined (for example, $HOME is not defined), then it will return an error. 

### <a id="UserHomeDir" href="#UserHomeDir">func UserHomeDir() (string, error)</a>

```
searchKey: os.UserHomeDir
tags: [exported]
```

```Go
func UserHomeDir() (string, error)
```

UserHomeDir returns the current user's home directory. 

On Unix, including macOS, it returns the $HOME environment variable. On Windows, it returns %USERPROFILE%. On Plan 9, it returns the $home environment variable. 

### <a id="Chmod" href="#Chmod">func Chmod(name string, mode FileMode) error</a>

```
searchKey: os.Chmod
tags: [exported]
```

```Go
func Chmod(name string, mode FileMode) error
```

Chmod changes the mode of the named file to mode. If the file is a symbolic link, it changes the mode of the link's target. If there is an error, it will be of type *PathError. 

A different subset of the mode bits are used, depending on the operating system. 

On Unix, the mode's permission bits, ModeSetuid, ModeSetgid, and ModeSticky are used. 

On Windows, only the 0200 bit (owner writable) of mode is used; it controls whether the file's read-only attribute is set or cleared. The other bits are currently unused. For compatibility with Go 1.12 and earlier, use a non-zero mode. Use mode 0400 for a read-only file and 0600 for a readable+writable file. 

On Plan 9, the mode's permission bits, ModeAppend, ModeExclusive, and ModeTemporary are used. 

### <a id="isWindowsNulName" href="#isWindowsNulName">func isWindowsNulName(name string) bool</a>

```
searchKey: os.isWindowsNulName
```

```Go
func isWindowsNulName(name string) bool
```

isWindowsNulName reports whether name is os.DevNull ('NUL') on Windows. True is returned if name is 'NUL' whatever the case. 

### <a id="DirFS" href="#DirFS">func DirFS(dir string) fs.FS</a>

```
searchKey: os.DirFS
tags: [exported]
```

```Go
func DirFS(dir string) fs.FS
```

DirFS returns a file system (an fs.FS) for the tree of files rooted at the directory dir. 

Note that DirFS("/prefix") only guarantees that the Open calls it makes to the operating system will begin with "/prefix": DirFS("/prefix").Open("file") is the same as os.Open("/prefix/file"). So if /prefix/file is a symbolic link pointing outside the /prefix tree, then using DirFS does not stop the access any more than using os.Open does. DirFS is therefore not a general substitute for a chroot-style security mechanism when the directory tree contains arbitrary content. 

### <a id="containsAny" href="#containsAny">func containsAny(s, chars string) bool</a>

```
searchKey: os.containsAny
```

```Go
func containsAny(s, chars string) bool
```

### <a id="ReadFile" href="#ReadFile">func ReadFile(name string) ([]byte, error)</a>

```
searchKey: os.ReadFile
tags: [exported]
```

```Go
func ReadFile(name string) ([]byte, error)
```

ReadFile reads the named file and returns the contents. A successful call returns err == nil, not err == EOF. Because ReadFile reads the whole file, it does not treat an EOF from Read as an error to be reported. 

### <a id="WriteFile" href="#WriteFile">func WriteFile(name string, data []byte, perm FileMode) error</a>

```
searchKey: os.WriteFile
tags: [exported]
```

```Go
func WriteFile(name string, data []byte, perm FileMode) error
```

WriteFile writes data to the named file, creating it if necessary. If the file does not exist, WriteFile creates it with permissions perm (before umask); otherwise WriteFile truncates it before writing, without changing permissions. 

### <a id="sigpipe" href="#sigpipe">func sigpipe()</a>

```
searchKey: os.sigpipe
```

```Go
func sigpipe()
```

### <a id="syscallMode" href="#syscallMode">func syscallMode(i FileMode) (o uint32)</a>

```
searchKey: os.syscallMode
```

```Go
func syscallMode(i FileMode) (o uint32)
```

syscallMode returns the syscall-specific mode bits from Go's portable mode bits. 

### <a id="chmod" href="#chmod">func chmod(name string, mode FileMode) error</a>

```
searchKey: os.chmod
```

```Go
func chmod(name string, mode FileMode) error
```

See docs in file.go:Chmod. 

### <a id="Chown" href="#Chown">func Chown(name string, uid, gid int) error</a>

```
searchKey: os.Chown
tags: [exported]
```

```Go
func Chown(name string, uid, gid int) error
```

Chown changes the numeric uid and gid of the named file. If the file is a symbolic link, it changes the uid and gid of the link's target. A uid or gid of -1 means to not change that value. If there is an error, it will be of type *PathError. 

On Windows or Plan 9, Chown always returns the syscall.EWINDOWS or EPLAN9 error, wrapped in *PathError. 

### <a id="Lchown" href="#Lchown">func Lchown(name string, uid, gid int) error</a>

```
searchKey: os.Lchown
tags: [exported]
```

```Go
func Lchown(name string, uid, gid int) error
```

Lchown changes the numeric uid and gid of the named file. If the file is a symbolic link, it changes the uid and gid of the link itself. If there is an error, it will be of type *PathError. 

On Windows, it always returns the syscall.EWINDOWS error, wrapped in *PathError. 

### <a id="Chtimes" href="#Chtimes">func Chtimes(name string, atime time.Time, mtime time.Time) error</a>

```
searchKey: os.Chtimes
tags: [exported]
```

```Go
func Chtimes(name string, atime time.Time, mtime time.Time) error
```

Chtimes changes the access and modification times of the named file, similar to the Unix utime() or utimes() functions. 

The underlying filesystem may truncate or round the values to a less precise time unit. If there is an error, it will be of type *PathError. 

### <a id="ignoringEINTR" href="#ignoringEINTR">func ignoringEINTR(fn func() error) error</a>

```
searchKey: os.ignoringEINTR
```

```Go
func ignoringEINTR(fn func() error) error
```

ignoringEINTR makes a function call and repeats it if it returns an EINTR error. This appears to be required even though we install all signal handlers with SA_RESTART: see #22838, #38033, #38836, #40846. Also #20400 and #36644 are issues in which a signal handler is installed without setting SA_RESTART. None of these are the common case, but there are enough of them that it seems that we can't avoid an EINTR loop. 

### <a id="fixLongPath" href="#fixLongPath">func fixLongPath(path string) string</a>

```
searchKey: os.fixLongPath
```

```Go
func fixLongPath(path string) string
```

fixLongPath is a noop on non-Windows platforms. 

### <a id="rename" href="#rename">func rename(oldname, newname string) error</a>

```
searchKey: os.rename
```

```Go
func rename(oldname, newname string) error
```

### <a id="epipecheck" href="#epipecheck">func epipecheck(file *File, e error)</a>

```
searchKey: os.epipecheck
```

```Go
func epipecheck(file *File, e error)
```

epipecheck raises SIGPIPE if we get an EPIPE error on standard output or standard error. See the SIGPIPE docs in os/signal, and issue 11845. 

### <a id="Truncate" href="#Truncate">func Truncate(name string, size int64) error</a>

```
searchKey: os.Truncate
tags: [exported]
```

```Go
func Truncate(name string, size int64) error
```

Truncate changes the size of the named file. If the file is a symbolic link, it changes the size of the link's target. If there is an error, it will be of type *PathError. 

### <a id="Remove" href="#Remove">func Remove(name string) error</a>

```
searchKey: os.Remove
tags: [exported]
```

```Go
func Remove(name string) error
```

Remove removes the named file or (empty) directory. If there is an error, it will be of type *PathError. 

### <a id="tempDir" href="#tempDir">func tempDir() string</a>

```
searchKey: os.tempDir
```

```Go
func tempDir() string
```

### <a id="Link" href="#Link">func Link(oldname, newname string) error</a>

```
searchKey: os.Link
tags: [exported]
```

```Go
func Link(oldname, newname string) error
```

Link creates newname as a hard link to the oldname file. If there is an error, it will be of type *LinkError. 

### <a id="Symlink" href="#Symlink">func Symlink(oldname, newname string) error</a>

```
searchKey: os.Symlink
tags: [exported]
```

```Go
func Symlink(oldname, newname string) error
```

Symlink creates newname as a symbolic link to oldname. On Windows, a symlink to a non-existent oldname creates a file symlink; if oldname is later created as a directory the symlink will not work. If there is an error, it will be of type *LinkError. 

### <a id="Readlink" href="#Readlink">func Readlink(name string) (string, error)</a>

```
searchKey: os.Readlink
tags: [exported]
```

```Go
func Readlink(name string) (string, error)
```

Readlink returns the destination of the named symbolic link. If there is an error, it will be of type *PathError. 

### <a id="Getwd" href="#Getwd">func Getwd() (dir string, err error)</a>

```
searchKey: os.Getwd
tags: [exported]
```

```Go
func Getwd() (dir string, err error)
```

Getwd returns a rooted path name corresponding to the current directory. If the current directory can be reached via multiple paths (due to symbolic links), Getwd may return any one of them. 

### <a id="MkdirAll" href="#MkdirAll">func MkdirAll(path string, perm FileMode) error</a>

```
searchKey: os.MkdirAll
tags: [exported]
```

```Go
func MkdirAll(path string, perm FileMode) error
```

MkdirAll creates a directory named path, along with any necessary parents, and returns nil, or else returns an error. The permission bits perm (before umask) are used for all directories that MkdirAll creates. If path is already a directory, MkdirAll does nothing and returns nil. 

### <a id="RemoveAll" href="#RemoveAll">func RemoveAll(path string) error</a>

```
searchKey: os.RemoveAll
tags: [exported]
```

```Go
func RemoveAll(path string) error
```

RemoveAll removes path and any children it contains. It removes everything it can but returns the first error it encounters. If the path does not exist, RemoveAll returns nil (no error). If there is an error, it will be of type *PathError. 

### <a id="endsWithDot" href="#endsWithDot">func endsWithDot(path string) bool</a>

```
searchKey: os.endsWithDot
```

```Go
func endsWithDot(path string) bool
```

endsWithDot reports whether the final component of path is ".". 

### <a id="IsPathSeparator" href="#IsPathSeparator">func IsPathSeparator(c uint8) bool</a>

```
searchKey: os.IsPathSeparator
tags: [exported]
```

```Go
func IsPathSeparator(c uint8) bool
```

IsPathSeparator reports whether c is a directory separator character. 

### <a id="basename" href="#basename">func basename(name string) string</a>

```
searchKey: os.basename
```

```Go
func basename(name string) string
```

basename removes trailing slashes and the leading directory name from path name. 

### <a id="splitPath" href="#splitPath">func splitPath(path string) (string, string)</a>

```
searchKey: os.splitPath
```

```Go
func splitPath(path string) (string, string)
```

splitPath returns the base name and parent directory. 

### <a id="fixRootDirectory" href="#fixRootDirectory">func fixRootDirectory(p string) string</a>

```
searchKey: os.fixRootDirectory
```

```Go
func fixRootDirectory(p string) string
```

### <a id="init" href="#init">func init()</a>

```
searchKey: os.init
```

```Go
func init()
```

### <a id="runtime_args" href="#runtime_args">func runtime_args() []string</a>

```
searchKey: os.runtime_args
```

```Go
func runtime_args() []string
```

### <a id="Getuid" href="#Getuid">func Getuid() int</a>

```
searchKey: os.Getuid
tags: [exported]
```

```Go
func Getuid() int
```

Getuid returns the numeric user id of the caller. 

On Windows, it returns -1. 

### <a id="Geteuid" href="#Geteuid">func Geteuid() int</a>

```
searchKey: os.Geteuid
tags: [exported]
```

```Go
func Geteuid() int
```

Geteuid returns the numeric effective user id of the caller. 

On Windows, it returns -1. 

### <a id="Getgid" href="#Getgid">func Getgid() int</a>

```
searchKey: os.Getgid
tags: [exported]
```

```Go
func Getgid() int
```

Getgid returns the numeric group id of the caller. 

On Windows, it returns -1. 

### <a id="Getegid" href="#Getegid">func Getegid() int</a>

```
searchKey: os.Getegid
tags: [exported]
```

```Go
func Getegid() int
```

Getegid returns the numeric effective group id of the caller. 

On Windows, it returns -1. 

### <a id="Getgroups" href="#Getgroups">func Getgroups() ([]int, error)</a>

```
searchKey: os.Getgroups
tags: [exported]
```

```Go
func Getgroups() ([]int, error)
```

Getgroups returns a list of the numeric ids of groups that the caller belongs to. 

On Windows, it returns syscall.EWINDOWS. See the os/user package for a possible alternative. 

### <a id="Exit" href="#Exit">func Exit(code int)</a>

```
searchKey: os.Exit
tags: [exported]
```

```Go
func Exit(code int)
```

Exit causes the current program to exit with the given status code. Conventionally, code zero indicates success, non-zero an error. The program terminates immediately; deferred functions are not run. 

For portability, the status code should be in the range [0, 125]. 

### <a id="runtime_beforeExit" href="#runtime_beforeExit">func runtime_beforeExit()</a>

```
searchKey: os.runtime_beforeExit
```

```Go
func runtime_beforeExit()
```

### <a id="removeAll" href="#removeAll">func removeAll(path string) error</a>

```
searchKey: os.removeAll
```

```Go
func removeAll(path string) error
```

### <a id="removeAllFrom" href="#removeAllFrom">func removeAllFrom(parent *File, base string) error</a>

```
searchKey: os.removeAllFrom
```

```Go
func removeAllFrom(parent *File, base string) error
```

### <a id="fillFileStatFromSys" href="#fillFileStatFromSys">func fillFileStatFromSys(fs *fileStat, name string)</a>

```
searchKey: os.fillFileStatFromSys
```

```Go
func fillFileStatFromSys(fs *fileStat, name string)
```

### <a id="timespecToTime" href="#timespecToTime">func timespecToTime(ts syscall.Timespec) time.Time</a>

```
searchKey: os.timespecToTime
```

```Go
func timespecToTime(ts syscall.Timespec) time.Time
```

### <a id="atime" href="#atime">func atime(fi FileInfo) time.Time</a>

```
searchKey: os.atime
```

```Go
func atime(fi FileInfo) time.Time
```

For testing. 

### <a id="itox" href="#itox">func itox(val int) string</a>

```
searchKey: os.itox
```

```Go
func itox(val int) string
```

itox converts val (an int) to a hexdecimal string. 

### <a id="uitox" href="#uitox">func uitox(val uint) string</a>

```
searchKey: os.uitox
```

```Go
func uitox(val uint) string
```

uitox converts val (a uint) to a hexdecimal string. 

### <a id="Hostname" href="#Hostname">func Hostname() (name string, err error)</a>

```
searchKey: os.Hostname
tags: [exported]
```

```Go
func Hostname() (name string, err error)
```

Hostname returns the host name reported by the kernel. 

### <a id="hostname" href="#hostname">func hostname() (name string, err error)</a>

```
searchKey: os.hostname
```

```Go
func hostname() (name string, err error)
```

### <a id="fastrand" href="#fastrand">func fastrand() uint32</a>

```
searchKey: os.fastrand
```

```Go
func fastrand() uint32
```

fastrand provided by runtime. We generate random temporary file names so that there's a good chance the file doesn't exist yet - keeps the number of tries in TempFile to a minimum. 

### <a id="nextRandom" href="#nextRandom">func nextRandom() string</a>

```
searchKey: os.nextRandom
```

```Go
func nextRandom() string
```

### <a id="prefixAndSuffix" href="#prefixAndSuffix">func prefixAndSuffix(pattern string) (prefix, suffix string, err error)</a>

```
searchKey: os.prefixAndSuffix
```

```Go
func prefixAndSuffix(pattern string) (prefix, suffix string, err error)
```

prefixAndSuffix splits pattern by the last wildcard "*", if applicable, returning prefix as the part before "*" and suffix as the part after "*". 

### <a id="MkdirTemp" href="#MkdirTemp">func MkdirTemp(dir, pattern string) (string, error)</a>

```
searchKey: os.MkdirTemp
tags: [exported]
```

```Go
func MkdirTemp(dir, pattern string) (string, error)
```

MkdirTemp creates a new temporary directory in the directory dir and returns the pathname of the new directory. The new directory's name is generated by adding a random string to the end of pattern. If pattern includes a "*", the random string replaces the last "*" instead. If dir is the empty string, MkdirTemp uses the default directory for temporary files, as returned by TempDir. Multiple programs or goroutines calling MkdirTemp simultaneously will not choose the same directory. It is the caller's responsibility to remove the directory when it is no longer needed. 

### <a id="joinPath" href="#joinPath">func joinPath(dir, name string) string</a>

```
searchKey: os.joinPath
```

```Go
func joinPath(dir, name string) string
```

### <a id="lastIndex" href="#lastIndex">func lastIndex(s string, sep byte) int</a>

```
searchKey: os.lastIndex
```

```Go
func lastIndex(s string, sep byte) int
```

LastIndexByte from the strings package. 

### <a id="Getpagesize" href="#Getpagesize">func Getpagesize() int</a>

```
searchKey: os.Getpagesize
tags: [exported]
```

```Go
func Getpagesize() int
```

Getpagesize returns the underlying system's memory page size. 

### <a id="SameFile" href="#SameFile">func SameFile(fi1, fi2 FileInfo) bool</a>

```
searchKey: os.SameFile
tags: [exported]
```

```Go
func SameFile(fi1, fi2 FileInfo) bool
```

SameFile reports whether fi1 and fi2 describe the same file. For example, on Unix this means that the device and inode fields of the two underlying structures are identical; on other systems the decision may be based on the path names. SameFile only applies to results returned by this package's Stat. It returns false in other cases. 

### <a id="sameFile" href="#sameFile">func sameFile(fs1, fs2 *fileStat) bool</a>

```
searchKey: os.sameFile
```

```Go
func sameFile(fs1, fs2 *fileStat) bool
```

