# Package perforce

## Index

* [Types](#type)
    * [type Provider struct](#Provider)
        * [func NewProvider(urn, host, user, password string) *Provider](#NewProvider)
        * [func (p *Provider) FetchAccount(ctx context.Context, user *types.User, _ []*extsvc.Account, verifiedEmails []string) (_ *extsvc.Account, err error)](#Provider.FetchAccount)
        * [func (p *Provider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)](#Provider.FetchRepoPerms)
        * [func (p *Provider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)](#Provider.FetchUserPerms)
        * [func (p *Provider) ServiceID() string](#Provider.ServiceID)
        * [func (p *Provider) ServiceType() string](#Provider.ServiceType)
        * [func (p *Provider) URN() string](#Provider.URN)
        * [func (p *Provider) Validate() (problems []string)](#Provider.Validate)
        * [func (p *Provider) canGrantReadAccess(level string) bool](#Provider.canGrantReadAccess)
        * [func (p *Provider) canRevokeReadAccess(level string) bool](#Provider.canRevokeReadAccess)
        * [func (p *Provider) getAllUserEmails(ctx context.Context) (map[string]string, error)](#Provider.getAllUserEmails)
        * [func (p *Provider) getAllUsers(ctx context.Context) ([]string, error)](#Provider.getAllUsers)
        * [func (p *Provider) getGroupMembers(ctx context.Context, group string) ([]string, error)](#Provider.getGroupMembers)
* [Functions](#func)
    * [func NewAuthzProviders(conns []*types.PerforceConnection) (ps []authz.Provider, problems []string, warnings []string)](#NewAuthzProviders)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestProvider_FetchAccount(t *testing.T)](#TestProvider_FetchAccount)
    * [func TestProvider_FetchRepoPerms(t *testing.T)](#TestProvider_FetchRepoPerms)
    * [func TestProvider_FetchUserPerms(t *testing.T)](#TestProvider_FetchUserPerms)
    * [func ValidateAuthz(cfg *schema.PerforceConnection) error](#ValidateAuthz)
    * [func newAuthzProvider(urn string,...](#newAuthzProvider)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Provider" href="#Provider">type Provider struct</a>

```
searchKey: perforce.Provider
tags: [struct]
```

```Go
type Provider struct {
	urn      string
	codeHost *extsvc.CodeHost

	host     string
	user     string
	password string

	// NOTE: We do not need mutex because there is no concurrent access to these
	// 	fields in the current implementation.
	cachedAllUserEmails map[string]string   // username <-> email
	cachedGroupMembers  map[string][]string // group <-> members
}
```

Provider implements authz.Provider for Perforce depot permissions. 

#### <a id="NewProvider" href="#NewProvider">func NewProvider(urn, host, user, password string) *Provider</a>

```
searchKey: perforce.NewProvider
tags: [method]
```

```Go
func NewProvider(urn, host, user, password string) *Provider
```

NewProvider returns a new Perforce authorization provider that uses the given host, user and password to talk to a Perforce Server that is the source of truth for permissions. It assumes emails of Sourcegraph accounts match 1-1 with emails of Perforce Server users. 

#### <a id="Provider.FetchAccount" href="#Provider.FetchAccount">func (p *Provider) FetchAccount(ctx context.Context, user *types.User, _ []*extsvc.Account, verifiedEmails []string) (_ *extsvc.Account, err error)</a>

```
searchKey: perforce.Provider.FetchAccount
tags: [method]
```

```Go
func (p *Provider) FetchAccount(ctx context.Context, user *types.User, _ []*extsvc.Account, verifiedEmails []string) (_ *extsvc.Account, err error)
```

FetchAccount uses given user's verified emails to match users on the Perforce Server. It returns when any of the verified email has matched and the match result is not deterministic. 

#### <a id="Provider.FetchRepoPerms" href="#Provider.FetchRepoPerms">func (p *Provider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)</a>

```
searchKey: perforce.Provider.FetchRepoPerms
tags: [method]
```

```Go
func (p *Provider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)
```

FetchRepoPerms returns a list of users that have access to the given repository on the Perforce Server. 

#### <a id="Provider.FetchUserPerms" href="#Provider.FetchUserPerms">func (p *Provider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)</a>

```
searchKey: perforce.Provider.FetchUserPerms
tags: [method]
```

```Go
func (p *Provider) FetchUserPerms(ctx context.Context, account *extsvc.Account) (*authz.ExternalUserPermissions, error)
```

FetchUserPerms returns a list of depot prefixes that the given user has access to on the Perforce Server. 

#### <a id="Provider.ServiceID" href="#Provider.ServiceID">func (p *Provider) ServiceID() string</a>

```
searchKey: perforce.Provider.ServiceID
tags: [function]
```

```Go
func (p *Provider) ServiceID() string
```

#### <a id="Provider.ServiceType" href="#Provider.ServiceType">func (p *Provider) ServiceType() string</a>

```
searchKey: perforce.Provider.ServiceType
tags: [function]
```

```Go
func (p *Provider) ServiceType() string
```

#### <a id="Provider.URN" href="#Provider.URN">func (p *Provider) URN() string</a>

```
searchKey: perforce.Provider.URN
tags: [function]
```

```Go
func (p *Provider) URN() string
```

#### <a id="Provider.Validate" href="#Provider.Validate">func (p *Provider) Validate() (problems []string)</a>

```
searchKey: perforce.Provider.Validate
tags: [function]
```

```Go
func (p *Provider) Validate() (problems []string)
```

#### <a id="Provider.canGrantReadAccess" href="#Provider.canGrantReadAccess">func (p *Provider) canGrantReadAccess(level string) bool</a>

```
searchKey: perforce.Provider.canGrantReadAccess
tags: [method private]
```

```Go
func (p *Provider) canGrantReadAccess(level string) bool
```

canGrantReadAccess returns true if the given access level is able to grant read account for a depot prefix. 

#### <a id="Provider.canRevokeReadAccess" href="#Provider.canRevokeReadAccess">func (p *Provider) canRevokeReadAccess(level string) bool</a>

```
searchKey: perforce.Provider.canRevokeReadAccess
tags: [method private]
```

```Go
func (p *Provider) canRevokeReadAccess(level string) bool
```

canRevokeReadAccess returns true if the given access level is able to revoke read account for a depot prefix. 

#### <a id="Provider.getAllUserEmails" href="#Provider.getAllUserEmails">func (p *Provider) getAllUserEmails(ctx context.Context) (map[string]string, error)</a>

```
searchKey: perforce.Provider.getAllUserEmails
tags: [method private]
```

```Go
func (p *Provider) getAllUserEmails(ctx context.Context) (map[string]string, error)
```

getAllUserEmails returns a set of username <-> email pairs of all users in the Perforce server. 

#### <a id="Provider.getAllUsers" href="#Provider.getAllUsers">func (p *Provider) getAllUsers(ctx context.Context) ([]string, error)</a>

```
searchKey: perforce.Provider.getAllUsers
tags: [method private]
```

```Go
func (p *Provider) getAllUsers(ctx context.Context) ([]string, error)
```

getAllUsers returns a list of usernames of all users in the Perforce server. 

#### <a id="Provider.getGroupMembers" href="#Provider.getGroupMembers">func (p *Provider) getGroupMembers(ctx context.Context, group string) ([]string, error)</a>

```
searchKey: perforce.Provider.getGroupMembers
tags: [method private]
```

```Go
func (p *Provider) getGroupMembers(ctx context.Context, group string) ([]string, error)
```

getGroupMembers returns all members of the given group in the Perforce server. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewAuthzProviders" href="#NewAuthzProviders">func NewAuthzProviders(conns []*types.PerforceConnection) (ps []authz.Provider, problems []string, warnings []string)</a>

```
searchKey: perforce.NewAuthzProviders
tags: [method]
```

```Go
func NewAuthzProviders(conns []*types.PerforceConnection) (ps []authz.Provider, problems []string, warnings []string)
```

NewAuthzProviders returns the set of Perforce authz providers derived from the connections. It also returns any validation problems with the config, separating these into "serious problems" and "warnings". "Serious problems" are those that should make Sourcegraph set authz.allowAccessByDefault to false. "Warnings" are all other validation problems. 

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: perforce.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestProvider_FetchAccount" href="#TestProvider_FetchAccount">func TestProvider_FetchAccount(t *testing.T)</a>

```
searchKey: perforce.TestProvider_FetchAccount
tags: [method private test]
```

```Go
func TestProvider_FetchAccount(t *testing.T)
```

### <a id="TestProvider_FetchRepoPerms" href="#TestProvider_FetchRepoPerms">func TestProvider_FetchRepoPerms(t *testing.T)</a>

```
searchKey: perforce.TestProvider_FetchRepoPerms
tags: [method private test]
```

```Go
func TestProvider_FetchRepoPerms(t *testing.T)
```

### <a id="TestProvider_FetchUserPerms" href="#TestProvider_FetchUserPerms">func TestProvider_FetchUserPerms(t *testing.T)</a>

```
searchKey: perforce.TestProvider_FetchUserPerms
tags: [method private test]
```

```Go
func TestProvider_FetchUserPerms(t *testing.T)
```

### <a id="ValidateAuthz" href="#ValidateAuthz">func ValidateAuthz(cfg *schema.PerforceConnection) error</a>

```
searchKey: perforce.ValidateAuthz
tags: [method]
```

```Go
func ValidateAuthz(cfg *schema.PerforceConnection) error
```

ValidateAuthz validates the authorization fields of the given Perforce external service config. 

### <a id="newAuthzProvider" href="#newAuthzProvider">func newAuthzProvider(urn string,...</a>

```
searchKey: perforce.newAuthzProvider
tags: [method private]
```

```Go
func newAuthzProvider(
	urn string,
	a *schema.PerforceAuthorization,
	host, user, password string,
) (authz.Provider, error)
```

