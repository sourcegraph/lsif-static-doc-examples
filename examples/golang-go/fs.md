# Package fs

Package fs defines basic interfaces to a file system. A file system can be provided by the host operating system but also by other packages. 

## Index

* [Constants](#const)
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
    * [var ErrInvalid](#ErrInvalid)
    * [var ErrPermission](#ErrPermission)
    * [var ErrExist](#ErrExist)
    * [var ErrNotExist](#ErrNotExist)
    * [var ErrClosed](#ErrClosed)
    * [var SkipDir](#SkipDir)
* [Types](#type)
    * [type FS interface](#FS)
        * [func Sub(fsys FS, dir string) (FS, error)](#Sub)
    * [type File interface](#File)
    * [type DirEntry interface](#DirEntry)
        * [func FileInfoToDirEntry(info FileInfo) DirEntry](#FileInfoToDirEntry)
    * [type ReadDirFile interface](#ReadDirFile)
    * [type FileInfo interface](#FileInfo)
        * [func Stat(fsys FS, name string) (FileInfo, error)](#Stat)
    * [type FileMode uint32](#FileMode)
        * [func (m FileMode) String() string](#FileMode.String)
        * [func (m FileMode) IsDir() bool](#FileMode.IsDir)
        * [func (m FileMode) IsRegular() bool](#FileMode.IsRegular)
        * [func (m FileMode) Perm() FileMode](#FileMode.Perm)
        * [func (m FileMode) Type() FileMode](#FileMode.Type)
    * [type PathError struct](#PathError)
        * [func (e *PathError) Error() string](#PathError.Error)
        * [func (e *PathError) Unwrap() error](#PathError.Unwrap)
        * [func (e *PathError) Timeout() bool](#PathError.Timeout)
    * [type GlobFS interface](#GlobFS)
    * [type ReadDirFS interface](#ReadDirFS)
    * [type dirInfo struct](#dirInfo)
        * [func (di dirInfo) IsDir() bool](#dirInfo.IsDir)
        * [func (di dirInfo) Type() FileMode](#dirInfo.Type)
        * [func (di dirInfo) Info() (FileInfo, error)](#dirInfo.Info)
        * [func (di dirInfo) Name() string](#dirInfo.Name)
    * [type ReadFileFS interface](#ReadFileFS)
    * [type StatFS interface](#StatFS)
    * [type SubFS interface](#SubFS)
    * [type subFS struct](#subFS)
        * [func (f *subFS) fullName(op string, name string) (string, error)](#subFS.fullName)
        * [func (f *subFS) shorten(name string) (rel string, ok bool)](#subFS.shorten)
        * [func (f *subFS) fixErr(err error) error](#subFS.fixErr)
        * [func (f *subFS) Open(name string) (File, error)](#subFS.Open)
        * [func (f *subFS) ReadDir(name string) ([]DirEntry, error)](#subFS.ReadDir)
        * [func (f *subFS) ReadFile(name string) ([]byte, error)](#subFS.ReadFile)
        * [func (f *subFS) Glob(pattern string) ([]string, error)](#subFS.Glob)
        * [func (f *subFS) Sub(dir string) (FS, error)](#subFS.Sub)
    * [type WalkDirFunc func(path string, d std/io/fs.DirEntry, err error) error](#WalkDirFunc)
    * [type statDirEntry struct](#statDirEntry)
        * [func (d *statDirEntry) Name() string](#statDirEntry.Name)
        * [func (d *statDirEntry) IsDir() bool](#statDirEntry.IsDir)
        * [func (d *statDirEntry) Type() FileMode](#statDirEntry.Type)
        * [func (d *statDirEntry) Info() (FileInfo, error)](#statDirEntry.Info)
* [Functions](#func)
    * [func ValidPath(name string) bool](#ValidPath)
    * [func errInvalid() error](#errInvalid)
    * [func errPermission() error](#errPermission)
    * [func errExist() error](#errExist)
    * [func errNotExist() error](#errNotExist)
    * [func errClosed() error](#errClosed)
    * [func Glob(fsys FS, pattern string) (matches []string, err error)](#Glob)
    * [func cleanGlobPath(path string) string](#cleanGlobPath)
    * [func glob(fs FS, dir, pattern string, matches []string) (m []string, e error)](#glob)
    * [func hasMeta(path string) bool](#hasMeta)
    * [func ReadDir(fsys FS, name string) ([]DirEntry, error)](#ReadDir)
    * [func ReadFile(fsys FS, name string) ([]byte, error)](#ReadFile)
    * [func walkDir(fsys FS, name string, d DirEntry, walkDirFn WalkDirFunc) error](#walkDir)
    * [func WalkDir(fsys FS, root string, fn WalkDirFunc) error](#WalkDir)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="ModeDir" href="#ModeDir">const ModeDir</a>

```
searchKey: fs.ModeDir
tags: [exported]
```

```Go
const ModeDir FileMode = 1 << (32 - 1 - iota) // d: is a directory

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

The single letters are the abbreviations used by the String method's formatting. 

### <a id="ModeAppend" href="#ModeAppend">const ModeAppend</a>

```
searchKey: fs.ModeAppend
tags: [exported]
```

```Go
const ModeAppend // a: append-only

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeExclusive" href="#ModeExclusive">const ModeExclusive</a>

```
searchKey: fs.ModeExclusive
tags: [exported]
```

```Go
const ModeExclusive // l: exclusive use

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeTemporary" href="#ModeTemporary">const ModeTemporary</a>

```
searchKey: fs.ModeTemporary
tags: [exported]
```

```Go
const ModeTemporary // T: temporary file; Plan 9 only

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSymlink" href="#ModeSymlink">const ModeSymlink</a>

```
searchKey: fs.ModeSymlink
tags: [exported]
```

```Go
const ModeSymlink // L: symbolic link

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeDevice" href="#ModeDevice">const ModeDevice</a>

```
searchKey: fs.ModeDevice
tags: [exported]
```

```Go
const ModeDevice // D: device file

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeNamedPipe" href="#ModeNamedPipe">const ModeNamedPipe</a>

```
searchKey: fs.ModeNamedPipe
tags: [exported]
```

```Go
const ModeNamedPipe // p: named pipe (FIFO)

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSocket" href="#ModeSocket">const ModeSocket</a>

```
searchKey: fs.ModeSocket
tags: [exported]
```

```Go
const ModeSocket // S: Unix domain socket

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSetuid" href="#ModeSetuid">const ModeSetuid</a>

```
searchKey: fs.ModeSetuid
tags: [exported]
```

```Go
const ModeSetuid // u: setuid

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSetgid" href="#ModeSetgid">const ModeSetgid</a>

```
searchKey: fs.ModeSetgid
tags: [exported]
```

```Go
const ModeSetgid // g: setgid

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeCharDevice" href="#ModeCharDevice">const ModeCharDevice</a>

```
searchKey: fs.ModeCharDevice
tags: [exported]
```

```Go
const ModeCharDevice // c: Unix character device, when ModeDevice is set

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeSticky" href="#ModeSticky">const ModeSticky</a>

```
searchKey: fs.ModeSticky
tags: [exported]
```

```Go
const ModeSticky // t: sticky

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeIrregular" href="#ModeIrregular">const ModeIrregular</a>

```
searchKey: fs.ModeIrregular
tags: [exported]
```

```Go
const ModeIrregular // ?: non-regular file; nothing else is known about this file

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

### <a id="ModeType" href="#ModeType">const ModeType</a>

```
searchKey: fs.ModeType
tags: [exported]
```

```Go
const ModeType = ...
```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

Mask for the type bits. For regular files, none will be set. 

### <a id="ModePerm" href="#ModePerm">const ModePerm</a>

```
searchKey: fs.ModePerm
tags: [exported]
```

```Go
const ModePerm FileMode = 0777 // Unix permission bits

```

The defined file mode bits are the most significant bits of the FileMode. The nine least-significant bits are the standard Unix rwxrwxrwx permissions. The values of these bits should be considered part of the public API and may be used in wire protocols or disk representations: they must not be changed, although new bits might be added. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="ErrInvalid" href="#ErrInvalid">var ErrInvalid</a>

```
searchKey: fs.ErrInvalid
tags: [exported]
```

```Go
var ErrInvalid = errInvalid() // "invalid argument"

```

Generic file system errors. Errors returned by file systems can be tested against these errors using errors.Is. 

### <a id="ErrPermission" href="#ErrPermission">var ErrPermission</a>

```
searchKey: fs.ErrPermission
tags: [exported]
```

```Go
var ErrPermission = errPermission() // "permission denied"

```

Generic file system errors. Errors returned by file systems can be tested against these errors using errors.Is. 

### <a id="ErrExist" href="#ErrExist">var ErrExist</a>

```
searchKey: fs.ErrExist
tags: [exported]
```

```Go
var ErrExist = errExist() // "file already exists"

```

Generic file system errors. Errors returned by file systems can be tested against these errors using errors.Is. 

### <a id="ErrNotExist" href="#ErrNotExist">var ErrNotExist</a>

```
searchKey: fs.ErrNotExist
tags: [exported]
```

```Go
var ErrNotExist = errNotExist() // "file does not exist"

```

Generic file system errors. Errors returned by file systems can be tested against these errors using errors.Is. 

### <a id="ErrClosed" href="#ErrClosed">var ErrClosed</a>

```
searchKey: fs.ErrClosed
tags: [exported]
```

```Go
var ErrClosed = errClosed() // "file already closed"

```

Generic file system errors. Errors returned by file systems can be tested against these errors using errors.Is. 

### <a id="SkipDir" href="#SkipDir">var SkipDir</a>

```
searchKey: fs.SkipDir
tags: [exported]
```

```Go
var SkipDir = errors.New("skip this directory")
```

SkipDir is used as a return value from WalkDirFuncs to indicate that the directory named in the call is to be skipped. It is not returned as an error by any function. 

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="FS" href="#FS">type FS interface</a>

```
searchKey: fs.FS
tags: [exported]
```

```Go
type FS interface {
	// Open opens the named file.
	//
	// When Open returns an error, it should be of type *PathError
	// with the Op field set to "open", the Path field set to name,
	// and the Err field describing the problem.
	//
	// Open should reject attempts to open names that do not satisfy
	// ValidPath(name), returning a *PathError with Err set to
	// ErrInvalid or ErrNotExist.
	Open(name string) (File, error)
}
```

An FS provides access to a hierarchical file system. 

The FS interface is the minimum implementation required of the file system. A file system may implement additional interfaces, such as ReadFileFS, to provide additional or optimized functionality. 

#### <a id="Sub" href="#Sub">func Sub(fsys FS, dir string) (FS, error)</a>

```
searchKey: fs.Sub
tags: [exported]
```

```Go
func Sub(fsys FS, dir string) (FS, error)
```

Sub returns an FS corresponding to the subtree rooted at fsys's dir. 

If dir is ".", Sub returns fsys unchanged. Otherwise, if fs implements SubFS, Sub returns fsys.Sub(dir). Otherwise, Sub returns a new FS implementation sub that, in effect, implements sub.Open(name) as fsys.Open(path.Join(dir, name)). The implementation also translates calls to ReadDir, ReadFile, and Glob appropriately. 

Note that Sub(os.DirFS("/"), "prefix") is equivalent to os.DirFS("/prefix") and that neither of them guarantees to avoid operating system accesses outside "/prefix", because the implementation of os.DirFS does not check for symbolic links inside "/prefix" that point to other directories. That is, os.DirFS is not a general substitute for a chroot-style security mechanism, and Sub does not change that fact. 

### <a id="File" href="#File">type File interface</a>

```
searchKey: fs.File
tags: [exported]
```

```Go
type File interface {
	Stat() (FileInfo, error)
	Read([]byte) (int, error)
	Close() error
}
```

A File provides access to a single file. The File interface is the minimum implementation required of the file. Directory files should also implement ReadDirFile. A file may implement io.ReaderAt or io.Seeker as optimizations. 

### <a id="DirEntry" href="#DirEntry">type DirEntry interface</a>

```
searchKey: fs.DirEntry
tags: [exported]
```

```Go
type DirEntry interface {
	// Name returns the name of the file (or subdirectory) described by the entry.
	// This name is only the final element of the path (the base name), not the entire path.
	// For example, Name would return "hello.go" not "/home/gopher/hello.go".
	Name() string

	// IsDir reports whether the entry describes a directory.
	IsDir() bool

	// Type returns the type bits for the entry.
	// The type bits are a subset of the usual FileMode bits, those returned by the FileMode.Type method.
	Type() FileMode

	// Info returns the FileInfo for the file or subdirectory described by the entry.
	// The returned FileInfo may be from the time of the original directory read
	// or from the time of the call to Info. If the file has been removed or renamed
	// since the directory read, Info may return an error satisfying errors.Is(err, ErrNotExist).
	// If the entry denotes a symbolic link, Info reports the information about the link itself,
	// not the link's target.
	Info() (FileInfo, error)
}
```

A DirEntry is an entry read from a directory (using the ReadDir function or a ReadDirFile's ReadDir method). 

#### <a id="FileInfoToDirEntry" href="#FileInfoToDirEntry">func FileInfoToDirEntry(info FileInfo) DirEntry</a>

```
searchKey: fs.FileInfoToDirEntry
tags: [exported]
```

```Go
func FileInfoToDirEntry(info FileInfo) DirEntry
```

FileInfoToDirEntry returns a DirEntry that returns information from info. If info is nil, FileInfoToDirEntry returns nil. 

### <a id="ReadDirFile" href="#ReadDirFile">type ReadDirFile interface</a>

```
searchKey: fs.ReadDirFile
tags: [exported]
```

```Go
type ReadDirFile interface {
	File

	// ReadDir reads the contents of the directory and returns
	// a slice of up to n DirEntry values in directory order.
	// Subsequent calls on the same file will yield further DirEntry values.
	//
	// If n > 0, ReadDir returns at most n DirEntry structures.
	// In this case, if ReadDir returns an empty slice, it will return
	// a non-nil error explaining why.
	// At the end of a directory, the error is io.EOF.
	//
	// If n <= 0, ReadDir returns all the DirEntry values from the directory
	// in a single slice. In this case, if ReadDir succeeds (reads all the way
	// to the end of the directory), it returns the slice and a nil error.
	// If it encounters an error before the end of the directory,
	// ReadDir returns the DirEntry list read until that point and a non-nil error.
	ReadDir(n int) ([]DirEntry, error)
}
```

A ReadDirFile is a directory file whose entries can be read with the ReadDir method. Every directory file should implement this interface. (It is permissible for any file to implement this interface, but if so ReadDir should return an error for non-directories.) 

### <a id="FileInfo" href="#FileInfo">type FileInfo interface</a>

```
searchKey: fs.FileInfo
tags: [exported]
```

```Go
type FileInfo interface {
	Name() string       // base name of the file
	Size() int64        // length in bytes for regular files; system-dependent for others
	Mode() FileMode     // file mode bits
	ModTime() time.Time // modification time
	IsDir() bool        // abbreviation for Mode().IsDir()
	Sys() interface{}   // underlying data source (can return nil)
}
```

A FileInfo describes a file and is returned by Stat. 

#### <a id="Stat" href="#Stat">func Stat(fsys FS, name string) (FileInfo, error)</a>

```
searchKey: fs.Stat
tags: [exported]
```

```Go
func Stat(fsys FS, name string) (FileInfo, error)
```

Stat returns a FileInfo describing the named file from the file system. 

If fs implements StatFS, Stat calls fs.Stat. Otherwise, Stat opens the file to stat it. 

### <a id="FileMode" href="#FileMode">type FileMode uint32</a>

```
searchKey: fs.FileMode
tags: [exported]
```

```Go
type FileMode uint32
```

A FileMode represents a file's mode and permission bits. The bits have the same definition on all systems, so that information about files can be moved from one system to another portably. Not all bits apply to all systems. The only required bit is ModeDir for directories. 

#### <a id="FileMode.String" href="#FileMode.String">func (m FileMode) String() string</a>

```
searchKey: fs.FileMode.String
tags: [exported]
```

```Go
func (m FileMode) String() string
```

#### <a id="FileMode.IsDir" href="#FileMode.IsDir">func (m FileMode) IsDir() bool</a>

```
searchKey: fs.FileMode.IsDir
tags: [exported]
```

```Go
func (m FileMode) IsDir() bool
```

IsDir reports whether m describes a directory. That is, it tests for the ModeDir bit being set in m. 

#### <a id="FileMode.IsRegular" href="#FileMode.IsRegular">func (m FileMode) IsRegular() bool</a>

```
searchKey: fs.FileMode.IsRegular
tags: [exported]
```

```Go
func (m FileMode) IsRegular() bool
```

IsRegular reports whether m describes a regular file. That is, it tests that no mode type bits are set. 

#### <a id="FileMode.Perm" href="#FileMode.Perm">func (m FileMode) Perm() FileMode</a>

```
searchKey: fs.FileMode.Perm
tags: [exported]
```

```Go
func (m FileMode) Perm() FileMode
```

Perm returns the Unix permission bits in m (m & ModePerm). 

#### <a id="FileMode.Type" href="#FileMode.Type">func (m FileMode) Type() FileMode</a>

```
searchKey: fs.FileMode.Type
tags: [exported]
```

```Go
func (m FileMode) Type() FileMode
```

Type returns type bits in m (m & ModeType). 

### <a id="PathError" href="#PathError">type PathError struct</a>

```
searchKey: fs.PathError
tags: [exported]
```

```Go
type PathError struct {
	Op   string
	Path string
	Err  error
}
```

PathError records an error and the operation and file path that caused it. 

#### <a id="PathError.Error" href="#PathError.Error">func (e *PathError) Error() string</a>

```
searchKey: fs.PathError.Error
tags: [exported]
```

```Go
func (e *PathError) Error() string
```

#### <a id="PathError.Unwrap" href="#PathError.Unwrap">func (e *PathError) Unwrap() error</a>

```
searchKey: fs.PathError.Unwrap
tags: [exported]
```

```Go
func (e *PathError) Unwrap() error
```

#### <a id="PathError.Timeout" href="#PathError.Timeout">func (e *PathError) Timeout() bool</a>

```
searchKey: fs.PathError.Timeout
tags: [exported]
```

```Go
func (e *PathError) Timeout() bool
```

Timeout reports whether this error represents a timeout. 

### <a id="GlobFS" href="#GlobFS">type GlobFS interface</a>

```
searchKey: fs.GlobFS
tags: [exported]
```

```Go
type GlobFS interface {
	FS

	// Glob returns the names of all files matching pattern,
	// providing an implementation of the top-level
	// Glob function.
	Glob(pattern string) ([]string, error)
}
```

A GlobFS is a file system with a Glob method. 

### <a id="ReadDirFS" href="#ReadDirFS">type ReadDirFS interface</a>

```
searchKey: fs.ReadDirFS
tags: [exported]
```

```Go
type ReadDirFS interface {
	FS

	// ReadDir reads the named directory
	// and returns a list of directory entries sorted by filename.
	ReadDir(name string) ([]DirEntry, error)
}
```

ReadDirFS is the interface implemented by a file system that provides an optimized implementation of ReadDir. 

### <a id="dirInfo" href="#dirInfo">type dirInfo struct</a>

```
searchKey: fs.dirInfo
```

```Go
type dirInfo struct {
	fileInfo FileInfo
}
```

dirInfo is a DirEntry based on a FileInfo. 

#### <a id="dirInfo.IsDir" href="#dirInfo.IsDir">func (di dirInfo) IsDir() bool</a>

```
searchKey: fs.dirInfo.IsDir
```

```Go
func (di dirInfo) IsDir() bool
```

#### <a id="dirInfo.Type" href="#dirInfo.Type">func (di dirInfo) Type() FileMode</a>

```
searchKey: fs.dirInfo.Type
```

```Go
func (di dirInfo) Type() FileMode
```

#### <a id="dirInfo.Info" href="#dirInfo.Info">func (di dirInfo) Info() (FileInfo, error)</a>

```
searchKey: fs.dirInfo.Info
```

```Go
func (di dirInfo) Info() (FileInfo, error)
```

#### <a id="dirInfo.Name" href="#dirInfo.Name">func (di dirInfo) Name() string</a>

```
searchKey: fs.dirInfo.Name
```

```Go
func (di dirInfo) Name() string
```

### <a id="ReadFileFS" href="#ReadFileFS">type ReadFileFS interface</a>

```
searchKey: fs.ReadFileFS
tags: [exported]
```

```Go
type ReadFileFS interface {
	FS

	// ReadFile reads the named file and returns its contents.
	// A successful call returns a nil error, not io.EOF.
	// (Because ReadFile reads the whole file, the expected EOF
	// from the final Read is not treated as an error to be reported.)
	//
	// The caller is permitted to modify the returned byte slice.
	// This method should return a copy of the underlying data.
	ReadFile(name string) ([]byte, error)
}
```

ReadFileFS is the interface implemented by a file system that provides an optimized implementation of ReadFile. 

### <a id="StatFS" href="#StatFS">type StatFS interface</a>

```
searchKey: fs.StatFS
tags: [exported]
```

```Go
type StatFS interface {
	FS

	// Stat returns a FileInfo describing the file.
	// If there is an error, it should be of type *PathError.
	Stat(name string) (FileInfo, error)
}
```

A StatFS is a file system with a Stat method. 

### <a id="SubFS" href="#SubFS">type SubFS interface</a>

```
searchKey: fs.SubFS
tags: [exported]
```

```Go
type SubFS interface {
	FS

	// Sub returns an FS corresponding to the subtree rooted at dir.
	Sub(dir string) (FS, error)
}
```

A SubFS is a file system with a Sub method. 

### <a id="subFS" href="#subFS">type subFS struct</a>

```
searchKey: fs.subFS
```

```Go
type subFS struct {
	fsys FS
	dir  string
}
```

#### <a id="subFS.fullName" href="#subFS.fullName">func (f *subFS) fullName(op string, name string) (string, error)</a>

```
searchKey: fs.subFS.fullName
```

```Go
func (f *subFS) fullName(op string, name string) (string, error)
```

fullName maps name to the fully-qualified name dir/name. 

#### <a id="subFS.shorten" href="#subFS.shorten">func (f *subFS) shorten(name string) (rel string, ok bool)</a>

```
searchKey: fs.subFS.shorten
```

```Go
func (f *subFS) shorten(name string) (rel string, ok bool)
```

shorten maps name, which should start with f.dir, back to the suffix after f.dir. 

#### <a id="subFS.fixErr" href="#subFS.fixErr">func (f *subFS) fixErr(err error) error</a>

```
searchKey: fs.subFS.fixErr
```

```Go
func (f *subFS) fixErr(err error) error
```

fixErr shortens any reported names in PathErrors by stripping f.dir. 

#### <a id="subFS.Open" href="#subFS.Open">func (f *subFS) Open(name string) (File, error)</a>

```
searchKey: fs.subFS.Open
```

```Go
func (f *subFS) Open(name string) (File, error)
```

#### <a id="subFS.ReadDir" href="#subFS.ReadDir">func (f *subFS) ReadDir(name string) ([]DirEntry, error)</a>

```
searchKey: fs.subFS.ReadDir
```

```Go
func (f *subFS) ReadDir(name string) ([]DirEntry, error)
```

#### <a id="subFS.ReadFile" href="#subFS.ReadFile">func (f *subFS) ReadFile(name string) ([]byte, error)</a>

```
searchKey: fs.subFS.ReadFile
```

```Go
func (f *subFS) ReadFile(name string) ([]byte, error)
```

#### <a id="subFS.Glob" href="#subFS.Glob">func (f *subFS) Glob(pattern string) ([]string, error)</a>

```
searchKey: fs.subFS.Glob
```

```Go
func (f *subFS) Glob(pattern string) ([]string, error)
```

#### <a id="subFS.Sub" href="#subFS.Sub">func (f *subFS) Sub(dir string) (FS, error)</a>

```
searchKey: fs.subFS.Sub
```

```Go
func (f *subFS) Sub(dir string) (FS, error)
```

### <a id="WalkDirFunc" href="#WalkDirFunc">type WalkDirFunc func(path string, d std/io/fs.DirEntry, err error) error</a>

```
searchKey: fs.WalkDirFunc
tags: [exported]
```

```Go
type WalkDirFunc func(path string, d DirEntry, err error) error
```

WalkDirFunc is the type of the function called by WalkDir to visit each file or directory. 

The path argument contains the argument to WalkDir as a prefix. That is, if WalkDir is called with root argument "dir" and finds a file named "a" in that directory, the walk function will be called with argument "dir/a". 

The d argument is the fs.DirEntry for the named path. 

The error result returned by the function controls how WalkDir continues. If the function returns the special value SkipDir, WalkDir skips the current directory (path if d.IsDir() is true, otherwise path's parent directory). Otherwise, if the function returns a non-nil error, WalkDir stops entirely and returns that error. 

The err argument reports an error related to path, signaling that WalkDir will not walk into that directory. The function can decide how to handle that error; as described earlier, returning the error will cause WalkDir to stop walking the entire tree. 

WalkDir calls the function with a non-nil err argument in two cases. 

First, if the initial fs.Stat on the root directory fails, WalkDir calls the function with path set to root, d set to nil, and err set to the error from fs.Stat. 

Second, if a directory's ReadDir method fails, WalkDir calls the function with path set to the directory's path, d set to an fs.DirEntry describing the directory, and err set to the error from ReadDir. In this second case, the function is called twice with the path of the directory: the first call is before the directory read is attempted and has err set to nil, giving the function a chance to return SkipDir and avoid the ReadDir entirely. The second call is after a failed ReadDir and reports the error from ReadDir. (If ReadDir succeeds, there is no second call.) 

The differences between WalkDirFunc compared to filepath.WalkFunc are: 

```
- The second argument has type fs.DirEntry instead of fs.FileInfo.
- The function is called before reading a directory, to allow SkipDir
  to bypass the directory read entirely.
- If a directory read fails, the function is called a second time
  for that directory to report the error.

```
### <a id="statDirEntry" href="#statDirEntry">type statDirEntry struct</a>

```
searchKey: fs.statDirEntry
```

```Go
type statDirEntry struct {
	info FileInfo
}
```

#### <a id="statDirEntry.Name" href="#statDirEntry.Name">func (d *statDirEntry) Name() string</a>

```
searchKey: fs.statDirEntry.Name
```

```Go
func (d *statDirEntry) Name() string
```

#### <a id="statDirEntry.IsDir" href="#statDirEntry.IsDir">func (d *statDirEntry) IsDir() bool</a>

```
searchKey: fs.statDirEntry.IsDir
```

```Go
func (d *statDirEntry) IsDir() bool
```

#### <a id="statDirEntry.Type" href="#statDirEntry.Type">func (d *statDirEntry) Type() FileMode</a>

```
searchKey: fs.statDirEntry.Type
```

```Go
func (d *statDirEntry) Type() FileMode
```

#### <a id="statDirEntry.Info" href="#statDirEntry.Info">func (d *statDirEntry) Info() (FileInfo, error)</a>

```
searchKey: fs.statDirEntry.Info
```

```Go
func (d *statDirEntry) Info() (FileInfo, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="ValidPath" href="#ValidPath">func ValidPath(name string) bool</a>

```
searchKey: fs.ValidPath
tags: [exported]
```

```Go
func ValidPath(name string) bool
```

ValidPath reports whether the given path name is valid for use in a call to Open. 

Path names passed to open are UTF-8-encoded, unrooted, slash-separated sequences of path elements, like “x/y/z”. Path names must not contain an element that is “.” or “..” or the empty string, except for the special case that the root directory is named “.”. Paths must not start or end with a slash: “/x” and “x/” are invalid. 

Note that paths are slash-separated on all systems, even Windows. Paths containing other characters such as backslash and colon are accepted as valid, but those characters must never be interpreted by an FS implementation as path element separators. 

### <a id="errInvalid" href="#errInvalid">func errInvalid() error</a>

```
searchKey: fs.errInvalid
```

```Go
func errInvalid() error
```

### <a id="errPermission" href="#errPermission">func errPermission() error</a>

```
searchKey: fs.errPermission
```

```Go
func errPermission() error
```

### <a id="errExist" href="#errExist">func errExist() error</a>

```
searchKey: fs.errExist
```

```Go
func errExist() error
```

### <a id="errNotExist" href="#errNotExist">func errNotExist() error</a>

```
searchKey: fs.errNotExist
```

```Go
func errNotExist() error
```

### <a id="errClosed" href="#errClosed">func errClosed() error</a>

```
searchKey: fs.errClosed
```

```Go
func errClosed() error
```

### <a id="Glob" href="#Glob">func Glob(fsys FS, pattern string) (matches []string, err error)</a>

```
searchKey: fs.Glob
tags: [exported]
```

```Go
func Glob(fsys FS, pattern string) (matches []string, err error)
```

Glob returns the names of all files matching pattern or nil if there is no matching file. The syntax of patterns is the same as in path.Match. The pattern may describe hierarchical names such as usr/*/bin/ed. 

Glob ignores file system errors such as I/O errors reading directories. The only possible returned error is path.ErrBadPattern, reporting that the pattern is malformed. 

If fs implements GlobFS, Glob calls fs.Glob. Otherwise, Glob uses ReadDir to traverse the directory tree and look for matches for the pattern. 

### <a id="cleanGlobPath" href="#cleanGlobPath">func cleanGlobPath(path string) string</a>

```
searchKey: fs.cleanGlobPath
```

```Go
func cleanGlobPath(path string) string
```

cleanGlobPath prepares path for glob matching. 

### <a id="glob" href="#glob">func glob(fs FS, dir, pattern string, matches []string) (m []string, e error)</a>

```
searchKey: fs.glob
```

```Go
func glob(fs FS, dir, pattern string, matches []string) (m []string, e error)
```

glob searches for files matching pattern in the directory dir and appends them to matches, returning the updated slice. If the directory cannot be opened, glob returns the existing matches. New matches are added in lexicographical order. 

### <a id="hasMeta" href="#hasMeta">func hasMeta(path string) bool</a>

```
searchKey: fs.hasMeta
```

```Go
func hasMeta(path string) bool
```

hasMeta reports whether path contains any of the magic characters recognized by path.Match. 

### <a id="ReadDir" href="#ReadDir">func ReadDir(fsys FS, name string) ([]DirEntry, error)</a>

```
searchKey: fs.ReadDir
tags: [exported]
```

```Go
func ReadDir(fsys FS, name string) ([]DirEntry, error)
```

ReadDir reads the named directory and returns a list of directory entries sorted by filename. 

If fs implements ReadDirFS, ReadDir calls fs.ReadDir. Otherwise ReadDir calls fs.Open and uses ReadDir and Close on the returned file. 

### <a id="ReadFile" href="#ReadFile">func ReadFile(fsys FS, name string) ([]byte, error)</a>

```
searchKey: fs.ReadFile
tags: [exported]
```

```Go
func ReadFile(fsys FS, name string) ([]byte, error)
```

ReadFile reads the named file from the file system fs and returns its contents. A successful call returns a nil error, not io.EOF. (Because ReadFile reads the whole file, the expected EOF from the final Read is not treated as an error to be reported.) 

If fs implements ReadFileFS, ReadFile calls fs.ReadFile. Otherwise ReadFile calls fs.Open and uses Read and Close on the returned file. 

### <a id="walkDir" href="#walkDir">func walkDir(fsys FS, name string, d DirEntry, walkDirFn WalkDirFunc) error</a>

```
searchKey: fs.walkDir
```

```Go
func walkDir(fsys FS, name string, d DirEntry, walkDirFn WalkDirFunc) error
```

walkDir recursively descends path, calling walkDirFn. 

### <a id="WalkDir" href="#WalkDir">func WalkDir(fsys FS, root string, fn WalkDirFunc) error</a>

```
searchKey: fs.WalkDir
tags: [exported]
```

```Go
func WalkDir(fsys FS, root string, fn WalkDirFunc) error
```

WalkDir walks the file tree rooted at root, calling fn for each file or directory in the tree, including root. 

All errors that arise visiting files and directories are filtered by fn: see the fs.WalkDirFunc documentation for details. 

The files are walked in lexical order, which makes the output deterministic but requires WalkDir to read an entire directory into memory before proceeding to walk that directory. 

WalkDir does not follow symbolic links found in directories, but if root itself is a symbolic link, its target will be walked. 

