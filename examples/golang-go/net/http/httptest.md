# Package httptest

Package httptest provides utilities for HTTP testing. 

## Index

* [Constants](#const)
    * [const DefaultRemoteAddr](#DefaultRemoteAddr)
* [Variables](#var)
    * [var newServers](#newServers)
    * [var serveFlag](#serveFlag)
* [Types](#type)
    * [type ResponseRecorder struct](#ResponseRecorder)
        * [func NewRecorder() *ResponseRecorder](#NewRecorder)
        * [func (rw *ResponseRecorder) Flush()](#ResponseRecorder.Flush)
        * [func (rw *ResponseRecorder) Header() http.Header](#ResponseRecorder.Header)
        * [func (rw *ResponseRecorder) Result() *http.Response](#ResponseRecorder.Result)
        * [func (rw *ResponseRecorder) Write(buf []byte) (int, error)](#ResponseRecorder.Write)
        * [func (rw *ResponseRecorder) WriteHeader(code int)](#ResponseRecorder.WriteHeader)
        * [func (rw *ResponseRecorder) WriteString(str string) (int, error)](#ResponseRecorder.WriteString)
        * [func (rw *ResponseRecorder) writeHeader(b []byte, str string)](#ResponseRecorder.writeHeader)
    * [type Server struct](#Server)
        * [func NewServer(handler http.Handler) *Server](#NewServer)
        * [func NewTLSServer(handler http.Handler) *Server](#NewTLSServer)
        * [func NewUnstartedServer(handler http.Handler) *Server](#NewUnstartedServer)
        * [func (s *Server) Certificate() *x509.Certificate](#Server.Certificate)
        * [func (s *Server) Client() *http.Client](#Server.Client)
        * [func (s *Server) Close()](#Server.Close)
        * [func (s *Server) CloseClientConnections()](#Server.CloseClientConnections)
        * [func (s *Server) Start()](#Server.Start)
        * [func (s *Server) StartTLS()](#Server.StartTLS)
        * [func (s *Server) closeConn(c net.Conn)](#Server.closeConn)
        * [func (s *Server) closeConnChan(c net.Conn, done chan<- struct{})](#Server.closeConnChan)
        * [func (s *Server) forgetConn(c net.Conn)](#Server.forgetConn)
        * [func (s *Server) goServe()](#Server.goServe)
        * [func (s *Server) logCloseHangDebugInfo()](#Server.logCloseHangDebugInfo)
        * [func (s *Server) wrap()](#Server.wrap)
    * [type closeIdleTransport interface](#closeIdleTransport)
    * [type newServerFunc func(net/http.Handler) *std/net/http/httptest.Server](#newServerFunc)
    * [type onlyCloseListener struct](#onlyCloseListener)
        * [func (onlyCloseListener) Close() error](#onlyCloseListener.Close)
* [Functions](#func)
    * [func NewRequest(method, target string, body io.Reader) *http.Request](#NewRequest)
    * [func TestNewRequest(t *testing.T)](#TestNewRequest)
    * [func TestParseContentLength(t *testing.T)](#TestParseContentLength)
    * [func TestRecorder(t *testing.T)](#TestRecorder)
    * [func TestRecorderPanicsOnNonXXXStatusCode(t *testing.T)](#TestRecorderPanicsOnNonXXXStatusCode)
    * [func TestServer(t *testing.T)](#TestServer)
    * [func TestServerZeroValueClose(t *testing.T)](#TestServerZeroValueClose)
    * [func TestTLSServerWithHTTP2(t *testing.T)](#TestTLSServerWithHTTP2)
    * [func checkWriteHeaderCode(code int)](#checkWriteHeaderCode)
    * [func init()](#init.server.go)
    * [func newLocalListener() net.Listener](#newLocalListener)
    * [func parseContentLength(cl string) int64](#parseContentLength)
    * [func strSliceContainsPrefix(v []string, pre string) bool](#strSliceContainsPrefix)
    * [func testGetAfterClose(t *testing.T, newServer newServerFunc)](#testGetAfterClose)
    * [func testServer(t *testing.T, newServer newServerFunc)](#testServer)
    * [func testServerClient(t *testing.T, newTLSServer newServerFunc)](#testServerClient)
    * [func testServerClientTransportType(t *testing.T, newServer newServerFunc)](#testServerClientTransportType)
    * [func testServerCloseBlocking(t *testing.T, newServer newServerFunc)](#testServerCloseBlocking)
    * [func testServerCloseClientConnections(t *testing.T, newServer newServerFunc)](#testServerCloseClientConnections)
    * [func testTLSServerClientTransportType(t *testing.T, newTLSServer newServerFunc)](#testTLSServerClientTransportType)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="DefaultRemoteAddr" href="#DefaultRemoteAddr">const DefaultRemoteAddr</a>

```
searchKey: httptest.DefaultRemoteAddr
tags: [constant string]
```

```Go
const DefaultRemoteAddr = "1.2.3.4"
```

DefaultRemoteAddr is the default remote address to return in RemoteAddr if an explicit DefaultRemoteAddr isn't set on ResponseRecorder. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="newServers" href="#newServers">var newServers</a>

```
searchKey: httptest.newServers
tags: [variable object private]
```

```Go
var newServers = ...
```

### <a id="serveFlag" href="#serveFlag">var serveFlag</a>

```
searchKey: httptest.serveFlag
tags: [variable string private]
```

```Go
var serveFlag string
```

When debugging a particular http server-based test, this flag lets you run 

```
go test -run=BrokenTest -httptest.serve=127.0.0.1:8000

```
to start the broken server so you can interact with it manually. We only register this flag if it looks like the caller knows about it and is trying to use it as we don't want to pollute flags and this isn't really part of our API. Don't depend on this. 

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="ResponseRecorder" href="#ResponseRecorder">type ResponseRecorder struct</a>

```
searchKey: httptest.ResponseRecorder
tags: [struct]
```

```Go
type ResponseRecorder struct {
	// Code is the HTTP response code set by WriteHeader.
	//
	// Note that if a Handler never calls WriteHeader or Write,
	// this might end up being 0, rather than the implicit
	// http.StatusOK. To get the implicit value, use the Result
	// method.
	Code int

	// HeaderMap contains the headers explicitly set by the Handler.
	// It is an internal detail.
	//
	// Deprecated: HeaderMap exists for historical compatibility
	// and should not be used. To access the headers returned by a handler,
	// use the Response.Header map as returned by the Result method.
	HeaderMap http.Header

	// Body is the buffer to which the Handler's Write calls are sent.
	// If nil, the Writes are silently discarded.
	Body *bytes.Buffer

	// Flushed is whether the Handler called Flush.
	Flushed bool

	result      *http.Response // cache of Result's return value
	snapHeader  http.Header    // snapshot of HeaderMap at first Write
	wroteHeader bool
}
```

ResponseRecorder is an implementation of http.ResponseWriter that records its mutations for later inspection in tests. 

#### <a id="NewRecorder" href="#NewRecorder">func NewRecorder() *ResponseRecorder</a>

```
searchKey: httptest.NewRecorder
tags: [function]
```

```Go
func NewRecorder() *ResponseRecorder
```

NewRecorder returns an initialized ResponseRecorder. 

#### <a id="ResponseRecorder.Flush" href="#ResponseRecorder.Flush">func (rw *ResponseRecorder) Flush()</a>

```
searchKey: httptest.ResponseRecorder.Flush
tags: [function]
```

```Go
func (rw *ResponseRecorder) Flush()
```

Flush implements http.Flusher. To test whether Flush was called, see rw.Flushed. 

#### <a id="ResponseRecorder.Header" href="#ResponseRecorder.Header">func (rw *ResponseRecorder) Header() http.Header</a>

```
searchKey: httptest.ResponseRecorder.Header
tags: [function]
```

```Go
func (rw *ResponseRecorder) Header() http.Header
```

Header implements http.ResponseWriter. It returns the response headers to mutate within a handler. To test the headers that were written after a handler completes, use the Result method and see the returned Response value's Header. 

#### <a id="ResponseRecorder.Result" href="#ResponseRecorder.Result">func (rw *ResponseRecorder) Result() *http.Response</a>

```
searchKey: httptest.ResponseRecorder.Result
tags: [function]
```

```Go
func (rw *ResponseRecorder) Result() *http.Response
```

Result returns the response generated by the handler. 

The returned Response will have at least its StatusCode, Header, Body, and optionally Trailer populated. More fields may be populated in the future, so callers should not DeepEqual the result in tests. 

The Response.Header is a snapshot of the headers at the time of the first write call, or at the time of this call, if the handler never did a write. 

The Response.Body is guaranteed to be non-nil and Body.Read call is guaranteed to not return any error other than io.EOF. 

Result must only be called after the handler has finished running. 

#### <a id="ResponseRecorder.Write" href="#ResponseRecorder.Write">func (rw *ResponseRecorder) Write(buf []byte) (int, error)</a>

```
searchKey: httptest.ResponseRecorder.Write
tags: [method]
```

```Go
func (rw *ResponseRecorder) Write(buf []byte) (int, error)
```

Write implements http.ResponseWriter. The data in buf is written to rw.Body, if not nil. 

#### <a id="ResponseRecorder.WriteHeader" href="#ResponseRecorder.WriteHeader">func (rw *ResponseRecorder) WriteHeader(code int)</a>

```
searchKey: httptest.ResponseRecorder.WriteHeader
tags: [method]
```

```Go
func (rw *ResponseRecorder) WriteHeader(code int)
```

WriteHeader implements http.ResponseWriter. 

#### <a id="ResponseRecorder.WriteString" href="#ResponseRecorder.WriteString">func (rw *ResponseRecorder) WriteString(str string) (int, error)</a>

```
searchKey: httptest.ResponseRecorder.WriteString
tags: [method]
```

```Go
func (rw *ResponseRecorder) WriteString(str string) (int, error)
```

WriteString implements io.StringWriter. The data in str is written to rw.Body, if not nil. 

#### <a id="ResponseRecorder.writeHeader" href="#ResponseRecorder.writeHeader">func (rw *ResponseRecorder) writeHeader(b []byte, str string)</a>

```
searchKey: httptest.ResponseRecorder.writeHeader
tags: [method private]
```

```Go
func (rw *ResponseRecorder) writeHeader(b []byte, str string)
```

writeHeader writes a header if it was not written yet and detects Content-Type if needed. 

bytes or str are the beginning of the response body. We pass both to avoid unnecessarily generate garbage in rw.WriteString which was created for performance reasons. Non-nil bytes win. 

### <a id="Server" href="#Server">type Server struct</a>

```
searchKey: httptest.Server
tags: [struct]
```

```Go
type Server struct {
	URL      string // base URL of form http://ipaddr:port with no trailing slash
	Listener net.Listener

	// EnableHTTP2 controls whether HTTP/2 is enabled
	// on the server. It must be set between calling
	// NewUnstartedServer and calling Server.StartTLS.
	EnableHTTP2 bool

	// TLS is the optional TLS configuration, populated with a new config
	// after TLS is started. If set on an unstarted server before StartTLS
	// is called, existing fields are copied into the new config.
	TLS *tls.Config

	// Config may be changed after calling NewUnstartedServer and
	// before Start or StartTLS.
	Config *http.Server

	// certificate is a parsed version of the TLS config certificate, if present.
	certificate *x509.Certificate

	// wg counts the number of outstanding HTTP requests on this server.
	// Close blocks until all requests are finished.
	wg sync.WaitGroup

	mu     sync.Mutex // guards closed and conns
	closed bool
	conns  map[net.Conn]http.ConnState // except terminal states

	// client is configured for use with the server.
	// Its transport is automatically closed when Close is called.
	client *http.Client
}
```

A Server is an HTTP server listening on a system-chosen port on the local loopback interface, for use in end-to-end HTTP tests. 

#### <a id="NewServer" href="#NewServer">func NewServer(handler http.Handler) *Server</a>

```
searchKey: httptest.NewServer
tags: [method]
```

```Go
func NewServer(handler http.Handler) *Server
```

NewServer starts and returns a new Server. The caller should call Close when finished, to shut it down. 

#### <a id="NewTLSServer" href="#NewTLSServer">func NewTLSServer(handler http.Handler) *Server</a>

```
searchKey: httptest.NewTLSServer
tags: [method]
```

```Go
func NewTLSServer(handler http.Handler) *Server
```

NewTLSServer starts and returns a new Server using TLS. The caller should call Close when finished, to shut it down. 

#### <a id="NewUnstartedServer" href="#NewUnstartedServer">func NewUnstartedServer(handler http.Handler) *Server</a>

```
searchKey: httptest.NewUnstartedServer
tags: [method]
```

```Go
func NewUnstartedServer(handler http.Handler) *Server
```

NewUnstartedServer returns a new Server but doesn't start it. 

After changing its configuration, the caller should call Start or StartTLS. 

The caller should call Close when finished, to shut it down. 

#### <a id="Server.Certificate" href="#Server.Certificate">func (s *Server) Certificate() *x509.Certificate</a>

```
searchKey: httptest.Server.Certificate
tags: [function]
```

```Go
func (s *Server) Certificate() *x509.Certificate
```

Certificate returns the certificate used by the server, or nil if the server doesn't use TLS. 

#### <a id="Server.Client" href="#Server.Client">func (s *Server) Client() *http.Client</a>

```
searchKey: httptest.Server.Client
tags: [function]
```

```Go
func (s *Server) Client() *http.Client
```

Client returns an HTTP client configured for making requests to the server. It is configured to trust the server's TLS test certificate and will close its idle connections on Server.Close. 

#### <a id="Server.Close" href="#Server.Close">func (s *Server) Close()</a>

```
searchKey: httptest.Server.Close
tags: [function]
```

```Go
func (s *Server) Close()
```

Close shuts down the server and blocks until all outstanding requests on this server have completed. 

#### <a id="Server.CloseClientConnections" href="#Server.CloseClientConnections">func (s *Server) CloseClientConnections()</a>

```
searchKey: httptest.Server.CloseClientConnections
tags: [function]
```

```Go
func (s *Server) CloseClientConnections()
```

CloseClientConnections closes any open HTTP connections to the test Server. 

#### <a id="Server.Start" href="#Server.Start">func (s *Server) Start()</a>

```
searchKey: httptest.Server.Start
tags: [function]
```

```Go
func (s *Server) Start()
```

Start starts a server from NewUnstartedServer. 

#### <a id="Server.StartTLS" href="#Server.StartTLS">func (s *Server) StartTLS()</a>

```
searchKey: httptest.Server.StartTLS
tags: [function]
```

```Go
func (s *Server) StartTLS()
```

StartTLS starts TLS on a server from NewUnstartedServer. 

#### <a id="Server.closeConn" href="#Server.closeConn">func (s *Server) closeConn(c net.Conn)</a>

```
searchKey: httptest.Server.closeConn
tags: [method private]
```

```Go
func (s *Server) closeConn(c net.Conn)
```

closeConn closes c. s.mu must be held. 

#### <a id="Server.closeConnChan" href="#Server.closeConnChan">func (s *Server) closeConnChan(c net.Conn, done chan<- struct{})</a>

```
searchKey: httptest.Server.closeConnChan
tags: [method private]
```

```Go
func (s *Server) closeConnChan(c net.Conn, done chan<- struct{})
```

closeConnChan is like closeConn, but takes an optional channel to receive a value when the goroutine closing c is done. 

#### <a id="Server.forgetConn" href="#Server.forgetConn">func (s *Server) forgetConn(c net.Conn)</a>

```
searchKey: httptest.Server.forgetConn
tags: [method private]
```

```Go
func (s *Server) forgetConn(c net.Conn)
```

forgetConn removes c from the set of tracked conns and decrements it from the waitgroup, unless it was previously removed. s.mu must be held. 

#### <a id="Server.goServe" href="#Server.goServe">func (s *Server) goServe()</a>

```
searchKey: httptest.Server.goServe
tags: [function private]
```

```Go
func (s *Server) goServe()
```

#### <a id="Server.logCloseHangDebugInfo" href="#Server.logCloseHangDebugInfo">func (s *Server) logCloseHangDebugInfo()</a>

```
searchKey: httptest.Server.logCloseHangDebugInfo
tags: [function private]
```

```Go
func (s *Server) logCloseHangDebugInfo()
```

#### <a id="Server.wrap" href="#Server.wrap">func (s *Server) wrap()</a>

```
searchKey: httptest.Server.wrap
tags: [function private]
```

```Go
func (s *Server) wrap()
```

wrap installs the connection state-tracking hook to know which connections are idle. 

### <a id="closeIdleTransport" href="#closeIdleTransport">type closeIdleTransport interface</a>

```
searchKey: httptest.closeIdleTransport
tags: [interface private]
```

```Go
type closeIdleTransport interface {
	CloseIdleConnections()
}
```

### <a id="newServerFunc" href="#newServerFunc">type newServerFunc func(net/http.Handler) *std/net/http/httptest.Server</a>

```
searchKey: httptest.newServerFunc
tags: [function private]
```

```Go
type newServerFunc func(http.Handler) *Server
```

### <a id="onlyCloseListener" href="#onlyCloseListener">type onlyCloseListener struct</a>

```
searchKey: httptest.onlyCloseListener
tags: [struct private]
```

```Go
type onlyCloseListener struct {
	net.Listener
}
```

#### <a id="onlyCloseListener.Close" href="#onlyCloseListener.Close">func (onlyCloseListener) Close() error</a>

```
searchKey: httptest.onlyCloseListener.Close
tags: [function private]
```

```Go
func (onlyCloseListener) Close() error
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="NewRequest" href="#NewRequest">func NewRequest(method, target string, body io.Reader) *http.Request</a>

```
searchKey: httptest.NewRequest
tags: [method]
```

```Go
func NewRequest(method, target string, body io.Reader) *http.Request
```

NewRequest returns a new incoming server Request, suitable for passing to an http.Handler for testing. 

The target is the RFC 7230 "request-target": it may be either a path or an absolute URL. If target is an absolute URL, the host name from the URL is used. Otherwise, "example.com" is used. 

The TLS field is set to a non-nil dummy value if target has scheme "https". 

The Request.Proto is always HTTP/1.1. 

An empty method means "GET". 

The provided body may be nil. If the body is of type *bytes.Reader, *strings.Reader, or *bytes.Buffer, the Request.ContentLength is set. 

NewRequest panics on error for ease of use in testing, where a panic is acceptable. 

To generate a client HTTP request instead of a server request, see the NewRequest function in the net/http package. 

### <a id="TestNewRequest" href="#TestNewRequest">func TestNewRequest(t *testing.T)</a>

```
searchKey: httptest.TestNewRequest
tags: [method private test]
```

```Go
func TestNewRequest(t *testing.T)
```

### <a id="TestParseContentLength" href="#TestParseContentLength">func TestParseContentLength(t *testing.T)</a>

```
searchKey: httptest.TestParseContentLength
tags: [method private test]
```

```Go
func TestParseContentLength(t *testing.T)
```

issue 39017 - disallow Content-Length values such as "+3" 

### <a id="TestRecorder" href="#TestRecorder">func TestRecorder(t *testing.T)</a>

```
searchKey: httptest.TestRecorder
tags: [method private test]
```

```Go
func TestRecorder(t *testing.T)
```

### <a id="TestRecorderPanicsOnNonXXXStatusCode" href="#TestRecorderPanicsOnNonXXXStatusCode">func TestRecorderPanicsOnNonXXXStatusCode(t *testing.T)</a>

```
searchKey: httptest.TestRecorderPanicsOnNonXXXStatusCode
tags: [method private test]
```

```Go
func TestRecorderPanicsOnNonXXXStatusCode(t *testing.T)
```

Ensure that httptest.Recorder panics when given a non-3 digit (XXX) status HTTP code. See [https://golang.org/issues/45353](https://golang.org/issues/45353) 

### <a id="TestServer" href="#TestServer">func TestServer(t *testing.T)</a>

```
searchKey: httptest.TestServer
tags: [method private test]
```

```Go
func TestServer(t *testing.T)
```

### <a id="TestServerZeroValueClose" href="#TestServerZeroValueClose">func TestServerZeroValueClose(t *testing.T)</a>

```
searchKey: httptest.TestServerZeroValueClose
tags: [method private test]
```

```Go
func TestServerZeroValueClose(t *testing.T)
```

Issue 19729: panic in Server.Close for values created directly without a constructor (so the unexported client field is nil). 

### <a id="TestTLSServerWithHTTP2" href="#TestTLSServerWithHTTP2">func TestTLSServerWithHTTP2(t *testing.T)</a>

```
searchKey: httptest.TestTLSServerWithHTTP2
tags: [method private test]
```

```Go
func TestTLSServerWithHTTP2(t *testing.T)
```

### <a id="checkWriteHeaderCode" href="#checkWriteHeaderCode">func checkWriteHeaderCode(code int)</a>

```
searchKey: httptest.checkWriteHeaderCode
tags: [method private]
```

```Go
func checkWriteHeaderCode(code int)
```

### <a id="init.server.go" href="#init.server.go">func init()</a>

```
searchKey: httptest.init
tags: [function private]
```

```Go
func init()
```

### <a id="newLocalListener" href="#newLocalListener">func newLocalListener() net.Listener</a>

```
searchKey: httptest.newLocalListener
tags: [function private]
```

```Go
func newLocalListener() net.Listener
```

### <a id="parseContentLength" href="#parseContentLength">func parseContentLength(cl string) int64</a>

```
searchKey: httptest.parseContentLength
tags: [method private]
```

```Go
func parseContentLength(cl string) int64
```

parseContentLength trims whitespace from s and returns -1 if no value is set, or the value if it's >= 0. 

This a modified version of same function found in net/http/transfer.go. This one just ignores an invalid header. 

### <a id="strSliceContainsPrefix" href="#strSliceContainsPrefix">func strSliceContainsPrefix(v []string, pre string) bool</a>

```
searchKey: httptest.strSliceContainsPrefix
tags: [method private]
```

```Go
func strSliceContainsPrefix(v []string, pre string) bool
```

### <a id="testGetAfterClose" href="#testGetAfterClose">func testGetAfterClose(t *testing.T, newServer newServerFunc)</a>

```
searchKey: httptest.testGetAfterClose
tags: [method private]
```

```Go
func testGetAfterClose(t *testing.T, newServer newServerFunc)
```

Issue 12781 

### <a id="testServer" href="#testServer">func testServer(t *testing.T, newServer newServerFunc)</a>

```
searchKey: httptest.testServer
tags: [method private]
```

```Go
func testServer(t *testing.T, newServer newServerFunc)
```

### <a id="testServerClient" href="#testServerClient">func testServerClient(t *testing.T, newTLSServer newServerFunc)</a>

```
searchKey: httptest.testServerClient
tags: [method private]
```

```Go
func testServerClient(t *testing.T, newTLSServer newServerFunc)
```

Tests that the Server.Client method works and returns an http.Client that can hit NewTLSServer without cert warnings. 

### <a id="testServerClientTransportType" href="#testServerClientTransportType">func testServerClientTransportType(t *testing.T, newServer newServerFunc)</a>

```
searchKey: httptest.testServerClientTransportType
tags: [method private]
```

```Go
func testServerClientTransportType(t *testing.T, newServer newServerFunc)
```

Tests that the Server.Client.Transport interface is implemented by a *http.Transport. 

### <a id="testServerCloseBlocking" href="#testServerCloseBlocking">func testServerCloseBlocking(t *testing.T, newServer newServerFunc)</a>

```
searchKey: httptest.testServerCloseBlocking
tags: [method private]
```

```Go
func testServerCloseBlocking(t *testing.T, newServer newServerFunc)
```

### <a id="testServerCloseClientConnections" href="#testServerCloseClientConnections">func testServerCloseClientConnections(t *testing.T, newServer newServerFunc)</a>

```
searchKey: httptest.testServerCloseClientConnections
tags: [method private]
```

```Go
func testServerCloseClientConnections(t *testing.T, newServer newServerFunc)
```

Issue 14290 

### <a id="testTLSServerClientTransportType" href="#testTLSServerClientTransportType">func testTLSServerClientTransportType(t *testing.T, newTLSServer newServerFunc)</a>

```
searchKey: httptest.testTLSServerClientTransportType
tags: [method private]
```

```Go
func testTLSServerClientTransportType(t *testing.T, newTLSServer newServerFunc)
```

Tests that the TLS Server.Client.Transport interface is implemented by a *http.Transport. 

