# Package vfsutil

## Index

* [Constants](#const)
    * [const ArchiveFormatTar](#ArchiveFormatTar)
    * [const ArchiveFormatZip](#ArchiveFormatZip)
* [Variables](#var)
    * [var ArchiveCacheDir](#ArchiveCacheDir)
    * [var cachedFileEvict](#cachedFileEvict)
    * [var ghFetch](#ghFetch)
    * [var ghFetchFailed](#ghFetchFailed)
    * [var githubRepoRx](#githubRepoRx)
    * [var gitserverFetchFailedTotal](#gitserverFetchFailedTotal)
    * [var gitserverFetchTotal](#gitserverFetchTotal)
    * [var initOnce](#initOnce)
* [Types](#type)
    * [type ArchiveFS struct](#ArchiveFS)
        * [func NewGitHubRepoVFS(repo, rev string) (*ArchiveFS, error)](#NewGitHubRepoVFS)
        * [func NewGitServer(repo api.RepoName, commit api.CommitID) *ArchiveFS](#NewGitServer)
        * [func NewZipVFS(url string, onFetchStart, onFetchFailed func(), evictOnClose bool) (*ArchiveFS, error)](#NewZipVFS)
        * [func (fs *ArchiveFS) Close() error](#ArchiveFS.Close)
        * [func (fs *ArchiveFS) ListAllFiles(ctx context.Context) ([]string, error)](#ArchiveFS.ListAllFiles)
        * [func (fs *ArchiveFS) Lstat(ctx context.Context, path string) (fs.FileInfo, error)](#ArchiveFS.Lstat)
        * [func (fs *ArchiveFS) Open(ctx context.Context, name string) (ctxvfs.ReadSeekCloser, error)](#ArchiveFS.Open)
        * [func (fs *ArchiveFS) ReadDir(ctx context.Context, path string) ([]fs.FileInfo, error)](#ArchiveFS.ReadDir)
        * [func (fs *ArchiveFS) Stat(ctx context.Context, path string) (fs.FileInfo, error)](#ArchiveFS.Stat)
        * [func (fs *ArchiveFS) String() string](#ArchiveFS.String)
        * [func (fs *ArchiveFS) fetchOrWait(ctx context.Context) error](#ArchiveFS.fetchOrWait)
    * [type ArchiveFormat string](#ArchiveFormat)
    * [type ArchiveOpts struct](#ArchiveOpts)
        * [func (opts *ArchiveOpts) cacheKey() string](#ArchiveOpts.cacheKey)
    * [type Evicter interface](#Evicter)
        * [func GitServerFetchArchive(ctx context.Context, opts ArchiveOpts) (archive *os.File, cacheEvicter Evicter, err error)](#GitServerFetchArchive)
    * [type archiveReader struct](#archiveReader)
    * [type cachedFile struct](#cachedFile)
        * [func cachedFetch(ctx context.Context, component, key string, fetcher func(context.Context) (io.ReadCloser, error)) (ff *cachedFile, err error)](#cachedFetch)
        * [func (f *cachedFile) Evict()](#cachedFile.Evict)
* [Functions](#func)
    * [func TestGitHubRepoVFS(t *testing.T)](#TestGitHubRepoVFS)
    * [func initArchiveCacheDir()](#initArchiveCacheDir)
    * [func testVFS(t *testing.T, fs ctxvfs.FileSystem, want map[string]string)](#testVFS)
    * [func useEmptyArchiveCacheDir() func()](#useEmptyArchiveCacheDir)
    * [func zipNewFileReader(f *os.File) (*zip.Reader, error)](#zipNewFileReader)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="ArchiveFormatTar" href="#ArchiveFormatTar">const ArchiveFormatTar</a>

```
searchKey: vfsutil.ArchiveFormatTar
tags: [constant string]
```

```Go
const ArchiveFormatTar ArchiveFormat = "tar"
```

ArchiveFormatTar indicates a tar archive is desired. 

### <a id="ArchiveFormatZip" href="#ArchiveFormatZip">const ArchiveFormatZip</a>

```
searchKey: vfsutil.ArchiveFormatZip
tags: [constant string]
```

```Go
const ArchiveFormatZip ArchiveFormat = "zip"
```

ArchiveFormatZip indicates a zip archive is desired. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ArchiveCacheDir" href="#ArchiveCacheDir">var ArchiveCacheDir</a>

```
searchKey: vfsutil.ArchiveCacheDir
tags: [variable string]
```

```Go
var ArchiveCacheDir = "/tmp/vfsutil-archive-cache"
```

ArchiveCacheDir is the location on disk that archives are cached. It is configurable so that in production we can point it into CACHE_DIR. 

### <a id="cachedFileEvict" href="#cachedFileEvict">var cachedFileEvict</a>

```
searchKey: vfsutil.cachedFileEvict
tags: [variable interface private]
```

```Go
var cachedFileEvict = ...
```

### <a id="ghFetch" href="#ghFetch">var ghFetch</a>

```
searchKey: vfsutil.ghFetch
tags: [variable interface private]
```

```Go
var ghFetch = ...
```

### <a id="ghFetchFailed" href="#ghFetchFailed">var ghFetchFailed</a>

```
searchKey: vfsutil.ghFetchFailed
tags: [variable interface private]
```

```Go
var ghFetchFailed = ...
```

### <a id="githubRepoRx" href="#githubRepoRx">var githubRepoRx</a>

```
searchKey: vfsutil.githubRepoRx
tags: [variable struct private]
```

```Go
var githubRepoRx = lazyregexp.New(`^github\.com/[\w.-]{1,100}/[\w.-]{1,100}$`)
```

### <a id="gitserverFetchFailedTotal" href="#gitserverFetchFailedTotal">var gitserverFetchFailedTotal</a>

```
searchKey: vfsutil.gitserverFetchFailedTotal
tags: [variable interface private]
```

```Go
var gitserverFetchFailedTotal = ...
```

### <a id="gitserverFetchTotal" href="#gitserverFetchTotal">var gitserverFetchTotal</a>

```
searchKey: vfsutil.gitserverFetchTotal
tags: [variable interface private]
```

```Go
var gitserverFetchTotal = ...
```

### <a id="initOnce" href="#initOnce">var initOnce</a>

```
searchKey: vfsutil.initOnce
tags: [variable struct private]
```

```Go
var initOnce sync.Once
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ArchiveFS" href="#ArchiveFS">type ArchiveFS struct</a>

```
searchKey: vfsutil.ArchiveFS
tags: [struct]
```

```Go
type ArchiveFS struct {
	fetch func(context.Context) (*archiveReader, error)

	// EvictOnClose when true will evict the underlying archive from the
	// archive cache when closed.
	EvictOnClose bool

	once sync.Once
	err  error // the error encountered during the fetch call (if any)
	ar   *archiveReader
	fs   vfs.FileSystem // the zipfs virtual file system

	// We have a mutex for closed to prevent Close and fetch racing.
	closedMu sync.Mutex
	closed   bool
}
```

ArchiveFS is a ctxvfs.FileSystem backed by an Archiver. 

#### <a id="NewGitHubRepoVFS" href="#NewGitHubRepoVFS">func NewGitHubRepoVFS(repo, rev string) (*ArchiveFS, error)</a>

```
searchKey: vfsutil.NewGitHubRepoVFS
tags: [function]
```

```Go
func NewGitHubRepoVFS(repo, rev string) (*ArchiveFS, error)
```

NewGitHubRepoVFS creates a new VFS backed by a GitHub downloadable repository archive. 

#### <a id="NewGitServer" href="#NewGitServer">func NewGitServer(repo api.RepoName, commit api.CommitID) *ArchiveFS</a>

```
searchKey: vfsutil.NewGitServer
tags: [function]
```

```Go
func NewGitServer(repo api.RepoName, commit api.CommitID) *ArchiveFS
```

NewGitServer returns a VFS to repo at commit. It is backed by an archive fetched from gitserver. 

#### <a id="NewZipVFS" href="#NewZipVFS">func NewZipVFS(url string, onFetchStart, onFetchFailed func(), evictOnClose bool) (*ArchiveFS, error)</a>

```
searchKey: vfsutil.NewZipVFS
tags: [function]
```

```Go
func NewZipVFS(url string, onFetchStart, onFetchFailed func(), evictOnClose bool) (*ArchiveFS, error)
```

NewZipVFS downloads a zip archive from a URL (or fetches from the local cache on disk) and returns a new VFS backed by that zip archive. 

#### <a id="ArchiveFS.Close" href="#ArchiveFS.Close">func (fs *ArchiveFS) Close() error</a>

```
searchKey: vfsutil.ArchiveFS.Close
tags: [method]
```

```Go
func (fs *ArchiveFS) Close() error
```

#### <a id="ArchiveFS.ListAllFiles" href="#ArchiveFS.ListAllFiles">func (fs *ArchiveFS) ListAllFiles(ctx context.Context) ([]string, error)</a>

```
searchKey: vfsutil.ArchiveFS.ListAllFiles
tags: [method]
```

```Go
func (fs *ArchiveFS) ListAllFiles(ctx context.Context) ([]string, error)
```

#### <a id="ArchiveFS.Lstat" href="#ArchiveFS.Lstat">func (fs *ArchiveFS) Lstat(ctx context.Context, path string) (fs.FileInfo, error)</a>

```
searchKey: vfsutil.ArchiveFS.Lstat
tags: [method]
```

```Go
func (fs *ArchiveFS) Lstat(ctx context.Context, path string) (fs.FileInfo, error)
```

#### <a id="ArchiveFS.Open" href="#ArchiveFS.Open">func (fs *ArchiveFS) Open(ctx context.Context, name string) (ctxvfs.ReadSeekCloser, error)</a>

```
searchKey: vfsutil.ArchiveFS.Open
tags: [method]
```

```Go
func (fs *ArchiveFS) Open(ctx context.Context, name string) (ctxvfs.ReadSeekCloser, error)
```

#### <a id="ArchiveFS.ReadDir" href="#ArchiveFS.ReadDir">func (fs *ArchiveFS) ReadDir(ctx context.Context, path string) ([]fs.FileInfo, error)</a>

```
searchKey: vfsutil.ArchiveFS.ReadDir
tags: [method]
```

```Go
func (fs *ArchiveFS) ReadDir(ctx context.Context, path string) ([]fs.FileInfo, error)
```

#### <a id="ArchiveFS.Stat" href="#ArchiveFS.Stat">func (fs *ArchiveFS) Stat(ctx context.Context, path string) (fs.FileInfo, error)</a>

```
searchKey: vfsutil.ArchiveFS.Stat
tags: [method]
```

```Go
func (fs *ArchiveFS) Stat(ctx context.Context, path string) (fs.FileInfo, error)
```

#### <a id="ArchiveFS.String" href="#ArchiveFS.String">func (fs *ArchiveFS) String() string</a>

```
searchKey: vfsutil.ArchiveFS.String
tags: [method]
```

```Go
func (fs *ArchiveFS) String() string
```

#### <a id="ArchiveFS.fetchOrWait" href="#ArchiveFS.fetchOrWait">func (fs *ArchiveFS) fetchOrWait(ctx context.Context) error</a>

```
searchKey: vfsutil.ArchiveFS.fetchOrWait
tags: [method private]
```

```Go
func (fs *ArchiveFS) fetchOrWait(ctx context.Context) error
```

fetchOrWait initiates the fetch if it has not yet started. Otherwise it waits for it to finish. 

### <a id="ArchiveFormat" href="#ArchiveFormat">type ArchiveFormat string</a>

```
searchKey: vfsutil.ArchiveFormat
tags: [string]
```

```Go
type ArchiveFormat string
```

ArchiveFormat represents an archive format (zip, tar, etc). 

### <a id="ArchiveOpts" href="#ArchiveOpts">type ArchiveOpts struct</a>

```
searchKey: vfsutil.ArchiveOpts
tags: [struct]
```

```Go
type ArchiveOpts struct {
	// Repo is the repository whose contents should be fetched.
	Repo api.RepoName

	// Commit is the commit whose contents should be fetched.
	Commit api.CommitID

	// Format indicates the desired archive format.
	Format ArchiveFormat

	// RelativePath indicates the path of the repository that should be archived.
	RelativePath string
}
```

ArchiveOpts describes options for fetching a repository archive. 

#### <a id="ArchiveOpts.cacheKey" href="#ArchiveOpts.cacheKey">func (opts *ArchiveOpts) cacheKey() string</a>

```
searchKey: vfsutil.ArchiveOpts.cacheKey
tags: [method private]
```

```Go
func (opts *ArchiveOpts) cacheKey() string
```

### <a id="Evicter" href="#Evicter">type Evicter interface</a>

```
searchKey: vfsutil.Evicter
tags: [interface]
```

```Go
type Evicter interface {
	// Evict evicts an item from a cache.
	Evict()
}
```

Evicter implements Evict 

#### <a id="GitServerFetchArchive" href="#GitServerFetchArchive">func GitServerFetchArchive(ctx context.Context, opts ArchiveOpts) (archive *os.File, cacheEvicter Evicter, err error)</a>

```
searchKey: vfsutil.GitServerFetchArchive
tags: [function]
```

```Go
func GitServerFetchArchive(ctx context.Context, opts ArchiveOpts) (archive *os.File, cacheEvicter Evicter, err error)
```

GitServerFetchArchive fetches an archive of a repositories contents from gitserver. 

### <a id="archiveReader" href="#archiveReader">type archiveReader struct</a>

```
searchKey: vfsutil.archiveReader
tags: [struct private]
```

```Go
type archiveReader struct {
	*zip.Reader
	io.Closer
	Evicter

	// StripTopLevelDir specifies whether or not to strip the top level
	// directory in the zip archive (e.g. GitHub archives always have 1 top
	// level directory "{repobasename}-{sha}/").
	StripTopLevelDir bool

	// prefix is the name of the directory that was stripped from the archive
	// (or "" if nothing was stripped).
	prefix string
}
```

archiveReader is like zip.ReadCloser, but it allows us to use a custom closer. 

### <a id="cachedFile" href="#cachedFile">type cachedFile struct</a>

```
searchKey: vfsutil.cachedFile
tags: [struct private]
```

```Go
type cachedFile struct {
	// File is an open FD to the fetched data
	File *os.File

	// path is the disk path for File
	path string
}
```

#### <a id="cachedFetch" href="#cachedFetch">func cachedFetch(ctx context.Context, component, key string, fetcher func(context.Context) (io.ReadCloser, error)) (ff *cachedFile, err error)</a>

```
searchKey: vfsutil.cachedFetch
tags: [function private]
```

```Go
func cachedFetch(ctx context.Context, component, key string, fetcher func(context.Context) (io.ReadCloser, error)) (ff *cachedFile, err error)
```

cachedFetch will open a file from the local cache with key. If missing, fetcher will fill the cache first. cachedFetch also performs single-flighting. 

#### <a id="cachedFile.Evict" href="#cachedFile.Evict">func (f *cachedFile) Evict()</a>

```
searchKey: vfsutil.cachedFile.Evict
tags: [method private]
```

```Go
func (f *cachedFile) Evict()
```

Evict will remove the file from the cache. It does not close File. It also does not protect against other open readers or concurrent fetches. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestGitHubRepoVFS" href="#TestGitHubRepoVFS">func TestGitHubRepoVFS(t *testing.T)</a>

```
searchKey: vfsutil.TestGitHubRepoVFS
tags: [function private test]
```

```Go
func TestGitHubRepoVFS(t *testing.T)
```

### <a id="initArchiveCacheDir" href="#initArchiveCacheDir">func initArchiveCacheDir()</a>

```
searchKey: vfsutil.initArchiveCacheDir
tags: [function private]
```

```Go
func initArchiveCacheDir()
```

### <a id="testVFS" href="#testVFS">func testVFS(t *testing.T, fs ctxvfs.FileSystem, want map[string]string)</a>

```
searchKey: vfsutil.testVFS
tags: [function private]
```

```Go
func testVFS(t *testing.T, fs ctxvfs.FileSystem, want map[string]string)
```

### <a id="useEmptyArchiveCacheDir" href="#useEmptyArchiveCacheDir">func useEmptyArchiveCacheDir() func()</a>

```
searchKey: vfsutil.useEmptyArchiveCacheDir
tags: [function private]
```

```Go
func useEmptyArchiveCacheDir() func()
```

### <a id="zipNewFileReader" href="#zipNewFileReader">func zipNewFileReader(f *os.File) (*zip.Reader, error)</a>

```
searchKey: vfsutil.zipNewFileReader
tags: [function private]
```

```Go
func zipNewFileReader(f *os.File) (*zip.Reader, error)
```

