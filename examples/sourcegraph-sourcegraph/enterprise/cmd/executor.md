# Package main

## Index

* Subpages
  * [enterprise/cmd/executor/internal](executor/internal.md)
* [Constants](#const)
    * [const addr](#addr)
* [Types](#type)
    * [type Config struct](#Config)
        * [func (c *Config) Load()](#Config.Load)
        * [func (c *Config) APIWorkerOptions(transport http.RoundTripper) apiworker.Options](#Config.APIWorkerOptions)
        * [func (c *Config) WorkerOptions() workerutil.WorkerOptions](#Config.WorkerOptions)
        * [func (c *Config) FirecrackerOptions() command.FirecrackerOptions](#Config.FirecrackerOptions)
        * [func (c *Config) ResourceOptions() command.ResourceOptions](#Config.ResourceOptions)
        * [func (c *Config) ClientOptions(transport http.RoundTripper) apiclient.Options](#Config.ClientOptions)
        * [func (c *Config) BaseClientOptions(transport http.RoundTripper) apiclient.BaseClientOptions](#Config.BaseClientOptions)
        * [func (c *Config) EndpointOptions() apiclient.EndpointOptions](#Config.EndpointOptions)
* [Functions](#func)
    * [func main()](#main)
    * [func makeWorkerMetrics(queueName string) workerutil.WorkerMetrics](#makeWorkerMetrics)


## <a id="const" href="#const">Constants</a>

### <a id="addr" href="#addr">const addr</a>

```
searchKey: main.addr
tags: [private]
```

```Go
const addr = ":3192"
```

## <a id="type" href="#type">Types</a>

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: main.Config
```

```Go
type Config struct {
	env.BaseConfig

	FrontendURL          string
	FrontendUsername     string
	FrontendPassword     string
	QueueName            string
	QueuePollInterval    time.Duration
	HeartbeatInterval    time.Duration
	MaximumNumJobs       int
	FirecrackerImage     string
	UseFirecracker       bool
	FirecrackerNumCPUs   int
	FirecrackerMemory    string
	FirecrackerDiskSpace string
	ImageArchivesPath    string
	DisableHealthServer  bool
	MaximumRuntimePerJob time.Duration
}
```

#### <a id="Config.Load" href="#Config.Load">func (c *Config) Load()</a>

```
searchKey: main.Config.Load
```

```Go
func (c *Config) Load()
```

#### <a id="Config.APIWorkerOptions" href="#Config.APIWorkerOptions">func (c *Config) APIWorkerOptions(transport http.RoundTripper) apiworker.Options</a>

```
searchKey: main.Config.APIWorkerOptions
```

```Go
func (c *Config) APIWorkerOptions(transport http.RoundTripper) apiworker.Options
```

#### <a id="Config.WorkerOptions" href="#Config.WorkerOptions">func (c *Config) WorkerOptions() workerutil.WorkerOptions</a>

```
searchKey: main.Config.WorkerOptions
```

```Go
func (c *Config) WorkerOptions() workerutil.WorkerOptions
```

#### <a id="Config.FirecrackerOptions" href="#Config.FirecrackerOptions">func (c *Config) FirecrackerOptions() command.FirecrackerOptions</a>

```
searchKey: main.Config.FirecrackerOptions
```

```Go
func (c *Config) FirecrackerOptions() command.FirecrackerOptions
```

#### <a id="Config.ResourceOptions" href="#Config.ResourceOptions">func (c *Config) ResourceOptions() command.ResourceOptions</a>

```
searchKey: main.Config.ResourceOptions
```

```Go
func (c *Config) ResourceOptions() command.ResourceOptions
```

#### <a id="Config.ClientOptions" href="#Config.ClientOptions">func (c *Config) ClientOptions(transport http.RoundTripper) apiclient.Options</a>

```
searchKey: main.Config.ClientOptions
```

```Go
func (c *Config) ClientOptions(transport http.RoundTripper) apiclient.Options
```

#### <a id="Config.BaseClientOptions" href="#Config.BaseClientOptions">func (c *Config) BaseClientOptions(transport http.RoundTripper) apiclient.BaseClientOptions</a>

```
searchKey: main.Config.BaseClientOptions
```

```Go
func (c *Config) BaseClientOptions(transport http.RoundTripper) apiclient.BaseClientOptions
```

#### <a id="Config.EndpointOptions" href="#Config.EndpointOptions">func (c *Config) EndpointOptions() apiclient.EndpointOptions</a>

```
searchKey: main.Config.EndpointOptions
```

```Go
func (c *Config) EndpointOptions() apiclient.EndpointOptions
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

### <a id="makeWorkerMetrics" href="#makeWorkerMetrics">func makeWorkerMetrics(queueName string) workerutil.WorkerMetrics</a>

```
searchKey: main.makeWorkerMetrics
tags: [private]
```

```Go
func makeWorkerMetrics(queueName string) workerutil.WorkerMetrics
```

