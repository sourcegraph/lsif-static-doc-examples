# Package srcprometheus

Package srcprometheus defines an API to interact with Sourcegraph Prometheus, including prom-wrapper. See [https://docs.sourcegraph.com/dev/background-information/observability/prometheus](https://docs.sourcegraph.com/dev/background-information/observability/prometheus) 

## Index

* [Constants](#const)
    * [const EndpointAlertsStatus](#EndpointAlertsStatus)
    * [const EndpointAlertsStatusHistory](#EndpointAlertsStatusHistory)
    * [const EndpointConfigSubscriber](#EndpointConfigSubscriber)
* [Variables](#var)
    * [var ErrPrometheusUnavailable](#ErrPrometheusUnavailable)
    * [var PrometheusURL](#PrometheusURL)
* [Types](#type)
    * [type AlertsHistory struct](#AlertsHistory)
    * [type AlertsStatus struct](#AlertsStatus)
    * [type Client interface](#Client)
        * [func NewClient(prometheusURL string) (Client, error)](#NewClient)
    * [type ConfigStatus struct](#ConfigStatus)
    * [type MonitoringAlert struct](#MonitoringAlert)
    * [type MonitoringAlerts []*srcprometheus.MonitoringAlert](#MonitoringAlerts)
        * [func (a MonitoringAlerts) Len() int](#MonitoringAlerts.Len)
        * [func (a MonitoringAlerts) Less(i, j int) bool](#MonitoringAlerts.Less)
        * [func (a MonitoringAlerts) Swap(i, j int)](#MonitoringAlerts.Swap)
    * [type client struct](#client)
        * [func (c *client) GetAlertsHistory(ctx context.Context, timespan time.Duration) (*AlertsHistory, error)](#client.GetAlertsHistory)
        * [func (c *client) GetAlertsStatus(ctx context.Context) (*AlertsStatus, error)](#client.GetAlertsStatus)
        * [func (c *client) GetConfigStatus(ctx context.Context) (*ConfigStatus, error)](#client.GetConfigStatus)
        * [func (c *client) do(ctx context.Context, req *http.Request) (*http.Response, error)](#client.do)
        * [func (c *client) newRequest(endpoint string, query url.Values) (*http.Request, error)](#client.newRequest)
    * [type roundTripper struct{}](#roundTripper)
        * [func (r *roundTripper) RoundTrip(req *http.Request) (*http.Response, error)](#roundTripper.RoundTrip)
* [Functions](#func)
    * [func Test_roundTripper_PrometheusUnavailable(t *testing.T)](#Test_roundTripper_PrometheusUnavailable)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="EndpointAlertsStatus" href="#EndpointAlertsStatus">const EndpointAlertsStatus</a>

```
searchKey: srcprometheus.EndpointAlertsStatus
tags: [constant string]
```

```Go
const EndpointAlertsStatus = "/prom-wrapper/alerts-status"
```

### <a id="EndpointAlertsStatusHistory" href="#EndpointAlertsStatusHistory">const EndpointAlertsStatusHistory</a>

```
searchKey: srcprometheus.EndpointAlertsStatusHistory
tags: [constant string]
```

```Go
const EndpointAlertsStatusHistory = EndpointAlertsStatus + "/history"
```

### <a id="EndpointConfigSubscriber" href="#EndpointConfigSubscriber">const EndpointConfigSubscriber</a>

```
searchKey: srcprometheus.EndpointConfigSubscriber
tags: [constant string]
```

```Go
const EndpointConfigSubscriber = "/prom-wrapper/config-subscriber"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrPrometheusUnavailable" href="#ErrPrometheusUnavailable">var ErrPrometheusUnavailable</a>

```
searchKey: srcprometheus.ErrPrometheusUnavailable
tags: [variable interface]
```

```Go
var ErrPrometheusUnavailable = errors.New("prometheus API is unavailable")
```

ErrPrometheusUnavailable is raised specifically when prometheusURL is unset or when prometheus API access times out, both of which indicate that the server API has likely been configured to explicitly disallow access to prometheus, or that prometheus is not deployed at all. The website checks for this error in `fetchMonitoringStats`, for example. 

### <a id="PrometheusURL" href="#PrometheusURL">var PrometheusURL</a>

```
searchKey: srcprometheus.PrometheusURL
tags: [variable string]
```

```Go
var PrometheusURL = env.Get("PROMETHEUS_URL", "", "prometheus server URL")
```

PrometheusURL is the configured Prometheus instance. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="AlertsHistory" href="#AlertsHistory">type AlertsHistory struct</a>

```
searchKey: srcprometheus.AlertsHistory
tags: [struct]
```

```Go
type AlertsHistory struct {
	Alerts MonitoringAlerts `json:"alerts"`
}
```

### <a id="AlertsStatus" href="#AlertsStatus">type AlertsStatus struct</a>

```
searchKey: srcprometheus.AlertsStatus
tags: [struct]
```

```Go
type AlertsStatus struct {
	Warning          int `json:"warning"`
	Silenced         int `json:"silenced"`
	Critical         int `json:"critical"`
	ServicesCritical int `json:"services_critical"`
}
```

### <a id="Client" href="#Client">type Client interface</a>

```
searchKey: srcprometheus.Client
tags: [interface]
```

```Go
type Client interface {
	GetAlertsStatus(ctx context.Context) (*AlertsStatus, error)
	GetAlertsHistory(ctx context.Context, timespan time.Duration) (*AlertsHistory, error)
	GetConfigStatus(ctx context.Context) (*ConfigStatus, error)
}
```

Client provides the interface for interacting with Sourcegraph Prometheus, including prom-wrapper. See [https://docs.sourcegraph.com/dev/background-information/observability/prometheus](https://docs.sourcegraph.com/dev/background-information/observability/prometheus) 

#### <a id="NewClient" href="#NewClient">func NewClient(prometheusURL string) (Client, error)</a>

```
searchKey: srcprometheus.NewClient
tags: [function]
```

```Go
func NewClient(prometheusURL string) (Client, error)
```

NewClient provides a client for interacting with Sourcegraph Prometheus. It errors if the target Prometheus URL is invalid, or if no Prometheus URL is configured at all. Users should check for the latter case by asserting against `ErrPrometheusUnavailable` to avoid rendering an error. 

See [https://docs.sourcegraph.com/dev/background-information/observability/prometheus](https://docs.sourcegraph.com/dev/background-information/observability/prometheus) 

### <a id="ConfigStatus" href="#ConfigStatus">type ConfigStatus struct</a>

```
searchKey: srcprometheus.ConfigStatus
tags: [struct]
```

```Go
type ConfigStatus struct {
	Problems conf.Problems `json:"problems"`
}
```

### <a id="MonitoringAlert" href="#MonitoringAlert">type MonitoringAlert struct</a>

```
searchKey: srcprometheus.MonitoringAlert
tags: [struct]
```

```Go
type MonitoringAlert struct {
	TimestampValue   time.Time `json:"timestamp"`
	NameValue        string    `json:"name"`
	ServiceNameValue string    `json:"service_name"`
	OwnerValue       string    `json:"owner"`
	// AverageValue indicates average over past 12 hours, see alertsHistoryQuery and GraphQL schema docs for MonitoringAlert
	AverageValue float64 `json:"average"`
}
```

MonitoringAlert implements the GraphQL type MonitoringAlert. 

Internal fields named to accomodate GraphQL getters and setters, see grapqhlbackend.MonitoringAlert 

### <a id="MonitoringAlerts" href="#MonitoringAlerts">type MonitoringAlerts []*srcprometheus.MonitoringAlert</a>

```
searchKey: srcprometheus.MonitoringAlerts
tags: [array struct]
```

```Go
type MonitoringAlerts []*MonitoringAlert
```

#### <a id="MonitoringAlerts.Len" href="#MonitoringAlerts.Len">func (a MonitoringAlerts) Len() int</a>

```
searchKey: srcprometheus.MonitoringAlerts.Len
tags: [method]
```

```Go
func (a MonitoringAlerts) Len() int
```

#### <a id="MonitoringAlerts.Less" href="#MonitoringAlerts.Less">func (a MonitoringAlerts) Less(i, j int) bool</a>

```
searchKey: srcprometheus.MonitoringAlerts.Less
tags: [method]
```

```Go
func (a MonitoringAlerts) Less(i, j int) bool
```

Less determined by timestamp -> serviceName -> alert name 

#### <a id="MonitoringAlerts.Swap" href="#MonitoringAlerts.Swap">func (a MonitoringAlerts) Swap(i, j int)</a>

```
searchKey: srcprometheus.MonitoringAlerts.Swap
tags: [method]
```

```Go
func (a MonitoringAlerts) Swap(i, j int)
```

### <a id="client" href="#client">type client struct</a>

```
searchKey: srcprometheus.client
tags: [struct private]
```

```Go
type client struct {
	http    http.Client
	promURL url.URL
}
```

#### <a id="client.GetAlertsHistory" href="#client.GetAlertsHistory">func (c *client) GetAlertsHistory(ctx context.Context, timespan time.Duration) (*AlertsHistory, error)</a>

```
searchKey: srcprometheus.client.GetAlertsHistory
tags: [method private]
```

```Go
func (c *client) GetAlertsHistory(ctx context.Context, timespan time.Duration) (*AlertsHistory, error)
```

GetAlertsHistory retrieves a historical summary of all alerts 

#### <a id="client.GetAlertsStatus" href="#client.GetAlertsStatus">func (c *client) GetAlertsStatus(ctx context.Context) (*AlertsStatus, error)</a>

```
searchKey: srcprometheus.client.GetAlertsStatus
tags: [method private]
```

```Go
func (c *client) GetAlertsStatus(ctx context.Context) (*AlertsStatus, error)
```

GetAlertsStatus retrieves an overview of current alerts 

#### <a id="client.GetConfigStatus" href="#client.GetConfigStatus">func (c *client) GetConfigStatus(ctx context.Context) (*ConfigStatus, error)</a>

```
searchKey: srcprometheus.client.GetConfigStatus
tags: [method private]
```

```Go
func (c *client) GetConfigStatus(ctx context.Context) (*ConfigStatus, error)
```

#### <a id="client.do" href="#client.do">func (c *client) do(ctx context.Context, req *http.Request) (*http.Response, error)</a>

```
searchKey: srcprometheus.client.do
tags: [method private]
```

```Go
func (c *client) do(ctx context.Context, req *http.Request) (*http.Response, error)
```

#### <a id="client.newRequest" href="#client.newRequest">func (c *client) newRequest(endpoint string, query url.Values) (*http.Request, error)</a>

```
searchKey: srcprometheus.client.newRequest
tags: [method private]
```

```Go
func (c *client) newRequest(endpoint string, query url.Values) (*http.Request, error)
```

### <a id="roundTripper" href="#roundTripper">type roundTripper struct{}</a>

```
searchKey: srcprometheus.roundTripper
tags: [struct private]
```

```Go
type roundTripper struct{}
```

roundTripper treats certain connection errors as `ErrPrometheusUnavailable` which can be handled explicitly for environments without Prometheus available. 

#### <a id="roundTripper.RoundTrip" href="#roundTripper.RoundTrip">func (r *roundTripper) RoundTrip(req *http.Request) (*http.Response, error)</a>

```
searchKey: srcprometheus.roundTripper.RoundTrip
tags: [method private]
```

```Go
func (r *roundTripper) RoundTrip(req *http.Request) (*http.Response, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Test_roundTripper_PrometheusUnavailable" href="#Test_roundTripper_PrometheusUnavailable">func Test_roundTripper_PrometheusUnavailable(t *testing.T)</a>

```
searchKey: srcprometheus.Test_roundTripper_PrometheusUnavailable
tags: [function private test]
```

```Go
func Test_roundTripper_PrometheusUnavailable(t *testing.T)
```

test detection of "prometheus unavailable" 

