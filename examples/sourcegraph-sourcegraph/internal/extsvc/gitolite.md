# Package gitolite

## Index

* [Types](#type)
    * [type Client struct](#Client)
        * [func NewClient(host string) *Client](#NewClient)
        * [func (c *Client) ListRepos(ctx context.Context) ([]*Repo, error)](#Client.ListRepos)
    * [type Repo struct](#Repo)
    * [type errUnauthorized struct](#errUnauthorized)
        * [func (*errUnauthorized) Unauthorized() bool](#errUnauthorized.Unauthorized)
* [Functions](#func)
    * [func CloneURL(externalRepoSpec api.ExternalRepoSpec) string](#CloneURL)
    * [func ExternalRepoSpec(repo *Repo, serviceID string) api.ExternalRepoSpec](#ExternalRepoSpec)
    * [func ServiceID(gitoliteHost string) string](#ServiceID)
    * [func TestDecodeRepos(t *testing.T)](#TestDecodeRepos)
    * [func TestMaybeUnauthorized(t *testing.T)](#TestMaybeUnauthorized)
    * [func decodeRepos(host, gitoliteInfo string) []*Repo](#decodeRepos)
    * [func maybeUnauthorized(err error) error](#maybeUnauthorized)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: gitolite.Client
tags: [struct]
```

```Go
type Client struct {
	Host string
}
```

Client is a client for the Gitolite API. 

IMPORTANT: in order to authenticate to the Gitolite API, the client must be invoked from a service in an environment that contains a Gitolite-authorized SSH key. As of writing, only gitserver meets this criterion (i.e., only invoke this client from gitserver). 

Impl note: To change the above, remove the invocation of the `ssh` binary and replace it with use of the `ssh` package, reading arguments from config. 

#### <a id="NewClient" href="#NewClient">func NewClient(host string) *Client</a>

```
searchKey: gitolite.NewClient
tags: [function]
```

```Go
func NewClient(host string) *Client
```

#### <a id="Client.ListRepos" href="#Client.ListRepos">func (c *Client) ListRepos(ctx context.Context) ([]*Repo, error)</a>

```
searchKey: gitolite.Client.ListRepos
tags: [method]
```

```Go
func (c *Client) ListRepos(ctx context.Context) ([]*Repo, error)
```

### <a id="Repo" href="#Repo">type Repo struct</a>

```
searchKey: gitolite.Repo
tags: [struct]
```

```Go
type Repo struct {
	// Name is the name of the repository as it is returned by `ssh git@GITOLITE_HOST info`
	Name string

	// URL is the clone URL of the repository.
	URL string
}
```

Repo is the repository metadata returned by the Gitolite API. 

### <a id="errUnauthorized" href="#errUnauthorized">type errUnauthorized struct</a>

```
searchKey: gitolite.errUnauthorized
tags: [struct private]
```

```Go
type errUnauthorized struct {
	error
}
```

#### <a id="errUnauthorized.Unauthorized" href="#errUnauthorized.Unauthorized">func (*errUnauthorized) Unauthorized() bool</a>

```
searchKey: gitolite.errUnauthorized.Unauthorized
tags: [method private]
```

```Go
func (*errUnauthorized) Unauthorized() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="CloneURL" href="#CloneURL">func CloneURL(externalRepoSpec api.ExternalRepoSpec) string</a>

```
searchKey: gitolite.CloneURL
tags: [function]
```

```Go
func CloneURL(externalRepoSpec api.ExternalRepoSpec) string
```

CloneURL returns the clone URL of the external repository. The external repo spec must be of type "gitolite"; otherwise, this will return an empty string. 

### <a id="ExternalRepoSpec" href="#ExternalRepoSpec">func ExternalRepoSpec(repo *Repo, serviceID string) api.ExternalRepoSpec</a>

```
searchKey: gitolite.ExternalRepoSpec
tags: [function]
```

```Go
func ExternalRepoSpec(repo *Repo, serviceID string) api.ExternalRepoSpec
```

### <a id="ServiceID" href="#ServiceID">func ServiceID(gitoliteHost string) string</a>

```
searchKey: gitolite.ServiceID
tags: [function]
```

```Go
func ServiceID(gitoliteHost string) string
```

### <a id="TestDecodeRepos" href="#TestDecodeRepos">func TestDecodeRepos(t *testing.T)</a>

```
searchKey: gitolite.TestDecodeRepos
tags: [function private test]
```

```Go
func TestDecodeRepos(t *testing.T)
```

### <a id="TestMaybeUnauthorized" href="#TestMaybeUnauthorized">func TestMaybeUnauthorized(t *testing.T)</a>

```
searchKey: gitolite.TestMaybeUnauthorized
tags: [function private test]
```

```Go
func TestMaybeUnauthorized(t *testing.T)
```

### <a id="decodeRepos" href="#decodeRepos">func decodeRepos(host, gitoliteInfo string) []*Repo</a>

```
searchKey: gitolite.decodeRepos
tags: [function private]
```

```Go
func decodeRepos(host, gitoliteInfo string) []*Repo
```

### <a id="maybeUnauthorized" href="#maybeUnauthorized">func maybeUnauthorized(err error) error</a>

```
searchKey: gitolite.maybeUnauthorized
tags: [function private]
```

```Go
func maybeUnauthorized(err error) error
```

newErrUnauthorized will return an errUnauthorized wrapping err if there is permission issue. Otherwise, it return err unchanged This ensures that we implement the unauthorizeder interface from the errcode package 

