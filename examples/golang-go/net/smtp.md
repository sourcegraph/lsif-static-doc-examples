# Package smtp

Package smtp implements the Simple Mail Transfer Protocol as defined in RFC 5321. It also implements the following extensions: 

```
8BITMIME  RFC 1652
AUTH      RFC 2554
STARTTLS  RFC 3207

```
Additional extensions may be handled by clients. 

The smtp package is frozen and is not accepting new features. Some external packages provide more functionality. See: 

```
[https://godoc.org/?q=smtp](https://godoc.org/?q=smtp)

```
## Index

* [Variables](#var)
    * [var testHookStartTLS](#testHookStartTLS)
    * [var authTests](#authTests)
    * [var basicServer](#basicServer)
    * [var basicClient](#basicClient)
    * [var newClientServer](#newClientServer)
    * [var newClientClient](#newClientClient)
    * [var newClient2Server](#newClient2Server)
    * [var newClient2Client](#newClient2Client)
    * [var baseHelloServer](#baseHelloServer)
    * [var helloServer](#helloServer)
    * [var baseHelloClient](#baseHelloClient)
    * [var helloClient](#helloClient)
    * [var sendMailServer](#sendMailServer)
    * [var sendMailClient](#sendMailClient)
    * [var authFailedServer](#authFailedServer)
    * [var authFailedClient](#authFailedClient)
    * [var localhostCert](#localhostCert)
    * [var localhostKey](#localhostKey)
* [Types](#type)
    * [type Auth interface](#Auth)
        * [func PlainAuth(identity, username, password, host string) Auth](#PlainAuth)
        * [func CRAMMD5Auth(username, secret string) Auth](#CRAMMD5Auth)
    * [type ServerInfo struct](#ServerInfo)
    * [type plainAuth struct](#plainAuth)
        * [func (a *plainAuth) Start(server *ServerInfo) (string, []byte, error)](#plainAuth.Start)
        * [func (a *plainAuth) Next(fromServer []byte, more bool) ([]byte, error)](#plainAuth.Next)
    * [type cramMD5Auth struct](#cramMD5Auth)
        * [func (a *cramMD5Auth) Start(server *ServerInfo) (string, []byte, error)](#cramMD5Auth.Start)
        * [func (a *cramMD5Auth) Next(fromServer []byte, more bool) ([]byte, error)](#cramMD5Auth.Next)
    * [type Client struct](#Client)
        * [func Dial(addr string) (*Client, error)](#Dial)
        * [func NewClient(conn net.Conn, host string) (*Client, error)](#NewClient)
        * [func (c *Client) Close() error](#Client.Close)
        * [func (c *Client) hello() error](#Client.hello)
        * [func (c *Client) Hello(localName string) error](#Client.Hello)
        * [func (c *Client) cmd(expectCode int, format string, args ...interface{}) (int, string, error)](#Client.cmd)
        * [func (c *Client) helo() error](#Client.helo)
        * [func (c *Client) ehlo() error](#Client.ehlo)
        * [func (c *Client) StartTLS(config *tls.Config) error](#Client.StartTLS)
        * [func (c *Client) TLSConnectionState() (state tls.ConnectionState, ok bool)](#Client.TLSConnectionState)
        * [func (c *Client) Verify(addr string) error](#Client.Verify)
        * [func (c *Client) Auth(a Auth) error](#Client.Auth)
        * [func (c *Client) Mail(from string) error](#Client.Mail)
        * [func (c *Client) Rcpt(to string) error](#Client.Rcpt)
        * [func (c *Client) Data() (io.WriteCloser, error)](#Client.Data)
        * [func (c *Client) Extension(ext string) (bool, string)](#Client.Extension)
        * [func (c *Client) Reset() error](#Client.Reset)
        * [func (c *Client) Noop() error](#Client.Noop)
        * [func (c *Client) Quit() error](#Client.Quit)
    * [type dataCloser struct](#dataCloser)
        * [func (d *dataCloser) Close() error](#dataCloser.Close)
    * [type authTest struct](#authTest)
    * [type toServerEmptyAuth struct{}](#toServerEmptyAuth)
        * [func (toServerEmptyAuth) Start(server *ServerInfo) (proto string, toServer []byte, err error)](#toServerEmptyAuth.Start)
        * [func (toServerEmptyAuth) Next(fromServer []byte, more bool) (toServer []byte, err error)](#toServerEmptyAuth.Next)
    * [type faker struct](#faker)
        * [func (f faker) Close() error](#faker.Close)
        * [func (f faker) LocalAddr() net.Addr](#faker.LocalAddr)
        * [func (f faker) RemoteAddr() net.Addr](#faker.RemoteAddr)
        * [func (f faker) SetDeadline(time.Time) error](#faker.SetDeadline)
        * [func (f faker) SetReadDeadline(time.Time) error](#faker.SetReadDeadline)
        * [func (f faker) SetWriteDeadline(time.Time) error](#faker.SetWriteDeadline)
    * [type smtpSender struct](#smtpSender)
        * [func (s smtpSender) send(f string)](#smtpSender.send)
* [Functions](#func)
    * [func isLocalhost(name string) bool](#isLocalhost)
    * [func SendMail(addr string, a Auth, from string, to []string, msg []byte) error](#SendMail)
    * [func validateLine(line string) error](#validateLine)
    * [func TestAuth(t *testing.T)](#TestAuth)
    * [func TestAuthPlain(t *testing.T)](#TestAuthPlain)
    * [func TestClientAuthTrimSpace(t *testing.T)](#TestClientAuthTrimSpace)
    * [func TestBasic(t *testing.T)](#TestBasic)
    * [func TestExtensions(t *testing.T)](#TestExtensions)
    * [func TestNewClient(t *testing.T)](#TestNewClient)
    * [func TestNewClient2(t *testing.T)](#TestNewClient2)
    * [func TestNewClientWithTLS(t *testing.T)](#TestNewClientWithTLS)
    * [func TestHello(t *testing.T)](#TestHello)
    * [func TestSendMail(t *testing.T)](#TestSendMail)
    * [func TestSendMailWithAuth(t *testing.T)](#TestSendMailWithAuth)
    * [func TestAuthFailed(t *testing.T)](#TestAuthFailed)
    * [func TestTLSClient(t *testing.T)](#TestTLSClient)
    * [func TestTLSConnState(t *testing.T)](#TestTLSConnState)
    * [func newLocalListener(t *testing.T) net.Listener](#newLocalListener)
    * [func serverHandle(c net.Conn, t *testing.T) error](#serverHandle)
    * [func serverHandleTLS(c net.Conn, t *testing.T) error](#serverHandleTLS)
    * [func init()](#init.smtp_test.go)
    * [func sendMail(hostPort string) error](#sendMail)
    * [func testingKey(s string) string](#testingKey)


## <a id="var" href="#var">Variables</a>

### <a id="testHookStartTLS" href="#testHookStartTLS">var testHookStartTLS</a>

```
searchKey: smtp.testHookStartTLS
tags: [private]
```

```Go
var testHookStartTLS func(*tls.Config) // nil, except for tests

```

### <a id="authTests" href="#authTests">var authTests</a>

```
searchKey: smtp.authTests
tags: [private]
```

```Go
var authTests = ...
```

### <a id="basicServer" href="#basicServer">var basicServer</a>

```
searchKey: smtp.basicServer
tags: [private]
```

```Go
var basicServer = ...
```

### <a id="basicClient" href="#basicClient">var basicClient</a>

```
searchKey: smtp.basicClient
tags: [private]
```

```Go
var basicClient = ...
```

### <a id="newClientServer" href="#newClientServer">var newClientServer</a>

```
searchKey: smtp.newClientServer
tags: [private]
```

```Go
var newClientServer = ...
```

### <a id="newClientClient" href="#newClientClient">var newClientClient</a>

```
searchKey: smtp.newClientClient
tags: [private]
```

```Go
var newClientClient = `EHLO localhost
QUIT
`
```

### <a id="newClient2Server" href="#newClient2Server">var newClient2Server</a>

```
searchKey: smtp.newClient2Server
tags: [private]
```

```Go
var newClient2Server = ...
```

### <a id="newClient2Client" href="#newClient2Client">var newClient2Client</a>

```
searchKey: smtp.newClient2Client
tags: [private]
```

```Go
var newClient2Client = `EHLO localhost
HELO localhost
QUIT
`
```

### <a id="baseHelloServer" href="#baseHelloServer">var baseHelloServer</a>

```
searchKey: smtp.baseHelloServer
tags: [private]
```

```Go
var baseHelloServer = `220 hello world
502 EH?
250-mx.google.com at your service
250 FEATURE
`
```

### <a id="helloServer" href="#helloServer">var helloServer</a>

```
searchKey: smtp.helloServer
tags: [private]
```

```Go
var helloServer = ...
```

### <a id="baseHelloClient" href="#baseHelloClient">var baseHelloClient</a>

```
searchKey: smtp.baseHelloClient
tags: [private]
```

```Go
var baseHelloClient = `EHLO customhost
HELO customhost
`
```

### <a id="helloClient" href="#helloClient">var helloClient</a>

```
searchKey: smtp.helloClient
tags: [private]
```

```Go
var helloClient = ...
```

### <a id="sendMailServer" href="#sendMailServer">var sendMailServer</a>

```
searchKey: smtp.sendMailServer
tags: [private]
```

```Go
var sendMailServer = ...
```

### <a id="sendMailClient" href="#sendMailClient">var sendMailClient</a>

```
searchKey: smtp.sendMailClient
tags: [private]
```

```Go
var sendMailClient = ...
```

### <a id="authFailedServer" href="#authFailedServer">var authFailedServer</a>

```
searchKey: smtp.authFailedServer
tags: [private]
```

```Go
var authFailedServer = ...
```

### <a id="authFailedClient" href="#authFailedClient">var authFailedClient</a>

```
searchKey: smtp.authFailedClient
tags: [private]
```

```Go
var authFailedClient = `EHLO localhost
AUTH PLAIN AHVzZXIAcGFzcw==
*
QUIT
`
```

### <a id="localhostCert" href="#localhostCert">var localhostCert</a>

```
searchKey: smtp.localhostCert
tags: [private]
```

```Go
var localhostCert = ...
```

localhostCert is a PEM-encoded TLS cert generated from src/crypto/tls: go run generate_cert.go --rsa-bits 1024 --host 127.0.0.1,::1,example.com \ 

```
--ca --start-date "Jan 1 00:00:00 1970" --duration=1000000h

```
### <a id="localhostKey" href="#localhostKey">var localhostKey</a>

```
searchKey: smtp.localhostKey
tags: [private]
```

```Go
var localhostKey = ...
```

localhostKey is the private key for localhostCert. 

## <a id="type" href="#type">Types</a>

### <a id="Auth" href="#Auth">type Auth interface</a>

```
searchKey: smtp.Auth
```

```Go
type Auth interface {
	// Start begins an authentication with a server.
	// It returns the name of the authentication protocol
	// and optionally data to include in the initial AUTH message
	// sent to the server. It can return proto == "" to indicate
	// that the authentication should be skipped.
	// If it returns a non-nil error, the SMTP client aborts
	// the authentication attempt and closes the connection.
	Start(server *ServerInfo) (proto string, toServer []byte, err error)

	// Next continues the authentication. The server has just sent
	// the fromServer data. If more is true, the server expects a
	// response, which Next should return as toServer; otherwise
	// Next should return toServer == nil.
	// If Next returns a non-nil error, the SMTP client aborts
	// the authentication attempt and closes the connection.
	Next(fromServer []byte, more bool) (toServer []byte, err error)
}
```

Auth is implemented by an SMTP authentication mechanism. 

#### <a id="PlainAuth" href="#PlainAuth">func PlainAuth(identity, username, password, host string) Auth</a>

```
searchKey: smtp.PlainAuth
```

```Go
func PlainAuth(identity, username, password, host string) Auth
```

PlainAuth returns an Auth that implements the PLAIN authentication mechanism as defined in RFC 4616. The returned Auth uses the given username and password to authenticate to host and act as identity. Usually identity should be the empty string, to act as username. 

PlainAuth will only send the credentials if the connection is using TLS or is connected to localhost. Otherwise authentication will fail with an error, without sending the credentials. 

#### <a id="CRAMMD5Auth" href="#CRAMMD5Auth">func CRAMMD5Auth(username, secret string) Auth</a>

```
searchKey: smtp.CRAMMD5Auth
```

```Go
func CRAMMD5Auth(username, secret string) Auth
```

CRAMMD5Auth returns an Auth that implements the CRAM-MD5 authentication mechanism as defined in RFC 2195. The returned Auth uses the given username and secret to authenticate to the server using the challenge-response mechanism. 

### <a id="ServerInfo" href="#ServerInfo">type ServerInfo struct</a>

```
searchKey: smtp.ServerInfo
```

```Go
type ServerInfo struct {
	Name string   // SMTP server name
	TLS  bool     // using TLS, with valid certificate for Name
	Auth []string // advertised authentication mechanisms
}
```

ServerInfo records information about an SMTP server. 

### <a id="plainAuth" href="#plainAuth">type plainAuth struct</a>

```
searchKey: smtp.plainAuth
tags: [private]
```

```Go
type plainAuth struct {
	identity, username, password string
	host                         string
}
```

#### <a id="plainAuth.Start" href="#plainAuth.Start">func (a *plainAuth) Start(server *ServerInfo) (string, []byte, error)</a>

```
searchKey: smtp.plainAuth.Start
tags: [private]
```

```Go
func (a *plainAuth) Start(server *ServerInfo) (string, []byte, error)
```

#### <a id="plainAuth.Next" href="#plainAuth.Next">func (a *plainAuth) Next(fromServer []byte, more bool) ([]byte, error)</a>

```
searchKey: smtp.plainAuth.Next
tags: [private]
```

```Go
func (a *plainAuth) Next(fromServer []byte, more bool) ([]byte, error)
```

### <a id="cramMD5Auth" href="#cramMD5Auth">type cramMD5Auth struct</a>

```
searchKey: smtp.cramMD5Auth
tags: [private]
```

```Go
type cramMD5Auth struct {
	username, secret string
}
```

#### <a id="cramMD5Auth.Start" href="#cramMD5Auth.Start">func (a *cramMD5Auth) Start(server *ServerInfo) (string, []byte, error)</a>

```
searchKey: smtp.cramMD5Auth.Start
tags: [private]
```

```Go
func (a *cramMD5Auth) Start(server *ServerInfo) (string, []byte, error)
```

#### <a id="cramMD5Auth.Next" href="#cramMD5Auth.Next">func (a *cramMD5Auth) Next(fromServer []byte, more bool) ([]byte, error)</a>

```
searchKey: smtp.cramMD5Auth.Next
tags: [private]
```

```Go
func (a *cramMD5Auth) Next(fromServer []byte, more bool) ([]byte, error)
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: smtp.Client
```

```Go
type Client struct {
	// Text is the textproto.Conn used by the Client. It is exported to allow for
	// clients to add extensions.
	Text *textproto.Conn
	// keep a reference to the connection so it can be used to create a TLS
	// connection later
	conn net.Conn
	// whether the Client is using TLS
	tls        bool
	serverName string
	// map of supported extensions
	ext map[string]string
	// supported auth mechanisms
	auth       []string
	localName  string // the name to use in HELO/EHLO
	didHello   bool   // whether we've said HELO/EHLO
	helloError error  // the error from the hello
}
```

A Client represents a client connection to an SMTP server. 

#### <a id="Dial" href="#Dial">func Dial(addr string) (*Client, error)</a>

```
searchKey: smtp.Dial
```

```Go
func Dial(addr string) (*Client, error)
```

Dial returns a new Client connected to an SMTP server at addr. The addr must include a port, as in "mail.example.com:smtp". 

#### <a id="NewClient" href="#NewClient">func NewClient(conn net.Conn, host string) (*Client, error)</a>

```
searchKey: smtp.NewClient
```

```Go
func NewClient(conn net.Conn, host string) (*Client, error)
```

NewClient returns a new Client using an existing connection and host as a server name to be used when authenticating. 

#### <a id="Client.Close" href="#Client.Close">func (c *Client) Close() error</a>

```
searchKey: smtp.Client.Close
```

```Go
func (c *Client) Close() error
```

Close closes the connection. 

#### <a id="Client.hello" href="#Client.hello">func (c *Client) hello() error</a>

```
searchKey: smtp.Client.hello
tags: [private]
```

```Go
func (c *Client) hello() error
```

hello runs a hello exchange if needed. 

#### <a id="Client.Hello" href="#Client.Hello">func (c *Client) Hello(localName string) error</a>

```
searchKey: smtp.Client.Hello
```

```Go
func (c *Client) Hello(localName string) error
```

Hello sends a HELO or EHLO to the server as the given host name. Calling this method is only necessary if the client needs control over the host name used. The client will introduce itself as "localhost" automatically otherwise. If Hello is called, it must be called before any of the other methods. 

#### <a id="Client.cmd" href="#Client.cmd">func (c *Client) cmd(expectCode int, format string, args ...interface{}) (int, string, error)</a>

```
searchKey: smtp.Client.cmd
tags: [private]
```

```Go
func (c *Client) cmd(expectCode int, format string, args ...interface{}) (int, string, error)
```

cmd is a convenience function that sends a command and returns the response 

#### <a id="Client.helo" href="#Client.helo">func (c *Client) helo() error</a>

```
searchKey: smtp.Client.helo
tags: [private]
```

```Go
func (c *Client) helo() error
```

helo sends the HELO greeting to the server. It should be used only when the server does not support ehlo. 

#### <a id="Client.ehlo" href="#Client.ehlo">func (c *Client) ehlo() error</a>

```
searchKey: smtp.Client.ehlo
tags: [private]
```

```Go
func (c *Client) ehlo() error
```

ehlo sends the EHLO (extended hello) greeting to the server. It should be the preferred greeting for servers that support it. 

#### <a id="Client.StartTLS" href="#Client.StartTLS">func (c *Client) StartTLS(config *tls.Config) error</a>

```
searchKey: smtp.Client.StartTLS
```

```Go
func (c *Client) StartTLS(config *tls.Config) error
```

StartTLS sends the STARTTLS command and encrypts all further communication. Only servers that advertise the STARTTLS extension support this function. 

#### <a id="Client.TLSConnectionState" href="#Client.TLSConnectionState">func (c *Client) TLSConnectionState() (state tls.ConnectionState, ok bool)</a>

```
searchKey: smtp.Client.TLSConnectionState
```

```Go
func (c *Client) TLSConnectionState() (state tls.ConnectionState, ok bool)
```

TLSConnectionState returns the client's TLS connection state. The return values are their zero values if StartTLS did not succeed. 

#### <a id="Client.Verify" href="#Client.Verify">func (c *Client) Verify(addr string) error</a>

```
searchKey: smtp.Client.Verify
```

```Go
func (c *Client) Verify(addr string) error
```

Verify checks the validity of an email address on the server. If Verify returns nil, the address is valid. A non-nil return does not necessarily indicate an invalid address. Many servers will not verify addresses for security reasons. 

#### <a id="Client.Auth" href="#Client.Auth">func (c *Client) Auth(a Auth) error</a>

```
searchKey: smtp.Client.Auth
```

```Go
func (c *Client) Auth(a Auth) error
```

Auth authenticates a client using the provided authentication mechanism. A failed authentication closes the connection. Only servers that advertise the AUTH extension support this function. 

#### <a id="Client.Mail" href="#Client.Mail">func (c *Client) Mail(from string) error</a>

```
searchKey: smtp.Client.Mail
```

```Go
func (c *Client) Mail(from string) error
```

Mail issues a MAIL command to the server using the provided email address. If the server supports the 8BITMIME extension, Mail adds the BODY=8BITMIME parameter. If the server supports the SMTPUTF8 extension, Mail adds the SMTPUTF8 parameter. This initiates a mail transaction and is followed by one or more Rcpt calls. 

#### <a id="Client.Rcpt" href="#Client.Rcpt">func (c *Client) Rcpt(to string) error</a>

```
searchKey: smtp.Client.Rcpt
```

```Go
func (c *Client) Rcpt(to string) error
```

Rcpt issues a RCPT command to the server using the provided email address. A call to Rcpt must be preceded by a call to Mail and may be followed by a Data call or another Rcpt call. 

#### <a id="Client.Data" href="#Client.Data">func (c *Client) Data() (io.WriteCloser, error)</a>

```
searchKey: smtp.Client.Data
```

```Go
func (c *Client) Data() (io.WriteCloser, error)
```

Data issues a DATA command to the server and returns a writer that can be used to write the mail headers and body. The caller should close the writer before calling any more methods on c. A call to Data must be preceded by one or more calls to Rcpt. 

#### <a id="Client.Extension" href="#Client.Extension">func (c *Client) Extension(ext string) (bool, string)</a>

```
searchKey: smtp.Client.Extension
```

```Go
func (c *Client) Extension(ext string) (bool, string)
```

Extension reports whether an extension is support by the server. The extension name is case-insensitive. If the extension is supported, Extension also returns a string that contains any parameters the server specifies for the extension. 

#### <a id="Client.Reset" href="#Client.Reset">func (c *Client) Reset() error</a>

```
searchKey: smtp.Client.Reset
```

```Go
func (c *Client) Reset() error
```

Reset sends the RSET command to the server, aborting the current mail transaction. 

#### <a id="Client.Noop" href="#Client.Noop">func (c *Client) Noop() error</a>

```
searchKey: smtp.Client.Noop
```

```Go
func (c *Client) Noop() error
```

Noop sends the NOOP command to the server. It does nothing but check that the connection to the server is okay. 

#### <a id="Client.Quit" href="#Client.Quit">func (c *Client) Quit() error</a>

```
searchKey: smtp.Client.Quit
```

```Go
func (c *Client) Quit() error
```

Quit sends the QUIT command and closes the connection to the server. 

### <a id="dataCloser" href="#dataCloser">type dataCloser struct</a>

```
searchKey: smtp.dataCloser
tags: [private]
```

```Go
type dataCloser struct {
	c *Client
	io.WriteCloser
}
```

#### <a id="dataCloser.Close" href="#dataCloser.Close">func (d *dataCloser) Close() error</a>

```
searchKey: smtp.dataCloser.Close
tags: [private]
```

```Go
func (d *dataCloser) Close() error
```

### <a id="authTest" href="#authTest">type authTest struct</a>

```
searchKey: smtp.authTest
tags: [private]
```

```Go
type authTest struct {
	auth       Auth
	challenges []string
	name       string
	responses  []string
}
```

### <a id="toServerEmptyAuth" href="#toServerEmptyAuth">type toServerEmptyAuth struct{}</a>

```
searchKey: smtp.toServerEmptyAuth
tags: [private]
```

```Go
type toServerEmptyAuth struct{}
```

toServerEmptyAuth is an implementation of Auth that only implements the Start method, and returns "FOOAUTH", nil, nil. Notably, it returns zero bytes for "toServer" so we can test that we don't send spaces at the end of the line. See TestClientAuthTrimSpace. 

#### <a id="toServerEmptyAuth.Start" href="#toServerEmptyAuth.Start">func (toServerEmptyAuth) Start(server *ServerInfo) (proto string, toServer []byte, err error)</a>

```
searchKey: smtp.toServerEmptyAuth.Start
tags: [private]
```

```Go
func (toServerEmptyAuth) Start(server *ServerInfo) (proto string, toServer []byte, err error)
```

#### <a id="toServerEmptyAuth.Next" href="#toServerEmptyAuth.Next">func (toServerEmptyAuth) Next(fromServer []byte, more bool) (toServer []byte, err error)</a>

```
searchKey: smtp.toServerEmptyAuth.Next
tags: [private]
```

```Go
func (toServerEmptyAuth) Next(fromServer []byte, more bool) (toServer []byte, err error)
```

### <a id="faker" href="#faker">type faker struct</a>

```
searchKey: smtp.faker
tags: [private]
```

```Go
type faker struct {
	io.ReadWriter
}
```

#### <a id="faker.Close" href="#faker.Close">func (f faker) Close() error</a>

```
searchKey: smtp.faker.Close
tags: [private]
```

```Go
func (f faker) Close() error
```

#### <a id="faker.LocalAddr" href="#faker.LocalAddr">func (f faker) LocalAddr() net.Addr</a>

```
searchKey: smtp.faker.LocalAddr
tags: [private]
```

```Go
func (f faker) LocalAddr() net.Addr
```

#### <a id="faker.RemoteAddr" href="#faker.RemoteAddr">func (f faker) RemoteAddr() net.Addr</a>

```
searchKey: smtp.faker.RemoteAddr
tags: [private]
```

```Go
func (f faker) RemoteAddr() net.Addr
```

#### <a id="faker.SetDeadline" href="#faker.SetDeadline">func (f faker) SetDeadline(time.Time) error</a>

```
searchKey: smtp.faker.SetDeadline
tags: [private]
```

```Go
func (f faker) SetDeadline(time.Time) error
```

#### <a id="faker.SetReadDeadline" href="#faker.SetReadDeadline">func (f faker) SetReadDeadline(time.Time) error</a>

```
searchKey: smtp.faker.SetReadDeadline
tags: [private]
```

```Go
func (f faker) SetReadDeadline(time.Time) error
```

#### <a id="faker.SetWriteDeadline" href="#faker.SetWriteDeadline">func (f faker) SetWriteDeadline(time.Time) error</a>

```
searchKey: smtp.faker.SetWriteDeadline
tags: [private]
```

```Go
func (f faker) SetWriteDeadline(time.Time) error
```

### <a id="smtpSender" href="#smtpSender">type smtpSender struct</a>

```
searchKey: smtp.smtpSender
tags: [private]
```

```Go
type smtpSender struct {
	w io.Writer
}
```

#### <a id="smtpSender.send" href="#smtpSender.send">func (s smtpSender) send(f string)</a>

```
searchKey: smtp.smtpSender.send
tags: [private]
```

```Go
func (s smtpSender) send(f string)
```

## <a id="func" href="#func">Functions</a>

### <a id="isLocalhost" href="#isLocalhost">func isLocalhost(name string) bool</a>

```
searchKey: smtp.isLocalhost
tags: [private]
```

```Go
func isLocalhost(name string) bool
```

### <a id="SendMail" href="#SendMail">func SendMail(addr string, a Auth, from string, to []string, msg []byte) error</a>

```
searchKey: smtp.SendMail
```

```Go
func SendMail(addr string, a Auth, from string, to []string, msg []byte) error
```

SendMail connects to the server at addr, switches to TLS if possible, authenticates with the optional mechanism a if possible, and then sends an email from address from, to addresses to, with message msg. The addr must include a port, as in "mail.example.com:smtp". 

The addresses in the to parameter are the SMTP RCPT addresses. 

The msg parameter should be an RFC 822-style email with headers first, a blank line, and then the message body. The lines of msg should be CRLF terminated. The msg headers should usually include fields such as "From", "To", "Subject", and "Cc".  Sending "Bcc" messages is accomplished by including an email address in the to parameter but not including it in the msg headers. 

The SendMail function and the net/smtp package are low-level mechanisms and provide no support for DKIM signing, MIME attachments (see the mime/multipart package), or other mail functionality. Higher-level packages exist outside of the standard library. 

### <a id="validateLine" href="#validateLine">func validateLine(line string) error</a>

```
searchKey: smtp.validateLine
tags: [private]
```

```Go
func validateLine(line string) error
```

validateLine checks to see if a line has CR or LF as per RFC 5321 

### <a id="TestAuth" href="#TestAuth">func TestAuth(t *testing.T)</a>

```
searchKey: smtp.TestAuth
tags: [private]
```

```Go
func TestAuth(t *testing.T)
```

### <a id="TestAuthPlain" href="#TestAuthPlain">func TestAuthPlain(t *testing.T)</a>

```
searchKey: smtp.TestAuthPlain
tags: [private]
```

```Go
func TestAuthPlain(t *testing.T)
```

### <a id="TestClientAuthTrimSpace" href="#TestClientAuthTrimSpace">func TestClientAuthTrimSpace(t *testing.T)</a>

```
searchKey: smtp.TestClientAuthTrimSpace
tags: [private]
```

```Go
func TestClientAuthTrimSpace(t *testing.T)
```

Issue 17794: don't send a trailing space on AUTH command when there's no password. 

### <a id="TestBasic" href="#TestBasic">func TestBasic(t *testing.T)</a>

```
searchKey: smtp.TestBasic
tags: [private]
```

```Go
func TestBasic(t *testing.T)
```

### <a id="TestExtensions" href="#TestExtensions">func TestExtensions(t *testing.T)</a>

```
searchKey: smtp.TestExtensions
tags: [private]
```

```Go
func TestExtensions(t *testing.T)
```

### <a id="TestNewClient" href="#TestNewClient">func TestNewClient(t *testing.T)</a>

```
searchKey: smtp.TestNewClient
tags: [private]
```

```Go
func TestNewClient(t *testing.T)
```

### <a id="TestNewClient2" href="#TestNewClient2">func TestNewClient2(t *testing.T)</a>

```
searchKey: smtp.TestNewClient2
tags: [private]
```

```Go
func TestNewClient2(t *testing.T)
```

### <a id="TestNewClientWithTLS" href="#TestNewClientWithTLS">func TestNewClientWithTLS(t *testing.T)</a>

```
searchKey: smtp.TestNewClientWithTLS
tags: [private]
```

```Go
func TestNewClientWithTLS(t *testing.T)
```

### <a id="TestHello" href="#TestHello">func TestHello(t *testing.T)</a>

```
searchKey: smtp.TestHello
tags: [private]
```

```Go
func TestHello(t *testing.T)
```

### <a id="TestSendMail" href="#TestSendMail">func TestSendMail(t *testing.T)</a>

```
searchKey: smtp.TestSendMail
tags: [private]
```

```Go
func TestSendMail(t *testing.T)
```

### <a id="TestSendMailWithAuth" href="#TestSendMailWithAuth">func TestSendMailWithAuth(t *testing.T)</a>

```
searchKey: smtp.TestSendMailWithAuth
tags: [private]
```

```Go
func TestSendMailWithAuth(t *testing.T)
```

### <a id="TestAuthFailed" href="#TestAuthFailed">func TestAuthFailed(t *testing.T)</a>

```
searchKey: smtp.TestAuthFailed
tags: [private]
```

```Go
func TestAuthFailed(t *testing.T)
```

### <a id="TestTLSClient" href="#TestTLSClient">func TestTLSClient(t *testing.T)</a>

```
searchKey: smtp.TestTLSClient
tags: [private]
```

```Go
func TestTLSClient(t *testing.T)
```

### <a id="TestTLSConnState" href="#TestTLSConnState">func TestTLSConnState(t *testing.T)</a>

```
searchKey: smtp.TestTLSConnState
tags: [private]
```

```Go
func TestTLSConnState(t *testing.T)
```

### <a id="newLocalListener" href="#newLocalListener">func newLocalListener(t *testing.T) net.Listener</a>

```
searchKey: smtp.newLocalListener
tags: [private]
```

```Go
func newLocalListener(t *testing.T) net.Listener
```

### <a id="serverHandle" href="#serverHandle">func serverHandle(c net.Conn, t *testing.T) error</a>

```
searchKey: smtp.serverHandle
tags: [private]
```

```Go
func serverHandle(c net.Conn, t *testing.T) error
```

smtp server, finely tailored to deal with our own client only! 

### <a id="serverHandleTLS" href="#serverHandleTLS">func serverHandleTLS(c net.Conn, t *testing.T) error</a>

```
searchKey: smtp.serverHandleTLS
tags: [private]
```

```Go
func serverHandleTLS(c net.Conn, t *testing.T) error
```

### <a id="init.smtp_test.go" href="#init.smtp_test.go">func init()</a>

```
searchKey: smtp.init
tags: [private]
```

```Go
func init()
```

### <a id="sendMail" href="#sendMail">func sendMail(hostPort string) error</a>

```
searchKey: smtp.sendMail
tags: [private]
```

```Go
func sendMail(hostPort string) error
```

### <a id="testingKey" href="#testingKey">func testingKey(s string) string</a>

```
searchKey: smtp.testingKey
tags: [private]
```

```Go
func testingKey(s string) string
```

