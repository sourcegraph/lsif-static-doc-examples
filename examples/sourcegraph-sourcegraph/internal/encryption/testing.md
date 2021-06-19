# Package testing

## Index

* [Types](#type)
    * [type TestKey struct{}](#TestKey)
        * [func (k TestKey) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)](#TestKey.Encrypt)
        * [func (k TestKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)](#TestKey.Decrypt)
        * [func (k TestKey) Version(ctx context.Context) (encryption.KeyVersion, error)](#TestKey.Version)
    * [type BadKey struct](#BadKey)
        * [func (k *BadKey) Encrypt(context.Context, []byte) ([]byte, error)](#BadKey.Encrypt)
        * [func (k *BadKey) Decrypt(context.Context, []byte) (*encryption.Secret, error)](#BadKey.Decrypt)
        * [func (k *BadKey) Version(context.Context) (encryption.KeyVersion, error)](#BadKey.Version)
    * [type TransparentKey struct](#TransparentKey)
        * [func NewTransparentKey(t *testing.T) *TransparentKey](#NewTransparentKey)
        * [func (dec *TransparentKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)](#TransparentKey.Decrypt)
        * [func (dec *TransparentKey) Encrypt(ctx context.Context, value []byte) ([]byte, error)](#TransparentKey.Encrypt)
        * [func (dec *TransparentKey) Version(ctx context.Context) (encryption.KeyVersion, error)](#TransparentKey.Version)


## <a id="type" href="#type">Types</a>

### <a id="TestKey" href="#TestKey">type TestKey struct{}</a>

```
searchKey: testing.TestKey
tags: [exported]
```

```Go
type TestKey struct{}
```

TestKey is an encryption.Key that just base64 encodes the plaintext, to make sure the data is actually transformed, so as to be unreadable by misconfigured Stores, but doesn't do any encryption. 

#### <a id="TestKey.Encrypt" href="#TestKey.Encrypt">func (k TestKey) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)</a>

```
searchKey: testing.TestKey.Encrypt
tags: [exported]
```

```Go
func (k TestKey) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)
```

#### <a id="TestKey.Decrypt" href="#TestKey.Decrypt">func (k TestKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)</a>

```
searchKey: testing.TestKey.Decrypt
tags: [exported]
```

```Go
func (k TestKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)
```

#### <a id="TestKey.Version" href="#TestKey.Version">func (k TestKey) Version(ctx context.Context) (encryption.KeyVersion, error)</a>

```
searchKey: testing.TestKey.Version
tags: [exported]
```

```Go
func (k TestKey) Version(ctx context.Context) (encryption.KeyVersion, error)
```

### <a id="BadKey" href="#BadKey">type BadKey struct</a>

```
searchKey: testing.BadKey
tags: [exported]
```

```Go
type BadKey struct{ Err error }
```

BadKey is an encryption.Key that always returns an error when any of its methods are invoked. 

#### <a id="BadKey.Encrypt" href="#BadKey.Encrypt">func (k *BadKey) Encrypt(context.Context, []byte) ([]byte, error)</a>

```
searchKey: testing.BadKey.Encrypt
tags: [exported]
```

```Go
func (k *BadKey) Encrypt(context.Context, []byte) ([]byte, error)
```

#### <a id="BadKey.Decrypt" href="#BadKey.Decrypt">func (k *BadKey) Decrypt(context.Context, []byte) (*encryption.Secret, error)</a>

```
searchKey: testing.BadKey.Decrypt
tags: [exported]
```

```Go
func (k *BadKey) Decrypt(context.Context, []byte) (*encryption.Secret, error)
```

#### <a id="BadKey.Version" href="#BadKey.Version">func (k *BadKey) Version(context.Context) (encryption.KeyVersion, error)</a>

```
searchKey: testing.BadKey.Version
tags: [exported]
```

```Go
func (k *BadKey) Version(context.Context) (encryption.KeyVersion, error)
```

### <a id="TransparentKey" href="#TransparentKey">type TransparentKey struct</a>

```
searchKey: testing.TransparentKey
tags: [exported]
```

```Go
type TransparentKey struct{ called int }
```

TransparentKey is a key that performs no encryption or decryption, but errors if not called within a test. This allows mocking the decrypter when it's only important that it's called, and not what it actually does. 

#### <a id="NewTransparentKey" href="#NewTransparentKey">func NewTransparentKey(t *testing.T) *TransparentKey</a>

```
searchKey: testing.NewTransparentKey
tags: [exported]
```

```Go
func NewTransparentKey(t *testing.T) *TransparentKey
```

#### <a id="TransparentKey.Decrypt" href="#TransparentKey.Decrypt">func (dec *TransparentKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)</a>

```
searchKey: testing.TransparentKey.Decrypt
tags: [exported]
```

```Go
func (dec *TransparentKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)
```

#### <a id="TransparentKey.Encrypt" href="#TransparentKey.Encrypt">func (dec *TransparentKey) Encrypt(ctx context.Context, value []byte) ([]byte, error)</a>

```
searchKey: testing.TransparentKey.Encrypt
tags: [exported]
```

```Go
func (dec *TransparentKey) Encrypt(ctx context.Context, value []byte) ([]byte, error)
```

#### <a id="TransparentKey.Version" href="#TransparentKey.Version">func (dec *TransparentKey) Version(ctx context.Context) (encryption.KeyVersion, error)</a>

```
searchKey: testing.TransparentKey.Version
tags: [exported]
```

```Go
func (dec *TransparentKey) Version(ctx context.Context) (encryption.KeyVersion, error)
```

