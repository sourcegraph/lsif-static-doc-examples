# Package userpasswd

Package userpasswd implements builtin username-password authentication and signup. 

## Index

* [Constants](#const)
    * [const providerType](#providerType)
* [Variables](#var)
    * [var resetPasswordEmailTemplates](#resetPasswordEmailTemplates)
    * [var setPasswordEmailTemplates](#setPasswordEmailTemplates)
* [Types](#type)
    * [type credentials struct](#credentials)
    * [type provider struct](#provider)
        * [func (provider) ConfigID() providers.ConfigID](#provider.ConfigID)
        * [func (p provider) Config() schema.AuthProviders](#provider.Config)
        * [func (p provider) Refresh(context.Context) error](#provider.Refresh)
        * [func (p provider) CachedInfo() *providers.Info](#provider.CachedInfo)
* [Functions](#func)
    * [func ResetPasswordEnabled() bool](#ResetPasswordEnabled)
    * [func getProviderConfig() (pc *schema.BuiltinAuthProvider, multiple bool)](#getProviderConfig)
    * [func handleEnabledCheck(w http.ResponseWriter) (handled bool)](#handleEnabledCheck)
    * [func init()](#init.config.go)
    * [func validateConfig(c conf.Unified) (problems conf.Problems)](#validateConfig)
    * [func init()](#init.config_watch.go)
    * [func HandleSignUp(w http.ResponseWriter, r *http.Request)](#HandleSignUp)
    * [func HandleSiteInit(w http.ResponseWriter, r *http.Request)](#HandleSiteInit)
    * [func checkEmailAbuse(ctx context.Context, addr string) (abused bool, reason string, err error)](#checkEmailAbuse)
    * [func handleSignUp(w http.ResponseWriter, r *http.Request, failIfNewUserIsNotInitialSiteAdmin bool)](#handleSignUp)
    * [func getByEmailOrUsername(ctx context.Context, emailOrUsername string) (*types.User, error)](#getByEmailOrUsername)
    * [func HandleSignIn(w http.ResponseWriter, r *http.Request)](#HandleSignIn)
    * [func HandleCheckUsernameTaken(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)](#HandleCheckUsernameTaken)
    * [func httpLogAndError(w http.ResponseWriter, msg string, code int, errArgs ...interface{})](#httpLogAndError)
    * [func HandleResetPasswordInit(w http.ResponseWriter, r *http.Request)](#HandleResetPasswordInit)
    * [func HandleSetPasswordEmail(ctx context.Context, id int32) (string, error)](#HandleSetPasswordEmail)
    * [func HandleResetPasswordCode(w http.ResponseWriter, r *http.Request)](#HandleResetPasswordCode)
    * [func handleNotAuthenticatedCheck(w http.ResponseWriter, r *http.Request) (handled bool)](#handleNotAuthenticatedCheck)
    * [func TestValidateCustom(t *testing.T)](#TestValidateCustom)
    * [func TestCheckEmailAbuse(t *testing.T)](#TestCheckEmailAbuse)
    * [func TestHandleSetPasswordEmail(t *testing.T)](#TestHandleSetPasswordEmail)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="providerType" href="#providerType">const providerType</a>

```
searchKey: userpasswd.providerType
tags: [private]
```

```Go
const providerType = "builtin"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="resetPasswordEmailTemplates" href="#resetPasswordEmailTemplates">var resetPasswordEmailTemplates</a>

```
searchKey: userpasswd.resetPasswordEmailTemplates
tags: [private]
```

```Go
var resetPasswordEmailTemplates = ...
```

### <a id="setPasswordEmailTemplates" href="#setPasswordEmailTemplates">var setPasswordEmailTemplates</a>

```
searchKey: userpasswd.setPasswordEmailTemplates
tags: [private]
```

```Go
var setPasswordEmailTemplates = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="credentials" href="#credentials">type credentials struct</a>

```
searchKey: userpasswd.credentials
tags: [private]
```

```Go
type credentials struct {
	Email           string `json:"email"`
	Username        string `json:"username"`
	Password        string `json:"password"`
	AnonymousUserID string `json:"anonymousUserId"`
	FirstSourceURL  string `json:"firstSourceUrl"`
}
```

### <a id="provider" href="#provider">type provider struct</a>

```
searchKey: userpasswd.provider
tags: [private]
```

```Go
type provider struct {
	c *schema.BuiltinAuthProvider
}
```

#### <a id="provider.ConfigID" href="#provider.ConfigID">func (provider) ConfigID() providers.ConfigID</a>

```
searchKey: userpasswd.provider.ConfigID
tags: [private]
```

```Go
func (provider) ConfigID() providers.ConfigID
```

ConfigID implements providers.Provider. 

#### <a id="provider.Config" href="#provider.Config">func (p provider) Config() schema.AuthProviders</a>

```
searchKey: userpasswd.provider.Config
tags: [private]
```

```Go
func (p provider) Config() schema.AuthProviders
```

Config implements providers.Provider. 

#### <a id="provider.Refresh" href="#provider.Refresh">func (p provider) Refresh(context.Context) error</a>

```
searchKey: userpasswd.provider.Refresh
tags: [private]
```

```Go
func (p provider) Refresh(context.Context) error
```

Refresh implements providers.Provider. 

#### <a id="provider.CachedInfo" href="#provider.CachedInfo">func (p provider) CachedInfo() *providers.Info</a>

```
searchKey: userpasswd.provider.CachedInfo
tags: [private]
```

```Go
func (p provider) CachedInfo() *providers.Info
```

CachedInfo implements providers.Provider. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ResetPasswordEnabled" href="#ResetPasswordEnabled">func ResetPasswordEnabled() bool</a>

```
searchKey: userpasswd.ResetPasswordEnabled
```

```Go
func ResetPasswordEnabled() bool
```

ResetPasswordEnabled reports whether the reset-password flow is enabled (per site config). 

### <a id="getProviderConfig" href="#getProviderConfig">func getProviderConfig() (pc *schema.BuiltinAuthProvider, multiple bool)</a>

```
searchKey: userpasswd.getProviderConfig
tags: [private]
```

```Go
func getProviderConfig() (pc *schema.BuiltinAuthProvider, multiple bool)
```

getProviderConfig returns the builtin auth provider config. At most 1 can be specified in site config; if there is more than 1, it returns multiple == true (which the caller should handle by returning an error and refusing to proceed with auth). 

### <a id="handleEnabledCheck" href="#handleEnabledCheck">func handleEnabledCheck(w http.ResponseWriter) (handled bool)</a>

```
searchKey: userpasswd.handleEnabledCheck
tags: [private]
```

```Go
func handleEnabledCheck(w http.ResponseWriter) (handled bool)
```

### <a id="init.config.go" href="#init.config.go">func init()</a>

```
searchKey: userpasswd.init
tags: [private]
```

```Go
func init()
```

### <a id="validateConfig" href="#validateConfig">func validateConfig(c conf.Unified) (problems conf.Problems)</a>

```
searchKey: userpasswd.validateConfig
tags: [private]
```

```Go
func validateConfig(c conf.Unified) (problems conf.Problems)
```

### <a id="init.config_watch.go" href="#init.config_watch.go">func init()</a>

```
searchKey: userpasswd.init
tags: [private]
```

```Go
func init()
```

Watch for configuration changes related to the builtin auth provider. 

### <a id="HandleSignUp" href="#HandleSignUp">func HandleSignUp(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: userpasswd.HandleSignUp
```

```Go
func HandleSignUp(w http.ResponseWriter, r *http.Request)
```

HandleSignUp handles submission of the user signup form. 

### <a id="HandleSiteInit" href="#HandleSiteInit">func HandleSiteInit(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: userpasswd.HandleSiteInit
```

```Go
func HandleSiteInit(w http.ResponseWriter, r *http.Request)
```

HandleSiteInit handles submission of the site initialization form, where the initial site admin user is created. 

### <a id="checkEmailAbuse" href="#checkEmailAbuse">func checkEmailAbuse(ctx context.Context, addr string) (abused bool, reason string, err error)</a>

```
searchKey: userpasswd.checkEmailAbuse
tags: [private]
```

```Go
func checkEmailAbuse(ctx context.Context, addr string) (abused bool, reason string, err error)
```

checkEmailAbuse performs abuse prevention checks to prevent email abuse, i.e. users using emails of other people whom they want to annoy. 

### <a id="handleSignUp" href="#handleSignUp">func handleSignUp(w http.ResponseWriter, r *http.Request, failIfNewUserIsNotInitialSiteAdmin bool)</a>

```
searchKey: userpasswd.handleSignUp
tags: [private]
```

```Go
func handleSignUp(w http.ResponseWriter, r *http.Request, failIfNewUserIsNotInitialSiteAdmin bool)
```

doServeSignUp is called to create a new user account. It is called for the normal user signup process (where a non-admin user is created) and for the site initialization process (where the initial site admin user account is created). 

🚨 SECURITY: Any change to this function could introduce security exploits and/or break sign up / initial admin account creation. Be careful. 

### <a id="getByEmailOrUsername" href="#getByEmailOrUsername">func getByEmailOrUsername(ctx context.Context, emailOrUsername string) (*types.User, error)</a>

```
searchKey: userpasswd.getByEmailOrUsername
tags: [private]
```

```Go
func getByEmailOrUsername(ctx context.Context, emailOrUsername string) (*types.User, error)
```

### <a id="HandleSignIn" href="#HandleSignIn">func HandleSignIn(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: userpasswd.HandleSignIn
```

```Go
func HandleSignIn(w http.ResponseWriter, r *http.Request)
```

HandleSignIn accepts a POST containing username-password credentials and authenticates the current session if the credentials are valid. 

### <a id="HandleCheckUsernameTaken" href="#HandleCheckUsernameTaken">func HandleCheckUsernameTaken(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: userpasswd.HandleCheckUsernameTaken
```

```Go
func HandleCheckUsernameTaken(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)
```

Check availability of username for signup form 

### <a id="httpLogAndError" href="#httpLogAndError">func httpLogAndError(w http.ResponseWriter, msg string, code int, errArgs ...interface{})</a>

```
searchKey: userpasswd.httpLogAndError
tags: [private]
```

```Go
func httpLogAndError(w http.ResponseWriter, msg string, code int, errArgs ...interface{})
```

### <a id="HandleResetPasswordInit" href="#HandleResetPasswordInit">func HandleResetPasswordInit(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: userpasswd.HandleResetPasswordInit
```

```Go
func HandleResetPasswordInit(w http.ResponseWriter, r *http.Request)
```

HandleResetPasswordInit initiates the builtin-auth password reset flow by sending a password-reset email. 

### <a id="HandleSetPasswordEmail" href="#HandleSetPasswordEmail">func HandleSetPasswordEmail(ctx context.Context, id int32) (string, error)</a>

```
searchKey: userpasswd.HandleSetPasswordEmail
```

```Go
func HandleSetPasswordEmail(ctx context.Context, id int32) (string, error)
```

HandleSetPasswordEmail sends the password reset email directly to the user for users created by site admins. 

### <a id="HandleResetPasswordCode" href="#HandleResetPasswordCode">func HandleResetPasswordCode(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: userpasswd.HandleResetPasswordCode
```

```Go
func HandleResetPasswordCode(w http.ResponseWriter, r *http.Request)
```

HandleResetPasswordCode resets the password if the correct code is provided. 

### <a id="handleNotAuthenticatedCheck" href="#handleNotAuthenticatedCheck">func handleNotAuthenticatedCheck(w http.ResponseWriter, r *http.Request) (handled bool)</a>

```
searchKey: userpasswd.handleNotAuthenticatedCheck
tags: [private]
```

```Go
func handleNotAuthenticatedCheck(w http.ResponseWriter, r *http.Request) (handled bool)
```

### <a id="TestValidateCustom" href="#TestValidateCustom">func TestValidateCustom(t *testing.T)</a>

```
searchKey: userpasswd.TestValidateCustom
tags: [private]
```

```Go
func TestValidateCustom(t *testing.T)
```

### <a id="TestCheckEmailAbuse" href="#TestCheckEmailAbuse">func TestCheckEmailAbuse(t *testing.T)</a>

```
searchKey: userpasswd.TestCheckEmailAbuse
tags: [private]
```

```Go
func TestCheckEmailAbuse(t *testing.T)
```

### <a id="TestHandleSetPasswordEmail" href="#TestHandleSetPasswordEmail">func TestHandleSetPasswordEmail(t *testing.T)</a>

```
searchKey: userpasswd.TestHandleSetPasswordEmail
tags: [private]
```

```Go
func TestHandleSetPasswordEmail(t *testing.T)
```

