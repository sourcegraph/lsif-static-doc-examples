# Package url

Package url parses URLs and implements query escaping. 

## Index

* [Constants](#const)
    * [const upperhex](#upperhex)
    * [const encodePath](#encodePath)
    * [const encodePathSegment](#encodePathSegment)
    * [const encodeHost](#encodeHost)
    * [const encodeZone](#encodeZone)
    * [const encodeUserPassword](#encodeUserPassword)
    * [const encodeQueryComponent](#encodeQueryComponent)
    * [const encodeFragment](#encodeFragment)
    * [const pathThatLooksSchemeRelative](#pathThatLooksSchemeRelative)
* [Variables](#var)
    * [var urltests](#urltests)
    * [var parseRequestURLTests](#parseRequestURLTests)
    * [var stringURLTests](#stringURLTests)
    * [var unescapeTests](#unescapeTests)
    * [var queryEscapeTests](#queryEscapeTests)
    * [var pathEscapeTests](#pathEscapeTests)
    * [var encodeQueryTests](#encodeQueryTests)
    * [var resolvePathTests](#resolvePathTests)
    * [var resolveReferenceTests](#resolveReferenceTests)
    * [var parseTests](#parseTests)
    * [var requritests](#requritests)
    * [var shouldEscapeTests](#shouldEscapeTests)
    * [var netErrorTests](#netErrorTests)
    * [var escapeBenchmarks](#escapeBenchmarks)
    * [var sink](#sink)
* [Types](#type)
    * [type Error struct](#Error)
        * [func (e *Error) Unwrap() error](#Error.Unwrap)
        * [func (e *Error) Error() string](#Error.Error)
        * [func (e *Error) Timeout() bool](#Error.Timeout)
        * [func (e *Error) Temporary() bool](#Error.Temporary)
    * [type encoding int](#encoding)
    * [type EscapeError string](#EscapeError)
        * [func (e EscapeError) Error() string](#EscapeError.Error)
    * [type InvalidHostError string](#InvalidHostError)
        * [func (e InvalidHostError) Error() string](#InvalidHostError.Error)
    * [type URL struct](#URL)
        * [func Parse(rawURL string) (*URL, error)](#Parse)
        * [func ParseRequestURI(rawURL string) (*URL, error)](#ParseRequestURI)
        * [func parse(rawURL string, viaRequest bool) (*URL, error)](#parse)
        * [func (u *URL) setPath(p string) error](#URL.setPath)
        * [func (u *URL) EscapedPath() string](#URL.EscapedPath)
        * [func (u *URL) setFragment(f string) error](#URL.setFragment)
        * [func (u *URL) EscapedFragment() string](#URL.EscapedFragment)
        * [func (u *URL) String() string](#URL.String)
        * [func (u *URL) Redacted() string](#URL.Redacted)
        * [func (u *URL) IsAbs() bool](#URL.IsAbs)
        * [func (u *URL) Parse(ref string) (*URL, error)](#URL.Parse)
        * [func (u *URL) ResolveReference(ref *URL) *URL](#URL.ResolveReference)
        * [func (u *URL) Query() Values](#URL.Query)
        * [func (u *URL) RequestURI() string](#URL.RequestURI)
        * [func (u *URL) Hostname() string](#URL.Hostname)
        * [func (u *URL) Port() string](#URL.Port)
        * [func (u *URL) MarshalBinary() (text []byte, err error)](#URL.MarshalBinary)
        * [func (u *URL) UnmarshalBinary(text []byte) error](#URL.UnmarshalBinary)
    * [type Userinfo struct](#Userinfo)
        * [func User(username string) *Userinfo](#User)
        * [func UserPassword(username, password string) *Userinfo](#UserPassword)
        * [func parseAuthority(authority string) (user *Userinfo, host string, err error)](#parseAuthority)
        * [func (u *Userinfo) Username() string](#Userinfo.Username)
        * [func (u *Userinfo) Password() (string, bool)](#Userinfo.Password)
        * [func (u *Userinfo) String() string](#Userinfo.String)
    * [type Values map[string][]string](#Values)
        * [func ParseQuery(query string) (Values, error)](#ParseQuery)
        * [func (v Values) Get(key string) string](#Values.Get)
        * [func (v Values) Set(key, value string)](#Values.Set)
        * [func (v Values) Add(key, value string)](#Values.Add)
        * [func (v Values) Del(key string)](#Values.Del)
        * [func (v Values) Has(key string) bool](#Values.Has)
        * [func (v Values) Encode() string](#Values.Encode)
    * [type URLTest struct](#URLTest)
    * [type EscapeTest struct](#EscapeTest)
    * [type EncodeQueryTest struct](#EncodeQueryTest)
    * [type parseTest struct](#parseTest)
    * [type RequestURITest struct](#RequestURITest)
    * [type shouldEscapeTest struct](#shouldEscapeTest)
    * [type timeoutError struct](#timeoutError)
        * [func (e *timeoutError) Error() string](#timeoutError.Error)
        * [func (e *timeoutError) Timeout() bool](#timeoutError.Timeout)
    * [type temporaryError struct](#temporaryError)
        * [func (e *temporaryError) Error() string](#temporaryError.Error)
        * [func (e *temporaryError) Temporary() bool](#temporaryError.Temporary)
    * [type timeoutTemporaryError struct](#timeoutTemporaryError)
        * [func (e *timeoutTemporaryError) Error() string](#timeoutTemporaryError.Error)
* [Functions](#func)
    * [func ishex(c byte) bool](#ishex)
    * [func unhex(c byte) byte](#unhex)
    * [func shouldEscape(c byte, mode encoding) bool](#shouldEscape)
    * [func QueryUnescape(s string) (string, error)](#QueryUnescape)
    * [func PathUnescape(s string) (string, error)](#PathUnescape)
    * [func unescape(s string, mode encoding) (string, error)](#unescape)
    * [func QueryEscape(s string) string](#QueryEscape)
    * [func PathEscape(s string) string](#PathEscape)
    * [func escape(s string, mode encoding) string](#escape)
    * [func getScheme(rawURL string) (scheme, path string, err error)](#getScheme)
    * [func split(s string, sep byte, cutc bool) (string, string)](#split)
    * [func parseHost(host string) (string, error)](#parseHost)
    * [func validEncoded(s string, mode encoding) bool](#validEncoded)
    * [func validOptionalPort(port string) bool](#validOptionalPort)
    * [func parseQuery(m Values, query string) (err error)](#parseQuery)
    * [func resolvePath(base, ref string) string](#resolvePath)
    * [func splitHostPort(hostPort string) (host, port string)](#splitHostPort)
    * [func validUserinfo(s string) bool](#validUserinfo)
    * [func stringContainsCTLByte(s string) bool](#stringContainsCTLByte)
    * [func ufmt(u *URL) string](#ufmt)
    * [func BenchmarkString(b *testing.B)](#BenchmarkString)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestParseRequestURI(t *testing.T)](#TestParseRequestURI)
    * [func TestURLString(t *testing.T)](#TestURLString)
    * [func TestURLRedacted(t *testing.T)](#TestURLRedacted)
    * [func TestUnescape(t *testing.T)](#TestUnescape)
    * [func TestQueryEscape(t *testing.T)](#TestQueryEscape)
    * [func TestPathEscape(t *testing.T)](#TestPathEscape)
    * [func TestEncodeQuery(t *testing.T)](#TestEncodeQuery)
    * [func TestResolvePath(t *testing.T)](#TestResolvePath)
    * [func BenchmarkResolvePath(b *testing.B)](#BenchmarkResolvePath)
    * [func TestResolveReference(t *testing.T)](#TestResolveReference)
    * [func TestQueryValues(t *testing.T)](#TestQueryValues)
    * [func TestParseQuery(t *testing.T)](#TestParseQuery)
    * [func TestRequestURI(t *testing.T)](#TestRequestURI)
    * [func TestParseFailure(t *testing.T)](#TestParseFailure)
    * [func TestParseErrors(t *testing.T)](#TestParseErrors)
    * [func TestStarRequest(t *testing.T)](#TestStarRequest)
    * [func TestShouldEscape(t *testing.T)](#TestShouldEscape)
    * [func TestURLErrorImplementsNetError(t *testing.T)](#TestURLErrorImplementsNetError)
    * [func TestURLHostnameAndPort(t *testing.T)](#TestURLHostnameAndPort)
    * [func TestJSON(t *testing.T)](#TestJSON)
    * [func TestGob(t *testing.T)](#TestGob)
    * [func TestNilUser(t *testing.T)](#TestNilUser)
    * [func TestInvalidUserPassword(t *testing.T)](#TestInvalidUserPassword)
    * [func TestRejectControlCharacters(t *testing.T)](#TestRejectControlCharacters)
    * [func BenchmarkQueryEscape(b *testing.B)](#BenchmarkQueryEscape)
    * [func BenchmarkPathEscape(b *testing.B)](#BenchmarkPathEscape)
    * [func BenchmarkQueryUnescape(b *testing.B)](#BenchmarkQueryUnescape)
    * [func BenchmarkPathUnescape(b *testing.B)](#BenchmarkPathUnescape)
    * [func BenchmarkSplit(b *testing.B)](#BenchmarkSplit)


## <a id="const" href="#const">Constants</a>

### <a id="upperhex" href="#upperhex">const upperhex</a>

```
searchKey: url.upperhex
tags: [private]
```

```Go
const upperhex = "0123456789ABCDEF"
```

### <a id="encodePath" href="#encodePath">const encodePath</a>

```
searchKey: url.encodePath
tags: [private]
```

```Go
const encodePath encoding = 1 + iota
```

### <a id="encodePathSegment" href="#encodePathSegment">const encodePathSegment</a>

```
searchKey: url.encodePathSegment
tags: [private]
```

```Go
const encodePathSegment
```

### <a id="encodeHost" href="#encodeHost">const encodeHost</a>

```
searchKey: url.encodeHost
tags: [private]
```

```Go
const encodeHost
```

### <a id="encodeZone" href="#encodeZone">const encodeZone</a>

```
searchKey: url.encodeZone
tags: [private]
```

```Go
const encodeZone
```

### <a id="encodeUserPassword" href="#encodeUserPassword">const encodeUserPassword</a>

```
searchKey: url.encodeUserPassword
tags: [private]
```

```Go
const encodeUserPassword
```

### <a id="encodeQueryComponent" href="#encodeQueryComponent">const encodeQueryComponent</a>

```
searchKey: url.encodeQueryComponent
tags: [private]
```

```Go
const encodeQueryComponent
```

### <a id="encodeFragment" href="#encodeFragment">const encodeFragment</a>

```
searchKey: url.encodeFragment
tags: [private]
```

```Go
const encodeFragment
```

### <a id="pathThatLooksSchemeRelative" href="#pathThatLooksSchemeRelative">const pathThatLooksSchemeRelative</a>

```
searchKey: url.pathThatLooksSchemeRelative
tags: [private]
```

```Go
const pathThatLooksSchemeRelative = "//not.a.user@not.a.host/just/a/path"
```

## <a id="var" href="#var">Variables</a>

### <a id="urltests" href="#urltests">var urltests</a>

```
searchKey: url.urltests
tags: [private]
```

```Go
var urltests = ...
```

### <a id="parseRequestURLTests" href="#parseRequestURLTests">var parseRequestURLTests</a>

```
searchKey: url.parseRequestURLTests
tags: [private]
```

```Go
var parseRequestURLTests = ...
```

### <a id="stringURLTests" href="#stringURLTests">var stringURLTests</a>

```
searchKey: url.stringURLTests
tags: [private]
```

```Go
var stringURLTests = ...
```

### <a id="unescapeTests" href="#unescapeTests">var unescapeTests</a>

```
searchKey: url.unescapeTests
tags: [private]
```

```Go
var unescapeTests = ...
```

### <a id="queryEscapeTests" href="#queryEscapeTests">var queryEscapeTests</a>

```
searchKey: url.queryEscapeTests
tags: [private]
```

```Go
var queryEscapeTests = ...
```

### <a id="pathEscapeTests" href="#pathEscapeTests">var pathEscapeTests</a>

```
searchKey: url.pathEscapeTests
tags: [private]
```

```Go
var pathEscapeTests = ...
```

### <a id="encodeQueryTests" href="#encodeQueryTests">var encodeQueryTests</a>

```
searchKey: url.encodeQueryTests
tags: [private]
```

```Go
var encodeQueryTests = ...
```

### <a id="resolvePathTests" href="#resolvePathTests">var resolvePathTests</a>

```
searchKey: url.resolvePathTests
tags: [private]
```

```Go
var resolvePathTests = ...
```

### <a id="resolveReferenceTests" href="#resolveReferenceTests">var resolveReferenceTests</a>

```
searchKey: url.resolveReferenceTests
tags: [private]
```

```Go
var resolveReferenceTests = ...
```

### <a id="parseTests" href="#parseTests">var parseTests</a>

```
searchKey: url.parseTests
tags: [private]
```

```Go
var parseTests = ...
```

### <a id="requritests" href="#requritests">var requritests</a>

```
searchKey: url.requritests
tags: [private]
```

```Go
var requritests = ...
```

### <a id="shouldEscapeTests" href="#shouldEscapeTests">var shouldEscapeTests</a>

```
searchKey: url.shouldEscapeTests
tags: [private]
```

```Go
var shouldEscapeTests = ...
```

### <a id="netErrorTests" href="#netErrorTests">var netErrorTests</a>

```
searchKey: url.netErrorTests
tags: [private]
```

```Go
var netErrorTests = ...
```

### <a id="escapeBenchmarks" href="#escapeBenchmarks">var escapeBenchmarks</a>

```
searchKey: url.escapeBenchmarks
tags: [private]
```

```Go
var escapeBenchmarks = ...
```

### <a id="sink" href="#sink">var sink</a>

```
searchKey: url.sink
tags: [private]
```

```Go
var sink string
```

## <a id="type" href="#type">Types</a>

### <a id="Error" href="#Error">type Error struct</a>

```
searchKey: url.Error
```

```Go
type Error struct {
	Op  string
	URL string
	Err error
}
```

Error reports an error and the operation and URL that caused it. 

#### <a id="Error.Unwrap" href="#Error.Unwrap">func (e *Error) Unwrap() error</a>

```
searchKey: url.Error.Unwrap
```

```Go
func (e *Error) Unwrap() error
```

#### <a id="Error.Error" href="#Error.Error">func (e *Error) Error() string</a>

```
searchKey: url.Error.Error
```

```Go
func (e *Error) Error() string
```

#### <a id="Error.Timeout" href="#Error.Timeout">func (e *Error) Timeout() bool</a>

```
searchKey: url.Error.Timeout
```

```Go
func (e *Error) Timeout() bool
```

#### <a id="Error.Temporary" href="#Error.Temporary">func (e *Error) Temporary() bool</a>

```
searchKey: url.Error.Temporary
```

```Go
func (e *Error) Temporary() bool
```

### <a id="encoding" href="#encoding">type encoding int</a>

```
searchKey: url.encoding
tags: [private]
```

```Go
type encoding int
```

### <a id="EscapeError" href="#EscapeError">type EscapeError string</a>

```
searchKey: url.EscapeError
```

```Go
type EscapeError string
```

#### <a id="EscapeError.Error" href="#EscapeError.Error">func (e EscapeError) Error() string</a>

```
searchKey: url.EscapeError.Error
```

```Go
func (e EscapeError) Error() string
```

### <a id="InvalidHostError" href="#InvalidHostError">type InvalidHostError string</a>

```
searchKey: url.InvalidHostError
```

```Go
type InvalidHostError string
```

#### <a id="InvalidHostError.Error" href="#InvalidHostError.Error">func (e InvalidHostError) Error() string</a>

```
searchKey: url.InvalidHostError.Error
```

```Go
func (e InvalidHostError) Error() string
```

### <a id="URL" href="#URL">type URL struct</a>

```
searchKey: url.URL
```

```Go
type URL struct {
	Scheme      string
	Opaque      string    // encoded opaque data
	User        *Userinfo // username and password information
	Host        string    // host or host:port
	Path        string    // path (relative paths may omit leading slash)
	RawPath     string    // encoded path hint (see EscapedPath method)
	ForceQuery  bool      // append a query ('?') even if RawQuery is empty
	RawQuery    string    // encoded query values, without '?'
	Fragment    string    // fragment for references, without '#'
	RawFragment string    // encoded fragment hint (see EscapedFragment method)
}
```

A URL represents a parsed URL (technically, a URI reference). 

The general form represented is: 

```
[scheme:][//[userinfo@]host][/]path[?query][#fragment]

```
URLs that do not start with a slash after the scheme are interpreted as: 

```
scheme:opaque[?query][#fragment]

```
Note that the Path field is stored in decoded form: /%47%6f%2f becomes /Go/. A consequence is that it is impossible to tell which slashes in the Path were slashes in the raw URL and which were %2f. This distinction is rarely important, but when it is, the code should use RawPath, an optional field which only gets set if the default encoding is different from Path. 

URL's String method uses the EscapedPath method to obtain the path. See the EscapedPath method for more details. 

#### <a id="Parse" href="#Parse">func Parse(rawURL string) (*URL, error)</a>

```
searchKey: url.Parse
```

```Go
func Parse(rawURL string) (*URL, error)
```

Parse parses a raw url into a URL structure. 

The url may be relative (a path, without a host) or absolute (starting with a scheme). Trying to parse a hostname and path without a scheme is invalid but may not necessarily return an error, due to parsing ambiguities. 

#### <a id="ParseRequestURI" href="#ParseRequestURI">func ParseRequestURI(rawURL string) (*URL, error)</a>

```
searchKey: url.ParseRequestURI
```

```Go
func ParseRequestURI(rawURL string) (*URL, error)
```

ParseRequestURI parses a raw url into a URL structure. It assumes that url was received in an HTTP request, so the url is interpreted only as an absolute URI or an absolute path. The string url is assumed not to have a #fragment suffix. (Web browsers strip #fragment before sending the URL to a web server.) 

#### <a id="parse" href="#parse">func parse(rawURL string, viaRequest bool) (*URL, error)</a>

```
searchKey: url.parse
tags: [private]
```

```Go
func parse(rawURL string, viaRequest bool) (*URL, error)
```

parse parses a URL from a string in one of two contexts. If viaRequest is true, the URL is assumed to have arrived via an HTTP request, in which case only absolute URLs or path-absolute relative URLs are allowed. If viaRequest is false, all forms of relative URLs are allowed. 

#### <a id="URL.setPath" href="#URL.setPath">func (u *URL) setPath(p string) error</a>

```
searchKey: url.URL.setPath
tags: [private]
```

```Go
func (u *URL) setPath(p string) error
```

setPath sets the Path and RawPath fields of the URL based on the provided escaped path p. It maintains the invariant that RawPath is only specified when it differs from the default encoding of the path. For example: - setPath("/foo/bar")   will set Path="/foo/bar" and RawPath="" - setPath("/foo%2fbar") will set Path="/foo/bar" and RawPath="/foo%2fbar" setPath will return an error only if the provided path contains an invalid escaping. 

#### <a id="URL.EscapedPath" href="#URL.EscapedPath">func (u *URL) EscapedPath() string</a>

```
searchKey: url.URL.EscapedPath
```

```Go
func (u *URL) EscapedPath() string
```

EscapedPath returns the escaped form of u.Path. In general there are multiple possible escaped forms of any path. EscapedPath returns u.RawPath when it is a valid escaping of u.Path. Otherwise EscapedPath ignores u.RawPath and computes an escaped form on its own. The String and RequestURI methods use EscapedPath to construct their results. In general, code should call EscapedPath instead of reading u.RawPath directly. 

#### <a id="URL.setFragment" href="#URL.setFragment">func (u *URL) setFragment(f string) error</a>

```
searchKey: url.URL.setFragment
tags: [private]
```

```Go
func (u *URL) setFragment(f string) error
```

setFragment is like setPath but for Fragment/RawFragment. 

#### <a id="URL.EscapedFragment" href="#URL.EscapedFragment">func (u *URL) EscapedFragment() string</a>

```
searchKey: url.URL.EscapedFragment
```

```Go
func (u *URL) EscapedFragment() string
```

EscapedFragment returns the escaped form of u.Fragment. In general there are multiple possible escaped forms of any fragment. EscapedFragment returns u.RawFragment when it is a valid escaping of u.Fragment. Otherwise EscapedFragment ignores u.RawFragment and computes an escaped form on its own. The String method uses EscapedFragment to construct its result. In general, code should call EscapedFragment instead of reading u.RawFragment directly. 

#### <a id="URL.String" href="#URL.String">func (u *URL) String() string</a>

```
searchKey: url.URL.String
```

```Go
func (u *URL) String() string
```

String reassembles the URL into a valid URL string. The general form of the result is one of: 

```
scheme:opaque?query#fragment
scheme://userinfo@host/path?query#fragment

```
If u.Opaque is non-empty, String uses the first form; otherwise it uses the second form. Any non-ASCII characters in host are escaped. To obtain the path, String uses u.EscapedPath(). 

In the second form, the following rules apply: 

```
- if u.Scheme is empty, scheme: is omitted.
- if u.User is nil, userinfo@ is omitted.
- if u.Host is empty, host/ is omitted.
- if u.Scheme and u.Host are empty and u.User is nil,
   the entire scheme://userinfo@host/ is omitted.
- if u.Host is non-empty and u.Path begins with a /,
   the form host/path does not add its own /.
- if u.RawQuery is empty, ?query is omitted.
- if u.Fragment is empty, #fragment is omitted.

```
#### <a id="URL.Redacted" href="#URL.Redacted">func (u *URL) Redacted() string</a>

```
searchKey: url.URL.Redacted
```

```Go
func (u *URL) Redacted() string
```

Redacted is like String but replaces any password with "xxxxx". Only the password in u.URL is redacted. 

#### <a id="URL.IsAbs" href="#URL.IsAbs">func (u *URL) IsAbs() bool</a>

```
searchKey: url.URL.IsAbs
```

```Go
func (u *URL) IsAbs() bool
```

IsAbs reports whether the URL is absolute. Absolute means that it has a non-empty scheme. 

#### <a id="URL.Parse" href="#URL.Parse">func (u *URL) Parse(ref string) (*URL, error)</a>

```
searchKey: url.URL.Parse
```

```Go
func (u *URL) Parse(ref string) (*URL, error)
```

Parse parses a URL in the context of the receiver. The provided URL may be relative or absolute. Parse returns nil, err on parse failure, otherwise its return value is the same as ResolveReference. 

#### <a id="URL.ResolveReference" href="#URL.ResolveReference">func (u *URL) ResolveReference(ref *URL) *URL</a>

```
searchKey: url.URL.ResolveReference
```

```Go
func (u *URL) ResolveReference(ref *URL) *URL
```

ResolveReference resolves a URI reference to an absolute URI from an absolute base URI u, per RFC 3986 Section 5.2. The URI reference may be relative or absolute. ResolveReference always returns a new URL instance, even if the returned URL is identical to either the base or reference. If ref is an absolute URL, then ResolveReference ignores base and returns a copy of ref. 

#### <a id="URL.Query" href="#URL.Query">func (u *URL) Query() Values</a>

```
searchKey: url.URL.Query
```

```Go
func (u *URL) Query() Values
```

Query parses RawQuery and returns the corresponding values. It silently discards malformed value pairs. To check errors use ParseQuery. 

#### <a id="URL.RequestURI" href="#URL.RequestURI">func (u *URL) RequestURI() string</a>

```
searchKey: url.URL.RequestURI
```

```Go
func (u *URL) RequestURI() string
```

RequestURI returns the encoded path?query or opaque?query string that would be used in an HTTP request for u. 

#### <a id="URL.Hostname" href="#URL.Hostname">func (u *URL) Hostname() string</a>

```
searchKey: url.URL.Hostname
```

```Go
func (u *URL) Hostname() string
```

Hostname returns u.Host, stripping any valid port number if present. 

If the result is enclosed in square brackets, as literal IPv6 addresses are, the square brackets are removed from the result. 

#### <a id="URL.Port" href="#URL.Port">func (u *URL) Port() string</a>

```
searchKey: url.URL.Port
```

```Go
func (u *URL) Port() string
```

Port returns the port part of u.Host, without the leading colon. 

If u.Host doesn't contain a valid numeric port, Port returns an empty string. 

#### <a id="URL.MarshalBinary" href="#URL.MarshalBinary">func (u *URL) MarshalBinary() (text []byte, err error)</a>

```
searchKey: url.URL.MarshalBinary
```

```Go
func (u *URL) MarshalBinary() (text []byte, err error)
```

#### <a id="URL.UnmarshalBinary" href="#URL.UnmarshalBinary">func (u *URL) UnmarshalBinary(text []byte) error</a>

```
searchKey: url.URL.UnmarshalBinary
```

```Go
func (u *URL) UnmarshalBinary(text []byte) error
```

### <a id="Userinfo" href="#Userinfo">type Userinfo struct</a>

```
searchKey: url.Userinfo
```

```Go
type Userinfo struct {
	username    string
	password    string
	passwordSet bool
}
```

The Userinfo type is an immutable encapsulation of username and password details for a URL. An existing Userinfo value is guaranteed to have a username set (potentially empty, as allowed by RFC 2396), and optionally a password. 

#### <a id="User" href="#User">func User(username string) *Userinfo</a>

```
searchKey: url.User
```

```Go
func User(username string) *Userinfo
```

User returns a Userinfo containing the provided username and no password set. 

#### <a id="UserPassword" href="#UserPassword">func UserPassword(username, password string) *Userinfo</a>

```
searchKey: url.UserPassword
```

```Go
func UserPassword(username, password string) *Userinfo
```

UserPassword returns a Userinfo containing the provided username and password. 

This functionality should only be used with legacy web sites. RFC 2396 warns that interpreting Userinfo this way `is NOT RECOMMENDED, because the passing of authentication information in clear text (such as URI) has proven to be a security risk in almost every case where it has been used.' 

#### <a id="parseAuthority" href="#parseAuthority">func parseAuthority(authority string) (user *Userinfo, host string, err error)</a>

```
searchKey: url.parseAuthority
tags: [private]
```

```Go
func parseAuthority(authority string) (user *Userinfo, host string, err error)
```

#### <a id="Userinfo.Username" href="#Userinfo.Username">func (u *Userinfo) Username() string</a>

```
searchKey: url.Userinfo.Username
```

```Go
func (u *Userinfo) Username() string
```

Username returns the username. 

#### <a id="Userinfo.Password" href="#Userinfo.Password">func (u *Userinfo) Password() (string, bool)</a>

```
searchKey: url.Userinfo.Password
```

```Go
func (u *Userinfo) Password() (string, bool)
```

Password returns the password in case it is set, and whether it is set. 

#### <a id="Userinfo.String" href="#Userinfo.String">func (u *Userinfo) String() string</a>

```
searchKey: url.Userinfo.String
```

```Go
func (u *Userinfo) String() string
```

String returns the encoded userinfo information in the standard form of "username[:password]". 

### <a id="Values" href="#Values">type Values map[string][]string</a>

```
searchKey: url.Values
```

```Go
type Values map[string][]string
```

Values maps a string key to a list of values. It is typically used for query parameters and form values. Unlike in the http.Header map, the keys in a Values map are case-sensitive. 

#### <a id="ParseQuery" href="#ParseQuery">func ParseQuery(query string) (Values, error)</a>

```
searchKey: url.ParseQuery
```

```Go
func ParseQuery(query string) (Values, error)
```

ParseQuery parses the URL-encoded query string and returns a map listing the values specified for each key. ParseQuery always returns a non-nil map containing all the valid query parameters found; err describes the first decoding error encountered, if any. 

Query is expected to be a list of key=value settings separated by ampersands. A setting without an equals sign is interpreted as a key set to an empty value. Settings containing a non-URL-encoded semicolon are considered invalid. 

#### <a id="Values.Get" href="#Values.Get">func (v Values) Get(key string) string</a>

```
searchKey: url.Values.Get
```

```Go
func (v Values) Get(key string) string
```

Get gets the first value associated with the given key. If there are no values associated with the key, Get returns the empty string. To access multiple values, use the map directly. 

#### <a id="Values.Set" href="#Values.Set">func (v Values) Set(key, value string)</a>

```
searchKey: url.Values.Set
```

```Go
func (v Values) Set(key, value string)
```

Set sets the key to value. It replaces any existing values. 

#### <a id="Values.Add" href="#Values.Add">func (v Values) Add(key, value string)</a>

```
searchKey: url.Values.Add
```

```Go
func (v Values) Add(key, value string)
```

Add adds the value to key. It appends to any existing values associated with key. 

#### <a id="Values.Del" href="#Values.Del">func (v Values) Del(key string)</a>

```
searchKey: url.Values.Del
```

```Go
func (v Values) Del(key string)
```

Del deletes the values associated with key. 

#### <a id="Values.Has" href="#Values.Has">func (v Values) Has(key string) bool</a>

```
searchKey: url.Values.Has
```

```Go
func (v Values) Has(key string) bool
```

Has checks whether a given key is set. 

#### <a id="Values.Encode" href="#Values.Encode">func (v Values) Encode() string</a>

```
searchKey: url.Values.Encode
```

```Go
func (v Values) Encode() string
```

Encode encodes the values into `URL encoded' form ("bar=baz&foo=quux") sorted by key. 

### <a id="URLTest" href="#URLTest">type URLTest struct</a>

```
searchKey: url.URLTest
tags: [private]
```

```Go
type URLTest struct {
	in        string
	out       *URL   // expected parse
	roundtrip string // expected result of reserializing the URL; empty means same as "in".
}
```

### <a id="EscapeTest" href="#EscapeTest">type EscapeTest struct</a>

```
searchKey: url.EscapeTest
tags: [private]
```

```Go
type EscapeTest struct {
	in  string
	out string
	err error
}
```

### <a id="EncodeQueryTest" href="#EncodeQueryTest">type EncodeQueryTest struct</a>

```
searchKey: url.EncodeQueryTest
tags: [private]
```

```Go
type EncodeQueryTest struct {
	m        Values
	expected string
}
```

### <a id="parseTest" href="#parseTest">type parseTest struct</a>

```
searchKey: url.parseTest
tags: [private]
```

```Go
type parseTest struct {
	query string
	out   Values
	ok    bool
}
```

### <a id="RequestURITest" href="#RequestURITest">type RequestURITest struct</a>

```
searchKey: url.RequestURITest
tags: [private]
```

```Go
type RequestURITest struct {
	url *URL
	out string
}
```

### <a id="shouldEscapeTest" href="#shouldEscapeTest">type shouldEscapeTest struct</a>

```
searchKey: url.shouldEscapeTest
tags: [private]
```

```Go
type shouldEscapeTest struct {
	in     byte
	mode   encoding
	escape bool
}
```

### <a id="timeoutError" href="#timeoutError">type timeoutError struct</a>

```
searchKey: url.timeoutError
tags: [private]
```

```Go
type timeoutError struct {
	timeout bool
}
```

#### <a id="timeoutError.Error" href="#timeoutError.Error">func (e *timeoutError) Error() string</a>

```
searchKey: url.timeoutError.Error
tags: [private]
```

```Go
func (e *timeoutError) Error() string
```

#### <a id="timeoutError.Timeout" href="#timeoutError.Timeout">func (e *timeoutError) Timeout() bool</a>

```
searchKey: url.timeoutError.Timeout
tags: [private]
```

```Go
func (e *timeoutError) Timeout() bool
```

### <a id="temporaryError" href="#temporaryError">type temporaryError struct</a>

```
searchKey: url.temporaryError
tags: [private]
```

```Go
type temporaryError struct {
	temporary bool
}
```

#### <a id="temporaryError.Error" href="#temporaryError.Error">func (e *temporaryError) Error() string</a>

```
searchKey: url.temporaryError.Error
tags: [private]
```

```Go
func (e *temporaryError) Error() string
```

#### <a id="temporaryError.Temporary" href="#temporaryError.Temporary">func (e *temporaryError) Temporary() bool</a>

```
searchKey: url.temporaryError.Temporary
tags: [private]
```

```Go
func (e *temporaryError) Temporary() bool
```

### <a id="timeoutTemporaryError" href="#timeoutTemporaryError">type timeoutTemporaryError struct</a>

```
searchKey: url.timeoutTemporaryError
tags: [private]
```

```Go
type timeoutTemporaryError struct {
	timeoutError
	temporaryError
}
```

#### <a id="timeoutTemporaryError.Error" href="#timeoutTemporaryError.Error">func (e *timeoutTemporaryError) Error() string</a>

```
searchKey: url.timeoutTemporaryError.Error
tags: [private]
```

```Go
func (e *timeoutTemporaryError) Error() string
```

## <a id="func" href="#func">Functions</a>

### <a id="ishex" href="#ishex">func ishex(c byte) bool</a>

```
searchKey: url.ishex
tags: [private]
```

```Go
func ishex(c byte) bool
```

### <a id="unhex" href="#unhex">func unhex(c byte) byte</a>

```
searchKey: url.unhex
tags: [private]
```

```Go
func unhex(c byte) byte
```

### <a id="shouldEscape" href="#shouldEscape">func shouldEscape(c byte, mode encoding) bool</a>

```
searchKey: url.shouldEscape
tags: [private]
```

```Go
func shouldEscape(c byte, mode encoding) bool
```

Return true if the specified character should be escaped when appearing in a URL string, according to RFC 3986. 

Please be informed that for now shouldEscape does not check all reserved characters correctly. See golang.org/issue/5684. 

### <a id="QueryUnescape" href="#QueryUnescape">func QueryUnescape(s string) (string, error)</a>

```
searchKey: url.QueryUnescape
```

```Go
func QueryUnescape(s string) (string, error)
```

QueryUnescape does the inverse transformation of QueryEscape, converting each 3-byte encoded substring of the form "%AB" into the hex-decoded byte 0xAB. It returns an error if any % is not followed by two hexadecimal digits. 

### <a id="PathUnescape" href="#PathUnescape">func PathUnescape(s string) (string, error)</a>

```
searchKey: url.PathUnescape
```

```Go
func PathUnescape(s string) (string, error)
```

PathUnescape does the inverse transformation of PathEscape, converting each 3-byte encoded substring of the form "%AB" into the hex-decoded byte 0xAB. It returns an error if any % is not followed by two hexadecimal digits. 

PathUnescape is identical to QueryUnescape except that it does not unescape '+' to ' ' (space). 

### <a id="unescape" href="#unescape">func unescape(s string, mode encoding) (string, error)</a>

```
searchKey: url.unescape
tags: [private]
```

```Go
func unescape(s string, mode encoding) (string, error)
```

unescape unescapes a string; the mode specifies which section of the URL string is being unescaped. 

### <a id="QueryEscape" href="#QueryEscape">func QueryEscape(s string) string</a>

```
searchKey: url.QueryEscape
```

```Go
func QueryEscape(s string) string
```

QueryEscape escapes the string so it can be safely placed inside a URL query. 

### <a id="PathEscape" href="#PathEscape">func PathEscape(s string) string</a>

```
searchKey: url.PathEscape
```

```Go
func PathEscape(s string) string
```

PathEscape escapes the string so it can be safely placed inside a URL path segment, replacing special characters (including /) with %XX sequences as needed. 

### <a id="escape" href="#escape">func escape(s string, mode encoding) string</a>

```
searchKey: url.escape
tags: [private]
```

```Go
func escape(s string, mode encoding) string
```

### <a id="getScheme" href="#getScheme">func getScheme(rawURL string) (scheme, path string, err error)</a>

```
searchKey: url.getScheme
tags: [private]
```

```Go
func getScheme(rawURL string) (scheme, path string, err error)
```

Maybe rawURL is of the form scheme:path. (Scheme must be [a-zA-Z][a-zA-Z0-9+-.]*) If so, return scheme, path; else return "", rawURL. 

### <a id="split" href="#split">func split(s string, sep byte, cutc bool) (string, string)</a>

```
searchKey: url.split
tags: [private]
```

```Go
func split(s string, sep byte, cutc bool) (string, string)
```

split slices s into two substrings separated by the first occurrence of sep. If cutc is true then sep is excluded from the second substring. If sep does not occur in s then s and the empty string is returned. 

### <a id="parseHost" href="#parseHost">func parseHost(host string) (string, error)</a>

```
searchKey: url.parseHost
tags: [private]
```

```Go
func parseHost(host string) (string, error)
```

parseHost parses host as an authority without user information. That is, as host[:port]. 

### <a id="validEncoded" href="#validEncoded">func validEncoded(s string, mode encoding) bool</a>

```
searchKey: url.validEncoded
tags: [private]
```

```Go
func validEncoded(s string, mode encoding) bool
```

validEncoded reports whether s is a valid encoded path or fragment, according to mode. It must not contain any bytes that require escaping during encoding. 

### <a id="validOptionalPort" href="#validOptionalPort">func validOptionalPort(port string) bool</a>

```
searchKey: url.validOptionalPort
tags: [private]
```

```Go
func validOptionalPort(port string) bool
```

validOptionalPort reports whether port is either an empty string or matches /^:\d*$/ 

### <a id="parseQuery" href="#parseQuery">func parseQuery(m Values, query string) (err error)</a>

```
searchKey: url.parseQuery
tags: [private]
```

```Go
func parseQuery(m Values, query string) (err error)
```

### <a id="resolvePath" href="#resolvePath">func resolvePath(base, ref string) string</a>

```
searchKey: url.resolvePath
tags: [private]
```

```Go
func resolvePath(base, ref string) string
```

resolvePath applies special path segments from refs and applies them to base, per RFC 3986. 

### <a id="splitHostPort" href="#splitHostPort">func splitHostPort(hostPort string) (host, port string)</a>

```
searchKey: url.splitHostPort
tags: [private]
```

```Go
func splitHostPort(hostPort string) (host, port string)
```

splitHostPort separates host and port. If the port is not valid, it returns the entire input as host, and it doesn't check the validity of the host. Unlike net.SplitHostPort, but per RFC 3986, it requires ports to be numeric. 

### <a id="validUserinfo" href="#validUserinfo">func validUserinfo(s string) bool</a>

```
searchKey: url.validUserinfo
tags: [private]
```

```Go
func validUserinfo(s string) bool
```

validUserinfo reports whether s is a valid userinfo string per RFC 3986 Section 3.2.1: 

```
userinfo    = *( unreserved / pct-encoded / sub-delims / ":" )
unreserved  = ALPHA / DIGIT / "-" / "." / "_" / "~"
sub-delims  = "!" / "$" / "&" / "'" / "(" / ")"
              / "*" / "+" / "," / ";" / "="

```
It doesn't validate pct-encoded. The caller does that via func unescape. 

### <a id="stringContainsCTLByte" href="#stringContainsCTLByte">func stringContainsCTLByte(s string) bool</a>

```
searchKey: url.stringContainsCTLByte
tags: [private]
```

```Go
func stringContainsCTLByte(s string) bool
```

stringContainsCTLByte reports whether s contains any ASCII control character. 

### <a id="ufmt" href="#ufmt">func ufmt(u *URL) string</a>

```
searchKey: url.ufmt
tags: [private]
```

```Go
func ufmt(u *URL) string
```

more useful string for debugging than fmt's struct printer 

### <a id="BenchmarkString" href="#BenchmarkString">func BenchmarkString(b *testing.B)</a>

```
searchKey: url.BenchmarkString
tags: [private]
```

```Go
func BenchmarkString(b *testing.B)
```

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: url.TestParse
tags: [private]
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestParseRequestURI" href="#TestParseRequestURI">func TestParseRequestURI(t *testing.T)</a>

```
searchKey: url.TestParseRequestURI
tags: [private]
```

```Go
func TestParseRequestURI(t *testing.T)
```

### <a id="TestURLString" href="#TestURLString">func TestURLString(t *testing.T)</a>

```
searchKey: url.TestURLString
tags: [private]
```

```Go
func TestURLString(t *testing.T)
```

### <a id="TestURLRedacted" href="#TestURLRedacted">func TestURLRedacted(t *testing.T)</a>

```
searchKey: url.TestURLRedacted
tags: [private]
```

```Go
func TestURLRedacted(t *testing.T)
```

### <a id="TestUnescape" href="#TestUnescape">func TestUnescape(t *testing.T)</a>

```
searchKey: url.TestUnescape
tags: [private]
```

```Go
func TestUnescape(t *testing.T)
```

### <a id="TestQueryEscape" href="#TestQueryEscape">func TestQueryEscape(t *testing.T)</a>

```
searchKey: url.TestQueryEscape
tags: [private]
```

```Go
func TestQueryEscape(t *testing.T)
```

### <a id="TestPathEscape" href="#TestPathEscape">func TestPathEscape(t *testing.T)</a>

```
searchKey: url.TestPathEscape
tags: [private]
```

```Go
func TestPathEscape(t *testing.T)
```

### <a id="TestEncodeQuery" href="#TestEncodeQuery">func TestEncodeQuery(t *testing.T)</a>

```
searchKey: url.TestEncodeQuery
tags: [private]
```

```Go
func TestEncodeQuery(t *testing.T)
```

### <a id="TestResolvePath" href="#TestResolvePath">func TestResolvePath(t *testing.T)</a>

```
searchKey: url.TestResolvePath
tags: [private]
```

```Go
func TestResolvePath(t *testing.T)
```

### <a id="BenchmarkResolvePath" href="#BenchmarkResolvePath">func BenchmarkResolvePath(b *testing.B)</a>

```
searchKey: url.BenchmarkResolvePath
tags: [private]
```

```Go
func BenchmarkResolvePath(b *testing.B)
```

### <a id="TestResolveReference" href="#TestResolveReference">func TestResolveReference(t *testing.T)</a>

```
searchKey: url.TestResolveReference
tags: [private]
```

```Go
func TestResolveReference(t *testing.T)
```

### <a id="TestQueryValues" href="#TestQueryValues">func TestQueryValues(t *testing.T)</a>

```
searchKey: url.TestQueryValues
tags: [private]
```

```Go
func TestQueryValues(t *testing.T)
```

### <a id="TestParseQuery" href="#TestParseQuery">func TestParseQuery(t *testing.T)</a>

```
searchKey: url.TestParseQuery
tags: [private]
```

```Go
func TestParseQuery(t *testing.T)
```

### <a id="TestRequestURI" href="#TestRequestURI">func TestRequestURI(t *testing.T)</a>

```
searchKey: url.TestRequestURI
tags: [private]
```

```Go
func TestRequestURI(t *testing.T)
```

### <a id="TestParseFailure" href="#TestParseFailure">func TestParseFailure(t *testing.T)</a>

```
searchKey: url.TestParseFailure
tags: [private]
```

```Go
func TestParseFailure(t *testing.T)
```

### <a id="TestParseErrors" href="#TestParseErrors">func TestParseErrors(t *testing.T)</a>

```
searchKey: url.TestParseErrors
tags: [private]
```

```Go
func TestParseErrors(t *testing.T)
```

### <a id="TestStarRequest" href="#TestStarRequest">func TestStarRequest(t *testing.T)</a>

```
searchKey: url.TestStarRequest
tags: [private]
```

```Go
func TestStarRequest(t *testing.T)
```

Issue 11202 

### <a id="TestShouldEscape" href="#TestShouldEscape">func TestShouldEscape(t *testing.T)</a>

```
searchKey: url.TestShouldEscape
tags: [private]
```

```Go
func TestShouldEscape(t *testing.T)
```

### <a id="TestURLErrorImplementsNetError" href="#TestURLErrorImplementsNetError">func TestURLErrorImplementsNetError(t *testing.T)</a>

```
searchKey: url.TestURLErrorImplementsNetError
tags: [private]
```

```Go
func TestURLErrorImplementsNetError(t *testing.T)
```

Test that url.Error implements net.Error and that it forwards 

### <a id="TestURLHostnameAndPort" href="#TestURLHostnameAndPort">func TestURLHostnameAndPort(t *testing.T)</a>

```
searchKey: url.TestURLHostnameAndPort
tags: [private]
```

```Go
func TestURLHostnameAndPort(t *testing.T)
```

### <a id="TestJSON" href="#TestJSON">func TestJSON(t *testing.T)</a>

```
searchKey: url.TestJSON
tags: [private]
```

```Go
func TestJSON(t *testing.T)
```

### <a id="TestGob" href="#TestGob">func TestGob(t *testing.T)</a>

```
searchKey: url.TestGob
tags: [private]
```

```Go
func TestGob(t *testing.T)
```

### <a id="TestNilUser" href="#TestNilUser">func TestNilUser(t *testing.T)</a>

```
searchKey: url.TestNilUser
tags: [private]
```

```Go
func TestNilUser(t *testing.T)
```

### <a id="TestInvalidUserPassword" href="#TestInvalidUserPassword">func TestInvalidUserPassword(t *testing.T)</a>

```
searchKey: url.TestInvalidUserPassword
tags: [private]
```

```Go
func TestInvalidUserPassword(t *testing.T)
```

### <a id="TestRejectControlCharacters" href="#TestRejectControlCharacters">func TestRejectControlCharacters(t *testing.T)</a>

```
searchKey: url.TestRejectControlCharacters
tags: [private]
```

```Go
func TestRejectControlCharacters(t *testing.T)
```

### <a id="BenchmarkQueryEscape" href="#BenchmarkQueryEscape">func BenchmarkQueryEscape(b *testing.B)</a>

```
searchKey: url.BenchmarkQueryEscape
tags: [private]
```

```Go
func BenchmarkQueryEscape(b *testing.B)
```

### <a id="BenchmarkPathEscape" href="#BenchmarkPathEscape">func BenchmarkPathEscape(b *testing.B)</a>

```
searchKey: url.BenchmarkPathEscape
tags: [private]
```

```Go
func BenchmarkPathEscape(b *testing.B)
```

### <a id="BenchmarkQueryUnescape" href="#BenchmarkQueryUnescape">func BenchmarkQueryUnescape(b *testing.B)</a>

```
searchKey: url.BenchmarkQueryUnescape
tags: [private]
```

```Go
func BenchmarkQueryUnescape(b *testing.B)
```

### <a id="BenchmarkPathUnescape" href="#BenchmarkPathUnescape">func BenchmarkPathUnescape(b *testing.B)</a>

```
searchKey: url.BenchmarkPathUnescape
tags: [private]
```

```Go
func BenchmarkPathUnescape(b *testing.B)
```

### <a id="BenchmarkSplit" href="#BenchmarkSplit">func BenchmarkSplit(b *testing.B)</a>

```
searchKey: url.BenchmarkSplit
tags: [private]
```

```Go
func BenchmarkSplit(b *testing.B)
```

