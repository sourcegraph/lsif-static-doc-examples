# Package embed

Package embed provides access to files embedded in the running Go program. 

Go source files that import "embed" can use the //go:embed directive to initialize a variable of type string, []byte, or FS with the contents of files read from the package directory or subdirectories at compile time. 

For example, here are three ways to embed a file named hello.txt and then print its contents at run time. 

Embedding one file into a string: 

```
import _ "embed"

//go:embed hello.txt
var s string
print(s)

```
Embedding one file into a slice of bytes: 

```
import _ "embed"

//go:embed hello.txt
var b []byte
print(string(b))

```
Embedded one or more files into a file system: 

```
import "embed"

//go:embed hello.txt
var f embed.FS
data, _ := f.ReadFile("hello.txt")
print(string(data))

```
### hdr-DirectivesDirectives
A //go:embed directive above a variable declaration specifies which files to embed, using one or more path.Match patterns. 

The directive must immediately precede a line containing the declaration of a single variable. Only blank lines and ‘//’ line comments are permitted between the directive and the declaration. 

The type of the variable must be a string type, or a slice of a byte type, or FS (or an alias of FS). 

For example: 

```
package server

import "embed"

// content holds our static web server content.
//go:embed image/* template/*
//go:embed html/index.html
var content embed.FS

```
The Go build system will recognize the directives and arrange for the declared variable (in the example above, content) to be populated with the matching files from the file system. 

The //go:embed directive accepts multiple space-separated patterns for brevity, but it can also be repeated, to avoid very long lines when there are many patterns. The patterns are interpreted relative to the package directory containing the source file. The path separator is a forward slash, even on Windows systems. Patterns may not contain ‘.’ or ‘..’ or empty path elements, nor may they begin or end with a slash. To match everything in the current directory, use ‘*’ instead of ‘.’. To allow for naming files with spaces in their names, patterns can be written as Go double-quoted or back-quoted string literals. 

If a pattern names a directory, all files in the subtree rooted at that directory are embedded (recursively), except that files with names beginning with ‘.’ or ‘_’ are excluded. So the variable in the above example is almost equivalent to: 

