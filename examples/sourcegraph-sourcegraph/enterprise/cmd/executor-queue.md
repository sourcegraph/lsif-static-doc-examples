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
    * [func main()](#main)
    * [func connectToDatabase() *sql.DB](#connectToDatabase)


## <a id="const" href="#const">Constants</a>

### <a id="port" href="#port">const port</a>

```
searchKey: main.port
tags: [private]
```

```Go
const port = 3191
```

## <a id="type" href="#type">Types</a>

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: main.Config
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
```

```Go
func (c *Config) Load()
```

#### <a id="Config.ServerOptions" href="#Config.ServerOptions">func (c *Config) ServerOptions(queueOptions map[string]apiserver.QueueOptions) apiserver.Options</a>

```
searchKey: main.Config.ServerOptions
```

```Go
func (c *Config) ServerOptions(queueOptions map[string]apiserver.QueueOptions) apiserver.Options
```

### <a id="config" href="#config">type config interface</a>

```
searchKey: main.config
tags: [private]
```

```Go
type config interface {
	Load()
	Validate() error
}
```

## <a id="func" href="#func">Functions</a>

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [private]
```

```Go
func main()
```

### <a id="connectToDatabase" href="#connectToDatabase">func connectToDatabase() *sql.DB</a>

```
searchKey: main.connectToDatabase
tags: [private]
```

```Go
func connectToDatabase() *sql.DB
```

