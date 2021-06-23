# Package cloudkms

## Index

* [Types](#type)
    * [type Key struct](#Key)
        * [func (k *Key) Version(ctx context.Context) (encryption.KeyVersion, error)](#Key.Version)
        * [func (k *Key) Decrypt(ctx context.Context, cipherText []byte) (*encryption.Secret, error)](#Key.Decrypt)
        * [func (k *Key) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)](#Key.Encrypt)
    * [type encryptedValue struct](#encryptedValue)
* [Functions](#func)
    * [func NewKey(ctx context.Context, config schema.CloudKMSEncryptionKey) (encryption.Key, error)](#NewKey)
    * [func crc32Sum(data []byte) uint32](#crc32Sum)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Key" href="#Key">type Key struct</a>

```
searchKey: cloudkms.Key
```

```Go
type Key struct {
	name   string
	client *kms.KeyManagementClient
}
```

#### <a id="Key.Version" href="#Key.Version">func (k *Key) Version(ctx context.Context) (encryption.KeyVersion, error)</a>

```
searchKey: cloudkms.Key.Version
```

```Go
func (k *Key) Version(ctx context.Context) (encryption.KeyVersion, error)
```

#### <a id="Key.Decrypt" href="#Key.Decrypt">func (k *Key) Decrypt(ctx context.Context, cipherText []byte) (*encryption.Secret, error)</a>

```
searchKey: cloudkms.Key.Decrypt
```

```Go
func (k *Key) Decrypt(ctx context.Context, cipherText []byte) (*encryption.Secret, error)
```

Decrypt a secret, it must have been encrypted with the same Key encrypted secrets are a base64 encoded string containing the key name and a checksum 

#### <a id="Key.Encrypt" href="#Key.Encrypt">func (k *Key) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)</a>

```
searchKey: cloudkms.Key.Encrypt
```

```Go
func (k *Key) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)
```

Encrypt a secret, storing it as a base64 encoded json blob, this json contains the key name, ciphertext, & checksum. 

### <a id="encryptedValue" href="#encryptedValue">type encryptedValue struct</a>

```
searchKey: cloudkms.encryptedValue
tags: [private]
```

```Go
type encryptedValue struct {
	KeyName    string
	Ciphertext []byte
	Checksum   uint32
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewKey" href="#NewKey">func NewKey(ctx context.Context, config schema.CloudKMSEncryptionKey) (encryption.Key, error)</a>

```
searchKey: cloudkms.NewKey
```

```Go
func NewKey(ctx context.Context, config schema.CloudKMSEncryptionKey) (encryption.Key, error)
```

### <a id="crc32Sum" href="#crc32Sum">func crc32Sum(data []byte) uint32</a>

```
searchKey: cloudkms.crc32Sum
tags: [private]
```

```Go
func crc32Sum(data []byte) uint32
```

