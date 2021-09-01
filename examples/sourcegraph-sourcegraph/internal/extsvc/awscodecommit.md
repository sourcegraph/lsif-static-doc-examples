# Package awscodecommit

Package awscodecommit implements an AWS CodeCommit API client. 

## Index

* [Constants](#const)
    * [const MaxMetadataBatch](#MaxMetadataBatch)
* [Variables](#var)
    * [var ErrNotFound](#ErrNotFound)
    * [var GetRepositoryMock](#GetRepositoryMock)
    * [var reposCacheCounter](#reposCacheCounter)
* [Types](#type)
    * [type Client struct](#Client)
        * [func NewClient(config aws.Config) *Client](#NewClient)
        * [func (c *Client) GetRepository(ctx context.Context, arn string) (*Repository, error)](#Client.GetRepository)
        * [func (c *Client) ListRepositories(ctx context.Context, nextToken string) (repos []*Repository, nextNextToken string, err error)](#Client.ListRepositories)
        * [func (c *Client) addRepositoryToCache(key string, repo *cachedRepo)](#Client.addRepositoryToCache)
        * [func (c *Client) cacheKeyPrefix(ctx context.Context) (string, error)](#Client.cacheKeyPrefix)
        * [func (c *Client) cachedGetRepository(ctx context.Context, arn string) (*Repository, error)](#Client.cachedGetRepository)
        * [func (c *Client) getRepositories(ctx context.Context, svc *codecommit.Client, repositoryNames []string) ([]*Repository, error)](#Client.getRepositories)
        * [func (c *Client) getRepositoryFromAPI(ctx context.Context, arn string) (*Repository, error)](#Client.getRepositoryFromAPI)
        * [func (c *Client) getRepositoryFromCache(ctx context.Context, key string) *cachedRepo](#Client.getRepositoryFromCache)
        * [func (c *Client) repositoryCacheKey(ctx context.Context, arn string) (string, error)](#Client.repositoryCacheKey)
    * [type Repository struct](#Repository)
        * [func fromRepoMetadata(m *codecommittypes.RepositoryMetadata) *Repository](#fromRepoMetadata)
    * [type cachedRepo struct](#cachedRepo)
    * [type wrappedError struct](#wrappedError)
        * [func (w *wrappedError) Error() string](#wrappedError.Error)
        * [func (w *wrappedError) NotFound() bool](#wrappedError.NotFound)
        * [func (w *wrappedError) Unauthorized() bool](#wrappedError.Unauthorized)
* [Functions](#func)
    * [func ExternalRepoSpec(repo *Repository, serviceID string) api.ExternalRepoSpec](#ExternalRepoSpec)
    * [func IsNotFound(err error) bool](#IsNotFound)
    * [func IsUnauthorized(err error) bool](#IsUnauthorized)
    * [func MockGetRepository_Return(returns *Repository)](#MockGetRepository_Return)
    * [func ServiceID(awsPartition, awsRegion, awsAccountID string) string](#ServiceID)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="MaxMetadataBatch" href="#MaxMetadataBatch">const MaxMetadataBatch</a>

```
searchKey: awscodecommit.MaxMetadataBatch
tags: [constant number]
```

```Go
const MaxMetadataBatch = 25
```

We can only fetch the metadata in batches of 25 as documented here: [https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/codecommit/model/MaximumRepositoryNamesExceededException.html](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/codecommit/model/MaximumRepositoryNamesExceededException.html) 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrNotFound" href="#ErrNotFound">var ErrNotFound</a>

```
searchKey: awscodecommit.ErrNotFound
tags: [variable interface]
```

```Go
var ErrNotFound = errors.New("AWS CodeCommit repository not found")
```

ErrNotFound is when the requested AWS CodeCommit repository is not found. 

### <a id="GetRepositoryMock" href="#GetRepositoryMock">var GetRepositoryMock</a>

```
searchKey: awscodecommit.GetRepositoryMock
tags: [variable function]
```

```Go
var GetRepositoryMock func(ctx context.Context, arn string) (*Repository, error)
```

GetRepositoryMock is set by tests to mock (*Client).GetRepository. 

### <a id="reposCacheCounter" href="#reposCacheCounter">var reposCacheCounter</a>

```
searchKey: awscodecommit.reposCacheCounter
tags: [variable struct private]
```

```Go
var reposCacheCounter = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: awscodecommit.Client
tags: [struct]
```

```Go
type Client struct {
	aws       aws.Config
	repoCache *rcache.Cache
}
```

Client is a AWS CodeCommit API client. 

#### <a id="NewClient" href="#NewClient">func NewClient(config aws.Config) *Client</a>

```
searchKey: awscodecommit.NewClient
tags: [function]
```

```Go
func NewClient(config aws.Config) *Client
```

NewClient creates a new AWS CodeCommit API client. 

#### <a id="Client.GetRepository" href="#Client.GetRepository">func (c *Client) GetRepository(ctx context.Context, arn string) (*Repository, error)</a>

```
searchKey: awscodecommit.Client.GetRepository
tags: [method]
```

```Go
func (c *Client) GetRepository(ctx context.Context, arn string) (*Repository, error)
```

GetRepository gets a repository from AWS CodeCommit by ARN (Amazon Resource Name). 

#### <a id="Client.ListRepositories" href="#Client.ListRepositories">func (c *Client) ListRepositories(ctx context.Context, nextToken string) (repos []*Repository, nextNextToken string, err error)</a>

```
searchKey: awscodecommit.Client.ListRepositories
tags: [method]
```

```Go
func (c *Client) ListRepositories(ctx context.Context, nextToken string) (repos []*Repository, nextNextToken string, err error)
```

ListRepositories calls the ListRepositories API method of AWS CodeCommit. 

#### <a id="Client.addRepositoryToCache" href="#Client.addRepositoryToCache">func (c *Client) addRepositoryToCache(key string, repo *cachedRepo)</a>

```
searchKey: awscodecommit.Client.addRepositoryToCache
tags: [method private]
```

```Go
func (c *Client) addRepositoryToCache(key string, repo *cachedRepo)
```

addRepositoryToCache will cache the value for repo. The caller can provide multiple cache key for the multiple ways that this repository can be retrieved (e.g., both "owner/name" and the GraphQL node ID). 

#### <a id="Client.cacheKeyPrefix" href="#Client.cacheKeyPrefix">func (c *Client) cacheKeyPrefix(ctx context.Context) (string, error)</a>

```
searchKey: awscodecommit.Client.cacheKeyPrefix
tags: [method private]
```

```Go
func (c *Client) cacheKeyPrefix(ctx context.Context) (string, error)
```

cacheKeyPrefix returns the cache key prefix to use. It incorporates the credentials to avoid leaking cached data that was fetched with one set of credentials to a (possibly different) user with a different set of credentials. 

#### <a id="Client.cachedGetRepository" href="#Client.cachedGetRepository">func (c *Client) cachedGetRepository(ctx context.Context, arn string) (*Repository, error)</a>

```
searchKey: awscodecommit.Client.cachedGetRepository
tags: [method private]
```

```Go
func (c *Client) cachedGetRepository(ctx context.Context, arn string) (*Repository, error)
```

cachedGetRepository caches the getRepositoryFromAPI call. 

#### <a id="Client.getRepositories" href="#Client.getRepositories">func (c *Client) getRepositories(ctx context.Context, svc *codecommit.Client, repositoryNames []string) ([]*Repository, error)</a>

```
searchKey: awscodecommit.Client.getRepositories
tags: [method private]
```

```Go
func (c *Client) getRepositories(ctx context.Context, svc *codecommit.Client, repositoryNames []string) ([]*Repository, error)
```

#### <a id="Client.getRepositoryFromAPI" href="#Client.getRepositoryFromAPI">func (c *Client) getRepositoryFromAPI(ctx context.Context, arn string) (*Repository, error)</a>

```
searchKey: awscodecommit.Client.getRepositoryFromAPI
tags: [method private]
```

```Go
func (c *Client) getRepositoryFromAPI(ctx context.Context, arn string) (*Repository, error)
```

getRepositoryFromAPI attempts to fetch a repository from the GitHub API without use of the redis cache. 

#### <a id="Client.getRepositoryFromCache" href="#Client.getRepositoryFromCache">func (c *Client) getRepositoryFromCache(ctx context.Context, key string) *cachedRepo</a>

```
searchKey: awscodecommit.Client.getRepositoryFromCache
tags: [method private]
```

```Go
func (c *Client) getRepositoryFromCache(ctx context.Context, key string) *cachedRepo
```

getRepositoryFromCache attempts to get a response from the redis cache. It returns nil error for cache-hit condition and non-nil error for cache-miss. 

#### <a id="Client.repositoryCacheKey" href="#Client.repositoryCacheKey">func (c *Client) repositoryCacheKey(ctx context.Context, arn string) (string, error)</a>

```
searchKey: awscodecommit.Client.repositoryCacheKey
tags: [method private]
```

```Go
func (c *Client) repositoryCacheKey(ctx context.Context, arn string) (string, error)
```

### <a id="Repository" href="#Repository">type Repository struct</a>

```
searchKey: awscodecommit.Repository
tags: [struct]
```

```Go
type Repository struct {
	ARN          string     // the ARN (Amazon Resource Name) of the repository
	AccountID    string     // the ID of the AWS account associated with the repository
	ID           string     // the ID of the repository
	Name         string     // the name of the repository
	Description  string     // the description of the repository
	HTTPCloneURL string     // the HTTP(S) clone URL of the repository
	LastModified *time.Time // the last modified date of the repository
}
```

Repository is an AWS CodeCommit repository. 

#### <a id="fromRepoMetadata" href="#fromRepoMetadata">func fromRepoMetadata(m *codecommittypes.RepositoryMetadata) *Repository</a>

```
searchKey: awscodecommit.fromRepoMetadata
tags: [function private]
```

```Go
func fromRepoMetadata(m *codecommittypes.RepositoryMetadata) *Repository
```

### <a id="cachedRepo" href="#cachedRepo">type cachedRepo struct</a>

```
searchKey: awscodecommit.cachedRepo
tags: [struct private]
```

```Go
type cachedRepo struct {
	Repository

	// NotFound indicates that the AWS CodeCommit API reported that the repository was not
	// found.
	NotFound bool
}
```

### <a id="wrappedError" href="#wrappedError">type wrappedError struct</a>

```
searchKey: awscodecommit.wrappedError
tags: [struct private]
```

```Go
type wrappedError struct {
	err error
}
```

#### <a id="wrappedError.Error" href="#wrappedError.Error">func (w *wrappedError) Error() string</a>

```
searchKey: awscodecommit.wrappedError.Error
tags: [method private]
```

```Go
func (w *wrappedError) Error() string
```

#### <a id="wrappedError.NotFound" href="#wrappedError.NotFound">func (w *wrappedError) NotFound() bool</a>

```
searchKey: awscodecommit.wrappedError.NotFound
tags: [method private]
```

```Go
func (w *wrappedError) NotFound() bool
```

#### <a id="wrappedError.Unauthorized" href="#wrappedError.Unauthorized">func (w *wrappedError) Unauthorized() bool</a>

```
searchKey: awscodecommit.wrappedError.Unauthorized
tags: [method private]
```

```Go
func (w *wrappedError) Unauthorized() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExternalRepoSpec" href="#ExternalRepoSpec">func ExternalRepoSpec(repo *Repository, serviceID string) api.ExternalRepoSpec</a>

```
searchKey: awscodecommit.ExternalRepoSpec
tags: [function]
```

```Go
func ExternalRepoSpec(repo *Repository, serviceID string) api.ExternalRepoSpec
```

ExternalRepoSpec returns an api.ExternalRepoSpec that refers to the specified AWS CodeCommit repository. 

### <a id="IsNotFound" href="#IsNotFound">func IsNotFound(err error) bool</a>

```
searchKey: awscodecommit.IsNotFound
tags: [function]
```

```Go
func IsNotFound(err error) bool
```

IsNotFound reports whether err is a AWS CodeCommit API not-found error or the equivalent cached response error. 

### <a id="IsUnauthorized" href="#IsUnauthorized">func IsUnauthorized(err error) bool</a>

```
searchKey: awscodecommit.IsUnauthorized
tags: [function]
```

```Go
func IsUnauthorized(err error) bool
```

IsUnauthorized reports whether err is a AWS CodeCommit API unauthorized error. 

### <a id="MockGetRepository_Return" href="#MockGetRepository_Return">func MockGetRepository_Return(returns *Repository)</a>

```
searchKey: awscodecommit.MockGetRepository_Return
tags: [function]
```

```Go
func MockGetRepository_Return(returns *Repository)
```

MockGetRepository_Return is called by tests to mock (*Client).GetRepository. 

### <a id="ServiceID" href="#ServiceID">func ServiceID(awsPartition, awsRegion, awsAccountID string) string</a>

```
searchKey: awscodecommit.ServiceID
tags: [function]
```

```Go
func ServiceID(awsPartition, awsRegion, awsAccountID string) string
```

ServiceID creates the repository external service ID. See AWSCodeCommitServiceType for documentation on the format of this value. 

This value uniquely identifies the most specific namespace in which AWS CodeCommit repositories are defined. 

