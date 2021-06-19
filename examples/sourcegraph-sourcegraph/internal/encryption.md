# Package encryption

## Index

* Subpages
  * [internal/encryption/awskms](encryption/awskms.md)
  * [internal/encryption/cache](encryption/cache.md)
  * [internal/encryption/cloudkms](encryption/cloudkms.md)
  * [internal/encryption/keyring](encryption/keyring.md)
  * [internal/encryption/mounted](encryption/mounted.md)
  * [internal/encryption/testing](encryption/testing.md)
* [Variables](#var)
    * [var MockGenerateRSAKey](#MockGenerateRSAKey)
* [Types](#type)
    * [type Key interface](#Key)
    * [type KeyVersion struct](#KeyVersion)
        * [func (v KeyVersion) JSON() string](#KeyVersion.JSON)
    * [type Encrypter interface](#Encrypter)
    * [type Decrypter interface](#Decrypter)
    * [type Secret struct](#Secret)
        * [func NewSecret(v string) Secret](#NewSecret)
        * [func (s Secret) String() string](#Secret.String)
        * [func (s Secret) Secret() string](#Secret.Secret)
        * [func (s Secret) MarshalJSON() ([]byte, error)](#Secret.MarshalJSON)
    * [type NoopKey struct{}](#NoopKey)
        * [func (k *NoopKey) Version(ctx context.Context) (KeyVersion, error)](#NoopKey.Version)
        * [func (k *NoopKey) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)](#NoopKey.Encrypt)
        * [func (k *NoopKey) Decrypt(ctx context.Context, ciphertext []byte) (*Secret, error)](#NoopKey.Decrypt)
    * [type RSAKey struct](#RSAKey)
        * [func GenerateRSAKey() (key *RSAKey, err error)](#GenerateRSAKey)
* [Functions](#func)
    * [func TestGenerateKey(t *testing.T)](#TestGenerateKey)


## <a id="var" href="#var">Variables</a>

### <a id="MockGenerateRSAKey" href="#MockGenerateRSAKey">var MockGenerateRSAKey</a>

```
searchKey: encryption.MockGenerateRSAKey
tags: [exported]
```

```Go
var MockGenerateRSAKey func() (key *RSAKey, err error) = nil
```

MockGenerateRSAKey can be used in tests to speed up key generation. 

## <a id="type" href="#type">Types</a>

### <a id="Key" href="#Key">type Key interface</a>

```
searchKey: encryption.Key
tags: [exported]
```

```Go
type Key interface {
	Encrypter
	Decrypter

	// Version returns info containing to concretely identify
	// the underlying key, eg: key type, name, & version.
	Version(ctx context.Context) (KeyVersion, error)
}
```

Key combines the Encrypter & Decrypter interfaces. 

### <a id="KeyVersion" href="#KeyVersion">type KeyVersion struct</a>

```
searchKey: encryption.KeyVersion
tags: [exported]
```

```Go
type KeyVersion struct {
	// TODO: generate this as an enum from JSONSchema
	Type    string
	Name    string
	Version string
}
```

#### <a id="KeyVersion.JSON" href="#KeyVersion.JSON">func (v KeyVersion) JSON() string</a>

```
searchKey: encryption.KeyVersion.JSON
tags: [exported]
```

```Go
func (v KeyVersion) JSON() string
```

### <a id="Encrypter" href="#Encrypter">type Encrypter interface</a>

```
searchKey: encryption.Encrypter
tags: [exported]
```

```Go
type Encrypter interface {
	Encrypt(ctx context.Context, value []byte) ([]byte, error)
}
```

Encrypter is anything that can encrypt a value 

### <a id="Decrypter" href="#Decrypter">type Decrypter interface</a>

```
searchKey: encryption.Decrypter
tags: [exported]
```

```Go
type Decrypter interface {
	Decrypt(ctx context.Context, cipherText []byte) (*Secret, error)
}
```

Decrypter is anything that can decrypt a value 

### <a id="Secret" href="#Secret">type Secret struct</a>

```
searchKey: encryption.Secret
tags: [exported]
```

```Go
type Secret struct {
	value string
}
```

Secret is a utility type to make it harder to accidentally leak secret values in logs. The actual value is unexported inside a struct, making harder to leak via reflection, the string value is only ever returned on explicit Secret() calls, meaning we can statically analyse secret usage and statically detect leaks. 

#### <a id="NewSecret" href="#NewSecret">func NewSecret(v string) Secret</a>

```
searchKey: encryption.NewSecret
tags: [exported]
```

```Go
func NewSecret(v string) Secret
```

#### <a id="Secret.String" href="#Secret.String">func (s Secret) String() string</a>

```
searchKey: encryption.Secret.String
tags: [exported]
```

```Go
func (s Secret) String() string
```

String implements stringer, obfuscating the value 

#### <a id="Secret.Secret" href="#Secret.Secret">func (s Secret) Secret() string</a>

```
searchKey: encryption.Secret.Secret
tags: [exported]
```

```Go
func (s Secret) Secret() string
```

Secret returns the unobfuscated value 

#### <a id="Secret.MarshalJSON" href="#Secret.MarshalJSON">func (s Secret) MarshalJSON() ([]byte, error)</a>

```
searchKey: encryption.Secret.MarshalJSON
tags: [exported]
```

```Go
func (s Secret) MarshalJSON() ([]byte, error)
```

MarshalJSON overrides the default JSON marshaling implementation, obfuscating the value in any marshaled JSON 

### <a id="NoopKey" href="#NoopKey">type NoopKey struct{}</a>

```
searchKey: encryption.NoopKey
tags: [exported]
```

```Go
type NoopKey struct{}
```

#### <a id="NoopKey.Version" href="#NoopKey.Version">func (k *NoopKey) Version(ctx context.Context) (KeyVersion, error)</a>

```
searchKey: encryption.NoopKey.Version
tags: [exported]
```

```Go
func (k *NoopKey) Version(ctx context.Context) (KeyVersion, error)
```

#### <a id="NoopKey.Encrypt" href="#NoopKey.Encrypt">func (k *NoopKey) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)</a>

```
searchKey: encryption.NoopKey.Encrypt
tags: [exported]
```

```Go
func (k *NoopKey) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)
```

#### <a id="NoopKey.Decrypt" href="#NoopKey.Decrypt">func (k *NoopKey) Decrypt(ctx context.Context, ciphertext []byte) (*Secret, error)</a>

```
searchKey: encryption.NoopKey.Decrypt
tags: [exported]
```

```Go
func (k *NoopKey) Decrypt(ctx context.Context, ciphertext []byte) (*Secret, error)
```

### <a id="RSAKey" href="#RSAKey">type RSAKey struct</a>

```
searchKey: encryption.RSAKey
tags: [exported]
```

```Go
type RSAKey struct {
	PrivateKey string
	Passphrase string
	PublicKey  string
}
```

#### <a id="GenerateRSAKey" href="#GenerateRSAKey">func GenerateRSAKey() (key *RSAKey, err error)</a>

```
searchKey: encryption.GenerateRSAKey
tags: [exported]
```

```Go
func GenerateRSAKey() (key *RSAKey, err error)
```

GenerateRSAKey generates an RSA key pair and encrypts the private key with a passphrase. 

## <a id="func" href="#func">Functions</a>

### <a id="TestGenerateKey" href="#TestGenerateKey">func TestGenerateKey(t *testing.T)</a>

```
searchKey: encryption.TestGenerateKey
```

```Go
func TestGenerateKey(t *testing.T)
```

