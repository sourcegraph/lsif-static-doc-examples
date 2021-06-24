# Package apiclient

## Index

* [Types](#type)
    * [type BaseClient struct](#BaseClient)
        * [func NewBaseClient(options BaseClientOptions) *BaseClient](#NewBaseClient)
        * [func (c *BaseClient) Do(ctx context.Context, req *http.Request) (hasContent bool, _ io.ReadCloser, err error)](#BaseClient.Do)
        * [func (c *BaseClient) DoAndDecode(ctx context.Context, req *http.Request, payload interface{}) (decoded bool, _ error)](#BaseClient.DoAndDecode)
        * [func (c *BaseClient) DoAndDrop(ctx context.Context, req *http.Request) error](#BaseClient.DoAndDrop)
    * [type BaseClientOptions struct](#BaseClientOptions)
    * [type Client struct](#Client)
        * [func New(options Options, observationContext *observation.Context) *Client](#New)
        * [func (c *Client) AddExecutionLogEntry(ctx context.Context, queueName string, jobID int, entry workerutil.ExecutionLogEntry) (err error)](#Client.AddExecutionLogEntry)
        * [func (c *Client) Dequeue(ctx context.Context, queueName string, job *executor.Job) (_ bool, err error)](#Client.Dequeue)
        * [func (c *Client) Heartbeat(ctx context.Context, jobIDs []int) (unknownIDs []int, err error)](#Client.Heartbeat)
        * [func (c *Client) MarkComplete(ctx context.Context, queueName string, jobID int) (err error)](#Client.MarkComplete)
        * [func (c *Client) MarkErrored(ctx context.Context, queueName string, jobID int, errorMessage string) (err error)](#Client.MarkErrored)
        * [func (c *Client) MarkFailed(ctx context.Context, queueName string, jobID int, errorMessage string) (err error)](#Client.MarkFailed)
        * [func (c *Client) Ping(ctx context.Context, jobIDs []int) (err error)](#Client.Ping)
        * [func (c *Client) makeRequest(method, path string, payload interface{}) (*http.Request, error)](#Client.makeRequest)
    * [type EndpointOptions struct](#EndpointOptions)
    * [type Options struct](#Options)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
    * [type routeSpec struct](#routeSpec)
* [Functions](#func)
    * [func MakeJSONRequest(method string, url *url.URL, payload interface{}) (*http.Request, error)](#MakeJSONRequest)
    * [func TestAddExecutionLogEntry(t *testing.T)](#TestAddExecutionLogEntry)
    * [func TestAddExecutionLogEntryBadResponse(t *testing.T)](#TestAddExecutionLogEntryBadResponse)
    * [func TestDequeue(t *testing.T)](#TestDequeue)
    * [func TestDequeueBadResponse(t *testing.T)](#TestDequeueBadResponse)
    * [func TestDequeueNoRecord(t *testing.T)](#TestDequeueNoRecord)
    * [func TestHeartbeat(t *testing.T)](#TestHeartbeat)
    * [func TestHeartbeatBadResponse(t *testing.T)](#TestHeartbeatBadResponse)
    * [func TestMarkComplete(t *testing.T)](#TestMarkComplete)
    * [func TestMarkCompleteBadResponse(t *testing.T)](#TestMarkCompleteBadResponse)
    * [func TestMarkErrored(t *testing.T)](#TestMarkErrored)
    * [func TestMarkErroredBadResponse(t *testing.T)](#TestMarkErroredBadResponse)
    * [func TestMarkFailed(t *testing.T)](#TestMarkFailed)
    * [func intsToString(ints []int) string](#intsToString)
    * [func makeHTTPClient(transport http.RoundTripper) *http.Client](#makeHTTPClient)
    * [func makeRelativeURL(base string, path ...string) (*url.URL, error)](#makeRelativeURL)
    * [func makeURL(base, username, password string, path ...string) (*url.URL, error)](#makeURL)
    * [func normalizeJSON(v []byte) string](#normalizeJSON)
    * [func testRoute(t *testing.T, spec routeSpec, f func(client *Client))](#testRoute)
    * [func testServer(t *testing.T, spec routeSpec) *httptest.Server](#testServer)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="BaseClient" href="#BaseClient">type BaseClient struct</a>

```
searchKey: apiclient.BaseClient
tags: [struct]
```

```Go
type BaseClient struct {
	httpClient *http.Client
	options    BaseClientOptions
}
```

BaseClient is an abstract HTTP API-backed data access layer. Instances of this struct should not be used directly, but should be used compositionally by other stores that implement logic specific to a domain. 

The following is a minimal example of decorating the base client, making the actual logic of the decorated client extremely lean: 

```
type SprocketClient struct {
    *httpcli.BaseClient

    baseURL *url.URL
}

func (c *SprocketClient) Fabricate(ctx context.Context(), spec SprocketSpec) (Sprocket, error) {
    url := c.baseURL.ResolveReference(&url.URL{Path: "/new"})

    req, err := httpcli.MakeJSONRequest("POST", url.String(), spec)
    if err != nil {
        return Sprocket{}, err
    }

    var s Sprocket
    err := c.client.DoAndDecode(ctx, req, &s)
    return s, err
}

```
#### <a id="NewBaseClient" href="#NewBaseClient">func NewBaseClient(options BaseClientOptions) *BaseClient</a>

```
searchKey: apiclient.NewBaseClient
tags: [method]
```

```Go
func NewBaseClient(options BaseClientOptions) *BaseClient
```

NewBaseClient creates a new BaseClient with the given transport. 

#### <a id="BaseClient.Do" href="#BaseClient.Do">func (c *BaseClient) Do(ctx context.Context, req *http.Request) (hasContent bool, _ io.ReadCloser, err error)</a>

```
searchKey: apiclient.BaseClient.Do
tags: [method]
```

```Go
func (c *BaseClient) Do(ctx context.Context, req *http.Request) (hasContent bool, _ io.ReadCloser, err error)
```

Do performs the given HTTP request and returns the body. If there is no content to be read due to a 204 response, then a false-valued flag is returned. 

#### <a id="BaseClient.DoAndDecode" href="#BaseClient.DoAndDecode">func (c *BaseClient) DoAndDecode(ctx context.Context, req *http.Request, payload interface{}) (decoded bool, _ error)</a>

```
searchKey: apiclient.BaseClient.DoAndDecode
tags: [method]
```

```Go
func (c *BaseClient) DoAndDecode(ctx context.Context, req *http.Request, payload interface{}) (decoded bool, _ error)
```

DoAndDecode performs the given HTTP request and unmarshals the response body into the given interface pointer. If the response body was empty due to a 204 response, then a false-valued flag is returned. 

#### <a id="BaseClient.DoAndDrop" href="#BaseClient.DoAndDrop">func (c *BaseClient) DoAndDrop(ctx context.Context, req *http.Request) error</a>

```
searchKey: apiclient.BaseClient.DoAndDrop
tags: [method]
```

```Go
func (c *BaseClient) DoAndDrop(ctx context.Context, req *http.Request) error
```

DoAndDrop performs the given HTTP request and ignores the response body. 

### <a id="BaseClientOptions" href="#BaseClientOptions">type BaseClientOptions struct</a>

```
searchKey: apiclient.BaseClientOptions
tags: [struct]
```

```Go
type BaseClientOptions struct {
	// UserAgent specifies the user agent string to supply on requests.
	UserAgent string

	// Transport is a configurable round tripper, which can include things like
	// tracing, metrics, and request/response decoration.
	Transport http.RoundTripper
}
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: apiclient.Client
tags: [struct]
```

```Go
type Client struct {
	options    Options
	client     *BaseClient
	operations *operations
}
```

Client is the client used to communicate with a remote job queue API. 

#### <a id="New" href="#New">func New(options Options, observationContext *observation.Context) *Client</a>

```
searchKey: apiclient.New
tags: [method]
```

```Go
func New(options Options, observationContext *observation.Context) *Client
```

#### <a id="Client.AddExecutionLogEntry" href="#Client.AddExecutionLogEntry">func (c *Client) AddExecutionLogEntry(ctx context.Context, queueName string, jobID int, entry workerutil.ExecutionLogEntry) (err error)</a>

```
searchKey: apiclient.Client.AddExecutionLogEntry
tags: [method]
```

```Go
func (c *Client) AddExecutionLogEntry(ctx context.Context, queueName string, jobID int, entry workerutil.ExecutionLogEntry) (err error)
```

#### <a id="Client.Dequeue" href="#Client.Dequeue">func (c *Client) Dequeue(ctx context.Context, queueName string, job *executor.Job) (_ bool, err error)</a>

```
searchKey: apiclient.Client.Dequeue
tags: [method]
```

```Go
func (c *Client) Dequeue(ctx context.Context, queueName string, job *executor.Job) (_ bool, err error)
```

#### <a id="Client.Heartbeat" href="#Client.Heartbeat">func (c *Client) Heartbeat(ctx context.Context, jobIDs []int) (unknownIDs []int, err error)</a>

```
searchKey: apiclient.Client.Heartbeat
tags: [method]
```

```Go
func (c *Client) Heartbeat(ctx context.Context, jobIDs []int) (unknownIDs []int, err error)
```

#### <a id="Client.MarkComplete" href="#Client.MarkComplete">func (c *Client) MarkComplete(ctx context.Context, queueName string, jobID int) (err error)</a>

```
searchKey: apiclient.Client.MarkComplete
tags: [method]
```

```Go
func (c *Client) MarkComplete(ctx context.Context, queueName string, jobID int) (err error)
```

#### <a id="Client.MarkErrored" href="#Client.MarkErrored">func (c *Client) MarkErrored(ctx context.Context, queueName string, jobID int, errorMessage string) (err error)</a>

```
searchKey: apiclient.Client.MarkErrored
tags: [method]
```

```Go
func (c *Client) MarkErrored(ctx context.Context, queueName string, jobID int, errorMessage string) (err error)
```

#### <a id="Client.MarkFailed" href="#Client.MarkFailed">func (c *Client) MarkFailed(ctx context.Context, queueName string, jobID int, errorMessage string) (err error)</a>

```
searchKey: apiclient.Client.MarkFailed
tags: [method]
```

```Go
func (c *Client) MarkFailed(ctx context.Context, queueName string, jobID int, errorMessage string) (err error)
```

#### <a id="Client.Ping" href="#Client.Ping">func (c *Client) Ping(ctx context.Context, jobIDs []int) (err error)</a>

```
searchKey: apiclient.Client.Ping
tags: [method]
```

```Go
func (c *Client) Ping(ctx context.Context, jobIDs []int) (err error)
```

#### <a id="Client.makeRequest" href="#Client.makeRequest">func (c *Client) makeRequest(method, path string, payload interface{}) (*http.Request, error)</a>

```
searchKey: apiclient.Client.makeRequest
tags: [method private]
```

```Go
func (c *Client) makeRequest(method, path string, payload interface{}) (*http.Request, error)
```

### <a id="EndpointOptions" href="#EndpointOptions">type EndpointOptions struct</a>

```
searchKey: apiclient.EndpointOptions
tags: [struct]
```

```Go
type EndpointOptions struct {
	// URL is the target request URL.
	URL string

	// Username is the basic-auth username to include with all requests.
	Username string

	// Password is the basic-auth password to include with all requests.
	Password string
}
```

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: apiclient.Options
tags: [struct]
```

```Go
type Options struct {
	// ExecutorName is a unique identifier for the requesting executor.
	ExecutorName string

	// PathPrefix is the path prefix added to all requests.
	PathPrefix string

	// EndpointOptions configures the target request URL.
	EndpointOptions EndpointOptions

	// BaseClientOptions configures the underlying HTTP client behavior.
	BaseClientOptions BaseClientOptions
}
```

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: apiclient.operations
tags: [struct private]
```

```Go
type operations struct {
	dequeue              *observation.Operation
	addExecutionLogEntry *observation.Operation
	markComplete         *observation.Operation
	markErrored          *observation.Operation
	markFailed           *observation.Operation
	heartbeat            *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context) *operations</a>

```
searchKey: apiclient.newOperations
tags: [method private]
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

### <a id="routeSpec" href="#routeSpec">type routeSpec struct</a>

```
searchKey: apiclient.routeSpec
tags: [struct private]
```

```Go
type routeSpec struct {
	expectedMethod   string
	expectedPath     string
	expectedUsername string
	expectedPassword string
	expectedPayload  string
	responseStatus   int
	responsePayload  string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="MakeJSONRequest" href="#MakeJSONRequest">func MakeJSONRequest(method string, url *url.URL, payload interface{}) (*http.Request, error)</a>

```
searchKey: apiclient.MakeJSONRequest
tags: [method]
```

```Go
func MakeJSONRequest(method string, url *url.URL, payload interface{}) (*http.Request, error)
```

MakeJSONRequest creates an HTTP request with the given payload serialized as JSON. This will also ensure that the proper content type header (which is necessary, not pedantic). 

### <a id="TestAddExecutionLogEntry" href="#TestAddExecutionLogEntry">func TestAddExecutionLogEntry(t *testing.T)</a>

```
searchKey: apiclient.TestAddExecutionLogEntry
tags: [method private test]
```

```Go
func TestAddExecutionLogEntry(t *testing.T)
```

### <a id="TestAddExecutionLogEntryBadResponse" href="#TestAddExecutionLogEntryBadResponse">func TestAddExecutionLogEntryBadResponse(t *testing.T)</a>

```
searchKey: apiclient.TestAddExecutionLogEntryBadResponse
tags: [method private test]
```

```Go
func TestAddExecutionLogEntryBadResponse(t *testing.T)
```

### <a id="TestDequeue" href="#TestDequeue">func TestDequeue(t *testing.T)</a>

```
searchKey: apiclient.TestDequeue
tags: [method private test]
```

```Go
func TestDequeue(t *testing.T)
```

### <a id="TestDequeueBadResponse" href="#TestDequeueBadResponse">func TestDequeueBadResponse(t *testing.T)</a>

```
searchKey: apiclient.TestDequeueBadResponse
tags: [method private test]
```

```Go
func TestDequeueBadResponse(t *testing.T)
```

### <a id="TestDequeueNoRecord" href="#TestDequeueNoRecord">func TestDequeueNoRecord(t *testing.T)</a>

```
searchKey: apiclient.TestDequeueNoRecord
tags: [method private test]
```

```Go
func TestDequeueNoRecord(t *testing.T)
```

### <a id="TestHeartbeat" href="#TestHeartbeat">func TestHeartbeat(t *testing.T)</a>

```
searchKey: apiclient.TestHeartbeat
tags: [method private test]
```

```Go
func TestHeartbeat(t *testing.T)
```

### <a id="TestHeartbeatBadResponse" href="#TestHeartbeatBadResponse">func TestHeartbeatBadResponse(t *testing.T)</a>

```
searchKey: apiclient.TestHeartbeatBadResponse
tags: [method private test]
```

```Go
func TestHeartbeatBadResponse(t *testing.T)
```

### <a id="TestMarkComplete" href="#TestMarkComplete">func TestMarkComplete(t *testing.T)</a>

```
searchKey: apiclient.TestMarkComplete
tags: [method private test]
```

```Go
func TestMarkComplete(t *testing.T)
```

### <a id="TestMarkCompleteBadResponse" href="#TestMarkCompleteBadResponse">func TestMarkCompleteBadResponse(t *testing.T)</a>

```
searchKey: apiclient.TestMarkCompleteBadResponse
tags: [method private test]
```

```Go
func TestMarkCompleteBadResponse(t *testing.T)
```

### <a id="TestMarkErrored" href="#TestMarkErrored">func TestMarkErrored(t *testing.T)</a>

```
searchKey: apiclient.TestMarkErrored
tags: [method private test]
```

```Go
func TestMarkErrored(t *testing.T)
```

### <a id="TestMarkErroredBadResponse" href="#TestMarkErroredBadResponse">func TestMarkErroredBadResponse(t *testing.T)</a>

```
searchKey: apiclient.TestMarkErroredBadResponse
tags: [method private test]
```

```Go
func TestMarkErroredBadResponse(t *testing.T)
```

### <a id="TestMarkFailed" href="#TestMarkFailed">func TestMarkFailed(t *testing.T)</a>

```
searchKey: apiclient.TestMarkFailed
tags: [method private test]
```

```Go
func TestMarkFailed(t *testing.T)
```

### <a id="intsToString" href="#intsToString">func intsToString(ints []int) string</a>

```
searchKey: apiclient.intsToString
tags: [method private]
```

```Go
func intsToString(ints []int) string
```

### <a id="makeHTTPClient" href="#makeHTTPClient">func makeHTTPClient(transport http.RoundTripper) *http.Client</a>

```
searchKey: apiclient.makeHTTPClient
tags: [method private]
```

```Go
func makeHTTPClient(transport http.RoundTripper) *http.Client
```

makeHTTPClient creates an HTTP client with the given round tripper. 

### <a id="makeRelativeURL" href="#makeRelativeURL">func makeRelativeURL(base string, path ...string) (*url.URL, error)</a>

```
searchKey: apiclient.makeRelativeURL
tags: [method private]
```

```Go
func makeRelativeURL(base string, path ...string) (*url.URL, error)
```

### <a id="makeURL" href="#makeURL">func makeURL(base, username, password string, path ...string) (*url.URL, error)</a>

```
searchKey: apiclient.makeURL
tags: [method private]
```

```Go
func makeURL(base, username, password string, path ...string) (*url.URL, error)
```

### <a id="normalizeJSON" href="#normalizeJSON">func normalizeJSON(v []byte) string</a>

```
searchKey: apiclient.normalizeJSON
tags: [method private]
```

```Go
func normalizeJSON(v []byte) string
```

### <a id="testRoute" href="#testRoute">func testRoute(t *testing.T, spec routeSpec, f func(client *Client))</a>

```
searchKey: apiclient.testRoute
tags: [method private]
```

```Go
func testRoute(t *testing.T, spec routeSpec, f func(client *Client))
```

### <a id="testServer" href="#testServer">func testServer(t *testing.T, spec routeSpec) *httptest.Server</a>

```
searchKey: apiclient.testServer
tags: [method private]
```

```Go
func testServer(t *testing.T, spec routeSpec) *httptest.Server
```

