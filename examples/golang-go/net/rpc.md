# Package rpc

Package rpc provides access to the exported methods of an object across a network or other I/O connection.  A server registers an object, making it visible as a service with the name of the type of the object.  After registration, exported methods of the object will be accessible remotely.  A server may register multiple objects (services) of different types but it is an error to register multiple objects of the same type. 

Only methods that satisfy these criteria will be made available for remote access; other methods will be ignored: 

```
- the method's type is exported.
- the method is exported.
- the method has two arguments, both exported (or builtin) types.
- the method's second argument is a pointer.
- the method has return type error.

```
In effect, the method must look schematically like 

```
func (t *T) MethodName(argType T1, replyType *T2) error

```
where T1 and T2 can be marshaled by encoding/gob. These requirements apply even if a different codec is used. (In the future, these requirements may soften for custom codecs.) 

The method's first argument represents the arguments provided by the caller; the second argument represents the result parameters to be returned to the caller. The method's return value, if non-nil, is passed back as a string that the client sees as if created by errors.New.  If an error is returned, the reply parameter will not be sent back to the client. 

The server may handle requests on a single connection by calling ServeConn.  More typically it will create a network listener and call Accept or, for an HTTP listener, HandleHTTP and http.Serve. 

A client wishing to use the service establishes a connection and then invokes NewClient on the connection.  The convenience function Dial (DialHTTP) performs both steps for a raw network connection (an HTTP connection).  The resulting Client object has two methods, Call and Go, that specify the service and method to call, a pointer containing the arguments, and a pointer to receive the result parameters. 

The Call method waits for the remote call to complete while the Go method launches the call asynchronously and signals completion using the Call structure's Done channel. 

Unless an explicit codec is set up, package encoding/gob is used to transport the data. 

Here is a simple example.  A server wishes to export an object of type Arith: 

```
package server

import "errors"

type Args struct {
	A, B int
}

type Quotient struct {
	Quo, Rem int
}

type Arith int

func (t *Arith) Multiply(args *Args, reply *int) error {
	*reply = args.A * args.B
	return nil
}

func (t *Arith) Divide(args *Args, quo *Quotient) error {
	if args.B == 0 {
		return errors.New("divide by zero")
	}
	quo.Quo = args.A / args.B
	quo.Rem = args.A % args.B
	return nil
}

```
The server calls (for HTTP service): 

```
arith := new(Arith)
rpc.Register(arith)
rpc.HandleHTTP()
l, e := net.Listen("tcp", ":1234")
if e != nil {
	log.Fatal("listen error:", e)
}
go http.Serve(l, nil)

```
At this point, clients can see a service "Arith" with methods "Arith.Multiply" and "Arith.Divide".  To invoke one, a client first dials the server: 

```
client, err := rpc.DialHTTP("tcp", serverAddress + ":1234")
if err != nil {
	log.Fatal("dialing:", err)
}

```
Then it can make a remote call: 

```
// Synchronous call
args := &server.Args{7,8}
var reply int
err = client.Call("Arith.Multiply", args, &reply)
if err != nil {
	log.Fatal("arith error:", err)
}
fmt.Printf("Arith: %d*%d=%d", args.A, args.B, reply)

```
or 

```
// Asynchronous call
quotient := new(Quotient)
divCall := client.Go("Arith.Divide", args, quotient, nil)
replyCall := <-divCall.Done	// will be equal to divCall
// check errors, print, etc.

```
A server implementation will often provide a simple, type-safe wrapper for the client. 

The net/rpc package is frozen and is not accepting new features. 

## Index

* Subpages
  * [net/rpc/jsonrpc](rpc/jsonrpc.md)
