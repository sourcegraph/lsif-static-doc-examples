# Package githuboauth

## Index

* [Constants](#const)
    * [const authPrefix](#authPrefix)
    * [const sessionKey](#sessionKey)
* [Variables](#var)
    * [var clientIDSecretValidator](#clientIDSecretValidator)
* [Types](#type)
    * [type MockProvider struct](#MockProvider)
        * [func newMockProvider(t *testing.T, clientID, clientSecret, baseURL string) *MockProvider](#newMockProvider)
    * [type Provider struct](#Provider)
    * [type sessionIssuerHelper struct](#sessionIssuerHelper)
        * [func (s *sessionIssuerHelper) CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)](#sessionIssuerHelper.CreateCodeHostConnection)
        * [func (s *sessionIssuerHelper) DeleteStateCookie(w http.ResponseWriter)](#sessionIssuerHelper.DeleteStateCookie)
        * [func (s *sessionIssuerHelper) GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)](#sessionIssuerHelper.GetOrCreateUser)
        * [func (s *sessionIssuerHelper) SessionData(token *oauth2.Token) oauth.SessionData](#sessionIssuerHelper.SessionData)
        * [func (s *sessionIssuerHelper) newClient(token string) *githubsvc.V3Client](#sessionIssuerHelper.newClient)
        * [func (s *sessionIssuerHelper) verifyUserOrgs(ctx context.Context, ghClient *githubsvc.V3Client) bool](#sessionIssuerHelper.verifyUserOrgs)
* [Functions](#func)
    * [func Middleware(db dbutil.DB) *auth.Middleware](#Middleware)
    * [func TestMiddleware(t *testing.T)](#TestMiddleware)
    * [func TestParseConfig(t *testing.T)](#TestParseConfig)
    * [func TestRequestedScopes(t *testing.T)](#TestRequestedScopes)
    * [func TestSessionIssuerHelper_CreateCodeHostConnection(t *testing.T)](#TestSessionIssuerHelper_CreateCodeHostConnection)
    * [func TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService(t *testing.T)](#TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService)
    * [func TestSessionIssuerHelper_GetOrCreateUser(t *testing.T)](#TestSessionIssuerHelper_GetOrCreateUser)
    * [func acct(serviceType, serviceID, clientID, accountID string) extsvc.AccountSpec](#acct)
    * [func createCodeHostConnectionHelper(t *testing.T, serviceExists bool)](#createCodeHostConnectionHelper)
    * [func deref(s *string) string](#deref)
    * [func derefInt64(i *int64) int64](#derefInt64)
    * [func getStateConfig() gologin.CookieConfig](#getStateConfig)
    * [func getVerifiedEmails(ctx context.Context, ghClient *githubsvc.V3Client) (verifiedEmails []string)](#getVerifiedEmails)
    * [func init()](#init.config.go)
    * [func init()](#init.middleware.go)
    * [func init()](#init.session_test.go)
    * [func parseConfig(cfg *conf.Unified) (ps []Provider, problems conf.Problems)](#parseConfig)
    * [func parseProvider(p *schema.GitHubAuthProvider, sourceCfg schema.AuthProviders) (provider *oauth.Provider, messages []string)](#parseProvider)
    * [func provider(serviceID string, oauth2Config oauth2.Config) *oauth.Provider](#provider)
    * [func requestedScopes(p *schema.GitHubAuthProvider, extraScopes []string) []string](#requestedScopes)
    * [func u(username, email string, emailIsVerified bool) database.NewUser](#u)
    * [func validateClientIDAndSecret(clientIDOrSecret string) (valid bool)](#validateClientIDAndSecret)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="authPrefix" href="#authPrefix">const authPrefix</a>

```
searchKey: githuboauth.authPrefix
tags: [constant string private]
```

```Go
const authPrefix = auth.AuthURLPrefix + "/github"
```

### <a id="sessionKey" href="#sessionKey">const sessionKey</a>

```
searchKey: githuboauth.sessionKey
tags: [constant string private]
```

```Go
const sessionKey = "githuboauth@0"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="clientIDSecretValidator" href="#clientIDSecretValidator">var clientIDSecretValidator</a>

```
searchKey: githuboauth.clientIDSecretValidator
tags: [variable struct private]
```

```Go
var clientIDSecretValidator = lazyregexp.New("^[a-z0-9]*$")
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="MockProvider" href="#MockProvider">type MockProvider struct</a>

```
searchKey: githuboauth.MockProvider
tags: [struct private]
```

```Go
type MockProvider struct {
	*oauth.Provider
	lastCallbackRequestURL *url.URL
}
```

#### <a id="newMockProvider" href="#newMockProvider">func newMockProvider(t *testing.T, clientID, clientSecret, baseURL string) *MockProvider</a>

```
searchKey: githuboauth.newMockProvider
tags: [method private]
```

```Go
func newMockProvider(t *testing.T, clientID, clientSecret, baseURL string) *MockProvider
```

### <a id="Provider" href="#Provider">type Provider struct</a>

```
searchKey: githuboauth.Provider
tags: [struct]
```

```Go
type Provider struct {
	*schema.GitHubAuthProvider
	providers.Provider
}
```

### <a id="sessionIssuerHelper" href="#sessionIssuerHelper">type sessionIssuerHelper struct</a>

```
searchKey: githuboauth.sessionIssuerHelper
tags: [struct private]
```

```Go
type sessionIssuerHelper struct {
	*extsvc.CodeHost
	clientID    string
	allowSignup bool
	allowOrgs   []string
}
```

#### <a id="sessionIssuerHelper.CreateCodeHostConnection" href="#sessionIssuerHelper.CreateCodeHostConnection">func (s *sessionIssuerHelper) CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)</a>

```
searchKey: githuboauth.sessionIssuerHelper.CreateCodeHostConnection
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)
```

#### <a id="sessionIssuerHelper.DeleteStateCookie" href="#sessionIssuerHelper.DeleteStateCookie">func (s *sessionIssuerHelper) DeleteStateCookie(w http.ResponseWriter)</a>

```
searchKey: githuboauth.sessionIssuerHelper.DeleteStateCookie
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) DeleteStateCookie(w http.ResponseWriter)
```

#### <a id="sessionIssuerHelper.GetOrCreateUser" href="#sessionIssuerHelper.GetOrCreateUser">func (s *sessionIssuerHelper) GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)</a>

```
searchKey: githuboauth.sessionIssuerHelper.GetOrCreateUser
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)
```

#### <a id="sessionIssuerHelper.SessionData" href="#sessionIssuerHelper.SessionData">func (s *sessionIssuerHelper) SessionData(token *oauth2.Token) oauth.SessionData</a>

```
searchKey: githuboauth.sessionIssuerHelper.SessionData
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) SessionData(token *oauth2.Token) oauth.SessionData
```

#### <a id="sessionIssuerHelper.newClient" href="#sessionIssuerHelper.newClient">func (s *sessionIssuerHelper) newClient(token string) *githubsvc.V3Client</a>

```
searchKey: githuboauth.sessionIssuerHelper.newClient
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) newClient(token string) *githubsvc.V3Client
```

#### <a id="sessionIssuerHelper.verifyUserOrgs" href="#sessionIssuerHelper.verifyUserOrgs">func (s *sessionIssuerHelper) verifyUserOrgs(ctx context.Context, ghClient *githubsvc.V3Client) bool</a>

```
searchKey: githuboauth.sessionIssuerHelper.verifyUserOrgs
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) verifyUserOrgs(ctx context.Context, ghClient *githubsvc.V3Client) bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Middleware" href="#Middleware">func Middleware(db dbutil.DB) *auth.Middleware</a>

```
searchKey: githuboauth.Middleware
tags: [method]
```

```Go
func Middleware(db dbutil.DB) *auth.Middleware
```

### <a id="TestMiddleware" href="#TestMiddleware">func TestMiddleware(t *testing.T)</a>

```
searchKey: githuboauth.TestMiddleware
tags: [method private test]
```

```Go
func TestMiddleware(t *testing.T)
```

TestMiddleware exercises the Middleware with requests that simulate the OAuth 2 login flow on GitHub. This tests the logic between the client-issued HTTP requests and the responses from the various endpoints, but does NOT cover the logic that is contained within `golang.org/x/oauth2` and `github.com/dghubble/gologin` which ensures the correctness of the `/callback` handler. 

### <a id="TestParseConfig" href="#TestParseConfig">func TestParseConfig(t *testing.T)</a>

```
searchKey: githuboauth.TestParseConfig
tags: [method private test]
```

```Go
func TestParseConfig(t *testing.T)
```

### <a id="TestRequestedScopes" href="#TestRequestedScopes">func TestRequestedScopes(t *testing.T)</a>

```
searchKey: githuboauth.TestRequestedScopes
tags: [method private test]
```

```Go
func TestRequestedScopes(t *testing.T)
```

### <a id="TestSessionIssuerHelper_CreateCodeHostConnection" href="#TestSessionIssuerHelper_CreateCodeHostConnection">func TestSessionIssuerHelper_CreateCodeHostConnection(t *testing.T)</a>

```
searchKey: githuboauth.TestSessionIssuerHelper_CreateCodeHostConnection
tags: [method private test]
```

```Go
func TestSessionIssuerHelper_CreateCodeHostConnection(t *testing.T)
```

### <a id="TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService" href="#TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService">func TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService(t *testing.T)</a>

```
searchKey: githuboauth.TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService
tags: [method private test]
```

```Go
func TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService(t *testing.T)
```

### <a id="TestSessionIssuerHelper_GetOrCreateUser" href="#TestSessionIssuerHelper_GetOrCreateUser">func TestSessionIssuerHelper_GetOrCreateUser(t *testing.T)</a>

```
searchKey: githuboauth.TestSessionIssuerHelper_GetOrCreateUser
tags: [method private test]
```

```Go
func TestSessionIssuerHelper_GetOrCreateUser(t *testing.T)
```

### <a id="acct" href="#acct">func acct(serviceType, serviceID, clientID, accountID string) extsvc.AccountSpec</a>

```
searchKey: githuboauth.acct
tags: [method private]
```

```Go
func acct(serviceType, serviceID, clientID, accountID string) extsvc.AccountSpec
```

### <a id="createCodeHostConnectionHelper" href="#createCodeHostConnectionHelper">func createCodeHostConnectionHelper(t *testing.T, serviceExists bool)</a>

```
searchKey: githuboauth.createCodeHostConnectionHelper
tags: [method private]
```

```Go
func createCodeHostConnectionHelper(t *testing.T, serviceExists bool)
```

### <a id="deref" href="#deref">func deref(s *string) string</a>

```
searchKey: githuboauth.deref
tags: [method private]
```

```Go
func deref(s *string) string
```

### <a id="derefInt64" href="#derefInt64">func derefInt64(i *int64) int64</a>

```
searchKey: githuboauth.derefInt64
tags: [method private]
```

```Go
func derefInt64(i *int64) int64
```

### <a id="getStateConfig" href="#getStateConfig">func getStateConfig() gologin.CookieConfig</a>

```
searchKey: githuboauth.getStateConfig
tags: [function private]
```

```Go
func getStateConfig() gologin.CookieConfig
```

### <a id="getVerifiedEmails" href="#getVerifiedEmails">func getVerifiedEmails(ctx context.Context, ghClient *githubsvc.V3Client) (verifiedEmails []string)</a>

```
searchKey: githuboauth.getVerifiedEmails
tags: [method private]
```

```Go
func getVerifiedEmails(ctx context.Context, ghClient *githubsvc.V3Client) (verifiedEmails []string)
```

getVerifiedEmails returns the list of user emails that are verified. If the primary email is verified, it will be the first email in the returned list. It only checks the first 100 user emails. 

### <a id="init.config.go" href="#init.config.go">func init()</a>

```
searchKey: githuboauth.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.middleware.go" href="#init.middleware.go">func init()</a>

```
searchKey: githuboauth.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.session_test.go" href="#init.session_test.go">func init()</a>

```
searchKey: githuboauth.init
tags: [function private]
```

```Go
func init()
```

### <a id="parseConfig" href="#parseConfig">func parseConfig(cfg *conf.Unified) (ps []Provider, problems conf.Problems)</a>

```
searchKey: githuboauth.parseConfig
tags: [method private]
```

```Go
func parseConfig(cfg *conf.Unified) (ps []Provider, problems conf.Problems)
```

### <a id="parseProvider" href="#parseProvider">func parseProvider(p *schema.GitHubAuthProvider, sourceCfg schema.AuthProviders) (provider *oauth.Provider, messages []string)</a>

```
searchKey: githuboauth.parseProvider
tags: [method private]
```

```Go
func parseProvider(p *schema.GitHubAuthProvider, sourceCfg schema.AuthProviders) (provider *oauth.Provider, messages []string)
```

### <a id="provider" href="#provider">func provider(serviceID string, oauth2Config oauth2.Config) *oauth.Provider</a>

```
searchKey: githuboauth.provider
tags: [method private]
```

```Go
func provider(serviceID string, oauth2Config oauth2.Config) *oauth.Provider
```

### <a id="requestedScopes" href="#requestedScopes">func requestedScopes(p *schema.GitHubAuthProvider, extraScopes []string) []string</a>

```
searchKey: githuboauth.requestedScopes
tags: [method private]
```

```Go
func requestedScopes(p *schema.GitHubAuthProvider, extraScopes []string) []string
```

### <a id="u" href="#u">func u(username, email string, emailIsVerified bool) database.NewUser</a>

```
searchKey: githuboauth.u
tags: [method private]
```

```Go
func u(username, email string, emailIsVerified bool) database.NewUser
```

### <a id="validateClientIDAndSecret" href="#validateClientIDAndSecret">func validateClientIDAndSecret(clientIDOrSecret string) (valid bool)</a>

```
searchKey: githuboauth.validateClientIDAndSecret
tags: [method private]
```

```Go
func validateClientIDAndSecret(clientIDOrSecret string) (valid bool)
```

