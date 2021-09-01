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
    * [const DefaultDebugPath](#DefaultDebugPath)
    * [const DefaultRPCPath](#DefaultRPCPath)
    * [const debugText](#debugText)
    * [const newHttpPath](#newHttpPath)
* [Variables](#var)
    * [var DefaultServer](#DefaultServer)
    * [var ErrShutdown](#ErrShutdown)
    * [var connected](#connected)
    * [var debug](#debug)
    * [var debugLog](#debugLog)
    * [var httpOnce](#httpOnce)
    * [var httpServerAddr](#httpServerAddr)
    * [var invalidRequest](#invalidRequest)
    * [var newOnce](#newOnce)
    * [var newServer](#newServer)
    * [var newServerAddr](#newServerAddr)
    * [var once](#once)
    * [var serverAddr](#serverAddr)
    * [var typeOfError](#typeOfError)
* [Types](#type)
    * [type ArgNotPublic int](#ArgNotPublic)
        * [func (t *ArgNotPublic) ArgNotPublic(args *local, reply *Reply) error](#ArgNotPublic.ArgNotPublic)
    * [type Args struct](#Args)
    * [type Arith int](#Arith)
        * [func (t *Arith) Add(args Args, reply *Reply) error](#Arith.Add)
        * [func (t *Arith) Div(args Args, reply *Reply) error](#Arith.Div)
        * [func (t *Arith) Error(args *Args, reply *Reply) error](#Arith.Error)
        * [func (t *Arith) Mul(args *Args, reply *Reply) error](#Arith.Mul)
        * [func (t *Arith) Scan(args string, reply *Reply) (err error)](#Arith.Scan)
        * [func (t *Arith) SleepMilli(args *Args, reply *Reply) error](#Arith.SleepMilli)
        * [func (t *Arith) String(args *Args, reply *string) error](#Arith.String)
    * [type BuiltinTypes struct{}](#BuiltinTypes)
        * [func (BuiltinTypes) Array(args *Args, reply *[2]int) error](#BuiltinTypes.Array)
        * [func (BuiltinTypes) Map(args *Args, reply *map[int]int) error](#BuiltinTypes.Map)
        * [func (BuiltinTypes) Slice(args *Args, reply *[]int) error](#BuiltinTypes.Slice)
    * [type Call struct](#Call)
        * [func (call *Call) done()](#Call.done)
    * [type Client struct](#Client)
        * [func Dial(network, address string) (*Client, error)](#Dial)
        * [func DialHTTP(network, address string) (*Client, error)](#DialHTTP)
        * [func DialHTTPPath(network, address, path string) (*Client, error)](#DialHTTPPath)
        * [func NewClient(conn io.ReadWriteCloser) *Client](#NewClient)
        * [func NewClientWithCodec(codec ClientCodec) *Client](#NewClientWithCodec)
        * [func dialDirect() (*Client, error)](#dialDirect)
        * [func dialHTTP() (*Client, error)](#dialHTTP)
        * [func (client *Client) Call(serviceMethod string, args interface{}, reply interface{}) error](#Client.Call)
        * [func (client *Client) Close() error](#Client.Close)
        * [func (client *Client) Go(serviceMethod string, args interface{}, reply interface{}, done chan *Call) *Call](#Client.Go)
        * [func (client *Client) input()](#Client.input)
        * [func (client *Client) send(call *Call)](#Client.send)
    * [type ClientCodec interface](#ClientCodec)
    * [type CodecEmulator struct](#CodecEmulator)
        * [func (codec *CodecEmulator) Call(serviceMethod string, args *Args, reply *Reply) error](#CodecEmulator.Call)
        * [func (codec *CodecEmulator) Close() error](#CodecEmulator.Close)
        * [func (codec *CodecEmulator) ReadRequestBody(argv interface{}) error](#CodecEmulator.ReadRequestBody)
        * [func (codec *CodecEmulator) ReadRequestHeader(req *Request) error](#CodecEmulator.ReadRequestHeader)
        * [func (codec *CodecEmulator) WriteResponse(resp *Response, reply interface{}) error](#CodecEmulator.WriteResponse)
    * [type Embed struct](#Embed)
    * [type NeedsPtrType int](#NeedsPtrType)
        * [func (t *NeedsPtrType) NeedsPtrType(args *Args, reply *Reply) error](#NeedsPtrType.NeedsPtrType)
    * [type R struct](#R)
    * [type Reply struct](#Reply)
    * [type ReplyNotPointer int](#ReplyNotPointer)
        * [func (t *ReplyNotPointer) ReplyNotPointer(args *Args, reply Reply) error](#ReplyNotPointer.ReplyNotPointer)
    * [type ReplyNotPublic int](#ReplyNotPublic)
        * [func (t *ReplyNotPublic) ReplyNotPublic(args *Args, reply *local) error](#ReplyNotPublic.ReplyNotPublic)
    * [type Request struct](#Request)
    * [type Response struct](#Response)
    * [type S struct{}](#S)
        * [func (s *S) Recv(nul *struct{}, reply *R) error](#S.Recv)
    * [type Server struct](#Server)
        * [func NewServer() *Server](#NewServer)
        * [func (server *Server) Accept(lis net.Listener)](#Server.Accept)
        * [func (server *Server) HandleHTTP(rpcPath, debugPath string)](#Server.HandleHTTP)
        * [func (server *Server) Register(rcvr interface{}) error](#Server.Register)
        * [func (server *Server) RegisterName(name string, rcvr interface{}) error](#Server.RegisterName)
        * [func (server *Server) ServeCodec(codec ServerCodec)](#Server.ServeCodec)
        * [func (server *Server) ServeConn(conn io.ReadWriteCloser)](#Server.ServeConn)
        * [func (server *Server) ServeHTTP(w http.ResponseWriter, req *http.Request)](#Server.ServeHTTP)
        * [func (server *Server) ServeRequest(codec ServerCodec) error](#Server.ServeRequest)
        * [func (server *Server) freeRequest(req *Request)](#Server.freeRequest)
        * [func (server *Server) freeResponse(resp *Response)](#Server.freeResponse)
        * [func (server *Server) getRequest() *Request](#Server.getRequest)
        * [func (server *Server) getResponse() *Response](#Server.getResponse)
        * [func (server *Server) readRequest(codec ServerCodec) (service *service, mtype *methodType, req *Request, argv, replyv reflect.Value, keepReading bool, err error)](#Server.readRequest)
        * [func (server *Server) readRequestHeader(codec ServerCodec) (svc *service, mtype *methodType, req *Request, keepReading bool, err error)](#Server.readRequestHeader)
        * [func (server *Server) register(rcvr interface{}, name string, useName bool) error](#Server.register)
        * [func (server *Server) sendResponse(sending *sync.Mutex, req *Request, reply interface{}, codec ServerCodec, errmsg string)](#Server.sendResponse)
    * [type ServerCodec interface](#ServerCodec)
    * [type ServerError string](#ServerError)
        * [func (e ServerError) Error() string](#ServerError.Error)
    * [type WriteFailCodec int](#WriteFailCodec)
        * [func (WriteFailCodec) Close() error](#WriteFailCodec.Close)
        * [func (WriteFailCodec) ReadResponseBody(interface{}) error](#WriteFailCodec.ReadResponseBody)
        * [func (WriteFailCodec) ReadResponseHeader(*Response) error](#WriteFailCodec.ReadResponseHeader)
        * [func (WriteFailCodec) WriteRequest(*Request, interface{}) error](#WriteFailCodec.WriteRequest)
    * [type debugHTTP struct](#debugHTTP)
        * [func (server debugHTTP) ServeHTTP(w http.ResponseWriter, req *http.Request)](#debugHTTP.ServeHTTP)
    * [type debugMethod struct](#debugMethod)
    * [type debugService struct](#debugService)
    * [type gobClientCodec struct](#gobClientCodec)
        * [func (c *gobClientCodec) Close() error](#gobClientCodec.Close)
        * [func (c *gobClientCodec) ReadResponseBody(body interface{}) error](#gobClientCodec.ReadResponseBody)
        * [func (c *gobClientCodec) ReadResponseHeader(r *Response) error](#gobClientCodec.ReadResponseHeader)
        * [func (c *gobClientCodec) WriteRequest(r *Request, body interface{}) (err error)](#gobClientCodec.WriteRequest)
    * [type gobServerCodec struct](#gobServerCodec)
        * [func (c *gobServerCodec) Close() error](#gobServerCodec.Close)
        * [func (c *gobServerCodec) ReadRequestBody(body interface{}) error](#gobServerCodec.ReadRequestBody)
        * [func (c *gobServerCodec) ReadRequestHeader(r *Request) error](#gobServerCodec.ReadRequestHeader)
        * [func (c *gobServerCodec) WriteResponse(r *Response, body interface{}) (err error)](#gobServerCodec.WriteResponse)
    * [type hidden int](#hidden)
        * [func (t *hidden) Exported(args Args, reply *Reply) error](#hidden.Exported)
    * [type local struct{}](#local)
    * [type methodArray []rpc.debugMethod](#methodArray)
        * [func (m methodArray) Len() int](#methodArray.Len)
        * [func (m methodArray) Less(i, j int) bool](#methodArray.Less)
        * [func (m methodArray) Swap(i, j int)](#methodArray.Swap)
    * [type methodType struct](#methodType)
        * [func (m *methodType) NumCalls() (n uint)](#methodType.NumCalls)
    * [type service struct](#service)
        * [func (s *service) call(server *Server, sending *sync.Mutex, wg *sync.WaitGroup, mtype *methodType, req *Request, argv, replyv reflect.Value, codec ServerCodec)](#service.call)
    * [type serviceArray []rpc.debugService](#serviceArray)
        * [func (s serviceArray) Len() int](#serviceArray.Len)
        * [func (s serviceArray) Less(i, j int) bool](#serviceArray.Less)
        * [func (s serviceArray) Swap(i, j int)](#serviceArray.Swap)
    * [type shutdownCodec struct](#shutdownCodec)
        * [func (c *shutdownCodec) Close() error](#shutdownCodec.Close)
        * [func (c *shutdownCodec) ReadResponseBody(interface{}) error](#shutdownCodec.ReadResponseBody)
        * [func (c *shutdownCodec) ReadResponseHeader(*Response) error](#shutdownCodec.ReadResponseHeader)
        * [func (c *shutdownCodec) WriteRequest(*Request, interface{}) error](#shutdownCodec.WriteRequest)
    * [type writeCrasher struct](#writeCrasher)
        * [func (writeCrasher) Close() error](#writeCrasher.Close)
        * [func (w *writeCrasher) Read(p []byte) (int, error)](#writeCrasher.Read)
        * [func (writeCrasher) Write(p []byte) (int, error)](#writeCrasher.Write)
* [Functions](#func)
    * [func Accept(lis net.Listener)](#Accept)
    * [func BenchmarkEndToEnd(b *testing.B)](#BenchmarkEndToEnd)
    * [func BenchmarkEndToEndAsync(b *testing.B)](#BenchmarkEndToEndAsync)
    * [func BenchmarkEndToEndAsyncHTTP(b *testing.B)](#BenchmarkEndToEndAsyncHTTP)
    * [func BenchmarkEndToEndHTTP(b *testing.B)](#BenchmarkEndToEndHTTP)
    * [func HandleHTTP()](#HandleHTTP)
    * [func Register(rcvr interface{}) error](#Register)
    * [func RegisterName(name string, rcvr interface{}) error](#RegisterName)
    * [func ServeCodec(codec ServerCodec)](#ServeCodec)
    * [func ServeConn(conn io.ReadWriteCloser)](#ServeConn)
    * [func ServeRequest(codec ServerCodec) error](#ServeRequest)
    * [func TestAcceptExitAfterListenerClose(t *testing.T)](#TestAcceptExitAfterListenerClose)
    * [func TestBuiltinTypes(t *testing.T)](#TestBuiltinTypes)
    * [func TestClientWriteError(t *testing.T)](#TestClientWriteError)
    * [func TestCloseCodec(t *testing.T)](#TestCloseCodec)
    * [func TestCountMallocs(t *testing.T)](#TestCountMallocs)
    * [func TestCountMallocsOverHTTP(t *testing.T)](#TestCountMallocsOverHTTP)
    * [func TestErrorAfterClientClose(t *testing.T)](#TestErrorAfterClientClose)
    * [func TestGobError(t *testing.T)](#TestGobError)
    * [func TestHTTP(t *testing.T)](#TestHTTP)
    * [func TestRPC(t *testing.T)](#TestRPC)
    * [func TestRegistrationError(t *testing.T)](#TestRegistrationError)
    * [func TestSendDeadlock(t *testing.T)](#TestSendDeadlock)
    * [func TestServeRequest(t *testing.T)](#TestServeRequest)
    * [func TestShutdown(t *testing.T)](#TestShutdown)
    * [func TestTCPClose(t *testing.T)](#TestTCPClose)
    * [func benchmarkEndToEnd(dial func() (*Client, error), b *testing.B)](#benchmarkEndToEnd)
    * [func benchmarkEndToEndAsync(dial func() (*Client, error), b *testing.B)](#benchmarkEndToEndAsync)
    * [func countMallocs(dial func() (*Client, error), t *testing.T) float64](#countMallocs)
    * [func isExportedOrBuiltinType(t reflect.Type) bool](#isExportedOrBuiltinType)
    * [func listenTCP() (net.Listener, string)](#listenTCP)
    * [func startHttpServer()](#startHttpServer)
    * [func startNewServer()](#startNewServer)
    * [func startServer()](#startServer)
    * [func suitableMethods(typ reflect.Type, reportErr bool) map[string]*methodType](#suitableMethods)
    * [func testHTTPRPC(t *testing.T, path string)](#testHTTPRPC)
    * [func testNewServerRPC(t *testing.T, addr string)](#testNewServerRPC)
    * [func testRPC(t *testing.T, addr string)](#testRPC)
    * [func testSendDeadlock(client *Client)](#testSendDeadlock)
    * [func testServeRequest(t *testing.T, server *Server)](#testServeRequest)


## <a id="const" href="#const">Constants</a>

### <a id="DefaultDebugPath" href="#DefaultDebugPath">const DefaultDebugPath</a>

```
searchKey: rpc.DefaultDebugPath
tags: [constant string]
```

```Go
const DefaultDebugPath = "/debug/rpc"
```

### <a id="DefaultRPCPath" href="#DefaultRPCPath">const DefaultRPCPath</a>

```
searchKey: rpc.DefaultRPCPath
tags: [constant string]
```

```Go
const DefaultRPCPath = "/_goRPC_"
```

Defaults used by HandleHTTP 

### <a id="debugText" href="#debugText">const debugText</a>

```
searchKey: rpc.debugText
tags: [constant string private]
```

```Go
const debugText = ...
```

### <a id="newHttpPath" href="#newHttpPath">const newHttpPath</a>

```
searchKey: rpc.newHttpPath
tags: [constant string private]
```

```Go
const newHttpPath = "/foo"
```

## <a id="var" href="#var">Variables</a>

### <a id="DefaultServer" href="#DefaultServer">var DefaultServer</a>

```
searchKey: rpc.DefaultServer
tags: [variable struct]
```

```Go
var DefaultServer = NewServer()
```

DefaultServer is the default instance of *Server. 

### <a id="ErrShutdown" href="#ErrShutdown">var ErrShutdown</a>

```
searchKey: rpc.ErrShutdown
tags: [variable interface]
```

```Go
var ErrShutdown = errors.New("connection is shut down")
```

### <a id="connected" href="#connected">var connected</a>

```
searchKey: rpc.connected
tags: [variable string private]
```

```Go
var connected = "200 Connected to Go RPC"
```

Can connect to RPC service using HTTP CONNECT to rpcPath. 

### <a id="debug" href="#debug">var debug</a>

```
searchKey: rpc.debug
tags: [variable struct private]
```

```Go
var debug = template.Must(template.New("RPC debug").Parse(debugText))
```

### <a id="debugLog" href="#debugLog">var debugLog</a>

```
searchKey: rpc.debugLog
tags: [variable boolean private]
```

```Go
var debugLog = false
```

If set, print log statements for internal and I/O errors. 

### <a id="httpOnce" href="#httpOnce">var httpOnce</a>

```
searchKey: rpc.httpOnce
tags: [variable struct private]
```

```Go
var once, newOnce, httpOnce sync.Once
```

### <a id="httpServerAddr" href="#httpServerAddr">var httpServerAddr</a>

```
searchKey: rpc.httpServerAddr
tags: [variable string private]
```

```Go
var httpServerAddr string
```

### <a id="invalidRequest" href="#invalidRequest">var invalidRequest</a>

```
searchKey: rpc.invalidRequest
tags: [variable struct private]
```

```Go
var invalidRequest = struct{}{}
```

A value sent as a placeholder for the server's response value when the server receives an invalid request. It is never decoded by the client since the Response contains an error when it is used. 

### <a id="newOnce" href="#newOnce">var newOnce</a>

```
searchKey: rpc.newOnce
tags: [variable struct private]
```

```Go
var once, newOnce, httpOnce sync.Once
```

### <a id="newServer" href="#newServer">var newServer</a>

```
searchKey: rpc.newServer
tags: [variable struct private]
```

```Go
var newServer *Server
```

### <a id="newServerAddr" href="#newServerAddr">var newServerAddr</a>

```
searchKey: rpc.newServerAddr
tags: [variable string private]
```

```Go
var serverAddr, newServerAddr string
```

### <a id="once" href="#once">var once</a>

```
searchKey: rpc.once
tags: [variable struct private]
```

```Go
var once, newOnce, httpOnce sync.Once
```

### <a id="serverAddr" href="#serverAddr">var serverAddr</a>

```
searchKey: rpc.serverAddr
tags: [variable string private]
```

```Go
var serverAddr, newServerAddr string
```

### <a id="typeOfError" href="#typeOfError">var typeOfError</a>

```
searchKey: rpc.typeOfError
tags: [variable interface private]
```

```Go
var typeOfError = reflect.TypeOf((*error)(nil)).Elem()
```

Precompute the reflect type for error. Can't use error directly because Typeof takes an empty interface value. This is annoying. 

## <a id="type" href="#type">Types</a>

### <a id="ArgNotPublic" href="#ArgNotPublic">type ArgNotPublic int</a>

```
searchKey: rpc.ArgNotPublic
tags: [number private]
```

```Go
type ArgNotPublic int
```

#### <a id="ArgNotPublic.ArgNotPublic" href="#ArgNotPublic.ArgNotPublic">func (t *ArgNotPublic) ArgNotPublic(args *local, reply *Reply) error</a>

```
searchKey: rpc.ArgNotPublic.ArgNotPublic
tags: [method private]
```

```Go
func (t *ArgNotPublic) ArgNotPublic(args *local, reply *Reply) error
```

### <a id="Args" href="#Args">type Args struct</a>

```
searchKey: rpc.Args
tags: [struct private]
```

```Go
type Args struct {
	A, B int
}
```

### <a id="Arith" href="#Arith">type Arith int</a>

```
searchKey: rpc.Arith
tags: [number private]
```

```Go
type Arith int
```

#### <a id="Arith.Add" href="#Arith.Add">func (t *Arith) Add(args Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.Add
tags: [method private]
```

```Go
func (t *Arith) Add(args Args, reply *Reply) error
```

#### <a id="Arith.Div" href="#Arith.Div">func (t *Arith) Div(args Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.Div
tags: [method private]
```

```Go
func (t *Arith) Div(args Args, reply *Reply) error
```

#### <a id="Arith.Error" href="#Arith.Error">func (t *Arith) Error(args *Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.Error
tags: [method private]
```

```Go
func (t *Arith) Error(args *Args, reply *Reply) error
```

#### <a id="Arith.Mul" href="#Arith.Mul">func (t *Arith) Mul(args *Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.Mul
tags: [method private]
```

```Go
func (t *Arith) Mul(args *Args, reply *Reply) error
```

#### <a id="Arith.Scan" href="#Arith.Scan">func (t *Arith) Scan(args string, reply *Reply) (err error)</a>

```
searchKey: rpc.Arith.Scan
tags: [method private]
```

```Go
func (t *Arith) Scan(args string, reply *Reply) (err error)
```

#### <a id="Arith.SleepMilli" href="#Arith.SleepMilli">func (t *Arith) SleepMilli(args *Args, reply *Reply) error</a>

```
searchKey: rpc.Arith.SleepMilli
tags: [method private]
```

```Go
func (t *Arith) SleepMilli(args *Args, reply *Reply) error
```

#### <a id="Arith.String" href="#Arith.String">func (t *Arith) String(args *Args, reply *string) error</a>

```
searchKey: rpc.Arith.String
tags: [method private]
```

```Go
func (t *Arith) String(args *Args, reply *string) error
```

### <a id="BuiltinTypes" href="#BuiltinTypes">type BuiltinTypes struct{}</a>

```
searchKey: rpc.BuiltinTypes
tags: [struct private]
```

```Go
type BuiltinTypes struct{}
```

#### <a id="BuiltinTypes.Array" href="#BuiltinTypes.Array">func (BuiltinTypes) Array(args *Args, reply *[2]int) error</a>

```
searchKey: rpc.BuiltinTypes.Array
tags: [method private]
```

```Go
func (BuiltinTypes) Array(args *Args, reply *[2]int) error
```

#### <a id="BuiltinTypes.Map" href="#BuiltinTypes.Map">func (BuiltinTypes) Map(args *Args, reply *map[int]int) error</a>

```
searchKey: rpc.BuiltinTypes.Map
tags: [method private]
```

```Go
func (BuiltinTypes) Map(args *Args, reply *map[int]int) error
```

#### <a id="BuiltinTypes.Slice" href="#BuiltinTypes.Slice">func (BuiltinTypes) Slice(args *Args, reply *[]int) error</a>

```
searchKey: rpc.BuiltinTypes.Slice
tags: [method private]
```

```Go
func (BuiltinTypes) Slice(args *Args, reply *[]int) error
```

### <a id="Call" href="#Call">type Call struct</a>

```
searchKey: rpc.Call
tags: [struct]
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
tags: [method private]
```

```Go
func (call *Call) done()
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: rpc.Client
tags: [struct]
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

#### <a id="Dial" href="#Dial">func Dial(network, address string) (*Client, error)</a>

```
searchKey: rpc.Dial
tags: [function]
```

```Go
func Dial(network, address string) (*Client, error)
```

Dial connects to an RPC server at the specified network address. 

#### <a id="DialHTTP" href="#DialHTTP">func DialHTTP(network, address string) (*Client, error)</a>

```
searchKey: rpc.DialHTTP
tags: [function]
```

```Go
func DialHTTP(network, address string) (*Client, error)
```

DialHTTP connects to an HTTP RPC server at the specified network address listening on the default HTTP RPC path. 

#### <a id="DialHTTPPath" href="#DialHTTPPath">func DialHTTPPath(network, address, path string) (*Client, error)</a>

```
searchKey: rpc.DialHTTPPath
tags: [function]
```

```Go
func DialHTTPPath(network, address, path string) (*Client, error)
```

DialHTTPPath connects to an HTTP RPC server at the specified network address and path. 

#### <a id="NewClient" href="#NewClient">func NewClient(conn io.ReadWriteCloser) *Client</a>

```
searchKey: rpc.NewClient
tags: [function]
```

```Go
func NewClient(conn io.ReadWriteCloser) *Client
```

NewClient returns a new Client to handle requests to the set of services at the other end of the connection. It adds a buffer to the write side of the connection so the header and payload are sent as a unit. 

The read and write halves of the connection are serialized independently, so no interlocking is required. However each half may be accessed concurrently so the implementation of conn should protect against concurrent reads or concurrent writes. 

#### <a id="NewClientWithCodec" href="#NewClientWithCodec">func NewClientWithCodec(codec ClientCodec) *Client</a>

```
searchKey: rpc.NewClientWithCodec
tags: [function]
```

```Go
func NewClientWithCodec(codec ClientCodec) *Client
```

NewClientWithCodec is like NewClient but uses the specified codec to encode requests and decode responses. 

#### <a id="dialDirect" href="#dialDirect">func dialDirect() (*Client, error)</a>

```
searchKey: rpc.dialDirect
tags: [function private]
```

```Go
func dialDirect() (*Client, error)
```

#### <a id="dialHTTP" href="#dialHTTP">func dialHTTP() (*Client, error)</a>

```
searchKey: rpc.dialHTTP
tags: [function private]
```

```Go
func dialHTTP() (*Client, error)
```

#### <a id="Client.Call" href="#Client.Call">func (client *Client) Call(serviceMethod string, args interface{}, reply interface{}) error</a>

```
searchKey: rpc.Client.Call
tags: [method]
```

```Go
func (client *Client) Call(serviceMethod string, args interface{}, reply interface{}) error
```

Call invokes the named function, waits for it to complete, and returns its error status. 

#### <a id="Client.Close" href="#Client.Close">func (client *Client) Close() error</a>

```
searchKey: rpc.Client.Close
tags: [method]
```

```Go
func (client *Client) Close() error
```

Close calls the underlying codec's Close method. If the connection is already shutting down, ErrShutdown is returned. 

#### <a id="Client.Go" href="#Client.Go">func (client *Client) Go(serviceMethod string, args interface{}, reply interface{}, done chan *Call) *Call</a>

```
searchKey: rpc.Client.Go
tags: [method]
```

```Go
func (client *Client) Go(serviceMethod string, args interface{}, reply interface{}, done chan *Call) *Call
```

Go invokes the function asynchronously. It returns the Call structure representing the invocation. The done channel will signal when the call is complete by returning the same Call object. If done is nil, Go will allocate a new channel. If non-nil, done must be buffered or Go will deliberately crash. 

#### <a id="Client.input" href="#Client.input">func (client *Client) input()</a>

```
searchKey: rpc.Client.input
tags: [method private]
```

```Go
func (client *Client) input()
```

#### <a id="Client.send" href="#Client.send">func (client *Client) send(call *Call)</a>

```
searchKey: rpc.Client.send
tags: [method private]
```

```Go
func (client *Client) send(call *Call)
```

### <a id="ClientCodec" href="#ClientCodec">type ClientCodec interface</a>

```
searchKey: rpc.ClientCodec
tags: [interface]
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

### <a id="CodecEmulator" href="#CodecEmulator">type CodecEmulator struct</a>

```
searchKey: rpc.CodecEmulator
tags: [struct private]
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
tags: [method private]
```

```Go
func (codec *CodecEmulator) Call(serviceMethod string, args *Args, reply *Reply) error
```

#### <a id="CodecEmulator.Close" href="#CodecEmulator.Close">func (codec *CodecEmulator) Close() error</a>

```
searchKey: rpc.CodecEmulator.Close
tags: [method private]
```

```Go
func (codec *CodecEmulator) Close() error
```

#### <a id="CodecEmulator.ReadRequestBody" href="#CodecEmulator.ReadRequestBody">func (codec *CodecEmulator) ReadRequestBody(argv interface{}) error</a>

```
searchKey: rpc.CodecEmulator.ReadRequestBody
tags: [method private]
```

```Go
func (codec *CodecEmulator) ReadRequestBody(argv interface{}) error
```

#### <a id="CodecEmulator.ReadRequestHeader" href="#CodecEmulator.ReadRequestHeader">func (codec *CodecEmulator) ReadRequestHeader(req *Request) error</a>

```
searchKey: rpc.CodecEmulator.ReadRequestHeader
tags: [method private]
```

```Go
func (codec *CodecEmulator) ReadRequestHeader(req *Request) error
```

#### <a id="CodecEmulator.WriteResponse" href="#CodecEmulator.WriteResponse">func (codec *CodecEmulator) WriteResponse(resp *Response, reply interface{}) error</a>

```
searchKey: rpc.CodecEmulator.WriteResponse
tags: [method private]
```

```Go
func (codec *CodecEmulator) WriteResponse(resp *Response, reply interface{}) error
```

### <a id="Embed" href="#Embed">type Embed struct</a>

```
searchKey: rpc.Embed
tags: [struct private]
```

```Go
type Embed struct {
	hidden
}
```

### <a id="NeedsPtrType" href="#NeedsPtrType">type NeedsPtrType int</a>

```
searchKey: rpc.NeedsPtrType
tags: [number private]
```

```Go
type NeedsPtrType int
```

#### <a id="NeedsPtrType.NeedsPtrType" href="#NeedsPtrType.NeedsPtrType">func (t *NeedsPtrType) NeedsPtrType(args *Args, reply *Reply) error</a>

```
searchKey: rpc.NeedsPtrType.NeedsPtrType
tags: [method private]
```

```Go
func (t *NeedsPtrType) NeedsPtrType(args *Args, reply *Reply) error
```

### <a id="R" href="#R">type R struct</a>

```
searchKey: rpc.R
tags: [struct private]
```

```Go
type R struct {
	msg []byte // Not exported, so R does not work with gob.
}
```

### <a id="Reply" href="#Reply">type Reply struct</a>

```
searchKey: rpc.Reply
tags: [struct private]
```

```Go
type Reply struct {
	C int
}
```

### <a id="ReplyNotPointer" href="#ReplyNotPointer">type ReplyNotPointer int</a>

```
searchKey: rpc.ReplyNotPointer
tags: [number private]
```

```Go
type ReplyNotPointer int
```

#### <a id="ReplyNotPointer.ReplyNotPointer" href="#ReplyNotPointer.ReplyNotPointer">func (t *ReplyNotPointer) ReplyNotPointer(args *Args, reply Reply) error</a>

```
searchKey: rpc.ReplyNotPointer.ReplyNotPointer
tags: [method private]
```

```Go
func (t *ReplyNotPointer) ReplyNotPointer(args *Args, reply Reply) error
```

### <a id="ReplyNotPublic" href="#ReplyNotPublic">type ReplyNotPublic int</a>

```
searchKey: rpc.ReplyNotPublic
tags: [number private]
```

```Go
type ReplyNotPublic int
```

#### <a id="ReplyNotPublic.ReplyNotPublic" href="#ReplyNotPublic.ReplyNotPublic">func (t *ReplyNotPublic) ReplyNotPublic(args *Args, reply *local) error</a>

```
searchKey: rpc.ReplyNotPublic.ReplyNotPublic
tags: [method private]
```

```Go
func (t *ReplyNotPublic) ReplyNotPublic(args *Args, reply *local) error
```

### <a id="Request" href="#Request">type Request struct</a>

```
searchKey: rpc.Request
tags: [struct]
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
tags: [struct]
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

### <a id="S" href="#S">type S struct{}</a>

```
searchKey: rpc.S
tags: [struct private]
```

```Go
type S struct{}
```

#### <a id="S.Recv" href="#S.Recv">func (s *S) Recv(nul *struct{}, reply *R) error</a>

```
searchKey: rpc.S.Recv
tags: [method private]
```

```Go
func (s *S) Recv(nul *struct{}, reply *R) error
```

### <a id="Server" href="#Server">type Server struct</a>

```
searchKey: rpc.Server
tags: [struct]
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
tags: [function]
```

```Go
func NewServer() *Server
```

NewServer returns a new Server. 

#### <a id="Server.Accept" href="#Server.Accept">func (server *Server) Accept(lis net.Listener)</a>

```
searchKey: rpc.Server.Accept
tags: [method]
```

```Go
func (server *Server) Accept(lis net.Listener)
```

Accept accepts connections on the listener and serves requests for each incoming connection. Accept blocks until the listener returns a non-nil error. The caller typically invokes Accept in a go statement. 

#### <a id="Server.HandleHTTP" href="#Server.HandleHTTP">func (server *Server) HandleHTTP(rpcPath, debugPath string)</a>

```
searchKey: rpc.Server.HandleHTTP
tags: [method]
```

```Go
func (server *Server) HandleHTTP(rpcPath, debugPath string)
```

HandleHTTP registers an HTTP handler for RPC messages on rpcPath, and a debugging handler on debugPath. It is still necessary to invoke http.Serve(), typically in a go statement. 

#### <a id="Server.Register" href="#Server.Register">func (server *Server) Register(rcvr interface{}) error</a>

```
searchKey: rpc.Server.Register
tags: [method]
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
tags: [method]
```

```Go
func (server *Server) RegisterName(name string, rcvr interface{}) error
```

RegisterName is like Register but uses the provided name for the type instead of the receiver's concrete type. 

#### <a id="Server.ServeCodec" href="#Server.ServeCodec">func (server *Server) ServeCodec(codec ServerCodec)</a>

```
searchKey: rpc.Server.ServeCodec
tags: [method]
```

```Go
func (server *Server) ServeCodec(codec ServerCodec)
```

ServeCodec is like ServeConn but uses the specified codec to decode requests and encode responses. 

#### <a id="Server.ServeConn" href="#Server.ServeConn">func (server *Server) ServeConn(conn io.ReadWriteCloser)</a>

```
searchKey: rpc.Server.ServeConn
tags: [method]
```

```Go
func (server *Server) ServeConn(conn io.ReadWriteCloser)
```

ServeConn runs the server on a single connection. ServeConn blocks, serving the connection until the client hangs up. The caller typically invokes ServeConn in a go statement. ServeConn uses the gob wire format (see package gob) on the connection. To use an alternate codec, use ServeCodec. See NewClient's comment for information about concurrent access. 

#### <a id="Server.ServeHTTP" href="#Server.ServeHTTP">func (server *Server) ServeHTTP(w http.ResponseWriter, req *http.Request)</a>

```
searchKey: rpc.Server.ServeHTTP
tags: [method]
```

```Go
func (server *Server) ServeHTTP(w http.ResponseWriter, req *http.Request)
```

ServeHTTP implements an http.Handler that answers RPC requests. 

#### <a id="Server.ServeRequest" href="#Server.ServeRequest">func (server *Server) ServeRequest(codec ServerCodec) error</a>

```
searchKey: rpc.Server.ServeRequest
tags: [method]
```

```Go
func (server *Server) ServeRequest(codec ServerCodec) error
```

ServeRequest is like ServeCodec but synchronously serves a single request. It does not close the codec upon completion. 

#### <a id="Server.freeRequest" href="#Server.freeRequest">func (server *Server) freeRequest(req *Request)</a>

```
searchKey: rpc.Server.freeRequest
tags: [method private]
```

```Go
func (server *Server) freeRequest(req *Request)
```

#### <a id="Server.freeResponse" href="#Server.freeResponse">func (server *Server) freeResponse(resp *Response)</a>

```
searchKey: rpc.Server.freeResponse
tags: [method private]
```

```Go
func (server *Server) freeResponse(resp *Response)
```

#### <a id="Server.getRequest" href="#Server.getRequest">func (server *Server) getRequest() *Request</a>

```
searchKey: rpc.Server.getRequest
tags: [method private]
```

```Go
func (server *Server) getRequest() *Request
```

#### <a id="Server.getResponse" href="#Server.getResponse">func (server *Server) getResponse() *Response</a>

```
searchKey: rpc.Server.getResponse
tags: [method private]
```

```Go
func (server *Server) getResponse() *Response
```

#### <a id="Server.readRequest" href="#Server.readRequest">func (server *Server) readRequest(codec ServerCodec) (service *service, mtype *methodType, req *Request, argv, replyv reflect.Value, keepReading bool, err error)</a>

```
searchKey: rpc.Server.readRequest
tags: [method private]
```

```Go
func (server *Server) readRequest(codec ServerCodec) (service *service, mtype *methodType, req *Request, argv, replyv reflect.Value, keepReading bool, err error)
```

#### <a id="Server.readRequestHeader" href="#Server.readRequestHeader">func (server *Server) readRequestHeader(codec ServerCodec) (svc *service, mtype *methodType, req *Request, keepReading bool, err error)</a>

```
searchKey: rpc.Server.readRequestHeader
tags: [method private]
```

```Go
func (server *Server) readRequestHeader(codec ServerCodec) (svc *service, mtype *methodType, req *Request, keepReading bool, err error)
```

#### <a id="Server.register" href="#Server.register">func (server *Server) register(rcvr interface{}, name string, useName bool) error</a>

```
searchKey: rpc.Server.register
tags: [method private]
```

```Go
func (server *Server) register(rcvr interface{}, name string, useName bool) error
```

#### <a id="Server.sendResponse" href="#Server.sendResponse">func (server *Server) sendResponse(sending *sync.Mutex, req *Request, reply interface{}, codec ServerCodec, errmsg string)</a>

```
searchKey: rpc.Server.sendResponse
tags: [method private]
```

```Go
func (server *Server) sendResponse(sending *sync.Mutex, req *Request, reply interface{}, codec ServerCodec, errmsg string)
```

### <a id="ServerCodec" href="#ServerCodec">type ServerCodec interface</a>

```
searchKey: rpc.ServerCodec
tags: [interface]
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

### <a id="ServerError" href="#ServerError">type ServerError string</a>

```
searchKey: rpc.ServerError
tags: [string]
```

```Go
type ServerError string
```

ServerError represents an error that has been returned from the remote side of the RPC connection. 

#### <a id="ServerError.Error" href="#ServerError.Error">func (e ServerError) Error() string</a>

```
searchKey: rpc.ServerError.Error
tags: [method]
```

```Go
func (e ServerError) Error() string
```

### <a id="WriteFailCodec" href="#WriteFailCodec">type WriteFailCodec int</a>

```
searchKey: rpc.WriteFailCodec
tags: [number private]
```

```Go
type WriteFailCodec int
```

#### <a id="WriteFailCodec.Close" href="#WriteFailCodec.Close">func (WriteFailCodec) Close() error</a>

```
searchKey: rpc.WriteFailCodec.Close
tags: [method private]
```

```Go
func (WriteFailCodec) Close() error
```

#### <a id="WriteFailCodec.ReadResponseBody" href="#WriteFailCodec.ReadResponseBody">func (WriteFailCodec) ReadResponseBody(interface{}) error</a>

```
searchKey: rpc.WriteFailCodec.ReadResponseBody
tags: [method private]
```

```Go
func (WriteFailCodec) ReadResponseBody(interface{}) error
```

#### <a id="WriteFailCodec.ReadResponseHeader" href="#WriteFailCodec.ReadResponseHeader">func (WriteFailCodec) ReadResponseHeader(*Response) error</a>

```
searchKey: rpc.WriteFailCodec.ReadResponseHeader
tags: [method private]
```

```Go
func (WriteFailCodec) ReadResponseHeader(*Response) error
```

#### <a id="WriteFailCodec.WriteRequest" href="#WriteFailCodec.WriteRequest">func (WriteFailCodec) WriteRequest(*Request, interface{}) error</a>

```
searchKey: rpc.WriteFailCodec.WriteRequest
tags: [method private]
```

```Go
func (WriteFailCodec) WriteRequest(*Request, interface{}) error
```

### <a id="debugHTTP" href="#debugHTTP">type debugHTTP struct</a>

```
searchKey: rpc.debugHTTP
tags: [struct private]
```

```Go
type debugHTTP struct {
	*Server
}
```

#### <a id="debugHTTP.ServeHTTP" href="#debugHTTP.ServeHTTP">func (server debugHTTP) ServeHTTP(w http.ResponseWriter, req *http.Request)</a>

```
searchKey: rpc.debugHTTP.ServeHTTP
tags: [method private]
```

```Go
func (server debugHTTP) ServeHTTP(w http.ResponseWriter, req *http.Request)
```

Runs at /debug/rpc 

### <a id="debugMethod" href="#debugMethod">type debugMethod struct</a>

```
searchKey: rpc.debugMethod
tags: [struct private]
```

```Go
type debugMethod struct {
	Type *methodType
	Name string
}
```

### <a id="debugService" href="#debugService">type debugService struct</a>

```
searchKey: rpc.debugService
tags: [struct private]
```

```Go
type debugService struct {
	Service *service
	Name    string
	Method  methodArray
}
```

### <a id="gobClientCodec" href="#gobClientCodec">type gobClientCodec struct</a>

```
searchKey: rpc.gobClientCodec
tags: [struct private]
```

```Go
type gobClientCodec struct {
	rwc    io.ReadWriteCloser
	dec    *gob.Decoder
	enc    *gob.Encoder
	encBuf *bufio.Writer
}
```

#### <a id="gobClientCodec.Close" href="#gobClientCodec.Close">func (c *gobClientCodec) Close() error</a>

```
searchKey: rpc.gobClientCodec.Close
tags: [method private]
```

```Go
func (c *gobClientCodec) Close() error
```

#### <a id="gobClientCodec.ReadResponseBody" href="#gobClientCodec.ReadResponseBody">func (c *gobClientCodec) ReadResponseBody(body interface{}) error</a>

```
searchKey: rpc.gobClientCodec.ReadResponseBody
tags: [method private]
```

```Go
func (c *gobClientCodec) ReadResponseBody(body interface{}) error
```

#### <a id="gobClientCodec.ReadResponseHeader" href="#gobClientCodec.ReadResponseHeader">func (c *gobClientCodec) ReadResponseHeader(r *Response) error</a>

```
searchKey: rpc.gobClientCodec.ReadResponseHeader
tags: [method private]
```

```Go
func (c *gobClientCodec) ReadResponseHeader(r *Response) error
```

#### <a id="gobClientCodec.WriteRequest" href="#gobClientCodec.WriteRequest">func (c *gobClientCodec) WriteRequest(r *Request, body interface{}) (err error)</a>

```
searchKey: rpc.gobClientCodec.WriteRequest
tags: [method private]
```

```Go
func (c *gobClientCodec) WriteRequest(r *Request, body interface{}) (err error)
```

### <a id="gobServerCodec" href="#gobServerCodec">type gobServerCodec struct</a>

```
searchKey: rpc.gobServerCodec
tags: [struct private]
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

#### <a id="gobServerCodec.Close" href="#gobServerCodec.Close">func (c *gobServerCodec) Close() error</a>

```
searchKey: rpc.gobServerCodec.Close
tags: [method private]
```

```Go
func (c *gobServerCodec) Close() error
```

#### <a id="gobServerCodec.ReadRequestBody" href="#gobServerCodec.ReadRequestBody">func (c *gobServerCodec) ReadRequestBody(body interface{}) error</a>

```
searchKey: rpc.gobServerCodec.ReadRequestBody
tags: [method private]
```

```Go
func (c *gobServerCodec) ReadRequestBody(body interface{}) error
```

#### <a id="gobServerCodec.ReadRequestHeader" href="#gobServerCodec.ReadRequestHeader">func (c *gobServerCodec) ReadRequestHeader(r *Request) error</a>

```
searchKey: rpc.gobServerCodec.ReadRequestHeader
tags: [method private]
```

```Go
func (c *gobServerCodec) ReadRequestHeader(r *Request) error
```

#### <a id="gobServerCodec.WriteResponse" href="#gobServerCodec.WriteResponse">func (c *gobServerCodec) WriteResponse(r *Response, body interface{}) (err error)</a>

```
searchKey: rpc.gobServerCodec.WriteResponse
tags: [method private]
```

```Go
func (c *gobServerCodec) WriteResponse(r *Response, body interface{}) (err error)
```

### <a id="hidden" href="#hidden">type hidden int</a>

```
searchKey: rpc.hidden
tags: [number private]
```

```Go
type hidden int
```

#### <a id="hidden.Exported" href="#hidden.Exported">func (t *hidden) Exported(args Args, reply *Reply) error</a>

```
searchKey: rpc.hidden.Exported
tags: [method private]
```

```Go
func (t *hidden) Exported(args Args, reply *Reply) error
```

### <a id="local" href="#local">type local struct{}</a>

```
searchKey: rpc.local
tags: [struct private]
```

```Go
type local struct{}
```

### <a id="methodArray" href="#methodArray">type methodArray []rpc.debugMethod</a>

```
searchKey: rpc.methodArray
tags: [array struct private]
```

```Go
type methodArray []debugMethod
```

#### <a id="methodArray.Len" href="#methodArray.Len">func (m methodArray) Len() int</a>

```
searchKey: rpc.methodArray.Len
tags: [method private]
```

```Go
func (m methodArray) Len() int
```

#### <a id="methodArray.Less" href="#methodArray.Less">func (m methodArray) Less(i, j int) bool</a>

```
searchKey: rpc.methodArray.Less
tags: [method private]
```

```Go
func (m methodArray) Less(i, j int) bool
```

#### <a id="methodArray.Swap" href="#methodArray.Swap">func (m methodArray) Swap(i, j int)</a>

```
searchKey: rpc.methodArray.Swap
tags: [method private]
```

```Go
func (m methodArray) Swap(i, j int)
```

### <a id="methodType" href="#methodType">type methodType struct</a>

```
searchKey: rpc.methodType
tags: [struct private]
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
tags: [method private]
```

```Go
func (m *methodType) NumCalls() (n uint)
```

### <a id="service" href="#service">type service struct</a>

```
searchKey: rpc.service
tags: [struct private]
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
tags: [method private]
```

```Go
func (s *service) call(server *Server, sending *sync.Mutex, wg *sync.WaitGroup, mtype *methodType, req *Request, argv, replyv reflect.Value, codec ServerCodec)
```

### <a id="serviceArray" href="#serviceArray">type serviceArray []rpc.debugService</a>

```
searchKey: rpc.serviceArray
tags: [array struct private]
```

```Go
type serviceArray []debugService
```

#### <a id="serviceArray.Len" href="#serviceArray.Len">func (s serviceArray) Len() int</a>

```
searchKey: rpc.serviceArray.Len
tags: [method private]
```

```Go
func (s serviceArray) Len() int
```

#### <a id="serviceArray.Less" href="#serviceArray.Less">func (s serviceArray) Less(i, j int) bool</a>

```
searchKey: rpc.serviceArray.Less
tags: [method private]
```

```Go
func (s serviceArray) Less(i, j int) bool
```

#### <a id="serviceArray.Swap" href="#serviceArray.Swap">func (s serviceArray) Swap(i, j int)</a>

```
searchKey: rpc.serviceArray.Swap
tags: [method private]
```

```Go
func (s serviceArray) Swap(i, j int)
```

### <a id="shutdownCodec" href="#shutdownCodec">type shutdownCodec struct</a>

```
searchKey: rpc.shutdownCodec
tags: [struct private]
```

```Go
type shutdownCodec struct {
	responded chan int
	closed    bool
}
```

#### <a id="shutdownCodec.Close" href="#shutdownCodec.Close">func (c *shutdownCodec) Close() error</a>

```
searchKey: rpc.shutdownCodec.Close
tags: [method private]
```

```Go
func (c *shutdownCodec) Close() error
```

#### <a id="shutdownCodec.ReadResponseBody" href="#shutdownCodec.ReadResponseBody">func (c *shutdownCodec) ReadResponseBody(interface{}) error</a>

```
searchKey: rpc.shutdownCodec.ReadResponseBody
tags: [method private]
```

```Go
func (c *shutdownCodec) ReadResponseBody(interface{}) error
```

#### <a id="shutdownCodec.ReadResponseHeader" href="#shutdownCodec.ReadResponseHeader">func (c *shutdownCodec) ReadResponseHeader(*Response) error</a>

```
searchKey: rpc.shutdownCodec.ReadResponseHeader
tags: [method private]
```

```Go
func (c *shutdownCodec) ReadResponseHeader(*Response) error
```

#### <a id="shutdownCodec.WriteRequest" href="#shutdownCodec.WriteRequest">func (c *shutdownCodec) WriteRequest(*Request, interface{}) error</a>

```
searchKey: rpc.shutdownCodec.WriteRequest
tags: [method private]
```

```Go
func (c *shutdownCodec) WriteRequest(*Request, interface{}) error
```

### <a id="writeCrasher" href="#writeCrasher">type writeCrasher struct</a>

```
searchKey: rpc.writeCrasher
tags: [struct private]
```

```Go
type writeCrasher struct {
	done chan bool
}
```

#### <a id="writeCrasher.Close" href="#writeCrasher.Close">func (writeCrasher) Close() error</a>

```
searchKey: rpc.writeCrasher.Close
tags: [method private]
```

```Go
func (writeCrasher) Close() error
```

#### <a id="writeCrasher.Read" href="#writeCrasher.Read">func (w *writeCrasher) Read(p []byte) (int, error)</a>

```
searchKey: rpc.writeCrasher.Read
tags: [method private]
```

```Go
func (w *writeCrasher) Read(p []byte) (int, error)
```

#### <a id="writeCrasher.Write" href="#writeCrasher.Write">func (writeCrasher) Write(p []byte) (int, error)</a>

```
searchKey: rpc.writeCrasher.Write
tags: [method private]
```

```Go
func (writeCrasher) Write(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="Accept" href="#Accept">func Accept(lis net.Listener)</a>

```
searchKey: rpc.Accept
tags: [function]
```

```Go
func Accept(lis net.Listener)
```

Accept accepts connections on the listener and serves requests to DefaultServer for each incoming connection. Accept blocks; the caller typically invokes it in a go statement. 

### <a id="BenchmarkEndToEnd" href="#BenchmarkEndToEnd">func BenchmarkEndToEnd(b *testing.B)</a>

```
searchKey: rpc.BenchmarkEndToEnd
tags: [function private benchmark]
```

```Go
func BenchmarkEndToEnd(b *testing.B)
```

### <a id="BenchmarkEndToEndAsync" href="#BenchmarkEndToEndAsync">func BenchmarkEndToEndAsync(b *testing.B)</a>

```
searchKey: rpc.BenchmarkEndToEndAsync
tags: [function private benchmark]
```

```Go
func BenchmarkEndToEndAsync(b *testing.B)
```

### <a id="BenchmarkEndToEndAsyncHTTP" href="#BenchmarkEndToEndAsyncHTTP">func BenchmarkEndToEndAsyncHTTP(b *testing.B)</a>

```
searchKey: rpc.BenchmarkEndToEndAsyncHTTP
tags: [function private benchmark]
```

```Go
func BenchmarkEndToEndAsyncHTTP(b *testing.B)
```

### <a id="BenchmarkEndToEndHTTP" href="#BenchmarkEndToEndHTTP">func BenchmarkEndToEndHTTP(b *testing.B)</a>

```
searchKey: rpc.BenchmarkEndToEndHTTP
tags: [function private benchmark]
```

```Go
func BenchmarkEndToEndHTTP(b *testing.B)
```

### <a id="HandleHTTP" href="#HandleHTTP">func HandleHTTP()</a>

```
searchKey: rpc.HandleHTTP
tags: [function]
```

```Go
func HandleHTTP()
```

HandleHTTP registers an HTTP handler for RPC messages to DefaultServer on DefaultRPCPath and a debugging handler on DefaultDebugPath. It is still necessary to invoke http.Serve(), typically in a go statement. 

### <a id="Register" href="#Register">func Register(rcvr interface{}) error</a>

```
searchKey: rpc.Register
tags: [function]
```

```Go
func Register(rcvr interface{}) error
```

Register publishes the receiver's methods in the DefaultServer. 

### <a id="RegisterName" href="#RegisterName">func RegisterName(name string, rcvr interface{}) error</a>

```
searchKey: rpc.RegisterName
tags: [function]
```

```Go
func RegisterName(name string, rcvr interface{}) error
```

RegisterName is like Register but uses the provided name for the type instead of the receiver's concrete type. 

### <a id="ServeCodec" href="#ServeCodec">func ServeCodec(codec ServerCodec)</a>

```
searchKey: rpc.ServeCodec
tags: [function]
```

```Go
func ServeCodec(codec ServerCodec)
```

ServeCodec is like ServeConn but uses the specified codec to decode requests and encode responses. 

### <a id="ServeConn" href="#ServeConn">func ServeConn(conn io.ReadWriteCloser)</a>

```
searchKey: rpc.ServeConn
tags: [function]
```

```Go
func ServeConn(conn io.ReadWriteCloser)
```

ServeConn runs the DefaultServer on a single connection. ServeConn blocks, serving the connection until the client hangs up. The caller typically invokes ServeConn in a go statement. ServeConn uses the gob wire format (see package gob) on the connection. To use an alternate codec, use ServeCodec. See NewClient's comment for information about concurrent access. 

### <a id="ServeRequest" href="#ServeRequest">func ServeRequest(codec ServerCodec) error</a>

```
searchKey: rpc.ServeRequest
tags: [function]
```

```Go
func ServeRequest(codec ServerCodec) error
```

ServeRequest is like ServeCodec but synchronously serves a single request. It does not close the codec upon completion. 

### <a id="TestAcceptExitAfterListenerClose" href="#TestAcceptExitAfterListenerClose">func TestAcceptExitAfterListenerClose(t *testing.T)</a>

```
searchKey: rpc.TestAcceptExitAfterListenerClose
tags: [function private test]
```

```Go
func TestAcceptExitAfterListenerClose(t *testing.T)
```

Tests the fix to issue 11221. Without the fix, this loops forever or crashes. 

### <a id="TestBuiltinTypes" href="#TestBuiltinTypes">func TestBuiltinTypes(t *testing.T)</a>

```
searchKey: rpc.TestBuiltinTypes
tags: [function private test]
```

```Go
func TestBuiltinTypes(t *testing.T)
```

### <a id="TestClientWriteError" href="#TestClientWriteError">func TestClientWriteError(t *testing.T)</a>

```
searchKey: rpc.TestClientWriteError
tags: [function private test]
```

```Go
func TestClientWriteError(t *testing.T)
```

### <a id="TestCloseCodec" href="#TestCloseCodec">func TestCloseCodec(t *testing.T)</a>

```
searchKey: rpc.TestCloseCodec
tags: [function private test]
```

```Go
func TestCloseCodec(t *testing.T)
```

### <a id="TestCountMallocs" href="#TestCountMallocs">func TestCountMallocs(t *testing.T)</a>

```
searchKey: rpc.TestCountMallocs
tags: [function private test]
```

```Go
func TestCountMallocs(t *testing.T)
```

### <a id="TestCountMallocsOverHTTP" href="#TestCountMallocsOverHTTP">func TestCountMallocsOverHTTP(t *testing.T)</a>

```
searchKey: rpc.TestCountMallocsOverHTTP
tags: [function private test]
```

```Go
func TestCountMallocsOverHTTP(t *testing.T)
```

### <a id="TestErrorAfterClientClose" href="#TestErrorAfterClientClose">func TestErrorAfterClientClose(t *testing.T)</a>

```
searchKey: rpc.TestErrorAfterClientClose
tags: [function private test]
```

```Go
func TestErrorAfterClientClose(t *testing.T)
```

### <a id="TestGobError" href="#TestGobError">func TestGobError(t *testing.T)</a>

```
searchKey: rpc.TestGobError
tags: [function private test]
```

```Go
func TestGobError(t *testing.T)
```

### <a id="TestHTTP" href="#TestHTTP">func TestHTTP(t *testing.T)</a>

```
searchKey: rpc.TestHTTP
tags: [function private test]
```

```Go
func TestHTTP(t *testing.T)
```

### <a id="TestRPC" href="#TestRPC">func TestRPC(t *testing.T)</a>

```
searchKey: rpc.TestRPC
tags: [function private test]
```

```Go
func TestRPC(t *testing.T)
```

### <a id="TestRegistrationError" href="#TestRegistrationError">func TestRegistrationError(t *testing.T)</a>

```
searchKey: rpc.TestRegistrationError
tags: [function private test]
```

```Go
func TestRegistrationError(t *testing.T)
```

Check that registration handles lots of bad methods and a type with no suitable methods. 

### <a id="TestSendDeadlock" href="#TestSendDeadlock">func TestSendDeadlock(t *testing.T)</a>

```
searchKey: rpc.TestSendDeadlock
tags: [function private test]
```

```Go
func TestSendDeadlock(t *testing.T)
```

### <a id="TestServeRequest" href="#TestServeRequest">func TestServeRequest(t *testing.T)</a>

```
searchKey: rpc.TestServeRequest
tags: [function private test]
```

```Go
func TestServeRequest(t *testing.T)
```

### <a id="TestShutdown" href="#TestShutdown">func TestShutdown(t *testing.T)</a>

```
searchKey: rpc.TestShutdown
tags: [function private test]
```

```Go
func TestShutdown(t *testing.T)
```

### <a id="TestTCPClose" href="#TestTCPClose">func TestTCPClose(t *testing.T)</a>

```
searchKey: rpc.TestTCPClose
tags: [function private test]
```

```Go
func TestTCPClose(t *testing.T)
```

### <a id="benchmarkEndToEnd" href="#benchmarkEndToEnd">func benchmarkEndToEnd(dial func() (*Client, error), b *testing.B)</a>

```
searchKey: rpc.benchmarkEndToEnd
tags: [function private]
```

```Go
func benchmarkEndToEnd(dial func() (*Client, error), b *testing.B)
```

### <a id="benchmarkEndToEndAsync" href="#benchmarkEndToEndAsync">func benchmarkEndToEndAsync(dial func() (*Client, error), b *testing.B)</a>

```
searchKey: rpc.benchmarkEndToEndAsync
tags: [function private]
```

```Go
func benchmarkEndToEndAsync(dial func() (*Client, error), b *testing.B)
```

### <a id="countMallocs" href="#countMallocs">func countMallocs(dial func() (*Client, error), t *testing.T) float64</a>

```
searchKey: rpc.countMallocs
tags: [function private]
```

```Go
func countMallocs(dial func() (*Client, error), t *testing.T) float64
```

### <a id="isExportedOrBuiltinType" href="#isExportedOrBuiltinType">func isExportedOrBuiltinType(t reflect.Type) bool</a>

```
searchKey: rpc.isExportedOrBuiltinType
tags: [function private]
```

```Go
func isExportedOrBuiltinType(t reflect.Type) bool
```

Is this type exported or a builtin? 

### <a id="listenTCP" href="#listenTCP">func listenTCP() (net.Listener, string)</a>

```
searchKey: rpc.listenTCP
tags: [function private]
```

```Go
func listenTCP() (net.Listener, string)
```

### <a id="startHttpServer" href="#startHttpServer">func startHttpServer()</a>

```
searchKey: rpc.startHttpServer
tags: [function private]
```

```Go
func startHttpServer()
```

### <a id="startNewServer" href="#startNewServer">func startNewServer()</a>

```
searchKey: rpc.startNewServer
tags: [function private]
```

```Go
func startNewServer()
```

### <a id="startServer" href="#startServer">func startServer()</a>

```
searchKey: rpc.startServer
tags: [function private]
```

```Go
func startServer()
```

### <a id="suitableMethods" href="#suitableMethods">func suitableMethods(typ reflect.Type, reportErr bool) map[string]*methodType</a>

```
searchKey: rpc.suitableMethods
tags: [function private]
```

```Go
func suitableMethods(typ reflect.Type, reportErr bool) map[string]*methodType
```

suitableMethods returns suitable Rpc methods of typ, it will report error using log if reportErr is true. 

### <a id="testHTTPRPC" href="#testHTTPRPC">func testHTTPRPC(t *testing.T, path string)</a>

```
searchKey: rpc.testHTTPRPC
tags: [function private]
```

```Go
func testHTTPRPC(t *testing.T, path string)
```

### <a id="testNewServerRPC" href="#testNewServerRPC">func testNewServerRPC(t *testing.T, addr string)</a>

```
searchKey: rpc.testNewServerRPC
tags: [function private]
```

```Go
func testNewServerRPC(t *testing.T, addr string)
```

### <a id="testRPC" href="#testRPC">func testRPC(t *testing.T, addr string)</a>

```
searchKey: rpc.testRPC
tags: [function private]
```

```Go
func testRPC(t *testing.T, addr string)
```

### <a id="testSendDeadlock" href="#testSendDeadlock">func testSendDeadlock(client *Client)</a>

```
searchKey: rpc.testSendDeadlock
tags: [function private]
```

```Go
func testSendDeadlock(client *Client)
```

### <a id="testServeRequest" href="#testServeRequest">func testServeRequest(t *testing.T, server *Server)</a>

```
searchKey: rpc.testServeRequest
tags: [function private]
```

```Go
func testServeRequest(t *testing.T, server *Server)
```

