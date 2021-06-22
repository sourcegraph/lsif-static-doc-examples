# Package pem

Package pem implements the PEM data encoding, which originated in Privacy Enhanced Mail. The most common use of PEM encoding today is in TLS keys and certificates. See RFC 1421. 

## Index

* [Constants](#const)
    * [const pemLineLength](#pemLineLength)
    * [const pemTooFewEndingDashes](#pemTooFewEndingDashes)
    * [const pemTooManyEndingDashes](#pemTooManyEndingDashes)
    * [const pemTrailingNonWhitespace](#pemTrailingNonWhitespace)
    * [const pemWrongEndingType](#pemWrongEndingType)
    * [const pemMissingEndingSpace](#pemMissingEndingSpace)
    * [const sixtyFourCharString](#sixtyFourCharString)
* [Variables](#var)
    * [var pemStart](#pemStart)
    * [var pemEnd](#pemEnd)
    * [var pemEndOfLine](#pemEndOfLine)
    * [var nl](#nl)
    * [var getLineTests](#getLineTests)
    * [var badPEMTests](#badPEMTests)
    * [var lineBreakerTests](#lineBreakerTests)
    * [var pemData](#pemData)
    * [var certificate](#certificate)
    * [var privateKey](#privateKey)
    * [var privateKey2](#privateKey2)
    * [var pemPrivateKey2](#pemPrivateKey2)
* [Types](#type)
    * [type Block struct](#Block)
        * [func Decode(data []byte) (p *Block, rest []byte)](#Decode)
        * [func decodeError(data, rest []byte) (*Block, []byte)](#decodeError)
    * [type lineBreaker struct](#lineBreaker)
        * [func (l *lineBreaker) Write(b []byte) (n int, err error)](#lineBreaker.Write)
        * [func (l *lineBreaker) Close() (err error)](#lineBreaker.Close)
    * [type GetLineTest struct](#GetLineTest)
    * [type lineBreakerTest struct](#lineBreakerTest)
* [Functions](#func)
    * [func getLine(data []byte) (line, rest []byte)](#getLine)
    * [func removeSpacesAndTabs(data []byte) []byte](#removeSpacesAndTabs)
    * [func writeHeader(out io.Writer, k, v string) error](#writeHeader)
    * [func Encode(out io.Writer, b *Block) error](#Encode)
    * [func EncodeToMemory(b *Block) []byte](#EncodeToMemory)
    * [func TestGetLine(t *testing.T)](#TestGetLine)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func TestBadDecode(t *testing.T)](#TestBadDecode)
    * [func TestEncode(t *testing.T)](#TestEncode)
    * [func TestLineBreaker(t *testing.T)](#TestLineBreaker)
    * [func TestFuzz(t *testing.T)](#TestFuzz)
    * [func BenchmarkEncode(b *testing.B)](#BenchmarkEncode)
    * [func BenchmarkDecode(b *testing.B)](#BenchmarkDecode)
    * [func TestBadEncode(t *testing.T)](#TestBadEncode)
    * [func testingKey(s string) string](#testingKey)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="pemLineLength" href="#pemLineLength">const pemLineLength</a>

```
searchKey: pem.pemLineLength
```

```Go
const pemLineLength = 64
```

### <a id="pemTooFewEndingDashes" href="#pemTooFewEndingDashes">const pemTooFewEndingDashes</a>

```
searchKey: pem.pemTooFewEndingDashes
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
```

```Go
const pemWrongEndingType = `
-----BEGIN FOO-----
dGVzdA==
-----END BAR-----`
```

### <a id="pemMissingEndingSpace" href="#pemMissingEndingSpace">const pemMissingEndingSpace</a>

```
searchKey: pem.pemMissingEndingSpace
```

```Go
const pemMissingEndingSpace = `
-----BEGIN FOO-----
dGVzdA==
-----ENDBAR-----`
```

### <a id="sixtyFourCharString" href="#sixtyFourCharString">const sixtyFourCharString</a>

```
searchKey: pem.sixtyFourCharString
```

```Go
const sixtyFourCharString = "0123456789012345678901234567890123456789012345678901234567890123"
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="pemStart" href="#pemStart">var pemStart</a>

```
searchKey: pem.pemStart
```

```Go
var pemStart = []byte("\n-----BEGIN ")
```

### <a id="pemEnd" href="#pemEnd">var pemEnd</a>

```
searchKey: pem.pemEnd
```

```Go
var pemEnd = []byte("\n-----END ")
```

### <a id="pemEndOfLine" href="#pemEndOfLine">var pemEndOfLine</a>

```
searchKey: pem.pemEndOfLine
```

```Go
var pemEndOfLine = []byte("-----")
```

### <a id="nl" href="#nl">var nl</a>

```
searchKey: pem.nl
```

```Go
var nl = []byte{'\n'}
```

### <a id="getLineTests" href="#getLineTests">var getLineTests</a>

```
searchKey: pem.getLineTests
```

```Go
var getLineTests = ...
```

### <a id="badPEMTests" href="#badPEMTests">var badPEMTests</a>

```
searchKey: pem.badPEMTests
```

```Go
var badPEMTests = ...
```

### <a id="lineBreakerTests" href="#lineBreakerTests">var lineBreakerTests</a>

```
searchKey: pem.lineBreakerTests
```

```Go
var lineBreakerTests = ...
```

### <a id="pemData" href="#pemData">var pemData</a>

```
searchKey: pem.pemData
```

```Go
var pemData = ...
```

### <a id="certificate" href="#certificate">var certificate</a>

```
searchKey: pem.certificate
```

```Go
var certificate = ...
```

### <a id="privateKey" href="#privateKey">var privateKey</a>

```
searchKey: pem.privateKey
```

```Go
var privateKey = ...
```

### <a id="privateKey2" href="#privateKey2">var privateKey2</a>

```
searchKey: pem.privateKey2
```

```Go
var privateKey2 = ...
```

### <a id="pemPrivateKey2" href="#pemPrivateKey2">var pemPrivateKey2</a>

```
searchKey: pem.pemPrivateKey2
```

```Go
var pemPrivateKey2 = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Block" href="#Block">type Block struct</a>

```
searchKey: pem.Block
tags: [exported]
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
tags: [exported]
```

```Go
func Decode(data []byte) (p *Block, rest []byte)
```

Decode will find the next PEM formatted block (certificate, private key etc) in the input. It returns that block and the remainder of the input. If no PEM data is found, p is nil and the whole of the input is returned in rest. 

#### <a id="decodeError" href="#decodeError">func decodeError(data, rest []byte) (*Block, []byte)</a>

```
searchKey: pem.decodeError
```

```Go
func decodeError(data, rest []byte) (*Block, []byte)
```

### <a id="lineBreaker" href="#lineBreaker">type lineBreaker struct</a>

```
searchKey: pem.lineBreaker
```

```Go
type lineBreaker struct {
	line [pemLineLength]byte
	used int
	out  io.Writer
}
```

#### <a id="lineBreaker.Write" href="#lineBreaker.Write">func (l *lineBreaker) Write(b []byte) (n int, err error)</a>

```
searchKey: pem.lineBreaker.Write
```

```Go
func (l *lineBreaker) Write(b []byte) (n int, err error)
```

#### <a id="lineBreaker.Close" href="#lineBreaker.Close">func (l *lineBreaker) Close() (err error)</a>

```
searchKey: pem.lineBreaker.Close
```

```Go
func (l *lineBreaker) Close() (err error)
```

### <a id="GetLineTest" href="#GetLineTest">type GetLineTest struct</a>

```
searchKey: pem.GetLineTest
```

```Go
type GetLineTest struct {
	in, out1, out2 string
}
```

### <a id="lineBreakerTest" href="#lineBreakerTest">type lineBreakerTest struct</a>

```
searchKey: pem.lineBreakerTest
```

```Go
type lineBreakerTest struct {
	in, out string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="getLine" href="#getLine">func getLine(data []byte) (line, rest []byte)</a>

```
searchKey: pem.getLine
```

```Go
func getLine(data []byte) (line, rest []byte)
```

getLine results the first \r\n or \n delineated line from the given byte array. The line does not include trailing whitespace or the trailing new line bytes. The remainder of the byte array (also not including the new line bytes) is also returned and this will always be smaller than the original argument. 

### <a id="removeSpacesAndTabs" href="#removeSpacesAndTabs">func removeSpacesAndTabs(data []byte) []byte</a>

```
searchKey: pem.removeSpacesAndTabs
```

```Go
func removeSpacesAndTabs(data []byte) []byte
```

removeSpacesAndTabs returns a copy of its input with all spaces and tabs removed, if there were any. Otherwise, the input is returned unchanged. 

The base64 decoder already skips newline characters, so we don't need to filter them out here. 

### <a id="writeHeader" href="#writeHeader">func writeHeader(out io.Writer, k, v string) error</a>

```
searchKey: pem.writeHeader
```

```Go
func writeHeader(out io.Writer, k, v string) error
```

### <a id="Encode" href="#Encode">func Encode(out io.Writer, b *Block) error</a>

```
searchKey: pem.Encode
tags: [exported]
```

```Go
func Encode(out io.Writer, b *Block) error
```

Encode writes the PEM encoding of b to out. 

### <a id="EncodeToMemory" href="#EncodeToMemory">func EncodeToMemory(b *Block) []byte</a>

```
searchKey: pem.EncodeToMemory
tags: [exported]
```

```Go
func EncodeToMemory(b *Block) []byte
```

EncodeToMemory returns the PEM encoding of b. 

If b has invalid headers and cannot be encoded, EncodeToMemory returns nil. If it is important to report details about this error case, use Encode instead. 

### <a id="TestGetLine" href="#TestGetLine">func TestGetLine(t *testing.T)</a>

```
searchKey: pem.TestGetLine
```

```Go
func TestGetLine(t *testing.T)
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: pem.TestDecode
```

```Go
func TestDecode(t *testing.T)
```

### <a id="TestBadDecode" href="#TestBadDecode">func TestBadDecode(t *testing.T)</a>

```
searchKey: pem.TestBadDecode
```

```Go
func TestBadDecode(t *testing.T)
```

### <a id="TestEncode" href="#TestEncode">func TestEncode(t *testing.T)</a>

```
searchKey: pem.TestEncode
```

```Go
func TestEncode(t *testing.T)
```

### <a id="TestLineBreaker" href="#TestLineBreaker">func TestLineBreaker(t *testing.T)</a>

```
searchKey: pem.TestLineBreaker
```

```Go
func TestLineBreaker(t *testing.T)
```

### <a id="TestFuzz" href="#TestFuzz">func TestFuzz(t *testing.T)</a>

```
searchKey: pem.TestFuzz
```

```Go
func TestFuzz(t *testing.T)
```

### <a id="BenchmarkEncode" href="#BenchmarkEncode">func BenchmarkEncode(b *testing.B)</a>

```
searchKey: pem.BenchmarkEncode
```

```Go
func BenchmarkEncode(b *testing.B)
```

### <a id="BenchmarkDecode" href="#BenchmarkDecode">func BenchmarkDecode(b *testing.B)</a>

```
searchKey: pem.BenchmarkDecode
```

```Go
func BenchmarkDecode(b *testing.B)
```

### <a id="TestBadEncode" href="#TestBadEncode">func TestBadEncode(t *testing.T)</a>

```
searchKey: pem.TestBadEncode
```

```Go
func TestBadEncode(t *testing.T)
```

### <a id="testingKey" href="#testingKey">func testingKey(s string) string</a>

```
searchKey: pem.testingKey
```

```Go
func testingKey(s string) string
```

