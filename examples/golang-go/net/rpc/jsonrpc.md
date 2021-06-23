# Package jsonrpc

Package jsonrpc implements a JSON-RPC 1.0 ClientCodec and ServerCodec for the rpc package. For JSON-RPC 2.0 support, see [https://godoc.org/?q=json-rpc+2.0](https://godoc.org/?q=json-rpc+2.0) 

## Index

* [Variables](#var)
    * [var errMissingParams](#errMissingParams)
    * [var null](#null)
* [Types](#type)
    * [type clientCodec struct](#clientCodec)
        * [func (c *clientCodec) WriteRequest(r *rpc.Request, param interface{}) error](#clientCodec.WriteRequest)
        * [func (c *clientCodec) ReadResponseHeader(r *rpc.Response) error](#clientCodec.ReadResponseHeader)
        * [func (c *clientCodec) ReadResponseBody(x interface{}) error](#clientCodec.ReadResponseBody)
        * [func (c *clientCodec) Close() error](#clientCodec.Close)
    * [type clientRequest struct](#clientRequest)
    * [type clientResponse struct](#clientResponse)
        * [func (r *clientResponse) reset()](#clientResponse.reset)
    * [type serverCodec struct](#serverCodec)
        * [func (c *serverCodec) ReadRequestHeader(r *rpc.Request) error](#serverCodec.ReadRequestHeader)
        * [func (c *serverCodec) ReadRequestBody(x interface{}) error](#serverCodec.ReadRequestBody)
        * [func (c *serverCodec) WriteResponse(r *rpc.Response, x interface{}) error](#serverCodec.WriteResponse)
        * [func (c *serverCodec) Close() error](#serverCodec.Close)
    * [type serverRequest struct](#serverRequest)
        * [func (r *serverRequest) reset()](#serverRequest.reset)
    * [type serverResponse struct](#serverResponse)
    * [type Args struct](#Args)
    * [type Reply struct](#Reply)
    * [type Arith int](#Arith)
        * [func (t *Arith) Add(args *Args, reply *Reply) error](#Arith.Add)
        * [func (t *Arith) Mul(args *Args, reply *Reply) error](#Arith.Mul)
        * [func (t *Arith) Div(args *Args, reply *Reply) error](#Arith.Div)
        * [func (t *Arith) Error(args *Args, reply *Reply) error](#Arith.Error)
    * [type ArithAddResp struct](#ArithAddResp)
    * [type BuiltinTypes struct{}](#BuiltinTypes)
        * [func (BuiltinTypes) Map(i int, reply *map[int]int) error](#BuiltinTypes.Map)
        * [func (BuiltinTypes) Slice(i int, reply *[]int) error](#BuiltinTypes.Slice)
        * [func (BuiltinTypes) Array(i int, reply *[1]int) error](#BuiltinTypes.Array)
    * [type pipe struct](#pipe)
        * [func (p *pipe) Close() error](#pipe.Close)
        * [func (p *pipe) LocalAddr() net.Addr](#pipe.LocalAddr)
        * [func (p *pipe) RemoteAddr() net.Addr](#pipe.RemoteAddr)
        * [func (p *pipe) SetTimeout(nsec int64) error](#pipe.SetTimeout)
        * [func (p *pipe) SetReadTimeout(nsec int64) error](#pipe.SetReadTimeout)
        * [func (p *pipe) SetWriteTimeout(nsec int64) error](#pipe.SetWriteTimeout)
    * [type pipeAddr int](#pipeAddr)
        * [func (pipeAddr) Network() string](#pipeAddr.Network)
        * [func (pipeAddr) String() string](#pipeAddr.String)
* [Functions](#func)
    * [func NewClientCodec(conn io.ReadWriteCloser) rpc.ClientCodec](#NewClientCodec)
    * [func NewClient(conn io.ReadWriteCloser) *rpc.Client](#NewClient)
    * [func Dial(network, address string) (*rpc.Client, error)](#Dial)
    * [func NewServerCodec(conn io.ReadWriteCloser) rpc.ServerCodec](#NewServerCodec)
    * [func ServeConn(conn io.ReadWriteCloser)](#ServeConn)
    * [func init()](#init.all_test.go)
    * [func TestServerNoParams(t *testing.T)](#TestServerNoParams)
    * [func TestServerEmptyMessage(t *testing.T)](#TestServerEmptyMessage)
    * [func TestServer(t *testing.T)](#TestServer)
    * [func TestClient(t *testing.T)](#TestClient)
    * [func TestBuiltinTypes(t *testing.T)](#TestBuiltinTypes)
    * [func TestMalformedInput(t *testing.T)](#TestMalformedInput)
    * [func TestMalformedOutput(t *testing.T)](#TestMalformedOutput)
    * [func TestServerErrorHasNullResult(t *testing.T)](#TestServerErrorHasNullResult)
    * [func TestUnexpectedError(t *testing.T)](#TestUnexpectedError)
    * [func myPipe() (*pipe, *pipe)](#myPipe)


## <a id="var" href="#var">Variables</a>

### <a id="errMissingParams" href="#errMissingParams">var errMissingParams</a>

```
searchKey: jsonrpc.errMissingParams
tags: [private]
```

```Go
var errMissingParams = errors.New("jsonrpc: request body missing params")
```

### <a id="null" href="#null">var null</a>

```
searchKey: jsonrpc.null
tags: [private]
```

```Go
var null = json.RawMessage([]byte("null"))
```

## <a id="type" href="#type">Types</a>

### <a id="clientCodec" href="#clientCodec">type clientCodec struct</a>

```
searchKey: jsonrpc.clientCodec
tags: [private]
```

```Go
type clientCodec struct {
	dec *json.Decoder // for reading JSON values
	enc *json.Encoder // for writing JSON values
	c   io.Closer

	// temporary work space
	req  clientRequest
	resp clientResponse

	// JSON-RPC responses include the request id but not the request method.
	// Package rpc expects both.
	// We save the request method in pending when sending a request
	// and then look it up by request ID when filling out the rpc Response.
	mutex   sync.Mutex        // protects pending
	pending map[uint64]string // map request id to method name
}
```

#### <a id="clientCodec.WriteRequest" href="#clientCodec.WriteRequest">func (c *clientCodec) WriteRequest(r *rpc.Request, param interface{}) error</a>

```
searchKey: jsonrpc.clientCodec.WriteRequest
tags: [private]
```

```Go
func (c *clientCodec) WriteRequest(r *rpc.Request, param interface{}) error
```

#### <a id="clientCodec.ReadResponseHeader" href="#clientCodec.ReadResponseHeader">func (c *clientCodec) ReadResponseHeader(r *rpc.Response) error</a>

```
searchKey: jsonrpc.clientCodec.ReadResponseHeader
tags: [private]
```

```Go
func (c *clientCodec) ReadResponseHeader(r *rpc.Response) error
```

#### <a id="clientCodec.ReadResponseBody" href="#clientCodec.ReadResponseBody">func (c *clientCodec) ReadResponseBody(x interface{}) error</a>

```
searchKey: jsonrpc.clientCodec.ReadResponseBody
tags: [private]
```

```Go
func (c *clientCodec) ReadResponseBody(x interface{}) error
```

#### <a id="clientCodec.Close" href="#clientCodec.Close">func (c *clientCodec) Close() error</a>

```
searchKey: jsonrpc.clientCodec.Close
tags: [private]
```

```Go
func (c *clientCodec) Close() error
```

### <a id="clientRequest" href="#clientRequest">type clientRequest struct</a>

```
searchKey: jsonrpc.clientRequest
tags: [private]
```

```Go
type clientRequest struct {
	Method string         `json:"method"`
	Params [1]interface{} `json:"params"`
	Id     uint64         `json:"id"`
}
```

### <a id="clientResponse" href="#clientResponse">type clientResponse struct</a>

```
searchKey: jsonrpc.clientResponse
tags: [private]
```

```Go
type clientResponse struct {
	Id     uint64           `json:"id"`
	Result *json.RawMessage `json:"result"`
	Error  interface{}      `json:"error"`
}
```

#### <a id="clientResponse.reset" href="#clientResponse.reset">func (r *clientResponse) reset()</a>

```
searchKey: jsonrpc.clientResponse.reset
tags: [private]
```

```Go
func (r *clientResponse) reset()
```

### <a id="serverCodec" href="#serverCodec">type serverCodec struct</a>

```
searchKey: jsonrpc.serverCodec
tags: [private]
```

```Go
type serverCodec struct {
	dec *json.Decoder // for reading JSON values
	enc *json.Encoder // for writing JSON values
	c   io.Closer

	// temporary work space
	req serverRequest

	// JSON-RPC clients can use arbitrary json values as request IDs.
	// Package rpc expects uint64 request IDs.
	// We assign uint64 sequence numbers to incoming requests
	// but save the original request ID in the pending map.
	// When rpc responds, we use the sequence number in
	// the response to find the original request ID.
	mutex   sync.Mutex // protects seq, pending
	seq     uint64
	pending map[uint64]*json.RawMessage
}
```

#### <a id="serverCodec.ReadRequestHeader" href="#serverCodec.ReadRequestHeader">func (c *serverCodec) ReadRequestHeader(r *rpc.Request) error</a>

```
searchKey: jsonrpc.serverCodec.ReadRequestHeader
tags: [private]
```

```Go
func (c *serverCodec) ReadRequestHeader(r *rpc.Request) error
```

#### <a id="serverCodec.ReadRequestBody" href="#serverCodec.ReadRequestBody">func (c *serverCodec) ReadRequestBody(x interface{}) error</a>

```
searchKey: jsonrpc.serverCodec.ReadRequestBody
tags: [private]
```

```Go
func (c *serverCodec) ReadRequestBody(x interface{}) error
```

#### <a id="serverCodec.WriteResponse" href="#serverCodec.WriteResponse">func (c *serverCodec) WriteResponse(r *rpc.Response, x interface{}) error</a>

```
searchKey: jsonrpc.serverCodec.WriteResponse
tags: [private]
```

```Go
func (c *serverCodec) WriteResponse(r *rpc.Response, x interface{}) error
```

#### <a id="serverCodec.Close" href="#serverCodec.Close">func (c *serverCodec) Close() error</a>

```
searchKey: jsonrpc.serverCodec.Close
tags: [private]
```

```Go
func (c *serverCodec) Close() error
```

### <a id="serverRequest" href="#serverRequest">type serverRequest struct</a>

```
searchKey: jsonrpc.serverRequest
tags: [private]
```

```Go
type serverRequest struct {
	Method string           `json:"method"`
	Params *json.RawMessage `json:"params"`
	Id     *json.RawMessage `json:"id"`
}
```

#### <a id="serverRequest.reset" href="#serverRequest.reset">func (r *serverRequest) reset()</a>

```
searchKey: jsonrpc.serverRequest.reset
tags: [private]
```

```Go
func (r *serverRequest) reset()
```

### <a id="serverResponse" href="#serverResponse">type serverResponse struct</a>

```
searchKey: jsonrpc.serverResponse
tags: [private]
```

```Go
type serverResponse struct {
	Id     *json.RawMessage `json:"id"`
	Result interface{}      `json:"result"`
	Error  interface{}      `json:"error"`
}
```

### <a id="Args" href="#Args">type Args struct</a>

```
searchKey: jsonrpc.Args
tags: [private]
```

```Go
type Args struct {
	A, B int
}
```

### <a id="Reply" href="#Reply">type Reply struct</a>

```
searchKey: jsonrpc.Reply
tags: [private]
```

```Go
type Reply struct {
	C int
}
```

### <a id="Arith" href="#Arith">type Arith int</a>

```
searchKey: jsonrpc.Arith
tags: [private]
```

```Go
type Arith int
```

#### <a id="Arith.Add" href="#Arith.Add">func (t *Arith) Add(args *Args, reply *Reply) error</a>

```
searchKey: jsonrpc.Arith.Add
tags: [private]
```

```Go
func (t *Arith) Add(args *Args, reply *Reply) error
```

#### <a id="Arith.Mul" href="#Arith.Mul">func (t *Arith) Mul(args *Args, reply *Reply) error</a>

```
searchKey: jsonrpc.Arith.Mul
tags: [private]
```

```Go
func (t *Arith) Mul(args *Args, reply *Reply) error
```

#### <a id="Arith.Div" href="#Arith.Div">func (t *Arith) Div(args *Args, reply *Reply) error</a>

```
searchKey: jsonrpc.Arith.Div
tags: [private]
```

```Go
func (t *Arith) Div(args *Args, reply *Reply) error
```

#### <a id="Arith.Error" href="#Arith.Error">func (t *Arith) Error(args *Args, reply *Reply) error</a>

```
searchKey: jsonrpc.Arith.Error
tags: [private]
```

```Go
func (t *Arith) Error(args *Args, reply *Reply) error
```

### <a id="ArithAddResp" href="#ArithAddResp">type ArithAddResp struct</a>

```
searchKey: jsonrpc.ArithAddResp
tags: [private]
```

```Go
type ArithAddResp struct {
	Id     interface{} `json:"id"`
	Result Reply       `json:"result"`
	Error  interface{} `json:"error"`
}
```

### <a id="BuiltinTypes" href="#BuiltinTypes">type BuiltinTypes struct{}</a>

```
searchKey: jsonrpc.BuiltinTypes
tags: [private]
```

```Go
type BuiltinTypes struct{}
```

#### <a id="BuiltinTypes.Map" href="#BuiltinTypes.Map">func (BuiltinTypes) Map(i int, reply *map[int]int) error</a>

```
searchKey: jsonrpc.BuiltinTypes.Map
tags: [private]
```

```Go
func (BuiltinTypes) Map(i int, reply *map[int]int) error
```

#### <a id="BuiltinTypes.Slice" href="#BuiltinTypes.Slice">func (BuiltinTypes) Slice(i int, reply *[]int) error</a>

```
searchKey: jsonrpc.BuiltinTypes.Slice
tags: [private]
```

```Go
func (BuiltinTypes) Slice(i int, reply *[]int) error
```

#### <a id="BuiltinTypes.Array" href="#BuiltinTypes.Array">func (BuiltinTypes) Array(i int, reply *[1]int) error</a>

```
searchKey: jsonrpc.BuiltinTypes.Array
tags: [private]
```

```Go
func (BuiltinTypes) Array(i int, reply *[1]int) error
```

### <a id="pipe" href="#pipe">type pipe struct</a>

```
searchKey: jsonrpc.pipe
tags: [private]
```

```Go
type pipe struct {
	*io.PipeReader
	*io.PipeWriter
}
```

#### <a id="pipe.Close" href="#pipe.Close">func (p *pipe) Close() error</a>

```
searchKey: jsonrpc.pipe.Close
tags: [private]
```

```Go
func (p *pipe) Close() error
```

#### <a id="pipe.LocalAddr" href="#pipe.LocalAddr">func (p *pipe) LocalAddr() net.Addr</a>

```
searchKey: jsonrpc.pipe.LocalAddr
tags: [private]
```

```Go
func (p *pipe) LocalAddr() net.Addr
```

#### <a id="pipe.RemoteAddr" href="#pipe.RemoteAddr">func (p *pipe) RemoteAddr() net.Addr</a>

```
searchKey: jsonrpc.pipe.RemoteAddr
tags: [private]
```

```Go
func (p *pipe) RemoteAddr() net.Addr
```

#### <a id="pipe.SetTimeout" href="#pipe.SetTimeout">func (p *pipe) SetTimeout(nsec int64) error</a>

```
searchKey: jsonrpc.pipe.SetTimeout
tags: [private]
```

```Go
func (p *pipe) SetTimeout(nsec int64) error
```

#### <a id="pipe.SetReadTimeout" href="#pipe.SetReadTimeout">func (p *pipe) SetReadTimeout(nsec int64) error</a>

```
searchKey: jsonrpc.pipe.SetReadTimeout
tags: [private]
```

```Go
func (p *pipe) SetReadTimeout(nsec int64) error
```

#### <a id="pipe.SetWriteTimeout" href="#pipe.SetWriteTimeout">func (p *pipe) SetWriteTimeout(nsec int64) error</a>

```
searchKey: jsonrpc.pipe.SetWriteTimeout
tags: [private]
```

```Go
func (p *pipe) SetWriteTimeout(nsec int64) error
```

### <a id="pipeAddr" href="#pipeAddr">type pipeAddr int</a>

```
searchKey: jsonrpc.pipeAddr
tags: [private]
```

```Go
type pipeAddr int
```

#### <a id="pipeAddr.Network" href="#pipeAddr.Network">func (pipeAddr) Network() string</a>

```
searchKey: jsonrpc.pipeAddr.Network
tags: [private]
```

```Go
func (pipeAddr) Network() string
```

#### <a id="pipeAddr.String" href="#pipeAddr.String">func (pipeAddr) String() string</a>

```
searchKey: jsonrpc.pipeAddr.String
tags: [private]
```

```Go
func (pipeAddr) String() string
```

## <a id="func" href="#func">Functions</a>

### <a id="NewClientCodec" href="#NewClientCodec">func NewClientCodec(conn io.ReadWriteCloser) rpc.ClientCodec</a>

```
searchKey: jsonrpc.NewClientCodec
```

```Go
func NewClientCodec(conn io.ReadWriteCloser) rpc.ClientCodec
```

NewClientCodec returns a new rpc.ClientCodec using JSON-RPC on conn. 

### <a id="NewClient" href="#NewClient">func NewClient(conn io.ReadWriteCloser) *rpc.Client</a>

```
searchKey: jsonrpc.NewClient
```

```Go
func NewClient(conn io.ReadWriteCloser) *rpc.Client
```

NewClient returns a new rpc.Client to handle requests to the set of services at the other end of the connection. 

### <a id="Dial" href="#Dial">func Dial(network, address string) (*rpc.Client, error)</a>

```
searchKey: jsonrpc.Dial
```

```Go
func Dial(network, address string) (*rpc.Client, error)
```

Dial connects to a JSON-RPC server at the specified network address. 

### <a id="NewServerCodec" href="#NewServerCodec">func NewServerCodec(conn io.ReadWriteCloser) rpc.ServerCodec</a>

```
searchKey: jsonrpc.NewServerCodec
```

```Go
func NewServerCodec(conn io.ReadWriteCloser) rpc.ServerCodec
```

NewServerCodec returns a new rpc.ServerCodec using JSON-RPC on conn. 

### <a id="ServeConn" href="#ServeConn">func ServeConn(conn io.ReadWriteCloser)</a>

```
searchKey: jsonrpc.ServeConn
```

```Go
func ServeConn(conn io.ReadWriteCloser)
```

ServeConn runs the JSON-RPC server on a single connection. ServeConn blocks, serving the connection until the client hangs up. The caller typically invokes ServeConn in a go statement. 

### <a id="init.all_test.go" href="#init.all_test.go">func init()</a>

```
searchKey: jsonrpc.init
tags: [private]
```

```Go
func init()
```

### <a id="TestServerNoParams" href="#TestServerNoParams">func TestServerNoParams(t *testing.T)</a>

```
searchKey: jsonrpc.TestServerNoParams
tags: [private]
```

```Go
func TestServerNoParams(t *testing.T)
```

### <a id="TestServerEmptyMessage" href="#TestServerEmptyMessage">func TestServerEmptyMessage(t *testing.T)</a>

```
searchKey: jsonrpc.TestServerEmptyMessage
tags: [private]
```

```Go
func TestServerEmptyMessage(t *testing.T)
```

### <a id="TestServer" href="#TestServer">func TestServer(t *testing.T)</a>

```
searchKey: jsonrpc.TestServer
tags: [private]
```

```Go
func TestServer(t *testing.T)
```

### <a id="TestClient" href="#TestClient">func TestClient(t *testing.T)</a>

```
searchKey: jsonrpc.TestClient
tags: [private]
```

```Go
func TestClient(t *testing.T)
```

### <a id="TestBuiltinTypes" href="#TestBuiltinTypes">func TestBuiltinTypes(t *testing.T)</a>

```
searchKey: jsonrpc.TestBuiltinTypes
tags: [private]
```

```Go
func TestBuiltinTypes(t *testing.T)
```

### <a id="TestMalformedInput" href="#TestMalformedInput">func TestMalformedInput(t *testing.T)</a>

```
searchKey: jsonrpc.TestMalformedInput
tags: [private]
```

```Go
func TestMalformedInput(t *testing.T)
```

### <a id="TestMalformedOutput" href="#TestMalformedOutput">func TestMalformedOutput(t *testing.T)</a>

```
searchKey: jsonrpc.TestMalformedOutput
tags: [private]
```

```Go
func TestMalformedOutput(t *testing.T)
```

### <a id="TestServerErrorHasNullResult" href="#TestServerErrorHasNullResult">func TestServerErrorHasNullResult(t *testing.T)</a>

```
searchKey: jsonrpc.TestServerErrorHasNullResult
tags: [private]
```

```Go
func TestServerErrorHasNullResult(t *testing.T)
```

### <a id="TestUnexpectedError" href="#TestUnexpectedError">func TestUnexpectedError(t *testing.T)</a>

```
searchKey: jsonrpc.TestUnexpectedError
tags: [private]
```

```Go
func TestUnexpectedError(t *testing.T)
```

### <a id="myPipe" href="#myPipe">func myPipe() (*pipe, *pipe)</a>

```
searchKey: jsonrpc.myPipe
tags: [private]
```

```Go
func myPipe() (*pipe, *pipe)
```

Copied from package net. 

