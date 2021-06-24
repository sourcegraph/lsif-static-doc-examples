# Package mail

Package mail implements parsing of mail messages. 

For the most part, this package follows the syntax as specified by RFC 5322 and extended by RFC 6532. Notable divergences: 

```
* Obsolete address formats are not parsed, including addresses with
  embedded route information.
* The full range of spacing (the CFWS syntax element) is not supported,
  such as breaking addresses across lines.
* No unicode normalization is performed.
* The special characters ()[]:;@\, are allowed to appear unquoted in names.

```
## Index

* [Variables](#var)
    * [var ErrHeaderNotPresent](#ErrHeaderNotPresent)
    * [var dateLayouts](#dateLayouts)
    * [var dateLayoutsBuildOnce](#dateLayoutsBuildOnce)
    * [var debug](#debug)
    * [var parseTests](#parseTests)
    * [var rfc2047Decoder](#rfc2047Decoder)
* [Types](#type)
    * [type Address struct](#Address)
        * [func ParseAddress(address string) (*Address, error)](#ParseAddress)
        * [func (a *Address) String() string](#Address.String)
    * [type AddressParser struct](#AddressParser)
        * [func (p *AddressParser) Parse(address string) (*Address, error)](#AddressParser.Parse)
        * [func (p *AddressParser) ParseList(list string) ([]*Address, error)](#AddressParser.ParseList)
    * [type Header map[string][]string](#Header)
        * [func (h Header) AddressList(key string) ([]*Address, error)](#Header.AddressList)
        * [func (h Header) Date() (time.Time, error)](#Header.Date)
        * [func (h Header) Get(key string) string](#Header.Get)
    * [type Message struct](#Message)
        * [func ReadMessage(r io.Reader) (msg *Message, err error)](#ReadMessage)
    * [type addrParser struct](#addrParser)
        * [func (p *addrParser) consume(c byte) bool](#addrParser.consume)
        * [func (p *addrParser) consumeAddrSpec() (spec string, err error)](#addrParser.consumeAddrSpec)
        * [func (p *addrParser) consumeAtom(dot bool, permissive bool) (atom string, err error)](#addrParser.consumeAtom)
        * [func (p *addrParser) consumeComment() (string, bool)](#addrParser.consumeComment)
        * [func (p *addrParser) consumeDisplayNameComment() (string, error)](#addrParser.consumeDisplayNameComment)
        * [func (p *addrParser) consumeGroupList() ([]*Address, error)](#addrParser.consumeGroupList)
        * [func (p *addrParser) consumePhrase() (phrase string, err error)](#addrParser.consumePhrase)
        * [func (p *addrParser) consumeQuotedString() (qs string, err error)](#addrParser.consumeQuotedString)
        * [func (p *addrParser) decodeRFC2047Word(s string) (word string, isEncoded bool, err error)](#addrParser.decodeRFC2047Word)
        * [func (p *addrParser) empty() bool](#addrParser.empty)
        * [func (p *addrParser) len() int](#addrParser.len)
        * [func (p *addrParser) parseAddress(handleGroup bool) ([]*Address, error)](#addrParser.parseAddress)
        * [func (p *addrParser) parseAddressList() ([]*Address, error)](#addrParser.parseAddressList)
        * [func (p *addrParser) parseSingleAddress() (*Address, error)](#addrParser.parseSingleAddress)
        * [func (p *addrParser) peek() byte](#addrParser.peek)
        * [func (p *addrParser) skipCFWS() bool](#addrParser.skipCFWS)
        * [func (p *addrParser) skipSpace()](#addrParser.skipSpace)
    * [type charsetError string](#charsetError)
        * [func (e charsetError) Error() string](#charsetError.Error)
    * [type debugT bool](#debugT)
        * [func (d debugT) Printf(format string, args ...interface{})](#debugT.Printf)
* [Functions](#func)
    * [func ParseAddressList(list string) ([]*Address, error)](#ParseAddressList)
    * [func ParseDate(date string) (time.Time, error)](#ParseDate)
    * [func TestAddressFormattingAndParsing(t *testing.T)](#TestAddressFormattingAndParsing)
    * [func TestAddressParser(t *testing.T)](#TestAddressParser)
    * [func TestAddressParsing(t *testing.T)](#TestAddressParsing)
    * [func TestAddressParsingAndFormatting(t *testing.T)](#TestAddressParsingAndFormatting)
    * [func TestAddressParsingError(t *testing.T)](#TestAddressParsingError)
    * [func TestAddressString(t *testing.T)](#TestAddressString)
    * [func TestDateParsing(t *testing.T)](#TestDateParsing)
    * [func TestDateParsingCFWS(t *testing.T)](#TestDateParsingCFWS)
    * [func TestEmptyAddress(t *testing.T)](#TestEmptyAddress)
    * [func TestParsing(t *testing.T)](#TestParsing)
    * [func buildDateLayouts()](#buildDateLayouts)
    * [func headerEq(a, b Header) bool](#headerEq)
    * [func isAtext(r rune, dot, permissive bool) bool](#isAtext)
    * [func isMultibyte(r rune) bool](#isMultibyte)
    * [func isQtext(r rune) bool](#isQtext)
    * [func isVchar(r rune) bool](#isVchar)
    * [func isWSP(r rune) bool](#isWSP)
    * [func quoteString(s string) string](#quoteString)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="ErrHeaderNotPresent" href="#ErrHeaderNotPresent">var ErrHeaderNotPresent</a>

```
searchKey: mail.ErrHeaderNotPresent
tags: [variable interface]
```

```Go
var ErrHeaderNotPresent = errors.New("mail: header not in message")
```

### <a id="dateLayouts" href="#dateLayouts">var dateLayouts</a>

```
searchKey: mail.dateLayouts
tags: [variable array string private]
```

```Go
var dateLayouts []string
```

Layouts suitable for passing to time.Parse. These are tried in order. 

### <a id="dateLayoutsBuildOnce" href="#dateLayoutsBuildOnce">var dateLayoutsBuildOnce</a>

```
searchKey: mail.dateLayoutsBuildOnce
tags: [variable struct private]
```

```Go
var dateLayoutsBuildOnce sync.Once
```

Layouts suitable for passing to time.Parse. These are tried in order. 

### <a id="debug" href="#debug">var debug</a>

```
searchKey: mail.debug
tags: [variable boolean private]
```

```Go
var debug = debugT(false)
```

### <a id="parseTests" href="#parseTests">var parseTests</a>

```
searchKey: mail.parseTests
tags: [variable array struct private]
```

```Go
var parseTests = ...
```

### <a id="rfc2047Decoder" href="#rfc2047Decoder">var rfc2047Decoder</a>

```
searchKey: mail.rfc2047Decoder
tags: [variable struct private]
```

```Go
var rfc2047Decoder = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Address" href="#Address">type Address struct</a>

```
searchKey: mail.Address
tags: [struct]
```

```Go
type Address struct {
	Name    string // Proper name; may be empty.
	Address string // user@domain
}
```

Address represents a single mail address. An address such as "Barry Gibbs <bg@example.com>" is represented as Address{Name: "Barry Gibbs", Address: "bg@example.com"}. 

#### <a id="ParseAddress" href="#ParseAddress">func ParseAddress(address string) (*Address, error)</a>

```
searchKey: mail.ParseAddress
tags: [method]
```

```Go
func ParseAddress(address string) (*Address, error)
```

ParseAddress parses a single RFC 5322 address, e.g. "Barry Gibbs <bg@example.com>" 

#### <a id="Address.String" href="#Address.String">func (a *Address) String() string</a>

```
searchKey: mail.Address.String
tags: [function]
```

```Go
func (a *Address) String() string
```

String formats the address as a valid RFC 5322 address. If the address's name contains non-ASCII characters the name will be rendered according to RFC 2047. 

### <a id="AddressParser" href="#AddressParser">type AddressParser struct</a>

```
searchKey: mail.AddressParser
tags: [struct]
```

```Go
type AddressParser struct {
	// WordDecoder optionally specifies a decoder for RFC 2047 encoded-words.
	WordDecoder *mime.WordDecoder
}
```

An AddressParser is an RFC 5322 address parser. 

#### <a id="AddressParser.Parse" href="#AddressParser.Parse">func (p *AddressParser) Parse(address string) (*Address, error)</a>

```
searchKey: mail.AddressParser.Parse
tags: [method]
```

```Go
func (p *AddressParser) Parse(address string) (*Address, error)
```

Parse parses a single RFC 5322 address of the form "Gogh Fir <gf@example.com>" or "foo@example.com". 

#### <a id="AddressParser.ParseList" href="#AddressParser.ParseList">func (p *AddressParser) ParseList(list string) ([]*Address, error)</a>

```
searchKey: mail.AddressParser.ParseList
tags: [method]
```

```Go
func (p *AddressParser) ParseList(list string) ([]*Address, error)
```

ParseList parses the given string as a list of comma-separated addresses of the form "Gogh Fir <gf@example.com>" or "foo@example.com". 

### <a id="Header" href="#Header">type Header map[string][]string</a>

```
searchKey: mail.Header
tags: [object]
```

```Go
type Header map[string][]string
```

A Header represents the key-value pairs in a mail message header. 

#### <a id="Header.AddressList" href="#Header.AddressList">func (h Header) AddressList(key string) ([]*Address, error)</a>

```
searchKey: mail.Header.AddressList
tags: [method]
```

```Go
func (h Header) AddressList(key string) ([]*Address, error)
```

AddressList parses the named header field as a list of addresses. 

#### <a id="Header.Date" href="#Header.Date">func (h Header) Date() (time.Time, error)</a>

```
searchKey: mail.Header.Date
tags: [function]
```

```Go
func (h Header) Date() (time.Time, error)
```

Date parses the Date header field. 

#### <a id="Header.Get" href="#Header.Get">func (h Header) Get(key string) string</a>

```
searchKey: mail.Header.Get
tags: [method]
```

```Go
func (h Header) Get(key string) string
```

Get gets the first value associated with the given key. It is case insensitive; CanonicalMIMEHeaderKey is used to canonicalize the provided key. If there are no values associated with the key, Get returns "". To access multiple values of a key, or to use non-canonical keys, access the map directly. 

### <a id="Message" href="#Message">type Message struct</a>

```
searchKey: mail.Message
tags: [struct]
```

```Go
type Message struct {
	Header Header
	Body   io.Reader
}
```

A Message represents a parsed mail message. 

#### <a id="ReadMessage" href="#ReadMessage">func ReadMessage(r io.Reader) (msg *Message, err error)</a>

```
searchKey: mail.ReadMessage
tags: [method]
```

```Go
func ReadMessage(r io.Reader) (msg *Message, err error)
```

ReadMessage reads a message from r. The headers are parsed, and the body of the message will be available for reading from msg.Body. 

### <a id="addrParser" href="#addrParser">type addrParser struct</a>

```
searchKey: mail.addrParser
tags: [struct private]
```

```Go
type addrParser struct {
	s   string
	dec *mime.WordDecoder // may be nil
}
```

#### <a id="addrParser.consume" href="#addrParser.consume">func (p *addrParser) consume(c byte) bool</a>

```
searchKey: mail.addrParser.consume
tags: [method private]
```

```Go
func (p *addrParser) consume(c byte) bool
```

#### <a id="addrParser.consumeAddrSpec" href="#addrParser.consumeAddrSpec">func (p *addrParser) consumeAddrSpec() (spec string, err error)</a>

```
searchKey: mail.addrParser.consumeAddrSpec
tags: [function private]
```

```Go
func (p *addrParser) consumeAddrSpec() (spec string, err error)
```

consumeAddrSpec parses a single RFC 5322 addr-spec at the start of p. 

#### <a id="addrParser.consumeAtom" href="#addrParser.consumeAtom">func (p *addrParser) consumeAtom(dot bool, permissive bool) (atom string, err error)</a>

```
searchKey: mail.addrParser.consumeAtom
tags: [method private]
```

```Go
func (p *addrParser) consumeAtom(dot bool, permissive bool) (atom string, err error)
```

consumeAtom parses an RFC 5322 atom at the start of p. If dot is true, consumeAtom parses an RFC 5322 dot-atom instead. If permissive is true, consumeAtom will not fail on: - leading/trailing/double dots in the atom (see golang.org/issue/4938) - special characters (RFC 5322 3.2.3) except '<', '>', ':' and '"' (see golang.org/issue/21018) 

#### <a id="addrParser.consumeComment" href="#addrParser.consumeComment">func (p *addrParser) consumeComment() (string, bool)</a>

```
searchKey: mail.addrParser.consumeComment
tags: [function private]
```

```Go
func (p *addrParser) consumeComment() (string, bool)
```

#### <a id="addrParser.consumeDisplayNameComment" href="#addrParser.consumeDisplayNameComment">func (p *addrParser) consumeDisplayNameComment() (string, error)</a>

```
searchKey: mail.addrParser.consumeDisplayNameComment
tags: [function private]
```

```Go
func (p *addrParser) consumeDisplayNameComment() (string, error)
```

#### <a id="addrParser.consumeGroupList" href="#addrParser.consumeGroupList">func (p *addrParser) consumeGroupList() ([]*Address, error)</a>

```
searchKey: mail.addrParser.consumeGroupList
tags: [function private]
```

```Go
func (p *addrParser) consumeGroupList() ([]*Address, error)
```

#### <a id="addrParser.consumePhrase" href="#addrParser.consumePhrase">func (p *addrParser) consumePhrase() (phrase string, err error)</a>

```
searchKey: mail.addrParser.consumePhrase
tags: [function private]
```

```Go
func (p *addrParser) consumePhrase() (phrase string, err error)
```

consumePhrase parses the RFC 5322 phrase at the start of p. 

#### <a id="addrParser.consumeQuotedString" href="#addrParser.consumeQuotedString">func (p *addrParser) consumeQuotedString() (qs string, err error)</a>

```
searchKey: mail.addrParser.consumeQuotedString
tags: [function private]
```

```Go
func (p *addrParser) consumeQuotedString() (qs string, err error)
```

consumeQuotedString parses the quoted string at the start of p. 

#### <a id="addrParser.decodeRFC2047Word" href="#addrParser.decodeRFC2047Word">func (p *addrParser) decodeRFC2047Word(s string) (word string, isEncoded bool, err error)</a>

```
searchKey: mail.addrParser.decodeRFC2047Word
tags: [method private]
```

```Go
func (p *addrParser) decodeRFC2047Word(s string) (word string, isEncoded bool, err error)
```

#### <a id="addrParser.empty" href="#addrParser.empty">func (p *addrParser) empty() bool</a>

```
searchKey: mail.addrParser.empty
tags: [function private]
```

```Go
func (p *addrParser) empty() bool
```

#### <a id="addrParser.len" href="#addrParser.len">func (p *addrParser) len() int</a>

```
searchKey: mail.addrParser.len
tags: [function private]
```

```Go
func (p *addrParser) len() int
```

#### <a id="addrParser.parseAddress" href="#addrParser.parseAddress">func (p *addrParser) parseAddress(handleGroup bool) ([]*Address, error)</a>

```
searchKey: mail.addrParser.parseAddress
tags: [method private]
```

```Go
func (p *addrParser) parseAddress(handleGroup bool) ([]*Address, error)
```

parseAddress parses a single RFC 5322 address at the start of p. 

#### <a id="addrParser.parseAddressList" href="#addrParser.parseAddressList">func (p *addrParser) parseAddressList() ([]*Address, error)</a>

```
searchKey: mail.addrParser.parseAddressList
tags: [function private]
```

```Go
func (p *addrParser) parseAddressList() ([]*Address, error)
```

#### <a id="addrParser.parseSingleAddress" href="#addrParser.parseSingleAddress">func (p *addrParser) parseSingleAddress() (*Address, error)</a>

```
searchKey: mail.addrParser.parseSingleAddress
tags: [function private]
```

```Go
func (p *addrParser) parseSingleAddress() (*Address, error)
```

#### <a id="addrParser.peek" href="#addrParser.peek">func (p *addrParser) peek() byte</a>

```
searchKey: mail.addrParser.peek
tags: [function private]
```

```Go
func (p *addrParser) peek() byte
```

#### <a id="addrParser.skipCFWS" href="#addrParser.skipCFWS">func (p *addrParser) skipCFWS() bool</a>

```
searchKey: mail.addrParser.skipCFWS
tags: [function private]
```

```Go
func (p *addrParser) skipCFWS() bool
```

skipCFWS skips CFWS as defined in RFC5322. 

#### <a id="addrParser.skipSpace" href="#addrParser.skipSpace">func (p *addrParser) skipSpace()</a>

```
searchKey: mail.addrParser.skipSpace
tags: [function private]
```

```Go
func (p *addrParser) skipSpace()
```

skipSpace skips the leading space and tab characters. 

### <a id="charsetError" href="#charsetError">type charsetError string</a>

```
searchKey: mail.charsetError
tags: [string private]
```

```Go
type charsetError string
```

#### <a id="charsetError.Error" href="#charsetError.Error">func (e charsetError) Error() string</a>

```
searchKey: mail.charsetError.Error
tags: [function private]
```

```Go
func (e charsetError) Error() string
```

### <a id="debugT" href="#debugT">type debugT bool</a>

```
searchKey: mail.debugT
tags: [boolean private]
```

```Go
type debugT bool
```

#### <a id="debugT.Printf" href="#debugT.Printf">func (d debugT) Printf(format string, args ...interface{})</a>

```
searchKey: mail.debugT.Printf
tags: [method private]
```

```Go
func (d debugT) Printf(format string, args ...interface{})
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="ParseAddressList" href="#ParseAddressList">func ParseAddressList(list string) ([]*Address, error)</a>

```
searchKey: mail.ParseAddressList
tags: [method]
```

```Go
func ParseAddressList(list string) ([]*Address, error)
```

ParseAddressList parses the given string as a list of addresses. 

### <a id="ParseDate" href="#ParseDate">func ParseDate(date string) (time.Time, error)</a>

```
searchKey: mail.ParseDate
tags: [method]
```

```Go
func ParseDate(date string) (time.Time, error)
```

ParseDate parses an RFC 5322 date string. 

### <a id="TestAddressFormattingAndParsing" href="#TestAddressFormattingAndParsing">func TestAddressFormattingAndParsing(t *testing.T)</a>

```
searchKey: mail.TestAddressFormattingAndParsing
tags: [method private test]
```

```Go
func TestAddressFormattingAndParsing(t *testing.T)
```

### <a id="TestAddressParser" href="#TestAddressParser">func TestAddressParser(t *testing.T)</a>

```
searchKey: mail.TestAddressParser
tags: [method private test]
```

```Go
func TestAddressParser(t *testing.T)
```

### <a id="TestAddressParsing" href="#TestAddressParsing">func TestAddressParsing(t *testing.T)</a>

```
searchKey: mail.TestAddressParsing
tags: [method private test]
```

```Go
func TestAddressParsing(t *testing.T)
```

### <a id="TestAddressParsingAndFormatting" href="#TestAddressParsingAndFormatting">func TestAddressParsingAndFormatting(t *testing.T)</a>

```
searchKey: mail.TestAddressParsingAndFormatting
tags: [method private test]
```

```Go
func TestAddressParsingAndFormatting(t *testing.T)
```

Check if all valid addresses can be parsed, formatted and parsed again 

### <a id="TestAddressParsingError" href="#TestAddressParsingError">func TestAddressParsingError(t *testing.T)</a>

```
searchKey: mail.TestAddressParsingError
tags: [method private test]
```

```Go
func TestAddressParsingError(t *testing.T)
```

### <a id="TestAddressString" href="#TestAddressString">func TestAddressString(t *testing.T)</a>

```
searchKey: mail.TestAddressString
tags: [method private test]
```

```Go
func TestAddressString(t *testing.T)
```

### <a id="TestDateParsing" href="#TestDateParsing">func TestDateParsing(t *testing.T)</a>

```
searchKey: mail.TestDateParsing
tags: [method private test]
```

```Go
func TestDateParsing(t *testing.T)
```

### <a id="TestDateParsingCFWS" href="#TestDateParsingCFWS">func TestDateParsingCFWS(t *testing.T)</a>

```
searchKey: mail.TestDateParsingCFWS
tags: [method private test]
```

```Go
func TestDateParsingCFWS(t *testing.T)
```

### <a id="TestEmptyAddress" href="#TestEmptyAddress">func TestEmptyAddress(t *testing.T)</a>

```
searchKey: mail.TestEmptyAddress
tags: [method private test]
```

```Go
func TestEmptyAddress(t *testing.T)
```

### <a id="TestParsing" href="#TestParsing">func TestParsing(t *testing.T)</a>

```
searchKey: mail.TestParsing
tags: [method private test]
```

```Go
func TestParsing(t *testing.T)
```

### <a id="buildDateLayouts" href="#buildDateLayouts">func buildDateLayouts()</a>

```
searchKey: mail.buildDateLayouts
tags: [function private]
```

```Go
func buildDateLayouts()
```

### <a id="headerEq" href="#headerEq">func headerEq(a, b Header) bool</a>

```
searchKey: mail.headerEq
tags: [method private]
```

```Go
func headerEq(a, b Header) bool
```

### <a id="isAtext" href="#isAtext">func isAtext(r rune, dot, permissive bool) bool</a>

```
searchKey: mail.isAtext
tags: [method private]
```

```Go
func isAtext(r rune, dot, permissive bool) bool
```

isAtext reports whether r is an RFC 5322 atext character. If dot is true, period is included. If permissive is true, RFC 5322 3.2.3 specials is included, except '<', '>', ':' and '"'. 

### <a id="isMultibyte" href="#isMultibyte">func isMultibyte(r rune) bool</a>

```
searchKey: mail.isMultibyte
tags: [method private]
```

```Go
func isMultibyte(r rune) bool
```

isMultibyte reports whether r is a multi-byte UTF-8 character as supported by RFC 6532 

### <a id="isQtext" href="#isQtext">func isQtext(r rune) bool</a>

```
searchKey: mail.isQtext
tags: [method private]
```

```Go
func isQtext(r rune) bool
```

isQtext reports whether r is an RFC 5322 qtext character. 

### <a id="isVchar" href="#isVchar">func isVchar(r rune) bool</a>

```
searchKey: mail.isVchar
tags: [method private]
```

```Go
func isVchar(r rune) bool
```

isVchar reports whether r is an RFC 5322 VCHAR character. 

### <a id="isWSP" href="#isWSP">func isWSP(r rune) bool</a>

```
searchKey: mail.isWSP
tags: [method private]
```

```Go
func isWSP(r rune) bool
```

isWSP reports whether r is a WSP (white space). WSP is a space or horizontal tab (RFC 5234 Appendix B). 

### <a id="quoteString" href="#quoteString">func quoteString(s string) string</a>

```
searchKey: mail.quoteString
tags: [method private]
```

```Go
func quoteString(s string) string
```

quoteString renders a string as an RFC 5322 quoted-string. 

