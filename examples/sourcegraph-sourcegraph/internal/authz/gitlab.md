# Package gitlab

## Index

* [Variables](#var)
    * [var NewOAuthProvider](#NewOAuthProvider)
    * [var NewSudoProvider](#NewSudoProvider)
* [Types](#type)
    * [type OAuthProvider struct](#OAuthProvider)
        * [func newOAuthProvider(op OAuthProviderOp, cli httpcli.Doer) *OAuthProvider](#newOAuthProvider)
        * [func (p *OAuthProvider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (mine *extsvc.Account, err error)](#OAuthProvider.FetchAccount)
        * [func (p *OAuthProvider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)](#OAuthProvider.FetchRepoPerms)
        * [func (p *OAuthProvider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)](#OAuthProvider.FetchUserPerms)
        * [func (p *OAuthProvider) ServiceID() string](#OAuthProvider.ServiceID)
        * [func (p *OAuthProvider) ServiceType() string](#OAuthProvider.ServiceType)
        * [func (p *OAuthProvider) URN() string](#OAuthProvider.URN)
        * [func (p *OAuthProvider) Validate() (problems []string)](#OAuthProvider.Validate)
    * [type OAuthProviderOp struct](#OAuthProviderOp)
    * [type SudoProvider struct](#SudoProvider)
        * [func newSudoProvider(op SudoProviderOp, cli httpcli.Doer) *SudoProvider](#newSudoProvider)
        * [func (p *SudoProvider) FetchAccount(ctx context.Context, user *types.User, current []*extsvc.Account, _ []string) (mine *extsvc.Account, err error)](#SudoProvider.FetchAccount)
        * [func (p *SudoProvider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)](#SudoProvider.FetchRepoPerms)
        * [func (p *SudoProvider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)](#SudoProvider.FetchUserPerms)
        * [func (p *SudoProvider) ServiceID() string](#SudoProvider.ServiceID)
        * [func (p *SudoProvider) ServiceType() string](#SudoProvider.ServiceType)
        * [func (p *SudoProvider) URN() string](#SudoProvider.URN)
        * [func (p *SudoProvider) Validate() (problems []string)](#SudoProvider.Validate)
        * [func (p *SudoProvider) fetchAccountByExternalUID(ctx context.Context, uid string) (*gitlab.User, error)](#SudoProvider.fetchAccountByExternalUID)
        * [func (p *SudoProvider) fetchAccountByUsername(ctx context.Context, username string) (*gitlab.User, error)](#SudoProvider.fetchAccountByUsername)
    * [type SudoProviderOp struct](#SudoProviderOp)
    * [type mockAuthnProvider struct](#mockAuthnProvider)
        * [func (m mockAuthnProvider) CachedInfo() *providers.Info](#mockAuthnProvider.CachedInfo)
        * [func (m mockAuthnProvider) Config() schema.AuthProviders](#mockAuthnProvider.Config)
        * [func (m mockAuthnProvider) ConfigID() providers.ConfigID](#mockAuthnProvider.ConfigID)
        * [func (m mockAuthnProvider) Refresh(ctx context.Context) error](#mockAuthnProvider.Refresh)
    * [type mockDoer struct](#mockDoer)
        * [func (c *mockDoer) Do(r *http.Request) (*http.Response, error)](#mockDoer.Do)
    * [type mockGitLab struct](#mockGitLab)
        * [func newMockGitLab(op mockGitLabOp) mockGitLab](#newMockGitLab)
        * [func (m *mockGitLab) GetProject(c *gitlab.Client, ctx context.Context, op gitlab.GetProjectOp) (*gitlab.Project, error)](#mockGitLab.GetProject)
        * [func (m *mockGitLab) ListProjects(c *gitlab.Client, ctx context.Context, urlStr string) (projs []*gitlab.Project, nextPageURL *string, err error)](#mockGitLab.ListProjects)
        * [func (m *mockGitLab) ListTree(c *gitlab.Client, ctx context.Context, op gitlab.ListTreeOp) ([]*gitlab.Tree, error)](#mockGitLab.ListTree)
        * [func (m *mockGitLab) ListUsers(c *gitlab.Client, ctx context.Context, urlStr string) (users []*gitlab.User, nextPageURL *string, err error)](#mockGitLab.ListUsers)
        * [func (m *mockGitLab) getAcctID(c *gitlab.Client) int32](#mockGitLab.getAcctID)
        * [func (m *mockGitLab) isClientAuthenticated(c *gitlab.Client) bool](#mockGitLab.isClientAuthenticated)
    * [type mockGitLabOp struct](#mockGitLabOp)
    * [type projSort []*gitlab.Project](#projSort)
        * [func (p projSort) Len() int](#projSort.Len)
        * [func (p projSort) Less(i, j int) bool](#projSort.Less)
        * [func (p projSort) Swap(i, j int)](#projSort.Swap)
* [Functions](#func)
    * [func NewAuthzProviders(cfg *conf.Unified,...](#NewAuthzProviders)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestOAuthProvider_FetchRepoPerms(t *testing.T)](#TestOAuthProvider_FetchRepoPerms)
    * [func TestOAuthProvider_FetchUserPerms(t *testing.T)](#TestOAuthProvider_FetchUserPerms)
    * [func TestSudoProvider_FetchRepoPerms(t *testing.T)](#TestSudoProvider_FetchRepoPerms)
    * [func TestSudoProvider_FetchUserPerms(t *testing.T)](#TestSudoProvider_FetchUserPerms)
    * [func Test_GitLab_FetchAccount(t *testing.T)](#Test_GitLab_FetchAccount)
    * [func ValidateAuthz(cfg *schema.GitLabConnection, ps []schema.AuthProviders) error](#ValidateAuthz)
    * [func acct(t *testing.T, userID int32, serviceType, serviceID, accountID, oauthTok string) *extsvc.Account](#acct)
    * [func getIntOrDefault(str string, def int) (int, error)](#getIntOrDefault)
    * [func init()](#init.common_test.go)
    * [func listMembers(ctx context.Context, client *gitlab.Client, repoID string) ([]extsvc.AccountID, error)](#listMembers)
    * [func listProjects(ctx context.Context, client *gitlab.Client) (*authz.ExternalUserPermissions, error)](#listProjects)
    * [func mustURL(t *testing.T, u string) *url.URL](#mustURL)
    * [func newAuthzProvider(urn string, a *schema.GitLabAuthorization, instanceURL, token string, tokenType gitlab.TokenType, ps []schema.AuthProviders) (authz.Provider, error)](#newAuthzProvider)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="NewOAuthProvider" href="#NewOAuthProvider">var NewOAuthProvider</a>

```
searchKey: gitlab.NewOAuthProvider
tags: [variable function]
```

```Go
var NewOAuthProvider = func(op OAuthProviderOp) authz.Provider {
	return newOAuthProvider(op, nil)
}
```

NewOAuthProvider is a mockable constructor for new OAuthProvider instances. 

### <a id="NewSudoProvider" href="#NewSudoProvider">var NewSudoProvider</a>

```
searchKey: gitlab.NewSudoProvider
tags: [variable function]
```

```Go
var NewSudoProvider = func(op SudoProviderOp) authz.Provider {
	return newSudoProvider(op, nil)
}
```

NewSudoProvider is a mockable constructor for new SudoProvider instances. 

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="OAuthProvider" href="#OAuthProvider">type OAuthProvider struct</a>

```
searchKey: gitlab.OAuthProvider
tags: [struct]
```

```Go
type OAuthProvider struct {
	// The token is the access token used for syncing repositories from the code host,
	// but it may or may not be a sudo-scoped.
	token     string
	tokenType gitlab.TokenType

	urn            string
	clientProvider *gitlab.ClientProvider
	clientURL      *url.URL
	codeHost       *extsvc.CodeHost
}
```

#### <a id="newOAuthProvider" href="#newOAuthProvider">func newOAuthProvider(op OAuthProviderOp, cli httpcli.Doer) *OAuthProvider</a>

```
searchKey: gitlab.newOAuthProvider
tags: [method private]
```

```Go
func newOAuthProvider(op OAuthProviderOp, cli httpcli.Doer) *OAuthProvider
```

#### <a id="OAuthProvider.FetchAccount" href="#OAuthProvider.FetchAccount">func (p *OAuthProvider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (mine *extsvc.Account, err error)</a>

```
searchKey: gitlab.OAuthProvider.FetchAccount
tags: [method]
```

```Go
func (p *OAuthProvider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (mine *extsvc.Account, err error)
```

#### <a id="OAuthProvider.FetchRepoPerms" href="#OAuthProvider.FetchRepoPerms">func (p *OAuthProvider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)</a>

```
searchKey: gitlab.OAuthProvider.FetchRepoPerms
tags: [method]
```

```Go
func (p *OAuthProvider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)
```

FetchRepoPerms returns a list of user IDs (on code host) who have read access to the given project on the code host. The user ID has the same value as it would be used as extsvc.Account.AccountID. The returned list includes both direct access and inherited from the group membership. 

This method may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

API docs: [https://docs.gitlab.com/ee/api/members.html#list-all-members-of-a-group-or-project-including-inherited-members](https://docs.gitlab.com/ee/api/members.html#list-all-members-of-a-group-or-project-including-inherited-members) 

#### <a id="OAuthProvider.FetchUserPerms" href="#OAuthProvider.FetchUserPerms">func (p *OAuthProvider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)</a>

```
searchKey: gitlab.OAuthProvider.FetchUserPerms
tags: [method]
```

```Go
func (p *OAuthProvider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)
```

FetchUserPerms returns a list of private project IDs (on code host) that the given account has read access to. The project ID has the same value as it would be used as api.ExternalRepoSpec.ID. The returned list only includes private project IDs. 

This method may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

API docs: [https://docs.gitlab.com/ee/api/projects.html#list-all-projects](https://docs.gitlab.com/ee/api/projects.html#list-all-projects) 

#### <a id="OAuthProvider.ServiceID" href="#OAuthProvider.ServiceID">func (p *OAuthProvider) ServiceID() string</a>

```
searchKey: gitlab.OAuthProvider.ServiceID
tags: [function]
```

```Go
func (p *OAuthProvider) ServiceID() string
```

#### <a id="OAuthProvider.ServiceType" href="#OAuthProvider.ServiceType">func (p *OAuthProvider) ServiceType() string</a>

```
searchKey: gitlab.OAuthProvider.ServiceType
tags: [function]
```

```Go
func (p *OAuthProvider) ServiceType() string
```

#### <a id="OAuthProvider.URN" href="#OAuthProvider.URN">func (p *OAuthProvider) URN() string</a>

```
searchKey: gitlab.OAuthProvider.URN
tags: [function]
```

```Go
func (p *OAuthProvider) URN() string
```

#### <a id="OAuthProvider.Validate" href="#OAuthProvider.Validate">func (p *OAuthProvider) Validate() (problems []string)</a>

```
searchKey: gitlab.OAuthProvider.Validate
tags: [function]
```

```Go
func (p *OAuthProvider) Validate() (problems []string)
```

### <a id="OAuthProviderOp" href="#OAuthProviderOp">type OAuthProviderOp struct</a>

```
searchKey: gitlab.OAuthProviderOp
tags: [struct]
```

```Go
type OAuthProviderOp struct {
	// The unique resource identifier of the external service where the provider is defined.
	URN string

	// BaseURL is the URL of the GitLab instance.
	BaseURL *url.URL

	// Token is an access token with api scope, it may or may not have sudo scope.
	//
	// 🚨 SECURITY: This value contains secret information that must not be shown to non-site-admins.
	Token string

	// TokenType is the type of the access token. Default is gitlab.TokenTypePAT.
	TokenType gitlab.TokenType
}
```

### <a id="SudoProvider" href="#SudoProvider">type SudoProvider struct</a>

```
searchKey: gitlab.SudoProvider
tags: [struct]
```

```Go
type SudoProvider struct {
	// sudoToken is the sudo-scoped access token. This is different from the Sudo parameter, which
	// is set per client and defines which user to impersonate.
	sudoToken string

	urn               string
	clientProvider    *gitlab.ClientProvider
	clientURL         *url.URL
	codeHost          *extsvc.CodeHost
	gitlabProvider    string
	authnConfigID     providers.ConfigID
	useNativeUsername bool
}
```

SudoProvider is an implementation of AuthzProvider that provides repository permissions as determined from a GitLab instance API. For documentation of specific fields, see the docstrings of SudoProviderOp. 

#### <a id="newSudoProvider" href="#newSudoProvider">func newSudoProvider(op SudoProviderOp, cli httpcli.Doer) *SudoProvider</a>

```
searchKey: gitlab.newSudoProvider
tags: [method private]
```

```Go
func newSudoProvider(op SudoProviderOp, cli httpcli.Doer) *SudoProvider
```

#### <a id="SudoProvider.FetchAccount" href="#SudoProvider.FetchAccount">func (p *SudoProvider) FetchAccount(ctx context.Context, user *types.User, current []*extsvc.Account, _ []string) (mine *extsvc.Account, err error)</a>

```
searchKey: gitlab.SudoProvider.FetchAccount
tags: [method]
```

```Go
func (p *SudoProvider) FetchAccount(ctx context.Context, user *types.User, current []*extsvc.Account, _ []string) (mine *extsvc.Account, err error)
```

FetchAccount satisfies the authz.Provider interface. It iterates through the current list of linked external accounts, find the one (if it exists) that matches the authn provider specified in the SudoProvider struct, and fetches the user account from the GitLab API using that identity. 

#### <a id="SudoProvider.FetchRepoPerms" href="#SudoProvider.FetchRepoPerms">func (p *SudoProvider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)</a>

```
searchKey: gitlab.SudoProvider.FetchRepoPerms
tags: [method]
```

```Go
func (p *SudoProvider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)
```

FetchRepoPerms returns a list of user IDs (on code host) who have read access to the given project on the code host. The user ID has the same value as it would be used as extsvc.Account.AccountID. The returned list includes both direct access and inherited from the group membership. 

This method may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

API docs: [https://docs.gitlab.com/ee/api/members.html#list-all-members-of-a-group-or-project-including-inherited-members](https://docs.gitlab.com/ee/api/members.html#list-all-members-of-a-group-or-project-including-inherited-members) 

#### <a id="SudoProvider.FetchUserPerms" href="#SudoProvider.FetchUserPerms">func (p *SudoProvider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)</a>

```
searchKey: gitlab.SudoProvider.FetchUserPerms
tags: [method]
```

```Go
func (p *SudoProvider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)
```

FetchUserPerms returns a list of project IDs (on code host) that the given account has read access on the code host. The project ID has the same value as it would be used as api.ExternalRepoSpec.ID. The returned list only includes private project IDs. 

This method may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

API docs: [https://docs.gitlab.com/ee/api/projects.html#list-all-projects](https://docs.gitlab.com/ee/api/projects.html#list-all-projects) 

#### <a id="SudoProvider.ServiceID" href="#SudoProvider.ServiceID">func (p *SudoProvider) ServiceID() string</a>

```
searchKey: gitlab.SudoProvider.ServiceID
tags: [function]
```

```Go
func (p *SudoProvider) ServiceID() string
```

#### <a id="SudoProvider.ServiceType" href="#SudoProvider.ServiceType">func (p *SudoProvider) ServiceType() string</a>

```
searchKey: gitlab.SudoProvider.ServiceType
tags: [function]
```

```Go
func (p *SudoProvider) ServiceType() string
```

#### <a id="SudoProvider.URN" href="#SudoProvider.URN">func (p *SudoProvider) URN() string</a>

```
searchKey: gitlab.SudoProvider.URN
tags: [function]
```

```Go
func (p *SudoProvider) URN() string
```

#### <a id="SudoProvider.Validate" href="#SudoProvider.Validate">func (p *SudoProvider) Validate() (problems []string)</a>

```
searchKey: gitlab.SudoProvider.Validate
tags: [function]
```

```Go
func (p *SudoProvider) Validate() (problems []string)
```

#### <a id="SudoProvider.fetchAccountByExternalUID" href="#SudoProvider.fetchAccountByExternalUID">func (p *SudoProvider) fetchAccountByExternalUID(ctx context.Context, uid string) (*gitlab.User, error)</a>

```
searchKey: gitlab.SudoProvider.fetchAccountByExternalUID
tags: [method private]
```

```Go
func (p *SudoProvider) fetchAccountByExternalUID(ctx context.Context, uid string) (*gitlab.User, error)
```

#### <a id="SudoProvider.fetchAccountByUsername" href="#SudoProvider.fetchAccountByUsername">func (p *SudoProvider) fetchAccountByUsername(ctx context.Context, username string) (*gitlab.User, error)</a>

```
searchKey: gitlab.SudoProvider.fetchAccountByUsername
tags: [method private]
```

```Go
func (p *SudoProvider) fetchAccountByUsername(ctx context.Context, username string) (*gitlab.User, error)
```

### <a id="SudoProviderOp" href="#SudoProviderOp">type SudoProviderOp struct</a>

```
searchKey: gitlab.SudoProviderOp
tags: [struct]
```

```Go
type SudoProviderOp struct {
	// The unique resource identifier of the external service where the provider is defined.
	URN string

	// BaseURL is the URL of the GitLab instance.
	BaseURL *url.URL

	// AuthnConfigID identifies the authn provider to use to lookup users on the GitLab instance.
	// This should be the authn provider that's used to sign into the GitLab instance.
	AuthnConfigID providers.ConfigID

	// GitLabProvider is the id of the authn provider to GitLab. It will be used in the
	// `users?extern_uid=$uid&provider=$provider` API query.
	GitLabProvider string

	// SudoToken is an access token with sudo *and* api scope.
	//
	// 🚨 SECURITY: This value contains secret information that must not be shown to non-site-admins.
	SudoToken string

	// UseNativeUsername, if true, maps Sourcegraph users to GitLab users using username equivalency
	// instead of the authn provider user ID. This is *very* insecure (Sourcegraph usernames can be
	// changed at the user's will) and should only be used in development environments.
	UseNativeUsername bool
}
```

### <a id="mockAuthnProvider" href="#mockAuthnProvider">type mockAuthnProvider struct</a>

```
searchKey: gitlab.mockAuthnProvider
tags: [struct private]
```

```Go
type mockAuthnProvider struct {
	configID  providers.ConfigID
	serviceID string
}
```

#### <a id="mockAuthnProvider.CachedInfo" href="#mockAuthnProvider.CachedInfo">func (m mockAuthnProvider) CachedInfo() *providers.Info</a>

```
searchKey: gitlab.mockAuthnProvider.CachedInfo
tags: [function private]
```

```Go
func (m mockAuthnProvider) CachedInfo() *providers.Info
```

#### <a id="mockAuthnProvider.Config" href="#mockAuthnProvider.Config">func (m mockAuthnProvider) Config() schema.AuthProviders</a>

```
searchKey: gitlab.mockAuthnProvider.Config
tags: [function private]
```

```Go
func (m mockAuthnProvider) Config() schema.AuthProviders
```

#### <a id="mockAuthnProvider.ConfigID" href="#mockAuthnProvider.ConfigID">func (m mockAuthnProvider) ConfigID() providers.ConfigID</a>

```
searchKey: gitlab.mockAuthnProvider.ConfigID
tags: [function private]
```

```Go
func (m mockAuthnProvider) ConfigID() providers.ConfigID
```

#### <a id="mockAuthnProvider.Refresh" href="#mockAuthnProvider.Refresh">func (m mockAuthnProvider) Refresh(ctx context.Context) error</a>

```
searchKey: gitlab.mockAuthnProvider.Refresh
tags: [method private]
```

```Go
func (m mockAuthnProvider) Refresh(ctx context.Context) error
```

### <a id="mockDoer" href="#mockDoer">type mockDoer struct</a>

```
searchKey: gitlab.mockDoer
tags: [struct private]
```

```Go
type mockDoer struct {
	do func(*http.Request) (*http.Response, error)
}
```

#### <a id="mockDoer.Do" href="#mockDoer.Do">func (c *mockDoer) Do(r *http.Request) (*http.Response, error)</a>

```
searchKey: gitlab.mockDoer.Do
tags: [method private]
```

```Go
func (c *mockDoer) Do(r *http.Request) (*http.Response, error)
```

### <a id="mockGitLab" href="#mockGitLab">type mockGitLab struct</a>

```
searchKey: gitlab.mockGitLab
tags: [struct private]
```

```Go
type mockGitLab struct {
	t *testing.T

	// projs is a map of all projects on the instance, keyed by project ID
	projs map[int]*gitlab.Project

	// users is a list of all users
	users []*gitlab.User

	// privateGuest is a map from GitLab user ID to list of metadata-accessible private project IDs on GitLab
	privateGuest map[int32][]int

	// privateRepo is a map from GitLab user ID to list of repo-content-accessible private project IDs on GitLab.
	// Projects in each list are also metadata-accessible.
	privateRepo map[int32][]int

	// oauthToks is a map from OAuth token to GitLab user account ID
	oauthToks map[string]int32

	// sudoTok is the sudo token, if there is one
	sudoTok string

	// madeGetProject records what GetProject calls have been made. It's a map from oauth token -> GetProjectOp -> count.
	madeGetProject map[string]map[gitlab.GetProjectOp]int

	// madeListProjects records what ListProjects calls have been made. It's a map from oauth token -> string (urlStr) -> count.
	madeListProjects map[string]map[string]int

	// madeListTree records what ListTree calls have been made. It's a map from oauth token -> ListTreeOp -> count.
	madeListTree map[string]map[gitlab.ListTreeOp]int

	// madeUsers records what ListUsers calls have been made. It's a map from oauth token -> URL string -> count
	madeUsers map[string]map[string]int
}
```

mockGitLab is a mock for the GitLab client that can be used by tests. Instantiating a mockGitLab instance itself does nothing, but its methods can be used to replace the mock functions (e.g., MockListProjects). 

We prefer to do it this way, instead of defining an interface for the GitLab client, because this preserves the ability to jump-to-def around the actual implementation. 

#### <a id="newMockGitLab" href="#newMockGitLab">func newMockGitLab(op mockGitLabOp) mockGitLab</a>

```
searchKey: gitlab.newMockGitLab
tags: [method private]
```

```Go
func newMockGitLab(op mockGitLabOp) mockGitLab
```

newMockGitLab returns a new mockGitLab instance 

#### <a id="mockGitLab.GetProject" href="#mockGitLab.GetProject">func (m *mockGitLab) GetProject(c *gitlab.Client, ctx context.Context, op gitlab.GetProjectOp) (*gitlab.Project, error)</a>

```
searchKey: gitlab.mockGitLab.GetProject
tags: [method private]
```

```Go
func (m *mockGitLab) GetProject(c *gitlab.Client, ctx context.Context, op gitlab.GetProjectOp) (*gitlab.Project, error)
```

#### <a id="mockGitLab.ListProjects" href="#mockGitLab.ListProjects">func (m *mockGitLab) ListProjects(c *gitlab.Client, ctx context.Context, urlStr string) (projs []*gitlab.Project, nextPageURL *string, err error)</a>

```
searchKey: gitlab.mockGitLab.ListProjects
tags: [method private]
```

```Go
func (m *mockGitLab) ListProjects(c *gitlab.Client, ctx context.Context, urlStr string) (projs []*gitlab.Project, nextPageURL *string, err error)
```

#### <a id="mockGitLab.ListTree" href="#mockGitLab.ListTree">func (m *mockGitLab) ListTree(c *gitlab.Client, ctx context.Context, op gitlab.ListTreeOp) ([]*gitlab.Tree, error)</a>

```
searchKey: gitlab.mockGitLab.ListTree
tags: [method private]
```

```Go
func (m *mockGitLab) ListTree(c *gitlab.Client, ctx context.Context, op gitlab.ListTreeOp) ([]*gitlab.Tree, error)
```

#### <a id="mockGitLab.ListUsers" href="#mockGitLab.ListUsers">func (m *mockGitLab) ListUsers(c *gitlab.Client, ctx context.Context, urlStr string) (users []*gitlab.User, nextPageURL *string, err error)</a>

```
searchKey: gitlab.mockGitLab.ListUsers
tags: [method private]
```

```Go
func (m *mockGitLab) ListUsers(c *gitlab.Client, ctx context.Context, urlStr string) (users []*gitlab.User, nextPageURL *string, err error)
```

#### <a id="mockGitLab.getAcctID" href="#mockGitLab.getAcctID">func (m *mockGitLab) getAcctID(c *gitlab.Client) int32</a>

```
searchKey: gitlab.mockGitLab.getAcctID
tags: [method private]
```

```Go
func (m *mockGitLab) getAcctID(c *gitlab.Client) int32
```

#### <a id="mockGitLab.isClientAuthenticated" href="#mockGitLab.isClientAuthenticated">func (m *mockGitLab) isClientAuthenticated(c *gitlab.Client) bool</a>

```
searchKey: gitlab.mockGitLab.isClientAuthenticated
tags: [method private]
```

```Go
func (m *mockGitLab) isClientAuthenticated(c *gitlab.Client) bool
```

isClientAuthenticated returns true if the client is authenticated. User is authenticated if OAuth token is non-empty (note: this mock impl doesn't verify validity of the OAuth token) or if the personal access token is non-empty (note: this mock impl requires that the PAT be equivalent to the mock GitLab sudo token). 

### <a id="mockGitLabOp" href="#mockGitLabOp">type mockGitLabOp struct</a>

```
searchKey: gitlab.mockGitLabOp
tags: [struct private]
```

```Go
type mockGitLabOp struct {
	t *testing.T

	// users is a list of users on the GitLab instance
	users []*gitlab.User

	// publicProjs is the list of public project IDs
	publicProjs []int

	// internalProjs is the list of internal project IDs
	internalProjs []int

	// privateProjs is a map from { privateProjectID -> [ guestUserIDs, contentUserIDs ] } It
	// determines the structure of private project permissions. A "guest" user can access private
	// project metadata, but not project repository contents. A "content" user can access both.
	privateProjs map[int][2][]int32

	// oauthToks is a map from OAuth tokens to the corresponding GitLab user ID
	oauthToks map[string]int32

	// sudoTok, if non-empty, is the personal access token accepted with sudo permissions on this
	// instance. The mock implementation only supports having one such token value.
	sudoTok string
}
```

### <a id="projSort" href="#projSort">type projSort []*gitlab.Project</a>

```
searchKey: gitlab.projSort
tags: [array struct private]
```

```Go
type projSort []*gitlab.Project
```

projSort sorts Projects in order of ID 

#### <a id="projSort.Len" href="#projSort.Len">func (p projSort) Len() int</a>

```
searchKey: gitlab.projSort.Len
tags: [function private]
```

```Go
func (p projSort) Len() int
```

#### <a id="projSort.Less" href="#projSort.Less">func (p projSort) Less(i, j int) bool</a>

```
searchKey: gitlab.projSort.Less
tags: [method private]
```

```Go
func (p projSort) Less(i, j int) bool
```

#### <a id="projSort.Swap" href="#projSort.Swap">func (p projSort) Swap(i, j int)</a>

```
searchKey: gitlab.projSort.Swap
tags: [method private]
```

```Go
func (p projSort) Swap(i, j int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewAuthzProviders" href="#NewAuthzProviders">func NewAuthzProviders(cfg *conf.Unified,...</a>

```
searchKey: gitlab.NewAuthzProviders
tags: [method]
```

```Go
func NewAuthzProviders(
	cfg *conf.Unified,
	conns []*types.GitLabConnection,
) (ps []authz.Provider, problems []string, warnings []string)
```

NewAuthzProviders returns the set of GitLab authz providers derived from the connections. It also returns any validation problems with the config, separating these into "serious problems" and "warnings". "Serious problems" are those that should make Sourcegraph set authz.allowAccessByDefault to false. "Warnings" are all other validation problems. 

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: gitlab.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestOAuthProvider_FetchRepoPerms" href="#TestOAuthProvider_FetchRepoPerms">func TestOAuthProvider_FetchRepoPerms(t *testing.T)</a>

```
searchKey: gitlab.TestOAuthProvider_FetchRepoPerms
tags: [method private test]
```

```Go
func TestOAuthProvider_FetchRepoPerms(t *testing.T)
```

### <a id="TestOAuthProvider_FetchUserPerms" href="#TestOAuthProvider_FetchUserPerms">func TestOAuthProvider_FetchUserPerms(t *testing.T)</a>

```
searchKey: gitlab.TestOAuthProvider_FetchUserPerms
tags: [method private test]
```

```Go
func TestOAuthProvider_FetchUserPerms(t *testing.T)
```

### <a id="TestSudoProvider_FetchRepoPerms" href="#TestSudoProvider_FetchRepoPerms">func TestSudoProvider_FetchRepoPerms(t *testing.T)</a>

```
searchKey: gitlab.TestSudoProvider_FetchRepoPerms
tags: [method private test]
```

```Go
func TestSudoProvider_FetchRepoPerms(t *testing.T)
```

### <a id="TestSudoProvider_FetchUserPerms" href="#TestSudoProvider_FetchUserPerms">func TestSudoProvider_FetchUserPerms(t *testing.T)</a>

```
searchKey: gitlab.TestSudoProvider_FetchUserPerms
tags: [method private test]
```

```Go
func TestSudoProvider_FetchUserPerms(t *testing.T)
```

### <a id="Test_GitLab_FetchAccount" href="#Test_GitLab_FetchAccount">func Test_GitLab_FetchAccount(t *testing.T)</a>

```
searchKey: gitlab.Test_GitLab_FetchAccount
tags: [method private test]
```

```Go
func Test_GitLab_FetchAccount(t *testing.T)
```

### <a id="ValidateAuthz" href="#ValidateAuthz">func ValidateAuthz(cfg *schema.GitLabConnection, ps []schema.AuthProviders) error</a>

```
searchKey: gitlab.ValidateAuthz
tags: [method]
```

```Go
func ValidateAuthz(cfg *schema.GitLabConnection, ps []schema.AuthProviders) error
```

ValidateAuthz validates the authorization fields of the given GitLab external service config. 

### <a id="acct" href="#acct">func acct(t *testing.T, userID int32, serviceType, serviceID, accountID, oauthTok string) *extsvc.Account</a>

```
searchKey: gitlab.acct
tags: [method private]
```

```Go
func acct(t *testing.T, userID int32, serviceType, serviceID, accountID, oauthTok string) *extsvc.Account
```

### <a id="getIntOrDefault" href="#getIntOrDefault">func getIntOrDefault(str string, def int) (int, error)</a>

```
searchKey: gitlab.getIntOrDefault
tags: [method private]
```

```Go
func getIntOrDefault(str string, def int) (int, error)
```

### <a id="init.common_test.go" href="#init.common_test.go">func init()</a>

```
searchKey: gitlab.init
tags: [function private]
```

```Go
func init()
```

### <a id="listMembers" href="#listMembers">func listMembers(ctx context.Context, client *gitlab.Client, repoID string) ([]extsvc.AccountID, error)</a>

```
searchKey: gitlab.listMembers
tags: [method private]
```

```Go
func listMembers(ctx context.Context, client *gitlab.Client, repoID string) ([]extsvc.AccountID, error)
```

listMembers is a helper function to request for all users who has read access (access level: 20 => Reporter access) to given project on the code host, including both direct access and inherited from the group membership. It may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

### <a id="listProjects" href="#listProjects">func listProjects(ctx context.Context, client *gitlab.Client) (*authz.ExternalUserPermissions, error)</a>

```
searchKey: gitlab.listProjects
tags: [method private]
```

```Go
func listProjects(ctx context.Context, client *gitlab.Client) (*authz.ExternalUserPermissions, error)
```

listProjects is a helper function to request for all private projects that are accessible (access level: 20 => Reporter access) by the authenticated or impersonated user in the client. It may return partial but valid results in case of error, and it is up to callers to decide whether to discard. 

### <a id="mustURL" href="#mustURL">func mustURL(t *testing.T, u string) *url.URL</a>

```
searchKey: gitlab.mustURL
tags: [method private]
```

```Go
func mustURL(t *testing.T, u string) *url.URL
```

### <a id="newAuthzProvider" href="#newAuthzProvider">func newAuthzProvider(urn string, a *schema.GitLabAuthorization, instanceURL, token string, tokenType gitlab.TokenType, ps []schema.AuthProviders) (authz.Provider, error)</a>

```
searchKey: gitlab.newAuthzProvider
tags: [method private]
```

```Go
func newAuthzProvider(urn string, a *schema.GitLabAuthorization, instanceURL, token string, tokenType gitlab.TokenType, ps []schema.AuthProviders) (authz.Provider, error)
```

