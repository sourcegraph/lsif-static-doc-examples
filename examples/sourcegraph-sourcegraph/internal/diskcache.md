# Package diskcache

## Index

* [Variables](#var)
    * [var urlMusMu](#urlMusMu)
    * [var urlMus](#urlMus)
* [Types](#type)
    * [type Store struct](#Store)
        * [func (s *Store) Open(ctx context.Context, key string, fetcher Fetcher) (file *File, err error)](#Store.Open)
        * [func (s *Store) OpenWithPath(ctx context.Context, key string, fetcher FetcherWithPath) (file *File, err error)](#Store.OpenWithPath)
        * [func (s *Store) path(key string) string](#Store.path)
        * [func (s *Store) Evict(maxCacheSizeBytes int64) (stats EvictStats, err error)](#Store.Evict)
    * [type File struct](#File)
        * [func doFetch(ctx context.Context, path string, fetcher FetcherWithPath) (file *File, err error)](#doFetch)
    * [type Fetcher func(context.Context) (io.ReadCloser, error)](#Fetcher)
    * [type FetcherWithPath func(context.Context, string) error](#FetcherWithPath)
    * [type EvictStats struct](#EvictStats)
* [Functions](#func)
    * [func copyAndClose(dst io.WriteCloser, src io.ReadCloser) error](#copyAndClose)
    * [func touch(path string)](#touch)
    * [func fsync(path string) error](#fsync)
    * [func urlMu(path string) *sync.Mutex](#urlMu)
    * [func TestOpen(t *testing.T)](#TestOpen)


## <a id="var" href="#var">Variables</a>

### <a id="urlMusMu" href="#urlMusMu">var urlMusMu</a>

```
searchKey: diskcache.urlMusMu
```

```Go
var urlMusMu sync.Mutex
```

### <a id="urlMus" href="#urlMus">var urlMus</a>

```
searchKey: diskcache.urlMus
```

```Go
var urlMus = map[string]*sync.Mutex{}
```

## <a id="type" href="#type">Types</a>

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: diskcache.Store
tags: [exported]
```

```Go
type Store struct {
	// Dir is the directory to cache items.
	Dir string

	// Component when set is reported to OpenTracing as the component.
	Component string

	// BackgroundTimeout when non-zero will do fetches in the background with
	// a timeout. This means the context passed to fetch will be
	// context.WithTimeout(context.Background(), BackgroundTimeout). When not
	// set fetches are done with the passed in context.
	BackgroundTimeout time.Duration

	// BeforeEvict, when non-nil, is a function to call before evicting a file.
	// It is passed the path to the file to be evicted.
	BeforeEvict func(string)
}
```

Store is an on disk cache, with items cached via calls to Open. 

#### <a id="Store.Open" href="#Store.Open">func (s *Store) Open(ctx context.Context, key string, fetcher Fetcher) (file *File, err error)</a>

```
searchKey: diskcache.Store.Open
tags: [exported]
```

```Go
func (s *Store) Open(ctx context.Context, key string, fetcher Fetcher) (file *File, err error)
```

Open will open a file from the local cache with key. If missing, fetcher will fill the cache first. Open also performs single-flighting for fetcher. 

#### <a id="Store.OpenWithPath" href="#Store.OpenWithPath">func (s *Store) OpenWithPath(ctx context.Context, key string, fetcher FetcherWithPath) (file *File, err error)</a>

```
searchKey: diskcache.Store.OpenWithPath
tags: [exported]
```

```Go
func (s *Store) OpenWithPath(ctx context.Context, key string, fetcher FetcherWithPath) (file *File, err error)
```

OpenWithPath will open a file from the local cache with key. If missing, fetcher will fill the cache first. Open also performs single-flighting for fetcher. 

#### <a id="Store.path" href="#Store.path">func (s *Store) path(key string) string</a>

```
searchKey: diskcache.Store.path
```

```Go
func (s *Store) path(key string) string
```

path returns the path for key. 

#### <a id="Store.Evict" href="#Store.Evict">func (s *Store) Evict(maxCacheSizeBytes int64) (stats EvictStats, err error)</a>

```
searchKey: diskcache.Store.Evict
tags: [exported]
```

```Go
func (s *Store) Evict(maxCacheSizeBytes int64) (stats EvictStats, err error)
```

Evict will remove files from Store.Dir until it is smaller than maxCacheSizeBytes. It evicts files with the oldest modification time first. 

### <a id="File" href="#File">type File struct</a>

```
searchKey: diskcache.File
tags: [exported]
```

```Go
type File struct {
	*os.File

	// The Path on disk for File
	Path string
}
```

File is an os.File, but includes the Path 

#### <a id="doFetch" href="#doFetch">func doFetch(ctx context.Context, path string, fetcher FetcherWithPath) (file *File, err error)</a>

```
searchKey: diskcache.doFetch
```

```Go
func doFetch(ctx context.Context, path string, fetcher FetcherWithPath) (file *File, err error)
```

### <a id="Fetcher" href="#Fetcher">type Fetcher func(context.Context) (io.ReadCloser, error)</a>

```
searchKey: diskcache.Fetcher
tags: [exported]
```

```Go
type Fetcher func(context.Context) (io.ReadCloser, error)
```

Fetcher returns a ReadCloser. It is used by Open if the key is not in the cache. 

### <a id="FetcherWithPath" href="#FetcherWithPath">type FetcherWithPath func(context.Context, string) error</a>

```
searchKey: diskcache.FetcherWithPath
tags: [exported]
```

```Go
type FetcherWithPath func(context.Context, string) error
```

FetcherWithPath writes a cache entry to the given file. It is used by Open if the key is not in the cache. 

### <a id="EvictStats" href="#EvictStats">type EvictStats struct</a>

```
searchKey: diskcache.EvictStats
tags: [exported]
```

```Go
type EvictStats struct {
	// CacheSize is the size of the cache before evicting.
	CacheSize int64

	// Evicted is the number of items evicted.
	Evicted int
}
```

EvictStats is information gathered during Evict. 

## <a id="func" href="#func">Functions</a>

### <a id="copyAndClose" href="#copyAndClose">func copyAndClose(dst io.WriteCloser, src io.ReadCloser) error</a>

```
searchKey: diskcache.copyAndClose
```

```Go
func copyAndClose(dst io.WriteCloser, src io.ReadCloser) error
```

### <a id="touch" href="#touch">func touch(path string)</a>

```
searchKey: diskcache.touch
```

```Go
func touch(path string)
```

touch updates the modified time to time.Now(). It is best-effort, and will log if it fails. 

### <a id="fsync" href="#fsync">func fsync(path string) error</a>

```
searchKey: diskcache.fsync
```

```Go
func fsync(path string) error
```

### <a id="urlMu" href="#urlMu">func urlMu(path string) *sync.Mutex</a>

```
searchKey: diskcache.urlMu
```

```Go
func urlMu(path string) *sync.Mutex
```

### <a id="TestOpen" href="#TestOpen">func TestOpen(t *testing.T)</a>

```
searchKey: diskcache.TestOpen
```

```Go
func TestOpen(t *testing.T)
```

