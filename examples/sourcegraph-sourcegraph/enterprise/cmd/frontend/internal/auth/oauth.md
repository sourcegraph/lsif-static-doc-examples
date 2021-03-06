# Package oauth

## Index

* [Constants](#const)
    * [const LoginStateOpCreateAccount](#LoginStateOpCreateAccount)
    * [const LoginStateOpCreateCodeHostConnection](#LoginStateOpCreateCodeHostConnection)
* [Variables](#var)
    * [var extraScopes](#extraScopes)
    * [var isOAuths](#isOAuths)
    * [var traceLogEnabled](#traceLogEnabled)
* [Types](#type)
    * [type LoginState struct](#LoginState)
        * [func DecodeState(encoded string) (*LoginState, error)](#DecodeState)
        * [func (s LoginState) Encode() (string, error)](#LoginState.Encode)
    * [type LoginStateOp string](#LoginStateOp)
    * [type Provider struct](#Provider)
        * [func GetProvider(serviceType, id string) *Provider](#GetProvider)
        * [func NewProvider(op ProviderOp) *Provider](#NewProvider)
        * [func getExactlyOneOAuthProvider() *Provider](#getExactlyOneOAuthProvider)
        * [func (p *Provider) CachedInfo() *providers.Info](#Provider.CachedInfo)
        * [func (p *Provider) Config() schema.AuthProviders](#Provider.Config)
        * [func (p *Provider) ConfigID() providers.ConfigID](#Provider.ConfigID)
        * [func (p *Provider) Refresh(ctx context.Context) error](#Provider.Refresh)
    * [type ProviderOp struct](#ProviderOp)
    * [type SessionData struct](#SessionData)
    * [type SessionIssuerHelper interface](#SessionIssuerHelper)
    * [type loggingRoundTripper struct](#loggingRoundTripper)
        * [func (l *loggingRoundTripper) RoundTrip(req *http.Request) (*http.Response, error)](#loggingRoundTripper.RoundTrip)
* [Functions](#func)
    * [func AddIsOAuth(f func(p schema.AuthProviders) bool)](#AddIsOAuth)
    * [func NewCookie(config gologin.CookieConfig, value string) *http.Cookie](#NewCookie)
    * [func NewHandler(db dbutil.DB, serviceType, authPrefix string, isAPIHandler bool, next http.Handler) http.Handler](#NewHandler)
    * [func SessionIssuer(s SessionIssuerHelper, sessionKey string) http.Handler](#SessionIssuer)
    * [func TestCanRedirect(t *testing.T)](#TestCanRedirect)
    * [func canRedirect(redirect string) bool](#canRedirect)
    * [func expiresTime(maxAge int) (time.Time, bool)](#expiresTime)
    * [func getExtraScopes(ctx context.Context, db dbutil.DB, serviceType string) ([]string, error)](#getExtraScopes)
    * [func getRedirect(req *http.Request) (string, error)](#getRedirect)
    * [func isHuman(req *http.Request) bool](#isHuman)
    * [func isOAuth(p schema.AuthProviders) bool](#isOAuth)
    * [func newOAuthFlowHandler(db dbutil.DB, serviceType string) http.Handler](#newOAuthFlowHandler)
    * [func previewAndDuplicateReader(reader io.ReadCloser) (preview string, freshReader io.ReadCloser, err error)](#previewAndDuplicateReader)
    * [func randomState() (string, error)](#randomState)
    * [func stateHandler(isLogin bool, providerID string, config gologin.CookieConfig, success func(oauth2.Config) http.Handler) func(oauth2.Config) http.Handler](#stateHandler)
    * [func withOAuthExternalHTTPClient(r *http.Request) *http.Request](#withOAuthExternalHTTPClient)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="LoginStateOpCreateAccount" href="#LoginStateOpCreateAccount">const LoginStateOpCreateAccount</a>

```
searchKey: oauth.LoginStateOpCreateAccount
tags: [constant string]
```

```Go
const LoginStateOpCreateAccount LoginStateOp = ""
```

NOTE: OAuth is almost always used for creating new accounts, therefore we don't need a special name for it. 

### <a id="LoginStateOpCreateCodeHostConnection" href="#LoginStateOpCreateCodeHostConnection">const LoginStateOpCreateCodeHostConnection</a>

```
searchKey: oauth.LoginStateOpCreateCodeHostConnection
tags: [constant string]
```

```Go
const LoginStateOpCreateCodeHostConnection LoginStateOp = "createCodeHostConnection"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="extraScopes" href="#extraScopes">var extraScopes</a>

```
searchKey: oauth.extraScopes
tags: [variable object private]
```

```Go
var extraScopes = ...
```

serviceType -> scopes 

### <a id="isOAuths" href="#isOAuths">var isOAuths</a>

```
searchKey: oauth.isOAuths
tags: [variable array function private]
```

```Go
var isOAuths []func(p schema.AuthProviders) bool
```

### <a id="traceLogEnabled" href="#traceLogEnabled">var traceLogEnabled</a>

```
searchKey: oauth.traceLogEnabled
tags: [variable boolean private]
```

```Go
var traceLogEnabled, _ = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="LoginState" href="#LoginState">type LoginState struct</a>

```
searchKey: oauth.LoginState
tags: [struct]
```

```Go
type LoginState struct {
	// Redirect is the URL path to redirect to after login.
	Redirect string

	// ProviderID is the service ID of the provider that is handling the auth flow.
	ProviderID string

	// CSRF is the random string that ensures the encoded state is sufficiently random to be checked
	// for CSRF purposes.
	CSRF string

	// Op is the operation to be done after OAuth flow. The default operation is to create a new account.
	Op LoginStateOp
}
```

#### <a id="DecodeState" href="#DecodeState">func DecodeState(encoded string) (*LoginState, error)</a>

```
searchKey: oauth.DecodeState
tags: [function]
```

```Go
func DecodeState(encoded string) (*LoginState, error)
```

#### <a id="LoginState.Encode" href="#LoginState.Encode">func (s LoginState) Encode() (string, error)</a>

```
searchKey: oauth.LoginState.Encode
tags: [method]
```

```Go
func (s LoginState) Encode() (string, error)
```

### <a id="LoginStateOp" href="#LoginStateOp">type LoginStateOp string</a>

```
searchKey: oauth.LoginStateOp
tags: [string]
```

```Go
type LoginStateOp string
```

### <a id="Provider" href="#Provider">type Provider struct</a>

```
searchKey: oauth.Provider
tags: [struct]
```

```Go
type Provider struct {
	ProviderOp

	Login    func(oauth2.Config) http.Handler
	Callback func(oauth2.Config) http.Handler
}
```

#### <a id="GetProvider" href="#GetProvider">func GetProvider(serviceType, id string) *Provider</a>

```
searchKey: oauth.GetProvider
tags: [function]
```

```Go
func GetProvider(serviceType, id string) *Provider
```

GetProvider returns a provider with given serviceType and ID. It returns nil if no such provider. 

#### <a id="NewProvider" href="#NewProvider">func NewProvider(op ProviderOp) *Provider</a>

```
searchKey: oauth.NewProvider
tags: [function]
```

```Go
func NewProvider(op ProviderOp) *Provider
```

#### <a id="getExactlyOneOAuthProvider" href="#getExactlyOneOAuthProvider">func getExactlyOneOAuthProvider() *Provider</a>

```
searchKey: oauth.getExactlyOneOAuthProvider
tags: [function private]
```

```Go
func getExactlyOneOAuthProvider() *Provider
```

#### <a id="Provider.CachedInfo" href="#Provider.CachedInfo">func (p *Provider) CachedInfo() *providers.Info</a>

```
searchKey: oauth.Provider.CachedInfo
tags: [method]
```

```Go
func (p *Provider) CachedInfo() *providers.Info
```

#### <a id="Provider.Config" href="#Provider.Config">func (p *Provider) Config() schema.AuthProviders</a>

```
searchKey: oauth.Provider.Config
tags: [method]
```

```Go
func (p *Provider) Config() schema.AuthProviders
```

#### <a id="Provider.ConfigID" href="#Provider.ConfigID">func (p *Provider) ConfigID() providers.ConfigID</a>

```
searchKey: oauth.Provider.ConfigID
tags: [method]
```

```Go
func (p *Provider) ConfigID() providers.ConfigID
```

#### <a id="Provider.Refresh" href="#Provider.Refresh">func (p *Provider) Refresh(ctx context.Context) error</a>

```
searchKey: oauth.Provider.Refresh
tags: [method]
```

```Go
func (p *Provider) Refresh(ctx context.Context) error
```

### <a id="ProviderOp" href="#ProviderOp">type ProviderOp struct</a>

```
searchKey: oauth.ProviderOp
tags: [struct]
```

```Go
type ProviderOp struct {
	AuthPrefix   string
	OAuth2Config func(extraScopes ...string) oauth2.Config
	SourceConfig schema.AuthProviders
	StateConfig  gologin.CookieConfig
	ServiceID    string
	ServiceType  string
	Login        func(oauth2.Config) http.Handler
	Callback     func(oauth2.Config) http.Handler
}
```

### <a id="SessionData" href="#SessionData">type SessionData struct</a>

```
searchKey: oauth.SessionData
tags: [struct]
```

```Go
type SessionData struct {
	ID providers.ConfigID

	// Store only the oauth2.Token fields we need, to avoid hitting the ~4096-byte session data
	// limit.
	AccessToken string
	TokenType   string
}
```

### <a id="SessionIssuerHelper" href="#SessionIssuerHelper">type SessionIssuerHelper interface</a>

```
searchKey: oauth.SessionIssuerHelper
tags: [interface]
```

```Go
type SessionIssuerHelper interface {
	GetOrCreateUser(ctx context.Context, token *oauth2.Token, anonymousUserID, firstSourceURL string) (actr *actor.Actor, safeErrMsg string, err error)
	CreateCodeHostConnection(ctx context.Context, token *oauth2.Token, providerID string) (safeErrMsg string, err error)
	DeleteStateCookie(w http.ResponseWriter)
	SessionData(token *oauth2.Token) SessionData
}
```

### <a id="loggingRoundTripper" href="#loggingRoundTripper">type loggingRoundTripper struct</a>

```
searchKey: oauth.loggingRoundTripper
tags: [struct private]
```

```Go
type loggingRoundTripper struct {
	underlying http.RoundTripper
}
```

#### <a id="loggingRoundTripper.RoundTrip" href="#loggingRoundTripper.RoundTrip">func (l *loggingRoundTripper) RoundTrip(req *http.Request) (*http.Response, error)</a>

```
searchKey: oauth.loggingRoundTripper.RoundTrip
tags: [method private]
```

```Go
func (l *loggingRoundTripper) RoundTrip(req *http.Request) (*http.Response, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="AddIsOAuth" href="#AddIsOAuth">func AddIsOAuth(f func(p schema.AuthProviders) bool)</a>

```
searchKey: oauth.AddIsOAuth
tags: [function]
```

```Go
func AddIsOAuth(f func(p schema.AuthProviders) bool)
```

### <a id="NewCookie" href="#NewCookie">func NewCookie(config gologin.CookieConfig, value string) *http.Cookie</a>

```
searchKey: oauth.NewCookie
tags: [function]
```

```Go
func NewCookie(config gologin.CookieConfig, value string) *http.Cookie
```

NewCookie returns a new http.Cookie with the given value and CookieConfig properties (name, max-age, etc.). 

The MaxAge field is used to determine whether an Expires field should be added for Internet Explorer compatibility and what its value should be. 

### <a id="NewHandler" href="#NewHandler">func NewHandler(db dbutil.DB, serviceType, authPrefix string, isAPIHandler bool, next http.Handler) http.Handler</a>

```
searchKey: oauth.NewHandler
tags: [function]
```

```Go
func NewHandler(db dbutil.DB, serviceType, authPrefix string, isAPIHandler bool, next http.Handler) http.Handler
```

### <a id="SessionIssuer" href="#SessionIssuer">func SessionIssuer(s SessionIssuerHelper, sessionKey string) http.Handler</a>

```
searchKey: oauth.SessionIssuer
tags: [function]
```

```Go
func SessionIssuer(s SessionIssuerHelper, sessionKey string) http.Handler
```

### <a id="TestCanRedirect" href="#TestCanRedirect">func TestCanRedirect(t *testing.T)</a>

```
searchKey: oauth.TestCanRedirect
tags: [function private test]
```

```Go
func TestCanRedirect(t *testing.T)
```

### <a id="canRedirect" href="#canRedirect">func canRedirect(redirect string) bool</a>

```
searchKey: oauth.canRedirect
tags: [function private]
```

```Go
func canRedirect(redirect string) bool
```

canRedirect is used to limit the set of URLs we will redirect to after login to prevent open redirect exploits for things like phishing 

### <a id="expiresTime" href="#expiresTime">func expiresTime(maxAge int) (time.Time, bool)</a>

```
searchKey: oauth.expiresTime
tags: [function private]
```

```Go
func expiresTime(maxAge int) (time.Time, bool)
```

expiresTime converts a maxAge time in seconds to a time.Time in the future if the maxAge is positive or the beginning of the epoch if maxAge is negative. If maxAge is exactly 0, an empty time and false are returned (so the Cookie Expires field should not be set). [http://golang.org/src/net/http/cookie.go?s=618:801#L23](http://golang.org/src/net/http/cookie.go?s=618:801#L23) 

### <a id="getExtraScopes" href="#getExtraScopes">func getExtraScopes(ctx context.Context, db dbutil.DB, serviceType string) ([]string, error)</a>

```
searchKey: oauth.getExtraScopes
tags: [function private]
```

```Go
func getExtraScopes(ctx context.Context, db dbutil.DB, serviceType string) ([]string, error)
```

### <a id="getRedirect" href="#getRedirect">func getRedirect(req *http.Request) (string, error)</a>

```
searchKey: oauth.getRedirect
tags: [function private]
```

```Go
func getRedirect(req *http.Request) (string, error)
```

if we have a redirect param use that, otherwise we'll try and pull the 'returnTo' param from the referrer URL, this is usually the login page where the user has been dumped to after following a link. 

### <a id="isHuman" href="#isHuman">func isHuman(req *http.Request) bool</a>

```
searchKey: oauth.isHuman
tags: [function private]
```

```Go
func isHuman(req *http.Request) bool
```

isHuman returns true if the request probably came from a human, rather than a bot. Used to prevent unfurling the wrong URL preview. 

### <a id="isOAuth" href="#isOAuth">func isOAuth(p schema.AuthProviders) bool</a>

```
searchKey: oauth.isOAuth
tags: [function private]
```

```Go
func isOAuth(p schema.AuthProviders) bool
```

### <a id="newOAuthFlowHandler" href="#newOAuthFlowHandler">func newOAuthFlowHandler(db dbutil.DB, serviceType string) http.Handler</a>

```
searchKey: oauth.newOAuthFlowHandler
tags: [function private]
```

```Go
func newOAuthFlowHandler(db dbutil.DB, serviceType string) http.Handler
```

### <a id="previewAndDuplicateReader" href="#previewAndDuplicateReader">func previewAndDuplicateReader(reader io.ReadCloser) (preview string, freshReader io.ReadCloser, err error)</a>

```
searchKey: oauth.previewAndDuplicateReader
tags: [function private]
```

```Go
func previewAndDuplicateReader(reader io.ReadCloser) (preview string, freshReader io.ReadCloser, err error)
```

### <a id="randomState" href="#randomState">func randomState() (string, error)</a>

```
searchKey: oauth.randomState
tags: [function private]
```

```Go
func randomState() (string, error)
```

Returns a base64 encoded random 32 byte string. 

### <a id="stateHandler" href="#stateHandler">func stateHandler(isLogin bool, providerID string, config gologin.CookieConfig, success func(oauth2.Config) http.Handler) func(oauth2.Config) http.Handler</a>

```
searchKey: oauth.stateHandler
tags: [function private]
```

```Go
func stateHandler(isLogin bool, providerID string, config gologin.CookieConfig, success func(oauth2.Config) http.Handler) func(oauth2.Config) http.Handler
```

stateHandler decodes the state from the gologin cookie and sets it in the context. It checked by some downstream handler to ensure equality with the value of the state URL param. 

This is very similar to gologin's default StateHandler function, but we define our own, because we encode the returnTo URL in the state. We could use the `redirect_uri` parameter to do this, but doing so would require using Sourcegraph's external hostname and making sure it is consistent with what is specified in the OAuth app config as the "callback URL." 

### <a id="withOAuthExternalHTTPClient" href="#withOAuthExternalHTTPClient">func withOAuthExternalHTTPClient(r *http.Request) *http.Request</a>

```
searchKey: oauth.withOAuthExternalHTTPClient
tags: [function private]
```

```Go
func withOAuthExternalHTTPClient(r *http.Request) *http.Request
```

withOAuthExternalHTTPClient updates client such that the golang.org/x/oauth2 package will use our http client which is configured with proxy and TLS settings/etc. 

