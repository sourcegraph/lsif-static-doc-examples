# Package filepath

Package filepath implements utility routines for manipulating filename paths in a way compatible with the target operating system-defined file paths. 

The filepath package uses either forward slashes or backslashes, depending on the operating system. To process paths such as URLs that always use forward slashes regardless of the operating system, see the path package. 

## Index

* [Constants](#const)
    * [const Separator](#Separator)
    * [const ListSeparator](#ListSeparator)
* [Variables](#var)
    * [var ErrBadPattern](#ErrBadPattern)
    * [var SkipDir](#SkipDir)
    * [var lstat](#lstat)
    * [var LstatP](#LstatP)
* [Types](#type)
    * [type lazybuf struct](#lazybuf)
        * [func (b *lazybuf) index(i int) byte](#lazybuf.index)
        * [func (b *lazybuf) append(c byte)](#lazybuf.append)
        * [func (b *lazybuf) string() string](#lazybuf.string)
    * [type WalkFunc func(path string, info io/fs.FileInfo, err error) error](#WalkFunc)
    * [type statDirEntry struct](#statDirEntry)
        * [func (d *statDirEntry) Name() string](#statDirEntry.Name)
        * [func (d *statDirEntry) IsDir() bool](#statDirEntry.IsDir)
        * [func (d *statDirEntry) Type() fs.FileMode](#statDirEntry.Type)
        * [func (d *statDirEntry) Info() (fs.FileInfo, error)](#statDirEntry.Info)
* [Functions](#func)
    * [func Match(pattern, name string) (matched bool, err error)](#Match)
    * [func scanChunk(pattern string) (star bool, chunk, rest string)](#scanChunk)
    * [func matchChunk(chunk, s string) (rest string, ok bool, err error)](#matchChunk)
    * [func getEsc(chunk string) (r rune, nchunk string, err error)](#getEsc)
    * [func Glob(pattern string) (matches []string, err error)](#Glob)
    * [func cleanGlobPath(path string) string](#cleanGlobPath)
    * [func cleanGlobPathWindows(path string) (prefixLen int, cleaned string)](#cleanGlobPathWindows)
    * [func glob(dir, pattern string, matches []string) (m []string, e error)](#glob)
    * [func hasMeta(path string) bool](#hasMeta)
    * [func Clean(path string) string](#Clean)
    * [func ToSlash(path string) string](#ToSlash)
    * [func FromSlash(path string) string](#FromSlash)
    * [func SplitList(path string) []string](#SplitList)
    * [func Split(path string) (dir, file string)](#Split)
    * [func Join(elem ...string) string](#Join)
    * [func Ext(path string) string](#Ext)
    * [func EvalSymlinks(path string) (string, error)](#EvalSymlinks)
    * [func Abs(path string) (string, error)](#Abs)
    * [func unixAbs(path string) (string, error)](#unixAbs)
    * [func Rel(basepath, targpath string) (string, error)](#Rel)
    * [func walkDir(path string, d fs.DirEntry, walkDirFn fs.WalkDirFunc) error](#walkDir)
    * [func walk(path string, info fs.FileInfo, walkFn WalkFunc) error](#walk)
    * [func WalkDir(root string, fn fs.WalkDirFunc) error](#WalkDir)
    * [func Walk(root string, fn WalkFunc) error](#Walk)
    * [func readDir(dirname string) ([]fs.DirEntry, error)](#readDir)
    * [func readDirNames(dirname string) ([]string, error)](#readDirNames)
    * [func Base(path string) string](#Base)
    * [func Dir(path string) string](#Dir)
    * [func VolumeName(path string) string](#VolumeName)
    * [func IsAbs(path string) bool](#IsAbs)
    * [func volumeNameLen(path string) int](#volumeNameLen)
    * [func HasPrefix(p, prefix string) bool](#HasPrefix)
    * [func splitList(path string) []string](#splitList)
    * [func abs(path string) (string, error)](#abs)
    * [func join(elem []string) string](#join)
    * [func sameWord(a, b string) bool](#sameWord)
    * [func walkSymlinks(path string) (string, error)](#walkSymlinks)
    * [func evalSymlinks(path string) (string, error)](#evalSymlinks)


## <a id="const" href="#const">Constants</a>

### <a id="Separator" href="#Separator">const Separator</a>

```
searchKey: filepath.Separator
```

```Go
const Separator = os.PathSeparator
```

### <a id="ListSeparator" href="#ListSeparator">const ListSeparator</a>

```
searchKey: filepath.ListSeparator
```

```Go
const ListSeparator = os.PathListSeparator
```

## <a id="var" href="#var">Variables</a>

### <a id="ErrBadPattern" href="#ErrBadPattern">var ErrBadPattern</a>

```
searchKey: filepath.ErrBadPattern
```

```Go
var ErrBadPattern = errors.New("syntax error in pattern")
```

ErrBadPattern indicates a pattern was malformed. 

### <a id="SkipDir" href="#SkipDir">var SkipDir</a>

```
searchKey: filepath.SkipDir
```

```Go
var SkipDir error = fs.SkipDir
```

SkipDir is used as a return value from WalkFuncs to indicate that the directory named in the call is to be skipped. It is not returned as an error by any function. 

### <a id="lstat" href="#lstat">var lstat</a>

```
searchKey: filepath.lstat
tags: [private]
```

```Go
var lstat = os.Lstat // for testing

```

### <a id="LstatP" href="#LstatP">var LstatP</a>

```
searchKey: filepath.LstatP
tags: [private]
```

```Go
var LstatP = &lstat
```

## <a id="type" href="#type">Types</a>

### <a id="lazybuf" href="#lazybuf">type lazybuf struct</a>

```
searchKey: filepath.lazybuf
tags: [private]
```

```Go
type lazybuf struct {
	path       string
	buf        []byte
	w          int
	volAndPath string
	volLen     int
}
```

A lazybuf is a lazily constructed path buffer. It supports append, reading previously appended bytes, and retrieving the final string. It does not allocate a buffer to hold the output until that output diverges from s. 

#### <a id="lazybuf.index" href="#lazybuf.index">func (b *lazybuf) index(i int) byte</a>

```
searchKey: filepath.lazybuf.index
tags: [private]
```

```Go
func (b *lazybuf) index(i int) byte
```

#### <a id="lazybuf.append" href="#lazybuf.append">func (b *lazybuf) append(c byte)</a>

```
searchKey: filepath.lazybuf.append
tags: [private]
```

```Go
func (b *lazybuf) append(c byte)
```

#### <a id="lazybuf.string" href="#lazybuf.string">func (b *lazybuf) string() string</a>

```
searchKey: filepath.lazybuf.string
tags: [private]
```

```Go
func (b *lazybuf) string() string
```

### <a id="WalkFunc" href="#WalkFunc">type WalkFunc func(path string, info io/fs.FileInfo, err error) error</a>

```
searchKey: filepath.WalkFunc
```

```Go
type WalkFunc func(path string, info fs.FileInfo, err error) error
```

WalkFunc is the type of the function called by Walk to visit each file or directory. 

The path argument contains the argument to Walk as a prefix. That is, if Walk is called with root argument "dir" and finds a file named "a" in that directory, the walk function will be called with argument "dir/a". 

The directory and file are joined with Join, which may clean the directory name: if Walk is called with the root argument "x/../dir" and finds a file named "a" in that directory, the walk function will be called with argument "dir/a", not "x/../dir/a". 

The info argument is the fs.FileInfo for the named path. 

The error result returned by the function controls how Walk continues. If the function returns the special value SkipDir, Walk skips the current directory (path if info.IsDir() is true, otherwise path's parent directory). Otherwise, if the function returns a non-nil error, Walk stops entirely and returns that error. 

The err argument reports an error related to path, signaling that Walk will not walk into that directory. The function can decide how to handle that error; as described earlier, returning the error will cause Walk to stop walking the entire tree. 

Walk calls the function with a non-nil err argument in two cases. 

First, if an os.Lstat on the root directory or any directory or file in the tree fails, Walk calls the function with path set to that directory or file's path, info set to nil, and err set to the error from os.Lstat. 

Second, if a directory's Readdirnames method fails, Walk calls the function with path set to the directory's path, info, set to an fs.FileInfo describing the directory, and err set to the error from Readdirnames. 

### <a id="statDirEntry" href="#statDirEntry">type statDirEntry struct</a>

```
searchKey: filepath.statDirEntry
tags: [private]
```

```Go
type statDirEntry struct {
	info fs.FileInfo
}
```

#### <a id="statDirEntry.Name" href="#statDirEntry.Name">func (d *statDirEntry) Name() string</a>

```
searchKey: filepath.statDirEntry.Name
tags: [private]
```

```Go
func (d *statDirEntry) Name() string
```

#### <a id="statDirEntry.IsDir" href="#statDirEntry.IsDir">func (d *statDirEntry) IsDir() bool</a>

```
searchKey: filepath.statDirEntry.IsDir
tags: [private]
```

```Go
func (d *statDirEntry) IsDir() bool
```

#### <a id="statDirEntry.Type" href="#statDirEntry.Type">func (d *statDirEntry) Type() fs.FileMode</a>

```
searchKey: filepath.statDirEntry.Type
tags: [private]
```

```Go
func (d *statDirEntry) Type() fs.FileMode
```

#### <a id="statDirEntry.Info" href="#statDirEntry.Info">func (d *statDirEntry) Info() (fs.FileInfo, error)</a>

```
searchKey: filepath.statDirEntry.Info
tags: [private]
```

```Go
func (d *statDirEntry) Info() (fs.FileInfo, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="Match" href="#Match">func Match(pattern, name string) (matched bool, err error)</a>

```
searchKey: filepath.Match
```

```Go
func Match(pattern, name string) (matched bool, err error)
```

Match reports whether name matches the shell file name pattern. The pattern syntax is: 

```
pattern:
	{ term }
term:
	'*'         matches any sequence of non-Separator characters
	'?'         matches any single non-Separator character
	'[' [ '^' ] { character-range } ']'
	            character class (must be non-empty)
	c           matches character c (c != '*', '?', '\\', '[')
	'\\' c      matches character c

character-range:
	c           matches character c (c != '\\', '-', ']')
	'\\' c      matches character c
	lo '-' hi   matches character c for lo <= c <= hi

```
Match requires pattern to match all of name, not just a substring. The only possible returned error is ErrBadPattern, when pattern is malformed. 

On Windows, escaping is disabled. Instead, '\\' is treated as path separator. 

### <a id="scanChunk" href="#scanChunk">func scanChunk(pattern string) (star bool, chunk, rest string)</a>

```
searchKey: filepath.scanChunk
tags: [private]
```

```Go
func scanChunk(pattern string) (star bool, chunk, rest string)
```

scanChunk gets the next segment of pattern, which is a non-star string possibly preceded by a star. 

### <a id="matchChunk" href="#matchChunk">func matchChunk(chunk, s string) (rest string, ok bool, err error)</a>

```
searchKey: filepath.matchChunk
tags: [private]
```

```Go
func matchChunk(chunk, s string) (rest string, ok bool, err error)
```

matchChunk checks whether chunk matches the beginning of s. If so, it returns the remainder of s (after the match). Chunk is all single-character operators: literals, char classes, and ?. 

### <a id="getEsc" href="#getEsc">func getEsc(chunk string) (r rune, nchunk string, err error)</a>

```
searchKey: filepath.getEsc
tags: [private]
```

```Go
func getEsc(chunk string) (r rune, nchunk string, err error)
```

getEsc gets a possibly-escaped character from chunk, for a character class. 

### <a id="Glob" href="#Glob">func Glob(pattern string) (matches []string, err error)</a>

```
searchKey: filepath.Glob
```

```Go
func Glob(pattern string) (matches []string, err error)
```

Glob returns the names of all files matching pattern or nil if there is no matching file. The syntax of patterns is the same as in Match. The pattern may describe hierarchical names such as /usr/*/bin/ed (assuming the Separator is '/'). 

Glob ignores file system errors such as I/O errors reading directories. The only possible returned error is ErrBadPattern, when pattern is malformed. 

### <a id="cleanGlobPath" href="#cleanGlobPath">func cleanGlobPath(path string) string</a>

```
searchKey: filepath.cleanGlobPath
tags: [private]
```

```Go
func cleanGlobPath(path string) string
```

cleanGlobPath prepares path for glob matching. 

### <a id="cleanGlobPathWindows" href="#cleanGlobPathWindows">func cleanGlobPathWindows(path string) (prefixLen int, cleaned string)</a>

```
searchKey: filepath.cleanGlobPathWindows
tags: [private]
```

```Go
func cleanGlobPathWindows(path string) (prefixLen int, cleaned string)
```

cleanGlobPathWindows is windows version of cleanGlobPath. 

### <a id="glob" href="#glob">func glob(dir, pattern string, matches []string) (m []string, e error)</a>

```
searchKey: filepath.glob
tags: [private]
```

```Go
func glob(dir, pattern string, matches []string) (m []string, e error)
```

glob searches for files matching pattern in the directory dir and appends them to matches. If the directory cannot be opened, it returns the existing matches. New matches are added in lexicographical order. 

### <a id="hasMeta" href="#hasMeta">func hasMeta(path string) bool</a>

```
searchKey: filepath.hasMeta
tags: [private]
```

```Go
func hasMeta(path string) bool
```

hasMeta reports whether path contains any of the magic characters recognized by Match. 

### <a id="Clean" href="#Clean">func Clean(path string) string</a>

```
searchKey: filepath.Clean
```

```Go
func Clean(path string) string
```

Clean returns the shortest path name equivalent to path by purely lexical processing. It applies the following rules iteratively until no further processing can be done: 

```
1. Replace multiple Separator elements with a single one.
2. Eliminate each . path name element (the current directory).
3. Eliminate each inner .. path name element (the parent directory)
   along with the non-.. element that precedes it.
4. Eliminate .. elements that begin a rooted path:
   that is, replace "/.." by "/" at the beginning of a path,
   assuming Separator is '/'.

```
The returned path ends in a slash only if it represents a root directory, such as "/" on Unix or `C:\` on Windows. 

Finally, any occurrences of slash are replaced by Separator. 

If the result of this process is an empty string, Clean returns the string ".". 

See also Rob Pike, `Lexical File Names in Plan 9 or Getting Dot-Dot Right,' [https://9p.io/sys/doc/lexnames.html](https://9p.io/sys/doc/lexnames.html) 

### <a id="ToSlash" href="#ToSlash">func ToSlash(path string) string</a>

```
searchKey: filepath.ToSlash
```

```Go
func ToSlash(path string) string
```

ToSlash returns the result of replacing each separator character in path with a slash ('/') character. Multiple separators are replaced by multiple slashes. 

### <a id="FromSlash" href="#FromSlash">func FromSlash(path string) string</a>

```
searchKey: filepath.FromSlash
```

```Go
func FromSlash(path string) string
```

FromSlash returns the result of replacing each slash ('/') character in path with a separator character. Multiple slashes are replaced by multiple separators. 

### <a id="SplitList" href="#SplitList">func SplitList(path string) []string</a>

```
searchKey: filepath.SplitList
```

```Go
func SplitList(path string) []string
```

SplitList splits a list of paths joined by the OS-specific ListSeparator, usually found in PATH or GOPATH environment variables. Unlike strings.Split, SplitList returns an empty slice when passed an empty string. 

### <a id="Split" href="#Split">func Split(path string) (dir, file string)</a>

```
searchKey: filepath.Split
```

```Go
func Split(path string) (dir, file string)
```

Split splits path immediately following the final Separator, separating it into a directory and file name component. If there is no Separator in path, Split returns an empty dir and file set to path. The returned values have the property that path = dir+file. 

### <a id="Join" href="#Join">func Join(elem ...string) string</a>

```
searchKey: filepath.Join
```

```Go
func Join(elem ...string) string
```

Join joins any number of path elements into a single path, separating them with an OS specific Separator. Empty elements are ignored. The result is Cleaned. However, if the argument list is empty or all its elements are empty, Join returns an empty string. On Windows, the result will only be a UNC path if the first non-empty element is a UNC path. 

### <a id="Ext" href="#Ext">func Ext(path string) string</a>

```
searchKey: filepath.Ext
```

```Go
func Ext(path string) string
```

Ext returns the file name extension used by path. The extension is the suffix beginning at the final dot in the final element of path; it is empty if there is no dot. 

### <a id="EvalSymlinks" href="#EvalSymlinks">func EvalSymlinks(path string) (string, error)</a>

```
searchKey: filepath.EvalSymlinks
```

```Go
func EvalSymlinks(path string) (string, error)
```

EvalSymlinks returns the path name after the evaluation of any symbolic links. If path is relative the result will be relative to the current directory, unless one of the components is an absolute symbolic link. EvalSymlinks calls Clean on the result. 

### <a id="Abs" href="#Abs">func Abs(path string) (string, error)</a>

```
searchKey: filepath.Abs
```

```Go
func Abs(path string) (string, error)
```

Abs returns an absolute representation of path. If the path is not absolute it will be joined with the current working directory to turn it into an absolute path. The absolute path name for a given file is not guaranteed to be unique. Abs calls Clean on the result. 

### <a id="unixAbs" href="#unixAbs">func unixAbs(path string) (string, error)</a>

```
searchKey: filepath.unixAbs
tags: [private]
```

```Go
func unixAbs(path string) (string, error)
```

### <a id="Rel" href="#Rel">func Rel(basepath, targpath string) (string, error)</a>

```
searchKey: filepath.Rel
```

```Go
func Rel(basepath, targpath string) (string, error)
```

Rel returns a relative path that is lexically equivalent to targpath when joined to basepath with an intervening separator. That is, Join(basepath, Rel(basepath, targpath)) is equivalent to targpath itself. On success, the returned path will always be relative to basepath, even if basepath and targpath share no elements. An error is returned if targpath can't be made relative to basepath or if knowing the current working directory would be necessary to compute it. Rel calls Clean on the result. 

### <a id="walkDir" href="#walkDir">func walkDir(path string, d fs.DirEntry, walkDirFn fs.WalkDirFunc) error</a>

```
searchKey: filepath.walkDir
tags: [private]
```

```Go
func walkDir(path string, d fs.DirEntry, walkDirFn fs.WalkDirFunc) error
```

walkDir recursively descends path, calling walkDirFn. 

### <a id="walk" href="#walk">func walk(path string, info fs.FileInfo, walkFn WalkFunc) error</a>

```
searchKey: filepath.walk
tags: [private]
```

```Go
func walk(path string, info fs.FileInfo, walkFn WalkFunc) error
```

walk recursively descends path, calling walkFn. 

### <a id="WalkDir" href="#WalkDir">func WalkDir(root string, fn fs.WalkDirFunc) error</a>

```
searchKey: filepath.WalkDir
```

```Go
func WalkDir(root string, fn fs.WalkDirFunc) error
```

WalkDir walks the file tree rooted at root, calling fn for each file or directory in the tree, including root. 

All errors that arise visiting files and directories are filtered by fn: see the fs.WalkDirFunc documentation for details. 

The files are walked in lexical order, which makes the output deterministic but requires WalkDir to read an entire directory into memory before proceeding to walk that directory. 

WalkDir does not follow symbolic links. 

### <a id="Walk" href="#Walk">func Walk(root string, fn WalkFunc) error</a>

```
searchKey: filepath.Walk
```

```Go
func Walk(root string, fn WalkFunc) error
```

Walk walks the file tree rooted at root, calling fn for each file or directory in the tree, including root. 

All errors that arise visiting files and directories are filtered by fn: see the WalkFunc documentation for details. 

The files are walked in lexical order, which makes the output deterministic but requires Walk to read an entire directory into memory before proceeding to walk that directory. 

Walk does not follow symbolic links. 

Walk is less efficient than WalkDir, introduced in Go 1.16, which avoids calling os.Lstat on every visited file or directory. 

### <a id="readDir" href="#readDir">func readDir(dirname string) ([]fs.DirEntry, error)</a>

```
searchKey: filepath.readDir
tags: [private]
```

```Go
func readDir(dirname string) ([]fs.DirEntry, error)
```

readDir reads the directory named by dirname and returns a sorted list of directory entries. 

### <a id="readDirNames" href="#readDirNames">func readDirNames(dirname string) ([]string, error)</a>

```
searchKey: filepath.readDirNames
tags: [private]
```

```Go
func readDirNames(dirname string) ([]string, error)
```

readDirNames reads the directory named by dirname and returns a sorted list of directory entry names. 

### <a id="Base" href="#Base">func Base(path string) string</a>

```
searchKey: filepath.Base
```

```Go
func Base(path string) string
```

Base returns the last element of path. Trailing path separators are removed before extracting the last element. If the path is empty, Base returns ".". If the path consists entirely of separators, Base returns a single separator. 

### <a id="Dir" href="#Dir">func Dir(path string) string</a>

```
searchKey: filepath.Dir
```

```Go
func Dir(path string) string
```

Dir returns all but the last element of path, typically the path's directory. After dropping the final element, Dir calls Clean on the path and trailing slashes are removed. If the path is empty, Dir returns ".". If the path consists entirely of separators, Dir returns a single separator. The returned path does not end in a separator unless it is the root directory. 

### <a id="VolumeName" href="#VolumeName">func VolumeName(path string) string</a>

```
searchKey: filepath.VolumeName
```

```Go
func VolumeName(path string) string
```

VolumeName returns leading volume name. Given "C:\foo\bar" it returns "C:" on Windows. Given "\\host\share\foo" it returns "\\host\share". On other platforms it returns "". 

### <a id="IsAbs" href="#IsAbs">func IsAbs(path string) bool</a>

```
searchKey: filepath.IsAbs
```

```Go
func IsAbs(path string) bool
```

IsAbs reports whether the path is absolute. 

### <a id="volumeNameLen" href="#volumeNameLen">func volumeNameLen(path string) int</a>

```
searchKey: filepath.volumeNameLen
tags: [private]
```

```Go
func volumeNameLen(path string) int
```

volumeNameLen returns length of the leading volume name on Windows. It returns 0 elsewhere. 

### <a id="HasPrefix" href="#HasPrefix">func HasPrefix(p, prefix string) bool</a>

```
searchKey: filepath.HasPrefix
tags: [deprecated]
```

```Go
func HasPrefix(p, prefix string) bool
```

HasPrefix exists for historical compatibility and should not be used. 

Deprecated: HasPrefix does not respect path boundaries and does not ignore case when required. 

### <a id="splitList" href="#splitList">func splitList(path string) []string</a>

```
searchKey: filepath.splitList
tags: [private]
```

```Go
func splitList(path string) []string
```

### <a id="abs" href="#abs">func abs(path string) (string, error)</a>

```
searchKey: filepath.abs
tags: [private]
```

```Go
func abs(path string) (string, error)
```

### <a id="join" href="#join">func join(elem []string) string</a>

```
searchKey: filepath.join
tags: [private]
```

```Go
func join(elem []string) string
```

### <a id="sameWord" href="#sameWord">func sameWord(a, b string) bool</a>

```
searchKey: filepath.sameWord
tags: [private]
```

```Go
func sameWord(a, b string) bool
```

### <a id="walkSymlinks" href="#walkSymlinks">func walkSymlinks(path string) (string, error)</a>

```
searchKey: filepath.walkSymlinks
tags: [private]
```

```Go
func walkSymlinks(path string) (string, error)
```

### <a id="evalSymlinks" href="#evalSymlinks">func evalSymlinks(path string) (string, error)</a>

```
searchKey: filepath.evalSymlinks
tags: [private]
```

```Go
func evalSymlinks(path string) (string, error)
```

