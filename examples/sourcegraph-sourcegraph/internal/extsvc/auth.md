# Package auth

Package auth provides the Authenticator interface, which can be used to add authentication data to an outbound HTTP request, and concrete implementations for the commonly used authentication types. 

## Index

* [Types](#type)
    * [type Authenticator interface](#Authenticator)
    * [type AuthenticatorWithSSH interface](#AuthenticatorWithSSH)
    * [type BasicAuth struct](#BasicAuth)
        * [func (basic *BasicAuth) Authenticate(req *http.Request) error](#BasicAuth.Authenticate)
        * [func (basic *BasicAuth) Hash() string](#BasicAuth.Hash)
    * [type BasicAuthWithSSH struct](#BasicAuthWithSSH)
        * [func (basic *BasicAuthWithSSH) Hash() string](#BasicAuthWithSSH.Hash)
        * [func (basic *BasicAuthWithSSH) SSHPrivateKey() (privateKey, passphrase string)](#BasicAuthWithSSH.SSHPrivateKey)
        * [func (basic *BasicAuthWithSSH) SSHPublicKey() string](#BasicAuthWithSSH.SSHPublicKey)
    * [type OAuthBearerToken struct](#OAuthBearerToken)
        * [func (token *OAuthBearerToken) Authenticate(req *http.Request) error](#OAuthBearerToken.Authenticate)
        * [func (token *OAuthBearerToken) Hash() string](#OAuthBearerToken.Hash)
    * [type OAuthBearerTokenWithSSH struct](#OAuthBearerTokenWithSSH)
        * [func (token *OAuthBearerTokenWithSSH) Hash() string](#OAuthBearerTokenWithSSH.Hash)
        * [func (token *OAuthBearerTokenWithSSH) SSHPrivateKey() (privateKey, passphrase string)](#OAuthBearerTokenWithSSH.SSHPrivateKey)
        * [func (token *OAuthBearerTokenWithSSH) SSHPublicKey() string](#OAuthBearerTokenWithSSH.SSHPublicKey)
    * [type OAuthClient struct](#OAuthClient)
        * [func newOAuthClient(token, secret string) *OAuthClient](#newOAuthClient)
        * [func (c *OAuthClient) Authenticate(req *http.Request) error](#OAuthClient.Authenticate)
        * [func (c *OAuthClient) Hash() string](#OAuthClient.Hash)
* [Functions](#func)
    * [func TestBasicAuth(t *testing.T)](#TestBasicAuth)
    * [func TestOAuthBearerToken(t *testing.T)](#TestOAuthBearerToken)
    * [func TestOAuthClient(t *testing.T)](#TestOAuthClient)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Authenticator" href="#Authenticator">type Authenticator interface</a>

```
searchKey: auth.Authenticator
tags: [interface]
```

```Go
type Authenticator interface {
	// Authenticate mutates the given request to include authentication
	// representing this value. In general, this will take the form of adding
	// headers.
	Authenticate(*http.Request) error

	// Hash uniquely identifies the authenticator for use in internal caching.
	// This value must use a cryptographic hash (for example, SHA-256).
	Hash() string
}
```

Authenticator instances mutate an outbound request to add whatever headers or other modifications are required to authenticate using the concrete type represented by the Authenticator. (For example, an OAuth token, or a username and password combination.) 

Note that, while Authenticate provides generic functionality, the concrete types should be careful to provide some method for external services to retrieve the values within so that unusual authentication flows can be supported. 

### <a id="AuthenticatorWithSSH" href="#AuthenticatorWithSSH">type AuthenticatorWithSSH interface</a>

```
searchKey: auth.AuthenticatorWithSSH
tags: [interface]
```

```Go
type AuthenticatorWithSSH interface {
	Authenticator

	// SSHPrivateKey returns an RSA private key, and the passphrase securing it.
	SSHPrivateKey() (privateKey string, passphrase string)
	// SSHPublicKey returns the public key counterpart to the private key in OpenSSH
	// authorized_keys file format. This is usually accepted by code hosts to
	// allow access to git over SSH.
	SSHPublicKey() (publicKey string)
}
```

AuthenticatorWithSSH wraps the Authenticator interface and augments it by additional methods to authenticate over SSH with this credential, in addition to the enclosed Authenticator. This can be used for a credential that needs to access an HTTP API, and git over SSH, for example. 

### <a id="BasicAuth" href="#BasicAuth">type BasicAuth struct</a>

```
searchKey: auth.BasicAuth
tags: [struct]
```

```Go
type BasicAuth struct {
	Username string
	Password string
}
```

BasicAuth implements HTTP Basic Authentication for extsvc clients. 

#### <a id="BasicAuth.Authenticate" href="#BasicAuth.Authenticate">func (basic *BasicAuth) Authenticate(req *http.Request) error</a>

```
searchKey: auth.BasicAuth.Authenticate
tags: [method]
```

```Go
func (basic *BasicAuth) Authenticate(req *http.Request) error
```

#### <a id="BasicAuth.Hash" href="#BasicAuth.Hash">func (basic *BasicAuth) Hash() string</a>

```
searchKey: auth.BasicAuth.Hash
tags: [function]
```

```Go
func (basic *BasicAuth) Hash() string
```

### <a id="BasicAuthWithSSH" href="#BasicAuthWithSSH">type BasicAuthWithSSH struct</a>

```
searchKey: auth.BasicAuthWithSSH
tags: [struct]
```

```Go
type BasicAuthWithSSH struct {
	BasicAuth

	PrivateKey string
	PublicKey  string
	Passphrase string
}
```

BasicAuthWithSSH implements HTTP Basic Authentication for extsvc clients and holds an additional RSA keypair. 

#### <a id="BasicAuthWithSSH.Hash" href="#BasicAuthWithSSH.Hash">func (basic *BasicAuthWithSSH) Hash() string</a>

```
searchKey: auth.BasicAuthWithSSH.Hash
tags: [function]
```

```Go
func (basic *BasicAuthWithSSH) Hash() string
```

#### <a id="BasicAuthWithSSH.SSHPrivateKey" href="#BasicAuthWithSSH.SSHPrivateKey">func (basic *BasicAuthWithSSH) SSHPrivateKey() (privateKey, passphrase string)</a>

```
searchKey: auth.BasicAuthWithSSH.SSHPrivateKey
tags: [function]
```

```Go
func (basic *BasicAuthWithSSH) SSHPrivateKey() (privateKey, passphrase string)
```

#### <a id="BasicAuthWithSSH.SSHPublicKey" href="#BasicAuthWithSSH.SSHPublicKey">func (basic *BasicAuthWithSSH) SSHPublicKey() string</a>

```
searchKey: auth.BasicAuthWithSSH.SSHPublicKey
tags: [function]
```

```Go
func (basic *BasicAuthWithSSH) SSHPublicKey() string
```

### <a id="OAuthBearerToken" href="#OAuthBearerToken">type OAuthBearerToken struct</a>

```
searchKey: auth.OAuthBearerToken
tags: [struct]
```

```Go
type OAuthBearerToken struct {
	Token string
}
```

OAuthBearerToken implements OAuth Bearer Token authentication for extsvc clients. 

#### <a id="OAuthBearerToken.Authenticate" href="#OAuthBearerToken.Authenticate">func (token *OAuthBearerToken) Authenticate(req *http.Request) error</a>

```
searchKey: auth.OAuthBearerToken.Authenticate
tags: [method]
```

```Go
func (token *OAuthBearerToken) Authenticate(req *http.Request) error
```

#### <a id="OAuthBearerToken.Hash" href="#OAuthBearerToken.Hash">func (token *OAuthBearerToken) Hash() string</a>

```
searchKey: auth.OAuthBearerToken.Hash
tags: [function]
```

```Go
func (token *OAuthBearerToken) Hash() string
```

### <a id="OAuthBearerTokenWithSSH" href="#OAuthBearerTokenWithSSH">type OAuthBearerTokenWithSSH struct</a>

```
searchKey: auth.OAuthBearerTokenWithSSH
tags: [struct]
```

```Go
type OAuthBearerTokenWithSSH struct {
	OAuthBearerToken

	PrivateKey string
	PublicKey  string
	Passphrase string
}
```

OAuthBearerTokenWithSSH implements OAuth Bearer Token authentication for extsvc clients and holds an additional RSA keypair. 

#### <a id="OAuthBearerTokenWithSSH.Hash" href="#OAuthBearerTokenWithSSH.Hash">func (token *OAuthBearerTokenWithSSH) Hash() string</a>

```
searchKey: auth.OAuthBearerTokenWithSSH.Hash
tags: [function]
```

```Go
func (token *OAuthBearerTokenWithSSH) Hash() string
```

#### <a id="OAuthBearerTokenWithSSH.SSHPrivateKey" href="#OAuthBearerTokenWithSSH.SSHPrivateKey">func (token *OAuthBearerTokenWithSSH) SSHPrivateKey() (privateKey, passphrase string)</a>

```
searchKey: auth.OAuthBearerTokenWithSSH.SSHPrivateKey
tags: [function]
```

```Go
func (token *OAuthBearerTokenWithSSH) SSHPrivateKey() (privateKey, passphrase string)
```

#### <a id="OAuthBearerTokenWithSSH.SSHPublicKey" href="#OAuthBearerTokenWithSSH.SSHPublicKey">func (token *OAuthBearerTokenWithSSH) SSHPublicKey() string</a>

```
searchKey: auth.OAuthBearerTokenWithSSH.SSHPublicKey
tags: [function]
```

```Go
func (token *OAuthBearerTokenWithSSH) SSHPublicKey() string
```

### <a id="OAuthClient" href="#OAuthClient">type OAuthClient struct</a>

```
searchKey: auth.OAuthClient
tags: [struct]
```

```Go
type OAuthClient struct{ *oauth.Client }
```

OAuthClient implements OAuth 1 signature authentication for extsvc implementations. 

#### <a id="newOAuthClient" href="#newOAuthClient">func newOAuthClient(token, secret string) *OAuthClient</a>

```
searchKey: auth.newOAuthClient
tags: [method private]
```

```Go
func newOAuthClient(token, secret string) *OAuthClient
```

#### <a id="OAuthClient.Authenticate" href="#OAuthClient.Authenticate">func (c *OAuthClient) Authenticate(req *http.Request) error</a>

```
searchKey: auth.OAuthClient.Authenticate
tags: [method]
```

```Go
func (c *OAuthClient) Authenticate(req *http.Request) error
```

#### <a id="OAuthClient.Hash" href="#OAuthClient.Hash">func (c *OAuthClient) Hash() string</a>

```
searchKey: auth.OAuthClient.Hash
tags: [function]
```

```Go
func (c *OAuthClient) Hash() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestBasicAuth" href="#TestBasicAuth">func TestBasicAuth(t *testing.T)</a>

```
searchKey: auth.TestBasicAuth
tags: [method private test]
```

```Go
func TestBasicAuth(t *testing.T)
```

### <a id="TestOAuthBearerToken" href="#TestOAuthBearerToken">func TestOAuthBearerToken(t *testing.T)</a>

```
searchKey: auth.TestOAuthBearerToken
tags: [method private test]
```

```Go
func TestOAuthBearerToken(t *testing.T)
```

### <a id="TestOAuthClient" href="#TestOAuthClient">func TestOAuthClient(t *testing.T)</a>

```
searchKey: auth.TestOAuthClient
tags: [method private test]
```

```Go
func TestOAuthClient(t *testing.T)
```

