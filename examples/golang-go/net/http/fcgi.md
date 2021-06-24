# Package fcgi

Package fcgi implements the FastCGI protocol. 

See [https://fast-cgi.github.io/](https://fast-cgi.github.io/) for an unofficial mirror of the original documentation. 

Currently only the responder role is supported. 

## Index

* [Constants](#const)
    * [const flagKeepConn](#flagKeepConn)
    * [const maxPad](#maxPad)
    * [const maxWrite](#maxWrite)
    * [const roleAuthorizer](#roleAuthorizer)
    * [const roleFilter](#roleFilter)
    * [const roleResponder](#roleResponder)
    * [const statusCantMultiplex](#statusCantMultiplex)
    * [const statusOverloaded](#statusOverloaded)
    * [const statusRequestComplete](#statusRequestComplete)
    * [const statusUnknownRole](#statusUnknownRole)
    * [const typeAbortRequest](#typeAbortRequest)
    * [const typeBeginRequest](#typeBeginRequest)
    * [const typeData](#typeData)
    * [const typeEndRequest](#typeEndRequest)
    * [const typeGetValues](#typeGetValues)
    * [const typeGetValuesResult](#typeGetValuesResult)
    * [const typeParams](#typeParams)
    * [const typeStderr](#typeStderr)
    * [const typeStdin](#typeStdin)
    * [const typeStdout](#typeStdout)
    * [const typeUnknownType](#typeUnknownType)
* [Variables](#var)
    * [var ErrConnClosed](#ErrConnClosed)
    * [var ErrRequestAborted](#ErrRequestAborted)
    * [var cleanUpTests](#cleanUpTests)
    * [var emptyBody](#emptyBody)
    * [var envVarTests](#envVarTests)
    * [var errCloseConn](#errCloseConn)
    * [var pad](#pad)
    * [var sizeTests](#sizeTests)
    * [var streamBeginTypeStdin](#streamBeginTypeStdin)
    * [var streamFullRequestStdin](#streamFullRequestStdin)
    * [var streamTests](#streamTests)
* [Types](#type)
    * [type beginRequest struct](#beginRequest)
        * [func (br *beginRequest) read(content []byte) error](#beginRequest.read)
    * [type bufWriter struct](#bufWriter)
        * [func newWriter(c *conn, recType recType, reqId uint16) *bufWriter](#newWriter)
        * [func (w *bufWriter) Close() error](#bufWriter.Close)
    * [type child struct](#child)
        * [func newChild(rwc io.ReadWriteCloser, handler http.Handler) *child](#newChild)
        * [func (c *child) cleanUp()](#child.cleanUp)
        * [func (c *child) handleRecord(rec *record) error](#child.handleRecord)
        * [func (c *child) serve()](#child.serve)
        * [func (c *child) serveRequest(req *request, body io.ReadCloser)](#child.serveRequest)
    * [type conn struct](#conn)
        * [func newConn(rwc io.ReadWriteCloser) *conn](#newConn)
        * [func (c *conn) Close() error](#conn.Close)
        * [func (c *conn) writeEndRequest(reqId uint16, appStatus int, protocolStatus uint8) error](#conn.writeEndRequest)
        * [func (c *conn) writePairs(recType recType, reqId uint16, pairs map[string]string) error](#conn.writePairs)
        * [func (c *conn) writeRecord(recType recType, reqId uint16, b []byte) error](#conn.writeRecord)
    * [type envVarsContextKey struct{}](#envVarsContextKey)
    * [type header struct](#header)
        * [func (h *header) init(recType recType, reqId uint16, contentLength int)](#header.init.fcgi.go)
    * [type nilCloser struct](#nilCloser)
        * [func (c *nilCloser) Close() error](#nilCloser.Close)
    * [type nopWriteCloser struct](#nopWriteCloser)
        * [func (nopWriteCloser) Close() error](#nopWriteCloser.Close)
        * [func (nopWriteCloser) Write(buf []byte) (int, error)](#nopWriteCloser.Write)
    * [type recType uint8](#recType)
    * [type record struct](#record)
        * [func (r *record) content() []byte](#record.content)
        * [func (rec *record) read(r io.Reader) (err error)](#record.read)
    * [type request struct](#request)
        * [func newRequest(reqId uint16, flags uint8) *request](#newRequest)
        * [func (r *request) parseParams()](#request.parseParams)
    * [type response struct](#response)
        * [func newResponse(c *child, req *request) *response](#newResponse)
        * [func (r *response) Close() error](#response.Close)
        * [func (r *response) Flush()](#response.Flush)
        * [func (r *response) Header() http.Header](#response.Header)
        * [func (r *response) Write(p []byte) (n int, err error)](#response.Write)
        * [func (r *response) WriteHeader(code int)](#response.WriteHeader)
        * [func (r *response) writeCGIHeader(p []byte)](#response.writeCGIHeader)
    * [type rwNopCloser struct](#rwNopCloser)
        * [func (rwNopCloser) Close() error](#rwNopCloser.Close)
    * [type signallingNopCloser struct](#signallingNopCloser)
        * [func (rc *signallingNopCloser) Close() error](#signallingNopCloser.Close)
        * [func (*signallingNopCloser) Write(buf []byte) (int, error)](#signallingNopCloser.Write)
    * [type streamWriter struct](#streamWriter)
        * [func (w *streamWriter) Close() error](#streamWriter.Close)
        * [func (w *streamWriter) Write(p []byte) (int, error)](#streamWriter.Write)
    * [type writeOnlyConn struct](#writeOnlyConn)
        * [func (c *writeOnlyConn) Close() error](#writeOnlyConn.Close)
        * [func (c *writeOnlyConn) Read(p []byte) (int, error)](#writeOnlyConn.Read)
        * [func (c *writeOnlyConn) Write(p []byte) (int, error)](#writeOnlyConn.Write)
* [Functions](#func)
    * [func ProcessEnv(r *http.Request) map[string]string](#ProcessEnv)
    * [func Serve(l net.Listener, handler http.Handler) error](#Serve)
    * [func TestChildServeCleansUp(t *testing.T)](#TestChildServeCleansUp)
    * [func TestChildServeReadsEnvVars(t *testing.T)](#TestChildServeReadsEnvVars)
    * [func TestGetValues(t *testing.T)](#TestGetValues)
    * [func TestMalformedParams(t *testing.T)](#TestMalformedParams)
    * [func TestResponseWriterSniffsContentType(t *testing.T)](#TestResponseWriterSniffsContentType)
    * [func TestSize(t *testing.T)](#TestSize)
    * [func TestSlowRequest(t *testing.T)](#TestSlowRequest)
    * [func TestStreams(t *testing.T)](#TestStreams)
    * [func addFastCGIEnvToContext(s string) bool](#addFastCGIEnvToContext)
    * [func encodeSize(b []byte, size uint32) int](#encodeSize)
    * [func filterOutUsedEnvVars(envVars map[string]string) map[string]string](#filterOutUsedEnvVars)
    * [func makeRecord(recordType recType,...](#makeRecord)
    * [func nameValuePair11(nameData, valueData string) []byte](#nameValuePair11)
    * [func readSize(s []byte) (uint32, int)](#readSize)
    * [func readString(s []byte, size uint32) string](#readString)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="flagKeepConn" href="#flagKeepConn">const flagKeepConn</a>

```
searchKey: fcgi.flagKeepConn
tags: [constant number private]
```

```Go
const flagKeepConn = 1
```

keep the connection between web-server and responder open after request 

### <a id="maxPad" href="#maxPad">const maxPad</a>

```
searchKey: fcgi.maxPad
tags: [constant number private]
```

```Go
const maxPad = 255
```

### <a id="maxWrite" href="#maxWrite">const maxWrite</a>

```
searchKey: fcgi.maxWrite
tags: [constant number private]
```

```Go
const maxWrite = 65535 // maximum record body

```

### <a id="roleAuthorizer" href="#roleAuthorizer">const roleAuthorizer</a>

```
searchKey: fcgi.roleAuthorizer
tags: [constant number private]
```

```Go
const roleAuthorizer
```

### <a id="roleFilter" href="#roleFilter">const roleFilter</a>

```
searchKey: fcgi.roleFilter
tags: [constant number private]
```

```Go
const roleFilter
```

### <a id="roleResponder" href="#roleResponder">const roleResponder</a>

```
searchKey: fcgi.roleResponder
tags: [constant number private]
```

```Go
const roleResponder = iota + 1 // only Responders are implemented.

```

### <a id="statusCantMultiplex" href="#statusCantMultiplex">const statusCantMultiplex</a>

```
searchKey: fcgi.statusCantMultiplex
tags: [constant number private]
```

```Go
const statusCantMultiplex
```

### <a id="statusOverloaded" href="#statusOverloaded">const statusOverloaded</a>

```
searchKey: fcgi.statusOverloaded
tags: [constant number private]
```

```Go
const statusOverloaded
```

### <a id="statusRequestComplete" href="#statusRequestComplete">const statusRequestComplete</a>

```
searchKey: fcgi.statusRequestComplete
tags: [constant number private]
```

```Go
const statusRequestComplete = iota
```

### <a id="statusUnknownRole" href="#statusUnknownRole">const statusUnknownRole</a>

```
searchKey: fcgi.statusUnknownRole
tags: [constant number private]
```

```Go
const statusUnknownRole
```

### <a id="typeAbortRequest" href="#typeAbortRequest">const typeAbortRequest</a>

```
searchKey: fcgi.typeAbortRequest
tags: [constant number private]
```

```Go
const typeAbortRequest recType = 2
```

### <a id="typeBeginRequest" href="#typeBeginRequest">const typeBeginRequest</a>

```
searchKey: fcgi.typeBeginRequest
tags: [constant number private]
```

```Go
const typeBeginRequest recType = 1
```

### <a id="typeData" href="#typeData">const typeData</a>

```
searchKey: fcgi.typeData
tags: [constant number private]
```

```Go
const typeData recType = 8
```

### <a id="typeEndRequest" href="#typeEndRequest">const typeEndRequest</a>

```
searchKey: fcgi.typeEndRequest
tags: [constant number private]
```

```Go
const typeEndRequest recType = 3
```

### <a id="typeGetValues" href="#typeGetValues">const typeGetValues</a>

```
searchKey: fcgi.typeGetValues
tags: [constant number private]
```

```Go
const typeGetValues recType = 9
```

### <a id="typeGetValuesResult" href="#typeGetValuesResult">const typeGetValuesResult</a>

```
searchKey: fcgi.typeGetValuesResult
tags: [constant number private]
```

```Go
const typeGetValuesResult recType = 10
```

### <a id="typeParams" href="#typeParams">const typeParams</a>

```
searchKey: fcgi.typeParams
tags: [constant number private]
```

```Go
const typeParams recType = 4
```

### <a id="typeStderr" href="#typeStderr">const typeStderr</a>

```
searchKey: fcgi.typeStderr
tags: [constant number private]
```

```Go
const typeStderr recType = 7
```

### <a id="typeStdin" href="#typeStdin">const typeStdin</a>

```
searchKey: fcgi.typeStdin
tags: [constant number private]
```

```Go
const typeStdin recType = 5
```

### <a id="typeStdout" href="#typeStdout">const typeStdout</a>

```
searchKey: fcgi.typeStdout
tags: [constant number private]
```

```Go
const typeStdout recType = 6
```

### <a id="typeUnknownType" href="#typeUnknownType">const typeUnknownType</a>

```
searchKey: fcgi.typeUnknownType
tags: [constant number private]
```

```Go
const typeUnknownType recType = 11
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="ErrConnClosed" href="#ErrConnClosed">var ErrConnClosed</a>

```
searchKey: fcgi.ErrConnClosed
tags: [variable interface]
```

```Go
var ErrConnClosed = errors.New("fcgi: connection to web server closed")
```

ErrConnClosed is returned by Read when a handler attempts to read the body of a request after the connection to the web server has been closed. 

### <a id="ErrRequestAborted" href="#ErrRequestAborted">var ErrRequestAborted</a>

```
searchKey: fcgi.ErrRequestAborted
tags: [variable interface]
```

```Go
var ErrRequestAborted = errors.New("fcgi: request aborted by web server")
```

ErrRequestAborted is returned by Read when a handler attempts to read the body of a request that has been aborted by the web server. 

### <a id="cleanUpTests" href="#cleanUpTests">var cleanUpTests</a>

```
searchKey: fcgi.cleanUpTests
tags: [variable array struct private]
```

```Go
var cleanUpTests = ...
```

### <a id="emptyBody" href="#emptyBody">var emptyBody</a>

```
searchKey: fcgi.emptyBody
tags: [variable interface private]
```

```Go
var emptyBody = io.NopCloser(strings.NewReader(""))
```

### <a id="envVarTests" href="#envVarTests">var envVarTests</a>

```
searchKey: fcgi.envVarTests
tags: [variable array struct private]
```

```Go
var envVarTests = ...
```

### <a id="errCloseConn" href="#errCloseConn">var errCloseConn</a>

```
searchKey: fcgi.errCloseConn
tags: [variable interface private]
```

```Go
var errCloseConn = errors.New("fcgi: connection should be closed")
```

### <a id="pad" href="#pad">var pad</a>

```
searchKey: fcgi.pad
tags: [variable array number private]
```

```Go
var pad [maxPad]byte
```

for padding so we don't have to allocate all the time not synchronized because we don't care what the contents are 

### <a id="sizeTests" href="#sizeTests">var sizeTests</a>

```
searchKey: fcgi.sizeTests
tags: [variable array struct private]
```

```Go
var sizeTests = ...
```

### <a id="streamBeginTypeStdin" href="#streamBeginTypeStdin">var streamBeginTypeStdin</a>

```
searchKey: fcgi.streamBeginTypeStdin
tags: [variable array number private]
```

```Go
var streamBeginTypeStdin = ...
```

a series of FastCGI records that start a request and begin sending the request body 

### <a id="streamFullRequestStdin" href="#streamFullRequestStdin">var streamFullRequestStdin</a>

```
searchKey: fcgi.streamFullRequestStdin
tags: [variable array number private]
```

```Go
var streamFullRequestStdin = ...
```

a series of FastCGI records that start and end a request 

### <a id="streamTests" href="#streamTests">var streamTests</a>

```
searchKey: fcgi.streamTests
tags: [variable array struct private]
```

```Go
var streamTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="beginRequest" href="#beginRequest">type beginRequest struct</a>

```
searchKey: fcgi.beginRequest
tags: [struct private]
```

```Go
type beginRequest struct {
	role     uint16
	flags    uint8
	reserved [5]uint8
}
```

#### <a id="beginRequest.read" href="#beginRequest.read">func (br *beginRequest) read(content []byte) error</a>

```
searchKey: fcgi.beginRequest.read
tags: [method private]
```

```Go
func (br *beginRequest) read(content []byte) error
```

### <a id="bufWriter" href="#bufWriter">type bufWriter struct</a>

```
searchKey: fcgi.bufWriter
tags: [struct private]
```

```Go
type bufWriter struct {
	closer io.Closer
	*bufio.Writer
}
```

bufWriter encapsulates bufio.Writer but also closes the underlying stream when Closed. 

#### <a id="newWriter" href="#newWriter">func newWriter(c *conn, recType recType, reqId uint16) *bufWriter</a>

```
searchKey: fcgi.newWriter
tags: [method private]
```

```Go
func newWriter(c *conn, recType recType, reqId uint16) *bufWriter
```

#### <a id="bufWriter.Close" href="#bufWriter.Close">func (w *bufWriter) Close() error</a>

```
searchKey: fcgi.bufWriter.Close
tags: [function private]
```

```Go
func (w *bufWriter) Close() error
```

### <a id="child" href="#child">type child struct</a>

```
searchKey: fcgi.child
tags: [struct private]
```

```Go
type child struct {
	conn    *conn
	handler http.Handler

	requests map[uint16]*request // keyed by request ID
}
```

#### <a id="newChild" href="#newChild">func newChild(rwc io.ReadWriteCloser, handler http.Handler) *child</a>

```
searchKey: fcgi.newChild
tags: [method private]
```

```Go
func newChild(rwc io.ReadWriteCloser, handler http.Handler) *child
```

#### <a id="child.cleanUp" href="#child.cleanUp">func (c *child) cleanUp()</a>

```
searchKey: fcgi.child.cleanUp
tags: [function private]
```

```Go
func (c *child) cleanUp()
```

#### <a id="child.handleRecord" href="#child.handleRecord">func (c *child) handleRecord(rec *record) error</a>

```
searchKey: fcgi.child.handleRecord
tags: [method private]
```

```Go
func (c *child) handleRecord(rec *record) error
```

#### <a id="child.serve" href="#child.serve">func (c *child) serve()</a>

```
searchKey: fcgi.child.serve
tags: [function private]
```

```Go
func (c *child) serve()
```

#### <a id="child.serveRequest" href="#child.serveRequest">func (c *child) serveRequest(req *request, body io.ReadCloser)</a>

```
searchKey: fcgi.child.serveRequest
tags: [method private]
```

```Go
func (c *child) serveRequest(req *request, body io.ReadCloser)
```

### <a id="conn" href="#conn">type conn struct</a>

```
searchKey: fcgi.conn
tags: [struct private]
```

```Go
type conn struct {
	mutex sync.Mutex
	rwc   io.ReadWriteCloser

	// to avoid allocations
	buf bytes.Buffer
	h   header
}
```

conn sends records over rwc 

#### <a id="newConn" href="#newConn">func newConn(rwc io.ReadWriteCloser) *conn</a>

```
searchKey: fcgi.newConn
tags: [method private]
```

```Go
func newConn(rwc io.ReadWriteCloser) *conn
```

#### <a id="conn.Close" href="#conn.Close">func (c *conn) Close() error</a>

```
searchKey: fcgi.conn.Close
tags: [function private]
```

```Go
func (c *conn) Close() error
```

#### <a id="conn.writeEndRequest" href="#conn.writeEndRequest">func (c *conn) writeEndRequest(reqId uint16, appStatus int, protocolStatus uint8) error</a>

```
searchKey: fcgi.conn.writeEndRequest
tags: [method private]
```

```Go
func (c *conn) writeEndRequest(reqId uint16, appStatus int, protocolStatus uint8) error
```

#### <a id="conn.writePairs" href="#conn.writePairs">func (c *conn) writePairs(recType recType, reqId uint16, pairs map[string]string) error</a>

```
searchKey: fcgi.conn.writePairs
tags: [method private]
```

```Go
func (c *conn) writePairs(recType recType, reqId uint16, pairs map[string]string) error
```

#### <a id="conn.writeRecord" href="#conn.writeRecord">func (c *conn) writeRecord(recType recType, reqId uint16, b []byte) error</a>

```
searchKey: fcgi.conn.writeRecord
tags: [method private]
```

```Go
func (c *conn) writeRecord(recType recType, reqId uint16, b []byte) error
```

writeRecord writes and sends a single record. 

### <a id="envVarsContextKey" href="#envVarsContextKey">type envVarsContextKey struct{}</a>

```
searchKey: fcgi.envVarsContextKey
tags: [struct private]
```

```Go
type envVarsContextKey struct{}
```

envVarsContextKey uniquely identifies a mapping of CGI environment variables to their values in a request context 

### <a id="header" href="#header">type header struct</a>

```
searchKey: fcgi.header
tags: [struct private]
```

```Go
type header struct {
	Version       uint8
	Type          recType
	Id            uint16
	ContentLength uint16
	PaddingLength uint8
	Reserved      uint8
}
```

#### <a id="header.init.fcgi.go" href="#header.init.fcgi.go">func (h *header) init(recType recType, reqId uint16, contentLength int)</a>

```
searchKey: fcgi.header.init
tags: [method private]
```

```Go
func (h *header) init(recType recType, reqId uint16, contentLength int)
```

### <a id="nilCloser" href="#nilCloser">type nilCloser struct</a>

```
searchKey: fcgi.nilCloser
tags: [struct private]
```

```Go
type nilCloser struct {
	io.ReadWriter
}
```

#### <a id="nilCloser.Close" href="#nilCloser.Close">func (c *nilCloser) Close() error</a>

```
searchKey: fcgi.nilCloser.Close
tags: [function private]
```

```Go
func (c *nilCloser) Close() error
```

### <a id="nopWriteCloser" href="#nopWriteCloser">type nopWriteCloser struct</a>

```
searchKey: fcgi.nopWriteCloser
tags: [struct private]
```

```Go
type nopWriteCloser struct {
	io.Reader
}
```

#### <a id="nopWriteCloser.Close" href="#nopWriteCloser.Close">func (nopWriteCloser) Close() error</a>

```
searchKey: fcgi.nopWriteCloser.Close
tags: [function private]
```

```Go
func (nopWriteCloser) Close() error
```

#### <a id="nopWriteCloser.Write" href="#nopWriteCloser.Write">func (nopWriteCloser) Write(buf []byte) (int, error)</a>

```
searchKey: fcgi.nopWriteCloser.Write
tags: [method private]
```

```Go
func (nopWriteCloser) Write(buf []byte) (int, error)
```

### <a id="recType" href="#recType">type recType uint8</a>

```
searchKey: fcgi.recType
tags: [number private]
```

```Go
type recType uint8
```

recType is a record type, as defined by [https://web.archive.org/web/20150420080736/http://www.fastcgi.com/drupal/node/6?q=node/22#S8](https://web.archive.org/web/20150420080736/http://www.fastcgi.com/drupal/node/6?q=node/22#S8) 

### <a id="record" href="#record">type record struct</a>

```
searchKey: fcgi.record
tags: [struct private]
```

```Go
type record struct {
	h   header
	buf [maxWrite + maxPad]byte
}
```

#### <a id="record.content" href="#record.content">func (r *record) content() []byte</a>

```
searchKey: fcgi.record.content
tags: [function private]
```

```Go
func (r *record) content() []byte
```

#### <a id="record.read" href="#record.read">func (rec *record) read(r io.Reader) (err error)</a>

```
searchKey: fcgi.record.read
tags: [method private]
```

```Go
func (rec *record) read(r io.Reader) (err error)
```

### <a id="request" href="#request">type request struct</a>

```
searchKey: fcgi.request
tags: [struct private]
```

```Go
type request struct {
	pw        *io.PipeWriter
	reqId     uint16
	params    map[string]string
	buf       [1024]byte
	rawParams []byte
	keepConn  bool
}
```

request holds the state for an in-progress request. As soon as it's complete, it's converted to an http.Request. 

#### <a id="newRequest" href="#newRequest">func newRequest(reqId uint16, flags uint8) *request</a>

```
searchKey: fcgi.newRequest
tags: [method private]
```

```Go
func newRequest(reqId uint16, flags uint8) *request
```

#### <a id="request.parseParams" href="#request.parseParams">func (r *request) parseParams()</a>

```
searchKey: fcgi.request.parseParams
tags: [function private]
```

```Go
func (r *request) parseParams()
```

parseParams reads an encoded []byte into Params. 

### <a id="response" href="#response">type response struct</a>

```
searchKey: fcgi.response
tags: [struct private]
```

```Go
type response struct {
	req            *request
	header         http.Header
	code           int
	wroteHeader    bool
	wroteCGIHeader bool
	w              *bufWriter
}
```

response implements http.ResponseWriter. 

#### <a id="newResponse" href="#newResponse">func newResponse(c *child, req *request) *response</a>

```
searchKey: fcgi.newResponse
tags: [method private]
```

```Go
func newResponse(c *child, req *request) *response
```

#### <a id="response.Close" href="#response.Close">func (r *response) Close() error</a>

```
searchKey: fcgi.response.Close
tags: [function private]
```

```Go
func (r *response) Close() error
```

#### <a id="response.Flush" href="#response.Flush">func (r *response) Flush()</a>

```
searchKey: fcgi.response.Flush
tags: [function private]
```

```Go
func (r *response) Flush()
```

#### <a id="response.Header" href="#response.Header">func (r *response) Header() http.Header</a>

```
searchKey: fcgi.response.Header
tags: [function private]
```

```Go
func (r *response) Header() http.Header
```

#### <a id="response.Write" href="#response.Write">func (r *response) Write(p []byte) (n int, err error)</a>

```
searchKey: fcgi.response.Write
tags: [method private]
```

```Go
func (r *response) Write(p []byte) (n int, err error)
```

#### <a id="response.WriteHeader" href="#response.WriteHeader">func (r *response) WriteHeader(code int)</a>

```
searchKey: fcgi.response.WriteHeader
tags: [method private]
```

```Go
func (r *response) WriteHeader(code int)
```

#### <a id="response.writeCGIHeader" href="#response.writeCGIHeader">func (r *response) writeCGIHeader(p []byte)</a>

```
searchKey: fcgi.response.writeCGIHeader
tags: [method private]
```

```Go
func (r *response) writeCGIHeader(p []byte)
```

writeCGIHeader finalizes the header sent to the client and writes it to the output. p is not written by writeHeader, but is the first chunk of the body that will be written. It is sniffed for a Content-Type if none is set explicitly. 

### <a id="rwNopCloser" href="#rwNopCloser">type rwNopCloser struct</a>

```
searchKey: fcgi.rwNopCloser
tags: [struct private]
```

```Go
type rwNopCloser struct {
	io.Reader
	io.Writer
}
```

#### <a id="rwNopCloser.Close" href="#rwNopCloser.Close">func (rwNopCloser) Close() error</a>

```
searchKey: fcgi.rwNopCloser.Close
tags: [function private]
```

```Go
func (rwNopCloser) Close() error
```

### <a id="signallingNopCloser" href="#signallingNopCloser">type signallingNopCloser struct</a>

```
searchKey: fcgi.signallingNopCloser
tags: [struct private]
```

```Go
type signallingNopCloser struct {
	io.Reader
	closed chan bool
}
```

#### <a id="signallingNopCloser.Close" href="#signallingNopCloser.Close">func (rc *signallingNopCloser) Close() error</a>

```
searchKey: fcgi.signallingNopCloser.Close
tags: [function private]
```

```Go
func (rc *signallingNopCloser) Close() error
```

#### <a id="signallingNopCloser.Write" href="#signallingNopCloser.Write">func (*signallingNopCloser) Write(buf []byte) (int, error)</a>

```
searchKey: fcgi.signallingNopCloser.Write
tags: [method private]
```

```Go
func (*signallingNopCloser) Write(buf []byte) (int, error)
```

### <a id="streamWriter" href="#streamWriter">type streamWriter struct</a>

```
searchKey: fcgi.streamWriter
tags: [struct private]
```

```Go
type streamWriter struct {
	c       *conn
	recType recType
	reqId   uint16
}
```

streamWriter abstracts out the separation of a stream into discrete records. It only writes maxWrite bytes at a time. 

#### <a id="streamWriter.Close" href="#streamWriter.Close">func (w *streamWriter) Close() error</a>

```
searchKey: fcgi.streamWriter.Close
tags: [function private]
```

```Go
func (w *streamWriter) Close() error
```

#### <a id="streamWriter.Write" href="#streamWriter.Write">func (w *streamWriter) Write(p []byte) (int, error)</a>

```
searchKey: fcgi.streamWriter.Write
tags: [method private]
```

```Go
func (w *streamWriter) Write(p []byte) (int, error)
```

### <a id="writeOnlyConn" href="#writeOnlyConn">type writeOnlyConn struct</a>

```
searchKey: fcgi.writeOnlyConn
tags: [struct private]
```

```Go
type writeOnlyConn struct {
	buf []byte
}
```

#### <a id="writeOnlyConn.Close" href="#writeOnlyConn.Close">func (c *writeOnlyConn) Close() error</a>

```
searchKey: fcgi.writeOnlyConn.Close
tags: [function private]
```

```Go
func (c *writeOnlyConn) Close() error
```

#### <a id="writeOnlyConn.Read" href="#writeOnlyConn.Read">func (c *writeOnlyConn) Read(p []byte) (int, error)</a>

```
searchKey: fcgi.writeOnlyConn.Read
tags: [method private]
```

```Go
func (c *writeOnlyConn) Read(p []byte) (int, error)
```

#### <a id="writeOnlyConn.Write" href="#writeOnlyConn.Write">func (c *writeOnlyConn) Write(p []byte) (int, error)</a>

```
searchKey: fcgi.writeOnlyConn.Write
tags: [method private]
```

```Go
func (c *writeOnlyConn) Write(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="ProcessEnv" href="#ProcessEnv">func ProcessEnv(r *http.Request) map[string]string</a>

```
searchKey: fcgi.ProcessEnv
tags: [method]
```

```Go
func ProcessEnv(r *http.Request) map[string]string
```

ProcessEnv returns FastCGI environment variables associated with the request r for which no effort was made to be included in the request itself - the data is hidden in the request's context. As an example, if REMOTE_USER is set for a request, it will not be found anywhere in r, but it will be included in ProcessEnv's response (via r's context). 

### <a id="Serve" href="#Serve">func Serve(l net.Listener, handler http.Handler) error</a>

```
searchKey: fcgi.Serve
tags: [method]
```

```Go
func Serve(l net.Listener, handler http.Handler) error
```

Serve accepts incoming FastCGI connections on the listener l, creating a new goroutine for each. The goroutine reads requests and then calls handler to reply to them. If l is nil, Serve accepts connections from os.Stdin. If handler is nil, http.DefaultServeMux is used. 

### <a id="TestChildServeCleansUp" href="#TestChildServeCleansUp">func TestChildServeCleansUp(t *testing.T)</a>

```
searchKey: fcgi.TestChildServeCleansUp
tags: [method private test]
```

```Go
func TestChildServeCleansUp(t *testing.T)
```

Test that child.serve closes the bodies of aborted requests and closes the bodies of all requests before returning. Causes deadlock if either condition isn't met. See issue 6934. 

### <a id="TestChildServeReadsEnvVars" href="#TestChildServeReadsEnvVars">func TestChildServeReadsEnvVars(t *testing.T)</a>

```
searchKey: fcgi.TestChildServeReadsEnvVars
tags: [method private test]
```

```Go
func TestChildServeReadsEnvVars(t *testing.T)
```

Test that environment variables set for a request can be read by a handler. Ensures that variables not set will not be exposed to a handler. 

### <a id="TestGetValues" href="#TestGetValues">func TestGetValues(t *testing.T)</a>

```
searchKey: fcgi.TestGetValues
tags: [method private test]
```

```Go
func TestGetValues(t *testing.T)
```

### <a id="TestMalformedParams" href="#TestMalformedParams">func TestMalformedParams(t *testing.T)</a>

```
searchKey: fcgi.TestMalformedParams
tags: [method private test]
```

```Go
func TestMalformedParams(t *testing.T)
```

Verifies it doesn't crash. 	Issue 11824. 

### <a id="TestResponseWriterSniffsContentType" href="#TestResponseWriterSniffsContentType">func TestResponseWriterSniffsContentType(t *testing.T)</a>

```
searchKey: fcgi.TestResponseWriterSniffsContentType
tags: [method private test]
```

```Go
func TestResponseWriterSniffsContentType(t *testing.T)
```

### <a id="TestSize" href="#TestSize">func TestSize(t *testing.T)</a>

```
searchKey: fcgi.TestSize
tags: [method private test]
```

```Go
func TestSize(t *testing.T)
```

### <a id="TestSlowRequest" href="#TestSlowRequest">func TestSlowRequest(t *testing.T)</a>

```
searchKey: fcgi.TestSlowRequest
tags: [method private test]
```

```Go
func TestSlowRequest(t *testing.T)
```

Test whether server properly closes connection when processing slow requests 

### <a id="TestStreams" href="#TestStreams">func TestStreams(t *testing.T)</a>

```
searchKey: fcgi.TestStreams
tags: [method private test]
```

```Go
func TestStreams(t *testing.T)
```

### <a id="addFastCGIEnvToContext" href="#addFastCGIEnvToContext">func addFastCGIEnvToContext(s string) bool</a>

```
searchKey: fcgi.addFastCGIEnvToContext
tags: [method private]
```

```Go
func addFastCGIEnvToContext(s string) bool
```

addFastCGIEnvToContext reports whether to include the FastCGI environment variable s in the http.Request.Context, accessible via ProcessEnv. 

### <a id="encodeSize" href="#encodeSize">func encodeSize(b []byte, size uint32) int</a>

```
searchKey: fcgi.encodeSize
tags: [method private]
```

```Go
func encodeSize(b []byte, size uint32) int
```

### <a id="filterOutUsedEnvVars" href="#filterOutUsedEnvVars">func filterOutUsedEnvVars(envVars map[string]string) map[string]string</a>

```
searchKey: fcgi.filterOutUsedEnvVars
tags: [method private]
```

```Go
func filterOutUsedEnvVars(envVars map[string]string) map[string]string
```

filterOutUsedEnvVars returns a new map of env vars without the variables in the given envVars map that are read for creating each http.Request 

### <a id="makeRecord" href="#makeRecord">func makeRecord(recordType recType,...</a>

```
searchKey: fcgi.makeRecord
tags: [method private]
```

```Go
func makeRecord(
	recordType recType,
	requestId uint16,
	contentData []byte,
) []byte
```

### <a id="nameValuePair11" href="#nameValuePair11">func nameValuePair11(nameData, valueData string) []byte</a>

```
searchKey: fcgi.nameValuePair11
tags: [method private]
```

```Go
func nameValuePair11(nameData, valueData string) []byte
```

### <a id="readSize" href="#readSize">func readSize(s []byte) (uint32, int)</a>

```
searchKey: fcgi.readSize
tags: [method private]
```

```Go
func readSize(s []byte) (uint32, int)
```

### <a id="readString" href="#readString">func readString(s []byte, size uint32) string</a>

```
searchKey: fcgi.readString
tags: [method private]
```

```Go
func readString(s []byte, size uint32) string
```

