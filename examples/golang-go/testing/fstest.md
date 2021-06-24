# Package fstest

Package fstest implements support for testing implementations and users of file systems. 

## Index

* [Types](#type)
    * [type MapFS map[string]*fstest.MapFile](#MapFS)
        * [func (fsys MapFS) Glob(pattern string) ([]string, error)](#MapFS.Glob)
        * [func (fsys MapFS) Open(name string) (fs.File, error)](#MapFS.Open)
        * [func (fsys MapFS) ReadDir(name string) ([]fs.DirEntry, error)](#MapFS.ReadDir)
        * [func (fsys MapFS) ReadFile(name string) ([]byte, error)](#MapFS.ReadFile)
        * [func (fsys MapFS) Stat(name string) (fs.FileInfo, error)](#MapFS.Stat)
        * [func (fsys MapFS) Sub(dir string) (fs.FS, error)](#MapFS.Sub)
    * [type MapFile struct](#MapFile)
    * [type fsOnly struct](#fsOnly)
    * [type fsTester struct](#fsTester)
        * [func (t *fsTester) checkBadPath(file string, desc string, open func(string) error)](#fsTester.checkBadPath)
        * [func (t *fsTester) checkDir(dir string)](#fsTester.checkDir)
        * [func (t *fsTester) checkDirList(dir, desc string, list1, list2 []fs.DirEntry)](#fsTester.checkDirList)
        * [func (t *fsTester) checkFile(file string)](#fsTester.checkFile)
        * [func (t *fsTester) checkFileRead(file, desc string, data1, data2 []byte)](#fsTester.checkFileRead)
        * [func (t *fsTester) checkGlob(dir string, list []fs.DirEntry)](#fsTester.checkGlob)
        * [func (t *fsTester) checkOpen(file string)](#fsTester.checkOpen)
        * [func (t *fsTester) checkStat(path string, entry fs.DirEntry)](#fsTester.checkStat)
        * [func (t *fsTester) errorf(format string, args ...interface{})](#fsTester.errorf)
        * [func (t *fsTester) openDir(dir string) fs.ReadDirFile](#fsTester.openDir)
    * [type mapDir struct](#mapDir)
        * [func (d *mapDir) Close() error](#mapDir.Close)
        * [func (d *mapDir) Read(b []byte) (int, error)](#mapDir.Read)
        * [func (d *mapDir) ReadDir(count int) ([]fs.DirEntry, error)](#mapDir.ReadDir)
        * [func (d *mapDir) Stat() (fs.FileInfo, error)](#mapDir.Stat)
    * [type mapFileInfo struct](#mapFileInfo)
        * [func (i *mapFileInfo) Info() (fs.FileInfo, error)](#mapFileInfo.Info)
        * [func (i *mapFileInfo) IsDir() bool](#mapFileInfo.IsDir)
        * [func (i *mapFileInfo) ModTime() time.Time](#mapFileInfo.ModTime)
        * [func (i *mapFileInfo) Mode() fs.FileMode](#mapFileInfo.Mode)
        * [func (i *mapFileInfo) Name() string](#mapFileInfo.Name)
        * [func (i *mapFileInfo) Size() int64](#mapFileInfo.Size)
        * [func (i *mapFileInfo) Sys() interface{}](#mapFileInfo.Sys)
        * [func (i *mapFileInfo) Type() fs.FileMode](#mapFileInfo.Type)
    * [type noSub struct](#noSub)
        * [func (noSub) Sub()](#noSub.Sub)
    * [type openMapFile struct](#openMapFile)
        * [func (f *openMapFile) Close() error](#openMapFile.Close)
        * [func (f *openMapFile) Read(b []byte) (int, error)](#openMapFile.Read)
        * [func (f *openMapFile) ReadAt(b []byte, offset int64) (int, error)](#openMapFile.ReadAt)
        * [func (f *openMapFile) Seek(offset int64, whence int) (int64, error)](#openMapFile.Seek)
        * [func (f *openMapFile) Stat() (fs.FileInfo, error)](#openMapFile.Stat)
* [Functions](#func)
    * [func TestDash(t *testing.T)](#TestDash)
    * [func TestFS(fsys fs.FS, expected ...string) error](#TestFS)
    * [func TestMapFS(t *testing.T)](#TestMapFS)
    * [func TestSymlink(t *testing.T)](#TestSymlink)
    * [func formatEntry(entry fs.DirEntry) string](#formatEntry)
    * [func formatInfo(info fs.FileInfo) string](#formatInfo)
    * [func formatInfoEntry(info fs.FileInfo) string](#formatInfoEntry)
    * [func testFS(fsys fs.FS, expected ...string) error](#testFS)


## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="MapFS" href="#MapFS">type MapFS map[string]*fstest.MapFile</a>

```
searchKey: fstest.MapFS
tags: [object]
```

```Go
type MapFS map[string]*MapFile
```

A MapFS is a simple in-memory file system for use in tests, represented as a map from path names (arguments to Open) to information about the files or directories they represent. 

The map need not include parent directories for files contained in the map; those will be synthesized if needed. But a directory can still be included by setting the MapFile.Mode's ModeDir bit; this may be necessary for detailed control over the directory's FileInfo or to create an empty directory. 

File system operations read directly from the map, so that the file system can be changed by editing the map as needed. An implication is that file system operations must not run concurrently with changes to the map, which would be a race. Another implication is that opening or reading a directory requires iterating over the entire map, so a MapFS should typically be used with not more than a few hundred entries or directory reads. 

#### <a id="MapFS.Glob" href="#MapFS.Glob">func (fsys MapFS) Glob(pattern string) ([]string, error)</a>

```
searchKey: fstest.MapFS.Glob
tags: [method]
```

```Go
func (fsys MapFS) Glob(pattern string) ([]string, error)
```

#### <a id="MapFS.Open" href="#MapFS.Open">func (fsys MapFS) Open(name string) (fs.File, error)</a>

```
searchKey: fstest.MapFS.Open
tags: [method]
```

```Go
func (fsys MapFS) Open(name string) (fs.File, error)
```

Open opens the named file. 

#### <a id="MapFS.ReadDir" href="#MapFS.ReadDir">func (fsys MapFS) ReadDir(name string) ([]fs.DirEntry, error)</a>

```
searchKey: fstest.MapFS.ReadDir
tags: [method]
```

```Go
func (fsys MapFS) ReadDir(name string) ([]fs.DirEntry, error)
```

#### <a id="MapFS.ReadFile" href="#MapFS.ReadFile">func (fsys MapFS) ReadFile(name string) ([]byte, error)</a>

```
searchKey: fstest.MapFS.ReadFile
tags: [method]
```

```Go
func (fsys MapFS) ReadFile(name string) ([]byte, error)
```

#### <a id="MapFS.Stat" href="#MapFS.Stat">func (fsys MapFS) Stat(name string) (fs.FileInfo, error)</a>

```
searchKey: fstest.MapFS.Stat
tags: [method]
```

```Go
func (fsys MapFS) Stat(name string) (fs.FileInfo, error)
```

#### <a id="MapFS.Sub" href="#MapFS.Sub">func (fsys MapFS) Sub(dir string) (fs.FS, error)</a>

```
searchKey: fstest.MapFS.Sub
tags: [method]
```

```Go
func (fsys MapFS) Sub(dir string) (fs.FS, error)
```

### <a id="MapFile" href="#MapFile">type MapFile struct</a>

```
searchKey: fstest.MapFile
tags: [struct]
```

```Go
type MapFile struct {
	Data    []byte      // file content
	Mode    fs.FileMode // FileInfo.Mode
	ModTime time.Time   // FileInfo.ModTime
	Sys     interface{} // FileInfo.Sys
}
```

A MapFile describes a single file in a MapFS. 

### <a id="fsOnly" href="#fsOnly">type fsOnly struct</a>

```
searchKey: fstest.fsOnly
tags: [struct private]
```

```Go
type fsOnly struct{ fs.FS }
```

fsOnly is a wrapper that hides all but the fs.FS methods, to avoid an infinite recursion when implementing special methods in terms of helpers that would use them. (In general, implementing these methods using the package fs helpers is redundant and unnecessary, but having the methods may make MapFS exercise more code paths when used in tests.) 

### <a id="fsTester" href="#fsTester">type fsTester struct</a>

```
searchKey: fstest.fsTester
tags: [struct private]
```

```Go
type fsTester struct {
	fsys    fs.FS
	errText []byte
	dirs    []string
	files   []string
}
```

An fsTester holds state for running the test. 

#### <a id="fsTester.checkBadPath" href="#fsTester.checkBadPath">func (t *fsTester) checkBadPath(file string, desc string, open func(string) error)</a>

```
searchKey: fstest.fsTester.checkBadPath
tags: [method private]
```

```Go
func (t *fsTester) checkBadPath(file string, desc string, open func(string) error)
```

checkBadPath checks that various invalid forms of file's name cannot be opened using open. 

#### <a id="fsTester.checkDir" href="#fsTester.checkDir">func (t *fsTester) checkDir(dir string)</a>

```
searchKey: fstest.fsTester.checkDir
tags: [method private]
```

```Go
func (t *fsTester) checkDir(dir string)
```

checkDir checks the directory dir, which is expected to exist (it is either the root or was found in a directory listing with IsDir true). 

#### <a id="fsTester.checkDirList" href="#fsTester.checkDirList">func (t *fsTester) checkDirList(dir, desc string, list1, list2 []fs.DirEntry)</a>

```
searchKey: fstest.fsTester.checkDirList
tags: [method private]
```

```Go
func (t *fsTester) checkDirList(dir, desc string, list1, list2 []fs.DirEntry)
```

checkDirList checks that two directory lists contain the same files and file info. The order of the lists need not match. 

#### <a id="fsTester.checkFile" href="#fsTester.checkFile">func (t *fsTester) checkFile(file string)</a>

```
searchKey: fstest.fsTester.checkFile
tags: [method private]
```

```Go
func (t *fsTester) checkFile(file string)
```

checkFile checks that basic file reading works correctly. 

#### <a id="fsTester.checkFileRead" href="#fsTester.checkFileRead">func (t *fsTester) checkFileRead(file, desc string, data1, data2 []byte)</a>

```
searchKey: fstest.fsTester.checkFileRead
tags: [method private]
```

```Go
func (t *fsTester) checkFileRead(file, desc string, data1, data2 []byte)
```

#### <a id="fsTester.checkGlob" href="#fsTester.checkGlob">func (t *fsTester) checkGlob(dir string, list []fs.DirEntry)</a>

```
searchKey: fstest.fsTester.checkGlob
tags: [method private]
```

```Go
func (t *fsTester) checkGlob(dir string, list []fs.DirEntry)
```

checkGlob checks that various glob patterns work if the file system implements GlobFS. 

#### <a id="fsTester.checkOpen" href="#fsTester.checkOpen">func (t *fsTester) checkOpen(file string)</a>

```
searchKey: fstest.fsTester.checkOpen
tags: [method private]
```

```Go
func (t *fsTester) checkOpen(file string)
```

checkBadPath checks that various invalid forms of file's name cannot be opened using t.fsys.Open. 

#### <a id="fsTester.checkStat" href="#fsTester.checkStat">func (t *fsTester) checkStat(path string, entry fs.DirEntry)</a>

```
searchKey: fstest.fsTester.checkStat
tags: [method private]
```

```Go
func (t *fsTester) checkStat(path string, entry fs.DirEntry)
```

checkStat checks that a direct stat of path matches entry, which was found in the parent's directory listing. 

#### <a id="fsTester.errorf" href="#fsTester.errorf">func (t *fsTester) errorf(format string, args ...interface{})</a>

```
searchKey: fstest.fsTester.errorf
tags: [method private]
```

```Go
func (t *fsTester) errorf(format string, args ...interface{})
```

errorf adds an error line to errText. 

#### <a id="fsTester.openDir" href="#fsTester.openDir">func (t *fsTester) openDir(dir string) fs.ReadDirFile</a>

```
searchKey: fstest.fsTester.openDir
tags: [method private]
```

```Go
func (t *fsTester) openDir(dir string) fs.ReadDirFile
```

### <a id="mapDir" href="#mapDir">type mapDir struct</a>

```
searchKey: fstest.mapDir
tags: [struct private]
```

```Go
type mapDir struct {
	path string
	mapFileInfo
	entry  []mapFileInfo
	offset int
}
```

A mapDir is a directory fs.File (so also an fs.ReadDirFile) open for reading. 

#### <a id="mapDir.Close" href="#mapDir.Close">func (d *mapDir) Close() error</a>

```
searchKey: fstest.mapDir.Close
tags: [function private]
```

```Go
func (d *mapDir) Close() error
```

#### <a id="mapDir.Read" href="#mapDir.Read">func (d *mapDir) Read(b []byte) (int, error)</a>

```
searchKey: fstest.mapDir.Read
tags: [method private]
```

```Go
func (d *mapDir) Read(b []byte) (int, error)
```

#### <a id="mapDir.ReadDir" href="#mapDir.ReadDir">func (d *mapDir) ReadDir(count int) ([]fs.DirEntry, error)</a>

```
searchKey: fstest.mapDir.ReadDir
tags: [method private]
```

```Go
func (d *mapDir) ReadDir(count int) ([]fs.DirEntry, error)
```

#### <a id="mapDir.Stat" href="#mapDir.Stat">func (d *mapDir) Stat() (fs.FileInfo, error)</a>

```
searchKey: fstest.mapDir.Stat
tags: [function private]
```

```Go
func (d *mapDir) Stat() (fs.FileInfo, error)
```

### <a id="mapFileInfo" href="#mapFileInfo">type mapFileInfo struct</a>

```
searchKey: fstest.mapFileInfo
tags: [struct private]
```

```Go
type mapFileInfo struct {
	name string
	f    *MapFile
}
```

A mapFileInfo implements fs.FileInfo and fs.DirEntry for a given map file. 

#### <a id="mapFileInfo.Info" href="#mapFileInfo.Info">func (i *mapFileInfo) Info() (fs.FileInfo, error)</a>

```
searchKey: fstest.mapFileInfo.Info
tags: [function private]
```

```Go
func (i *mapFileInfo) Info() (fs.FileInfo, error)
```

#### <a id="mapFileInfo.IsDir" href="#mapFileInfo.IsDir">func (i *mapFileInfo) IsDir() bool</a>

```
searchKey: fstest.mapFileInfo.IsDir
tags: [function private]
```

```Go
func (i *mapFileInfo) IsDir() bool
```

#### <a id="mapFileInfo.ModTime" href="#mapFileInfo.ModTime">func (i *mapFileInfo) ModTime() time.Time</a>

```
searchKey: fstest.mapFileInfo.ModTime
tags: [function private]
```

```Go
func (i *mapFileInfo) ModTime() time.Time
```

#### <a id="mapFileInfo.Mode" href="#mapFileInfo.Mode">func (i *mapFileInfo) Mode() fs.FileMode</a>

```
searchKey: fstest.mapFileInfo.Mode
tags: [function private]
```

```Go
func (i *mapFileInfo) Mode() fs.FileMode
```

#### <a id="mapFileInfo.Name" href="#mapFileInfo.Name">func (i *mapFileInfo) Name() string</a>

```
searchKey: fstest.mapFileInfo.Name
tags: [function private]
```

```Go
func (i *mapFileInfo) Name() string
```

#### <a id="mapFileInfo.Size" href="#mapFileInfo.Size">func (i *mapFileInfo) Size() int64</a>

```
searchKey: fstest.mapFileInfo.Size
tags: [function private]
```

```Go
func (i *mapFileInfo) Size() int64
```

#### <a id="mapFileInfo.Sys" href="#mapFileInfo.Sys">func (i *mapFileInfo) Sys() interface{}</a>

```
searchKey: fstest.mapFileInfo.Sys
tags: [function private]
```

```Go
func (i *mapFileInfo) Sys() interface{}
```

#### <a id="mapFileInfo.Type" href="#mapFileInfo.Type">func (i *mapFileInfo) Type() fs.FileMode</a>

```
searchKey: fstest.mapFileInfo.Type
tags: [function private]
```

```Go
func (i *mapFileInfo) Type() fs.FileMode
```

### <a id="noSub" href="#noSub">type noSub struct</a>

```
searchKey: fstest.noSub
tags: [struct private]
```

```Go
type noSub struct {
	MapFS
}
```

#### <a id="noSub.Sub" href="#noSub.Sub">func (noSub) Sub()</a>

```
searchKey: fstest.noSub.Sub
tags: [function private]
```

```Go
func (noSub) Sub()
```

### <a id="openMapFile" href="#openMapFile">type openMapFile struct</a>

```
searchKey: fstest.openMapFile
tags: [struct private]
```

```Go
type openMapFile struct {
	path string
	mapFileInfo
	offset int64
}
```

An openMapFile is a regular (non-directory) fs.File open for reading. 

#### <a id="openMapFile.Close" href="#openMapFile.Close">func (f *openMapFile) Close() error</a>

```
searchKey: fstest.openMapFile.Close
tags: [function private]
```

```Go
func (f *openMapFile) Close() error
```

#### <a id="openMapFile.Read" href="#openMapFile.Read">func (f *openMapFile) Read(b []byte) (int, error)</a>

```
searchKey: fstest.openMapFile.Read
tags: [method private]
```

```Go
func (f *openMapFile) Read(b []byte) (int, error)
```

#### <a id="openMapFile.ReadAt" href="#openMapFile.ReadAt">func (f *openMapFile) ReadAt(b []byte, offset int64) (int, error)</a>

```
searchKey: fstest.openMapFile.ReadAt
tags: [method private]
```

```Go
func (f *openMapFile) ReadAt(b []byte, offset int64) (int, error)
```

#### <a id="openMapFile.Seek" href="#openMapFile.Seek">func (f *openMapFile) Seek(offset int64, whence int) (int64, error)</a>

```
searchKey: fstest.openMapFile.Seek
tags: [method private]
```

```Go
func (f *openMapFile) Seek(offset int64, whence int) (int64, error)
```

#### <a id="openMapFile.Stat" href="#openMapFile.Stat">func (f *openMapFile) Stat() (fs.FileInfo, error)</a>

```
searchKey: fstest.openMapFile.Stat
tags: [function private]
```

```Go
func (f *openMapFile) Stat() (fs.FileInfo, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="TestDash" href="#TestDash">func TestDash(t *testing.T)</a>

```
searchKey: fstest.TestDash
tags: [method private test]
```

```Go
func TestDash(t *testing.T)
```

### <a id="TestFS" href="#TestFS">func TestFS(fsys fs.FS, expected ...string) error</a>

```
searchKey: fstest.TestFS
tags: [method]
```

```Go
func TestFS(fsys fs.FS, expected ...string) error
```

TestFS tests a file system implementation. It walks the entire tree of files in fsys, opening and checking that each file behaves correctly. It also checks that the file system contains at least the expected files. As a special case, if no expected files are listed, fsys must be empty. Otherwise, fsys must contain at least the listed files; it can also contain others. The contents of fsys must not change concurrently with TestFS. 

If TestFS finds any misbehaviors, it returns an error reporting all of them. The error text spans multiple lines, one per detected misbehavior. 

Typical usage inside a test is: 

```
if err := fstest.TestFS(myFS, "file/that/should/be/present"); err != nil {
	t.Fatal(err)
}

```
### <a id="TestMapFS" href="#TestMapFS">func TestMapFS(t *testing.T)</a>

```
searchKey: fstest.TestMapFS
tags: [method private test]
```

```Go
func TestMapFS(t *testing.T)
```

### <a id="TestSymlink" href="#TestSymlink">func TestSymlink(t *testing.T)</a>

```
searchKey: fstest.TestSymlink
tags: [method private test]
```

```Go
func TestSymlink(t *testing.T)
```

### <a id="formatEntry" href="#formatEntry">func formatEntry(entry fs.DirEntry) string</a>

```
searchKey: fstest.formatEntry
tags: [method private]
```

```Go
func formatEntry(entry fs.DirEntry) string
```

formatEntry formats an fs.DirEntry into a string for error messages and comparison. 

### <a id="formatInfo" href="#formatInfo">func formatInfo(info fs.FileInfo) string</a>

```
searchKey: fstest.formatInfo
tags: [method private]
```

```Go
func formatInfo(info fs.FileInfo) string
```

formatInfo formats an fs.FileInfo into a string for error messages and comparison. 

### <a id="formatInfoEntry" href="#formatInfoEntry">func formatInfoEntry(info fs.FileInfo) string</a>

```
searchKey: fstest.formatInfoEntry
tags: [method private]
```

```Go
func formatInfoEntry(info fs.FileInfo) string
```

formatInfoEntry formats an fs.FileInfo into a string like the result of formatEntry, for error messages and comparison. 

### <a id="testFS" href="#testFS">func testFS(fsys fs.FS, expected ...string) error</a>

```
searchKey: fstest.testFS
tags: [method private]
```

```Go
func testFS(fsys fs.FS, expected ...string) error
```