```
// content is our static web server content.
//go:embed image template html/index.html
var content embed.FS

```
The difference is that ‘image/*’ embeds ‘image/.tempfile’ while ‘image’ does not. 

The //go:embed directive can be used with both exported and unexported variables, depending on whether the package wants to make the data available to other packages. It can only be used with global variables at package scope, not with local variables. 

Patterns must not match files outside the package's module, such as ‘.git/*’ or symbolic links. Matches for empty directories are ignored. After that, each pattern in a //go:embed line must match at least one file or non-empty directory. 

If any patterns are invalid or have invalid matches, the build will fail. 

### hdr-Strings_and_BytesStrings and Bytes
The //go:embed line for a variable of type string or []byte can have only a single pattern, and that pattern can match only a single file. The string or []byte is initialized with the contents of that file. 

The //go:embed directive requires importing "embed", even when using a string or []byte. In source files that don't refer to embed.FS, use a blank import (import _ "embed"). 

### hdr-File_SystemsFile Systems
For embedding a single file, a variable of type string or []byte is often best. The FS type enables embedding a tree of files, such as a directory of static web server content, as in the example above. 

FS implements the io/fs package's FS interface, so it can be used with any package that understands file systems, including net/http, text/template, and html/template. 

For example, given the content variable in the example above, we can write: 

```
http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.FS(content))))

template.ParseFS(content, "*.tmpl")

```
### hdr-ToolsTools
To support tools that analyze Go packages, the patterns found in //go:embed lines are available in “go list” output. See the EmbedPatterns, TestEmbedPatterns, and XTestEmbedPatterns fields in the “go help list” output. 

## Index

* Subpages
  * [embed/internal](embed/internal.md)
* [Variables](#var)
    * [var dotFile](#dotFile)
* [Types](#type)
    * [type FS struct](#FS)
        * [func (f FS) lookup(name string) *file](#FS.lookup)
        * [func (f FS) readDir(dir string) []file](#FS.readDir)
        * [func (f FS) Open(name string) (fs.File, error)](#FS.Open)
        * [func (f FS) ReadDir(name string) ([]fs.DirEntry, error)](#FS.ReadDir)
        * [func (f FS) ReadFile(name string) ([]byte, error)](#FS.ReadFile)
    * [type file struct](#file)
        * [func (f *file) Name() string](#file.Name)
        * [func (f *file) Size() int64](#file.Size)
        * [func (f *file) ModTime() time.Time](#file.ModTime)
        * [func (f *file) IsDir() bool](#file.IsDir)
        * [func (f *file) Sys() interface{}](#file.Sys)
        * [func (f *file) Type() fs.FileMode](#file.Type)
        * [func (f *file) Info() (fs.FileInfo, error)](#file.Info)
        * [func (f *file) Mode() fs.FileMode](#file.Mode)
    * [type openFile struct](#openFile)
        * [func (f *openFile) Close() error](#openFile.Close)
        * [func (f *openFile) Stat() (fs.FileInfo, error)](#openFile.Stat)
        * [func (f *openFile) Read(b []byte) (int, error)](#openFile.Read)
        * [func (f *openFile) Seek(offset int64, whence int) (int64, error)](#openFile.Seek)
    * [type openDir struct](#openDir)
        * [func (d *openDir) Close() error](#openDir.Close)
        * [func (d *openDir) Stat() (fs.FileInfo, error)](#openDir.Stat)
        * [func (d *openDir) Read([]byte) (int, error)](#openDir.Read)
        * [func (d *openDir) ReadDir(count int) ([]fs.DirEntry, error)](#openDir.ReadDir)
* [Functions](#func)
    * [func split(name string) (dir, elem string, isDir bool)](#split)
    * [func trimSlash(name string) string](#trimSlash)
    * [func sortSearch(n int, f func(int) bool) int](#sortSearch)


## <a id="var" href="#var">Variables</a>

### <a id="dotFile" href="#dotFile">var dotFile</a>

```
searchKey: embed.dotFile
tags: [private]
```

```Go
var dotFile = &file{name: "./"}
```

dotFile is a file for the root directory, which is omitted from the files list in a FS. 

## <a id="type" href="#type">Types</a>

### <a id="FS" href="#FS">type FS struct</a>

```
searchKey: embed.FS
```

```Go
type FS struct {
	// The compiler knows the layout of this struct.
	// See cmd/compile/internal/staticdata's WriteEmbed.
	//
	// The files list is sorted by name but not by simple string comparison.
	// Instead, each file's name takes the form "dir/elem" or "dir/elem/".
	// The optional trailing slash indicates that the file is itself a directory.
	// The files list is sorted first by dir (if dir is missing, it is taken to be ".")
	// and then by base, so this list of files:
	//
	//	p
	//	q/
	//	q/r
	//	q/s/
	//	q/s/t
	//	q/s/u
	//	q/v
	//	w
	//
	// is actually sorted as:
	//
	//	p       # dir=.    elem=p
	//	q/      # dir=.    elem=q
	//	w/      # dir=.    elem=w
	//	q/r     # dir=q    elem=r
	//	q/s/    # dir=q    elem=s
	//	q/v     # dir=q    elem=v
	//	q/s/t   # dir=q/s  elem=t
	//	q/s/u   # dir=q/s  elem=u
	//
	// This order brings directory contents together in contiguous sections
	// of the list, allowing a directory read to use binary search to find
	// the relevant sequence of entries.
	files *[]file
}
```

An FS is a read-only collection of files, usually initialized with a //go:embed directive. When declared without a //go:embed directive, an FS is an empty file system. 

An FS is a read-only value, so it is safe to use from multiple goroutines simultaneously and also safe to assign values of type FS to each other. 

FS implements fs.FS, so it can be used with any package that understands file system interfaces, including net/http, text/template, and html/template. 

See the package documentation for more details about initializing an FS. 

#### <a id="FS.lookup" href="#FS.lookup">func (f FS) lookup(name string) *file</a>

```
searchKey: embed.FS.lookup
tags: [private]
```

```Go
func (f FS) lookup(name string) *file
```

lookup returns the named file, or nil if it is not present. 

#### <a id="FS.readDir" href="#FS.readDir">func (f FS) readDir(dir string) []file</a>

```
searchKey: embed.FS.readDir
tags: [private]
```

```Go
func (f FS) readDir(dir string) []file
```

readDir returns the list of files corresponding to the directory dir. 

#### <a id="FS.Open" href="#FS.Open">func (f FS) Open(name string) (fs.File, error)</a>

```
searchKey: embed.FS.Open
```

```Go
func (f FS) Open(name string) (fs.File, error)
```

Open opens the named file for reading and returns it as an fs.File. 

#### <a id="FS.ReadDir" href="#FS.ReadDir">func (f FS) ReadDir(name string) ([]fs.DirEntry, error)</a>

```
searchKey: embed.FS.ReadDir
```

```Go
func (f FS) ReadDir(name string) ([]fs.DirEntry, error)
```

ReadDir reads and returns the entire named directory. 

#### <a id="FS.ReadFile" href="#FS.ReadFile">func (f FS) ReadFile(name string) ([]byte, error)</a>

```
searchKey: embed.FS.ReadFile
```

```Go
func (f FS) ReadFile(name string) ([]byte, error)
```

ReadFile reads and returns the content of the named file. 

### <a id="file" href="#file">type file struct</a>

```
searchKey: embed.file
tags: [private]
```

```Go
type file struct {
	// The compiler knows the layout of this struct.
	// See cmd/compile/internal/staticdata's WriteEmbed.
	name string
	data string
	hash [16]byte // truncated SHA256 hash
}
```

A file is a single file in the FS. It implements fs.FileInfo and fs.DirEntry. 

#### <a id="file.Name" href="#file.Name">func (f *file) Name() string</a>

```
searchKey: embed.file.Name
tags: [private]
```

```Go
func (f *file) Name() string
```

#### <a id="file.Size" href="#file.Size">func (f *file) Size() int64</a>

```
searchKey: embed.file.Size
tags: [private]
```

```Go
func (f *file) Size() int64
```

#### <a id="file.ModTime" href="#file.ModTime">func (f *file) ModTime() time.Time</a>

```
searchKey: embed.file.ModTime
tags: [private]
```

```Go
func (f *file) ModTime() time.Time
```

#### <a id="file.IsDir" href="#file.IsDir">func (f *file) IsDir() bool</a>

```
searchKey: embed.file.IsDir
tags: [private]
```

```Go
func (f *file) IsDir() bool
```

#### <a id="file.Sys" href="#file.Sys">func (f *file) Sys() interface{}</a>

```
searchKey: embed.file.Sys
tags: [private]
```

```Go
func (f *file) Sys() interface{}
```

#### <a id="file.Type" href="#file.Type">func (f *file) Type() fs.FileMode</a>

```
searchKey: embed.file.Type
tags: [private]
```

```Go
func (f *file) Type() fs.FileMode
```

#### <a id="file.Info" href="#file.Info">func (f *file) Info() (fs.FileInfo, error)</a>

```
searchKey: embed.file.Info
tags: [private]
```

```Go
func (f *file) Info() (fs.FileInfo, error)
```

#### <a id="file.Mode" href="#file.Mode">func (f *file) Mode() fs.FileMode</a>

```
searchKey: embed.file.Mode
tags: [private]
```

```Go
func (f *file) Mode() fs.FileMode
```

### <a id="openFile" href="#openFile">type openFile struct</a>

```
searchKey: embed.openFile
tags: [private]
```

```Go
type openFile struct {
	f      *file // the file itself
	offset int64 // current read offset
}
```

An openFile is a regular file open for reading. 

#### <a id="openFile.Close" href="#openFile.Close">func (f *openFile) Close() error</a>

```
searchKey: embed.openFile.Close
tags: [private]
```

```Go
func (f *openFile) Close() error
```

#### <a id="openFile.Stat" href="#openFile.Stat">func (f *openFile) Stat() (fs.FileInfo, error)</a>

```
searchKey: embed.openFile.Stat
tags: [private]
```

```Go
func (f *openFile) Stat() (fs.FileInfo, error)
```

#### <a id="openFile.Read" href="#openFile.Read">func (f *openFile) Read(b []byte) (int, error)</a>

```
searchKey: embed.openFile.Read
tags: [private]
```

```Go
func (f *openFile) Read(b []byte) (int, error)
```

#### <a id="openFile.Seek" href="#openFile.Seek">func (f *openFile) Seek(offset int64, whence int) (int64, error)</a>

```
searchKey: embed.openFile.Seek
tags: [private]
```

```Go
func (f *openFile) Seek(offset int64, whence int) (int64, error)
```

### <a id="openDir" href="#openDir">type openDir struct</a>

```
searchKey: embed.openDir
tags: [private]
```

```Go
type openDir struct {
	f      *file  // the directory file itself
	files  []file // the directory contents
	offset int    // the read offset, an index into the files slice
}
```

An openDir is a directory open for reading. 

#### <a id="openDir.Close" href="#openDir.Close">func (d *openDir) Close() error</a>

```
searchKey: embed.openDir.Close
tags: [private]
```

```Go
func (d *openDir) Close() error
```

#### <a id="openDir.Stat" href="#openDir.Stat">func (d *openDir) Stat() (fs.FileInfo, error)</a>

```
searchKey: embed.openDir.Stat
tags: [private]
```

```Go
func (d *openDir) Stat() (fs.FileInfo, error)
```

#### <a id="openDir.Read" href="#openDir.Read">func (d *openDir) Read([]byte) (int, error)</a>

```
searchKey: embed.openDir.Read
tags: [private]
```

```Go
func (d *openDir) Read([]byte) (int, error)
```

#### <a id="openDir.ReadDir" href="#openDir.ReadDir">func (d *openDir) ReadDir(count int) ([]fs.DirEntry, error)</a>

```
searchKey: embed.openDir.ReadDir
tags: [private]
```

```Go
func (d *openDir) ReadDir(count int) ([]fs.DirEntry, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="split" href="#split">func split(name string) (dir, elem string, isDir bool)</a>

```
searchKey: embed.split
tags: [private]
```

```Go
func split(name string) (dir, elem string, isDir bool)
```

split splits the name into dir and elem as described in the comment in the FS struct above. isDir reports whether the final trailing slash was present, indicating that name is a directory. 

### <a id="trimSlash" href="#trimSlash">func trimSlash(name string) string</a>

```
searchKey: embed.trimSlash
tags: [private]
```

```Go
func trimSlash(name string) string
```

trimSlash trims a trailing slash from name, if present, returning the possibly shortened name. 

### <a id="sortSearch" href="#sortSearch">func sortSearch(n int, f func(int) bool) int</a>

```
searchKey: embed.sortSearch
tags: [private]
```

```Go
func sortSearch(n int, f func(int) bool) int
```

sortSearch is like sort.Search, avoiding an import. 

