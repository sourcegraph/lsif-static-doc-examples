# Package httputil

Package httputil provides HTTP utility functions, complementing the more common ones in the net/http package. 

## Index

* [Constants](#const)
    * [const fakeHopHeader](#fakeHopHeader)
* [Variables](#var)
    * [var ErrClosed](#ErrClosed)
    * [var ErrLineTooLong](#ErrLineTooLong)
    * [var ErrPersistEOF](#ErrPersistEOF)
    * [var ErrPipeline](#ErrPipeline)
    * [var dumpResTests](#dumpResTests)
    * [var dumpTests](#dumpTests)
    * [var emptyBody](#emptyBody)
    * [var errClosed](#errClosed)
    * [var errNoBody](#errNoBody)
    * [var hopHeaders](#hopHeaders)
    * [var inOurTests](#inOurTests)
    * [var proxyQueryTests](#proxyQueryTests)
    * [var reqWriteExcludeHeaderDump](#reqWriteExcludeHeaderDump)
* [Types](#type)
    * [type BufferPool interface](#BufferPool)
    * [type ClientConn struct](#ClientConn)
        * [func NewClientConn(c net.Conn, r *bufio.Reader) *ClientConn](#NewClientConn)
        * [func NewProxyClientConn(c net.Conn, r *bufio.Reader) *ClientConn](#NewProxyClientConn)
        * [func (cc *ClientConn) Close() error](#ClientConn.Close)
        * [func (cc *ClientConn) Do(req *http.Request) (*http.Response, error)](#ClientConn.Do)
        * [func (cc *ClientConn) Hijack() (c net.Conn, r *bufio.Reader)](#ClientConn.Hijack)
        * [func (cc *ClientConn) Pending() int](#ClientConn.Pending)
        * [func (cc *ClientConn) Read(req *http.Request) (resp *http.Response, err error)](#ClientConn.Read)
        * [func (cc *ClientConn) Write(req *http.Request) error](#ClientConn.Write)
    * [type ReverseProxy struct](#ReverseProxy)
        * [func NewSingleHostReverseProxy(target *url.URL) *ReverseProxy](#NewSingleHostReverseProxy)
        * [func (p *ReverseProxy) ServeHTTP(rw http.ResponseWriter, req *http.Request)](#ReverseProxy.ServeHTTP)
        * [func (p *ReverseProxy) copyBuffer(dst io.Writer, src io.Reader, buf []byte) (int64, error)](#ReverseProxy.copyBuffer)
        * [func (p *ReverseProxy) copyResponse(dst io.Writer, src io.Reader, flushInterval time.Duration) error](#ReverseProxy.copyResponse)
        * [func (p *ReverseProxy) defaultErrorHandler(rw http.ResponseWriter, req *http.Request, err error)](#ReverseProxy.defaultErrorHandler)
        * [func (p *ReverseProxy) flushInterval(res *http.Response) time.Duration](#ReverseProxy.flushInterval)
        * [func (p *ReverseProxy) getErrorHandler() func(http.ResponseWriter, *http.Request, error)](#ReverseProxy.getErrorHandler)
        * [func (p *ReverseProxy) handleUpgradeResponse(rw http.ResponseWriter, req *http.Request, res *http.Response)](#ReverseProxy.handleUpgradeResponse)
        * [func (p *ReverseProxy) logf(format string, args ...interface{})](#ReverseProxy.logf)
        * [func (p *ReverseProxy) modifyResponse(rw http.ResponseWriter, res *http.Response, req *http.Request) bool](#ReverseProxy.modifyResponse)
    * [type RoundTripperFunc func(*net/http.Request) (*net/http.Response, error)](#RoundTripperFunc)
        * [func (fn RoundTripperFunc) RoundTrip(req *http.Request) (*http.Response, error)](#RoundTripperFunc.RoundTrip)
    * [type ServerConn struct](#ServerConn)
        * [func NewServerConn(c net.Conn, r *bufio.Reader) *ServerConn](#NewServerConn)
        * [func (sc *ServerConn) Close() error](#ServerConn.Close)
        * [func (sc *ServerConn) Hijack() (net.Conn, *bufio.Reader)](#ServerConn.Hijack)
        * [func (sc *ServerConn) Pending() int](#ServerConn.Pending)
        * [func (sc *ServerConn) Read() (*http.Request, error)](#ServerConn.Read)
        * [func (sc *ServerConn) Write(req *http.Request, resp *http.Response) error](#ServerConn.Write)
    * [type bufferPool struct](#bufferPool)
        * [func (bp bufferPool) Get() []byte](#bufferPool.Get)
        * [func (bp bufferPool) Put(v []byte)](#bufferPool.Put)
    * [type checkCloser struct](#checkCloser)
        * [func (cc *checkCloser) Close() error](#checkCloser.Close)
        * [func (cc *checkCloser) Read(b []byte) (int, error)](#checkCloser.Read)
    * [type delegateReader struct](#delegateReader)
        * [func (r *delegateReader) Read(p []byte) (int, error)](#delegateReader.Read)
    * [type dumpConn struct](#dumpConn)
        * [func (c *dumpConn) Close() error](#dumpConn.Close)
        * [func (c *dumpConn) LocalAddr() net.Addr](#dumpConn.LocalAddr)
        * [func (c *dumpConn) RemoteAddr() net.Addr](#dumpConn.RemoteAddr)
        * [func (c *dumpConn) SetDeadline(t time.Time) error](#dumpConn.SetDeadline)
        * [func (c *dumpConn) SetReadDeadline(t time.Time) error](#dumpConn.SetReadDeadline)
        * [func (c *dumpConn) SetWriteDeadline(t time.Time) error](#dumpConn.SetWriteDeadline)
    * [type dumpTest struct](#dumpTest)
    * [type eofReader struct{}](#eofReader)
        * [func (n eofReader) Close() error](#eofReader.Close)
        * [func (n eofReader) Read([]byte) (int, error)](#eofReader.Read)
    * [type failingRoundTripper struct{}](#failingRoundTripper)
        * [func (failingRoundTripper) RoundTrip(*http.Request) (*http.Response, error)](#failingRoundTripper.RoundTrip)
    * [type failureToReadBody struct{}](#failureToReadBody)
        * [func (failureToReadBody) Close() error](#failureToReadBody.Close)
        * [func (failureToReadBody) Read([]byte) (int, error)](#failureToReadBody.Read)
    * [type maxLatencyWriter struct](#maxLatencyWriter)
        * [func (m *maxLatencyWriter) Write(p []byte) (n int, err error)](#maxLatencyWriter.Write)
        * [func (m *maxLatencyWriter) delayedFlush()](#maxLatencyWriter.delayedFlush)
        * [func (m *maxLatencyWriter) stop()](#maxLatencyWriter.stop)
    * [type neverEnding byte](#neverEnding)
        * [func (b neverEnding) Read(p []byte) (n int, err error)](#neverEnding.Read)
    * [type roundTripperFunc func(req *net/http.Request) (*net/http.Response, error)](#roundTripperFunc)
        * [func (fn roundTripperFunc) RoundTrip(req *http.Request) (*http.Response, error)](#roundTripperFunc.RoundTrip)
    * [type staticResponseRoundTripper struct](#staticResponseRoundTripper)
        * [func (rt staticResponseRoundTripper) RoundTrip(*http.Request) (*http.Response, error)](#staticResponseRoundTripper.RoundTrip)
    * [type staticTransport struct](#staticTransport)
        * [func (t *staticTransport) RoundTrip(r *http.Request) (*http.Response, error)](#staticTransport.RoundTrip)
    * [type switchProtocolCopier struct](#switchProtocolCopier)
        * [func (c switchProtocolCopier) copyFromBackend(errc chan<- error)](#switchProtocolCopier.copyFromBackend)
        * [func (c switchProtocolCopier) copyToBackend(errc chan<- error)](#switchProtocolCopier.copyToBackend)
    * [type writeFlusher interface](#writeFlusher)
* [Functions](#func)
    * [func BenchmarkServeHTTP(b *testing.B)](#BenchmarkServeHTTP)
    * [func DumpRequest(req *http.Request, body bool) ([]byte, error)](#DumpRequest)
    * [func DumpRequestOut(req *http.Request, body bool) ([]byte, error)](#DumpRequestOut)
    * [func DumpResponse(resp *http.Response, body bool) ([]byte, error)](#DumpResponse)
    * [func NewChunkedReader(r io.Reader) io.Reader](#NewChunkedReader)
    * [func NewChunkedWriter(w io.Writer) io.WriteCloser](#NewChunkedWriter)
    * [func TestClonesRequestHeaders(t *testing.T)](#TestClonesRequestHeaders)
    * [func TestDumpRequest(t *testing.T)](#TestDumpRequest)
    * [func TestDumpRequestOutIssue38352(t *testing.T)](#TestDumpRequestOutIssue38352)
    * [func TestDumpResponse(t *testing.T)](#TestDumpResponse)
    * [func TestJoinURLPath(t *testing.T)](#TestJoinURLPath)
    * [func TestModifyResponseClosesBody(t *testing.T)](#TestModifyResponseClosesBody)
    * [func TestNilBody(t *testing.T)](#TestNilBody)
    * [func TestReverseProxy(t *testing.T)](#TestReverseProxy)
    * [func TestReverseProxyCancellation(t *testing.T)](#TestReverseProxyCancellation)
    * [func TestReverseProxyErrorHandler(t *testing.T)](#TestReverseProxyErrorHandler)
    * [func TestReverseProxyFlushInterval(t *testing.T)](#TestReverseProxyFlushInterval)
    * [func TestReverseProxyFlushIntervalHeaders(t *testing.T)](#TestReverseProxyFlushIntervalHeaders)
    * [func TestReverseProxyGetPutBuffer(t *testing.T)](#TestReverseProxyGetPutBuffer)
    * [func TestReverseProxyModifyResponse(t *testing.T)](#TestReverseProxyModifyResponse)
    * [func TestReverseProxyQuery(t *testing.T)](#TestReverseProxyQuery)
    * [func TestReverseProxyStripEmptyConnection(t *testing.T)](#TestReverseProxyStripEmptyConnection)
    * [func TestReverseProxyStripHeadersPresentInConnection(t *testing.T)](#TestReverseProxyStripHeadersPresentInConnection)
    * [func TestReverseProxyWebSocket(t *testing.T)](#TestReverseProxyWebSocket)
    * [func TestReverseProxyWebSocketCancellation(t *testing.T)](#TestReverseProxyWebSocketCancellation)
    * [func TestReverseProxy_AllocatedHeader(t *testing.T)](#TestReverseProxy_AllocatedHeader)
    * [func TestReverseProxy_CopyBuffer(t *testing.T)](#TestReverseProxy_CopyBuffer)
    * [func TestReverseProxy_NilBody(t *testing.T)](#TestReverseProxy_NilBody)
    * [func TestReverseProxy_PanicBodyError(t *testing.T)](#TestReverseProxy_PanicBodyError)
    * [func TestReverseProxy_Post(t *testing.T)](#TestReverseProxy_Post)
    * [func TestSelectFlushInterval(t *testing.T)](#TestSelectFlushInterval)
    * [func TestServeHTTPDeepCopy(t *testing.T)](#TestServeHTTPDeepCopy)
    * [func TestSingleJoinSlash(t *testing.T)](#TestSingleJoinSlash)
    * [func TestUnannouncedTrailer(t *testing.T)](#TestUnannouncedTrailer)
    * [func TestUserAgentHeader(t *testing.T)](#TestUserAgentHeader)
    * [func TestXForwardedFor(t *testing.T)](#TestXForwardedFor)
    * [func TestXForwardedFor_Omit(t *testing.T)](#TestXForwardedFor_Omit)
    * [func chunk(s string) string](#chunk)
    * [func copyHeader(dst, src http.Header)](#copyHeader)
    * [func deadline(t *testing.T, defaultDelay, needed time.Duration) time.Time](#deadline)
    * [func drainBody(b io.ReadCloser) (r1, r2 io.ReadCloser, err error)](#drainBody)
    * [func init()](#init.reverseproxy_test.go)
    * [func joinURLPath(a, b *url.URL) (path, rawpath string)](#joinURLPath)
    * [func mustNewRequest(method, url string, body io.Reader) *http.Request](#mustNewRequest)
    * [func mustParseURL(s string) *url.URL](#mustParseURL)
    * [func mustReadRequest(s string) *http.Request](#mustReadRequest)
    * [func outgoingLength(req *http.Request) int64](#outgoingLength)
    * [func removeConnectionHeaders(h http.Header)](#removeConnectionHeaders)
    * [func req(t *testing.T, v string) *http.Request](#req)
    * [func shouldPanicOnCopyError(req *http.Request) bool](#shouldPanicOnCopyError)
    * [func singleJoiningSlash(a, b string) string](#singleJoiningSlash)
    * [func upgradeType(h http.Header) string](#upgradeType)
    * [func valueOrDefault(value, def string) string](#valueOrDefault)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="fakeHopHeader" href="#fakeHopHeader">const fakeHopHeader</a>

```
searchKey: httputil.fakeHopHeader
tags: [constant string private]
```

```Go
const fakeHopHeader = "X-Fake-Hop-Header-For-Test"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="ErrClosed" href="#ErrClosed">var ErrClosed</a>

```
searchKey: httputil.ErrClosed
tags: [variable struct deprecated]
```

```Go
var ErrClosed = &http.ProtocolError{ErrorString: "connection closed by user"}
```

Deprecated: No longer used. 

### <a id="ErrLineTooLong" href="#ErrLineTooLong">var ErrLineTooLong</a>

```
searchKey: httputil.ErrLineTooLong
tags: [variable interface]
```

```Go
var ErrLineTooLong = internal.ErrLineTooLong
```

ErrLineTooLong is returned when reading malformed chunked data with lines that are too long. 

### <a id="ErrPersistEOF" href="#ErrPersistEOF">var ErrPersistEOF</a>

```
searchKey: httputil.ErrPersistEOF
tags: [variable struct deprecated]
```

```Go
var ErrPersistEOF = &http.ProtocolError{ErrorString: "persistent connection closed"}
```

Deprecated: No longer used. 

### <a id="ErrPipeline" href="#ErrPipeline">var ErrPipeline</a>

```
searchKey: httputil.ErrPipeline
tags: [variable struct deprecated]
```

```Go
var ErrPipeline = &http.ProtocolError{ErrorString: "pipeline error"}
```

Deprecated: No longer used. 

### <a id="dumpResTests" href="#dumpResTests">var dumpResTests</a>

```
searchKey: httputil.dumpResTests
tags: [variable array struct private]
```

```Go
var dumpResTests = ...
```

### <a id="dumpTests" href="#dumpTests">var dumpTests</a>

```
searchKey: httputil.dumpTests
tags: [variable array struct private]
```

```Go
var dumpTests = ...
```

### <a id="emptyBody" href="#emptyBody">var emptyBody</a>

```
searchKey: httputil.emptyBody
tags: [variable interface private]
```

```Go
var emptyBody = io.NopCloser(strings.NewReader(""))
```

emptyBody is an instance of empty reader. 

### <a id="errClosed" href="#errClosed">var errClosed</a>

```
searchKey: httputil.errClosed
tags: [variable interface private]
```

```Go
var errClosed = errors.New("i/o operation on closed connection")
```

This is an API usage error - the local side is closed. ErrPersistEOF (above) reports that the remote side is closed. 

### <a id="errNoBody" href="#errNoBody">var errNoBody</a>

```
searchKey: httputil.errNoBody
tags: [variable interface private]
```

```Go
var errNoBody = errors.New("sentinel error value")
```

errNoBody is a sentinel error value used by failureToReadBody so we can detect that the lack of body was intentional. 

### <a id="hopHeaders" href="#hopHeaders">var hopHeaders</a>

```
searchKey: httputil.hopHeaders
tags: [variable array string private]
```

```Go
var hopHeaders = ...
```

Hop-by-hop headers. These are removed when sent to the backend. As of RFC 7230, hop-by-hop headers are required to appear in the Connection header field. These are the headers defined by the obsoleted RFC 2616 (section 13.5.1) and are used for backward compatibility. 

### <a id="inOurTests" href="#inOurTests">var inOurTests</a>

```
searchKey: httputil.inOurTests
tags: [variable boolean private]
```

```Go
var inOurTests bool // whether we're in our own tests

```

### <a id="proxyQueryTests" href="#proxyQueryTests">var proxyQueryTests</a>

```
searchKey: httputil.proxyQueryTests
tags: [variable array struct private]
```

```Go
var proxyQueryTests = ...
```

### <a id="reqWriteExcludeHeaderDump" href="#reqWriteExcludeHeaderDump">var reqWriteExcludeHeaderDump</a>

```
searchKey: httputil.reqWriteExcludeHeaderDump
tags: [variable object private]
```

```Go
var reqWriteExcludeHeaderDump = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="BufferPool" href="#BufferPool">type BufferPool interface</a>

```
searchKey: httputil.BufferPool
tags: [interface]
```

```Go
type BufferPool interface {
	Get() []byte
	Put([]byte)
}
```

A BufferPool is an interface for getting and returning temporary byte slices for use by io.CopyBuffer. 

### <a id="ClientConn" href="#ClientConn">type ClientConn struct</a>

```
searchKey: httputil.ClientConn
tags: [struct]
```

```Go
type ClientConn struct {
	mu              sync.Mutex // read-write protects the following fields
	c               net.Conn
	r               *bufio.Reader
	re, we          error // read/write errors
	lastbody        io.ReadCloser
	nread, nwritten int
	pipereq         map[*http.Request]uint

	pipe     textproto.Pipeline
	writeReq func(*http.Request, io.Writer) error
}
```

ClientConn is an artifact of Go's early HTTP implementation. It is low-level, old, and unused by Go's current HTTP stack. We should have deleted it before Go 1. 

Deprecated: Use Client or Transport in package net/http instead. 

#### <a id="NewClientConn" href="#NewClientConn">func NewClientConn(c net.Conn, r *bufio.Reader) *ClientConn</a>

```
searchKey: httputil.NewClientConn
tags: [method deprecated]
```

```Go
func NewClientConn(c net.Conn, r *bufio.Reader) *ClientConn
```

NewClientConn is an artifact of Go's early HTTP implementation. It is low-level, old, and unused by Go's current HTTP stack. We should have deleted it before Go 1. 

Deprecated: Use the Client or Transport in package net/http instead. 

#### <a id="NewProxyClientConn" href="#NewProxyClientConn">func NewProxyClientConn(c net.Conn, r *bufio.Reader) *ClientConn</a>

```
searchKey: httputil.NewProxyClientConn
tags: [method deprecated]
```

```Go
func NewProxyClientConn(c net.Conn, r *bufio.Reader) *ClientConn
```

NewProxyClientConn is an artifact of Go's early HTTP implementation. It is low-level, old, and unused by Go's current HTTP stack. We should have deleted it before Go 1. 

Deprecated: Use the Client or Transport in package net/http instead. 

#### <a id="ClientConn.Close" href="#ClientConn.Close">func (cc *ClientConn) Close() error</a>

```
searchKey: httputil.ClientConn.Close
tags: [function]
```

```Go
func (cc *ClientConn) Close() error
```

Close calls Hijack and then also closes the underlying connection. 

#### <a id="ClientConn.Do" href="#ClientConn.Do">func (cc *ClientConn) Do(req *http.Request) (*http.Response, error)</a>

```
searchKey: httputil.ClientConn.Do
tags: [method]
```

```Go
func (cc *ClientConn) Do(req *http.Request) (*http.Response, error)
```

Do is convenience method that writes a request and reads a response. 

#### <a id="ClientConn.Hijack" href="#ClientConn.Hijack">func (cc *ClientConn) Hijack() (c net.Conn, r *bufio.Reader)</a>

```
searchKey: httputil.ClientConn.Hijack
tags: [function]
```

```Go
func (cc *ClientConn) Hijack() (c net.Conn, r *bufio.Reader)
```

Hijack detaches the ClientConn and returns the underlying connection as well as the read-side bufio which may have some left over data. Hijack may be called before the user or Read have signaled the end of the keep-alive logic. The user should not call Hijack while Read or Write is in progress. 

#### <a id="ClientConn.Pending" href="#ClientConn.Pending">func (cc *ClientConn) Pending() int</a>

```
searchKey: httputil.ClientConn.Pending
tags: [function]
```

```Go
func (cc *ClientConn) Pending() int
```

Pending returns the number of unanswered requests that have been sent on the connection. 

#### <a id="ClientConn.Read" href="#ClientConn.Read">func (cc *ClientConn) Read(req *http.Request) (resp *http.Response, err error)</a>

```
searchKey: httputil.ClientConn.Read
tags: [method]
```

```Go
func (cc *ClientConn) Read(req *http.Request) (resp *http.Response, err error)
```

Read reads the next response from the wire. A valid response might be returned together with an ErrPersistEOF, which means that the remote requested that this be the last request serviced. Read can be called concurrently with Write, but not with another Read. 

#### <a id="ClientConn.Write" href="#ClientConn.Write">func (cc *ClientConn) Write(req *http.Request) error</a>

```
searchKey: httputil.ClientConn.Write
tags: [method]
```

```Go
func (cc *ClientConn) Write(req *http.Request) error
```

Write writes a request. An ErrPersistEOF error is returned if the connection has been closed in an HTTP keep-alive sense. If req.Close equals true, the keep-alive connection is logically closed after this request and the opposing server is informed. An ErrUnexpectedEOF indicates the remote closed the underlying TCP connection, which is usually considered as graceful close. 

### <a id="ReverseProxy" href="#ReverseProxy">type ReverseProxy struct</a>

```
searchKey: httputil.ReverseProxy
tags: [struct]
```

```Go
type ReverseProxy struct {
	// Director must be a function which modifies
	// the request into a new request to be sent
	// using Transport. Its response is then copied
	// back to the original client unmodified.
	// Director must not access the provided Request
	// after returning.
	Director func(*http.Request)

	// The transport used to perform proxy requests.
	// If nil, http.DefaultTransport is used.
	Transport http.RoundTripper

	// FlushInterval specifies the flush interval
	// to flush to the client while copying the
	// response body.
	// If zero, no periodic flushing is done.
	// A negative value means to flush immediately
	// after each write to the client.
	// The FlushInterval is ignored when ReverseProxy
	// recognizes a response as a streaming response, or
	// if its ContentLength is -1; for such responses, writes
	// are flushed to the client immediately.
	FlushInterval time.Duration

	// ErrorLog specifies an optional logger for errors
	// that occur when attempting to proxy the request.
	// If nil, logging is done via the log package's standard logger.
	ErrorLog *log.Logger

	// BufferPool optionally specifies a buffer pool to
	// get byte slices for use by io.CopyBuffer when
	// copying HTTP response bodies.
	BufferPool BufferPool

	// ModifyResponse is an optional function that modifies the
	// Response from the backend. It is called if the backend
	// returns a response at all, with any HTTP status code.
	// If the backend is unreachable, the optional ErrorHandler is
	// called without any call to ModifyResponse.
	//
	// If ModifyResponse returns an error, ErrorHandler is called
	// with its error value. If ErrorHandler is nil, its default
	// implementation is used.
	ModifyResponse func(*http.Response) error

	// ErrorHandler is an optional function that handles errors
	// reaching the backend or errors from ModifyResponse.
	//
	// If nil, the default is to log the provided error and return
	// a 502 Status Bad Gateway response.
	ErrorHandler func(http.ResponseWriter, *http.Request, error)
}
```

ReverseProxy is an HTTP Handler that takes an incoming request and sends it to another server, proxying the response back to the client. 

ReverseProxy by default sets the client IP as the value of the X-Forwarded-For header. 

If an X-Forwarded-For header already exists, the client IP is appended to the existing values. As a special case, if the header exists in the Request.Header map but has a nil value (such as when set by the Director func), the X-Forwarded-For header is not modified. 

To prevent IP spoofing, be sure to delete any pre-existing X-Forwarded-For header coming from the client or an untrusted proxy. 

#### <a id="NewSingleHostReverseProxy" href="#NewSingleHostReverseProxy">func NewSingleHostReverseProxy(target *url.URL) *ReverseProxy</a>

```
searchKey: httputil.NewSingleHostReverseProxy
tags: [method]
```

```Go
func NewSingleHostReverseProxy(target *url.URL) *ReverseProxy
```

NewSingleHostReverseProxy returns a new ReverseProxy that routes URLs to the scheme, host, and base path provided in target. If the target's path is "/base" and the incoming request was for "/dir", the target request will be for /base/dir. NewSingleHostReverseProxy does not rewrite the Host header. To rewrite Host headers, use ReverseProxy directly with a custom Director policy. 

#### <a id="ReverseProxy.ServeHTTP" href="#ReverseProxy.ServeHTTP">func (p *ReverseProxy) ServeHTTP(rw http.ResponseWriter, req *http.Request)</a>

```
searchKey: httputil.ReverseProxy.ServeHTTP
tags: [method]
```

```Go
func (p *ReverseProxy) ServeHTTP(rw http.ResponseWriter, req *http.Request)
```

#### <a id="ReverseProxy.copyBuffer" href="#ReverseProxy.copyBuffer">func (p *ReverseProxy) copyBuffer(dst io.Writer, src io.Reader, buf []byte) (int64, error)</a>

```
searchKey: httputil.ReverseProxy.copyBuffer
tags: [method private]
```

```Go
func (p *ReverseProxy) copyBuffer(dst io.Writer, src io.Reader, buf []byte) (int64, error)
```

copyBuffer returns any write errors or non-EOF read errors, and the amount of bytes written. 

#### <a id="ReverseProxy.copyResponse" href="#ReverseProxy.copyResponse">func (p *ReverseProxy) copyResponse(dst io.Writer, src io.Reader, flushInterval time.Duration) error</a>

```
searchKey: httputil.ReverseProxy.copyResponse
tags: [method private]
```

```Go
func (p *ReverseProxy) copyResponse(dst io.Writer, src io.Reader, flushInterval time.Duration) error
```

#### <a id="ReverseProxy.defaultErrorHandler" href="#ReverseProxy.defaultErrorHandler">func (p *ReverseProxy) defaultErrorHandler(rw http.ResponseWriter, req *http.Request, err error)</a>

```
searchKey: httputil.ReverseProxy.defaultErrorHandler
tags: [method private]
```

```Go
func (p *ReverseProxy) defaultErrorHandler(rw http.ResponseWriter, req *http.Request, err error)
```

#### <a id="ReverseProxy.flushInterval" href="#ReverseProxy.flushInterval">func (p *ReverseProxy) flushInterval(res *http.Response) time.Duration</a>

```
searchKey: httputil.ReverseProxy.flushInterval
tags: [method private]
```

```Go
func (p *ReverseProxy) flushInterval(res *http.Response) time.Duration
```

flushInterval returns the p.FlushInterval value, conditionally overriding its value for a specific request/response. 

#### <a id="ReverseProxy.getErrorHandler" href="#ReverseProxy.getErrorHandler">func (p *ReverseProxy) getErrorHandler() func(http.ResponseWriter, *http.Request, error)</a>

```
searchKey: httputil.ReverseProxy.getErrorHandler
tags: [function private]
```

```Go
func (p *ReverseProxy) getErrorHandler() func(http.ResponseWriter, *http.Request, error)
```

#### <a id="ReverseProxy.handleUpgradeResponse" href="#ReverseProxy.handleUpgradeResponse">func (p *ReverseProxy) handleUpgradeResponse(rw http.ResponseWriter, req *http.Request, res *http.Response)</a>

```
searchKey: httputil.ReverseProxy.handleUpgradeResponse
tags: [method private]
```

```Go
func (p *ReverseProxy) handleUpgradeResponse(rw http.ResponseWriter, req *http.Request, res *http.Response)
```

#### <a id="ReverseProxy.logf" href="#ReverseProxy.logf">func (p *ReverseProxy) logf(format string, args ...interface{})</a>

```
searchKey: httputil.ReverseProxy.logf
tags: [method private]
```

```Go
func (p *ReverseProxy) logf(format string, args ...interface{})
```

#### <a id="ReverseProxy.modifyResponse" href="#ReverseProxy.modifyResponse">func (p *ReverseProxy) modifyResponse(rw http.ResponseWriter, res *http.Response, req *http.Request) bool</a>

```
searchKey: httputil.ReverseProxy.modifyResponse
tags: [method private]
```

```Go
func (p *ReverseProxy) modifyResponse(rw http.ResponseWriter, res *http.Response, req *http.Request) bool
```

modifyResponse conditionally runs the optional ModifyResponse hook and reports whether the request should proceed. 

### <a id="RoundTripperFunc" href="#RoundTripperFunc">type RoundTripperFunc func(*net/http.Request) (*net/http.Response, error)</a>

```
searchKey: httputil.RoundTripperFunc
tags: [function private]
```

```Go
type RoundTripperFunc func(*http.Request) (*http.Response, error)
```

#### <a id="RoundTripperFunc.RoundTrip" href="#RoundTripperFunc.RoundTrip">func (fn RoundTripperFunc) RoundTrip(req *http.Request) (*http.Response, error)</a>

```
searchKey: httputil.RoundTripperFunc.RoundTrip
tags: [method private]
```

```Go
func (fn RoundTripperFunc) RoundTrip(req *http.Request) (*http.Response, error)
```

### <a id="ServerConn" href="#ServerConn">type ServerConn struct</a>

```
searchKey: httputil.ServerConn
tags: [struct]
```

```Go
type ServerConn struct {
	mu              sync.Mutex // read-write protects the following fields
	c               net.Conn
	r               *bufio.Reader
	re, we          error // read/write errors
	lastbody        io.ReadCloser
	nread, nwritten int
	pipereq         map[*http.Request]uint

	pipe textproto.Pipeline
}
```

ServerConn is an artifact of Go's early HTTP implementation. It is low-level, old, and unused by Go's current HTTP stack. We should have deleted it before Go 1. 

Deprecated: Use the Server in package net/http instead. 

#### <a id="NewServerConn" href="#NewServerConn">func NewServerConn(c net.Conn, r *bufio.Reader) *ServerConn</a>

```
searchKey: httputil.NewServerConn
tags: [method deprecated]
```

```Go
func NewServerConn(c net.Conn, r *bufio.Reader) *ServerConn
```

NewServerConn is an artifact of Go's early HTTP implementation. It is low-level, old, and unused by Go's current HTTP stack. We should have deleted it before Go 1. 

Deprecated: Use the Server in package net/http instead. 

#### <a id="ServerConn.Close" href="#ServerConn.Close">func (sc *ServerConn) Close() error</a>

```
searchKey: httputil.ServerConn.Close
tags: [function]
```

```Go
func (sc *ServerConn) Close() error
```

Close calls Hijack and then also closes the underlying connection. 

#### <a id="ServerConn.Hijack" href="#ServerConn.Hijack">func (sc *ServerConn) Hijack() (net.Conn, *bufio.Reader)</a>

```
searchKey: httputil.ServerConn.Hijack
tags: [function]
```

```Go
func (sc *ServerConn) Hijack() (net.Conn, *bufio.Reader)
```

Hijack detaches the ServerConn and returns the underlying connection as well as the read-side bufio which may have some left over data. Hijack may be called before Read has signaled the end of the keep-alive logic. The user should not call Hijack while Read or Write is in progress. 

#### <a id="ServerConn.Pending" href="#ServerConn.Pending">func (sc *ServerConn) Pending() int</a>

```
searchKey: httputil.ServerConn.Pending
tags: [function]
```

```Go
func (sc *ServerConn) Pending() int
```

Pending returns the number of unanswered requests that have been received on the connection. 

#### <a id="ServerConn.Read" href="#ServerConn.Read">func (sc *ServerConn) Read() (*http.Request, error)</a>

```
searchKey: httputil.ServerConn.Read
tags: [function]
```

```Go
func (sc *ServerConn) Read() (*http.Request, error)
```

Read returns the next request on the wire. An ErrPersistEOF is returned if it is gracefully determined that there are no more requests (e.g. after the first request on an HTTP/1.0 connection, or after a Connection:close on a HTTP/1.1 connection). 

#### <a id="ServerConn.Write" href="#ServerConn.Write">func (sc *ServerConn) Write(req *http.Request, resp *http.Response) error</a>

```
searchKey: httputil.ServerConn.Write
tags: [method]
```

```Go
func (sc *ServerConn) Write(req *http.Request, resp *http.Response) error
```

Write writes resp in response to req. To close the connection gracefully, set the Response.Close field to true. Write should be considered operational until it returns an error, regardless of any errors returned on the Read side. 

### <a id="bufferPool" href="#bufferPool">type bufferPool struct</a>

```
searchKey: httputil.bufferPool
tags: [struct private]
```

```Go
type bufferPool struct {
	get func() []byte
	put func([]byte)
}
```

#### <a id="bufferPool.Get" href="#bufferPool.Get">func (bp bufferPool) Get() []byte</a>

```
searchKey: httputil.bufferPool.Get
tags: [function private]
```

```Go
func (bp bufferPool) Get() []byte
```

#### <a id="bufferPool.Put" href="#bufferPool.Put">func (bp bufferPool) Put(v []byte)</a>

```
searchKey: httputil.bufferPool.Put
tags: [method private]
```

```Go
func (bp bufferPool) Put(v []byte)
```

### <a id="checkCloser" href="#checkCloser">type checkCloser struct</a>

```
searchKey: httputil.checkCloser
tags: [struct private]
```

```Go
type checkCloser struct {
	closed bool
}
```

#### <a id="checkCloser.Close" href="#checkCloser.Close">func (cc *checkCloser) Close() error</a>

```
searchKey: httputil.checkCloser.Close
tags: [function private]
```

```Go
func (cc *checkCloser) Close() error
```

#### <a id="checkCloser.Read" href="#checkCloser.Read">func (cc *checkCloser) Read(b []byte) (int, error)</a>

```
searchKey: httputil.checkCloser.Read
tags: [method private]
```

```Go
func (cc *checkCloser) Read(b []byte) (int, error)
```

### <a id="delegateReader" href="#delegateReader">type delegateReader struct</a>

```
searchKey: httputil.delegateReader
tags: [struct private]
```

```Go
type delegateReader struct {
	c   chan io.Reader
	err error     // only used if r is nil and c is closed.
	r   io.Reader // nil until received from c
}
```

delegateReader is a reader that delegates to another reader, once it arrives on a channel. 

#### <a id="delegateReader.Read" href="#delegateReader.Read">func (r *delegateReader) Read(p []byte) (int, error)</a>

```
searchKey: httputil.delegateReader.Read
tags: [method private]
```

```Go
func (r *delegateReader) Read(p []byte) (int, error)
```

### <a id="dumpConn" href="#dumpConn">type dumpConn struct</a>

```
searchKey: httputil.dumpConn
tags: [struct private]
```

```Go
type dumpConn struct {
	io.Writer
	io.Reader
}
```

dumpConn is a net.Conn which writes to Writer and reads from Reader 

#### <a id="dumpConn.Close" href="#dumpConn.Close">func (c *dumpConn) Close() error</a>

```
searchKey: httputil.dumpConn.Close
tags: [function private]
```

```Go
func (c *dumpConn) Close() error
```

#### <a id="dumpConn.LocalAddr" href="#dumpConn.LocalAddr">func (c *dumpConn) LocalAddr() net.Addr</a>

```
searchKey: httputil.dumpConn.LocalAddr
tags: [function private]
```

```Go
func (c *dumpConn) LocalAddr() net.Addr
```

#### <a id="dumpConn.RemoteAddr" href="#dumpConn.RemoteAddr">func (c *dumpConn) RemoteAddr() net.Addr</a>

```
searchKey: httputil.dumpConn.RemoteAddr
tags: [function private]
```

```Go
func (c *dumpConn) RemoteAddr() net.Addr
```

#### <a id="dumpConn.SetDeadline" href="#dumpConn.SetDeadline">func (c *dumpConn) SetDeadline(t time.Time) error</a>

```
searchKey: httputil.dumpConn.SetDeadline
tags: [method private]
```

```Go
func (c *dumpConn) SetDeadline(t time.Time) error
```

#### <a id="dumpConn.SetReadDeadline" href="#dumpConn.SetReadDeadline">func (c *dumpConn) SetReadDeadline(t time.Time) error</a>

```
searchKey: httputil.dumpConn.SetReadDeadline
tags: [method private]
```

```Go
func (c *dumpConn) SetReadDeadline(t time.Time) error
```

#### <a id="dumpConn.SetWriteDeadline" href="#dumpConn.SetWriteDeadline">func (c *dumpConn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: httputil.dumpConn.SetWriteDeadline
tags: [method private]
```

```Go
func (c *dumpConn) SetWriteDeadline(t time.Time) error
```

### <a id="dumpTest" href="#dumpTest">type dumpTest struct</a>

```
searchKey: httputil.dumpTest
tags: [struct private]
```

```Go
type dumpTest struct {
	// Either Req or GetReq can be set/nil but not both.
	Req    *http.Request
	GetReq func() *http.Request

	Body interface{} // optional []byte or func() io.ReadCloser to populate Req.Body

	WantDump    string
	WantDumpOut string
	MustError   bool // if true, the test is expected to throw an error
	NoBody      bool // if true, set DumpRequest{,Out} body to false
}
```

### <a id="eofReader" href="#eofReader">type eofReader struct{}</a>

```
searchKey: httputil.eofReader
tags: [struct private]
```

```Go
type eofReader struct{}
```

#### <a id="eofReader.Close" href="#eofReader.Close">func (n eofReader) Close() error</a>

```
searchKey: httputil.eofReader.Close
tags: [function private]
```

```Go
func (n eofReader) Close() error
```

#### <a id="eofReader.Read" href="#eofReader.Read">func (n eofReader) Read([]byte) (int, error)</a>

```
searchKey: httputil.eofReader.Read
tags: [method private]
```

```Go
func (n eofReader) Read([]byte) (int, error)
```

### <a id="failingRoundTripper" href="#failingRoundTripper">type failingRoundTripper struct{}</a>

```
searchKey: httputil.failingRoundTripper
tags: [struct private]
```

```Go
type failingRoundTripper struct{}
```

#### <a id="failingRoundTripper.RoundTrip" href="#failingRoundTripper.RoundTrip">func (failingRoundTripper) RoundTrip(*http.Request) (*http.Response, error)</a>

```
searchKey: httputil.failingRoundTripper.RoundTrip
tags: [method private]
```

```Go
func (failingRoundTripper) RoundTrip(*http.Request) (*http.Response, error)
```

### <a id="failureToReadBody" href="#failureToReadBody">type failureToReadBody struct{}</a>

```
searchKey: httputil.failureToReadBody
tags: [struct private]
```

```Go
type failureToReadBody struct{}
```

failureToReadBody is a io.ReadCloser that just returns errNoBody on Read. It's swapped in when we don't actually want to consume the body, but need a non-nil one, and want to distinguish the error from reading the dummy body. 

#### <a id="failureToReadBody.Close" href="#failureToReadBody.Close">func (failureToReadBody) Close() error</a>

```
searchKey: httputil.failureToReadBody.Close
tags: [function private]
```

```Go
func (failureToReadBody) Close() error
```

#### <a id="failureToReadBody.Read" href="#failureToReadBody.Read">func (failureToReadBody) Read([]byte) (int, error)</a>

```
searchKey: httputil.failureToReadBody.Read
tags: [method private]
```

```Go
func (failureToReadBody) Read([]byte) (int, error)
```

### <a id="maxLatencyWriter" href="#maxLatencyWriter">type maxLatencyWriter struct</a>

```
searchKey: httputil.maxLatencyWriter
tags: [struct private]
```

```Go
type maxLatencyWriter struct {
	dst     writeFlusher
	latency time.Duration // non-zero; negative means to flush immediately

	mu           sync.Mutex // protects t, flushPending, and dst.Flush
	t            *time.Timer
	flushPending bool
}
```

#### <a id="maxLatencyWriter.Write" href="#maxLatencyWriter.Write">func (m *maxLatencyWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: httputil.maxLatencyWriter.Write
tags: [method private]
```

```Go
func (m *maxLatencyWriter) Write(p []byte) (n int, err error)
```

#### <a id="maxLatencyWriter.delayedFlush" href="#maxLatencyWriter.delayedFlush">func (m *maxLatencyWriter) delayedFlush()</a>

```
searchKey: httputil.maxLatencyWriter.delayedFlush
tags: [function private]
```

```Go
func (m *maxLatencyWriter) delayedFlush()
```

#### <a id="maxLatencyWriter.stop" href="#maxLatencyWriter.stop">func (m *maxLatencyWriter) stop()</a>

```
searchKey: httputil.maxLatencyWriter.stop
tags: [function private]
```

```Go
func (m *maxLatencyWriter) stop()
```

### <a id="neverEnding" href="#neverEnding">type neverEnding byte</a>

```
searchKey: httputil.neverEnding
tags: [number private]
```

```Go
type neverEnding byte
```

#### <a id="neverEnding.Read" href="#neverEnding.Read">func (b neverEnding) Read(p []byte) (n int, err error)</a>

```
searchKey: httputil.neverEnding.Read
tags: [method private]
```

```Go
func (b neverEnding) Read(p []byte) (n int, err error)
```

### <a id="roundTripperFunc" href="#roundTripperFunc">type roundTripperFunc func(req *net/http.Request) (*net/http.Response, error)</a>

```
searchKey: httputil.roundTripperFunc
tags: [function private]
```

```Go
type roundTripperFunc func(req *http.Request) (*http.Response, error)
```

#### <a id="roundTripperFunc.RoundTrip" href="#roundTripperFunc.RoundTrip">func (fn roundTripperFunc) RoundTrip(req *http.Request) (*http.Response, error)</a>

```
searchKey: httputil.roundTripperFunc.RoundTrip
tags: [method private]
```

```Go
func (fn roundTripperFunc) RoundTrip(req *http.Request) (*http.Response, error)
```

### <a id="staticResponseRoundTripper" href="#staticResponseRoundTripper">type staticResponseRoundTripper struct</a>

```
searchKey: httputil.staticResponseRoundTripper
tags: [struct private]
```

```Go
type staticResponseRoundTripper struct{ res *http.Response }
```

#### <a id="staticResponseRoundTripper.RoundTrip" href="#staticResponseRoundTripper.RoundTrip">func (rt staticResponseRoundTripper) RoundTrip(*http.Request) (*http.Response, error)</a>

```
searchKey: httputil.staticResponseRoundTripper.RoundTrip
tags: [method private]
```

```Go
func (rt staticResponseRoundTripper) RoundTrip(*http.Request) (*http.Response, error)
```

### <a id="staticTransport" href="#staticTransport">type staticTransport struct</a>

```
searchKey: httputil.staticTransport
tags: [struct private]
```

```Go
type staticTransport struct {
	res *http.Response
}
```

#### <a id="staticTransport.RoundTrip" href="#staticTransport.RoundTrip">func (t *staticTransport) RoundTrip(r *http.Request) (*http.Response, error)</a>

```
searchKey: httputil.staticTransport.RoundTrip
tags: [method private]
```

```Go
func (t *staticTransport) RoundTrip(r *http.Request) (*http.Response, error)
```

### <a id="switchProtocolCopier" href="#switchProtocolCopier">type switchProtocolCopier struct</a>

```
searchKey: httputil.switchProtocolCopier
tags: [struct private]
```

```Go
type switchProtocolCopier struct {
	user, backend io.ReadWriter
}
```

switchProtocolCopier exists so goroutines proxying data back and forth have nice names in stacks. 

#### <a id="switchProtocolCopier.copyFromBackend" href="#switchProtocolCopier.copyFromBackend">func (c switchProtocolCopier) copyFromBackend(errc chan<- error)</a>

```
searchKey: httputil.switchProtocolCopier.copyFromBackend
tags: [method private]
```

```Go
func (c switchProtocolCopier) copyFromBackend(errc chan<- error)
```

#### <a id="switchProtocolCopier.copyToBackend" href="#switchProtocolCopier.copyToBackend">func (c switchProtocolCopier) copyToBackend(errc chan<- error)</a>

```
searchKey: httputil.switchProtocolCopier.copyToBackend
tags: [method private]
```

```Go
func (c switchProtocolCopier) copyToBackend(errc chan<- error)
```

### <a id="writeFlusher" href="#writeFlusher">type writeFlusher interface</a>

```
searchKey: httputil.writeFlusher
tags: [interface private]
```

```Go
type writeFlusher interface {
	io.Writer
	http.Flusher
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkServeHTTP" href="#BenchmarkServeHTTP">func BenchmarkServeHTTP(b *testing.B)</a>

```
searchKey: httputil.BenchmarkServeHTTP
tags: [method private benchmark]
```

```Go
func BenchmarkServeHTTP(b *testing.B)
```

### <a id="DumpRequest" href="#DumpRequest">func DumpRequest(req *http.Request, body bool) ([]byte, error)</a>

```
searchKey: httputil.DumpRequest
tags: [method]
```

```Go
func DumpRequest(req *http.Request, body bool) ([]byte, error)
```

DumpRequest returns the given request in its HTTP/1.x wire representation. It should only be used by servers to debug client requests. The returned representation is an approximation only; some details of the initial request are lost while parsing it into an http.Request. In particular, the order and case of header field names are lost. The order of values in multi-valued headers is kept intact. HTTP/2 requests are dumped in HTTP/1.x form, not in their original binary representations. 

If body is true, DumpRequest also returns the body. To do so, it consumes req.Body and then replaces it with a new io.ReadCloser that yields the same bytes. If DumpRequest returns an error, the state of req is undefined. 

The documentation for http.Request.Write details which fields of req are included in the dump. 

### <a id="DumpRequestOut" href="#DumpRequestOut">func DumpRequestOut(req *http.Request, body bool) ([]byte, error)</a>

```
searchKey: httputil.DumpRequestOut
tags: [method]
```

```Go
func DumpRequestOut(req *http.Request, body bool) ([]byte, error)
```

DumpRequestOut is like DumpRequest but for outgoing client requests. It includes any headers that the standard http.Transport adds, such as User-Agent. 

### <a id="DumpResponse" href="#DumpResponse">func DumpResponse(resp *http.Response, body bool) ([]byte, error)</a>

```
searchKey: httputil.DumpResponse
tags: [method]
```

```Go
func DumpResponse(resp *http.Response, body bool) ([]byte, error)
```

DumpResponse is like DumpRequest but dumps a response. 

### <a id="NewChunkedReader" href="#NewChunkedReader">func NewChunkedReader(r io.Reader) io.Reader</a>

```
searchKey: httputil.NewChunkedReader
tags: [method]
```

```Go
func NewChunkedReader(r io.Reader) io.Reader
```

NewChunkedReader returns a new chunkedReader that translates the data read from r out of HTTP "chunked" format before returning it. The chunkedReader returns io.EOF when the final 0-length chunk is read. 

NewChunkedReader is not needed by normal applications. The http package automatically decodes chunking when reading response bodies. 

### <a id="NewChunkedWriter" href="#NewChunkedWriter">func NewChunkedWriter(w io.Writer) io.WriteCloser</a>

```
searchKey: httputil.NewChunkedWriter
tags: [method]
```

```Go
func NewChunkedWriter(w io.Writer) io.WriteCloser
```

NewChunkedWriter returns a new chunkedWriter that translates writes into HTTP "chunked" format before writing them to w. Closing the returned chunkedWriter sends the final 0-length chunk that marks the end of the stream but does not send the final CRLF that appears after trailers; trailers and the last CRLF must be written separately. 

NewChunkedWriter is not needed by normal applications. The http package adds chunking automatically if handlers don't set a Content-Length header. Using NewChunkedWriter inside a handler would result in double chunking or chunking with a Content-Length length, both of which are wrong. 

### <a id="TestClonesRequestHeaders" href="#TestClonesRequestHeaders">func TestClonesRequestHeaders(t *testing.T)</a>

```
searchKey: httputil.TestClonesRequestHeaders
tags: [method private test]
```

```Go
func TestClonesRequestHeaders(t *testing.T)
```

Issue 18327: verify we always do a deep copy of the Request.Header map before any mutations. 

### <a id="TestDumpRequest" href="#TestDumpRequest">func TestDumpRequest(t *testing.T)</a>

```
searchKey: httputil.TestDumpRequest
tags: [method private test]
```

```Go
func TestDumpRequest(t *testing.T)
```

### <a id="TestDumpRequestOutIssue38352" href="#TestDumpRequestOutIssue38352">func TestDumpRequestOutIssue38352(t *testing.T)</a>

```
searchKey: httputil.TestDumpRequestOutIssue38352
tags: [method private test]
```

```Go
func TestDumpRequestOutIssue38352(t *testing.T)
```

Issue 38352: Check for deadlock on canceled requests. 

### <a id="TestDumpResponse" href="#TestDumpResponse">func TestDumpResponse(t *testing.T)</a>

```
searchKey: httputil.TestDumpResponse
tags: [method private test]
```

```Go
func TestDumpResponse(t *testing.T)
```

### <a id="TestJoinURLPath" href="#TestJoinURLPath">func TestJoinURLPath(t *testing.T)</a>

```
searchKey: httputil.TestJoinURLPath
tags: [method private test]
```

```Go
func TestJoinURLPath(t *testing.T)
```

### <a id="TestModifyResponseClosesBody" href="#TestModifyResponseClosesBody">func TestModifyResponseClosesBody(t *testing.T)</a>

```
searchKey: httputil.TestModifyResponseClosesBody
tags: [method private test]
```

```Go
func TestModifyResponseClosesBody(t *testing.T)
```

### <a id="TestNilBody" href="#TestNilBody">func TestNilBody(t *testing.T)</a>

```
searchKey: httputil.TestNilBody
tags: [method private test]
```

```Go
func TestNilBody(t *testing.T)
```

Issue 12344 

### <a id="TestReverseProxy" href="#TestReverseProxy">func TestReverseProxy(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxy
tags: [method private test]
```

```Go
func TestReverseProxy(t *testing.T)
```

### <a id="TestReverseProxyCancellation" href="#TestReverseProxyCancellation">func TestReverseProxyCancellation(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyCancellation
tags: [method private test]
```

```Go
func TestReverseProxyCancellation(t *testing.T)
```

### <a id="TestReverseProxyErrorHandler" href="#TestReverseProxyErrorHandler">func TestReverseProxyErrorHandler(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyErrorHandler
tags: [method private test]
```

```Go
func TestReverseProxyErrorHandler(t *testing.T)
```

### <a id="TestReverseProxyFlushInterval" href="#TestReverseProxyFlushInterval">func TestReverseProxyFlushInterval(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyFlushInterval
tags: [method private test]
```

```Go
func TestReverseProxyFlushInterval(t *testing.T)
```

### <a id="TestReverseProxyFlushIntervalHeaders" href="#TestReverseProxyFlushIntervalHeaders">func TestReverseProxyFlushIntervalHeaders(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyFlushIntervalHeaders
tags: [method private test]
```

```Go
func TestReverseProxyFlushIntervalHeaders(t *testing.T)
```

### <a id="TestReverseProxyGetPutBuffer" href="#TestReverseProxyGetPutBuffer">func TestReverseProxyGetPutBuffer(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyGetPutBuffer
tags: [method private test]
```

```Go
func TestReverseProxyGetPutBuffer(t *testing.T)
```

### <a id="TestReverseProxyModifyResponse" href="#TestReverseProxyModifyResponse">func TestReverseProxyModifyResponse(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyModifyResponse
tags: [method private test]
```

```Go
func TestReverseProxyModifyResponse(t *testing.T)
```

Issue 14237. Test ModifyResponse and that an error from it causes the proxy to return StatusBadGateway, or StatusOK otherwise. 

### <a id="TestReverseProxyQuery" href="#TestReverseProxyQuery">func TestReverseProxyQuery(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyQuery
tags: [method private test]
```

```Go
func TestReverseProxyQuery(t *testing.T)
```

### <a id="TestReverseProxyStripEmptyConnection" href="#TestReverseProxyStripEmptyConnection">func TestReverseProxyStripEmptyConnection(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyStripEmptyConnection
tags: [method private test]
```

```Go
func TestReverseProxyStripEmptyConnection(t *testing.T)
```

### <a id="TestReverseProxyStripHeadersPresentInConnection" href="#TestReverseProxyStripHeadersPresentInConnection">func TestReverseProxyStripHeadersPresentInConnection(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyStripHeadersPresentInConnection
tags: [method private test]
```

```Go
func TestReverseProxyStripHeadersPresentInConnection(t *testing.T)
```

Issue 16875: remove any proxied headers mentioned in the "Connection" header value. 

### <a id="TestReverseProxyWebSocket" href="#TestReverseProxyWebSocket">func TestReverseProxyWebSocket(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyWebSocket
tags: [method private test]
```

```Go
func TestReverseProxyWebSocket(t *testing.T)
```

### <a id="TestReverseProxyWebSocketCancellation" href="#TestReverseProxyWebSocketCancellation">func TestReverseProxyWebSocketCancellation(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxyWebSocketCancellation
tags: [method private test]
```

```Go
func TestReverseProxyWebSocketCancellation(t *testing.T)
```

### <a id="TestReverseProxy_AllocatedHeader" href="#TestReverseProxy_AllocatedHeader">func TestReverseProxy_AllocatedHeader(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxy_AllocatedHeader
tags: [method private test]
```

```Go
func TestReverseProxy_AllocatedHeader(t *testing.T)
```

Issue 33142: always allocate the request headers 

### <a id="TestReverseProxy_CopyBuffer" href="#TestReverseProxy_CopyBuffer">func TestReverseProxy_CopyBuffer(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxy_CopyBuffer
tags: [method private test]
```

```Go
func TestReverseProxy_CopyBuffer(t *testing.T)
```

Issue 16659: log errors from short read 

### <a id="TestReverseProxy_NilBody" href="#TestReverseProxy_NilBody">func TestReverseProxy_NilBody(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxy_NilBody
tags: [method private test]
```

```Go
func TestReverseProxy_NilBody(t *testing.T)
```

Issue 16036: send a Request with a nil Body when possible 

### <a id="TestReverseProxy_PanicBodyError" href="#TestReverseProxy_PanicBodyError">func TestReverseProxy_PanicBodyError(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxy_PanicBodyError
tags: [method private test]
```

```Go
func TestReverseProxy_PanicBodyError(t *testing.T)
```

Issue 23643: panic on body copy error 

### <a id="TestReverseProxy_Post" href="#TestReverseProxy_Post">func TestReverseProxy_Post(t *testing.T)</a>

```
searchKey: httputil.TestReverseProxy_Post
tags: [method private test]
```

```Go
func TestReverseProxy_Post(t *testing.T)
```

### <a id="TestSelectFlushInterval" href="#TestSelectFlushInterval">func TestSelectFlushInterval(t *testing.T)</a>

```
searchKey: httputil.TestSelectFlushInterval
tags: [method private test]
```

```Go
func TestSelectFlushInterval(t *testing.T)
```

### <a id="TestServeHTTPDeepCopy" href="#TestServeHTTPDeepCopy">func TestServeHTTPDeepCopy(t *testing.T)</a>

```
searchKey: httputil.TestServeHTTPDeepCopy
tags: [method private test]
```

```Go
func TestServeHTTPDeepCopy(t *testing.T)
```

### <a id="TestSingleJoinSlash" href="#TestSingleJoinSlash">func TestSingleJoinSlash(t *testing.T)</a>

```
searchKey: httputil.TestSingleJoinSlash
tags: [method private test]
```

```Go
func TestSingleJoinSlash(t *testing.T)
```

### <a id="TestUnannouncedTrailer" href="#TestUnannouncedTrailer">func TestUnannouncedTrailer(t *testing.T)</a>

```
searchKey: httputil.TestUnannouncedTrailer
tags: [method private test]
```

```Go
func TestUnannouncedTrailer(t *testing.T)
```

### <a id="TestUserAgentHeader" href="#TestUserAgentHeader">func TestUserAgentHeader(t *testing.T)</a>

```
searchKey: httputil.TestUserAgentHeader
tags: [method private test]
```

```Go
func TestUserAgentHeader(t *testing.T)
```

Issue 15524 

### <a id="TestXForwardedFor" href="#TestXForwardedFor">func TestXForwardedFor(t *testing.T)</a>

```
searchKey: httputil.TestXForwardedFor
tags: [method private test]
```

```Go
func TestXForwardedFor(t *testing.T)
```

### <a id="TestXForwardedFor_Omit" href="#TestXForwardedFor_Omit">func TestXForwardedFor_Omit(t *testing.T)</a>

```
searchKey: httputil.TestXForwardedFor_Omit
tags: [method private test]
```

```Go
func TestXForwardedFor_Omit(t *testing.T)
```

Issue 38079: don't append to X-Forwarded-For if it's present but nil 

### <a id="chunk" href="#chunk">func chunk(s string) string</a>

```
searchKey: httputil.chunk
tags: [method private]
```

```Go
func chunk(s string) string
```

### <a id="copyHeader" href="#copyHeader">func copyHeader(dst, src http.Header)</a>

```
searchKey: httputil.copyHeader
tags: [method private]
```

```Go
func copyHeader(dst, src http.Header)
```

### <a id="deadline" href="#deadline">func deadline(t *testing.T, defaultDelay, needed time.Duration) time.Time</a>

```
searchKey: httputil.deadline
tags: [method private]
```

```Go
func deadline(t *testing.T, defaultDelay, needed time.Duration) time.Time
```

deadline returns the time which is needed before t.Deadline() if one is configured and it is s greater than needed in the future, otherwise defaultDelay from the current time. 

### <a id="drainBody" href="#drainBody">func drainBody(b io.ReadCloser) (r1, r2 io.ReadCloser, err error)</a>

```
searchKey: httputil.drainBody
tags: [method private]
```

```Go
func drainBody(b io.ReadCloser) (r1, r2 io.ReadCloser, err error)
```

drainBody reads all of b to memory and then returns two equivalent ReadClosers yielding the same bytes. 

It returns an error if the initial slurp of all bytes fails. It does not attempt to make the returned ReadClosers have identical error-matching behavior. 

### <a id="init.reverseproxy_test.go" href="#init.reverseproxy_test.go">func init()</a>

```
searchKey: httputil.init
tags: [function private]
```

```Go
func init()
```

### <a id="joinURLPath" href="#joinURLPath">func joinURLPath(a, b *url.URL) (path, rawpath string)</a>

```
searchKey: httputil.joinURLPath
tags: [method private]
```

```Go
func joinURLPath(a, b *url.URL) (path, rawpath string)
```

### <a id="mustNewRequest" href="#mustNewRequest">func mustNewRequest(method, url string, body io.Reader) *http.Request</a>

```
searchKey: httputil.mustNewRequest
tags: [method private]
```

```Go
func mustNewRequest(method, url string, body io.Reader) *http.Request
```

### <a id="mustParseURL" href="#mustParseURL">func mustParseURL(s string) *url.URL</a>

```
searchKey: httputil.mustParseURL
tags: [method private]
```

```Go
func mustParseURL(s string) *url.URL
```

### <a id="mustReadRequest" href="#mustReadRequest">func mustReadRequest(s string) *http.Request</a>

```
searchKey: httputil.mustReadRequest
tags: [method private]
```

```Go
func mustReadRequest(s string) *http.Request
```

### <a id="outgoingLength" href="#outgoingLength">func outgoingLength(req *http.Request) int64</a>

```
searchKey: httputil.outgoingLength
tags: [method private]
```

```Go
func outgoingLength(req *http.Request) int64
```

outGoingLength is a copy of the unexported (*http.Request).outgoingLength method. 

### <a id="removeConnectionHeaders" href="#removeConnectionHeaders">func removeConnectionHeaders(h http.Header)</a>

```
searchKey: httputil.removeConnectionHeaders
tags: [method private]
```

```Go
func removeConnectionHeaders(h http.Header)
```

removeConnectionHeaders removes hop-by-hop headers listed in the "Connection" header of h. See RFC 7230, section 6.1 

### <a id="req" href="#req">func req(t *testing.T, v string) *http.Request</a>

```
searchKey: httputil.req
tags: [method private]
```

```Go
func req(t *testing.T, v string) *http.Request
```

### <a id="shouldPanicOnCopyError" href="#shouldPanicOnCopyError">func shouldPanicOnCopyError(req *http.Request) bool</a>

```
searchKey: httputil.shouldPanicOnCopyError
tags: [method private]
```

```Go
func shouldPanicOnCopyError(req *http.Request) bool
```

shouldPanicOnCopyError reports whether the reverse proxy should panic with http.ErrAbortHandler. This is the right thing to do by default, but Go 1.10 and earlier did not, so existing unit tests weren't expecting panics. Only panic in our own tests, or when running under the HTTP server. 

### <a id="singleJoiningSlash" href="#singleJoiningSlash">func singleJoiningSlash(a, b string) string</a>

```
searchKey: httputil.singleJoiningSlash
tags: [method private]
```

```Go
func singleJoiningSlash(a, b string) string
```

### <a id="upgradeType" href="#upgradeType">func upgradeType(h http.Header) string</a>

```
searchKey: httputil.upgradeType
tags: [method private]
```

```Go
func upgradeType(h http.Header) string
```

### <a id="valueOrDefault" href="#valueOrDefault">func valueOrDefault(value, def string) string</a>

```
searchKey: httputil.valueOrDefault
tags: [method private]
```

```Go
func valueOrDefault(value, def string) string
```

Return value if nonempty, def otherwise. 

