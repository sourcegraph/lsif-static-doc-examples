# Package authz

Package authz contains common logic and interfaces for authorization to external providers (such as GitLab). 

## Index

* Subpages
  * [internal/authz/bitbucketserver](authz/bitbucketserver.md)
  * [internal/authz/github](authz/github.md)
  * [internal/authz/gitlab](authz/gitlab.md)
  * [internal/authz/perforce](authz/perforce.md)
* [Constants](#const)
    * [const None](#None)
    * [const PermRepos](#PermRepos)
    * [const Read](#Read)
    * [const SchemeToken](#SchemeToken)
    * [const SchemeTokenSudo](#SchemeTokenSudo)
    * [const ScopeSiteAdminSudo](#ScopeSiteAdminSudo)
    * [const ScopeUserAll](#ScopeUserAll)
    * [const SourcegraphServiceID](#SourcegraphServiceID)
    * [const SourcegraphServiceType](#SourcegraphServiceType)
    * [const Write](#Write)
* [Variables](#var)
    * [var AllScopes](#AllScopes)
    * [var ErrPermsNotFound](#ErrPermsNotFound)
    * [var allowAccessByDefault](#allowAccessByDefault)
    * [var authzMu](#authzMu)
    * [var authzProviders](#authzProviders)
    * [var authzProvidersReady](#authzProvidersReady)
    * [var authzProvidersReadyOnce](#authzProvidersReadyOnce)
    * [var errHTTPAuthParamsDuplicateKey](#errHTTPAuthParamsDuplicateKey)
    * [var errHTTPAuthParamsNoEquals](#errHTTPAuthParamsNoEquals)
    * [var errUnrecognizedScheme](#errUnrecognizedScheme)
    * [var isTest](#isTest)
* [Types](#type)
    * [type ErrStalePermissions struct](#ErrStalePermissions)
        * [func (e ErrStalePermissions) Error() string](#ErrStalePermissions.Error)
    * [type ExternalUserPermissions struct](#ExternalUserPermissions)
    * [type PermType string](#PermType)
    * [type Perms uint32](#Perms)
        * [func (p Perms) Include(other Perms) bool](#Perms.Include)
        * [func (p Perms) String() string](#Perms.String)
    * [type Provider interface](#Provider)
    * [type RepoPermissions struct](#RepoPermissions)
        * [func (p *RepoPermissions) Expired(ttl time.Duration, now time.Time) bool](#RepoPermissions.Expired)
        * [func (p *RepoPermissions) TracingFields() []otlog.Field](#RepoPermissions.TracingFields)
    * [type RepoPerms struct](#RepoPerms)
    * [type RepoPermsSort []authz.RepoPerms](#RepoPermsSort)
        * [func (s RepoPermsSort) Len() int](#RepoPermsSort.Len)
        * [func (s RepoPermsSort) Less(i, j int) bool](#RepoPermsSort.Less)
        * [func (s RepoPermsSort) Swap(i, j int)](#RepoPermsSort.Swap)
    * [type UserPendingPermissions struct](#UserPendingPermissions)
        * [func (p *UserPendingPermissions) TracingFields() []otlog.Field](#UserPendingPermissions.TracingFields)
    * [type UserPermissions struct](#UserPermissions)
        * [func (p *UserPermissions) AuthorizedRepos(repos []*types.Repo) []RepoPerms](#UserPermissions.AuthorizedRepos)
        * [func (p *UserPermissions) Expired(ttl time.Duration, now time.Time) bool](#UserPermissions.Expired)
        * [func (p *UserPermissions) TracingFields() []otlog.Field](#UserPermissions.TracingFields)
* [Functions](#func)
    * [func BenchmarkPermsInclude(b *testing.B)](#BenchmarkPermsInclude)
    * [func BenchmarkPermsString(b *testing.B)](#BenchmarkPermsString)
    * [func GetProviders() (authzAllowByDefault bool, providers []Provider)](#GetProviders)
    * [func IsUnrecognizedScheme(err error) bool](#IsUnrecognizedScheme)
    * [func ParseAuthorizationHeader(headerValue string) (token, sudoUser string, err error)](#ParseAuthorizationHeader)
    * [func SetProviders(authzAllowByDefault bool, z []Provider)](#SetProviders)
    * [func TestParseAuthorizationHeader(t *testing.T)](#TestParseAuthorizationHeader)
    * [func TestParseHTTPCredentials(t *testing.T)](#TestParseHTTPCredentials)
    * [func TestPermsInclude(t *testing.T)](#TestPermsInclude)
    * [func TestPermsString(t *testing.T)](#TestPermsString)
    * [func TestUserPermissions_AuthorizedRepos(t *testing.T)](#TestUserPermissions_AuthorizedRepos)
    * [func bitmap(ids ...uint32) *roaring.Bitmap](#bitmap)
    * [func parseHTTPAuthParams(value string) (params map[string]string, err error)](#parseHTTPAuthParams)
    * [func parseHTTPCredentials(credentials string) (scheme, token68 string, params map[string]string, err error)](#parseHTTPCredentials)
    * [func parseHTTPHeaderList(value string) []string](#parseHTTPHeaderList)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="None" href="#None">const None</a>

```
searchKey: authz.None
tags: [constant number]
```

```Go
const None Perms = 0
```

Perm constants. 

### <a id="PermRepos" href="#PermRepos">const PermRepos</a>

```
searchKey: authz.PermRepos
tags: [constant string]
```

```Go
const PermRepos PermType = "repos"
```

PermRepos is the list of available user permission types. 

### <a id="Read" href="#Read">const Read</a>

```
searchKey: authz.Read
tags: [constant number]
```

```Go
const Read Perms = 1 << iota
```

Perm constants. 

### <a id="SchemeToken" href="#SchemeToken">const SchemeToken</a>

```
searchKey: authz.SchemeToken
tags: [constant string]
```

```Go
const SchemeToken = "token" // Scheme for Authorization header with only an access token

```

### <a id="SchemeTokenSudo" href="#SchemeTokenSudo">const SchemeTokenSudo</a>

```
searchKey: authz.SchemeTokenSudo
tags: [constant string]
```

```Go
const SchemeTokenSudo // Scheme for Authorization header with access token and sudo user
 = ...
```

### <a id="ScopeSiteAdminSudo" href="#ScopeSiteAdminSudo">const ScopeSiteAdminSudo</a>

```
searchKey: authz.ScopeSiteAdminSudo
tags: [constant string]
```

```Go
const ScopeSiteAdminSudo = "site-admin:sudo" // Ability to perform any action as any other user.

```

### <a id="ScopeUserAll" href="#ScopeUserAll">const ScopeUserAll</a>

```
searchKey: authz.ScopeUserAll
tags: [constant string]
```

```Go
const ScopeUserAll = "user:all" // Full control of all resources accessible to the user account.

```

Access token scopes. 

### <a id="SourcegraphServiceID" href="#SourcegraphServiceID">const SourcegraphServiceID</a>

```
searchKey: authz.SourcegraphServiceID
tags: [constant string]
```

```Go
const SourcegraphServiceID = "https://sourcegraph.com/"
```

The service type and service ID for explicit repository permissions APIs (aka Sourcegraph authz provider). 

### <a id="SourcegraphServiceType" href="#SourcegraphServiceType">const SourcegraphServiceType</a>

```
searchKey: authz.SourcegraphServiceType
tags: [constant string]
```

```Go
const SourcegraphServiceType = "sourcegraph"
```

The service type and service ID for explicit repository permissions APIs (aka Sourcegraph authz provider). 

### <a id="Write" href="#Write">const Write</a>

```
searchKey: authz.Write
tags: [constant number]
```

```Go
const Write
```

Perm constants. 

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="AllScopes" href="#AllScopes">var AllScopes</a>

```
searchKey: authz.AllScopes
tags: [variable array string]
```

```Go
var AllScopes = []string{
	ScopeUserAll,
	ScopeSiteAdminSudo,
}
```

AllScopes is a list of all known access token scopes. 

### <a id="ErrPermsNotFound" href="#ErrPermsNotFound">var ErrPermsNotFound</a>

```
searchKey: authz.ErrPermsNotFound
tags: [variable interface]
```

```Go
var ErrPermsNotFound = errors.New("permissions not found")
```

### <a id="allowAccessByDefault" href="#allowAccessByDefault">var allowAccessByDefault</a>

```
searchKey: authz.allowAccessByDefault
tags: [variable boolean private]
```

```Go
var allowAccessByDefault = true
```

allowAccessByDefault, if set to true, grants all users access to repositories that are not matched by any authz provider. The default value is true. It is only set to false in error modes (when the configuration is in a state where interpreting it literally could lead to leakage of private repositories). 

### <a id="authzMu" href="#authzMu">var authzMu</a>

```
searchKey: authz.authzMu
tags: [variable struct private]
```

```Go
var authzMu sync.RWMutex
```

authzMu protects access to both allowAccessByDefault and authzProviders 

### <a id="authzProviders" href="#authzProviders">var authzProviders</a>

```
searchKey: authz.authzProviders
tags: [variable array interface private]
```

```Go
var authzProviders []Provider
```

authzProviders is the currently registered list of authorization providers. 

### <a id="authzProvidersReady" href="#authzProvidersReady">var authzProvidersReady</a>

```
searchKey: authz.authzProvidersReady
tags: [variable private]
```

```Go
var authzProvidersReady = make(chan struct{})
```

### <a id="authzProvidersReadyOnce" href="#authzProvidersReadyOnce">var authzProvidersReadyOnce</a>

```
searchKey: authz.authzProvidersReadyOnce
tags: [variable struct private]
```

```Go
var authzProvidersReadyOnce sync.Once
```

authzProvidersReady and authzProvidersReadyOnce together indicate when GetProviders should no longer block. It should block until SetProviders is called at least once. 

### <a id="errHTTPAuthParamsDuplicateKey" href="#errHTTPAuthParamsDuplicateKey">var errHTTPAuthParamsDuplicateKey</a>

```
searchKey: authz.errHTTPAuthParamsDuplicateKey
tags: [variable interface private]
```

```Go
var errHTTPAuthParamsDuplicateKey = errors.New("duplicate key in HTTP auth-params")
```

### <a id="errHTTPAuthParamsNoEquals" href="#errHTTPAuthParamsNoEquals">var errHTTPAuthParamsNoEquals</a>

```
searchKey: authz.errHTTPAuthParamsNoEquals
tags: [variable interface private]
```

```Go
var errHTTPAuthParamsNoEquals = errors.New("invalid HTTP auth-params list (parameter has no value)")
```

### <a id="errUnrecognizedScheme" href="#errUnrecognizedScheme">var errUnrecognizedScheme</a>

```
searchKey: authz.errUnrecognizedScheme
tags: [variable interface private]
```

```Go
var errUnrecognizedScheme = ...
```

errUnrecognizedScheme occurs when the Authorization header scheme (the first token) is not recognized. 

### <a id="isTest" href="#isTest">var isTest</a>

```
searchKey: authz.isTest
tags: [variable boolean private]
```

```Go
var isTest = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="ErrStalePermissions" href="#ErrStalePermissions">type ErrStalePermissions struct</a>

```
searchKey: authz.ErrStalePermissions
tags: [struct]
```

```Go
type ErrStalePermissions struct {
	UserID int32
	Perm   Perms
	Type   PermType
}
```

ErrStalePermissions is returned by LoadPermissions when the stored permissions are stale (e.g. the first time a user needs them and they haven't been fetched yet). Callers should pass this error up to the user and show a more friendly prompt message in the UI. 

#### <a id="ErrStalePermissions.Error" href="#ErrStalePermissions.Error">func (e ErrStalePermissions) Error() string</a>

```
searchKey: authz.ErrStalePermissions.Error
tags: [function]
```

```Go
func (e ErrStalePermissions) Error() string
```

Error implements the error interface. 

### <a id="ExternalUserPermissions" href="#ExternalUserPermissions">type ExternalUserPermissions struct</a>

```
searchKey: authz.ExternalUserPermissions
tags: [struct]
```

```Go
type ExternalUserPermissions struct {
	Exacts          []extsvc.RepoID
	IncludePrefixes []extsvc.RepoID
	ExcludePrefixes []extsvc.RepoID
}
```

ExternalUserPermissions is a collection of accessible repository/project IDs (on code host). It contains exact IDs, as well as prefixes to both include and exclude IDs. 

🚨 SECURITY: Every call site should evaluate all fields of this struct to have a complete set of IDs. 

### <a id="PermType" href="#PermType">type PermType string</a>

```
searchKey: authz.PermType
tags: [string]
```

```Go
type PermType string
```

PermType is the object type of the user permissions. 

### <a id="Perms" href="#Perms">type Perms uint32</a>

```
searchKey: authz.Perms
tags: [number]
```

```Go
type Perms uint32
```

Perms is a permission set represented as bitset. 

#### <a id="Perms.Include" href="#Perms.Include">func (p Perms) Include(other Perms) bool</a>

```
searchKey: authz.Perms.Include
tags: [method]
```

```Go
func (p Perms) Include(other Perms) bool
```

Include is a convenience method to test if Perms includes all the other Perms. 

#### <a id="Perms.String" href="#Perms.String">func (p Perms) String() string</a>

```
searchKey: authz.Perms.String
tags: [function]
```

```Go
func (p Perms) String() string
```

String implements the fmt.Stringer interface. 

### <a id="Provider" href="#Provider">type Provider interface</a>

```
searchKey: authz.Provider
tags: [interface]
```

```Go
type Provider interface {
	// FetchAccount returns the external account that identifies the user to this authz provider,
	// taking as input the current list of external accounts associated with the
	// user. Implementations should always recompute the returned account (rather than returning an
	// element of `current` if it has the correct ServiceID and ServiceType).
	//
	// Implementations should use only the `user` and `current` parameters to compute the returned
	// external account. Specifically, they should not try to get the currently authenticated user
	// from the context parameter.
	//
	// The `user` argument should always be non-nil. If no external account can be computed for the
	// provided user, implementations should return nil, nil.
	//
	// The `verifiedEmails` should only contain a list of verified emails that is
	// associated to the `user`.
	FetchAccount(ctx context.Context, user *types.User, current []*extsvc.Account, verifiedEmails []string) (mine *extsvc.Account, err error)

	// FetchUserPerms returns a collection of accessible repository/project IDs (on
	// code host) that the given account has read access on the code host. The
	// repository/project ID should be the same value as it would be used as or
	// prefix of api.ExternalRepoSpec.ID. The returned set should only include
	// private repositories/project IDs.
	//
	// Because permissions fetching APIs are often expensive, the implementation should
	// try to return partial but valid results in case of error, and it is up to callers
	// to decide whether to discard.
	FetchUserPerms(ctx context.Context, account *extsvc.Account) (*ExternalUserPermissions, error)

	// FetchRepoPerms returns a list of user IDs (on code host) who have read access to
	// the given repository/project on the code host. The user ID should be the same value
	// as it would be used as extsvc.Account.AccountID. The returned list should
	// include both direct access and inherited from the group/organization/team membership.
	//
	// Because permissions fetching APIs are often expensive, the implementation should
	// try to return partial but valid results in case of error, and it is up to callers
	// to decide whether to discard.
	FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)

	// ServiceType returns the service type (e.g., "gitlab") of this authz provider.
	ServiceType() string

	// ServiceID returns the service ID (e.g., "https://gitlab.mycompany.com/") of this authz
	// provider.
	ServiceID() string

	// URN returns the unique resource identifier of external service where the authz provider
	// is defined.
	URN() string

	// Validate checks the configuration and credentials of the authz provider and returns any
	// problems.
	Validate() (problems []string)
}
```

Provider defines a source of truth of which repositories a user is authorized to view. The user is identified by an extsvc.Account instance. Examples of authz providers include the following: 

* Code host * LDAP groups * SAML identity provider (via SAML group permissions) 

In most cases, an authz provider represents a code host, because it is the source of truth for repository permissions. 

### <a id="RepoPermissions" href="#RepoPermissions">type RepoPermissions struct</a>

```
searchKey: authz.RepoPermissions
tags: [struct]
```

```Go
type RepoPermissions struct {
	RepoID    int32           // The internal database ID of a repository
	Perm      Perms           // The permission set
	UserIDs   *roaring.Bitmap // The user IDs
	UpdatedAt time.Time       // The last updated time
	SyncedAt  time.Time       // The last repo-centric synced time
}
```

RepoPermissions declares which users have access to a given repository 

#### <a id="RepoPermissions.Expired" href="#RepoPermissions.Expired">func (p *RepoPermissions) Expired(ttl time.Duration, now time.Time) bool</a>

```
searchKey: authz.RepoPermissions.Expired
tags: [method]
```

```Go
func (p *RepoPermissions) Expired(ttl time.Duration, now time.Time) bool
```

Expired returns true if these RepoPermissions have elapsed the given ttl. 

#### <a id="RepoPermissions.TracingFields" href="#RepoPermissions.TracingFields">func (p *RepoPermissions) TracingFields() []otlog.Field</a>

```
searchKey: authz.RepoPermissions.TracingFields
tags: [function]
```

```Go
func (p *RepoPermissions) TracingFields() []otlog.Field
```

TracingFields returns tracing fields for the opentracing log. 

### <a id="RepoPerms" href="#RepoPerms">type RepoPerms struct</a>

```
searchKey: authz.RepoPerms
tags: [struct]
```

```Go
type RepoPerms struct {
	Repo  *types.Repo
	Perms Perms
}
```

RepoPerms contains a repo and the permissions a given user has associated with it. 

### <a id="RepoPermsSort" href="#RepoPermsSort">type RepoPermsSort []authz.RepoPerms</a>

```
searchKey: authz.RepoPermsSort
tags: [array struct]
```

```Go
type RepoPermsSort []RepoPerms
```

RepoPermsSort sorts a slice of RepoPerms to guarantee a stable ordering. 

#### <a id="RepoPermsSort.Len" href="#RepoPermsSort.Len">func (s RepoPermsSort) Len() int</a>

```
searchKey: authz.RepoPermsSort.Len
tags: [function]
```

```Go
func (s RepoPermsSort) Len() int
```

#### <a id="RepoPermsSort.Less" href="#RepoPermsSort.Less">func (s RepoPermsSort) Less(i, j int) bool</a>

```
searchKey: authz.RepoPermsSort.Less
tags: [method]
```

```Go
func (s RepoPermsSort) Less(i, j int) bool
```

#### <a id="RepoPermsSort.Swap" href="#RepoPermsSort.Swap">func (s RepoPermsSort) Swap(i, j int)</a>

```
searchKey: authz.RepoPermsSort.Swap
tags: [method]
```

```Go
func (s RepoPermsSort) Swap(i, j int)
```

### <a id="UserPendingPermissions" href="#UserPendingPermissions">type UserPendingPermissions struct</a>

```
searchKey: authz.UserPendingPermissions
tags: [struct]
```

```Go
type UserPendingPermissions struct {
	// The auto-generated internal database ID.
	ID int32
	// The type of the code host as if it would be used as extsvc.AccountSpec.ServiceType,
	// e.g. "github", "gitlab", "bitbucketServer" and "sourcegraph".
	ServiceType string
	// The ID of the code host as if it would be used as extsvc.AccountSpec.ServiceID,
	// e.g. "https://github.com/", "https://gitlab.com/" and "https://sourcegraph.com/".
	ServiceID string
	// The account ID that a code host (and its authz provider) uses to identify a user,
	// e.g. a username (for Bitbucket Server), a GraphID ( for GitHub), or a user ID
	// (for GitLab).
	//
	// When use the Sourcegraph authz provider, "BindID" can be either a username or
	// an email based on site configuration.
	BindID string
	// The permissions this user has to the "IDs" of the "Type".
	Perm Perms
	// The type of permissions this user has.
	Type PermType
	// The object IDs with the "Type".
	IDs *roaring.Bitmap
	// The last updated time.
	UpdatedAt time.Time
}
```

UserPendingPermissions defines permissions that a not-yet-created user has to perform on a given set of object IDs. Not-yet-created users may exist on the code host but not yet in Sourcegraph. "ServiceType", "ServiceID" and "BindID" are used to map this stub user to an actual user when the user is created. 

#### <a id="UserPendingPermissions.TracingFields" href="#UserPendingPermissions.TracingFields">func (p *UserPendingPermissions) TracingFields() []otlog.Field</a>

```
searchKey: authz.UserPendingPermissions.TracingFields
tags: [function]
```

```Go
func (p *UserPendingPermissions) TracingFields() []otlog.Field
```

TracingFields returns tracing fields for the opentracing log. 

### <a id="UserPermissions" href="#UserPermissions">type UserPermissions struct</a>

```
searchKey: authz.UserPermissions
tags: [struct]
```

```Go
type UserPermissions struct {
	UserID    int32           // The internal database ID of a user
	Perm      Perms           // The permission set
	Type      PermType        // The type of the permissions
	IDs       *roaring.Bitmap // The object IDs
	UpdatedAt time.Time       // The last updated time
	SyncedAt  time.Time       // The last user-centric synced time
}
```

UserPermissions are the permissions of a user to perform an action on the given set of object IDs of the defined type. 

#### <a id="UserPermissions.AuthorizedRepos" href="#UserPermissions.AuthorizedRepos">func (p *UserPermissions) AuthorizedRepos(repos []*types.Repo) []RepoPerms</a>

```
searchKey: authz.UserPermissions.AuthorizedRepos
tags: [method]
```

```Go
func (p *UserPermissions) AuthorizedRepos(repos []*types.Repo) []RepoPerms
```

AuthorizedRepos returns the intersection of the given repository IDs with the authorized IDs. 

#### <a id="UserPermissions.Expired" href="#UserPermissions.Expired">func (p *UserPermissions) Expired(ttl time.Duration, now time.Time) bool</a>

```
searchKey: authz.UserPermissions.Expired
tags: [method]
```

```Go
func (p *UserPermissions) Expired(ttl time.Duration, now time.Time) bool
```

Expired returns true if these UserPermissions have elapsed the given ttl. 

#### <a id="UserPermissions.TracingFields" href="#UserPermissions.TracingFields">func (p *UserPermissions) TracingFields() []otlog.Field</a>

```
searchKey: authz.UserPermissions.TracingFields
tags: [function]
```

```Go
func (p *UserPermissions) TracingFields() []otlog.Field
```

TracingFields returns tracing fields for the opentracing log. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkPermsInclude" href="#BenchmarkPermsInclude">func BenchmarkPermsInclude(b *testing.B)</a>

```
searchKey: authz.BenchmarkPermsInclude
tags: [method private benchmark]
```

```Go
func BenchmarkPermsInclude(b *testing.B)
```

### <a id="BenchmarkPermsString" href="#BenchmarkPermsString">func BenchmarkPermsString(b *testing.B)</a>

```
searchKey: authz.BenchmarkPermsString
tags: [method private benchmark]
```

```Go
func BenchmarkPermsString(b *testing.B)
```

### <a id="GetProviders" href="#GetProviders">func GetProviders() (authzAllowByDefault bool, providers []Provider)</a>

```
searchKey: authz.GetProviders
tags: [function]
```

```Go
func GetProviders() (authzAllowByDefault bool, providers []Provider)
```

GetProviders returns the current authz parameters. It is concurrency-safe. 

It blocks until SetProviders has been called at least once. 

### <a id="IsUnrecognizedScheme" href="#IsUnrecognizedScheme">func IsUnrecognizedScheme(err error) bool</a>

```
searchKey: authz.IsUnrecognizedScheme
tags: [method]
```

```Go
func IsUnrecognizedScheme(err error) bool
```

IsUnrecognizedScheme reports whether err indicates that the request's Authorization header scheme is unrecognized or unparseable (i.e., is neither "token" nor "token-sudo"). 

### <a id="ParseAuthorizationHeader" href="#ParseAuthorizationHeader">func ParseAuthorizationHeader(headerValue string) (token, sudoUser string, err error)</a>

```
searchKey: authz.ParseAuthorizationHeader
tags: [method]
```

```Go
func ParseAuthorizationHeader(headerValue string) (token, sudoUser string, err error)
```

ParseAuthorizationHeader parses the HTTP Authorization request header for supported credentials values. 

Two forms of the Authorization header's "credentials" token are supported (see [RFC 7235, Appendix C]([https://tools.ietf.org/html/rfc7235#appendix-C](https://tools.ietf.org/html/rfc7235#appendix-C)): 

- With only an access token: "token" 1*SP token68 - With a token as params: 

```
"token" 1*SP "token" BWS "=" BWS quoted-string

```
The returned values are derived directly from user input and have not been validated or authenticated. 

### <a id="SetProviders" href="#SetProviders">func SetProviders(authzAllowByDefault bool, z []Provider)</a>

```
searchKey: authz.SetProviders
tags: [method]
```

```Go
func SetProviders(authzAllowByDefault bool, z []Provider)
```

SetProviders sets the current authz parameters. It is concurrency-safe. 

### <a id="TestParseAuthorizationHeader" href="#TestParseAuthorizationHeader">func TestParseAuthorizationHeader(t *testing.T)</a>

```
searchKey: authz.TestParseAuthorizationHeader
tags: [method private test]
```

```Go
func TestParseAuthorizationHeader(t *testing.T)
```

### <a id="TestParseHTTPCredentials" href="#TestParseHTTPCredentials">func TestParseHTTPCredentials(t *testing.T)</a>

```
searchKey: authz.TestParseHTTPCredentials
tags: [method private test]
```

```Go
func TestParseHTTPCredentials(t *testing.T)
```

### <a id="TestPermsInclude" href="#TestPermsInclude">func TestPermsInclude(t *testing.T)</a>

```
searchKey: authz.TestPermsInclude
tags: [method private test]
```

```Go
func TestPermsInclude(t *testing.T)
```

### <a id="TestPermsString" href="#TestPermsString">func TestPermsString(t *testing.T)</a>

```
searchKey: authz.TestPermsString
tags: [method private test]
```

```Go
func TestPermsString(t *testing.T)
```

### <a id="TestUserPermissions_AuthorizedRepos" href="#TestUserPermissions_AuthorizedRepos">func TestUserPermissions_AuthorizedRepos(t *testing.T)</a>

```
searchKey: authz.TestUserPermissions_AuthorizedRepos
tags: [method private test]
```

```Go
func TestUserPermissions_AuthorizedRepos(t *testing.T)
```

### <a id="bitmap" href="#bitmap">func bitmap(ids ...uint32) *roaring.Bitmap</a>

```
searchKey: authz.bitmap
tags: [method private]
```

```Go
func bitmap(ids ...uint32) *roaring.Bitmap
```

### <a id="parseHTTPAuthParams" href="#parseHTTPAuthParams">func parseHTTPAuthParams(value string) (params map[string]string, err error)</a>

```
searchKey: authz.parseHTTPAuthParams
tags: [method private]
```

```Go
func parseHTTPAuthParams(value string) (params map[string]string, err error)
```

parseHTTPAuthParams extracts key/value pairs from a comma-separated list of auth-params as defined in [RFC 7235, Appendix C]([https://tools.ietf.org/html/rfc7235#appendix-C](https://tools.ietf.org/html/rfc7235#appendix-C)) and returns a map. 

The resulting values are unquoted. The keys are matched case-insensitively, and each key MUST only occur once per challenge (according to [RFC 7235, Section 2.1]([https://tools.ietf.org/html/rfc7235#section-2.1](https://tools.ietf.org/html/rfc7235#section-2.1))). 

### <a id="parseHTTPCredentials" href="#parseHTTPCredentials">func parseHTTPCredentials(credentials string) (scheme, token68 string, params map[string]string, err error)</a>

```
searchKey: authz.parseHTTPCredentials
tags: [method private]
```

```Go
func parseHTTPCredentials(credentials string) (scheme, token68 string, params map[string]string, err error)
```

parseHTTPCredentials parses the "credentials" token as defined in [RFC 7235 Appendix C]([https://tools.ietf.org/html/rfc7235#appendix-C](https://tools.ietf.org/html/rfc7235#appendix-C)). 

### <a id="parseHTTPHeaderList" href="#parseHTTPHeaderList">func parseHTTPHeaderList(value string) []string</a>

```
searchKey: authz.parseHTTPHeaderList
tags: [method private]
```

```Go
func parseHTTPHeaderList(value string) []string
```

parseHTTPHeaderList parses a "#rule" as defined in [RFC 2068 Section 2.1]([https://tools.ietf.org/html/rfc2068#section-2.1](https://tools.ietf.org/html/rfc2068#section-2.1)). 

