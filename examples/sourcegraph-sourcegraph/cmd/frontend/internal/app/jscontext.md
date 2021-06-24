# Package jscontext

Package jscontext contains functionality for information we pass down into the JS webapp. 

## Index

* [Variables](#var)
    * [var BillingPublishableKey](#BillingPublishableKey)
    * [var isBotPat](#isBotPat)
* [Types](#type)
    * [type JSContext struct](#JSContext)
        * [func NewJSContextFromRequest(req *http.Request) JSContext](#NewJSContextFromRequest)
    * [type authProviderInfo struct](#authProviderInfo)
* [Functions](#func)
    * [func TestIsBot(t *testing.T)](#TestIsBot)
    * [func isBot(userAgent string) bool](#isBot)
    * [func likelyDockerOnMac() bool](#likelyDockerOnMac)
    * [func publicSiteConfiguration() schema.SiteConfiguration](#publicSiteConfiguration)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="BillingPublishableKey" href="#BillingPublishableKey">var BillingPublishableKey</a>

```
searchKey: jscontext.BillingPublishableKey
tags: [variable string]
```

```Go
var BillingPublishableKey string
```

BillingPublishableKey is the publishable (non-secret) API key for the billing system, if any. 

### <a id="isBotPat" href="#isBotPat">var isBotPat</a>

```
searchKey: jscontext.isBotPat
tags: [variable struct private]
```

```Go
var isBotPat = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="JSContext" href="#JSContext">type JSContext struct</a>

```
searchKey: jscontext.JSContext
tags: [struct]
```

```Go
type JSContext struct {
	AppRoot        string            `json:"appRoot,omitempty"`
	ExternalURL    string            `json:"externalURL,omitempty"`
	XHRHeaders     map[string]string `json:"xhrHeaders"`
	CSRFToken      string            `json:"csrfToken"`
	UserAgentIsBot bool              `json:"userAgentIsBot"`
	AssetsRoot     string            `json:"assetsRoot"`
	Version        string            `json:"version"`

	IsAuthenticatedUser bool `json:"isAuthenticatedUser"`

	SentryDSN     *string `json:"sentryDSN"`
	SiteID        string  `json:"siteID"`
	SiteGQLID     string  `json:"siteGQLID"`
	Debug         bool    `json:"debug"`
	NeedsSiteInit bool    `json:"needsSiteInit"`
	EmailEnabled  bool    `json:"emailEnabled"`

	Site              schema.SiteConfiguration `json:"site"` // public subset of site configuration
	LikelyDockerOnMac bool                     `json:"likelyDockerOnMac"`
	NeedServerRestart bool                     `json:"needServerRestart"`
	DeployType        string                   `json:"deployType"`

	SourcegraphDotComMode bool `json:"sourcegraphDotComMode"`

	BillingPublishableKey string `json:"billingPublishableKey,omitempty"`

	AccessTokensAllow conf.AccessTokAllow `json:"accessTokensAllow"`

	AllowSignup bool `json:"allowSignup"`

	ResetPasswordEnabled bool `json:"resetPasswordEnabled"`

	ExternalServicesUserMode string `json:"externalServicesUserMode"`

	AuthProviders []authProviderInfo `json:"authProviders"`

	Branding *schema.Branding `json:"branding"`

	BatchChangesEnabled bool `json:"batchChangesEnabled"`

	CodeIntelAutoIndexingEnabled bool `json:"codeIntelAutoIndexingEnabled"`

	ProductResearchPageEnabled bool `json:"productResearchPageEnabled"`

	ExperimentalFeatures schema.ExperimentalFeatures `json:"experimentalFeatures"`
}
```

JSContext is made available to JavaScript code via the "sourcegraph/app/context" module. 

🚨 SECURITY: This struct is sent to all users regardless of whether or not they are logged in, for example on an auth.public=false private server. Including secret fields here is OK if it is based on the user's authentication above, but do not include e.g. hard-coded secrets about the server instance here as they would be sent to anonymous users. 

#### <a id="NewJSContextFromRequest" href="#NewJSContextFromRequest">func NewJSContextFromRequest(req *http.Request) JSContext</a>

```
searchKey: jscontext.NewJSContextFromRequest
tags: [method]
```

```Go
func NewJSContextFromRequest(req *http.Request) JSContext
```

NewJSContextFromRequest populates a JSContext struct from the HTTP request. 

### <a id="authProviderInfo" href="#authProviderInfo">type authProviderInfo struct</a>

```
searchKey: jscontext.authProviderInfo
tags: [struct private]
```

```Go
type authProviderInfo struct {
	IsBuiltin         bool   `json:"isBuiltin"`
	DisplayName       string `json:"displayName"`
	ServiceType       string `json:"serviceType"`
	AuthenticationURL string `json:"authenticationURL"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestIsBot" href="#TestIsBot">func TestIsBot(t *testing.T)</a>

```
searchKey: jscontext.TestIsBot
tags: [method private test]
```

```Go
func TestIsBot(t *testing.T)
```

### <a id="isBot" href="#isBot">func isBot(userAgent string) bool</a>

```
searchKey: jscontext.isBot
tags: [method private]
```

```Go
func isBot(userAgent string) bool
```

### <a id="likelyDockerOnMac" href="#likelyDockerOnMac">func likelyDockerOnMac() bool</a>

```
searchKey: jscontext.likelyDockerOnMac
tags: [function private]
```

```Go
func likelyDockerOnMac() bool
```

### <a id="publicSiteConfiguration" href="#publicSiteConfiguration">func publicSiteConfiguration() schema.SiteConfiguration</a>

```
searchKey: jscontext.publicSiteConfiguration
tags: [function private]
```

```Go
func publicSiteConfiguration() schema.SiteConfiguration
```

publicSiteConfiguration is the subset of the site.schema.json site configuration that is necessary for the web app and is not sensitive/secret. 

