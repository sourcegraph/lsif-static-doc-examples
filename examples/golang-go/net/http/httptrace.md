# Package httptrace

Package httptrace provides mechanisms to trace the events within HTTP client requests. 

## Index

* [Types](#type)
    * [type clientEventContextKey struct{}](#clientEventContextKey)
    * [type ClientTrace struct](#ClientTrace)
        * [func ContextClientTrace(ctx context.Context) *ClientTrace](#ContextClientTrace)
        * [func (t *ClientTrace) compose(old *ClientTrace)](#ClientTrace.compose)
        * [func (t *ClientTrace) hasNetHooks() bool](#ClientTrace.hasNetHooks)
    * [type WroteRequestInfo struct](#WroteRequestInfo)
    * [type DNSStartInfo struct](#DNSStartInfo)
    * [type DNSDoneInfo struct](#DNSDoneInfo)
    * [type GotConnInfo struct](#GotConnInfo)
* [Functions](#func)
    * [func WithClientTrace(ctx context.Context, trace *ClientTrace) context.Context](#WithClientTrace)
    * [func TestWithClientTrace(t *testing.T)](#TestWithClientTrace)
    * [func TestCompose(t *testing.T)](#TestCompose)


## <a id="type" href="#type">Types</a>

### <a id="clientEventContextKey" href="#clientEventContextKey">type clientEventContextKey struct{}</a>

```
searchKey: httptrace.clientEventContextKey
tags: [private]
```

```Go
type clientEventContextKey struct{}
```

unique type to prevent assignment. 

### <a id="ClientTrace" href="#ClientTrace">type ClientTrace struct</a>

```
searchKey: httptrace.ClientTrace
```

```Go
type ClientTrace struct {
	// GetConn is called before a connection is created or
	// retrieved from an idle pool. The hostPort is the
	// "host:port" of the target or proxy. GetConn is called even
	// if there's already an idle cached connection available.
	GetConn func(hostPort string)

	// GotConn is called after a successful connection is
	// obtained. There is no hook for failure to obtain a
	// connection; instead, use the error from
	// Transport.RoundTrip.
	GotConn func(GotConnInfo)

	// PutIdleConn is called when the connection is returned to
	// the idle pool. If err is nil, the connection was
	// successfully returned to the idle pool. If err is non-nil,
	// it describes why not. PutIdleConn is not called if
	// connection reuse is disabled via Transport.DisableKeepAlives.
	// PutIdleConn is called before the caller's Response.Body.Close
	// call returns.
	// For HTTP/2, this hook is not currently used.
	PutIdleConn func(err error)

	// GotFirstResponseByte is called when the first byte of the response
	// headers is available.
	GotFirstResponseByte func()

	// Got100Continue is called if the server replies with a "100
	// Continue" response.
	Got100Continue func()

	// Got1xxResponse is called for each 1xx informational response header
	// returned before the final non-1xx response. Got1xxResponse is called
	// for "100 Continue" responses, even if Got100Continue is also defined.
	// If it returns an error, the client request is aborted with that error value.
	Got1xxResponse func(code int, header textproto.MIMEHeader) error

	// DNSStart is called when a DNS lookup begins.
	DNSStart func(DNSStartInfo)

	// DNSDone is called when a DNS lookup ends.
	DNSDone func(DNSDoneInfo)

	// ConnectStart is called when a new connection's Dial begins.
	// If net.Dialer.DualStack (IPv6 "Happy Eyeballs") support is
	// enabled, this may be called multiple times.
	ConnectStart func(network, addr string)

	// ConnectDone is called when a new connection's Dial
	// completes. The provided err indicates whether the
	// connection completed successfully.
	// If net.Dialer.DualStack ("Happy Eyeballs") support is
	// enabled, this may be called multiple times.
	ConnectDone func(network, addr string, err error)

	// TLSHandshakeStart is called when the TLS handshake is started. When
	// connecting to an HTTPS site via an HTTP proxy, the handshake happens
	// after the CONNECT request is processed by the proxy.
	TLSHandshakeStart func()

	// TLSHandshakeDone is called after the TLS handshake with either the
	// successful handshake's connection state, or a non-nil error on handshake
	// failure.
	TLSHandshakeDone func(tls.ConnectionState, error)

	// WroteHeaderField is called after the Transport has written
	// each request header. At the time of this call the values
	// might be buffered and not yet written to the network.
	WroteHeaderField func(key string, value []string)

	// WroteHeaders is called after the Transport has written
	// all request headers.
	WroteHeaders func()

	// Wait100Continue is called if the Request specified
	// "Expect: 100-continue" and the Transport has written the
	// request headers but is waiting for "100 Continue" from the
	// server before writing the request body.
	Wait100Continue func()

	// WroteRequest is called with the result of writing the
	// request and any body. It may be called multiple times
	// in the case of retried requests.
	WroteRequest func(WroteRequestInfo)
}
```

ClientTrace is a set of hooks to run at various stages of an outgoing HTTP request. Any particular hook may be nil. Functions may be called concurrently from different goroutines and some may be called after the request has completed or failed. 

ClientTrace currently traces a single HTTP request & response during a single round trip and has no hooks that span a series of redirected requests. 

See [https://blog.golang.org/http-tracing](https://blog.golang.org/http-tracing) for more. 

#### <a id="ContextClientTrace" href="#ContextClientTrace">func ContextClientTrace(ctx context.Context) *ClientTrace</a>

```
searchKey: httptrace.ContextClientTrace
```

```Go
func ContextClientTrace(ctx context.Context) *ClientTrace
```

ContextClientTrace returns the ClientTrace associated with the provided context. If none, it returns nil. 

#### <a id="ClientTrace.compose" href="#ClientTrace.compose">func (t *ClientTrace) compose(old *ClientTrace)</a>

```
searchKey: httptrace.ClientTrace.compose
tags: [private]
```

```Go
func (t *ClientTrace) compose(old *ClientTrace)
```

compose modifies t such that it respects the previously-registered hooks in old, subject to the composition policy requested in t.Compose. 

#### <a id="ClientTrace.hasNetHooks" href="#ClientTrace.hasNetHooks">func (t *ClientTrace) hasNetHooks() bool</a>

```
searchKey: httptrace.ClientTrace.hasNetHooks
tags: [private]
```

```Go
func (t *ClientTrace) hasNetHooks() bool
```

### <a id="WroteRequestInfo" href="#WroteRequestInfo">type WroteRequestInfo struct</a>

```
searchKey: httptrace.WroteRequestInfo
```

```Go
type WroteRequestInfo struct {
	// Err is any error encountered while writing the Request.
	Err error
}
```

WroteRequestInfo contains information provided to the WroteRequest hook. 

### <a id="DNSStartInfo" href="#DNSStartInfo">type DNSStartInfo struct</a>

```
searchKey: httptrace.DNSStartInfo
```

```Go
type DNSStartInfo struct {
	Host string
}
```

DNSStartInfo contains information about a DNS request. 

### <a id="DNSDoneInfo" href="#DNSDoneInfo">type DNSDoneInfo struct</a>

```
searchKey: httptrace.DNSDoneInfo
```

```Go
type DNSDoneInfo struct {
	// Addrs are the IPv4 and/or IPv6 addresses found in the DNS
	// lookup. The contents of the slice should not be mutated.
	Addrs []net.IPAddr

	// Err is any error that occurred during the DNS lookup.
	Err error

	// Coalesced is whether the Addrs were shared with another
	// caller who was doing the same DNS lookup concurrently.
	Coalesced bool
}
```

DNSDoneInfo contains information about the results of a DNS lookup. 

### <a id="GotConnInfo" href="#GotConnInfo">type GotConnInfo struct</a>

```
searchKey: httptrace.GotConnInfo
```

```Go
type GotConnInfo struct {
	// Conn is the connection that was obtained. It is owned by
	// the http.Transport and should not be read, written or
	// closed by users of ClientTrace.
	Conn net.Conn

	// Reused is whether this connection has been previously
	// used for another HTTP request.
	Reused bool

	// WasIdle is whether this connection was obtained from an
	// idle pool.
	WasIdle bool

	// IdleTime reports how long the connection was previously
	// idle, if WasIdle is true.
	IdleTime time.Duration
}
```

GotConnInfo is the argument to the ClientTrace.GotConn function and contains information about the obtained connection. 

## <a id="func" href="#func">Functions</a>

### <a id="WithClientTrace" href="#WithClientTrace">func WithClientTrace(ctx context.Context, trace *ClientTrace) context.Context</a>

```
searchKey: httptrace.WithClientTrace
```

```Go
func WithClientTrace(ctx context.Context, trace *ClientTrace) context.Context
```

WithClientTrace returns a new context based on the provided parent ctx. HTTP client requests made with the returned context will use the provided trace hooks, in addition to any previous hooks registered with ctx. Any hooks defined in the provided trace will be called first. 

### <a id="TestWithClientTrace" href="#TestWithClientTrace">func TestWithClientTrace(t *testing.T)</a>

```
searchKey: httptrace.TestWithClientTrace
tags: [private]
```

```Go
func TestWithClientTrace(t *testing.T)
```

### <a id="TestCompose" href="#TestCompose">func TestCompose(t *testing.T)</a>

```
searchKey: httptrace.TestCompose
tags: [private]
```

```Go
func TestCompose(t *testing.T)
```