* [Constants](#const)
    * [const debugText](#debugText)
    * [const DefaultRPCPath](#DefaultRPCPath)
    * [const DefaultDebugPath](#DefaultDebugPath)
    * [const newHttpPath](#newHttpPath)
* [Variables](#var)
    * [var ErrShutdown](#ErrShutdown)
    * [var debug](#debug)
    * [var debugLog](#debugLog)
    * [var typeOfError](#typeOfError)
    * [var DefaultServer](#DefaultServer)
    * [var invalidRequest](#invalidRequest)
    * [var connected](#connected)
    * [var newServer](#newServer)
    * [var serverAddr](#serverAddr)
    * [var newServerAddr](#newServerAddr)
    * [var httpServerAddr](#httpServerAddr)
    * [var once](#once)
    * [var newOnce](#newOnce)
    * [var httpOnce](#httpOnce)
* [Types](#type)
    * [type ServerError string](#ServerError)
        * [func (e ServerError) Error() string](#ServerError.Error)
    * [type Call struct](#Call)
        * [func (call *Call) done()](#Call.done)
    * [type Client struct](#Client)
        * [func NewClient(conn io.ReadWriteCloser) *Client](#NewClient)
        * [func NewClientWithCodec(codec ClientCodec) *Client](#NewClientWithCodec)
        * [func DialHTTP(network, address string) (*Client, error)](#DialHTTP)
        * [func DialHTTPPath(network, address, path string) (*Client, error)](#DialHTTPPath)
        * [func Dial(network, address string) (*Client, error)](#Dial)
        * [func dialDirect() (*Client, error)](#dialDirect)
        * [func dialHTTP() (*Client, error)](#dialHTTP)
        * [func (client *Client) send(call *Call)](#Client.send)
        * [func (client *Client) input()](#Client.input)
        * [func (client *Client) Close() error](#Client.Close)
        * [func (client *Client) Go(serviceMethod string, args interface{}, reply interface{}, done chan *Call) *Call](#Client.Go)
        * [func (client *Client) Call(serviceMethod string, args interface{}, reply interface{}) error](#Client.Call)
    * [type ClientCodec interface](#ClientCodec)
    * [type gobClientCodec struct](#gobClientCodec)
        * [func (c *gobClientCodec) WriteRequest(r *Request, body interface{}) (err error)](#gobClientCodec.WriteRequest)
        * [func (c *gobClientCodec) ReadResponseHeader(r *Response) error](#gobClientCodec.ReadResponseHeader)
        * [func (c *gobClientCodec) ReadResponseBody(body interface{}) error](#gobClientCodec.ReadResponseBody)
        * [func (c *gobClientCodec) Close() error](#gobClientCodec.Close)
    * [type debugMethod struct](#debugMethod)
    * [type methodArray []rpc.debugMethod](#methodArray)
        * [func (m methodArray) Len() int](#methodArray.Len)
        * [func (m methodArray) Less(i, j int) bool](#methodArray.Less)
        * [func (m methodArray) Swap(i, j int)](#methodArray.Swap)
    * [type debugService struct](#debugService)
    * [type serviceArray []rpc.debugService](#serviceArray)
        * [func (s serviceArray) Len() int](#serviceArray.Len)
        * [func (s serviceArray) Less(i, j int) bool](#serviceArray.Less)
        * [func (s serviceArray) Swap(i, j int)](#serviceArray.Swap)
    * [type debugHTTP struct](#debugHTTP)
        * [func (server debugHTTP) ServeHTTP(w http.ResponseWriter, req *http.Request)](#debugHTTP.ServeHTTP)
    * [type methodType struct](#methodType)
        * [func (m *methodType) NumCalls() (n uint)](#methodType.NumCalls)
    * [type service struct](#service)
        * [func (s *service) call(server *Server, sending *sync.Mutex, wg *sync.WaitGroup, mtype *methodType, req *Request, argv, replyv reflect.Value, codec ServerCodec)](#service.call)
    * [type Request struct](#Request)
    * [type Response struct](#Response)
    * [type Server struct](#Server)
        * [func NewServer() *Server](#NewServer)
        * [func (server *Server) Register(rcvr interface{}) error](#Server.Register)
        * [func (server *Server) RegisterName(name string, rcvr interface{}) error](#Server.RegisterName)
        * [func (server *Server) register(rcvr interface{}, name string, useName bool) error](#Server.register)
        * [func (server *Server) sendResponse(sending *sync.Mutex, req *Request, reply interface{}, codec ServerCodec, errmsg string)](#Server.sendResponse)
        * [func (server *Server) ServeConn(conn io.ReadWriteCloser)](#Server.ServeConn)
        * [func (server *Server) ServeCodec(codec ServerCodec)](#Server.ServeCodec)
        * [func (server *Server) ServeRequest(codec ServerCodec) error](#Server.ServeRequest)
        * [func (server *Server) getRequest() *Request](#Server.getRequest)
        * [func (server *Server) freeRequest(req *Request)](#Server.freeRequest)
        * [func (server *Server) getResponse() *Response](#Server.getResponse)
        * [func (server *Server) freeResponse(resp *Response)](#Server.freeResponse)
        * [func (server *Server) readRequest(codec ServerCodec) (service *service, mtype *methodType, req *Request, argv, replyv reflect.Value, keepReading bool, err error)](#Server.readRequest)
        * [func (server *Server) readRequestHeader(codec ServerCodec) (svc *service, mtype *methodType, req *Request, keepReading bool, err error)](#Server.readRequestHeader)
        * [func (server *Server) Accept(lis net.Listener)](#Server.Accept)
        * [func (server *Server) ServeHTTP(w http.ResponseWriter, req *http.Request)](#Server.ServeHTTP)
        * [func (server *Server) HandleHTTP(rpcPath, debugPath string)](#Server.HandleHTTP)
    * [type gobServerCodec struct](#gobServerCodec)
        * [func (c *gobServerCodec) ReadRequestHeader(r *Request) error](#gobServerCodec.ReadRequestHeader)
        * [func (c *gobServerCodec) ReadRequestBody(body interface{}) error](#gobServerCodec.ReadRequestBody)
        * [func (c *gobServerCodec) WriteResponse(r *Response, body interface{}) (err error)](#gobServerCodec.WriteResponse)
        * [func (c *gobServerCodec) Close() error](#gobServerCodec.Close)
    * [type ServerCodec interface](#ServerCodec)
    * [type shutdownCodec struct](#shutdownCodec)
        * [func (c *shutdownCodec) WriteRequest(*Request, interface{}) error](#shutdownCodec.WriteRequest)
        * [func (c *shutdownCodec) ReadResponseBody(interface{}) error](#shutdownCodec.ReadResponseBody)
        * [func (c *shutdownCodec) ReadResponseHeader(*Response) error](#shutdownCodec.ReadResponseHeader)
        * [func (c *shutdownCodec) Close() error](#shutdownCodec.Close)
    * [type R struct](#R)
    * [type S struct{}](#S)
        * [func (s *S) Recv(nul *struct{}, reply *R) error](#S.Recv)
    * [type Args struct](#Args)
    * [type Reply struct](#Reply)
    * [type Arith int](#Arith)
        * [func (t *Arith) Add(args Args, reply *Reply) error](#Arith.Add)
        * [func (t *Arith) Mul(args *Args, reply *Reply) error](#Arith.Mul)
        * [func (t *Arith) Div(args Args, reply *Reply) error](#Arith.Div)
        * [func (t *Arith) String(args *Args, reply *string) error](#Arith.String)
        * [func (t *Arith) Scan(args string, reply *Reply) (err error)](#Arith.Scan)
        * [func (t *Arith) Error(args *Args, reply *Reply) error](#Arith.Error)
        * [func (t *Arith) SleepMilli(args *Args, reply *Reply) error](#Arith.SleepMilli)
    * [type hidden int](#hidden)
        * [func (t *hidden) Exported(args Args, reply *Reply) error](#hidden.Exported)
    * [type Embed struct](#Embed)
    * [type BuiltinTypes struct{}](#BuiltinTypes)
        * [func (BuiltinTypes) Map(args *Args, reply *map[int]int) error](#BuiltinTypes.Map)
        * [func (BuiltinTypes) Slice(args *Args, reply *[]int) error](#BuiltinTypes.Slice)
        * [func (BuiltinTypes) Array(args *Args, reply *[2]int) error](#BuiltinTypes.Array)
    * [type CodecEmulator struct](#CodecEmulator)
        * [func (codec *CodecEmulator) Call(serviceMethod string, args *Args, reply *Reply) error](#CodecEmulator.Call)
        * [func (codec *CodecEmulator) ReadRequestHeader(req *Request) error](#CodecEmulator.ReadRequestHeader)
        * [func (codec *CodecEmulator) ReadRequestBody(argv interface{}) error](#CodecEmulator.ReadRequestBody)
        * [func (codec *CodecEmulator) WriteResponse(resp *Response, reply interface{}) error](#CodecEmulator.WriteResponse)
        * [func (codec *CodecEmulator) Close() error](#CodecEmulator.Close)
    * [type ReplyNotPointer int](#ReplyNotPointer)
        * [func (t *ReplyNotPointer) ReplyNotPointer(args *Args, reply Reply) error](#ReplyNotPointer.ReplyNotPointer)
    * [type ArgNotPublic int](#ArgNotPublic)
        * [func (t *ArgNotPublic) ArgNotPublic(args *local, reply *Reply) error](#ArgNotPublic.ArgNotPublic)
    * [type ReplyNotPublic int](#ReplyNotPublic)
        * [func (t *ReplyNotPublic) ReplyNotPublic(args *Args, reply *local) error](#ReplyNotPublic.ReplyNotPublic)
    * [type NeedsPtrType int](#NeedsPtrType)
        * [func (t *NeedsPtrType) NeedsPtrType(args *Args, reply *Reply) error](#NeedsPtrType.NeedsPtrType)
    * [type local struct{}](#local)
    * [type WriteFailCodec int](#WriteFailCodec)
        * [func (WriteFailCodec) WriteRequest(*Request, interface{}) error](#WriteFailCodec.WriteRequest)
        * [func (WriteFailCodec) ReadResponseHeader(*Response) error](#WriteFailCodec.ReadResponseHeader)
        * [func (WriteFailCodec) ReadResponseBody(interface{}) error](#WriteFailCodec.ReadResponseBody)
        * [func (WriteFailCodec) Close() error](#WriteFailCodec.Close)
    * [type writeCrasher struct](#writeCrasher)
        * [func (writeCrasher) Close() error](#writeCrasher.Close)
        * [func (w *writeCrasher) Read(p []byte) (int, error)](#writeCrasher.Read)
        * [func (writeCrasher) Write(p []byte) (int, error)](#writeCrasher.Write)
* [Functions](#func)
    * [func isExportedOrBuiltinType(t reflect.Type) bool](#isExportedOrBuiltinType)
    * [func suitableMethods(typ reflect.Type, reportErr bool) map[string]*methodType](#suitableMethods)
    * [func Register(rcvr interface{}) error](#Register)
    * [func RegisterName(name string, rcvr interface{}) error](#RegisterName)
    * [func ServeConn(conn io.ReadWriteCloser)](#ServeConn)
    * [func ServeCodec(codec ServerCodec)](#ServeCodec)
    * [func ServeRequest(codec ServerCodec) error](#ServeRequest)
    * [func Accept(lis net.Listener)](#Accept)
    * [func HandleHTTP()](#HandleHTTP)
    * [func TestCloseCodec(t *testing.T)](#TestCloseCodec)
    * [func TestGobError(t *testing.T)](#TestGobError)
    * [func listenTCP() (net.Listener, string)](#listenTCP)
    * [func startServer()](#startServer)
    * [func startNewServer()](#startNewServer)
    * [func startHttpServer()](#startHttpServer)
    * [func TestRPC(t *testing.T)](#TestRPC)
    * [func testRPC(t *testing.T, addr string)](#testRPC)
    * [func testNewServerRPC(t *testing.T, addr string)](#testNewServerRPC)
    * [func TestHTTP(t *testing.T)](#TestHTTP)
    * [func testHTTPRPC(t *testing.T, path string)](#testHTTPRPC)
    * [func TestBuiltinTypes(t *testing.T)](#TestBuiltinTypes)
    * [func TestServeRequest(t *testing.T)](#TestServeRequest)
    * [func testServeRequest(t *testing.T, server *Server)](#testServeRequest)
    * [func TestRegistrationError(t *testing.T)](#TestRegistrationError)
    * [func TestSendDeadlock(t *testing.T)](#TestSendDeadlock)
    * [func testSendDeadlock(client *Client)](#testSendDeadlock)
    * [func countMallocs(dial func() (*Client, error), t *testing.T) float64](#countMallocs)
    * [func TestCountMallocs(t *testing.T)](#TestCountMallocs)
    * [func TestCountMallocsOverHTTP(t *testing.T)](#TestCountMallocsOverHTTP)
    * [func TestClientWriteError(t *testing.T)](#TestClientWriteError)
    * [func TestTCPClose(t *testing.T)](#TestTCPClose)
    * [func TestErrorAfterClientClose(t *testing.T)](#TestErrorAfterClientClose)
    * [func TestAcceptExitAfterListenerClose(t *testing.T)](#TestAcceptExitAfterListenerClose)
    * [func TestShutdown(t *testing.T)](#TestShutdown)
    * [func benchmarkEndToEnd(dial func() (*Client, error), b *testing.B)](#benchmarkEndToEnd)
    * [func benchmarkEndToEndAsync(dial func() (*Client, error), b *testing.B)](#benchmarkEndToEndAsync)
    * [func BenchmarkEndToEnd(b *testing.B)](#BenchmarkEndToEnd)
    * [func BenchmarkEndToEndHTTP(b *testing.B)](#BenchmarkEndToEndHTTP)
    * [func BenchmarkEndToEndAsync(b *testing.B)](#BenchmarkEndToEndAsync)
    * [func BenchmarkEndToEndAsyncHTTP(b *testing.B)](#BenchmarkEndToEndAsyncHTTP)


## <a id="const" href="#const">Constants</a>

### <a id="debugText" href="#debugText">const debugText</a>

```
searchKey: rpc.debugText
tags: [private]
```

```Go
const debugText = ...
```

### <a id="DefaultRPCPath" href="#DefaultRPCPath">const DefaultRPCPath</a>

```
searchKey: rpc.DefaultRPCPath
```

```Go
const DefaultRPCPath = "/_goRPC_"
```

Defaults used by HandleHTTP 

### <a id="DefaultDebugPath" href="#DefaultDebugPath">const DefaultDebugPath</a>

```
searchKey: rpc.DefaultDebugPath
```

```Go
const DefaultDebugPath = "/debug/rpc"
```

### <a id="newHttpPath" href="#newHttpPath">const newHttpPath</a>

```
searchKey: rpc.newHttpPath
tags: [private]
```

```Go
const newHttpPath = "/foo"
```

## <a id="var" href="#var">Variables</a>

### <a id="ErrShutdown" href="#ErrShutdown">var ErrShutdown</a>

```
searchKey: rpc.ErrShutdown
```

```Go
var ErrShutdown = errors.New("connection is shut down")
```

### <a id="debug" href="#debug">var debug</a>

```
searchKey: rpc.debug
tags: [private]
```

```Go
var debug = template.Must(template.New("RPC debug").Parse(debugText))
```

### <a id="debugLog" href="#debugLog">var debugLog</a>

```
searchKey: rpc.debugLog
tags: [private]
```

```Go
var debugLog = false
```

If set, print log statements for internal and I/O errors. 

### <a id="typeOfError" href="#typeOfError">var typeOfError</a>

```
searchKey: rpc.typeOfError
tags: [private]
```

```Go
var typeOfError = reflect.TypeOf((*error)(nil)).Elem()
```

Precompute the reflect type for error. Can't use error directly because Typeof takes an empty interface value. This is annoying. 

### <a id="DefaultServer" href="#DefaultServer">var DefaultServer</a>

```
searchKey: rpc.DefaultServer
```

```Go
var DefaultServer = NewServer()
```

DefaultServer is the default instance of *Server. 

### <a id="invalidRequest" href="#invalidRequest">var invalidRequest</a>

```
searchKey: rpc.invalidRequest
tags: [private]
```

```Go
var invalidRequest = struct{}{}
```

A value sent as a placeholder for the server's response value when the server receives an invalid request. It is never decoded by the client since the Response contains an error when it is used. 

### <a id="connected" href="#connected">var connected</a>

```
searchKey: rpc.connected
tags: [private]
```

```Go
var connected = "200 Connected to Go RPC"
```

Can connect to RPC service using HTTP CONNECT to rpcPath. 

### <a id="newServer" href="#newServer">var newServer</a>

```
searchKey: rpc.newServer
tags: [private]
```

```Go
var newServer *Server
```

### <a id="serverAddr" href="#serverAddr">var serverAddr</a>

```
searchKey: rpc.serverAddr
tags: [private]
```

```Go
var serverAddr, newServerAddr string
```

### <a id="newServerAddr" href="#newServerAddr">var newServerAddr</a>

```
searchKey: rpc.newServerAddr
tags: [private]
```

```Go
var serverAddr, newServerAddr string
```

### <a id="httpServerAddr" href="#httpServerAddr">var httpServerAddr</a>

```
searchKey: rpc.httpServerAddr
tags: [private]
```

```Go
var httpServerAddr string
```

### <a id="once" href="#once">var once</a>

```
searchKey: rpc.once
tags: [private]
```

```Go
var once, newOnce, httpOnce sync.Once
```

### <a id="newOnce" href="#newOnce">var newOnce</a>

```
searchKey: rpc.newOnce
tags: [private]
```

```Go
var once, newOnce, httpOnce sync.Once
```

### <a id="httpOnce" href="#httpOnce">var httpOnce</a>

```
searchKey: rpc.httpOnce
tags: [private]
```

```Go
var once, newOnce, httpOnce sync.Once
```

## <a id="type" href="#type">Types</a>

### <a id="ServerError" href="#ServerError">type ServerError string</a>

```
searchKey: rpc.ServerError
```

```Go
type ServerError string
```

ServerError represents an error that has been returned from the remote side of the RPC connection. 

#### <a id="ServerError.Error" href="#ServerError.Error">func (e ServerError) Error() string</a>

```
searchKey: rpc.ServerError.Error
```

```Go
func (e ServerError) Error() string
```

### <a id="Call" href="#Call">type Call struct</a>

```
searchKey: rpc.Call
```

```Go
type Call struct {
	ServiceMethod string      // The name of the service and method to call.
	Args          interface{} // The argument to the function (*struct).
	Reply         interface{} // The reply from the function (*struct).
	Error         error       // After completion, the error status.
	Done          chan *Call  // Receives *Call when Go is complete.
}
```

Call represents an active RPC. 

#### <a id="Call.done" href="#Call.done">func (call *Call) done()</a>

```
searchKey: rpc.Call.done
tags: [private]
```

```Go
func (call *Call) done()
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: rpc.Client
```

```Go
type Client struct {
	codec ClientCodec

	reqMutex sync.Mutex // protects following
	request  Request

	mutex    sync.Mutex // protects following
	seq      uint64
	pending  map[uint64]*Call
	closing  bool // user has called Close
	shutdown bool // server has told us to stop
}
```

Client represents an RPC Client. There may be multiple outstanding Calls associated with a single Client, and a Client may be used by multiple goroutines simultaneously. 

#### <a id="NewClient" href="#NewClient">func NewClient(conn io.ReadWriteCloser) *Client</a>

```
searchKey: rpc.NewClient
```

```Go
func NewClient(conn io.ReadWriteCloser) *Client
```

NewClient returns a new Client to handle requests to the set of services at the other end of the connection. It adds a buffer to the write side of the connection so the header and payload are sent as a unit. 

The read and write halves of the connection are serialized independently, so no interlocking is required. However each half may be accessed concurrently so the implementation of conn should protect against concurrent reads or concurrent writes. 

#### <a id="NewClientWithCodec" href="#NewClientWithCodec">func NewClientWithCodec(codec ClientCodec) *Client</a>

```
searchKey: rpc.NewClientWithCodec
```

```Go
func NewClientWithCodec(codec ClientCodec) *Client
```

NewClientWithCodec is like NewClient but uses the specified codec to encode requests and decode responses. 

#### <a id="DialHTTP" href="#DialHTTP">func DialHTTP(network, address string) (*Client, error)</a>

```
searchKey: rpc.DialHTTP
```

```Go
func DialHTTP(network, address string) (*Client, error)
```

DialHTTP connects to an HTTP RPC server at the specified network address listening on the default HTTP RPC path. 

#### <a id="DialHTTPPath" href="#DialHTTPPath">func DialHTTPPath(network, address, path string) (*Client, error)</a>

```
searchKey: rpc.DialHTTPPath
```

```Go
func DialHTTPPath(network, address, path string) (*Client, error)
```

DialHTTPPath connects to an HTTP RPC server at the specified network address and path. 

#### <a id="Dial" href="#Dial">func Dial(network, address string) (*Client, error)</a>

```
searchKey: rpc.Dial
```

```Go
func Dial(network, address string) (*Client, error)
```

Dial connects to an RPC server at the specified network address. 

#### <a id="dialDirect" href="#dialDirect">func dialDirect() (*Client, error)</a>

```
searchKey: rpc.dialDirect
tags: [private]
```

```Go
func dialDirect() (*Client, error)
```

#### <a id="dialHTTP" href="#dialHTTP">func dialHTTP() (*Client, error)</a>

```
searchKey: rpc.dialHTTP
tags: [private]
```

```Go
func dialHTTP() (*Client, error)
```

#### <a id="Client.send" href="#Client.send">func (client *Client) send(call *Call)</a>

```
searchKey: rpc.Client.send
tags: [private]
```

```Go
func (client *Client) send(call *Call)
```

#### <a id="Client.input" href="#Client.input">func (client *Client) input()</a>

```
searchKey: rpc.Client.input
tags: [private]
```

```Go
func (client *Client) input()
```

#### <a id="Client.Close" href="#Client.Close">func (client *Client) Close() error</a>

```
searchKey: rpc.Client.Close
```

```Go
func (client *Client) Close() error
```

Close calls the underlying codec's Close method. If the connection is already shutting down, ErrShutdown is returned. 

#### <a id="Client.Go" href="#Client.Go">func (client *Client) Go(serviceMethod string, args interface{}, reply interface{}, done chan *Call) *Call</a>

```
searchKey: rpc.Client.Go
```

```Go
func (client *Client) Go(serviceMethod string, args interface{}, reply interface{}, done chan *Call) *Call
```

Go invokes the function asynchronously. It returns the Call structure representing the invocation. The done channel will signal when the call is complete by returning the same Call object. If done is nil, Go will allocate a new channel. If non-nil, done must be buffered or Go will deliberately crash. 

#### <a id="Client.Call" href="#Client.Call">func (client *Client) Call(serviceMethod string, args interface{}, reply interface{}) error</a>

```
searchKey: rpc.Client.Call
```

```Go
func (client *Client) Call(serviceMethod string, args interface{}, reply interface{}) error
```

Call invokes the named function, waits for it to complete, and returns its error status. 

### <a id="ClientCodec" href="#ClientCodec">type ClientCodec interface</a>

```
searchKey: rpc.ClientCodec
```

```Go
type ClientCodec interface {
	WriteRequest(*Request, interface{}) error
	ReadResponseHeader(*Response) error
	ReadResponseBody(interface{}) error

	Close() error
}
```

A ClientCodec implements writing of RPC requests and reading of RPC responses for the client side of an RPC session. The client calls WriteRequest to write a request to the connection and calls ReadResponseHeader and ReadResponseBody in pairs to read responses. The client calls Close when finished with the connection. ReadResponseBody may be called with a nil argument to force the body of the response to be read and then discarded. See NewClient's comment for information about concurrent access. 

### <a id="gobClientCodec" href="#gobClientCodec">type gobClientCodec struct</a>

```
searchKey: rpc.gobClientCodec
tags: [private]
```

```Go
type gobClientCodec struct {
	rwc    io.ReadWriteCloser
	dec    *gob.Decoder
	enc    *gob.Encoder
	encBuf *bufio.Writer
}
```

#### <a id="gobClientCodec.WriteRequest" href="#gobClientCodec.WriteRequest">func (c *gobClientCodec) WriteRequest(r *Request, body interface{}) (err error)</a>

```
searchKey: rpc.gobClientCodec.WriteRequest
tags: [private]
```

```Go
func (c *gobClientCodec) WriteRequest(r *Request, body interface{}) (err error)
```

#### <a id="gobClientCodec.ReadResponseHeader" href="#gobClientCodec.ReadResponseHeader">func (c *gobClientCodec) ReadResponseHeader(r *Response) error</a>

```
searchKey: rpc.gobClientCodec.ReadResponseHeader
tags: [private]
```

```Go
func (c *gobClientCodec) ReadResponseHeader(r *Response) error
```

#### <a id="gobClientCodec.ReadResponseBody" href="#gobClientCodec.ReadResponseBody">func (c *gobClientCodec) ReadResponseBody(body interface{}) error</a>

```
searchKey: rpc.gobClientCodec.ReadResponseBody
tags: [private]
```

```Go
func (c *gobClientCodec) ReadResponseBody(body interface{}) error
```

#### <a id="gobClientCodec.Close" href="#gobClientCodec.Close">func (c *gobClientCodec) Close() error</a>

```
searchKey: rpc.gobClientCodec.Close
tags: [private]
```

```Go
func (c *gobClientCodec) Close() error
```

### <a id="debugMethod" href="#debugMethod">type debugMethod struct</a>

```
searchKey: rpc.debugMethod
tags: [private]
```

```Go
type debugMethod struct {
	Type *methodType
	Name string
}
```

### <a id="methodArray" href="#methodArray">type methodArray []rpc.debugMethod</a>

```
searchKey: rpc.methodArray
tags: [private]
```

```Go
type methodArray []debugMethod
```

#### <a id="methodArray.Len" href="#methodArray.Len">func (m methodArray) Len() int</a>

```
searchKey: rpc.methodArray.Len
tags: [private]
```

```Go
func (m methodArray) Len() int
```

#### <a id="methodArray.Less" href="#methodArray.Less">func (m methodArray) Less(i, j int) bool</a>

```
searchKey: rpc.methodArray.Less
tags: [private]
```

```Go
func (m methodArray) Less(i, j int) bool
```

#### <a id="methodArray.Swap" href="#methodArray.Swap">func (m methodArray) Swap(i, j int)</a>

```
searchKey: rpc.methodArray.Swap
tags: [private]
```

```Go
func (m methodArray) Swap(i, j int)
```

### <a id="debugService" href="#debugService">type debugService struct</a>

```
searchKey: rpc.debugService
tags: [private]
```

```Go
type debugService struct {
	Service *service
	Name    string
	Method  methodArray
}
```

### <a id="serviceArray" href="#serviceArray">type serviceArray []rpc.debugService</a>

```
searchKey: rpc.serviceArray
tags: [private]
```

```Go
type serviceArray []debugService
```

#### <a id="serviceArray.Len" href="#serviceArray.Len">func (s serviceArray) Len() int</a>

```
searchKey: rpc.serviceArray.Len
tags: [private]
```

```Go
func (s serviceArray) Len() int
```

#### <a id="serviceArray.Less" href="#serviceArray.Less">func (s serviceArray) Less(i, j int) bool</a>

```
searchKey: rpc.serviceArray.Less
tags: [private]
```

```Go
func (s serviceArray) Less(i, j int) bool
```

#### <a id="serviceArray.Swap" href="#serviceArray.Swap">func (s serviceArray) Swap(i, j int)</a>

```
searchKey: rpc.serviceArray.Swap
tags: [private]
```

```Go
func (s serviceArray) Swap(i, j int)
```

### <a id="debugHTTP" href="#debugHTTP">type debugHTTP struct</a>

```
searchKey: rpc.debugHTTP
tags: [private]
```

```Go
type debugHTTP struct {
	*Server
}
```

#### <a id="debugHTTP.ServeHTTP" href="#debugHTTP.ServeHTTP">func (server debugHTTP) ServeHTTP(w http.ResponseWriter, req *http.Request)</a>

```
searchKey: rpc.debugHTTP.ServeHTTP
tags: [private]
```

```Go
func (server debugHTTP) ServeHTTP(w http.ResponseWriter, req *http.Request)
```

Runs at /debug/rpc 

### <a id="methodType" href="#methodType">type methodType struct</a>

```
searchKey: rpc.methodType
tags: [private]
```

```Go
type methodType struct {
	sync.Mutex // protects counters
	method     reflect.Method
	ArgType    reflect.Type
	ReplyType  reflect.Type
	numCalls   uint
}
```

#### <a id="methodType.NumCalls" href="#methodType.NumCalls">func (m *methodType) NumCalls() (n uint)</a>

```
searchKey: rpc.methodType.NumCalls
tags: [private]
```

```Go
func (m *methodType) NumCalls() (n uint)
```

### <a id="service" href="#service">type service struct</a>

```
searchKey: rpc.service
tags: [private]
```

```Go
type service struct {
	name   string                 // name of service
	rcvr   reflect.Value          // receiver of methods for the service
	typ    reflect.Type           // type of the receiver
	method map[string]*methodType // registered methods
}
```

#### <a id="service.call" href="#service.call">func (s *service) call(server *Server, sending *sync.Mutex, wg *sync.WaitGroup, mtype *methodType, req *Request, argv, replyv reflect.Value, codec ServerCodec)</a>

```
searchKey: rpc.service.call
tags: [private]
```

```Go
func (s *service) call(server *Server, sending *sync.Mutex, wg *sync.WaitGroup, mtype *methodType, req *Request, argv, replyv reflect.Value, codec ServerCodec)
```

### <a id="Request" href="#Request">type Request struct</a>

```
searchKey: rpc.Request
```

```Go
type Request struct {
	ServiceMethod string   // format: "Service.Method"
	Seq           uint64   // sequence number chosen by client
	next          *Request // for free list in Server
}
```

Request is a header written before every RPC call. It is used internally but documented here as an aid to debugging, such as when analyzing network traffic. 

### <a id="Response" href="#Response">type Response struct</a>

```
searchKey: rpc.Response
```

```Go
type Response struct {
	ServiceMethod string    // echoes that of the Request
	Seq           uint64    // echoes that of the request
	Error         string    // error, if any.
	next          *Response // for free list in Server
}
```

Response is a header written before every RPC return. It is used internally but documented here as an aid to debugging, such as when analyzing network traffic. 

### <a id="Server" href="#Server">type Server struct</a>

```
searchKey: rpc.Server
```

```Go
type Server struct {
	serviceMap sync.Map   // map[string]*service
	reqLock    sync.Mutex // protects freeReq
	freeReq    *Request
	respLock   sync.Mutex // protects freeResp
	freeResp   *Response
}
```

Server represents an RPC Server. 

#### <a id="NewServer" href="#NewServer">func NewServer() *Server</a>

```
searchKey: rpc.NewServer
```

```Go
func NewServer() *Server
```

NewServer returns a new Server. 

#### <a id="Server.Register" href="#Server.Register">func (server *Server) Register(rcvr interface{}) error</a>

```
searchKey: rpc.Server.Register
```

```Go
func (server *Server) Register(rcvr interface{}) error
```

Register publishes in the server the set of methods of the receiver value that satisfy the following conditions: 

```
- exported method of exported type
- two arguments, both of exported type
- the second argument is a pointer
- one return value, of type error

```
It returns an error if the receiver is not an exported type or has no suitable methods. It also logs the error using package log. The client accesses each method using a string of the form "Type.Method", where Type is the receiver's concrete type. 

#### <a id="Server.RegisterName" href="#Server.RegisterName">func (server *Server) RegisterName(name string, rcvr interface{}) error</a>

```
searchKey: rpc.Server.RegisterName
```

```Go
func (server *Server) RegisterName(name string, rcvr interface{}) error
```

RegisterName is like Register but uses the provided name for the type instead of the receiver's concrete type. 

#### <a id="Server.register" href="#Server.register">func (server *Server) register(rcvr interface{}, name string, useName bool) error</a>

```
searchKey: rpc.Server.register
tags: [private]
```

```Go
func (server *Server) register(rcvr interface{}, name string, useName bool) error
```

#### <a id="Server.sendResponse" href="#Server.sendResponse">func (server *Server) sendResponse(sending *sync.Mutex, req *Request, reply interface{}, codec ServerCodec, errmsg string)</a>

```
searchKey: rpc.Server.sendResponse
tags: [private]
```

```Go
func (server *Server) sendResponse(sending *sync.Mutex, req *Request, reply interface{}, codec ServerCodec, errmsg string)
```

#### <a id="Server.ServeConn" href="#Server.ServeConn">func (server *Server) ServeConn(conn io.ReadWriteCloser)</a>

```
searchKey: rpc.Server.ServeConn
```

```Go
func (server *Server) ServeConn(conn io.ReadWriteCloser)
```

ServeConn runs the server on a single connection. ServeConn blocks, serving the connection until the client hangs up. The caller typically invokes ServeConn in a go statement. ServeConn uses the gob wire format (see package gob) on the connection. To use an alternate codec, use ServeCodec. See NewClient's comment for information about concurrent access. 

#### <a id="Server.ServeCodec" href="#Server.ServeCodec">func (server *Server) ServeCodec(codec ServerCodec)</a>

```
searchKey: rpc.Server.ServeCodec
```

```Go
func (server *Server) ServeCodec(codec ServerCodec)
```

ServeCodec is like ServeConn but uses the specified codec to decode requests and encode responses. 

#### <a id="Server.ServeRequest" href="#Server.ServeRequest">func (server *Server) ServeRequest(codec ServerCodec) error</a>

```
searchKey: rpc.Server.ServeRequest
```

```Go
func (server *Server) ServeRequest(codec ServerCodec) error
```

ServeRequest is like ServeCodec but synchronously serves a single request. It does not close the codec upon completion. 

#### <a id="Server.getRequest" href="#Server.getRequest">func (server *Server) getRequest() *Request</a>

```
searchKey: rpc.Server.getRequest
tags: [private]
```

```Go
func (server *Server) getRequest() *Request
```

#### <a id="Server.freeRequest" href="#Server.freeRequest">func (server *Server) freeRequest(req *Request)</a>

```
searchKey: rpc.Server.freeRequest
tags: [private]
```

```Go
func (server *Server) freeRequest(req *Request)
```

#### <a id="Server.getResponse" href="#Server.getResponse">func (server *Server) getResponse() *Response</a>

```
searchKey: rpc.Server.getResponse
tags: [private]
```

```Go
func (server *Server) getResponse() *Response
```

#### <a id="Server.freeResponse" href="#Server.freeResponse">func (server *Server) freeResponse(resp *Response)</a>

```
searchKey: rpc.Server.freeResponse
tags: [private]
```

```Go
func (server *Server) freeResponse(resp *Response)
```

#### <a id="Server.readRequest" href="#Server.readRequest">func (server *Server) readRequest(codec ServerCodec) (service *service, mtype *methodType, req *Request, argv, replyv reflect.Value, keepReading bool, err error)</a>

```
searchKey: rpc.Server.readRequest
tags: [private]
```

```Go
func (server *Server) readRequest(codec ServerCodec) (service *service, mtype *methodType, req *Request, argv, replyv reflect.Value, keepReading bool, err error)
```

#### <a id="Server.readRequestHeader" href="#Server.readRequestHeader">func (server *Server) readRequestHeader(codec ServerCodec) (svc *service, mtype *methodType, req *Request, keepReading bool, err error)</a>

```
searchKey: rpc.Server.readRequestHeader
tags: [private]
```

```Go
func (server *Server) readRequestHeader(codec ServerCodec) (svc *service, mtype *methodType, req *Request, keepReading bool, err error)
```

#### <a id="Server.Accept" href="#Server.Accept">func (server *Server) Accept(lis net.Listener)</a>

```
searchKey: rpc.Server.Accept
```

```Go
func (server *Server) Accept(lis net.Listener)
```

Accept accepts connections on the listener and serves requests for each incoming connection. Accept blocks until the listener returns a non-nil error. The caller typically invokes Accept in a go statement. 

#### <a id="Server.ServeHTTP" href="#Server.ServeHTTP">func (server *Server) ServeHTTP(w http.ResponseWriter, req *http.Request)</a>

```
searchKey: rpc.Server.ServeHTTP
```

```Go
func (server *Server) ServeHTTP(w http.ResponseWriter, req *http.Request)
```

ServeHTTP implements an http.Handler that answers RPC requests. 

#### <a id="Server.HandleHTTP" href="#Server.HandleHTTP">func (server *Server) HandleHTTP(rpcPath, debugPath string)</a>

```
searchKey: rpc.Server.HandleHTTP
```

```Go
func (server *Server) HandleHTTP(rpcPath, debugPath string)
```

HandleHTTP registers an HTTP handler for RPC messages on rpcPath, and a debugging handler on debugPath. It is still necessary to invoke http.Serve(), typically in a go statement. 

### <a id="gobServerCodec" href="#gobServerCodec">type gobServerCodec struct</a>

```
searchKey: rpc.gobServerCodec
tags: [private]
```

```Go
type gobServerCodec struct {
	rwc    io.ReadWriteCloser
	dec    *gob.Decoder
	enc    *gob.Encoder
	encBuf *bufio.Writer
	closed bool
}
```

#### <a id="gobServerCodec.ReadRequestHeader" href="#gobServerCodec.ReadRequestHeader">func (c *gobServerCodec) ReadRequestHeader(r *Request) error</a>

```
searchKey: rpc.gobServerCodec.ReadRequestHeader
tags: [private]
```

```Go
func (c *gobServerCodec) ReadRequestHeader(r *Request) error
```

#### <a id="gobServerCodec.ReadRequestBody" href="#gobServerCodec.ReadRequestBody">func (c *gobServerCodec) ReadRequestBody(body interface{}) error</a>

```
searchKey: rpc.gobServerCodec.ReadRequestBody
tags: [private]
```

```Go
func (c *gobServerCodec) ReadRequestBody(body interface{}) error
```

#### <a id="gobServerCodec.WriteResponse" href="#gobServerCodec.WriteResponse">func (c *gobServerCodec) WriteResponse(r *Response, body interface{}) (err error)</a>

```
searchKey: rpc.gobServerCodec.WriteResponse
tags: [private]
```

```Go
func (c *gobServerCodec) WriteResponse(r *Response, body interface{}) (err error)
```

#### <a id="gobServerCodec.Close" href="#gobServerCodec.Close">func (c *gobServerCodec) Close() error</a>

```
searchKey: rpc.gobServerCodec.Close
tags: [private]
```

```Go
func (c *gobServerCodec) Close() error
```

### <a id="ServerCodec" href="#ServerCodec">type ServerCodec interface</a>

```
searchKey: rpc.ServerCodec
```

```Go
type ServerCodec interface {
	ReadRequestHeader(*Request) error
	ReadRequestBody(interface{}) error
	WriteResponse(*Response, interface{}) error

	// Close can be called multiple times and must be idempotent.
	Close() error
}
```

A ServerCodec implements reading of RPC requests and writing of RPC responses for the server side of an RPC session. The server calls ReadRequestHeader and ReadRequestBody in pairs to read requests from the connection, and it calls WriteResponse to write a response back. The server calls Close when finished with the connection. ReadRequestBody may be called with a nil argument to force the body of the request to be read and discarded. See NewClient's comment for information about concurrent access. 

### <a id="shutdownCodec" href="#shutdownCodec">type shutdownCodec struct</a>

```
searchKey: rpc.shutdownCodec
tags: [private]
```

```Go
type shutdownCodec struct {
	responded chan int
	closed    bool
}
```

#### <a id="shutdownCodec.WriteRequest" href="#shutdownCodec.WriteRequest">func (c *shutdownCodec) WriteRequest(*Request, interface{}) error</a>

```
searchKey: rpc.shutdownCodec.WriteRequest
tags: [private]
```

```Go
func (c *shutdownCodec) WriteRequest(*Request, interface{}) error
```

#### <a id="shutdownCodec.ReadResponseBody" href="#shutdownCodec.ReadResponseBody">func (c *shutdownCodec) ReadResponseBody(interface{}) error</a>

```
searchKey: rpc.shutdownCodec.ReadResponseBody
tags: [private]
```

```Go
func (c *shutdownCodec) ReadResponseBody(interface{}) error
```

#### <a id="shutdownCodec.ReadResponseHeader" href="#shutdownCodec.ReadResponseHeader">func (c *shutdownCodec) ReadResponseHeader(*Response) error</a>

```
searchKey: rpc.shutdownCodec.ReadResponseHeader
tags: [private]
```

```Go
func (c *shutdownCodec) ReadResponseHeader(*Response) error
```

#### <a id="shutdownCodec.Close" href="#shutdownCodec.Close">func (c *shutdownCodec) Close() error</a>

```
searchKey: rpc.shutdownCodec.Close
tags: [private]
```

```Go
func (c *shutdownCodec) Close() error
```

### <a id="R" href="#R">type R struct</a>

```
searchKey: rpc.R
tags: [private]
```

```Go
type R struct {
	msg []byte // Not exported, so R does not work with gob.
}
```

### <a id="S" href="#S">type S struct{}</a>

```
searchKey: rpc.S
tags: [private]
```

```Go
type S struct{}
```

#### <a id="S.Recv" href="#S.Recv">func (s *S) Recv(nul *struct{}, reply *R) error</a>

```
searchKey: rpc.S.Recv
tags: [private]
```

```Go
func (s *S) Recv(nul *struct{}, reply *R) error
```

### <a id="Args" href="#Args">type Args struct</a>

```
searchKey: rpc.Args
tags: [private]
```

```Go
type Args struct {
	A, B int
}
```

### <a id="Reply" href="#Reply">type Reply struct</a>

```
searchKey: rpc.Reply
tags: [private]
```

```Go
type Reply struct {
	C int
}
```

### <a id="Arith" href="#Arith">type Arith int</a>

```
searchKey: rpc.Arith
tags: [private]
```

```Go
type Arith int
```

#### <a id="Arith.Add" href="#Arith.Add">func (t *Arith) Add(args Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.Add
tags: [private]
```

```Go
func (t *Arith) Add(args Args, reply *Reply) error
```

#### <a id="Arith.Mul" href="#Arith.Mul">func (t *Arith) Mul(args *Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.Mul
tags: [private]
```

```Go
func (t *Arith) Mul(args *Args, reply *Reply) error
```

#### <a id="Arith.Div" href="#Arith.Div">func (t *Arith) Div(args Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.Div
tags: [private]
```

```Go
func (t *Arith) Div(args Args, reply *Reply) error
```

#### <a id="Arith.String" href="#Arith.String">func (t *Arith) String(args *Args, reply *string) error</a>

```
searchKey: rpc.Arith.String
tags: [private]
```

```Go
func (t *Arith) String(args *Args, reply *string) error
```

#### <a id="Arith.Scan" href="#Arith.Scan">func (t *Arith) Scan(args string, reply *Reply) (err error)</a>

```
searchKey: rpc.Arith.Scan
tags: [private]
```

```Go
func (t *Arith) Scan(args string, reply *Reply) (err error)
```

#### <a id="Arith.Error" href="#Arith.Error">func (t *Arith) Error(args *Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.Error
tags: [private]
```

```Go
func (t *Arith) Error(args *Args, reply *Reply) error
```

#### <a id="Arith.SleepMilli" href="#Arith.SleepMilli">func (t *Arith) SleepMilli(args *Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.SleepMilli
tags: [private]
```

```Go
func (t *Arith) SleepMilli(args *Args, reply *Reply) error
```

### <a id="hidden" href="#hidden">type hidden int</a>

```
searchKey: rpc.hidden
tags: [private]
```

```Go
type hidden int
```

#### <a id="hidden.Exported" href="#hidden.Exported">func (t *hidden) Exported(args Args, reply *Reply) error</a>

```
searchKey: rpc.hidden.Exported
tags: [private]
```

```Go
func (t *hidden) Exported(args Args, reply *Reply) error
```

### <a id="Embed" href="#Embed">type Embed struct</a>

```
searchKey: rpc.Embed
tags: [private]
```

```Go
type Embed struct {
	hidden
}
```

### <a id="BuiltinTypes" href="#BuiltinTypes">type BuiltinTypes struct{}</a>

```
searchKey: rpc.BuiltinTypes
tags: [private]
```

```Go
type BuiltinTypes struct{}
```

#### <a id="BuiltinTypes.Map" href="#BuiltinTypes.Map">func (BuiltinTypes) Map(args *Args, reply *map[int]int) error</a>

```
searchKey: rpc.BuiltinTypes.Map
tags: [private]
```

```Go
func (BuiltinTypes) Map(args *Args, reply *map[int]int) error
```

#### <a id="BuiltinTypes.Slice" href="#BuiltinTypes.Slice">func (BuiltinTypes) Slice(args *Args, reply *[]int) error</a>

```
searchKey: rpc.BuiltinTypes.Slice
tags: [private]
```

```Go
func (BuiltinTypes) Slice(args *Args, reply *[]int) error
```

#### <a id="BuiltinTypes.Array" href="#BuiltinTypes.Array">func (BuiltinTypes) Array(args *Args, reply *[2]int) error</a>

```
searchKey: rpc.BuiltinTypes.Array
tags: [private]
```

```Go
func (BuiltinTypes) Array(args *Args, reply *[2]int) error
```

### <a id="CodecEmulator" href="#CodecEmulator">type CodecEmulator struct</a>

```
searchKey: rpc.CodecEmulator
tags: [private]
```

```Go
type CodecEmulator struct {
	server        *Server
	serviceMethod string
	args          *Args
	reply         *Reply
	err           error
}
```

CodecEmulator provides a client-like api and a ServerCodec interface. Can be used to test ServeRequest. 

#### <a id="CodecEmulator.Call" href="#CodecEmulator.Call">func (codec *CodecEmulator) Call(serviceMethod string, args *Args, reply *Reply) error</a>

```
searchKey: rpc.CodecEmulator.Call
tags: [private]
```

```Go
func (codec *CodecEmulator) Call(serviceMethod string, args *Args, reply *Reply) error
```

#### <a id="CodecEmulator.ReadRequestHeader" href="#CodecEmulator.ReadRequestHeader">func (codec *CodecEmulator) ReadRequestHeader(req *Request) error</a>

```
searchKey: rpc.CodecEmulator.ReadRequestHeader
tags: [private]
```

```Go
func (codec *CodecEmulator) ReadRequestHeader(req *Request) error
```

#### <a id="CodecEmulator.ReadRequestBody" href="#CodecEmulator.ReadRequestBody">func (codec *CodecEmulator) ReadRequestBody(argv interface{}) error</a>

```
searchKey: rpc.CodecEmulator.ReadRequestBody
tags: [private]
```

```Go
func (codec *CodecEmulator) ReadRequestBody(argv interface{}) error
```

#### <a id="CodecEmulator.WriteResponse" href="#CodecEmulator.WriteResponse">func (codec *CodecEmulator) WriteResponse(resp *Response, reply interface{}) error</a>

```
searchKey: rpc.CodecEmulator.WriteResponse
tags: [private]
```

```Go
func (codec *CodecEmulator) WriteResponse(resp *Response, reply interface{}) error
```

#### <a id="CodecEmulator.Close" href="#CodecEmulator.Close">func (codec *CodecEmulator) Close() error</a>

```
searchKey: rpc.CodecEmulator.Close
tags: [private]
```

```Go
func (codec *CodecEmulator) Close() error
```

### <a id="ReplyNotPointer" href="#ReplyNotPointer">type ReplyNotPointer int</a>

```
searchKey: rpc.ReplyNotPointer
tags: [private]
```

```Go
type ReplyNotPointer int
```

#### <a id="ReplyNotPointer.ReplyNotPointer" href="#ReplyNotPointer.ReplyNotPointer">func (t *ReplyNotPointer) ReplyNotPointer(args *Args, reply Reply) error</a>

```
searchKey: rpc.ReplyNotPointer.ReplyNotPointer
tags: [private]
```

```Go
func (t *ReplyNotPointer) ReplyNotPointer(args *Args, reply Reply) error
```

### <a id="ArgNotPublic" href="#ArgNotPublic">type ArgNotPublic int</a>

```
searchKey: rpc.ArgNotPublic
tags: [private]
```

```Go
type ArgNotPublic int
```

#### <a id="ArgNotPublic.ArgNotPublic" href="#ArgNotPublic.ArgNotPublic">func (t *ArgNotPublic) ArgNotPublic(args *local, reply *Reply) error</a>

```
searchKey: rpc.ArgNotPublic.ArgNotPublic
tags: [private]
```

```Go
func (t *ArgNotPublic) ArgNotPublic(args *local, reply *Reply) error
```

### <a id="ReplyNotPublic" href="#ReplyNotPublic">type ReplyNotPublic int</a>

```
searchKey: rpc.ReplyNotPublic
tags: [private]
```

```Go
type ReplyNotPublic int
```

#### <a id="ReplyNotPublic.ReplyNotPublic" href="#ReplyNotPublic.ReplyNotPublic">func (t *ReplyNotPublic) ReplyNotPublic(args *Args, reply *local) error</a>

```
searchKey: rpc.ReplyNotPublic.ReplyNotPublic
tags: [private]
```

```Go
func (t *ReplyNotPublic) ReplyNotPublic(args *Args, reply *local) error
```

### <a id="NeedsPtrType" href="#NeedsPtrType">type NeedsPtrType int</a>

```
searchKey: rpc.NeedsPtrType
tags: [private]
```

```Go
type NeedsPtrType int
```

#### <a id="NeedsPtrType.NeedsPtrType" href="#NeedsPtrType.NeedsPtrType">func (t *NeedsPtrType) NeedsPtrType(args *Args, reply *Reply) error</a>

```
searchKey: rpc.NeedsPtrType.NeedsPtrType
tags: [private]
```

```Go
func (t *NeedsPtrType) NeedsPtrType(args *Args, reply *Reply) error
```

### <a id="local" href="#local">type local struct{}</a>

```
searchKey: rpc.local
tags: [private]
```

```Go
type local struct{}
```

### <a id="WriteFailCodec" href="#WriteFailCodec">type WriteFailCodec int</a>

```
searchKey: rpc.WriteFailCodec
tags: [private]
```

```Go
type WriteFailCodec int
```

#### <a id="WriteFailCodec.WriteRequest" href="#WriteFailCodec.WriteRequest">func (WriteFailCodec) WriteRequest(*Request, interface{}) error</a>

```
searchKey: rpc.WriteFailCodec.WriteRequest
tags: [private]
```

```Go
func (WriteFailCodec) WriteRequest(*Request, interface{}) error
```

#### <a id="WriteFailCodec.ReadResponseHeader" href="#WriteFailCodec.ReadResponseHeader">func (WriteFailCodec) ReadResponseHeader(*Response) error</a>

```
searchKey: rpc.WriteFailCodec.ReadResponseHeader
tags: [private]
```

```Go
func (WriteFailCodec) ReadResponseHeader(*Response) error
```

#### <a id="WriteFailCodec.ReadResponseBody" href="#WriteFailCodec.ReadResponseBody">func (WriteFailCodec) ReadResponseBody(interface{}) error</a>

```
searchKey: rpc.WriteFailCodec.ReadResponseBody
tags: [private]
```

```Go
func (WriteFailCodec) ReadResponseBody(interface{}) error
```

#### <a id="WriteFailCodec.Close" href="#WriteFailCodec.Close">func (WriteFailCodec) Close() error</a>

```
searchKey: rpc.WriteFailCodec.Close
tags: [private]
```

```Go
func (WriteFailCodec) Close() error
```

### <a id="writeCrasher" href="#writeCrasher">type writeCrasher struct</a>

```
searchKey: rpc.writeCrasher
tags: [private]
```

```Go
type writeCrasher struct {
	done chan bool
}
```

#### <a id="writeCrasher.Close" href="#writeCrasher.Close">func (writeCrasher) Close() error</a>

```
searchKey: rpc.writeCrasher.Close
tags: [private]
```

```Go
func (writeCrasher) Close() error
```

#### <a id="writeCrasher.Read" href="#writeCrasher.Read">func (w *writeCrasher) Read(p []byte) (int, error)</a>

```
searchKey: rpc.writeCrasher.Read
tags: [private]
```

```Go
func (w *writeCrasher) Read(p []byte) (int, error)
```

#### <a id="writeCrasher.Write" href="#writeCrasher.Write">func (writeCrasher) Write(p []byte) (int, error)</a>

```
searchKey: rpc.writeCrasher.Write
tags: [private]
```

```Go
func (writeCrasher) Write(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="isExportedOrBuiltinType" href="#isExportedOrBuiltinType">func isExportedOrBuiltinType(t reflect.Type) bool</a>

```
searchKey: rpc.isExportedOrBuiltinType
tags: [private]
```

```Go
func isExportedOrBuiltinType(t reflect.Type) bool
```

Is this type exported or a builtin? 

### <a id="suitableMethods" href="#suitableMethods">func suitableMethods(typ reflect.Type, reportErr bool) map[string]*methodType</a>

```
searchKey: rpc.suitableMethods
tags: [private]
```

```Go
func suitableMethods(typ reflect.Type, reportErr bool) map[string]*methodType
```

suitableMethods returns suitable Rpc methods of typ, it will report error using log if reportErr is true. 

### <a id="Register" href="#Register">func Register(rcvr interface{}) error</a>

```
searchKey: rpc.Register
```

```Go
func Register(rcvr interface{}) error
```

Register publishes the receiver's methods in the DefaultServer. 

### <a id="RegisterName" href="#RegisterName">func RegisterName(name string, rcvr interface{}) error</a>

```
searchKey: rpc.RegisterName
```

```Go
func RegisterName(name string, rcvr interface{}) error
```

RegisterName is like Register but uses the provided name for the type instead of the receiver's concrete type. 

### <a id="ServeConn" href="#ServeConn">func ServeConn(conn io.ReadWriteCloser)</a>

```
searchKey: rpc.ServeConn
```

```Go
func ServeConn(conn io.ReadWriteCloser)
```

ServeConn runs the DefaultServer on a single connection. ServeConn blocks, serving the connection until the client hangs up. The caller typically invokes ServeConn in a go statement. ServeConn uses the gob wire format (see package gob) on the connection. To use an alternate codec, use ServeCodec. See NewClient's comment for information about concurrent access. 

### <a id="ServeCodec" href="#ServeCodec">func ServeCodec(codec ServerCodec)</a>

```
searchKey: rpc.ServeCodec
```

```Go
func ServeCodec(codec ServerCodec)
```

ServeCodec is like ServeConn but uses the specified codec to decode requests and encode responses. 

### <a id="ServeRequest" href="#ServeRequest">func ServeRequest(codec ServerCodec) error</a>

```
searchKey: rpc.ServeRequest
```

```Go
func ServeRequest(codec ServerCodec) error
```

ServeRequest is like ServeCodec but synchronously serves a single request. It does not close the codec upon completion. 

### <a id="Accept" href="#Accept">func Accept(lis net.Listener)</a>

```
searchKey: rpc.Accept
```

```Go
func Accept(lis net.Listener)
```

Accept accepts connections on the listener and serves requests to DefaultServer for each incoming connection. Accept blocks; the caller typically invokes it in a go statement. 

### <a id="HandleHTTP" href="#HandleHTTP">func HandleHTTP()</a>

```
searchKey: rpc.HandleHTTP
```

```Go
func HandleHTTP()
```

HandleHTTP registers an HTTP handler for RPC messages to DefaultServer on DefaultRPCPath and a debugging handler on DefaultDebugPath. It is still necessary to invoke http.Serve(), typically in a go statement. 

### <a id="TestCloseCodec" href="#TestCloseCodec">func TestCloseCodec(t *testing.T)</a>

```
searchKey: rpc.TestCloseCodec
tags: [private]
```

```Go
func TestCloseCodec(t *testing.T)
```

### <a id="TestGobError" href="#TestGobError">func TestGobError(t *testing.T)</a>

```
searchKey: rpc.TestGobError
tags: [private]
```

```Go
func TestGobError(t *testing.T)
```

### <a id="listenTCP" href="#listenTCP">func listenTCP() (net.Listener, string)</a>

```
searchKey: rpc.listenTCP
tags: [private]
```

```Go
func listenTCP() (net.Listener, string)
```

### <a id="startServer" href="#startServer">func startServer()</a>

```
searchKey: rpc.startServer
tags: [private]
```

```Go
func startServer()
```

### <a id="startNewServer" href="#startNewServer">func startNewServer()</a>

```
searchKey: rpc.startNewServer
tags: [private]
```

```Go
func startNewServer()
```

### <a id="startHttpServer" href="#startHttpServer">func startHttpServer()</a>

```
searchKey: rpc.startHttpServer
tags: [private]
```

```Go
func startHttpServer()
```

### <a id="TestRPC" href="#TestRPC">func TestRPC(t *testing.T)</a>

```
searchKey: rpc.TestRPC
tags: [private]
```

```Go
func TestRPC(t *testing.T)
```

### <a id="testRPC" href="#testRPC">func testRPC(t *testing.T, addr string)</a>

```
searchKey: rpc.testRPC
tags: [private]
```

```Go
func testRPC(t *testing.T, addr string)
```

### <a id="testNewServerRPC" href="#testNewServerRPC">func testNewServerRPC(t *testing.T, addr string)</a>

```
searchKey: rpc.testNewServerRPC
tags: [private]
```

```Go
func testNewServerRPC(t *testing.T, addr string)
```

### <a id="TestHTTP" href="#TestHTTP">func TestHTTP(t *testing.T)</a>

```
searchKey: rpc.TestHTTP
tags: [private]
```

```Go
func TestHTTP(t *testing.T)
```

### <a id="testHTTPRPC" href="#testHTTPRPC">func testHTTPRPC(t *testing.T, path string)</a>

```
searchKey: rpc.testHTTPRPC
tags: [private]
```

```Go
func testHTTPRPC(t *testing.T, path string)
```

### <a id="TestBuiltinTypes" href="#TestBuiltinTypes">func TestBuiltinTypes(t *testing.T)</a>

```
searchKey: rpc.TestBuiltinTypes
tags: [private]
```

```Go
func TestBuiltinTypes(t *testing.T)
```

### <a id="TestServeRequest" href="#TestServeRequest">func TestServeRequest(t *testing.T)</a>

```
searchKey: rpc.TestServeRequest
tags: [private]
```

```Go
func TestServeRequest(t *testing.T)
```

### <a id="testServeRequest" href="#testServeRequest">func testServeRequest(t *testing.T, server *Server)</a>

```
searchKey: rpc.testServeRequest
tags: [private]
```

```Go
func testServeRequest(t *testing.T, server *Server)
```

### <a id="TestRegistrationError" href="#TestRegistrationError">func TestRegistrationError(t *testing.T)</a>

```
searchKey: rpc.TestRegistrationError
tags: [private]
```

```Go
func TestRegistrationError(t *testing.T)
```

Check that registration handles lots of bad methods and a type with no suitable methods. 

### <a id="TestSendDeadlock" href="#TestSendDeadlock">func TestSendDeadlock(t *testing.T)</a>

```
searchKey: rpc.TestSendDeadlock
tags: [private]
```

```Go
func TestSendDeadlock(t *testing.T)
```

### <a id="testSendDeadlock" href="#testSendDeadlock">func testSendDeadlock(client *Client)</a>

```
searchKey: rpc.testSendDeadlock
tags: [private]
```

```Go
func testSendDeadlock(client *Client)
```

### <a id="countMallocs" href="#countMallocs">func countMallocs(dial func() (*Client, error), t *testing.T) float64</a>

```
searchKey: rpc.countMallocs
tags: [private]
```

```Go
func countMallocs(dial func() (*Client, error), t *testing.T) float64
```

### <a id="TestCountMallocs" href="#TestCountMallocs">func TestCountMallocs(t *testing.T)</a>

```
searchKey: rpc.TestCountMallocs
tags: [private]
```

```Go
func TestCountMallocs(t *testing.T)
```

### <a id="TestCountMallocsOverHTTP" href="#TestCountMallocsOverHTTP">func TestCountMallocsOverHTTP(t *testing.T)</a>

```
searchKey: rpc.TestCountMallocsOverHTTP
tags: [private]
```

```Go
func TestCountMallocsOverHTTP(t *testing.T)
```

### <a id="TestClientWriteError" href="#TestClientWriteError">func TestClientWriteError(t *testing.T)</a>

```
searchKey: rpc.TestClientWriteError
tags: [private]
```

```Go
func TestClientWriteError(t *testing.T)
```

### <a id="TestTCPClose" href="#TestTCPClose">func TestTCPClose(t *testing.T)</a>

```
searchKey: rpc.TestTCPClose
tags: [private]
```

```Go
func TestTCPClose(t *testing.T)
```

### <a id="TestErrorAfterClientClose" href="#TestErrorAfterClientClose">func TestErrorAfterClientClose(t *testing.T)</a>

```
searchKey: rpc.TestErrorAfterClientClose
tags: [private]
```

```Go
func TestErrorAfterClientClose(t *testing.T)
```

### <a id="TestAcceptExitAfterListenerClose" href="#TestAcceptExitAfterListenerClose">func TestAcceptExitAfterListenerClose(t *testing.T)</a>

```
searchKey: rpc.TestAcceptExitAfterListenerClose
tags: [private]
```

```Go
func TestAcceptExitAfterListenerClose(t *testing.T)
```

Tests the fix to issue 11221. Without the fix, this loops forever or crashes. 

### <a id="TestShutdown" href="#TestShutdown">func TestShutdown(t *testing.T)</a>

```
searchKey: rpc.TestShutdown
tags: [private]
```

```Go
func TestShutdown(t *testing.T)
```

### <a id="benchmarkEndToEnd" href="#benchmarkEndToEnd">func benchmarkEndToEnd(dial func() (*Client, error), b *testing.B)</a>

```
searchKey: rpc.benchmarkEndToEnd
tags: [private]
```

```Go
func benchmarkEndToEnd(dial func() (*Client, error), b *testing.B)
```

### <a id="benchmarkEndToEndAsync" href="#benchmarkEndToEndAsync">func benchmarkEndToEndAsync(dial func() (*Client, error), b *testing.B)</a>

```
searchKey: rpc.benchmarkEndToEndAsync
tags: [private]
```

```Go
func benchmarkEndToEndAsync(dial func() (*Client, error), b *testing.B)
```

### <a id="BenchmarkEndToEnd" href="#BenchmarkEndToEnd">func BenchmarkEndToEnd(b *testing.B)</a>

```
searchKey: rpc.BenchmarkEndToEnd
tags: [private]
```

```Go
func BenchmarkEndToEnd(b *testing.B)
```

### <a id="BenchmarkEndToEndHTTP" href="#BenchmarkEndToEndHTTP">func BenchmarkEndToEndHTTP(b *testing.B)</a>

```
searchKey: rpc.BenchmarkEndToEndHTTP
tags: [private]
```

```Go
func BenchmarkEndToEndHTTP(b *testing.B)
```

### <a id="BenchmarkEndToEndAsync" href="#BenchmarkEndToEndAsync">func BenchmarkEndToEndAsync(b *testing.B)</a>

```
searchKey: rpc.BenchmarkEndToEndAsync
tags: [private]
```

```Go
func BenchmarkEndToEndAsync(b *testing.B)
```

### <a id="BenchmarkEndToEndAsyncHTTP" href="#BenchmarkEndToEndAsyncHTTP">func BenchmarkEndToEndAsyncHTTP(b *testing.B)</a>

```
searchKey: rpc.BenchmarkEndToEndAsyncHTTP
tags: [private]
```

```Go
func BenchmarkEndToEndAsyncHTTP(b *testing.B)
```

