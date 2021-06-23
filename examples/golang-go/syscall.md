# Package syscall

Package syscall contains an interface to the low-level operating system primitives. The details vary depending on the underlying system, and by default, godoc will display the syscall documentation for the current system. If you want godoc to display syscall documentation for another system, set $GOOS and $GOARCH to the desired system. For example, if you want to view documentation for freebsd/arm on linux/amd64, set $GOOS to freebsd and $GOARCH to arm. The primary use of syscall is inside other packages that provide a more portable interface to the system, such as "os", "time" and "net".  Use those packages rather than this one if you can. For details of the functions and data types in this package consult the manuals for the appropriate operating system. These calls return err == nil to indicate success; otherwise err is an operating system error describing the failure. On most systems, that error has type syscall.Errno. 

Deprecated: this package is locked down. Callers should use the corresponding package in the golang.org/x/sys repository instead. That is also where updates required by new systems or versions should be applied. See [https://golang.org/s/go1.4-syscall](https://golang.org/s/go1.4-syscall) for more information. 

## Index

* [Constants](#const)
    * [const isBigEndian](#isBigEndian)
    * [const msanenabled](#msanenabled)
    * [const offsetofInet4](#offsetofInet4)
    * [const offsetofInet6](#offsetofInet6)
    * [const anyMessageLen](#anyMessageLen)
    * [const ImplementsGetwd](#ImplementsGetwd)
    * [const mask](#mask)
    * [const core](#core)
    * [const shift](#shift)
    * [const exited](#exited)
    * [const stopped](#stopped)
    * [const attrBitMapCount](#attrBitMapCount)
    * [const attrCmnModtime](#attrCmnModtime)
    * [const attrCmnAcctime](#attrCmnAcctime)
    * [const darwin64Bit](#darwin64Bit)
    * [const netbsd32Bit](#netbsd32Bit)
    * [const faketime](#faketime)
    * [const AF_APPLETALK](#AF_APPLETALK)
    * [const AF_CCITT](#AF_CCITT)
    * [const AF_CHAOS](#AF_CHAOS)
    * [const AF_CNT](#AF_CNT)
    * [const AF_COIP](#AF_COIP)
    * [const AF_DATAKIT](#AF_DATAKIT)
    * [const AF_DECnet](#AF_DECnet)
    * [const AF_DLI](#AF_DLI)
    * [const AF_E164](#AF_E164)
    * [const AF_ECMA](#AF_ECMA)
    * [const AF_HYLINK](#AF_HYLINK)
    * [const AF_IEEE80211](#AF_IEEE80211)
    * [const AF_IMPLINK](#AF_IMPLINK)
    * [const AF_INET](#AF_INET)
    * [const AF_INET6](#AF_INET6)
    * [const AF_IPX](#AF_IPX)
    * [const AF_ISDN](#AF_ISDN)
    * [const AF_ISO](#AF_ISO)
    * [const AF_LAT](#AF_LAT)
    * [const AF_LINK](#AF_LINK)
    * [const AF_LOCAL](#AF_LOCAL)
    * [const AF_MAX](#AF_MAX)
    * [const AF_NATM](#AF_NATM)
    * [const AF_NDRV](#AF_NDRV)
    * [const AF_NETBIOS](#AF_NETBIOS)
    * [const AF_NS](#AF_NS)
    * [const AF_OSI](#AF_OSI)
    * [const AF_PPP](#AF_PPP)
    * [const AF_PUP](#AF_PUP)
    * [const AF_RESERVED_36](#AF_RESERVED_36)
    * [const AF_ROUTE](#AF_ROUTE)
    * [const AF_SIP](#AF_SIP)
    * [const AF_SNA](#AF_SNA)
    * [const AF_SYSTEM](#AF_SYSTEM)
    * [const AF_UNIX](#AF_UNIX)
    * [const AF_UNSPEC](#AF_UNSPEC)
    * [const B0](#B0)
    * [const B110](#B110)
    * [const B115200](#B115200)
    * [const B1200](#B1200)
    * [const B134](#B134)
    * [const B14400](#B14400)
    * [const B150](#B150)
    * [const B1800](#B1800)
    * [const B19200](#B19200)
    * [const B200](#B200)
    * [const B230400](#B230400)
    * [const B2400](#B2400)
    * [const B28800](#B28800)
    * [const B300](#B300)
    * [const B38400](#B38400)
    * [const B4800](#B4800)
    * [const B50](#B50)
    * [const B57600](#B57600)
    * [const B600](#B600)
    * [const B7200](#B7200)
    * [const B75](#B75)
    * [const B76800](#B76800)
    * [const B9600](#B9600)
    * [const BIOCFLUSH](#BIOCFLUSH)
    * [const BIOCGBLEN](#BIOCGBLEN)
    * [const BIOCGDLT](#BIOCGDLT)
    * [const BIOCGDLTLIST](#BIOCGDLTLIST)
    * [const BIOCGETIF](#BIOCGETIF)
    * [const BIOCGHDRCMPLT](#BIOCGHDRCMPLT)
    * [const BIOCGRSIG](#BIOCGRSIG)
    * [const BIOCGRTIMEOUT](#BIOCGRTIMEOUT)
    * [const BIOCGSEESENT](#BIOCGSEESENT)
    * [const BIOCGSTATS](#BIOCGSTATS)
    * [const BIOCIMMEDIATE](#BIOCIMMEDIATE)
    * [const BIOCPROMISC](#BIOCPROMISC)
    * [const BIOCSBLEN](#BIOCSBLEN)
    * [const BIOCSDLT](#BIOCSDLT)
    * [const BIOCSETF](#BIOCSETF)
    * [const BIOCSETIF](#BIOCSETIF)
    * [const BIOCSHDRCMPLT](#BIOCSHDRCMPLT)
    * [const BIOCSRSIG](#BIOCSRSIG)
    * [const BIOCSRTIMEOUT](#BIOCSRTIMEOUT)
    * [const BIOCSSEESENT](#BIOCSSEESENT)
    * [const BIOCVERSION](#BIOCVERSION)
    * [const BPF_A](#BPF_A)
    * [const BPF_ABS](#BPF_ABS)
    * [const BPF_ADD](#BPF_ADD)
    * [const BPF_ALIGNMENT](#BPF_ALIGNMENT)
    * [const BPF_ALU](#BPF_ALU)
    * [const BPF_AND](#BPF_AND)
    * [const BPF_B](#BPF_B)
    * [const BPF_DIV](#BPF_DIV)
    * [const BPF_H](#BPF_H)
    * [const BPF_IMM](#BPF_IMM)
    * [const BPF_IND](#BPF_IND)
    * [const BPF_JA](#BPF_JA)
    * [const BPF_JEQ](#BPF_JEQ)
    * [const BPF_JGE](#BPF_JGE)
    * [const BPF_JGT](#BPF_JGT)
    * [const BPF_JMP](#BPF_JMP)
    * [const BPF_JSET](#BPF_JSET)
    * [const BPF_K](#BPF_K)
    * [const BPF_LD](#BPF_LD)
    * [const BPF_LDX](#BPF_LDX)
    * [const BPF_LEN](#BPF_LEN)
    * [const BPF_LSH](#BPF_LSH)
    * [const BPF_MAJOR_VERSION](#BPF_MAJOR_VERSION)
    * [const BPF_MAXBUFSIZE](#BPF_MAXBUFSIZE)
    * [const BPF_MAXINSNS](#BPF_MAXINSNS)
    * [const BPF_MEM](#BPF_MEM)
    * [const BPF_MEMWORDS](#BPF_MEMWORDS)
    * [const BPF_MINBUFSIZE](#BPF_MINBUFSIZE)
    * [const BPF_MINOR_VERSION](#BPF_MINOR_VERSION)
    * [const BPF_MISC](#BPF_MISC)
    * [const BPF_MSH](#BPF_MSH)
    * [const BPF_MUL](#BPF_MUL)
    * [const BPF_NEG](#BPF_NEG)
    * [const BPF_OR](#BPF_OR)
    * [const BPF_RELEASE](#BPF_RELEASE)
    * [const BPF_RET](#BPF_RET)
    * [const BPF_RSH](#BPF_RSH)
    * [const BPF_ST](#BPF_ST)
    * [const BPF_STX](#BPF_STX)
    * [const BPF_SUB](#BPF_SUB)
    * [const BPF_TAX](#BPF_TAX)
    * [const BPF_TXA](#BPF_TXA)
    * [const BPF_W](#BPF_W)
    * [const BPF_X](#BPF_X)
    * [const BRKINT](#BRKINT)
    * [const CFLUSH](#CFLUSH)
    * [const CLOCAL](#CLOCAL)
    * [const CREAD](#CREAD)
    * [const CS5](#CS5)
    * [const CS6](#CS6)
    * [const CS7](#CS7)
    * [const CS8](#CS8)
    * [const CSIZE](#CSIZE)
    * [const CSTART](#CSTART)
    * [const CSTATUS](#CSTATUS)
    * [const CSTOP](#CSTOP)
    * [const CSTOPB](#CSTOPB)
    * [const CSUSP](#CSUSP)
    * [const CTL_MAXNAME](#CTL_MAXNAME)
    * [const CTL_NET](#CTL_NET)
    * [const DLT_APPLE_IP_OVER_IEEE1394](#DLT_APPLE_IP_OVER_IEEE1394)
    * [const DLT_ARCNET](#DLT_ARCNET)
    * [const DLT_ATM_CLIP](#DLT_ATM_CLIP)
    * [const DLT_ATM_RFC1483](#DLT_ATM_RFC1483)
    * [const DLT_AX25](#DLT_AX25)
    * [const DLT_CHAOS](#DLT_CHAOS)
    * [const DLT_CHDLC](#DLT_CHDLC)
    * [const DLT_C_HDLC](#DLT_C_HDLC)
    * [const DLT_EN10MB](#DLT_EN10MB)
    * [const DLT_EN3MB](#DLT_EN3MB)
    * [const DLT_FDDI](#DLT_FDDI)
    * [const DLT_IEEE802](#DLT_IEEE802)
    * [const DLT_IEEE802_11](#DLT_IEEE802_11)
    * [const DLT_IEEE802_11_RADIO](#DLT_IEEE802_11_RADIO)
    * [const DLT_IEEE802_11_RADIO_AVS](#DLT_IEEE802_11_RADIO_AVS)
    * [const DLT_LINUX_SLL](#DLT_LINUX_SLL)
    * [const DLT_LOOP](#DLT_LOOP)
    * [const DLT_NULL](#DLT_NULL)
    * [const DLT_PFLOG](#DLT_PFLOG)
    * [const DLT_PFSYNC](#DLT_PFSYNC)
    * [const DLT_PPP](#DLT_PPP)
    * [const DLT_PPP_BSDOS](#DLT_PPP_BSDOS)
    * [const DLT_PPP_SERIAL](#DLT_PPP_SERIAL)
    * [const DLT_PRONET](#DLT_PRONET)
    * [const DLT_RAW](#DLT_RAW)
    * [const DLT_SLIP](#DLT_SLIP)
    * [const DLT_SLIP_BSDOS](#DLT_SLIP_BSDOS)
    * [const DT_BLK](#DT_BLK)
    * [const DT_CHR](#DT_CHR)
    * [const DT_DIR](#DT_DIR)
    * [const DT_FIFO](#DT_FIFO)
    * [const DT_LNK](#DT_LNK)
    * [const DT_REG](#DT_REG)
    * [const DT_SOCK](#DT_SOCK)
    * [const DT_UNKNOWN](#DT_UNKNOWN)
    * [const DT_WHT](#DT_WHT)
    * [const ECHO](#ECHO)
    * [const ECHOCTL](#ECHOCTL)
    * [const ECHOE](#ECHOE)
    * [const ECHOK](#ECHOK)
    * [const ECHOKE](#ECHOKE)
    * [const ECHONL](#ECHONL)
    * [const ECHOPRT](#ECHOPRT)
    * [const EVFILT_AIO](#EVFILT_AIO)
    * [const EVFILT_FS](#EVFILT_FS)
    * [const EVFILT_MACHPORT](#EVFILT_MACHPORT)
    * [const EVFILT_PROC](#EVFILT_PROC)
    * [const EVFILT_READ](#EVFILT_READ)
    * [const EVFILT_SIGNAL](#EVFILT_SIGNAL)
    * [const EVFILT_SYSCOUNT](#EVFILT_SYSCOUNT)
    * [const EVFILT_THREADMARKER](#EVFILT_THREADMARKER)
    * [const EVFILT_TIMER](#EVFILT_TIMER)
    * [const EVFILT_USER](#EVFILT_USER)
    * [const EVFILT_VM](#EVFILT_VM)
    * [const EVFILT_VNODE](#EVFILT_VNODE)
    * [const EVFILT_WRITE](#EVFILT_WRITE)
    * [const EV_ADD](#EV_ADD)
    * [const EV_CLEAR](#EV_CLEAR)
    * [const EV_DELETE](#EV_DELETE)
    * [const EV_DISABLE](#EV_DISABLE)
    * [const EV_DISPATCH](#EV_DISPATCH)
    * [const EV_ENABLE](#EV_ENABLE)
    * [const EV_EOF](#EV_EOF)
    * [const EV_ERROR](#EV_ERROR)
    * [const EV_FLAG0](#EV_FLAG0)
    * [const EV_FLAG1](#EV_FLAG1)
    * [const EV_ONESHOT](#EV_ONESHOT)
    * [const EV_OOBAND](#EV_OOBAND)
    * [const EV_POLL](#EV_POLL)
    * [const EV_RECEIPT](#EV_RECEIPT)
    * [const EV_SYSFLAGS](#EV_SYSFLAGS)
    * [const EXTA](#EXTA)
    * [const EXTB](#EXTB)
    * [const EXTPROC](#EXTPROC)
    * [const FD_CLOEXEC](#FD_CLOEXEC)
    * [const FD_SETSIZE](#FD_SETSIZE)
    * [const FLUSHO](#FLUSHO)
    * [const F_ADDFILESIGS](#F_ADDFILESIGS)
    * [const F_ADDSIGS](#F_ADDSIGS)
    * [const F_ALLOCATEALL](#F_ALLOCATEALL)
    * [const F_ALLOCATECONTIG](#F_ALLOCATECONTIG)
    * [const F_CHKCLEAN](#F_CHKCLEAN)
    * [const F_DUPFD](#F_DUPFD)
    * [const F_DUPFD_CLOEXEC](#F_DUPFD_CLOEXEC)
    * [const F_FLUSH_DATA](#F_FLUSH_DATA)
    * [const F_FREEZE_FS](#F_FREEZE_FS)
    * [const F_FULLFSYNC](#F_FULLFSYNC)
    * [const F_GETFD](#F_GETFD)
    * [const F_GETFL](#F_GETFL)
    * [const F_GETLK](#F_GETLK)
    * [const F_GETLKPID](#F_GETLKPID)
    * [const F_GETNOSIGPIPE](#F_GETNOSIGPIPE)
    * [const F_GETOWN](#F_GETOWN)
    * [const F_GETPATH](#F_GETPATH)
    * [const F_GETPATH_MTMINFO](#F_GETPATH_MTMINFO)
    * [const F_GETPROTECTIONCLASS](#F_GETPROTECTIONCLASS)
    * [const F_GLOBAL_NOCACHE](#F_GLOBAL_NOCACHE)
    * [const F_LOG2PHYS](#F_LOG2PHYS)
    * [const F_LOG2PHYS_EXT](#F_LOG2PHYS_EXT)
    * [const F_MARKDEPENDENCY](#F_MARKDEPENDENCY)
    * [const F_NOCACHE](#F_NOCACHE)
    * [const F_NODIRECT](#F_NODIRECT)
    * [const F_OK](#F_OK)
    * [const F_PATHPKG_CHECK](#F_PATHPKG_CHECK)
    * [const F_PEOFPOSMODE](#F_PEOFPOSMODE)
    * [const F_PREALLOCATE](#F_PREALLOCATE)
    * [const F_RDADVISE](#F_RDADVISE)
    * [const F_RDAHEAD](#F_RDAHEAD)
    * [const F_RDLCK](#F_RDLCK)
    * [const F_READBOOTSTRAP](#F_READBOOTSTRAP)
    * [const F_SETBACKINGSTORE](#F_SETBACKINGSTORE)
    * [const F_SETFD](#F_SETFD)
    * [const F_SETFL](#F_SETFL)
    * [const F_SETLK](#F_SETLK)
    * [const F_SETLKW](#F_SETLKW)
    * [const F_SETNOSIGPIPE](#F_SETNOSIGPIPE)
    * [const F_SETOWN](#F_SETOWN)
    * [const F_SETPROTECTIONCLASS](#F_SETPROTECTIONCLASS)
    * [const F_SETSIZE](#F_SETSIZE)
    * [const F_THAW_FS](#F_THAW_FS)
    * [const F_UNLCK](#F_UNLCK)
    * [const F_VOLPOSMODE](#F_VOLPOSMODE)
    * [const F_WRITEBOOTSTRAP](#F_WRITEBOOTSTRAP)
    * [const F_WRLCK](#F_WRLCK)
    * [const HUPCL](#HUPCL)
    * [const ICANON](#ICANON)
    * [const ICMP6_FILTER](#ICMP6_FILTER)
    * [const ICRNL](#ICRNL)
    * [const IEXTEN](#IEXTEN)
    * [const IFF_ALLMULTI](#IFF_ALLMULTI)
    * [const IFF_ALTPHYS](#IFF_ALTPHYS)
    * [const IFF_BROADCAST](#IFF_BROADCAST)
    * [const IFF_DEBUG](#IFF_DEBUG)
    * [const IFF_LINK0](#IFF_LINK0)
    * [const IFF_LINK1](#IFF_LINK1)
    * [const IFF_LINK2](#IFF_LINK2)
    * [const IFF_LOOPBACK](#IFF_LOOPBACK)
    * [const IFF_MULTICAST](#IFF_MULTICAST)
    * [const IFF_NOARP](#IFF_NOARP)
    * [const IFF_NOTRAILERS](#IFF_NOTRAILERS)
    * [const IFF_OACTIVE](#IFF_OACTIVE)
    * [const IFF_POINTOPOINT](#IFF_POINTOPOINT)
    * [const IFF_PROMISC](#IFF_PROMISC)
    * [const IFF_RUNNING](#IFF_RUNNING)
    * [const IFF_SIMPLEX](#IFF_SIMPLEX)
    * [const IFF_UP](#IFF_UP)
    * [const IFNAMSIZ](#IFNAMSIZ)
    * [const IFT_1822](#IFT_1822)
    * [const IFT_AAL5](#IFT_AAL5)
    * [const IFT_ARCNET](#IFT_ARCNET)
    * [const IFT_ARCNETPLUS](#IFT_ARCNETPLUS)
    * [const IFT_ATM](#IFT_ATM)
    * [const IFT_BRIDGE](#IFT_BRIDGE)
    * [const IFT_CARP](#IFT_CARP)
    * [const IFT_CELLULAR](#IFT_CELLULAR)
    * [const IFT_CEPT](#IFT_CEPT)
    * [const IFT_DS3](#IFT_DS3)
    * [const IFT_ENC](#IFT_ENC)
    * [const IFT_EON](#IFT_EON)
    * [const IFT_ETHER](#IFT_ETHER)
    * [const IFT_FAITH](#IFT_FAITH)
    * [const IFT_FDDI](#IFT_FDDI)
    * [const IFT_FRELAY](#IFT_FRELAY)
    * [const IFT_FRELAYDCE](#IFT_FRELAYDCE)
    * [const IFT_GIF](#IFT_GIF)
    * [const IFT_HDH1822](#IFT_HDH1822)
    * [const IFT_HIPPI](#IFT_HIPPI)
    * [const IFT_HSSI](#IFT_HSSI)
    * [const IFT_HY](#IFT_HY)
    * [const IFT_IEEE1394](#IFT_IEEE1394)
    * [const IFT_IEEE8023ADLAG](#IFT_IEEE8023ADLAG)
    * [const IFT_ISDNBASIC](#IFT_ISDNBASIC)
    * [const IFT_ISDNPRIMARY](#IFT_ISDNPRIMARY)
    * [const IFT_ISO88022LLC](#IFT_ISO88022LLC)
    * [const IFT_ISO88023](#IFT_ISO88023)
    * [const IFT_ISO88024](#IFT_ISO88024)
    * [const IFT_ISO88025](#IFT_ISO88025)
    * [const IFT_ISO88026](#IFT_ISO88026)
    * [const IFT_L2VLAN](#IFT_L2VLAN)
    * [const IFT_LAPB](#IFT_LAPB)
    * [const IFT_LOCALTALK](#IFT_LOCALTALK)
    * [const IFT_LOOP](#IFT_LOOP)
    * [const IFT_MIOX25](#IFT_MIOX25)
    * [const IFT_MODEM](#IFT_MODEM)
    * [const IFT_NSIP](#IFT_NSIP)
    * [const IFT_OTHER](#IFT_OTHER)
    * [const IFT_P10](#IFT_P10)
    * [const IFT_P80](#IFT_P80)
    * [const IFT_PARA](#IFT_PARA)
    * [const IFT_PDP](#IFT_PDP)
    * [const IFT_PFLOG](#IFT_PFLOG)
    * [const IFT_PFSYNC](#IFT_PFSYNC)
    * [const IFT_PPP](#IFT_PPP)
    * [const IFT_PROPMUX](#IFT_PROPMUX)
    * [const IFT_PROPVIRTUAL](#IFT_PROPVIRTUAL)
    * [const IFT_PTPSERIAL](#IFT_PTPSERIAL)
    * [const IFT_RS232](#IFT_RS232)
    * [const IFT_SDLC](#IFT_SDLC)
    * [const IFT_SIP](#IFT_SIP)
    * [const IFT_SLIP](#IFT_SLIP)
    * [const IFT_SMDSDXI](#IFT_SMDSDXI)
    * [const IFT_SMDSICIP](#IFT_SMDSICIP)
    * [const IFT_SONET](#IFT_SONET)
    * [const IFT_SONETPATH](#IFT_SONETPATH)
    * [const IFT_SONETVT](#IFT_SONETVT)
    * [const IFT_STARLAN](#IFT_STARLAN)
    * [const IFT_STF](#IFT_STF)
    * [const IFT_T1](#IFT_T1)
    * [const IFT_ULTRA](#IFT_ULTRA)
    * [const IFT_V35](#IFT_V35)
    * [const IFT_X25](#IFT_X25)
    * [const IFT_X25DDN](#IFT_X25DDN)
    * [const IFT_X25PLE](#IFT_X25PLE)
    * [const IFT_XETHER](#IFT_XETHER)
    * [const IGNBRK](#IGNBRK)
    * [const IGNCR](#IGNCR)
    * [const IGNPAR](#IGNPAR)
    * [const IMAXBEL](#IMAXBEL)
    * [const INLCR](#INLCR)
    * [const INPCK](#INPCK)
    * [const IN_CLASSA_HOST](#IN_CLASSA_HOST)
    * [const IN_CLASSA_MAX](#IN_CLASSA_MAX)
    * [const IN_CLASSA_NET](#IN_CLASSA_NET)
    * [const IN_CLASSA_NSHIFT](#IN_CLASSA_NSHIFT)
    * [const IN_CLASSB_HOST](#IN_CLASSB_HOST)
    * [const IN_CLASSB_MAX](#IN_CLASSB_MAX)
    * [const IN_CLASSB_NET](#IN_CLASSB_NET)
    * [const IN_CLASSB_NSHIFT](#IN_CLASSB_NSHIFT)
    * [const IN_CLASSC_HOST](#IN_CLASSC_HOST)
    * [const IN_CLASSC_NET](#IN_CLASSC_NET)
    * [const IN_CLASSC_NSHIFT](#IN_CLASSC_NSHIFT)
    * [const IN_CLASSD_HOST](#IN_CLASSD_HOST)
    * [const IN_CLASSD_NET](#IN_CLASSD_NET)
    * [const IN_CLASSD_NSHIFT](#IN_CLASSD_NSHIFT)
    * [const IN_LINKLOCALNETNUM](#IN_LINKLOCALNETNUM)
    * [const IN_LOOPBACKNET](#IN_LOOPBACKNET)
    * [const IPPROTO_3PC](#IPPROTO_3PC)
    * [const IPPROTO_ADFS](#IPPROTO_ADFS)
    * [const IPPROTO_AH](#IPPROTO_AH)
    * [const IPPROTO_AHIP](#IPPROTO_AHIP)
    * [const IPPROTO_APES](#IPPROTO_APES)
    * [const IPPROTO_ARGUS](#IPPROTO_ARGUS)
    * [const IPPROTO_AX25](#IPPROTO_AX25)
    * [const IPPROTO_BHA](#IPPROTO_BHA)
    * [const IPPROTO_BLT](#IPPROTO_BLT)
    * [const IPPROTO_BRSATMON](#IPPROTO_BRSATMON)
    * [const IPPROTO_CFTP](#IPPROTO_CFTP)
    * [const IPPROTO_CHAOS](#IPPROTO_CHAOS)
    * [const IPPROTO_CMTP](#IPPROTO_CMTP)
    * [const IPPROTO_CPHB](#IPPROTO_CPHB)
    * [const IPPROTO_CPNX](#IPPROTO_CPNX)
    * [const IPPROTO_DDP](#IPPROTO_DDP)
    * [const IPPROTO_DGP](#IPPROTO_DGP)
    * [const IPPROTO_DIVERT](#IPPROTO_DIVERT)
    * [const IPPROTO_DONE](#IPPROTO_DONE)
    * [const IPPROTO_DSTOPTS](#IPPROTO_DSTOPTS)
    * [const IPPROTO_EGP](#IPPROTO_EGP)
    * [const IPPROTO_EMCON](#IPPROTO_EMCON)
    * [const IPPROTO_ENCAP](#IPPROTO_ENCAP)
    * [const IPPROTO_EON](#IPPROTO_EON)
    * [const IPPROTO_ESP](#IPPROTO_ESP)
    * [const IPPROTO_ETHERIP](#IPPROTO_ETHERIP)
    * [const IPPROTO_FRAGMENT](#IPPROTO_FRAGMENT)
    * [const IPPROTO_GGP](#IPPROTO_GGP)
    * [const IPPROTO_GMTP](#IPPROTO_GMTP)
    * [const IPPROTO_GRE](#IPPROTO_GRE)
    * [const IPPROTO_HELLO](#IPPROTO_HELLO)
    * [const IPPROTO_HMP](#IPPROTO_HMP)
    * [const IPPROTO_HOPOPTS](#IPPROTO_HOPOPTS)
    * [const IPPROTO_ICMP](#IPPROTO_ICMP)
    * [const IPPROTO_ICMPV6](#IPPROTO_ICMPV6)
    * [const IPPROTO_IDP](#IPPROTO_IDP)
    * [const IPPROTO_IDPR](#IPPROTO_IDPR)
    * [const IPPROTO_IDRP](#IPPROTO_IDRP)
    * [const IPPROTO_IGMP](#IPPROTO_IGMP)
    * [const IPPROTO_IGP](#IPPROTO_IGP)
    * [const IPPROTO_IGRP](#IPPROTO_IGRP)
    * [const IPPROTO_IL](#IPPROTO_IL)
    * [const IPPROTO_INLSP](#IPPROTO_INLSP)
    * [const IPPROTO_INP](#IPPROTO_INP)
    * [const IPPROTO_IP](#IPPROTO_IP)
    * [const IPPROTO_IPCOMP](#IPPROTO_IPCOMP)
    * [const IPPROTO_IPCV](#IPPROTO_IPCV)
    * [const IPPROTO_IPEIP](#IPPROTO_IPEIP)
    * [const IPPROTO_IPIP](#IPPROTO_IPIP)
    * [const IPPROTO_IPPC](#IPPROTO_IPPC)
    * [const IPPROTO_IPV4](#IPPROTO_IPV4)
    * [const IPPROTO_IPV6](#IPPROTO_IPV6)
    * [const IPPROTO_IRTP](#IPPROTO_IRTP)
    * [const IPPROTO_KRYPTOLAN](#IPPROTO_KRYPTOLAN)
    * [const IPPROTO_LARP](#IPPROTO_LARP)
    * [const IPPROTO_LEAF1](#IPPROTO_LEAF1)
    * [const IPPROTO_LEAF2](#IPPROTO_LEAF2)
    * [const IPPROTO_MAX](#IPPROTO_MAX)
    * [const IPPROTO_MAXID](#IPPROTO_MAXID)
    * [const IPPROTO_MEAS](#IPPROTO_MEAS)
    * [const IPPROTO_MHRP](#IPPROTO_MHRP)
    * [const IPPROTO_MICP](#IPPROTO_MICP)
    * [const IPPROTO_MTP](#IPPROTO_MTP)
    * [const IPPROTO_MUX](#IPPROTO_MUX)
    * [const IPPROTO_ND](#IPPROTO_ND)
    * [const IPPROTO_NHRP](#IPPROTO_NHRP)
    * [const IPPROTO_NONE](#IPPROTO_NONE)
    * [const IPPROTO_NSP](#IPPROTO_NSP)
    * [const IPPROTO_NVPII](#IPPROTO_NVPII)
    * [const IPPROTO_OSPFIGP](#IPPROTO_OSPFIGP)
    * [const IPPROTO_PGM](#IPPROTO_PGM)
    * [const IPPROTO_PIGP](#IPPROTO_PIGP)
    * [const IPPROTO_PIM](#IPPROTO_PIM)
    * [const IPPROTO_PRM](#IPPROTO_PRM)
    * [const IPPROTO_PUP](#IPPROTO_PUP)
    * [const IPPROTO_PVP](#IPPROTO_PVP)
    * [const IPPROTO_RAW](#IPPROTO_RAW)
    * [const IPPROTO_RCCMON](#IPPROTO_RCCMON)
    * [const IPPROTO_RDP](#IPPROTO_RDP)
    * [const IPPROTO_ROUTING](#IPPROTO_ROUTING)
    * [const IPPROTO_RSVP](#IPPROTO_RSVP)
    * [const IPPROTO_RVD](#IPPROTO_RVD)
    * [const IPPROTO_SATEXPAK](#IPPROTO_SATEXPAK)
    * [const IPPROTO_SATMON](#IPPROTO_SATMON)
    * [const IPPROTO_SCCSP](#IPPROTO_SCCSP)
    * [const IPPROTO_SCTP](#IPPROTO_SCTP)
    * [const IPPROTO_SDRP](#IPPROTO_SDRP)
    * [const IPPROTO_SEP](#IPPROTO_SEP)
    * [const IPPROTO_SRPC](#IPPROTO_SRPC)
    * [const IPPROTO_ST](#IPPROTO_ST)
    * [const IPPROTO_SVMTP](#IPPROTO_SVMTP)
    * [const IPPROTO_SWIPE](#IPPROTO_SWIPE)
    * [const IPPROTO_TCF](#IPPROTO_TCF)
    * [const IPPROTO_TCP](#IPPROTO_TCP)
    * [const IPPROTO_TP](#IPPROTO_TP)
    * [const IPPROTO_TPXX](#IPPROTO_TPXX)
    * [const IPPROTO_TRUNK1](#IPPROTO_TRUNK1)
    * [const IPPROTO_TRUNK2](#IPPROTO_TRUNK2)
    * [const IPPROTO_TTP](#IPPROTO_TTP)
    * [const IPPROTO_UDP](#IPPROTO_UDP)
    * [const IPPROTO_VINES](#IPPROTO_VINES)
    * [const IPPROTO_VISA](#IPPROTO_VISA)
    * [const IPPROTO_VMTP](#IPPROTO_VMTP)
    * [const IPPROTO_WBEXPAK](#IPPROTO_WBEXPAK)
    * [const IPPROTO_WBMON](#IPPROTO_WBMON)
    * [const IPPROTO_WSN](#IPPROTO_WSN)
    * [const IPPROTO_XNET](#IPPROTO_XNET)
    * [const IPPROTO_XTP](#IPPROTO_XTP)
    * [const IPV6_2292DSTOPTS](#IPV6_2292DSTOPTS)
    * [const IPV6_2292HOPLIMIT](#IPV6_2292HOPLIMIT)
    * [const IPV6_2292HOPOPTS](#IPV6_2292HOPOPTS)
    * [const IPV6_2292NEXTHOP](#IPV6_2292NEXTHOP)
    * [const IPV6_2292PKTINFO](#IPV6_2292PKTINFO)
    * [const IPV6_2292PKTOPTIONS](#IPV6_2292PKTOPTIONS)
    * [const IPV6_2292RTHDR](#IPV6_2292RTHDR)
    * [const IPV6_BINDV6ONLY](#IPV6_BINDV6ONLY)
    * [const IPV6_BOUND_IF](#IPV6_BOUND_IF)
    * [const IPV6_CHECKSUM](#IPV6_CHECKSUM)
    * [const IPV6_DEFAULT_MULTICAST_HOPS](#IPV6_DEFAULT_MULTICAST_HOPS)
    * [const IPV6_DEFAULT_MULTICAST_LOOP](#IPV6_DEFAULT_MULTICAST_LOOP)
    * [const IPV6_DEFHLIM](#IPV6_DEFHLIM)
    * [const IPV6_FAITH](#IPV6_FAITH)
    * [const IPV6_FLOWINFO_MASK](#IPV6_FLOWINFO_MASK)
    * [const IPV6_FLOWLABEL_MASK](#IPV6_FLOWLABEL_MASK)
    * [const IPV6_FRAGTTL](#IPV6_FRAGTTL)
    * [const IPV6_FW_ADD](#IPV6_FW_ADD)
    * [const IPV6_FW_DEL](#IPV6_FW_DEL)
    * [const IPV6_FW_FLUSH](#IPV6_FW_FLUSH)
    * [const IPV6_FW_GET](#IPV6_FW_GET)
    * [const IPV6_FW_ZERO](#IPV6_FW_ZERO)
    * [const IPV6_HLIMDEC](#IPV6_HLIMDEC)
    * [const IPV6_IPSEC_POLICY](#IPV6_IPSEC_POLICY)
    * [const IPV6_JOIN_GROUP](#IPV6_JOIN_GROUP)
    * [const IPV6_LEAVE_GROUP](#IPV6_LEAVE_GROUP)
    * [const IPV6_MAXHLIM](#IPV6_MAXHLIM)
    * [const IPV6_MAXOPTHDR](#IPV6_MAXOPTHDR)
    * [const IPV6_MAXPACKET](#IPV6_MAXPACKET)
    * [const IPV6_MAX_GROUP_SRC_FILTER](#IPV6_MAX_GROUP_SRC_FILTER)
    * [const IPV6_MAX_MEMBERSHIPS](#IPV6_MAX_MEMBERSHIPS)
    * [const IPV6_MAX_SOCK_SRC_FILTER](#IPV6_MAX_SOCK_SRC_FILTER)
    * [const IPV6_MIN_MEMBERSHIPS](#IPV6_MIN_MEMBERSHIPS)
    * [const IPV6_MMTU](#IPV6_MMTU)
    * [const IPV6_MULTICAST_HOPS](#IPV6_MULTICAST_HOPS)
    * [const IPV6_MULTICAST_IF](#IPV6_MULTICAST_IF)
    * [const IPV6_MULTICAST_LOOP](#IPV6_MULTICAST_LOOP)
    * [const IPV6_PORTRANGE](#IPV6_PORTRANGE)
    * [const IPV6_PORTRANGE_DEFAULT](#IPV6_PORTRANGE_DEFAULT)
    * [const IPV6_PORTRANGE_HIGH](#IPV6_PORTRANGE_HIGH)
    * [const IPV6_PORTRANGE_LOW](#IPV6_PORTRANGE_LOW)
    * [const IPV6_RECVTCLASS](#IPV6_RECVTCLASS)
    * [const IPV6_RTHDR_LOOSE](#IPV6_RTHDR_LOOSE)
    * [const IPV6_RTHDR_STRICT](#IPV6_RTHDR_STRICT)
    * [const IPV6_RTHDR_TYPE_0](#IPV6_RTHDR_TYPE_0)
    * [const IPV6_SOCKOPT_RESERVED1](#IPV6_SOCKOPT_RESERVED1)
    * [const IPV6_TCLASS](#IPV6_TCLASS)
    * [const IPV6_UNICAST_HOPS](#IPV6_UNICAST_HOPS)
    * [const IPV6_V6ONLY](#IPV6_V6ONLY)
    * [const IPV6_VERSION](#IPV6_VERSION)
    * [const IPV6_VERSION_MASK](#IPV6_VERSION_MASK)
    * [const IP_ADD_MEMBERSHIP](#IP_ADD_MEMBERSHIP)
    * [const IP_ADD_SOURCE_MEMBERSHIP](#IP_ADD_SOURCE_MEMBERSHIP)
    * [const IP_BLOCK_SOURCE](#IP_BLOCK_SOURCE)
    * [const IP_BOUND_IF](#IP_BOUND_IF)
    * [const IP_DEFAULT_MULTICAST_LOOP](#IP_DEFAULT_MULTICAST_LOOP)
    * [const IP_DEFAULT_MULTICAST_TTL](#IP_DEFAULT_MULTICAST_TTL)
    * [const IP_DF](#IP_DF)
    * [const IP_DROP_MEMBERSHIP](#IP_DROP_MEMBERSHIP)
    * [const IP_DROP_SOURCE_MEMBERSHIP](#IP_DROP_SOURCE_MEMBERSHIP)
    * [const IP_DUMMYNET_CONFIGURE](#IP_DUMMYNET_CONFIGURE)
    * [const IP_DUMMYNET_DEL](#IP_DUMMYNET_DEL)
    * [const IP_DUMMYNET_FLUSH](#IP_DUMMYNET_FLUSH)
    * [const IP_DUMMYNET_GET](#IP_DUMMYNET_GET)
    * [const IP_FAITH](#IP_FAITH)
    * [const IP_FW_ADD](#IP_FW_ADD)
    * [const IP_FW_DEL](#IP_FW_DEL)
    * [const IP_FW_FLUSH](#IP_FW_FLUSH)
    * [const IP_FW_GET](#IP_FW_GET)
    * [const IP_FW_RESETLOG](#IP_FW_RESETLOG)
    * [const IP_FW_ZERO](#IP_FW_ZERO)
    * [const IP_HDRINCL](#IP_HDRINCL)
    * [const IP_IPSEC_POLICY](#IP_IPSEC_POLICY)
    * [const IP_MAXPACKET](#IP_MAXPACKET)
    * [const IP_MAX_GROUP_SRC_FILTER](#IP_MAX_GROUP_SRC_FILTER)
    * [const IP_MAX_MEMBERSHIPS](#IP_MAX_MEMBERSHIPS)
    * [const IP_MAX_SOCK_MUTE_FILTER](#IP_MAX_SOCK_MUTE_FILTER)
    * [const IP_MAX_SOCK_SRC_FILTER](#IP_MAX_SOCK_SRC_FILTER)
    * [const IP_MF](#IP_MF)
    * [const IP_MIN_MEMBERSHIPS](#IP_MIN_MEMBERSHIPS)
    * [const IP_MSFILTER](#IP_MSFILTER)
    * [const IP_MSS](#IP_MSS)
    * [const IP_MULTICAST_IF](#IP_MULTICAST_IF)
    * [const IP_MULTICAST_IFINDEX](#IP_MULTICAST_IFINDEX)
    * [const IP_MULTICAST_LOOP](#IP_MULTICAST_LOOP)
    * [const IP_MULTICAST_TTL](#IP_MULTICAST_TTL)
    * [const IP_MULTICAST_VIF](#IP_MULTICAST_VIF)
    * [const IP_NAT__XXX](#IP_NAT__XXX)
    * [const IP_OFFMASK](#IP_OFFMASK)
    * [const IP_OLD_FW_ADD](#IP_OLD_FW_ADD)
    * [const IP_OLD_FW_DEL](#IP_OLD_FW_DEL)
    * [const IP_OLD_FW_FLUSH](#IP_OLD_FW_FLUSH)
    * [const IP_OLD_FW_GET](#IP_OLD_FW_GET)
    * [const IP_OLD_FW_RESETLOG](#IP_OLD_FW_RESETLOG)
    * [const IP_OLD_FW_ZERO](#IP_OLD_FW_ZERO)
    * [const IP_OPTIONS](#IP_OPTIONS)
    * [const IP_PKTINFO](#IP_PKTINFO)
    * [const IP_PORTRANGE](#IP_PORTRANGE)
    * [const IP_PORTRANGE_DEFAULT](#IP_PORTRANGE_DEFAULT)
    * [const IP_PORTRANGE_HIGH](#IP_PORTRANGE_HIGH)
    * [const IP_PORTRANGE_LOW](#IP_PORTRANGE_LOW)
    * [const IP_RECVDSTADDR](#IP_RECVDSTADDR)
    * [const IP_RECVIF](#IP_RECVIF)
    * [const IP_RECVOPTS](#IP_RECVOPTS)
    * [const IP_RECVPKTINFO](#IP_RECVPKTINFO)
    * [const IP_RECVRETOPTS](#IP_RECVRETOPTS)
    * [const IP_RECVTTL](#IP_RECVTTL)
    * [const IP_RETOPTS](#IP_RETOPTS)
    * [const IP_RF](#IP_RF)
    * [const IP_RSVP_OFF](#IP_RSVP_OFF)
    * [const IP_RSVP_ON](#IP_RSVP_ON)
    * [const IP_RSVP_VIF_OFF](#IP_RSVP_VIF_OFF)
    * [const IP_RSVP_VIF_ON](#IP_RSVP_VIF_ON)
    * [const IP_STRIPHDR](#IP_STRIPHDR)
    * [const IP_TOS](#IP_TOS)
    * [const IP_TRAFFIC_MGT_BACKGROUND](#IP_TRAFFIC_MGT_BACKGROUND)
    * [const IP_TTL](#IP_TTL)
    * [const IP_UNBLOCK_SOURCE](#IP_UNBLOCK_SOURCE)
    * [const ISIG](#ISIG)
    * [const ISTRIP](#ISTRIP)
    * [const IUTF8](#IUTF8)
    * [const IXANY](#IXANY)
    * [const IXOFF](#IXOFF)
    * [const IXON](#IXON)
    * [const LOCK_EX](#LOCK_EX)
    * [const LOCK_NB](#LOCK_NB)
    * [const LOCK_SH](#LOCK_SH)
    * [const LOCK_UN](#LOCK_UN)
    * [const MADV_CAN_REUSE](#MADV_CAN_REUSE)
    * [const MADV_DONTNEED](#MADV_DONTNEED)
    * [const MADV_FREE](#MADV_FREE)
    * [const MADV_FREE_REUSABLE](#MADV_FREE_REUSABLE)
    * [const MADV_FREE_REUSE](#MADV_FREE_REUSE)
    * [const MADV_NORMAL](#MADV_NORMAL)
    * [const MADV_RANDOM](#MADV_RANDOM)
    * [const MADV_SEQUENTIAL](#MADV_SEQUENTIAL)
    * [const MADV_WILLNEED](#MADV_WILLNEED)
    * [const MADV_ZERO_WIRED_PAGES](#MADV_ZERO_WIRED_PAGES)
    * [const MAP_ANON](#MAP_ANON)
    * [const MAP_COPY](#MAP_COPY)
    * [const MAP_FILE](#MAP_FILE)
    * [const MAP_FIXED](#MAP_FIXED)
    * [const MAP_HASSEMAPHORE](#MAP_HASSEMAPHORE)
    * [const MAP_JIT](#MAP_JIT)
    * [const MAP_NOCACHE](#MAP_NOCACHE)
    * [const MAP_NOEXTEND](#MAP_NOEXTEND)
    * [const MAP_NORESERVE](#MAP_NORESERVE)
    * [const MAP_PRIVATE](#MAP_PRIVATE)
    * [const MAP_RENAME](#MAP_RENAME)
    * [const MAP_RESERVED0080](#MAP_RESERVED0080)
    * [const MAP_SHARED](#MAP_SHARED)
    * [const MCL_CURRENT](#MCL_CURRENT)
    * [const MCL_FUTURE](#MCL_FUTURE)
    * [const MSG_CTRUNC](#MSG_CTRUNC)
    * [const MSG_DONTROUTE](#MSG_DONTROUTE)
    * [const MSG_DONTWAIT](#MSG_DONTWAIT)
    * [const MSG_EOF](#MSG_EOF)
    * [const MSG_EOR](#MSG_EOR)
    * [const MSG_FLUSH](#MSG_FLUSH)
    * [const MSG_HAVEMORE](#MSG_HAVEMORE)
    * [const MSG_HOLD](#MSG_HOLD)
    * [const MSG_NEEDSA](#MSG_NEEDSA)
    * [const MSG_OOB](#MSG_OOB)
    * [const MSG_PEEK](#MSG_PEEK)
    * [const MSG_RCVMORE](#MSG_RCVMORE)
    * [const MSG_SEND](#MSG_SEND)
    * [const MSG_TRUNC](#MSG_TRUNC)
    * [const MSG_WAITALL](#MSG_WAITALL)
    * [const MSG_WAITSTREAM](#MSG_WAITSTREAM)
    * [const MS_ASYNC](#MS_ASYNC)
    * [const MS_DEACTIVATE](#MS_DEACTIVATE)
    * [const MS_INVALIDATE](#MS_INVALIDATE)
    * [const MS_KILLPAGES](#MS_KILLPAGES)
    * [const MS_SYNC](#MS_SYNC)
    * [const NAME_MAX](#NAME_MAX)
    * [const NET_RT_DUMP](#NET_RT_DUMP)
    * [const NET_RT_DUMP2](#NET_RT_DUMP2)
    * [const NET_RT_FLAGS](#NET_RT_FLAGS)
    * [const NET_RT_IFLIST](#NET_RT_IFLIST)
    * [const NET_RT_IFLIST2](#NET_RT_IFLIST2)
    * [const NET_RT_MAXID](#NET_RT_MAXID)
    * [const NET_RT_STAT](#NET_RT_STAT)
    * [const NET_RT_TRASH](#NET_RT_TRASH)
    * [const NOFLSH](#NOFLSH)
    * [const NOTE_ABSOLUTE](#NOTE_ABSOLUTE)
    * [const NOTE_ATTRIB](#NOTE_ATTRIB)
    * [const NOTE_CHILD](#NOTE_CHILD)
    * [const NOTE_DELETE](#NOTE_DELETE)
    * [const NOTE_EXEC](#NOTE_EXEC)
    * [const NOTE_EXIT](#NOTE_EXIT)
    * [const NOTE_EXITSTATUS](#NOTE_EXITSTATUS)
    * [const NOTE_EXTEND](#NOTE_EXTEND)
    * [const NOTE_FFAND](#NOTE_FFAND)
    * [const NOTE_FFCOPY](#NOTE_FFCOPY)
    * [const NOTE_FFCTRLMASK](#NOTE_FFCTRLMASK)
    * [const NOTE_FFLAGSMASK](#NOTE_FFLAGSMASK)
    * [const NOTE_FFNOP](#NOTE_FFNOP)
    * [const NOTE_FFOR](#NOTE_FFOR)
    * [const NOTE_FORK](#NOTE_FORK)
    * [const NOTE_LINK](#NOTE_LINK)
    * [const NOTE_LOWAT](#NOTE_LOWAT)
    * [const NOTE_NONE](#NOTE_NONE)
    * [const NOTE_NSECONDS](#NOTE_NSECONDS)
    * [const NOTE_PCTRLMASK](#NOTE_PCTRLMASK)
    * [const NOTE_PDATAMASK](#NOTE_PDATAMASK)
    * [const NOTE_REAP](#NOTE_REAP)
    * [const NOTE_RENAME](#NOTE_RENAME)
    * [const NOTE_RESOURCEEND](#NOTE_RESOURCEEND)
    * [const NOTE_REVOKE](#NOTE_REVOKE)
    * [const NOTE_SECONDS](#NOTE_SECONDS)
    * [const NOTE_SIGNAL](#NOTE_SIGNAL)
    * [const NOTE_TRACK](#NOTE_TRACK)
    * [const NOTE_TRACKERR](#NOTE_TRACKERR)
    * [const NOTE_TRIGGER](#NOTE_TRIGGER)
    * [const NOTE_USECONDS](#NOTE_USECONDS)
    * [const NOTE_VM_ERROR](#NOTE_VM_ERROR)
    * [const NOTE_VM_PRESSURE](#NOTE_VM_PRESSURE)
    * [const NOTE_VM_PRESSURE_SUDDEN_TERMINATE](#NOTE_VM_PRESSURE_SUDDEN_TERMINATE)
    * [const NOTE_VM_PRESSURE_TERMINATE](#NOTE_VM_PRESSURE_TERMINATE)
    * [const NOTE_WRITE](#NOTE_WRITE)
    * [const OCRNL](#OCRNL)
    * [const OFDEL](#OFDEL)
    * [const OFILL](#OFILL)
    * [const ONLCR](#ONLCR)
    * [const ONLRET](#ONLRET)
    * [const ONOCR](#ONOCR)
    * [const ONOEOT](#ONOEOT)
    * [const OPOST](#OPOST)
    * [const O_ACCMODE](#O_ACCMODE)
    * [const O_ALERT](#O_ALERT)
    * [const O_APPEND](#O_APPEND)
    * [const O_ASYNC](#O_ASYNC)
    * [const O_CLOEXEC](#O_CLOEXEC)
    * [const O_CREAT](#O_CREAT)
    * [const O_DIRECTORY](#O_DIRECTORY)
    * [const O_DSYNC](#O_DSYNC)
    * [const O_EVTONLY](#O_EVTONLY)
    * [const O_EXCL](#O_EXCL)
    * [const O_EXLOCK](#O_EXLOCK)
    * [const O_FSYNC](#O_FSYNC)
    * [const O_NDELAY](#O_NDELAY)
    * [const O_NOCTTY](#O_NOCTTY)
    * [const O_NOFOLLOW](#O_NOFOLLOW)
    * [const O_NONBLOCK](#O_NONBLOCK)
    * [const O_POPUP](#O_POPUP)
    * [const O_RDONLY](#O_RDONLY)
    * [const O_RDWR](#O_RDWR)
    * [const O_SHLOCK](#O_SHLOCK)
    * [const O_SYMLINK](#O_SYMLINK)
    * [const O_SYNC](#O_SYNC)
    * [const O_TRUNC](#O_TRUNC)
    * [const O_WRONLY](#O_WRONLY)
    * [const PARENB](#PARENB)
    * [const PARMRK](#PARMRK)
    * [const PARODD](#PARODD)
    * [const PENDIN](#PENDIN)
    * [const PRIO_PGRP](#PRIO_PGRP)
    * [const PRIO_PROCESS](#PRIO_PROCESS)
    * [const PRIO_USER](#PRIO_USER)
    * [const PROT_EXEC](#PROT_EXEC)
    * [const PROT_NONE](#PROT_NONE)
    * [const PROT_READ](#PROT_READ)
    * [const PROT_WRITE](#PROT_WRITE)
    * [const PT_ATTACH](#PT_ATTACH)
    * [const PT_ATTACHEXC](#PT_ATTACHEXC)
    * [const PT_CONTINUE](#PT_CONTINUE)
    * [const PT_DENY_ATTACH](#PT_DENY_ATTACH)
    * [const PT_DETACH](#PT_DETACH)
    * [const PT_FIRSTMACH](#PT_FIRSTMACH)
    * [const PT_FORCEQUOTA](#PT_FORCEQUOTA)
    * [const PT_KILL](#PT_KILL)
    * [const PT_READ_D](#PT_READ_D)
    * [const PT_READ_I](#PT_READ_I)
    * [const PT_READ_U](#PT_READ_U)
    * [const PT_SIGEXC](#PT_SIGEXC)
    * [const PT_STEP](#PT_STEP)
    * [const PT_THUPDATE](#PT_THUPDATE)
    * [const PT_TRACE_ME](#PT_TRACE_ME)
    * [const PT_WRITE_D](#PT_WRITE_D)
    * [const PT_WRITE_I](#PT_WRITE_I)
    * [const PT_WRITE_U](#PT_WRITE_U)
    * [const RLIMIT_AS](#RLIMIT_AS)
    * [const RLIMIT_CORE](#RLIMIT_CORE)
    * [const RLIMIT_CPU](#RLIMIT_CPU)
    * [const RLIMIT_DATA](#RLIMIT_DATA)
    * [const RLIMIT_FSIZE](#RLIMIT_FSIZE)
    * [const RLIMIT_NOFILE](#RLIMIT_NOFILE)
    * [const RLIMIT_STACK](#RLIMIT_STACK)
    * [const RLIM_INFINITY](#RLIM_INFINITY)
    * [const RTAX_AUTHOR](#RTAX_AUTHOR)
    * [const RTAX_BRD](#RTAX_BRD)
    * [const RTAX_DST](#RTAX_DST)
    * [const RTAX_GATEWAY](#RTAX_GATEWAY)
    * [const RTAX_GENMASK](#RTAX_GENMASK)
    * [const RTAX_IFA](#RTAX_IFA)
    * [const RTAX_IFP](#RTAX_IFP)
    * [const RTAX_MAX](#RTAX_MAX)
    * [const RTAX_NETMASK](#RTAX_NETMASK)
    * [const RTA_AUTHOR](#RTA_AUTHOR)
    * [const RTA_BRD](#RTA_BRD)
    * [const RTA_DST](#RTA_DST)
    * [const RTA_GATEWAY](#RTA_GATEWAY)
    * [const RTA_GENMASK](#RTA_GENMASK)
    * [const RTA_IFA](#RTA_IFA)
    * [const RTA_IFP](#RTA_IFP)
    * [const RTA_NETMASK](#RTA_NETMASK)
    * [const RTF_BLACKHOLE](#RTF_BLACKHOLE)
    * [const RTF_BROADCAST](#RTF_BROADCAST)
    * [const RTF_CLONING](#RTF_CLONING)
    * [const RTF_CONDEMNED](#RTF_CONDEMNED)
    * [const RTF_DELCLONE](#RTF_DELCLONE)
    * [const RTF_DONE](#RTF_DONE)
    * [const RTF_DYNAMIC](#RTF_DYNAMIC)
    * [const RTF_GATEWAY](#RTF_GATEWAY)
    * [const RTF_HOST](#RTF_HOST)
    * [const RTF_IFREF](#RTF_IFREF)
    * [const RTF_IFSCOPE](#RTF_IFSCOPE)
    * [const RTF_LLINFO](#RTF_LLINFO)
    * [const RTF_LOCAL](#RTF_LOCAL)
    * [const RTF_MODIFIED](#RTF_MODIFIED)
    * [const RTF_MULTICAST](#RTF_MULTICAST)
    * [const RTF_PINNED](#RTF_PINNED)
    * [const RTF_PRCLONING](#RTF_PRCLONING)
    * [const RTF_PROTO1](#RTF_PROTO1)
    * [const RTF_PROTO2](#RTF_PROTO2)
    * [const RTF_PROTO3](#RTF_PROTO3)
    * [const RTF_REJECT](#RTF_REJECT)
    * [const RTF_STATIC](#RTF_STATIC)
    * [const RTF_UP](#RTF_UP)
    * [const RTF_WASCLONED](#RTF_WASCLONED)
    * [const RTF_XRESOLVE](#RTF_XRESOLVE)
    * [const RTM_ADD](#RTM_ADD)
    * [const RTM_CHANGE](#RTM_CHANGE)
    * [const RTM_DELADDR](#RTM_DELADDR)
    * [const RTM_DELETE](#RTM_DELETE)
    * [const RTM_DELMADDR](#RTM_DELMADDR)
    * [const RTM_GET](#RTM_GET)
    * [const RTM_GET2](#RTM_GET2)
    * [const RTM_IFINFO](#RTM_IFINFO)
    * [const RTM_IFINFO2](#RTM_IFINFO2)
    * [const RTM_LOCK](#RTM_LOCK)
    * [const RTM_LOSING](#RTM_LOSING)
    * [const RTM_MISS](#RTM_MISS)
    * [const RTM_NEWADDR](#RTM_NEWADDR)
    * [const RTM_NEWMADDR](#RTM_NEWMADDR)
    * [const RTM_NEWMADDR2](#RTM_NEWMADDR2)
    * [const RTM_OLDADD](#RTM_OLDADD)
    * [const RTM_OLDDEL](#RTM_OLDDEL)
    * [const RTM_REDIRECT](#RTM_REDIRECT)
    * [const RTM_RESOLVE](#RTM_RESOLVE)
    * [const RTM_RTTUNIT](#RTM_RTTUNIT)
    * [const RTM_VERSION](#RTM_VERSION)
    * [const RTV_EXPIRE](#RTV_EXPIRE)
    * [const RTV_HOPCOUNT](#RTV_HOPCOUNT)
    * [const RTV_MTU](#RTV_MTU)
    * [const RTV_RPIPE](#RTV_RPIPE)
    * [const RTV_RTT](#RTV_RTT)
    * [const RTV_RTTVAR](#RTV_RTTVAR)
    * [const RTV_SPIPE](#RTV_SPIPE)
    * [const RTV_SSTHRESH](#RTV_SSTHRESH)
    * [const RUSAGE_CHILDREN](#RUSAGE_CHILDREN)
    * [const RUSAGE_SELF](#RUSAGE_SELF)
    * [const SCM_CREDS](#SCM_CREDS)
    * [const SCM_RIGHTS](#SCM_RIGHTS)
    * [const SCM_TIMESTAMP](#SCM_TIMESTAMP)
    * [const SCM_TIMESTAMP_MONOTONIC](#SCM_TIMESTAMP_MONOTONIC)
    * [const SHUT_RD](#SHUT_RD)
    * [const SHUT_RDWR](#SHUT_RDWR)
    * [const SHUT_WR](#SHUT_WR)
    * [const SIOCADDMULTI](#SIOCADDMULTI)
    * [const SIOCAIFADDR](#SIOCAIFADDR)
    * [const SIOCALIFADDR](#SIOCALIFADDR)
    * [const SIOCARPIPLL](#SIOCARPIPLL)
    * [const SIOCATMARK](#SIOCATMARK)
    * [const SIOCAUTOADDR](#SIOCAUTOADDR)
    * [const SIOCAUTONETMASK](#SIOCAUTONETMASK)
    * [const SIOCDELMULTI](#SIOCDELMULTI)
    * [const SIOCDIFADDR](#SIOCDIFADDR)
    * [const SIOCDIFPHYADDR](#SIOCDIFPHYADDR)
    * [const SIOCDLIFADDR](#SIOCDLIFADDR)
    * [const SIOCGDRVSPEC](#SIOCGDRVSPEC)
    * [const SIOCGETSGCNT](#SIOCGETSGCNT)
    * [const SIOCGETVIFCNT](#SIOCGETVIFCNT)
    * [const SIOCGETVLAN](#SIOCGETVLAN)
    * [const SIOCGHIWAT](#SIOCGHIWAT)
    * [const SIOCGIFADDR](#SIOCGIFADDR)
    * [const SIOCGIFALTMTU](#SIOCGIFALTMTU)
    * [const SIOCGIFASYNCMAP](#SIOCGIFASYNCMAP)
    * [const SIOCGIFBOND](#SIOCGIFBOND)
    * [const SIOCGIFBRDADDR](#SIOCGIFBRDADDR)
    * [const SIOCGIFCAP](#SIOCGIFCAP)
    * [const SIOCGIFCONF](#SIOCGIFCONF)
    * [const SIOCGIFDEVMTU](#SIOCGIFDEVMTU)
    * [const SIOCGIFDSTADDR](#SIOCGIFDSTADDR)
    * [const SIOCGIFFLAGS](#SIOCGIFFLAGS)
    * [const SIOCGIFGENERIC](#SIOCGIFGENERIC)
    * [const SIOCGIFKPI](#SIOCGIFKPI)
    * [const SIOCGIFMAC](#SIOCGIFMAC)
    * [const SIOCGIFMEDIA](#SIOCGIFMEDIA)
    * [const SIOCGIFMETRIC](#SIOCGIFMETRIC)
    * [const SIOCGIFMTU](#SIOCGIFMTU)
    * [const SIOCGIFNETMASK](#SIOCGIFNETMASK)
    * [const SIOCGIFPDSTADDR](#SIOCGIFPDSTADDR)
    * [const SIOCGIFPHYS](#SIOCGIFPHYS)
    * [const SIOCGIFPSRCADDR](#SIOCGIFPSRCADDR)
    * [const SIOCGIFSTATUS](#SIOCGIFSTATUS)
    * [const SIOCGIFVLAN](#SIOCGIFVLAN)
    * [const SIOCGIFWAKEFLAGS](#SIOCGIFWAKEFLAGS)
    * [const SIOCGLIFADDR](#SIOCGLIFADDR)
    * [const SIOCGLIFPHYADDR](#SIOCGLIFPHYADDR)
    * [const SIOCGLOWAT](#SIOCGLOWAT)
    * [const SIOCGPGRP](#SIOCGPGRP)
    * [const SIOCIFCREATE](#SIOCIFCREATE)
    * [const SIOCIFCREATE2](#SIOCIFCREATE2)
    * [const SIOCIFDESTROY](#SIOCIFDESTROY)
    * [const SIOCRSLVMULTI](#SIOCRSLVMULTI)
    * [const SIOCSDRVSPEC](#SIOCSDRVSPEC)
    * [const SIOCSETVLAN](#SIOCSETVLAN)
    * [const SIOCSHIWAT](#SIOCSHIWAT)
    * [const SIOCSIFADDR](#SIOCSIFADDR)
    * [const SIOCSIFALTMTU](#SIOCSIFALTMTU)
    * [const SIOCSIFASYNCMAP](#SIOCSIFASYNCMAP)
    * [const SIOCSIFBOND](#SIOCSIFBOND)
    * [const SIOCSIFBRDADDR](#SIOCSIFBRDADDR)
    * [const SIOCSIFCAP](#SIOCSIFCAP)
    * [const SIOCSIFDSTADDR](#SIOCSIFDSTADDR)
    * [const SIOCSIFFLAGS](#SIOCSIFFLAGS)
    * [const SIOCSIFGENERIC](#SIOCSIFGENERIC)
    * [const SIOCSIFKPI](#SIOCSIFKPI)
    * [const SIOCSIFLLADDR](#SIOCSIFLLADDR)
    * [const SIOCSIFMAC](#SIOCSIFMAC)
    * [const SIOCSIFMEDIA](#SIOCSIFMEDIA)
    * [const SIOCSIFMETRIC](#SIOCSIFMETRIC)
    * [const SIOCSIFMTU](#SIOCSIFMTU)
    * [const SIOCSIFNETMASK](#SIOCSIFNETMASK)
    * [const SIOCSIFPHYADDR](#SIOCSIFPHYADDR)
    * [const SIOCSIFPHYS](#SIOCSIFPHYS)
    * [const SIOCSIFVLAN](#SIOCSIFVLAN)
    * [const SIOCSLIFPHYADDR](#SIOCSLIFPHYADDR)
    * [const SIOCSLOWAT](#SIOCSLOWAT)
    * [const SIOCSPGRP](#SIOCSPGRP)
    * [const SOCK_DGRAM](#SOCK_DGRAM)
    * [const SOCK_MAXADDRLEN](#SOCK_MAXADDRLEN)
    * [const SOCK_RAW](#SOCK_RAW)
    * [const SOCK_RDM](#SOCK_RDM)
    * [const SOCK_SEQPACKET](#SOCK_SEQPACKET)
    * [const SOCK_STREAM](#SOCK_STREAM)
    * [const SOL_SOCKET](#SOL_SOCKET)
    * [const SOMAXCONN](#SOMAXCONN)
    * [const SO_ACCEPTCONN](#SO_ACCEPTCONN)
    * [const SO_BROADCAST](#SO_BROADCAST)
    * [const SO_DEBUG](#SO_DEBUG)
    * [const SO_DONTROUTE](#SO_DONTROUTE)
    * [const SO_DONTTRUNC](#SO_DONTTRUNC)
    * [const SO_ERROR](#SO_ERROR)
    * [const SO_KEEPALIVE](#SO_KEEPALIVE)
    * [const SO_LABEL](#SO_LABEL)
    * [const SO_LINGER](#SO_LINGER)
    * [const SO_LINGER_SEC](#SO_LINGER_SEC)
    * [const SO_NKE](#SO_NKE)
    * [const SO_NOADDRERR](#SO_NOADDRERR)
    * [const SO_NOSIGPIPE](#SO_NOSIGPIPE)
    * [const SO_NOTIFYCONFLICT](#SO_NOTIFYCONFLICT)
    * [const SO_NP_EXTENSIONS](#SO_NP_EXTENSIONS)
    * [const SO_NREAD](#SO_NREAD)
    * [const SO_NWRITE](#SO_NWRITE)
    * [const SO_OOBINLINE](#SO_OOBINLINE)
    * [const SO_PEERLABEL](#SO_PEERLABEL)
    * [const SO_RANDOMPORT](#SO_RANDOMPORT)
    * [const SO_RCVBUF](#SO_RCVBUF)
    * [const SO_RCVLOWAT](#SO_RCVLOWAT)
    * [const SO_RCVTIMEO](#SO_RCVTIMEO)
    * [const SO_RESTRICTIONS](#SO_RESTRICTIONS)
    * [const SO_RESTRICT_DENYIN](#SO_RESTRICT_DENYIN)
    * [const SO_RESTRICT_DENYOUT](#SO_RESTRICT_DENYOUT)
    * [const SO_RESTRICT_DENYSET](#SO_RESTRICT_DENYSET)
    * [const SO_REUSEADDR](#SO_REUSEADDR)
    * [const SO_REUSEPORT](#SO_REUSEPORT)
    * [const SO_REUSESHAREUID](#SO_REUSESHAREUID)
    * [const SO_SNDBUF](#SO_SNDBUF)
    * [const SO_SNDLOWAT](#SO_SNDLOWAT)
    * [const SO_SNDTIMEO](#SO_SNDTIMEO)
    * [const SO_TIMESTAMP](#SO_TIMESTAMP)
    * [const SO_TIMESTAMP_MONOTONIC](#SO_TIMESTAMP_MONOTONIC)
    * [const SO_TYPE](#SO_TYPE)
    * [const SO_UPCALLCLOSEWAIT](#SO_UPCALLCLOSEWAIT)
    * [const SO_USELOOPBACK](#SO_USELOOPBACK)
    * [const SO_WANTMORE](#SO_WANTMORE)
    * [const SO_WANTOOBFLAG](#SO_WANTOOBFLAG)
    * [const S_IEXEC](#S_IEXEC)
    * [const S_IFBLK](#S_IFBLK)
    * [const S_IFCHR](#S_IFCHR)
    * [const S_IFDIR](#S_IFDIR)
    * [const S_IFIFO](#S_IFIFO)
    * [const S_IFLNK](#S_IFLNK)
    * [const S_IFMT](#S_IFMT)
    * [const S_IFREG](#S_IFREG)
    * [const S_IFSOCK](#S_IFSOCK)
    * [const S_IFWHT](#S_IFWHT)
    * [const S_IREAD](#S_IREAD)
    * [const S_IRGRP](#S_IRGRP)
    * [const S_IROTH](#S_IROTH)
    * [const S_IRUSR](#S_IRUSR)
    * [const S_IRWXG](#S_IRWXG)
    * [const S_IRWXO](#S_IRWXO)
    * [const S_IRWXU](#S_IRWXU)
    * [const S_ISGID](#S_ISGID)
    * [const S_ISTXT](#S_ISTXT)
    * [const S_ISUID](#S_ISUID)
    * [const S_ISVTX](#S_ISVTX)
    * [const S_IWGRP](#S_IWGRP)
    * [const S_IWOTH](#S_IWOTH)
    * [const S_IWRITE](#S_IWRITE)
    * [const S_IWUSR](#S_IWUSR)
    * [const S_IXGRP](#S_IXGRP)
    * [const S_IXOTH](#S_IXOTH)
    * [const S_IXUSR](#S_IXUSR)
    * [const TCIFLUSH](#TCIFLUSH)
    * [const TCIOFLUSH](#TCIOFLUSH)
    * [const TCOFLUSH](#TCOFLUSH)
    * [const TCP_CONNECTIONTIMEOUT](#TCP_CONNECTIONTIMEOUT)
    * [const TCP_KEEPALIVE](#TCP_KEEPALIVE)
    * [const TCP_MAXHLEN](#TCP_MAXHLEN)
    * [const TCP_MAXOLEN](#TCP_MAXOLEN)
    * [const TCP_MAXSEG](#TCP_MAXSEG)
    * [const TCP_MAXWIN](#TCP_MAXWIN)
    * [const TCP_MAX_SACK](#TCP_MAX_SACK)
    * [const TCP_MAX_WINSHIFT](#TCP_MAX_WINSHIFT)
    * [const TCP_MINMSS](#TCP_MINMSS)
    * [const TCP_MINMSSOVERLOAD](#TCP_MINMSSOVERLOAD)
    * [const TCP_MSS](#TCP_MSS)
    * [const TCP_NODELAY](#TCP_NODELAY)
    * [const TCP_NOOPT](#TCP_NOOPT)
    * [const TCP_NOPUSH](#TCP_NOPUSH)
    * [const TCP_RXT_CONNDROPTIME](#TCP_RXT_CONNDROPTIME)
    * [const TCP_RXT_FINDROP](#TCP_RXT_FINDROP)
    * [const TCSAFLUSH](#TCSAFLUSH)
    * [const TIOCCBRK](#TIOCCBRK)
    * [const TIOCCDTR](#TIOCCDTR)
    * [const TIOCCONS](#TIOCCONS)
    * [const TIOCDCDTIMESTAMP](#TIOCDCDTIMESTAMP)
    * [const TIOCDRAIN](#TIOCDRAIN)
    * [const TIOCDSIMICROCODE](#TIOCDSIMICROCODE)
    * [const TIOCEXCL](#TIOCEXCL)
    * [const TIOCEXT](#TIOCEXT)
    * [const TIOCFLUSH](#TIOCFLUSH)
    * [const TIOCGDRAINWAIT](#TIOCGDRAINWAIT)
    * [const TIOCGETA](#TIOCGETA)
    * [const TIOCGETD](#TIOCGETD)
    * [const TIOCGPGRP](#TIOCGPGRP)
    * [const TIOCGWINSZ](#TIOCGWINSZ)
    * [const TIOCIXOFF](#TIOCIXOFF)
    * [const TIOCIXON](#TIOCIXON)
    * [const TIOCMBIC](#TIOCMBIC)
    * [const TIOCMBIS](#TIOCMBIS)
    * [const TIOCMGDTRWAIT](#TIOCMGDTRWAIT)
    * [const TIOCMGET](#TIOCMGET)
    * [const TIOCMODG](#TIOCMODG)
    * [const TIOCMODS](#TIOCMODS)
    * [const TIOCMSDTRWAIT](#TIOCMSDTRWAIT)
    * [const TIOCMSET](#TIOCMSET)
    * [const TIOCM_CAR](#TIOCM_CAR)
    * [const TIOCM_CD](#TIOCM_CD)
    * [const TIOCM_CTS](#TIOCM_CTS)
    * [const TIOCM_DSR](#TIOCM_DSR)
    * [const TIOCM_DTR](#TIOCM_DTR)
    * [const TIOCM_LE](#TIOCM_LE)
    * [const TIOCM_RI](#TIOCM_RI)
    * [const TIOCM_RNG](#TIOCM_RNG)
    * [const TIOCM_RTS](#TIOCM_RTS)
    * [const TIOCM_SR](#TIOCM_SR)
    * [const TIOCM_ST](#TIOCM_ST)
    * [const TIOCNOTTY](#TIOCNOTTY)
    * [const TIOCNXCL](#TIOCNXCL)
    * [const TIOCOUTQ](#TIOCOUTQ)
    * [const TIOCPKT](#TIOCPKT)
    * [const TIOCPKT_DATA](#TIOCPKT_DATA)
    * [const TIOCPKT_DOSTOP](#TIOCPKT_DOSTOP)
    * [const TIOCPKT_FLUSHREAD](#TIOCPKT_FLUSHREAD)
    * [const TIOCPKT_FLUSHWRITE](#TIOCPKT_FLUSHWRITE)
    * [const TIOCPKT_IOCTL](#TIOCPKT_IOCTL)
    * [const TIOCPKT_NOSTOP](#TIOCPKT_NOSTOP)
    * [const TIOCPKT_START](#TIOCPKT_START)
    * [const TIOCPKT_STOP](#TIOCPKT_STOP)
    * [const TIOCPTYGNAME](#TIOCPTYGNAME)
    * [const TIOCPTYGRANT](#TIOCPTYGRANT)
    * [const TIOCPTYUNLK](#TIOCPTYUNLK)
    * [const TIOCREMOTE](#TIOCREMOTE)
    * [const TIOCSBRK](#TIOCSBRK)
    * [const TIOCSCONS](#TIOCSCONS)
    * [const TIOCSCTTY](#TIOCSCTTY)
    * [const TIOCSDRAINWAIT](#TIOCSDRAINWAIT)
    * [const TIOCSDTR](#TIOCSDTR)
    * [const TIOCSETA](#TIOCSETA)
    * [const TIOCSETAF](#TIOCSETAF)
    * [const TIOCSETAW](#TIOCSETAW)
    * [const TIOCSETD](#TIOCSETD)
    * [const TIOCSIG](#TIOCSIG)
    * [const TIOCSPGRP](#TIOCSPGRP)
    * [const TIOCSTART](#TIOCSTART)
    * [const TIOCSTAT](#TIOCSTAT)
    * [const TIOCSTI](#TIOCSTI)
    * [const TIOCSTOP](#TIOCSTOP)
    * [const TIOCSWINSZ](#TIOCSWINSZ)
    * [const TIOCTIMESTAMP](#TIOCTIMESTAMP)
    * [const TIOCUCNTL](#TIOCUCNTL)
    * [const TOSTOP](#TOSTOP)
    * [const VDISCARD](#VDISCARD)
    * [const VDSUSP](#VDSUSP)
    * [const VEOF](#VEOF)
    * [const VEOL](#VEOL)
    * [const VEOL2](#VEOL2)
    * [const VERASE](#VERASE)
    * [const VINTR](#VINTR)
    * [const VKILL](#VKILL)
    * [const VLNEXT](#VLNEXT)
    * [const VMIN](#VMIN)
    * [const VQUIT](#VQUIT)
    * [const VREPRINT](#VREPRINT)
    * [const VSTART](#VSTART)
    * [const VSTATUS](#VSTATUS)
    * [const VSTOP](#VSTOP)
    * [const VSUSP](#VSUSP)
    * [const VT0](#VT0)
    * [const VT1](#VT1)
    * [const VTDLY](#VTDLY)
    * [const VTIME](#VTIME)
    * [const VWERASE](#VWERASE)
    * [const WCONTINUED](#WCONTINUED)
    * [const WCOREFLAG](#WCOREFLAG)
    * [const WEXITED](#WEXITED)
    * [const WNOHANG](#WNOHANG)
    * [const WNOWAIT](#WNOWAIT)
    * [const WORDSIZE](#WORDSIZE)
    * [const WSTOPPED](#WSTOPPED)
    * [const WUNTRACED](#WUNTRACED)
    * [const E2BIG](#E2BIG)
    * [const EACCES](#EACCES)
    * [const EADDRINUSE](#EADDRINUSE)
    * [const EADDRNOTAVAIL](#EADDRNOTAVAIL)
    * [const EAFNOSUPPORT](#EAFNOSUPPORT)
    * [const EAGAIN](#EAGAIN)
    * [const EALREADY](#EALREADY)
    * [const EAUTH](#EAUTH)
    * [const EBADARCH](#EBADARCH)
    * [const EBADEXEC](#EBADEXEC)
    * [const EBADF](#EBADF)
    * [const EBADMACHO](#EBADMACHO)
    * [const EBADMSG](#EBADMSG)
    * [const EBADRPC](#EBADRPC)
    * [const EBUSY](#EBUSY)
    * [const ECANCELED](#ECANCELED)
    * [const ECHILD](#ECHILD)
    * [const ECONNABORTED](#ECONNABORTED)
    * [const ECONNREFUSED](#ECONNREFUSED)
    * [const ECONNRESET](#ECONNRESET)
    * [const EDEADLK](#EDEADLK)
    * [const EDESTADDRREQ](#EDESTADDRREQ)
    * [const EDEVERR](#EDEVERR)
    * [const EDOM](#EDOM)
    * [const EDQUOT](#EDQUOT)
    * [const EEXIST](#EEXIST)
    * [const EFAULT](#EFAULT)
    * [const EFBIG](#EFBIG)
    * [const EFTYPE](#EFTYPE)
    * [const EHOSTDOWN](#EHOSTDOWN)
    * [const EHOSTUNREACH](#EHOSTUNREACH)
    * [const EIDRM](#EIDRM)
    * [const EILSEQ](#EILSEQ)
    * [const EINPROGRESS](#EINPROGRESS)
    * [const EINTR](#EINTR)
    * [const EINVAL](#EINVAL)
    * [const EIO](#EIO)
    * [const EISCONN](#EISCONN)
    * [const EISDIR](#EISDIR)
    * [const ELAST](#ELAST)
    * [const ELOOP](#ELOOP)
    * [const EMFILE](#EMFILE)
    * [const EMLINK](#EMLINK)
    * [const EMSGSIZE](#EMSGSIZE)
    * [const EMULTIHOP](#EMULTIHOP)
    * [const ENAMETOOLONG](#ENAMETOOLONG)
    * [const ENEEDAUTH](#ENEEDAUTH)
    * [const ENETDOWN](#ENETDOWN)
    * [const ENETRESET](#ENETRESET)
    * [const ENETUNREACH](#ENETUNREACH)
    * [const ENFILE](#ENFILE)
    * [const ENOATTR](#ENOATTR)
    * [const ENOBUFS](#ENOBUFS)
    * [const ENODATA](#ENODATA)
    * [const ENODEV](#ENODEV)
    * [const ENOENT](#ENOENT)
    * [const ENOEXEC](#ENOEXEC)
    * [const ENOLCK](#ENOLCK)
    * [const ENOLINK](#ENOLINK)
    * [const ENOMEM](#ENOMEM)
    * [const ENOMSG](#ENOMSG)
    * [const ENOPOLICY](#ENOPOLICY)
    * [const ENOPROTOOPT](#ENOPROTOOPT)
    * [const ENOSPC](#ENOSPC)
    * [const ENOSR](#ENOSR)
    * [const ENOSTR](#ENOSTR)
    * [const ENOSYS](#ENOSYS)
    * [const ENOTBLK](#ENOTBLK)
    * [const ENOTCONN](#ENOTCONN)
    * [const ENOTDIR](#ENOTDIR)
    * [const ENOTEMPTY](#ENOTEMPTY)
    * [const ENOTRECOVERABLE](#ENOTRECOVERABLE)
    * [const ENOTSOCK](#ENOTSOCK)
    * [const ENOTSUP](#ENOTSUP)
    * [const ENOTTY](#ENOTTY)
    * [const ENXIO](#ENXIO)
    * [const EOPNOTSUPP](#EOPNOTSUPP)
    * [const EOVERFLOW](#EOVERFLOW)
    * [const EOWNERDEAD](#EOWNERDEAD)
    * [const EPERM](#EPERM)
    * [const EPFNOSUPPORT](#EPFNOSUPPORT)
    * [const EPIPE](#EPIPE)
    * [const EPROCLIM](#EPROCLIM)
    * [const EPROCUNAVAIL](#EPROCUNAVAIL)
    * [const EPROGMISMATCH](#EPROGMISMATCH)
    * [const EPROGUNAVAIL](#EPROGUNAVAIL)
    * [const EPROTO](#EPROTO)
    * [const EPROTONOSUPPORT](#EPROTONOSUPPORT)
    * [const EPROTOTYPE](#EPROTOTYPE)
    * [const EPWROFF](#EPWROFF)
    * [const ERANGE](#ERANGE)
    * [const EREMOTE](#EREMOTE)
    * [const EROFS](#EROFS)
    * [const ERPCMISMATCH](#ERPCMISMATCH)
    * [const ESHLIBVERS](#ESHLIBVERS)
    * [const ESHUTDOWN](#ESHUTDOWN)
    * [const ESOCKTNOSUPPORT](#ESOCKTNOSUPPORT)
    * [const ESPIPE](#ESPIPE)
    * [const ESRCH](#ESRCH)
    * [const ESTALE](#ESTALE)
    * [const ETIME](#ETIME)
    * [const ETIMEDOUT](#ETIMEDOUT)
    * [const ETOOMANYREFS](#ETOOMANYREFS)
    * [const ETXTBSY](#ETXTBSY)
    * [const EUSERS](#EUSERS)
    * [const EWOULDBLOCK](#EWOULDBLOCK)
    * [const EXDEV](#EXDEV)
    * [const SIGABRT](#SIGABRT)
    * [const SIGALRM](#SIGALRM)
    * [const SIGBUS](#SIGBUS)
    * [const SIGCHLD](#SIGCHLD)
    * [const SIGCONT](#SIGCONT)
    * [const SIGEMT](#SIGEMT)
    * [const SIGFPE](#SIGFPE)
    * [const SIGHUP](#SIGHUP)
    * [const SIGILL](#SIGILL)
    * [const SIGINFO](#SIGINFO)
    * [const SIGINT](#SIGINT)
    * [const SIGIO](#SIGIO)
    * [const SIGIOT](#SIGIOT)
    * [const SIGKILL](#SIGKILL)
    * [const SIGPIPE](#SIGPIPE)
    * [const SIGPROF](#SIGPROF)
    * [const SIGQUIT](#SIGQUIT)
    * [const SIGSEGV](#SIGSEGV)
    * [const SIGSTOP](#SIGSTOP)
    * [const SIGSYS](#SIGSYS)
    * [const SIGTERM](#SIGTERM)
    * [const SIGTRAP](#SIGTRAP)
    * [const SIGTSTP](#SIGTSTP)
    * [const SIGTTIN](#SIGTTIN)
    * [const SIGTTOU](#SIGTTOU)
    * [const SIGURG](#SIGURG)
    * [const SIGUSR1](#SIGUSR1)
    * [const SIGUSR2](#SIGUSR2)
    * [const SIGVTALRM](#SIGVTALRM)
    * [const SIGWINCH](#SIGWINCH)
    * [const SIGXCPU](#SIGXCPU)
    * [const SIGXFSZ](#SIGXFSZ)
    * [const SYS_SYSCALL](#SYS_SYSCALL)
    * [const SYS_EXIT](#SYS_EXIT)
    * [const SYS_FORK](#SYS_FORK)
    * [const SYS_READ](#SYS_READ)
    * [const SYS_WRITE](#SYS_WRITE)
    * [const SYS_OPEN](#SYS_OPEN)
    * [const SYS_CLOSE](#SYS_CLOSE)
    * [const SYS_WAIT4](#SYS_WAIT4)
    * [const SYS_LINK](#SYS_LINK)
    * [const SYS_UNLINK](#SYS_UNLINK)
    * [const SYS_CHDIR](#SYS_CHDIR)
    * [const SYS_FCHDIR](#SYS_FCHDIR)
    * [const SYS_MKNOD](#SYS_MKNOD)
    * [const SYS_CHMOD](#SYS_CHMOD)
    * [const SYS_CHOWN](#SYS_CHOWN)
    * [const SYS_GETFSSTAT](#SYS_GETFSSTAT)
    * [const SYS_GETPID](#SYS_GETPID)
    * [const SYS_SETUID](#SYS_SETUID)
    * [const SYS_GETUID](#SYS_GETUID)
    * [const SYS_GETEUID](#SYS_GETEUID)
    * [const SYS_PTRACE](#SYS_PTRACE)
    * [const SYS_RECVMSG](#SYS_RECVMSG)
    * [const SYS_SENDMSG](#SYS_SENDMSG)
    * [const SYS_RECVFROM](#SYS_RECVFROM)
    * [const SYS_ACCEPT](#SYS_ACCEPT)
    * [const SYS_GETPEERNAME](#SYS_GETPEERNAME)
    * [const SYS_GETSOCKNAME](#SYS_GETSOCKNAME)
    * [const SYS_ACCESS](#SYS_ACCESS)
    * [const SYS_CHFLAGS](#SYS_CHFLAGS)
    * [const SYS_FCHFLAGS](#SYS_FCHFLAGS)
    * [const SYS_SYNC](#SYS_SYNC)
    * [const SYS_KILL](#SYS_KILL)
    * [const SYS_GETPPID](#SYS_GETPPID)
    * [const SYS_DUP](#SYS_DUP)
    * [const SYS_PIPE](#SYS_PIPE)
    * [const SYS_GETEGID](#SYS_GETEGID)
    * [const SYS_PROFIL](#SYS_PROFIL)
    * [const SYS_SIGACTION](#SYS_SIGACTION)
    * [const SYS_GETGID](#SYS_GETGID)
    * [const SYS_SIGPROCMASK](#SYS_SIGPROCMASK)
    * [const SYS_GETLOGIN](#SYS_GETLOGIN)
    * [const SYS_SETLOGIN](#SYS_SETLOGIN)
    * [const SYS_ACCT](#SYS_ACCT)
    * [const SYS_SIGPENDING](#SYS_SIGPENDING)
    * [const SYS_SIGALTSTACK](#SYS_SIGALTSTACK)
    * [const SYS_IOCTL](#SYS_IOCTL)
    * [const SYS_REBOOT](#SYS_REBOOT)
    * [const SYS_REVOKE](#SYS_REVOKE)
    * [const SYS_SYMLINK](#SYS_SYMLINK)
    * [const SYS_READLINK](#SYS_READLINK)
    * [const SYS_EXECVE](#SYS_EXECVE)
    * [const SYS_UMASK](#SYS_UMASK)
    * [const SYS_CHROOT](#SYS_CHROOT)
    * [const SYS_MSYNC](#SYS_MSYNC)
    * [const SYS_VFORK](#SYS_VFORK)
    * [const SYS_MUNMAP](#SYS_MUNMAP)
    * [const SYS_MPROTECT](#SYS_MPROTECT)
    * [const SYS_MADVISE](#SYS_MADVISE)
    * [const SYS_MINCORE](#SYS_MINCORE)
    * [const SYS_GETGROUPS](#SYS_GETGROUPS)
    * [const SYS_SETGROUPS](#SYS_SETGROUPS)
    * [const SYS_GETPGRP](#SYS_GETPGRP)
    * [const SYS_SETPGID](#SYS_SETPGID)
    * [const SYS_SETITIMER](#SYS_SETITIMER)
    * [const SYS_SWAPON](#SYS_SWAPON)
    * [const SYS_GETITIMER](#SYS_GETITIMER)
    * [const SYS_GETDTABLESIZE](#SYS_GETDTABLESIZE)
    * [const SYS_DUP2](#SYS_DUP2)
    * [const SYS_FCNTL](#SYS_FCNTL)
    * [const SYS_SELECT](#SYS_SELECT)
    * [const SYS_FSYNC](#SYS_FSYNC)
    * [const SYS_SETPRIORITY](#SYS_SETPRIORITY)
    * [const SYS_SOCKET](#SYS_SOCKET)
    * [const SYS_CONNECT](#SYS_CONNECT)
    * [const SYS_GETPRIORITY](#SYS_GETPRIORITY)
    * [const SYS_BIND](#SYS_BIND)
    * [const SYS_SETSOCKOPT](#SYS_SETSOCKOPT)
    * [const SYS_LISTEN](#SYS_LISTEN)
    * [const SYS_SIGSUSPEND](#SYS_SIGSUSPEND)
    * [const SYS_GETTIMEOFDAY](#SYS_GETTIMEOFDAY)
    * [const SYS_GETRUSAGE](#SYS_GETRUSAGE)
    * [const SYS_GETSOCKOPT](#SYS_GETSOCKOPT)
    * [const SYS_READV](#SYS_READV)
    * [const SYS_WRITEV](#SYS_WRITEV)
    * [const SYS_SETTIMEOFDAY](#SYS_SETTIMEOFDAY)
    * [const SYS_FCHOWN](#SYS_FCHOWN)
    * [const SYS_FCHMOD](#SYS_FCHMOD)
    * [const SYS_SETREUID](#SYS_SETREUID)
    * [const SYS_SETREGID](#SYS_SETREGID)
    * [const SYS_RENAME](#SYS_RENAME)
    * [const SYS_FLOCK](#SYS_FLOCK)
    * [const SYS_MKFIFO](#SYS_MKFIFO)
    * [const SYS_SENDTO](#SYS_SENDTO)
    * [const SYS_SHUTDOWN](#SYS_SHUTDOWN)
    * [const SYS_SOCKETPAIR](#SYS_SOCKETPAIR)
    * [const SYS_MKDIR](#SYS_MKDIR)
    * [const SYS_RMDIR](#SYS_RMDIR)
    * [const SYS_UTIMES](#SYS_UTIMES)
    * [const SYS_FUTIMES](#SYS_FUTIMES)
    * [const SYS_ADJTIME](#SYS_ADJTIME)
    * [const SYS_GETHOSTUUID](#SYS_GETHOSTUUID)
    * [const SYS_SETSID](#SYS_SETSID)
    * [const SYS_GETPGID](#SYS_GETPGID)
    * [const SYS_SETPRIVEXEC](#SYS_SETPRIVEXEC)
    * [const SYS_PREAD](#SYS_PREAD)
    * [const SYS_PWRITE](#SYS_PWRITE)
    * [const SYS_NFSSVC](#SYS_NFSSVC)
    * [const SYS_STATFS](#SYS_STATFS)
    * [const SYS_FSTATFS](#SYS_FSTATFS)
    * [const SYS_UNMOUNT](#SYS_UNMOUNT)
    * [const SYS_GETFH](#SYS_GETFH)
    * [const SYS_QUOTACTL](#SYS_QUOTACTL)
    * [const SYS_MOUNT](#SYS_MOUNT)
    * [const SYS_CSOPS](#SYS_CSOPS)
    * [const SYS_WAITID](#SYS_WAITID)
    * [const SYS_ADD_PROFIL](#SYS_ADD_PROFIL)
    * [const SYS_KDEBUG_TRACE](#SYS_KDEBUG_TRACE)
    * [const SYS_SETGID](#SYS_SETGID)
    * [const SYS_SETEGID](#SYS_SETEGID)
    * [const SYS_SETEUID](#SYS_SETEUID)
    * [const SYS_SIGRETURN](#SYS_SIGRETURN)
    * [const SYS_CHUD](#SYS_CHUD)
    * [const SYS_FDATASYNC](#SYS_FDATASYNC)
    * [const SYS_STAT](#SYS_STAT)
    * [const SYS_FSTAT](#SYS_FSTAT)
    * [const SYS_LSTAT](#SYS_LSTAT)
    * [const SYS_PATHCONF](#SYS_PATHCONF)
    * [const SYS_FPATHCONF](#SYS_FPATHCONF)
    * [const SYS_GETRLIMIT](#SYS_GETRLIMIT)
    * [const SYS_SETRLIMIT](#SYS_SETRLIMIT)
    * [const SYS_GETDIRENTRIES](#SYS_GETDIRENTRIES)
    * [const SYS_MMAP](#SYS_MMAP)
    * [const SYS_LSEEK](#SYS_LSEEK)
    * [const SYS_TRUNCATE](#SYS_TRUNCATE)
    * [const SYS_FTRUNCATE](#SYS_FTRUNCATE)
    * [const SYS___SYSCTL](#SYS___SYSCTL)
    * [const SYS_MLOCK](#SYS_MLOCK)
    * [const SYS_MUNLOCK](#SYS_MUNLOCK)
    * [const SYS_UNDELETE](#SYS_UNDELETE)
    * [const SYS_ATSOCKET](#SYS_ATSOCKET)
    * [const SYS_ATGETMSG](#SYS_ATGETMSG)
    * [const SYS_ATPUTMSG](#SYS_ATPUTMSG)
    * [const SYS_ATPSNDREQ](#SYS_ATPSNDREQ)
    * [const SYS_ATPSNDRSP](#SYS_ATPSNDRSP)
    * [const SYS_ATPGETREQ](#SYS_ATPGETREQ)
    * [const SYS_ATPGETRSP](#SYS_ATPGETRSP)
    * [const SYS_MKCOMPLEX](#SYS_MKCOMPLEX)
    * [const SYS_STATV](#SYS_STATV)
    * [const SYS_LSTATV](#SYS_LSTATV)
    * [const SYS_FSTATV](#SYS_FSTATV)
    * [const SYS_GETATTRLIST](#SYS_GETATTRLIST)
    * [const SYS_SETATTRLIST](#SYS_SETATTRLIST)
    * [const SYS_GETDIRENTRIESATTR](#SYS_GETDIRENTRIESATTR)
    * [const SYS_EXCHANGEDATA](#SYS_EXCHANGEDATA)
    * [const SYS_SEARCHFS](#SYS_SEARCHFS)
    * [const SYS_DELETE](#SYS_DELETE)
    * [const SYS_COPYFILE](#SYS_COPYFILE)
    * [const SYS_FGETATTRLIST](#SYS_FGETATTRLIST)
    * [const SYS_FSETATTRLIST](#SYS_FSETATTRLIST)
    * [const SYS_POLL](#SYS_POLL)
    * [const SYS_WATCHEVENT](#SYS_WATCHEVENT)
    * [const SYS_WAITEVENT](#SYS_WAITEVENT)
    * [const SYS_MODWATCH](#SYS_MODWATCH)
    * [const SYS_GETXATTR](#SYS_GETXATTR)
    * [const SYS_FGETXATTR](#SYS_FGETXATTR)
    * [const SYS_SETXATTR](#SYS_SETXATTR)
    * [const SYS_FSETXATTR](#SYS_FSETXATTR)
    * [const SYS_REMOVEXATTR](#SYS_REMOVEXATTR)
    * [const SYS_FREMOVEXATTR](#SYS_FREMOVEXATTR)
    * [const SYS_LISTXATTR](#SYS_LISTXATTR)
    * [const SYS_FLISTXATTR](#SYS_FLISTXATTR)
    * [const SYS_FSCTL](#SYS_FSCTL)
    * [const SYS_INITGROUPS](#SYS_INITGROUPS)
    * [const SYS_POSIX_SPAWN](#SYS_POSIX_SPAWN)
    * [const SYS_FFSCTL](#SYS_FFSCTL)
    * [const SYS_NFSCLNT](#SYS_NFSCLNT)
    * [const SYS_FHOPEN](#SYS_FHOPEN)
    * [const SYS_MINHERIT](#SYS_MINHERIT)
    * [const SYS_SEMSYS](#SYS_SEMSYS)
    * [const SYS_MSGSYS](#SYS_MSGSYS)
    * [const SYS_SHMSYS](#SYS_SHMSYS)
    * [const SYS_SEMCTL](#SYS_SEMCTL)
    * [const SYS_SEMGET](#SYS_SEMGET)
    * [const SYS_SEMOP](#SYS_SEMOP)
    * [const SYS_MSGCTL](#SYS_MSGCTL)
    * [const SYS_MSGGET](#SYS_MSGGET)
    * [const SYS_MSGSND](#SYS_MSGSND)
    * [const SYS_MSGRCV](#SYS_MSGRCV)
    * [const SYS_SHMAT](#SYS_SHMAT)
    * [const SYS_SHMCTL](#SYS_SHMCTL)
    * [const SYS_SHMDT](#SYS_SHMDT)
    * [const SYS_SHMGET](#SYS_SHMGET)
    * [const SYS_SHM_OPEN](#SYS_SHM_OPEN)
    * [const SYS_SHM_UNLINK](#SYS_SHM_UNLINK)
    * [const SYS_SEM_OPEN](#SYS_SEM_OPEN)
    * [const SYS_SEM_CLOSE](#SYS_SEM_CLOSE)
    * [const SYS_SEM_UNLINK](#SYS_SEM_UNLINK)
    * [const SYS_SEM_WAIT](#SYS_SEM_WAIT)
    * [const SYS_SEM_TRYWAIT](#SYS_SEM_TRYWAIT)
    * [const SYS_SEM_POST](#SYS_SEM_POST)
    * [const SYS_SEM_GETVALUE](#SYS_SEM_GETVALUE)
    * [const SYS_SEM_INIT](#SYS_SEM_INIT)
    * [const SYS_SEM_DESTROY](#SYS_SEM_DESTROY)
    * [const SYS_OPEN_EXTENDED](#SYS_OPEN_EXTENDED)
    * [const SYS_UMASK_EXTENDED](#SYS_UMASK_EXTENDED)
    * [const SYS_STAT_EXTENDED](#SYS_STAT_EXTENDED)
    * [const SYS_LSTAT_EXTENDED](#SYS_LSTAT_EXTENDED)
    * [const SYS_FSTAT_EXTENDED](#SYS_FSTAT_EXTENDED)
    * [const SYS_CHMOD_EXTENDED](#SYS_CHMOD_EXTENDED)
    * [const SYS_FCHMOD_EXTENDED](#SYS_FCHMOD_EXTENDED)
    * [const SYS_ACCESS_EXTENDED](#SYS_ACCESS_EXTENDED)
    * [const SYS_SETTID](#SYS_SETTID)
    * [const SYS_GETTID](#SYS_GETTID)
    * [const SYS_SETSGROUPS](#SYS_SETSGROUPS)
    * [const SYS_GETSGROUPS](#SYS_GETSGROUPS)
    * [const SYS_SETWGROUPS](#SYS_SETWGROUPS)
    * [const SYS_GETWGROUPS](#SYS_GETWGROUPS)
    * [const SYS_MKFIFO_EXTENDED](#SYS_MKFIFO_EXTENDED)
    * [const SYS_MKDIR_EXTENDED](#SYS_MKDIR_EXTENDED)
    * [const SYS_IDENTITYSVC](#SYS_IDENTITYSVC)
    * [const SYS_SHARED_REGION_CHECK_NP](#SYS_SHARED_REGION_CHECK_NP)
    * [const SYS_VM_PRESSURE_MONITOR](#SYS_VM_PRESSURE_MONITOR)
    * [const SYS_PSYNCH_RW_LONGRDLOCK](#SYS_PSYNCH_RW_LONGRDLOCK)
    * [const SYS_PSYNCH_RW_YIELDWRLOCK](#SYS_PSYNCH_RW_YIELDWRLOCK)
    * [const SYS_PSYNCH_RW_DOWNGRADE](#SYS_PSYNCH_RW_DOWNGRADE)
    * [const SYS_PSYNCH_RW_UPGRADE](#SYS_PSYNCH_RW_UPGRADE)
    * [const SYS_PSYNCH_MUTEXWAIT](#SYS_PSYNCH_MUTEXWAIT)
    * [const SYS_PSYNCH_MUTEXDROP](#SYS_PSYNCH_MUTEXDROP)
    * [const SYS_PSYNCH_CVBROAD](#SYS_PSYNCH_CVBROAD)
    * [const SYS_PSYNCH_CVSIGNAL](#SYS_PSYNCH_CVSIGNAL)
    * [const SYS_PSYNCH_CVWAIT](#SYS_PSYNCH_CVWAIT)
    * [const SYS_PSYNCH_RW_RDLOCK](#SYS_PSYNCH_RW_RDLOCK)
    * [const SYS_PSYNCH_RW_WRLOCK](#SYS_PSYNCH_RW_WRLOCK)
    * [const SYS_PSYNCH_RW_UNLOCK](#SYS_PSYNCH_RW_UNLOCK)
    * [const SYS_PSYNCH_RW_UNLOCK2](#SYS_PSYNCH_RW_UNLOCK2)
    * [const SYS_GETSID](#SYS_GETSID)
    * [const SYS_SETTID_WITH_PID](#SYS_SETTID_WITH_PID)
    * [const SYS_PSYNCH_CVCLRPREPOST](#SYS_PSYNCH_CVCLRPREPOST)
    * [const SYS_AIO_FSYNC](#SYS_AIO_FSYNC)
    * [const SYS_AIO_RETURN](#SYS_AIO_RETURN)
    * [const SYS_AIO_SUSPEND](#SYS_AIO_SUSPEND)
    * [const SYS_AIO_CANCEL](#SYS_AIO_CANCEL)
    * [const SYS_AIO_ERROR](#SYS_AIO_ERROR)
    * [const SYS_AIO_READ](#SYS_AIO_READ)
    * [const SYS_AIO_WRITE](#SYS_AIO_WRITE)
    * [const SYS_LIO_LISTIO](#SYS_LIO_LISTIO)
    * [const SYS_IOPOLICYSYS](#SYS_IOPOLICYSYS)
    * [const SYS_PROCESS_POLICY](#SYS_PROCESS_POLICY)
    * [const SYS_MLOCKALL](#SYS_MLOCKALL)
    * [const SYS_MUNLOCKALL](#SYS_MUNLOCKALL)
    * [const SYS_ISSETUGID](#SYS_ISSETUGID)
    * [const SYS___PTHREAD_KILL](#SYS___PTHREAD_KILL)
    * [const SYS___PTHREAD_SIGMASK](#SYS___PTHREAD_SIGMASK)
    * [const SYS___SIGWAIT](#SYS___SIGWAIT)
    * [const SYS___DISABLE_THREADSIGNAL](#SYS___DISABLE_THREADSIGNAL)
    * [const SYS___PTHREAD_MARKCANCEL](#SYS___PTHREAD_MARKCANCEL)
    * [const SYS___PTHREAD_CANCELED](#SYS___PTHREAD_CANCELED)
    * [const SYS___SEMWAIT_SIGNAL](#SYS___SEMWAIT_SIGNAL)
    * [const SYS_PROC_INFO](#SYS_PROC_INFO)
    * [const SYS_SENDFILE](#SYS_SENDFILE)
    * [const SYS_STAT64](#SYS_STAT64)
    * [const SYS_FSTAT64](#SYS_FSTAT64)
    * [const SYS_LSTAT64](#SYS_LSTAT64)
    * [const SYS_STAT64_EXTENDED](#SYS_STAT64_EXTENDED)
    * [const SYS_LSTAT64_EXTENDED](#SYS_LSTAT64_EXTENDED)
    * [const SYS_FSTAT64_EXTENDED](#SYS_FSTAT64_EXTENDED)
    * [const SYS_GETDIRENTRIES64](#SYS_GETDIRENTRIES64)
    * [const SYS_STATFS64](#SYS_STATFS64)
    * [const SYS_FSTATFS64](#SYS_FSTATFS64)
    * [const SYS_GETFSSTAT64](#SYS_GETFSSTAT64)
    * [const SYS___PTHREAD_CHDIR](#SYS___PTHREAD_CHDIR)
    * [const SYS___PTHREAD_FCHDIR](#SYS___PTHREAD_FCHDIR)
    * [const SYS_AUDIT](#SYS_AUDIT)
    * [const SYS_AUDITON](#SYS_AUDITON)
    * [const SYS_GETAUID](#SYS_GETAUID)
    * [const SYS_SETAUID](#SYS_SETAUID)
    * [const SYS_GETAUDIT](#SYS_GETAUDIT)
    * [const SYS_SETAUDIT](#SYS_SETAUDIT)
    * [const SYS_GETAUDIT_ADDR](#SYS_GETAUDIT_ADDR)
    * [const SYS_SETAUDIT_ADDR](#SYS_SETAUDIT_ADDR)
    * [const SYS_AUDITCTL](#SYS_AUDITCTL)
    * [const SYS_BSDTHREAD_CREATE](#SYS_BSDTHREAD_CREATE)
    * [const SYS_BSDTHREAD_TERMINATE](#SYS_BSDTHREAD_TERMINATE)
    * [const SYS_KQUEUE](#SYS_KQUEUE)
    * [const SYS_KEVENT](#SYS_KEVENT)
    * [const SYS_LCHOWN](#SYS_LCHOWN)
    * [const SYS_STACK_SNAPSHOT](#SYS_STACK_SNAPSHOT)
    * [const SYS_BSDTHREAD_REGISTER](#SYS_BSDTHREAD_REGISTER)
    * [const SYS_WORKQ_OPEN](#SYS_WORKQ_OPEN)
    * [const SYS_WORKQ_KERNRETURN](#SYS_WORKQ_KERNRETURN)
    * [const SYS_KEVENT64](#SYS_KEVENT64)
    * [const SYS___OLD_SEMWAIT_SIGNAL](#SYS___OLD_SEMWAIT_SIGNAL)
    * [const SYS___OLD_SEMWAIT_SIGNAL_NOCANCEL](#SYS___OLD_SEMWAIT_SIGNAL_NOCANCEL)
    * [const SYS_THREAD_SELFID](#SYS_THREAD_SELFID)
    * [const SYS___MAC_EXECVE](#SYS___MAC_EXECVE)
    * [const SYS___MAC_SYSCALL](#SYS___MAC_SYSCALL)
    * [const SYS___MAC_GET_FILE](#SYS___MAC_GET_FILE)
    * [const SYS___MAC_SET_FILE](#SYS___MAC_SET_FILE)
    * [const SYS___MAC_GET_LINK](#SYS___MAC_GET_LINK)
    * [const SYS___MAC_SET_LINK](#SYS___MAC_SET_LINK)
    * [const SYS___MAC_GET_PROC](#SYS___MAC_GET_PROC)
    * [const SYS___MAC_SET_PROC](#SYS___MAC_SET_PROC)
    * [const SYS___MAC_GET_FD](#SYS___MAC_GET_FD)
    * [const SYS___MAC_SET_FD](#SYS___MAC_SET_FD)
    * [const SYS___MAC_GET_PID](#SYS___MAC_GET_PID)
    * [const SYS___MAC_GET_LCID](#SYS___MAC_GET_LCID)
    * [const SYS___MAC_GET_LCTX](#SYS___MAC_GET_LCTX)
    * [const SYS___MAC_SET_LCTX](#SYS___MAC_SET_LCTX)
    * [const SYS_SETLCID](#SYS_SETLCID)
    * [const SYS_GETLCID](#SYS_GETLCID)
    * [const SYS_READ_NOCANCEL](#SYS_READ_NOCANCEL)
    * [const SYS_WRITE_NOCANCEL](#SYS_WRITE_NOCANCEL)
    * [const SYS_OPEN_NOCANCEL](#SYS_OPEN_NOCANCEL)
    * [const SYS_CLOSE_NOCANCEL](#SYS_CLOSE_NOCANCEL)
    * [const SYS_WAIT4_NOCANCEL](#SYS_WAIT4_NOCANCEL)
    * [const SYS_RECVMSG_NOCANCEL](#SYS_RECVMSG_NOCANCEL)
    * [const SYS_SENDMSG_NOCANCEL](#SYS_SENDMSG_NOCANCEL)
    * [const SYS_RECVFROM_NOCANCEL](#SYS_RECVFROM_NOCANCEL)
    * [const SYS_ACCEPT_NOCANCEL](#SYS_ACCEPT_NOCANCEL)
    * [const SYS_MSYNC_NOCANCEL](#SYS_MSYNC_NOCANCEL)
    * [const SYS_FCNTL_NOCANCEL](#SYS_FCNTL_NOCANCEL)
    * [const SYS_SELECT_NOCANCEL](#SYS_SELECT_NOCANCEL)
    * [const SYS_FSYNC_NOCANCEL](#SYS_FSYNC_NOCANCEL)
    * [const SYS_CONNECT_NOCANCEL](#SYS_CONNECT_NOCANCEL)
    * [const SYS_SIGSUSPEND_NOCANCEL](#SYS_SIGSUSPEND_NOCANCEL)
    * [const SYS_READV_NOCANCEL](#SYS_READV_NOCANCEL)
    * [const SYS_WRITEV_NOCANCEL](#SYS_WRITEV_NOCANCEL)
    * [const SYS_SENDTO_NOCANCEL](#SYS_SENDTO_NOCANCEL)
    * [const SYS_PREAD_NOCANCEL](#SYS_PREAD_NOCANCEL)
    * [const SYS_PWRITE_NOCANCEL](#SYS_PWRITE_NOCANCEL)
    * [const SYS_WAITID_NOCANCEL](#SYS_WAITID_NOCANCEL)
    * [const SYS_POLL_NOCANCEL](#SYS_POLL_NOCANCEL)
    * [const SYS_MSGSND_NOCANCEL](#SYS_MSGSND_NOCANCEL)
    * [const SYS_MSGRCV_NOCANCEL](#SYS_MSGRCV_NOCANCEL)
    * [const SYS_SEM_WAIT_NOCANCEL](#SYS_SEM_WAIT_NOCANCEL)
    * [const SYS_AIO_SUSPEND_NOCANCEL](#SYS_AIO_SUSPEND_NOCANCEL)
    * [const SYS___SIGWAIT_NOCANCEL](#SYS___SIGWAIT_NOCANCEL)
    * [const SYS___SEMWAIT_SIGNAL_NOCANCEL](#SYS___SEMWAIT_SIGNAL_NOCANCEL)
    * [const SYS___MAC_MOUNT](#SYS___MAC_MOUNT)
    * [const SYS___MAC_GET_MOUNT](#SYS___MAC_GET_MOUNT)
    * [const SYS___MAC_GETFSSTAT](#SYS___MAC_GETFSSTAT)
    * [const SYS_FSGETPATH](#SYS_FSGETPATH)
    * [const SYS_AUDIT_SESSION_SELF](#SYS_AUDIT_SESSION_SELF)
    * [const SYS_AUDIT_SESSION_JOIN](#SYS_AUDIT_SESSION_JOIN)
    * [const SYS_FILEPORT_MAKEPORT](#SYS_FILEPORT_MAKEPORT)
    * [const SYS_FILEPORT_MAKEFD](#SYS_FILEPORT_MAKEFD)
    * [const SYS_AUDIT_SESSION_PORT](#SYS_AUDIT_SESSION_PORT)
    * [const SYS_PID_SUSPEND](#SYS_PID_SUSPEND)
    * [const SYS_PID_RESUME](#SYS_PID_RESUME)
    * [const SYS_PID_HIBERNATE](#SYS_PID_HIBERNATE)
    * [const SYS_PID_SHUTDOWN_SOCKETS](#SYS_PID_SHUTDOWN_SOCKETS)
    * [const SYS_SHARED_REGION_MAP_AND_SLIDE_NP](#SYS_SHARED_REGION_MAP_AND_SLIDE_NP)
    * [const SYS_MAXSYSCALL](#SYS_MAXSYSCALL)
    * [const sizeofPtr](#sizeofPtr)
    * [const sizeofShort](#sizeofShort)
    * [const sizeofInt](#sizeofInt)
    * [const sizeofLong](#sizeofLong)
    * [const sizeofLongLong](#sizeofLongLong)
    * [const pathMax](#pathMax)
    * [const SizeofSockaddrInet4](#SizeofSockaddrInet4)
    * [const SizeofSockaddrInet6](#SizeofSockaddrInet6)
    * [const SizeofSockaddrAny](#SizeofSockaddrAny)
    * [const SizeofSockaddrUnix](#SizeofSockaddrUnix)
    * [const SizeofSockaddrDatalink](#SizeofSockaddrDatalink)
    * [const SizeofLinger](#SizeofLinger)
    * [const SizeofIPMreq](#SizeofIPMreq)
    * [const SizeofIPv6Mreq](#SizeofIPv6Mreq)
    * [const SizeofMsghdr](#SizeofMsghdr)
    * [const SizeofCmsghdr](#SizeofCmsghdr)
    * [const SizeofInet4Pktinfo](#SizeofInet4Pktinfo)
    * [const SizeofInet6Pktinfo](#SizeofInet6Pktinfo)
    * [const SizeofIPv6MTUInfo](#SizeofIPv6MTUInfo)
    * [const SizeofICMPv6Filter](#SizeofICMPv6Filter)
    * [const PTRACE_TRACEME](#PTRACE_TRACEME)
    * [const PTRACE_CONT](#PTRACE_CONT)
    * [const PTRACE_KILL](#PTRACE_KILL)
    * [const SizeofIfMsghdr](#SizeofIfMsghdr)
    * [const SizeofIfData](#SizeofIfData)
    * [const SizeofIfaMsghdr](#SizeofIfaMsghdr)
    * [const SizeofIfmaMsghdr](#SizeofIfmaMsghdr)
    * [const SizeofIfmaMsghdr2](#SizeofIfmaMsghdr2)
    * [const SizeofRtMsghdr](#SizeofRtMsghdr)
    * [const SizeofRtMetrics](#SizeofRtMetrics)
    * [const SizeofBpfVersion](#SizeofBpfVersion)
    * [const SizeofBpfStat](#SizeofBpfStat)
    * [const SizeofBpfProgram](#SizeofBpfProgram)
    * [const SizeofBpfInsn](#SizeofBpfInsn)
    * [const SizeofBpfHdr](#SizeofBpfHdr)
    * [const _AT_FDCWD](#_AT_FDCWD)
* [Variables](#var)
    * [var envOnce](#envOnce)
    * [var envLock](#envLock)
    * [var env](#env)
    * [var envs](#envs)
    * [var ForkLock](#ForkLock)
    * [var zeroProcAttr](#zeroProcAttr)
    * [var zeroSysProcAttr](#zeroSysProcAttr)
    * [var execveLibc](#execveLibc)
    * [var execveDarwin](#execveDarwin)
    * [var execveOpenBSD](#execveOpenBSD)
    * [var freebsdConfArch](#freebsdConfArch)
    * [var minRoutingSockaddrLen](#minRoutingSockaddrLen)
    * [var _zero](#_zero)
    * [var mapper](#mapper)
    * [var Stdin](#Stdin)
    * [var Stdout](#Stdout)
    * [var Stderr](#Stderr)
    * [var errEAGAIN](#errEAGAIN)
    * [var errEINVAL](#errEINVAL)
    * [var errENOENT](#errENOENT)
    * [var SocketDisableIPv6](#SocketDisableIPv6)
    * [var ioSync](#ioSync)
    * [var errors](#errors)
    * [var signals](#signals)
* [Types](#type)
    * [type ivalue struct](#ivalue)
    * [type SysProcAttr struct](#SysProcAttr)
    * [type Credential struct](#Credential)
    * [type ProcAttr struct](#ProcAttr)
    * [type RawConn interface](#RawConn)
    * [type Conn interface](#Conn)
    * [type RoutingMessage interface](#RoutingMessage)
    * [type anyMessage struct](#anyMessage)
        * [func (any *anyMessage) toRoutingMessage(b []byte) RoutingMessage](#anyMessage.toRoutingMessage)
    * [type RouteMessage struct](#RouteMessage)
        * [func (m *RouteMessage) sockaddr() ([]Sockaddr, error)](#RouteMessage.sockaddr)
    * [type InterfaceMessage struct](#InterfaceMessage)
        * [func (m *InterfaceMessage) sockaddr() ([]Sockaddr, error)](#InterfaceMessage.sockaddr)
    * [type InterfaceAddrMessage struct](#InterfaceAddrMessage)
        * [func (m *InterfaceAddrMessage) sockaddr() ([]Sockaddr, error)](#InterfaceAddrMessage.sockaddr)
    * [type InterfaceMulticastAddrMessage struct](#InterfaceMulticastAddrMessage)
        * [func (m *InterfaceMulticastAddrMessage) sockaddr() ([]Sockaddr, error)](#InterfaceMulticastAddrMessage.sockaddr)
    * [type SocketControlMessage struct](#SocketControlMessage)
    * [type WaitStatus uint32](#WaitStatus)
        * [func (w WaitStatus) Exited() bool](#WaitStatus.Exited)
        * [func (w WaitStatus) ExitStatus() int](#WaitStatus.ExitStatus)
        * [func (w WaitStatus) Signaled() bool](#WaitStatus.Signaled)
        * [func (w WaitStatus) Signal() Signal](#WaitStatus.Signal)
        * [func (w WaitStatus) CoreDump() bool](#WaitStatus.CoreDump)
        * [func (w WaitStatus) Stopped() bool](#WaitStatus.Stopped)
        * [func (w WaitStatus) Continued() bool](#WaitStatus.Continued)
        * [func (w WaitStatus) StopSignal() Signal](#WaitStatus.StopSignal)
        * [func (w WaitStatus) TrapCause() int](#WaitStatus.TrapCause)
    * [type SockaddrDatalink struct](#SockaddrDatalink)
        * [func parseSockaddrLink(b []byte) (*SockaddrDatalink, error)](#parseSockaddrLink)
        * [func parseLinkLayerAddr(b []byte) (*SockaddrDatalink, int, error)](#parseLinkLayerAddr)
        * [func (sa *SockaddrDatalink) sockaddr() (unsafe.Pointer, _Socklen, error)](#SockaddrDatalink.sockaddr)
    * [type attrList struct](#attrList)
    * [type mmapper struct](#mmapper)
        * [func (m *mmapper) Mmap(fd int, offset int64, length int, prot int, flags int) (data []byte, err error)](#mmapper.Mmap)
        * [func (m *mmapper) Munmap(data []byte) (err error)](#mmapper.Munmap)
    * [type Errno uintptr](#Errno)
        * [func forkAndExecInChild(argv0 *byte, argv, envv []*byte, chroot, dir *byte, attr *ProcAttr, sys *SysProcAttr, pipe int) (pid int, err Errno)](#forkAndExecInChild)
        * [func syscall(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)](#syscall)
        * [func syscall6(fn, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)](#syscall6)
        * [func syscall6X(fn, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)](#syscall6X)
        * [func rawSyscall(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)](#rawSyscall)
        * [func rawSyscall6(fn, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)](#rawSyscall6)
        * [func syscallPtr(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)](#syscallPtr)
        * [func syscallX(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)](#syscallX)
        * [func Syscall9(trap, a1, a2, a3, a4, a5, a6, a7, a8, a9 uintptr) (r1, r2 uintptr, err Errno)](#Syscall9)
        * [func Syscall(trap, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)](#Syscall)
        * [func Syscall6(trap, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)](#Syscall6)
        * [func RawSyscall(trap, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)](#RawSyscall)
        * [func RawSyscall6(trap, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)](#RawSyscall6)
        * [func readdir_r(dir uintptr, entry *Dirent, result **Dirent) (res Errno)](#readdir_r)
        * [func Ioctl(fd, req, arg uintptr) Errno](#Ioctl)
        * [func (e Errno) Error() string](#Errno.Error)
        * [func (e Errno) Is(target error) bool](#Errno.Is)
        * [func (e Errno) Temporary() bool](#Errno.Temporary)
        * [func (e Errno) Timeout() bool](#Errno.Timeout)
    * [type Signal int](#Signal)
        * [func (s Signal) Signal()](#Signal.Signal)
        * [func (s Signal) String() string](#Signal.String)
    * [type Sockaddr interface](#Sockaddr)
        * [func parseSockaddrInet(b []byte, family byte) (Sockaddr, error)](#parseSockaddrInet)
        * [func parseNetworkLayerAddr(b []byte, family byte) (Sockaddr, error)](#parseNetworkLayerAddr)
        * [func anyToSockaddr(rsa *RawSockaddrAny) (Sockaddr, error)](#anyToSockaddr)
        * [func Accept(fd int) (nfd int, sa Sockaddr, err error)](#Accept)
        * [func Getsockname(fd int) (sa Sockaddr, err error)](#Getsockname)
        * [func Recvmsg(fd int, p, oob []byte, flags int) (n, oobn int, recvflags int, from Sockaddr, err error)](#Recvmsg)
        * [func Getpeername(fd int) (sa Sockaddr, err error)](#Getpeername)
        * [func Recvfrom(fd int, p []byte, flags int) (n int, from Sockaddr, err error)](#Recvfrom)
    * [type SockaddrInet4 struct](#SockaddrInet4)
        * [func (sa *SockaddrInet4) sockaddr() (unsafe.Pointer, _Socklen, error)](#SockaddrInet4.sockaddr)
    * [type SockaddrInet6 struct](#SockaddrInet6)
        * [func (sa *SockaddrInet6) sockaddr() (unsafe.Pointer, _Socklen, error)](#SockaddrInet6.sockaddr)
    * [type SockaddrUnix struct](#SockaddrUnix)
        * [func (sa *SockaddrUnix) sockaddr() (unsafe.Pointer, _Socklen, error)](#SockaddrUnix.sockaddr)
    * [type _C_short int16](#_C_short)
    * [type _C_int int32](#_C_int)
    * [type _C_long int64](#_C_long)
    * [type _C_long_long int64](#_C_long_long)
    * [type Timespec struct](#Timespec)
        * [func setTimespec(sec, nsec int64) Timespec](#setTimespec)
        * [func NsecToTimespec(nsec int64) Timespec](#NsecToTimespec)
        * [func (ts *Timespec) Unix() (sec int64, nsec int64)](#Timespec.Unix)
        * [func (ts *Timespec) Nano() int64](#Timespec.Nano)
    * [type Timeval struct](#Timeval)
        * [func BpfTimeout(fd int) (*Timeval, error)](#BpfTimeout)
        * [func setTimeval(sec, usec int64) Timeval](#setTimeval)
        * [func NsecToTimeval(nsec int64) Timeval](#NsecToTimeval)
        * [func (tv *Timeval) Unix() (sec int64, nsec int64)](#Timeval.Unix)
        * [func (tv *Timeval) Nano() int64](#Timeval.Nano)
    * [type Timeval32 struct](#Timeval32)
    * [type Rusage struct](#Rusage)
    * [type Rlimit struct](#Rlimit)
    * [type _Gid_t uint32](#_Gid_t)
    * [type Stat_t struct](#Stat_t)
    * [type Statfs_t struct](#Statfs_t)
    * [type Flock_t struct](#Flock_t)
    * [type Fstore_t struct](#Fstore_t)
    * [type Radvisory_t struct](#Radvisory_t)
    * [type Fbootstraptransfer_t struct](#Fbootstraptransfer_t)
    * [type Log2phys_t struct](#Log2phys_t)
    * [type Fsid struct](#Fsid)
    * [type Dirent struct](#Dirent)
    * [type RawSockaddrInet4 struct](#RawSockaddrInet4)
    * [type RawSockaddrInet6 struct](#RawSockaddrInet6)
    * [type RawSockaddrUnix struct](#RawSockaddrUnix)
    * [type RawSockaddrDatalink struct](#RawSockaddrDatalink)
    * [type RawSockaddr struct](#RawSockaddr)
    * [type RawSockaddrAny struct](#RawSockaddrAny)
    * [type _Socklen uint32](#_Socklen)
    * [type Linger struct](#Linger)
    * [type Iovec struct](#Iovec)
        * [func (iov *Iovec) SetLen(length int)](#Iovec.SetLen)
    * [type IPMreq struct](#IPMreq)
        * [func GetsockoptIPMreq(fd, level, opt int) (*IPMreq, error)](#GetsockoptIPMreq)
    * [type IPv6Mreq struct](#IPv6Mreq)
        * [func GetsockoptIPv6Mreq(fd, level, opt int) (*IPv6Mreq, error)](#GetsockoptIPv6Mreq)
    * [type Msghdr struct](#Msghdr)
        * [func (msghdr *Msghdr) SetControllen(length int)](#Msghdr.SetControllen)
    * [type Cmsghdr struct](#Cmsghdr)
        * [func socketControlMessageHeaderAndData(b []byte) (*Cmsghdr, []byte, error)](#socketControlMessageHeaderAndData)
        * [func (h *Cmsghdr) data(offset uintptr) unsafe.Pointer](#Cmsghdr.data)
        * [func (cmsg *Cmsghdr) SetLen(length int)](#Cmsghdr.SetLen)
    * [type Inet4Pktinfo struct](#Inet4Pktinfo)
    * [type Inet6Pktinfo struct](#Inet6Pktinfo)
    * [type IPv6MTUInfo struct](#IPv6MTUInfo)
        * [func GetsockoptIPv6MTUInfo(fd, level, opt int) (*IPv6MTUInfo, error)](#GetsockoptIPv6MTUInfo)
    * [type ICMPv6Filter struct](#ICMPv6Filter)
        * [func GetsockoptICMPv6Filter(fd, level, opt int) (*ICMPv6Filter, error)](#GetsockoptICMPv6Filter)
    * [type Kevent_t struct](#Kevent_t)
    * [type FdSet struct](#FdSet)
    * [type IfMsghdr struct](#IfMsghdr)
    * [type IfData struct](#IfData)
    * [type IfaMsghdr struct](#IfaMsghdr)
    * [type IfmaMsghdr struct](#IfmaMsghdr)
    * [type IfmaMsghdr2 struct](#IfmaMsghdr2)
    * [type RtMsghdr struct](#RtMsghdr)
    * [type RtMetrics struct](#RtMetrics)
    * [type BpfVersion struct](#BpfVersion)
    * [type BpfStat struct](#BpfStat)
        * [func BpfStats(fd int) (*BpfStat, error)](#BpfStats)
    * [type BpfProgram struct](#BpfProgram)
    * [type BpfInsn struct](#BpfInsn)
        * [func BpfStmt(code, k int) *BpfInsn](#BpfStmt)
        * [func BpfJump(code, k, jt, jf int) *BpfInsn](#BpfJump)
    * [type BpfHdr struct](#BpfHdr)
    * [type Termios struct](#Termios)
* [Functions](#func)
    * [func BpfBuflen(fd int) (int, error)](#BpfBuflen)
    * [func SetBpfBuflen(fd, l int) (int, error)](#SetBpfBuflen)
    * [func BpfDatalink(fd int) (int, error)](#BpfDatalink)
    * [func SetBpfDatalink(fd, t int) (int, error)](#SetBpfDatalink)
    * [func SetBpfPromisc(fd, m int) error](#SetBpfPromisc)
    * [func FlushBpf(fd int) error](#FlushBpf)
    * [func BpfInterface(fd int, name string) (string, error)](#BpfInterface)
    * [func SetBpfInterface(fd int, name string) error](#SetBpfInterface)
    * [func SetBpfTimeout(fd int, tv *Timeval) error](#SetBpfTimeout)
    * [func SetBpfImmediate(fd, m int) error](#SetBpfImmediate)
    * [func SetBpf(fd int, i []BpfInsn) error](#SetBpf)
    * [func CheckBpfVersion(fd int) error](#CheckBpfVersion)
    * [func BpfHeadercmpl(fd int) (int, error)](#BpfHeadercmpl)
    * [func SetBpfHeadercmpl(fd, f int) error](#SetBpfHeadercmpl)
    * [func readInt(b []byte, off, size uintptr) (u uint64, ok bool)](#readInt)
    * [func readIntBE(b []byte, size uintptr) uint64](#readIntBE)
    * [func readIntLE(b []byte, size uintptr) uint64](#readIntLE)
    * [func ParseDirent(buf []byte, max int, names []string) (consumed int, count int, newnames []string)](#ParseDirent)
    * [func runtime_envs() []string](#runtime_envs)
    * [func setenv_c(k, v string)](#setenv_c)
    * [func unsetenv_c(k string)](#unsetenv_c)
    * [func copyenv()](#copyenv)
    * [func Unsetenv(key string) error](#Unsetenv)
    * [func Getenv(key string) (value string, found bool)](#Getenv)
    * [func Setenv(key, value string) error](#Setenv)
    * [func Clearenv()](#Clearenv)
    * [func Environ() []string](#Environ)
    * [func runtime_BeforeFork()](#runtime_BeforeFork)
    * [func runtime_AfterFork()](#runtime_AfterFork)
    * [func runtime_AfterForkInChild()](#runtime_AfterForkInChild)
    * [func StringSlicePtr(ss []string) []*byte](#StringSlicePtr)
    * [func SlicePtrFromStrings(ss []string) ([]*byte, error)](#SlicePtrFromStrings)
    * [func CloseOnExec(fd int)](#CloseOnExec)
    * [func SetNonblock(fd int, nonblocking bool) (err error)](#SetNonblock)
    * [func forkExec(argv0 string, argv []string, attr *ProcAttr) (pid int, err error)](#forkExec)
    * [func ForkExec(argv0 string, argv []string, attr *ProcAttr) (pid int, err error)](#ForkExec)
    * [func StartProcess(argv0 string, argv []string, attr *ProcAttr) (pid int, handle uintptr, err error)](#StartProcess)
    * [func runtime_BeforeExec()](#runtime_BeforeExec)
    * [func runtime_AfterExec()](#runtime_AfterExec)
    * [func Exec(argv0 string, argv []string, envv []string) (err error)](#Exec)
    * [func FcntlFlock(fd uintptr, cmd int, lk *Flock_t) error](#FcntlFlock)
    * [func forkExecPipe(p []int) error](#forkExecPipe)
    * [func msanRead(addr unsafe.Pointer, len int)](#msanRead)
    * [func msanWrite(addr unsafe.Pointer, len int)](#msanWrite)
    * [func ptrace(request int, pid int, addr uintptr, data uintptr) error](#ptrace)
    * [func rsaAlignOf(salen int) int](#rsaAlignOf)
    * [func RouteRIB(facility, param int) ([]byte, error)](#RouteRIB)
    * [func ParseRoutingMessage(b []byte) (msgs []RoutingMessage, err error)](#ParseRoutingMessage)
    * [func ParseRoutingSockaddr(msg RoutingMessage) ([]Sockaddr, error)](#ParseRoutingSockaddr)
    * [func CmsgLen(datalen int) int](#CmsgLen)
    * [func CmsgSpace(datalen int) int](#CmsgSpace)
    * [func ParseSocketControlMessage(b []byte) ([]SocketControlMessage, error)](#ParseSocketControlMessage)
    * [func UnixRights(fds ...int) []byte](#UnixRights)
    * [func ParseUnixRights(m *SocketControlMessage) ([]int, error)](#ParseUnixRights)
    * [func cmsgAlignOf(salen int) int](#cmsgAlignOf)
    * [func StringByteSlice(s string) []byte](#StringByteSlice)
    * [func ByteSliceFromString(s string) ([]byte, error)](#ByteSliceFromString)
    * [func StringBytePtr(s string) *byte](#StringBytePtr)
    * [func BytePtrFromString(s string) (*byte, error)](#BytePtrFromString)
    * [func Getpagesize() int](#Getpagesize)
    * [func Exit(code int)](#Exit)
    * [func Getwd() (string, error)](#Getwd)
    * [func Getgroups() (gids []int, err error)](#Getgroups)
    * [func Setgroups(gids []int) (err error)](#Setgroups)
    * [func ReadDirent(fd int, buf []byte) (n int, err error)](#ReadDirent)
    * [func Wait4(pid int, wstatus *WaitStatus, options int, rusage *Rusage) (wpid int, err error)](#Wait4)
    * [func GetsockoptByte(fd, level, opt int) (value byte, err error)](#GetsockoptByte)
    * [func GetsockoptInet4Addr(fd, level, opt int) (value [4]byte, err error)](#GetsockoptInet4Addr)
    * [func Sendmsg(fd int, p, oob []byte, to Sockaddr, flags int) (err error)](#Sendmsg)
    * [func SendmsgN(fd int, p, oob []byte, to Sockaddr, flags int) (n int, err error)](#SendmsgN)
    * [func Kevent(kq int, changes, events []Kevent_t, timeout *Timespec) (n int, err error)](#Kevent)
    * [func Sysctl(name string) (value string, err error)](#Sysctl)
    * [func SysctlUint32(name string) (value uint32, err error)](#SysctlUint32)
    * [func Utimes(path string, tv []Timeval) (err error)](#Utimes)
    * [func UtimesNano(path string, ts []Timespec) error](#UtimesNano)
    * [func Futimes(fd int, tv []Timeval) (err error)](#Futimes)
    * [func Mmap(fd int, offset int64, length int, prot int, flags int) (data []byte, err error)](#Mmap)
    * [func Munmap(b []byte) (err error)](#Munmap)
    * [func nametomib(name string) (mib []_C_int, err error)](#nametomib)
    * [func direntIno(buf []byte) (uint64, bool)](#direntIno)
    * [func direntReclen(buf []byte) (uint64, bool)](#direntReclen)
    * [func direntNamlen(buf []byte) (uint64, bool)](#direntNamlen)
    * [func PtraceAttach(pid int) (err error)](#PtraceAttach)
    * [func PtraceDetach(pid int) (err error)](#PtraceDetach)
    * [func Pipe(p []int) (err error)](#Pipe)
    * [func Getfsstat(buf []Statfs_t, flags int) (n int, err error)](#Getfsstat)
    * [func libc_getfsstat_trampoline()](#libc_getfsstat_trampoline)
    * [func setattrlistTimes(path string, times []Timespec) error](#setattrlistTimes)
    * [func libc_setattrlist_trampoline()](#libc_setattrlist_trampoline)
    * [func utimensat(dirfd int, path string, times *[2]Timespec, flag int) error](#utimensat)
    * [func Kill(pid int, signum Signal) (err error)](#Kill)
    * [func init()](#init.syscall_darwin.go)
    * [func fdopendir(fd int) (dir uintptr, err error)](#fdopendir)
    * [func libc_fdopendir_trampoline()](#libc_fdopendir_trampoline)
    * [func readlen(fd int, buf *byte, nbuf int) (n int, err error)](#readlen)
    * [func writelen(fd int, buf *byte, nbuf int) (n int, err error)](#writelen)
    * [func Getdirentries(fd int, buf []byte, basep *uintptr) (n int, err error)](#Getdirentries)
    * [func SetKevent(k *Kevent_t, fd, mode, flags int)](#SetKevent)
    * [func sendfile(outfd int, infd int, offset *int64, count int) (written int, err error)](#sendfile)
    * [func libc_sendfile_trampoline()](#libc_sendfile_trampoline)
    * [func clen(n []byte) int](#clen)
    * [func errnoErr(e Errno) error](#errnoErr)
    * [func Read(fd int, p []byte) (n int, err error)](#Read)
    * [func Write(fd int, p []byte) (n int, err error)](#Write)
    * [func Bind(fd int, sa Sockaddr) (err error)](#Bind)
    * [func Connect(fd int, sa Sockaddr) (err error)](#Connect)
    * [func GetsockoptInt(fd, level, opt int) (value int, err error)](#GetsockoptInt)
    * [func Sendto(fd int, p []byte, flags int, to Sockaddr) (err error)](#Sendto)
    * [func SetsockoptByte(fd, level, opt int, value byte) (err error)](#SetsockoptByte)
    * [func SetsockoptInt(fd, level, opt int, value int) (err error)](#SetsockoptInt)
    * [func SetsockoptInet4Addr(fd, level, opt int, value [4]byte) (err error)](#SetsockoptInet4Addr)
    * [func SetsockoptIPMreq(fd, level, opt int, mreq *IPMreq) (err error)](#SetsockoptIPMreq)
    * [func SetsockoptIPv6Mreq(fd, level, opt int, mreq *IPv6Mreq) (err error)](#SetsockoptIPv6Mreq)
    * [func SetsockoptICMPv6Filter(fd, level, opt int, filter *ICMPv6Filter) error](#SetsockoptICMPv6Filter)
    * [func SetsockoptLinger(fd, level, opt int, l *Linger) (err error)](#SetsockoptLinger)
    * [func SetsockoptString(fd, level, opt int, s string) (err error)](#SetsockoptString)
    * [func SetsockoptTimeval(fd, level, opt int, tv *Timeval) (err error)](#SetsockoptTimeval)
    * [func Socket(domain, typ, proto int) (fd int, err error)](#Socket)
    * [func Socketpair(domain, typ, proto int) (fd [2]int, err error)](#Socketpair)
    * [func Sendfile(outfd int, infd int, offset *int64, count int) (written int, err error)](#Sendfile)
    * [func faketimeWrite(fd int, p []byte) int](#faketimeWrite)
    * [func TimespecToNsec(ts Timespec) int64](#TimespecToNsec)
    * [func TimevalToNsec(tv Timeval) int64](#TimevalToNsec)
    * [func getgroups(ngid int, gid *_Gid_t) (n int, err error)](#getgroups)
    * [func libc_getgroups_trampoline()](#libc_getgroups_trampoline)
    * [func setgroups(ngid int, gid *_Gid_t) (err error)](#setgroups)
    * [func libc_setgroups_trampoline()](#libc_setgroups_trampoline)
    * [func wait4(pid int, wstatus *_C_int, options int, rusage *Rusage) (wpid int, err error)](#wait4)
    * [func libc_wait4_trampoline()](#libc_wait4_trampoline)
    * [func accept(s int, rsa *RawSockaddrAny, addrlen *_Socklen) (fd int, err error)](#accept)
    * [func libc_accept_trampoline()](#libc_accept_trampoline)
    * [func bind(s int, addr unsafe.Pointer, addrlen _Socklen) (err error)](#bind)
    * [func libc_bind_trampoline()](#libc_bind_trampoline)
    * [func connect(s int, addr unsafe.Pointer, addrlen _Socklen) (err error)](#connect)
    * [func libc_connect_trampoline()](#libc_connect_trampoline)
    * [func socket(domain int, typ int, proto int) (fd int, err error)](#socket)
    * [func libc_socket_trampoline()](#libc_socket_trampoline)
    * [func getsockopt(s int, level int, name int, val unsafe.Pointer, vallen *_Socklen) (err error)](#getsockopt)
    * [func libc_getsockopt_trampoline()](#libc_getsockopt_trampoline)
    * [func setsockopt(s int, level int, name int, val unsafe.Pointer, vallen uintptr) (err error)](#setsockopt)
    * [func libc_setsockopt_trampoline()](#libc_setsockopt_trampoline)
    * [func getpeername(fd int, rsa *RawSockaddrAny, addrlen *_Socklen) (err error)](#getpeername)
    * [func libc_getpeername_trampoline()](#libc_getpeername_trampoline)
    * [func getsockname(fd int, rsa *RawSockaddrAny, addrlen *_Socklen) (err error)](#getsockname)
    * [func libc_getsockname_trampoline()](#libc_getsockname_trampoline)
    * [func Shutdown(s int, how int) (err error)](#Shutdown)
    * [func libc_shutdown_trampoline()](#libc_shutdown_trampoline)
    * [func socketpair(domain int, typ int, proto int, fd *[2]int32) (err error)](#socketpair)
    * [func libc_socketpair_trampoline()](#libc_socketpair_trampoline)
    * [func recvfrom(fd int, p []byte, flags int, from *RawSockaddrAny, fromlen *_Socklen) (n int, err error)](#recvfrom)
    * [func libc_recvfrom_trampoline()](#libc_recvfrom_trampoline)
    * [func sendto(s int, buf []byte, flags int, to unsafe.Pointer, addrlen _Socklen) (err error)](#sendto)
    * [func libc_sendto_trampoline()](#libc_sendto_trampoline)
    * [func recvmsg(s int, msg *Msghdr, flags int) (n int, err error)](#recvmsg)
    * [func libc_recvmsg_trampoline()](#libc_recvmsg_trampoline)
    * [func sendmsg(s int, msg *Msghdr, flags int) (n int, err error)](#sendmsg)
    * [func libc_sendmsg_trampoline()](#libc_sendmsg_trampoline)
    * [func kevent(kq int, change unsafe.Pointer, nchange int, event unsafe.Pointer, nevent int, timeout *Timespec) (n int, err error)](#kevent)
    * [func libc_kevent_trampoline()](#libc_kevent_trampoline)
    * [func utimes(path string, timeval *[2]Timeval) (err error)](#utimes)
    * [func libc_utimes_trampoline()](#libc_utimes_trampoline)
    * [func futimes(fd int, timeval *[2]Timeval) (err error)](#futimes)
    * [func libc_futimes_trampoline()](#libc_futimes_trampoline)
    * [func fcntl(fd int, cmd int, arg int) (val int, err error)](#fcntl)
    * [func libc_fcntl_trampoline()](#libc_fcntl_trampoline)
    * [func pipe(p *[2]int32) (err error)](#pipe)
    * [func libc_pipe_trampoline()](#libc_pipe_trampoline)
    * [func kill(pid int, signum int, posix int) (err error)](#kill)
    * [func libc_kill_trampoline()](#libc_kill_trampoline)
    * [func Access(path string, mode uint32) (err error)](#Access)
    * [func libc_access_trampoline()](#libc_access_trampoline)
    * [func Adjtime(delta *Timeval, olddelta *Timeval) (err error)](#Adjtime)
    * [func libc_adjtime_trampoline()](#libc_adjtime_trampoline)
    * [func Chdir(path string) (err error)](#Chdir)
    * [func libc_chdir_trampoline()](#libc_chdir_trampoline)
    * [func Chflags(path string, flags int) (err error)](#Chflags)
    * [func libc_chflags_trampoline()](#libc_chflags_trampoline)
    * [func Chmod(path string, mode uint32) (err error)](#Chmod)
    * [func libc_chmod_trampoline()](#libc_chmod_trampoline)
    * [func Chown(path string, uid int, gid int) (err error)](#Chown)
    * [func libc_chown_trampoline()](#libc_chown_trampoline)
    * [func Chroot(path string) (err error)](#Chroot)
    * [func libc_chroot_trampoline()](#libc_chroot_trampoline)
    * [func Close(fd int) (err error)](#Close)
    * [func libc_close_trampoline()](#libc_close_trampoline)
    * [func closedir(dir uintptr) (err error)](#closedir)
    * [func libc_closedir_trampoline()](#libc_closedir_trampoline)
    * [func Dup(fd int) (nfd int, err error)](#Dup)
    * [func libc_dup_trampoline()](#libc_dup_trampoline)
    * [func Dup2(from int, to int) (err error)](#Dup2)
    * [func libc_dup2_trampoline()](#libc_dup2_trampoline)
    * [func Exchangedata(path1 string, path2 string, options int) (err error)](#Exchangedata)
    * [func libc_exchangedata_trampoline()](#libc_exchangedata_trampoline)
    * [func Fchdir(fd int) (err error)](#Fchdir)
    * [func libc_fchdir_trampoline()](#libc_fchdir_trampoline)
    * [func Fchflags(fd int, flags int) (err error)](#Fchflags)
    * [func libc_fchflags_trampoline()](#libc_fchflags_trampoline)
    * [func Fchmod(fd int, mode uint32) (err error)](#Fchmod)
    * [func libc_fchmod_trampoline()](#libc_fchmod_trampoline)
    * [func Fchown(fd int, uid int, gid int) (err error)](#Fchown)
    * [func libc_fchown_trampoline()](#libc_fchown_trampoline)
    * [func Flock(fd int, how int) (err error)](#Flock)
    * [func libc_flock_trampoline()](#libc_flock_trampoline)
    * [func Fpathconf(fd int, name int) (val int, err error)](#Fpathconf)
    * [func libc_fpathconf_trampoline()](#libc_fpathconf_trampoline)
    * [func Fsync(fd int) (err error)](#Fsync)
    * [func libc_fsync_trampoline()](#libc_fsync_trampoline)
    * [func Ftruncate(fd int, length int64) (err error)](#Ftruncate)
    * [func libc_ftruncate_trampoline()](#libc_ftruncate_trampoline)
    * [func Getdtablesize() (size int)](#Getdtablesize)
    * [func libc_getdtablesize_trampoline()](#libc_getdtablesize_trampoline)
    * [func Getegid() (egid int)](#Getegid)
    * [func libc_getegid_trampoline()](#libc_getegid_trampoline)
    * [func Geteuid() (uid int)](#Geteuid)
    * [func libc_geteuid_trampoline()](#libc_geteuid_trampoline)
    * [func Getgid() (gid int)](#Getgid)
    * [func libc_getgid_trampoline()](#libc_getgid_trampoline)
    * [func Getpgid(pid int) (pgid int, err error)](#Getpgid)
    * [func libc_getpgid_trampoline()](#libc_getpgid_trampoline)
    * [func Getpgrp() (pgrp int)](#Getpgrp)
    * [func libc_getpgrp_trampoline()](#libc_getpgrp_trampoline)
    * [func Getpid() (pid int)](#Getpid)
    * [func libc_getpid_trampoline()](#libc_getpid_trampoline)
    * [func Getppid() (ppid int)](#Getppid)
    * [func libc_getppid_trampoline()](#libc_getppid_trampoline)
    * [func Getpriority(which int, who int) (prio int, err error)](#Getpriority)
    * [func libc_getpriority_trampoline()](#libc_getpriority_trampoline)
    * [func Getrlimit(which int, lim *Rlimit) (err error)](#Getrlimit)
    * [func libc_getrlimit_trampoline()](#libc_getrlimit_trampoline)
    * [func Getrusage(who int, rusage *Rusage) (err error)](#Getrusage)
    * [func libc_getrusage_trampoline()](#libc_getrusage_trampoline)
    * [func Getsid(pid int) (sid int, err error)](#Getsid)
    * [func libc_getsid_trampoline()](#libc_getsid_trampoline)
    * [func Getuid() (uid int)](#Getuid)
    * [func libc_getuid_trampoline()](#libc_getuid_trampoline)
    * [func Issetugid() (tainted bool)](#Issetugid)
    * [func libc_issetugid_trampoline()](#libc_issetugid_trampoline)
    * [func Kqueue() (fd int, err error)](#Kqueue)
    * [func libc_kqueue_trampoline()](#libc_kqueue_trampoline)
    * [func Lchown(path string, uid int, gid int) (err error)](#Lchown)
    * [func libc_lchown_trampoline()](#libc_lchown_trampoline)
    * [func Link(path string, link string) (err error)](#Link)
    * [func libc_link_trampoline()](#libc_link_trampoline)
    * [func Listen(s int, backlog int) (err error)](#Listen)
    * [func libc_listen_trampoline()](#libc_listen_trampoline)
    * [func Mkdir(path string, mode uint32) (err error)](#Mkdir)
    * [func libc_mkdir_trampoline()](#libc_mkdir_trampoline)
    * [func Mkfifo(path string, mode uint32) (err error)](#Mkfifo)
    * [func libc_mkfifo_trampoline()](#libc_mkfifo_trampoline)
    * [func Mknod(path string, mode uint32, dev int) (err error)](#Mknod)
    * [func libc_mknod_trampoline()](#libc_mknod_trampoline)
    * [func Mlock(b []byte) (err error)](#Mlock)
    * [func libc_mlock_trampoline()](#libc_mlock_trampoline)
    * [func Mlockall(flags int) (err error)](#Mlockall)
    * [func libc_mlockall_trampoline()](#libc_mlockall_trampoline)
    * [func Mprotect(b []byte, prot int) (err error)](#Mprotect)
    * [func libc_mprotect_trampoline()](#libc_mprotect_trampoline)
    * [func Munlock(b []byte) (err error)](#Munlock)
    * [func libc_munlock_trampoline()](#libc_munlock_trampoline)
    * [func Munlockall() (err error)](#Munlockall)
    * [func libc_munlockall_trampoline()](#libc_munlockall_trampoline)
    * [func Open(path string, mode int, perm uint32) (fd int, err error)](#Open)
    * [func libc_open_trampoline()](#libc_open_trampoline)
    * [func Pathconf(path string, name int) (val int, err error)](#Pathconf)
    * [func libc_pathconf_trampoline()](#libc_pathconf_trampoline)
    * [func Pread(fd int, p []byte, offset int64) (n int, err error)](#Pread)
    * [func libc_pread_trampoline()](#libc_pread_trampoline)
    * [func Pwrite(fd int, p []byte, offset int64) (n int, err error)](#Pwrite)
    * [func libc_pwrite_trampoline()](#libc_pwrite_trampoline)
    * [func read(fd int, p []byte) (n int, err error)](#read)
    * [func libc_read_trampoline()](#libc_read_trampoline)
    * [func libc_readdir_r_trampoline()](#libc_readdir_r_trampoline)
    * [func Readlink(path string, buf []byte) (n int, err error)](#Readlink)
    * [func libc_readlink_trampoline()](#libc_readlink_trampoline)
    * [func Rename(from string, to string) (err error)](#Rename)
    * [func libc_rename_trampoline()](#libc_rename_trampoline)
    * [func Revoke(path string) (err error)](#Revoke)
    * [func libc_revoke_trampoline()](#libc_revoke_trampoline)
    * [func Rmdir(path string) (err error)](#Rmdir)
    * [func libc_rmdir_trampoline()](#libc_rmdir_trampoline)
    * [func Seek(fd int, offset int64, whence int) (newoffset int64, err error)](#Seek)
    * [func libc_lseek_trampoline()](#libc_lseek_trampoline)
    * [func Select(n int, r *FdSet, w *FdSet, e *FdSet, timeout *Timeval) (err error)](#Select)
    * [func libc_select_trampoline()](#libc_select_trampoline)
    * [func Setegid(egid int) (err error)](#Setegid)
    * [func libc_setegid_trampoline()](#libc_setegid_trampoline)
    * [func Seteuid(euid int) (err error)](#Seteuid)
    * [func libc_seteuid_trampoline()](#libc_seteuid_trampoline)
    * [func Setgid(gid int) (err error)](#Setgid)
    * [func libc_setgid_trampoline()](#libc_setgid_trampoline)
    * [func Setlogin(name string) (err error)](#Setlogin)
    * [func libc_setlogin_trampoline()](#libc_setlogin_trampoline)
    * [func Setpgid(pid int, pgid int) (err error)](#Setpgid)
    * [func libc_setpgid_trampoline()](#libc_setpgid_trampoline)
    * [func Setpriority(which int, who int, prio int) (err error)](#Setpriority)
    * [func libc_setpriority_trampoline()](#libc_setpriority_trampoline)
    * [func Setprivexec(flag int) (err error)](#Setprivexec)
    * [func libc_setprivexec_trampoline()](#libc_setprivexec_trampoline)
    * [func Setregid(rgid int, egid int) (err error)](#Setregid)
    * [func libc_setregid_trampoline()](#libc_setregid_trampoline)
    * [func Setreuid(ruid int, euid int) (err error)](#Setreuid)
    * [func libc_setreuid_trampoline()](#libc_setreuid_trampoline)
    * [func Setrlimit(which int, lim *Rlimit) (err error)](#Setrlimit)
    * [func libc_setrlimit_trampoline()](#libc_setrlimit_trampoline)
    * [func Setsid() (pid int, err error)](#Setsid)
    * [func libc_setsid_trampoline()](#libc_setsid_trampoline)
    * [func Settimeofday(tp *Timeval) (err error)](#Settimeofday)
    * [func libc_settimeofday_trampoline()](#libc_settimeofday_trampoline)
    * [func Setuid(uid int) (err error)](#Setuid)
    * [func libc_setuid_trampoline()](#libc_setuid_trampoline)
    * [func Symlink(path string, link string) (err error)](#Symlink)
    * [func libc_symlink_trampoline()](#libc_symlink_trampoline)
    * [func Sync() (err error)](#Sync)
    * [func libc_sync_trampoline()](#libc_sync_trampoline)
    * [func Truncate(path string, length int64) (err error)](#Truncate)
    * [func libc_truncate_trampoline()](#libc_truncate_trampoline)
    * [func Umask(newmask int) (oldmask int)](#Umask)
    * [func libc_umask_trampoline()](#libc_umask_trampoline)
    * [func Undelete(path string) (err error)](#Undelete)
    * [func libc_undelete_trampoline()](#libc_undelete_trampoline)
    * [func Unlink(path string) (err error)](#Unlink)
    * [func libc_unlink_trampoline()](#libc_unlink_trampoline)
    * [func Unmount(path string, flags int) (err error)](#Unmount)
    * [func libc_unmount_trampoline()](#libc_unmount_trampoline)
    * [func write(fd int, p []byte) (n int, err error)](#write)
    * [func libc_write_trampoline()](#libc_write_trampoline)
    * [func writev(fd int, iovecs []Iovec) (cnt uintptr, err error)](#writev)
    * [func libc_writev_trampoline()](#libc_writev_trampoline)
    * [func mmap(addr uintptr, length uintptr, prot int, flag int, fd int, pos int64) (ret uintptr, err error)](#mmap)
    * [func libc_mmap_trampoline()](#libc_mmap_trampoline)
    * [func munmap(addr uintptr, length uintptr) (err error)](#munmap)
    * [func libc_munmap_trampoline()](#libc_munmap_trampoline)
    * [func fork() (pid int, err error)](#fork)
    * [func libc_fork_trampoline()](#libc_fork_trampoline)
    * [func ioctl(fd int, req int, arg int) (err error)](#ioctl)
    * [func libc_ioctl_trampoline()](#libc_ioctl_trampoline)
    * [func ioctlPtr(fd int, req uint, arg unsafe.Pointer) (err error)](#ioctlPtr)
    * [func execve(path *byte, argv **byte, envp **byte) (err error)](#execve)
    * [func libc_execve_trampoline()](#libc_execve_trampoline)
    * [func exit(res int) (err error)](#exit)
    * [func libc_exit_trampoline()](#libc_exit_trampoline)
    * [func sysctl(mib []_C_int, old *byte, oldlen *uintptr, new *byte, newlen uintptr) (err error)](#sysctl)
    * [func libc_sysctl_trampoline()](#libc_sysctl_trampoline)
    * [func fcntlPtr(fd int, cmd int, arg unsafe.Pointer) (val int, err error)](#fcntlPtr)
    * [func unlinkat(fd int, path string, flags int) (err error)](#unlinkat)
    * [func libc_unlinkat_trampoline()](#libc_unlinkat_trampoline)
    * [func openat(fd int, path string, flags int, perm uint32) (fdret int, err error)](#openat)
    * [func libc_openat_trampoline()](#libc_openat_trampoline)
    * [func getcwd(buf []byte) (n int, err error)](#getcwd)
    * [func libc_getcwd_trampoline()](#libc_getcwd_trampoline)
    * [func Fstat(fd int, stat *Stat_t) (err error)](#Fstat)
    * [func libc_fstat64_trampoline()](#libc_fstat64_trampoline)
    * [func Fstatfs(fd int, stat *Statfs_t) (err error)](#Fstatfs)
    * [func libc_fstatfs64_trampoline()](#libc_fstatfs64_trampoline)
    * [func Gettimeofday(tp *Timeval) (err error)](#Gettimeofday)
    * [func libc_gettimeofday_trampoline()](#libc_gettimeofday_trampoline)
    * [func Lstat(path string, stat *Stat_t) (err error)](#Lstat)
    * [func libc_lstat64_trampoline()](#libc_lstat64_trampoline)
    * [func Stat(path string, stat *Stat_t) (err error)](#Stat)
    * [func libc_stat64_trampoline()](#libc_stat64_trampoline)
    * [func Statfs(path string, stat *Statfs_t) (err error)](#Statfs)
    * [func libc_statfs64_trampoline()](#libc_statfs64_trampoline)
    * [func fstatat(fd int, path string, stat *Stat_t, flags int) (err error)](#fstatat)
    * [func libc_fstatat64_trampoline()](#libc_fstatat64_trampoline)
    * [func ptrace1(request int, pid int, addr uintptr, data uintptr) (err error)](#ptrace1)
    * [func libc_ptrace_trampoline()](#libc_ptrace_trampoline)


## <a id="const" href="#const">Constants</a>

```
tags: [deprecated]
```

### <a id="isBigEndian" href="#isBigEndian">const isBigEndian</a>

```
searchKey: syscall.isBigEndian
tags: [private]
```

```Go
const isBigEndian = false
```

### <a id="msanenabled" href="#msanenabled">const msanenabled</a>

```
searchKey: syscall.msanenabled
tags: [private]
```

```Go
const msanenabled = false
```

### <a id="offsetofInet4" href="#offsetofInet4">const offsetofInet4</a>

```
searchKey: syscall.offsetofInet4
tags: [private]
```

```Go
const offsetofInet4 = int(unsafe.Offsetof(RawSockaddrInet4{}.Addr))
```

### <a id="offsetofInet6" href="#offsetofInet6">const offsetofInet6</a>

```
searchKey: syscall.offsetofInet6
tags: [private]
```

```Go
const offsetofInet6 = int(unsafe.Offsetof(RawSockaddrInet6{}.Addr))
```

### <a id="anyMessageLen" href="#anyMessageLen">const anyMessageLen</a>

```
searchKey: syscall.anyMessageLen
tags: [private]
```

```Go
const anyMessageLen = int(unsafe.Sizeof(anyMessage{}))
```

### <a id="ImplementsGetwd" href="#ImplementsGetwd">const ImplementsGetwd</a>

```
searchKey: syscall.ImplementsGetwd
```

```Go
const ImplementsGetwd = true
```

### <a id="mask" href="#mask">const mask</a>

```
searchKey: syscall.mask
tags: [private]
```

```Go
const mask = 0x7F
```

### <a id="core" href="#core">const core</a>

```
searchKey: syscall.core
tags: [private]
```

```Go
const core = 0x80
```

### <a id="shift" href="#shift">const shift</a>

```
searchKey: syscall.shift
tags: [private]
```

```Go
const shift = 8
```

### <a id="exited" href="#exited">const exited</a>

```
searchKey: syscall.exited
tags: [private]
```

```Go
const exited = 0
```

### <a id="stopped" href="#stopped">const stopped</a>

```
searchKey: syscall.stopped
tags: [private]
```

```Go
const stopped = 0x7F
```

### <a id="attrBitMapCount" href="#attrBitMapCount">const attrBitMapCount</a>

```
searchKey: syscall.attrBitMapCount
tags: [private]
```

```Go
const attrBitMapCount = 5
```

### <a id="attrCmnModtime" href="#attrCmnModtime">const attrCmnModtime</a>

```
searchKey: syscall.attrCmnModtime
tags: [private]
```

```Go
const attrCmnModtime = 0x00000400
```

### <a id="attrCmnAcctime" href="#attrCmnAcctime">const attrCmnAcctime</a>

```
searchKey: syscall.attrCmnAcctime
tags: [private]
```

```Go
const attrCmnAcctime = 0x00001000
```

### <a id="darwin64Bit" href="#darwin64Bit">const darwin64Bit</a>

```
searchKey: syscall.darwin64Bit
tags: [private]
```

```Go
const darwin64Bit = (runtime.GOOS == "darwin" || runtime.GOOS == "ios") && sizeofPtr == 8
```

### <a id="netbsd32Bit" href="#netbsd32Bit">const netbsd32Bit</a>

```
searchKey: syscall.netbsd32Bit
tags: [private]
```

```Go
const netbsd32Bit = runtime.GOOS == "netbsd" && sizeofPtr == 4
```

### <a id="faketime" href="#faketime">const faketime</a>

```
searchKey: syscall.faketime
tags: [private]
```

```Go
const faketime = false
```

### <a id="AF_APPLETALK" href="#AF_APPLETALK">const AF_APPLETALK</a>

```
searchKey: syscall.AF_APPLETALK
```

```Go
const AF_APPLETALK = 0x10
```

### <a id="AF_CCITT" href="#AF_CCITT">const AF_CCITT</a>

```
searchKey: syscall.AF_CCITT
```

```Go
const AF_CCITT = 0xa
```

### <a id="AF_CHAOS" href="#AF_CHAOS">const AF_CHAOS</a>

```
searchKey: syscall.AF_CHAOS
```

```Go
const AF_CHAOS = 0x5
```

### <a id="AF_CNT" href="#AF_CNT">const AF_CNT</a>

```
searchKey: syscall.AF_CNT
```

```Go
const AF_CNT = 0x15
```

### <a id="AF_COIP" href="#AF_COIP">const AF_COIP</a>

```
searchKey: syscall.AF_COIP
```

```Go
const AF_COIP = 0x14
```

### <a id="AF_DATAKIT" href="#AF_DATAKIT">const AF_DATAKIT</a>

```
searchKey: syscall.AF_DATAKIT
```

```Go
const AF_DATAKIT = 0x9
```

### <a id="AF_DECnet" href="#AF_DECnet">const AF_DECnet</a>

```
searchKey: syscall.AF_DECnet
```

```Go
const AF_DECnet = 0xc
```

### <a id="AF_DLI" href="#AF_DLI">const AF_DLI</a>

```
searchKey: syscall.AF_DLI
```

```Go
const AF_DLI = 0xd
```

### <a id="AF_E164" href="#AF_E164">const AF_E164</a>

```
searchKey: syscall.AF_E164
```

```Go
const AF_E164 = 0x1c
```

### <a id="AF_ECMA" href="#AF_ECMA">const AF_ECMA</a>

```
searchKey: syscall.AF_ECMA
```

```Go
const AF_ECMA = 0x8
```

### <a id="AF_HYLINK" href="#AF_HYLINK">const AF_HYLINK</a>

```
searchKey: syscall.AF_HYLINK
```

```Go
const AF_HYLINK = 0xf
```

### <a id="AF_IEEE80211" href="#AF_IEEE80211">const AF_IEEE80211</a>

```
searchKey: syscall.AF_IEEE80211
```

```Go
const AF_IEEE80211 = 0x25
```

### <a id="AF_IMPLINK" href="#AF_IMPLINK">const AF_IMPLINK</a>

```
searchKey: syscall.AF_IMPLINK
```

```Go
const AF_IMPLINK = 0x3
```

### <a id="AF_INET" href="#AF_INET">const AF_INET</a>

```
searchKey: syscall.AF_INET
```

```Go
const AF_INET = 0x2
```

### <a id="AF_INET6" href="#AF_INET6">const AF_INET6</a>

```
searchKey: syscall.AF_INET6
```

```Go
const AF_INET6 = 0x1e
```

### <a id="AF_IPX" href="#AF_IPX">const AF_IPX</a>

```
searchKey: syscall.AF_IPX
```

```Go
const AF_IPX = 0x17
```

### <a id="AF_ISDN" href="#AF_ISDN">const AF_ISDN</a>

```
searchKey: syscall.AF_ISDN
```

```Go
const AF_ISDN = 0x1c
```

### <a id="AF_ISO" href="#AF_ISO">const AF_ISO</a>

```
searchKey: syscall.AF_ISO
```

```Go
const AF_ISO = 0x7
```

### <a id="AF_LAT" href="#AF_LAT">const AF_LAT</a>

```
searchKey: syscall.AF_LAT
```

```Go
const AF_LAT = 0xe
```

### <a id="AF_LINK" href="#AF_LINK">const AF_LINK</a>

```
searchKey: syscall.AF_LINK
```

```Go
const AF_LINK = 0x12
```

### <a id="AF_LOCAL" href="#AF_LOCAL">const AF_LOCAL</a>

```
searchKey: syscall.AF_LOCAL
```

```Go
const AF_LOCAL = 0x1
```

### <a id="AF_MAX" href="#AF_MAX">const AF_MAX</a>

```
searchKey: syscall.AF_MAX
```

```Go
const AF_MAX = 0x26
```

### <a id="AF_NATM" href="#AF_NATM">const AF_NATM</a>

```
searchKey: syscall.AF_NATM
```

```Go
const AF_NATM = 0x1f
```

### <a id="AF_NDRV" href="#AF_NDRV">const AF_NDRV</a>

```
searchKey: syscall.AF_NDRV
```

```Go
const AF_NDRV = 0x1b
```

### <a id="AF_NETBIOS" href="#AF_NETBIOS">const AF_NETBIOS</a>

```
searchKey: syscall.AF_NETBIOS
```

```Go
const AF_NETBIOS = 0x21
```

### <a id="AF_NS" href="#AF_NS">const AF_NS</a>

```
searchKey: syscall.AF_NS
```

```Go
const AF_NS = 0x6
```

### <a id="AF_OSI" href="#AF_OSI">const AF_OSI</a>

```
searchKey: syscall.AF_OSI
```

```Go
const AF_OSI = 0x7
```

### <a id="AF_PPP" href="#AF_PPP">const AF_PPP</a>

```
searchKey: syscall.AF_PPP
```

```Go
const AF_PPP = 0x22
```

### <a id="AF_PUP" href="#AF_PUP">const AF_PUP</a>

```
searchKey: syscall.AF_PUP
```

```Go
const AF_PUP = 0x4
```

### <a id="AF_RESERVED_36" href="#AF_RESERVED_36">const AF_RESERVED_36</a>

```
searchKey: syscall.AF_RESERVED_36
```

```Go
const AF_RESERVED_36 = 0x24
```

### <a id="AF_ROUTE" href="#AF_ROUTE">const AF_ROUTE</a>

```
searchKey: syscall.AF_ROUTE
```

```Go
const AF_ROUTE = 0x11
```

### <a id="AF_SIP" href="#AF_SIP">const AF_SIP</a>

```
searchKey: syscall.AF_SIP
```

```Go
const AF_SIP = 0x18
```

### <a id="AF_SNA" href="#AF_SNA">const AF_SNA</a>

```
searchKey: syscall.AF_SNA
```

```Go
const AF_SNA = 0xb
```

### <a id="AF_SYSTEM" href="#AF_SYSTEM">const AF_SYSTEM</a>

```
searchKey: syscall.AF_SYSTEM
```

```Go
const AF_SYSTEM = 0x20
```

### <a id="AF_UNIX" href="#AF_UNIX">const AF_UNIX</a>

```
searchKey: syscall.AF_UNIX
```

```Go
const AF_UNIX = 0x1
```

### <a id="AF_UNSPEC" href="#AF_UNSPEC">const AF_UNSPEC</a>

```
searchKey: syscall.AF_UNSPEC
```

```Go
const AF_UNSPEC = 0x0
```

### <a id="B0" href="#B0">const B0</a>

```
searchKey: syscall.B0
```

```Go
const B0 = 0x0
```

### <a id="B110" href="#B110">const B110</a>

```
searchKey: syscall.B110
```

```Go
const B110 = 0x6e
```

### <a id="B115200" href="#B115200">const B115200</a>

```
searchKey: syscall.B115200
```

```Go
const B115200 = 0x1c200
```

### <a id="B1200" href="#B1200">const B1200</a>

```
searchKey: syscall.B1200
```

```Go
const B1200 = 0x4b0
```

### <a id="B134" href="#B134">const B134</a>

```
searchKey: syscall.B134
```

```Go
const B134 = 0x86
```

### <a id="B14400" href="#B14400">const B14400</a>

```
searchKey: syscall.B14400
```

```Go
const B14400 = 0x3840
```

### <a id="B150" href="#B150">const B150</a>

```
searchKey: syscall.B150
```

```Go
const B150 = 0x96
```

### <a id="B1800" href="#B1800">const B1800</a>

```
searchKey: syscall.B1800
```

```Go
const B1800 = 0x708
```

### <a id="B19200" href="#B19200">const B19200</a>

```
searchKey: syscall.B19200
```

```Go
const B19200 = 0x4b00
```

### <a id="B200" href="#B200">const B200</a>

```
searchKey: syscall.B200
```

```Go
const B200 = 0xc8
```

### <a id="B230400" href="#B230400">const B230400</a>

```
searchKey: syscall.B230400
```

```Go
const B230400 = 0x38400
```

### <a id="B2400" href="#B2400">const B2400</a>

```
searchKey: syscall.B2400
```

```Go
const B2400 = 0x960
```

### <a id="B28800" href="#B28800">const B28800</a>

```
searchKey: syscall.B28800
```

```Go
const B28800 = 0x7080
```

### <a id="B300" href="#B300">const B300</a>

```
searchKey: syscall.B300
```

```Go
const B300 = 0x12c
```

### <a id="B38400" href="#B38400">const B38400</a>

```
searchKey: syscall.B38400
```

```Go
const B38400 = 0x9600
```

### <a id="B4800" href="#B4800">const B4800</a>

```
searchKey: syscall.B4800
```

```Go
const B4800 = 0x12c0
```

### <a id="B50" href="#B50">const B50</a>

```
searchKey: syscall.B50
```

```Go
const B50 = 0x32
```

### <a id="B57600" href="#B57600">const B57600</a>

```
searchKey: syscall.B57600
```

```Go
const B57600 = 0xe100
```

### <a id="B600" href="#B600">const B600</a>

```
searchKey: syscall.B600
```

```Go
const B600 = 0x258
```

### <a id="B7200" href="#B7200">const B7200</a>

```
searchKey: syscall.B7200
```

```Go
const B7200 = 0x1c20
```

### <a id="B75" href="#B75">const B75</a>

```
searchKey: syscall.B75
```

```Go
const B75 = 0x4b
```

### <a id="B76800" href="#B76800">const B76800</a>

```
searchKey: syscall.B76800
```

```Go
const B76800 = 0x12c00
```

### <a id="B9600" href="#B9600">const B9600</a>

```
searchKey: syscall.B9600
```

```Go
const B9600 = 0x2580
```

### <a id="BIOCFLUSH" href="#BIOCFLUSH">const BIOCFLUSH</a>

```
searchKey: syscall.BIOCFLUSH
```

```Go
const BIOCFLUSH = 0x20004268
```

### <a id="BIOCGBLEN" href="#BIOCGBLEN">const BIOCGBLEN</a>

```
searchKey: syscall.BIOCGBLEN
```

```Go
const BIOCGBLEN = 0x40044266
```

### <a id="BIOCGDLT" href="#BIOCGDLT">const BIOCGDLT</a>

```
searchKey: syscall.BIOCGDLT
```

```Go
const BIOCGDLT = 0x4004426a
```

### <a id="BIOCGDLTLIST" href="#BIOCGDLTLIST">const BIOCGDLTLIST</a>

```
searchKey: syscall.BIOCGDLTLIST
```

```Go
const BIOCGDLTLIST = 0xc00c4279
```

### <a id="BIOCGETIF" href="#BIOCGETIF">const BIOCGETIF</a>

```
searchKey: syscall.BIOCGETIF
```

```Go
const BIOCGETIF = 0x4020426b
```

### <a id="BIOCGHDRCMPLT" href="#BIOCGHDRCMPLT">const BIOCGHDRCMPLT</a>

```
searchKey: syscall.BIOCGHDRCMPLT
```

```Go
const BIOCGHDRCMPLT = 0x40044274
```

### <a id="BIOCGRSIG" href="#BIOCGRSIG">const BIOCGRSIG</a>

```
searchKey: syscall.BIOCGRSIG
```

```Go
const BIOCGRSIG = 0x40044272
```

### <a id="BIOCGRTIMEOUT" href="#BIOCGRTIMEOUT">const BIOCGRTIMEOUT</a>

```
searchKey: syscall.BIOCGRTIMEOUT
```

```Go
const BIOCGRTIMEOUT = 0x4010426e
```

### <a id="BIOCGSEESENT" href="#BIOCGSEESENT">const BIOCGSEESENT</a>

```
searchKey: syscall.BIOCGSEESENT
```

```Go
const BIOCGSEESENT = 0x40044276
```

### <a id="BIOCGSTATS" href="#BIOCGSTATS">const BIOCGSTATS</a>

```
searchKey: syscall.BIOCGSTATS
```

```Go
const BIOCGSTATS = 0x4008426f
```

### <a id="BIOCIMMEDIATE" href="#BIOCIMMEDIATE">const BIOCIMMEDIATE</a>

```
searchKey: syscall.BIOCIMMEDIATE
```

```Go
const BIOCIMMEDIATE = 0x80044270
```

### <a id="BIOCPROMISC" href="#BIOCPROMISC">const BIOCPROMISC</a>

```
searchKey: syscall.BIOCPROMISC
```

```Go
const BIOCPROMISC = 0x20004269
```

### <a id="BIOCSBLEN" href="#BIOCSBLEN">const BIOCSBLEN</a>

```
searchKey: syscall.BIOCSBLEN
```

```Go
const BIOCSBLEN = 0xc0044266
```

### <a id="BIOCSDLT" href="#BIOCSDLT">const BIOCSDLT</a>

```
searchKey: syscall.BIOCSDLT
```

```Go
const BIOCSDLT = 0x80044278
```

### <a id="BIOCSETF" href="#BIOCSETF">const BIOCSETF</a>

```
searchKey: syscall.BIOCSETF
```

```Go
const BIOCSETF = 0x80104267
```

### <a id="BIOCSETIF" href="#BIOCSETIF">const BIOCSETIF</a>

```
searchKey: syscall.BIOCSETIF
```

```Go
const BIOCSETIF = 0x8020426c
```

### <a id="BIOCSHDRCMPLT" href="#BIOCSHDRCMPLT">const BIOCSHDRCMPLT</a>

```
searchKey: syscall.BIOCSHDRCMPLT
```

```Go
const BIOCSHDRCMPLT = 0x80044275
```

### <a id="BIOCSRSIG" href="#BIOCSRSIG">const BIOCSRSIG</a>

```
searchKey: syscall.BIOCSRSIG
```

```Go
const BIOCSRSIG = 0x80044273
```

### <a id="BIOCSRTIMEOUT" href="#BIOCSRTIMEOUT">const BIOCSRTIMEOUT</a>

```
searchKey: syscall.BIOCSRTIMEOUT
```

```Go
const BIOCSRTIMEOUT = 0x8010426d
```

### <a id="BIOCSSEESENT" href="#BIOCSSEESENT">const BIOCSSEESENT</a>

```
searchKey: syscall.BIOCSSEESENT
```

```Go
const BIOCSSEESENT = 0x80044277
```

### <a id="BIOCVERSION" href="#BIOCVERSION">const BIOCVERSION</a>

```
searchKey: syscall.BIOCVERSION
```

```Go
const BIOCVERSION = 0x40044271
```

### <a id="BPF_A" href="#BPF_A">const BPF_A</a>

```
searchKey: syscall.BPF_A
```

```Go
const BPF_A = 0x10
```

### <a id="BPF_ABS" href="#BPF_ABS">const BPF_ABS</a>

```
searchKey: syscall.BPF_ABS
```

```Go
const BPF_ABS = 0x20
```

### <a id="BPF_ADD" href="#BPF_ADD">const BPF_ADD</a>

```
searchKey: syscall.BPF_ADD
```

```Go
const BPF_ADD = 0x0
```

### <a id="BPF_ALIGNMENT" href="#BPF_ALIGNMENT">const BPF_ALIGNMENT</a>

```
searchKey: syscall.BPF_ALIGNMENT
```

```Go
const BPF_ALIGNMENT = 0x4
```

### <a id="BPF_ALU" href="#BPF_ALU">const BPF_ALU</a>

```
searchKey: syscall.BPF_ALU
```

```Go
const BPF_ALU = 0x4
```

### <a id="BPF_AND" href="#BPF_AND">const BPF_AND</a>

```
searchKey: syscall.BPF_AND
```

```Go
const BPF_AND = 0x50
```

### <a id="BPF_B" href="#BPF_B">const BPF_B</a>

```
searchKey: syscall.BPF_B
```

```Go
const BPF_B = 0x10
```

### <a id="BPF_DIV" href="#BPF_DIV">const BPF_DIV</a>

```
searchKey: syscall.BPF_DIV
```

```Go
const BPF_DIV = 0x30
```

### <a id="BPF_H" href="#BPF_H">const BPF_H</a>

```
searchKey: syscall.BPF_H
```

```Go
const BPF_H = 0x8
```

### <a id="BPF_IMM" href="#BPF_IMM">const BPF_IMM</a>

```
searchKey: syscall.BPF_IMM
```

```Go
const BPF_IMM = 0x0
```

### <a id="BPF_IND" href="#BPF_IND">const BPF_IND</a>

```
searchKey: syscall.BPF_IND
```

```Go
const BPF_IND = 0x40
```

### <a id="BPF_JA" href="#BPF_JA">const BPF_JA</a>

```
searchKey: syscall.BPF_JA
```

```Go
const BPF_JA = 0x0
```

### <a id="BPF_JEQ" href="#BPF_JEQ">const BPF_JEQ</a>

```
searchKey: syscall.BPF_JEQ
```

```Go
const BPF_JEQ = 0x10
```

### <a id="BPF_JGE" href="#BPF_JGE">const BPF_JGE</a>

```
searchKey: syscall.BPF_JGE
```

```Go
const BPF_JGE = 0x30
```

### <a id="BPF_JGT" href="#BPF_JGT">const BPF_JGT</a>

```
searchKey: syscall.BPF_JGT
```

```Go
const BPF_JGT = 0x20
```

### <a id="BPF_JMP" href="#BPF_JMP">const BPF_JMP</a>

```
searchKey: syscall.BPF_JMP
```

```Go
const BPF_JMP = 0x5
```

### <a id="BPF_JSET" href="#BPF_JSET">const BPF_JSET</a>

```
searchKey: syscall.BPF_JSET
```

```Go
const BPF_JSET = 0x40
```

### <a id="BPF_K" href="#BPF_K">const BPF_K</a>

```
searchKey: syscall.BPF_K
```

```Go
const BPF_K = 0x0
```

### <a id="BPF_LD" href="#BPF_LD">const BPF_LD</a>

```
searchKey: syscall.BPF_LD
```

```Go
const BPF_LD = 0x0
```

### <a id="BPF_LDX" href="#BPF_LDX">const BPF_LDX</a>

```
searchKey: syscall.BPF_LDX
```

```Go
const BPF_LDX = 0x1
```

### <a id="BPF_LEN" href="#BPF_LEN">const BPF_LEN</a>

```
searchKey: syscall.BPF_LEN
```

```Go
const BPF_LEN = 0x80
```

### <a id="BPF_LSH" href="#BPF_LSH">const BPF_LSH</a>

```
searchKey: syscall.BPF_LSH
```

```Go
const BPF_LSH = 0x60
```

### <a id="BPF_MAJOR_VERSION" href="#BPF_MAJOR_VERSION">const BPF_MAJOR_VERSION</a>

```
searchKey: syscall.BPF_MAJOR_VERSION
```

```Go
const BPF_MAJOR_VERSION = 0x1
```

### <a id="BPF_MAXBUFSIZE" href="#BPF_MAXBUFSIZE">const BPF_MAXBUFSIZE</a>

```
searchKey: syscall.BPF_MAXBUFSIZE
```

```Go
const BPF_MAXBUFSIZE = 0x80000
```

### <a id="BPF_MAXINSNS" href="#BPF_MAXINSNS">const BPF_MAXINSNS</a>

```
searchKey: syscall.BPF_MAXINSNS
```

```Go
const BPF_MAXINSNS = 0x200
```

### <a id="BPF_MEM" href="#BPF_MEM">const BPF_MEM</a>

```
searchKey: syscall.BPF_MEM
```

```Go
const BPF_MEM = 0x60
```

### <a id="BPF_MEMWORDS" href="#BPF_MEMWORDS">const BPF_MEMWORDS</a>

```
searchKey: syscall.BPF_MEMWORDS
```

```Go
const BPF_MEMWORDS = 0x10
```

### <a id="BPF_MINBUFSIZE" href="#BPF_MINBUFSIZE">const BPF_MINBUFSIZE</a>

```
searchKey: syscall.BPF_MINBUFSIZE
```

```Go
const BPF_MINBUFSIZE = 0x20
```

### <a id="BPF_MINOR_VERSION" href="#BPF_MINOR_VERSION">const BPF_MINOR_VERSION</a>

```
searchKey: syscall.BPF_MINOR_VERSION
```

```Go
const BPF_MINOR_VERSION = 0x1
```

### <a id="BPF_MISC" href="#BPF_MISC">const BPF_MISC</a>

```
searchKey: syscall.BPF_MISC
```

```Go
const BPF_MISC = 0x7
```

### <a id="BPF_MSH" href="#BPF_MSH">const BPF_MSH</a>

```
searchKey: syscall.BPF_MSH
```

```Go
const BPF_MSH = 0xa0
```

### <a id="BPF_MUL" href="#BPF_MUL">const BPF_MUL</a>

```
searchKey: syscall.BPF_MUL
```

```Go
const BPF_MUL = 0x20
```

### <a id="BPF_NEG" href="#BPF_NEG">const BPF_NEG</a>

```
searchKey: syscall.BPF_NEG
```

```Go
const BPF_NEG = 0x80
```

### <a id="BPF_OR" href="#BPF_OR">const BPF_OR</a>

```
searchKey: syscall.BPF_OR
```

```Go
const BPF_OR = 0x40
```

### <a id="BPF_RELEASE" href="#BPF_RELEASE">const BPF_RELEASE</a>

```
searchKey: syscall.BPF_RELEASE
```

```Go
const BPF_RELEASE = 0x30bb6
```

### <a id="BPF_RET" href="#BPF_RET">const BPF_RET</a>

```
searchKey: syscall.BPF_RET
```

```Go
const BPF_RET = 0x6
```

### <a id="BPF_RSH" href="#BPF_RSH">const BPF_RSH</a>

```
searchKey: syscall.BPF_RSH
```

```Go
const BPF_RSH = 0x70
```

### <a id="BPF_ST" href="#BPF_ST">const BPF_ST</a>

```
searchKey: syscall.BPF_ST
```

```Go
const BPF_ST = 0x2
```

### <a id="BPF_STX" href="#BPF_STX">const BPF_STX</a>

```
searchKey: syscall.BPF_STX
```

```Go
const BPF_STX = 0x3
```

### <a id="BPF_SUB" href="#BPF_SUB">const BPF_SUB</a>

```
searchKey: syscall.BPF_SUB
```

```Go
const BPF_SUB = 0x10
```

### <a id="BPF_TAX" href="#BPF_TAX">const BPF_TAX</a>

```
searchKey: syscall.BPF_TAX
```

```Go
const BPF_TAX = 0x0
```

### <a id="BPF_TXA" href="#BPF_TXA">const BPF_TXA</a>

```
searchKey: syscall.BPF_TXA
```

```Go
const BPF_TXA = 0x80
```

### <a id="BPF_W" href="#BPF_W">const BPF_W</a>

```
searchKey: syscall.BPF_W
```

```Go
const BPF_W = 0x0
```

### <a id="BPF_X" href="#BPF_X">const BPF_X</a>

```
searchKey: syscall.BPF_X
```

```Go
const BPF_X = 0x8
```

### <a id="BRKINT" href="#BRKINT">const BRKINT</a>

```
searchKey: syscall.BRKINT
```

```Go
const BRKINT = 0x2
```

### <a id="CFLUSH" href="#CFLUSH">const CFLUSH</a>

```
searchKey: syscall.CFLUSH
```

```Go
const CFLUSH = 0xf
```

### <a id="CLOCAL" href="#CLOCAL">const CLOCAL</a>

```
searchKey: syscall.CLOCAL
```

```Go
const CLOCAL = 0x8000
```

### <a id="CREAD" href="#CREAD">const CREAD</a>

```
searchKey: syscall.CREAD
```

```Go
const CREAD = 0x800
```

### <a id="CS5" href="#CS5">const CS5</a>

```
searchKey: syscall.CS5
```

```Go
const CS5 = 0x0
```

### <a id="CS6" href="#CS6">const CS6</a>

```
searchKey: syscall.CS6
```

```Go
const CS6 = 0x100
```

### <a id="CS7" href="#CS7">const CS7</a>

```
searchKey: syscall.CS7
```

```Go
const CS7 = 0x200
```

### <a id="CS8" href="#CS8">const CS8</a>

```
searchKey: syscall.CS8
```

```Go
const CS8 = 0x300
```

### <a id="CSIZE" href="#CSIZE">const CSIZE</a>

```
searchKey: syscall.CSIZE
```

```Go
const CSIZE = 0x300
```

### <a id="CSTART" href="#CSTART">const CSTART</a>

```
searchKey: syscall.CSTART
```

```Go
const CSTART = 0x11
```

### <a id="CSTATUS" href="#CSTATUS">const CSTATUS</a>

```
searchKey: syscall.CSTATUS
```

```Go
const CSTATUS = 0x14
```

### <a id="CSTOP" href="#CSTOP">const CSTOP</a>

```
searchKey: syscall.CSTOP
```

```Go
const CSTOP = 0x13
```

### <a id="CSTOPB" href="#CSTOPB">const CSTOPB</a>

```
searchKey: syscall.CSTOPB
```

```Go
const CSTOPB = 0x400
```

### <a id="CSUSP" href="#CSUSP">const CSUSP</a>

```
searchKey: syscall.CSUSP
```

```Go
const CSUSP = 0x1a
```

### <a id="CTL_MAXNAME" href="#CTL_MAXNAME">const CTL_MAXNAME</a>

```
searchKey: syscall.CTL_MAXNAME
```

```Go
const CTL_MAXNAME = 0xc
```

### <a id="CTL_NET" href="#CTL_NET">const CTL_NET</a>

```
searchKey: syscall.CTL_NET
```

```Go
const CTL_NET = 0x4
```

### <a id="DLT_APPLE_IP_OVER_IEEE1394" href="#DLT_APPLE_IP_OVER_IEEE1394">const DLT_APPLE_IP_OVER_IEEE1394</a>

```
searchKey: syscall.DLT_APPLE_IP_OVER_IEEE1394
```

```Go
const DLT_APPLE_IP_OVER_IEEE1394 = 0x8a
```

### <a id="DLT_ARCNET" href="#DLT_ARCNET">const DLT_ARCNET</a>

```
searchKey: syscall.DLT_ARCNET
```

```Go
const DLT_ARCNET = 0x7
```

### <a id="DLT_ATM_CLIP" href="#DLT_ATM_CLIP">const DLT_ATM_CLIP</a>

```
searchKey: syscall.DLT_ATM_CLIP
```

```Go
const DLT_ATM_CLIP = 0x13
```

### <a id="DLT_ATM_RFC1483" href="#DLT_ATM_RFC1483">const DLT_ATM_RFC1483</a>

```
searchKey: syscall.DLT_ATM_RFC1483
```

```Go
const DLT_ATM_RFC1483 = 0xb
```

### <a id="DLT_AX25" href="#DLT_AX25">const DLT_AX25</a>

```
searchKey: syscall.DLT_AX25
```

```Go
const DLT_AX25 = 0x3
```

### <a id="DLT_CHAOS" href="#DLT_CHAOS">const DLT_CHAOS</a>

```
searchKey: syscall.DLT_CHAOS
```

```Go
const DLT_CHAOS = 0x5
```

### <a id="DLT_CHDLC" href="#DLT_CHDLC">const DLT_CHDLC</a>

```
searchKey: syscall.DLT_CHDLC
```

```Go
const DLT_CHDLC = 0x68
```

### <a id="DLT_C_HDLC" href="#DLT_C_HDLC">const DLT_C_HDLC</a>

```
searchKey: syscall.DLT_C_HDLC
```

```Go
const DLT_C_HDLC = 0x68
```

### <a id="DLT_EN10MB" href="#DLT_EN10MB">const DLT_EN10MB</a>

```
searchKey: syscall.DLT_EN10MB
```

```Go
const DLT_EN10MB = 0x1
```

### <a id="DLT_EN3MB" href="#DLT_EN3MB">const DLT_EN3MB</a>

```
searchKey: syscall.DLT_EN3MB
```

```Go
const DLT_EN3MB = 0x2
```

### <a id="DLT_FDDI" href="#DLT_FDDI">const DLT_FDDI</a>

```
searchKey: syscall.DLT_FDDI
```

```Go
const DLT_FDDI = 0xa
```

### <a id="DLT_IEEE802" href="#DLT_IEEE802">const DLT_IEEE802</a>

```
searchKey: syscall.DLT_IEEE802
```

```Go
const DLT_IEEE802 = 0x6
```

### <a id="DLT_IEEE802_11" href="#DLT_IEEE802_11">const DLT_IEEE802_11</a>

```
searchKey: syscall.DLT_IEEE802_11
```

```Go
const DLT_IEEE802_11 = 0x69
```

### <a id="DLT_IEEE802_11_RADIO" href="#DLT_IEEE802_11_RADIO">const DLT_IEEE802_11_RADIO</a>

```
searchKey: syscall.DLT_IEEE802_11_RADIO
```

```Go
const DLT_IEEE802_11_RADIO = 0x7f
```

### <a id="DLT_IEEE802_11_RADIO_AVS" href="#DLT_IEEE802_11_RADIO_AVS">const DLT_IEEE802_11_RADIO_AVS</a>

```
searchKey: syscall.DLT_IEEE802_11_RADIO_AVS
```

```Go
const DLT_IEEE802_11_RADIO_AVS = 0xa3
```

### <a id="DLT_LINUX_SLL" href="#DLT_LINUX_SLL">const DLT_LINUX_SLL</a>

```
searchKey: syscall.DLT_LINUX_SLL
```

```Go
const DLT_LINUX_SLL = 0x71
```

### <a id="DLT_LOOP" href="#DLT_LOOP">const DLT_LOOP</a>

```
searchKey: syscall.DLT_LOOP
```

```Go
const DLT_LOOP = 0x6c
```

### <a id="DLT_NULL" href="#DLT_NULL">const DLT_NULL</a>

```
searchKey: syscall.DLT_NULL
```

```Go
const DLT_NULL = 0x0
```

### <a id="DLT_PFLOG" href="#DLT_PFLOG">const DLT_PFLOG</a>

```
searchKey: syscall.DLT_PFLOG
```

```Go
const DLT_PFLOG = 0x75
```

### <a id="DLT_PFSYNC" href="#DLT_PFSYNC">const DLT_PFSYNC</a>

```
searchKey: syscall.DLT_PFSYNC
```

```Go
const DLT_PFSYNC = 0x12
```

### <a id="DLT_PPP" href="#DLT_PPP">const DLT_PPP</a>

```
searchKey: syscall.DLT_PPP
```

```Go
const DLT_PPP = 0x9
```

### <a id="DLT_PPP_BSDOS" href="#DLT_PPP_BSDOS">const DLT_PPP_BSDOS</a>

```
searchKey: syscall.DLT_PPP_BSDOS
```

```Go
const DLT_PPP_BSDOS = 0x10
```

### <a id="DLT_PPP_SERIAL" href="#DLT_PPP_SERIAL">const DLT_PPP_SERIAL</a>

```
searchKey: syscall.DLT_PPP_SERIAL
```

```Go
const DLT_PPP_SERIAL = 0x32
```

### <a id="DLT_PRONET" href="#DLT_PRONET">const DLT_PRONET</a>

```
searchKey: syscall.DLT_PRONET
```

```Go
const DLT_PRONET = 0x4
```

### <a id="DLT_RAW" href="#DLT_RAW">const DLT_RAW</a>

```
searchKey: syscall.DLT_RAW
```

```Go
const DLT_RAW = 0xc
```

### <a id="DLT_SLIP" href="#DLT_SLIP">const DLT_SLIP</a>

```
searchKey: syscall.DLT_SLIP
```

```Go
const DLT_SLIP = 0x8
```

### <a id="DLT_SLIP_BSDOS" href="#DLT_SLIP_BSDOS">const DLT_SLIP_BSDOS</a>

```
searchKey: syscall.DLT_SLIP_BSDOS
```

```Go
const DLT_SLIP_BSDOS = 0xf
```

### <a id="DT_BLK" href="#DT_BLK">const DT_BLK</a>

```
searchKey: syscall.DT_BLK
```

```Go
const DT_BLK = 0x6
```

### <a id="DT_CHR" href="#DT_CHR">const DT_CHR</a>

```
searchKey: syscall.DT_CHR
```

```Go
const DT_CHR = 0x2
```

### <a id="DT_DIR" href="#DT_DIR">const DT_DIR</a>

```
searchKey: syscall.DT_DIR
```

```Go
const DT_DIR = 0x4
```

### <a id="DT_FIFO" href="#DT_FIFO">const DT_FIFO</a>

```
searchKey: syscall.DT_FIFO
```

```Go
const DT_FIFO = 0x1
```

### <a id="DT_LNK" href="#DT_LNK">const DT_LNK</a>

```
searchKey: syscall.DT_LNK
```

```Go
const DT_LNK = 0xa
```

### <a id="DT_REG" href="#DT_REG">const DT_REG</a>

```
searchKey: syscall.DT_REG
```

```Go
const DT_REG = 0x8
```

### <a id="DT_SOCK" href="#DT_SOCK">const DT_SOCK</a>

```
searchKey: syscall.DT_SOCK
```

```Go
const DT_SOCK = 0xc
```

### <a id="DT_UNKNOWN" href="#DT_UNKNOWN">const DT_UNKNOWN</a>

```
searchKey: syscall.DT_UNKNOWN
```

```Go
const DT_UNKNOWN = 0x0
```

### <a id="DT_WHT" href="#DT_WHT">const DT_WHT</a>

```
searchKey: syscall.DT_WHT
```

```Go
const DT_WHT = 0xe
```

### <a id="ECHO" href="#ECHO">const ECHO</a>

```
searchKey: syscall.ECHO
```

```Go
const ECHO = 0x8
```

### <a id="ECHOCTL" href="#ECHOCTL">const ECHOCTL</a>

```
searchKey: syscall.ECHOCTL
```

```Go
const ECHOCTL = 0x40
```

### <a id="ECHOE" href="#ECHOE">const ECHOE</a>

```
searchKey: syscall.ECHOE
```

```Go
const ECHOE = 0x2
```

### <a id="ECHOK" href="#ECHOK">const ECHOK</a>

```
searchKey: syscall.ECHOK
```

```Go
const ECHOK = 0x4
```

### <a id="ECHOKE" href="#ECHOKE">const ECHOKE</a>

```
searchKey: syscall.ECHOKE
```

```Go
const ECHOKE = 0x1
```

### <a id="ECHONL" href="#ECHONL">const ECHONL</a>

```
searchKey: syscall.ECHONL
```

```Go
const ECHONL = 0x10
```

### <a id="ECHOPRT" href="#ECHOPRT">const ECHOPRT</a>

```
searchKey: syscall.ECHOPRT
```

```Go
const ECHOPRT = 0x20
```

### <a id="EVFILT_AIO" href="#EVFILT_AIO">const EVFILT_AIO</a>

```
searchKey: syscall.EVFILT_AIO
```

```Go
const EVFILT_AIO = -0x3
```

### <a id="EVFILT_FS" href="#EVFILT_FS">const EVFILT_FS</a>

```
searchKey: syscall.EVFILT_FS
```

```Go
const EVFILT_FS = -0x9
```

### <a id="EVFILT_MACHPORT" href="#EVFILT_MACHPORT">const EVFILT_MACHPORT</a>

```
searchKey: syscall.EVFILT_MACHPORT
```

```Go
const EVFILT_MACHPORT = -0x8
```

### <a id="EVFILT_PROC" href="#EVFILT_PROC">const EVFILT_PROC</a>

```
searchKey: syscall.EVFILT_PROC
```

```Go
const EVFILT_PROC = -0x5
```

### <a id="EVFILT_READ" href="#EVFILT_READ">const EVFILT_READ</a>

```
searchKey: syscall.EVFILT_READ
```

```Go
const EVFILT_READ = -0x1
```

### <a id="EVFILT_SIGNAL" href="#EVFILT_SIGNAL">const EVFILT_SIGNAL</a>

```
searchKey: syscall.EVFILT_SIGNAL
```

```Go
const EVFILT_SIGNAL = -0x6
```

### <a id="EVFILT_SYSCOUNT" href="#EVFILT_SYSCOUNT">const EVFILT_SYSCOUNT</a>

```
searchKey: syscall.EVFILT_SYSCOUNT
```

```Go
const EVFILT_SYSCOUNT = 0xc
```

### <a id="EVFILT_THREADMARKER" href="#EVFILT_THREADMARKER">const EVFILT_THREADMARKER</a>

```
searchKey: syscall.EVFILT_THREADMARKER
```

```Go
const EVFILT_THREADMARKER = 0xc
```

### <a id="EVFILT_TIMER" href="#EVFILT_TIMER">const EVFILT_TIMER</a>

```
searchKey: syscall.EVFILT_TIMER
```

```Go
const EVFILT_TIMER = -0x7
```

### <a id="EVFILT_USER" href="#EVFILT_USER">const EVFILT_USER</a>

```
searchKey: syscall.EVFILT_USER
```

```Go
const EVFILT_USER = -0xa
```

### <a id="EVFILT_VM" href="#EVFILT_VM">const EVFILT_VM</a>

```
searchKey: syscall.EVFILT_VM
```

```Go
const EVFILT_VM = -0xc
```

### <a id="EVFILT_VNODE" href="#EVFILT_VNODE">const EVFILT_VNODE</a>

```
searchKey: syscall.EVFILT_VNODE
```

```Go
const EVFILT_VNODE = -0x4
```

### <a id="EVFILT_WRITE" href="#EVFILT_WRITE">const EVFILT_WRITE</a>

```
searchKey: syscall.EVFILT_WRITE
```

```Go
const EVFILT_WRITE = -0x2
```

### <a id="EV_ADD" href="#EV_ADD">const EV_ADD</a>

```
searchKey: syscall.EV_ADD
```

```Go
const EV_ADD = 0x1
```

### <a id="EV_CLEAR" href="#EV_CLEAR">const EV_CLEAR</a>

```
searchKey: syscall.EV_CLEAR
```

```Go
const EV_CLEAR = 0x20
```

### <a id="EV_DELETE" href="#EV_DELETE">const EV_DELETE</a>

```
searchKey: syscall.EV_DELETE
```

```Go
const EV_DELETE = 0x2
```

### <a id="EV_DISABLE" href="#EV_DISABLE">const EV_DISABLE</a>

```
searchKey: syscall.EV_DISABLE
```

```Go
const EV_DISABLE = 0x8
```

### <a id="EV_DISPATCH" href="#EV_DISPATCH">const EV_DISPATCH</a>

```
searchKey: syscall.EV_DISPATCH
```

```Go
const EV_DISPATCH = 0x80
```

### <a id="EV_ENABLE" href="#EV_ENABLE">const EV_ENABLE</a>

```
searchKey: syscall.EV_ENABLE
```

```Go
const EV_ENABLE = 0x4
```

### <a id="EV_EOF" href="#EV_EOF">const EV_EOF</a>

```
searchKey: syscall.EV_EOF
```

```Go
const EV_EOF = 0x8000
```

### <a id="EV_ERROR" href="#EV_ERROR">const EV_ERROR</a>

```
searchKey: syscall.EV_ERROR
```

```Go
const EV_ERROR = 0x4000
```

### <a id="EV_FLAG0" href="#EV_FLAG0">const EV_FLAG0</a>

```
searchKey: syscall.EV_FLAG0
```

```Go
const EV_FLAG0 = 0x1000
```

### <a id="EV_FLAG1" href="#EV_FLAG1">const EV_FLAG1</a>

```
searchKey: syscall.EV_FLAG1
```

```Go
const EV_FLAG1 = 0x2000
```

### <a id="EV_ONESHOT" href="#EV_ONESHOT">const EV_ONESHOT</a>

```
searchKey: syscall.EV_ONESHOT
```

```Go
const EV_ONESHOT = 0x10
```

### <a id="EV_OOBAND" href="#EV_OOBAND">const EV_OOBAND</a>

```
searchKey: syscall.EV_OOBAND
```

```Go
const EV_OOBAND = 0x2000
```

### <a id="EV_POLL" href="#EV_POLL">const EV_POLL</a>

```
searchKey: syscall.EV_POLL
```

```Go
const EV_POLL = 0x1000
```

### <a id="EV_RECEIPT" href="#EV_RECEIPT">const EV_RECEIPT</a>

```
searchKey: syscall.EV_RECEIPT
```

```Go
const EV_RECEIPT = 0x40
```

### <a id="EV_SYSFLAGS" href="#EV_SYSFLAGS">const EV_SYSFLAGS</a>

```
searchKey: syscall.EV_SYSFLAGS
```

```Go
const EV_SYSFLAGS = 0xf000
```

### <a id="EXTA" href="#EXTA">const EXTA</a>

```
searchKey: syscall.EXTA
```

```Go
const EXTA = 0x4b00
```

### <a id="EXTB" href="#EXTB">const EXTB</a>

```
searchKey: syscall.EXTB
```

```Go
const EXTB = 0x9600
```

### <a id="EXTPROC" href="#EXTPROC">const EXTPROC</a>

```
searchKey: syscall.EXTPROC
```

```Go
const EXTPROC = 0x800
```

### <a id="FD_CLOEXEC" href="#FD_CLOEXEC">const FD_CLOEXEC</a>

```
searchKey: syscall.FD_CLOEXEC
```

```Go
const FD_CLOEXEC = 0x1
```

### <a id="FD_SETSIZE" href="#FD_SETSIZE">const FD_SETSIZE</a>

```
searchKey: syscall.FD_SETSIZE
```

```Go
const FD_SETSIZE = 0x400
```

### <a id="FLUSHO" href="#FLUSHO">const FLUSHO</a>

```
searchKey: syscall.FLUSHO
```

```Go
const FLUSHO = 0x800000
```

### <a id="F_ADDFILESIGS" href="#F_ADDFILESIGS">const F_ADDFILESIGS</a>

```
searchKey: syscall.F_ADDFILESIGS
```

```Go
const F_ADDFILESIGS = 0x3d
```

### <a id="F_ADDSIGS" href="#F_ADDSIGS">const F_ADDSIGS</a>

```
searchKey: syscall.F_ADDSIGS
```

```Go
const F_ADDSIGS = 0x3b
```

### <a id="F_ALLOCATEALL" href="#F_ALLOCATEALL">const F_ALLOCATEALL</a>

```
searchKey: syscall.F_ALLOCATEALL
```

```Go
const F_ALLOCATEALL = 0x4
```

### <a id="F_ALLOCATECONTIG" href="#F_ALLOCATECONTIG">const F_ALLOCATECONTIG</a>

```
searchKey: syscall.F_ALLOCATECONTIG
```

```Go
const F_ALLOCATECONTIG = 0x2
```

### <a id="F_CHKCLEAN" href="#F_CHKCLEAN">const F_CHKCLEAN</a>

```
searchKey: syscall.F_CHKCLEAN
```

```Go
const F_CHKCLEAN = 0x29
```

### <a id="F_DUPFD" href="#F_DUPFD">const F_DUPFD</a>

```
searchKey: syscall.F_DUPFD
```

```Go
const F_DUPFD = 0x0
```

### <a id="F_DUPFD_CLOEXEC" href="#F_DUPFD_CLOEXEC">const F_DUPFD_CLOEXEC</a>

```
searchKey: syscall.F_DUPFD_CLOEXEC
```

```Go
const F_DUPFD_CLOEXEC = 0x43
```

### <a id="F_FLUSH_DATA" href="#F_FLUSH_DATA">const F_FLUSH_DATA</a>

```
searchKey: syscall.F_FLUSH_DATA
```

```Go
const F_FLUSH_DATA = 0x28
```

### <a id="F_FREEZE_FS" href="#F_FREEZE_FS">const F_FREEZE_FS</a>

```
searchKey: syscall.F_FREEZE_FS
```

```Go
const F_FREEZE_FS = 0x35
```

### <a id="F_FULLFSYNC" href="#F_FULLFSYNC">const F_FULLFSYNC</a>

```
searchKey: syscall.F_FULLFSYNC
```

```Go
const F_FULLFSYNC = 0x33
```

### <a id="F_GETFD" href="#F_GETFD">const F_GETFD</a>

```
searchKey: syscall.F_GETFD
```

```Go
const F_GETFD = 0x1
```

### <a id="F_GETFL" href="#F_GETFL">const F_GETFL</a>

```
searchKey: syscall.F_GETFL
```

```Go
const F_GETFL = 0x3
```

### <a id="F_GETLK" href="#F_GETLK">const F_GETLK</a>

```
searchKey: syscall.F_GETLK
```

```Go
const F_GETLK = 0x7
```

### <a id="F_GETLKPID" href="#F_GETLKPID">const F_GETLKPID</a>

```
searchKey: syscall.F_GETLKPID
```

```Go
const F_GETLKPID = 0x42
```

### <a id="F_GETNOSIGPIPE" href="#F_GETNOSIGPIPE">const F_GETNOSIGPIPE</a>

```
searchKey: syscall.F_GETNOSIGPIPE
```

```Go
const F_GETNOSIGPIPE = 0x4a
```

### <a id="F_GETOWN" href="#F_GETOWN">const F_GETOWN</a>

```
searchKey: syscall.F_GETOWN
```

```Go
const F_GETOWN = 0x5
```

### <a id="F_GETPATH" href="#F_GETPATH">const F_GETPATH</a>

```
searchKey: syscall.F_GETPATH
```

```Go
const F_GETPATH = 0x32
```

### <a id="F_GETPATH_MTMINFO" href="#F_GETPATH_MTMINFO">const F_GETPATH_MTMINFO</a>

```
searchKey: syscall.F_GETPATH_MTMINFO
```

```Go
const F_GETPATH_MTMINFO = 0x47
```

### <a id="F_GETPROTECTIONCLASS" href="#F_GETPROTECTIONCLASS">const F_GETPROTECTIONCLASS</a>

```
searchKey: syscall.F_GETPROTECTIONCLASS
```

```Go
const F_GETPROTECTIONCLASS = 0x3f
```

### <a id="F_GLOBAL_NOCACHE" href="#F_GLOBAL_NOCACHE">const F_GLOBAL_NOCACHE</a>

```
searchKey: syscall.F_GLOBAL_NOCACHE
```

```Go
const F_GLOBAL_NOCACHE = 0x37
```

### <a id="F_LOG2PHYS" href="#F_LOG2PHYS">const F_LOG2PHYS</a>

```
searchKey: syscall.F_LOG2PHYS
```

```Go
const F_LOG2PHYS = 0x31
```

### <a id="F_LOG2PHYS_EXT" href="#F_LOG2PHYS_EXT">const F_LOG2PHYS_EXT</a>

```
searchKey: syscall.F_LOG2PHYS_EXT
```

```Go
const F_LOG2PHYS_EXT = 0x41
```

### <a id="F_MARKDEPENDENCY" href="#F_MARKDEPENDENCY">const F_MARKDEPENDENCY</a>

```
searchKey: syscall.F_MARKDEPENDENCY
```

```Go
const F_MARKDEPENDENCY = 0x3c
```

### <a id="F_NOCACHE" href="#F_NOCACHE">const F_NOCACHE</a>

```
searchKey: syscall.F_NOCACHE
```

```Go
const F_NOCACHE = 0x30
```

### <a id="F_NODIRECT" href="#F_NODIRECT">const F_NODIRECT</a>

```
searchKey: syscall.F_NODIRECT
```

```Go
const F_NODIRECT = 0x3e
```

### <a id="F_OK" href="#F_OK">const F_OK</a>

```
searchKey: syscall.F_OK
```

```Go
const F_OK = 0x0
```

### <a id="F_PATHPKG_CHECK" href="#F_PATHPKG_CHECK">const F_PATHPKG_CHECK</a>

```
searchKey: syscall.F_PATHPKG_CHECK
```

```Go
const F_PATHPKG_CHECK = 0x34
```

### <a id="F_PEOFPOSMODE" href="#F_PEOFPOSMODE">const F_PEOFPOSMODE</a>

```
searchKey: syscall.F_PEOFPOSMODE
```

```Go
const F_PEOFPOSMODE = 0x3
```

### <a id="F_PREALLOCATE" href="#F_PREALLOCATE">const F_PREALLOCATE</a>

```
searchKey: syscall.F_PREALLOCATE
```

```Go
const F_PREALLOCATE = 0x2a
```

### <a id="F_RDADVISE" href="#F_RDADVISE">const F_RDADVISE</a>

```
searchKey: syscall.F_RDADVISE
```

```Go
const F_RDADVISE = 0x2c
```

### <a id="F_RDAHEAD" href="#F_RDAHEAD">const F_RDAHEAD</a>

```
searchKey: syscall.F_RDAHEAD
```

```Go
const F_RDAHEAD = 0x2d
```

### <a id="F_RDLCK" href="#F_RDLCK">const F_RDLCK</a>

```
searchKey: syscall.F_RDLCK
```

```Go
const F_RDLCK = 0x1
```

### <a id="F_READBOOTSTRAP" href="#F_READBOOTSTRAP">const F_READBOOTSTRAP</a>

```
searchKey: syscall.F_READBOOTSTRAP
```

```Go
const F_READBOOTSTRAP = 0x2e
```

### <a id="F_SETBACKINGSTORE" href="#F_SETBACKINGSTORE">const F_SETBACKINGSTORE</a>

```
searchKey: syscall.F_SETBACKINGSTORE
```

```Go
const F_SETBACKINGSTORE = 0x46
```

### <a id="F_SETFD" href="#F_SETFD">const F_SETFD</a>

```
searchKey: syscall.F_SETFD
```

```Go
const F_SETFD = 0x2
```

### <a id="F_SETFL" href="#F_SETFL">const F_SETFL</a>

```
searchKey: syscall.F_SETFL
```

```Go
const F_SETFL = 0x4
```

### <a id="F_SETLK" href="#F_SETLK">const F_SETLK</a>

```
searchKey: syscall.F_SETLK
```

```Go
const F_SETLK = 0x8
```

### <a id="F_SETLKW" href="#F_SETLKW">const F_SETLKW</a>

```
searchKey: syscall.F_SETLKW
```

```Go
const F_SETLKW = 0x9
```

### <a id="F_SETNOSIGPIPE" href="#F_SETNOSIGPIPE">const F_SETNOSIGPIPE</a>

```
searchKey: syscall.F_SETNOSIGPIPE
```

```Go
const F_SETNOSIGPIPE = 0x49
```

### <a id="F_SETOWN" href="#F_SETOWN">const F_SETOWN</a>

```
searchKey: syscall.F_SETOWN
```

```Go
const F_SETOWN = 0x6
```

### <a id="F_SETPROTECTIONCLASS" href="#F_SETPROTECTIONCLASS">const F_SETPROTECTIONCLASS</a>

```
searchKey: syscall.F_SETPROTECTIONCLASS
```

```Go
const F_SETPROTECTIONCLASS = 0x40
```

### <a id="F_SETSIZE" href="#F_SETSIZE">const F_SETSIZE</a>

```
searchKey: syscall.F_SETSIZE
```

```Go
const F_SETSIZE = 0x2b
```

### <a id="F_THAW_FS" href="#F_THAW_FS">const F_THAW_FS</a>

```
searchKey: syscall.F_THAW_FS
```

```Go
const F_THAW_FS = 0x36
```

### <a id="F_UNLCK" href="#F_UNLCK">const F_UNLCK</a>

```
searchKey: syscall.F_UNLCK
```

```Go
const F_UNLCK = 0x2
```

### <a id="F_VOLPOSMODE" href="#F_VOLPOSMODE">const F_VOLPOSMODE</a>

```
searchKey: syscall.F_VOLPOSMODE
```

```Go
const F_VOLPOSMODE = 0x4
```

### <a id="F_WRITEBOOTSTRAP" href="#F_WRITEBOOTSTRAP">const F_WRITEBOOTSTRAP</a>

```
searchKey: syscall.F_WRITEBOOTSTRAP
```

```Go
const F_WRITEBOOTSTRAP = 0x2f
```

### <a id="F_WRLCK" href="#F_WRLCK">const F_WRLCK</a>

```
searchKey: syscall.F_WRLCK
```

```Go
const F_WRLCK = 0x3
```

### <a id="HUPCL" href="#HUPCL">const HUPCL</a>

```
searchKey: syscall.HUPCL
```

```Go
const HUPCL = 0x4000
```

### <a id="ICANON" href="#ICANON">const ICANON</a>

```
searchKey: syscall.ICANON
```

```Go
const ICANON = 0x100
```

### <a id="ICMP6_FILTER" href="#ICMP6_FILTER">const ICMP6_FILTER</a>

```
searchKey: syscall.ICMP6_FILTER
```

```Go
const ICMP6_FILTER = 0x12
```

### <a id="ICRNL" href="#ICRNL">const ICRNL</a>

```
searchKey: syscall.ICRNL
```

```Go
const ICRNL = 0x100
```

### <a id="IEXTEN" href="#IEXTEN">const IEXTEN</a>

```
searchKey: syscall.IEXTEN
```

```Go
const IEXTEN = 0x400
```

### <a id="IFF_ALLMULTI" href="#IFF_ALLMULTI">const IFF_ALLMULTI</a>

```
searchKey: syscall.IFF_ALLMULTI
```

```Go
const IFF_ALLMULTI = 0x200
```

### <a id="IFF_ALTPHYS" href="#IFF_ALTPHYS">const IFF_ALTPHYS</a>

```
searchKey: syscall.IFF_ALTPHYS
```

```Go
const IFF_ALTPHYS = 0x4000
```

### <a id="IFF_BROADCAST" href="#IFF_BROADCAST">const IFF_BROADCAST</a>

```
searchKey: syscall.IFF_BROADCAST
```

```Go
const IFF_BROADCAST = 0x2
```

### <a id="IFF_DEBUG" href="#IFF_DEBUG">const IFF_DEBUG</a>

```
searchKey: syscall.IFF_DEBUG
```

```Go
const IFF_DEBUG = 0x4
```

### <a id="IFF_LINK0" href="#IFF_LINK0">const IFF_LINK0</a>

```
searchKey: syscall.IFF_LINK0
```

```Go
const IFF_LINK0 = 0x1000
```

### <a id="IFF_LINK1" href="#IFF_LINK1">const IFF_LINK1</a>

```
searchKey: syscall.IFF_LINK1
```

```Go
const IFF_LINK1 = 0x2000
```

### <a id="IFF_LINK2" href="#IFF_LINK2">const IFF_LINK2</a>

```
searchKey: syscall.IFF_LINK2
```

```Go
const IFF_LINK2 = 0x4000
```

### <a id="IFF_LOOPBACK" href="#IFF_LOOPBACK">const IFF_LOOPBACK</a>

```
searchKey: syscall.IFF_LOOPBACK
```

```Go
const IFF_LOOPBACK = 0x8
```

### <a id="IFF_MULTICAST" href="#IFF_MULTICAST">const IFF_MULTICAST</a>

```
searchKey: syscall.IFF_MULTICAST
```

```Go
const IFF_MULTICAST = 0x8000
```

### <a id="IFF_NOARP" href="#IFF_NOARP">const IFF_NOARP</a>

```
searchKey: syscall.IFF_NOARP
```

```Go
const IFF_NOARP = 0x80
```

### <a id="IFF_NOTRAILERS" href="#IFF_NOTRAILERS">const IFF_NOTRAILERS</a>

```
searchKey: syscall.IFF_NOTRAILERS
```

```Go
const IFF_NOTRAILERS = 0x20
```

### <a id="IFF_OACTIVE" href="#IFF_OACTIVE">const IFF_OACTIVE</a>

```
searchKey: syscall.IFF_OACTIVE
```

```Go
const IFF_OACTIVE = 0x400
```

### <a id="IFF_POINTOPOINT" href="#IFF_POINTOPOINT">const IFF_POINTOPOINT</a>

```
searchKey: syscall.IFF_POINTOPOINT
```

```Go
const IFF_POINTOPOINT = 0x10
```

### <a id="IFF_PROMISC" href="#IFF_PROMISC">const IFF_PROMISC</a>

```
searchKey: syscall.IFF_PROMISC
```

```Go
const IFF_PROMISC = 0x100
```

### <a id="IFF_RUNNING" href="#IFF_RUNNING">const IFF_RUNNING</a>

```
searchKey: syscall.IFF_RUNNING
```

```Go
const IFF_RUNNING = 0x40
```

### <a id="IFF_SIMPLEX" href="#IFF_SIMPLEX">const IFF_SIMPLEX</a>

```
searchKey: syscall.IFF_SIMPLEX
```

```Go
const IFF_SIMPLEX = 0x800
```

### <a id="IFF_UP" href="#IFF_UP">const IFF_UP</a>

```
searchKey: syscall.IFF_UP
```

```Go
const IFF_UP = 0x1
```

### <a id="IFNAMSIZ" href="#IFNAMSIZ">const IFNAMSIZ</a>

```
searchKey: syscall.IFNAMSIZ
```

```Go
const IFNAMSIZ = 0x10
```

### <a id="IFT_1822" href="#IFT_1822">const IFT_1822</a>

```
searchKey: syscall.IFT_1822
```

```Go
const IFT_1822 = 0x2
```

### <a id="IFT_AAL5" href="#IFT_AAL5">const IFT_AAL5</a>

```
searchKey: syscall.IFT_AAL5
```

```Go
const IFT_AAL5 = 0x31
```

### <a id="IFT_ARCNET" href="#IFT_ARCNET">const IFT_ARCNET</a>

```
searchKey: syscall.IFT_ARCNET
```

```Go
const IFT_ARCNET = 0x23
```

### <a id="IFT_ARCNETPLUS" href="#IFT_ARCNETPLUS">const IFT_ARCNETPLUS</a>

```
searchKey: syscall.IFT_ARCNETPLUS
```

```Go
const IFT_ARCNETPLUS = 0x24
```

### <a id="IFT_ATM" href="#IFT_ATM">const IFT_ATM</a>

```
searchKey: syscall.IFT_ATM
```

```Go
const IFT_ATM = 0x25
```

### <a id="IFT_BRIDGE" href="#IFT_BRIDGE">const IFT_BRIDGE</a>

```
searchKey: syscall.IFT_BRIDGE
```

```Go
const IFT_BRIDGE = 0xd1
```

### <a id="IFT_CARP" href="#IFT_CARP">const IFT_CARP</a>

```
searchKey: syscall.IFT_CARP
```

```Go
const IFT_CARP = 0xf8
```

### <a id="IFT_CELLULAR" href="#IFT_CELLULAR">const IFT_CELLULAR</a>

```
searchKey: syscall.IFT_CELLULAR
```

```Go
const IFT_CELLULAR = 0xff
```

### <a id="IFT_CEPT" href="#IFT_CEPT">const IFT_CEPT</a>

```
searchKey: syscall.IFT_CEPT
```

```Go
const IFT_CEPT = 0x13
```

### <a id="IFT_DS3" href="#IFT_DS3">const IFT_DS3</a>

```
searchKey: syscall.IFT_DS3
```

```Go
const IFT_DS3 = 0x1e
```

### <a id="IFT_ENC" href="#IFT_ENC">const IFT_ENC</a>

```
searchKey: syscall.IFT_ENC
```

```Go
const IFT_ENC = 0xf4
```

### <a id="IFT_EON" href="#IFT_EON">const IFT_EON</a>

```
searchKey: syscall.IFT_EON
```

```Go
const IFT_EON = 0x19
```

### <a id="IFT_ETHER" href="#IFT_ETHER">const IFT_ETHER</a>

```
searchKey: syscall.IFT_ETHER
```

```Go
const IFT_ETHER = 0x6
```

### <a id="IFT_FAITH" href="#IFT_FAITH">const IFT_FAITH</a>

```
searchKey: syscall.IFT_FAITH
```

```Go
const IFT_FAITH = 0x38
```

### <a id="IFT_FDDI" href="#IFT_FDDI">const IFT_FDDI</a>

```
searchKey: syscall.IFT_FDDI
```

```Go
const IFT_FDDI = 0xf
```

### <a id="IFT_FRELAY" href="#IFT_FRELAY">const IFT_FRELAY</a>

```
searchKey: syscall.IFT_FRELAY
```

```Go
const IFT_FRELAY = 0x20
```

### <a id="IFT_FRELAYDCE" href="#IFT_FRELAYDCE">const IFT_FRELAYDCE</a>

```
searchKey: syscall.IFT_FRELAYDCE
```

```Go
const IFT_FRELAYDCE = 0x2c
```

### <a id="IFT_GIF" href="#IFT_GIF">const IFT_GIF</a>

```
searchKey: syscall.IFT_GIF
```

```Go
const IFT_GIF = 0x37
```

### <a id="IFT_HDH1822" href="#IFT_HDH1822">const IFT_HDH1822</a>

```
searchKey: syscall.IFT_HDH1822
```

```Go
const IFT_HDH1822 = 0x3
```

### <a id="IFT_HIPPI" href="#IFT_HIPPI">const IFT_HIPPI</a>

```
searchKey: syscall.IFT_HIPPI
```

```Go
const IFT_HIPPI = 0x2f
```

### <a id="IFT_HSSI" href="#IFT_HSSI">const IFT_HSSI</a>

```
searchKey: syscall.IFT_HSSI
```

```Go
const IFT_HSSI = 0x2e
```

### <a id="IFT_HY" href="#IFT_HY">const IFT_HY</a>

```
searchKey: syscall.IFT_HY
```

```Go
const IFT_HY = 0xe
```

### <a id="IFT_IEEE1394" href="#IFT_IEEE1394">const IFT_IEEE1394</a>

```
searchKey: syscall.IFT_IEEE1394
```

```Go
const IFT_IEEE1394 = 0x90
```

### <a id="IFT_IEEE8023ADLAG" href="#IFT_IEEE8023ADLAG">const IFT_IEEE8023ADLAG</a>

```
searchKey: syscall.IFT_IEEE8023ADLAG
```

```Go
const IFT_IEEE8023ADLAG = 0x88
```

### <a id="IFT_ISDNBASIC" href="#IFT_ISDNBASIC">const IFT_ISDNBASIC</a>

```
searchKey: syscall.IFT_ISDNBASIC
```

```Go
const IFT_ISDNBASIC = 0x14
```

### <a id="IFT_ISDNPRIMARY" href="#IFT_ISDNPRIMARY">const IFT_ISDNPRIMARY</a>

```
searchKey: syscall.IFT_ISDNPRIMARY
```

```Go
const IFT_ISDNPRIMARY = 0x15
```

### <a id="IFT_ISO88022LLC" href="#IFT_ISO88022LLC">const IFT_ISO88022LLC</a>

```
searchKey: syscall.IFT_ISO88022LLC
```

```Go
const IFT_ISO88022LLC = 0x29
```

### <a id="IFT_ISO88023" href="#IFT_ISO88023">const IFT_ISO88023</a>

```
searchKey: syscall.IFT_ISO88023
```

```Go
const IFT_ISO88023 = 0x7
```

### <a id="IFT_ISO88024" href="#IFT_ISO88024">const IFT_ISO88024</a>

```
searchKey: syscall.IFT_ISO88024
```

```Go
const IFT_ISO88024 = 0x8
```

### <a id="IFT_ISO88025" href="#IFT_ISO88025">const IFT_ISO88025</a>

```
searchKey: syscall.IFT_ISO88025
```

```Go
const IFT_ISO88025 = 0x9
```

### <a id="IFT_ISO88026" href="#IFT_ISO88026">const IFT_ISO88026</a>

```
searchKey: syscall.IFT_ISO88026
```

```Go
const IFT_ISO88026 = 0xa
```

### <a id="IFT_L2VLAN" href="#IFT_L2VLAN">const IFT_L2VLAN</a>

```
searchKey: syscall.IFT_L2VLAN
```

```Go
const IFT_L2VLAN = 0x87
```

### <a id="IFT_LAPB" href="#IFT_LAPB">const IFT_LAPB</a>

```
searchKey: syscall.IFT_LAPB
```

```Go
const IFT_LAPB = 0x10
```

### <a id="IFT_LOCALTALK" href="#IFT_LOCALTALK">const IFT_LOCALTALK</a>

```
searchKey: syscall.IFT_LOCALTALK
```

```Go
const IFT_LOCALTALK = 0x2a
```

### <a id="IFT_LOOP" href="#IFT_LOOP">const IFT_LOOP</a>

```
searchKey: syscall.IFT_LOOP
```

```Go
const IFT_LOOP = 0x18
```

### <a id="IFT_MIOX25" href="#IFT_MIOX25">const IFT_MIOX25</a>

```
searchKey: syscall.IFT_MIOX25
```

```Go
const IFT_MIOX25 = 0x26
```

### <a id="IFT_MODEM" href="#IFT_MODEM">const IFT_MODEM</a>

```
searchKey: syscall.IFT_MODEM
```

```Go
const IFT_MODEM = 0x30
```

### <a id="IFT_NSIP" href="#IFT_NSIP">const IFT_NSIP</a>

```
searchKey: syscall.IFT_NSIP
```

```Go
const IFT_NSIP = 0x1b
```

### <a id="IFT_OTHER" href="#IFT_OTHER">const IFT_OTHER</a>

```
searchKey: syscall.IFT_OTHER
```

```Go
const IFT_OTHER = 0x1
```

### <a id="IFT_P10" href="#IFT_P10">const IFT_P10</a>

```
searchKey: syscall.IFT_P10
```

```Go
const IFT_P10 = 0xc
```

### <a id="IFT_P80" href="#IFT_P80">const IFT_P80</a>

```
searchKey: syscall.IFT_P80
```

```Go
const IFT_P80 = 0xd
```

### <a id="IFT_PARA" href="#IFT_PARA">const IFT_PARA</a>

```
searchKey: syscall.IFT_PARA
```

```Go
const IFT_PARA = 0x22
```

### <a id="IFT_PDP" href="#IFT_PDP">const IFT_PDP</a>

```
searchKey: syscall.IFT_PDP
```

```Go
const IFT_PDP = 0xff
```

### <a id="IFT_PFLOG" href="#IFT_PFLOG">const IFT_PFLOG</a>

```
searchKey: syscall.IFT_PFLOG
```

```Go
const IFT_PFLOG = 0xf5
```

### <a id="IFT_PFSYNC" href="#IFT_PFSYNC">const IFT_PFSYNC</a>

```
searchKey: syscall.IFT_PFSYNC
```

```Go
const IFT_PFSYNC = 0xf6
```

### <a id="IFT_PPP" href="#IFT_PPP">const IFT_PPP</a>

```
searchKey: syscall.IFT_PPP
```

```Go
const IFT_PPP = 0x17
```

### <a id="IFT_PROPMUX" href="#IFT_PROPMUX">const IFT_PROPMUX</a>

```
searchKey: syscall.IFT_PROPMUX
```

```Go
const IFT_PROPMUX = 0x36
```

### <a id="IFT_PROPVIRTUAL" href="#IFT_PROPVIRTUAL">const IFT_PROPVIRTUAL</a>

```
searchKey: syscall.IFT_PROPVIRTUAL
```

```Go
const IFT_PROPVIRTUAL = 0x35
```

### <a id="IFT_PTPSERIAL" href="#IFT_PTPSERIAL">const IFT_PTPSERIAL</a>

```
searchKey: syscall.IFT_PTPSERIAL
```

```Go
const IFT_PTPSERIAL = 0x16
```

### <a id="IFT_RS232" href="#IFT_RS232">const IFT_RS232</a>

```
searchKey: syscall.IFT_RS232
```

```Go
const IFT_RS232 = 0x21
```

### <a id="IFT_SDLC" href="#IFT_SDLC">const IFT_SDLC</a>

```
searchKey: syscall.IFT_SDLC
```

```Go
const IFT_SDLC = 0x11
```

### <a id="IFT_SIP" href="#IFT_SIP">const IFT_SIP</a>

```
searchKey: syscall.IFT_SIP
```

```Go
const IFT_SIP = 0x1f
```

### <a id="IFT_SLIP" href="#IFT_SLIP">const IFT_SLIP</a>

```
searchKey: syscall.IFT_SLIP
```

```Go
const IFT_SLIP = 0x1c
```

### <a id="IFT_SMDSDXI" href="#IFT_SMDSDXI">const IFT_SMDSDXI</a>

```
searchKey: syscall.IFT_SMDSDXI
```

```Go
const IFT_SMDSDXI = 0x2b
```

### <a id="IFT_SMDSICIP" href="#IFT_SMDSICIP">const IFT_SMDSICIP</a>

```
searchKey: syscall.IFT_SMDSICIP
```

```Go
const IFT_SMDSICIP = 0x34
```

### <a id="IFT_SONET" href="#IFT_SONET">const IFT_SONET</a>

```
searchKey: syscall.IFT_SONET
```

```Go
const IFT_SONET = 0x27
```

### <a id="IFT_SONETPATH" href="#IFT_SONETPATH">const IFT_SONETPATH</a>

```
searchKey: syscall.IFT_SONETPATH
```

```Go
const IFT_SONETPATH = 0x32
```

### <a id="IFT_SONETVT" href="#IFT_SONETVT">const IFT_SONETVT</a>

```
searchKey: syscall.IFT_SONETVT
```

```Go
const IFT_SONETVT = 0x33
```

### <a id="IFT_STARLAN" href="#IFT_STARLAN">const IFT_STARLAN</a>

```
searchKey: syscall.IFT_STARLAN
```

```Go
const IFT_STARLAN = 0xb
```

### <a id="IFT_STF" href="#IFT_STF">const IFT_STF</a>

```
searchKey: syscall.IFT_STF
```

```Go
const IFT_STF = 0x39
```

### <a id="IFT_T1" href="#IFT_T1">const IFT_T1</a>

```
searchKey: syscall.IFT_T1
```

```Go
const IFT_T1 = 0x12
```

### <a id="IFT_ULTRA" href="#IFT_ULTRA">const IFT_ULTRA</a>

```
searchKey: syscall.IFT_ULTRA
```

```Go
const IFT_ULTRA = 0x1d
```

### <a id="IFT_V35" href="#IFT_V35">const IFT_V35</a>

```
searchKey: syscall.IFT_V35
```

```Go
const IFT_V35 = 0x2d
```

### <a id="IFT_X25" href="#IFT_X25">const IFT_X25</a>

```
searchKey: syscall.IFT_X25
```

```Go
const IFT_X25 = 0x5
```

### <a id="IFT_X25DDN" href="#IFT_X25DDN">const IFT_X25DDN</a>

```
searchKey: syscall.IFT_X25DDN
```

```Go
const IFT_X25DDN = 0x4
```

### <a id="IFT_X25PLE" href="#IFT_X25PLE">const IFT_X25PLE</a>

```
searchKey: syscall.IFT_X25PLE
```

```Go
const IFT_X25PLE = 0x28
```

### <a id="IFT_XETHER" href="#IFT_XETHER">const IFT_XETHER</a>

```
searchKey: syscall.IFT_XETHER
```

```Go
const IFT_XETHER = 0x1a
```

### <a id="IGNBRK" href="#IGNBRK">const IGNBRK</a>

```
searchKey: syscall.IGNBRK
```

```Go
const IGNBRK = 0x1
```

### <a id="IGNCR" href="#IGNCR">const IGNCR</a>

```
searchKey: syscall.IGNCR
```

```Go
const IGNCR = 0x80
```

### <a id="IGNPAR" href="#IGNPAR">const IGNPAR</a>

```
searchKey: syscall.IGNPAR
```

```Go
const IGNPAR = 0x4
```

### <a id="IMAXBEL" href="#IMAXBEL">const IMAXBEL</a>

```
searchKey: syscall.IMAXBEL
```

```Go
const IMAXBEL = 0x2000
```

### <a id="INLCR" href="#INLCR">const INLCR</a>

```
searchKey: syscall.INLCR
```

```Go
const INLCR = 0x40
```

### <a id="INPCK" href="#INPCK">const INPCK</a>

```
searchKey: syscall.INPCK
```

```Go
const INPCK = 0x10
```

### <a id="IN_CLASSA_HOST" href="#IN_CLASSA_HOST">const IN_CLASSA_HOST</a>

```
searchKey: syscall.IN_CLASSA_HOST
```

```Go
const IN_CLASSA_HOST = 0xffffff
```

### <a id="IN_CLASSA_MAX" href="#IN_CLASSA_MAX">const IN_CLASSA_MAX</a>

```
searchKey: syscall.IN_CLASSA_MAX
```

```Go
const IN_CLASSA_MAX = 0x80
```

### <a id="IN_CLASSA_NET" href="#IN_CLASSA_NET">const IN_CLASSA_NET</a>

```
searchKey: syscall.IN_CLASSA_NET
```

```Go
const IN_CLASSA_NET = 0xff000000
```

### <a id="IN_CLASSA_NSHIFT" href="#IN_CLASSA_NSHIFT">const IN_CLASSA_NSHIFT</a>

```
searchKey: syscall.IN_CLASSA_NSHIFT
```

```Go
const IN_CLASSA_NSHIFT = 0x18
```

### <a id="IN_CLASSB_HOST" href="#IN_CLASSB_HOST">const IN_CLASSB_HOST</a>

```
searchKey: syscall.IN_CLASSB_HOST
```

```Go
const IN_CLASSB_HOST = 0xffff
```

### <a id="IN_CLASSB_MAX" href="#IN_CLASSB_MAX">const IN_CLASSB_MAX</a>

```
searchKey: syscall.IN_CLASSB_MAX
```

```Go
const IN_CLASSB_MAX = 0x10000
```

### <a id="IN_CLASSB_NET" href="#IN_CLASSB_NET">const IN_CLASSB_NET</a>

```
searchKey: syscall.IN_CLASSB_NET
```

```Go
const IN_CLASSB_NET = 0xffff0000
```

### <a id="IN_CLASSB_NSHIFT" href="#IN_CLASSB_NSHIFT">const IN_CLASSB_NSHIFT</a>

```
searchKey: syscall.IN_CLASSB_NSHIFT
```

```Go
const IN_CLASSB_NSHIFT = 0x10
```

### <a id="IN_CLASSC_HOST" href="#IN_CLASSC_HOST">const IN_CLASSC_HOST</a>

```
searchKey: syscall.IN_CLASSC_HOST
```

```Go
const IN_CLASSC_HOST = 0xff
```

### <a id="IN_CLASSC_NET" href="#IN_CLASSC_NET">const IN_CLASSC_NET</a>

```
searchKey: syscall.IN_CLASSC_NET
```

```Go
const IN_CLASSC_NET = 0xffffff00
```

### <a id="IN_CLASSC_NSHIFT" href="#IN_CLASSC_NSHIFT">const IN_CLASSC_NSHIFT</a>

```
searchKey: syscall.IN_CLASSC_NSHIFT
```

```Go
const IN_CLASSC_NSHIFT = 0x8
```

### <a id="IN_CLASSD_HOST" href="#IN_CLASSD_HOST">const IN_CLASSD_HOST</a>

```
searchKey: syscall.IN_CLASSD_HOST
```

```Go
const IN_CLASSD_HOST = 0xfffffff
```

### <a id="IN_CLASSD_NET" href="#IN_CLASSD_NET">const IN_CLASSD_NET</a>

```
searchKey: syscall.IN_CLASSD_NET
```

```Go
const IN_CLASSD_NET = 0xf0000000
```

### <a id="IN_CLASSD_NSHIFT" href="#IN_CLASSD_NSHIFT">const IN_CLASSD_NSHIFT</a>

```
searchKey: syscall.IN_CLASSD_NSHIFT
```

```Go
const IN_CLASSD_NSHIFT = 0x1c
```

### <a id="IN_LINKLOCALNETNUM" href="#IN_LINKLOCALNETNUM">const IN_LINKLOCALNETNUM</a>

```
searchKey: syscall.IN_LINKLOCALNETNUM
```

```Go
const IN_LINKLOCALNETNUM = 0xa9fe0000
```

### <a id="IN_LOOPBACKNET" href="#IN_LOOPBACKNET">const IN_LOOPBACKNET</a>

```
searchKey: syscall.IN_LOOPBACKNET
```

```Go
const IN_LOOPBACKNET = 0x7f
```

### <a id="IPPROTO_3PC" href="#IPPROTO_3PC">const IPPROTO_3PC</a>

```
searchKey: syscall.IPPROTO_3PC
```

```Go
const IPPROTO_3PC = 0x22
```

### <a id="IPPROTO_ADFS" href="#IPPROTO_ADFS">const IPPROTO_ADFS</a>

```
searchKey: syscall.IPPROTO_ADFS
```

```Go
const IPPROTO_ADFS = 0x44
```

### <a id="IPPROTO_AH" href="#IPPROTO_AH">const IPPROTO_AH</a>

```
searchKey: syscall.IPPROTO_AH
```

```Go
const IPPROTO_AH = 0x33
```

### <a id="IPPROTO_AHIP" href="#IPPROTO_AHIP">const IPPROTO_AHIP</a>

```
searchKey: syscall.IPPROTO_AHIP
```

```Go
const IPPROTO_AHIP = 0x3d
```

### <a id="IPPROTO_APES" href="#IPPROTO_APES">const IPPROTO_APES</a>

```
searchKey: syscall.IPPROTO_APES
```

```Go
const IPPROTO_APES = 0x63
```

### <a id="IPPROTO_ARGUS" href="#IPPROTO_ARGUS">const IPPROTO_ARGUS</a>

```
searchKey: syscall.IPPROTO_ARGUS
```

```Go
const IPPROTO_ARGUS = 0xd
```

### <a id="IPPROTO_AX25" href="#IPPROTO_AX25">const IPPROTO_AX25</a>

```
searchKey: syscall.IPPROTO_AX25
```

```Go
const IPPROTO_AX25 = 0x5d
```

### <a id="IPPROTO_BHA" href="#IPPROTO_BHA">const IPPROTO_BHA</a>

```
searchKey: syscall.IPPROTO_BHA
```

```Go
const IPPROTO_BHA = 0x31
```

### <a id="IPPROTO_BLT" href="#IPPROTO_BLT">const IPPROTO_BLT</a>

```
searchKey: syscall.IPPROTO_BLT
```

```Go
const IPPROTO_BLT = 0x1e
```

### <a id="IPPROTO_BRSATMON" href="#IPPROTO_BRSATMON">const IPPROTO_BRSATMON</a>

```
searchKey: syscall.IPPROTO_BRSATMON
```

```Go
const IPPROTO_BRSATMON = 0x4c
```

### <a id="IPPROTO_CFTP" href="#IPPROTO_CFTP">const IPPROTO_CFTP</a>

```
searchKey: syscall.IPPROTO_CFTP
```

```Go
const IPPROTO_CFTP = 0x3e
```

### <a id="IPPROTO_CHAOS" href="#IPPROTO_CHAOS">const IPPROTO_CHAOS</a>

```
searchKey: syscall.IPPROTO_CHAOS
```

```Go
const IPPROTO_CHAOS = 0x10
```

### <a id="IPPROTO_CMTP" href="#IPPROTO_CMTP">const IPPROTO_CMTP</a>

```
searchKey: syscall.IPPROTO_CMTP
```

```Go
const IPPROTO_CMTP = 0x26
```

### <a id="IPPROTO_CPHB" href="#IPPROTO_CPHB">const IPPROTO_CPHB</a>

```
searchKey: syscall.IPPROTO_CPHB
```

```Go
const IPPROTO_CPHB = 0x49
```

### <a id="IPPROTO_CPNX" href="#IPPROTO_CPNX">const IPPROTO_CPNX</a>

```
searchKey: syscall.IPPROTO_CPNX
```

```Go
const IPPROTO_CPNX = 0x48
```

### <a id="IPPROTO_DDP" href="#IPPROTO_DDP">const IPPROTO_DDP</a>

```
searchKey: syscall.IPPROTO_DDP
```

```Go
const IPPROTO_DDP = 0x25
```

### <a id="IPPROTO_DGP" href="#IPPROTO_DGP">const IPPROTO_DGP</a>

```
searchKey: syscall.IPPROTO_DGP
```

```Go
const IPPROTO_DGP = 0x56
```

### <a id="IPPROTO_DIVERT" href="#IPPROTO_DIVERT">const IPPROTO_DIVERT</a>

```
searchKey: syscall.IPPROTO_DIVERT
```

```Go
const IPPROTO_DIVERT = 0xfe
```

### <a id="IPPROTO_DONE" href="#IPPROTO_DONE">const IPPROTO_DONE</a>

```
searchKey: syscall.IPPROTO_DONE
```

```Go
const IPPROTO_DONE = 0x101
```

### <a id="IPPROTO_DSTOPTS" href="#IPPROTO_DSTOPTS">const IPPROTO_DSTOPTS</a>

```
searchKey: syscall.IPPROTO_DSTOPTS
```

```Go
const IPPROTO_DSTOPTS = 0x3c
```

### <a id="IPPROTO_EGP" href="#IPPROTO_EGP">const IPPROTO_EGP</a>

```
searchKey: syscall.IPPROTO_EGP
```

```Go
const IPPROTO_EGP = 0x8
```

### <a id="IPPROTO_EMCON" href="#IPPROTO_EMCON">const IPPROTO_EMCON</a>

```
searchKey: syscall.IPPROTO_EMCON
```

```Go
const IPPROTO_EMCON = 0xe
```

### <a id="IPPROTO_ENCAP" href="#IPPROTO_ENCAP">const IPPROTO_ENCAP</a>

```
searchKey: syscall.IPPROTO_ENCAP
```

```Go
const IPPROTO_ENCAP = 0x62
```

### <a id="IPPROTO_EON" href="#IPPROTO_EON">const IPPROTO_EON</a>

```
searchKey: syscall.IPPROTO_EON
```

```Go
const IPPROTO_EON = 0x50
```

### <a id="IPPROTO_ESP" href="#IPPROTO_ESP">const IPPROTO_ESP</a>

```
searchKey: syscall.IPPROTO_ESP
```

```Go
const IPPROTO_ESP = 0x32
```

### <a id="IPPROTO_ETHERIP" href="#IPPROTO_ETHERIP">const IPPROTO_ETHERIP</a>

```
searchKey: syscall.IPPROTO_ETHERIP
```

```Go
const IPPROTO_ETHERIP = 0x61
```

### <a id="IPPROTO_FRAGMENT" href="#IPPROTO_FRAGMENT">const IPPROTO_FRAGMENT</a>

```
searchKey: syscall.IPPROTO_FRAGMENT
```

```Go
const IPPROTO_FRAGMENT = 0x2c
```

### <a id="IPPROTO_GGP" href="#IPPROTO_GGP">const IPPROTO_GGP</a>

```
searchKey: syscall.IPPROTO_GGP
```

```Go
const IPPROTO_GGP = 0x3
```

### <a id="IPPROTO_GMTP" href="#IPPROTO_GMTP">const IPPROTO_GMTP</a>

```
searchKey: syscall.IPPROTO_GMTP
```

```Go
const IPPROTO_GMTP = 0x64
```

### <a id="IPPROTO_GRE" href="#IPPROTO_GRE">const IPPROTO_GRE</a>

```
searchKey: syscall.IPPROTO_GRE
```

```Go
const IPPROTO_GRE = 0x2f
```

### <a id="IPPROTO_HELLO" href="#IPPROTO_HELLO">const IPPROTO_HELLO</a>

```
searchKey: syscall.IPPROTO_HELLO
```

```Go
const IPPROTO_HELLO = 0x3f
```

### <a id="IPPROTO_HMP" href="#IPPROTO_HMP">const IPPROTO_HMP</a>

```
searchKey: syscall.IPPROTO_HMP
```

```Go
const IPPROTO_HMP = 0x14
```

### <a id="IPPROTO_HOPOPTS" href="#IPPROTO_HOPOPTS">const IPPROTO_HOPOPTS</a>

```
searchKey: syscall.IPPROTO_HOPOPTS
```

```Go
const IPPROTO_HOPOPTS = 0x0
```

### <a id="IPPROTO_ICMP" href="#IPPROTO_ICMP">const IPPROTO_ICMP</a>

```
searchKey: syscall.IPPROTO_ICMP
```

```Go
const IPPROTO_ICMP = 0x1
```

### <a id="IPPROTO_ICMPV6" href="#IPPROTO_ICMPV6">const IPPROTO_ICMPV6</a>

```
searchKey: syscall.IPPROTO_ICMPV6
```

```Go
const IPPROTO_ICMPV6 = 0x3a
```

### <a id="IPPROTO_IDP" href="#IPPROTO_IDP">const IPPROTO_IDP</a>

```
searchKey: syscall.IPPROTO_IDP
```

```Go
const IPPROTO_IDP = 0x16
```

### <a id="IPPROTO_IDPR" href="#IPPROTO_IDPR">const IPPROTO_IDPR</a>

```
searchKey: syscall.IPPROTO_IDPR
```

```Go
const IPPROTO_IDPR = 0x23
```

### <a id="IPPROTO_IDRP" href="#IPPROTO_IDRP">const IPPROTO_IDRP</a>

```
searchKey: syscall.IPPROTO_IDRP
```

```Go
const IPPROTO_IDRP = 0x2d
```

### <a id="IPPROTO_IGMP" href="#IPPROTO_IGMP">const IPPROTO_IGMP</a>

```
searchKey: syscall.IPPROTO_IGMP
```

```Go
const IPPROTO_IGMP = 0x2
```

### <a id="IPPROTO_IGP" href="#IPPROTO_IGP">const IPPROTO_IGP</a>

```
searchKey: syscall.IPPROTO_IGP
```

```Go
const IPPROTO_IGP = 0x55
```

### <a id="IPPROTO_IGRP" href="#IPPROTO_IGRP">const IPPROTO_IGRP</a>

```
searchKey: syscall.IPPROTO_IGRP
```

```Go
const IPPROTO_IGRP = 0x58
```

### <a id="IPPROTO_IL" href="#IPPROTO_IL">const IPPROTO_IL</a>

```
searchKey: syscall.IPPROTO_IL
```

```Go
const IPPROTO_IL = 0x28
```

### <a id="IPPROTO_INLSP" href="#IPPROTO_INLSP">const IPPROTO_INLSP</a>

```
searchKey: syscall.IPPROTO_INLSP
```

```Go
const IPPROTO_INLSP = 0x34
```

### <a id="IPPROTO_INP" href="#IPPROTO_INP">const IPPROTO_INP</a>

```
searchKey: syscall.IPPROTO_INP
```

```Go
const IPPROTO_INP = 0x20
```

### <a id="IPPROTO_IP" href="#IPPROTO_IP">const IPPROTO_IP</a>

```
searchKey: syscall.IPPROTO_IP
```

```Go
const IPPROTO_IP = 0x0
```

### <a id="IPPROTO_IPCOMP" href="#IPPROTO_IPCOMP">const IPPROTO_IPCOMP</a>

```
searchKey: syscall.IPPROTO_IPCOMP
```

```Go
const IPPROTO_IPCOMP = 0x6c
```

### <a id="IPPROTO_IPCV" href="#IPPROTO_IPCV">const IPPROTO_IPCV</a>

```
searchKey: syscall.IPPROTO_IPCV
```

```Go
const IPPROTO_IPCV = 0x47
```

### <a id="IPPROTO_IPEIP" href="#IPPROTO_IPEIP">const IPPROTO_IPEIP</a>

```
searchKey: syscall.IPPROTO_IPEIP
```

```Go
const IPPROTO_IPEIP = 0x5e
```

### <a id="IPPROTO_IPIP" href="#IPPROTO_IPIP">const IPPROTO_IPIP</a>

```
searchKey: syscall.IPPROTO_IPIP
```

```Go
const IPPROTO_IPIP = 0x4
```

### <a id="IPPROTO_IPPC" href="#IPPROTO_IPPC">const IPPROTO_IPPC</a>

```
searchKey: syscall.IPPROTO_IPPC
```

```Go
const IPPROTO_IPPC = 0x43
```

### <a id="IPPROTO_IPV4" href="#IPPROTO_IPV4">const IPPROTO_IPV4</a>

```
searchKey: syscall.IPPROTO_IPV4
```

```Go
const IPPROTO_IPV4 = 0x4
```

### <a id="IPPROTO_IPV6" href="#IPPROTO_IPV6">const IPPROTO_IPV6</a>

```
searchKey: syscall.IPPROTO_IPV6
```

```Go
const IPPROTO_IPV6 = 0x29
```

### <a id="IPPROTO_IRTP" href="#IPPROTO_IRTP">const IPPROTO_IRTP</a>

```
searchKey: syscall.IPPROTO_IRTP
```

```Go
const IPPROTO_IRTP = 0x1c
```

### <a id="IPPROTO_KRYPTOLAN" href="#IPPROTO_KRYPTOLAN">const IPPROTO_KRYPTOLAN</a>

```
searchKey: syscall.IPPROTO_KRYPTOLAN
```

```Go
const IPPROTO_KRYPTOLAN = 0x41
```

### <a id="IPPROTO_LARP" href="#IPPROTO_LARP">const IPPROTO_LARP</a>

```
searchKey: syscall.IPPROTO_LARP
```

```Go
const IPPROTO_LARP = 0x5b
```

### <a id="IPPROTO_LEAF1" href="#IPPROTO_LEAF1">const IPPROTO_LEAF1</a>

```
searchKey: syscall.IPPROTO_LEAF1
```

```Go
const IPPROTO_LEAF1 = 0x19
```

### <a id="IPPROTO_LEAF2" href="#IPPROTO_LEAF2">const IPPROTO_LEAF2</a>

```
searchKey: syscall.IPPROTO_LEAF2
```

```Go
const IPPROTO_LEAF2 = 0x1a
```

### <a id="IPPROTO_MAX" href="#IPPROTO_MAX">const IPPROTO_MAX</a>

```
searchKey: syscall.IPPROTO_MAX
```

```Go
const IPPROTO_MAX = 0x100
```

### <a id="IPPROTO_MAXID" href="#IPPROTO_MAXID">const IPPROTO_MAXID</a>

```
searchKey: syscall.IPPROTO_MAXID
```

```Go
const IPPROTO_MAXID = 0x34
```

### <a id="IPPROTO_MEAS" href="#IPPROTO_MEAS">const IPPROTO_MEAS</a>

```
searchKey: syscall.IPPROTO_MEAS
```

```Go
const IPPROTO_MEAS = 0x13
```

### <a id="IPPROTO_MHRP" href="#IPPROTO_MHRP">const IPPROTO_MHRP</a>

```
searchKey: syscall.IPPROTO_MHRP
```

```Go
const IPPROTO_MHRP = 0x30
```

### <a id="IPPROTO_MICP" href="#IPPROTO_MICP">const IPPROTO_MICP</a>

```
searchKey: syscall.IPPROTO_MICP
```

```Go
const IPPROTO_MICP = 0x5f
```

### <a id="IPPROTO_MTP" href="#IPPROTO_MTP">const IPPROTO_MTP</a>

```
searchKey: syscall.IPPROTO_MTP
```

```Go
const IPPROTO_MTP = 0x5c
```

### <a id="IPPROTO_MUX" href="#IPPROTO_MUX">const IPPROTO_MUX</a>

```
searchKey: syscall.IPPROTO_MUX
```

```Go
const IPPROTO_MUX = 0x12
```

### <a id="IPPROTO_ND" href="#IPPROTO_ND">const IPPROTO_ND</a>

```
searchKey: syscall.IPPROTO_ND
```

```Go
const IPPROTO_ND = 0x4d
```

### <a id="IPPROTO_NHRP" href="#IPPROTO_NHRP">const IPPROTO_NHRP</a>

```
searchKey: syscall.IPPROTO_NHRP
```

```Go
const IPPROTO_NHRP = 0x36
```

### <a id="IPPROTO_NONE" href="#IPPROTO_NONE">const IPPROTO_NONE</a>

```
searchKey: syscall.IPPROTO_NONE
```

```Go
const IPPROTO_NONE = 0x3b
```

### <a id="IPPROTO_NSP" href="#IPPROTO_NSP">const IPPROTO_NSP</a>

```
searchKey: syscall.IPPROTO_NSP
```

```Go
const IPPROTO_NSP = 0x1f
```

### <a id="IPPROTO_NVPII" href="#IPPROTO_NVPII">const IPPROTO_NVPII</a>

```
searchKey: syscall.IPPROTO_NVPII
```

```Go
const IPPROTO_NVPII = 0xb
```

### <a id="IPPROTO_OSPFIGP" href="#IPPROTO_OSPFIGP">const IPPROTO_OSPFIGP</a>

```
searchKey: syscall.IPPROTO_OSPFIGP
```

```Go
const IPPROTO_OSPFIGP = 0x59
```

### <a id="IPPROTO_PGM" href="#IPPROTO_PGM">const IPPROTO_PGM</a>

```
searchKey: syscall.IPPROTO_PGM
```

```Go
const IPPROTO_PGM = 0x71
```

### <a id="IPPROTO_PIGP" href="#IPPROTO_PIGP">const IPPROTO_PIGP</a>

```
searchKey: syscall.IPPROTO_PIGP
```

```Go
const IPPROTO_PIGP = 0x9
```

### <a id="IPPROTO_PIM" href="#IPPROTO_PIM">const IPPROTO_PIM</a>

```
searchKey: syscall.IPPROTO_PIM
```

```Go
const IPPROTO_PIM = 0x67
```

### <a id="IPPROTO_PRM" href="#IPPROTO_PRM">const IPPROTO_PRM</a>

```
searchKey: syscall.IPPROTO_PRM
```

```Go
const IPPROTO_PRM = 0x15
```

### <a id="IPPROTO_PUP" href="#IPPROTO_PUP">const IPPROTO_PUP</a>

```
searchKey: syscall.IPPROTO_PUP
```

```Go
const IPPROTO_PUP = 0xc
```

### <a id="IPPROTO_PVP" href="#IPPROTO_PVP">const IPPROTO_PVP</a>

```
searchKey: syscall.IPPROTO_PVP
```

```Go
const IPPROTO_PVP = 0x4b
```

### <a id="IPPROTO_RAW" href="#IPPROTO_RAW">const IPPROTO_RAW</a>

```
searchKey: syscall.IPPROTO_RAW
```

```Go
const IPPROTO_RAW = 0xff
```

### <a id="IPPROTO_RCCMON" href="#IPPROTO_RCCMON">const IPPROTO_RCCMON</a>

```
searchKey: syscall.IPPROTO_RCCMON
```

```Go
const IPPROTO_RCCMON = 0xa
```

### <a id="IPPROTO_RDP" href="#IPPROTO_RDP">const IPPROTO_RDP</a>

```
searchKey: syscall.IPPROTO_RDP
```

```Go
const IPPROTO_RDP = 0x1b
```

### <a id="IPPROTO_ROUTING" href="#IPPROTO_ROUTING">const IPPROTO_ROUTING</a>

```
searchKey: syscall.IPPROTO_ROUTING
```

```Go
const IPPROTO_ROUTING = 0x2b
```

### <a id="IPPROTO_RSVP" href="#IPPROTO_RSVP">const IPPROTO_RSVP</a>

```
searchKey: syscall.IPPROTO_RSVP
```

```Go
const IPPROTO_RSVP = 0x2e
```

### <a id="IPPROTO_RVD" href="#IPPROTO_RVD">const IPPROTO_RVD</a>

```
searchKey: syscall.IPPROTO_RVD
```

```Go
const IPPROTO_RVD = 0x42
```

### <a id="IPPROTO_SATEXPAK" href="#IPPROTO_SATEXPAK">const IPPROTO_SATEXPAK</a>

```
searchKey: syscall.IPPROTO_SATEXPAK
```

```Go
const IPPROTO_SATEXPAK = 0x40
```

### <a id="IPPROTO_SATMON" href="#IPPROTO_SATMON">const IPPROTO_SATMON</a>

```
searchKey: syscall.IPPROTO_SATMON
```

```Go
const IPPROTO_SATMON = 0x45
```

### <a id="IPPROTO_SCCSP" href="#IPPROTO_SCCSP">const IPPROTO_SCCSP</a>

```
searchKey: syscall.IPPROTO_SCCSP
```

```Go
const IPPROTO_SCCSP = 0x60
```

### <a id="IPPROTO_SCTP" href="#IPPROTO_SCTP">const IPPROTO_SCTP</a>

```
searchKey: syscall.IPPROTO_SCTP
```

```Go
const IPPROTO_SCTP = 0x84
```

### <a id="IPPROTO_SDRP" href="#IPPROTO_SDRP">const IPPROTO_SDRP</a>

```
searchKey: syscall.IPPROTO_SDRP
```

```Go
const IPPROTO_SDRP = 0x2a
```

### <a id="IPPROTO_SEP" href="#IPPROTO_SEP">const IPPROTO_SEP</a>

```
searchKey: syscall.IPPROTO_SEP
```

```Go
const IPPROTO_SEP = 0x21
```

### <a id="IPPROTO_SRPC" href="#IPPROTO_SRPC">const IPPROTO_SRPC</a>

```
searchKey: syscall.IPPROTO_SRPC
```

```Go
const IPPROTO_SRPC = 0x5a
```

### <a id="IPPROTO_ST" href="#IPPROTO_ST">const IPPROTO_ST</a>

```
searchKey: syscall.IPPROTO_ST
```

```Go
const IPPROTO_ST = 0x7
```

### <a id="IPPROTO_SVMTP" href="#IPPROTO_SVMTP">const IPPROTO_SVMTP</a>

```
searchKey: syscall.IPPROTO_SVMTP
```

```Go
const IPPROTO_SVMTP = 0x52
```

### <a id="IPPROTO_SWIPE" href="#IPPROTO_SWIPE">const IPPROTO_SWIPE</a>

```
searchKey: syscall.IPPROTO_SWIPE
```

```Go
const IPPROTO_SWIPE = 0x35
```

### <a id="IPPROTO_TCF" href="#IPPROTO_TCF">const IPPROTO_TCF</a>

```
searchKey: syscall.IPPROTO_TCF
```

```Go
const IPPROTO_TCF = 0x57
```

### <a id="IPPROTO_TCP" href="#IPPROTO_TCP">const IPPROTO_TCP</a>

```
searchKey: syscall.IPPROTO_TCP
```

```Go
const IPPROTO_TCP = 0x6
```

### <a id="IPPROTO_TP" href="#IPPROTO_TP">const IPPROTO_TP</a>

```
searchKey: syscall.IPPROTO_TP
```

```Go
const IPPROTO_TP = 0x1d
```

### <a id="IPPROTO_TPXX" href="#IPPROTO_TPXX">const IPPROTO_TPXX</a>

```
searchKey: syscall.IPPROTO_TPXX
```

```Go
const IPPROTO_TPXX = 0x27
```

### <a id="IPPROTO_TRUNK1" href="#IPPROTO_TRUNK1">const IPPROTO_TRUNK1</a>

```
searchKey: syscall.IPPROTO_TRUNK1
```

```Go
const IPPROTO_TRUNK1 = 0x17
```

### <a id="IPPROTO_TRUNK2" href="#IPPROTO_TRUNK2">const IPPROTO_TRUNK2</a>

```
searchKey: syscall.IPPROTO_TRUNK2
```

```Go
const IPPROTO_TRUNK2 = 0x18
```

### <a id="IPPROTO_TTP" href="#IPPROTO_TTP">const IPPROTO_TTP</a>

```
searchKey: syscall.IPPROTO_TTP
```

```Go
const IPPROTO_TTP = 0x54
```

### <a id="IPPROTO_UDP" href="#IPPROTO_UDP">const IPPROTO_UDP</a>

```
searchKey: syscall.IPPROTO_UDP
```

```Go
const IPPROTO_UDP = 0x11
```

### <a id="IPPROTO_VINES" href="#IPPROTO_VINES">const IPPROTO_VINES</a>

```
searchKey: syscall.IPPROTO_VINES
```

```Go
const IPPROTO_VINES = 0x53
```

### <a id="IPPROTO_VISA" href="#IPPROTO_VISA">const IPPROTO_VISA</a>

```
searchKey: syscall.IPPROTO_VISA
```

```Go
const IPPROTO_VISA = 0x46
```

### <a id="IPPROTO_VMTP" href="#IPPROTO_VMTP">const IPPROTO_VMTP</a>

```
searchKey: syscall.IPPROTO_VMTP
```

```Go
const IPPROTO_VMTP = 0x51
```

### <a id="IPPROTO_WBEXPAK" href="#IPPROTO_WBEXPAK">const IPPROTO_WBEXPAK</a>

```
searchKey: syscall.IPPROTO_WBEXPAK
```

```Go
const IPPROTO_WBEXPAK = 0x4f
```

### <a id="IPPROTO_WBMON" href="#IPPROTO_WBMON">const IPPROTO_WBMON</a>

```
searchKey: syscall.IPPROTO_WBMON
```

```Go
const IPPROTO_WBMON = 0x4e
```

### <a id="IPPROTO_WSN" href="#IPPROTO_WSN">const IPPROTO_WSN</a>

```
searchKey: syscall.IPPROTO_WSN
```

```Go
const IPPROTO_WSN = 0x4a
```

### <a id="IPPROTO_XNET" href="#IPPROTO_XNET">const IPPROTO_XNET</a>

```
searchKey: syscall.IPPROTO_XNET
```

```Go
const IPPROTO_XNET = 0xf
```

### <a id="IPPROTO_XTP" href="#IPPROTO_XTP">const IPPROTO_XTP</a>

```
searchKey: syscall.IPPROTO_XTP
```

```Go
const IPPROTO_XTP = 0x24
```

### <a id="IPV6_2292DSTOPTS" href="#IPV6_2292DSTOPTS">const IPV6_2292DSTOPTS</a>

```
searchKey: syscall.IPV6_2292DSTOPTS
```

```Go
const IPV6_2292DSTOPTS = 0x17
```

### <a id="IPV6_2292HOPLIMIT" href="#IPV6_2292HOPLIMIT">const IPV6_2292HOPLIMIT</a>

```
searchKey: syscall.IPV6_2292HOPLIMIT
```

```Go
const IPV6_2292HOPLIMIT = 0x14
```

### <a id="IPV6_2292HOPOPTS" href="#IPV6_2292HOPOPTS">const IPV6_2292HOPOPTS</a>

```
searchKey: syscall.IPV6_2292HOPOPTS
```

```Go
const IPV6_2292HOPOPTS = 0x16
```

### <a id="IPV6_2292NEXTHOP" href="#IPV6_2292NEXTHOP">const IPV6_2292NEXTHOP</a>

```
searchKey: syscall.IPV6_2292NEXTHOP
```

```Go
const IPV6_2292NEXTHOP = 0x15
```

### <a id="IPV6_2292PKTINFO" href="#IPV6_2292PKTINFO">const IPV6_2292PKTINFO</a>

```
searchKey: syscall.IPV6_2292PKTINFO
```

```Go
const IPV6_2292PKTINFO = 0x13
```

### <a id="IPV6_2292PKTOPTIONS" href="#IPV6_2292PKTOPTIONS">const IPV6_2292PKTOPTIONS</a>

```
searchKey: syscall.IPV6_2292PKTOPTIONS
```

```Go
const IPV6_2292PKTOPTIONS = 0x19
```

### <a id="IPV6_2292RTHDR" href="#IPV6_2292RTHDR">const IPV6_2292RTHDR</a>

```
searchKey: syscall.IPV6_2292RTHDR
```

```Go
const IPV6_2292RTHDR = 0x18
```

### <a id="IPV6_BINDV6ONLY" href="#IPV6_BINDV6ONLY">const IPV6_BINDV6ONLY</a>

```
searchKey: syscall.IPV6_BINDV6ONLY
```

```Go
const IPV6_BINDV6ONLY = 0x1b
```

### <a id="IPV6_BOUND_IF" href="#IPV6_BOUND_IF">const IPV6_BOUND_IF</a>

```
searchKey: syscall.IPV6_BOUND_IF
```

```Go
const IPV6_BOUND_IF = 0x7d
```

### <a id="IPV6_CHECKSUM" href="#IPV6_CHECKSUM">const IPV6_CHECKSUM</a>

```
searchKey: syscall.IPV6_CHECKSUM
```

```Go
const IPV6_CHECKSUM = 0x1a
```

### <a id="IPV6_DEFAULT_MULTICAST_HOPS" href="#IPV6_DEFAULT_MULTICAST_HOPS">const IPV6_DEFAULT_MULTICAST_HOPS</a>

```
searchKey: syscall.IPV6_DEFAULT_MULTICAST_HOPS
```

```Go
const IPV6_DEFAULT_MULTICAST_HOPS = 0x1
```

### <a id="IPV6_DEFAULT_MULTICAST_LOOP" href="#IPV6_DEFAULT_MULTICAST_LOOP">const IPV6_DEFAULT_MULTICAST_LOOP</a>

```
searchKey: syscall.IPV6_DEFAULT_MULTICAST_LOOP
```

```Go
const IPV6_DEFAULT_MULTICAST_LOOP = 0x1
```

### <a id="IPV6_DEFHLIM" href="#IPV6_DEFHLIM">const IPV6_DEFHLIM</a>

```
searchKey: syscall.IPV6_DEFHLIM
```

```Go
const IPV6_DEFHLIM = 0x40
```

### <a id="IPV6_FAITH" href="#IPV6_FAITH">const IPV6_FAITH</a>

```
searchKey: syscall.IPV6_FAITH
```

```Go
const IPV6_FAITH = 0x1d
```

### <a id="IPV6_FLOWINFO_MASK" href="#IPV6_FLOWINFO_MASK">const IPV6_FLOWINFO_MASK</a>

```
searchKey: syscall.IPV6_FLOWINFO_MASK
```

```Go
const IPV6_FLOWINFO_MASK = 0xffffff0f
```

### <a id="IPV6_FLOWLABEL_MASK" href="#IPV6_FLOWLABEL_MASK">const IPV6_FLOWLABEL_MASK</a>

```
searchKey: syscall.IPV6_FLOWLABEL_MASK
```

```Go
const IPV6_FLOWLABEL_MASK = 0xffff0f00
```

### <a id="IPV6_FRAGTTL" href="#IPV6_FRAGTTL">const IPV6_FRAGTTL</a>

```
searchKey: syscall.IPV6_FRAGTTL
```

```Go
const IPV6_FRAGTTL = 0x78
```

### <a id="IPV6_FW_ADD" href="#IPV6_FW_ADD">const IPV6_FW_ADD</a>

```
searchKey: syscall.IPV6_FW_ADD
```

```Go
const IPV6_FW_ADD = 0x1e
```

### <a id="IPV6_FW_DEL" href="#IPV6_FW_DEL">const IPV6_FW_DEL</a>

```
searchKey: syscall.IPV6_FW_DEL
```

```Go
const IPV6_FW_DEL = 0x1f
```

### <a id="IPV6_FW_FLUSH" href="#IPV6_FW_FLUSH">const IPV6_FW_FLUSH</a>

```
searchKey: syscall.IPV6_FW_FLUSH
```

```Go
const IPV6_FW_FLUSH = 0x20
```

### <a id="IPV6_FW_GET" href="#IPV6_FW_GET">const IPV6_FW_GET</a>

```
searchKey: syscall.IPV6_FW_GET
```

```Go
const IPV6_FW_GET = 0x22
```

### <a id="IPV6_FW_ZERO" href="#IPV6_FW_ZERO">const IPV6_FW_ZERO</a>

```
searchKey: syscall.IPV6_FW_ZERO
```

```Go
const IPV6_FW_ZERO = 0x21
```

### <a id="IPV6_HLIMDEC" href="#IPV6_HLIMDEC">const IPV6_HLIMDEC</a>

```
searchKey: syscall.IPV6_HLIMDEC
```

```Go
const IPV6_HLIMDEC = 0x1
```

### <a id="IPV6_IPSEC_POLICY" href="#IPV6_IPSEC_POLICY">const IPV6_IPSEC_POLICY</a>

```
searchKey: syscall.IPV6_IPSEC_POLICY
```

```Go
const IPV6_IPSEC_POLICY = 0x1c
```

### <a id="IPV6_JOIN_GROUP" href="#IPV6_JOIN_GROUP">const IPV6_JOIN_GROUP</a>

```
searchKey: syscall.IPV6_JOIN_GROUP
```

```Go
const IPV6_JOIN_GROUP = 0xc
```

### <a id="IPV6_LEAVE_GROUP" href="#IPV6_LEAVE_GROUP">const IPV6_LEAVE_GROUP</a>

```
searchKey: syscall.IPV6_LEAVE_GROUP
```

```Go
const IPV6_LEAVE_GROUP = 0xd
```

### <a id="IPV6_MAXHLIM" href="#IPV6_MAXHLIM">const IPV6_MAXHLIM</a>

```
searchKey: syscall.IPV6_MAXHLIM
```

```Go
const IPV6_MAXHLIM = 0xff
```

### <a id="IPV6_MAXOPTHDR" href="#IPV6_MAXOPTHDR">const IPV6_MAXOPTHDR</a>

```
searchKey: syscall.IPV6_MAXOPTHDR
```

```Go
const IPV6_MAXOPTHDR = 0x800
```

### <a id="IPV6_MAXPACKET" href="#IPV6_MAXPACKET">const IPV6_MAXPACKET</a>

```
searchKey: syscall.IPV6_MAXPACKET
```

```Go
const IPV6_MAXPACKET = 0xffff
```

### <a id="IPV6_MAX_GROUP_SRC_FILTER" href="#IPV6_MAX_GROUP_SRC_FILTER">const IPV6_MAX_GROUP_SRC_FILTER</a>

```
searchKey: syscall.IPV6_MAX_GROUP_SRC_FILTER
```

```Go
const IPV6_MAX_GROUP_SRC_FILTER = 0x200
```

### <a id="IPV6_MAX_MEMBERSHIPS" href="#IPV6_MAX_MEMBERSHIPS">const IPV6_MAX_MEMBERSHIPS</a>

```
searchKey: syscall.IPV6_MAX_MEMBERSHIPS
```

```Go
const IPV6_MAX_MEMBERSHIPS = 0xfff
```

### <a id="IPV6_MAX_SOCK_SRC_FILTER" href="#IPV6_MAX_SOCK_SRC_FILTER">const IPV6_MAX_SOCK_SRC_FILTER</a>

```
searchKey: syscall.IPV6_MAX_SOCK_SRC_FILTER
```

```Go
const IPV6_MAX_SOCK_SRC_FILTER = 0x80
```

### <a id="IPV6_MIN_MEMBERSHIPS" href="#IPV6_MIN_MEMBERSHIPS">const IPV6_MIN_MEMBERSHIPS</a>

```
searchKey: syscall.IPV6_MIN_MEMBERSHIPS
```

```Go
const IPV6_MIN_MEMBERSHIPS = 0x1f
```

### <a id="IPV6_MMTU" href="#IPV6_MMTU">const IPV6_MMTU</a>

```
searchKey: syscall.IPV6_MMTU
```

```Go
const IPV6_MMTU = 0x500
```

### <a id="IPV6_MULTICAST_HOPS" href="#IPV6_MULTICAST_HOPS">const IPV6_MULTICAST_HOPS</a>

```
searchKey: syscall.IPV6_MULTICAST_HOPS
```

```Go
const IPV6_MULTICAST_HOPS = 0xa
```

### <a id="IPV6_MULTICAST_IF" href="#IPV6_MULTICAST_IF">const IPV6_MULTICAST_IF</a>

```
searchKey: syscall.IPV6_MULTICAST_IF
```

```Go
const IPV6_MULTICAST_IF = 0x9
```

### <a id="IPV6_MULTICAST_LOOP" href="#IPV6_MULTICAST_LOOP">const IPV6_MULTICAST_LOOP</a>

```
searchKey: syscall.IPV6_MULTICAST_LOOP
```

```Go
const IPV6_MULTICAST_LOOP = 0xb
```

### <a id="IPV6_PORTRANGE" href="#IPV6_PORTRANGE">const IPV6_PORTRANGE</a>

```
searchKey: syscall.IPV6_PORTRANGE
```

```Go
const IPV6_PORTRANGE = 0xe
```

### <a id="IPV6_PORTRANGE_DEFAULT" href="#IPV6_PORTRANGE_DEFAULT">const IPV6_PORTRANGE_DEFAULT</a>

```
searchKey: syscall.IPV6_PORTRANGE_DEFAULT
```

```Go
const IPV6_PORTRANGE_DEFAULT = 0x0
```

### <a id="IPV6_PORTRANGE_HIGH" href="#IPV6_PORTRANGE_HIGH">const IPV6_PORTRANGE_HIGH</a>

```
searchKey: syscall.IPV6_PORTRANGE_HIGH
```

```Go
const IPV6_PORTRANGE_HIGH = 0x1
```

### <a id="IPV6_PORTRANGE_LOW" href="#IPV6_PORTRANGE_LOW">const IPV6_PORTRANGE_LOW</a>

```
searchKey: syscall.IPV6_PORTRANGE_LOW
```

```Go
const IPV6_PORTRANGE_LOW = 0x2
```

### <a id="IPV6_RECVTCLASS" href="#IPV6_RECVTCLASS">const IPV6_RECVTCLASS</a>

```
searchKey: syscall.IPV6_RECVTCLASS
```

```Go
const IPV6_RECVTCLASS = 0x23
```

### <a id="IPV6_RTHDR_LOOSE" href="#IPV6_RTHDR_LOOSE">const IPV6_RTHDR_LOOSE</a>

```
searchKey: syscall.IPV6_RTHDR_LOOSE
```

```Go
const IPV6_RTHDR_LOOSE = 0x0
```

### <a id="IPV6_RTHDR_STRICT" href="#IPV6_RTHDR_STRICT">const IPV6_RTHDR_STRICT</a>

```
searchKey: syscall.IPV6_RTHDR_STRICT
```

```Go
const IPV6_RTHDR_STRICT = 0x1
```

### <a id="IPV6_RTHDR_TYPE_0" href="#IPV6_RTHDR_TYPE_0">const IPV6_RTHDR_TYPE_0</a>

```
searchKey: syscall.IPV6_RTHDR_TYPE_0
```

```Go
const IPV6_RTHDR_TYPE_0 = 0x0
```

### <a id="IPV6_SOCKOPT_RESERVED1" href="#IPV6_SOCKOPT_RESERVED1">const IPV6_SOCKOPT_RESERVED1</a>

```
searchKey: syscall.IPV6_SOCKOPT_RESERVED1
```

```Go
const IPV6_SOCKOPT_RESERVED1 = 0x3
```

### <a id="IPV6_TCLASS" href="#IPV6_TCLASS">const IPV6_TCLASS</a>

```
searchKey: syscall.IPV6_TCLASS
```

```Go
const IPV6_TCLASS = 0x24
```

### <a id="IPV6_UNICAST_HOPS" href="#IPV6_UNICAST_HOPS">const IPV6_UNICAST_HOPS</a>

```
searchKey: syscall.IPV6_UNICAST_HOPS
```

```Go
const IPV6_UNICAST_HOPS = 0x4
```

### <a id="IPV6_V6ONLY" href="#IPV6_V6ONLY">const IPV6_V6ONLY</a>

```
searchKey: syscall.IPV6_V6ONLY
```

```Go
const IPV6_V6ONLY = 0x1b
```

### <a id="IPV6_VERSION" href="#IPV6_VERSION">const IPV6_VERSION</a>

```
searchKey: syscall.IPV6_VERSION
```

```Go
const IPV6_VERSION = 0x60
```

### <a id="IPV6_VERSION_MASK" href="#IPV6_VERSION_MASK">const IPV6_VERSION_MASK</a>

```
searchKey: syscall.IPV6_VERSION_MASK
```

```Go
const IPV6_VERSION_MASK = 0xf0
```

### <a id="IP_ADD_MEMBERSHIP" href="#IP_ADD_MEMBERSHIP">const IP_ADD_MEMBERSHIP</a>

```
searchKey: syscall.IP_ADD_MEMBERSHIP
```

```Go
const IP_ADD_MEMBERSHIP = 0xc
```

### <a id="IP_ADD_SOURCE_MEMBERSHIP" href="#IP_ADD_SOURCE_MEMBERSHIP">const IP_ADD_SOURCE_MEMBERSHIP</a>

```
searchKey: syscall.IP_ADD_SOURCE_MEMBERSHIP
```

```Go
const IP_ADD_SOURCE_MEMBERSHIP = 0x46
```

### <a id="IP_BLOCK_SOURCE" href="#IP_BLOCK_SOURCE">const IP_BLOCK_SOURCE</a>

```
searchKey: syscall.IP_BLOCK_SOURCE
```

```Go
const IP_BLOCK_SOURCE = 0x48
```

### <a id="IP_BOUND_IF" href="#IP_BOUND_IF">const IP_BOUND_IF</a>

```
searchKey: syscall.IP_BOUND_IF
```

```Go
const IP_BOUND_IF = 0x19
```

### <a id="IP_DEFAULT_MULTICAST_LOOP" href="#IP_DEFAULT_MULTICAST_LOOP">const IP_DEFAULT_MULTICAST_LOOP</a>

```
searchKey: syscall.IP_DEFAULT_MULTICAST_LOOP
```

```Go
const IP_DEFAULT_MULTICAST_LOOP = 0x1
```

### <a id="IP_DEFAULT_MULTICAST_TTL" href="#IP_DEFAULT_MULTICAST_TTL">const IP_DEFAULT_MULTICAST_TTL</a>

```
searchKey: syscall.IP_DEFAULT_MULTICAST_TTL
```

```Go
const IP_DEFAULT_MULTICAST_TTL = 0x1
```

### <a id="IP_DF" href="#IP_DF">const IP_DF</a>

```
searchKey: syscall.IP_DF
```

```Go
const IP_DF = 0x4000
```

### <a id="IP_DROP_MEMBERSHIP" href="#IP_DROP_MEMBERSHIP">const IP_DROP_MEMBERSHIP</a>

```
searchKey: syscall.IP_DROP_MEMBERSHIP
```

```Go
const IP_DROP_MEMBERSHIP = 0xd
```

### <a id="IP_DROP_SOURCE_MEMBERSHIP" href="#IP_DROP_SOURCE_MEMBERSHIP">const IP_DROP_SOURCE_MEMBERSHIP</a>

```
searchKey: syscall.IP_DROP_SOURCE_MEMBERSHIP
```

```Go
const IP_DROP_SOURCE_MEMBERSHIP = 0x47
```

### <a id="IP_DUMMYNET_CONFIGURE" href="#IP_DUMMYNET_CONFIGURE">const IP_DUMMYNET_CONFIGURE</a>

```
searchKey: syscall.IP_DUMMYNET_CONFIGURE
```

```Go
const IP_DUMMYNET_CONFIGURE = 0x3c
```

### <a id="IP_DUMMYNET_DEL" href="#IP_DUMMYNET_DEL">const IP_DUMMYNET_DEL</a>

```
searchKey: syscall.IP_DUMMYNET_DEL
```

```Go
const IP_DUMMYNET_DEL = 0x3d
```

### <a id="IP_DUMMYNET_FLUSH" href="#IP_DUMMYNET_FLUSH">const IP_DUMMYNET_FLUSH</a>

```
searchKey: syscall.IP_DUMMYNET_FLUSH
```

```Go
const IP_DUMMYNET_FLUSH = 0x3e
```

### <a id="IP_DUMMYNET_GET" href="#IP_DUMMYNET_GET">const IP_DUMMYNET_GET</a>

```
searchKey: syscall.IP_DUMMYNET_GET
```

```Go
const IP_DUMMYNET_GET = 0x40
```

### <a id="IP_FAITH" href="#IP_FAITH">const IP_FAITH</a>

```
searchKey: syscall.IP_FAITH
```

```Go
const IP_FAITH = 0x16
```

### <a id="IP_FW_ADD" href="#IP_FW_ADD">const IP_FW_ADD</a>

```
searchKey: syscall.IP_FW_ADD
```

```Go
const IP_FW_ADD = 0x28
```

### <a id="IP_FW_DEL" href="#IP_FW_DEL">const IP_FW_DEL</a>

```
searchKey: syscall.IP_FW_DEL
```

```Go
const IP_FW_DEL = 0x29
```

### <a id="IP_FW_FLUSH" href="#IP_FW_FLUSH">const IP_FW_FLUSH</a>

```
searchKey: syscall.IP_FW_FLUSH
```

```Go
const IP_FW_FLUSH = 0x2a
```

### <a id="IP_FW_GET" href="#IP_FW_GET">const IP_FW_GET</a>

```
searchKey: syscall.IP_FW_GET
```

```Go
const IP_FW_GET = 0x2c
```

### <a id="IP_FW_RESETLOG" href="#IP_FW_RESETLOG">const IP_FW_RESETLOG</a>

```
searchKey: syscall.IP_FW_RESETLOG
```

```Go
const IP_FW_RESETLOG = 0x2d
```

### <a id="IP_FW_ZERO" href="#IP_FW_ZERO">const IP_FW_ZERO</a>

```
searchKey: syscall.IP_FW_ZERO
```

```Go
const IP_FW_ZERO = 0x2b
```

### <a id="IP_HDRINCL" href="#IP_HDRINCL">const IP_HDRINCL</a>

```
searchKey: syscall.IP_HDRINCL
```

```Go
const IP_HDRINCL = 0x2
```

### <a id="IP_IPSEC_POLICY" href="#IP_IPSEC_POLICY">const IP_IPSEC_POLICY</a>

```
searchKey: syscall.IP_IPSEC_POLICY
```

```Go
const IP_IPSEC_POLICY = 0x15
```

### <a id="IP_MAXPACKET" href="#IP_MAXPACKET">const IP_MAXPACKET</a>

```
searchKey: syscall.IP_MAXPACKET
```

```Go
const IP_MAXPACKET = 0xffff
```

### <a id="IP_MAX_GROUP_SRC_FILTER" href="#IP_MAX_GROUP_SRC_FILTER">const IP_MAX_GROUP_SRC_FILTER</a>

```
searchKey: syscall.IP_MAX_GROUP_SRC_FILTER
```

```Go
const IP_MAX_GROUP_SRC_FILTER = 0x200
```

### <a id="IP_MAX_MEMBERSHIPS" href="#IP_MAX_MEMBERSHIPS">const IP_MAX_MEMBERSHIPS</a>

```
searchKey: syscall.IP_MAX_MEMBERSHIPS
```

```Go
const IP_MAX_MEMBERSHIPS = 0xfff
```

### <a id="IP_MAX_SOCK_MUTE_FILTER" href="#IP_MAX_SOCK_MUTE_FILTER">const IP_MAX_SOCK_MUTE_FILTER</a>

```
searchKey: syscall.IP_MAX_SOCK_MUTE_FILTER
```

```Go
const IP_MAX_SOCK_MUTE_FILTER = 0x80
```

### <a id="IP_MAX_SOCK_SRC_FILTER" href="#IP_MAX_SOCK_SRC_FILTER">const IP_MAX_SOCK_SRC_FILTER</a>

```
searchKey: syscall.IP_MAX_SOCK_SRC_FILTER
```

```Go
const IP_MAX_SOCK_SRC_FILTER = 0x80
```

### <a id="IP_MF" href="#IP_MF">const IP_MF</a>

```
searchKey: syscall.IP_MF
```

```Go
const IP_MF = 0x2000
```

### <a id="IP_MIN_MEMBERSHIPS" href="#IP_MIN_MEMBERSHIPS">const IP_MIN_MEMBERSHIPS</a>

```
searchKey: syscall.IP_MIN_MEMBERSHIPS
```

```Go
const IP_MIN_MEMBERSHIPS = 0x1f
```

### <a id="IP_MSFILTER" href="#IP_MSFILTER">const IP_MSFILTER</a>

```
searchKey: syscall.IP_MSFILTER
```

```Go
const IP_MSFILTER = 0x4a
```

### <a id="IP_MSS" href="#IP_MSS">const IP_MSS</a>

```
searchKey: syscall.IP_MSS
```

```Go
const IP_MSS = 0x240
```

### <a id="IP_MULTICAST_IF" href="#IP_MULTICAST_IF">const IP_MULTICAST_IF</a>

```
searchKey: syscall.IP_MULTICAST_IF
```

```Go
const IP_MULTICAST_IF = 0x9
```

### <a id="IP_MULTICAST_IFINDEX" href="#IP_MULTICAST_IFINDEX">const IP_MULTICAST_IFINDEX</a>

```
searchKey: syscall.IP_MULTICAST_IFINDEX
```

```Go
const IP_MULTICAST_IFINDEX = 0x42
```

### <a id="IP_MULTICAST_LOOP" href="#IP_MULTICAST_LOOP">const IP_MULTICAST_LOOP</a>

```
searchKey: syscall.IP_MULTICAST_LOOP
```

```Go
const IP_MULTICAST_LOOP = 0xb
```

### <a id="IP_MULTICAST_TTL" href="#IP_MULTICAST_TTL">const IP_MULTICAST_TTL</a>

```
searchKey: syscall.IP_MULTICAST_TTL
```

```Go
const IP_MULTICAST_TTL = 0xa
```

### <a id="IP_MULTICAST_VIF" href="#IP_MULTICAST_VIF">const IP_MULTICAST_VIF</a>

```
searchKey: syscall.IP_MULTICAST_VIF
```

```Go
const IP_MULTICAST_VIF = 0xe
```

### <a id="IP_NAT__XXX" href="#IP_NAT__XXX">const IP_NAT__XXX</a>

```
searchKey: syscall.IP_NAT__XXX
```

```Go
const IP_NAT__XXX = 0x37
```

### <a id="IP_OFFMASK" href="#IP_OFFMASK">const IP_OFFMASK</a>

```
searchKey: syscall.IP_OFFMASK
```

```Go
const IP_OFFMASK = 0x1fff
```

### <a id="IP_OLD_FW_ADD" href="#IP_OLD_FW_ADD">const IP_OLD_FW_ADD</a>

```
searchKey: syscall.IP_OLD_FW_ADD
```

```Go
const IP_OLD_FW_ADD = 0x32
```

### <a id="IP_OLD_FW_DEL" href="#IP_OLD_FW_DEL">const IP_OLD_FW_DEL</a>

```
searchKey: syscall.IP_OLD_FW_DEL
```

```Go
const IP_OLD_FW_DEL = 0x33
```

### <a id="IP_OLD_FW_FLUSH" href="#IP_OLD_FW_FLUSH">const IP_OLD_FW_FLUSH</a>

```
searchKey: syscall.IP_OLD_FW_FLUSH
```

```Go
const IP_OLD_FW_FLUSH = 0x34
```

### <a id="IP_OLD_FW_GET" href="#IP_OLD_FW_GET">const IP_OLD_FW_GET</a>

```
searchKey: syscall.IP_OLD_FW_GET
```

```Go
const IP_OLD_FW_GET = 0x36
```

### <a id="IP_OLD_FW_RESETLOG" href="#IP_OLD_FW_RESETLOG">const IP_OLD_FW_RESETLOG</a>

```
searchKey: syscall.IP_OLD_FW_RESETLOG
```

```Go
const IP_OLD_FW_RESETLOG = 0x38
```

### <a id="IP_OLD_FW_ZERO" href="#IP_OLD_FW_ZERO">const IP_OLD_FW_ZERO</a>

```
searchKey: syscall.IP_OLD_FW_ZERO
```

```Go
const IP_OLD_FW_ZERO = 0x35
```

### <a id="IP_OPTIONS" href="#IP_OPTIONS">const IP_OPTIONS</a>

```
searchKey: syscall.IP_OPTIONS
```

```Go
const IP_OPTIONS = 0x1
```

### <a id="IP_PKTINFO" href="#IP_PKTINFO">const IP_PKTINFO</a>

```
searchKey: syscall.IP_PKTINFO
```

```Go
const IP_PKTINFO = 0x1a
```

### <a id="IP_PORTRANGE" href="#IP_PORTRANGE">const IP_PORTRANGE</a>

```
searchKey: syscall.IP_PORTRANGE
```

```Go
const IP_PORTRANGE = 0x13
```

### <a id="IP_PORTRANGE_DEFAULT" href="#IP_PORTRANGE_DEFAULT">const IP_PORTRANGE_DEFAULT</a>

```
searchKey: syscall.IP_PORTRANGE_DEFAULT
```

```Go
const IP_PORTRANGE_DEFAULT = 0x0
```

### <a id="IP_PORTRANGE_HIGH" href="#IP_PORTRANGE_HIGH">const IP_PORTRANGE_HIGH</a>

```
searchKey: syscall.IP_PORTRANGE_HIGH
```

```Go
const IP_PORTRANGE_HIGH = 0x1
```

### <a id="IP_PORTRANGE_LOW" href="#IP_PORTRANGE_LOW">const IP_PORTRANGE_LOW</a>

```
searchKey: syscall.IP_PORTRANGE_LOW
```

```Go
const IP_PORTRANGE_LOW = 0x2
```

### <a id="IP_RECVDSTADDR" href="#IP_RECVDSTADDR">const IP_RECVDSTADDR</a>

```
searchKey: syscall.IP_RECVDSTADDR
```

```Go
const IP_RECVDSTADDR = 0x7
```

### <a id="IP_RECVIF" href="#IP_RECVIF">const IP_RECVIF</a>

```
searchKey: syscall.IP_RECVIF
```

```Go
const IP_RECVIF = 0x14
```

### <a id="IP_RECVOPTS" href="#IP_RECVOPTS">const IP_RECVOPTS</a>

```
searchKey: syscall.IP_RECVOPTS
```

```Go
const IP_RECVOPTS = 0x5
```

### <a id="IP_RECVPKTINFO" href="#IP_RECVPKTINFO">const IP_RECVPKTINFO</a>

```
searchKey: syscall.IP_RECVPKTINFO
```

```Go
const IP_RECVPKTINFO = 0x1a
```

### <a id="IP_RECVRETOPTS" href="#IP_RECVRETOPTS">const IP_RECVRETOPTS</a>

```
searchKey: syscall.IP_RECVRETOPTS
```

```Go
const IP_RECVRETOPTS = 0x6
```

### <a id="IP_RECVTTL" href="#IP_RECVTTL">const IP_RECVTTL</a>

```
searchKey: syscall.IP_RECVTTL
```

```Go
const IP_RECVTTL = 0x18
```

### <a id="IP_RETOPTS" href="#IP_RETOPTS">const IP_RETOPTS</a>

```
searchKey: syscall.IP_RETOPTS
```

```Go
const IP_RETOPTS = 0x8
```

### <a id="IP_RF" href="#IP_RF">const IP_RF</a>

```
searchKey: syscall.IP_RF
```

```Go
const IP_RF = 0x8000
```

### <a id="IP_RSVP_OFF" href="#IP_RSVP_OFF">const IP_RSVP_OFF</a>

```
searchKey: syscall.IP_RSVP_OFF
```

```Go
const IP_RSVP_OFF = 0x10
```

### <a id="IP_RSVP_ON" href="#IP_RSVP_ON">const IP_RSVP_ON</a>

```
searchKey: syscall.IP_RSVP_ON
```

```Go
const IP_RSVP_ON = 0xf
```

### <a id="IP_RSVP_VIF_OFF" href="#IP_RSVP_VIF_OFF">const IP_RSVP_VIF_OFF</a>

```
searchKey: syscall.IP_RSVP_VIF_OFF
```

```Go
const IP_RSVP_VIF_OFF = 0x12
```

### <a id="IP_RSVP_VIF_ON" href="#IP_RSVP_VIF_ON">const IP_RSVP_VIF_ON</a>

```
searchKey: syscall.IP_RSVP_VIF_ON
```

```Go
const IP_RSVP_VIF_ON = 0x11
```

### <a id="IP_STRIPHDR" href="#IP_STRIPHDR">const IP_STRIPHDR</a>

```
searchKey: syscall.IP_STRIPHDR
```

```Go
const IP_STRIPHDR = 0x17
```

### <a id="IP_TOS" href="#IP_TOS">const IP_TOS</a>

```
searchKey: syscall.IP_TOS
```

```Go
const IP_TOS = 0x3
```

### <a id="IP_TRAFFIC_MGT_BACKGROUND" href="#IP_TRAFFIC_MGT_BACKGROUND">const IP_TRAFFIC_MGT_BACKGROUND</a>

```
searchKey: syscall.IP_TRAFFIC_MGT_BACKGROUND
```

```Go
const IP_TRAFFIC_MGT_BACKGROUND = 0x41
```

### <a id="IP_TTL" href="#IP_TTL">const IP_TTL</a>

```
searchKey: syscall.IP_TTL
```

```Go
const IP_TTL = 0x4
```

### <a id="IP_UNBLOCK_SOURCE" href="#IP_UNBLOCK_SOURCE">const IP_UNBLOCK_SOURCE</a>

```
searchKey: syscall.IP_UNBLOCK_SOURCE
```

```Go
const IP_UNBLOCK_SOURCE = 0x49
```

### <a id="ISIG" href="#ISIG">const ISIG</a>

```
searchKey: syscall.ISIG
```

```Go
const ISIG = 0x80
```

### <a id="ISTRIP" href="#ISTRIP">const ISTRIP</a>

```
searchKey: syscall.ISTRIP
```

```Go
const ISTRIP = 0x20
```

### <a id="IUTF8" href="#IUTF8">const IUTF8</a>

```
searchKey: syscall.IUTF8
```

```Go
const IUTF8 = 0x4000
```

### <a id="IXANY" href="#IXANY">const IXANY</a>

```
searchKey: syscall.IXANY
```

```Go
const IXANY = 0x800
```

### <a id="IXOFF" href="#IXOFF">const IXOFF</a>

```
searchKey: syscall.IXOFF
```

```Go
const IXOFF = 0x400
```

### <a id="IXON" href="#IXON">const IXON</a>

```
searchKey: syscall.IXON
```

```Go
const IXON = 0x200
```

### <a id="LOCK_EX" href="#LOCK_EX">const LOCK_EX</a>

```
searchKey: syscall.LOCK_EX
```

```Go
const LOCK_EX = 0x2
```

### <a id="LOCK_NB" href="#LOCK_NB">const LOCK_NB</a>

```
searchKey: syscall.LOCK_NB
```

```Go
const LOCK_NB = 0x4
```

### <a id="LOCK_SH" href="#LOCK_SH">const LOCK_SH</a>

```
searchKey: syscall.LOCK_SH
```

```Go
const LOCK_SH = 0x1
```

### <a id="LOCK_UN" href="#LOCK_UN">const LOCK_UN</a>

```
searchKey: syscall.LOCK_UN
```

```Go
const LOCK_UN = 0x8
```

### <a id="MADV_CAN_REUSE" href="#MADV_CAN_REUSE">const MADV_CAN_REUSE</a>

```
searchKey: syscall.MADV_CAN_REUSE
```

```Go
const MADV_CAN_REUSE = 0x9
```

### <a id="MADV_DONTNEED" href="#MADV_DONTNEED">const MADV_DONTNEED</a>

```
searchKey: syscall.MADV_DONTNEED
```

```Go
const MADV_DONTNEED = 0x4
```

### <a id="MADV_FREE" href="#MADV_FREE">const MADV_FREE</a>

```
searchKey: syscall.MADV_FREE
```

```Go
const MADV_FREE = 0x5
```

### <a id="MADV_FREE_REUSABLE" href="#MADV_FREE_REUSABLE">const MADV_FREE_REUSABLE</a>

```
searchKey: syscall.MADV_FREE_REUSABLE
```

```Go
const MADV_FREE_REUSABLE = 0x7
```

### <a id="MADV_FREE_REUSE" href="#MADV_FREE_REUSE">const MADV_FREE_REUSE</a>

```
searchKey: syscall.MADV_FREE_REUSE
```

```Go
const MADV_FREE_REUSE = 0x8
```

### <a id="MADV_NORMAL" href="#MADV_NORMAL">const MADV_NORMAL</a>

```
searchKey: syscall.MADV_NORMAL
```

```Go
const MADV_NORMAL = 0x0
```

### <a id="MADV_RANDOM" href="#MADV_RANDOM">const MADV_RANDOM</a>

```
searchKey: syscall.MADV_RANDOM
```

```Go
const MADV_RANDOM = 0x1
```

### <a id="MADV_SEQUENTIAL" href="#MADV_SEQUENTIAL">const MADV_SEQUENTIAL</a>

```
searchKey: syscall.MADV_SEQUENTIAL
```

```Go
const MADV_SEQUENTIAL = 0x2
```

### <a id="MADV_WILLNEED" href="#MADV_WILLNEED">const MADV_WILLNEED</a>

```
searchKey: syscall.MADV_WILLNEED
```

```Go
const MADV_WILLNEED = 0x3
```

### <a id="MADV_ZERO_WIRED_PAGES" href="#MADV_ZERO_WIRED_PAGES">const MADV_ZERO_WIRED_PAGES</a>

```
searchKey: syscall.MADV_ZERO_WIRED_PAGES
```

```Go
const MADV_ZERO_WIRED_PAGES = 0x6
```

### <a id="MAP_ANON" href="#MAP_ANON">const MAP_ANON</a>

```
searchKey: syscall.MAP_ANON
```

```Go
const MAP_ANON = 0x1000
```

### <a id="MAP_COPY" href="#MAP_COPY">const MAP_COPY</a>

```
searchKey: syscall.MAP_COPY
```

```Go
const MAP_COPY = 0x2
```

### <a id="MAP_FILE" href="#MAP_FILE">const MAP_FILE</a>

```
searchKey: syscall.MAP_FILE
```

```Go
const MAP_FILE = 0x0
```

### <a id="MAP_FIXED" href="#MAP_FIXED">const MAP_FIXED</a>

```
searchKey: syscall.MAP_FIXED
```

```Go
const MAP_FIXED = 0x10
```

### <a id="MAP_HASSEMAPHORE" href="#MAP_HASSEMAPHORE">const MAP_HASSEMAPHORE</a>

```
searchKey: syscall.MAP_HASSEMAPHORE
```

```Go
const MAP_HASSEMAPHORE = 0x200
```

### <a id="MAP_JIT" href="#MAP_JIT">const MAP_JIT</a>

```
searchKey: syscall.MAP_JIT
```

```Go
const MAP_JIT = 0x800
```

### <a id="MAP_NOCACHE" href="#MAP_NOCACHE">const MAP_NOCACHE</a>

```
searchKey: syscall.MAP_NOCACHE
```

```Go
const MAP_NOCACHE = 0x400
```

### <a id="MAP_NOEXTEND" href="#MAP_NOEXTEND">const MAP_NOEXTEND</a>

```
searchKey: syscall.MAP_NOEXTEND
```

```Go
const MAP_NOEXTEND = 0x100
```

### <a id="MAP_NORESERVE" href="#MAP_NORESERVE">const MAP_NORESERVE</a>

```
searchKey: syscall.MAP_NORESERVE
```

```Go
const MAP_NORESERVE = 0x40
```

### <a id="MAP_PRIVATE" href="#MAP_PRIVATE">const MAP_PRIVATE</a>

```
searchKey: syscall.MAP_PRIVATE
```

```Go
const MAP_PRIVATE = 0x2
```

### <a id="MAP_RENAME" href="#MAP_RENAME">const MAP_RENAME</a>

```
searchKey: syscall.MAP_RENAME
```

```Go
const MAP_RENAME = 0x20
```

### <a id="MAP_RESERVED0080" href="#MAP_RESERVED0080">const MAP_RESERVED0080</a>

```
searchKey: syscall.MAP_RESERVED0080
```

```Go
const MAP_RESERVED0080 = 0x80
```

### <a id="MAP_SHARED" href="#MAP_SHARED">const MAP_SHARED</a>

```
searchKey: syscall.MAP_SHARED
```

```Go
const MAP_SHARED = 0x1
```

### <a id="MCL_CURRENT" href="#MCL_CURRENT">const MCL_CURRENT</a>

```
searchKey: syscall.MCL_CURRENT
```

```Go
const MCL_CURRENT = 0x1
```

### <a id="MCL_FUTURE" href="#MCL_FUTURE">const MCL_FUTURE</a>

```
searchKey: syscall.MCL_FUTURE
```

```Go
const MCL_FUTURE = 0x2
```

### <a id="MSG_CTRUNC" href="#MSG_CTRUNC">const MSG_CTRUNC</a>

```
searchKey: syscall.MSG_CTRUNC
```

```Go
const MSG_CTRUNC = 0x20
```

### <a id="MSG_DONTROUTE" href="#MSG_DONTROUTE">const MSG_DONTROUTE</a>

```
searchKey: syscall.MSG_DONTROUTE
```

```Go
const MSG_DONTROUTE = 0x4
```

### <a id="MSG_DONTWAIT" href="#MSG_DONTWAIT">const MSG_DONTWAIT</a>

```
searchKey: syscall.MSG_DONTWAIT
```

```Go
const MSG_DONTWAIT = 0x80
```

### <a id="MSG_EOF" href="#MSG_EOF">const MSG_EOF</a>

```
searchKey: syscall.MSG_EOF
```

```Go
const MSG_EOF = 0x100
```

### <a id="MSG_EOR" href="#MSG_EOR">const MSG_EOR</a>

```
searchKey: syscall.MSG_EOR
```

```Go
const MSG_EOR = 0x8
```

### <a id="MSG_FLUSH" href="#MSG_FLUSH">const MSG_FLUSH</a>

```
searchKey: syscall.MSG_FLUSH
```

```Go
const MSG_FLUSH = 0x400
```

### <a id="MSG_HAVEMORE" href="#MSG_HAVEMORE">const MSG_HAVEMORE</a>

```
searchKey: syscall.MSG_HAVEMORE
```

```Go
const MSG_HAVEMORE = 0x2000
```

### <a id="MSG_HOLD" href="#MSG_HOLD">const MSG_HOLD</a>

```
searchKey: syscall.MSG_HOLD
```

```Go
const MSG_HOLD = 0x800
```

### <a id="MSG_NEEDSA" href="#MSG_NEEDSA">const MSG_NEEDSA</a>

```
searchKey: syscall.MSG_NEEDSA
```

```Go
const MSG_NEEDSA = 0x10000
```

### <a id="MSG_OOB" href="#MSG_OOB">const MSG_OOB</a>

```
searchKey: syscall.MSG_OOB
```

```Go
const MSG_OOB = 0x1
```

### <a id="MSG_PEEK" href="#MSG_PEEK">const MSG_PEEK</a>

```
searchKey: syscall.MSG_PEEK
```

```Go
const MSG_PEEK = 0x2
```

### <a id="MSG_RCVMORE" href="#MSG_RCVMORE">const MSG_RCVMORE</a>

```
searchKey: syscall.MSG_RCVMORE
```

```Go
const MSG_RCVMORE = 0x4000
```

### <a id="MSG_SEND" href="#MSG_SEND">const MSG_SEND</a>

```
searchKey: syscall.MSG_SEND
```

```Go
const MSG_SEND = 0x1000
```

### <a id="MSG_TRUNC" href="#MSG_TRUNC">const MSG_TRUNC</a>

```
searchKey: syscall.MSG_TRUNC
```

```Go
const MSG_TRUNC = 0x10
```

### <a id="MSG_WAITALL" href="#MSG_WAITALL">const MSG_WAITALL</a>

```
searchKey: syscall.MSG_WAITALL
```

```Go
const MSG_WAITALL = 0x40
```

### <a id="MSG_WAITSTREAM" href="#MSG_WAITSTREAM">const MSG_WAITSTREAM</a>

```
searchKey: syscall.MSG_WAITSTREAM
```

```Go
const MSG_WAITSTREAM = 0x200
```

### <a id="MS_ASYNC" href="#MS_ASYNC">const MS_ASYNC</a>

```
searchKey: syscall.MS_ASYNC
```

```Go
const MS_ASYNC = 0x1
```

### <a id="MS_DEACTIVATE" href="#MS_DEACTIVATE">const MS_DEACTIVATE</a>

```
searchKey: syscall.MS_DEACTIVATE
```

```Go
const MS_DEACTIVATE = 0x8
```

### <a id="MS_INVALIDATE" href="#MS_INVALIDATE">const MS_INVALIDATE</a>

```
searchKey: syscall.MS_INVALIDATE
```

```Go
const MS_INVALIDATE = 0x2
```

### <a id="MS_KILLPAGES" href="#MS_KILLPAGES">const MS_KILLPAGES</a>

```
searchKey: syscall.MS_KILLPAGES
```

```Go
const MS_KILLPAGES = 0x4
```

### <a id="MS_SYNC" href="#MS_SYNC">const MS_SYNC</a>

```
searchKey: syscall.MS_SYNC
```

```Go
const MS_SYNC = 0x10
```

### <a id="NAME_MAX" href="#NAME_MAX">const NAME_MAX</a>

```
searchKey: syscall.NAME_MAX
```

```Go
const NAME_MAX = 0xff
```

### <a id="NET_RT_DUMP" href="#NET_RT_DUMP">const NET_RT_DUMP</a>

```
searchKey: syscall.NET_RT_DUMP
```

```Go
const NET_RT_DUMP = 0x1
```

### <a id="NET_RT_DUMP2" href="#NET_RT_DUMP2">const NET_RT_DUMP2</a>

```
searchKey: syscall.NET_RT_DUMP2
```

```Go
const NET_RT_DUMP2 = 0x7
```

### <a id="NET_RT_FLAGS" href="#NET_RT_FLAGS">const NET_RT_FLAGS</a>

```
searchKey: syscall.NET_RT_FLAGS
```

```Go
const NET_RT_FLAGS = 0x2
```

### <a id="NET_RT_IFLIST" href="#NET_RT_IFLIST">const NET_RT_IFLIST</a>

```
searchKey: syscall.NET_RT_IFLIST
```

```Go
const NET_RT_IFLIST = 0x3
```

### <a id="NET_RT_IFLIST2" href="#NET_RT_IFLIST2">const NET_RT_IFLIST2</a>

```
searchKey: syscall.NET_RT_IFLIST2
```

```Go
const NET_RT_IFLIST2 = 0x6
```

### <a id="NET_RT_MAXID" href="#NET_RT_MAXID">const NET_RT_MAXID</a>

```
searchKey: syscall.NET_RT_MAXID
```

```Go
const NET_RT_MAXID = 0xa
```

### <a id="NET_RT_STAT" href="#NET_RT_STAT">const NET_RT_STAT</a>

```
searchKey: syscall.NET_RT_STAT
```

```Go
const NET_RT_STAT = 0x4
```

### <a id="NET_RT_TRASH" href="#NET_RT_TRASH">const NET_RT_TRASH</a>

```
searchKey: syscall.NET_RT_TRASH
```

```Go
const NET_RT_TRASH = 0x5
```

### <a id="NOFLSH" href="#NOFLSH">const NOFLSH</a>

```
searchKey: syscall.NOFLSH
```

```Go
const NOFLSH = 0x80000000
```

### <a id="NOTE_ABSOLUTE" href="#NOTE_ABSOLUTE">const NOTE_ABSOLUTE</a>

```
searchKey: syscall.NOTE_ABSOLUTE
```

```Go
const NOTE_ABSOLUTE = 0x8
```

### <a id="NOTE_ATTRIB" href="#NOTE_ATTRIB">const NOTE_ATTRIB</a>

```
searchKey: syscall.NOTE_ATTRIB
```

```Go
const NOTE_ATTRIB = 0x8
```

### <a id="NOTE_CHILD" href="#NOTE_CHILD">const NOTE_CHILD</a>

```
searchKey: syscall.NOTE_CHILD
```

```Go
const NOTE_CHILD = 0x4
```

### <a id="NOTE_DELETE" href="#NOTE_DELETE">const NOTE_DELETE</a>

```
searchKey: syscall.NOTE_DELETE
```

```Go
const NOTE_DELETE = 0x1
```

### <a id="NOTE_EXEC" href="#NOTE_EXEC">const NOTE_EXEC</a>

```
searchKey: syscall.NOTE_EXEC
```

```Go
const NOTE_EXEC = 0x20000000
```

### <a id="NOTE_EXIT" href="#NOTE_EXIT">const NOTE_EXIT</a>

```
searchKey: syscall.NOTE_EXIT
```

```Go
const NOTE_EXIT = 0x80000000
```

### <a id="NOTE_EXITSTATUS" href="#NOTE_EXITSTATUS">const NOTE_EXITSTATUS</a>

```
searchKey: syscall.NOTE_EXITSTATUS
```

```Go
const NOTE_EXITSTATUS = 0x4000000
```

### <a id="NOTE_EXTEND" href="#NOTE_EXTEND">const NOTE_EXTEND</a>

```
searchKey: syscall.NOTE_EXTEND
```

```Go
const NOTE_EXTEND = 0x4
```

### <a id="NOTE_FFAND" href="#NOTE_FFAND">const NOTE_FFAND</a>

```
searchKey: syscall.NOTE_FFAND
```

```Go
const NOTE_FFAND = 0x40000000
```

### <a id="NOTE_FFCOPY" href="#NOTE_FFCOPY">const NOTE_FFCOPY</a>

```
searchKey: syscall.NOTE_FFCOPY
```

```Go
const NOTE_FFCOPY = 0xc0000000
```

### <a id="NOTE_FFCTRLMASK" href="#NOTE_FFCTRLMASK">const NOTE_FFCTRLMASK</a>

```
searchKey: syscall.NOTE_FFCTRLMASK
```

```Go
const NOTE_FFCTRLMASK = 0xc0000000
```

### <a id="NOTE_FFLAGSMASK" href="#NOTE_FFLAGSMASK">const NOTE_FFLAGSMASK</a>

```
searchKey: syscall.NOTE_FFLAGSMASK
```

```Go
const NOTE_FFLAGSMASK = 0xffffff
```

### <a id="NOTE_FFNOP" href="#NOTE_FFNOP">const NOTE_FFNOP</a>

```
searchKey: syscall.NOTE_FFNOP
```

```Go
const NOTE_FFNOP = 0x0
```

### <a id="NOTE_FFOR" href="#NOTE_FFOR">const NOTE_FFOR</a>

```
searchKey: syscall.NOTE_FFOR
```

```Go
const NOTE_FFOR = 0x80000000
```

### <a id="NOTE_FORK" href="#NOTE_FORK">const NOTE_FORK</a>

```
searchKey: syscall.NOTE_FORK
```

```Go
const NOTE_FORK = 0x40000000
```

### <a id="NOTE_LINK" href="#NOTE_LINK">const NOTE_LINK</a>

```
searchKey: syscall.NOTE_LINK
```

```Go
const NOTE_LINK = 0x10
```

### <a id="NOTE_LOWAT" href="#NOTE_LOWAT">const NOTE_LOWAT</a>

```
searchKey: syscall.NOTE_LOWAT
```

```Go
const NOTE_LOWAT = 0x1
```

### <a id="NOTE_NONE" href="#NOTE_NONE">const NOTE_NONE</a>

```
searchKey: syscall.NOTE_NONE
```

```Go
const NOTE_NONE = 0x80
```

### <a id="NOTE_NSECONDS" href="#NOTE_NSECONDS">const NOTE_NSECONDS</a>

```
searchKey: syscall.NOTE_NSECONDS
```

```Go
const NOTE_NSECONDS = 0x4
```

### <a id="NOTE_PCTRLMASK" href="#NOTE_PCTRLMASK">const NOTE_PCTRLMASK</a>

```
searchKey: syscall.NOTE_PCTRLMASK
```

```Go
const NOTE_PCTRLMASK = -0x100000
```

### <a id="NOTE_PDATAMASK" href="#NOTE_PDATAMASK">const NOTE_PDATAMASK</a>

```
searchKey: syscall.NOTE_PDATAMASK
```

```Go
const NOTE_PDATAMASK = 0xfffff
```

### <a id="NOTE_REAP" href="#NOTE_REAP">const NOTE_REAP</a>

```
searchKey: syscall.NOTE_REAP
```

```Go
const NOTE_REAP = 0x10000000
```

### <a id="NOTE_RENAME" href="#NOTE_RENAME">const NOTE_RENAME</a>

```
searchKey: syscall.NOTE_RENAME
```

```Go
const NOTE_RENAME = 0x20
```

### <a id="NOTE_RESOURCEEND" href="#NOTE_RESOURCEEND">const NOTE_RESOURCEEND</a>

```
searchKey: syscall.NOTE_RESOURCEEND
```

```Go
const NOTE_RESOURCEEND = 0x2000000
```

### <a id="NOTE_REVOKE" href="#NOTE_REVOKE">const NOTE_REVOKE</a>

```
searchKey: syscall.NOTE_REVOKE
```

```Go
const NOTE_REVOKE = 0x40
```

### <a id="NOTE_SECONDS" href="#NOTE_SECONDS">const NOTE_SECONDS</a>

```
searchKey: syscall.NOTE_SECONDS
```

```Go
const NOTE_SECONDS = 0x1
```

### <a id="NOTE_SIGNAL" href="#NOTE_SIGNAL">const NOTE_SIGNAL</a>

```
searchKey: syscall.NOTE_SIGNAL
```

```Go
const NOTE_SIGNAL = 0x8000000
```

### <a id="NOTE_TRACK" href="#NOTE_TRACK">const NOTE_TRACK</a>

```
searchKey: syscall.NOTE_TRACK
```

```Go
const NOTE_TRACK = 0x1
```

### <a id="NOTE_TRACKERR" href="#NOTE_TRACKERR">const NOTE_TRACKERR</a>

```
searchKey: syscall.NOTE_TRACKERR
```

```Go
const NOTE_TRACKERR = 0x2
```

### <a id="NOTE_TRIGGER" href="#NOTE_TRIGGER">const NOTE_TRIGGER</a>

```
searchKey: syscall.NOTE_TRIGGER
```

```Go
const NOTE_TRIGGER = 0x1000000
```

### <a id="NOTE_USECONDS" href="#NOTE_USECONDS">const NOTE_USECONDS</a>

```
searchKey: syscall.NOTE_USECONDS
```

```Go
const NOTE_USECONDS = 0x2
```

### <a id="NOTE_VM_ERROR" href="#NOTE_VM_ERROR">const NOTE_VM_ERROR</a>

```
searchKey: syscall.NOTE_VM_ERROR
```

```Go
const NOTE_VM_ERROR = 0x10000000
```

### <a id="NOTE_VM_PRESSURE" href="#NOTE_VM_PRESSURE">const NOTE_VM_PRESSURE</a>

```
searchKey: syscall.NOTE_VM_PRESSURE
```

```Go
const NOTE_VM_PRESSURE = 0x80000000
```

### <a id="NOTE_VM_PRESSURE_SUDDEN_TERMINATE" href="#NOTE_VM_PRESSURE_SUDDEN_TERMINATE">const NOTE_VM_PRESSURE_SUDDEN_TERMINATE</a>

```
searchKey: syscall.NOTE_VM_PRESSURE_SUDDEN_TERMINATE
```

```Go
const NOTE_VM_PRESSURE_SUDDEN_TERMINATE = 0x20000000
```

### <a id="NOTE_VM_PRESSURE_TERMINATE" href="#NOTE_VM_PRESSURE_TERMINATE">const NOTE_VM_PRESSURE_TERMINATE</a>

```
searchKey: syscall.NOTE_VM_PRESSURE_TERMINATE
```

```Go
const NOTE_VM_PRESSURE_TERMINATE = 0x40000000
```

### <a id="NOTE_WRITE" href="#NOTE_WRITE">const NOTE_WRITE</a>

```
searchKey: syscall.NOTE_WRITE
```

```Go
const NOTE_WRITE = 0x2
```

### <a id="OCRNL" href="#OCRNL">const OCRNL</a>

```
searchKey: syscall.OCRNL
```

```Go
const OCRNL = 0x10
```

### <a id="OFDEL" href="#OFDEL">const OFDEL</a>

```
searchKey: syscall.OFDEL
```

```Go
const OFDEL = 0x20000
```

### <a id="OFILL" href="#OFILL">const OFILL</a>

```
searchKey: syscall.OFILL
```

```Go
const OFILL = 0x80
```

### <a id="ONLCR" href="#ONLCR">const ONLCR</a>

```
searchKey: syscall.ONLCR
```

```Go
const ONLCR = 0x2
```

### <a id="ONLRET" href="#ONLRET">const ONLRET</a>

```
searchKey: syscall.ONLRET
```

```Go
const ONLRET = 0x40
```

### <a id="ONOCR" href="#ONOCR">const ONOCR</a>

```
searchKey: syscall.ONOCR
```

```Go
const ONOCR = 0x20
```

### <a id="ONOEOT" href="#ONOEOT">const ONOEOT</a>

```
searchKey: syscall.ONOEOT
```

```Go
const ONOEOT = 0x8
```

### <a id="OPOST" href="#OPOST">const OPOST</a>

```
searchKey: syscall.OPOST
```

```Go
const OPOST = 0x1
```

### <a id="O_ACCMODE" href="#O_ACCMODE">const O_ACCMODE</a>

```
searchKey: syscall.O_ACCMODE
```

```Go
const O_ACCMODE = 0x3
```

### <a id="O_ALERT" href="#O_ALERT">const O_ALERT</a>

```
searchKey: syscall.O_ALERT
```

```Go
const O_ALERT = 0x20000000
```

### <a id="O_APPEND" href="#O_APPEND">const O_APPEND</a>

```
searchKey: syscall.O_APPEND
```

```Go
const O_APPEND = 0x8
```

### <a id="O_ASYNC" href="#O_ASYNC">const O_ASYNC</a>

```
searchKey: syscall.O_ASYNC
```

```Go
const O_ASYNC = 0x40
```

### <a id="O_CLOEXEC" href="#O_CLOEXEC">const O_CLOEXEC</a>

```
searchKey: syscall.O_CLOEXEC
```

```Go
const O_CLOEXEC = 0x1000000
```

### <a id="O_CREAT" href="#O_CREAT">const O_CREAT</a>

```
searchKey: syscall.O_CREAT
```

```Go
const O_CREAT = 0x200
```

### <a id="O_DIRECTORY" href="#O_DIRECTORY">const O_DIRECTORY</a>

```
searchKey: syscall.O_DIRECTORY
```

```Go
const O_DIRECTORY = 0x100000
```

### <a id="O_DSYNC" href="#O_DSYNC">const O_DSYNC</a>

```
searchKey: syscall.O_DSYNC
```

```Go
const O_DSYNC = 0x400000
```

### <a id="O_EVTONLY" href="#O_EVTONLY">const O_EVTONLY</a>

```
searchKey: syscall.O_EVTONLY
```

```Go
const O_EVTONLY = 0x8000
```

### <a id="O_EXCL" href="#O_EXCL">const O_EXCL</a>

```
searchKey: syscall.O_EXCL
```

```Go
const O_EXCL = 0x800
```

### <a id="O_EXLOCK" href="#O_EXLOCK">const O_EXLOCK</a>

```
searchKey: syscall.O_EXLOCK
```

```Go
const O_EXLOCK = 0x20
```

### <a id="O_FSYNC" href="#O_FSYNC">const O_FSYNC</a>

```
searchKey: syscall.O_FSYNC
```

```Go
const O_FSYNC = 0x80
```

### <a id="O_NDELAY" href="#O_NDELAY">const O_NDELAY</a>

```
searchKey: syscall.O_NDELAY
```

```Go
const O_NDELAY = 0x4
```

### <a id="O_NOCTTY" href="#O_NOCTTY">const O_NOCTTY</a>

```
searchKey: syscall.O_NOCTTY
```

```Go
const O_NOCTTY = 0x20000
```

### <a id="O_NOFOLLOW" href="#O_NOFOLLOW">const O_NOFOLLOW</a>

```
searchKey: syscall.O_NOFOLLOW
```

```Go
const O_NOFOLLOW = 0x100
```

### <a id="O_NONBLOCK" href="#O_NONBLOCK">const O_NONBLOCK</a>

```
searchKey: syscall.O_NONBLOCK
```

```Go
const O_NONBLOCK = 0x4
```

### <a id="O_POPUP" href="#O_POPUP">const O_POPUP</a>

```
searchKey: syscall.O_POPUP
```

```Go
const O_POPUP = 0x80000000
```

### <a id="O_RDONLY" href="#O_RDONLY">const O_RDONLY</a>

```
searchKey: syscall.O_RDONLY
```

```Go
const O_RDONLY = 0x0
```

### <a id="O_RDWR" href="#O_RDWR">const O_RDWR</a>

```
searchKey: syscall.O_RDWR
```

```Go
const O_RDWR = 0x2
```

### <a id="O_SHLOCK" href="#O_SHLOCK">const O_SHLOCK</a>

```
searchKey: syscall.O_SHLOCK
```

```Go
const O_SHLOCK = 0x10
```

### <a id="O_SYMLINK" href="#O_SYMLINK">const O_SYMLINK</a>

```
searchKey: syscall.O_SYMLINK
```

```Go
const O_SYMLINK = 0x200000
```

### <a id="O_SYNC" href="#O_SYNC">const O_SYNC</a>

```
searchKey: syscall.O_SYNC
```

```Go
const O_SYNC = 0x80
```

### <a id="O_TRUNC" href="#O_TRUNC">const O_TRUNC</a>

```
searchKey: syscall.O_TRUNC
```

```Go
const O_TRUNC = 0x400
```

### <a id="O_WRONLY" href="#O_WRONLY">const O_WRONLY</a>

```
searchKey: syscall.O_WRONLY
```

```Go
const O_WRONLY = 0x1
```

### <a id="PARENB" href="#PARENB">const PARENB</a>

```
searchKey: syscall.PARENB
```

```Go
const PARENB = 0x1000
```

### <a id="PARMRK" href="#PARMRK">const PARMRK</a>

```
searchKey: syscall.PARMRK
```

```Go
const PARMRK = 0x8
```

### <a id="PARODD" href="#PARODD">const PARODD</a>

```
searchKey: syscall.PARODD
```

```Go
const PARODD = 0x2000
```

### <a id="PENDIN" href="#PENDIN">const PENDIN</a>

```
searchKey: syscall.PENDIN
```

```Go
const PENDIN = 0x20000000
```

### <a id="PRIO_PGRP" href="#PRIO_PGRP">const PRIO_PGRP</a>

```
searchKey: syscall.PRIO_PGRP
```

```Go
const PRIO_PGRP = 0x1
```

### <a id="PRIO_PROCESS" href="#PRIO_PROCESS">const PRIO_PROCESS</a>

```
searchKey: syscall.PRIO_PROCESS
```

```Go
const PRIO_PROCESS = 0x0
```

### <a id="PRIO_USER" href="#PRIO_USER">const PRIO_USER</a>

```
searchKey: syscall.PRIO_USER
```

```Go
const PRIO_USER = 0x2
```

### <a id="PROT_EXEC" href="#PROT_EXEC">const PROT_EXEC</a>

```
searchKey: syscall.PROT_EXEC
```

```Go
const PROT_EXEC = 0x4
```

### <a id="PROT_NONE" href="#PROT_NONE">const PROT_NONE</a>

```
searchKey: syscall.PROT_NONE
```

```Go
const PROT_NONE = 0x0
```

### <a id="PROT_READ" href="#PROT_READ">const PROT_READ</a>

```
searchKey: syscall.PROT_READ
```

```Go
const PROT_READ = 0x1
```

### <a id="PROT_WRITE" href="#PROT_WRITE">const PROT_WRITE</a>

```
searchKey: syscall.PROT_WRITE
```

```Go
const PROT_WRITE = 0x2
```

### <a id="PT_ATTACH" href="#PT_ATTACH">const PT_ATTACH</a>

```
searchKey: syscall.PT_ATTACH
```

```Go
const PT_ATTACH = 0xa
```

### <a id="PT_ATTACHEXC" href="#PT_ATTACHEXC">const PT_ATTACHEXC</a>

```
searchKey: syscall.PT_ATTACHEXC
```

```Go
const PT_ATTACHEXC = 0xe
```

### <a id="PT_CONTINUE" href="#PT_CONTINUE">const PT_CONTINUE</a>

```
searchKey: syscall.PT_CONTINUE
```

```Go
const PT_CONTINUE = 0x7
```

### <a id="PT_DENY_ATTACH" href="#PT_DENY_ATTACH">const PT_DENY_ATTACH</a>

```
searchKey: syscall.PT_DENY_ATTACH
```

```Go
const PT_DENY_ATTACH = 0x1f
```

### <a id="PT_DETACH" href="#PT_DETACH">const PT_DETACH</a>

```
searchKey: syscall.PT_DETACH
```

```Go
const PT_DETACH = 0xb
```

### <a id="PT_FIRSTMACH" href="#PT_FIRSTMACH">const PT_FIRSTMACH</a>

```
searchKey: syscall.PT_FIRSTMACH
```

```Go
const PT_FIRSTMACH = 0x20
```

### <a id="PT_FORCEQUOTA" href="#PT_FORCEQUOTA">const PT_FORCEQUOTA</a>

```
searchKey: syscall.PT_FORCEQUOTA
```

```Go
const PT_FORCEQUOTA = 0x1e
```

### <a id="PT_KILL" href="#PT_KILL">const PT_KILL</a>

```
searchKey: syscall.PT_KILL
```

```Go
const PT_KILL = 0x8
```

### <a id="PT_READ_D" href="#PT_READ_D">const PT_READ_D</a>

```
searchKey: syscall.PT_READ_D
```

```Go
const PT_READ_D = 0x2
```

### <a id="PT_READ_I" href="#PT_READ_I">const PT_READ_I</a>

```
searchKey: syscall.PT_READ_I
```

```Go
const PT_READ_I = 0x1
```

### <a id="PT_READ_U" href="#PT_READ_U">const PT_READ_U</a>

```
searchKey: syscall.PT_READ_U
```

```Go
const PT_READ_U = 0x3
```

### <a id="PT_SIGEXC" href="#PT_SIGEXC">const PT_SIGEXC</a>

```
searchKey: syscall.PT_SIGEXC
```

```Go
const PT_SIGEXC = 0xc
```

### <a id="PT_STEP" href="#PT_STEP">const PT_STEP</a>

```
searchKey: syscall.PT_STEP
```

```Go
const PT_STEP = 0x9
```

### <a id="PT_THUPDATE" href="#PT_THUPDATE">const PT_THUPDATE</a>

```
searchKey: syscall.PT_THUPDATE
```

```Go
const PT_THUPDATE = 0xd
```

### <a id="PT_TRACE_ME" href="#PT_TRACE_ME">const PT_TRACE_ME</a>

```
searchKey: syscall.PT_TRACE_ME
```

```Go
const PT_TRACE_ME = 0x0
```

### <a id="PT_WRITE_D" href="#PT_WRITE_D">const PT_WRITE_D</a>

```
searchKey: syscall.PT_WRITE_D
```

```Go
const PT_WRITE_D = 0x5
```

### <a id="PT_WRITE_I" href="#PT_WRITE_I">const PT_WRITE_I</a>

```
searchKey: syscall.PT_WRITE_I
```

```Go
const PT_WRITE_I = 0x4
```

### <a id="PT_WRITE_U" href="#PT_WRITE_U">const PT_WRITE_U</a>

```
searchKey: syscall.PT_WRITE_U
```

```Go
const PT_WRITE_U = 0x6
```

### <a id="RLIMIT_AS" href="#RLIMIT_AS">const RLIMIT_AS</a>

```
searchKey: syscall.RLIMIT_AS
```

```Go
const RLIMIT_AS = 0x5
```

### <a id="RLIMIT_CORE" href="#RLIMIT_CORE">const RLIMIT_CORE</a>

```
searchKey: syscall.RLIMIT_CORE
```

```Go
const RLIMIT_CORE = 0x4
```

### <a id="RLIMIT_CPU" href="#RLIMIT_CPU">const RLIMIT_CPU</a>

```
searchKey: syscall.RLIMIT_CPU
```

```Go
const RLIMIT_CPU = 0x0
```

### <a id="RLIMIT_DATA" href="#RLIMIT_DATA">const RLIMIT_DATA</a>

```
searchKey: syscall.RLIMIT_DATA
```

```Go
const RLIMIT_DATA = 0x2
```

### <a id="RLIMIT_FSIZE" href="#RLIMIT_FSIZE">const RLIMIT_FSIZE</a>

```
searchKey: syscall.RLIMIT_FSIZE
```

```Go
const RLIMIT_FSIZE = 0x1
```

### <a id="RLIMIT_NOFILE" href="#RLIMIT_NOFILE">const RLIMIT_NOFILE</a>

```
searchKey: syscall.RLIMIT_NOFILE
```

```Go
const RLIMIT_NOFILE = 0x8
```

### <a id="RLIMIT_STACK" href="#RLIMIT_STACK">const RLIMIT_STACK</a>

```
searchKey: syscall.RLIMIT_STACK
```

```Go
const RLIMIT_STACK = 0x3
```

### <a id="RLIM_INFINITY" href="#RLIM_INFINITY">const RLIM_INFINITY</a>

```
searchKey: syscall.RLIM_INFINITY
```

```Go
const RLIM_INFINITY = 0x7fffffffffffffff
```

### <a id="RTAX_AUTHOR" href="#RTAX_AUTHOR">const RTAX_AUTHOR</a>

```
searchKey: syscall.RTAX_AUTHOR
```

```Go
const RTAX_AUTHOR = 0x6
```

### <a id="RTAX_BRD" href="#RTAX_BRD">const RTAX_BRD</a>

```
searchKey: syscall.RTAX_BRD
```

```Go
const RTAX_BRD = 0x7
```

### <a id="RTAX_DST" href="#RTAX_DST">const RTAX_DST</a>

```
searchKey: syscall.RTAX_DST
```

```Go
const RTAX_DST = 0x0
```

### <a id="RTAX_GATEWAY" href="#RTAX_GATEWAY">const RTAX_GATEWAY</a>

```
searchKey: syscall.RTAX_GATEWAY
```

```Go
const RTAX_GATEWAY = 0x1
```

### <a id="RTAX_GENMASK" href="#RTAX_GENMASK">const RTAX_GENMASK</a>

```
searchKey: syscall.RTAX_GENMASK
```

```Go
const RTAX_GENMASK = 0x3
```

### <a id="RTAX_IFA" href="#RTAX_IFA">const RTAX_IFA</a>

```
searchKey: syscall.RTAX_IFA
```

```Go
const RTAX_IFA = 0x5
```

### <a id="RTAX_IFP" href="#RTAX_IFP">const RTAX_IFP</a>

```
searchKey: syscall.RTAX_IFP
```

```Go
const RTAX_IFP = 0x4
```

### <a id="RTAX_MAX" href="#RTAX_MAX">const RTAX_MAX</a>

```
searchKey: syscall.RTAX_MAX
```

```Go
const RTAX_MAX = 0x8
```

### <a id="RTAX_NETMASK" href="#RTAX_NETMASK">const RTAX_NETMASK</a>

```
searchKey: syscall.RTAX_NETMASK
```

```Go
const RTAX_NETMASK = 0x2
```

### <a id="RTA_AUTHOR" href="#RTA_AUTHOR">const RTA_AUTHOR</a>

```
searchKey: syscall.RTA_AUTHOR
```

```Go
const RTA_AUTHOR = 0x40
```

### <a id="RTA_BRD" href="#RTA_BRD">const RTA_BRD</a>

```
searchKey: syscall.RTA_BRD
```

```Go
const RTA_BRD = 0x80
```

### <a id="RTA_DST" href="#RTA_DST">const RTA_DST</a>

```
searchKey: syscall.RTA_DST
```

```Go
const RTA_DST = 0x1
```

### <a id="RTA_GATEWAY" href="#RTA_GATEWAY">const RTA_GATEWAY</a>

```
searchKey: syscall.RTA_GATEWAY
```

```Go
const RTA_GATEWAY = 0x2
```

### <a id="RTA_GENMASK" href="#RTA_GENMASK">const RTA_GENMASK</a>

```
searchKey: syscall.RTA_GENMASK
```

```Go
const RTA_GENMASK = 0x8
```

### <a id="RTA_IFA" href="#RTA_IFA">const RTA_IFA</a>

```
searchKey: syscall.RTA_IFA
```

```Go
const RTA_IFA = 0x20
```

### <a id="RTA_IFP" href="#RTA_IFP">const RTA_IFP</a>

```
searchKey: syscall.RTA_IFP
```

```Go
const RTA_IFP = 0x10
```

### <a id="RTA_NETMASK" href="#RTA_NETMASK">const RTA_NETMASK</a>

```
searchKey: syscall.RTA_NETMASK
```

```Go
const RTA_NETMASK = 0x4
```

### <a id="RTF_BLACKHOLE" href="#RTF_BLACKHOLE">const RTF_BLACKHOLE</a>

```
searchKey: syscall.RTF_BLACKHOLE
```

```Go
const RTF_BLACKHOLE = 0x1000
```

### <a id="RTF_BROADCAST" href="#RTF_BROADCAST">const RTF_BROADCAST</a>

```
searchKey: syscall.RTF_BROADCAST
```

```Go
const RTF_BROADCAST = 0x400000
```

### <a id="RTF_CLONING" href="#RTF_CLONING">const RTF_CLONING</a>

```
searchKey: syscall.RTF_CLONING
```

```Go
const RTF_CLONING = 0x100
```

### <a id="RTF_CONDEMNED" href="#RTF_CONDEMNED">const RTF_CONDEMNED</a>

```
searchKey: syscall.RTF_CONDEMNED
```

```Go
const RTF_CONDEMNED = 0x2000000
```

### <a id="RTF_DELCLONE" href="#RTF_DELCLONE">const RTF_DELCLONE</a>

```
searchKey: syscall.RTF_DELCLONE
```

```Go
const RTF_DELCLONE = 0x80
```

### <a id="RTF_DONE" href="#RTF_DONE">const RTF_DONE</a>

```
searchKey: syscall.RTF_DONE
```

```Go
const RTF_DONE = 0x40
```

### <a id="RTF_DYNAMIC" href="#RTF_DYNAMIC">const RTF_DYNAMIC</a>

```
searchKey: syscall.RTF_DYNAMIC
```

```Go
const RTF_DYNAMIC = 0x10
```

### <a id="RTF_GATEWAY" href="#RTF_GATEWAY">const RTF_GATEWAY</a>

```
searchKey: syscall.RTF_GATEWAY
```

```Go
const RTF_GATEWAY = 0x2
```

### <a id="RTF_HOST" href="#RTF_HOST">const RTF_HOST</a>

```
searchKey: syscall.RTF_HOST
```

```Go
const RTF_HOST = 0x4
```

### <a id="RTF_IFREF" href="#RTF_IFREF">const RTF_IFREF</a>

```
searchKey: syscall.RTF_IFREF
```

```Go
const RTF_IFREF = 0x4000000
```

### <a id="RTF_IFSCOPE" href="#RTF_IFSCOPE">const RTF_IFSCOPE</a>

```
searchKey: syscall.RTF_IFSCOPE
```

```Go
const RTF_IFSCOPE = 0x1000000
```

### <a id="RTF_LLINFO" href="#RTF_LLINFO">const RTF_LLINFO</a>

```
searchKey: syscall.RTF_LLINFO
```

```Go
const RTF_LLINFO = 0x400
```

### <a id="RTF_LOCAL" href="#RTF_LOCAL">const RTF_LOCAL</a>

```
searchKey: syscall.RTF_LOCAL
```

```Go
const RTF_LOCAL = 0x200000
```

### <a id="RTF_MODIFIED" href="#RTF_MODIFIED">const RTF_MODIFIED</a>

```
searchKey: syscall.RTF_MODIFIED
```

```Go
const RTF_MODIFIED = 0x20
```

### <a id="RTF_MULTICAST" href="#RTF_MULTICAST">const RTF_MULTICAST</a>

```
searchKey: syscall.RTF_MULTICAST
```

```Go
const RTF_MULTICAST = 0x800000
```

### <a id="RTF_PINNED" href="#RTF_PINNED">const RTF_PINNED</a>

```
searchKey: syscall.RTF_PINNED
```

```Go
const RTF_PINNED = 0x100000
```

### <a id="RTF_PRCLONING" href="#RTF_PRCLONING">const RTF_PRCLONING</a>

```
searchKey: syscall.RTF_PRCLONING
```

```Go
const RTF_PRCLONING = 0x10000
```

### <a id="RTF_PROTO1" href="#RTF_PROTO1">const RTF_PROTO1</a>

```
searchKey: syscall.RTF_PROTO1
```

```Go
const RTF_PROTO1 = 0x8000
```

### <a id="RTF_PROTO2" href="#RTF_PROTO2">const RTF_PROTO2</a>

```
searchKey: syscall.RTF_PROTO2
```

```Go
const RTF_PROTO2 = 0x4000
```

### <a id="RTF_PROTO3" href="#RTF_PROTO3">const RTF_PROTO3</a>

```
searchKey: syscall.RTF_PROTO3
```

```Go
const RTF_PROTO3 = 0x40000
```

### <a id="RTF_REJECT" href="#RTF_REJECT">const RTF_REJECT</a>

```
searchKey: syscall.RTF_REJECT
```

```Go
const RTF_REJECT = 0x8
```

### <a id="RTF_STATIC" href="#RTF_STATIC">const RTF_STATIC</a>

```
searchKey: syscall.RTF_STATIC
```

```Go
const RTF_STATIC = 0x800
```

### <a id="RTF_UP" href="#RTF_UP">const RTF_UP</a>

```
searchKey: syscall.RTF_UP
```

```Go
const RTF_UP = 0x1
```

### <a id="RTF_WASCLONED" href="#RTF_WASCLONED">const RTF_WASCLONED</a>

```
searchKey: syscall.RTF_WASCLONED
```

```Go
const RTF_WASCLONED = 0x20000
```

### <a id="RTF_XRESOLVE" href="#RTF_XRESOLVE">const RTF_XRESOLVE</a>

```
searchKey: syscall.RTF_XRESOLVE
```

```Go
const RTF_XRESOLVE = 0x200
```

### <a id="RTM_ADD" href="#RTM_ADD">const RTM_ADD</a>

```
searchKey: syscall.RTM_ADD
```

```Go
const RTM_ADD = 0x1
```

### <a id="RTM_CHANGE" href="#RTM_CHANGE">const RTM_CHANGE</a>

```
searchKey: syscall.RTM_CHANGE
```

```Go
const RTM_CHANGE = 0x3
```

### <a id="RTM_DELADDR" href="#RTM_DELADDR">const RTM_DELADDR</a>

```
searchKey: syscall.RTM_DELADDR
```

```Go
const RTM_DELADDR = 0xd
```

### <a id="RTM_DELETE" href="#RTM_DELETE">const RTM_DELETE</a>

```
searchKey: syscall.RTM_DELETE
```

```Go
const RTM_DELETE = 0x2
```

### <a id="RTM_DELMADDR" href="#RTM_DELMADDR">const RTM_DELMADDR</a>

```
searchKey: syscall.RTM_DELMADDR
```

```Go
const RTM_DELMADDR = 0x10
```

### <a id="RTM_GET" href="#RTM_GET">const RTM_GET</a>

```
searchKey: syscall.RTM_GET
```

```Go
const RTM_GET = 0x4
```

### <a id="RTM_GET2" href="#RTM_GET2">const RTM_GET2</a>

```
searchKey: syscall.RTM_GET2
```

```Go
const RTM_GET2 = 0x14
```

### <a id="RTM_IFINFO" href="#RTM_IFINFO">const RTM_IFINFO</a>

```
searchKey: syscall.RTM_IFINFO
```

```Go
const RTM_IFINFO = 0xe
```

### <a id="RTM_IFINFO2" href="#RTM_IFINFO2">const RTM_IFINFO2</a>

```
searchKey: syscall.RTM_IFINFO2
```

```Go
const RTM_IFINFO2 = 0x12
```

### <a id="RTM_LOCK" href="#RTM_LOCK">const RTM_LOCK</a>

```
searchKey: syscall.RTM_LOCK
```

```Go
const RTM_LOCK = 0x8
```

### <a id="RTM_LOSING" href="#RTM_LOSING">const RTM_LOSING</a>

```
searchKey: syscall.RTM_LOSING
```

```Go
const RTM_LOSING = 0x5
```

### <a id="RTM_MISS" href="#RTM_MISS">const RTM_MISS</a>

```
searchKey: syscall.RTM_MISS
```

```Go
const RTM_MISS = 0x7
```

### <a id="RTM_NEWADDR" href="#RTM_NEWADDR">const RTM_NEWADDR</a>

```
searchKey: syscall.RTM_NEWADDR
```

```Go
const RTM_NEWADDR = 0xc
```

### <a id="RTM_NEWMADDR" href="#RTM_NEWMADDR">const RTM_NEWMADDR</a>

```
searchKey: syscall.RTM_NEWMADDR
```

```Go
const RTM_NEWMADDR = 0xf
```

### <a id="RTM_NEWMADDR2" href="#RTM_NEWMADDR2">const RTM_NEWMADDR2</a>

```
searchKey: syscall.RTM_NEWMADDR2
```

```Go
const RTM_NEWMADDR2 = 0x13
```

### <a id="RTM_OLDADD" href="#RTM_OLDADD">const RTM_OLDADD</a>

```
searchKey: syscall.RTM_OLDADD
```

```Go
const RTM_OLDADD = 0x9
```

### <a id="RTM_OLDDEL" href="#RTM_OLDDEL">const RTM_OLDDEL</a>

```
searchKey: syscall.RTM_OLDDEL
```

```Go
const RTM_OLDDEL = 0xa
```

### <a id="RTM_REDIRECT" href="#RTM_REDIRECT">const RTM_REDIRECT</a>

```
searchKey: syscall.RTM_REDIRECT
```

```Go
const RTM_REDIRECT = 0x6
```

### <a id="RTM_RESOLVE" href="#RTM_RESOLVE">const RTM_RESOLVE</a>

```
searchKey: syscall.RTM_RESOLVE
```

```Go
const RTM_RESOLVE = 0xb
```

### <a id="RTM_RTTUNIT" href="#RTM_RTTUNIT">const RTM_RTTUNIT</a>

```
searchKey: syscall.RTM_RTTUNIT
```

```Go
const RTM_RTTUNIT = 0xf4240
```

### <a id="RTM_VERSION" href="#RTM_VERSION">const RTM_VERSION</a>

```
searchKey: syscall.RTM_VERSION
```

```Go
const RTM_VERSION = 0x5
```

### <a id="RTV_EXPIRE" href="#RTV_EXPIRE">const RTV_EXPIRE</a>

```
searchKey: syscall.RTV_EXPIRE
```

```Go
const RTV_EXPIRE = 0x4
```

### <a id="RTV_HOPCOUNT" href="#RTV_HOPCOUNT">const RTV_HOPCOUNT</a>

```
searchKey: syscall.RTV_HOPCOUNT
```

```Go
const RTV_HOPCOUNT = 0x2
```

### <a id="RTV_MTU" href="#RTV_MTU">const RTV_MTU</a>

```
searchKey: syscall.RTV_MTU
```

```Go
const RTV_MTU = 0x1
```

### <a id="RTV_RPIPE" href="#RTV_RPIPE">const RTV_RPIPE</a>

```
searchKey: syscall.RTV_RPIPE
```

```Go
const RTV_RPIPE = 0x8
```

### <a id="RTV_RTT" href="#RTV_RTT">const RTV_RTT</a>

```
searchKey: syscall.RTV_RTT
```

```Go
const RTV_RTT = 0x40
```

### <a id="RTV_RTTVAR" href="#RTV_RTTVAR">const RTV_RTTVAR</a>

```
searchKey: syscall.RTV_RTTVAR
```

```Go
const RTV_RTTVAR = 0x80
```

### <a id="RTV_SPIPE" href="#RTV_SPIPE">const RTV_SPIPE</a>

```
searchKey: syscall.RTV_SPIPE
```

```Go
const RTV_SPIPE = 0x10
```

### <a id="RTV_SSTHRESH" href="#RTV_SSTHRESH">const RTV_SSTHRESH</a>

```
searchKey: syscall.RTV_SSTHRESH
```

```Go
const RTV_SSTHRESH = 0x20
```

### <a id="RUSAGE_CHILDREN" href="#RUSAGE_CHILDREN">const RUSAGE_CHILDREN</a>

```
searchKey: syscall.RUSAGE_CHILDREN
```

```Go
const RUSAGE_CHILDREN = -0x1
```

### <a id="RUSAGE_SELF" href="#RUSAGE_SELF">const RUSAGE_SELF</a>

```
searchKey: syscall.RUSAGE_SELF
```

```Go
const RUSAGE_SELF = 0x0
```

### <a id="SCM_CREDS" href="#SCM_CREDS">const SCM_CREDS</a>

```
searchKey: syscall.SCM_CREDS
```

```Go
const SCM_CREDS = 0x3
```

### <a id="SCM_RIGHTS" href="#SCM_RIGHTS">const SCM_RIGHTS</a>

```
searchKey: syscall.SCM_RIGHTS
```

```Go
const SCM_RIGHTS = 0x1
```

### <a id="SCM_TIMESTAMP" href="#SCM_TIMESTAMP">const SCM_TIMESTAMP</a>

```
searchKey: syscall.SCM_TIMESTAMP
```

```Go
const SCM_TIMESTAMP = 0x2
```

### <a id="SCM_TIMESTAMP_MONOTONIC" href="#SCM_TIMESTAMP_MONOTONIC">const SCM_TIMESTAMP_MONOTONIC</a>

```
searchKey: syscall.SCM_TIMESTAMP_MONOTONIC
```

```Go
const SCM_TIMESTAMP_MONOTONIC = 0x4
```

### <a id="SHUT_RD" href="#SHUT_RD">const SHUT_RD</a>

```
searchKey: syscall.SHUT_RD
```

```Go
const SHUT_RD = 0x0
```

### <a id="SHUT_RDWR" href="#SHUT_RDWR">const SHUT_RDWR</a>

```
searchKey: syscall.SHUT_RDWR
```

```Go
const SHUT_RDWR = 0x2
```

### <a id="SHUT_WR" href="#SHUT_WR">const SHUT_WR</a>

```
searchKey: syscall.SHUT_WR
```

```Go
const SHUT_WR = 0x1
```

### <a id="SIOCADDMULTI" href="#SIOCADDMULTI">const SIOCADDMULTI</a>

```
searchKey: syscall.SIOCADDMULTI
```

```Go
const SIOCADDMULTI = 0x80206931
```

### <a id="SIOCAIFADDR" href="#SIOCAIFADDR">const SIOCAIFADDR</a>

```
searchKey: syscall.SIOCAIFADDR
```

```Go
const SIOCAIFADDR = 0x8040691a
```

### <a id="SIOCALIFADDR" href="#SIOCALIFADDR">const SIOCALIFADDR</a>

```
searchKey: syscall.SIOCALIFADDR
```

```Go
const SIOCALIFADDR = 0x8118691d
```

### <a id="SIOCARPIPLL" href="#SIOCARPIPLL">const SIOCARPIPLL</a>

```
searchKey: syscall.SIOCARPIPLL
```

```Go
const SIOCARPIPLL = 0xc0206928
```

### <a id="SIOCATMARK" href="#SIOCATMARK">const SIOCATMARK</a>

```
searchKey: syscall.SIOCATMARK
```

```Go
const SIOCATMARK = 0x40047307
```

### <a id="SIOCAUTOADDR" href="#SIOCAUTOADDR">const SIOCAUTOADDR</a>

```
searchKey: syscall.SIOCAUTOADDR
```

```Go
const SIOCAUTOADDR = 0xc0206926
```

### <a id="SIOCAUTONETMASK" href="#SIOCAUTONETMASK">const SIOCAUTONETMASK</a>

```
searchKey: syscall.SIOCAUTONETMASK
```

```Go
const SIOCAUTONETMASK = 0x80206927
```

### <a id="SIOCDELMULTI" href="#SIOCDELMULTI">const SIOCDELMULTI</a>

```
searchKey: syscall.SIOCDELMULTI
```

```Go
const SIOCDELMULTI = 0x80206932
```

### <a id="SIOCDIFADDR" href="#SIOCDIFADDR">const SIOCDIFADDR</a>

```
searchKey: syscall.SIOCDIFADDR
```

```Go
const SIOCDIFADDR = 0x80206919
```

### <a id="SIOCDIFPHYADDR" href="#SIOCDIFPHYADDR">const SIOCDIFPHYADDR</a>

```
searchKey: syscall.SIOCDIFPHYADDR
```

```Go
const SIOCDIFPHYADDR = 0x80206941
```

### <a id="SIOCDLIFADDR" href="#SIOCDLIFADDR">const SIOCDLIFADDR</a>

```
searchKey: syscall.SIOCDLIFADDR
```

```Go
const SIOCDLIFADDR = 0x8118691f
```

### <a id="SIOCGDRVSPEC" href="#SIOCGDRVSPEC">const SIOCGDRVSPEC</a>

```
searchKey: syscall.SIOCGDRVSPEC
```

```Go
const SIOCGDRVSPEC = 0xc028697b
```

### <a id="SIOCGETSGCNT" href="#SIOCGETSGCNT">const SIOCGETSGCNT</a>

```
searchKey: syscall.SIOCGETSGCNT
```

```Go
const SIOCGETSGCNT = 0xc014721c
```

### <a id="SIOCGETVIFCNT" href="#SIOCGETVIFCNT">const SIOCGETVIFCNT</a>

```
searchKey: syscall.SIOCGETVIFCNT
```

```Go
const SIOCGETVIFCNT = 0xc014721b
```

### <a id="SIOCGETVLAN" href="#SIOCGETVLAN">const SIOCGETVLAN</a>

```
searchKey: syscall.SIOCGETVLAN
```

```Go
const SIOCGETVLAN = 0xc020697f
```

### <a id="SIOCGHIWAT" href="#SIOCGHIWAT">const SIOCGHIWAT</a>

```
searchKey: syscall.SIOCGHIWAT
```

```Go
const SIOCGHIWAT = 0x40047301
```

### <a id="SIOCGIFADDR" href="#SIOCGIFADDR">const SIOCGIFADDR</a>

```
searchKey: syscall.SIOCGIFADDR
```

```Go
const SIOCGIFADDR = 0xc0206921
```

### <a id="SIOCGIFALTMTU" href="#SIOCGIFALTMTU">const SIOCGIFALTMTU</a>

```
searchKey: syscall.SIOCGIFALTMTU
```

```Go
const SIOCGIFALTMTU = 0xc0206948
```

### <a id="SIOCGIFASYNCMAP" href="#SIOCGIFASYNCMAP">const SIOCGIFASYNCMAP</a>

```
searchKey: syscall.SIOCGIFASYNCMAP
```

```Go
const SIOCGIFASYNCMAP = 0xc020697c
```

### <a id="SIOCGIFBOND" href="#SIOCGIFBOND">const SIOCGIFBOND</a>

```
searchKey: syscall.SIOCGIFBOND
```

```Go
const SIOCGIFBOND = 0xc0206947
```

### <a id="SIOCGIFBRDADDR" href="#SIOCGIFBRDADDR">const SIOCGIFBRDADDR</a>

```
searchKey: syscall.SIOCGIFBRDADDR
```

```Go
const SIOCGIFBRDADDR = 0xc0206923
```

### <a id="SIOCGIFCAP" href="#SIOCGIFCAP">const SIOCGIFCAP</a>

```
searchKey: syscall.SIOCGIFCAP
```

```Go
const SIOCGIFCAP = 0xc020695b
```

### <a id="SIOCGIFCONF" href="#SIOCGIFCONF">const SIOCGIFCONF</a>

```
searchKey: syscall.SIOCGIFCONF
```

```Go
const SIOCGIFCONF = 0xc00c6924
```

### <a id="SIOCGIFDEVMTU" href="#SIOCGIFDEVMTU">const SIOCGIFDEVMTU</a>

```
searchKey: syscall.SIOCGIFDEVMTU
```

```Go
const SIOCGIFDEVMTU = 0xc0206944
```

### <a id="SIOCGIFDSTADDR" href="#SIOCGIFDSTADDR">const SIOCGIFDSTADDR</a>

```
searchKey: syscall.SIOCGIFDSTADDR
```

```Go
const SIOCGIFDSTADDR = 0xc0206922
```

### <a id="SIOCGIFFLAGS" href="#SIOCGIFFLAGS">const SIOCGIFFLAGS</a>

```
searchKey: syscall.SIOCGIFFLAGS
```

```Go
const SIOCGIFFLAGS = 0xc0206911
```

### <a id="SIOCGIFGENERIC" href="#SIOCGIFGENERIC">const SIOCGIFGENERIC</a>

```
searchKey: syscall.SIOCGIFGENERIC
```

```Go
const SIOCGIFGENERIC = 0xc020693a
```

### <a id="SIOCGIFKPI" href="#SIOCGIFKPI">const SIOCGIFKPI</a>

```
searchKey: syscall.SIOCGIFKPI
```

```Go
const SIOCGIFKPI = 0xc0206987
```

### <a id="SIOCGIFMAC" href="#SIOCGIFMAC">const SIOCGIFMAC</a>

```
searchKey: syscall.SIOCGIFMAC
```

```Go
const SIOCGIFMAC = 0xc0206982
```

### <a id="SIOCGIFMEDIA" href="#SIOCGIFMEDIA">const SIOCGIFMEDIA</a>

```
searchKey: syscall.SIOCGIFMEDIA
```

```Go
const SIOCGIFMEDIA = 0xc02c6938
```

### <a id="SIOCGIFMETRIC" href="#SIOCGIFMETRIC">const SIOCGIFMETRIC</a>

```
searchKey: syscall.SIOCGIFMETRIC
```

```Go
const SIOCGIFMETRIC = 0xc0206917
```

### <a id="SIOCGIFMTU" href="#SIOCGIFMTU">const SIOCGIFMTU</a>

```
searchKey: syscall.SIOCGIFMTU
```

```Go
const SIOCGIFMTU = 0xc0206933
```

### <a id="SIOCGIFNETMASK" href="#SIOCGIFNETMASK">const SIOCGIFNETMASK</a>

```
searchKey: syscall.SIOCGIFNETMASK
```

```Go
const SIOCGIFNETMASK = 0xc0206925
```

### <a id="SIOCGIFPDSTADDR" href="#SIOCGIFPDSTADDR">const SIOCGIFPDSTADDR</a>

```
searchKey: syscall.SIOCGIFPDSTADDR
```

```Go
const SIOCGIFPDSTADDR = 0xc0206940
```

### <a id="SIOCGIFPHYS" href="#SIOCGIFPHYS">const SIOCGIFPHYS</a>

```
searchKey: syscall.SIOCGIFPHYS
```

```Go
const SIOCGIFPHYS = 0xc0206935
```

### <a id="SIOCGIFPSRCADDR" href="#SIOCGIFPSRCADDR">const SIOCGIFPSRCADDR</a>

```
searchKey: syscall.SIOCGIFPSRCADDR
```

```Go
const SIOCGIFPSRCADDR = 0xc020693f
```

### <a id="SIOCGIFSTATUS" href="#SIOCGIFSTATUS">const SIOCGIFSTATUS</a>

```
searchKey: syscall.SIOCGIFSTATUS
```

```Go
const SIOCGIFSTATUS = 0xc331693d
```

### <a id="SIOCGIFVLAN" href="#SIOCGIFVLAN">const SIOCGIFVLAN</a>

```
searchKey: syscall.SIOCGIFVLAN
```

```Go
const SIOCGIFVLAN = 0xc020697f
```

### <a id="SIOCGIFWAKEFLAGS" href="#SIOCGIFWAKEFLAGS">const SIOCGIFWAKEFLAGS</a>

```
searchKey: syscall.SIOCGIFWAKEFLAGS
```

```Go
const SIOCGIFWAKEFLAGS = 0xc0206988
```

### <a id="SIOCGLIFADDR" href="#SIOCGLIFADDR">const SIOCGLIFADDR</a>

```
searchKey: syscall.SIOCGLIFADDR
```

```Go
const SIOCGLIFADDR = 0xc118691e
```

### <a id="SIOCGLIFPHYADDR" href="#SIOCGLIFPHYADDR">const SIOCGLIFPHYADDR</a>

```
searchKey: syscall.SIOCGLIFPHYADDR
```

```Go
const SIOCGLIFPHYADDR = 0xc1186943
```

### <a id="SIOCGLOWAT" href="#SIOCGLOWAT">const SIOCGLOWAT</a>

```
searchKey: syscall.SIOCGLOWAT
```

```Go
const SIOCGLOWAT = 0x40047303
```

### <a id="SIOCGPGRP" href="#SIOCGPGRP">const SIOCGPGRP</a>

```
searchKey: syscall.SIOCGPGRP
```

```Go
const SIOCGPGRP = 0x40047309
```

### <a id="SIOCIFCREATE" href="#SIOCIFCREATE">const SIOCIFCREATE</a>

```
searchKey: syscall.SIOCIFCREATE
```

```Go
const SIOCIFCREATE = 0xc0206978
```

### <a id="SIOCIFCREATE2" href="#SIOCIFCREATE2">const SIOCIFCREATE2</a>

```
searchKey: syscall.SIOCIFCREATE2
```

```Go
const SIOCIFCREATE2 = 0xc020697a
```

### <a id="SIOCIFDESTROY" href="#SIOCIFDESTROY">const SIOCIFDESTROY</a>

```
searchKey: syscall.SIOCIFDESTROY
```

```Go
const SIOCIFDESTROY = 0x80206979
```

### <a id="SIOCRSLVMULTI" href="#SIOCRSLVMULTI">const SIOCRSLVMULTI</a>

```
searchKey: syscall.SIOCRSLVMULTI
```

```Go
const SIOCRSLVMULTI = 0xc010693b
```

### <a id="SIOCSDRVSPEC" href="#SIOCSDRVSPEC">const SIOCSDRVSPEC</a>

```
searchKey: syscall.SIOCSDRVSPEC
```

```Go
const SIOCSDRVSPEC = 0x8028697b
```

### <a id="SIOCSETVLAN" href="#SIOCSETVLAN">const SIOCSETVLAN</a>

```
searchKey: syscall.SIOCSETVLAN
```

```Go
const SIOCSETVLAN = 0x8020697e
```

### <a id="SIOCSHIWAT" href="#SIOCSHIWAT">const SIOCSHIWAT</a>

```
searchKey: syscall.SIOCSHIWAT
```

```Go
const SIOCSHIWAT = 0x80047300
```

### <a id="SIOCSIFADDR" href="#SIOCSIFADDR">const SIOCSIFADDR</a>

```
searchKey: syscall.SIOCSIFADDR
```

```Go
const SIOCSIFADDR = 0x8020690c
```

### <a id="SIOCSIFALTMTU" href="#SIOCSIFALTMTU">const SIOCSIFALTMTU</a>

```
searchKey: syscall.SIOCSIFALTMTU
```

```Go
const SIOCSIFALTMTU = 0x80206945
```

### <a id="SIOCSIFASYNCMAP" href="#SIOCSIFASYNCMAP">const SIOCSIFASYNCMAP</a>

```
searchKey: syscall.SIOCSIFASYNCMAP
```

```Go
const SIOCSIFASYNCMAP = 0x8020697d
```

### <a id="SIOCSIFBOND" href="#SIOCSIFBOND">const SIOCSIFBOND</a>

```
searchKey: syscall.SIOCSIFBOND
```

```Go
const SIOCSIFBOND = 0x80206946
```

### <a id="SIOCSIFBRDADDR" href="#SIOCSIFBRDADDR">const SIOCSIFBRDADDR</a>

```
searchKey: syscall.SIOCSIFBRDADDR
```

```Go
const SIOCSIFBRDADDR = 0x80206913
```

### <a id="SIOCSIFCAP" href="#SIOCSIFCAP">const SIOCSIFCAP</a>

```
searchKey: syscall.SIOCSIFCAP
```

```Go
const SIOCSIFCAP = 0x8020695a
```

### <a id="SIOCSIFDSTADDR" href="#SIOCSIFDSTADDR">const SIOCSIFDSTADDR</a>

```
searchKey: syscall.SIOCSIFDSTADDR
```

```Go
const SIOCSIFDSTADDR = 0x8020690e
```

### <a id="SIOCSIFFLAGS" href="#SIOCSIFFLAGS">const SIOCSIFFLAGS</a>

```
searchKey: syscall.SIOCSIFFLAGS
```

```Go
const SIOCSIFFLAGS = 0x80206910
```

### <a id="SIOCSIFGENERIC" href="#SIOCSIFGENERIC">const SIOCSIFGENERIC</a>

```
searchKey: syscall.SIOCSIFGENERIC
```

```Go
const SIOCSIFGENERIC = 0x80206939
```

### <a id="SIOCSIFKPI" href="#SIOCSIFKPI">const SIOCSIFKPI</a>

```
searchKey: syscall.SIOCSIFKPI
```

```Go
const SIOCSIFKPI = 0x80206986
```

### <a id="SIOCSIFLLADDR" href="#SIOCSIFLLADDR">const SIOCSIFLLADDR</a>

```
searchKey: syscall.SIOCSIFLLADDR
```

```Go
const SIOCSIFLLADDR = 0x8020693c
```

### <a id="SIOCSIFMAC" href="#SIOCSIFMAC">const SIOCSIFMAC</a>

```
searchKey: syscall.SIOCSIFMAC
```

```Go
const SIOCSIFMAC = 0x80206983
```

### <a id="SIOCSIFMEDIA" href="#SIOCSIFMEDIA">const SIOCSIFMEDIA</a>

```
searchKey: syscall.SIOCSIFMEDIA
```

```Go
const SIOCSIFMEDIA = 0xc0206937
```

### <a id="SIOCSIFMETRIC" href="#SIOCSIFMETRIC">const SIOCSIFMETRIC</a>

```
searchKey: syscall.SIOCSIFMETRIC
```

```Go
const SIOCSIFMETRIC = 0x80206918
```

### <a id="SIOCSIFMTU" href="#SIOCSIFMTU">const SIOCSIFMTU</a>

```
searchKey: syscall.SIOCSIFMTU
```

```Go
const SIOCSIFMTU = 0x80206934
```

### <a id="SIOCSIFNETMASK" href="#SIOCSIFNETMASK">const SIOCSIFNETMASK</a>

```
searchKey: syscall.SIOCSIFNETMASK
```

```Go
const SIOCSIFNETMASK = 0x80206916
```

### <a id="SIOCSIFPHYADDR" href="#SIOCSIFPHYADDR">const SIOCSIFPHYADDR</a>

```
searchKey: syscall.SIOCSIFPHYADDR
```

```Go
const SIOCSIFPHYADDR = 0x8040693e
```

### <a id="SIOCSIFPHYS" href="#SIOCSIFPHYS">const SIOCSIFPHYS</a>

```
searchKey: syscall.SIOCSIFPHYS
```

```Go
const SIOCSIFPHYS = 0x80206936
```

### <a id="SIOCSIFVLAN" href="#SIOCSIFVLAN">const SIOCSIFVLAN</a>

```
searchKey: syscall.SIOCSIFVLAN
```

```Go
const SIOCSIFVLAN = 0x8020697e
```

### <a id="SIOCSLIFPHYADDR" href="#SIOCSLIFPHYADDR">const SIOCSLIFPHYADDR</a>

```
searchKey: syscall.SIOCSLIFPHYADDR
```

```Go
const SIOCSLIFPHYADDR = 0x81186942
```

### <a id="SIOCSLOWAT" href="#SIOCSLOWAT">const SIOCSLOWAT</a>

```
searchKey: syscall.SIOCSLOWAT
```

```Go
const SIOCSLOWAT = 0x80047302
```

### <a id="SIOCSPGRP" href="#SIOCSPGRP">const SIOCSPGRP</a>

```
searchKey: syscall.SIOCSPGRP
```

```Go
const SIOCSPGRP = 0x80047308
```

### <a id="SOCK_DGRAM" href="#SOCK_DGRAM">const SOCK_DGRAM</a>

```
searchKey: syscall.SOCK_DGRAM
```

```Go
const SOCK_DGRAM = 0x2
```

### <a id="SOCK_MAXADDRLEN" href="#SOCK_MAXADDRLEN">const SOCK_MAXADDRLEN</a>

```
searchKey: syscall.SOCK_MAXADDRLEN
```

```Go
const SOCK_MAXADDRLEN = 0xff
```

### <a id="SOCK_RAW" href="#SOCK_RAW">const SOCK_RAW</a>

```
searchKey: syscall.SOCK_RAW
```

```Go
const SOCK_RAW = 0x3
```

### <a id="SOCK_RDM" href="#SOCK_RDM">const SOCK_RDM</a>

```
searchKey: syscall.SOCK_RDM
```

```Go
const SOCK_RDM = 0x4
```

### <a id="SOCK_SEQPACKET" href="#SOCK_SEQPACKET">const SOCK_SEQPACKET</a>

```
searchKey: syscall.SOCK_SEQPACKET
```

```Go
const SOCK_SEQPACKET = 0x5
```

### <a id="SOCK_STREAM" href="#SOCK_STREAM">const SOCK_STREAM</a>

```
searchKey: syscall.SOCK_STREAM
```

```Go
const SOCK_STREAM = 0x1
```

### <a id="SOL_SOCKET" href="#SOL_SOCKET">const SOL_SOCKET</a>

```
searchKey: syscall.SOL_SOCKET
```

```Go
const SOL_SOCKET = 0xffff
```

### <a id="SOMAXCONN" href="#SOMAXCONN">const SOMAXCONN</a>

```
searchKey: syscall.SOMAXCONN
```

```Go
const SOMAXCONN = 0x80
```

### <a id="SO_ACCEPTCONN" href="#SO_ACCEPTCONN">const SO_ACCEPTCONN</a>

```
searchKey: syscall.SO_ACCEPTCONN
```

```Go
const SO_ACCEPTCONN = 0x2
```

### <a id="SO_BROADCAST" href="#SO_BROADCAST">const SO_BROADCAST</a>

```
searchKey: syscall.SO_BROADCAST
```

```Go
const SO_BROADCAST = 0x20
```

### <a id="SO_DEBUG" href="#SO_DEBUG">const SO_DEBUG</a>

```
searchKey: syscall.SO_DEBUG
```

```Go
const SO_DEBUG = 0x1
```

### <a id="SO_DONTROUTE" href="#SO_DONTROUTE">const SO_DONTROUTE</a>

```
searchKey: syscall.SO_DONTROUTE
```

```Go
const SO_DONTROUTE = 0x10
```

### <a id="SO_DONTTRUNC" href="#SO_DONTTRUNC">const SO_DONTTRUNC</a>

```
searchKey: syscall.SO_DONTTRUNC
```

```Go
const SO_DONTTRUNC = 0x2000
```

### <a id="SO_ERROR" href="#SO_ERROR">const SO_ERROR</a>

```
searchKey: syscall.SO_ERROR
```

```Go
const SO_ERROR = 0x1007
```

### <a id="SO_KEEPALIVE" href="#SO_KEEPALIVE">const SO_KEEPALIVE</a>

```
searchKey: syscall.SO_KEEPALIVE
```

```Go
const SO_KEEPALIVE = 0x8
```

### <a id="SO_LABEL" href="#SO_LABEL">const SO_LABEL</a>

```
searchKey: syscall.SO_LABEL
```

```Go
const SO_LABEL = 0x1010
```

### <a id="SO_LINGER" href="#SO_LINGER">const SO_LINGER</a>

```
searchKey: syscall.SO_LINGER
```

```Go
const SO_LINGER = 0x80
```

### <a id="SO_LINGER_SEC" href="#SO_LINGER_SEC">const SO_LINGER_SEC</a>

```
searchKey: syscall.SO_LINGER_SEC
```

```Go
const SO_LINGER_SEC = 0x1080
```

### <a id="SO_NKE" href="#SO_NKE">const SO_NKE</a>

```
searchKey: syscall.SO_NKE
```

```Go
const SO_NKE = 0x1021
```

### <a id="SO_NOADDRERR" href="#SO_NOADDRERR">const SO_NOADDRERR</a>

```
searchKey: syscall.SO_NOADDRERR
```

```Go
const SO_NOADDRERR = 0x1023
```

### <a id="SO_NOSIGPIPE" href="#SO_NOSIGPIPE">const SO_NOSIGPIPE</a>

```
searchKey: syscall.SO_NOSIGPIPE
```

```Go
const SO_NOSIGPIPE = 0x1022
```

### <a id="SO_NOTIFYCONFLICT" href="#SO_NOTIFYCONFLICT">const SO_NOTIFYCONFLICT</a>

```
searchKey: syscall.SO_NOTIFYCONFLICT
```

```Go
const SO_NOTIFYCONFLICT = 0x1026
```

### <a id="SO_NP_EXTENSIONS" href="#SO_NP_EXTENSIONS">const SO_NP_EXTENSIONS</a>

```
searchKey: syscall.SO_NP_EXTENSIONS
```

```Go
const SO_NP_EXTENSIONS = 0x1083
```

### <a id="SO_NREAD" href="#SO_NREAD">const SO_NREAD</a>

```
searchKey: syscall.SO_NREAD
```

```Go
const SO_NREAD = 0x1020
```

### <a id="SO_NWRITE" href="#SO_NWRITE">const SO_NWRITE</a>

```
searchKey: syscall.SO_NWRITE
```

```Go
const SO_NWRITE = 0x1024
```

### <a id="SO_OOBINLINE" href="#SO_OOBINLINE">const SO_OOBINLINE</a>

```
searchKey: syscall.SO_OOBINLINE
```

```Go
const SO_OOBINLINE = 0x100
```

### <a id="SO_PEERLABEL" href="#SO_PEERLABEL">const SO_PEERLABEL</a>

```
searchKey: syscall.SO_PEERLABEL
```

```Go
const SO_PEERLABEL = 0x1011
```

### <a id="SO_RANDOMPORT" href="#SO_RANDOMPORT">const SO_RANDOMPORT</a>

```
searchKey: syscall.SO_RANDOMPORT
```

```Go
const SO_RANDOMPORT = 0x1082
```

### <a id="SO_RCVBUF" href="#SO_RCVBUF">const SO_RCVBUF</a>

```
searchKey: syscall.SO_RCVBUF
```

```Go
const SO_RCVBUF = 0x1002
```

### <a id="SO_RCVLOWAT" href="#SO_RCVLOWAT">const SO_RCVLOWAT</a>

```
searchKey: syscall.SO_RCVLOWAT
```

```Go
const SO_RCVLOWAT = 0x1004
```

### <a id="SO_RCVTIMEO" href="#SO_RCVTIMEO">const SO_RCVTIMEO</a>

```
searchKey: syscall.SO_RCVTIMEO
```

```Go
const SO_RCVTIMEO = 0x1006
```

### <a id="SO_RESTRICTIONS" href="#SO_RESTRICTIONS">const SO_RESTRICTIONS</a>

```
searchKey: syscall.SO_RESTRICTIONS
```

```Go
const SO_RESTRICTIONS = 0x1081
```

### <a id="SO_RESTRICT_DENYIN" href="#SO_RESTRICT_DENYIN">const SO_RESTRICT_DENYIN</a>

```
searchKey: syscall.SO_RESTRICT_DENYIN
```

```Go
const SO_RESTRICT_DENYIN = 0x1
```

### <a id="SO_RESTRICT_DENYOUT" href="#SO_RESTRICT_DENYOUT">const SO_RESTRICT_DENYOUT</a>

```
searchKey: syscall.SO_RESTRICT_DENYOUT
```

```Go
const SO_RESTRICT_DENYOUT = 0x2
```

### <a id="SO_RESTRICT_DENYSET" href="#SO_RESTRICT_DENYSET">const SO_RESTRICT_DENYSET</a>

```
searchKey: syscall.SO_RESTRICT_DENYSET
```

```Go
const SO_RESTRICT_DENYSET = 0x80000000
```

### <a id="SO_REUSEADDR" href="#SO_REUSEADDR">const SO_REUSEADDR</a>

```
searchKey: syscall.SO_REUSEADDR
```

```Go
const SO_REUSEADDR = 0x4
```

### <a id="SO_REUSEPORT" href="#SO_REUSEPORT">const SO_REUSEPORT</a>

```
searchKey: syscall.SO_REUSEPORT
```

```Go
const SO_REUSEPORT = 0x200
```

### <a id="SO_REUSESHAREUID" href="#SO_REUSESHAREUID">const SO_REUSESHAREUID</a>

```
searchKey: syscall.SO_REUSESHAREUID
```

```Go
const SO_REUSESHAREUID = 0x1025
```

### <a id="SO_SNDBUF" href="#SO_SNDBUF">const SO_SNDBUF</a>

```
searchKey: syscall.SO_SNDBUF
```

```Go
const SO_SNDBUF = 0x1001
```

### <a id="SO_SNDLOWAT" href="#SO_SNDLOWAT">const SO_SNDLOWAT</a>

```
searchKey: syscall.SO_SNDLOWAT
```

```Go
const SO_SNDLOWAT = 0x1003
```

### <a id="SO_SNDTIMEO" href="#SO_SNDTIMEO">const SO_SNDTIMEO</a>

```
searchKey: syscall.SO_SNDTIMEO
```

```Go
const SO_SNDTIMEO = 0x1005
```

### <a id="SO_TIMESTAMP" href="#SO_TIMESTAMP">const SO_TIMESTAMP</a>

```
searchKey: syscall.SO_TIMESTAMP
```

```Go
const SO_TIMESTAMP = 0x400
```

### <a id="SO_TIMESTAMP_MONOTONIC" href="#SO_TIMESTAMP_MONOTONIC">const SO_TIMESTAMP_MONOTONIC</a>

```
searchKey: syscall.SO_TIMESTAMP_MONOTONIC
```

```Go
const SO_TIMESTAMP_MONOTONIC = 0x800
```

### <a id="SO_TYPE" href="#SO_TYPE">const SO_TYPE</a>

```
searchKey: syscall.SO_TYPE
```

```Go
const SO_TYPE = 0x1008
```

### <a id="SO_UPCALLCLOSEWAIT" href="#SO_UPCALLCLOSEWAIT">const SO_UPCALLCLOSEWAIT</a>

```
searchKey: syscall.SO_UPCALLCLOSEWAIT
```

```Go
const SO_UPCALLCLOSEWAIT = 0x1027
```

### <a id="SO_USELOOPBACK" href="#SO_USELOOPBACK">const SO_USELOOPBACK</a>

```
searchKey: syscall.SO_USELOOPBACK
```

```Go
const SO_USELOOPBACK = 0x40
```

### <a id="SO_WANTMORE" href="#SO_WANTMORE">const SO_WANTMORE</a>

```
searchKey: syscall.SO_WANTMORE
```

```Go
const SO_WANTMORE = 0x4000
```

### <a id="SO_WANTOOBFLAG" href="#SO_WANTOOBFLAG">const SO_WANTOOBFLAG</a>

```
searchKey: syscall.SO_WANTOOBFLAG
```

```Go
const SO_WANTOOBFLAG = 0x8000
```

### <a id="S_IEXEC" href="#S_IEXEC">const S_IEXEC</a>

```
searchKey: syscall.S_IEXEC
```

```Go
const S_IEXEC = 0x40
```

### <a id="S_IFBLK" href="#S_IFBLK">const S_IFBLK</a>

```
searchKey: syscall.S_IFBLK
```

```Go
const S_IFBLK = 0x6000
```

### <a id="S_IFCHR" href="#S_IFCHR">const S_IFCHR</a>

```
searchKey: syscall.S_IFCHR
```

```Go
const S_IFCHR = 0x2000
```

### <a id="S_IFDIR" href="#S_IFDIR">const S_IFDIR</a>

```
searchKey: syscall.S_IFDIR
```

```Go
const S_IFDIR = 0x4000
```

### <a id="S_IFIFO" href="#S_IFIFO">const S_IFIFO</a>

```
searchKey: syscall.S_IFIFO
```

```Go
const S_IFIFO = 0x1000
```

### <a id="S_IFLNK" href="#S_IFLNK">const S_IFLNK</a>

```
searchKey: syscall.S_IFLNK
```

```Go
const S_IFLNK = 0xa000
```

### <a id="S_IFMT" href="#S_IFMT">const S_IFMT</a>

```
searchKey: syscall.S_IFMT
```

```Go
const S_IFMT = 0xf000
```

### <a id="S_IFREG" href="#S_IFREG">const S_IFREG</a>

```
searchKey: syscall.S_IFREG
```

```Go
const S_IFREG = 0x8000
```

### <a id="S_IFSOCK" href="#S_IFSOCK">const S_IFSOCK</a>

```
searchKey: syscall.S_IFSOCK
```

```Go
const S_IFSOCK = 0xc000
```

### <a id="S_IFWHT" href="#S_IFWHT">const S_IFWHT</a>

```
searchKey: syscall.S_IFWHT
```

```Go
const S_IFWHT = 0xe000
```

### <a id="S_IREAD" href="#S_IREAD">const S_IREAD</a>

```
searchKey: syscall.S_IREAD
```

```Go
const S_IREAD = 0x100
```

### <a id="S_IRGRP" href="#S_IRGRP">const S_IRGRP</a>

```
searchKey: syscall.S_IRGRP
```

```Go
const S_IRGRP = 0x20
```

### <a id="S_IROTH" href="#S_IROTH">const S_IROTH</a>

```
searchKey: syscall.S_IROTH
```

```Go
const S_IROTH = 0x4
```

### <a id="S_IRUSR" href="#S_IRUSR">const S_IRUSR</a>

```
searchKey: syscall.S_IRUSR
```

```Go
const S_IRUSR = 0x100
```

### <a id="S_IRWXG" href="#S_IRWXG">const S_IRWXG</a>

```
searchKey: syscall.S_IRWXG
```

```Go
const S_IRWXG = 0x38
```

### <a id="S_IRWXO" href="#S_IRWXO">const S_IRWXO</a>

```
searchKey: syscall.S_IRWXO
```

```Go
const S_IRWXO = 0x7
```

### <a id="S_IRWXU" href="#S_IRWXU">const S_IRWXU</a>

```
searchKey: syscall.S_IRWXU
```

```Go
const S_IRWXU = 0x1c0
```

### <a id="S_ISGID" href="#S_ISGID">const S_ISGID</a>

```
searchKey: syscall.S_ISGID
```

```Go
const S_ISGID = 0x400
```

### <a id="S_ISTXT" href="#S_ISTXT">const S_ISTXT</a>

```
searchKey: syscall.S_ISTXT
```

```Go
const S_ISTXT = 0x200
```

### <a id="S_ISUID" href="#S_ISUID">const S_ISUID</a>

```
searchKey: syscall.S_ISUID
```

```Go
const S_ISUID = 0x800
```

### <a id="S_ISVTX" href="#S_ISVTX">const S_ISVTX</a>

```
searchKey: syscall.S_ISVTX
```

```Go
const S_ISVTX = 0x200
```

### <a id="S_IWGRP" href="#S_IWGRP">const S_IWGRP</a>

```
searchKey: syscall.S_IWGRP
```

```Go
const S_IWGRP = 0x10
```

### <a id="S_IWOTH" href="#S_IWOTH">const S_IWOTH</a>

```
searchKey: syscall.S_IWOTH
```

```Go
const S_IWOTH = 0x2
```

### <a id="S_IWRITE" href="#S_IWRITE">const S_IWRITE</a>

```
searchKey: syscall.S_IWRITE
```

```Go
const S_IWRITE = 0x80
```

### <a id="S_IWUSR" href="#S_IWUSR">const S_IWUSR</a>

```
searchKey: syscall.S_IWUSR
```

```Go
const S_IWUSR = 0x80
```

### <a id="S_IXGRP" href="#S_IXGRP">const S_IXGRP</a>

```
searchKey: syscall.S_IXGRP
```

```Go
const S_IXGRP = 0x8
```

### <a id="S_IXOTH" href="#S_IXOTH">const S_IXOTH</a>

```
searchKey: syscall.S_IXOTH
```

```Go
const S_IXOTH = 0x1
```

### <a id="S_IXUSR" href="#S_IXUSR">const S_IXUSR</a>

```
searchKey: syscall.S_IXUSR
```

```Go
const S_IXUSR = 0x40
```

### <a id="TCIFLUSH" href="#TCIFLUSH">const TCIFLUSH</a>

```
searchKey: syscall.TCIFLUSH
```

```Go
const TCIFLUSH = 0x1
```

### <a id="TCIOFLUSH" href="#TCIOFLUSH">const TCIOFLUSH</a>

```
searchKey: syscall.TCIOFLUSH
```

```Go
const TCIOFLUSH = 0x3
```

### <a id="TCOFLUSH" href="#TCOFLUSH">const TCOFLUSH</a>

```
searchKey: syscall.TCOFLUSH
```

```Go
const TCOFLUSH = 0x2
```

### <a id="TCP_CONNECTIONTIMEOUT" href="#TCP_CONNECTIONTIMEOUT">const TCP_CONNECTIONTIMEOUT</a>

```
searchKey: syscall.TCP_CONNECTIONTIMEOUT
```

```Go
const TCP_CONNECTIONTIMEOUT = 0x20
```

### <a id="TCP_KEEPALIVE" href="#TCP_KEEPALIVE">const TCP_KEEPALIVE</a>

```
searchKey: syscall.TCP_KEEPALIVE
```

```Go
const TCP_KEEPALIVE = 0x10
```

### <a id="TCP_MAXHLEN" href="#TCP_MAXHLEN">const TCP_MAXHLEN</a>

```
searchKey: syscall.TCP_MAXHLEN
```

```Go
const TCP_MAXHLEN = 0x3c
```

### <a id="TCP_MAXOLEN" href="#TCP_MAXOLEN">const TCP_MAXOLEN</a>

```
searchKey: syscall.TCP_MAXOLEN
```

```Go
const TCP_MAXOLEN = 0x28
```

### <a id="TCP_MAXSEG" href="#TCP_MAXSEG">const TCP_MAXSEG</a>

```
searchKey: syscall.TCP_MAXSEG
```

```Go
const TCP_MAXSEG = 0x2
```

### <a id="TCP_MAXWIN" href="#TCP_MAXWIN">const TCP_MAXWIN</a>

```
searchKey: syscall.TCP_MAXWIN
```

```Go
const TCP_MAXWIN = 0xffff
```

### <a id="TCP_MAX_SACK" href="#TCP_MAX_SACK">const TCP_MAX_SACK</a>

```
searchKey: syscall.TCP_MAX_SACK
```

```Go
const TCP_MAX_SACK = 0x3
```

### <a id="TCP_MAX_WINSHIFT" href="#TCP_MAX_WINSHIFT">const TCP_MAX_WINSHIFT</a>

```
searchKey: syscall.TCP_MAX_WINSHIFT
```

```Go
const TCP_MAX_WINSHIFT = 0xe
```

### <a id="TCP_MINMSS" href="#TCP_MINMSS">const TCP_MINMSS</a>

```
searchKey: syscall.TCP_MINMSS
```

```Go
const TCP_MINMSS = 0xd8
```

### <a id="TCP_MINMSSOVERLOAD" href="#TCP_MINMSSOVERLOAD">const TCP_MINMSSOVERLOAD</a>

```
searchKey: syscall.TCP_MINMSSOVERLOAD
```

```Go
const TCP_MINMSSOVERLOAD = 0x3e8
```

### <a id="TCP_MSS" href="#TCP_MSS">const TCP_MSS</a>

```
searchKey: syscall.TCP_MSS
```

```Go
const TCP_MSS = 0x200
```

### <a id="TCP_NODELAY" href="#TCP_NODELAY">const TCP_NODELAY</a>

```
searchKey: syscall.TCP_NODELAY
```

```Go
const TCP_NODELAY = 0x1
```

### <a id="TCP_NOOPT" href="#TCP_NOOPT">const TCP_NOOPT</a>

```
searchKey: syscall.TCP_NOOPT
```

```Go
const TCP_NOOPT = 0x8
```

### <a id="TCP_NOPUSH" href="#TCP_NOPUSH">const TCP_NOPUSH</a>

```
searchKey: syscall.TCP_NOPUSH
```

```Go
const TCP_NOPUSH = 0x4
```

### <a id="TCP_RXT_CONNDROPTIME" href="#TCP_RXT_CONNDROPTIME">const TCP_RXT_CONNDROPTIME</a>

```
searchKey: syscall.TCP_RXT_CONNDROPTIME
```

```Go
const TCP_RXT_CONNDROPTIME = 0x80
```

### <a id="TCP_RXT_FINDROP" href="#TCP_RXT_FINDROP">const TCP_RXT_FINDROP</a>

```
searchKey: syscall.TCP_RXT_FINDROP
```

```Go
const TCP_RXT_FINDROP = 0x100
```

### <a id="TCSAFLUSH" href="#TCSAFLUSH">const TCSAFLUSH</a>

```
searchKey: syscall.TCSAFLUSH
```

```Go
const TCSAFLUSH = 0x2
```

### <a id="TIOCCBRK" href="#TIOCCBRK">const TIOCCBRK</a>

```
searchKey: syscall.TIOCCBRK
```

```Go
const TIOCCBRK = 0x2000747a
```

### <a id="TIOCCDTR" href="#TIOCCDTR">const TIOCCDTR</a>

```
searchKey: syscall.TIOCCDTR
```

```Go
const TIOCCDTR = 0x20007478
```

### <a id="TIOCCONS" href="#TIOCCONS">const TIOCCONS</a>

```
searchKey: syscall.TIOCCONS
```

```Go
const TIOCCONS = 0x80047462
```

### <a id="TIOCDCDTIMESTAMP" href="#TIOCDCDTIMESTAMP">const TIOCDCDTIMESTAMP</a>

```
searchKey: syscall.TIOCDCDTIMESTAMP
```

```Go
const TIOCDCDTIMESTAMP = 0x40107458
```

### <a id="TIOCDRAIN" href="#TIOCDRAIN">const TIOCDRAIN</a>

```
searchKey: syscall.TIOCDRAIN
```

```Go
const TIOCDRAIN = 0x2000745e
```

### <a id="TIOCDSIMICROCODE" href="#TIOCDSIMICROCODE">const TIOCDSIMICROCODE</a>

```
searchKey: syscall.TIOCDSIMICROCODE
```

```Go
const TIOCDSIMICROCODE = 0x20007455
```

### <a id="TIOCEXCL" href="#TIOCEXCL">const TIOCEXCL</a>

```
searchKey: syscall.TIOCEXCL
```

```Go
const TIOCEXCL = 0x2000740d
```

### <a id="TIOCEXT" href="#TIOCEXT">const TIOCEXT</a>

```
searchKey: syscall.TIOCEXT
```

```Go
const TIOCEXT = 0x80047460
```

### <a id="TIOCFLUSH" href="#TIOCFLUSH">const TIOCFLUSH</a>

```
searchKey: syscall.TIOCFLUSH
```

```Go
const TIOCFLUSH = 0x80047410
```

### <a id="TIOCGDRAINWAIT" href="#TIOCGDRAINWAIT">const TIOCGDRAINWAIT</a>

```
searchKey: syscall.TIOCGDRAINWAIT
```

```Go
const TIOCGDRAINWAIT = 0x40047456
```

### <a id="TIOCGETA" href="#TIOCGETA">const TIOCGETA</a>

```
searchKey: syscall.TIOCGETA
```

```Go
const TIOCGETA = 0x40487413
```

### <a id="TIOCGETD" href="#TIOCGETD">const TIOCGETD</a>

```
searchKey: syscall.TIOCGETD
```

```Go
const TIOCGETD = 0x4004741a
```

### <a id="TIOCGPGRP" href="#TIOCGPGRP">const TIOCGPGRP</a>

```
searchKey: syscall.TIOCGPGRP
```

```Go
const TIOCGPGRP = 0x40047477
```

### <a id="TIOCGWINSZ" href="#TIOCGWINSZ">const TIOCGWINSZ</a>

```
searchKey: syscall.TIOCGWINSZ
```

```Go
const TIOCGWINSZ = 0x40087468
```

### <a id="TIOCIXOFF" href="#TIOCIXOFF">const TIOCIXOFF</a>

```
searchKey: syscall.TIOCIXOFF
```

```Go
const TIOCIXOFF = 0x20007480
```

### <a id="TIOCIXON" href="#TIOCIXON">const TIOCIXON</a>

```
searchKey: syscall.TIOCIXON
```

```Go
const TIOCIXON = 0x20007481
```

### <a id="TIOCMBIC" href="#TIOCMBIC">const TIOCMBIC</a>

```
searchKey: syscall.TIOCMBIC
```

```Go
const TIOCMBIC = 0x8004746b
```

### <a id="TIOCMBIS" href="#TIOCMBIS">const TIOCMBIS</a>

```
searchKey: syscall.TIOCMBIS
```

```Go
const TIOCMBIS = 0x8004746c
```

### <a id="TIOCMGDTRWAIT" href="#TIOCMGDTRWAIT">const TIOCMGDTRWAIT</a>

```
searchKey: syscall.TIOCMGDTRWAIT
```

```Go
const TIOCMGDTRWAIT = 0x4004745a
```

### <a id="TIOCMGET" href="#TIOCMGET">const TIOCMGET</a>

```
searchKey: syscall.TIOCMGET
```

```Go
const TIOCMGET = 0x4004746a
```

### <a id="TIOCMODG" href="#TIOCMODG">const TIOCMODG</a>

```
searchKey: syscall.TIOCMODG
```

```Go
const TIOCMODG = 0x40047403
```

### <a id="TIOCMODS" href="#TIOCMODS">const TIOCMODS</a>

```
searchKey: syscall.TIOCMODS
```

```Go
const TIOCMODS = 0x80047404
```

### <a id="TIOCMSDTRWAIT" href="#TIOCMSDTRWAIT">const TIOCMSDTRWAIT</a>

```
searchKey: syscall.TIOCMSDTRWAIT
```

```Go
const TIOCMSDTRWAIT = 0x8004745b
```

### <a id="TIOCMSET" href="#TIOCMSET">const TIOCMSET</a>

```
searchKey: syscall.TIOCMSET
```

```Go
const TIOCMSET = 0x8004746d
```

### <a id="TIOCM_CAR" href="#TIOCM_CAR">const TIOCM_CAR</a>

```
searchKey: syscall.TIOCM_CAR
```

```Go
const TIOCM_CAR = 0x40
```

### <a id="TIOCM_CD" href="#TIOCM_CD">const TIOCM_CD</a>

```
searchKey: syscall.TIOCM_CD
```

```Go
const TIOCM_CD = 0x40
```

### <a id="TIOCM_CTS" href="#TIOCM_CTS">const TIOCM_CTS</a>

```
searchKey: syscall.TIOCM_CTS
```

```Go
const TIOCM_CTS = 0x20
```

### <a id="TIOCM_DSR" href="#TIOCM_DSR">const TIOCM_DSR</a>

```
searchKey: syscall.TIOCM_DSR
```

```Go
const TIOCM_DSR = 0x100
```

### <a id="TIOCM_DTR" href="#TIOCM_DTR">const TIOCM_DTR</a>

```
searchKey: syscall.TIOCM_DTR
```

```Go
const TIOCM_DTR = 0x2
```

### <a id="TIOCM_LE" href="#TIOCM_LE">const TIOCM_LE</a>

```
searchKey: syscall.TIOCM_LE
```

```Go
const TIOCM_LE = 0x1
```

### <a id="TIOCM_RI" href="#TIOCM_RI">const TIOCM_RI</a>

```
searchKey: syscall.TIOCM_RI
```

```Go
const TIOCM_RI = 0x80
```

### <a id="TIOCM_RNG" href="#TIOCM_RNG">const TIOCM_RNG</a>

```
searchKey: syscall.TIOCM_RNG
```

```Go
const TIOCM_RNG = 0x80
```

### <a id="TIOCM_RTS" href="#TIOCM_RTS">const TIOCM_RTS</a>

```
searchKey: syscall.TIOCM_RTS
```

```Go
const TIOCM_RTS = 0x4
```

### <a id="TIOCM_SR" href="#TIOCM_SR">const TIOCM_SR</a>

```
searchKey: syscall.TIOCM_SR
```

```Go
const TIOCM_SR = 0x10
```

### <a id="TIOCM_ST" href="#TIOCM_ST">const TIOCM_ST</a>

```
searchKey: syscall.TIOCM_ST
```

```Go
const TIOCM_ST = 0x8
```

### <a id="TIOCNOTTY" href="#TIOCNOTTY">const TIOCNOTTY</a>

```
searchKey: syscall.TIOCNOTTY
```

```Go
const TIOCNOTTY = 0x20007471
```

### <a id="TIOCNXCL" href="#TIOCNXCL">const TIOCNXCL</a>

```
searchKey: syscall.TIOCNXCL
```

```Go
const TIOCNXCL = 0x2000740e
```

### <a id="TIOCOUTQ" href="#TIOCOUTQ">const TIOCOUTQ</a>

```
searchKey: syscall.TIOCOUTQ
```

```Go
const TIOCOUTQ = 0x40047473
```

### <a id="TIOCPKT" href="#TIOCPKT">const TIOCPKT</a>

```
searchKey: syscall.TIOCPKT
```

```Go
const TIOCPKT = 0x80047470
```

### <a id="TIOCPKT_DATA" href="#TIOCPKT_DATA">const TIOCPKT_DATA</a>

```
searchKey: syscall.TIOCPKT_DATA
```

```Go
const TIOCPKT_DATA = 0x0
```

### <a id="TIOCPKT_DOSTOP" href="#TIOCPKT_DOSTOP">const TIOCPKT_DOSTOP</a>

```
searchKey: syscall.TIOCPKT_DOSTOP
```

```Go
const TIOCPKT_DOSTOP = 0x20
```

### <a id="TIOCPKT_FLUSHREAD" href="#TIOCPKT_FLUSHREAD">const TIOCPKT_FLUSHREAD</a>

```
searchKey: syscall.TIOCPKT_FLUSHREAD
```

```Go
const TIOCPKT_FLUSHREAD = 0x1
```

### <a id="TIOCPKT_FLUSHWRITE" href="#TIOCPKT_FLUSHWRITE">const TIOCPKT_FLUSHWRITE</a>

```
searchKey: syscall.TIOCPKT_FLUSHWRITE
```

```Go
const TIOCPKT_FLUSHWRITE = 0x2
```

### <a id="TIOCPKT_IOCTL" href="#TIOCPKT_IOCTL">const TIOCPKT_IOCTL</a>

```
searchKey: syscall.TIOCPKT_IOCTL
```

```Go
const TIOCPKT_IOCTL = 0x40
```

### <a id="TIOCPKT_NOSTOP" href="#TIOCPKT_NOSTOP">const TIOCPKT_NOSTOP</a>

```
searchKey: syscall.TIOCPKT_NOSTOP
```

```Go
const TIOCPKT_NOSTOP = 0x10
```

### <a id="TIOCPKT_START" href="#TIOCPKT_START">const TIOCPKT_START</a>

```
searchKey: syscall.TIOCPKT_START
```

```Go
const TIOCPKT_START = 0x8
```

### <a id="TIOCPKT_STOP" href="#TIOCPKT_STOP">const TIOCPKT_STOP</a>

```
searchKey: syscall.TIOCPKT_STOP
```

```Go
const TIOCPKT_STOP = 0x4
```

### <a id="TIOCPTYGNAME" href="#TIOCPTYGNAME">const TIOCPTYGNAME</a>

```
searchKey: syscall.TIOCPTYGNAME
```

```Go
const TIOCPTYGNAME = 0x40807453
```

### <a id="TIOCPTYGRANT" href="#TIOCPTYGRANT">const TIOCPTYGRANT</a>

```
searchKey: syscall.TIOCPTYGRANT
```

```Go
const TIOCPTYGRANT = 0x20007454
```

### <a id="TIOCPTYUNLK" href="#TIOCPTYUNLK">const TIOCPTYUNLK</a>

```
searchKey: syscall.TIOCPTYUNLK
```

```Go
const TIOCPTYUNLK = 0x20007452
```

### <a id="TIOCREMOTE" href="#TIOCREMOTE">const TIOCREMOTE</a>

```
searchKey: syscall.TIOCREMOTE
```

```Go
const TIOCREMOTE = 0x80047469
```

### <a id="TIOCSBRK" href="#TIOCSBRK">const TIOCSBRK</a>

```
searchKey: syscall.TIOCSBRK
```

```Go
const TIOCSBRK = 0x2000747b
```

### <a id="TIOCSCONS" href="#TIOCSCONS">const TIOCSCONS</a>

```
searchKey: syscall.TIOCSCONS
```

```Go
const TIOCSCONS = 0x20007463
```

### <a id="TIOCSCTTY" href="#TIOCSCTTY">const TIOCSCTTY</a>

```
searchKey: syscall.TIOCSCTTY
```

```Go
const TIOCSCTTY = 0x20007461
```

### <a id="TIOCSDRAINWAIT" href="#TIOCSDRAINWAIT">const TIOCSDRAINWAIT</a>

```
searchKey: syscall.TIOCSDRAINWAIT
```

```Go
const TIOCSDRAINWAIT = 0x80047457
```

### <a id="TIOCSDTR" href="#TIOCSDTR">const TIOCSDTR</a>

```
searchKey: syscall.TIOCSDTR
```

```Go
const TIOCSDTR = 0x20007479
```

### <a id="TIOCSETA" href="#TIOCSETA">const TIOCSETA</a>

```
searchKey: syscall.TIOCSETA
```

```Go
const TIOCSETA = 0x80487414
```

### <a id="TIOCSETAF" href="#TIOCSETAF">const TIOCSETAF</a>

```
searchKey: syscall.TIOCSETAF
```

```Go
const TIOCSETAF = 0x80487416
```

### <a id="TIOCSETAW" href="#TIOCSETAW">const TIOCSETAW</a>

```
searchKey: syscall.TIOCSETAW
```

```Go
const TIOCSETAW = 0x80487415
```

### <a id="TIOCSETD" href="#TIOCSETD">const TIOCSETD</a>

```
searchKey: syscall.TIOCSETD
```

```Go
const TIOCSETD = 0x8004741b
```

### <a id="TIOCSIG" href="#TIOCSIG">const TIOCSIG</a>

```
searchKey: syscall.TIOCSIG
```

```Go
const TIOCSIG = 0x2000745f
```

### <a id="TIOCSPGRP" href="#TIOCSPGRP">const TIOCSPGRP</a>

```
searchKey: syscall.TIOCSPGRP
```

```Go
const TIOCSPGRP = 0x80047476
```

### <a id="TIOCSTART" href="#TIOCSTART">const TIOCSTART</a>

```
searchKey: syscall.TIOCSTART
```

```Go
const TIOCSTART = 0x2000746e
```

### <a id="TIOCSTAT" href="#TIOCSTAT">const TIOCSTAT</a>

```
searchKey: syscall.TIOCSTAT
```

```Go
const TIOCSTAT = 0x20007465
```

### <a id="TIOCSTI" href="#TIOCSTI">const TIOCSTI</a>

```
searchKey: syscall.TIOCSTI
```

```Go
const TIOCSTI = 0x80017472
```

### <a id="TIOCSTOP" href="#TIOCSTOP">const TIOCSTOP</a>

```
searchKey: syscall.TIOCSTOP
```

```Go
const TIOCSTOP = 0x2000746f
```

### <a id="TIOCSWINSZ" href="#TIOCSWINSZ">const TIOCSWINSZ</a>

```
searchKey: syscall.TIOCSWINSZ
```

```Go
const TIOCSWINSZ = 0x80087467
```

### <a id="TIOCTIMESTAMP" href="#TIOCTIMESTAMP">const TIOCTIMESTAMP</a>

```
searchKey: syscall.TIOCTIMESTAMP
```

```Go
const TIOCTIMESTAMP = 0x40107459
```

### <a id="TIOCUCNTL" href="#TIOCUCNTL">const TIOCUCNTL</a>

```
searchKey: syscall.TIOCUCNTL
```

```Go
const TIOCUCNTL = 0x80047466
```

### <a id="TOSTOP" href="#TOSTOP">const TOSTOP</a>

```
searchKey: syscall.TOSTOP
```

```Go
const TOSTOP = 0x400000
```

### <a id="VDISCARD" href="#VDISCARD">const VDISCARD</a>

```
searchKey: syscall.VDISCARD
```

```Go
const VDISCARD = 0xf
```

### <a id="VDSUSP" href="#VDSUSP">const VDSUSP</a>

```
searchKey: syscall.VDSUSP
```

```Go
const VDSUSP = 0xb
```

### <a id="VEOF" href="#VEOF">const VEOF</a>

```
searchKey: syscall.VEOF
```

```Go
const VEOF = 0x0
```

### <a id="VEOL" href="#VEOL">const VEOL</a>

```
searchKey: syscall.VEOL
```

```Go
const VEOL = 0x1
```

### <a id="VEOL2" href="#VEOL2">const VEOL2</a>

```
searchKey: syscall.VEOL2
```

```Go
const VEOL2 = 0x2
```

### <a id="VERASE" href="#VERASE">const VERASE</a>

```
searchKey: syscall.VERASE
```

```Go
const VERASE = 0x3
```

### <a id="VINTR" href="#VINTR">const VINTR</a>

```
searchKey: syscall.VINTR
```

```Go
const VINTR = 0x8
```

### <a id="VKILL" href="#VKILL">const VKILL</a>

```
searchKey: syscall.VKILL
```

```Go
const VKILL = 0x5
```

### <a id="VLNEXT" href="#VLNEXT">const VLNEXT</a>

```
searchKey: syscall.VLNEXT
```

```Go
const VLNEXT = 0xe
```

### <a id="VMIN" href="#VMIN">const VMIN</a>

```
searchKey: syscall.VMIN
```

```Go
const VMIN = 0x10
```

### <a id="VQUIT" href="#VQUIT">const VQUIT</a>

```
searchKey: syscall.VQUIT
```

```Go
const VQUIT = 0x9
```

### <a id="VREPRINT" href="#VREPRINT">const VREPRINT</a>

```
searchKey: syscall.VREPRINT
```

```Go
const VREPRINT = 0x6
```

### <a id="VSTART" href="#VSTART">const VSTART</a>

```
searchKey: syscall.VSTART
```

```Go
const VSTART = 0xc
```

### <a id="VSTATUS" href="#VSTATUS">const VSTATUS</a>

```
searchKey: syscall.VSTATUS
```

```Go
const VSTATUS = 0x12
```

### <a id="VSTOP" href="#VSTOP">const VSTOP</a>

```
searchKey: syscall.VSTOP
```

```Go
const VSTOP = 0xd
```

### <a id="VSUSP" href="#VSUSP">const VSUSP</a>

```
searchKey: syscall.VSUSP
```

```Go
const VSUSP = 0xa
```

### <a id="VT0" href="#VT0">const VT0</a>

```
searchKey: syscall.VT0
```

```Go
const VT0 = 0x0
```

### <a id="VT1" href="#VT1">const VT1</a>

```
searchKey: syscall.VT1
```

```Go
const VT1 = 0x10000
```

### <a id="VTDLY" href="#VTDLY">const VTDLY</a>

```
searchKey: syscall.VTDLY
```

```Go
const VTDLY = 0x10000
```

### <a id="VTIME" href="#VTIME">const VTIME</a>

```
searchKey: syscall.VTIME
```

```Go
const VTIME = 0x11
```

### <a id="VWERASE" href="#VWERASE">const VWERASE</a>

```
searchKey: syscall.VWERASE
```

```Go
const VWERASE = 0x4
```

### <a id="WCONTINUED" href="#WCONTINUED">const WCONTINUED</a>

```
searchKey: syscall.WCONTINUED
```

```Go
const WCONTINUED = 0x10
```

### <a id="WCOREFLAG" href="#WCOREFLAG">const WCOREFLAG</a>

```
searchKey: syscall.WCOREFLAG
```

```Go
const WCOREFLAG = 0x80
```

### <a id="WEXITED" href="#WEXITED">const WEXITED</a>

```
searchKey: syscall.WEXITED
```

```Go
const WEXITED = 0x4
```

### <a id="WNOHANG" href="#WNOHANG">const WNOHANG</a>

```
searchKey: syscall.WNOHANG
```

```Go
const WNOHANG = 0x1
```

### <a id="WNOWAIT" href="#WNOWAIT">const WNOWAIT</a>

```
searchKey: syscall.WNOWAIT
```

```Go
const WNOWAIT = 0x20
```

### <a id="WORDSIZE" href="#WORDSIZE">const WORDSIZE</a>

```
searchKey: syscall.WORDSIZE
```

```Go
const WORDSIZE = 0x40
```

### <a id="WSTOPPED" href="#WSTOPPED">const WSTOPPED</a>

```
searchKey: syscall.WSTOPPED
```

```Go
const WSTOPPED = 0x8
```

### <a id="WUNTRACED" href="#WUNTRACED">const WUNTRACED</a>

```
searchKey: syscall.WUNTRACED
```

```Go
const WUNTRACED = 0x2
```

### <a id="E2BIG" href="#E2BIG">const E2BIG</a>

```
searchKey: syscall.E2BIG
```

```Go
const E2BIG = Errno(0x7)
```

Errors 

### <a id="EACCES" href="#EACCES">const EACCES</a>

```
searchKey: syscall.EACCES
```

```Go
const EACCES = Errno(0xd)
```

Errors 

### <a id="EADDRINUSE" href="#EADDRINUSE">const EADDRINUSE</a>

```
searchKey: syscall.EADDRINUSE
```

```Go
const EADDRINUSE = Errno(0x30)
```

Errors 

### <a id="EADDRNOTAVAIL" href="#EADDRNOTAVAIL">const EADDRNOTAVAIL</a>

```
searchKey: syscall.EADDRNOTAVAIL
```

```Go
const EADDRNOTAVAIL = Errno(0x31)
```

Errors 

### <a id="EAFNOSUPPORT" href="#EAFNOSUPPORT">const EAFNOSUPPORT</a>

```
searchKey: syscall.EAFNOSUPPORT
```

```Go
const EAFNOSUPPORT = Errno(0x2f)
```

Errors 

### <a id="EAGAIN" href="#EAGAIN">const EAGAIN</a>

```
searchKey: syscall.EAGAIN
```

```Go
const EAGAIN = Errno(0x23)
```

Errors 

### <a id="EALREADY" href="#EALREADY">const EALREADY</a>

```
searchKey: syscall.EALREADY
```

```Go
const EALREADY = Errno(0x25)
```

Errors 

### <a id="EAUTH" href="#EAUTH">const EAUTH</a>

```
searchKey: syscall.EAUTH
```

```Go
const EAUTH = Errno(0x50)
```

Errors 

### <a id="EBADARCH" href="#EBADARCH">const EBADARCH</a>

```
searchKey: syscall.EBADARCH
```

```Go
const EBADARCH = Errno(0x56)
```

Errors 

### <a id="EBADEXEC" href="#EBADEXEC">const EBADEXEC</a>

```
searchKey: syscall.EBADEXEC
```

```Go
const EBADEXEC = Errno(0x55)
```

Errors 

### <a id="EBADF" href="#EBADF">const EBADF</a>

```
searchKey: syscall.EBADF
```

```Go
const EBADF = Errno(0x9)
```

Errors 

### <a id="EBADMACHO" href="#EBADMACHO">const EBADMACHO</a>

```
searchKey: syscall.EBADMACHO
```

```Go
const EBADMACHO = Errno(0x58)
```

Errors 

### <a id="EBADMSG" href="#EBADMSG">const EBADMSG</a>

```
searchKey: syscall.EBADMSG
```

```Go
const EBADMSG = Errno(0x5e)
```

Errors 

### <a id="EBADRPC" href="#EBADRPC">const EBADRPC</a>

```
searchKey: syscall.EBADRPC
```

```Go
const EBADRPC = Errno(0x48)
```

Errors 

### <a id="EBUSY" href="#EBUSY">const EBUSY</a>

```
searchKey: syscall.EBUSY
```

```Go
const EBUSY = Errno(0x10)
```

Errors 

### <a id="ECANCELED" href="#ECANCELED">const ECANCELED</a>

```
searchKey: syscall.ECANCELED
```

```Go
const ECANCELED = Errno(0x59)
```

Errors 

### <a id="ECHILD" href="#ECHILD">const ECHILD</a>

```
searchKey: syscall.ECHILD
```

```Go
const ECHILD = Errno(0xa)
```

Errors 

### <a id="ECONNABORTED" href="#ECONNABORTED">const ECONNABORTED</a>

```
searchKey: syscall.ECONNABORTED
```

```Go
const ECONNABORTED = Errno(0x35)
```

Errors 

### <a id="ECONNREFUSED" href="#ECONNREFUSED">const ECONNREFUSED</a>

```
searchKey: syscall.ECONNREFUSED
```

```Go
const ECONNREFUSED = Errno(0x3d)
```

Errors 

### <a id="ECONNRESET" href="#ECONNRESET">const ECONNRESET</a>

```
searchKey: syscall.ECONNRESET
```

```Go
const ECONNRESET = Errno(0x36)
```

Errors 

### <a id="EDEADLK" href="#EDEADLK">const EDEADLK</a>

```
searchKey: syscall.EDEADLK
```

```Go
const EDEADLK = Errno(0xb)
```

Errors 

### <a id="EDESTADDRREQ" href="#EDESTADDRREQ">const EDESTADDRREQ</a>

```
searchKey: syscall.EDESTADDRREQ
```

```Go
const EDESTADDRREQ = Errno(0x27)
```

Errors 

### <a id="EDEVERR" href="#EDEVERR">const EDEVERR</a>

```
searchKey: syscall.EDEVERR
```

```Go
const EDEVERR = Errno(0x53)
```

Errors 

### <a id="EDOM" href="#EDOM">const EDOM</a>

```
searchKey: syscall.EDOM
```

```Go
const EDOM = Errno(0x21)
```

Errors 

### <a id="EDQUOT" href="#EDQUOT">const EDQUOT</a>

```
searchKey: syscall.EDQUOT
```

```Go
const EDQUOT = Errno(0x45)
```

Errors 

### <a id="EEXIST" href="#EEXIST">const EEXIST</a>

```
searchKey: syscall.EEXIST
```

```Go
const EEXIST = Errno(0x11)
```

Errors 

### <a id="EFAULT" href="#EFAULT">const EFAULT</a>

```
searchKey: syscall.EFAULT
```

```Go
const EFAULT = Errno(0xe)
```

Errors 

### <a id="EFBIG" href="#EFBIG">const EFBIG</a>

```
searchKey: syscall.EFBIG
```

```Go
const EFBIG = Errno(0x1b)
```

Errors 

### <a id="EFTYPE" href="#EFTYPE">const EFTYPE</a>

```
searchKey: syscall.EFTYPE
```

```Go
const EFTYPE = Errno(0x4f)
```

Errors 

### <a id="EHOSTDOWN" href="#EHOSTDOWN">const EHOSTDOWN</a>

```
searchKey: syscall.EHOSTDOWN
```

```Go
const EHOSTDOWN = Errno(0x40)
```

Errors 

### <a id="EHOSTUNREACH" href="#EHOSTUNREACH">const EHOSTUNREACH</a>

```
searchKey: syscall.EHOSTUNREACH
```

```Go
const EHOSTUNREACH = Errno(0x41)
```

Errors 

### <a id="EIDRM" href="#EIDRM">const EIDRM</a>

```
searchKey: syscall.EIDRM
```

```Go
const EIDRM = Errno(0x5a)
```

Errors 

### <a id="EILSEQ" href="#EILSEQ">const EILSEQ</a>

```
searchKey: syscall.EILSEQ
```

```Go
const EILSEQ = Errno(0x5c)
```

Errors 

### <a id="EINPROGRESS" href="#EINPROGRESS">const EINPROGRESS</a>

```
searchKey: syscall.EINPROGRESS
```

```Go
const EINPROGRESS = Errno(0x24)
```

Errors 

### <a id="EINTR" href="#EINTR">const EINTR</a>

```
searchKey: syscall.EINTR
```

```Go
const EINTR = Errno(0x4)
```

Errors 

### <a id="EINVAL" href="#EINVAL">const EINVAL</a>

```
searchKey: syscall.EINVAL
```

```Go
const EINVAL = Errno(0x16)
```

Errors 

### <a id="EIO" href="#EIO">const EIO</a>

```
searchKey: syscall.EIO
```

```Go
const EIO = Errno(0x5)
```

Errors 

### <a id="EISCONN" href="#EISCONN">const EISCONN</a>

```
searchKey: syscall.EISCONN
```

```Go
const EISCONN = Errno(0x38)
```

Errors 

### <a id="EISDIR" href="#EISDIR">const EISDIR</a>

```
searchKey: syscall.EISDIR
```

```Go
const EISDIR = Errno(0x15)
```

Errors 

### <a id="ELAST" href="#ELAST">const ELAST</a>

```
searchKey: syscall.ELAST
```

```Go
const ELAST = Errno(0x69)
```

Errors 

### <a id="ELOOP" href="#ELOOP">const ELOOP</a>

```
searchKey: syscall.ELOOP
```

```Go
const ELOOP = Errno(0x3e)
```

Errors 

### <a id="EMFILE" href="#EMFILE">const EMFILE</a>

```
searchKey: syscall.EMFILE
```

```Go
const EMFILE = Errno(0x18)
```

Errors 

### <a id="EMLINK" href="#EMLINK">const EMLINK</a>

```
searchKey: syscall.EMLINK
```

```Go
const EMLINK = Errno(0x1f)
```

Errors 

### <a id="EMSGSIZE" href="#EMSGSIZE">const EMSGSIZE</a>

```
searchKey: syscall.EMSGSIZE
```

```Go
const EMSGSIZE = Errno(0x28)
```

Errors 

### <a id="EMULTIHOP" href="#EMULTIHOP">const EMULTIHOP</a>

```
searchKey: syscall.EMULTIHOP
```

```Go
const EMULTIHOP = Errno(0x5f)
```

Errors 

### <a id="ENAMETOOLONG" href="#ENAMETOOLONG">const ENAMETOOLONG</a>

```
searchKey: syscall.ENAMETOOLONG
```

```Go
const ENAMETOOLONG = Errno(0x3f)
```

Errors 

### <a id="ENEEDAUTH" href="#ENEEDAUTH">const ENEEDAUTH</a>

```
searchKey: syscall.ENEEDAUTH
```

```Go
const ENEEDAUTH = Errno(0x51)
```

Errors 

### <a id="ENETDOWN" href="#ENETDOWN">const ENETDOWN</a>

```
searchKey: syscall.ENETDOWN
```

```Go
const ENETDOWN = Errno(0x32)
```

Errors 

### <a id="ENETRESET" href="#ENETRESET">const ENETRESET</a>

```
searchKey: syscall.ENETRESET
```

```Go
const ENETRESET = Errno(0x34)
```

Errors 

### <a id="ENETUNREACH" href="#ENETUNREACH">const ENETUNREACH</a>

```
searchKey: syscall.ENETUNREACH
```

```Go
const ENETUNREACH = Errno(0x33)
```

Errors 

### <a id="ENFILE" href="#ENFILE">const ENFILE</a>

```
searchKey: syscall.ENFILE
```

```Go
const ENFILE = Errno(0x17)
```

Errors 

### <a id="ENOATTR" href="#ENOATTR">const ENOATTR</a>

```
searchKey: syscall.ENOATTR
```

```Go
const ENOATTR = Errno(0x5d)
```

Errors 

### <a id="ENOBUFS" href="#ENOBUFS">const ENOBUFS</a>

```
searchKey: syscall.ENOBUFS
```

```Go
const ENOBUFS = Errno(0x37)
```

Errors 

### <a id="ENODATA" href="#ENODATA">const ENODATA</a>

```
searchKey: syscall.ENODATA
```

```Go
const ENODATA = Errno(0x60)
```

Errors 

### <a id="ENODEV" href="#ENODEV">const ENODEV</a>

```
searchKey: syscall.ENODEV
```

```Go
const ENODEV = Errno(0x13)
```

Errors 

### <a id="ENOENT" href="#ENOENT">const ENOENT</a>

```
searchKey: syscall.ENOENT
```

```Go
const ENOENT = Errno(0x2)
```

Errors 

### <a id="ENOEXEC" href="#ENOEXEC">const ENOEXEC</a>

```
searchKey: syscall.ENOEXEC
```

```Go
const ENOEXEC = Errno(0x8)
```

Errors 

### <a id="ENOLCK" href="#ENOLCK">const ENOLCK</a>

```
searchKey: syscall.ENOLCK
```

```Go
const ENOLCK = Errno(0x4d)
```

Errors 

### <a id="ENOLINK" href="#ENOLINK">const ENOLINK</a>

```
searchKey: syscall.ENOLINK
```

```Go
const ENOLINK = Errno(0x61)
```

Errors 

### <a id="ENOMEM" href="#ENOMEM">const ENOMEM</a>

```
searchKey: syscall.ENOMEM
```

```Go
const ENOMEM = Errno(0xc)
```

Errors 

### <a id="ENOMSG" href="#ENOMSG">const ENOMSG</a>

```
searchKey: syscall.ENOMSG
```

```Go
const ENOMSG = Errno(0x5b)
```

Errors 

### <a id="ENOPOLICY" href="#ENOPOLICY">const ENOPOLICY</a>

```
searchKey: syscall.ENOPOLICY
```

```Go
const ENOPOLICY = Errno(0x67)
```

Errors 

### <a id="ENOPROTOOPT" href="#ENOPROTOOPT">const ENOPROTOOPT</a>

```
searchKey: syscall.ENOPROTOOPT
```

```Go
const ENOPROTOOPT = Errno(0x2a)
```

Errors 

### <a id="ENOSPC" href="#ENOSPC">const ENOSPC</a>

```
searchKey: syscall.ENOSPC
```

```Go
const ENOSPC = Errno(0x1c)
```

Errors 

### <a id="ENOSR" href="#ENOSR">const ENOSR</a>

```
searchKey: syscall.ENOSR
```

```Go
const ENOSR = Errno(0x62)
```

Errors 

### <a id="ENOSTR" href="#ENOSTR">const ENOSTR</a>

```
searchKey: syscall.ENOSTR
```

```Go
const ENOSTR = Errno(0x63)
```

Errors 

### <a id="ENOSYS" href="#ENOSYS">const ENOSYS</a>

```
searchKey: syscall.ENOSYS
```

```Go
const ENOSYS = Errno(0x4e)
```

Errors 

### <a id="ENOTBLK" href="#ENOTBLK">const ENOTBLK</a>

```
searchKey: syscall.ENOTBLK
```

```Go
const ENOTBLK = Errno(0xf)
```

Errors 

### <a id="ENOTCONN" href="#ENOTCONN">const ENOTCONN</a>

```
searchKey: syscall.ENOTCONN
```

```Go
const ENOTCONN = Errno(0x39)
```

Errors 

### <a id="ENOTDIR" href="#ENOTDIR">const ENOTDIR</a>

```
searchKey: syscall.ENOTDIR
```

```Go
const ENOTDIR = Errno(0x14)
```

Errors 

### <a id="ENOTEMPTY" href="#ENOTEMPTY">const ENOTEMPTY</a>

```
searchKey: syscall.ENOTEMPTY
```

```Go
const ENOTEMPTY = Errno(0x42)
```

Errors 

### <a id="ENOTRECOVERABLE" href="#ENOTRECOVERABLE">const ENOTRECOVERABLE</a>

```
searchKey: syscall.ENOTRECOVERABLE
```

```Go
const ENOTRECOVERABLE = Errno(0x68)
```

Errors 

### <a id="ENOTSOCK" href="#ENOTSOCK">const ENOTSOCK</a>

```
searchKey: syscall.ENOTSOCK
```

```Go
const ENOTSOCK = Errno(0x26)
```

Errors 

### <a id="ENOTSUP" href="#ENOTSUP">const ENOTSUP</a>

```
searchKey: syscall.ENOTSUP
```

```Go
const ENOTSUP = Errno(0x2d)
```

Errors 

### <a id="ENOTTY" href="#ENOTTY">const ENOTTY</a>

```
searchKey: syscall.ENOTTY
```

```Go
const ENOTTY = Errno(0x19)
```

Errors 

### <a id="ENXIO" href="#ENXIO">const ENXIO</a>

```
searchKey: syscall.ENXIO
```

```Go
const ENXIO = Errno(0x6)
```

Errors 

### <a id="EOPNOTSUPP" href="#EOPNOTSUPP">const EOPNOTSUPP</a>

```
searchKey: syscall.EOPNOTSUPP
```

```Go
const EOPNOTSUPP = Errno(0x66)
```

Errors 

### <a id="EOVERFLOW" href="#EOVERFLOW">const EOVERFLOW</a>

```
searchKey: syscall.EOVERFLOW
```

```Go
const EOVERFLOW = Errno(0x54)
```

Errors 

### <a id="EOWNERDEAD" href="#EOWNERDEAD">const EOWNERDEAD</a>

```
searchKey: syscall.EOWNERDEAD
```

```Go
const EOWNERDEAD = Errno(0x69)
```

Errors 

### <a id="EPERM" href="#EPERM">const EPERM</a>

```
searchKey: syscall.EPERM
```

```Go
const EPERM = Errno(0x1)
```

Errors 

### <a id="EPFNOSUPPORT" href="#EPFNOSUPPORT">const EPFNOSUPPORT</a>

```
searchKey: syscall.EPFNOSUPPORT
```

```Go
const EPFNOSUPPORT = Errno(0x2e)
```

Errors 

### <a id="EPIPE" href="#EPIPE">const EPIPE</a>

```
searchKey: syscall.EPIPE
```

```Go
const EPIPE = Errno(0x20)
```

Errors 

### <a id="EPROCLIM" href="#EPROCLIM">const EPROCLIM</a>

```
searchKey: syscall.EPROCLIM
```

```Go
const EPROCLIM = Errno(0x43)
```

Errors 

### <a id="EPROCUNAVAIL" href="#EPROCUNAVAIL">const EPROCUNAVAIL</a>

```
searchKey: syscall.EPROCUNAVAIL
```

```Go
const EPROCUNAVAIL = Errno(0x4c)
```

Errors 

### <a id="EPROGMISMATCH" href="#EPROGMISMATCH">const EPROGMISMATCH</a>

```
searchKey: syscall.EPROGMISMATCH
```

```Go
const EPROGMISMATCH = Errno(0x4b)
```

Errors 

### <a id="EPROGUNAVAIL" href="#EPROGUNAVAIL">const EPROGUNAVAIL</a>

```
searchKey: syscall.EPROGUNAVAIL
```

```Go
const EPROGUNAVAIL = Errno(0x4a)
```

Errors 

### <a id="EPROTO" href="#EPROTO">const EPROTO</a>

```
searchKey: syscall.EPROTO
```

```Go
const EPROTO = Errno(0x64)
```

Errors 

### <a id="EPROTONOSUPPORT" href="#EPROTONOSUPPORT">const EPROTONOSUPPORT</a>

```
searchKey: syscall.EPROTONOSUPPORT
```

```Go
const EPROTONOSUPPORT = Errno(0x2b)
```

Errors 

### <a id="EPROTOTYPE" href="#EPROTOTYPE">const EPROTOTYPE</a>

```
searchKey: syscall.EPROTOTYPE
```

```Go
const EPROTOTYPE = Errno(0x29)
```

Errors 

### <a id="EPWROFF" href="#EPWROFF">const EPWROFF</a>

```
searchKey: syscall.EPWROFF
```

```Go
const EPWROFF = Errno(0x52)
```

Errors 

### <a id="ERANGE" href="#ERANGE">const ERANGE</a>

```
searchKey: syscall.ERANGE
```

```Go
const ERANGE = Errno(0x22)
```

Errors 

### <a id="EREMOTE" href="#EREMOTE">const EREMOTE</a>

```
searchKey: syscall.EREMOTE
```

```Go
const EREMOTE = Errno(0x47)
```

Errors 

### <a id="EROFS" href="#EROFS">const EROFS</a>

```
searchKey: syscall.EROFS
```

```Go
const EROFS = Errno(0x1e)
```

Errors 

### <a id="ERPCMISMATCH" href="#ERPCMISMATCH">const ERPCMISMATCH</a>

```
searchKey: syscall.ERPCMISMATCH
```

```Go
const ERPCMISMATCH = Errno(0x49)
```

Errors 

### <a id="ESHLIBVERS" href="#ESHLIBVERS">const ESHLIBVERS</a>

```
searchKey: syscall.ESHLIBVERS
```

```Go
const ESHLIBVERS = Errno(0x57)
```

Errors 

### <a id="ESHUTDOWN" href="#ESHUTDOWN">const ESHUTDOWN</a>

```
searchKey: syscall.ESHUTDOWN
```

```Go
const ESHUTDOWN = Errno(0x3a)
```

Errors 

### <a id="ESOCKTNOSUPPORT" href="#ESOCKTNOSUPPORT">const ESOCKTNOSUPPORT</a>

```
searchKey: syscall.ESOCKTNOSUPPORT
```

```Go
const ESOCKTNOSUPPORT = Errno(0x2c)
```

Errors 

### <a id="ESPIPE" href="#ESPIPE">const ESPIPE</a>

```
searchKey: syscall.ESPIPE
```

```Go
const ESPIPE = Errno(0x1d)
```

Errors 

### <a id="ESRCH" href="#ESRCH">const ESRCH</a>

```
searchKey: syscall.ESRCH
```

```Go
const ESRCH = Errno(0x3)
```

Errors 

### <a id="ESTALE" href="#ESTALE">const ESTALE</a>

```
searchKey: syscall.ESTALE
```

```Go
const ESTALE = Errno(0x46)
```

Errors 

### <a id="ETIME" href="#ETIME">const ETIME</a>

```
searchKey: syscall.ETIME
```

```Go
const ETIME = Errno(0x65)
```

Errors 

### <a id="ETIMEDOUT" href="#ETIMEDOUT">const ETIMEDOUT</a>

```
searchKey: syscall.ETIMEDOUT
```

```Go
const ETIMEDOUT = Errno(0x3c)
```

Errors 

### <a id="ETOOMANYREFS" href="#ETOOMANYREFS">const ETOOMANYREFS</a>

```
searchKey: syscall.ETOOMANYREFS
```

```Go
const ETOOMANYREFS = Errno(0x3b)
```

Errors 

### <a id="ETXTBSY" href="#ETXTBSY">const ETXTBSY</a>

```
searchKey: syscall.ETXTBSY
```

```Go
const ETXTBSY = Errno(0x1a)
```

Errors 

### <a id="EUSERS" href="#EUSERS">const EUSERS</a>

```
searchKey: syscall.EUSERS
```

```Go
const EUSERS = Errno(0x44)
```

Errors 

### <a id="EWOULDBLOCK" href="#EWOULDBLOCK">const EWOULDBLOCK</a>

```
searchKey: syscall.EWOULDBLOCK
```

```Go
const EWOULDBLOCK = Errno(0x23)
```

Errors 

### <a id="EXDEV" href="#EXDEV">const EXDEV</a>

```
searchKey: syscall.EXDEV
```

```Go
const EXDEV = Errno(0x12)
```

Errors 

### <a id="SIGABRT" href="#SIGABRT">const SIGABRT</a>

```
searchKey: syscall.SIGABRT
```

```Go
const SIGABRT = Signal(0x6)
```

Signals 

### <a id="SIGALRM" href="#SIGALRM">const SIGALRM</a>

```
searchKey: syscall.SIGALRM
```

```Go
const SIGALRM = Signal(0xe)
```

Signals 

### <a id="SIGBUS" href="#SIGBUS">const SIGBUS</a>

```
searchKey: syscall.SIGBUS
```

```Go
const SIGBUS = Signal(0xa)
```

Signals 

### <a id="SIGCHLD" href="#SIGCHLD">const SIGCHLD</a>

```
searchKey: syscall.SIGCHLD
```

```Go
const SIGCHLD = Signal(0x14)
```

Signals 

### <a id="SIGCONT" href="#SIGCONT">const SIGCONT</a>

```
searchKey: syscall.SIGCONT
```

```Go
const SIGCONT = Signal(0x13)
```

Signals 

### <a id="SIGEMT" href="#SIGEMT">const SIGEMT</a>

```
searchKey: syscall.SIGEMT
```

```Go
const SIGEMT = Signal(0x7)
```

Signals 

### <a id="SIGFPE" href="#SIGFPE">const SIGFPE</a>

```
searchKey: syscall.SIGFPE
```

```Go
const SIGFPE = Signal(0x8)
```

Signals 

### <a id="SIGHUP" href="#SIGHUP">const SIGHUP</a>

```
searchKey: syscall.SIGHUP
```

```Go
const SIGHUP = Signal(0x1)
```

Signals 

### <a id="SIGILL" href="#SIGILL">const SIGILL</a>

```
searchKey: syscall.SIGILL
```

```Go
const SIGILL = Signal(0x4)
```

Signals 

### <a id="SIGINFO" href="#SIGINFO">const SIGINFO</a>

```
searchKey: syscall.SIGINFO
```

```Go
const SIGINFO = Signal(0x1d)
```

Signals 

### <a id="SIGINT" href="#SIGINT">const SIGINT</a>

```
searchKey: syscall.SIGINT
```

```Go
const SIGINT = Signal(0x2)
```

Signals 

### <a id="SIGIO" href="#SIGIO">const SIGIO</a>

```
searchKey: syscall.SIGIO
```

```Go
const SIGIO = Signal(0x17)
```

Signals 

### <a id="SIGIOT" href="#SIGIOT">const SIGIOT</a>

```
searchKey: syscall.SIGIOT
```

```Go
const SIGIOT = Signal(0x6)
```

Signals 

### <a id="SIGKILL" href="#SIGKILL">const SIGKILL</a>

```
searchKey: syscall.SIGKILL
```

```Go
const SIGKILL = Signal(0x9)
```

Signals 

### <a id="SIGPIPE" href="#SIGPIPE">const SIGPIPE</a>

```
searchKey: syscall.SIGPIPE
```

```Go
const SIGPIPE = Signal(0xd)
```

Signals 

### <a id="SIGPROF" href="#SIGPROF">const SIGPROF</a>

```
searchKey: syscall.SIGPROF
```

```Go
const SIGPROF = Signal(0x1b)
```

Signals 

### <a id="SIGQUIT" href="#SIGQUIT">const SIGQUIT</a>

```
searchKey: syscall.SIGQUIT
```

```Go
const SIGQUIT = Signal(0x3)
```

Signals 

### <a id="SIGSEGV" href="#SIGSEGV">const SIGSEGV</a>

```
searchKey: syscall.SIGSEGV
```

```Go
const SIGSEGV = Signal(0xb)
```

Signals 

### <a id="SIGSTOP" href="#SIGSTOP">const SIGSTOP</a>

```
searchKey: syscall.SIGSTOP
```

```Go
const SIGSTOP = Signal(0x11)
```

Signals 

### <a id="SIGSYS" href="#SIGSYS">const SIGSYS</a>

```
searchKey: syscall.SIGSYS
```

```Go
const SIGSYS = Signal(0xc)
```

Signals 

### <a id="SIGTERM" href="#SIGTERM">const SIGTERM</a>

```
searchKey: syscall.SIGTERM
```

```Go
const SIGTERM = Signal(0xf)
```

Signals 

### <a id="SIGTRAP" href="#SIGTRAP">const SIGTRAP</a>

```
searchKey: syscall.SIGTRAP
```

```Go
const SIGTRAP = Signal(0x5)
```

Signals 

### <a id="SIGTSTP" href="#SIGTSTP">const SIGTSTP</a>

```
searchKey: syscall.SIGTSTP
```

```Go
const SIGTSTP = Signal(0x12)
```

Signals 

### <a id="SIGTTIN" href="#SIGTTIN">const SIGTTIN</a>

```
searchKey: syscall.SIGTTIN
```

```Go
const SIGTTIN = Signal(0x15)
```

Signals 

### <a id="SIGTTOU" href="#SIGTTOU">const SIGTTOU</a>

```
searchKey: syscall.SIGTTOU
```

```Go
const SIGTTOU = Signal(0x16)
```

Signals 

### <a id="SIGURG" href="#SIGURG">const SIGURG</a>

```
searchKey: syscall.SIGURG
```

```Go
const SIGURG = Signal(0x10)
```

Signals 

### <a id="SIGUSR1" href="#SIGUSR1">const SIGUSR1</a>

```
searchKey: syscall.SIGUSR1
```

```Go
const SIGUSR1 = Signal(0x1e)
```

Signals 

### <a id="SIGUSR2" href="#SIGUSR2">const SIGUSR2</a>

```
searchKey: syscall.SIGUSR2
```

```Go
const SIGUSR2 = Signal(0x1f)
```

Signals 

### <a id="SIGVTALRM" href="#SIGVTALRM">const SIGVTALRM</a>

```
searchKey: syscall.SIGVTALRM
```

```Go
const SIGVTALRM = Signal(0x1a)
```

Signals 

### <a id="SIGWINCH" href="#SIGWINCH">const SIGWINCH</a>

```
searchKey: syscall.SIGWINCH
```

```Go
const SIGWINCH = Signal(0x1c)
```

Signals 

### <a id="SIGXCPU" href="#SIGXCPU">const SIGXCPU</a>

```
searchKey: syscall.SIGXCPU
```

```Go
const SIGXCPU = Signal(0x18)
```

Signals 

### <a id="SIGXFSZ" href="#SIGXFSZ">const SIGXFSZ</a>

```
searchKey: syscall.SIGXFSZ
```

```Go
const SIGXFSZ = Signal(0x19)
```

Signals 

### <a id="SYS_SYSCALL" href="#SYS_SYSCALL">const SYS_SYSCALL</a>

```
searchKey: syscall.SYS_SYSCALL
```

```Go
const SYS_SYSCALL = 0
```

### <a id="SYS_EXIT" href="#SYS_EXIT">const SYS_EXIT</a>

```
searchKey: syscall.SYS_EXIT
```

```Go
const SYS_EXIT = 1
```

### <a id="SYS_FORK" href="#SYS_FORK">const SYS_FORK</a>

```
searchKey: syscall.SYS_FORK
```

```Go
const SYS_FORK = 2
```

### <a id="SYS_READ" href="#SYS_READ">const SYS_READ</a>

```
searchKey: syscall.SYS_READ
```

```Go
const SYS_READ = 3
```

### <a id="SYS_WRITE" href="#SYS_WRITE">const SYS_WRITE</a>

```
searchKey: syscall.SYS_WRITE
```

```Go
const SYS_WRITE = 4
```

### <a id="SYS_OPEN" href="#SYS_OPEN">const SYS_OPEN</a>

```
searchKey: syscall.SYS_OPEN
```

```Go
const SYS_OPEN = 5
```

### <a id="SYS_CLOSE" href="#SYS_CLOSE">const SYS_CLOSE</a>

```
searchKey: syscall.SYS_CLOSE
```

```Go
const SYS_CLOSE = 6
```

### <a id="SYS_WAIT4" href="#SYS_WAIT4">const SYS_WAIT4</a>

```
searchKey: syscall.SYS_WAIT4
```

```Go
const SYS_WAIT4 = 7
```

### <a id="SYS_LINK" href="#SYS_LINK">const SYS_LINK</a>

```
searchKey: syscall.SYS_LINK
```

```Go
const SYS_LINK = 9
```

### <a id="SYS_UNLINK" href="#SYS_UNLINK">const SYS_UNLINK</a>

```
searchKey: syscall.SYS_UNLINK
```

```Go
const SYS_UNLINK = 10
```

### <a id="SYS_CHDIR" href="#SYS_CHDIR">const SYS_CHDIR</a>

```
searchKey: syscall.SYS_CHDIR
```

```Go
const SYS_CHDIR = 12
```

### <a id="SYS_FCHDIR" href="#SYS_FCHDIR">const SYS_FCHDIR</a>

```
searchKey: syscall.SYS_FCHDIR
```

```Go
const SYS_FCHDIR = 13
```

### <a id="SYS_MKNOD" href="#SYS_MKNOD">const SYS_MKNOD</a>

```
searchKey: syscall.SYS_MKNOD
```

```Go
const SYS_MKNOD = 14
```

### <a id="SYS_CHMOD" href="#SYS_CHMOD">const SYS_CHMOD</a>

```
searchKey: syscall.SYS_CHMOD
```

```Go
const SYS_CHMOD = 15
```

### <a id="SYS_CHOWN" href="#SYS_CHOWN">const SYS_CHOWN</a>

```
searchKey: syscall.SYS_CHOWN
```

```Go
const SYS_CHOWN = 16
```

### <a id="SYS_GETFSSTAT" href="#SYS_GETFSSTAT">const SYS_GETFSSTAT</a>

```
searchKey: syscall.SYS_GETFSSTAT
```

```Go
const SYS_GETFSSTAT = 18
```

### <a id="SYS_GETPID" href="#SYS_GETPID">const SYS_GETPID</a>

```
searchKey: syscall.SYS_GETPID
```

```Go
const SYS_GETPID = 20
```

### <a id="SYS_SETUID" href="#SYS_SETUID">const SYS_SETUID</a>

```
searchKey: syscall.SYS_SETUID
```

```Go
const SYS_SETUID = 23
```

### <a id="SYS_GETUID" href="#SYS_GETUID">const SYS_GETUID</a>

```
searchKey: syscall.SYS_GETUID
```

```Go
const SYS_GETUID = 24
```

### <a id="SYS_GETEUID" href="#SYS_GETEUID">const SYS_GETEUID</a>

```
searchKey: syscall.SYS_GETEUID
```

```Go
const SYS_GETEUID = 25
```

### <a id="SYS_PTRACE" href="#SYS_PTRACE">const SYS_PTRACE</a>

```
searchKey: syscall.SYS_PTRACE
```

```Go
const SYS_PTRACE = 26
```

### <a id="SYS_RECVMSG" href="#SYS_RECVMSG">const SYS_RECVMSG</a>

```
searchKey: syscall.SYS_RECVMSG
```

```Go
const SYS_RECVMSG = 27
```

### <a id="SYS_SENDMSG" href="#SYS_SENDMSG">const SYS_SENDMSG</a>

```
searchKey: syscall.SYS_SENDMSG
```

```Go
const SYS_SENDMSG = 28
```

### <a id="SYS_RECVFROM" href="#SYS_RECVFROM">const SYS_RECVFROM</a>

```
searchKey: syscall.SYS_RECVFROM
```

```Go
const SYS_RECVFROM = 29
```

### <a id="SYS_ACCEPT" href="#SYS_ACCEPT">const SYS_ACCEPT</a>

```
searchKey: syscall.SYS_ACCEPT
```

```Go
const SYS_ACCEPT = 30
```

### <a id="SYS_GETPEERNAME" href="#SYS_GETPEERNAME">const SYS_GETPEERNAME</a>

```
searchKey: syscall.SYS_GETPEERNAME
```

```Go
const SYS_GETPEERNAME = 31
```

### <a id="SYS_GETSOCKNAME" href="#SYS_GETSOCKNAME">const SYS_GETSOCKNAME</a>

```
searchKey: syscall.SYS_GETSOCKNAME
```

```Go
const SYS_GETSOCKNAME = 32
```

### <a id="SYS_ACCESS" href="#SYS_ACCESS">const SYS_ACCESS</a>

```
searchKey: syscall.SYS_ACCESS
```

```Go
const SYS_ACCESS = 33
```

### <a id="SYS_CHFLAGS" href="#SYS_CHFLAGS">const SYS_CHFLAGS</a>

```
searchKey: syscall.SYS_CHFLAGS
```

```Go
const SYS_CHFLAGS = 34
```

### <a id="SYS_FCHFLAGS" href="#SYS_FCHFLAGS">const SYS_FCHFLAGS</a>

```
searchKey: syscall.SYS_FCHFLAGS
```

```Go
const SYS_FCHFLAGS = 35
```

### <a id="SYS_SYNC" href="#SYS_SYNC">const SYS_SYNC</a>

```
searchKey: syscall.SYS_SYNC
```

```Go
const SYS_SYNC = 36
```

### <a id="SYS_KILL" href="#SYS_KILL">const SYS_KILL</a>

```
searchKey: syscall.SYS_KILL
```

```Go
const SYS_KILL = 37
```

### <a id="SYS_GETPPID" href="#SYS_GETPPID">const SYS_GETPPID</a>

```
searchKey: syscall.SYS_GETPPID
```

```Go
const SYS_GETPPID = 39
```

### <a id="SYS_DUP" href="#SYS_DUP">const SYS_DUP</a>

```
searchKey: syscall.SYS_DUP
```

```Go
const SYS_DUP = 41
```

### <a id="SYS_PIPE" href="#SYS_PIPE">const SYS_PIPE</a>

```
searchKey: syscall.SYS_PIPE
```

```Go
const SYS_PIPE = 42
```

### <a id="SYS_GETEGID" href="#SYS_GETEGID">const SYS_GETEGID</a>

```
searchKey: syscall.SYS_GETEGID
```

```Go
const SYS_GETEGID = 43
```

### <a id="SYS_PROFIL" href="#SYS_PROFIL">const SYS_PROFIL</a>

```
searchKey: syscall.SYS_PROFIL
```

```Go
const SYS_PROFIL = 44
```

### <a id="SYS_SIGACTION" href="#SYS_SIGACTION">const SYS_SIGACTION</a>

```
searchKey: syscall.SYS_SIGACTION
```

```Go
const SYS_SIGACTION = 46
```

### <a id="SYS_GETGID" href="#SYS_GETGID">const SYS_GETGID</a>

```
searchKey: syscall.SYS_GETGID
```

```Go
const SYS_GETGID = 47
```

### <a id="SYS_SIGPROCMASK" href="#SYS_SIGPROCMASK">const SYS_SIGPROCMASK</a>

```
searchKey: syscall.SYS_SIGPROCMASK
```

```Go
const SYS_SIGPROCMASK = 48
```

### <a id="SYS_GETLOGIN" href="#SYS_GETLOGIN">const SYS_GETLOGIN</a>

```
searchKey: syscall.SYS_GETLOGIN
```

```Go
const SYS_GETLOGIN = 49
```

### <a id="SYS_SETLOGIN" href="#SYS_SETLOGIN">const SYS_SETLOGIN</a>

```
searchKey: syscall.SYS_SETLOGIN
```

```Go
const SYS_SETLOGIN = 50
```

### <a id="SYS_ACCT" href="#SYS_ACCT">const SYS_ACCT</a>

```
searchKey: syscall.SYS_ACCT
```

```Go
const SYS_ACCT = 51
```

### <a id="SYS_SIGPENDING" href="#SYS_SIGPENDING">const SYS_SIGPENDING</a>

```
searchKey: syscall.SYS_SIGPENDING
```

```Go
const SYS_SIGPENDING = 52
```

### <a id="SYS_SIGALTSTACK" href="#SYS_SIGALTSTACK">const SYS_SIGALTSTACK</a>

```
searchKey: syscall.SYS_SIGALTSTACK
```

```Go
const SYS_SIGALTSTACK = 53
```

### <a id="SYS_IOCTL" href="#SYS_IOCTL">const SYS_IOCTL</a>

```
searchKey: syscall.SYS_IOCTL
```

```Go
const SYS_IOCTL = 54
```

### <a id="SYS_REBOOT" href="#SYS_REBOOT">const SYS_REBOOT</a>

```
searchKey: syscall.SYS_REBOOT
```

```Go
const SYS_REBOOT = 55
```

### <a id="SYS_REVOKE" href="#SYS_REVOKE">const SYS_REVOKE</a>

```
searchKey: syscall.SYS_REVOKE
```

```Go
const SYS_REVOKE = 56
```

### <a id="SYS_SYMLINK" href="#SYS_SYMLINK">const SYS_SYMLINK</a>

```
searchKey: syscall.SYS_SYMLINK
```

```Go
const SYS_SYMLINK = 57
```

### <a id="SYS_READLINK" href="#SYS_READLINK">const SYS_READLINK</a>

```
searchKey: syscall.SYS_READLINK
```

```Go
const SYS_READLINK = 58
```

### <a id="SYS_EXECVE" href="#SYS_EXECVE">const SYS_EXECVE</a>

```
searchKey: syscall.SYS_EXECVE
```

```Go
const SYS_EXECVE = 59
```

### <a id="SYS_UMASK" href="#SYS_UMASK">const SYS_UMASK</a>

```
searchKey: syscall.SYS_UMASK
```

```Go
const SYS_UMASK = 60
```

### <a id="SYS_CHROOT" href="#SYS_CHROOT">const SYS_CHROOT</a>

```
searchKey: syscall.SYS_CHROOT
```

```Go
const SYS_CHROOT = 61
```

### <a id="SYS_MSYNC" href="#SYS_MSYNC">const SYS_MSYNC</a>

```
searchKey: syscall.SYS_MSYNC
```

```Go
const SYS_MSYNC = 65
```

### <a id="SYS_VFORK" href="#SYS_VFORK">const SYS_VFORK</a>

```
searchKey: syscall.SYS_VFORK
```

```Go
const SYS_VFORK = 66
```

### <a id="SYS_MUNMAP" href="#SYS_MUNMAP">const SYS_MUNMAP</a>

```
searchKey: syscall.SYS_MUNMAP
```

```Go
const SYS_MUNMAP = 73
```

### <a id="SYS_MPROTECT" href="#SYS_MPROTECT">const SYS_MPROTECT</a>

```
searchKey: syscall.SYS_MPROTECT
```

```Go
const SYS_MPROTECT = 74
```

### <a id="SYS_MADVISE" href="#SYS_MADVISE">const SYS_MADVISE</a>

```
searchKey: syscall.SYS_MADVISE
```

```Go
const SYS_MADVISE = 75
```

### <a id="SYS_MINCORE" href="#SYS_MINCORE">const SYS_MINCORE</a>

```
searchKey: syscall.SYS_MINCORE
```

```Go
const SYS_MINCORE = 78
```

### <a id="SYS_GETGROUPS" href="#SYS_GETGROUPS">const SYS_GETGROUPS</a>

```
searchKey: syscall.SYS_GETGROUPS
```

```Go
const SYS_GETGROUPS = 79
```

### <a id="SYS_SETGROUPS" href="#SYS_SETGROUPS">const SYS_SETGROUPS</a>

```
searchKey: syscall.SYS_SETGROUPS
```

```Go
const SYS_SETGROUPS = 80
```

### <a id="SYS_GETPGRP" href="#SYS_GETPGRP">const SYS_GETPGRP</a>

```
searchKey: syscall.SYS_GETPGRP
```

```Go
const SYS_GETPGRP = 81
```

### <a id="SYS_SETPGID" href="#SYS_SETPGID">const SYS_SETPGID</a>

```
searchKey: syscall.SYS_SETPGID
```

```Go
const SYS_SETPGID = 82
```

### <a id="SYS_SETITIMER" href="#SYS_SETITIMER">const SYS_SETITIMER</a>

```
searchKey: syscall.SYS_SETITIMER
```

```Go
const SYS_SETITIMER = 83
```

### <a id="SYS_SWAPON" href="#SYS_SWAPON">const SYS_SWAPON</a>

```
searchKey: syscall.SYS_SWAPON
```

```Go
const SYS_SWAPON = 85
```

### <a id="SYS_GETITIMER" href="#SYS_GETITIMER">const SYS_GETITIMER</a>

```
searchKey: syscall.SYS_GETITIMER
```

```Go
const SYS_GETITIMER = 86
```

### <a id="SYS_GETDTABLESIZE" href="#SYS_GETDTABLESIZE">const SYS_GETDTABLESIZE</a>

```
searchKey: syscall.SYS_GETDTABLESIZE
```

```Go
const SYS_GETDTABLESIZE = 89
```

### <a id="SYS_DUP2" href="#SYS_DUP2">const SYS_DUP2</a>

```
searchKey: syscall.SYS_DUP2
```

```Go
const SYS_DUP2 = 90
```

### <a id="SYS_FCNTL" href="#SYS_FCNTL">const SYS_FCNTL</a>

```
searchKey: syscall.SYS_FCNTL
```

```Go
const SYS_FCNTL = 92
```

### <a id="SYS_SELECT" href="#SYS_SELECT">const SYS_SELECT</a>

```
searchKey: syscall.SYS_SELECT
```

```Go
const SYS_SELECT = 93
```

### <a id="SYS_FSYNC" href="#SYS_FSYNC">const SYS_FSYNC</a>

```
searchKey: syscall.SYS_FSYNC
```

```Go
const SYS_FSYNC = 95
```

### <a id="SYS_SETPRIORITY" href="#SYS_SETPRIORITY">const SYS_SETPRIORITY</a>

```
searchKey: syscall.SYS_SETPRIORITY
```

```Go
const SYS_SETPRIORITY = 96
```

### <a id="SYS_SOCKET" href="#SYS_SOCKET">const SYS_SOCKET</a>

```
searchKey: syscall.SYS_SOCKET
```

```Go
const SYS_SOCKET = 97
```

### <a id="SYS_CONNECT" href="#SYS_CONNECT">const SYS_CONNECT</a>

```
searchKey: syscall.SYS_CONNECT
```

```Go
const SYS_CONNECT = 98
```

### <a id="SYS_GETPRIORITY" href="#SYS_GETPRIORITY">const SYS_GETPRIORITY</a>

```
searchKey: syscall.SYS_GETPRIORITY
```

```Go
const SYS_GETPRIORITY = 100
```

### <a id="SYS_BIND" href="#SYS_BIND">const SYS_BIND</a>

```
searchKey: syscall.SYS_BIND
```

```Go
const SYS_BIND = 104
```

### <a id="SYS_SETSOCKOPT" href="#SYS_SETSOCKOPT">const SYS_SETSOCKOPT</a>

```
searchKey: syscall.SYS_SETSOCKOPT
```

```Go
const SYS_SETSOCKOPT = 105
```

### <a id="SYS_LISTEN" href="#SYS_LISTEN">const SYS_LISTEN</a>

```
searchKey: syscall.SYS_LISTEN
```

```Go
const SYS_LISTEN = 106
```

### <a id="SYS_SIGSUSPEND" href="#SYS_SIGSUSPEND">const SYS_SIGSUSPEND</a>

```
searchKey: syscall.SYS_SIGSUSPEND
```

```Go
const SYS_SIGSUSPEND = 111
```

### <a id="SYS_GETTIMEOFDAY" href="#SYS_GETTIMEOFDAY">const SYS_GETTIMEOFDAY</a>

```
searchKey: syscall.SYS_GETTIMEOFDAY
```

```Go
const SYS_GETTIMEOFDAY = 116
```

### <a id="SYS_GETRUSAGE" href="#SYS_GETRUSAGE">const SYS_GETRUSAGE</a>

```
searchKey: syscall.SYS_GETRUSAGE
```

```Go
const SYS_GETRUSAGE = 117
```

### <a id="SYS_GETSOCKOPT" href="#SYS_GETSOCKOPT">const SYS_GETSOCKOPT</a>

```
searchKey: syscall.SYS_GETSOCKOPT
```

```Go
const SYS_GETSOCKOPT = 118
```

### <a id="SYS_READV" href="#SYS_READV">const SYS_READV</a>

```
searchKey: syscall.SYS_READV
```

```Go
const SYS_READV = 120
```

### <a id="SYS_WRITEV" href="#SYS_WRITEV">const SYS_WRITEV</a>

```
searchKey: syscall.SYS_WRITEV
```

```Go
const SYS_WRITEV = 121
```

### <a id="SYS_SETTIMEOFDAY" href="#SYS_SETTIMEOFDAY">const SYS_SETTIMEOFDAY</a>

```
searchKey: syscall.SYS_SETTIMEOFDAY
```

```Go
const SYS_SETTIMEOFDAY = 122
```

### <a id="SYS_FCHOWN" href="#SYS_FCHOWN">const SYS_FCHOWN</a>

```
searchKey: syscall.SYS_FCHOWN
```

```Go
const SYS_FCHOWN = 123
```

### <a id="SYS_FCHMOD" href="#SYS_FCHMOD">const SYS_FCHMOD</a>

```
searchKey: syscall.SYS_FCHMOD
```

```Go
const SYS_FCHMOD = 124
```

### <a id="SYS_SETREUID" href="#SYS_SETREUID">const SYS_SETREUID</a>

```
searchKey: syscall.SYS_SETREUID
```

```Go
const SYS_SETREUID = 126
```

### <a id="SYS_SETREGID" href="#SYS_SETREGID">const SYS_SETREGID</a>

```
searchKey: syscall.SYS_SETREGID
```

```Go
const SYS_SETREGID = 127
```

### <a id="SYS_RENAME" href="#SYS_RENAME">const SYS_RENAME</a>

```
searchKey: syscall.SYS_RENAME
```

```Go
const SYS_RENAME = 128
```

### <a id="SYS_FLOCK" href="#SYS_FLOCK">const SYS_FLOCK</a>

```
searchKey: syscall.SYS_FLOCK
```

```Go
const SYS_FLOCK = 131
```

### <a id="SYS_MKFIFO" href="#SYS_MKFIFO">const SYS_MKFIFO</a>

```
searchKey: syscall.SYS_MKFIFO
```

```Go
const SYS_MKFIFO = 132
```

### <a id="SYS_SENDTO" href="#SYS_SENDTO">const SYS_SENDTO</a>

```
searchKey: syscall.SYS_SENDTO
```

```Go
const SYS_SENDTO = 133
```

### <a id="SYS_SHUTDOWN" href="#SYS_SHUTDOWN">const SYS_SHUTDOWN</a>

```
searchKey: syscall.SYS_SHUTDOWN
```

```Go
const SYS_SHUTDOWN = 134
```

### <a id="SYS_SOCKETPAIR" href="#SYS_SOCKETPAIR">const SYS_SOCKETPAIR</a>

```
searchKey: syscall.SYS_SOCKETPAIR
```

```Go
const SYS_SOCKETPAIR = 135
```

### <a id="SYS_MKDIR" href="#SYS_MKDIR">const SYS_MKDIR</a>

```
searchKey: syscall.SYS_MKDIR
```

```Go
const SYS_MKDIR = 136
```

### <a id="SYS_RMDIR" href="#SYS_RMDIR">const SYS_RMDIR</a>

```
searchKey: syscall.SYS_RMDIR
```

```Go
const SYS_RMDIR = 137
```

### <a id="SYS_UTIMES" href="#SYS_UTIMES">const SYS_UTIMES</a>

```
searchKey: syscall.SYS_UTIMES
```

```Go
const SYS_UTIMES = 138
```

### <a id="SYS_FUTIMES" href="#SYS_FUTIMES">const SYS_FUTIMES</a>

```
searchKey: syscall.SYS_FUTIMES
```

```Go
const SYS_FUTIMES = 139
```

### <a id="SYS_ADJTIME" href="#SYS_ADJTIME">const SYS_ADJTIME</a>

```
searchKey: syscall.SYS_ADJTIME
```

```Go
const SYS_ADJTIME = 140
```

### <a id="SYS_GETHOSTUUID" href="#SYS_GETHOSTUUID">const SYS_GETHOSTUUID</a>

```
searchKey: syscall.SYS_GETHOSTUUID
```

```Go
const SYS_GETHOSTUUID = 142
```

### <a id="SYS_SETSID" href="#SYS_SETSID">const SYS_SETSID</a>

```
searchKey: syscall.SYS_SETSID
```

```Go
const SYS_SETSID = 147
```

### <a id="SYS_GETPGID" href="#SYS_GETPGID">const SYS_GETPGID</a>

```
searchKey: syscall.SYS_GETPGID
```

```Go
const SYS_GETPGID = 151
```

### <a id="SYS_SETPRIVEXEC" href="#SYS_SETPRIVEXEC">const SYS_SETPRIVEXEC</a>

```
searchKey: syscall.SYS_SETPRIVEXEC
```

```Go
const SYS_SETPRIVEXEC = 152
```

### <a id="SYS_PREAD" href="#SYS_PREAD">const SYS_PREAD</a>

```
searchKey: syscall.SYS_PREAD
```

```Go
const SYS_PREAD = 153
```

### <a id="SYS_PWRITE" href="#SYS_PWRITE">const SYS_PWRITE</a>

```
searchKey: syscall.SYS_PWRITE
```

```Go
const SYS_PWRITE = 154
```

### <a id="SYS_NFSSVC" href="#SYS_NFSSVC">const SYS_NFSSVC</a>

```
searchKey: syscall.SYS_NFSSVC
```

```Go
const SYS_NFSSVC = 155
```

### <a id="SYS_STATFS" href="#SYS_STATFS">const SYS_STATFS</a>

```
searchKey: syscall.SYS_STATFS
```

```Go
const SYS_STATFS = 157
```

### <a id="SYS_FSTATFS" href="#SYS_FSTATFS">const SYS_FSTATFS</a>

```
searchKey: syscall.SYS_FSTATFS
```

```Go
const SYS_FSTATFS = 158
```

### <a id="SYS_UNMOUNT" href="#SYS_UNMOUNT">const SYS_UNMOUNT</a>

```
searchKey: syscall.SYS_UNMOUNT
```

```Go
const SYS_UNMOUNT = 159
```

### <a id="SYS_GETFH" href="#SYS_GETFH">const SYS_GETFH</a>

```
searchKey: syscall.SYS_GETFH
```

```Go
const SYS_GETFH = 161
```

### <a id="SYS_QUOTACTL" href="#SYS_QUOTACTL">const SYS_QUOTACTL</a>

```
searchKey: syscall.SYS_QUOTACTL
```

```Go
const SYS_QUOTACTL = 165
```

### <a id="SYS_MOUNT" href="#SYS_MOUNT">const SYS_MOUNT</a>

```
searchKey: syscall.SYS_MOUNT
```

```Go
const SYS_MOUNT = 167
```

### <a id="SYS_CSOPS" href="#SYS_CSOPS">const SYS_CSOPS</a>

```
searchKey: syscall.SYS_CSOPS
```

```Go
const SYS_CSOPS = 169
```

### <a id="SYS_WAITID" href="#SYS_WAITID">const SYS_WAITID</a>

```
searchKey: syscall.SYS_WAITID
```

```Go
const SYS_WAITID = 173
```

### <a id="SYS_ADD_PROFIL" href="#SYS_ADD_PROFIL">const SYS_ADD_PROFIL</a>

```
searchKey: syscall.SYS_ADD_PROFIL
```

```Go
const SYS_ADD_PROFIL = 176
```

### <a id="SYS_KDEBUG_TRACE" href="#SYS_KDEBUG_TRACE">const SYS_KDEBUG_TRACE</a>

```
searchKey: syscall.SYS_KDEBUG_TRACE
```

```Go
const SYS_KDEBUG_TRACE = 180
```

### <a id="SYS_SETGID" href="#SYS_SETGID">const SYS_SETGID</a>

```
searchKey: syscall.SYS_SETGID
```

```Go
const SYS_SETGID = 181
```

### <a id="SYS_SETEGID" href="#SYS_SETEGID">const SYS_SETEGID</a>

```
searchKey: syscall.SYS_SETEGID
```

```Go
const SYS_SETEGID = 182
```

### <a id="SYS_SETEUID" href="#SYS_SETEUID">const SYS_SETEUID</a>

```
searchKey: syscall.SYS_SETEUID
```

```Go
const SYS_SETEUID = 183
```

### <a id="SYS_SIGRETURN" href="#SYS_SIGRETURN">const SYS_SIGRETURN</a>

```
searchKey: syscall.SYS_SIGRETURN
```

```Go
const SYS_SIGRETURN = 184
```

### <a id="SYS_CHUD" href="#SYS_CHUD">const SYS_CHUD</a>

```
searchKey: syscall.SYS_CHUD
```

```Go
const SYS_CHUD = 185
```

### <a id="SYS_FDATASYNC" href="#SYS_FDATASYNC">const SYS_FDATASYNC</a>

```
searchKey: syscall.SYS_FDATASYNC
```

```Go
const SYS_FDATASYNC = 187
```

### <a id="SYS_STAT" href="#SYS_STAT">const SYS_STAT</a>

```
searchKey: syscall.SYS_STAT
```

```Go
const SYS_STAT = 188
```

### <a id="SYS_FSTAT" href="#SYS_FSTAT">const SYS_FSTAT</a>

```
searchKey: syscall.SYS_FSTAT
```

```Go
const SYS_FSTAT = 189
```

### <a id="SYS_LSTAT" href="#SYS_LSTAT">const SYS_LSTAT</a>

```
searchKey: syscall.SYS_LSTAT
```

```Go
const SYS_LSTAT = 190
```

### <a id="SYS_PATHCONF" href="#SYS_PATHCONF">const SYS_PATHCONF</a>

```
searchKey: syscall.SYS_PATHCONF
```

```Go
const SYS_PATHCONF = 191
```

### <a id="SYS_FPATHCONF" href="#SYS_FPATHCONF">const SYS_FPATHCONF</a>

```
searchKey: syscall.SYS_FPATHCONF
```

```Go
const SYS_FPATHCONF = 192
```

### <a id="SYS_GETRLIMIT" href="#SYS_GETRLIMIT">const SYS_GETRLIMIT</a>

```
searchKey: syscall.SYS_GETRLIMIT
```

```Go
const SYS_GETRLIMIT = 194
```

### <a id="SYS_SETRLIMIT" href="#SYS_SETRLIMIT">const SYS_SETRLIMIT</a>

```
searchKey: syscall.SYS_SETRLIMIT
```

```Go
const SYS_SETRLIMIT = 195
```

### <a id="SYS_GETDIRENTRIES" href="#SYS_GETDIRENTRIES">const SYS_GETDIRENTRIES</a>

```
searchKey: syscall.SYS_GETDIRENTRIES
```

```Go
const SYS_GETDIRENTRIES = 196
```

### <a id="SYS_MMAP" href="#SYS_MMAP">const SYS_MMAP</a>

```
searchKey: syscall.SYS_MMAP
```

```Go
const SYS_MMAP = 197
```

### <a id="SYS_LSEEK" href="#SYS_LSEEK">const SYS_LSEEK</a>

```
searchKey: syscall.SYS_LSEEK
```

```Go
const SYS_LSEEK = 199
```

### <a id="SYS_TRUNCATE" href="#SYS_TRUNCATE">const SYS_TRUNCATE</a>

```
searchKey: syscall.SYS_TRUNCATE
```

```Go
const SYS_TRUNCATE = 200
```

### <a id="SYS_FTRUNCATE" href="#SYS_FTRUNCATE">const SYS_FTRUNCATE</a>

```
searchKey: syscall.SYS_FTRUNCATE
```

```Go
const SYS_FTRUNCATE = 201
```

### <a id="SYS___SYSCTL" href="#SYS___SYSCTL">const SYS___SYSCTL</a>

```
searchKey: syscall.SYS___SYSCTL
```

```Go
const SYS___SYSCTL = 202
```

### <a id="SYS_MLOCK" href="#SYS_MLOCK">const SYS_MLOCK</a>

```
searchKey: syscall.SYS_MLOCK
```

```Go
const SYS_MLOCK = 203
```

### <a id="SYS_MUNLOCK" href="#SYS_MUNLOCK">const SYS_MUNLOCK</a>

```
searchKey: syscall.SYS_MUNLOCK
```

```Go
const SYS_MUNLOCK = 204
```

### <a id="SYS_UNDELETE" href="#SYS_UNDELETE">const SYS_UNDELETE</a>

```
searchKey: syscall.SYS_UNDELETE
```

```Go
const SYS_UNDELETE = 205
```

### <a id="SYS_ATSOCKET" href="#SYS_ATSOCKET">const SYS_ATSOCKET</a>

```
searchKey: syscall.SYS_ATSOCKET
```

```Go
const SYS_ATSOCKET = 206
```

### <a id="SYS_ATGETMSG" href="#SYS_ATGETMSG">const SYS_ATGETMSG</a>

```
searchKey: syscall.SYS_ATGETMSG
```

```Go
const SYS_ATGETMSG = 207
```

### <a id="SYS_ATPUTMSG" href="#SYS_ATPUTMSG">const SYS_ATPUTMSG</a>

```
searchKey: syscall.SYS_ATPUTMSG
```

```Go
const SYS_ATPUTMSG = 208
```

### <a id="SYS_ATPSNDREQ" href="#SYS_ATPSNDREQ">const SYS_ATPSNDREQ</a>

```
searchKey: syscall.SYS_ATPSNDREQ
```

```Go
const SYS_ATPSNDREQ = 209
```

### <a id="SYS_ATPSNDRSP" href="#SYS_ATPSNDRSP">const SYS_ATPSNDRSP</a>

```
searchKey: syscall.SYS_ATPSNDRSP
```

```Go
const SYS_ATPSNDRSP = 210
```

### <a id="SYS_ATPGETREQ" href="#SYS_ATPGETREQ">const SYS_ATPGETREQ</a>

```
searchKey: syscall.SYS_ATPGETREQ
```

```Go
const SYS_ATPGETREQ = 211
```

### <a id="SYS_ATPGETRSP" href="#SYS_ATPGETRSP">const SYS_ATPGETRSP</a>

```
searchKey: syscall.SYS_ATPGETRSP
```

```Go
const SYS_ATPGETRSP = 212
```

### <a id="SYS_MKCOMPLEX" href="#SYS_MKCOMPLEX">const SYS_MKCOMPLEX</a>

```
searchKey: syscall.SYS_MKCOMPLEX
```

```Go
const SYS_MKCOMPLEX = 216
```

### <a id="SYS_STATV" href="#SYS_STATV">const SYS_STATV</a>

```
searchKey: syscall.SYS_STATV
```

```Go
const SYS_STATV = 217
```

### <a id="SYS_LSTATV" href="#SYS_LSTATV">const SYS_LSTATV</a>

```
searchKey: syscall.SYS_LSTATV
```

```Go
const SYS_LSTATV = 218
```

### <a id="SYS_FSTATV" href="#SYS_FSTATV">const SYS_FSTATV</a>

```
searchKey: syscall.SYS_FSTATV
```

```Go
const SYS_FSTATV = 219
```

### <a id="SYS_GETATTRLIST" href="#SYS_GETATTRLIST">const SYS_GETATTRLIST</a>

```
searchKey: syscall.SYS_GETATTRLIST
```

```Go
const SYS_GETATTRLIST = 220
```

### <a id="SYS_SETATTRLIST" href="#SYS_SETATTRLIST">const SYS_SETATTRLIST</a>

```
searchKey: syscall.SYS_SETATTRLIST
```

```Go
const SYS_SETATTRLIST = 221
```

### <a id="SYS_GETDIRENTRIESATTR" href="#SYS_GETDIRENTRIESATTR">const SYS_GETDIRENTRIESATTR</a>

```
searchKey: syscall.SYS_GETDIRENTRIESATTR
```

```Go
const SYS_GETDIRENTRIESATTR = 222
```

### <a id="SYS_EXCHANGEDATA" href="#SYS_EXCHANGEDATA">const SYS_EXCHANGEDATA</a>

```
searchKey: syscall.SYS_EXCHANGEDATA
```

```Go
const SYS_EXCHANGEDATA = 223
```

### <a id="SYS_SEARCHFS" href="#SYS_SEARCHFS">const SYS_SEARCHFS</a>

```
searchKey: syscall.SYS_SEARCHFS
```

```Go
const SYS_SEARCHFS = 225
```

### <a id="SYS_DELETE" href="#SYS_DELETE">const SYS_DELETE</a>

```
searchKey: syscall.SYS_DELETE
```

```Go
const SYS_DELETE = 226
```

### <a id="SYS_COPYFILE" href="#SYS_COPYFILE">const SYS_COPYFILE</a>

```
searchKey: syscall.SYS_COPYFILE
```

```Go
const SYS_COPYFILE = 227
```

### <a id="SYS_FGETATTRLIST" href="#SYS_FGETATTRLIST">const SYS_FGETATTRLIST</a>

```
searchKey: syscall.SYS_FGETATTRLIST
```

```Go
const SYS_FGETATTRLIST = 228
```

### <a id="SYS_FSETATTRLIST" href="#SYS_FSETATTRLIST">const SYS_FSETATTRLIST</a>

```
searchKey: syscall.SYS_FSETATTRLIST
```

```Go
const SYS_FSETATTRLIST = 229
```

### <a id="SYS_POLL" href="#SYS_POLL">const SYS_POLL</a>

```
searchKey: syscall.SYS_POLL
```

```Go
const SYS_POLL = 230
```

### <a id="SYS_WATCHEVENT" href="#SYS_WATCHEVENT">const SYS_WATCHEVENT</a>

```
searchKey: syscall.SYS_WATCHEVENT
```

```Go
const SYS_WATCHEVENT = 231
```

### <a id="SYS_WAITEVENT" href="#SYS_WAITEVENT">const SYS_WAITEVENT</a>

```
searchKey: syscall.SYS_WAITEVENT
```

```Go
const SYS_WAITEVENT = 232
```

### <a id="SYS_MODWATCH" href="#SYS_MODWATCH">const SYS_MODWATCH</a>

```
searchKey: syscall.SYS_MODWATCH
```

```Go
const SYS_MODWATCH = 233
```

### <a id="SYS_GETXATTR" href="#SYS_GETXATTR">const SYS_GETXATTR</a>

```
searchKey: syscall.SYS_GETXATTR
```

```Go
const SYS_GETXATTR = 234
```

### <a id="SYS_FGETXATTR" href="#SYS_FGETXATTR">const SYS_FGETXATTR</a>

```
searchKey: syscall.SYS_FGETXATTR
```

```Go
const SYS_FGETXATTR = 235
```

### <a id="SYS_SETXATTR" href="#SYS_SETXATTR">const SYS_SETXATTR</a>

```
searchKey: syscall.SYS_SETXATTR
```

```Go
const SYS_SETXATTR = 236
```

### <a id="SYS_FSETXATTR" href="#SYS_FSETXATTR">const SYS_FSETXATTR</a>

```
searchKey: syscall.SYS_FSETXATTR
```

```Go
const SYS_FSETXATTR = 237
```

### <a id="SYS_REMOVEXATTR" href="#SYS_REMOVEXATTR">const SYS_REMOVEXATTR</a>

```
searchKey: syscall.SYS_REMOVEXATTR
```

```Go
const SYS_REMOVEXATTR = 238
```

### <a id="SYS_FREMOVEXATTR" href="#SYS_FREMOVEXATTR">const SYS_FREMOVEXATTR</a>

```
searchKey: syscall.SYS_FREMOVEXATTR
```

```Go
const SYS_FREMOVEXATTR = 239
```

### <a id="SYS_LISTXATTR" href="#SYS_LISTXATTR">const SYS_LISTXATTR</a>

```
searchKey: syscall.SYS_LISTXATTR
```

```Go
const SYS_LISTXATTR = 240
```

### <a id="SYS_FLISTXATTR" href="#SYS_FLISTXATTR">const SYS_FLISTXATTR</a>

```
searchKey: syscall.SYS_FLISTXATTR
```

```Go
const SYS_FLISTXATTR = 241
```

### <a id="SYS_FSCTL" href="#SYS_FSCTL">const SYS_FSCTL</a>

```
searchKey: syscall.SYS_FSCTL
```

```Go
const SYS_FSCTL = 242
```

### <a id="SYS_INITGROUPS" href="#SYS_INITGROUPS">const SYS_INITGROUPS</a>

```
searchKey: syscall.SYS_INITGROUPS
```

```Go
const SYS_INITGROUPS = 243
```

### <a id="SYS_POSIX_SPAWN" href="#SYS_POSIX_SPAWN">const SYS_POSIX_SPAWN</a>

```
searchKey: syscall.SYS_POSIX_SPAWN
```

```Go
const SYS_POSIX_SPAWN = 244
```

### <a id="SYS_FFSCTL" href="#SYS_FFSCTL">const SYS_FFSCTL</a>

```
searchKey: syscall.SYS_FFSCTL
```

```Go
const SYS_FFSCTL = 245
```

### <a id="SYS_NFSCLNT" href="#SYS_NFSCLNT">const SYS_NFSCLNT</a>

```
searchKey: syscall.SYS_NFSCLNT
```

```Go
const SYS_NFSCLNT = 247
```

### <a id="SYS_FHOPEN" href="#SYS_FHOPEN">const SYS_FHOPEN</a>

```
searchKey: syscall.SYS_FHOPEN
```

```Go
const SYS_FHOPEN = 248
```

### <a id="SYS_MINHERIT" href="#SYS_MINHERIT">const SYS_MINHERIT</a>

```
searchKey: syscall.SYS_MINHERIT
```

```Go
const SYS_MINHERIT = 250
```

### <a id="SYS_SEMSYS" href="#SYS_SEMSYS">const SYS_SEMSYS</a>

```
searchKey: syscall.SYS_SEMSYS
```

```Go
const SYS_SEMSYS = 251
```

### <a id="SYS_MSGSYS" href="#SYS_MSGSYS">const SYS_MSGSYS</a>

```
searchKey: syscall.SYS_MSGSYS
```

```Go
const SYS_MSGSYS = 252
```

### <a id="SYS_SHMSYS" href="#SYS_SHMSYS">const SYS_SHMSYS</a>

```
searchKey: syscall.SYS_SHMSYS
```

```Go
const SYS_SHMSYS = 253
```

### <a id="SYS_SEMCTL" href="#SYS_SEMCTL">const SYS_SEMCTL</a>

```
searchKey: syscall.SYS_SEMCTL
```

```Go
const SYS_SEMCTL = 254
```

### <a id="SYS_SEMGET" href="#SYS_SEMGET">const SYS_SEMGET</a>

```
searchKey: syscall.SYS_SEMGET
```

```Go
const SYS_SEMGET = 255
```

### <a id="SYS_SEMOP" href="#SYS_SEMOP">const SYS_SEMOP</a>

```
searchKey: syscall.SYS_SEMOP
```

```Go
const SYS_SEMOP = 256
```

### <a id="SYS_MSGCTL" href="#SYS_MSGCTL">const SYS_MSGCTL</a>

```
searchKey: syscall.SYS_MSGCTL
```

```Go
const SYS_MSGCTL = 258
```

### <a id="SYS_MSGGET" href="#SYS_MSGGET">const SYS_MSGGET</a>

```
searchKey: syscall.SYS_MSGGET
```

```Go
const SYS_MSGGET = 259
```

### <a id="SYS_MSGSND" href="#SYS_MSGSND">const SYS_MSGSND</a>

```
searchKey: syscall.SYS_MSGSND
```

```Go
const SYS_MSGSND = 260
```

### <a id="SYS_MSGRCV" href="#SYS_MSGRCV">const SYS_MSGRCV</a>

```
searchKey: syscall.SYS_MSGRCV
```

```Go
const SYS_MSGRCV = 261
```

### <a id="SYS_SHMAT" href="#SYS_SHMAT">const SYS_SHMAT</a>

```
searchKey: syscall.SYS_SHMAT
```

```Go
const SYS_SHMAT = 262
```

### <a id="SYS_SHMCTL" href="#SYS_SHMCTL">const SYS_SHMCTL</a>

```
searchKey: syscall.SYS_SHMCTL
```

```Go
const SYS_SHMCTL = 263
```

### <a id="SYS_SHMDT" href="#SYS_SHMDT">const SYS_SHMDT</a>

```
searchKey: syscall.SYS_SHMDT
```

```Go
const SYS_SHMDT = 264
```

### <a id="SYS_SHMGET" href="#SYS_SHMGET">const SYS_SHMGET</a>

```
searchKey: syscall.SYS_SHMGET
```

```Go
const SYS_SHMGET = 265
```

### <a id="SYS_SHM_OPEN" href="#SYS_SHM_OPEN">const SYS_SHM_OPEN</a>

```
searchKey: syscall.SYS_SHM_OPEN
```

```Go
const SYS_SHM_OPEN = 266
```

### <a id="SYS_SHM_UNLINK" href="#SYS_SHM_UNLINK">const SYS_SHM_UNLINK</a>

```
searchKey: syscall.SYS_SHM_UNLINK
```

```Go
const SYS_SHM_UNLINK = 267
```

### <a id="SYS_SEM_OPEN" href="#SYS_SEM_OPEN">const SYS_SEM_OPEN</a>

```
searchKey: syscall.SYS_SEM_OPEN
```

```Go
const SYS_SEM_OPEN = 268
```

### <a id="SYS_SEM_CLOSE" href="#SYS_SEM_CLOSE">const SYS_SEM_CLOSE</a>

```
searchKey: syscall.SYS_SEM_CLOSE
```

```Go
const SYS_SEM_CLOSE = 269
```

### <a id="SYS_SEM_UNLINK" href="#SYS_SEM_UNLINK">const SYS_SEM_UNLINK</a>

```
searchKey: syscall.SYS_SEM_UNLINK
```

```Go
const SYS_SEM_UNLINK = 270
```

### <a id="SYS_SEM_WAIT" href="#SYS_SEM_WAIT">const SYS_SEM_WAIT</a>

```
searchKey: syscall.SYS_SEM_WAIT
```

```Go
const SYS_SEM_WAIT = 271
```

### <a id="SYS_SEM_TRYWAIT" href="#SYS_SEM_TRYWAIT">const SYS_SEM_TRYWAIT</a>

```
searchKey: syscall.SYS_SEM_TRYWAIT
```

```Go
const SYS_SEM_TRYWAIT = 272
```

### <a id="SYS_SEM_POST" href="#SYS_SEM_POST">const SYS_SEM_POST</a>

```
searchKey: syscall.SYS_SEM_POST
```

```Go
const SYS_SEM_POST = 273
```

### <a id="SYS_SEM_GETVALUE" href="#SYS_SEM_GETVALUE">const SYS_SEM_GETVALUE</a>

```
searchKey: syscall.SYS_SEM_GETVALUE
```

```Go
const SYS_SEM_GETVALUE = 274
```

### <a id="SYS_SEM_INIT" href="#SYS_SEM_INIT">const SYS_SEM_INIT</a>

```
searchKey: syscall.SYS_SEM_INIT
```

```Go
const SYS_SEM_INIT = 275
```

### <a id="SYS_SEM_DESTROY" href="#SYS_SEM_DESTROY">const SYS_SEM_DESTROY</a>

```
searchKey: syscall.SYS_SEM_DESTROY
```

```Go
const SYS_SEM_DESTROY = 276
```

### <a id="SYS_OPEN_EXTENDED" href="#SYS_OPEN_EXTENDED">const SYS_OPEN_EXTENDED</a>

```
searchKey: syscall.SYS_OPEN_EXTENDED
```

```Go
const SYS_OPEN_EXTENDED = 277
```

### <a id="SYS_UMASK_EXTENDED" href="#SYS_UMASK_EXTENDED">const SYS_UMASK_EXTENDED</a>

```
searchKey: syscall.SYS_UMASK_EXTENDED
```

```Go
const SYS_UMASK_EXTENDED = 278
```

### <a id="SYS_STAT_EXTENDED" href="#SYS_STAT_EXTENDED">const SYS_STAT_EXTENDED</a>

```
searchKey: syscall.SYS_STAT_EXTENDED
```

```Go
const SYS_STAT_EXTENDED = 279
```

### <a id="SYS_LSTAT_EXTENDED" href="#SYS_LSTAT_EXTENDED">const SYS_LSTAT_EXTENDED</a>

```
searchKey: syscall.SYS_LSTAT_EXTENDED
```

```Go
const SYS_LSTAT_EXTENDED = 280
```

### <a id="SYS_FSTAT_EXTENDED" href="#SYS_FSTAT_EXTENDED">const SYS_FSTAT_EXTENDED</a>

```
searchKey: syscall.SYS_FSTAT_EXTENDED
```

```Go
const SYS_FSTAT_EXTENDED = 281
```

### <a id="SYS_CHMOD_EXTENDED" href="#SYS_CHMOD_EXTENDED">const SYS_CHMOD_EXTENDED</a>

```
searchKey: syscall.SYS_CHMOD_EXTENDED
```

```Go
const SYS_CHMOD_EXTENDED = 282
```

### <a id="SYS_FCHMOD_EXTENDED" href="#SYS_FCHMOD_EXTENDED">const SYS_FCHMOD_EXTENDED</a>

```
searchKey: syscall.SYS_FCHMOD_EXTENDED
```

```Go
const SYS_FCHMOD_EXTENDED = 283
```

### <a id="SYS_ACCESS_EXTENDED" href="#SYS_ACCESS_EXTENDED">const SYS_ACCESS_EXTENDED</a>

```
searchKey: syscall.SYS_ACCESS_EXTENDED
```

```Go
const SYS_ACCESS_EXTENDED = 284
```

### <a id="SYS_SETTID" href="#SYS_SETTID">const SYS_SETTID</a>

```
searchKey: syscall.SYS_SETTID
```

```Go
const SYS_SETTID = 285
```

### <a id="SYS_GETTID" href="#SYS_GETTID">const SYS_GETTID</a>

```
searchKey: syscall.SYS_GETTID
```

```Go
const SYS_GETTID = 286
```

### <a id="SYS_SETSGROUPS" href="#SYS_SETSGROUPS">const SYS_SETSGROUPS</a>

```
searchKey: syscall.SYS_SETSGROUPS
```

```Go
const SYS_SETSGROUPS = 287
```

### <a id="SYS_GETSGROUPS" href="#SYS_GETSGROUPS">const SYS_GETSGROUPS</a>

```
searchKey: syscall.SYS_GETSGROUPS
```

```Go
const SYS_GETSGROUPS = 288
```

### <a id="SYS_SETWGROUPS" href="#SYS_SETWGROUPS">const SYS_SETWGROUPS</a>

```
searchKey: syscall.SYS_SETWGROUPS
```

```Go
const SYS_SETWGROUPS = 289
```

### <a id="SYS_GETWGROUPS" href="#SYS_GETWGROUPS">const SYS_GETWGROUPS</a>

```
searchKey: syscall.SYS_GETWGROUPS
```

```Go
const SYS_GETWGROUPS = 290
```

### <a id="SYS_MKFIFO_EXTENDED" href="#SYS_MKFIFO_EXTENDED">const SYS_MKFIFO_EXTENDED</a>

```
searchKey: syscall.SYS_MKFIFO_EXTENDED
```

```Go
const SYS_MKFIFO_EXTENDED = 291
```

### <a id="SYS_MKDIR_EXTENDED" href="#SYS_MKDIR_EXTENDED">const SYS_MKDIR_EXTENDED</a>

```
searchKey: syscall.SYS_MKDIR_EXTENDED
```

```Go
const SYS_MKDIR_EXTENDED = 292
```

### <a id="SYS_IDENTITYSVC" href="#SYS_IDENTITYSVC">const SYS_IDENTITYSVC</a>

```
searchKey: syscall.SYS_IDENTITYSVC
```

```Go
const SYS_IDENTITYSVC = 293
```

### <a id="SYS_SHARED_REGION_CHECK_NP" href="#SYS_SHARED_REGION_CHECK_NP">const SYS_SHARED_REGION_CHECK_NP</a>

```
searchKey: syscall.SYS_SHARED_REGION_CHECK_NP
```

```Go
const SYS_SHARED_REGION_CHECK_NP = 294
```

### <a id="SYS_VM_PRESSURE_MONITOR" href="#SYS_VM_PRESSURE_MONITOR">const SYS_VM_PRESSURE_MONITOR</a>

```
searchKey: syscall.SYS_VM_PRESSURE_MONITOR
```

```Go
const SYS_VM_PRESSURE_MONITOR = 296
```

### <a id="SYS_PSYNCH_RW_LONGRDLOCK" href="#SYS_PSYNCH_RW_LONGRDLOCK">const SYS_PSYNCH_RW_LONGRDLOCK</a>

```
searchKey: syscall.SYS_PSYNCH_RW_LONGRDLOCK
```

```Go
const SYS_PSYNCH_RW_LONGRDLOCK = 297
```

### <a id="SYS_PSYNCH_RW_YIELDWRLOCK" href="#SYS_PSYNCH_RW_YIELDWRLOCK">const SYS_PSYNCH_RW_YIELDWRLOCK</a>

```
searchKey: syscall.SYS_PSYNCH_RW_YIELDWRLOCK
```

```Go
const SYS_PSYNCH_RW_YIELDWRLOCK = 298
```

### <a id="SYS_PSYNCH_RW_DOWNGRADE" href="#SYS_PSYNCH_RW_DOWNGRADE">const SYS_PSYNCH_RW_DOWNGRADE</a>

```
searchKey: syscall.SYS_PSYNCH_RW_DOWNGRADE
```

```Go
const SYS_PSYNCH_RW_DOWNGRADE = 299
```

### <a id="SYS_PSYNCH_RW_UPGRADE" href="#SYS_PSYNCH_RW_UPGRADE">const SYS_PSYNCH_RW_UPGRADE</a>

```
searchKey: syscall.SYS_PSYNCH_RW_UPGRADE
```

```Go
const SYS_PSYNCH_RW_UPGRADE = 300
```

### <a id="SYS_PSYNCH_MUTEXWAIT" href="#SYS_PSYNCH_MUTEXWAIT">const SYS_PSYNCH_MUTEXWAIT</a>

```
searchKey: syscall.SYS_PSYNCH_MUTEXWAIT
```

```Go
const SYS_PSYNCH_MUTEXWAIT = 301
```

### <a id="SYS_PSYNCH_MUTEXDROP" href="#SYS_PSYNCH_MUTEXDROP">const SYS_PSYNCH_MUTEXDROP</a>

```
searchKey: syscall.SYS_PSYNCH_MUTEXDROP
```

```Go
const SYS_PSYNCH_MUTEXDROP = 302
```

### <a id="SYS_PSYNCH_CVBROAD" href="#SYS_PSYNCH_CVBROAD">const SYS_PSYNCH_CVBROAD</a>

```
searchKey: syscall.SYS_PSYNCH_CVBROAD
```

```Go
const SYS_PSYNCH_CVBROAD = 303
```

### <a id="SYS_PSYNCH_CVSIGNAL" href="#SYS_PSYNCH_CVSIGNAL">const SYS_PSYNCH_CVSIGNAL</a>

```
searchKey: syscall.SYS_PSYNCH_CVSIGNAL
```

```Go
const SYS_PSYNCH_CVSIGNAL = 304
```

### <a id="SYS_PSYNCH_CVWAIT" href="#SYS_PSYNCH_CVWAIT">const SYS_PSYNCH_CVWAIT</a>

```
searchKey: syscall.SYS_PSYNCH_CVWAIT
```

```Go
const SYS_PSYNCH_CVWAIT = 305
```

### <a id="SYS_PSYNCH_RW_RDLOCK" href="#SYS_PSYNCH_RW_RDLOCK">const SYS_PSYNCH_RW_RDLOCK</a>

```
searchKey: syscall.SYS_PSYNCH_RW_RDLOCK
```

```Go
const SYS_PSYNCH_RW_RDLOCK = 306
```

### <a id="SYS_PSYNCH_RW_WRLOCK" href="#SYS_PSYNCH_RW_WRLOCK">const SYS_PSYNCH_RW_WRLOCK</a>

```
searchKey: syscall.SYS_PSYNCH_RW_WRLOCK
```

```Go
const SYS_PSYNCH_RW_WRLOCK = 307
```

### <a id="SYS_PSYNCH_RW_UNLOCK" href="#SYS_PSYNCH_RW_UNLOCK">const SYS_PSYNCH_RW_UNLOCK</a>

```
searchKey: syscall.SYS_PSYNCH_RW_UNLOCK
```

```Go
const SYS_PSYNCH_RW_UNLOCK = 308
```

### <a id="SYS_PSYNCH_RW_UNLOCK2" href="#SYS_PSYNCH_RW_UNLOCK2">const SYS_PSYNCH_RW_UNLOCK2</a>

```
searchKey: syscall.SYS_PSYNCH_RW_UNLOCK2
```

```Go
const SYS_PSYNCH_RW_UNLOCK2 = 309
```

### <a id="SYS_GETSID" href="#SYS_GETSID">const SYS_GETSID</a>

```
searchKey: syscall.SYS_GETSID
```

```Go
const SYS_GETSID = 310
```

### <a id="SYS_SETTID_WITH_PID" href="#SYS_SETTID_WITH_PID">const SYS_SETTID_WITH_PID</a>

```
searchKey: syscall.SYS_SETTID_WITH_PID
```

```Go
const SYS_SETTID_WITH_PID = 311
```

### <a id="SYS_PSYNCH_CVCLRPREPOST" href="#SYS_PSYNCH_CVCLRPREPOST">const SYS_PSYNCH_CVCLRPREPOST</a>

```
searchKey: syscall.SYS_PSYNCH_CVCLRPREPOST
```

```Go
const SYS_PSYNCH_CVCLRPREPOST = 312
```

### <a id="SYS_AIO_FSYNC" href="#SYS_AIO_FSYNC">const SYS_AIO_FSYNC</a>

```
searchKey: syscall.SYS_AIO_FSYNC
```

```Go
const SYS_AIO_FSYNC = 313
```

### <a id="SYS_AIO_RETURN" href="#SYS_AIO_RETURN">const SYS_AIO_RETURN</a>

```
searchKey: syscall.SYS_AIO_RETURN
```

```Go
const SYS_AIO_RETURN = 314
```

### <a id="SYS_AIO_SUSPEND" href="#SYS_AIO_SUSPEND">const SYS_AIO_SUSPEND</a>

```
searchKey: syscall.SYS_AIO_SUSPEND
```

```Go
const SYS_AIO_SUSPEND = 315
```

### <a id="SYS_AIO_CANCEL" href="#SYS_AIO_CANCEL">const SYS_AIO_CANCEL</a>

```
searchKey: syscall.SYS_AIO_CANCEL
```

```Go
const SYS_AIO_CANCEL = 316
```

### <a id="SYS_AIO_ERROR" href="#SYS_AIO_ERROR">const SYS_AIO_ERROR</a>

```
searchKey: syscall.SYS_AIO_ERROR
```

```Go
const SYS_AIO_ERROR = 317
```

### <a id="SYS_AIO_READ" href="#SYS_AIO_READ">const SYS_AIO_READ</a>

```
searchKey: syscall.SYS_AIO_READ
```

```Go
const SYS_AIO_READ = 318
```

### <a id="SYS_AIO_WRITE" href="#SYS_AIO_WRITE">const SYS_AIO_WRITE</a>

```
searchKey: syscall.SYS_AIO_WRITE
```

```Go
const SYS_AIO_WRITE = 319
```

### <a id="SYS_LIO_LISTIO" href="#SYS_LIO_LISTIO">const SYS_LIO_LISTIO</a>

```
searchKey: syscall.SYS_LIO_LISTIO
```

```Go
const SYS_LIO_LISTIO = 320
```

### <a id="SYS_IOPOLICYSYS" href="#SYS_IOPOLICYSYS">const SYS_IOPOLICYSYS</a>

```
searchKey: syscall.SYS_IOPOLICYSYS
```

```Go
const SYS_IOPOLICYSYS = 322
```

### <a id="SYS_PROCESS_POLICY" href="#SYS_PROCESS_POLICY">const SYS_PROCESS_POLICY</a>

```
searchKey: syscall.SYS_PROCESS_POLICY
```

```Go
const SYS_PROCESS_POLICY = 323
```

### <a id="SYS_MLOCKALL" href="#SYS_MLOCKALL">const SYS_MLOCKALL</a>

```
searchKey: syscall.SYS_MLOCKALL
```

```Go
const SYS_MLOCKALL = 324
```

### <a id="SYS_MUNLOCKALL" href="#SYS_MUNLOCKALL">const SYS_MUNLOCKALL</a>

```
searchKey: syscall.SYS_MUNLOCKALL
```

```Go
const SYS_MUNLOCKALL = 325
```

### <a id="SYS_ISSETUGID" href="#SYS_ISSETUGID">const SYS_ISSETUGID</a>

```
searchKey: syscall.SYS_ISSETUGID
```

```Go
const SYS_ISSETUGID = 327
```

### <a id="SYS___PTHREAD_KILL" href="#SYS___PTHREAD_KILL">const SYS___PTHREAD_KILL</a>

```
searchKey: syscall.SYS___PTHREAD_KILL
```

```Go
const SYS___PTHREAD_KILL = 328
```

### <a id="SYS___PTHREAD_SIGMASK" href="#SYS___PTHREAD_SIGMASK">const SYS___PTHREAD_SIGMASK</a>

```
searchKey: syscall.SYS___PTHREAD_SIGMASK
```

```Go
const SYS___PTHREAD_SIGMASK = 329
```

### <a id="SYS___SIGWAIT" href="#SYS___SIGWAIT">const SYS___SIGWAIT</a>

```
searchKey: syscall.SYS___SIGWAIT
```

```Go
const SYS___SIGWAIT = 330
```

### <a id="SYS___DISABLE_THREADSIGNAL" href="#SYS___DISABLE_THREADSIGNAL">const SYS___DISABLE_THREADSIGNAL</a>

```
searchKey: syscall.SYS___DISABLE_THREADSIGNAL
```

```Go
const SYS___DISABLE_THREADSIGNAL = 331
```

### <a id="SYS___PTHREAD_MARKCANCEL" href="#SYS___PTHREAD_MARKCANCEL">const SYS___PTHREAD_MARKCANCEL</a>

```
searchKey: syscall.SYS___PTHREAD_MARKCANCEL
```

```Go
const SYS___PTHREAD_MARKCANCEL = 332
```

### <a id="SYS___PTHREAD_CANCELED" href="#SYS___PTHREAD_CANCELED">const SYS___PTHREAD_CANCELED</a>

```
searchKey: syscall.SYS___PTHREAD_CANCELED
```

```Go
const SYS___PTHREAD_CANCELED = 333
```

### <a id="SYS___SEMWAIT_SIGNAL" href="#SYS___SEMWAIT_SIGNAL">const SYS___SEMWAIT_SIGNAL</a>

```
searchKey: syscall.SYS___SEMWAIT_SIGNAL
```

```Go
const SYS___SEMWAIT_SIGNAL = 334
```

### <a id="SYS_PROC_INFO" href="#SYS_PROC_INFO">const SYS_PROC_INFO</a>

```
searchKey: syscall.SYS_PROC_INFO
```

```Go
const SYS_PROC_INFO = 336
```

### <a id="SYS_SENDFILE" href="#SYS_SENDFILE">const SYS_SENDFILE</a>

```
searchKey: syscall.SYS_SENDFILE
```

```Go
const SYS_SENDFILE = 337
```

### <a id="SYS_STAT64" href="#SYS_STAT64">const SYS_STAT64</a>

```
searchKey: syscall.SYS_STAT64
```

```Go
const SYS_STAT64 = 338
```

### <a id="SYS_FSTAT64" href="#SYS_FSTAT64">const SYS_FSTAT64</a>

```
searchKey: syscall.SYS_FSTAT64
```

```Go
const SYS_FSTAT64 = 339
```

### <a id="SYS_LSTAT64" href="#SYS_LSTAT64">const SYS_LSTAT64</a>

```
searchKey: syscall.SYS_LSTAT64
```

```Go
const SYS_LSTAT64 = 340
```

### <a id="SYS_STAT64_EXTENDED" href="#SYS_STAT64_EXTENDED">const SYS_STAT64_EXTENDED</a>

```
searchKey: syscall.SYS_STAT64_EXTENDED
```

```Go
const SYS_STAT64_EXTENDED = 341
```

### <a id="SYS_LSTAT64_EXTENDED" href="#SYS_LSTAT64_EXTENDED">const SYS_LSTAT64_EXTENDED</a>

```
searchKey: syscall.SYS_LSTAT64_EXTENDED
```

```Go
const SYS_LSTAT64_EXTENDED = 342
```

### <a id="SYS_FSTAT64_EXTENDED" href="#SYS_FSTAT64_EXTENDED">const SYS_FSTAT64_EXTENDED</a>

```
searchKey: syscall.SYS_FSTAT64_EXTENDED
```

```Go
const SYS_FSTAT64_EXTENDED = 343
```

### <a id="SYS_GETDIRENTRIES64" href="#SYS_GETDIRENTRIES64">const SYS_GETDIRENTRIES64</a>

```
searchKey: syscall.SYS_GETDIRENTRIES64
```

```Go
const SYS_GETDIRENTRIES64 = 344
```

### <a id="SYS_STATFS64" href="#SYS_STATFS64">const SYS_STATFS64</a>

```
searchKey: syscall.SYS_STATFS64
```

```Go
const SYS_STATFS64 = 345
```

### <a id="SYS_FSTATFS64" href="#SYS_FSTATFS64">const SYS_FSTATFS64</a>

```
searchKey: syscall.SYS_FSTATFS64
```

```Go
const SYS_FSTATFS64 = 346
```

### <a id="SYS_GETFSSTAT64" href="#SYS_GETFSSTAT64">const SYS_GETFSSTAT64</a>

```
searchKey: syscall.SYS_GETFSSTAT64
```

```Go
const SYS_GETFSSTAT64 = 347
```

### <a id="SYS___PTHREAD_CHDIR" href="#SYS___PTHREAD_CHDIR">const SYS___PTHREAD_CHDIR</a>

```
searchKey: syscall.SYS___PTHREAD_CHDIR
```

```Go
const SYS___PTHREAD_CHDIR = 348
```

### <a id="SYS___PTHREAD_FCHDIR" href="#SYS___PTHREAD_FCHDIR">const SYS___PTHREAD_FCHDIR</a>

```
searchKey: syscall.SYS___PTHREAD_FCHDIR
```

```Go
const SYS___PTHREAD_FCHDIR = 349
```

### <a id="SYS_AUDIT" href="#SYS_AUDIT">const SYS_AUDIT</a>

```
searchKey: syscall.SYS_AUDIT
```

```Go
const SYS_AUDIT = 350
```

### <a id="SYS_AUDITON" href="#SYS_AUDITON">const SYS_AUDITON</a>

```
searchKey: syscall.SYS_AUDITON
```

```Go
const SYS_AUDITON = 351
```

### <a id="SYS_GETAUID" href="#SYS_GETAUID">const SYS_GETAUID</a>

```
searchKey: syscall.SYS_GETAUID
```

```Go
const SYS_GETAUID = 353
```

### <a id="SYS_SETAUID" href="#SYS_SETAUID">const SYS_SETAUID</a>

```
searchKey: syscall.SYS_SETAUID
```

```Go
const SYS_SETAUID = 354
```

### <a id="SYS_GETAUDIT" href="#SYS_GETAUDIT">const SYS_GETAUDIT</a>

```
searchKey: syscall.SYS_GETAUDIT
```

```Go
const SYS_GETAUDIT = 355
```

### <a id="SYS_SETAUDIT" href="#SYS_SETAUDIT">const SYS_SETAUDIT</a>

```
searchKey: syscall.SYS_SETAUDIT
```

```Go
const SYS_SETAUDIT = 356
```

### <a id="SYS_GETAUDIT_ADDR" href="#SYS_GETAUDIT_ADDR">const SYS_GETAUDIT_ADDR</a>

```
searchKey: syscall.SYS_GETAUDIT_ADDR
```

```Go
const SYS_GETAUDIT_ADDR = 357
```

### <a id="SYS_SETAUDIT_ADDR" href="#SYS_SETAUDIT_ADDR">const SYS_SETAUDIT_ADDR</a>

```
searchKey: syscall.SYS_SETAUDIT_ADDR
```

```Go
const SYS_SETAUDIT_ADDR = 358
```

### <a id="SYS_AUDITCTL" href="#SYS_AUDITCTL">const SYS_AUDITCTL</a>

```
searchKey: syscall.SYS_AUDITCTL
```

```Go
const SYS_AUDITCTL = 359
```

### <a id="SYS_BSDTHREAD_CREATE" href="#SYS_BSDTHREAD_CREATE">const SYS_BSDTHREAD_CREATE</a>

```
searchKey: syscall.SYS_BSDTHREAD_CREATE
```

```Go
const SYS_BSDTHREAD_CREATE = 360
```

### <a id="SYS_BSDTHREAD_TERMINATE" href="#SYS_BSDTHREAD_TERMINATE">const SYS_BSDTHREAD_TERMINATE</a>

```
searchKey: syscall.SYS_BSDTHREAD_TERMINATE
```

```Go
const SYS_BSDTHREAD_TERMINATE = 361
```

### <a id="SYS_KQUEUE" href="#SYS_KQUEUE">const SYS_KQUEUE</a>

```
searchKey: syscall.SYS_KQUEUE
```

```Go
const SYS_KQUEUE = 362
```

### <a id="SYS_KEVENT" href="#SYS_KEVENT">const SYS_KEVENT</a>

```
searchKey: syscall.SYS_KEVENT
```

```Go
const SYS_KEVENT = 363
```

### <a id="SYS_LCHOWN" href="#SYS_LCHOWN">const SYS_LCHOWN</a>

```
searchKey: syscall.SYS_LCHOWN
```

```Go
const SYS_LCHOWN = 364
```

### <a id="SYS_STACK_SNAPSHOT" href="#SYS_STACK_SNAPSHOT">const SYS_STACK_SNAPSHOT</a>

```
searchKey: syscall.SYS_STACK_SNAPSHOT
```

```Go
const SYS_STACK_SNAPSHOT = 365
```

### <a id="SYS_BSDTHREAD_REGISTER" href="#SYS_BSDTHREAD_REGISTER">const SYS_BSDTHREAD_REGISTER</a>

```
searchKey: syscall.SYS_BSDTHREAD_REGISTER
```

```Go
const SYS_BSDTHREAD_REGISTER = 366
```

### <a id="SYS_WORKQ_OPEN" href="#SYS_WORKQ_OPEN">const SYS_WORKQ_OPEN</a>

```
searchKey: syscall.SYS_WORKQ_OPEN
```

```Go
const SYS_WORKQ_OPEN = 367
```

### <a id="SYS_WORKQ_KERNRETURN" href="#SYS_WORKQ_KERNRETURN">const SYS_WORKQ_KERNRETURN</a>

```
searchKey: syscall.SYS_WORKQ_KERNRETURN
```

```Go
const SYS_WORKQ_KERNRETURN = 368
```

### <a id="SYS_KEVENT64" href="#SYS_KEVENT64">const SYS_KEVENT64</a>

```
searchKey: syscall.SYS_KEVENT64
```

```Go
const SYS_KEVENT64 = 369
```

### <a id="SYS___OLD_SEMWAIT_SIGNAL" href="#SYS___OLD_SEMWAIT_SIGNAL">const SYS___OLD_SEMWAIT_SIGNAL</a>

```
searchKey: syscall.SYS___OLD_SEMWAIT_SIGNAL
```

```Go
const SYS___OLD_SEMWAIT_SIGNAL = 370
```

### <a id="SYS___OLD_SEMWAIT_SIGNAL_NOCANCEL" href="#SYS___OLD_SEMWAIT_SIGNAL_NOCANCEL">const SYS___OLD_SEMWAIT_SIGNAL_NOCANCEL</a>

```
searchKey: syscall.SYS___OLD_SEMWAIT_SIGNAL_NOCANCEL
```

```Go
const SYS___OLD_SEMWAIT_SIGNAL_NOCANCEL = 371
```

### <a id="SYS_THREAD_SELFID" href="#SYS_THREAD_SELFID">const SYS_THREAD_SELFID</a>

```
searchKey: syscall.SYS_THREAD_SELFID
```

```Go
const SYS_THREAD_SELFID = 372
```

### <a id="SYS___MAC_EXECVE" href="#SYS___MAC_EXECVE">const SYS___MAC_EXECVE</a>

```
searchKey: syscall.SYS___MAC_EXECVE
```

```Go
const SYS___MAC_EXECVE = 380
```

### <a id="SYS___MAC_SYSCALL" href="#SYS___MAC_SYSCALL">const SYS___MAC_SYSCALL</a>

```
searchKey: syscall.SYS___MAC_SYSCALL
```

```Go
const SYS___MAC_SYSCALL = 381
```

### <a id="SYS___MAC_GET_FILE" href="#SYS___MAC_GET_FILE">const SYS___MAC_GET_FILE</a>

```
searchKey: syscall.SYS___MAC_GET_FILE
```

```Go
const SYS___MAC_GET_FILE = 382
```

### <a id="SYS___MAC_SET_FILE" href="#SYS___MAC_SET_FILE">const SYS___MAC_SET_FILE</a>

```
searchKey: syscall.SYS___MAC_SET_FILE
```

```Go
const SYS___MAC_SET_FILE = 383
```

### <a id="SYS___MAC_GET_LINK" href="#SYS___MAC_GET_LINK">const SYS___MAC_GET_LINK</a>

```
searchKey: syscall.SYS___MAC_GET_LINK
```

```Go
const SYS___MAC_GET_LINK = 384
```

### <a id="SYS___MAC_SET_LINK" href="#SYS___MAC_SET_LINK">const SYS___MAC_SET_LINK</a>

```
searchKey: syscall.SYS___MAC_SET_LINK
```

```Go
const SYS___MAC_SET_LINK = 385
```

### <a id="SYS___MAC_GET_PROC" href="#SYS___MAC_GET_PROC">const SYS___MAC_GET_PROC</a>

```
searchKey: syscall.SYS___MAC_GET_PROC
```

```Go
const SYS___MAC_GET_PROC = 386
```

### <a id="SYS___MAC_SET_PROC" href="#SYS___MAC_SET_PROC">const SYS___MAC_SET_PROC</a>

```
searchKey: syscall.SYS___MAC_SET_PROC
```

```Go
const SYS___MAC_SET_PROC = 387
```

### <a id="SYS___MAC_GET_FD" href="#SYS___MAC_GET_FD">const SYS___MAC_GET_FD</a>

```
searchKey: syscall.SYS___MAC_GET_FD
```

```Go
const SYS___MAC_GET_FD = 388
```

### <a id="SYS___MAC_SET_FD" href="#SYS___MAC_SET_FD">const SYS___MAC_SET_FD</a>

```
searchKey: syscall.SYS___MAC_SET_FD
```

```Go
const SYS___MAC_SET_FD = 389
```

### <a id="SYS___MAC_GET_PID" href="#SYS___MAC_GET_PID">const SYS___MAC_GET_PID</a>

```
searchKey: syscall.SYS___MAC_GET_PID
```

```Go
const SYS___MAC_GET_PID = 390
```

### <a id="SYS___MAC_GET_LCID" href="#SYS___MAC_GET_LCID">const SYS___MAC_GET_LCID</a>

```
searchKey: syscall.SYS___MAC_GET_LCID
```

```Go
const SYS___MAC_GET_LCID = 391
```

### <a id="SYS___MAC_GET_LCTX" href="#SYS___MAC_GET_LCTX">const SYS___MAC_GET_LCTX</a>

```
searchKey: syscall.SYS___MAC_GET_LCTX
```

```Go
const SYS___MAC_GET_LCTX = 392
```

### <a id="SYS___MAC_SET_LCTX" href="#SYS___MAC_SET_LCTX">const SYS___MAC_SET_LCTX</a>

```
searchKey: syscall.SYS___MAC_SET_LCTX
```

```Go
const SYS___MAC_SET_LCTX = 393
```

### <a id="SYS_SETLCID" href="#SYS_SETLCID">const SYS_SETLCID</a>

```
searchKey: syscall.SYS_SETLCID
```

```Go
const SYS_SETLCID = 394
```

### <a id="SYS_GETLCID" href="#SYS_GETLCID">const SYS_GETLCID</a>

```
searchKey: syscall.SYS_GETLCID
```

```Go
const SYS_GETLCID = 395
```

### <a id="SYS_READ_NOCANCEL" href="#SYS_READ_NOCANCEL">const SYS_READ_NOCANCEL</a>

```
searchKey: syscall.SYS_READ_NOCANCEL
```

```Go
const SYS_READ_NOCANCEL = 396
```

### <a id="SYS_WRITE_NOCANCEL" href="#SYS_WRITE_NOCANCEL">const SYS_WRITE_NOCANCEL</a>

```
searchKey: syscall.SYS_WRITE_NOCANCEL
```

```Go
const SYS_WRITE_NOCANCEL = 397
```

### <a id="SYS_OPEN_NOCANCEL" href="#SYS_OPEN_NOCANCEL">const SYS_OPEN_NOCANCEL</a>

```
searchKey: syscall.SYS_OPEN_NOCANCEL
```

```Go
const SYS_OPEN_NOCANCEL = 398
```

### <a id="SYS_CLOSE_NOCANCEL" href="#SYS_CLOSE_NOCANCEL">const SYS_CLOSE_NOCANCEL</a>

```
searchKey: syscall.SYS_CLOSE_NOCANCEL
```

```Go
const SYS_CLOSE_NOCANCEL = 399
```

### <a id="SYS_WAIT4_NOCANCEL" href="#SYS_WAIT4_NOCANCEL">const SYS_WAIT4_NOCANCEL</a>

```
searchKey: syscall.SYS_WAIT4_NOCANCEL
```

```Go
const SYS_WAIT4_NOCANCEL = 400
```

### <a id="SYS_RECVMSG_NOCANCEL" href="#SYS_RECVMSG_NOCANCEL">const SYS_RECVMSG_NOCANCEL</a>

```
searchKey: syscall.SYS_RECVMSG_NOCANCEL
```

```Go
const SYS_RECVMSG_NOCANCEL = 401
```

### <a id="SYS_SENDMSG_NOCANCEL" href="#SYS_SENDMSG_NOCANCEL">const SYS_SENDMSG_NOCANCEL</a>

```
searchKey: syscall.SYS_SENDMSG_NOCANCEL
```

```Go
const SYS_SENDMSG_NOCANCEL = 402
```

### <a id="SYS_RECVFROM_NOCANCEL" href="#SYS_RECVFROM_NOCANCEL">const SYS_RECVFROM_NOCANCEL</a>

```
searchKey: syscall.SYS_RECVFROM_NOCANCEL
```

```Go
const SYS_RECVFROM_NOCANCEL = 403
```

### <a id="SYS_ACCEPT_NOCANCEL" href="#SYS_ACCEPT_NOCANCEL">const SYS_ACCEPT_NOCANCEL</a>

```
searchKey: syscall.SYS_ACCEPT_NOCANCEL
```

```Go
const SYS_ACCEPT_NOCANCEL = 404
```

### <a id="SYS_MSYNC_NOCANCEL" href="#SYS_MSYNC_NOCANCEL">const SYS_MSYNC_NOCANCEL</a>

```
searchKey: syscall.SYS_MSYNC_NOCANCEL
```

```Go
const SYS_MSYNC_NOCANCEL = 405
```

### <a id="SYS_FCNTL_NOCANCEL" href="#SYS_FCNTL_NOCANCEL">const SYS_FCNTL_NOCANCEL</a>

```
searchKey: syscall.SYS_FCNTL_NOCANCEL
```

```Go
const SYS_FCNTL_NOCANCEL = 406
```

### <a id="SYS_SELECT_NOCANCEL" href="#SYS_SELECT_NOCANCEL">const SYS_SELECT_NOCANCEL</a>

```
searchKey: syscall.SYS_SELECT_NOCANCEL
```

```Go
const SYS_SELECT_NOCANCEL = 407
```

### <a id="SYS_FSYNC_NOCANCEL" href="#SYS_FSYNC_NOCANCEL">const SYS_FSYNC_NOCANCEL</a>

```
searchKey: syscall.SYS_FSYNC_NOCANCEL
```

```Go
const SYS_FSYNC_NOCANCEL = 408
```

### <a id="SYS_CONNECT_NOCANCEL" href="#SYS_CONNECT_NOCANCEL">const SYS_CONNECT_NOCANCEL</a>

```
searchKey: syscall.SYS_CONNECT_NOCANCEL
```

```Go
const SYS_CONNECT_NOCANCEL = 409
```

### <a id="SYS_SIGSUSPEND_NOCANCEL" href="#SYS_SIGSUSPEND_NOCANCEL">const SYS_SIGSUSPEND_NOCANCEL</a>

```
searchKey: syscall.SYS_SIGSUSPEND_NOCANCEL
```

```Go
const SYS_SIGSUSPEND_NOCANCEL = 410
```

### <a id="SYS_READV_NOCANCEL" href="#SYS_READV_NOCANCEL">const SYS_READV_NOCANCEL</a>

```
searchKey: syscall.SYS_READV_NOCANCEL
```

```Go
const SYS_READV_NOCANCEL = 411
```

### <a id="SYS_WRITEV_NOCANCEL" href="#SYS_WRITEV_NOCANCEL">const SYS_WRITEV_NOCANCEL</a>

```
searchKey: syscall.SYS_WRITEV_NOCANCEL
```

```Go
const SYS_WRITEV_NOCANCEL = 412
```

### <a id="SYS_SENDTO_NOCANCEL" href="#SYS_SENDTO_NOCANCEL">const SYS_SENDTO_NOCANCEL</a>

```
searchKey: syscall.SYS_SENDTO_NOCANCEL
```

```Go
const SYS_SENDTO_NOCANCEL = 413
```

### <a id="SYS_PREAD_NOCANCEL" href="#SYS_PREAD_NOCANCEL">const SYS_PREAD_NOCANCEL</a>

```
searchKey: syscall.SYS_PREAD_NOCANCEL
```

```Go
const SYS_PREAD_NOCANCEL = 414
```

### <a id="SYS_PWRITE_NOCANCEL" href="#SYS_PWRITE_NOCANCEL">const SYS_PWRITE_NOCANCEL</a>

```
searchKey: syscall.SYS_PWRITE_NOCANCEL
```

```Go
const SYS_PWRITE_NOCANCEL = 415
```

### <a id="SYS_WAITID_NOCANCEL" href="#SYS_WAITID_NOCANCEL">const SYS_WAITID_NOCANCEL</a>

```
searchKey: syscall.SYS_WAITID_NOCANCEL
```

```Go
const SYS_WAITID_NOCANCEL = 416
```

### <a id="SYS_POLL_NOCANCEL" href="#SYS_POLL_NOCANCEL">const SYS_POLL_NOCANCEL</a>

```
searchKey: syscall.SYS_POLL_NOCANCEL
```

```Go
const SYS_POLL_NOCANCEL = 417
```

### <a id="SYS_MSGSND_NOCANCEL" href="#SYS_MSGSND_NOCANCEL">const SYS_MSGSND_NOCANCEL</a>

```
searchKey: syscall.SYS_MSGSND_NOCANCEL
```

```Go
const SYS_MSGSND_NOCANCEL = 418
```

### <a id="SYS_MSGRCV_NOCANCEL" href="#SYS_MSGRCV_NOCANCEL">const SYS_MSGRCV_NOCANCEL</a>

```
searchKey: syscall.SYS_MSGRCV_NOCANCEL
```

```Go
const SYS_MSGRCV_NOCANCEL = 419
```

### <a id="SYS_SEM_WAIT_NOCANCEL" href="#SYS_SEM_WAIT_NOCANCEL">const SYS_SEM_WAIT_NOCANCEL</a>

```
searchKey: syscall.SYS_SEM_WAIT_NOCANCEL
```

```Go
const SYS_SEM_WAIT_NOCANCEL = 420
```

### <a id="SYS_AIO_SUSPEND_NOCANCEL" href="#SYS_AIO_SUSPEND_NOCANCEL">const SYS_AIO_SUSPEND_NOCANCEL</a>

```
searchKey: syscall.SYS_AIO_SUSPEND_NOCANCEL
```

```Go
const SYS_AIO_SUSPEND_NOCANCEL = 421
```

### <a id="SYS___SIGWAIT_NOCANCEL" href="#SYS___SIGWAIT_NOCANCEL">const SYS___SIGWAIT_NOCANCEL</a>

```
searchKey: syscall.SYS___SIGWAIT_NOCANCEL
```

```Go
const SYS___SIGWAIT_NOCANCEL = 422
```

### <a id="SYS___SEMWAIT_SIGNAL_NOCANCEL" href="#SYS___SEMWAIT_SIGNAL_NOCANCEL">const SYS___SEMWAIT_SIGNAL_NOCANCEL</a>

```
searchKey: syscall.SYS___SEMWAIT_SIGNAL_NOCANCEL
```

```Go
const SYS___SEMWAIT_SIGNAL_NOCANCEL = 423
```

### <a id="SYS___MAC_MOUNT" href="#SYS___MAC_MOUNT">const SYS___MAC_MOUNT</a>

```
searchKey: syscall.SYS___MAC_MOUNT
```

```Go
const SYS___MAC_MOUNT = 424
```

### <a id="SYS___MAC_GET_MOUNT" href="#SYS___MAC_GET_MOUNT">const SYS___MAC_GET_MOUNT</a>

```
searchKey: syscall.SYS___MAC_GET_MOUNT
```

```Go
const SYS___MAC_GET_MOUNT = 425
```

### <a id="SYS___MAC_GETFSSTAT" href="#SYS___MAC_GETFSSTAT">const SYS___MAC_GETFSSTAT</a>

```
searchKey: syscall.SYS___MAC_GETFSSTAT
```

```Go
const SYS___MAC_GETFSSTAT = 426
```

### <a id="SYS_FSGETPATH" href="#SYS_FSGETPATH">const SYS_FSGETPATH</a>

```
searchKey: syscall.SYS_FSGETPATH
```

```Go
const SYS_FSGETPATH = 427
```

### <a id="SYS_AUDIT_SESSION_SELF" href="#SYS_AUDIT_SESSION_SELF">const SYS_AUDIT_SESSION_SELF</a>

```
searchKey: syscall.SYS_AUDIT_SESSION_SELF
```

```Go
const SYS_AUDIT_SESSION_SELF = 428
```

### <a id="SYS_AUDIT_SESSION_JOIN" href="#SYS_AUDIT_SESSION_JOIN">const SYS_AUDIT_SESSION_JOIN</a>

```
searchKey: syscall.SYS_AUDIT_SESSION_JOIN
```

```Go
const SYS_AUDIT_SESSION_JOIN = 429
```

### <a id="SYS_FILEPORT_MAKEPORT" href="#SYS_FILEPORT_MAKEPORT">const SYS_FILEPORT_MAKEPORT</a>

```
searchKey: syscall.SYS_FILEPORT_MAKEPORT
```

```Go
const SYS_FILEPORT_MAKEPORT = 430
```

### <a id="SYS_FILEPORT_MAKEFD" href="#SYS_FILEPORT_MAKEFD">const SYS_FILEPORT_MAKEFD</a>

```
searchKey: syscall.SYS_FILEPORT_MAKEFD
```

```Go
const SYS_FILEPORT_MAKEFD = 431
```

### <a id="SYS_AUDIT_SESSION_PORT" href="#SYS_AUDIT_SESSION_PORT">const SYS_AUDIT_SESSION_PORT</a>

```
searchKey: syscall.SYS_AUDIT_SESSION_PORT
```

```Go
const SYS_AUDIT_SESSION_PORT = 432
```

### <a id="SYS_PID_SUSPEND" href="#SYS_PID_SUSPEND">const SYS_PID_SUSPEND</a>

```
searchKey: syscall.SYS_PID_SUSPEND
```

```Go
const SYS_PID_SUSPEND = 433
```

### <a id="SYS_PID_RESUME" href="#SYS_PID_RESUME">const SYS_PID_RESUME</a>

```
searchKey: syscall.SYS_PID_RESUME
```

```Go
const SYS_PID_RESUME = 434
```

### <a id="SYS_PID_HIBERNATE" href="#SYS_PID_HIBERNATE">const SYS_PID_HIBERNATE</a>

```
searchKey: syscall.SYS_PID_HIBERNATE
```

```Go
const SYS_PID_HIBERNATE = 435
```

### <a id="SYS_PID_SHUTDOWN_SOCKETS" href="#SYS_PID_SHUTDOWN_SOCKETS">const SYS_PID_SHUTDOWN_SOCKETS</a>

```
searchKey: syscall.SYS_PID_SHUTDOWN_SOCKETS
```

```Go
const SYS_PID_SHUTDOWN_SOCKETS = 436
```

### <a id="SYS_SHARED_REGION_MAP_AND_SLIDE_NP" href="#SYS_SHARED_REGION_MAP_AND_SLIDE_NP">const SYS_SHARED_REGION_MAP_AND_SLIDE_NP</a>

```
searchKey: syscall.SYS_SHARED_REGION_MAP_AND_SLIDE_NP
```

```Go
const SYS_SHARED_REGION_MAP_AND_SLIDE_NP = 438
```

### <a id="SYS_MAXSYSCALL" href="#SYS_MAXSYSCALL">const SYS_MAXSYSCALL</a>

```
searchKey: syscall.SYS_MAXSYSCALL
```

```Go
const SYS_MAXSYSCALL = 439
```

### <a id="sizeofPtr" href="#sizeofPtr">const sizeofPtr</a>

```
searchKey: syscall.sizeofPtr
tags: [private]
```

```Go
const sizeofPtr = 0x8
```

### <a id="sizeofShort" href="#sizeofShort">const sizeofShort</a>

```
searchKey: syscall.sizeofShort
tags: [private]
```

```Go
const sizeofShort = 0x2
```

### <a id="sizeofInt" href="#sizeofInt">const sizeofInt</a>

```
searchKey: syscall.sizeofInt
tags: [private]
```

```Go
const sizeofInt = 0x4
```

### <a id="sizeofLong" href="#sizeofLong">const sizeofLong</a>

```
searchKey: syscall.sizeofLong
tags: [private]
```

```Go
const sizeofLong = 0x8
```

### <a id="sizeofLongLong" href="#sizeofLongLong">const sizeofLongLong</a>

```
searchKey: syscall.sizeofLongLong
tags: [private]
```

```Go
const sizeofLongLong = 0x8
```

### <a id="pathMax" href="#pathMax">const pathMax</a>

```
searchKey: syscall.pathMax
tags: [private]
```

```Go
const pathMax = 0x400
```

### <a id="SizeofSockaddrInet4" href="#SizeofSockaddrInet4">const SizeofSockaddrInet4</a>

```
searchKey: syscall.SizeofSockaddrInet4
```

```Go
const SizeofSockaddrInet4 = 0x10
```

### <a id="SizeofSockaddrInet6" href="#SizeofSockaddrInet6">const SizeofSockaddrInet6</a>

```
searchKey: syscall.SizeofSockaddrInet6
```

```Go
const SizeofSockaddrInet6 = 0x1c
```

### <a id="SizeofSockaddrAny" href="#SizeofSockaddrAny">const SizeofSockaddrAny</a>

```
searchKey: syscall.SizeofSockaddrAny
```

```Go
const SizeofSockaddrAny = 0x6c
```

### <a id="SizeofSockaddrUnix" href="#SizeofSockaddrUnix">const SizeofSockaddrUnix</a>

```
searchKey: syscall.SizeofSockaddrUnix
```

```Go
const SizeofSockaddrUnix = 0x6a
```

### <a id="SizeofSockaddrDatalink" href="#SizeofSockaddrDatalink">const SizeofSockaddrDatalink</a>

```
searchKey: syscall.SizeofSockaddrDatalink
```

```Go
const SizeofSockaddrDatalink = 0x14
```

### <a id="SizeofLinger" href="#SizeofLinger">const SizeofLinger</a>

```
searchKey: syscall.SizeofLinger
```

```Go
const SizeofLinger = 0x8
```

### <a id="SizeofIPMreq" href="#SizeofIPMreq">const SizeofIPMreq</a>

```
searchKey: syscall.SizeofIPMreq
```

```Go
const SizeofIPMreq = 0x8
```

### <a id="SizeofIPv6Mreq" href="#SizeofIPv6Mreq">const SizeofIPv6Mreq</a>

```
searchKey: syscall.SizeofIPv6Mreq
```

```Go
const SizeofIPv6Mreq = 0x14
```

### <a id="SizeofMsghdr" href="#SizeofMsghdr">const SizeofMsghdr</a>

```
searchKey: syscall.SizeofMsghdr
```

```Go
const SizeofMsghdr = 0x30
```

### <a id="SizeofCmsghdr" href="#SizeofCmsghdr">const SizeofCmsghdr</a>

```
searchKey: syscall.SizeofCmsghdr
```

```Go
const SizeofCmsghdr = 0xc
```

### <a id="SizeofInet4Pktinfo" href="#SizeofInet4Pktinfo">const SizeofInet4Pktinfo</a>

```
searchKey: syscall.SizeofInet4Pktinfo
```

```Go
const SizeofInet4Pktinfo = 0xc
```

### <a id="SizeofInet6Pktinfo" href="#SizeofInet6Pktinfo">const SizeofInet6Pktinfo</a>

```
searchKey: syscall.SizeofInet6Pktinfo
```

```Go
const SizeofInet6Pktinfo = 0x14
```

### <a id="SizeofIPv6MTUInfo" href="#SizeofIPv6MTUInfo">const SizeofIPv6MTUInfo</a>

```
searchKey: syscall.SizeofIPv6MTUInfo
```

```Go
const SizeofIPv6MTUInfo = 0x20
```

### <a id="SizeofICMPv6Filter" href="#SizeofICMPv6Filter">const SizeofICMPv6Filter</a>

```
searchKey: syscall.SizeofICMPv6Filter
```

```Go
const SizeofICMPv6Filter = 0x20
```

### <a id="PTRACE_TRACEME" href="#PTRACE_TRACEME">const PTRACE_TRACEME</a>

```
searchKey: syscall.PTRACE_TRACEME
```

```Go
const PTRACE_TRACEME = 0x0
```

### <a id="PTRACE_CONT" href="#PTRACE_CONT">const PTRACE_CONT</a>

```
searchKey: syscall.PTRACE_CONT
```

```Go
const PTRACE_CONT = 0x7
```

### <a id="PTRACE_KILL" href="#PTRACE_KILL">const PTRACE_KILL</a>

```
searchKey: syscall.PTRACE_KILL
```

```Go
const PTRACE_KILL = 0x8
```

### <a id="SizeofIfMsghdr" href="#SizeofIfMsghdr">const SizeofIfMsghdr</a>

```
searchKey: syscall.SizeofIfMsghdr
```

```Go
const SizeofIfMsghdr = 0x70
```

### <a id="SizeofIfData" href="#SizeofIfData">const SizeofIfData</a>

```
searchKey: syscall.SizeofIfData
```

```Go
const SizeofIfData = 0x60
```

### <a id="SizeofIfaMsghdr" href="#SizeofIfaMsghdr">const SizeofIfaMsghdr</a>

```
searchKey: syscall.SizeofIfaMsghdr
```

```Go
const SizeofIfaMsghdr = 0x14
```

### <a id="SizeofIfmaMsghdr" href="#SizeofIfmaMsghdr">const SizeofIfmaMsghdr</a>

```
searchKey: syscall.SizeofIfmaMsghdr
```

```Go
const SizeofIfmaMsghdr = 0x10
```

### <a id="SizeofIfmaMsghdr2" href="#SizeofIfmaMsghdr2">const SizeofIfmaMsghdr2</a>

```
searchKey: syscall.SizeofIfmaMsghdr2
```

```Go
const SizeofIfmaMsghdr2 = 0x14
```

### <a id="SizeofRtMsghdr" href="#SizeofRtMsghdr">const SizeofRtMsghdr</a>

```
searchKey: syscall.SizeofRtMsghdr
```

```Go
const SizeofRtMsghdr = 0x5c
```

### <a id="SizeofRtMetrics" href="#SizeofRtMetrics">const SizeofRtMetrics</a>

```
searchKey: syscall.SizeofRtMetrics
```

```Go
const SizeofRtMetrics = 0x38
```

### <a id="SizeofBpfVersion" href="#SizeofBpfVersion">const SizeofBpfVersion</a>

```
searchKey: syscall.SizeofBpfVersion
```

```Go
const SizeofBpfVersion = 0x4
```

### <a id="SizeofBpfStat" href="#SizeofBpfStat">const SizeofBpfStat</a>

```
searchKey: syscall.SizeofBpfStat
```

```Go
const SizeofBpfStat = 0x8
```

### <a id="SizeofBpfProgram" href="#SizeofBpfProgram">const SizeofBpfProgram</a>

```
searchKey: syscall.SizeofBpfProgram
```

```Go
const SizeofBpfProgram = 0x10
```

### <a id="SizeofBpfInsn" href="#SizeofBpfInsn">const SizeofBpfInsn</a>

```
searchKey: syscall.SizeofBpfInsn
```

```Go
const SizeofBpfInsn = 0x8
```

### <a id="SizeofBpfHdr" href="#SizeofBpfHdr">const SizeofBpfHdr</a>

```
searchKey: syscall.SizeofBpfHdr
```

```Go
const SizeofBpfHdr = 0x14
```

### <a id="_AT_FDCWD" href="#_AT_FDCWD">const _AT_FDCWD</a>

```
searchKey: syscall._AT_FDCWD
tags: [private]
```

```Go
const _AT_FDCWD = -0x2
```

## <a id="var" href="#var">Variables</a>

```
tags: [deprecated]
```

### <a id="envOnce" href="#envOnce">var envOnce</a>

```
searchKey: syscall.envOnce
tags: [private]
```

```Go
var envOnce sync.Once
```

envOnce guards initialization by copyenv, which populates env. 

### <a id="envLock" href="#envLock">var envLock</a>

```
searchKey: syscall.envLock
tags: [private]
```

```Go
var envLock sync.RWMutex
```

envLock guards env and envs. 

### <a id="env" href="#env">var env</a>

```
searchKey: syscall.env
tags: [private]
```

```Go
var env map[string]int
```

env maps from an environment variable to its first occurrence in envs. 

### <a id="envs" href="#envs">var envs</a>

```
searchKey: syscall.envs
tags: [private]
```

```Go
var envs []string = runtime_envs()
```

envs is provided by the runtime. elements are expected to be of the form "key=value". An empty string means deleted (or a duplicate to be ignored). 

### <a id="ForkLock" href="#ForkLock">var ForkLock</a>

```
searchKey: syscall.ForkLock
```

```Go
var ForkLock sync.RWMutex
```

### <a id="zeroProcAttr" href="#zeroProcAttr">var zeroProcAttr</a>

```
searchKey: syscall.zeroProcAttr
tags: [private]
```

```Go
var zeroProcAttr ProcAttr
```

### <a id="zeroSysProcAttr" href="#zeroSysProcAttr">var zeroSysProcAttr</a>

```
searchKey: syscall.zeroSysProcAttr
tags: [private]
```

```Go
var zeroSysProcAttr SysProcAttr
```

### <a id="execveLibc" href="#execveLibc">var execveLibc</a>

```
searchKey: syscall.execveLibc
tags: [private]
```

```Go
var execveLibc func(path uintptr, argv uintptr, envp uintptr) Errno
```

execveLibc is non-nil on OS using libc syscall, set to execve in exec_libc.go; this avoids a build dependency for other platforms. 

### <a id="execveDarwin" href="#execveDarwin">var execveDarwin</a>

```
searchKey: syscall.execveDarwin
tags: [private]
```

```Go
var execveDarwin func(path *byte, argv **byte, envp **byte) error
```

### <a id="execveOpenBSD" href="#execveOpenBSD">var execveOpenBSD</a>

```
searchKey: syscall.execveOpenBSD
tags: [private]
```

```Go
var execveOpenBSD func(path *byte, argv **byte, envp **byte) error
```

### <a id="freebsdConfArch" href="#freebsdConfArch">var freebsdConfArch</a>

```
searchKey: syscall.freebsdConfArch
tags: [private]
```

```Go
var freebsdConfArch string // "machine $arch" line in kern.conftxt on freebsd

```

### <a id="minRoutingSockaddrLen" href="#minRoutingSockaddrLen">var minRoutingSockaddrLen</a>

```
searchKey: syscall.minRoutingSockaddrLen
tags: [private]
```

```Go
var minRoutingSockaddrLen = rsaAlignOf(0)
```

### <a id="_zero" href="#_zero">var _zero</a>

```
searchKey: syscall._zero
tags: [private]
```

```Go
var _zero uintptr
```

Single-word zero for use when we need a valid pointer to 0 bytes. See mksyscall.pl. 

### <a id="mapper" href="#mapper">var mapper</a>

```
searchKey: syscall.mapper
tags: [private]
```

```Go
var mapper = &mmapper{
	active: make(map[*byte][]byte),
	mmap:   mmap,
	munmap: munmap,
}
```

### <a id="Stdin" href="#Stdin">var Stdin</a>

```
searchKey: syscall.Stdin
```

```Go
var Stdin = 0
```

### <a id="Stdout" href="#Stdout">var Stdout</a>

```
searchKey: syscall.Stdout
```

```Go
var Stdout = 1
```

### <a id="Stderr" href="#Stderr">var Stderr</a>

```
searchKey: syscall.Stderr
```

```Go
var Stderr = 2
```

### <a id="errEAGAIN" href="#errEAGAIN">var errEAGAIN</a>

```
searchKey: syscall.errEAGAIN
tags: [private]
```

```Go
var errEAGAIN error = EAGAIN
```

Do the interface allocations only once for common Errno values. 

### <a id="errEINVAL" href="#errEINVAL">var errEINVAL</a>

```
searchKey: syscall.errEINVAL
tags: [private]
```

```Go
var errEINVAL error = EINVAL
```

Do the interface allocations only once for common Errno values. 

### <a id="errENOENT" href="#errENOENT">var errENOENT</a>

```
searchKey: syscall.errENOENT
tags: [private]
```

```Go
var errENOENT error = ENOENT
```

Do the interface allocations only once for common Errno values. 

### <a id="SocketDisableIPv6" href="#SocketDisableIPv6">var SocketDisableIPv6</a>

```
searchKey: syscall.SocketDisableIPv6
```

```Go
var SocketDisableIPv6 bool
```

For testing: clients can set this flag to force creation of IPv6 sockets to return EAFNOSUPPORT. 

### <a id="ioSync" href="#ioSync">var ioSync</a>

```
searchKey: syscall.ioSync
tags: [private]
```

```Go
var ioSync int64
```

### <a id="errors" href="#errors">var errors</a>

```
searchKey: syscall.errors
tags: [private]
```

```Go
var errors = ...
```

Error table 

### <a id="signals" href="#signals">var signals</a>

```
searchKey: syscall.signals
tags: [private]
```

```Go
var signals = ...
```

Signal table 

## <a id="type" href="#type">Types</a>

```
tags: [deprecated]
```

### <a id="ivalue" href="#ivalue">type ivalue struct</a>

```
searchKey: syscall.ivalue
tags: [private]
```

```Go
type ivalue struct {
	name  [IFNAMSIZ]byte
	value int16
}
```

### <a id="SysProcAttr" href="#SysProcAttr">type SysProcAttr struct</a>

```
searchKey: syscall.SysProcAttr
```

```Go
type SysProcAttr struct {
	Chroot     string      // Chroot.
	Credential *Credential // Credential.
	Ptrace     bool        // Enable tracing.
	Setsid     bool        // Create session.
	// Setpgid sets the process group ID of the child to Pgid,
	// or, if Pgid == 0, to the new child's process ID.
	Setpgid bool
	// Setctty sets the controlling terminal of the child to
	// file descriptor Ctty. Ctty must be a descriptor number
	// in the child process: an index into ProcAttr.Files.
	// This is only meaningful if Setsid is true.
	Setctty bool
	Noctty  bool // Detach fd 0 from controlling terminal
	Ctty    int  // Controlling TTY fd
	// Foreground places the child process group in the foreground.
	// This implies Setpgid. The Ctty field must be set to
	// the descriptor of the controlling TTY.
	// Unlike Setctty, in this case Ctty must be a descriptor
	// number in the parent process.
	Foreground bool
	Pgid       int // Child's process group ID if Setpgid.
}
```

### <a id="Credential" href="#Credential">type Credential struct</a>

```
searchKey: syscall.Credential
```

```Go
type Credential struct {
	Uid         uint32   // User ID.
	Gid         uint32   // Group ID.
	Groups      []uint32 // Supplementary group IDs.
	NoSetGroups bool     // If true, don't set supplementary groups
}
```

Credential holds user and group identities to be assumed by a child process started by StartProcess. 

### <a id="ProcAttr" href="#ProcAttr">type ProcAttr struct</a>

```
searchKey: syscall.ProcAttr
```

```Go
type ProcAttr struct {
	Dir   string    // Current working directory.
	Env   []string  // Environment.
	Files []uintptr // File descriptors.
	Sys   *SysProcAttr
}
```

ProcAttr holds attributes that will be applied to a new process started by StartProcess. 

### <a id="RawConn" href="#RawConn">type RawConn interface</a>

```
searchKey: syscall.RawConn
```

```Go
type RawConn interface {
	// Control invokes f on the underlying connection's file
	// descriptor or handle.
	// The file descriptor fd is guaranteed to remain valid while
	// f executes but not after f returns.
	Control(f func(fd uintptr)) error

	// Read invokes f on the underlying connection's file
	// descriptor or handle; f is expected to try to read from the
	// file descriptor.
	// If f returns true, Read returns. Otherwise Read blocks
	// waiting for the connection to be ready for reading and
	// tries again repeatedly.
	// The file descriptor is guaranteed to remain valid while f
	// executes but not after f returns.
	Read(f func(fd uintptr) (done bool)) error

	// Write is like Read but for writing.
	Write(f func(fd uintptr) (done bool)) error
}
```

A RawConn is a raw network connection. 

### <a id="Conn" href="#Conn">type Conn interface</a>

```
searchKey: syscall.Conn
```

```Go
type Conn interface {
	// SyscallConn returns a raw network connection.
	SyscallConn() (RawConn, error)
}
```

Conn is implemented by some types in the net and os packages to provide access to the underlying file descriptor or handle. 

### <a id="RoutingMessage" href="#RoutingMessage">type RoutingMessage interface</a>

```
searchKey: syscall.RoutingMessage
```

```Go
type RoutingMessage interface {
	sockaddr() ([]Sockaddr, error)
}
```

RoutingMessage represents a routing message. 

Deprecated: Use golang.org/x/net/route instead. 

### <a id="anyMessage" href="#anyMessage">type anyMessage struct</a>

```
searchKey: syscall.anyMessage
tags: [private]
```

```Go
type anyMessage struct {
	Msglen  uint16
	Version uint8
	Type    uint8
}
```

#### <a id="anyMessage.toRoutingMessage" href="#anyMessage.toRoutingMessage">func (any *anyMessage) toRoutingMessage(b []byte) RoutingMessage</a>

```
searchKey: syscall.anyMessage.toRoutingMessage
tags: [private]
```

```Go
func (any *anyMessage) toRoutingMessage(b []byte) RoutingMessage
```

### <a id="RouteMessage" href="#RouteMessage">type RouteMessage struct</a>

```
searchKey: syscall.RouteMessage
```

```Go
type RouteMessage struct {
	Header RtMsghdr
	Data   []byte
}
```

RouteMessage represents a routing message containing routing entries. 

Deprecated: Use golang.org/x/net/route instead. 

#### <a id="RouteMessage.sockaddr" href="#RouteMessage.sockaddr">func (m *RouteMessage) sockaddr() ([]Sockaddr, error)</a>

```
searchKey: syscall.RouteMessage.sockaddr
tags: [private]
```

```Go
func (m *RouteMessage) sockaddr() ([]Sockaddr, error)
```

### <a id="InterfaceMessage" href="#InterfaceMessage">type InterfaceMessage struct</a>

```
searchKey: syscall.InterfaceMessage
```

```Go
type InterfaceMessage struct {
	Header IfMsghdr
	Data   []byte
}
```

InterfaceMessage represents a routing message containing network interface entries. 

Deprecated: Use golang.org/x/net/route instead. 

#### <a id="InterfaceMessage.sockaddr" href="#InterfaceMessage.sockaddr">func (m *InterfaceMessage) sockaddr() ([]Sockaddr, error)</a>

```
searchKey: syscall.InterfaceMessage.sockaddr
tags: [private]
```

```Go
func (m *InterfaceMessage) sockaddr() ([]Sockaddr, error)
```

### <a id="InterfaceAddrMessage" href="#InterfaceAddrMessage">type InterfaceAddrMessage struct</a>

```
searchKey: syscall.InterfaceAddrMessage
```

```Go
type InterfaceAddrMessage struct {
	Header IfaMsghdr
	Data   []byte
}
```

InterfaceAddrMessage represents a routing message containing network interface address entries. 

Deprecated: Use golang.org/x/net/route instead. 

#### <a id="InterfaceAddrMessage.sockaddr" href="#InterfaceAddrMessage.sockaddr">func (m *InterfaceAddrMessage) sockaddr() ([]Sockaddr, error)</a>

```
searchKey: syscall.InterfaceAddrMessage.sockaddr
tags: [private]
```

```Go
func (m *InterfaceAddrMessage) sockaddr() ([]Sockaddr, error)
```

### <a id="InterfaceMulticastAddrMessage" href="#InterfaceMulticastAddrMessage">type InterfaceMulticastAddrMessage struct</a>

```
searchKey: syscall.InterfaceMulticastAddrMessage
```

```Go
type InterfaceMulticastAddrMessage struct {
	Header IfmaMsghdr2
	Data   []byte
}
```

InterfaceMulticastAddrMessage represents a routing message containing network interface address entries. 

Deprecated: Use golang.org/x/net/route instead. 

#### <a id="InterfaceMulticastAddrMessage.sockaddr" href="#InterfaceMulticastAddrMessage.sockaddr">func (m *InterfaceMulticastAddrMessage) sockaddr() ([]Sockaddr, error)</a>

```
searchKey: syscall.InterfaceMulticastAddrMessage.sockaddr
tags: [private]
```

```Go
func (m *InterfaceMulticastAddrMessage) sockaddr() ([]Sockaddr, error)
```

### <a id="SocketControlMessage" href="#SocketControlMessage">type SocketControlMessage struct</a>

```
searchKey: syscall.SocketControlMessage
```

```Go
type SocketControlMessage struct {
	Header Cmsghdr
	Data   []byte
}
```

SocketControlMessage represents a socket control message. 

### <a id="WaitStatus" href="#WaitStatus">type WaitStatus uint32</a>

```
searchKey: syscall.WaitStatus
```

```Go
type WaitStatus uint32
```

#### <a id="WaitStatus.Exited" href="#WaitStatus.Exited">func (w WaitStatus) Exited() bool</a>

```
searchKey: syscall.WaitStatus.Exited
```

```Go
func (w WaitStatus) Exited() bool
```

#### <a id="WaitStatus.ExitStatus" href="#WaitStatus.ExitStatus">func (w WaitStatus) ExitStatus() int</a>

```
searchKey: syscall.WaitStatus.ExitStatus
```

```Go
func (w WaitStatus) ExitStatus() int
```

#### <a id="WaitStatus.Signaled" href="#WaitStatus.Signaled">func (w WaitStatus) Signaled() bool</a>

```
searchKey: syscall.WaitStatus.Signaled
```

```Go
func (w WaitStatus) Signaled() bool
```

#### <a id="WaitStatus.Signal" href="#WaitStatus.Signal">func (w WaitStatus) Signal() Signal</a>

```
searchKey: syscall.WaitStatus.Signal
```

```Go
func (w WaitStatus) Signal() Signal
```

#### <a id="WaitStatus.CoreDump" href="#WaitStatus.CoreDump">func (w WaitStatus) CoreDump() bool</a>

```
searchKey: syscall.WaitStatus.CoreDump
```

```Go
func (w WaitStatus) CoreDump() bool
```

#### <a id="WaitStatus.Stopped" href="#WaitStatus.Stopped">func (w WaitStatus) Stopped() bool</a>

```
searchKey: syscall.WaitStatus.Stopped
```

```Go
func (w WaitStatus) Stopped() bool
```

#### <a id="WaitStatus.Continued" href="#WaitStatus.Continued">func (w WaitStatus) Continued() bool</a>

```
searchKey: syscall.WaitStatus.Continued
```

```Go
func (w WaitStatus) Continued() bool
```

#### <a id="WaitStatus.StopSignal" href="#WaitStatus.StopSignal">func (w WaitStatus) StopSignal() Signal</a>

```
searchKey: syscall.WaitStatus.StopSignal
```

```Go
func (w WaitStatus) StopSignal() Signal
```

#### <a id="WaitStatus.TrapCause" href="#WaitStatus.TrapCause">func (w WaitStatus) TrapCause() int</a>

```
searchKey: syscall.WaitStatus.TrapCause
```

```Go
func (w WaitStatus) TrapCause() int
```

### <a id="SockaddrDatalink" href="#SockaddrDatalink">type SockaddrDatalink struct</a>

```
searchKey: syscall.SockaddrDatalink
```

```Go
type SockaddrDatalink struct {
	Len    uint8
	Family uint8
	Index  uint16
	Type   uint8
	Nlen   uint8
	Alen   uint8
	Slen   uint8
	Data   [12]int8
	raw    RawSockaddrDatalink
}
```

#### <a id="parseSockaddrLink" href="#parseSockaddrLink">func parseSockaddrLink(b []byte) (*SockaddrDatalink, error)</a>

```
searchKey: syscall.parseSockaddrLink
tags: [private]
```

```Go
func parseSockaddrLink(b []byte) (*SockaddrDatalink, error)
```

parseSockaddrLink parses b as a datalink socket address. 

#### <a id="parseLinkLayerAddr" href="#parseLinkLayerAddr">func parseLinkLayerAddr(b []byte) (*SockaddrDatalink, int, error)</a>

```
searchKey: syscall.parseLinkLayerAddr
tags: [private]
```

```Go
func parseLinkLayerAddr(b []byte) (*SockaddrDatalink, int, error)
```

parseLinkLayerAddr parses b as a datalink socket address in conventional BSD kernel form. 

#### <a id="SockaddrDatalink.sockaddr" href="#SockaddrDatalink.sockaddr">func (sa *SockaddrDatalink) sockaddr() (unsafe.Pointer, _Socklen, error)</a>

```
searchKey: syscall.SockaddrDatalink.sockaddr
tags: [private]
```

```Go
func (sa *SockaddrDatalink) sockaddr() (unsafe.Pointer, _Socklen, error)
```

### <a id="attrList" href="#attrList">type attrList struct</a>

```
searchKey: syscall.attrList
tags: [private]
```

```Go
type attrList struct {
	bitmapCount uint16
	_           uint16
	CommonAttr  uint32
	VolAttr     uint32
	DirAttr     uint32
	FileAttr    uint32
	Forkattr    uint32
}
```

### <a id="mmapper" href="#mmapper">type mmapper struct</a>

```
searchKey: syscall.mmapper
tags: [private]
```

```Go
type mmapper struct {
	sync.Mutex
	active map[*byte][]byte // active mappings; key is last byte in mapping
	mmap   func(addr, length uintptr, prot, flags, fd int, offset int64) (uintptr, error)
	munmap func(addr uintptr, length uintptr) error
}
```

#### <a id="mmapper.Mmap" href="#mmapper.Mmap">func (m *mmapper) Mmap(fd int, offset int64, length int, prot int, flags int) (data []byte, err error)</a>

```
searchKey: syscall.mmapper.Mmap
tags: [private]
```

```Go
func (m *mmapper) Mmap(fd int, offset int64, length int, prot int, flags int) (data []byte, err error)
```

#### <a id="mmapper.Munmap" href="#mmapper.Munmap">func (m *mmapper) Munmap(data []byte) (err error)</a>

```
searchKey: syscall.mmapper.Munmap
tags: [private]
```

```Go
func (m *mmapper) Munmap(data []byte) (err error)
```

### <a id="Errno" href="#Errno">type Errno uintptr</a>

```
searchKey: syscall.Errno
```

```Go
type Errno uintptr
```

An Errno is an unsigned number describing an error condition. It implements the error interface. The zero Errno is by convention a non-error, so code to convert from Errno to error should use: 

```
err = nil
if errno != 0 {
	err = errno
}

```
Errno values can be tested against error values from the os package using errors.Is. For example: 

```
_, _, err := syscall.Syscall(...)
if errors.Is(err, fs.ErrNotExist) ...

```
#### <a id="forkAndExecInChild" href="#forkAndExecInChild">func forkAndExecInChild(argv0 *byte, argv, envv []*byte, chroot, dir *byte, attr *ProcAttr, sys *SysProcAttr, pipe int) (pid int, err Errno)</a>

```
searchKey: syscall.forkAndExecInChild
tags: [private]
```

```Go
func forkAndExecInChild(argv0 *byte, argv, envv []*byte, chroot, dir *byte, attr *ProcAttr, sys *SysProcAttr, pipe int) (pid int, err Errno)
```

Fork, dup fd onto 0..len(fd), and exec(argv0, argvv, envv) in child. If a dup or exec fails, write the errno error to pipe. (Pipe is close-on-exec so if exec succeeds, it will be closed.) In the child, this function must not acquire any locks, because they might have been locked at the time of the fork. This means no rescheduling, no malloc calls, and no new stack segments. For the same reason compiler does not race instrument it. The calls to rawSyscall are okay because they are assembly functions that do not grow the stack. 

#### <a id="syscall" href="#syscall">func syscall(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.syscall
tags: [private]
```

```Go
func syscall(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)
```

Implemented in the runtime package (runtime/sys_darwin.go) 

#### <a id="syscall6" href="#syscall6">func syscall6(fn, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.syscall6
tags: [private]
```

```Go
func syscall6(fn, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="syscall6X" href="#syscall6X">func syscall6X(fn, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.syscall6X
tags: [private]
```

```Go
func syscall6X(fn, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="rawSyscall" href="#rawSyscall">func rawSyscall(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.rawSyscall
tags: [private]
```

```Go
func rawSyscall(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="rawSyscall6" href="#rawSyscall6">func rawSyscall6(fn, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.rawSyscall6
tags: [private]
```

```Go
func rawSyscall6(fn, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="syscallPtr" href="#syscallPtr">func syscallPtr(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.syscallPtr
tags: [private]
```

```Go
func syscallPtr(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="syscallX" href="#syscallX">func syscallX(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.syscallX
tags: [private]
```

```Go
func syscallX(fn, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)
```

Implemented in the runtime package (runtime/sys_darwin_64.go) 

#### <a id="Syscall9" href="#Syscall9">func Syscall9(trap, a1, a2, a3, a4, a5, a6, a7, a8, a9 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.Syscall9
```

```Go
func Syscall9(trap, a1, a2, a3, a4, a5, a6, a7, a8, a9 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="Syscall" href="#Syscall">func Syscall(trap, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.Syscall
```

```Go
func Syscall(trap, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="Syscall6" href="#Syscall6">func Syscall6(trap, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.Syscall6
```

```Go
func Syscall6(trap, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="RawSyscall" href="#RawSyscall">func RawSyscall(trap, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.RawSyscall
```

```Go
func RawSyscall(trap, a1, a2, a3 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="RawSyscall6" href="#RawSyscall6">func RawSyscall6(trap, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)</a>

```
searchKey: syscall.RawSyscall6
```

```Go
func RawSyscall6(trap, a1, a2, a3, a4, a5, a6 uintptr) (r1, r2 uintptr, err Errno)
```

#### <a id="readdir_r" href="#readdir_r">func readdir_r(dir uintptr, entry *Dirent, result **Dirent) (res Errno)</a>

```
searchKey: syscall.readdir_r
tags: [private]
```

```Go
func readdir_r(dir uintptr, entry *Dirent, result **Dirent) (res Errno)
```

#### <a id="Ioctl" href="#Ioctl">func Ioctl(fd, req, arg uintptr) Errno</a>

```
searchKey: syscall.Ioctl
tags: [private]
```

```Go
func Ioctl(fd, req, arg uintptr) Errno
```

#### <a id="Errno.Error" href="#Errno.Error">func (e Errno) Error() string</a>

```
searchKey: syscall.Errno.Error
```

```Go
func (e Errno) Error() string
```

#### <a id="Errno.Is" href="#Errno.Is">func (e Errno) Is(target error) bool</a>

```
searchKey: syscall.Errno.Is
```

```Go
func (e Errno) Is(target error) bool
```

#### <a id="Errno.Temporary" href="#Errno.Temporary">func (e Errno) Temporary() bool</a>

```
searchKey: syscall.Errno.Temporary
```

```Go
func (e Errno) Temporary() bool
```

#### <a id="Errno.Timeout" href="#Errno.Timeout">func (e Errno) Timeout() bool</a>

```
searchKey: syscall.Errno.Timeout
```

```Go
func (e Errno) Timeout() bool
```

### <a id="Signal" href="#Signal">type Signal int</a>

```
searchKey: syscall.Signal
```

```Go
type Signal int
```

A Signal is a number describing a process signal. It implements the os.Signal interface. 

#### <a id="Signal.Signal" href="#Signal.Signal">func (s Signal) Signal()</a>

```
searchKey: syscall.Signal.Signal
```

```Go
func (s Signal) Signal()
```

#### <a id="Signal.String" href="#Signal.String">func (s Signal) String() string</a>

```
searchKey: syscall.Signal.String
```

```Go
func (s Signal) String() string
```

### <a id="Sockaddr" href="#Sockaddr">type Sockaddr interface</a>

```
searchKey: syscall.Sockaddr
```

```Go
type Sockaddr interface {
	sockaddr() (ptr unsafe.Pointer, len _Socklen, err error) // lowercase; only we can define Sockaddrs
}
```

#### <a id="parseSockaddrInet" href="#parseSockaddrInet">func parseSockaddrInet(b []byte, family byte) (Sockaddr, error)</a>

```
searchKey: syscall.parseSockaddrInet
tags: [private]
```

```Go
func parseSockaddrInet(b []byte, family byte) (Sockaddr, error)
```

parseSockaddrInet parses b as an internet socket address. 

#### <a id="parseNetworkLayerAddr" href="#parseNetworkLayerAddr">func parseNetworkLayerAddr(b []byte, family byte) (Sockaddr, error)</a>

```
searchKey: syscall.parseNetworkLayerAddr
tags: [private]
```

```Go
func parseNetworkLayerAddr(b []byte, family byte) (Sockaddr, error)
```

parseNetworkLayerAddr parses b as an internet socket address in conventional BSD kernel form. 

#### <a id="anyToSockaddr" href="#anyToSockaddr">func anyToSockaddr(rsa *RawSockaddrAny) (Sockaddr, error)</a>

```
searchKey: syscall.anyToSockaddr
tags: [private]
```

```Go
func anyToSockaddr(rsa *RawSockaddrAny) (Sockaddr, error)
```

#### <a id="Accept" href="#Accept">func Accept(fd int) (nfd int, sa Sockaddr, err error)</a>

```
searchKey: syscall.Accept
```

```Go
func Accept(fd int) (nfd int, sa Sockaddr, err error)
```

#### <a id="Getsockname" href="#Getsockname">func Getsockname(fd int) (sa Sockaddr, err error)</a>

```
searchKey: syscall.Getsockname
```

```Go
func Getsockname(fd int) (sa Sockaddr, err error)
```

#### <a id="Recvmsg" href="#Recvmsg">func Recvmsg(fd int, p, oob []byte, flags int) (n, oobn int, recvflags int, from Sockaddr, err error)</a>

```
searchKey: syscall.Recvmsg
```

```Go
func Recvmsg(fd int, p, oob []byte, flags int) (n, oobn int, recvflags int, from Sockaddr, err error)
```

#### <a id="Getpeername" href="#Getpeername">func Getpeername(fd int) (sa Sockaddr, err error)</a>

```
searchKey: syscall.Getpeername
```

```Go
func Getpeername(fd int) (sa Sockaddr, err error)
```

#### <a id="Recvfrom" href="#Recvfrom">func Recvfrom(fd int, p []byte, flags int) (n int, from Sockaddr, err error)</a>

```
searchKey: syscall.Recvfrom
```

```Go
func Recvfrom(fd int, p []byte, flags int) (n int, from Sockaddr, err error)
```

### <a id="SockaddrInet4" href="#SockaddrInet4">type SockaddrInet4 struct</a>

```
searchKey: syscall.SockaddrInet4
```

```Go
type SockaddrInet4 struct {
	Port int
	Addr [4]byte
	raw  RawSockaddrInet4
}
```

#### <a id="SockaddrInet4.sockaddr" href="#SockaddrInet4.sockaddr">func (sa *SockaddrInet4) sockaddr() (unsafe.Pointer, _Socklen, error)</a>

```
searchKey: syscall.SockaddrInet4.sockaddr
tags: [private]
```

```Go
func (sa *SockaddrInet4) sockaddr() (unsafe.Pointer, _Socklen, error)
```

### <a id="SockaddrInet6" href="#SockaddrInet6">type SockaddrInet6 struct</a>

```
searchKey: syscall.SockaddrInet6
```

```Go
type SockaddrInet6 struct {
	Port   int
	ZoneId uint32
	Addr   [16]byte
	raw    RawSockaddrInet6
}
```

#### <a id="SockaddrInet6.sockaddr" href="#SockaddrInet6.sockaddr">func (sa *SockaddrInet6) sockaddr() (unsafe.Pointer, _Socklen, error)</a>

```
searchKey: syscall.SockaddrInet6.sockaddr
tags: [private]
```

```Go
func (sa *SockaddrInet6) sockaddr() (unsafe.Pointer, _Socklen, error)
```

### <a id="SockaddrUnix" href="#SockaddrUnix">type SockaddrUnix struct</a>

```
searchKey: syscall.SockaddrUnix
```

```Go
type SockaddrUnix struct {
	Name string
	raw  RawSockaddrUnix
}
```

#### <a id="SockaddrUnix.sockaddr" href="#SockaddrUnix.sockaddr">func (sa *SockaddrUnix) sockaddr() (unsafe.Pointer, _Socklen, error)</a>

```
searchKey: syscall.SockaddrUnix.sockaddr
tags: [private]
```

```Go
func (sa *SockaddrUnix) sockaddr() (unsafe.Pointer, _Socklen, error)
```

### <a id="_C_short" href="#_C_short">type _C_short int16</a>

```
searchKey: syscall._C_short
tags: [private]
```

```Go
type _C_short int16
```

### <a id="_C_int" href="#_C_int">type _C_int int32</a>

```
searchKey: syscall._C_int
tags: [private]
```

```Go
type _C_int int32
```

### <a id="_C_long" href="#_C_long">type _C_long int64</a>

```
searchKey: syscall._C_long
tags: [private]
```

```Go
type _C_long int64
```

### <a id="_C_long_long" href="#_C_long_long">type _C_long_long int64</a>

```
searchKey: syscall._C_long_long
tags: [private]
```

```Go
type _C_long_long int64
```

### <a id="Timespec" href="#Timespec">type Timespec struct</a>

```
searchKey: syscall.Timespec
```

```Go
type Timespec struct {
	Sec  int64
	Nsec int64
}
```

#### <a id="setTimespec" href="#setTimespec">func setTimespec(sec, nsec int64) Timespec</a>

```
searchKey: syscall.setTimespec
tags: [private]
```

```Go
func setTimespec(sec, nsec int64) Timespec
```

#### <a id="NsecToTimespec" href="#NsecToTimespec">func NsecToTimespec(nsec int64) Timespec</a>

```
searchKey: syscall.NsecToTimespec
```

```Go
func NsecToTimespec(nsec int64) Timespec
```

NsecToTimespec converts a number of nanoseconds into a Timespec. 

#### <a id="Timespec.Unix" href="#Timespec.Unix">func (ts *Timespec) Unix() (sec int64, nsec int64)</a>

```
searchKey: syscall.Timespec.Unix
```

```Go
func (ts *Timespec) Unix() (sec int64, nsec int64)
```

Unix returns the time stored in ts as seconds plus nanoseconds. 

#### <a id="Timespec.Nano" href="#Timespec.Nano">func (ts *Timespec) Nano() int64</a>

```
searchKey: syscall.Timespec.Nano
```

```Go
func (ts *Timespec) Nano() int64
```

Nano returns the time stored in ts as nanoseconds. 

### <a id="Timeval" href="#Timeval">type Timeval struct</a>

```
searchKey: syscall.Timeval
```

```Go
type Timeval struct {
	Sec       int64
	Usec      int32
	Pad_cgo_0 [4]byte
}
```

#### <a id="BpfTimeout" href="#BpfTimeout">func BpfTimeout(fd int) (*Timeval, error)</a>

```
searchKey: syscall.BpfTimeout
tags: [deprecated]
```

```Go
func BpfTimeout(fd int) (*Timeval, error)
```

Deprecated: Use golang.org/x/net/bpf instead. 

#### <a id="setTimeval" href="#setTimeval">func setTimeval(sec, usec int64) Timeval</a>

```
searchKey: syscall.setTimeval
tags: [private]
```

```Go
func setTimeval(sec, usec int64) Timeval
```

#### <a id="NsecToTimeval" href="#NsecToTimeval">func NsecToTimeval(nsec int64) Timeval</a>

```
searchKey: syscall.NsecToTimeval
```

```Go
func NsecToTimeval(nsec int64) Timeval
```

NsecToTimeval converts a number of nanoseconds into a Timeval. 

#### <a id="Timeval.Unix" href="#Timeval.Unix">func (tv *Timeval) Unix() (sec int64, nsec int64)</a>

```
searchKey: syscall.Timeval.Unix
```

```Go
func (tv *Timeval) Unix() (sec int64, nsec int64)
```

Unix returns the time stored in tv as seconds plus nanoseconds. 

#### <a id="Timeval.Nano" href="#Timeval.Nano">func (tv *Timeval) Nano() int64</a>

```
searchKey: syscall.Timeval.Nano
```

```Go
func (tv *Timeval) Nano() int64
```

Nano returns the time stored in tv as nanoseconds. 

### <a id="Timeval32" href="#Timeval32">type Timeval32 struct</a>

```
searchKey: syscall.Timeval32
```

```Go
type Timeval32 struct {
	Sec  int32
	Usec int32
}
```

### <a id="Rusage" href="#Rusage">type Rusage struct</a>

```
searchKey: syscall.Rusage
```

```Go
type Rusage struct {
	Utime    Timeval
	Stime    Timeval
	Maxrss   int64
	Ixrss    int64
	Idrss    int64
	Isrss    int64
	Minflt   int64
	Majflt   int64
	Nswap    int64
	Inblock  int64
	Oublock  int64
	Msgsnd   int64
	Msgrcv   int64
	Nsignals int64
	Nvcsw    int64
	Nivcsw   int64
}
```

### <a id="Rlimit" href="#Rlimit">type Rlimit struct</a>

```
searchKey: syscall.Rlimit
```

```Go
type Rlimit struct {
	Cur uint64
	Max uint64
}
```

### <a id="_Gid_t" href="#_Gid_t">type _Gid_t uint32</a>

```
searchKey: syscall._Gid_t
tags: [private]
```

```Go
type _Gid_t uint32
```

### <a id="Stat_t" href="#Stat_t">type Stat_t struct</a>

```
searchKey: syscall.Stat_t
```

```Go
type Stat_t struct {
	Dev           int32
	Mode          uint16
	Nlink         uint16
	Ino           uint64
	Uid           uint32
	Gid           uint32
	Rdev          int32
	Pad_cgo_0     [4]byte
	Atimespec     Timespec
	Mtimespec     Timespec
	Ctimespec     Timespec
	Birthtimespec Timespec
	Size          int64
	Blocks        int64
	Blksize       int32
	Flags         uint32
	Gen           uint32
	Lspare        int32
	Qspare        [2]int64
}
```

### <a id="Statfs_t" href="#Statfs_t">type Statfs_t struct</a>

```
searchKey: syscall.Statfs_t
```

```Go
type Statfs_t struct {
	Bsize       uint32
	Iosize      int32
	Blocks      uint64
	Bfree       uint64
	Bavail      uint64
	Files       uint64
	Ffree       uint64
	Fsid        Fsid
	Owner       uint32
	Type        uint32
	Flags       uint32
	Fssubtype   uint32
	Fstypename  [16]int8
	Mntonname   [1024]int8
	Mntfromname [1024]int8
	Reserved    [8]uint32
}
```

### <a id="Flock_t" href="#Flock_t">type Flock_t struct</a>

```
searchKey: syscall.Flock_t
```

```Go
type Flock_t struct {
	Start  int64
	Len    int64
	Pid    int32
	Type   int16
	Whence int16
}
```

### <a id="Fstore_t" href="#Fstore_t">type Fstore_t struct</a>

```
searchKey: syscall.Fstore_t
```

```Go
type Fstore_t struct {
	Flags      uint32
	Posmode    int32
	Offset     int64
	Length     int64
	Bytesalloc int64
}
```

### <a id="Radvisory_t" href="#Radvisory_t">type Radvisory_t struct</a>

```
searchKey: syscall.Radvisory_t
```

```Go
type Radvisory_t struct {
	Offset    int64
	Count     int32
	Pad_cgo_0 [4]byte
}
```

### <a id="Fbootstraptransfer_t" href="#Fbootstraptransfer_t">type Fbootstraptransfer_t struct</a>

```
searchKey: syscall.Fbootstraptransfer_t
```

```Go
type Fbootstraptransfer_t struct {
	Offset int64
	Length uint64
	Buffer *byte
}
```

### <a id="Log2phys_t" href="#Log2phys_t">type Log2phys_t struct</a>

```
searchKey: syscall.Log2phys_t
```

```Go
type Log2phys_t struct {
	Flags       uint32
	Contigbytes int64
	Devoffset   int64
}
```

### <a id="Fsid" href="#Fsid">type Fsid struct</a>

```
searchKey: syscall.Fsid
```

```Go
type Fsid struct {
	Val [2]int32
}
```

### <a id="Dirent" href="#Dirent">type Dirent struct</a>

```
searchKey: syscall.Dirent
```

```Go
type Dirent struct {
	Ino       uint64
	Seekoff   uint64
	Reclen    uint16
	Namlen    uint16
	Type      uint8
	Name      [1024]int8
	Pad_cgo_0 [3]byte
}
```

### <a id="RawSockaddrInet4" href="#RawSockaddrInet4">type RawSockaddrInet4 struct</a>

```
searchKey: syscall.RawSockaddrInet4
```

```Go
type RawSockaddrInet4 struct {
	Len    uint8
	Family uint8
	Port   uint16
	Addr   [4]byte /* in_addr */
	Zero   [8]int8
}
```

### <a id="RawSockaddrInet6" href="#RawSockaddrInet6">type RawSockaddrInet6 struct</a>

```
searchKey: syscall.RawSockaddrInet6
```

```Go
type RawSockaddrInet6 struct {
	Len      uint8
	Family   uint8
	Port     uint16
	Flowinfo uint32
	Addr     [16]byte /* in6_addr */
	Scope_id uint32
}
```

### <a id="RawSockaddrUnix" href="#RawSockaddrUnix">type RawSockaddrUnix struct</a>

```
searchKey: syscall.RawSockaddrUnix
```

```Go
type RawSockaddrUnix struct {
	Len    uint8
	Family uint8
	Path   [104]int8
}
```

### <a id="RawSockaddrDatalink" href="#RawSockaddrDatalink">type RawSockaddrDatalink struct</a>

```
searchKey: syscall.RawSockaddrDatalink
```

```Go
type RawSockaddrDatalink struct {
	Len    uint8
	Family uint8
	Index  uint16
	Type   uint8
	Nlen   uint8
	Alen   uint8
	Slen   uint8
	Data   [12]int8
}
```

### <a id="RawSockaddr" href="#RawSockaddr">type RawSockaddr struct</a>

```
searchKey: syscall.RawSockaddr
```

```Go
type RawSockaddr struct {
	Len    uint8
	Family uint8
	Data   [14]int8
}
```

### <a id="RawSockaddrAny" href="#RawSockaddrAny">type RawSockaddrAny struct</a>

```
searchKey: syscall.RawSockaddrAny
```

```Go
type RawSockaddrAny struct {
	Addr RawSockaddr
	Pad  [92]int8
}
```

### <a id="_Socklen" href="#_Socklen">type _Socklen uint32</a>

```
searchKey: syscall._Socklen
tags: [private]
```

```Go
type _Socklen uint32
```

### <a id="Linger" href="#Linger">type Linger struct</a>

```
searchKey: syscall.Linger
```

```Go
type Linger struct {
	Onoff  int32
	Linger int32
}
```

### <a id="Iovec" href="#Iovec">type Iovec struct</a>

```
searchKey: syscall.Iovec
```

```Go
type Iovec struct {
	Base *byte
	Len  uint64
}
```

#### <a id="Iovec.SetLen" href="#Iovec.SetLen">func (iov *Iovec) SetLen(length int)</a>

```
searchKey: syscall.Iovec.SetLen
```

```Go
func (iov *Iovec) SetLen(length int)
```

### <a id="IPMreq" href="#IPMreq">type IPMreq struct</a>

```
searchKey: syscall.IPMreq
```

```Go
type IPMreq struct {
	Multiaddr [4]byte /* in_addr */
	Interface [4]byte /* in_addr */
}
```

#### <a id="GetsockoptIPMreq" href="#GetsockoptIPMreq">func GetsockoptIPMreq(fd, level, opt int) (*IPMreq, error)</a>

```
searchKey: syscall.GetsockoptIPMreq
```

```Go
func GetsockoptIPMreq(fd, level, opt int) (*IPMreq, error)
```

### <a id="IPv6Mreq" href="#IPv6Mreq">type IPv6Mreq struct</a>

```
searchKey: syscall.IPv6Mreq
```

```Go
type IPv6Mreq struct {
	Multiaddr [16]byte /* in6_addr */
	Interface uint32
}
```

#### <a id="GetsockoptIPv6Mreq" href="#GetsockoptIPv6Mreq">func GetsockoptIPv6Mreq(fd, level, opt int) (*IPv6Mreq, error)</a>

```
searchKey: syscall.GetsockoptIPv6Mreq
```

```Go
func GetsockoptIPv6Mreq(fd, level, opt int) (*IPv6Mreq, error)
```

### <a id="Msghdr" href="#Msghdr">type Msghdr struct</a>

```
searchKey: syscall.Msghdr
```

```Go
type Msghdr struct {
	Name       *byte
	Namelen    uint32
	Pad_cgo_0  [4]byte
	Iov        *Iovec
	Iovlen     int32
	Pad_cgo_1  [4]byte
	Control    *byte
	Controllen uint32
	Flags      int32
}
```

#### <a id="Msghdr.SetControllen" href="#Msghdr.SetControllen">func (msghdr *Msghdr) SetControllen(length int)</a>

```
searchKey: syscall.Msghdr.SetControllen
```

```Go
func (msghdr *Msghdr) SetControllen(length int)
```

### <a id="Cmsghdr" href="#Cmsghdr">type Cmsghdr struct</a>

```
searchKey: syscall.Cmsghdr
```

```Go
type Cmsghdr struct {
	Len   uint32
	Level int32
	Type  int32
}
```

#### <a id="socketControlMessageHeaderAndData" href="#socketControlMessageHeaderAndData">func socketControlMessageHeaderAndData(b []byte) (*Cmsghdr, []byte, error)</a>

```
searchKey: syscall.socketControlMessageHeaderAndData
tags: [private]
```

```Go
func socketControlMessageHeaderAndData(b []byte) (*Cmsghdr, []byte, error)
```

#### <a id="Cmsghdr.data" href="#Cmsghdr.data">func (h *Cmsghdr) data(offset uintptr) unsafe.Pointer</a>

```
searchKey: syscall.Cmsghdr.data
tags: [private]
```

```Go
func (h *Cmsghdr) data(offset uintptr) unsafe.Pointer
```

#### <a id="Cmsghdr.SetLen" href="#Cmsghdr.SetLen">func (cmsg *Cmsghdr) SetLen(length int)</a>

```
searchKey: syscall.Cmsghdr.SetLen
```

```Go
func (cmsg *Cmsghdr) SetLen(length int)
```

### <a id="Inet4Pktinfo" href="#Inet4Pktinfo">type Inet4Pktinfo struct</a>

```
searchKey: syscall.Inet4Pktinfo
```

```Go
type Inet4Pktinfo struct {
	Ifindex  uint32
	Spec_dst [4]byte /* in_addr */
	Addr     [4]byte /* in_addr */
}
```

### <a id="Inet6Pktinfo" href="#Inet6Pktinfo">type Inet6Pktinfo struct</a>

```
searchKey: syscall.Inet6Pktinfo
```

```Go
type Inet6Pktinfo struct {
	Addr    [16]byte /* in6_addr */
	Ifindex uint32
}
```

### <a id="IPv6MTUInfo" href="#IPv6MTUInfo">type IPv6MTUInfo struct</a>

```
searchKey: syscall.IPv6MTUInfo
```

```Go
type IPv6MTUInfo struct {
	Addr RawSockaddrInet6
	Mtu  uint32
}
```

#### <a id="GetsockoptIPv6MTUInfo" href="#GetsockoptIPv6MTUInfo">func GetsockoptIPv6MTUInfo(fd, level, opt int) (*IPv6MTUInfo, error)</a>

```
searchKey: syscall.GetsockoptIPv6MTUInfo
```

```Go
func GetsockoptIPv6MTUInfo(fd, level, opt int) (*IPv6MTUInfo, error)
```

### <a id="ICMPv6Filter" href="#ICMPv6Filter">type ICMPv6Filter struct</a>

```
searchKey: syscall.ICMPv6Filter
```

```Go
type ICMPv6Filter struct {
	Filt [8]uint32
}
```

#### <a id="GetsockoptICMPv6Filter" href="#GetsockoptICMPv6Filter">func GetsockoptICMPv6Filter(fd, level, opt int) (*ICMPv6Filter, error)</a>

```
searchKey: syscall.GetsockoptICMPv6Filter
```

```Go
func GetsockoptICMPv6Filter(fd, level, opt int) (*ICMPv6Filter, error)
```

### <a id="Kevent_t" href="#Kevent_t">type Kevent_t struct</a>

```
searchKey: syscall.Kevent_t
```

```Go
type Kevent_t struct {
	Ident  uint64
	Filter int16
	Flags  uint16
	Fflags uint32
	Data   int64
	Udata  *byte
}
```

### <a id="FdSet" href="#FdSet">type FdSet struct</a>

```
searchKey: syscall.FdSet
```

```Go
type FdSet struct {
	Bits [32]int32
}
```

### <a id="IfMsghdr" href="#IfMsghdr">type IfMsghdr struct</a>

```
searchKey: syscall.IfMsghdr
```

```Go
type IfMsghdr struct {
	Msglen    uint16
	Version   uint8
	Type      uint8
	Addrs     int32
	Flags     int32
	Index     uint16
	Pad_cgo_0 [2]byte
	Data      IfData
}
```

### <a id="IfData" href="#IfData">type IfData struct</a>

```
searchKey: syscall.IfData
```

```Go
type IfData struct {
	Type       uint8
	Typelen    uint8
	Physical   uint8
	Addrlen    uint8
	Hdrlen     uint8
	Recvquota  uint8
	Xmitquota  uint8
	Unused1    uint8
	Mtu        uint32
	Metric     uint32
	Baudrate   uint32
	Ipackets   uint32
	Ierrors    uint32
	Opackets   uint32
	Oerrors    uint32
	Collisions uint32
	Ibytes     uint32
	Obytes     uint32
	Imcasts    uint32
	Omcasts    uint32
	Iqdrops    uint32
	Noproto    uint32
	Recvtiming uint32
	Xmittiming uint32
	Lastchange Timeval32
	Unused2    uint32
	Hwassist   uint32
	Reserved1  uint32
	Reserved2  uint32
}
```

### <a id="IfaMsghdr" href="#IfaMsghdr">type IfaMsghdr struct</a>

```
searchKey: syscall.IfaMsghdr
```

```Go
type IfaMsghdr struct {
	Msglen    uint16
	Version   uint8
	Type      uint8
	Addrs     int32
	Flags     int32
	Index     uint16
	Pad_cgo_0 [2]byte
	Metric    int32
}
```

### <a id="IfmaMsghdr" href="#IfmaMsghdr">type IfmaMsghdr struct</a>

```
searchKey: syscall.IfmaMsghdr
```

```Go
type IfmaMsghdr struct {
	Msglen    uint16
	Version   uint8
	Type      uint8
	Addrs     int32
	Flags     int32
	Index     uint16
	Pad_cgo_0 [2]byte
}
```

### <a id="IfmaMsghdr2" href="#IfmaMsghdr2">type IfmaMsghdr2 struct</a>

```
searchKey: syscall.IfmaMsghdr2
```

```Go
type IfmaMsghdr2 struct {
	Msglen    uint16
	Version   uint8
	Type      uint8
	Addrs     int32
	Flags     int32
	Index     uint16
	Pad_cgo_0 [2]byte
	Refcount  int32
}
```

### <a id="RtMsghdr" href="#RtMsghdr">type RtMsghdr struct</a>

```
searchKey: syscall.RtMsghdr
```

```Go
type RtMsghdr struct {
	Msglen    uint16
	Version   uint8
	Type      uint8
	Index     uint16
	Pad_cgo_0 [2]byte
	Flags     int32
	Addrs     int32
	Pid       int32
	Seq       int32
	Errno     int32
	Use       int32
	Inits     uint32
	Rmx       RtMetrics
}
```

### <a id="RtMetrics" href="#RtMetrics">type RtMetrics struct</a>

```
searchKey: syscall.RtMetrics
```

```Go
type RtMetrics struct {
	Locks    uint32
	Mtu      uint32
	Hopcount uint32
	Expire   int32
	Recvpipe uint32
	Sendpipe uint32
	Ssthresh uint32
	Rtt      uint32
	Rttvar   uint32
	Pksent   uint32
	Filler   [4]uint32
}
```

### <a id="BpfVersion" href="#BpfVersion">type BpfVersion struct</a>

```
searchKey: syscall.BpfVersion
```

```Go
type BpfVersion struct {
	Major uint16
	Minor uint16
}
```

### <a id="BpfStat" href="#BpfStat">type BpfStat struct</a>

```
searchKey: syscall.BpfStat
```

```Go
type BpfStat struct {
	Recv uint32
	Drop uint32
}
```

#### <a id="BpfStats" href="#BpfStats">func BpfStats(fd int) (*BpfStat, error)</a>

```
searchKey: syscall.BpfStats
tags: [deprecated]
```

```Go
func BpfStats(fd int) (*BpfStat, error)
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="BpfProgram" href="#BpfProgram">type BpfProgram struct</a>

```
searchKey: syscall.BpfProgram
```

```Go
type BpfProgram struct {
	Len       uint32
	Pad_cgo_0 [4]byte
	Insns     *BpfInsn
}
```

### <a id="BpfInsn" href="#BpfInsn">type BpfInsn struct</a>

```
searchKey: syscall.BpfInsn
```

```Go
type BpfInsn struct {
	Code uint16
	Jt   uint8
	Jf   uint8
	K    uint32
}
```

#### <a id="BpfStmt" href="#BpfStmt">func BpfStmt(code, k int) *BpfInsn</a>

```
searchKey: syscall.BpfStmt
tags: [deprecated]
```

```Go
func BpfStmt(code, k int) *BpfInsn
```

Deprecated: Use golang.org/x/net/bpf instead. 

#### <a id="BpfJump" href="#BpfJump">func BpfJump(code, k, jt, jf int) *BpfInsn</a>

```
searchKey: syscall.BpfJump
tags: [deprecated]
```

```Go
func BpfJump(code, k, jt, jf int) *BpfInsn
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="BpfHdr" href="#BpfHdr">type BpfHdr struct</a>

```
searchKey: syscall.BpfHdr
```

```Go
type BpfHdr struct {
	Tstamp    Timeval32
	Caplen    uint32
	Datalen   uint32
	Hdrlen    uint16
	Pad_cgo_0 [2]byte
}
```

### <a id="Termios" href="#Termios">type Termios struct</a>

```
searchKey: syscall.Termios
```

```Go
type Termios struct {
	Iflag     uint64
	Oflag     uint64
	Cflag     uint64
	Lflag     uint64
	Cc        [20]uint8
	Pad_cgo_0 [4]byte
	Ispeed    uint64
	Ospeed    uint64
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [deprecated]
```

### <a id="BpfBuflen" href="#BpfBuflen">func BpfBuflen(fd int) (int, error)</a>

```
searchKey: syscall.BpfBuflen
tags: [deprecated]
```

```Go
func BpfBuflen(fd int) (int, error)
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="SetBpfBuflen" href="#SetBpfBuflen">func SetBpfBuflen(fd, l int) (int, error)</a>

```
searchKey: syscall.SetBpfBuflen
tags: [deprecated]
```

```Go
func SetBpfBuflen(fd, l int) (int, error)
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="BpfDatalink" href="#BpfDatalink">func BpfDatalink(fd int) (int, error)</a>

```
searchKey: syscall.BpfDatalink
tags: [deprecated]
```

```Go
func BpfDatalink(fd int) (int, error)
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="SetBpfDatalink" href="#SetBpfDatalink">func SetBpfDatalink(fd, t int) (int, error)</a>

```
searchKey: syscall.SetBpfDatalink
tags: [deprecated]
```

```Go
func SetBpfDatalink(fd, t int) (int, error)
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="SetBpfPromisc" href="#SetBpfPromisc">func SetBpfPromisc(fd, m int) error</a>

```
searchKey: syscall.SetBpfPromisc
tags: [deprecated]
```

```Go
func SetBpfPromisc(fd, m int) error
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="FlushBpf" href="#FlushBpf">func FlushBpf(fd int) error</a>

```
searchKey: syscall.FlushBpf
tags: [deprecated]
```

```Go
func FlushBpf(fd int) error
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="BpfInterface" href="#BpfInterface">func BpfInterface(fd int, name string) (string, error)</a>

```
searchKey: syscall.BpfInterface
tags: [deprecated]
```

```Go
func BpfInterface(fd int, name string) (string, error)
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="SetBpfInterface" href="#SetBpfInterface">func SetBpfInterface(fd int, name string) error</a>

```
searchKey: syscall.SetBpfInterface
tags: [deprecated]
```

```Go
func SetBpfInterface(fd int, name string) error
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="SetBpfTimeout" href="#SetBpfTimeout">func SetBpfTimeout(fd int, tv *Timeval) error</a>

```
searchKey: syscall.SetBpfTimeout
tags: [deprecated]
```

```Go
func SetBpfTimeout(fd int, tv *Timeval) error
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="SetBpfImmediate" href="#SetBpfImmediate">func SetBpfImmediate(fd, m int) error</a>

```
searchKey: syscall.SetBpfImmediate
tags: [deprecated]
```

```Go
func SetBpfImmediate(fd, m int) error
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="SetBpf" href="#SetBpf">func SetBpf(fd int, i []BpfInsn) error</a>

```
searchKey: syscall.SetBpf
tags: [deprecated]
```

```Go
func SetBpf(fd int, i []BpfInsn) error
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="CheckBpfVersion" href="#CheckBpfVersion">func CheckBpfVersion(fd int) error</a>

```
searchKey: syscall.CheckBpfVersion
tags: [deprecated]
```

```Go
func CheckBpfVersion(fd int) error
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="BpfHeadercmpl" href="#BpfHeadercmpl">func BpfHeadercmpl(fd int) (int, error)</a>

```
searchKey: syscall.BpfHeadercmpl
tags: [deprecated]
```

```Go
func BpfHeadercmpl(fd int) (int, error)
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="SetBpfHeadercmpl" href="#SetBpfHeadercmpl">func SetBpfHeadercmpl(fd, f int) error</a>

```
searchKey: syscall.SetBpfHeadercmpl
tags: [deprecated]
```

```Go
func SetBpfHeadercmpl(fd, f int) error
```

Deprecated: Use golang.org/x/net/bpf instead. 

### <a id="readInt" href="#readInt">func readInt(b []byte, off, size uintptr) (u uint64, ok bool)</a>

```
searchKey: syscall.readInt
tags: [private]
```

```Go
func readInt(b []byte, off, size uintptr) (u uint64, ok bool)
```

readInt returns the size-bytes unsigned integer in native byte order at offset off. 

### <a id="readIntBE" href="#readIntBE">func readIntBE(b []byte, size uintptr) uint64</a>

```
searchKey: syscall.readIntBE
tags: [private]
```

```Go
func readIntBE(b []byte, size uintptr) uint64
```

### <a id="readIntLE" href="#readIntLE">func readIntLE(b []byte, size uintptr) uint64</a>

```
searchKey: syscall.readIntLE
tags: [private]
```

```Go
func readIntLE(b []byte, size uintptr) uint64
```

### <a id="ParseDirent" href="#ParseDirent">func ParseDirent(buf []byte, max int, names []string) (consumed int, count int, newnames []string)</a>

```
searchKey: syscall.ParseDirent
```

```Go
func ParseDirent(buf []byte, max int, names []string) (consumed int, count int, newnames []string)
```

ParseDirent parses up to max directory entries in buf, appending the names to names. It returns the number of bytes consumed from buf, the number of entries added to names, and the new names slice. 

### <a id="runtime_envs" href="#runtime_envs">func runtime_envs() []string</a>

```
searchKey: syscall.runtime_envs
tags: [private]
```

```Go
func runtime_envs() []string
```

### <a id="setenv_c" href="#setenv_c">func setenv_c(k, v string)</a>

```
searchKey: syscall.setenv_c
tags: [private]
```

```Go
func setenv_c(k, v string)
```

setenv_c and unsetenv_c are provided by the runtime but are no-ops if cgo isn't loaded. 

### <a id="unsetenv_c" href="#unsetenv_c">func unsetenv_c(k string)</a>

```
searchKey: syscall.unsetenv_c
tags: [private]
```

```Go
func unsetenv_c(k string)
```

### <a id="copyenv" href="#copyenv">func copyenv()</a>

```
searchKey: syscall.copyenv
tags: [private]
```

```Go
func copyenv()
```

### <a id="Unsetenv" href="#Unsetenv">func Unsetenv(key string) error</a>

```
searchKey: syscall.Unsetenv
```

```Go
func Unsetenv(key string) error
```

### <a id="Getenv" href="#Getenv">func Getenv(key string) (value string, found bool)</a>

```
searchKey: syscall.Getenv
```

```Go
func Getenv(key string) (value string, found bool)
```

### <a id="Setenv" href="#Setenv">func Setenv(key, value string) error</a>

```
searchKey: syscall.Setenv
```

```Go
func Setenv(key, value string) error
```

### <a id="Clearenv" href="#Clearenv">func Clearenv()</a>

```
searchKey: syscall.Clearenv
```

```Go
func Clearenv()
```

### <a id="Environ" href="#Environ">func Environ() []string</a>

```
searchKey: syscall.Environ
```

```Go
func Environ() []string
```

### <a id="runtime_BeforeFork" href="#runtime_BeforeFork">func runtime_BeforeFork()</a>

```
searchKey: syscall.runtime_BeforeFork
tags: [private]
```

```Go
func runtime_BeforeFork()
```

Implemented in runtime package. 

### <a id="runtime_AfterFork" href="#runtime_AfterFork">func runtime_AfterFork()</a>

```
searchKey: syscall.runtime_AfterFork
tags: [private]
```

```Go
func runtime_AfterFork()
```

### <a id="runtime_AfterForkInChild" href="#runtime_AfterForkInChild">func runtime_AfterForkInChild()</a>

```
searchKey: syscall.runtime_AfterForkInChild
tags: [private]
```

```Go
func runtime_AfterForkInChild()
```

### <a id="StringSlicePtr" href="#StringSlicePtr">func StringSlicePtr(ss []string) []*byte</a>

```
searchKey: syscall.StringSlicePtr
tags: [deprecated]
```

```Go
func StringSlicePtr(ss []string) []*byte
```

StringSlicePtr converts a slice of strings to a slice of pointers to NUL-terminated byte arrays. If any string contains a NUL byte this function panics instead of returning an error. 

Deprecated: Use SlicePtrFromStrings instead. 

### <a id="SlicePtrFromStrings" href="#SlicePtrFromStrings">func SlicePtrFromStrings(ss []string) ([]*byte, error)</a>

```
searchKey: syscall.SlicePtrFromStrings
```

```Go
func SlicePtrFromStrings(ss []string) ([]*byte, error)
```

SlicePtrFromStrings converts a slice of strings to a slice of pointers to NUL-terminated byte arrays. If any string contains a NUL byte, it returns (nil, EINVAL). 

### <a id="CloseOnExec" href="#CloseOnExec">func CloseOnExec(fd int)</a>

```
searchKey: syscall.CloseOnExec
```

```Go
func CloseOnExec(fd int)
```

### <a id="SetNonblock" href="#SetNonblock">func SetNonblock(fd int, nonblocking bool) (err error)</a>

```
searchKey: syscall.SetNonblock
```

```Go
func SetNonblock(fd int, nonblocking bool) (err error)
```

### <a id="forkExec" href="#forkExec">func forkExec(argv0 string, argv []string, attr *ProcAttr) (pid int, err error)</a>

```
searchKey: syscall.forkExec
tags: [private]
```

```Go
func forkExec(argv0 string, argv []string, attr *ProcAttr) (pid int, err error)
```

### <a id="ForkExec" href="#ForkExec">func ForkExec(argv0 string, argv []string, attr *ProcAttr) (pid int, err error)</a>

```
searchKey: syscall.ForkExec
```

```Go
func ForkExec(argv0 string, argv []string, attr *ProcAttr) (pid int, err error)
```

Combination of fork and exec, careful to be thread safe. 

### <a id="StartProcess" href="#StartProcess">func StartProcess(argv0 string, argv []string, attr *ProcAttr) (pid int, handle uintptr, err error)</a>

```
searchKey: syscall.StartProcess
```

```Go
func StartProcess(argv0 string, argv []string, attr *ProcAttr) (pid int, handle uintptr, err error)
```

StartProcess wraps ForkExec for package os. 

### <a id="runtime_BeforeExec" href="#runtime_BeforeExec">func runtime_BeforeExec()</a>

```
searchKey: syscall.runtime_BeforeExec
tags: [private]
```

```Go
func runtime_BeforeExec()
```

Implemented in runtime package. 

### <a id="runtime_AfterExec" href="#runtime_AfterExec">func runtime_AfterExec()</a>

```
searchKey: syscall.runtime_AfterExec
tags: [private]
```

```Go
func runtime_AfterExec()
```

### <a id="Exec" href="#Exec">func Exec(argv0 string, argv []string, envv []string) (err error)</a>

```
searchKey: syscall.Exec
```

```Go
func Exec(argv0 string, argv []string, envv []string) (err error)
```

Exec invokes the execve(2) system call. 

### <a id="FcntlFlock" href="#FcntlFlock">func FcntlFlock(fd uintptr, cmd int, lk *Flock_t) error</a>

```
searchKey: syscall.FcntlFlock
```

```Go
func FcntlFlock(fd uintptr, cmd int, lk *Flock_t) error
```

FcntlFlock performs a fcntl syscall for the F_GETLK, F_SETLK or F_SETLKW command. 

### <a id="forkExecPipe" href="#forkExecPipe">func forkExecPipe(p []int) error</a>

```
searchKey: syscall.forkExecPipe
tags: [private]
```

```Go
func forkExecPipe(p []int) error
```

Try to open a pipe with O_CLOEXEC set on both file descriptors. 

### <a id="msanRead" href="#msanRead">func msanRead(addr unsafe.Pointer, len int)</a>

```
searchKey: syscall.msanRead
tags: [private]
```

```Go
func msanRead(addr unsafe.Pointer, len int)
```

### <a id="msanWrite" href="#msanWrite">func msanWrite(addr unsafe.Pointer, len int)</a>

```
searchKey: syscall.msanWrite
tags: [private]
```

```Go
func msanWrite(addr unsafe.Pointer, len int)
```

### <a id="ptrace" href="#ptrace">func ptrace(request int, pid int, addr uintptr, data uintptr) error</a>

```
searchKey: syscall.ptrace
tags: [private]
```

```Go
func ptrace(request int, pid int, addr uintptr, data uintptr) error
```

Nosplit because it is called from forkAndExecInChild. 

### <a id="rsaAlignOf" href="#rsaAlignOf">func rsaAlignOf(salen int) int</a>

```
searchKey: syscall.rsaAlignOf
tags: [private]
```

```Go
func rsaAlignOf(salen int) int
```

Round the length of a raw sockaddr up to align it properly. 

### <a id="RouteRIB" href="#RouteRIB">func RouteRIB(facility, param int) ([]byte, error)</a>

```
searchKey: syscall.RouteRIB
tags: [deprecated]
```

```Go
func RouteRIB(facility, param int) ([]byte, error)
```

RouteRIB returns routing information base, as known as RIB, which consists of network facility information, states and parameters. 

Deprecated: Use golang.org/x/net/route instead. 

### <a id="ParseRoutingMessage" href="#ParseRoutingMessage">func ParseRoutingMessage(b []byte) (msgs []RoutingMessage, err error)</a>

```
searchKey: syscall.ParseRoutingMessage
tags: [deprecated]
```

```Go
func ParseRoutingMessage(b []byte) (msgs []RoutingMessage, err error)
```

ParseRoutingMessage parses b as routing messages and returns the slice containing the RoutingMessage interfaces. 

Deprecated: Use golang.org/x/net/route instead. 

### <a id="ParseRoutingSockaddr" href="#ParseRoutingSockaddr">func ParseRoutingSockaddr(msg RoutingMessage) ([]Sockaddr, error)</a>

```
searchKey: syscall.ParseRoutingSockaddr
tags: [deprecated]
```

```Go
func ParseRoutingSockaddr(msg RoutingMessage) ([]Sockaddr, error)
```

ParseRoutingSockaddr parses msg's payload as raw sockaddrs and returns the slice containing the Sockaddr interfaces. 

Deprecated: Use golang.org/x/net/route instead. 

### <a id="CmsgLen" href="#CmsgLen">func CmsgLen(datalen int) int</a>

```
searchKey: syscall.CmsgLen
```

```Go
func CmsgLen(datalen int) int
```

CmsgLen returns the value to store in the Len field of the Cmsghdr structure, taking into account any necessary alignment. 

### <a id="CmsgSpace" href="#CmsgSpace">func CmsgSpace(datalen int) int</a>

```
searchKey: syscall.CmsgSpace
```

```Go
func CmsgSpace(datalen int) int
```

CmsgSpace returns the number of bytes an ancillary element with payload of the passed data length occupies. 

### <a id="ParseSocketControlMessage" href="#ParseSocketControlMessage">func ParseSocketControlMessage(b []byte) ([]SocketControlMessage, error)</a>

```
searchKey: syscall.ParseSocketControlMessage
```

```Go
func ParseSocketControlMessage(b []byte) ([]SocketControlMessage, error)
```

ParseSocketControlMessage parses b as an array of socket control messages. 

### <a id="UnixRights" href="#UnixRights">func UnixRights(fds ...int) []byte</a>

```
searchKey: syscall.UnixRights
```

```Go
func UnixRights(fds ...int) []byte
```

UnixRights encodes a set of open file descriptors into a socket control message for sending to another process. 

### <a id="ParseUnixRights" href="#ParseUnixRights">func ParseUnixRights(m *SocketControlMessage) ([]int, error)</a>

```
searchKey: syscall.ParseUnixRights
```

```Go
func ParseUnixRights(m *SocketControlMessage) ([]int, error)
```

ParseUnixRights decodes a socket control message that contains an integer array of open file descriptors from another process. 

### <a id="cmsgAlignOf" href="#cmsgAlignOf">func cmsgAlignOf(salen int) int</a>

```
searchKey: syscall.cmsgAlignOf
tags: [private]
```

```Go
func cmsgAlignOf(salen int) int
```

Round the length of a raw sockaddr up to align it properly. 

### <a id="StringByteSlice" href="#StringByteSlice">func StringByteSlice(s string) []byte</a>

```
searchKey: syscall.StringByteSlice
tags: [deprecated]
```

```Go
func StringByteSlice(s string) []byte
```

StringByteSlice converts a string to a NUL-terminated []byte, If s contains a NUL byte this function panics instead of returning an error. 

Deprecated: Use ByteSliceFromString instead. 

### <a id="ByteSliceFromString" href="#ByteSliceFromString">func ByteSliceFromString(s string) ([]byte, error)</a>

```
searchKey: syscall.ByteSliceFromString
```

```Go
func ByteSliceFromString(s string) ([]byte, error)
```

ByteSliceFromString returns a NUL-terminated slice of bytes containing the text of s. If s contains a NUL byte at any location, it returns (nil, EINVAL). 

### <a id="StringBytePtr" href="#StringBytePtr">func StringBytePtr(s string) *byte</a>

```
searchKey: syscall.StringBytePtr
tags: [deprecated]
```

```Go
func StringBytePtr(s string) *byte
```

StringBytePtr returns a pointer to a NUL-terminated array of bytes. If s contains a NUL byte this function panics instead of returning an error. 

Deprecated: Use BytePtrFromString instead. 

### <a id="BytePtrFromString" href="#BytePtrFromString">func BytePtrFromString(s string) (*byte, error)</a>

```
searchKey: syscall.BytePtrFromString
```

```Go
func BytePtrFromString(s string) (*byte, error)
```

BytePtrFromString returns a pointer to a NUL-terminated array of bytes containing the text of s. If s contains a NUL byte at any location, it returns (nil, EINVAL). 

### <a id="Getpagesize" href="#Getpagesize">func Getpagesize() int</a>

```
searchKey: syscall.Getpagesize
```

```Go
func Getpagesize() int
```

### <a id="Exit" href="#Exit">func Exit(code int)</a>

```
searchKey: syscall.Exit
```

```Go
func Exit(code int)
```

### <a id="Getwd" href="#Getwd">func Getwd() (string, error)</a>

```
searchKey: syscall.Getwd
```

```Go
func Getwd() (string, error)
```

### <a id="Getgroups" href="#Getgroups">func Getgroups() (gids []int, err error)</a>

```
searchKey: syscall.Getgroups
```

```Go
func Getgroups() (gids []int, err error)
```

### <a id="Setgroups" href="#Setgroups">func Setgroups(gids []int) (err error)</a>

```
searchKey: syscall.Setgroups
```

```Go
func Setgroups(gids []int) (err error)
```

### <a id="ReadDirent" href="#ReadDirent">func ReadDirent(fd int, buf []byte) (n int, err error)</a>

```
searchKey: syscall.ReadDirent
```

```Go
func ReadDirent(fd int, buf []byte) (n int, err error)
```

### <a id="Wait4" href="#Wait4">func Wait4(pid int, wstatus *WaitStatus, options int, rusage *Rusage) (wpid int, err error)</a>

```
searchKey: syscall.Wait4
```

```Go
func Wait4(pid int, wstatus *WaitStatus, options int, rusage *Rusage) (wpid int, err error)
```

### <a id="GetsockoptByte" href="#GetsockoptByte">func GetsockoptByte(fd, level, opt int) (value byte, err error)</a>

```
searchKey: syscall.GetsockoptByte
```

```Go
func GetsockoptByte(fd, level, opt int) (value byte, err error)
```

### <a id="GetsockoptInet4Addr" href="#GetsockoptInet4Addr">func GetsockoptInet4Addr(fd, level, opt int) (value [4]byte, err error)</a>

```
searchKey: syscall.GetsockoptInet4Addr
```

```Go
func GetsockoptInet4Addr(fd, level, opt int) (value [4]byte, err error)
```

### <a id="Sendmsg" href="#Sendmsg">func Sendmsg(fd int, p, oob []byte, to Sockaddr, flags int) (err error)</a>

```
searchKey: syscall.Sendmsg
```

```Go
func Sendmsg(fd int, p, oob []byte, to Sockaddr, flags int) (err error)
```

### <a id="SendmsgN" href="#SendmsgN">func SendmsgN(fd int, p, oob []byte, to Sockaddr, flags int) (n int, err error)</a>

```
searchKey: syscall.SendmsgN
```

```Go
func SendmsgN(fd int, p, oob []byte, to Sockaddr, flags int) (n int, err error)
```

### <a id="Kevent" href="#Kevent">func Kevent(kq int, changes, events []Kevent_t, timeout *Timespec) (n int, err error)</a>

```
searchKey: syscall.Kevent
```

```Go
func Kevent(kq int, changes, events []Kevent_t, timeout *Timespec) (n int, err error)
```

### <a id="Sysctl" href="#Sysctl">func Sysctl(name string) (value string, err error)</a>

```
searchKey: syscall.Sysctl
```

```Go
func Sysctl(name string) (value string, err error)
```

### <a id="SysctlUint32" href="#SysctlUint32">func SysctlUint32(name string) (value uint32, err error)</a>

```
searchKey: syscall.SysctlUint32
```

```Go
func SysctlUint32(name string) (value uint32, err error)
```

### <a id="Utimes" href="#Utimes">func Utimes(path string, tv []Timeval) (err error)</a>

```
searchKey: syscall.Utimes
```

```Go
func Utimes(path string, tv []Timeval) (err error)
```

### <a id="UtimesNano" href="#UtimesNano">func UtimesNano(path string, ts []Timespec) error</a>

```
searchKey: syscall.UtimesNano
```

```Go
func UtimesNano(path string, ts []Timespec) error
```

### <a id="Futimes" href="#Futimes">func Futimes(fd int, tv []Timeval) (err error)</a>

```
searchKey: syscall.Futimes
```

```Go
func Futimes(fd int, tv []Timeval) (err error)
```

### <a id="Mmap" href="#Mmap">func Mmap(fd int, offset int64, length int, prot int, flags int) (data []byte, err error)</a>

```
searchKey: syscall.Mmap
```

```Go
func Mmap(fd int, offset int64, length int, prot int, flags int) (data []byte, err error)
```

### <a id="Munmap" href="#Munmap">func Munmap(b []byte) (err error)</a>

```
searchKey: syscall.Munmap
```

```Go
func Munmap(b []byte) (err error)
```

### <a id="nametomib" href="#nametomib">func nametomib(name string) (mib []_C_int, err error)</a>

```
searchKey: syscall.nametomib
tags: [private]
```

```Go
func nametomib(name string) (mib []_C_int, err error)
```

Translate "kern.hostname" to []_C_int{0,1,2,3}. 

### <a id="direntIno" href="#direntIno">func direntIno(buf []byte) (uint64, bool)</a>

```
searchKey: syscall.direntIno
tags: [private]
```

```Go
func direntIno(buf []byte) (uint64, bool)
```

### <a id="direntReclen" href="#direntReclen">func direntReclen(buf []byte) (uint64, bool)</a>

```
searchKey: syscall.direntReclen
tags: [private]
```

```Go
func direntReclen(buf []byte) (uint64, bool)
```

### <a id="direntNamlen" href="#direntNamlen">func direntNamlen(buf []byte) (uint64, bool)</a>

```
searchKey: syscall.direntNamlen
tags: [private]
```

```Go
func direntNamlen(buf []byte) (uint64, bool)
```

### <a id="PtraceAttach" href="#PtraceAttach">func PtraceAttach(pid int) (err error)</a>

```
searchKey: syscall.PtraceAttach
```

```Go
func PtraceAttach(pid int) (err error)
```

### <a id="PtraceDetach" href="#PtraceDetach">func PtraceDetach(pid int) (err error)</a>

```
searchKey: syscall.PtraceDetach
```

```Go
func PtraceDetach(pid int) (err error)
```

### <a id="Pipe" href="#Pipe">func Pipe(p []int) (err error)</a>

```
searchKey: syscall.Pipe
```

```Go
func Pipe(p []int) (err error)
```

### <a id="Getfsstat" href="#Getfsstat">func Getfsstat(buf []Statfs_t, flags int) (n int, err error)</a>

```
searchKey: syscall.Getfsstat
```

```Go
func Getfsstat(buf []Statfs_t, flags int) (n int, err error)
```

### <a id="libc_getfsstat_trampoline" href="#libc_getfsstat_trampoline">func libc_getfsstat_trampoline()</a>

```
searchKey: syscall.libc_getfsstat_trampoline
tags: [private]
```

```Go
func libc_getfsstat_trampoline()
```

### <a id="setattrlistTimes" href="#setattrlistTimes">func setattrlistTimes(path string, times []Timespec) error</a>

```
searchKey: syscall.setattrlistTimes
tags: [private]
```

```Go
func setattrlistTimes(path string, times []Timespec) error
```

### <a id="libc_setattrlist_trampoline" href="#libc_setattrlist_trampoline">func libc_setattrlist_trampoline()</a>

```
searchKey: syscall.libc_setattrlist_trampoline
tags: [private]
```

```Go
func libc_setattrlist_trampoline()
```

### <a id="utimensat" href="#utimensat">func utimensat(dirfd int, path string, times *[2]Timespec, flag int) error</a>

```
searchKey: syscall.utimensat
tags: [private]
```

```Go
func utimensat(dirfd int, path string, times *[2]Timespec, flag int) error
```

### <a id="Kill" href="#Kill">func Kill(pid int, signum Signal) (err error)</a>

```
searchKey: syscall.Kill
```

```Go
func Kill(pid int, signum Signal) (err error)
```

### <a id="init.syscall_darwin.go" href="#init.syscall_darwin.go">func init()</a>

```
searchKey: syscall.init
tags: [private]
```

```Go
func init()
```

### <a id="fdopendir" href="#fdopendir">func fdopendir(fd int) (dir uintptr, err error)</a>

```
searchKey: syscall.fdopendir
tags: [private]
```

```Go
func fdopendir(fd int) (dir uintptr, err error)
```

### <a id="libc_fdopendir_trampoline" href="#libc_fdopendir_trampoline">func libc_fdopendir_trampoline()</a>

```
searchKey: syscall.libc_fdopendir_trampoline
tags: [private]
```

```Go
func libc_fdopendir_trampoline()
```

### <a id="readlen" href="#readlen">func readlen(fd int, buf *byte, nbuf int) (n int, err error)</a>

```
searchKey: syscall.readlen
tags: [private]
```

```Go
func readlen(fd int, buf *byte, nbuf int) (n int, err error)
```

### <a id="writelen" href="#writelen">func writelen(fd int, buf *byte, nbuf int) (n int, err error)</a>

```
searchKey: syscall.writelen
tags: [private]
```

```Go
func writelen(fd int, buf *byte, nbuf int) (n int, err error)
```

### <a id="Getdirentries" href="#Getdirentries">func Getdirentries(fd int, buf []byte, basep *uintptr) (n int, err error)</a>

```
searchKey: syscall.Getdirentries
```

```Go
func Getdirentries(fd int, buf []byte, basep *uintptr) (n int, err error)
```

### <a id="SetKevent" href="#SetKevent">func SetKevent(k *Kevent_t, fd, mode, flags int)</a>

```
searchKey: syscall.SetKevent
```

```Go
func SetKevent(k *Kevent_t, fd, mode, flags int)
```

### <a id="sendfile" href="#sendfile">func sendfile(outfd int, infd int, offset *int64, count int) (written int, err error)</a>

```
searchKey: syscall.sendfile
tags: [private]
```

```Go
func sendfile(outfd int, infd int, offset *int64, count int) (written int, err error)
```

### <a id="libc_sendfile_trampoline" href="#libc_sendfile_trampoline">func libc_sendfile_trampoline()</a>

```
searchKey: syscall.libc_sendfile_trampoline
tags: [private]
```

```Go
func libc_sendfile_trampoline()
```

### <a id="clen" href="#clen">func clen(n []byte) int</a>

```
searchKey: syscall.clen
tags: [private]
```

```Go
func clen(n []byte) int
```

clen returns the index of the first NULL byte in n or len(n) if n contains no NULL byte. 

### <a id="errnoErr" href="#errnoErr">func errnoErr(e Errno) error</a>

```
searchKey: syscall.errnoErr
tags: [private]
```

```Go
func errnoErr(e Errno) error
```

errnoErr returns common boxed Errno values, to prevent allocations at runtime. 

### <a id="Read" href="#Read">func Read(fd int, p []byte) (n int, err error)</a>

```
searchKey: syscall.Read
```

```Go
func Read(fd int, p []byte) (n int, err error)
```

### <a id="Write" href="#Write">func Write(fd int, p []byte) (n int, err error)</a>

```
searchKey: syscall.Write
```

```Go
func Write(fd int, p []byte) (n int, err error)
```

### <a id="Bind" href="#Bind">func Bind(fd int, sa Sockaddr) (err error)</a>

```
searchKey: syscall.Bind
```

```Go
func Bind(fd int, sa Sockaddr) (err error)
```

### <a id="Connect" href="#Connect">func Connect(fd int, sa Sockaddr) (err error)</a>

```
searchKey: syscall.Connect
```

```Go
func Connect(fd int, sa Sockaddr) (err error)
```

### <a id="GetsockoptInt" href="#GetsockoptInt">func GetsockoptInt(fd, level, opt int) (value int, err error)</a>

```
searchKey: syscall.GetsockoptInt
```

```Go
func GetsockoptInt(fd, level, opt int) (value int, err error)
```

### <a id="Sendto" href="#Sendto">func Sendto(fd int, p []byte, flags int, to Sockaddr) (err error)</a>

```
searchKey: syscall.Sendto
```

```Go
func Sendto(fd int, p []byte, flags int, to Sockaddr) (err error)
```

### <a id="SetsockoptByte" href="#SetsockoptByte">func SetsockoptByte(fd, level, opt int, value byte) (err error)</a>

```
searchKey: syscall.SetsockoptByte
```

```Go
func SetsockoptByte(fd, level, opt int, value byte) (err error)
```

### <a id="SetsockoptInt" href="#SetsockoptInt">func SetsockoptInt(fd, level, opt int, value int) (err error)</a>

```
searchKey: syscall.SetsockoptInt
```

```Go
func SetsockoptInt(fd, level, opt int, value int) (err error)
```

### <a id="SetsockoptInet4Addr" href="#SetsockoptInet4Addr">func SetsockoptInet4Addr(fd, level, opt int, value [4]byte) (err error)</a>

```
searchKey: syscall.SetsockoptInet4Addr
```

```Go
func SetsockoptInet4Addr(fd, level, opt int, value [4]byte) (err error)
```

### <a id="SetsockoptIPMreq" href="#SetsockoptIPMreq">func SetsockoptIPMreq(fd, level, opt int, mreq *IPMreq) (err error)</a>

```
searchKey: syscall.SetsockoptIPMreq
```

```Go
func SetsockoptIPMreq(fd, level, opt int, mreq *IPMreq) (err error)
```

### <a id="SetsockoptIPv6Mreq" href="#SetsockoptIPv6Mreq">func SetsockoptIPv6Mreq(fd, level, opt int, mreq *IPv6Mreq) (err error)</a>

```
searchKey: syscall.SetsockoptIPv6Mreq
```

```Go
func SetsockoptIPv6Mreq(fd, level, opt int, mreq *IPv6Mreq) (err error)
```

### <a id="SetsockoptICMPv6Filter" href="#SetsockoptICMPv6Filter">func SetsockoptICMPv6Filter(fd, level, opt int, filter *ICMPv6Filter) error</a>

```
searchKey: syscall.SetsockoptICMPv6Filter
```

```Go
func SetsockoptICMPv6Filter(fd, level, opt int, filter *ICMPv6Filter) error
```

### <a id="SetsockoptLinger" href="#SetsockoptLinger">func SetsockoptLinger(fd, level, opt int, l *Linger) (err error)</a>

```
searchKey: syscall.SetsockoptLinger
```

```Go
func SetsockoptLinger(fd, level, opt int, l *Linger) (err error)
```

### <a id="SetsockoptString" href="#SetsockoptString">func SetsockoptString(fd, level, opt int, s string) (err error)</a>

```
searchKey: syscall.SetsockoptString
```

```Go
func SetsockoptString(fd, level, opt int, s string) (err error)
```

### <a id="SetsockoptTimeval" href="#SetsockoptTimeval">func SetsockoptTimeval(fd, level, opt int, tv *Timeval) (err error)</a>

```
searchKey: syscall.SetsockoptTimeval
```

```Go
func SetsockoptTimeval(fd, level, opt int, tv *Timeval) (err error)
```

### <a id="Socket" href="#Socket">func Socket(domain, typ, proto int) (fd int, err error)</a>

```
searchKey: syscall.Socket
```

```Go
func Socket(domain, typ, proto int) (fd int, err error)
```

### <a id="Socketpair" href="#Socketpair">func Socketpair(domain, typ, proto int) (fd [2]int, err error)</a>

```
searchKey: syscall.Socketpair
```

```Go
func Socketpair(domain, typ, proto int) (fd [2]int, err error)
```

### <a id="Sendfile" href="#Sendfile">func Sendfile(outfd int, infd int, offset *int64, count int) (written int, err error)</a>

```
searchKey: syscall.Sendfile
```

```Go
func Sendfile(outfd int, infd int, offset *int64, count int) (written int, err error)
```

### <a id="faketimeWrite" href="#faketimeWrite">func faketimeWrite(fd int, p []byte) int</a>

```
searchKey: syscall.faketimeWrite
tags: [private]
```

```Go
func faketimeWrite(fd int, p []byte) int
```

### <a id="TimespecToNsec" href="#TimespecToNsec">func TimespecToNsec(ts Timespec) int64</a>

```
searchKey: syscall.TimespecToNsec
```

```Go
func TimespecToNsec(ts Timespec) int64
```

TimespecToNSec returns the time stored in ts as nanoseconds. 

### <a id="TimevalToNsec" href="#TimevalToNsec">func TimevalToNsec(tv Timeval) int64</a>

```
searchKey: syscall.TimevalToNsec
```

```Go
func TimevalToNsec(tv Timeval) int64
```

TimevalToNsec returns the time stored in tv as nanoseconds. 

### <a id="getgroups" href="#getgroups">func getgroups(ngid int, gid *_Gid_t) (n int, err error)</a>

```
searchKey: syscall.getgroups
tags: [private]
```

```Go
func getgroups(ngid int, gid *_Gid_t) (n int, err error)
```

### <a id="libc_getgroups_trampoline" href="#libc_getgroups_trampoline">func libc_getgroups_trampoline()</a>

```
searchKey: syscall.libc_getgroups_trampoline
tags: [private]
```

```Go
func libc_getgroups_trampoline()
```

### <a id="setgroups" href="#setgroups">func setgroups(ngid int, gid *_Gid_t) (err error)</a>

```
searchKey: syscall.setgroups
tags: [private]
```

```Go
func setgroups(ngid int, gid *_Gid_t) (err error)
```

### <a id="libc_setgroups_trampoline" href="#libc_setgroups_trampoline">func libc_setgroups_trampoline()</a>

```
searchKey: syscall.libc_setgroups_trampoline
tags: [private]
```

```Go
func libc_setgroups_trampoline()
```

### <a id="wait4" href="#wait4">func wait4(pid int, wstatus *_C_int, options int, rusage *Rusage) (wpid int, err error)</a>

```
searchKey: syscall.wait4
tags: [private]
```

```Go
func wait4(pid int, wstatus *_C_int, options int, rusage *Rusage) (wpid int, err error)
```

### <a id="libc_wait4_trampoline" href="#libc_wait4_trampoline">func libc_wait4_trampoline()</a>

```
searchKey: syscall.libc_wait4_trampoline
tags: [private]
```

```Go
func libc_wait4_trampoline()
```

### <a id="accept" href="#accept">func accept(s int, rsa *RawSockaddrAny, addrlen *_Socklen) (fd int, err error)</a>

```
searchKey: syscall.accept
tags: [private]
```

```Go
func accept(s int, rsa *RawSockaddrAny, addrlen *_Socklen) (fd int, err error)
```

### <a id="libc_accept_trampoline" href="#libc_accept_trampoline">func libc_accept_trampoline()</a>

```
searchKey: syscall.libc_accept_trampoline
tags: [private]
```

```Go
func libc_accept_trampoline()
```

### <a id="bind" href="#bind">func bind(s int, addr unsafe.Pointer, addrlen _Socklen) (err error)</a>

```
searchKey: syscall.bind
tags: [private]
```

```Go
func bind(s int, addr unsafe.Pointer, addrlen _Socklen) (err error)
```

### <a id="libc_bind_trampoline" href="#libc_bind_trampoline">func libc_bind_trampoline()</a>

```
searchKey: syscall.libc_bind_trampoline
tags: [private]
```

```Go
func libc_bind_trampoline()
```

### <a id="connect" href="#connect">func connect(s int, addr unsafe.Pointer, addrlen _Socklen) (err error)</a>

```
searchKey: syscall.connect
tags: [private]
```

```Go
func connect(s int, addr unsafe.Pointer, addrlen _Socklen) (err error)
```

### <a id="libc_connect_trampoline" href="#libc_connect_trampoline">func libc_connect_trampoline()</a>

```
searchKey: syscall.libc_connect_trampoline
tags: [private]
```

```Go
func libc_connect_trampoline()
```

### <a id="socket" href="#socket">func socket(domain int, typ int, proto int) (fd int, err error)</a>

```
searchKey: syscall.socket
tags: [private]
```

```Go
func socket(domain int, typ int, proto int) (fd int, err error)
```

### <a id="libc_socket_trampoline" href="#libc_socket_trampoline">func libc_socket_trampoline()</a>

```
searchKey: syscall.libc_socket_trampoline
tags: [private]
```

```Go
func libc_socket_trampoline()
```

### <a id="getsockopt" href="#getsockopt">func getsockopt(s int, level int, name int, val unsafe.Pointer, vallen *_Socklen) (err error)</a>

```
searchKey: syscall.getsockopt
tags: [private]
```

```Go
func getsockopt(s int, level int, name int, val unsafe.Pointer, vallen *_Socklen) (err error)
```

### <a id="libc_getsockopt_trampoline" href="#libc_getsockopt_trampoline">func libc_getsockopt_trampoline()</a>

```
searchKey: syscall.libc_getsockopt_trampoline
tags: [private]
```

```Go
func libc_getsockopt_trampoline()
```

### <a id="setsockopt" href="#setsockopt">func setsockopt(s int, level int, name int, val unsafe.Pointer, vallen uintptr) (err error)</a>

```
searchKey: syscall.setsockopt
tags: [private]
```

```Go
func setsockopt(s int, level int, name int, val unsafe.Pointer, vallen uintptr) (err error)
```

### <a id="libc_setsockopt_trampoline" href="#libc_setsockopt_trampoline">func libc_setsockopt_trampoline()</a>

```
searchKey: syscall.libc_setsockopt_trampoline
tags: [private]
```

```Go
func libc_setsockopt_trampoline()
```

### <a id="getpeername" href="#getpeername">func getpeername(fd int, rsa *RawSockaddrAny, addrlen *_Socklen) (err error)</a>

```
searchKey: syscall.getpeername
tags: [private]
```

```Go
func getpeername(fd int, rsa *RawSockaddrAny, addrlen *_Socklen) (err error)
```

### <a id="libc_getpeername_trampoline" href="#libc_getpeername_trampoline">func libc_getpeername_trampoline()</a>

```
searchKey: syscall.libc_getpeername_trampoline
tags: [private]
```

```Go
func libc_getpeername_trampoline()
```

### <a id="getsockname" href="#getsockname">func getsockname(fd int, rsa *RawSockaddrAny, addrlen *_Socklen) (err error)</a>

```
searchKey: syscall.getsockname
tags: [private]
```

```Go
func getsockname(fd int, rsa *RawSockaddrAny, addrlen *_Socklen) (err error)
```

### <a id="libc_getsockname_trampoline" href="#libc_getsockname_trampoline">func libc_getsockname_trampoline()</a>

```
searchKey: syscall.libc_getsockname_trampoline
tags: [private]
```

```Go
func libc_getsockname_trampoline()
```

### <a id="Shutdown" href="#Shutdown">func Shutdown(s int, how int) (err error)</a>

```
searchKey: syscall.Shutdown
```

```Go
func Shutdown(s int, how int) (err error)
```

### <a id="libc_shutdown_trampoline" href="#libc_shutdown_trampoline">func libc_shutdown_trampoline()</a>

```
searchKey: syscall.libc_shutdown_trampoline
tags: [private]
```

```Go
func libc_shutdown_trampoline()
```

### <a id="socketpair" href="#socketpair">func socketpair(domain int, typ int, proto int, fd *[2]int32) (err error)</a>

```
searchKey: syscall.socketpair
tags: [private]
```

```Go
func socketpair(domain int, typ int, proto int, fd *[2]int32) (err error)
```

### <a id="libc_socketpair_trampoline" href="#libc_socketpair_trampoline">func libc_socketpair_trampoline()</a>

```
searchKey: syscall.libc_socketpair_trampoline
tags: [private]
```

```Go
func libc_socketpair_trampoline()
```

### <a id="recvfrom" href="#recvfrom">func recvfrom(fd int, p []byte, flags int, from *RawSockaddrAny, fromlen *_Socklen) (n int, err error)</a>

```
searchKey: syscall.recvfrom
tags: [private]
```

```Go
func recvfrom(fd int, p []byte, flags int, from *RawSockaddrAny, fromlen *_Socklen) (n int, err error)
```

### <a id="libc_recvfrom_trampoline" href="#libc_recvfrom_trampoline">func libc_recvfrom_trampoline()</a>

```
searchKey: syscall.libc_recvfrom_trampoline
tags: [private]
```

```Go
func libc_recvfrom_trampoline()
```

### <a id="sendto" href="#sendto">func sendto(s int, buf []byte, flags int, to unsafe.Pointer, addrlen _Socklen) (err error)</a>

```
searchKey: syscall.sendto
tags: [private]
```

```Go
func sendto(s int, buf []byte, flags int, to unsafe.Pointer, addrlen _Socklen) (err error)
```

### <a id="libc_sendto_trampoline" href="#libc_sendto_trampoline">func libc_sendto_trampoline()</a>

```
searchKey: syscall.libc_sendto_trampoline
tags: [private]
```

```Go
func libc_sendto_trampoline()
```

### <a id="recvmsg" href="#recvmsg">func recvmsg(s int, msg *Msghdr, flags int) (n int, err error)</a>

```
searchKey: syscall.recvmsg
tags: [private]
```

```Go
func recvmsg(s int, msg *Msghdr, flags int) (n int, err error)
```

### <a id="libc_recvmsg_trampoline" href="#libc_recvmsg_trampoline">func libc_recvmsg_trampoline()</a>

```
searchKey: syscall.libc_recvmsg_trampoline
tags: [private]
```

```Go
func libc_recvmsg_trampoline()
```

### <a id="sendmsg" href="#sendmsg">func sendmsg(s int, msg *Msghdr, flags int) (n int, err error)</a>

```
searchKey: syscall.sendmsg
tags: [private]
```

```Go
func sendmsg(s int, msg *Msghdr, flags int) (n int, err error)
```

### <a id="libc_sendmsg_trampoline" href="#libc_sendmsg_trampoline">func libc_sendmsg_trampoline()</a>

```
searchKey: syscall.libc_sendmsg_trampoline
tags: [private]
```

```Go
func libc_sendmsg_trampoline()
```

### <a id="kevent" href="#kevent">func kevent(kq int, change unsafe.Pointer, nchange int, event unsafe.Pointer, nevent int, timeout *Timespec) (n int, err error)</a>

```
searchKey: syscall.kevent
tags: [private]
```

```Go
func kevent(kq int, change unsafe.Pointer, nchange int, event unsafe.Pointer, nevent int, timeout *Timespec) (n int, err error)
```

### <a id="libc_kevent_trampoline" href="#libc_kevent_trampoline">func libc_kevent_trampoline()</a>

```
searchKey: syscall.libc_kevent_trampoline
tags: [private]
```

```Go
func libc_kevent_trampoline()
```

### <a id="utimes" href="#utimes">func utimes(path string, timeval *[2]Timeval) (err error)</a>

```
searchKey: syscall.utimes
tags: [private]
```

```Go
func utimes(path string, timeval *[2]Timeval) (err error)
```

### <a id="libc_utimes_trampoline" href="#libc_utimes_trampoline">func libc_utimes_trampoline()</a>

```
searchKey: syscall.libc_utimes_trampoline
tags: [private]
```

```Go
func libc_utimes_trampoline()
```

### <a id="futimes" href="#futimes">func futimes(fd int, timeval *[2]Timeval) (err error)</a>

```
searchKey: syscall.futimes
tags: [private]
```

```Go
func futimes(fd int, timeval *[2]Timeval) (err error)
```

### <a id="libc_futimes_trampoline" href="#libc_futimes_trampoline">func libc_futimes_trampoline()</a>

```
searchKey: syscall.libc_futimes_trampoline
tags: [private]
```

```Go
func libc_futimes_trampoline()
```

### <a id="fcntl" href="#fcntl">func fcntl(fd int, cmd int, arg int) (val int, err error)</a>

```
searchKey: syscall.fcntl
tags: [private]
```

```Go
func fcntl(fd int, cmd int, arg int) (val int, err error)
```

### <a id="libc_fcntl_trampoline" href="#libc_fcntl_trampoline">func libc_fcntl_trampoline()</a>

```
searchKey: syscall.libc_fcntl_trampoline
tags: [private]
```

```Go
func libc_fcntl_trampoline()
```

### <a id="pipe" href="#pipe">func pipe(p *[2]int32) (err error)</a>

```
searchKey: syscall.pipe
tags: [private]
```

```Go
func pipe(p *[2]int32) (err error)
```

### <a id="libc_pipe_trampoline" href="#libc_pipe_trampoline">func libc_pipe_trampoline()</a>

```
searchKey: syscall.libc_pipe_trampoline
tags: [private]
```

```Go
func libc_pipe_trampoline()
```

### <a id="kill" href="#kill">func kill(pid int, signum int, posix int) (err error)</a>

```
searchKey: syscall.kill
tags: [private]
```

```Go
func kill(pid int, signum int, posix int) (err error)
```

### <a id="libc_kill_trampoline" href="#libc_kill_trampoline">func libc_kill_trampoline()</a>

```
searchKey: syscall.libc_kill_trampoline
tags: [private]
```

```Go
func libc_kill_trampoline()
```

### <a id="Access" href="#Access">func Access(path string, mode uint32) (err error)</a>

```
searchKey: syscall.Access
```

```Go
func Access(path string, mode uint32) (err error)
```

### <a id="libc_access_trampoline" href="#libc_access_trampoline">func libc_access_trampoline()</a>

```
searchKey: syscall.libc_access_trampoline
tags: [private]
```

```Go
func libc_access_trampoline()
```

### <a id="Adjtime" href="#Adjtime">func Adjtime(delta *Timeval, olddelta *Timeval) (err error)</a>

```
searchKey: syscall.Adjtime
```

```Go
func Adjtime(delta *Timeval, olddelta *Timeval) (err error)
```

### <a id="libc_adjtime_trampoline" href="#libc_adjtime_trampoline">func libc_adjtime_trampoline()</a>

```
searchKey: syscall.libc_adjtime_trampoline
tags: [private]
```

```Go
func libc_adjtime_trampoline()
```

### <a id="Chdir" href="#Chdir">func Chdir(path string) (err error)</a>

```
searchKey: syscall.Chdir
```

```Go
func Chdir(path string) (err error)
```

### <a id="libc_chdir_trampoline" href="#libc_chdir_trampoline">func libc_chdir_trampoline()</a>

```
searchKey: syscall.libc_chdir_trampoline
tags: [private]
```

```Go
func libc_chdir_trampoline()
```

### <a id="Chflags" href="#Chflags">func Chflags(path string, flags int) (err error)</a>

```
searchKey: syscall.Chflags
```

```Go
func Chflags(path string, flags int) (err error)
```

### <a id="libc_chflags_trampoline" href="#libc_chflags_trampoline">func libc_chflags_trampoline()</a>

```
searchKey: syscall.libc_chflags_trampoline
tags: [private]
```

```Go
func libc_chflags_trampoline()
```

### <a id="Chmod" href="#Chmod">func Chmod(path string, mode uint32) (err error)</a>

```
searchKey: syscall.Chmod
```

```Go
func Chmod(path string, mode uint32) (err error)
```

### <a id="libc_chmod_trampoline" href="#libc_chmod_trampoline">func libc_chmod_trampoline()</a>

```
searchKey: syscall.libc_chmod_trampoline
tags: [private]
```

```Go
func libc_chmod_trampoline()
```

### <a id="Chown" href="#Chown">func Chown(path string, uid int, gid int) (err error)</a>

```
searchKey: syscall.Chown
```

```Go
func Chown(path string, uid int, gid int) (err error)
```

### <a id="libc_chown_trampoline" href="#libc_chown_trampoline">func libc_chown_trampoline()</a>

```
searchKey: syscall.libc_chown_trampoline
tags: [private]
```

```Go
func libc_chown_trampoline()
```

### <a id="Chroot" href="#Chroot">func Chroot(path string) (err error)</a>

```
searchKey: syscall.Chroot
```

```Go
func Chroot(path string) (err error)
```

### <a id="libc_chroot_trampoline" href="#libc_chroot_trampoline">func libc_chroot_trampoline()</a>

```
searchKey: syscall.libc_chroot_trampoline
tags: [private]
```

```Go
func libc_chroot_trampoline()
```

### <a id="Close" href="#Close">func Close(fd int) (err error)</a>

```
searchKey: syscall.Close
```

```Go
func Close(fd int) (err error)
```

### <a id="libc_close_trampoline" href="#libc_close_trampoline">func libc_close_trampoline()</a>

```
searchKey: syscall.libc_close_trampoline
tags: [private]
```

```Go
func libc_close_trampoline()
```

### <a id="closedir" href="#closedir">func closedir(dir uintptr) (err error)</a>

```
searchKey: syscall.closedir
tags: [private]
```

```Go
func closedir(dir uintptr) (err error)
```

### <a id="libc_closedir_trampoline" href="#libc_closedir_trampoline">func libc_closedir_trampoline()</a>

```
searchKey: syscall.libc_closedir_trampoline
tags: [private]
```

```Go
func libc_closedir_trampoline()
```

### <a id="Dup" href="#Dup">func Dup(fd int) (nfd int, err error)</a>

```
searchKey: syscall.Dup
```

```Go
func Dup(fd int) (nfd int, err error)
```

### <a id="libc_dup_trampoline" href="#libc_dup_trampoline">func libc_dup_trampoline()</a>

```
searchKey: syscall.libc_dup_trampoline
tags: [private]
```

```Go
func libc_dup_trampoline()
```

### <a id="Dup2" href="#Dup2">func Dup2(from int, to int) (err error)</a>

```
searchKey: syscall.Dup2
```

```Go
func Dup2(from int, to int) (err error)
```

### <a id="libc_dup2_trampoline" href="#libc_dup2_trampoline">func libc_dup2_trampoline()</a>

```
searchKey: syscall.libc_dup2_trampoline
tags: [private]
```

```Go
func libc_dup2_trampoline()
```

### <a id="Exchangedata" href="#Exchangedata">func Exchangedata(path1 string, path2 string, options int) (err error)</a>

```
searchKey: syscall.Exchangedata
```

```Go
func Exchangedata(path1 string, path2 string, options int) (err error)
```

### <a id="libc_exchangedata_trampoline" href="#libc_exchangedata_trampoline">func libc_exchangedata_trampoline()</a>

```
searchKey: syscall.libc_exchangedata_trampoline
tags: [private]
```

```Go
func libc_exchangedata_trampoline()
```

### <a id="Fchdir" href="#Fchdir">func Fchdir(fd int) (err error)</a>

```
searchKey: syscall.Fchdir
```

```Go
func Fchdir(fd int) (err error)
```

### <a id="libc_fchdir_trampoline" href="#libc_fchdir_trampoline">func libc_fchdir_trampoline()</a>

```
searchKey: syscall.libc_fchdir_trampoline
tags: [private]
```

```Go
func libc_fchdir_trampoline()
```

### <a id="Fchflags" href="#Fchflags">func Fchflags(fd int, flags int) (err error)</a>

```
searchKey: syscall.Fchflags
```

```Go
func Fchflags(fd int, flags int) (err error)
```

### <a id="libc_fchflags_trampoline" href="#libc_fchflags_trampoline">func libc_fchflags_trampoline()</a>

```
searchKey: syscall.libc_fchflags_trampoline
tags: [private]
```

```Go
func libc_fchflags_trampoline()
```

### <a id="Fchmod" href="#Fchmod">func Fchmod(fd int, mode uint32) (err error)</a>

```
searchKey: syscall.Fchmod
```

```Go
func Fchmod(fd int, mode uint32) (err error)
```

### <a id="libc_fchmod_trampoline" href="#libc_fchmod_trampoline">func libc_fchmod_trampoline()</a>

```
searchKey: syscall.libc_fchmod_trampoline
tags: [private]
```

```Go
func libc_fchmod_trampoline()
```

### <a id="Fchown" href="#Fchown">func Fchown(fd int, uid int, gid int) (err error)</a>

```
searchKey: syscall.Fchown
```

```Go
func Fchown(fd int, uid int, gid int) (err error)
```

### <a id="libc_fchown_trampoline" href="#libc_fchown_trampoline">func libc_fchown_trampoline()</a>

```
searchKey: syscall.libc_fchown_trampoline
tags: [private]
```

```Go
func libc_fchown_trampoline()
```

### <a id="Flock" href="#Flock">func Flock(fd int, how int) (err error)</a>

```
searchKey: syscall.Flock
```

```Go
func Flock(fd int, how int) (err error)
```

### <a id="libc_flock_trampoline" href="#libc_flock_trampoline">func libc_flock_trampoline()</a>

```
searchKey: syscall.libc_flock_trampoline
tags: [private]
```

```Go
func libc_flock_trampoline()
```

### <a id="Fpathconf" href="#Fpathconf">func Fpathconf(fd int, name int) (val int, err error)</a>

```
searchKey: syscall.Fpathconf
```

```Go
func Fpathconf(fd int, name int) (val int, err error)
```

### <a id="libc_fpathconf_trampoline" href="#libc_fpathconf_trampoline">func libc_fpathconf_trampoline()</a>

```
searchKey: syscall.libc_fpathconf_trampoline
tags: [private]
```

```Go
func libc_fpathconf_trampoline()
```

### <a id="Fsync" href="#Fsync">func Fsync(fd int) (err error)</a>

```
searchKey: syscall.Fsync
```

```Go
func Fsync(fd int) (err error)
```

### <a id="libc_fsync_trampoline" href="#libc_fsync_trampoline">func libc_fsync_trampoline()</a>

```
searchKey: syscall.libc_fsync_trampoline
tags: [private]
```

```Go
func libc_fsync_trampoline()
```

### <a id="Ftruncate" href="#Ftruncate">func Ftruncate(fd int, length int64) (err error)</a>

```
searchKey: syscall.Ftruncate
```

```Go
func Ftruncate(fd int, length int64) (err error)
```

### <a id="libc_ftruncate_trampoline" href="#libc_ftruncate_trampoline">func libc_ftruncate_trampoline()</a>

```
searchKey: syscall.libc_ftruncate_trampoline
tags: [private]
```

```Go
func libc_ftruncate_trampoline()
```

### <a id="Getdtablesize" href="#Getdtablesize">func Getdtablesize() (size int)</a>

```
searchKey: syscall.Getdtablesize
```

```Go
func Getdtablesize() (size int)
```

### <a id="libc_getdtablesize_trampoline" href="#libc_getdtablesize_trampoline">func libc_getdtablesize_trampoline()</a>

```
searchKey: syscall.libc_getdtablesize_trampoline
tags: [private]
```

```Go
func libc_getdtablesize_trampoline()
```

### <a id="Getegid" href="#Getegid">func Getegid() (egid int)</a>

```
searchKey: syscall.Getegid
```

```Go
func Getegid() (egid int)
```

### <a id="libc_getegid_trampoline" href="#libc_getegid_trampoline">func libc_getegid_trampoline()</a>

```
searchKey: syscall.libc_getegid_trampoline
tags: [private]
```

```Go
func libc_getegid_trampoline()
```

### <a id="Geteuid" href="#Geteuid">func Geteuid() (uid int)</a>

```
searchKey: syscall.Geteuid
```

```Go
func Geteuid() (uid int)
```

### <a id="libc_geteuid_trampoline" href="#libc_geteuid_trampoline">func libc_geteuid_trampoline()</a>

```
searchKey: syscall.libc_geteuid_trampoline
tags: [private]
```

```Go
func libc_geteuid_trampoline()
```

### <a id="Getgid" href="#Getgid">func Getgid() (gid int)</a>

```
searchKey: syscall.Getgid
```

```Go
func Getgid() (gid int)
```

### <a id="libc_getgid_trampoline" href="#libc_getgid_trampoline">func libc_getgid_trampoline()</a>

```
searchKey: syscall.libc_getgid_trampoline
tags: [private]
```

```Go
func libc_getgid_trampoline()
```

### <a id="Getpgid" href="#Getpgid">func Getpgid(pid int) (pgid int, err error)</a>

```
searchKey: syscall.Getpgid
```

```Go
func Getpgid(pid int) (pgid int, err error)
```

### <a id="libc_getpgid_trampoline" href="#libc_getpgid_trampoline">func libc_getpgid_trampoline()</a>

```
searchKey: syscall.libc_getpgid_trampoline
tags: [private]
```

```Go
func libc_getpgid_trampoline()
```

### <a id="Getpgrp" href="#Getpgrp">func Getpgrp() (pgrp int)</a>

```
searchKey: syscall.Getpgrp
```

```Go
func Getpgrp() (pgrp int)
```

### <a id="libc_getpgrp_trampoline" href="#libc_getpgrp_trampoline">func libc_getpgrp_trampoline()</a>

```
searchKey: syscall.libc_getpgrp_trampoline
tags: [private]
```

```Go
func libc_getpgrp_trampoline()
```

### <a id="Getpid" href="#Getpid">func Getpid() (pid int)</a>

```
searchKey: syscall.Getpid
```

```Go
func Getpid() (pid int)
```

### <a id="libc_getpid_trampoline" href="#libc_getpid_trampoline">func libc_getpid_trampoline()</a>

```
searchKey: syscall.libc_getpid_trampoline
tags: [private]
```

```Go
func libc_getpid_trampoline()
```

### <a id="Getppid" href="#Getppid">func Getppid() (ppid int)</a>

```
searchKey: syscall.Getppid
```

```Go
func Getppid() (ppid int)
```

### <a id="libc_getppid_trampoline" href="#libc_getppid_trampoline">func libc_getppid_trampoline()</a>

```
searchKey: syscall.libc_getppid_trampoline
tags: [private]
```

```Go
func libc_getppid_trampoline()
```

### <a id="Getpriority" href="#Getpriority">func Getpriority(which int, who int) (prio int, err error)</a>

```
searchKey: syscall.Getpriority
```

```Go
func Getpriority(which int, who int) (prio int, err error)
```

### <a id="libc_getpriority_trampoline" href="#libc_getpriority_trampoline">func libc_getpriority_trampoline()</a>

```
searchKey: syscall.libc_getpriority_trampoline
tags: [private]
```

```Go
func libc_getpriority_trampoline()
```

### <a id="Getrlimit" href="#Getrlimit">func Getrlimit(which int, lim *Rlimit) (err error)</a>

```
searchKey: syscall.Getrlimit
```

```Go
func Getrlimit(which int, lim *Rlimit) (err error)
```

### <a id="libc_getrlimit_trampoline" href="#libc_getrlimit_trampoline">func libc_getrlimit_trampoline()</a>

```
searchKey: syscall.libc_getrlimit_trampoline
tags: [private]
```

```Go
func libc_getrlimit_trampoline()
```

### <a id="Getrusage" href="#Getrusage">func Getrusage(who int, rusage *Rusage) (err error)</a>

```
searchKey: syscall.Getrusage
```

```Go
func Getrusage(who int, rusage *Rusage) (err error)
```

### <a id="libc_getrusage_trampoline" href="#libc_getrusage_trampoline">func libc_getrusage_trampoline()</a>

```
searchKey: syscall.libc_getrusage_trampoline
tags: [private]
```

```Go
func libc_getrusage_trampoline()
```

### <a id="Getsid" href="#Getsid">func Getsid(pid int) (sid int, err error)</a>

```
searchKey: syscall.Getsid
```

```Go
func Getsid(pid int) (sid int, err error)
```

### <a id="libc_getsid_trampoline" href="#libc_getsid_trampoline">func libc_getsid_trampoline()</a>

```
searchKey: syscall.libc_getsid_trampoline
tags: [private]
```

```Go
func libc_getsid_trampoline()
```

### <a id="Getuid" href="#Getuid">func Getuid() (uid int)</a>

```
searchKey: syscall.Getuid
```

```Go
func Getuid() (uid int)
```

### <a id="libc_getuid_trampoline" href="#libc_getuid_trampoline">func libc_getuid_trampoline()</a>

```
searchKey: syscall.libc_getuid_trampoline
tags: [private]
```

```Go
func libc_getuid_trampoline()
```

### <a id="Issetugid" href="#Issetugid">func Issetugid() (tainted bool)</a>

```
searchKey: syscall.Issetugid
```

```Go
func Issetugid() (tainted bool)
```

### <a id="libc_issetugid_trampoline" href="#libc_issetugid_trampoline">func libc_issetugid_trampoline()</a>

```
searchKey: syscall.libc_issetugid_trampoline
tags: [private]
```

```Go
func libc_issetugid_trampoline()
```

### <a id="Kqueue" href="#Kqueue">func Kqueue() (fd int, err error)</a>

```
searchKey: syscall.Kqueue
```

```Go
func Kqueue() (fd int, err error)
```

### <a id="libc_kqueue_trampoline" href="#libc_kqueue_trampoline">func libc_kqueue_trampoline()</a>

```
searchKey: syscall.libc_kqueue_trampoline
tags: [private]
```

```Go
func libc_kqueue_trampoline()
```

### <a id="Lchown" href="#Lchown">func Lchown(path string, uid int, gid int) (err error)</a>

```
searchKey: syscall.Lchown
```

```Go
func Lchown(path string, uid int, gid int) (err error)
```

### <a id="libc_lchown_trampoline" href="#libc_lchown_trampoline">func libc_lchown_trampoline()</a>

```
searchKey: syscall.libc_lchown_trampoline
tags: [private]
```

```Go
func libc_lchown_trampoline()
```

### <a id="Link" href="#Link">func Link(path string, link string) (err error)</a>

```
searchKey: syscall.Link
```

```Go
func Link(path string, link string) (err error)
```

### <a id="libc_link_trampoline" href="#libc_link_trampoline">func libc_link_trampoline()</a>

```
searchKey: syscall.libc_link_trampoline
tags: [private]
```

```Go
func libc_link_trampoline()
```

### <a id="Listen" href="#Listen">func Listen(s int, backlog int) (err error)</a>

```
searchKey: syscall.Listen
```

```Go
func Listen(s int, backlog int) (err error)
```

### <a id="libc_listen_trampoline" href="#libc_listen_trampoline">func libc_listen_trampoline()</a>

```
searchKey: syscall.libc_listen_trampoline
tags: [private]
```

```Go
func libc_listen_trampoline()
```

### <a id="Mkdir" href="#Mkdir">func Mkdir(path string, mode uint32) (err error)</a>

```
searchKey: syscall.Mkdir
```

```Go
func Mkdir(path string, mode uint32) (err error)
```

### <a id="libc_mkdir_trampoline" href="#libc_mkdir_trampoline">func libc_mkdir_trampoline()</a>

```
searchKey: syscall.libc_mkdir_trampoline
tags: [private]
```

```Go
func libc_mkdir_trampoline()
```

### <a id="Mkfifo" href="#Mkfifo">func Mkfifo(path string, mode uint32) (err error)</a>

```
searchKey: syscall.Mkfifo
```

```Go
func Mkfifo(path string, mode uint32) (err error)
```

### <a id="libc_mkfifo_trampoline" href="#libc_mkfifo_trampoline">func libc_mkfifo_trampoline()</a>

```
searchKey: syscall.libc_mkfifo_trampoline
tags: [private]
```

```Go
func libc_mkfifo_trampoline()
```

### <a id="Mknod" href="#Mknod">func Mknod(path string, mode uint32, dev int) (err error)</a>

```
searchKey: syscall.Mknod
```

```Go
func Mknod(path string, mode uint32, dev int) (err error)
```

### <a id="libc_mknod_trampoline" href="#libc_mknod_trampoline">func libc_mknod_trampoline()</a>

```
searchKey: syscall.libc_mknod_trampoline
tags: [private]
```

```Go
func libc_mknod_trampoline()
```

### <a id="Mlock" href="#Mlock">func Mlock(b []byte) (err error)</a>

```
searchKey: syscall.Mlock
```

```Go
func Mlock(b []byte) (err error)
```

### <a id="libc_mlock_trampoline" href="#libc_mlock_trampoline">func libc_mlock_trampoline()</a>

```
searchKey: syscall.libc_mlock_trampoline
tags: [private]
```

```Go
func libc_mlock_trampoline()
```

### <a id="Mlockall" href="#Mlockall">func Mlockall(flags int) (err error)</a>

```
searchKey: syscall.Mlockall
```

```Go
func Mlockall(flags int) (err error)
```

### <a id="libc_mlockall_trampoline" href="#libc_mlockall_trampoline">func libc_mlockall_trampoline()</a>

```
searchKey: syscall.libc_mlockall_trampoline
tags: [private]
```

```Go
func libc_mlockall_trampoline()
```

### <a id="Mprotect" href="#Mprotect">func Mprotect(b []byte, prot int) (err error)</a>

```
searchKey: syscall.Mprotect
```

```Go
func Mprotect(b []byte, prot int) (err error)
```

### <a id="libc_mprotect_trampoline" href="#libc_mprotect_trampoline">func libc_mprotect_trampoline()</a>

```
searchKey: syscall.libc_mprotect_trampoline
tags: [private]
```

```Go
func libc_mprotect_trampoline()
```

### <a id="Munlock" href="#Munlock">func Munlock(b []byte) (err error)</a>

```
searchKey: syscall.Munlock
```

```Go
func Munlock(b []byte) (err error)
```

### <a id="libc_munlock_trampoline" href="#libc_munlock_trampoline">func libc_munlock_trampoline()</a>

```
searchKey: syscall.libc_munlock_trampoline
tags: [private]
```

```Go
func libc_munlock_trampoline()
```

### <a id="Munlockall" href="#Munlockall">func Munlockall() (err error)</a>

```
searchKey: syscall.Munlockall
```

```Go
func Munlockall() (err error)
```

### <a id="libc_munlockall_trampoline" href="#libc_munlockall_trampoline">func libc_munlockall_trampoline()</a>

```
searchKey: syscall.libc_munlockall_trampoline
tags: [private]
```

```Go
func libc_munlockall_trampoline()
```

### <a id="Open" href="#Open">func Open(path string, mode int, perm uint32) (fd int, err error)</a>

```
searchKey: syscall.Open
```

```Go
func Open(path string, mode int, perm uint32) (fd int, err error)
```

### <a id="libc_open_trampoline" href="#libc_open_trampoline">func libc_open_trampoline()</a>

```
searchKey: syscall.libc_open_trampoline
tags: [private]
```

```Go
func libc_open_trampoline()
```

### <a id="Pathconf" href="#Pathconf">func Pathconf(path string, name int) (val int, err error)</a>

```
searchKey: syscall.Pathconf
```

```Go
func Pathconf(path string, name int) (val int, err error)
```

### <a id="libc_pathconf_trampoline" href="#libc_pathconf_trampoline">func libc_pathconf_trampoline()</a>

```
searchKey: syscall.libc_pathconf_trampoline
tags: [private]
```

```Go
func libc_pathconf_trampoline()
```

### <a id="Pread" href="#Pread">func Pread(fd int, p []byte, offset int64) (n int, err error)</a>

```
searchKey: syscall.Pread
```

```Go
func Pread(fd int, p []byte, offset int64) (n int, err error)
```

### <a id="libc_pread_trampoline" href="#libc_pread_trampoline">func libc_pread_trampoline()</a>

```
searchKey: syscall.libc_pread_trampoline
tags: [private]
```

```Go
func libc_pread_trampoline()
```

### <a id="Pwrite" href="#Pwrite">func Pwrite(fd int, p []byte, offset int64) (n int, err error)</a>

```
searchKey: syscall.Pwrite
```

```Go
func Pwrite(fd int, p []byte, offset int64) (n int, err error)
```

### <a id="libc_pwrite_trampoline" href="#libc_pwrite_trampoline">func libc_pwrite_trampoline()</a>

```
searchKey: syscall.libc_pwrite_trampoline
tags: [private]
```

```Go
func libc_pwrite_trampoline()
```

### <a id="read" href="#read">func read(fd int, p []byte) (n int, err error)</a>

```
searchKey: syscall.read
tags: [private]
```

```Go
func read(fd int, p []byte) (n int, err error)
```

### <a id="libc_read_trampoline" href="#libc_read_trampoline">func libc_read_trampoline()</a>

```
searchKey: syscall.libc_read_trampoline
tags: [private]
```

```Go
func libc_read_trampoline()
```

### <a id="libc_readdir_r_trampoline" href="#libc_readdir_r_trampoline">func libc_readdir_r_trampoline()</a>

```
searchKey: syscall.libc_readdir_r_trampoline
tags: [private]
```

```Go
func libc_readdir_r_trampoline()
```

### <a id="Readlink" href="#Readlink">func Readlink(path string, buf []byte) (n int, err error)</a>

```
searchKey: syscall.Readlink
```

```Go
func Readlink(path string, buf []byte) (n int, err error)
```

### <a id="libc_readlink_trampoline" href="#libc_readlink_trampoline">func libc_readlink_trampoline()</a>

```
searchKey: syscall.libc_readlink_trampoline
tags: [private]
```

```Go
func libc_readlink_trampoline()
```

### <a id="Rename" href="#Rename">func Rename(from string, to string) (err error)</a>

```
searchKey: syscall.Rename
```

```Go
func Rename(from string, to string) (err error)
```

### <a id="libc_rename_trampoline" href="#libc_rename_trampoline">func libc_rename_trampoline()</a>

```
searchKey: syscall.libc_rename_trampoline
tags: [private]
```

```Go
func libc_rename_trampoline()
```

### <a id="Revoke" href="#Revoke">func Revoke(path string) (err error)</a>

```
searchKey: syscall.Revoke
```

```Go
func Revoke(path string) (err error)
```

### <a id="libc_revoke_trampoline" href="#libc_revoke_trampoline">func libc_revoke_trampoline()</a>

```
searchKey: syscall.libc_revoke_trampoline
tags: [private]
```

```Go
func libc_revoke_trampoline()
```

### <a id="Rmdir" href="#Rmdir">func Rmdir(path string) (err error)</a>

```
searchKey: syscall.Rmdir
```

```Go
func Rmdir(path string) (err error)
```

### <a id="libc_rmdir_trampoline" href="#libc_rmdir_trampoline">func libc_rmdir_trampoline()</a>

```
searchKey: syscall.libc_rmdir_trampoline
tags: [private]
```

```Go
func libc_rmdir_trampoline()
```

### <a id="Seek" href="#Seek">func Seek(fd int, offset int64, whence int) (newoffset int64, err error)</a>

```
searchKey: syscall.Seek
```

```Go
func Seek(fd int, offset int64, whence int) (newoffset int64, err error)
```

### <a id="libc_lseek_trampoline" href="#libc_lseek_trampoline">func libc_lseek_trampoline()</a>

```
searchKey: syscall.libc_lseek_trampoline
tags: [private]
```

```Go
func libc_lseek_trampoline()
```

### <a id="Select" href="#Select">func Select(n int, r *FdSet, w *FdSet, e *FdSet, timeout *Timeval) (err error)</a>

```
searchKey: syscall.Select
```

```Go
func Select(n int, r *FdSet, w *FdSet, e *FdSet, timeout *Timeval) (err error)
```

### <a id="libc_select_trampoline" href="#libc_select_trampoline">func libc_select_trampoline()</a>

```
searchKey: syscall.libc_select_trampoline
tags: [private]
```

```Go
func libc_select_trampoline()
```

### <a id="Setegid" href="#Setegid">func Setegid(egid int) (err error)</a>

```
searchKey: syscall.Setegid
```

```Go
func Setegid(egid int) (err error)
```

### <a id="libc_setegid_trampoline" href="#libc_setegid_trampoline">func libc_setegid_trampoline()</a>

```
searchKey: syscall.libc_setegid_trampoline
tags: [private]
```

```Go
func libc_setegid_trampoline()
```

### <a id="Seteuid" href="#Seteuid">func Seteuid(euid int) (err error)</a>

```
searchKey: syscall.Seteuid
```

```Go
func Seteuid(euid int) (err error)
```

### <a id="libc_seteuid_trampoline" href="#libc_seteuid_trampoline">func libc_seteuid_trampoline()</a>

```
searchKey: syscall.libc_seteuid_trampoline
tags: [private]
```

```Go
func libc_seteuid_trampoline()
```

### <a id="Setgid" href="#Setgid">func Setgid(gid int) (err error)</a>

```
searchKey: syscall.Setgid
```

```Go
func Setgid(gid int) (err error)
```

### <a id="libc_setgid_trampoline" href="#libc_setgid_trampoline">func libc_setgid_trampoline()</a>

```
searchKey: syscall.libc_setgid_trampoline
tags: [private]
```

```Go
func libc_setgid_trampoline()
```

### <a id="Setlogin" href="#Setlogin">func Setlogin(name string) (err error)</a>

```
searchKey: syscall.Setlogin
```

```Go
func Setlogin(name string) (err error)
```

### <a id="libc_setlogin_trampoline" href="#libc_setlogin_trampoline">func libc_setlogin_trampoline()</a>

```
searchKey: syscall.libc_setlogin_trampoline
tags: [private]
```

```Go
func libc_setlogin_trampoline()
```

### <a id="Setpgid" href="#Setpgid">func Setpgid(pid int, pgid int) (err error)</a>

```
searchKey: syscall.Setpgid
```

```Go
func Setpgid(pid int, pgid int) (err error)
```

### <a id="libc_setpgid_trampoline" href="#libc_setpgid_trampoline">func libc_setpgid_trampoline()</a>

```
searchKey: syscall.libc_setpgid_trampoline
tags: [private]
```

```Go
func libc_setpgid_trampoline()
```

### <a id="Setpriority" href="#Setpriority">func Setpriority(which int, who int, prio int) (err error)</a>

```
searchKey: syscall.Setpriority
```

```Go
func Setpriority(which int, who int, prio int) (err error)
```

### <a id="libc_setpriority_trampoline" href="#libc_setpriority_trampoline">func libc_setpriority_trampoline()</a>

```
searchKey: syscall.libc_setpriority_trampoline
tags: [private]
```

```Go
func libc_setpriority_trampoline()
```

### <a id="Setprivexec" href="#Setprivexec">func Setprivexec(flag int) (err error)</a>

```
searchKey: syscall.Setprivexec
```

```Go
func Setprivexec(flag int) (err error)
```

### <a id="libc_setprivexec_trampoline" href="#libc_setprivexec_trampoline">func libc_setprivexec_trampoline()</a>

```
searchKey: syscall.libc_setprivexec_trampoline
tags: [private]
```

```Go
func libc_setprivexec_trampoline()
```

### <a id="Setregid" href="#Setregid">func Setregid(rgid int, egid int) (err error)</a>

```
searchKey: syscall.Setregid
```

```Go
func Setregid(rgid int, egid int) (err error)
```

### <a id="libc_setregid_trampoline" href="#libc_setregid_trampoline">func libc_setregid_trampoline()</a>

```
searchKey: syscall.libc_setregid_trampoline
tags: [private]
```

```Go
func libc_setregid_trampoline()
```

### <a id="Setreuid" href="#Setreuid">func Setreuid(ruid int, euid int) (err error)</a>

```
searchKey: syscall.Setreuid
```

```Go
func Setreuid(ruid int, euid int) (err error)
```

### <a id="libc_setreuid_trampoline" href="#libc_setreuid_trampoline">func libc_setreuid_trampoline()</a>

```
searchKey: syscall.libc_setreuid_trampoline
tags: [private]
```

```Go
func libc_setreuid_trampoline()
```

### <a id="Setrlimit" href="#Setrlimit">func Setrlimit(which int, lim *Rlimit) (err error)</a>

```
searchKey: syscall.Setrlimit
```

```Go
func Setrlimit(which int, lim *Rlimit) (err error)
```

### <a id="libc_setrlimit_trampoline" href="#libc_setrlimit_trampoline">func libc_setrlimit_trampoline()</a>

```
searchKey: syscall.libc_setrlimit_trampoline
tags: [private]
```

```Go
func libc_setrlimit_trampoline()
```

### <a id="Setsid" href="#Setsid">func Setsid() (pid int, err error)</a>

```
searchKey: syscall.Setsid
```

```Go
func Setsid() (pid int, err error)
```

### <a id="libc_setsid_trampoline" href="#libc_setsid_trampoline">func libc_setsid_trampoline()</a>

```
searchKey: syscall.libc_setsid_trampoline
tags: [private]
```

```Go
func libc_setsid_trampoline()
```

### <a id="Settimeofday" href="#Settimeofday">func Settimeofday(tp *Timeval) (err error)</a>

```
searchKey: syscall.Settimeofday
```

```Go
func Settimeofday(tp *Timeval) (err error)
```

### <a id="libc_settimeofday_trampoline" href="#libc_settimeofday_trampoline">func libc_settimeofday_trampoline()</a>

```
searchKey: syscall.libc_settimeofday_trampoline
tags: [private]
```

```Go
func libc_settimeofday_trampoline()
```

### <a id="Setuid" href="#Setuid">func Setuid(uid int) (err error)</a>

```
searchKey: syscall.Setuid
```

```Go
func Setuid(uid int) (err error)
```

### <a id="libc_setuid_trampoline" href="#libc_setuid_trampoline">func libc_setuid_trampoline()</a>

```
searchKey: syscall.libc_setuid_trampoline
tags: [private]
```

```Go
func libc_setuid_trampoline()
```

### <a id="Symlink" href="#Symlink">func Symlink(path string, link string) (err error)</a>

```
searchKey: syscall.Symlink
```

```Go
func Symlink(path string, link string) (err error)
```

### <a id="libc_symlink_trampoline" href="#libc_symlink_trampoline">func libc_symlink_trampoline()</a>

```
searchKey: syscall.libc_symlink_trampoline
tags: [private]
```

```Go
func libc_symlink_trampoline()
```

### <a id="Sync" href="#Sync">func Sync() (err error)</a>

```
searchKey: syscall.Sync
```

```Go
func Sync() (err error)
```

### <a id="libc_sync_trampoline" href="#libc_sync_trampoline">func libc_sync_trampoline()</a>

```
searchKey: syscall.libc_sync_trampoline
tags: [private]
```

```Go
func libc_sync_trampoline()
```

### <a id="Truncate" href="#Truncate">func Truncate(path string, length int64) (err error)</a>

```
searchKey: syscall.Truncate
```

```Go
func Truncate(path string, length int64) (err error)
```

### <a id="libc_truncate_trampoline" href="#libc_truncate_trampoline">func libc_truncate_trampoline()</a>

```
searchKey: syscall.libc_truncate_trampoline
tags: [private]
```

```Go
func libc_truncate_trampoline()
```

### <a id="Umask" href="#Umask">func Umask(newmask int) (oldmask int)</a>

```
searchKey: syscall.Umask
```

```Go
func Umask(newmask int) (oldmask int)
```

### <a id="libc_umask_trampoline" href="#libc_umask_trampoline">func libc_umask_trampoline()</a>

```
searchKey: syscall.libc_umask_trampoline
tags: [private]
```

```Go
func libc_umask_trampoline()
```

### <a id="Undelete" href="#Undelete">func Undelete(path string) (err error)</a>

```
searchKey: syscall.Undelete
```

```Go
func Undelete(path string) (err error)
```

### <a id="libc_undelete_trampoline" href="#libc_undelete_trampoline">func libc_undelete_trampoline()</a>

```
searchKey: syscall.libc_undelete_trampoline
tags: [private]
```

```Go
func libc_undelete_trampoline()
```

### <a id="Unlink" href="#Unlink">func Unlink(path string) (err error)</a>

```
searchKey: syscall.Unlink
```

```Go
func Unlink(path string) (err error)
```

### <a id="libc_unlink_trampoline" href="#libc_unlink_trampoline">func libc_unlink_trampoline()</a>

```
searchKey: syscall.libc_unlink_trampoline
tags: [private]
```

```Go
func libc_unlink_trampoline()
```

### <a id="Unmount" href="#Unmount">func Unmount(path string, flags int) (err error)</a>

```
searchKey: syscall.Unmount
```

```Go
func Unmount(path string, flags int) (err error)
```

### <a id="libc_unmount_trampoline" href="#libc_unmount_trampoline">func libc_unmount_trampoline()</a>

```
searchKey: syscall.libc_unmount_trampoline
tags: [private]
```

```Go
func libc_unmount_trampoline()
```

### <a id="write" href="#write">func write(fd int, p []byte) (n int, err error)</a>

```
searchKey: syscall.write
tags: [private]
```

```Go
func write(fd int, p []byte) (n int, err error)
```

### <a id="libc_write_trampoline" href="#libc_write_trampoline">func libc_write_trampoline()</a>

```
searchKey: syscall.libc_write_trampoline
tags: [private]
```

```Go
func libc_write_trampoline()
```

### <a id="writev" href="#writev">func writev(fd int, iovecs []Iovec) (cnt uintptr, err error)</a>

```
searchKey: syscall.writev
tags: [private]
```

```Go
func writev(fd int, iovecs []Iovec) (cnt uintptr, err error)
```

### <a id="libc_writev_trampoline" href="#libc_writev_trampoline">func libc_writev_trampoline()</a>

```
searchKey: syscall.libc_writev_trampoline
tags: [private]
```

```Go
func libc_writev_trampoline()
```

### <a id="mmap" href="#mmap">func mmap(addr uintptr, length uintptr, prot int, flag int, fd int, pos int64) (ret uintptr, err error)</a>

```
searchKey: syscall.mmap
tags: [private]
```

```Go
func mmap(addr uintptr, length uintptr, prot int, flag int, fd int, pos int64) (ret uintptr, err error)
```

### <a id="libc_mmap_trampoline" href="#libc_mmap_trampoline">func libc_mmap_trampoline()</a>

```
searchKey: syscall.libc_mmap_trampoline
tags: [private]
```

```Go
func libc_mmap_trampoline()
```

### <a id="munmap" href="#munmap">func munmap(addr uintptr, length uintptr) (err error)</a>

```
searchKey: syscall.munmap
tags: [private]
```

```Go
func munmap(addr uintptr, length uintptr) (err error)
```

### <a id="libc_munmap_trampoline" href="#libc_munmap_trampoline">func libc_munmap_trampoline()</a>

```
searchKey: syscall.libc_munmap_trampoline
tags: [private]
```

```Go
func libc_munmap_trampoline()
```

### <a id="fork" href="#fork">func fork() (pid int, err error)</a>

```
searchKey: syscall.fork
tags: [private]
```

```Go
func fork() (pid int, err error)
```

### <a id="libc_fork_trampoline" href="#libc_fork_trampoline">func libc_fork_trampoline()</a>

```
searchKey: syscall.libc_fork_trampoline
tags: [private]
```

```Go
func libc_fork_trampoline()
```

### <a id="ioctl" href="#ioctl">func ioctl(fd int, req int, arg int) (err error)</a>

```
searchKey: syscall.ioctl
tags: [private]
```

```Go
func ioctl(fd int, req int, arg int) (err error)
```

### <a id="libc_ioctl_trampoline" href="#libc_ioctl_trampoline">func libc_ioctl_trampoline()</a>

```
searchKey: syscall.libc_ioctl_trampoline
tags: [private]
```

```Go
func libc_ioctl_trampoline()
```

### <a id="ioctlPtr" href="#ioctlPtr">func ioctlPtr(fd int, req uint, arg unsafe.Pointer) (err error)</a>

```
searchKey: syscall.ioctlPtr
tags: [private]
```

```Go
func ioctlPtr(fd int, req uint, arg unsafe.Pointer) (err error)
```

### <a id="execve" href="#execve">func execve(path *byte, argv **byte, envp **byte) (err error)</a>

```
searchKey: syscall.execve
tags: [private]
```

```Go
func execve(path *byte, argv **byte, envp **byte) (err error)
```

### <a id="libc_execve_trampoline" href="#libc_execve_trampoline">func libc_execve_trampoline()</a>

```
searchKey: syscall.libc_execve_trampoline
tags: [private]
```

```Go
func libc_execve_trampoline()
```

### <a id="exit" href="#exit">func exit(res int) (err error)</a>

```
searchKey: syscall.exit
tags: [private]
```

```Go
func exit(res int) (err error)
```

### <a id="libc_exit_trampoline" href="#libc_exit_trampoline">func libc_exit_trampoline()</a>

```
searchKey: syscall.libc_exit_trampoline
tags: [private]
```

```Go
func libc_exit_trampoline()
```

### <a id="sysctl" href="#sysctl">func sysctl(mib []_C_int, old *byte, oldlen *uintptr, new *byte, newlen uintptr) (err error)</a>

```
searchKey: syscall.sysctl
tags: [private]
```

```Go
func sysctl(mib []_C_int, old *byte, oldlen *uintptr, new *byte, newlen uintptr) (err error)
```

### <a id="libc_sysctl_trampoline" href="#libc_sysctl_trampoline">func libc_sysctl_trampoline()</a>

```
searchKey: syscall.libc_sysctl_trampoline
tags: [private]
```

```Go
func libc_sysctl_trampoline()
```

### <a id="fcntlPtr" href="#fcntlPtr">func fcntlPtr(fd int, cmd int, arg unsafe.Pointer) (val int, err error)</a>

```
searchKey: syscall.fcntlPtr
tags: [private]
```

```Go
func fcntlPtr(fd int, cmd int, arg unsafe.Pointer) (val int, err error)
```

### <a id="unlinkat" href="#unlinkat">func unlinkat(fd int, path string, flags int) (err error)</a>

```
searchKey: syscall.unlinkat
tags: [private]
```

```Go
func unlinkat(fd int, path string, flags int) (err error)
```

### <a id="libc_unlinkat_trampoline" href="#libc_unlinkat_trampoline">func libc_unlinkat_trampoline()</a>

```
searchKey: syscall.libc_unlinkat_trampoline
tags: [private]
```

```Go
func libc_unlinkat_trampoline()
```

### <a id="openat" href="#openat">func openat(fd int, path string, flags int, perm uint32) (fdret int, err error)</a>

```
searchKey: syscall.openat
tags: [private]
```

```Go
func openat(fd int, path string, flags int, perm uint32) (fdret int, err error)
```

### <a id="libc_openat_trampoline" href="#libc_openat_trampoline">func libc_openat_trampoline()</a>

```
searchKey: syscall.libc_openat_trampoline
tags: [private]
```

```Go
func libc_openat_trampoline()
```

### <a id="getcwd" href="#getcwd">func getcwd(buf []byte) (n int, err error)</a>

```
searchKey: syscall.getcwd
tags: [private]
```

```Go
func getcwd(buf []byte) (n int, err error)
```

### <a id="libc_getcwd_trampoline" href="#libc_getcwd_trampoline">func libc_getcwd_trampoline()</a>

```
searchKey: syscall.libc_getcwd_trampoline
tags: [private]
```

```Go
func libc_getcwd_trampoline()
```

### <a id="Fstat" href="#Fstat">func Fstat(fd int, stat *Stat_t) (err error)</a>

```
searchKey: syscall.Fstat
```

```Go
func Fstat(fd int, stat *Stat_t) (err error)
```

### <a id="libc_fstat64_trampoline" href="#libc_fstat64_trampoline">func libc_fstat64_trampoline()</a>

```
searchKey: syscall.libc_fstat64_trampoline
tags: [private]
```

```Go
func libc_fstat64_trampoline()
```

### <a id="Fstatfs" href="#Fstatfs">func Fstatfs(fd int, stat *Statfs_t) (err error)</a>

```
searchKey: syscall.Fstatfs
```

```Go
func Fstatfs(fd int, stat *Statfs_t) (err error)
```

### <a id="libc_fstatfs64_trampoline" href="#libc_fstatfs64_trampoline">func libc_fstatfs64_trampoline()</a>

```
searchKey: syscall.libc_fstatfs64_trampoline
tags: [private]
```

```Go
func libc_fstatfs64_trampoline()
```

### <a id="Gettimeofday" href="#Gettimeofday">func Gettimeofday(tp *Timeval) (err error)</a>

```
searchKey: syscall.Gettimeofday
```

```Go
func Gettimeofday(tp *Timeval) (err error)
```

### <a id="libc_gettimeofday_trampoline" href="#libc_gettimeofday_trampoline">func libc_gettimeofday_trampoline()</a>

```
searchKey: syscall.libc_gettimeofday_trampoline
tags: [private]
```

```Go
func libc_gettimeofday_trampoline()
```

### <a id="Lstat" href="#Lstat">func Lstat(path string, stat *Stat_t) (err error)</a>

```
searchKey: syscall.Lstat
```

```Go
func Lstat(path string, stat *Stat_t) (err error)
```

### <a id="libc_lstat64_trampoline" href="#libc_lstat64_trampoline">func libc_lstat64_trampoline()</a>

```
searchKey: syscall.libc_lstat64_trampoline
tags: [private]
```

```Go
func libc_lstat64_trampoline()
```

### <a id="Stat" href="#Stat">func Stat(path string, stat *Stat_t) (err error)</a>

```
searchKey: syscall.Stat
```

```Go
func Stat(path string, stat *Stat_t) (err error)
```

### <a id="libc_stat64_trampoline" href="#libc_stat64_trampoline">func libc_stat64_trampoline()</a>

```
searchKey: syscall.libc_stat64_trampoline
tags: [private]
```

```Go
func libc_stat64_trampoline()
```

### <a id="Statfs" href="#Statfs">func Statfs(path string, stat *Statfs_t) (err error)</a>

```
searchKey: syscall.Statfs
```

```Go
func Statfs(path string, stat *Statfs_t) (err error)
```

### <a id="libc_statfs64_trampoline" href="#libc_statfs64_trampoline">func libc_statfs64_trampoline()</a>

```
searchKey: syscall.libc_statfs64_trampoline
tags: [private]
```

```Go
func libc_statfs64_trampoline()
```

### <a id="fstatat" href="#fstatat">func fstatat(fd int, path string, stat *Stat_t, flags int) (err error)</a>

```
searchKey: syscall.fstatat
tags: [private]
```

```Go
func fstatat(fd int, path string, stat *Stat_t, flags int) (err error)
```

### <a id="libc_fstatat64_trampoline" href="#libc_fstatat64_trampoline">func libc_fstatat64_trampoline()</a>

```
searchKey: syscall.libc_fstatat64_trampoline
tags: [private]
```

```Go
func libc_fstatat64_trampoline()
```

### <a id="ptrace1" href="#ptrace1">func ptrace1(request int, pid int, addr uintptr, data uintptr) (err error)</a>

```
searchKey: syscall.ptrace1
tags: [private]
```

```Go
func ptrace1(request int, pid int, addr uintptr, data uintptr) (err error)
```

### <a id="libc_ptrace_trampoline" href="#libc_ptrace_trampoline">func libc_ptrace_trampoline()</a>

```
searchKey: syscall.libc_ptrace_trampoline
tags: [private]
```

```Go
func libc_ptrace_trampoline()
```

