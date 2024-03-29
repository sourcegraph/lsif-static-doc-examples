# Package openidconnect

Package openidconnect implements auth via OIDC. 

## Index

* [Constants](#const)
    * [const authPrefix](#authPrefix)
    * [const providerType](#providerType)
    * [const sessionKey](#sessionKey)
    * [const stateCookieName](#stateCookieName)
    * [const stateCookieTimeout](#stateCookieTimeout)
* [Variables](#var)
    * [var Middleware](#Middleware)
    * [var mockGetProviderValue](#mockGetProviderValue)
    * [var mockNewProvider](#mockNewProvider)
    * [var mockVerifyIDToken](#mockVerifyIDToken)
    * [var testClientID](#testClientID)
    * [var testOIDCUser](#testOIDCUser)
* [Types](#type)
    * [type authnState struct](#authnState)
        * [func (s *authnState) Decode(encoded string) error](#authnState.Decode)
        * [func (s *authnState) Encode() string](#authnState.Encode)
    * [type oidcProvider struct](#oidcProvider)
        * [func newProvider(ctx context.Context, issuerURL string) (*oidcProvider, error)](#newProvider)
    * [type provider struct](#provider)
        * [func getProvider(id string) *provider](#getProvider)
        * [func handleGetProvider(ctx context.Context, w http.ResponseWriter, id string) (p *provider, handled bool)](#handleGetProvider)
        * [func (p *provider) CachedInfo() *providers.Info](#provider.CachedInfo)
        * [func (p *provider) Config() schema.AuthProviders](#provider.Config)
        * [func (p *provider) ConfigID() providers.ConfigID](#provider.ConfigID)
        * [func (p *provider) Refresh(ctx context.Context) error](#provider.Refresh)
        * [func (p *provider) getCachedInfoAndError() (*providers.Info, error)](#provider.getCachedInfoAndError)
        * [func (p *provider) oauth2Config() *oauth2.Config](#provider.oauth2Config)
    * [type providerExtraClaims struct](#providerExtraClaims)
    * [type providerJSON struct](#providerJSON)
    * [type sessionData struct](#sessionData)
    * [type userClaims struct](#userClaims)
* [Functions](#func)
    * [func SignOut(w http.ResponseWriter, r *http.Request) (endSessionEndpoint string, err error)](#SignOut)
    * [func TestMiddleware(t *testing.T)](#TestMiddleware)
    * [func TestMiddleware_NoOpenRedirect(t *testing.T)](#TestMiddleware_NoOpenRedirect)
    * [func TestProviderConfigID(t *testing.T)](#TestProviderConfigID)
    * [func TestValidateCustom(t *testing.T)](#TestValidateCustom)
    * [func authHandler(w http.ResponseWriter, r *http.Request)](#authHandler)
    * [func getOrCreateUser(ctx context.Context, p *provider, idToken *oidc.IDToken, userInfo *oidc.UserInfo, claims *userClaims) (_ *actor.Actor, safeErrMsg string, err error)](#getOrCreateUser)
    * [func getProviders() []providers.Provider](#getProviders)
    * [func handleOpenIDConnectAuth(w http.ResponseWriter, r *http.Request, next http.Handler, isAPIRequest bool)](#handleOpenIDConnectAuth)
    * [func init()](#init.config.go)
    * [func init()](#init.config_watch.go)
    * [func newOIDCIDServer(t *testing.T, code string, oidcProvider *schema.OpenIDConnectAuthProvider) (server *httptest.Server, emailPtr *string)](#newOIDCIDServer)
    * [func providerConfigID(pc *schema.OpenIDConnectAuthProvider) string](#providerConfigID)
    * [func redirectToAuthRequest(w http.ResponseWriter, r *http.Request, p *provider, returnToURL string)](#redirectToAuthRequest)
    * [func revokeToken(ctx context.Context, p *provider, accessToken, tokenType string) error](#revokeToken)
    * [func validateConfig(c conf.Unified) (problems conf.Problems)](#validateConfig)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="authPrefix" href="#authPrefix">const authPrefix</a>

```
searchKey: openidconnect.authPrefix
tags: [constant string private]
```

```Go
const authPrefix = auth.AuthURLPrefix + "/openidconnect"
```

All OpenID Connect endpoints are under this path prefix. 

### <a id="providerType" href="#providerType">const providerType</a>

```
searchKey: openidconnect.providerType
tags: [constant string private]
```

```Go
const providerType = "openidconnect"
```

### <a id="sessionKey" href="#sessionKey">const sessionKey</a>

```
searchKey: openidconnect.sessionKey
tags: [constant string private]
```

```Go
const sessionKey = "oidc@0"
```

### <a id="stateCookieName" href="#stateCookieName">const stateCookieName</a>

```
searchKey: openidconnect.stateCookieName
tags: [constant string private]
```

```Go
const stateCookieName = "sg-oidc-state"
```

### <a id="stateCookieTimeout" href="#stateCookieTimeout">const stateCookieTimeout</a>

```
searchKey: openidconnect.stateCookieTimeout
tags: [constant number private]
```

```Go
const stateCookieTimeout = time.Minute * 15
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Middleware" href="#Middleware">var Middleware</a>

```
searchKey: openidconnect.Middleware
tags: [variable struct]
```

```Go
var Middleware = ...
```

Middleware is middleware for OpenID Connect (OIDC) authentication, adding endpoints under the auth path prefix ("/.auth") to enable the login flow and requiring login for all other endpoints. 

The OIDC spec ([http://openid.net/specs/openid-connect-core-1_0.html](http://openid.net/specs/openid-connect-core-1_0.html)) describes an authentication protocol that involves 3 parties: the Relying Party (e.g., Sourcegraph), the OpenID Provider (e.g., Okta, OneLogin, or another SSO provider), and the End User (e.g., a user's web browser). 

This middleware implements two things: (1) the OIDC Authorization Code Flow ([http://openid.net/specs/openid-connect-core-1_0.html#CodeFlowAuth](http://openid.net/specs/openid-connect-core-1_0.html#CodeFlowAuth)) and (2) Sourcegraph-specific session management (outside the scope of the OIDC spec). Upon successful completion of the OIDC login flow, the handler will create a new session and session cookie. The expiration of the session is the expiration of the OIDC ID Token. 

🚨 SECURITY 

### <a id="mockGetProviderValue" href="#mockGetProviderValue">var mockGetProviderValue</a>

```
searchKey: openidconnect.mockGetProviderValue
tags: [variable struct private]
```

```Go
var mockGetProviderValue *provider
```

### <a id="mockNewProvider" href="#mockNewProvider">var mockNewProvider</a>

```
searchKey: openidconnect.mockNewProvider
tags: [variable function private]
```

```Go
var mockNewProvider func(issuerURL string) (*oidcProvider, error)
```

### <a id="mockVerifyIDToken" href="#mockVerifyIDToken">var mockVerifyIDToken</a>

```
searchKey: openidconnect.mockVerifyIDToken
tags: [variable function private]
```

```Go
var mockVerifyIDToken func(rawIDToken string) *oidc.IDToken
```

mockVerifyIDToken mocks the OIDC ID Token verification step. It should only be set in tests. 

### <a id="testClientID" href="#testClientID">var testClientID</a>

```
searchKey: openidconnect.testClientID
tags: [variable string private]
```

```Go
var testClientID = "aaaaaaaaaaaaaa"
```

### <a id="testOIDCUser" href="#testOIDCUser">var testOIDCUser</a>

```
searchKey: openidconnect.testOIDCUser
tags: [variable string private]
```

```Go
var testOIDCUser = "bob-test-user"
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="authnState" href="#authnState">type authnState struct</a>

```
searchKey: openidconnect.authnState
tags: [struct private]
```

```Go
type authnState struct {
	CSRFToken string `json:"csrfToken"`
	Redirect  string `json:"redirect"`

	// Allow /.auth/callback to demux callbacks from multiple OpenID Connect OPs.
	ProviderID string `json:"p"`
}
```

authnState is the state parameter passed to the Authn request and returned in the Authn response callback. 

#### <a id="authnState.Decode" href="#authnState.Decode">func (s *authnState) Decode(encoded string) error</a>

```
searchKey: openidconnect.authnState.Decode
tags: [method private]
```

```Go
func (s *authnState) Decode(encoded string) error
```

Decode decodes the base64-encoded JSON representation of the authn state into the receiver. 

#### <a id="authnState.Encode" href="#authnState.Encode">func (s *authnState) Encode() string</a>

```
searchKey: openidconnect.authnState.Encode
tags: [method private]
```

```Go
func (s *authnState) Encode() string
```

Encode returns the base64-encoded JSON representation of the authn state. 

### <a id="oidcProvider" href="#oidcProvider">type oidcProvider struct</a>

```
searchKey: openidconnect.oidcProvider
tags: [struct private]
```

```Go
type oidcProvider struct {
	oidc.Provider
	providerExtraClaims
}
```

oidcProvider is an OpenID Connect oidcProvider with additional claims parsed from the service oidcProvider discovery response (beyond what github.com/coreos/go-oidc parses by default). 

#### <a id="newProvider" href="#newProvider">func newProvider(ctx context.Context, issuerURL string) (*oidcProvider, error)</a>

```
searchKey: openidconnect.newProvider
tags: [function private]
```

```Go
func newProvider(ctx context.Context, issuerURL string) (*oidcProvider, error)
```

### <a id="provider" href="#provider">type provider struct</a>

```
searchKey: openidconnect.provider
tags: [struct private]
```

```Go
type provider struct {
	config schema.OpenIDConnectAuthProvider

	mu         sync.Mutex
	oidc       *oidcProvider
	refreshErr error
}
```

#### <a id="getProvider" href="#getProvider">func getProvider(id string) *provider</a>

```
searchKey: openidconnect.getProvider
tags: [function private]
```

```Go
func getProvider(id string) *provider
```

getProvider looks up the registered openidconnect auth provider with the given ID. 

#### <a id="handleGetProvider" href="#handleGetProvider">func handleGetProvider(ctx context.Context, w http.ResponseWriter, id string) (p *provider, handled bool)</a>

```
searchKey: openidconnect.handleGetProvider
tags: [function private]
```

```Go
func handleGetProvider(ctx context.Context, w http.ResponseWriter, id string) (p *provider, handled bool)
```

#### <a id="provider.CachedInfo" href="#provider.CachedInfo">func (p *provider) CachedInfo() *providers.Info</a>

```
searchKey: openidconnect.provider.CachedInfo
tags: [method private]
```

```Go
func (p *provider) CachedInfo() *providers.Info
```

CachedInfo implements providers.Provider. 

#### <a id="provider.Config" href="#provider.Config">func (p *provider) Config() schema.AuthProviders</a>

```
searchKey: openidconnect.provider.Config
tags: [method private]
```

```Go
func (p *provider) Config() schema.AuthProviders
```

Config implements providers.Provider. 

#### <a id="provider.ConfigID" href="#provider.ConfigID">func (p *provider) ConfigID() providers.ConfigID</a>

```
searchKey: openidconnect.provider.ConfigID
tags: [method private]
```

```Go
func (p *provider) ConfigID() providers.ConfigID
```

ConfigID implements providers.Provider. 

#### <a id="provider.Refresh" href="#provider.Refresh">func (p *provider) Refresh(ctx context.Context) error</a>

```
searchKey: openidconnect.provider.Refresh
tags: [method private]
```

```Go
func (p *provider) Refresh(ctx context.Context) error
```

Refresh implements providers.Provider. 

#### <a id="provider.getCachedInfoAndError" href="#provider.getCachedInfoAndError">func (p *provider) getCachedInfoAndError() (*providers.Info, error)</a>

```
searchKey: openidconnect.provider.getCachedInfoAndError
tags: [method private]
```

```Go
func (p *provider) getCachedInfoAndError() (*providers.Info, error)
```

#### <a id="provider.oauth2Config" href="#provider.oauth2Config">func (p *provider) oauth2Config() *oauth2.Config</a>

```
searchKey: openidconnect.provider.oauth2Config
tags: [method private]
```

```Go
func (p *provider) oauth2Config() *oauth2.Config
```

### <a id="providerExtraClaims" href="#providerExtraClaims">type providerExtraClaims struct</a>

```
searchKey: openidconnect.providerExtraClaims
tags: [struct private]
```

```Go
type providerExtraClaims struct {
	// EndSessionEndpoint is the URL of the OP's endpoint that logs the user out of the OP (provided
	// in the "end_session_endpoint" field of the OP's service discovery response). See
	// https://openid.net/specs/openid-connect-session-1_0.html#OPMetadata.
	EndSessionEndpoint string `json:"end_session_endpoint,omitempty"`

	// RevocationEndpoint is the URL of the OP's revocation endpoint (provided in the
	// "revocation_endpoint" field of the OP's service discovery response). See
	// https://openid.net/specs/openid-heart-openid-connect-1_0.html#rfc.section.3.5 and
	// https://tools.ietf.org/html/rfc7009.
	RevocationEndpoint string `json:"revocation_endpoint,omitempty"`
}
```

### <a id="providerJSON" href="#providerJSON">type providerJSON struct</a>

```
searchKey: openidconnect.providerJSON
tags: [struct private]
```

```Go
type providerJSON struct {
	Issuer      string `json:"issuer"`
	AuthURL     string `json:"authorization_endpoint"`
	TokenURL    string `json:"token_endpoint"`
	JWKSURL     string `json:"jwks_uri"`
	UserInfoURL string `json:"userinfo_endpoint"`
}
```

providerJSON is the JSON structure the OIDC provider returns at its discovery endpoing 

### <a id="sessionData" href="#sessionData">type sessionData struct</a>

```
searchKey: openidconnect.sessionData
tags: [struct private]
```

```Go
type sessionData struct {
	ID providers.ConfigID

	// Store only the oauth2.Token fields we need, to avoid hitting the ~4096-byte session data
	// limit.
	AccessToken string
	TokenType   string
}
```

### <a id="userClaims" href="#userClaims">type userClaims struct</a>

```
searchKey: openidconnect.userClaims
tags: [struct private]
```

```Go
type userClaims struct {
	Name              string `json:"name"`
	GivenName         string `json:"given_name"`
	FamilyName        string `json:"family_name"`
	PreferredUsername string `json:"preferred_username"`
	Picture           string `json:"picture"`
	EmailVerified     *bool  `json:"email_verified"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="SignOut" href="#SignOut">func SignOut(w http.ResponseWriter, r *http.Request) (endSessionEndpoint string, err error)</a>

```
searchKey: openidconnect.SignOut
tags: [function]
```

```Go
func SignOut(w http.ResponseWriter, r *http.Request) (endSessionEndpoint string, err error)
```

SignOut clears OpenID Connect-related data from the session. If possible, it revokes the token from the OP. If there is an end-session endpoint, it returns that for the caller to present to the user. 

### <a id="TestMiddleware" href="#TestMiddleware">func TestMiddleware(t *testing.T)</a>

```
searchKey: openidconnect.TestMiddleware
tags: [function private test]
```

```Go
func TestMiddleware(t *testing.T)
```

### <a id="TestMiddleware_NoOpenRedirect" href="#TestMiddleware_NoOpenRedirect">func TestMiddleware_NoOpenRedirect(t *testing.T)</a>

```
searchKey: openidconnect.TestMiddleware_NoOpenRedirect
tags: [function private test]
```

```Go
func TestMiddleware_NoOpenRedirect(t *testing.T)
```

### <a id="TestProviderConfigID" href="#TestProviderConfigID">func TestProviderConfigID(t *testing.T)</a>

```
searchKey: openidconnect.TestProviderConfigID
tags: [function private test]
```

```Go
func TestProviderConfigID(t *testing.T)
```

### <a id="TestValidateCustom" href="#TestValidateCustom">func TestValidateCustom(t *testing.T)</a>

```
searchKey: openidconnect.TestValidateCustom
tags: [function private test]
```

```Go
func TestValidateCustom(t *testing.T)
```

### <a id="authHandler" href="#authHandler">func authHandler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: openidconnect.authHandler
tags: [function private]
```

```Go
func authHandler(w http.ResponseWriter, r *http.Request)
```

authHandler handles the OIDC Authentication Code Flow ([http://openid.net/specs/openid-connect-core-1_0.html#CodeFlowAuth](http://openid.net/specs/openid-connect-core-1_0.html#CodeFlowAuth)) on the Relying Party's end. 

🚨 SECURITY 

### <a id="getOrCreateUser" href="#getOrCreateUser">func getOrCreateUser(ctx context.Context, p *provider, idToken *oidc.IDToken, userInfo *oidc.UserInfo, claims *userClaims) (_ *actor.Actor, safeErrMsg string, err error)</a>

```
searchKey: openidconnect.getOrCreateUser
tags: [function private]
```

```Go
func getOrCreateUser(ctx context.Context, p *provider, idToken *oidc.IDToken, userInfo *oidc.UserInfo, claims *userClaims) (_ *actor.Actor, safeErrMsg string, err error)
```

getOrCreateUser gets or creates a user account based on the OpenID Connect token. It returns the authenticated actor if successful; otherwise it returns an friendly error message (safeErrMsg) that is safe to display to users, and a non-nil err with lower-level error details. 

### <a id="getProviders" href="#getProviders">func getProviders() []providers.Provider</a>

```
searchKey: openidconnect.getProviders
tags: [function private]
```

```Go
func getProviders() []providers.Provider
```

### <a id="handleOpenIDConnectAuth" href="#handleOpenIDConnectAuth">func handleOpenIDConnectAuth(w http.ResponseWriter, r *http.Request, next http.Handler, isAPIRequest bool)</a>

```
searchKey: openidconnect.handleOpenIDConnectAuth
tags: [function private]
```

```Go
func handleOpenIDConnectAuth(w http.ResponseWriter, r *http.Request, next http.Handler, isAPIRequest bool)
```

handleOpenIDConnectAuth performs OpenID Connect authentication (if configured) for HTTP requests, both API requests and non-API requests. 

### <a id="init.config.go" href="#init.config.go">func init()</a>

```
searchKey: openidconnect.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.config_watch.go" href="#init.config_watch.go">func init()</a>

```
searchKey: openidconnect.init
tags: [function private]
```

```Go
func init()
```

### <a id="newOIDCIDServer" href="#newOIDCIDServer">func newOIDCIDServer(t *testing.T, code string, oidcProvider *schema.OpenIDConnectAuthProvider) (server *httptest.Server, emailPtr *string)</a>

```
searchKey: openidconnect.newOIDCIDServer
tags: [function private]
```

```Go
func newOIDCIDServer(t *testing.T, code string, oidcProvider *schema.OpenIDConnectAuthProvider) (server *httptest.Server, emailPtr *string)
```

new OIDCIDServer returns a new running mock OIDC ID Provider service. It is the caller's responsibility to call Close(). 

### <a id="providerConfigID" href="#providerConfigID">func providerConfigID(pc *schema.OpenIDConnectAuthProvider) string</a>

```
searchKey: openidconnect.providerConfigID
tags: [function private]
```

```Go
func providerConfigID(pc *schema.OpenIDConnectAuthProvider) string
```

providerConfigID produces a semi-stable identifier for an openidconnect auth provider config object. It is used to distinguish between multiple auth providers of the same type when in multi-step auth flows. Its value is never persisted, and it must be deterministic. 

### <a id="redirectToAuthRequest" href="#redirectToAuthRequest">func redirectToAuthRequest(w http.ResponseWriter, r *http.Request, p *provider, returnToURL string)</a>

```
searchKey: openidconnect.redirectToAuthRequest
tags: [function private]
```

```Go
func redirectToAuthRequest(w http.ResponseWriter, r *http.Request, p *provider, returnToURL string)
```

### <a id="revokeToken" href="#revokeToken">func revokeToken(ctx context.Context, p *provider, accessToken, tokenType string) error</a>

```
searchKey: openidconnect.revokeToken
tags: [function private]
```

```Go
func revokeToken(ctx context.Context, p *provider, accessToken, tokenType string) error
```

revokeToken implements Token Revocation. See [https://tools.ietf.org/html/rfc7009](https://tools.ietf.org/html/rfc7009). 

### <a id="validateConfig" href="#validateConfig">func validateConfig(c conf.Unified) (problems conf.Problems)</a>

```
searchKey: openidconnect.validateConfig
tags: [function private]
```

```Go
func validateConfig(c conf.Unified) (problems conf.Problems)
```

