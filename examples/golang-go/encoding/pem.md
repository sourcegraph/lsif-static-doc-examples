# Package pem

Package pem implements the PEM data encoding, which originated in Privacy Enhanced Mail. The most common use of PEM encoding today is in TLS keys and certificates. See RFC 1421. 

## Index

* [Constants](#const)
    * [const pemLineLength](#pemLineLength)
    * [const pemMissingEndingSpace](#pemMissingEndingSpace)
    * [const pemTooFewEndingDashes](#pemTooFewEndingDashes)
    * [const pemTooManyEndingDashes](#pemTooManyEndingDashes)
    * [const pemTrailingNonWhitespace](#pemTrailingNonWhitespace)
    * [const pemWrongEndingType](#pemWrongEndingType)
    * [const sixtyFourCharString](#sixtyFourCharString)
* [Variables](#var)
    * [var badPEMTests](#badPEMTests)
    * [var certificate](#certificate)
    * [var getLineTests](#getLineTests)
    * [var lineBreakerTests](#lineBreakerTests)
    * [var nl](#nl)
    * [var pemData](#pemData)
    * [var pemEnd](#pemEnd)
    * [var pemEndOfLine](#pemEndOfLine)
    * [var pemPrivateKey2](#pemPrivateKey2)
    * [var pemStart](#pemStart)
    * [var privateKey](#privateKey)
    * [var privateKey2](#privateKey2)
* [Types](#type)
    * [type Block struct](#Block)
        * [func Decode(data []byte) (p *Block, rest []byte)](#Decode)
        * [func decodeError(data, rest []byte) (*Block, []byte)](#decodeError)
    * [type GetLineTest struct](#GetLineTest)
    * [type lineBreaker struct](#lineBreaker)
        * [func (l *lineBreaker) Close() (err error)](#lineBreaker.Close)
        * [func (l *lineBreaker) Write(b []byte) (n int, err error)](#lineBreaker.Write)
    * [type lineBreakerTest struct](#lineBreakerTest)
* [Functions](#func)
    * [func BenchmarkDecode(b *testing.B)](#BenchmarkDecode)
    * [func BenchmarkEncode(b *testing.B)](#BenchmarkEncode)
    * [func Encode(out io.Writer, b *Block) error](#Encode)
    * [func EncodeToMemory(b *Block) []byte](#EncodeToMemory)
    * [func TestBadDecode(t *testing.T)](#TestBadDecode)
    * [func TestBadEncode(t *testing.T)](#TestBadEncode)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func TestEncode(t *testing.T)](#TestEncode)
    * [func TestFuzz(t *testing.T)](#TestFuzz)
    * [func TestGetLine(t *testing.T)](#TestGetLine)
    * [func TestLineBreaker(t *testing.T)](#TestLineBreaker)
    * [func getLine(data []byte) (line, rest []byte)](#getLine)
    * [func removeSpacesAndTabs(data []byte) []byte](#removeSpacesAndTabs)
    * [func testingKey(s string) string](#testingKey)
    * [func writeHeader(out io.Writer, k, v string) error](#writeHeader)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="pemLineLength" href="#pemLineLength">const pemLineLength</a>

```
searchKey: pem.pemLineLength
tags: [constant number private]
```

```Go
const pemLineLength = 64
```

### <a id="pemMissingEndingSpace" href="#pemMissingEndingSpace">const pemMissingEndingSpace</a>

```
searchKey: pem.pemMissingEndingSpace
tags: [constant string private]
```

```Go
const pemMissingEndingSpace = `
-----BEGIN FOO-----
dGVzdA==
-----ENDBAR-----`
```

### <a id="pemTooFewEndingDashes" href="#pemTooFewEndingDashes">const pemTooFewEndingDashes</a>

```
searchKey: pem.pemTooFewEndingDashes
tags: [constant string private]
```

```Go
const pemTooFewEndingDashes = `
-----BEGIN FOO-----
dGVzdA==
-----END FOO----`
```

### <a id="pemTooManyEndingDashes" href="#pemTooManyEndingDashes">const pemTooManyEndingDashes</a>

```
searchKey: pem.pemTooManyEndingDashes
tags: [constant string private]
```

```Go
const pemTooManyEndingDashes = `
-----BEGIN FOO-----
dGVzdA==
-----END FOO------`
```

### <a id="pemTrailingNonWhitespace" href="#pemTrailingNonWhitespace">const pemTrailingNonWhitespace</a>

```
searchKey: pem.pemTrailingNonWhitespace
tags: [constant string private]
```

```Go
const pemTrailingNonWhitespace = `
-----BEGIN FOO-----
dGVzdA==
-----END FOO----- .`
```

### <a id="pemWrongEndingType" href="#pemWrongEndingType">const pemWrongEndingType</a>

```
searchKey: pem.pemWrongEndingType
tags: [constant string private]
```

```Go
const pemWrongEndingType = `
-----BEGIN FOO-----
dGVzdA==
-----END BAR-----`
```

### <a id="sixtyFourCharString" href="#sixtyFourCharString">const sixtyFourCharString</a>

```
searchKey: pem.sixtyFourCharString
tags: [constant string private]
```

```Go
const sixtyFourCharString = "0123456789012345678901234567890123456789012345678901234567890123"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="badPEMTests" href="#badPEMTests">var badPEMTests</a>

```
searchKey: pem.badPEMTests
tags: [variable array struct private]
```

```Go
var badPEMTests = ...
```

### <a id="certificate" href="#certificate">var certificate</a>

```
searchKey: pem.certificate
tags: [variable struct private]
```

```Go
var certificate = ...
```

### <a id="getLineTests" href="#getLineTests">var getLineTests</a>

```
searchKey: pem.getLineTests
tags: [variable array struct private]
```

```Go
var getLineTests = ...
```

### <a id="lineBreakerTests" href="#lineBreakerTests">var lineBreakerTests</a>

```
searchKey: pem.lineBreakerTests
tags: [variable array struct private]
```

```Go
var lineBreakerTests = ...
```

### <a id="nl" href="#nl">var nl</a>

```
searchKey: pem.nl
tags: [variable array number private]
```

```Go
var nl = []byte{'\n'}
```

### <a id="pemData" href="#pemData">var pemData</a>

```
searchKey: pem.pemData
tags: [variable string private]
```

```Go
var pemData = ...
```

### <a id="pemEnd" href="#pemEnd">var pemEnd</a>

```
searchKey: pem.pemEnd
tags: [variable array number private]
```

```Go
var pemEnd = []byte("\n-----END ")
```

### <a id="pemEndOfLine" href="#pemEndOfLine">var pemEndOfLine</a>

```
searchKey: pem.pemEndOfLine
tags: [variable array number private]
```

```Go
var pemEndOfLine = []byte("-----")
```

### <a id="pemPrivateKey2" href="#pemPrivateKey2">var pemPrivateKey2</a>

```
searchKey: pem.pemPrivateKey2
tags: [variable string private]
```

```Go
var pemPrivateKey2 = ...
```

### <a id="pemStart" href="#pemStart">var pemStart</a>

```
searchKey: pem.pemStart
tags: [variable array number private]
```

```Go
var pemStart = []byte("\n-----BEGIN ")
```

### <a id="privateKey" href="#privateKey">var privateKey</a>

```
searchKey: pem.privateKey
tags: [variable struct private]
```

```Go
var privateKey = ...
```

### <a id="privateKey2" href="#privateKey2">var privateKey2</a>

```
searchKey: pem.privateKey2
tags: [variable struct private]
```

```Go
var privateKey2 = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Block" href="#Block">type Block struct</a>

```
searchKey: pem.Block
tags: [struct]
```

```Go
type Block struct {
	Type    string            // The type, taken from the preamble (i.e. "RSA PRIVATE KEY").
	Headers map[string]string // Optional headers.
	Bytes   []byte            // The decoded bytes of the contents. Typically a DER encoded ASN.1 structure.
}
```

A Block represents a PEM encoded structure. 

The encoded form is: 

```
-----BEGIN Type-----
Headers
base64-encoded Bytes
-----END Type-----

```
where Headers is a possibly empty sequence of Key: Value lines. 

#### <a id="Decode" href="#Decode">func Decode(data []byte) (p *Block, rest []byte)</a>

```
searchKey: pem.Decode
tags: [method]
```

```Go
func Decode(data []byte) (p *Block, rest []byte)
```

Decode will find the next PEM formatted block (certificate, private key etc) in the input. It returns that block and the remainder of the input. If no PEM data is found, p is nil and the whole of the input is returned in rest. 

#### <a id="decodeError" href="#decodeError">func decodeError(data, rest []byte) (*Block, []byte)</a>

```
searchKey: pem.decodeError
tags: [method private]
```

```Go
func decodeError(data, rest []byte) (*Block, []byte)
```

### <a id="GetLineTest" href="#GetLineTest">type GetLineTest struct</a>

```
searchKey: pem.GetLineTest
tags: [struct private]
```

```Go
type GetLineTest struct {
	in, out1, out2 string
}
```

### <a id="lineBreaker" href="#lineBreaker">type lineBreaker struct</a>

```
searchKey: pem.lineBreaker
tags: [struct private]
```

```Go
type lineBreaker struct {
	line [pemLineLength]byte
	used int
	out  io.Writer
}
```

#### <a id="lineBreaker.Close" href="#lineBreaker.Close">func (l *lineBreaker) Close() (err error)</a>

```
searchKey: pem.lineBreaker.Close
tags: [function private]
```

```Go
func (l *lineBreaker) Close() (err error)
```

#### <a id="lineBreaker.Write" href="#lineBreaker.Write">func (l *lineBreaker) Write(b []byte) (n int, err error)</a>

```
searchKey: pem.lineBreaker.Write
tags: [method private]
```

```Go
func (l *lineBreaker) Write(b []byte) (n int, err error)
```

### <a id="lineBreakerTest" href="#lineBreakerTest">type lineBreakerTest struct</a>

```
searchKey: pem.lineBreakerTest
tags: [struct private]
```

```Go
type lineBreakerTest struct {
	in, out string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkDecode" href="#BenchmarkDecode">func BenchmarkDecode(b *testing.B)</a>

```
searchKey: pem.BenchmarkDecode
tags: [method private benchmark]
```

```Go
func BenchmarkDecode(b *testing.B)
```

### <a id="BenchmarkEncode" href="#BenchmarkEncode">func BenchmarkEncode(b *testing.B)</a>

```
searchKey: pem.BenchmarkEncode
tags: [method private benchmark]
```

```Go
func BenchmarkEncode(b *testing.B)
```

### <a id="Encode" href="#Encode">func Encode(out io.Writer, b *Block) error</a>

```
searchKey: pem.Encode
tags: [method]
```

```Go
func Encode(out io.Writer, b *Block) error
```

Encode writes the PEM encoding of b to out. 

### <a id="EncodeToMemory" href="#EncodeToMemory">func EncodeToMemory(b *Block) []byte</a>

```
searchKey: pem.EncodeToMemory
tags: [method]
```

```Go
func EncodeToMemory(b *Block) []byte
```

EncodeToMemory returns the PEM encoding of b. 

If b has invalid headers and cannot be encoded, EncodeToMemory returns nil. If it is important to report details about this error case, use Encode instead. 

### <a id="TestBadDecode" href="#TestBadDecode">func TestBadDecode(t *testing.T)</a>

```
searchKey: pem.TestBadDecode
tags: [method private test]
```

```Go
func TestBadDecode(t *testing.T)
```

### <a id="TestBadEncode" href="#TestBadEncode">func TestBadEncode(t *testing.T)</a>

```
searchKey: pem.TestBadEncode
tags: [method private test]
```

```Go
func TestBadEncode(t *testing.T)
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: pem.TestDecode
tags: [method private test]
```

```Go
func TestDecode(t *testing.T)
```

### <a id="TestEncode" href="#TestEncode">func TestEncode(t *testing.T)</a>

```
searchKey: pem.TestEncode
tags: [method private test]
```

```Go
func TestEncode(t *testing.T)
```

### <a id="TestFuzz" href="#TestFuzz">func TestFuzz(t *testing.T)</a>

```
searchKey: pem.TestFuzz
tags: [method private test]
```

```Go
func TestFuzz(t *testing.T)
```

### <a id="TestGetLine" href="#TestGetLine">func TestGetLine(t *testing.T)</a>

```
searchKey: pem.TestGetLine
tags: [method private test]
```

```Go
func TestGetLine(t *testing.T)
```

### <a id="TestLineBreaker" href="#TestLineBreaker">func TestLineBreaker(t *testing.T)</a>

```
searchKey: pem.TestLineBreaker
tags: [method private test]
```

```Go
func TestLineBreaker(t *testing.T)
```

### <a id="getLine" href="#getLine">func getLine(data []byte) (line, rest []byte)</a>

```
searchKey: pem.getLine
tags: [method private]
```

```Go
func getLine(data []byte) (line, rest []byte)
```

getLine results the first \r\n or \n delineated line from the given byte array. The line does not include trailing whitespace or the trailing new line bytes. The remainder of the byte array (also not including the new line bytes) is also returned and this will always be smaller than the original argument. 

### <a id="removeSpacesAndTabs" href="#removeSpacesAndTabs">func removeSpacesAndTabs(data []byte) []byte</a>

```
searchKey: pem.removeSpacesAndTabs
tags: [method private]
```

```Go
func removeSpacesAndTabs(data []byte) []byte
```

removeSpacesAndTabs returns a copy of its input with all spaces and tabs removed, if there were any. Otherwise, the input is returned unchanged. 

The base64 decoder already skips newline characters, so we don't need to filter them out here. 

### <a id="testingKey" href="#testingKey">func testingKey(s string) string</a>

```
searchKey: pem.testingKey
tags: [method private]
```

```Go
func testingKey(s string) string
```

### <a id="writeHeader" href="#writeHeader">func writeHeader(out io.Writer, k, v string) error</a>

```
searchKey: pem.writeHeader
tags: [method private]
```

```Go
func writeHeader(out io.Writer, k, v string) error
```

