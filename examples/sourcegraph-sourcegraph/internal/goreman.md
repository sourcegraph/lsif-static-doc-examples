# Package goreman

Package goreman implements a process supervisor for a Procfile. 

## Index

* [Constants](#const)
    * [const Ignore](#Ignore)
    * [const Shutdown](#Shutdown)
* [Variables](#var)
    * [var ci](#ci)
    * [var colors](#colors)
    * [var maxProcNameLength](#maxProcNameLength)
    * [var mutex](#mutex)
    * [var procDiedAction](#procDiedAction)
    * [var procs](#procs)
    * [var signals](#signals)
    * [var wg](#wg)
* [Types](#type)
    * [type Goreman struct{}](#Goreman)
        * [func (Goreman) RestartAll(args struct{}, ret *string) (err error)](#Goreman.RestartAll)
    * [type Options struct](#Options)
    * [type ProcDiedAction uint](#ProcDiedAction)
    * [type clogger struct](#clogger)
        * [func createLogger(proc string) *clogger](#createLogger)
        * [func (l *clogger) Write(p []byte) (int, error)](#clogger.Write)
        * [func (l *clogger) writeBuffers(line []byte)](#clogger.writeBuffers)
        * [func (l *clogger) writeLines()](#clogger.writeLines)
    * [type procInfo struct](#procInfo)
* [Functions](#func)
    * [func Start(contents []byte, opts Options) error](#Start)
    * [func readProcfile(content []byte) error](#readProcfile)
    * [func spawnProc(proc string) bool](#spawnProc)
    * [func startProc(proc string) error](#startProc)
    * [func startProcs()](#startProcs)
    * [func startServer(addr string) error](#startServer)
    * [func stopProc(proc string, kill bool) error](#stopProc)
    * [func stopProcs(kill bool)](#stopProcs)
    * [func terminateProc(proc string) error](#terminateProc)
    * [func waitProcs() error](#waitProcs)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="Ignore" href="#Ignore">const Ignore</a>

```
searchKey: goreman.Ignore
tags: [constant number]
```

```Go
const Ignore
```

Ignore will continue running Goreman and will leave not restart the dead process. 

### <a id="Shutdown" href="#Shutdown">const Shutdown</a>

```
searchKey: goreman.Shutdown
tags: [constant number]
```

```Go
const Shutdown ProcDiedAction = iota
```

Shutdown will shutdown Goreman if any process shuts down with a non-zero exit code. 

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ci" href="#ci">var ci</a>

```
searchKey: goreman.ci
tags: [variable number private]
```

```Go
var ci int
```

### <a id="colors" href="#colors">var colors</a>

```
searchKey: goreman.colors
tags: [variable array number private]
```

```Go
var colors = []ct.Color{
	ct.Green,
	ct.Cyan,
	ct.Magenta,
	ct.Yellow,
	ct.Blue,
	ct.Red,
}
```

### <a id="maxProcNameLength" href="#maxProcNameLength">var maxProcNameLength</a>

```
searchKey: goreman.maxProcNameLength
tags: [variable number private]
```

```Go
var maxProcNameLength int
```

### <a id="mutex" href="#mutex">var mutex</a>

```
searchKey: goreman.mutex
tags: [variable struct private]
```

```Go
var mutex = new(sync.Mutex)
```

### <a id="procDiedAction" href="#procDiedAction">var procDiedAction</a>

```
searchKey: goreman.procDiedAction
tags: [variable number private]
```

```Go
var procDiedAction ProcDiedAction
```

procDiedAction is the ProcDiedAction to take. Goreman still is globals everywhere \o/ 

### <a id="procs" href="#procs">var procs</a>

```
searchKey: goreman.procs
tags: [variable object private]
```

```Go
var procs map[string]*procInfo
```

process informations named with proc. 

### <a id="signals" href="#signals">var signals</a>

```
searchKey: goreman.signals
tags: [variable private]
```

```Go
var signals = make(chan os.Signal, 10)
```

### <a id="wg" href="#wg">var wg</a>

```
searchKey: goreman.wg
tags: [variable struct private]
```

```Go
var wg sync.WaitGroup
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Goreman" href="#Goreman">type Goreman struct{}</a>

```
searchKey: goreman.Goreman
tags: [struct]
```

```Go
type Goreman struct{}
```

#### <a id="Goreman.RestartAll" href="#Goreman.RestartAll">func (Goreman) RestartAll(args struct{}, ret *string) (err error)</a>

```
searchKey: goreman.Goreman.RestartAll
tags: [method]
```

```Go
func (Goreman) RestartAll(args struct{}, ret *string) (err error)
```

rpc: restart all (stop all, then start all) 

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: goreman.Options
tags: [struct]
```

```Go
type Options struct {
	// RPCAddr is the address to listen for Goreman RPCs.
	RPCAddr string

	// ProcDiedAction specifies the behaviour to take when a process dies.
	ProcDiedAction ProcDiedAction
}
```

### <a id="ProcDiedAction" href="#ProcDiedAction">type ProcDiedAction uint</a>

```
searchKey: goreman.ProcDiedAction
tags: [number]
```

```Go
type ProcDiedAction uint
```

ProcDiedAction specifies the behaviour Goreman takes if a process exits with a non-zero exit code. 

### <a id="clogger" href="#clogger">type clogger struct</a>

```
searchKey: goreman.clogger
tags: [struct private]
```

```Go
type clogger struct {
	idx     int
	proc    string
	writes  chan []byte
	done    chan struct{}
	timeout time.Duration // how long to wait before printing partial lines
	buffers net.Buffers   // partial lines awaiting printing
}
```

#### <a id="createLogger" href="#createLogger">func createLogger(proc string) *clogger</a>

```
searchKey: goreman.createLogger
tags: [method private]
```

```Go
func createLogger(proc string) *clogger
```

create logger instance. 

#### <a id="clogger.Write" href="#clogger.Write">func (l *clogger) Write(p []byte) (int, error)</a>

```
searchKey: goreman.clogger.Write
tags: [method private]
```

```Go
func (l *clogger) Write(p []byte) (int, error)
```

write handler of logger. 

#### <a id="clogger.writeBuffers" href="#clogger.writeBuffers">func (l *clogger) writeBuffers(line []byte)</a>

```
searchKey: goreman.clogger.writeBuffers
tags: [method private]
```

```Go
func (l *clogger) writeBuffers(line []byte)
```

write any stored buffers, plus the given line, then empty out the buffers. 

#### <a id="clogger.writeLines" href="#clogger.writeLines">func (l *clogger) writeLines()</a>

```
searchKey: goreman.clogger.writeLines
tags: [function private]
```

```Go
func (l *clogger) writeLines()
```

bundle writes into lines, waiting briefly for completion of lines 

### <a id="procInfo" href="#procInfo">type procInfo struct</a>

```
searchKey: goreman.procInfo
tags: [struct private]
```

```Go
type procInfo struct {
	proc    string
	cmdline string
	stopped bool // true if we stopped it
	cmd     *exec.Cmd
	mu      sync.Mutex
	cond    *sync.Cond
	waitErr error
}
```

-- process information structure. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Start" href="#Start">func Start(contents []byte, opts Options) error</a>

```
searchKey: goreman.Start
tags: [method]
```

```Go
func Start(contents []byte, opts Options) error
```

Start starts up the Procfile. 

### <a id="readProcfile" href="#readProcfile">func readProcfile(content []byte) error</a>

```
searchKey: goreman.readProcfile
tags: [method private]
```

```Go
func readProcfile(content []byte) error
```

read Procfile and parse it. 

### <a id="spawnProc" href="#spawnProc">func spawnProc(proc string) bool</a>

```
searchKey: goreman.spawnProc
tags: [method private]
```

```Go
func spawnProc(proc string) bool
```

spawn command that specified as proc. Returns true if it stopped due to goreman stopping it. 

### <a id="startProc" href="#startProc">func startProc(proc string) error</a>

```
searchKey: goreman.startProc
tags: [method private]
```

```Go
func startProc(proc string) error
```

start specified proc. if proc is started already, return nil. 

### <a id="startProcs" href="#startProcs">func startProcs()</a>

```
searchKey: goreman.startProcs
tags: [function private]
```

```Go
func startProcs()
```

startProcs starts the processes. 

### <a id="startServer" href="#startServer">func startServer(addr string) error</a>

```
searchKey: goreman.startServer
tags: [method private]
```

```Go
func startServer(addr string) error
```

start rpc server. 

### <a id="stopProc" href="#stopProc">func stopProc(proc string, kill bool) error</a>

```
searchKey: goreman.stopProc
tags: [method private]
```

```Go
func stopProc(proc string, kill bool) error
```

stop specified proc. 

### <a id="stopProcs" href="#stopProcs">func stopProcs(kill bool)</a>

```
searchKey: goreman.stopProcs
tags: [method private]
```

```Go
func stopProcs(kill bool)
```

### <a id="terminateProc" href="#terminateProc">func terminateProc(proc string) error</a>

```
searchKey: goreman.terminateProc
tags: [method private]
```

```Go
func terminateProc(proc string) error
```

### <a id="waitProcs" href="#waitProcs">func waitProcs() error</a>

```
searchKey: goreman.waitProcs
tags: [function private]
```

```Go
func waitProcs() error
```

waitProcs waits for processes to complete. 

