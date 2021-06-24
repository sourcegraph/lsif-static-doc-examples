# Package testutil

## Index

* [Types](#type)
    * [type gzipReadCloser struct](#gzipReadCloser)
        * [func (z *gzipReadCloser) Close() error](#gzipReadCloser.Close)
        * [func (z *gzipReadCloser) Read(p []byte) (int, error)](#gzipReadCloser.Read)
* [Functions](#func)
    * [func AssertGolden(t testing.TB, path string, update bool, want interface{})](#AssertGolden)
    * [func CreateZip(files map[string]string) ([]byte, error)](#CreateZip)
    * [func Diff(b1, b2 string) (string, error)](#Diff)
    * [func FetchTarFromGithub(ctx context.Context, repo api.RepoName, commit api.CommitID) (io.ReadCloser, error)](#FetchTarFromGithub)
    * [func MockZipFile(data []byte) (*store.ZipFile, error)](#MockZipFile)
    * [func NewStore(files map[string]string) (*store.Store, func(), error)](#NewStore)
    * [func TempZipFileOnDisk(data []byte) (string, func(), error)](#TempZipFileOnDisk)
    * [func TempZipFromFiles(files map[string]string) (path string, cleanup func(), err error)](#TempZipFromFiles)
    * [func addpaxheader(w *tar.Writer, body string) error](#addpaxheader)
    * [func fsync(path string) error](#fsync)
    * [func marshal(t testing.TB, v interface{}) []byte](#marshal)
    * [func openGzipReader(name string) (io.ReadCloser, error)](#openGzipReader)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="gzipReadCloser" href="#gzipReadCloser">type gzipReadCloser struct</a>

```
searchKey: testutil.gzipReadCloser
tags: [struct private]
```

```Go
type gzipReadCloser struct {
	f *os.File
	r *gzip.Reader
}
```

#### <a id="gzipReadCloser.Close" href="#gzipReadCloser.Close">func (z *gzipReadCloser) Close() error</a>

```
searchKey: testutil.gzipReadCloser.Close
tags: [function private]
```

```Go
func (z *gzipReadCloser) Close() error
```

#### <a id="gzipReadCloser.Read" href="#gzipReadCloser.Read">func (z *gzipReadCloser) Read(p []byte) (int, error)</a>

```
searchKey: testutil.gzipReadCloser.Read
tags: [method private]
```

```Go
func (z *gzipReadCloser) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="AssertGolden" href="#AssertGolden">func AssertGolden(t testing.TB, path string, update bool, want interface{})</a>

```
searchKey: testutil.AssertGolden
tags: [method]
```

```Go
func AssertGolden(t testing.TB, path string, update bool, want interface{})
```

### <a id="CreateZip" href="#CreateZip">func CreateZip(files map[string]string) ([]byte, error)</a>

```
searchKey: testutil.CreateZip
tags: [method]
```

```Go
func CreateZip(files map[string]string) ([]byte, error)
```

### <a id="Diff" href="#Diff">func Diff(b1, b2 string) (string, error)</a>

```
searchKey: testutil.Diff
tags: [method]
```

```Go
func Diff(b1, b2 string) (string, error)
```

### <a id="FetchTarFromGithub" href="#FetchTarFromGithub">func FetchTarFromGithub(ctx context.Context, repo api.RepoName, commit api.CommitID) (io.ReadCloser, error)</a>

```
searchKey: testutil.FetchTarFromGithub
tags: [method]
```

```Go
func FetchTarFromGithub(ctx context.Context, repo api.RepoName, commit api.CommitID) (io.ReadCloser, error)
```

### <a id="MockZipFile" href="#MockZipFile">func MockZipFile(data []byte) (*store.ZipFile, error)</a>

```
searchKey: testutil.MockZipFile
tags: [method]
```

```Go
func MockZipFile(data []byte) (*store.ZipFile, error)
```

### <a id="NewStore" href="#NewStore">func NewStore(files map[string]string) (*store.Store, func(), error)</a>

```
searchKey: testutil.NewStore
tags: [method]
```

```Go
func NewStore(files map[string]string) (*store.Store, func(), error)
```

### <a id="TempZipFileOnDisk" href="#TempZipFileOnDisk">func TempZipFileOnDisk(data []byte) (string, func(), error)</a>

```
searchKey: testutil.TempZipFileOnDisk
tags: [method]
```

```Go
func TempZipFileOnDisk(data []byte) (string, func(), error)
```

### <a id="TempZipFromFiles" href="#TempZipFromFiles">func TempZipFromFiles(files map[string]string) (path string, cleanup func(), err error)</a>

```
searchKey: testutil.TempZipFromFiles
tags: [method]
```

```Go
func TempZipFromFiles(files map[string]string) (path string, cleanup func(), err error)
```

### <a id="addpaxheader" href="#addpaxheader">func addpaxheader(w *tar.Writer, body string) error</a>

```
searchKey: testutil.addpaxheader
tags: [method private]
```

```Go
func addpaxheader(w *tar.Writer, body string) error
```

### <a id="fsync" href="#fsync">func fsync(path string) error</a>

```
searchKey: testutil.fsync
tags: [method private]
```

```Go
func fsync(path string) error
```

### <a id="marshal" href="#marshal">func marshal(t testing.TB, v interface{}) []byte</a>

```
searchKey: testutil.marshal
tags: [method private]
```

```Go
func marshal(t testing.TB, v interface{}) []byte
```

### <a id="openGzipReader" href="#openGzipReader">func openGzipReader(name string) (io.ReadCloser, error)</a>

```
searchKey: testutil.openGzipReader
tags: [method private]
```

```Go
func openGzipReader(name string) (io.ReadCloser, error)
```

