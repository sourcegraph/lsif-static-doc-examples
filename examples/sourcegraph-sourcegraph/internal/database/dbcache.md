# Package dbcache

## Index

* [Constants](#const)
    * [const defaultReposMaxAge](#defaultReposMaxAge)
* [Types](#type)
    * [type DefaultRepoLister struct](#DefaultRepoLister)
        * [func NewDefaultRepoLister(store *database.RepoStore) *DefaultRepoLister](#NewDefaultRepoLister)
        * [func (s *DefaultRepoLister) List(ctx context.Context) (results []types.RepoName, err error)](#DefaultRepoLister.List)
        * [func (s *DefaultRepoLister) ListPublic(ctx context.Context) (results []types.RepoName, err error)](#DefaultRepoLister.ListPublic)
        * [func (s *DefaultRepoLister) list(ctx context.Context, onlyPublic bool) (results []types.RepoName, err error)](#DefaultRepoLister.list)
        * [func (s *DefaultRepoLister) refreshCache(ctx context.Context, onlyPublic bool) ([]types.RepoName, error)](#DefaultRepoLister.refreshCache)
    * [type cachedRepos struct](#cachedRepos)
        * [func (c *cachedRepos) Repos() ([]types.RepoName, bool)](#cachedRepos.Repos)
* [Functions](#func)
    * [func BenchmarkDefaultRepos_List_Empty(b *testing.B)](#BenchmarkDefaultRepos_List_Empty)
    * [func TestListDefaultRepos(t *testing.T)](#TestListDefaultRepos)
    * [func init()](#init.main_test.go)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="defaultReposMaxAge" href="#defaultReposMaxAge">const defaultReposMaxAge</a>

```
searchKey: dbcache.defaultReposMaxAge
tags: [constant number private]
```

```Go
const defaultReposMaxAge = time.Minute
```

defaultReposMaxAge is how long we cache the list of default repos. The list changes very rarely, so we can cache for a while. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="DefaultRepoLister" href="#DefaultRepoLister">type DefaultRepoLister struct</a>

```
searchKey: dbcache.DefaultRepoLister
tags: [struct]
```

```Go
type DefaultRepoLister struct {
	store *database.RepoStore

	cacheAllRepos    atomic.Value
	cachePublicRepos atomic.Value
	mu               sync.Mutex
}
```

DefaultRepoLister holds the list of default repos which are cached for defaultReposMaxAge. 

#### <a id="NewDefaultRepoLister" href="#NewDefaultRepoLister">func NewDefaultRepoLister(store *database.RepoStore) *DefaultRepoLister</a>

```
searchKey: dbcache.NewDefaultRepoLister
tags: [function]
```

```Go
func NewDefaultRepoLister(store *database.RepoStore) *DefaultRepoLister
```

#### <a id="DefaultRepoLister.List" href="#DefaultRepoLister.List">func (s *DefaultRepoLister) List(ctx context.Context) (results []types.RepoName, err error)</a>

```
searchKey: dbcache.DefaultRepoLister.List
tags: [method]
```

```Go
func (s *DefaultRepoLister) List(ctx context.Context) (results []types.RepoName, err error)
```

List lists ALL default repos. These include anything in the default_repos table, user added repos (both public and private) as well as any repos added to the user_public_repos table. 

The values are cached for up to defaultReposMaxAge. If the cache has expired, we return stale data and start a background refresh. 

#### <a id="DefaultRepoLister.ListPublic" href="#DefaultRepoLister.ListPublic">func (s *DefaultRepoLister) ListPublic(ctx context.Context) (results []types.RepoName, err error)</a>

```
searchKey: dbcache.DefaultRepoLister.ListPublic
tags: [method]
```

```Go
func (s *DefaultRepoLister) ListPublic(ctx context.Context) (results []types.RepoName, err error)
```

ListPublic is similar to List except that it only includes public repos. 

#### <a id="DefaultRepoLister.list" href="#DefaultRepoLister.list">func (s *DefaultRepoLister) list(ctx context.Context, onlyPublic bool) (results []types.RepoName, err error)</a>

```
searchKey: dbcache.DefaultRepoLister.list
tags: [method private]
```

```Go
func (s *DefaultRepoLister) list(ctx context.Context, onlyPublic bool) (results []types.RepoName, err error)
```

#### <a id="DefaultRepoLister.refreshCache" href="#DefaultRepoLister.refreshCache">func (s *DefaultRepoLister) refreshCache(ctx context.Context, onlyPublic bool) ([]types.RepoName, error)</a>

```
searchKey: dbcache.DefaultRepoLister.refreshCache
tags: [method private]
```

```Go
func (s *DefaultRepoLister) refreshCache(ctx context.Context, onlyPublic bool) ([]types.RepoName, error)
```

### <a id="cachedRepos" href="#cachedRepos">type cachedRepos struct</a>

```
searchKey: dbcache.cachedRepos
tags: [struct private]
```

```Go
type cachedRepos struct {
	repos   []types.RepoName
	fetched time.Time
}
```

#### <a id="cachedRepos.Repos" href="#cachedRepos.Repos">func (c *cachedRepos) Repos() ([]types.RepoName, bool)</a>

```
searchKey: dbcache.cachedRepos.Repos
tags: [method private]
```

```Go
func (c *cachedRepos) Repos() ([]types.RepoName, bool)
```

Repos returns the current cached repos and boolean value indicating whether an update is required 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkDefaultRepos_List_Empty" href="#BenchmarkDefaultRepos_List_Empty">func BenchmarkDefaultRepos_List_Empty(b *testing.B)</a>

```
searchKey: dbcache.BenchmarkDefaultRepos_List_Empty
tags: [function private benchmark]
```

```Go
func BenchmarkDefaultRepos_List_Empty(b *testing.B)
```

### <a id="TestListDefaultRepos" href="#TestListDefaultRepos">func TestListDefaultRepos(t *testing.T)</a>

```
searchKey: dbcache.TestListDefaultRepos
tags: [function private test]
```

```Go
func TestListDefaultRepos(t *testing.T)
```

### <a id="init.main_test.go" href="#init.main_test.go">func init()</a>

```
searchKey: dbcache.init
tags: [function private]
```

```Go
func init()
```

