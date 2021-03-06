# Package externallink

Package externallink constructs external links (GraphQL ExternalLink type) for resources. 

For example, a GitHub.com repository that also has Phabricator configured has external links to both its origin repository on GitHub.com and the repository on Phabricator. 

## Index

* [Variables](#var)
    * [var linksForRepositoryFailed](#linksForRepositoryFailed)
* [Types](#type)
    * [type Resolver struct](#Resolver)
        * [func NewResolver(url, serviceType string) *Resolver](#NewResolver)
        * [func (r *Resolver) ServiceKind() *string](#Resolver.ServiceKind)
        * [func (r *Resolver) ServiceType() *string](#Resolver.ServiceType)
        * [func (r *Resolver) String() string](#Resolver.String)
        * [func (r *Resolver) URL() string](#Resolver.URL)
* [Functions](#func)
    * [func Commit(ctx context.Context, db dbutil.DB, repo *types.Repo, commitID api.CommitID) (links []*Resolver, err error)](#Commit)
    * [func FileOrDir(ctx context.Context, db dbutil.DB, repo *types.Repo, rev, path string, isDir bool) (links []*Resolver, err error)](#FileOrDir)
    * [func Repository(ctx context.Context, db dbutil.DB, repo *types.Repo) (links []*Resolver, err error)](#Repository)
    * [func TestCommit(t *testing.T)](#TestCommit)
    * [func TestFileOrDir(t *testing.T)](#TestFileOrDir)
    * [func TestRepository(t *testing.T)](#TestRepository)
    * [func linksForRepository(ctx context.Context, db dbutil.DB, repo *types.Repo) (phabRepo *types.PhabricatorRepo, link *protocol.RepoLinks, serviceType string)](#linksForRepository)
    * [func resetMocks()](#resetMocks)
    * [func typeToMaybeEmptyKind(st string) string](#typeToMaybeEmptyKind)


## <a id="var" href="#var">Variables</a>

### <a id="linksForRepositoryFailed" href="#linksForRepositoryFailed">var linksForRepositoryFailed</a>

```
searchKey: externallink.linksForRepositoryFailed
tags: [variable interface private]
```

```Go
var linksForRepositoryFailed = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: externallink.Resolver
tags: [struct]
```

```Go
type Resolver struct {
	url         string // the URL to the resource
	serviceType string // the type of service that the URL points to, used for showing a nice icon
	serviceKind string // the kind of service that the URL points to, used for showing a nice icon
}
```

A Resolver resolves the GraphQL ExternalLink type (which describes a resource on some external service). 

For example, a repository might have 2 external links, one to its origin repository on GitHub.com and one to the repository on Phabricator. 

#### <a id="NewResolver" href="#NewResolver">func NewResolver(url, serviceType string) *Resolver</a>

```
searchKey: externallink.NewResolver
tags: [function]
```

```Go
func NewResolver(url, serviceType string) *Resolver
```

#### <a id="Resolver.ServiceKind" href="#Resolver.ServiceKind">func (r *Resolver) ServiceKind() *string</a>

```
searchKey: externallink.Resolver.ServiceKind
tags: [method]
```

```Go
func (r *Resolver) ServiceKind() *string
```

#### <a id="Resolver.ServiceType" href="#Resolver.ServiceType">func (r *Resolver) ServiceType() *string</a>

```
searchKey: externallink.Resolver.ServiceType
tags: [method]
```

```Go
func (r *Resolver) ServiceType() *string
```

#### <a id="Resolver.String" href="#Resolver.String">func (r *Resolver) String() string</a>

```
searchKey: externallink.Resolver.String
tags: [method]
```

```Go
func (r *Resolver) String() string
```

#### <a id="Resolver.URL" href="#Resolver.URL">func (r *Resolver) URL() string</a>

```
searchKey: externallink.Resolver.URL
tags: [method]
```

```Go
func (r *Resolver) URL() string
```

## <a id="func" href="#func">Functions</a>

### <a id="Commit" href="#Commit">func Commit(ctx context.Context, db dbutil.DB, repo *types.Repo, commitID api.CommitID) (links []*Resolver, err error)</a>

```
searchKey: externallink.Commit
tags: [function]
```

```Go
func Commit(ctx context.Context, db dbutil.DB, repo *types.Repo, commitID api.CommitID) (links []*Resolver, err error)
```

Commit returns the external links for a commit in a repository. 

### <a id="FileOrDir" href="#FileOrDir">func FileOrDir(ctx context.Context, db dbutil.DB, repo *types.Repo, rev, path string, isDir bool) (links []*Resolver, err error)</a>

```
searchKey: externallink.FileOrDir
tags: [function]
```

```Go
func FileOrDir(ctx context.Context, db dbutil.DB, repo *types.Repo, rev, path string, isDir bool) (links []*Resolver, err error)
```

FileOrDir returns the external links for a file or directory in a repository. 

### <a id="Repository" href="#Repository">func Repository(ctx context.Context, db dbutil.DB, repo *types.Repo) (links []*Resolver, err error)</a>

```
searchKey: externallink.Repository
tags: [function]
```

```Go
func Repository(ctx context.Context, db dbutil.DB, repo *types.Repo) (links []*Resolver, err error)
```

Repository returns the external links for a repository. 

For example, a repository might have 2 external links, one to its origin repository on GitHub.com and one to the repository on Phabricator. 

### <a id="TestCommit" href="#TestCommit">func TestCommit(t *testing.T)</a>

```
searchKey: externallink.TestCommit
tags: [function private test]
```

```Go
func TestCommit(t *testing.T)
```

### <a id="TestFileOrDir" href="#TestFileOrDir">func TestFileOrDir(t *testing.T)</a>

```
searchKey: externallink.TestFileOrDir
tags: [function private test]
```

```Go
func TestFileOrDir(t *testing.T)
```

### <a id="TestRepository" href="#TestRepository">func TestRepository(t *testing.T)</a>

```
searchKey: externallink.TestRepository
tags: [function private test]
```

```Go
func TestRepository(t *testing.T)
```

### <a id="linksForRepository" href="#linksForRepository">func linksForRepository(ctx context.Context, db dbutil.DB, repo *types.Repo) (phabRepo *types.PhabricatorRepo, link *protocol.RepoLinks, serviceType string)</a>

```
searchKey: externallink.linksForRepository
tags: [function private]
```

```Go
func linksForRepository(ctx context.Context, db dbutil.DB, repo *types.Repo) (phabRepo *types.PhabricatorRepo, link *protocol.RepoLinks, serviceType string)
```

linksForRepository gets the information necessary to construct links to resources within this repository. 

It logs errors to the trace but does not return errors, because external links are not worth failing any request for. 

### <a id="resetMocks" href="#resetMocks">func resetMocks()</a>

```
searchKey: externallink.resetMocks
tags: [function private]
```

```Go
func resetMocks()
```

### <a id="typeToMaybeEmptyKind" href="#typeToMaybeEmptyKind">func typeToMaybeEmptyKind(st string) string</a>

```
searchKey: externallink.typeToMaybeEmptyKind
tags: [function private]
```

```Go
func typeToMaybeEmptyKind(st string) string
```

