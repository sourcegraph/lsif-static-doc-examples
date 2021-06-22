# Package fstest

Package fstest implements support for testing implementations and users of file systems. 

## Index

* [Types](#type)
    * [type MapFS map[string]*fstest.MapFile](#MapFS)
        * [func (fsys MapFS) Open(name string) (fs.File, error)](#MapFS.Open)
        * [func (fsys MapFS) ReadFile(name string) ([]byte, error)](#MapFS.ReadFile)
        * [func (fsys MapFS) Stat(name string) (fs.FileInfo, error)](#MapFS.Stat)
        * [func (fsys MapFS) ReadDir(name string) ([]fs.DirEntry, error)](#MapFS.ReadDir)
        * [func (fsys MapFS) Glob(pattern string) ([]string, error)](#MapFS.Glob)
        * [func (fsys MapFS) Sub(dir string) (fs.FS, error)](#MapFS.Sub)
    * [type MapFile struct](#MapFile)
    * [type fsOnly struct](#fsOnly)
    * [type noSub struct](#noSub)
        * [func (noSub) Sub()](#noSub.Sub)
    * [type mapFileInfo struct](#mapFileInfo)
        * [func (i *mapFileInfo) Name() string](#mapFileInfo.Name)
        * [func (i *mapFileInfo) Size() int64](#mapFileInfo.Size)
        * [func (i *mapFileInfo) Mode() fs.FileMode](#mapFileInfo.Mode)
        * [func (i *mapFileInfo) Type() fs.FileMode](#mapFileInfo.Type)
        * [func (i *mapFileInfo) ModTime() time.Time](#mapFileInfo.ModTime)
        * [func (i *mapFileInfo) IsDir() bool](#mapFileInfo.IsDir)
        * [func (i *mapFileInfo) Sys() interface{}](#mapFileInfo.Sys)
        * [func (i *mapFileInfo) Info() (fs.FileInfo, error)](#mapFileInfo.Info)
    * [type openMapFile struct](#openMapFile)
        * [func (f *openMapFile) Stat() (fs.FileInfo, error)](#openMapFile.Stat)
        * [func (f *openMapFile) Close() error](#openMapFile.Close)
        * [func (f *openMapFile) Read(b []byte) (int, error)](#openMapFile.Read)
        * [func (f *openMapFile) Seek(offset int64, whence int) (int64, error)](#openMapFile.Seek)
        * [func (f *openMapFile) ReadAt(b []byte, offset int64) (int, error)](#openMapFile.ReadAt)
    * [type mapDir struct](#mapDir)
        * [func (d *mapDir) Stat() (fs.FileInfo, error)](#mapDir.Stat)
        * [func (d *mapDir) Close() error](#mapDir.Close)
        * [func (d *mapDir) Read(b []byte) (int, error)](#mapDir.Read)
        * [func (d *mapDir) ReadDir(count int) ([]fs.DirEntry, error)](#mapDir.ReadDir)
    * [type fsTester struct](#fsTester)
        * [func (t *fsTester) errorf(format string, args ...interface{})](#fsTester.errorf)
        * [func (t *fsTester) openDir(dir string) fs.ReadDirFile](#fsTester.openDir)
        * [func (t *fsTester) checkDir(dir string)](#fsTester.checkDir)
        * [func (t *fsTester) checkGlob(dir string, list []fs.DirEntry)](#fsTester.checkGlob)
        * [func (t *fsTester) checkStat(path string, entry fs.DirEntry)](#fsTester.checkStat)
        * [func (t *fsTester) checkDirList(dir, desc string, list1, list2 []fs.DirEntry)](#fsTester.checkDirList)
        * [func (t *fsTester) checkFile(file string)](#fsTester.checkFile)
        * [func (t *fsTester) checkFileRead(file, desc string, data1, data2 []byte)](#fsTester.checkFileRead)
        * [func (t *fsTester) checkOpen(file string)](#fsTester.checkOpen)
        * [func (t *fsTester) checkBadPath(file string, desc string, open func(string) error)](#fsTester.checkBadPath)
* [Functions](#func)
    * [func TestFS(fsys fs.FS, expected ...string) error](#TestFS)
    * [func testFS(fsys fs.FS, expected ...string) error](#testFS)
    * [func formatEntry(entry fs.DirEntry) string](#formatEntry)
    * [func formatInfoEntry(info fs.FileInfo) string](#formatInfoEntry)
    * [func formatInfo(info fs.FileInfo) string](#formatInfo)
    * [func TestMapFS(t *testing.T)](#TestMapFS)
    * [func TestSymlink(t *testing.T)](#TestSymlink)
    * [func TestDash(t *testing.T)](#TestDash)


## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="MapFS" href="#MapFS">type MapFS map[string]*fstest.MapFile</a>

```
searchKey: fstest.MapFS
tags: [exported]
```

```Go
type MapFS map[string]*MapFile
```

A MapFS is a simple in-memory file system for use in tests, represented as a map from path names (arguments to Open) to information about the files or directories they represent. 

The map need not include parent directories for files contained in the map; those will be synthesized if needed. But a directory can still be included by setting the MapFile.Mode's ModeDir bit; this may be necessary for detailed control over the directory's FileInfo or to create an empty directory. 

File system operations read directly from the map, so that the file system can be changed by editing the map as needed. An implication is that file system operations must not run concurrently with changes to the map, which would be a race. Another implication is that opening or reading a directory requires iterating over the entire map, so a MapFS should typically be used with not more than a few hundred entries or directory reads. 

#### <a id="MapFS.Open" href="#MapFS.Open">func (fsys MapFS) Open(name string) (fs.File, error)</a>

```
searchKey: fstest.MapFS.Open
tags: [exported]
```

```Go
func (fsys MapFS) Open(name string) (fs.File, error)
```

Open opens the named file. 

#### <a id="MapFS.ReadFile" href="#MapFS.ReadFile">func (fsys MapFS) ReadFile(name string) ([]byte, error)</a>

```
searchKey: fstest.MapFS.ReadFile
tags: [exported]
```

```Go
func (fsys MapFS) ReadFile(name string) ([]byte, error)
```

#### <a id="MapFS.Stat" href="#MapFS.Stat">func (fsys MapFS) Stat(name string) (fs.FileInfo, error)</a>

```
searchKey: fstest.MapFS.Stat
tags: [exported]
```

```Go
func (fsys MapFS) Stat(name string) (fs.FileInfo, error)
```

#### <a id="MapFS.ReadDir" href="#MapFS.ReadDir">func (fsys MapFS) ReadDir(name string) ([]fs.DirEntry, error)</a>

```
searchKey: fstest.MapFS.ReadDir
tags: [exported]
```

```Go
func (fsys MapFS) ReadDir(name string) ([]fs.DirEntry, error)
```

#### <a id="MapFS.Glob" href="#MapFS.Glob">func (fsys MapFS) Glob(pattern string) ([]string, error)</a>

```
searchKey: fstest.MapFS.Glob
tags: [exported]
```

```Go
func (fsys MapFS) Glob(pattern string) ([]string, error)
```

#### <a id="MapFS.Sub" href="#MapFS.Sub">func (fsys MapFS) Sub(dir string) (fs.FS, error)</a>

```
searchKey: fstest.MapFS.Sub
tags: [exported]
```

```Go
func (fsys MapFS) Sub(dir string) (fs.FS, error)
```

### <a id="MapFile" href="#MapFile">type MapFile struct</a>

```
searchKey: fstest.MapFile
tags: [exported]
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
```

```Go
type fsOnly struct{ fs.FS }
```

fsOnly is a wrapper that hides all but the fs.FS methods, to avoid an infinite recursion when implementing special methods in terms of helpers that would use them. (In general, implementing these methods using the package fs helpers is redundant and unnecessary, but having the methods may make MapFS exercise more code paths when used in tests.) 

### <a id="noSub" href="#noSub">type noSub struct</a>

```
searchKey: fstest.noSub
```

```Go
type noSub struct {
	MapFS
}
```

#### <a id="noSub.Sub" href="#noSub.Sub">func (noSub) Sub()</a>

```
searchKey: fstest.noSub.Sub
```

```Go
func (noSub) Sub()
```

### <a id="mapFileInfo" href="#mapFileInfo">type mapFileInfo struct</a>

```
searchKey: fstest.mapFileInfo
```

```Go
type mapFileInfo struct {
	name string
	f    *MapFile
}
```

A mapFileInfo implements fs.FileInfo and fs.DirEntry for a given map file. 

#### <a id="mapFileInfo.Name" href="#mapFileInfo.Name">func (i *mapFileInfo) Name() string</a>

```
searchKey: fstest.mapFileInfo.Name
```

```Go
func (i *mapFileInfo) Name() string
```

#### <a id="mapFileInfo.Size" href="#mapFileInfo.Size">func (i *mapFileInfo) Size() int64</a>

```
searchKey: fstest.mapFileInfo.Size
```

```Go
func (i *mapFileInfo) Size() int64
```

#### <a id="mapFileInfo.Mode" href="#mapFileInfo.Mode">func (i *mapFileInfo) Mode() fs.FileMode</a>

```
searchKey: fstest.mapFileInfo.Mode
```

```Go
func (i *mapFileInfo) Mode() fs.FileMode
```

#### <a id="mapFileInfo.Type" href="#mapFileInfo.Type">func (i *mapFileInfo) Type() fs.FileMode</a>

```
searchKey: fstest.mapFileInfo.Type
```

```Go
func (i *mapFileInfo) Type() fs.FileMode
```

#### <a id="mapFileInfo.ModTime" href="#mapFileInfo.ModTime">func (i *mapFileInfo) ModTime() time.Time</a>

```
searchKey: fstest.mapFileInfo.ModTime
```

```Go
func (i *mapFileInfo) ModTime() time.Time
```

#### <a id="mapFileInfo.IsDir" href="#mapFileInfo.IsDir">func (i *mapFileInfo) IsDir() bool</a>

```
searchKey: fstest.mapFileInfo.IsDir
```

```Go
func (i *mapFileInfo) IsDir() bool
```

#### <a id="mapFileInfo.Sys" href="#mapFileInfo.Sys">func (i *mapFileInfo) Sys() interface{}</a>

```
searchKey: fstest.mapFileInfo.Sys
```

```Go
func (i *mapFileInfo) Sys() interface{}
```

#### <a id="mapFileInfo.Info" href="#mapFileInfo.Info">func (i *mapFileInfo) Info() (fs.FileInfo, error)</a>

```
searchKey: fstest.mapFileInfo.Info
```

```Go
func (i *mapFileInfo) Info() (fs.FileInfo, error)
```

### <a id="openMapFile" href="#openMapFile">type openMapFile struct</a>

```
searchKey: fstest.openMapFile
```

```Go
type openMapFile struct {
	path string
	mapFileInfo
	offset int64
}
```

An openMapFile is a regular (non-directory) fs.File open for reading. 

#### <a id="openMapFile.Stat" href="#openMapFile.Stat">func (f *openMapFile) Stat() (fs.FileInfo, error)</a>

```
searchKey: fstest.openMapFile.Stat
```

```Go
func (f *openMapFile) Stat() (fs.FileInfo, error)
```

#### <a id="openMapFile.Close" href="#openMapFile.Close">func (f *openMapFile) Close() error</a>

```
searchKey: fstest.openMapFile.Close
```

```Go
func (f *openMapFile) Close() error
```

#### <a id="openMapFile.Read" href="#openMapFile.Read">func (f *openMapFile) Read(b []byte) (int, error)</a>

```
searchKey: fstest.openMapFile.Read
```

```Go
func (f *openMapFile) Read(b []byte) (int, error)
```

#### <a id="openMapFile.Seek" href="#openMapFile.Seek">func (f *openMapFile) Seek(offset int64, whence int) (int64, error)</a>

```
searchKey: fstest.openMapFile.Seek
```

```Go
func (f *openMapFile) Seek(offset int64, whence int) (int64, error)
```

#### <a id="openMapFile.ReadAt" href="#openMapFile.ReadAt">func (f *openMapFile) ReadAt(b []byte, offset int64) (int, error)</a>

```
searchKey: fstest.openMapFile.ReadAt
```

```Go
func (f *openMapFile) ReadAt(b []byte, offset int64) (int, error)
```

### <a id="mapDir" href="#mapDir">type mapDir struct</a>

```
searchKey: fstest.mapDir
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

#### <a id="mapDir.Stat" href="#mapDir.Stat">func (d *mapDir) Stat() (fs.FileInfo, error)</a>

```
searchKey: fstest.mapDir.Stat
```

```Go
func (d *mapDir) Stat() (fs.FileInfo, error)
```

#### <a id="mapDir.Close" href="#mapDir.Close">func (d *mapDir) Close() error</a>

```
searchKey: fstest.mapDir.Close
```

```Go
func (d *mapDir) Close() error
```

#### <a id="mapDir.Read" href="#mapDir.Read">func (d *mapDir) Read(b []byte) (int, error)</a>

```
searchKey: fstest.mapDir.Read
```

```Go
func (d *mapDir) Read(b []byte) (int, error)
```

#### <a id="mapDir.ReadDir" href="#mapDir.ReadDir">func (d *mapDir) ReadDir(count int) ([]fs.DirEntry, error)</a>

```
searchKey: fstest.mapDir.ReadDir
```

```Go
func (d *mapDir) ReadDir(count int) ([]fs.DirEntry, error)
```

### <a id="fsTester" href="#fsTester">type fsTester struct</a>

```
searchKey: fstest.fsTester
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

#### <a id="fsTester.errorf" href="#fsTester.errorf">func (t *fsTester) errorf(format string, args ...interface{})</a>

```
searchKey: fstest.fsTester.errorf
```

```Go
func (t *fsTester) errorf(format string, args ...interface{})
```

errorf adds an error line to errText. 

#### <a id="fsTester.openDir" href="#fsTester.openDir">func (t *fsTester) openDir(dir string) fs.ReadDirFile</a>

```
searchKey: fstest.fsTester.openDir
```

```Go
func (t *fsTester) openDir(dir string) fs.ReadDirFile
```

#### <a id="fsTester.checkDir" href="#fsTester.checkDir">func (t *fsTester) checkDir(dir string)</a>

```
searchKey: fstest.fsTester.checkDir
```

```Go
func (t *fsTester) checkDir(dir string)
```

checkDir checks the directory dir, which is expected to exist (it is either the root or was found in a directory listing with IsDir true). 

#### <a id="fsTester.checkGlob" href="#fsTester.checkGlob">func (t *fsTester) checkGlob(dir string, list []fs.DirEntry)</a>

```
searchKey: fstest.fsTester.checkGlob
```

```Go
func (t *fsTester) checkGlob(dir string, list []fs.DirEntry)
```

checkGlob checks that various glob patterns work if the file system implements GlobFS. 

#### <a id="fsTester.checkStat" href="#fsTester.checkStat">func (t *fsTester) checkStat(path string, entry fs.DirEntry)</a>

```
searchKey: fstest.fsTester.checkStat
```

```Go
func (t *fsTester) checkStat(path string, entry fs.DirEntry)
```

checkStat checks that a direct stat of path matches entry, which was found in the parent's directory listing. 

#### <a id="fsTester.checkDirList" href="#fsTester.checkDirList">func (t *fsTester) checkDirList(dir, desc string, list1, list2 []fs.DirEntry)</a>

```
searchKey: fstest.fsTester.checkDirList
```

```Go
func (t *fsTester) checkDirList(dir, desc string, list1, list2 []fs.DirEntry)
```

checkDirList checks that two directory lists contain the same files and file info. The order of the lists need not match. 

#### <a id="fsTester.checkFile" href="#fsTester.checkFile">func (t *fsTester) checkFile(file string)</a>

```
searchKey: fstest.fsTester.checkFile
```

```Go
func (t *fsTester) checkFile(file string)
```

checkFile checks that basic file reading works correctly. 

#### <a id="fsTester.checkFileRead" href="#fsTester.checkFileRead">func (t *fsTester) checkFileRead(file, desc string, data1, data2 []byte)</a>

```
searchKey: fstest.fsTester.checkFileRead
```

```Go
func (t *fsTester) checkFileRead(file, desc string, data1, data2 []byte)
```

#### <a id="fsTester.checkOpen" href="#fsTester.checkOpen">func (t *fsTester) checkOpen(file string)</a>

```
searchKey: fstest.fsTester.checkOpen
```

```Go
func (t *fsTester) checkOpen(file string)
```

checkBadPath checks that various invalid forms of file's name cannot be opened using t.fsys.Open. 

#### <a id="fsTester.checkBadPath" href="#fsTester.checkBadPath">func (t *fsTester) checkBadPath(file string, desc string, open func(string) error)</a>

```
searchKey: fstest.fsTester.checkBadPath
```

```Go
func (t *fsTester) checkBadPath(file string, desc string, open func(string) error)
```

checkBadPath checks that various invalid forms of file's name cannot be opened using open. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="TestFS" href="#TestFS">func TestFS(fsys fs.FS, expected ...string) error</a>

```
searchKey: fstest.TestFS
tags: [exported]
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
### <a id="testFS" href="#testFS">func testFS(fsys fs.FS, expected ...string) error</a>

```
searchKey: fstest.testFS
```

```Go
func testFS(fsys fs.FS, expected ...string) error
```

### <a id="formatEntry" href="#formatEntry">func formatEntry(entry fs.DirEntry) string</a>

```
searchKey: fstest.formatEntry
```

```Go
func formatEntry(entry fs.DirEntry) string
```

formatEntry formats an fs.DirEntry into a string for error messages and comparison. 

### <a id="formatInfoEntry" href="#formatInfoEntry">func formatInfoEntry(info fs.FileInfo) string</a>

```
searchKey: fstest.formatInfoEntry
```

```Go
func formatInfoEntry(info fs.FileInfo) string
```

formatInfoEntry formats an fs.FileInfo into a string like the result of formatEntry, for error messages and comparison. 

### <a id="formatInfo" href="#formatInfo">func formatInfo(info fs.FileInfo) string</a>

```
searchKey: fstest.formatInfo
```

```Go
func formatInfo(info fs.FileInfo) string
```

formatInfo formats an fs.FileInfo into a string for error messages and comparison. 

### <a id="TestMapFS" href="#TestMapFS">func TestMapFS(t *testing.T)</a>

```
searchKey: fstest.TestMapFS
```

```Go
func TestMapFS(t *testing.T)
```

### <a id="TestSymlink" href="#TestSymlink">func TestSymlink(t *testing.T)</a>

```
searchKey: fstest.TestSymlink
```

```Go
func TestSymlink(t *testing.T)
```

### <a id="TestDash" href="#TestDash">func TestDash(t *testing.T)</a>

```
searchKey: fstest.TestDash
```

```Go
func TestDash(t *testing.T)
```

