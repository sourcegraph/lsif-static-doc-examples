# Package gitlaboauth

## Index

* [Constants](#const)
    * [const PkgName](#PkgName)
    * [const authPrefix](#authPrefix)
    * [const sessionKey](#sessionKey)
    * [const userKey](#userKey)
* [Types](#type)
    * [type MockProvider struct](#MockProvider)
        * [func newMockProvider(t *testing.T, clientID, clientSecret, baseURL string) *MockProvider](#newMockProvider)
    * [type key int](#key)
    * [type sessionIssuerHelper struct](#sessionIssuerHelper)
        * [func (s *sessionIssuerHelper) CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)](#sessionIssuerHelper.CreateCodeHostConnection)
        * [func (s *sessionIssuerHelper) DeleteStateCookie(w http.ResponseWriter)](#sessionIssuerHelper.DeleteStateCookie)
        * [func (s *sessionIssuerHelper) GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)](#sessionIssuerHelper.GetOrCreateUser)
        * [func (s *sessionIssuerHelper) SessionData(token *oauth2.Token) oauth.SessionData](#sessionIssuerHelper.SessionData)
* [Functions](#func)
    * [func CallbackHandler(config *oauth2.Config, success, failure http.Handler) http.Handler](#CallbackHandler)
    * [func LoginHandler(config *oauth2.Config, failure http.Handler) http.Handler](#LoginHandler)
    * [func Middleware(db dbutil.DB) *auth.Middleware](#Middleware)
    * [func TestMiddleware(t *testing.T)](#TestMiddleware)
    * [func TestParseConfig(t *testing.T)](#TestParseConfig)
    * [func TestSessionIssuerHelper_CreateCodeHostConnection(t *testing.T)](#TestSessionIssuerHelper_CreateCodeHostConnection)
    * [func UserFromContext(ctx context.Context) (*gitlab.User, error)](#UserFromContext)
    * [func WithUser(ctx context.Context, user *gitlab.User) context.Context](#WithUser)
    * [func getStateConfig() gologin.CookieConfig](#getStateConfig)
    * [func gitlabClientFromAuthURL(authURL, oauthToken string) (*gitlab.Client, error)](#gitlabClientFromAuthURL)
    * [func gitlabHandler(config *oauth2.Config, success, failure http.Handler) http.Handler](#gitlabHandler)
    * [func init()](#init.config.go)
    * [func init()](#init.middleware.go)
    * [func parseConfig(cfg *conf.Unified) (ps map[schema.GitLabAuthProvider]providers.Provider, problems conf.Problems)](#parseConfig)
    * [func parseProvider(callbackURL string, p *schema.GitLabAuthProvider, sourceCfg schema.AuthProviders) (provider *oauth.Provider, messages []string)](#parseProvider)
    * [func provider(serviceID string, oauth2Config oauth2.Config) *oauth.Provider](#provider)
    * [func requestedScopes(extraScopes []string) []string](#requestedScopes)
    * [func validateResponse(user *gitlab.User, err error) error](#validateResponse)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="PkgName" href="#PkgName">const PkgName</a>

```
searchKey: gitlaboauth.PkgName
tags: [constant string]
```

```Go
const PkgName = "gitlaboauth"
```

### <a id="authPrefix" href="#authPrefix">const authPrefix</a>

```
searchKey: gitlaboauth.authPrefix
tags: [constant string private]
```

```Go
const authPrefix = auth.AuthURLPrefix + "/gitlab"
```

### <a id="sessionKey" href="#sessionKey">const sessionKey</a>

```
searchKey: gitlaboauth.sessionKey
tags: [constant string private]
```

```Go
const sessionKey = "gitlaboauth@0"
```

### <a id="userKey" href="#userKey">const userKey</a>

```
searchKey: gitlaboauth.userKey
tags: [constant number private]
```

```Go
const userKey key = iota
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="MockProvider" href="#MockProvider">type MockProvider struct</a>

```
searchKey: gitlaboauth.MockProvider
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
searchKey: gitlaboauth.newMockProvider
tags: [function private]
```

```Go
func newMockProvider(t *testing.T, clientID, clientSecret, baseURL string) *MockProvider
```

### <a id="key" href="#key">type key int</a>

```
searchKey: gitlaboauth.key
tags: [number private]
```

```Go
type key int
```

unexported key type prevents collisions 

### <a id="sessionIssuerHelper" href="#sessionIssuerHelper">type sessionIssuerHelper struct</a>

```
searchKey: gitlaboauth.sessionIssuerHelper
tags: [struct private]
```

```Go
type sessionIssuerHelper struct {
	*extsvc.CodeHost
	clientID string
}
```

#### <a id="sessionIssuerHelper.CreateCodeHostConnection" href="#sessionIssuerHelper.CreateCodeHostConnection">func (s *sessionIssuerHelper) CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)</a>

```
searchKey: gitlaboauth.sessionIssuerHelper.CreateCodeHostConnection
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)
```

#### <a id="sessionIssuerHelper.DeleteStateCookie" href="#sessionIssuerHelper.DeleteStateCookie">func (s *sessionIssuerHelper) DeleteStateCookie(w http.ResponseWriter)</a>

```
searchKey: gitlaboauth.sessionIssuerHelper.DeleteStateCookie
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) DeleteStateCookie(w http.ResponseWriter)
```

#### <a id="sessionIssuerHelper.GetOrCreateUser" href="#sessionIssuerHelper.GetOrCreateUser">func (s *sessionIssuerHelper) GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)</a>

```
searchKey: gitlaboauth.sessionIssuerHelper.GetOrCreateUser
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)
```

#### <a id="sessionIssuerHelper.SessionData" href="#sessionIssuerHelper.SessionData">func (s *sessionIssuerHelper) SessionData(token *oauth2.Token) oauth.SessionData</a>

```
searchKey: gitlaboauth.sessionIssuerHelper.SessionData
tags: [method private]
```

```Go
func (s *sessionIssuerHelper) SessionData(token *oauth2.Token) oauth.SessionData
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="CallbackHandler" href="#CallbackHandler">func CallbackHandler(config *oauth2.Config, success, failure http.Handler) http.Handler</a>

```
searchKey: gitlaboauth.CallbackHandler
tags: [function]
```

```Go
func CallbackHandler(config *oauth2.Config, success, failure http.Handler) http.Handler
```

### <a id="LoginHandler" href="#LoginHandler">func LoginHandler(config *oauth2.Config, failure http.Handler) http.Handler</a>

```
searchKey: gitlaboauth.LoginHandler
tags: [function]
```

```Go
func LoginHandler(config *oauth2.Config, failure http.Handler) http.Handler
```

### <a id="Middleware" href="#Middleware">func Middleware(db dbutil.DB) *auth.Middleware</a>

```
searchKey: gitlaboauth.Middleware
tags: [function]
```

```Go
func Middleware(db dbutil.DB) *auth.Middleware
```

### <a id="TestMiddleware" href="#TestMiddleware">func TestMiddleware(t *testing.T)</a>

```
searchKey: gitlaboauth.TestMiddleware
tags: [function private test]
```

```Go
func TestMiddleware(t *testing.T)
```

TestMiddleware exercises the Middleware with requests that simulate the OAuth 2 login flow on GitLab. This tests the logic between the client-issued HTTP requests and the responses from the various endpoints, but does NOT cover the logic that is contained within `golang.org/x/oauth2` and `github.com/dghubble/gologin` which ensures the correctness of the `/callback` handler. 

### <a id="TestParseConfig" href="#TestParseConfig">func TestParseConfig(t *testing.T)</a>

```
searchKey: gitlaboauth.TestParseConfig
tags: [function private test]
```

```Go
func TestParseConfig(t *testing.T)
```

### <a id="TestSessionIssuerHelper_CreateCodeHostConnection" href="#TestSessionIssuerHelper_CreateCodeHostConnection">func TestSessionIssuerHelper_CreateCodeHostConnection(t *testing.T)</a>

```
searchKey: gitlaboauth.TestSessionIssuerHelper_CreateCodeHostConnection
tags: [function private test]
```

```Go
func TestSessionIssuerHelper_CreateCodeHostConnection(t *testing.T)
```

### <a id="UserFromContext" href="#UserFromContext">func UserFromContext(ctx context.Context) (*gitlab.User, error)</a>

```
searchKey: gitlaboauth.UserFromContext
tags: [function]
```

```Go
func UserFromContext(ctx context.Context) (*gitlab.User, error)
```

UserFromContext returns the GitLab User from the ctx. 

### <a id="WithUser" href="#WithUser">func WithUser(ctx context.Context, user *gitlab.User) context.Context</a>

```
searchKey: gitlaboauth.WithUser
tags: [function]
```

```Go
func WithUser(ctx context.Context, user *gitlab.User) context.Context
```

WithUser returns a copy of ctx that stores the GitLab User. 

### <a id="getStateConfig" href="#getStateConfig">func getStateConfig() gologin.CookieConfig</a>

```
searchKey: gitlaboauth.getStateConfig
tags: [function private]
```

```Go
func getStateConfig() gologin.CookieConfig
```

### <a id="gitlabClientFromAuthURL" href="#gitlabClientFromAuthURL">func gitlabClientFromAuthURL(authURL, oauthToken string) (*gitlab.Client, error)</a>

```
searchKey: gitlaboauth.gitlabClientFromAuthURL
tags: [function private]
```

```Go
func gitlabClientFromAuthURL(authURL, oauthToken string) (*gitlab.Client, error)
```

### <a id="gitlabHandler" href="#gitlabHandler">func gitlabHandler(config *oauth2.Config, success, failure http.Handler) http.Handler</a>

```
searchKey: gitlaboauth.gitlabHandler
tags: [function private]
```

```Go
func gitlabHandler(config *oauth2.Config, success, failure http.Handler) http.Handler
```

### <a id="init.config.go" href="#init.config.go">func init()</a>

```
searchKey: gitlaboauth.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.middleware.go" href="#init.middleware.go">func init()</a>

```
searchKey: gitlaboauth.init
tags: [function private]
```

```Go
func init()
```

### <a id="parseConfig" href="#parseConfig">func parseConfig(cfg *conf.Unified) (ps map[schema.GitLabAuthProvider]providers.Provider, problems conf.Problems)</a>

```
searchKey: gitlaboauth.parseConfig
tags: [function private]
```

```Go
func parseConfig(cfg *conf.Unified) (ps map[schema.GitLabAuthProvider]providers.Provider, problems conf.Problems)
```

### <a id="parseProvider" href="#parseProvider">func parseProvider(callbackURL string, p *schema.GitLabAuthProvider, sourceCfg schema.AuthProviders) (provider *oauth.Provider, messages []string)</a>

```
searchKey: gitlaboauth.parseProvider
tags: [function private]
```

```Go
func parseProvider(callbackURL string, p *schema.GitLabAuthProvider, sourceCfg schema.AuthProviders) (provider *oauth.Provider, messages []string)
```

### <a id="provider" href="#provider">func provider(serviceID string, oauth2Config oauth2.Config) *oauth.Provider</a>

```
searchKey: gitlaboauth.provider
tags: [function private]
```

```Go
func provider(serviceID string, oauth2Config oauth2.Config) *oauth.Provider
```

### <a id="requestedScopes" href="#requestedScopes">func requestedScopes(extraScopes []string) []string</a>

```
searchKey: gitlaboauth.requestedScopes
tags: [function private]
```

```Go
func requestedScopes(extraScopes []string) []string
```

### <a id="validateResponse" href="#validateResponse">func validateResponse(user *gitlab.User, err error) error</a>

```
searchKey: gitlaboauth.validateResponse
tags: [function private]
```

```Go
func validateResponse(user *gitlab.User, err error) error
```

validateResponse returns an error if the given GitLab user or error are unexpected. Returns nil if they are valid. 

