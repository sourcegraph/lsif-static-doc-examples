# Package github

## Index

* [Types](#type)
    * [type client interface](#client)
    * [type ClientAdapter struct](#ClientAdapter)
        * [func (c *ClientAdapter) WithToken(token string) client](#ClientAdapter.WithToken)
    * [type mockClient struct](#mockClient)
        * [func (m *mockClient) ListAffiliatedRepositories(ctx context.Context, visibility github.Visibility, page int) ([]*github.Repository, bool, int, error)](#mockClient.ListAffiliatedRepositories)
        * [func (m *mockClient) ListRepositoryCollaborators(ctx context.Context, owner, repo string, page int) ([]*github.Collaborator, bool, error)](#mockClient.ListRepositoryCollaborators)
        * [func (m *mockClient) WithToken(token string) client](#mockClient.WithToken)
    * [type Provider struct](#Provider)
        * [func NewProvider(urn string, githubURL *url.URL, baseToken string, client *github.V3Client) *Provider](#NewProvider)
        * [func (p *Provider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (mine *extsvc.Account, err error)](#Provider.FetchAccount)
        * [func (p *Provider) URN() string](#Provider.URN)
        * [func (p *Provider) ServiceID() string](#Provider.ServiceID)
        * [func (p *Provider) ServiceType() string](#Provider.ServiceType)
        * [func (p *Provider) Validate() (problems []string)](#Provider.Validate)
        * [func (p *Provider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)](#Provider.FetchUserPerms)
        * [func (p *Provider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)](#Provider.FetchRepoPerms)
* [Functions](#func)
    * [func NewAuthzProviders(conns []*types.GitHubConnection) (ps []authz.Provider, problems []string, warnings []string)](#NewAuthzProviders)
    * [func newAuthzProvider(urn string, a *schema.GitHubAuthorization, instanceURL, token string) (authz.Provider, error)](#newAuthzProvider)
    * [func ValidateAuthz(cfg *schema.GitHubConnection) error](#ValidateAuthz)
    * [func mustURL(t *testing.T, u string) *url.URL](#mustURL)
    * [func TestProvider_FetchUserPerms(t *testing.T)](#TestProvider_FetchUserPerms)
    * [func TestProvider_FetchRepoPerms(t *testing.T)](#TestProvider_FetchRepoPerms)


## <a id="type" href="#type">Types</a>

### <a id="client" href="#client">type client interface</a>

```
searchKey: github.client
```

```Go
type client interface {
	ListAffiliatedRepositories(ctx context.Context, visibility github.Visibility, page int) (repos []*github.Repository, hasNextPage bool, rateLimitCost int, err error)
	ListRepositoryCollaborators(ctx context.Context, owner, repo string, page int) (users []*github.Collaborator, hasNextPage bool, _ error)
	WithToken(token string) client
}
```

client defines the set of GitHub API client methods used by the authz provider. 

NOTE: All methods are sorted in alphabetical order. 

### <a id="ClientAdapter" href="#ClientAdapter">type ClientAdapter struct</a>

```
searchKey: github.ClientAdapter
tags: [exported]
```

```Go
type ClientAdapter struct {
	*github.V3Client
}
```

ClientAdapter is an adapter for GitHub API client. 

#### <a id="ClientAdapter.WithToken" href="#ClientAdapter.WithToken">func (c *ClientAdapter) WithToken(token string) client</a>

```
searchKey: github.ClientAdapter.WithToken
tags: [exported]
```

```Go
func (c *ClientAdapter) WithToken(token string) client
```

### <a id="mockClient" href="#mockClient">type mockClient struct</a>

```
searchKey: github.mockClient
```

```Go
type mockClient struct {
	MockListAffiliatedRepositories  func(ctx context.Context, visibility github.Visibility, page int) (repos []*github.Repository, hasNextPage bool, rateLimitCost int, err error)
	MockListRepositoryCollaborators func(ctx context.Context, owner, repo string, page int) (users []*github.Collaborator, hasNextPage bool, _ error)
	MockWithToken                   func(token string) client
}
```

#### <a id="mockClient.ListAffiliatedRepositories" href="#mockClient.ListAffiliatedRepositories">func (m *mockClient) ListAffiliatedRepositories(ctx context.Context, visibility github.Visibility, page int) ([]*github.Repository, bool, int, error)</a>

```
searchKey: github.mockClient.ListAffiliatedRepositories
```

```Go
func (m *mockClient) ListAffiliatedRepositories(ctx context.Context, visibility github.Visibility, page int) ([]*github.Repository, bool, int, error)
```

#### <a id="mockClient.ListRepositoryCollaborators" href="#mockClient.ListRepositoryCollaborators">func (m *mockClient) ListRepositoryCollaborators(ctx context.Context, owner, repo string, page int) ([]*github.Collaborator, bool, error)</a>

```
searchKey: github.mockClient.ListRepositoryCollaborators
```

```Go
func (m *mockClient) ListRepositoryCollaborators(ctx context.Context, owner, repo string, page int) ([]*github.Collaborator, bool, error)
```

#### <a id="mockClient.WithToken" href="#mockClient.WithToken">func (m *mockClient) WithToken(token string) client</a>

```
searchKey: github.mockClient.WithToken
```

```Go
func (m *mockClient) WithToken(token string) client
```

### <a id="Provider" href="#Provider">type Provider struct</a>

```
searchKey: github.Provider
tags: [exported]
```

```Go
type Provider struct {
	urn      string
	client   client
	codeHost *extsvc.CodeHost
}
```

Provider implements authz.Provider for GitHub repository permissions. 

#### <a id="NewProvider" href="#NewProvider">func NewProvider(urn string, githubURL *url.URL, baseToken string, client *github.V3Client) *Provider</a>

```
searchKey: github.NewProvider
tags: [exported]
```

```Go
func NewProvider(urn string, githubURL *url.URL, baseToken string, client *github.V3Client) *Provider
```

#### <a id="Provider.FetchAccount" href="#Provider.FetchAccount">func (p *Provider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (mine *extsvc.Account, err error)</a>

```
searchKey: github.Provider.FetchAccount
tags: [exported]
```

```Go
func (p *Provider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (mine *extsvc.Account, err error)
```

FetchAccount implements the authz.Provider interface. It always returns nil, because the GitHub API doesn't currently provide a way to fetch user by external SSO account. 

#### <a id="Provider.URN" href="#Provider.URN">func (p *Provider) URN() string</a>

```
searchKey: github.Provider.URN
tags: [exported]
```

```Go
func (p *Provider) URN() string
```

#### <a id="Provider.ServiceID" href="#Provider.ServiceID">func (p *Provider) ServiceID() string</a>

```
searchKey: github.Provider.ServiceID
tags: [exported]
```

```Go
func (p *Provider) ServiceID() string
```

#### <a id="Provider.ServiceType" href="#Provider.ServiceType">func (p *Provider) ServiceType() string</a>

```
searchKey: github.Provider.ServiceType
tags: [exported]
```

```Go
func (p *Provider) ServiceType() string
```

#### <a id="Provider.Validate" href="#Provider.Validate">func (p *Provider) Validate() (problems []string)</a>

```
searchKey: github.Provider.Validate
tags: [exported]
```

```Go
func (p *Provider) Validate() (problems []string)
```

#### <a id="Provider.FetchUserPerms" href="#Provider.FetchUserPerms">func (p *Provider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)</a>

```
searchKey: github.Provider.FetchUserPerms
tags: [exported]
```

```Go
func (p *Provider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)
```

FetchUserPerms returns a list of repository IDs (on code host) that the given account has read access on the code host. The repository ID has the same value as it would be used as api.ExternalRepoSpec.ID. The returned list only includes private repository IDs. 

This method may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

API docs: [https://developer.github.com/v3/repos/#list-repositories-for-the-authenticated-user](https://developer.github.com/v3/repos/#list-repositories-for-the-authenticated-user) 

#### <a id="Provider.FetchRepoPerms" href="#Provider.FetchRepoPerms">func (p *Provider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)</a>

```
searchKey: github.Provider.FetchRepoPerms
tags: [exported]
```

```Go
func (p *Provider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)
```

FetchRepoPerms returns a list of user IDs (on code host) who have read access to the given project on the code host. The user ID has the same value as it would be used as extsvc.Account.AccountID. The returned list includes both direct access and inherited from the organization membership. 

This method may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

API docs: [https://developer.github.com/v4/object/repositorycollaboratorconnection/](https://developer.github.com/v4/object/repositorycollaboratorconnection/) 

## <a id="func" href="#func">Functions</a>

### <a id="NewAuthzProviders" href="#NewAuthzProviders">func NewAuthzProviders(conns []*types.GitHubConnection) (ps []authz.Provider, problems []string, warnings []string)</a>

```
searchKey: github.NewAuthzProviders
tags: [exported]
```

```Go
func NewAuthzProviders(
	conns []*types.GitHubConnection,
) (ps []authz.Provider, problems []string, warnings []string)
```

NewAuthzProviders returns the set of GitHub authz providers derived from the connections. It also returns any validation problems with the config, separating these into "serious problems" and "warnings". "Serious problems" are those that should make Sourcegraph set authz.allowAccessByDefault to false. "Warnings" are all other validation problems. 

### <a id="newAuthzProvider" href="#newAuthzProvider">func newAuthzProvider(urn string, a *schema.GitHubAuthorization, instanceURL, token string) (authz.Provider, error)</a>

```
searchKey: github.newAuthzProvider
```

```Go
func newAuthzProvider(urn string, a *schema.GitHubAuthorization, instanceURL, token string) (authz.Provider, error)
```

### <a id="ValidateAuthz" href="#ValidateAuthz">func ValidateAuthz(cfg *schema.GitHubConnection) error</a>

```
searchKey: github.ValidateAuthz
tags: [exported]
```

```Go
func ValidateAuthz(cfg *schema.GitHubConnection) error
```

ValidateAuthz validates the authorization fields of the given GitHub external service config. 

### <a id="mustURL" href="#mustURL">func mustURL(t *testing.T, u string) *url.URL</a>

```
searchKey: github.mustURL
```

```Go
func mustURL(t *testing.T, u string) *url.URL
```

### <a id="TestProvider_FetchUserPerms" href="#TestProvider_FetchUserPerms">func TestProvider_FetchUserPerms(t *testing.T)</a>

```
searchKey: github.TestProvider_FetchUserPerms
```

```Go
func TestProvider_FetchUserPerms(t *testing.T)
```

### <a id="TestProvider_FetchRepoPerms" href="#TestProvider_FetchRepoPerms">func TestProvider_FetchRepoPerms(t *testing.T)</a>

```
searchKey: github.TestProvider_FetchRepoPerms
```

```Go
func TestProvider_FetchRepoPerms(t *testing.T)
```

