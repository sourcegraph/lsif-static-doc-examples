# Package main

## Index

* [Constants](#const)
    * [const Batch](#Batch)
    * [const Stream](#Stream)
    * [const envConfig](#envConfig)
    * [const envEndpoint](#envEndpoint)
    * [const envLogDir](#envLogDir)
    * [const envToken](#envToken)
    * [const port](#port)
* [Variables](#var)
    * [var UserLatencyBuckets](#UserLatencyBuckets)
    * [var allProtocols](#allProtocols)
    * [var durationSearchHistogram](#durationSearchHistogram)
    * [var graphQLQuery](#graphQLQuery)
* [Types](#type)
    * [type Config struct](#Config)
        * [func loadQueries(path string) (*Config, error)](#loadQueries)
    * [type Protocol uint8](#Protocol)
        * [func (s *Protocol) UnmarshalYAML(unmarshal func(interface{}) error) error](#Protocol.UnmarshalYAML)
    * [type QueryConfig struct](#QueryConfig)
    * [type QueryGroupConfig struct](#QueryGroupConfig)
    * [type client struct](#client)
        * [func newClient() (*client, error)](#newClient)
        * [func (s *client) clientType() string](#client.clientType)
        * [func (s *client) search(ctx context.Context, query, queryName string) (*metrics, error)](#client.search)
        * [func (s *client) url() string](#client.url)
    * [type genericClient interface](#genericClient)
    * [type metrics struct](#metrics)
    * [type rawResult struct](#rawResult)
    * [type result struct](#result)
    * [type searchResults struct](#searchResults)
    * [type searchResultsAlert struct](#searchResultsAlert)
    * [type streamClient struct](#streamClient)
        * [func newStreamClient() (*streamClient, error)](#newStreamClient)
        * [func (s *streamClient) clientType() string](#streamClient.clientType)
        * [func (s *streamClient) search(ctx context.Context, query, queryName string) (*metrics, error)](#streamClient.search)
* [Functions](#func)
    * [func SignalSensitiveContext() (ctx context.Context, cleanup func())](#SignalSensitiveContext)
    * [func health(w http.ResponseWriter, r *http.Request)](#health)
    * [func init()](#init.prometheus.go)
    * [func main()](#main)
    * [func run(ctx context.Context, wg *sync.WaitGroup)](#run)
    * [func startServer(wg *sync.WaitGroup) *http.Server](#startServer)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="Batch" href="#Batch">const Batch</a>

```
searchKey: main.Batch
tags: [constant number]
```

```Go
const Batch Protocol = iota
```

### <a id="Stream" href="#Stream">const Stream</a>

```
searchKey: main.Stream
tags: [constant number]
```

```Go
const Stream
```

### <a id="envConfig" href="#envConfig">const envConfig</a>

```
searchKey: main.envConfig
tags: [constant string private]
```

```Go
const envConfig = "CONFIG"
```

### <a id="envEndpoint" href="#envEndpoint">const envEndpoint</a>

```
searchKey: main.envEndpoint
tags: [constant string private]
```

```Go
const envEndpoint = "SOURCEGRAPH_ENDPOINT"
```

### <a id="envLogDir" href="#envLogDir">const envLogDir</a>

```
searchKey: main.envLogDir
tags: [constant string private]
```

```Go
const envLogDir = "LOG_DIR"
```

### <a id="envToken" href="#envToken">const envToken</a>

```
searchKey: main.envToken
tags: [constant string private]
```

```Go
const envToken = "SOURCEGRAPH_TOKEN"
```

### <a id="port" href="#port">const port</a>

```
searchKey: main.port
tags: [constant string private]
```

```Go
const port = "8080"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="UserLatencyBuckets" href="#UserLatencyBuckets">var UserLatencyBuckets</a>

```
searchKey: main.UserLatencyBuckets
tags: [variable array number]
```

```Go
var UserLatencyBuckets = []float64{100, 200, 300, 400, 500, 1000, 2000, 5000, 10000, 30000}
```

### <a id="allProtocols" href="#allProtocols">var allProtocols</a>

```
searchKey: main.allProtocols
tags: [variable array number private]
```

```Go
var allProtocols = []Protocol{Batch, Stream}
```

### <a id="durationSearchHistogram" href="#durationSearchHistogram">var durationSearchHistogram</a>

```
searchKey: main.durationSearchHistogram
tags: [variable struct private]
```

```Go
var durationSearchHistogram = ...
```

### <a id="graphQLQuery" href="#graphQLQuery">var graphQLQuery</a>

```
searchKey: main.graphQLQuery
tags: [variable string private]
```

```Go
var graphQLQuery = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: main.Config
tags: [struct]
```

```Go
type Config struct {
	Groups []QueryGroupConfig
}
```

#### <a id="loadQueries" href="#loadQueries">func loadQueries(path string) (*Config, error)</a>

```
searchKey: main.loadQueries
tags: [method private]
```

```Go
func loadQueries(path string) (*Config, error)
```

### <a id="Protocol" href="#Protocol">type Protocol uint8</a>

```
searchKey: main.Protocol
tags: [number]
```

```Go
type Protocol uint8
```

Protocol represents either the graphQL Protocol or the streaming Protocol 

#### <a id="Protocol.UnmarshalYAML" href="#Protocol.UnmarshalYAML">func (s *Protocol) UnmarshalYAML(unmarshal func(interface{}) error) error</a>

```
searchKey: main.Protocol.UnmarshalYAML
tags: [method]
```

```Go
func (s *Protocol) UnmarshalYAML(unmarshal func(interface{}) error) error
```

### <a id="QueryConfig" href="#QueryConfig">type QueryConfig struct</a>

```
searchKey: main.QueryConfig
tags: [struct]
```

```Go
type QueryConfig struct {
	Query string
	Name  string

	// An unset interval defaults to 1m
	Interval time.Duration

	// An empty value for Protocols means "all"
	Protocols []Protocol
}
```

### <a id="QueryGroupConfig" href="#QueryGroupConfig">type QueryGroupConfig struct</a>

```
searchKey: main.QueryGroupConfig
tags: [struct]
```

```Go
type QueryGroupConfig struct {
	Name    string
	Queries []QueryConfig
}
```

### <a id="client" href="#client">type client struct</a>

```
searchKey: main.client
tags: [struct private]
```

```Go
type client struct {
	token    string
	endpoint string
	client   *http.Client
}
```

#### <a id="newClient" href="#newClient">func newClient() (*client, error)</a>

```
searchKey: main.newClient
tags: [function private]
```

```Go
func newClient() (*client, error)
```

#### <a id="client.clientType" href="#client.clientType">func (s *client) clientType() string</a>

```
searchKey: main.client.clientType
tags: [function private]
```

```Go
func (s *client) clientType() string
```

#### <a id="client.search" href="#client.search">func (s *client) search(ctx context.Context, query, queryName string) (*metrics, error)</a>

```
searchKey: main.client.search
tags: [method private]
```

```Go
func (s *client) search(ctx context.Context, query, queryName string) (*metrics, error)
```

#### <a id="client.url" href="#client.url">func (s *client) url() string</a>

```
searchKey: main.client.url
tags: [function private]
```

```Go
func (s *client) url() string
```

### <a id="genericClient" href="#genericClient">type genericClient interface</a>

```
searchKey: main.genericClient
tags: [interface private]
```

```Go
type genericClient interface {
	search(ctx context.Context, query, queryName string) (*metrics, error)
	clientType() string
}
```

### <a id="metrics" href="#metrics">type metrics struct</a>

```
searchKey: main.metrics
tags: [struct private]
```

```Go
type metrics struct {
	took  int64
	trace string
}
```

### <a id="rawResult" href="#rawResult">type rawResult struct</a>

```
searchKey: main.rawResult
tags: [struct private]
```

```Go
type rawResult struct {
	Data   result        `json:"data,omitempty"`
	Errors []interface{} `json:"errors,omitempty"`
}
```

### <a id="result" href="#result">type result struct</a>

```
searchKey: main.result
tags: [struct private]
```

```Go
type result struct {
	Site struct {
		BuildVersion string
	}
	Search struct {
		Results searchResults
	}
}
```

### <a id="searchResults" href="#searchResults">type searchResults struct</a>

```
searchKey: main.searchResults
tags: [struct private]
```

```Go
type searchResults struct {
	Results                    []map[string]interface{}
	LimitHit                   bool
	Cloning, Missing, Timedout []map[string]interface{}
	ResultCount                int
	ElapsedMilliseconds        int
	Alert                      searchResultsAlert
}
```

searchResults represents the data we get back from the GraphQL search request. 

### <a id="searchResultsAlert" href="#searchResultsAlert">type searchResultsAlert struct</a>

```
searchKey: main.searchResultsAlert
tags: [struct private]
```

```Go
type searchResultsAlert struct {
	Title           string
	Description     string
	ProposedQueries []struct {
		Description string
		Query       string
	}
}
```

searchResultsAlert is a type that can be used to unmarshal values returned by the searchResultsAlertFragment GraphQL fragment below. 

### <a id="streamClient" href="#streamClient">type streamClient struct</a>

```
searchKey: main.streamClient
tags: [struct private]
```

```Go
type streamClient struct {
	token    string
	endpoint string
	client   *http.Client
}
```

#### <a id="newStreamClient" href="#newStreamClient">func newStreamClient() (*streamClient, error)</a>

```
searchKey: main.newStreamClient
tags: [function private]
```

```Go
func newStreamClient() (*streamClient, error)
```

#### <a id="streamClient.clientType" href="#streamClient.clientType">func (s *streamClient) clientType() string</a>

```
searchKey: main.streamClient.clientType
tags: [function private]
```

```Go
func (s *streamClient) clientType() string
```

#### <a id="streamClient.search" href="#streamClient.search">func (s *streamClient) search(ctx context.Context, query, queryName string) (*metrics, error)</a>

```
searchKey: main.streamClient.search
tags: [method private]
```

```Go
func (s *streamClient) search(ctx context.Context, query, queryName string) (*metrics, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="SignalSensitiveContext" href="#SignalSensitiveContext">func SignalSensitiveContext() (ctx context.Context, cleanup func())</a>

```
searchKey: main.SignalSensitiveContext
tags: [function]
```

```Go
func SignalSensitiveContext() (ctx context.Context, cleanup func())
```

SignalSensitiveContext returns a background context that is canceled after receiving an interrupt or terminate signal. A second signal will abort the program. This function returns the context and a function that should be  deferred by the caller to clean up internal channels. 

### <a id="health" href="#health">func health(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: main.health
tags: [method private]
```

```Go
func health(w http.ResponseWriter, r *http.Request)
```

### <a id="init.prometheus.go" href="#init.prometheus.go">func init()</a>

```
searchKey: main.init
tags: [function private]
```

```Go
func init()
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="run" href="#run">func run(ctx context.Context, wg *sync.WaitGroup)</a>

```
searchKey: main.run
tags: [method private]
```

```Go
func run(ctx context.Context, wg *sync.WaitGroup)
```

### <a id="startServer" href="#startServer">func startServer(wg *sync.WaitGroup) *http.Server</a>

```
searchKey: main.startServer
tags: [method private]
```

```Go
func startServer(wg *sync.WaitGroup) *http.Server
```

