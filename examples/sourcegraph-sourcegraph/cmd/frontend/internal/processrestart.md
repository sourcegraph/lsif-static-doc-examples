# Package processrestart

Package processrestart provides utilities for restarting all Sourcegraph processes associated with a site. 

## Index

* [Variables](#var)
    * [var usingGoremanServer](#usingGoremanServer)
* [Functions](#func)
    * [func CanRestart() bool](#CanRestart)
    * [func Restart() error](#Restart)
    * [func restartGoremanServer() error](#restartGoremanServer)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="usingGoremanServer" href="#usingGoremanServer">var usingGoremanServer</a>

```
searchKey: processrestart.usingGoremanServer
tags: [variable boolean private]
```

```Go
var usingGoremanServer = os.Getenv("GOREMAN_RPC_ADDR") != ""
```

usingGoremanServer is whether we are running goreman in cmd/server. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="CanRestart" href="#CanRestart">func CanRestart() bool</a>

```
searchKey: processrestart.CanRestart
tags: [function]
```

```Go
func CanRestart() bool
```

CanRestart reports whether the current set of Sourcegraph processes can be restarted. 

### <a id="Restart" href="#Restart">func Restart() error</a>

```
searchKey: processrestart.Restart
tags: [function]
```

```Go
func Restart() error
```

Restart restarts the current set of Sourcegraph processes associated with this server. 

### <a id="restartGoremanServer" href="#restartGoremanServer">func restartGoremanServer() error</a>

```
searchKey: processrestart.restartGoremanServer
tags: [function private]
```

```Go
func restartGoremanServer() error
```

restartGoremanServer restarts the processes when running goreman in cmd/server. It takes care to avoid a race condition where some services have started up with the new config and some are still running with the old config. 

