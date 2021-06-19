# Package authz

Package authz contains common logic and interfaces for authorization to external providers (such as GitLab). 

## Index

* Subpages
  * [internal/authz/bitbucketserver](authz/bitbucketserver.md)
  * [internal/authz/github](authz/github.md)
  * [internal/authz/gitlab](authz/gitlab.md)
  * [internal/authz/perforce](authz/perforce.md)
* [Constants](#const)
    * [const SourcegraphServiceType](#SourcegraphServiceType)
    * [const SourcegraphServiceID](#SourcegraphServiceID)
    * [const SchemeToken](#SchemeToken)
    * [const SchemeTokenSudo](#SchemeTokenSudo)
    * [const None](#None)
    * [const Read](#Read)
    * [const Write](#Write)
    * [const PermRepos](#PermRepos)
    * [const ScopeUserAll](#ScopeUserAll)
    * [const ScopeSiteAdminSudo](#ScopeSiteAdminSudo)
* [Variables](#var)
    * [var errUnrecognizedScheme](#errUnrecognizedScheme)
    * [var errHTTPAuthParamsDuplicateKey](#errHTTPAuthParamsDuplicateKey)
    * [var errHTTPAuthParamsNoEquals](#errHTTPAuthParamsNoEquals)
    * [var ErrPermsNotFound](#ErrPermsNotFound)
    * [var allowAccessByDefault](#allowAccessByDefault)
    * [var authzProvidersReadyOnce](#authzProvidersReadyOnce)
    * [var authzProvidersReady](#authzProvidersReady)
    * [var authzProviders](#authzProviders)
    * [var authzMu](#authzMu)
    * [var isTest](#isTest)
    * [var AllScopes](#AllScopes)
* [Types](#type)
    * [type ExternalUserPermissions struct](#ExternalUserPermissions)
    * [type Provider interface](#Provider)
    * [type RepoPerms struct](#RepoPerms)
    * [type Perms uint32](#Perms)
        * [func (p Perms) Include(other Perms) bool](#Perms.Include)
        * [func (p Perms) String() string](#Perms.String)
    * [type PermType string](#PermType)
    * [type RepoPermsSort []authz.RepoPerms](#RepoPermsSort)
        * [func (s RepoPermsSort) Len() int](#RepoPermsSort.Len)
        * [func (s RepoPermsSort) Swap(i, j int)](#RepoPermsSort.Swap)
        * [func (s RepoPermsSort) Less(i, j int) bool](#RepoPermsSort.Less)
    * [type ErrStalePermissions struct](#ErrStalePermissions)
        * [func (e ErrStalePermissions) Error() string](#ErrStalePermissions.Error)
    * [type UserPermissions struct](#UserPermissions)
        * [func (p *UserPermissions) Expired(ttl time.Duration, now time.Time) bool](#UserPermissions.Expired)
        * [func (p *UserPermissions) AuthorizedRepos(repos []*types.Repo) []RepoPerms](#UserPermissions.AuthorizedRepos)
        * [func (p *UserPermissions) TracingFields() []otlog.Field](#UserPermissions.TracingFields)
    * [type RepoPermissions struct](#RepoPermissions)
        * [func (p *RepoPermissions) Expired(ttl time.Duration, now time.Time) bool](#RepoPermissions.Expired)
        * [func (p *RepoPermissions) TracingFields() []otlog.Field](#RepoPermissions.TracingFields)
    * [type UserPendingPermissions struct](#UserPendingPermissions)
        * [func (p *UserPendingPermissions) TracingFields() []otlog.Field](#UserPendingPermissions.TracingFields)
* [Functions](#func)
    * [func IsUnrecognizedScheme(err error) bool](#IsUnrecognizedScheme)
    * [func ParseAuthorizationHeader(headerValue string) (token, sudoUser string, err error)](#ParseAuthorizationHeader)
    * [func parseHTTPCredentials(credentials string) (scheme, token68 string, params map[string]string, err error)](#parseHTTPCredentials)
    * [func parseHTTPAuthParams(value string) (params map[string]string, err error)](#parseHTTPAuthParams)
    * [func parseHTTPHeaderList(value string) []string](#parseHTTPHeaderList)
    * [func SetProviders(authzAllowByDefault bool, z []Provider)](#SetProviders)
    * [func GetProviders() (authzAllowByDefault bool, providers []Provider)](#GetProviders)
    * [func TestParseAuthorizationHeader(t *testing.T)](#TestParseAuthorizationHeader)
    * [func TestParseHTTPCredentials(t *testing.T)](#TestParseHTTPCredentials)
    * [func TestPermsInclude(t *testing.T)](#TestPermsInclude)
    * [func BenchmarkPermsInclude(b *testing.B)](#BenchmarkPermsInclude)
    * [func TestPermsString(t *testing.T)](#TestPermsString)
    * [func BenchmarkPermsString(b *testing.B)](#BenchmarkPermsString)
    * [func bitmap(ids ...uint32) *roaring.Bitmap](#bitmap)
    * [func TestUserPermissions_AuthorizedRepos(t *testing.T)](#TestUserPermissions_AuthorizedRepos)


## <a id="const" href="#const">Constants</a>

### <a id="SourcegraphServiceType" href="#SourcegraphServiceType">const SourcegraphServiceType</a>

```
searchKey: authz.SourcegraphServiceType
tags: [exported]
```

```Go
const SourcegraphServiceType = "sourcegraph"
```

The service type and service ID for explicit repository permissions APIs (aka Sourcegraph authz provider). 

### <a id="SourcegraphServiceID" href="#SourcegraphServiceID">const SourcegraphServiceID</a>

```
searchKey: authz.SourcegraphServiceID
tags: [exported]
```

```Go
const SourcegraphServiceID = "https://sourcegraph.com/"
```

The service type and service ID for explicit repository permissions APIs (aka Sourcegraph authz provider). 

### <a id="SchemeToken" href="#SchemeToken">const SchemeToken</a>

```
searchKey: authz.SchemeToken
tags: [exported]
```

```Go
const SchemeToken = "token" // Scheme for Authorization header with only an access token

```

### <a id="SchemeTokenSudo" href="#SchemeTokenSudo">const SchemeTokenSudo</a>

```
searchKey: authz.SchemeTokenSudo
tags: [exported]
```

```Go
const SchemeTokenSudo // Scheme for Authorization header with access token and sudo user
 = ...
```

### <a id="None" href="#None">const None</a>

```
searchKey: authz.None
tags: [exported]
```

```Go
const None Perms = 0
```

Perm constants. 

### <a id="Read" href="#Read">const Read</a>

```
searchKey: authz.Read
tags: [exported]
```

```Go
const Read Perms = 1 << iota
```

Perm constants. 

### <a id="Write" href="#Write">const Write</a>

```
searchKey: authz.Write
tags: [exported]
```

```Go
const Write
```

Perm constants. 

### <a id="PermRepos" href="#PermRepos">const PermRepos</a>

```
searchKey: authz.PermRepos
tags: [exported]
```

```Go
const PermRepos PermType = "repos"
```

PermRepos is the list of available user permission types. 

### <a id="ScopeUserAll" href="#ScopeUserAll">const ScopeUserAll</a>

```
searchKey: authz.ScopeUserAll
tags: [exported]
```

```Go
const ScopeUserAll = "user:all" // Full control of all resources accessible to the user account.

```

Access token scopes. 

### <a id="ScopeSiteAdminSudo" href="#ScopeSiteAdminSudo">const ScopeSiteAdminSudo</a>

```
searchKey: authz.ScopeSiteAdminSudo
tags: [exported]
```

```Go
const ScopeSiteAdminSudo = "site-admin:sudo" // Ability to perform any action as any other user.

```

## <a id="var" href="#var">Variables</a>

### <a id="errUnrecognizedScheme" href="#errUnrecognizedScheme">var errUnrecognizedScheme</a>

```
searchKey: authz.errUnrecognizedScheme
```

```Go
var errUnrecognizedScheme = ...
```

errUnrecognizedScheme occurs when the Authorization header scheme (the first token) is not recognized. 

### <a id="errHTTPAuthParamsDuplicateKey" href="#errHTTPAuthParamsDuplicateKey">var errHTTPAuthParamsDuplicateKey</a>

```
searchKey: authz.errHTTPAuthParamsDuplicateKey
```

```Go
var errHTTPAuthParamsDuplicateKey = errors.New("duplicate key in HTTP auth-params")
```

### <a id="errHTTPAuthParamsNoEquals" href="#errHTTPAuthParamsNoEquals">var errHTTPAuthParamsNoEquals</a>

```
searchKey: authz.errHTTPAuthParamsNoEquals
```

```Go
var errHTTPAuthParamsNoEquals = errors.New("invalid HTTP auth-params list (parameter has no value)")
```

### <a id="ErrPermsNotFound" href="#ErrPermsNotFound">var ErrPermsNotFound</a>

```
searchKey: authz.ErrPermsNotFound
tags: [exported]
```

```Go
var ErrPermsNotFound = errors.New("permissions not found")
```

### <a id="allowAccessByDefault" href="#allowAccessByDefault">var allowAccessByDefault</a>

```
searchKey: authz.allowAccessByDefault
```

```Go
var allowAccessByDefault = true
```

allowAccessByDefault, if set to true, grants all users access to repositories that are not matched by any authz provider. The default value is true. It is only set to false in error modes (when the configuration is in a state where interpreting it literally could lead to leakage of private repositories). 

### <a id="authzProvidersReadyOnce" href="#authzProvidersReadyOnce">var authzProvidersReadyOnce</a>

```
searchKey: authz.authzProvidersReadyOnce
```

```Go
var authzProvidersReadyOnce sync.Once
```

authzProvidersReady and authzProvidersReadyOnce together indicate when GetProviders should no longer block. It should block until SetProviders is called at least once. 

### <a id="authzProvidersReady" href="#authzProvidersReady">var authzProvidersReady</a>

```
searchKey: authz.authzProvidersReady
```

```Go
var authzProvidersReady = make(chan struct{})
```

### <a id="authzProviders" href="#authzProviders">var authzProviders</a>

```
searchKey: authz.authzProviders
```

```Go
var authzProviders []Provider
```

authzProviders is the currently registered list of authorization providers. 

### <a id="authzMu" href="#authzMu">var authzMu</a>

```
searchKey: authz.authzMu
```

```Go
var authzMu sync.RWMutex
```

authzMu protects access to both allowAccessByDefault and authzProviders 

### <a id="isTest" href="#isTest">var isTest</a>

```
searchKey: authz.isTest
```

```Go
var isTest = ...
```

### <a id="AllScopes" href="#AllScopes">var AllScopes</a>

```
searchKey: authz.AllScopes
tags: [exported]
```

```Go
var AllScopes = []string{
	ScopeUserAll,
	ScopeSiteAdminSudo,
}
```

AllScopes is a list of all known access token scopes. 

## <a id="type" href="#type">Types</a>

### <a id="ExternalUserPermissions" href="#ExternalUserPermissions">type ExternalUserPermissions struct</a>

```
searchKey: authz.ExternalUserPermissions
tags: [exported]
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

### <a id="Provider" href="#Provider">type Provider interface</a>

```
searchKey: authz.Provider
tags: [exported]
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

### <a id="RepoPerms" href="#RepoPerms">type RepoPerms struct</a>

```
searchKey: authz.RepoPerms
tags: [exported]
```

```Go
type RepoPerms struct {
	Repo  *types.Repo
	Perms Perms
}
```

RepoPerms contains a repo and the permissions a given user has associated with it. 

### <a id="Perms" href="#Perms">type Perms uint32</a>

```
searchKey: authz.Perms
tags: [exported]
```

```Go
type Perms uint32
```

Perms is a permission set represented as bitset. 

#### <a id="Perms.Include" href="#Perms.Include">func (p Perms) Include(other Perms) bool</a>

```
searchKey: authz.Perms.Include
tags: [exported]
```

```Go
func (p Perms) Include(other Perms) bool
```

Include is a convenience method to test if Perms includes all the other Perms. 

#### <a id="Perms.String" href="#Perms.String">func (p Perms) String() string</a>

```
searchKey: authz.Perms.String
tags: [exported]
```

```Go
func (p Perms) String() string
```

String implements the fmt.Stringer interface. 

### <a id="PermType" href="#PermType">type PermType string</a>

```
searchKey: authz.PermType
tags: [exported]
```

```Go
type PermType string
```

PermType is the object type of the user permissions. 

### <a id="RepoPermsSort" href="#RepoPermsSort">type RepoPermsSort []authz.RepoPerms</a>

```
searchKey: authz.RepoPermsSort
tags: [exported]
```

```Go
type RepoPermsSort []RepoPerms
```

RepoPermsSort sorts a slice of RepoPerms to guarantee a stable ordering. 

#### <a id="RepoPermsSort.Len" href="#RepoPermsSort.Len">func (s RepoPermsSort) Len() int</a>

```
searchKey: authz.RepoPermsSort.Len
tags: [exported]
```

```Go
func (s RepoPermsSort) Len() int
```

#### <a id="RepoPermsSort.Swap" href="#RepoPermsSort.Swap">func (s RepoPermsSort) Swap(i, j int)</a>

```
searchKey: authz.RepoPermsSort.Swap
tags: [exported]
```

```Go
func (s RepoPermsSort) Swap(i, j int)
```

#### <a id="RepoPermsSort.Less" href="#RepoPermsSort.Less">func (s RepoPermsSort) Less(i, j int) bool</a>

```
searchKey: authz.RepoPermsSort.Less
tags: [exported]
```

```Go
func (s RepoPermsSort) Less(i, j int) bool
```

### <a id="ErrStalePermissions" href="#ErrStalePermissions">type ErrStalePermissions struct</a>

```
searchKey: authz.ErrStalePermissions
tags: [exported]
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
tags: [exported]
```

```Go
func (e ErrStalePermissions) Error() string
```

Error implements the error interface. 

### <a id="UserPermissions" href="#UserPermissions">type UserPermissions struct</a>

```
searchKey: authz.UserPermissions
tags: [exported]
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

#### <a id="UserPermissions.Expired" href="#UserPermissions.Expired">func (p *UserPermissions) Expired(ttl time.Duration, now time.Time) bool</a>

```
searchKey: authz.UserPermissions.Expired
tags: [exported]
```

```Go
func (p *UserPermissions) Expired(ttl time.Duration, now time.Time) bool
```

Expired returns true if these UserPermissions have elapsed the given ttl. 

#### <a id="UserPermissions.AuthorizedRepos" href="#UserPermissions.AuthorizedRepos">func (p *UserPermissions) AuthorizedRepos(repos []*types.Repo) []RepoPerms</a>

```
searchKey: authz.UserPermissions.AuthorizedRepos
tags: [exported]
```

```Go
func (p *UserPermissions) AuthorizedRepos(repos []*types.Repo) []RepoPerms
```

AuthorizedRepos returns the intersection of the given repository IDs with the authorized IDs. 

#### <a id="UserPermissions.TracingFields" href="#UserPermissions.TracingFields">func (p *UserPermissions) TracingFields() []otlog.Field</a>

```
searchKey: authz.UserPermissions.TracingFields
tags: [exported]
```

```Go
func (p *UserPermissions) TracingFields() []otlog.Field
```

TracingFields returns tracing fields for the opentracing log. 

### <a id="RepoPermissions" href="#RepoPermissions">type RepoPermissions struct</a>

```
searchKey: authz.RepoPermissions
tags: [exported]
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
tags: [exported]
```

```Go
func (p *RepoPermissions) Expired(ttl time.Duration, now time.Time) bool
```

Expired returns true if these RepoPermissions have elapsed the given ttl. 

#### <a id="RepoPermissions.TracingFields" href="#RepoPermissions.TracingFields">func (p *RepoPermissions) TracingFields() []otlog.Field</a>

```
searchKey: authz.RepoPermissions.TracingFields
tags: [exported]
```

```Go
func (p *RepoPermissions) TracingFields() []otlog.Field
```

TracingFields returns tracing fields for the opentracing log. 

### <a id="UserPendingPermissions" href="#UserPendingPermissions">type UserPendingPermissions struct</a>

```
searchKey: authz.UserPendingPermissions
tags: [exported]
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
tags: [exported]
```

```Go
func (p *UserPendingPermissions) TracingFields() []otlog.Field
```

TracingFields returns tracing fields for the opentracing log. 

## <a id="func" href="#func">Functions</a>

### <a id="IsUnrecognizedScheme" href="#IsUnrecognizedScheme">func IsUnrecognizedScheme(err error) bool</a>

```
searchKey: authz.IsUnrecognizedScheme
tags: [exported]
```

```Go
func IsUnrecognizedScheme(err error) bool
```

IsUnrecognizedScheme reports whether err indicates that the request's Authorization header scheme is unrecognized or unparseable (i.e., is neither "token" nor "token-sudo"). 

### <a id="ParseAuthorizationHeader" href="#ParseAuthorizationHeader">func ParseAuthorizationHeader(headerValue string) (token, sudoUser string, err error)</a>

```
searchKey: authz.ParseAuthorizationHeader
tags: [exported]
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

### <a id="parseHTTPCredentials" href="#parseHTTPCredentials">func parseHTTPCredentials(credentials string) (scheme, token68 string, params map[string]string, err error)</a>

```
searchKey: authz.parseHTTPCredentials
```

```Go
func parseHTTPCredentials(credentials string) (scheme, token68 string, params map[string]string, err error)
```

parseHTTPCredentials parses the "credentials" token as defined in [RFC 7235 Appendix C]([https://tools.ietf.org/html/rfc7235#appendix-C](https://tools.ietf.org/html/rfc7235#appendix-C)). 

### <a id="parseHTTPAuthParams" href="#parseHTTPAuthParams">func parseHTTPAuthParams(value string) (params map[string]string, err error)</a>

```
searchKey: authz.parseHTTPAuthParams
```

```Go
func parseHTTPAuthParams(value string) (params map[string]string, err error)
```

parseHTTPAuthParams extracts key/value pairs from a comma-separated list of auth-params as defined in [RFC 7235, Appendix C]([https://tools.ietf.org/html/rfc7235#appendix-C](https://tools.ietf.org/html/rfc7235#appendix-C)) and returns a map. 

The resulting values are unquoted. The keys are matched case-insensitively, and each key MUST only occur once per challenge (according to [RFC 7235, Section 2.1]([https://tools.ietf.org/html/rfc7235#section-2.1](https://tools.ietf.org/html/rfc7235#section-2.1))). 

### <a id="parseHTTPHeaderList" href="#parseHTTPHeaderList">func parseHTTPHeaderList(value string) []string</a>

```
searchKey: authz.parseHTTPHeaderList
```

```Go
func parseHTTPHeaderList(value string) []string
```

parseHTTPHeaderList parses a "#rule" as defined in [RFC 2068 Section 2.1]([https://tools.ietf.org/html/rfc2068#section-2.1](https://tools.ietf.org/html/rfc2068#section-2.1)). 

### <a id="SetProviders" href="#SetProviders">func SetProviders(authzAllowByDefault bool, z []Provider)</a>

```
searchKey: authz.SetProviders
tags: [exported]
```

```Go
func SetProviders(authzAllowByDefault bool, z []Provider)
```

SetProviders sets the current authz parameters. It is concurrency-safe. 

### <a id="GetProviders" href="#GetProviders">func GetProviders() (authzAllowByDefault bool, providers []Provider)</a>

```
searchKey: authz.GetProviders
tags: [exported]
```

```Go
func GetProviders() (authzAllowByDefault bool, providers []Provider)
```

GetProviders returns the current authz parameters. It is concurrency-safe. 

It blocks until SetProviders has been called at least once. 

### <a id="TestParseAuthorizationHeader" href="#TestParseAuthorizationHeader">func TestParseAuthorizationHeader(t *testing.T)</a>

```
searchKey: authz.TestParseAuthorizationHeader
```

```Go
func TestParseAuthorizationHeader(t *testing.T)
```

### <a id="TestParseHTTPCredentials" href="#TestParseHTTPCredentials">func TestParseHTTPCredentials(t *testing.T)</a>

```
searchKey: authz.TestParseHTTPCredentials
```

```Go
func TestParseHTTPCredentials(t *testing.T)
```

### <a id="TestPermsInclude" href="#TestPermsInclude">func TestPermsInclude(t *testing.T)</a>

```
searchKey: authz.TestPermsInclude
```

```Go
func TestPermsInclude(t *testing.T)
```

### <a id="BenchmarkPermsInclude" href="#BenchmarkPermsInclude">func BenchmarkPermsInclude(b *testing.B)</a>

```
searchKey: authz.BenchmarkPermsInclude
```

```Go
func BenchmarkPermsInclude(b *testing.B)
```

### <a id="TestPermsString" href="#TestPermsString">func TestPermsString(t *testing.T)</a>

```
searchKey: authz.TestPermsString
```

```Go
func TestPermsString(t *testing.T)
```

### <a id="BenchmarkPermsString" href="#BenchmarkPermsString">func BenchmarkPermsString(b *testing.B)</a>

```
searchKey: authz.BenchmarkPermsString
```

```Go
func BenchmarkPermsString(b *testing.B)
```

### <a id="bitmap" href="#bitmap">func bitmap(ids ...uint32) *roaring.Bitmap</a>

```
searchKey: authz.bitmap
```

```Go
func bitmap(ids ...uint32) *roaring.Bitmap
```

### <a id="TestUserPermissions_AuthorizedRepos" href="#TestUserPermissions_AuthorizedRepos">func TestUserPermissions_AuthorizedRepos(t *testing.T)</a>

```
searchKey: authz.TestUserPermissions_AuthorizedRepos
```

```Go
func TestUserPermissions_AuthorizedRepos(t *testing.T)
```

