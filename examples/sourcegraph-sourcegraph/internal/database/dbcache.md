# Package dbcache

## Index

* [Constants](#const)
    * [const defaultReposMaxAge](#defaultReposMaxAge)
* [Types](#type)
    * [type cachedRepos struct](#cachedRepos)
        * [func (c *cachedRepos) Repos() ([]types.RepoName, bool)](#cachedRepos.Repos)
    * [type DefaultRepoLister struct](#DefaultRepoLister)
        * [func NewDefaultRepoLister(store *database.RepoStore) *DefaultRepoLister](#NewDefaultRepoLister)
        * [func (s *DefaultRepoLister) List(ctx context.Context) (results []types.RepoName, err error)](#DefaultRepoLister.List)
        * [func (s *DefaultRepoLister) ListPublic(ctx context.Context) (results []types.RepoName, err error)](#DefaultRepoLister.ListPublic)
        * [func (s *DefaultRepoLister) list(ctx context.Context, onlyPublic bool) (results []types.RepoName, err error)](#DefaultRepoLister.list)
        * [func (s *DefaultRepoLister) refreshCache(ctx context.Context, onlyPublic bool) ([]types.RepoName, error)](#DefaultRepoLister.refreshCache)
* [Functions](#func)
    * [func TestListDefaultRepos(t *testing.T)](#TestListDefaultRepos)
    * [func BenchmarkDefaultRepos_List_Empty(b *testing.B)](#BenchmarkDefaultRepos_List_Empty)
    * [func init()](#init)


## <a id="const" href="#const">Constants</a>

### <a id="defaultReposMaxAge" href="#defaultReposMaxAge">const defaultReposMaxAge</a>

```
searchKey: dbcache.defaultReposMaxAge
```

```Go
const defaultReposMaxAge = time.Minute
```

defaultReposMaxAge is how long we cache the list of default repos. The list changes very rarely, so we can cache for a while. 

## <a id="type" href="#type">Types</a>

### <a id="cachedRepos" href="#cachedRepos">type cachedRepos struct</a>

```
searchKey: dbcache.cachedRepos
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
```

```Go
func (c *cachedRepos) Repos() ([]types.RepoName, bool)
```

Repos returns the current cached repos and boolean value indicating whether an update is required 

### <a id="DefaultRepoLister" href="#DefaultRepoLister">type DefaultRepoLister struct</a>

```
searchKey: dbcache.DefaultRepoLister
tags: [exported]
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
tags: [exported]
```

```Go
func NewDefaultRepoLister(store *database.RepoStore) *DefaultRepoLister
```

#### <a id="DefaultRepoLister.List" href="#DefaultRepoLister.List">func (s *DefaultRepoLister) List(ctx context.Context) (results []types.RepoName, err error)</a>

```
searchKey: dbcache.DefaultRepoLister.List
tags: [exported]
```

```Go
func (s *DefaultRepoLister) List(ctx context.Context) (results []types.RepoName, err error)
```

List lists ALL default repos. These include anything in the default_repos table, user added repos (both public and private) as well as any repos added to the user_public_repos table. 

The values are cached for up to defaultReposMaxAge. If the cache has expired, we return stale data and start a background refresh. 

#### <a id="DefaultRepoLister.ListPublic" href="#DefaultRepoLister.ListPublic">func (s *DefaultRepoLister) ListPublic(ctx context.Context) (results []types.RepoName, err error)</a>

```
searchKey: dbcache.DefaultRepoLister.ListPublic
tags: [exported]
```

```Go
func (s *DefaultRepoLister) ListPublic(ctx context.Context) (results []types.RepoName, err error)
```

ListPublic is similar to List except that it only includes public repos. 

#### <a id="DefaultRepoLister.list" href="#DefaultRepoLister.list">func (s *DefaultRepoLister) list(ctx context.Context, onlyPublic bool) (results []types.RepoName, err error)</a>

```
searchKey: dbcache.DefaultRepoLister.list
```

```Go
func (s *DefaultRepoLister) list(ctx context.Context, onlyPublic bool) (results []types.RepoName, err error)
```

#### <a id="DefaultRepoLister.refreshCache" href="#DefaultRepoLister.refreshCache">func (s *DefaultRepoLister) refreshCache(ctx context.Context, onlyPublic bool) ([]types.RepoName, error)</a>

```
searchKey: dbcache.DefaultRepoLister.refreshCache
```

```Go
func (s *DefaultRepoLister) refreshCache(ctx context.Context, onlyPublic bool) ([]types.RepoName, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="TestListDefaultRepos" href="#TestListDefaultRepos">func TestListDefaultRepos(t *testing.T)</a>

```
searchKey: dbcache.TestListDefaultRepos
```

```Go
func TestListDefaultRepos(t *testing.T)
```

### <a id="BenchmarkDefaultRepos_List_Empty" href="#BenchmarkDefaultRepos_List_Empty">func BenchmarkDefaultRepos_List_Empty(b *testing.B)</a>

```
searchKey: dbcache.BenchmarkDefaultRepos_List_Empty
```

```Go
func BenchmarkDefaultRepos_List_Empty(b *testing.B)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: dbcache.init
```

```Go
func init()
```

