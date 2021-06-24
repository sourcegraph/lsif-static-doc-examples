# Package socktest

Package socktest provides utilities for socket testing. 

## Index

* [Constants](#const)
    * [const FilterAccept](#FilterAccept)
    * [const FilterClose](#FilterClose)
    * [const FilterConnect](#FilterConnect)
    * [const FilterGetsockoptInt](#FilterGetsockoptInt)
    * [const FilterListen](#FilterListen)
    * [const FilterSocket](#FilterSocket)
* [Types](#type)
    * [type AfterFilter func(*std/net/internal/socktest.Status) error](#AfterFilter)
        * [func (f AfterFilter) apply(st *Status) error](#AfterFilter.apply)
    * [type Cookie uint64](#Cookie)
        * [func cookie(family, sotype, proto int) Cookie](#cookie)
        * [func (c Cookie) Family() int](#Cookie.Family)
        * [func (c Cookie) Protocol() int](#Cookie.Protocol)
        * [func (c Cookie) Type() int](#Cookie.Type)
    * [type Filter func(*std/net/internal/socktest.Status) (std/net/internal/socktest.AfterFilter, error)](#Filter)
        * [func (f Filter) apply(st *Status) (AfterFilter, error)](#Filter.apply)
    * [type FilterType int](#FilterType)
    * [type Sockets map[int]socktest.Status](#Sockets)
    * [type Stat struct](#Stat)
        * [func (st Stat) String() string](#Stat.String)
    * [type Status struct](#Status)
        * [func (so Status) String() string](#Status.String)
    * [type Switch struct](#Switch)
        * [func (sw *Switch) Accept(s int) (ns int, sa syscall.Sockaddr, err error)](#Switch.Accept)
        * [func (sw *Switch) Close(s int) (err error)](#Switch.Close)
        * [func (sw *Switch) Connect(s int, sa syscall.Sockaddr) (err error)](#Switch.Connect)
        * [func (sw *Switch) GetsockoptInt(s, level, opt int) (soerr int, err error)](#Switch.GetsockoptInt)
        * [func (sw *Switch) Listen(s, backlog int) (err error)](#Switch.Listen)
        * [func (sw *Switch) Set(t FilterType, f Filter)](#Switch.Set)
        * [func (sw *Switch) Socket(family, sotype, proto int) (s int, err error)](#Switch.Socket)
        * [func (sw *Switch) Sockets() Sockets](#Switch.Sockets)
        * [func (sw *Switch) Stats() []Stat](#Switch.Stats)
        * [func (sw *Switch) addLocked(s, family, sotype, proto int) *Status](#Switch.addLocked)
        * [func (sw *Switch) init()](#Switch.init.switch.go)
        * [func (sw *Switch) sockso(s int) *Status](#Switch.sockso)
    * [type stats map[socktest.Cookie]*socktest.Stat](#stats)
        * [func (st stats) getLocked(c Cookie) *Stat](#stats.getLocked)
* [Functions](#func)
    * [func familyString(family int) string](#familyString)
    * [func protocolString(proto int) string](#protocolString)
    * [func typeString(sotype int) string](#typeString)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="FilterAccept" href="#FilterAccept">const FilterAccept</a>

```
searchKey: socktest.FilterAccept
tags: [constant number]
```

```Go
const FilterAccept // for Accept, Accept4 or AcceptEx

```

### <a id="FilterClose" href="#FilterClose">const FilterClose</a>

```
searchKey: socktest.FilterClose
tags: [constant number]
```

```Go
const FilterClose // for Close or Closesocket

```

### <a id="FilterConnect" href="#FilterConnect">const FilterConnect</a>

```
searchKey: socktest.FilterConnect
tags: [constant number]
```

```Go
const FilterConnect // for Connect or ConnectEx

```

### <a id="FilterGetsockoptInt" href="#FilterGetsockoptInt">const FilterGetsockoptInt</a>

```
searchKey: socktest.FilterGetsockoptInt
tags: [constant number]
```

```Go
const FilterGetsockoptInt // for GetsockoptInt

```

### <a id="FilterListen" href="#FilterListen">const FilterListen</a>

```
searchKey: socktest.FilterListen
tags: [constant number]
```

```Go
const FilterListen // for Listen

```

### <a id="FilterSocket" href="#FilterSocket">const FilterSocket</a>

```
searchKey: socktest.FilterSocket
tags: [constant number]
```

```Go
const FilterSocket FilterType = iota // for Socket

```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="AfterFilter" href="#AfterFilter">type AfterFilter func(*std/net/internal/socktest.Status) error</a>

```
searchKey: socktest.AfterFilter
tags: [function]
```

```Go
type AfterFilter func(*Status) error
```

An AfterFilter represents a socket system call filter after an execution of a system call. 

It will only be executed after a system call for a socket that has an entry in internal table. If the filter returns a non-nil error, the system call function returns the non-nil error. 

#### <a id="AfterFilter.apply" href="#AfterFilter.apply">func (f AfterFilter) apply(st *Status) error</a>

```
searchKey: socktest.AfterFilter.apply
tags: [method private]
```

```Go
func (f AfterFilter) apply(st *Status) error
```

### <a id="Cookie" href="#Cookie">type Cookie uint64</a>

```
searchKey: socktest.Cookie
tags: [number]
```

```Go
type Cookie uint64
```

A Cookie represents a 3-tuple of a socket; address family, socket type and protocol number. 

#### <a id="cookie" href="#cookie">func cookie(family, sotype, proto int) Cookie</a>

```
searchKey: socktest.cookie
tags: [method private]
```

```Go
func cookie(family, sotype, proto int) Cookie
```

#### <a id="Cookie.Family" href="#Cookie.Family">func (c Cookie) Family() int</a>

```
searchKey: socktest.Cookie.Family
tags: [function]
```

```Go
func (c Cookie) Family() int
```

Family returns an address family. 

#### <a id="Cookie.Protocol" href="#Cookie.Protocol">func (c Cookie) Protocol() int</a>

```
searchKey: socktest.Cookie.Protocol
tags: [function]
```

```Go
func (c Cookie) Protocol() int
```

Protocol returns a protocol number. 

#### <a id="Cookie.Type" href="#Cookie.Type">func (c Cookie) Type() int</a>

```
searchKey: socktest.Cookie.Type
tags: [function]
```

```Go
func (c Cookie) Type() int
```

Type returns a socket type. 

### <a id="Filter" href="#Filter">type Filter func(*std/net/internal/socktest.Status) (std/net/internal/socktest.AfterFilter, error)</a>

```
searchKey: socktest.Filter
tags: [function]
```

```Go
type Filter func(*Status) (AfterFilter, error)
```

A Filter represents a socket system call filter. 

It will only be executed before a system call for a socket that has an entry in internal table. If the filter returns a non-nil error, the execution of system call will be canceled and the system call function returns the non-nil error. It can return a non-nil AfterFilter for filtering after the execution of the system call. 

#### <a id="Filter.apply" href="#Filter.apply">func (f Filter) apply(st *Status) (AfterFilter, error)</a>

```
searchKey: socktest.Filter.apply
tags: [method private]
```

```Go
func (f Filter) apply(st *Status) (AfterFilter, error)
```

### <a id="FilterType" href="#FilterType">type FilterType int</a>

```
searchKey: socktest.FilterType
tags: [number]
```

```Go
type FilterType int
```

A FilterType represents a filter type. 

### <a id="Sockets" href="#Sockets">type Sockets map[int]socktest.Status</a>

```
searchKey: socktest.Sockets
tags: [object]
```

```Go
type Sockets map[int]Status
```

Sockets maps a socket descriptor to the status of socket. 

### <a id="Stat" href="#Stat">type Stat struct</a>

```
searchKey: socktest.Stat
tags: [struct]
```

```Go
type Stat struct {
	Family   int // address family
	Type     int // socket type
	Protocol int // protocol number

	Opened    uint64 // number of sockets opened
	Connected uint64 // number of sockets connected
	Listened  uint64 // number of sockets listened
	Accepted  uint64 // number of sockets accepted
	Closed    uint64 // number of sockets closed

	OpenFailed    uint64 // number of sockets open failed
	ConnectFailed uint64 // number of sockets connect failed
	ListenFailed  uint64 // number of sockets listen failed
	AcceptFailed  uint64 // number of sockets accept failed
	CloseFailed   uint64 // number of sockets close failed
}
```

A Stat represents a per-cookie socket statistics. 

#### <a id="Stat.String" href="#Stat.String">func (st Stat) String() string</a>

```
searchKey: socktest.Stat.String
tags: [function]
```

```Go
func (st Stat) String() string
```

### <a id="Status" href="#Status">type Status struct</a>

```
searchKey: socktest.Status
tags: [struct]
```

```Go
type Status struct {
	Cookie    Cookie
	Err       error // error status of socket system call
	SocketErr error // error status of socket by SO_ERROR
}
```

A Status represents the status of a socket. 

#### <a id="Status.String" href="#Status.String">func (so Status) String() string</a>

```
searchKey: socktest.Status.String
tags: [function]
```

```Go
func (so Status) String() string
```

### <a id="Switch" href="#Switch">type Switch struct</a>

```
searchKey: socktest.Switch
tags: [struct]
```

```Go
type Switch struct {
	once sync.Once

	fmu   sync.RWMutex
	fltab map[FilterType]Filter

	smu   sync.RWMutex
	sotab Sockets
	stats stats
}
```

A Switch represents a callpath point switch for socket system calls. 

#### <a id="Switch.Accept" href="#Switch.Accept">func (sw *Switch) Accept(s int) (ns int, sa syscall.Sockaddr, err error)</a>

```
searchKey: socktest.Switch.Accept
tags: [method]
```

```Go
func (sw *Switch) Accept(s int) (ns int, sa syscall.Sockaddr, err error)
```

Accept wraps syscall.Accept. 

#### <a id="Switch.Close" href="#Switch.Close">func (sw *Switch) Close(s int) (err error)</a>

```
searchKey: socktest.Switch.Close
tags: [method]
```

```Go
func (sw *Switch) Close(s int) (err error)
```

Close wraps syscall.Close. 

#### <a id="Switch.Connect" href="#Switch.Connect">func (sw *Switch) Connect(s int, sa syscall.Sockaddr) (err error)</a>

```
searchKey: socktest.Switch.Connect
tags: [method]
```

```Go
func (sw *Switch) Connect(s int, sa syscall.Sockaddr) (err error)
```

Connect wraps syscall.Connect. 

#### <a id="Switch.GetsockoptInt" href="#Switch.GetsockoptInt">func (sw *Switch) GetsockoptInt(s, level, opt int) (soerr int, err error)</a>

```
searchKey: socktest.Switch.GetsockoptInt
tags: [method]
```

```Go
func (sw *Switch) GetsockoptInt(s, level, opt int) (soerr int, err error)
```

GetsockoptInt wraps syscall.GetsockoptInt. 

#### <a id="Switch.Listen" href="#Switch.Listen">func (sw *Switch) Listen(s, backlog int) (err error)</a>

```
searchKey: socktest.Switch.Listen
tags: [method]
```

```Go
func (sw *Switch) Listen(s, backlog int) (err error)
```

Listen wraps syscall.Listen. 

#### <a id="Switch.Set" href="#Switch.Set">func (sw *Switch) Set(t FilterType, f Filter)</a>

```
searchKey: socktest.Switch.Set
tags: [method]
```

```Go
func (sw *Switch) Set(t FilterType, f Filter)
```

Set deploys the socket system call filter f for the filter type t. 

#### <a id="Switch.Socket" href="#Switch.Socket">func (sw *Switch) Socket(family, sotype, proto int) (s int, err error)</a>

```
searchKey: socktest.Switch.Socket
tags: [method]
```

```Go
func (sw *Switch) Socket(family, sotype, proto int) (s int, err error)
```

Socket wraps syscall.Socket. 

#### <a id="Switch.Sockets" href="#Switch.Sockets">func (sw *Switch) Sockets() Sockets</a>

```
searchKey: socktest.Switch.Sockets
tags: [function]
```

```Go
func (sw *Switch) Sockets() Sockets
```

Sockets returns mappings of socket descriptor to socket status. 

#### <a id="Switch.Stats" href="#Switch.Stats">func (sw *Switch) Stats() []Stat</a>

```
searchKey: socktest.Switch.Stats
tags: [function]
```

```Go
func (sw *Switch) Stats() []Stat
```

Stats returns a list of per-cookie socket statistics. 

#### <a id="Switch.addLocked" href="#Switch.addLocked">func (sw *Switch) addLocked(s, family, sotype, proto int) *Status</a>

```
searchKey: socktest.Switch.addLocked
tags: [method private]
```

```Go
func (sw *Switch) addLocked(s, family, sotype, proto int) *Status
```

addLocked returns a new Status without locking. sw.smu must be held before call. 

#### <a id="Switch.init.switch.go" href="#Switch.init.switch.go">func (sw *Switch) init()</a>

```
searchKey: socktest.Switch.init
tags: [function private]
```

```Go
func (sw *Switch) init()
```

#### <a id="Switch.sockso" href="#Switch.sockso">func (sw *Switch) sockso(s int) *Status</a>

```
searchKey: socktest.Switch.sockso
tags: [method private]
```

```Go
func (sw *Switch) sockso(s int) *Status
```

### <a id="stats" href="#stats">type stats map[socktest.Cookie]*socktest.Stat</a>

```
searchKey: socktest.stats
tags: [object private]
```

```Go
type stats map[Cookie]*Stat
```

#### <a id="stats.getLocked" href="#stats.getLocked">func (st stats) getLocked(c Cookie) *Stat</a>

```
searchKey: socktest.stats.getLocked
tags: [method private]
```

```Go
func (st stats) getLocked(c Cookie) *Stat
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="familyString" href="#familyString">func familyString(family int) string</a>

```
searchKey: socktest.familyString
tags: [method private]
```

```Go
func familyString(family int) string
```

### <a id="protocolString" href="#protocolString">func protocolString(proto int) string</a>

```
searchKey: socktest.protocolString
tags: [method private]
```

```Go
func protocolString(proto int) string
```

### <a id="typeString" href="#typeString">func typeString(sotype int) string</a>

```
searchKey: socktest.typeString
tags: [method private]
```

```Go
func typeString(sotype int) string
```

