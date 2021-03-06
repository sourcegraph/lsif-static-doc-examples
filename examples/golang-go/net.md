# Package net

Package net provides a portable interface for network I/O, including TCP/IP, UDP, domain name resolution, and Unix domain sockets. 

Although the package provides access to low-level networking primitives, most clients will need only the basic interface provided by the Dial, Listen, and Accept functions and the associated Conn and Listener interfaces. The crypto/tls package uses the same interfaces and similar Dial and Listen functions. 

The Dial function connects to a server: 

```
conn, err := net.Dial("tcp", "golang.org:80")
if err != nil {
	// handle error
}
fmt.Fprintf(conn, "GET / HTTP/1.0\r\n\r\n")
status, err := bufio.NewReader(conn).ReadString('\n')
// ...

```
The Listen function creates servers: 

```
ln, err := net.Listen("tcp", ":8080")
if err != nil {
	// handle error
}
for {
	conn, err := ln.Accept()
	if err != nil {
		// handle error
	}
	go handleConnection(conn)
}

```
### hdr-Name_ResolutionName Resolution
The method for resolving domain names, whether indirectly with functions like Dial or directly with functions like LookupHost and LookupAddr, varies by operating system. 

On Unix systems, the resolver has two options for resolving names. It can use a pure Go resolver that sends DNS requests directly to the servers listed in /etc/resolv.conf, or it can use a cgo-based resolver that calls C library routines such as getaddrinfo and getnameinfo. 

By default the pure Go resolver is used, because a blocked DNS request consumes only a goroutine, while a blocked C call consumes an operating system thread. When cgo is available, the cgo-based resolver is used instead under a variety of conditions: on systems that do not let programs make direct DNS requests (OS X), when the LOCALDOMAIN environment variable is present (even if empty), when the RES_OPTIONS or HOSTALIASES environment variable is non-empty, when the ASR_CONFIG environment variable is non-empty (OpenBSD only), when /etc/resolv.conf or /etc/nsswitch.conf specify the use of features that the Go resolver does not implement, and when the name being looked up ends in .local or is an mDNS name. 

The resolver decision can be overridden by setting the netdns value of the GODEBUG environment variable (see package runtime) to go or cgo, as in: 

```
export GODEBUG=netdns=go    # force pure Go resolver
export GODEBUG=netdns=cgo   # force cgo resolver

```
The decision can also be forced while building the Go source tree by setting the netgo or netcgo build tag. 

A numeric netdns setting, as in GODEBUG=netdns=1, causes the resolver to print debugging information about its decisions. To force a particular resolver while also printing debugging information, join the two settings by a plus sign, as in GODEBUG=netdns=go+1. 

On Plan 9, the resolver always accesses /net/cs and /net/dns. 

On Windows, the resolver always uses C library functions, such as GetAddrInfo and DnsQuery. 

## Index

* Subpages
  * [net/internal](net/internal.md)
  * [net/http](net/http.md)
  * [net/http_test](net/http_test.md)
  * [net/mail](net/mail.md)
  * [net/mail_test](net/mail_test.md)
  * [net/rpc](net/rpc.md)
  * [net/smtp](net/smtp.md)
  * [net/smtp_test](net/smtp_test.md)
  * [net/textproto](net/textproto.md)
  * [net/url](net/url.md)
  * [net/url_test](net/url_test.md)
* [Constants](#const)
    * [const FlagBroadcast](#FlagBroadcast)
    * [const FlagLoopback](#FlagLoopback)
    * [const FlagMulticast](#FlagMulticast)
    * [const FlagPointToPoint](#FlagPointToPoint)
    * [const FlagUp](#FlagUp)
    * [const IPv4len](#IPv4len)
    * [const IPv6len](#IPv6len)
    * [const big](#big)
    * [const cacheMaxAge](#cacheMaxAge)
    * [const cgoAddrInfoFlags](#cgoAddrInfoFlags)
    * [const defaultTCPKeepAlive](#defaultTCPKeepAlive)
    * [const hexDigit](#hexDigit)
    * [const hostLookupCgo](#hostLookupCgo)
    * [const hostLookupDNS](#hostLookupDNS)
    * [const hostLookupDNSFiles](#hostLookupDNSFiles)
    * [const hostLookupFiles](#hostLookupFiles)
    * [const hostLookupFilesDNS](#hostLookupFilesDNS)
    * [const maxNameinfoLen](#maxNameinfoLen)
    * [const maxPortBufSize](#maxPortBufSize)
    * [const maxProtoLength](#maxProtoLength)
    * [const nameinfoLen](#nameinfoLen)
    * [const newton](#newton)
    * [const newtonLen](#newtonLen)
    * [const newtonSHA256](#newtonSHA256)
    * [const readFromSyscallName](#readFromSyscallName)
    * [const readMsgFlags](#readMsgFlags)
    * [const readMsgSyscallName](#readMsgSyscallName)
    * [const readSyscallName](#readSyscallName)
    * [const scopeAdminLocal](#scopeAdminLocal)
    * [const scopeGlobal](#scopeGlobal)
    * [const scopeInterfaceLocal](#scopeInterfaceLocal)
    * [const scopeLinkLocal](#scopeLinkLocal)
    * [const scopeOrgLocal](#scopeOrgLocal)
    * [const scopeSiteLocal](#scopeSiteLocal)
    * [const slowDst4](#slowDst4)
    * [const slowDst6](#slowDst6)
    * [const someTimeout](#someTimeout)
    * [const sysTCP_KEEPINTVL](#sysTCP_KEEPINTVL)
    * [const ubuntuTrustyAvahi](#ubuntuTrustyAvahi)
    * [const useTCPOnly](#useTCPOnly)
    * [const useUDPOrTCP](#useUDPOrTCP)
    * [const writeMsgSyscallName](#writeMsgSyscallName)
    * [const writeSyscallName](#writeSyscallName)
    * [const writeToSyscallName](#writeToSyscallName)
* [Variables](#var)
    * [var DefaultResolver](#DefaultResolver)
    * [var ErrClosed](#ErrClosed)
    * [var ErrWriteToConnected](#ErrWriteToConnected)
    * [var IPv4allrouter](#IPv4allrouter)
    * [var IPv4allsys](#IPv4allsys)
    * [var IPv4bcast](#IPv4bcast)
    * [var IPv4zero](#IPv4zero)
    * [var IPv6interfacelocalallnodes](#IPv6interfacelocalallnodes)
    * [var IPv6linklocalallnodes](#IPv6linklocalallnodes)
    * [var IPv6linklocalallrouters](#IPv6linklocalallrouters)
    * [var IPv6loopback](#IPv6loopback)
    * [var IPv6unspecified](#IPv6unspecified)
    * [var IPv6zero](#IPv6zero)
    * [var TestAddr](#TestAddr)
    * [var TestAddr6](#TestAddr6)
    * [var aLongTimeAgo](#aLongTimeAgo)
    * [var abortedConnRequestErrors](#abortedConnRequestErrors)
    * [var acceptTimeoutTests](#acceptTimeoutTests)
    * [var addrListTests](#addrListTests)
    * [var backoffDuration](#backoffDuration)
    * [var badaddr](#badaddr)
    * [var badmask](#badmask)
    * [var cidrMaskTests](#cidrMaskTests)
    * [var classAMask](#classAMask)
    * [var classBMask](#classBMask)
    * [var classCMask](#classCMask)
    * [var confOnce](#confOnce)
    * [var confVal](#confVal)
    * [var connectFunc](#connectFunc)
    * [var defaultNS](#defaultNS)
    * [var defaultResolvConf](#defaultResolvConf)
    * [var dialErrorTests](#dialErrorTests)
    * [var dialGoogleTests](#dialGoogleTests)
    * [var dialTimeoutMaxDurationTests](#dialTimeoutMaxDurationTests)
    * [var dialTimeoutTests](#dialTimeoutTests)
    * [var dnsDefaultSearchTests](#dnsDefaultSearchTests)
    * [var dnsNameTests](#dnsNameTests)
    * [var dnsReadConfigTests](#dnsReadConfigTests)
    * [var dnsTransportFallbackTests](#dnsTransportFallbackTests)
    * [var dnsWaitGroup](#dnsWaitGroup)
    * [var dualStackTCPListenerTests](#dualStackTCPListenerTests)
    * [var dualStackUDPListenerTests](#dualStackUDPListenerTests)
    * [var errCanceled](#errCanceled)
    * [var errCannotMarshalDNSMessage](#errCannotMarshalDNSMessage)
    * [var errCannotUnmarshalDNSMessage](#errCannotUnmarshalDNSMessage)
    * [var errClosed](#errClosed)
    * [var errInvalidDNSResponse](#errInvalidDNSResponse)
    * [var errInvalidInterface](#errInvalidInterface)
    * [var errInvalidInterfaceIndex](#errInvalidInterfaceIndex)
    * [var errInvalidInterfaceName](#errInvalidInterfaceName)
    * [var errLameReferral](#errLameReferral)
    * [var errMissingAddress](#errMissingAddress)
    * [var errNoAnswerFromDNSServer](#errNoAnswerFromDNSServer)
    * [var errNoSuchHost](#errNoSuchHost)
    * [var errNoSuchInterface](#errNoSuchInterface)
    * [var errNoSuchMulticastInterface](#errNoSuchMulticastInterface)
    * [var errNoSuitableAddress](#errNoSuitableAddress)
    * [var errOpNotSupported](#errOpNotSupported)
    * [var errServerMisbehaving](#errServerMisbehaving)
    * [var errServerTemporarilyMisbehaving](#errServerTemporarilyMisbehaving)
    * [var errTimedout](#errTimedout)
    * [var errTimeout](#errTimeout)
    * [var extraTestHookInstallers](#extraTestHookInstallers)
    * [var extraTestHookUninstallers](#extraTestHookUninstallers)
    * [var fakeDNSServerSuccessful](#fakeDNSServerSuccessful)
    * [var fileConnTests](#fileConnTests)
    * [var fileListenerTests](#fileListenerTests)
    * [var filePacketConnTests](#filePacketConnTests)
    * [var flagNames](#flagNames)
    * [var getHostname](#getHostname)
    * [var getsockoptIntFunc](#getsockoptIntFunc)
    * [var goLookupIPWithResolverConfigTests](#goLookupIPWithResolverConfigTests)
    * [var goResolver](#goResolver)
    * [var hosts](#hosts)
    * [var ipAddrFamilyTests](#ipAddrFamilyTests)
    * [var ipAddrScopeTests](#ipAddrScopeTests)
    * [var ipConnLocalNameTests](#ipConnLocalNameTests)
    * [var ipMaskStringTests](#ipMaskStringTests)
    * [var ipMaskTests](#ipMaskTests)
    * [var ipNetContainsTests](#ipNetContainsTests)
    * [var ipNetStringTests](#ipNetStringTests)
    * [var ipStackCaps](#ipStackCaps)
    * [var ipStringTests](#ipStringTests)
    * [var ipVersionTests](#ipVersionTests)
    * [var ipv4MulticastListenerTests](#ipv4MulticastListenerTests)
    * [var ipv6LinkLocalUnicastTCPTests](#ipv6LinkLocalUnicastTCPTests)
    * [var ipv6LinkLocalUnicastUDPTests](#ipv6LinkLocalUnicastUDPTests)
    * [var ipv6MulticastListenerTests](#ipv6MulticastListenerTests)
    * [var listenErrorTests](#listenErrorTests)
    * [var listenFunc](#listenFunc)
    * [var listenPacketErrorTests](#listenPacketErrorTests)
    * [var listenerBacklogCache](#listenerBacklogCache)
    * [var literalAddrs4](#literalAddrs4)
    * [var literalAddrs6](#literalAddrs6)
    * [var lookupCNAMETests](#lookupCNAMETests)
    * [var lookupGmailMXTests](#lookupGmailMXTests)
    * [var lookupGmailNSTests](#lookupGmailNSTests)
    * [var lookupGmailTXTTests](#lookupGmailTXTTests)
    * [var lookupGoogleHostTests](#lookupGoogleHostTests)
    * [var lookupGoogleIPTests](#lookupGoogleIPTests)
    * [var lookupGooglePublicDNSAddrTests](#lookupGooglePublicDNSAddrTests)
    * [var lookupGoogleSRVTests](#lookupGoogleSRVTests)
    * [var lookupOrderName](#lookupOrderName)
    * [var lookupStaticAddrTests](#lookupStaticAddrTests)
    * [var lookupStaticHostTests](#lookupStaticHostTests)
    * [var netCgo](#netCgo)
    * [var netGo](#netGo)
    * [var networkNumberAndMaskTests](#networkNumberAndMaskTests)
    * [var noCancel](#noCancel)
    * [var noDeadline](#noDeadline)
    * [var onceReadProtocols](#onceReadProtocols)
    * [var onceReadServices](#onceReadServices)
    * [var origAccept](#origAccept)
    * [var origClose](#origClose)
    * [var origConnect](#origConnect)
    * [var origGetsockoptInt](#origGetsockoptInt)
    * [var origListen](#origListen)
    * [var origSocket](#origSocket)
    * [var packetConnTests](#packetConnTests)
    * [var parseCIDRTests](#parseCIDRTests)
    * [var parseIPTests](#parseIPTests)
    * [var parseMACTests](#parseMACTests)
    * [var parsePortTests](#parsePortTests)
    * [var prohibitionaryDialArgTests](#prohibitionaryDialArgTests)
    * [var protocols](#protocols)
    * [var readFromTimeoutTests](#readFromTimeoutTests)
    * [var readTimeoutTests](#readTimeoutTests)
    * [var resolvConf](#resolvConf)
    * [var resolveIPAddrTests](#resolveIPAddrTests)
    * [var resolveTCPAddrTests](#resolveTCPAddrTests)
    * [var resolveUDPAddrTests](#resolveUDPAddrTests)
    * [var revAddrTests](#revAddrTests)
    * [var rfc6724policyTable](#rfc6724policyTable)
    * [var services](#services)
    * [var sink](#sink)
    * [var socketFunc](#socketFunc)
    * [var specialDomainNameTests](#specialDomainNameTests)
    * [var sw](#sw)
    * [var tcpListenerNameTests](#tcpListenerNameTests)
    * [var tcpListenerTests](#tcpListenerTests)
    * [var tcpServerTests](#tcpServerTests)
    * [var testDNSFlood](#testDNSFlood)
    * [var testHookCanceledDial](#testHookCanceledDial)
    * [var testHookDialChannel](#testHookDialChannel)
    * [var testHookDialTCP](#testHookDialTCP)
    * [var testHookHostsPath](#testHookHostsPath)
    * [var testHookLookupIP](#testHookLookupIP)
    * [var testHookSetKeepAlive](#testHookSetKeepAlive)
    * [var testHookUninstaller](#testHookUninstaller)
    * [var testIPv4](#testIPv4)
    * [var testIPv6](#testIPv6)
    * [var testInetaddr](#testInetaddr)
    * [var testTCPBig](#testTCPBig)
    * [var threadLimit](#threadLimit)
    * [var threadOnce](#threadOnce)
    * [var udpConnLocalNameTests](#udpConnLocalNameTests)
    * [var udpListenerTests](#udpListenerTests)
    * [var udpServerTests](#udpServerTests)
    * [var unixAndUnixpacketServerTests](#unixAndUnixpacketServerTests)
    * [var unixEnabledOnAIX](#unixEnabledOnAIX)
    * [var unixgramServerTests](#unixgramServerTests)
    * [var updateResolvConfTests](#updateResolvConfTests)
    * [var v4InV6Prefix](#v4InV6Prefix)
    * [var v4addr](#v4addr)
    * [var v4mappedv6addr](#v4mappedv6addr)
    * [var v4mappedv6mask](#v4mappedv6mask)
    * [var v4mask](#v4mask)
    * [var v4maskzero](#v4maskzero)
    * [var v6addr](#v6addr)
    * [var v6mask](#v6mask)
    * [var writeTimeoutTests](#writeTimeoutTests)
    * [var writeToTimeoutTests](#writeToTimeoutTests)
    * [var zoneCache](#zoneCache)
* [Types](#type)
    * [type Addr interface](#Addr)
        * [func sockaddrToIP(sa syscall.Sockaddr) Addr](#sockaddrToIP)
        * [func sockaddrToTCP(sa syscall.Sockaddr) Addr](#sockaddrToTCP)
        * [func sockaddrToUDP(sa syscall.Sockaddr) Addr](#sockaddrToUDP)
        * [func sockaddrToUnix(sa syscall.Sockaddr) Addr](#sockaddrToUnix)
        * [func sockaddrToUnixgram(sa syscall.Sockaddr) Addr](#sockaddrToUnixgram)
        * [func sockaddrToUnixpacket(sa syscall.Sockaddr) Addr](#sockaddrToUnixpacket)
    * [type AddrError struct](#AddrError)
        * [func (e *AddrError) Error() string](#AddrError.Error)
        * [func (e *AddrError) Temporary() bool](#AddrError.Temporary)
        * [func (e *AddrError) Timeout() bool](#AddrError.Timeout)
    * [type Buffers [][]byte](#Buffers)
        * [func (v *Buffers) Read(p []byte) (n int, err error)](#Buffers.Read)
        * [func (v *Buffers) WriteTo(w io.Writer) (n int64, err error)](#Buffers.WriteTo)
        * [func (v *Buffers) consume(n int64)](#Buffers.consume)
    * [type Conn interface](#Conn)
        * [func Dial(network, address string) (Conn, error)](#Dial)
        * [func DialTimeout(network, address string, timeout time.Duration) (Conn, error)](#DialTimeout)
        * [func FileConn(f *os.File) (c Conn, err error)](#FileConn)
        * [func fileConn(f *os.File) (Conn, error)](#fileConn)
    * [type DNSConfigError struct](#DNSConfigError)
        * [func (e *DNSConfigError) Error() string](#DNSConfigError.Error)
        * [func (e *DNSConfigError) Temporary() bool](#DNSConfigError.Temporary)
        * [func (e *DNSConfigError) Timeout() bool](#DNSConfigError.Timeout)
        * [func (e *DNSConfigError) Unwrap() error](#DNSConfigError.Unwrap)
    * [type DNSError struct](#DNSError)
        * [func (e *DNSError) Error() string](#DNSError.Error)
        * [func (e *DNSError) Temporary() bool](#DNSError.Temporary)
        * [func (e *DNSError) Timeout() bool](#DNSError.Timeout)
    * [type Dialer struct](#Dialer)
        * [func (d *Dialer) Dial(network, address string) (Conn, error)](#Dialer.Dial)
        * [func (d *Dialer) DialContext(ctx context.Context, network, address string) (Conn, error)](#Dialer.DialContext)
        * [func (d *Dialer) deadline(ctx context.Context, now time.Time) (earliest time.Time)](#Dialer.deadline)
        * [func (d *Dialer) dualStack() bool](#Dialer.dualStack)
        * [func (d *Dialer) fallbackDelay() time.Duration](#Dialer.fallbackDelay)
        * [func (d *Dialer) resolver() *Resolver](#Dialer.resolver)
    * [type Error interface](#Error)
    * [type Flags uint](#Flags)
        * [func linkFlags(rawFlags int) Flags](#linkFlags)
        * [func (f Flags) String() string](#Flags.String)
    * [type HardwareAddr []byte](#HardwareAddr)
        * [func ParseMAC(s string) (hw HardwareAddr, err error)](#ParseMAC)
        * [func (a HardwareAddr) String() string](#HardwareAddr.String)
    * [type IP []byte](#IP)
        * [func IPv4(a, b, c, d byte) IP](#IPv4)
        * [func ParseCIDR(s string) (IP, *IPNet, error)](#ParseCIDR)
        * [func ParseIP(s string) IP](#ParseIP)
        * [func copyIP(x IP) IP](#copyIP)
        * [func interfaceToIPv4Addr(ifi *Interface) (IP, error)](#interfaceToIPv4Addr)
        * [func loopbackIP(net string) IP](#loopbackIP)
        * [func networkNumberAndMask(n *IPNet) (ip IP, m IPMask)](#networkNumberAndMask)
        * [func parseIPZone(s string) (IP, string)](#parseIPZone)
        * [func parseIPv4(s string) IP](#parseIPv4)
        * [func parseIPv6(s string) (ip IP)](#parseIPv6)
        * [func parseIPv6Zone(s string) (IP, string)](#parseIPv6Zone)
        * [func (ip IP) DefaultMask() IPMask](#IP.DefaultMask)
        * [func (ip IP) Equal(x IP) bool](#IP.Equal)
        * [func (ip IP) IsGlobalUnicast() bool](#IP.IsGlobalUnicast)
        * [func (ip IP) IsInterfaceLocalMulticast() bool](#IP.IsInterfaceLocalMulticast)
        * [func (ip IP) IsLinkLocalMulticast() bool](#IP.IsLinkLocalMulticast)
        * [func (ip IP) IsLinkLocalUnicast() bool](#IP.IsLinkLocalUnicast)
        * [func (ip IP) IsLoopback() bool](#IP.IsLoopback)
        * [func (ip IP) IsMulticast() bool](#IP.IsMulticast)
        * [func (ip IP) IsPrivate() bool](#IP.IsPrivate)
        * [func (ip IP) IsUnspecified() bool](#IP.IsUnspecified)
        * [func (ip IP) MarshalText() ([]byte, error)](#IP.MarshalText)
        * [func (ip IP) Mask(mask IPMask) IP](#IP.Mask)
        * [func (ip IP) String() string](#IP.String)
        * [func (ip IP) To16() IP](#IP.To16)
        * [func (ip IP) To4() IP](#IP.To4)
        * [func (ip *IP) UnmarshalText(text []byte) error](#IP.UnmarshalText)
        * [func (ip IP) matchAddrFamily(x IP) bool](#IP.matchAddrFamily)
    * [type IPAddr struct](#IPAddr)
        * [func ResolveIPAddr(network, address string) (*IPAddr, error)](#ResolveIPAddr)
        * [func (a *IPAddr) Network() string](#IPAddr.Network)
        * [func (a *IPAddr) String() string](#IPAddr.String)
        * [func (a *IPAddr) family() int](#IPAddr.family)
        * [func (a *IPAddr) isWildcard() bool](#IPAddr.isWildcard)
        * [func (a *IPAddr) opAddr() Addr](#IPAddr.opAddr)
        * [func (a *IPAddr) sockaddr(family int) (syscall.Sockaddr, error)](#IPAddr.sockaddr)
        * [func (a *IPAddr) toLocal(net string) sockaddr](#IPAddr.toLocal)
    * [type IPConn struct](#IPConn)
        * [func DialIP(network string, laddr, raddr *IPAddr) (*IPConn, error)](#DialIP)
        * [func ListenIP(network string, laddr *IPAddr) (*IPConn, error)](#ListenIP)
        * [func newIPConn(fd *netFD) *IPConn](#newIPConn)
        * [func (c *IPConn) ReadFrom(b []byte) (int, Addr, error)](#IPConn.ReadFrom)
        * [func (c *IPConn) ReadFromIP(b []byte) (int, *IPAddr, error)](#IPConn.ReadFromIP)
        * [func (c *IPConn) ReadMsgIP(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)](#IPConn.ReadMsgIP)
        * [func (c *IPConn) SyscallConn() (syscall.RawConn, error)](#IPConn.SyscallConn)
        * [func (c *IPConn) WriteMsgIP(b, oob []byte, addr *IPAddr) (n, oobn int, err error)](#IPConn.WriteMsgIP)
        * [func (c *IPConn) WriteTo(b []byte, addr Addr) (int, error)](#IPConn.WriteTo)
        * [func (c *IPConn) WriteToIP(b []byte, addr *IPAddr) (int, error)](#IPConn.WriteToIP)
        * [func (c *IPConn) readFrom(b []byte) (int, *IPAddr, error)](#IPConn.readFrom)
        * [func (c *IPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)](#IPConn.readMsg)
        * [func (c *IPConn) writeMsg(b, oob []byte, addr *IPAddr) (n, oobn int, err error)](#IPConn.writeMsg)
        * [func (c *IPConn) writeTo(b []byte, addr *IPAddr) (int, error)](#IPConn.writeTo)
    * [type IPMask []byte](#IPMask)
        * [func CIDRMask(ones, bits int) IPMask](#CIDRMask)
        * [func IPv4Mask(a, b, c, d byte) IPMask](#IPv4Mask)
        * [func (m IPMask) Size() (ones, bits int)](#IPMask.Size)
        * [func (m IPMask) String() string](#IPMask.String)
    * [type IPNet struct](#IPNet)
        * [func mustCIDR(s string) *IPNet](#mustCIDR)
        * [func (n *IPNet) Contains(ip IP) bool](#IPNet.Contains)
        * [func (n *IPNet) Network() string](#IPNet.Network)
        * [func (n *IPNet) String() string](#IPNet.String)
    * [type Interface struct](#Interface)
        * [func InterfaceByIndex(index int) (*Interface, error)](#InterfaceByIndex)
        * [func InterfaceByName(name string) (*Interface, error)](#InterfaceByName)
        * [func interfaceByIndex(ift []Interface, index int) (*Interface, error)](#interfaceByIndex)
        * [func ipv4AddrToInterface(ip IP) (*Interface, error)](#ipv4AddrToInterface)
        * [func loopbackInterface() *Interface](#loopbackInterface)
        * [func (ifi *Interface) Addrs() ([]Addr, error)](#Interface.Addrs)
        * [func (ifi *Interface) MulticastAddrs() ([]Addr, error)](#Interface.MulticastAddrs)
    * [type InvalidAddrError string](#InvalidAddrError)
        * [func (e InvalidAddrError) Error() string](#InvalidAddrError.Error)
        * [func (e InvalidAddrError) Temporary() bool](#InvalidAddrError.Temporary)
        * [func (e InvalidAddrError) Timeout() bool](#InvalidAddrError.Timeout)
    * [type ListenConfig struct](#ListenConfig)
        * [func (lc *ListenConfig) Listen(ctx context.Context, network, address string) (Listener, error)](#ListenConfig.Listen)
        * [func (lc *ListenConfig) ListenPacket(ctx context.Context, network, address string) (PacketConn, error)](#ListenConfig.ListenPacket)
    * [type Listener interface](#Listener)
        * [func FileListener(f *os.File) (ln Listener, err error)](#FileListener)
        * [func Listen(network, address string) (Listener, error)](#Listen)
        * [func fileListener(f *os.File) (Listener, error)](#fileListener)
        * [func newLocalListener(network string) (Listener, error)](#newLocalListener)
    * [type MX struct](#MX)
    * [type NS struct](#NS)
    * [type OpError struct](#OpError)
        * [func (e *OpError) Error() string](#OpError.Error)
        * [func (e *OpError) Temporary() bool](#OpError.Temporary)
        * [func (e *OpError) Timeout() bool](#OpError.Timeout)
        * [func (e *OpError) Unwrap() error](#OpError.Unwrap)
        * [func (e *OpError) isValid() error](#OpError.isValid)
    * [type PacketConn interface](#PacketConn)
        * [func FilePacketConn(f *os.File) (c PacketConn, err error)](#FilePacketConn)
        * [func ListenPacket(network, address string) (PacketConn, error)](#ListenPacket)
        * [func filePacketConn(f *os.File) (PacketConn, error)](#filePacketConn)
        * [func newLocalPacketListener(network string) (PacketConn, error)](#newLocalPacketListener)
    * [type ParseError struct](#ParseError)
        * [func (e *ParseError) Error() string](#ParseError.Error)
        * [func (e *ParseError) Temporary() bool](#ParseError.Temporary)
        * [func (e *ParseError) Timeout() bool](#ParseError.Timeout)
    * [type Resolver struct](#Resolver)
        * [func (r *Resolver) LookupAddr(ctx context.Context, addr string) ([]string, error)](#Resolver.LookupAddr)
        * [func (r *Resolver) LookupCNAME(ctx context.Context, host string) (string, error)](#Resolver.LookupCNAME)
        * [func (r *Resolver) LookupHost(ctx context.Context, host string) (addrs []string, err error)](#Resolver.LookupHost)
        * [func (r *Resolver) LookupIP(ctx context.Context, network, host string) ([]IP, error)](#Resolver.LookupIP)
        * [func (r *Resolver) LookupIPAddr(ctx context.Context, host string) ([]IPAddr, error)](#Resolver.LookupIPAddr)
        * [func (r *Resolver) LookupMX(ctx context.Context, name string) ([]*MX, error)](#Resolver.LookupMX)
        * [func (r *Resolver) LookupNS(ctx context.Context, name string) ([]*NS, error)](#Resolver.LookupNS)
        * [func (r *Resolver) LookupPort(ctx context.Context, network, service string) (port int, err error)](#Resolver.LookupPort)
        * [func (r *Resolver) LookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)](#Resolver.LookupSRV)
        * [func (r *Resolver) LookupTXT(ctx context.Context, name string) ([]string, error)](#Resolver.LookupTXT)
        * [func (r *Resolver) dial(ctx context.Context, network, server string) (Conn, error)](#Resolver.dial)
        * [func (r *Resolver) exchange(ctx context.Context, server string, q dnsmessage.Question, timeout time.Duration, useTCP bool) (dnsmessage.Parser, dnsmessage.Header, error)](#Resolver.exchange)
        * [func (r *Resolver) getLookupGroup() *singleflight.Group](#Resolver.getLookupGroup)
        * [func (r *Resolver) goLookupCNAME(ctx context.Context, host string) (string, error)](#Resolver.goLookupCNAME)
        * [func (r *Resolver) goLookupHost(ctx context.Context, name string) (addrs []string, err error)](#Resolver.goLookupHost)
        * [func (r *Resolver) goLookupHostOrder(ctx context.Context, name string, order hostLookupOrder) (addrs []string, err error)](#Resolver.goLookupHostOrder)
        * [func (r *Resolver) goLookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)](#Resolver.goLookupIP)
        * [func (r *Resolver) goLookupIPCNAMEOrder(ctx context.Context, network, name string, order hostLookupOrder) (addrs []IPAddr, cname dnsmessage.Name, err error)](#Resolver.goLookupIPCNAMEOrder)
        * [func (r *Resolver) goLookupPTR(ctx context.Context, addr string) ([]string, error)](#Resolver.goLookupPTR)
        * [func (r *Resolver) internetAddrList(ctx context.Context, net, addr string) (addrList, error)](#Resolver.internetAddrList)
        * [func (r *Resolver) lookup(ctx context.Context, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)](#Resolver.lookup)
        * [func (r *Resolver) lookupAddr(ctx context.Context, addr string) ([]string, error)](#Resolver.lookupAddr)
        * [func (r *Resolver) lookupCNAME(ctx context.Context, name string) (string, error)](#Resolver.lookupCNAME)
        * [func (r *Resolver) lookupHost(ctx context.Context, host string) (addrs []string, err error)](#Resolver.lookupHost)
        * [func (r *Resolver) lookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)](#Resolver.lookupIP)
        * [func (r *Resolver) lookupIPAddr(ctx context.Context, network, host string) ([]IPAddr, error)](#Resolver.lookupIPAddr)
        * [func (r *Resolver) lookupMX(ctx context.Context, name string) ([]*MX, error)](#Resolver.lookupMX)
        * [func (r *Resolver) lookupNS(ctx context.Context, name string) ([]*NS, error)](#Resolver.lookupNS)
        * [func (r *Resolver) lookupPort(ctx context.Context, network, service string) (int, error)](#Resolver.lookupPort)
        * [func (r *Resolver) lookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)](#Resolver.lookupSRV)
        * [func (r *Resolver) lookupTXT(ctx context.Context, name string) ([]string, error)](#Resolver.lookupTXT)
        * [func (r *Resolver) preferGo() bool](#Resolver.preferGo)
        * [func (r *Resolver) resolveAddrList(ctx context.Context, op, network, addr string, hint Addr) (addrList, error)](#Resolver.resolveAddrList)
        * [func (r *Resolver) strictErrors() bool](#Resolver.strictErrors)
        * [func (r *Resolver) tryOneName(ctx context.Context, cfg *dnsConfig, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)](#Resolver.tryOneName)
    * [type SRV struct](#SRV)
    * [type TCPAddr struct](#TCPAddr)
        * [func ResolveTCPAddr(network, address string) (*TCPAddr, error)](#ResolveTCPAddr)
        * [func (a *TCPAddr) Network() string](#TCPAddr.Network)
        * [func (a *TCPAddr) String() string](#TCPAddr.String)
        * [func (a *TCPAddr) family() int](#TCPAddr.family)
        * [func (a *TCPAddr) isWildcard() bool](#TCPAddr.isWildcard)
        * [func (a *TCPAddr) opAddr() Addr](#TCPAddr.opAddr)
        * [func (a *TCPAddr) sockaddr(family int) (syscall.Sockaddr, error)](#TCPAddr.sockaddr)
        * [func (a *TCPAddr) toLocal(net string) sockaddr](#TCPAddr.toLocal)
    * [type TCPConn struct](#TCPConn)
        * [func DialTCP(network string, laddr, raddr *TCPAddr) (*TCPConn, error)](#DialTCP)
        * [func newTCPConn(fd *netFD) *TCPConn](#newTCPConn)
        * [func slowDialTCP(ctx context.Context, network string, laddr, raddr *TCPAddr) (*TCPConn, error)](#slowDialTCP)
        * [func (c *TCPConn) CloseRead() error](#TCPConn.CloseRead)
        * [func (c *TCPConn) CloseWrite() error](#TCPConn.CloseWrite)
        * [func (c *TCPConn) ReadFrom(r io.Reader) (int64, error)](#TCPConn.ReadFrom)
        * [func (c *TCPConn) SetKeepAlive(keepalive bool) error](#TCPConn.SetKeepAlive)
        * [func (c *TCPConn) SetKeepAlivePeriod(d time.Duration) error](#TCPConn.SetKeepAlivePeriod)
        * [func (c *TCPConn) SetLinger(sec int) error](#TCPConn.SetLinger)
        * [func (c *TCPConn) SetNoDelay(noDelay bool) error](#TCPConn.SetNoDelay)
        * [func (c *TCPConn) SyscallConn() (syscall.RawConn, error)](#TCPConn.SyscallConn)
        * [func (c *TCPConn) readFrom(r io.Reader) (int64, error)](#TCPConn.readFrom)
    * [type TCPListener struct](#TCPListener)
        * [func ListenTCP(network string, laddr *TCPAddr) (*TCPListener, error)](#ListenTCP)
        * [func (l *TCPListener) Accept() (Conn, error)](#TCPListener.Accept)
        * [func (l *TCPListener) AcceptTCP() (*TCPConn, error)](#TCPListener.AcceptTCP)
        * [func (l *TCPListener) Addr() Addr](#TCPListener.Addr)
        * [func (l *TCPListener) Close() error](#TCPListener.Close)
        * [func (l *TCPListener) File() (f *os.File, err error)](#TCPListener.File)
        * [func (l *TCPListener) SetDeadline(t time.Time) error](#TCPListener.SetDeadline)
        * [func (l *TCPListener) SyscallConn() (syscall.RawConn, error)](#TCPListener.SyscallConn)
        * [func (ln *TCPListener) accept() (*TCPConn, error)](#TCPListener.accept)
        * [func (ln *TCPListener) close() error](#TCPListener.close)
        * [func (ln *TCPListener) file() (*os.File, error)](#TCPListener.file)
        * [func (ln *TCPListener) ok() bool](#TCPListener.ok)
        * [func (ln *TCPListener) port() string](#TCPListener.port)
    * [type UDPAddr struct](#UDPAddr)
        * [func ResolveUDPAddr(network, address string) (*UDPAddr, error)](#ResolveUDPAddr)
        * [func (a *UDPAddr) Network() string](#UDPAddr.Network)
        * [func (a *UDPAddr) String() string](#UDPAddr.String)
        * [func (a *UDPAddr) family() int](#UDPAddr.family)
        * [func (a *UDPAddr) isWildcard() bool](#UDPAddr.isWildcard)
        * [func (a *UDPAddr) opAddr() Addr](#UDPAddr.opAddr)
        * [func (a *UDPAddr) sockaddr(family int) (syscall.Sockaddr, error)](#UDPAddr.sockaddr)
        * [func (a *UDPAddr) toLocal(net string) sockaddr](#UDPAddr.toLocal)
    * [type UDPConn struct](#UDPConn)
        * [func DialUDP(network string, laddr, raddr *UDPAddr) (*UDPConn, error)](#DialUDP)
        * [func ListenMulticastUDP(network string, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)](#ListenMulticastUDP)
        * [func ListenUDP(network string, laddr *UDPAddr) (*UDPConn, error)](#ListenUDP)
        * [func newUDPConn(fd *netFD) *UDPConn](#newUDPConn)
        * [func (c *UDPConn) ReadFrom(b []byte) (int, Addr, error)](#UDPConn.ReadFrom)
        * [func (c *UDPConn) ReadFromUDP(b []byte) (n int, addr *UDPAddr, err error)](#UDPConn.ReadFromUDP)
        * [func (c *UDPConn) ReadMsgUDP(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)](#UDPConn.ReadMsgUDP)
        * [func (c *UDPConn) SyscallConn() (syscall.RawConn, error)](#UDPConn.SyscallConn)
        * [func (c *UDPConn) WriteMsgUDP(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)](#UDPConn.WriteMsgUDP)
        * [func (c *UDPConn) WriteTo(b []byte, addr Addr) (int, error)](#UDPConn.WriteTo)
        * [func (c *UDPConn) WriteToUDP(b []byte, addr *UDPAddr) (int, error)](#UDPConn.WriteToUDP)
        * [func (c *UDPConn) port() string](#UDPConn.port)
        * [func (c *UDPConn) readFrom(b []byte, addr *UDPAddr) (int, *UDPAddr, error)](#UDPConn.readFrom)
        * [func (c *UDPConn) readFromUDP(b []byte, addr *UDPAddr) (int, *UDPAddr, error)](#UDPConn.readFromUDP)
        * [func (c *UDPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)](#UDPConn.readMsg)
        * [func (c *UDPConn) writeMsg(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)](#UDPConn.writeMsg)
        * [func (c *UDPConn) writeTo(b []byte, addr *UDPAddr) (int, error)](#UDPConn.writeTo)
    * [type UnixAddr struct](#UnixAddr)
        * [func ResolveUnixAddr(network, address string) (*UnixAddr, error)](#ResolveUnixAddr)
        * [func (a *UnixAddr) Network() string](#UnixAddr.Network)
        * [func (a *UnixAddr) String() string](#UnixAddr.String)
        * [func (a *UnixAddr) family() int](#UnixAddr.family)
        * [func (a *UnixAddr) isWildcard() bool](#UnixAddr.isWildcard)
        * [func (a *UnixAddr) opAddr() Addr](#UnixAddr.opAddr)
        * [func (a *UnixAddr) sockaddr(family int) (syscall.Sockaddr, error)](#UnixAddr.sockaddr)
        * [func (a *UnixAddr) toLocal(net string) sockaddr](#UnixAddr.toLocal)
    * [type UnixConn struct](#UnixConn)
        * [func DialUnix(network string, laddr, raddr *UnixAddr) (*UnixConn, error)](#DialUnix)
        * [func ListenUnixgram(network string, laddr *UnixAddr) (*UnixConn, error)](#ListenUnixgram)
        * [func newUnixConn(fd *netFD) *UnixConn](#newUnixConn)
        * [func (c *UnixConn) CloseRead() error](#UnixConn.CloseRead)
        * [func (c *UnixConn) CloseWrite() error](#UnixConn.CloseWrite)
        * [func (c *UnixConn) ReadFrom(b []byte) (int, Addr, error)](#UnixConn.ReadFrom)
        * [func (c *UnixConn) ReadFromUnix(b []byte) (int, *UnixAddr, error)](#UnixConn.ReadFromUnix)
        * [func (c *UnixConn) ReadMsgUnix(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)](#UnixConn.ReadMsgUnix)
        * [func (c *UnixConn) SyscallConn() (syscall.RawConn, error)](#UnixConn.SyscallConn)
        * [func (c *UnixConn) WriteMsgUnix(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)](#UnixConn.WriteMsgUnix)
        * [func (c *UnixConn) WriteTo(b []byte, addr Addr) (int, error)](#UnixConn.WriteTo)
        * [func (c *UnixConn) WriteToUnix(b []byte, addr *UnixAddr) (int, error)](#UnixConn.WriteToUnix)
        * [func (c *UnixConn) readFrom(b []byte) (int, *UnixAddr, error)](#UnixConn.readFrom)
        * [func (c *UnixConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)](#UnixConn.readMsg)
        * [func (c *UnixConn) writeMsg(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)](#UnixConn.writeMsg)
        * [func (c *UnixConn) writeTo(b []byte, addr *UnixAddr) (int, error)](#UnixConn.writeTo)
    * [type UnixListener struct](#UnixListener)
        * [func ListenUnix(network string, laddr *UnixAddr) (*UnixListener, error)](#ListenUnix)
        * [func (l *UnixListener) Accept() (Conn, error)](#UnixListener.Accept)
        * [func (l *UnixListener) AcceptUnix() (*UnixConn, error)](#UnixListener.AcceptUnix)
        * [func (l *UnixListener) Addr() Addr](#UnixListener.Addr)
        * [func (l *UnixListener) Close() error](#UnixListener.Close)
        * [func (l *UnixListener) File() (f *os.File, err error)](#UnixListener.File)
        * [func (l *UnixListener) SetDeadline(t time.Time) error](#UnixListener.SetDeadline)
        * [func (l *UnixListener) SetUnlinkOnClose(unlink bool)](#UnixListener.SetUnlinkOnClose)
        * [func (l *UnixListener) SyscallConn() (syscall.RawConn, error)](#UnixListener.SyscallConn)
        * [func (ln *UnixListener) accept() (*UnixConn, error)](#UnixListener.accept)
        * [func (ln *UnixListener) close() error](#UnixListener.close)
        * [func (ln *UnixListener) file() (*os.File, error)](#UnixListener.file)
        * [func (ln *UnixListener) ok() bool](#UnixListener.ok)
    * [type UnknownNetworkError string](#UnknownNetworkError)
        * [func (e UnknownNetworkError) Error() string](#UnknownNetworkError.Error)
        * [func (e UnknownNetworkError) Temporary() bool](#UnknownNetworkError.Temporary)
        * [func (e UnknownNetworkError) Timeout() bool](#UnknownNetworkError.Timeout)
    * [type addrList []net.Addr](#addrList)
        * [func filterAddrList(filter func(IPAddr) bool, ips []IPAddr, inetaddr func(IPAddr) Addr, originalAddr string) (addrList, error)](#filterAddrList)
        * [func (addrs addrList) first(strategy func(Addr) bool) Addr](#addrList.first)
        * [func (addrs addrList) forResolve(network, addr string) Addr](#addrList.forResolve)
        * [func (addrs addrList) partition(strategy func(Addr) bool) (primaries, fallbacks addrList)](#addrList.partition)
    * [type addrinfoErrno int](#addrinfoErrno)
        * [func (eai addrinfoErrno) Error() string](#addrinfoErrno.Error)
        * [func (eai addrinfoErrno) Temporary() bool](#addrinfoErrno.Temporary)
        * [func (eai addrinfoErrno) Timeout() bool](#addrinfoErrno.Timeout)
    * [type buffersWriter interface](#buffersWriter)
    * [type byMaskLength []net.policyTableEntry](#byMaskLength)
        * [func (s byMaskLength) Len() int](#byMaskLength.Len)
        * [func (s byMaskLength) Less(i, j int) bool](#byMaskLength.Less)
        * [func (s byMaskLength) Swap(i, j int)](#byMaskLength.Swap)
    * [type byPref []*net.MX](#byPref)
        * [func (s byPref) Len() int](#byPref.Len)
        * [func (s byPref) Less(i, j int) bool](#byPref.Less)
        * [func (s byPref) Swap(i, j int)](#byPref.Swap)
        * [func (s byPref) sort()](#byPref.sort)
    * [type byPriorityWeight []*net.SRV](#byPriorityWeight)
        * [func (s byPriorityWeight) Len() int](#byPriorityWeight.Len)
        * [func (s byPriorityWeight) Less(i, j int) bool](#byPriorityWeight.Less)
        * [func (s byPriorityWeight) Swap(i, j int)](#byPriorityWeight.Swap)
        * [func (addrs byPriorityWeight) shuffleByWeight()](#byPriorityWeight.shuffleByWeight)
        * [func (addrs byPriorityWeight) sort()](#byPriorityWeight.sort)
    * [type byRFC6724 struct](#byRFC6724)
        * [func (s *byRFC6724) Len() int](#byRFC6724.Len)
        * [func (s *byRFC6724) Less(i, j int) bool](#byRFC6724.Less)
        * [func (s *byRFC6724) Swap(i, j int)](#byRFC6724.Swap)
    * [type conf struct](#conf)
        * [func systemConf() *conf](#systemConf)
        * [func (c *conf) canUseCgo() bool](#conf.canUseCgo)
        * [func (c *conf) hostLookupOrder(r *Resolver, hostname string) (ret hostLookupOrder)](#conf.hostLookupOrder)
    * [type conn struct](#conn)
        * [func (c *conn) Close() error](#conn.Close)
        * [func (c *conn) File() (f *os.File, err error)](#conn.File)
        * [func (c *conn) LocalAddr() Addr](#conn.LocalAddr)
        * [func (c *conn) Read(b []byte) (int, error)](#conn.Read)
        * [func (c *conn) RemoteAddr() Addr](#conn.RemoteAddr)
        * [func (c *conn) SetDeadline(t time.Time) error](#conn.SetDeadline)
        * [func (c *conn) SetReadBuffer(bytes int) error](#conn.SetReadBuffer)
        * [func (c *conn) SetReadDeadline(t time.Time) error](#conn.SetReadDeadline)
        * [func (c *conn) SetWriteBuffer(bytes int) error](#conn.SetWriteBuffer)
        * [func (c *conn) SetWriteDeadline(t time.Time) error](#conn.SetWriteDeadline)
        * [func (c *conn) Write(b []byte) (int, error)](#conn.Write)
        * [func (c *conn) ok() bool](#conn.ok)
        * [func (c *conn) writeBuffers(v *Buffers) (int64, error)](#conn.writeBuffers)
    * [type contextWithNonZeroDeadline struct](#contextWithNonZeroDeadline)
        * [func (contextWithNonZeroDeadline) Deadline() (time.Time, bool)](#contextWithNonZeroDeadline.Deadline)
    * [type dnsConfig struct](#dnsConfig)
        * [func dnsReadConfig(filename string) *dnsConfig](#dnsReadConfig)
        * [func (conf *dnsConfig) nameList(name string) []string](#dnsConfig.nameList)
        * [func (c *dnsConfig) serverOffset() uint32](#dnsConfig.serverOffset)
    * [type dnsNameTest struct](#dnsNameTest)
    * [type dualStackServer struct](#dualStackServer)
        * [func newDualStackServer() (*dualStackServer, error)](#newDualStackServer)
        * [func (dss *dualStackServer) buildup(handler func(*dualStackServer, Listener)) error](#dualStackServer.buildup)
        * [func (dss *dualStackServer) teardown() error](#dualStackServer.teardown)
        * [func (dss *dualStackServer) teardownNetwork(network string) error](#dualStackServer.teardownNetwork)
    * [type fakeDNSConn struct](#fakeDNSConn)
        * [func (f *fakeDNSConn) Close() error](#fakeDNSConn.Close)
        * [func (f *fakeDNSConn) Read(b []byte) (int, error)](#fakeDNSConn.Read)
        * [func (f *fakeDNSConn) SetDeadline(t time.Time) error](#fakeDNSConn.SetDeadline)
        * [func (f *fakeDNSConn) Write(b []byte) (int, error)](#fakeDNSConn.Write)
    * [type fakeDNSPacketConn struct](#fakeDNSPacketConn)
        * [func (f *fakeDNSPacketConn) Close() error](#fakeDNSPacketConn.Close)
        * [func (f *fakeDNSPacketConn) SetDeadline(t time.Time) error](#fakeDNSPacketConn.SetDeadline)
    * [type fakeDNSServer struct](#fakeDNSServer)
        * [func (server *fakeDNSServer) DialContext(_ context.Context, n, s string) (Conn, error)](#fakeDNSServer.DialContext)
    * [type file struct](#file)
        * [func open(name string) (*file, error)](#open)
        * [func (f *file) close()](#file.close)
        * [func (f *file) getLineFromData() (s string, ok bool)](#file.getLineFromData)
        * [func (f *file) readLine() (s string, ok bool)](#file.readLine)
    * [type fileAddr string](#fileAddr)
        * [func (fileAddr) Network() string](#fileAddr.Network)
        * [func (f fileAddr) String() string](#fileAddr.String)
    * [type hostLookupOrder int](#hostLookupOrder)
        * [func (o hostLookupOrder) String() string](#hostLookupOrder.String)
    * [type ifStats struct](#ifStats)
        * [func interfaceStats(ift []Interface) *ifStats](#interfaceStats)
    * [type ipAttr struct](#ipAttr)
        * [func ipAttrOf(ip IP) ipAttr](#ipAttrOf)
    * [type ipLookupResult struct](#ipLookupResult)
    * [type ipStackCapabilities struct](#ipStackCapabilities)
        * [func (p *ipStackCapabilities) probe()](#ipStackCapabilities.probe)
    * [type ipv6LinkLocalUnicastTest struct](#ipv6LinkLocalUnicastTest)
    * [type ipv6ZoneCache struct](#ipv6ZoneCache)
        * [func (zc *ipv6ZoneCache) index(name string) int](#ipv6ZoneCache.index)
        * [func (zc *ipv6ZoneCache) name(index int) string](#ipv6ZoneCache.name)
        * [func (zc *ipv6ZoneCache) update(ift []Interface, force bool) (updated bool)](#ipv6ZoneCache.update)
    * [type localPacketServer struct](#localPacketServer)
        * [func newLocalPacketServer(network string) (*localPacketServer, error)](#newLocalPacketServer)
        * [func (ls *localPacketServer) buildup(handler func(*localPacketServer, PacketConn)) error](#localPacketServer.buildup)
        * [func (ls *localPacketServer) teardown() error](#localPacketServer.teardown)
    * [type localServer struct](#localServer)
        * [func newLocalServer(network string) (*localServer, error)](#newLocalServer)
        * [func (ls *localServer) buildup(handler func(*localServer, Listener)) error](#localServer.buildup)
        * [func (ls *localServer) teardown() error](#localServer.teardown)
        * [func (ls *localServer) transponder(ln Listener, ch chan<- error)](#localServer.transponder)
    * [type lookupCustomResolver struct](#lookupCustomResolver)
        * [func (lcr *lookupCustomResolver) dial() func(ctx context.Context, network, address string) (Conn, error)](#lookupCustomResolver.dial)
    * [type netFD struct](#netFD)
        * [func internetSocket(ctx context.Context, net string, laddr, raddr sockaddr, sotype, proto int, mode string, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)](#internetSocket)
        * [func newFD(sysfd, family, sotype int, net string) (*netFD, error)](#newFD)
        * [func newFileFD(f *os.File) (*netFD, error)](#newFileFD)
        * [func socket(ctx context.Context, net string, family, sotype, proto int, ipv6only bool, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)](#socket)
        * [func unixSocket(ctx context.Context, net string, laddr, raddr sockaddr, mode string, ctrlFn func(string, string, syscall.RawConn) error) (*netFD, error)](#unixSocket)
        * [func (fd *netFD) Close() error](#netFD.Close)
        * [func (fd *netFD) Read(p []byte) (n int, err error)](#netFD.Read)
        * [func (fd *netFD) SetDeadline(t time.Time) error](#netFD.SetDeadline)
        * [func (fd *netFD) SetReadDeadline(t time.Time) error](#netFD.SetReadDeadline)
        * [func (fd *netFD) SetWriteDeadline(t time.Time) error](#netFD.SetWriteDeadline)
        * [func (fd *netFD) Write(p []byte) (nn int, err error)](#netFD.Write)
        * [func (fd *netFD) accept() (netfd *netFD, err error)](#netFD.accept)
        * [func (fd *netFD) addrFunc() func(syscall.Sockaddr) Addr](#netFD.addrFunc)
        * [func (fd *netFD) closeRead() error](#netFD.closeRead)
        * [func (fd *netFD) closeWrite() error](#netFD.closeWrite)
        * [func (fd *netFD) connect(ctx context.Context, la, ra syscall.Sockaddr) (rsa syscall.Sockaddr, ret error)](#netFD.connect)
        * [func (fd *netFD) ctrlNetwork() string](#netFD.ctrlNetwork)
        * [func (fd *netFD) dial(ctx context.Context, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error](#netFD.dial)
        * [func (fd *netFD) dup() (f *os.File, err error)](#netFD.dup)
        * [func (fd *netFD) init() error](#netFD.init.fd_unix.go)
        * [func (fd *netFD) listenDatagram(laddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error](#netFD.listenDatagram)
        * [func (fd *netFD) listenStream(laddr sockaddr, backlog int, ctrlFn func(string, string, syscall.RawConn) error) error](#netFD.listenStream)
        * [func (fd *netFD) name() string](#netFD.name)
        * [func (fd *netFD) readFrom(p []byte) (n int, sa syscall.Sockaddr, err error)](#netFD.readFrom)
        * [func (fd *netFD) readMsg(p []byte, oob []byte, flags int) (n, oobn, retflags int, sa syscall.Sockaddr, err error)](#netFD.readMsg)
        * [func (fd *netFD) setAddr(laddr, raddr Addr)](#netFD.setAddr)
        * [func (fd *netFD) shutdown(how int) error](#netFD.shutdown)
        * [func (fd *netFD) writeBuffers(v *Buffers) (n int64, err error)](#netFD.writeBuffers)
        * [func (fd *netFD) writeMsg(p []byte, oob []byte, sa syscall.Sockaddr) (n int, oobn int, err error)](#netFD.writeMsg)
        * [func (fd *netFD) writeTo(p []byte, sa syscall.Sockaddr) (n int, err error)](#netFD.writeTo)
    * [type neverEnding byte](#neverEnding)
        * [func (b neverEnding) Read(p []byte) (int, error)](#neverEnding.Read)
    * [type nssConf struct](#nssConf)
        * [func nssStr(s string) *nssConf](#nssStr)
        * [func parseNSSConf(r io.Reader) *nssConf](#parseNSSConf)
        * [func parseNSSConfFile(file string) *nssConf](#parseNSSConfFile)
    * [type nssCriterion struct](#nssCriterion)
        * [func (c nssCriterion) standardStatusAction(last bool) bool](#nssCriterion.standardStatusAction)
    * [type nssHostTest struct](#nssHostTest)
    * [type nssSource struct](#nssSource)
        * [func (s nssSource) standardCriteria() bool](#nssSource.standardCriteria)
    * [type onlyValuesCtx struct](#onlyValuesCtx)
        * [func (ovc *onlyValuesCtx) Value(key interface{}) interface{}](#onlyValuesCtx.Value)
    * [type packetListener struct](#packetListener)
        * [func (pl *packetListener) newLocalServer() (*localPacketServer, error)](#packetListener.newLocalServer)
    * [type pipe struct](#pipe)
        * [func (p *pipe) Close() error](#pipe.Close)
        * [func (*pipe) LocalAddr() Addr](#pipe.LocalAddr)
        * [func (p *pipe) Read(b []byte) (int, error)](#pipe.Read)
        * [func (*pipe) RemoteAddr() Addr](#pipe.RemoteAddr)
        * [func (p *pipe) SetDeadline(t time.Time) error](#pipe.SetDeadline)
        * [func (p *pipe) SetReadDeadline(t time.Time) error](#pipe.SetReadDeadline)
        * [func (p *pipe) SetWriteDeadline(t time.Time) error](#pipe.SetWriteDeadline)
        * [func (p *pipe) Write(b []byte) (int, error)](#pipe.Write)
        * [func (p *pipe) read(b []byte) (n int, err error)](#pipe.read)
        * [func (p *pipe) write(b []byte) (n int, err error)](#pipe.write)
    * [type pipeAddr struct{}](#pipeAddr)
        * [func (pipeAddr) Network() string](#pipeAddr.Network)
        * [func (pipeAddr) String() string](#pipeAddr.String)
    * [type pipeDeadline struct](#pipeDeadline)
        * [func makePipeDeadline() pipeDeadline](#makePipeDeadline)
        * [func (d *pipeDeadline) set(t time.Time)](#pipeDeadline.set)
        * [func (d *pipeDeadline) wait() chan struct{}](#pipeDeadline.wait)
    * [type policyTable []net.policyTableEntry](#policyTable)
        * [func (t policyTable) Classify(ip IP) policyTableEntry](#policyTable.Classify)
    * [type policyTableEntry struct](#policyTableEntry)
    * [type portLookupResult struct](#portLookupResult)
    * [type rawConn struct](#rawConn)
        * [func newRawConn(fd *netFD) (*rawConn, error)](#newRawConn)
        * [func (c *rawConn) Control(f func(uintptr)) error](#rawConn.Control)
        * [func (c *rawConn) Read(f func(uintptr) bool) error](#rawConn.Read)
        * [func (c *rawConn) Write(f func(uintptr) bool) error](#rawConn.Write)
        * [func (c *rawConn) ok() bool](#rawConn.ok)
    * [type rawListener struct](#rawListener)
        * [func newRawListener(fd *netFD) (*rawListener, error)](#newRawListener)
        * [func (l *rawListener) Read(func(uintptr) bool) error](#rawListener.Read)
        * [func (l *rawListener) Write(func(uintptr) bool) error](#rawListener.Write)
    * [type resolvConfTest struct](#resolvConfTest)
        * [func newResolvConfTest() (*resolvConfTest, error)](#newResolvConfTest)
        * [func (conf *resolvConfTest) forceUpdate(name string, lastChecked time.Time) error](#resolvConfTest.forceUpdate)
        * [func (conf *resolvConfTest) servers() []string](#resolvConfTest.servers)
        * [func (conf *resolvConfTest) teardown() error](#resolvConfTest.teardown)
        * [func (conf *resolvConfTest) writeAndUpdate(lines []string) error](#resolvConfTest.writeAndUpdate)
    * [type resolveIPAddrTest struct](#resolveIPAddrTest)
    * [type resolveTCPAddrTest struct](#resolveTCPAddrTest)
    * [type resolveUDPAddrTest struct](#resolveUDPAddrTest)
    * [type resolverConfig struct](#resolverConfig)
        * [func (conf *resolverConfig) init()](#resolverConfig.init.dnsclient_unix.go)
        * [func (conf *resolverConfig) releaseSema()](#resolverConfig.releaseSema)
        * [func (conf *resolverConfig) tryAcquireSema() bool](#resolverConfig.tryAcquireSema)
        * [func (conf *resolverConfig) tryUpdate(name string)](#resolverConfig.tryUpdate)
    * [type reverseLookupResult struct](#reverseLookupResult)
    * [type routeStats struct](#routeStats)
        * [func validateInterfaceMulticastAddrs(ifat []Addr) (*routeStats, error)](#validateInterfaceMulticastAddrs)
        * [func validateInterfaceUnicastAddrs(ifat []Addr) (*routeStats, error)](#validateInterfaceUnicastAddrs)
    * [type scope uint8](#scope)
        * [func classifyScope(ip IP) scope](#classifyScope)
    * [type sockaddr interface](#sockaddr)
    * [type staticHostEntry struct](#staticHostEntry)
    * [type streamListener struct](#streamListener)
        * [func (sl *streamListener) newLocalServer() (*localServer, error)](#streamListener.newLocalServer)
    * [type sysDialer struct](#sysDialer)
        * [func (sd *sysDialer) dialIP(ctx context.Context, laddr, raddr *IPAddr) (*IPConn, error)](#sysDialer.dialIP)
        * [func (sd *sysDialer) dialParallel(ctx context.Context, primaries, fallbacks addrList) (Conn, error)](#sysDialer.dialParallel)
        * [func (sd *sysDialer) dialSerial(ctx context.Context, ras addrList) (Conn, error)](#sysDialer.dialSerial)
        * [func (sd *sysDialer) dialSingle(ctx context.Context, ra Addr) (c Conn, err error)](#sysDialer.dialSingle)
        * [func (sd *sysDialer) dialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)](#sysDialer.dialTCP)
        * [func (sd *sysDialer) dialUDP(ctx context.Context, laddr, raddr *UDPAddr) (*UDPConn, error)](#sysDialer.dialUDP)
        * [func (sd *sysDialer) dialUnix(ctx context.Context, laddr, raddr *UnixAddr) (*UnixConn, error)](#sysDialer.dialUnix)
        * [func (sd *sysDialer) doDialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)](#sysDialer.doDialTCP)
    * [type sysListener struct](#sysListener)
        * [func (sl *sysListener) listenIP(ctx context.Context, laddr *IPAddr) (*IPConn, error)](#sysListener.listenIP)
        * [func (sl *sysListener) listenMulticastUDP(ctx context.Context, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)](#sysListener.listenMulticastUDP)
        * [func (sl *sysListener) listenTCP(ctx context.Context, laddr *TCPAddr) (*TCPListener, error)](#sysListener.listenTCP)
        * [func (sl *sysListener) listenUDP(ctx context.Context, laddr *UDPAddr) (*UDPConn, error)](#sysListener.listenUDP)
        * [func (sl *sysListener) listenUnix(ctx context.Context, laddr *UnixAddr) (*UnixListener, error)](#sysListener.listenUnix)
        * [func (sl *sysListener) listenUnixgram(ctx context.Context, laddr *UnixAddr) (*UnixConn, error)](#sysListener.listenUnixgram)
    * [type temporary interface](#temporary)
    * [type testInterface struct](#testInterface)
        * [func (ti *testInterface) setBroadcast(vid int) error](#testInterface.setBroadcast)
        * [func (ti *testInterface) setLinkLocal(suffix int) error](#testInterface.setLinkLocal)
        * [func (ti *testInterface) setPointToPoint(suffix int) error](#testInterface.setPointToPoint)
        * [func (ti *testInterface) setup() error](#testInterface.setup)
        * [func (ti *testInterface) teardown() error](#testInterface.teardown)
    * [type timeout interface](#timeout)
    * [type timeoutError struct{}](#timeoutError)
        * [func (e *timeoutError) Error() string](#timeoutError.Error)
        * [func (e *timeoutError) Temporary() bool](#timeoutError.Temporary)
        * [func (e *timeoutError) Timeout() bool](#timeoutError.Timeout)
    * [type writerOnly struct](#writerOnly)
* [Functions](#func)
    * [func BenchmarkDNSName(b *testing.B)](#BenchmarkDNSName)
    * [func BenchmarkGoLookupIP(b *testing.B)](#BenchmarkGoLookupIP)
    * [func BenchmarkGoLookupIPNoSuchHost(b *testing.B)](#BenchmarkGoLookupIPNoSuchHost)
    * [func BenchmarkGoLookupIPWithBrokenNameServer(b *testing.B)](#BenchmarkGoLookupIPWithBrokenNameServer)
    * [func BenchmarkIPEqual(b *testing.B)](#BenchmarkIPEqual)
    * [func BenchmarkIPMaskString(b *testing.B)](#BenchmarkIPMaskString)
    * [func BenchmarkIPString(b *testing.B)](#BenchmarkIPString)
    * [func BenchmarkInterfaceAddrs(b *testing.B)](#BenchmarkInterfaceAddrs)
    * [func BenchmarkInterfaceByIndex(b *testing.B)](#BenchmarkInterfaceByIndex)
    * [func BenchmarkInterfaceByName(b *testing.B)](#BenchmarkInterfaceByName)
    * [func BenchmarkInterfaces(b *testing.B)](#BenchmarkInterfaces)
    * [func BenchmarkInterfacesAndAddrs(b *testing.B)](#BenchmarkInterfacesAndAddrs)
    * [func BenchmarkInterfacesAndMulticastAddrs(b *testing.B)](#BenchmarkInterfacesAndMulticastAddrs)
    * [func BenchmarkParseIP(b *testing.B)](#BenchmarkParseIP)
    * [func BenchmarkSetReadDeadline(b *testing.B)](#BenchmarkSetReadDeadline)
    * [func BenchmarkTCP4ConcurrentReadWrite(b *testing.B)](#BenchmarkTCP4ConcurrentReadWrite)
    * [func BenchmarkTCP4OneShot(b *testing.B)](#BenchmarkTCP4OneShot)
    * [func BenchmarkTCP4OneShotTimeout(b *testing.B)](#BenchmarkTCP4OneShotTimeout)
    * [func BenchmarkTCP4Persistent(b *testing.B)](#BenchmarkTCP4Persistent)
    * [func BenchmarkTCP4PersistentTimeout(b *testing.B)](#BenchmarkTCP4PersistentTimeout)
    * [func BenchmarkTCP6ConcurrentReadWrite(b *testing.B)](#BenchmarkTCP6ConcurrentReadWrite)
    * [func BenchmarkTCP6OneShot(b *testing.B)](#BenchmarkTCP6OneShot)
    * [func BenchmarkTCP6OneShotTimeout(b *testing.B)](#BenchmarkTCP6OneShotTimeout)
    * [func BenchmarkTCP6Persistent(b *testing.B)](#BenchmarkTCP6Persistent)
    * [func BenchmarkTCP6PersistentTimeout(b *testing.B)](#BenchmarkTCP6PersistentTimeout)
    * [func BenchmarkUDP6LinkLocalUnicast(b *testing.B)](#BenchmarkUDP6LinkLocalUnicast)
    * [func BenchmarkWriteToReadFromUDP(b *testing.B)](#BenchmarkWriteToReadFromUDP)
    * [func InterfaceAddrs() ([]Addr, error)](#InterfaceAddrs)
    * [func Interfaces() ([]Interface, error)](#Interfaces)
    * [func JoinHostPort(host, port string) string](#JoinHostPort)
    * [func LookupAddr(addr string) (names []string, err error)](#LookupAddr)
    * [func LookupCNAME(host string) (cname string, err error)](#LookupCNAME)
    * [func LookupHost(host string) (addrs []string, err error)](#LookupHost)
    * [func LookupIP(host string) ([]IP, error)](#LookupIP)
    * [func LookupMX(name string) ([]*MX, error)](#LookupMX)
    * [func LookupNS(name string) ([]*NS, error)](#LookupNS)
    * [func LookupPort(network, service string) (port int, err error)](#LookupPort)
    * [func LookupSRV(service, proto, name string) (cname string, addrs []*SRV, err error)](#LookupSRV)
    * [func LookupTXT(name string) ([]string, error)](#LookupTXT)
    * [func Pipe() (Conn, Conn)](#Pipe)
    * [func SplitHostPort(hostport string) (host, port string, err error)](#SplitHostPort)
    * [func TestAcceptError(t *testing.T)](#TestAcceptError)
    * [func TestAcceptIgnoreAbortedConnRequest(t *testing.T)](#TestAcceptIgnoreAbortedConnRequest)
    * [func TestAcceptTimeout(t *testing.T)](#TestAcceptTimeout)
    * [func TestAcceptTimeoutMustNotReturn(t *testing.T)](#TestAcceptTimeoutMustNotReturn)
    * [func TestAcceptTimeoutMustReturn(t *testing.T)](#TestAcceptTimeoutMustReturn)
    * [func TestAddrList(t *testing.T)](#TestAddrList)
    * [func TestAddrListPartition(t *testing.T)](#TestAddrListPartition)
    * [func TestAvoidDNSName(t *testing.T)](#TestAvoidDNSName)
    * [func TestBuffers_WriteTo(t *testing.T)](#TestBuffers_WriteTo)
    * [func TestBuffers_consume(t *testing.T)](#TestBuffers_consume)
    * [func TestBuffers_read(t *testing.T)](#TestBuffers_read)
    * [func TestCIDRMask(t *testing.T)](#TestCIDRMask)
    * [func TestCVE202133195(t *testing.T)](#TestCVE202133195)
    * [func TestCancelAfterDial(t *testing.T)](#TestCancelAfterDial)
    * [func TestCgoLookupIP(t *testing.T)](#TestCgoLookupIP)
    * [func TestCgoLookupIPWithCancel(t *testing.T)](#TestCgoLookupIPWithCancel)
    * [func TestCgoLookupPTR(t *testing.T)](#TestCgoLookupPTR)
    * [func TestCgoLookupPTRWithCancel(t *testing.T)](#TestCgoLookupPTRWithCancel)
    * [func TestCgoLookupPort(t *testing.T)](#TestCgoLookupPort)
    * [func TestCgoLookupPortWithCancel(t *testing.T)](#TestCgoLookupPortWithCancel)
    * [func TestCloseError(t *testing.T)](#TestCloseError)
    * [func TestCloseRead(t *testing.T)](#TestCloseRead)
    * [func TestCloseUnblocksRead(t *testing.T)](#TestCloseUnblocksRead)
    * [func TestCloseWrite(t *testing.T)](#TestCloseWrite)
    * [func TestClosingListener(t *testing.T)](#TestClosingListener)
    * [func TestConcurrentPreferGoResolversDial(t *testing.T)](#TestConcurrentPreferGoResolversDial)
    * [func TestConcurrentSetDeadline(t *testing.T)](#TestConcurrentSetDeadline)
    * [func TestConfHostLookupOrder(t *testing.T)](#TestConfHostLookupOrder)
    * [func TestConnAndListener(t *testing.T)](#TestConnAndListener)
    * [func TestConnAndPacketConn(t *testing.T)](#TestConnAndPacketConn)
    * [func TestConnClose(t *testing.T)](#TestConnClose)
    * [func TestCopyPipeIntoTCP(t *testing.T)](#TestCopyPipeIntoTCP)
    * [func TestDNSDefaultSearch(t *testing.T)](#TestDNSDefaultSearch)
    * [func TestDNSDialTCP(t *testing.T)](#TestDNSDialTCP)
    * [func TestDNSFlood(t *testing.T)](#TestDNSFlood)
    * [func TestDNSGoroutineRace(t *testing.T)](#TestDNSGoroutineRace)
    * [func TestDNSName(t *testing.T)](#TestDNSName)
    * [func TestDNSNameLength(t *testing.T)](#TestDNSNameLength)
    * [func TestDNSReadConfig(t *testing.T)](#TestDNSReadConfig)
    * [func TestDNSReadMissingFile(t *testing.T)](#TestDNSReadMissingFile)
    * [func TestDNSSRVUniformity(t *testing.T)](#TestDNSSRVUniformity)
    * [func TestDNSTransportFallback(t *testing.T)](#TestDNSTransportFallback)
    * [func TestDNSUseTCP(t *testing.T)](#TestDNSUseTCP)
    * [func TestDialAddrError(t *testing.T)](#TestDialAddrError)
    * [func TestDialCancel(t *testing.T)](#TestDialCancel)
    * [func TestDialContextCancelRace(t *testing.T)](#TestDialContextCancelRace)
    * [func TestDialError(t *testing.T)](#TestDialError)
    * [func TestDialGoogle(t *testing.T)](#TestDialGoogle)
    * [func TestDialListenIPArgs(t *testing.T)](#TestDialListenIPArgs)
    * [func TestDialListenerAddr(t *testing.T)](#TestDialListenerAddr)
    * [func TestDialLocal(t *testing.T)](#TestDialLocal)
    * [func TestDialParallel(t *testing.T)](#TestDialParallel)
    * [func TestDialParallelSpuriousConnection(t *testing.T)](#TestDialParallelSpuriousConnection)
    * [func TestDialTimeout(t *testing.T)](#TestDialTimeout)
    * [func TestDialTimeoutMaxDuration(t *testing.T)](#TestDialTimeoutMaxDuration)
    * [func TestDialWithNonZeroDeadline(t *testing.T)](#TestDialWithNonZeroDeadline)
    * [func TestDialerControl(t *testing.T)](#TestDialerControl)
    * [func TestDialerDualStack(t *testing.T)](#TestDialerDualStack)
    * [func TestDialerDualStackFDLeak(t *testing.T)](#TestDialerDualStackFDLeak)
    * [func TestDialerFallbackDelay(t *testing.T)](#TestDialerFallbackDelay)
    * [func TestDialerKeepAlive(t *testing.T)](#TestDialerKeepAlive)
    * [func TestDialerLocalAddr(t *testing.T)](#TestDialerLocalAddr)
    * [func TestDialerPartialDeadline(t *testing.T)](#TestDialerPartialDeadline)
    * [func TestDtoi(t *testing.T)](#TestDtoi)
    * [func TestDualStackTCPListener(t *testing.T)](#TestDualStackTCPListener)
    * [func TestDualStackUDPListener(t *testing.T)](#TestDualStackUDPListener)
    * [func TestEndlessWrite(t *testing.T)](#TestEndlessWrite)
    * [func TestErrorForOriginalNameWhenSearching(t *testing.T)](#TestErrorForOriginalNameWhenSearching)
    * [func TestErrors(t *testing.T)](#TestErrors)
    * [func TestFileCloseRace(t *testing.T)](#TestFileCloseRace)
    * [func TestFileConn(t *testing.T)](#TestFileConn)
    * [func TestFileError(t *testing.T)](#TestFileError)
    * [func TestFileListener(t *testing.T)](#TestFileListener)
    * [func TestFilePacketConn(t *testing.T)](#TestFilePacketConn)
    * [func TestGoDebugString(t *testing.T)](#TestGoDebugString)
    * [func TestGoLookupIPOrderFallbackToFile(t *testing.T)](#TestGoLookupIPOrderFallbackToFile)
    * [func TestGoLookupIPWithResolverConfig(t *testing.T)](#TestGoLookupIPWithResolverConfig)
    * [func TestHostCacheModification(t *testing.T)](#TestHostCacheModification)
    * [func TestIPAddrFamily(t *testing.T)](#TestIPAddrFamily)
    * [func TestIPAddrScope(t *testing.T)](#TestIPAddrScope)
    * [func TestIPConnLocalName(t *testing.T)](#TestIPConnLocalName)
    * [func TestIPConnRemoteName(t *testing.T)](#TestIPConnRemoteName)
    * [func TestIPConnSpecificMethods(t *testing.T)](#TestIPConnSpecificMethods)
    * [func TestIPMask(t *testing.T)](#TestIPMask)
    * [func TestIPMaskString(t *testing.T)](#TestIPMaskString)
    * [func TestIPNetContains(t *testing.T)](#TestIPNetContains)
    * [func TestIPNetString(t *testing.T)](#TestIPNetString)
    * [func TestIPString(t *testing.T)](#TestIPString)
    * [func TestIPVersion(t *testing.T)](#TestIPVersion)
    * [func TestIPv4MulticastListener(t *testing.T)](#TestIPv4MulticastListener)
    * [func TestIPv6LinkLocalUnicastTCP(t *testing.T)](#TestIPv6LinkLocalUnicastTCP)
    * [func TestIPv6LinkLocalUnicastUDP(t *testing.T)](#TestIPv6LinkLocalUnicastUDP)
    * [func TestIPv6MulticastListener(t *testing.T)](#TestIPv6MulticastListener)
    * [func TestIgnoreDNSForgeries(t *testing.T)](#TestIgnoreDNSForgeries)
    * [func TestIgnoreLameReferrals(t *testing.T)](#TestIgnoreLameReferrals)
    * [func TestInterfaceAddrs(t *testing.T)](#TestInterfaceAddrs)
    * [func TestInterfaceArrivalAndDeparture(t *testing.T)](#TestInterfaceArrivalAndDeparture)
    * [func TestInterfaceArrivalAndDepartureZoneCache(t *testing.T)](#TestInterfaceArrivalAndDepartureZoneCache)
    * [func TestInterfaceMulticastAddrs(t *testing.T)](#TestInterfaceMulticastAddrs)
    * [func TestInterfaceUnicastAddrs(t *testing.T)](#TestInterfaceUnicastAddrs)
    * [func TestInterfaces(t *testing.T)](#TestInterfaces)
    * [func TestIssue8434(t *testing.T)](#TestIssue8434)
    * [func TestIssueNoSuchHostExists(t *testing.T)](#TestIssueNoSuchHostExists)
    * [func TestJoinHostPort(t *testing.T)](#TestJoinHostPort)
    * [func TestListenCloseListen(t *testing.T)](#TestListenCloseListen)
    * [func TestListenConfigControl(t *testing.T)](#TestListenConfigControl)
    * [func TestListenError(t *testing.T)](#TestListenError)
    * [func TestListenPacketError(t *testing.T)](#TestListenPacketError)
    * [func TestListenerClose(t *testing.T)](#TestListenerClose)
    * [func TestLookupCNAME(t *testing.T)](#TestLookupCNAME)
    * [func TestLookupContextCancel(t *testing.T)](#TestLookupContextCancel)
    * [func TestLookupDotsWithLocalSource(t *testing.T)](#TestLookupDotsWithLocalSource)
    * [func TestLookupDotsWithRemoteSource(t *testing.T)](#TestLookupDotsWithRemoteSource)
    * [func TestLookupGmailMX(t *testing.T)](#TestLookupGmailMX)
    * [func TestLookupGmailNS(t *testing.T)](#TestLookupGmailNS)
    * [func TestLookupGmailTXT(t *testing.T)](#TestLookupGmailTXT)
    * [func TestLookupGoogleHost(t *testing.T)](#TestLookupGoogleHost)
    * [func TestLookupGoogleIP(t *testing.T)](#TestLookupGoogleIP)
    * [func TestLookupGooglePublicDNSAddr(t *testing.T)](#TestLookupGooglePublicDNSAddr)
    * [func TestLookupGoogleSRV(t *testing.T)](#TestLookupGoogleSRV)
    * [func TestLookupHostCancel(t *testing.T)](#TestLookupHostCancel)
    * [func TestLookupIPAddrConcurrentCallsForNetworks(t *testing.T)](#TestLookupIPAddrConcurrentCallsForNetworks)
    * [func TestLookupIPAddrPreservesContextValues(t *testing.T)](#TestLookupIPAddrPreservesContextValues)
    * [func TestLookupIPv6LinkLocalAddr(t *testing.T)](#TestLookupIPv6LinkLocalAddr)
    * [func TestLookupIPv6LinkLocalAddrWithZone(t *testing.T)](#TestLookupIPv6LinkLocalAddrWithZone)
    * [func TestLookupLongTXT(t *testing.T)](#TestLookupLongTXT)
    * [func TestLookupNonLDH(t *testing.T)](#TestLookupNonLDH)
    * [func TestLookupNullByte(t *testing.T)](#TestLookupNullByte)
    * [func TestLookupPort(t *testing.T)](#TestLookupPort)
    * [func TestLookupPort_Minimal(t *testing.T)](#TestLookupPort_Minimal)
    * [func TestLookupProtocol_Minimal(t *testing.T)](#TestLookupProtocol_Minimal)
    * [func TestLookupStaticAddr(t *testing.T)](#TestLookupStaticAddr)
    * [func TestLookupStaticHost(t *testing.T)](#TestLookupStaticHost)
    * [func TestLookupTorOnion(t *testing.T)](#TestLookupTorOnion)
    * [func TestLookupWithIP(t *testing.T)](#TestLookupWithIP)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestMarshalEmptyIP(t *testing.T)](#TestMarshalEmptyIP)
    * [func TestNetworkNumberAndMask(t *testing.T)](#TestNetworkNumberAndMask)
    * [func TestNilResolverLookup(t *testing.T)](#TestNilResolverLookup)
    * [func TestNoSuchHost(t *testing.T)](#TestNoSuchHost)
    * [func TestNotTemporaryRead(t *testing.T)](#TestNotTemporaryRead)
    * [func TestPTRandNonPTR(t *testing.T)](#TestPTRandNonPTR)
    * [func TestPacketConn(t *testing.T)](#TestPacketConn)
    * [func TestPacketConnClose(t *testing.T)](#TestPacketConnClose)
    * [func TestParseCIDR(t *testing.T)](#TestParseCIDR)
    * [func TestParseIP(t *testing.T)](#TestParseIP)
    * [func TestParseMAC(t *testing.T)](#TestParseMAC)
    * [func TestParseNSSConf(t *testing.T)](#TestParseNSSConf)
    * [func TestParsePort(t *testing.T)](#TestParsePort)
    * [func TestPointToPointInterface(t *testing.T)](#TestPointToPointInterface)
    * [func TestProhibitionaryDialArg(t *testing.T)](#TestProhibitionaryDialArg)
    * [func TestProtocolDialError(t *testing.T)](#TestProtocolDialError)
    * [func TestProtocolListenError(t *testing.T)](#TestProtocolListenError)
    * [func TestRFC6724ClassifyScope(t *testing.T)](#TestRFC6724ClassifyScope)
    * [func TestRFC6724CommonPrefixLength(t *testing.T)](#TestRFC6724CommonPrefixLength)
    * [func TestRFC6724PolicyTableClassify(t *testing.T)](#TestRFC6724PolicyTableClassify)
    * [func TestRawConnControl(t *testing.T)](#TestRawConnControl)
    * [func TestRawConnReadWrite(t *testing.T)](#TestRawConnReadWrite)
    * [func TestReadFromTimeout(t *testing.T)](#TestReadFromTimeout)
    * [func TestReadFromTimeoutFluctuation(t *testing.T)](#TestReadFromTimeoutFluctuation)
    * [func TestReadLine(t *testing.T)](#TestReadLine)
    * [func TestReadTimeout(t *testing.T)](#TestReadTimeout)
    * [func TestReadTimeoutFluctuation(t *testing.T)](#TestReadTimeoutFluctuation)
    * [func TestReadTimeoutMustNotReturn(t *testing.T)](#TestReadTimeoutMustNotReturn)
    * [func TestReadTimeoutUnblocksRead(t *testing.T)](#TestReadTimeoutUnblocksRead)
    * [func TestReadUnixgramWithUnnamedSocket(t *testing.T)](#TestReadUnixgramWithUnnamedSocket)
    * [func TestReadWriteDeadlineRace(t *testing.T)](#TestReadWriteDeadlineRace)
    * [func TestReadWriteProlongedTimeout(t *testing.T)](#TestReadWriteProlongedTimeout)
    * [func TestResolveGoogle(t *testing.T)](#TestResolveGoogle)
    * [func TestResolveIPAddr(t *testing.T)](#TestResolveIPAddr)
    * [func TestResolveTCPAddr(t *testing.T)](#TestResolveTCPAddr)
    * [func TestResolveUDPAddr(t *testing.T)](#TestResolveUDPAddr)
    * [func TestResolverLookupIP(t *testing.T)](#TestResolverLookupIP)
    * [func TestRetryTimeout(t *testing.T)](#TestRetryTimeout)
    * [func TestReverseAddress(t *testing.T)](#TestReverseAddress)
    * [func TestRotate(t *testing.T)](#TestRotate)
    * [func TestSendfile(t *testing.T)](#TestSendfile)
    * [func TestSendfileOnWriteTimeoutExceeded(t *testing.T)](#TestSendfileOnWriteTimeoutExceeded)
    * [func TestSendfileParts(t *testing.T)](#TestSendfileParts)
    * [func TestSendfilePipe(t *testing.T)](#TestSendfilePipe)
    * [func TestSendfileSeeked(t *testing.T)](#TestSendfileSeeked)
    * [func TestSingleRequestLookup(t *testing.T)](#TestSingleRequestLookup)
    * [func TestSortByRFC6724(t *testing.T)](#TestSortByRFC6724)
    * [func TestSpecialDomainName(t *testing.T)](#TestSpecialDomainName)
    * [func TestSplitHostPort(t *testing.T)](#TestSplitHostPort)
    * [func TestSpuriousENOTAVAIL(t *testing.T)](#TestSpuriousENOTAVAIL)
    * [func TestStrictErrorsLookupIP(t *testing.T)](#TestStrictErrorsLookupIP)
    * [func TestStrictErrorsLookupTXT(t *testing.T)](#TestStrictErrorsLookupTXT)
    * [func TestSystemConf(t *testing.T)](#TestSystemConf)
    * [func TestTCPBig(t *testing.T)](#TestTCPBig)
    * [func TestTCPConcurrentAccept(t *testing.T)](#TestTCPConcurrentAccept)
    * [func TestTCPConnSpecificMethods(t *testing.T)](#TestTCPConnSpecificMethods)
    * [func TestTCPListener(t *testing.T)](#TestTCPListener)
    * [func TestTCPListenerName(t *testing.T)](#TestTCPListenerName)
    * [func TestTCPListenerSpecificMethods(t *testing.T)](#TestTCPListenerSpecificMethods)
    * [func TestTCPReadWriteAllocs(t *testing.T)](#TestTCPReadWriteAllocs)
    * [func TestTCPSelfConnect(t *testing.T)](#TestTCPSelfConnect)
    * [func TestTCPServer(t *testing.T)](#TestTCPServer)
    * [func TestTCPSpuriousConnSetupCompletion(t *testing.T)](#TestTCPSpuriousConnSetupCompletion)
    * [func TestTCPSpuriousConnSetupCompletionWithCancel(t *testing.T)](#TestTCPSpuriousConnSetupCompletionWithCancel)
    * [func TestTCPStress(t *testing.T)](#TestTCPStress)
    * [func TestTXTRecordTwoStrings(t *testing.T)](#TestTXTRecordTwoStrings)
    * [func TestUDPConnLocalAndRemoteNames(t *testing.T)](#TestUDPConnLocalAndRemoteNames)
    * [func TestUDPConnLocalName(t *testing.T)](#TestUDPConnLocalName)
    * [func TestUDPConnSpecificMethods(t *testing.T)](#TestUDPConnSpecificMethods)
    * [func TestUDPListener(t *testing.T)](#TestUDPListener)
    * [func TestUDPReadSizeError(t *testing.T)](#TestUDPReadSizeError)
    * [func TestUDPReadTimeout(t *testing.T)](#TestUDPReadTimeout)
    * [func TestUDPServer(t *testing.T)](#TestUDPServer)
    * [func TestUDPZeroByteBuffer(t *testing.T)](#TestUDPZeroByteBuffer)
    * [func TestUDPZeroBytePayload(t *testing.T)](#TestUDPZeroBytePayload)
    * [func TestUnixAndUnixpacketServer(t *testing.T)](#TestUnixAndUnixpacketServer)
    * [func TestUnixConnLocalAndRemoteNames(t *testing.T)](#TestUnixConnLocalAndRemoteNames)
    * [func TestUnixConnReadMsgUnixSCMRightsCloseOnExec(t *testing.T)](#TestUnixConnReadMsgUnixSCMRightsCloseOnExec)
    * [func TestUnixConnSpecificMethods(t *testing.T)](#TestUnixConnSpecificMethods)
    * [func TestUnixListenerSpecificMethods(t *testing.T)](#TestUnixListenerSpecificMethods)
    * [func TestUnixUnlink(t *testing.T)](#TestUnixUnlink)
    * [func TestUnixgramConnLocalAndRemoteNames(t *testing.T)](#TestUnixgramConnLocalAndRemoteNames)
    * [func TestUnixgramServer(t *testing.T)](#TestUnixgramServer)
    * [func TestUnixgramWrite(t *testing.T)](#TestUnixgramWrite)
    * [func TestUnixgramZeroByteBuffer(t *testing.T)](#TestUnixgramZeroByteBuffer)
    * [func TestUnixgramZeroBytePayload(t *testing.T)](#TestUnixgramZeroBytePayload)
    * [func TestUpdateResolvConf(t *testing.T)](#TestUpdateResolvConf)
    * [func TestVariousDeadlines(t *testing.T)](#TestVariousDeadlines)
    * [func TestVariousDeadlines1Proc(t *testing.T)](#TestVariousDeadlines1Proc)
    * [func TestVariousDeadlines4Proc(t *testing.T)](#TestVariousDeadlines4Proc)
    * [func TestWeighting(t *testing.T)](#TestWeighting)
    * [func TestWildWildcardListener(t *testing.T)](#TestWildWildcardListener)
    * [func TestWithUnexpiredValuesPreserved(t *testing.T)](#TestWithUnexpiredValuesPreserved)
    * [func TestWriteTimeout(t *testing.T)](#TestWriteTimeout)
    * [func TestWriteTimeoutFluctuation(t *testing.T)](#TestWriteTimeoutFluctuation)
    * [func TestWriteTimeoutMustNotReturn(t *testing.T)](#TestWriteTimeoutMustNotReturn)
    * [func TestWriteToTimeout(t *testing.T)](#TestWriteToTimeout)
    * [func TestWriteToUDP(t *testing.T)](#TestWriteToUDP)
    * [func TestWritevError(t *testing.T)](#TestWritevError)
    * [func TestZeroByteRead(t *testing.T)](#TestZeroByteRead)
    * [func absDomainName(b []byte) string](#absDomainName)
    * [func acquireThread()](#acquireThread)
    * [func allFF(b []byte) bool](#allFF)
    * [func appendHex(dst []byte, i uint32) []byte](#appendHex)
    * [func avoidDNS(name string) bool](#avoidDNS)
    * [func benchmarkIPEqual(b *testing.B, size int)](#benchmarkIPEqual)
    * [func benchmarkIPString(b *testing.B, size int)](#benchmarkIPString)
    * [func benchmarkTCP(b *testing.B, persistent, timeout bool, laddr string)](#benchmarkTCP)
    * [func benchmarkTCPConcurrentReadWrite(b *testing.B, laddr string)](#benchmarkTCPConcurrentReadWrite)
    * [func boolint(b bool) int](#boolint)
    * [func cgoIPLookup(result chan<- ipLookupResult, network, name string)](#cgoIPLookup)
    * [func cgoLookupAddrPTR(addr string, sa *C.struct_sockaddr, salen C.socklen_t) (names []string, err error)](#cgoLookupAddrPTR)
    * [func cgoLookupCNAME(ctx context.Context, name string) (cname string, err error, completed bool)](#cgoLookupCNAME)
    * [func cgoLookupHost(ctx context.Context, name string) (hosts []string, err error, completed bool)](#cgoLookupHost)
    * [func cgoLookupIP(ctx context.Context, network, name string) (addrs []IPAddr, err error, completed bool)](#cgoLookupIP)
    * [func cgoLookupIPCNAME(network, name string) (addrs []IPAddr, cname string, err error)](#cgoLookupIPCNAME)
    * [func cgoLookupPTR(ctx context.Context, addr string) (names []string, err error, completed bool)](#cgoLookupPTR)
    * [func cgoLookupPort(ctx context.Context, network, service string) (port int, err error, completed bool)](#cgoLookupPort)
    * [func cgoLookupServicePort(hints *C.struct_addrinfo, network, service string) (port int, err error)](#cgoLookupServicePort)
    * [func cgoNameinfoPTR(b []byte, sa *C.struct_sockaddr, salen C.socklen_t) (int, error)](#cgoNameinfoPTR)
    * [func cgoPortLookup(result chan<- portLookupResult, hints *C.struct_addrinfo, network, service string)](#cgoPortLookup)
    * [func cgoReverseLookup(result chan<- reverseLookupResult, addr string, sa *C.struct_sockaddr, salen C.socklen_t)](#cgoReverseLookup)
    * [func cgoSockaddr(ip IP, zone string) (*C.struct_sockaddr, C.socklen_t)](#cgoSockaddr)
    * [func cgoSockaddrInet4(ip IP) *C.struct_sockaddr](#cgoSockaddrInet4)
    * [func cgoSockaddrInet6(ip IP, zone int) *C.struct_sockaddr](#cgoSockaddrInet6)
    * [func checkDistribution(t *testing.T, data []*SRV, margin float64)](#checkDistribution)
    * [func checkDualStackAddrFamily(fd *netFD) error](#checkDualStackAddrFamily)
    * [func checkDualStackSecondListener(network, address string, err, xerr error) error](#checkDualStackSecondListener)
    * [func checkFirstListener(network string, ln interface{}) error](#checkFirstListener)
    * [func checkHeader(p *dnsmessage.Parser, h dnsmessage.Header) error](#checkHeader)
    * [func checkMulticastListener(c *UDPConn, ip IP) error](#checkMulticastListener)
    * [func checkMulticastStats(ifStats *ifStats, uniStats, multiStats *routeStats) error](#checkMulticastStats)
    * [func checkResponse(reqID uint16, reqQues dnsmessage.Question, respHdr dnsmessage.Header, respQues dnsmessage.Question) bool](#checkResponse)
    * [func checkSecondListener(network, address string, err error) error](#checkSecondListener)
    * [func checkUnicastStats(ifStats *ifStats, uniStats *routeStats) error](#checkUnicastStats)
    * [func commonPrefixLen(a, b IP) (cpl int)](#commonPrefixLen)
    * [func concurrentThreadsLimit() int](#concurrentThreadsLimit)
    * [func condFatalf(t *testing.T, network string, format string, args ...interface{})](#condFatalf)
    * [func controlOnConnSetup(network string, address string, c syscall.RawConn) error](#controlOnConnSetup)
    * [func controlRawConn(c syscall.RawConn, addr Addr) error](#controlRawConn)
    * [func count(s string, b byte) int](#count)
    * [func countAnyByte(s string, t string) int](#countAnyByte)
    * [func dialClosedPort(t *testing.T) (actual, expected time.Duration)](#dialClosedPort)
    * [func differentWildcardAddr(i, j string) bool](#differentWildcardAddr)
    * [func disableSocketConnect(network string)](#disableSocketConnect)
    * [func dnsDefaultSearch() []string](#dnsDefaultSearch)
    * [func dnsPacketRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)](#dnsPacketRoundTrip)
    * [func dnsStreamRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)](#dnsStreamRoundTrip)
    * [func dtoi(s string) (n int, i int, ok bool)](#dtoi)
    * [func dupSocket(f *os.File) (int, error)](#dupSocket)
    * [func emitDNSNameTest(ch chan<- dnsNameTest)](#emitDNSNameTest)
    * [func enableSocketConnect()](#enableSocketConnect)
    * [func ensureRooted(s string) string](#ensureRooted)
    * [func equalASCIIName(x, y dnsmessage.Name) bool](#equalASCIIName)
    * [func fastrand() uint32](#fastrand)
    * [func favoriteAddrFamily(network string, laddr, raddr sockaddr, mode string) (family int, ipv6only bool)](#favoriteAddrFamily)
    * [func fcntl(fd int, cmd int, arg int) (int, error)](#fcntl)
    * [func fetchGoogle(dial func(string, string) (Conn, error), network, address string) error](#fetchGoogle)
    * [func forceCgoDNS() func()](#forceCgoDNS)
    * [func forceCloseSockets()](#forceCloseSockets)
    * [func forceGoDNS() func()](#forceGoDNS)
    * [func foreachField(x []byte, fn func(field []byte) error) error](#foreachField)
    * [func foreachLine(x []byte, fn func(line []byte) error) error](#foreachLine)
    * [func genericReadFrom(w io.Writer, r io.Reader) (n int64, err error)](#genericReadFrom)
    * [func getFields(s string) []string](#getFields)
    * [func goDebugNetDNS() (dnsMode string, debugLevel int)](#goDebugNetDNS)
    * [func goDebugString(key string) string](#goDebugString)
    * [func goLookupIPFiles(name string) (addrs []IPAddr)](#goLookupIPFiles)
    * [func goLookupPort(network, service string) (port int, err error)](#goLookupPort)
    * [func googleLiteralAddrs() (lits4, lits6 []string, err error)](#googleLiteralAddrs)
    * [func hasPrefix(s, prefix string) bool](#hasPrefix)
    * [func hasSuffixFold(s, suffix string) bool](#hasSuffixFold)
    * [func hexString(b []byte) string](#hexString)
    * [func iOS() bool](#iOS)
    * [func init()](#init.addrselect.go)
    * [func init()](#init.platform_test.go)
    * [func initConfVal()](#initConfVal)
    * [func installTestHooks()](#installTestHooks)
    * [func interfaceAddrTable(ifi *Interface) ([]Addr, error)](#interfaceAddrTable)
    * [func interfaceMessages(ifindex int) ([]route.Message, error)](#interfaceMessages)
    * [func interfaceMulticastAddrTable(ifi *Interface) ([]Addr, error)](#interfaceMulticastAddrTable)
    * [func interfaceTable(ifindex int) ([]Interface, error)](#interfaceTable)
    * [func ipAddrsEface(addrs []IPAddr) []interface{}](#ipAddrsEface)
    * [func ipEmptyString(ip IP) string](#ipEmptyString)
    * [func ipToSockaddr(family int, ip IP, port int, zone string) (syscall.Sockaddr, error)](#ipToSockaddr)
    * [func ipVersion(network string) byte](#ipVersion)
    * [func ipv4only(addr IPAddr) bool](#ipv4only)
    * [func ipv6LinkLocalUnicastAddr(ifi *Interface) string](#ipv6LinkLocalUnicastAddr)
    * [func ipv6only(addr IPAddr) bool](#ipv6only)
    * [func isClosedChan(c <-chan struct{}) bool](#isClosedChan)
    * [func isConnError(err error) bool](#isConnError)
    * [func isDeadlineExceeded(err error) bool](#isDeadlineExceeded)
    * [func isDomainName(s string) bool](#isDomainName)
    * [func isGateway(h string) bool](#isGateway)
    * [func isIPv4(addr Addr) bool](#isIPv4)
    * [func isLocalhost(h string) bool](#isLocalhost)
    * [func isNotIPv4(addr Addr) bool](#isNotIPv4)
    * [func isPlatformError(err error) bool](#isPlatformError)
    * [func isSpace(b byte) bool](#isSpace)
    * [func isZeros(p IP) bool](#isZeros)
    * [func joinIPv4Group(fd *netFD, ifi *Interface, ip IP) error](#joinIPv4Group)
    * [func joinIPv6Group(fd *netFD, ifi *Interface, ip IP) error](#joinIPv6Group)
    * [func last(s string, b byte) int](#last)
    * [func listenIPv4MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error](#listenIPv4MulticastUDP)
    * [func listenIPv6MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error](#listenIPv6MulticastUDP)
    * [func listenerBacklog() int](#listenerBacklog)
    * [func lookupIPReturn(addrsi interface{}, err error, shared bool) ([]IPAddr, error)](#lookupIPReturn)
    * [func lookupLocalhost(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)](#lookupLocalhost)
    * [func lookupPortMap(network, service string) (port int, error error)](#lookupPortMap)
    * [func lookupProtocol(_ context.Context, name string) (int, error)](#lookupProtocol)
    * [func lookupProtocolMap(name string) (int, error)](#lookupProtocolMap)
    * [func lookupSlowFast(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)](#lookupSlowFast)
    * [func lookupStaticAddr(addr string) []string](#lookupStaticAddr)
    * [func lookupStaticHost(host string) []string](#lookupStaticHost)
    * [func lookupWithFake(fake fakeDNSServer, name string, typ dnsmessage.Type) error](#lookupWithFake)
    * [func lowerASCII(b byte) byte](#lowerASCII)
    * [func lowerASCIIBytes(x []byte)](#lowerASCIIBytes)
    * [func mapErr(err error) error](#mapErr)
    * [func maxListenerBacklog() int](#maxListenerBacklog)
    * [func minNonzeroTime(a, b time.Time) time.Time](#minNonzeroTime)
    * [func mockTXTResponse(q dnsmessage.Message) dnsmessage.Message](#mockTXTResponse)
    * [func multicastRIBContains(ip IP) (bool, error)](#multicastRIBContains)
    * [func mustHaveExternalNetwork(t *testing.T)](#mustHaveExternalNetwork)
    * [func mustNewName(name string) dnsmessage.Name](#mustNewName)
    * [func mustQuestion(name string, qtype dnsmessage.Type, class dnsmessage.Class) dnsmessage.Question](#mustQuestion)
    * [func mxString(mxs []*MX) string](#mxString)
    * [func name(f interface{}) string](#name)
    * [func newDualStackListener() (lns []*TCPListener, err error)](#newDualStackListener)
    * [func newDualStackPacketListener() (cs []*UDPConn, err error)](#newDualStackPacketListener)
    * [func newRequest(q dnsmessage.Question) (id uint16, udpReq, tcpReq []byte, err error)](#newRequest)
    * [func nsString(nss []*NS) string](#nsString)
    * [func packetConnTestData(t *testing.T, network string) ([]byte, func())](#packetConnTestData)
    * [func packetTransceiver(c PacketConn, wb []byte, dst Addr, ch chan<- error)](#packetTransceiver)
    * [func packetTransponder(c PacketConn, ch chan<- error)](#packetTransponder)
    * [func parseAcceptError(nestedErr error) error](#parseAcceptError)
    * [func parseCloseError(nestedErr error, isShutdown bool) error](#parseCloseError)
    * [func parseCommonError(nestedErr error) error](#parseCommonError)
    * [func parseCriteria(x []byte) (c []nssCriterion, err error)](#parseCriteria)
    * [func parseDialError(nestedErr error) error](#parseDialError)
    * [func parseLiteralIP(addr string) string](#parseLiteralIP)
    * [func parseLookupPortError(nestedErr error) error](#parseLookupPortError)
    * [func parseNetwork(ctx context.Context, network string, needsProto bool) (afnet string, proto int, err error)](#parseNetwork)
    * [func parsePort(service string) (port int, needsLookup bool)](#parsePort)
    * [func parseReadError(nestedErr error) error](#parseReadError)
    * [func parseWriteError(nestedErr error) error](#parseWriteError)
    * [func partialDeadline(now, deadline time.Time, addrsRemaining int) (time.Time, error)](#partialDeadline)
    * [func printInflightSockets()](#printInflightSockets)
    * [func printRunningGoroutines()](#printRunningGoroutines)
    * [func printSocketStats()](#printSocketStats)
    * [func randInt() int](#randInt)
    * [func randIntn(n int) int](#randIntn)
    * [func readFull(r io.Reader) (all []byte, err error)](#readFull)
    * [func readHosts()](#readHosts)
    * [func readProtocols()](#readProtocols)
    * [func readRawConn(c syscall.RawConn, b []byte) (int, error)](#readRawConn)
    * [func readServices()](#readServices)
    * [func releaseThread()](#releaseThread)
    * [func removeComment(line []byte) []byte](#removeComment)
    * [func reverseaddr(addr string) (arpa string, err error)](#reverseaddr)
    * [func roundDurationUp(d time.Duration, to time.Duration) time.Duration](#roundDurationUp)
    * [func runningGoroutines() []string](#runningGoroutines)
    * [func samePlatformError(err, want error) bool](#samePlatformError)
    * [func selfConnect(fd *netFD, err error) bool](#selfConnect)
    * [func sendFile(c *netFD, r io.Reader) (n int64, err error, handled bool)](#sendFile)
    * [func setDefaultListenerSockopts(s int) error](#setDefaultListenerSockopts)
    * [func setDefaultMulticastSockopts(s int) error](#setDefaultMulticastSockopts)
    * [func setDefaultSockopts(s, family, sotype int, ipv6only bool) error](#setDefaultSockopts)
    * [func setIPv4MreqToInterface(mreq *syscall.IPMreq, ifi *Interface) error](#setIPv4MreqToInterface)
    * [func setIPv4MulticastInterface(fd *netFD, ifi *Interface) error](#setIPv4MulticastInterface)
    * [func setIPv4MulticastLoopback(fd *netFD, v bool) error](#setIPv4MulticastLoopback)
    * [func setIPv6MulticastInterface(fd *netFD, ifi *Interface) error](#setIPv6MulticastInterface)
    * [func setIPv6MulticastLoopback(fd *netFD, v bool) error](#setIPv6MulticastLoopback)
    * [func setKeepAlive(fd *netFD, keepalive bool) error](#setKeepAlive)
    * [func setKeepAlivePeriod(fd *netFD, d time.Duration) error](#setKeepAlivePeriod)
    * [func setLinger(fd *netFD, sec int) error](#setLinger)
    * [func setNoDelay(fd *netFD, noDelay bool) error](#setNoDelay)
    * [func setReadBuffer(fd *netFD, bytes int) error](#setReadBuffer)
    * [func setReadMsgCloseOnExec(oob []byte)](#setReadMsgCloseOnExec)
    * [func setWriteBuffer(fd *netFD, bytes int) error](#setWriteBuffer)
    * [func setupTestData()](#setupTestData)
    * [func simpleMaskLength(mask IPMask) int](#simpleMaskLength)
    * [func skipToAnswer(p *dnsmessage.Parser, qtype dnsmessage.Type) error](#skipToAnswer)
    * [func sortByRFC6724(addrs []IPAddr)](#sortByRFC6724)
    * [func sortByRFC6724withSrcs(addrs []IPAddr, srcs []IP)](#sortByRFC6724withSrcs)
    * [func sotypeToNet(sotype int) string](#sotypeToNet)
    * [func splice(c *netFD, r io.Reader) (int64, error, bool)](#splice)
    * [func splitAtBytes(s string, t string) []string](#splitAtBytes)
    * [func splitHostZone(s string) (host, zone string)](#splitHostZone)
    * [func spuriousENOTAVAIL(err error) bool](#spuriousENOTAVAIL)
    * [func srcAddrs(addrs []IPAddr) []IP](#srcAddrs)
    * [func srvString(srvs []*SRV) string](#srvString)
    * [func stat(name string) (mtime time.Time, size int64, err error)](#stat)
    * [func stringsEqualFold(s, t string) bool](#stringsEqualFold)
    * [func stringsHasPrefix(s, prefix string) bool](#stringsHasPrefix)
    * [func stringsHasSuffix(s, suffix string) bool](#stringsHasSuffix)
    * [func stringsHasSuffixFold(s, suffix string) bool](#stringsHasSuffixFold)
    * [func stripIPv4Header(n int, b []byte) int](#stripIPv4Header)
    * [func supportsIPv4() bool](#supportsIPv4)
    * [func supportsIPv4map() bool](#supportsIPv4map)
    * [func supportsIPv6() bool](#supportsIPv6)
    * [func sysSocket(family, sotype, proto int) (int, error)](#sysSocket)
    * [func testBuffer_writeTo(t *testing.T, chunks int, useCopy bool)](#testBuffer_writeTo)
    * [func testDots(t *testing.T, mode string)](#testDots)
    * [func testRotate(t *testing.T, rotate bool, nameservers, wantServers []string)](#testRotate)
    * [func testStaticAddr(t *testing.T, hostsPath string, ent staticHostEntry)](#testStaticAddr)
    * [func testStaticHost(t *testing.T, hostsPath string, ent staticHostEntry)](#testStaticHost)
    * [func testUniformity(t *testing.T, size int, margin float64)](#testUniformity)
    * [func testUnixAddr() string](#testUnixAddr)
    * [func testUnixgramWriteConn(t *testing.T, raddr *UnixAddr)](#testUnixgramWriteConn)
    * [func testUnixgramWritePacketConn(t *testing.T, raddr *UnixAddr)](#testUnixgramWritePacketConn)
    * [func testVariousDeadlines(t *testing.T)](#testVariousDeadlines)
    * [func testWeighting(t *testing.T, margin float64)](#testWeighting)
    * [func testWriteToConn(t *testing.T, raddr string)](#testWriteToConn)
    * [func testWriteToPacketConn(t *testing.T, raddr string)](#testWriteToPacketConn)
    * [func testableAddress(network, address string) bool](#testableAddress)
    * [func testableListenArgs(network, address, client string) bool](#testableListenArgs)
    * [func testableNetwork(network string) bool](#testableNetwork)
    * [func timeoutPacketReceiver(c PacketConn, d, min, max time.Duration, ch chan<- error)](#timeoutPacketReceiver)
    * [func timeoutReceiver(c Conn, d, min, max time.Duration, ch chan<- error)](#timeoutReceiver)
    * [func timeoutTransmitter(c Conn, d, min, max time.Duration, ch chan<- error)](#timeoutTransmitter)
    * [func transceiver(c Conn, wb []byte, ch chan<- error)](#transceiver)
    * [func trimSpace(x []byte) []byte](#trimSpace)
    * [func ubtoa(dst []byte, start int, v byte) int](#ubtoa)
    * [func uninstallTestHooks()](#uninstallTestHooks)
    * [func withTCPConnPair(t *testing.T, peer1, peer2 func(c *TCPConn) error)](#withTCPConnPair)
    * [func withUnexpiredValuesPreserved(lookupCtx context.Context) context.Context](#withUnexpiredValuesPreserved)
    * [func wrapSyscallError(name string, err error) error](#wrapSyscallError)
    * [func writeRawConn(c syscall.RawConn, b []byte) error](#writeRawConn)
    * [func xtoi(s string) (n int, i int, ok bool)](#xtoi)
    * [func xtoi2(s string, e byte) (byte, bool)](#xtoi2)


## <a id="const" href="#const">Constants</a>

### <a id="FlagBroadcast" href="#FlagBroadcast">const FlagBroadcast</a>

```
searchKey: net.FlagBroadcast
tags: [constant number]
```

```Go
const FlagBroadcast // interface supports broadcast access capability

```

### <a id="FlagLoopback" href="#FlagLoopback">const FlagLoopback</a>

```
searchKey: net.FlagLoopback
tags: [constant number]
```

```Go
const FlagLoopback // interface is a loopback interface

```

### <a id="FlagMulticast" href="#FlagMulticast">const FlagMulticast</a>

```
searchKey: net.FlagMulticast
tags: [constant number]
```

```Go
const FlagMulticast // interface supports multicast access capability

```

### <a id="FlagPointToPoint" href="#FlagPointToPoint">const FlagPointToPoint</a>

```
searchKey: net.FlagPointToPoint
tags: [constant number]
```

```Go
const FlagPointToPoint // interface belongs to a point-to-point link

```

### <a id="FlagUp" href="#FlagUp">const FlagUp</a>

```
searchKey: net.FlagUp
tags: [constant number]
```

```Go
const FlagUp Flags = 1 << iota // interface is up

```

### <a id="IPv4len" href="#IPv4len">const IPv4len</a>

```
searchKey: net.IPv4len
tags: [constant number]
```

```Go
const IPv4len = 4
```

IP address lengths (bytes). 

### <a id="IPv6len" href="#IPv6len">const IPv6len</a>

```
searchKey: net.IPv6len
tags: [constant number]
```

```Go
const IPv6len = 16
```

IP address lengths (bytes). 

### <a id="big" href="#big">const big</a>

```
searchKey: net.big
tags: [constant number private]
```

```Go
const big = 0xFFFFFF
```

Bigger than we need, not too big to worry about overflow 

### <a id="cacheMaxAge" href="#cacheMaxAge">const cacheMaxAge</a>

```
searchKey: net.cacheMaxAge
tags: [constant number private]
```

```Go
const cacheMaxAge = 5 * time.Second
```

### <a id="cgoAddrInfoFlags" href="#cgoAddrInfoFlags">const cgoAddrInfoFlags</a>

```
searchKey: net.cgoAddrInfoFlags
tags: [constant private]
```

```Go
const cgoAddrInfoFlags = (C.AI_CANONNAME | C.AI_V4MAPPED | C.AI_ALL) & C.AI_MASK
```

### <a id="defaultTCPKeepAlive" href="#defaultTCPKeepAlive">const defaultTCPKeepAlive</a>

```
searchKey: net.defaultTCPKeepAlive
tags: [constant number private]
```

```Go
const defaultTCPKeepAlive = 15 * time.Second
```

defaultTCPKeepAlive is a default constant value for TCPKeepAlive times See golang.org/issue/31510 

### <a id="hexDigit" href="#hexDigit">const hexDigit</a>

```
searchKey: net.hexDigit
tags: [constant string private]
```

```Go
const hexDigit = "0123456789abcdef"
```

### <a id="hostLookupCgo" href="#hostLookupCgo">const hostLookupCgo</a>

```
searchKey: net.hostLookupCgo
tags: [constant number private]
```

```Go
const hostLookupCgo hostLookupOrder = iota
```

hostLookupCgo means defer to cgo. 

### <a id="hostLookupDNS" href="#hostLookupDNS">const hostLookupDNS</a>

```
searchKey: net.hostLookupDNS
tags: [constant number private]
```

```Go
const hostLookupDNS // only DNS

```

### <a id="hostLookupDNSFiles" href="#hostLookupDNSFiles">const hostLookupDNSFiles</a>

```
searchKey: net.hostLookupDNSFiles
tags: [constant number private]
```

```Go
const hostLookupDNSFiles // dns first

```

### <a id="hostLookupFiles" href="#hostLookupFiles">const hostLookupFiles</a>

```
searchKey: net.hostLookupFiles
tags: [constant number private]
```

```Go
const hostLookupFiles // only files

```

### <a id="hostLookupFilesDNS" href="#hostLookupFilesDNS">const hostLookupFilesDNS</a>

```
searchKey: net.hostLookupFilesDNS
tags: [constant number private]
```

```Go
const hostLookupFilesDNS // files first

```

### <a id="maxNameinfoLen" href="#maxNameinfoLen">const maxNameinfoLen</a>

```
searchKey: net.maxNameinfoLen
tags: [constant number private]
```

```Go
const maxNameinfoLen = 4096
```

These are roughly enough for the following: 

Source		Encoding			Maximum length of single name entry Unicast DNS		ASCII or			<=253 + a NUL terminator 

```
Unicode in RFC 5892		252 * total number of labels + delimiters + a NUL terminator

```
Multicast DNS	UTF-8 in RFC 5198 or		<=253 + a NUL terminator 

```
the same as unicast DNS ASCII	<=253 + a NUL terminator

```
Local database	various				depends on implementation 

### <a id="maxPortBufSize" href="#maxPortBufSize">const maxPortBufSize</a>

```
searchKey: net.maxPortBufSize
tags: [constant number private]
```

```Go
const maxPortBufSize = len("mobility-header") + 10
```

maxPortBufSize is the longest reasonable name of a service (non-numeric port). Currently the longest known IANA-unregistered name is "mobility-header", so we use that length, plus some slop in case something longer is added in the future. 

### <a id="maxProtoLength" href="#maxProtoLength">const maxProtoLength</a>

```
searchKey: net.maxProtoLength
tags: [constant number private]
```

```Go
const maxProtoLength = len("RSVP-E2E-IGNORE") + 10 // with room to grow

```

### <a id="nameinfoLen" href="#nameinfoLen">const nameinfoLen</a>

```
searchKey: net.nameinfoLen
tags: [constant number private]
```

```Go
const nameinfoLen = 64
```

These are roughly enough for the following: 

Source		Encoding			Maximum length of single name entry Unicast DNS		ASCII or			<=253 + a NUL terminator 

```
Unicode in RFC 5892		252 * total number of labels + delimiters + a NUL terminator

```
Multicast DNS	UTF-8 in RFC 5198 or		<=253 + a NUL terminator 

```
the same as unicast DNS ASCII	<=253 + a NUL terminator

```
Local database	various				depends on implementation 

### <a id="newton" href="#newton">const newton</a>

```
searchKey: net.newton
tags: [constant string private]
```

```Go
const newton = "../testdata/Isaac.Newton-Opticks.txt"
```

### <a id="newtonLen" href="#newtonLen">const newtonLen</a>

```
searchKey: net.newtonLen
tags: [constant number private]
```

```Go
const newtonLen = 567198
```

### <a id="newtonSHA256" href="#newtonSHA256">const newtonSHA256</a>

```
searchKey: net.newtonSHA256
tags: [constant string private]
```

```Go
const newtonSHA256 = "d4a9ac22462b35e7821a4f2706c211093da678620a8f9997989ee7cf8d507bbd"
```

### <a id="readFromSyscallName" href="#readFromSyscallName">const readFromSyscallName</a>

```
searchKey: net.readFromSyscallName
tags: [constant string private]
```

```Go
const readFromSyscallName = "recvfrom"
```

### <a id="readMsgFlags" href="#readMsgFlags">const readMsgFlags</a>

```
searchKey: net.readMsgFlags
tags: [constant number private]
```

```Go
const readMsgFlags = 0
```

### <a id="readMsgSyscallName" href="#readMsgSyscallName">const readMsgSyscallName</a>

```
searchKey: net.readMsgSyscallName
tags: [constant string private]
```

```Go
const readMsgSyscallName = "recvmsg"
```

### <a id="readSyscallName" href="#readSyscallName">const readSyscallName</a>

```
searchKey: net.readSyscallName
tags: [constant string private]
```

```Go
const readSyscallName = "read"
```

### <a id="scopeAdminLocal" href="#scopeAdminLocal">const scopeAdminLocal</a>

```
searchKey: net.scopeAdminLocal
tags: [constant number private]
```

```Go
const scopeAdminLocal scope = 0x4
```

### <a id="scopeGlobal" href="#scopeGlobal">const scopeGlobal</a>

```
searchKey: net.scopeGlobal
tags: [constant number private]
```

```Go
const scopeGlobal scope = 0xe
```

### <a id="scopeInterfaceLocal" href="#scopeInterfaceLocal">const scopeInterfaceLocal</a>

```
searchKey: net.scopeInterfaceLocal
tags: [constant number private]
```

```Go
const scopeInterfaceLocal scope = 0x1
```

### <a id="scopeLinkLocal" href="#scopeLinkLocal">const scopeLinkLocal</a>

```
searchKey: net.scopeLinkLocal
tags: [constant number private]
```

```Go
const scopeLinkLocal scope = 0x2
```

### <a id="scopeOrgLocal" href="#scopeOrgLocal">const scopeOrgLocal</a>

```
searchKey: net.scopeOrgLocal
tags: [constant number private]
```

```Go
const scopeOrgLocal scope = 0x8
```

### <a id="scopeSiteLocal" href="#scopeSiteLocal">const scopeSiteLocal</a>

```
searchKey: net.scopeSiteLocal
tags: [constant number private]
```

```Go
const scopeSiteLocal scope = 0x5
```

### <a id="slowDst4" href="#slowDst4">const slowDst4</a>

```
searchKey: net.slowDst4
tags: [constant string private]
```

```Go
const slowDst4 = "198.18.0.254"
```

Define a pair of blackholed (IPv4, IPv6) addresses, for which dialTCP is expected to hang until the timeout elapses. These addresses are reserved for benchmarking by RFC 6890. 

### <a id="slowDst6" href="#slowDst6">const slowDst6</a>

```
searchKey: net.slowDst6
tags: [constant string private]
```

```Go
const slowDst6 = "2001:2::254"
```

Define a pair of blackholed (IPv4, IPv6) addresses, for which dialTCP is expected to hang until the timeout elapses. These addresses are reserved for benchmarking by RFC 6890. 

### <a id="someTimeout" href="#someTimeout">const someTimeout</a>

```
searchKey: net.someTimeout
tags: [constant number private]
```

```Go
const someTimeout = 10 * time.Second
```

someTimeout is used just to test that net.Conn implementations don't explode when their SetFooDeadline methods are called. It isn't actually used for testing timeouts. 

### <a id="sysTCP_KEEPINTVL" href="#sysTCP_KEEPINTVL">const sysTCP_KEEPINTVL</a>

```
searchKey: net.sysTCP_KEEPINTVL
tags: [constant number private]
```

```Go
const sysTCP_KEEPINTVL = 0x101
```

syscall.TCP_KEEPINTVL is missing on some darwin architectures. 

### <a id="ubuntuTrustyAvahi" href="#ubuntuTrustyAvahi">const ubuntuTrustyAvahi</a>

```
searchKey: net.ubuntuTrustyAvahi
tags: [constant string private]
```

```Go
const ubuntuTrustyAvahi = ...
```

### <a id="useTCPOnly" href="#useTCPOnly">const useTCPOnly</a>

```
searchKey: net.useTCPOnly
tags: [constant boolean private]
```

```Go
const useTCPOnly = true
```

to be used as a useTCP parameter to exchange 

### <a id="useUDPOrTCP" href="#useUDPOrTCP">const useUDPOrTCP</a>

```
searchKey: net.useUDPOrTCP
tags: [constant boolean private]
```

```Go
const useUDPOrTCP = false
```

### <a id="writeMsgSyscallName" href="#writeMsgSyscallName">const writeMsgSyscallName</a>

```
searchKey: net.writeMsgSyscallName
tags: [constant string private]
```

```Go
const writeMsgSyscallName = "sendmsg"
```

### <a id="writeSyscallName" href="#writeSyscallName">const writeSyscallName</a>

```
searchKey: net.writeSyscallName
tags: [constant string private]
```

```Go
const writeSyscallName = "write"
```

### <a id="writeToSyscallName" href="#writeToSyscallName">const writeToSyscallName</a>

```
searchKey: net.writeToSyscallName
tags: [constant string private]
```

```Go
const writeToSyscallName = "sendto"
```

## <a id="var" href="#var">Variables</a>

### <a id="DefaultResolver" href="#DefaultResolver">var DefaultResolver</a>

```
searchKey: net.DefaultResolver
tags: [variable struct]
```

```Go
var DefaultResolver = &Resolver{}
```

DefaultResolver is the resolver used by the package-level Lookup functions and by Dialers without a specified Resolver. 

### <a id="ErrClosed" href="#ErrClosed">var ErrClosed</a>

```
searchKey: net.ErrClosed
tags: [variable interface]
```

```Go
var ErrClosed error = errClosed
```

ErrClosed is the error returned by an I/O call on a network connection that has already been closed, or that is closed by another goroutine before the I/O is completed. This may be wrapped in another error, and should normally be tested using errors.Is(err, net.ErrClosed). 

### <a id="ErrWriteToConnected" href="#ErrWriteToConnected">var ErrWriteToConnected</a>

```
searchKey: net.ErrWriteToConnected
tags: [variable interface]
```

```Go
var ErrWriteToConnected = errors.New("use of WriteTo with pre-connected connection")
```

Various errors contained in OpError. 

### <a id="IPv4allrouter" href="#IPv4allrouter">var IPv4allrouter</a>

```
searchKey: net.IPv4allrouter
tags: [variable array number]
```

```Go
var IPv4allrouter = IPv4(224, 0, 0, 2) // all routers

```

Well-known IPv4 addresses 

### <a id="IPv4allsys" href="#IPv4allsys">var IPv4allsys</a>

```
searchKey: net.IPv4allsys
tags: [variable array number]
```

```Go
var IPv4allsys = IPv4(224, 0, 0, 1) // all systems

```

Well-known IPv4 addresses 

### <a id="IPv4bcast" href="#IPv4bcast">var IPv4bcast</a>

```
searchKey: net.IPv4bcast
tags: [variable array number]
```

```Go
var IPv4bcast = IPv4(255, 255, 255, 255) // limited broadcast

```

Well-known IPv4 addresses 

### <a id="IPv4zero" href="#IPv4zero">var IPv4zero</a>

```
searchKey: net.IPv4zero
tags: [variable array number]
```

```Go
var IPv4zero = IPv4(0, 0, 0, 0) // all zeros

```

Well-known IPv4 addresses 

### <a id="IPv6interfacelocalallnodes" href="#IPv6interfacelocalallnodes">var IPv6interfacelocalallnodes</a>

```
searchKey: net.IPv6interfacelocalallnodes
tags: [variable array number]
```

```Go
var IPv6interfacelocalallnodes = IP{0xff, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01}
```

Well-known IPv6 addresses 

### <a id="IPv6linklocalallnodes" href="#IPv6linklocalallnodes">var IPv6linklocalallnodes</a>

```
searchKey: net.IPv6linklocalallnodes
tags: [variable array number]
```

```Go
var IPv6linklocalallnodes = IP{0xff, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01}
```

Well-known IPv6 addresses 

### <a id="IPv6linklocalallrouters" href="#IPv6linklocalallrouters">var IPv6linklocalallrouters</a>

```
searchKey: net.IPv6linklocalallrouters
tags: [variable array number]
```

```Go
var IPv6linklocalallrouters = IP{0xff, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x02}
```

Well-known IPv6 addresses 

### <a id="IPv6loopback" href="#IPv6loopback">var IPv6loopback</a>

```
searchKey: net.IPv6loopback
tags: [variable array number]
```

```Go
var IPv6loopback = IP{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}
```

Well-known IPv6 addresses 

### <a id="IPv6unspecified" href="#IPv6unspecified">var IPv6unspecified</a>

```
searchKey: net.IPv6unspecified
tags: [variable array number]
```

```Go
var IPv6unspecified = IP{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
```

Well-known IPv6 addresses 

### <a id="IPv6zero" href="#IPv6zero">var IPv6zero</a>

```
searchKey: net.IPv6zero
tags: [variable array number]
```

```Go
var IPv6zero = IP{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
```

Well-known IPv6 addresses 

### <a id="TestAddr" href="#TestAddr">var TestAddr</a>

```
searchKey: net.TestAddr
tags: [variable array number private]
```

```Go
var TestAddr = [4]byte{0xc0, 0x00, 0x02, 0x01}
```

Test address from 192.0.2.0/24 block, reserved by RFC 5737 for documentation. 

### <a id="TestAddr6" href="#TestAddr6">var TestAddr6</a>

```
searchKey: net.TestAddr6
tags: [variable array number private]
```

```Go
var TestAddr6 = [16]byte{0x20, 0x01, 0x0d, 0xb8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}
```

Test address from 2001:db8::/32 block, reserved by RFC 3849 for documentation. 

### <a id="aLongTimeAgo" href="#aLongTimeAgo">var aLongTimeAgo</a>

```
searchKey: net.aLongTimeAgo
tags: [variable struct private]
```

```Go
var aLongTimeAgo = time.Unix(1, 0)
```

aLongTimeAgo is a non-zero time, far in the past, used for immediate cancellation of dials. 

### <a id="abortedConnRequestErrors" href="#abortedConnRequestErrors">var abortedConnRequestErrors</a>

```
searchKey: net.abortedConnRequestErrors
tags: [variable array interface private]
```

```Go
var abortedConnRequestErrors = []error{syscall.ECONNABORTED} // see accept in fd_unix.go

```

### <a id="acceptTimeoutTests" href="#acceptTimeoutTests">var acceptTimeoutTests</a>

```
searchKey: net.acceptTimeoutTests
tags: [variable array struct private]
```

```Go
var acceptTimeoutTests = ...
```

### <a id="addrListTests" href="#addrListTests">var addrListTests</a>

```
searchKey: net.addrListTests
tags: [variable array struct private]
```

```Go
var addrListTests = ...
```

### <a id="backoffDuration" href="#backoffDuration">var backoffDuration</a>

```
searchKey: net.backoffDuration
tags: [variable array number private]
```

```Go
var backoffDuration = [...]time.Duration{time.Second, 5 * time.Second, 30 * time.Second}
```

### <a id="badaddr" href="#badaddr">var badaddr</a>

```
searchKey: net.badaddr
tags: [variable array number private]
```

```Go
var badaddr = IP{192, 168, 0}
```

### <a id="badmask" href="#badmask">var badmask</a>

```
searchKey: net.badmask
tags: [variable array number private]
```

```Go
var badmask = IPMask{255, 255, 0}
```

### <a id="cidrMaskTests" href="#cidrMaskTests">var cidrMaskTests</a>

```
searchKey: net.cidrMaskTests
tags: [variable array struct private]
```

```Go
var cidrMaskTests = ...
```

### <a id="classAMask" href="#classAMask">var classAMask</a>

```
searchKey: net.classAMask
tags: [variable array number private]
```

```Go
var classAMask = IPv4Mask(0xff, 0, 0, 0)
```

Default route masks for IPv4. 

### <a id="classBMask" href="#classBMask">var classBMask</a>

```
searchKey: net.classBMask
tags: [variable array number private]
```

```Go
var classBMask = IPv4Mask(0xff, 0xff, 0, 0)
```

Default route masks for IPv4. 

### <a id="classCMask" href="#classCMask">var classCMask</a>

```
searchKey: net.classCMask
tags: [variable array number private]
```

```Go
var classCMask = IPv4Mask(0xff, 0xff, 0xff, 0)
```

Default route masks for IPv4. 

### <a id="confOnce" href="#confOnce">var confOnce</a>

```
searchKey: net.confOnce
tags: [variable struct private]
```

```Go
var confOnce sync.Once // guards init of confVal via initConfVal

```

### <a id="confVal" href="#confVal">var confVal</a>

```
searchKey: net.confVal
tags: [variable struct private]
```

```Go
var confVal = &conf{goos: runtime.GOOS}
```

### <a id="connectFunc" href="#connectFunc">var connectFunc</a>

```
searchKey: net.connectFunc
tags: [variable function private]
```

```Go
var connectFunc func(int, syscall.Sockaddr) error = syscall.Connect
```

### <a id="defaultNS" href="#defaultNS">var defaultNS</a>

```
searchKey: net.defaultNS
tags: [variable array string private]
```

```Go
var defaultNS = []string{"127.0.0.1:53", "[::1]:53"}
```

### <a id="defaultResolvConf" href="#defaultResolvConf">var defaultResolvConf</a>

```
searchKey: net.defaultResolvConf
tags: [variable struct private]
```

```Go
var defaultResolvConf = ...
```

represents a dnsConfig returned by parsing a nonexistent resolv.conf 

### <a id="dialErrorTests" href="#dialErrorTests">var dialErrorTests</a>

```
searchKey: net.dialErrorTests
tags: [variable array struct private]
```

```Go
var dialErrorTests = ...
```

### <a id="dialGoogleTests" href="#dialGoogleTests">var dialGoogleTests</a>

```
searchKey: net.dialGoogleTests
tags: [variable array struct private]
```

```Go
var dialGoogleTests = ...
```

### <a id="dialTimeoutMaxDurationTests" href="#dialTimeoutMaxDurationTests">var dialTimeoutMaxDurationTests</a>

```
searchKey: net.dialTimeoutMaxDurationTests
tags: [variable array struct private]
```

```Go
var dialTimeoutMaxDurationTests = ...
```

### <a id="dialTimeoutTests" href="#dialTimeoutTests">var dialTimeoutTests</a>

```
searchKey: net.dialTimeoutTests
tags: [variable array struct private]
```

```Go
var dialTimeoutTests = ...
```

### <a id="dnsDefaultSearchTests" href="#dnsDefaultSearchTests">var dnsDefaultSearchTests</a>

```
searchKey: net.dnsDefaultSearchTests
tags: [variable array struct private]
```

```Go
var dnsDefaultSearchTests = ...
```

### <a id="dnsNameTests" href="#dnsNameTests">var dnsNameTests</a>

```
searchKey: net.dnsNameTests
tags: [variable array struct private]
```

```Go
var dnsNameTests = ...
```

### <a id="dnsReadConfigTests" href="#dnsReadConfigTests">var dnsReadConfigTests</a>

```
searchKey: net.dnsReadConfigTests
tags: [variable array struct private]
```

```Go
var dnsReadConfigTests = ...
```

### <a id="dnsTransportFallbackTests" href="#dnsTransportFallbackTests">var dnsTransportFallbackTests</a>

```
searchKey: net.dnsTransportFallbackTests
tags: [variable array struct private]
```

```Go
var dnsTransportFallbackTests = ...
```

### <a id="dnsWaitGroup" href="#dnsWaitGroup">var dnsWaitGroup</a>

```
searchKey: net.dnsWaitGroup
tags: [variable struct private]
```

```Go
var dnsWaitGroup sync.WaitGroup
```

dnsWaitGroup can be used by tests to wait for all DNS goroutines to complete. This avoids races on the test hooks. 

### <a id="dualStackTCPListenerTests" href="#dualStackTCPListenerTests">var dualStackTCPListenerTests</a>

```
searchKey: net.dualStackTCPListenerTests
tags: [variable array struct private]
```

```Go
var dualStackTCPListenerTests = ...
```

### <a id="dualStackUDPListenerTests" href="#dualStackUDPListenerTests">var dualStackUDPListenerTests</a>

```
searchKey: net.dualStackUDPListenerTests
tags: [variable array struct private]
```

```Go
var dualStackUDPListenerTests = ...
```

### <a id="errCanceled" href="#errCanceled">var errCanceled</a>

```
searchKey: net.errCanceled
tags: [variable interface private]
```

```Go
var errCanceled = errors.New("operation was canceled")
```

Various errors contained in OpError. 

For both read and write operations. 

### <a id="errCannotMarshalDNSMessage" href="#errCannotMarshalDNSMessage">var errCannotMarshalDNSMessage</a>

```
searchKey: net.errCannotMarshalDNSMessage
tags: [variable interface private]
```

```Go
var errCannotMarshalDNSMessage = errors.New("cannot marshal DNS message")
```

### <a id="errCannotUnmarshalDNSMessage" href="#errCannotUnmarshalDNSMessage">var errCannotUnmarshalDNSMessage</a>

```
searchKey: net.errCannotUnmarshalDNSMessage
tags: [variable interface private]
```

```Go
var errCannotUnmarshalDNSMessage = errors.New("cannot unmarshal DNS message")
```

### <a id="errClosed" href="#errClosed">var errClosed</a>

```
searchKey: net.errClosed
tags: [variable interface private]
```

```Go
var errClosed = poll.ErrNetClosing
```

errClosed exists just so that the docs for ErrClosed don't mention the internal package poll. 

### <a id="errInvalidDNSResponse" href="#errInvalidDNSResponse">var errInvalidDNSResponse</a>

```
searchKey: net.errInvalidDNSResponse
tags: [variable interface private]
```

```Go
var errInvalidDNSResponse = errors.New("invalid DNS response")
```

### <a id="errInvalidInterface" href="#errInvalidInterface">var errInvalidInterface</a>

```
searchKey: net.errInvalidInterface
tags: [variable interface private]
```

```Go
var errInvalidInterface = errors.New("invalid network interface")
```

### <a id="errInvalidInterfaceIndex" href="#errInvalidInterfaceIndex">var errInvalidInterfaceIndex</a>

```
searchKey: net.errInvalidInterfaceIndex
tags: [variable interface private]
```

```Go
var errInvalidInterfaceIndex = errors.New("invalid network interface index")
```

### <a id="errInvalidInterfaceName" href="#errInvalidInterfaceName">var errInvalidInterfaceName</a>

```
searchKey: net.errInvalidInterfaceName
tags: [variable interface private]
```

```Go
var errInvalidInterfaceName = errors.New("invalid network interface name")
```

### <a id="errLameReferral" href="#errLameReferral">var errLameReferral</a>

```
searchKey: net.errLameReferral
tags: [variable interface private]
```

```Go
var errLameReferral = errors.New("lame referral")
```

### <a id="errMissingAddress" href="#errMissingAddress">var errMissingAddress</a>

```
searchKey: net.errMissingAddress
tags: [variable interface private]
```

```Go
var errMissingAddress = errors.New("missing address")
```

Various errors contained in OpError. 

For connection setup and write operations. 

### <a id="errNoAnswerFromDNSServer" href="#errNoAnswerFromDNSServer">var errNoAnswerFromDNSServer</a>

```
searchKey: net.errNoAnswerFromDNSServer
tags: [variable interface private]
```

```Go
var errNoAnswerFromDNSServer = errors.New("no answer from DNS server")
```

### <a id="errNoSuchHost" href="#errNoSuchHost">var errNoSuchHost</a>

```
searchKey: net.errNoSuchHost
tags: [variable interface private]
```

```Go
var errNoSuchHost = errors.New("no such host")
```

Various errors contained in DNSError. 

### <a id="errNoSuchInterface" href="#errNoSuchInterface">var errNoSuchInterface</a>

```
searchKey: net.errNoSuchInterface
tags: [variable interface private]
```

```Go
var errNoSuchInterface = errors.New("no such network interface")
```

### <a id="errNoSuchMulticastInterface" href="#errNoSuchMulticastInterface">var errNoSuchMulticastInterface</a>

```
searchKey: net.errNoSuchMulticastInterface
tags: [variable interface private]
```

```Go
var errNoSuchMulticastInterface = errors.New("no such multicast network interface")
```

### <a id="errNoSuitableAddress" href="#errNoSuitableAddress">var errNoSuitableAddress</a>

```
searchKey: net.errNoSuitableAddress
tags: [variable interface private]
```

```Go
var errNoSuitableAddress = errors.New("no suitable address found")
```

Various errors contained in OpError. 

For connection setup operations. 

### <a id="errOpNotSupported" href="#errOpNotSupported">var errOpNotSupported</a>

```
searchKey: net.errOpNotSupported
tags: [variable number private]
```

```Go
var errOpNotSupported = syscall.EOPNOTSUPP
```

### <a id="errServerMisbehaving" href="#errServerMisbehaving">var errServerMisbehaving</a>

```
searchKey: net.errServerMisbehaving
tags: [variable interface private]
```

```Go
var errServerMisbehaving = errors.New("server misbehaving")
```

### <a id="errServerTemporarilyMisbehaving" href="#errServerTemporarilyMisbehaving">var errServerTemporarilyMisbehaving</a>

```
searchKey: net.errServerTemporarilyMisbehaving
tags: [variable interface private]
```

```Go
var errServerTemporarilyMisbehaving = errors.New("server misbehaving")
```

errServerTemporarilyMisbehaving is like errServerMisbehaving, except that when it gets translated to a DNSError, the IsTemporary field gets set to true. 

### <a id="errTimedout" href="#errTimedout">var errTimedout</a>

```
searchKey: net.errTimedout
tags: [variable number private]
```

```Go
var errTimedout = syscall.ETIMEDOUT
```

### <a id="errTimeout" href="#errTimeout">var errTimeout</a>

```
searchKey: net.errTimeout
tags: [variable interface private]
```

```Go
var errTimeout error = &timeoutError{}
```

errTimeout exists to return the historical "i/o timeout" string for context.DeadlineExceeded. See mapErr. It is also used when Dialer.Deadline is exceeded. 

TODO(iant): We could consider changing this to os.ErrDeadlineExceeded in the future, but note that that would conflict with the TODO at mapErr that suggests changing it to context.DeadlineExceeded. 

### <a id="extraTestHookInstallers" href="#extraTestHookInstallers">var extraTestHookInstallers</a>

```
searchKey: net.extraTestHookInstallers
tags: [variable array function private]
```

```Go
var extraTestHookInstallers []func()
```

### <a id="extraTestHookUninstallers" href="#extraTestHookUninstallers">var extraTestHookUninstallers</a>

```
searchKey: net.extraTestHookUninstallers
tags: [variable array function private]
```

```Go
var extraTestHookUninstallers []func()
```

### <a id="fakeDNSServerSuccessful" href="#fakeDNSServerSuccessful">var fakeDNSServerSuccessful</a>

```
searchKey: net.fakeDNSServerSuccessful
tags: [variable struct private]
```

```Go
var fakeDNSServerSuccessful = ...
```

### <a id="fileConnTests" href="#fileConnTests">var fileConnTests</a>

```
searchKey: net.fileConnTests
tags: [variable array struct private]
```

```Go
var fileConnTests = []struct {
	network string
}{
	{"tcp"},
	{"udp"},
	{"unix"},
	{"unixpacket"},
}
```

### <a id="fileListenerTests" href="#fileListenerTests">var fileListenerTests</a>

```
searchKey: net.fileListenerTests
tags: [variable array struct private]
```

```Go
var fileListenerTests = []struct {
	network string
}{
	{"tcp"},
	{"unix"},
	{"unixpacket"},
}
```

### <a id="filePacketConnTests" href="#filePacketConnTests">var filePacketConnTests</a>

```
searchKey: net.filePacketConnTests
tags: [variable array struct private]
```

```Go
var filePacketConnTests = []struct {
	network string
}{
	{"udp"},
	{"unixgram"},
}
```

### <a id="flagNames" href="#flagNames">var flagNames</a>

```
searchKey: net.flagNames
tags: [variable array string private]
```

```Go
var flagNames = []string{
	"up",
	"broadcast",
	"loopback",
	"pointtopoint",
	"multicast",
}
```

### <a id="getHostname" href="#getHostname">var getHostname</a>

```
searchKey: net.getHostname
tags: [variable function private]
```

```Go
var getHostname = os.Hostname // variable for testing

```

### <a id="getsockoptIntFunc" href="#getsockoptIntFunc">var getsockoptIntFunc</a>

```
searchKey: net.getsockoptIntFunc
tags: [variable function private]
```

```Go
var getsockoptIntFunc func(int, int, int) (int, error) = syscall.GetsockoptInt
```

### <a id="goLookupIPWithResolverConfigTests" href="#goLookupIPWithResolverConfigTests">var goLookupIPWithResolverConfigTests</a>

```
searchKey: net.goLookupIPWithResolverConfigTests
tags: [variable array struct private]
```

```Go
var goLookupIPWithResolverConfigTests = ...
```

### <a id="goResolver" href="#goResolver">var goResolver</a>

```
searchKey: net.goResolver
tags: [variable struct private]
```

```Go
var goResolver = Resolver{PreferGo: true}
```

### <a id="hosts" href="#hosts">var hosts</a>

```
searchKey: net.hosts
tags: [variable struct private]
```

```Go
var hosts struct {
	sync.Mutex

	// Key for the list of literal IP addresses must be a host
	// name. It would be part of DNS labels, a FQDN or an absolute
	// FQDN.
	// For now the key is converted to lower case for convenience.
	byName map[string][]string

	// Key for the list of host names must be a literal IP address
	// including IPv6 address with zone identifier.
	// We don't support old-classful IP address notation.
	byAddr map[string][]string

	expire time.Time
	path   string
	mtime  time.Time
	size   int64
} = ...
```

hosts contains known host entries. 

### <a id="ipAddrFamilyTests" href="#ipAddrFamilyTests">var ipAddrFamilyTests</a>

```
searchKey: net.ipAddrFamilyTests
tags: [variable array struct private]
```

```Go
var ipAddrFamilyTests = ...
```

### <a id="ipAddrScopeTests" href="#ipAddrScopeTests">var ipAddrScopeTests</a>

```
searchKey: net.ipAddrScopeTests
tags: [variable array struct private]
```

```Go
var ipAddrScopeTests = ...
```

### <a id="ipConnLocalNameTests" href="#ipConnLocalNameTests">var ipConnLocalNameTests</a>

```
searchKey: net.ipConnLocalNameTests
tags: [variable array struct private]
```

```Go
var ipConnLocalNameTests = ...
```

### <a id="ipMaskStringTests" href="#ipMaskStringTests">var ipMaskStringTests</a>

```
searchKey: net.ipMaskStringTests
tags: [variable array struct private]
```

```Go
var ipMaskStringTests = ...
```

### <a id="ipMaskTests" href="#ipMaskTests">var ipMaskTests</a>

```
searchKey: net.ipMaskTests
tags: [variable array struct private]
```

```Go
var ipMaskTests = ...
```

### <a id="ipNetContainsTests" href="#ipNetContainsTests">var ipNetContainsTests</a>

```
searchKey: net.ipNetContainsTests
tags: [variable array struct private]
```

```Go
var ipNetContainsTests = ...
```

### <a id="ipNetStringTests" href="#ipNetStringTests">var ipNetStringTests</a>

```
searchKey: net.ipNetStringTests
tags: [variable array struct private]
```

```Go
var ipNetStringTests = ...
```

### <a id="ipStackCaps" href="#ipStackCaps">var ipStackCaps</a>

```
searchKey: net.ipStackCaps
tags: [variable struct private]
```

```Go
var ipStackCaps ipStackCapabilities
```

### <a id="ipStringTests" href="#ipStringTests">var ipStringTests</a>

```
searchKey: net.ipStringTests
tags: [variable array struct private]
```

```Go
var ipStringTests = ...
```

### <a id="ipVersionTests" href="#ipVersionTests">var ipVersionTests</a>

```
searchKey: net.ipVersionTests
tags: [variable array struct private]
```

```Go
var ipVersionTests = ...
```

### <a id="ipv4MulticastListenerTests" href="#ipv4MulticastListenerTests">var ipv4MulticastListenerTests</a>

```
searchKey: net.ipv4MulticastListenerTests
tags: [variable array struct private]
```

```Go
var ipv4MulticastListenerTests = ...
```

### <a id="ipv6LinkLocalUnicastTCPTests" href="#ipv6LinkLocalUnicastTCPTests">var ipv6LinkLocalUnicastTCPTests</a>

```
searchKey: net.ipv6LinkLocalUnicastTCPTests
tags: [variable array struct private]
```

```Go
var ipv6LinkLocalUnicastTCPTests []ipv6LinkLocalUnicastTest
```

### <a id="ipv6LinkLocalUnicastUDPTests" href="#ipv6LinkLocalUnicastUDPTests">var ipv6LinkLocalUnicastUDPTests</a>

```
searchKey: net.ipv6LinkLocalUnicastUDPTests
tags: [variable array struct private]
```

```Go
var ipv6LinkLocalUnicastUDPTests []ipv6LinkLocalUnicastTest
```

### <a id="ipv6MulticastListenerTests" href="#ipv6MulticastListenerTests">var ipv6MulticastListenerTests</a>

```
searchKey: net.ipv6MulticastListenerTests
tags: [variable array struct private]
```

```Go
var ipv6MulticastListenerTests = ...
```

### <a id="listenErrorTests" href="#listenErrorTests">var listenErrorTests</a>

```
searchKey: net.listenErrorTests
tags: [variable array struct private]
```

```Go
var listenErrorTests = ...
```

### <a id="listenFunc" href="#listenFunc">var listenFunc</a>

```
searchKey: net.listenFunc
tags: [variable function private]
```

```Go
var listenFunc func(int, int) error = syscall.Listen
```

### <a id="listenPacketErrorTests" href="#listenPacketErrorTests">var listenPacketErrorTests</a>

```
searchKey: net.listenPacketErrorTests
tags: [variable array struct private]
```

```Go
var listenPacketErrorTests = ...
```

### <a id="listenerBacklogCache" href="#listenerBacklogCache">var listenerBacklogCache</a>

```
searchKey: net.listenerBacklogCache
tags: [variable struct private]
```

```Go
var listenerBacklogCache struct {
	sync.Once
	val int
}
```

### <a id="literalAddrs4" href="#literalAddrs4">var literalAddrs4</a>

```
searchKey: net.literalAddrs4
tags: [variable array string private]
```

```Go
var literalAddrs4 = ...
```

### <a id="literalAddrs6" href="#literalAddrs6">var literalAddrs6</a>

```
searchKey: net.literalAddrs6
tags: [variable array string private]
```

```Go
var literalAddrs6 = ...
```

### <a id="lookupCNAMETests" href="#lookupCNAMETests">var lookupCNAMETests</a>

```
searchKey: net.lookupCNAMETests
tags: [variable array struct private]
```

```Go
var lookupCNAMETests = ...
```

### <a id="lookupGmailMXTests" href="#lookupGmailMXTests">var lookupGmailMXTests</a>

```
searchKey: net.lookupGmailMXTests
tags: [variable array struct private]
```

```Go
var lookupGmailMXTests = ...
```

### <a id="lookupGmailNSTests" href="#lookupGmailNSTests">var lookupGmailNSTests</a>

```
searchKey: net.lookupGmailNSTests
tags: [variable array struct private]
```

```Go
var lookupGmailNSTests = ...
```

### <a id="lookupGmailTXTTests" href="#lookupGmailTXTTests">var lookupGmailTXTTests</a>

```
searchKey: net.lookupGmailTXTTests
tags: [variable array struct private]
```

```Go
var lookupGmailTXTTests = ...
```

### <a id="lookupGoogleHostTests" href="#lookupGoogleHostTests">var lookupGoogleHostTests</a>

```
searchKey: net.lookupGoogleHostTests
tags: [variable array struct private]
```

```Go
var lookupGoogleHostTests = []struct {
	name string
}{
	{"google.com"},
	{"google.com."},
}
```

### <a id="lookupGoogleIPTests" href="#lookupGoogleIPTests">var lookupGoogleIPTests</a>

```
searchKey: net.lookupGoogleIPTests
tags: [variable array struct private]
```

```Go
var lookupGoogleIPTests = []struct {
	name string
}{
	{"google.com"},
	{"google.com."},
}
```

### <a id="lookupGooglePublicDNSAddrTests" href="#lookupGooglePublicDNSAddrTests">var lookupGooglePublicDNSAddrTests</a>

```
searchKey: net.lookupGooglePublicDNSAddrTests
tags: [variable array string private]
```

```Go
var lookupGooglePublicDNSAddrTests = ...
```

### <a id="lookupGoogleSRVTests" href="#lookupGoogleSRVTests">var lookupGoogleSRVTests</a>

```
searchKey: net.lookupGoogleSRVTests
tags: [variable array struct private]
```

```Go
var lookupGoogleSRVTests = ...
```

### <a id="lookupOrderName" href="#lookupOrderName">var lookupOrderName</a>

```
searchKey: net.lookupOrderName
tags: [variable object private]
```

```Go
var lookupOrderName = ...
```

### <a id="lookupStaticAddrTests" href="#lookupStaticAddrTests">var lookupStaticAddrTests</a>

```
searchKey: net.lookupStaticAddrTests
tags: [variable array struct private]
```

```Go
var lookupStaticAddrTests = ...
```

### <a id="lookupStaticHostTests" href="#lookupStaticHostTests">var lookupStaticHostTests</a>

```
searchKey: net.lookupStaticHostTests
tags: [variable array struct private]
```

```Go
var lookupStaticHostTests = ...
```

### <a id="netCgo" href="#netCgo">var netCgo</a>

```
searchKey: net.netCgo
tags: [variable boolean private]
```

```Go
var netCgo bool // set true in conf_netcgo.go for build tag "netcgo"

```

netGo and netCgo contain the state of the build tags used to build this binary, and whether cgo is available. conf.go mirrors these into conf for easier testing. 

### <a id="netGo" href="#netGo">var netGo</a>

```
searchKey: net.netGo
tags: [variable boolean private]
```

```Go
var netGo bool // set true in cgo_stub.go for build tag "netgo" (or no cgo)

```

netGo and netCgo contain the state of the build tags used to build this binary, and whether cgo is available. conf.go mirrors these into conf for easier testing. 

### <a id="networkNumberAndMaskTests" href="#networkNumberAndMaskTests">var networkNumberAndMaskTests</a>

```
searchKey: net.networkNumberAndMaskTests
tags: [variable array struct private]
```

```Go
var networkNumberAndMaskTests = ...
```

### <a id="noCancel" href="#noCancel">var noCancel</a>

```
searchKey: net.noCancel
tags: [variable private]
```

```Go
var noCancel = (chan struct{})(nil)
```

### <a id="noDeadline" href="#noDeadline">var noDeadline</a>

```
searchKey: net.noDeadline
tags: [variable struct private]
```

```Go
var noDeadline = time.Time{}
```

nonDeadline and noCancel are just zero values for readability with functions taking too many parameters. 

### <a id="onceReadProtocols" href="#onceReadProtocols">var onceReadProtocols</a>

```
searchKey: net.onceReadProtocols
tags: [variable struct private]
```

```Go
var onceReadProtocols sync.Once
```

### <a id="onceReadServices" href="#onceReadServices">var onceReadServices</a>

```
searchKey: net.onceReadServices
tags: [variable struct private]
```

```Go
var onceReadServices sync.Once
```

### <a id="origAccept" href="#origAccept">var origAccept</a>

```
searchKey: net.origAccept
tags: [variable function private]
```

```Go
var origAccept = poll.AcceptFunc
```

### <a id="origClose" href="#origClose">var origClose</a>

```
searchKey: net.origClose
tags: [variable function private]
```

```Go
var origClose = poll.CloseFunc
```

### <a id="origConnect" href="#origConnect">var origConnect</a>

```
searchKey: net.origConnect
tags: [variable function private]
```

```Go
var origConnect = connectFunc
```

### <a id="origGetsockoptInt" href="#origGetsockoptInt">var origGetsockoptInt</a>

```
searchKey: net.origGetsockoptInt
tags: [variable function private]
```

```Go
var origGetsockoptInt = getsockoptIntFunc
```

### <a id="origListen" href="#origListen">var origListen</a>

```
searchKey: net.origListen
tags: [variable function private]
```

```Go
var origListen = listenFunc
```

### <a id="origSocket" href="#origSocket">var origSocket</a>

```
searchKey: net.origSocket
tags: [variable function private]
```

```Go
var origSocket = socketFunc
```

Placeholders for saving original socket system calls. 

### <a id="packetConnTests" href="#packetConnTests">var packetConnTests</a>

```
searchKey: net.packetConnTests
tags: [variable array struct private]
```

```Go
var packetConnTests = ...
```

### <a id="parseCIDRTests" href="#parseCIDRTests">var parseCIDRTests</a>

```
searchKey: net.parseCIDRTests
tags: [variable array struct private]
```

```Go
var parseCIDRTests = ...
```

### <a id="parseIPTests" href="#parseIPTests">var parseIPTests</a>

```
searchKey: net.parseIPTests
tags: [variable array struct private]
```

```Go
var parseIPTests = ...
```

### <a id="parseMACTests" href="#parseMACTests">var parseMACTests</a>

```
searchKey: net.parseMACTests
tags: [variable array struct private]
```

```Go
var parseMACTests = ...
```

### <a id="parsePortTests" href="#parsePortTests">var parsePortTests</a>

```
searchKey: net.parsePortTests
tags: [variable array struct private]
```

```Go
var parsePortTests = ...
```

### <a id="prohibitionaryDialArgTests" href="#prohibitionaryDialArgTests">var prohibitionaryDialArgTests</a>

```
searchKey: net.prohibitionaryDialArgTests
tags: [variable array struct private]
```

```Go
var prohibitionaryDialArgTests = ...
```

### <a id="protocols" href="#protocols">var protocols</a>

```
searchKey: net.protocols
tags: [variable object private]
```

```Go
var protocols = ...
```

protocols contains minimal mappings between internet protocol names and numbers for platforms that don't have a complete list of protocol numbers. 

See [https://www.iana.org/assignments/protocol-numbers](https://www.iana.org/assignments/protocol-numbers) 

On Unix, this map is augmented by readProtocols via lookupProtocol. 

### <a id="readFromTimeoutTests" href="#readFromTimeoutTests">var readFromTimeoutTests</a>

```
searchKey: net.readFromTimeoutTests
tags: [variable array struct private]
```

```Go
var readFromTimeoutTests = ...
```

### <a id="readTimeoutTests" href="#readTimeoutTests">var readTimeoutTests</a>

```
searchKey: net.readTimeoutTests
tags: [variable array struct private]
```

```Go
var readTimeoutTests = ...
```

### <a id="resolvConf" href="#resolvConf">var resolvConf</a>

```
searchKey: net.resolvConf
tags: [variable struct private]
```

```Go
var resolvConf resolverConfig
```

### <a id="resolveIPAddrTests" href="#resolveIPAddrTests">var resolveIPAddrTests</a>

```
searchKey: net.resolveIPAddrTests
tags: [variable array struct private]
```

```Go
var resolveIPAddrTests = ...
```

### <a id="resolveTCPAddrTests" href="#resolveTCPAddrTests">var resolveTCPAddrTests</a>

```
searchKey: net.resolveTCPAddrTests
tags: [variable array struct private]
```

```Go
var resolveTCPAddrTests = ...
```

### <a id="resolveUDPAddrTests" href="#resolveUDPAddrTests">var resolveUDPAddrTests</a>

```
searchKey: net.resolveUDPAddrTests
tags: [variable array struct private]
```

```Go
var resolveUDPAddrTests = ...
```

### <a id="revAddrTests" href="#revAddrTests">var revAddrTests</a>

```
searchKey: net.revAddrTests
tags: [variable array struct private]
```

```Go
var revAddrTests = ...
```

### <a id="rfc6724policyTable" href="#rfc6724policyTable">var rfc6724policyTable</a>

```
searchKey: net.rfc6724policyTable
tags: [variable array struct private]
```

```Go
var rfc6724policyTable = ...
```

RFC 6724 section 2.1. 

### <a id="services" href="#services">var services</a>

```
searchKey: net.services
tags: [variable object private]
```

```Go
var services = ...
```

services contains minimal mappings between services names and port numbers for platforms that don't have a complete list of port numbers. 

See [https://www.iana.org/assignments/service-names-port-numbers](https://www.iana.org/assignments/service-names-port-numbers) 

On Unix, this map is augmented by readServices via goLookupPort. 

### <a id="sink" href="#sink">var sink</a>

```
searchKey: net.sink
tags: [variable string private]
```

```Go
var sink string
```

### <a id="socketFunc" href="#socketFunc">var socketFunc</a>

```
searchKey: net.socketFunc
tags: [variable function private]
```

```Go
var socketFunc func(int, int, int) (int, error) = syscall.Socket
```

Placeholders for socket system calls. 

### <a id="specialDomainNameTests" href="#specialDomainNameTests">var specialDomainNameTests</a>

```
searchKey: net.specialDomainNameTests
tags: [variable array struct private]
```

```Go
var specialDomainNameTests = ...
```

See RFC 6761 for further information about the reserved, pseudo domain names. 

### <a id="sw" href="#sw">var sw</a>

```
searchKey: net.sw
tags: [variable struct private]
```

```Go
var sw socktest.Switch
```

### <a id="tcpListenerNameTests" href="#tcpListenerNameTests">var tcpListenerNameTests</a>

```
searchKey: net.tcpListenerNameTests
tags: [variable array struct private]
```

```Go
var tcpListenerNameTests = ...
```

### <a id="tcpListenerTests" href="#tcpListenerTests">var tcpListenerTests</a>

```
searchKey: net.tcpListenerTests
tags: [variable array struct private]
```

```Go
var tcpListenerTests = ...
```

### <a id="tcpServerTests" href="#tcpServerTests">var tcpServerTests</a>

```
searchKey: net.tcpServerTests
tags: [variable array struct private]
```

```Go
var tcpServerTests = ...
```

### <a id="testDNSFlood" href="#testDNSFlood">var testDNSFlood</a>

```
searchKey: net.testDNSFlood
tags: [variable boolean private]
```

```Go
var testDNSFlood = flag.Bool("dnsflood", false, "whether to test DNS query flooding")
```

### <a id="testHookCanceledDial" href="#testHookCanceledDial">var testHookCanceledDial</a>

```
searchKey: net.testHookCanceledDial
tags: [variable function private]
```

```Go
var testHookCanceledDial = func() {} // for golang.org/issue/16523

```

### <a id="testHookDialChannel" href="#testHookDialChannel">var testHookDialChannel</a>

```
searchKey: net.testHookDialChannel
tags: [variable function private]
```

```Go
var testHookDialChannel = func() {} // for golang.org/issue/5349

```

### <a id="testHookDialTCP" href="#testHookDialTCP">var testHookDialTCP</a>

```
searchKey: net.testHookDialTCP
tags: [variable function private]
```

```Go
var testHookDialTCP func(ctx context.Context, net string, laddr, raddr *TCPAddr) (*TCPConn, error)
```

if non-nil, overrides dialTCP. 

### <a id="testHookHostsPath" href="#testHookHostsPath">var testHookHostsPath</a>

```
searchKey: net.testHookHostsPath
tags: [variable string private]
```

```Go
var testHookHostsPath = "/etc/hosts"
```

### <a id="testHookLookupIP" href="#testHookLookupIP">var testHookLookupIP</a>

```
searchKey: net.testHookLookupIP
tags: [variable function private]
```

```Go
var testHookLookupIP = ...
```

### <a id="testHookSetKeepAlive" href="#testHookSetKeepAlive">var testHookSetKeepAlive</a>

```
searchKey: net.testHookSetKeepAlive
tags: [variable function private]
```

```Go
var testHookSetKeepAlive = func(time.Duration) {}
```

### <a id="testHookUninstaller" href="#testHookUninstaller">var testHookUninstaller</a>

```
searchKey: net.testHookUninstaller
tags: [variable struct private]
```

```Go
var testHookUninstaller sync.Once
```

uninstallTestHooks runs just before a run of benchmarks. 

### <a id="testIPv4" href="#testIPv4">var testIPv4</a>

```
searchKey: net.testIPv4
tags: [variable boolean private]
```

```Go
var testIPv4 = flag.Bool("ipv4", true, "assume external IPv4 connectivity exists")
```

If external IPv4 connectivity exists, we can try dialing non-node/interface local scope IPv4 addresses. On Windows, Lookup APIs may not return IPv4-related resource records when a node has no external IPv4 connectivity. 

### <a id="testIPv6" href="#testIPv6">var testIPv6</a>

```
searchKey: net.testIPv6
tags: [variable boolean private]
```

```Go
var testIPv6 = flag.Bool("ipv6", false, "assume external IPv6 connectivity exists")
```

If external IPv6 connectivity exists, we can try dialing non-node/interface local scope IPv6 addresses. On Windows, Lookup APIs may not return IPv6-related resource records when a node has no external IPv6 connectivity. 

### <a id="testInetaddr" href="#testInetaddr">var testInetaddr</a>

```
searchKey: net.testInetaddr
tags: [variable function private]
```

```Go
var testInetaddr = func(ip IPAddr) Addr { return &TCPAddr{IP: ip.IP, Port: 5682, Zone: ip.Zone} }
```

### <a id="testTCPBig" href="#testTCPBig">var testTCPBig</a>

```
searchKey: net.testTCPBig
tags: [variable boolean private]
```

```Go
var testTCPBig = ...
```

### <a id="threadLimit" href="#threadLimit">var threadLimit</a>

```
searchKey: net.threadLimit
tags: [variable private]
```

```Go
var threadLimit chan struct{}
```

### <a id="threadOnce" href="#threadOnce">var threadOnce</a>

```
searchKey: net.threadOnce
tags: [variable struct private]
```

```Go
var threadOnce sync.Once
```

### <a id="udpConnLocalNameTests" href="#udpConnLocalNameTests">var udpConnLocalNameTests</a>

```
searchKey: net.udpConnLocalNameTests
tags: [variable array struct private]
```

```Go
var udpConnLocalNameTests = ...
```

### <a id="udpListenerTests" href="#udpListenerTests">var udpListenerTests</a>

```
searchKey: net.udpListenerTests
tags: [variable array struct private]
```

```Go
var udpListenerTests = ...
```

### <a id="udpServerTests" href="#udpServerTests">var udpServerTests</a>

```
searchKey: net.udpServerTests
tags: [variable array struct private]
```

```Go
var udpServerTests = ...
```

### <a id="unixAndUnixpacketServerTests" href="#unixAndUnixpacketServerTests">var unixAndUnixpacketServerTests</a>

```
searchKey: net.unixAndUnixpacketServerTests
tags: [variable array struct private]
```

```Go
var unixAndUnixpacketServerTests = ...
```

### <a id="unixEnabledOnAIX" href="#unixEnabledOnAIX">var unixEnabledOnAIX</a>

```
searchKey: net.unixEnabledOnAIX
tags: [variable boolean private]
```

```Go
var unixEnabledOnAIX bool
```

### <a id="unixgramServerTests" href="#unixgramServerTests">var unixgramServerTests</a>

```
searchKey: net.unixgramServerTests
tags: [variable array struct private]
```

```Go
var unixgramServerTests = ...
```

### <a id="updateResolvConfTests" href="#updateResolvConfTests">var updateResolvConfTests</a>

```
searchKey: net.updateResolvConfTests
tags: [variable array struct private]
```

```Go
var updateResolvConfTests = ...
```

### <a id="v4InV6Prefix" href="#v4InV6Prefix">var v4InV6Prefix</a>

```
searchKey: net.v4InV6Prefix
tags: [variable array number private]
```

```Go
var v4InV6Prefix = []byte{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xff, 0xff}
```

### <a id="v4addr" href="#v4addr">var v4addr</a>

```
searchKey: net.v4addr
tags: [variable array number private]
```

```Go
var v4addr = IP{192, 168, 0, 1}
```

### <a id="v4mappedv6addr" href="#v4mappedv6addr">var v4mappedv6addr</a>

```
searchKey: net.v4mappedv6addr
tags: [variable array number private]
```

```Go
var v4mappedv6addr = IP{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xff, 0xff, 192, 168, 0, 1}
```

### <a id="v4mappedv6mask" href="#v4mappedv6mask">var v4mappedv6mask</a>

```
searchKey: net.v4mappedv6mask
tags: [variable array number private]
```

```Go
var v4mappedv6mask = ...
```

### <a id="v4mask" href="#v4mask">var v4mask</a>

```
searchKey: net.v4mask
tags: [variable array number private]
```

```Go
var v4mask = IPMask{255, 255, 255, 0}
```

### <a id="v4maskzero" href="#v4maskzero">var v4maskzero</a>

```
searchKey: net.v4maskzero
tags: [variable array number private]
```

```Go
var v4maskzero = IPMask{0, 0, 0, 0}
```

### <a id="v6addr" href="#v6addr">var v6addr</a>

```
searchKey: net.v6addr
tags: [variable array number private]
```

```Go
var v6addr = IP{0x20, 0x1, 0xd, 0xb8, 0, 0, 0, 0, 0, 0, 0x1, 0x23, 0, 0x12, 0, 0x1}
```

### <a id="v6mask" href="#v6mask">var v6mask</a>

```
searchKey: net.v6mask
tags: [variable array number private]
```

```Go
var v6mask = IPMask{0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0, 0, 0, 0, 0, 0, 0, 0}
```

### <a id="writeTimeoutTests" href="#writeTimeoutTests">var writeTimeoutTests</a>

```
searchKey: net.writeTimeoutTests
tags: [variable array struct private]
```

```Go
var writeTimeoutTests = ...
```

### <a id="writeToTimeoutTests" href="#writeToTimeoutTests">var writeToTimeoutTests</a>

```
searchKey: net.writeToTimeoutTests
tags: [variable array struct private]
```

```Go
var writeToTimeoutTests = ...
```

### <a id="zoneCache" href="#zoneCache">var zoneCache</a>

```
searchKey: net.zoneCache
tags: [variable struct private]
```

```Go
var zoneCache = ipv6ZoneCache{
	toIndex: make(map[string]int),
	toName:  make(map[int]string),
}
```

## <a id="type" href="#type">Types</a>

### <a id="Addr" href="#Addr">type Addr interface</a>

```
searchKey: net.Addr
tags: [interface]
```

```Go
type Addr interface {
	Network() string // name of the network (for example, "tcp", "udp")
	String() string  // string form of address (for example, "192.0.2.1:25", "[2001:db8::1]:80")
}
```

Addr represents a network end point address. 

The two methods Network and String conventionally return strings that can be passed as the arguments to Dial, but the exact form and meaning of the strings is up to the implementation. 

#### <a id="sockaddrToIP" href="#sockaddrToIP">func sockaddrToIP(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToIP
tags: [function private]
```

```Go
func sockaddrToIP(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToTCP" href="#sockaddrToTCP">func sockaddrToTCP(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToTCP
tags: [function private]
```

```Go
func sockaddrToTCP(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToUDP" href="#sockaddrToUDP">func sockaddrToUDP(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToUDP
tags: [function private]
```

```Go
func sockaddrToUDP(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToUnix" href="#sockaddrToUnix">func sockaddrToUnix(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToUnix
tags: [function private]
```

```Go
func sockaddrToUnix(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToUnixgram" href="#sockaddrToUnixgram">func sockaddrToUnixgram(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToUnixgram
tags: [function private]
```

```Go
func sockaddrToUnixgram(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToUnixpacket" href="#sockaddrToUnixpacket">func sockaddrToUnixpacket(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToUnixpacket
tags: [function private]
```

```Go
func sockaddrToUnixpacket(sa syscall.Sockaddr) Addr
```

### <a id="AddrError" href="#AddrError">type AddrError struct</a>

```
searchKey: net.AddrError
tags: [struct]
```

```Go
type AddrError struct {
	Err  string
	Addr string
}
```

#### <a id="AddrError.Error" href="#AddrError.Error">func (e *AddrError) Error() string</a>

```
searchKey: net.AddrError.Error
tags: [method]
```

```Go
func (e *AddrError) Error() string
```

#### <a id="AddrError.Temporary" href="#AddrError.Temporary">func (e *AddrError) Temporary() bool</a>

```
searchKey: net.AddrError.Temporary
tags: [method]
```

```Go
func (e *AddrError) Temporary() bool
```

#### <a id="AddrError.Timeout" href="#AddrError.Timeout">func (e *AddrError) Timeout() bool</a>

```
searchKey: net.AddrError.Timeout
tags: [method]
```

```Go
func (e *AddrError) Timeout() bool
```

### <a id="Buffers" href="#Buffers">type Buffers [][]byte</a>

```
searchKey: net.Buffers
tags: [array array number]
```

```Go
type Buffers [][]byte
```

Buffers contains zero or more runs of bytes to write. 

On certain machines, for certain types of connections, this is optimized into an OS-specific batch write operation (such as "writev"). 

#### <a id="Buffers.Read" href="#Buffers.Read">func (v *Buffers) Read(p []byte) (n int, err error)</a>

```
searchKey: net.Buffers.Read
tags: [method]
```

```Go
func (v *Buffers) Read(p []byte) (n int, err error)
```

#### <a id="Buffers.WriteTo" href="#Buffers.WriteTo">func (v *Buffers) WriteTo(w io.Writer) (n int64, err error)</a>

```
searchKey: net.Buffers.WriteTo
tags: [method]
```

```Go
func (v *Buffers) WriteTo(w io.Writer) (n int64, err error)
```

#### <a id="Buffers.consume" href="#Buffers.consume">func (v *Buffers) consume(n int64)</a>

```
searchKey: net.Buffers.consume
tags: [method private]
```

```Go
func (v *Buffers) consume(n int64)
```

### <a id="Conn" href="#Conn">type Conn interface</a>

```
searchKey: net.Conn
tags: [interface]
```

```Go
type Conn interface {
	// Read reads data from the connection.
	// Read can be made to time out and return an error after a fixed
	// time limit; see SetDeadline and SetReadDeadline.
	Read(b []byte) (n int, err error)

	// Write writes data to the connection.
	// Write can be made to time out and return an error after a fixed
	// time limit; see SetDeadline and SetWriteDeadline.
	Write(b []byte) (n int, err error)

	// Close closes the connection.
	// Any blocked Read or Write operations will be unblocked and return errors.
	Close() error

	// LocalAddr returns the local network address.
	LocalAddr() Addr

	// RemoteAddr returns the remote network address.
	RemoteAddr() Addr

	// SetDeadline sets the read and write deadlines associated
	// with the connection. It is equivalent to calling both
	// SetReadDeadline and SetWriteDeadline.
	//
	// A deadline is an absolute time after which I/O operations
	// fail instead of blocking. The deadline applies to all future
	// and pending I/O, not just the immediately following call to
	// Read or Write. After a deadline has been exceeded, the
	// connection can be refreshed by setting a deadline in the future.
	//
	// If the deadline is exceeded a call to Read or Write or to other
	// I/O methods will return an error that wraps os.ErrDeadlineExceeded.
	// This can be tested using errors.Is(err, os.ErrDeadlineExceeded).
	// The error's Timeout method will return true, but note that there
	// are other possible errors for which the Timeout method will
	// return true even if the deadline has not been exceeded.
	//
	// An idle timeout can be implemented by repeatedly extending
	// the deadline after successful Read or Write calls.
	//
	// A zero value for t means I/O operations will not time out.
	SetDeadline(t time.Time) error

	// SetReadDeadline sets the deadline for future Read calls
	// and any currently-blocked Read call.
	// A zero value for t means Read will not time out.
	SetReadDeadline(t time.Time) error

	// SetWriteDeadline sets the deadline for future Write calls
	// and any currently-blocked Write call.
	// Even if write times out, it may return n > 0, indicating that
	// some of the data was successfully written.
	// A zero value for t means Write will not time out.
	SetWriteDeadline(t time.Time) error
}
```

Conn is a generic stream-oriented network connection. 

Multiple goroutines may invoke methods on a Conn simultaneously. 

#### <a id="Dial" href="#Dial">func Dial(network, address string) (Conn, error)</a>

```
searchKey: net.Dial
tags: [function]
```

```Go
func Dial(network, address string) (Conn, error)
```

Dial connects to the address on the named network. 

Known networks are "tcp", "tcp4" (IPv4-only), "tcp6" (IPv6-only), "udp", "udp4" (IPv4-only), "udp6" (IPv6-only), "ip", "ip4" (IPv4-only), "ip6" (IPv6-only), "unix", "unixgram" and "unixpacket". 

For TCP and UDP networks, the address has the form "host:port". The host must be a literal IP address, or a host name that can be resolved to IP addresses. The port must be a literal port number or a service name. If the host is a literal IPv6 address it must be enclosed in square brackets, as in "[2001:db8::1]:80" or "[fe80::1%zone]:80". The zone specifies the scope of the literal IPv6 address as defined in RFC 4007. The functions JoinHostPort and SplitHostPort manipulate a pair of host and port in this form. When using TCP, and the host resolves to multiple IP addresses, Dial will try each IP address in order until one succeeds. 

Examples: 

```
Dial("tcp", "golang.org:http")
Dial("tcp", "192.0.2.1:http")
Dial("tcp", "198.51.100.1:80")
Dial("udp", "[2001:db8::1]:domain")
Dial("udp", "[fe80::1%lo0]:53")
Dial("tcp", ":80")

```
For IP networks, the network must be "ip", "ip4" or "ip6" followed by a colon and a literal protocol number or a protocol name, and the address has the form "host". The host must be a literal IP address or a literal IPv6 address with zone. It depends on each operating system how the operating system behaves with a non-well known protocol number such as "0" or "255". 

Examples: 

```
Dial("ip4:1", "192.0.2.1")
Dial("ip6:ipv6-icmp", "2001:db8::1")
Dial("ip6:58", "fe80::1%lo0")

```
For TCP, UDP and IP networks, if the host is empty or a literal unspecified IP address, as in ":80", "0.0.0.0:80" or "[::]:80" for TCP and UDP, "", "0.0.0.0" or "::" for IP, the local system is assumed. 

For Unix networks, the address must be a file system path. 

#### <a id="DialTimeout" href="#DialTimeout">func DialTimeout(network, address string, timeout time.Duration) (Conn, error)</a>

```
searchKey: net.DialTimeout
tags: [function]
```

```Go
func DialTimeout(network, address string, timeout time.Duration) (Conn, error)
```

DialTimeout acts like Dial but takes a timeout. 

The timeout includes name resolution, if required. When using TCP, and the host in the address parameter resolves to multiple IP addresses, the timeout is spread over each consecutive dial, such that each is given an appropriate fraction of the time to connect. 

See func Dial for a description of the network and address parameters. 

#### <a id="FileConn" href="#FileConn">func FileConn(f *os.File) (c Conn, err error)</a>

```
searchKey: net.FileConn
tags: [function]
```

```Go
func FileConn(f *os.File) (c Conn, err error)
```

FileConn returns a copy of the network connection corresponding to the open file f. It is the caller's responsibility to close f when finished. Closing c does not affect f, and closing f does not affect c. 

#### <a id="fileConn" href="#fileConn">func fileConn(f *os.File) (Conn, error)</a>

```
searchKey: net.fileConn
tags: [function private]
```

```Go
func fileConn(f *os.File) (Conn, error)
```

### <a id="DNSConfigError" href="#DNSConfigError">type DNSConfigError struct</a>

```
searchKey: net.DNSConfigError
tags: [struct]
```

```Go
type DNSConfigError struct {
	Err error
}
```

DNSConfigError represents an error reading the machine's DNS configuration. (No longer used; kept for compatibility.) 

#### <a id="DNSConfigError.Error" href="#DNSConfigError.Error">func (e *DNSConfigError) Error() string</a>

```
searchKey: net.DNSConfigError.Error
tags: [method]
```

```Go
func (e *DNSConfigError) Error() string
```

#### <a id="DNSConfigError.Temporary" href="#DNSConfigError.Temporary">func (e *DNSConfigError) Temporary() bool</a>

```
searchKey: net.DNSConfigError.Temporary
tags: [method]
```

```Go
func (e *DNSConfigError) Temporary() bool
```

#### <a id="DNSConfigError.Timeout" href="#DNSConfigError.Timeout">func (e *DNSConfigError) Timeout() bool</a>

```
searchKey: net.DNSConfigError.Timeout
tags: [method]
```

```Go
func (e *DNSConfigError) Timeout() bool
```

#### <a id="DNSConfigError.Unwrap" href="#DNSConfigError.Unwrap">func (e *DNSConfigError) Unwrap() error</a>

```
searchKey: net.DNSConfigError.Unwrap
tags: [method]
```

```Go
func (e *DNSConfigError) Unwrap() error
```

### <a id="DNSError" href="#DNSError">type DNSError struct</a>

```
searchKey: net.DNSError
tags: [struct]
```

```Go
type DNSError struct {
	Err         string // description of the error
	Name        string // name looked for
	Server      string // server used
	IsTimeout   bool   // if true, timed out; not all timeouts set this
	IsTemporary bool   // if true, error is temporary; not all errors set this
	IsNotFound  bool   // if true, host could not be found
}
```

DNSError represents a DNS lookup error. 

#### <a id="DNSError.Error" href="#DNSError.Error">func (e *DNSError) Error() string</a>

```
searchKey: net.DNSError.Error
tags: [method]
```

```Go
func (e *DNSError) Error() string
```

#### <a id="DNSError.Temporary" href="#DNSError.Temporary">func (e *DNSError) Temporary() bool</a>

```
searchKey: net.DNSError.Temporary
tags: [method]
```

```Go
func (e *DNSError) Temporary() bool
```

Temporary reports whether the DNS error is known to be temporary. This is not always known; a DNS lookup may fail due to a temporary error and return a DNSError for which Temporary returns false. 

#### <a id="DNSError.Timeout" href="#DNSError.Timeout">func (e *DNSError) Timeout() bool</a>

```
searchKey: net.DNSError.Timeout
tags: [method]
```

```Go
func (e *DNSError) Timeout() bool
```

Timeout reports whether the DNS lookup is known to have timed out. This is not always known; a DNS lookup may fail due to a timeout and return a DNSError for which Timeout returns false. 

### <a id="Dialer" href="#Dialer">type Dialer struct</a>

```
searchKey: net.Dialer
tags: [struct]
```

```Go
type Dialer struct {
	// Timeout is the maximum amount of time a dial will wait for
	// a connect to complete. If Deadline is also set, it may fail
	// earlier.
	//
	// The default is no timeout.
	//
	// When using TCP and dialing a host name with multiple IP
	// addresses, the timeout may be divided between them.
	//
	// With or without a timeout, the operating system may impose
	// its own earlier timeout. For instance, TCP timeouts are
	// often around 3 minutes.
	Timeout time.Duration

	// Deadline is the absolute point in time after which dials
	// will fail. If Timeout is set, it may fail earlier.
	// Zero means no deadline, or dependent on the operating system
	// as with the Timeout option.
	Deadline time.Time

	// LocalAddr is the local address to use when dialing an
	// address. The address must be of a compatible type for the
	// network being dialed.
	// If nil, a local address is automatically chosen.
	LocalAddr Addr

	// DualStack previously enabled RFC 6555 Fast Fallback
	// support, also known as "Happy Eyeballs", in which IPv4 is
	// tried soon if IPv6 appears to be misconfigured and
	// hanging.
	//
	// Deprecated: Fast Fallback is enabled by default. To
	// disable, set FallbackDelay to a negative value.
	DualStack bool

	// FallbackDelay specifies the length of time to wait before
	// spawning a RFC 6555 Fast Fallback connection. That is, this
	// is the amount of time to wait for IPv6 to succeed before
	// assuming that IPv6 is misconfigured and falling back to
	// IPv4.
	//
	// If zero, a default delay of 300ms is used.
	// A negative value disables Fast Fallback support.
	FallbackDelay time.Duration

	// KeepAlive specifies the interval between keep-alive
	// probes for an active network connection.
	// If zero, keep-alive probes are sent with a default value
	// (currently 15 seconds), if supported by the protocol and operating
	// system. Network protocols or operating systems that do
	// not support keep-alives ignore this field.
	// If negative, keep-alive probes are disabled.
	KeepAlive time.Duration

	// Resolver optionally specifies an alternate resolver to use.
	Resolver *Resolver

	// Cancel is an optional channel whose closure indicates that
	// the dial should be canceled. Not all types of dials support
	// cancellation.
	//
	// Deprecated: Use DialContext instead.
	Cancel <-chan struct{}

	// If Control is not nil, it is called after creating the network
	// connection but before actually dialing.
	//
	// Network and address parameters passed to Control method are not
	// necessarily the ones passed to Dial. For example, passing "tcp" to Dial
	// will cause the Control function to be called with "tcp4" or "tcp6".
	Control func(network, address string, c syscall.RawConn) error
}
```

A Dialer contains options for connecting to an address. 

The zero value for each field is equivalent to dialing without that option. Dialing with the zero value of Dialer is therefore equivalent to just calling the Dial function. 

It is safe to call Dialer's methods concurrently. 

#### <a id="Dialer.Dial" href="#Dialer.Dial">func (d *Dialer) Dial(network, address string) (Conn, error)</a>

```
searchKey: net.Dialer.Dial
tags: [method]
```

```Go
func (d *Dialer) Dial(network, address string) (Conn, error)
```

Dial connects to the address on the named network. 

See func Dial for a description of the network and address parameters. 

Dial uses context.Background internally; to specify the context, use DialContext. 

#### <a id="Dialer.DialContext" href="#Dialer.DialContext">func (d *Dialer) DialContext(ctx context.Context, network, address string) (Conn, error)</a>

```
searchKey: net.Dialer.DialContext
tags: [method]
```

```Go
func (d *Dialer) DialContext(ctx context.Context, network, address string) (Conn, error)
```

DialContext connects to the address on the named network using the provided context. 

The provided Context must be non-nil. If the context expires before the connection is complete, an error is returned. Once successfully connected, any expiration of the context will not affect the connection. 

When using TCP, and the host in the address parameter resolves to multiple network addresses, any dial timeout (from d.Timeout or ctx) is spread over each consecutive dial, such that each is given an appropriate fraction of the time to connect. For example, if a host has 4 IP addresses and the timeout is 1 minute, the connect to each single address will be given 15 seconds to complete before trying the next one. 

See func Dial for a description of the network and address parameters. 

#### <a id="Dialer.deadline" href="#Dialer.deadline">func (d *Dialer) deadline(ctx context.Context, now time.Time) (earliest time.Time)</a>

```
searchKey: net.Dialer.deadline
tags: [method private]
```

```Go
func (d *Dialer) deadline(ctx context.Context, now time.Time) (earliest time.Time)
```

deadline returns the earliest of: 

```
- now+Timeout
- d.Deadline
- the context's deadline

```
Or zero, if none of Timeout, Deadline, or context's deadline is set. 

#### <a id="Dialer.dualStack" href="#Dialer.dualStack">func (d *Dialer) dualStack() bool</a>

```
searchKey: net.Dialer.dualStack
tags: [method private]
```

```Go
func (d *Dialer) dualStack() bool
```

#### <a id="Dialer.fallbackDelay" href="#Dialer.fallbackDelay">func (d *Dialer) fallbackDelay() time.Duration</a>

```
searchKey: net.Dialer.fallbackDelay
tags: [method private]
```

```Go
func (d *Dialer) fallbackDelay() time.Duration
```

#### <a id="Dialer.resolver" href="#Dialer.resolver">func (d *Dialer) resolver() *Resolver</a>

```
searchKey: net.Dialer.resolver
tags: [method private]
```

```Go
func (d *Dialer) resolver() *Resolver
```

### <a id="Error" href="#Error">type Error interface</a>

```
searchKey: net.Error
tags: [interface]
```

```Go
type Error interface {
	error
	Timeout() bool   // Is the error a timeout?
	Temporary() bool // Is the error temporary?
}
```

An Error represents a network error. 

### <a id="Flags" href="#Flags">type Flags uint</a>

```
searchKey: net.Flags
tags: [number]
```

```Go
type Flags uint
```

#### <a id="linkFlags" href="#linkFlags">func linkFlags(rawFlags int) Flags</a>

```
searchKey: net.linkFlags
tags: [function private]
```

```Go
func linkFlags(rawFlags int) Flags
```

#### <a id="Flags.String" href="#Flags.String">func (f Flags) String() string</a>

```
searchKey: net.Flags.String
tags: [method]
```

```Go
func (f Flags) String() string
```

### <a id="HardwareAddr" href="#HardwareAddr">type HardwareAddr []byte</a>

```
searchKey: net.HardwareAddr
tags: [array number]
```

```Go
type HardwareAddr []byte
```

A HardwareAddr represents a physical hardware address. 

#### <a id="ParseMAC" href="#ParseMAC">func ParseMAC(s string) (hw HardwareAddr, err error)</a>

```
searchKey: net.ParseMAC
tags: [function]
```

```Go
func ParseMAC(s string) (hw HardwareAddr, err error)
```

ParseMAC parses s as an IEEE 802 MAC-48, EUI-48, EUI-64, or a 20-octet IP over InfiniBand link-layer address using one of the following formats: 

```
00:00:5e:00:53:01
02:00:5e:10:00:00:00:01
00:00:00:00:fe:80:00:00:00:00:00:00:02:00:5e:10:00:00:00:01
00-00-5e-00-53-01
02-00-5e-10-00-00-00-01
00-00-00-00-fe-80-00-00-00-00-00-00-02-00-5e-10-00-00-00-01
0000.5e00.5301
0200.5e10.0000.0001
0000.0000.fe80.0000.0000.0000.0200.5e10.0000.0001

```
#### <a id="HardwareAddr.String" href="#HardwareAddr.String">func (a HardwareAddr) String() string</a>

```
searchKey: net.HardwareAddr.String
tags: [method]
```

```Go
func (a HardwareAddr) String() string
```

### <a id="IP" href="#IP">type IP []byte</a>

```
searchKey: net.IP
tags: [array number]
```

```Go
type IP []byte
```

An IP is a single IP address, a slice of bytes. Functions in this package accept either 4-byte (IPv4) or 16-byte (IPv6) slices as input. 

Note that in this documentation, referring to an IP address as an IPv4 address or an IPv6 address is a semantic property of the address, not just the length of the byte slice: a 16-byte slice can still be an IPv4 address. 

#### <a id="IPv4" href="#IPv4">func IPv4(a, b, c, d byte) IP</a>

```
searchKey: net.IPv4
tags: [function]
```

```Go
func IPv4(a, b, c, d byte) IP
```

IPv4 returns the IP address (in 16-byte form) of the IPv4 address a.b.c.d. 

#### <a id="ParseCIDR" href="#ParseCIDR">func ParseCIDR(s string) (IP, *IPNet, error)</a>

```
searchKey: net.ParseCIDR
tags: [function]
```

```Go
func ParseCIDR(s string) (IP, *IPNet, error)
```

ParseCIDR parses s as a CIDR notation IP address and prefix length, like "192.0.2.0/24" or "2001:db8::/32", as defined in RFC 4632 and RFC 4291. 

It returns the IP address and the network implied by the IP and prefix length. For example, ParseCIDR("192.0.2.1/24") returns the IP address 192.0.2.1 and the network 192.0.2.0/24. 

#### <a id="ParseIP" href="#ParseIP">func ParseIP(s string) IP</a>

```
searchKey: net.ParseIP
tags: [function]
```

```Go
func ParseIP(s string) IP
```

ParseIP parses s as an IP address, returning the result. The string s can be in IPv4 dotted decimal ("192.0.2.1"), IPv6 ("2001:db8::68"), or IPv4-mapped IPv6 ("::ffff:192.0.2.1") form. If s is not a valid textual representation of an IP address, ParseIP returns nil. 

#### <a id="copyIP" href="#copyIP">func copyIP(x IP) IP</a>

```
searchKey: net.copyIP
tags: [function private]
```

```Go
func copyIP(x IP) IP
```

#### <a id="interfaceToIPv4Addr" href="#interfaceToIPv4Addr">func interfaceToIPv4Addr(ifi *Interface) (IP, error)</a>

```
searchKey: net.interfaceToIPv4Addr
tags: [function private]
```

```Go
func interfaceToIPv4Addr(ifi *Interface) (IP, error)
```

#### <a id="loopbackIP" href="#loopbackIP">func loopbackIP(net string) IP</a>

```
searchKey: net.loopbackIP
tags: [function private]
```

```Go
func loopbackIP(net string) IP
```

#### <a id="networkNumberAndMask" href="#networkNumberAndMask">func networkNumberAndMask(n *IPNet) (ip IP, m IPMask)</a>

```
searchKey: net.networkNumberAndMask
tags: [function private]
```

```Go
func networkNumberAndMask(n *IPNet) (ip IP, m IPMask)
```

#### <a id="parseIPZone" href="#parseIPZone">func parseIPZone(s string) (IP, string)</a>

```
searchKey: net.parseIPZone
tags: [function private]
```

```Go
func parseIPZone(s string) (IP, string)
```

parseIPZone parses s as an IP address, return it and its associated zone identifier (IPv6 only). 

#### <a id="parseIPv4" href="#parseIPv4">func parseIPv4(s string) IP</a>

```
searchKey: net.parseIPv4
tags: [function private]
```

```Go
func parseIPv4(s string) IP
```

Parse IPv4 address (d.d.d.d). 

#### <a id="parseIPv6" href="#parseIPv6">func parseIPv6(s string) (ip IP)</a>

```
searchKey: net.parseIPv6
tags: [function private]
```

```Go
func parseIPv6(s string) (ip IP)
```

parseIPv6 parses s as a literal IPv6 address described in RFC 4291 and RFC 5952. 

#### <a id="parseIPv6Zone" href="#parseIPv6Zone">func parseIPv6Zone(s string) (IP, string)</a>

```
searchKey: net.parseIPv6Zone
tags: [function private]
```

```Go
func parseIPv6Zone(s string) (IP, string)
```

parseIPv6Zone parses s as a literal IPv6 address and its associated zone identifier which is described in RFC 4007. 

#### <a id="IP.DefaultMask" href="#IP.DefaultMask">func (ip IP) DefaultMask() IPMask</a>

```
searchKey: net.IP.DefaultMask
tags: [method]
```

```Go
func (ip IP) DefaultMask() IPMask
```

DefaultMask returns the default IP mask for the IP address ip. Only IPv4 addresses have default masks; DefaultMask returns nil if ip is not a valid IPv4 address. 

#### <a id="IP.Equal" href="#IP.Equal">func (ip IP) Equal(x IP) bool</a>

```
searchKey: net.IP.Equal
tags: [method]
```

```Go
func (ip IP) Equal(x IP) bool
```

Equal reports whether ip and x are the same IP address. An IPv4 address and that same address in IPv6 form are considered to be equal. 

#### <a id="IP.IsGlobalUnicast" href="#IP.IsGlobalUnicast">func (ip IP) IsGlobalUnicast() bool</a>

```
searchKey: net.IP.IsGlobalUnicast
tags: [method]
```

```Go
func (ip IP) IsGlobalUnicast() bool
```

IsGlobalUnicast reports whether ip is a global unicast address. 

The identification of global unicast addresses uses address type identification as defined in RFC 1122, RFC 4632 and RFC 4291 with the exception of IPv4 directed broadcast addresses. It returns true even if ip is in IPv4 private address space or local IPv6 unicast address space. 

#### <a id="IP.IsInterfaceLocalMulticast" href="#IP.IsInterfaceLocalMulticast">func (ip IP) IsInterfaceLocalMulticast() bool</a>

```
searchKey: net.IP.IsInterfaceLocalMulticast
tags: [method]
```

```Go
func (ip IP) IsInterfaceLocalMulticast() bool
```

IsInterfaceLocalMulticast reports whether ip is an interface-local multicast address. 

#### <a id="IP.IsLinkLocalMulticast" href="#IP.IsLinkLocalMulticast">func (ip IP) IsLinkLocalMulticast() bool</a>

```
searchKey: net.IP.IsLinkLocalMulticast
tags: [method]
```

```Go
func (ip IP) IsLinkLocalMulticast() bool
```

IsLinkLocalMulticast reports whether ip is a link-local multicast address. 

#### <a id="IP.IsLinkLocalUnicast" href="#IP.IsLinkLocalUnicast">func (ip IP) IsLinkLocalUnicast() bool</a>

```
searchKey: net.IP.IsLinkLocalUnicast
tags: [method]
```

```Go
func (ip IP) IsLinkLocalUnicast() bool
```

IsLinkLocalUnicast reports whether ip is a link-local unicast address. 

#### <a id="IP.IsLoopback" href="#IP.IsLoopback">func (ip IP) IsLoopback() bool</a>

```
searchKey: net.IP.IsLoopback
tags: [method]
```

```Go
func (ip IP) IsLoopback() bool
```

IsLoopback reports whether ip is a loopback address. 

#### <a id="IP.IsMulticast" href="#IP.IsMulticast">func (ip IP) IsMulticast() bool</a>

```
searchKey: net.IP.IsMulticast
tags: [method]
```

```Go
func (ip IP) IsMulticast() bool
```

IsMulticast reports whether ip is a multicast address. 

#### <a id="IP.IsPrivate" href="#IP.IsPrivate">func (ip IP) IsPrivate() bool</a>

```
searchKey: net.IP.IsPrivate
tags: [method]
```

```Go
func (ip IP) IsPrivate() bool
```

IsPrivate reports whether ip is a private address, according to RFC 1918 (IPv4 addresses) and RFC 4193 (IPv6 addresses). 

#### <a id="IP.IsUnspecified" href="#IP.IsUnspecified">func (ip IP) IsUnspecified() bool</a>

```
searchKey: net.IP.IsUnspecified
tags: [method]
```

```Go
func (ip IP) IsUnspecified() bool
```

IsUnspecified reports whether ip is an unspecified address, either the IPv4 address "0.0.0.0" or the IPv6 address "::". 

#### <a id="IP.MarshalText" href="#IP.MarshalText">func (ip IP) MarshalText() ([]byte, error)</a>

```
searchKey: net.IP.MarshalText
tags: [method]
```

```Go
func (ip IP) MarshalText() ([]byte, error)
```

MarshalText implements the encoding.TextMarshaler interface. The encoding is the same as returned by String, with one exception: When len(ip) is zero, it returns an empty slice. 

#### <a id="IP.Mask" href="#IP.Mask">func (ip IP) Mask(mask IPMask) IP</a>

```
searchKey: net.IP.Mask
tags: [method]
```

```Go
func (ip IP) Mask(mask IPMask) IP
```

Mask returns the result of masking the IP address ip with mask. 

#### <a id="IP.String" href="#IP.String">func (ip IP) String() string</a>

```
searchKey: net.IP.String
tags: [method]
```

```Go
func (ip IP) String() string
```

String returns the string form of the IP address ip. It returns one of 4 forms: 

```
- "<nil>", if ip has length 0
- dotted decimal ("192.0.2.1"), if ip is an IPv4 or IP4-mapped IPv6 address
- IPv6 ("2001:db8::1"), if ip is a valid IPv6 address
- the hexadecimal form of ip, without punctuation, if no other cases apply

```
#### <a id="IP.To16" href="#IP.To16">func (ip IP) To16() IP</a>

```
searchKey: net.IP.To16
tags: [method]
```

```Go
func (ip IP) To16() IP
```

To16 converts the IP address ip to a 16-byte representation. If ip is not an IP address (it is the wrong length), To16 returns nil. 

#### <a id="IP.To4" href="#IP.To4">func (ip IP) To4() IP</a>

```
searchKey: net.IP.To4
tags: [method]
```

```Go
func (ip IP) To4() IP
```

To4 converts the IPv4 address ip to a 4-byte representation. If ip is not an IPv4 address, To4 returns nil. 

#### <a id="IP.UnmarshalText" href="#IP.UnmarshalText">func (ip *IP) UnmarshalText(text []byte) error</a>

```
searchKey: net.IP.UnmarshalText
tags: [method]
```

```Go
func (ip *IP) UnmarshalText(text []byte) error
```

UnmarshalText implements the encoding.TextUnmarshaler interface. The IP address is expected in a form accepted by ParseIP. 

#### <a id="IP.matchAddrFamily" href="#IP.matchAddrFamily">func (ip IP) matchAddrFamily(x IP) bool</a>

```
searchKey: net.IP.matchAddrFamily
tags: [method private]
```

```Go
func (ip IP) matchAddrFamily(x IP) bool
```

### <a id="IPAddr" href="#IPAddr">type IPAddr struct</a>

```
searchKey: net.IPAddr
tags: [struct]
```

```Go
type IPAddr struct {
	IP   IP
	Zone string // IPv6 scoped addressing zone
}
```

IPAddr represents the address of an IP end point. 

#### <a id="ResolveIPAddr" href="#ResolveIPAddr">func ResolveIPAddr(network, address string) (*IPAddr, error)</a>

```
searchKey: net.ResolveIPAddr
tags: [function]
```

```Go
func ResolveIPAddr(network, address string) (*IPAddr, error)
```

ResolveIPAddr returns an address of IP end point. 

The network must be an IP network name. 

If the host in the address parameter is not a literal IP address, ResolveIPAddr resolves the address to an address of IP end point. Otherwise, it parses the address as a literal IP address. The address parameter can use a host name, but this is not recommended, because it will return at most one of the host name's IP addresses. 

See func Dial for a description of the network and address parameters. 

#### <a id="IPAddr.Network" href="#IPAddr.Network">func (a *IPAddr) Network() string</a>

```
searchKey: net.IPAddr.Network
tags: [method]
```

```Go
func (a *IPAddr) Network() string
```

Network returns the address's network name, "ip". 

#### <a id="IPAddr.String" href="#IPAddr.String">func (a *IPAddr) String() string</a>

```
searchKey: net.IPAddr.String
tags: [method]
```

```Go
func (a *IPAddr) String() string
```

#### <a id="IPAddr.family" href="#IPAddr.family">func (a *IPAddr) family() int</a>

```
searchKey: net.IPAddr.family
tags: [method private]
```

```Go
func (a *IPAddr) family() int
```

#### <a id="IPAddr.isWildcard" href="#IPAddr.isWildcard">func (a *IPAddr) isWildcard() bool</a>

```
searchKey: net.IPAddr.isWildcard
tags: [method private]
```

```Go
func (a *IPAddr) isWildcard() bool
```

#### <a id="IPAddr.opAddr" href="#IPAddr.opAddr">func (a *IPAddr) opAddr() Addr</a>

```
searchKey: net.IPAddr.opAddr
tags: [method private]
```

```Go
func (a *IPAddr) opAddr() Addr
```

#### <a id="IPAddr.sockaddr" href="#IPAddr.sockaddr">func (a *IPAddr) sockaddr(family int) (syscall.Sockaddr, error)</a>

```
searchKey: net.IPAddr.sockaddr
tags: [method private]
```

```Go
func (a *IPAddr) sockaddr(family int) (syscall.Sockaddr, error)
```

#### <a id="IPAddr.toLocal" href="#IPAddr.toLocal">func (a *IPAddr) toLocal(net string) sockaddr</a>

```
searchKey: net.IPAddr.toLocal
tags: [method private]
```

```Go
func (a *IPAddr) toLocal(net string) sockaddr
```

### <a id="IPConn" href="#IPConn">type IPConn struct</a>

```
searchKey: net.IPConn
tags: [struct]
```

```Go
type IPConn struct {
	conn
}
```

IPConn is the implementation of the Conn and PacketConn interfaces for IP network connections. 

#### <a id="DialIP" href="#DialIP">func DialIP(network string, laddr, raddr *IPAddr) (*IPConn, error)</a>

```
searchKey: net.DialIP
tags: [function]
```

```Go
func DialIP(network string, laddr, raddr *IPAddr) (*IPConn, error)
```

DialIP acts like Dial for IP networks. 

The network must be an IP network name; see func Dial for details. 

If laddr is nil, a local address is automatically chosen. If the IP field of raddr is nil or an unspecified IP address, the local system is assumed. 

#### <a id="ListenIP" href="#ListenIP">func ListenIP(network string, laddr *IPAddr) (*IPConn, error)</a>

```
searchKey: net.ListenIP
tags: [function]
```

```Go
func ListenIP(network string, laddr *IPAddr) (*IPConn, error)
```

ListenIP acts like ListenPacket for IP networks. 

The network must be an IP network name; see func Dial for details. 

If the IP field of laddr is nil or an unspecified IP address, ListenIP listens on all available IP addresses of the local system except multicast IP addresses. 

#### <a id="newIPConn" href="#newIPConn">func newIPConn(fd *netFD) *IPConn</a>

```
searchKey: net.newIPConn
tags: [function private]
```

```Go
func newIPConn(fd *netFD) *IPConn
```

#### <a id="IPConn.ReadFrom" href="#IPConn.ReadFrom">func (c *IPConn) ReadFrom(b []byte) (int, Addr, error)</a>

```
searchKey: net.IPConn.ReadFrom
tags: [method]
```

```Go
func (c *IPConn) ReadFrom(b []byte) (int, Addr, error)
```

ReadFrom implements the PacketConn ReadFrom method. 

#### <a id="IPConn.ReadFromIP" href="#IPConn.ReadFromIP">func (c *IPConn) ReadFromIP(b []byte) (int, *IPAddr, error)</a>

```
searchKey: net.IPConn.ReadFromIP
tags: [method]
```

```Go
func (c *IPConn) ReadFromIP(b []byte) (int, *IPAddr, error)
```

ReadFromIP acts like ReadFrom but returns an IPAddr. 

#### <a id="IPConn.ReadMsgIP" href="#IPConn.ReadMsgIP">func (c *IPConn) ReadMsgIP(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)</a>

```
searchKey: net.IPConn.ReadMsgIP
tags: [method]
```

```Go
func (c *IPConn) ReadMsgIP(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)
```

ReadMsgIP reads a message from c, copying the payload into b and the associated out-of-band data into oob. It returns the number of bytes copied into b, the number of bytes copied into oob, the flags that were set on the message and the source address of the message. 

The packages golang.org/x/net/ipv4 and golang.org/x/net/ipv6 can be used to manipulate IP-level socket options in oob. 

#### <a id="IPConn.SyscallConn" href="#IPConn.SyscallConn">func (c *IPConn) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.IPConn.SyscallConn
tags: [method]
```

```Go
func (c *IPConn) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

#### <a id="IPConn.WriteMsgIP" href="#IPConn.WriteMsgIP">func (c *IPConn) WriteMsgIP(b, oob []byte, addr *IPAddr) (n, oobn int, err error)</a>

```
searchKey: net.IPConn.WriteMsgIP
tags: [method]
```

```Go
func (c *IPConn) WriteMsgIP(b, oob []byte, addr *IPAddr) (n, oobn int, err error)
```

WriteMsgIP writes a message to addr via c, copying the payload from b and the associated out-of-band data from oob. It returns the number of payload and out-of-band bytes written. 

The packages golang.org/x/net/ipv4 and golang.org/x/net/ipv6 can be used to manipulate IP-level socket options in oob. 

#### <a id="IPConn.WriteTo" href="#IPConn.WriteTo">func (c *IPConn) WriteTo(b []byte, addr Addr) (int, error)</a>

```
searchKey: net.IPConn.WriteTo
tags: [method]
```

```Go
func (c *IPConn) WriteTo(b []byte, addr Addr) (int, error)
```

WriteTo implements the PacketConn WriteTo method. 

#### <a id="IPConn.WriteToIP" href="#IPConn.WriteToIP">func (c *IPConn) WriteToIP(b []byte, addr *IPAddr) (int, error)</a>

```
searchKey: net.IPConn.WriteToIP
tags: [method]
```

```Go
func (c *IPConn) WriteToIP(b []byte, addr *IPAddr) (int, error)
```

WriteToIP acts like WriteTo but takes an IPAddr. 

#### <a id="IPConn.readFrom" href="#IPConn.readFrom">func (c *IPConn) readFrom(b []byte) (int, *IPAddr, error)</a>

```
searchKey: net.IPConn.readFrom
tags: [method private]
```

```Go
func (c *IPConn) readFrom(b []byte) (int, *IPAddr, error)
```

#### <a id="IPConn.readMsg" href="#IPConn.readMsg">func (c *IPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)</a>

```
searchKey: net.IPConn.readMsg
tags: [method private]
```

```Go
func (c *IPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)
```

#### <a id="IPConn.writeMsg" href="#IPConn.writeMsg">func (c *IPConn) writeMsg(b, oob []byte, addr *IPAddr) (n, oobn int, err error)</a>

```
searchKey: net.IPConn.writeMsg
tags: [method private]
```

```Go
func (c *IPConn) writeMsg(b, oob []byte, addr *IPAddr) (n, oobn int, err error)
```

#### <a id="IPConn.writeTo" href="#IPConn.writeTo">func (c *IPConn) writeTo(b []byte, addr *IPAddr) (int, error)</a>

```
searchKey: net.IPConn.writeTo
tags: [method private]
```

```Go
func (c *IPConn) writeTo(b []byte, addr *IPAddr) (int, error)
```

### <a id="IPMask" href="#IPMask">type IPMask []byte</a>

```
searchKey: net.IPMask
tags: [array number]
```

```Go
type IPMask []byte
```

An IPMask is a bitmask that can be used to manipulate IP addresses for IP addressing and routing. 

See type IPNet and func ParseCIDR for details. 

#### <a id="CIDRMask" href="#CIDRMask">func CIDRMask(ones, bits int) IPMask</a>

```
searchKey: net.CIDRMask
tags: [function]
```

```Go
func CIDRMask(ones, bits int) IPMask
```

CIDRMask returns an IPMask consisting of 'ones' 1 bits followed by 0s up to a total length of 'bits' bits. For a mask of this form, CIDRMask is the inverse of IPMask.Size. 

#### <a id="IPv4Mask" href="#IPv4Mask">func IPv4Mask(a, b, c, d byte) IPMask</a>

```
searchKey: net.IPv4Mask
tags: [function]
```

```Go
func IPv4Mask(a, b, c, d byte) IPMask
```

IPv4Mask returns the IP mask (in 4-byte form) of the IPv4 mask a.b.c.d. 

#### <a id="IPMask.Size" href="#IPMask.Size">func (m IPMask) Size() (ones, bits int)</a>

```
searchKey: net.IPMask.Size
tags: [method]
```

```Go
func (m IPMask) Size() (ones, bits int)
```

Size returns the number of leading ones and total bits in the mask. If the mask is not in the canonical form--ones followed by zeros--then Size returns 0, 0. 

#### <a id="IPMask.String" href="#IPMask.String">func (m IPMask) String() string</a>

```
searchKey: net.IPMask.String
tags: [method]
```

```Go
func (m IPMask) String() string
```

String returns the hexadecimal form of m, with no punctuation. 

### <a id="IPNet" href="#IPNet">type IPNet struct</a>

```
searchKey: net.IPNet
tags: [struct]
```

```Go
type IPNet struct {
	IP   IP     // network number
	Mask IPMask // network mask
}
```

An IPNet represents an IP network. 

#### <a id="mustCIDR" href="#mustCIDR">func mustCIDR(s string) *IPNet</a>

```
searchKey: net.mustCIDR
tags: [function private]
```

```Go
func mustCIDR(s string) *IPNet
```

mustCIDR calls ParseCIDR and panics on any error, or if the network is not IPv6. 

#### <a id="IPNet.Contains" href="#IPNet.Contains">func (n *IPNet) Contains(ip IP) bool</a>

```
searchKey: net.IPNet.Contains
tags: [method]
```

```Go
func (n *IPNet) Contains(ip IP) bool
```

Contains reports whether the network includes ip. 

#### <a id="IPNet.Network" href="#IPNet.Network">func (n *IPNet) Network() string</a>

```
searchKey: net.IPNet.Network
tags: [method]
```

```Go
func (n *IPNet) Network() string
```

Network returns the address's network name, "ip+net". 

#### <a id="IPNet.String" href="#IPNet.String">func (n *IPNet) String() string</a>

```
searchKey: net.IPNet.String
tags: [method]
```

```Go
func (n *IPNet) String() string
```

String returns the CIDR notation of n like "192.0.2.0/24" or "2001:db8::/48" as defined in RFC 4632 and RFC 4291. If the mask is not in the canonical form, it returns the string which consists of an IP address, followed by a slash character and a mask expressed as hexadecimal form with no punctuation like "198.51.100.0/c000ff00". 

### <a id="Interface" href="#Interface">type Interface struct</a>

```
searchKey: net.Interface
tags: [struct]
```

```Go
type Interface struct {
	Index        int          // positive integer that starts at one, zero is never used
	MTU          int          // maximum transmission unit
	Name         string       // e.g., "en0", "lo0", "eth0.100"
	HardwareAddr HardwareAddr // IEEE MAC-48, EUI-48 and EUI-64 form
	Flags        Flags        // e.g., FlagUp, FlagLoopback, FlagMulticast
}
```

Interface represents a mapping between network interface name and index. It also represents network interface facility information. 

#### <a id="InterfaceByIndex" href="#InterfaceByIndex">func InterfaceByIndex(index int) (*Interface, error)</a>

```
searchKey: net.InterfaceByIndex
tags: [function]
```

```Go
func InterfaceByIndex(index int) (*Interface, error)
```

InterfaceByIndex returns the interface specified by index. 

On Solaris, it returns one of the logical network interfaces sharing the logical data link; for more precision use InterfaceByName. 

#### <a id="InterfaceByName" href="#InterfaceByName">func InterfaceByName(name string) (*Interface, error)</a>

```
searchKey: net.InterfaceByName
tags: [function]
```

```Go
func InterfaceByName(name string) (*Interface, error)
```

InterfaceByName returns the interface specified by name. 

#### <a id="interfaceByIndex" href="#interfaceByIndex">func interfaceByIndex(ift []Interface, index int) (*Interface, error)</a>

```
searchKey: net.interfaceByIndex
tags: [function private]
```

```Go
func interfaceByIndex(ift []Interface, index int) (*Interface, error)
```

#### <a id="ipv4AddrToInterface" href="#ipv4AddrToInterface">func ipv4AddrToInterface(ip IP) (*Interface, error)</a>

```
searchKey: net.ipv4AddrToInterface
tags: [function private]
```

```Go
func ipv4AddrToInterface(ip IP) (*Interface, error)
```

#### <a id="loopbackInterface" href="#loopbackInterface">func loopbackInterface() *Interface</a>

```
searchKey: net.loopbackInterface
tags: [function private]
```

```Go
func loopbackInterface() *Interface
```

loopbackInterface returns an available logical network interface for loopback tests. It returns nil if no suitable interface is found. 

#### <a id="Interface.Addrs" href="#Interface.Addrs">func (ifi *Interface) Addrs() ([]Addr, error)</a>

```
searchKey: net.Interface.Addrs
tags: [method]
```

```Go
func (ifi *Interface) Addrs() ([]Addr, error)
```

Addrs returns a list of unicast interface addresses for a specific interface. 

#### <a id="Interface.MulticastAddrs" href="#Interface.MulticastAddrs">func (ifi *Interface) MulticastAddrs() ([]Addr, error)</a>

```
searchKey: net.Interface.MulticastAddrs
tags: [method]
```

```Go
func (ifi *Interface) MulticastAddrs() ([]Addr, error)
```

MulticastAddrs returns a list of multicast, joined group addresses for a specific interface. 

### <a id="InvalidAddrError" href="#InvalidAddrError">type InvalidAddrError string</a>

```
searchKey: net.InvalidAddrError
tags: [string]
```

```Go
type InvalidAddrError string
```

#### <a id="InvalidAddrError.Error" href="#InvalidAddrError.Error">func (e InvalidAddrError) Error() string</a>

```
searchKey: net.InvalidAddrError.Error
tags: [method]
```

```Go
func (e InvalidAddrError) Error() string
```

#### <a id="InvalidAddrError.Temporary" href="#InvalidAddrError.Temporary">func (e InvalidAddrError) Temporary() bool</a>

```
searchKey: net.InvalidAddrError.Temporary
tags: [method]
```

```Go
func (e InvalidAddrError) Temporary() bool
```

#### <a id="InvalidAddrError.Timeout" href="#InvalidAddrError.Timeout">func (e InvalidAddrError) Timeout() bool</a>

```
searchKey: net.InvalidAddrError.Timeout
tags: [method]
```

```Go
func (e InvalidAddrError) Timeout() bool
```

### <a id="ListenConfig" href="#ListenConfig">type ListenConfig struct</a>

```
searchKey: net.ListenConfig
tags: [struct]
```

```Go
type ListenConfig struct {
	// If Control is not nil, it is called after creating the network
	// connection but before binding it to the operating system.
	//
	// Network and address parameters passed to Control method are not
	// necessarily the ones passed to Listen. For example, passing "tcp" to
	// Listen will cause the Control function to be called with "tcp4" or "tcp6".
	Control func(network, address string, c syscall.RawConn) error

	// KeepAlive specifies the keep-alive period for network
	// connections accepted by this listener.
	// If zero, keep-alives are enabled if supported by the protocol
	// and operating system. Network protocols or operating systems
	// that do not support keep-alives ignore this field.
	// If negative, keep-alives are disabled.
	KeepAlive time.Duration
}
```

ListenConfig contains options for listening to an address. 

#### <a id="ListenConfig.Listen" href="#ListenConfig.Listen">func (lc *ListenConfig) Listen(ctx context.Context, network, address string) (Listener, error)</a>

```
searchKey: net.ListenConfig.Listen
tags: [method]
```

```Go
func (lc *ListenConfig) Listen(ctx context.Context, network, address string) (Listener, error)
```

Listen announces on the local network address. 

See func Listen for a description of the network and address parameters. 

#### <a id="ListenConfig.ListenPacket" href="#ListenConfig.ListenPacket">func (lc *ListenConfig) ListenPacket(ctx context.Context, network, address string) (PacketConn, error)</a>

```
searchKey: net.ListenConfig.ListenPacket
tags: [method]
```

```Go
func (lc *ListenConfig) ListenPacket(ctx context.Context, network, address string) (PacketConn, error)
```

ListenPacket announces on the local network address. 

See func ListenPacket for a description of the network and address parameters. 

### <a id="Listener" href="#Listener">type Listener interface</a>

```
searchKey: net.Listener
tags: [interface]
```

```Go
type Listener interface {
	// Accept waits for and returns the next connection to the listener.
	Accept() (Conn, error)

	// Close closes the listener.
	// Any blocked Accept operations will be unblocked and return errors.
	Close() error

	// Addr returns the listener's network address.
	Addr() Addr
}
```

A Listener is a generic network listener for stream-oriented protocols. 

Multiple goroutines may invoke methods on a Listener simultaneously. 

#### <a id="FileListener" href="#FileListener">func FileListener(f *os.File) (ln Listener, err error)</a>

```
searchKey: net.FileListener
tags: [function]
```

```Go
func FileListener(f *os.File) (ln Listener, err error)
```

FileListener returns a copy of the network listener corresponding to the open file f. It is the caller's responsibility to close ln when finished. Closing ln does not affect f, and closing f does not affect ln. 

#### <a id="Listen" href="#Listen">func Listen(network, address string) (Listener, error)</a>

```
searchKey: net.Listen
tags: [function]
```

```Go
func Listen(network, address string) (Listener, error)
```

Listen announces on the local network address. 

The network must be "tcp", "tcp4", "tcp6", "unix" or "unixpacket". 

For TCP networks, if the host in the address parameter is empty or a literal unspecified IP address, Listen listens on all available unicast and anycast IP addresses of the local system. To only use IPv4, use network "tcp4". The address can use a host name, but this is not recommended, because it will create a listener for at most one of the host's IP addresses. If the port in the address parameter is empty or "0", as in "127.0.0.1:" or "[::1]:0", a port number is automatically chosen. The Addr method of Listener can be used to discover the chosen port. 

See func Dial for a description of the network and address parameters. 

Listen uses context.Background internally; to specify the context, use ListenConfig.Listen. 

#### <a id="fileListener" href="#fileListener">func fileListener(f *os.File) (Listener, error)</a>

```
searchKey: net.fileListener
tags: [function private]
```

```Go
func fileListener(f *os.File) (Listener, error)
```

#### <a id="newLocalListener" href="#newLocalListener">func newLocalListener(network string) (Listener, error)</a>

```
searchKey: net.newLocalListener
tags: [function private]
```

```Go
func newLocalListener(network string) (Listener, error)
```

### <a id="MX" href="#MX">type MX struct</a>

```
searchKey: net.MX
tags: [struct]
```

```Go
type MX struct {
	Host string
	Pref uint16
}
```

An MX represents a single DNS MX record. 

### <a id="NS" href="#NS">type NS struct</a>

```
searchKey: net.NS
tags: [struct]
```

```Go
type NS struct {
	Host string
}
```

An NS represents a single DNS NS record. 

### <a id="OpError" href="#OpError">type OpError struct</a>

```
searchKey: net.OpError
tags: [struct]
```

```Go
type OpError struct {
	// Op is the operation which caused the error, such as
	// "read" or "write".
	Op string

	// Net is the network type on which this error occurred,
	// such as "tcp" or "udp6".
	Net string

	// For operations involving a remote network connection, like
	// Dial, Read, or Write, Source is the corresponding local
	// network address.
	Source Addr

	// Addr is the network address for which this error occurred.
	// For local operations, like Listen or SetDeadline, Addr is
	// the address of the local endpoint being manipulated.
	// For operations involving a remote network connection, like
	// Dial, Read, or Write, Addr is the remote address of that
	// connection.
	Addr Addr

	// Err is the error that occurred during the operation.
	// The Error method panics if the error is nil.
	Err error
}
```

OpError is the error type usually returned by functions in the net package. It describes the operation, network type, and address of an error. 

#### <a id="OpError.Error" href="#OpError.Error">func (e *OpError) Error() string</a>

```
searchKey: net.OpError.Error
tags: [method]
```

```Go
func (e *OpError) Error() string
```

#### <a id="OpError.Temporary" href="#OpError.Temporary">func (e *OpError) Temporary() bool</a>

```
searchKey: net.OpError.Temporary
tags: [method]
```

```Go
func (e *OpError) Temporary() bool
```

#### <a id="OpError.Timeout" href="#OpError.Timeout">func (e *OpError) Timeout() bool</a>

```
searchKey: net.OpError.Timeout
tags: [method]
```

```Go
func (e *OpError) Timeout() bool
```

#### <a id="OpError.Unwrap" href="#OpError.Unwrap">func (e *OpError) Unwrap() error</a>

```
searchKey: net.OpError.Unwrap
tags: [method]
```

```Go
func (e *OpError) Unwrap() error
```

#### <a id="OpError.isValid" href="#OpError.isValid">func (e *OpError) isValid() error</a>

```
searchKey: net.OpError.isValid
tags: [method private]
```

```Go
func (e *OpError) isValid() error
```

### <a id="PacketConn" href="#PacketConn">type PacketConn interface</a>

```
searchKey: net.PacketConn
tags: [interface]
```

```Go
type PacketConn interface {
	// ReadFrom reads a packet from the connection,
	// copying the payload into p. It returns the number of
	// bytes copied into p and the return address that
	// was on the packet.
	// It returns the number of bytes read (0 <= n <= len(p))
	// and any error encountered. Callers should always process
	// the n > 0 bytes returned before considering the error err.
	// ReadFrom can be made to time out and return an error after a
	// fixed time limit; see SetDeadline and SetReadDeadline.
	ReadFrom(p []byte) (n int, addr Addr, err error)

	// WriteTo writes a packet with payload p to addr.
	// WriteTo can be made to time out and return an Error after a
	// fixed time limit; see SetDeadline and SetWriteDeadline.
	// On packet-oriented connections, write timeouts are rare.
	WriteTo(p []byte, addr Addr) (n int, err error)

	// Close closes the connection.
	// Any blocked ReadFrom or WriteTo operations will be unblocked and return errors.
	Close() error

	// LocalAddr returns the local network address.
	LocalAddr() Addr

	// SetDeadline sets the read and write deadlines associated
	// with the connection. It is equivalent to calling both
	// SetReadDeadline and SetWriteDeadline.
	//
	// A deadline is an absolute time after which I/O operations
	// fail instead of blocking. The deadline applies to all future
	// and pending I/O, not just the immediately following call to
	// Read or Write. After a deadline has been exceeded, the
	// connection can be refreshed by setting a deadline in the future.
	//
	// If the deadline is exceeded a call to Read or Write or to other
	// I/O methods will return an error that wraps os.ErrDeadlineExceeded.
	// This can be tested using errors.Is(err, os.ErrDeadlineExceeded).
	// The error's Timeout method will return true, but note that there
	// are other possible errors for which the Timeout method will
	// return true even if the deadline has not been exceeded.
	//
	// An idle timeout can be implemented by repeatedly extending
	// the deadline after successful ReadFrom or WriteTo calls.
	//
	// A zero value for t means I/O operations will not time out.
	SetDeadline(t time.Time) error

	// SetReadDeadline sets the deadline for future ReadFrom calls
	// and any currently-blocked ReadFrom call.
	// A zero value for t means ReadFrom will not time out.
	SetReadDeadline(t time.Time) error

	// SetWriteDeadline sets the deadline for future WriteTo calls
	// and any currently-blocked WriteTo call.
	// Even if write times out, it may return n > 0, indicating that
	// some of the data was successfully written.
	// A zero value for t means WriteTo will not time out.
	SetWriteDeadline(t time.Time) error
}
```

PacketConn is a generic packet-oriented network connection. 

Multiple goroutines may invoke methods on a PacketConn simultaneously. 

#### <a id="FilePacketConn" href="#FilePacketConn">func FilePacketConn(f *os.File) (c PacketConn, err error)</a>

```
searchKey: net.FilePacketConn
tags: [function]
```

```Go
func FilePacketConn(f *os.File) (c PacketConn, err error)
```

FilePacketConn returns a copy of the packet network connection corresponding to the open file f. It is the caller's responsibility to close f when finished. Closing c does not affect f, and closing f does not affect c. 

#### <a id="ListenPacket" href="#ListenPacket">func ListenPacket(network, address string) (PacketConn, error)</a>

```
searchKey: net.ListenPacket
tags: [function]
```

```Go
func ListenPacket(network, address string) (PacketConn, error)
```

ListenPacket announces on the local network address. 

The network must be "udp", "udp4", "udp6", "unixgram", or an IP transport. The IP transports are "ip", "ip4", or "ip6" followed by a colon and a literal protocol number or a protocol name, as in "ip:1" or "ip:icmp". 

For UDP and IP networks, if the host in the address parameter is empty or a literal unspecified IP address, ListenPacket listens on all available IP addresses of the local system except multicast IP addresses. To only use IPv4, use network "udp4" or "ip4:proto". The address can use a host name, but this is not recommended, because it will create a listener for at most one of the host's IP addresses. If the port in the address parameter is empty or "0", as in "127.0.0.1:" or "[::1]:0", a port number is automatically chosen. The LocalAddr method of PacketConn can be used to discover the chosen port. 

See func Dial for a description of the network and address parameters. 

ListenPacket uses context.Background internally; to specify the context, use ListenConfig.ListenPacket. 

#### <a id="filePacketConn" href="#filePacketConn">func filePacketConn(f *os.File) (PacketConn, error)</a>

```
searchKey: net.filePacketConn
tags: [function private]
```

```Go
func filePacketConn(f *os.File) (PacketConn, error)
```

#### <a id="newLocalPacketListener" href="#newLocalPacketListener">func newLocalPacketListener(network string) (PacketConn, error)</a>

```
searchKey: net.newLocalPacketListener
tags: [function private]
```

```Go
func newLocalPacketListener(network string) (PacketConn, error)
```

### <a id="ParseError" href="#ParseError">type ParseError struct</a>

```
searchKey: net.ParseError
tags: [struct]
```

```Go
type ParseError struct {
	// Type is the type of string that was expected, such as
	// "IP address", "CIDR address".
	Type string

	// Text is the malformed text string.
	Text string
}
```

A ParseError is the error type of literal network address parsers. 

#### <a id="ParseError.Error" href="#ParseError.Error">func (e *ParseError) Error() string</a>

```
searchKey: net.ParseError.Error
tags: [method]
```

```Go
func (e *ParseError) Error() string
```

#### <a id="ParseError.Temporary" href="#ParseError.Temporary">func (e *ParseError) Temporary() bool</a>

```
searchKey: net.ParseError.Temporary
tags: [method]
```

```Go
func (e *ParseError) Temporary() bool
```

#### <a id="ParseError.Timeout" href="#ParseError.Timeout">func (e *ParseError) Timeout() bool</a>

```
searchKey: net.ParseError.Timeout
tags: [method]
```

```Go
func (e *ParseError) Timeout() bool
```

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: net.Resolver
tags: [struct]
```

```Go
type Resolver struct {
	// PreferGo controls whether Go's built-in DNS resolver is preferred
	// on platforms where it's available. It is equivalent to setting
	// GODEBUG=netdns=go, but scoped to just this resolver.
	PreferGo bool

	// StrictErrors controls the behavior of temporary errors
	// (including timeout, socket errors, and SERVFAIL) when using
	// Go's built-in resolver. For a query composed of multiple
	// sub-queries (such as an A+AAAA address lookup, or walking the
	// DNS search list), this option causes such errors to abort the
	// whole query instead of returning a partial result. This is
	// not enabled by default because it may affect compatibility
	// with resolvers that process AAAA queries incorrectly.
	StrictErrors bool

	// Dial optionally specifies an alternate dialer for use by
	// Go's built-in DNS resolver to make TCP and UDP connections
	// to DNS services. The host in the address parameter will
	// always be a literal IP address and not a host name, and the
	// port in the address parameter will be a literal port number
	// and not a service name.
	// If the Conn returned is also a PacketConn, sent and received DNS
	// messages must adhere to RFC 1035 section 4.2.1, "UDP usage".
	// Otherwise, DNS messages transmitted over Conn must adhere
	// to RFC 7766 section 5, "Transport Protocol Selection".
	// If nil, the default dialer is used.
	Dial func(ctx context.Context, network, address string) (Conn, error)

	// lookupGroup merges LookupIPAddr calls together for lookups for the same
	// host. The lookupGroup key is the LookupIPAddr.host argument.
	// The return values are ([]IPAddr, error).
	lookupGroup singleflight.Group
}
```

A Resolver looks up names and numbers. 

A nil *Resolver is equivalent to a zero Resolver. 

#### <a id="Resolver.LookupAddr" href="#Resolver.LookupAddr">func (r *Resolver) LookupAddr(ctx context.Context, addr string) ([]string, error)</a>

```
searchKey: net.Resolver.LookupAddr
tags: [method]
```

```Go
func (r *Resolver) LookupAddr(ctx context.Context, addr string) ([]string, error)
```

LookupAddr performs a reverse lookup for the given address, returning a list of names mapping to that address. 

The returned names are validated to be properly formatted presentation-format domain names. 

#### <a id="Resolver.LookupCNAME" href="#Resolver.LookupCNAME">func (r *Resolver) LookupCNAME(ctx context.Context, host string) (string, error)</a>

```
searchKey: net.Resolver.LookupCNAME
tags: [method]
```

```Go
func (r *Resolver) LookupCNAME(ctx context.Context, host string) (string, error)
```

LookupCNAME returns the canonical name for the given host. Callers that do not care about the canonical name can call LookupHost or LookupIP directly; both take care of resolving the canonical name as part of the lookup. 

A canonical name is the final name after following zero or more CNAME records. LookupCNAME does not return an error if host does not contain DNS "CNAME" records, as long as host resolves to address records. 

The returned canonical name is validated to be a properly formatted presentation-format domain name. 

#### <a id="Resolver.LookupHost" href="#Resolver.LookupHost">func (r *Resolver) LookupHost(ctx context.Context, host string) (addrs []string, err error)</a>

```
searchKey: net.Resolver.LookupHost
tags: [method]
```

```Go
func (r *Resolver) LookupHost(ctx context.Context, host string) (addrs []string, err error)
```

LookupHost looks up the given host using the local resolver. It returns a slice of that host's addresses. 

#### <a id="Resolver.LookupIP" href="#Resolver.LookupIP">func (r *Resolver) LookupIP(ctx context.Context, network, host string) ([]IP, error)</a>

```
searchKey: net.Resolver.LookupIP
tags: [method]
```

```Go
func (r *Resolver) LookupIP(ctx context.Context, network, host string) ([]IP, error)
```

LookupIP looks up host for the given network using the local resolver. It returns a slice of that host's IP addresses of the type specified by network. network must be one of "ip", "ip4" or "ip6". 

#### <a id="Resolver.LookupIPAddr" href="#Resolver.LookupIPAddr">func (r *Resolver) LookupIPAddr(ctx context.Context, host string) ([]IPAddr, error)</a>

```
searchKey: net.Resolver.LookupIPAddr
tags: [method]
```

```Go
func (r *Resolver) LookupIPAddr(ctx context.Context, host string) ([]IPAddr, error)
```

LookupIPAddr looks up host using the local resolver. It returns a slice of that host's IPv4 and IPv6 addresses. 

#### <a id="Resolver.LookupMX" href="#Resolver.LookupMX">func (r *Resolver) LookupMX(ctx context.Context, name string) ([]*MX, error)</a>

```
searchKey: net.Resolver.LookupMX
tags: [method]
```

```Go
func (r *Resolver) LookupMX(ctx context.Context, name string) ([]*MX, error)
```

LookupMX returns the DNS MX records for the given domain name sorted by preference. 

The returned mail server names are validated to be properly formatted presentation-format domain names. 

#### <a id="Resolver.LookupNS" href="#Resolver.LookupNS">func (r *Resolver) LookupNS(ctx context.Context, name string) ([]*NS, error)</a>

```
searchKey: net.Resolver.LookupNS
tags: [method]
```

```Go
func (r *Resolver) LookupNS(ctx context.Context, name string) ([]*NS, error)
```

LookupNS returns the DNS NS records for the given domain name. 

The returned name server names are validated to be properly formatted presentation-format domain names. 

#### <a id="Resolver.LookupPort" href="#Resolver.LookupPort">func (r *Resolver) LookupPort(ctx context.Context, network, service string) (port int, err error)</a>

```
searchKey: net.Resolver.LookupPort
tags: [method]
```

```Go
func (r *Resolver) LookupPort(ctx context.Context, network, service string) (port int, err error)
```

LookupPort looks up the port for the given network and service. 

#### <a id="Resolver.LookupSRV" href="#Resolver.LookupSRV">func (r *Resolver) LookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)</a>

```
searchKey: net.Resolver.LookupSRV
tags: [method]
```

```Go
func (r *Resolver) LookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)
```

LookupSRV tries to resolve an SRV query of the given service, protocol, and domain name. The proto is "tcp" or "udp". The returned records are sorted by priority and randomized by weight within a priority. 

LookupSRV constructs the DNS name to look up following RFC 2782. That is, it looks up _service._proto.name. To accommodate services publishing SRV records under non-standard names, if both service and proto are empty strings, LookupSRV looks up name directly. 

The returned service names are validated to be properly formatted presentation-format domain names. 

#### <a id="Resolver.LookupTXT" href="#Resolver.LookupTXT">func (r *Resolver) LookupTXT(ctx context.Context, name string) ([]string, error)</a>

```
searchKey: net.Resolver.LookupTXT
tags: [method]
```

```Go
func (r *Resolver) LookupTXT(ctx context.Context, name string) ([]string, error)
```

LookupTXT returns the DNS TXT records for the given domain name. 

#### <a id="Resolver.dial" href="#Resolver.dial">func (r *Resolver) dial(ctx context.Context, network, server string) (Conn, error)</a>

```
searchKey: net.Resolver.dial
tags: [method private]
```

```Go
func (r *Resolver) dial(ctx context.Context, network, server string) (Conn, error)
```

#### <a id="Resolver.exchange" href="#Resolver.exchange">func (r *Resolver) exchange(ctx context.Context, server string, q dnsmessage.Question, timeout time.Duration, useTCP bool) (dnsmessage.Parser, dnsmessage.Header, error)</a>

```
searchKey: net.Resolver.exchange
tags: [method private]
```

```Go
func (r *Resolver) exchange(ctx context.Context, server string, q dnsmessage.Question, timeout time.Duration, useTCP bool) (dnsmessage.Parser, dnsmessage.Header, error)
```

exchange sends a query on the connection and hopes for a response. 

#### <a id="Resolver.getLookupGroup" href="#Resolver.getLookupGroup">func (r *Resolver) getLookupGroup() *singleflight.Group</a>

```
searchKey: net.Resolver.getLookupGroup
tags: [method private]
```

```Go
func (r *Resolver) getLookupGroup() *singleflight.Group
```

#### <a id="Resolver.goLookupCNAME" href="#Resolver.goLookupCNAME">func (r *Resolver) goLookupCNAME(ctx context.Context, host string) (string, error)</a>

```
searchKey: net.Resolver.goLookupCNAME
tags: [method private]
```

```Go
func (r *Resolver) goLookupCNAME(ctx context.Context, host string) (string, error)
```

goLookupCNAME is the native Go (non-cgo) implementation of LookupCNAME. 

#### <a id="Resolver.goLookupHost" href="#Resolver.goLookupHost">func (r *Resolver) goLookupHost(ctx context.Context, name string) (addrs []string, err error)</a>

```
searchKey: net.Resolver.goLookupHost
tags: [method private]
```

```Go
func (r *Resolver) goLookupHost(ctx context.Context, name string) (addrs []string, err error)
```

goLookupHost is the native Go implementation of LookupHost. Used only if cgoLookupHost refuses to handle the request (that is, only if cgoLookupHost is the stub in cgo_stub.go). Normally we let cgo use the C library resolver instead of depending on our lookup code, so that Go and C get the same answers. 

#### <a id="Resolver.goLookupHostOrder" href="#Resolver.goLookupHostOrder">func (r *Resolver) goLookupHostOrder(ctx context.Context, name string, order hostLookupOrder) (addrs []string, err error)</a>

```
searchKey: net.Resolver.goLookupHostOrder
tags: [method private]
```

```Go
func (r *Resolver) goLookupHostOrder(ctx context.Context, name string, order hostLookupOrder) (addrs []string, err error)
```

#### <a id="Resolver.goLookupIP" href="#Resolver.goLookupIP">func (r *Resolver) goLookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)</a>

```
searchKey: net.Resolver.goLookupIP
tags: [method private]
```

```Go
func (r *Resolver) goLookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)
```

goLookupIP is the native Go implementation of LookupIP. The libc versions are in cgo_*.go. 

#### <a id="Resolver.goLookupIPCNAMEOrder" href="#Resolver.goLookupIPCNAMEOrder">func (r *Resolver) goLookupIPCNAMEOrder(ctx context.Context, network, name string, order hostLookupOrder) (addrs []IPAddr, cname dnsmessage.Name, err error)</a>

```
searchKey: net.Resolver.goLookupIPCNAMEOrder
tags: [method private]
```

```Go
func (r *Resolver) goLookupIPCNAMEOrder(ctx context.Context, network, name string, order hostLookupOrder) (addrs []IPAddr, cname dnsmessage.Name, err error)
```

#### <a id="Resolver.goLookupPTR" href="#Resolver.goLookupPTR">func (r *Resolver) goLookupPTR(ctx context.Context, addr string) ([]string, error)</a>

```
searchKey: net.Resolver.goLookupPTR
tags: [method private]
```

```Go
func (r *Resolver) goLookupPTR(ctx context.Context, addr string) ([]string, error)
```

goLookupPTR is the native Go implementation of LookupAddr. Used only if cgoLookupPTR refuses to handle the request (that is, only if cgoLookupPTR is the stub in cgo_stub.go). Normally we let cgo use the C library resolver instead of depending on our lookup code, so that Go and C get the same answers. 

#### <a id="Resolver.internetAddrList" href="#Resolver.internetAddrList">func (r *Resolver) internetAddrList(ctx context.Context, net, addr string) (addrList, error)</a>

```
searchKey: net.Resolver.internetAddrList
tags: [method private]
```

```Go
func (r *Resolver) internetAddrList(ctx context.Context, net, addr string) (addrList, error)
```

internetAddrList resolves addr, which may be a literal IP address or a DNS name, and returns a list of internet protocol family addresses. The result contains at least one address when error is nil. 

#### <a id="Resolver.lookup" href="#Resolver.lookup">func (r *Resolver) lookup(ctx context.Context, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)</a>

```
searchKey: net.Resolver.lookup
tags: [method private]
```

```Go
func (r *Resolver) lookup(ctx context.Context, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)
```

#### <a id="Resolver.lookupAddr" href="#Resolver.lookupAddr">func (r *Resolver) lookupAddr(ctx context.Context, addr string) ([]string, error)</a>

```
searchKey: net.Resolver.lookupAddr
tags: [method private]
```

```Go
func (r *Resolver) lookupAddr(ctx context.Context, addr string) ([]string, error)
```

#### <a id="Resolver.lookupCNAME" href="#Resolver.lookupCNAME">func (r *Resolver) lookupCNAME(ctx context.Context, name string) (string, error)</a>

```
searchKey: net.Resolver.lookupCNAME
tags: [method private]
```

```Go
func (r *Resolver) lookupCNAME(ctx context.Context, name string) (string, error)
```

#### <a id="Resolver.lookupHost" href="#Resolver.lookupHost">func (r *Resolver) lookupHost(ctx context.Context, host string) (addrs []string, err error)</a>

```
searchKey: net.Resolver.lookupHost
tags: [method private]
```

```Go
func (r *Resolver) lookupHost(ctx context.Context, host string) (addrs []string, err error)
```

#### <a id="Resolver.lookupIP" href="#Resolver.lookupIP">func (r *Resolver) lookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)</a>

```
searchKey: net.Resolver.lookupIP
tags: [method private]
```

```Go
func (r *Resolver) lookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)
```

#### <a id="Resolver.lookupIPAddr" href="#Resolver.lookupIPAddr">func (r *Resolver) lookupIPAddr(ctx context.Context, network, host string) ([]IPAddr, error)</a>

```
searchKey: net.Resolver.lookupIPAddr
tags: [method private]
```

```Go
func (r *Resolver) lookupIPAddr(ctx context.Context, network, host string) ([]IPAddr, error)
```

lookupIPAddr looks up host using the local resolver and particular network. It returns a slice of that host's IPv4 and IPv6 addresses. 

#### <a id="Resolver.lookupMX" href="#Resolver.lookupMX">func (r *Resolver) lookupMX(ctx context.Context, name string) ([]*MX, error)</a>

```
searchKey: net.Resolver.lookupMX
tags: [method private]
```

```Go
func (r *Resolver) lookupMX(ctx context.Context, name string) ([]*MX, error)
```

#### <a id="Resolver.lookupNS" href="#Resolver.lookupNS">func (r *Resolver) lookupNS(ctx context.Context, name string) ([]*NS, error)</a>

```
searchKey: net.Resolver.lookupNS
tags: [method private]
```

```Go
func (r *Resolver) lookupNS(ctx context.Context, name string) ([]*NS, error)
```

#### <a id="Resolver.lookupPort" href="#Resolver.lookupPort">func (r *Resolver) lookupPort(ctx context.Context, network, service string) (int, error)</a>

```
searchKey: net.Resolver.lookupPort
tags: [method private]
```

```Go
func (r *Resolver) lookupPort(ctx context.Context, network, service string) (int, error)
```

#### <a id="Resolver.lookupSRV" href="#Resolver.lookupSRV">func (r *Resolver) lookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)</a>

```
searchKey: net.Resolver.lookupSRV
tags: [method private]
```

```Go
func (r *Resolver) lookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)
```

#### <a id="Resolver.lookupTXT" href="#Resolver.lookupTXT">func (r *Resolver) lookupTXT(ctx context.Context, name string) ([]string, error)</a>

```
searchKey: net.Resolver.lookupTXT
tags: [method private]
```

```Go
func (r *Resolver) lookupTXT(ctx context.Context, name string) ([]string, error)
```

#### <a id="Resolver.preferGo" href="#Resolver.preferGo">func (r *Resolver) preferGo() bool</a>

```
searchKey: net.Resolver.preferGo
tags: [method private]
```

```Go
func (r *Resolver) preferGo() bool
```

#### <a id="Resolver.resolveAddrList" href="#Resolver.resolveAddrList">func (r *Resolver) resolveAddrList(ctx context.Context, op, network, addr string, hint Addr) (addrList, error)</a>

```
searchKey: net.Resolver.resolveAddrList
tags: [method private]
```

```Go
func (r *Resolver) resolveAddrList(ctx context.Context, op, network, addr string, hint Addr) (addrList, error)
```

resolveAddrList resolves addr using hint and returns a list of addresses. The result contains at least one address when error is nil. 

#### <a id="Resolver.strictErrors" href="#Resolver.strictErrors">func (r *Resolver) strictErrors() bool</a>

```
searchKey: net.Resolver.strictErrors
tags: [method private]
```

```Go
func (r *Resolver) strictErrors() bool
```

#### <a id="Resolver.tryOneName" href="#Resolver.tryOneName">func (r *Resolver) tryOneName(ctx context.Context, cfg *dnsConfig, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)</a>

```
searchKey: net.Resolver.tryOneName
tags: [method private]
```

```Go
func (r *Resolver) tryOneName(ctx context.Context, cfg *dnsConfig, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)
```

Do a lookup for a single name, which must be rooted (otherwise answer will not find the answers). 

### <a id="SRV" href="#SRV">type SRV struct</a>

```
searchKey: net.SRV
tags: [struct]
```

```Go
type SRV struct {
	Target   string
	Port     uint16
	Priority uint16
	Weight   uint16
}
```

An SRV represents a single DNS SRV record. 

### <a id="TCPAddr" href="#TCPAddr">type TCPAddr struct</a>

```
searchKey: net.TCPAddr
tags: [struct]
```

```Go
type TCPAddr struct {
	IP   IP
	Port int
	Zone string // IPv6 scoped addressing zone
}
```

TCPAddr represents the address of a TCP end point. 

#### <a id="ResolveTCPAddr" href="#ResolveTCPAddr">func ResolveTCPAddr(network, address string) (*TCPAddr, error)</a>

```
searchKey: net.ResolveTCPAddr
tags: [function]
```

```Go
func ResolveTCPAddr(network, address string) (*TCPAddr, error)
```

ResolveTCPAddr returns an address of TCP end point. 

The network must be a TCP network name. 

If the host in the address parameter is not a literal IP address or the port is not a literal port number, ResolveTCPAddr resolves the address to an address of TCP end point. Otherwise, it parses the address as a pair of literal IP address and port number. The address parameter can use a host name, but this is not recommended, because it will return at most one of the host name's IP addresses. 

See func Dial for a description of the network and address parameters. 

#### <a id="TCPAddr.Network" href="#TCPAddr.Network">func (a *TCPAddr) Network() string</a>

```
searchKey: net.TCPAddr.Network
tags: [method]
```

```Go
func (a *TCPAddr) Network() string
```

Network returns the address's network name, "tcp". 

#### <a id="TCPAddr.String" href="#TCPAddr.String">func (a *TCPAddr) String() string</a>

```
searchKey: net.TCPAddr.String
tags: [method]
```

```Go
func (a *TCPAddr) String() string
```

#### <a id="TCPAddr.family" href="#TCPAddr.family">func (a *TCPAddr) family() int</a>

```
searchKey: net.TCPAddr.family
tags: [method private]
```

```Go
func (a *TCPAddr) family() int
```

#### <a id="TCPAddr.isWildcard" href="#TCPAddr.isWildcard">func (a *TCPAddr) isWildcard() bool</a>

```
searchKey: net.TCPAddr.isWildcard
tags: [method private]
```

```Go
func (a *TCPAddr) isWildcard() bool
```

#### <a id="TCPAddr.opAddr" href="#TCPAddr.opAddr">func (a *TCPAddr) opAddr() Addr</a>

```
searchKey: net.TCPAddr.opAddr
tags: [method private]
```

```Go
func (a *TCPAddr) opAddr() Addr
```

#### <a id="TCPAddr.sockaddr" href="#TCPAddr.sockaddr">func (a *TCPAddr) sockaddr(family int) (syscall.Sockaddr, error)</a>

```
searchKey: net.TCPAddr.sockaddr
tags: [method private]
```

```Go
func (a *TCPAddr) sockaddr(family int) (syscall.Sockaddr, error)
```

#### <a id="TCPAddr.toLocal" href="#TCPAddr.toLocal">func (a *TCPAddr) toLocal(net string) sockaddr</a>

```
searchKey: net.TCPAddr.toLocal
tags: [method private]
```

```Go
func (a *TCPAddr) toLocal(net string) sockaddr
```

### <a id="TCPConn" href="#TCPConn">type TCPConn struct</a>

```
searchKey: net.TCPConn
tags: [struct]
```

```Go
type TCPConn struct {
	conn
}
```

TCPConn is an implementation of the Conn interface for TCP network connections. 

#### <a id="DialTCP" href="#DialTCP">func DialTCP(network string, laddr, raddr *TCPAddr) (*TCPConn, error)</a>

```
searchKey: net.DialTCP
tags: [function]
```

```Go
func DialTCP(network string, laddr, raddr *TCPAddr) (*TCPConn, error)
```

DialTCP acts like Dial for TCP networks. 

The network must be a TCP network name; see func Dial for details. 

If laddr is nil, a local address is automatically chosen. If the IP field of raddr is nil or an unspecified IP address, the local system is assumed. 

#### <a id="newTCPConn" href="#newTCPConn">func newTCPConn(fd *netFD) *TCPConn</a>

```
searchKey: net.newTCPConn
tags: [function private]
```

```Go
func newTCPConn(fd *netFD) *TCPConn
```

#### <a id="slowDialTCP" href="#slowDialTCP">func slowDialTCP(ctx context.Context, network string, laddr, raddr *TCPAddr) (*TCPConn, error)</a>

```
searchKey: net.slowDialTCP
tags: [function private]
```

```Go
func slowDialTCP(ctx context.Context, network string, laddr, raddr *TCPAddr) (*TCPConn, error)
```

In some environments, the slow IPs may be explicitly unreachable, and fail more quickly than expected. This test hook prevents dialTCP from returning before the deadline. 

#### <a id="TCPConn.CloseRead" href="#TCPConn.CloseRead">func (c *TCPConn) CloseRead() error</a>

```
searchKey: net.TCPConn.CloseRead
tags: [method]
```

```Go
func (c *TCPConn) CloseRead() error
```

CloseRead shuts down the reading side of the TCP connection. Most callers should just use Close. 

#### <a id="TCPConn.CloseWrite" href="#TCPConn.CloseWrite">func (c *TCPConn) CloseWrite() error</a>

```
searchKey: net.TCPConn.CloseWrite
tags: [method]
```

```Go
func (c *TCPConn) CloseWrite() error
```

CloseWrite shuts down the writing side of the TCP connection. Most callers should just use Close. 

#### <a id="TCPConn.ReadFrom" href="#TCPConn.ReadFrom">func (c *TCPConn) ReadFrom(r io.Reader) (int64, error)</a>

```
searchKey: net.TCPConn.ReadFrom
tags: [method]
```

```Go
func (c *TCPConn) ReadFrom(r io.Reader) (int64, error)
```

ReadFrom implements the io.ReaderFrom ReadFrom method. 

#### <a id="TCPConn.SetKeepAlive" href="#TCPConn.SetKeepAlive">func (c *TCPConn) SetKeepAlive(keepalive bool) error</a>

```
searchKey: net.TCPConn.SetKeepAlive
tags: [method]
```

```Go
func (c *TCPConn) SetKeepAlive(keepalive bool) error
```

SetKeepAlive sets whether the operating system should send keep-alive messages on the connection. 

#### <a id="TCPConn.SetKeepAlivePeriod" href="#TCPConn.SetKeepAlivePeriod">func (c *TCPConn) SetKeepAlivePeriod(d time.Duration) error</a>

```
searchKey: net.TCPConn.SetKeepAlivePeriod
tags: [method]
```

```Go
func (c *TCPConn) SetKeepAlivePeriod(d time.Duration) error
```

SetKeepAlivePeriod sets period between keep-alives. 

#### <a id="TCPConn.SetLinger" href="#TCPConn.SetLinger">func (c *TCPConn) SetLinger(sec int) error</a>

```
searchKey: net.TCPConn.SetLinger
tags: [method]
```

```Go
func (c *TCPConn) SetLinger(sec int) error
```

SetLinger sets the behavior of Close on a connection which still has data waiting to be sent or to be acknowledged. 

If sec < 0 (the default), the operating system finishes sending the data in the background. 

If sec == 0, the operating system discards any unsent or unacknowledged data. 

If sec > 0, the data is sent in the background as with sec < 0. On some operating systems after sec seconds have elapsed any remaining unsent data may be discarded. 

#### <a id="TCPConn.SetNoDelay" href="#TCPConn.SetNoDelay">func (c *TCPConn) SetNoDelay(noDelay bool) error</a>

```
searchKey: net.TCPConn.SetNoDelay
tags: [method]
```

```Go
func (c *TCPConn) SetNoDelay(noDelay bool) error
```

SetNoDelay controls whether the operating system should delay packet transmission in hopes of sending fewer packets (Nagle's algorithm).  The default is true (no delay), meaning that data is sent as soon as possible after a Write. 

#### <a id="TCPConn.SyscallConn" href="#TCPConn.SyscallConn">func (c *TCPConn) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.TCPConn.SyscallConn
tags: [method]
```

```Go
func (c *TCPConn) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

#### <a id="TCPConn.readFrom" href="#TCPConn.readFrom">func (c *TCPConn) readFrom(r io.Reader) (int64, error)</a>

```
searchKey: net.TCPConn.readFrom
tags: [method private]
```

```Go
func (c *TCPConn) readFrom(r io.Reader) (int64, error)
```

### <a id="TCPListener" href="#TCPListener">type TCPListener struct</a>

```
searchKey: net.TCPListener
tags: [struct]
```

```Go
type TCPListener struct {
	fd *netFD
	lc ListenConfig
}
```

TCPListener is a TCP network listener. Clients should typically use variables of type Listener instead of assuming TCP. 

#### <a id="ListenTCP" href="#ListenTCP">func ListenTCP(network string, laddr *TCPAddr) (*TCPListener, error)</a>

```
searchKey: net.ListenTCP
tags: [function]
```

```Go
func ListenTCP(network string, laddr *TCPAddr) (*TCPListener, error)
```

ListenTCP acts like Listen for TCP networks. 

The network must be a TCP network name; see func Dial for details. 

If the IP field of laddr is nil or an unspecified IP address, ListenTCP listens on all available unicast and anycast IP addresses of the local system. If the Port field of laddr is 0, a port number is automatically chosen. 

#### <a id="TCPListener.Accept" href="#TCPListener.Accept">func (l *TCPListener) Accept() (Conn, error)</a>

```
searchKey: net.TCPListener.Accept
tags: [method]
```

```Go
func (l *TCPListener) Accept() (Conn, error)
```

Accept implements the Accept method in the Listener interface; it waits for the next call and returns a generic Conn. 

#### <a id="TCPListener.AcceptTCP" href="#TCPListener.AcceptTCP">func (l *TCPListener) AcceptTCP() (*TCPConn, error)</a>

```
searchKey: net.TCPListener.AcceptTCP
tags: [method]
```

```Go
func (l *TCPListener) AcceptTCP() (*TCPConn, error)
```

AcceptTCP accepts the next incoming call and returns the new connection. 

#### <a id="TCPListener.Addr" href="#TCPListener.Addr">func (l *TCPListener) Addr() Addr</a>

```
searchKey: net.TCPListener.Addr
tags: [method]
```

```Go
func (l *TCPListener) Addr() Addr
```

Addr returns the listener's network address, a *TCPAddr. The Addr returned is shared by all invocations of Addr, so do not modify it. 

#### <a id="TCPListener.Close" href="#TCPListener.Close">func (l *TCPListener) Close() error</a>

```
searchKey: net.TCPListener.Close
tags: [method]
```

```Go
func (l *TCPListener) Close() error
```

Close stops listening on the TCP address. Already Accepted connections are not closed. 

#### <a id="TCPListener.File" href="#TCPListener.File">func (l *TCPListener) File() (f *os.File, err error)</a>

```
searchKey: net.TCPListener.File
tags: [method]
```

```Go
func (l *TCPListener) File() (f *os.File, err error)
```

File returns a copy of the underlying os.File. It is the caller's responsibility to close f when finished. Closing l does not affect f, and closing f does not affect l. 

The returned os.File's file descriptor is different from the connection's. Attempting to change properties of the original using this duplicate may or may not have the desired effect. 

#### <a id="TCPListener.SetDeadline" href="#TCPListener.SetDeadline">func (l *TCPListener) SetDeadline(t time.Time) error</a>

```
searchKey: net.TCPListener.SetDeadline
tags: [method]
```

```Go
func (l *TCPListener) SetDeadline(t time.Time) error
```

SetDeadline sets the deadline associated with the listener. A zero time value disables the deadline. 

#### <a id="TCPListener.SyscallConn" href="#TCPListener.SyscallConn">func (l *TCPListener) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.TCPListener.SyscallConn
tags: [method]
```

```Go
func (l *TCPListener) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

The returned RawConn only supports calling Control. Read and Write return an error. 

#### <a id="TCPListener.accept" href="#TCPListener.accept">func (ln *TCPListener) accept() (*TCPConn, error)</a>

```
searchKey: net.TCPListener.accept
tags: [method private]
```

```Go
func (ln *TCPListener) accept() (*TCPConn, error)
```

#### <a id="TCPListener.close" href="#TCPListener.close">func (ln *TCPListener) close() error</a>

```
searchKey: net.TCPListener.close
tags: [method private]
```

```Go
func (ln *TCPListener) close() error
```

#### <a id="TCPListener.file" href="#TCPListener.file">func (ln *TCPListener) file() (*os.File, error)</a>

```
searchKey: net.TCPListener.file
tags: [method private]
```

```Go
func (ln *TCPListener) file() (*os.File, error)
```

#### <a id="TCPListener.ok" href="#TCPListener.ok">func (ln *TCPListener) ok() bool</a>

```
searchKey: net.TCPListener.ok
tags: [method private]
```

```Go
func (ln *TCPListener) ok() bool
```

#### <a id="TCPListener.port" href="#TCPListener.port">func (ln *TCPListener) port() string</a>

```
searchKey: net.TCPListener.port
tags: [method private]
```

```Go
func (ln *TCPListener) port() string
```

### <a id="UDPAddr" href="#UDPAddr">type UDPAddr struct</a>

```
searchKey: net.UDPAddr
tags: [struct]
```

```Go
type UDPAddr struct {
	IP   IP
	Port int
	Zone string // IPv6 scoped addressing zone
}
```

UDPAddr represents the address of a UDP end point. 

#### <a id="ResolveUDPAddr" href="#ResolveUDPAddr">func ResolveUDPAddr(network, address string) (*UDPAddr, error)</a>

```
searchKey: net.ResolveUDPAddr
tags: [function]
```

```Go
func ResolveUDPAddr(network, address string) (*UDPAddr, error)
```

ResolveUDPAddr returns an address of UDP end point. 

The network must be a UDP network name. 

If the host in the address parameter is not a literal IP address or the port is not a literal port number, ResolveUDPAddr resolves the address to an address of UDP end point. Otherwise, it parses the address as a pair of literal IP address and port number. The address parameter can use a host name, but this is not recommended, because it will return at most one of the host name's IP addresses. 

See func Dial for a description of the network and address parameters. 

#### <a id="UDPAddr.Network" href="#UDPAddr.Network">func (a *UDPAddr) Network() string</a>

```
searchKey: net.UDPAddr.Network
tags: [method]
```

```Go
func (a *UDPAddr) Network() string
```

Network returns the address's network name, "udp". 

#### <a id="UDPAddr.String" href="#UDPAddr.String">func (a *UDPAddr) String() string</a>

```
searchKey: net.UDPAddr.String
tags: [method]
```

```Go
func (a *UDPAddr) String() string
```

#### <a id="UDPAddr.family" href="#UDPAddr.family">func (a *UDPAddr) family() int</a>

```
searchKey: net.UDPAddr.family
tags: [method private]
```

```Go
func (a *UDPAddr) family() int
```

#### <a id="UDPAddr.isWildcard" href="#UDPAddr.isWildcard">func (a *UDPAddr) isWildcard() bool</a>

```
searchKey: net.UDPAddr.isWildcard
tags: [method private]
```

```Go
func (a *UDPAddr) isWildcard() bool
```

#### <a id="UDPAddr.opAddr" href="#UDPAddr.opAddr">func (a *UDPAddr) opAddr() Addr</a>

```
searchKey: net.UDPAddr.opAddr
tags: [method private]
```

```Go
func (a *UDPAddr) opAddr() Addr
```

#### <a id="UDPAddr.sockaddr" href="#UDPAddr.sockaddr">func (a *UDPAddr) sockaddr(family int) (syscall.Sockaddr, error)</a>

```
searchKey: net.UDPAddr.sockaddr
tags: [method private]
```

```Go
func (a *UDPAddr) sockaddr(family int) (syscall.Sockaddr, error)
```

#### <a id="UDPAddr.toLocal" href="#UDPAddr.toLocal">func (a *UDPAddr) toLocal(net string) sockaddr</a>

```
searchKey: net.UDPAddr.toLocal
tags: [method private]
```

```Go
func (a *UDPAddr) toLocal(net string) sockaddr
```

### <a id="UDPConn" href="#UDPConn">type UDPConn struct</a>

```
searchKey: net.UDPConn
tags: [struct]
```

```Go
type UDPConn struct {
	conn
}
```

UDPConn is the implementation of the Conn and PacketConn interfaces for UDP network connections. 

#### <a id="DialUDP" href="#DialUDP">func DialUDP(network string, laddr, raddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.DialUDP
tags: [function]
```

```Go
func DialUDP(network string, laddr, raddr *UDPAddr) (*UDPConn, error)
```

DialUDP acts like Dial for UDP networks. 

The network must be a UDP network name; see func Dial for details. 

If laddr is nil, a local address is automatically chosen. If the IP field of raddr is nil or an unspecified IP address, the local system is assumed. 

#### <a id="ListenMulticastUDP" href="#ListenMulticastUDP">func ListenMulticastUDP(network string, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.ListenMulticastUDP
tags: [function]
```

```Go
func ListenMulticastUDP(network string, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)
```

ListenMulticastUDP acts like ListenPacket for UDP networks but takes a group address on a specific network interface. 

The network must be a UDP network name; see func Dial for details. 

ListenMulticastUDP listens on all available IP addresses of the local system including the group, multicast IP address. If ifi is nil, ListenMulticastUDP uses the system-assigned multicast interface, although this is not recommended because the assignment depends on platforms and sometimes it might require routing configuration. If the Port field of gaddr is 0, a port number is automatically chosen. 

ListenMulticastUDP is just for convenience of simple, small applications. There are golang.org/x/net/ipv4 and golang.org/x/net/ipv6 packages for general purpose uses. 

Note that ListenMulticastUDP will set the IP_MULTICAST_LOOP socket option to 0 under IPPROTO_IP, to disable loopback of multicast packets. 

#### <a id="ListenUDP" href="#ListenUDP">func ListenUDP(network string, laddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.ListenUDP
tags: [function]
```

```Go
func ListenUDP(network string, laddr *UDPAddr) (*UDPConn, error)
```

ListenUDP acts like ListenPacket for UDP networks. 

The network must be a UDP network name; see func Dial for details. 

If the IP field of laddr is nil or an unspecified IP address, ListenUDP listens on all available IP addresses of the local system except multicast IP addresses. If the Port field of laddr is 0, a port number is automatically chosen. 

#### <a id="newUDPConn" href="#newUDPConn">func newUDPConn(fd *netFD) *UDPConn</a>

```
searchKey: net.newUDPConn
tags: [function private]
```

```Go
func newUDPConn(fd *netFD) *UDPConn
```

#### <a id="UDPConn.ReadFrom" href="#UDPConn.ReadFrom">func (c *UDPConn) ReadFrom(b []byte) (int, Addr, error)</a>

```
searchKey: net.UDPConn.ReadFrom
tags: [method]
```

```Go
func (c *UDPConn) ReadFrom(b []byte) (int, Addr, error)
```

ReadFrom implements the PacketConn ReadFrom method. 

#### <a id="UDPConn.ReadFromUDP" href="#UDPConn.ReadFromUDP">func (c *UDPConn) ReadFromUDP(b []byte) (n int, addr *UDPAddr, err error)</a>

```
searchKey: net.UDPConn.ReadFromUDP
tags: [method]
```

```Go
func (c *UDPConn) ReadFromUDP(b []byte) (n int, addr *UDPAddr, err error)
```

ReadFromUDP acts like ReadFrom but returns a UDPAddr. 

#### <a id="UDPConn.ReadMsgUDP" href="#UDPConn.ReadMsgUDP">func (c *UDPConn) ReadMsgUDP(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)</a>

```
searchKey: net.UDPConn.ReadMsgUDP
tags: [method]
```

```Go
func (c *UDPConn) ReadMsgUDP(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)
```

ReadMsgUDP reads a message from c, copying the payload into b and the associated out-of-band data into oob. It returns the number of bytes copied into b, the number of bytes copied into oob, the flags that were set on the message and the source address of the message. 

The packages golang.org/x/net/ipv4 and golang.org/x/net/ipv6 can be used to manipulate IP-level socket options in oob. 

#### <a id="UDPConn.SyscallConn" href="#UDPConn.SyscallConn">func (c *UDPConn) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.UDPConn.SyscallConn
tags: [method]
```

```Go
func (c *UDPConn) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

#### <a id="UDPConn.WriteMsgUDP" href="#UDPConn.WriteMsgUDP">func (c *UDPConn) WriteMsgUDP(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)</a>

```
searchKey: net.UDPConn.WriteMsgUDP
tags: [method]
```

```Go
func (c *UDPConn) WriteMsgUDP(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)
```

WriteMsgUDP writes a message to addr via c if c isn't connected, or to c's remote address if c is connected (in which case addr must be nil). The payload is copied from b and the associated out-of-band data is copied from oob. It returns the number of payload and out-of-band bytes written. 

The packages golang.org/x/net/ipv4 and golang.org/x/net/ipv6 can be used to manipulate IP-level socket options in oob. 

#### <a id="UDPConn.WriteTo" href="#UDPConn.WriteTo">func (c *UDPConn) WriteTo(b []byte, addr Addr) (int, error)</a>

```
searchKey: net.UDPConn.WriteTo
tags: [method]
```

```Go
func (c *UDPConn) WriteTo(b []byte, addr Addr) (int, error)
```

WriteTo implements the PacketConn WriteTo method. 

#### <a id="UDPConn.WriteToUDP" href="#UDPConn.WriteToUDP">func (c *UDPConn) WriteToUDP(b []byte, addr *UDPAddr) (int, error)</a>

```
searchKey: net.UDPConn.WriteToUDP
tags: [method]
```

```Go
func (c *UDPConn) WriteToUDP(b []byte, addr *UDPAddr) (int, error)
```

WriteToUDP acts like WriteTo but takes a UDPAddr. 

#### <a id="UDPConn.port" href="#UDPConn.port">func (c *UDPConn) port() string</a>

```
searchKey: net.UDPConn.port
tags: [method private]
```

```Go
func (c *UDPConn) port() string
```

#### <a id="UDPConn.readFrom" href="#UDPConn.readFrom">func (c *UDPConn) readFrom(b []byte, addr *UDPAddr) (int, *UDPAddr, error)</a>

```
searchKey: net.UDPConn.readFrom
tags: [method private]
```

```Go
func (c *UDPConn) readFrom(b []byte, addr *UDPAddr) (int, *UDPAddr, error)
```

#### <a id="UDPConn.readFromUDP" href="#UDPConn.readFromUDP">func (c *UDPConn) readFromUDP(b []byte, addr *UDPAddr) (int, *UDPAddr, error)</a>

```
searchKey: net.UDPConn.readFromUDP
tags: [method private]
```

```Go
func (c *UDPConn) readFromUDP(b []byte, addr *UDPAddr) (int, *UDPAddr, error)
```

readFromUDP implements ReadFromUDP. 

#### <a id="UDPConn.readMsg" href="#UDPConn.readMsg">func (c *UDPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)</a>

```
searchKey: net.UDPConn.readMsg
tags: [method private]
```

```Go
func (c *UDPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)
```

#### <a id="UDPConn.writeMsg" href="#UDPConn.writeMsg">func (c *UDPConn) writeMsg(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)</a>

```
searchKey: net.UDPConn.writeMsg
tags: [method private]
```

```Go
func (c *UDPConn) writeMsg(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)
```

#### <a id="UDPConn.writeTo" href="#UDPConn.writeTo">func (c *UDPConn) writeTo(b []byte, addr *UDPAddr) (int, error)</a>

```
searchKey: net.UDPConn.writeTo
tags: [method private]
```

```Go
func (c *UDPConn) writeTo(b []byte, addr *UDPAddr) (int, error)
```

### <a id="UnixAddr" href="#UnixAddr">type UnixAddr struct</a>

```
searchKey: net.UnixAddr
tags: [struct]
```

```Go
type UnixAddr struct {
	Name string
	Net  string
}
```

UnixAddr represents the address of a Unix domain socket end point. 

#### <a id="ResolveUnixAddr" href="#ResolveUnixAddr">func ResolveUnixAddr(network, address string) (*UnixAddr, error)</a>

```
searchKey: net.ResolveUnixAddr
tags: [function]
```

```Go
func ResolveUnixAddr(network, address string) (*UnixAddr, error)
```

ResolveUnixAddr returns an address of Unix domain socket end point. 

The network must be a Unix network name. 

See func Dial for a description of the network and address parameters. 

#### <a id="UnixAddr.Network" href="#UnixAddr.Network">func (a *UnixAddr) Network() string</a>

```
searchKey: net.UnixAddr.Network
tags: [method]
```

```Go
func (a *UnixAddr) Network() string
```

Network returns the address's network name, "unix", "unixgram" or "unixpacket". 

#### <a id="UnixAddr.String" href="#UnixAddr.String">func (a *UnixAddr) String() string</a>

```
searchKey: net.UnixAddr.String
tags: [method]
```

```Go
func (a *UnixAddr) String() string
```

#### <a id="UnixAddr.family" href="#UnixAddr.family">func (a *UnixAddr) family() int</a>

```
searchKey: net.UnixAddr.family
tags: [method private]
```

```Go
func (a *UnixAddr) family() int
```

#### <a id="UnixAddr.isWildcard" href="#UnixAddr.isWildcard">func (a *UnixAddr) isWildcard() bool</a>

```
searchKey: net.UnixAddr.isWildcard
tags: [method private]
```

```Go
func (a *UnixAddr) isWildcard() bool
```

#### <a id="UnixAddr.opAddr" href="#UnixAddr.opAddr">func (a *UnixAddr) opAddr() Addr</a>

```
searchKey: net.UnixAddr.opAddr
tags: [method private]
```

```Go
func (a *UnixAddr) opAddr() Addr
```

#### <a id="UnixAddr.sockaddr" href="#UnixAddr.sockaddr">func (a *UnixAddr) sockaddr(family int) (syscall.Sockaddr, error)</a>

```
searchKey: net.UnixAddr.sockaddr
tags: [method private]
```

```Go
func (a *UnixAddr) sockaddr(family int) (syscall.Sockaddr, error)
```

#### <a id="UnixAddr.toLocal" href="#UnixAddr.toLocal">func (a *UnixAddr) toLocal(net string) sockaddr</a>

```
searchKey: net.UnixAddr.toLocal
tags: [method private]
```

```Go
func (a *UnixAddr) toLocal(net string) sockaddr
```

### <a id="UnixConn" href="#UnixConn">type UnixConn struct</a>

```
searchKey: net.UnixConn
tags: [struct]
```

```Go
type UnixConn struct {
	conn
}
```

UnixConn is an implementation of the Conn interface for connections to Unix domain sockets. 

#### <a id="DialUnix" href="#DialUnix">func DialUnix(network string, laddr, raddr *UnixAddr) (*UnixConn, error)</a>

```
searchKey: net.DialUnix
tags: [function]
```

```Go
func DialUnix(network string, laddr, raddr *UnixAddr) (*UnixConn, error)
```

DialUnix acts like Dial for Unix networks. 

The network must be a Unix network name; see func Dial for details. 

If laddr is non-nil, it is used as the local address for the connection. 

#### <a id="ListenUnixgram" href="#ListenUnixgram">func ListenUnixgram(network string, laddr *UnixAddr) (*UnixConn, error)</a>

```
searchKey: net.ListenUnixgram
tags: [function]
```

```Go
func ListenUnixgram(network string, laddr *UnixAddr) (*UnixConn, error)
```

ListenUnixgram acts like ListenPacket for Unix networks. 

The network must be "unixgram". 

#### <a id="newUnixConn" href="#newUnixConn">func newUnixConn(fd *netFD) *UnixConn</a>

```
searchKey: net.newUnixConn
tags: [function private]
```

```Go
func newUnixConn(fd *netFD) *UnixConn
```

#### <a id="UnixConn.CloseRead" href="#UnixConn.CloseRead">func (c *UnixConn) CloseRead() error</a>

```
searchKey: net.UnixConn.CloseRead
tags: [method]
```

```Go
func (c *UnixConn) CloseRead() error
```

CloseRead shuts down the reading side of the Unix domain connection. Most callers should just use Close. 

#### <a id="UnixConn.CloseWrite" href="#UnixConn.CloseWrite">func (c *UnixConn) CloseWrite() error</a>

```
searchKey: net.UnixConn.CloseWrite
tags: [method]
```

```Go
func (c *UnixConn) CloseWrite() error
```

CloseWrite shuts down the writing side of the Unix domain connection. Most callers should just use Close. 

#### <a id="UnixConn.ReadFrom" href="#UnixConn.ReadFrom">func (c *UnixConn) ReadFrom(b []byte) (int, Addr, error)</a>

```
searchKey: net.UnixConn.ReadFrom
tags: [method]
```

```Go
func (c *UnixConn) ReadFrom(b []byte) (int, Addr, error)
```

ReadFrom implements the PacketConn ReadFrom method. 

#### <a id="UnixConn.ReadFromUnix" href="#UnixConn.ReadFromUnix">func (c *UnixConn) ReadFromUnix(b []byte) (int, *UnixAddr, error)</a>

```
searchKey: net.UnixConn.ReadFromUnix
tags: [method]
```

```Go
func (c *UnixConn) ReadFromUnix(b []byte) (int, *UnixAddr, error)
```

ReadFromUnix acts like ReadFrom but returns a UnixAddr. 

#### <a id="UnixConn.ReadMsgUnix" href="#UnixConn.ReadMsgUnix">func (c *UnixConn) ReadMsgUnix(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)</a>

```
searchKey: net.UnixConn.ReadMsgUnix
tags: [method]
```

```Go
func (c *UnixConn) ReadMsgUnix(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)
```

ReadMsgUnix reads a message from c, copying the payload into b and the associated out-of-band data into oob. It returns the number of bytes copied into b, the number of bytes copied into oob, the flags that were set on the message and the source address of the message. 

Note that if len(b) == 0 and len(oob) > 0, this function will still read (and discard) 1 byte from the connection. 

#### <a id="UnixConn.SyscallConn" href="#UnixConn.SyscallConn">func (c *UnixConn) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.UnixConn.SyscallConn
tags: [method]
```

```Go
func (c *UnixConn) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

#### <a id="UnixConn.WriteMsgUnix" href="#UnixConn.WriteMsgUnix">func (c *UnixConn) WriteMsgUnix(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)</a>

```
searchKey: net.UnixConn.WriteMsgUnix
tags: [method]
```

```Go
func (c *UnixConn) WriteMsgUnix(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)
```

WriteMsgUnix writes a message to addr via c, copying the payload from b and the associated out-of-band data from oob. It returns the number of payload and out-of-band bytes written. 

Note that if len(b) == 0 and len(oob) > 0, this function will still write 1 byte to the connection. 

#### <a id="UnixConn.WriteTo" href="#UnixConn.WriteTo">func (c *UnixConn) WriteTo(b []byte, addr Addr) (int, error)</a>

```
searchKey: net.UnixConn.WriteTo
tags: [method]
```

```Go
func (c *UnixConn) WriteTo(b []byte, addr Addr) (int, error)
```

WriteTo implements the PacketConn WriteTo method. 

#### <a id="UnixConn.WriteToUnix" href="#UnixConn.WriteToUnix">func (c *UnixConn) WriteToUnix(b []byte, addr *UnixAddr) (int, error)</a>

```
searchKey: net.UnixConn.WriteToUnix
tags: [method]
```

```Go
func (c *UnixConn) WriteToUnix(b []byte, addr *UnixAddr) (int, error)
```

WriteToUnix acts like WriteTo but takes a UnixAddr. 

#### <a id="UnixConn.readFrom" href="#UnixConn.readFrom">func (c *UnixConn) readFrom(b []byte) (int, *UnixAddr, error)</a>

```
searchKey: net.UnixConn.readFrom
tags: [method private]
```

```Go
func (c *UnixConn) readFrom(b []byte) (int, *UnixAddr, error)
```

#### <a id="UnixConn.readMsg" href="#UnixConn.readMsg">func (c *UnixConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)</a>

```
searchKey: net.UnixConn.readMsg
tags: [method private]
```

```Go
func (c *UnixConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)
```

#### <a id="UnixConn.writeMsg" href="#UnixConn.writeMsg">func (c *UnixConn) writeMsg(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)</a>

```
searchKey: net.UnixConn.writeMsg
tags: [method private]
```

```Go
func (c *UnixConn) writeMsg(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)
```

#### <a id="UnixConn.writeTo" href="#UnixConn.writeTo">func (c *UnixConn) writeTo(b []byte, addr *UnixAddr) (int, error)</a>

```
searchKey: net.UnixConn.writeTo
tags: [method private]
```

```Go
func (c *UnixConn) writeTo(b []byte, addr *UnixAddr) (int, error)
```

### <a id="UnixListener" href="#UnixListener">type UnixListener struct</a>

```
searchKey: net.UnixListener
tags: [struct]
```

```Go
type UnixListener struct {
	fd         *netFD
	path       string
	unlink     bool
	unlinkOnce sync.Once
}
```

UnixListener is a Unix domain socket listener. Clients should typically use variables of type Listener instead of assuming Unix domain sockets. 

#### <a id="ListenUnix" href="#ListenUnix">func ListenUnix(network string, laddr *UnixAddr) (*UnixListener, error)</a>

```
searchKey: net.ListenUnix
tags: [function]
```

```Go
func ListenUnix(network string, laddr *UnixAddr) (*UnixListener, error)
```

ListenUnix acts like Listen for Unix networks. 

The network must be "unix" or "unixpacket". 

#### <a id="UnixListener.Accept" href="#UnixListener.Accept">func (l *UnixListener) Accept() (Conn, error)</a>

```
searchKey: net.UnixListener.Accept
tags: [method]
```

```Go
func (l *UnixListener) Accept() (Conn, error)
```

Accept implements the Accept method in the Listener interface. Returned connections will be of type *UnixConn. 

#### <a id="UnixListener.AcceptUnix" href="#UnixListener.AcceptUnix">func (l *UnixListener) AcceptUnix() (*UnixConn, error)</a>

```
searchKey: net.UnixListener.AcceptUnix
tags: [method]
```

```Go
func (l *UnixListener) AcceptUnix() (*UnixConn, error)
```

AcceptUnix accepts the next incoming call and returns the new connection. 

#### <a id="UnixListener.Addr" href="#UnixListener.Addr">func (l *UnixListener) Addr() Addr</a>

```
searchKey: net.UnixListener.Addr
tags: [method]
```

```Go
func (l *UnixListener) Addr() Addr
```

Addr returns the listener's network address. The Addr returned is shared by all invocations of Addr, so do not modify it. 

#### <a id="UnixListener.Close" href="#UnixListener.Close">func (l *UnixListener) Close() error</a>

```
searchKey: net.UnixListener.Close
tags: [method]
```

```Go
func (l *UnixListener) Close() error
```

Close stops listening on the Unix address. Already accepted connections are not closed. 

#### <a id="UnixListener.File" href="#UnixListener.File">func (l *UnixListener) File() (f *os.File, err error)</a>

```
searchKey: net.UnixListener.File
tags: [method]
```

```Go
func (l *UnixListener) File() (f *os.File, err error)
```

File returns a copy of the underlying os.File. It is the caller's responsibility to close f when finished. Closing l does not affect f, and closing f does not affect l. 

The returned os.File's file descriptor is different from the connection's. Attempting to change properties of the original using this duplicate may or may not have the desired effect. 

#### <a id="UnixListener.SetDeadline" href="#UnixListener.SetDeadline">func (l *UnixListener) SetDeadline(t time.Time) error</a>

```
searchKey: net.UnixListener.SetDeadline
tags: [method]
```

```Go
func (l *UnixListener) SetDeadline(t time.Time) error
```

SetDeadline sets the deadline associated with the listener. A zero time value disables the deadline. 

#### <a id="UnixListener.SetUnlinkOnClose" href="#UnixListener.SetUnlinkOnClose">func (l *UnixListener) SetUnlinkOnClose(unlink bool)</a>

```
searchKey: net.UnixListener.SetUnlinkOnClose
tags: [method]
```

```Go
func (l *UnixListener) SetUnlinkOnClose(unlink bool)
```

SetUnlinkOnClose sets whether the underlying socket file should be removed from the file system when the listener is closed. 

The default behavior is to unlink the socket file only when package net created it. That is, when the listener and the underlying socket file were created by a call to Listen or ListenUnix, then by default closing the listener will remove the socket file. but if the listener was created by a call to FileListener to use an already existing socket file, then by default closing the listener will not remove the socket file. 

#### <a id="UnixListener.SyscallConn" href="#UnixListener.SyscallConn">func (l *UnixListener) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.UnixListener.SyscallConn
tags: [method]
```

```Go
func (l *UnixListener) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

The returned RawConn only supports calling Control. Read and Write return an error. 

#### <a id="UnixListener.accept" href="#UnixListener.accept">func (ln *UnixListener) accept() (*UnixConn, error)</a>

```
searchKey: net.UnixListener.accept
tags: [method private]
```

```Go
func (ln *UnixListener) accept() (*UnixConn, error)
```

#### <a id="UnixListener.close" href="#UnixListener.close">func (ln *UnixListener) close() error</a>

```
searchKey: net.UnixListener.close
tags: [method private]
```

```Go
func (ln *UnixListener) close() error
```

#### <a id="UnixListener.file" href="#UnixListener.file">func (ln *UnixListener) file() (*os.File, error)</a>

```
searchKey: net.UnixListener.file
tags: [method private]
```

```Go
func (ln *UnixListener) file() (*os.File, error)
```

#### <a id="UnixListener.ok" href="#UnixListener.ok">func (ln *UnixListener) ok() bool</a>

```
searchKey: net.UnixListener.ok
tags: [method private]
```

```Go
func (ln *UnixListener) ok() bool
```

### <a id="UnknownNetworkError" href="#UnknownNetworkError">type UnknownNetworkError string</a>

```
searchKey: net.UnknownNetworkError
tags: [string]
```

```Go
type UnknownNetworkError string
```

#### <a id="UnknownNetworkError.Error" href="#UnknownNetworkError.Error">func (e UnknownNetworkError) Error() string</a>

```
searchKey: net.UnknownNetworkError.Error
tags: [method]
```

```Go
func (e UnknownNetworkError) Error() string
```

#### <a id="UnknownNetworkError.Temporary" href="#UnknownNetworkError.Temporary">func (e UnknownNetworkError) Temporary() bool</a>

```
searchKey: net.UnknownNetworkError.Temporary
tags: [method]
```

```Go
func (e UnknownNetworkError) Temporary() bool
```

#### <a id="UnknownNetworkError.Timeout" href="#UnknownNetworkError.Timeout">func (e UnknownNetworkError) Timeout() bool</a>

```
searchKey: net.UnknownNetworkError.Timeout
tags: [method]
```

```Go
func (e UnknownNetworkError) Timeout() bool
```

### <a id="addrList" href="#addrList">type addrList []net.Addr</a>

```
searchKey: net.addrList
tags: [array interface private]
```

```Go
type addrList []Addr
```

An addrList represents a list of network endpoint addresses. 

#### <a id="filterAddrList" href="#filterAddrList">func filterAddrList(filter func(IPAddr) bool, ips []IPAddr, inetaddr func(IPAddr) Addr, originalAddr string) (addrList, error)</a>

```
searchKey: net.filterAddrList
tags: [function private]
```

```Go
func filterAddrList(filter func(IPAddr) bool, ips []IPAddr, inetaddr func(IPAddr) Addr, originalAddr string) (addrList, error)
```

filterAddrList applies a filter to a list of IP addresses, yielding a list of Addr objects. Known filters are nil, ipv4only, and ipv6only. It returns every address when the filter is nil. The result contains at least one address when error is nil. 

#### <a id="addrList.first" href="#addrList.first">func (addrs addrList) first(strategy func(Addr) bool) Addr</a>

```
searchKey: net.addrList.first
tags: [method private]
```

```Go
func (addrs addrList) first(strategy func(Addr) bool) Addr
```

first returns the first address which satisfies strategy, or if none do, then the first address of any kind. 

#### <a id="addrList.forResolve" href="#addrList.forResolve">func (addrs addrList) forResolve(network, addr string) Addr</a>

```
searchKey: net.addrList.forResolve
tags: [method private]
```

```Go
func (addrs addrList) forResolve(network, addr string) Addr
```

forResolve returns the most appropriate address in address for a call to ResolveTCPAddr, ResolveUDPAddr, or ResolveIPAddr. IPv4 is preferred, unless addr contains an IPv6 literal. 

#### <a id="addrList.partition" href="#addrList.partition">func (addrs addrList) partition(strategy func(Addr) bool) (primaries, fallbacks addrList)</a>

```
searchKey: net.addrList.partition
tags: [method private]
```

```Go
func (addrs addrList) partition(strategy func(Addr) bool) (primaries, fallbacks addrList)
```

partition divides an address list into two categories, using a strategy function to assign a boolean label to each address. The first address, and any with a matching label, are returned as primaries, while addresses with the opposite label are returned as fallbacks. For non-empty inputs, primaries is guaranteed to be non-empty. 

### <a id="addrinfoErrno" href="#addrinfoErrno">type addrinfoErrno int</a>

```
searchKey: net.addrinfoErrno
tags: [number private]
```

```Go
type addrinfoErrno int
```

An addrinfoErrno represents a getaddrinfo, getnameinfo-specific error number. It's a signed number and a zero value is a non-error by convention. 

#### <a id="addrinfoErrno.Error" href="#addrinfoErrno.Error">func (eai addrinfoErrno) Error() string</a>

```
searchKey: net.addrinfoErrno.Error
tags: [method private]
```

```Go
func (eai addrinfoErrno) Error() string
```

#### <a id="addrinfoErrno.Temporary" href="#addrinfoErrno.Temporary">func (eai addrinfoErrno) Temporary() bool</a>

```
searchKey: net.addrinfoErrno.Temporary
tags: [method private]
```

```Go
func (eai addrinfoErrno) Temporary() bool
```

#### <a id="addrinfoErrno.Timeout" href="#addrinfoErrno.Timeout">func (eai addrinfoErrno) Timeout() bool</a>

```
searchKey: net.addrinfoErrno.Timeout
tags: [method private]
```

```Go
func (eai addrinfoErrno) Timeout() bool
```

### <a id="buffersWriter" href="#buffersWriter">type buffersWriter interface</a>

```
searchKey: net.buffersWriter
tags: [interface private]
```

```Go
type buffersWriter interface {
	writeBuffers(*Buffers) (int64, error)
}
```

buffersWriter is the interface implemented by Conns that support a "writev"-like batch write optimization. writeBuffers should fully consume and write all chunks from the provided Buffers, else it should report a non-nil error. 

### <a id="byMaskLength" href="#byMaskLength">type byMaskLength []net.policyTableEntry</a>

```
searchKey: net.byMaskLength
tags: [array struct private]
```

```Go
type byMaskLength []policyTableEntry
```

byMaskLength sorts policyTableEntry by the size of their Prefix.Mask.Size, from smallest mask, to largest. 

#### <a id="byMaskLength.Len" href="#byMaskLength.Len">func (s byMaskLength) Len() int</a>

```
searchKey: net.byMaskLength.Len
tags: [method private]
```

```Go
func (s byMaskLength) Len() int
```

#### <a id="byMaskLength.Less" href="#byMaskLength.Less">func (s byMaskLength) Less(i, j int) bool</a>

```
searchKey: net.byMaskLength.Less
tags: [method private]
```

```Go
func (s byMaskLength) Less(i, j int) bool
```

#### <a id="byMaskLength.Swap" href="#byMaskLength.Swap">func (s byMaskLength) Swap(i, j int)</a>

```
searchKey: net.byMaskLength.Swap
tags: [method private]
```

```Go
func (s byMaskLength) Swap(i, j int)
```

### <a id="byPref" href="#byPref">type byPref []*net.MX</a>

```
searchKey: net.byPref
tags: [array struct private]
```

```Go
type byPref []*MX
```

byPref implements sort.Interface to sort MX records by preference 

#### <a id="byPref.Len" href="#byPref.Len">func (s byPref) Len() int</a>

```
searchKey: net.byPref.Len
tags: [method private]
```

```Go
func (s byPref) Len() int
```

#### <a id="byPref.Less" href="#byPref.Less">func (s byPref) Less(i, j int) bool</a>

```
searchKey: net.byPref.Less
tags: [method private]
```

```Go
func (s byPref) Less(i, j int) bool
```

#### <a id="byPref.Swap" href="#byPref.Swap">func (s byPref) Swap(i, j int)</a>

```
searchKey: net.byPref.Swap
tags: [method private]
```

```Go
func (s byPref) Swap(i, j int)
```

#### <a id="byPref.sort" href="#byPref.sort">func (s byPref) sort()</a>

```
searchKey: net.byPref.sort
tags: [method private]
```

```Go
func (s byPref) sort()
```

sort reorders MX records as specified in RFC 5321. 

### <a id="byPriorityWeight" href="#byPriorityWeight">type byPriorityWeight []*net.SRV</a>

```
searchKey: net.byPriorityWeight
tags: [array struct private]
```

```Go
type byPriorityWeight []*SRV
```

byPriorityWeight sorts SRV records by ascending priority and weight. 

#### <a id="byPriorityWeight.Len" href="#byPriorityWeight.Len">func (s byPriorityWeight) Len() int</a>

```
searchKey: net.byPriorityWeight.Len
tags: [method private]
```

```Go
func (s byPriorityWeight) Len() int
```

#### <a id="byPriorityWeight.Less" href="#byPriorityWeight.Less">func (s byPriorityWeight) Less(i, j int) bool</a>

```
searchKey: net.byPriorityWeight.Less
tags: [method private]
```

```Go
func (s byPriorityWeight) Less(i, j int) bool
```

#### <a id="byPriorityWeight.Swap" href="#byPriorityWeight.Swap">func (s byPriorityWeight) Swap(i, j int)</a>

```
searchKey: net.byPriorityWeight.Swap
tags: [method private]
```

```Go
func (s byPriorityWeight) Swap(i, j int)
```

#### <a id="byPriorityWeight.shuffleByWeight" href="#byPriorityWeight.shuffleByWeight">func (addrs byPriorityWeight) shuffleByWeight()</a>

```
searchKey: net.byPriorityWeight.shuffleByWeight
tags: [method private]
```

```Go
func (addrs byPriorityWeight) shuffleByWeight()
```

shuffleByWeight shuffles SRV records by weight using the algorithm described in RFC 2782. 

#### <a id="byPriorityWeight.sort" href="#byPriorityWeight.sort">func (addrs byPriorityWeight) sort()</a>

```
searchKey: net.byPriorityWeight.sort
tags: [method private]
```

```Go
func (addrs byPriorityWeight) sort()
```

sort reorders SRV records as specified in RFC 2782. 

### <a id="byRFC6724" href="#byRFC6724">type byRFC6724 struct</a>

```
searchKey: net.byRFC6724
tags: [struct private]
```

```Go
type byRFC6724 struct {
	addrs    []IPAddr // addrs to sort
	addrAttr []ipAttr
	srcs     []IP // or nil if unreachable
	srcAttr  []ipAttr
}
```

#### <a id="byRFC6724.Len" href="#byRFC6724.Len">func (s *byRFC6724) Len() int</a>

```
searchKey: net.byRFC6724.Len
tags: [method private]
```

```Go
func (s *byRFC6724) Len() int
```

#### <a id="byRFC6724.Less" href="#byRFC6724.Less">func (s *byRFC6724) Less(i, j int) bool</a>

```
searchKey: net.byRFC6724.Less
tags: [method private]
```

```Go
func (s *byRFC6724) Less(i, j int) bool
```

Less reports whether i is a better destination address for this host than j. 

The algorithm and variable names comes from RFC 6724 section 6. 

#### <a id="byRFC6724.Swap" href="#byRFC6724.Swap">func (s *byRFC6724) Swap(i, j int)</a>

```
searchKey: net.byRFC6724.Swap
tags: [method private]
```

```Go
func (s *byRFC6724) Swap(i, j int)
```

### <a id="conf" href="#conf">type conf struct</a>

```
searchKey: net.conf
tags: [struct private]
```

```Go
type conf struct {
	// forceCgoLookupHost forces CGO to always be used, if available.
	forceCgoLookupHost bool

	netGo  bool // go DNS resolution forced
	netCgo bool // cgo DNS resolution forced

	// machine has an /etc/mdns.allow file
	hasMDNSAllow bool

	goos          string // the runtime.GOOS, to ease testing
	dnsDebugLevel int

	nss    *nssConf
	resolv *dnsConfig
}
```

conf represents a system's network configuration. 

#### <a id="systemConf" href="#systemConf">func systemConf() *conf</a>

```
searchKey: net.systemConf
tags: [function private]
```

```Go
func systemConf() *conf
```

systemConf returns the machine's network configuration. 

#### <a id="conf.canUseCgo" href="#conf.canUseCgo">func (c *conf) canUseCgo() bool</a>

```
searchKey: net.conf.canUseCgo
tags: [method private]
```

```Go
func (c *conf) canUseCgo() bool
```

canUseCgo reports whether calling cgo functions is allowed for non-hostname lookups. 

#### <a id="conf.hostLookupOrder" href="#conf.hostLookupOrder">func (c *conf) hostLookupOrder(r *Resolver, hostname string) (ret hostLookupOrder)</a>

```
searchKey: net.conf.hostLookupOrder
tags: [method private]
```

```Go
func (c *conf) hostLookupOrder(r *Resolver, hostname string) (ret hostLookupOrder)
```

hostLookupOrder determines which strategy to use to resolve hostname. The provided Resolver is optional. nil means to not consider its options. 

### <a id="conn" href="#conn">type conn struct</a>

```
searchKey: net.conn
tags: [struct private]
```

```Go
type conn struct {
	fd *netFD
}
```

#### <a id="conn.Close" href="#conn.Close">func (c *conn) Close() error</a>

```
searchKey: net.conn.Close
tags: [method private]
```

```Go
func (c *conn) Close() error
```

Close closes the connection. 

#### <a id="conn.File" href="#conn.File">func (c *conn) File() (f *os.File, err error)</a>

```
searchKey: net.conn.File
tags: [method private]
```

```Go
func (c *conn) File() (f *os.File, err error)
```

File returns a copy of the underlying os.File. It is the caller's responsibility to close f when finished. Closing c does not affect f, and closing f does not affect c. 

The returned os.File's file descriptor is different from the connection's. Attempting to change properties of the original using this duplicate may or may not have the desired effect. 

#### <a id="conn.LocalAddr" href="#conn.LocalAddr">func (c *conn) LocalAddr() Addr</a>

```
searchKey: net.conn.LocalAddr
tags: [method private]
```

```Go
func (c *conn) LocalAddr() Addr
```

LocalAddr returns the local network address. The Addr returned is shared by all invocations of LocalAddr, so do not modify it. 

#### <a id="conn.Read" href="#conn.Read">func (c *conn) Read(b []byte) (int, error)</a>

```
searchKey: net.conn.Read
tags: [method private]
```

```Go
func (c *conn) Read(b []byte) (int, error)
```

Read implements the Conn Read method. 

#### <a id="conn.RemoteAddr" href="#conn.RemoteAddr">func (c *conn) RemoteAddr() Addr</a>

```
searchKey: net.conn.RemoteAddr
tags: [method private]
```

```Go
func (c *conn) RemoteAddr() Addr
```

RemoteAddr returns the remote network address. The Addr returned is shared by all invocations of RemoteAddr, so do not modify it. 

#### <a id="conn.SetDeadline" href="#conn.SetDeadline">func (c *conn) SetDeadline(t time.Time) error</a>

```
searchKey: net.conn.SetDeadline
tags: [method private]
```

```Go
func (c *conn) SetDeadline(t time.Time) error
```

SetDeadline implements the Conn SetDeadline method. 

#### <a id="conn.SetReadBuffer" href="#conn.SetReadBuffer">func (c *conn) SetReadBuffer(bytes int) error</a>

```
searchKey: net.conn.SetReadBuffer
tags: [method private]
```

```Go
func (c *conn) SetReadBuffer(bytes int) error
```

SetReadBuffer sets the size of the operating system's receive buffer associated with the connection. 

#### <a id="conn.SetReadDeadline" href="#conn.SetReadDeadline">func (c *conn) SetReadDeadline(t time.Time) error</a>

```
searchKey: net.conn.SetReadDeadline
tags: [method private]
```

```Go
func (c *conn) SetReadDeadline(t time.Time) error
```

SetReadDeadline implements the Conn SetReadDeadline method. 

#### <a id="conn.SetWriteBuffer" href="#conn.SetWriteBuffer">func (c *conn) SetWriteBuffer(bytes int) error</a>

```
searchKey: net.conn.SetWriteBuffer
tags: [method private]
```

```Go
func (c *conn) SetWriteBuffer(bytes int) error
```

SetWriteBuffer sets the size of the operating system's transmit buffer associated with the connection. 

#### <a id="conn.SetWriteDeadline" href="#conn.SetWriteDeadline">func (c *conn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: net.conn.SetWriteDeadline
tags: [method private]
```

```Go
func (c *conn) SetWriteDeadline(t time.Time) error
```

SetWriteDeadline implements the Conn SetWriteDeadline method. 

#### <a id="conn.Write" href="#conn.Write">func (c *conn) Write(b []byte) (int, error)</a>

```
searchKey: net.conn.Write
tags: [method private]
```

```Go
func (c *conn) Write(b []byte) (int, error)
```

Write implements the Conn Write method. 

#### <a id="conn.ok" href="#conn.ok">func (c *conn) ok() bool</a>

```
searchKey: net.conn.ok
tags: [method private]
```

```Go
func (c *conn) ok() bool
```

#### <a id="conn.writeBuffers" href="#conn.writeBuffers">func (c *conn) writeBuffers(v *Buffers) (int64, error)</a>

```
searchKey: net.conn.writeBuffers
tags: [method private]
```

```Go
func (c *conn) writeBuffers(v *Buffers) (int64, error)
```

### <a id="contextWithNonZeroDeadline" href="#contextWithNonZeroDeadline">type contextWithNonZeroDeadline struct</a>

```
searchKey: net.contextWithNonZeroDeadline
tags: [struct private]
```

```Go
type contextWithNonZeroDeadline struct {
	context.Context
}
```

#### <a id="contextWithNonZeroDeadline.Deadline" href="#contextWithNonZeroDeadline.Deadline">func (contextWithNonZeroDeadline) Deadline() (time.Time, bool)</a>

```
searchKey: net.contextWithNonZeroDeadline.Deadline
tags: [method private]
```

```Go
func (contextWithNonZeroDeadline) Deadline() (time.Time, bool)
```

### <a id="dnsConfig" href="#dnsConfig">type dnsConfig struct</a>

```
searchKey: net.dnsConfig
tags: [struct private]
```

```Go
type dnsConfig struct {
	servers       []string      // server addresses (in host:port form) to use
	search        []string      // rooted suffixes to append to local name
	ndots         int           // number of dots in name to trigger absolute lookup
	timeout       time.Duration // wait before giving up on a query, including retries
	attempts      int           // lost packets before giving up on server
	rotate        bool          // round robin among servers
	unknownOpt    bool          // anything unknown was encountered
	lookup        []string      // OpenBSD top-level database "lookup" order
	err           error         // any error that occurs during open of resolv.conf
	mtime         time.Time     // time of resolv.conf modification
	soffset       uint32        // used by serverOffset
	singleRequest bool          // use sequential A and AAAA queries instead of parallel queries
	useTCP        bool          // force usage of TCP for DNS resolutions
}
```

#### <a id="dnsReadConfig" href="#dnsReadConfig">func dnsReadConfig(filename string) *dnsConfig</a>

```
searchKey: net.dnsReadConfig
tags: [function private]
```

```Go
func dnsReadConfig(filename string) *dnsConfig
```

See resolv.conf(5) on a Linux machine. 

#### <a id="dnsConfig.nameList" href="#dnsConfig.nameList">func (conf *dnsConfig) nameList(name string) []string</a>

```
searchKey: net.dnsConfig.nameList
tags: [method private]
```

```Go
func (conf *dnsConfig) nameList(name string) []string
```

nameList returns a list of names for sequential DNS queries. 

#### <a id="dnsConfig.serverOffset" href="#dnsConfig.serverOffset">func (c *dnsConfig) serverOffset() uint32</a>

```
searchKey: net.dnsConfig.serverOffset
tags: [method private]
```

```Go
func (c *dnsConfig) serverOffset() uint32
```

serverOffset returns an offset that can be used to determine indices of servers in c.servers when making queries. When the rotate option is enabled, this offset increases. Otherwise it is always 0. 

### <a id="dnsNameTest" href="#dnsNameTest">type dnsNameTest struct</a>

```
searchKey: net.dnsNameTest
tags: [struct private]
```

```Go
type dnsNameTest struct {
	name   string
	result bool
}
```

### <a id="dualStackServer" href="#dualStackServer">type dualStackServer struct</a>

```
searchKey: net.dualStackServer
tags: [struct private]
```

```Go
type dualStackServer struct {
	lnmu sync.RWMutex
	lns  []streamListener
	port string

	cmu sync.RWMutex
	cs  []Conn // established connections at the passive open side
}
```

#### <a id="newDualStackServer" href="#newDualStackServer">func newDualStackServer() (*dualStackServer, error)</a>

```
searchKey: net.newDualStackServer
tags: [function private]
```

```Go
func newDualStackServer() (*dualStackServer, error)
```

#### <a id="dualStackServer.buildup" href="#dualStackServer.buildup">func (dss *dualStackServer) buildup(handler func(*dualStackServer, Listener)) error</a>

```
searchKey: net.dualStackServer.buildup
tags: [method private]
```

```Go
func (dss *dualStackServer) buildup(handler func(*dualStackServer, Listener)) error
```

#### <a id="dualStackServer.teardown" href="#dualStackServer.teardown">func (dss *dualStackServer) teardown() error</a>

```
searchKey: net.dualStackServer.teardown
tags: [method private]
```

```Go
func (dss *dualStackServer) teardown() error
```

#### <a id="dualStackServer.teardownNetwork" href="#dualStackServer.teardownNetwork">func (dss *dualStackServer) teardownNetwork(network string) error</a>

```
searchKey: net.dualStackServer.teardownNetwork
tags: [method private]
```

```Go
func (dss *dualStackServer) teardownNetwork(network string) error
```

### <a id="fakeDNSConn" href="#fakeDNSConn">type fakeDNSConn struct</a>

```
searchKey: net.fakeDNSConn
tags: [struct private]
```

```Go
type fakeDNSConn struct {
	Conn
	tcp    bool
	server *fakeDNSServer
	n      string
	s      string
	q      dnsmessage.Message
	t      time.Time
	buf    []byte
}
```

#### <a id="fakeDNSConn.Close" href="#fakeDNSConn.Close">func (f *fakeDNSConn) Close() error</a>

```
searchKey: net.fakeDNSConn.Close
tags: [method private]
```

```Go
func (f *fakeDNSConn) Close() error
```

#### <a id="fakeDNSConn.Read" href="#fakeDNSConn.Read">func (f *fakeDNSConn) Read(b []byte) (int, error)</a>

```
searchKey: net.fakeDNSConn.Read
tags: [method private]
```

```Go
func (f *fakeDNSConn) Read(b []byte) (int, error)
```

#### <a id="fakeDNSConn.SetDeadline" href="#fakeDNSConn.SetDeadline">func (f *fakeDNSConn) SetDeadline(t time.Time) error</a>

```
searchKey: net.fakeDNSConn.SetDeadline
tags: [method private]
```

```Go
func (f *fakeDNSConn) SetDeadline(t time.Time) error
```

#### <a id="fakeDNSConn.Write" href="#fakeDNSConn.Write">func (f *fakeDNSConn) Write(b []byte) (int, error)</a>

```
searchKey: net.fakeDNSConn.Write
tags: [method private]
```

```Go
func (f *fakeDNSConn) Write(b []byte) (int, error)
```

### <a id="fakeDNSPacketConn" href="#fakeDNSPacketConn">type fakeDNSPacketConn struct</a>

```
searchKey: net.fakeDNSPacketConn
tags: [struct private]
```

```Go
type fakeDNSPacketConn struct {
	PacketConn
	fakeDNSConn
}
```

#### <a id="fakeDNSPacketConn.Close" href="#fakeDNSPacketConn.Close">func (f *fakeDNSPacketConn) Close() error</a>

```
searchKey: net.fakeDNSPacketConn.Close
tags: [method private]
```

```Go
func (f *fakeDNSPacketConn) Close() error
```

#### <a id="fakeDNSPacketConn.SetDeadline" href="#fakeDNSPacketConn.SetDeadline">func (f *fakeDNSPacketConn) SetDeadline(t time.Time) error</a>

```
searchKey: net.fakeDNSPacketConn.SetDeadline
tags: [method private]
```

```Go
func (f *fakeDNSPacketConn) SetDeadline(t time.Time) error
```

### <a id="fakeDNSServer" href="#fakeDNSServer">type fakeDNSServer struct</a>

```
searchKey: net.fakeDNSServer
tags: [struct private]
```

```Go
type fakeDNSServer struct {
	rh        func(n, s string, q dnsmessage.Message, t time.Time) (dnsmessage.Message, error)
	alwaysTCP bool
}
```

#### <a id="fakeDNSServer.DialContext" href="#fakeDNSServer.DialContext">func (server *fakeDNSServer) DialContext(_ context.Context, n, s string) (Conn, error)</a>

```
searchKey: net.fakeDNSServer.DialContext
tags: [method private]
```

```Go
func (server *fakeDNSServer) DialContext(_ context.Context, n, s string) (Conn, error)
```

### <a id="file" href="#file">type file struct</a>

```
searchKey: net.file
tags: [struct private]
```

```Go
type file struct {
	file  *os.File
	data  []byte
	atEOF bool
}
```

#### <a id="open" href="#open">func open(name string) (*file, error)</a>

```
searchKey: net.open
tags: [function private]
```

```Go
func open(name string) (*file, error)
```

#### <a id="file.close" href="#file.close">func (f *file) close()</a>

```
searchKey: net.file.close
tags: [method private]
```

```Go
func (f *file) close()
```

#### <a id="file.getLineFromData" href="#file.getLineFromData">func (f *file) getLineFromData() (s string, ok bool)</a>

```
searchKey: net.file.getLineFromData
tags: [method private]
```

```Go
func (f *file) getLineFromData() (s string, ok bool)
```

#### <a id="file.readLine" href="#file.readLine">func (f *file) readLine() (s string, ok bool)</a>

```
searchKey: net.file.readLine
tags: [method private]
```

```Go
func (f *file) readLine() (s string, ok bool)
```

### <a id="fileAddr" href="#fileAddr">type fileAddr string</a>

```
searchKey: net.fileAddr
tags: [string private]
```

```Go
type fileAddr string
```

#### <a id="fileAddr.Network" href="#fileAddr.Network">func (fileAddr) Network() string</a>

```
searchKey: net.fileAddr.Network
tags: [method private]
```

```Go
func (fileAddr) Network() string
```

#### <a id="fileAddr.String" href="#fileAddr.String">func (f fileAddr) String() string</a>

```
searchKey: net.fileAddr.String
tags: [method private]
```

```Go
func (f fileAddr) String() string
```

### <a id="hostLookupOrder" href="#hostLookupOrder">type hostLookupOrder int</a>

```
searchKey: net.hostLookupOrder
tags: [number private]
```

```Go
type hostLookupOrder int
```

hostLookupOrder specifies the order of LookupHost lookup strategies. It is basically a simplified representation of nsswitch.conf. "files" means /etc/hosts. 

#### <a id="hostLookupOrder.String" href="#hostLookupOrder.String">func (o hostLookupOrder) String() string</a>

```
searchKey: net.hostLookupOrder.String
tags: [method private]
```

```Go
func (o hostLookupOrder) String() string
```

### <a id="ifStats" href="#ifStats">type ifStats struct</a>

```
searchKey: net.ifStats
tags: [struct private]
```

```Go
type ifStats struct {
	loop  int // # of active loopback interfaces
	other int // # of active other interfaces
}
```

#### <a id="interfaceStats" href="#interfaceStats">func interfaceStats(ift []Interface) *ifStats</a>

```
searchKey: net.interfaceStats
tags: [function private]
```

```Go
func interfaceStats(ift []Interface) *ifStats
```

### <a id="ipAttr" href="#ipAttr">type ipAttr struct</a>

```
searchKey: net.ipAttr
tags: [struct private]
```

```Go
type ipAttr struct {
	Scope      scope
	Precedence uint8
	Label      uint8
}
```

#### <a id="ipAttrOf" href="#ipAttrOf">func ipAttrOf(ip IP) ipAttr</a>

```
searchKey: net.ipAttrOf
tags: [function private]
```

```Go
func ipAttrOf(ip IP) ipAttr
```

### <a id="ipLookupResult" href="#ipLookupResult">type ipLookupResult struct</a>

```
searchKey: net.ipLookupResult
tags: [struct private]
```

```Go
type ipLookupResult struct {
	addrs []IPAddr
	cname string
	err   error
}
```

### <a id="ipStackCapabilities" href="#ipStackCapabilities">type ipStackCapabilities struct</a>

```
searchKey: net.ipStackCapabilities
tags: [struct private]
```

```Go
type ipStackCapabilities struct {
	sync.Once             // guards following
	ipv4Enabled           bool
	ipv6Enabled           bool
	ipv4MappedIPv6Enabled bool
}
```

#### <a id="ipStackCapabilities.probe" href="#ipStackCapabilities.probe">func (p *ipStackCapabilities) probe()</a>

```
searchKey: net.ipStackCapabilities.probe
tags: [method private]
```

```Go
func (p *ipStackCapabilities) probe()
```

probe probes IPv4, IPv6 and IPv4-mapped IPv6 communication capabilities which are controlled by the IPV6_V6ONLY socket option and kernel configuration. 

Should we try to use the IPv4 socket interface if we're only dealing with IPv4 sockets? As long as the host system understands IPv4-mapped IPv6, it's okay to pass IPv4-mapped IPv6 addresses to the IPv6 interface. That simplifies our code and is most general. Unfortunately, we need to run on kernels built without IPv6 support too. So probe the kernel to figure it out. 

### <a id="ipv6LinkLocalUnicastTest" href="#ipv6LinkLocalUnicastTest">type ipv6LinkLocalUnicastTest struct</a>

```
searchKey: net.ipv6LinkLocalUnicastTest
tags: [struct private]
```

```Go
type ipv6LinkLocalUnicastTest struct {
	network, address string
	nameLookup       bool
}
```

### <a id="ipv6ZoneCache" href="#ipv6ZoneCache">type ipv6ZoneCache struct</a>

```
searchKey: net.ipv6ZoneCache
tags: [struct private]
```

```Go
type ipv6ZoneCache struct {
	sync.RWMutex                // guard the following
	lastFetched  time.Time      // last time routing information was fetched
	toIndex      map[string]int // interface name to its index
	toName       map[int]string // interface index to its name
}
```

An ipv6ZoneCache represents a cache holding partial network interface information. It is used for reducing the cost of IPv6 addressing scope zone resolution. 

Multiple names sharing the index are managed by first-come first-served basis for consistency. 

#### <a id="ipv6ZoneCache.index" href="#ipv6ZoneCache.index">func (zc *ipv6ZoneCache) index(name string) int</a>

```
searchKey: net.ipv6ZoneCache.index
tags: [method private]
```

```Go
func (zc *ipv6ZoneCache) index(name string) int
```

#### <a id="ipv6ZoneCache.name" href="#ipv6ZoneCache.name">func (zc *ipv6ZoneCache) name(index int) string</a>

```
searchKey: net.ipv6ZoneCache.name
tags: [method private]
```

```Go
func (zc *ipv6ZoneCache) name(index int) string
```

#### <a id="ipv6ZoneCache.update" href="#ipv6ZoneCache.update">func (zc *ipv6ZoneCache) update(ift []Interface, force bool) (updated bool)</a>

```
searchKey: net.ipv6ZoneCache.update
tags: [method private]
```

```Go
func (zc *ipv6ZoneCache) update(ift []Interface, force bool) (updated bool)
```

update refreshes the network interface information if the cache was last updated more than 1 minute ago, or if force is set. It reports whether the cache was updated. 

### <a id="localPacketServer" href="#localPacketServer">type localPacketServer struct</a>

```
searchKey: net.localPacketServer
tags: [struct private]
```

```Go
type localPacketServer struct {
	pcmu sync.RWMutex
	PacketConn
	done chan bool // signal that indicates server stopped
}
```

#### <a id="newLocalPacketServer" href="#newLocalPacketServer">func newLocalPacketServer(network string) (*localPacketServer, error)</a>

```
searchKey: net.newLocalPacketServer
tags: [function private]
```

```Go
func newLocalPacketServer(network string) (*localPacketServer, error)
```

#### <a id="localPacketServer.buildup" href="#localPacketServer.buildup">func (ls *localPacketServer) buildup(handler func(*localPacketServer, PacketConn)) error</a>

```
searchKey: net.localPacketServer.buildup
tags: [method private]
```

```Go
func (ls *localPacketServer) buildup(handler func(*localPacketServer, PacketConn)) error
```

#### <a id="localPacketServer.teardown" href="#localPacketServer.teardown">func (ls *localPacketServer) teardown() error</a>

```
searchKey: net.localPacketServer.teardown
tags: [method private]
```

```Go
func (ls *localPacketServer) teardown() error
```

### <a id="localServer" href="#localServer">type localServer struct</a>

```
searchKey: net.localServer
tags: [struct private]
```

```Go
type localServer struct {
	lnmu sync.RWMutex
	Listener
	done chan bool // signal that indicates server stopped
	cl   []Conn    // accepted connection list
}
```

#### <a id="newLocalServer" href="#newLocalServer">func newLocalServer(network string) (*localServer, error)</a>

```
searchKey: net.newLocalServer
tags: [function private]
```

```Go
func newLocalServer(network string) (*localServer, error)
```

#### <a id="localServer.buildup" href="#localServer.buildup">func (ls *localServer) buildup(handler func(*localServer, Listener)) error</a>

```
searchKey: net.localServer.buildup
tags: [method private]
```

```Go
func (ls *localServer) buildup(handler func(*localServer, Listener)) error
```

#### <a id="localServer.teardown" href="#localServer.teardown">func (ls *localServer) teardown() error</a>

```
searchKey: net.localServer.teardown
tags: [method private]
```

```Go
func (ls *localServer) teardown() error
```

#### <a id="localServer.transponder" href="#localServer.transponder">func (ls *localServer) transponder(ln Listener, ch chan<- error)</a>

```
searchKey: net.localServer.transponder
tags: [method private]
```

```Go
func (ls *localServer) transponder(ln Listener, ch chan<- error)
```

### <a id="lookupCustomResolver" href="#lookupCustomResolver">type lookupCustomResolver struct</a>

```
searchKey: net.lookupCustomResolver
tags: [struct private]
```

```Go
type lookupCustomResolver struct {
	*Resolver
	mu     sync.RWMutex
	dialed bool
}
```

#### <a id="lookupCustomResolver.dial" href="#lookupCustomResolver.dial">func (lcr *lookupCustomResolver) dial() func(ctx context.Context, network, address string) (Conn, error)</a>

```
searchKey: net.lookupCustomResolver.dial
tags: [method private]
```

```Go
func (lcr *lookupCustomResolver) dial() func(ctx context.Context, network, address string) (Conn, error)
```

### <a id="netFD" href="#netFD">type netFD struct</a>

```
searchKey: net.netFD
tags: [struct private]
```

```Go
type netFD struct {
	pfd poll.FD

	// immutable until Close
	family      int
	sotype      int
	isConnected bool // handshake completed or use of association with peer
	net         string
	laddr       Addr
	raddr       Addr
}
```

Network file descriptor. 

#### <a id="internetSocket" href="#internetSocket">func internetSocket(ctx context.Context, net string, laddr, raddr sockaddr, sotype, proto int, mode string, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)</a>

```
searchKey: net.internetSocket
tags: [function private]
```

```Go
func internetSocket(ctx context.Context, net string, laddr, raddr sockaddr, sotype, proto int, mode string, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)
```

#### <a id="newFD" href="#newFD">func newFD(sysfd, family, sotype int, net string) (*netFD, error)</a>

```
searchKey: net.newFD
tags: [function private]
```

```Go
func newFD(sysfd, family, sotype int, net string) (*netFD, error)
```

#### <a id="newFileFD" href="#newFileFD">func newFileFD(f *os.File) (*netFD, error)</a>

```
searchKey: net.newFileFD
tags: [function private]
```

```Go
func newFileFD(f *os.File) (*netFD, error)
```

#### <a id="socket" href="#socket">func socket(ctx context.Context, net string, family, sotype, proto int, ipv6only bool, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)</a>

```
searchKey: net.socket
tags: [function private]
```

```Go
func socket(ctx context.Context, net string, family, sotype, proto int, ipv6only bool, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)
```

socket returns a network file descriptor that is ready for asynchronous I/O using the network poller. 

#### <a id="unixSocket" href="#unixSocket">func unixSocket(ctx context.Context, net string, laddr, raddr sockaddr, mode string, ctrlFn func(string, string, syscall.RawConn) error) (*netFD, error)</a>

```
searchKey: net.unixSocket
tags: [function private]
```

```Go
func unixSocket(ctx context.Context, net string, laddr, raddr sockaddr, mode string, ctrlFn func(string, string, syscall.RawConn) error) (*netFD, error)
```

#### <a id="netFD.Close" href="#netFD.Close">func (fd *netFD) Close() error</a>

```
searchKey: net.netFD.Close
tags: [method private]
```

```Go
func (fd *netFD) Close() error
```

#### <a id="netFD.Read" href="#netFD.Read">func (fd *netFD) Read(p []byte) (n int, err error)</a>

```
searchKey: net.netFD.Read
tags: [method private]
```

```Go
func (fd *netFD) Read(p []byte) (n int, err error)
```

#### <a id="netFD.SetDeadline" href="#netFD.SetDeadline">func (fd *netFD) SetDeadline(t time.Time) error</a>

```
searchKey: net.netFD.SetDeadline
tags: [method private]
```

```Go
func (fd *netFD) SetDeadline(t time.Time) error
```

#### <a id="netFD.SetReadDeadline" href="#netFD.SetReadDeadline">func (fd *netFD) SetReadDeadline(t time.Time) error</a>

```
searchKey: net.netFD.SetReadDeadline
tags: [method private]
```

```Go
func (fd *netFD) SetReadDeadline(t time.Time) error
```

#### <a id="netFD.SetWriteDeadline" href="#netFD.SetWriteDeadline">func (fd *netFD) SetWriteDeadline(t time.Time) error</a>

```
searchKey: net.netFD.SetWriteDeadline
tags: [method private]
```

```Go
func (fd *netFD) SetWriteDeadline(t time.Time) error
```

#### <a id="netFD.Write" href="#netFD.Write">func (fd *netFD) Write(p []byte) (nn int, err error)</a>

```
searchKey: net.netFD.Write
tags: [method private]
```

```Go
func (fd *netFD) Write(p []byte) (nn int, err error)
```

#### <a id="netFD.accept" href="#netFD.accept">func (fd *netFD) accept() (netfd *netFD, err error)</a>

```
searchKey: net.netFD.accept
tags: [method private]
```

```Go
func (fd *netFD) accept() (netfd *netFD, err error)
```

#### <a id="netFD.addrFunc" href="#netFD.addrFunc">func (fd *netFD) addrFunc() func(syscall.Sockaddr) Addr</a>

```
searchKey: net.netFD.addrFunc
tags: [method private]
```

```Go
func (fd *netFD) addrFunc() func(syscall.Sockaddr) Addr
```

#### <a id="netFD.closeRead" href="#netFD.closeRead">func (fd *netFD) closeRead() error</a>

```
searchKey: net.netFD.closeRead
tags: [method private]
```

```Go
func (fd *netFD) closeRead() error
```

#### <a id="netFD.closeWrite" href="#netFD.closeWrite">func (fd *netFD) closeWrite() error</a>

```
searchKey: net.netFD.closeWrite
tags: [method private]
```

```Go
func (fd *netFD) closeWrite() error
```

#### <a id="netFD.connect" href="#netFD.connect">func (fd *netFD) connect(ctx context.Context, la, ra syscall.Sockaddr) (rsa syscall.Sockaddr, ret error)</a>

```
searchKey: net.netFD.connect
tags: [method private]
```

```Go
func (fd *netFD) connect(ctx context.Context, la, ra syscall.Sockaddr) (rsa syscall.Sockaddr, ret error)
```

#### <a id="netFD.ctrlNetwork" href="#netFD.ctrlNetwork">func (fd *netFD) ctrlNetwork() string</a>

```
searchKey: net.netFD.ctrlNetwork
tags: [method private]
```

```Go
func (fd *netFD) ctrlNetwork() string
```

#### <a id="netFD.dial" href="#netFD.dial">func (fd *netFD) dial(ctx context.Context, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error</a>

```
searchKey: net.netFD.dial
tags: [method private]
```

```Go
func (fd *netFD) dial(ctx context.Context, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error
```

#### <a id="netFD.dup" href="#netFD.dup">func (fd *netFD) dup() (f *os.File, err error)</a>

```
searchKey: net.netFD.dup
tags: [method private]
```

```Go
func (fd *netFD) dup() (f *os.File, err error)
```

#### <a id="netFD.init.fd_unix.go" href="#netFD.init.fd_unix.go">func (fd *netFD) init() error</a>

```
searchKey: net.netFD.init
tags: [method private]
```

```Go
func (fd *netFD) init() error
```

#### <a id="netFD.listenDatagram" href="#netFD.listenDatagram">func (fd *netFD) listenDatagram(laddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error</a>

```
searchKey: net.netFD.listenDatagram
tags: [method private]
```

```Go
func (fd *netFD) listenDatagram(laddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error
```

#### <a id="netFD.listenStream" href="#netFD.listenStream">func (fd *netFD) listenStream(laddr sockaddr, backlog int, ctrlFn func(string, string, syscall.RawConn) error) error</a>

```
searchKey: net.netFD.listenStream
tags: [method private]
```

```Go
func (fd *netFD) listenStream(laddr sockaddr, backlog int, ctrlFn func(string, string, syscall.RawConn) error) error
```

#### <a id="netFD.name" href="#netFD.name">func (fd *netFD) name() string</a>

```
searchKey: net.netFD.name
tags: [method private]
```

```Go
func (fd *netFD) name() string
```

#### <a id="netFD.readFrom" href="#netFD.readFrom">func (fd *netFD) readFrom(p []byte) (n int, sa syscall.Sockaddr, err error)</a>

```
searchKey: net.netFD.readFrom
tags: [method private]
```

```Go
func (fd *netFD) readFrom(p []byte) (n int, sa syscall.Sockaddr, err error)
```

#### <a id="netFD.readMsg" href="#netFD.readMsg">func (fd *netFD) readMsg(p []byte, oob []byte, flags int) (n, oobn, retflags int, sa syscall.Sockaddr, err error)</a>

```
searchKey: net.netFD.readMsg
tags: [method private]
```

```Go
func (fd *netFD) readMsg(p []byte, oob []byte, flags int) (n, oobn, retflags int, sa syscall.Sockaddr, err error)
```

#### <a id="netFD.setAddr" href="#netFD.setAddr">func (fd *netFD) setAddr(laddr, raddr Addr)</a>

```
searchKey: net.netFD.setAddr
tags: [method private]
```

```Go
func (fd *netFD) setAddr(laddr, raddr Addr)
```

#### <a id="netFD.shutdown" href="#netFD.shutdown">func (fd *netFD) shutdown(how int) error</a>

```
searchKey: net.netFD.shutdown
tags: [method private]
```

```Go
func (fd *netFD) shutdown(how int) error
```

#### <a id="netFD.writeBuffers" href="#netFD.writeBuffers">func (fd *netFD) writeBuffers(v *Buffers) (n int64, err error)</a>

```
searchKey: net.netFD.writeBuffers
tags: [method private]
```

```Go
func (fd *netFD) writeBuffers(v *Buffers) (n int64, err error)
```

#### <a id="netFD.writeMsg" href="#netFD.writeMsg">func (fd *netFD) writeMsg(p []byte, oob []byte, sa syscall.Sockaddr) (n int, oobn int, err error)</a>

```
searchKey: net.netFD.writeMsg
tags: [method private]
```

```Go
func (fd *netFD) writeMsg(p []byte, oob []byte, sa syscall.Sockaddr) (n int, oobn int, err error)
```

#### <a id="netFD.writeTo" href="#netFD.writeTo">func (fd *netFD) writeTo(p []byte, sa syscall.Sockaddr) (n int, err error)</a>

```
searchKey: net.netFD.writeTo
tags: [method private]
```

```Go
func (fd *netFD) writeTo(p []byte, sa syscall.Sockaddr) (n int, err error)
```

### <a id="neverEnding" href="#neverEnding">type neverEnding byte</a>

```
searchKey: net.neverEnding
tags: [number private]
```

```Go
type neverEnding byte
```

#### <a id="neverEnding.Read" href="#neverEnding.Read">func (b neverEnding) Read(p []byte) (int, error)</a>

```
searchKey: net.neverEnding.Read
tags: [method private]
```

```Go
func (b neverEnding) Read(p []byte) (int, error)
```

### <a id="nssConf" href="#nssConf">type nssConf struct</a>

```
searchKey: net.nssConf
tags: [struct private]
```

```Go
type nssConf struct {
	err     error                  // any error encountered opening or parsing the file
	sources map[string][]nssSource // keyed by database (e.g. "hosts")
}
```

nssConf represents the state of the machine's /etc/nsswitch.conf file. 

#### <a id="nssStr" href="#nssStr">func nssStr(s string) *nssConf</a>

```
searchKey: net.nssStr
tags: [function private]
```

```Go
func nssStr(s string) *nssConf
```

#### <a id="parseNSSConf" href="#parseNSSConf">func parseNSSConf(r io.Reader) *nssConf</a>

```
searchKey: net.parseNSSConf
tags: [function private]
```

```Go
func parseNSSConf(r io.Reader) *nssConf
```

#### <a id="parseNSSConfFile" href="#parseNSSConfFile">func parseNSSConfFile(file string) *nssConf</a>

```
searchKey: net.parseNSSConfFile
tags: [function private]
```

```Go
func parseNSSConfFile(file string) *nssConf
```

### <a id="nssCriterion" href="#nssCriterion">type nssCriterion struct</a>

```
searchKey: net.nssCriterion
tags: [struct private]
```

```Go
type nssCriterion struct {
	negate bool   // if "!" was present
	status string // e.g. "success", "unavail" (lowercase)
	action string // e.g. "return", "continue" (lowercase)
}
```

nssCriterion is the parsed structure of one of the criteria in brackets after an NSS source name. 

#### <a id="nssCriterion.standardStatusAction" href="#nssCriterion.standardStatusAction">func (c nssCriterion) standardStatusAction(last bool) bool</a>

```
searchKey: net.nssCriterion.standardStatusAction
tags: [method private]
```

```Go
func (c nssCriterion) standardStatusAction(last bool) bool
```

standardStatusAction reports whether c is equivalent to not specifying the criterion at all. last is whether this criteria is the last in the list. 

### <a id="nssHostTest" href="#nssHostTest">type nssHostTest struct</a>

```
searchKey: net.nssHostTest
tags: [struct private]
```

```Go
type nssHostTest struct {
	host      string
	localhost string
	want      hostLookupOrder
}
```

### <a id="nssSource" href="#nssSource">type nssSource struct</a>

```
searchKey: net.nssSource
tags: [struct private]
```

```Go
type nssSource struct {
	source   string // e.g. "compat", "files", "mdns4_minimal"
	criteria []nssCriterion
}
```

#### <a id="nssSource.standardCriteria" href="#nssSource.standardCriteria">func (s nssSource) standardCriteria() bool</a>

```
searchKey: net.nssSource.standardCriteria
tags: [method private]
```

```Go
func (s nssSource) standardCriteria() bool
```

standardCriteria reports all specified criteria have the default status actions. 

### <a id="onlyValuesCtx" href="#onlyValuesCtx">type onlyValuesCtx struct</a>

```
searchKey: net.onlyValuesCtx
tags: [struct private]
```

```Go
type onlyValuesCtx struct {
	context.Context
	lookupValues context.Context
}
```

onlyValuesCtx is a context that uses an underlying context for value lookup if the underlying context hasn't yet expired. 

#### <a id="onlyValuesCtx.Value" href="#onlyValuesCtx.Value">func (ovc *onlyValuesCtx) Value(key interface{}) interface{}</a>

```
searchKey: net.onlyValuesCtx.Value
tags: [method private]
```

```Go
func (ovc *onlyValuesCtx) Value(key interface{}) interface{}
```

Value performs a lookup if the original context hasn't expired. 

### <a id="packetListener" href="#packetListener">type packetListener struct</a>

```
searchKey: net.packetListener
tags: [struct private]
```

```Go
type packetListener struct {
	PacketConn
}
```

#### <a id="packetListener.newLocalServer" href="#packetListener.newLocalServer">func (pl *packetListener) newLocalServer() (*localPacketServer, error)</a>

```
searchKey: net.packetListener.newLocalServer
tags: [method private]
```

```Go
func (pl *packetListener) newLocalServer() (*localPacketServer, error)
```

### <a id="pipe" href="#pipe">type pipe struct</a>

```
searchKey: net.pipe
tags: [struct private]
```

```Go
type pipe struct {
	wrMu sync.Mutex // Serialize Write operations

	// Used by local Read to interact with remote Write.
	// Successful receive on rdRx is always followed by send on rdTx.
	rdRx <-chan []byte
	rdTx chan<- int

	// Used by local Write to interact with remote Read.
	// Successful send on wrTx is always followed by receive on wrRx.
	wrTx chan<- []byte
	wrRx <-chan int

	once       sync.Once // Protects closing localDone
	localDone  chan struct{}
	remoteDone <-chan struct{}

	readDeadline  pipeDeadline
	writeDeadline pipeDeadline
}
```

#### <a id="pipe.Close" href="#pipe.Close">func (p *pipe) Close() error</a>

```
searchKey: net.pipe.Close
tags: [method private]
```

```Go
func (p *pipe) Close() error
```

#### <a id="pipe.LocalAddr" href="#pipe.LocalAddr">func (*pipe) LocalAddr() Addr</a>

```
searchKey: net.pipe.LocalAddr
tags: [method private]
```

```Go
func (*pipe) LocalAddr() Addr
```

#### <a id="pipe.Read" href="#pipe.Read">func (p *pipe) Read(b []byte) (int, error)</a>

```
searchKey: net.pipe.Read
tags: [method private]
```

```Go
func (p *pipe) Read(b []byte) (int, error)
```

#### <a id="pipe.RemoteAddr" href="#pipe.RemoteAddr">func (*pipe) RemoteAddr() Addr</a>

```
searchKey: net.pipe.RemoteAddr
tags: [method private]
```

```Go
func (*pipe) RemoteAddr() Addr
```

#### <a id="pipe.SetDeadline" href="#pipe.SetDeadline">func (p *pipe) SetDeadline(t time.Time) error</a>

```
searchKey: net.pipe.SetDeadline
tags: [method private]
```

```Go
func (p *pipe) SetDeadline(t time.Time) error
```

#### <a id="pipe.SetReadDeadline" href="#pipe.SetReadDeadline">func (p *pipe) SetReadDeadline(t time.Time) error</a>

```
searchKey: net.pipe.SetReadDeadline
tags: [method private]
```

```Go
func (p *pipe) SetReadDeadline(t time.Time) error
```

#### <a id="pipe.SetWriteDeadline" href="#pipe.SetWriteDeadline">func (p *pipe) SetWriteDeadline(t time.Time) error</a>

```
searchKey: net.pipe.SetWriteDeadline
tags: [method private]
```

```Go
func (p *pipe) SetWriteDeadline(t time.Time) error
```

#### <a id="pipe.Write" href="#pipe.Write">func (p *pipe) Write(b []byte) (int, error)</a>

```
searchKey: net.pipe.Write
tags: [method private]
```

```Go
func (p *pipe) Write(b []byte) (int, error)
```

#### <a id="pipe.read" href="#pipe.read">func (p *pipe) read(b []byte) (n int, err error)</a>

```
searchKey: net.pipe.read
tags: [method private]
```

```Go
func (p *pipe) read(b []byte) (n int, err error)
```

#### <a id="pipe.write" href="#pipe.write">func (p *pipe) write(b []byte) (n int, err error)</a>

```
searchKey: net.pipe.write
tags: [method private]
```

```Go
func (p *pipe) write(b []byte) (n int, err error)
```

### <a id="pipeAddr" href="#pipeAddr">type pipeAddr struct{}</a>

```
searchKey: net.pipeAddr
tags: [struct private]
```

```Go
type pipeAddr struct{}
```

#### <a id="pipeAddr.Network" href="#pipeAddr.Network">func (pipeAddr) Network() string</a>

```
searchKey: net.pipeAddr.Network
tags: [method private]
```

```Go
func (pipeAddr) Network() string
```

#### <a id="pipeAddr.String" href="#pipeAddr.String">func (pipeAddr) String() string</a>

```
searchKey: net.pipeAddr.String
tags: [method private]
```

```Go
func (pipeAddr) String() string
```

### <a id="pipeDeadline" href="#pipeDeadline">type pipeDeadline struct</a>

```
searchKey: net.pipeDeadline
tags: [struct private]
```

```Go
type pipeDeadline struct {
	mu     sync.Mutex // Guards timer and cancel
	timer  *time.Timer
	cancel chan struct{} // Must be non-nil
}
```

pipeDeadline is an abstraction for handling timeouts. 

#### <a id="makePipeDeadline" href="#makePipeDeadline">func makePipeDeadline() pipeDeadline</a>

```
searchKey: net.makePipeDeadline
tags: [function private]
```

```Go
func makePipeDeadline() pipeDeadline
```

#### <a id="pipeDeadline.set" href="#pipeDeadline.set">func (d *pipeDeadline) set(t time.Time)</a>

```
searchKey: net.pipeDeadline.set
tags: [method private]
```

```Go
func (d *pipeDeadline) set(t time.Time)
```

set sets the point in time when the deadline will time out. A timeout event is signaled by closing the channel returned by waiter. Once a timeout has occurred, the deadline can be refreshed by specifying a t value in the future. 

A zero value for t prevents timeout. 

#### <a id="pipeDeadline.wait" href="#pipeDeadline.wait">func (d *pipeDeadline) wait() chan struct{}</a>

```
searchKey: net.pipeDeadline.wait
tags: [method private]
```

```Go
func (d *pipeDeadline) wait() chan struct{}
```

wait returns a channel that is closed when the deadline is exceeded. 

### <a id="policyTable" href="#policyTable">type policyTable []net.policyTableEntry</a>

```
searchKey: net.policyTable
tags: [array struct private]
```

```Go
type policyTable []policyTableEntry
```

#### <a id="policyTable.Classify" href="#policyTable.Classify">func (t policyTable) Classify(ip IP) policyTableEntry</a>

```
searchKey: net.policyTable.Classify
tags: [method private]
```

```Go
func (t policyTable) Classify(ip IP) policyTableEntry
```

Classify returns the policyTableEntry of the entry with the longest matching prefix that contains ip. The table t must be sorted from largest mask size to smallest. 

### <a id="policyTableEntry" href="#policyTableEntry">type policyTableEntry struct</a>

```
searchKey: net.policyTableEntry
tags: [struct private]
```

```Go
type policyTableEntry struct {
	Prefix     *IPNet
	Precedence uint8
	Label      uint8
}
```

### <a id="portLookupResult" href="#portLookupResult">type portLookupResult struct</a>

```
searchKey: net.portLookupResult
tags: [struct private]
```

```Go
type portLookupResult struct {
	port int
	err  error
}
```

### <a id="rawConn" href="#rawConn">type rawConn struct</a>

```
searchKey: net.rawConn
tags: [struct private]
```

```Go
type rawConn struct {
	fd *netFD
}
```

#### <a id="newRawConn" href="#newRawConn">func newRawConn(fd *netFD) (*rawConn, error)</a>

```
searchKey: net.newRawConn
tags: [function private]
```

```Go
func newRawConn(fd *netFD) (*rawConn, error)
```

#### <a id="rawConn.Control" href="#rawConn.Control">func (c *rawConn) Control(f func(uintptr)) error</a>

```
searchKey: net.rawConn.Control
tags: [method private]
```

```Go
func (c *rawConn) Control(f func(uintptr)) error
```

#### <a id="rawConn.Read" href="#rawConn.Read">func (c *rawConn) Read(f func(uintptr) bool) error</a>

```
searchKey: net.rawConn.Read
tags: [method private]
```

```Go
func (c *rawConn) Read(f func(uintptr) bool) error
```

#### <a id="rawConn.Write" href="#rawConn.Write">func (c *rawConn) Write(f func(uintptr) bool) error</a>

```
searchKey: net.rawConn.Write
tags: [method private]
```

```Go
func (c *rawConn) Write(f func(uintptr) bool) error
```

#### <a id="rawConn.ok" href="#rawConn.ok">func (c *rawConn) ok() bool</a>

```
searchKey: net.rawConn.ok
tags: [method private]
```

```Go
func (c *rawConn) ok() bool
```

### <a id="rawListener" href="#rawListener">type rawListener struct</a>

```
searchKey: net.rawListener
tags: [struct private]
```

```Go
type rawListener struct {
	rawConn
}
```

#### <a id="newRawListener" href="#newRawListener">func newRawListener(fd *netFD) (*rawListener, error)</a>

```
searchKey: net.newRawListener
tags: [function private]
```

```Go
func newRawListener(fd *netFD) (*rawListener, error)
```

#### <a id="rawListener.Read" href="#rawListener.Read">func (l *rawListener) Read(func(uintptr) bool) error</a>

```
searchKey: net.rawListener.Read
tags: [method private]
```

```Go
func (l *rawListener) Read(func(uintptr) bool) error
```

#### <a id="rawListener.Write" href="#rawListener.Write">func (l *rawListener) Write(func(uintptr) bool) error</a>

```
searchKey: net.rawListener.Write
tags: [method private]
```

```Go
func (l *rawListener) Write(func(uintptr) bool) error
```

### <a id="resolvConfTest" href="#resolvConfTest">type resolvConfTest struct</a>

```
searchKey: net.resolvConfTest
tags: [struct private]
```

```Go
type resolvConfTest struct {
	dir  string
	path string
	*resolverConfig
}
```

#### <a id="newResolvConfTest" href="#newResolvConfTest">func newResolvConfTest() (*resolvConfTest, error)</a>

```
searchKey: net.newResolvConfTest
tags: [function private]
```

```Go
func newResolvConfTest() (*resolvConfTest, error)
```

#### <a id="resolvConfTest.forceUpdate" href="#resolvConfTest.forceUpdate">func (conf *resolvConfTest) forceUpdate(name string, lastChecked time.Time) error</a>

```
searchKey: net.resolvConfTest.forceUpdate
tags: [method private]
```

```Go
func (conf *resolvConfTest) forceUpdate(name string, lastChecked time.Time) error
```

#### <a id="resolvConfTest.servers" href="#resolvConfTest.servers">func (conf *resolvConfTest) servers() []string</a>

```
searchKey: net.resolvConfTest.servers
tags: [method private]
```

```Go
func (conf *resolvConfTest) servers() []string
```

#### <a id="resolvConfTest.teardown" href="#resolvConfTest.teardown">func (conf *resolvConfTest) teardown() error</a>

```
searchKey: net.resolvConfTest.teardown
tags: [method private]
```

```Go
func (conf *resolvConfTest) teardown() error
```

#### <a id="resolvConfTest.writeAndUpdate" href="#resolvConfTest.writeAndUpdate">func (conf *resolvConfTest) writeAndUpdate(lines []string) error</a>

```
searchKey: net.resolvConfTest.writeAndUpdate
tags: [method private]
```

```Go
func (conf *resolvConfTest) writeAndUpdate(lines []string) error
```

### <a id="resolveIPAddrTest" href="#resolveIPAddrTest">type resolveIPAddrTest struct</a>

```
searchKey: net.resolveIPAddrTest
tags: [struct private]
```

```Go
type resolveIPAddrTest struct {
	network       string
	litAddrOrName string
	addr          *IPAddr
	err           error
}
```

### <a id="resolveTCPAddrTest" href="#resolveTCPAddrTest">type resolveTCPAddrTest struct</a>

```
searchKey: net.resolveTCPAddrTest
tags: [struct private]
```

```Go
type resolveTCPAddrTest struct {
	network       string
	litAddrOrName string
	addr          *TCPAddr
	err           error
}
```

### <a id="resolveUDPAddrTest" href="#resolveUDPAddrTest">type resolveUDPAddrTest struct</a>

```
searchKey: net.resolveUDPAddrTest
tags: [struct private]
```

```Go
type resolveUDPAddrTest struct {
	network       string
	litAddrOrName string
	addr          *UDPAddr
	err           error
}
```

### <a id="resolverConfig" href="#resolverConfig">type resolverConfig struct</a>

```
searchKey: net.resolverConfig
tags: [struct private]
```

```Go
type resolverConfig struct {
	initOnce sync.Once // guards init of resolverConfig

	// ch is used as a semaphore that only allows one lookup at a
	// time to recheck resolv.conf.
	ch          chan struct{} // guards lastChecked and modTime
	lastChecked time.Time     // last time resolv.conf was checked

	mu        sync.RWMutex // protects dnsConfig
	dnsConfig *dnsConfig   // parsed resolv.conf structure used in lookups
}
```

A resolverConfig represents a DNS stub resolver configuration. 

#### <a id="resolverConfig.init.dnsclient_unix.go" href="#resolverConfig.init.dnsclient_unix.go">func (conf *resolverConfig) init()</a>

```
searchKey: net.resolverConfig.init
tags: [method private]
```

```Go
func (conf *resolverConfig) init()
```

init initializes conf and is only called via conf.initOnce. 

#### <a id="resolverConfig.releaseSema" href="#resolverConfig.releaseSema">func (conf *resolverConfig) releaseSema()</a>

```
searchKey: net.resolverConfig.releaseSema
tags: [method private]
```

```Go
func (conf *resolverConfig) releaseSema()
```

#### <a id="resolverConfig.tryAcquireSema" href="#resolverConfig.tryAcquireSema">func (conf *resolverConfig) tryAcquireSema() bool</a>

```
searchKey: net.resolverConfig.tryAcquireSema
tags: [method private]
```

```Go
func (conf *resolverConfig) tryAcquireSema() bool
```

#### <a id="resolverConfig.tryUpdate" href="#resolverConfig.tryUpdate">func (conf *resolverConfig) tryUpdate(name string)</a>

```
searchKey: net.resolverConfig.tryUpdate
tags: [method private]
```

```Go
func (conf *resolverConfig) tryUpdate(name string)
```

tryUpdate tries to update conf with the named resolv.conf file. The name variable only exists for testing. It is otherwise always "/etc/resolv.conf". 

### <a id="reverseLookupResult" href="#reverseLookupResult">type reverseLookupResult struct</a>

```
searchKey: net.reverseLookupResult
tags: [struct private]
```

```Go
type reverseLookupResult struct {
	names []string
	err   error
}
```

### <a id="routeStats" href="#routeStats">type routeStats struct</a>

```
searchKey: net.routeStats
tags: [struct private]
```

```Go
type routeStats struct {
	ipv4, ipv6 int // # of active connected unicast, anycast or multicast routes
}
```

#### <a id="validateInterfaceMulticastAddrs" href="#validateInterfaceMulticastAddrs">func validateInterfaceMulticastAddrs(ifat []Addr) (*routeStats, error)</a>

```
searchKey: net.validateInterfaceMulticastAddrs
tags: [function private]
```

```Go
func validateInterfaceMulticastAddrs(ifat []Addr) (*routeStats, error)
```

#### <a id="validateInterfaceUnicastAddrs" href="#validateInterfaceUnicastAddrs">func validateInterfaceUnicastAddrs(ifat []Addr) (*routeStats, error)</a>

```
searchKey: net.validateInterfaceUnicastAddrs
tags: [function private]
```

```Go
func validateInterfaceUnicastAddrs(ifat []Addr) (*routeStats, error)
```

### <a id="scope" href="#scope">type scope uint8</a>

```
searchKey: net.scope
tags: [number private]
```

```Go
type scope uint8
```

RFC 6724 section 3.1. 

#### <a id="classifyScope" href="#classifyScope">func classifyScope(ip IP) scope</a>

```
searchKey: net.classifyScope
tags: [function private]
```

```Go
func classifyScope(ip IP) scope
```

### <a id="sockaddr" href="#sockaddr">type sockaddr interface</a>

```
searchKey: net.sockaddr
tags: [interface private]
```

```Go
type sockaddr interface {
	Addr

	// family returns the platform-dependent address family
	// identifier.
	family() int

	// isWildcard reports whether the address is a wildcard
	// address.
	isWildcard() bool

	// sockaddr returns the address converted into a syscall
	// sockaddr type that implements syscall.Sockaddr
	// interface. It returns a nil interface when the address is
	// nil.
	sockaddr(family int) (syscall.Sockaddr, error)

	// toLocal maps the zero address to a local system address (127.0.0.1 or ::1)
	toLocal(net string) sockaddr
}
```

A sockaddr represents a TCP, UDP, IP or Unix network endpoint address that can be converted into a syscall.Sockaddr. 

### <a id="staticHostEntry" href="#staticHostEntry">type staticHostEntry struct</a>

```
searchKey: net.staticHostEntry
tags: [struct private]
```

```Go
type staticHostEntry struct {
	in  string
	out []string
}
```

### <a id="streamListener" href="#streamListener">type streamListener struct</a>

```
searchKey: net.streamListener
tags: [struct private]
```

```Go
type streamListener struct {
	network, address string
	Listener
	done chan bool // signal that indicates server stopped
}
```

#### <a id="streamListener.newLocalServer" href="#streamListener.newLocalServer">func (sl *streamListener) newLocalServer() (*localServer, error)</a>

```
searchKey: net.streamListener.newLocalServer
tags: [method private]
```

```Go
func (sl *streamListener) newLocalServer() (*localServer, error)
```

### <a id="sysDialer" href="#sysDialer">type sysDialer struct</a>

```
searchKey: net.sysDialer
tags: [struct private]
```

```Go
type sysDialer struct {
	Dialer
	network, address string
}
```

sysDialer contains a Dial's parameters and configuration. 

#### <a id="sysDialer.dialIP" href="#sysDialer.dialIP">func (sd *sysDialer) dialIP(ctx context.Context, laddr, raddr *IPAddr) (*IPConn, error)</a>

```
searchKey: net.sysDialer.dialIP
tags: [method private]
```

```Go
func (sd *sysDialer) dialIP(ctx context.Context, laddr, raddr *IPAddr) (*IPConn, error)
```

#### <a id="sysDialer.dialParallel" href="#sysDialer.dialParallel">func (sd *sysDialer) dialParallel(ctx context.Context, primaries, fallbacks addrList) (Conn, error)</a>

```
searchKey: net.sysDialer.dialParallel
tags: [method private]
```

```Go
func (sd *sysDialer) dialParallel(ctx context.Context, primaries, fallbacks addrList) (Conn, error)
```

dialParallel races two copies of dialSerial, giving the first a head start. It returns the first established connection and closes the others. Otherwise it returns an error from the first primary address. 

#### <a id="sysDialer.dialSerial" href="#sysDialer.dialSerial">func (sd *sysDialer) dialSerial(ctx context.Context, ras addrList) (Conn, error)</a>

```
searchKey: net.sysDialer.dialSerial
tags: [method private]
```

```Go
func (sd *sysDialer) dialSerial(ctx context.Context, ras addrList) (Conn, error)
```

dialSerial connects to a list of addresses in sequence, returning either the first successful connection, or the first error. 

#### <a id="sysDialer.dialSingle" href="#sysDialer.dialSingle">func (sd *sysDialer) dialSingle(ctx context.Context, ra Addr) (c Conn, err error)</a>

```
searchKey: net.sysDialer.dialSingle
tags: [method private]
```

```Go
func (sd *sysDialer) dialSingle(ctx context.Context, ra Addr) (c Conn, err error)
```

dialSingle attempts to establish and returns a single connection to the destination address. 

#### <a id="sysDialer.dialTCP" href="#sysDialer.dialTCP">func (sd *sysDialer) dialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)</a>

```
searchKey: net.sysDialer.dialTCP
tags: [method private]
```

```Go
func (sd *sysDialer) dialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)
```

#### <a id="sysDialer.dialUDP" href="#sysDialer.dialUDP">func (sd *sysDialer) dialUDP(ctx context.Context, laddr, raddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.sysDialer.dialUDP
tags: [method private]
```

```Go
func (sd *sysDialer) dialUDP(ctx context.Context, laddr, raddr *UDPAddr) (*UDPConn, error)
```

#### <a id="sysDialer.dialUnix" href="#sysDialer.dialUnix">func (sd *sysDialer) dialUnix(ctx context.Context, laddr, raddr *UnixAddr) (*UnixConn, error)</a>

```
searchKey: net.sysDialer.dialUnix
tags: [method private]
```

```Go
func (sd *sysDialer) dialUnix(ctx context.Context, laddr, raddr *UnixAddr) (*UnixConn, error)
```

#### <a id="sysDialer.doDialTCP" href="#sysDialer.doDialTCP">func (sd *sysDialer) doDialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)</a>

```
searchKey: net.sysDialer.doDialTCP
tags: [method private]
```

```Go
func (sd *sysDialer) doDialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)
```

### <a id="sysListener" href="#sysListener">type sysListener struct</a>

```
searchKey: net.sysListener
tags: [struct private]
```

```Go
type sysListener struct {
	ListenConfig
	network, address string
}
```

sysListener contains a Listen's parameters and configuration. 

#### <a id="sysListener.listenIP" href="#sysListener.listenIP">func (sl *sysListener) listenIP(ctx context.Context, laddr *IPAddr) (*IPConn, error)</a>

```
searchKey: net.sysListener.listenIP
tags: [method private]
```

```Go
func (sl *sysListener) listenIP(ctx context.Context, laddr *IPAddr) (*IPConn, error)
```

#### <a id="sysListener.listenMulticastUDP" href="#sysListener.listenMulticastUDP">func (sl *sysListener) listenMulticastUDP(ctx context.Context, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.sysListener.listenMulticastUDP
tags: [method private]
```

```Go
func (sl *sysListener) listenMulticastUDP(ctx context.Context, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)
```

#### <a id="sysListener.listenTCP" href="#sysListener.listenTCP">func (sl *sysListener) listenTCP(ctx context.Context, laddr *TCPAddr) (*TCPListener, error)</a>

```
searchKey: net.sysListener.listenTCP
tags: [method private]
```

```Go
func (sl *sysListener) listenTCP(ctx context.Context, laddr *TCPAddr) (*TCPListener, error)
```

#### <a id="sysListener.listenUDP" href="#sysListener.listenUDP">func (sl *sysListener) listenUDP(ctx context.Context, laddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.sysListener.listenUDP
tags: [method private]
```

```Go
func (sl *sysListener) listenUDP(ctx context.Context, laddr *UDPAddr) (*UDPConn, error)
```

#### <a id="sysListener.listenUnix" href="#sysListener.listenUnix">func (sl *sysListener) listenUnix(ctx context.Context, laddr *UnixAddr) (*UnixListener, error)</a>

```
searchKey: net.sysListener.listenUnix
tags: [method private]
```

```Go
func (sl *sysListener) listenUnix(ctx context.Context, laddr *UnixAddr) (*UnixListener, error)
```

#### <a id="sysListener.listenUnixgram" href="#sysListener.listenUnixgram">func (sl *sysListener) listenUnixgram(ctx context.Context, laddr *UnixAddr) (*UnixConn, error)</a>

```
searchKey: net.sysListener.listenUnixgram
tags: [method private]
```

```Go
func (sl *sysListener) listenUnixgram(ctx context.Context, laddr *UnixAddr) (*UnixConn, error)
```

### <a id="temporary" href="#temporary">type temporary interface</a>

```
searchKey: net.temporary
tags: [interface private]
```

```Go
type temporary interface {
	Temporary() bool
}
```

### <a id="testInterface" href="#testInterface">type testInterface struct</a>

```
searchKey: net.testInterface
tags: [struct private]
```

```Go
type testInterface struct {
	name         string
	local        string
	remote       string
	setupCmds    []*exec.Cmd
	teardownCmds []*exec.Cmd
}
```

#### <a id="testInterface.setBroadcast" href="#testInterface.setBroadcast">func (ti *testInterface) setBroadcast(vid int) error</a>

```
searchKey: net.testInterface.setBroadcast
tags: [method private]
```

```Go
func (ti *testInterface) setBroadcast(vid int) error
```

#### <a id="testInterface.setLinkLocal" href="#testInterface.setLinkLocal">func (ti *testInterface) setLinkLocal(suffix int) error</a>

```
searchKey: net.testInterface.setLinkLocal
tags: [method private]
```

```Go
func (ti *testInterface) setLinkLocal(suffix int) error
```

#### <a id="testInterface.setPointToPoint" href="#testInterface.setPointToPoint">func (ti *testInterface) setPointToPoint(suffix int) error</a>

```
searchKey: net.testInterface.setPointToPoint
tags: [method private]
```

```Go
func (ti *testInterface) setPointToPoint(suffix int) error
```

#### <a id="testInterface.setup" href="#testInterface.setup">func (ti *testInterface) setup() error</a>

```
searchKey: net.testInterface.setup
tags: [method private]
```

```Go
func (ti *testInterface) setup() error
```

#### <a id="testInterface.teardown" href="#testInterface.teardown">func (ti *testInterface) teardown() error</a>

```
searchKey: net.testInterface.teardown
tags: [method private]
```

```Go
func (ti *testInterface) teardown() error
```

### <a id="timeout" href="#timeout">type timeout interface</a>

```
searchKey: net.timeout
tags: [interface private]
```

```Go
type timeout interface {
	Timeout() bool
}
```

### <a id="timeoutError" href="#timeoutError">type timeoutError struct{}</a>

```
searchKey: net.timeoutError
tags: [struct private]
```

```Go
type timeoutError struct{}
```

#### <a id="timeoutError.Error" href="#timeoutError.Error">func (e *timeoutError) Error() string</a>

```
searchKey: net.timeoutError.Error
tags: [method private]
```

```Go
func (e *timeoutError) Error() string
```

#### <a id="timeoutError.Temporary" href="#timeoutError.Temporary">func (e *timeoutError) Temporary() bool</a>

```
searchKey: net.timeoutError.Temporary
tags: [method private]
```

```Go
func (e *timeoutError) Temporary() bool
```

#### <a id="timeoutError.Timeout" href="#timeoutError.Timeout">func (e *timeoutError) Timeout() bool</a>

```
searchKey: net.timeoutError.Timeout
tags: [method private]
```

```Go
func (e *timeoutError) Timeout() bool
```

### <a id="writerOnly" href="#writerOnly">type writerOnly struct</a>

```
searchKey: net.writerOnly
tags: [struct private]
```

```Go
type writerOnly struct {
	io.Writer
}
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkDNSName" href="#BenchmarkDNSName">func BenchmarkDNSName(b *testing.B)</a>

```
searchKey: net.BenchmarkDNSName
tags: [function private benchmark]
```

```Go
func BenchmarkDNSName(b *testing.B)
```

### <a id="BenchmarkGoLookupIP" href="#BenchmarkGoLookupIP">func BenchmarkGoLookupIP(b *testing.B)</a>

```
searchKey: net.BenchmarkGoLookupIP
tags: [function private benchmark]
```

```Go
func BenchmarkGoLookupIP(b *testing.B)
```

### <a id="BenchmarkGoLookupIPNoSuchHost" href="#BenchmarkGoLookupIPNoSuchHost">func BenchmarkGoLookupIPNoSuchHost(b *testing.B)</a>

```
searchKey: net.BenchmarkGoLookupIPNoSuchHost
tags: [function private benchmark]
```

```Go
func BenchmarkGoLookupIPNoSuchHost(b *testing.B)
```

### <a id="BenchmarkGoLookupIPWithBrokenNameServer" href="#BenchmarkGoLookupIPWithBrokenNameServer">func BenchmarkGoLookupIPWithBrokenNameServer(b *testing.B)</a>

```
searchKey: net.BenchmarkGoLookupIPWithBrokenNameServer
tags: [function private benchmark]
```

```Go
func BenchmarkGoLookupIPWithBrokenNameServer(b *testing.B)
```

### <a id="BenchmarkIPEqual" href="#BenchmarkIPEqual">func BenchmarkIPEqual(b *testing.B)</a>

```
searchKey: net.BenchmarkIPEqual
tags: [function private benchmark]
```

```Go
func BenchmarkIPEqual(b *testing.B)
```

### <a id="BenchmarkIPMaskString" href="#BenchmarkIPMaskString">func BenchmarkIPMaskString(b *testing.B)</a>

```
searchKey: net.BenchmarkIPMaskString
tags: [function private benchmark]
```

```Go
func BenchmarkIPMaskString(b *testing.B)
```

### <a id="BenchmarkIPString" href="#BenchmarkIPString">func BenchmarkIPString(b *testing.B)</a>

```
searchKey: net.BenchmarkIPString
tags: [function private benchmark]
```

```Go
func BenchmarkIPString(b *testing.B)
```

### <a id="BenchmarkInterfaceAddrs" href="#BenchmarkInterfaceAddrs">func BenchmarkInterfaceAddrs(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfaceAddrs
tags: [function private benchmark]
```

```Go
func BenchmarkInterfaceAddrs(b *testing.B)
```

### <a id="BenchmarkInterfaceByIndex" href="#BenchmarkInterfaceByIndex">func BenchmarkInterfaceByIndex(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfaceByIndex
tags: [function private benchmark]
```

```Go
func BenchmarkInterfaceByIndex(b *testing.B)
```

### <a id="BenchmarkInterfaceByName" href="#BenchmarkInterfaceByName">func BenchmarkInterfaceByName(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfaceByName
tags: [function private benchmark]
```

```Go
func BenchmarkInterfaceByName(b *testing.B)
```

### <a id="BenchmarkInterfaces" href="#BenchmarkInterfaces">func BenchmarkInterfaces(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfaces
tags: [function private benchmark]
```

```Go
func BenchmarkInterfaces(b *testing.B)
```

### <a id="BenchmarkInterfacesAndAddrs" href="#BenchmarkInterfacesAndAddrs">func BenchmarkInterfacesAndAddrs(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfacesAndAddrs
tags: [function private benchmark]
```

```Go
func BenchmarkInterfacesAndAddrs(b *testing.B)
```

### <a id="BenchmarkInterfacesAndMulticastAddrs" href="#BenchmarkInterfacesAndMulticastAddrs">func BenchmarkInterfacesAndMulticastAddrs(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfacesAndMulticastAddrs
tags: [function private benchmark]
```

```Go
func BenchmarkInterfacesAndMulticastAddrs(b *testing.B)
```

### <a id="BenchmarkParseIP" href="#BenchmarkParseIP">func BenchmarkParseIP(b *testing.B)</a>

```
searchKey: net.BenchmarkParseIP
tags: [function private benchmark]
```

```Go
func BenchmarkParseIP(b *testing.B)
```

### <a id="BenchmarkSetReadDeadline" href="#BenchmarkSetReadDeadline">func BenchmarkSetReadDeadline(b *testing.B)</a>

```
searchKey: net.BenchmarkSetReadDeadline
tags: [function private benchmark]
```

```Go
func BenchmarkSetReadDeadline(b *testing.B)
```

### <a id="BenchmarkTCP4ConcurrentReadWrite" href="#BenchmarkTCP4ConcurrentReadWrite">func BenchmarkTCP4ConcurrentReadWrite(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4ConcurrentReadWrite
tags: [function private benchmark]
```

```Go
func BenchmarkTCP4ConcurrentReadWrite(b *testing.B)
```

### <a id="BenchmarkTCP4OneShot" href="#BenchmarkTCP4OneShot">func BenchmarkTCP4OneShot(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4OneShot
tags: [function private benchmark]
```

```Go
func BenchmarkTCP4OneShot(b *testing.B)
```

### <a id="BenchmarkTCP4OneShotTimeout" href="#BenchmarkTCP4OneShotTimeout">func BenchmarkTCP4OneShotTimeout(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4OneShotTimeout
tags: [function private benchmark]
```

```Go
func BenchmarkTCP4OneShotTimeout(b *testing.B)
```

### <a id="BenchmarkTCP4Persistent" href="#BenchmarkTCP4Persistent">func BenchmarkTCP4Persistent(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4Persistent
tags: [function private benchmark]
```

```Go
func BenchmarkTCP4Persistent(b *testing.B)
```

### <a id="BenchmarkTCP4PersistentTimeout" href="#BenchmarkTCP4PersistentTimeout">func BenchmarkTCP4PersistentTimeout(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4PersistentTimeout
tags: [function private benchmark]
```

```Go
func BenchmarkTCP4PersistentTimeout(b *testing.B)
```

### <a id="BenchmarkTCP6ConcurrentReadWrite" href="#BenchmarkTCP6ConcurrentReadWrite">func BenchmarkTCP6ConcurrentReadWrite(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6ConcurrentReadWrite
tags: [function private benchmark]
```

```Go
func BenchmarkTCP6ConcurrentReadWrite(b *testing.B)
```

### <a id="BenchmarkTCP6OneShot" href="#BenchmarkTCP6OneShot">func BenchmarkTCP6OneShot(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6OneShot
tags: [function private benchmark]
```

```Go
func BenchmarkTCP6OneShot(b *testing.B)
```

### <a id="BenchmarkTCP6OneShotTimeout" href="#BenchmarkTCP6OneShotTimeout">func BenchmarkTCP6OneShotTimeout(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6OneShotTimeout
tags: [function private benchmark]
```

```Go
func BenchmarkTCP6OneShotTimeout(b *testing.B)
```

### <a id="BenchmarkTCP6Persistent" href="#BenchmarkTCP6Persistent">func BenchmarkTCP6Persistent(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6Persistent
tags: [function private benchmark]
```

```Go
func BenchmarkTCP6Persistent(b *testing.B)
```

### <a id="BenchmarkTCP6PersistentTimeout" href="#BenchmarkTCP6PersistentTimeout">func BenchmarkTCP6PersistentTimeout(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6PersistentTimeout
tags: [function private benchmark]
```

```Go
func BenchmarkTCP6PersistentTimeout(b *testing.B)
```

### <a id="BenchmarkUDP6LinkLocalUnicast" href="#BenchmarkUDP6LinkLocalUnicast">func BenchmarkUDP6LinkLocalUnicast(b *testing.B)</a>

```
searchKey: net.BenchmarkUDP6LinkLocalUnicast
tags: [function private benchmark]
```

```Go
func BenchmarkUDP6LinkLocalUnicast(b *testing.B)
```

### <a id="BenchmarkWriteToReadFromUDP" href="#BenchmarkWriteToReadFromUDP">func BenchmarkWriteToReadFromUDP(b *testing.B)</a>

```
searchKey: net.BenchmarkWriteToReadFromUDP
tags: [function private benchmark]
```

```Go
func BenchmarkWriteToReadFromUDP(b *testing.B)
```

### <a id="InterfaceAddrs" href="#InterfaceAddrs">func InterfaceAddrs() ([]Addr, error)</a>

```
searchKey: net.InterfaceAddrs
tags: [function]
```

```Go
func InterfaceAddrs() ([]Addr, error)
```

InterfaceAddrs returns a list of the system's unicast interface addresses. 

The returned list does not identify the associated interface; use Interfaces and Interface.Addrs for more detail. 

### <a id="Interfaces" href="#Interfaces">func Interfaces() ([]Interface, error)</a>

```
searchKey: net.Interfaces
tags: [function]
```

```Go
func Interfaces() ([]Interface, error)
```

Interfaces returns a list of the system's network interfaces. 

### <a id="JoinHostPort" href="#JoinHostPort">func JoinHostPort(host, port string) string</a>

```
searchKey: net.JoinHostPort
tags: [function]
```

```Go
func JoinHostPort(host, port string) string
```

JoinHostPort combines host and port into a network address of the form "host:port". If host contains a colon, as found in literal IPv6 addresses, then JoinHostPort returns "[host]:port". 

See func Dial for a description of the host and port parameters. 

### <a id="LookupAddr" href="#LookupAddr">func LookupAddr(addr string) (names []string, err error)</a>

```
searchKey: net.LookupAddr
tags: [function]
```

```Go
func LookupAddr(addr string) (names []string, err error)
```

LookupAddr performs a reverse lookup for the given address, returning a list of names mapping to that address. 

The returned names are validated to be properly formatted presentation-format domain names. 

When using the host C library resolver, at most one result will be returned. To bypass the host resolver, use a custom Resolver. 

LookupAddr uses context.Background internally; to specify the context, use Resolver.LookupAddr. 

### <a id="LookupCNAME" href="#LookupCNAME">func LookupCNAME(host string) (cname string, err error)</a>

```
searchKey: net.LookupCNAME
tags: [function]
```

```Go
func LookupCNAME(host string) (cname string, err error)
```

LookupCNAME returns the canonical name for the given host. Callers that do not care about the canonical name can call LookupHost or LookupIP directly; both take care of resolving the canonical name as part of the lookup. 

A canonical name is the final name after following zero or more CNAME records. LookupCNAME does not return an error if host does not contain DNS "CNAME" records, as long as host resolves to address records. 

The returned canonical name is validated to be a properly formatted presentation-format domain name. 

LookupCNAME uses context.Background internally; to specify the context, use Resolver.LookupCNAME. 

### <a id="LookupHost" href="#LookupHost">func LookupHost(host string) (addrs []string, err error)</a>

```
searchKey: net.LookupHost
tags: [function]
```

```Go
func LookupHost(host string) (addrs []string, err error)
```

LookupHost looks up the given host using the local resolver. It returns a slice of that host's addresses. 

LookupHost uses context.Background internally; to specify the context, use Resolver.LookupHost. 

### <a id="LookupIP" href="#LookupIP">func LookupIP(host string) ([]IP, error)</a>

```
searchKey: net.LookupIP
tags: [function]
```

```Go
func LookupIP(host string) ([]IP, error)
```

LookupIP looks up host using the local resolver. It returns a slice of that host's IPv4 and IPv6 addresses. 

### <a id="LookupMX" href="#LookupMX">func LookupMX(name string) ([]*MX, error)</a>

```
searchKey: net.LookupMX
tags: [function]
```

```Go
func LookupMX(name string) ([]*MX, error)
```

LookupMX returns the DNS MX records for the given domain name sorted by preference. 

The returned mail server names are validated to be properly formatted presentation-format domain names. 

LookupMX uses context.Background internally; to specify the context, use Resolver.LookupMX. 

### <a id="LookupNS" href="#LookupNS">func LookupNS(name string) ([]*NS, error)</a>

```
searchKey: net.LookupNS
tags: [function]
```

```Go
func LookupNS(name string) ([]*NS, error)
```

LookupNS returns the DNS NS records for the given domain name. 

The returned name server names are validated to be properly formatted presentation-format domain names. 

LookupNS uses context.Background internally; to specify the context, use Resolver.LookupNS. 

### <a id="LookupPort" href="#LookupPort">func LookupPort(network, service string) (port int, err error)</a>

```
searchKey: net.LookupPort
tags: [function]
```

```Go
func LookupPort(network, service string) (port int, err error)
```

LookupPort looks up the port for the given network and service. 

LookupPort uses context.Background internally; to specify the context, use Resolver.LookupPort. 

### <a id="LookupSRV" href="#LookupSRV">func LookupSRV(service, proto, name string) (cname string, addrs []*SRV, err error)</a>

```
searchKey: net.LookupSRV
tags: [function]
```

```Go
func LookupSRV(service, proto, name string) (cname string, addrs []*SRV, err error)
```

LookupSRV tries to resolve an SRV query of the given service, protocol, and domain name. The proto is "tcp" or "udp". The returned records are sorted by priority and randomized by weight within a priority. 

LookupSRV constructs the DNS name to look up following RFC 2782. That is, it looks up _service._proto.name. To accommodate services publishing SRV records under non-standard names, if both service and proto are empty strings, LookupSRV looks up name directly. 

The returned service names are validated to be properly formatted presentation-format domain names. 

### <a id="LookupTXT" href="#LookupTXT">func LookupTXT(name string) ([]string, error)</a>

```
searchKey: net.LookupTXT
tags: [function]
```

```Go
func LookupTXT(name string) ([]string, error)
```

LookupTXT returns the DNS TXT records for the given domain name. 

LookupTXT uses context.Background internally; to specify the context, use Resolver.LookupTXT. 

### <a id="Pipe" href="#Pipe">func Pipe() (Conn, Conn)</a>

```
searchKey: net.Pipe
tags: [function]
```

```Go
func Pipe() (Conn, Conn)
```

Pipe creates a synchronous, in-memory, full duplex network connection; both ends implement the Conn interface. Reads on one end are matched with writes on the other, copying data directly between the two; there is no internal buffering. 

### <a id="SplitHostPort" href="#SplitHostPort">func SplitHostPort(hostport string) (host, port string, err error)</a>

```
searchKey: net.SplitHostPort
tags: [function]
```

```Go
func SplitHostPort(hostport string) (host, port string, err error)
```

SplitHostPort splits a network address of the form "host:port", "host%zone:port", "[host]:port" or "[host%zone]:port" into host or host%zone and port. 

A literal IPv6 address in hostport must be enclosed in square brackets, as in "[::1]:80", "[::1%lo0]:80". 

See func Dial for a description of the hostport parameter, and host and port results. 

### <a id="TestAcceptError" href="#TestAcceptError">func TestAcceptError(t *testing.T)</a>

```
searchKey: net.TestAcceptError
tags: [function private test]
```

```Go
func TestAcceptError(t *testing.T)
```

### <a id="TestAcceptIgnoreAbortedConnRequest" href="#TestAcceptIgnoreAbortedConnRequest">func TestAcceptIgnoreAbortedConnRequest(t *testing.T)</a>

```
searchKey: net.TestAcceptIgnoreAbortedConnRequest
tags: [function private test]
```

```Go
func TestAcceptIgnoreAbortedConnRequest(t *testing.T)
```

See golang.org/issue/6163, golang.org/issue/6987. 

### <a id="TestAcceptTimeout" href="#TestAcceptTimeout">func TestAcceptTimeout(t *testing.T)</a>

```
searchKey: net.TestAcceptTimeout
tags: [function private test]
```

```Go
func TestAcceptTimeout(t *testing.T)
```

### <a id="TestAcceptTimeoutMustNotReturn" href="#TestAcceptTimeoutMustNotReturn">func TestAcceptTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: net.TestAcceptTimeoutMustNotReturn
tags: [function private test]
```

```Go
func TestAcceptTimeoutMustNotReturn(t *testing.T)
```

### <a id="TestAcceptTimeoutMustReturn" href="#TestAcceptTimeoutMustReturn">func TestAcceptTimeoutMustReturn(t *testing.T)</a>

```
searchKey: net.TestAcceptTimeoutMustReturn
tags: [function private test]
```

```Go
func TestAcceptTimeoutMustReturn(t *testing.T)
```

### <a id="TestAddrList" href="#TestAddrList">func TestAddrList(t *testing.T)</a>

```
searchKey: net.TestAddrList
tags: [function private test]
```

```Go
func TestAddrList(t *testing.T)
```

### <a id="TestAddrListPartition" href="#TestAddrListPartition">func TestAddrListPartition(t *testing.T)</a>

```
searchKey: net.TestAddrListPartition
tags: [function private test]
```

```Go
func TestAddrListPartition(t *testing.T)
```

### <a id="TestAvoidDNSName" href="#TestAvoidDNSName">func TestAvoidDNSName(t *testing.T)</a>

```
searchKey: net.TestAvoidDNSName
tags: [function private test]
```

```Go
func TestAvoidDNSName(t *testing.T)
```

Issue 13705: don't try to resolve onion addresses, etc 

### <a id="TestBuffers_WriteTo" href="#TestBuffers_WriteTo">func TestBuffers_WriteTo(t *testing.T)</a>

```
searchKey: net.TestBuffers_WriteTo
tags: [function private test]
```

```Go
func TestBuffers_WriteTo(t *testing.T)
```

### <a id="TestBuffers_consume" href="#TestBuffers_consume">func TestBuffers_consume(t *testing.T)</a>

```
searchKey: net.TestBuffers_consume
tags: [function private test]
```

```Go
func TestBuffers_consume(t *testing.T)
```

### <a id="TestBuffers_read" href="#TestBuffers_read">func TestBuffers_read(t *testing.T)</a>

```
searchKey: net.TestBuffers_read
tags: [function private test]
```

```Go
func TestBuffers_read(t *testing.T)
```

### <a id="TestCIDRMask" href="#TestCIDRMask">func TestCIDRMask(t *testing.T)</a>

```
searchKey: net.TestCIDRMask
tags: [function private test]
```

```Go
func TestCIDRMask(t *testing.T)
```

### <a id="TestCVE202133195" href="#TestCVE202133195">func TestCVE202133195(t *testing.T)</a>

```
searchKey: net.TestCVE202133195
tags: [function private test]
```

```Go
func TestCVE202133195(t *testing.T)
```

### <a id="TestCancelAfterDial" href="#TestCancelAfterDial">func TestCancelAfterDial(t *testing.T)</a>

```
searchKey: net.TestCancelAfterDial
tags: [function private test]
```

```Go
func TestCancelAfterDial(t *testing.T)
```

### <a id="TestCgoLookupIP" href="#TestCgoLookupIP">func TestCgoLookupIP(t *testing.T)</a>

```
searchKey: net.TestCgoLookupIP
tags: [function private test]
```

```Go
func TestCgoLookupIP(t *testing.T)
```

### <a id="TestCgoLookupIPWithCancel" href="#TestCgoLookupIPWithCancel">func TestCgoLookupIPWithCancel(t *testing.T)</a>

```
searchKey: net.TestCgoLookupIPWithCancel
tags: [function private test]
```

```Go
func TestCgoLookupIPWithCancel(t *testing.T)
```

### <a id="TestCgoLookupPTR" href="#TestCgoLookupPTR">func TestCgoLookupPTR(t *testing.T)</a>

```
searchKey: net.TestCgoLookupPTR
tags: [function private test]
```

```Go
func TestCgoLookupPTR(t *testing.T)
```

### <a id="TestCgoLookupPTRWithCancel" href="#TestCgoLookupPTRWithCancel">func TestCgoLookupPTRWithCancel(t *testing.T)</a>

```
searchKey: net.TestCgoLookupPTRWithCancel
tags: [function private test]
```

```Go
func TestCgoLookupPTRWithCancel(t *testing.T)
```

### <a id="TestCgoLookupPort" href="#TestCgoLookupPort">func TestCgoLookupPort(t *testing.T)</a>

```
searchKey: net.TestCgoLookupPort
tags: [function private test]
```

```Go
func TestCgoLookupPort(t *testing.T)
```

### <a id="TestCgoLookupPortWithCancel" href="#TestCgoLookupPortWithCancel">func TestCgoLookupPortWithCancel(t *testing.T)</a>

```
searchKey: net.TestCgoLookupPortWithCancel
tags: [function private test]
```

```Go
func TestCgoLookupPortWithCancel(t *testing.T)
```

### <a id="TestCloseError" href="#TestCloseError">func TestCloseError(t *testing.T)</a>

```
searchKey: net.TestCloseError
tags: [function private test]
```

```Go
func TestCloseError(t *testing.T)
```

### <a id="TestCloseRead" href="#TestCloseRead">func TestCloseRead(t *testing.T)</a>

```
searchKey: net.TestCloseRead
tags: [function private test]
```

```Go
func TestCloseRead(t *testing.T)
```

### <a id="TestCloseUnblocksRead" href="#TestCloseUnblocksRead">func TestCloseUnblocksRead(t *testing.T)</a>

```
searchKey: net.TestCloseUnblocksRead
tags: [function private test]
```

```Go
func TestCloseUnblocksRead(t *testing.T)
```

Issue 17695: verify that a blocked Read is woken up by a Close. 

### <a id="TestCloseWrite" href="#TestCloseWrite">func TestCloseWrite(t *testing.T)</a>

```
searchKey: net.TestCloseWrite
tags: [function private test]
```

```Go
func TestCloseWrite(t *testing.T)
```

### <a id="TestClosingListener" href="#TestClosingListener">func TestClosingListener(t *testing.T)</a>

```
searchKey: net.TestClosingListener
tags: [function private test]
```

```Go
func TestClosingListener(t *testing.T)
```

Issue 21856. 

### <a id="TestConcurrentPreferGoResolversDial" href="#TestConcurrentPreferGoResolversDial">func TestConcurrentPreferGoResolversDial(t *testing.T)</a>

```
searchKey: net.TestConcurrentPreferGoResolversDial
tags: [function private test]
```

```Go
func TestConcurrentPreferGoResolversDial(t *testing.T)
```

TestConcurrentPreferGoResolversDial tests that multiple resolvers with the PreferGo option used concurrently are all dialed properly. 

### <a id="TestConcurrentSetDeadline" href="#TestConcurrentSetDeadline">func TestConcurrentSetDeadline(t *testing.T)</a>

```
searchKey: net.TestConcurrentSetDeadline
tags: [function private test]
```

```Go
func TestConcurrentSetDeadline(t *testing.T)
```

Issue 35367. 

### <a id="TestConfHostLookupOrder" href="#TestConfHostLookupOrder">func TestConfHostLookupOrder(t *testing.T)</a>

```
searchKey: net.TestConfHostLookupOrder
tags: [function private test]
```

```Go
func TestConfHostLookupOrder(t *testing.T)
```

### <a id="TestConnAndListener" href="#TestConnAndListener">func TestConnAndListener(t *testing.T)</a>

```
searchKey: net.TestConnAndListener
tags: [function private test]
```

```Go
func TestConnAndListener(t *testing.T)
```

### <a id="TestConnAndPacketConn" href="#TestConnAndPacketConn">func TestConnAndPacketConn(t *testing.T)</a>

```
searchKey: net.TestConnAndPacketConn
tags: [function private test]
```

```Go
func TestConnAndPacketConn(t *testing.T)
```

### <a id="TestConnClose" href="#TestConnClose">func TestConnClose(t *testing.T)</a>

```
searchKey: net.TestConnClose
tags: [function private test]
```

```Go
func TestConnClose(t *testing.T)
```

### <a id="TestCopyPipeIntoTCP" href="#TestCopyPipeIntoTCP">func TestCopyPipeIntoTCP(t *testing.T)</a>

```
searchKey: net.TestCopyPipeIntoTCP
tags: [function private test]
```

```Go
func TestCopyPipeIntoTCP(t *testing.T)
```

### <a id="TestDNSDefaultSearch" href="#TestDNSDefaultSearch">func TestDNSDefaultSearch(t *testing.T)</a>

```
searchKey: net.TestDNSDefaultSearch
tags: [function private test]
```

```Go
func TestDNSDefaultSearch(t *testing.T)
```

### <a id="TestDNSDialTCP" href="#TestDNSDialTCP">func TestDNSDialTCP(t *testing.T)</a>

```
searchKey: net.TestDNSDialTCP
tags: [function private test]
```

```Go
func TestDNSDialTCP(t *testing.T)
```

Issue 26573: verify that Conns that don't implement PacketConn are treated as streams even when udp was requested. 

### <a id="TestDNSFlood" href="#TestDNSFlood">func TestDNSFlood(t *testing.T)</a>

```
searchKey: net.TestDNSFlood
tags: [function private test]
```

```Go
func TestDNSFlood(t *testing.T)
```

### <a id="TestDNSGoroutineRace" href="#TestDNSGoroutineRace">func TestDNSGoroutineRace(t *testing.T)</a>

```
searchKey: net.TestDNSGoroutineRace
tags: [function private test]
```

```Go
func TestDNSGoroutineRace(t *testing.T)
```

Test for a race between uninstalling the test hooks and closing a socket connection. This used to fail when testing with -race. 

### <a id="TestDNSName" href="#TestDNSName">func TestDNSName(t *testing.T)</a>

```
searchKey: net.TestDNSName
tags: [function private test]
```

```Go
func TestDNSName(t *testing.T)
```

### <a id="TestDNSNameLength" href="#TestDNSNameLength">func TestDNSNameLength(t *testing.T)</a>

```
searchKey: net.TestDNSNameLength
tags: [function private test]
```

```Go
func TestDNSNameLength(t *testing.T)
```

### <a id="TestDNSReadConfig" href="#TestDNSReadConfig">func TestDNSReadConfig(t *testing.T)</a>

```
searchKey: net.TestDNSReadConfig
tags: [function private test]
```

```Go
func TestDNSReadConfig(t *testing.T)
```

### <a id="TestDNSReadMissingFile" href="#TestDNSReadMissingFile">func TestDNSReadMissingFile(t *testing.T)</a>

```
searchKey: net.TestDNSReadMissingFile
tags: [function private test]
```

```Go
func TestDNSReadMissingFile(t *testing.T)
```

### <a id="TestDNSSRVUniformity" href="#TestDNSSRVUniformity">func TestDNSSRVUniformity(t *testing.T)</a>

```
searchKey: net.TestDNSSRVUniformity
tags: [function private test]
```

```Go
func TestDNSSRVUniformity(t *testing.T)
```

### <a id="TestDNSTransportFallback" href="#TestDNSTransportFallback">func TestDNSTransportFallback(t *testing.T)</a>

```
searchKey: net.TestDNSTransportFallback
tags: [function private test]
```

```Go
func TestDNSTransportFallback(t *testing.T)
```

### <a id="TestDNSUseTCP" href="#TestDNSUseTCP">func TestDNSUseTCP(t *testing.T)</a>

```
searchKey: net.TestDNSUseTCP
tags: [function private test]
```

```Go
func TestDNSUseTCP(t *testing.T)
```

Issue 29358. Add configuration knob to force TCP-only DNS requests in the pure Go resolver. 

### <a id="TestDialAddrError" href="#TestDialAddrError">func TestDialAddrError(t *testing.T)</a>

```
searchKey: net.TestDialAddrError
tags: [function private test]
```

```Go
func TestDialAddrError(t *testing.T)
```

### <a id="TestDialCancel" href="#TestDialCancel">func TestDialCancel(t *testing.T)</a>

```
searchKey: net.TestDialCancel
tags: [function private test]
```

```Go
func TestDialCancel(t *testing.T)
```

### <a id="TestDialContextCancelRace" href="#TestDialContextCancelRace">func TestDialContextCancelRace(t *testing.T)</a>

```
searchKey: net.TestDialContextCancelRace
tags: [function private test]
```

```Go
func TestDialContextCancelRace(t *testing.T)
```

Issue 16523 

### <a id="TestDialError" href="#TestDialError">func TestDialError(t *testing.T)</a>

```
searchKey: net.TestDialError
tags: [function private test]
```

```Go
func TestDialError(t *testing.T)
```

### <a id="TestDialGoogle" href="#TestDialGoogle">func TestDialGoogle(t *testing.T)</a>

```
searchKey: net.TestDialGoogle
tags: [function private test]
```

```Go
func TestDialGoogle(t *testing.T)
```

### <a id="TestDialListenIPArgs" href="#TestDialListenIPArgs">func TestDialListenIPArgs(t *testing.T)</a>

```
searchKey: net.TestDialListenIPArgs
tags: [function private test]
```

```Go
func TestDialListenIPArgs(t *testing.T)
```

### <a id="TestDialListenerAddr" href="#TestDialListenerAddr">func TestDialListenerAddr(t *testing.T)</a>

```
searchKey: net.TestDialListenerAddr
tags: [function private test]
```

```Go
func TestDialListenerAddr(t *testing.T)
```

Issue 18806: it should always be possible to net.Dial a net.Listener().Addr().String when the listen address was ":n", even if the machine has halfway configured IPv6 such that it can bind on "::" not connect back to that same address. 

### <a id="TestDialLocal" href="#TestDialLocal">func TestDialLocal(t *testing.T)</a>

```
searchKey: net.TestDialLocal
tags: [function private test]
```

```Go
func TestDialLocal(t *testing.T)
```

### <a id="TestDialParallel" href="#TestDialParallel">func TestDialParallel(t *testing.T)</a>

```
searchKey: net.TestDialParallel
tags: [function private test]
```

```Go
func TestDialParallel(t *testing.T)
```

### <a id="TestDialParallelSpuriousConnection" href="#TestDialParallelSpuriousConnection">func TestDialParallelSpuriousConnection(t *testing.T)</a>

```
searchKey: net.TestDialParallelSpuriousConnection
tags: [function private test]
```

```Go
func TestDialParallelSpuriousConnection(t *testing.T)
```

### <a id="TestDialTimeout" href="#TestDialTimeout">func TestDialTimeout(t *testing.T)</a>

```
searchKey: net.TestDialTimeout
tags: [function private test]
```

```Go
func TestDialTimeout(t *testing.T)
```

### <a id="TestDialTimeoutMaxDuration" href="#TestDialTimeoutMaxDuration">func TestDialTimeoutMaxDuration(t *testing.T)</a>

```
searchKey: net.TestDialTimeoutMaxDuration
tags: [function private test]
```

```Go
func TestDialTimeoutMaxDuration(t *testing.T)
```

### <a id="TestDialWithNonZeroDeadline" href="#TestDialWithNonZeroDeadline">func TestDialWithNonZeroDeadline(t *testing.T)</a>

```
searchKey: net.TestDialWithNonZeroDeadline
tags: [function private test]
```

```Go
func TestDialWithNonZeroDeadline(t *testing.T)
```

### <a id="TestDialerControl" href="#TestDialerControl">func TestDialerControl(t *testing.T)</a>

```
searchKey: net.TestDialerControl
tags: [function private test]
```

```Go
func TestDialerControl(t *testing.T)
```

### <a id="TestDialerDualStack" href="#TestDialerDualStack">func TestDialerDualStack(t *testing.T)</a>

```
searchKey: net.TestDialerDualStack
tags: [function private test]
```

```Go
func TestDialerDualStack(t *testing.T)
```

### <a id="TestDialerDualStackFDLeak" href="#TestDialerDualStackFDLeak">func TestDialerDualStackFDLeak(t *testing.T)</a>

```
searchKey: net.TestDialerDualStackFDLeak
tags: [function private test]
```

```Go
func TestDialerDualStackFDLeak(t *testing.T)
```

### <a id="TestDialerFallbackDelay" href="#TestDialerFallbackDelay">func TestDialerFallbackDelay(t *testing.T)</a>

```
searchKey: net.TestDialerFallbackDelay
tags: [function private test]
```

```Go
func TestDialerFallbackDelay(t *testing.T)
```

### <a id="TestDialerKeepAlive" href="#TestDialerKeepAlive">func TestDialerKeepAlive(t *testing.T)</a>

```
searchKey: net.TestDialerKeepAlive
tags: [function private test]
```

```Go
func TestDialerKeepAlive(t *testing.T)
```

### <a id="TestDialerLocalAddr" href="#TestDialerLocalAddr">func TestDialerLocalAddr(t *testing.T)</a>

```
searchKey: net.TestDialerLocalAddr
tags: [function private test]
```

```Go
func TestDialerLocalAddr(t *testing.T)
```

### <a id="TestDialerPartialDeadline" href="#TestDialerPartialDeadline">func TestDialerPartialDeadline(t *testing.T)</a>

```
searchKey: net.TestDialerPartialDeadline
tags: [function private test]
```

```Go
func TestDialerPartialDeadline(t *testing.T)
```

### <a id="TestDtoi" href="#TestDtoi">func TestDtoi(t *testing.T)</a>

```
searchKey: net.TestDtoi
tags: [function private test]
```

```Go
func TestDtoi(t *testing.T)
```

### <a id="TestDualStackTCPListener" href="#TestDualStackTCPListener">func TestDualStackTCPListener(t *testing.T)</a>

```
searchKey: net.TestDualStackTCPListener
tags: [function private test]
```

```Go
func TestDualStackTCPListener(t *testing.T)
```

TestDualStackTCPListener tests both single and double listen to a test listener with various address families, different listening address and same port. 

On DragonFly BSD, we expect the kernel version of node under test to be greater than or equal to 4.4. 

### <a id="TestDualStackUDPListener" href="#TestDualStackUDPListener">func TestDualStackUDPListener(t *testing.T)</a>

```
searchKey: net.TestDualStackUDPListener
tags: [function private test]
```

```Go
func TestDualStackUDPListener(t *testing.T)
```

TestDualStackUDPListener tests both single and double listen to a test listener with various address families, different listening address and same port. 

On DragonFly BSD, we expect the kernel version of node under test to be greater than or equal to 4.4. 

### <a id="TestEndlessWrite" href="#TestEndlessWrite">func TestEndlessWrite(t *testing.T)</a>

```
searchKey: net.TestEndlessWrite
tags: [function private test]
```

```Go
func TestEndlessWrite(t *testing.T)
```

Test that a client can't trigger an endless loop of write system calls on the server by shutting down the write side on the client. Possibility raised in the discussion of [https://golang.org/cl/71973](https://golang.org/cl/71973). 

### <a id="TestErrorForOriginalNameWhenSearching" href="#TestErrorForOriginalNameWhenSearching">func TestErrorForOriginalNameWhenSearching(t *testing.T)</a>

```
searchKey: net.TestErrorForOriginalNameWhenSearching
tags: [function private test]
```

```Go
func TestErrorForOriginalNameWhenSearching(t *testing.T)
```

Issue 12712. When using search domains, return the error encountered querying the original name instead of an error encountered querying a generated name. 

### <a id="TestErrors" href="#TestErrors">func TestErrors(t *testing.T)</a>

```
searchKey: net.TestErrors
tags: [function private test]
```

```Go
func TestErrors(t *testing.T)
```

The various errors should implement the Error interface. 

### <a id="TestFileCloseRace" href="#TestFileCloseRace">func TestFileCloseRace(t *testing.T)</a>

```
searchKey: net.TestFileCloseRace
tags: [function private test]
```

```Go
func TestFileCloseRace(t *testing.T)
```

Issue 24483. 

### <a id="TestFileConn" href="#TestFileConn">func TestFileConn(t *testing.T)</a>

```
searchKey: net.TestFileConn
tags: [function private test]
```

```Go
func TestFileConn(t *testing.T)
```

### <a id="TestFileError" href="#TestFileError">func TestFileError(t *testing.T)</a>

```
searchKey: net.TestFileError
tags: [function private test]
```

```Go
func TestFileError(t *testing.T)
```

### <a id="TestFileListener" href="#TestFileListener">func TestFileListener(t *testing.T)</a>

```
searchKey: net.TestFileListener
tags: [function private test]
```

```Go
func TestFileListener(t *testing.T)
```

### <a id="TestFilePacketConn" href="#TestFilePacketConn">func TestFilePacketConn(t *testing.T)</a>

```
searchKey: net.TestFilePacketConn
tags: [function private test]
```

```Go
func TestFilePacketConn(t *testing.T)
```

### <a id="TestGoDebugString" href="#TestGoDebugString">func TestGoDebugString(t *testing.T)</a>

```
searchKey: net.TestGoDebugString
tags: [function private test]
```

```Go
func TestGoDebugString(t *testing.T)
```

### <a id="TestGoLookupIPOrderFallbackToFile" href="#TestGoLookupIPOrderFallbackToFile">func TestGoLookupIPOrderFallbackToFile(t *testing.T)</a>

```
searchKey: net.TestGoLookupIPOrderFallbackToFile
tags: [function private test]
```

```Go
func TestGoLookupIPOrderFallbackToFile(t *testing.T)
```

Test that goLookupIPOrder falls back to the host file when no DNS servers are available. 

### <a id="TestGoLookupIPWithResolverConfig" href="#TestGoLookupIPWithResolverConfig">func TestGoLookupIPWithResolverConfig(t *testing.T)</a>

```
searchKey: net.TestGoLookupIPWithResolverConfig
tags: [function private test]
```

```Go
func TestGoLookupIPWithResolverConfig(t *testing.T)
```

### <a id="TestHostCacheModification" href="#TestHostCacheModification">func TestHostCacheModification(t *testing.T)</a>

```
searchKey: net.TestHostCacheModification
tags: [function private test]
```

```Go
func TestHostCacheModification(t *testing.T)
```

### <a id="TestIPAddrFamily" href="#TestIPAddrFamily">func TestIPAddrFamily(t *testing.T)</a>

```
searchKey: net.TestIPAddrFamily
tags: [function private test]
```

```Go
func TestIPAddrFamily(t *testing.T)
```

### <a id="TestIPAddrScope" href="#TestIPAddrScope">func TestIPAddrScope(t *testing.T)</a>

```
searchKey: net.TestIPAddrScope
tags: [function private test]
```

```Go
func TestIPAddrScope(t *testing.T)
```

### <a id="TestIPConnLocalName" href="#TestIPConnLocalName">func TestIPConnLocalName(t *testing.T)</a>

```
searchKey: net.TestIPConnLocalName
tags: [function private test]
```

```Go
func TestIPConnLocalName(t *testing.T)
```

### <a id="TestIPConnRemoteName" href="#TestIPConnRemoteName">func TestIPConnRemoteName(t *testing.T)</a>

```
searchKey: net.TestIPConnRemoteName
tags: [function private test]
```

```Go
func TestIPConnRemoteName(t *testing.T)
```

### <a id="TestIPConnSpecificMethods" href="#TestIPConnSpecificMethods">func TestIPConnSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestIPConnSpecificMethods
tags: [function private test]
```

```Go
func TestIPConnSpecificMethods(t *testing.T)
```

### <a id="TestIPMask" href="#TestIPMask">func TestIPMask(t *testing.T)</a>

```
searchKey: net.TestIPMask
tags: [function private test]
```

```Go
func TestIPMask(t *testing.T)
```

### <a id="TestIPMaskString" href="#TestIPMaskString">func TestIPMaskString(t *testing.T)</a>

```
searchKey: net.TestIPMaskString
tags: [function private test]
```

```Go
func TestIPMaskString(t *testing.T)
```

### <a id="TestIPNetContains" href="#TestIPNetContains">func TestIPNetContains(t *testing.T)</a>

```
searchKey: net.TestIPNetContains
tags: [function private test]
```

```Go
func TestIPNetContains(t *testing.T)
```

### <a id="TestIPNetString" href="#TestIPNetString">func TestIPNetString(t *testing.T)</a>

```
searchKey: net.TestIPNetString
tags: [function private test]
```

```Go
func TestIPNetString(t *testing.T)
```

### <a id="TestIPString" href="#TestIPString">func TestIPString(t *testing.T)</a>

```
searchKey: net.TestIPString
tags: [function private test]
```

```Go
func TestIPString(t *testing.T)
```

### <a id="TestIPVersion" href="#TestIPVersion">func TestIPVersion(t *testing.T)</a>

```
searchKey: net.TestIPVersion
tags: [function private test]
```

```Go
func TestIPVersion(t *testing.T)
```

### <a id="TestIPv4MulticastListener" href="#TestIPv4MulticastListener">func TestIPv4MulticastListener(t *testing.T)</a>

```
searchKey: net.TestIPv4MulticastListener
tags: [function private test]
```

```Go
func TestIPv4MulticastListener(t *testing.T)
```

TestIPv4MulticastListener tests both single and double listen to a test listener with same address family, same group address and same port. 

### <a id="TestIPv6LinkLocalUnicastTCP" href="#TestIPv6LinkLocalUnicastTCP">func TestIPv6LinkLocalUnicastTCP(t *testing.T)</a>

```
searchKey: net.TestIPv6LinkLocalUnicastTCP
tags: [function private test]
```

```Go
func TestIPv6LinkLocalUnicastTCP(t *testing.T)
```

### <a id="TestIPv6LinkLocalUnicastUDP" href="#TestIPv6LinkLocalUnicastUDP">func TestIPv6LinkLocalUnicastUDP(t *testing.T)</a>

```
searchKey: net.TestIPv6LinkLocalUnicastUDP
tags: [function private test]
```

```Go
func TestIPv6LinkLocalUnicastUDP(t *testing.T)
```

### <a id="TestIPv6MulticastListener" href="#TestIPv6MulticastListener">func TestIPv6MulticastListener(t *testing.T)</a>

```
searchKey: net.TestIPv6MulticastListener
tags: [function private test]
```

```Go
func TestIPv6MulticastListener(t *testing.T)
```

TestIPv6MulticastListener tests both single and double listen to a test listener with same address family, same group address and same port. 

### <a id="TestIgnoreDNSForgeries" href="#TestIgnoreDNSForgeries">func TestIgnoreDNSForgeries(t *testing.T)</a>

```
searchKey: net.TestIgnoreDNSForgeries
tags: [function private test]
```

```Go
func TestIgnoreDNSForgeries(t *testing.T)
```

UDP round-tripper algorithm should ignore invalid DNS responses (issue 13281). 

### <a id="TestIgnoreLameReferrals" href="#TestIgnoreLameReferrals">func TestIgnoreLameReferrals(t *testing.T)</a>

```
searchKey: net.TestIgnoreLameReferrals
tags: [function private test]
```

```Go
func TestIgnoreLameReferrals(t *testing.T)
```

Issue 15434. If a name server gives a lame referral, continue to the next. 

### <a id="TestInterfaceAddrs" href="#TestInterfaceAddrs">func TestInterfaceAddrs(t *testing.T)</a>

```
searchKey: net.TestInterfaceAddrs
tags: [function private test]
```

```Go
func TestInterfaceAddrs(t *testing.T)
```

### <a id="TestInterfaceArrivalAndDeparture" href="#TestInterfaceArrivalAndDeparture">func TestInterfaceArrivalAndDeparture(t *testing.T)</a>

```
searchKey: net.TestInterfaceArrivalAndDeparture
tags: [function private test]
```

```Go
func TestInterfaceArrivalAndDeparture(t *testing.T)
```

### <a id="TestInterfaceArrivalAndDepartureZoneCache" href="#TestInterfaceArrivalAndDepartureZoneCache">func TestInterfaceArrivalAndDepartureZoneCache(t *testing.T)</a>

```
searchKey: net.TestInterfaceArrivalAndDepartureZoneCache
tags: [function private test]
```

```Go
func TestInterfaceArrivalAndDepartureZoneCache(t *testing.T)
```

### <a id="TestInterfaceMulticastAddrs" href="#TestInterfaceMulticastAddrs">func TestInterfaceMulticastAddrs(t *testing.T)</a>

```
searchKey: net.TestInterfaceMulticastAddrs
tags: [function private test]
```

```Go
func TestInterfaceMulticastAddrs(t *testing.T)
```

### <a id="TestInterfaceUnicastAddrs" href="#TestInterfaceUnicastAddrs">func TestInterfaceUnicastAddrs(t *testing.T)</a>

```
searchKey: net.TestInterfaceUnicastAddrs
tags: [function private test]
```

```Go
func TestInterfaceUnicastAddrs(t *testing.T)
```

### <a id="TestInterfaces" href="#TestInterfaces">func TestInterfaces(t *testing.T)</a>

```
searchKey: net.TestInterfaces
tags: [function private test]
```

```Go
func TestInterfaces(t *testing.T)
```

### <a id="TestIssue8434" href="#TestIssue8434">func TestIssue8434(t *testing.T)</a>

```
searchKey: net.TestIssue8434
tags: [function private test]
```

```Go
func TestIssue8434(t *testing.T)
```

Issue 8434: verify that Temporary returns true on an error when rcode is SERVFAIL 

### <a id="TestIssueNoSuchHostExists" href="#TestIssueNoSuchHostExists">func TestIssueNoSuchHostExists(t *testing.T)</a>

```
searchKey: net.TestIssueNoSuchHostExists
tags: [function private test]
```

```Go
func TestIssueNoSuchHostExists(t *testing.T)
```

### <a id="TestJoinHostPort" href="#TestJoinHostPort">func TestJoinHostPort(t *testing.T)</a>

```
searchKey: net.TestJoinHostPort
tags: [function private test]
```

```Go
func TestJoinHostPort(t *testing.T)
```

### <a id="TestListenCloseListen" href="#TestListenCloseListen">func TestListenCloseListen(t *testing.T)</a>

```
searchKey: net.TestListenCloseListen
tags: [function private test]
```

```Go
func TestListenCloseListen(t *testing.T)
```

### <a id="TestListenConfigControl" href="#TestListenConfigControl">func TestListenConfigControl(t *testing.T)</a>

```
searchKey: net.TestListenConfigControl
tags: [function private test]
```

```Go
func TestListenConfigControl(t *testing.T)
```

### <a id="TestListenError" href="#TestListenError">func TestListenError(t *testing.T)</a>

```
searchKey: net.TestListenError
tags: [function private test]
```

```Go
func TestListenError(t *testing.T)
```

### <a id="TestListenPacketError" href="#TestListenPacketError">func TestListenPacketError(t *testing.T)</a>

```
searchKey: net.TestListenPacketError
tags: [function private test]
```

```Go
func TestListenPacketError(t *testing.T)
```

### <a id="TestListenerClose" href="#TestListenerClose">func TestListenerClose(t *testing.T)</a>

```
searchKey: net.TestListenerClose
tags: [function private test]
```

```Go
func TestListenerClose(t *testing.T)
```

### <a id="TestLookupCNAME" href="#TestLookupCNAME">func TestLookupCNAME(t *testing.T)</a>

```
searchKey: net.TestLookupCNAME
tags: [function private test]
```

```Go
func TestLookupCNAME(t *testing.T)
```

### <a id="TestLookupContextCancel" href="#TestLookupContextCancel">func TestLookupContextCancel(t *testing.T)</a>

```
searchKey: net.TestLookupContextCancel
tags: [function private test]
```

```Go
func TestLookupContextCancel(t *testing.T)
```

### <a id="TestLookupDotsWithLocalSource" href="#TestLookupDotsWithLocalSource">func TestLookupDotsWithLocalSource(t *testing.T)</a>

```
searchKey: net.TestLookupDotsWithLocalSource
tags: [function private test]
```

```Go
func TestLookupDotsWithLocalSource(t *testing.T)
```

### <a id="TestLookupDotsWithRemoteSource" href="#TestLookupDotsWithRemoteSource">func TestLookupDotsWithRemoteSource(t *testing.T)</a>

```
searchKey: net.TestLookupDotsWithRemoteSource
tags: [function private test]
```

```Go
func TestLookupDotsWithRemoteSource(t *testing.T)
```

### <a id="TestLookupGmailMX" href="#TestLookupGmailMX">func TestLookupGmailMX(t *testing.T)</a>

```
searchKey: net.TestLookupGmailMX
tags: [function private test]
```

```Go
func TestLookupGmailMX(t *testing.T)
```

### <a id="TestLookupGmailNS" href="#TestLookupGmailNS">func TestLookupGmailNS(t *testing.T)</a>

```
searchKey: net.TestLookupGmailNS
tags: [function private test]
```

```Go
func TestLookupGmailNS(t *testing.T)
```

### <a id="TestLookupGmailTXT" href="#TestLookupGmailTXT">func TestLookupGmailTXT(t *testing.T)</a>

```
searchKey: net.TestLookupGmailTXT
tags: [function private test]
```

```Go
func TestLookupGmailTXT(t *testing.T)
```

### <a id="TestLookupGoogleHost" href="#TestLookupGoogleHost">func TestLookupGoogleHost(t *testing.T)</a>

```
searchKey: net.TestLookupGoogleHost
tags: [function private test]
```

```Go
func TestLookupGoogleHost(t *testing.T)
```

### <a id="TestLookupGoogleIP" href="#TestLookupGoogleIP">func TestLookupGoogleIP(t *testing.T)</a>

```
searchKey: net.TestLookupGoogleIP
tags: [function private test]
```

```Go
func TestLookupGoogleIP(t *testing.T)
```

### <a id="TestLookupGooglePublicDNSAddr" href="#TestLookupGooglePublicDNSAddr">func TestLookupGooglePublicDNSAddr(t *testing.T)</a>

```
searchKey: net.TestLookupGooglePublicDNSAddr
tags: [function private test]
```

```Go
func TestLookupGooglePublicDNSAddr(t *testing.T)
```

### <a id="TestLookupGoogleSRV" href="#TestLookupGoogleSRV">func TestLookupGoogleSRV(t *testing.T)</a>

```
searchKey: net.TestLookupGoogleSRV
tags: [function private test]
```

```Go
func TestLookupGoogleSRV(t *testing.T)
```

### <a id="TestLookupHostCancel" href="#TestLookupHostCancel">func TestLookupHostCancel(t *testing.T)</a>

```
searchKey: net.TestLookupHostCancel
tags: [function private test]
```

```Go
func TestLookupHostCancel(t *testing.T)
```

TestLookupHostCancel verifies that lookup works even after many canceled lookups (see golang.org/issue/24178 for details). 

### <a id="TestLookupIPAddrConcurrentCallsForNetworks" href="#TestLookupIPAddrConcurrentCallsForNetworks">func TestLookupIPAddrConcurrentCallsForNetworks(t *testing.T)</a>

```
searchKey: net.TestLookupIPAddrConcurrentCallsForNetworks
tags: [function private test]
```

```Go
func TestLookupIPAddrConcurrentCallsForNetworks(t *testing.T)
```

Issue 30521: The lookup group should call the resolver for each network. 

### <a id="TestLookupIPAddrPreservesContextValues" href="#TestLookupIPAddrPreservesContextValues">func TestLookupIPAddrPreservesContextValues(t *testing.T)</a>

```
searchKey: net.TestLookupIPAddrPreservesContextValues
tags: [function private test]
```

```Go
func TestLookupIPAddrPreservesContextValues(t *testing.T)
```

Issue 28600: The context that is used to lookup ips should always preserve the values from the context that was passed into LookupIPAddr. 

### <a id="TestLookupIPv6LinkLocalAddr" href="#TestLookupIPv6LinkLocalAddr">func TestLookupIPv6LinkLocalAddr(t *testing.T)</a>

```
searchKey: net.TestLookupIPv6LinkLocalAddr
tags: [function private test]
```

```Go
func TestLookupIPv6LinkLocalAddr(t *testing.T)
```

### <a id="TestLookupIPv6LinkLocalAddrWithZone" href="#TestLookupIPv6LinkLocalAddrWithZone">func TestLookupIPv6LinkLocalAddrWithZone(t *testing.T)</a>

```
searchKey: net.TestLookupIPv6LinkLocalAddrWithZone
tags: [function private test]
```

```Go
func TestLookupIPv6LinkLocalAddrWithZone(t *testing.T)
```

### <a id="TestLookupLongTXT" href="#TestLookupLongTXT">func TestLookupLongTXT(t *testing.T)</a>

```
searchKey: net.TestLookupLongTXT
tags: [function private test]
```

```Go
func TestLookupLongTXT(t *testing.T)
```

### <a id="TestLookupNonLDH" href="#TestLookupNonLDH">func TestLookupNonLDH(t *testing.T)</a>

```
searchKey: net.TestLookupNonLDH
tags: [function private test]
```

```Go
func TestLookupNonLDH(t *testing.T)
```

### <a id="TestLookupNullByte" href="#TestLookupNullByte">func TestLookupNullByte(t *testing.T)</a>

```
searchKey: net.TestLookupNullByte
tags: [function private test]
```

```Go
func TestLookupNullByte(t *testing.T)
```

Issue 31597: don't panic on null byte in name 

### <a id="TestLookupPort" href="#TestLookupPort">func TestLookupPort(t *testing.T)</a>

```
searchKey: net.TestLookupPort
tags: [function private test]
```

```Go
func TestLookupPort(t *testing.T)
```

### <a id="TestLookupPort_Minimal" href="#TestLookupPort_Minimal">func TestLookupPort_Minimal(t *testing.T)</a>

```
searchKey: net.TestLookupPort_Minimal
tags: [function private test]
```

```Go
func TestLookupPort_Minimal(t *testing.T)
```

Like TestLookupPort but with minimal tests that should always pass because the answers are baked-in to the net package. 

### <a id="TestLookupProtocol_Minimal" href="#TestLookupProtocol_Minimal">func TestLookupProtocol_Minimal(t *testing.T)</a>

```
searchKey: net.TestLookupProtocol_Minimal
tags: [function private test]
```

```Go
func TestLookupProtocol_Minimal(t *testing.T)
```

### <a id="TestLookupStaticAddr" href="#TestLookupStaticAddr">func TestLookupStaticAddr(t *testing.T)</a>

```
searchKey: net.TestLookupStaticAddr
tags: [function private test]
```

```Go
func TestLookupStaticAddr(t *testing.T)
```

### <a id="TestLookupStaticHost" href="#TestLookupStaticHost">func TestLookupStaticHost(t *testing.T)</a>

```
searchKey: net.TestLookupStaticHost
tags: [function private test]
```

```Go
func TestLookupStaticHost(t *testing.T)
```

### <a id="TestLookupTorOnion" href="#TestLookupTorOnion">func TestLookupTorOnion(t *testing.T)</a>

```
searchKey: net.TestLookupTorOnion
tags: [function private test]
```

```Go
func TestLookupTorOnion(t *testing.T)
```

Issue 13705: don't try to resolve onion addresses, etc 

### <a id="TestLookupWithIP" href="#TestLookupWithIP">func TestLookupWithIP(t *testing.T)</a>

```
searchKey: net.TestLookupWithIP
tags: [function private test]
```

```Go
func TestLookupWithIP(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: net.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestMarshalEmptyIP" href="#TestMarshalEmptyIP">func TestMarshalEmptyIP(t *testing.T)</a>

```
searchKey: net.TestMarshalEmptyIP
tags: [function private test]
```

```Go
func TestMarshalEmptyIP(t *testing.T)
```

Issue 6339 

### <a id="TestNetworkNumberAndMask" href="#TestNetworkNumberAndMask">func TestNetworkNumberAndMask(t *testing.T)</a>

```
searchKey: net.TestNetworkNumberAndMask
tags: [function private test]
```

```Go
func TestNetworkNumberAndMask(t *testing.T)
```

### <a id="TestNilResolverLookup" href="#TestNilResolverLookup">func TestNilResolverLookup(t *testing.T)</a>

```
searchKey: net.TestNilResolverLookup
tags: [function private test]
```

```Go
func TestNilResolverLookup(t *testing.T)
```

Issue 24330: treat the nil *Resolver like a zero value. Verify nothing crashes if nil is used. 

### <a id="TestNoSuchHost" href="#TestNoSuchHost">func TestNoSuchHost(t *testing.T)</a>

```
searchKey: net.TestNoSuchHost
tags: [function private test]
```

```Go
func TestNoSuchHost(t *testing.T)
```

TestNoSuchHost verifies that tryOneName works correctly when the domain does not exist. 

Issue 12778: verify that NXDOMAIN without RA bit errors as "no such host" and not "server misbehaving" 

Issue 25336: verify that NXDOMAIN errors fail fast. 

Issue 27525: verify that empty answers fail fast. 

### <a id="TestNotTemporaryRead" href="#TestNotTemporaryRead">func TestNotTemporaryRead(t *testing.T)</a>

```
searchKey: net.TestNotTemporaryRead
tags: [function private test]
```

```Go
func TestNotTemporaryRead(t *testing.T)
```

Issue 24808: verify that ECONNRESET is not temporary for read. 

### <a id="TestPTRandNonPTR" href="#TestPTRandNonPTR">func TestPTRandNonPTR(t *testing.T)</a>

```
searchKey: net.TestPTRandNonPTR
tags: [function private test]
```

```Go
func TestPTRandNonPTR(t *testing.T)
```

Issue 34660: PTR response with non-PTR answers should ignore non-PTR 

### <a id="TestPacketConn" href="#TestPacketConn">func TestPacketConn(t *testing.T)</a>

```
searchKey: net.TestPacketConn
tags: [function private test]
```

```Go
func TestPacketConn(t *testing.T)
```

### <a id="TestPacketConnClose" href="#TestPacketConnClose">func TestPacketConnClose(t *testing.T)</a>

```
searchKey: net.TestPacketConnClose
tags: [function private test]
```

```Go
func TestPacketConnClose(t *testing.T)
```

### <a id="TestParseCIDR" href="#TestParseCIDR">func TestParseCIDR(t *testing.T)</a>

```
searchKey: net.TestParseCIDR
tags: [function private test]
```

```Go
func TestParseCIDR(t *testing.T)
```

### <a id="TestParseIP" href="#TestParseIP">func TestParseIP(t *testing.T)</a>

```
searchKey: net.TestParseIP
tags: [function private test]
```

```Go
func TestParseIP(t *testing.T)
```

### <a id="TestParseMAC" href="#TestParseMAC">func TestParseMAC(t *testing.T)</a>

```
searchKey: net.TestParseMAC
tags: [function private test]
```

```Go
func TestParseMAC(t *testing.T)
```

### <a id="TestParseNSSConf" href="#TestParseNSSConf">func TestParseNSSConf(t *testing.T)</a>

```
searchKey: net.TestParseNSSConf
tags: [function private test]
```

```Go
func TestParseNSSConf(t *testing.T)
```

### <a id="TestParsePort" href="#TestParsePort">func TestParsePort(t *testing.T)</a>

```
searchKey: net.TestParsePort
tags: [function private test]
```

```Go
func TestParsePort(t *testing.T)
```

### <a id="TestPointToPointInterface" href="#TestPointToPointInterface">func TestPointToPointInterface(t *testing.T)</a>

```
searchKey: net.TestPointToPointInterface
tags: [function private test]
```

```Go
func TestPointToPointInterface(t *testing.T)
```

### <a id="TestProhibitionaryDialArg" href="#TestProhibitionaryDialArg">func TestProhibitionaryDialArg(t *testing.T)</a>

```
searchKey: net.TestProhibitionaryDialArg
tags: [function private test]
```

```Go
func TestProhibitionaryDialArg(t *testing.T)
```

### <a id="TestProtocolDialError" href="#TestProtocolDialError">func TestProtocolDialError(t *testing.T)</a>

```
searchKey: net.TestProtocolDialError
tags: [function private test]
```

```Go
func TestProtocolDialError(t *testing.T)
```

### <a id="TestProtocolListenError" href="#TestProtocolListenError">func TestProtocolListenError(t *testing.T)</a>

```
searchKey: net.TestProtocolListenError
tags: [function private test]
```

```Go
func TestProtocolListenError(t *testing.T)
```

### <a id="TestRFC6724ClassifyScope" href="#TestRFC6724ClassifyScope">func TestRFC6724ClassifyScope(t *testing.T)</a>

```
searchKey: net.TestRFC6724ClassifyScope
tags: [function private test]
```

```Go
func TestRFC6724ClassifyScope(t *testing.T)
```

### <a id="TestRFC6724CommonPrefixLength" href="#TestRFC6724CommonPrefixLength">func TestRFC6724CommonPrefixLength(t *testing.T)</a>

```
searchKey: net.TestRFC6724CommonPrefixLength
tags: [function private test]
```

```Go
func TestRFC6724CommonPrefixLength(t *testing.T)
```

### <a id="TestRFC6724PolicyTableClassify" href="#TestRFC6724PolicyTableClassify">func TestRFC6724PolicyTableClassify(t *testing.T)</a>

```
searchKey: net.TestRFC6724PolicyTableClassify
tags: [function private test]
```

```Go
func TestRFC6724PolicyTableClassify(t *testing.T)
```

### <a id="TestRawConnControl" href="#TestRawConnControl">func TestRawConnControl(t *testing.T)</a>

```
searchKey: net.TestRawConnControl
tags: [function private test]
```

```Go
func TestRawConnControl(t *testing.T)
```

### <a id="TestRawConnReadWrite" href="#TestRawConnReadWrite">func TestRawConnReadWrite(t *testing.T)</a>

```
searchKey: net.TestRawConnReadWrite
tags: [function private test]
```

```Go
func TestRawConnReadWrite(t *testing.T)
```

### <a id="TestReadFromTimeout" href="#TestReadFromTimeout">func TestReadFromTimeout(t *testing.T)</a>

```
searchKey: net.TestReadFromTimeout
tags: [function private test]
```

```Go
func TestReadFromTimeout(t *testing.T)
```

### <a id="TestReadFromTimeoutFluctuation" href="#TestReadFromTimeoutFluctuation">func TestReadFromTimeoutFluctuation(t *testing.T)</a>

```
searchKey: net.TestReadFromTimeoutFluctuation
tags: [function private test]
```

```Go
func TestReadFromTimeoutFluctuation(t *testing.T)
```

### <a id="TestReadLine" href="#TestReadLine">func TestReadLine(t *testing.T)</a>

```
searchKey: net.TestReadLine
tags: [function private test]
```

```Go
func TestReadLine(t *testing.T)
```

### <a id="TestReadTimeout" href="#TestReadTimeout">func TestReadTimeout(t *testing.T)</a>

```
searchKey: net.TestReadTimeout
tags: [function private test]
```

```Go
func TestReadTimeout(t *testing.T)
```

### <a id="TestReadTimeoutFluctuation" href="#TestReadTimeoutFluctuation">func TestReadTimeoutFluctuation(t *testing.T)</a>

```
searchKey: net.TestReadTimeoutFluctuation
tags: [function private test]
```

```Go
func TestReadTimeoutFluctuation(t *testing.T)
```

### <a id="TestReadTimeoutMustNotReturn" href="#TestReadTimeoutMustNotReturn">func TestReadTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: net.TestReadTimeoutMustNotReturn
tags: [function private test]
```

```Go
func TestReadTimeoutMustNotReturn(t *testing.T)
```

### <a id="TestReadTimeoutUnblocksRead" href="#TestReadTimeoutUnblocksRead">func TestReadTimeoutUnblocksRead(t *testing.T)</a>

```
searchKey: net.TestReadTimeoutUnblocksRead
tags: [function private test]
```

```Go
func TestReadTimeoutUnblocksRead(t *testing.T)
```

Tests that a blocked Read is interrupted by a concurrent SetReadDeadline modifying that Conn's read deadline to the past. See golang.org/cl/30164 which documented this. The net/http package depends on this. 

### <a id="TestReadUnixgramWithUnnamedSocket" href="#TestReadUnixgramWithUnnamedSocket">func TestReadUnixgramWithUnnamedSocket(t *testing.T)</a>

```
searchKey: net.TestReadUnixgramWithUnnamedSocket
tags: [function private test]
```

```Go
func TestReadUnixgramWithUnnamedSocket(t *testing.T)
```

### <a id="TestReadWriteDeadlineRace" href="#TestReadWriteDeadlineRace">func TestReadWriteDeadlineRace(t *testing.T)</a>

```
searchKey: net.TestReadWriteDeadlineRace
tags: [function private test]
```

```Go
func TestReadWriteDeadlineRace(t *testing.T)
```

### <a id="TestReadWriteProlongedTimeout" href="#TestReadWriteProlongedTimeout">func TestReadWriteProlongedTimeout(t *testing.T)</a>

```
searchKey: net.TestReadWriteProlongedTimeout
tags: [function private test]
```

```Go
func TestReadWriteProlongedTimeout(t *testing.T)
```

TestReadWriteProlongedTimeout tests concurrent deadline modification. Known to cause data races in the past. 

### <a id="TestResolveGoogle" href="#TestResolveGoogle">func TestResolveGoogle(t *testing.T)</a>

```
searchKey: net.TestResolveGoogle
tags: [function private test]
```

```Go
func TestResolveGoogle(t *testing.T)
```

### <a id="TestResolveIPAddr" href="#TestResolveIPAddr">func TestResolveIPAddr(t *testing.T)</a>

```
searchKey: net.TestResolveIPAddr
tags: [function private test]
```

```Go
func TestResolveIPAddr(t *testing.T)
```

### <a id="TestResolveTCPAddr" href="#TestResolveTCPAddr">func TestResolveTCPAddr(t *testing.T)</a>

```
searchKey: net.TestResolveTCPAddr
tags: [function private test]
```

```Go
func TestResolveTCPAddr(t *testing.T)
```

### <a id="TestResolveUDPAddr" href="#TestResolveUDPAddr">func TestResolveUDPAddr(t *testing.T)</a>

```
searchKey: net.TestResolveUDPAddr
tags: [function private test]
```

```Go
func TestResolveUDPAddr(t *testing.T)
```

### <a id="TestResolverLookupIP" href="#TestResolverLookupIP">func TestResolverLookupIP(t *testing.T)</a>

```
searchKey: net.TestResolverLookupIP
tags: [function private test]
```

```Go
func TestResolverLookupIP(t *testing.T)
```

### <a id="TestRetryTimeout" href="#TestRetryTimeout">func TestRetryTimeout(t *testing.T)</a>

```
searchKey: net.TestRetryTimeout
tags: [function private test]
```

```Go
func TestRetryTimeout(t *testing.T)
```

Issue 16865. If a name server times out, continue to the next. 

### <a id="TestReverseAddress" href="#TestReverseAddress">func TestReverseAddress(t *testing.T)</a>

```
searchKey: net.TestReverseAddress
tags: [function private test]
```

```Go
func TestReverseAddress(t *testing.T)
```

### <a id="TestRotate" href="#TestRotate">func TestRotate(t *testing.T)</a>

```
searchKey: net.TestRotate
tags: [function private test]
```

```Go
func TestRotate(t *testing.T)
```

### <a id="TestSendfile" href="#TestSendfile">func TestSendfile(t *testing.T)</a>

```
searchKey: net.TestSendfile
tags: [function private test]
```

```Go
func TestSendfile(t *testing.T)
```

### <a id="TestSendfileOnWriteTimeoutExceeded" href="#TestSendfileOnWriteTimeoutExceeded">func TestSendfileOnWriteTimeoutExceeded(t *testing.T)</a>

```
searchKey: net.TestSendfileOnWriteTimeoutExceeded
tags: [function private test]
```

```Go
func TestSendfileOnWriteTimeoutExceeded(t *testing.T)
```

Issue 43822: tests that returns EOF when conn write timeout. 

### <a id="TestSendfileParts" href="#TestSendfileParts">func TestSendfileParts(t *testing.T)</a>

```
searchKey: net.TestSendfileParts
tags: [function private test]
```

```Go
func TestSendfileParts(t *testing.T)
```

### <a id="TestSendfilePipe" href="#TestSendfilePipe">func TestSendfilePipe(t *testing.T)</a>

```
searchKey: net.TestSendfilePipe
tags: [function private test]
```

```Go
func TestSendfilePipe(t *testing.T)
```

Test that sendfile doesn't put a pipe into blocking mode. 

### <a id="TestSendfileSeeked" href="#TestSendfileSeeked">func TestSendfileSeeked(t *testing.T)</a>

```
searchKey: net.TestSendfileSeeked
tags: [function private test]
```

```Go
func TestSendfileSeeked(t *testing.T)
```

### <a id="TestSingleRequestLookup" href="#TestSingleRequestLookup">func TestSingleRequestLookup(t *testing.T)</a>

```
searchKey: net.TestSingleRequestLookup
tags: [function private test]
```

```Go
func TestSingleRequestLookup(t *testing.T)
```

Issue 29644: support single-request resolv.conf option in pure Go resolver. The A and AAAA queries will be sent sequentially, not in parallel. 

### <a id="TestSortByRFC6724" href="#TestSortByRFC6724">func TestSortByRFC6724(t *testing.T)</a>

```
searchKey: net.TestSortByRFC6724
tags: [function private test]
```

```Go
func TestSortByRFC6724(t *testing.T)
```

### <a id="TestSpecialDomainName" href="#TestSpecialDomainName">func TestSpecialDomainName(t *testing.T)</a>

```
searchKey: net.TestSpecialDomainName
tags: [function private test]
```

```Go
func TestSpecialDomainName(t *testing.T)
```

### <a id="TestSplitHostPort" href="#TestSplitHostPort">func TestSplitHostPort(t *testing.T)</a>

```
searchKey: net.TestSplitHostPort
tags: [function private test]
```

```Go
func TestSplitHostPort(t *testing.T)
```

### <a id="TestSpuriousENOTAVAIL" href="#TestSpuriousENOTAVAIL">func TestSpuriousENOTAVAIL(t *testing.T)</a>

```
searchKey: net.TestSpuriousENOTAVAIL
tags: [function private test]
```

```Go
func TestSpuriousENOTAVAIL(t *testing.T)
```

### <a id="TestStrictErrorsLookupIP" href="#TestStrictErrorsLookupIP">func TestStrictErrorsLookupIP(t *testing.T)</a>

```
searchKey: net.TestStrictErrorsLookupIP
tags: [function private test]
```

```Go
func TestStrictErrorsLookupIP(t *testing.T)
```

Issue 17448. With StrictErrors enabled, temporary errors should make LookupIP fail rather than return a partial result. 

### <a id="TestStrictErrorsLookupTXT" href="#TestStrictErrorsLookupTXT">func TestStrictErrorsLookupTXT(t *testing.T)</a>

```
searchKey: net.TestStrictErrorsLookupTXT
tags: [function private test]
```

```Go
func TestStrictErrorsLookupTXT(t *testing.T)
```

Issue 17448. With StrictErrors enabled, temporary errors should make LookupTXT stop walking the search list. 

### <a id="TestSystemConf" href="#TestSystemConf">func TestSystemConf(t *testing.T)</a>

```
searchKey: net.TestSystemConf
tags: [function private test]
```

```Go
func TestSystemConf(t *testing.T)
```

### <a id="TestTCPBig" href="#TestTCPBig">func TestTCPBig(t *testing.T)</a>

```
searchKey: net.TestTCPBig
tags: [function private test]
```

```Go
func TestTCPBig(t *testing.T)
```

Test that >32-bit reads work on 64-bit systems. On 32-bit systems this tests that maxint reads work. 

### <a id="TestTCPConcurrentAccept" href="#TestTCPConcurrentAccept">func TestTCPConcurrentAccept(t *testing.T)</a>

```
searchKey: net.TestTCPConcurrentAccept
tags: [function private test]
```

```Go
func TestTCPConcurrentAccept(t *testing.T)
```

### <a id="TestTCPConnSpecificMethods" href="#TestTCPConnSpecificMethods">func TestTCPConnSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestTCPConnSpecificMethods
tags: [function private test]
```

```Go
func TestTCPConnSpecificMethods(t *testing.T)
```

### <a id="TestTCPListener" href="#TestTCPListener">func TestTCPListener(t *testing.T)</a>

```
searchKey: net.TestTCPListener
tags: [function private test]
```

```Go
func TestTCPListener(t *testing.T)
```

TestTCPListener tests both single and double listen to a test listener with same address family, same listening address and same port. 

### <a id="TestTCPListenerName" href="#TestTCPListenerName">func TestTCPListenerName(t *testing.T)</a>

```
searchKey: net.TestTCPListenerName
tags: [function private test]
```

```Go
func TestTCPListenerName(t *testing.T)
```

### <a id="TestTCPListenerSpecificMethods" href="#TestTCPListenerSpecificMethods">func TestTCPListenerSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestTCPListenerSpecificMethods
tags: [function private test]
```

```Go
func TestTCPListenerSpecificMethods(t *testing.T)
```

### <a id="TestTCPReadWriteAllocs" href="#TestTCPReadWriteAllocs">func TestTCPReadWriteAllocs(t *testing.T)</a>

```
searchKey: net.TestTCPReadWriteAllocs
tags: [function private test]
```

```Go
func TestTCPReadWriteAllocs(t *testing.T)
```

### <a id="TestTCPSelfConnect" href="#TestTCPSelfConnect">func TestTCPSelfConnect(t *testing.T)</a>

```
searchKey: net.TestTCPSelfConnect
tags: [function private test]
```

```Go
func TestTCPSelfConnect(t *testing.T)
```

### <a id="TestTCPServer" href="#TestTCPServer">func TestTCPServer(t *testing.T)</a>

```
searchKey: net.TestTCPServer
tags: [function private test]
```

```Go
func TestTCPServer(t *testing.T)
```

TestTCPServer tests concurrent accept-read-write servers. 

### <a id="TestTCPSpuriousConnSetupCompletion" href="#TestTCPSpuriousConnSetupCompletion">func TestTCPSpuriousConnSetupCompletion(t *testing.T)</a>

```
searchKey: net.TestTCPSpuriousConnSetupCompletion
tags: [function private test]
```

```Go
func TestTCPSpuriousConnSetupCompletion(t *testing.T)
```

See golang.org/issue/14548. 

### <a id="TestTCPSpuriousConnSetupCompletionWithCancel" href="#TestTCPSpuriousConnSetupCompletionWithCancel">func TestTCPSpuriousConnSetupCompletionWithCancel(t *testing.T)</a>

```
searchKey: net.TestTCPSpuriousConnSetupCompletionWithCancel
tags: [function private test]
```

```Go
func TestTCPSpuriousConnSetupCompletionWithCancel(t *testing.T)
```

Issue 19289. Test that a canceled Dial does not cause a subsequent Dial to succeed. 

### <a id="TestTCPStress" href="#TestTCPStress">func TestTCPStress(t *testing.T)</a>

```
searchKey: net.TestTCPStress
tags: [function private test]
```

```Go
func TestTCPStress(t *testing.T)
```

### <a id="TestTXTRecordTwoStrings" href="#TestTXTRecordTwoStrings">func TestTXTRecordTwoStrings(t *testing.T)</a>

```
searchKey: net.TestTXTRecordTwoStrings
tags: [function private test]
```

```Go
func TestTXTRecordTwoStrings(t *testing.T)
```

Issue 27763: verify that two strings in one TXT record are concatenated. 

### <a id="TestUDPConnLocalAndRemoteNames" href="#TestUDPConnLocalAndRemoteNames">func TestUDPConnLocalAndRemoteNames(t *testing.T)</a>

```
searchKey: net.TestUDPConnLocalAndRemoteNames
tags: [function private test]
```

```Go
func TestUDPConnLocalAndRemoteNames(t *testing.T)
```

### <a id="TestUDPConnLocalName" href="#TestUDPConnLocalName">func TestUDPConnLocalName(t *testing.T)</a>

```
searchKey: net.TestUDPConnLocalName
tags: [function private test]
```

```Go
func TestUDPConnLocalName(t *testing.T)
```

### <a id="TestUDPConnSpecificMethods" href="#TestUDPConnSpecificMethods">func TestUDPConnSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestUDPConnSpecificMethods
tags: [function private test]
```

```Go
func TestUDPConnSpecificMethods(t *testing.T)
```

### <a id="TestUDPListener" href="#TestUDPListener">func TestUDPListener(t *testing.T)</a>

```
searchKey: net.TestUDPListener
tags: [function private test]
```

```Go
func TestUDPListener(t *testing.T)
```

TestUDPListener tests both single and double listen to a test listener with same address family, same listening address and same port. 

### <a id="TestUDPReadSizeError" href="#TestUDPReadSizeError">func TestUDPReadSizeError(t *testing.T)</a>

```
searchKey: net.TestUDPReadSizeError
tags: [function private test]
```

```Go
func TestUDPReadSizeError(t *testing.T)
```

### <a id="TestUDPReadTimeout" href="#TestUDPReadTimeout">func TestUDPReadTimeout(t *testing.T)</a>

```
searchKey: net.TestUDPReadTimeout
tags: [function private test]
```

```Go
func TestUDPReadTimeout(t *testing.T)
```

TestUDPReadTimeout verifies that ReadFromUDP with timeout returns an error without data or an address. 

### <a id="TestUDPServer" href="#TestUDPServer">func TestUDPServer(t *testing.T)</a>

```
searchKey: net.TestUDPServer
tags: [function private test]
```

```Go
func TestUDPServer(t *testing.T)
```

### <a id="TestUDPZeroByteBuffer" href="#TestUDPZeroByteBuffer">func TestUDPZeroByteBuffer(t *testing.T)</a>

```
searchKey: net.TestUDPZeroByteBuffer
tags: [function private test]
```

```Go
func TestUDPZeroByteBuffer(t *testing.T)
```

### <a id="TestUDPZeroBytePayload" href="#TestUDPZeroBytePayload">func TestUDPZeroBytePayload(t *testing.T)</a>

```
searchKey: net.TestUDPZeroBytePayload
tags: [function private test]
```

```Go
func TestUDPZeroBytePayload(t *testing.T)
```

### <a id="TestUnixAndUnixpacketServer" href="#TestUnixAndUnixpacketServer">func TestUnixAndUnixpacketServer(t *testing.T)</a>

```
searchKey: net.TestUnixAndUnixpacketServer
tags: [function private test]
```

```Go
func TestUnixAndUnixpacketServer(t *testing.T)
```

TestUnixAndUnixpacketServer tests concurrent accept-read-write servers 

### <a id="TestUnixConnLocalAndRemoteNames" href="#TestUnixConnLocalAndRemoteNames">func TestUnixConnLocalAndRemoteNames(t *testing.T)</a>

```
searchKey: net.TestUnixConnLocalAndRemoteNames
tags: [function private test]
```

```Go
func TestUnixConnLocalAndRemoteNames(t *testing.T)
```

### <a id="TestUnixConnReadMsgUnixSCMRightsCloseOnExec" href="#TestUnixConnReadMsgUnixSCMRightsCloseOnExec">func TestUnixConnReadMsgUnixSCMRightsCloseOnExec(t *testing.T)</a>

```
searchKey: net.TestUnixConnReadMsgUnixSCMRightsCloseOnExec
tags: [function private test]
```

```Go
func TestUnixConnReadMsgUnixSCMRightsCloseOnExec(t *testing.T)
```

### <a id="TestUnixConnSpecificMethods" href="#TestUnixConnSpecificMethods">func TestUnixConnSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestUnixConnSpecificMethods
tags: [function private test]
```

```Go
func TestUnixConnSpecificMethods(t *testing.T)
```

### <a id="TestUnixListenerSpecificMethods" href="#TestUnixListenerSpecificMethods">func TestUnixListenerSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestUnixListenerSpecificMethods
tags: [function private test]
```

```Go
func TestUnixListenerSpecificMethods(t *testing.T)
```

### <a id="TestUnixUnlink" href="#TestUnixUnlink">func TestUnixUnlink(t *testing.T)</a>

```
searchKey: net.TestUnixUnlink
tags: [function private test]
```

```Go
func TestUnixUnlink(t *testing.T)
```

### <a id="TestUnixgramConnLocalAndRemoteNames" href="#TestUnixgramConnLocalAndRemoteNames">func TestUnixgramConnLocalAndRemoteNames(t *testing.T)</a>

```
searchKey: net.TestUnixgramConnLocalAndRemoteNames
tags: [function private test]
```

```Go
func TestUnixgramConnLocalAndRemoteNames(t *testing.T)
```

### <a id="TestUnixgramServer" href="#TestUnixgramServer">func TestUnixgramServer(t *testing.T)</a>

```
searchKey: net.TestUnixgramServer
tags: [function private test]
```

```Go
func TestUnixgramServer(t *testing.T)
```

### <a id="TestUnixgramWrite" href="#TestUnixgramWrite">func TestUnixgramWrite(t *testing.T)</a>

```
searchKey: net.TestUnixgramWrite
tags: [function private test]
```

```Go
func TestUnixgramWrite(t *testing.T)
```

### <a id="TestUnixgramZeroByteBuffer" href="#TestUnixgramZeroByteBuffer">func TestUnixgramZeroByteBuffer(t *testing.T)</a>

```
searchKey: net.TestUnixgramZeroByteBuffer
tags: [function private test]
```

```Go
func TestUnixgramZeroByteBuffer(t *testing.T)
```

### <a id="TestUnixgramZeroBytePayload" href="#TestUnixgramZeroBytePayload">func TestUnixgramZeroBytePayload(t *testing.T)</a>

```
searchKey: net.TestUnixgramZeroBytePayload
tags: [function private test]
```

```Go
func TestUnixgramZeroBytePayload(t *testing.T)
```

### <a id="TestUpdateResolvConf" href="#TestUpdateResolvConf">func TestUpdateResolvConf(t *testing.T)</a>

```
searchKey: net.TestUpdateResolvConf
tags: [function private test]
```

```Go
func TestUpdateResolvConf(t *testing.T)
```

### <a id="TestVariousDeadlines" href="#TestVariousDeadlines">func TestVariousDeadlines(t *testing.T)</a>

```
searchKey: net.TestVariousDeadlines
tags: [function private test]
```

```Go
func TestVariousDeadlines(t *testing.T)
```

### <a id="TestVariousDeadlines1Proc" href="#TestVariousDeadlines1Proc">func TestVariousDeadlines1Proc(t *testing.T)</a>

```
searchKey: net.TestVariousDeadlines1Proc
tags: [function private test]
```

```Go
func TestVariousDeadlines1Proc(t *testing.T)
```

### <a id="TestVariousDeadlines4Proc" href="#TestVariousDeadlines4Proc">func TestVariousDeadlines4Proc(t *testing.T)</a>

```
searchKey: net.TestVariousDeadlines4Proc
tags: [function private test]
```

```Go
func TestVariousDeadlines4Proc(t *testing.T)
```

### <a id="TestWeighting" href="#TestWeighting">func TestWeighting(t *testing.T)</a>

```
searchKey: net.TestWeighting
tags: [function private test]
```

```Go
func TestWeighting(t *testing.T)
```

### <a id="TestWildWildcardListener" href="#TestWildWildcardListener">func TestWildWildcardListener(t *testing.T)</a>

```
searchKey: net.TestWildWildcardListener
tags: [function private test]
```

```Go
func TestWildWildcardListener(t *testing.T)
```

### <a id="TestWithUnexpiredValuesPreserved" href="#TestWithUnexpiredValuesPreserved">func TestWithUnexpiredValuesPreserved(t *testing.T)</a>

```
searchKey: net.TestWithUnexpiredValuesPreserved
tags: [function private test]
```

```Go
func TestWithUnexpiredValuesPreserved(t *testing.T)
```

### <a id="TestWriteTimeout" href="#TestWriteTimeout">func TestWriteTimeout(t *testing.T)</a>

```
searchKey: net.TestWriteTimeout
tags: [function private test]
```

```Go
func TestWriteTimeout(t *testing.T)
```

### <a id="TestWriteTimeoutFluctuation" href="#TestWriteTimeoutFluctuation">func TestWriteTimeoutFluctuation(t *testing.T)</a>

```
searchKey: net.TestWriteTimeoutFluctuation
tags: [function private test]
```

```Go
func TestWriteTimeoutFluctuation(t *testing.T)
```

### <a id="TestWriteTimeoutMustNotReturn" href="#TestWriteTimeoutMustNotReturn">func TestWriteTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: net.TestWriteTimeoutMustNotReturn
tags: [function private test]
```

```Go
func TestWriteTimeoutMustNotReturn(t *testing.T)
```

### <a id="TestWriteToTimeout" href="#TestWriteToTimeout">func TestWriteToTimeout(t *testing.T)</a>

```
searchKey: net.TestWriteToTimeout
tags: [function private test]
```

```Go
func TestWriteToTimeout(t *testing.T)
```

### <a id="TestWriteToUDP" href="#TestWriteToUDP">func TestWriteToUDP(t *testing.T)</a>

```
searchKey: net.TestWriteToUDP
tags: [function private test]
```

```Go
func TestWriteToUDP(t *testing.T)
```

### <a id="TestWritevError" href="#TestWritevError">func TestWritevError(t *testing.T)</a>

```
searchKey: net.TestWritevError
tags: [function private test]
```

```Go
func TestWritevError(t *testing.T)
```

### <a id="TestZeroByteRead" href="#TestZeroByteRead">func TestZeroByteRead(t *testing.T)</a>

```
searchKey: net.TestZeroByteRead
tags: [function private test]
```

```Go
func TestZeroByteRead(t *testing.T)
```

### <a id="absDomainName" href="#absDomainName">func absDomainName(b []byte) string</a>

```
searchKey: net.absDomainName
tags: [function private]
```

```Go
func absDomainName(b []byte) string
```

absDomainName returns an absolute domain name which ends with a trailing dot to match pure Go reverse resolver and all other lookup routines. See golang.org/issue/12189. But we don't want to add dots for local names from /etc/hosts. It's hard to tell so we settle on the heuristic that names without dots (like "localhost" or "myhost") do not get trailing dots, but any other names do. 

### <a id="acquireThread" href="#acquireThread">func acquireThread()</a>

```
searchKey: net.acquireThread
tags: [function private]
```

```Go
func acquireThread()
```

### <a id="allFF" href="#allFF">func allFF(b []byte) bool</a>

```
searchKey: net.allFF
tags: [function private]
```

```Go
func allFF(b []byte) bool
```

### <a id="appendHex" href="#appendHex">func appendHex(dst []byte, i uint32) []byte</a>

```
searchKey: net.appendHex
tags: [function private]
```

```Go
func appendHex(dst []byte, i uint32) []byte
```

Convert i to a hexadecimal string. Leading zeros are not printed. 

### <a id="avoidDNS" href="#avoidDNS">func avoidDNS(name string) bool</a>

```
searchKey: net.avoidDNS
tags: [function private]
```

```Go
func avoidDNS(name string) bool
```

avoidDNS reports whether this is a hostname for which we should not use DNS. Currently this includes only .onion, per RFC 7686. See golang.org/issue/13705. Does not cover .local names (RFC 6762), see golang.org/issue/16739. 

### <a id="benchmarkIPEqual" href="#benchmarkIPEqual">func benchmarkIPEqual(b *testing.B, size int)</a>

```
searchKey: net.benchmarkIPEqual
tags: [function private]
```

```Go
func benchmarkIPEqual(b *testing.B, size int)
```

### <a id="benchmarkIPString" href="#benchmarkIPString">func benchmarkIPString(b *testing.B, size int)</a>

```
searchKey: net.benchmarkIPString
tags: [function private]
```

```Go
func benchmarkIPString(b *testing.B, size int)
```

### <a id="benchmarkTCP" href="#benchmarkTCP">func benchmarkTCP(b *testing.B, persistent, timeout bool, laddr string)</a>

```
searchKey: net.benchmarkTCP
tags: [function private]
```

```Go
func benchmarkTCP(b *testing.B, persistent, timeout bool, laddr string)
```

### <a id="benchmarkTCPConcurrentReadWrite" href="#benchmarkTCPConcurrentReadWrite">func benchmarkTCPConcurrentReadWrite(b *testing.B, laddr string)</a>

```
searchKey: net.benchmarkTCPConcurrentReadWrite
tags: [function private]
```

```Go
func benchmarkTCPConcurrentReadWrite(b *testing.B, laddr string)
```

### <a id="boolint" href="#boolint">func boolint(b bool) int</a>

```
searchKey: net.boolint
tags: [function private]
```

```Go
func boolint(b bool) int
```

Boolean to int. 

### <a id="cgoIPLookup" href="#cgoIPLookup">func cgoIPLookup(result chan<- ipLookupResult, network, name string)</a>

```
searchKey: net.cgoIPLookup
tags: [function private]
```

```Go
func cgoIPLookup(result chan<- ipLookupResult, network, name string)
```

### <a id="cgoLookupAddrPTR" href="#cgoLookupAddrPTR">func cgoLookupAddrPTR(addr string, sa *C.struct_sockaddr, salen C.socklen_t) (names []string, err error)</a>

```
searchKey: net.cgoLookupAddrPTR
tags: [function private]
```

```Go
func cgoLookupAddrPTR(addr string, sa *C.struct_sockaddr, salen C.socklen_t) (names []string, err error)
```

### <a id="cgoLookupCNAME" href="#cgoLookupCNAME">func cgoLookupCNAME(ctx context.Context, name string) (cname string, err error, completed bool)</a>

```
searchKey: net.cgoLookupCNAME
tags: [function private]
```

```Go
func cgoLookupCNAME(ctx context.Context, name string) (cname string, err error, completed bool)
```

### <a id="cgoLookupHost" href="#cgoLookupHost">func cgoLookupHost(ctx context.Context, name string) (hosts []string, err error, completed bool)</a>

```
searchKey: net.cgoLookupHost
tags: [function private]
```

```Go
func cgoLookupHost(ctx context.Context, name string) (hosts []string, err error, completed bool)
```

### <a id="cgoLookupIP" href="#cgoLookupIP">func cgoLookupIP(ctx context.Context, network, name string) (addrs []IPAddr, err error, completed bool)</a>

```
searchKey: net.cgoLookupIP
tags: [function private]
```

```Go
func cgoLookupIP(ctx context.Context, network, name string) (addrs []IPAddr, err error, completed bool)
```

### <a id="cgoLookupIPCNAME" href="#cgoLookupIPCNAME">func cgoLookupIPCNAME(network, name string) (addrs []IPAddr, cname string, err error)</a>

```
searchKey: net.cgoLookupIPCNAME
tags: [function private]
```

```Go
func cgoLookupIPCNAME(network, name string) (addrs []IPAddr, cname string, err error)
```

### <a id="cgoLookupPTR" href="#cgoLookupPTR">func cgoLookupPTR(ctx context.Context, addr string) (names []string, err error, completed bool)</a>

```
searchKey: net.cgoLookupPTR
tags: [function private]
```

```Go
func cgoLookupPTR(ctx context.Context, addr string) (names []string, err error, completed bool)
```

### <a id="cgoLookupPort" href="#cgoLookupPort">func cgoLookupPort(ctx context.Context, network, service string) (port int, err error, completed bool)</a>

```
searchKey: net.cgoLookupPort
tags: [function private]
```

```Go
func cgoLookupPort(ctx context.Context, network, service string) (port int, err error, completed bool)
```

### <a id="cgoLookupServicePort" href="#cgoLookupServicePort">func cgoLookupServicePort(hints *C.struct_addrinfo, network, service string) (port int, err error)</a>

```
searchKey: net.cgoLookupServicePort
tags: [function private]
```

```Go
func cgoLookupServicePort(hints *C.struct_addrinfo, network, service string) (port int, err error)
```

### <a id="cgoNameinfoPTR" href="#cgoNameinfoPTR">func cgoNameinfoPTR(b []byte, sa *C.struct_sockaddr, salen C.socklen_t) (int, error)</a>

```
searchKey: net.cgoNameinfoPTR
tags: [function private]
```

```Go
func cgoNameinfoPTR(b []byte, sa *C.struct_sockaddr, salen C.socklen_t) (int, error)
```

### <a id="cgoPortLookup" href="#cgoPortLookup">func cgoPortLookup(result chan<- portLookupResult, hints *C.struct_addrinfo, network, service string)</a>

```
searchKey: net.cgoPortLookup
tags: [function private]
```

```Go
func cgoPortLookup(result chan<- portLookupResult, hints *C.struct_addrinfo, network, service string)
```

### <a id="cgoReverseLookup" href="#cgoReverseLookup">func cgoReverseLookup(result chan<- reverseLookupResult, addr string, sa *C.struct_sockaddr, salen C.socklen_t)</a>

```
searchKey: net.cgoReverseLookup
tags: [function private]
```

```Go
func cgoReverseLookup(result chan<- reverseLookupResult, addr string, sa *C.struct_sockaddr, salen C.socklen_t)
```

### <a id="cgoSockaddr" href="#cgoSockaddr">func cgoSockaddr(ip IP, zone string) (*C.struct_sockaddr, C.socklen_t)</a>

```
searchKey: net.cgoSockaddr
tags: [function private]
```

```Go
func cgoSockaddr(ip IP, zone string) (*C.struct_sockaddr, C.socklen_t)
```

### <a id="cgoSockaddrInet4" href="#cgoSockaddrInet4">func cgoSockaddrInet4(ip IP) *C.struct_sockaddr</a>

```
searchKey: net.cgoSockaddrInet4
tags: [function private]
```

```Go
func cgoSockaddrInet4(ip IP) *C.struct_sockaddr
```

### <a id="cgoSockaddrInet6" href="#cgoSockaddrInet6">func cgoSockaddrInet6(ip IP, zone int) *C.struct_sockaddr</a>

```
searchKey: net.cgoSockaddrInet6
tags: [function private]
```

```Go
func cgoSockaddrInet6(ip IP, zone int) *C.struct_sockaddr
```

### <a id="checkDistribution" href="#checkDistribution">func checkDistribution(t *testing.T, data []*SRV, margin float64)</a>

```
searchKey: net.checkDistribution
tags: [function private]
```

```Go
func checkDistribution(t *testing.T, data []*SRV, margin float64)
```

### <a id="checkDualStackAddrFamily" href="#checkDualStackAddrFamily">func checkDualStackAddrFamily(fd *netFD) error</a>

```
searchKey: net.checkDualStackAddrFamily
tags: [function private]
```

```Go
func checkDualStackAddrFamily(fd *netFD) error
```

### <a id="checkDualStackSecondListener" href="#checkDualStackSecondListener">func checkDualStackSecondListener(network, address string, err, xerr error) error</a>

```
searchKey: net.checkDualStackSecondListener
tags: [function private]
```

```Go
func checkDualStackSecondListener(network, address string, err, xerr error) error
```

### <a id="checkFirstListener" href="#checkFirstListener">func checkFirstListener(network string, ln interface{}) error</a>

```
searchKey: net.checkFirstListener
tags: [function private]
```

```Go
func checkFirstListener(network string, ln interface{}) error
```

### <a id="checkHeader" href="#checkHeader">func checkHeader(p *dnsmessage.Parser, h dnsmessage.Header) error</a>

```
searchKey: net.checkHeader
tags: [function private]
```

```Go
func checkHeader(p *dnsmessage.Parser, h dnsmessage.Header) error
```

checkHeader performs basic sanity checks on the header. 

### <a id="checkMulticastListener" href="#checkMulticastListener">func checkMulticastListener(c *UDPConn, ip IP) error</a>

```
searchKey: net.checkMulticastListener
tags: [function private]
```

```Go
func checkMulticastListener(c *UDPConn, ip IP) error
```

### <a id="checkMulticastStats" href="#checkMulticastStats">func checkMulticastStats(ifStats *ifStats, uniStats, multiStats *routeStats) error</a>

```
searchKey: net.checkMulticastStats
tags: [function private]
```

```Go
func checkMulticastStats(ifStats *ifStats, uniStats, multiStats *routeStats) error
```

### <a id="checkResponse" href="#checkResponse">func checkResponse(reqID uint16, reqQues dnsmessage.Question, respHdr dnsmessage.Header, respQues dnsmessage.Question) bool</a>

```
searchKey: net.checkResponse
tags: [function private]
```

```Go
func checkResponse(reqID uint16, reqQues dnsmessage.Question, respHdr dnsmessage.Header, respQues dnsmessage.Question) bool
```

### <a id="checkSecondListener" href="#checkSecondListener">func checkSecondListener(network, address string, err error) error</a>

```
searchKey: net.checkSecondListener
tags: [function private]
```

```Go
func checkSecondListener(network, address string, err error) error
```

### <a id="checkUnicastStats" href="#checkUnicastStats">func checkUnicastStats(ifStats *ifStats, uniStats *routeStats) error</a>

```
searchKey: net.checkUnicastStats
tags: [function private]
```

```Go
func checkUnicastStats(ifStats *ifStats, uniStats *routeStats) error
```

### <a id="commonPrefixLen" href="#commonPrefixLen">func commonPrefixLen(a, b IP) (cpl int)</a>

```
searchKey: net.commonPrefixLen
tags: [function private]
```

```Go
func commonPrefixLen(a, b IP) (cpl int)
```

commonPrefixLen reports the length of the longest prefix (looking at the most significant, or leftmost, bits) that the two addresses have in common, up to the length of a's prefix (i.e., the portion of the address not including the interface ID). 

If a or b is an IPv4 address as an IPv6 address, the IPv4 addresses are compared (with max common prefix length of 32). If a and b are different IP versions, 0 is returned. 

See [https://tools.ietf.org/html/rfc6724#section-2.2](https://tools.ietf.org/html/rfc6724#section-2.2) 

### <a id="concurrentThreadsLimit" href="#concurrentThreadsLimit">func concurrentThreadsLimit() int</a>

```
searchKey: net.concurrentThreadsLimit
tags: [function private]
```

```Go
func concurrentThreadsLimit() int
```

concurrentThreadsLimit returns the number of threads we permit to run concurrently doing DNS lookups via cgo. A DNS lookup may use a file descriptor so we limit this to less than the number of permitted open files. On some systems, notably Darwin, if getaddrinfo is unable to open a file descriptor it simply returns EAI_NONAME rather than a useful error. Limiting the number of concurrent getaddrinfo calls to less than the permitted number of file descriptors makes that error less likely. We don't bother to apply the same limit to DNS lookups run directly from Go, because there we will return a meaningful "too many open files" error. 

### <a id="condFatalf" href="#condFatalf">func condFatalf(t *testing.T, network string, format string, args ...interface{})</a>

```
searchKey: net.condFatalf
tags: [function private]
```

```Go
func condFatalf(t *testing.T, network string, format string, args ...interface{})
```

### <a id="controlOnConnSetup" href="#controlOnConnSetup">func controlOnConnSetup(network string, address string, c syscall.RawConn) error</a>

```
searchKey: net.controlOnConnSetup
tags: [function private]
```

```Go
func controlOnConnSetup(network string, address string, c syscall.RawConn) error
```

### <a id="controlRawConn" href="#controlRawConn">func controlRawConn(c syscall.RawConn, addr Addr) error</a>

```
searchKey: net.controlRawConn
tags: [function private]
```

```Go
func controlRawConn(c syscall.RawConn, addr Addr) error
```

### <a id="count" href="#count">func count(s string, b byte) int</a>

```
searchKey: net.count
tags: [function private]
```

```Go
func count(s string, b byte) int
```

Number of occurrences of b in s. 

### <a id="countAnyByte" href="#countAnyByte">func countAnyByte(s string, t string) int</a>

```
searchKey: net.countAnyByte
tags: [function private]
```

```Go
func countAnyByte(s string, t string) int
```

Count occurrences in s of any bytes in t. 

### <a id="dialClosedPort" href="#dialClosedPort">func dialClosedPort(t *testing.T) (actual, expected time.Duration)</a>

```
searchKey: net.dialClosedPort
tags: [function private]
```

```Go
func dialClosedPort(t *testing.T) (actual, expected time.Duration)
```

### <a id="differentWildcardAddr" href="#differentWildcardAddr">func differentWildcardAddr(i, j string) bool</a>

```
searchKey: net.differentWildcardAddr
tags: [function private]
```

```Go
func differentWildcardAddr(i, j string) bool
```

### <a id="disableSocketConnect" href="#disableSocketConnect">func disableSocketConnect(network string)</a>

```
searchKey: net.disableSocketConnect
tags: [function private]
```

```Go
func disableSocketConnect(network string)
```

### <a id="dnsDefaultSearch" href="#dnsDefaultSearch">func dnsDefaultSearch() []string</a>

```
searchKey: net.dnsDefaultSearch
tags: [function private]
```

```Go
func dnsDefaultSearch() []string
```

### <a id="dnsPacketRoundTrip" href="#dnsPacketRoundTrip">func dnsPacketRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)</a>

```
searchKey: net.dnsPacketRoundTrip
tags: [function private]
```

```Go
func dnsPacketRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)
```

### <a id="dnsStreamRoundTrip" href="#dnsStreamRoundTrip">func dnsStreamRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)</a>

```
searchKey: net.dnsStreamRoundTrip
tags: [function private]
```

```Go
func dnsStreamRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)
```

### <a id="dtoi" href="#dtoi">func dtoi(s string) (n int, i int, ok bool)</a>

```
searchKey: net.dtoi
tags: [function private]
```

```Go
func dtoi(s string) (n int, i int, ok bool)
```

Decimal to integer. Returns number, characters consumed, success. 

### <a id="dupSocket" href="#dupSocket">func dupSocket(f *os.File) (int, error)</a>

```
searchKey: net.dupSocket
tags: [function private]
```

```Go
func dupSocket(f *os.File) (int, error)
```

### <a id="emitDNSNameTest" href="#emitDNSNameTest">func emitDNSNameTest(ch chan<- dnsNameTest)</a>

```
searchKey: net.emitDNSNameTest
tags: [function private]
```

```Go
func emitDNSNameTest(ch chan<- dnsNameTest)
```

### <a id="enableSocketConnect" href="#enableSocketConnect">func enableSocketConnect()</a>

```
searchKey: net.enableSocketConnect
tags: [function private]
```

```Go
func enableSocketConnect()
```

### <a id="ensureRooted" href="#ensureRooted">func ensureRooted(s string) string</a>

```
searchKey: net.ensureRooted
tags: [function private]
```

```Go
func ensureRooted(s string) string
```

### <a id="equalASCIIName" href="#equalASCIIName">func equalASCIIName(x, y dnsmessage.Name) bool</a>

```
searchKey: net.equalASCIIName
tags: [function private]
```

```Go
func equalASCIIName(x, y dnsmessage.Name) bool
```

### <a id="fastrand" href="#fastrand">func fastrand() uint32</a>

```
searchKey: net.fastrand
tags: [function private]
```

```Go
func fastrand() uint32
```

provided by runtime 

### <a id="favoriteAddrFamily" href="#favoriteAddrFamily">func favoriteAddrFamily(network string, laddr, raddr sockaddr, mode string) (family int, ipv6only bool)</a>

```
searchKey: net.favoriteAddrFamily
tags: [function private]
```

```Go
func favoriteAddrFamily(network string, laddr, raddr sockaddr, mode string) (family int, ipv6only bool)
```

favoriteAddrFamily returns the appropriate address family for the given network, laddr, raddr and mode. 

If mode indicates "listen" and laddr is a wildcard, we assume that the user wants to make a passive-open connection with a wildcard address family, both AF_INET and AF_INET6, and a wildcard address like the following: 

```
- A listen for a wildcard communication domain, "tcp" or
  "udp", with a wildcard address: If the platform supports
  both IPv6 and IPv4-mapped IPv6 communication capabilities,
  or does not support IPv4, we use a dual stack, AF_INET6 and
  IPV6_V6ONLY=0, wildcard address listen. The dual stack
  wildcard address listen may fall back to an IPv6-only,
  AF_INET6 and IPV6_V6ONLY=1, wildcard address listen.
  Otherwise we prefer an IPv4-only, AF_INET, wildcard address
  listen.

- A listen for a wildcard communication domain, "tcp" or
  "udp", with an IPv4 wildcard address: same as above.

- A listen for a wildcard communication domain, "tcp" or
  "udp", with an IPv6 wildcard address: same as above.

- A listen for an IPv4 communication domain, "tcp4" or "udp4",
  with an IPv4 wildcard address: We use an IPv4-only, AF_INET,
  wildcard address listen.

- A listen for an IPv6 communication domain, "tcp6" or "udp6",
  with an IPv6 wildcard address: We use an IPv6-only, AF_INET6
  and IPV6_V6ONLY=1, wildcard address listen.

```
Otherwise guess: If the addresses are IPv4 then returns AF_INET, or else returns AF_INET6. It also returns a boolean value what designates IPV6_V6ONLY option. 

Note that the latest DragonFly BSD and OpenBSD kernels allow neither "net.inet6.ip6.v6only=1" change nor IPPROTO_IPV6 level IPV6_V6ONLY socket option setting. 

### <a id="fcntl" href="#fcntl">func fcntl(fd int, cmd int, arg int) (int, error)</a>

```
searchKey: net.fcntl
tags: [function private]
```

```Go
func fcntl(fd int, cmd int, arg int) (int, error)
```

Implemented in the syscall package. 

### <a id="fetchGoogle" href="#fetchGoogle">func fetchGoogle(dial func(string, string) (Conn, error), network, address string) error</a>

```
searchKey: net.fetchGoogle
tags: [function private]
```

```Go
func fetchGoogle(dial func(string, string) (Conn, error), network, address string) error
```

### <a id="forceCgoDNS" href="#forceCgoDNS">func forceCgoDNS() func()</a>

```
searchKey: net.forceCgoDNS
tags: [function private]
```

```Go
func forceCgoDNS() func()
```

forceCgoDNS forces the resolver configuration to use the cgo resolver and returns a fixup function to restore the old settings. (On non-Unix systems forceCgoDNS returns nil.) 

### <a id="forceCloseSockets" href="#forceCloseSockets">func forceCloseSockets()</a>

```
searchKey: net.forceCloseSockets
tags: [function private]
```

```Go
func forceCloseSockets()
```

forceCloseSockets must be called only from TestMain. 

### <a id="forceGoDNS" href="#forceGoDNS">func forceGoDNS() func()</a>

```
searchKey: net.forceGoDNS
tags: [function private]
```

```Go
func forceGoDNS() func()
```

forceGoDNS forces the resolver configuration to use the pure Go resolver and returns a fixup function to restore the old settings. 

### <a id="foreachField" href="#foreachField">func foreachField(x []byte, fn func(field []byte) error) error</a>

```
searchKey: net.foreachField
tags: [function private]
```

```Go
func foreachField(x []byte, fn func(field []byte) error) error
```

foreachField runs fn on each non-empty run of non-space bytes in x. It returns the first non-nil error returned by fn. 

### <a id="foreachLine" href="#foreachLine">func foreachLine(x []byte, fn func(line []byte) error) error</a>

```
searchKey: net.foreachLine
tags: [function private]
```

```Go
func foreachLine(x []byte, fn func(line []byte) error) error
```

foreachLine runs fn on each line of x. Each line (except for possibly the last) ends in '\n'. It returns the first non-nil error returned by fn. 

### <a id="genericReadFrom" href="#genericReadFrom">func genericReadFrom(w io.Writer, r io.Reader) (n int64, err error)</a>

```
searchKey: net.genericReadFrom
tags: [function private]
```

```Go
func genericReadFrom(w io.Writer, r io.Reader) (n int64, err error)
```

Fallback implementation of io.ReaderFrom's ReadFrom, when sendfile isn't applicable. 

### <a id="getFields" href="#getFields">func getFields(s string) []string</a>

```
searchKey: net.getFields
tags: [function private]
```

```Go
func getFields(s string) []string
```

### <a id="goDebugNetDNS" href="#goDebugNetDNS">func goDebugNetDNS() (dnsMode string, debugLevel int)</a>

```
searchKey: net.goDebugNetDNS
tags: [function private]
```

```Go
func goDebugNetDNS() (dnsMode string, debugLevel int)
```

goDebugNetDNS parses the value of the GODEBUG "netdns" value. The netdns value can be of the form: 

```
1       // debug level 1
2       // debug level 2
cgo     // use cgo for DNS lookups
go      // use go for DNS lookups
cgo+1   // use cgo for DNS lookups + debug level 1
1+cgo   // same
cgo+2   // same, but debug level 2

```
etc. 

### <a id="goDebugString" href="#goDebugString">func goDebugString(key string) string</a>

```
searchKey: net.goDebugString
tags: [function private]
```

```Go
func goDebugString(key string) string
```

goDebugString returns the value of the named GODEBUG key. GODEBUG is of the form "key=val,key2=val2" 

### <a id="goLookupIPFiles" href="#goLookupIPFiles">func goLookupIPFiles(name string) (addrs []IPAddr)</a>

```
searchKey: net.goLookupIPFiles
tags: [function private]
```

```Go
func goLookupIPFiles(name string) (addrs []IPAddr)
```

lookup entries from /etc/hosts 

### <a id="goLookupPort" href="#goLookupPort">func goLookupPort(network, service string) (port int, err error)</a>

```
searchKey: net.goLookupPort
tags: [function private]
```

```Go
func goLookupPort(network, service string) (port int, err error)
```

goLookupPort is the native Go implementation of LookupPort. 

### <a id="googleLiteralAddrs" href="#googleLiteralAddrs">func googleLiteralAddrs() (lits4, lits6 []string, err error)</a>

```
searchKey: net.googleLiteralAddrs
tags: [function private]
```

```Go
func googleLiteralAddrs() (lits4, lits6 []string, err error)
```

### <a id="hasPrefix" href="#hasPrefix">func hasPrefix(s, prefix string) bool</a>

```
searchKey: net.hasPrefix
tags: [function private]
```

```Go
func hasPrefix(s, prefix string) bool
```

### <a id="hasSuffixFold" href="#hasSuffixFold">func hasSuffixFold(s, suffix string) bool</a>

```
searchKey: net.hasSuffixFold
tags: [function private]
```

```Go
func hasSuffixFold(s, suffix string) bool
```

### <a id="hexString" href="#hexString">func hexString(b []byte) string</a>

```
searchKey: net.hexString
tags: [function private]
```

```Go
func hexString(b []byte) string
```

### <a id="iOS" href="#iOS">func iOS() bool</a>

```
searchKey: net.iOS
tags: [function private]
```

```Go
func iOS() bool
```

### <a id="init.addrselect.go" href="#init.addrselect.go">func init()</a>

```
searchKey: net.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.platform_test.go" href="#init.platform_test.go">func init()</a>

```
searchKey: net.init
tags: [function private]
```

```Go
func init()
```

### <a id="initConfVal" href="#initConfVal">func initConfVal()</a>

```
searchKey: net.initConfVal
tags: [function private]
```

```Go
func initConfVal()
```

### <a id="installTestHooks" href="#installTestHooks">func installTestHooks()</a>

```
searchKey: net.installTestHooks
tags: [function private]
```

```Go
func installTestHooks()
```

### <a id="interfaceAddrTable" href="#interfaceAddrTable">func interfaceAddrTable(ifi *Interface) ([]Addr, error)</a>

```
searchKey: net.interfaceAddrTable
tags: [function private]
```

```Go
func interfaceAddrTable(ifi *Interface) ([]Addr, error)
```

If the ifi is nil, interfaceAddrTable returns addresses for all network interfaces. Otherwise it returns addresses for a specific interface. 

### <a id="interfaceMessages" href="#interfaceMessages">func interfaceMessages(ifindex int) ([]route.Message, error)</a>

```
searchKey: net.interfaceMessages
tags: [function private]
```

```Go
func interfaceMessages(ifindex int) ([]route.Message, error)
```

### <a id="interfaceMulticastAddrTable" href="#interfaceMulticastAddrTable">func interfaceMulticastAddrTable(ifi *Interface) ([]Addr, error)</a>

```
searchKey: net.interfaceMulticastAddrTable
tags: [function private]
```

```Go
func interfaceMulticastAddrTable(ifi *Interface) ([]Addr, error)
```

interfaceMulticastAddrTable returns addresses for a specific interface. 

### <a id="interfaceTable" href="#interfaceTable">func interfaceTable(ifindex int) ([]Interface, error)</a>

```
searchKey: net.interfaceTable
tags: [function private]
```

```Go
func interfaceTable(ifindex int) ([]Interface, error)
```

If the ifindex is zero, interfaceTable returns mappings of all network interfaces. Otherwise it returns a mapping of a specific interface. 

### <a id="ipAddrsEface" href="#ipAddrsEface">func ipAddrsEface(addrs []IPAddr) []interface{}</a>

```
searchKey: net.ipAddrsEface
tags: [function private]
```

```Go
func ipAddrsEface(addrs []IPAddr) []interface{}
```

ipAddrsEface returns an empty interface slice of addrs. 

### <a id="ipEmptyString" href="#ipEmptyString">func ipEmptyString(ip IP) string</a>

```
searchKey: net.ipEmptyString
tags: [function private]
```

```Go
func ipEmptyString(ip IP) string
```

ipEmptyString is like ip.String except that it returns an empty string when ip is unset. 

### <a id="ipToSockaddr" href="#ipToSockaddr">func ipToSockaddr(family int, ip IP, port int, zone string) (syscall.Sockaddr, error)</a>

```
searchKey: net.ipToSockaddr
tags: [function private]
```

```Go
func ipToSockaddr(family int, ip IP, port int, zone string) (syscall.Sockaddr, error)
```

### <a id="ipVersion" href="#ipVersion">func ipVersion(network string) byte</a>

```
searchKey: net.ipVersion
tags: [function private]
```

```Go
func ipVersion(network string) byte
```

ipVersion returns the provided network's IP version: '4', '6' or 0 if network does not end in a '4' or '6' byte. 

### <a id="ipv4only" href="#ipv4only">func ipv4only(addr IPAddr) bool</a>

```
searchKey: net.ipv4only
tags: [function private]
```

```Go
func ipv4only(addr IPAddr) bool
```

ipv4only reports whether addr is an IPv4 address. 

### <a id="ipv6LinkLocalUnicastAddr" href="#ipv6LinkLocalUnicastAddr">func ipv6LinkLocalUnicastAddr(ifi *Interface) string</a>

```
searchKey: net.ipv6LinkLocalUnicastAddr
tags: [function private]
```

```Go
func ipv6LinkLocalUnicastAddr(ifi *Interface) string
```

ipv6LinkLocalUnicastAddr returns an IPv6 link-local unicast address on the given network interface for tests. It returns "" if no suitable address is found. 

### <a id="ipv6only" href="#ipv6only">func ipv6only(addr IPAddr) bool</a>

```
searchKey: net.ipv6only
tags: [function private]
```

```Go
func ipv6only(addr IPAddr) bool
```

ipv6only reports whether addr is an IPv6 address except IPv4-mapped IPv6 address. 

### <a id="isClosedChan" href="#isClosedChan">func isClosedChan(c <-chan struct{}) bool</a>

```
searchKey: net.isClosedChan
tags: [function private]
```

```Go
func isClosedChan(c <-chan struct{}) bool
```

### <a id="isConnError" href="#isConnError">func isConnError(err error) bool</a>

```
searchKey: net.isConnError
tags: [function private]
```

```Go
func isConnError(err error) bool
```

### <a id="isDeadlineExceeded" href="#isDeadlineExceeded">func isDeadlineExceeded(err error) bool</a>

```
searchKey: net.isDeadlineExceeded
tags: [function private]
```

```Go
func isDeadlineExceeded(err error) bool
```

isDeadlineExceeded reports whether err is or wraps os.ErrDeadlineExceeded. We also check that the error implements net.Error, and that the Timeout method returns true. 

### <a id="isDomainName" href="#isDomainName">func isDomainName(s string) bool</a>

```
searchKey: net.isDomainName
tags: [function private]
```

```Go
func isDomainName(s string) bool
```

isDomainName checks if a string is a presentation-format domain name (currently restricted to hostname-compatible "preferred name" LDH labels and SRV-like "underscore labels"; see golang.org/issue/12421). 

### <a id="isGateway" href="#isGateway">func isGateway(h string) bool</a>

```
searchKey: net.isGateway
tags: [function private]
```

```Go
func isGateway(h string) bool
```

isGateway reports whether h should be considered a "gateway" name for the myhostname NSS module. 

### <a id="isIPv4" href="#isIPv4">func isIPv4(addr Addr) bool</a>

```
searchKey: net.isIPv4
tags: [function private]
```

```Go
func isIPv4(addr Addr) bool
```

isIPv4 reports whether addr contains an IPv4 address. 

### <a id="isLocalhost" href="#isLocalhost">func isLocalhost(h string) bool</a>

```
searchKey: net.isLocalhost
tags: [function private]
```

```Go
func isLocalhost(h string) bool
```

isLocalhost reports whether h should be considered a "localhost" name for the myhostname NSS module. 

### <a id="isNotIPv4" href="#isNotIPv4">func isNotIPv4(addr Addr) bool</a>

```
searchKey: net.isNotIPv4
tags: [function private]
```

```Go
func isNotIPv4(addr Addr) bool
```

isNotIPv4 reports whether addr does not contain an IPv4 address. 

### <a id="isPlatformError" href="#isPlatformError">func isPlatformError(err error) bool</a>

```
searchKey: net.isPlatformError
tags: [function private]
```

```Go
func isPlatformError(err error) bool
```

### <a id="isSpace" href="#isSpace">func isSpace(b byte) bool</a>

```
searchKey: net.isSpace
tags: [function private]
```

```Go
func isSpace(b byte) bool
```

isSpace reports whether b is an ASCII space character. 

### <a id="isZeros" href="#isZeros">func isZeros(p IP) bool</a>

```
searchKey: net.isZeros
tags: [function private]
```

```Go
func isZeros(p IP) bool
```

Is p all zeros? 

### <a id="joinIPv4Group" href="#joinIPv4Group">func joinIPv4Group(fd *netFD, ifi *Interface, ip IP) error</a>

```
searchKey: net.joinIPv4Group
tags: [function private]
```

```Go
func joinIPv4Group(fd *netFD, ifi *Interface, ip IP) error
```

### <a id="joinIPv6Group" href="#joinIPv6Group">func joinIPv6Group(fd *netFD, ifi *Interface, ip IP) error</a>

```
searchKey: net.joinIPv6Group
tags: [function private]
```

```Go
func joinIPv6Group(fd *netFD, ifi *Interface, ip IP) error
```

### <a id="last" href="#last">func last(s string, b byte) int</a>

```
searchKey: net.last
tags: [function private]
```

```Go
func last(s string, b byte) int
```

Index of rightmost occurrence of b in s. 

### <a id="listenIPv4MulticastUDP" href="#listenIPv4MulticastUDP">func listenIPv4MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error</a>

```
searchKey: net.listenIPv4MulticastUDP
tags: [function private]
```

```Go
func listenIPv4MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error
```

### <a id="listenIPv6MulticastUDP" href="#listenIPv6MulticastUDP">func listenIPv6MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error</a>

```
searchKey: net.listenIPv6MulticastUDP
tags: [function private]
```

```Go
func listenIPv6MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error
```

### <a id="listenerBacklog" href="#listenerBacklog">func listenerBacklog() int</a>

```
searchKey: net.listenerBacklog
tags: [function private]
```

```Go
func listenerBacklog() int
```

listenerBacklog is a caching wrapper around maxListenerBacklog. 

### <a id="lookupIPReturn" href="#lookupIPReturn">func lookupIPReturn(addrsi interface{}, err error, shared bool) ([]IPAddr, error)</a>

```
searchKey: net.lookupIPReturn
tags: [function private]
```

```Go
func lookupIPReturn(addrsi interface{}, err error, shared bool) ([]IPAddr, error)
```

lookupIPReturn turns the return values from singleflight.Do into the return values from LookupIP. 

### <a id="lookupLocalhost" href="#lookupLocalhost">func lookupLocalhost(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)</a>

```
searchKey: net.lookupLocalhost
tags: [function private]
```

```Go
func lookupLocalhost(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)
```

### <a id="lookupPortMap" href="#lookupPortMap">func lookupPortMap(network, service string) (port int, error error)</a>

```
searchKey: net.lookupPortMap
tags: [function private]
```

```Go
func lookupPortMap(network, service string) (port int, error error)
```

### <a id="lookupProtocol" href="#lookupProtocol">func lookupProtocol(_ context.Context, name string) (int, error)</a>

```
searchKey: net.lookupProtocol
tags: [function private]
```

```Go
func lookupProtocol(_ context.Context, name string) (int, error)
```

lookupProtocol looks up IP protocol name in /etc/protocols and returns correspondent protocol number. 

### <a id="lookupProtocolMap" href="#lookupProtocolMap">func lookupProtocolMap(name string) (int, error)</a>

```
searchKey: net.lookupProtocolMap
tags: [function private]
```

```Go
func lookupProtocolMap(name string) (int, error)
```

### <a id="lookupSlowFast" href="#lookupSlowFast">func lookupSlowFast(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)</a>

```
searchKey: net.lookupSlowFast
tags: [function private]
```

```Go
func lookupSlowFast(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)
```

### <a id="lookupStaticAddr" href="#lookupStaticAddr">func lookupStaticAddr(addr string) []string</a>

```
searchKey: net.lookupStaticAddr
tags: [function private]
```

```Go
func lookupStaticAddr(addr string) []string
```

lookupStaticAddr looks up the hosts for the given address from /etc/hosts. 

### <a id="lookupStaticHost" href="#lookupStaticHost">func lookupStaticHost(host string) []string</a>

```
searchKey: net.lookupStaticHost
tags: [function private]
```

```Go
func lookupStaticHost(host string) []string
```

lookupStaticHost looks up the addresses for the given host from /etc/hosts. 

### <a id="lookupWithFake" href="#lookupWithFake">func lookupWithFake(fake fakeDNSServer, name string, typ dnsmessage.Type) error</a>

```
searchKey: net.lookupWithFake
tags: [function private]
```

```Go
func lookupWithFake(fake fakeDNSServer, name string, typ dnsmessage.Type) error
```

### <a id="lowerASCII" href="#lowerASCII">func lowerASCII(b byte) byte</a>

```
searchKey: net.lowerASCII
tags: [function private]
```

```Go
func lowerASCII(b byte) byte
```

lowerASCII returns the ASCII lowercase version of b. 

### <a id="lowerASCIIBytes" href="#lowerASCIIBytes">func lowerASCIIBytes(x []byte)</a>

```
searchKey: net.lowerASCIIBytes
tags: [function private]
```

```Go
func lowerASCIIBytes(x []byte)
```

lowerASCIIBytes makes x ASCII lowercase in-place. 

### <a id="mapErr" href="#mapErr">func mapErr(err error) error</a>

```
searchKey: net.mapErr
tags: [function private]
```

```Go
func mapErr(err error) error
```

mapErr maps from the context errors to the historical internal net error values. 

TODO(bradfitz): get rid of this after adjusting tests and making context.DeadlineExceeded implement net.Error? 

### <a id="maxListenerBacklog" href="#maxListenerBacklog">func maxListenerBacklog() int</a>

```
searchKey: net.maxListenerBacklog
tags: [function private]
```

```Go
func maxListenerBacklog() int
```

### <a id="minNonzeroTime" href="#minNonzeroTime">func minNonzeroTime(a, b time.Time) time.Time</a>

```
searchKey: net.minNonzeroTime
tags: [function private]
```

```Go
func minNonzeroTime(a, b time.Time) time.Time
```

### <a id="mockTXTResponse" href="#mockTXTResponse">func mockTXTResponse(q dnsmessage.Message) dnsmessage.Message</a>

```
searchKey: net.mockTXTResponse
tags: [function private]
```

```Go
func mockTXTResponse(q dnsmessage.Message) dnsmessage.Message
```

### <a id="multicastRIBContains" href="#multicastRIBContains">func multicastRIBContains(ip IP) (bool, error)</a>

```
searchKey: net.multicastRIBContains
tags: [function private]
```

```Go
func multicastRIBContains(ip IP) (bool, error)
```

### <a id="mustHaveExternalNetwork" href="#mustHaveExternalNetwork">func mustHaveExternalNetwork(t *testing.T)</a>

```
searchKey: net.mustHaveExternalNetwork
tags: [function private]
```

```Go
func mustHaveExternalNetwork(t *testing.T)
```

mustHaveExternalNetwork is like testenv.MustHaveExternalNetwork except that it won't skip testing on non-mobile builders. 

### <a id="mustNewName" href="#mustNewName">func mustNewName(name string) dnsmessage.Name</a>

```
searchKey: net.mustNewName
tags: [function private]
```

```Go
func mustNewName(name string) dnsmessage.Name
```

### <a id="mustQuestion" href="#mustQuestion">func mustQuestion(name string, qtype dnsmessage.Type, class dnsmessage.Class) dnsmessage.Question</a>

```
searchKey: net.mustQuestion
tags: [function private]
```

```Go
func mustQuestion(name string, qtype dnsmessage.Type, class dnsmessage.Class) dnsmessage.Question
```

### <a id="mxString" href="#mxString">func mxString(mxs []*MX) string</a>

```
searchKey: net.mxString
tags: [function private]
```

```Go
func mxString(mxs []*MX) string
```

### <a id="name" href="#name">func name(f interface{}) string</a>

```
searchKey: net.name
tags: [function private]
```

```Go
func name(f interface{}) string
```

### <a id="newDualStackListener" href="#newDualStackListener">func newDualStackListener() (lns []*TCPListener, err error)</a>

```
searchKey: net.newDualStackListener
tags: [function private]
```

```Go
func newDualStackListener() (lns []*TCPListener, err error)
```

### <a id="newDualStackPacketListener" href="#newDualStackPacketListener">func newDualStackPacketListener() (cs []*UDPConn, err error)</a>

```
searchKey: net.newDualStackPacketListener
tags: [function private]
```

```Go
func newDualStackPacketListener() (cs []*UDPConn, err error)
```

### <a id="newRequest" href="#newRequest">func newRequest(q dnsmessage.Question) (id uint16, udpReq, tcpReq []byte, err error)</a>

```
searchKey: net.newRequest
tags: [function private]
```

```Go
func newRequest(q dnsmessage.Question) (id uint16, udpReq, tcpReq []byte, err error)
```

### <a id="nsString" href="#nsString">func nsString(nss []*NS) string</a>

```
searchKey: net.nsString
tags: [function private]
```

```Go
func nsString(nss []*NS) string
```

### <a id="packetConnTestData" href="#packetConnTestData">func packetConnTestData(t *testing.T, network string) ([]byte, func())</a>

```
searchKey: net.packetConnTestData
tags: [function private]
```

```Go
func packetConnTestData(t *testing.T, network string) ([]byte, func())
```

### <a id="packetTransceiver" href="#packetTransceiver">func packetTransceiver(c PacketConn, wb []byte, dst Addr, ch chan<- error)</a>

```
searchKey: net.packetTransceiver
tags: [function private]
```

```Go
func packetTransceiver(c PacketConn, wb []byte, dst Addr, ch chan<- error)
```

### <a id="packetTransponder" href="#packetTransponder">func packetTransponder(c PacketConn, ch chan<- error)</a>

```
searchKey: net.packetTransponder
tags: [function private]
```

```Go
func packetTransponder(c PacketConn, ch chan<- error)
```

### <a id="parseAcceptError" href="#parseAcceptError">func parseAcceptError(nestedErr error) error</a>

```
searchKey: net.parseAcceptError
tags: [function private]
```

```Go
func parseAcceptError(nestedErr error) error
```

parseAcceptError parses nestedErr and reports whether it is a valid error value from Accept functions. It returns nil when nestedErr is valid. 

### <a id="parseCloseError" href="#parseCloseError">func parseCloseError(nestedErr error, isShutdown bool) error</a>

```
searchKey: net.parseCloseError
tags: [function private]
```

```Go
func parseCloseError(nestedErr error, isShutdown bool) error
```

parseCloseError parses nestedErr and reports whether it is a valid error value from Close functions. It returns nil when nestedErr is valid. 

### <a id="parseCommonError" href="#parseCommonError">func parseCommonError(nestedErr error) error</a>

```
searchKey: net.parseCommonError
tags: [function private]
```

```Go
func parseCommonError(nestedErr error) error
```

parseCommonError parses nestedErr and reports whether it is a valid error value from miscellaneous functions. It returns nil when nestedErr is valid. 

### <a id="parseCriteria" href="#parseCriteria">func parseCriteria(x []byte) (c []nssCriterion, err error)</a>

```
searchKey: net.parseCriteria
tags: [function private]
```

```Go
func parseCriteria(x []byte) (c []nssCriterion, err error)
```

parses "foo=bar !foo=bar" 

### <a id="parseDialError" href="#parseDialError">func parseDialError(nestedErr error) error</a>

```
searchKey: net.parseDialError
tags: [function private]
```

```Go
func parseDialError(nestedErr error) error
```

parseDialError parses nestedErr and reports whether it is a valid error value from Dial, Listen functions. It returns nil when nestedErr is valid. 

### <a id="parseLiteralIP" href="#parseLiteralIP">func parseLiteralIP(addr string) string</a>

```
searchKey: net.parseLiteralIP
tags: [function private]
```

```Go
func parseLiteralIP(addr string) string
```

### <a id="parseLookupPortError" href="#parseLookupPortError">func parseLookupPortError(nestedErr error) error</a>

```
searchKey: net.parseLookupPortError
tags: [function private]
```

```Go
func parseLookupPortError(nestedErr error) error
```

### <a id="parseNetwork" href="#parseNetwork">func parseNetwork(ctx context.Context, network string, needsProto bool) (afnet string, proto int, err error)</a>

```
searchKey: net.parseNetwork
tags: [function private]
```

```Go
func parseNetwork(ctx context.Context, network string, needsProto bool) (afnet string, proto int, err error)
```

### <a id="parsePort" href="#parsePort">func parsePort(service string) (port int, needsLookup bool)</a>

```
searchKey: net.parsePort
tags: [function private]
```

```Go
func parsePort(service string) (port int, needsLookup bool)
```

parsePort parses service as a decimal integer and returns the corresponding value as port. It is the caller's responsibility to parse service as a non-decimal integer when needsLookup is true. 

Some system resolvers will return a valid port number when given a number over 65536 (see [https://golang.org/issues/11715](https://golang.org/issues/11715)). Alas, the parser can't bail early on numbers > 65536. Therefore reasonably large/small numbers are parsed in full and rejected if invalid. 

### <a id="parseReadError" href="#parseReadError">func parseReadError(nestedErr error) error</a>

```
searchKey: net.parseReadError
tags: [function private]
```

```Go
func parseReadError(nestedErr error) error
```

parseReadError parses nestedErr and reports whether it is a valid error value from Read functions. It returns nil when nestedErr is valid. 

### <a id="parseWriteError" href="#parseWriteError">func parseWriteError(nestedErr error) error</a>

```
searchKey: net.parseWriteError
tags: [function private]
```

```Go
func parseWriteError(nestedErr error) error
```

parseWriteError parses nestedErr and reports whether it is a valid error value from Write functions. It returns nil when nestedErr is valid. 

### <a id="partialDeadline" href="#partialDeadline">func partialDeadline(now, deadline time.Time, addrsRemaining int) (time.Time, error)</a>

```
searchKey: net.partialDeadline
tags: [function private]
```

```Go
func partialDeadline(now, deadline time.Time, addrsRemaining int) (time.Time, error)
```

partialDeadline returns the deadline to use for a single address, when multiple addresses are pending. 

### <a id="printInflightSockets" href="#printInflightSockets">func printInflightSockets()</a>

```
searchKey: net.printInflightSockets
tags: [function private]
```

```Go
func printInflightSockets()
```

### <a id="printRunningGoroutines" href="#printRunningGoroutines">func printRunningGoroutines()</a>

```
searchKey: net.printRunningGoroutines
tags: [function private]
```

```Go
func printRunningGoroutines()
```

### <a id="printSocketStats" href="#printSocketStats">func printSocketStats()</a>

```
searchKey: net.printSocketStats
tags: [function private]
```

```Go
func printSocketStats()
```

### <a id="randInt" href="#randInt">func randInt() int</a>

```
searchKey: net.randInt
tags: [function private]
```

```Go
func randInt() int
```

### <a id="randIntn" href="#randIntn">func randIntn(n int) int</a>

```
searchKey: net.randIntn
tags: [function private]
```

```Go
func randIntn(n int) int
```

### <a id="readFull" href="#readFull">func readFull(r io.Reader) (all []byte, err error)</a>

```
searchKey: net.readFull
tags: [function private]
```

```Go
func readFull(r io.Reader) (all []byte, err error)
```

### <a id="readHosts" href="#readHosts">func readHosts()</a>

```
searchKey: net.readHosts
tags: [function private]
```

```Go
func readHosts()
```

### <a id="readProtocols" href="#readProtocols">func readProtocols()</a>

```
searchKey: net.readProtocols
tags: [function private]
```

```Go
func readProtocols()
```

readProtocols loads contents of /etc/protocols into protocols map for quick access. 

### <a id="readRawConn" href="#readRawConn">func readRawConn(c syscall.RawConn, b []byte) (int, error)</a>

```
searchKey: net.readRawConn
tags: [function private]
```

```Go
func readRawConn(c syscall.RawConn, b []byte) (int, error)
```

### <a id="readServices" href="#readServices">func readServices()</a>

```
searchKey: net.readServices
tags: [function private]
```

```Go
func readServices()
```

### <a id="releaseThread" href="#releaseThread">func releaseThread()</a>

```
searchKey: net.releaseThread
tags: [function private]
```

```Go
func releaseThread()
```

### <a id="removeComment" href="#removeComment">func removeComment(line []byte) []byte</a>

```
searchKey: net.removeComment
tags: [function private]
```

```Go
func removeComment(line []byte) []byte
```

removeComment returns line, removing any '#' byte and any following bytes. 

### <a id="reverseaddr" href="#reverseaddr">func reverseaddr(addr string) (arpa string, err error)</a>

```
searchKey: net.reverseaddr
tags: [function private]
```

```Go
func reverseaddr(addr string) (arpa string, err error)
```

reverseaddr returns the in-addr.arpa. or ip6.arpa. hostname of the IP address addr suitable for rDNS (PTR) record lookup or an error if it fails to parse the IP address. 

### <a id="roundDurationUp" href="#roundDurationUp">func roundDurationUp(d time.Duration, to time.Duration) time.Duration</a>

```
searchKey: net.roundDurationUp
tags: [function private]
```

```Go
func roundDurationUp(d time.Duration, to time.Duration) time.Duration
```

roundDurationUp rounds d to the next multiple of to. 

### <a id="runningGoroutines" href="#runningGoroutines">func runningGoroutines() []string</a>

```
searchKey: net.runningGoroutines
tags: [function private]
```

```Go
func runningGoroutines() []string
```

runningGoroutines returns a list of remaining goroutines. 

### <a id="samePlatformError" href="#samePlatformError">func samePlatformError(err, want error) bool</a>

```
searchKey: net.samePlatformError
tags: [function private]
```

```Go
func samePlatformError(err, want error) bool
```

### <a id="selfConnect" href="#selfConnect">func selfConnect(fd *netFD, err error) bool</a>

```
searchKey: net.selfConnect
tags: [function private]
```

```Go
func selfConnect(fd *netFD, err error) bool
```

### <a id="sendFile" href="#sendFile">func sendFile(c *netFD, r io.Reader) (n int64, err error, handled bool)</a>

```
searchKey: net.sendFile
tags: [function private]
```

```Go
func sendFile(c *netFD, r io.Reader) (n int64, err error, handled bool)
```

### <a id="setDefaultListenerSockopts" href="#setDefaultListenerSockopts">func setDefaultListenerSockopts(s int) error</a>

```
searchKey: net.setDefaultListenerSockopts
tags: [function private]
```

```Go
func setDefaultListenerSockopts(s int) error
```

### <a id="setDefaultMulticastSockopts" href="#setDefaultMulticastSockopts">func setDefaultMulticastSockopts(s int) error</a>

```
searchKey: net.setDefaultMulticastSockopts
tags: [function private]
```

```Go
func setDefaultMulticastSockopts(s int) error
```

### <a id="setDefaultSockopts" href="#setDefaultSockopts">func setDefaultSockopts(s, family, sotype int, ipv6only bool) error</a>

```
searchKey: net.setDefaultSockopts
tags: [function private]
```

```Go
func setDefaultSockopts(s, family, sotype int, ipv6only bool) error
```

### <a id="setIPv4MreqToInterface" href="#setIPv4MreqToInterface">func setIPv4MreqToInterface(mreq *syscall.IPMreq, ifi *Interface) error</a>

```
searchKey: net.setIPv4MreqToInterface
tags: [function private]
```

```Go
func setIPv4MreqToInterface(mreq *syscall.IPMreq, ifi *Interface) error
```

### <a id="setIPv4MulticastInterface" href="#setIPv4MulticastInterface">func setIPv4MulticastInterface(fd *netFD, ifi *Interface) error</a>

```
searchKey: net.setIPv4MulticastInterface
tags: [function private]
```

```Go
func setIPv4MulticastInterface(fd *netFD, ifi *Interface) error
```

### <a id="setIPv4MulticastLoopback" href="#setIPv4MulticastLoopback">func setIPv4MulticastLoopback(fd *netFD, v bool) error</a>

```
searchKey: net.setIPv4MulticastLoopback
tags: [function private]
```

```Go
func setIPv4MulticastLoopback(fd *netFD, v bool) error
```

### <a id="setIPv6MulticastInterface" href="#setIPv6MulticastInterface">func setIPv6MulticastInterface(fd *netFD, ifi *Interface) error</a>

```
searchKey: net.setIPv6MulticastInterface
tags: [function private]
```

```Go
func setIPv6MulticastInterface(fd *netFD, ifi *Interface) error
```

### <a id="setIPv6MulticastLoopback" href="#setIPv6MulticastLoopback">func setIPv6MulticastLoopback(fd *netFD, v bool) error</a>

```
searchKey: net.setIPv6MulticastLoopback
tags: [function private]
```

```Go
func setIPv6MulticastLoopback(fd *netFD, v bool) error
```

### <a id="setKeepAlive" href="#setKeepAlive">func setKeepAlive(fd *netFD, keepalive bool) error</a>

```
searchKey: net.setKeepAlive
tags: [function private]
```

```Go
func setKeepAlive(fd *netFD, keepalive bool) error
```

### <a id="setKeepAlivePeriod" href="#setKeepAlivePeriod">func setKeepAlivePeriod(fd *netFD, d time.Duration) error</a>

```
searchKey: net.setKeepAlivePeriod
tags: [function private]
```

```Go
func setKeepAlivePeriod(fd *netFD, d time.Duration) error
```

### <a id="setLinger" href="#setLinger">func setLinger(fd *netFD, sec int) error</a>

```
searchKey: net.setLinger
tags: [function private]
```

```Go
func setLinger(fd *netFD, sec int) error
```

### <a id="setNoDelay" href="#setNoDelay">func setNoDelay(fd *netFD, noDelay bool) error</a>

```
searchKey: net.setNoDelay
tags: [function private]
```

```Go
func setNoDelay(fd *netFD, noDelay bool) error
```

### <a id="setReadBuffer" href="#setReadBuffer">func setReadBuffer(fd *netFD, bytes int) error</a>

```
searchKey: net.setReadBuffer
tags: [function private]
```

```Go
func setReadBuffer(fd *netFD, bytes int) error
```

### <a id="setReadMsgCloseOnExec" href="#setReadMsgCloseOnExec">func setReadMsgCloseOnExec(oob []byte)</a>

```
searchKey: net.setReadMsgCloseOnExec
tags: [function private]
```

```Go
func setReadMsgCloseOnExec(oob []byte)
```

### <a id="setWriteBuffer" href="#setWriteBuffer">func setWriteBuffer(fd *netFD, bytes int) error</a>

```
searchKey: net.setWriteBuffer
tags: [function private]
```

```Go
func setWriteBuffer(fd *netFD, bytes int) error
```

### <a id="setupTestData" href="#setupTestData">func setupTestData()</a>

```
searchKey: net.setupTestData
tags: [function private]
```

```Go
func setupTestData()
```

### <a id="simpleMaskLength" href="#simpleMaskLength">func simpleMaskLength(mask IPMask) int</a>

```
searchKey: net.simpleMaskLength
tags: [function private]
```

```Go
func simpleMaskLength(mask IPMask) int
```

If mask is a sequence of 1 bits followed by 0 bits, return the number of 1 bits. 

### <a id="skipToAnswer" href="#skipToAnswer">func skipToAnswer(p *dnsmessage.Parser, qtype dnsmessage.Type) error</a>

```
searchKey: net.skipToAnswer
tags: [function private]
```

```Go
func skipToAnswer(p *dnsmessage.Parser, qtype dnsmessage.Type) error
```

### <a id="sortByRFC6724" href="#sortByRFC6724">func sortByRFC6724(addrs []IPAddr)</a>

```
searchKey: net.sortByRFC6724
tags: [function private]
```

```Go
func sortByRFC6724(addrs []IPAddr)
```

### <a id="sortByRFC6724withSrcs" href="#sortByRFC6724withSrcs">func sortByRFC6724withSrcs(addrs []IPAddr, srcs []IP)</a>

```
searchKey: net.sortByRFC6724withSrcs
tags: [function private]
```

```Go
func sortByRFC6724withSrcs(addrs []IPAddr, srcs []IP)
```

### <a id="sotypeToNet" href="#sotypeToNet">func sotypeToNet(sotype int) string</a>

```
searchKey: net.sotypeToNet
tags: [function private]
```

```Go
func sotypeToNet(sotype int) string
```

### <a id="splice" href="#splice">func splice(c *netFD, r io.Reader) (int64, error, bool)</a>

```
searchKey: net.splice
tags: [function private]
```

```Go
func splice(c *netFD, r io.Reader) (int64, error, bool)
```

### <a id="splitAtBytes" href="#splitAtBytes">func splitAtBytes(s string, t string) []string</a>

```
searchKey: net.splitAtBytes
tags: [function private]
```

```Go
func splitAtBytes(s string, t string) []string
```

Split s at any bytes in t. 

### <a id="splitHostZone" href="#splitHostZone">func splitHostZone(s string) (host, zone string)</a>

```
searchKey: net.splitHostZone
tags: [function private]
```

```Go
func splitHostZone(s string) (host, zone string)
```

### <a id="spuriousENOTAVAIL" href="#spuriousENOTAVAIL">func spuriousENOTAVAIL(err error) bool</a>

```
searchKey: net.spuriousENOTAVAIL
tags: [function private]
```

```Go
func spuriousENOTAVAIL(err error) bool
```

### <a id="srcAddrs" href="#srcAddrs">func srcAddrs(addrs []IPAddr) []IP</a>

```
searchKey: net.srcAddrs
tags: [function private]
```

```Go
func srcAddrs(addrs []IPAddr) []IP
```

srcsAddrs tries to UDP-connect to each address to see if it has a route. (This doesn't send any packets). The destination port number is irrelevant. 

### <a id="srvString" href="#srvString">func srvString(srvs []*SRV) string</a>

```
searchKey: net.srvString
tags: [function private]
```

```Go
func srvString(srvs []*SRV) string
```

### <a id="stat" href="#stat">func stat(name string) (mtime time.Time, size int64, err error)</a>

```
searchKey: net.stat
tags: [function private]
```

```Go
func stat(name string) (mtime time.Time, size int64, err error)
```

### <a id="stringsEqualFold" href="#stringsEqualFold">func stringsEqualFold(s, t string) bool</a>

```
searchKey: net.stringsEqualFold
tags: [function private]
```

```Go
func stringsEqualFold(s, t string) bool
```

stringsEqualFold is strings.EqualFold, ASCII only. It reports whether s and t are equal, ASCII-case-insensitively. 

### <a id="stringsHasPrefix" href="#stringsHasPrefix">func stringsHasPrefix(s, prefix string) bool</a>

```
searchKey: net.stringsHasPrefix
tags: [function private]
```

```Go
func stringsHasPrefix(s, prefix string) bool
```

stringsHasPrefix is strings.HasPrefix. It reports whether s begins with prefix. 

### <a id="stringsHasSuffix" href="#stringsHasSuffix">func stringsHasSuffix(s, suffix string) bool</a>

```
searchKey: net.stringsHasSuffix
tags: [function private]
```

```Go
func stringsHasSuffix(s, suffix string) bool
```

stringsHasSuffix is strings.HasSuffix. It reports whether s ends in suffix. 

### <a id="stringsHasSuffixFold" href="#stringsHasSuffixFold">func stringsHasSuffixFold(s, suffix string) bool</a>

```
searchKey: net.stringsHasSuffixFold
tags: [function private]
```

```Go
func stringsHasSuffixFold(s, suffix string) bool
```

stringsHasSuffixFold reports whether s ends in suffix, ASCII-case-insensitively. 

### <a id="stripIPv4Header" href="#stripIPv4Header">func stripIPv4Header(n int, b []byte) int</a>

```
searchKey: net.stripIPv4Header
tags: [function private]
```

```Go
func stripIPv4Header(n int, b []byte) int
```

### <a id="supportsIPv4" href="#supportsIPv4">func supportsIPv4() bool</a>

```
searchKey: net.supportsIPv4
tags: [function private]
```

```Go
func supportsIPv4() bool
```

supportsIPv4 reports whether the platform supports IPv4 networking functionality. 

### <a id="supportsIPv4map" href="#supportsIPv4map">func supportsIPv4map() bool</a>

```
searchKey: net.supportsIPv4map
tags: [function private]
```

```Go
func supportsIPv4map() bool
```

supportsIPv4map reports whether the platform supports mapping an IPv4 address inside an IPv6 address at transport layer protocols. See RFC 4291, RFC 4038 and RFC 3493. 

### <a id="supportsIPv6" href="#supportsIPv6">func supportsIPv6() bool</a>

```
searchKey: net.supportsIPv6
tags: [function private]
```

```Go
func supportsIPv6() bool
```

supportsIPv6 reports whether the platform supports IPv6 networking functionality. 

### <a id="sysSocket" href="#sysSocket">func sysSocket(family, sotype, proto int) (int, error)</a>

```
searchKey: net.sysSocket
tags: [function private]
```

```Go
func sysSocket(family, sotype, proto int) (int, error)
```

Wrapper around the socket system call that marks the returned file descriptor as nonblocking and close-on-exec. 

### <a id="testBuffer_writeTo" href="#testBuffer_writeTo">func testBuffer_writeTo(t *testing.T, chunks int, useCopy bool)</a>

```
searchKey: net.testBuffer_writeTo
tags: [function private]
```

```Go
func testBuffer_writeTo(t *testing.T, chunks int, useCopy bool)
```

### <a id="testDots" href="#testDots">func testDots(t *testing.T, mode string)</a>

```
searchKey: net.testDots
tags: [function private]
```

```Go
func testDots(t *testing.T, mode string)
```

### <a id="testRotate" href="#testRotate">func testRotate(t *testing.T, rotate bool, nameservers, wantServers []string)</a>

```
searchKey: net.testRotate
tags: [function private]
```

```Go
func testRotate(t *testing.T, rotate bool, nameservers, wantServers []string)
```

### <a id="testStaticAddr" href="#testStaticAddr">func testStaticAddr(t *testing.T, hostsPath string, ent staticHostEntry)</a>

```
searchKey: net.testStaticAddr
tags: [function private]
```

```Go
func testStaticAddr(t *testing.T, hostsPath string, ent staticHostEntry)
```

### <a id="testStaticHost" href="#testStaticHost">func testStaticHost(t *testing.T, hostsPath string, ent staticHostEntry)</a>

```
searchKey: net.testStaticHost
tags: [function private]
```

```Go
func testStaticHost(t *testing.T, hostsPath string, ent staticHostEntry)
```

### <a id="testUniformity" href="#testUniformity">func testUniformity(t *testing.T, size int, margin float64)</a>

```
searchKey: net.testUniformity
tags: [function private]
```

```Go
func testUniformity(t *testing.T, size int, margin float64)
```

### <a id="testUnixAddr" href="#testUnixAddr">func testUnixAddr() string</a>

```
searchKey: net.testUnixAddr
tags: [function private]
```

```Go
func testUnixAddr() string
```

testUnixAddr uses os.CreateTemp to get a name that is unique. 

### <a id="testUnixgramWriteConn" href="#testUnixgramWriteConn">func testUnixgramWriteConn(t *testing.T, raddr *UnixAddr)</a>

```
searchKey: net.testUnixgramWriteConn
tags: [function private]
```

```Go
func testUnixgramWriteConn(t *testing.T, raddr *UnixAddr)
```

### <a id="testUnixgramWritePacketConn" href="#testUnixgramWritePacketConn">func testUnixgramWritePacketConn(t *testing.T, raddr *UnixAddr)</a>

```
searchKey: net.testUnixgramWritePacketConn
tags: [function private]
```

```Go
func testUnixgramWritePacketConn(t *testing.T, raddr *UnixAddr)
```

### <a id="testVariousDeadlines" href="#testVariousDeadlines">func testVariousDeadlines(t *testing.T)</a>

```
searchKey: net.testVariousDeadlines
tags: [function private]
```

```Go
func testVariousDeadlines(t *testing.T)
```

### <a id="testWeighting" href="#testWeighting">func testWeighting(t *testing.T, margin float64)</a>

```
searchKey: net.testWeighting
tags: [function private]
```

```Go
func testWeighting(t *testing.T, margin float64)
```

### <a id="testWriteToConn" href="#testWriteToConn">func testWriteToConn(t *testing.T, raddr string)</a>

```
searchKey: net.testWriteToConn
tags: [function private]
```

```Go
func testWriteToConn(t *testing.T, raddr string)
```

### <a id="testWriteToPacketConn" href="#testWriteToPacketConn">func testWriteToPacketConn(t *testing.T, raddr string)</a>

```
searchKey: net.testWriteToPacketConn
tags: [function private]
```

```Go
func testWriteToPacketConn(t *testing.T, raddr string)
```

### <a id="testableAddress" href="#testableAddress">func testableAddress(network, address string) bool</a>

```
searchKey: net.testableAddress
tags: [function private]
```

```Go
func testableAddress(network, address string) bool
```

testableAddress reports whether address of network is testable on the current platform configuration. 

### <a id="testableListenArgs" href="#testableListenArgs">func testableListenArgs(network, address, client string) bool</a>

```
searchKey: net.testableListenArgs
tags: [function private]
```

```Go
func testableListenArgs(network, address, client string) bool
```

testableListenArgs reports whether arguments are testable on the current platform configuration. 

### <a id="testableNetwork" href="#testableNetwork">func testableNetwork(network string) bool</a>

```
searchKey: net.testableNetwork
tags: [function private]
```

```Go
func testableNetwork(network string) bool
```

testableNetwork reports whether network is testable on the current platform configuration. 

### <a id="timeoutPacketReceiver" href="#timeoutPacketReceiver">func timeoutPacketReceiver(c PacketConn, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: net.timeoutPacketReceiver
tags: [function private]
```

```Go
func timeoutPacketReceiver(c PacketConn, d, min, max time.Duration, ch chan<- error)
```

### <a id="timeoutReceiver" href="#timeoutReceiver">func timeoutReceiver(c Conn, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: net.timeoutReceiver
tags: [function private]
```

```Go
func timeoutReceiver(c Conn, d, min, max time.Duration, ch chan<- error)
```

### <a id="timeoutTransmitter" href="#timeoutTransmitter">func timeoutTransmitter(c Conn, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: net.timeoutTransmitter
tags: [function private]
```

```Go
func timeoutTransmitter(c Conn, d, min, max time.Duration, ch chan<- error)
```

### <a id="transceiver" href="#transceiver">func transceiver(c Conn, wb []byte, ch chan<- error)</a>

```
searchKey: net.transceiver
tags: [function private]
```

```Go
func transceiver(c Conn, wb []byte, ch chan<- error)
```

### <a id="trimSpace" href="#trimSpace">func trimSpace(x []byte) []byte</a>

```
searchKey: net.trimSpace
tags: [function private]
```

```Go
func trimSpace(x []byte) []byte
```

trimSpace returns x without any leading or trailing ASCII whitespace. 

### <a id="ubtoa" href="#ubtoa">func ubtoa(dst []byte, start int, v byte) int</a>

```
searchKey: net.ubtoa
tags: [function private]
```

```Go
func ubtoa(dst []byte, start int, v byte) int
```

ubtoa encodes the string form of the integer v to dst[start:] and returns the number of bytes written to dst. The caller must ensure that dst has sufficient length. 

### <a id="uninstallTestHooks" href="#uninstallTestHooks">func uninstallTestHooks()</a>

```
searchKey: net.uninstallTestHooks
tags: [function private]
```

```Go
func uninstallTestHooks()
```

### <a id="withTCPConnPair" href="#withTCPConnPair">func withTCPConnPair(t *testing.T, peer1, peer2 func(c *TCPConn) error)</a>

```
searchKey: net.withTCPConnPair
tags: [function private]
```

```Go
func withTCPConnPair(t *testing.T, peer1, peer2 func(c *TCPConn) error)
```

withTCPConnPair sets up a TCP connection between two peers, then runs peer1 and peer2 concurrently. withTCPConnPair returns when both have completed. 

### <a id="withUnexpiredValuesPreserved" href="#withUnexpiredValuesPreserved">func withUnexpiredValuesPreserved(lookupCtx context.Context) context.Context</a>

```
searchKey: net.withUnexpiredValuesPreserved
tags: [function private]
```

```Go
func withUnexpiredValuesPreserved(lookupCtx context.Context) context.Context
```

withUnexpiredValuesPreserved returns a context.Context that only uses lookupCtx for its values, otherwise it is never canceled and has no deadline. If the lookup context expires, any looked up values will return nil. See Issue 28600. 

### <a id="wrapSyscallError" href="#wrapSyscallError">func wrapSyscallError(name string, err error) error</a>

```
searchKey: net.wrapSyscallError
tags: [function private]
```

```Go
func wrapSyscallError(name string, err error) error
```

wrapSyscallError takes an error and a syscall name. If the error is a syscall.Errno, it wraps it in a os.SyscallError using the syscall name. 

### <a id="writeRawConn" href="#writeRawConn">func writeRawConn(c syscall.RawConn, b []byte) error</a>

```
searchKey: net.writeRawConn
tags: [function private]
```

```Go
func writeRawConn(c syscall.RawConn, b []byte) error
```

### <a id="xtoi" href="#xtoi">func xtoi(s string) (n int, i int, ok bool)</a>

```
searchKey: net.xtoi
tags: [function private]
```

```Go
func xtoi(s string) (n int, i int, ok bool)
```

Hexadecimal to integer. Returns number, characters consumed, success. 

### <a id="xtoi2" href="#xtoi2">func xtoi2(s string, e byte) (byte, bool)</a>

```
searchKey: net.xtoi2
tags: [function private]
```

```Go
func xtoi2(s string, e byte) (byte, bool)
```

xtoi2 converts the next two hex digits of s into a byte. If s is longer than 2 bytes then the third byte must be e. If the first two bytes of s are not hex digits or the third byte does not match e, false is returned. 

