# Package syslog

Package syslog provides a simple interface to the system log service. It can send messages to the syslog daemon using UNIX domain sockets, UDP or TCP. 

Only one call to Dial is necessary. On write failures, the syslog client will attempt to reconnect to the server and write again. 

The syslog package is frozen and is not accepting new features. Some external packages provide more functionality. See: 

```
[https://godoc.org/?q=syslog](https://godoc.org/?q=syslog)

```
## Index

* [Constants](#const)
    * [const LOG_ALERT](#LOG_ALERT)
    * [const LOG_AUTH](#LOG_AUTH)
    * [const LOG_AUTHPRIV](#LOG_AUTHPRIV)
    * [const LOG_CRIT](#LOG_CRIT)
    * [const LOG_CRON](#LOG_CRON)
    * [const LOG_DAEMON](#LOG_DAEMON)
    * [const LOG_DEBUG](#LOG_DEBUG)
    * [const LOG_EMERG](#LOG_EMERG)
    * [const LOG_ERR](#LOG_ERR)
    * [const LOG_FTP](#LOG_FTP)
    * [const LOG_INFO](#LOG_INFO)
    * [const LOG_KERN](#LOG_KERN)
    * [const LOG_LOCAL0](#LOG_LOCAL0)
    * [const LOG_LOCAL1](#LOG_LOCAL1)
    * [const LOG_LOCAL2](#LOG_LOCAL2)
    * [const LOG_LOCAL3](#LOG_LOCAL3)
    * [const LOG_LOCAL4](#LOG_LOCAL4)
    * [const LOG_LOCAL5](#LOG_LOCAL5)
    * [const LOG_LOCAL6](#LOG_LOCAL6)
    * [const LOG_LOCAL7](#LOG_LOCAL7)
    * [const LOG_LPR](#LOG_LPR)
    * [const LOG_MAIL](#LOG_MAIL)
    * [const LOG_NEWS](#LOG_NEWS)
    * [const LOG_NOTICE](#LOG_NOTICE)
    * [const LOG_SYSLOG](#LOG_SYSLOG)
    * [const LOG_USER](#LOG_USER)
    * [const LOG_UUCP](#LOG_UUCP)
    * [const LOG_WARNING](#LOG_WARNING)
    * [const facilityMask](#facilityMask)
    * [const severityMask](#severityMask)
* [Variables](#var)
    * [var crashy](#crashy)
* [Types](#type)
    * [type Priority int](#Priority)
    * [type Writer struct](#Writer)
        * [func Dial(network, raddr string, priority Priority, tag string) (*Writer, error)](#Dial)
        * [func New(priority Priority, tag string) (*Writer, error)](#New)
        * [func (w *Writer) Alert(m string) error](#Writer.Alert)
        * [func (w *Writer) Close() error](#Writer.Close)
        * [func (w *Writer) Crit(m string) error](#Writer.Crit)
        * [func (w *Writer) Debug(m string) error](#Writer.Debug)
        * [func (w *Writer) Emerg(m string) error](#Writer.Emerg)
        * [func (w *Writer) Err(m string) error](#Writer.Err)
        * [func (w *Writer) Info(m string) error](#Writer.Info)
        * [func (w *Writer) Notice(m string) error](#Writer.Notice)
        * [func (w *Writer) Warning(m string) error](#Writer.Warning)
        * [func (w *Writer) Write(b []byte) (int, error)](#Writer.Write)
        * [func (w *Writer) connect() (err error)](#Writer.connect)
        * [func (w *Writer) write(p Priority, msg string) (int, error)](#Writer.write)
        * [func (w *Writer) writeAndRetry(p Priority, s string) (int, error)](#Writer.writeAndRetry)
    * [type netConn struct](#netConn)
        * [func (n *netConn) close() error](#netConn.close)
        * [func (n *netConn) writeString(p Priority, hostname, tag, msg, nl string) error](#netConn.writeString)
    * [type serverConn interface](#serverConn)
        * [func unixSyslog() (conn serverConn, err error)](#unixSyslog)
* [Functions](#func)
    * [func NewLogger(p Priority, logFlag int) (*log.Logger, error)](#NewLogger)
    * [func TestConcurrentReconnect(t *testing.T)](#TestConcurrentReconnect)
    * [func TestConcurrentWrite(t *testing.T)](#TestConcurrentWrite)
    * [func TestDial(t *testing.T)](#TestDial)
    * [func TestFlap(t *testing.T)](#TestFlap)
    * [func TestNew(t *testing.T)](#TestNew)
    * [func TestNewLogger(t *testing.T)](#TestNewLogger)
    * [func TestWithSimulated(t *testing.T)](#TestWithSimulated)
    * [func TestWrite(t *testing.T)](#TestWrite)
    * [func check(t *testing.T, in, out, transport string)](#check)
    * [func runPktSyslog(c net.PacketConn, done chan<- string)](#runPktSyslog)
    * [func runStreamSyslog(l net.Listener, done chan<- string, wg *sync.WaitGroup)](#runStreamSyslog)
    * [func startServer(n, la string, done chan<- string) (addr string, sock io.Closer, wg *sync.WaitGroup)](#startServer)
    * [func testableNetwork(network string) bool](#testableNetwork)


## <a id="const" href="#const">Constants</a>

### <a id="LOG_ALERT" href="#LOG_ALERT">const LOG_ALERT</a>

```
searchKey: syslog.LOG_ALERT
tags: [constant number]
```

```Go
const LOG_ALERT
```

### <a id="LOG_AUTH" href="#LOG_AUTH">const LOG_AUTH</a>

```
searchKey: syslog.LOG_AUTH
tags: [constant number]
```

```Go
const LOG_AUTH
```

### <a id="LOG_AUTHPRIV" href="#LOG_AUTHPRIV">const LOG_AUTHPRIV</a>

```
searchKey: syslog.LOG_AUTHPRIV
tags: [constant number]
```

```Go
const LOG_AUTHPRIV
```

### <a id="LOG_CRIT" href="#LOG_CRIT">const LOG_CRIT</a>

```
searchKey: syslog.LOG_CRIT
tags: [constant number]
```

```Go
const LOG_CRIT
```

### <a id="LOG_CRON" href="#LOG_CRON">const LOG_CRON</a>

```
searchKey: syslog.LOG_CRON
tags: [constant number]
```

```Go
const LOG_CRON
```

### <a id="LOG_DAEMON" href="#LOG_DAEMON">const LOG_DAEMON</a>

```
searchKey: syslog.LOG_DAEMON
tags: [constant number]
```

```Go
const LOG_DAEMON
```

### <a id="LOG_DEBUG" href="#LOG_DEBUG">const LOG_DEBUG</a>

```
searchKey: syslog.LOG_DEBUG
tags: [constant number]
```

```Go
const LOG_DEBUG
```

### <a id="LOG_EMERG" href="#LOG_EMERG">const LOG_EMERG</a>

```
searchKey: syslog.LOG_EMERG
tags: [constant number]
```

```Go
const LOG_EMERG Priority = iota
```

From /usr/include/sys/syslog.h. These are the same on Linux, BSD, and OS X. 

### <a id="LOG_ERR" href="#LOG_ERR">const LOG_ERR</a>

```
searchKey: syslog.LOG_ERR
tags: [constant number]
```

```Go
const LOG_ERR
```

### <a id="LOG_FTP" href="#LOG_FTP">const LOG_FTP</a>

```
searchKey: syslog.LOG_FTP
tags: [constant number]
```

```Go
const LOG_FTP
```

### <a id="LOG_INFO" href="#LOG_INFO">const LOG_INFO</a>

```
searchKey: syslog.LOG_INFO
tags: [constant number]
```

```Go
const LOG_INFO
```

### <a id="LOG_KERN" href="#LOG_KERN">const LOG_KERN</a>

```
searchKey: syslog.LOG_KERN
tags: [constant number]
```

```Go
const LOG_KERN Priority = iota << 3
```

From /usr/include/sys/syslog.h. These are the same up to LOG_FTP on Linux, BSD, and OS X. 

### <a id="LOG_LOCAL0" href="#LOG_LOCAL0">const LOG_LOCAL0</a>

```
searchKey: syslog.LOG_LOCAL0
tags: [constant number]
```

```Go
const LOG_LOCAL0
```

### <a id="LOG_LOCAL1" href="#LOG_LOCAL1">const LOG_LOCAL1</a>

```
searchKey: syslog.LOG_LOCAL1
tags: [constant number]
```

```Go
const LOG_LOCAL1
```

### <a id="LOG_LOCAL2" href="#LOG_LOCAL2">const LOG_LOCAL2</a>

```
searchKey: syslog.LOG_LOCAL2
tags: [constant number]
```

```Go
const LOG_LOCAL2
```

### <a id="LOG_LOCAL3" href="#LOG_LOCAL3">const LOG_LOCAL3</a>

```
searchKey: syslog.LOG_LOCAL3
tags: [constant number]
```

```Go
const LOG_LOCAL3
```

### <a id="LOG_LOCAL4" href="#LOG_LOCAL4">const LOG_LOCAL4</a>

```
searchKey: syslog.LOG_LOCAL4
tags: [constant number]
```

```Go
const LOG_LOCAL4
```

### <a id="LOG_LOCAL5" href="#LOG_LOCAL5">const LOG_LOCAL5</a>

```
searchKey: syslog.LOG_LOCAL5
tags: [constant number]
```

```Go
const LOG_LOCAL5
```

### <a id="LOG_LOCAL6" href="#LOG_LOCAL6">const LOG_LOCAL6</a>

```
searchKey: syslog.LOG_LOCAL6
tags: [constant number]
```

```Go
const LOG_LOCAL6
```

### <a id="LOG_LOCAL7" href="#LOG_LOCAL7">const LOG_LOCAL7</a>

```
searchKey: syslog.LOG_LOCAL7
tags: [constant number]
```

```Go
const LOG_LOCAL7
```

### <a id="LOG_LPR" href="#LOG_LPR">const LOG_LPR</a>

```
searchKey: syslog.LOG_LPR
tags: [constant number]
```

```Go
const LOG_LPR
```

### <a id="LOG_MAIL" href="#LOG_MAIL">const LOG_MAIL</a>

```
searchKey: syslog.LOG_MAIL
tags: [constant number]
```

```Go
const LOG_MAIL
```

### <a id="LOG_NEWS" href="#LOG_NEWS">const LOG_NEWS</a>

```
searchKey: syslog.LOG_NEWS
tags: [constant number]
```

```Go
const LOG_NEWS
```

### <a id="LOG_NOTICE" href="#LOG_NOTICE">const LOG_NOTICE</a>

```
searchKey: syslog.LOG_NOTICE
tags: [constant number]
```

```Go
const LOG_NOTICE
```

### <a id="LOG_SYSLOG" href="#LOG_SYSLOG">const LOG_SYSLOG</a>

```
searchKey: syslog.LOG_SYSLOG
tags: [constant number]
```

```Go
const LOG_SYSLOG
```

### <a id="LOG_USER" href="#LOG_USER">const LOG_USER</a>

```
searchKey: syslog.LOG_USER
tags: [constant number]
```

```Go
const LOG_USER
```

### <a id="LOG_UUCP" href="#LOG_UUCP">const LOG_UUCP</a>

```
searchKey: syslog.LOG_UUCP
tags: [constant number]
```

```Go
const LOG_UUCP
```

### <a id="LOG_WARNING" href="#LOG_WARNING">const LOG_WARNING</a>

```
searchKey: syslog.LOG_WARNING
tags: [constant number]
```

```Go
const LOG_WARNING
```

### <a id="facilityMask" href="#facilityMask">const facilityMask</a>

```
searchKey: syslog.facilityMask
tags: [constant number private]
```

```Go
const facilityMask = 0xf8
```

### <a id="severityMask" href="#severityMask">const severityMask</a>

```
searchKey: syslog.severityMask
tags: [constant number private]
```

```Go
const severityMask = 0x07
```

## <a id="var" href="#var">Variables</a>

### <a id="crashy" href="#crashy">var crashy</a>

```
searchKey: syslog.crashy
tags: [variable boolean private]
```

```Go
var crashy = false
```

## <a id="type" href="#type">Types</a>

### <a id="Priority" href="#Priority">type Priority int</a>

```
searchKey: syslog.Priority
tags: [number]
```

```Go
type Priority int
```

The Priority is a combination of the syslog facility and severity. For example, LOG_ALERT | LOG_FTP sends an alert severity message from the FTP facility. The default severity is LOG_EMERG; the default facility is LOG_KERN. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: syslog.Writer
tags: [struct]
```

```Go
type Writer struct {
	priority Priority
	tag      string
	hostname string
	network  string
	raddr    string

	mu   sync.Mutex // guards conn
	conn serverConn
}
```

A Writer is a connection to a syslog server. 

#### <a id="Dial" href="#Dial">func Dial(network, raddr string, priority Priority, tag string) (*Writer, error)</a>

```
searchKey: syslog.Dial
tags: [function]
```

```Go
func Dial(network, raddr string, priority Priority, tag string) (*Writer, error)
```

Dial establishes a connection to a log daemon by connecting to address raddr on the specified network. Each write to the returned writer sends a log message with the facility and severity (from priority) and tag. If tag is empty, the os.Args[0] is used. If network is empty, Dial will connect to the local syslog server. Otherwise, see the documentation for net.Dial for valid values of network and raddr. 

#### <a id="New" href="#New">func New(priority Priority, tag string) (*Writer, error)</a>

```
searchKey: syslog.New
tags: [function]
```

```Go
func New(priority Priority, tag string) (*Writer, error)
```

New establishes a new connection to the system log daemon. Each write to the returned writer sends a log message with the given priority (a combination of the syslog facility and severity) and prefix tag. If tag is empty, the os.Args[0] is used. 

#### <a id="Writer.Alert" href="#Writer.Alert">func (w *Writer) Alert(m string) error</a>

```
searchKey: syslog.Writer.Alert
tags: [method]
```

```Go
func (w *Writer) Alert(m string) error
```

Alert logs a message with severity LOG_ALERT, ignoring the severity passed to New. 

#### <a id="Writer.Close" href="#Writer.Close">func (w *Writer) Close() error</a>

```
searchKey: syslog.Writer.Close
tags: [method]
```

```Go
func (w *Writer) Close() error
```

Close closes a connection to the syslog daemon. 

#### <a id="Writer.Crit" href="#Writer.Crit">func (w *Writer) Crit(m string) error</a>

```
searchKey: syslog.Writer.Crit
tags: [method]
```

```Go
func (w *Writer) Crit(m string) error
```

Crit logs a message with severity LOG_CRIT, ignoring the severity passed to New. 

#### <a id="Writer.Debug" href="#Writer.Debug">func (w *Writer) Debug(m string) error</a>

```
searchKey: syslog.Writer.Debug
tags: [method]
```

```Go
func (w *Writer) Debug(m string) error
```

Debug logs a message with severity LOG_DEBUG, ignoring the severity passed to New. 

#### <a id="Writer.Emerg" href="#Writer.Emerg">func (w *Writer) Emerg(m string) error</a>

```
searchKey: syslog.Writer.Emerg
tags: [method]
```

```Go
func (w *Writer) Emerg(m string) error
```

Emerg logs a message with severity LOG_EMERG, ignoring the severity passed to New. 

#### <a id="Writer.Err" href="#Writer.Err">func (w *Writer) Err(m string) error</a>

```
searchKey: syslog.Writer.Err
tags: [method]
```

```Go
func (w *Writer) Err(m string) error
```

Err logs a message with severity LOG_ERR, ignoring the severity passed to New. 

#### <a id="Writer.Info" href="#Writer.Info">func (w *Writer) Info(m string) error</a>

```
searchKey: syslog.Writer.Info
tags: [method]
```

```Go
func (w *Writer) Info(m string) error
```

Info logs a message with severity LOG_INFO, ignoring the severity passed to New. 

#### <a id="Writer.Notice" href="#Writer.Notice">func (w *Writer) Notice(m string) error</a>

```
searchKey: syslog.Writer.Notice
tags: [method]
```

```Go
func (w *Writer) Notice(m string) error
```

Notice logs a message with severity LOG_NOTICE, ignoring the severity passed to New. 

#### <a id="Writer.Warning" href="#Writer.Warning">func (w *Writer) Warning(m string) error</a>

```
searchKey: syslog.Writer.Warning
tags: [method]
```

```Go
func (w *Writer) Warning(m string) error
```

Warning logs a message with severity LOG_WARNING, ignoring the severity passed to New. 

#### <a id="Writer.Write" href="#Writer.Write">func (w *Writer) Write(b []byte) (int, error)</a>

```
searchKey: syslog.Writer.Write
tags: [method]
```

```Go
func (w *Writer) Write(b []byte) (int, error)
```

Write sends a log message to the syslog daemon. 

#### <a id="Writer.connect" href="#Writer.connect">func (w *Writer) connect() (err error)</a>

```
searchKey: syslog.Writer.connect
tags: [method private]
```

```Go
func (w *Writer) connect() (err error)
```

connect makes a connection to the syslog server. It must be called with w.mu held. 

#### <a id="Writer.write" href="#Writer.write">func (w *Writer) write(p Priority, msg string) (int, error)</a>

```
searchKey: syslog.Writer.write
tags: [method private]
```

```Go
func (w *Writer) write(p Priority, msg string) (int, error)
```

write generates and writes a syslog formatted string. The format is as follows: <PRI>TIMESTAMP HOSTNAME TAG[PID]: MSG 

#### <a id="Writer.writeAndRetry" href="#Writer.writeAndRetry">func (w *Writer) writeAndRetry(p Priority, s string) (int, error)</a>

```
searchKey: syslog.Writer.writeAndRetry
tags: [method private]
```

```Go
func (w *Writer) writeAndRetry(p Priority, s string) (int, error)
```

### <a id="netConn" href="#netConn">type netConn struct</a>

```
searchKey: syslog.netConn
tags: [struct private]
```

```Go
type netConn struct {
	local bool
	conn  net.Conn
}
```

#### <a id="netConn.close" href="#netConn.close">func (n *netConn) close() error</a>

```
searchKey: syslog.netConn.close
tags: [method private]
```

```Go
func (n *netConn) close() error
```

#### <a id="netConn.writeString" href="#netConn.writeString">func (n *netConn) writeString(p Priority, hostname, tag, msg, nl string) error</a>

```
searchKey: syslog.netConn.writeString
tags: [method private]
```

```Go
func (n *netConn) writeString(p Priority, hostname, tag, msg, nl string) error
```

### <a id="serverConn" href="#serverConn">type serverConn interface</a>

```
searchKey: syslog.serverConn
tags: [interface private]
```

```Go
type serverConn interface {
	writeString(p Priority, hostname, tag, s, nl string) error
	close() error
}
```

This interface and the separate syslog_unix.go file exist for Solaris support as implemented by gccgo. On Solaris you cannot simply open a TCP connection to the syslog daemon. The gccgo sources have a syslog_solaris.go file that implements unixSyslog to return a type that satisfies this interface and simply calls the C library syslog function. 

#### <a id="unixSyslog" href="#unixSyslog">func unixSyslog() (conn serverConn, err error)</a>

```
searchKey: syslog.unixSyslog
tags: [function private]
```

```Go
func unixSyslog() (conn serverConn, err error)
```

## <a id="func" href="#func">Functions</a>

### <a id="NewLogger" href="#NewLogger">func NewLogger(p Priority, logFlag int) (*log.Logger, error)</a>

```
searchKey: syslog.NewLogger
tags: [function]
```

```Go
func NewLogger(p Priority, logFlag int) (*log.Logger, error)
```

NewLogger creates a log.Logger whose output is written to the system log service with the specified priority, a combination of the syslog facility and severity. The logFlag argument is the flag set passed through to log.New to create the Logger. 

### <a id="TestConcurrentReconnect" href="#TestConcurrentReconnect">func TestConcurrentReconnect(t *testing.T)</a>

```
searchKey: syslog.TestConcurrentReconnect
tags: [function private test]
```

```Go
func TestConcurrentReconnect(t *testing.T)
```

### <a id="TestConcurrentWrite" href="#TestConcurrentWrite">func TestConcurrentWrite(t *testing.T)</a>

```
searchKey: syslog.TestConcurrentWrite
tags: [function private test]
```

```Go
func TestConcurrentWrite(t *testing.T)
```

### <a id="TestDial" href="#TestDial">func TestDial(t *testing.T)</a>

```
searchKey: syslog.TestDial
tags: [function private test]
```

```Go
func TestDial(t *testing.T)
```

### <a id="TestFlap" href="#TestFlap">func TestFlap(t *testing.T)</a>

```
searchKey: syslog.TestFlap
tags: [function private test]
```

```Go
func TestFlap(t *testing.T)
```

### <a id="TestNew" href="#TestNew">func TestNew(t *testing.T)</a>

```
searchKey: syslog.TestNew
tags: [function private test]
```

```Go
func TestNew(t *testing.T)
```

### <a id="TestNewLogger" href="#TestNewLogger">func TestNewLogger(t *testing.T)</a>

```
searchKey: syslog.TestNewLogger
tags: [function private test]
```

```Go
func TestNewLogger(t *testing.T)
```

### <a id="TestWithSimulated" href="#TestWithSimulated">func TestWithSimulated(t *testing.T)</a>

```
searchKey: syslog.TestWithSimulated
tags: [function private test]
```

```Go
func TestWithSimulated(t *testing.T)
```

### <a id="TestWrite" href="#TestWrite">func TestWrite(t *testing.T)</a>

```
searchKey: syslog.TestWrite
tags: [function private test]
```

```Go
func TestWrite(t *testing.T)
```

### <a id="check" href="#check">func check(t *testing.T, in, out, transport string)</a>

```
searchKey: syslog.check
tags: [function private]
```

```Go
func check(t *testing.T, in, out, transport string)
```

### <a id="runPktSyslog" href="#runPktSyslog">func runPktSyslog(c net.PacketConn, done chan<- string)</a>

```
searchKey: syslog.runPktSyslog
tags: [function private]
```

```Go
func runPktSyslog(c net.PacketConn, done chan<- string)
```

### <a id="runStreamSyslog" href="#runStreamSyslog">func runStreamSyslog(l net.Listener, done chan<- string, wg *sync.WaitGroup)</a>

```
searchKey: syslog.runStreamSyslog
tags: [function private]
```

```Go
func runStreamSyslog(l net.Listener, done chan<- string, wg *sync.WaitGroup)
```

### <a id="startServer" href="#startServer">func startServer(n, la string, done chan<- string) (addr string, sock io.Closer, wg *sync.WaitGroup)</a>

```
searchKey: syslog.startServer
tags: [function private]
```

```Go
func startServer(n, la string, done chan<- string) (addr string, sock io.Closer, wg *sync.WaitGroup)
```

### <a id="testableNetwork" href="#testableNetwork">func testableNetwork(network string) bool</a>

```
searchKey: syslog.testableNetwork
tags: [function private]
```

```Go
func testableNetwork(network string) bool
```

