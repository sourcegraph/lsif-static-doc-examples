# Package main

## Index

* Subpages
  * [enterprise/cmd/executor-queue/internal](executor-queue/internal.md)
* [Constants](#const)
    * [const port](#port)
* [Types](#type)
    * [type Config struct](#Config)
        * [func (c *Config) Load()](#Config.Load)
        * [func (c *Config) ServerOptions(queueOptions map[string]apiserver.QueueOptions) apiserver.Options](#Config.ServerOptions)
    * [type config interface](#config)
* [Functions](#func)
    * [func connectToDatabase() *sql.DB](#connectToDatabase)
    * [func main()](#main)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="port" href="#port">const port</a>

```
searchKey: main.port
tags: [constant number private]
```

```Go
const port = 3191
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: main.Config
tags: [struct]
```

```Go
type Config struct {
	env.BaseConfig

	MaximumNumTransactions     int
	JobRequeueDelay            time.Duration
	JobCleanupInterval         time.Duration
	MaximumNumMissedHeartbeats int
}
```

#### <a id="Config.Load" href="#Config.Load">func (c *Config) Load()</a>

```
searchKey: main.Config.Load
tags: [function]
```

```Go
func (c *Config) Load()
```

#### <a id="Config.ServerOptions" href="#Config.ServerOptions">func (c *Config) ServerOptions(queueOptions map[string]apiserver.QueueOptions) apiserver.Options</a>

```
searchKey: main.Config.ServerOptions
tags: [method]
```

```Go
func (c *Config) ServerOptions(queueOptions map[string]apiserver.QueueOptions) apiserver.Options
```

### <a id="config" href="#config">type config interface</a>

```
searchKey: main.config
tags: [interface private]
```

```Go
type config interface {
	Load()
	Validate() error
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="connectToDatabase" href="#connectToDatabase">func connectToDatabase() *sql.DB</a>

```
searchKey: main.connectToDatabase
tags: [function private]
```

```Go
func connectToDatabase() *sql.DB
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

