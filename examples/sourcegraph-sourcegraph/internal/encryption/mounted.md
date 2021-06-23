# Package mounted

## Index

* [Variables](#var)
    * [var theScriptOfBeeMovie](#theScriptOfBeeMovie)
* [Types](#type)
    * [type Key struct](#Key)
        * [func NewKey(ctx context.Context, k schema.MountedEncryptionKey) (*Key, error)](#NewKey)
        * [func (k *Key) Version(ctx context.Context) (encryption.KeyVersion, error)](#Key.Version)
        * [func (k *Key) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)](#Key.Encrypt)
        * [func (k *Key) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)](#Key.Decrypt)
    * [type encryptedValue struct](#encryptedValue)
* [Functions](#func)
    * [func crc32Sum(data []byte) uint32](#crc32Sum)
    * [func TestRoundTrip(t *testing.T)](#TestRoundTrip)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="theScriptOfBeeMovie" href="#theScriptOfBeeMovie">var theScriptOfBeeMovie</a>

```
searchKey: mounted.theScriptOfBeeMovie
tags: [private]
```

```Go
var theScriptOfBeeMovie = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Key" href="#Key">type Key struct</a>

```
searchKey: mounted.Key
```

```Go
type Key struct {
	keyname string
	secret  []byte
	version string
}
```

Key is an encryption.Key implementation that uses AES GCM encryption, using a secret loaded either from an env var or a file 

#### <a id="NewKey" href="#NewKey">func NewKey(ctx context.Context, k schema.MountedEncryptionKey) (*Key, error)</a>

```
searchKey: mounted.NewKey
```

```Go
func NewKey(ctx context.Context, k schema.MountedEncryptionKey) (*Key, error)
```

#### <a id="Key.Version" href="#Key.Version">func (k *Key) Version(ctx context.Context) (encryption.KeyVersion, error)</a>

```
searchKey: mounted.Key.Version
```

```Go
func (k *Key) Version(ctx context.Context) (encryption.KeyVersion, error)
```

#### <a id="Key.Encrypt" href="#Key.Encrypt">func (k *Key) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)</a>

```
searchKey: mounted.Key.Encrypt
```

```Go
func (k *Key) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)
```

#### <a id="Key.Decrypt" href="#Key.Decrypt">func (k *Key) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)</a>

```
searchKey: mounted.Key.Decrypt
```

```Go
func (k *Key) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)
```

### <a id="encryptedValue" href="#encryptedValue">type encryptedValue struct</a>

```
searchKey: mounted.encryptedValue
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

### <a id="crc32Sum" href="#crc32Sum">func crc32Sum(data []byte) uint32</a>

```
searchKey: mounted.crc32Sum
tags: [private]
```

```Go
func crc32Sum(data []byte) uint32
```

### <a id="TestRoundTrip" href="#TestRoundTrip">func TestRoundTrip(t *testing.T)</a>

```
searchKey: mounted.TestRoundTrip
tags: [private]
```

```Go
func TestRoundTrip(t *testing.T)
```

