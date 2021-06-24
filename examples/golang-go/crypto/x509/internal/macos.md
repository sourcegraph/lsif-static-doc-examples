# Package macOS

Package macOS provides cgo-less wrappers for Core Foundation and Security.framework, similarly to how package syscall provides access to libSystem.dylib. 

## Index

* [Constants](#const)
    * [const SecTrustSettingsDomainAdmin](#SecTrustSettingsDomainAdmin)
    * [const SecTrustSettingsDomainSystem](#SecTrustSettingsDomainSystem)
    * [const SecTrustSettingsDomainUser](#SecTrustSettingsDomainUser)
    * [const SecTrustSettingsResultDeny](#SecTrustSettingsResultDeny)
    * [const SecTrustSettingsResultInvalid](#SecTrustSettingsResultInvalid)
    * [const SecTrustSettingsResultTrustAsRoot](#SecTrustSettingsResultTrustAsRoot)
    * [const SecTrustSettingsResultTrustRoot](#SecTrustSettingsResultTrustRoot)
    * [const SecTrustSettingsResultUnspecified](#SecTrustSettingsResultUnspecified)
    * [const errSecItemNotFound](#errSecItemNotFound)
    * [const errSecNoTrustSettings](#errSecNoTrustSettings)
    * [const kCFAllocatorDefault](#kCFAllocatorDefault)
    * [const kCFNumberSInt32Type](#kCFNumberSInt32Type)
    * [const kCFStringEncodingUTF8](#kCFStringEncodingUTF8)
    * [const kSecFormatX509Cert](#kSecFormatX509Cert)
* [Variables](#var)
    * [var ErrNoTrustSettings](#ErrNoTrustSettings)
    * [var SecPolicyAppleSSL](#SecPolicyAppleSSL)
    * [var SecPolicyOid](#SecPolicyOid)
    * [var SecTrustSettingsPolicy](#SecTrustSettingsPolicy)
    * [var SecTrustSettingsPolicyString](#SecTrustSettingsPolicyString)
    * [var SecTrustSettingsResultKey](#SecTrustSettingsResultKey)
* [Types](#type)
    * [type CFRef uintptr](#CFRef)
        * [func CFArrayGetValueAtIndex(array CFRef, index int) CFRef](#CFArrayGetValueAtIndex)
        * [func CFDictionaryGetValueIfPresent(dict CFRef, key CFString) (value CFRef, ok bool)](#CFDictionaryGetValueIfPresent)
        * [func SecItemExport(cert CFRef) (data CFRef, err error)](#SecItemExport)
        * [func SecPolicyCopyProperties(policy CFRef) CFRef](#SecPolicyCopyProperties)
        * [func SecTrustSettingsCopyCertificates(domain SecTrustSettingsDomain) (certArray CFRef, err error)](#SecTrustSettingsCopyCertificates)
        * [func SecTrustSettingsCopyTrustSettings(cert CFRef, domain SecTrustSettingsDomain) (trustSettings CFRef, err error)](#SecTrustSettingsCopyTrustSettings)
    * [type CFString macOS.CFRef](#CFString)
        * [func StringToCFString(s string) CFString](#StringToCFString)
    * [type OSStatus struct](#OSStatus)
        * [func (s OSStatus) Error() string](#OSStatus.Error)
    * [type SecTrustSettingsDomain int32](#SecTrustSettingsDomain)
    * [type SecTrustSettingsResult int32](#SecTrustSettingsResult)
* [Functions](#func)
    * [func CFArrayGetCount(array CFRef) int](#CFArrayGetCount)
    * [func CFDataGetBytePtr(data CFRef) uintptr](#CFDataGetBytePtr)
    * [func CFDataGetLength(data CFRef) int](#CFDataGetLength)
    * [func CFDataToSlice(data CFRef) []byte](#CFDataToSlice)
    * [func CFEqual(a, b CFRef) bool](#CFEqual)
    * [func CFNumberGetValue(num CFRef) (int32, error)](#CFNumberGetValue)
    * [func CFRelease(ref CFRef)](#CFRelease)
    * [func syscall(fn, a1, a2, a3, a4, a5, a6 uintptr) uintptr](#syscall)
    * [func x509_CFArrayGetCount_trampoline()](#x509_CFArrayGetCount_trampoline)
    * [func x509_CFArrayGetValueAtIndex_trampoline()](#x509_CFArrayGetValueAtIndex_trampoline)
    * [func x509_CFDataGetBytePtr_trampoline()](#x509_CFDataGetBytePtr_trampoline)
    * [func x509_CFDataGetLength_trampoline()](#x509_CFDataGetLength_trampoline)
    * [func x509_CFDictionaryGetValueIfPresent_trampoline()](#x509_CFDictionaryGetValueIfPresent_trampoline)
    * [func x509_CFEqual_trampoline()](#x509_CFEqual_trampoline)
    * [func x509_CFNumberGetValue_trampoline()](#x509_CFNumberGetValue_trampoline)
    * [func x509_CFRelease_trampoline()](#x509_CFRelease_trampoline)
    * [func x509_CFStringCreateWithBytes_trampoline()](#x509_CFStringCreateWithBytes_trampoline)
    * [func x509_SecItemExport_trampoline()](#x509_SecItemExport_trampoline)
    * [func x509_SecPolicyCopyProperties_trampoline()](#x509_SecPolicyCopyProperties_trampoline)
    * [func x509_SecTrustSettingsCopyCertificates_trampoline()](#x509_SecTrustSettingsCopyCertificates_trampoline)
    * [func x509_SecTrustSettingsCopyTrustSettings_trampoline()](#x509_SecTrustSettingsCopyTrustSettings_trampoline)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="SecTrustSettingsDomainAdmin" href="#SecTrustSettingsDomainAdmin">const SecTrustSettingsDomainAdmin</a>

```
searchKey: macOS.SecTrustSettingsDomainAdmin
tags: [constant number]
```

```Go
const SecTrustSettingsDomainAdmin
```

### <a id="SecTrustSettingsDomainSystem" href="#SecTrustSettingsDomainSystem">const SecTrustSettingsDomainSystem</a>

```
searchKey: macOS.SecTrustSettingsDomainSystem
tags: [constant number]
```

```Go
const SecTrustSettingsDomainSystem
```

### <a id="SecTrustSettingsDomainUser" href="#SecTrustSettingsDomainUser">const SecTrustSettingsDomainUser</a>

```
searchKey: macOS.SecTrustSettingsDomainUser
tags: [constant number]
```

```Go
const SecTrustSettingsDomainUser SecTrustSettingsDomain = iota
```

### <a id="SecTrustSettingsResultDeny" href="#SecTrustSettingsResultDeny">const SecTrustSettingsResultDeny</a>

```
searchKey: macOS.SecTrustSettingsResultDeny
tags: [constant number]
```

```Go
const SecTrustSettingsResultDeny
```

### <a id="SecTrustSettingsResultInvalid" href="#SecTrustSettingsResultInvalid">const SecTrustSettingsResultInvalid</a>

```
searchKey: macOS.SecTrustSettingsResultInvalid
tags: [constant number]
```

```Go
const SecTrustSettingsResultInvalid SecTrustSettingsResult = iota
```

### <a id="SecTrustSettingsResultTrustAsRoot" href="#SecTrustSettingsResultTrustAsRoot">const SecTrustSettingsResultTrustAsRoot</a>

```
searchKey: macOS.SecTrustSettingsResultTrustAsRoot
tags: [constant number]
```

```Go
const SecTrustSettingsResultTrustAsRoot
```

### <a id="SecTrustSettingsResultTrustRoot" href="#SecTrustSettingsResultTrustRoot">const SecTrustSettingsResultTrustRoot</a>

```
searchKey: macOS.SecTrustSettingsResultTrustRoot
tags: [constant number]
```

```Go
const SecTrustSettingsResultTrustRoot
```

### <a id="SecTrustSettingsResultUnspecified" href="#SecTrustSettingsResultUnspecified">const SecTrustSettingsResultUnspecified</a>

```
searchKey: macOS.SecTrustSettingsResultUnspecified
tags: [constant number]
```

```Go
const SecTrustSettingsResultUnspecified
```

### <a id="errSecItemNotFound" href="#errSecItemNotFound">const errSecItemNotFound</a>

```
searchKey: macOS.errSecItemNotFound
tags: [constant number private]
```

```Go
const errSecItemNotFound = -25300
```

### <a id="errSecNoTrustSettings" href="#errSecNoTrustSettings">const errSecNoTrustSettings</a>

```
searchKey: macOS.errSecNoTrustSettings
tags: [constant number private]
```

```Go
const errSecNoTrustSettings = -25263
```

### <a id="kCFAllocatorDefault" href="#kCFAllocatorDefault">const kCFAllocatorDefault</a>

```
searchKey: macOS.kCFAllocatorDefault
tags: [constant number private]
```

```Go
const kCFAllocatorDefault = 0
```

### <a id="kCFNumberSInt32Type" href="#kCFNumberSInt32Type">const kCFNumberSInt32Type</a>

```
searchKey: macOS.kCFNumberSInt32Type
tags: [constant number private]
```

```Go
const kCFNumberSInt32Type = 3
```

### <a id="kCFStringEncodingUTF8" href="#kCFStringEncodingUTF8">const kCFStringEncodingUTF8</a>

```
searchKey: macOS.kCFStringEncodingUTF8
tags: [constant number private]
```

```Go
const kCFStringEncodingUTF8 = 0x08000100
```

### <a id="kSecFormatX509Cert" href="#kSecFormatX509Cert">const kSecFormatX509Cert</a>

```
searchKey: macOS.kSecFormatX509Cert
tags: [constant number private]
```

```Go
const kSecFormatX509Cert int32 = 9
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ErrNoTrustSettings" href="#ErrNoTrustSettings">var ErrNoTrustSettings</a>

```
searchKey: macOS.ErrNoTrustSettings
tags: [variable interface]
```

```Go
var ErrNoTrustSettings = errors.New("no trust settings found")
```

### <a id="SecPolicyAppleSSL" href="#SecPolicyAppleSSL">var SecPolicyAppleSSL</a>

```
searchKey: macOS.SecPolicyAppleSSL
tags: [variable number]
```

```Go
var SecPolicyAppleSSL = StringToCFString("1.2.840.113635.100.1.3") // defined by POLICYMACRO

```

### <a id="SecPolicyOid" href="#SecPolicyOid">var SecPolicyOid</a>

```
searchKey: macOS.SecPolicyOid
tags: [variable number]
```

```Go
var SecPolicyOid = StringToCFString("SecPolicyOid")
```

### <a id="SecTrustSettingsPolicy" href="#SecTrustSettingsPolicy">var SecTrustSettingsPolicy</a>

```
searchKey: macOS.SecTrustSettingsPolicy
tags: [variable number]
```

```Go
var SecTrustSettingsPolicy = StringToCFString("kSecTrustSettingsPolicy")
```

### <a id="SecTrustSettingsPolicyString" href="#SecTrustSettingsPolicyString">var SecTrustSettingsPolicyString</a>

```
searchKey: macOS.SecTrustSettingsPolicyString
tags: [variable number]
```

```Go
var SecTrustSettingsPolicyString = StringToCFString("kSecTrustSettingsPolicyString")
```

### <a id="SecTrustSettingsResultKey" href="#SecTrustSettingsResultKey">var SecTrustSettingsResultKey</a>

```
searchKey: macOS.SecTrustSettingsResultKey
tags: [variable number]
```

```Go
var SecTrustSettingsResultKey = StringToCFString("kSecTrustSettingsResult")
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="CFRef" href="#CFRef">type CFRef uintptr</a>

```
searchKey: macOS.CFRef
tags: [number]
```

```Go
type CFRef uintptr
```

CFRef is an opaque reference to a Core Foundation object. It is a pointer, but to memory not owned by Go, so not an unsafe.Pointer. 

#### <a id="CFArrayGetValueAtIndex" href="#CFArrayGetValueAtIndex">func CFArrayGetValueAtIndex(array CFRef, index int) CFRef</a>

```
searchKey: macOS.CFArrayGetValueAtIndex
tags: [method]
```

```Go
func CFArrayGetValueAtIndex(array CFRef, index int) CFRef
```

#### <a id="CFDictionaryGetValueIfPresent" href="#CFDictionaryGetValueIfPresent">func CFDictionaryGetValueIfPresent(dict CFRef, key CFString) (value CFRef, ok bool)</a>

```
searchKey: macOS.CFDictionaryGetValueIfPresent
tags: [method]
```

```Go
func CFDictionaryGetValueIfPresent(dict CFRef, key CFString) (value CFRef, ok bool)
```

#### <a id="SecItemExport" href="#SecItemExport">func SecItemExport(cert CFRef) (data CFRef, err error)</a>

```
searchKey: macOS.SecItemExport
tags: [method]
```

```Go
func SecItemExport(cert CFRef) (data CFRef, err error)
```

#### <a id="SecPolicyCopyProperties" href="#SecPolicyCopyProperties">func SecPolicyCopyProperties(policy CFRef) CFRef</a>

```
searchKey: macOS.SecPolicyCopyProperties
tags: [method]
```

```Go
func SecPolicyCopyProperties(policy CFRef) CFRef
```

#### <a id="SecTrustSettingsCopyCertificates" href="#SecTrustSettingsCopyCertificates">func SecTrustSettingsCopyCertificates(domain SecTrustSettingsDomain) (certArray CFRef, err error)</a>

```
searchKey: macOS.SecTrustSettingsCopyCertificates
tags: [method]
```

```Go
func SecTrustSettingsCopyCertificates(domain SecTrustSettingsDomain) (certArray CFRef, err error)
```

#### <a id="SecTrustSettingsCopyTrustSettings" href="#SecTrustSettingsCopyTrustSettings">func SecTrustSettingsCopyTrustSettings(cert CFRef, domain SecTrustSettingsDomain) (trustSettings CFRef, err error)</a>

```
searchKey: macOS.SecTrustSettingsCopyTrustSettings
tags: [method]
```

```Go
func SecTrustSettingsCopyTrustSettings(cert CFRef, domain SecTrustSettingsDomain) (trustSettings CFRef, err error)
```

### <a id="CFString" href="#CFString">type CFString macOS.CFRef</a>

```
searchKey: macOS.CFString
tags: [number]
```

```Go
type CFString CFRef
```

#### <a id="StringToCFString" href="#StringToCFString">func StringToCFString(s string) CFString</a>

```
searchKey: macOS.StringToCFString
tags: [method]
```

```Go
func StringToCFString(s string) CFString
```

StringToCFString returns a copy of the UTF-8 contents of s as a new CFString. 

### <a id="OSStatus" href="#OSStatus">type OSStatus struct</a>

```
searchKey: macOS.OSStatus
tags: [struct]
```

```Go
type OSStatus struct {
	call   string
	status int32
}
```

#### <a id="OSStatus.Error" href="#OSStatus.Error">func (s OSStatus) Error() string</a>

```
searchKey: macOS.OSStatus.Error
tags: [function]
```

```Go
func (s OSStatus) Error() string
```

### <a id="SecTrustSettingsDomain" href="#SecTrustSettingsDomain">type SecTrustSettingsDomain int32</a>

```
searchKey: macOS.SecTrustSettingsDomain
tags: [number]
```

```Go
type SecTrustSettingsDomain int32
```

### <a id="SecTrustSettingsResult" href="#SecTrustSettingsResult">type SecTrustSettingsResult int32</a>

```
searchKey: macOS.SecTrustSettingsResult
tags: [number]
```

```Go
type SecTrustSettingsResult int32
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="CFArrayGetCount" href="#CFArrayGetCount">func CFArrayGetCount(array CFRef) int</a>

```
searchKey: macOS.CFArrayGetCount
tags: [method]
```

```Go
func CFArrayGetCount(array CFRef) int
```

### <a id="CFDataGetBytePtr" href="#CFDataGetBytePtr">func CFDataGetBytePtr(data CFRef) uintptr</a>

```
searchKey: macOS.CFDataGetBytePtr
tags: [method]
```

```Go
func CFDataGetBytePtr(data CFRef) uintptr
```

### <a id="CFDataGetLength" href="#CFDataGetLength">func CFDataGetLength(data CFRef) int</a>

```
searchKey: macOS.CFDataGetLength
tags: [method]
```

```Go
func CFDataGetLength(data CFRef) int
```

### <a id="CFDataToSlice" href="#CFDataToSlice">func CFDataToSlice(data CFRef) []byte</a>

```
searchKey: macOS.CFDataToSlice
tags: [method]
```

```Go
func CFDataToSlice(data CFRef) []byte
```

CFDataToSlice returns a copy of the contents of data as a bytes slice. 

### <a id="CFEqual" href="#CFEqual">func CFEqual(a, b CFRef) bool</a>

```
searchKey: macOS.CFEqual
tags: [method]
```

```Go
func CFEqual(a, b CFRef) bool
```

### <a id="CFNumberGetValue" href="#CFNumberGetValue">func CFNumberGetValue(num CFRef) (int32, error)</a>

```
searchKey: macOS.CFNumberGetValue
tags: [method]
```

```Go
func CFNumberGetValue(num CFRef) (int32, error)
```

### <a id="CFRelease" href="#CFRelease">func CFRelease(ref CFRef)</a>

```
searchKey: macOS.CFRelease
tags: [method]
```

```Go
func CFRelease(ref CFRef)
```

### <a id="syscall" href="#syscall">func syscall(fn, a1, a2, a3, a4, a5, a6 uintptr) uintptr</a>

```
searchKey: macOS.syscall
tags: [method private]
```

```Go
func syscall(fn, a1, a2, a3, a4, a5, a6 uintptr) uintptr
```

syscall is implemented in the runtime package (runtime/sys_darwin.go) 

### <a id="x509_CFArrayGetCount_trampoline" href="#x509_CFArrayGetCount_trampoline">func x509_CFArrayGetCount_trampoline()</a>

```
searchKey: macOS.x509_CFArrayGetCount_trampoline
tags: [function private]
```

```Go
func x509_CFArrayGetCount_trampoline()
```

### <a id="x509_CFArrayGetValueAtIndex_trampoline" href="#x509_CFArrayGetValueAtIndex_trampoline">func x509_CFArrayGetValueAtIndex_trampoline()</a>

```
searchKey: macOS.x509_CFArrayGetValueAtIndex_trampoline
tags: [function private]
```

```Go
func x509_CFArrayGetValueAtIndex_trampoline()
```

### <a id="x509_CFDataGetBytePtr_trampoline" href="#x509_CFDataGetBytePtr_trampoline">func x509_CFDataGetBytePtr_trampoline()</a>

```
searchKey: macOS.x509_CFDataGetBytePtr_trampoline
tags: [function private]
```

```Go
func x509_CFDataGetBytePtr_trampoline()
```

### <a id="x509_CFDataGetLength_trampoline" href="#x509_CFDataGetLength_trampoline">func x509_CFDataGetLength_trampoline()</a>

```
searchKey: macOS.x509_CFDataGetLength_trampoline
tags: [function private]
```

```Go
func x509_CFDataGetLength_trampoline()
```

### <a id="x509_CFDictionaryGetValueIfPresent_trampoline" href="#x509_CFDictionaryGetValueIfPresent_trampoline">func x509_CFDictionaryGetValueIfPresent_trampoline()</a>

```
searchKey: macOS.x509_CFDictionaryGetValueIfPresent_trampoline
tags: [function private]
```

```Go
func x509_CFDictionaryGetValueIfPresent_trampoline()
```

### <a id="x509_CFEqual_trampoline" href="#x509_CFEqual_trampoline">func x509_CFEqual_trampoline()</a>

```
searchKey: macOS.x509_CFEqual_trampoline
tags: [function private]
```

```Go
func x509_CFEqual_trampoline()
```

### <a id="x509_CFNumberGetValue_trampoline" href="#x509_CFNumberGetValue_trampoline">func x509_CFNumberGetValue_trampoline()</a>

```
searchKey: macOS.x509_CFNumberGetValue_trampoline
tags: [function private]
```

```Go
func x509_CFNumberGetValue_trampoline()
```

### <a id="x509_CFRelease_trampoline" href="#x509_CFRelease_trampoline">func x509_CFRelease_trampoline()</a>

```
searchKey: macOS.x509_CFRelease_trampoline
tags: [function private]
```

```Go
func x509_CFRelease_trampoline()
```

### <a id="x509_CFStringCreateWithBytes_trampoline" href="#x509_CFStringCreateWithBytes_trampoline">func x509_CFStringCreateWithBytes_trampoline()</a>

```
searchKey: macOS.x509_CFStringCreateWithBytes_trampoline
tags: [function private]
```

```Go
func x509_CFStringCreateWithBytes_trampoline()
```

### <a id="x509_SecItemExport_trampoline" href="#x509_SecItemExport_trampoline">func x509_SecItemExport_trampoline()</a>

```
searchKey: macOS.x509_SecItemExport_trampoline
tags: [function private]
```

```Go
func x509_SecItemExport_trampoline()
```

### <a id="x509_SecPolicyCopyProperties_trampoline" href="#x509_SecPolicyCopyProperties_trampoline">func x509_SecPolicyCopyProperties_trampoline()</a>

```
searchKey: macOS.x509_SecPolicyCopyProperties_trampoline
tags: [function private]
```

```Go
func x509_SecPolicyCopyProperties_trampoline()
```

### <a id="x509_SecTrustSettingsCopyCertificates_trampoline" href="#x509_SecTrustSettingsCopyCertificates_trampoline">func x509_SecTrustSettingsCopyCertificates_trampoline()</a>

```
searchKey: macOS.x509_SecTrustSettingsCopyCertificates_trampoline
tags: [function private]
```

```Go
func x509_SecTrustSettingsCopyCertificates_trampoline()
```

### <a id="x509_SecTrustSettingsCopyTrustSettings_trampoline" href="#x509_SecTrustSettingsCopyTrustSettings_trampoline">func x509_SecTrustSettingsCopyTrustSettings_trampoline()</a>

```
searchKey: macOS.x509_SecTrustSettingsCopyTrustSettings_trampoline
tags: [function private]
```

```Go
func x509_SecTrustSettingsCopyTrustSettings_trampoline()
```

