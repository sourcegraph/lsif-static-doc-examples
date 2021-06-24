# Package auth

Package auth contains auth related code for the frontend. 

## Index

* Subpages
  * [cmd/frontend/auth/providers](auth/providers.md)
* [Constants](#const)
    * [const AuthURLPrefix](#AuthURLPrefix)
* [Variables](#var)
    * [var MockGetAndSaveUser](#MockGetAndSaveUser)
    * [var RequireAuthMiddleware](#RequireAuthMiddleware)
    * [var anonymousAccessibleAPIRoutes](#anonymousAccessibleAPIRoutes)
    * [var anonymousAccessibleUIRoutes](#anonymousAccessibleUIRoutes)
    * [var anonymousUIStatusCode](#anonymousUIStatusCode)
    * [var disallowedCharacter](#disallowedCharacter)
    * [var disallowedSymbols](#disallowedSymbols)
    * [var extraAuthMiddlewares](#extraAuthMiddlewares)
* [Types](#type)
    * [type GetAndSaveUserOp struct](#GetAndSaveUserOp)
    * [type Middleware struct](#Middleware)
        * [func AuthMiddleware() *Middleware](#AuthMiddleware)
        * [func composeMiddleware(middlewares ...*Middleware) *Middleware](#composeMiddleware)
    * [type mockParams struct](#mockParams)
    * [type mocks struct](#mocks)
        * [func newMocks(t *testing.T, m mockParams) *mocks](#newMocks)
        * [func (m *mocks) AssociateUserAndSave(userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) (err error)](#mocks.AssociateUserAndSave)
        * [func (m *mocks) CreateUserAndSave(newUser database.NewUser, spec extsvc.AccountSpec, data extsvc.AccountData) (createdUserID int32, err error)](#mocks.CreateUserAndSave)
        * [func (m *mocks) GetByID(ctx context.Context, id int32) (*types.User, error)](#mocks.GetByID)
        * [func (m *mocks) GetByUsername(ctx context.Context, username string) (*types.User, error)](#mocks.GetByUsername)
        * [func (m *mocks) GetByVerifiedEmail(ctx context.Context, email string) (*types.User, error)](#mocks.GetByVerifiedEmail)
        * [func (m *mocks) GrantPendingPermissions(context.Context, *database.GrantPendingPermissionsArgs) error](#mocks.GrantPendingPermissions)
        * [func (m *mocks) LookupUserAndSave(spec extsvc.AccountSpec, data extsvc.AccountData) (userID int32, err error)](#mocks.LookupUserAndSave)
        * [func (m *mocks) Update(id int32, update database.UserUpdate) error](#mocks.Update)
        * [func (m *mocks) apply()](#mocks.apply)
        * [func (m *mocks) reset()](#mocks.reset)
    * [type userInfo struct](#userInfo)
* [Functions](#func)
    * [func AllowAnonymousRequest(req *http.Request) bool](#AllowAnonymousRequest)
    * [func GetAndSaveUser(ctx context.Context, op GetAndSaveUserOp) (userID int32, safeErrMsg string, err error)](#GetAndSaveUser)
    * [func NormalizeUsername(name string) (string, error)](#NormalizeUsername)
    * [func RegisterMiddlewares(m ...*Middleware)](#RegisterMiddlewares)
    * [func SafeRedirectURL(urlStr string) string](#SafeRedirectURL)
    * [func TestGetAndSaveUser(t *testing.T)](#TestGetAndSaveUser)
    * [func TestMetadataOnlyAutomaticallySetOnFirstOccurrence(t *testing.T)](#TestMetadataOnlyAutomaticallySetOnFirstOccurrence)
    * [func TestNormalizeUsername(t *testing.T)](#TestNormalizeUsername)
    * [func TestSafeRedirectURL(t *testing.T)](#TestSafeRedirectURL)
    * [func anonymousStatusCode(req *http.Request, defaultCode int) int](#anonymousStatusCode)
    * [func ext(serviceType, serviceID, clientID, accountID string) extsvc.AccountSpec](#ext)
    * [func init()](#init.user_test.go)
    * [func matchedRouteName(req *http.Request, router *mux.Router) string](#matchedRouteName)
    * [func userProps(username, email string, verifiedEmail bool) database.NewUser](#userProps)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="AuthURLPrefix" href="#AuthURLPrefix">const AuthURLPrefix</a>

```
searchKey: auth.AuthURLPrefix
tags: [constant string]
```

```Go
const AuthURLPrefix = "/.auth"
```

AuthURLPrefix is the URL path prefix under which to attach authentication handlers 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="MockGetAndSaveUser" href="#MockGetAndSaveUser">var MockGetAndSaveUser</a>

```
searchKey: auth.MockGetAndSaveUser
tags: [variable function]
```

```Go
var MockGetAndSaveUser func(ctx context.Context, op GetAndSaveUserOp) (userID int32, safeErrMsg string, err error) = ...
```

### <a id="RequireAuthMiddleware" href="#RequireAuthMiddleware">var RequireAuthMiddleware</a>

```
searchKey: auth.RequireAuthMiddleware
tags: [variable struct]
```

```Go
var RequireAuthMiddleware = ...
```

RequireAuthMiddleware is a middleware that requires authentication for all HTTP requests, except those allowed by allowAnonymousRequest. It's used when auth.public == false. 

It is enabled for all auth providers, but an auth provider may reject or redirect the user to its own auth flow before the request reaches here. 

🚨 SECURITY: Any change to this function could introduce security exploits. 

### <a id="anonymousAccessibleAPIRoutes" href="#anonymousAccessibleAPIRoutes">var anonymousAccessibleAPIRoutes</a>

```
searchKey: auth.anonymousAccessibleAPIRoutes
tags: [variable object private]
```

```Go
var anonymousAccessibleAPIRoutes = ...
```

🚨 SECURITY: These maps define route names that anonymous users can access. They MUST NOT leak any sensitive data or allow unprivileged users to perform undesired actions. 

### <a id="anonymousAccessibleUIRoutes" href="#anonymousAccessibleUIRoutes">var anonymousAccessibleUIRoutes</a>

```
searchKey: auth.anonymousAccessibleUIRoutes
tags: [variable object private]
```

```Go
var anonymousAccessibleUIRoutes = ...
```

### <a id="anonymousUIStatusCode" href="#anonymousUIStatusCode">var anonymousUIStatusCode</a>

```
searchKey: auth.anonymousUIStatusCode
tags: [variable object private]
```

```Go
var anonymousUIStatusCode = map[string]int{

	uirouter.RouteRaw: http.StatusUnauthorized,
}
```

Some routes return non-standard HTTP responses when a user is not signed in. 

### <a id="disallowedCharacter" href="#disallowedCharacter">var disallowedCharacter</a>

```
searchKey: auth.disallowedCharacter
tags: [variable struct private]
```

```Go
var disallowedCharacter = lazyregexp.New(`[^a-zA-Z0-9\-\.]`)
```

### <a id="disallowedSymbols" href="#disallowedSymbols">var disallowedSymbols</a>

```
searchKey: auth.disallowedSymbols
tags: [variable struct private]
```

```Go
var disallowedSymbols = lazyregexp.New(`(^[\-\.])|(\.$)|([\-\.]{2,})`)
```

### <a id="extraAuthMiddlewares" href="#extraAuthMiddlewares">var extraAuthMiddlewares</a>

```
searchKey: auth.extraAuthMiddlewares
tags: [variable array struct private]
```

```Go
var extraAuthMiddlewares []*Middleware
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="GetAndSaveUserOp" href="#GetAndSaveUserOp">type GetAndSaveUserOp struct</a>

```
searchKey: auth.GetAndSaveUserOp
tags: [struct]
```

```Go
type GetAndSaveUserOp struct {
	UserProps           database.NewUser
	ExternalAccount     extsvc.AccountSpec
	ExternalAccountData extsvc.AccountData
	CreateIfNotExist    bool
	LookUpByUsername    bool
}
```

### <a id="Middleware" href="#Middleware">type Middleware struct</a>

```
searchKey: auth.Middleware
tags: [struct]
```

```Go
type Middleware struct {
	// API is the middleware that performs authentication on the API handler.
	API func(http.Handler) http.Handler

	// App is the middleware that performs authentication on the app handler.
	App func(http.Handler) http.Handler
}
```

Middleware groups two related middlewares (one for the API, one for the app). 

#### <a id="AuthMiddleware" href="#AuthMiddleware">func AuthMiddleware() *Middleware</a>

```
searchKey: auth.AuthMiddleware
tags: [function]
```

```Go
func AuthMiddleware() *Middleware
```

AuthMiddleware returns the authentication middleware that combines all authentication middlewares that have been registered. 

#### <a id="composeMiddleware" href="#composeMiddleware">func composeMiddleware(middlewares ...*Middleware) *Middleware</a>

```
searchKey: auth.composeMiddleware
tags: [method private]
```

```Go
func composeMiddleware(middlewares ...*Middleware) *Middleware
```

composeMiddleware returns a new Middleware that composes the middlewares together. 

### <a id="mockParams" href="#mockParams">type mockParams struct</a>

```
searchKey: auth.mockParams
tags: [struct private]
```

```Go
type mockParams struct {
	userInfos               []userInfo
	lookupUserAndSaveErr    error
	createUserAndSaveErr    error
	associateUserAndSaveErr error
	getByVerifiedEmailErr   error
	getByUsernameErr        error //nolint:structcheck
	getByIDErr              error
	updateErr               error
}
```

### <a id="mocks" href="#mocks">type mocks struct</a>

```
searchKey: auth.mocks
tags: [struct private]
```

```Go
type mocks struct {
	mockParams
	t *testing.T

	// savedExtAccts tracks all ext acct "saves" for a given user ID
	savedExtAccts map[int32][]extsvc.AccountSpec

	// createdUsers tracks user creations by user ID
	createdUsers map[int32]database.NewUser

	// updatedUsers tracks all user updates for a given user ID
	updatedUsers map[int32][]database.UserUpdate

	// nextUserID is the user ID of the next created user.
	nextUserID int32

	// calledGrantPendingPermissions tracks if database.Authz.GrantPendingPermissions method is called.
	calledGrantPendingPermissions bool
}
```

mocks provide mocking. It should only be used for one call of auth.GetAndSaveUser, because saves are recorded in the mock struct but will not be reflected in the return values of the mocked methods. 

#### <a id="newMocks" href="#newMocks">func newMocks(t *testing.T, m mockParams) *mocks</a>

```
searchKey: auth.newMocks
tags: [method private]
```

```Go
func newMocks(t *testing.T, m mockParams) *mocks
```

#### <a id="mocks.AssociateUserAndSave" href="#mocks.AssociateUserAndSave">func (m *mocks) AssociateUserAndSave(userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) (err error)</a>

```
searchKey: auth.mocks.AssociateUserAndSave
tags: [method private]
```

```Go
func (m *mocks) AssociateUserAndSave(userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) (err error)
```

AssociateUserAndSave mocks database.ExternalAccounts.AssociateUserAndSave 

#### <a id="mocks.CreateUserAndSave" href="#mocks.CreateUserAndSave">func (m *mocks) CreateUserAndSave(newUser database.NewUser, spec extsvc.AccountSpec, data extsvc.AccountData) (createdUserID int32, err error)</a>

```
searchKey: auth.mocks.CreateUserAndSave
tags: [method private]
```

```Go
func (m *mocks) CreateUserAndSave(newUser database.NewUser, spec extsvc.AccountSpec, data extsvc.AccountData) (createdUserID int32, err error)
```

CreateUserAndSave mocks database.ExternalAccounts.CreateUserAndSave 

#### <a id="mocks.GetByID" href="#mocks.GetByID">func (m *mocks) GetByID(ctx context.Context, id int32) (*types.User, error)</a>

```
searchKey: auth.mocks.GetByID
tags: [method private]
```

```Go
func (m *mocks) GetByID(ctx context.Context, id int32) (*types.User, error)
```

GetByID mocks database.Users.GetByID 

#### <a id="mocks.GetByUsername" href="#mocks.GetByUsername">func (m *mocks) GetByUsername(ctx context.Context, username string) (*types.User, error)</a>

```
searchKey: auth.mocks.GetByUsername
tags: [method private]
```

```Go
func (m *mocks) GetByUsername(ctx context.Context, username string) (*types.User, error)
```

GetByUsername mocks database.Users.GetByUsername 

#### <a id="mocks.GetByVerifiedEmail" href="#mocks.GetByVerifiedEmail">func (m *mocks) GetByVerifiedEmail(ctx context.Context, email string) (*types.User, error)</a>

```
searchKey: auth.mocks.GetByVerifiedEmail
tags: [method private]
```

```Go
func (m *mocks) GetByVerifiedEmail(ctx context.Context, email string) (*types.User, error)
```

GetByVerifiedEmail mocks database.Users.GetByVerifiedEmail 

#### <a id="mocks.GrantPendingPermissions" href="#mocks.GrantPendingPermissions">func (m *mocks) GrantPendingPermissions(context.Context, *database.GrantPendingPermissionsArgs) error</a>

```
searchKey: auth.mocks.GrantPendingPermissions
tags: [method private]
```

```Go
func (m *mocks) GrantPendingPermissions(context.Context, *database.GrantPendingPermissionsArgs) error
```

GrantPendingPermissions mocks database.Authz.GrantPendingPermissions 

#### <a id="mocks.LookupUserAndSave" href="#mocks.LookupUserAndSave">func (m *mocks) LookupUserAndSave(spec extsvc.AccountSpec, data extsvc.AccountData) (userID int32, err error)</a>

```
searchKey: auth.mocks.LookupUserAndSave
tags: [method private]
```

```Go
func (m *mocks) LookupUserAndSave(spec extsvc.AccountSpec, data extsvc.AccountData) (userID int32, err error)
```

LookupUserAndSave mocks database.ExternalAccounts.LookupUserAndSave 

#### <a id="mocks.Update" href="#mocks.Update">func (m *mocks) Update(id int32, update database.UserUpdate) error</a>

```
searchKey: auth.mocks.Update
tags: [method private]
```

```Go
func (m *mocks) Update(id int32, update database.UserUpdate) error
```

Update mocks database.Users.Update 

#### <a id="mocks.apply" href="#mocks.apply">func (m *mocks) apply()</a>

```
searchKey: auth.mocks.apply
tags: [function private]
```

```Go
func (m *mocks) apply()
```

#### <a id="mocks.reset" href="#mocks.reset">func (m *mocks) reset()</a>

```
searchKey: auth.mocks.reset
tags: [function private]
```

```Go
func (m *mocks) reset()
```

### <a id="userInfo" href="#userInfo">type userInfo struct</a>

```
searchKey: auth.userInfo
tags: [struct private]
```

```Go
type userInfo struct {
	user     types.User
	extAccts []extsvc.AccountSpec
	emails   []string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="AllowAnonymousRequest" href="#AllowAnonymousRequest">func AllowAnonymousRequest(req *http.Request) bool</a>

```
searchKey: auth.AllowAnonymousRequest
tags: [method]
```

```Go
func AllowAnonymousRequest(req *http.Request) bool
```

AllowAnonymousRequest reports whether handling of the HTTP request (which is from an anonymous user) should proceed. The eventual handler for the request may still perform other authn/authz checks. 

🚨 SECURITY: This func MUST return false if handling req would leak any sensitive data or allow unprivileged users to perform undesired actions. 

### <a id="GetAndSaveUser" href="#GetAndSaveUser">func GetAndSaveUser(ctx context.Context, op GetAndSaveUserOp) (userID int32, safeErrMsg string, err error)</a>

```
searchKey: auth.GetAndSaveUser
tags: [method]
```

```Go
func GetAndSaveUser(ctx context.Context, op GetAndSaveUserOp) (userID int32, safeErrMsg string, err error)
```

GetAndSaveUser accepts authentication information associated with a given user, validates and applies the necessary updates to the DB, and returns the user ID after the updates have been applied. 

At a high level, it does the following: 1. Determine the identity of the user by applying the following rules in order: 

```
a. If ctx contains an authenticated Actor, the Actor's identity is the user identity.
b. Look up the user by external account ID.
c. If the email specified in op.UserProps is verified, Look up the user by verified email.
   If op.LookUpByUsername is true, look up by username instead of verified email.
   (Note: most clients should look up by email, as username is typically insecure.)
d. If op.CreateIfNotExist is true, attempt to create a new user with the properties
   specified in op.UserProps. This may fail if the desired username is already taken.
e. If a new user is successfully created, attempt to grant pending permissions.

```
2. Ensure that the user is associated with the external account information. This means 

```
creating the external account if it does not already exist or updating it if it
already does.

```
3. Update any user props that have changed. 4. Return the user ID. 

🚨 SECURITY: It is the caller's responsibility to ensure the veracity of the information that op contains (e.g., by receiving it from the appropriate authentication mechanism). It must also ensure that the user identity implied by op is consistent. Specifically, the values used in step 1 above must be consistent: * The authenticated Actor, if it exists * op.ExternalAccount * op.UserProps, especially op.UserProps.Email 

🚨 SECURITY: The safeErrMsg is an error message that can be shown to unauthenticated users to describe the problem. The err may contain sensitive information and should only be written to the server error logs, not to the HTTP response to shown to unauthenticated users. 

### <a id="NormalizeUsername" href="#NormalizeUsername">func NormalizeUsername(name string) (string, error)</a>

```
searchKey: auth.NormalizeUsername
tags: [method]
```

```Go
func NormalizeUsername(name string) (string, error)
```

NormalizeUsername normalizes a proposed username into a format that meets Sourcegraph's username formatting rules (based on, but not identical to [https://help.github.com/enterprise/2.11/admin/guides/user-management/using-ldap/#username-considerations-with-ldap](https://help.github.com/enterprise/2.11/admin/guides/user-management/using-ldap/#username-considerations-with-ldap)): 

- Any characters not in `[a-zA-Z0-9-.]` are replaced with `-` - Usernames with exactly one `@` character are interpreted as an email address, so the username will be extracted by truncating at the `@` character. - Usernames with two or more `@` characters are not considered an email address, so the `@` will be treated as a non-standard character and be replaced with `-` - Usernames with consecutive `-` or `.` characters are not allowed - Usernames that start or end with `.` are not allowed - Usernames that start with `-` are not allowed 

Usernames that could not be converted return an error. 

Note: Do not forget to change database constraints on "users" and "orgs" tables. 

### <a id="RegisterMiddlewares" href="#RegisterMiddlewares">func RegisterMiddlewares(m ...*Middleware)</a>

```
searchKey: auth.RegisterMiddlewares
tags: [method]
```

```Go
func RegisterMiddlewares(m ...*Middleware)
```

RegisterMiddlewares registers additional authentication middlewares. Currently this is used to register enterprise-only SSO middleware. This should only be called from an init function. 

### <a id="SafeRedirectURL" href="#SafeRedirectURL">func SafeRedirectURL(urlStr string) string</a>

```
searchKey: auth.SafeRedirectURL
tags: [method]
```

```Go
func SafeRedirectURL(urlStr string) string
```

SafeRedirectURL returns a safe redirect URL based on the input, to protect against open-redirect vulnerabilities. 

🚨 SECURITY: Handlers MUST call this on any redirection destination URL derived from untrusted user input, or else there is a possible open-redirect vulnerability. 

### <a id="TestGetAndSaveUser" href="#TestGetAndSaveUser">func TestGetAndSaveUser(t *testing.T)</a>

```
searchKey: auth.TestGetAndSaveUser
tags: [method private test]
```

```Go
func TestGetAndSaveUser(t *testing.T)
```

TestGetAndSaveUser ensures the correctness of the GetAndSaveUser function. 

🚨 SECURITY: This guarantees the integrity of the identity resolution process (ensuring that new external accounts are linked to the appropriate user account) 

### <a id="TestMetadataOnlyAutomaticallySetOnFirstOccurrence" href="#TestMetadataOnlyAutomaticallySetOnFirstOccurrence">func TestMetadataOnlyAutomaticallySetOnFirstOccurrence(t *testing.T)</a>

```
searchKey: auth.TestMetadataOnlyAutomaticallySetOnFirstOccurrence
tags: [method private test]
```

```Go
func TestMetadataOnlyAutomaticallySetOnFirstOccurrence(t *testing.T)
```

### <a id="TestNormalizeUsername" href="#TestNormalizeUsername">func TestNormalizeUsername(t *testing.T)</a>

```
searchKey: auth.TestNormalizeUsername
tags: [method private test]
```

```Go
func TestNormalizeUsername(t *testing.T)
```

### <a id="TestSafeRedirectURL" href="#TestSafeRedirectURL">func TestSafeRedirectURL(t *testing.T)</a>

```
searchKey: auth.TestSafeRedirectURL
tags: [method private test]
```

```Go
func TestSafeRedirectURL(t *testing.T)
```

### <a id="anonymousStatusCode" href="#anonymousStatusCode">func anonymousStatusCode(req *http.Request, defaultCode int) int</a>

```
searchKey: auth.anonymousStatusCode
tags: [method private]
```

```Go
func anonymousStatusCode(req *http.Request, defaultCode int) int
```

### <a id="ext" href="#ext">func ext(serviceType, serviceID, clientID, accountID string) extsvc.AccountSpec</a>

```
searchKey: auth.ext
tags: [method private]
```

```Go
func ext(serviceType, serviceID, clientID, accountID string) extsvc.AccountSpec
```

### <a id="init.user_test.go" href="#init.user_test.go">func init()</a>

```
searchKey: auth.init
tags: [function private]
```

```Go
func init()
```

### <a id="matchedRouteName" href="#matchedRouteName">func matchedRouteName(req *http.Request, router *mux.Router) string</a>

```
searchKey: auth.matchedRouteName
tags: [method private]
```

```Go
func matchedRouteName(req *http.Request, router *mux.Router) string
```

### <a id="userProps" href="#userProps">func userProps(username, email string, verifiedEmail bool) database.NewUser</a>

```
searchKey: auth.userProps
tags: [method private]
```

```Go
func userProps(username, email string, verifiedEmail bool) database.NewUser
```

