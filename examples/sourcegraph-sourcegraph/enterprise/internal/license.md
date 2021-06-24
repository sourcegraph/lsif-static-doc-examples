# Package license

Package license provides license key generation and verification. 

License keys are generated and signed using Sourcegraph's private key. Sourcegraph instances must be able to verify the license key offline, so all license information (such as the max user count) is encoded in the license itself. 

Key rotation, license key revocation, etc., are not implemented. 

## Index

* [Constants](#const)
    * [const formatVersion](#formatVersion)
* [Variables](#var)
    * [var infoFixture](#infoFixture)
    * [var privateKey](#privateKey)
    * [var publicKey](#publicKey)
    * [var timeFixture](#timeFixture)
* [Types](#type)
    * [type Info struct](#Info)
        * [func ParseSignedKey(text string, publicKey ssh.PublicKey) (info *Info, signature string, err error)](#ParseSignedKey)
        * [func (l Info) HasTag(tag string) bool](#Info.HasTag)
        * [func (l Info) IsExpired() bool](#Info.IsExpired)
        * [func (l Info) IsExpiredWithGracePeriod() bool](#Info.IsExpiredWithGracePeriod)
        * [func (l *Info) String() string](#Info.String)
        * [func (l *Info) decode(data []byte) error](#Info.decode)
        * [func (l Info) encode() ([]byte, error)](#Info.encode)
    * [type encodedInfo struct](#encodedInfo)
    * [type signedKey struct](#signedKey)
* [Functions](#func)
    * [func GenerateSignedKey(info Info, privateKey ssh.Signer) (string, error)](#GenerateSignedKey)
    * [func ParseTagsInput(tagsStr string) []string](#ParseTagsInput)
    * [func TestGenerateParseSignedKey(t *testing.T)](#TestGenerateParseSignedKey)
    * [func TestInfo_EncodeDecode(t *testing.T)](#TestInfo_EncodeDecode)
    * [func TestParseSignedKey(t *testing.T)](#TestParseSignedKey)
    * [func TestParseTagsInput(t *testing.T)](#TestParseTagsInput)
    * [func init()](#init.license_test.go)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="formatVersion" href="#formatVersion">const formatVersion</a>

```
searchKey: license.formatVersion
tags: [constant number private]
```

```Go
const formatVersion = 1 // (encodedInfo).Version value

```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="infoFixture" href="#infoFixture">var infoFixture</a>

```
searchKey: license.infoFixture
tags: [variable struct private]
```

```Go
var infoFixture = Info{Tags: []string{"a"}, UserCount: 123, ExpiresAt: timeFixture}
```

### <a id="privateKey" href="#privateKey">var privateKey</a>

```
searchKey: license.privateKey
tags: [variable interface private]
```

```Go
var privateKey ssh.Signer
```

### <a id="publicKey" href="#publicKey">var publicKey</a>

```
searchKey: license.publicKey
tags: [variable interface private]
```

```Go
var publicKey ssh.PublicKey
```

### <a id="timeFixture" href="#timeFixture">var timeFixture</a>

```
searchKey: license.timeFixture
tags: [variable struct private]
```

```Go
var timeFixture = time.Date(2018, time.September, 22, 21, 33, 44, 0, time.UTC)
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Info" href="#Info">type Info struct</a>

```
searchKey: license.Info
tags: [struct]
```

```Go
type Info struct {
	Tags      []string  `json:"t"` // tags that denote features/restrictions (e.g., "starter" or "dev")
	UserCount uint      `json:"u"` // the number of users that this license is valid for
	ExpiresAt time.Time `json:"e"` // the date when this license expires
}
```

Info contains information about a license key. In the signed license key that Sourcegraph provides to customers, this value is signed but not encrypted. This value is not secret, and anyone with a license key can view (but not forge) this information. 

NOTE: If you change these fields, you MUST handle backward compatibility. Existing licenses that were generated with the old fields must still work until all customers have added the new license. Increment (encodedInfo).Version and formatVersion when you make backward-incompatbile changes. 

#### <a id="ParseSignedKey" href="#ParseSignedKey">func ParseSignedKey(text string, publicKey ssh.PublicKey) (info *Info, signature string, err error)</a>

```
searchKey: license.ParseSignedKey
tags: [method]
```

```Go
func ParseSignedKey(text string, publicKey ssh.PublicKey) (info *Info, signature string, err error)
```

ParseSignedKey parses and verifies the signed license key. If parsing or verification fails, a non-nil error is returned. 

#### <a id="Info.HasTag" href="#Info.HasTag">func (l Info) HasTag(tag string) bool</a>

```
searchKey: license.Info.HasTag
tags: [method]
```

```Go
func (l Info) HasTag(tag string) bool
```

HasTag reports whether tag is in l's list of tags. 

#### <a id="Info.IsExpired" href="#Info.IsExpired">func (l Info) IsExpired() bool</a>

```
searchKey: license.Info.IsExpired
tags: [function]
```

```Go
func (l Info) IsExpired() bool
```

IsExpired reports whether the license has expired. 

#### <a id="Info.IsExpiredWithGracePeriod" href="#Info.IsExpiredWithGracePeriod">func (l Info) IsExpiredWithGracePeriod() bool</a>

```
searchKey: license.Info.IsExpiredWithGracePeriod
tags: [function]
```

```Go
func (l Info) IsExpiredWithGracePeriod() bool
```

IsExpiredWithGracePeriod reports whether the license has expired, adding a grace period of 3 days after the license's expiration. 

#### <a id="Info.String" href="#Info.String">func (l *Info) String() string</a>

```
searchKey: license.Info.String
tags: [function]
```

```Go
func (l *Info) String() string
```

#### <a id="Info.decode" href="#Info.decode">func (l *Info) decode(data []byte) error</a>

```
searchKey: license.Info.decode
tags: [method private]
```

```Go
func (l *Info) decode(data []byte) error
```

#### <a id="Info.encode" href="#Info.encode">func (l Info) encode() ([]byte, error)</a>

```
searchKey: license.Info.encode
tags: [function private]
```

```Go
func (l Info) encode() ([]byte, error)
```

### <a id="encodedInfo" href="#encodedInfo">type encodedInfo struct</a>

```
searchKey: license.encodedInfo
tags: [struct private]
```

```Go
type encodedInfo struct {
	Version int     `json:"v"` // version number of the license key info format (not Sourcegraph product/build version)
	Nonce   [8]byte `json:"n"` // random nonce so that licenses with identical Info values
	Info
}
```

### <a id="signedKey" href="#signedKey">type signedKey struct</a>

```
searchKey: license.signedKey
tags: [struct private]
```

```Go
type signedKey struct {
	Signature   *ssh.Signature `json:"sig"`
	EncodedInfo []byte         `json:"info"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="GenerateSignedKey" href="#GenerateSignedKey">func GenerateSignedKey(info Info, privateKey ssh.Signer) (string, error)</a>

```
searchKey: license.GenerateSignedKey
tags: [method]
```

```Go
func GenerateSignedKey(info Info, privateKey ssh.Signer) (string, error)
```

GenerateSignedKey generates a new signed license key with the given license information, using the private key for the signature. 

### <a id="ParseTagsInput" href="#ParseTagsInput">func ParseTagsInput(tagsStr string) []string</a>

```
searchKey: license.ParseTagsInput
tags: [method]
```

```Go
func ParseTagsInput(tagsStr string) []string
```

ParseTagsInput parses a string of comma-separated tags. It removes whitespace around tags and removes empty tags before returning the list of tags. 

### <a id="TestGenerateParseSignedKey" href="#TestGenerateParseSignedKey">func TestGenerateParseSignedKey(t *testing.T)</a>

```
searchKey: license.TestGenerateParseSignedKey
tags: [method private test]
```

```Go
func TestGenerateParseSignedKey(t *testing.T)
```

### <a id="TestInfo_EncodeDecode" href="#TestInfo_EncodeDecode">func TestInfo_EncodeDecode(t *testing.T)</a>

```
searchKey: license.TestInfo_EncodeDecode
tags: [method private test]
```

```Go
func TestInfo_EncodeDecode(t *testing.T)
```

### <a id="TestParseSignedKey" href="#TestParseSignedKey">func TestParseSignedKey(t *testing.T)</a>

```
searchKey: license.TestParseSignedKey
tags: [method private test]
```

```Go
func TestParseSignedKey(t *testing.T)
```

### <a id="TestParseTagsInput" href="#TestParseTagsInput">func TestParseTagsInput(t *testing.T)</a>

```
searchKey: license.TestParseTagsInput
tags: [method private test]
```

```Go
func TestParseTagsInput(t *testing.T)
```

### <a id="init.license_test.go" href="#init.license_test.go">func init()</a>

```
searchKey: license.init
tags: [function private]
```

```Go
func init()
```

