# Package saml

Package saml provides HTTP middleware that provides the necessary endpoints for a SAML Service Provider (SP) to complete the SAML authentication flow to authenticate to the frontend. 

## Index

* [Constants](#const)
    * [const authPrefix](#authPrefix)
    * [const providerType](#providerType)
    * [const testSAMLSPCert](#testSAMLSPCert)
    * [const testSAMLSPKey](#testSAMLSPKey)
    * [const testAuthnResponse](#testAuthnResponse)
* [Variables](#var)
    * [var mockGetProviderValue](#mockGetProviderValue)
    * [var traceLogEnabled](#traceLogEnabled)
    * [var Middleware](#Middleware)
    * [var idpCert](#idpCert)
    * [var idpKey](#idpKey)
    * [var idpCert2](#idpCert2)
* [Types](#type)
    * [type relayState struct](#relayState)
        * [func (s *relayState) encode() string](#relayState.encode)
        * [func (s *relayState) decode(encoded string)](#relayState.decode)
    * [type provider struct](#provider)
        * [func getProvider(pcID string) *provider](#getProvider)
        * [func handleGetProvider(ctx context.Context, w http.ResponseWriter, pcID string) (p *provider, handled bool)](#handleGetProvider)
        * [func (p *provider) ConfigID() providers.ConfigID](#provider.ConfigID)
        * [func (p *provider) Config() schema.AuthProviders](#provider.Config)
        * [func (p *provider) Refresh(ctx context.Context) error](#provider.Refresh)
        * [func (p *provider) getCachedInfoAndError() (*providers.Info, error)](#provider.getCachedInfoAndError)
        * [func (p *provider) CachedInfo() *providers.Info](#provider.CachedInfo)
    * [type entitiesDescriptor struct](#entitiesDescriptor)
    * [type providerConfig struct](#providerConfig)
        * [func readProviderConfig(pc *schema.SAMLAuthProvider) (*providerConfig, error)](#readProviderConfig)
    * [type authnResponseInfo struct](#authnResponseInfo)
        * [func readAuthnResponse(p *provider, encodedResp string) (*authnResponseInfo, error)](#readAuthnResponse)
    * [type samlAssertionValues saml2.Values](#samlAssertionValues)
        * [func (v samlAssertionValues) Get(key string) string](#samlAssertionValues.Get)
* [Functions](#func)
    * [func init()](#init)
    * [func validateConfig(c conf.Unified) (problems conf.Problems)](#validateConfig)
    * [func withConfigDefaults(pc *schema.SAMLAuthProvider) *schema.SAMLAuthProvider](#withConfigDefaults)
    * [func getNameIDFormat(pc *schema.SAMLAuthProvider) string](#getNameIDFormat)
    * [func providerConfigID(pc *schema.SAMLAuthProvider, multiple bool) string](#providerConfigID)
    * [func traceLog(description, body string)](#traceLog)
    * [func getProviders() []providers.Provider](#getProviders)
    * [func init()](#init)
    * [func authHandler(w http.ResponseWriter, r *http.Request, next http.Handler, isAPIRequest bool)](#authHandler)
    * [func samlSPHandler(w http.ResponseWriter, r *http.Request)](#samlSPHandler)
    * [func redirectToAuthURL(w http.ResponseWriter, r *http.Request, p *provider, returnToURL string)](#redirectToAuthURL)
    * [func buildAuthURLRedirect(p *provider, relayState relayState) (string, error)](#buildAuthURLRedirect)
    * [func providerIDQuery(pc *schema.SAMLAuthProvider, multiple bool) url.Values](#providerIDQuery)
    * [func getServiceProvider(ctx context.Context, pc *schema.SAMLAuthProvider) (*saml2.SAMLServiceProvider, error)](#getServiceProvider)
    * [func unmarshalEntityDescriptor(data []byte) (*types.EntityDescriptor, error)](#unmarshalEntityDescriptor)
    * [func readIdentityProviderMetadata(ctx context.Context, c *providerConfig) ([]byte, error)](#readIdentityProviderMetadata)
    * [func SignOut(w http.ResponseWriter, r *http.Request) (logoutURL string, err error)](#SignOut)
    * [func getFirstProviderConfig() (pc *schema.SAMLAuthProvider, multiple bool)](#getFirstProviderConfig)
    * [func newLogoutRequest(p *provider) (*etree.Document, error)](#newLogoutRequest)
    * [func getOrCreateUser(ctx context.Context, allowSignup bool, info *authnResponseInfo) (_ *actor.Actor, safeErrMsg string, err error)](#getOrCreateUser)
    * [func mightBeEmail(s string) bool](#mightBeEmail)
    * [func TestValidateCustom(t *testing.T)](#TestValidateCustom)
    * [func TestProviderConfigID(t *testing.T)](#TestProviderConfigID)
    * [func newSAMLIDPServer(t *testing.T) (*httptest.Server, *samlidp.Server)](#newSAMLIDPServer)
    * [func TestMiddleware(t *testing.T)](#TestMiddleware)
    * [func unexpiredCookies(resp *http.Response) (cookies []*http.Cookie)](#unexpiredCookies)
    * [func TestReadAuthnResponse(t *testing.T)](#TestReadAuthnResponse)


## <a id="const" href="#const">Constants</a>

### <a id="authPrefix" href="#authPrefix">const authPrefix</a>

```
searchKey: saml.authPrefix
```

```Go
const authPrefix = auth.AuthURLPrefix + "/saml"
```

All SAML endpoints are under this path prefix. 

### <a id="providerType" href="#providerType">const providerType</a>

```
searchKey: saml.providerType
```

```Go
const providerType = "saml"
```

### <a id="testSAMLSPCert" href="#testSAMLSPCert">const testSAMLSPCert</a>

```
searchKey: saml.testSAMLSPCert
```

```Go
const testSAMLSPCert = ...
```

### <a id="testSAMLSPKey" href="#testSAMLSPKey">const testSAMLSPKey</a>

```
searchKey: saml.testSAMLSPKey
```

```Go
const testSAMLSPKey = ...
```

### <a id="testAuthnResponse" href="#testAuthnResponse">const testAuthnResponse</a>

```
searchKey: saml.testAuthnResponse
```

```Go
const testAuthnResponse = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="mockGetProviderValue" href="#mockGetProviderValue">var mockGetProviderValue</a>

```
searchKey: saml.mockGetProviderValue
```

```Go
var mockGetProviderValue *provider
```

### <a id="traceLogEnabled" href="#traceLogEnabled">var traceLogEnabled</a>

```
searchKey: saml.traceLogEnabled
```

```Go
var traceLogEnabled, _ = ...
```

### <a id="Middleware" href="#Middleware">var Middleware</a>

```
searchKey: saml.Middleware
tags: [exported]
```

```Go
var Middleware = ...
```

Middleware is middleware for SAML authentication, adding endpoints under the auth path prefix to enable the login flow an requiring login for all other endpoints. 

🚨 SECURITY 

### <a id="idpCert" href="#idpCert">var idpCert</a>

```
searchKey: saml.idpCert
```

```Go
var idpCert = ...
```

### <a id="idpKey" href="#idpKey">var idpKey</a>

```
searchKey: saml.idpKey
```

```Go
var idpKey = ...
```

### <a id="idpCert2" href="#idpCert2">var idpCert2</a>

```
searchKey: saml.idpCert2
```

```Go
var idpCert2 = ...
```

## <a id="type" href="#type">Types</a>

### <a id="relayState" href="#relayState">type relayState struct</a>

```
searchKey: saml.relayState
```

```Go
type relayState struct {
	ProviderID  string `json:"k"`
	ReturnToURL string `json:"r"`
}
```

relayState represents the decoded RelayState value in both the IdP-initiated and SP-initiated login flows. 

SAML overloads the term "RelayState". * In the SP-initiated login flow, it is an opaque value originated from the SP and reflected 

```
back in the AuthnResponse. The Sourcegraph SP uses the base64-encoded JSON of this struct as
the RelayState.

```
* In the IdP-initiated login flow, the RelayState can be any arbitrary hint, but in practice 

```
is the desired post-login redirect URL in plain text.

```
#### <a id="relayState.encode" href="#relayState.encode">func (s *relayState) encode() string</a>

```
searchKey: saml.relayState.encode
```

```Go
func (s *relayState) encode() string
```

encode returns the base64-encoded JSON representation of the relay state. 

#### <a id="relayState.decode" href="#relayState.decode">func (s *relayState) decode(encoded string)</a>

```
searchKey: saml.relayState.decode
```

```Go
func (s *relayState) decode(encoded string)
```

Decode decodes the base64-encoded JSON representation of the relay state into the receiver. 

### <a id="provider" href="#provider">type provider struct</a>

```
searchKey: saml.provider
```

```Go
type provider struct {
	config   schema.SAMLAuthProvider
	multiple bool // whether there are multiple SAML auth providers

	mu         sync.Mutex
	samlSP     *saml2.SAMLServiceProvider
	refreshErr error
}
```

#### <a id="getProvider" href="#getProvider">func getProvider(pcID string) *provider</a>

```
searchKey: saml.getProvider
```

```Go
func getProvider(pcID string) *provider
```

getProvider looks up the registered saml auth provider with the given ID. 

#### <a id="handleGetProvider" href="#handleGetProvider">func handleGetProvider(ctx context.Context, w http.ResponseWriter, pcID string) (p *provider, handled bool)</a>

```
searchKey: saml.handleGetProvider
```

```Go
func handleGetProvider(ctx context.Context, w http.ResponseWriter, pcID string) (p *provider, handled bool)
```

#### <a id="provider.ConfigID" href="#provider.ConfigID">func (p *provider) ConfigID() providers.ConfigID</a>

```
searchKey: saml.provider.ConfigID
```

```Go
func (p *provider) ConfigID() providers.ConfigID
```

ConfigID implements providers.Provider. 

#### <a id="provider.Config" href="#provider.Config">func (p *provider) Config() schema.AuthProviders</a>

```
searchKey: saml.provider.Config
```

```Go
func (p *provider) Config() schema.AuthProviders
```

Config implements providers.Provider. 

#### <a id="provider.Refresh" href="#provider.Refresh">func (p *provider) Refresh(ctx context.Context) error</a>

```
searchKey: saml.provider.Refresh
```

```Go
func (p *provider) Refresh(ctx context.Context) error
```

Refresh implements providers.Provider. 

#### <a id="provider.getCachedInfoAndError" href="#provider.getCachedInfoAndError">func (p *provider) getCachedInfoAndError() (*providers.Info, error)</a>

```
searchKey: saml.provider.getCachedInfoAndError
```

```Go
func (p *provider) getCachedInfoAndError() (*providers.Info, error)
```

#### <a id="provider.CachedInfo" href="#provider.CachedInfo">func (p *provider) CachedInfo() *providers.Info</a>

```
searchKey: saml.provider.CachedInfo
```

```Go
func (p *provider) CachedInfo() *providers.Info
```

CachedInfo implements providers.Provider. 

### <a id="entitiesDescriptor" href="#entitiesDescriptor">type entitiesDescriptor struct</a>

```
searchKey: saml.entitiesDescriptor
```

```Go
type entitiesDescriptor struct {
	XMLName             xml.Name       `xml:"urn:oasis:names:tc:SAML:2.0:metadata EntitiesDescriptor"`
	ID                  *string        `xml:",attr,omitempty"`
	ValidUntil          *time.Time     `xml:"validUntil,attr,omitempty"`
	CacheDuration       *time.Duration `xml:"cacheDuration,attr,omitempty"`
	Name                *string        `xml:",attr,omitempty"`
	Signature           *etree.Element
	EntitiesDescriptors []entitiesDescriptor     `xml:"urn:oasis:names:tc:SAML:2.0:metadata EntitiesDescriptor"`
	EntityDescriptors   []types.EntityDescriptor `xml:"urn:oasis:names:tc:SAML:2.0:metadata EntityDescriptor"`
}
```

entitiesDescriptor represents the SAML EntitiesDescriptor object. 

### <a id="providerConfig" href="#providerConfig">type providerConfig struct</a>

```
searchKey: saml.providerConfig
```

```Go
type providerConfig struct {
	keyPair *tls.Certificate

	// Exactly 1 of these is set:
	identityProviderMetadataURL *url.URL
	identityProviderMetadata    []byte
}
```

#### <a id="readProviderConfig" href="#readProviderConfig">func readProviderConfig(pc *schema.SAMLAuthProvider) (*providerConfig, error)</a>

```
searchKey: saml.readProviderConfig
```

```Go
func readProviderConfig(pc *schema.SAMLAuthProvider) (*providerConfig, error)
```

### <a id="authnResponseInfo" href="#authnResponseInfo">type authnResponseInfo struct</a>

```
searchKey: saml.authnResponseInfo
```

```Go
type authnResponseInfo struct {
	spec                 extsvc.AccountSpec
	email, displayName   string
	unnormalizedUsername string
	accountData          interface{}
}
```

#### <a id="readAuthnResponse" href="#readAuthnResponse">func readAuthnResponse(p *provider, encodedResp string) (*authnResponseInfo, error)</a>

```
searchKey: saml.readAuthnResponse
```

```Go
func readAuthnResponse(p *provider, encodedResp string) (*authnResponseInfo, error)
```

### <a id="samlAssertionValues" href="#samlAssertionValues">type samlAssertionValues saml2.Values</a>

```
searchKey: saml.samlAssertionValues
```

```Go
type samlAssertionValues saml2.Values
```

#### <a id="samlAssertionValues.Get" href="#samlAssertionValues.Get">func (v samlAssertionValues) Get(key string) string</a>

```
searchKey: saml.samlAssertionValues.Get
```

```Go
func (v samlAssertionValues) Get(key string) string
```

## <a id="func" href="#func">Functions</a>

### <a id="init" href="#init">func init()</a>

```
searchKey: saml.init
```

```Go
func init()
```

### <a id="validateConfig" href="#validateConfig">func validateConfig(c conf.Unified) (problems conf.Problems)</a>

```
searchKey: saml.validateConfig
```

```Go
func validateConfig(c conf.Unified) (problems conf.Problems)
```

### <a id="withConfigDefaults" href="#withConfigDefaults">func withConfigDefaults(pc *schema.SAMLAuthProvider) *schema.SAMLAuthProvider</a>

```
searchKey: saml.withConfigDefaults
```

```Go
func withConfigDefaults(pc *schema.SAMLAuthProvider) *schema.SAMLAuthProvider
```

### <a id="getNameIDFormat" href="#getNameIDFormat">func getNameIDFormat(pc *schema.SAMLAuthProvider) string</a>

```
searchKey: saml.getNameIDFormat
```

```Go
func getNameIDFormat(pc *schema.SAMLAuthProvider) string
```

### <a id="providerConfigID" href="#providerConfigID">func providerConfigID(pc *schema.SAMLAuthProvider, multiple bool) string</a>

```
searchKey: saml.providerConfigID
```

```Go
func providerConfigID(pc *schema.SAMLAuthProvider, multiple bool) string
```

providerConfigID produces a semi-stable identifier for a saml auth provider config object. It is used to distinguish between multiple auth providers of the same type when in multi-step auth flows. Its value is never persisted, and it must be deterministic. 

If there is only a single saml auth provider, it returns the empty string because that satisfies the requirements above. 

### <a id="traceLog" href="#traceLog">func traceLog(description, body string)</a>

```
searchKey: saml.traceLog
```

```Go
func traceLog(description, body string)
```

### <a id="getProviders" href="#getProviders">func getProviders() []providers.Provider</a>

```
searchKey: saml.getProviders
```

```Go
func getProviders() []providers.Provider
```

### <a id="init" href="#init">func init()</a>

```
searchKey: saml.init
```

```Go
func init()
```

### <a id="authHandler" href="#authHandler">func authHandler(w http.ResponseWriter, r *http.Request, next http.Handler, isAPIRequest bool)</a>

```
searchKey: saml.authHandler
```

```Go
func authHandler(w http.ResponseWriter, r *http.Request, next http.Handler, isAPIRequest bool)
```

authHandler is the new SAML HTTP auth handler. 

It uses github.com/russelhaering/gosaml2 and (unlike authHandler1) makes it possible to support multiple auth providers with SAML and expose more SAML functionality. 

### <a id="samlSPHandler" href="#samlSPHandler">func samlSPHandler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: saml.samlSPHandler
```

```Go
func samlSPHandler(w http.ResponseWriter, r *http.Request)
```

### <a id="redirectToAuthURL" href="#redirectToAuthURL">func redirectToAuthURL(w http.ResponseWriter, r *http.Request, p *provider, returnToURL string)</a>

```
searchKey: saml.redirectToAuthURL
```

```Go
func redirectToAuthURL(w http.ResponseWriter, r *http.Request, p *provider, returnToURL string)
```

### <a id="buildAuthURLRedirect" href="#buildAuthURLRedirect">func buildAuthURLRedirect(p *provider, relayState relayState) (string, error)</a>

```
searchKey: saml.buildAuthURLRedirect
```

```Go
func buildAuthURLRedirect(p *provider, relayState relayState) (string, error)
```

### <a id="providerIDQuery" href="#providerIDQuery">func providerIDQuery(pc *schema.SAMLAuthProvider, multiple bool) url.Values</a>

```
searchKey: saml.providerIDQuery
```

```Go
func providerIDQuery(pc *schema.SAMLAuthProvider, multiple bool) url.Values
```

### <a id="getServiceProvider" href="#getServiceProvider">func getServiceProvider(ctx context.Context, pc *schema.SAMLAuthProvider) (*saml2.SAMLServiceProvider, error)</a>

```
searchKey: saml.getServiceProvider
```

```Go
func getServiceProvider(ctx context.Context, pc *schema.SAMLAuthProvider) (*saml2.SAMLServiceProvider, error)
```

### <a id="unmarshalEntityDescriptor" href="#unmarshalEntityDescriptor">func unmarshalEntityDescriptor(data []byte) (*types.EntityDescriptor, error)</a>

```
searchKey: saml.unmarshalEntityDescriptor
```

```Go
func unmarshalEntityDescriptor(data []byte) (*types.EntityDescriptor, error)
```

unmarshalEntityDescriptor unmarshals from an XML root <EntityDescriptor> or <EntitiesDescriptor> element. If the latter, it returns the first <EntityDescriptor> child that has an IDPSSODescriptor. 

Taken from github.com/crewjam/saml. 

### <a id="readIdentityProviderMetadata" href="#readIdentityProviderMetadata">func readIdentityProviderMetadata(ctx context.Context, c *providerConfig) ([]byte, error)</a>

```
searchKey: saml.readIdentityProviderMetadata
```

```Go
func readIdentityProviderMetadata(ctx context.Context, c *providerConfig) ([]byte, error)
```

### <a id="SignOut" href="#SignOut">func SignOut(w http.ResponseWriter, r *http.Request) (logoutURL string, err error)</a>

```
searchKey: saml.SignOut
tags: [exported]
```

```Go
func SignOut(w http.ResponseWriter, r *http.Request) (logoutURL string, err error)
```

SignOut returns the URL where the user can initiate a logout from the SAML IdentityProvider, if it has a SingleLogoutService. 

### <a id="getFirstProviderConfig" href="#getFirstProviderConfig">func getFirstProviderConfig() (pc *schema.SAMLAuthProvider, multiple bool)</a>

```
searchKey: saml.getFirstProviderConfig
```

```Go
func getFirstProviderConfig() (pc *schema.SAMLAuthProvider, multiple bool)
```

getFirstProviderConfig returns the SAML auth provider config. At most 1 can be specified in site config; if there is more than 1, it returns multiple == true (which the caller should handle by returning an error and refusing to proceed with auth). 

### <a id="newLogoutRequest" href="#newLogoutRequest">func newLogoutRequest(p *provider) (*etree.Document, error)</a>

```
searchKey: saml.newLogoutRequest
```

```Go
func newLogoutRequest(p *provider) (*etree.Document, error)
```

### <a id="getOrCreateUser" href="#getOrCreateUser">func getOrCreateUser(ctx context.Context, allowSignup bool, info *authnResponseInfo) (_ *actor.Actor, safeErrMsg string, err error)</a>

```
searchKey: saml.getOrCreateUser
```

```Go
func getOrCreateUser(ctx context.Context, allowSignup bool, info *authnResponseInfo) (_ *actor.Actor, safeErrMsg string, err error)
```

getOrCreateUser gets or creates a user account based on the SAML claims. It returns the authenticated actor if successful; otherwise it returns an friendly error message (safeErrMsg) that is safe to display to users, and a non-nil err with lower-level error details. 

### <a id="mightBeEmail" href="#mightBeEmail">func mightBeEmail(s string) bool</a>

```
searchKey: saml.mightBeEmail
```

```Go
func mightBeEmail(s string) bool
```

### <a id="TestValidateCustom" href="#TestValidateCustom">func TestValidateCustom(t *testing.T)</a>

```
searchKey: saml.TestValidateCustom
```

```Go
func TestValidateCustom(t *testing.T)
```

### <a id="TestProviderConfigID" href="#TestProviderConfigID">func TestProviderConfigID(t *testing.T)</a>

```
searchKey: saml.TestProviderConfigID
```

```Go
func TestProviderConfigID(t *testing.T)
```

### <a id="newSAMLIDPServer" href="#newSAMLIDPServer">func newSAMLIDPServer(t *testing.T) (*httptest.Server, *samlidp.Server)</a>

```
searchKey: saml.newSAMLIDPServer
```

```Go
func newSAMLIDPServer(t *testing.T) (*httptest.Server, *samlidp.Server)
```

newSAMLIDPServer returns a new running SAML IDP server. It is the caller's responsibility to call Close(). 

### <a id="TestMiddleware" href="#TestMiddleware">func TestMiddleware(t *testing.T)</a>

```
searchKey: saml.TestMiddleware
```

```Go
func TestMiddleware(t *testing.T)
```

### <a id="unexpiredCookies" href="#unexpiredCookies">func unexpiredCookies(resp *http.Response) (cookies []*http.Cookie)</a>

```
searchKey: saml.unexpiredCookies
```

```Go
func unexpiredCookies(resp *http.Response) (cookies []*http.Cookie)
```

unexpiredCookies returns the list of unexpired cookies set by the response 

### <a id="TestReadAuthnResponse" href="#TestReadAuthnResponse">func TestReadAuthnResponse(t *testing.T)</a>

```
searchKey: saml.TestReadAuthnResponse
```

```Go
func TestReadAuthnResponse(t *testing.T)
```

