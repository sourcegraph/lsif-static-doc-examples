# Package keyring

## Index

* [Variables](#var)
    * [var defaultRing](#defaultRing)
    * [var mu](#mu)
* [Types](#type)
    * [type Ring struct](#Ring)
        * [func Default() Ring](#Default)
        * [func NewRing(ctx context.Context, keyConfig *schema.EncryptionKeys) (*Ring, error)](#NewRing)
* [Functions](#func)
    * [func Init(ctx context.Context) error](#Init)
    * [func MockDefault(r Ring)](#MockDefault)
    * [func NewKey(ctx context.Context, k *schema.EncryptionKey, config *schema.EncryptionKeys) (encryption.Key, error)](#NewKey)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="defaultRing" href="#defaultRing">var defaultRing</a>

```
searchKey: keyring.defaultRing
tags: [variable struct private]
```

```Go
var defaultRing Ring
```

### <a id="mu" href="#mu">var mu</a>

```
searchKey: keyring.mu
tags: [variable struct private]
```

```Go
var mu sync.RWMutex
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Ring" href="#Ring">type Ring struct</a>

```
searchKey: keyring.Ring
tags: [struct]
```

```Go
type Ring struct {
	BatchChangesCredentialKey encryption.Key
	ExternalServiceKey        encryption.Key
	UserExternalAccountKey    encryption.Key
}
```

#### <a id="Default" href="#Default">func Default() Ring</a>

```
searchKey: keyring.Default
tags: [function]
```

```Go
func Default() Ring
```

Default returns the default keyring, if you can avoid using this from arbitrary points in your code, please do! we would rather inject the individual keys as dependencies when initialised from main(), but if that's impractical it's fine to use this. 

#### <a id="NewRing" href="#NewRing">func NewRing(ctx context.Context, keyConfig *schema.EncryptionKeys) (*Ring, error)</a>

```
searchKey: keyring.NewRing
tags: [function]
```

```Go
func NewRing(ctx context.Context, keyConfig *schema.EncryptionKeys) (*Ring, error)
```

NewRing creates a keyring.Ring containing all the keys configured in site config 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Init" href="#Init">func Init(ctx context.Context) error</a>

```
searchKey: keyring.Init
tags: [function]
```

```Go
func Init(ctx context.Context) error
```

### <a id="MockDefault" href="#MockDefault">func MockDefault(r Ring)</a>

```
searchKey: keyring.MockDefault
tags: [function]
```

```Go
func MockDefault(r Ring)
```

MockDefault overrides the default keyring. Note: This function is defined for testing purpose. Use Init to correctly setup a keyring. 

### <a id="NewKey" href="#NewKey">func NewKey(ctx context.Context, k *schema.EncryptionKey, config *schema.EncryptionKeys) (encryption.Key, error)</a>

```
searchKey: keyring.NewKey
tags: [function]
```

```Go
func NewKey(ctx context.Context, k *schema.EncryptionKey, config *schema.EncryptionKeys) (encryption.Key, error)
```

