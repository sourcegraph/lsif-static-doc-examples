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
    * [type Client interface](#Client)
        * [func NewClient(prometheusURL string) (Client, error)](#NewClient)
    * [type client struct](#client)
        * [func (c *client) newRequest(endpoint string, query url.Values) (*http.Request, error)](#client.newRequest)
        * [func (c *client) do(ctx context.Context, req *http.Request) (*http.Response, error)](#client.do)
        * [func (c *client) GetAlertsStatus(ctx context.Context) (*AlertsStatus, error)](#client.GetAlertsStatus)
        * [func (c *client) GetAlertsHistory(ctx context.Context, timespan time.Duration) (*AlertsHistory, error)](#client.GetAlertsHistory)
        * [func (c *client) GetConfigStatus(ctx context.Context) (*ConfigStatus, error)](#client.GetConfigStatus)
    * [type roundTripper struct{}](#roundTripper)
        * [func (r *roundTripper) RoundTrip(req *http.Request) (*http.Response, error)](#roundTripper.RoundTrip)
    * [type AlertsStatus struct](#AlertsStatus)
    * [type MonitoringAlert struct](#MonitoringAlert)
    * [type MonitoringAlerts []*srcprometheus.MonitoringAlert](#MonitoringAlerts)
        * [func (a MonitoringAlerts) Less(i, j int) bool](#MonitoringAlerts.Less)
        * [func (a MonitoringAlerts) Swap(i, j int)](#MonitoringAlerts.Swap)
        * [func (a MonitoringAlerts) Len() int](#MonitoringAlerts.Len)
    * [type AlertsHistory struct](#AlertsHistory)
    * [type ConfigStatus struct](#ConfigStatus)
* [Functions](#func)
    * [func Test_roundTripper_PrometheusUnavailable(t *testing.T)](#Test_roundTripper_PrometheusUnavailable)


## <a id="const" href="#const">Constants</a>

### <a id="EndpointAlertsStatus" href="#EndpointAlertsStatus">const EndpointAlertsStatus</a>

```
searchKey: srcprometheus.EndpointAlertsStatus
tags: [exported]
```

```Go
const EndpointAlertsStatus = "/prom-wrapper/alerts-status"
```

### <a id="EndpointAlertsStatusHistory" href="#EndpointAlertsStatusHistory">const EndpointAlertsStatusHistory</a>

```
searchKey: srcprometheus.EndpointAlertsStatusHistory
tags: [exported]
```

```Go
const EndpointAlertsStatusHistory = EndpointAlertsStatus + "/history"
```

### <a id="EndpointConfigSubscriber" href="#EndpointConfigSubscriber">const EndpointConfigSubscriber</a>

```
searchKey: srcprometheus.EndpointConfigSubscriber
tags: [exported]
```

```Go
const EndpointConfigSubscriber = "/prom-wrapper/config-subscriber"
```

## <a id="var" href="#var">Variables</a>

### <a id="ErrPrometheusUnavailable" href="#ErrPrometheusUnavailable">var ErrPrometheusUnavailable</a>

```
searchKey: srcprometheus.ErrPrometheusUnavailable
tags: [exported]
```

```Go
var ErrPrometheusUnavailable = errors.New("prometheus API is unavailable")
```

ErrPrometheusUnavailable is raised specifically when prometheusURL is unset or when prometheus API access times out, both of which indicate that the server API has likely been configured to explicitly disallow access to prometheus, or that prometheus is not deployed at all. The website checks for this error in `fetchMonitoringStats`, for example. 

### <a id="PrometheusURL" href="#PrometheusURL">var PrometheusURL</a>

```
searchKey: srcprometheus.PrometheusURL
tags: [exported]
```

```Go
var PrometheusURL = env.Get("PROMETHEUS_URL", "", "prometheus server URL")
```

PrometheusURL is the configured Prometheus instance. 

## <a id="type" href="#type">Types</a>

### <a id="Client" href="#Client">type Client interface</a>

```
searchKey: srcprometheus.Client
tags: [exported]
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
tags: [exported]
```

```Go
func NewClient(prometheusURL string) (Client, error)
```

NewClient provides a client for interacting with Sourcegraph Prometheus. It errors if the target Prometheus URL is invalid, or if no Prometheus URL is configured at all. Users should check for the latter case by asserting against `ErrPrometheusUnavailable` to avoid rendering an error. 

See [https://docs.sourcegraph.com/dev/background-information/observability/prometheus](https://docs.sourcegraph.com/dev/background-information/observability/prometheus) 

### <a id="client" href="#client">type client struct</a>

```
searchKey: srcprometheus.client
```

```Go
type client struct {
	http    http.Client
	promURL url.URL
}
```

#### <a id="client.newRequest" href="#client.newRequest">func (c *client) newRequest(endpoint string, query url.Values) (*http.Request, error)</a>

```
searchKey: srcprometheus.client.newRequest
```

```Go
func (c *client) newRequest(endpoint string, query url.Values) (*http.Request, error)
```

#### <a id="client.do" href="#client.do">func (c *client) do(ctx context.Context, req *http.Request) (*http.Response, error)</a>

```
searchKey: srcprometheus.client.do
```

```Go
func (c *client) do(ctx context.Context, req *http.Request) (*http.Response, error)
```

#### <a id="client.GetAlertsStatus" href="#client.GetAlertsStatus">func (c *client) GetAlertsStatus(ctx context.Context) (*AlertsStatus, error)</a>

```
searchKey: srcprometheus.client.GetAlertsStatus
```

```Go
func (c *client) GetAlertsStatus(ctx context.Context) (*AlertsStatus, error)
```

GetAlertsStatus retrieves an overview of current alerts 

#### <a id="client.GetAlertsHistory" href="#client.GetAlertsHistory">func (c *client) GetAlertsHistory(ctx context.Context, timespan time.Duration) (*AlertsHistory, error)</a>

```
searchKey: srcprometheus.client.GetAlertsHistory
```

```Go
func (c *client) GetAlertsHistory(ctx context.Context, timespan time.Duration) (*AlertsHistory, error)
```

GetAlertsHistory retrieves a historical summary of all alerts 

#### <a id="client.GetConfigStatus" href="#client.GetConfigStatus">func (c *client) GetConfigStatus(ctx context.Context) (*ConfigStatus, error)</a>

```
searchKey: srcprometheus.client.GetConfigStatus
```

```Go
func (c *client) GetConfigStatus(ctx context.Context) (*ConfigStatus, error)
```

### <a id="roundTripper" href="#roundTripper">type roundTripper struct{}</a>

```
searchKey: srcprometheus.roundTripper
```

```Go
type roundTripper struct{}
```

roundTripper treats certain connection errors as `ErrPrometheusUnavailable` which can be handled explicitly for environments without Prometheus available. 

#### <a id="roundTripper.RoundTrip" href="#roundTripper.RoundTrip">func (r *roundTripper) RoundTrip(req *http.Request) (*http.Response, error)</a>

```
searchKey: srcprometheus.roundTripper.RoundTrip
```

```Go
func (r *roundTripper) RoundTrip(req *http.Request) (*http.Response, error)
```

### <a id="AlertsStatus" href="#AlertsStatus">type AlertsStatus struct</a>

```
searchKey: srcprometheus.AlertsStatus
tags: [exported]
```

```Go
type AlertsStatus struct {
	Warning          int `json:"warning"`
	Silenced         int `json:"silenced"`
	Critical         int `json:"critical"`
	ServicesCritical int `json:"services_critical"`
}
```

### <a id="MonitoringAlert" href="#MonitoringAlert">type MonitoringAlert struct</a>

```
searchKey: srcprometheus.MonitoringAlert
tags: [exported]
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
tags: [exported]
```

```Go
type MonitoringAlerts []*MonitoringAlert
```

#### <a id="MonitoringAlerts.Less" href="#MonitoringAlerts.Less">func (a MonitoringAlerts) Less(i, j int) bool</a>

```
searchKey: srcprometheus.MonitoringAlerts.Less
tags: [exported]
```

```Go
func (a MonitoringAlerts) Less(i, j int) bool
```

Less determined by timestamp -> serviceName -> alert name 

#### <a id="MonitoringAlerts.Swap" href="#MonitoringAlerts.Swap">func (a MonitoringAlerts) Swap(i, j int)</a>

```
searchKey: srcprometheus.MonitoringAlerts.Swap
tags: [exported]
```

```Go
func (a MonitoringAlerts) Swap(i, j int)
```

#### <a id="MonitoringAlerts.Len" href="#MonitoringAlerts.Len">func (a MonitoringAlerts) Len() int</a>

```
searchKey: srcprometheus.MonitoringAlerts.Len
tags: [exported]
```

```Go
func (a MonitoringAlerts) Len() int
```

### <a id="AlertsHistory" href="#AlertsHistory">type AlertsHistory struct</a>

```
searchKey: srcprometheus.AlertsHistory
tags: [exported]
```

```Go
type AlertsHistory struct {
	Alerts MonitoringAlerts `json:"alerts"`
}
```

### <a id="ConfigStatus" href="#ConfigStatus">type ConfigStatus struct</a>

```
searchKey: srcprometheus.ConfigStatus
tags: [exported]
```

```Go
type ConfigStatus struct {
	Problems conf.Problems `json:"problems"`
}
```

## <a id="func" href="#func">Functions</a>

### <a id="Test_roundTripper_PrometheusUnavailable" href="#Test_roundTripper_PrometheusUnavailable">func Test_roundTripper_PrometheusUnavailable(t *testing.T)</a>

```
searchKey: srcprometheus.Test_roundTripper_PrometheusUnavailable
```

```Go
func Test_roundTripper_PrometheusUnavailable(t *testing.T)
```

test detection of "prometheus unavailable" 

