# Package awskms

## Index

* [Constants](#const)
    * [const testKeyID](#testKeyID)
* [Variables](#var)
    * [var shouldUpdate](#shouldUpdate)
* [Types](#type)
    * [type Key struct](#Key)
        * [func (k *Key) Version(ctx context.Context) (encryption.KeyVersion, error)](#Key.Version)
        * [func (k *Key) Decrypt(ctx context.Context, cipherText []byte) (*encryption.Secret, error)](#Key.Decrypt)
        * [func (k *Key) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)](#Key.Encrypt)
    * [type encryptedValue struct](#encryptedValue)
* [Functions](#func)
    * [func NewKey(ctx context.Context, keyConfig schema.AWSKMSEncryptionKey) (encryption.Key, error)](#NewKey)
    * [func newKey(ctx context.Context, keyConfig schema.AWSKMSEncryptionKey, config aws.Config) (encryption.Key, error)](#newKey)
    * [func awsConfigOptsForKeyConfig(keyConfig schema.AWSKMSEncryptionKey) []func(*config.LoadOptions) error](#awsConfigOptsForKeyConfig)
    * [func aesEncrypt(plaintext, key []byte) ([]byte, []byte, error)](#aesEncrypt)
    * [func aesDecrypt(ciphertext, key, nonce []byte) ([]byte, error)](#aesDecrypt)
    * [func TestRoundtrip(t *testing.T)](#TestRoundtrip)
    * [func newClientFactory(t testing.TB, name string, mws ...httpcli.Middleware) (*httpcli.Factory, func(testing.TB))](#newClientFactory)
    * [func newRecorder(t testing.TB, file string, record bool) *recorder.Recorder](#newRecorder)
    * [func save(t testing.TB, rec *recorder.Recorder)](#save)
    * [func readEnvFallback(key, fallback string) string](#readEnvFallback)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="testKeyID" href="#testKeyID">const testKeyID</a>

```
searchKey: awskms.testKeyID
tags: [private]
```

```Go
const testKeyID = "4b739277-5a93-4551-b71c-99608c9c805d"
```

testKeyID is the ID of a key defined here: [https://us-west-2.console.aws.amazon.com/kms/home?region=us-west-2#/kms/keys/4b739277-5a93-4551-b71c-99608c9c805d](https://us-west-2.console.aws.amazon.com/kms/home?region=us-west-2#/kms/keys/4b739277-5a93-4551-b71c-99608c9c805d) If you want to update this test, feel free to replace the key ID used here. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="shouldUpdate" href="#shouldUpdate">var shouldUpdate</a>

```
searchKey: awskms.shouldUpdate
tags: [private]
```

```Go
var shouldUpdate = flag.Bool("update", false, "Update testdata")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Key" href="#Key">type Key struct</a>

```
searchKey: awskms.Key
```

```Go
type Key struct {
	keyID  string
	client *kms.Client
}
```

#### <a id="Key.Version" href="#Key.Version">func (k *Key) Version(ctx context.Context) (encryption.KeyVersion, error)</a>

```
searchKey: awskms.Key.Version
```

```Go
func (k *Key) Version(ctx context.Context) (encryption.KeyVersion, error)
```

#### <a id="Key.Decrypt" href="#Key.Decrypt">func (k *Key) Decrypt(ctx context.Context, cipherText []byte) (*encryption.Secret, error)</a>

```
searchKey: awskms.Key.Decrypt
```

```Go
func (k *Key) Decrypt(ctx context.Context, cipherText []byte) (*encryption.Secret, error)
```

Decrypt a secret, it must have been encrypted with the same Key. Encrypted secrets are a base64 encoded string containing the original content. 

#### <a id="Key.Encrypt" href="#Key.Encrypt">func (k *Key) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)</a>

```
searchKey: awskms.Key.Encrypt
```

```Go
func (k *Key) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)
```

Encrypt a secret, storing it as a base64 encoded string. 

### <a id="encryptedValue" href="#encryptedValue">type encryptedValue struct</a>

```
searchKey: awskms.encryptedValue
tags: [private]
```

```Go
type encryptedValue struct {
	Key        []byte
	Nonce      []byte
	Ciphertext []byte
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewKey" href="#NewKey">func NewKey(ctx context.Context, keyConfig schema.AWSKMSEncryptionKey) (encryption.Key, error)</a>

```
searchKey: awskms.NewKey
```

```Go
func NewKey(ctx context.Context, keyConfig schema.AWSKMSEncryptionKey) (encryption.Key, error)
```

### <a id="newKey" href="#newKey">func newKey(ctx context.Context, keyConfig schema.AWSKMSEncryptionKey, config aws.Config) (encryption.Key, error)</a>

```
searchKey: awskms.newKey
tags: [private]
```

```Go
func newKey(ctx context.Context, keyConfig schema.AWSKMSEncryptionKey, config aws.Config) (encryption.Key, error)
```

### <a id="awsConfigOptsForKeyConfig" href="#awsConfigOptsForKeyConfig">func awsConfigOptsForKeyConfig(keyConfig schema.AWSKMSEncryptionKey) []func(*config.LoadOptions) error</a>

```
searchKey: awskms.awsConfigOptsForKeyConfig
tags: [private]
```

```Go
func awsConfigOptsForKeyConfig(keyConfig schema.AWSKMSEncryptionKey) []func(*config.LoadOptions) error
```

### <a id="aesEncrypt" href="#aesEncrypt">func aesEncrypt(plaintext, key []byte) ([]byte, []byte, error)</a>

```
searchKey: awskms.aesEncrypt
tags: [private]
```

```Go
func aesEncrypt(plaintext, key []byte) ([]byte, []byte, error)
```

### <a id="aesDecrypt" href="#aesDecrypt">func aesDecrypt(ciphertext, key, nonce []byte) ([]byte, error)</a>

```
searchKey: awskms.aesDecrypt
tags: [private]
```

```Go
func aesDecrypt(ciphertext, key, nonce []byte) ([]byte, error)
```

### <a id="TestRoundtrip" href="#TestRoundtrip">func TestRoundtrip(t *testing.T)</a>

```
searchKey: awskms.TestRoundtrip
tags: [private]
```

```Go
func TestRoundtrip(t *testing.T)
```

### <a id="newClientFactory" href="#newClientFactory">func newClientFactory(t testing.TB, name string, mws ...httpcli.Middleware) (*httpcli.Factory, func(testing.TB))</a>

```
searchKey: awskms.newClientFactory
tags: [private]
```

```Go
func newClientFactory(t testing.TB, name string, mws ...httpcli.Middleware) (*httpcli.Factory, func(testing.TB))
```

### <a id="newRecorder" href="#newRecorder">func newRecorder(t testing.TB, file string, record bool) *recorder.Recorder</a>

```
searchKey: awskms.newRecorder
tags: [private]
```

```Go
func newRecorder(t testing.TB, file string, record bool) *recorder.Recorder
```

### <a id="save" href="#save">func save(t testing.TB, rec *recorder.Recorder)</a>

```
searchKey: awskms.save
tags: [private]
```

```Go
func save(t testing.TB, rec *recorder.Recorder)
```

### <a id="readEnvFallback" href="#readEnvFallback">func readEnvFallback(key, fallback string) string</a>

```
searchKey: awskms.readEnvFallback
tags: [private]
```

```Go
func readEnvFallback(key, fallback string) string
```

