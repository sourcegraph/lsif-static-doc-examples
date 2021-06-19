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
  * [std/net/internal](net/internal.md)
  * [std/net/http](net/http.md)
  * [std/net/http_test](net/http_test.md)
  * [std/net/mail](net/mail.md)
  * [std/net/mail_test](net/mail_test.md)
  * [std/net/rpc](net/rpc.md)
  * [std/net/smtp](net/smtp.md)
  * [std/net/smtp_test](net/smtp_test.md)
  * [std/net/textproto](net/textproto.md)
  * [std/net/url](net/url.md)
  * [std/net/url_test](net/url_test.md)
* [Constants](#const)
    * [const scopeInterfaceLocal](#scopeInterfaceLocal)
    * [const scopeLinkLocal](#scopeLinkLocal)
    * [const scopeAdminLocal](#scopeAdminLocal)
    * [const scopeSiteLocal](#scopeSiteLocal)
    * [const scopeOrgLocal](#scopeOrgLocal)
    * [const scopeGlobal](#scopeGlobal)
    * [const defaultTCPKeepAlive](#defaultTCPKeepAlive)
    * [const useTCPOnly](#useTCPOnly)
    * [const useUDPOrTCP](#useUDPOrTCP)
    * [const hostLookupCgo](#hostLookupCgo)
    * [const hostLookupFilesDNS](#hostLookupFilesDNS)
    * [const hostLookupDNSFiles](#hostLookupDNSFiles)
    * [const hostLookupFiles](#hostLookupFiles)
    * [const hostLookupDNS](#hostLookupDNS)
    * [const readSyscallName](#readSyscallName)
    * [const readFromSyscallName](#readFromSyscallName)
    * [const readMsgSyscallName](#readMsgSyscallName)
    * [const writeSyscallName](#writeSyscallName)
    * [const writeToSyscallName](#writeToSyscallName)
    * [const writeMsgSyscallName](#writeMsgSyscallName)
    * [const cacheMaxAge](#cacheMaxAge)
    * [const FlagUp](#FlagUp)
    * [const FlagBroadcast](#FlagBroadcast)
    * [const FlagLoopback](#FlagLoopback)
    * [const FlagPointToPoint](#FlagPointToPoint)
    * [const FlagMulticast](#FlagMulticast)
    * [const IPv4len](#IPv4len)
    * [const IPv6len](#IPv6len)
    * [const maxProtoLength](#maxProtoLength)
    * [const maxPortBufSize](#maxPortBufSize)
    * [const hexDigit](#hexDigit)
    * [const big](#big)
    * [const sysTCP_KEEPINTVL](#sysTCP_KEEPINTVL)
    * [const readMsgFlags](#readMsgFlags)
    * [const someTimeout](#someTimeout)
    * [const slowDst4](#slowDst4)
    * [const slowDst6](#slowDst6)
    * [const ubuntuTrustyAvahi](#ubuntuTrustyAvahi)
    * [const newton](#newton)
    * [const newtonLen](#newtonLen)
    * [const newtonSHA256](#newtonSHA256)
    * [const cgoAddrInfoFlags](#cgoAddrInfoFlags)
    * [const nameinfoLen](#nameinfoLen)
    * [const maxNameinfoLen](#maxNameinfoLen)
* [Variables](#var)
    * [var rfc6724policyTable](#rfc6724policyTable)
    * [var confOnce](#confOnce)
    * [var confVal](#confVal)
    * [var errLameReferral](#errLameReferral)
    * [var errCannotUnmarshalDNSMessage](#errCannotUnmarshalDNSMessage)
    * [var errCannotMarshalDNSMessage](#errCannotMarshalDNSMessage)
    * [var errServerMisbehaving](#errServerMisbehaving)
    * [var errInvalidDNSResponse](#errInvalidDNSResponse)
    * [var errNoAnswerFromDNSServer](#errNoAnswerFromDNSServer)
    * [var errServerTemporarilyMisbehaving](#errServerTemporarilyMisbehaving)
    * [var resolvConf](#resolvConf)
    * [var lookupOrderName](#lookupOrderName)
    * [var defaultNS](#defaultNS)
    * [var getHostname](#getHostname)
    * [var testHookDialTCP](#testHookDialTCP)
    * [var testHookHostsPath](#testHookHostsPath)
    * [var testHookLookupIP](#testHookLookupIP)
    * [var testHookSetKeepAlive](#testHookSetKeepAlive)
    * [var testHookDialChannel](#testHookDialChannel)
    * [var testHookCanceledDial](#testHookCanceledDial)
    * [var socketFunc](#socketFunc)
    * [var connectFunc](#connectFunc)
    * [var listenFunc](#listenFunc)
    * [var getsockoptIntFunc](#getsockoptIntFunc)
    * [var hosts](#hosts)
    * [var errInvalidInterface](#errInvalidInterface)
    * [var errInvalidInterfaceIndex](#errInvalidInterfaceIndex)
    * [var errInvalidInterfaceName](#errInvalidInterfaceName)
    * [var errNoSuchInterface](#errNoSuchInterface)
    * [var errNoSuchMulticastInterface](#errNoSuchMulticastInterface)
    * [var flagNames](#flagNames)
    * [var zoneCache](#zoneCache)
    * [var v4InV6Prefix](#v4InV6Prefix)
    * [var IPv4bcast](#IPv4bcast)
    * [var IPv4allsys](#IPv4allsys)
    * [var IPv4allrouter](#IPv4allrouter)
    * [var IPv4zero](#IPv4zero)
    * [var IPv6zero](#IPv6zero)
    * [var IPv6unspecified](#IPv6unspecified)
    * [var IPv6loopback](#IPv6loopback)
    * [var IPv6interfacelocalallnodes](#IPv6interfacelocalallnodes)
    * [var IPv6linklocalallnodes](#IPv6linklocalallnodes)
    * [var IPv6linklocalallrouters](#IPv6linklocalallrouters)
    * [var classAMask](#classAMask)
    * [var classBMask](#classBMask)
    * [var classCMask](#classCMask)
    * [var ipStackCaps](#ipStackCaps)
    * [var protocols](#protocols)
    * [var services](#services)
    * [var dnsWaitGroup](#dnsWaitGroup)
    * [var DefaultResolver](#DefaultResolver)
    * [var onceReadProtocols](#onceReadProtocols)
    * [var netGo](#netGo)
    * [var netCgo](#netCgo)
    * [var listenerBacklogCache](#listenerBacklogCache)
    * [var errNoSuitableAddress](#errNoSuitableAddress)
    * [var errMissingAddress](#errMissingAddress)
    * [var errCanceled](#errCanceled)
    * [var ErrWriteToConnected](#ErrWriteToConnected)
    * [var aLongTimeAgo](#aLongTimeAgo)
    * [var noDeadline](#noDeadline)
    * [var noCancel](#noCancel)
    * [var errTimeout](#errTimeout)
    * [var errNoSuchHost](#errNoSuchHost)
    * [var errClosed](#errClosed)
    * [var ErrClosed](#ErrClosed)
    * [var threadLimit](#threadLimit)
    * [var threadOnce](#threadOnce)
    * [var onceReadServices](#onceReadServices)
    * [var defaultResolvConf](#defaultResolvConf)
    * [var prohibitionaryDialArgTests](#prohibitionaryDialArgTests)
    * [var goResolver](#goResolver)
    * [var TestAddr](#TestAddr)
    * [var TestAddr6](#TestAddr6)
    * [var dnsTransportFallbackTests](#dnsTransportFallbackTests)
    * [var specialDomainNameTests](#specialDomainNameTests)
    * [var fakeDNSServerSuccessful](#fakeDNSServerSuccessful)
    * [var updateResolvConfTests](#updateResolvConfTests)
    * [var goLookupIPWithResolverConfigTests](#goLookupIPWithResolverConfigTests)
    * [var dnsReadConfigTests](#dnsReadConfigTests)
    * [var dnsDefaultSearchTests](#dnsDefaultSearchTests)
    * [var dnsNameTests](#dnsNameTests)
    * [var dialErrorTests](#dialErrorTests)
    * [var listenErrorTests](#listenErrorTests)
    * [var listenPacketErrorTests](#listenPacketErrorTests)
    * [var errTimedout](#errTimedout)
    * [var errOpNotSupported](#errOpNotSupported)
    * [var abortedConnRequestErrors](#abortedConnRequestErrors)
    * [var dialGoogleTests](#dialGoogleTests)
    * [var literalAddrs4](#literalAddrs4)
    * [var literalAddrs6](#literalAddrs6)
    * [var fileConnTests](#fileConnTests)
    * [var fileListenerTests](#fileListenerTests)
    * [var filePacketConnTests](#filePacketConnTests)
    * [var lookupStaticHostTests](#lookupStaticHostTests)
    * [var lookupStaticAddrTests](#lookupStaticAddrTests)
    * [var parseIPTests](#parseIPTests)
    * [var ipStringTests](#ipStringTests)
    * [var sink](#sink)
    * [var ipMaskTests](#ipMaskTests)
    * [var ipMaskStringTests](#ipMaskStringTests)
    * [var parseCIDRTests](#parseCIDRTests)
    * [var ipNetContainsTests](#ipNetContainsTests)
    * [var ipNetStringTests](#ipNetStringTests)
    * [var cidrMaskTests](#cidrMaskTests)
    * [var v4addr](#v4addr)
    * [var v4mappedv6addr](#v4mappedv6addr)
    * [var v6addr](#v6addr)
    * [var v4mask](#v4mask)
    * [var v4mappedv6mask](#v4mappedv6mask)
    * [var v6mask](#v6mask)
    * [var badaddr](#badaddr)
    * [var badmask](#badmask)
    * [var v4maskzero](#v4maskzero)
    * [var networkNumberAndMaskTests](#networkNumberAndMaskTests)
    * [var ipAddrFamilyTests](#ipAddrFamilyTests)
    * [var ipAddrScopeTests](#ipAddrScopeTests)
    * [var resolveIPAddrTests](#resolveIPAddrTests)
    * [var ipConnLocalNameTests](#ipConnLocalNameTests)
    * [var testInetaddr](#testInetaddr)
    * [var addrListTests](#addrListTests)
    * [var tcpListenerTests](#tcpListenerTests)
    * [var udpListenerTests](#udpListenerTests)
    * [var dualStackTCPListenerTests](#dualStackTCPListenerTests)
    * [var dualStackUDPListenerTests](#dualStackUDPListenerTests)
    * [var ipv4MulticastListenerTests](#ipv4MulticastListenerTests)
    * [var ipv6MulticastListenerTests](#ipv6MulticastListenerTests)
    * [var lookupGoogleSRVTests](#lookupGoogleSRVTests)
    * [var backoffDuration](#backoffDuration)
    * [var lookupGmailMXTests](#lookupGmailMXTests)
    * [var lookupGmailNSTests](#lookupGmailNSTests)
    * [var lookupGmailTXTTests](#lookupGmailTXTTests)
    * [var lookupGooglePublicDNSAddrTests](#lookupGooglePublicDNSAddrTests)
    * [var lookupCNAMETests](#lookupCNAMETests)
    * [var lookupGoogleHostTests](#lookupGoogleHostTests)
    * [var lookupGoogleIPTests](#lookupGoogleIPTests)
    * [var revAddrTests](#revAddrTests)
    * [var ipVersionTests](#ipVersionTests)
    * [var parseMACTests](#parseMACTests)
    * [var sw](#sw)
    * [var testHookUninstaller](#testHookUninstaller)
    * [var testTCPBig](#testTCPBig)
    * [var testDNSFlood](#testDNSFlood)
    * [var testIPv4](#testIPv4)
    * [var testIPv6](#testIPv6)
    * [var ipv6LinkLocalUnicastTCPTests](#ipv6LinkLocalUnicastTCPTests)
    * [var ipv6LinkLocalUnicastUDPTests](#ipv6LinkLocalUnicastUDPTests)
    * [var origSocket](#origSocket)
    * [var origClose](#origClose)
    * [var origConnect](#origConnect)
    * [var origListen](#origListen)
    * [var origAccept](#origAccept)
    * [var origGetsockoptInt](#origGetsockoptInt)
    * [var extraTestHookInstallers](#extraTestHookInstallers)
    * [var extraTestHookUninstallers](#extraTestHookUninstallers)
    * [var packetConnTests](#packetConnTests)
    * [var unixEnabledOnAIX](#unixEnabledOnAIX)
    * [var parsePortTests](#parsePortTests)
    * [var tcpServerTests](#tcpServerTests)
    * [var unixAndUnixpacketServerTests](#unixAndUnixpacketServerTests)
    * [var udpServerTests](#udpServerTests)
    * [var unixgramServerTests](#unixgramServerTests)
    * [var resolveTCPAddrTests](#resolveTCPAddrTests)
    * [var tcpListenerNameTests](#tcpListenerNameTests)
    * [var dialTimeoutTests](#dialTimeoutTests)
    * [var dialTimeoutMaxDurationTests](#dialTimeoutMaxDurationTests)
    * [var acceptTimeoutTests](#acceptTimeoutTests)
    * [var readTimeoutTests](#readTimeoutTests)
    * [var readFromTimeoutTests](#readFromTimeoutTests)
    * [var writeTimeoutTests](#writeTimeoutTests)
    * [var writeToTimeoutTests](#writeToTimeoutTests)
    * [var resolveUDPAddrTests](#resolveUDPAddrTests)
    * [var udpConnLocalNameTests](#udpConnLocalNameTests)
* [Types](#type)
    * [type ipAttr struct](#ipAttr)
        * [func ipAttrOf(ip IP) ipAttr](#ipAttrOf)
    * [type byRFC6724 struct](#byRFC6724)
        * [func (s *byRFC6724) Len() int](#byRFC6724.Len)
        * [func (s *byRFC6724) Swap(i, j int)](#byRFC6724.Swap)
        * [func (s *byRFC6724) Less(i, j int) bool](#byRFC6724.Less)
    * [type policyTableEntry struct](#policyTableEntry)
    * [type policyTable []net.policyTableEntry](#policyTable)
        * [func (t policyTable) Classify(ip IP) policyTableEntry](#policyTable.Classify)
    * [type byMaskLength []net.policyTableEntry](#byMaskLength)
        * [func (s byMaskLength) Len() int](#byMaskLength.Len)
        * [func (s byMaskLength) Swap(i, j int)](#byMaskLength.Swap)
        * [func (s byMaskLength) Less(i, j int) bool](#byMaskLength.Less)
    * [type scope uint8](#scope)
        * [func classifyScope(ip IP) scope](#classifyScope)
    * [type conf struct](#conf)
        * [func systemConf() *conf](#systemConf)
        * [func (c *conf) canUseCgo() bool](#conf.canUseCgo)
        * [func (c *conf) hostLookupOrder(r *Resolver, hostname string) (ret hostLookupOrder)](#conf.hostLookupOrder)
    * [type Dialer struct](#Dialer)
        * [func (d *Dialer) dualStack() bool](#Dialer.dualStack)
        * [func (d *Dialer) deadline(ctx context.Context, now time.Time) (earliest time.Time)](#Dialer.deadline)
        * [func (d *Dialer) resolver() *Resolver](#Dialer.resolver)
        * [func (d *Dialer) fallbackDelay() time.Duration](#Dialer.fallbackDelay)
        * [func (d *Dialer) Dial(network, address string) (Conn, error)](#Dialer.Dial)
        * [func (d *Dialer) DialContext(ctx context.Context, network, address string) (Conn, error)](#Dialer.DialContext)
    * [type sysDialer struct](#sysDialer)
        * [func (sd *sysDialer) dialParallel(ctx context.Context, primaries, fallbacks addrList) (Conn, error)](#sysDialer.dialParallel)
        * [func (sd *sysDialer) dialSerial(ctx context.Context, ras addrList) (Conn, error)](#sysDialer.dialSerial)
        * [func (sd *sysDialer) dialSingle(ctx context.Context, ra Addr) (c Conn, err error)](#sysDialer.dialSingle)
        * [func (sd *sysDialer) dialIP(ctx context.Context, laddr, raddr *IPAddr) (*IPConn, error)](#sysDialer.dialIP)
        * [func (sd *sysDialer) dialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)](#sysDialer.dialTCP)
        * [func (sd *sysDialer) doDialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)](#sysDialer.doDialTCP)
        * [func (sd *sysDialer) dialUDP(ctx context.Context, laddr, raddr *UDPAddr) (*UDPConn, error)](#sysDialer.dialUDP)
        * [func (sd *sysDialer) dialUnix(ctx context.Context, laddr, raddr *UnixAddr) (*UnixConn, error)](#sysDialer.dialUnix)
    * [type ListenConfig struct](#ListenConfig)
        * [func (lc *ListenConfig) Listen(ctx context.Context, network, address string) (Listener, error)](#ListenConfig.Listen)
        * [func (lc *ListenConfig) ListenPacket(ctx context.Context, network, address string) (PacketConn, error)](#ListenConfig.ListenPacket)
    * [type sysListener struct](#sysListener)
        * [func (sl *sysListener) listenIP(ctx context.Context, laddr *IPAddr) (*IPConn, error)](#sysListener.listenIP)
        * [func (sl *sysListener) listenTCP(ctx context.Context, laddr *TCPAddr) (*TCPListener, error)](#sysListener.listenTCP)
        * [func (sl *sysListener) listenUDP(ctx context.Context, laddr *UDPAddr) (*UDPConn, error)](#sysListener.listenUDP)
        * [func (sl *sysListener) listenMulticastUDP(ctx context.Context, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)](#sysListener.listenMulticastUDP)
        * [func (sl *sysListener) listenUnix(ctx context.Context, laddr *UnixAddr) (*UnixListener, error)](#sysListener.listenUnix)
        * [func (sl *sysListener) listenUnixgram(ctx context.Context, laddr *UnixAddr) (*UnixConn, error)](#sysListener.listenUnixgram)
    * [type SRV struct](#SRV)
    * [type byPriorityWeight []*net.SRV](#byPriorityWeight)
        * [func (s byPriorityWeight) Len() int](#byPriorityWeight.Len)
        * [func (s byPriorityWeight) Less(i, j int) bool](#byPriorityWeight.Less)
        * [func (s byPriorityWeight) Swap(i, j int)](#byPriorityWeight.Swap)
        * [func (addrs byPriorityWeight) shuffleByWeight()](#byPriorityWeight.shuffleByWeight)
        * [func (addrs byPriorityWeight) sort()](#byPriorityWeight.sort)
    * [type MX struct](#MX)
    * [type byPref []*net.MX](#byPref)
        * [func (s byPref) Len() int](#byPref.Len)
        * [func (s byPref) Less(i, j int) bool](#byPref.Less)
        * [func (s byPref) Swap(i, j int)](#byPref.Swap)
        * [func (s byPref) sort()](#byPref.sort)
    * [type NS struct](#NS)
    * [type resolverConfig struct](#resolverConfig)
        * [func (conf *resolverConfig) init()](#resolverConfig.init)
        * [func (conf *resolverConfig) tryUpdate(name string)](#resolverConfig.tryUpdate)
        * [func (conf *resolverConfig) tryAcquireSema() bool](#resolverConfig.tryAcquireSema)
        * [func (conf *resolverConfig) releaseSema()](#resolverConfig.releaseSema)
    * [type hostLookupOrder int](#hostLookupOrder)
        * [func (o hostLookupOrder) String() string](#hostLookupOrder.String)
    * [type dnsConfig struct](#dnsConfig)
        * [func dnsReadConfig(filename string) *dnsConfig](#dnsReadConfig)
        * [func (conf *dnsConfig) nameList(name string) []string](#dnsConfig.nameList)
        * [func (c *dnsConfig) serverOffset() uint32](#dnsConfig.serverOffset)
    * [type netFD struct](#netFD)
        * [func newFD(sysfd, family, sotype int, net string) (*netFD, error)](#newFD)
        * [func newFileFD(f *os.File) (*netFD, error)](#newFileFD)
        * [func internetSocket(ctx context.Context, net string, laddr, raddr sockaddr, sotype, proto int, mode string, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)](#internetSocket)
        * [func socket(ctx context.Context, net string, family, sotype, proto int, ipv6only bool, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)](#socket)
        * [func unixSocket(ctx context.Context, net string, laddr, raddr sockaddr, mode string, ctrlFn func(string, string, syscall.RawConn) error) (*netFD, error)](#unixSocket)
        * [func (fd *netFD) setAddr(laddr, raddr Addr)](#netFD.setAddr)
        * [func (fd *netFD) Close() error](#netFD.Close)
        * [func (fd *netFD) shutdown(how int) error](#netFD.shutdown)
        * [func (fd *netFD) closeRead() error](#netFD.closeRead)
        * [func (fd *netFD) closeWrite() error](#netFD.closeWrite)
        * [func (fd *netFD) Read(p []byte) (n int, err error)](#netFD.Read)
        * [func (fd *netFD) readFrom(p []byte) (n int, sa syscall.Sockaddr, err error)](#netFD.readFrom)
        * [func (fd *netFD) readMsg(p []byte, oob []byte, flags int) (n, oobn, retflags int, sa syscall.Sockaddr, err error)](#netFD.readMsg)
        * [func (fd *netFD) Write(p []byte) (nn int, err error)](#netFD.Write)
        * [func (fd *netFD) writeTo(p []byte, sa syscall.Sockaddr) (n int, err error)](#netFD.writeTo)
        * [func (fd *netFD) writeMsg(p []byte, oob []byte, sa syscall.Sockaddr) (n int, oobn int, err error)](#netFD.writeMsg)
        * [func (fd *netFD) SetDeadline(t time.Time) error](#netFD.SetDeadline)
        * [func (fd *netFD) SetReadDeadline(t time.Time) error](#netFD.SetReadDeadline)
        * [func (fd *netFD) SetWriteDeadline(t time.Time) error](#netFD.SetWriteDeadline)
        * [func (fd *netFD) init() error](#netFD.init)
        * [func (fd *netFD) name() string](#netFD.name)
        * [func (fd *netFD) connect(ctx context.Context, la, ra syscall.Sockaddr) (rsa syscall.Sockaddr, ret error)](#netFD.connect)
        * [func (fd *netFD) accept() (netfd *netFD, err error)](#netFD.accept)
        * [func (fd *netFD) dup() (f *os.File, err error)](#netFD.dup)
        * [func (fd *netFD) ctrlNetwork() string](#netFD.ctrlNetwork)
        * [func (fd *netFD) addrFunc() func(syscall.Sockaddr) Addr](#netFD.addrFunc)
        * [func (fd *netFD) dial(ctx context.Context, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error](#netFD.dial)
        * [func (fd *netFD) listenStream(laddr sockaddr, backlog int, ctrlFn func(string, string, syscall.RawConn) error) error](#netFD.listenStream)
        * [func (fd *netFD) listenDatagram(laddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error](#netFD.listenDatagram)
        * [func (fd *netFD) writeBuffers(v *Buffers) (n int64, err error)](#netFD.writeBuffers)
    * [type fileAddr string](#fileAddr)
        * [func (fileAddr) Network() string](#fileAddr.Network)
        * [func (f fileAddr) String() string](#fileAddr.String)
    * [type Interface struct](#Interface)
        * [func InterfaceByIndex(index int) (*Interface, error)](#InterfaceByIndex)
        * [func interfaceByIndex(ift []Interface, index int) (*Interface, error)](#interfaceByIndex)
        * [func InterfaceByName(name string) (*Interface, error)](#InterfaceByName)
        * [func ipv4AddrToInterface(ip IP) (*Interface, error)](#ipv4AddrToInterface)
        * [func loopbackInterface() *Interface](#loopbackInterface)
        * [func (ifi *Interface) Addrs() ([]Addr, error)](#Interface.Addrs)
        * [func (ifi *Interface) MulticastAddrs() ([]Addr, error)](#Interface.MulticastAddrs)
    * [type Flags uint](#Flags)
        * [func linkFlags(rawFlags int) Flags](#linkFlags)
        * [func (f Flags) String() string](#Flags.String)
    * [type ipv6ZoneCache struct](#ipv6ZoneCache)
        * [func (zc *ipv6ZoneCache) update(ift []Interface, force bool) (updated bool)](#ipv6ZoneCache.update)
        * [func (zc *ipv6ZoneCache) name(index int) string](#ipv6ZoneCache.name)
        * [func (zc *ipv6ZoneCache) index(name string) int](#ipv6ZoneCache.index)
    * [type IP []byte](#IP)
        * [func IPv4(a, b, c, d byte) IP](#IPv4)
        * [func networkNumberAndMask(n *IPNet) (ip IP, m IPMask)](#networkNumberAndMask)
        * [func parseIPv4(s string) IP](#parseIPv4)
        * [func parseIPv6Zone(s string) (IP, string)](#parseIPv6Zone)
        * [func parseIPv6(s string) (ip IP)](#parseIPv6)
        * [func ParseIP(s string) IP](#ParseIP)
        * [func parseIPZone(s string) (IP, string)](#parseIPZone)
        * [func ParseCIDR(s string) (IP, *IPNet, error)](#ParseCIDR)
        * [func loopbackIP(net string) IP](#loopbackIP)
        * [func interfaceToIPv4Addr(ifi *Interface) (IP, error)](#interfaceToIPv4Addr)
        * [func copyIP(x IP) IP](#copyIP)
        * [func (ip IP) IsUnspecified() bool](#IP.IsUnspecified)
        * [func (ip IP) IsLoopback() bool](#IP.IsLoopback)
        * [func (ip IP) IsPrivate() bool](#IP.IsPrivate)
        * [func (ip IP) IsMulticast() bool](#IP.IsMulticast)
        * [func (ip IP) IsInterfaceLocalMulticast() bool](#IP.IsInterfaceLocalMulticast)
        * [func (ip IP) IsLinkLocalMulticast() bool](#IP.IsLinkLocalMulticast)
        * [func (ip IP) IsLinkLocalUnicast() bool](#IP.IsLinkLocalUnicast)
        * [func (ip IP) IsGlobalUnicast() bool](#IP.IsGlobalUnicast)
        * [func (ip IP) To4() IP](#IP.To4)
        * [func (ip IP) To16() IP](#IP.To16)
        * [func (ip IP) DefaultMask() IPMask](#IP.DefaultMask)
        * [func (ip IP) Mask(mask IPMask) IP](#IP.Mask)
        * [func (ip IP) String() string](#IP.String)
        * [func (ip IP) MarshalText() ([]byte, error)](#IP.MarshalText)
        * [func (ip *IP) UnmarshalText(text []byte) error](#IP.UnmarshalText)
        * [func (ip IP) Equal(x IP) bool](#IP.Equal)
        * [func (ip IP) matchAddrFamily(x IP) bool](#IP.matchAddrFamily)
    * [type IPMask []byte](#IPMask)
        * [func IPv4Mask(a, b, c, d byte) IPMask](#IPv4Mask)
        * [func CIDRMask(ones, bits int) IPMask](#CIDRMask)
        * [func networkNumberAndMask(n *IPNet) (ip IP, m IPMask)](#networkNumberAndMask)
        * [func (m IPMask) Size() (ones, bits int)](#IPMask.Size)
        * [func (m IPMask) String() string](#IPMask.String)
    * [type IPNet struct](#IPNet)
        * [func mustCIDR(s string) *IPNet](#mustCIDR)
        * [func ParseCIDR(s string) (IP, *IPNet, error)](#ParseCIDR)
        * [func (n *IPNet) Contains(ip IP) bool](#IPNet.Contains)
        * [func (n *IPNet) Network() string](#IPNet.Network)
        * [func (n *IPNet) String() string](#IPNet.String)
    * [type IPAddr struct](#IPAddr)
        * [func ResolveIPAddr(network, address string) (*IPAddr, error)](#ResolveIPAddr)
        * [func (a *IPAddr) Network() string](#IPAddr.Network)
        * [func (a *IPAddr) String() string](#IPAddr.String)
        * [func (a *IPAddr) isWildcard() bool](#IPAddr.isWildcard)
        * [func (a *IPAddr) opAddr() Addr](#IPAddr.opAddr)
        * [func (a *IPAddr) family() int](#IPAddr.family)
        * [func (a *IPAddr) sockaddr(family int) (syscall.Sockaddr, error)](#IPAddr.sockaddr)
        * [func (a *IPAddr) toLocal(net string) sockaddr](#IPAddr.toLocal)
    * [type IPConn struct](#IPConn)
        * [func newIPConn(fd *netFD) *IPConn](#newIPConn)
        * [func DialIP(network string, laddr, raddr *IPAddr) (*IPConn, error)](#DialIP)
        * [func ListenIP(network string, laddr *IPAddr) (*IPConn, error)](#ListenIP)
        * [func (c *IPConn) SyscallConn() (syscall.RawConn, error)](#IPConn.SyscallConn)
        * [func (c *IPConn) ReadFromIP(b []byte) (int, *IPAddr, error)](#IPConn.ReadFromIP)
        * [func (c *IPConn) ReadFrom(b []byte) (int, Addr, error)](#IPConn.ReadFrom)
        * [func (c *IPConn) ReadMsgIP(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)](#IPConn.ReadMsgIP)
        * [func (c *IPConn) WriteToIP(b []byte, addr *IPAddr) (int, error)](#IPConn.WriteToIP)
        * [func (c *IPConn) WriteTo(b []byte, addr Addr) (int, error)](#IPConn.WriteTo)
        * [func (c *IPConn) WriteMsgIP(b, oob []byte, addr *IPAddr) (n, oobn int, err error)](#IPConn.WriteMsgIP)
        * [func (c *IPConn) readFrom(b []byte) (int, *IPAddr, error)](#IPConn.readFrom)
        * [func (c *IPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)](#IPConn.readMsg)
        * [func (c *IPConn) writeTo(b []byte, addr *IPAddr) (int, error)](#IPConn.writeTo)
        * [func (c *IPConn) writeMsg(b, oob []byte, addr *IPAddr) (n, oobn int, err error)](#IPConn.writeMsg)
    * [type ipStackCapabilities struct](#ipStackCapabilities)
        * [func (p *ipStackCapabilities) probe()](#ipStackCapabilities.probe)
    * [type addrList []net.Addr](#addrList)
        * [func filterAddrList(filter func(IPAddr) bool, ips []IPAddr, inetaddr func(IPAddr) Addr, originalAddr string) (addrList, error)](#filterAddrList)
        * [func (addrs addrList) forResolve(network, addr string) Addr](#addrList.forResolve)
        * [func (addrs addrList) first(strategy func(Addr) bool) Addr](#addrList.first)
        * [func (addrs addrList) partition(strategy func(Addr) bool) (primaries, fallbacks addrList)](#addrList.partition)
    * [type Resolver struct](#Resolver)
        * [func (r *Resolver) resolveAddrList(ctx context.Context, op, network, addr string, hint Addr) (addrList, error)](#Resolver.resolveAddrList)
        * [func (r *Resolver) exchange(ctx context.Context, server string, q dnsmessage.Question, timeout time.Duration, useTCP bool) (dnsmessage.Parser, dnsmessage.Header, error)](#Resolver.exchange)
        * [func (r *Resolver) tryOneName(ctx context.Context, cfg *dnsConfig, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)](#Resolver.tryOneName)
        * [func (r *Resolver) lookup(ctx context.Context, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)](#Resolver.lookup)
        * [func (r *Resolver) goLookupHost(ctx context.Context, name string) (addrs []string, err error)](#Resolver.goLookupHost)
        * [func (r *Resolver) goLookupHostOrder(ctx context.Context, name string, order hostLookupOrder) (addrs []string, err error)](#Resolver.goLookupHostOrder)
        * [func (r *Resolver) goLookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)](#Resolver.goLookupIP)
        * [func (r *Resolver) goLookupIPCNAMEOrder(ctx context.Context, network, name string, order hostLookupOrder) (addrs []IPAddr, cname dnsmessage.Name, err error)](#Resolver.goLookupIPCNAMEOrder)
        * [func (r *Resolver) goLookupCNAME(ctx context.Context, host string) (string, error)](#Resolver.goLookupCNAME)
        * [func (r *Resolver) goLookupPTR(ctx context.Context, addr string) ([]string, error)](#Resolver.goLookupPTR)
        * [func (r *Resolver) internetAddrList(ctx context.Context, net, addr string) (addrList, error)](#Resolver.internetAddrList)
        * [func (r *Resolver) preferGo() bool](#Resolver.preferGo)
        * [func (r *Resolver) strictErrors() bool](#Resolver.strictErrors)
        * [func (r *Resolver) getLookupGroup() *singleflight.Group](#Resolver.getLookupGroup)
        * [func (r *Resolver) LookupHost(ctx context.Context, host string) (addrs []string, err error)](#Resolver.LookupHost)
        * [func (r *Resolver) LookupIPAddr(ctx context.Context, host string) ([]IPAddr, error)](#Resolver.LookupIPAddr)
        * [func (r *Resolver) LookupIP(ctx context.Context, network, host string) ([]IP, error)](#Resolver.LookupIP)
        * [func (r *Resolver) lookupIPAddr(ctx context.Context, network, host string) ([]IPAddr, error)](#Resolver.lookupIPAddr)
        * [func (r *Resolver) LookupPort(ctx context.Context, network, service string) (port int, err error)](#Resolver.LookupPort)
        * [func (r *Resolver) LookupCNAME(ctx context.Context, host string) (string, error)](#Resolver.LookupCNAME)
        * [func (r *Resolver) LookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)](#Resolver.LookupSRV)
        * [func (r *Resolver) LookupMX(ctx context.Context, name string) ([]*MX, error)](#Resolver.LookupMX)
        * [func (r *Resolver) LookupNS(ctx context.Context, name string) ([]*NS, error)](#Resolver.LookupNS)
        * [func (r *Resolver) LookupTXT(ctx context.Context, name string) ([]string, error)](#Resolver.LookupTXT)
        * [func (r *Resolver) LookupAddr(ctx context.Context, addr string) ([]string, error)](#Resolver.LookupAddr)
        * [func (r *Resolver) dial(ctx context.Context, network, server string) (Conn, error)](#Resolver.dial)
        * [func (r *Resolver) lookupHost(ctx context.Context, host string) (addrs []string, err error)](#Resolver.lookupHost)
        * [func (r *Resolver) lookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)](#Resolver.lookupIP)
        * [func (r *Resolver) lookupPort(ctx context.Context, network, service string) (int, error)](#Resolver.lookupPort)
        * [func (r *Resolver) lookupCNAME(ctx context.Context, name string) (string, error)](#Resolver.lookupCNAME)
        * [func (r *Resolver) lookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)](#Resolver.lookupSRV)
        * [func (r *Resolver) lookupMX(ctx context.Context, name string) ([]*MX, error)](#Resolver.lookupMX)
        * [func (r *Resolver) lookupNS(ctx context.Context, name string) ([]*NS, error)](#Resolver.lookupNS)
        * [func (r *Resolver) lookupTXT(ctx context.Context, name string) ([]string, error)](#Resolver.lookupTXT)
        * [func (r *Resolver) lookupAddr(ctx context.Context, addr string) ([]string, error)](#Resolver.lookupAddr)
    * [type onlyValuesCtx struct](#onlyValuesCtx)
        * [func (ovc *onlyValuesCtx) Value(key interface{}) interface{}](#onlyValuesCtx.Value)
    * [type HardwareAddr []byte](#HardwareAddr)
        * [func ParseMAC(s string) (hw HardwareAddr, err error)](#ParseMAC)
        * [func (a HardwareAddr) String() string](#HardwareAddr.String)
    * [type Addr interface](#Addr)
        * [func sockaddrToIP(sa syscall.Sockaddr) Addr](#sockaddrToIP)
        * [func sockaddrToTCP(sa syscall.Sockaddr) Addr](#sockaddrToTCP)
        * [func sockaddrToUDP(sa syscall.Sockaddr) Addr](#sockaddrToUDP)
        * [func sockaddrToUnix(sa syscall.Sockaddr) Addr](#sockaddrToUnix)
        * [func sockaddrToUnixgram(sa syscall.Sockaddr) Addr](#sockaddrToUnixgram)
        * [func sockaddrToUnixpacket(sa syscall.Sockaddr) Addr](#sockaddrToUnixpacket)
    * [type Conn interface](#Conn)
        * [func Dial(network, address string) (Conn, error)](#Dial)
        * [func DialTimeout(network, address string, timeout time.Duration) (Conn, error)](#DialTimeout)
        * [func FileConn(f *os.File) (c Conn, err error)](#FileConn)
        * [func fileConn(f *os.File) (Conn, error)](#fileConn)
        * [func Pipe() (Conn, Conn)](#Pipe)
    * [type conn struct](#conn)
        * [func (c *conn) ok() bool](#conn.ok)
        * [func (c *conn) Read(b []byte) (int, error)](#conn.Read)
        * [func (c *conn) Write(b []byte) (int, error)](#conn.Write)
        * [func (c *conn) Close() error](#conn.Close)
        * [func (c *conn) LocalAddr() Addr](#conn.LocalAddr)
        * [func (c *conn) RemoteAddr() Addr](#conn.RemoteAddr)
        * [func (c *conn) SetDeadline(t time.Time) error](#conn.SetDeadline)
        * [func (c *conn) SetReadDeadline(t time.Time) error](#conn.SetReadDeadline)
        * [func (c *conn) SetWriteDeadline(t time.Time) error](#conn.SetWriteDeadline)
        * [func (c *conn) SetReadBuffer(bytes int) error](#conn.SetReadBuffer)
        * [func (c *conn) SetWriteBuffer(bytes int) error](#conn.SetWriteBuffer)
        * [func (c *conn) File() (f *os.File, err error)](#conn.File)
        * [func (c *conn) writeBuffers(v *Buffers) (int64, error)](#conn.writeBuffers)
    * [type PacketConn interface](#PacketConn)
        * [func ListenPacket(network, address string) (PacketConn, error)](#ListenPacket)
        * [func FilePacketConn(f *os.File) (c PacketConn, err error)](#FilePacketConn)
        * [func filePacketConn(f *os.File) (PacketConn, error)](#filePacketConn)
        * [func newLocalPacketListener(network string) (PacketConn, error)](#newLocalPacketListener)
    * [type Listener interface](#Listener)
        * [func Listen(network, address string) (Listener, error)](#Listen)
        * [func FileListener(f *os.File) (ln Listener, err error)](#FileListener)
        * [func fileListener(f *os.File) (Listener, error)](#fileListener)
        * [func newLocalListener(network string) (Listener, error)](#newLocalListener)
    * [type Error interface](#Error)
    * [type OpError struct](#OpError)
        * [func (e *OpError) Unwrap() error](#OpError.Unwrap)
        * [func (e *OpError) Error() string](#OpError.Error)
        * [func (e *OpError) Timeout() bool](#OpError.Timeout)
        * [func (e *OpError) Temporary() bool](#OpError.Temporary)
        * [func (e *OpError) isValid() error](#OpError.isValid)
    * [type timeout interface](#timeout)
    * [type temporary interface](#temporary)
    * [type ParseError struct](#ParseError)
        * [func (e *ParseError) Error() string](#ParseError.Error)
        * [func (e *ParseError) Timeout() bool](#ParseError.Timeout)
        * [func (e *ParseError) Temporary() bool](#ParseError.Temporary)
    * [type AddrError struct](#AddrError)
        * [func (e *AddrError) Error() string](#AddrError.Error)
        * [func (e *AddrError) Timeout() bool](#AddrError.Timeout)
        * [func (e *AddrError) Temporary() bool](#AddrError.Temporary)
    * [type UnknownNetworkError string](#UnknownNetworkError)
        * [func (e UnknownNetworkError) Error() string](#UnknownNetworkError.Error)
        * [func (e UnknownNetworkError) Timeout() bool](#UnknownNetworkError.Timeout)
        * [func (e UnknownNetworkError) Temporary() bool](#UnknownNetworkError.Temporary)
    * [type InvalidAddrError string](#InvalidAddrError)
        * [func (e InvalidAddrError) Error() string](#InvalidAddrError.Error)
        * [func (e InvalidAddrError) Timeout() bool](#InvalidAddrError.Timeout)
        * [func (e InvalidAddrError) Temporary() bool](#InvalidAddrError.Temporary)
    * [type timeoutError struct{}](#timeoutError)
        * [func (e *timeoutError) Error() string](#timeoutError.Error)
        * [func (e *timeoutError) Timeout() bool](#timeoutError.Timeout)
        * [func (e *timeoutError) Temporary() bool](#timeoutError.Temporary)
    * [type DNSConfigError struct](#DNSConfigError)
        * [func (e *DNSConfigError) Unwrap() error](#DNSConfigError.Unwrap)
        * [func (e *DNSConfigError) Error() string](#DNSConfigError.Error)
        * [func (e *DNSConfigError) Timeout() bool](#DNSConfigError.Timeout)
        * [func (e *DNSConfigError) Temporary() bool](#DNSConfigError.Temporary)
    * [type DNSError struct](#DNSError)
        * [func (e *DNSError) Error() string](#DNSError.Error)
        * [func (e *DNSError) Timeout() bool](#DNSError.Timeout)
        * [func (e *DNSError) Temporary() bool](#DNSError.Temporary)
    * [type writerOnly struct](#writerOnly)
    * [type buffersWriter interface](#buffersWriter)
    * [type Buffers [][]byte](#Buffers)
        * [func (v *Buffers) WriteTo(w io.Writer) (n int64, err error)](#Buffers.WriteTo)
        * [func (v *Buffers) Read(p []byte) (n int, err error)](#Buffers.Read)
        * [func (v *Buffers) consume(n int64)](#Buffers.consume)
    * [type nssConf struct](#nssConf)
        * [func parseNSSConfFile(file string) *nssConf](#parseNSSConfFile)
        * [func parseNSSConf(r io.Reader) *nssConf](#parseNSSConf)
        * [func nssStr(s string) *nssConf](#nssStr)
    * [type nssSource struct](#nssSource)
        * [func (s nssSource) standardCriteria() bool](#nssSource.standardCriteria)
    * [type nssCriterion struct](#nssCriterion)
        * [func (c nssCriterion) standardStatusAction(last bool) bool](#nssCriterion.standardStatusAction)
    * [type file struct](#file)
        * [func open(name string) (*file, error)](#open)
        * [func (f *file) close()](#file.close)
        * [func (f *file) getLineFromData() (s string, ok bool)](#file.getLineFromData)
        * [func (f *file) readLine() (s string, ok bool)](#file.readLine)
    * [type pipeDeadline struct](#pipeDeadline)
        * [func makePipeDeadline() pipeDeadline](#makePipeDeadline)
        * [func (d *pipeDeadline) set(t time.Time)](#pipeDeadline.set)
        * [func (d *pipeDeadline) wait() chan struct{}](#pipeDeadline.wait)
    * [type pipeAddr struct{}](#pipeAddr)
        * [func (pipeAddr) Network() string](#pipeAddr.Network)
        * [func (pipeAddr) String() string](#pipeAddr.String)
    * [type pipe struct](#pipe)
        * [func (*pipe) LocalAddr() Addr](#pipe.LocalAddr)
        * [func (*pipe) RemoteAddr() Addr](#pipe.RemoteAddr)
        * [func (p *pipe) Read(b []byte) (int, error)](#pipe.Read)
        * [func (p *pipe) read(b []byte) (n int, err error)](#pipe.read)
        * [func (p *pipe) Write(b []byte) (int, error)](#pipe.Write)
        * [func (p *pipe) write(b []byte) (n int, err error)](#pipe.write)
        * [func (p *pipe) SetDeadline(t time.Time) error](#pipe.SetDeadline)
        * [func (p *pipe) SetReadDeadline(t time.Time) error](#pipe.SetReadDeadline)
        * [func (p *pipe) SetWriteDeadline(t time.Time) error](#pipe.SetWriteDeadline)
        * [func (p *pipe) Close() error](#pipe.Close)
    * [type rawConn struct](#rawConn)
        * [func newRawConn(fd *netFD) (*rawConn, error)](#newRawConn)
        * [func (c *rawConn) ok() bool](#rawConn.ok)
        * [func (c *rawConn) Control(f func(uintptr)) error](#rawConn.Control)
        * [func (c *rawConn) Read(f func(uintptr) bool) error](#rawConn.Read)
        * [func (c *rawConn) Write(f func(uintptr) bool) error](#rawConn.Write)
    * [type rawListener struct](#rawListener)
        * [func newRawListener(fd *netFD) (*rawListener, error)](#newRawListener)
        * [func (l *rawListener) Read(func(uintptr) bool) error](#rawListener.Read)
        * [func (l *rawListener) Write(func(uintptr) bool) error](#rawListener.Write)
    * [type sockaddr interface](#sockaddr)
    * [type TCPAddr struct](#TCPAddr)
        * [func ResolveTCPAddr(network, address string) (*TCPAddr, error)](#ResolveTCPAddr)
        * [func (a *TCPAddr) Network() string](#TCPAddr.Network)
        * [func (a *TCPAddr) String() string](#TCPAddr.String)
        * [func (a *TCPAddr) isWildcard() bool](#TCPAddr.isWildcard)
        * [func (a *TCPAddr) opAddr() Addr](#TCPAddr.opAddr)
        * [func (a *TCPAddr) family() int](#TCPAddr.family)
        * [func (a *TCPAddr) sockaddr(family int) (syscall.Sockaddr, error)](#TCPAddr.sockaddr)
        * [func (a *TCPAddr) toLocal(net string) sockaddr](#TCPAddr.toLocal)
    * [type TCPConn struct](#TCPConn)
        * [func newTCPConn(fd *netFD) *TCPConn](#newTCPConn)
        * [func DialTCP(network string, laddr, raddr *TCPAddr) (*TCPConn, error)](#DialTCP)
        * [func slowDialTCP(ctx context.Context, network string, laddr, raddr *TCPAddr) (*TCPConn, error)](#slowDialTCP)
        * [func (c *TCPConn) SyscallConn() (syscall.RawConn, error)](#TCPConn.SyscallConn)
        * [func (c *TCPConn) ReadFrom(r io.Reader) (int64, error)](#TCPConn.ReadFrom)
        * [func (c *TCPConn) CloseRead() error](#TCPConn.CloseRead)
        * [func (c *TCPConn) CloseWrite() error](#TCPConn.CloseWrite)
        * [func (c *TCPConn) SetLinger(sec int) error](#TCPConn.SetLinger)
        * [func (c *TCPConn) SetKeepAlive(keepalive bool) error](#TCPConn.SetKeepAlive)
        * [func (c *TCPConn) SetKeepAlivePeriod(d time.Duration) error](#TCPConn.SetKeepAlivePeriod)
        * [func (c *TCPConn) SetNoDelay(noDelay bool) error](#TCPConn.SetNoDelay)
        * [func (c *TCPConn) readFrom(r io.Reader) (int64, error)](#TCPConn.readFrom)
    * [type TCPListener struct](#TCPListener)
        * [func ListenTCP(network string, laddr *TCPAddr) (*TCPListener, error)](#ListenTCP)
        * [func (l *TCPListener) SyscallConn() (syscall.RawConn, error)](#TCPListener.SyscallConn)
        * [func (l *TCPListener) AcceptTCP() (*TCPConn, error)](#TCPListener.AcceptTCP)
        * [func (l *TCPListener) Accept() (Conn, error)](#TCPListener.Accept)
        * [func (l *TCPListener) Close() error](#TCPListener.Close)
        * [func (l *TCPListener) Addr() Addr](#TCPListener.Addr)
        * [func (l *TCPListener) SetDeadline(t time.Time) error](#TCPListener.SetDeadline)
        * [func (l *TCPListener) File() (f *os.File, err error)](#TCPListener.File)
        * [func (ln *TCPListener) ok() bool](#TCPListener.ok)
        * [func (ln *TCPListener) accept() (*TCPConn, error)](#TCPListener.accept)
        * [func (ln *TCPListener) close() error](#TCPListener.close)
        * [func (ln *TCPListener) file() (*os.File, error)](#TCPListener.file)
        * [func (ln *TCPListener) port() string](#TCPListener.port)
    * [type UDPAddr struct](#UDPAddr)
        * [func ResolveUDPAddr(network, address string) (*UDPAddr, error)](#ResolveUDPAddr)
        * [func (a *UDPAddr) Network() string](#UDPAddr.Network)
        * [func (a *UDPAddr) String() string](#UDPAddr.String)
        * [func (a *UDPAddr) isWildcard() bool](#UDPAddr.isWildcard)
        * [func (a *UDPAddr) opAddr() Addr](#UDPAddr.opAddr)
        * [func (a *UDPAddr) family() int](#UDPAddr.family)
        * [func (a *UDPAddr) sockaddr(family int) (syscall.Sockaddr, error)](#UDPAddr.sockaddr)
        * [func (a *UDPAddr) toLocal(net string) sockaddr](#UDPAddr.toLocal)
    * [type UDPConn struct](#UDPConn)
        * [func newUDPConn(fd *netFD) *UDPConn](#newUDPConn)
        * [func DialUDP(network string, laddr, raddr *UDPAddr) (*UDPConn, error)](#DialUDP)
        * [func ListenUDP(network string, laddr *UDPAddr) (*UDPConn, error)](#ListenUDP)
        * [func ListenMulticastUDP(network string, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)](#ListenMulticastUDP)
        * [func (c *UDPConn) SyscallConn() (syscall.RawConn, error)](#UDPConn.SyscallConn)
        * [func (c *UDPConn) ReadFromUDP(b []byte) (n int, addr *UDPAddr, err error)](#UDPConn.ReadFromUDP)
        * [func (c *UDPConn) readFromUDP(b []byte, addr *UDPAddr) (int, *UDPAddr, error)](#UDPConn.readFromUDP)
        * [func (c *UDPConn) ReadFrom(b []byte) (int, Addr, error)](#UDPConn.ReadFrom)
        * [func (c *UDPConn) ReadMsgUDP(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)](#UDPConn.ReadMsgUDP)
        * [func (c *UDPConn) WriteToUDP(b []byte, addr *UDPAddr) (int, error)](#UDPConn.WriteToUDP)
        * [func (c *UDPConn) WriteTo(b []byte, addr Addr) (int, error)](#UDPConn.WriteTo)
        * [func (c *UDPConn) WriteMsgUDP(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)](#UDPConn.WriteMsgUDP)
        * [func (c *UDPConn) readFrom(b []byte, addr *UDPAddr) (int, *UDPAddr, error)](#UDPConn.readFrom)
        * [func (c *UDPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)](#UDPConn.readMsg)
        * [func (c *UDPConn) writeTo(b []byte, addr *UDPAddr) (int, error)](#UDPConn.writeTo)
        * [func (c *UDPConn) writeMsg(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)](#UDPConn.writeMsg)
        * [func (c *UDPConn) port() string](#UDPConn.port)
    * [type UnixAddr struct](#UnixAddr)
        * [func ResolveUnixAddr(network, address string) (*UnixAddr, error)](#ResolveUnixAddr)
        * [func (a *UnixAddr) Network() string](#UnixAddr.Network)
        * [func (a *UnixAddr) String() string](#UnixAddr.String)
        * [func (a *UnixAddr) isWildcard() bool](#UnixAddr.isWildcard)
        * [func (a *UnixAddr) opAddr() Addr](#UnixAddr.opAddr)
        * [func (a *UnixAddr) family() int](#UnixAddr.family)
        * [func (a *UnixAddr) sockaddr(family int) (syscall.Sockaddr, error)](#UnixAddr.sockaddr)
        * [func (a *UnixAddr) toLocal(net string) sockaddr](#UnixAddr.toLocal)
    * [type UnixConn struct](#UnixConn)
        * [func newUnixConn(fd *netFD) *UnixConn](#newUnixConn)
        * [func DialUnix(network string, laddr, raddr *UnixAddr) (*UnixConn, error)](#DialUnix)
        * [func ListenUnixgram(network string, laddr *UnixAddr) (*UnixConn, error)](#ListenUnixgram)
        * [func (c *UnixConn) SyscallConn() (syscall.RawConn, error)](#UnixConn.SyscallConn)
        * [func (c *UnixConn) CloseRead() error](#UnixConn.CloseRead)
        * [func (c *UnixConn) CloseWrite() error](#UnixConn.CloseWrite)
        * [func (c *UnixConn) ReadFromUnix(b []byte) (int, *UnixAddr, error)](#UnixConn.ReadFromUnix)
        * [func (c *UnixConn) ReadFrom(b []byte) (int, Addr, error)](#UnixConn.ReadFrom)
        * [func (c *UnixConn) ReadMsgUnix(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)](#UnixConn.ReadMsgUnix)
        * [func (c *UnixConn) WriteToUnix(b []byte, addr *UnixAddr) (int, error)](#UnixConn.WriteToUnix)
        * [func (c *UnixConn) WriteTo(b []byte, addr Addr) (int, error)](#UnixConn.WriteTo)
        * [func (c *UnixConn) WriteMsgUnix(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)](#UnixConn.WriteMsgUnix)
        * [func (c *UnixConn) readFrom(b []byte) (int, *UnixAddr, error)](#UnixConn.readFrom)
        * [func (c *UnixConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)](#UnixConn.readMsg)
        * [func (c *UnixConn) writeTo(b []byte, addr *UnixAddr) (int, error)](#UnixConn.writeTo)
        * [func (c *UnixConn) writeMsg(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)](#UnixConn.writeMsg)
    * [type UnixListener struct](#UnixListener)
        * [func ListenUnix(network string, laddr *UnixAddr) (*UnixListener, error)](#ListenUnix)
        * [func (ln *UnixListener) ok() bool](#UnixListener.ok)
        * [func (l *UnixListener) SyscallConn() (syscall.RawConn, error)](#UnixListener.SyscallConn)
        * [func (l *UnixListener) AcceptUnix() (*UnixConn, error)](#UnixListener.AcceptUnix)
        * [func (l *UnixListener) Accept() (Conn, error)](#UnixListener.Accept)
        * [func (l *UnixListener) Close() error](#UnixListener.Close)
        * [func (l *UnixListener) Addr() Addr](#UnixListener.Addr)
        * [func (l *UnixListener) SetDeadline(t time.Time) error](#UnixListener.SetDeadline)
        * [func (l *UnixListener) File() (f *os.File, err error)](#UnixListener.File)
        * [func (ln *UnixListener) accept() (*UnixConn, error)](#UnixListener.accept)
        * [func (ln *UnixListener) close() error](#UnixListener.close)
        * [func (ln *UnixListener) file() (*os.File, error)](#UnixListener.file)
        * [func (l *UnixListener) SetUnlinkOnClose(unlink bool)](#UnixListener.SetUnlinkOnClose)
    * [type nssHostTest struct](#nssHostTest)
    * [type contextWithNonZeroDeadline struct](#contextWithNonZeroDeadline)
        * [func (contextWithNonZeroDeadline) Deadline() (time.Time, bool)](#contextWithNonZeroDeadline.Deadline)
    * [type resolvConfTest struct](#resolvConfTest)
        * [func newResolvConfTest() (*resolvConfTest, error)](#newResolvConfTest)
        * [func (conf *resolvConfTest) writeAndUpdate(lines []string) error](#resolvConfTest.writeAndUpdate)
        * [func (conf *resolvConfTest) forceUpdate(name string, lastChecked time.Time) error](#resolvConfTest.forceUpdate)
        * [func (conf *resolvConfTest) servers() []string](#resolvConfTest.servers)
        * [func (conf *resolvConfTest) teardown() error](#resolvConfTest.teardown)
    * [type fakeDNSServer struct](#fakeDNSServer)
        * [func (server *fakeDNSServer) DialContext(_ context.Context, n, s string) (Conn, error)](#fakeDNSServer.DialContext)
    * [type fakeDNSConn struct](#fakeDNSConn)
        * [func (f *fakeDNSConn) Close() error](#fakeDNSConn.Close)
        * [func (f *fakeDNSConn) Read(b []byte) (int, error)](#fakeDNSConn.Read)
        * [func (f *fakeDNSConn) Write(b []byte) (int, error)](#fakeDNSConn.Write)
        * [func (f *fakeDNSConn) SetDeadline(t time.Time) error](#fakeDNSConn.SetDeadline)
    * [type fakeDNSPacketConn struct](#fakeDNSPacketConn)
        * [func (f *fakeDNSPacketConn) SetDeadline(t time.Time) error](#fakeDNSPacketConn.SetDeadline)
        * [func (f *fakeDNSPacketConn) Close() error](#fakeDNSPacketConn.Close)
    * [type dnsNameTest struct](#dnsNameTest)
    * [type staticHostEntry struct](#staticHostEntry)
    * [type ifStats struct](#ifStats)
        * [func interfaceStats(ift []Interface) *ifStats](#interfaceStats)
    * [type routeStats struct](#routeStats)
        * [func validateInterfaceUnicastAddrs(ifat []Addr) (*routeStats, error)](#validateInterfaceUnicastAddrs)
        * [func validateInterfaceMulticastAddrs(ifat []Addr) (*routeStats, error)](#validateInterfaceMulticastAddrs)
    * [type testInterface struct](#testInterface)
        * [func (ti *testInterface) setBroadcast(vid int) error](#testInterface.setBroadcast)
        * [func (ti *testInterface) setPointToPoint(suffix int) error](#testInterface.setPointToPoint)
        * [func (ti *testInterface) setLinkLocal(suffix int) error](#testInterface.setLinkLocal)
        * [func (ti *testInterface) setup() error](#testInterface.setup)
        * [func (ti *testInterface) teardown() error](#testInterface.teardown)
    * [type resolveIPAddrTest struct](#resolveIPAddrTest)
    * [type lookupCustomResolver struct](#lookupCustomResolver)
        * [func (lcr *lookupCustomResolver) dial() func(ctx context.Context, network, address string) (Conn, error)](#lookupCustomResolver.dial)
    * [type ipv6LinkLocalUnicastTest struct](#ipv6LinkLocalUnicastTest)
    * [type localServer struct](#localServer)
        * [func newLocalServer(network string) (*localServer, error)](#newLocalServer)
        * [func (ls *localServer) buildup(handler func(*localServer, Listener)) error](#localServer.buildup)
        * [func (ls *localServer) teardown() error](#localServer.teardown)
        * [func (ls *localServer) transponder(ln Listener, ch chan<- error)](#localServer.transponder)
    * [type streamListener struct](#streamListener)
        * [func (sl *streamListener) newLocalServer() (*localServer, error)](#streamListener.newLocalServer)
    * [type dualStackServer struct](#dualStackServer)
        * [func newDualStackServer() (*dualStackServer, error)](#newDualStackServer)
        * [func (dss *dualStackServer) buildup(handler func(*dualStackServer, Listener)) error](#dualStackServer.buildup)
        * [func (dss *dualStackServer) teardownNetwork(network string) error](#dualStackServer.teardownNetwork)
        * [func (dss *dualStackServer) teardown() error](#dualStackServer.teardown)
    * [type localPacketServer struct](#localPacketServer)
        * [func newLocalPacketServer(network string) (*localPacketServer, error)](#newLocalPacketServer)
        * [func (ls *localPacketServer) buildup(handler func(*localPacketServer, PacketConn)) error](#localPacketServer.buildup)
        * [func (ls *localPacketServer) teardown() error](#localPacketServer.teardown)
    * [type packetListener struct](#packetListener)
        * [func (pl *packetListener) newLocalServer() (*localPacketServer, error)](#packetListener.newLocalServer)
    * [type resolveTCPAddrTest struct](#resolveTCPAddrTest)
    * [type neverEnding byte](#neverEnding)
        * [func (b neverEnding) Read(p []byte) (int, error)](#neverEnding.Read)
    * [type resolveUDPAddrTest struct](#resolveUDPAddrTest)
    * [type addrinfoErrno int](#addrinfoErrno)
        * [func (eai addrinfoErrno) Error() string](#addrinfoErrno.Error)
        * [func (eai addrinfoErrno) Temporary() bool](#addrinfoErrno.Temporary)
        * [func (eai addrinfoErrno) Timeout() bool](#addrinfoErrno.Timeout)
    * [type portLookupResult struct](#portLookupResult)
    * [type ipLookupResult struct](#ipLookupResult)
    * [type reverseLookupResult struct](#reverseLookupResult)
* [Functions](#func)
    * [func sortByRFC6724(addrs []IPAddr)](#sortByRFC6724)
    * [func sortByRFC6724withSrcs(addrs []IPAddr, srcs []IP)](#sortByRFC6724withSrcs)
    * [func srcAddrs(addrs []IPAddr) []IP](#srcAddrs)
    * [func init()](#init)
    * [func commonPrefixLen(a, b IP) (cpl int)](#commonPrefixLen)
    * [func initConfVal()](#initConfVal)
    * [func goDebugNetDNS() (dnsMode string, debugLevel int)](#goDebugNetDNS)
    * [func isLocalhost(h string) bool](#isLocalhost)
    * [func isGateway(h string) bool](#isGateway)
    * [func minNonzeroTime(a, b time.Time) time.Time](#minNonzeroTime)
    * [func partialDeadline(now, deadline time.Time, addrsRemaining int) (time.Time, error)](#partialDeadline)
    * [func parseNetwork(ctx context.Context, network string, needsProto bool) (afnet string, proto int, err error)](#parseNetwork)
    * [func fastrand() uint32](#fastrand)
    * [func randInt() int](#randInt)
    * [func randIntn(n int) int](#randIntn)
    * [func reverseaddr(addr string) (arpa string, err error)](#reverseaddr)
    * [func equalASCIIName(x, y dnsmessage.Name) bool](#equalASCIIName)
    * [func isDomainName(s string) bool](#isDomainName)
    * [func absDomainName(b []byte) string](#absDomainName)
    * [func newRequest(q dnsmessage.Question) (id uint16, udpReq, tcpReq []byte, err error)](#newRequest)
    * [func checkResponse(reqID uint16, reqQues dnsmessage.Question, respHdr dnsmessage.Header, respQues dnsmessage.Question) bool](#checkResponse)
    * [func dnsPacketRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)](#dnsPacketRoundTrip)
    * [func dnsStreamRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)](#dnsStreamRoundTrip)
    * [func checkHeader(p *dnsmessage.Parser, h dnsmessage.Header) error](#checkHeader)
    * [func skipToAnswer(p *dnsmessage.Parser, qtype dnsmessage.Type) error](#skipToAnswer)
    * [func avoidDNS(name string) bool](#avoidDNS)
    * [func goLookupIPFiles(name string) (addrs []IPAddr)](#goLookupIPFiles)
    * [func dnsDefaultSearch() []string](#dnsDefaultSearch)
    * [func hasPrefix(s, prefix string) bool](#hasPrefix)
    * [func ensureRooted(s string) string](#ensureRooted)
    * [func wrapSyscallError(name string, err error) error](#wrapSyscallError)
    * [func isConnError(err error) bool](#isConnError)
    * [func dupSocket(f *os.File) (int, error)](#dupSocket)
    * [func parseLiteralIP(addr string) string](#parseLiteralIP)
    * [func readHosts()](#readHosts)
    * [func lookupStaticHost(host string) []string](#lookupStaticHost)
    * [func lookupStaticAddr(addr string) []string](#lookupStaticAddr)
    * [func Interfaces() ([]Interface, error)](#Interfaces)
    * [func InterfaceAddrs() ([]Addr, error)](#InterfaceAddrs)
    * [func interfaceTable(ifindex int) ([]Interface, error)](#interfaceTable)
    * [func interfaceAddrTable(ifi *Interface) ([]Addr, error)](#interfaceAddrTable)
    * [func interfaceMessages(ifindex int) ([]route.Message, error)](#interfaceMessages)
    * [func interfaceMulticastAddrTable(ifi *Interface) ([]Addr, error)](#interfaceMulticastAddrTable)
    * [func isZeros(p IP) bool](#isZeros)
    * [func allFF(b []byte) bool](#allFF)
    * [func ubtoa(dst []byte, start int, v byte) int](#ubtoa)
    * [func hexString(b []byte) string](#hexString)
    * [func ipEmptyString(ip IP) string](#ipEmptyString)
    * [func simpleMaskLength(mask IPMask) int](#simpleMaskLength)
    * [func stripIPv4Header(n int, b []byte) int](#stripIPv4Header)
    * [func supportsIPv4() bool](#supportsIPv4)
    * [func supportsIPv6() bool](#supportsIPv6)
    * [func supportsIPv4map() bool](#supportsIPv4map)
    * [func isIPv4(addr Addr) bool](#isIPv4)
    * [func isNotIPv4(addr Addr) bool](#isNotIPv4)
    * [func ipv4only(addr IPAddr) bool](#ipv4only)
    * [func ipv6only(addr IPAddr) bool](#ipv6only)
    * [func SplitHostPort(hostport string) (host, port string, err error)](#SplitHostPort)
    * [func splitHostZone(s string) (host, zone string)](#splitHostZone)
    * [func JoinHostPort(host, port string) string](#JoinHostPort)
    * [func favoriteAddrFamily(network string, laddr, raddr sockaddr, mode string) (family int, ipv6only bool)](#favoriteAddrFamily)
    * [func ipToSockaddr(family int, ip IP, port int, zone string) (syscall.Sockaddr, error)](#ipToSockaddr)
    * [func lookupProtocolMap(name string) (int, error)](#lookupProtocolMap)
    * [func lookupPortMap(network, service string) (port int, error error)](#lookupPortMap)
    * [func ipVersion(network string) byte](#ipVersion)
    * [func LookupHost(host string) (addrs []string, err error)](#LookupHost)
    * [func LookupIP(host string) ([]IP, error)](#LookupIP)
    * [func withUnexpiredValuesPreserved(lookupCtx context.Context) context.Context](#withUnexpiredValuesPreserved)
    * [func lookupIPReturn(addrsi interface{}, err error, shared bool) ([]IPAddr, error)](#lookupIPReturn)
    * [func ipAddrsEface(addrs []IPAddr) []interface{}](#ipAddrsEface)
    * [func LookupPort(network, service string) (port int, err error)](#LookupPort)
    * [func LookupCNAME(host string) (cname string, err error)](#LookupCNAME)
    * [func LookupSRV(service, proto, name string) (cname string, addrs []*SRV, err error)](#LookupSRV)
    * [func LookupMX(name string) ([]*MX, error)](#LookupMX)
    * [func LookupNS(name string) ([]*NS, error)](#LookupNS)
    * [func LookupTXT(name string) ([]string, error)](#LookupTXT)
    * [func LookupAddr(addr string) (names []string, err error)](#LookupAddr)
    * [func readProtocols()](#readProtocols)
    * [func lookupProtocol(_ context.Context, name string) (int, error)](#lookupProtocol)
    * [func concurrentThreadsLimit() int](#concurrentThreadsLimit)
    * [func listenerBacklog() int](#listenerBacklog)
    * [func mapErr(err error) error](#mapErr)
    * [func genericReadFrom(w io.Writer, r io.Reader) (n int64, err error)](#genericReadFrom)
    * [func acquireThread()](#acquireThread)
    * [func releaseThread()](#releaseThread)
    * [func parseCriteria(x []byte) (c []nssCriterion, err error)](#parseCriteria)
    * [func stat(name string) (mtime time.Time, size int64, err error)](#stat)
    * [func countAnyByte(s string, t string) int](#countAnyByte)
    * [func splitAtBytes(s string, t string) []string](#splitAtBytes)
    * [func getFields(s string) []string](#getFields)
    * [func dtoi(s string) (n int, i int, ok bool)](#dtoi)
    * [func xtoi(s string) (n int, i int, ok bool)](#xtoi)
    * [func xtoi2(s string, e byte) (byte, bool)](#xtoi2)
    * [func appendHex(dst []byte, i uint32) []byte](#appendHex)
    * [func count(s string, b byte) int](#count)
    * [func last(s string, b byte) int](#last)
    * [func lowerASCIIBytes(x []byte)](#lowerASCIIBytes)
    * [func lowerASCII(b byte) byte](#lowerASCII)
    * [func trimSpace(x []byte) []byte](#trimSpace)
    * [func isSpace(b byte) bool](#isSpace)
    * [func removeComment(line []byte) []byte](#removeComment)
    * [func foreachLine(x []byte, fn func(line []byte) error) error](#foreachLine)
    * [func foreachField(x []byte, fn func(field []byte) error) error](#foreachField)
    * [func stringsHasSuffix(s, suffix string) bool](#stringsHasSuffix)
    * [func stringsHasSuffixFold(s, suffix string) bool](#stringsHasSuffixFold)
    * [func stringsHasPrefix(s, prefix string) bool](#stringsHasPrefix)
    * [func stringsEqualFold(s, t string) bool](#stringsEqualFold)
    * [func readFull(r io.Reader) (all []byte, err error)](#readFull)
    * [func goDebugString(key string) string](#goDebugString)
    * [func isClosedChan(c <-chan struct{}) bool](#isClosedChan)
    * [func parsePort(service string) (port int, needsLookup bool)](#parsePort)
    * [func readServices()](#readServices)
    * [func goLookupPort(network, service string) (port int, err error)](#goLookupPort)
    * [func sendFile(c *netFD, r io.Reader) (n int64, err error, handled bool)](#sendFile)
    * [func maxListenerBacklog() int](#maxListenerBacklog)
    * [func setDefaultSockopts(s, family, sotype int, ipv6only bool) error](#setDefaultSockopts)
    * [func setDefaultListenerSockopts(s int) error](#setDefaultListenerSockopts)
    * [func setDefaultMulticastSockopts(s int) error](#setDefaultMulticastSockopts)
    * [func boolint(b bool) int](#boolint)
    * [func setIPv4MreqToInterface(mreq *syscall.IPMreq, ifi *Interface) error](#setIPv4MreqToInterface)
    * [func setReadBuffer(fd *netFD, bytes int) error](#setReadBuffer)
    * [func setWriteBuffer(fd *netFD, bytes int) error](#setWriteBuffer)
    * [func setKeepAlive(fd *netFD, keepalive bool) error](#setKeepAlive)
    * [func setLinger(fd *netFD, sec int) error](#setLinger)
    * [func setIPv4MulticastInterface(fd *netFD, ifi *Interface) error](#setIPv4MulticastInterface)
    * [func setIPv4MulticastLoopback(fd *netFD, v bool) error](#setIPv4MulticastLoopback)
    * [func joinIPv4Group(fd *netFD, ifi *Interface, ip IP) error](#joinIPv4Group)
    * [func setIPv6MulticastInterface(fd *netFD, ifi *Interface) error](#setIPv6MulticastInterface)
    * [func setIPv6MulticastLoopback(fd *netFD, v bool) error](#setIPv6MulticastLoopback)
    * [func joinIPv6Group(fd *netFD, ifi *Interface, ip IP) error](#joinIPv6Group)
    * [func splice(c *netFD, r io.Reader) (int64, error, bool)](#splice)
    * [func sysSocket(family, sotype, proto int) (int, error)](#sysSocket)
    * [func roundDurationUp(d time.Duration, to time.Duration) time.Duration](#roundDurationUp)
    * [func selfConnect(fd *netFD, err error) bool](#selfConnect)
    * [func spuriousENOTAVAIL(err error) bool](#spuriousENOTAVAIL)
    * [func setKeepAlivePeriod(fd *netFD, d time.Duration) error](#setKeepAlivePeriod)
    * [func setNoDelay(fd *netFD, noDelay bool) error](#setNoDelay)
    * [func listenIPv4MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error](#listenIPv4MulticastUDP)
    * [func listenIPv6MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error](#listenIPv6MulticastUDP)
    * [func sotypeToNet(sotype int) string](#sotypeToNet)
    * [func setReadMsgCloseOnExec(oob []byte)](#setReadMsgCloseOnExec)
    * [func TestSortByRFC6724(t *testing.T)](#TestSortByRFC6724)
    * [func TestRFC6724PolicyTableClassify(t *testing.T)](#TestRFC6724PolicyTableClassify)
    * [func TestRFC6724ClassifyScope(t *testing.T)](#TestRFC6724ClassifyScope)
    * [func TestRFC6724CommonPrefixLength(t *testing.T)](#TestRFC6724CommonPrefixLength)
    * [func TestCgoLookupIP(t *testing.T)](#TestCgoLookupIP)
    * [func TestCgoLookupIPWithCancel(t *testing.T)](#TestCgoLookupIPWithCancel)
    * [func TestCgoLookupPort(t *testing.T)](#TestCgoLookupPort)
    * [func TestCgoLookupPortWithCancel(t *testing.T)](#TestCgoLookupPortWithCancel)
    * [func TestCgoLookupPTR(t *testing.T)](#TestCgoLookupPTR)
    * [func TestCgoLookupPTRWithCancel(t *testing.T)](#TestCgoLookupPTRWithCancel)
    * [func TestConfHostLookupOrder(t *testing.T)](#TestConfHostLookupOrder)
    * [func TestSystemConf(t *testing.T)](#TestSystemConf)
    * [func TestConnAndListener(t *testing.T)](#TestConnAndListener)
    * [func TestProhibitionaryDialArg(t *testing.T)](#TestProhibitionaryDialArg)
    * [func TestDialLocal(t *testing.T)](#TestDialLocal)
    * [func TestDialerDualStackFDLeak(t *testing.T)](#TestDialerDualStackFDLeak)
    * [func dialClosedPort(t *testing.T) (actual, expected time.Duration)](#dialClosedPort)
    * [func TestDialParallel(t *testing.T)](#TestDialParallel)
    * [func lookupSlowFast(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)](#lookupSlowFast)
    * [func TestDialerFallbackDelay(t *testing.T)](#TestDialerFallbackDelay)
    * [func TestDialParallelSpuriousConnection(t *testing.T)](#TestDialParallelSpuriousConnection)
    * [func TestDialerPartialDeadline(t *testing.T)](#TestDialerPartialDeadline)
    * [func TestDialerLocalAddr(t *testing.T)](#TestDialerLocalAddr)
    * [func TestDialerDualStack(t *testing.T)](#TestDialerDualStack)
    * [func TestDialerKeepAlive(t *testing.T)](#TestDialerKeepAlive)
    * [func TestDialCancel(t *testing.T)](#TestDialCancel)
    * [func TestCancelAfterDial(t *testing.T)](#TestCancelAfterDial)
    * [func TestDialListenerAddr(t *testing.T)](#TestDialListenerAddr)
    * [func TestDialerControl(t *testing.T)](#TestDialerControl)
    * [func mustHaveExternalNetwork(t *testing.T)](#mustHaveExternalNetwork)
    * [func TestDialWithNonZeroDeadline(t *testing.T)](#TestDialWithNonZeroDeadline)
    * [func TestDialContextCancelRace(t *testing.T)](#TestDialContextCancelRace)
    * [func checkDistribution(t *testing.T, data []*SRV, margin float64)](#checkDistribution)
    * [func testUniformity(t *testing.T, size int, margin float64)](#testUniformity)
    * [func TestDNSSRVUniformity(t *testing.T)](#TestDNSSRVUniformity)
    * [func testWeighting(t *testing.T, margin float64)](#testWeighting)
    * [func TestWeighting(t *testing.T)](#TestWeighting)
    * [func mustNewName(name string) dnsmessage.Name](#mustNewName)
    * [func mustQuestion(name string, qtype dnsmessage.Type, class dnsmessage.Class) dnsmessage.Question](#mustQuestion)
    * [func TestDNSTransportFallback(t *testing.T)](#TestDNSTransportFallback)
    * [func TestSpecialDomainName(t *testing.T)](#TestSpecialDomainName)
    * [func TestAvoidDNSName(t *testing.T)](#TestAvoidDNSName)
    * [func TestLookupTorOnion(t *testing.T)](#TestLookupTorOnion)
    * [func TestUpdateResolvConf(t *testing.T)](#TestUpdateResolvConf)
    * [func TestGoLookupIPWithResolverConfig(t *testing.T)](#TestGoLookupIPWithResolverConfig)
    * [func TestGoLookupIPOrderFallbackToFile(t *testing.T)](#TestGoLookupIPOrderFallbackToFile)
    * [func TestErrorForOriginalNameWhenSearching(t *testing.T)](#TestErrorForOriginalNameWhenSearching)
    * [func TestIgnoreLameReferrals(t *testing.T)](#TestIgnoreLameReferrals)
    * [func BenchmarkGoLookupIP(b *testing.B)](#BenchmarkGoLookupIP)
    * [func BenchmarkGoLookupIPNoSuchHost(b *testing.B)](#BenchmarkGoLookupIPNoSuchHost)
    * [func BenchmarkGoLookupIPWithBrokenNameServer(b *testing.B)](#BenchmarkGoLookupIPWithBrokenNameServer)
    * [func TestIgnoreDNSForgeries(t *testing.T)](#TestIgnoreDNSForgeries)
    * [func TestRetryTimeout(t *testing.T)](#TestRetryTimeout)
    * [func TestRotate(t *testing.T)](#TestRotate)
    * [func testRotate(t *testing.T, rotate bool, nameservers, wantServers []string)](#testRotate)
    * [func mockTXTResponse(q dnsmessage.Message) dnsmessage.Message](#mockTXTResponse)
    * [func TestStrictErrorsLookupIP(t *testing.T)](#TestStrictErrorsLookupIP)
    * [func TestStrictErrorsLookupTXT(t *testing.T)](#TestStrictErrorsLookupTXT)
    * [func TestDNSGoroutineRace(t *testing.T)](#TestDNSGoroutineRace)
    * [func lookupWithFake(fake fakeDNSServer, name string, typ dnsmessage.Type) error](#lookupWithFake)
    * [func TestIssue8434(t *testing.T)](#TestIssue8434)
    * [func TestIssueNoSuchHostExists(t *testing.T)](#TestIssueNoSuchHostExists)
    * [func TestNoSuchHost(t *testing.T)](#TestNoSuchHost)
    * [func TestDNSDialTCP(t *testing.T)](#TestDNSDialTCP)
    * [func TestTXTRecordTwoStrings(t *testing.T)](#TestTXTRecordTwoStrings)
    * [func TestSingleRequestLookup(t *testing.T)](#TestSingleRequestLookup)
    * [func TestDNSUseTCP(t *testing.T)](#TestDNSUseTCP)
    * [func TestPTRandNonPTR(t *testing.T)](#TestPTRandNonPTR)
    * [func TestCVE202133195(t *testing.T)](#TestCVE202133195)
    * [func TestDNSReadConfig(t *testing.T)](#TestDNSReadConfig)
    * [func TestDNSReadMissingFile(t *testing.T)](#TestDNSReadMissingFile)
    * [func TestDNSDefaultSearch(t *testing.T)](#TestDNSDefaultSearch)
    * [func TestDNSNameLength(t *testing.T)](#TestDNSNameLength)
    * [func emitDNSNameTest(ch chan<- dnsNameTest)](#emitDNSNameTest)
    * [func TestDNSName(t *testing.T)](#TestDNSName)
    * [func BenchmarkDNSName(b *testing.B)](#BenchmarkDNSName)
    * [func TestSpuriousENOTAVAIL(t *testing.T)](#TestSpuriousENOTAVAIL)
    * [func parseDialError(nestedErr error) error](#parseDialError)
    * [func TestDialError(t *testing.T)](#TestDialError)
    * [func TestProtocolDialError(t *testing.T)](#TestProtocolDialError)
    * [func TestDialAddrError(t *testing.T)](#TestDialAddrError)
    * [func TestListenError(t *testing.T)](#TestListenError)
    * [func TestListenPacketError(t *testing.T)](#TestListenPacketError)
    * [func TestProtocolListenError(t *testing.T)](#TestProtocolListenError)
    * [func parseReadError(nestedErr error) error](#parseReadError)
    * [func parseWriteError(nestedErr error) error](#parseWriteError)
    * [func parseCloseError(nestedErr error, isShutdown bool) error](#parseCloseError)
    * [func TestCloseError(t *testing.T)](#TestCloseError)
    * [func parseAcceptError(nestedErr error) error](#parseAcceptError)
    * [func TestAcceptError(t *testing.T)](#TestAcceptError)
    * [func parseCommonError(nestedErr error) error](#parseCommonError)
    * [func TestFileError(t *testing.T)](#TestFileError)
    * [func parseLookupPortError(nestedErr error) error](#parseLookupPortError)
    * [func isPlatformError(err error) bool](#isPlatformError)
    * [func samePlatformError(err, want error) bool](#samePlatformError)
    * [func TestResolveGoogle(t *testing.T)](#TestResolveGoogle)
    * [func TestDialGoogle(t *testing.T)](#TestDialGoogle)
    * [func googleLiteralAddrs() (lits4, lits6 []string, err error)](#googleLiteralAddrs)
    * [func fetchGoogle(dial func(string, string) (Conn, error), network, address string) error](#fetchGoogle)
    * [func fcntl(fd int, cmd int, arg int) (int, error)](#fcntl)
    * [func TestFileConn(t *testing.T)](#TestFileConn)
    * [func TestFileListener(t *testing.T)](#TestFileListener)
    * [func TestFilePacketConn(t *testing.T)](#TestFilePacketConn)
    * [func TestFileCloseRace(t *testing.T)](#TestFileCloseRace)
    * [func TestLookupStaticHost(t *testing.T)](#TestLookupStaticHost)
    * [func testStaticHost(t *testing.T, hostsPath string, ent staticHostEntry)](#testStaticHost)
    * [func TestLookupStaticAddr(t *testing.T)](#TestLookupStaticAddr)
    * [func testStaticAddr(t *testing.T, hostsPath string, ent staticHostEntry)](#testStaticAddr)
    * [func TestHostCacheModification(t *testing.T)](#TestHostCacheModification)
    * [func ipv6LinkLocalUnicastAddr(ifi *Interface) string](#ipv6LinkLocalUnicastAddr)
    * [func TestInterfaces(t *testing.T)](#TestInterfaces)
    * [func TestInterfaceAddrs(t *testing.T)](#TestInterfaceAddrs)
    * [func TestInterfaceUnicastAddrs(t *testing.T)](#TestInterfaceUnicastAddrs)
    * [func TestInterfaceMulticastAddrs(t *testing.T)](#TestInterfaceMulticastAddrs)
    * [func checkUnicastStats(ifStats *ifStats, uniStats *routeStats) error](#checkUnicastStats)
    * [func checkMulticastStats(ifStats *ifStats, uniStats, multiStats *routeStats) error](#checkMulticastStats)
    * [func BenchmarkInterfaces(b *testing.B)](#BenchmarkInterfaces)
    * [func BenchmarkInterfaceByIndex(b *testing.B)](#BenchmarkInterfaceByIndex)
    * [func BenchmarkInterfaceByName(b *testing.B)](#BenchmarkInterfaceByName)
    * [func BenchmarkInterfaceAddrs(b *testing.B)](#BenchmarkInterfaceAddrs)
    * [func BenchmarkInterfacesAndAddrs(b *testing.B)](#BenchmarkInterfacesAndAddrs)
    * [func BenchmarkInterfacesAndMulticastAddrs(b *testing.B)](#BenchmarkInterfacesAndMulticastAddrs)
    * [func TestPointToPointInterface(t *testing.T)](#TestPointToPointInterface)
    * [func TestInterfaceArrivalAndDeparture(t *testing.T)](#TestInterfaceArrivalAndDeparture)
    * [func TestInterfaceArrivalAndDepartureZoneCache(t *testing.T)](#TestInterfaceArrivalAndDepartureZoneCache)
    * [func TestParseIP(t *testing.T)](#TestParseIP)
    * [func TestLookupWithIP(t *testing.T)](#TestLookupWithIP)
    * [func BenchmarkParseIP(b *testing.B)](#BenchmarkParseIP)
    * [func TestMarshalEmptyIP(t *testing.T)](#TestMarshalEmptyIP)
    * [func TestIPString(t *testing.T)](#TestIPString)
    * [func BenchmarkIPString(b *testing.B)](#BenchmarkIPString)
    * [func benchmarkIPString(b *testing.B, size int)](#benchmarkIPString)
    * [func TestIPMask(t *testing.T)](#TestIPMask)
    * [func TestIPMaskString(t *testing.T)](#TestIPMaskString)
    * [func BenchmarkIPMaskString(b *testing.B)](#BenchmarkIPMaskString)
    * [func TestParseCIDR(t *testing.T)](#TestParseCIDR)
    * [func TestIPNetContains(t *testing.T)](#TestIPNetContains)
    * [func TestIPNetString(t *testing.T)](#TestIPNetString)
    * [func TestCIDRMask(t *testing.T)](#TestCIDRMask)
    * [func TestNetworkNumberAndMask(t *testing.T)](#TestNetworkNumberAndMask)
    * [func TestSplitHostPort(t *testing.T)](#TestSplitHostPort)
    * [func TestJoinHostPort(t *testing.T)](#TestJoinHostPort)
    * [func TestIPAddrFamily(t *testing.T)](#TestIPAddrFamily)
    * [func name(f interface{}) string](#name)
    * [func TestIPAddrScope(t *testing.T)](#TestIPAddrScope)
    * [func BenchmarkIPEqual(b *testing.B)](#BenchmarkIPEqual)
    * [func benchmarkIPEqual(b *testing.B, size int)](#benchmarkIPEqual)
    * [func TestResolveIPAddr(t *testing.T)](#TestResolveIPAddr)
    * [func TestIPConnLocalName(t *testing.T)](#TestIPConnLocalName)
    * [func TestIPConnRemoteName(t *testing.T)](#TestIPConnRemoteName)
    * [func TestDialListenIPArgs(t *testing.T)](#TestDialListenIPArgs)
    * [func TestAddrList(t *testing.T)](#TestAddrList)
    * [func TestAddrListPartition(t *testing.T)](#TestAddrListPartition)
    * [func TestTCPListener(t *testing.T)](#TestTCPListener)
    * [func TestUDPListener(t *testing.T)](#TestUDPListener)
    * [func TestDualStackTCPListener(t *testing.T)](#TestDualStackTCPListener)
    * [func TestDualStackUDPListener(t *testing.T)](#TestDualStackUDPListener)
    * [func differentWildcardAddr(i, j string) bool](#differentWildcardAddr)
    * [func checkFirstListener(network string, ln interface{}) error](#checkFirstListener)
    * [func checkSecondListener(network, address string, err error) error](#checkSecondListener)
    * [func checkDualStackSecondListener(network, address string, err, xerr error) error](#checkDualStackSecondListener)
    * [func checkDualStackAddrFamily(fd *netFD) error](#checkDualStackAddrFamily)
    * [func TestWildWildcardListener(t *testing.T)](#TestWildWildcardListener)
    * [func TestIPv4MulticastListener(t *testing.T)](#TestIPv4MulticastListener)
    * [func TestIPv6MulticastListener(t *testing.T)](#TestIPv6MulticastListener)
    * [func checkMulticastListener(c *UDPConn, ip IP) error](#checkMulticastListener)
    * [func multicastRIBContains(ip IP) (bool, error)](#multicastRIBContains)
    * [func TestClosingListener(t *testing.T)](#TestClosingListener)
    * [func TestListenConfigControl(t *testing.T)](#TestListenConfigControl)
    * [func hasSuffixFold(s, suffix string) bool](#hasSuffixFold)
    * [func lookupLocalhost(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)](#lookupLocalhost)
    * [func TestLookupGoogleSRV(t *testing.T)](#TestLookupGoogleSRV)
    * [func TestLookupGmailMX(t *testing.T)](#TestLookupGmailMX)
    * [func TestLookupGmailNS(t *testing.T)](#TestLookupGmailNS)
    * [func TestLookupGmailTXT(t *testing.T)](#TestLookupGmailTXT)
    * [func TestLookupGooglePublicDNSAddr(t *testing.T)](#TestLookupGooglePublicDNSAddr)
    * [func TestLookupIPv6LinkLocalAddr(t *testing.T)](#TestLookupIPv6LinkLocalAddr)
    * [func TestLookupIPv6LinkLocalAddrWithZone(t *testing.T)](#TestLookupIPv6LinkLocalAddrWithZone)
    * [func TestLookupCNAME(t *testing.T)](#TestLookupCNAME)
    * [func TestLookupGoogleHost(t *testing.T)](#TestLookupGoogleHost)
    * [func TestLookupLongTXT(t *testing.T)](#TestLookupLongTXT)
    * [func TestLookupGoogleIP(t *testing.T)](#TestLookupGoogleIP)
    * [func TestReverseAddress(t *testing.T)](#TestReverseAddress)
    * [func TestDNSFlood(t *testing.T)](#TestDNSFlood)
    * [func TestLookupDotsWithLocalSource(t *testing.T)](#TestLookupDotsWithLocalSource)
    * [func TestLookupDotsWithRemoteSource(t *testing.T)](#TestLookupDotsWithRemoteSource)
    * [func testDots(t *testing.T, mode string)](#testDots)
    * [func mxString(mxs []*MX) string](#mxString)
    * [func nsString(nss []*NS) string](#nsString)
    * [func srvString(srvs []*SRV) string](#srvString)
    * [func TestLookupPort(t *testing.T)](#TestLookupPort)
    * [func TestLookupPort_Minimal(t *testing.T)](#TestLookupPort_Minimal)
    * [func TestLookupProtocol_Minimal(t *testing.T)](#TestLookupProtocol_Minimal)
    * [func TestLookupNonLDH(t *testing.T)](#TestLookupNonLDH)
    * [func TestLookupContextCancel(t *testing.T)](#TestLookupContextCancel)
    * [func TestNilResolverLookup(t *testing.T)](#TestNilResolverLookup)
    * [func TestLookupHostCancel(t *testing.T)](#TestLookupHostCancel)
    * [func TestConcurrentPreferGoResolversDial(t *testing.T)](#TestConcurrentPreferGoResolversDial)
    * [func TestIPVersion(t *testing.T)](#TestIPVersion)
    * [func TestLookupIPAddrPreservesContextValues(t *testing.T)](#TestLookupIPAddrPreservesContextValues)
    * [func TestLookupIPAddrConcurrentCallsForNetworks(t *testing.T)](#TestLookupIPAddrConcurrentCallsForNetworks)
    * [func TestWithUnexpiredValuesPreserved(t *testing.T)](#TestWithUnexpiredValuesPreserved)
    * [func TestLookupNullByte(t *testing.T)](#TestLookupNullByte)
    * [func TestResolverLookupIP(t *testing.T)](#TestResolverLookupIP)
    * [func TestParseMAC(t *testing.T)](#TestParseMAC)
    * [func forceGoDNS() func()](#forceGoDNS)
    * [func forceCgoDNS() func()](#forceCgoDNS)
    * [func enableSocketConnect()](#enableSocketConnect)
    * [func disableSocketConnect(network string)](#disableSocketConnect)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func setupTestData()](#setupTestData)
    * [func printRunningGoroutines()](#printRunningGoroutines)
    * [func runningGoroutines() []string](#runningGoroutines)
    * [func printInflightSockets()](#printInflightSockets)
    * [func printSocketStats()](#printSocketStats)
    * [func installTestHooks()](#installTestHooks)
    * [func uninstallTestHooks()](#uninstallTestHooks)
    * [func forceCloseSockets()](#forceCloseSockets)
    * [func testUnixAddr() string](#testUnixAddr)
    * [func newDualStackListener() (lns []*TCPListener, err error)](#newDualStackListener)
    * [func transceiver(c Conn, wb []byte, ch chan<- error)](#transceiver)
    * [func timeoutReceiver(c Conn, d, min, max time.Duration, ch chan<- error)](#timeoutReceiver)
    * [func timeoutTransmitter(c Conn, d, min, max time.Duration, ch chan<- error)](#timeoutTransmitter)
    * [func newDualStackPacketListener() (cs []*UDPConn, err error)](#newDualStackPacketListener)
    * [func packetTransponder(c PacketConn, ch chan<- error)](#packetTransponder)
    * [func packetTransceiver(c PacketConn, wb []byte, dst Addr, ch chan<- error)](#packetTransceiver)
    * [func timeoutPacketReceiver(c PacketConn, d, min, max time.Duration, ch chan<- error)](#timeoutPacketReceiver)
    * [func TestCloseRead(t *testing.T)](#TestCloseRead)
    * [func TestCloseWrite(t *testing.T)](#TestCloseWrite)
    * [func TestConnClose(t *testing.T)](#TestConnClose)
    * [func TestListenerClose(t *testing.T)](#TestListenerClose)
    * [func TestPacketConnClose(t *testing.T)](#TestPacketConnClose)
    * [func TestListenCloseListen(t *testing.T)](#TestListenCloseListen)
    * [func TestAcceptIgnoreAbortedConnRequest(t *testing.T)](#TestAcceptIgnoreAbortedConnRequest)
    * [func TestZeroByteRead(t *testing.T)](#TestZeroByteRead)
    * [func withTCPConnPair(t *testing.T, peer1, peer2 func(c *TCPConn) error)](#withTCPConnPair)
    * [func TestReadTimeoutUnblocksRead(t *testing.T)](#TestReadTimeoutUnblocksRead)
    * [func TestCloseUnblocksRead(t *testing.T)](#TestCloseUnblocksRead)
    * [func TestNotTemporaryRead(t *testing.T)](#TestNotTemporaryRead)
    * [func TestErrors(t *testing.T)](#TestErrors)
    * [func TestParseNSSConf(t *testing.T)](#TestParseNSSConf)
    * [func packetConnTestData(t *testing.T, network string) ([]byte, func())](#packetConnTestData)
    * [func TestPacketConn(t *testing.T)](#TestPacketConn)
    * [func TestConnAndPacketConn(t *testing.T)](#TestConnAndPacketConn)
    * [func TestReadLine(t *testing.T)](#TestReadLine)
    * [func TestGoDebugString(t *testing.T)](#TestGoDebugString)
    * [func TestDtoi(t *testing.T)](#TestDtoi)
    * [func init()](#init)
    * [func testableNetwork(network string) bool](#testableNetwork)
    * [func iOS() bool](#iOS)
    * [func testableAddress(network, address string) bool](#testableAddress)
    * [func testableListenArgs(network, address, client string) bool](#testableListenArgs)
    * [func condFatalf(t *testing.T, network string, format string, args ...interface{})](#condFatalf)
    * [func TestParsePort(t *testing.T)](#TestParsePort)
    * [func TestTCPListenerSpecificMethods(t *testing.T)](#TestTCPListenerSpecificMethods)
    * [func TestTCPConnSpecificMethods(t *testing.T)](#TestTCPConnSpecificMethods)
    * [func TestUDPConnSpecificMethods(t *testing.T)](#TestUDPConnSpecificMethods)
    * [func TestIPConnSpecificMethods(t *testing.T)](#TestIPConnSpecificMethods)
    * [func TestUnixListenerSpecificMethods(t *testing.T)](#TestUnixListenerSpecificMethods)
    * [func TestUnixConnSpecificMethods(t *testing.T)](#TestUnixConnSpecificMethods)
    * [func TestRawConnReadWrite(t *testing.T)](#TestRawConnReadWrite)
    * [func TestRawConnControl(t *testing.T)](#TestRawConnControl)
    * [func readRawConn(c syscall.RawConn, b []byte) (int, error)](#readRawConn)
    * [func writeRawConn(c syscall.RawConn, b []byte) error](#writeRawConn)
    * [func controlRawConn(c syscall.RawConn, addr Addr) error](#controlRawConn)
    * [func controlOnConnSetup(network string, address string, c syscall.RawConn) error](#controlOnConnSetup)
    * [func TestSendfile(t *testing.T)](#TestSendfile)
    * [func TestSendfileParts(t *testing.T)](#TestSendfileParts)
    * [func TestSendfileSeeked(t *testing.T)](#TestSendfileSeeked)
    * [func TestSendfilePipe(t *testing.T)](#TestSendfilePipe)
    * [func TestSendfileOnWriteTimeoutExceeded(t *testing.T)](#TestSendfileOnWriteTimeoutExceeded)
    * [func TestTCPServer(t *testing.T)](#TestTCPServer)
    * [func TestUnixAndUnixpacketServer(t *testing.T)](#TestUnixAndUnixpacketServer)
    * [func TestUDPServer(t *testing.T)](#TestUDPServer)
    * [func TestUnixgramServer(t *testing.T)](#TestUnixgramServer)
    * [func BenchmarkTCP4OneShot(b *testing.B)](#BenchmarkTCP4OneShot)
    * [func BenchmarkTCP4OneShotTimeout(b *testing.B)](#BenchmarkTCP4OneShotTimeout)
    * [func BenchmarkTCP4Persistent(b *testing.B)](#BenchmarkTCP4Persistent)
    * [func BenchmarkTCP4PersistentTimeout(b *testing.B)](#BenchmarkTCP4PersistentTimeout)
    * [func BenchmarkTCP6OneShot(b *testing.B)](#BenchmarkTCP6OneShot)
    * [func BenchmarkTCP6OneShotTimeout(b *testing.B)](#BenchmarkTCP6OneShotTimeout)
    * [func BenchmarkTCP6Persistent(b *testing.B)](#BenchmarkTCP6Persistent)
    * [func BenchmarkTCP6PersistentTimeout(b *testing.B)](#BenchmarkTCP6PersistentTimeout)
    * [func benchmarkTCP(b *testing.B, persistent, timeout bool, laddr string)](#benchmarkTCP)
    * [func BenchmarkTCP4ConcurrentReadWrite(b *testing.B)](#BenchmarkTCP4ConcurrentReadWrite)
    * [func BenchmarkTCP6ConcurrentReadWrite(b *testing.B)](#BenchmarkTCP6ConcurrentReadWrite)
    * [func benchmarkTCPConcurrentReadWrite(b *testing.B, laddr string)](#benchmarkTCPConcurrentReadWrite)
    * [func TestResolveTCPAddr(t *testing.T)](#TestResolveTCPAddr)
    * [func TestTCPListenerName(t *testing.T)](#TestTCPListenerName)
    * [func TestIPv6LinkLocalUnicastTCP(t *testing.T)](#TestIPv6LinkLocalUnicastTCP)
    * [func TestTCPConcurrentAccept(t *testing.T)](#TestTCPConcurrentAccept)
    * [func TestTCPReadWriteAllocs(t *testing.T)](#TestTCPReadWriteAllocs)
    * [func TestTCPStress(t *testing.T)](#TestTCPStress)
    * [func TestTCPSelfConnect(t *testing.T)](#TestTCPSelfConnect)
    * [func TestTCPBig(t *testing.T)](#TestTCPBig)
    * [func TestCopyPipeIntoTCP(t *testing.T)](#TestCopyPipeIntoTCP)
    * [func BenchmarkSetReadDeadline(b *testing.B)](#BenchmarkSetReadDeadline)
    * [func TestTCPSpuriousConnSetupCompletion(t *testing.T)](#TestTCPSpuriousConnSetupCompletion)
    * [func TestTCPSpuriousConnSetupCompletionWithCancel(t *testing.T)](#TestTCPSpuriousConnSetupCompletionWithCancel)
    * [func TestDialTimeout(t *testing.T)](#TestDialTimeout)
    * [func TestDialTimeoutMaxDuration(t *testing.T)](#TestDialTimeoutMaxDuration)
    * [func TestAcceptTimeout(t *testing.T)](#TestAcceptTimeout)
    * [func TestAcceptTimeoutMustReturn(t *testing.T)](#TestAcceptTimeoutMustReturn)
    * [func TestAcceptTimeoutMustNotReturn(t *testing.T)](#TestAcceptTimeoutMustNotReturn)
    * [func TestReadTimeout(t *testing.T)](#TestReadTimeout)
    * [func TestReadTimeoutMustNotReturn(t *testing.T)](#TestReadTimeoutMustNotReturn)
    * [func TestReadFromTimeout(t *testing.T)](#TestReadFromTimeout)
    * [func TestWriteTimeout(t *testing.T)](#TestWriteTimeout)
    * [func TestWriteTimeoutMustNotReturn(t *testing.T)](#TestWriteTimeoutMustNotReturn)
    * [func TestWriteToTimeout(t *testing.T)](#TestWriteToTimeout)
    * [func TestReadTimeoutFluctuation(t *testing.T)](#TestReadTimeoutFluctuation)
    * [func TestReadFromTimeoutFluctuation(t *testing.T)](#TestReadFromTimeoutFluctuation)
    * [func TestWriteTimeoutFluctuation(t *testing.T)](#TestWriteTimeoutFluctuation)
    * [func TestVariousDeadlines(t *testing.T)](#TestVariousDeadlines)
    * [func TestVariousDeadlines1Proc(t *testing.T)](#TestVariousDeadlines1Proc)
    * [func TestVariousDeadlines4Proc(t *testing.T)](#TestVariousDeadlines4Proc)
    * [func testVariousDeadlines(t *testing.T)](#testVariousDeadlines)
    * [func TestReadWriteProlongedTimeout(t *testing.T)](#TestReadWriteProlongedTimeout)
    * [func TestReadWriteDeadlineRace(t *testing.T)](#TestReadWriteDeadlineRace)
    * [func TestConcurrentSetDeadline(t *testing.T)](#TestConcurrentSetDeadline)
    * [func isDeadlineExceeded(err error) bool](#isDeadlineExceeded)
    * [func BenchmarkUDP6LinkLocalUnicast(b *testing.B)](#BenchmarkUDP6LinkLocalUnicast)
    * [func TestResolveUDPAddr(t *testing.T)](#TestResolveUDPAddr)
    * [func TestWriteToUDP(t *testing.T)](#TestWriteToUDP)
    * [func testWriteToConn(t *testing.T, raddr string)](#testWriteToConn)
    * [func testWriteToPacketConn(t *testing.T, raddr string)](#testWriteToPacketConn)
    * [func TestUDPConnLocalName(t *testing.T)](#TestUDPConnLocalName)
    * [func TestUDPConnLocalAndRemoteNames(t *testing.T)](#TestUDPConnLocalAndRemoteNames)
    * [func TestIPv6LinkLocalUnicastUDP(t *testing.T)](#TestIPv6LinkLocalUnicastUDP)
    * [func TestUDPZeroBytePayload(t *testing.T)](#TestUDPZeroBytePayload)
    * [func TestUDPZeroByteBuffer(t *testing.T)](#TestUDPZeroByteBuffer)
    * [func TestUDPReadSizeError(t *testing.T)](#TestUDPReadSizeError)
    * [func TestUDPReadTimeout(t *testing.T)](#TestUDPReadTimeout)
    * [func BenchmarkWriteToReadFromUDP(b *testing.B)](#BenchmarkWriteToReadFromUDP)
    * [func TestUnixConnReadMsgUnixSCMRightsCloseOnExec(t *testing.T)](#TestUnixConnReadMsgUnixSCMRightsCloseOnExec)
    * [func TestReadUnixgramWithUnnamedSocket(t *testing.T)](#TestReadUnixgramWithUnnamedSocket)
    * [func TestUnixgramZeroBytePayload(t *testing.T)](#TestUnixgramZeroBytePayload)
    * [func TestUnixgramZeroByteBuffer(t *testing.T)](#TestUnixgramZeroByteBuffer)
    * [func TestUnixgramWrite(t *testing.T)](#TestUnixgramWrite)
    * [func testUnixgramWriteConn(t *testing.T, raddr *UnixAddr)](#testUnixgramWriteConn)
    * [func testUnixgramWritePacketConn(t *testing.T, raddr *UnixAddr)](#testUnixgramWritePacketConn)
    * [func TestUnixConnLocalAndRemoteNames(t *testing.T)](#TestUnixConnLocalAndRemoteNames)
    * [func TestUnixgramConnLocalAndRemoteNames(t *testing.T)](#TestUnixgramConnLocalAndRemoteNames)
    * [func TestUnixUnlink(t *testing.T)](#TestUnixUnlink)
    * [func TestEndlessWrite(t *testing.T)](#TestEndlessWrite)
    * [func TestBuffers_read(t *testing.T)](#TestBuffers_read)
    * [func TestBuffers_consume(t *testing.T)](#TestBuffers_consume)
    * [func TestBuffers_WriteTo(t *testing.T)](#TestBuffers_WriteTo)
    * [func testBuffer_writeTo(t *testing.T, chunks int, useCopy bool)](#testBuffer_writeTo)
    * [func TestWritevError(t *testing.T)](#TestWritevError)
    * [func cgoNameinfoPTR(b []byte, sa *C.struct_sockaddr, salen C.socklen_t) (int, error)](#cgoNameinfoPTR)
    * [func cgoSockaddrInet4(ip IP) *C.struct_sockaddr](#cgoSockaddrInet4)
    * [func cgoSockaddrInet6(ip IP, zone int) *C.struct_sockaddr](#cgoSockaddrInet6)
    * [func cgoLookupHost(ctx context.Context, name string) (hosts []string, err error, completed bool)](#cgoLookupHost)
    * [func cgoLookupPort(ctx context.Context, network, service string) (port int, err error, completed bool)](#cgoLookupPort)
    * [func cgoLookupServicePort(hints *C.struct_addrinfo, network, service string) (port int, err error)](#cgoLookupServicePort)
    * [func cgoPortLookup(result chan<- portLookupResult, hints *C.struct_addrinfo, network, service string)](#cgoPortLookup)
    * [func cgoLookupIPCNAME(network, name string) (addrs []IPAddr, cname string, err error)](#cgoLookupIPCNAME)
    * [func cgoIPLookup(result chan<- ipLookupResult, network, name string)](#cgoIPLookup)
    * [func cgoLookupIP(ctx context.Context, network, name string) (addrs []IPAddr, err error, completed bool)](#cgoLookupIP)
    * [func cgoLookupCNAME(ctx context.Context, name string) (cname string, err error, completed bool)](#cgoLookupCNAME)
    * [func cgoLookupPTR(ctx context.Context, addr string) (names []string, err error, completed bool)](#cgoLookupPTR)
    * [func cgoLookupAddrPTR(addr string, sa *C.struct_sockaddr, salen C.socklen_t) (names []string, err error)](#cgoLookupAddrPTR)
    * [func cgoReverseLookup(result chan<- reverseLookupResult, addr string, sa *C.struct_sockaddr, salen C.socklen_t)](#cgoReverseLookup)
    * [func cgoSockaddr(ip IP, zone string) (*C.struct_sockaddr, C.socklen_t)](#cgoSockaddr)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="scopeInterfaceLocal" href="#scopeInterfaceLocal">const scopeInterfaceLocal</a>

```
searchKey: net.scopeInterfaceLocal
```

```Go
const scopeInterfaceLocal scope = 0x1
```

### <a id="scopeLinkLocal" href="#scopeLinkLocal">const scopeLinkLocal</a>

```
searchKey: net.scopeLinkLocal
```

```Go
const scopeLinkLocal scope = 0x2
```

### <a id="scopeAdminLocal" href="#scopeAdminLocal">const scopeAdminLocal</a>

```
searchKey: net.scopeAdminLocal
```

```Go
const scopeAdminLocal scope = 0x4
```

### <a id="scopeSiteLocal" href="#scopeSiteLocal">const scopeSiteLocal</a>

```
searchKey: net.scopeSiteLocal
```

```Go
const scopeSiteLocal scope = 0x5
```

### <a id="scopeOrgLocal" href="#scopeOrgLocal">const scopeOrgLocal</a>

```
searchKey: net.scopeOrgLocal
```

```Go
const scopeOrgLocal scope = 0x8
```

### <a id="scopeGlobal" href="#scopeGlobal">const scopeGlobal</a>

```
searchKey: net.scopeGlobal
```

```Go
const scopeGlobal scope = 0xe
```

### <a id="defaultTCPKeepAlive" href="#defaultTCPKeepAlive">const defaultTCPKeepAlive</a>

```
searchKey: net.defaultTCPKeepAlive
```

```Go
const defaultTCPKeepAlive = 15 * time.Second
```

defaultTCPKeepAlive is a default constant value for TCPKeepAlive times See golang.org/issue/31510 

### <a id="useTCPOnly" href="#useTCPOnly">const useTCPOnly</a>

```
searchKey: net.useTCPOnly
```

```Go
const useTCPOnly = true
```

to be used as a useTCP parameter to exchange 

### <a id="useUDPOrTCP" href="#useUDPOrTCP">const useUDPOrTCP</a>

```
searchKey: net.useUDPOrTCP
```

```Go
const useUDPOrTCP = false
```

### <a id="hostLookupCgo" href="#hostLookupCgo">const hostLookupCgo</a>

```
searchKey: net.hostLookupCgo
```

```Go
const hostLookupCgo hostLookupOrder = iota
```

hostLookupCgo means defer to cgo. 

### <a id="hostLookupFilesDNS" href="#hostLookupFilesDNS">const hostLookupFilesDNS</a>

```
searchKey: net.hostLookupFilesDNS
```

```Go
const hostLookupFilesDNS // files first

```

### <a id="hostLookupDNSFiles" href="#hostLookupDNSFiles">const hostLookupDNSFiles</a>

```
searchKey: net.hostLookupDNSFiles
```

```Go
const hostLookupDNSFiles // dns first

```

### <a id="hostLookupFiles" href="#hostLookupFiles">const hostLookupFiles</a>

```
searchKey: net.hostLookupFiles
```

```Go
const hostLookupFiles // only files

```

### <a id="hostLookupDNS" href="#hostLookupDNS">const hostLookupDNS</a>

```
searchKey: net.hostLookupDNS
```

```Go
const hostLookupDNS // only DNS

```

### <a id="readSyscallName" href="#readSyscallName">const readSyscallName</a>

```
searchKey: net.readSyscallName
```

```Go
const readSyscallName = "read"
```

### <a id="readFromSyscallName" href="#readFromSyscallName">const readFromSyscallName</a>

```
searchKey: net.readFromSyscallName
```

```Go
const readFromSyscallName = "recvfrom"
```

### <a id="readMsgSyscallName" href="#readMsgSyscallName">const readMsgSyscallName</a>

```
searchKey: net.readMsgSyscallName
```

```Go
const readMsgSyscallName = "recvmsg"
```

### <a id="writeSyscallName" href="#writeSyscallName">const writeSyscallName</a>

```
searchKey: net.writeSyscallName
```

```Go
const writeSyscallName = "write"
```

### <a id="writeToSyscallName" href="#writeToSyscallName">const writeToSyscallName</a>

```
searchKey: net.writeToSyscallName
```

```Go
const writeToSyscallName = "sendto"
```

### <a id="writeMsgSyscallName" href="#writeMsgSyscallName">const writeMsgSyscallName</a>

```
searchKey: net.writeMsgSyscallName
```

```Go
const writeMsgSyscallName = "sendmsg"
```

### <a id="cacheMaxAge" href="#cacheMaxAge">const cacheMaxAge</a>

```
searchKey: net.cacheMaxAge
```

```Go
const cacheMaxAge = 5 * time.Second
```

### <a id="FlagUp" href="#FlagUp">const FlagUp</a>

```
searchKey: net.FlagUp
tags: [exported]
```

```Go
const FlagUp Flags = 1 << iota // interface is up

```

### <a id="FlagBroadcast" href="#FlagBroadcast">const FlagBroadcast</a>

```
searchKey: net.FlagBroadcast
tags: [exported]
```

```Go
const FlagBroadcast // interface supports broadcast access capability

```

### <a id="FlagLoopback" href="#FlagLoopback">const FlagLoopback</a>

```
searchKey: net.FlagLoopback
tags: [exported]
```

```Go
const FlagLoopback // interface is a loopback interface

```

### <a id="FlagPointToPoint" href="#FlagPointToPoint">const FlagPointToPoint</a>

```
searchKey: net.FlagPointToPoint
tags: [exported]
```

```Go
const FlagPointToPoint // interface belongs to a point-to-point link

```

### <a id="FlagMulticast" href="#FlagMulticast">const FlagMulticast</a>

```
searchKey: net.FlagMulticast
tags: [exported]
```

```Go
const FlagMulticast // interface supports multicast access capability

```

### <a id="IPv4len" href="#IPv4len">const IPv4len</a>

```
searchKey: net.IPv4len
tags: [exported]
```

```Go
const IPv4len = 4
```

IP address lengths (bytes). 

### <a id="IPv6len" href="#IPv6len">const IPv6len</a>

```
searchKey: net.IPv6len
tags: [exported]
```

```Go
const IPv6len = 16
```

IP address lengths (bytes). 

### <a id="maxProtoLength" href="#maxProtoLength">const maxProtoLength</a>

```
searchKey: net.maxProtoLength
```

```Go
const maxProtoLength = len("RSVP-E2E-IGNORE") + 10 // with room to grow

```

### <a id="maxPortBufSize" href="#maxPortBufSize">const maxPortBufSize</a>

```
searchKey: net.maxPortBufSize
```

```Go
const maxPortBufSize = len("mobility-header") + 10
```

maxPortBufSize is the longest reasonable name of a service (non-numeric port). Currently the longest known IANA-unregistered name is "mobility-header", so we use that length, plus some slop in case something longer is added in the future. 

### <a id="hexDigit" href="#hexDigit">const hexDigit</a>

```
searchKey: net.hexDigit
```

```Go
const hexDigit = "0123456789abcdef"
```

### <a id="big" href="#big">const big</a>

```
searchKey: net.big
```

```Go
const big = 0xFFFFFF
```

Bigger than we need, not too big to worry about overflow 

### <a id="sysTCP_KEEPINTVL" href="#sysTCP_KEEPINTVL">const sysTCP_KEEPINTVL</a>

```
searchKey: net.sysTCP_KEEPINTVL
```

```Go
const sysTCP_KEEPINTVL = 0x101
```

syscall.TCP_KEEPINTVL is missing on some darwin architectures. 

### <a id="readMsgFlags" href="#readMsgFlags">const readMsgFlags</a>

```
searchKey: net.readMsgFlags
```

```Go
const readMsgFlags = 0
```

### <a id="someTimeout" href="#someTimeout">const someTimeout</a>

```
searchKey: net.someTimeout
```

```Go
const someTimeout = 10 * time.Second
```

someTimeout is used just to test that net.Conn implementations don't explode when their SetFooDeadline methods are called. It isn't actually used for testing timeouts. 

### <a id="slowDst4" href="#slowDst4">const slowDst4</a>

```
searchKey: net.slowDst4
```

```Go
const slowDst4 = "198.18.0.254"
```

Define a pair of blackholed (IPv4, IPv6) addresses, for which dialTCP is expected to hang until the timeout elapses. These addresses are reserved for benchmarking by RFC 6890. 

### <a id="slowDst6" href="#slowDst6">const slowDst6</a>

```
searchKey: net.slowDst6
```

```Go
const slowDst6 = "2001:2::254"
```

Define a pair of blackholed (IPv4, IPv6) addresses, for which dialTCP is expected to hang until the timeout elapses. These addresses are reserved for benchmarking by RFC 6890. 

### <a id="ubuntuTrustyAvahi" href="#ubuntuTrustyAvahi">const ubuntuTrustyAvahi</a>

```
searchKey: net.ubuntuTrustyAvahi
```

```Go
const ubuntuTrustyAvahi = ...
```

### <a id="newton" href="#newton">const newton</a>

```
searchKey: net.newton
```

```Go
const newton = "../testdata/Isaac.Newton-Opticks.txt"
```

### <a id="newtonLen" href="#newtonLen">const newtonLen</a>

```
searchKey: net.newtonLen
```

```Go
const newtonLen = 567198
```

### <a id="newtonSHA256" href="#newtonSHA256">const newtonSHA256</a>

```
searchKey: net.newtonSHA256
```

```Go
const newtonSHA256 = "d4a9ac22462b35e7821a4f2706c211093da678620a8f9997989ee7cf8d507bbd"
```

### <a id="cgoAddrInfoFlags" href="#cgoAddrInfoFlags">const cgoAddrInfoFlags</a>

```
searchKey: net.cgoAddrInfoFlags
```

```Go
const cgoAddrInfoFlags = (C.AI_CANONNAME | C.AI_V4MAPPED | C.AI_ALL) & C.AI_MASK
```

### <a id="nameinfoLen" href="#nameinfoLen">const nameinfoLen</a>

```
searchKey: net.nameinfoLen
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

### <a id="maxNameinfoLen" href="#maxNameinfoLen">const maxNameinfoLen</a>

```
searchKey: net.maxNameinfoLen
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

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="rfc6724policyTable" href="#rfc6724policyTable">var rfc6724policyTable</a>

```
searchKey: net.rfc6724policyTable
```

```Go
var rfc6724policyTable = ...
```

RFC 6724 section 2.1. 

### <a id="confOnce" href="#confOnce">var confOnce</a>

```
searchKey: net.confOnce
```

```Go
var confOnce sync.Once // guards init of confVal via initConfVal

```

### <a id="confVal" href="#confVal">var confVal</a>

```
searchKey: net.confVal
```

```Go
var confVal = &conf{goos: runtime.GOOS}
```

### <a id="errLameReferral" href="#errLameReferral">var errLameReferral</a>

```
searchKey: net.errLameReferral
```

```Go
var errLameReferral = errors.New("lame referral")
```

### <a id="errCannotUnmarshalDNSMessage" href="#errCannotUnmarshalDNSMessage">var errCannotUnmarshalDNSMessage</a>

```
searchKey: net.errCannotUnmarshalDNSMessage
```

```Go
var errCannotUnmarshalDNSMessage = errors.New("cannot unmarshal DNS message")
```

### <a id="errCannotMarshalDNSMessage" href="#errCannotMarshalDNSMessage">var errCannotMarshalDNSMessage</a>

```
searchKey: net.errCannotMarshalDNSMessage
```

```Go
var errCannotMarshalDNSMessage = errors.New("cannot marshal DNS message")
```

### <a id="errServerMisbehaving" href="#errServerMisbehaving">var errServerMisbehaving</a>

```
searchKey: net.errServerMisbehaving
```

```Go
var errServerMisbehaving = errors.New("server misbehaving")
```

### <a id="errInvalidDNSResponse" href="#errInvalidDNSResponse">var errInvalidDNSResponse</a>

```
searchKey: net.errInvalidDNSResponse
```

```Go
var errInvalidDNSResponse = errors.New("invalid DNS response")
```

### <a id="errNoAnswerFromDNSServer" href="#errNoAnswerFromDNSServer">var errNoAnswerFromDNSServer</a>

```
searchKey: net.errNoAnswerFromDNSServer
```

```Go
var errNoAnswerFromDNSServer = errors.New("no answer from DNS server")
```

### <a id="errServerTemporarilyMisbehaving" href="#errServerTemporarilyMisbehaving">var errServerTemporarilyMisbehaving</a>

```
searchKey: net.errServerTemporarilyMisbehaving
```

```Go
var errServerTemporarilyMisbehaving = errors.New("server misbehaving")
```

errServerTemporarilyMisbehaving is like errServerMisbehaving, except that when it gets translated to a DNSError, the IsTemporary field gets set to true. 

### <a id="resolvConf" href="#resolvConf">var resolvConf</a>

```
searchKey: net.resolvConf
```

```Go
var resolvConf resolverConfig
```

### <a id="lookupOrderName" href="#lookupOrderName">var lookupOrderName</a>

```
searchKey: net.lookupOrderName
```

```Go
var lookupOrderName = ...
```

### <a id="defaultNS" href="#defaultNS">var defaultNS</a>

```
searchKey: net.defaultNS
```

```Go
var defaultNS = []string{"127.0.0.1:53", "[::1]:53"}
```

### <a id="getHostname" href="#getHostname">var getHostname</a>

```
searchKey: net.getHostname
```

```Go
var getHostname = os.Hostname // variable for testing

```

### <a id="testHookDialTCP" href="#testHookDialTCP">var testHookDialTCP</a>

```
searchKey: net.testHookDialTCP
```

```Go
var testHookDialTCP func(ctx context.Context, net string, laddr, raddr *TCPAddr) (*TCPConn, error)
```

if non-nil, overrides dialTCP. 

### <a id="testHookHostsPath" href="#testHookHostsPath">var testHookHostsPath</a>

```
searchKey: net.testHookHostsPath
```

```Go
var testHookHostsPath = "/etc/hosts"
```

### <a id="testHookLookupIP" href="#testHookLookupIP">var testHookLookupIP</a>

```
searchKey: net.testHookLookupIP
```

```Go
var testHookLookupIP = ...
```

### <a id="testHookSetKeepAlive" href="#testHookSetKeepAlive">var testHookSetKeepAlive</a>

```
searchKey: net.testHookSetKeepAlive
```

```Go
var testHookSetKeepAlive = func(time.Duration) {}
```

### <a id="testHookDialChannel" href="#testHookDialChannel">var testHookDialChannel</a>

```
searchKey: net.testHookDialChannel
```

```Go
var testHookDialChannel = func() {} // for golang.org/issue/5349

```

### <a id="testHookCanceledDial" href="#testHookCanceledDial">var testHookCanceledDial</a>

```
searchKey: net.testHookCanceledDial
```

```Go
var testHookCanceledDial = func() {} // for golang.org/issue/16523

```

### <a id="socketFunc" href="#socketFunc">var socketFunc</a>

```
searchKey: net.socketFunc
```

```Go
var socketFunc func(int, int, int) (int, error) = syscall.Socket
```

Placeholders for socket system calls. 

### <a id="connectFunc" href="#connectFunc">var connectFunc</a>

```
searchKey: net.connectFunc
```

```Go
var connectFunc func(int, syscall.Sockaddr) error = syscall.Connect
```

### <a id="listenFunc" href="#listenFunc">var listenFunc</a>

```
searchKey: net.listenFunc
```

```Go
var listenFunc func(int, int) error = syscall.Listen
```

### <a id="getsockoptIntFunc" href="#getsockoptIntFunc">var getsockoptIntFunc</a>

```
searchKey: net.getsockoptIntFunc
```

```Go
var getsockoptIntFunc func(int, int, int) (int, error) = syscall.GetsockoptInt
```

### <a id="hosts" href="#hosts">var hosts</a>

```
searchKey: net.hosts
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

### <a id="errInvalidInterface" href="#errInvalidInterface">var errInvalidInterface</a>

```
searchKey: net.errInvalidInterface
```

```Go
var errInvalidInterface = errors.New("invalid network interface")
```

### <a id="errInvalidInterfaceIndex" href="#errInvalidInterfaceIndex">var errInvalidInterfaceIndex</a>

```
searchKey: net.errInvalidInterfaceIndex
```

```Go
var errInvalidInterfaceIndex = errors.New("invalid network interface index")
```

### <a id="errInvalidInterfaceName" href="#errInvalidInterfaceName">var errInvalidInterfaceName</a>

```
searchKey: net.errInvalidInterfaceName
```

```Go
var errInvalidInterfaceName = errors.New("invalid network interface name")
```

### <a id="errNoSuchInterface" href="#errNoSuchInterface">var errNoSuchInterface</a>

```
searchKey: net.errNoSuchInterface
```

```Go
var errNoSuchInterface = errors.New("no such network interface")
```

### <a id="errNoSuchMulticastInterface" href="#errNoSuchMulticastInterface">var errNoSuchMulticastInterface</a>

```
searchKey: net.errNoSuchMulticastInterface
```

```Go
var errNoSuchMulticastInterface = errors.New("no such multicast network interface")
```

### <a id="flagNames" href="#flagNames">var flagNames</a>

```
searchKey: net.flagNames
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

### <a id="zoneCache" href="#zoneCache">var zoneCache</a>

```
searchKey: net.zoneCache
```

```Go
var zoneCache = ipv6ZoneCache{
	toIndex: make(map[string]int),
	toName:  make(map[int]string),
}
```

### <a id="v4InV6Prefix" href="#v4InV6Prefix">var v4InV6Prefix</a>

```
searchKey: net.v4InV6Prefix
```

```Go
var v4InV6Prefix = []byte{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xff, 0xff}
```

### <a id="IPv4bcast" href="#IPv4bcast">var IPv4bcast</a>

```
searchKey: net.IPv4bcast
tags: [exported]
```

```Go
var IPv4bcast = IPv4(255, 255, 255, 255) // limited broadcast

```

Well-known IPv4 addresses 

### <a id="IPv4allsys" href="#IPv4allsys">var IPv4allsys</a>

```
searchKey: net.IPv4allsys
tags: [exported]
```

```Go
var IPv4allsys = IPv4(224, 0, 0, 1) // all systems

```

Well-known IPv4 addresses 

### <a id="IPv4allrouter" href="#IPv4allrouter">var IPv4allrouter</a>

```
searchKey: net.IPv4allrouter
tags: [exported]
```

```Go
var IPv4allrouter = IPv4(224, 0, 0, 2) // all routers

```

Well-known IPv4 addresses 

### <a id="IPv4zero" href="#IPv4zero">var IPv4zero</a>

```
searchKey: net.IPv4zero
tags: [exported]
```

```Go
var IPv4zero = IPv4(0, 0, 0, 0) // all zeros

```

Well-known IPv4 addresses 

### <a id="IPv6zero" href="#IPv6zero">var IPv6zero</a>

```
searchKey: net.IPv6zero
tags: [exported]
```

```Go
var IPv6zero = IP{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
```

Well-known IPv6 addresses 

### <a id="IPv6unspecified" href="#IPv6unspecified">var IPv6unspecified</a>

```
searchKey: net.IPv6unspecified
tags: [exported]
```

```Go
var IPv6unspecified = IP{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
```

Well-known IPv6 addresses 

### <a id="IPv6loopback" href="#IPv6loopback">var IPv6loopback</a>

```
searchKey: net.IPv6loopback
tags: [exported]
```

```Go
var IPv6loopback = IP{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}
```

Well-known IPv6 addresses 

### <a id="IPv6interfacelocalallnodes" href="#IPv6interfacelocalallnodes">var IPv6interfacelocalallnodes</a>

```
searchKey: net.IPv6interfacelocalallnodes
tags: [exported]
```

```Go
var IPv6interfacelocalallnodes = IP{0xff, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01}
```

Well-known IPv6 addresses 

### <a id="IPv6linklocalallnodes" href="#IPv6linklocalallnodes">var IPv6linklocalallnodes</a>

```
searchKey: net.IPv6linklocalallnodes
tags: [exported]
```

```Go
var IPv6linklocalallnodes = IP{0xff, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x01}
```

Well-known IPv6 addresses 

### <a id="IPv6linklocalallrouters" href="#IPv6linklocalallrouters">var IPv6linklocalallrouters</a>

```
searchKey: net.IPv6linklocalallrouters
tags: [exported]
```

```Go
var IPv6linklocalallrouters = IP{0xff, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x02}
```

Well-known IPv6 addresses 

### <a id="classAMask" href="#classAMask">var classAMask</a>

```
searchKey: net.classAMask
```

```Go
var classAMask = IPv4Mask(0xff, 0, 0, 0)
```

Default route masks for IPv4. 

### <a id="classBMask" href="#classBMask">var classBMask</a>

```
searchKey: net.classBMask
```

```Go
var classBMask = IPv4Mask(0xff, 0xff, 0, 0)
```

Default route masks for IPv4. 

### <a id="classCMask" href="#classCMask">var classCMask</a>

```
searchKey: net.classCMask
```

```Go
var classCMask = IPv4Mask(0xff, 0xff, 0xff, 0)
```

Default route masks for IPv4. 

### <a id="ipStackCaps" href="#ipStackCaps">var ipStackCaps</a>

```
searchKey: net.ipStackCaps
```

```Go
var ipStackCaps ipStackCapabilities
```

### <a id="protocols" href="#protocols">var protocols</a>

```
searchKey: net.protocols
```

```Go
var protocols = ...
```

protocols contains minimal mappings between internet protocol names and numbers for platforms that don't have a complete list of protocol numbers. 

See [https://www.iana.org/assignments/protocol-numbers](https://www.iana.org/assignments/protocol-numbers) 

On Unix, this map is augmented by readProtocols via lookupProtocol. 

### <a id="services" href="#services">var services</a>

```
searchKey: net.services
```

```Go
var services = ...
```

services contains minimal mappings between services names and port numbers for platforms that don't have a complete list of port numbers. 

See [https://www.iana.org/assignments/service-names-port-numbers](https://www.iana.org/assignments/service-names-port-numbers) 

On Unix, this map is augmented by readServices via goLookupPort. 

### <a id="dnsWaitGroup" href="#dnsWaitGroup">var dnsWaitGroup</a>

```
searchKey: net.dnsWaitGroup
```

```Go
var dnsWaitGroup sync.WaitGroup
```

dnsWaitGroup can be used by tests to wait for all DNS goroutines to complete. This avoids races on the test hooks. 

### <a id="DefaultResolver" href="#DefaultResolver">var DefaultResolver</a>

```
searchKey: net.DefaultResolver
tags: [exported]
```

```Go
var DefaultResolver = &Resolver{}
```

DefaultResolver is the resolver used by the package-level Lookup functions and by Dialers without a specified Resolver. 

### <a id="onceReadProtocols" href="#onceReadProtocols">var onceReadProtocols</a>

```
searchKey: net.onceReadProtocols
```

```Go
var onceReadProtocols sync.Once
```

### <a id="netGo" href="#netGo">var netGo</a>

```
searchKey: net.netGo
```

```Go
var netGo bool // set true in cgo_stub.go for build tag "netgo" (or no cgo)

```

netGo and netCgo contain the state of the build tags used to build this binary, and whether cgo is available. conf.go mirrors these into conf for easier testing. 

### <a id="netCgo" href="#netCgo">var netCgo</a>

```
searchKey: net.netCgo
```

```Go
var netCgo bool // set true in conf_netcgo.go for build tag "netcgo"

```

netGo and netCgo contain the state of the build tags used to build this binary, and whether cgo is available. conf.go mirrors these into conf for easier testing. 

### <a id="listenerBacklogCache" href="#listenerBacklogCache">var listenerBacklogCache</a>

```
searchKey: net.listenerBacklogCache
```

```Go
var listenerBacklogCache struct {
	sync.Once
	val int
}
```

### <a id="errNoSuitableAddress" href="#errNoSuitableAddress">var errNoSuitableAddress</a>

```
searchKey: net.errNoSuitableAddress
```

```Go
var errNoSuitableAddress = errors.New("no suitable address found")
```

Various errors contained in OpError. 

For connection setup operations. 

### <a id="errMissingAddress" href="#errMissingAddress">var errMissingAddress</a>

```
searchKey: net.errMissingAddress
```

```Go
var errMissingAddress = errors.New("missing address")
```

Various errors contained in OpError. 

For connection setup and write operations. 

### <a id="errCanceled" href="#errCanceled">var errCanceled</a>

```
searchKey: net.errCanceled
```

```Go
var errCanceled = errors.New("operation was canceled")
```

Various errors contained in OpError. 

For both read and write operations. 

### <a id="ErrWriteToConnected" href="#ErrWriteToConnected">var ErrWriteToConnected</a>

```
searchKey: net.ErrWriteToConnected
tags: [exported]
```

```Go
var ErrWriteToConnected = errors.New("use of WriteTo with pre-connected connection")
```

Various errors contained in OpError. 

### <a id="aLongTimeAgo" href="#aLongTimeAgo">var aLongTimeAgo</a>

```
searchKey: net.aLongTimeAgo
```

```Go
var aLongTimeAgo = time.Unix(1, 0)
```

aLongTimeAgo is a non-zero time, far in the past, used for immediate cancellation of dials. 

### <a id="noDeadline" href="#noDeadline">var noDeadline</a>

```
searchKey: net.noDeadline
```

```Go
var noDeadline = time.Time{}
```

nonDeadline and noCancel are just zero values for readability with functions taking too many parameters. 

### <a id="noCancel" href="#noCancel">var noCancel</a>

```
searchKey: net.noCancel
```

```Go
var noCancel = (chan struct{})(nil)
```

### <a id="errTimeout" href="#errTimeout">var errTimeout</a>

```
searchKey: net.errTimeout
```

```Go
var errTimeout error = &timeoutError{}
```

errTimeout exists to return the historical "i/o timeout" string for context.DeadlineExceeded. See mapErr. It is also used when Dialer.Deadline is exceeded. 

TODO(iant): We could consider changing this to os.ErrDeadlineExceeded in the future, but note that that would conflict with the TODO at mapErr that suggests changing it to context.DeadlineExceeded. 

### <a id="errNoSuchHost" href="#errNoSuchHost">var errNoSuchHost</a>

```
searchKey: net.errNoSuchHost
```

```Go
var errNoSuchHost = errors.New("no such host")
```

Various errors contained in DNSError. 

### <a id="errClosed" href="#errClosed">var errClosed</a>

```
searchKey: net.errClosed
```

```Go
var errClosed = poll.ErrNetClosing
```

errClosed exists just so that the docs for ErrClosed don't mention the internal package poll. 

### <a id="ErrClosed" href="#ErrClosed">var ErrClosed</a>

```
searchKey: net.ErrClosed
tags: [exported]
```

```Go
var ErrClosed error = errClosed
```

ErrClosed is the error returned by an I/O call on a network connection that has already been closed, or that is closed by another goroutine before the I/O is completed. This may be wrapped in another error, and should normally be tested using errors.Is(err, net.ErrClosed). 

### <a id="threadLimit" href="#threadLimit">var threadLimit</a>

```
searchKey: net.threadLimit
```

```Go
var threadLimit chan struct{}
```

### <a id="threadOnce" href="#threadOnce">var threadOnce</a>

```
searchKey: net.threadOnce
```

```Go
var threadOnce sync.Once
```

### <a id="onceReadServices" href="#onceReadServices">var onceReadServices</a>

```
searchKey: net.onceReadServices
```

```Go
var onceReadServices sync.Once
```

### <a id="defaultResolvConf" href="#defaultResolvConf">var defaultResolvConf</a>

```
searchKey: net.defaultResolvConf
```

```Go
var defaultResolvConf = ...
```

represents a dnsConfig returned by parsing a nonexistent resolv.conf 

### <a id="prohibitionaryDialArgTests" href="#prohibitionaryDialArgTests">var prohibitionaryDialArgTests</a>

```
searchKey: net.prohibitionaryDialArgTests
```

```Go
var prohibitionaryDialArgTests = ...
```

### <a id="goResolver" href="#goResolver">var goResolver</a>

```
searchKey: net.goResolver
```

```Go
var goResolver = Resolver{PreferGo: true}
```

### <a id="TestAddr" href="#TestAddr">var TestAddr</a>

```
searchKey: net.TestAddr
```

```Go
var TestAddr = [4]byte{0xc0, 0x00, 0x02, 0x01}
```

Test address from 192.0.2.0/24 block, reserved by RFC 5737 for documentation. 

### <a id="TestAddr6" href="#TestAddr6">var TestAddr6</a>

```
searchKey: net.TestAddr6
```

```Go
var TestAddr6 = [16]byte{0x20, 0x01, 0x0d, 0xb8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}
```

Test address from 2001:db8::/32 block, reserved by RFC 3849 for documentation. 

### <a id="dnsTransportFallbackTests" href="#dnsTransportFallbackTests">var dnsTransportFallbackTests</a>

```
searchKey: net.dnsTransportFallbackTests
```

```Go
var dnsTransportFallbackTests = ...
```

### <a id="specialDomainNameTests" href="#specialDomainNameTests">var specialDomainNameTests</a>

```
searchKey: net.specialDomainNameTests
```

```Go
var specialDomainNameTests = ...
```

See RFC 6761 for further information about the reserved, pseudo domain names. 

### <a id="fakeDNSServerSuccessful" href="#fakeDNSServerSuccessful">var fakeDNSServerSuccessful</a>

```
searchKey: net.fakeDNSServerSuccessful
```

```Go
var fakeDNSServerSuccessful = ...
```

### <a id="updateResolvConfTests" href="#updateResolvConfTests">var updateResolvConfTests</a>

```
searchKey: net.updateResolvConfTests
```

```Go
var updateResolvConfTests = ...
```

### <a id="goLookupIPWithResolverConfigTests" href="#goLookupIPWithResolverConfigTests">var goLookupIPWithResolverConfigTests</a>

```
searchKey: net.goLookupIPWithResolverConfigTests
```

```Go
var goLookupIPWithResolverConfigTests = ...
```

### <a id="dnsReadConfigTests" href="#dnsReadConfigTests">var dnsReadConfigTests</a>

```
searchKey: net.dnsReadConfigTests
```

```Go
var dnsReadConfigTests = ...
```

### <a id="dnsDefaultSearchTests" href="#dnsDefaultSearchTests">var dnsDefaultSearchTests</a>

```
searchKey: net.dnsDefaultSearchTests
```

```Go
var dnsDefaultSearchTests = ...
```

### <a id="dnsNameTests" href="#dnsNameTests">var dnsNameTests</a>

```
searchKey: net.dnsNameTests
```

```Go
var dnsNameTests = ...
```

### <a id="dialErrorTests" href="#dialErrorTests">var dialErrorTests</a>

```
searchKey: net.dialErrorTests
```

```Go
var dialErrorTests = ...
```

### <a id="listenErrorTests" href="#listenErrorTests">var listenErrorTests</a>

```
searchKey: net.listenErrorTests
```

```Go
var listenErrorTests = ...
```

### <a id="listenPacketErrorTests" href="#listenPacketErrorTests">var listenPacketErrorTests</a>

```
searchKey: net.listenPacketErrorTests
```

```Go
var listenPacketErrorTests = ...
```

### <a id="errTimedout" href="#errTimedout">var errTimedout</a>

```
searchKey: net.errTimedout
```

```Go
var errTimedout = syscall.ETIMEDOUT
```

### <a id="errOpNotSupported" href="#errOpNotSupported">var errOpNotSupported</a>

```
searchKey: net.errOpNotSupported
```

```Go
var errOpNotSupported = syscall.EOPNOTSUPP
```

### <a id="abortedConnRequestErrors" href="#abortedConnRequestErrors">var abortedConnRequestErrors</a>

```
searchKey: net.abortedConnRequestErrors
```

```Go
var abortedConnRequestErrors = []error{syscall.ECONNABORTED} // see accept in fd_unix.go

```

### <a id="dialGoogleTests" href="#dialGoogleTests">var dialGoogleTests</a>

```
searchKey: net.dialGoogleTests
```

```Go
var dialGoogleTests = ...
```

### <a id="literalAddrs4" href="#literalAddrs4">var literalAddrs4</a>

```
searchKey: net.literalAddrs4
```

```Go
var literalAddrs4 = ...
```

### <a id="literalAddrs6" href="#literalAddrs6">var literalAddrs6</a>

```
searchKey: net.literalAddrs6
```

```Go
var literalAddrs6 = ...
```

### <a id="fileConnTests" href="#fileConnTests">var fileConnTests</a>

```
searchKey: net.fileConnTests
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
```

```Go
var filePacketConnTests = []struct {
	network string
}{
	{"udp"},
	{"unixgram"},
}
```

### <a id="lookupStaticHostTests" href="#lookupStaticHostTests">var lookupStaticHostTests</a>

```
searchKey: net.lookupStaticHostTests
```

```Go
var lookupStaticHostTests = ...
```

### <a id="lookupStaticAddrTests" href="#lookupStaticAddrTests">var lookupStaticAddrTests</a>

```
searchKey: net.lookupStaticAddrTests
```

```Go
var lookupStaticAddrTests = ...
```

### <a id="parseIPTests" href="#parseIPTests">var parseIPTests</a>

```
searchKey: net.parseIPTests
```

```Go
var parseIPTests = ...
```

### <a id="ipStringTests" href="#ipStringTests">var ipStringTests</a>

```
searchKey: net.ipStringTests
```

```Go
var ipStringTests = ...
```

### <a id="sink" href="#sink">var sink</a>

```
searchKey: net.sink
```

```Go
var sink string
```

### <a id="ipMaskTests" href="#ipMaskTests">var ipMaskTests</a>

```
searchKey: net.ipMaskTests
```

```Go
var ipMaskTests = ...
```

### <a id="ipMaskStringTests" href="#ipMaskStringTests">var ipMaskStringTests</a>

```
searchKey: net.ipMaskStringTests
```

```Go
var ipMaskStringTests = ...
```

### <a id="parseCIDRTests" href="#parseCIDRTests">var parseCIDRTests</a>

```
searchKey: net.parseCIDRTests
```

```Go
var parseCIDRTests = ...
```

### <a id="ipNetContainsTests" href="#ipNetContainsTests">var ipNetContainsTests</a>

```
searchKey: net.ipNetContainsTests
```

```Go
var ipNetContainsTests = ...
```

### <a id="ipNetStringTests" href="#ipNetStringTests">var ipNetStringTests</a>

```
searchKey: net.ipNetStringTests
```

```Go
var ipNetStringTests = ...
```

### <a id="cidrMaskTests" href="#cidrMaskTests">var cidrMaskTests</a>

```
searchKey: net.cidrMaskTests
```

```Go
var cidrMaskTests = ...
```

### <a id="v4addr" href="#v4addr">var v4addr</a>

```
searchKey: net.v4addr
```

```Go
var v4addr = IP{192, 168, 0, 1}
```

### <a id="v4mappedv6addr" href="#v4mappedv6addr">var v4mappedv6addr</a>

```
searchKey: net.v4mappedv6addr
```

```Go
var v4mappedv6addr = IP{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xff, 0xff, 192, 168, 0, 1}
```

### <a id="v6addr" href="#v6addr">var v6addr</a>

```
searchKey: net.v6addr
```

```Go
var v6addr = IP{0x20, 0x1, 0xd, 0xb8, 0, 0, 0, 0, 0, 0, 0x1, 0x23, 0, 0x12, 0, 0x1}
```

### <a id="v4mask" href="#v4mask">var v4mask</a>

```
searchKey: net.v4mask
```

```Go
var v4mask = IPMask{255, 255, 255, 0}
```

### <a id="v4mappedv6mask" href="#v4mappedv6mask">var v4mappedv6mask</a>

```
searchKey: net.v4mappedv6mask
```

```Go
var v4mappedv6mask = ...
```

### <a id="v6mask" href="#v6mask">var v6mask</a>

```
searchKey: net.v6mask
```

```Go
var v6mask = IPMask{0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0, 0, 0, 0, 0, 0, 0, 0}
```

### <a id="badaddr" href="#badaddr">var badaddr</a>

```
searchKey: net.badaddr
```

```Go
var badaddr = IP{192, 168, 0}
```

### <a id="badmask" href="#badmask">var badmask</a>

```
searchKey: net.badmask
```

```Go
var badmask = IPMask{255, 255, 0}
```

### <a id="v4maskzero" href="#v4maskzero">var v4maskzero</a>

```
searchKey: net.v4maskzero
```

```Go
var v4maskzero = IPMask{0, 0, 0, 0}
```

### <a id="networkNumberAndMaskTests" href="#networkNumberAndMaskTests">var networkNumberAndMaskTests</a>

```
searchKey: net.networkNumberAndMaskTests
```

```Go
var networkNumberAndMaskTests = ...
```

### <a id="ipAddrFamilyTests" href="#ipAddrFamilyTests">var ipAddrFamilyTests</a>

```
searchKey: net.ipAddrFamilyTests
```

```Go
var ipAddrFamilyTests = ...
```

### <a id="ipAddrScopeTests" href="#ipAddrScopeTests">var ipAddrScopeTests</a>

```
searchKey: net.ipAddrScopeTests
```

```Go
var ipAddrScopeTests = ...
```

### <a id="resolveIPAddrTests" href="#resolveIPAddrTests">var resolveIPAddrTests</a>

```
searchKey: net.resolveIPAddrTests
```

```Go
var resolveIPAddrTests = ...
```

### <a id="ipConnLocalNameTests" href="#ipConnLocalNameTests">var ipConnLocalNameTests</a>

```
searchKey: net.ipConnLocalNameTests
```

```Go
var ipConnLocalNameTests = ...
```

### <a id="testInetaddr" href="#testInetaddr">var testInetaddr</a>

```
searchKey: net.testInetaddr
```

```Go
var testInetaddr = func(ip IPAddr) Addr { return &TCPAddr{IP: ip.IP, Port: 5682, Zone: ip.Zone} }
```

### <a id="addrListTests" href="#addrListTests">var addrListTests</a>

```
searchKey: net.addrListTests
```

```Go
var addrListTests = ...
```

### <a id="tcpListenerTests" href="#tcpListenerTests">var tcpListenerTests</a>

```
searchKey: net.tcpListenerTests
```

```Go
var tcpListenerTests = ...
```

### <a id="udpListenerTests" href="#udpListenerTests">var udpListenerTests</a>

```
searchKey: net.udpListenerTests
```

```Go
var udpListenerTests = ...
```

### <a id="dualStackTCPListenerTests" href="#dualStackTCPListenerTests">var dualStackTCPListenerTests</a>

```
searchKey: net.dualStackTCPListenerTests
```

```Go
var dualStackTCPListenerTests = ...
```

### <a id="dualStackUDPListenerTests" href="#dualStackUDPListenerTests">var dualStackUDPListenerTests</a>

```
searchKey: net.dualStackUDPListenerTests
```

```Go
var dualStackUDPListenerTests = ...
```

### <a id="ipv4MulticastListenerTests" href="#ipv4MulticastListenerTests">var ipv4MulticastListenerTests</a>

```
searchKey: net.ipv4MulticastListenerTests
```

```Go
var ipv4MulticastListenerTests = ...
```

### <a id="ipv6MulticastListenerTests" href="#ipv6MulticastListenerTests">var ipv6MulticastListenerTests</a>

```
searchKey: net.ipv6MulticastListenerTests
```

```Go
var ipv6MulticastListenerTests = ...
```

### <a id="lookupGoogleSRVTests" href="#lookupGoogleSRVTests">var lookupGoogleSRVTests</a>

```
searchKey: net.lookupGoogleSRVTests
```

```Go
var lookupGoogleSRVTests = ...
```

### <a id="backoffDuration" href="#backoffDuration">var backoffDuration</a>

```
searchKey: net.backoffDuration
```

```Go
var backoffDuration = [...]time.Duration{time.Second, 5 * time.Second, 30 * time.Second}
```

### <a id="lookupGmailMXTests" href="#lookupGmailMXTests">var lookupGmailMXTests</a>

```
searchKey: net.lookupGmailMXTests
```

```Go
var lookupGmailMXTests = ...
```

### <a id="lookupGmailNSTests" href="#lookupGmailNSTests">var lookupGmailNSTests</a>

```
searchKey: net.lookupGmailNSTests
```

```Go
var lookupGmailNSTests = ...
```

### <a id="lookupGmailTXTTests" href="#lookupGmailTXTTests">var lookupGmailTXTTests</a>

```
searchKey: net.lookupGmailTXTTests
```

```Go
var lookupGmailTXTTests = ...
```

### <a id="lookupGooglePublicDNSAddrTests" href="#lookupGooglePublicDNSAddrTests">var lookupGooglePublicDNSAddrTests</a>

```
searchKey: net.lookupGooglePublicDNSAddrTests
```

```Go
var lookupGooglePublicDNSAddrTests = ...
```

### <a id="lookupCNAMETests" href="#lookupCNAMETests">var lookupCNAMETests</a>

```
searchKey: net.lookupCNAMETests
```

```Go
var lookupCNAMETests = ...
```

### <a id="lookupGoogleHostTests" href="#lookupGoogleHostTests">var lookupGoogleHostTests</a>

```
searchKey: net.lookupGoogleHostTests
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
```

```Go
var lookupGoogleIPTests = []struct {
	name string
}{
	{"google.com"},
	{"google.com."},
}
```

### <a id="revAddrTests" href="#revAddrTests">var revAddrTests</a>

```
searchKey: net.revAddrTests
```

```Go
var revAddrTests = ...
```

### <a id="ipVersionTests" href="#ipVersionTests">var ipVersionTests</a>

```
searchKey: net.ipVersionTests
```

```Go
var ipVersionTests = ...
```

### <a id="parseMACTests" href="#parseMACTests">var parseMACTests</a>

```
searchKey: net.parseMACTests
```

```Go
var parseMACTests = ...
```

### <a id="sw" href="#sw">var sw</a>

```
searchKey: net.sw
```

```Go
var sw socktest.Switch
```

### <a id="testHookUninstaller" href="#testHookUninstaller">var testHookUninstaller</a>

```
searchKey: net.testHookUninstaller
```

```Go
var testHookUninstaller sync.Once
```

uninstallTestHooks runs just before a run of benchmarks. 

### <a id="testTCPBig" href="#testTCPBig">var testTCPBig</a>

```
searchKey: net.testTCPBig
```

```Go
var testTCPBig = ...
```

### <a id="testDNSFlood" href="#testDNSFlood">var testDNSFlood</a>

```
searchKey: net.testDNSFlood
```

```Go
var testDNSFlood = flag.Bool("dnsflood", false, "whether to test DNS query flooding")
```

### <a id="testIPv4" href="#testIPv4">var testIPv4</a>

```
searchKey: net.testIPv4
```

```Go
var testIPv4 = flag.Bool("ipv4", true, "assume external IPv4 connectivity exists")
```

If external IPv4 connectivity exists, we can try dialing non-node/interface local scope IPv4 addresses. On Windows, Lookup APIs may not return IPv4-related resource records when a node has no external IPv4 connectivity. 

### <a id="testIPv6" href="#testIPv6">var testIPv6</a>

```
searchKey: net.testIPv6
```

```Go
var testIPv6 = flag.Bool("ipv6", false, "assume external IPv6 connectivity exists")
```

If external IPv6 connectivity exists, we can try dialing non-node/interface local scope IPv6 addresses. On Windows, Lookup APIs may not return IPv6-related resource records when a node has no external IPv6 connectivity. 

### <a id="ipv6LinkLocalUnicastTCPTests" href="#ipv6LinkLocalUnicastTCPTests">var ipv6LinkLocalUnicastTCPTests</a>

```
searchKey: net.ipv6LinkLocalUnicastTCPTests
```

```Go
var ipv6LinkLocalUnicastTCPTests []ipv6LinkLocalUnicastTest
```

### <a id="ipv6LinkLocalUnicastUDPTests" href="#ipv6LinkLocalUnicastUDPTests">var ipv6LinkLocalUnicastUDPTests</a>

```
searchKey: net.ipv6LinkLocalUnicastUDPTests
```

```Go
var ipv6LinkLocalUnicastUDPTests []ipv6LinkLocalUnicastTest
```

### <a id="origSocket" href="#origSocket">var origSocket</a>

```
searchKey: net.origSocket
```

```Go
var origSocket = socketFunc
```

Placeholders for saving original socket system calls. 

### <a id="origClose" href="#origClose">var origClose</a>

```
searchKey: net.origClose
```

```Go
var origClose = poll.CloseFunc
```

### <a id="origConnect" href="#origConnect">var origConnect</a>

```
searchKey: net.origConnect
```

```Go
var origConnect = connectFunc
```

### <a id="origListen" href="#origListen">var origListen</a>

```
searchKey: net.origListen
```

```Go
var origListen = listenFunc
```

### <a id="origAccept" href="#origAccept">var origAccept</a>

```
searchKey: net.origAccept
```

```Go
var origAccept = poll.AcceptFunc
```

### <a id="origGetsockoptInt" href="#origGetsockoptInt">var origGetsockoptInt</a>

```
searchKey: net.origGetsockoptInt
```

```Go
var origGetsockoptInt = getsockoptIntFunc
```

### <a id="extraTestHookInstallers" href="#extraTestHookInstallers">var extraTestHookInstallers</a>

```
searchKey: net.extraTestHookInstallers
```

```Go
var extraTestHookInstallers []func()
```

### <a id="extraTestHookUninstallers" href="#extraTestHookUninstallers">var extraTestHookUninstallers</a>

```
searchKey: net.extraTestHookUninstallers
```

```Go
var extraTestHookUninstallers []func()
```

### <a id="packetConnTests" href="#packetConnTests">var packetConnTests</a>

```
searchKey: net.packetConnTests
```

```Go
var packetConnTests = ...
```

### <a id="unixEnabledOnAIX" href="#unixEnabledOnAIX">var unixEnabledOnAIX</a>

```
searchKey: net.unixEnabledOnAIX
```

```Go
var unixEnabledOnAIX bool
```

### <a id="parsePortTests" href="#parsePortTests">var parsePortTests</a>

```
searchKey: net.parsePortTests
```

```Go
var parsePortTests = ...
```

### <a id="tcpServerTests" href="#tcpServerTests">var tcpServerTests</a>

```
searchKey: net.tcpServerTests
```

```Go
var tcpServerTests = ...
```

### <a id="unixAndUnixpacketServerTests" href="#unixAndUnixpacketServerTests">var unixAndUnixpacketServerTests</a>

```
searchKey: net.unixAndUnixpacketServerTests
```

```Go
var unixAndUnixpacketServerTests = ...
```

### <a id="udpServerTests" href="#udpServerTests">var udpServerTests</a>

```
searchKey: net.udpServerTests
```

```Go
var udpServerTests = ...
```

### <a id="unixgramServerTests" href="#unixgramServerTests">var unixgramServerTests</a>

```
searchKey: net.unixgramServerTests
```

```Go
var unixgramServerTests = ...
```

### <a id="resolveTCPAddrTests" href="#resolveTCPAddrTests">var resolveTCPAddrTests</a>

```
searchKey: net.resolveTCPAddrTests
```

```Go
var resolveTCPAddrTests = ...
```

### <a id="tcpListenerNameTests" href="#tcpListenerNameTests">var tcpListenerNameTests</a>

```
searchKey: net.tcpListenerNameTests
```

```Go
var tcpListenerNameTests = ...
```

### <a id="dialTimeoutTests" href="#dialTimeoutTests">var dialTimeoutTests</a>

```
searchKey: net.dialTimeoutTests
```

```Go
var dialTimeoutTests = ...
```

### <a id="dialTimeoutMaxDurationTests" href="#dialTimeoutMaxDurationTests">var dialTimeoutMaxDurationTests</a>

```
searchKey: net.dialTimeoutMaxDurationTests
```

```Go
var dialTimeoutMaxDurationTests = ...
```

### <a id="acceptTimeoutTests" href="#acceptTimeoutTests">var acceptTimeoutTests</a>

```
searchKey: net.acceptTimeoutTests
```

```Go
var acceptTimeoutTests = ...
```

### <a id="readTimeoutTests" href="#readTimeoutTests">var readTimeoutTests</a>

```
searchKey: net.readTimeoutTests
```

```Go
var readTimeoutTests = ...
```

### <a id="readFromTimeoutTests" href="#readFromTimeoutTests">var readFromTimeoutTests</a>

```
searchKey: net.readFromTimeoutTests
```

```Go
var readFromTimeoutTests = ...
```

### <a id="writeTimeoutTests" href="#writeTimeoutTests">var writeTimeoutTests</a>

```
searchKey: net.writeTimeoutTests
```

```Go
var writeTimeoutTests = ...
```

### <a id="writeToTimeoutTests" href="#writeToTimeoutTests">var writeToTimeoutTests</a>

```
searchKey: net.writeToTimeoutTests
```

```Go
var writeToTimeoutTests = ...
```

### <a id="resolveUDPAddrTests" href="#resolveUDPAddrTests">var resolveUDPAddrTests</a>

```
searchKey: net.resolveUDPAddrTests
```

```Go
var resolveUDPAddrTests = ...
```

### <a id="udpConnLocalNameTests" href="#udpConnLocalNameTests">var udpConnLocalNameTests</a>

```
searchKey: net.udpConnLocalNameTests
```

```Go
var udpConnLocalNameTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="ipAttr" href="#ipAttr">type ipAttr struct</a>

```
searchKey: net.ipAttr
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
```

```Go
func ipAttrOf(ip IP) ipAttr
```

### <a id="byRFC6724" href="#byRFC6724">type byRFC6724 struct</a>

```
searchKey: net.byRFC6724
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
```

```Go
func (s *byRFC6724) Len() int
```

#### <a id="byRFC6724.Swap" href="#byRFC6724.Swap">func (s *byRFC6724) Swap(i, j int)</a>

```
searchKey: net.byRFC6724.Swap
```

```Go
func (s *byRFC6724) Swap(i, j int)
```

#### <a id="byRFC6724.Less" href="#byRFC6724.Less">func (s *byRFC6724) Less(i, j int) bool</a>

```
searchKey: net.byRFC6724.Less
```

```Go
func (s *byRFC6724) Less(i, j int) bool
```

Less reports whether i is a better destination address for this host than j. 

The algorithm and variable names comes from RFC 6724 section 6. 

### <a id="policyTableEntry" href="#policyTableEntry">type policyTableEntry struct</a>

```
searchKey: net.policyTableEntry
```

```Go
type policyTableEntry struct {
	Prefix     *IPNet
	Precedence uint8
	Label      uint8
}
```

### <a id="policyTable" href="#policyTable">type policyTable []net.policyTableEntry</a>

```
searchKey: net.policyTable
```

```Go
type policyTable []policyTableEntry
```

#### <a id="policyTable.Classify" href="#policyTable.Classify">func (t policyTable) Classify(ip IP) policyTableEntry</a>

```
searchKey: net.policyTable.Classify
```

```Go
func (t policyTable) Classify(ip IP) policyTableEntry
```

Classify returns the policyTableEntry of the entry with the longest matching prefix that contains ip. The table t must be sorted from largest mask size to smallest. 

### <a id="byMaskLength" href="#byMaskLength">type byMaskLength []net.policyTableEntry</a>

```
searchKey: net.byMaskLength
```

```Go
type byMaskLength []policyTableEntry
```

byMaskLength sorts policyTableEntry by the size of their Prefix.Mask.Size, from smallest mask, to largest. 

#### <a id="byMaskLength.Len" href="#byMaskLength.Len">func (s byMaskLength) Len() int</a>

```
searchKey: net.byMaskLength.Len
```

```Go
func (s byMaskLength) Len() int
```

#### <a id="byMaskLength.Swap" href="#byMaskLength.Swap">func (s byMaskLength) Swap(i, j int)</a>

```
searchKey: net.byMaskLength.Swap
```

```Go
func (s byMaskLength) Swap(i, j int)
```

#### <a id="byMaskLength.Less" href="#byMaskLength.Less">func (s byMaskLength) Less(i, j int) bool</a>

```
searchKey: net.byMaskLength.Less
```

```Go
func (s byMaskLength) Less(i, j int) bool
```

### <a id="scope" href="#scope">type scope uint8</a>

```
searchKey: net.scope
```

```Go
type scope uint8
```

RFC 6724 section 3.1. 

#### <a id="classifyScope" href="#classifyScope">func classifyScope(ip IP) scope</a>

```
searchKey: net.classifyScope
```

```Go
func classifyScope(ip IP) scope
```

### <a id="conf" href="#conf">type conf struct</a>

```
searchKey: net.conf
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
```

```Go
func systemConf() *conf
```

systemConf returns the machine's network configuration. 

#### <a id="conf.canUseCgo" href="#conf.canUseCgo">func (c *conf) canUseCgo() bool</a>

```
searchKey: net.conf.canUseCgo
```

```Go
func (c *conf) canUseCgo() bool
```

canUseCgo reports whether calling cgo functions is allowed for non-hostname lookups. 

#### <a id="conf.hostLookupOrder" href="#conf.hostLookupOrder">func (c *conf) hostLookupOrder(r *Resolver, hostname string) (ret hostLookupOrder)</a>

```
searchKey: net.conf.hostLookupOrder
```

```Go
func (c *conf) hostLookupOrder(r *Resolver, hostname string) (ret hostLookupOrder)
```

hostLookupOrder determines which strategy to use to resolve hostname. The provided Resolver is optional. nil means to not consider its options. 

### <a id="Dialer" href="#Dialer">type Dialer struct</a>

```
searchKey: net.Dialer
tags: [exported]
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

#### <a id="Dialer.dualStack" href="#Dialer.dualStack">func (d *Dialer) dualStack() bool</a>

```
searchKey: net.Dialer.dualStack
```

```Go
func (d *Dialer) dualStack() bool
```

#### <a id="Dialer.deadline" href="#Dialer.deadline">func (d *Dialer) deadline(ctx context.Context, now time.Time) (earliest time.Time)</a>

```
searchKey: net.Dialer.deadline
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

#### <a id="Dialer.resolver" href="#Dialer.resolver">func (d *Dialer) resolver() *Resolver</a>

```
searchKey: net.Dialer.resolver
```

```Go
func (d *Dialer) resolver() *Resolver
```

#### <a id="Dialer.fallbackDelay" href="#Dialer.fallbackDelay">func (d *Dialer) fallbackDelay() time.Duration</a>

```
searchKey: net.Dialer.fallbackDelay
```

```Go
func (d *Dialer) fallbackDelay() time.Duration
```

#### <a id="Dialer.Dial" href="#Dialer.Dial">func (d *Dialer) Dial(network, address string) (Conn, error)</a>

```
searchKey: net.Dialer.Dial
tags: [exported]
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
tags: [exported]
```

```Go
func (d *Dialer) DialContext(ctx context.Context, network, address string) (Conn, error)
```

DialContext connects to the address on the named network using the provided context. 

The provided Context must be non-nil. If the context expires before the connection is complete, an error is returned. Once successfully connected, any expiration of the context will not affect the connection. 

When using TCP, and the host in the address parameter resolves to multiple network addresses, any dial timeout (from d.Timeout or ctx) is spread over each consecutive dial, such that each is given an appropriate fraction of the time to connect. For example, if a host has 4 IP addresses and the timeout is 1 minute, the connect to each single address will be given 15 seconds to complete before trying the next one. 

See func Dial for a description of the network and address parameters. 

### <a id="sysDialer" href="#sysDialer">type sysDialer struct</a>

```
searchKey: net.sysDialer
```

```Go
type sysDialer struct {
	Dialer
	network, address string
}
```

sysDialer contains a Dial's parameters and configuration. 

#### <a id="sysDialer.dialParallel" href="#sysDialer.dialParallel">func (sd *sysDialer) dialParallel(ctx context.Context, primaries, fallbacks addrList) (Conn, error)</a>

```
searchKey: net.sysDialer.dialParallel
```

```Go
func (sd *sysDialer) dialParallel(ctx context.Context, primaries, fallbacks addrList) (Conn, error)
```

dialParallel races two copies of dialSerial, giving the first a head start. It returns the first established connection and closes the others. Otherwise it returns an error from the first primary address. 

#### <a id="sysDialer.dialSerial" href="#sysDialer.dialSerial">func (sd *sysDialer) dialSerial(ctx context.Context, ras addrList) (Conn, error)</a>

```
searchKey: net.sysDialer.dialSerial
```

```Go
func (sd *sysDialer) dialSerial(ctx context.Context, ras addrList) (Conn, error)
```

dialSerial connects to a list of addresses in sequence, returning either the first successful connection, or the first error. 

#### <a id="sysDialer.dialSingle" href="#sysDialer.dialSingle">func (sd *sysDialer) dialSingle(ctx context.Context, ra Addr) (c Conn, err error)</a>

```
searchKey: net.sysDialer.dialSingle
```

```Go
func (sd *sysDialer) dialSingle(ctx context.Context, ra Addr) (c Conn, err error)
```

dialSingle attempts to establish and returns a single connection to the destination address. 

#### <a id="sysDialer.dialIP" href="#sysDialer.dialIP">func (sd *sysDialer) dialIP(ctx context.Context, laddr, raddr *IPAddr) (*IPConn, error)</a>

```
searchKey: net.sysDialer.dialIP
```

```Go
func (sd *sysDialer) dialIP(ctx context.Context, laddr, raddr *IPAddr) (*IPConn, error)
```

#### <a id="sysDialer.dialTCP" href="#sysDialer.dialTCP">func (sd *sysDialer) dialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)</a>

```
searchKey: net.sysDialer.dialTCP
```

```Go
func (sd *sysDialer) dialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)
```

#### <a id="sysDialer.doDialTCP" href="#sysDialer.doDialTCP">func (sd *sysDialer) doDialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)</a>

```
searchKey: net.sysDialer.doDialTCP
```

```Go
func (sd *sysDialer) doDialTCP(ctx context.Context, laddr, raddr *TCPAddr) (*TCPConn, error)
```

#### <a id="sysDialer.dialUDP" href="#sysDialer.dialUDP">func (sd *sysDialer) dialUDP(ctx context.Context, laddr, raddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.sysDialer.dialUDP
```

```Go
func (sd *sysDialer) dialUDP(ctx context.Context, laddr, raddr *UDPAddr) (*UDPConn, error)
```

#### <a id="sysDialer.dialUnix" href="#sysDialer.dialUnix">func (sd *sysDialer) dialUnix(ctx context.Context, laddr, raddr *UnixAddr) (*UnixConn, error)</a>

```
searchKey: net.sysDialer.dialUnix
```

```Go
func (sd *sysDialer) dialUnix(ctx context.Context, laddr, raddr *UnixAddr) (*UnixConn, error)
```

### <a id="ListenConfig" href="#ListenConfig">type ListenConfig struct</a>

```
searchKey: net.ListenConfig
tags: [exported]
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
tags: [exported]
```

```Go
func (lc *ListenConfig) Listen(ctx context.Context, network, address string) (Listener, error)
```

Listen announces on the local network address. 

See func Listen for a description of the network and address parameters. 

#### <a id="ListenConfig.ListenPacket" href="#ListenConfig.ListenPacket">func (lc *ListenConfig) ListenPacket(ctx context.Context, network, address string) (PacketConn, error)</a>

```
searchKey: net.ListenConfig.ListenPacket
tags: [exported]
```

```Go
func (lc *ListenConfig) ListenPacket(ctx context.Context, network, address string) (PacketConn, error)
```

ListenPacket announces on the local network address. 

See func ListenPacket for a description of the network and address parameters. 

### <a id="sysListener" href="#sysListener">type sysListener struct</a>

```
searchKey: net.sysListener
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
```

```Go
func (sl *sysListener) listenIP(ctx context.Context, laddr *IPAddr) (*IPConn, error)
```

#### <a id="sysListener.listenTCP" href="#sysListener.listenTCP">func (sl *sysListener) listenTCP(ctx context.Context, laddr *TCPAddr) (*TCPListener, error)</a>

```
searchKey: net.sysListener.listenTCP
```

```Go
func (sl *sysListener) listenTCP(ctx context.Context, laddr *TCPAddr) (*TCPListener, error)
```

#### <a id="sysListener.listenUDP" href="#sysListener.listenUDP">func (sl *sysListener) listenUDP(ctx context.Context, laddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.sysListener.listenUDP
```

```Go
func (sl *sysListener) listenUDP(ctx context.Context, laddr *UDPAddr) (*UDPConn, error)
```

#### <a id="sysListener.listenMulticastUDP" href="#sysListener.listenMulticastUDP">func (sl *sysListener) listenMulticastUDP(ctx context.Context, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.sysListener.listenMulticastUDP
```

```Go
func (sl *sysListener) listenMulticastUDP(ctx context.Context, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)
```

#### <a id="sysListener.listenUnix" href="#sysListener.listenUnix">func (sl *sysListener) listenUnix(ctx context.Context, laddr *UnixAddr) (*UnixListener, error)</a>

```
searchKey: net.sysListener.listenUnix
```

```Go
func (sl *sysListener) listenUnix(ctx context.Context, laddr *UnixAddr) (*UnixListener, error)
```

#### <a id="sysListener.listenUnixgram" href="#sysListener.listenUnixgram">func (sl *sysListener) listenUnixgram(ctx context.Context, laddr *UnixAddr) (*UnixConn, error)</a>

```
searchKey: net.sysListener.listenUnixgram
```

```Go
func (sl *sysListener) listenUnixgram(ctx context.Context, laddr *UnixAddr) (*UnixConn, error)
```

### <a id="SRV" href="#SRV">type SRV struct</a>

```
searchKey: net.SRV
tags: [exported]
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

### <a id="byPriorityWeight" href="#byPriorityWeight">type byPriorityWeight []*net.SRV</a>

```
searchKey: net.byPriorityWeight
```

```Go
type byPriorityWeight []*SRV
```

byPriorityWeight sorts SRV records by ascending priority and weight. 

#### <a id="byPriorityWeight.Len" href="#byPriorityWeight.Len">func (s byPriorityWeight) Len() int</a>

```
searchKey: net.byPriorityWeight.Len
```

```Go
func (s byPriorityWeight) Len() int
```

#### <a id="byPriorityWeight.Less" href="#byPriorityWeight.Less">func (s byPriorityWeight) Less(i, j int) bool</a>

```
searchKey: net.byPriorityWeight.Less
```

```Go
func (s byPriorityWeight) Less(i, j int) bool
```

#### <a id="byPriorityWeight.Swap" href="#byPriorityWeight.Swap">func (s byPriorityWeight) Swap(i, j int)</a>

```
searchKey: net.byPriorityWeight.Swap
```

```Go
func (s byPriorityWeight) Swap(i, j int)
```

#### <a id="byPriorityWeight.shuffleByWeight" href="#byPriorityWeight.shuffleByWeight">func (addrs byPriorityWeight) shuffleByWeight()</a>

```
searchKey: net.byPriorityWeight.shuffleByWeight
```

```Go
func (addrs byPriorityWeight) shuffleByWeight()
```

shuffleByWeight shuffles SRV records by weight using the algorithm described in RFC 2782. 

#### <a id="byPriorityWeight.sort" href="#byPriorityWeight.sort">func (addrs byPriorityWeight) sort()</a>

```
searchKey: net.byPriorityWeight.sort
```

```Go
func (addrs byPriorityWeight) sort()
```

sort reorders SRV records as specified in RFC 2782. 

### <a id="MX" href="#MX">type MX struct</a>

```
searchKey: net.MX
tags: [exported]
```

```Go
type MX struct {
	Host string
	Pref uint16
}
```

An MX represents a single DNS MX record. 

### <a id="byPref" href="#byPref">type byPref []*net.MX</a>

```
searchKey: net.byPref
```

```Go
type byPref []*MX
```

byPref implements sort.Interface to sort MX records by preference 

#### <a id="byPref.Len" href="#byPref.Len">func (s byPref) Len() int</a>

```
searchKey: net.byPref.Len
```

```Go
func (s byPref) Len() int
```

#### <a id="byPref.Less" href="#byPref.Less">func (s byPref) Less(i, j int) bool</a>

```
searchKey: net.byPref.Less
```

```Go
func (s byPref) Less(i, j int) bool
```

#### <a id="byPref.Swap" href="#byPref.Swap">func (s byPref) Swap(i, j int)</a>

```
searchKey: net.byPref.Swap
```

```Go
func (s byPref) Swap(i, j int)
```

#### <a id="byPref.sort" href="#byPref.sort">func (s byPref) sort()</a>

```
searchKey: net.byPref.sort
```

```Go
func (s byPref) sort()
```

sort reorders MX records as specified in RFC 5321. 

### <a id="NS" href="#NS">type NS struct</a>

```
searchKey: net.NS
tags: [exported]
```

```Go
type NS struct {
	Host string
}
```

An NS represents a single DNS NS record. 

### <a id="resolverConfig" href="#resolverConfig">type resolverConfig struct</a>

```
searchKey: net.resolverConfig
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

#### <a id="resolverConfig.init" href="#resolverConfig.init">func (conf *resolverConfig) init()</a>

```
searchKey: net.resolverConfig.init
```

```Go
func (conf *resolverConfig) init()
```

init initializes conf and is only called via conf.initOnce. 

#### <a id="resolverConfig.tryUpdate" href="#resolverConfig.tryUpdate">func (conf *resolverConfig) tryUpdate(name string)</a>

```
searchKey: net.resolverConfig.tryUpdate
```

```Go
func (conf *resolverConfig) tryUpdate(name string)
```

tryUpdate tries to update conf with the named resolv.conf file. The name variable only exists for testing. It is otherwise always "/etc/resolv.conf". 

#### <a id="resolverConfig.tryAcquireSema" href="#resolverConfig.tryAcquireSema">func (conf *resolverConfig) tryAcquireSema() bool</a>

```
searchKey: net.resolverConfig.tryAcquireSema
```

```Go
func (conf *resolverConfig) tryAcquireSema() bool
```

#### <a id="resolverConfig.releaseSema" href="#resolverConfig.releaseSema">func (conf *resolverConfig) releaseSema()</a>

```
searchKey: net.resolverConfig.releaseSema
```

```Go
func (conf *resolverConfig) releaseSema()
```

### <a id="hostLookupOrder" href="#hostLookupOrder">type hostLookupOrder int</a>

```
searchKey: net.hostLookupOrder
```

```Go
type hostLookupOrder int
```

hostLookupOrder specifies the order of LookupHost lookup strategies. It is basically a simplified representation of nsswitch.conf. "files" means /etc/hosts. 

#### <a id="hostLookupOrder.String" href="#hostLookupOrder.String">func (o hostLookupOrder) String() string</a>

```
searchKey: net.hostLookupOrder.String
```

```Go
func (o hostLookupOrder) String() string
```

### <a id="dnsConfig" href="#dnsConfig">type dnsConfig struct</a>

```
searchKey: net.dnsConfig
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
```

```Go
func dnsReadConfig(filename string) *dnsConfig
```

See resolv.conf(5) on a Linux machine. 

#### <a id="dnsConfig.nameList" href="#dnsConfig.nameList">func (conf *dnsConfig) nameList(name string) []string</a>

```
searchKey: net.dnsConfig.nameList
```

```Go
func (conf *dnsConfig) nameList(name string) []string
```

nameList returns a list of names for sequential DNS queries. 

#### <a id="dnsConfig.serverOffset" href="#dnsConfig.serverOffset">func (c *dnsConfig) serverOffset() uint32</a>

```
searchKey: net.dnsConfig.serverOffset
```

```Go
func (c *dnsConfig) serverOffset() uint32
```

serverOffset returns an offset that can be used to determine indices of servers in c.servers when making queries. When the rotate option is enabled, this offset increases. Otherwise it is always 0. 

### <a id="netFD" href="#netFD">type netFD struct</a>

```
searchKey: net.netFD
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

#### <a id="newFD" href="#newFD">func newFD(sysfd, family, sotype int, net string) (*netFD, error)</a>

```
searchKey: net.newFD
```

```Go
func newFD(sysfd, family, sotype int, net string) (*netFD, error)
```

#### <a id="newFileFD" href="#newFileFD">func newFileFD(f *os.File) (*netFD, error)</a>

```
searchKey: net.newFileFD
```

```Go
func newFileFD(f *os.File) (*netFD, error)
```

#### <a id="internetSocket" href="#internetSocket">func internetSocket(ctx context.Context, net string, laddr, raddr sockaddr, sotype, proto int, mode string, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)</a>

```
searchKey: net.internetSocket
```

```Go
func internetSocket(ctx context.Context, net string, laddr, raddr sockaddr, sotype, proto int, mode string, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)
```

#### <a id="socket" href="#socket">func socket(ctx context.Context, net string, family, sotype, proto int, ipv6only bool, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)</a>

```
searchKey: net.socket
```

```Go
func socket(ctx context.Context, net string, family, sotype, proto int, ipv6only bool, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) (fd *netFD, err error)
```

socket returns a network file descriptor that is ready for asynchronous I/O using the network poller. 

#### <a id="unixSocket" href="#unixSocket">func unixSocket(ctx context.Context, net string, laddr, raddr sockaddr, mode string, ctrlFn func(string, string, syscall.RawConn) error) (*netFD, error)</a>

```
searchKey: net.unixSocket
```

```Go
func unixSocket(ctx context.Context, net string, laddr, raddr sockaddr, mode string, ctrlFn func(string, string, syscall.RawConn) error) (*netFD, error)
```

#### <a id="netFD.setAddr" href="#netFD.setAddr">func (fd *netFD) setAddr(laddr, raddr Addr)</a>

```
searchKey: net.netFD.setAddr
```

```Go
func (fd *netFD) setAddr(laddr, raddr Addr)
```

#### <a id="netFD.Close" href="#netFD.Close">func (fd *netFD) Close() error</a>

```
searchKey: net.netFD.Close
```

```Go
func (fd *netFD) Close() error
```

#### <a id="netFD.shutdown" href="#netFD.shutdown">func (fd *netFD) shutdown(how int) error</a>

```
searchKey: net.netFD.shutdown
```

```Go
func (fd *netFD) shutdown(how int) error
```

#### <a id="netFD.closeRead" href="#netFD.closeRead">func (fd *netFD) closeRead() error</a>

```
searchKey: net.netFD.closeRead
```

```Go
func (fd *netFD) closeRead() error
```

#### <a id="netFD.closeWrite" href="#netFD.closeWrite">func (fd *netFD) closeWrite() error</a>

```
searchKey: net.netFD.closeWrite
```

```Go
func (fd *netFD) closeWrite() error
```

#### <a id="netFD.Read" href="#netFD.Read">func (fd *netFD) Read(p []byte) (n int, err error)</a>

```
searchKey: net.netFD.Read
```

```Go
func (fd *netFD) Read(p []byte) (n int, err error)
```

#### <a id="netFD.readFrom" href="#netFD.readFrom">func (fd *netFD) readFrom(p []byte) (n int, sa syscall.Sockaddr, err error)</a>

```
searchKey: net.netFD.readFrom
```

```Go
func (fd *netFD) readFrom(p []byte) (n int, sa syscall.Sockaddr, err error)
```

#### <a id="netFD.readMsg" href="#netFD.readMsg">func (fd *netFD) readMsg(p []byte, oob []byte, flags int) (n, oobn, retflags int, sa syscall.Sockaddr, err error)</a>

```
searchKey: net.netFD.readMsg
```

```Go
func (fd *netFD) readMsg(p []byte, oob []byte, flags int) (n, oobn, retflags int, sa syscall.Sockaddr, err error)
```

#### <a id="netFD.Write" href="#netFD.Write">func (fd *netFD) Write(p []byte) (nn int, err error)</a>

```
searchKey: net.netFD.Write
```

```Go
func (fd *netFD) Write(p []byte) (nn int, err error)
```

#### <a id="netFD.writeTo" href="#netFD.writeTo">func (fd *netFD) writeTo(p []byte, sa syscall.Sockaddr) (n int, err error)</a>

```
searchKey: net.netFD.writeTo
```

```Go
func (fd *netFD) writeTo(p []byte, sa syscall.Sockaddr) (n int, err error)
```

#### <a id="netFD.writeMsg" href="#netFD.writeMsg">func (fd *netFD) writeMsg(p []byte, oob []byte, sa syscall.Sockaddr) (n int, oobn int, err error)</a>

```
searchKey: net.netFD.writeMsg
```

```Go
func (fd *netFD) writeMsg(p []byte, oob []byte, sa syscall.Sockaddr) (n int, oobn int, err error)
```

#### <a id="netFD.SetDeadline" href="#netFD.SetDeadline">func (fd *netFD) SetDeadline(t time.Time) error</a>

```
searchKey: net.netFD.SetDeadline
```

```Go
func (fd *netFD) SetDeadline(t time.Time) error
```

#### <a id="netFD.SetReadDeadline" href="#netFD.SetReadDeadline">func (fd *netFD) SetReadDeadline(t time.Time) error</a>

```
searchKey: net.netFD.SetReadDeadline
```

```Go
func (fd *netFD) SetReadDeadline(t time.Time) error
```

#### <a id="netFD.SetWriteDeadline" href="#netFD.SetWriteDeadline">func (fd *netFD) SetWriteDeadline(t time.Time) error</a>

```
searchKey: net.netFD.SetWriteDeadline
```

```Go
func (fd *netFD) SetWriteDeadline(t time.Time) error
```

#### <a id="netFD.init" href="#netFD.init">func (fd *netFD) init() error</a>

```
searchKey: net.netFD.init
```

```Go
func (fd *netFD) init() error
```

#### <a id="netFD.name" href="#netFD.name">func (fd *netFD) name() string</a>

```
searchKey: net.netFD.name
```

```Go
func (fd *netFD) name() string
```

#### <a id="netFD.connect" href="#netFD.connect">func (fd *netFD) connect(ctx context.Context, la, ra syscall.Sockaddr) (rsa syscall.Sockaddr, ret error)</a>

```
searchKey: net.netFD.connect
```

```Go
func (fd *netFD) connect(ctx context.Context, la, ra syscall.Sockaddr) (rsa syscall.Sockaddr, ret error)
```

#### <a id="netFD.accept" href="#netFD.accept">func (fd *netFD) accept() (netfd *netFD, err error)</a>

```
searchKey: net.netFD.accept
```

```Go
func (fd *netFD) accept() (netfd *netFD, err error)
```

#### <a id="netFD.dup" href="#netFD.dup">func (fd *netFD) dup() (f *os.File, err error)</a>

```
searchKey: net.netFD.dup
```

```Go
func (fd *netFD) dup() (f *os.File, err error)
```

#### <a id="netFD.ctrlNetwork" href="#netFD.ctrlNetwork">func (fd *netFD) ctrlNetwork() string</a>

```
searchKey: net.netFD.ctrlNetwork
```

```Go
func (fd *netFD) ctrlNetwork() string
```

#### <a id="netFD.addrFunc" href="#netFD.addrFunc">func (fd *netFD) addrFunc() func(syscall.Sockaddr) Addr</a>

```
searchKey: net.netFD.addrFunc
```

```Go
func (fd *netFD) addrFunc() func(syscall.Sockaddr) Addr
```

#### <a id="netFD.dial" href="#netFD.dial">func (fd *netFD) dial(ctx context.Context, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error</a>

```
searchKey: net.netFD.dial
```

```Go
func (fd *netFD) dial(ctx context.Context, laddr, raddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error
```

#### <a id="netFD.listenStream" href="#netFD.listenStream">func (fd *netFD) listenStream(laddr sockaddr, backlog int, ctrlFn func(string, string, syscall.RawConn) error) error</a>

```
searchKey: net.netFD.listenStream
```

```Go
func (fd *netFD) listenStream(laddr sockaddr, backlog int, ctrlFn func(string, string, syscall.RawConn) error) error
```

#### <a id="netFD.listenDatagram" href="#netFD.listenDatagram">func (fd *netFD) listenDatagram(laddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error</a>

```
searchKey: net.netFD.listenDatagram
```

```Go
func (fd *netFD) listenDatagram(laddr sockaddr, ctrlFn func(string, string, syscall.RawConn) error) error
```

#### <a id="netFD.writeBuffers" href="#netFD.writeBuffers">func (fd *netFD) writeBuffers(v *Buffers) (n int64, err error)</a>

```
searchKey: net.netFD.writeBuffers
```

```Go
func (fd *netFD) writeBuffers(v *Buffers) (n int64, err error)
```

### <a id="fileAddr" href="#fileAddr">type fileAddr string</a>

```
searchKey: net.fileAddr
```

```Go
type fileAddr string
```

#### <a id="fileAddr.Network" href="#fileAddr.Network">func (fileAddr) Network() string</a>

```
searchKey: net.fileAddr.Network
```

```Go
func (fileAddr) Network() string
```

#### <a id="fileAddr.String" href="#fileAddr.String">func (f fileAddr) String() string</a>

```
searchKey: net.fileAddr.String
```

```Go
func (f fileAddr) String() string
```

### <a id="Interface" href="#Interface">type Interface struct</a>

```
searchKey: net.Interface
tags: [exported]
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
tags: [exported]
```

```Go
func InterfaceByIndex(index int) (*Interface, error)
```

InterfaceByIndex returns the interface specified by index. 

On Solaris, it returns one of the logical network interfaces sharing the logical data link; for more precision use InterfaceByName. 

#### <a id="interfaceByIndex" href="#interfaceByIndex">func interfaceByIndex(ift []Interface, index int) (*Interface, error)</a>

```
searchKey: net.interfaceByIndex
```

```Go
func interfaceByIndex(ift []Interface, index int) (*Interface, error)
```

#### <a id="InterfaceByName" href="#InterfaceByName">func InterfaceByName(name string) (*Interface, error)</a>

```
searchKey: net.InterfaceByName
tags: [exported]
```

```Go
func InterfaceByName(name string) (*Interface, error)
```

InterfaceByName returns the interface specified by name. 

#### <a id="ipv4AddrToInterface" href="#ipv4AddrToInterface">func ipv4AddrToInterface(ip IP) (*Interface, error)</a>

```
searchKey: net.ipv4AddrToInterface
```

```Go
func ipv4AddrToInterface(ip IP) (*Interface, error)
```

#### <a id="loopbackInterface" href="#loopbackInterface">func loopbackInterface() *Interface</a>

```
searchKey: net.loopbackInterface
```

```Go
func loopbackInterface() *Interface
```

loopbackInterface returns an available logical network interface for loopback tests. It returns nil if no suitable interface is found. 

#### <a id="Interface.Addrs" href="#Interface.Addrs">func (ifi *Interface) Addrs() ([]Addr, error)</a>

```
searchKey: net.Interface.Addrs
tags: [exported]
```

```Go
func (ifi *Interface) Addrs() ([]Addr, error)
```

Addrs returns a list of unicast interface addresses for a specific interface. 

#### <a id="Interface.MulticastAddrs" href="#Interface.MulticastAddrs">func (ifi *Interface) MulticastAddrs() ([]Addr, error)</a>

```
searchKey: net.Interface.MulticastAddrs
tags: [exported]
```

```Go
func (ifi *Interface) MulticastAddrs() ([]Addr, error)
```

MulticastAddrs returns a list of multicast, joined group addresses for a specific interface. 

### <a id="Flags" href="#Flags">type Flags uint</a>

```
searchKey: net.Flags
tags: [exported]
```

```Go
type Flags uint
```

#### <a id="linkFlags" href="#linkFlags">func linkFlags(rawFlags int) Flags</a>

```
searchKey: net.linkFlags
```

```Go
func linkFlags(rawFlags int) Flags
```

#### <a id="Flags.String" href="#Flags.String">func (f Flags) String() string</a>

```
searchKey: net.Flags.String
tags: [exported]
```

```Go
func (f Flags) String() string
```

### <a id="ipv6ZoneCache" href="#ipv6ZoneCache">type ipv6ZoneCache struct</a>

```
searchKey: net.ipv6ZoneCache
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

#### <a id="ipv6ZoneCache.update" href="#ipv6ZoneCache.update">func (zc *ipv6ZoneCache) update(ift []Interface, force bool) (updated bool)</a>

```
searchKey: net.ipv6ZoneCache.update
```

```Go
func (zc *ipv6ZoneCache) update(ift []Interface, force bool) (updated bool)
```

update refreshes the network interface information if the cache was last updated more than 1 minute ago, or if force is set. It reports whether the cache was updated. 

#### <a id="ipv6ZoneCache.name" href="#ipv6ZoneCache.name">func (zc *ipv6ZoneCache) name(index int) string</a>

```
searchKey: net.ipv6ZoneCache.name
```

```Go
func (zc *ipv6ZoneCache) name(index int) string
```

#### <a id="ipv6ZoneCache.index" href="#ipv6ZoneCache.index">func (zc *ipv6ZoneCache) index(name string) int</a>

```
searchKey: net.ipv6ZoneCache.index
```

```Go
func (zc *ipv6ZoneCache) index(name string) int
```

### <a id="IP" href="#IP">type IP []byte</a>

```
searchKey: net.IP
tags: [exported]
```

```Go
type IP []byte
```

An IP is a single IP address, a slice of bytes. Functions in this package accept either 4-byte (IPv4) or 16-byte (IPv6) slices as input. 

Note that in this documentation, referring to an IP address as an IPv4 address or an IPv6 address is a semantic property of the address, not just the length of the byte slice: a 16-byte slice can still be an IPv4 address. 

#### <a id="IPv4" href="#IPv4">func IPv4(a, b, c, d byte) IP</a>

```
searchKey: net.IPv4
tags: [exported]
```

```Go
func IPv4(a, b, c, d byte) IP
```

IPv4 returns the IP address (in 16-byte form) of the IPv4 address a.b.c.d. 

#### <a id="networkNumberAndMask" href="#networkNumberAndMask">func networkNumberAndMask(n *IPNet) (ip IP, m IPMask)</a>

```
searchKey: net.networkNumberAndMask
```

```Go
func networkNumberAndMask(n *IPNet) (ip IP, m IPMask)
```

#### <a id="parseIPv4" href="#parseIPv4">func parseIPv4(s string) IP</a>

```
searchKey: net.parseIPv4
```

```Go
func parseIPv4(s string) IP
```

Parse IPv4 address (d.d.d.d). 

#### <a id="parseIPv6Zone" href="#parseIPv6Zone">func parseIPv6Zone(s string) (IP, string)</a>

```
searchKey: net.parseIPv6Zone
```

```Go
func parseIPv6Zone(s string) (IP, string)
```

parseIPv6Zone parses s as a literal IPv6 address and its associated zone identifier which is described in RFC 4007. 

#### <a id="parseIPv6" href="#parseIPv6">func parseIPv6(s string) (ip IP)</a>

```
searchKey: net.parseIPv6
```

```Go
func parseIPv6(s string) (ip IP)
```

parseIPv6 parses s as a literal IPv6 address described in RFC 4291 and RFC 5952. 

#### <a id="ParseIP" href="#ParseIP">func ParseIP(s string) IP</a>

```
searchKey: net.ParseIP
tags: [exported]
```

```Go
func ParseIP(s string) IP
```

ParseIP parses s as an IP address, returning the result. The string s can be in IPv4 dotted decimal ("192.0.2.1"), IPv6 ("2001:db8::68"), or IPv4-mapped IPv6 ("::ffff:192.0.2.1") form. If s is not a valid textual representation of an IP address, ParseIP returns nil. 

#### <a id="parseIPZone" href="#parseIPZone">func parseIPZone(s string) (IP, string)</a>

```
searchKey: net.parseIPZone
```

```Go
func parseIPZone(s string) (IP, string)
```

parseIPZone parses s as an IP address, return it and its associated zone identifier (IPv6 only). 

#### <a id="ParseCIDR" href="#ParseCIDR">func ParseCIDR(s string) (IP, *IPNet, error)</a>

```
searchKey: net.ParseCIDR
tags: [exported]
```

```Go
func ParseCIDR(s string) (IP, *IPNet, error)
```

ParseCIDR parses s as a CIDR notation IP address and prefix length, like "192.0.2.0/24" or "2001:db8::/32", as defined in RFC 4632 and RFC 4291. 

It returns the IP address and the network implied by the IP and prefix length. For example, ParseCIDR("192.0.2.1/24") returns the IP address 192.0.2.1 and the network 192.0.2.0/24. 

#### <a id="loopbackIP" href="#loopbackIP">func loopbackIP(net string) IP</a>

```
searchKey: net.loopbackIP
```

```Go
func loopbackIP(net string) IP
```

#### <a id="interfaceToIPv4Addr" href="#interfaceToIPv4Addr">func interfaceToIPv4Addr(ifi *Interface) (IP, error)</a>

```
searchKey: net.interfaceToIPv4Addr
```

```Go
func interfaceToIPv4Addr(ifi *Interface) (IP, error)
```

#### <a id="copyIP" href="#copyIP">func copyIP(x IP) IP</a>

```
searchKey: net.copyIP
```

```Go
func copyIP(x IP) IP
```

#### <a id="IP.IsUnspecified" href="#IP.IsUnspecified">func (ip IP) IsUnspecified() bool</a>

```
searchKey: net.IP.IsUnspecified
tags: [exported]
```

```Go
func (ip IP) IsUnspecified() bool
```

IsUnspecified reports whether ip is an unspecified address, either the IPv4 address "0.0.0.0" or the IPv6 address "::". 

#### <a id="IP.IsLoopback" href="#IP.IsLoopback">func (ip IP) IsLoopback() bool</a>

```
searchKey: net.IP.IsLoopback
tags: [exported]
```

```Go
func (ip IP) IsLoopback() bool
```

IsLoopback reports whether ip is a loopback address. 

#### <a id="IP.IsPrivate" href="#IP.IsPrivate">func (ip IP) IsPrivate() bool</a>

```
searchKey: net.IP.IsPrivate
tags: [exported]
```

```Go
func (ip IP) IsPrivate() bool
```

IsPrivate reports whether ip is a private address, according to RFC 1918 (IPv4 addresses) and RFC 4193 (IPv6 addresses). 

#### <a id="IP.IsMulticast" href="#IP.IsMulticast">func (ip IP) IsMulticast() bool</a>

```
searchKey: net.IP.IsMulticast
tags: [exported]
```

```Go
func (ip IP) IsMulticast() bool
```

IsMulticast reports whether ip is a multicast address. 

#### <a id="IP.IsInterfaceLocalMulticast" href="#IP.IsInterfaceLocalMulticast">func (ip IP) IsInterfaceLocalMulticast() bool</a>

```
searchKey: net.IP.IsInterfaceLocalMulticast
tags: [exported]
```

```Go
func (ip IP) IsInterfaceLocalMulticast() bool
```

IsInterfaceLocalMulticast reports whether ip is an interface-local multicast address. 

#### <a id="IP.IsLinkLocalMulticast" href="#IP.IsLinkLocalMulticast">func (ip IP) IsLinkLocalMulticast() bool</a>

```
searchKey: net.IP.IsLinkLocalMulticast
tags: [exported]
```

```Go
func (ip IP) IsLinkLocalMulticast() bool
```

IsLinkLocalMulticast reports whether ip is a link-local multicast address. 

#### <a id="IP.IsLinkLocalUnicast" href="#IP.IsLinkLocalUnicast">func (ip IP) IsLinkLocalUnicast() bool</a>

```
searchKey: net.IP.IsLinkLocalUnicast
tags: [exported]
```

```Go
func (ip IP) IsLinkLocalUnicast() bool
```

IsLinkLocalUnicast reports whether ip is a link-local unicast address. 

#### <a id="IP.IsGlobalUnicast" href="#IP.IsGlobalUnicast">func (ip IP) IsGlobalUnicast() bool</a>

```
searchKey: net.IP.IsGlobalUnicast
tags: [exported]
```

```Go
func (ip IP) IsGlobalUnicast() bool
```

IsGlobalUnicast reports whether ip is a global unicast address. 

The identification of global unicast addresses uses address type identification as defined in RFC 1122, RFC 4632 and RFC 4291 with the exception of IPv4 directed broadcast addresses. It returns true even if ip is in IPv4 private address space or local IPv6 unicast address space. 

#### <a id="IP.To4" href="#IP.To4">func (ip IP) To4() IP</a>

```
searchKey: net.IP.To4
tags: [exported]
```

```Go
func (ip IP) To4() IP
```

To4 converts the IPv4 address ip to a 4-byte representation. If ip is not an IPv4 address, To4 returns nil. 

#### <a id="IP.To16" href="#IP.To16">func (ip IP) To16() IP</a>

```
searchKey: net.IP.To16
tags: [exported]
```

```Go
func (ip IP) To16() IP
```

To16 converts the IP address ip to a 16-byte representation. If ip is not an IP address (it is the wrong length), To16 returns nil. 

#### <a id="IP.DefaultMask" href="#IP.DefaultMask">func (ip IP) DefaultMask() IPMask</a>

```
searchKey: net.IP.DefaultMask
tags: [exported]
```

```Go
func (ip IP) DefaultMask() IPMask
```

DefaultMask returns the default IP mask for the IP address ip. Only IPv4 addresses have default masks; DefaultMask returns nil if ip is not a valid IPv4 address. 

#### <a id="IP.Mask" href="#IP.Mask">func (ip IP) Mask(mask IPMask) IP</a>

```
searchKey: net.IP.Mask
tags: [exported]
```

```Go
func (ip IP) Mask(mask IPMask) IP
```

Mask returns the result of masking the IP address ip with mask. 

#### <a id="IP.String" href="#IP.String">func (ip IP) String() string</a>

```
searchKey: net.IP.String
tags: [exported]
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
#### <a id="IP.MarshalText" href="#IP.MarshalText">func (ip IP) MarshalText() ([]byte, error)</a>

```
searchKey: net.IP.MarshalText
tags: [exported]
```

```Go
func (ip IP) MarshalText() ([]byte, error)
```

MarshalText implements the encoding.TextMarshaler interface. The encoding is the same as returned by String, with one exception: When len(ip) is zero, it returns an empty slice. 

#### <a id="IP.UnmarshalText" href="#IP.UnmarshalText">func (ip *IP) UnmarshalText(text []byte) error</a>

```
searchKey: net.IP.UnmarshalText
tags: [exported]
```

```Go
func (ip *IP) UnmarshalText(text []byte) error
```

UnmarshalText implements the encoding.TextUnmarshaler interface. The IP address is expected in a form accepted by ParseIP. 

#### <a id="IP.Equal" href="#IP.Equal">func (ip IP) Equal(x IP) bool</a>

```
searchKey: net.IP.Equal
tags: [exported]
```

```Go
func (ip IP) Equal(x IP) bool
```

Equal reports whether ip and x are the same IP address. An IPv4 address and that same address in IPv6 form are considered to be equal. 

#### <a id="IP.matchAddrFamily" href="#IP.matchAddrFamily">func (ip IP) matchAddrFamily(x IP) bool</a>

```
searchKey: net.IP.matchAddrFamily
```

```Go
func (ip IP) matchAddrFamily(x IP) bool
```

### <a id="IPMask" href="#IPMask">type IPMask []byte</a>

```
searchKey: net.IPMask
tags: [exported]
```

```Go
type IPMask []byte
```

An IPMask is a bitmask that can be used to manipulate IP addresses for IP addressing and routing. 

See type IPNet and func ParseCIDR for details. 

#### <a id="IPv4Mask" href="#IPv4Mask">func IPv4Mask(a, b, c, d byte) IPMask</a>

```
searchKey: net.IPv4Mask
tags: [exported]
```

```Go
func IPv4Mask(a, b, c, d byte) IPMask
```

IPv4Mask returns the IP mask (in 4-byte form) of the IPv4 mask a.b.c.d. 

#### <a id="CIDRMask" href="#CIDRMask">func CIDRMask(ones, bits int) IPMask</a>

```
searchKey: net.CIDRMask
tags: [exported]
```

```Go
func CIDRMask(ones, bits int) IPMask
```

CIDRMask returns an IPMask consisting of 'ones' 1 bits followed by 0s up to a total length of 'bits' bits. For a mask of this form, CIDRMask is the inverse of IPMask.Size. 

#### <a id="networkNumberAndMask" href="#networkNumberAndMask">func networkNumberAndMask(n *IPNet) (ip IP, m IPMask)</a>

```
searchKey: net.networkNumberAndMask
```

```Go
func networkNumberAndMask(n *IPNet) (ip IP, m IPMask)
```

#### <a id="IPMask.Size" href="#IPMask.Size">func (m IPMask) Size() (ones, bits int)</a>

```
searchKey: net.IPMask.Size
tags: [exported]
```

```Go
func (m IPMask) Size() (ones, bits int)
```

Size returns the number of leading ones and total bits in the mask. If the mask is not in the canonical form--ones followed by zeros--then Size returns 0, 0. 

#### <a id="IPMask.String" href="#IPMask.String">func (m IPMask) String() string</a>

```
searchKey: net.IPMask.String
tags: [exported]
```

```Go
func (m IPMask) String() string
```

String returns the hexadecimal form of m, with no punctuation. 

### <a id="IPNet" href="#IPNet">type IPNet struct</a>

```
searchKey: net.IPNet
tags: [exported]
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
```

```Go
func mustCIDR(s string) *IPNet
```

mustCIDR calls ParseCIDR and panics on any error, or if the network is not IPv6. 

#### <a id="ParseCIDR" href="#ParseCIDR">func ParseCIDR(s string) (IP, *IPNet, error)</a>

```
searchKey: net.ParseCIDR
tags: [exported]
```

```Go
func ParseCIDR(s string) (IP, *IPNet, error)
```

ParseCIDR parses s as a CIDR notation IP address and prefix length, like "192.0.2.0/24" or "2001:db8::/32", as defined in RFC 4632 and RFC 4291. 

It returns the IP address and the network implied by the IP and prefix length. For example, ParseCIDR("192.0.2.1/24") returns the IP address 192.0.2.1 and the network 192.0.2.0/24. 

#### <a id="IPNet.Contains" href="#IPNet.Contains">func (n *IPNet) Contains(ip IP) bool</a>

```
searchKey: net.IPNet.Contains
tags: [exported]
```

```Go
func (n *IPNet) Contains(ip IP) bool
```

Contains reports whether the network includes ip. 

#### <a id="IPNet.Network" href="#IPNet.Network">func (n *IPNet) Network() string</a>

```
searchKey: net.IPNet.Network
tags: [exported]
```

```Go
func (n *IPNet) Network() string
```

Network returns the address's network name, "ip+net". 

#### <a id="IPNet.String" href="#IPNet.String">func (n *IPNet) String() string</a>

```
searchKey: net.IPNet.String
tags: [exported]
```

```Go
func (n *IPNet) String() string
```

String returns the CIDR notation of n like "192.0.2.0/24" or "2001:db8::/48" as defined in RFC 4632 and RFC 4291. If the mask is not in the canonical form, it returns the string which consists of an IP address, followed by a slash character and a mask expressed as hexadecimal form with no punctuation like "198.51.100.0/c000ff00". 

### <a id="IPAddr" href="#IPAddr">type IPAddr struct</a>

```
searchKey: net.IPAddr
tags: [exported]
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
tags: [exported]
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
tags: [exported]
```

```Go
func (a *IPAddr) Network() string
```

Network returns the address's network name, "ip". 

#### <a id="IPAddr.String" href="#IPAddr.String">func (a *IPAddr) String() string</a>

```
searchKey: net.IPAddr.String
tags: [exported]
```

```Go
func (a *IPAddr) String() string
```

#### <a id="IPAddr.isWildcard" href="#IPAddr.isWildcard">func (a *IPAddr) isWildcard() bool</a>

```
searchKey: net.IPAddr.isWildcard
```

```Go
func (a *IPAddr) isWildcard() bool
```

#### <a id="IPAddr.opAddr" href="#IPAddr.opAddr">func (a *IPAddr) opAddr() Addr</a>

```
searchKey: net.IPAddr.opAddr
```

```Go
func (a *IPAddr) opAddr() Addr
```

#### <a id="IPAddr.family" href="#IPAddr.family">func (a *IPAddr) family() int</a>

```
searchKey: net.IPAddr.family
```

```Go
func (a *IPAddr) family() int
```

#### <a id="IPAddr.sockaddr" href="#IPAddr.sockaddr">func (a *IPAddr) sockaddr(family int) (syscall.Sockaddr, error)</a>

```
searchKey: net.IPAddr.sockaddr
```

```Go
func (a *IPAddr) sockaddr(family int) (syscall.Sockaddr, error)
```

#### <a id="IPAddr.toLocal" href="#IPAddr.toLocal">func (a *IPAddr) toLocal(net string) sockaddr</a>

```
searchKey: net.IPAddr.toLocal
```

```Go
func (a *IPAddr) toLocal(net string) sockaddr
```

### <a id="IPConn" href="#IPConn">type IPConn struct</a>

```
searchKey: net.IPConn
tags: [exported]
```

```Go
type IPConn struct {
	conn
}
```

IPConn is the implementation of the Conn and PacketConn interfaces for IP network connections. 

#### <a id="newIPConn" href="#newIPConn">func newIPConn(fd *netFD) *IPConn</a>

```
searchKey: net.newIPConn
```

```Go
func newIPConn(fd *netFD) *IPConn
```

#### <a id="DialIP" href="#DialIP">func DialIP(network string, laddr, raddr *IPAddr) (*IPConn, error)</a>

```
searchKey: net.DialIP
tags: [exported]
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
tags: [exported]
```

```Go
func ListenIP(network string, laddr *IPAddr) (*IPConn, error)
```

ListenIP acts like ListenPacket for IP networks. 

The network must be an IP network name; see func Dial for details. 

If the IP field of laddr is nil or an unspecified IP address, ListenIP listens on all available IP addresses of the local system except multicast IP addresses. 

#### <a id="IPConn.SyscallConn" href="#IPConn.SyscallConn">func (c *IPConn) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.IPConn.SyscallConn
tags: [exported]
```

```Go
func (c *IPConn) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

#### <a id="IPConn.ReadFromIP" href="#IPConn.ReadFromIP">func (c *IPConn) ReadFromIP(b []byte) (int, *IPAddr, error)</a>

```
searchKey: net.IPConn.ReadFromIP
tags: [exported]
```

```Go
func (c *IPConn) ReadFromIP(b []byte) (int, *IPAddr, error)
```

ReadFromIP acts like ReadFrom but returns an IPAddr. 

#### <a id="IPConn.ReadFrom" href="#IPConn.ReadFrom">func (c *IPConn) ReadFrom(b []byte) (int, Addr, error)</a>

```
searchKey: net.IPConn.ReadFrom
tags: [exported]
```

```Go
func (c *IPConn) ReadFrom(b []byte) (int, Addr, error)
```

ReadFrom implements the PacketConn ReadFrom method. 

#### <a id="IPConn.ReadMsgIP" href="#IPConn.ReadMsgIP">func (c *IPConn) ReadMsgIP(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)</a>

```
searchKey: net.IPConn.ReadMsgIP
tags: [exported]
```

```Go
func (c *IPConn) ReadMsgIP(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)
```

ReadMsgIP reads a message from c, copying the payload into b and the associated out-of-band data into oob. It returns the number of bytes copied into b, the number of bytes copied into oob, the flags that were set on the message and the source address of the message. 

The packages golang.org/x/net/ipv4 and golang.org/x/net/ipv6 can be used to manipulate IP-level socket options in oob. 

#### <a id="IPConn.WriteToIP" href="#IPConn.WriteToIP">func (c *IPConn) WriteToIP(b []byte, addr *IPAddr) (int, error)</a>

```
searchKey: net.IPConn.WriteToIP
tags: [exported]
```

```Go
func (c *IPConn) WriteToIP(b []byte, addr *IPAddr) (int, error)
```

WriteToIP acts like WriteTo but takes an IPAddr. 

#### <a id="IPConn.WriteTo" href="#IPConn.WriteTo">func (c *IPConn) WriteTo(b []byte, addr Addr) (int, error)</a>

```
searchKey: net.IPConn.WriteTo
tags: [exported]
```

```Go
func (c *IPConn) WriteTo(b []byte, addr Addr) (int, error)
```

WriteTo implements the PacketConn WriteTo method. 

#### <a id="IPConn.WriteMsgIP" href="#IPConn.WriteMsgIP">func (c *IPConn) WriteMsgIP(b, oob []byte, addr *IPAddr) (n, oobn int, err error)</a>

```
searchKey: net.IPConn.WriteMsgIP
tags: [exported]
```

```Go
func (c *IPConn) WriteMsgIP(b, oob []byte, addr *IPAddr) (n, oobn int, err error)
```

WriteMsgIP writes a message to addr via c, copying the payload from b and the associated out-of-band data from oob. It returns the number of payload and out-of-band bytes written. 

The packages golang.org/x/net/ipv4 and golang.org/x/net/ipv6 can be used to manipulate IP-level socket options in oob. 

#### <a id="IPConn.readFrom" href="#IPConn.readFrom">func (c *IPConn) readFrom(b []byte) (int, *IPAddr, error)</a>

```
searchKey: net.IPConn.readFrom
```

```Go
func (c *IPConn) readFrom(b []byte) (int, *IPAddr, error)
```

#### <a id="IPConn.readMsg" href="#IPConn.readMsg">func (c *IPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)</a>

```
searchKey: net.IPConn.readMsg
```

```Go
func (c *IPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *IPAddr, err error)
```

#### <a id="IPConn.writeTo" href="#IPConn.writeTo">func (c *IPConn) writeTo(b []byte, addr *IPAddr) (int, error)</a>

```
searchKey: net.IPConn.writeTo
```

```Go
func (c *IPConn) writeTo(b []byte, addr *IPAddr) (int, error)
```

#### <a id="IPConn.writeMsg" href="#IPConn.writeMsg">func (c *IPConn) writeMsg(b, oob []byte, addr *IPAddr) (n, oobn int, err error)</a>

```
searchKey: net.IPConn.writeMsg
```

```Go
func (c *IPConn) writeMsg(b, oob []byte, addr *IPAddr) (n, oobn int, err error)
```

### <a id="ipStackCapabilities" href="#ipStackCapabilities">type ipStackCapabilities struct</a>

```
searchKey: net.ipStackCapabilities
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
```

```Go
func (p *ipStackCapabilities) probe()
```

probe probes IPv4, IPv6 and IPv4-mapped IPv6 communication capabilities which are controlled by the IPV6_V6ONLY socket option and kernel configuration. 

Should we try to use the IPv4 socket interface if we're only dealing with IPv4 sockets? As long as the host system understands IPv4-mapped IPv6, it's okay to pass IPv4-mapped IPv6 addresses to the IPv6 interface. That simplifies our code and is most general. Unfortunately, we need to run on kernels built without IPv6 support too. So probe the kernel to figure it out. 

### <a id="addrList" href="#addrList">type addrList []net.Addr</a>

```
searchKey: net.addrList
```

```Go
type addrList []Addr
```

An addrList represents a list of network endpoint addresses. 

#### <a id="filterAddrList" href="#filterAddrList">func filterAddrList(filter func(IPAddr) bool, ips []IPAddr, inetaddr func(IPAddr) Addr, originalAddr string) (addrList, error)</a>

```
searchKey: net.filterAddrList
```

```Go
func filterAddrList(filter func(IPAddr) bool, ips []IPAddr, inetaddr func(IPAddr) Addr, originalAddr string) (addrList, error)
```

filterAddrList applies a filter to a list of IP addresses, yielding a list of Addr objects. Known filters are nil, ipv4only, and ipv6only. It returns every address when the filter is nil. The result contains at least one address when error is nil. 

#### <a id="addrList.forResolve" href="#addrList.forResolve">func (addrs addrList) forResolve(network, addr string) Addr</a>

```
searchKey: net.addrList.forResolve
```

```Go
func (addrs addrList) forResolve(network, addr string) Addr
```

forResolve returns the most appropriate address in address for a call to ResolveTCPAddr, ResolveUDPAddr, or ResolveIPAddr. IPv4 is preferred, unless addr contains an IPv6 literal. 

#### <a id="addrList.first" href="#addrList.first">func (addrs addrList) first(strategy func(Addr) bool) Addr</a>

```
searchKey: net.addrList.first
```

```Go
func (addrs addrList) first(strategy func(Addr) bool) Addr
```

first returns the first address which satisfies strategy, or if none do, then the first address of any kind. 

#### <a id="addrList.partition" href="#addrList.partition">func (addrs addrList) partition(strategy func(Addr) bool) (primaries, fallbacks addrList)</a>

```
searchKey: net.addrList.partition
```

```Go
func (addrs addrList) partition(strategy func(Addr) bool) (primaries, fallbacks addrList)
```

partition divides an address list into two categories, using a strategy function to assign a boolean label to each address. The first address, and any with a matching label, are returned as primaries, while addresses with the opposite label are returned as fallbacks. For non-empty inputs, primaries is guaranteed to be non-empty. 

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: net.Resolver
tags: [exported]
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

#### <a id="Resolver.resolveAddrList" href="#Resolver.resolveAddrList">func (r *Resolver) resolveAddrList(ctx context.Context, op, network, addr string, hint Addr) (addrList, error)</a>

```
searchKey: net.Resolver.resolveAddrList
```

```Go
func (r *Resolver) resolveAddrList(ctx context.Context, op, network, addr string, hint Addr) (addrList, error)
```

resolveAddrList resolves addr using hint and returns a list of addresses. The result contains at least one address when error is nil. 

#### <a id="Resolver.exchange" href="#Resolver.exchange">func (r *Resolver) exchange(ctx context.Context, server string, q dnsmessage.Question, timeout time.Duration, useTCP bool) (dnsmessage.Parser, dnsmessage.Header, error)</a>

```
searchKey: net.Resolver.exchange
```

```Go
func (r *Resolver) exchange(ctx context.Context, server string, q dnsmessage.Question, timeout time.Duration, useTCP bool) (dnsmessage.Parser, dnsmessage.Header, error)
```

exchange sends a query on the connection and hopes for a response. 

#### <a id="Resolver.tryOneName" href="#Resolver.tryOneName">func (r *Resolver) tryOneName(ctx context.Context, cfg *dnsConfig, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)</a>

```
searchKey: net.Resolver.tryOneName
```

```Go
func (r *Resolver) tryOneName(ctx context.Context, cfg *dnsConfig, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)
```

Do a lookup for a single name, which must be rooted (otherwise answer will not find the answers). 

#### <a id="Resolver.lookup" href="#Resolver.lookup">func (r *Resolver) lookup(ctx context.Context, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)</a>

```
searchKey: net.Resolver.lookup
```

```Go
func (r *Resolver) lookup(ctx context.Context, name string, qtype dnsmessage.Type) (dnsmessage.Parser, string, error)
```

#### <a id="Resolver.goLookupHost" href="#Resolver.goLookupHost">func (r *Resolver) goLookupHost(ctx context.Context, name string) (addrs []string, err error)</a>

```
searchKey: net.Resolver.goLookupHost
```

```Go
func (r *Resolver) goLookupHost(ctx context.Context, name string) (addrs []string, err error)
```

goLookupHost is the native Go implementation of LookupHost. Used only if cgoLookupHost refuses to handle the request (that is, only if cgoLookupHost is the stub in cgo_stub.go). Normally we let cgo use the C library resolver instead of depending on our lookup code, so that Go and C get the same answers. 

#### <a id="Resolver.goLookupHostOrder" href="#Resolver.goLookupHostOrder">func (r *Resolver) goLookupHostOrder(ctx context.Context, name string, order hostLookupOrder) (addrs []string, err error)</a>

```
searchKey: net.Resolver.goLookupHostOrder
```

```Go
func (r *Resolver) goLookupHostOrder(ctx context.Context, name string, order hostLookupOrder) (addrs []string, err error)
```

#### <a id="Resolver.goLookupIP" href="#Resolver.goLookupIP">func (r *Resolver) goLookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)</a>

```
searchKey: net.Resolver.goLookupIP
```

```Go
func (r *Resolver) goLookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)
```

goLookupIP is the native Go implementation of LookupIP. The libc versions are in cgo_*.go. 

#### <a id="Resolver.goLookupIPCNAMEOrder" href="#Resolver.goLookupIPCNAMEOrder">func (r *Resolver) goLookupIPCNAMEOrder(ctx context.Context, network, name string, order hostLookupOrder) (addrs []IPAddr, cname dnsmessage.Name, err error)</a>

```
searchKey: net.Resolver.goLookupIPCNAMEOrder
```

```Go
func (r *Resolver) goLookupIPCNAMEOrder(ctx context.Context, network, name string, order hostLookupOrder) (addrs []IPAddr, cname dnsmessage.Name, err error)
```

#### <a id="Resolver.goLookupCNAME" href="#Resolver.goLookupCNAME">func (r *Resolver) goLookupCNAME(ctx context.Context, host string) (string, error)</a>

```
searchKey: net.Resolver.goLookupCNAME
```

```Go
func (r *Resolver) goLookupCNAME(ctx context.Context, host string) (string, error)
```

goLookupCNAME is the native Go (non-cgo) implementation of LookupCNAME. 

#### <a id="Resolver.goLookupPTR" href="#Resolver.goLookupPTR">func (r *Resolver) goLookupPTR(ctx context.Context, addr string) ([]string, error)</a>

```
searchKey: net.Resolver.goLookupPTR
```

```Go
func (r *Resolver) goLookupPTR(ctx context.Context, addr string) ([]string, error)
```

goLookupPTR is the native Go implementation of LookupAddr. Used only if cgoLookupPTR refuses to handle the request (that is, only if cgoLookupPTR is the stub in cgo_stub.go). Normally we let cgo use the C library resolver instead of depending on our lookup code, so that Go and C get the same answers. 

#### <a id="Resolver.internetAddrList" href="#Resolver.internetAddrList">func (r *Resolver) internetAddrList(ctx context.Context, net, addr string) (addrList, error)</a>

```
searchKey: net.Resolver.internetAddrList
```

```Go
func (r *Resolver) internetAddrList(ctx context.Context, net, addr string) (addrList, error)
```

internetAddrList resolves addr, which may be a literal IP address or a DNS name, and returns a list of internet protocol family addresses. The result contains at least one address when error is nil. 

#### <a id="Resolver.preferGo" href="#Resolver.preferGo">func (r *Resolver) preferGo() bool</a>

```
searchKey: net.Resolver.preferGo
```

```Go
func (r *Resolver) preferGo() bool
```

#### <a id="Resolver.strictErrors" href="#Resolver.strictErrors">func (r *Resolver) strictErrors() bool</a>

```
searchKey: net.Resolver.strictErrors
```

```Go
func (r *Resolver) strictErrors() bool
```

#### <a id="Resolver.getLookupGroup" href="#Resolver.getLookupGroup">func (r *Resolver) getLookupGroup() *singleflight.Group</a>

```
searchKey: net.Resolver.getLookupGroup
```

```Go
func (r *Resolver) getLookupGroup() *singleflight.Group
```

#### <a id="Resolver.LookupHost" href="#Resolver.LookupHost">func (r *Resolver) LookupHost(ctx context.Context, host string) (addrs []string, err error)</a>

```
searchKey: net.Resolver.LookupHost
tags: [exported]
```

```Go
func (r *Resolver) LookupHost(ctx context.Context, host string) (addrs []string, err error)
```

LookupHost looks up the given host using the local resolver. It returns a slice of that host's addresses. 

#### <a id="Resolver.LookupIPAddr" href="#Resolver.LookupIPAddr">func (r *Resolver) LookupIPAddr(ctx context.Context, host string) ([]IPAddr, error)</a>

```
searchKey: net.Resolver.LookupIPAddr
tags: [exported]
```

```Go
func (r *Resolver) LookupIPAddr(ctx context.Context, host string) ([]IPAddr, error)
```

LookupIPAddr looks up host using the local resolver. It returns a slice of that host's IPv4 and IPv6 addresses. 

#### <a id="Resolver.LookupIP" href="#Resolver.LookupIP">func (r *Resolver) LookupIP(ctx context.Context, network, host string) ([]IP, error)</a>

```
searchKey: net.Resolver.LookupIP
tags: [exported]
```

```Go
func (r *Resolver) LookupIP(ctx context.Context, network, host string) ([]IP, error)
```

LookupIP looks up host for the given network using the local resolver. It returns a slice of that host's IP addresses of the type specified by network. network must be one of "ip", "ip4" or "ip6". 

#### <a id="Resolver.lookupIPAddr" href="#Resolver.lookupIPAddr">func (r *Resolver) lookupIPAddr(ctx context.Context, network, host string) ([]IPAddr, error)</a>

```
searchKey: net.Resolver.lookupIPAddr
```

```Go
func (r *Resolver) lookupIPAddr(ctx context.Context, network, host string) ([]IPAddr, error)
```

lookupIPAddr looks up host using the local resolver and particular network. It returns a slice of that host's IPv4 and IPv6 addresses. 

#### <a id="Resolver.LookupPort" href="#Resolver.LookupPort">func (r *Resolver) LookupPort(ctx context.Context, network, service string) (port int, err error)</a>

```
searchKey: net.Resolver.LookupPort
tags: [exported]
```

```Go
func (r *Resolver) LookupPort(ctx context.Context, network, service string) (port int, err error)
```

LookupPort looks up the port for the given network and service. 

#### <a id="Resolver.LookupCNAME" href="#Resolver.LookupCNAME">func (r *Resolver) LookupCNAME(ctx context.Context, host string) (string, error)</a>

```
searchKey: net.Resolver.LookupCNAME
tags: [exported]
```

```Go
func (r *Resolver) LookupCNAME(ctx context.Context, host string) (string, error)
```

LookupCNAME returns the canonical name for the given host. Callers that do not care about the canonical name can call LookupHost or LookupIP directly; both take care of resolving the canonical name as part of the lookup. 

A canonical name is the final name after following zero or more CNAME records. LookupCNAME does not return an error if host does not contain DNS "CNAME" records, as long as host resolves to address records. 

The returned canonical name is validated to be a properly formatted presentation-format domain name. 

#### <a id="Resolver.LookupSRV" href="#Resolver.LookupSRV">func (r *Resolver) LookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)</a>

```
searchKey: net.Resolver.LookupSRV
tags: [exported]
```

```Go
func (r *Resolver) LookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)
```

LookupSRV tries to resolve an SRV query of the given service, protocol, and domain name. The proto is "tcp" or "udp". The returned records are sorted by priority and randomized by weight within a priority. 

LookupSRV constructs the DNS name to look up following RFC 2782. That is, it looks up _service._proto.name. To accommodate services publishing SRV records under non-standard names, if both service and proto are empty strings, LookupSRV looks up name directly. 

The returned service names are validated to be properly formatted presentation-format domain names. 

#### <a id="Resolver.LookupMX" href="#Resolver.LookupMX">func (r *Resolver) LookupMX(ctx context.Context, name string) ([]*MX, error)</a>

```
searchKey: net.Resolver.LookupMX
tags: [exported]
```

```Go
func (r *Resolver) LookupMX(ctx context.Context, name string) ([]*MX, error)
```

LookupMX returns the DNS MX records for the given domain name sorted by preference. 

The returned mail server names are validated to be properly formatted presentation-format domain names. 

#### <a id="Resolver.LookupNS" href="#Resolver.LookupNS">func (r *Resolver) LookupNS(ctx context.Context, name string) ([]*NS, error)</a>

```
searchKey: net.Resolver.LookupNS
tags: [exported]
```

```Go
func (r *Resolver) LookupNS(ctx context.Context, name string) ([]*NS, error)
```

LookupNS returns the DNS NS records for the given domain name. 

The returned name server names are validated to be properly formatted presentation-format domain names. 

#### <a id="Resolver.LookupTXT" href="#Resolver.LookupTXT">func (r *Resolver) LookupTXT(ctx context.Context, name string) ([]string, error)</a>

```
searchKey: net.Resolver.LookupTXT
tags: [exported]
```

```Go
func (r *Resolver) LookupTXT(ctx context.Context, name string) ([]string, error)
```

LookupTXT returns the DNS TXT records for the given domain name. 

#### <a id="Resolver.LookupAddr" href="#Resolver.LookupAddr">func (r *Resolver) LookupAddr(ctx context.Context, addr string) ([]string, error)</a>

```
searchKey: net.Resolver.LookupAddr
tags: [exported]
```

```Go
func (r *Resolver) LookupAddr(ctx context.Context, addr string) ([]string, error)
```

LookupAddr performs a reverse lookup for the given address, returning a list of names mapping to that address. 

The returned names are validated to be properly formatted presentation-format domain names. 

#### <a id="Resolver.dial" href="#Resolver.dial">func (r *Resolver) dial(ctx context.Context, network, server string) (Conn, error)</a>

```
searchKey: net.Resolver.dial
```

```Go
func (r *Resolver) dial(ctx context.Context, network, server string) (Conn, error)
```

#### <a id="Resolver.lookupHost" href="#Resolver.lookupHost">func (r *Resolver) lookupHost(ctx context.Context, host string) (addrs []string, err error)</a>

```
searchKey: net.Resolver.lookupHost
```

```Go
func (r *Resolver) lookupHost(ctx context.Context, host string) (addrs []string, err error)
```

#### <a id="Resolver.lookupIP" href="#Resolver.lookupIP">func (r *Resolver) lookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)</a>

```
searchKey: net.Resolver.lookupIP
```

```Go
func (r *Resolver) lookupIP(ctx context.Context, network, host string) (addrs []IPAddr, err error)
```

#### <a id="Resolver.lookupPort" href="#Resolver.lookupPort">func (r *Resolver) lookupPort(ctx context.Context, network, service string) (int, error)</a>

```
searchKey: net.Resolver.lookupPort
```

```Go
func (r *Resolver) lookupPort(ctx context.Context, network, service string) (int, error)
```

#### <a id="Resolver.lookupCNAME" href="#Resolver.lookupCNAME">func (r *Resolver) lookupCNAME(ctx context.Context, name string) (string, error)</a>

```
searchKey: net.Resolver.lookupCNAME
```

```Go
func (r *Resolver) lookupCNAME(ctx context.Context, name string) (string, error)
```

#### <a id="Resolver.lookupSRV" href="#Resolver.lookupSRV">func (r *Resolver) lookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)</a>

```
searchKey: net.Resolver.lookupSRV
```

```Go
func (r *Resolver) lookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error)
```

#### <a id="Resolver.lookupMX" href="#Resolver.lookupMX">func (r *Resolver) lookupMX(ctx context.Context, name string) ([]*MX, error)</a>

```
searchKey: net.Resolver.lookupMX
```

```Go
func (r *Resolver) lookupMX(ctx context.Context, name string) ([]*MX, error)
```

#### <a id="Resolver.lookupNS" href="#Resolver.lookupNS">func (r *Resolver) lookupNS(ctx context.Context, name string) ([]*NS, error)</a>

```
searchKey: net.Resolver.lookupNS
```

```Go
func (r *Resolver) lookupNS(ctx context.Context, name string) ([]*NS, error)
```

#### <a id="Resolver.lookupTXT" href="#Resolver.lookupTXT">func (r *Resolver) lookupTXT(ctx context.Context, name string) ([]string, error)</a>

```
searchKey: net.Resolver.lookupTXT
```

```Go
func (r *Resolver) lookupTXT(ctx context.Context, name string) ([]string, error)
```

#### <a id="Resolver.lookupAddr" href="#Resolver.lookupAddr">func (r *Resolver) lookupAddr(ctx context.Context, addr string) ([]string, error)</a>

```
searchKey: net.Resolver.lookupAddr
```

```Go
func (r *Resolver) lookupAddr(ctx context.Context, addr string) ([]string, error)
```

### <a id="onlyValuesCtx" href="#onlyValuesCtx">type onlyValuesCtx struct</a>

```
searchKey: net.onlyValuesCtx
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
```

```Go
func (ovc *onlyValuesCtx) Value(key interface{}) interface{}
```

Value performs a lookup if the original context hasn't expired. 

### <a id="HardwareAddr" href="#HardwareAddr">type HardwareAddr []byte</a>

```
searchKey: net.HardwareAddr
tags: [exported]
```

```Go
type HardwareAddr []byte
```

A HardwareAddr represents a physical hardware address. 

#### <a id="ParseMAC" href="#ParseMAC">func ParseMAC(s string) (hw HardwareAddr, err error)</a>

```
searchKey: net.ParseMAC
tags: [exported]
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
tags: [exported]
```

```Go
func (a HardwareAddr) String() string
```

### <a id="Addr" href="#Addr">type Addr interface</a>

```
searchKey: net.Addr
tags: [exported]
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
```

```Go
func sockaddrToIP(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToTCP" href="#sockaddrToTCP">func sockaddrToTCP(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToTCP
```

```Go
func sockaddrToTCP(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToUDP" href="#sockaddrToUDP">func sockaddrToUDP(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToUDP
```

```Go
func sockaddrToUDP(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToUnix" href="#sockaddrToUnix">func sockaddrToUnix(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToUnix
```

```Go
func sockaddrToUnix(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToUnixgram" href="#sockaddrToUnixgram">func sockaddrToUnixgram(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToUnixgram
```

```Go
func sockaddrToUnixgram(sa syscall.Sockaddr) Addr
```

#### <a id="sockaddrToUnixpacket" href="#sockaddrToUnixpacket">func sockaddrToUnixpacket(sa syscall.Sockaddr) Addr</a>

```
searchKey: net.sockaddrToUnixpacket
```

```Go
func sockaddrToUnixpacket(sa syscall.Sockaddr) Addr
```

### <a id="Conn" href="#Conn">type Conn interface</a>

```
searchKey: net.Conn
tags: [exported]
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
tags: [exported]
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
tags: [exported]
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
tags: [exported]
```

```Go
func FileConn(f *os.File) (c Conn, err error)
```

FileConn returns a copy of the network connection corresponding to the open file f. It is the caller's responsibility to close f when finished. Closing c does not affect f, and closing f does not affect c. 

#### <a id="fileConn" href="#fileConn">func fileConn(f *os.File) (Conn, error)</a>

```
searchKey: net.fileConn
```

```Go
func fileConn(f *os.File) (Conn, error)
```

#### <a id="Pipe" href="#Pipe">func Pipe() (Conn, Conn)</a>

```
searchKey: net.Pipe
tags: [exported]
```

```Go
func Pipe() (Conn, Conn)
```

Pipe creates a synchronous, in-memory, full duplex network connection; both ends implement the Conn interface. Reads on one end are matched with writes on the other, copying data directly between the two; there is no internal buffering. 

### <a id="conn" href="#conn">type conn struct</a>

```
searchKey: net.conn
```

```Go
type conn struct {
	fd *netFD
}
```

#### <a id="conn.ok" href="#conn.ok">func (c *conn) ok() bool</a>

```
searchKey: net.conn.ok
```

```Go
func (c *conn) ok() bool
```

#### <a id="conn.Read" href="#conn.Read">func (c *conn) Read(b []byte) (int, error)</a>

```
searchKey: net.conn.Read
```

```Go
func (c *conn) Read(b []byte) (int, error)
```

Read implements the Conn Read method. 

#### <a id="conn.Write" href="#conn.Write">func (c *conn) Write(b []byte) (int, error)</a>

```
searchKey: net.conn.Write
```

```Go
func (c *conn) Write(b []byte) (int, error)
```

Write implements the Conn Write method. 

#### <a id="conn.Close" href="#conn.Close">func (c *conn) Close() error</a>

```
searchKey: net.conn.Close
```

```Go
func (c *conn) Close() error
```

Close closes the connection. 

#### <a id="conn.LocalAddr" href="#conn.LocalAddr">func (c *conn) LocalAddr() Addr</a>

```
searchKey: net.conn.LocalAddr
```

```Go
func (c *conn) LocalAddr() Addr
```

LocalAddr returns the local network address. The Addr returned is shared by all invocations of LocalAddr, so do not modify it. 

#### <a id="conn.RemoteAddr" href="#conn.RemoteAddr">func (c *conn) RemoteAddr() Addr</a>

```
searchKey: net.conn.RemoteAddr
```

```Go
func (c *conn) RemoteAddr() Addr
```

RemoteAddr returns the remote network address. The Addr returned is shared by all invocations of RemoteAddr, so do not modify it. 

#### <a id="conn.SetDeadline" href="#conn.SetDeadline">func (c *conn) SetDeadline(t time.Time) error</a>

```
searchKey: net.conn.SetDeadline
```

```Go
func (c *conn) SetDeadline(t time.Time) error
```

SetDeadline implements the Conn SetDeadline method. 

#### <a id="conn.SetReadDeadline" href="#conn.SetReadDeadline">func (c *conn) SetReadDeadline(t time.Time) error</a>

```
searchKey: net.conn.SetReadDeadline
```

```Go
func (c *conn) SetReadDeadline(t time.Time) error
```

SetReadDeadline implements the Conn SetReadDeadline method. 

#### <a id="conn.SetWriteDeadline" href="#conn.SetWriteDeadline">func (c *conn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: net.conn.SetWriteDeadline
```

```Go
func (c *conn) SetWriteDeadline(t time.Time) error
```

SetWriteDeadline implements the Conn SetWriteDeadline method. 

#### <a id="conn.SetReadBuffer" href="#conn.SetReadBuffer">func (c *conn) SetReadBuffer(bytes int) error</a>

```
searchKey: net.conn.SetReadBuffer
```

```Go
func (c *conn) SetReadBuffer(bytes int) error
```

SetReadBuffer sets the size of the operating system's receive buffer associated with the connection. 

#### <a id="conn.SetWriteBuffer" href="#conn.SetWriteBuffer">func (c *conn) SetWriteBuffer(bytes int) error</a>

```
searchKey: net.conn.SetWriteBuffer
```

```Go
func (c *conn) SetWriteBuffer(bytes int) error
```

SetWriteBuffer sets the size of the operating system's transmit buffer associated with the connection. 

#### <a id="conn.File" href="#conn.File">func (c *conn) File() (f *os.File, err error)</a>

```
searchKey: net.conn.File
```

```Go
func (c *conn) File() (f *os.File, err error)
```

File returns a copy of the underlying os.File. It is the caller's responsibility to close f when finished. Closing c does not affect f, and closing f does not affect c. 

The returned os.File's file descriptor is different from the connection's. Attempting to change properties of the original using this duplicate may or may not have the desired effect. 

#### <a id="conn.writeBuffers" href="#conn.writeBuffers">func (c *conn) writeBuffers(v *Buffers) (int64, error)</a>

```
searchKey: net.conn.writeBuffers
```

```Go
func (c *conn) writeBuffers(v *Buffers) (int64, error)
```

### <a id="PacketConn" href="#PacketConn">type PacketConn interface</a>

```
searchKey: net.PacketConn
tags: [exported]
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

#### <a id="ListenPacket" href="#ListenPacket">func ListenPacket(network, address string) (PacketConn, error)</a>

```
searchKey: net.ListenPacket
tags: [exported]
```

```Go
func ListenPacket(network, address string) (PacketConn, error)
```

ListenPacket announces on the local network address. 

The network must be "udp", "udp4", "udp6", "unixgram", or an IP transport. The IP transports are "ip", "ip4", or "ip6" followed by a colon and a literal protocol number or a protocol name, as in "ip:1" or "ip:icmp". 

For UDP and IP networks, if the host in the address parameter is empty or a literal unspecified IP address, ListenPacket listens on all available IP addresses of the local system except multicast IP addresses. To only use IPv4, use network "udp4" or "ip4:proto". The address can use a host name, but this is not recommended, because it will create a listener for at most one of the host's IP addresses. If the port in the address parameter is empty or "0", as in "127.0.0.1:" or "[::1]:0", a port number is automatically chosen. The LocalAddr method of PacketConn can be used to discover the chosen port. 

See func Dial for a description of the network and address parameters. 

ListenPacket uses context.Background internally; to specify the context, use ListenConfig.ListenPacket. 

#### <a id="FilePacketConn" href="#FilePacketConn">func FilePacketConn(f *os.File) (c PacketConn, err error)</a>

```
searchKey: net.FilePacketConn
tags: [exported]
```

```Go
func FilePacketConn(f *os.File) (c PacketConn, err error)
```

FilePacketConn returns a copy of the packet network connection corresponding to the open file f. It is the caller's responsibility to close f when finished. Closing c does not affect f, and closing f does not affect c. 

#### <a id="filePacketConn" href="#filePacketConn">func filePacketConn(f *os.File) (PacketConn, error)</a>

```
searchKey: net.filePacketConn
```

```Go
func filePacketConn(f *os.File) (PacketConn, error)
```

#### <a id="newLocalPacketListener" href="#newLocalPacketListener">func newLocalPacketListener(network string) (PacketConn, error)</a>

```
searchKey: net.newLocalPacketListener
```

```Go
func newLocalPacketListener(network string) (PacketConn, error)
```

### <a id="Listener" href="#Listener">type Listener interface</a>

```
searchKey: net.Listener
tags: [exported]
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

#### <a id="Listen" href="#Listen">func Listen(network, address string) (Listener, error)</a>

```
searchKey: net.Listen
tags: [exported]
```

```Go
func Listen(network, address string) (Listener, error)
```

Listen announces on the local network address. 

The network must be "tcp", "tcp4", "tcp6", "unix" or "unixpacket". 

For TCP networks, if the host in the address parameter is empty or a literal unspecified IP address, Listen listens on all available unicast and anycast IP addresses of the local system. To only use IPv4, use network "tcp4". The address can use a host name, but this is not recommended, because it will create a listener for at most one of the host's IP addresses. If the port in the address parameter is empty or "0", as in "127.0.0.1:" or "[::1]:0", a port number is automatically chosen. The Addr method of Listener can be used to discover the chosen port. 

See func Dial for a description of the network and address parameters. 

Listen uses context.Background internally; to specify the context, use ListenConfig.Listen. 

#### <a id="FileListener" href="#FileListener">func FileListener(f *os.File) (ln Listener, err error)</a>

```
searchKey: net.FileListener
tags: [exported]
```

```Go
func FileListener(f *os.File) (ln Listener, err error)
```

FileListener returns a copy of the network listener corresponding to the open file f. It is the caller's responsibility to close ln when finished. Closing ln does not affect f, and closing f does not affect ln. 

#### <a id="fileListener" href="#fileListener">func fileListener(f *os.File) (Listener, error)</a>

```
searchKey: net.fileListener
```

```Go
func fileListener(f *os.File) (Listener, error)
```

#### <a id="newLocalListener" href="#newLocalListener">func newLocalListener(network string) (Listener, error)</a>

```
searchKey: net.newLocalListener
```

```Go
func newLocalListener(network string) (Listener, error)
```

### <a id="Error" href="#Error">type Error interface</a>

```
searchKey: net.Error
tags: [exported]
```

```Go
type Error interface {
	error
	Timeout() bool   // Is the error a timeout?
	Temporary() bool // Is the error temporary?
}
```

An Error represents a network error. 

### <a id="OpError" href="#OpError">type OpError struct</a>

```
searchKey: net.OpError
tags: [exported]
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

#### <a id="OpError.Unwrap" href="#OpError.Unwrap">func (e *OpError) Unwrap() error</a>

```
searchKey: net.OpError.Unwrap
tags: [exported]
```

```Go
func (e *OpError) Unwrap() error
```

#### <a id="OpError.Error" href="#OpError.Error">func (e *OpError) Error() string</a>

```
searchKey: net.OpError.Error
tags: [exported]
```

```Go
func (e *OpError) Error() string
```

#### <a id="OpError.Timeout" href="#OpError.Timeout">func (e *OpError) Timeout() bool</a>

```
searchKey: net.OpError.Timeout
tags: [exported]
```

```Go
func (e *OpError) Timeout() bool
```

#### <a id="OpError.Temporary" href="#OpError.Temporary">func (e *OpError) Temporary() bool</a>

```
searchKey: net.OpError.Temporary
tags: [exported]
```

```Go
func (e *OpError) Temporary() bool
```

#### <a id="OpError.isValid" href="#OpError.isValid">func (e *OpError) isValid() error</a>

```
searchKey: net.OpError.isValid
```

```Go
func (e *OpError) isValid() error
```

### <a id="timeout" href="#timeout">type timeout interface</a>

```
searchKey: net.timeout
```

```Go
type timeout interface {
	Timeout() bool
}
```

### <a id="temporary" href="#temporary">type temporary interface</a>

```
searchKey: net.temporary
```

```Go
type temporary interface {
	Temporary() bool
}
```

### <a id="ParseError" href="#ParseError">type ParseError struct</a>

```
searchKey: net.ParseError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *ParseError) Error() string
```

#### <a id="ParseError.Timeout" href="#ParseError.Timeout">func (e *ParseError) Timeout() bool</a>

```
searchKey: net.ParseError.Timeout
tags: [exported]
```

```Go
func (e *ParseError) Timeout() bool
```

#### <a id="ParseError.Temporary" href="#ParseError.Temporary">func (e *ParseError) Temporary() bool</a>

```
searchKey: net.ParseError.Temporary
tags: [exported]
```

```Go
func (e *ParseError) Temporary() bool
```

### <a id="AddrError" href="#AddrError">type AddrError struct</a>

```
searchKey: net.AddrError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *AddrError) Error() string
```

#### <a id="AddrError.Timeout" href="#AddrError.Timeout">func (e *AddrError) Timeout() bool</a>

```
searchKey: net.AddrError.Timeout
tags: [exported]
```

```Go
func (e *AddrError) Timeout() bool
```

#### <a id="AddrError.Temporary" href="#AddrError.Temporary">func (e *AddrError) Temporary() bool</a>

```
searchKey: net.AddrError.Temporary
tags: [exported]
```

```Go
func (e *AddrError) Temporary() bool
```

### <a id="UnknownNetworkError" href="#UnknownNetworkError">type UnknownNetworkError string</a>

```
searchKey: net.UnknownNetworkError
tags: [exported]
```

```Go
type UnknownNetworkError string
```

#### <a id="UnknownNetworkError.Error" href="#UnknownNetworkError.Error">func (e UnknownNetworkError) Error() string</a>

```
searchKey: net.UnknownNetworkError.Error
tags: [exported]
```

```Go
func (e UnknownNetworkError) Error() string
```

#### <a id="UnknownNetworkError.Timeout" href="#UnknownNetworkError.Timeout">func (e UnknownNetworkError) Timeout() bool</a>

```
searchKey: net.UnknownNetworkError.Timeout
tags: [exported]
```

```Go
func (e UnknownNetworkError) Timeout() bool
```

#### <a id="UnknownNetworkError.Temporary" href="#UnknownNetworkError.Temporary">func (e UnknownNetworkError) Temporary() bool</a>

```
searchKey: net.UnknownNetworkError.Temporary
tags: [exported]
```

```Go
func (e UnknownNetworkError) Temporary() bool
```

### <a id="InvalidAddrError" href="#InvalidAddrError">type InvalidAddrError string</a>

```
searchKey: net.InvalidAddrError
tags: [exported]
```

```Go
type InvalidAddrError string
```

#### <a id="InvalidAddrError.Error" href="#InvalidAddrError.Error">func (e InvalidAddrError) Error() string</a>

```
searchKey: net.InvalidAddrError.Error
tags: [exported]
```

```Go
func (e InvalidAddrError) Error() string
```

#### <a id="InvalidAddrError.Timeout" href="#InvalidAddrError.Timeout">func (e InvalidAddrError) Timeout() bool</a>

```
searchKey: net.InvalidAddrError.Timeout
tags: [exported]
```

```Go
func (e InvalidAddrError) Timeout() bool
```

#### <a id="InvalidAddrError.Temporary" href="#InvalidAddrError.Temporary">func (e InvalidAddrError) Temporary() bool</a>

```
searchKey: net.InvalidAddrError.Temporary
tags: [exported]
```

```Go
func (e InvalidAddrError) Temporary() bool
```

### <a id="timeoutError" href="#timeoutError">type timeoutError struct{}</a>

```
searchKey: net.timeoutError
```

```Go
type timeoutError struct{}
```

#### <a id="timeoutError.Error" href="#timeoutError.Error">func (e *timeoutError) Error() string</a>

```
searchKey: net.timeoutError.Error
```

```Go
func (e *timeoutError) Error() string
```

#### <a id="timeoutError.Timeout" href="#timeoutError.Timeout">func (e *timeoutError) Timeout() bool</a>

```
searchKey: net.timeoutError.Timeout
```

```Go
func (e *timeoutError) Timeout() bool
```

#### <a id="timeoutError.Temporary" href="#timeoutError.Temporary">func (e *timeoutError) Temporary() bool</a>

```
searchKey: net.timeoutError.Temporary
```

```Go
func (e *timeoutError) Temporary() bool
```

### <a id="DNSConfigError" href="#DNSConfigError">type DNSConfigError struct</a>

```
searchKey: net.DNSConfigError
tags: [exported]
```

```Go
type DNSConfigError struct {
	Err error
}
```

DNSConfigError represents an error reading the machine's DNS configuration. (No longer used; kept for compatibility.) 

#### <a id="DNSConfigError.Unwrap" href="#DNSConfigError.Unwrap">func (e *DNSConfigError) Unwrap() error</a>

```
searchKey: net.DNSConfigError.Unwrap
tags: [exported]
```

```Go
func (e *DNSConfigError) Unwrap() error
```

#### <a id="DNSConfigError.Error" href="#DNSConfigError.Error">func (e *DNSConfigError) Error() string</a>

```
searchKey: net.DNSConfigError.Error
tags: [exported]
```

```Go
func (e *DNSConfigError) Error() string
```

#### <a id="DNSConfigError.Timeout" href="#DNSConfigError.Timeout">func (e *DNSConfigError) Timeout() bool</a>

```
searchKey: net.DNSConfigError.Timeout
tags: [exported]
```

```Go
func (e *DNSConfigError) Timeout() bool
```

#### <a id="DNSConfigError.Temporary" href="#DNSConfigError.Temporary">func (e *DNSConfigError) Temporary() bool</a>

```
searchKey: net.DNSConfigError.Temporary
tags: [exported]
```

```Go
func (e *DNSConfigError) Temporary() bool
```

### <a id="DNSError" href="#DNSError">type DNSError struct</a>

```
searchKey: net.DNSError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *DNSError) Error() string
```

#### <a id="DNSError.Timeout" href="#DNSError.Timeout">func (e *DNSError) Timeout() bool</a>

```
searchKey: net.DNSError.Timeout
tags: [exported]
```

```Go
func (e *DNSError) Timeout() bool
```

Timeout reports whether the DNS lookup is known to have timed out. This is not always known; a DNS lookup may fail due to a timeout and return a DNSError for which Timeout returns false. 

#### <a id="DNSError.Temporary" href="#DNSError.Temporary">func (e *DNSError) Temporary() bool</a>

```
searchKey: net.DNSError.Temporary
tags: [exported]
```

```Go
func (e *DNSError) Temporary() bool
```

Temporary reports whether the DNS error is known to be temporary. This is not always known; a DNS lookup may fail due to a temporary error and return a DNSError for which Temporary returns false. 

### <a id="writerOnly" href="#writerOnly">type writerOnly struct</a>

```
searchKey: net.writerOnly
```

```Go
type writerOnly struct {
	io.Writer
}
```

### <a id="buffersWriter" href="#buffersWriter">type buffersWriter interface</a>

```
searchKey: net.buffersWriter
```

```Go
type buffersWriter interface {
	writeBuffers(*Buffers) (int64, error)
}
```

buffersWriter is the interface implemented by Conns that support a "writev"-like batch write optimization. writeBuffers should fully consume and write all chunks from the provided Buffers, else it should report a non-nil error. 

### <a id="Buffers" href="#Buffers">type Buffers [][]byte</a>

```
searchKey: net.Buffers
tags: [exported]
```

```Go
type Buffers [][]byte
```

Buffers contains zero or more runs of bytes to write. 

On certain machines, for certain types of connections, this is optimized into an OS-specific batch write operation (such as "writev"). 

#### <a id="Buffers.WriteTo" href="#Buffers.WriteTo">func (v *Buffers) WriteTo(w io.Writer) (n int64, err error)</a>

```
searchKey: net.Buffers.WriteTo
tags: [exported]
```

```Go
func (v *Buffers) WriteTo(w io.Writer) (n int64, err error)
```

#### <a id="Buffers.Read" href="#Buffers.Read">func (v *Buffers) Read(p []byte) (n int, err error)</a>

```
searchKey: net.Buffers.Read
tags: [exported]
```

```Go
func (v *Buffers) Read(p []byte) (n int, err error)
```

#### <a id="Buffers.consume" href="#Buffers.consume">func (v *Buffers) consume(n int64)</a>

```
searchKey: net.Buffers.consume
```

```Go
func (v *Buffers) consume(n int64)
```

### <a id="nssConf" href="#nssConf">type nssConf struct</a>

```
searchKey: net.nssConf
```

```Go
type nssConf struct {
	err     error                  // any error encountered opening or parsing the file
	sources map[string][]nssSource // keyed by database (e.g. "hosts")
}
```

nssConf represents the state of the machine's /etc/nsswitch.conf file. 

#### <a id="parseNSSConfFile" href="#parseNSSConfFile">func parseNSSConfFile(file string) *nssConf</a>

```
searchKey: net.parseNSSConfFile
```

```Go
func parseNSSConfFile(file string) *nssConf
```

#### <a id="parseNSSConf" href="#parseNSSConf">func parseNSSConf(r io.Reader) *nssConf</a>

```
searchKey: net.parseNSSConf
```

```Go
func parseNSSConf(r io.Reader) *nssConf
```

#### <a id="nssStr" href="#nssStr">func nssStr(s string) *nssConf</a>

```
searchKey: net.nssStr
```

```Go
func nssStr(s string) *nssConf
```

### <a id="nssSource" href="#nssSource">type nssSource struct</a>

```
searchKey: net.nssSource
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
```

```Go
func (s nssSource) standardCriteria() bool
```

standardCriteria reports all specified criteria have the default status actions. 

### <a id="nssCriterion" href="#nssCriterion">type nssCriterion struct</a>

```
searchKey: net.nssCriterion
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
```

```Go
func (c nssCriterion) standardStatusAction(last bool) bool
```

standardStatusAction reports whether c is equivalent to not specifying the criterion at all. last is whether this criteria is the last in the list. 

### <a id="file" href="#file">type file struct</a>

```
searchKey: net.file
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
```

```Go
func open(name string) (*file, error)
```

#### <a id="file.close" href="#file.close">func (f *file) close()</a>

```
searchKey: net.file.close
```

```Go
func (f *file) close()
```

#### <a id="file.getLineFromData" href="#file.getLineFromData">func (f *file) getLineFromData() (s string, ok bool)</a>

```
searchKey: net.file.getLineFromData
```

```Go
func (f *file) getLineFromData() (s string, ok bool)
```

#### <a id="file.readLine" href="#file.readLine">func (f *file) readLine() (s string, ok bool)</a>

```
searchKey: net.file.readLine
```

```Go
func (f *file) readLine() (s string, ok bool)
```

### <a id="pipeDeadline" href="#pipeDeadline">type pipeDeadline struct</a>

```
searchKey: net.pipeDeadline
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
```

```Go
func makePipeDeadline() pipeDeadline
```

#### <a id="pipeDeadline.set" href="#pipeDeadline.set">func (d *pipeDeadline) set(t time.Time)</a>

```
searchKey: net.pipeDeadline.set
```

```Go
func (d *pipeDeadline) set(t time.Time)
```

set sets the point in time when the deadline will time out. A timeout event is signaled by closing the channel returned by waiter. Once a timeout has occurred, the deadline can be refreshed by specifying a t value in the future. 

A zero value for t prevents timeout. 

#### <a id="pipeDeadline.wait" href="#pipeDeadline.wait">func (d *pipeDeadline) wait() chan struct{}</a>

```
searchKey: net.pipeDeadline.wait
```

```Go
func (d *pipeDeadline) wait() chan struct{}
```

wait returns a channel that is closed when the deadline is exceeded. 

### <a id="pipeAddr" href="#pipeAddr">type pipeAddr struct{}</a>

```
searchKey: net.pipeAddr
```

```Go
type pipeAddr struct{}
```

#### <a id="pipeAddr.Network" href="#pipeAddr.Network">func (pipeAddr) Network() string</a>

```
searchKey: net.pipeAddr.Network
```

```Go
func (pipeAddr) Network() string
```

#### <a id="pipeAddr.String" href="#pipeAddr.String">func (pipeAddr) String() string</a>

```
searchKey: net.pipeAddr.String
```

```Go
func (pipeAddr) String() string
```

### <a id="pipe" href="#pipe">type pipe struct</a>

```
searchKey: net.pipe
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

#### <a id="pipe.LocalAddr" href="#pipe.LocalAddr">func (*pipe) LocalAddr() Addr</a>

```
searchKey: net.pipe.LocalAddr
```

```Go
func (*pipe) LocalAddr() Addr
```

#### <a id="pipe.RemoteAddr" href="#pipe.RemoteAddr">func (*pipe) RemoteAddr() Addr</a>

```
searchKey: net.pipe.RemoteAddr
```

```Go
func (*pipe) RemoteAddr() Addr
```

#### <a id="pipe.Read" href="#pipe.Read">func (p *pipe) Read(b []byte) (int, error)</a>

```
searchKey: net.pipe.Read
```

```Go
func (p *pipe) Read(b []byte) (int, error)
```

#### <a id="pipe.read" href="#pipe.read">func (p *pipe) read(b []byte) (n int, err error)</a>

```
searchKey: net.pipe.read
```

```Go
func (p *pipe) read(b []byte) (n int, err error)
```

#### <a id="pipe.Write" href="#pipe.Write">func (p *pipe) Write(b []byte) (int, error)</a>

```
searchKey: net.pipe.Write
```

```Go
func (p *pipe) Write(b []byte) (int, error)
```

#### <a id="pipe.write" href="#pipe.write">func (p *pipe) write(b []byte) (n int, err error)</a>

```
searchKey: net.pipe.write
```

```Go
func (p *pipe) write(b []byte) (n int, err error)
```

#### <a id="pipe.SetDeadline" href="#pipe.SetDeadline">func (p *pipe) SetDeadline(t time.Time) error</a>

```
searchKey: net.pipe.SetDeadline
```

```Go
func (p *pipe) SetDeadline(t time.Time) error
```

#### <a id="pipe.SetReadDeadline" href="#pipe.SetReadDeadline">func (p *pipe) SetReadDeadline(t time.Time) error</a>

```
searchKey: net.pipe.SetReadDeadline
```

```Go
func (p *pipe) SetReadDeadline(t time.Time) error
```

#### <a id="pipe.SetWriteDeadline" href="#pipe.SetWriteDeadline">func (p *pipe) SetWriteDeadline(t time.Time) error</a>

```
searchKey: net.pipe.SetWriteDeadline
```

```Go
func (p *pipe) SetWriteDeadline(t time.Time) error
```

#### <a id="pipe.Close" href="#pipe.Close">func (p *pipe) Close() error</a>

```
searchKey: net.pipe.Close
```

```Go
func (p *pipe) Close() error
```

### <a id="rawConn" href="#rawConn">type rawConn struct</a>

```
searchKey: net.rawConn
```

```Go
type rawConn struct {
	fd *netFD
}
```

#### <a id="newRawConn" href="#newRawConn">func newRawConn(fd *netFD) (*rawConn, error)</a>

```
searchKey: net.newRawConn
```

```Go
func newRawConn(fd *netFD) (*rawConn, error)
```

#### <a id="rawConn.ok" href="#rawConn.ok">func (c *rawConn) ok() bool</a>

```
searchKey: net.rawConn.ok
```

```Go
func (c *rawConn) ok() bool
```

#### <a id="rawConn.Control" href="#rawConn.Control">func (c *rawConn) Control(f func(uintptr)) error</a>

```
searchKey: net.rawConn.Control
```

```Go
func (c *rawConn) Control(f func(uintptr)) error
```

#### <a id="rawConn.Read" href="#rawConn.Read">func (c *rawConn) Read(f func(uintptr) bool) error</a>

```
searchKey: net.rawConn.Read
```

```Go
func (c *rawConn) Read(f func(uintptr) bool) error
```

#### <a id="rawConn.Write" href="#rawConn.Write">func (c *rawConn) Write(f func(uintptr) bool) error</a>

```
searchKey: net.rawConn.Write
```

```Go
func (c *rawConn) Write(f func(uintptr) bool) error
```

### <a id="rawListener" href="#rawListener">type rawListener struct</a>

```
searchKey: net.rawListener
```

```Go
type rawListener struct {
	rawConn
}
```

#### <a id="newRawListener" href="#newRawListener">func newRawListener(fd *netFD) (*rawListener, error)</a>

```
searchKey: net.newRawListener
```

```Go
func newRawListener(fd *netFD) (*rawListener, error)
```

#### <a id="rawListener.Read" href="#rawListener.Read">func (l *rawListener) Read(func(uintptr) bool) error</a>

```
searchKey: net.rawListener.Read
```

```Go
func (l *rawListener) Read(func(uintptr) bool) error
```

#### <a id="rawListener.Write" href="#rawListener.Write">func (l *rawListener) Write(func(uintptr) bool) error</a>

```
searchKey: net.rawListener.Write
```

```Go
func (l *rawListener) Write(func(uintptr) bool) error
```

### <a id="sockaddr" href="#sockaddr">type sockaddr interface</a>

```
searchKey: net.sockaddr
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

### <a id="TCPAddr" href="#TCPAddr">type TCPAddr struct</a>

```
searchKey: net.TCPAddr
tags: [exported]
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
tags: [exported]
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
tags: [exported]
```

```Go
func (a *TCPAddr) Network() string
```

Network returns the address's network name, "tcp". 

#### <a id="TCPAddr.String" href="#TCPAddr.String">func (a *TCPAddr) String() string</a>

```
searchKey: net.TCPAddr.String
tags: [exported]
```

```Go
func (a *TCPAddr) String() string
```

#### <a id="TCPAddr.isWildcard" href="#TCPAddr.isWildcard">func (a *TCPAddr) isWildcard() bool</a>

```
searchKey: net.TCPAddr.isWildcard
```

```Go
func (a *TCPAddr) isWildcard() bool
```

#### <a id="TCPAddr.opAddr" href="#TCPAddr.opAddr">func (a *TCPAddr) opAddr() Addr</a>

```
searchKey: net.TCPAddr.opAddr
```

```Go
func (a *TCPAddr) opAddr() Addr
```

#### <a id="TCPAddr.family" href="#TCPAddr.family">func (a *TCPAddr) family() int</a>

```
searchKey: net.TCPAddr.family
```

```Go
func (a *TCPAddr) family() int
```

#### <a id="TCPAddr.sockaddr" href="#TCPAddr.sockaddr">func (a *TCPAddr) sockaddr(family int) (syscall.Sockaddr, error)</a>

```
searchKey: net.TCPAddr.sockaddr
```

```Go
func (a *TCPAddr) sockaddr(family int) (syscall.Sockaddr, error)
```

#### <a id="TCPAddr.toLocal" href="#TCPAddr.toLocal">func (a *TCPAddr) toLocal(net string) sockaddr</a>

```
searchKey: net.TCPAddr.toLocal
```

```Go
func (a *TCPAddr) toLocal(net string) sockaddr
```

### <a id="TCPConn" href="#TCPConn">type TCPConn struct</a>

```
searchKey: net.TCPConn
tags: [exported]
```

```Go
type TCPConn struct {
	conn
}
```

TCPConn is an implementation of the Conn interface for TCP network connections. 

#### <a id="newTCPConn" href="#newTCPConn">func newTCPConn(fd *netFD) *TCPConn</a>

```
searchKey: net.newTCPConn
```

```Go
func newTCPConn(fd *netFD) *TCPConn
```

#### <a id="DialTCP" href="#DialTCP">func DialTCP(network string, laddr, raddr *TCPAddr) (*TCPConn, error)</a>

```
searchKey: net.DialTCP
tags: [exported]
```

```Go
func DialTCP(network string, laddr, raddr *TCPAddr) (*TCPConn, error)
```

DialTCP acts like Dial for TCP networks. 

The network must be a TCP network name; see func Dial for details. 

If laddr is nil, a local address is automatically chosen. If the IP field of raddr is nil or an unspecified IP address, the local system is assumed. 

#### <a id="slowDialTCP" href="#slowDialTCP">func slowDialTCP(ctx context.Context, network string, laddr, raddr *TCPAddr) (*TCPConn, error)</a>

```
searchKey: net.slowDialTCP
```

```Go
func slowDialTCP(ctx context.Context, network string, laddr, raddr *TCPAddr) (*TCPConn, error)
```

In some environments, the slow IPs may be explicitly unreachable, and fail more quickly than expected. This test hook prevents dialTCP from returning before the deadline. 

#### <a id="TCPConn.SyscallConn" href="#TCPConn.SyscallConn">func (c *TCPConn) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.TCPConn.SyscallConn
tags: [exported]
```

```Go
func (c *TCPConn) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

#### <a id="TCPConn.ReadFrom" href="#TCPConn.ReadFrom">func (c *TCPConn) ReadFrom(r io.Reader) (int64, error)</a>

```
searchKey: net.TCPConn.ReadFrom
tags: [exported]
```

```Go
func (c *TCPConn) ReadFrom(r io.Reader) (int64, error)
```

ReadFrom implements the io.ReaderFrom ReadFrom method. 

#### <a id="TCPConn.CloseRead" href="#TCPConn.CloseRead">func (c *TCPConn) CloseRead() error</a>

```
searchKey: net.TCPConn.CloseRead
tags: [exported]
```

```Go
func (c *TCPConn) CloseRead() error
```

CloseRead shuts down the reading side of the TCP connection. Most callers should just use Close. 

#### <a id="TCPConn.CloseWrite" href="#TCPConn.CloseWrite">func (c *TCPConn) CloseWrite() error</a>

```
searchKey: net.TCPConn.CloseWrite
tags: [exported]
```

```Go
func (c *TCPConn) CloseWrite() error
```

CloseWrite shuts down the writing side of the TCP connection. Most callers should just use Close. 

#### <a id="TCPConn.SetLinger" href="#TCPConn.SetLinger">func (c *TCPConn) SetLinger(sec int) error</a>

```
searchKey: net.TCPConn.SetLinger
tags: [exported]
```

```Go
func (c *TCPConn) SetLinger(sec int) error
```

SetLinger sets the behavior of Close on a connection which still has data waiting to be sent or to be acknowledged. 

If sec < 0 (the default), the operating system finishes sending the data in the background. 

If sec == 0, the operating system discards any unsent or unacknowledged data. 

If sec > 0, the data is sent in the background as with sec < 0. On some operating systems after sec seconds have elapsed any remaining unsent data may be discarded. 

#### <a id="TCPConn.SetKeepAlive" href="#TCPConn.SetKeepAlive">func (c *TCPConn) SetKeepAlive(keepalive bool) error</a>

```
searchKey: net.TCPConn.SetKeepAlive
tags: [exported]
```

```Go
func (c *TCPConn) SetKeepAlive(keepalive bool) error
```

SetKeepAlive sets whether the operating system should send keep-alive messages on the connection. 

#### <a id="TCPConn.SetKeepAlivePeriod" href="#TCPConn.SetKeepAlivePeriod">func (c *TCPConn) SetKeepAlivePeriod(d time.Duration) error</a>

```
searchKey: net.TCPConn.SetKeepAlivePeriod
tags: [exported]
```

```Go
func (c *TCPConn) SetKeepAlivePeriod(d time.Duration) error
```

SetKeepAlivePeriod sets period between keep-alives. 

#### <a id="TCPConn.SetNoDelay" href="#TCPConn.SetNoDelay">func (c *TCPConn) SetNoDelay(noDelay bool) error</a>

```
searchKey: net.TCPConn.SetNoDelay
tags: [exported]
```

```Go
func (c *TCPConn) SetNoDelay(noDelay bool) error
```

SetNoDelay controls whether the operating system should delay packet transmission in hopes of sending fewer packets (Nagle's algorithm).  The default is true (no delay), meaning that data is sent as soon as possible after a Write. 

#### <a id="TCPConn.readFrom" href="#TCPConn.readFrom">func (c *TCPConn) readFrom(r io.Reader) (int64, error)</a>

```
searchKey: net.TCPConn.readFrom
```

```Go
func (c *TCPConn) readFrom(r io.Reader) (int64, error)
```

### <a id="TCPListener" href="#TCPListener">type TCPListener struct</a>

```
searchKey: net.TCPListener
tags: [exported]
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
tags: [exported]
```

```Go
func ListenTCP(network string, laddr *TCPAddr) (*TCPListener, error)
```

ListenTCP acts like Listen for TCP networks. 

The network must be a TCP network name; see func Dial for details. 

If the IP field of laddr is nil or an unspecified IP address, ListenTCP listens on all available unicast and anycast IP addresses of the local system. If the Port field of laddr is 0, a port number is automatically chosen. 

#### <a id="TCPListener.SyscallConn" href="#TCPListener.SyscallConn">func (l *TCPListener) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.TCPListener.SyscallConn
tags: [exported]
```

```Go
func (l *TCPListener) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

The returned RawConn only supports calling Control. Read and Write return an error. 

#### <a id="TCPListener.AcceptTCP" href="#TCPListener.AcceptTCP">func (l *TCPListener) AcceptTCP() (*TCPConn, error)</a>

```
searchKey: net.TCPListener.AcceptTCP
tags: [exported]
```

```Go
func (l *TCPListener) AcceptTCP() (*TCPConn, error)
```

AcceptTCP accepts the next incoming call and returns the new connection. 

#### <a id="TCPListener.Accept" href="#TCPListener.Accept">func (l *TCPListener) Accept() (Conn, error)</a>

```
searchKey: net.TCPListener.Accept
tags: [exported]
```

```Go
func (l *TCPListener) Accept() (Conn, error)
```

Accept implements the Accept method in the Listener interface; it waits for the next call and returns a generic Conn. 

#### <a id="TCPListener.Close" href="#TCPListener.Close">func (l *TCPListener) Close() error</a>

```
searchKey: net.TCPListener.Close
tags: [exported]
```

```Go
func (l *TCPListener) Close() error
```

Close stops listening on the TCP address. Already Accepted connections are not closed. 

#### <a id="TCPListener.Addr" href="#TCPListener.Addr">func (l *TCPListener) Addr() Addr</a>

```
searchKey: net.TCPListener.Addr
tags: [exported]
```

```Go
func (l *TCPListener) Addr() Addr
```

Addr returns the listener's network address, a *TCPAddr. The Addr returned is shared by all invocations of Addr, so do not modify it. 

#### <a id="TCPListener.SetDeadline" href="#TCPListener.SetDeadline">func (l *TCPListener) SetDeadline(t time.Time) error</a>

```
searchKey: net.TCPListener.SetDeadline
tags: [exported]
```

```Go
func (l *TCPListener) SetDeadline(t time.Time) error
```

SetDeadline sets the deadline associated with the listener. A zero time value disables the deadline. 

#### <a id="TCPListener.File" href="#TCPListener.File">func (l *TCPListener) File() (f *os.File, err error)</a>

```
searchKey: net.TCPListener.File
tags: [exported]
```

```Go
func (l *TCPListener) File() (f *os.File, err error)
```

File returns a copy of the underlying os.File. It is the caller's responsibility to close f when finished. Closing l does not affect f, and closing f does not affect l. 

The returned os.File's file descriptor is different from the connection's. Attempting to change properties of the original using this duplicate may or may not have the desired effect. 

#### <a id="TCPListener.ok" href="#TCPListener.ok">func (ln *TCPListener) ok() bool</a>

```
searchKey: net.TCPListener.ok
```

```Go
func (ln *TCPListener) ok() bool
```

#### <a id="TCPListener.accept" href="#TCPListener.accept">func (ln *TCPListener) accept() (*TCPConn, error)</a>

```
searchKey: net.TCPListener.accept
```

```Go
func (ln *TCPListener) accept() (*TCPConn, error)
```

#### <a id="TCPListener.close" href="#TCPListener.close">func (ln *TCPListener) close() error</a>

```
searchKey: net.TCPListener.close
```

```Go
func (ln *TCPListener) close() error
```

#### <a id="TCPListener.file" href="#TCPListener.file">func (ln *TCPListener) file() (*os.File, error)</a>

```
searchKey: net.TCPListener.file
```

```Go
func (ln *TCPListener) file() (*os.File, error)
```

#### <a id="TCPListener.port" href="#TCPListener.port">func (ln *TCPListener) port() string</a>

```
searchKey: net.TCPListener.port
```

```Go
func (ln *TCPListener) port() string
```

### <a id="UDPAddr" href="#UDPAddr">type UDPAddr struct</a>

```
searchKey: net.UDPAddr
tags: [exported]
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
tags: [exported]
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
tags: [exported]
```

```Go
func (a *UDPAddr) Network() string
```

Network returns the address's network name, "udp". 

#### <a id="UDPAddr.String" href="#UDPAddr.String">func (a *UDPAddr) String() string</a>

```
searchKey: net.UDPAddr.String
tags: [exported]
```

```Go
func (a *UDPAddr) String() string
```

#### <a id="UDPAddr.isWildcard" href="#UDPAddr.isWildcard">func (a *UDPAddr) isWildcard() bool</a>

```
searchKey: net.UDPAddr.isWildcard
```

```Go
func (a *UDPAddr) isWildcard() bool
```

#### <a id="UDPAddr.opAddr" href="#UDPAddr.opAddr">func (a *UDPAddr) opAddr() Addr</a>

```
searchKey: net.UDPAddr.opAddr
```

```Go
func (a *UDPAddr) opAddr() Addr
```

#### <a id="UDPAddr.family" href="#UDPAddr.family">func (a *UDPAddr) family() int</a>

```
searchKey: net.UDPAddr.family
```

```Go
func (a *UDPAddr) family() int
```

#### <a id="UDPAddr.sockaddr" href="#UDPAddr.sockaddr">func (a *UDPAddr) sockaddr(family int) (syscall.Sockaddr, error)</a>

```
searchKey: net.UDPAddr.sockaddr
```

```Go
func (a *UDPAddr) sockaddr(family int) (syscall.Sockaddr, error)
```

#### <a id="UDPAddr.toLocal" href="#UDPAddr.toLocal">func (a *UDPAddr) toLocal(net string) sockaddr</a>

```
searchKey: net.UDPAddr.toLocal
```

```Go
func (a *UDPAddr) toLocal(net string) sockaddr
```

### <a id="UDPConn" href="#UDPConn">type UDPConn struct</a>

```
searchKey: net.UDPConn
tags: [exported]
```

```Go
type UDPConn struct {
	conn
}
```

UDPConn is the implementation of the Conn and PacketConn interfaces for UDP network connections. 

#### <a id="newUDPConn" href="#newUDPConn">func newUDPConn(fd *netFD) *UDPConn</a>

```
searchKey: net.newUDPConn
```

```Go
func newUDPConn(fd *netFD) *UDPConn
```

#### <a id="DialUDP" href="#DialUDP">func DialUDP(network string, laddr, raddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.DialUDP
tags: [exported]
```

```Go
func DialUDP(network string, laddr, raddr *UDPAddr) (*UDPConn, error)
```

DialUDP acts like Dial for UDP networks. 

The network must be a UDP network name; see func Dial for details. 

If laddr is nil, a local address is automatically chosen. If the IP field of raddr is nil or an unspecified IP address, the local system is assumed. 

#### <a id="ListenUDP" href="#ListenUDP">func ListenUDP(network string, laddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.ListenUDP
tags: [exported]
```

```Go
func ListenUDP(network string, laddr *UDPAddr) (*UDPConn, error)
```

ListenUDP acts like ListenPacket for UDP networks. 

The network must be a UDP network name; see func Dial for details. 

If the IP field of laddr is nil or an unspecified IP address, ListenUDP listens on all available IP addresses of the local system except multicast IP addresses. If the Port field of laddr is 0, a port number is automatically chosen. 

#### <a id="ListenMulticastUDP" href="#ListenMulticastUDP">func ListenMulticastUDP(network string, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)</a>

```
searchKey: net.ListenMulticastUDP
tags: [exported]
```

```Go
func ListenMulticastUDP(network string, ifi *Interface, gaddr *UDPAddr) (*UDPConn, error)
```

ListenMulticastUDP acts like ListenPacket for UDP networks but takes a group address on a specific network interface. 

The network must be a UDP network name; see func Dial for details. 

ListenMulticastUDP listens on all available IP addresses of the local system including the group, multicast IP address. If ifi is nil, ListenMulticastUDP uses the system-assigned multicast interface, although this is not recommended because the assignment depends on platforms and sometimes it might require routing configuration. If the Port field of gaddr is 0, a port number is automatically chosen. 

ListenMulticastUDP is just for convenience of simple, small applications. There are golang.org/x/net/ipv4 and golang.org/x/net/ipv6 packages for general purpose uses. 

Note that ListenMulticastUDP will set the IP_MULTICAST_LOOP socket option to 0 under IPPROTO_IP, to disable loopback of multicast packets. 

#### <a id="UDPConn.SyscallConn" href="#UDPConn.SyscallConn">func (c *UDPConn) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.UDPConn.SyscallConn
tags: [exported]
```

```Go
func (c *UDPConn) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

#### <a id="UDPConn.ReadFromUDP" href="#UDPConn.ReadFromUDP">func (c *UDPConn) ReadFromUDP(b []byte) (n int, addr *UDPAddr, err error)</a>

```
searchKey: net.UDPConn.ReadFromUDP
tags: [exported]
```

```Go
func (c *UDPConn) ReadFromUDP(b []byte) (n int, addr *UDPAddr, err error)
```

ReadFromUDP acts like ReadFrom but returns a UDPAddr. 

#### <a id="UDPConn.readFromUDP" href="#UDPConn.readFromUDP">func (c *UDPConn) readFromUDP(b []byte, addr *UDPAddr) (int, *UDPAddr, error)</a>

```
searchKey: net.UDPConn.readFromUDP
```

```Go
func (c *UDPConn) readFromUDP(b []byte, addr *UDPAddr) (int, *UDPAddr, error)
```

readFromUDP implements ReadFromUDP. 

#### <a id="UDPConn.ReadFrom" href="#UDPConn.ReadFrom">func (c *UDPConn) ReadFrom(b []byte) (int, Addr, error)</a>

```
searchKey: net.UDPConn.ReadFrom
tags: [exported]
```

```Go
func (c *UDPConn) ReadFrom(b []byte) (int, Addr, error)
```

ReadFrom implements the PacketConn ReadFrom method. 

#### <a id="UDPConn.ReadMsgUDP" href="#UDPConn.ReadMsgUDP">func (c *UDPConn) ReadMsgUDP(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)</a>

```
searchKey: net.UDPConn.ReadMsgUDP
tags: [exported]
```

```Go
func (c *UDPConn) ReadMsgUDP(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)
```

ReadMsgUDP reads a message from c, copying the payload into b and the associated out-of-band data into oob. It returns the number of bytes copied into b, the number of bytes copied into oob, the flags that were set on the message and the source address of the message. 

The packages golang.org/x/net/ipv4 and golang.org/x/net/ipv6 can be used to manipulate IP-level socket options in oob. 

#### <a id="UDPConn.WriteToUDP" href="#UDPConn.WriteToUDP">func (c *UDPConn) WriteToUDP(b []byte, addr *UDPAddr) (int, error)</a>

```
searchKey: net.UDPConn.WriteToUDP
tags: [exported]
```

```Go
func (c *UDPConn) WriteToUDP(b []byte, addr *UDPAddr) (int, error)
```

WriteToUDP acts like WriteTo but takes a UDPAddr. 

#### <a id="UDPConn.WriteTo" href="#UDPConn.WriteTo">func (c *UDPConn) WriteTo(b []byte, addr Addr) (int, error)</a>

```
searchKey: net.UDPConn.WriteTo
tags: [exported]
```

```Go
func (c *UDPConn) WriteTo(b []byte, addr Addr) (int, error)
```

WriteTo implements the PacketConn WriteTo method. 

#### <a id="UDPConn.WriteMsgUDP" href="#UDPConn.WriteMsgUDP">func (c *UDPConn) WriteMsgUDP(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)</a>

```
searchKey: net.UDPConn.WriteMsgUDP
tags: [exported]
```

```Go
func (c *UDPConn) WriteMsgUDP(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)
```

WriteMsgUDP writes a message to addr via c if c isn't connected, or to c's remote address if c is connected (in which case addr must be nil). The payload is copied from b and the associated out-of-band data is copied from oob. It returns the number of payload and out-of-band bytes written. 

The packages golang.org/x/net/ipv4 and golang.org/x/net/ipv6 can be used to manipulate IP-level socket options in oob. 

#### <a id="UDPConn.readFrom" href="#UDPConn.readFrom">func (c *UDPConn) readFrom(b []byte, addr *UDPAddr) (int, *UDPAddr, error)</a>

```
searchKey: net.UDPConn.readFrom
```

```Go
func (c *UDPConn) readFrom(b []byte, addr *UDPAddr) (int, *UDPAddr, error)
```

#### <a id="UDPConn.readMsg" href="#UDPConn.readMsg">func (c *UDPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)</a>

```
searchKey: net.UDPConn.readMsg
```

```Go
func (c *UDPConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UDPAddr, err error)
```

#### <a id="UDPConn.writeTo" href="#UDPConn.writeTo">func (c *UDPConn) writeTo(b []byte, addr *UDPAddr) (int, error)</a>

```
searchKey: net.UDPConn.writeTo
```

```Go
func (c *UDPConn) writeTo(b []byte, addr *UDPAddr) (int, error)
```

#### <a id="UDPConn.writeMsg" href="#UDPConn.writeMsg">func (c *UDPConn) writeMsg(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)</a>

```
searchKey: net.UDPConn.writeMsg
```

```Go
func (c *UDPConn) writeMsg(b, oob []byte, addr *UDPAddr) (n, oobn int, err error)
```

#### <a id="UDPConn.port" href="#UDPConn.port">func (c *UDPConn) port() string</a>

```
searchKey: net.UDPConn.port
```

```Go
func (c *UDPConn) port() string
```

### <a id="UnixAddr" href="#UnixAddr">type UnixAddr struct</a>

```
searchKey: net.UnixAddr
tags: [exported]
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
tags: [exported]
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
tags: [exported]
```

```Go
func (a *UnixAddr) Network() string
```

Network returns the address's network name, "unix", "unixgram" or "unixpacket". 

#### <a id="UnixAddr.String" href="#UnixAddr.String">func (a *UnixAddr) String() string</a>

```
searchKey: net.UnixAddr.String
tags: [exported]
```

```Go
func (a *UnixAddr) String() string
```

#### <a id="UnixAddr.isWildcard" href="#UnixAddr.isWildcard">func (a *UnixAddr) isWildcard() bool</a>

```
searchKey: net.UnixAddr.isWildcard
```

```Go
func (a *UnixAddr) isWildcard() bool
```

#### <a id="UnixAddr.opAddr" href="#UnixAddr.opAddr">func (a *UnixAddr) opAddr() Addr</a>

```
searchKey: net.UnixAddr.opAddr
```

```Go
func (a *UnixAddr) opAddr() Addr
```

#### <a id="UnixAddr.family" href="#UnixAddr.family">func (a *UnixAddr) family() int</a>

```
searchKey: net.UnixAddr.family
```

```Go
func (a *UnixAddr) family() int
```

#### <a id="UnixAddr.sockaddr" href="#UnixAddr.sockaddr">func (a *UnixAddr) sockaddr(family int) (syscall.Sockaddr, error)</a>

```
searchKey: net.UnixAddr.sockaddr
```

```Go
func (a *UnixAddr) sockaddr(family int) (syscall.Sockaddr, error)
```

#### <a id="UnixAddr.toLocal" href="#UnixAddr.toLocal">func (a *UnixAddr) toLocal(net string) sockaddr</a>

```
searchKey: net.UnixAddr.toLocal
```

```Go
func (a *UnixAddr) toLocal(net string) sockaddr
```

### <a id="UnixConn" href="#UnixConn">type UnixConn struct</a>

```
searchKey: net.UnixConn
tags: [exported]
```

```Go
type UnixConn struct {
	conn
}
```

UnixConn is an implementation of the Conn interface for connections to Unix domain sockets. 

#### <a id="newUnixConn" href="#newUnixConn">func newUnixConn(fd *netFD) *UnixConn</a>

```
searchKey: net.newUnixConn
```

```Go
func newUnixConn(fd *netFD) *UnixConn
```

#### <a id="DialUnix" href="#DialUnix">func DialUnix(network string, laddr, raddr *UnixAddr) (*UnixConn, error)</a>

```
searchKey: net.DialUnix
tags: [exported]
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
tags: [exported]
```

```Go
func ListenUnixgram(network string, laddr *UnixAddr) (*UnixConn, error)
```

ListenUnixgram acts like ListenPacket for Unix networks. 

The network must be "unixgram". 

#### <a id="UnixConn.SyscallConn" href="#UnixConn.SyscallConn">func (c *UnixConn) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.UnixConn.SyscallConn
tags: [exported]
```

```Go
func (c *UnixConn) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

#### <a id="UnixConn.CloseRead" href="#UnixConn.CloseRead">func (c *UnixConn) CloseRead() error</a>

```
searchKey: net.UnixConn.CloseRead
tags: [exported]
```

```Go
func (c *UnixConn) CloseRead() error
```

CloseRead shuts down the reading side of the Unix domain connection. Most callers should just use Close. 

#### <a id="UnixConn.CloseWrite" href="#UnixConn.CloseWrite">func (c *UnixConn) CloseWrite() error</a>

```
searchKey: net.UnixConn.CloseWrite
tags: [exported]
```

```Go
func (c *UnixConn) CloseWrite() error
```

CloseWrite shuts down the writing side of the Unix domain connection. Most callers should just use Close. 

#### <a id="UnixConn.ReadFromUnix" href="#UnixConn.ReadFromUnix">func (c *UnixConn) ReadFromUnix(b []byte) (int, *UnixAddr, error)</a>

```
searchKey: net.UnixConn.ReadFromUnix
tags: [exported]
```

```Go
func (c *UnixConn) ReadFromUnix(b []byte) (int, *UnixAddr, error)
```

ReadFromUnix acts like ReadFrom but returns a UnixAddr. 

#### <a id="UnixConn.ReadFrom" href="#UnixConn.ReadFrom">func (c *UnixConn) ReadFrom(b []byte) (int, Addr, error)</a>

```
searchKey: net.UnixConn.ReadFrom
tags: [exported]
```

```Go
func (c *UnixConn) ReadFrom(b []byte) (int, Addr, error)
```

ReadFrom implements the PacketConn ReadFrom method. 

#### <a id="UnixConn.ReadMsgUnix" href="#UnixConn.ReadMsgUnix">func (c *UnixConn) ReadMsgUnix(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)</a>

```
searchKey: net.UnixConn.ReadMsgUnix
tags: [exported]
```

```Go
func (c *UnixConn) ReadMsgUnix(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)
```

ReadMsgUnix reads a message from c, copying the payload into b and the associated out-of-band data into oob. It returns the number of bytes copied into b, the number of bytes copied into oob, the flags that were set on the message and the source address of the message. 

Note that if len(b) == 0 and len(oob) > 0, this function will still read (and discard) 1 byte from the connection. 

#### <a id="UnixConn.WriteToUnix" href="#UnixConn.WriteToUnix">func (c *UnixConn) WriteToUnix(b []byte, addr *UnixAddr) (int, error)</a>

```
searchKey: net.UnixConn.WriteToUnix
tags: [exported]
```

```Go
func (c *UnixConn) WriteToUnix(b []byte, addr *UnixAddr) (int, error)
```

WriteToUnix acts like WriteTo but takes a UnixAddr. 

#### <a id="UnixConn.WriteTo" href="#UnixConn.WriteTo">func (c *UnixConn) WriteTo(b []byte, addr Addr) (int, error)</a>

```
searchKey: net.UnixConn.WriteTo
tags: [exported]
```

```Go
func (c *UnixConn) WriteTo(b []byte, addr Addr) (int, error)
```

WriteTo implements the PacketConn WriteTo method. 

#### <a id="UnixConn.WriteMsgUnix" href="#UnixConn.WriteMsgUnix">func (c *UnixConn) WriteMsgUnix(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)</a>

```
searchKey: net.UnixConn.WriteMsgUnix
tags: [exported]
```

```Go
func (c *UnixConn) WriteMsgUnix(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)
```

WriteMsgUnix writes a message to addr via c, copying the payload from b and the associated out-of-band data from oob. It returns the number of payload and out-of-band bytes written. 

Note that if len(b) == 0 and len(oob) > 0, this function will still write 1 byte to the connection. 

#### <a id="UnixConn.readFrom" href="#UnixConn.readFrom">func (c *UnixConn) readFrom(b []byte) (int, *UnixAddr, error)</a>

```
searchKey: net.UnixConn.readFrom
```

```Go
func (c *UnixConn) readFrom(b []byte) (int, *UnixAddr, error)
```

#### <a id="UnixConn.readMsg" href="#UnixConn.readMsg">func (c *UnixConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)</a>

```
searchKey: net.UnixConn.readMsg
```

```Go
func (c *UnixConn) readMsg(b, oob []byte) (n, oobn, flags int, addr *UnixAddr, err error)
```

#### <a id="UnixConn.writeTo" href="#UnixConn.writeTo">func (c *UnixConn) writeTo(b []byte, addr *UnixAddr) (int, error)</a>

```
searchKey: net.UnixConn.writeTo
```

```Go
func (c *UnixConn) writeTo(b []byte, addr *UnixAddr) (int, error)
```

#### <a id="UnixConn.writeMsg" href="#UnixConn.writeMsg">func (c *UnixConn) writeMsg(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)</a>

```
searchKey: net.UnixConn.writeMsg
```

```Go
func (c *UnixConn) writeMsg(b, oob []byte, addr *UnixAddr) (n, oobn int, err error)
```

### <a id="UnixListener" href="#UnixListener">type UnixListener struct</a>

```
searchKey: net.UnixListener
tags: [exported]
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
tags: [exported]
```

```Go
func ListenUnix(network string, laddr *UnixAddr) (*UnixListener, error)
```

ListenUnix acts like Listen for Unix networks. 

The network must be "unix" or "unixpacket". 

#### <a id="UnixListener.ok" href="#UnixListener.ok">func (ln *UnixListener) ok() bool</a>

```
searchKey: net.UnixListener.ok
```

```Go
func (ln *UnixListener) ok() bool
```

#### <a id="UnixListener.SyscallConn" href="#UnixListener.SyscallConn">func (l *UnixListener) SyscallConn() (syscall.RawConn, error)</a>

```
searchKey: net.UnixListener.SyscallConn
tags: [exported]
```

```Go
func (l *UnixListener) SyscallConn() (syscall.RawConn, error)
```

SyscallConn returns a raw network connection. This implements the syscall.Conn interface. 

The returned RawConn only supports calling Control. Read and Write return an error. 

#### <a id="UnixListener.AcceptUnix" href="#UnixListener.AcceptUnix">func (l *UnixListener) AcceptUnix() (*UnixConn, error)</a>

```
searchKey: net.UnixListener.AcceptUnix
tags: [exported]
```

```Go
func (l *UnixListener) AcceptUnix() (*UnixConn, error)
```

AcceptUnix accepts the next incoming call and returns the new connection. 

#### <a id="UnixListener.Accept" href="#UnixListener.Accept">func (l *UnixListener) Accept() (Conn, error)</a>

```
searchKey: net.UnixListener.Accept
tags: [exported]
```

```Go
func (l *UnixListener) Accept() (Conn, error)
```

Accept implements the Accept method in the Listener interface. Returned connections will be of type *UnixConn. 

#### <a id="UnixListener.Close" href="#UnixListener.Close">func (l *UnixListener) Close() error</a>

```
searchKey: net.UnixListener.Close
tags: [exported]
```

```Go
func (l *UnixListener) Close() error
```

Close stops listening on the Unix address. Already accepted connections are not closed. 

#### <a id="UnixListener.Addr" href="#UnixListener.Addr">func (l *UnixListener) Addr() Addr</a>

```
searchKey: net.UnixListener.Addr
tags: [exported]
```

```Go
func (l *UnixListener) Addr() Addr
```

Addr returns the listener's network address. The Addr returned is shared by all invocations of Addr, so do not modify it. 

#### <a id="UnixListener.SetDeadline" href="#UnixListener.SetDeadline">func (l *UnixListener) SetDeadline(t time.Time) error</a>

```
searchKey: net.UnixListener.SetDeadline
tags: [exported]
```

```Go
func (l *UnixListener) SetDeadline(t time.Time) error
```

SetDeadline sets the deadline associated with the listener. A zero time value disables the deadline. 

#### <a id="UnixListener.File" href="#UnixListener.File">func (l *UnixListener) File() (f *os.File, err error)</a>

```
searchKey: net.UnixListener.File
tags: [exported]
```

```Go
func (l *UnixListener) File() (f *os.File, err error)
```

File returns a copy of the underlying os.File. It is the caller's responsibility to close f when finished. Closing l does not affect f, and closing f does not affect l. 

The returned os.File's file descriptor is different from the connection's. Attempting to change properties of the original using this duplicate may or may not have the desired effect. 

#### <a id="UnixListener.accept" href="#UnixListener.accept">func (ln *UnixListener) accept() (*UnixConn, error)</a>

```
searchKey: net.UnixListener.accept
```

```Go
func (ln *UnixListener) accept() (*UnixConn, error)
```

#### <a id="UnixListener.close" href="#UnixListener.close">func (ln *UnixListener) close() error</a>

```
searchKey: net.UnixListener.close
```

```Go
func (ln *UnixListener) close() error
```

#### <a id="UnixListener.file" href="#UnixListener.file">func (ln *UnixListener) file() (*os.File, error)</a>

```
searchKey: net.UnixListener.file
```

```Go
func (ln *UnixListener) file() (*os.File, error)
```

#### <a id="UnixListener.SetUnlinkOnClose" href="#UnixListener.SetUnlinkOnClose">func (l *UnixListener) SetUnlinkOnClose(unlink bool)</a>

```
searchKey: net.UnixListener.SetUnlinkOnClose
tags: [exported]
```

```Go
func (l *UnixListener) SetUnlinkOnClose(unlink bool)
```

SetUnlinkOnClose sets whether the underlying socket file should be removed from the file system when the listener is closed. 

The default behavior is to unlink the socket file only when package net created it. That is, when the listener and the underlying socket file were created by a call to Listen or ListenUnix, then by default closing the listener will remove the socket file. but if the listener was created by a call to FileListener to use an already existing socket file, then by default closing the listener will not remove the socket file. 

### <a id="nssHostTest" href="#nssHostTest">type nssHostTest struct</a>

```
searchKey: net.nssHostTest
```

```Go
type nssHostTest struct {
	host      string
	localhost string
	want      hostLookupOrder
}
```

### <a id="contextWithNonZeroDeadline" href="#contextWithNonZeroDeadline">type contextWithNonZeroDeadline struct</a>

```
searchKey: net.contextWithNonZeroDeadline
```

```Go
type contextWithNonZeroDeadline struct {
	context.Context
}
```

#### <a id="contextWithNonZeroDeadline.Deadline" href="#contextWithNonZeroDeadline.Deadline">func (contextWithNonZeroDeadline) Deadline() (time.Time, bool)</a>

```
searchKey: net.contextWithNonZeroDeadline.Deadline
```

```Go
func (contextWithNonZeroDeadline) Deadline() (time.Time, bool)
```

### <a id="resolvConfTest" href="#resolvConfTest">type resolvConfTest struct</a>

```
searchKey: net.resolvConfTest
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
```

```Go
func newResolvConfTest() (*resolvConfTest, error)
```

#### <a id="resolvConfTest.writeAndUpdate" href="#resolvConfTest.writeAndUpdate">func (conf *resolvConfTest) writeAndUpdate(lines []string) error</a>

```
searchKey: net.resolvConfTest.writeAndUpdate
```

```Go
func (conf *resolvConfTest) writeAndUpdate(lines []string) error
```

#### <a id="resolvConfTest.forceUpdate" href="#resolvConfTest.forceUpdate">func (conf *resolvConfTest) forceUpdate(name string, lastChecked time.Time) error</a>

```
searchKey: net.resolvConfTest.forceUpdate
```

```Go
func (conf *resolvConfTest) forceUpdate(name string, lastChecked time.Time) error
```

#### <a id="resolvConfTest.servers" href="#resolvConfTest.servers">func (conf *resolvConfTest) servers() []string</a>

```
searchKey: net.resolvConfTest.servers
```

```Go
func (conf *resolvConfTest) servers() []string
```

#### <a id="resolvConfTest.teardown" href="#resolvConfTest.teardown">func (conf *resolvConfTest) teardown() error</a>

```
searchKey: net.resolvConfTest.teardown
```

```Go
func (conf *resolvConfTest) teardown() error
```

### <a id="fakeDNSServer" href="#fakeDNSServer">type fakeDNSServer struct</a>

```
searchKey: net.fakeDNSServer
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
```

```Go
func (server *fakeDNSServer) DialContext(_ context.Context, n, s string) (Conn, error)
```

### <a id="fakeDNSConn" href="#fakeDNSConn">type fakeDNSConn struct</a>

```
searchKey: net.fakeDNSConn
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
```

```Go
func (f *fakeDNSConn) Close() error
```

#### <a id="fakeDNSConn.Read" href="#fakeDNSConn.Read">func (f *fakeDNSConn) Read(b []byte) (int, error)</a>

```
searchKey: net.fakeDNSConn.Read
```

```Go
func (f *fakeDNSConn) Read(b []byte) (int, error)
```

#### <a id="fakeDNSConn.Write" href="#fakeDNSConn.Write">func (f *fakeDNSConn) Write(b []byte) (int, error)</a>

```
searchKey: net.fakeDNSConn.Write
```

```Go
func (f *fakeDNSConn) Write(b []byte) (int, error)
```

#### <a id="fakeDNSConn.SetDeadline" href="#fakeDNSConn.SetDeadline">func (f *fakeDNSConn) SetDeadline(t time.Time) error</a>

```
searchKey: net.fakeDNSConn.SetDeadline
```

```Go
func (f *fakeDNSConn) SetDeadline(t time.Time) error
```

### <a id="fakeDNSPacketConn" href="#fakeDNSPacketConn">type fakeDNSPacketConn struct</a>

```
searchKey: net.fakeDNSPacketConn
```

```Go
type fakeDNSPacketConn struct {
	PacketConn
	fakeDNSConn
}
```

#### <a id="fakeDNSPacketConn.SetDeadline" href="#fakeDNSPacketConn.SetDeadline">func (f *fakeDNSPacketConn) SetDeadline(t time.Time) error</a>

```
searchKey: net.fakeDNSPacketConn.SetDeadline
```

```Go
func (f *fakeDNSPacketConn) SetDeadline(t time.Time) error
```

#### <a id="fakeDNSPacketConn.Close" href="#fakeDNSPacketConn.Close">func (f *fakeDNSPacketConn) Close() error</a>

```
searchKey: net.fakeDNSPacketConn.Close
```

```Go
func (f *fakeDNSPacketConn) Close() error
```

### <a id="dnsNameTest" href="#dnsNameTest">type dnsNameTest struct</a>

```
searchKey: net.dnsNameTest
```

```Go
type dnsNameTest struct {
	name   string
	result bool
}
```

### <a id="staticHostEntry" href="#staticHostEntry">type staticHostEntry struct</a>

```
searchKey: net.staticHostEntry
```

```Go
type staticHostEntry struct {
	in  string
	out []string
}
```

### <a id="ifStats" href="#ifStats">type ifStats struct</a>

```
searchKey: net.ifStats
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
```

```Go
func interfaceStats(ift []Interface) *ifStats
```

### <a id="routeStats" href="#routeStats">type routeStats struct</a>

```
searchKey: net.routeStats
```

```Go
type routeStats struct {
	ipv4, ipv6 int // # of active connected unicast, anycast or multicast routes
}
```

#### <a id="validateInterfaceUnicastAddrs" href="#validateInterfaceUnicastAddrs">func validateInterfaceUnicastAddrs(ifat []Addr) (*routeStats, error)</a>

```
searchKey: net.validateInterfaceUnicastAddrs
```

```Go
func validateInterfaceUnicastAddrs(ifat []Addr) (*routeStats, error)
```

#### <a id="validateInterfaceMulticastAddrs" href="#validateInterfaceMulticastAddrs">func validateInterfaceMulticastAddrs(ifat []Addr) (*routeStats, error)</a>

```
searchKey: net.validateInterfaceMulticastAddrs
```

```Go
func validateInterfaceMulticastAddrs(ifat []Addr) (*routeStats, error)
```

### <a id="testInterface" href="#testInterface">type testInterface struct</a>

```
searchKey: net.testInterface
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
```

```Go
func (ti *testInterface) setBroadcast(vid int) error
```

#### <a id="testInterface.setPointToPoint" href="#testInterface.setPointToPoint">func (ti *testInterface) setPointToPoint(suffix int) error</a>

```
searchKey: net.testInterface.setPointToPoint
```

```Go
func (ti *testInterface) setPointToPoint(suffix int) error
```

#### <a id="testInterface.setLinkLocal" href="#testInterface.setLinkLocal">func (ti *testInterface) setLinkLocal(suffix int) error</a>

```
searchKey: net.testInterface.setLinkLocal
```

```Go
func (ti *testInterface) setLinkLocal(suffix int) error
```

#### <a id="testInterface.setup" href="#testInterface.setup">func (ti *testInterface) setup() error</a>

```
searchKey: net.testInterface.setup
```

```Go
func (ti *testInterface) setup() error
```

#### <a id="testInterface.teardown" href="#testInterface.teardown">func (ti *testInterface) teardown() error</a>

```
searchKey: net.testInterface.teardown
```

```Go
func (ti *testInterface) teardown() error
```

### <a id="resolveIPAddrTest" href="#resolveIPAddrTest">type resolveIPAddrTest struct</a>

```
searchKey: net.resolveIPAddrTest
```

```Go
type resolveIPAddrTest struct {
	network       string
	litAddrOrName string
	addr          *IPAddr
	err           error
}
```

### <a id="lookupCustomResolver" href="#lookupCustomResolver">type lookupCustomResolver struct</a>

```
searchKey: net.lookupCustomResolver
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
```

```Go
func (lcr *lookupCustomResolver) dial() func(ctx context.Context, network, address string) (Conn, error)
```

### <a id="ipv6LinkLocalUnicastTest" href="#ipv6LinkLocalUnicastTest">type ipv6LinkLocalUnicastTest struct</a>

```
searchKey: net.ipv6LinkLocalUnicastTest
```

```Go
type ipv6LinkLocalUnicastTest struct {
	network, address string
	nameLookup       bool
}
```

### <a id="localServer" href="#localServer">type localServer struct</a>

```
searchKey: net.localServer
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
```

```Go
func newLocalServer(network string) (*localServer, error)
```

#### <a id="localServer.buildup" href="#localServer.buildup">func (ls *localServer) buildup(handler func(*localServer, Listener)) error</a>

```
searchKey: net.localServer.buildup
```

```Go
func (ls *localServer) buildup(handler func(*localServer, Listener)) error
```

#### <a id="localServer.teardown" href="#localServer.teardown">func (ls *localServer) teardown() error</a>

```
searchKey: net.localServer.teardown
```

```Go
func (ls *localServer) teardown() error
```

#### <a id="localServer.transponder" href="#localServer.transponder">func (ls *localServer) transponder(ln Listener, ch chan<- error)</a>

```
searchKey: net.localServer.transponder
```

```Go
func (ls *localServer) transponder(ln Listener, ch chan<- error)
```

### <a id="streamListener" href="#streamListener">type streamListener struct</a>

```
searchKey: net.streamListener
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
```

```Go
func (sl *streamListener) newLocalServer() (*localServer, error)
```

### <a id="dualStackServer" href="#dualStackServer">type dualStackServer struct</a>

```
searchKey: net.dualStackServer
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
```

```Go
func newDualStackServer() (*dualStackServer, error)
```

#### <a id="dualStackServer.buildup" href="#dualStackServer.buildup">func (dss *dualStackServer) buildup(handler func(*dualStackServer, Listener)) error</a>

```
searchKey: net.dualStackServer.buildup
```

```Go
func (dss *dualStackServer) buildup(handler func(*dualStackServer, Listener)) error
```

#### <a id="dualStackServer.teardownNetwork" href="#dualStackServer.teardownNetwork">func (dss *dualStackServer) teardownNetwork(network string) error</a>

```
searchKey: net.dualStackServer.teardownNetwork
```

```Go
func (dss *dualStackServer) teardownNetwork(network string) error
```

#### <a id="dualStackServer.teardown" href="#dualStackServer.teardown">func (dss *dualStackServer) teardown() error</a>

```
searchKey: net.dualStackServer.teardown
```

```Go
func (dss *dualStackServer) teardown() error
```

### <a id="localPacketServer" href="#localPacketServer">type localPacketServer struct</a>

```
searchKey: net.localPacketServer
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
```

```Go
func newLocalPacketServer(network string) (*localPacketServer, error)
```

#### <a id="localPacketServer.buildup" href="#localPacketServer.buildup">func (ls *localPacketServer) buildup(handler func(*localPacketServer, PacketConn)) error</a>

```
searchKey: net.localPacketServer.buildup
```

```Go
func (ls *localPacketServer) buildup(handler func(*localPacketServer, PacketConn)) error
```

#### <a id="localPacketServer.teardown" href="#localPacketServer.teardown">func (ls *localPacketServer) teardown() error</a>

```
searchKey: net.localPacketServer.teardown
```

```Go
func (ls *localPacketServer) teardown() error
```

### <a id="packetListener" href="#packetListener">type packetListener struct</a>

```
searchKey: net.packetListener
```

```Go
type packetListener struct {
	PacketConn
}
```

#### <a id="packetListener.newLocalServer" href="#packetListener.newLocalServer">func (pl *packetListener) newLocalServer() (*localPacketServer, error)</a>

```
searchKey: net.packetListener.newLocalServer
```

```Go
func (pl *packetListener) newLocalServer() (*localPacketServer, error)
```

### <a id="resolveTCPAddrTest" href="#resolveTCPAddrTest">type resolveTCPAddrTest struct</a>

```
searchKey: net.resolveTCPAddrTest
```

```Go
type resolveTCPAddrTest struct {
	network       string
	litAddrOrName string
	addr          *TCPAddr
	err           error
}
```

### <a id="neverEnding" href="#neverEnding">type neverEnding byte</a>

```
searchKey: net.neverEnding
```

```Go
type neverEnding byte
```

#### <a id="neverEnding.Read" href="#neverEnding.Read">func (b neverEnding) Read(p []byte) (int, error)</a>

```
searchKey: net.neverEnding.Read
```

```Go
func (b neverEnding) Read(p []byte) (int, error)
```

### <a id="resolveUDPAddrTest" href="#resolveUDPAddrTest">type resolveUDPAddrTest struct</a>

```
searchKey: net.resolveUDPAddrTest
```

```Go
type resolveUDPAddrTest struct {
	network       string
	litAddrOrName string
	addr          *UDPAddr
	err           error
}
```

### <a id="addrinfoErrno" href="#addrinfoErrno">type addrinfoErrno int</a>

```
searchKey: net.addrinfoErrno
```

```Go
type addrinfoErrno int
```

An addrinfoErrno represents a getaddrinfo, getnameinfo-specific error number. It's a signed number and a zero value is a non-error by convention. 

#### <a id="addrinfoErrno.Error" href="#addrinfoErrno.Error">func (eai addrinfoErrno) Error() string</a>

```
searchKey: net.addrinfoErrno.Error
```

```Go
func (eai addrinfoErrno) Error() string
```

#### <a id="addrinfoErrno.Temporary" href="#addrinfoErrno.Temporary">func (eai addrinfoErrno) Temporary() bool</a>

```
searchKey: net.addrinfoErrno.Temporary
```

```Go
func (eai addrinfoErrno) Temporary() bool
```

#### <a id="addrinfoErrno.Timeout" href="#addrinfoErrno.Timeout">func (eai addrinfoErrno) Timeout() bool</a>

```
searchKey: net.addrinfoErrno.Timeout
```

```Go
func (eai addrinfoErrno) Timeout() bool
```

### <a id="portLookupResult" href="#portLookupResult">type portLookupResult struct</a>

```
searchKey: net.portLookupResult
```

```Go
type portLookupResult struct {
	port int
	err  error
}
```

### <a id="ipLookupResult" href="#ipLookupResult">type ipLookupResult struct</a>

```
searchKey: net.ipLookupResult
```

```Go
type ipLookupResult struct {
	addrs []IPAddr
	cname string
	err   error
}
```

### <a id="reverseLookupResult" href="#reverseLookupResult">type reverseLookupResult struct</a>

```
searchKey: net.reverseLookupResult
```

```Go
type reverseLookupResult struct {
	names []string
	err   error
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="sortByRFC6724" href="#sortByRFC6724">func sortByRFC6724(addrs []IPAddr)</a>

```
searchKey: net.sortByRFC6724
```

```Go
func sortByRFC6724(addrs []IPAddr)
```

### <a id="sortByRFC6724withSrcs" href="#sortByRFC6724withSrcs">func sortByRFC6724withSrcs(addrs []IPAddr, srcs []IP)</a>

```
searchKey: net.sortByRFC6724withSrcs
```

```Go
func sortByRFC6724withSrcs(addrs []IPAddr, srcs []IP)
```

### <a id="srcAddrs" href="#srcAddrs">func srcAddrs(addrs []IPAddr) []IP</a>

```
searchKey: net.srcAddrs
```

```Go
func srcAddrs(addrs []IPAddr) []IP
```

srcsAddrs tries to UDP-connect to each address to see if it has a route. (This doesn't send any packets). The destination port number is irrelevant. 

### <a id="init" href="#init">func init()</a>

```
searchKey: net.init
```

```Go
func init()
```

### <a id="commonPrefixLen" href="#commonPrefixLen">func commonPrefixLen(a, b IP) (cpl int)</a>

```
searchKey: net.commonPrefixLen
```

```Go
func commonPrefixLen(a, b IP) (cpl int)
```

commonPrefixLen reports the length of the longest prefix (looking at the most significant, or leftmost, bits) that the two addresses have in common, up to the length of a's prefix (i.e., the portion of the address not including the interface ID). 

If a or b is an IPv4 address as an IPv6 address, the IPv4 addresses are compared (with max common prefix length of 32). If a and b are different IP versions, 0 is returned. 

See [https://tools.ietf.org/html/rfc6724#section-2.2](https://tools.ietf.org/html/rfc6724#section-2.2) 

### <a id="initConfVal" href="#initConfVal">func initConfVal()</a>

```
searchKey: net.initConfVal
```

```Go
func initConfVal()
```

### <a id="goDebugNetDNS" href="#goDebugNetDNS">func goDebugNetDNS() (dnsMode string, debugLevel int)</a>

```
searchKey: net.goDebugNetDNS
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

### <a id="isLocalhost" href="#isLocalhost">func isLocalhost(h string) bool</a>

```
searchKey: net.isLocalhost
```

```Go
func isLocalhost(h string) bool
```

isLocalhost reports whether h should be considered a "localhost" name for the myhostname NSS module. 

### <a id="isGateway" href="#isGateway">func isGateway(h string) bool</a>

```
searchKey: net.isGateway
```

```Go
func isGateway(h string) bool
```

isGateway reports whether h should be considered a "gateway" name for the myhostname NSS module. 

### <a id="minNonzeroTime" href="#minNonzeroTime">func minNonzeroTime(a, b time.Time) time.Time</a>

```
searchKey: net.minNonzeroTime
```

```Go
func minNonzeroTime(a, b time.Time) time.Time
```

### <a id="partialDeadline" href="#partialDeadline">func partialDeadline(now, deadline time.Time, addrsRemaining int) (time.Time, error)</a>

```
searchKey: net.partialDeadline
```

```Go
func partialDeadline(now, deadline time.Time, addrsRemaining int) (time.Time, error)
```

partialDeadline returns the deadline to use for a single address, when multiple addresses are pending. 

### <a id="parseNetwork" href="#parseNetwork">func parseNetwork(ctx context.Context, network string, needsProto bool) (afnet string, proto int, err error)</a>

```
searchKey: net.parseNetwork
```

```Go
func parseNetwork(ctx context.Context, network string, needsProto bool) (afnet string, proto int, err error)
```

### <a id="fastrand" href="#fastrand">func fastrand() uint32</a>

```
searchKey: net.fastrand
```

```Go
func fastrand() uint32
```

provided by runtime 

### <a id="randInt" href="#randInt">func randInt() int</a>

```
searchKey: net.randInt
```

```Go
func randInt() int
```

### <a id="randIntn" href="#randIntn">func randIntn(n int) int</a>

```
searchKey: net.randIntn
```

```Go
func randIntn(n int) int
```

### <a id="reverseaddr" href="#reverseaddr">func reverseaddr(addr string) (arpa string, err error)</a>

```
searchKey: net.reverseaddr
```

```Go
func reverseaddr(addr string) (arpa string, err error)
```

reverseaddr returns the in-addr.arpa. or ip6.arpa. hostname of the IP address addr suitable for rDNS (PTR) record lookup or an error if it fails to parse the IP address. 

### <a id="equalASCIIName" href="#equalASCIIName">func equalASCIIName(x, y dnsmessage.Name) bool</a>

```
searchKey: net.equalASCIIName
```

```Go
func equalASCIIName(x, y dnsmessage.Name) bool
```

### <a id="isDomainName" href="#isDomainName">func isDomainName(s string) bool</a>

```
searchKey: net.isDomainName
```

```Go
func isDomainName(s string) bool
```

isDomainName checks if a string is a presentation-format domain name (currently restricted to hostname-compatible "preferred name" LDH labels and SRV-like "underscore labels"; see golang.org/issue/12421). 

### <a id="absDomainName" href="#absDomainName">func absDomainName(b []byte) string</a>

```
searchKey: net.absDomainName
```

```Go
func absDomainName(b []byte) string
```

absDomainName returns an absolute domain name which ends with a trailing dot to match pure Go reverse resolver and all other lookup routines. See golang.org/issue/12189. But we don't want to add dots for local names from /etc/hosts. It's hard to tell so we settle on the heuristic that names without dots (like "localhost" or "myhost") do not get trailing dots, but any other names do. 

### <a id="newRequest" href="#newRequest">func newRequest(q dnsmessage.Question) (id uint16, udpReq, tcpReq []byte, err error)</a>

```
searchKey: net.newRequest
```

```Go
func newRequest(q dnsmessage.Question) (id uint16, udpReq, tcpReq []byte, err error)
```

### <a id="checkResponse" href="#checkResponse">func checkResponse(reqID uint16, reqQues dnsmessage.Question, respHdr dnsmessage.Header, respQues dnsmessage.Question) bool</a>

```
searchKey: net.checkResponse
```

```Go
func checkResponse(reqID uint16, reqQues dnsmessage.Question, respHdr dnsmessage.Header, respQues dnsmessage.Question) bool
```

### <a id="dnsPacketRoundTrip" href="#dnsPacketRoundTrip">func dnsPacketRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)</a>

```
searchKey: net.dnsPacketRoundTrip
```

```Go
func dnsPacketRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)
```

### <a id="dnsStreamRoundTrip" href="#dnsStreamRoundTrip">func dnsStreamRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)</a>

```
searchKey: net.dnsStreamRoundTrip
```

```Go
func dnsStreamRoundTrip(c Conn, id uint16, query dnsmessage.Question, b []byte) (dnsmessage.Parser, dnsmessage.Header, error)
```

### <a id="checkHeader" href="#checkHeader">func checkHeader(p *dnsmessage.Parser, h dnsmessage.Header) error</a>

```
searchKey: net.checkHeader
```

```Go
func checkHeader(p *dnsmessage.Parser, h dnsmessage.Header) error
```

checkHeader performs basic sanity checks on the header. 

### <a id="skipToAnswer" href="#skipToAnswer">func skipToAnswer(p *dnsmessage.Parser, qtype dnsmessage.Type) error</a>

```
searchKey: net.skipToAnswer
```

```Go
func skipToAnswer(p *dnsmessage.Parser, qtype dnsmessage.Type) error
```

### <a id="avoidDNS" href="#avoidDNS">func avoidDNS(name string) bool</a>

```
searchKey: net.avoidDNS
```

```Go
func avoidDNS(name string) bool
```

avoidDNS reports whether this is a hostname for which we should not use DNS. Currently this includes only .onion, per RFC 7686. See golang.org/issue/13705. Does not cover .local names (RFC 6762), see golang.org/issue/16739. 

### <a id="goLookupIPFiles" href="#goLookupIPFiles">func goLookupIPFiles(name string) (addrs []IPAddr)</a>

```
searchKey: net.goLookupIPFiles
```

```Go
func goLookupIPFiles(name string) (addrs []IPAddr)
```

lookup entries from /etc/hosts 

### <a id="dnsDefaultSearch" href="#dnsDefaultSearch">func dnsDefaultSearch() []string</a>

```
searchKey: net.dnsDefaultSearch
```

```Go
func dnsDefaultSearch() []string
```

### <a id="hasPrefix" href="#hasPrefix">func hasPrefix(s, prefix string) bool</a>

```
searchKey: net.hasPrefix
```

```Go
func hasPrefix(s, prefix string) bool
```

### <a id="ensureRooted" href="#ensureRooted">func ensureRooted(s string) string</a>

```
searchKey: net.ensureRooted
```

```Go
func ensureRooted(s string) string
```

### <a id="wrapSyscallError" href="#wrapSyscallError">func wrapSyscallError(name string, err error) error</a>

```
searchKey: net.wrapSyscallError
```

```Go
func wrapSyscallError(name string, err error) error
```

wrapSyscallError takes an error and a syscall name. If the error is a syscall.Errno, it wraps it in a os.SyscallError using the syscall name. 

### <a id="isConnError" href="#isConnError">func isConnError(err error) bool</a>

```
searchKey: net.isConnError
```

```Go
func isConnError(err error) bool
```

### <a id="dupSocket" href="#dupSocket">func dupSocket(f *os.File) (int, error)</a>

```
searchKey: net.dupSocket
```

```Go
func dupSocket(f *os.File) (int, error)
```

### <a id="parseLiteralIP" href="#parseLiteralIP">func parseLiteralIP(addr string) string</a>

```
searchKey: net.parseLiteralIP
```

```Go
func parseLiteralIP(addr string) string
```

### <a id="readHosts" href="#readHosts">func readHosts()</a>

```
searchKey: net.readHosts
```

```Go
func readHosts()
```

### <a id="lookupStaticHost" href="#lookupStaticHost">func lookupStaticHost(host string) []string</a>

```
searchKey: net.lookupStaticHost
```

```Go
func lookupStaticHost(host string) []string
```

lookupStaticHost looks up the addresses for the given host from /etc/hosts. 

### <a id="lookupStaticAddr" href="#lookupStaticAddr">func lookupStaticAddr(addr string) []string</a>

```
searchKey: net.lookupStaticAddr
```

```Go
func lookupStaticAddr(addr string) []string
```

lookupStaticAddr looks up the hosts for the given address from /etc/hosts. 

### <a id="Interfaces" href="#Interfaces">func Interfaces() ([]Interface, error)</a>

```
searchKey: net.Interfaces
tags: [exported]
```

```Go
func Interfaces() ([]Interface, error)
```

Interfaces returns a list of the system's network interfaces. 

### <a id="InterfaceAddrs" href="#InterfaceAddrs">func InterfaceAddrs() ([]Addr, error)</a>

```
searchKey: net.InterfaceAddrs
tags: [exported]
```

```Go
func InterfaceAddrs() ([]Addr, error)
```

InterfaceAddrs returns a list of the system's unicast interface addresses. 

The returned list does not identify the associated interface; use Interfaces and Interface.Addrs for more detail. 

### <a id="interfaceTable" href="#interfaceTable">func interfaceTable(ifindex int) ([]Interface, error)</a>

```
searchKey: net.interfaceTable
```

```Go
func interfaceTable(ifindex int) ([]Interface, error)
```

If the ifindex is zero, interfaceTable returns mappings of all network interfaces. Otherwise it returns a mapping of a specific interface. 

### <a id="interfaceAddrTable" href="#interfaceAddrTable">func interfaceAddrTable(ifi *Interface) ([]Addr, error)</a>

```
searchKey: net.interfaceAddrTable
```

```Go
func interfaceAddrTable(ifi *Interface) ([]Addr, error)
```

If the ifi is nil, interfaceAddrTable returns addresses for all network interfaces. Otherwise it returns addresses for a specific interface. 

### <a id="interfaceMessages" href="#interfaceMessages">func interfaceMessages(ifindex int) ([]route.Message, error)</a>

```
searchKey: net.interfaceMessages
```

```Go
func interfaceMessages(ifindex int) ([]route.Message, error)
```

### <a id="interfaceMulticastAddrTable" href="#interfaceMulticastAddrTable">func interfaceMulticastAddrTable(ifi *Interface) ([]Addr, error)</a>

```
searchKey: net.interfaceMulticastAddrTable
```

```Go
func interfaceMulticastAddrTable(ifi *Interface) ([]Addr, error)
```

interfaceMulticastAddrTable returns addresses for a specific interface. 

### <a id="isZeros" href="#isZeros">func isZeros(p IP) bool</a>

```
searchKey: net.isZeros
```

```Go
func isZeros(p IP) bool
```

Is p all zeros? 

### <a id="allFF" href="#allFF">func allFF(b []byte) bool</a>

```
searchKey: net.allFF
```

```Go
func allFF(b []byte) bool
```

### <a id="ubtoa" href="#ubtoa">func ubtoa(dst []byte, start int, v byte) int</a>

```
searchKey: net.ubtoa
```

```Go
func ubtoa(dst []byte, start int, v byte) int
```

ubtoa encodes the string form of the integer v to dst[start:] and returns the number of bytes written to dst. The caller must ensure that dst has sufficient length. 

### <a id="hexString" href="#hexString">func hexString(b []byte) string</a>

```
searchKey: net.hexString
```

```Go
func hexString(b []byte) string
```

### <a id="ipEmptyString" href="#ipEmptyString">func ipEmptyString(ip IP) string</a>

```
searchKey: net.ipEmptyString
```

```Go
func ipEmptyString(ip IP) string
```

ipEmptyString is like ip.String except that it returns an empty string when ip is unset. 

### <a id="simpleMaskLength" href="#simpleMaskLength">func simpleMaskLength(mask IPMask) int</a>

```
searchKey: net.simpleMaskLength
```

```Go
func simpleMaskLength(mask IPMask) int
```

If mask is a sequence of 1 bits followed by 0 bits, return the number of 1 bits. 

### <a id="stripIPv4Header" href="#stripIPv4Header">func stripIPv4Header(n int, b []byte) int</a>

```
searchKey: net.stripIPv4Header
```

```Go
func stripIPv4Header(n int, b []byte) int
```

### <a id="supportsIPv4" href="#supportsIPv4">func supportsIPv4() bool</a>

```
searchKey: net.supportsIPv4
```

```Go
func supportsIPv4() bool
```

supportsIPv4 reports whether the platform supports IPv4 networking functionality. 

### <a id="supportsIPv6" href="#supportsIPv6">func supportsIPv6() bool</a>

```
searchKey: net.supportsIPv6
```

```Go
func supportsIPv6() bool
```

supportsIPv6 reports whether the platform supports IPv6 networking functionality. 

### <a id="supportsIPv4map" href="#supportsIPv4map">func supportsIPv4map() bool</a>

```
searchKey: net.supportsIPv4map
```

```Go
func supportsIPv4map() bool
```

supportsIPv4map reports whether the platform supports mapping an IPv4 address inside an IPv6 address at transport layer protocols. See RFC 4291, RFC 4038 and RFC 3493. 

### <a id="isIPv4" href="#isIPv4">func isIPv4(addr Addr) bool</a>

```
searchKey: net.isIPv4
```

```Go
func isIPv4(addr Addr) bool
```

isIPv4 reports whether addr contains an IPv4 address. 

### <a id="isNotIPv4" href="#isNotIPv4">func isNotIPv4(addr Addr) bool</a>

```
searchKey: net.isNotIPv4
```

```Go
func isNotIPv4(addr Addr) bool
```

isNotIPv4 reports whether addr does not contain an IPv4 address. 

### <a id="ipv4only" href="#ipv4only">func ipv4only(addr IPAddr) bool</a>

```
searchKey: net.ipv4only
```

```Go
func ipv4only(addr IPAddr) bool
```

ipv4only reports whether addr is an IPv4 address. 

### <a id="ipv6only" href="#ipv6only">func ipv6only(addr IPAddr) bool</a>

```
searchKey: net.ipv6only
```

```Go
func ipv6only(addr IPAddr) bool
```

ipv6only reports whether addr is an IPv6 address except IPv4-mapped IPv6 address. 

### <a id="SplitHostPort" href="#SplitHostPort">func SplitHostPort(hostport string) (host, port string, err error)</a>

```
searchKey: net.SplitHostPort
tags: [exported]
```

```Go
func SplitHostPort(hostport string) (host, port string, err error)
```

SplitHostPort splits a network address of the form "host:port", "host%zone:port", "[host]:port" or "[host%zone]:port" into host or host%zone and port. 

A literal IPv6 address in hostport must be enclosed in square brackets, as in "[::1]:80", "[::1%lo0]:80". 

See func Dial for a description of the hostport parameter, and host and port results. 

### <a id="splitHostZone" href="#splitHostZone">func splitHostZone(s string) (host, zone string)</a>

```
searchKey: net.splitHostZone
```

```Go
func splitHostZone(s string) (host, zone string)
```

### <a id="JoinHostPort" href="#JoinHostPort">func JoinHostPort(host, port string) string</a>

```
searchKey: net.JoinHostPort
tags: [exported]
```

```Go
func JoinHostPort(host, port string) string
```

JoinHostPort combines host and port into a network address of the form "host:port". If host contains a colon, as found in literal IPv6 addresses, then JoinHostPort returns "[host]:port". 

See func Dial for a description of the host and port parameters. 

### <a id="favoriteAddrFamily" href="#favoriteAddrFamily">func favoriteAddrFamily(network string, laddr, raddr sockaddr, mode string) (family int, ipv6only bool)</a>

```
searchKey: net.favoriteAddrFamily
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

### <a id="ipToSockaddr" href="#ipToSockaddr">func ipToSockaddr(family int, ip IP, port int, zone string) (syscall.Sockaddr, error)</a>

```
searchKey: net.ipToSockaddr
```

```Go
func ipToSockaddr(family int, ip IP, port int, zone string) (syscall.Sockaddr, error)
```

### <a id="lookupProtocolMap" href="#lookupProtocolMap">func lookupProtocolMap(name string) (int, error)</a>

```
searchKey: net.lookupProtocolMap
```

```Go
func lookupProtocolMap(name string) (int, error)
```

### <a id="lookupPortMap" href="#lookupPortMap">func lookupPortMap(network, service string) (port int, error error)</a>

```
searchKey: net.lookupPortMap
```

```Go
func lookupPortMap(network, service string) (port int, error error)
```

### <a id="ipVersion" href="#ipVersion">func ipVersion(network string) byte</a>

```
searchKey: net.ipVersion
```

```Go
func ipVersion(network string) byte
```

ipVersion returns the provided network's IP version: '4', '6' or 0 if network does not end in a '4' or '6' byte. 

### <a id="LookupHost" href="#LookupHost">func LookupHost(host string) (addrs []string, err error)</a>

```
searchKey: net.LookupHost
tags: [exported]
```

```Go
func LookupHost(host string) (addrs []string, err error)
```

LookupHost looks up the given host using the local resolver. It returns a slice of that host's addresses. 

LookupHost uses context.Background internally; to specify the context, use Resolver.LookupHost. 

### <a id="LookupIP" href="#LookupIP">func LookupIP(host string) ([]IP, error)</a>

```
searchKey: net.LookupIP
tags: [exported]
```

```Go
func LookupIP(host string) ([]IP, error)
```

LookupIP looks up host using the local resolver. It returns a slice of that host's IPv4 and IPv6 addresses. 

### <a id="withUnexpiredValuesPreserved" href="#withUnexpiredValuesPreserved">func withUnexpiredValuesPreserved(lookupCtx context.Context) context.Context</a>

```
searchKey: net.withUnexpiredValuesPreserved
```

```Go
func withUnexpiredValuesPreserved(lookupCtx context.Context) context.Context
```

withUnexpiredValuesPreserved returns a context.Context that only uses lookupCtx for its values, otherwise it is never canceled and has no deadline. If the lookup context expires, any looked up values will return nil. See Issue 28600. 

### <a id="lookupIPReturn" href="#lookupIPReturn">func lookupIPReturn(addrsi interface{}, err error, shared bool) ([]IPAddr, error)</a>

```
searchKey: net.lookupIPReturn
```

```Go
func lookupIPReturn(addrsi interface{}, err error, shared bool) ([]IPAddr, error)
```

lookupIPReturn turns the return values from singleflight.Do into the return values from LookupIP. 

### <a id="ipAddrsEface" href="#ipAddrsEface">func ipAddrsEface(addrs []IPAddr) []interface{}</a>

```
searchKey: net.ipAddrsEface
```

```Go
func ipAddrsEface(addrs []IPAddr) []interface{}
```

ipAddrsEface returns an empty interface slice of addrs. 

### <a id="LookupPort" href="#LookupPort">func LookupPort(network, service string) (port int, err error)</a>

```
searchKey: net.LookupPort
tags: [exported]
```

```Go
func LookupPort(network, service string) (port int, err error)
```

LookupPort looks up the port for the given network and service. 

LookupPort uses context.Background internally; to specify the context, use Resolver.LookupPort. 

### <a id="LookupCNAME" href="#LookupCNAME">func LookupCNAME(host string) (cname string, err error)</a>

```
searchKey: net.LookupCNAME
tags: [exported]
```

```Go
func LookupCNAME(host string) (cname string, err error)
```

LookupCNAME returns the canonical name for the given host. Callers that do not care about the canonical name can call LookupHost or LookupIP directly; both take care of resolving the canonical name as part of the lookup. 

A canonical name is the final name after following zero or more CNAME records. LookupCNAME does not return an error if host does not contain DNS "CNAME" records, as long as host resolves to address records. 

The returned canonical name is validated to be a properly formatted presentation-format domain name. 

LookupCNAME uses context.Background internally; to specify the context, use Resolver.LookupCNAME. 

### <a id="LookupSRV" href="#LookupSRV">func LookupSRV(service, proto, name string) (cname string, addrs []*SRV, err error)</a>

```
searchKey: net.LookupSRV
tags: [exported]
```

```Go
func LookupSRV(service, proto, name string) (cname string, addrs []*SRV, err error)
```

LookupSRV tries to resolve an SRV query of the given service, protocol, and domain name. The proto is "tcp" or "udp". The returned records are sorted by priority and randomized by weight within a priority. 

LookupSRV constructs the DNS name to look up following RFC 2782. That is, it looks up _service._proto.name. To accommodate services publishing SRV records under non-standard names, if both service and proto are empty strings, LookupSRV looks up name directly. 

The returned service names are validated to be properly formatted presentation-format domain names. 

### <a id="LookupMX" href="#LookupMX">func LookupMX(name string) ([]*MX, error)</a>

```
searchKey: net.LookupMX
tags: [exported]
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
tags: [exported]
```

```Go
func LookupNS(name string) ([]*NS, error)
```

LookupNS returns the DNS NS records for the given domain name. 

The returned name server names are validated to be properly formatted presentation-format domain names. 

LookupNS uses context.Background internally; to specify the context, use Resolver.LookupNS. 

### <a id="LookupTXT" href="#LookupTXT">func LookupTXT(name string) ([]string, error)</a>

```
searchKey: net.LookupTXT
tags: [exported]
```

```Go
func LookupTXT(name string) ([]string, error)
```

LookupTXT returns the DNS TXT records for the given domain name. 

LookupTXT uses context.Background internally; to specify the context, use Resolver.LookupTXT. 

### <a id="LookupAddr" href="#LookupAddr">func LookupAddr(addr string) (names []string, err error)</a>

```
searchKey: net.LookupAddr
tags: [exported]
```

```Go
func LookupAddr(addr string) (names []string, err error)
```

LookupAddr performs a reverse lookup for the given address, returning a list of names mapping to that address. 

The returned names are validated to be properly formatted presentation-format domain names. 

When using the host C library resolver, at most one result will be returned. To bypass the host resolver, use a custom Resolver. 

LookupAddr uses context.Background internally; to specify the context, use Resolver.LookupAddr. 

### <a id="readProtocols" href="#readProtocols">func readProtocols()</a>

```
searchKey: net.readProtocols
```

```Go
func readProtocols()
```

readProtocols loads contents of /etc/protocols into protocols map for quick access. 

### <a id="lookupProtocol" href="#lookupProtocol">func lookupProtocol(_ context.Context, name string) (int, error)</a>

```
searchKey: net.lookupProtocol
```

```Go
func lookupProtocol(_ context.Context, name string) (int, error)
```

lookupProtocol looks up IP protocol name in /etc/protocols and returns correspondent protocol number. 

### <a id="concurrentThreadsLimit" href="#concurrentThreadsLimit">func concurrentThreadsLimit() int</a>

```
searchKey: net.concurrentThreadsLimit
```

```Go
func concurrentThreadsLimit() int
```

concurrentThreadsLimit returns the number of threads we permit to run concurrently doing DNS lookups via cgo. A DNS lookup may use a file descriptor so we limit this to less than the number of permitted open files. On some systems, notably Darwin, if getaddrinfo is unable to open a file descriptor it simply returns EAI_NONAME rather than a useful error. Limiting the number of concurrent getaddrinfo calls to less than the permitted number of file descriptors makes that error less likely. We don't bother to apply the same limit to DNS lookups run directly from Go, because there we will return a meaningful "too many open files" error. 

### <a id="listenerBacklog" href="#listenerBacklog">func listenerBacklog() int</a>

```
searchKey: net.listenerBacklog
```

```Go
func listenerBacklog() int
```

listenerBacklog is a caching wrapper around maxListenerBacklog. 

### <a id="mapErr" href="#mapErr">func mapErr(err error) error</a>

```
searchKey: net.mapErr
```

```Go
func mapErr(err error) error
```

mapErr maps from the context errors to the historical internal net error values. 

TODO(bradfitz): get rid of this after adjusting tests and making context.DeadlineExceeded implement net.Error? 

### <a id="genericReadFrom" href="#genericReadFrom">func genericReadFrom(w io.Writer, r io.Reader) (n int64, err error)</a>

```
searchKey: net.genericReadFrom
```

```Go
func genericReadFrom(w io.Writer, r io.Reader) (n int64, err error)
```

Fallback implementation of io.ReaderFrom's ReadFrom, when sendfile isn't applicable. 

### <a id="acquireThread" href="#acquireThread">func acquireThread()</a>

```
searchKey: net.acquireThread
```

```Go
func acquireThread()
```

### <a id="releaseThread" href="#releaseThread">func releaseThread()</a>

```
searchKey: net.releaseThread
```

```Go
func releaseThread()
```

### <a id="parseCriteria" href="#parseCriteria">func parseCriteria(x []byte) (c []nssCriterion, err error)</a>

```
searchKey: net.parseCriteria
```

```Go
func parseCriteria(x []byte) (c []nssCriterion, err error)
```

parses "foo=bar !foo=bar" 

### <a id="stat" href="#stat">func stat(name string) (mtime time.Time, size int64, err error)</a>

```
searchKey: net.stat
```

```Go
func stat(name string) (mtime time.Time, size int64, err error)
```

### <a id="countAnyByte" href="#countAnyByte">func countAnyByte(s string, t string) int</a>

```
searchKey: net.countAnyByte
```

```Go
func countAnyByte(s string, t string) int
```

Count occurrences in s of any bytes in t. 

### <a id="splitAtBytes" href="#splitAtBytes">func splitAtBytes(s string, t string) []string</a>

```
searchKey: net.splitAtBytes
```

```Go
func splitAtBytes(s string, t string) []string
```

Split s at any bytes in t. 

### <a id="getFields" href="#getFields">func getFields(s string) []string</a>

```
searchKey: net.getFields
```

```Go
func getFields(s string) []string
```

### <a id="dtoi" href="#dtoi">func dtoi(s string) (n int, i int, ok bool)</a>

```
searchKey: net.dtoi
```

```Go
func dtoi(s string) (n int, i int, ok bool)
```

Decimal to integer. Returns number, characters consumed, success. 

### <a id="xtoi" href="#xtoi">func xtoi(s string) (n int, i int, ok bool)</a>

```
searchKey: net.xtoi
```

```Go
func xtoi(s string) (n int, i int, ok bool)
```

Hexadecimal to integer. Returns number, characters consumed, success. 

### <a id="xtoi2" href="#xtoi2">func xtoi2(s string, e byte) (byte, bool)</a>

```
searchKey: net.xtoi2
```

```Go
func xtoi2(s string, e byte) (byte, bool)
```

xtoi2 converts the next two hex digits of s into a byte. If s is longer than 2 bytes then the third byte must be e. If the first two bytes of s are not hex digits or the third byte does not match e, false is returned. 

### <a id="appendHex" href="#appendHex">func appendHex(dst []byte, i uint32) []byte</a>

```
searchKey: net.appendHex
```

```Go
func appendHex(dst []byte, i uint32) []byte
```

Convert i to a hexadecimal string. Leading zeros are not printed. 

### <a id="count" href="#count">func count(s string, b byte) int</a>

```
searchKey: net.count
```

```Go
func count(s string, b byte) int
```

Number of occurrences of b in s. 

### <a id="last" href="#last">func last(s string, b byte) int</a>

```
searchKey: net.last
```

```Go
func last(s string, b byte) int
```

Index of rightmost occurrence of b in s. 

### <a id="lowerASCIIBytes" href="#lowerASCIIBytes">func lowerASCIIBytes(x []byte)</a>

```
searchKey: net.lowerASCIIBytes
```

```Go
func lowerASCIIBytes(x []byte)
```

lowerASCIIBytes makes x ASCII lowercase in-place. 

### <a id="lowerASCII" href="#lowerASCII">func lowerASCII(b byte) byte</a>

```
searchKey: net.lowerASCII
```

```Go
func lowerASCII(b byte) byte
```

lowerASCII returns the ASCII lowercase version of b. 

### <a id="trimSpace" href="#trimSpace">func trimSpace(x []byte) []byte</a>

```
searchKey: net.trimSpace
```

```Go
func trimSpace(x []byte) []byte
```

trimSpace returns x without any leading or trailing ASCII whitespace. 

### <a id="isSpace" href="#isSpace">func isSpace(b byte) bool</a>

```
searchKey: net.isSpace
```

```Go
func isSpace(b byte) bool
```

isSpace reports whether b is an ASCII space character. 

### <a id="removeComment" href="#removeComment">func removeComment(line []byte) []byte</a>

```
searchKey: net.removeComment
```

```Go
func removeComment(line []byte) []byte
```

removeComment returns line, removing any '#' byte and any following bytes. 

### <a id="foreachLine" href="#foreachLine">func foreachLine(x []byte, fn func(line []byte) error) error</a>

```
searchKey: net.foreachLine
```

```Go
func foreachLine(x []byte, fn func(line []byte) error) error
```

foreachLine runs fn on each line of x. Each line (except for possibly the last) ends in '\n'. It returns the first non-nil error returned by fn. 

### <a id="foreachField" href="#foreachField">func foreachField(x []byte, fn func(field []byte) error) error</a>

```
searchKey: net.foreachField
```

```Go
func foreachField(x []byte, fn func(field []byte) error) error
```

foreachField runs fn on each non-empty run of non-space bytes in x. It returns the first non-nil error returned by fn. 

### <a id="stringsHasSuffix" href="#stringsHasSuffix">func stringsHasSuffix(s, suffix string) bool</a>

```
searchKey: net.stringsHasSuffix
```

```Go
func stringsHasSuffix(s, suffix string) bool
```

stringsHasSuffix is strings.HasSuffix. It reports whether s ends in suffix. 

### <a id="stringsHasSuffixFold" href="#stringsHasSuffixFold">func stringsHasSuffixFold(s, suffix string) bool</a>

```
searchKey: net.stringsHasSuffixFold
```

```Go
func stringsHasSuffixFold(s, suffix string) bool
```

stringsHasSuffixFold reports whether s ends in suffix, ASCII-case-insensitively. 

### <a id="stringsHasPrefix" href="#stringsHasPrefix">func stringsHasPrefix(s, prefix string) bool</a>

```
searchKey: net.stringsHasPrefix
```

```Go
func stringsHasPrefix(s, prefix string) bool
```

stringsHasPrefix is strings.HasPrefix. It reports whether s begins with prefix. 

### <a id="stringsEqualFold" href="#stringsEqualFold">func stringsEqualFold(s, t string) bool</a>

```
searchKey: net.stringsEqualFold
```

```Go
func stringsEqualFold(s, t string) bool
```

stringsEqualFold is strings.EqualFold, ASCII only. It reports whether s and t are equal, ASCII-case-insensitively. 

### <a id="readFull" href="#readFull">func readFull(r io.Reader) (all []byte, err error)</a>

```
searchKey: net.readFull
```

```Go
func readFull(r io.Reader) (all []byte, err error)
```

### <a id="goDebugString" href="#goDebugString">func goDebugString(key string) string</a>

```
searchKey: net.goDebugString
```

```Go
func goDebugString(key string) string
```

goDebugString returns the value of the named GODEBUG key. GODEBUG is of the form "key=val,key2=val2" 

### <a id="isClosedChan" href="#isClosedChan">func isClosedChan(c <-chan struct{}) bool</a>

```
searchKey: net.isClosedChan
```

```Go
func isClosedChan(c <-chan struct{}) bool
```

### <a id="parsePort" href="#parsePort">func parsePort(service string) (port int, needsLookup bool)</a>

```
searchKey: net.parsePort
```

```Go
func parsePort(service string) (port int, needsLookup bool)
```

parsePort parses service as a decimal integer and returns the corresponding value as port. It is the caller's responsibility to parse service as a non-decimal integer when needsLookup is true. 

Some system resolvers will return a valid port number when given a number over 65536 (see [https://golang.org/issues/11715](https://golang.org/issues/11715)). Alas, the parser can't bail early on numbers > 65536. Therefore reasonably large/small numbers are parsed in full and rejected if invalid. 

### <a id="readServices" href="#readServices">func readServices()</a>

```
searchKey: net.readServices
```

```Go
func readServices()
```

### <a id="goLookupPort" href="#goLookupPort">func goLookupPort(network, service string) (port int, err error)</a>

```
searchKey: net.goLookupPort
```

```Go
func goLookupPort(network, service string) (port int, err error)
```

goLookupPort is the native Go implementation of LookupPort. 

### <a id="sendFile" href="#sendFile">func sendFile(c *netFD, r io.Reader) (n int64, err error, handled bool)</a>

```
searchKey: net.sendFile
```

```Go
func sendFile(c *netFD, r io.Reader) (n int64, err error, handled bool)
```

### <a id="maxListenerBacklog" href="#maxListenerBacklog">func maxListenerBacklog() int</a>

```
searchKey: net.maxListenerBacklog
```

```Go
func maxListenerBacklog() int
```

### <a id="setDefaultSockopts" href="#setDefaultSockopts">func setDefaultSockopts(s, family, sotype int, ipv6only bool) error</a>

```
searchKey: net.setDefaultSockopts
```

```Go
func setDefaultSockopts(s, family, sotype int, ipv6only bool) error
```

### <a id="setDefaultListenerSockopts" href="#setDefaultListenerSockopts">func setDefaultListenerSockopts(s int) error</a>

```
searchKey: net.setDefaultListenerSockopts
```

```Go
func setDefaultListenerSockopts(s int) error
```

### <a id="setDefaultMulticastSockopts" href="#setDefaultMulticastSockopts">func setDefaultMulticastSockopts(s int) error</a>

```
searchKey: net.setDefaultMulticastSockopts
```

```Go
func setDefaultMulticastSockopts(s int) error
```

### <a id="boolint" href="#boolint">func boolint(b bool) int</a>

```
searchKey: net.boolint
```

```Go
func boolint(b bool) int
```

Boolean to int. 

### <a id="setIPv4MreqToInterface" href="#setIPv4MreqToInterface">func setIPv4MreqToInterface(mreq *syscall.IPMreq, ifi *Interface) error</a>

```
searchKey: net.setIPv4MreqToInterface
```

```Go
func setIPv4MreqToInterface(mreq *syscall.IPMreq, ifi *Interface) error
```

### <a id="setReadBuffer" href="#setReadBuffer">func setReadBuffer(fd *netFD, bytes int) error</a>

```
searchKey: net.setReadBuffer
```

```Go
func setReadBuffer(fd *netFD, bytes int) error
```

### <a id="setWriteBuffer" href="#setWriteBuffer">func setWriteBuffer(fd *netFD, bytes int) error</a>

```
searchKey: net.setWriteBuffer
```

```Go
func setWriteBuffer(fd *netFD, bytes int) error
```

### <a id="setKeepAlive" href="#setKeepAlive">func setKeepAlive(fd *netFD, keepalive bool) error</a>

```
searchKey: net.setKeepAlive
```

```Go
func setKeepAlive(fd *netFD, keepalive bool) error
```

### <a id="setLinger" href="#setLinger">func setLinger(fd *netFD, sec int) error</a>

```
searchKey: net.setLinger
```

```Go
func setLinger(fd *netFD, sec int) error
```

### <a id="setIPv4MulticastInterface" href="#setIPv4MulticastInterface">func setIPv4MulticastInterface(fd *netFD, ifi *Interface) error</a>

```
searchKey: net.setIPv4MulticastInterface
```

```Go
func setIPv4MulticastInterface(fd *netFD, ifi *Interface) error
```

### <a id="setIPv4MulticastLoopback" href="#setIPv4MulticastLoopback">func setIPv4MulticastLoopback(fd *netFD, v bool) error</a>

```
searchKey: net.setIPv4MulticastLoopback
```

```Go
func setIPv4MulticastLoopback(fd *netFD, v bool) error
```

### <a id="joinIPv4Group" href="#joinIPv4Group">func joinIPv4Group(fd *netFD, ifi *Interface, ip IP) error</a>

```
searchKey: net.joinIPv4Group
```

```Go
func joinIPv4Group(fd *netFD, ifi *Interface, ip IP) error
```

### <a id="setIPv6MulticastInterface" href="#setIPv6MulticastInterface">func setIPv6MulticastInterface(fd *netFD, ifi *Interface) error</a>

```
searchKey: net.setIPv6MulticastInterface
```

```Go
func setIPv6MulticastInterface(fd *netFD, ifi *Interface) error
```

### <a id="setIPv6MulticastLoopback" href="#setIPv6MulticastLoopback">func setIPv6MulticastLoopback(fd *netFD, v bool) error</a>

```
searchKey: net.setIPv6MulticastLoopback
```

```Go
func setIPv6MulticastLoopback(fd *netFD, v bool) error
```

### <a id="joinIPv6Group" href="#joinIPv6Group">func joinIPv6Group(fd *netFD, ifi *Interface, ip IP) error</a>

```
searchKey: net.joinIPv6Group
```

```Go
func joinIPv6Group(fd *netFD, ifi *Interface, ip IP) error
```

### <a id="splice" href="#splice">func splice(c *netFD, r io.Reader) (int64, error, bool)</a>

```
searchKey: net.splice
```

```Go
func splice(c *netFD, r io.Reader) (int64, error, bool)
```

### <a id="sysSocket" href="#sysSocket">func sysSocket(family, sotype, proto int) (int, error)</a>

```
searchKey: net.sysSocket
```

```Go
func sysSocket(family, sotype, proto int) (int, error)
```

Wrapper around the socket system call that marks the returned file descriptor as nonblocking and close-on-exec. 

### <a id="roundDurationUp" href="#roundDurationUp">func roundDurationUp(d time.Duration, to time.Duration) time.Duration</a>

```
searchKey: net.roundDurationUp
```

```Go
func roundDurationUp(d time.Duration, to time.Duration) time.Duration
```

roundDurationUp rounds d to the next multiple of to. 

### <a id="selfConnect" href="#selfConnect">func selfConnect(fd *netFD, err error) bool</a>

```
searchKey: net.selfConnect
```

```Go
func selfConnect(fd *netFD, err error) bool
```

### <a id="spuriousENOTAVAIL" href="#spuriousENOTAVAIL">func spuriousENOTAVAIL(err error) bool</a>

```
searchKey: net.spuriousENOTAVAIL
```

```Go
func spuriousENOTAVAIL(err error) bool
```

### <a id="setKeepAlivePeriod" href="#setKeepAlivePeriod">func setKeepAlivePeriod(fd *netFD, d time.Duration) error</a>

```
searchKey: net.setKeepAlivePeriod
```

```Go
func setKeepAlivePeriod(fd *netFD, d time.Duration) error
```

### <a id="setNoDelay" href="#setNoDelay">func setNoDelay(fd *netFD, noDelay bool) error</a>

```
searchKey: net.setNoDelay
```

```Go
func setNoDelay(fd *netFD, noDelay bool) error
```

### <a id="listenIPv4MulticastUDP" href="#listenIPv4MulticastUDP">func listenIPv4MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error</a>

```
searchKey: net.listenIPv4MulticastUDP
```

```Go
func listenIPv4MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error
```

### <a id="listenIPv6MulticastUDP" href="#listenIPv6MulticastUDP">func listenIPv6MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error</a>

```
searchKey: net.listenIPv6MulticastUDP
```

```Go
func listenIPv6MulticastUDP(c *UDPConn, ifi *Interface, ip IP) error
```

### <a id="sotypeToNet" href="#sotypeToNet">func sotypeToNet(sotype int) string</a>

```
searchKey: net.sotypeToNet
```

```Go
func sotypeToNet(sotype int) string
```

### <a id="setReadMsgCloseOnExec" href="#setReadMsgCloseOnExec">func setReadMsgCloseOnExec(oob []byte)</a>

```
searchKey: net.setReadMsgCloseOnExec
```

```Go
func setReadMsgCloseOnExec(oob []byte)
```

### <a id="TestSortByRFC6724" href="#TestSortByRFC6724">func TestSortByRFC6724(t *testing.T)</a>

```
searchKey: net.TestSortByRFC6724
```

```Go
func TestSortByRFC6724(t *testing.T)
```

### <a id="TestRFC6724PolicyTableClassify" href="#TestRFC6724PolicyTableClassify">func TestRFC6724PolicyTableClassify(t *testing.T)</a>

```
searchKey: net.TestRFC6724PolicyTableClassify
```

```Go
func TestRFC6724PolicyTableClassify(t *testing.T)
```

### <a id="TestRFC6724ClassifyScope" href="#TestRFC6724ClassifyScope">func TestRFC6724ClassifyScope(t *testing.T)</a>

```
searchKey: net.TestRFC6724ClassifyScope
```

```Go
func TestRFC6724ClassifyScope(t *testing.T)
```

### <a id="TestRFC6724CommonPrefixLength" href="#TestRFC6724CommonPrefixLength">func TestRFC6724CommonPrefixLength(t *testing.T)</a>

```
searchKey: net.TestRFC6724CommonPrefixLength
```

```Go
func TestRFC6724CommonPrefixLength(t *testing.T)
```

### <a id="TestCgoLookupIP" href="#TestCgoLookupIP">func TestCgoLookupIP(t *testing.T)</a>

```
searchKey: net.TestCgoLookupIP
```

```Go
func TestCgoLookupIP(t *testing.T)
```

### <a id="TestCgoLookupIPWithCancel" href="#TestCgoLookupIPWithCancel">func TestCgoLookupIPWithCancel(t *testing.T)</a>

```
searchKey: net.TestCgoLookupIPWithCancel
```

```Go
func TestCgoLookupIPWithCancel(t *testing.T)
```

### <a id="TestCgoLookupPort" href="#TestCgoLookupPort">func TestCgoLookupPort(t *testing.T)</a>

```
searchKey: net.TestCgoLookupPort
```

```Go
func TestCgoLookupPort(t *testing.T)
```

### <a id="TestCgoLookupPortWithCancel" href="#TestCgoLookupPortWithCancel">func TestCgoLookupPortWithCancel(t *testing.T)</a>

```
searchKey: net.TestCgoLookupPortWithCancel
```

```Go
func TestCgoLookupPortWithCancel(t *testing.T)
```

### <a id="TestCgoLookupPTR" href="#TestCgoLookupPTR">func TestCgoLookupPTR(t *testing.T)</a>

```
searchKey: net.TestCgoLookupPTR
```

```Go
func TestCgoLookupPTR(t *testing.T)
```

### <a id="TestCgoLookupPTRWithCancel" href="#TestCgoLookupPTRWithCancel">func TestCgoLookupPTRWithCancel(t *testing.T)</a>

```
searchKey: net.TestCgoLookupPTRWithCancel
```

```Go
func TestCgoLookupPTRWithCancel(t *testing.T)
```

### <a id="TestConfHostLookupOrder" href="#TestConfHostLookupOrder">func TestConfHostLookupOrder(t *testing.T)</a>

```
searchKey: net.TestConfHostLookupOrder
```

```Go
func TestConfHostLookupOrder(t *testing.T)
```

### <a id="TestSystemConf" href="#TestSystemConf">func TestSystemConf(t *testing.T)</a>

```
searchKey: net.TestSystemConf
```

```Go
func TestSystemConf(t *testing.T)
```

### <a id="TestConnAndListener" href="#TestConnAndListener">func TestConnAndListener(t *testing.T)</a>

```
searchKey: net.TestConnAndListener
```

```Go
func TestConnAndListener(t *testing.T)
```

### <a id="TestProhibitionaryDialArg" href="#TestProhibitionaryDialArg">func TestProhibitionaryDialArg(t *testing.T)</a>

```
searchKey: net.TestProhibitionaryDialArg
```

```Go
func TestProhibitionaryDialArg(t *testing.T)
```

### <a id="TestDialLocal" href="#TestDialLocal">func TestDialLocal(t *testing.T)</a>

```
searchKey: net.TestDialLocal
```

```Go
func TestDialLocal(t *testing.T)
```

### <a id="TestDialerDualStackFDLeak" href="#TestDialerDualStackFDLeak">func TestDialerDualStackFDLeak(t *testing.T)</a>

```
searchKey: net.TestDialerDualStackFDLeak
```

```Go
func TestDialerDualStackFDLeak(t *testing.T)
```

### <a id="dialClosedPort" href="#dialClosedPort">func dialClosedPort(t *testing.T) (actual, expected time.Duration)</a>

```
searchKey: net.dialClosedPort
```

```Go
func dialClosedPort(t *testing.T) (actual, expected time.Duration)
```

### <a id="TestDialParallel" href="#TestDialParallel">func TestDialParallel(t *testing.T)</a>

```
searchKey: net.TestDialParallel
```

```Go
func TestDialParallel(t *testing.T)
```

### <a id="lookupSlowFast" href="#lookupSlowFast">func lookupSlowFast(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)</a>

```
searchKey: net.lookupSlowFast
```

```Go
func lookupSlowFast(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)
```

### <a id="TestDialerFallbackDelay" href="#TestDialerFallbackDelay">func TestDialerFallbackDelay(t *testing.T)</a>

```
searchKey: net.TestDialerFallbackDelay
```

```Go
func TestDialerFallbackDelay(t *testing.T)
```

### <a id="TestDialParallelSpuriousConnection" href="#TestDialParallelSpuriousConnection">func TestDialParallelSpuriousConnection(t *testing.T)</a>

```
searchKey: net.TestDialParallelSpuriousConnection
```

```Go
func TestDialParallelSpuriousConnection(t *testing.T)
```

### <a id="TestDialerPartialDeadline" href="#TestDialerPartialDeadline">func TestDialerPartialDeadline(t *testing.T)</a>

```
searchKey: net.TestDialerPartialDeadline
```

```Go
func TestDialerPartialDeadline(t *testing.T)
```

### <a id="TestDialerLocalAddr" href="#TestDialerLocalAddr">func TestDialerLocalAddr(t *testing.T)</a>

```
searchKey: net.TestDialerLocalAddr
```

```Go
func TestDialerLocalAddr(t *testing.T)
```

### <a id="TestDialerDualStack" href="#TestDialerDualStack">func TestDialerDualStack(t *testing.T)</a>

```
searchKey: net.TestDialerDualStack
```

```Go
func TestDialerDualStack(t *testing.T)
```

### <a id="TestDialerKeepAlive" href="#TestDialerKeepAlive">func TestDialerKeepAlive(t *testing.T)</a>

```
searchKey: net.TestDialerKeepAlive
```

```Go
func TestDialerKeepAlive(t *testing.T)
```

### <a id="TestDialCancel" href="#TestDialCancel">func TestDialCancel(t *testing.T)</a>

```
searchKey: net.TestDialCancel
```

```Go
func TestDialCancel(t *testing.T)
```

### <a id="TestCancelAfterDial" href="#TestCancelAfterDial">func TestCancelAfterDial(t *testing.T)</a>

```
searchKey: net.TestCancelAfterDial
```

```Go
func TestCancelAfterDial(t *testing.T)
```

### <a id="TestDialListenerAddr" href="#TestDialListenerAddr">func TestDialListenerAddr(t *testing.T)</a>

```
searchKey: net.TestDialListenerAddr
```

```Go
func TestDialListenerAddr(t *testing.T)
```

Issue 18806: it should always be possible to net.Dial a net.Listener().Addr().String when the listen address was ":n", even if the machine has halfway configured IPv6 such that it can bind on "::" not connect back to that same address. 

### <a id="TestDialerControl" href="#TestDialerControl">func TestDialerControl(t *testing.T)</a>

```
searchKey: net.TestDialerControl
```

```Go
func TestDialerControl(t *testing.T)
```

### <a id="mustHaveExternalNetwork" href="#mustHaveExternalNetwork">func mustHaveExternalNetwork(t *testing.T)</a>

```
searchKey: net.mustHaveExternalNetwork
```

```Go
func mustHaveExternalNetwork(t *testing.T)
```

mustHaveExternalNetwork is like testenv.MustHaveExternalNetwork except that it won't skip testing on non-mobile builders. 

### <a id="TestDialWithNonZeroDeadline" href="#TestDialWithNonZeroDeadline">func TestDialWithNonZeroDeadline(t *testing.T)</a>

```
searchKey: net.TestDialWithNonZeroDeadline
```

```Go
func TestDialWithNonZeroDeadline(t *testing.T)
```

### <a id="TestDialContextCancelRace" href="#TestDialContextCancelRace">func TestDialContextCancelRace(t *testing.T)</a>

```
searchKey: net.TestDialContextCancelRace
```

```Go
func TestDialContextCancelRace(t *testing.T)
```

Issue 16523 

### <a id="checkDistribution" href="#checkDistribution">func checkDistribution(t *testing.T, data []*SRV, margin float64)</a>

```
searchKey: net.checkDistribution
```

```Go
func checkDistribution(t *testing.T, data []*SRV, margin float64)
```

### <a id="testUniformity" href="#testUniformity">func testUniformity(t *testing.T, size int, margin float64)</a>

```
searchKey: net.testUniformity
```

```Go
func testUniformity(t *testing.T, size int, margin float64)
```

### <a id="TestDNSSRVUniformity" href="#TestDNSSRVUniformity">func TestDNSSRVUniformity(t *testing.T)</a>

```
searchKey: net.TestDNSSRVUniformity
```

```Go
func TestDNSSRVUniformity(t *testing.T)
```

### <a id="testWeighting" href="#testWeighting">func testWeighting(t *testing.T, margin float64)</a>

```
searchKey: net.testWeighting
```

```Go
func testWeighting(t *testing.T, margin float64)
```

### <a id="TestWeighting" href="#TestWeighting">func TestWeighting(t *testing.T)</a>

```
searchKey: net.TestWeighting
```

```Go
func TestWeighting(t *testing.T)
```

### <a id="mustNewName" href="#mustNewName">func mustNewName(name string) dnsmessage.Name</a>

```
searchKey: net.mustNewName
```

```Go
func mustNewName(name string) dnsmessage.Name
```

### <a id="mustQuestion" href="#mustQuestion">func mustQuestion(name string, qtype dnsmessage.Type, class dnsmessage.Class) dnsmessage.Question</a>

```
searchKey: net.mustQuestion
```

```Go
func mustQuestion(name string, qtype dnsmessage.Type, class dnsmessage.Class) dnsmessage.Question
```

### <a id="TestDNSTransportFallback" href="#TestDNSTransportFallback">func TestDNSTransportFallback(t *testing.T)</a>

```
searchKey: net.TestDNSTransportFallback
```

```Go
func TestDNSTransportFallback(t *testing.T)
```

### <a id="TestSpecialDomainName" href="#TestSpecialDomainName">func TestSpecialDomainName(t *testing.T)</a>

```
searchKey: net.TestSpecialDomainName
```

```Go
func TestSpecialDomainName(t *testing.T)
```

### <a id="TestAvoidDNSName" href="#TestAvoidDNSName">func TestAvoidDNSName(t *testing.T)</a>

```
searchKey: net.TestAvoidDNSName
```

```Go
func TestAvoidDNSName(t *testing.T)
```

Issue 13705: don't try to resolve onion addresses, etc 

### <a id="TestLookupTorOnion" href="#TestLookupTorOnion">func TestLookupTorOnion(t *testing.T)</a>

```
searchKey: net.TestLookupTorOnion
```

```Go
func TestLookupTorOnion(t *testing.T)
```

Issue 13705: don't try to resolve onion addresses, etc 

### <a id="TestUpdateResolvConf" href="#TestUpdateResolvConf">func TestUpdateResolvConf(t *testing.T)</a>

```
searchKey: net.TestUpdateResolvConf
```

```Go
func TestUpdateResolvConf(t *testing.T)
```

### <a id="TestGoLookupIPWithResolverConfig" href="#TestGoLookupIPWithResolverConfig">func TestGoLookupIPWithResolverConfig(t *testing.T)</a>

```
searchKey: net.TestGoLookupIPWithResolverConfig
```

```Go
func TestGoLookupIPWithResolverConfig(t *testing.T)
```

### <a id="TestGoLookupIPOrderFallbackToFile" href="#TestGoLookupIPOrderFallbackToFile">func TestGoLookupIPOrderFallbackToFile(t *testing.T)</a>

```
searchKey: net.TestGoLookupIPOrderFallbackToFile
```

```Go
func TestGoLookupIPOrderFallbackToFile(t *testing.T)
```

Test that goLookupIPOrder falls back to the host file when no DNS servers are available. 

### <a id="TestErrorForOriginalNameWhenSearching" href="#TestErrorForOriginalNameWhenSearching">func TestErrorForOriginalNameWhenSearching(t *testing.T)</a>

```
searchKey: net.TestErrorForOriginalNameWhenSearching
```

```Go
func TestErrorForOriginalNameWhenSearching(t *testing.T)
```

Issue 12712. When using search domains, return the error encountered querying the original name instead of an error encountered querying a generated name. 

### <a id="TestIgnoreLameReferrals" href="#TestIgnoreLameReferrals">func TestIgnoreLameReferrals(t *testing.T)</a>

```
searchKey: net.TestIgnoreLameReferrals
```

```Go
func TestIgnoreLameReferrals(t *testing.T)
```

Issue 15434. If a name server gives a lame referral, continue to the next. 

### <a id="BenchmarkGoLookupIP" href="#BenchmarkGoLookupIP">func BenchmarkGoLookupIP(b *testing.B)</a>

```
searchKey: net.BenchmarkGoLookupIP
```

```Go
func BenchmarkGoLookupIP(b *testing.B)
```

### <a id="BenchmarkGoLookupIPNoSuchHost" href="#BenchmarkGoLookupIPNoSuchHost">func BenchmarkGoLookupIPNoSuchHost(b *testing.B)</a>

```
searchKey: net.BenchmarkGoLookupIPNoSuchHost
```

```Go
func BenchmarkGoLookupIPNoSuchHost(b *testing.B)
```

### <a id="BenchmarkGoLookupIPWithBrokenNameServer" href="#BenchmarkGoLookupIPWithBrokenNameServer">func BenchmarkGoLookupIPWithBrokenNameServer(b *testing.B)</a>

```
searchKey: net.BenchmarkGoLookupIPWithBrokenNameServer
```

```Go
func BenchmarkGoLookupIPWithBrokenNameServer(b *testing.B)
```

### <a id="TestIgnoreDNSForgeries" href="#TestIgnoreDNSForgeries">func TestIgnoreDNSForgeries(t *testing.T)</a>

```
searchKey: net.TestIgnoreDNSForgeries
```

```Go
func TestIgnoreDNSForgeries(t *testing.T)
```

UDP round-tripper algorithm should ignore invalid DNS responses (issue 13281). 

### <a id="TestRetryTimeout" href="#TestRetryTimeout">func TestRetryTimeout(t *testing.T)</a>

```
searchKey: net.TestRetryTimeout
```

```Go
func TestRetryTimeout(t *testing.T)
```

Issue 16865. If a name server times out, continue to the next. 

### <a id="TestRotate" href="#TestRotate">func TestRotate(t *testing.T)</a>

```
searchKey: net.TestRotate
```

```Go
func TestRotate(t *testing.T)
```

### <a id="testRotate" href="#testRotate">func testRotate(t *testing.T, rotate bool, nameservers, wantServers []string)</a>

```
searchKey: net.testRotate
```

```Go
func testRotate(t *testing.T, rotate bool, nameservers, wantServers []string)
```

### <a id="mockTXTResponse" href="#mockTXTResponse">func mockTXTResponse(q dnsmessage.Message) dnsmessage.Message</a>

```
searchKey: net.mockTXTResponse
```

```Go
func mockTXTResponse(q dnsmessage.Message) dnsmessage.Message
```

### <a id="TestStrictErrorsLookupIP" href="#TestStrictErrorsLookupIP">func TestStrictErrorsLookupIP(t *testing.T)</a>

```
searchKey: net.TestStrictErrorsLookupIP
```

```Go
func TestStrictErrorsLookupIP(t *testing.T)
```

Issue 17448. With StrictErrors enabled, temporary errors should make LookupIP fail rather than return a partial result. 

### <a id="TestStrictErrorsLookupTXT" href="#TestStrictErrorsLookupTXT">func TestStrictErrorsLookupTXT(t *testing.T)</a>

```
searchKey: net.TestStrictErrorsLookupTXT
```

```Go
func TestStrictErrorsLookupTXT(t *testing.T)
```

Issue 17448. With StrictErrors enabled, temporary errors should make LookupTXT stop walking the search list. 

### <a id="TestDNSGoroutineRace" href="#TestDNSGoroutineRace">func TestDNSGoroutineRace(t *testing.T)</a>

```
searchKey: net.TestDNSGoroutineRace
```

```Go
func TestDNSGoroutineRace(t *testing.T)
```

Test for a race between uninstalling the test hooks and closing a socket connection. This used to fail when testing with -race. 

### <a id="lookupWithFake" href="#lookupWithFake">func lookupWithFake(fake fakeDNSServer, name string, typ dnsmessage.Type) error</a>

```
searchKey: net.lookupWithFake
```

```Go
func lookupWithFake(fake fakeDNSServer, name string, typ dnsmessage.Type) error
```

### <a id="TestIssue8434" href="#TestIssue8434">func TestIssue8434(t *testing.T)</a>

```
searchKey: net.TestIssue8434
```

```Go
func TestIssue8434(t *testing.T)
```

Issue 8434: verify that Temporary returns true on an error when rcode is SERVFAIL 

### <a id="TestIssueNoSuchHostExists" href="#TestIssueNoSuchHostExists">func TestIssueNoSuchHostExists(t *testing.T)</a>

```
searchKey: net.TestIssueNoSuchHostExists
```

```Go
func TestIssueNoSuchHostExists(t *testing.T)
```

### <a id="TestNoSuchHost" href="#TestNoSuchHost">func TestNoSuchHost(t *testing.T)</a>

```
searchKey: net.TestNoSuchHost
```

```Go
func TestNoSuchHost(t *testing.T)
```

TestNoSuchHost verifies that tryOneName works correctly when the domain does not exist. 

Issue 12778: verify that NXDOMAIN without RA bit errors as "no such host" and not "server misbehaving" 

Issue 25336: verify that NXDOMAIN errors fail fast. 

Issue 27525: verify that empty answers fail fast. 

### <a id="TestDNSDialTCP" href="#TestDNSDialTCP">func TestDNSDialTCP(t *testing.T)</a>

```
searchKey: net.TestDNSDialTCP
```

```Go
func TestDNSDialTCP(t *testing.T)
```

Issue 26573: verify that Conns that don't implement PacketConn are treated as streams even when udp was requested. 

### <a id="TestTXTRecordTwoStrings" href="#TestTXTRecordTwoStrings">func TestTXTRecordTwoStrings(t *testing.T)</a>

```
searchKey: net.TestTXTRecordTwoStrings
```

```Go
func TestTXTRecordTwoStrings(t *testing.T)
```

Issue 27763: verify that two strings in one TXT record are concatenated. 

### <a id="TestSingleRequestLookup" href="#TestSingleRequestLookup">func TestSingleRequestLookup(t *testing.T)</a>

```
searchKey: net.TestSingleRequestLookup
```

```Go
func TestSingleRequestLookup(t *testing.T)
```

Issue 29644: support single-request resolv.conf option in pure Go resolver. The A and AAAA queries will be sent sequentially, not in parallel. 

### <a id="TestDNSUseTCP" href="#TestDNSUseTCP">func TestDNSUseTCP(t *testing.T)</a>

```
searchKey: net.TestDNSUseTCP
```

```Go
func TestDNSUseTCP(t *testing.T)
```

Issue 29358. Add configuration knob to force TCP-only DNS requests in the pure Go resolver. 

### <a id="TestPTRandNonPTR" href="#TestPTRandNonPTR">func TestPTRandNonPTR(t *testing.T)</a>

```
searchKey: net.TestPTRandNonPTR
```

```Go
func TestPTRandNonPTR(t *testing.T)
```

Issue 34660: PTR response with non-PTR answers should ignore non-PTR 

### <a id="TestCVE202133195" href="#TestCVE202133195">func TestCVE202133195(t *testing.T)</a>

```
searchKey: net.TestCVE202133195
```

```Go
func TestCVE202133195(t *testing.T)
```

### <a id="TestDNSReadConfig" href="#TestDNSReadConfig">func TestDNSReadConfig(t *testing.T)</a>

```
searchKey: net.TestDNSReadConfig
```

```Go
func TestDNSReadConfig(t *testing.T)
```

### <a id="TestDNSReadMissingFile" href="#TestDNSReadMissingFile">func TestDNSReadMissingFile(t *testing.T)</a>

```
searchKey: net.TestDNSReadMissingFile
```

```Go
func TestDNSReadMissingFile(t *testing.T)
```

### <a id="TestDNSDefaultSearch" href="#TestDNSDefaultSearch">func TestDNSDefaultSearch(t *testing.T)</a>

```
searchKey: net.TestDNSDefaultSearch
```

```Go
func TestDNSDefaultSearch(t *testing.T)
```

### <a id="TestDNSNameLength" href="#TestDNSNameLength">func TestDNSNameLength(t *testing.T)</a>

```
searchKey: net.TestDNSNameLength
```

```Go
func TestDNSNameLength(t *testing.T)
```

### <a id="emitDNSNameTest" href="#emitDNSNameTest">func emitDNSNameTest(ch chan<- dnsNameTest)</a>

```
searchKey: net.emitDNSNameTest
```

```Go
func emitDNSNameTest(ch chan<- dnsNameTest)
```

### <a id="TestDNSName" href="#TestDNSName">func TestDNSName(t *testing.T)</a>

```
searchKey: net.TestDNSName
```

```Go
func TestDNSName(t *testing.T)
```

### <a id="BenchmarkDNSName" href="#BenchmarkDNSName">func BenchmarkDNSName(b *testing.B)</a>

```
searchKey: net.BenchmarkDNSName
```

```Go
func BenchmarkDNSName(b *testing.B)
```

### <a id="TestSpuriousENOTAVAIL" href="#TestSpuriousENOTAVAIL">func TestSpuriousENOTAVAIL(t *testing.T)</a>

```
searchKey: net.TestSpuriousENOTAVAIL
```

```Go
func TestSpuriousENOTAVAIL(t *testing.T)
```

### <a id="parseDialError" href="#parseDialError">func parseDialError(nestedErr error) error</a>

```
searchKey: net.parseDialError
```

```Go
func parseDialError(nestedErr error) error
```

parseDialError parses nestedErr and reports whether it is a valid error value from Dial, Listen functions. It returns nil when nestedErr is valid. 

### <a id="TestDialError" href="#TestDialError">func TestDialError(t *testing.T)</a>

```
searchKey: net.TestDialError
```

```Go
func TestDialError(t *testing.T)
```

### <a id="TestProtocolDialError" href="#TestProtocolDialError">func TestProtocolDialError(t *testing.T)</a>

```
searchKey: net.TestProtocolDialError
```

```Go
func TestProtocolDialError(t *testing.T)
```

### <a id="TestDialAddrError" href="#TestDialAddrError">func TestDialAddrError(t *testing.T)</a>

```
searchKey: net.TestDialAddrError
```

```Go
func TestDialAddrError(t *testing.T)
```

### <a id="TestListenError" href="#TestListenError">func TestListenError(t *testing.T)</a>

```
searchKey: net.TestListenError
```

```Go
func TestListenError(t *testing.T)
```

### <a id="TestListenPacketError" href="#TestListenPacketError">func TestListenPacketError(t *testing.T)</a>

```
searchKey: net.TestListenPacketError
```

```Go
func TestListenPacketError(t *testing.T)
```

### <a id="TestProtocolListenError" href="#TestProtocolListenError">func TestProtocolListenError(t *testing.T)</a>

```
searchKey: net.TestProtocolListenError
```

```Go
func TestProtocolListenError(t *testing.T)
```

### <a id="parseReadError" href="#parseReadError">func parseReadError(nestedErr error) error</a>

```
searchKey: net.parseReadError
```

```Go
func parseReadError(nestedErr error) error
```

parseReadError parses nestedErr and reports whether it is a valid error value from Read functions. It returns nil when nestedErr is valid. 

### <a id="parseWriteError" href="#parseWriteError">func parseWriteError(nestedErr error) error</a>

```
searchKey: net.parseWriteError
```

```Go
func parseWriteError(nestedErr error) error
```

parseWriteError parses nestedErr and reports whether it is a valid error value from Write functions. It returns nil when nestedErr is valid. 

### <a id="parseCloseError" href="#parseCloseError">func parseCloseError(nestedErr error, isShutdown bool) error</a>

```
searchKey: net.parseCloseError
```

```Go
func parseCloseError(nestedErr error, isShutdown bool) error
```

parseCloseError parses nestedErr and reports whether it is a valid error value from Close functions. It returns nil when nestedErr is valid. 

### <a id="TestCloseError" href="#TestCloseError">func TestCloseError(t *testing.T)</a>

```
searchKey: net.TestCloseError
```

```Go
func TestCloseError(t *testing.T)
```

### <a id="parseAcceptError" href="#parseAcceptError">func parseAcceptError(nestedErr error) error</a>

```
searchKey: net.parseAcceptError
```

```Go
func parseAcceptError(nestedErr error) error
```

parseAcceptError parses nestedErr and reports whether it is a valid error value from Accept functions. It returns nil when nestedErr is valid. 

### <a id="TestAcceptError" href="#TestAcceptError">func TestAcceptError(t *testing.T)</a>

```
searchKey: net.TestAcceptError
```

```Go
func TestAcceptError(t *testing.T)
```

### <a id="parseCommonError" href="#parseCommonError">func parseCommonError(nestedErr error) error</a>

```
searchKey: net.parseCommonError
```

```Go
func parseCommonError(nestedErr error) error
```

parseCommonError parses nestedErr and reports whether it is a valid error value from miscellaneous functions. It returns nil when nestedErr is valid. 

### <a id="TestFileError" href="#TestFileError">func TestFileError(t *testing.T)</a>

```
searchKey: net.TestFileError
```

```Go
func TestFileError(t *testing.T)
```

### <a id="parseLookupPortError" href="#parseLookupPortError">func parseLookupPortError(nestedErr error) error</a>

```
searchKey: net.parseLookupPortError
```

```Go
func parseLookupPortError(nestedErr error) error
```

### <a id="isPlatformError" href="#isPlatformError">func isPlatformError(err error) bool</a>

```
searchKey: net.isPlatformError
```

```Go
func isPlatformError(err error) bool
```

### <a id="samePlatformError" href="#samePlatformError">func samePlatformError(err, want error) bool</a>

```
searchKey: net.samePlatformError
```

```Go
func samePlatformError(err, want error) bool
```

### <a id="TestResolveGoogle" href="#TestResolveGoogle">func TestResolveGoogle(t *testing.T)</a>

```
searchKey: net.TestResolveGoogle
```

```Go
func TestResolveGoogle(t *testing.T)
```

### <a id="TestDialGoogle" href="#TestDialGoogle">func TestDialGoogle(t *testing.T)</a>

```
searchKey: net.TestDialGoogle
```

```Go
func TestDialGoogle(t *testing.T)
```

### <a id="googleLiteralAddrs" href="#googleLiteralAddrs">func googleLiteralAddrs() (lits4, lits6 []string, err error)</a>

```
searchKey: net.googleLiteralAddrs
```

```Go
func googleLiteralAddrs() (lits4, lits6 []string, err error)
```

### <a id="fetchGoogle" href="#fetchGoogle">func fetchGoogle(dial func(string, string) (Conn, error), network, address string) error</a>

```
searchKey: net.fetchGoogle
```

```Go
func fetchGoogle(dial func(string, string) (Conn, error), network, address string) error
```

### <a id="fcntl" href="#fcntl">func fcntl(fd int, cmd int, arg int) (int, error)</a>

```
searchKey: net.fcntl
```

```Go
func fcntl(fd int, cmd int, arg int) (int, error)
```

Implemented in the syscall package. 

### <a id="TestFileConn" href="#TestFileConn">func TestFileConn(t *testing.T)</a>

```
searchKey: net.TestFileConn
```

```Go
func TestFileConn(t *testing.T)
```

### <a id="TestFileListener" href="#TestFileListener">func TestFileListener(t *testing.T)</a>

```
searchKey: net.TestFileListener
```

```Go
func TestFileListener(t *testing.T)
```

### <a id="TestFilePacketConn" href="#TestFilePacketConn">func TestFilePacketConn(t *testing.T)</a>

```
searchKey: net.TestFilePacketConn
```

```Go
func TestFilePacketConn(t *testing.T)
```

### <a id="TestFileCloseRace" href="#TestFileCloseRace">func TestFileCloseRace(t *testing.T)</a>

```
searchKey: net.TestFileCloseRace
```

```Go
func TestFileCloseRace(t *testing.T)
```

Issue 24483. 

### <a id="TestLookupStaticHost" href="#TestLookupStaticHost">func TestLookupStaticHost(t *testing.T)</a>

```
searchKey: net.TestLookupStaticHost
```

```Go
func TestLookupStaticHost(t *testing.T)
```

### <a id="testStaticHost" href="#testStaticHost">func testStaticHost(t *testing.T, hostsPath string, ent staticHostEntry)</a>

```
searchKey: net.testStaticHost
```

```Go
func testStaticHost(t *testing.T, hostsPath string, ent staticHostEntry)
```

### <a id="TestLookupStaticAddr" href="#TestLookupStaticAddr">func TestLookupStaticAddr(t *testing.T)</a>

```
searchKey: net.TestLookupStaticAddr
```

```Go
func TestLookupStaticAddr(t *testing.T)
```

### <a id="testStaticAddr" href="#testStaticAddr">func testStaticAddr(t *testing.T, hostsPath string, ent staticHostEntry)</a>

```
searchKey: net.testStaticAddr
```

```Go
func testStaticAddr(t *testing.T, hostsPath string, ent staticHostEntry)
```

### <a id="TestHostCacheModification" href="#TestHostCacheModification">func TestHostCacheModification(t *testing.T)</a>

```
searchKey: net.TestHostCacheModification
```

```Go
func TestHostCacheModification(t *testing.T)
```

### <a id="ipv6LinkLocalUnicastAddr" href="#ipv6LinkLocalUnicastAddr">func ipv6LinkLocalUnicastAddr(ifi *Interface) string</a>

```
searchKey: net.ipv6LinkLocalUnicastAddr
```

```Go
func ipv6LinkLocalUnicastAddr(ifi *Interface) string
```

ipv6LinkLocalUnicastAddr returns an IPv6 link-local unicast address on the given network interface for tests. It returns "" if no suitable address is found. 

### <a id="TestInterfaces" href="#TestInterfaces">func TestInterfaces(t *testing.T)</a>

```
searchKey: net.TestInterfaces
```

```Go
func TestInterfaces(t *testing.T)
```

### <a id="TestInterfaceAddrs" href="#TestInterfaceAddrs">func TestInterfaceAddrs(t *testing.T)</a>

```
searchKey: net.TestInterfaceAddrs
```

```Go
func TestInterfaceAddrs(t *testing.T)
```

### <a id="TestInterfaceUnicastAddrs" href="#TestInterfaceUnicastAddrs">func TestInterfaceUnicastAddrs(t *testing.T)</a>

```
searchKey: net.TestInterfaceUnicastAddrs
```

```Go
func TestInterfaceUnicastAddrs(t *testing.T)
```

### <a id="TestInterfaceMulticastAddrs" href="#TestInterfaceMulticastAddrs">func TestInterfaceMulticastAddrs(t *testing.T)</a>

```
searchKey: net.TestInterfaceMulticastAddrs
```

```Go
func TestInterfaceMulticastAddrs(t *testing.T)
```

### <a id="checkUnicastStats" href="#checkUnicastStats">func checkUnicastStats(ifStats *ifStats, uniStats *routeStats) error</a>

```
searchKey: net.checkUnicastStats
```

```Go
func checkUnicastStats(ifStats *ifStats, uniStats *routeStats) error
```

### <a id="checkMulticastStats" href="#checkMulticastStats">func checkMulticastStats(ifStats *ifStats, uniStats, multiStats *routeStats) error</a>

```
searchKey: net.checkMulticastStats
```

```Go
func checkMulticastStats(ifStats *ifStats, uniStats, multiStats *routeStats) error
```

### <a id="BenchmarkInterfaces" href="#BenchmarkInterfaces">func BenchmarkInterfaces(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfaces
```

```Go
func BenchmarkInterfaces(b *testing.B)
```

### <a id="BenchmarkInterfaceByIndex" href="#BenchmarkInterfaceByIndex">func BenchmarkInterfaceByIndex(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfaceByIndex
```

```Go
func BenchmarkInterfaceByIndex(b *testing.B)
```

### <a id="BenchmarkInterfaceByName" href="#BenchmarkInterfaceByName">func BenchmarkInterfaceByName(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfaceByName
```

```Go
func BenchmarkInterfaceByName(b *testing.B)
```

### <a id="BenchmarkInterfaceAddrs" href="#BenchmarkInterfaceAddrs">func BenchmarkInterfaceAddrs(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfaceAddrs
```

```Go
func BenchmarkInterfaceAddrs(b *testing.B)
```

### <a id="BenchmarkInterfacesAndAddrs" href="#BenchmarkInterfacesAndAddrs">func BenchmarkInterfacesAndAddrs(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfacesAndAddrs
```

```Go
func BenchmarkInterfacesAndAddrs(b *testing.B)
```

### <a id="BenchmarkInterfacesAndMulticastAddrs" href="#BenchmarkInterfacesAndMulticastAddrs">func BenchmarkInterfacesAndMulticastAddrs(b *testing.B)</a>

```
searchKey: net.BenchmarkInterfacesAndMulticastAddrs
```

```Go
func BenchmarkInterfacesAndMulticastAddrs(b *testing.B)
```

### <a id="TestPointToPointInterface" href="#TestPointToPointInterface">func TestPointToPointInterface(t *testing.T)</a>

```
searchKey: net.TestPointToPointInterface
```

```Go
func TestPointToPointInterface(t *testing.T)
```

### <a id="TestInterfaceArrivalAndDeparture" href="#TestInterfaceArrivalAndDeparture">func TestInterfaceArrivalAndDeparture(t *testing.T)</a>

```
searchKey: net.TestInterfaceArrivalAndDeparture
```

```Go
func TestInterfaceArrivalAndDeparture(t *testing.T)
```

### <a id="TestInterfaceArrivalAndDepartureZoneCache" href="#TestInterfaceArrivalAndDepartureZoneCache">func TestInterfaceArrivalAndDepartureZoneCache(t *testing.T)</a>

```
searchKey: net.TestInterfaceArrivalAndDepartureZoneCache
```

```Go
func TestInterfaceArrivalAndDepartureZoneCache(t *testing.T)
```

### <a id="TestParseIP" href="#TestParseIP">func TestParseIP(t *testing.T)</a>

```
searchKey: net.TestParseIP
```

```Go
func TestParseIP(t *testing.T)
```

### <a id="TestLookupWithIP" href="#TestLookupWithIP">func TestLookupWithIP(t *testing.T)</a>

```
searchKey: net.TestLookupWithIP
```

```Go
func TestLookupWithIP(t *testing.T)
```

### <a id="BenchmarkParseIP" href="#BenchmarkParseIP">func BenchmarkParseIP(b *testing.B)</a>

```
searchKey: net.BenchmarkParseIP
```

```Go
func BenchmarkParseIP(b *testing.B)
```

### <a id="TestMarshalEmptyIP" href="#TestMarshalEmptyIP">func TestMarshalEmptyIP(t *testing.T)</a>

```
searchKey: net.TestMarshalEmptyIP
```

```Go
func TestMarshalEmptyIP(t *testing.T)
```

Issue 6339 

### <a id="TestIPString" href="#TestIPString">func TestIPString(t *testing.T)</a>

```
searchKey: net.TestIPString
```

```Go
func TestIPString(t *testing.T)
```

### <a id="BenchmarkIPString" href="#BenchmarkIPString">func BenchmarkIPString(b *testing.B)</a>

```
searchKey: net.BenchmarkIPString
```

```Go
func BenchmarkIPString(b *testing.B)
```

### <a id="benchmarkIPString" href="#benchmarkIPString">func benchmarkIPString(b *testing.B, size int)</a>

```
searchKey: net.benchmarkIPString
```

```Go
func benchmarkIPString(b *testing.B, size int)
```

### <a id="TestIPMask" href="#TestIPMask">func TestIPMask(t *testing.T)</a>

```
searchKey: net.TestIPMask
```

```Go
func TestIPMask(t *testing.T)
```

### <a id="TestIPMaskString" href="#TestIPMaskString">func TestIPMaskString(t *testing.T)</a>

```
searchKey: net.TestIPMaskString
```

```Go
func TestIPMaskString(t *testing.T)
```

### <a id="BenchmarkIPMaskString" href="#BenchmarkIPMaskString">func BenchmarkIPMaskString(b *testing.B)</a>

```
searchKey: net.BenchmarkIPMaskString
```

```Go
func BenchmarkIPMaskString(b *testing.B)
```

### <a id="TestParseCIDR" href="#TestParseCIDR">func TestParseCIDR(t *testing.T)</a>

```
searchKey: net.TestParseCIDR
```

```Go
func TestParseCIDR(t *testing.T)
```

### <a id="TestIPNetContains" href="#TestIPNetContains">func TestIPNetContains(t *testing.T)</a>

```
searchKey: net.TestIPNetContains
```

```Go
func TestIPNetContains(t *testing.T)
```

### <a id="TestIPNetString" href="#TestIPNetString">func TestIPNetString(t *testing.T)</a>

```
searchKey: net.TestIPNetString
```

```Go
func TestIPNetString(t *testing.T)
```

### <a id="TestCIDRMask" href="#TestCIDRMask">func TestCIDRMask(t *testing.T)</a>

```
searchKey: net.TestCIDRMask
```

```Go
func TestCIDRMask(t *testing.T)
```

### <a id="TestNetworkNumberAndMask" href="#TestNetworkNumberAndMask">func TestNetworkNumberAndMask(t *testing.T)</a>

```
searchKey: net.TestNetworkNumberAndMask
```

```Go
func TestNetworkNumberAndMask(t *testing.T)
```

### <a id="TestSplitHostPort" href="#TestSplitHostPort">func TestSplitHostPort(t *testing.T)</a>

```
searchKey: net.TestSplitHostPort
```

```Go
func TestSplitHostPort(t *testing.T)
```

### <a id="TestJoinHostPort" href="#TestJoinHostPort">func TestJoinHostPort(t *testing.T)</a>

```
searchKey: net.TestJoinHostPort
```

```Go
func TestJoinHostPort(t *testing.T)
```

### <a id="TestIPAddrFamily" href="#TestIPAddrFamily">func TestIPAddrFamily(t *testing.T)</a>

```
searchKey: net.TestIPAddrFamily
```

```Go
func TestIPAddrFamily(t *testing.T)
```

### <a id="name" href="#name">func name(f interface{}) string</a>

```
searchKey: net.name
```

```Go
func name(f interface{}) string
```

### <a id="TestIPAddrScope" href="#TestIPAddrScope">func TestIPAddrScope(t *testing.T)</a>

```
searchKey: net.TestIPAddrScope
```

```Go
func TestIPAddrScope(t *testing.T)
```

### <a id="BenchmarkIPEqual" href="#BenchmarkIPEqual">func BenchmarkIPEqual(b *testing.B)</a>

```
searchKey: net.BenchmarkIPEqual
```

```Go
func BenchmarkIPEqual(b *testing.B)
```

### <a id="benchmarkIPEqual" href="#benchmarkIPEqual">func benchmarkIPEqual(b *testing.B, size int)</a>

```
searchKey: net.benchmarkIPEqual
```

```Go
func benchmarkIPEqual(b *testing.B, size int)
```

### <a id="TestResolveIPAddr" href="#TestResolveIPAddr">func TestResolveIPAddr(t *testing.T)</a>

```
searchKey: net.TestResolveIPAddr
```

```Go
func TestResolveIPAddr(t *testing.T)
```

### <a id="TestIPConnLocalName" href="#TestIPConnLocalName">func TestIPConnLocalName(t *testing.T)</a>

```
searchKey: net.TestIPConnLocalName
```

```Go
func TestIPConnLocalName(t *testing.T)
```

### <a id="TestIPConnRemoteName" href="#TestIPConnRemoteName">func TestIPConnRemoteName(t *testing.T)</a>

```
searchKey: net.TestIPConnRemoteName
```

```Go
func TestIPConnRemoteName(t *testing.T)
```

### <a id="TestDialListenIPArgs" href="#TestDialListenIPArgs">func TestDialListenIPArgs(t *testing.T)</a>

```
searchKey: net.TestDialListenIPArgs
```

```Go
func TestDialListenIPArgs(t *testing.T)
```

### <a id="TestAddrList" href="#TestAddrList">func TestAddrList(t *testing.T)</a>

```
searchKey: net.TestAddrList
```

```Go
func TestAddrList(t *testing.T)
```

### <a id="TestAddrListPartition" href="#TestAddrListPartition">func TestAddrListPartition(t *testing.T)</a>

```
searchKey: net.TestAddrListPartition
```

```Go
func TestAddrListPartition(t *testing.T)
```

### <a id="TestTCPListener" href="#TestTCPListener">func TestTCPListener(t *testing.T)</a>

```
searchKey: net.TestTCPListener
```

```Go
func TestTCPListener(t *testing.T)
```

TestTCPListener tests both single and double listen to a test listener with same address family, same listening address and same port. 

### <a id="TestUDPListener" href="#TestUDPListener">func TestUDPListener(t *testing.T)</a>

```
searchKey: net.TestUDPListener
```

```Go
func TestUDPListener(t *testing.T)
```

TestUDPListener tests both single and double listen to a test listener with same address family, same listening address and same port. 

### <a id="TestDualStackTCPListener" href="#TestDualStackTCPListener">func TestDualStackTCPListener(t *testing.T)</a>

```
searchKey: net.TestDualStackTCPListener
```

```Go
func TestDualStackTCPListener(t *testing.T)
```

TestDualStackTCPListener tests both single and double listen to a test listener with various address families, different listening address and same port. 

On DragonFly BSD, we expect the kernel version of node under test to be greater than or equal to 4.4. 

### <a id="TestDualStackUDPListener" href="#TestDualStackUDPListener">func TestDualStackUDPListener(t *testing.T)</a>

```
searchKey: net.TestDualStackUDPListener
```

```Go
func TestDualStackUDPListener(t *testing.T)
```

TestDualStackUDPListener tests both single and double listen to a test listener with various address families, different listening address and same port. 

On DragonFly BSD, we expect the kernel version of node under test to be greater than or equal to 4.4. 

### <a id="differentWildcardAddr" href="#differentWildcardAddr">func differentWildcardAddr(i, j string) bool</a>

```
searchKey: net.differentWildcardAddr
```

```Go
func differentWildcardAddr(i, j string) bool
```

### <a id="checkFirstListener" href="#checkFirstListener">func checkFirstListener(network string, ln interface{}) error</a>

```
searchKey: net.checkFirstListener
```

```Go
func checkFirstListener(network string, ln interface{}) error
```

### <a id="checkSecondListener" href="#checkSecondListener">func checkSecondListener(network, address string, err error) error</a>

```
searchKey: net.checkSecondListener
```

```Go
func checkSecondListener(network, address string, err error) error
```

### <a id="checkDualStackSecondListener" href="#checkDualStackSecondListener">func checkDualStackSecondListener(network, address string, err, xerr error) error</a>

```
searchKey: net.checkDualStackSecondListener
```

```Go
func checkDualStackSecondListener(network, address string, err, xerr error) error
```

### <a id="checkDualStackAddrFamily" href="#checkDualStackAddrFamily">func checkDualStackAddrFamily(fd *netFD) error</a>

```
searchKey: net.checkDualStackAddrFamily
```

```Go
func checkDualStackAddrFamily(fd *netFD) error
```

### <a id="TestWildWildcardListener" href="#TestWildWildcardListener">func TestWildWildcardListener(t *testing.T)</a>

```
searchKey: net.TestWildWildcardListener
```

```Go
func TestWildWildcardListener(t *testing.T)
```

### <a id="TestIPv4MulticastListener" href="#TestIPv4MulticastListener">func TestIPv4MulticastListener(t *testing.T)</a>

```
searchKey: net.TestIPv4MulticastListener
```

```Go
func TestIPv4MulticastListener(t *testing.T)
```

TestIPv4MulticastListener tests both single and double listen to a test listener with same address family, same group address and same port. 

### <a id="TestIPv6MulticastListener" href="#TestIPv6MulticastListener">func TestIPv6MulticastListener(t *testing.T)</a>

```
searchKey: net.TestIPv6MulticastListener
```

```Go
func TestIPv6MulticastListener(t *testing.T)
```

TestIPv6MulticastListener tests both single and double listen to a test listener with same address family, same group address and same port. 

### <a id="checkMulticastListener" href="#checkMulticastListener">func checkMulticastListener(c *UDPConn, ip IP) error</a>

```
searchKey: net.checkMulticastListener
```

```Go
func checkMulticastListener(c *UDPConn, ip IP) error
```

### <a id="multicastRIBContains" href="#multicastRIBContains">func multicastRIBContains(ip IP) (bool, error)</a>

```
searchKey: net.multicastRIBContains
```

```Go
func multicastRIBContains(ip IP) (bool, error)
```

### <a id="TestClosingListener" href="#TestClosingListener">func TestClosingListener(t *testing.T)</a>

```
searchKey: net.TestClosingListener
```

```Go
func TestClosingListener(t *testing.T)
```

Issue 21856. 

### <a id="TestListenConfigControl" href="#TestListenConfigControl">func TestListenConfigControl(t *testing.T)</a>

```
searchKey: net.TestListenConfigControl
```

```Go
func TestListenConfigControl(t *testing.T)
```

### <a id="hasSuffixFold" href="#hasSuffixFold">func hasSuffixFold(s, suffix string) bool</a>

```
searchKey: net.hasSuffixFold
```

```Go
func hasSuffixFold(s, suffix string) bool
```

### <a id="lookupLocalhost" href="#lookupLocalhost">func lookupLocalhost(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)</a>

```
searchKey: net.lookupLocalhost
```

```Go
func lookupLocalhost(ctx context.Context, fn func(context.Context, string, string) ([]IPAddr, error), network, host string) ([]IPAddr, error)
```

### <a id="TestLookupGoogleSRV" href="#TestLookupGoogleSRV">func TestLookupGoogleSRV(t *testing.T)</a>

```
searchKey: net.TestLookupGoogleSRV
```

```Go
func TestLookupGoogleSRV(t *testing.T)
```

### <a id="TestLookupGmailMX" href="#TestLookupGmailMX">func TestLookupGmailMX(t *testing.T)</a>

```
searchKey: net.TestLookupGmailMX
```

```Go
func TestLookupGmailMX(t *testing.T)
```

### <a id="TestLookupGmailNS" href="#TestLookupGmailNS">func TestLookupGmailNS(t *testing.T)</a>

```
searchKey: net.TestLookupGmailNS
```

```Go
func TestLookupGmailNS(t *testing.T)
```

### <a id="TestLookupGmailTXT" href="#TestLookupGmailTXT">func TestLookupGmailTXT(t *testing.T)</a>

```
searchKey: net.TestLookupGmailTXT
```

```Go
func TestLookupGmailTXT(t *testing.T)
```

### <a id="TestLookupGooglePublicDNSAddr" href="#TestLookupGooglePublicDNSAddr">func TestLookupGooglePublicDNSAddr(t *testing.T)</a>

```
searchKey: net.TestLookupGooglePublicDNSAddr
```

```Go
func TestLookupGooglePublicDNSAddr(t *testing.T)
```

### <a id="TestLookupIPv6LinkLocalAddr" href="#TestLookupIPv6LinkLocalAddr">func TestLookupIPv6LinkLocalAddr(t *testing.T)</a>

```
searchKey: net.TestLookupIPv6LinkLocalAddr
```

```Go
func TestLookupIPv6LinkLocalAddr(t *testing.T)
```

### <a id="TestLookupIPv6LinkLocalAddrWithZone" href="#TestLookupIPv6LinkLocalAddrWithZone">func TestLookupIPv6LinkLocalAddrWithZone(t *testing.T)</a>

```
searchKey: net.TestLookupIPv6LinkLocalAddrWithZone
```

```Go
func TestLookupIPv6LinkLocalAddrWithZone(t *testing.T)
```

### <a id="TestLookupCNAME" href="#TestLookupCNAME">func TestLookupCNAME(t *testing.T)</a>

```
searchKey: net.TestLookupCNAME
```

```Go
func TestLookupCNAME(t *testing.T)
```

### <a id="TestLookupGoogleHost" href="#TestLookupGoogleHost">func TestLookupGoogleHost(t *testing.T)</a>

```
searchKey: net.TestLookupGoogleHost
```

```Go
func TestLookupGoogleHost(t *testing.T)
```

### <a id="TestLookupLongTXT" href="#TestLookupLongTXT">func TestLookupLongTXT(t *testing.T)</a>

```
searchKey: net.TestLookupLongTXT
```

```Go
func TestLookupLongTXT(t *testing.T)
```

### <a id="TestLookupGoogleIP" href="#TestLookupGoogleIP">func TestLookupGoogleIP(t *testing.T)</a>

```
searchKey: net.TestLookupGoogleIP
```

```Go
func TestLookupGoogleIP(t *testing.T)
```

### <a id="TestReverseAddress" href="#TestReverseAddress">func TestReverseAddress(t *testing.T)</a>

```
searchKey: net.TestReverseAddress
```

```Go
func TestReverseAddress(t *testing.T)
```

### <a id="TestDNSFlood" href="#TestDNSFlood">func TestDNSFlood(t *testing.T)</a>

```
searchKey: net.TestDNSFlood
```

```Go
func TestDNSFlood(t *testing.T)
```

### <a id="TestLookupDotsWithLocalSource" href="#TestLookupDotsWithLocalSource">func TestLookupDotsWithLocalSource(t *testing.T)</a>

```
searchKey: net.TestLookupDotsWithLocalSource
```

```Go
func TestLookupDotsWithLocalSource(t *testing.T)
```

### <a id="TestLookupDotsWithRemoteSource" href="#TestLookupDotsWithRemoteSource">func TestLookupDotsWithRemoteSource(t *testing.T)</a>

```
searchKey: net.TestLookupDotsWithRemoteSource
```

```Go
func TestLookupDotsWithRemoteSource(t *testing.T)
```

### <a id="testDots" href="#testDots">func testDots(t *testing.T, mode string)</a>

```
searchKey: net.testDots
```

```Go
func testDots(t *testing.T, mode string)
```

### <a id="mxString" href="#mxString">func mxString(mxs []*MX) string</a>

```
searchKey: net.mxString
```

```Go
func mxString(mxs []*MX) string
```

### <a id="nsString" href="#nsString">func nsString(nss []*NS) string</a>

```
searchKey: net.nsString
```

```Go
func nsString(nss []*NS) string
```

### <a id="srvString" href="#srvString">func srvString(srvs []*SRV) string</a>

```
searchKey: net.srvString
```

```Go
func srvString(srvs []*SRV) string
```

### <a id="TestLookupPort" href="#TestLookupPort">func TestLookupPort(t *testing.T)</a>

```
searchKey: net.TestLookupPort
```

```Go
func TestLookupPort(t *testing.T)
```

### <a id="TestLookupPort_Minimal" href="#TestLookupPort_Minimal">func TestLookupPort_Minimal(t *testing.T)</a>

```
searchKey: net.TestLookupPort_Minimal
```

```Go
func TestLookupPort_Minimal(t *testing.T)
```

Like TestLookupPort but with minimal tests that should always pass because the answers are baked-in to the net package. 

### <a id="TestLookupProtocol_Minimal" href="#TestLookupProtocol_Minimal">func TestLookupProtocol_Minimal(t *testing.T)</a>

```
searchKey: net.TestLookupProtocol_Minimal
```

```Go
func TestLookupProtocol_Minimal(t *testing.T)
```

### <a id="TestLookupNonLDH" href="#TestLookupNonLDH">func TestLookupNonLDH(t *testing.T)</a>

```
searchKey: net.TestLookupNonLDH
```

```Go
func TestLookupNonLDH(t *testing.T)
```

### <a id="TestLookupContextCancel" href="#TestLookupContextCancel">func TestLookupContextCancel(t *testing.T)</a>

```
searchKey: net.TestLookupContextCancel
```

```Go
func TestLookupContextCancel(t *testing.T)
```

### <a id="TestNilResolverLookup" href="#TestNilResolverLookup">func TestNilResolverLookup(t *testing.T)</a>

```
searchKey: net.TestNilResolverLookup
```

```Go
func TestNilResolverLookup(t *testing.T)
```

Issue 24330: treat the nil *Resolver like a zero value. Verify nothing crashes if nil is used. 

### <a id="TestLookupHostCancel" href="#TestLookupHostCancel">func TestLookupHostCancel(t *testing.T)</a>

```
searchKey: net.TestLookupHostCancel
```

```Go
func TestLookupHostCancel(t *testing.T)
```

TestLookupHostCancel verifies that lookup works even after many canceled lookups (see golang.org/issue/24178 for details). 

### <a id="TestConcurrentPreferGoResolversDial" href="#TestConcurrentPreferGoResolversDial">func TestConcurrentPreferGoResolversDial(t *testing.T)</a>

```
searchKey: net.TestConcurrentPreferGoResolversDial
```

```Go
func TestConcurrentPreferGoResolversDial(t *testing.T)
```

TestConcurrentPreferGoResolversDial tests that multiple resolvers with the PreferGo option used concurrently are all dialed properly. 

### <a id="TestIPVersion" href="#TestIPVersion">func TestIPVersion(t *testing.T)</a>

```
searchKey: net.TestIPVersion
```

```Go
func TestIPVersion(t *testing.T)
```

### <a id="TestLookupIPAddrPreservesContextValues" href="#TestLookupIPAddrPreservesContextValues">func TestLookupIPAddrPreservesContextValues(t *testing.T)</a>

```
searchKey: net.TestLookupIPAddrPreservesContextValues
```

```Go
func TestLookupIPAddrPreservesContextValues(t *testing.T)
```

Issue 28600: The context that is used to lookup ips should always preserve the values from the context that was passed into LookupIPAddr. 

### <a id="TestLookupIPAddrConcurrentCallsForNetworks" href="#TestLookupIPAddrConcurrentCallsForNetworks">func TestLookupIPAddrConcurrentCallsForNetworks(t *testing.T)</a>

```
searchKey: net.TestLookupIPAddrConcurrentCallsForNetworks
```

```Go
func TestLookupIPAddrConcurrentCallsForNetworks(t *testing.T)
```

Issue 30521: The lookup group should call the resolver for each network. 

### <a id="TestWithUnexpiredValuesPreserved" href="#TestWithUnexpiredValuesPreserved">func TestWithUnexpiredValuesPreserved(t *testing.T)</a>

```
searchKey: net.TestWithUnexpiredValuesPreserved
```

```Go
func TestWithUnexpiredValuesPreserved(t *testing.T)
```

### <a id="TestLookupNullByte" href="#TestLookupNullByte">func TestLookupNullByte(t *testing.T)</a>

```
searchKey: net.TestLookupNullByte
```

```Go
func TestLookupNullByte(t *testing.T)
```

Issue 31597: don't panic on null byte in name 

### <a id="TestResolverLookupIP" href="#TestResolverLookupIP">func TestResolverLookupIP(t *testing.T)</a>

```
searchKey: net.TestResolverLookupIP
```

```Go
func TestResolverLookupIP(t *testing.T)
```

### <a id="TestParseMAC" href="#TestParseMAC">func TestParseMAC(t *testing.T)</a>

```
searchKey: net.TestParseMAC
```

```Go
func TestParseMAC(t *testing.T)
```

### <a id="forceGoDNS" href="#forceGoDNS">func forceGoDNS() func()</a>

```
searchKey: net.forceGoDNS
```

```Go
func forceGoDNS() func()
```

forceGoDNS forces the resolver configuration to use the pure Go resolver and returns a fixup function to restore the old settings. 

### <a id="forceCgoDNS" href="#forceCgoDNS">func forceCgoDNS() func()</a>

```
searchKey: net.forceCgoDNS
```

```Go
func forceCgoDNS() func()
```

forceCgoDNS forces the resolver configuration to use the cgo resolver and returns a fixup function to restore the old settings. (On non-Unix systems forceCgoDNS returns nil.) 

### <a id="enableSocketConnect" href="#enableSocketConnect">func enableSocketConnect()</a>

```
searchKey: net.enableSocketConnect
```

```Go
func enableSocketConnect()
```

### <a id="disableSocketConnect" href="#disableSocketConnect">func disableSocketConnect(network string)</a>

```
searchKey: net.disableSocketConnect
```

```Go
func disableSocketConnect(network string)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: net.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="setupTestData" href="#setupTestData">func setupTestData()</a>

```
searchKey: net.setupTestData
```

```Go
func setupTestData()
```

### <a id="printRunningGoroutines" href="#printRunningGoroutines">func printRunningGoroutines()</a>

```
searchKey: net.printRunningGoroutines
```

```Go
func printRunningGoroutines()
```

### <a id="runningGoroutines" href="#runningGoroutines">func runningGoroutines() []string</a>

```
searchKey: net.runningGoroutines
```

```Go
func runningGoroutines() []string
```

runningGoroutines returns a list of remaining goroutines. 

### <a id="printInflightSockets" href="#printInflightSockets">func printInflightSockets()</a>

```
searchKey: net.printInflightSockets
```

```Go
func printInflightSockets()
```

### <a id="printSocketStats" href="#printSocketStats">func printSocketStats()</a>

```
searchKey: net.printSocketStats
```

```Go
func printSocketStats()
```

### <a id="installTestHooks" href="#installTestHooks">func installTestHooks()</a>

```
searchKey: net.installTestHooks
```

```Go
func installTestHooks()
```

### <a id="uninstallTestHooks" href="#uninstallTestHooks">func uninstallTestHooks()</a>

```
searchKey: net.uninstallTestHooks
```

```Go
func uninstallTestHooks()
```

### <a id="forceCloseSockets" href="#forceCloseSockets">func forceCloseSockets()</a>

```
searchKey: net.forceCloseSockets
```

```Go
func forceCloseSockets()
```

forceCloseSockets must be called only from TestMain. 

### <a id="testUnixAddr" href="#testUnixAddr">func testUnixAddr() string</a>

```
searchKey: net.testUnixAddr
```

```Go
func testUnixAddr() string
```

testUnixAddr uses os.CreateTemp to get a name that is unique. 

### <a id="newDualStackListener" href="#newDualStackListener">func newDualStackListener() (lns []*TCPListener, err error)</a>

```
searchKey: net.newDualStackListener
```

```Go
func newDualStackListener() (lns []*TCPListener, err error)
```

### <a id="transceiver" href="#transceiver">func transceiver(c Conn, wb []byte, ch chan<- error)</a>

```
searchKey: net.transceiver
```

```Go
func transceiver(c Conn, wb []byte, ch chan<- error)
```

### <a id="timeoutReceiver" href="#timeoutReceiver">func timeoutReceiver(c Conn, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: net.timeoutReceiver
```

```Go
func timeoutReceiver(c Conn, d, min, max time.Duration, ch chan<- error)
```

### <a id="timeoutTransmitter" href="#timeoutTransmitter">func timeoutTransmitter(c Conn, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: net.timeoutTransmitter
```

```Go
func timeoutTransmitter(c Conn, d, min, max time.Duration, ch chan<- error)
```

### <a id="newDualStackPacketListener" href="#newDualStackPacketListener">func newDualStackPacketListener() (cs []*UDPConn, err error)</a>

```
searchKey: net.newDualStackPacketListener
```

```Go
func newDualStackPacketListener() (cs []*UDPConn, err error)
```

### <a id="packetTransponder" href="#packetTransponder">func packetTransponder(c PacketConn, ch chan<- error)</a>

```
searchKey: net.packetTransponder
```

```Go
func packetTransponder(c PacketConn, ch chan<- error)
```

### <a id="packetTransceiver" href="#packetTransceiver">func packetTransceiver(c PacketConn, wb []byte, dst Addr, ch chan<- error)</a>

```
searchKey: net.packetTransceiver
```

```Go
func packetTransceiver(c PacketConn, wb []byte, dst Addr, ch chan<- error)
```

### <a id="timeoutPacketReceiver" href="#timeoutPacketReceiver">func timeoutPacketReceiver(c PacketConn, d, min, max time.Duration, ch chan<- error)</a>

```
searchKey: net.timeoutPacketReceiver
```

```Go
func timeoutPacketReceiver(c PacketConn, d, min, max time.Duration, ch chan<- error)
```

### <a id="TestCloseRead" href="#TestCloseRead">func TestCloseRead(t *testing.T)</a>

```
searchKey: net.TestCloseRead
```

```Go
func TestCloseRead(t *testing.T)
```

### <a id="TestCloseWrite" href="#TestCloseWrite">func TestCloseWrite(t *testing.T)</a>

```
searchKey: net.TestCloseWrite
```

```Go
func TestCloseWrite(t *testing.T)
```

### <a id="TestConnClose" href="#TestConnClose">func TestConnClose(t *testing.T)</a>

```
searchKey: net.TestConnClose
```

```Go
func TestConnClose(t *testing.T)
```

### <a id="TestListenerClose" href="#TestListenerClose">func TestListenerClose(t *testing.T)</a>

```
searchKey: net.TestListenerClose
```

```Go
func TestListenerClose(t *testing.T)
```

### <a id="TestPacketConnClose" href="#TestPacketConnClose">func TestPacketConnClose(t *testing.T)</a>

```
searchKey: net.TestPacketConnClose
```

```Go
func TestPacketConnClose(t *testing.T)
```

### <a id="TestListenCloseListen" href="#TestListenCloseListen">func TestListenCloseListen(t *testing.T)</a>

```
searchKey: net.TestListenCloseListen
```

```Go
func TestListenCloseListen(t *testing.T)
```

### <a id="TestAcceptIgnoreAbortedConnRequest" href="#TestAcceptIgnoreAbortedConnRequest">func TestAcceptIgnoreAbortedConnRequest(t *testing.T)</a>

```
searchKey: net.TestAcceptIgnoreAbortedConnRequest
```

```Go
func TestAcceptIgnoreAbortedConnRequest(t *testing.T)
```

See golang.org/issue/6163, golang.org/issue/6987. 

### <a id="TestZeroByteRead" href="#TestZeroByteRead">func TestZeroByteRead(t *testing.T)</a>

```
searchKey: net.TestZeroByteRead
```

```Go
func TestZeroByteRead(t *testing.T)
```

### <a id="withTCPConnPair" href="#withTCPConnPair">func withTCPConnPair(t *testing.T, peer1, peer2 func(c *TCPConn) error)</a>

```
searchKey: net.withTCPConnPair
```

```Go
func withTCPConnPair(t *testing.T, peer1, peer2 func(c *TCPConn) error)
```

withTCPConnPair sets up a TCP connection between two peers, then runs peer1 and peer2 concurrently. withTCPConnPair returns when both have completed. 

### <a id="TestReadTimeoutUnblocksRead" href="#TestReadTimeoutUnblocksRead">func TestReadTimeoutUnblocksRead(t *testing.T)</a>

```
searchKey: net.TestReadTimeoutUnblocksRead
```

```Go
func TestReadTimeoutUnblocksRead(t *testing.T)
```

Tests that a blocked Read is interrupted by a concurrent SetReadDeadline modifying that Conn's read deadline to the past. See golang.org/cl/30164 which documented this. The net/http package depends on this. 

### <a id="TestCloseUnblocksRead" href="#TestCloseUnblocksRead">func TestCloseUnblocksRead(t *testing.T)</a>

```
searchKey: net.TestCloseUnblocksRead
```

```Go
func TestCloseUnblocksRead(t *testing.T)
```

Issue 17695: verify that a blocked Read is woken up by a Close. 

### <a id="TestNotTemporaryRead" href="#TestNotTemporaryRead">func TestNotTemporaryRead(t *testing.T)</a>

```
searchKey: net.TestNotTemporaryRead
```

```Go
func TestNotTemporaryRead(t *testing.T)
```

Issue 24808: verify that ECONNRESET is not temporary for read. 

### <a id="TestErrors" href="#TestErrors">func TestErrors(t *testing.T)</a>

```
searchKey: net.TestErrors
```

```Go
func TestErrors(t *testing.T)
```

The various errors should implement the Error interface. 

### <a id="TestParseNSSConf" href="#TestParseNSSConf">func TestParseNSSConf(t *testing.T)</a>

```
searchKey: net.TestParseNSSConf
```

```Go
func TestParseNSSConf(t *testing.T)
```

### <a id="packetConnTestData" href="#packetConnTestData">func packetConnTestData(t *testing.T, network string) ([]byte, func())</a>

```
searchKey: net.packetConnTestData
```

```Go
func packetConnTestData(t *testing.T, network string) ([]byte, func())
```

### <a id="TestPacketConn" href="#TestPacketConn">func TestPacketConn(t *testing.T)</a>

```
searchKey: net.TestPacketConn
```

```Go
func TestPacketConn(t *testing.T)
```

### <a id="TestConnAndPacketConn" href="#TestConnAndPacketConn">func TestConnAndPacketConn(t *testing.T)</a>

```
searchKey: net.TestConnAndPacketConn
```

```Go
func TestConnAndPacketConn(t *testing.T)
```

### <a id="TestReadLine" href="#TestReadLine">func TestReadLine(t *testing.T)</a>

```
searchKey: net.TestReadLine
```

```Go
func TestReadLine(t *testing.T)
```

### <a id="TestGoDebugString" href="#TestGoDebugString">func TestGoDebugString(t *testing.T)</a>

```
searchKey: net.TestGoDebugString
```

```Go
func TestGoDebugString(t *testing.T)
```

### <a id="TestDtoi" href="#TestDtoi">func TestDtoi(t *testing.T)</a>

```
searchKey: net.TestDtoi
```

```Go
func TestDtoi(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: net.init
```

```Go
func init()
```

### <a id="testableNetwork" href="#testableNetwork">func testableNetwork(network string) bool</a>

```
searchKey: net.testableNetwork
```

```Go
func testableNetwork(network string) bool
```

testableNetwork reports whether network is testable on the current platform configuration. 

### <a id="iOS" href="#iOS">func iOS() bool</a>

```
searchKey: net.iOS
```

```Go
func iOS() bool
```

### <a id="testableAddress" href="#testableAddress">func testableAddress(network, address string) bool</a>

```
searchKey: net.testableAddress
```

```Go
func testableAddress(network, address string) bool
```

testableAddress reports whether address of network is testable on the current platform configuration. 

### <a id="testableListenArgs" href="#testableListenArgs">func testableListenArgs(network, address, client string) bool</a>

```
searchKey: net.testableListenArgs
```

```Go
func testableListenArgs(network, address, client string) bool
```

testableListenArgs reports whether arguments are testable on the current platform configuration. 

### <a id="condFatalf" href="#condFatalf">func condFatalf(t *testing.T, network string, format string, args ...interface{})</a>

```
searchKey: net.condFatalf
```

```Go
func condFatalf(t *testing.T, network string, format string, args ...interface{})
```

### <a id="TestParsePort" href="#TestParsePort">func TestParsePort(t *testing.T)</a>

```
searchKey: net.TestParsePort
```

```Go
func TestParsePort(t *testing.T)
```

### <a id="TestTCPListenerSpecificMethods" href="#TestTCPListenerSpecificMethods">func TestTCPListenerSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestTCPListenerSpecificMethods
```

```Go
func TestTCPListenerSpecificMethods(t *testing.T)
```

### <a id="TestTCPConnSpecificMethods" href="#TestTCPConnSpecificMethods">func TestTCPConnSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestTCPConnSpecificMethods
```

```Go
func TestTCPConnSpecificMethods(t *testing.T)
```

### <a id="TestUDPConnSpecificMethods" href="#TestUDPConnSpecificMethods">func TestUDPConnSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestUDPConnSpecificMethods
```

```Go
func TestUDPConnSpecificMethods(t *testing.T)
```

### <a id="TestIPConnSpecificMethods" href="#TestIPConnSpecificMethods">func TestIPConnSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestIPConnSpecificMethods
```

```Go
func TestIPConnSpecificMethods(t *testing.T)
```

### <a id="TestUnixListenerSpecificMethods" href="#TestUnixListenerSpecificMethods">func TestUnixListenerSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestUnixListenerSpecificMethods
```

```Go
func TestUnixListenerSpecificMethods(t *testing.T)
```

### <a id="TestUnixConnSpecificMethods" href="#TestUnixConnSpecificMethods">func TestUnixConnSpecificMethods(t *testing.T)</a>

```
searchKey: net.TestUnixConnSpecificMethods
```

```Go
func TestUnixConnSpecificMethods(t *testing.T)
```

### <a id="TestRawConnReadWrite" href="#TestRawConnReadWrite">func TestRawConnReadWrite(t *testing.T)</a>

```
searchKey: net.TestRawConnReadWrite
```

```Go
func TestRawConnReadWrite(t *testing.T)
```

### <a id="TestRawConnControl" href="#TestRawConnControl">func TestRawConnControl(t *testing.T)</a>

```
searchKey: net.TestRawConnControl
```

```Go
func TestRawConnControl(t *testing.T)
```

### <a id="readRawConn" href="#readRawConn">func readRawConn(c syscall.RawConn, b []byte) (int, error)</a>

```
searchKey: net.readRawConn
```

```Go
func readRawConn(c syscall.RawConn, b []byte) (int, error)
```

### <a id="writeRawConn" href="#writeRawConn">func writeRawConn(c syscall.RawConn, b []byte) error</a>

```
searchKey: net.writeRawConn
```

```Go
func writeRawConn(c syscall.RawConn, b []byte) error
```

### <a id="controlRawConn" href="#controlRawConn">func controlRawConn(c syscall.RawConn, addr Addr) error</a>

```
searchKey: net.controlRawConn
```

```Go
func controlRawConn(c syscall.RawConn, addr Addr) error
```

### <a id="controlOnConnSetup" href="#controlOnConnSetup">func controlOnConnSetup(network string, address string, c syscall.RawConn) error</a>

```
searchKey: net.controlOnConnSetup
```

```Go
func controlOnConnSetup(network string, address string, c syscall.RawConn) error
```

### <a id="TestSendfile" href="#TestSendfile">func TestSendfile(t *testing.T)</a>

```
searchKey: net.TestSendfile
```

```Go
func TestSendfile(t *testing.T)
```

### <a id="TestSendfileParts" href="#TestSendfileParts">func TestSendfileParts(t *testing.T)</a>

```
searchKey: net.TestSendfileParts
```

```Go
func TestSendfileParts(t *testing.T)
```

### <a id="TestSendfileSeeked" href="#TestSendfileSeeked">func TestSendfileSeeked(t *testing.T)</a>

```
searchKey: net.TestSendfileSeeked
```

```Go
func TestSendfileSeeked(t *testing.T)
```

### <a id="TestSendfilePipe" href="#TestSendfilePipe">func TestSendfilePipe(t *testing.T)</a>

```
searchKey: net.TestSendfilePipe
```

```Go
func TestSendfilePipe(t *testing.T)
```

Test that sendfile doesn't put a pipe into blocking mode. 

### <a id="TestSendfileOnWriteTimeoutExceeded" href="#TestSendfileOnWriteTimeoutExceeded">func TestSendfileOnWriteTimeoutExceeded(t *testing.T)</a>

```
searchKey: net.TestSendfileOnWriteTimeoutExceeded
```

```Go
func TestSendfileOnWriteTimeoutExceeded(t *testing.T)
```

Issue 43822: tests that returns EOF when conn write timeout. 

### <a id="TestTCPServer" href="#TestTCPServer">func TestTCPServer(t *testing.T)</a>

```
searchKey: net.TestTCPServer
```

```Go
func TestTCPServer(t *testing.T)
```

TestTCPServer tests concurrent accept-read-write servers. 

### <a id="TestUnixAndUnixpacketServer" href="#TestUnixAndUnixpacketServer">func TestUnixAndUnixpacketServer(t *testing.T)</a>

```
searchKey: net.TestUnixAndUnixpacketServer
```

```Go
func TestUnixAndUnixpacketServer(t *testing.T)
```

TestUnixAndUnixpacketServer tests concurrent accept-read-write servers 

### <a id="TestUDPServer" href="#TestUDPServer">func TestUDPServer(t *testing.T)</a>

```
searchKey: net.TestUDPServer
```

```Go
func TestUDPServer(t *testing.T)
```

### <a id="TestUnixgramServer" href="#TestUnixgramServer">func TestUnixgramServer(t *testing.T)</a>

```
searchKey: net.TestUnixgramServer
```

```Go
func TestUnixgramServer(t *testing.T)
```

### <a id="BenchmarkTCP4OneShot" href="#BenchmarkTCP4OneShot">func BenchmarkTCP4OneShot(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4OneShot
```

```Go
func BenchmarkTCP4OneShot(b *testing.B)
```

### <a id="BenchmarkTCP4OneShotTimeout" href="#BenchmarkTCP4OneShotTimeout">func BenchmarkTCP4OneShotTimeout(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4OneShotTimeout
```

```Go
func BenchmarkTCP4OneShotTimeout(b *testing.B)
```

### <a id="BenchmarkTCP4Persistent" href="#BenchmarkTCP4Persistent">func BenchmarkTCP4Persistent(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4Persistent
```

```Go
func BenchmarkTCP4Persistent(b *testing.B)
```

### <a id="BenchmarkTCP4PersistentTimeout" href="#BenchmarkTCP4PersistentTimeout">func BenchmarkTCP4PersistentTimeout(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4PersistentTimeout
```

```Go
func BenchmarkTCP4PersistentTimeout(b *testing.B)
```

### <a id="BenchmarkTCP6OneShot" href="#BenchmarkTCP6OneShot">func BenchmarkTCP6OneShot(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6OneShot
```

```Go
func BenchmarkTCP6OneShot(b *testing.B)
```

### <a id="BenchmarkTCP6OneShotTimeout" href="#BenchmarkTCP6OneShotTimeout">func BenchmarkTCP6OneShotTimeout(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6OneShotTimeout
```

```Go
func BenchmarkTCP6OneShotTimeout(b *testing.B)
```

### <a id="BenchmarkTCP6Persistent" href="#BenchmarkTCP6Persistent">func BenchmarkTCP6Persistent(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6Persistent
```

```Go
func BenchmarkTCP6Persistent(b *testing.B)
```

### <a id="BenchmarkTCP6PersistentTimeout" href="#BenchmarkTCP6PersistentTimeout">func BenchmarkTCP6PersistentTimeout(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6PersistentTimeout
```

```Go
func BenchmarkTCP6PersistentTimeout(b *testing.B)
```

### <a id="benchmarkTCP" href="#benchmarkTCP">func benchmarkTCP(b *testing.B, persistent, timeout bool, laddr string)</a>

```
searchKey: net.benchmarkTCP
```

```Go
func benchmarkTCP(b *testing.B, persistent, timeout bool, laddr string)
```

### <a id="BenchmarkTCP4ConcurrentReadWrite" href="#BenchmarkTCP4ConcurrentReadWrite">func BenchmarkTCP4ConcurrentReadWrite(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP4ConcurrentReadWrite
```

```Go
func BenchmarkTCP4ConcurrentReadWrite(b *testing.B)
```

### <a id="BenchmarkTCP6ConcurrentReadWrite" href="#BenchmarkTCP6ConcurrentReadWrite">func BenchmarkTCP6ConcurrentReadWrite(b *testing.B)</a>

```
searchKey: net.BenchmarkTCP6ConcurrentReadWrite
```

```Go
func BenchmarkTCP6ConcurrentReadWrite(b *testing.B)
```

### <a id="benchmarkTCPConcurrentReadWrite" href="#benchmarkTCPConcurrentReadWrite">func benchmarkTCPConcurrentReadWrite(b *testing.B, laddr string)</a>

```
searchKey: net.benchmarkTCPConcurrentReadWrite
```

```Go
func benchmarkTCPConcurrentReadWrite(b *testing.B, laddr string)
```

### <a id="TestResolveTCPAddr" href="#TestResolveTCPAddr">func TestResolveTCPAddr(t *testing.T)</a>

```
searchKey: net.TestResolveTCPAddr
```

```Go
func TestResolveTCPAddr(t *testing.T)
```

### <a id="TestTCPListenerName" href="#TestTCPListenerName">func TestTCPListenerName(t *testing.T)</a>

```
searchKey: net.TestTCPListenerName
```

```Go
func TestTCPListenerName(t *testing.T)
```

### <a id="TestIPv6LinkLocalUnicastTCP" href="#TestIPv6LinkLocalUnicastTCP">func TestIPv6LinkLocalUnicastTCP(t *testing.T)</a>

```
searchKey: net.TestIPv6LinkLocalUnicastTCP
```

```Go
func TestIPv6LinkLocalUnicastTCP(t *testing.T)
```

### <a id="TestTCPConcurrentAccept" href="#TestTCPConcurrentAccept">func TestTCPConcurrentAccept(t *testing.T)</a>

```
searchKey: net.TestTCPConcurrentAccept
```

```Go
func TestTCPConcurrentAccept(t *testing.T)
```

### <a id="TestTCPReadWriteAllocs" href="#TestTCPReadWriteAllocs">func TestTCPReadWriteAllocs(t *testing.T)</a>

```
searchKey: net.TestTCPReadWriteAllocs
```

```Go
func TestTCPReadWriteAllocs(t *testing.T)
```

### <a id="TestTCPStress" href="#TestTCPStress">func TestTCPStress(t *testing.T)</a>

```
searchKey: net.TestTCPStress
```

```Go
func TestTCPStress(t *testing.T)
```

### <a id="TestTCPSelfConnect" href="#TestTCPSelfConnect">func TestTCPSelfConnect(t *testing.T)</a>

```
searchKey: net.TestTCPSelfConnect
```

```Go
func TestTCPSelfConnect(t *testing.T)
```

### <a id="TestTCPBig" href="#TestTCPBig">func TestTCPBig(t *testing.T)</a>

```
searchKey: net.TestTCPBig
```

```Go
func TestTCPBig(t *testing.T)
```

Test that >32-bit reads work on 64-bit systems. On 32-bit systems this tests that maxint reads work. 

### <a id="TestCopyPipeIntoTCP" href="#TestCopyPipeIntoTCP">func TestCopyPipeIntoTCP(t *testing.T)</a>

```
searchKey: net.TestCopyPipeIntoTCP
```

```Go
func TestCopyPipeIntoTCP(t *testing.T)
```

### <a id="BenchmarkSetReadDeadline" href="#BenchmarkSetReadDeadline">func BenchmarkSetReadDeadline(b *testing.B)</a>

```
searchKey: net.BenchmarkSetReadDeadline
```

```Go
func BenchmarkSetReadDeadline(b *testing.B)
```

### <a id="TestTCPSpuriousConnSetupCompletion" href="#TestTCPSpuriousConnSetupCompletion">func TestTCPSpuriousConnSetupCompletion(t *testing.T)</a>

```
searchKey: net.TestTCPSpuriousConnSetupCompletion
```

```Go
func TestTCPSpuriousConnSetupCompletion(t *testing.T)
```

See golang.org/issue/14548. 

### <a id="TestTCPSpuriousConnSetupCompletionWithCancel" href="#TestTCPSpuriousConnSetupCompletionWithCancel">func TestTCPSpuriousConnSetupCompletionWithCancel(t *testing.T)</a>

```
searchKey: net.TestTCPSpuriousConnSetupCompletionWithCancel
```

```Go
func TestTCPSpuriousConnSetupCompletionWithCancel(t *testing.T)
```

Issue 19289. Test that a canceled Dial does not cause a subsequent Dial to succeed. 

### <a id="TestDialTimeout" href="#TestDialTimeout">func TestDialTimeout(t *testing.T)</a>

```
searchKey: net.TestDialTimeout
```

```Go
func TestDialTimeout(t *testing.T)
```

### <a id="TestDialTimeoutMaxDuration" href="#TestDialTimeoutMaxDuration">func TestDialTimeoutMaxDuration(t *testing.T)</a>

```
searchKey: net.TestDialTimeoutMaxDuration
```

```Go
func TestDialTimeoutMaxDuration(t *testing.T)
```

### <a id="TestAcceptTimeout" href="#TestAcceptTimeout">func TestAcceptTimeout(t *testing.T)</a>

```
searchKey: net.TestAcceptTimeout
```

```Go
func TestAcceptTimeout(t *testing.T)
```

### <a id="TestAcceptTimeoutMustReturn" href="#TestAcceptTimeoutMustReturn">func TestAcceptTimeoutMustReturn(t *testing.T)</a>

```
searchKey: net.TestAcceptTimeoutMustReturn
```

```Go
func TestAcceptTimeoutMustReturn(t *testing.T)
```

### <a id="TestAcceptTimeoutMustNotReturn" href="#TestAcceptTimeoutMustNotReturn">func TestAcceptTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: net.TestAcceptTimeoutMustNotReturn
```

```Go
func TestAcceptTimeoutMustNotReturn(t *testing.T)
```

### <a id="TestReadTimeout" href="#TestReadTimeout">func TestReadTimeout(t *testing.T)</a>

```
searchKey: net.TestReadTimeout
```

```Go
func TestReadTimeout(t *testing.T)
```

### <a id="TestReadTimeoutMustNotReturn" href="#TestReadTimeoutMustNotReturn">func TestReadTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: net.TestReadTimeoutMustNotReturn
```

```Go
func TestReadTimeoutMustNotReturn(t *testing.T)
```

### <a id="TestReadFromTimeout" href="#TestReadFromTimeout">func TestReadFromTimeout(t *testing.T)</a>

```
searchKey: net.TestReadFromTimeout
```

```Go
func TestReadFromTimeout(t *testing.T)
```

### <a id="TestWriteTimeout" href="#TestWriteTimeout">func TestWriteTimeout(t *testing.T)</a>

```
searchKey: net.TestWriteTimeout
```

```Go
func TestWriteTimeout(t *testing.T)
```

### <a id="TestWriteTimeoutMustNotReturn" href="#TestWriteTimeoutMustNotReturn">func TestWriteTimeoutMustNotReturn(t *testing.T)</a>

```
searchKey: net.TestWriteTimeoutMustNotReturn
```

```Go
func TestWriteTimeoutMustNotReturn(t *testing.T)
```

### <a id="TestWriteToTimeout" href="#TestWriteToTimeout">func TestWriteToTimeout(t *testing.T)</a>

```
searchKey: net.TestWriteToTimeout
```

```Go
func TestWriteToTimeout(t *testing.T)
```

### <a id="TestReadTimeoutFluctuation" href="#TestReadTimeoutFluctuation">func TestReadTimeoutFluctuation(t *testing.T)</a>

```
searchKey: net.TestReadTimeoutFluctuation
```

```Go
func TestReadTimeoutFluctuation(t *testing.T)
```

### <a id="TestReadFromTimeoutFluctuation" href="#TestReadFromTimeoutFluctuation">func TestReadFromTimeoutFluctuation(t *testing.T)</a>

```
searchKey: net.TestReadFromTimeoutFluctuation
```

```Go
func TestReadFromTimeoutFluctuation(t *testing.T)
```

### <a id="TestWriteTimeoutFluctuation" href="#TestWriteTimeoutFluctuation">func TestWriteTimeoutFluctuation(t *testing.T)</a>

```
searchKey: net.TestWriteTimeoutFluctuation
```

```Go
func TestWriteTimeoutFluctuation(t *testing.T)
```

### <a id="TestVariousDeadlines" href="#TestVariousDeadlines">func TestVariousDeadlines(t *testing.T)</a>

```
searchKey: net.TestVariousDeadlines
```

```Go
func TestVariousDeadlines(t *testing.T)
```

### <a id="TestVariousDeadlines1Proc" href="#TestVariousDeadlines1Proc">func TestVariousDeadlines1Proc(t *testing.T)</a>

```
searchKey: net.TestVariousDeadlines1Proc
```

```Go
func TestVariousDeadlines1Proc(t *testing.T)
```

### <a id="TestVariousDeadlines4Proc" href="#TestVariousDeadlines4Proc">func TestVariousDeadlines4Proc(t *testing.T)</a>

```
searchKey: net.TestVariousDeadlines4Proc
```

```Go
func TestVariousDeadlines4Proc(t *testing.T)
```

### <a id="testVariousDeadlines" href="#testVariousDeadlines">func testVariousDeadlines(t *testing.T)</a>

```
searchKey: net.testVariousDeadlines
```

```Go
func testVariousDeadlines(t *testing.T)
```

### <a id="TestReadWriteProlongedTimeout" href="#TestReadWriteProlongedTimeout">func TestReadWriteProlongedTimeout(t *testing.T)</a>

```
searchKey: net.TestReadWriteProlongedTimeout
```

```Go
func TestReadWriteProlongedTimeout(t *testing.T)
```

TestReadWriteProlongedTimeout tests concurrent deadline modification. Known to cause data races in the past. 

### <a id="TestReadWriteDeadlineRace" href="#TestReadWriteDeadlineRace">func TestReadWriteDeadlineRace(t *testing.T)</a>

```
searchKey: net.TestReadWriteDeadlineRace
```

```Go
func TestReadWriteDeadlineRace(t *testing.T)
```

### <a id="TestConcurrentSetDeadline" href="#TestConcurrentSetDeadline">func TestConcurrentSetDeadline(t *testing.T)</a>

```
searchKey: net.TestConcurrentSetDeadline
```

```Go
func TestConcurrentSetDeadline(t *testing.T)
```

Issue 35367. 

### <a id="isDeadlineExceeded" href="#isDeadlineExceeded">func isDeadlineExceeded(err error) bool</a>

```
searchKey: net.isDeadlineExceeded
```

```Go
func isDeadlineExceeded(err error) bool
```

isDeadlineExceeded reports whether err is or wraps os.ErrDeadlineExceeded. We also check that the error implements net.Error, and that the Timeout method returns true. 

### <a id="BenchmarkUDP6LinkLocalUnicast" href="#BenchmarkUDP6LinkLocalUnicast">func BenchmarkUDP6LinkLocalUnicast(b *testing.B)</a>

```
searchKey: net.BenchmarkUDP6LinkLocalUnicast
```

```Go
func BenchmarkUDP6LinkLocalUnicast(b *testing.B)
```

### <a id="TestResolveUDPAddr" href="#TestResolveUDPAddr">func TestResolveUDPAddr(t *testing.T)</a>

```
searchKey: net.TestResolveUDPAddr
```

```Go
func TestResolveUDPAddr(t *testing.T)
```

### <a id="TestWriteToUDP" href="#TestWriteToUDP">func TestWriteToUDP(t *testing.T)</a>

```
searchKey: net.TestWriteToUDP
```

```Go
func TestWriteToUDP(t *testing.T)
```

### <a id="testWriteToConn" href="#testWriteToConn">func testWriteToConn(t *testing.T, raddr string)</a>

```
searchKey: net.testWriteToConn
```

```Go
func testWriteToConn(t *testing.T, raddr string)
```

### <a id="testWriteToPacketConn" href="#testWriteToPacketConn">func testWriteToPacketConn(t *testing.T, raddr string)</a>

```
searchKey: net.testWriteToPacketConn
```

```Go
func testWriteToPacketConn(t *testing.T, raddr string)
```

### <a id="TestUDPConnLocalName" href="#TestUDPConnLocalName">func TestUDPConnLocalName(t *testing.T)</a>

```
searchKey: net.TestUDPConnLocalName
```

```Go
func TestUDPConnLocalName(t *testing.T)
```

### <a id="TestUDPConnLocalAndRemoteNames" href="#TestUDPConnLocalAndRemoteNames">func TestUDPConnLocalAndRemoteNames(t *testing.T)</a>

```
searchKey: net.TestUDPConnLocalAndRemoteNames
```

```Go
func TestUDPConnLocalAndRemoteNames(t *testing.T)
```

### <a id="TestIPv6LinkLocalUnicastUDP" href="#TestIPv6LinkLocalUnicastUDP">func TestIPv6LinkLocalUnicastUDP(t *testing.T)</a>

```
searchKey: net.TestIPv6LinkLocalUnicastUDP
```

```Go
func TestIPv6LinkLocalUnicastUDP(t *testing.T)
```

### <a id="TestUDPZeroBytePayload" href="#TestUDPZeroBytePayload">func TestUDPZeroBytePayload(t *testing.T)</a>

```
searchKey: net.TestUDPZeroBytePayload
```

```Go
func TestUDPZeroBytePayload(t *testing.T)
```

### <a id="TestUDPZeroByteBuffer" href="#TestUDPZeroByteBuffer">func TestUDPZeroByteBuffer(t *testing.T)</a>

```
searchKey: net.TestUDPZeroByteBuffer
```

```Go
func TestUDPZeroByteBuffer(t *testing.T)
```

### <a id="TestUDPReadSizeError" href="#TestUDPReadSizeError">func TestUDPReadSizeError(t *testing.T)</a>

```
searchKey: net.TestUDPReadSizeError
```

```Go
func TestUDPReadSizeError(t *testing.T)
```

### <a id="TestUDPReadTimeout" href="#TestUDPReadTimeout">func TestUDPReadTimeout(t *testing.T)</a>

```
searchKey: net.TestUDPReadTimeout
```

```Go
func TestUDPReadTimeout(t *testing.T)
```

TestUDPReadTimeout verifies that ReadFromUDP with timeout returns an error without data or an address. 

### <a id="BenchmarkWriteToReadFromUDP" href="#BenchmarkWriteToReadFromUDP">func BenchmarkWriteToReadFromUDP(b *testing.B)</a>

```
searchKey: net.BenchmarkWriteToReadFromUDP
```

```Go
func BenchmarkWriteToReadFromUDP(b *testing.B)
```

### <a id="TestUnixConnReadMsgUnixSCMRightsCloseOnExec" href="#TestUnixConnReadMsgUnixSCMRightsCloseOnExec">func TestUnixConnReadMsgUnixSCMRightsCloseOnExec(t *testing.T)</a>

```
searchKey: net.TestUnixConnReadMsgUnixSCMRightsCloseOnExec
```

```Go
func TestUnixConnReadMsgUnixSCMRightsCloseOnExec(t *testing.T)
```

### <a id="TestReadUnixgramWithUnnamedSocket" href="#TestReadUnixgramWithUnnamedSocket">func TestReadUnixgramWithUnnamedSocket(t *testing.T)</a>

```
searchKey: net.TestReadUnixgramWithUnnamedSocket
```

```Go
func TestReadUnixgramWithUnnamedSocket(t *testing.T)
```

### <a id="TestUnixgramZeroBytePayload" href="#TestUnixgramZeroBytePayload">func TestUnixgramZeroBytePayload(t *testing.T)</a>

```
searchKey: net.TestUnixgramZeroBytePayload
```

```Go
func TestUnixgramZeroBytePayload(t *testing.T)
```

### <a id="TestUnixgramZeroByteBuffer" href="#TestUnixgramZeroByteBuffer">func TestUnixgramZeroByteBuffer(t *testing.T)</a>

```
searchKey: net.TestUnixgramZeroByteBuffer
```

```Go
func TestUnixgramZeroByteBuffer(t *testing.T)
```

### <a id="TestUnixgramWrite" href="#TestUnixgramWrite">func TestUnixgramWrite(t *testing.T)</a>

```
searchKey: net.TestUnixgramWrite
```

```Go
func TestUnixgramWrite(t *testing.T)
```

### <a id="testUnixgramWriteConn" href="#testUnixgramWriteConn">func testUnixgramWriteConn(t *testing.T, raddr *UnixAddr)</a>

```
searchKey: net.testUnixgramWriteConn
```

```Go
func testUnixgramWriteConn(t *testing.T, raddr *UnixAddr)
```

### <a id="testUnixgramWritePacketConn" href="#testUnixgramWritePacketConn">func testUnixgramWritePacketConn(t *testing.T, raddr *UnixAddr)</a>

```
searchKey: net.testUnixgramWritePacketConn
```

```Go
func testUnixgramWritePacketConn(t *testing.T, raddr *UnixAddr)
```

### <a id="TestUnixConnLocalAndRemoteNames" href="#TestUnixConnLocalAndRemoteNames">func TestUnixConnLocalAndRemoteNames(t *testing.T)</a>

```
searchKey: net.TestUnixConnLocalAndRemoteNames
```

```Go
func TestUnixConnLocalAndRemoteNames(t *testing.T)
```

### <a id="TestUnixgramConnLocalAndRemoteNames" href="#TestUnixgramConnLocalAndRemoteNames">func TestUnixgramConnLocalAndRemoteNames(t *testing.T)</a>

```
searchKey: net.TestUnixgramConnLocalAndRemoteNames
```

```Go
func TestUnixgramConnLocalAndRemoteNames(t *testing.T)
```

### <a id="TestUnixUnlink" href="#TestUnixUnlink">func TestUnixUnlink(t *testing.T)</a>

```
searchKey: net.TestUnixUnlink
```

```Go
func TestUnixUnlink(t *testing.T)
```

### <a id="TestEndlessWrite" href="#TestEndlessWrite">func TestEndlessWrite(t *testing.T)</a>

```
searchKey: net.TestEndlessWrite
```

```Go
func TestEndlessWrite(t *testing.T)
```

Test that a client can't trigger an endless loop of write system calls on the server by shutting down the write side on the client. Possibility raised in the discussion of [https://golang.org/cl/71973](https://golang.org/cl/71973). 

### <a id="TestBuffers_read" href="#TestBuffers_read">func TestBuffers_read(t *testing.T)</a>

```
searchKey: net.TestBuffers_read
```

```Go
func TestBuffers_read(t *testing.T)
```

### <a id="TestBuffers_consume" href="#TestBuffers_consume">func TestBuffers_consume(t *testing.T)</a>

```
searchKey: net.TestBuffers_consume
```

```Go
func TestBuffers_consume(t *testing.T)
```

### <a id="TestBuffers_WriteTo" href="#TestBuffers_WriteTo">func TestBuffers_WriteTo(t *testing.T)</a>

```
searchKey: net.TestBuffers_WriteTo
```

```Go
func TestBuffers_WriteTo(t *testing.T)
```

### <a id="testBuffer_writeTo" href="#testBuffer_writeTo">func testBuffer_writeTo(t *testing.T, chunks int, useCopy bool)</a>

```
searchKey: net.testBuffer_writeTo
```

```Go
func testBuffer_writeTo(t *testing.T, chunks int, useCopy bool)
```

### <a id="TestWritevError" href="#TestWritevError">func TestWritevError(t *testing.T)</a>

```
searchKey: net.TestWritevError
```

```Go
func TestWritevError(t *testing.T)
```

### <a id="cgoNameinfoPTR" href="#cgoNameinfoPTR">func cgoNameinfoPTR(b []byte, sa *C.struct_sockaddr, salen C.socklen_t) (int, error)</a>

```
searchKey: net.cgoNameinfoPTR
```

```Go
func cgoNameinfoPTR(b []byte, sa *C.struct_sockaddr, salen C.socklen_t) (int, error)
```

### <a id="cgoSockaddrInet4" href="#cgoSockaddrInet4">func cgoSockaddrInet4(ip IP) *C.struct_sockaddr</a>

```
searchKey: net.cgoSockaddrInet4
```

```Go
func cgoSockaddrInet4(ip IP) *C.struct_sockaddr
```

### <a id="cgoSockaddrInet6" href="#cgoSockaddrInet6">func cgoSockaddrInet6(ip IP, zone int) *C.struct_sockaddr</a>

```
searchKey: net.cgoSockaddrInet6
```

```Go
func cgoSockaddrInet6(ip IP, zone int) *C.struct_sockaddr
```

### <a id="cgoLookupHost" href="#cgoLookupHost">func cgoLookupHost(ctx context.Context, name string) (hosts []string, err error, completed bool)</a>

```
searchKey: net.cgoLookupHost
```

```Go
func cgoLookupHost(ctx context.Context, name string) (hosts []string, err error, completed bool)
```

### <a id="cgoLookupPort" href="#cgoLookupPort">func cgoLookupPort(ctx context.Context, network, service string) (port int, err error, completed bool)</a>

```
searchKey: net.cgoLookupPort
```

```Go
func cgoLookupPort(ctx context.Context, network, service string) (port int, err error, completed bool)
```

### <a id="cgoLookupServicePort" href="#cgoLookupServicePort">func cgoLookupServicePort(hints *C.struct_addrinfo, network, service string) (port int, err error)</a>

```
searchKey: net.cgoLookupServicePort
```

```Go
func cgoLookupServicePort(hints *C.struct_addrinfo, network, service string) (port int, err error)
```

### <a id="cgoPortLookup" href="#cgoPortLookup">func cgoPortLookup(result chan<- portLookupResult, hints *C.struct_addrinfo, network, service string)</a>

```
searchKey: net.cgoPortLookup
```

```Go
func cgoPortLookup(result chan<- portLookupResult, hints *C.struct_addrinfo, network, service string)
```

### <a id="cgoLookupIPCNAME" href="#cgoLookupIPCNAME">func cgoLookupIPCNAME(network, name string) (addrs []IPAddr, cname string, err error)</a>

```
searchKey: net.cgoLookupIPCNAME
```

```Go
func cgoLookupIPCNAME(network, name string) (addrs []IPAddr, cname string, err error)
```

### <a id="cgoIPLookup" href="#cgoIPLookup">func cgoIPLookup(result chan<- ipLookupResult, network, name string)</a>

```
searchKey: net.cgoIPLookup
```

```Go
func cgoIPLookup(result chan<- ipLookupResult, network, name string)
```

### <a id="cgoLookupIP" href="#cgoLookupIP">func cgoLookupIP(ctx context.Context, network, name string) (addrs []IPAddr, err error, completed bool)</a>

```
searchKey: net.cgoLookupIP
```

```Go
func cgoLookupIP(ctx context.Context, network, name string) (addrs []IPAddr, err error, completed bool)
```

### <a id="cgoLookupCNAME" href="#cgoLookupCNAME">func cgoLookupCNAME(ctx context.Context, name string) (cname string, err error, completed bool)</a>

```
searchKey: net.cgoLookupCNAME
```

```Go
func cgoLookupCNAME(ctx context.Context, name string) (cname string, err error, completed bool)
```

### <a id="cgoLookupPTR" href="#cgoLookupPTR">func cgoLookupPTR(ctx context.Context, addr string) (names []string, err error, completed bool)</a>

```
searchKey: net.cgoLookupPTR
```

```Go
func cgoLookupPTR(ctx context.Context, addr string) (names []string, err error, completed bool)
```

### <a id="cgoLookupAddrPTR" href="#cgoLookupAddrPTR">func cgoLookupAddrPTR(addr string, sa *C.struct_sockaddr, salen C.socklen_t) (names []string, err error)</a>

```
searchKey: net.cgoLookupAddrPTR
```

```Go
func cgoLookupAddrPTR(addr string, sa *C.struct_sockaddr, salen C.socklen_t) (names []string, err error)
```

### <a id="cgoReverseLookup" href="#cgoReverseLookup">func cgoReverseLookup(result chan<- reverseLookupResult, addr string, sa *C.struct_sockaddr, salen C.socklen_t)</a>

```
searchKey: net.cgoReverseLookup
```

```Go
func cgoReverseLookup(result chan<- reverseLookupResult, addr string, sa *C.struct_sockaddr, salen C.socklen_t)
```

### <a id="cgoSockaddr" href="#cgoSockaddr">func cgoSockaddr(ip IP, zone string) (*C.struct_sockaddr, C.socklen_t)</a>

```
searchKey: net.cgoSockaddr
```

```Go
func cgoSockaddr(ip IP, zone string) (*C.struct_sockaddr, C.socklen_t)
```

