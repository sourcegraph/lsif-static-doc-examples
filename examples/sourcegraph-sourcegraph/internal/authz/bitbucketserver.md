# Package bitbucketserver

Package bitbucketserver contains an authorization provider for Bitbucket Server. 

## Index

* [Variables](#var)
    * [var errNoResults](#errNoResults)
    * [var update](#update)
* [Types](#type)
    * [type Provider struct](#Provider)
        * [func NewProvider(cli *bitbucketserver.Client, urn string, pluginPerm bool) *Provider](#NewProvider)
        * [func newProvider(cli *bitbucketserver.Client) *Provider](#newProvider)
        * [func (p *Provider) FetchAccount(ctx context.Context, user *types.User, _ []*extsvc.Account, _ []string) (acct *extsvc.Account, err error)](#Provider.FetchAccount)
        * [func (p *Provider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)](#Provider.FetchRepoPerms)
        * [func (p *Provider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)](#Provider.FetchUserPerms)
        * [func (p *Provider) ServiceID() string](#Provider.ServiceID)
        * [func (p *Provider) ServiceType() string](#Provider.ServiceType)
        * [func (p *Provider) URN() string](#Provider.URN)
        * [func (p *Provider) Validate() []string](#Provider.Validate)
        * [func (p *Provider) repoIDs(ctx context.Context, username string, public bool) ([]uint32, error)](#Provider.repoIDs)
        * [func (p *Provider) repoIDsFromAPI(ctx context.Context, username string, public bool) (ids []uint32, err error)](#Provider.repoIDsFromAPI)
        * [func (p *Provider) repoIDsFromPlugin(ctx context.Context, username string) (ids []uint32, err error)](#Provider.repoIDsFromPlugin)
        * [func (p *Provider) user(ctx context.Context, username string, fs ...bitbucketserver.UserFilter) (*bitbucketserver.User, error)](#Provider.user)
        * [func (p *Provider) userIDs(ctx context.Context, repoID string) (ids []int, err error)](#Provider.userIDs)
    * [type codeHost struct](#codeHost)
        * [func (h codeHost) externalAccount(userID int32, u *bitbucketserver.User) *extsvc.Account](#codeHost.externalAccount)
    * [type fixtures struct](#fixtures)
        * [func newFixtures() *fixtures](#newFixtures)
        * [func (f fixtures) load(t *testing.T, cli *bitbucketserver.Client)](#fixtures.load)
* [Functions](#func)
    * [func NewAuthzProviders(conns []*types.BitbucketServerConnection) (ps []authz.Provider, problems []string, warnings []string)](#NewAuthzProviders)
    * [func TestIntegration(t *testing.T)](#TestIntegration)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestProvider_Validate(t *testing.T)](#TestProvider_Validate)
    * [func ValidateAuthz(c *schema.BitbucketServerConnection) error](#ValidateAuthz)
    * [func marshalJSON(v interface{}) []byte](#marshalJSON)
    * [func newAuthzProvider(c *types.BitbucketServerConnection,...](#newAuthzProvider)
    * [func newClient(t *testing.T, name string) (*bitbucketserver.Client, func())](#newClient)
    * [func testProviderFetchAccount(f *fixtures, cli *bitbucketserver.Client) func(*testing.T)](#testProviderFetchAccount)
    * [func testProviderFetchRepoPerms(f *fixtures, cli *bitbucketserver.Client) func(*testing.T)](#testProviderFetchRepoPerms)
    * [func testProviderFetchUserPerms(f *fixtures, cli *bitbucketserver.Client) func(*testing.T)](#testProviderFetchUserPerms)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="errNoResults" href="#errNoResults">var errNoResults</a>

```
searchKey: bitbucketserver.errNoResults
tags: [variable interface private]
```

```Go
var errNoResults = errors.New("no results returned by the Bitbucket Server API")
```

### <a id="update" href="#update">var update</a>

```
searchKey: bitbucketserver.update
tags: [variable boolean private]
```

```Go
var update = flag.Bool("update", false, "update testdata")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Provider" href="#Provider">type Provider struct</a>

```
searchKey: bitbucketserver.Provider
tags: [struct]
```

```Go
type Provider struct {
	urn      string
	client   *bitbucketserver.Client
	codeHost *extsvc.CodeHost
	pageSize int // Page size to use in paginated requests.

	// pluginPerm enables fetching permissions from the alternative roaring
	// bitmap endpoint provided by the Bitbucket Server Sourcegraph plugin:
	// https://github.com/sourcegraph/bitbucket-server-plugin
	pluginPerm bool
}
```

Provider is an implementation of AuthzProvider that provides repository permissions as determined from a Bitbucket Server instance API. 

#### <a id="NewProvider" href="#NewProvider">func NewProvider(cli *bitbucketserver.Client, urn string, pluginPerm bool) *Provider</a>

```
searchKey: bitbucketserver.NewProvider
tags: [function]
```

```Go
func NewProvider(cli *bitbucketserver.Client, urn string, pluginPerm bool) *Provider
```

NewProvider returns a new Bitbucket Server authorization provider that uses the given bitbucketserver.Client to talk to a Bitbucket Server API that is the source of truth for permissions. It assumes usernames of Sourcegraph accounts match 1-1 with usernames of Bitbucket Server API users. 

#### <a id="newProvider" href="#newProvider">func newProvider(cli *bitbucketserver.Client) *Provider</a>

```
searchKey: bitbucketserver.newProvider
tags: [function private]
```

```Go
func newProvider(cli *bitbucketserver.Client) *Provider
```

#### <a id="Provider.FetchAccount" href="#Provider.FetchAccount">func (p *Provider) FetchAccount(ctx context.Context, user *types.User, _ []*extsvc.Account, _ []string) (acct *extsvc.Account, err error)</a>

```
searchKey: bitbucketserver.Provider.FetchAccount
tags: [method]
```

```Go
func (p *Provider) FetchAccount(ctx context.Context, user *types.User, _ []*extsvc.Account, _ []string) (acct *extsvc.Account, err error)
```

FetchAccount satisfies the authz.Provider interface. 

#### <a id="Provider.FetchRepoPerms" href="#Provider.FetchRepoPerms">func (p *Provider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)</a>

```
searchKey: bitbucketserver.Provider.FetchRepoPerms
tags: [method]
```

```Go
func (p *Provider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)
```

FetchRepoPerms returns a list of user IDs (on code host) who have read access to the given repo on the code host. The user ID has the same value as it would be used as extsvc.Account.AccountID. The returned list includes both direct access and inherited from the group membership. 

This method may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

API docs: [https://docs.atlassian.com/bitbucket-server/rest/5.16.0/bitbucket-rest.html#idm8283203728](https://docs.atlassian.com/bitbucket-server/rest/5.16.0/bitbucket-rest.html#idm8283203728) 

#### <a id="Provider.FetchUserPerms" href="#Provider.FetchUserPerms">func (p *Provider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)</a>

```
searchKey: bitbucketserver.Provider.FetchUserPerms
tags: [method]
```

```Go
func (p *Provider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)
```

FetchUserPerms returns a list of repository IDs (on code host) that the given account has read access on the code host. The repository ID has the same value as it would be used as api.ExternalRepoSpec.ID. The returned list only includes private repository IDs. 

This method may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

API docs: [https://docs.atlassian.com/bitbucket-server/rest/5.16.0/bitbucket-rest.html#idm8296923984](https://docs.atlassian.com/bitbucket-server/rest/5.16.0/bitbucket-rest.html#idm8296923984) 

#### <a id="Provider.ServiceID" href="#Provider.ServiceID">func (p *Provider) ServiceID() string</a>

```
searchKey: bitbucketserver.Provider.ServiceID
tags: [method]
```

```Go
func (p *Provider) ServiceID() string
```

ServiceID returns the absolute URL that identifies the Bitbucket Server instance this provider is configured with. 

#### <a id="Provider.ServiceType" href="#Provider.ServiceType">func (p *Provider) ServiceType() string</a>

```
searchKey: bitbucketserver.Provider.ServiceType
tags: [method]
```

```Go
func (p *Provider) ServiceType() string
```

ServiceType returns the type of this Provider, namely, "bitbucketServer". 

#### <a id="Provider.URN" href="#Provider.URN">func (p *Provider) URN() string</a>

```
searchKey: bitbucketserver.Provider.URN
tags: [method]
```

```Go
func (p *Provider) URN() string
```

#### <a id="Provider.Validate" href="#Provider.Validate">func (p *Provider) Validate() []string</a>

```
searchKey: bitbucketserver.Provider.Validate
tags: [method]
```

```Go
func (p *Provider) Validate() []string
```

Validate validates that the Provider has access to the Bitbucket Server API with the OAuth credentials it was configured with. 

#### <a id="Provider.repoIDs" href="#Provider.repoIDs">func (p *Provider) repoIDs(ctx context.Context, username string, public bool) ([]uint32, error)</a>

```
searchKey: bitbucketserver.Provider.repoIDs
tags: [method private]
```

```Go
func (p *Provider) repoIDs(ctx context.Context, username string, public bool) ([]uint32, error)
```

#### <a id="Provider.repoIDsFromAPI" href="#Provider.repoIDsFromAPI">func (p *Provider) repoIDsFromAPI(ctx context.Context, username string, public bool) (ids []uint32, err error)</a>

```
searchKey: bitbucketserver.Provider.repoIDsFromAPI
tags: [method private]
```

```Go
func (p *Provider) repoIDsFromAPI(ctx context.Context, username string, public bool) (ids []uint32, err error)
```

repoIDsFromAPI returns all repositories for which the given user has the permission to read from the Bitbucket Server API. when no username is given, only public repos are returned. 

#### <a id="Provider.repoIDsFromPlugin" href="#Provider.repoIDsFromPlugin">func (p *Provider) repoIDsFromPlugin(ctx context.Context, username string) (ids []uint32, err error)</a>

```
searchKey: bitbucketserver.Provider.repoIDsFromPlugin
tags: [method private]
```

```Go
func (p *Provider) repoIDsFromPlugin(ctx context.Context, username string) (ids []uint32, err error)
```

#### <a id="Provider.user" href="#Provider.user">func (p *Provider) user(ctx context.Context, username string, fs ...bitbucketserver.UserFilter) (*bitbucketserver.User, error)</a>

```
searchKey: bitbucketserver.Provider.user
tags: [method private]
```

```Go
func (p *Provider) user(ctx context.Context, username string, fs ...bitbucketserver.UserFilter) (*bitbucketserver.User, error)
```

#### <a id="Provider.userIDs" href="#Provider.userIDs">func (p *Provider) userIDs(ctx context.Context, repoID string) (ids []int, err error)</a>

```
searchKey: bitbucketserver.Provider.userIDs
tags: [method private]
```

```Go
func (p *Provider) userIDs(ctx context.Context, repoID string) (ids []int, err error)
```

### <a id="codeHost" href="#codeHost">type codeHost struct</a>

```
searchKey: bitbucketserver.codeHost
tags: [struct private]
```

```Go
type codeHost struct {
	*extsvc.CodeHost
}
```

#### <a id="codeHost.externalAccount" href="#codeHost.externalAccount">func (h codeHost) externalAccount(userID int32, u *bitbucketserver.User) *extsvc.Account</a>

```
searchKey: bitbucketserver.codeHost.externalAccount
tags: [method private]
```

```Go
func (h codeHost) externalAccount(userID int32, u *bitbucketserver.User) *extsvc.Account
```

### <a id="fixtures" href="#fixtures">type fixtures struct</a>

```
searchKey: bitbucketserver.fixtures
tags: [struct private]
```

```Go
type fixtures struct {
	users             map[string]*bitbucketserver.User
	groups            map[string]*bitbucketserver.Group
	projects          map[string]*bitbucketserver.Project
	repos             map[string]*bitbucketserver.Repo
	groupProjectPerms []*bitbucketserver.GroupProjectPermission
	userRepoPerms     []*bitbucketserver.UserRepoPermission
}
```

fixtures contains the data we need loaded in Bitbucket Server API to run the Provider tests. Because we use VCR recordings, we don't need a Bitbucket Server API up and running to run those tests. But if you want to work on these tests / code, you need to start a new instance of Bitbucket Server with docker, create an Application Link as per [https://docs.sourcegraph.com/admin/external_service/bitbucket_server](https://docs.sourcegraph.com/admin/external_service/bitbucket_server), and then run the tests with -update=true. 

#### <a id="newFixtures" href="#newFixtures">func newFixtures() *fixtures</a>

```
searchKey: bitbucketserver.newFixtures
tags: [function private]
```

```Go
func newFixtures() *fixtures
```

#### <a id="fixtures.load" href="#fixtures.load">func (f fixtures) load(t *testing.T, cli *bitbucketserver.Client)</a>

```
searchKey: bitbucketserver.fixtures.load
tags: [method private]
```

```Go
func (f fixtures) load(t *testing.T, cli *bitbucketserver.Client)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewAuthzProviders" href="#NewAuthzProviders">func NewAuthzProviders(conns []*types.BitbucketServerConnection) (ps []authz.Provider, problems []string, warnings []string)</a>

```
searchKey: bitbucketserver.NewAuthzProviders
tags: [function]
```

```Go
func NewAuthzProviders(
	conns []*types.BitbucketServerConnection,
) (ps []authz.Provider, problems []string, warnings []string)
```

NewAuthzProviders returns the set of Bitbucket Server authz providers derived from the connections. It also returns any validation problems with the config, separating these into "serious problems" and "warnings". "Serious problems" are those that should make Sourcegraph set authz.allowAccessByDefault to false. "Warnings" are all other validation problems. 

### <a id="TestIntegration" href="#TestIntegration">func TestIntegration(t *testing.T)</a>

```
searchKey: bitbucketserver.TestIntegration
tags: [function private test]
```

```Go
func TestIntegration(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: bitbucketserver.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestProvider_Validate" href="#TestProvider_Validate">func TestProvider_Validate(t *testing.T)</a>

```
searchKey: bitbucketserver.TestProvider_Validate
tags: [function private test]
```

```Go
func TestProvider_Validate(t *testing.T)
```

### <a id="ValidateAuthz" href="#ValidateAuthz">func ValidateAuthz(c *schema.BitbucketServerConnection) error</a>

```
searchKey: bitbucketserver.ValidateAuthz
tags: [function]
```

```Go
func ValidateAuthz(c *schema.BitbucketServerConnection) error
```

ValidateAuthz validates the authorization fields of the given BitbucketServer external service config. 

### <a id="marshalJSON" href="#marshalJSON">func marshalJSON(v interface{}) []byte</a>

```
searchKey: bitbucketserver.marshalJSON
tags: [function private]
```

```Go
func marshalJSON(v interface{}) []byte
```

### <a id="newAuthzProvider" href="#newAuthzProvider">func newAuthzProvider(c *types.BitbucketServerConnection,...</a>

```
searchKey: bitbucketserver.newAuthzProvider
tags: [function private]
```

```Go
func newAuthzProvider(
	c *types.BitbucketServerConnection,
	pluginPerm bool,
) (authz.Provider, error)
```

### <a id="newClient" href="#newClient">func newClient(t *testing.T, name string) (*bitbucketserver.Client, func())</a>

```
searchKey: bitbucketserver.newClient
tags: [function private]
```

```Go
func newClient(t *testing.T, name string) (*bitbucketserver.Client, func())
```

### <a id="testProviderFetchAccount" href="#testProviderFetchAccount">func testProviderFetchAccount(f *fixtures, cli *bitbucketserver.Client) func(*testing.T)</a>

```
searchKey: bitbucketserver.testProviderFetchAccount
tags: [function private]
```

```Go
func testProviderFetchAccount(f *fixtures, cli *bitbucketserver.Client) func(*testing.T)
```

### <a id="testProviderFetchRepoPerms" href="#testProviderFetchRepoPerms">func testProviderFetchRepoPerms(f *fixtures, cli *bitbucketserver.Client) func(*testing.T)</a>

```
searchKey: bitbucketserver.testProviderFetchRepoPerms
tags: [function private]
```

```Go
func testProviderFetchRepoPerms(f *fixtures, cli *bitbucketserver.Client) func(*testing.T)
```

### <a id="testProviderFetchUserPerms" href="#testProviderFetchUserPerms">func testProviderFetchUserPerms(f *fixtures, cli *bitbucketserver.Client) func(*testing.T)</a>

```
searchKey: bitbucketserver.testProviderFetchUserPerms
tags: [function private]
```

```Go
func testProviderFetchUserPerms(f *fixtures, cli *bitbucketserver.Client) func(*testing.T)
```

