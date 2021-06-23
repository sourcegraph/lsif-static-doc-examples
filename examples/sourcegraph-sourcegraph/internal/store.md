# Package store

## Index

* [Constants](#const)
    * [const maxFileSize](#maxFileSize)
* [Variables](#var)
    * [var cacheSizeBytes](#cacheSizeBytes)
    * [var evictions](#evictions)
    * [var fetching](#fetching)
    * [var fetchQueueSize](#fetchQueueSize)
    * [var fetchFailed](#fetchFailed)
* [Types](#type)
    * [type Store struct](#Store)
        * [func tmpStore(t *testing.T) (*Store, func())](#tmpStore)
        * [func (s *Store) Start()](#Store.Start)
        * [func (s *Store) PrepareZip(ctx context.Context, repo api.RepoName, commit api.CommitID) (path string, err error)](#Store.PrepareZip)
        * [func (s *Store) fetch(ctx context.Context, repo api.RepoName, commit api.CommitID, largeFilePatterns []string) (rc io.ReadCloser, err error)](#Store.fetch)
        * [func (s *Store) String() string](#Store.String)
        * [func (s *Store) watchAndEvict()](#Store.watchAndEvict)
        * [func (s *Store) watchConfig()](#Store.watchConfig)
    * [type FilterFunc func(hdr *archive/tar.Header) bool](#FilterFunc)
    * [type temporaryError struct](#temporaryError)
        * [func (temporaryError) Temporary() bool](#temporaryError.Temporary)
    * [type ZipCache struct](#ZipCache)
        * [func (c *ZipCache) shardFor(path string) *zipCacheShard](#ZipCache.shardFor)
        * [func (c *ZipCache) Get(path string) (*ZipFile, error)](#ZipCache.Get)
        * [func (c *ZipCache) delete(path string)](#ZipCache.delete)
        * [func (c *ZipCache) count() int](#ZipCache.count)
    * [type zipCacheShard struct](#zipCacheShard)
    * [type ZipFile struct](#ZipFile)
        * [func GetZipFileWithRetry(get func() (string, *ZipFile, error)) (validPath string, zf *ZipFile, err error)](#GetZipFileWithRetry)
        * [func readZipFile(path string) (*ZipFile, error)](#readZipFile)
        * [func MockZipFile(data []byte) (*ZipFile, error)](#MockZipFile)
        * [func (f *ZipFile) PopulateFiles(r *zip.Reader) error](#ZipFile.PopulateFiles)
        * [func (f *ZipFile) Close()](#ZipFile.Close)
        * [func (f *ZipFile) DataFor(s *SrcFile) []byte](#ZipFile.DataFor)
    * [type SrcFile struct](#SrcFile)
        * [func (f *SrcFile) String() string](#SrcFile.String)
* [Functions](#func)
    * [func copySearchable(tr *tar.Reader, zw *zip.Writer, largeFilePatterns []string, filter FilterFunc) error](#copySearchable)
    * [func ignoreSizeMax(name string, patterns []string) bool](#ignoreSizeMax)
    * [func TestGetZipFileWithRetry(t *testing.T)](#TestGetZipFileWithRetry)
    * [func TestPrepareZip(t *testing.T)](#TestPrepareZip)
    * [func TestPrepareZip_fetchTarFail(t *testing.T)](#TestPrepareZip_fetchTarFail)
    * [func TestPrepareZip_errHeader(t *testing.T)](#TestPrepareZip_errHeader)
    * [func TestIngoreSizeMax(t *testing.T)](#TestIngoreSizeMax)
    * [func emptyTar(t *testing.T) io.ReadCloser](#emptyTar)
    * [func TestZipCacheDelete(t *testing.T)](#TestZipCacheDelete)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="maxFileSize" href="#maxFileSize">const maxFileSize</a>

```
searchKey: store.maxFileSize
tags: [private]
```

```Go
const maxFileSize // 1MB; match https://sourcegraph.com/search?q=repo:%5Egithub%5C.com/sourcegraph/zoekt%24+%22-file_limit%22
 = ...
```

maxFileSize is the limit on file size in bytes. Only files smaller than this are searched. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="cacheSizeBytes" href="#cacheSizeBytes">var cacheSizeBytes</a>

```
searchKey: store.cacheSizeBytes
tags: [private]
```

```Go
var cacheSizeBytes = ...
```

### <a id="evictions" href="#evictions">var evictions</a>

```
searchKey: store.evictions
tags: [private]
```

```Go
var evictions = ...
```

### <a id="fetching" href="#fetching">var fetching</a>

```
searchKey: store.fetching
tags: [private]
```

```Go
var fetching = ...
```

### <a id="fetchQueueSize" href="#fetchQueueSize">var fetchQueueSize</a>

```
searchKey: store.fetchQueueSize
tags: [private]
```

```Go
var fetchQueueSize = ...
```

### <a id="fetchFailed" href="#fetchFailed">var fetchFailed</a>

```
searchKey: store.fetchFailed
tags: [private]
```

```Go
var fetchFailed = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: store.Store
```

```Go
type Store struct {
	// FetchTar returns an io.ReadCloser to a tar archive of a repository at the specified Git
	// remote URL and commit ID. If the error implements "BadRequest() bool", it will be used to
	// determine if the error is a bad request (eg invalid repo).
	FetchTar func(ctx context.Context, repo api.RepoName, commit api.CommitID) (io.ReadCloser, error)

	// FilterTar returns a FilterFunc that filters out files we don't want to write to disk
	FilterTar func(ctx context.Context, repo api.RepoName, commit api.CommitID) (FilterFunc, error)

	// Path is the directory to store the cache
	Path string

	// MaxCacheSizeBytes is the maximum size of the cache in bytes. Note:
	// We can temporarily be larger than MaxCacheSizeBytes. When we go
	// over MaxCacheSizeBytes we trigger delete files until we get below
	// MaxCacheSizeBytes.
	MaxCacheSizeBytes int64

	// once protects Start
	once sync.Once

	// cache is the disk backed cache.
	cache *diskcache.Store

	// fetchLimiter limits concurrent calls to FetchTar.
	fetchLimiter *mutablelimiter.Limiter

	// ZipCache provides efficient access to repo zip files.
	ZipCache ZipCache
}
```

Store manages the fetching and storing of git archives. Its main purpose is keeping a local disk cache of the fetched archives to help speed up future requests for the same archive. As a performance optimization, it is also responsible for filtering out files we receive from `git archive` that we do not want to search. 

We use an LRU to do cache eviction: * When to evict is based on the total size of *.zip on disk. * What to evict uses the LRU algorithm. * We touch files when opening them, so can do LRU based on file 

```
modification times.

```
Note: The store fetches tarballs but stores zips. We want to be able to filter which files we cache, so we need a format that supports streaming (tar). We want to be able to support random concurrent access for reading, so we store as a zip. 

#### <a id="tmpStore" href="#tmpStore">func tmpStore(t *testing.T) (*Store, func())</a>

```
searchKey: store.tmpStore
tags: [private]
```

```Go
func tmpStore(t *testing.T) (*Store, func())
```

#### <a id="Store.Start" href="#Store.Start">func (s *Store) Start()</a>

```
searchKey: store.Store.Start
```

```Go
func (s *Store) Start()
```

Start initializes state and starts background goroutines. It can be called more than once. It is optional to call, but starting it earlier avoids a search request paying the cost of initializing. 

#### <a id="Store.PrepareZip" href="#Store.PrepareZip">func (s *Store) PrepareZip(ctx context.Context, repo api.RepoName, commit api.CommitID) (path string, err error)</a>

```
searchKey: store.Store.PrepareZip
```

```Go
func (s *Store) PrepareZip(ctx context.Context, repo api.RepoName, commit api.CommitID) (path string, err error)
```

PrepareZip returns the path to a local zip archive of repo at commit. It will first consult the local cache, otherwise will fetch from the network. 

#### <a id="Store.fetch" href="#Store.fetch">func (s *Store) fetch(ctx context.Context, repo api.RepoName, commit api.CommitID, largeFilePatterns []string) (rc io.ReadCloser, err error)</a>

```
searchKey: store.Store.fetch
tags: [private]
```

```Go
func (s *Store) fetch(ctx context.Context, repo api.RepoName, commit api.CommitID, largeFilePatterns []string) (rc io.ReadCloser, err error)
```

fetch fetches an archive from the network and stores it on disk. It does not populate the in-memory cache. You should probably be calling prepareZip. 

#### <a id="Store.String" href="#Store.String">func (s *Store) String() string</a>

```
searchKey: store.Store.String
```

```Go
func (s *Store) String() string
```

#### <a id="Store.watchAndEvict" href="#Store.watchAndEvict">func (s *Store) watchAndEvict()</a>

```
searchKey: store.Store.watchAndEvict
tags: [private]
```

```Go
func (s *Store) watchAndEvict()
```

watchAndEvict is a loop which periodically checks the size of the cache and evicts/deletes items if the store gets too large. 

#### <a id="Store.watchConfig" href="#Store.watchConfig">func (s *Store) watchConfig()</a>

```
searchKey: store.Store.watchConfig
tags: [private]
```

```Go
func (s *Store) watchConfig()
```

watchConfig updates fetchLimiter as the number of gitservers change. 

### <a id="FilterFunc" href="#FilterFunc">type FilterFunc func(hdr *archive/tar.Header) bool</a>

```
searchKey: store.FilterFunc
```

```Go
type FilterFunc func(hdr *tar.Header) bool
```

FilterFunc filters tar files based on their header. Tar files for which FilterFunc evaluates to true are not stored in the target zip. 

### <a id="temporaryError" href="#temporaryError">type temporaryError struct</a>

```
searchKey: store.temporaryError
tags: [private]
```

```Go
type temporaryError struct {
	error
}
```

temporaryError wraps an error but adds the Temporary method. It does not implement Cause so that errors.Cause() returns an error which implements Temporary. 

#### <a id="temporaryError.Temporary" href="#temporaryError.Temporary">func (temporaryError) Temporary() bool</a>

```
searchKey: store.temporaryError.Temporary
tags: [private]
```

```Go
func (temporaryError) Temporary() bool
```

### <a id="ZipCache" href="#ZipCache">type ZipCache struct</a>

```
searchKey: store.ZipCache
```

```Go
type ZipCache struct {
	// Split the cache into many parts, to minimize lock contention.
	// This matters because, for simplicity,
	// we sometimes hold the lock for long-running operations,
	// such as reading a zip file from disk
	// or waiting for all users of a zip file to finish their work.
	// (The latter case should basically never block, since it only
	// occurs when a file is being deleted, and files are deleted
	// when no one has used them for a long time. Nevertheless, take care.)
	shards [64]zipCacheShard
}
```

A ZipCache is a shared data structure that provides efficient access to a collection of zip files. The zero value is usable. 

#### <a id="ZipCache.shardFor" href="#ZipCache.shardFor">func (c *ZipCache) shardFor(path string) *zipCacheShard</a>

```
searchKey: store.ZipCache.shardFor
tags: [private]
```

```Go
func (c *ZipCache) shardFor(path string) *zipCacheShard
```

#### <a id="ZipCache.Get" href="#ZipCache.Get">func (c *ZipCache) Get(path string) (*ZipFile, error)</a>

```
searchKey: store.ZipCache.Get
```

```Go
func (c *ZipCache) Get(path string) (*ZipFile, error)
```

Get returns a zipFile for the file on disk at path. The file MUST be Closed when it is no longer needed. 

#### <a id="ZipCache.delete" href="#ZipCache.delete">func (c *ZipCache) delete(path string)</a>

```
searchKey: store.ZipCache.delete
tags: [private]
```

```Go
func (c *ZipCache) delete(path string)
```

#### <a id="ZipCache.count" href="#ZipCache.count">func (c *ZipCache) count() int</a>

```
searchKey: store.ZipCache.count
tags: [private]
```

```Go
func (c *ZipCache) count() int
```

count returns the number of elements in c, assuming c is otherwise unused during the call to c. It is intended only for testing. 

### <a id="zipCacheShard" href="#zipCacheShard">type zipCacheShard struct</a>

```
searchKey: store.zipCacheShard
tags: [private]
```

```Go
type zipCacheShard struct {
	mu sync.Mutex
	m  map[string]*ZipFile // path -> zipFile
}
```

### <a id="ZipFile" href="#ZipFile">type ZipFile struct</a>

```
searchKey: store.ZipFile
```

```Go
type ZipFile struct {
	// Take care with the size of this struct.
	// There are many zipFiles present during typical usage.
	Files  []SrcFile
	MaxLen int
	Data   []byte
	f      *os.File
	wg     sync.WaitGroup // ensures underlying file is not munmap'd or closed while in use
}
```

ZipFile provides efficient access to a single zip file. 

#### <a id="GetZipFileWithRetry" href="#GetZipFileWithRetry">func GetZipFileWithRetry(get func() (string, *ZipFile, error)) (validPath string, zf *ZipFile, err error)</a>

```
searchKey: store.GetZipFileWithRetry
```

```Go
func GetZipFileWithRetry(get func() (string, *ZipFile, error)) (validPath string, zf *ZipFile, err error)
```

GetZipFileWithRetry retries getting a zip file if the zip is for some reason invalid. 

#### <a id="readZipFile" href="#readZipFile">func readZipFile(path string) (*ZipFile, error)</a>

```
searchKey: store.readZipFile
tags: [private]
```

```Go
func readZipFile(path string) (*ZipFile, error)
```

#### <a id="MockZipFile" href="#MockZipFile">func MockZipFile(data []byte) (*ZipFile, error)</a>

```
searchKey: store.MockZipFile
```

```Go
func MockZipFile(data []byte) (*ZipFile, error)
```

#### <a id="ZipFile.PopulateFiles" href="#ZipFile.PopulateFiles">func (f *ZipFile) PopulateFiles(r *zip.Reader) error</a>

```
searchKey: store.ZipFile.PopulateFiles
```

```Go
func (f *ZipFile) PopulateFiles(r *zip.Reader) error
```

#### <a id="ZipFile.Close" href="#ZipFile.Close">func (f *ZipFile) Close()</a>

```
searchKey: store.ZipFile.Close
```

```Go
func (f *ZipFile) Close()
```

Close allows resources associated with f to be released. It MUST be called exactly once for every file retrieved using get. Contents from any SrcFile from within f MUST NOT be used after Close has been called. 

#### <a id="ZipFile.DataFor" href="#ZipFile.DataFor">func (f *ZipFile) DataFor(s *SrcFile) []byte</a>

```
searchKey: store.ZipFile.DataFor
```

```Go
func (f *ZipFile) DataFor(s *SrcFile) []byte
```

Data returns the contents of s, which is a SrcFile in f. The contents MUST NOT be modified. It is not safe to use the contents after f has been Closed. 

### <a id="SrcFile" href="#SrcFile">type SrcFile struct</a>

```
searchKey: store.SrcFile
```

```Go
type SrcFile struct {
	// Take care with the size of this struct.
	// There will be *lots* of these in memory.
	// This is why Len is a 32 bit int.
	// (Note that this means that ZipCache cannot
	// handle files inside the zip archive bigger than 2gb.)
	Name string
	Off  int64
	Len  int32
}
```

A SrcFile is a single file inside a ZipFile. 

#### <a id="SrcFile.String" href="#SrcFile.String">func (f *SrcFile) String() string</a>

```
searchKey: store.SrcFile.String
```

```Go
func (f *SrcFile) String() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="copySearchable" href="#copySearchable">func copySearchable(tr *tar.Reader, zw *zip.Writer, largeFilePatterns []string, filter FilterFunc) error</a>

```
searchKey: store.copySearchable
tags: [private]
```

```Go
func copySearchable(tr *tar.Reader, zw *zip.Writer, largeFilePatterns []string, filter FilterFunc) error
```

copySearchable copies searchable files from tr to zw. A searchable file is any file that is under size limit, non-binary, and not matching the filter. 

### <a id="ignoreSizeMax" href="#ignoreSizeMax">func ignoreSizeMax(name string, patterns []string) bool</a>

```
searchKey: store.ignoreSizeMax
tags: [private]
```

```Go
func ignoreSizeMax(name string, patterns []string) bool
```

ignoreSizeMax determines whether the max size should be ignored. It uses the glob syntax found here: [https://golang.org/pkg/path/filepath/#Match](https://golang.org/pkg/path/filepath/#Match). 

### <a id="TestGetZipFileWithRetry" href="#TestGetZipFileWithRetry">func TestGetZipFileWithRetry(t *testing.T)</a>

```
searchKey: store.TestGetZipFileWithRetry
tags: [private]
```

```Go
func TestGetZipFileWithRetry(t *testing.T)
```

### <a id="TestPrepareZip" href="#TestPrepareZip">func TestPrepareZip(t *testing.T)</a>

```
searchKey: store.TestPrepareZip
tags: [private]
```

```Go
func TestPrepareZip(t *testing.T)
```

### <a id="TestPrepareZip_fetchTarFail" href="#TestPrepareZip_fetchTarFail">func TestPrepareZip_fetchTarFail(t *testing.T)</a>

```
searchKey: store.TestPrepareZip_fetchTarFail
tags: [private]
```

```Go
func TestPrepareZip_fetchTarFail(t *testing.T)
```

### <a id="TestPrepareZip_errHeader" href="#TestPrepareZip_errHeader">func TestPrepareZip_errHeader(t *testing.T)</a>

```
searchKey: store.TestPrepareZip_errHeader
tags: [private]
```

```Go
func TestPrepareZip_errHeader(t *testing.T)
```

### <a id="TestIngoreSizeMax" href="#TestIngoreSizeMax">func TestIngoreSizeMax(t *testing.T)</a>

```
searchKey: store.TestIngoreSizeMax
tags: [private]
```

```Go
func TestIngoreSizeMax(t *testing.T)
```

### <a id="emptyTar" href="#emptyTar">func emptyTar(t *testing.T) io.ReadCloser</a>

```
searchKey: store.emptyTar
tags: [private]
```

```Go
func emptyTar(t *testing.T) io.ReadCloser
```

### <a id="TestZipCacheDelete" href="#TestZipCacheDelete">func TestZipCacheDelete(t *testing.T)</a>

```
searchKey: store.TestZipCacheDelete
tags: [private]
```

```Go
func TestZipCacheDelete(t *testing.T)
```

TestZipCacheDelete ensures that zip cache deletion is correctly hooked up to cache eviction. 

