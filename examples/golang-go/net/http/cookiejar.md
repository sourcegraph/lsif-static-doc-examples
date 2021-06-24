# Package cookiejar

Package cookiejar implements an in-memory RFC 6265-compliant http.CookieJar. 

## Index

* [Constants](#const)
    * [const acePrefix](#acePrefix)
    * [const base](#base)
    * [const damp](#damp)
    * [const initialBias](#initialBias)
    * [const initialN](#initialN)
    * [const skew](#skew)
    * [const tmax](#tmax)
    * [const tmin](#tmin)
* [Variables](#var)
    * [var basicsTests](#basicsTests)
    * [var canonicalHostTests](#canonicalHostTests)
    * [var chromiumBasicsTests](#chromiumBasicsTests)
    * [var chromiumDeletionTests](#chromiumDeletionTests)
    * [var chromiumDomainTests](#chromiumDomainTests)
    * [var defaultPathTests](#defaultPathTests)
    * [var domainAndTypeTests](#domainAndTypeTests)
    * [var domainHandlingTests](#domainHandlingTests)
    * [var endOfTime](#endOfTime)
    * [var errIllegalDomain](#errIllegalDomain)
    * [var errMalformedDomain](#errMalformedDomain)
    * [var errNoHostname](#errNoHostname)
    * [var hasDotSuffixTests](#hasDotSuffixTests)
    * [var hasPortTests](#hasPortTests)
    * [var isIPTests](#isIPTests)
    * [var jarKeyNilPSLTests](#jarKeyNilPSLTests)
    * [var jarKeyTests](#jarKeyTests)
    * [var punycodeTestCases](#punycodeTestCases)
    * [var tNow](#tNow)
    * [var updateAndDeleteTests](#updateAndDeleteTests)
* [Types](#type)
    * [type Jar struct](#Jar)
        * [func New(o *Options) (*Jar, error)](#New)
        * [func newTestJar() *Jar](#newTestJar)
        * [func (j *Jar) Cookies(u *url.URL) (cookies []*http.Cookie)](#Jar.Cookies)
        * [func (j *Jar) SetCookies(u *url.URL, cookies []*http.Cookie)](#Jar.SetCookies)
        * [func (j *Jar) cookies(u *url.URL, now time.Time) (cookies []*http.Cookie)](#Jar.cookies)
        * [func (j *Jar) domainAndType(host, domain string) (string, bool, error)](#Jar.domainAndType)
        * [func (j *Jar) newEntry(c *http.Cookie, now time.Time, defPath, host string) (e entry, remove bool, err error)](#Jar.newEntry)
        * [func (j *Jar) setCookies(u *url.URL, cookies []*http.Cookie, now time.Time)](#Jar.setCookies)
    * [type Options struct](#Options)
    * [type PublicSuffixList interface](#PublicSuffixList)
    * [type entry struct](#entry)
        * [func (e *entry) domainMatch(host string) bool](#entry.domainMatch)
        * [func (e *entry) id() string](#entry.id)
        * [func (e *entry) pathMatch(requestPath string) bool](#entry.pathMatch)
        * [func (e *entry) shouldSend(https bool, host, path string) bool](#entry.shouldSend)
    * [type jarTest struct](#jarTest)
        * [func (test jarTest) run(t *testing.T, jar *Jar)](#jarTest.run)
    * [type query struct](#query)
    * [type testPSL struct{}](#testPSL)
        * [func (testPSL) PublicSuffix(d string) string](#testPSL.PublicSuffix)
        * [func (testPSL) String() string](#testPSL.String)
* [Functions](#func)
    * [func TestBasics(t *testing.T)](#TestBasics)
    * [func TestCanonicalHost(t *testing.T)](#TestCanonicalHost)
    * [func TestChromiumBasics(t *testing.T)](#TestChromiumBasics)
    * [func TestChromiumDeletion(t *testing.T)](#TestChromiumDeletion)
    * [func TestChromiumDomain(t *testing.T)](#TestChromiumDomain)
    * [func TestDefaultPath(t *testing.T)](#TestDefaultPath)
    * [func TestDomainAndType(t *testing.T)](#TestDomainAndType)
    * [func TestDomainHandling(t *testing.T)](#TestDomainHandling)
    * [func TestExpiration(t *testing.T)](#TestExpiration)
    * [func TestHasDotSuffix(t *testing.T)](#TestHasDotSuffix)
    * [func TestHasPort(t *testing.T)](#TestHasPort)
    * [func TestIsIP(t *testing.T)](#TestIsIP)
    * [func TestIssue19384(t *testing.T)](#TestIssue19384)
    * [func TestJarKey(t *testing.T)](#TestJarKey)
    * [func TestJarKeyNilPSL(t *testing.T)](#TestJarKeyNilPSL)
    * [func TestPunycode(t *testing.T)](#TestPunycode)
    * [func TestUpdateAndDelete(t *testing.T)](#TestUpdateAndDelete)
    * [func adapt(delta, numPoints int32, firstTime bool) int32](#adapt)
    * [func canonicalHost(host string) (string, error)](#canonicalHost)
    * [func defaultPath(path string) string](#defaultPath)
    * [func encode(prefix, s string) (string, error)](#encode)
    * [func encodeDigit(digit int32) byte](#encodeDigit)
    * [func expiresIn(delta int) string](#expiresIn)
    * [func hasDotSuffix(s, suffix string) bool](#hasDotSuffix)
    * [func hasPort(host string) bool](#hasPort)
    * [func isIP(host string) bool](#isIP)
    * [func jarKey(host string, psl PublicSuffixList) string](#jarKey)
    * [func mustParseURL(s string) *url.URL](#mustParseURL)
    * [func toASCII(s string) (string, error)](#toASCII)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="acePrefix" href="#acePrefix">const acePrefix</a>

```
searchKey: cookiejar.acePrefix
tags: [constant string private]
```

```Go
const acePrefix = "xn--"
```

acePrefix is the ASCII Compatible Encoding prefix. 

### <a id="base" href="#base">const base</a>

```
searchKey: cookiejar.base
tags: [constant number private]
```

```Go
const base int32 = 36
```

These parameter values are specified in section 5. 

All computation is done with int32s, so that overflow behavior is identical regardless of whether int is 32-bit or 64-bit. 

### <a id="damp" href="#damp">const damp</a>

```
searchKey: cookiejar.damp
tags: [constant number private]
```

```Go
const damp int32 = 700
```

These parameter values are specified in section 5. 

All computation is done with int32s, so that overflow behavior is identical regardless of whether int is 32-bit or 64-bit. 

### <a id="initialBias" href="#initialBias">const initialBias</a>

```
searchKey: cookiejar.initialBias
tags: [constant number private]
```

```Go
const initialBias int32 = 72
```

These parameter values are specified in section 5. 

All computation is done with int32s, so that overflow behavior is identical regardless of whether int is 32-bit or 64-bit. 

### <a id="initialN" href="#initialN">const initialN</a>

```
searchKey: cookiejar.initialN
tags: [constant number private]
```

```Go
const initialN int32 = 128
```

These parameter values are specified in section 5. 

All computation is done with int32s, so that overflow behavior is identical regardless of whether int is 32-bit or 64-bit. 

### <a id="skew" href="#skew">const skew</a>

```
searchKey: cookiejar.skew
tags: [constant number private]
```

```Go
const skew int32 = 38
```

These parameter values are specified in section 5. 

All computation is done with int32s, so that overflow behavior is identical regardless of whether int is 32-bit or 64-bit. 

### <a id="tmax" href="#tmax">const tmax</a>

```
searchKey: cookiejar.tmax
tags: [constant number private]
```

```Go
const tmax int32 = 26
```

These parameter values are specified in section 5. 

All computation is done with int32s, so that overflow behavior is identical regardless of whether int is 32-bit or 64-bit. 

### <a id="tmin" href="#tmin">const tmin</a>

```
searchKey: cookiejar.tmin
tags: [constant number private]
```

```Go
const tmin int32 = 1
```

These parameter values are specified in section 5. 

All computation is done with int32s, so that overflow behavior is identical regardless of whether int is 32-bit or 64-bit. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="basicsTests" href="#basicsTests">var basicsTests</a>

```
searchKey: cookiejar.basicsTests
tags: [variable array struct private]
```

```Go
var basicsTests = ...
```

basicsTests contains fundamental tests. Each jarTest has to be performed on a fresh, empty Jar. 

### <a id="canonicalHostTests" href="#canonicalHostTests">var canonicalHostTests</a>

```
searchKey: cookiejar.canonicalHostTests
tags: [variable object private]
```

```Go
var canonicalHostTests = ...
```

### <a id="chromiumBasicsTests" href="#chromiumBasicsTests">var chromiumBasicsTests</a>

```
searchKey: cookiejar.chromiumBasicsTests
tags: [variable array struct private]
```

```Go
var chromiumBasicsTests = ...
```

chromiumBasicsTests contains fundamental tests. Each jarTest has to be performed on a fresh, empty Jar. 

### <a id="chromiumDeletionTests" href="#chromiumDeletionTests">var chromiumDeletionTests</a>

```
searchKey: cookiejar.chromiumDeletionTests
tags: [variable array struct private]
```

```Go
var chromiumDeletionTests = ...
```

chromiumDeletionTests must be performed all on the same Jar. 

### <a id="chromiumDomainTests" href="#chromiumDomainTests">var chromiumDomainTests</a>

```
searchKey: cookiejar.chromiumDomainTests
tags: [variable array struct private]
```

```Go
var chromiumDomainTests = ...
```

chromiumDomainTests contains jarTests which must be executed all on the same Jar. 

### <a id="defaultPathTests" href="#defaultPathTests">var defaultPathTests</a>

```
searchKey: cookiejar.defaultPathTests
tags: [variable object private]
```

```Go
var defaultPathTests = ...
```

### <a id="domainAndTypeTests" href="#domainAndTypeTests">var domainAndTypeTests</a>

```
searchKey: cookiejar.domainAndTypeTests
tags: [variable array struct private]
```

```Go
var domainAndTypeTests = ...
```

### <a id="domainHandlingTests" href="#domainHandlingTests">var domainHandlingTests</a>

```
searchKey: cookiejar.domainHandlingTests
tags: [variable array struct private]
```

```Go
var domainHandlingTests = ...
```

domainHandlingTests tests and documents the rules for domain handling. Each test must be performed on an empty new Jar. 

### <a id="endOfTime" href="#endOfTime">var endOfTime</a>

```
searchKey: cookiejar.endOfTime
tags: [variable struct private]
```

```Go
var endOfTime = time.Date(9999, 12, 31, 23, 59, 59, 0, time.UTC)
```

endOfTime is the time when session (non-persistent) cookies expire. This instant is representable in most date/time formats (not just Go's time.Time) and should be far enough in the future. 

### <a id="errIllegalDomain" href="#errIllegalDomain">var errIllegalDomain</a>

```
searchKey: cookiejar.errIllegalDomain
tags: [variable interface private]
```

```Go
var errIllegalDomain = errors.New("cookiejar: illegal cookie domain attribute")
```

### <a id="errMalformedDomain" href="#errMalformedDomain">var errMalformedDomain</a>

```
searchKey: cookiejar.errMalformedDomain
tags: [variable interface private]
```

```Go
var errMalformedDomain = errors.New("cookiejar: malformed cookie domain attribute")
```

### <a id="errNoHostname" href="#errNoHostname">var errNoHostname</a>

```
searchKey: cookiejar.errNoHostname
tags: [variable interface private]
```

```Go
var errNoHostname = errors.New("cookiejar: no host name available (IP only)")
```

### <a id="hasDotSuffixTests" href="#hasDotSuffixTests">var hasDotSuffixTests</a>

```
searchKey: cookiejar.hasDotSuffixTests
tags: [variable array struct private]
```

```Go
var hasDotSuffixTests = ...
```

### <a id="hasPortTests" href="#hasPortTests">var hasPortTests</a>

```
searchKey: cookiejar.hasPortTests
tags: [variable object private]
```

```Go
var hasPortTests = ...
```

### <a id="isIPTests" href="#isIPTests">var isIPTests</a>

```
searchKey: cookiejar.isIPTests
tags: [variable object private]
```

```Go
var isIPTests = ...
```

### <a id="jarKeyNilPSLTests" href="#jarKeyNilPSLTests">var jarKeyNilPSLTests</a>

```
searchKey: cookiejar.jarKeyNilPSLTests
tags: [variable object private]
```

```Go
var jarKeyNilPSLTests = ...
```

### <a id="jarKeyTests" href="#jarKeyTests">var jarKeyTests</a>

```
searchKey: cookiejar.jarKeyTests
tags: [variable object private]
```

```Go
var jarKeyTests = ...
```

### <a id="punycodeTestCases" href="#punycodeTestCases">var punycodeTestCases</a>

```
searchKey: cookiejar.punycodeTestCases
tags: [variable array struct private]
```

```Go
var punycodeTestCases = ...
```

### <a id="tNow" href="#tNow">var tNow</a>

```
searchKey: cookiejar.tNow
tags: [variable struct private]
```

```Go
var tNow = time.Date(2013, 1, 1, 12, 0, 0, 0, time.UTC)
```

tNow is the synthetic current time used as now during testing. 

### <a id="updateAndDeleteTests" href="#updateAndDeleteTests">var updateAndDeleteTests</a>

```
searchKey: cookiejar.updateAndDeleteTests
tags: [variable array struct private]
```

```Go
var updateAndDeleteTests = ...
```

updateAndDeleteTests contains jarTests which must be performed on the same Jar. 

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Jar" href="#Jar">type Jar struct</a>

```
searchKey: cookiejar.Jar
tags: [struct]
```

```Go
type Jar struct {
	psList PublicSuffixList

	// mu locks the remaining fields.
	mu sync.Mutex

	// entries is a set of entries, keyed by their eTLD+1 and subkeyed by
	// their name/domain/path.
	entries map[string]map[string]entry

	// nextSeqNum is the next sequence number assigned to a new cookie
	// created SetCookies.
	nextSeqNum uint64
}
```

Jar implements the http.CookieJar interface from the net/http package. 

#### <a id="New" href="#New">func New(o *Options) (*Jar, error)</a>

```
searchKey: cookiejar.New
tags: [method]
```

```Go
func New(o *Options) (*Jar, error)
```

New returns a new cookie jar. A nil *Options is equivalent to a zero Options. 

#### <a id="newTestJar" href="#newTestJar">func newTestJar() *Jar</a>

```
searchKey: cookiejar.newTestJar
tags: [function private]
```

```Go
func newTestJar() *Jar
```

newTestJar creates an empty Jar with testPSL as the public suffix list. 

#### <a id="Jar.Cookies" href="#Jar.Cookies">func (j *Jar) Cookies(u *url.URL) (cookies []*http.Cookie)</a>

```
searchKey: cookiejar.Jar.Cookies
tags: [method]
```

```Go
func (j *Jar) Cookies(u *url.URL) (cookies []*http.Cookie)
```

Cookies implements the Cookies method of the http.CookieJar interface. 

It returns an empty slice if the URL's scheme is not HTTP or HTTPS. 

#### <a id="Jar.SetCookies" href="#Jar.SetCookies">func (j *Jar) SetCookies(u *url.URL, cookies []*http.Cookie)</a>

```
searchKey: cookiejar.Jar.SetCookies
tags: [method]
```

```Go
func (j *Jar) SetCookies(u *url.URL, cookies []*http.Cookie)
```

SetCookies implements the SetCookies method of the http.CookieJar interface. 

It does nothing if the URL's scheme is not HTTP or HTTPS. 

#### <a id="Jar.cookies" href="#Jar.cookies">func (j *Jar) cookies(u *url.URL, now time.Time) (cookies []*http.Cookie)</a>

```
searchKey: cookiejar.Jar.cookies
tags: [method private]
```

```Go
func (j *Jar) cookies(u *url.URL, now time.Time) (cookies []*http.Cookie)
```

cookies is like Cookies but takes the current time as a parameter. 

#### <a id="Jar.domainAndType" href="#Jar.domainAndType">func (j *Jar) domainAndType(host, domain string) (string, bool, error)</a>

```
searchKey: cookiejar.Jar.domainAndType
tags: [method private]
```

```Go
func (j *Jar) domainAndType(host, domain string) (string, bool, error)
```

domainAndType determines the cookie's domain and hostOnly attribute. 

#### <a id="Jar.newEntry" href="#Jar.newEntry">func (j *Jar) newEntry(c *http.Cookie, now time.Time, defPath, host string) (e entry, remove bool, err error)</a>

```
searchKey: cookiejar.Jar.newEntry
tags: [method private]
```

```Go
func (j *Jar) newEntry(c *http.Cookie, now time.Time, defPath, host string) (e entry, remove bool, err error)
```

newEntry creates an entry from a http.Cookie c. now is the current time and is compared to c.Expires to determine deletion of c. defPath and host are the default-path and the canonical host name of the URL c was received from. 

remove records whether the jar should delete this cookie, as it has already expired with respect to now. In this case, e may be incomplete, but it will be valid to call e.id (which depends on e's Name, Domain and Path). 

A malformed c.Domain will result in an error. 

#### <a id="Jar.setCookies" href="#Jar.setCookies">func (j *Jar) setCookies(u *url.URL, cookies []*http.Cookie, now time.Time)</a>

```
searchKey: cookiejar.Jar.setCookies
tags: [method private]
```

```Go
func (j *Jar) setCookies(u *url.URL, cookies []*http.Cookie, now time.Time)
```

setCookies is like SetCookies but takes the current time as parameter. 

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: cookiejar.Options
tags: [struct]
```

```Go
type Options struct {
	// PublicSuffixList is the public suffix list that determines whether
	// an HTTP server can set a cookie for a domain.
	//
	// A nil value is valid and may be useful for testing but it is not
	// secure: it means that the HTTP server for foo.co.uk can set a cookie
	// for bar.co.uk.
	PublicSuffixList PublicSuffixList
}
```

Options are the options for creating a new Jar. 

### <a id="PublicSuffixList" href="#PublicSuffixList">type PublicSuffixList interface</a>

```
searchKey: cookiejar.PublicSuffixList
tags: [interface]
```

```Go
type PublicSuffixList interface {
	// PublicSuffix returns the public suffix of domain.
	//
	// TODO: specify which of the caller and callee is responsible for IP
	// addresses, for leading and trailing dots, for case sensitivity, and
	// for IDN/Punycode.
	PublicSuffix(domain string) string

	// String returns a description of the source of this public suffix
	// list. The description will typically contain something like a time
	// stamp or version number.
	String() string
}
```

PublicSuffixList provides the public suffix of a domain. For example: 

```
- the public suffix of "example.com" is "com",
- the public suffix of "foo1.foo2.foo3.co.uk" is "co.uk", and
- the public suffix of "bar.pvt.k12.ma.us" is "pvt.k12.ma.us".

```
Implementations of PublicSuffixList must be safe for concurrent use by multiple goroutines. 

An implementation that always returns "" is valid and may be useful for testing but it is not secure: it means that the HTTP server for foo.com can set a cookie for bar.com. 

A public suffix list implementation is in the package golang.org/x/net/publicsuffix. 

### <a id="entry" href="#entry">type entry struct</a>

```
searchKey: cookiejar.entry
tags: [struct private]
```

```Go
type entry struct {
	Name       string
	Value      string
	Domain     string
	Path       string
	SameSite   string
	Secure     bool
	HttpOnly   bool
	Persistent bool
	HostOnly   bool
	Expires    time.Time
	Creation   time.Time
	LastAccess time.Time

	// seqNum is a sequence number so that Cookies returns cookies in a
	// deterministic order, even for cookies that have equal Path length and
	// equal Creation time. This simplifies testing.
	seqNum uint64
}
```

entry is the internal representation of a cookie. 

This struct type is not used outside of this package per se, but the exported fields are those of RFC 6265. 

#### <a id="entry.domainMatch" href="#entry.domainMatch">func (e *entry) domainMatch(host string) bool</a>

```
searchKey: cookiejar.entry.domainMatch
tags: [method private]
```

```Go
func (e *entry) domainMatch(host string) bool
```

domainMatch implements "domain-match" of RFC 6265 section 5.1.3. 

#### <a id="entry.id" href="#entry.id">func (e *entry) id() string</a>

```
searchKey: cookiejar.entry.id
tags: [function private]
```

```Go
func (e *entry) id() string
```

id returns the domain;path;name triple of e as an id. 

#### <a id="entry.pathMatch" href="#entry.pathMatch">func (e *entry) pathMatch(requestPath string) bool</a>

```
searchKey: cookiejar.entry.pathMatch
tags: [method private]
```

```Go
func (e *entry) pathMatch(requestPath string) bool
```

pathMatch implements "path-match" according to RFC 6265 section 5.1.4. 

#### <a id="entry.shouldSend" href="#entry.shouldSend">func (e *entry) shouldSend(https bool, host, path string) bool</a>

```
searchKey: cookiejar.entry.shouldSend
tags: [method private]
```

```Go
func (e *entry) shouldSend(https bool, host, path string) bool
```

shouldSend determines whether e's cookie qualifies to be included in a request to host/path. It is the caller's responsibility to check if the cookie is expired. 

### <a id="jarTest" href="#jarTest">type jarTest struct</a>

```
searchKey: cookiejar.jarTest
tags: [struct private]
```

```Go
type jarTest struct {
	description string   // The description of what this test is supposed to test
	fromURL     string   // The full URL of the request from which Set-Cookie headers where received
	setCookies  []string // All the cookies received from fromURL
	content     string   // The whole (non-expired) content of the jar
	queries     []query  // Queries to test the Jar.Cookies method
}
```

jarTest encapsulates the following actions on a jar: 

```
1. Perform SetCookies with fromURL and the cookies from setCookies.
   (Done at time tNow + 0 ms.)
2. Check that the entries in the jar matches content.
   (Done at time tNow + 1001 ms.)
3. For each query in tests: Check that Cookies with toURL yields the
   cookies in want.
   (Query n done at tNow + (n+2)*1001 ms.)

```
#### <a id="jarTest.run" href="#jarTest.run">func (test jarTest) run(t *testing.T, jar *Jar)</a>

```
searchKey: cookiejar.jarTest.run
tags: [method private]
```

```Go
func (test jarTest) run(t *testing.T, jar *Jar)
```

run runs the jarTest. 

### <a id="query" href="#query">type query struct</a>

```
searchKey: cookiejar.query
tags: [struct private]
```

```Go
type query struct {
	toURL string // the URL in the Cookies call
	want  string // the expected list of cookies (order matters)
}
```

query contains one test of the cookies returned from Jar.Cookies. 

### <a id="testPSL" href="#testPSL">type testPSL struct{}</a>

```
searchKey: cookiejar.testPSL
tags: [struct private]
```

```Go
type testPSL struct{}
```

testPSL implements PublicSuffixList with just two rules: "co.uk" and the default rule "*". The implementation has two intentional bugs: 

```
PublicSuffix("www.buggy.psl") == "xy"
PublicSuffix("www2.buggy.psl") == "com"

```
#### <a id="testPSL.PublicSuffix" href="#testPSL.PublicSuffix">func (testPSL) PublicSuffix(d string) string</a>

```
searchKey: cookiejar.testPSL.PublicSuffix
tags: [method private]
```

```Go
func (testPSL) PublicSuffix(d string) string
```

#### <a id="testPSL.String" href="#testPSL.String">func (testPSL) String() string</a>

```
searchKey: cookiejar.testPSL.String
tags: [function private]
```

```Go
func (testPSL) String() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="TestBasics" href="#TestBasics">func TestBasics(t *testing.T)</a>

```
searchKey: cookiejar.TestBasics
tags: [method private test]
```

```Go
func TestBasics(t *testing.T)
```

### <a id="TestCanonicalHost" href="#TestCanonicalHost">func TestCanonicalHost(t *testing.T)</a>

```
searchKey: cookiejar.TestCanonicalHost
tags: [method private test]
```

```Go
func TestCanonicalHost(t *testing.T)
```

### <a id="TestChromiumBasics" href="#TestChromiumBasics">func TestChromiumBasics(t *testing.T)</a>

```
searchKey: cookiejar.TestChromiumBasics
tags: [method private test]
```

```Go
func TestChromiumBasics(t *testing.T)
```

### <a id="TestChromiumDeletion" href="#TestChromiumDeletion">func TestChromiumDeletion(t *testing.T)</a>

```
searchKey: cookiejar.TestChromiumDeletion
tags: [method private test]
```

```Go
func TestChromiumDeletion(t *testing.T)
```

### <a id="TestChromiumDomain" href="#TestChromiumDomain">func TestChromiumDomain(t *testing.T)</a>

```
searchKey: cookiejar.TestChromiumDomain
tags: [method private test]
```

```Go
func TestChromiumDomain(t *testing.T)
```

### <a id="TestDefaultPath" href="#TestDefaultPath">func TestDefaultPath(t *testing.T)</a>

```
searchKey: cookiejar.TestDefaultPath
tags: [method private test]
```

```Go
func TestDefaultPath(t *testing.T)
```

### <a id="TestDomainAndType" href="#TestDomainAndType">func TestDomainAndType(t *testing.T)</a>

```
searchKey: cookiejar.TestDomainAndType
tags: [method private test]
```

```Go
func TestDomainAndType(t *testing.T)
```

### <a id="TestDomainHandling" href="#TestDomainHandling">func TestDomainHandling(t *testing.T)</a>

```
searchKey: cookiejar.TestDomainHandling
tags: [method private test]
```

```Go
func TestDomainHandling(t *testing.T)
```

### <a id="TestExpiration" href="#TestExpiration">func TestExpiration(t *testing.T)</a>

```
searchKey: cookiejar.TestExpiration
tags: [method private test]
```

```Go
func TestExpiration(t *testing.T)
```

### <a id="TestHasDotSuffix" href="#TestHasDotSuffix">func TestHasDotSuffix(t *testing.T)</a>

```
searchKey: cookiejar.TestHasDotSuffix
tags: [method private test]
```

```Go
func TestHasDotSuffix(t *testing.T)
```

### <a id="TestHasPort" href="#TestHasPort">func TestHasPort(t *testing.T)</a>

```
searchKey: cookiejar.TestHasPort
tags: [method private test]
```

```Go
func TestHasPort(t *testing.T)
```

### <a id="TestIsIP" href="#TestIsIP">func TestIsIP(t *testing.T)</a>

```
searchKey: cookiejar.TestIsIP
tags: [method private test]
```

```Go
func TestIsIP(t *testing.T)
```

### <a id="TestIssue19384" href="#TestIssue19384">func TestIssue19384(t *testing.T)</a>

```
searchKey: cookiejar.TestIssue19384
tags: [method private test]
```

```Go
func TestIssue19384(t *testing.T)
```

### <a id="TestJarKey" href="#TestJarKey">func TestJarKey(t *testing.T)</a>

```
searchKey: cookiejar.TestJarKey
tags: [method private test]
```

```Go
func TestJarKey(t *testing.T)
```

### <a id="TestJarKeyNilPSL" href="#TestJarKeyNilPSL">func TestJarKeyNilPSL(t *testing.T)</a>

```
searchKey: cookiejar.TestJarKeyNilPSL
tags: [method private test]
```

```Go
func TestJarKeyNilPSL(t *testing.T)
```

### <a id="TestPunycode" href="#TestPunycode">func TestPunycode(t *testing.T)</a>

```
searchKey: cookiejar.TestPunycode
tags: [method private test]
```

```Go
func TestPunycode(t *testing.T)
```

### <a id="TestUpdateAndDelete" href="#TestUpdateAndDelete">func TestUpdateAndDelete(t *testing.T)</a>

```
searchKey: cookiejar.TestUpdateAndDelete
tags: [method private test]
```

```Go
func TestUpdateAndDelete(t *testing.T)
```

### <a id="adapt" href="#adapt">func adapt(delta, numPoints int32, firstTime bool) int32</a>

```
searchKey: cookiejar.adapt
tags: [method private]
```

```Go
func adapt(delta, numPoints int32, firstTime bool) int32
```

adapt is the bias adaptation function specified in section 6.1. 

### <a id="canonicalHost" href="#canonicalHost">func canonicalHost(host string) (string, error)</a>

```
searchKey: cookiejar.canonicalHost
tags: [method private]
```

```Go
func canonicalHost(host string) (string, error)
```

canonicalHost strips port from host if present and returns the canonicalized host name. 

### <a id="defaultPath" href="#defaultPath">func defaultPath(path string) string</a>

```
searchKey: cookiejar.defaultPath
tags: [method private]
```

```Go
func defaultPath(path string) string
```

defaultPath returns the directory part of an URL's path according to RFC 6265 section 5.1.4. 

### <a id="encode" href="#encode">func encode(prefix, s string) (string, error)</a>

```
searchKey: cookiejar.encode
tags: [method private]
```

```Go
func encode(prefix, s string) (string, error)
```

encode encodes a string as specified in section 6.3 and prepends prefix to the result. 

The "while h < length(input)" line in the specification becomes "for remaining != 0" in the Go code, because len(s) in Go is in bytes, not runes. 

### <a id="encodeDigit" href="#encodeDigit">func encodeDigit(digit int32) byte</a>

```
searchKey: cookiejar.encodeDigit
tags: [method private]
```

```Go
func encodeDigit(digit int32) byte
```

### <a id="expiresIn" href="#expiresIn">func expiresIn(delta int) string</a>

```
searchKey: cookiejar.expiresIn
tags: [method private]
```

```Go
func expiresIn(delta int) string
```

expiresIn creates an expires attribute delta seconds from tNow. 

### <a id="hasDotSuffix" href="#hasDotSuffix">func hasDotSuffix(s, suffix string) bool</a>

```
searchKey: cookiejar.hasDotSuffix
tags: [method private]
```

```Go
func hasDotSuffix(s, suffix string) bool
```

hasDotSuffix reports whether s ends in "."+suffix. 

### <a id="hasPort" href="#hasPort">func hasPort(host string) bool</a>

```
searchKey: cookiejar.hasPort
tags: [method private]
```

```Go
func hasPort(host string) bool
```

hasPort reports whether host contains a port number. host may be a host name, an IPv4 or an IPv6 address. 

### <a id="isIP" href="#isIP">func isIP(host string) bool</a>

```
searchKey: cookiejar.isIP
tags: [method private]
```

```Go
func isIP(host string) bool
```

isIP reports whether host is an IP address. 

### <a id="jarKey" href="#jarKey">func jarKey(host string, psl PublicSuffixList) string</a>

```
searchKey: cookiejar.jarKey
tags: [method private]
```

```Go
func jarKey(host string, psl PublicSuffixList) string
```

jarKey returns the key to use for a jar. 

### <a id="mustParseURL" href="#mustParseURL">func mustParseURL(s string) *url.URL</a>

```
searchKey: cookiejar.mustParseURL
tags: [method private]
```

```Go
func mustParseURL(s string) *url.URL
```

mustParseURL parses s to an URL and panics on error. 

### <a id="toASCII" href="#toASCII">func toASCII(s string) (string, error)</a>

```
searchKey: cookiejar.toASCII
tags: [method private]
```

```Go
func toASCII(s string) (string, error)
```

toASCII converts a domain or domain label to its ASCII form. For example, toASCII("bücher.example.com") is "xn--bcher-kva.example.com", and toASCII("golang") is "golang". 

