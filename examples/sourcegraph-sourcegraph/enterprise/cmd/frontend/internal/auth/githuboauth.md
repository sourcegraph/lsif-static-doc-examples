# Package githuboauth

## Index

* [Constants](#const)
    * [const authPrefix](#authPrefix)
    * [const sessionKey](#sessionKey)
* [Variables](#var)
    * [var clientIDSecretValidator](#clientIDSecretValidator)
* [Types](#type)
    * [type Provider struct](#Provider)
    * [type sessionIssuerHelper struct](#sessionIssuerHelper)
        * [func (s *sessionIssuerHelper) GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)](#sessionIssuerHelper.GetOrCreateUser)
        * [func (s *sessionIssuerHelper) CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)](#sessionIssuerHelper.CreateCodeHostConnection)
        * [func (s *sessionIssuerHelper) DeleteStateCookie(w http.ResponseWriter)](#sessionIssuerHelper.DeleteStateCookie)
        * [func (s *sessionIssuerHelper) SessionData(token *oauth2.Token) oauth.SessionData](#sessionIssuerHelper.SessionData)
        * [func (s *sessionIssuerHelper) newClient(token string) *githubsvc.V3Client](#sessionIssuerHelper.newClient)
        * [func (s *sessionIssuerHelper) verifyUserOrgs(ctx context.Context, ghClient *githubsvc.V3Client) bool](#sessionIssuerHelper.verifyUserOrgs)
    * [type MockProvider struct](#MockProvider)
        * [func newMockProvider(t *testing.T, clientID, clientSecret, baseURL string) *MockProvider](#newMockProvider)
* [Functions](#func)
    * [func init()](#init)
    * [func parseConfig(cfg *conf.Unified) (ps []Provider, problems conf.Problems)](#parseConfig)
    * [func getStateConfig() gologin.CookieConfig](#getStateConfig)
    * [func init()](#init)
    * [func Middleware(db dbutil.DB) *auth.Middleware](#Middleware)
    * [func parseProvider(p *schema.GitHubAuthProvider, sourceCfg schema.AuthProviders) (provider *oauth.Provider, messages []string)](#parseProvider)
    * [func validateClientIDAndSecret(clientIDOrSecret string) (valid bool)](#validateClientIDAndSecret)
    * [func requestedScopes(p *schema.GitHubAuthProvider, extraScopes []string) []string](#requestedScopes)
    * [func deref(s *string) string](#deref)
    * [func derefInt64(i *int64) int64](#derefInt64)
    * [func getVerifiedEmails(ctx context.Context, ghClient *githubsvc.V3Client) (verifiedEmails []string)](#getVerifiedEmails)
    * [func TestParseConfig(t *testing.T)](#TestParseConfig)
    * [func provider(serviceID string, oauth2Config oauth2.Config) *oauth.Provider](#provider)
    * [func TestMiddleware(t *testing.T)](#TestMiddleware)
    * [func TestRequestedScopes(t *testing.T)](#TestRequestedScopes)
    * [func init()](#init)
    * [func TestSessionIssuerHelper_GetOrCreateUser(t *testing.T)](#TestSessionIssuerHelper_GetOrCreateUser)
    * [func TestSessionIssuerHelper_CreateCodeHostConnection(t *testing.T)](#TestSessionIssuerHelper_CreateCodeHostConnection)
    * [func TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService(t *testing.T)](#TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService)
    * [func createCodeHostConnectionHelper(t *testing.T, serviceExists bool)](#createCodeHostConnectionHelper)
    * [func u(username, email string, emailIsVerified bool) database.NewUser](#u)
    * [func acct(serviceType, serviceID, clientID, accountID string) extsvc.AccountSpec](#acct)


## <a id="const" href="#const">Constants</a>

### <a id="authPrefix" href="#authPrefix">const authPrefix</a>

```
searchKey: githuboauth.authPrefix
```

```Go
const authPrefix = auth.AuthURLPrefix + "/github"
```

### <a id="sessionKey" href="#sessionKey">const sessionKey</a>

```
searchKey: githuboauth.sessionKey
```

```Go
const sessionKey = "githuboauth@0"
```

## <a id="var" href="#var">Variables</a>

### <a id="clientIDSecretValidator" href="#clientIDSecretValidator">var clientIDSecretValidator</a>

```
searchKey: githuboauth.clientIDSecretValidator
```

```Go
var clientIDSecretValidator = lazyregexp.New("^[a-z0-9]*$")
```

## <a id="type" href="#type">Types</a>

### <a id="Provider" href="#Provider">type Provider struct</a>

```
searchKey: githuboauth.Provider
tags: [exported]
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
```

```Go
type sessionIssuerHelper struct {
	*extsvc.CodeHost
	clientID    string
	allowSignup bool
	allowOrgs   []string
}
```

#### <a id="sessionIssuerHelper.GetOrCreateUser" href="#sessionIssuerHelper.GetOrCreateUser">func (s *sessionIssuerHelper) GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)</a>

```
searchKey: githuboauth.sessionIssuerHelper.GetOrCreateUser
```

```Go
func (s *sessionIssuerHelper) GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)
```

#### <a id="sessionIssuerHelper.CreateCodeHostConnection" href="#sessionIssuerHelper.CreateCodeHostConnection">func (s *sessionIssuerHelper) CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)</a>

```
searchKey: githuboauth.sessionIssuerHelper.CreateCodeHostConnection
```

```Go
func (s *sessionIssuerHelper) CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)
```

#### <a id="sessionIssuerHelper.DeleteStateCookie" href="#sessionIssuerHelper.DeleteStateCookie">func (s *sessionIssuerHelper) DeleteStateCookie(w http.ResponseWriter)</a>

```
searchKey: githuboauth.sessionIssuerHelper.DeleteStateCookie
```

```Go
func (s *sessionIssuerHelper) DeleteStateCookie(w http.ResponseWriter)
```

#### <a id="sessionIssuerHelper.SessionData" href="#sessionIssuerHelper.SessionData">func (s *sessionIssuerHelper) SessionData(token *oauth2.Token) oauth.SessionData</a>

```
searchKey: githuboauth.sessionIssuerHelper.SessionData
```

```Go
func (s *sessionIssuerHelper) SessionData(token *oauth2.Token) oauth.SessionData
```

#### <a id="sessionIssuerHelper.newClient" href="#sessionIssuerHelper.newClient">func (s *sessionIssuerHelper) newClient(token string) *githubsvc.V3Client</a>

```
searchKey: githuboauth.sessionIssuerHelper.newClient
```

```Go
func (s *sessionIssuerHelper) newClient(token string) *githubsvc.V3Client
```

#### <a id="sessionIssuerHelper.verifyUserOrgs" href="#sessionIssuerHelper.verifyUserOrgs">func (s *sessionIssuerHelper) verifyUserOrgs(ctx context.Context, ghClient *githubsvc.V3Client) bool</a>

```
searchKey: githuboauth.sessionIssuerHelper.verifyUserOrgs
```

```Go
func (s *sessionIssuerHelper) verifyUserOrgs(ctx context.Context, ghClient *githubsvc.V3Client) bool
```

### <a id="MockProvider" href="#MockProvider">type MockProvider struct</a>

```
searchKey: githuboauth.MockProvider
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
```

```Go
func newMockProvider(t *testing.T, clientID, clientSecret, baseURL string) *MockProvider
```

## <a id="func" href="#func">Functions</a>

### <a id="init" href="#init">func init()</a>

```
searchKey: githuboauth.init
```

```Go
func init()
```

### <a id="parseConfig" href="#parseConfig">func parseConfig(cfg *conf.Unified) (ps []Provider, problems conf.Problems)</a>

```
searchKey: githuboauth.parseConfig
```

```Go
func parseConfig(cfg *conf.Unified) (ps []Provider, problems conf.Problems)
```

### <a id="getStateConfig" href="#getStateConfig">func getStateConfig() gologin.CookieConfig</a>

```
searchKey: githuboauth.getStateConfig
```

```Go
func getStateConfig() gologin.CookieConfig
```

### <a id="init" href="#init">func init()</a>

```
searchKey: githuboauth.init
```

```Go
func init()
```

### <a id="Middleware" href="#Middleware">func Middleware(db dbutil.DB) *auth.Middleware</a>

```
searchKey: githuboauth.Middleware
tags: [exported]
```

```Go
func Middleware(db dbutil.DB) *auth.Middleware
```

### <a id="parseProvider" href="#parseProvider">func parseProvider(p *schema.GitHubAuthProvider, sourceCfg schema.AuthProviders) (provider *oauth.Provider, messages []string)</a>

```
searchKey: githuboauth.parseProvider
```

```Go
func parseProvider(p *schema.GitHubAuthProvider, sourceCfg schema.AuthProviders) (provider *oauth.Provider, messages []string)
```

### <a id="validateClientIDAndSecret" href="#validateClientIDAndSecret">func validateClientIDAndSecret(clientIDOrSecret string) (valid bool)</a>

```
searchKey: githuboauth.validateClientIDAndSecret
```

```Go
func validateClientIDAndSecret(clientIDOrSecret string) (valid bool)
```

### <a id="requestedScopes" href="#requestedScopes">func requestedScopes(p *schema.GitHubAuthProvider, extraScopes []string) []string</a>

```
searchKey: githuboauth.requestedScopes
```

```Go
func requestedScopes(p *schema.GitHubAuthProvider, extraScopes []string) []string
```

### <a id="deref" href="#deref">func deref(s *string) string</a>

```
searchKey: githuboauth.deref
```

```Go
func deref(s *string) string
```

### <a id="derefInt64" href="#derefInt64">func derefInt64(i *int64) int64</a>

```
searchKey: githuboauth.derefInt64
```

```Go
func derefInt64(i *int64) int64
```

### <a id="getVerifiedEmails" href="#getVerifiedEmails">func getVerifiedEmails(ctx context.Context, ghClient *githubsvc.V3Client) (verifiedEmails []string)</a>

```
searchKey: githuboauth.getVerifiedEmails
```

```Go
func getVerifiedEmails(ctx context.Context, ghClient *githubsvc.V3Client) (verifiedEmails []string)
```

getVerifiedEmails returns the list of user emails that are verified. If the primary email is verified, it will be the first email in the returned list. It only checks the first 100 user emails. 

### <a id="TestParseConfig" href="#TestParseConfig">func TestParseConfig(t *testing.T)</a>

```
searchKey: githuboauth.TestParseConfig
```

```Go
func TestParseConfig(t *testing.T)
```

### <a id="provider" href="#provider">func provider(serviceID string, oauth2Config oauth2.Config) *oauth.Provider</a>

```
searchKey: githuboauth.provider
```

```Go
func provider(serviceID string, oauth2Config oauth2.Config) *oauth.Provider
```

### <a id="TestMiddleware" href="#TestMiddleware">func TestMiddleware(t *testing.T)</a>

```
searchKey: githuboauth.TestMiddleware
```

```Go
func TestMiddleware(t *testing.T)
```

TestMiddleware exercises the Middleware with requests that simulate the OAuth 2 login flow on GitHub. This tests the logic between the client-issued HTTP requests and the responses from the various endpoints, but does NOT cover the logic that is contained within `golang.org/x/oauth2` and `github.com/dghubble/gologin` which ensures the correctness of the `/callback` handler. 

### <a id="TestRequestedScopes" href="#TestRequestedScopes">func TestRequestedScopes(t *testing.T)</a>

```
searchKey: githuboauth.TestRequestedScopes
```

```Go
func TestRequestedScopes(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: githuboauth.init
```

```Go
func init()
```

### <a id="TestSessionIssuerHelper_GetOrCreateUser" href="#TestSessionIssuerHelper_GetOrCreateUser">func TestSessionIssuerHelper_GetOrCreateUser(t *testing.T)</a>

```
searchKey: githuboauth.TestSessionIssuerHelper_GetOrCreateUser
```

```Go
func TestSessionIssuerHelper_GetOrCreateUser(t *testing.T)
```

### <a id="TestSessionIssuerHelper_CreateCodeHostConnection" href="#TestSessionIssuerHelper_CreateCodeHostConnection">func TestSessionIssuerHelper_CreateCodeHostConnection(t *testing.T)</a>

```
searchKey: githuboauth.TestSessionIssuerHelper_CreateCodeHostConnection
```

```Go
func TestSessionIssuerHelper_CreateCodeHostConnection(t *testing.T)
```

### <a id="TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService" href="#TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService">func TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService(t *testing.T)</a>

```
searchKey: githuboauth.TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService
```

```Go
func TestSessionIssuerHelper_CreateCodeHostConnectionHandlesExistingService(t *testing.T)
```

### <a id="createCodeHostConnectionHelper" href="#createCodeHostConnectionHelper">func createCodeHostConnectionHelper(t *testing.T, serviceExists bool)</a>

```
searchKey: githuboauth.createCodeHostConnectionHelper
```

```Go
func createCodeHostConnectionHelper(t *testing.T, serviceExists bool)
```

### <a id="u" href="#u">func u(username, email string, emailIsVerified bool) database.NewUser</a>

```
searchKey: githuboauth.u
```

```Go
func u(username, email string, emailIsVerified bool) database.NewUser
```

### <a id="acct" href="#acct">func acct(serviceType, serviceID, clientID, accountID string) extsvc.AccountSpec</a>

```
searchKey: githuboauth.acct
```

```Go
func acct(serviceType, serviceID, clientID, accountID string) extsvc.AccountSpec
```

