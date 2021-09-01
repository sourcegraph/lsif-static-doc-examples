# Package util

## Index

* [Types](#type)
    * [type FileInfo struct](#FileInfo)
        * [func (fi *FileInfo) IsDir() bool](#FileInfo.IsDir)
        * [func (fi *FileInfo) ModTime() time.Time](#FileInfo.ModTime)
        * [func (fi *FileInfo) Mode() os.FileMode](#FileInfo.Mode)
        * [func (fi *FileInfo) Name() string](#FileInfo.Name)
        * [func (fi *FileInfo) Size() int64](#FileInfo.Size)
        * [func (fi *FileInfo) Sys() interface{}](#FileInfo.Sys)
    * [type fileInfosByName []fs.FileInfo](#fileInfosByName)
        * [func (v fileInfosByName) Len() int](#fileInfosByName.Len)
        * [func (v fileInfosByName) Less(i, j int) bool](#fileInfosByName.Less)
        * [func (v fileInfosByName) Swap(i, j int)](#fileInfosByName.Swap)
* [Functions](#func)
    * [func Rel(path string) string](#Rel)
    * [func ScriptFile(prefix string) (filePath string, rootPath string, err error)](#ScriptFile)
    * [func SortFileInfosByName(fis []fs.FileInfo)](#SortFileInfosByName)
    * [func TestScriptFile(t *testing.T)](#TestScriptFile)
    * [func WriteFileWithPermissions(file string, content []byte, perm os.FileMode) error](#WriteFileWithPermissions)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="FileInfo" href="#FileInfo">type FileInfo struct</a>

```
searchKey: util.FileInfo
tags: [struct]
```

```Go
type FileInfo struct {
	Name_    string
	Mode_    os.FileMode
	Size_    int64
	ModTime_ time.Time
	Sys_     interface{}
}
```

FileInfo implements fs.FileInfo. 

#### <a id="FileInfo.IsDir" href="#FileInfo.IsDir">func (fi *FileInfo) IsDir() bool</a>

```
searchKey: util.FileInfo.IsDir
tags: [method]
```

```Go
func (fi *FileInfo) IsDir() bool
```

#### <a id="FileInfo.ModTime" href="#FileInfo.ModTime">func (fi *FileInfo) ModTime() time.Time</a>

```
searchKey: util.FileInfo.ModTime
tags: [method]
```

```Go
func (fi *FileInfo) ModTime() time.Time
```

#### <a id="FileInfo.Mode" href="#FileInfo.Mode">func (fi *FileInfo) Mode() os.FileMode</a>

```
searchKey: util.FileInfo.Mode
tags: [method]
```

```Go
func (fi *FileInfo) Mode() os.FileMode
```

#### <a id="FileInfo.Name" href="#FileInfo.Name">func (fi *FileInfo) Name() string</a>

```
searchKey: util.FileInfo.Name
tags: [method]
```

```Go
func (fi *FileInfo) Name() string
```

#### <a id="FileInfo.Size" href="#FileInfo.Size">func (fi *FileInfo) Size() int64</a>

```
searchKey: util.FileInfo.Size
tags: [method]
```

```Go
func (fi *FileInfo) Size() int64
```

#### <a id="FileInfo.Sys" href="#FileInfo.Sys">func (fi *FileInfo) Sys() interface{}</a>

```
searchKey: util.FileInfo.Sys
tags: [method]
```

```Go
func (fi *FileInfo) Sys() interface{}
```

### <a id="fileInfosByName" href="#fileInfosByName">type fileInfosByName []fs.FileInfo</a>

```
searchKey: util.fileInfosByName
tags: [array interface private]
```

```Go
type fileInfosByName []fs.FileInfo
```

#### <a id="fileInfosByName.Len" href="#fileInfosByName.Len">func (v fileInfosByName) Len() int</a>

```
searchKey: util.fileInfosByName.Len
tags: [method private]
```

```Go
func (v fileInfosByName) Len() int
```

#### <a id="fileInfosByName.Less" href="#fileInfosByName.Less">func (v fileInfosByName) Less(i, j int) bool</a>

```
searchKey: util.fileInfosByName.Less
tags: [method private]
```

```Go
func (v fileInfosByName) Less(i, j int) bool
```

#### <a id="fileInfosByName.Swap" href="#fileInfosByName.Swap">func (v fileInfosByName) Swap(i, j int)</a>

```
searchKey: util.fileInfosByName.Swap
tags: [method private]
```

```Go
func (v fileInfosByName) Swap(i, j int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Rel" href="#Rel">func Rel(path string) string</a>

```
searchKey: util.Rel
tags: [function]
```

```Go
func Rel(path string) string
```

Rel strips the leading "/" prefix from the path string, effectively turning an absolute path into one relative to the root directory. A path that is just "/" is treated specially, returning just ".". 

The elements in a file path are separated by slash ('/', U+002F) characters, regardless of host operating system convention. 

### <a id="ScriptFile" href="#ScriptFile">func ScriptFile(prefix string) (filePath string, rootPath string, err error)</a>

```
searchKey: util.ScriptFile
tags: [function]
```

```Go
func ScriptFile(prefix string) (filePath string, rootPath string, err error)
```

Constructs platform-specific temporary script file with a given prefix On Windows such a file must have .bat extension Returns triplet where - filePath is a location of file - rootPath refers to temporary root directory the filePath is in (everything under the rootPath (including rootPath) should be removed when no longer needed) - error indicates possible error 

### <a id="SortFileInfosByName" href="#SortFileInfosByName">func SortFileInfosByName(fis []fs.FileInfo)</a>

```
searchKey: util.SortFileInfosByName
tags: [function]
```

```Go
func SortFileInfosByName(fis []fs.FileInfo)
```

SortFileInfosByName sorts fis by name, alphabetically. 

### <a id="TestScriptFile" href="#TestScriptFile">func TestScriptFile(t *testing.T)</a>

```
searchKey: util.TestScriptFile
tags: [function private test]
```

```Go
func TestScriptFile(t *testing.T)
```

### <a id="WriteFileWithPermissions" href="#WriteFileWithPermissions">func WriteFileWithPermissions(file string, content []byte, perm os.FileMode) error</a>

```
searchKey: util.WriteFileWithPermissions
tags: [function]
```

```Go
func WriteFileWithPermissions(file string, content []byte, perm os.FileMode) error
```

Wrapper around os.WriteFile that updates permissions regardless if file existed before 

