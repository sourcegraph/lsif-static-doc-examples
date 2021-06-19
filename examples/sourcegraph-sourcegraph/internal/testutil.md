# Package testutil

## Index

* [Types](#type)
    * [type gzipReadCloser struct](#gzipReadCloser)
        * [func (z *gzipReadCloser) Read(p []byte) (int, error)](#gzipReadCloser.Read)
        * [func (z *gzipReadCloser) Close() error](#gzipReadCloser.Close)
* [Functions](#func)
    * [func Diff(b1, b2 string) (string, error)](#Diff)
    * [func FetchTarFromGithub(ctx context.Context, repo api.RepoName, commit api.CommitID) (io.ReadCloser, error)](#FetchTarFromGithub)
    * [func openGzipReader(name string) (io.ReadCloser, error)](#openGzipReader)
    * [func fsync(path string) error](#fsync)
    * [func AssertGolden(t testing.TB, path string, update bool, want interface{})](#AssertGolden)
    * [func marshal(t testing.TB, v interface{}) []byte](#marshal)
    * [func NewStore(files map[string]string) (*store.Store, func(), error)](#NewStore)
    * [func addpaxheader(w *tar.Writer, body string) error](#addpaxheader)
    * [func CreateZip(files map[string]string) ([]byte, error)](#CreateZip)
    * [func MockZipFile(data []byte) (*store.ZipFile, error)](#MockZipFile)
    * [func TempZipFromFiles(files map[string]string) (path string, cleanup func(), err error)](#TempZipFromFiles)
    * [func TempZipFileOnDisk(data []byte) (string, func(), error)](#TempZipFileOnDisk)


## <a id="type" href="#type">Types</a>

### <a id="gzipReadCloser" href="#gzipReadCloser">type gzipReadCloser struct</a>

```
searchKey: testutil.gzipReadCloser
```

```Go
type gzipReadCloser struct {
	f *os.File
	r *gzip.Reader
}
```

#### <a id="gzipReadCloser.Read" href="#gzipReadCloser.Read">func (z *gzipReadCloser) Read(p []byte) (int, error)</a>

```
searchKey: testutil.gzipReadCloser.Read
```

```Go
func (z *gzipReadCloser) Read(p []byte) (int, error)
```

#### <a id="gzipReadCloser.Close" href="#gzipReadCloser.Close">func (z *gzipReadCloser) Close() error</a>

```
searchKey: testutil.gzipReadCloser.Close
```

```Go
func (z *gzipReadCloser) Close() error
```

## <a id="func" href="#func">Functions</a>

### <a id="Diff" href="#Diff">func Diff(b1, b2 string) (string, error)</a>

```
searchKey: testutil.Diff
tags: [exported]
```

```Go
func Diff(b1, b2 string) (string, error)
```

### <a id="FetchTarFromGithub" href="#FetchTarFromGithub">func FetchTarFromGithub(ctx context.Context, repo api.RepoName, commit api.CommitID) (io.ReadCloser, error)</a>

```
searchKey: testutil.FetchTarFromGithub
tags: [exported]
```

```Go
func FetchTarFromGithub(ctx context.Context, repo api.RepoName, commit api.CommitID) (io.ReadCloser, error)
```

### <a id="openGzipReader" href="#openGzipReader">func openGzipReader(name string) (io.ReadCloser, error)</a>

```
searchKey: testutil.openGzipReader
```

```Go
func openGzipReader(name string) (io.ReadCloser, error)
```

### <a id="fsync" href="#fsync">func fsync(path string) error</a>

```
searchKey: testutil.fsync
```

```Go
func fsync(path string) error
```

### <a id="AssertGolden" href="#AssertGolden">func AssertGolden(t testing.TB, path string, update bool, want interface{})</a>

```
searchKey: testutil.AssertGolden
tags: [exported]
```

```Go
func AssertGolden(t testing.TB, path string, update bool, want interface{})
```

### <a id="marshal" href="#marshal">func marshal(t testing.TB, v interface{}) []byte</a>

```
searchKey: testutil.marshal
```

```Go
func marshal(t testing.TB, v interface{}) []byte
```

### <a id="NewStore" href="#NewStore">func NewStore(files map[string]string) (*store.Store, func(), error)</a>

```
searchKey: testutil.NewStore
tags: [exported]
```

```Go
func NewStore(files map[string]string) (*store.Store, func(), error)
```

### <a id="addpaxheader" href="#addpaxheader">func addpaxheader(w *tar.Writer, body string) error</a>

```
searchKey: testutil.addpaxheader
```

```Go
func addpaxheader(w *tar.Writer, body string) error
```

### <a id="CreateZip" href="#CreateZip">func CreateZip(files map[string]string) ([]byte, error)</a>

```
searchKey: testutil.CreateZip
tags: [exported]
```

```Go
func CreateZip(files map[string]string) ([]byte, error)
```

### <a id="MockZipFile" href="#MockZipFile">func MockZipFile(data []byte) (*store.ZipFile, error)</a>

```
searchKey: testutil.MockZipFile
tags: [exported]
```

```Go
func MockZipFile(data []byte) (*store.ZipFile, error)
```

### <a id="TempZipFromFiles" href="#TempZipFromFiles">func TempZipFromFiles(files map[string]string) (path string, cleanup func(), err error)</a>

```
searchKey: testutil.TempZipFromFiles
tags: [exported]
```

```Go
func TempZipFromFiles(files map[string]string) (path string, cleanup func(), err error)
```

### <a id="TempZipFileOnDisk" href="#TempZipFileOnDisk">func TempZipFileOnDisk(data []byte) (string, func(), error)</a>

```
searchKey: testutil.TempZipFileOnDisk
tags: [exported]
```

```Go
func TempZipFileOnDisk(data []byte) (string, func(), error)
```
