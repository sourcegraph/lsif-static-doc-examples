# Package fcgi

Package fcgi implements the FastCGI protocol. 

See [https://fast-cgi.github.io/](https://fast-cgi.github.io/) for an unofficial mirror of the original documentation. 

Currently only the responder role is supported. 

## Index

* [Constants](#const)
    * [const typeBeginRequest](#typeBeginRequest)
    * [const typeAbortRequest](#typeAbortRequest)
    * [const typeEndRequest](#typeEndRequest)
    * [const typeParams](#typeParams)
    * [const typeStdin](#typeStdin)
    * [const typeStdout](#typeStdout)
    * [const typeStderr](#typeStderr)
    * [const typeData](#typeData)
    * [const typeGetValues](#typeGetValues)
    * [const typeGetValuesResult](#typeGetValuesResult)
    * [const typeUnknownType](#typeUnknownType)
    * [const flagKeepConn](#flagKeepConn)
    * [const maxWrite](#maxWrite)
    * [const maxPad](#maxPad)
    * [const roleResponder](#roleResponder)
    * [const roleAuthorizer](#roleAuthorizer)
    * [const roleFilter](#roleFilter)
    * [const statusRequestComplete](#statusRequestComplete)
    * [const statusCantMultiplex](#statusCantMultiplex)
    * [const statusOverloaded](#statusOverloaded)
    * [const statusUnknownRole](#statusUnknownRole)
* [Variables](#var)
    * [var errCloseConn](#errCloseConn)
    * [var emptyBody](#emptyBody)
    * [var ErrRequestAborted](#ErrRequestAborted)
    * [var ErrConnClosed](#ErrConnClosed)
    * [var pad](#pad)
    * [var sizeTests](#sizeTests)
    * [var streamTests](#streamTests)
    * [var streamBeginTypeStdin](#streamBeginTypeStdin)
    * [var cleanUpTests](#cleanUpTests)
    * [var streamFullRequestStdin](#streamFullRequestStdin)
    * [var envVarTests](#envVarTests)
* [Types](#type)
    * [type request struct](#request)
        * [func newRequest(reqId uint16, flags uint8) *request](#newRequest)
        * [func (r *request) parseParams()](#request.parseParams)
    * [type envVarsContextKey struct{}](#envVarsContextKey)
    * [type response struct](#response)
        * [func newResponse(c *child, req *request) *response](#newResponse)
        * [func (r *response) Header() http.Header](#response.Header)
        * [func (r *response) Write(p []byte) (n int, err error)](#response.Write)
        * [func (r *response) WriteHeader(code int)](#response.WriteHeader)
        * [func (r *response) writeCGIHeader(p []byte)](#response.writeCGIHeader)
        * [func (r *response) Flush()](#response.Flush)
        * [func (r *response) Close() error](#response.Close)
    * [type child struct](#child)
        * [func newChild(rwc io.ReadWriteCloser, handler http.Handler) *child](#newChild)
        * [func (c *child) serve()](#child.serve)
        * [func (c *child) handleRecord(rec *record) error](#child.handleRecord)
        * [func (c *child) serveRequest(req *request, body io.ReadCloser)](#child.serveRequest)
        * [func (c *child) cleanUp()](#child.cleanUp)
    * [type recType uint8](#recType)
    * [type header struct](#header)
        * [func (h *header) init(recType recType, reqId uint16, contentLength int)](#header.init.fcgi.go)
    * [type beginRequest struct](#beginRequest)
        * [func (br *beginRequest) read(content []byte) error](#beginRequest.read)
    * [type conn struct](#conn)
        * [func newConn(rwc io.ReadWriteCloser) *conn](#newConn)
        * [func (c *conn) Close() error](#conn.Close)
        * [func (c *conn) writeRecord(recType recType, reqId uint16, b []byte) error](#conn.writeRecord)
        * [func (c *conn) writeEndRequest(reqId uint16, appStatus int, protocolStatus uint8) error](#conn.writeEndRequest)
        * [func (c *conn) writePairs(recType recType, reqId uint16, pairs map[string]string) error](#conn.writePairs)
    * [type record struct](#record)
        * [func (rec *record) read(r io.Reader) (err error)](#record.read)
        * [func (r *record) content() []byte](#record.content)
    * [type bufWriter struct](#bufWriter)
        * [func newWriter(c *conn, recType recType, reqId uint16) *bufWriter](#newWriter)
        * [func (w *bufWriter) Close() error](#bufWriter.Close)
    * [type streamWriter struct](#streamWriter)
        * [func (w *streamWriter) Write(p []byte) (int, error)](#streamWriter.Write)
        * [func (w *streamWriter) Close() error](#streamWriter.Close)
    * [type nilCloser struct](#nilCloser)
        * [func (c *nilCloser) Close() error](#nilCloser.Close)
    * [type writeOnlyConn struct](#writeOnlyConn)
        * [func (c *writeOnlyConn) Write(p []byte) (int, error)](#writeOnlyConn.Write)
        * [func (c *writeOnlyConn) Read(p []byte) (int, error)](#writeOnlyConn.Read)
        * [func (c *writeOnlyConn) Close() error](#writeOnlyConn.Close)
    * [type nopWriteCloser struct](#nopWriteCloser)
        * [func (nopWriteCloser) Write(buf []byte) (int, error)](#nopWriteCloser.Write)
        * [func (nopWriteCloser) Close() error](#nopWriteCloser.Close)
    * [type rwNopCloser struct](#rwNopCloser)
        * [func (rwNopCloser) Close() error](#rwNopCloser.Close)
    * [type signallingNopCloser struct](#signallingNopCloser)
        * [func (*signallingNopCloser) Write(buf []byte) (int, error)](#signallingNopCloser.Write)
        * [func (rc *signallingNopCloser) Close() error](#signallingNopCloser.Close)
* [Functions](#func)
    * [func filterOutUsedEnvVars(envVars map[string]string) map[string]string](#filterOutUsedEnvVars)
    * [func Serve(l net.Listener, handler http.Handler) error](#Serve)
    * [func ProcessEnv(r *http.Request) map[string]string](#ProcessEnv)
    * [func addFastCGIEnvToContext(s string) bool](#addFastCGIEnvToContext)
    * [func readSize(s []byte) (uint32, int)](#readSize)
    * [func readString(s []byte, size uint32) string](#readString)
    * [func encodeSize(b []byte, size uint32) int](#encodeSize)
    * [func TestSize(t *testing.T)](#TestSize)
    * [func TestStreams(t *testing.T)](#TestStreams)
    * [func TestGetValues(t *testing.T)](#TestGetValues)
    * [func nameValuePair11(nameData, valueData string) []byte](#nameValuePair11)
    * [func makeRecord(recordType recType,...](#makeRecord)
    * [func TestChildServeCleansUp(t *testing.T)](#TestChildServeCleansUp)
    * [func TestMalformedParams(t *testing.T)](#TestMalformedParams)
    * [func TestChildServeReadsEnvVars(t *testing.T)](#TestChildServeReadsEnvVars)
    * [func TestResponseWriterSniffsContentType(t *testing.T)](#TestResponseWriterSniffsContentType)
    * [func TestSlowRequest(t *testing.T)](#TestSlowRequest)


## <a id="const" href="#const">Constants</a>

### <a id="typeBeginRequest" href="#typeBeginRequest">const typeBeginRequest</a>

```
searchKey: fcgi.typeBeginRequest
tags: [private]
```

```Go
const typeBeginRequest recType = 1
```

### <a id="typeAbortRequest" href="#typeAbortRequest">const typeAbortRequest</a>

```
searchKey: fcgi.typeAbortRequest
tags: [private]
```

```Go
const typeAbortRequest recType = 2
```

### <a id="typeEndRequest" href="#typeEndRequest">const typeEndRequest</a>

```
searchKey: fcgi.typeEndRequest
tags: [private]
```

```Go
const typeEndRequest recType = 3
```

### <a id="typeParams" href="#typeParams">const typeParams</a>

```
searchKey: fcgi.typeParams
tags: [private]
```

```Go
const typeParams recType = 4
```

### <a id="typeStdin" href="#typeStdin">const typeStdin</a>

```
searchKey: fcgi.typeStdin
tags: [private]
```

```Go
const typeStdin recType = 5
```

### <a id="typeStdout" href="#typeStdout">const typeStdout</a>

```
searchKey: fcgi.typeStdout
tags: [private]
```

```Go
const typeStdout recType = 6
```

### <a id="typeStderr" href="#typeStderr">const typeStderr</a>

```
searchKey: fcgi.typeStderr
tags: [private]
```

```Go
const typeStderr recType = 7
```

### <a id="typeData" href="#typeData">const typeData</a>

```
searchKey: fcgi.typeData
tags: [private]
```

```Go
const typeData recType = 8
```

### <a id="typeGetValues" href="#typeGetValues">const typeGetValues</a>

```
searchKey: fcgi.typeGetValues
tags: [private]
```

```Go
const typeGetValues recType = 9
```

### <a id="typeGetValuesResult" href="#typeGetValuesResult">const typeGetValuesResult</a>

```
searchKey: fcgi.typeGetValuesResult
tags: [private]
```

```Go
const typeGetValuesResult recType = 10
```

### <a id="typeUnknownType" href="#typeUnknownType">const typeUnknownType</a>

```
searchKey: fcgi.typeUnknownType
tags: [private]
```

```Go
const typeUnknownType recType = 11
```

### <a id="flagKeepConn" href="#flagKeepConn">const flagKeepConn</a>

```
searchKey: fcgi.flagKeepConn
tags: [private]
```

```Go
const flagKeepConn = 1
```

keep the connection between web-server and responder open after request 

### <a id="maxWrite" href="#maxWrite">const maxWrite</a>

```
searchKey: fcgi.maxWrite
tags: [private]
```

```Go
const maxWrite = 65535 // maximum record body

```

### <a id="maxPad" href="#maxPad">const maxPad</a>

```
searchKey: fcgi.maxPad
tags: [private]
```

```Go
const maxPad = 255
```

### <a id="roleResponder" href="#roleResponder">const roleResponder</a>

```
searchKey: fcgi.roleResponder
tags: [private]
```

```Go
const roleResponder = iota + 1 // only Responders are implemented.

```

### <a id="roleAuthorizer" href="#roleAuthorizer">const roleAuthorizer</a>

```
searchKey: fcgi.roleAuthorizer
tags: [private]
```

```Go
const roleAuthorizer
```

### <a id="roleFilter" href="#roleFilter">const roleFilter</a>

```
searchKey: fcgi.roleFilter
tags: [private]
```

```Go
const roleFilter
```

### <a id="statusRequestComplete" href="#statusRequestComplete">const statusRequestComplete</a>

```
searchKey: fcgi.statusRequestComplete
tags: [private]
```

```Go
const statusRequestComplete = iota
```

### <a id="statusCantMultiplex" href="#statusCantMultiplex">const statusCantMultiplex</a>

```
searchKey: fcgi.statusCantMultiplex
tags: [private]
```

```Go
const statusCantMultiplex
```

### <a id="statusOverloaded" href="#statusOverloaded">const statusOverloaded</a>

```
searchKey: fcgi.statusOverloaded
tags: [private]
```

```Go
const statusOverloaded
```

### <a id="statusUnknownRole" href="#statusUnknownRole">const statusUnknownRole</a>

```
searchKey: fcgi.statusUnknownRole
tags: [private]
```

```Go
const statusUnknownRole
```

## <a id="var" href="#var">Variables</a>

### <a id="errCloseConn" href="#errCloseConn">var errCloseConn</a>

```
searchKey: fcgi.errCloseConn
tags: [private]
```

```Go
var errCloseConn = errors.New("fcgi: connection should be closed")
```

### <a id="emptyBody" href="#emptyBody">var emptyBody</a>

```
searchKey: fcgi.emptyBody
tags: [private]
```

```Go
var emptyBody = io.NopCloser(strings.NewReader(""))
```

### <a id="ErrRequestAborted" href="#ErrRequestAborted">var ErrRequestAborted</a>

```
searchKey: fcgi.ErrRequestAborted
```

```Go
var ErrRequestAborted = errors.New("fcgi: request aborted by web server")
```

ErrRequestAborted is returned by Read when a handler attempts to read the body of a request that has been aborted by the web server. 

### <a id="ErrConnClosed" href="#ErrConnClosed">var ErrConnClosed</a>

```
searchKey: fcgi.ErrConnClosed
```

```Go
var ErrConnClosed = errors.New("fcgi: connection to web server closed")
```

ErrConnClosed is returned by Read when a handler attempts to read the body of a request after the connection to the web server has been closed. 

### <a id="pad" href="#pad">var pad</a>

```
searchKey: fcgi.pad
tags: [private]
```

```Go
var pad [maxPad]byte
```

for padding so we don't have to allocate all the time not synchronized because we don't care what the contents are 

### <a id="sizeTests" href="#sizeTests">var sizeTests</a>

```
searchKey: fcgi.sizeTests
tags: [private]
```

```Go
var sizeTests = ...
```

### <a id="streamTests" href="#streamTests">var streamTests</a>

```
searchKey: fcgi.streamTests
tags: [private]
```

```Go
var streamTests = ...
```

### <a id="streamBeginTypeStdin" href="#streamBeginTypeStdin">var streamBeginTypeStdin</a>

```
searchKey: fcgi.streamBeginTypeStdin
tags: [private]
```

```Go
var streamBeginTypeStdin = ...
```

a series of FastCGI records that start a request and begin sending the request body 

### <a id="cleanUpTests" href="#cleanUpTests">var cleanUpTests</a>

```
searchKey: fcgi.cleanUpTests
tags: [private]
```

```Go
var cleanUpTests = ...
```

### <a id="streamFullRequestStdin" href="#streamFullRequestStdin">var streamFullRequestStdin</a>

```
searchKey: fcgi.streamFullRequestStdin
tags: [private]
```

```Go
var streamFullRequestStdin = ...
```

a series of FastCGI records that start and end a request 

### <a id="envVarTests" href="#envVarTests">var envVarTests</a>

```
searchKey: fcgi.envVarTests
tags: [private]
```

```Go
var envVarTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="request" href="#request">type request struct</a>

```
searchKey: fcgi.request
tags: [private]
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
tags: [private]
```

```Go
func newRequest(reqId uint16, flags uint8) *request
```

#### <a id="request.parseParams" href="#request.parseParams">func (r *request) parseParams()</a>

```
searchKey: fcgi.request.parseParams
tags: [private]
```

```Go
func (r *request) parseParams()
```

parseParams reads an encoded []byte into Params. 

### <a id="envVarsContextKey" href="#envVarsContextKey">type envVarsContextKey struct{}</a>

```
searchKey: fcgi.envVarsContextKey
tags: [private]
```

```Go
type envVarsContextKey struct{}
```

envVarsContextKey uniquely identifies a mapping of CGI environment variables to their values in a request context 

### <a id="response" href="#response">type response struct</a>

```
searchKey: fcgi.response
tags: [private]
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
tags: [private]
```

```Go
func newResponse(c *child, req *request) *response
```

#### <a id="response.Header" href="#response.Header">func (r *response) Header() http.Header</a>

```
searchKey: fcgi.response.Header
tags: [private]
```

```Go
func (r *response) Header() http.Header
```

#### <a id="response.Write" href="#response.Write">func (r *response) Write(p []byte) (n int, err error)</a>

```
searchKey: fcgi.response.Write
tags: [private]
```

```Go
func (r *response) Write(p []byte) (n int, err error)
```

#### <a id="response.WriteHeader" href="#response.WriteHeader">func (r *response) WriteHeader(code int)</a>

```
searchKey: fcgi.response.WriteHeader
tags: [private]
```

```Go
func (r *response) WriteHeader(code int)
```

#### <a id="response.writeCGIHeader" href="#response.writeCGIHeader">func (r *response) writeCGIHeader(p []byte)</a>

```
searchKey: fcgi.response.writeCGIHeader
tags: [private]
```

```Go
func (r *response) writeCGIHeader(p []byte)
```

writeCGIHeader finalizes the header sent to the client and writes it to the output. p is not written by writeHeader, but is the first chunk of the body that will be written. It is sniffed for a Content-Type if none is set explicitly. 

#### <a id="response.Flush" href="#response.Flush">func (r *response) Flush()</a>

```
searchKey: fcgi.response.Flush
tags: [private]
```

```Go
func (r *response) Flush()
```

#### <a id="response.Close" href="#response.Close">func (r *response) Close() error</a>

```
searchKey: fcgi.response.Close
tags: [private]
```

```Go
func (r *response) Close() error
```

### <a id="child" href="#child">type child struct</a>

```
searchKey: fcgi.child
tags: [private]
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
tags: [private]
```

```Go
func newChild(rwc io.ReadWriteCloser, handler http.Handler) *child
```

#### <a id="child.serve" href="#child.serve">func (c *child) serve()</a>

```
searchKey: fcgi.child.serve
tags: [private]
```

```Go
func (c *child) serve()
```

#### <a id="child.handleRecord" href="#child.handleRecord">func (c *child) handleRecord(rec *record) error</a>

```
searchKey: fcgi.child.handleRecord
tags: [private]
```

```Go
func (c *child) handleRecord(rec *record) error
```

#### <a id="child.serveRequest" href="#child.serveRequest">func (c *child) serveRequest(req *request, body io.ReadCloser)</a>

```
searchKey: fcgi.child.serveRequest
tags: [private]
```

```Go
func (c *child) serveRequest(req *request, body io.ReadCloser)
```

#### <a id="child.cleanUp" href="#child.cleanUp">func (c *child) cleanUp()</a>

```
searchKey: fcgi.child.cleanUp
tags: [private]
```

```Go
func (c *child) cleanUp()
```

### <a id="recType" href="#recType">type recType uint8</a>

```
searchKey: fcgi.recType
tags: [private]
```

```Go
type recType uint8
```

recType is a record type, as defined by [https://web.archive.org/web/20150420080736/http://www.fastcgi.com/drupal/node/6?q=node/22#S8](https://web.archive.org/web/20150420080736/http://www.fastcgi.com/drupal/node/6?q=node/22#S8) 

### <a id="header" href="#header">type header struct</a>

```
searchKey: fcgi.header
tags: [private]
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
tags: [private]
```

```Go
func (h *header) init(recType recType, reqId uint16, contentLength int)
```

### <a id="beginRequest" href="#beginRequest">type beginRequest struct</a>

```
searchKey: fcgi.beginRequest
tags: [private]
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
tags: [private]
```

```Go
func (br *beginRequest) read(content []byte) error
```

### <a id="conn" href="#conn">type conn struct</a>

```
searchKey: fcgi.conn
tags: [private]
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
tags: [private]
```

```Go
func newConn(rwc io.ReadWriteCloser) *conn
```

#### <a id="conn.Close" href="#conn.Close">func (c *conn) Close() error</a>

```
searchKey: fcgi.conn.Close
tags: [private]
```

```Go
func (c *conn) Close() error
```

#### <a id="conn.writeRecord" href="#conn.writeRecord">func (c *conn) writeRecord(recType recType, reqId uint16, b []byte) error</a>

```
searchKey: fcgi.conn.writeRecord
tags: [private]
```

```Go
func (c *conn) writeRecord(recType recType, reqId uint16, b []byte) error
```

writeRecord writes and sends a single record. 

#### <a id="conn.writeEndRequest" href="#conn.writeEndRequest">func (c *conn) writeEndRequest(reqId uint16, appStatus int, protocolStatus uint8) error</a>

```
searchKey: fcgi.conn.writeEndRequest
tags: [private]
```

```Go
func (c *conn) writeEndRequest(reqId uint16, appStatus int, protocolStatus uint8) error
```

#### <a id="conn.writePairs" href="#conn.writePairs">func (c *conn) writePairs(recType recType, reqId uint16, pairs map[string]string) error</a>

```
searchKey: fcgi.conn.writePairs
tags: [private]
```

```Go
func (c *conn) writePairs(recType recType, reqId uint16, pairs map[string]string) error
```

### <a id="record" href="#record">type record struct</a>

```
searchKey: fcgi.record
tags: [private]
```

```Go
type record struct {
	h   header
	buf [maxWrite + maxPad]byte
}
```

#### <a id="record.read" href="#record.read">func (rec *record) read(r io.Reader) (err error)</a>

```
searchKey: fcgi.record.read
tags: [private]
```

```Go
func (rec *record) read(r io.Reader) (err error)
```

#### <a id="record.content" href="#record.content">func (r *record) content() []byte</a>

```
searchKey: fcgi.record.content
tags: [private]
```

```Go
func (r *record) content() []byte
```

### <a id="bufWriter" href="#bufWriter">type bufWriter struct</a>

```
searchKey: fcgi.bufWriter
tags: [private]
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
tags: [private]
```

```Go
func newWriter(c *conn, recType recType, reqId uint16) *bufWriter
```

#### <a id="bufWriter.Close" href="#bufWriter.Close">func (w *bufWriter) Close() error</a>

```
searchKey: fcgi.bufWriter.Close
tags: [private]
```

```Go
func (w *bufWriter) Close() error
```

### <a id="streamWriter" href="#streamWriter">type streamWriter struct</a>

```
searchKey: fcgi.streamWriter
tags: [private]
```

```Go
type streamWriter struct {
	c       *conn
	recType recType
	reqId   uint16
}
```

streamWriter abstracts out the separation of a stream into discrete records. It only writes maxWrite bytes at a time. 

#### <a id="streamWriter.Write" href="#streamWriter.Write">func (w *streamWriter) Write(p []byte) (int, error)</a>

```
searchKey: fcgi.streamWriter.Write
tags: [private]
```

```Go
func (w *streamWriter) Write(p []byte) (int, error)
```

#### <a id="streamWriter.Close" href="#streamWriter.Close">func (w *streamWriter) Close() error</a>

```
searchKey: fcgi.streamWriter.Close
tags: [private]
```

```Go
func (w *streamWriter) Close() error
```

### <a id="nilCloser" href="#nilCloser">type nilCloser struct</a>

```
searchKey: fcgi.nilCloser
tags: [private]
```

```Go
type nilCloser struct {
	io.ReadWriter
}
```

#### <a id="nilCloser.Close" href="#nilCloser.Close">func (c *nilCloser) Close() error</a>

```
searchKey: fcgi.nilCloser.Close
tags: [private]
```

```Go
func (c *nilCloser) Close() error
```

### <a id="writeOnlyConn" href="#writeOnlyConn">type writeOnlyConn struct</a>

```
searchKey: fcgi.writeOnlyConn
tags: [private]
```

```Go
type writeOnlyConn struct {
	buf []byte
}
```

#### <a id="writeOnlyConn.Write" href="#writeOnlyConn.Write">func (c *writeOnlyConn) Write(p []byte) (int, error)</a>

```
searchKey: fcgi.writeOnlyConn.Write
tags: [private]
```

```Go
func (c *writeOnlyConn) Write(p []byte) (int, error)
```

#### <a id="writeOnlyConn.Read" href="#writeOnlyConn.Read">func (c *writeOnlyConn) Read(p []byte) (int, error)</a>

```
searchKey: fcgi.writeOnlyConn.Read
tags: [private]
```

```Go
func (c *writeOnlyConn) Read(p []byte) (int, error)
```

#### <a id="writeOnlyConn.Close" href="#writeOnlyConn.Close">func (c *writeOnlyConn) Close() error</a>

```
searchKey: fcgi.writeOnlyConn.Close
tags: [private]
```

```Go
func (c *writeOnlyConn) Close() error
```

### <a id="nopWriteCloser" href="#nopWriteCloser">type nopWriteCloser struct</a>

```
searchKey: fcgi.nopWriteCloser
tags: [private]
```

```Go
type nopWriteCloser struct {
	io.Reader
}
```

#### <a id="nopWriteCloser.Write" href="#nopWriteCloser.Write">func (nopWriteCloser) Write(buf []byte) (int, error)</a>

```
searchKey: fcgi.nopWriteCloser.Write
tags: [private]
```

```Go
func (nopWriteCloser) Write(buf []byte) (int, error)
```

#### <a id="nopWriteCloser.Close" href="#nopWriteCloser.Close">func (nopWriteCloser) Close() error</a>

```
searchKey: fcgi.nopWriteCloser.Close
tags: [private]
```

```Go
func (nopWriteCloser) Close() error
```

### <a id="rwNopCloser" href="#rwNopCloser">type rwNopCloser struct</a>

```
searchKey: fcgi.rwNopCloser
tags: [private]
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
tags: [private]
```

```Go
func (rwNopCloser) Close() error
```

### <a id="signallingNopCloser" href="#signallingNopCloser">type signallingNopCloser struct</a>

```
searchKey: fcgi.signallingNopCloser
tags: [private]
```

```Go
type signallingNopCloser struct {
	io.Reader
	closed chan bool
}
```

#### <a id="signallingNopCloser.Write" href="#signallingNopCloser.Write">func (*signallingNopCloser) Write(buf []byte) (int, error)</a>

```
searchKey: fcgi.signallingNopCloser.Write
tags: [private]
```

```Go
func (*signallingNopCloser) Write(buf []byte) (int, error)
```

#### <a id="signallingNopCloser.Close" href="#signallingNopCloser.Close">func (rc *signallingNopCloser) Close() error</a>

```
searchKey: fcgi.signallingNopCloser.Close
tags: [private]
```

```Go
func (rc *signallingNopCloser) Close() error
```

## <a id="func" href="#func">Functions</a>

### <a id="filterOutUsedEnvVars" href="#filterOutUsedEnvVars">func filterOutUsedEnvVars(envVars map[string]string) map[string]string</a>

```
searchKey: fcgi.filterOutUsedEnvVars
tags: [private]
```

```Go
func filterOutUsedEnvVars(envVars map[string]string) map[string]string
```

filterOutUsedEnvVars returns a new map of env vars without the variables in the given envVars map that are read for creating each http.Request 

### <a id="Serve" href="#Serve">func Serve(l net.Listener, handler http.Handler) error</a>

```
searchKey: fcgi.Serve
```

```Go
func Serve(l net.Listener, handler http.Handler) error
```

Serve accepts incoming FastCGI connections on the listener l, creating a new goroutine for each. The goroutine reads requests and then calls handler to reply to them. If l is nil, Serve accepts connections from os.Stdin. If handler is nil, http.DefaultServeMux is used. 

### <a id="ProcessEnv" href="#ProcessEnv">func ProcessEnv(r *http.Request) map[string]string</a>

```
searchKey: fcgi.ProcessEnv
```

```Go
func ProcessEnv(r *http.Request) map[string]string
```

ProcessEnv returns FastCGI environment variables associated with the request r for which no effort was made to be included in the request itself - the data is hidden in the request's context. As an example, if REMOTE_USER is set for a request, it will not be found anywhere in r, but it will be included in ProcessEnv's response (via r's context). 

### <a id="addFastCGIEnvToContext" href="#addFastCGIEnvToContext">func addFastCGIEnvToContext(s string) bool</a>

```
searchKey: fcgi.addFastCGIEnvToContext
tags: [private]
```

```Go
func addFastCGIEnvToContext(s string) bool
```

addFastCGIEnvToContext reports whether to include the FastCGI environment variable s in the http.Request.Context, accessible via ProcessEnv. 

### <a id="readSize" href="#readSize">func readSize(s []byte) (uint32, int)</a>

```
searchKey: fcgi.readSize
tags: [private]
```

```Go
func readSize(s []byte) (uint32, int)
```

### <a id="readString" href="#readString">func readString(s []byte, size uint32) string</a>

```
searchKey: fcgi.readString
tags: [private]
```

```Go
func readString(s []byte, size uint32) string
```

### <a id="encodeSize" href="#encodeSize">func encodeSize(b []byte, size uint32) int</a>

```
searchKey: fcgi.encodeSize
tags: [private]
```

```Go
func encodeSize(b []byte, size uint32) int
```

### <a id="TestSize" href="#TestSize">func TestSize(t *testing.T)</a>

```
searchKey: fcgi.TestSize
tags: [private]
```

```Go
func TestSize(t *testing.T)
```

### <a id="TestStreams" href="#TestStreams">func TestStreams(t *testing.T)</a>

```
searchKey: fcgi.TestStreams
tags: [private]
```

```Go
func TestStreams(t *testing.T)
```

### <a id="TestGetValues" href="#TestGetValues">func TestGetValues(t *testing.T)</a>

```
searchKey: fcgi.TestGetValues
tags: [private]
```

```Go
func TestGetValues(t *testing.T)
```

### <a id="nameValuePair11" href="#nameValuePair11">func nameValuePair11(nameData, valueData string) []byte</a>

```
searchKey: fcgi.nameValuePair11
tags: [private]
```

```Go
func nameValuePair11(nameData, valueData string) []byte
```

### <a id="makeRecord" href="#makeRecord">func makeRecord(recordType recType,...</a>

```
searchKey: fcgi.makeRecord
tags: [private]
```

```Go
func makeRecord(
	recordType recType,
	requestId uint16,
	contentData []byte,
) []byte
```

### <a id="TestChildServeCleansUp" href="#TestChildServeCleansUp">func TestChildServeCleansUp(t *testing.T)</a>

```
searchKey: fcgi.TestChildServeCleansUp
tags: [private]
```

```Go
func TestChildServeCleansUp(t *testing.T)
```

Test that child.serve closes the bodies of aborted requests and closes the bodies of all requests before returning. Causes deadlock if either condition isn't met. See issue 6934. 

### <a id="TestMalformedParams" href="#TestMalformedParams">func TestMalformedParams(t *testing.T)</a>

```
searchKey: fcgi.TestMalformedParams
tags: [private]
```

```Go
func TestMalformedParams(t *testing.T)
```

Verifies it doesn't crash. 	Issue 11824. 

### <a id="TestChildServeReadsEnvVars" href="#TestChildServeReadsEnvVars">func TestChildServeReadsEnvVars(t *testing.T)</a>

```
searchKey: fcgi.TestChildServeReadsEnvVars
tags: [private]
```

```Go
func TestChildServeReadsEnvVars(t *testing.T)
```

Test that environment variables set for a request can be read by a handler. Ensures that variables not set will not be exposed to a handler. 

### <a id="TestResponseWriterSniffsContentType" href="#TestResponseWriterSniffsContentType">func TestResponseWriterSniffsContentType(t *testing.T)</a>

```
searchKey: fcgi.TestResponseWriterSniffsContentType
tags: [private]
```

```Go
func TestResponseWriterSniffsContentType(t *testing.T)
```

### <a id="TestSlowRequest" href="#TestSlowRequest">func TestSlowRequest(t *testing.T)</a>

```
searchKey: fcgi.TestSlowRequest
tags: [private]
```

```Go
func TestSlowRequest(t *testing.T)
```

Test whether server properly closes connection when processing slow requests 

