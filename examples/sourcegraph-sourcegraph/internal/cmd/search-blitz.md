# Package main

## Index

* [Constants](#const)
    * [const envToken](#envToken)
    * [const envEndpoint](#envEndpoint)
    * [const Batch](#Batch)
    * [const Stream](#Stream)
    * [const port](#port)
    * [const envConfig](#envConfig)
    * [const envLogDir](#envLogDir)
* [Variables](#var)
    * [var allProtocols](#allProtocols)
    * [var UserLatencyBuckets](#UserLatencyBuckets)
    * [var durationSearchHistogram](#durationSearchHistogram)
    * [var graphQLQuery](#graphQLQuery)
* [Types](#type)
    * [type client struct](#client)
        * [func newClient() (*client, error)](#newClient)
        * [func (s *client) search(ctx context.Context, query, queryName string) (*metrics, error)](#client.search)
        * [func (s *client) url() string](#client.url)
        * [func (s *client) clientType() string](#client.clientType)
    * [type Config struct](#Config)
        * [func loadQueries(path string) (*Config, error)](#loadQueries)
    * [type QueryGroupConfig struct](#QueryGroupConfig)
    * [type QueryConfig struct](#QueryConfig)
    * [type Protocol uint8](#Protocol)
        * [func (s *Protocol) UnmarshalYAML(unmarshal func(interface{}) error) error](#Protocol.UnmarshalYAML)
    * [type genericClient interface](#genericClient)
    * [type rawResult struct](#rawResult)
    * [type result struct](#result)
    * [type searchResults struct](#searchResults)
    * [type searchResultsAlert struct](#searchResultsAlert)
    * [type metrics struct](#metrics)
    * [type streamClient struct](#streamClient)
        * [func newStreamClient() (*streamClient, error)](#newStreamClient)
        * [func (s *streamClient) search(ctx context.Context, query, queryName string) (*metrics, error)](#streamClient.search)
        * [func (s *streamClient) clientType() string](#streamClient.clientType)
* [Functions](#func)
    * [func health(w http.ResponseWriter, r *http.Request)](#health)
    * [func run(ctx context.Context, wg *sync.WaitGroup)](#run)
    * [func startServer(wg *sync.WaitGroup) *http.Server](#startServer)
    * [func main()](#main)
    * [func SignalSensitiveContext() (ctx context.Context, cleanup func())](#SignalSensitiveContext)
    * [func init()](#init)


## <a id="const" href="#const">Constants</a>

### <a id="envToken" href="#envToken">const envToken</a>

```
searchKey: main.envToken
```

```Go
const envToken = "SOURCEGRAPH_TOKEN"
```

### <a id="envEndpoint" href="#envEndpoint">const envEndpoint</a>

```
searchKey: main.envEndpoint
```

```Go
const envEndpoint = "SOURCEGRAPH_ENDPOINT"
```

### <a id="Batch" href="#Batch">const Batch</a>

```
searchKey: main.Batch
tags: [exported]
```

```Go
const Batch Protocol = iota
```

### <a id="Stream" href="#Stream">const Stream</a>

```
searchKey: main.Stream
tags: [exported]
```

```Go
const Stream
```

### <a id="port" href="#port">const port</a>

```
searchKey: main.port
```

```Go
const port = "8080"
```

### <a id="envConfig" href="#envConfig">const envConfig</a>

```
searchKey: main.envConfig
```

```Go
const envConfig = "CONFIG"
```

### <a id="envLogDir" href="#envLogDir">const envLogDir</a>

```
searchKey: main.envLogDir
```

```Go
const envLogDir = "LOG_DIR"
```

## <a id="var" href="#var">Variables</a>

### <a id="allProtocols" href="#allProtocols">var allProtocols</a>

```
searchKey: main.allProtocols
```

```Go
var allProtocols = []Protocol{Batch, Stream}
```

### <a id="UserLatencyBuckets" href="#UserLatencyBuckets">var UserLatencyBuckets</a>

```
searchKey: main.UserLatencyBuckets
tags: [exported]
```

```Go
var UserLatencyBuckets = []float64{100, 200, 300, 400, 500, 1000, 2000, 5000, 10000, 30000}
```

### <a id="durationSearchHistogram" href="#durationSearchHistogram">var durationSearchHistogram</a>

```
searchKey: main.durationSearchHistogram
```

```Go
var durationSearchHistogram = ...
```

### <a id="graphQLQuery" href="#graphQLQuery">var graphQLQuery</a>

```
searchKey: main.graphQLQuery
```

```Go
var graphQLQuery = ...
```

## <a id="type" href="#type">Types</a>

### <a id="client" href="#client">type client struct</a>

```
searchKey: main.client
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
```

```Go
func newClient() (*client, error)
```

#### <a id="client.search" href="#client.search">func (s *client) search(ctx context.Context, query, queryName string) (*metrics, error)</a>

```
searchKey: main.client.search
```

```Go
func (s *client) search(ctx context.Context, query, queryName string) (*metrics, error)
```

#### <a id="client.url" href="#client.url">func (s *client) url() string</a>

```
searchKey: main.client.url
```

```Go
func (s *client) url() string
```

#### <a id="client.clientType" href="#client.clientType">func (s *client) clientType() string</a>

```
searchKey: main.client.clientType
```

```Go
func (s *client) clientType() string
```

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: main.Config
tags: [exported]
```

```Go
type Config struct {
	Groups []QueryGroupConfig
}
```

#### <a id="loadQueries" href="#loadQueries">func loadQueries(path string) (*Config, error)</a>

```
searchKey: main.loadQueries
```

```Go
func loadQueries(path string) (*Config, error)
```

### <a id="QueryGroupConfig" href="#QueryGroupConfig">type QueryGroupConfig struct</a>

```
searchKey: main.QueryGroupConfig
tags: [exported]
```

```Go
type QueryGroupConfig struct {
	Name    string
	Queries []QueryConfig
}
```

### <a id="QueryConfig" href="#QueryConfig">type QueryConfig struct</a>

```
searchKey: main.QueryConfig
tags: [exported]
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

### <a id="Protocol" href="#Protocol">type Protocol uint8</a>

```
searchKey: main.Protocol
tags: [exported]
```

```Go
type Protocol uint8
```

Protocol represents either the graphQL Protocol or the streaming Protocol 

#### <a id="Protocol.UnmarshalYAML" href="#Protocol.UnmarshalYAML">func (s *Protocol) UnmarshalYAML(unmarshal func(interface{}) error) error</a>

```
searchKey: main.Protocol.UnmarshalYAML
tags: [exported]
```

```Go
func (s *Protocol) UnmarshalYAML(unmarshal func(interface{}) error) error
```

### <a id="genericClient" href="#genericClient">type genericClient interface</a>

```
searchKey: main.genericClient
```

```Go
type genericClient interface {
	search(ctx context.Context, query, queryName string) (*metrics, error)
	clientType() string
}
```

### <a id="rawResult" href="#rawResult">type rawResult struct</a>

```
searchKey: main.rawResult
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

### <a id="metrics" href="#metrics">type metrics struct</a>

```
searchKey: main.metrics
```

```Go
type metrics struct {
	took  int64
	trace string
}
```

### <a id="streamClient" href="#streamClient">type streamClient struct</a>

```
searchKey: main.streamClient
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
```

```Go
func newStreamClient() (*streamClient, error)
```

#### <a id="streamClient.search" href="#streamClient.search">func (s *streamClient) search(ctx context.Context, query, queryName string) (*metrics, error)</a>

```
searchKey: main.streamClient.search
```

```Go
func (s *streamClient) search(ctx context.Context, query, queryName string) (*metrics, error)
```

#### <a id="streamClient.clientType" href="#streamClient.clientType">func (s *streamClient) clientType() string</a>

```
searchKey: main.streamClient.clientType
```

```Go
func (s *streamClient) clientType() string
```

## <a id="func" href="#func">Functions</a>

### <a id="health" href="#health">func health(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: main.health
```

```Go
func health(w http.ResponseWriter, r *http.Request)
```

### <a id="run" href="#run">func run(ctx context.Context, wg *sync.WaitGroup)</a>

```
searchKey: main.run
```

```Go
func run(ctx context.Context, wg *sync.WaitGroup)
```

### <a id="startServer" href="#startServer">func startServer(wg *sync.WaitGroup) *http.Server</a>

```
searchKey: main.startServer
```

```Go
func startServer(wg *sync.WaitGroup) *http.Server
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

### <a id="SignalSensitiveContext" href="#SignalSensitiveContext">func SignalSensitiveContext() (ctx context.Context, cleanup func())</a>

```
searchKey: main.SignalSensitiveContext
tags: [exported]
```

```Go
func SignalSensitiveContext() (ctx context.Context, cleanup func())
```

SignalSensitiveContext returns a background context that is canceled after receiving an interrupt or terminate signal. A second signal will abort the program. This function returns the context and a function that should be  deferred by the caller to clean up internal channels. 

### <a id="init" href="#init">func init()</a>

```
searchKey: main.init
```

```Go
func init()
```
