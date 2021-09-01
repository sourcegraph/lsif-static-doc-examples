# Package textproto

Package textproto implements generic support for text-based request/response protocols in the style of HTTP, NNTP, and SMTP. 

The package provides: 

Error, which represents a numeric error response from a server. 

Pipeline, to manage pipelined requests and responses in a client. 

Reader, to read numeric response code lines, key: value headers, lines wrapped with leading spaces on continuation lines, and whole text blocks ending with a dot on a line by itself. 

Writer, to write dot-encoded text blocks. 

Conn, a convenient packaging of Reader, Writer, and Pipeline for use with a single network connection. 

## Index

* [Constants](#const)
    * [const toLower](#toLower)
    * [const wstateBegin](#wstateBegin)
    * [const wstateBeginLine](#wstateBeginLine)
    * [const wstateCR](#wstateCR)
    * [const wstateData](#wstateData)
* [Variables](#var)
    * [var canonicalHeaderKeyTests](#canonicalHeaderKeyTests)
    * [var clientHeaders](#clientHeaders)
    * [var commonHeader](#commonHeader)
    * [var commonHeaderOnce](#commonHeaderOnce)
    * [var crnl](#crnl)
    * [var dotcrnl](#dotcrnl)
    * [var isTokenTable](#isTokenTable)
    * [var readResponseTests](#readResponseTests)
    * [var serverHeaders](#serverHeaders)
* [Types](#type)
    * [type Conn struct](#Conn)
        * [func Dial(network, addr string) (*Conn, error)](#Dial)
        * [func NewConn(conn io.ReadWriteCloser) *Conn](#NewConn)
        * [func (c *Conn) Close() error](#Conn.Close)
        * [func (c *Conn) Cmd(format string, args ...interface{}) (id uint, err error)](#Conn.Cmd)
    * [type Error struct](#Error)
        * [func (e *Error) Error() string](#Error.Error)
    * [type MIMEHeader map[string][]string](#MIMEHeader)
        * [func (h MIMEHeader) Add(key, value string)](#MIMEHeader.Add)
        * [func (h MIMEHeader) Del(key string)](#MIMEHeader.Del)
        * [func (h MIMEHeader) Get(key string) string](#MIMEHeader.Get)
        * [func (h MIMEHeader) Set(key, value string)](#MIMEHeader.Set)
        * [func (h MIMEHeader) Values(key string) []string](#MIMEHeader.Values)
    * [type Pipeline struct](#Pipeline)
        * [func (p *Pipeline) EndRequest(id uint)](#Pipeline.EndRequest)
        * [func (p *Pipeline) EndResponse(id uint)](#Pipeline.EndResponse)
        * [func (p *Pipeline) Next() uint](#Pipeline.Next)
        * [func (p *Pipeline) StartRequest(id uint)](#Pipeline.StartRequest)
        * [func (p *Pipeline) StartResponse(id uint)](#Pipeline.StartResponse)
    * [type ProtocolError string](#ProtocolError)
        * [func (p ProtocolError) Error() string](#ProtocolError.Error)
    * [type Reader struct](#Reader)
        * [func NewReader(r *bufio.Reader) *Reader](#NewReader)
        * [func reader(s string) *Reader](#reader)
        * [func (r *Reader) DotReader() io.Reader](#Reader.DotReader)
        * [func (r *Reader) ReadCodeLine(expectCode int) (code int, message string, err error)](#Reader.ReadCodeLine)
        * [func (r *Reader) ReadContinuedLine() (string, error)](#Reader.ReadContinuedLine)
        * [func (r *Reader) ReadContinuedLineBytes() ([]byte, error)](#Reader.ReadContinuedLineBytes)
        * [func (r *Reader) ReadDotBytes() ([]byte, error)](#Reader.ReadDotBytes)
        * [func (r *Reader) ReadDotLines() ([]string, error)](#Reader.ReadDotLines)
        * [func (r *Reader) ReadLine() (string, error)](#Reader.ReadLine)
        * [func (r *Reader) ReadLineBytes() ([]byte, error)](#Reader.ReadLineBytes)
        * [func (r *Reader) ReadMIMEHeader() (MIMEHeader, error)](#Reader.ReadMIMEHeader)
        * [func (r *Reader) ReadResponse(expectCode int) (code int, message string, err error)](#Reader.ReadResponse)
        * [func (r *Reader) closeDot()](#Reader.closeDot)
        * [func (r *Reader) readCodeLine(expectCode int) (code int, continued bool, message string, err error)](#Reader.readCodeLine)
        * [func (r *Reader) readContinuedLineSlice(validateFirstLine func([]byte) error) ([]byte, error)](#Reader.readContinuedLineSlice)
        * [func (r *Reader) readLineSlice() ([]byte, error)](#Reader.readLineSlice)
        * [func (r *Reader) skipSpace() int](#Reader.skipSpace)
        * [func (r *Reader) upcomingHeaderNewlines() (n int)](#Reader.upcomingHeaderNewlines)
    * [type Writer struct](#Writer)
        * [func NewWriter(w *bufio.Writer) *Writer](#NewWriter)
        * [func (w *Writer) DotWriter() io.WriteCloser](#Writer.DotWriter)
        * [func (w *Writer) PrintfLine(format string, args ...interface{}) error](#Writer.PrintfLine)
        * [func (w *Writer) closeDot()](#Writer.closeDot)
    * [type canonicalHeaderKeyTest struct](#canonicalHeaderKeyTest)
    * [type dotReader struct](#dotReader)
        * [func (d *dotReader) Read(b []byte) (n int, err error)](#dotReader.Read)
    * [type dotWriter struct](#dotWriter)
        * [func (d *dotWriter) Close() error](#dotWriter.Close)
        * [func (d *dotWriter) Write(b []byte) (n int, err error)](#dotWriter.Write)
    * [type readResponseTest struct](#readResponseTest)
    * [type sequencer struct](#sequencer)
        * [func (s *sequencer) End(id uint)](#sequencer.End)
        * [func (s *sequencer) Start(id uint)](#sequencer.Start)
* [Functions](#func)
    * [func BenchmarkReadMIMEHeader(b *testing.B)](#BenchmarkReadMIMEHeader)
    * [func BenchmarkUncommon(b *testing.B)](#BenchmarkUncommon)
    * [func CanonicalMIMEHeaderKey(s string) string](#CanonicalMIMEHeaderKey)
    * [func TestCanonicalMIMEHeaderKey(t *testing.T)](#TestCanonicalMIMEHeaderKey)
    * [func TestCommonHeaders(t *testing.T)](#TestCommonHeaders)
    * [func TestDotWriter(t *testing.T)](#TestDotWriter)
    * [func TestDotWriterCloseEmptyWrite(t *testing.T)](#TestDotWriterCloseEmptyWrite)
    * [func TestDotWriterCloseNoWrite(t *testing.T)](#TestDotWriterCloseNoWrite)
    * [func TestLargeReadMIMEHeader(t *testing.T)](#TestLargeReadMIMEHeader)
    * [func TestMIMEHeaderMultipleValues(t *testing.T)](#TestMIMEHeaderMultipleValues)
    * [func TestPrintfLine(t *testing.T)](#TestPrintfLine)
    * [func TestRFC959Lines(t *testing.T)](#TestRFC959Lines)
    * [func TestReadCodeLine(t *testing.T)](#TestReadCodeLine)
    * [func TestReadContinuedLine(t *testing.T)](#TestReadContinuedLine)
    * [func TestReadDotBytes(t *testing.T)](#TestReadDotBytes)
    * [func TestReadDotLines(t *testing.T)](#TestReadDotLines)
    * [func TestReadLine(t *testing.T)](#TestReadLine)
    * [func TestReadMIMEHeader(t *testing.T)](#TestReadMIMEHeader)
    * [func TestReadMIMEHeaderMalformed(t *testing.T)](#TestReadMIMEHeaderMalformed)
    * [func TestReadMIMEHeaderNoKey(t *testing.T)](#TestReadMIMEHeaderNoKey)
    * [func TestReadMIMEHeaderNonCompliant(t *testing.T)](#TestReadMIMEHeaderNonCompliant)
    * [func TestReadMIMEHeaderSingle(t *testing.T)](#TestReadMIMEHeaderSingle)
    * [func TestReadMIMEHeaderTrimContinued(t *testing.T)](#TestReadMIMEHeaderTrimContinued)
    * [func TestReadMultiLineError(t *testing.T)](#TestReadMultiLineError)
    * [func TrimBytes(b []byte) []byte](#TrimBytes)
    * [func TrimString(s string) string](#TrimString)
    * [func canonicalMIMEHeaderKey(a []byte) string](#canonicalMIMEHeaderKey)
    * [func initCommonHeader()](#initCommonHeader)
    * [func isASCIILetter(b byte) bool](#isASCIILetter)
    * [func isASCIISpace(b byte) bool](#isASCIISpace)
    * [func mustHaveFieldNameColon(line []byte) error](#mustHaveFieldNameColon)
    * [func noValidation(_ []byte) error](#noValidation)
    * [func parseCodeLine(line string, expectCode int) (code int, continued bool, message string, err error)](#parseCodeLine)
    * [func trim(s []byte) []byte](#trim)
    * [func validHeaderFieldByte(b byte) bool](#validHeaderFieldByte)


## <a id="const" href="#const">Constants</a>

### <a id="toLower" href="#toLower">const toLower</a>

```
searchKey: textproto.toLower
tags: [constant number private]
```

```Go
const toLower = 'a' - 'A'
```

### <a id="wstateBegin" href="#wstateBegin">const wstateBegin</a>

```
searchKey: textproto.wstateBegin
tags: [constant number private]
```

```Go
const wstateBegin = iota // initial state; must be zero

```

### <a id="wstateBeginLine" href="#wstateBeginLine">const wstateBeginLine</a>

```
searchKey: textproto.wstateBeginLine
tags: [constant number private]
```

```Go
const wstateBeginLine // beginning of line

```

### <a id="wstateCR" href="#wstateCR">const wstateCR</a>

```
searchKey: textproto.wstateCR
tags: [constant number private]
```

```Go
const wstateCR // wrote \r (possibly at end of line)

```

### <a id="wstateData" href="#wstateData">const wstateData</a>

```
searchKey: textproto.wstateData
tags: [constant number private]
```

```Go
const wstateData // writing data in middle of line

```

## <a id="var" href="#var">Variables</a>

### <a id="canonicalHeaderKeyTests" href="#canonicalHeaderKeyTests">var canonicalHeaderKeyTests</a>

```
searchKey: textproto.canonicalHeaderKeyTests
tags: [variable array struct private]
```

```Go
var canonicalHeaderKeyTests = ...
```

### <a id="clientHeaders" href="#clientHeaders">var clientHeaders</a>

```
searchKey: textproto.clientHeaders
tags: [variable string private]
```

```Go
var clientHeaders = ...
```

### <a id="commonHeader" href="#commonHeader">var commonHeader</a>

```
searchKey: textproto.commonHeader
tags: [variable object private]
```

```Go
var commonHeader map[string]string
```

commonHeader interns common header strings. 

### <a id="commonHeaderOnce" href="#commonHeaderOnce">var commonHeaderOnce</a>

```
searchKey: textproto.commonHeaderOnce
tags: [variable struct private]
```

```Go
var commonHeaderOnce sync.Once
```

### <a id="crnl" href="#crnl">var crnl</a>

```
searchKey: textproto.crnl
tags: [variable array number private]
```

```Go
var crnl = []byte{'\r', '\n'}
```

### <a id="dotcrnl" href="#dotcrnl">var dotcrnl</a>

```
searchKey: textproto.dotcrnl
tags: [variable array number private]
```

```Go
var dotcrnl = []byte{'.', '\r', '\n'}
```

### <a id="isTokenTable" href="#isTokenTable">var isTokenTable</a>

```
searchKey: textproto.isTokenTable
tags: [variable array boolean private]
```

```Go
var isTokenTable = ...
```

isTokenTable is a copy of net/http/lex.go's isTokenTable. See [https://httpwg.github.io/specs/rfc7230.html#rule.token.separators](https://httpwg.github.io/specs/rfc7230.html#rule.token.separators) 

### <a id="readResponseTests" href="#readResponseTests">var readResponseTests</a>

```
searchKey: textproto.readResponseTests
tags: [variable array struct private]
```

```Go
var readResponseTests = ...
```

### <a id="serverHeaders" href="#serverHeaders">var serverHeaders</a>

```
searchKey: textproto.serverHeaders
tags: [variable string private]
```

```Go
var serverHeaders = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Conn" href="#Conn">type Conn struct</a>

```
searchKey: textproto.Conn
tags: [struct]
```

```Go
type Conn struct {
	Reader
	Writer
	Pipeline
	conn io.ReadWriteCloser
}
```

A Conn represents a textual network protocol connection. It consists of a Reader and Writer to manage I/O and a Pipeline to sequence concurrent requests on the connection. These embedded types carry methods with them; see the documentation of those types for details. 

#### <a id="Dial" href="#Dial">func Dial(network, addr string) (*Conn, error)</a>

```
searchKey: textproto.Dial
tags: [function]
```

```Go
func Dial(network, addr string) (*Conn, error)
```

Dial connects to the given address on the given network using net.Dial and then returns a new Conn for the connection. 

#### <a id="NewConn" href="#NewConn">func NewConn(conn io.ReadWriteCloser) *Conn</a>

```
searchKey: textproto.NewConn
tags: [function]
```

```Go
func NewConn(conn io.ReadWriteCloser) *Conn
```

NewConn returns a new Conn using conn for I/O. 

#### <a id="Conn.Close" href="#Conn.Close">func (c *Conn) Close() error</a>

```
searchKey: textproto.Conn.Close
tags: [method]
```

```Go
func (c *Conn) Close() error
```

Close closes the connection. 

#### <a id="Conn.Cmd" href="#Conn.Cmd">func (c *Conn) Cmd(format string, args ...interface{}) (id uint, err error)</a>

```
searchKey: textproto.Conn.Cmd
tags: [method]
```

```Go
func (c *Conn) Cmd(format string, args ...interface{}) (id uint, err error)
```

Cmd is a convenience method that sends a command after waiting its turn in the pipeline. The command text is the result of formatting format with args and appending \r\n. Cmd returns the id of the command, for use with StartResponse and EndResponse. 

For example, a client might run a HELP command that returns a dot-body by using: 

```
id, err := c.Cmd("HELP")
if err != nil {
	return nil, err
}

c.StartResponse(id)
defer c.EndResponse(id)

if _, _, err = c.ReadCodeLine(110); err != nil {
	return nil, err
}
text, err := c.ReadDotBytes()
if err != nil {
	return nil, err
}
return c.ReadCodeLine(250)

```
### <a id="Error" href="#Error">type Error struct</a>

```
searchKey: textproto.Error
tags: [struct]
```

```Go
type Error struct {
	Code int
	Msg  string
}
```

An Error represents a numeric error response from a server. 

#### <a id="Error.Error" href="#Error.Error">func (e *Error) Error() string</a>

```
searchKey: textproto.Error.Error
tags: [method]
```

```Go
func (e *Error) Error() string
```

### <a id="MIMEHeader" href="#MIMEHeader">type MIMEHeader map[string][]string</a>

```
searchKey: textproto.MIMEHeader
tags: [object]
```

```Go
type MIMEHeader map[string][]string
```

A MIMEHeader represents a MIME-style header mapping keys to sets of values. 

#### <a id="MIMEHeader.Add" href="#MIMEHeader.Add">func (h MIMEHeader) Add(key, value string)</a>

```
searchKey: textproto.MIMEHeader.Add
tags: [method]
```

```Go
func (h MIMEHeader) Add(key, value string)
```

Add adds the key, value pair to the header. It appends to any existing values associated with key. 

#### <a id="MIMEHeader.Del" href="#MIMEHeader.Del">func (h MIMEHeader) Del(key string)</a>

```
searchKey: textproto.MIMEHeader.Del
tags: [method]
```

```Go
func (h MIMEHeader) Del(key string)
```

Del deletes the values associated with key. 

#### <a id="MIMEHeader.Get" href="#MIMEHeader.Get">func (h MIMEHeader) Get(key string) string</a>

```
searchKey: textproto.MIMEHeader.Get
tags: [method]
```

```Go
func (h MIMEHeader) Get(key string) string
```

Get gets the first value associated with the given key. It is case insensitive; CanonicalMIMEHeaderKey is used to canonicalize the provided key. If there are no values associated with the key, Get returns "". To use non-canonical keys, access the map directly. 

#### <a id="MIMEHeader.Set" href="#MIMEHeader.Set">func (h MIMEHeader) Set(key, value string)</a>

```
searchKey: textproto.MIMEHeader.Set
tags: [method]
```

```Go
func (h MIMEHeader) Set(key, value string)
```

Set sets the header entries associated with key to the single element value. It replaces any existing values associated with key. 

#### <a id="MIMEHeader.Values" href="#MIMEHeader.Values">func (h MIMEHeader) Values(key string) []string</a>

```
searchKey: textproto.MIMEHeader.Values
tags: [method]
```

```Go
func (h MIMEHeader) Values(key string) []string
```

Values returns all values associated with the given key. It is case insensitive; CanonicalMIMEHeaderKey is used to canonicalize the provided key. To use non-canonical keys, access the map directly. The returned slice is not a copy. 

### <a id="Pipeline" href="#Pipeline">type Pipeline struct</a>

```
searchKey: textproto.Pipeline
tags: [struct]
```

```Go
type Pipeline struct {
	mu       sync.Mutex
	id       uint
	request  sequencer
	response sequencer
}
```

A Pipeline manages a pipelined in-order request/response sequence. 

To use a Pipeline p to manage multiple clients on a connection, each client should run: 

```
id := p.Next()	// take a number

p.StartRequest(id)	// wait for turn to send request
«send request»
p.EndRequest(id)	// notify Pipeline that request is sent

p.StartResponse(id)	// wait for turn to read response
«read response»
p.EndResponse(id)	// notify Pipeline that response is read

```
A pipelined server can use the same calls to ensure that responses computed in parallel are written in the correct order. 

#### <a id="Pipeline.EndRequest" href="#Pipeline.EndRequest">func (p *Pipeline) EndRequest(id uint)</a>

```
searchKey: textproto.Pipeline.EndRequest
tags: [method]
```

```Go
func (p *Pipeline) EndRequest(id uint)
```

EndRequest notifies p that the request with the given id has been sent (or, if this is a server, received). 

#### <a id="Pipeline.EndResponse" href="#Pipeline.EndResponse">func (p *Pipeline) EndResponse(id uint)</a>

```
searchKey: textproto.Pipeline.EndResponse
tags: [method]
```

```Go
func (p *Pipeline) EndResponse(id uint)
```

EndResponse notifies p that the response with the given id has been received (or, if this is a server, sent). 

#### <a id="Pipeline.Next" href="#Pipeline.Next">func (p *Pipeline) Next() uint</a>

```
searchKey: textproto.Pipeline.Next
tags: [method]
```

```Go
func (p *Pipeline) Next() uint
```

Next returns the next id for a request/response pair. 

#### <a id="Pipeline.StartRequest" href="#Pipeline.StartRequest">func (p *Pipeline) StartRequest(id uint)</a>

```
searchKey: textproto.Pipeline.StartRequest
tags: [method]
```

```Go
func (p *Pipeline) StartRequest(id uint)
```

StartRequest blocks until it is time to send (or, if this is a server, receive) the request with the given id. 

#### <a id="Pipeline.StartResponse" href="#Pipeline.StartResponse">func (p *Pipeline) StartResponse(id uint)</a>

```
searchKey: textproto.Pipeline.StartResponse
tags: [method]
```

```Go
func (p *Pipeline) StartResponse(id uint)
```

StartResponse blocks until it is time to receive (or, if this is a server, send) the request with the given id. 

### <a id="ProtocolError" href="#ProtocolError">type ProtocolError string</a>

```
searchKey: textproto.ProtocolError
tags: [string]
```

```Go
type ProtocolError string
```

A ProtocolError describes a protocol violation such as an invalid response or a hung-up connection. 

#### <a id="ProtocolError.Error" href="#ProtocolError.Error">func (p ProtocolError) Error() string</a>

```
searchKey: textproto.ProtocolError.Error
tags: [method]
```

```Go
func (p ProtocolError) Error() string
```

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: textproto.Reader
tags: [struct]
```

```Go
type Reader struct {
	R   *bufio.Reader
	dot *dotReader
	buf []byte // a re-usable buffer for readContinuedLineSlice
}
```

A Reader implements convenience methods for reading requests or responses from a text protocol network connection. 

#### <a id="NewReader" href="#NewReader">func NewReader(r *bufio.Reader) *Reader</a>

```
searchKey: textproto.NewReader
tags: [function]
```

```Go
func NewReader(r *bufio.Reader) *Reader
```

NewReader returns a new Reader reading from r. 

To avoid denial of service attacks, the provided bufio.Reader should be reading from an io.LimitReader or similar Reader to bound the size of responses. 

#### <a id="reader" href="#reader">func reader(s string) *Reader</a>

```
searchKey: textproto.reader
tags: [function private]
```

```Go
func reader(s string) *Reader
```

#### <a id="Reader.DotReader" href="#Reader.DotReader">func (r *Reader) DotReader() io.Reader</a>

```
searchKey: textproto.Reader.DotReader
tags: [method]
```

```Go
func (r *Reader) DotReader() io.Reader
```

DotReader returns a new Reader that satisfies Reads using the decoded text of a dot-encoded block read from r. The returned Reader is only valid until the next call to a method on r. 

Dot encoding is a common framing used for data blocks in text protocols such as SMTP.  The data consists of a sequence of lines, each of which ends in "\r\n".  The sequence itself ends at a line containing just a dot: ".\r\n".  Lines beginning with a dot are escaped with an additional dot to avoid looking like the end of the sequence. 

The decoded form returned by the Reader's Read method rewrites the "\r\n" line endings into the simpler "\n", removes leading dot escapes if present, and stops with error io.EOF after consuming (and discarding) the end-of-sequence line. 

#### <a id="Reader.ReadCodeLine" href="#Reader.ReadCodeLine">func (r *Reader) ReadCodeLine(expectCode int) (code int, message string, err error)</a>

```
searchKey: textproto.Reader.ReadCodeLine
tags: [method]
```

```Go
func (r *Reader) ReadCodeLine(expectCode int) (code int, message string, err error)
```

ReadCodeLine reads a response code line of the form 

```
code message

```
where code is a three-digit status code and the message extends to the rest of the line. An example of such a line is: 

```
220 plan9.bell-labs.com ESMTP

```
If the prefix of the status does not match the digits in expectCode, ReadCodeLine returns with err set to &Error{code, message}. For example, if expectCode is 31, an error will be returned if the status is not in the range [310,319]. 

If the response is multi-line, ReadCodeLine returns an error. 

An expectCode <= 0 disables the check of the status code. 

#### <a id="Reader.ReadContinuedLine" href="#Reader.ReadContinuedLine">func (r *Reader) ReadContinuedLine() (string, error)</a>

```
searchKey: textproto.Reader.ReadContinuedLine
tags: [method]
```

```Go
func (r *Reader) ReadContinuedLine() (string, error)
```

ReadContinuedLine reads a possibly continued line from r, eliding the final trailing ASCII white space. Lines after the first are considered continuations if they begin with a space or tab character. In the returned data, continuation lines are separated from the previous line only by a single space: the newline and leading white space are removed. 

For example, consider this input: 

```
Line 1
  continued...
Line 2

```
The first call to ReadContinuedLine will return "Line 1 continued..." and the second will return "Line 2". 

Empty lines are never continued. 

#### <a id="Reader.ReadContinuedLineBytes" href="#Reader.ReadContinuedLineBytes">func (r *Reader) ReadContinuedLineBytes() ([]byte, error)</a>

```
searchKey: textproto.Reader.ReadContinuedLineBytes
tags: [method]
```

```Go
func (r *Reader) ReadContinuedLineBytes() ([]byte, error)
```

ReadContinuedLineBytes is like ReadContinuedLine but returns a []byte instead of a string. 

#### <a id="Reader.ReadDotBytes" href="#Reader.ReadDotBytes">func (r *Reader) ReadDotBytes() ([]byte, error)</a>

```
searchKey: textproto.Reader.ReadDotBytes
tags: [method]
```

```Go
func (r *Reader) ReadDotBytes() ([]byte, error)
```

ReadDotBytes reads a dot-encoding and returns the decoded data. 

See the documentation for the DotReader method for details about dot-encoding. 

#### <a id="Reader.ReadDotLines" href="#Reader.ReadDotLines">func (r *Reader) ReadDotLines() ([]string, error)</a>

```
searchKey: textproto.Reader.ReadDotLines
tags: [method]
```

```Go
func (r *Reader) ReadDotLines() ([]string, error)
```

ReadDotLines reads a dot-encoding and returns a slice containing the decoded lines, with the final \r\n or \n elided from each. 

See the documentation for the DotReader method for details about dot-encoding. 

#### <a id="Reader.ReadLine" href="#Reader.ReadLine">func (r *Reader) ReadLine() (string, error)</a>

```
searchKey: textproto.Reader.ReadLine
tags: [method]
```

```Go
func (r *Reader) ReadLine() (string, error)
```

ReadLine reads a single line from r, eliding the final \n or \r\n from the returned string. 

#### <a id="Reader.ReadLineBytes" href="#Reader.ReadLineBytes">func (r *Reader) ReadLineBytes() ([]byte, error)</a>

```
searchKey: textproto.Reader.ReadLineBytes
tags: [method]
```

```Go
func (r *Reader) ReadLineBytes() ([]byte, error)
```

ReadLineBytes is like ReadLine but returns a []byte instead of a string. 

#### <a id="Reader.ReadMIMEHeader" href="#Reader.ReadMIMEHeader">func (r *Reader) ReadMIMEHeader() (MIMEHeader, error)</a>

```
searchKey: textproto.Reader.ReadMIMEHeader
tags: [method]
```

```Go
func (r *Reader) ReadMIMEHeader() (MIMEHeader, error)
```

ReadMIMEHeader reads a MIME-style header from r. The header is a sequence of possibly continued Key: Value lines ending in a blank line. The returned map m maps CanonicalMIMEHeaderKey(key) to a sequence of values in the same order encountered in the input. 

For example, consider this input: 

```
My-Key: Value 1
Long-Key: Even
       Longer Value
My-Key: Value 2

```
Given that input, ReadMIMEHeader returns the map: 

```
map[string][]string{
	"My-Key": {"Value 1", "Value 2"},
	"Long-Key": {"Even Longer Value"},
}

```
#### <a id="Reader.ReadResponse" href="#Reader.ReadResponse">func (r *Reader) ReadResponse(expectCode int) (code int, message string, err error)</a>

```
searchKey: textproto.Reader.ReadResponse
tags: [method]
```

```Go
func (r *Reader) ReadResponse(expectCode int) (code int, message string, err error)
```

ReadResponse reads a multi-line response of the form: 

```
code-message line 1
code-message line 2
...
code message line n

```
where code is a three-digit status code. The first line starts with the code and a hyphen. The response is terminated by a line that starts with the same code followed by a space. Each line in message is separated by a newline (\n). 

See page 36 of RFC 959 ([https://www.ietf.org/rfc/rfc959.txt](https://www.ietf.org/rfc/rfc959.txt)) for details of another form of response accepted: 

```
code-message line 1
message line 2
...
code message line n

```
If the prefix of the status does not match the digits in expectCode, ReadResponse returns with err set to &Error{code, message}. For example, if expectCode is 31, an error will be returned if the status is not in the range [310,319]. 

An expectCode <= 0 disables the check of the status code. 

#### <a id="Reader.closeDot" href="#Reader.closeDot">func (r *Reader) closeDot()</a>

```
searchKey: textproto.Reader.closeDot
tags: [method private]
```

```Go
func (r *Reader) closeDot()
```

closeDot drains the current DotReader if any, making sure that it reads until the ending dot line. 

#### <a id="Reader.readCodeLine" href="#Reader.readCodeLine">func (r *Reader) readCodeLine(expectCode int) (code int, continued bool, message string, err error)</a>

```
searchKey: textproto.Reader.readCodeLine
tags: [method private]
```

```Go
func (r *Reader) readCodeLine(expectCode int) (code int, continued bool, message string, err error)
```

#### <a id="Reader.readContinuedLineSlice" href="#Reader.readContinuedLineSlice">func (r *Reader) readContinuedLineSlice(validateFirstLine func([]byte) error) ([]byte, error)</a>

```
searchKey: textproto.Reader.readContinuedLineSlice
tags: [method private]
```

```Go
func (r *Reader) readContinuedLineSlice(validateFirstLine func([]byte) error) ([]byte, error)
```

readContinuedLineSlice reads continued lines from the reader buffer, returning a byte slice with all lines. The validateFirstLine function is run on the first read line, and if it returns an error then this error is returned from readContinuedLineSlice. 

#### <a id="Reader.readLineSlice" href="#Reader.readLineSlice">func (r *Reader) readLineSlice() ([]byte, error)</a>

```
searchKey: textproto.Reader.readLineSlice
tags: [method private]
```

```Go
func (r *Reader) readLineSlice() ([]byte, error)
```

#### <a id="Reader.skipSpace" href="#Reader.skipSpace">func (r *Reader) skipSpace() int</a>

```
searchKey: textproto.Reader.skipSpace
tags: [method private]
```

```Go
func (r *Reader) skipSpace() int
```

skipSpace skips R over all spaces and returns the number of bytes skipped. 

#### <a id="Reader.upcomingHeaderNewlines" href="#Reader.upcomingHeaderNewlines">func (r *Reader) upcomingHeaderNewlines() (n int)</a>

```
searchKey: textproto.Reader.upcomingHeaderNewlines
tags: [method private]
```

```Go
func (r *Reader) upcomingHeaderNewlines() (n int)
```

upcomingHeaderNewlines returns an approximation of the number of newlines that will be in this header. If it gets confused, it returns 0. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: textproto.Writer
tags: [struct]
```

```Go
type Writer struct {
	W   *bufio.Writer
	dot *dotWriter
}
```

A Writer implements convenience methods for writing requests or responses to a text protocol network connection. 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w *bufio.Writer) *Writer</a>

```
searchKey: textproto.NewWriter
tags: [function]
```

```Go
func NewWriter(w *bufio.Writer) *Writer
```

NewWriter returns a new Writer writing to w. 

#### <a id="Writer.DotWriter" href="#Writer.DotWriter">func (w *Writer) DotWriter() io.WriteCloser</a>

```
searchKey: textproto.Writer.DotWriter
tags: [method]
```

```Go
func (w *Writer) DotWriter() io.WriteCloser
```

DotWriter returns a writer that can be used to write a dot-encoding to w. It takes care of inserting leading dots when necessary, translating line-ending \n into \r\n, and adding the final .\r\n line when the DotWriter is closed. The caller should close the DotWriter before the next call to a method on w. 

See the documentation for Reader's DotReader method for details about dot-encoding. 

#### <a id="Writer.PrintfLine" href="#Writer.PrintfLine">func (w *Writer) PrintfLine(format string, args ...interface{}) error</a>

```
searchKey: textproto.Writer.PrintfLine
tags: [method]
```

```Go
func (w *Writer) PrintfLine(format string, args ...interface{}) error
```

PrintfLine writes the formatted output followed by \r\n. 

#### <a id="Writer.closeDot" href="#Writer.closeDot">func (w *Writer) closeDot()</a>

```
searchKey: textproto.Writer.closeDot
tags: [method private]
```

```Go
func (w *Writer) closeDot()
```

### <a id="canonicalHeaderKeyTest" href="#canonicalHeaderKeyTest">type canonicalHeaderKeyTest struct</a>

```
searchKey: textproto.canonicalHeaderKeyTest
tags: [struct private]
```

```Go
type canonicalHeaderKeyTest struct {
	in, out string
}
```

### <a id="dotReader" href="#dotReader">type dotReader struct</a>

```
searchKey: textproto.dotReader
tags: [struct private]
```

```Go
type dotReader struct {
	r     *Reader
	state int
}
```

#### <a id="dotReader.Read" href="#dotReader.Read">func (d *dotReader) Read(b []byte) (n int, err error)</a>

```
searchKey: textproto.dotReader.Read
tags: [method private]
```

```Go
func (d *dotReader) Read(b []byte) (n int, err error)
```

Read satisfies reads by decoding dot-encoded data read from d.r. 

### <a id="dotWriter" href="#dotWriter">type dotWriter struct</a>

```
searchKey: textproto.dotWriter
tags: [struct private]
```

```Go
type dotWriter struct {
	w     *Writer
	state int
}
```

#### <a id="dotWriter.Close" href="#dotWriter.Close">func (d *dotWriter) Close() error</a>

```
searchKey: textproto.dotWriter.Close
tags: [method private]
```

```Go
func (d *dotWriter) Close() error
```

#### <a id="dotWriter.Write" href="#dotWriter.Write">func (d *dotWriter) Write(b []byte) (n int, err error)</a>

```
searchKey: textproto.dotWriter.Write
tags: [method private]
```

```Go
func (d *dotWriter) Write(b []byte) (n int, err error)
```

### <a id="readResponseTest" href="#readResponseTest">type readResponseTest struct</a>

```
searchKey: textproto.readResponseTest
tags: [struct private]
```

```Go
type readResponseTest struct {
	in       string
	inCode   int
	wantCode int
	wantMsg  string
}
```

### <a id="sequencer" href="#sequencer">type sequencer struct</a>

```
searchKey: textproto.sequencer
tags: [struct private]
```

```Go
type sequencer struct {
	mu   sync.Mutex
	id   uint
	wait map[uint]chan struct{}
}
```

A sequencer schedules a sequence of numbered events that must happen in order, one after the other. The event numbering must start at 0 and increment without skipping. The event number wraps around safely as long as there are not 2^32 simultaneous events pending. 

#### <a id="sequencer.End" href="#sequencer.End">func (s *sequencer) End(id uint)</a>

```
searchKey: textproto.sequencer.End
tags: [method private]
```

```Go
func (s *sequencer) End(id uint)
```

End notifies the sequencer that the event numbered id has completed, allowing it to schedule the event numbered id+1.  It is a run-time error to call End with an id that is not the number of the active event. 

#### <a id="sequencer.Start" href="#sequencer.Start">func (s *sequencer) Start(id uint)</a>

```
searchKey: textproto.sequencer.Start
tags: [method private]
```

```Go
func (s *sequencer) Start(id uint)
```

Start waits until it is time for the event numbered id to begin. That is, except for the first event, it waits until End(id-1) has been called. 

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkReadMIMEHeader" href="#BenchmarkReadMIMEHeader">func BenchmarkReadMIMEHeader(b *testing.B)</a>

```
searchKey: textproto.BenchmarkReadMIMEHeader
tags: [function private benchmark]
```

```Go
func BenchmarkReadMIMEHeader(b *testing.B)
```

### <a id="BenchmarkUncommon" href="#BenchmarkUncommon">func BenchmarkUncommon(b *testing.B)</a>

```
searchKey: textproto.BenchmarkUncommon
tags: [function private benchmark]
```

```Go
func BenchmarkUncommon(b *testing.B)
```

### <a id="CanonicalMIMEHeaderKey" href="#CanonicalMIMEHeaderKey">func CanonicalMIMEHeaderKey(s string) string</a>

```
searchKey: textproto.CanonicalMIMEHeaderKey
tags: [function]
```

```Go
func CanonicalMIMEHeaderKey(s string) string
```

CanonicalMIMEHeaderKey returns the canonical format of the MIME header key s. The canonicalization converts the first letter and any letter following a hyphen to upper case; the rest are converted to lowercase. For example, the canonical key for "accept-encoding" is "Accept-Encoding". MIME header keys are assumed to be ASCII only. If s contains a space or invalid header field bytes, it is returned without modifications. 

### <a id="TestCanonicalMIMEHeaderKey" href="#TestCanonicalMIMEHeaderKey">func TestCanonicalMIMEHeaderKey(t *testing.T)</a>

```
searchKey: textproto.TestCanonicalMIMEHeaderKey
tags: [function private test]
```

```Go
func TestCanonicalMIMEHeaderKey(t *testing.T)
```

### <a id="TestCommonHeaders" href="#TestCommonHeaders">func TestCommonHeaders(t *testing.T)</a>

```
searchKey: textproto.TestCommonHeaders
tags: [function private test]
```

```Go
func TestCommonHeaders(t *testing.T)
```

### <a id="TestDotWriter" href="#TestDotWriter">func TestDotWriter(t *testing.T)</a>

```
searchKey: textproto.TestDotWriter
tags: [function private test]
```

```Go
func TestDotWriter(t *testing.T)
```

### <a id="TestDotWriterCloseEmptyWrite" href="#TestDotWriterCloseEmptyWrite">func TestDotWriterCloseEmptyWrite(t *testing.T)</a>

```
searchKey: textproto.TestDotWriterCloseEmptyWrite
tags: [function private test]
```

```Go
func TestDotWriterCloseEmptyWrite(t *testing.T)
```

### <a id="TestDotWriterCloseNoWrite" href="#TestDotWriterCloseNoWrite">func TestDotWriterCloseNoWrite(t *testing.T)</a>

```
searchKey: textproto.TestDotWriterCloseNoWrite
tags: [function private test]
```

```Go
func TestDotWriterCloseNoWrite(t *testing.T)
```

### <a id="TestLargeReadMIMEHeader" href="#TestLargeReadMIMEHeader">func TestLargeReadMIMEHeader(t *testing.T)</a>

```
searchKey: textproto.TestLargeReadMIMEHeader
tags: [function private test]
```

```Go
func TestLargeReadMIMEHeader(t *testing.T)
```

### <a id="TestMIMEHeaderMultipleValues" href="#TestMIMEHeaderMultipleValues">func TestMIMEHeaderMultipleValues(t *testing.T)</a>

```
searchKey: textproto.TestMIMEHeaderMultipleValues
tags: [function private test]
```

```Go
func TestMIMEHeaderMultipleValues(t *testing.T)
```

Issue #34799 add a Header method to get multiple values []string, with canonicalized key 

### <a id="TestPrintfLine" href="#TestPrintfLine">func TestPrintfLine(t *testing.T)</a>

```
searchKey: textproto.TestPrintfLine
tags: [function private test]
```

```Go
func TestPrintfLine(t *testing.T)
```

### <a id="TestRFC959Lines" href="#TestRFC959Lines">func TestRFC959Lines(t *testing.T)</a>

```
searchKey: textproto.TestRFC959Lines
tags: [function private test]
```

```Go
func TestRFC959Lines(t *testing.T)
```

See [https://www.ietf.org/rfc/rfc959.txt](https://www.ietf.org/rfc/rfc959.txt) page 36. 

### <a id="TestReadCodeLine" href="#TestReadCodeLine">func TestReadCodeLine(t *testing.T)</a>

```
searchKey: textproto.TestReadCodeLine
tags: [function private test]
```

```Go
func TestReadCodeLine(t *testing.T)
```

### <a id="TestReadContinuedLine" href="#TestReadContinuedLine">func TestReadContinuedLine(t *testing.T)</a>

```
searchKey: textproto.TestReadContinuedLine
tags: [function private test]
```

```Go
func TestReadContinuedLine(t *testing.T)
```

### <a id="TestReadDotBytes" href="#TestReadDotBytes">func TestReadDotBytes(t *testing.T)</a>

```
searchKey: textproto.TestReadDotBytes
tags: [function private test]
```

```Go
func TestReadDotBytes(t *testing.T)
```

### <a id="TestReadDotLines" href="#TestReadDotLines">func TestReadDotLines(t *testing.T)</a>

```
searchKey: textproto.TestReadDotLines
tags: [function private test]
```

```Go
func TestReadDotLines(t *testing.T)
```

### <a id="TestReadLine" href="#TestReadLine">func TestReadLine(t *testing.T)</a>

```
searchKey: textproto.TestReadLine
tags: [function private test]
```

```Go
func TestReadLine(t *testing.T)
```

### <a id="TestReadMIMEHeader" href="#TestReadMIMEHeader">func TestReadMIMEHeader(t *testing.T)</a>

```
searchKey: textproto.TestReadMIMEHeader
tags: [function private test]
```

```Go
func TestReadMIMEHeader(t *testing.T)
```

### <a id="TestReadMIMEHeaderMalformed" href="#TestReadMIMEHeaderMalformed">func TestReadMIMEHeaderMalformed(t *testing.T)</a>

```
searchKey: textproto.TestReadMIMEHeaderMalformed
tags: [function private test]
```

```Go
func TestReadMIMEHeaderMalformed(t *testing.T)
```

### <a id="TestReadMIMEHeaderNoKey" href="#TestReadMIMEHeaderNoKey">func TestReadMIMEHeaderNoKey(t *testing.T)</a>

```
searchKey: textproto.TestReadMIMEHeaderNoKey
tags: [function private test]
```

```Go
func TestReadMIMEHeaderNoKey(t *testing.T)
```

### <a id="TestReadMIMEHeaderNonCompliant" href="#TestReadMIMEHeaderNonCompliant">func TestReadMIMEHeaderNonCompliant(t *testing.T)</a>

```
searchKey: textproto.TestReadMIMEHeaderNonCompliant
tags: [function private test]
```

```Go
func TestReadMIMEHeaderNonCompliant(t *testing.T)
```

TestReadMIMEHeaderNonCompliant checks that we don't normalize headers with spaces before colons, and accept spaces in keys. 

### <a id="TestReadMIMEHeaderSingle" href="#TestReadMIMEHeaderSingle">func TestReadMIMEHeaderSingle(t *testing.T)</a>

```
searchKey: textproto.TestReadMIMEHeaderSingle
tags: [function private test]
```

```Go
func TestReadMIMEHeaderSingle(t *testing.T)
```

### <a id="TestReadMIMEHeaderTrimContinued" href="#TestReadMIMEHeaderTrimContinued">func TestReadMIMEHeaderTrimContinued(t *testing.T)</a>

```
searchKey: textproto.TestReadMIMEHeaderTrimContinued
tags: [function private test]
```

```Go
func TestReadMIMEHeaderTrimContinued(t *testing.T)
```

Test that continued lines are properly trimmed. Issue 11204. 

### <a id="TestReadMultiLineError" href="#TestReadMultiLineError">func TestReadMultiLineError(t *testing.T)</a>

```
searchKey: textproto.TestReadMultiLineError
tags: [function private test]
```

```Go
func TestReadMultiLineError(t *testing.T)
```

Test that multi-line errors are appropriately and fully read. Issue 10230. 

### <a id="TrimBytes" href="#TrimBytes">func TrimBytes(b []byte) []byte</a>

```
searchKey: textproto.TrimBytes
tags: [function]
```

```Go
func TrimBytes(b []byte) []byte
```

TrimBytes returns b without leading and trailing ASCII space. 

### <a id="TrimString" href="#TrimString">func TrimString(s string) string</a>

```
searchKey: textproto.TrimString
tags: [function]
```

```Go
func TrimString(s string) string
```

TrimString returns s without leading and trailing ASCII space. 

### <a id="canonicalMIMEHeaderKey" href="#canonicalMIMEHeaderKey">func canonicalMIMEHeaderKey(a []byte) string</a>

```
searchKey: textproto.canonicalMIMEHeaderKey
tags: [function private]
```

```Go
func canonicalMIMEHeaderKey(a []byte) string
```

canonicalMIMEHeaderKey is like CanonicalMIMEHeaderKey but is allowed to mutate the provided byte slice before returning the string. 

For invalid inputs (if a contains spaces or non-token bytes), a is unchanged and a string copy is returned. 

### <a id="initCommonHeader" href="#initCommonHeader">func initCommonHeader()</a>

```
searchKey: textproto.initCommonHeader
tags: [function private]
```

```Go
func initCommonHeader()
```

### <a id="isASCIILetter" href="#isASCIILetter">func isASCIILetter(b byte) bool</a>

```
searchKey: textproto.isASCIILetter
tags: [function private]
```

```Go
func isASCIILetter(b byte) bool
```

### <a id="isASCIISpace" href="#isASCIISpace">func isASCIISpace(b byte) bool</a>

```
searchKey: textproto.isASCIISpace
tags: [function private]
```

```Go
func isASCIISpace(b byte) bool
```

### <a id="mustHaveFieldNameColon" href="#mustHaveFieldNameColon">func mustHaveFieldNameColon(line []byte) error</a>

```
searchKey: textproto.mustHaveFieldNameColon
tags: [function private]
```

```Go
func mustHaveFieldNameColon(line []byte) error
```

mustHaveFieldNameColon ensures that, per RFC 7230, the field-name is on a single line, so the first line must contain a colon. 

### <a id="noValidation" href="#noValidation">func noValidation(_ []byte) error</a>

```
searchKey: textproto.noValidation
tags: [function private]
```

```Go
func noValidation(_ []byte) error
```

noValidation is a no-op validation func for readContinuedLineSlice that permits any lines. 

### <a id="parseCodeLine" href="#parseCodeLine">func parseCodeLine(line string, expectCode int) (code int, continued bool, message string, err error)</a>

```
searchKey: textproto.parseCodeLine
tags: [function private]
```

```Go
func parseCodeLine(line string, expectCode int) (code int, continued bool, message string, err error)
```

### <a id="trim" href="#trim">func trim(s []byte) []byte</a>

```
searchKey: textproto.trim
tags: [function private]
```

```Go
func trim(s []byte) []byte
```

trim returns s with leading and trailing spaces and tabs removed. It does not assume Unicode or UTF-8. 

### <a id="validHeaderFieldByte" href="#validHeaderFieldByte">func validHeaderFieldByte(b byte) bool</a>

```
searchKey: textproto.validHeaderFieldByte
tags: [function private]
```

```Go
func validHeaderFieldByte(b byte) bool
```

validHeaderFieldByte reports whether b is a valid byte in a header field name. RFC 7230 says: 

```
header-field   = field-name ":" OWS field-value OWS
field-name     = token
tchar = "!" / "#" / "$" / "%" / "&" / "'" / "*" / "+" / "-" / "." /
        "^" / "_" / "`" / "|" / "~" / DIGIT / ALPHA
token = 1*tchar

```
