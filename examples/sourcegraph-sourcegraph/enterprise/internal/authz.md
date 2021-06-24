# Package authz

## Index

* [Types](#type)
    * [type ExternalServicesStore interface](#ExternalServicesStore)
    * [type fakeStore struct](#fakeStore)
        * [func (s fakeStore) List(ctx context.Context, opt database.ExternalServicesListOptions) ([]*types.ExternalService, error)](#fakeStore.List)
    * [type gitlabAuthzProviderParams struct](#gitlabAuthzProviderParams)
        * [func (m gitlabAuthzProviderParams) FetchAccount(ctx context.Context, user *types.User, current []*extsvc.Account, verifiedEmails []string) (mine *extsvc.Account, err error)](#gitlabAuthzProviderParams.FetchAccount)
        * [func (m gitlabAuthzProviderParams) FetchRepoPerms(context.Context, *extsvc.Repository) ([]extsvc.AccountID, error)](#gitlabAuthzProviderParams.FetchRepoPerms)
        * [func (m gitlabAuthzProviderParams) FetchUserPerms(context.Context, *extsvc.Account) (*authz.ExternalUserPermissions, error)](#gitlabAuthzProviderParams.FetchUserPerms)
        * [func (m gitlabAuthzProviderParams) Repos(ctx context.Context, repos []*types.Repo) (mine []*types.Repo, others []*types.Repo)](#gitlabAuthzProviderParams.Repos)
        * [func (m gitlabAuthzProviderParams) ServiceID() string](#gitlabAuthzProviderParams.ServiceID)
        * [func (m gitlabAuthzProviderParams) ServiceType() string](#gitlabAuthzProviderParams.ServiceType)
        * [func (m gitlabAuthzProviderParams) URN() string](#gitlabAuthzProviderParams.URN)
        * [func (m gitlabAuthzProviderParams) Validate() []string](#gitlabAuthzProviderParams.Validate)
* [Functions](#func)
    * [func ProvidersFromConfig(ctx context.Context,...](#ProvidersFromConfig)
    * [func TestAuthzProvidersFromConfig(t *testing.T)](#TestAuthzProvidersFromConfig)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func asJSON(t *testing.T, v interface{}) string](#asJSON)
    * [func mustURLParse(t *testing.T, u string) *url.URL](#mustURLParse)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="ExternalServicesStore" href="#ExternalServicesStore">type ExternalServicesStore interface</a>

```
searchKey: authz.ExternalServicesStore
tags: [interface]
```

```Go
type ExternalServicesStore interface {
	List(context.Context, database.ExternalServicesListOptions) ([]*types.ExternalService, error)
}
```

### <a id="fakeStore" href="#fakeStore">type fakeStore struct</a>

```
searchKey: authz.fakeStore
tags: [struct private]
```

```Go
type fakeStore struct {
	gitlabs          []*schema.GitLabConnection
	githubs          []*schema.GitHubConnection
	bitbucketServers []*schema.BitbucketServerConnection
	perforces        []*schema.PerforceConnection
}
```

#### <a id="fakeStore.List" href="#fakeStore.List">func (s fakeStore) List(ctx context.Context, opt database.ExternalServicesListOptions) ([]*types.ExternalService, error)</a>

```
searchKey: authz.fakeStore.List
tags: [method private]
```

```Go
func (s fakeStore) List(ctx context.Context, opt database.ExternalServicesListOptions) ([]*types.ExternalService, error)
```

### <a id="gitlabAuthzProviderParams" href="#gitlabAuthzProviderParams">type gitlabAuthzProviderParams struct</a>

```
searchKey: authz.gitlabAuthzProviderParams
tags: [struct private]
```

```Go
type gitlabAuthzProviderParams struct {
	OAuthOp gitlab.OAuthProviderOp
	SudoOp  gitlab.SudoProviderOp
}
```

#### <a id="gitlabAuthzProviderParams.FetchAccount" href="#gitlabAuthzProviderParams.FetchAccount">func (m gitlabAuthzProviderParams) FetchAccount(ctx context.Context, user *types.User, current []*extsvc.Account, verifiedEmails []string) (mine *extsvc.Account, err error)</a>

```
searchKey: authz.gitlabAuthzProviderParams.FetchAccount
tags: [method private]
```

```Go
func (m gitlabAuthzProviderParams) FetchAccount(ctx context.Context, user *types.User, current []*extsvc.Account, verifiedEmails []string) (mine *extsvc.Account, err error)
```

#### <a id="gitlabAuthzProviderParams.FetchRepoPerms" href="#gitlabAuthzProviderParams.FetchRepoPerms">func (m gitlabAuthzProviderParams) FetchRepoPerms(context.Context, *extsvc.Repository) ([]extsvc.AccountID, error)</a>

```
searchKey: authz.gitlabAuthzProviderParams.FetchRepoPerms
tags: [method private]
```

```Go
func (m gitlabAuthzProviderParams) FetchRepoPerms(context.Context, *extsvc.Repository) ([]extsvc.AccountID, error)
```

#### <a id="gitlabAuthzProviderParams.FetchUserPerms" href="#gitlabAuthzProviderParams.FetchUserPerms">func (m gitlabAuthzProviderParams) FetchUserPerms(context.Context, *extsvc.Account) (*authz.ExternalUserPermissions, error)</a>

```
searchKey: authz.gitlabAuthzProviderParams.FetchUserPerms
tags: [method private]
```

```Go
func (m gitlabAuthzProviderParams) FetchUserPerms(context.Context, *extsvc.Account) (*authz.ExternalUserPermissions, error)
```

#### <a id="gitlabAuthzProviderParams.Repos" href="#gitlabAuthzProviderParams.Repos">func (m gitlabAuthzProviderParams) Repos(ctx context.Context, repos []*types.Repo) (mine []*types.Repo, others []*types.Repo)</a>

```
searchKey: authz.gitlabAuthzProviderParams.Repos
tags: [method private]
```

```Go
func (m gitlabAuthzProviderParams) Repos(ctx context.Context, repos []*types.Repo) (mine []*types.Repo, others []*types.Repo)
```

#### <a id="gitlabAuthzProviderParams.ServiceID" href="#gitlabAuthzProviderParams.ServiceID">func (m gitlabAuthzProviderParams) ServiceID() string</a>

```
searchKey: authz.gitlabAuthzProviderParams.ServiceID
tags: [function private]
```

```Go
func (m gitlabAuthzProviderParams) ServiceID() string
```

#### <a id="gitlabAuthzProviderParams.ServiceType" href="#gitlabAuthzProviderParams.ServiceType">func (m gitlabAuthzProviderParams) ServiceType() string</a>

```
searchKey: authz.gitlabAuthzProviderParams.ServiceType
tags: [function private]
```

```Go
func (m gitlabAuthzProviderParams) ServiceType() string
```

#### <a id="gitlabAuthzProviderParams.URN" href="#gitlabAuthzProviderParams.URN">func (m gitlabAuthzProviderParams) URN() string</a>

```
searchKey: authz.gitlabAuthzProviderParams.URN
tags: [function private]
```

```Go
func (m gitlabAuthzProviderParams) URN() string
```

#### <a id="gitlabAuthzProviderParams.Validate" href="#gitlabAuthzProviderParams.Validate">func (m gitlabAuthzProviderParams) Validate() []string</a>

```
searchKey: authz.gitlabAuthzProviderParams.Validate
tags: [function private]
```

```Go
func (m gitlabAuthzProviderParams) Validate() []string
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="ProvidersFromConfig" href="#ProvidersFromConfig">func ProvidersFromConfig(ctx context.Context,...</a>

```
searchKey: authz.ProvidersFromConfig
tags: [method]
```

```Go
func ProvidersFromConfig(
	ctx context.Context,
	cfg *conf.Unified,
	store ExternalServicesStore,
) (
	allowAccessByDefault bool,
	providers []authz.Provider,
	seriousProblems []string,
	warnings []string,
)
```

ProvidersFromConfig returns the set of permission-related providers derived from the site config. It also returns any validation problems with the config, separating these into "serious problems" and "warnings". "Serious problems" are those that should make Sourcegraph set authz.allowAccessByDefault to false. "Warnings" are all other validation problems. 

### <a id="TestAuthzProvidersFromConfig" href="#TestAuthzProvidersFromConfig">func TestAuthzProvidersFromConfig(t *testing.T)</a>

```
searchKey: authz.TestAuthzProvidersFromConfig
tags: [method private test]
```

```Go
func TestAuthzProvidersFromConfig(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: authz.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="asJSON" href="#asJSON">func asJSON(t *testing.T, v interface{}) string</a>

```
searchKey: authz.asJSON
tags: [method private]
```

```Go
func asJSON(t *testing.T, v interface{}) string
```

### <a id="mustURLParse" href="#mustURLParse">func mustURLParse(t *testing.T, u string) *url.URL</a>

```
searchKey: authz.mustURLParse
tags: [method private]
```

```Go
func mustURLParse(t *testing.T, u string) *url.URL
```

