# Package metrics

## Index

* [Variables](#var)
    * [var TestRegisterer](#TestRegisterer)
    * [var registerer](#registerer)
* [Types](#type)
    * [type testRegisterer struct{}](#testRegisterer)
        * [func (testRegisterer) Register(prometheus.Collector) error](#testRegisterer.Register)
        * [func (testRegisterer) MustRegister(...prometheus.Collector)](#testRegisterer.MustRegister)
        * [func (testRegisterer) Unregister(prometheus.Collector) bool](#testRegisterer.Unregister)
    * [type RequestMeter struct](#RequestMeter)
        * [func NewRequestMeter(subsystem, help string) *RequestMeter](#NewRequestMeter)
        * [func (rm *RequestMeter) Transport(transport http.RoundTripper, categoryFunc func(*url.URL) string) http.RoundTripper](#RequestMeter.Transport)
        * [func (rm *RequestMeter) Doer(cli httpcli.Doer, categoryFunc func(*url.URL) string) httpcli.Doer](#RequestMeter.Doer)
    * [type requestCounterMiddleware struct](#requestCounterMiddleware)
        * [func (t *requestCounterMiddleware) RoundTrip(r *http.Request) (resp *http.Response, err error)](#requestCounterMiddleware.RoundTrip)
        * [func (t *requestCounterMiddleware) Do(req *http.Request) (*http.Response, error)](#requestCounterMiddleware.Do)
    * [type OperationMetrics struct](#OperationMetrics)
        * [func NewOperationMetrics(r prometheus.Registerer, metricPrefix string, fns ...OperationMetricsOption) *OperationMetrics](#NewOperationMetrics)
        * [func (m *OperationMetrics) Observe(secs, count float64, err *error, lvals ...string)](#OperationMetrics.Observe)
    * [type operationMetricOptions struct](#operationMetricOptions)
    * [type OperationMetricsOption func(o *github.com/sourcegraph/sourcegraph/internal/metrics.operationMetricOptions)](#OperationMetricsOption)
        * [func WithSubsystem(subsystem string) OperationMetricsOption](#WithSubsystem)
        * [func WithDurationHelp(text string) OperationMetricsOption](#WithDurationHelp)
        * [func WithCountHelp(text string) OperationMetricsOption](#WithCountHelp)
        * [func WithErrorsHelp(text string) OperationMetricsOption](#WithErrorsHelp)
        * [func WithLabels(labels ...string) OperationMetricsOption](#WithLabels)
    * [type SingletonOperationMetrics struct](#SingletonOperationMetrics)
        * [func (m *SingletonOperationMetrics) Get(create func() *OperationMetrics) *OperationMetrics](#SingletonOperationMetrics.Get)
* [Functions](#func)
    * [func MustRegisterDiskMonitor(path string)](#MustRegisterDiskMonitor)
    * [func mustRegisterOnce(c prometheus.Collector)](#mustRegisterOnce)
    * [func testingHTTPClient(handler http.Handler) (*http.Client, func())](#testingHTTPClient)
    * [func doRequest(hc *http.Client, u string) error](#doRequest)
    * [func TestRequestMeterTransport(t *testing.T)](#TestRequestMeterTransport)
    * [func TestMustRegisterDiskMonitor(t *testing.T)](#TestMustRegisterDiskMonitor)


## <a id="var" href="#var">Variables</a>

### <a id="TestRegisterer" href="#TestRegisterer">var TestRegisterer</a>

```
searchKey: metrics.TestRegisterer
tags: [exported]
```

```Go
var TestRegisterer prometheus.Registerer = testRegisterer{}
```

TestRegisterer is a behaviorless Prometheus Registerer usable for unit tests. 

### <a id="registerer" href="#registerer">var registerer</a>

```
searchKey: metrics.registerer
```

```Go
var registerer = prometheus.DefaultRegisterer
```

registerer exists so we can override it in tests 

## <a id="type" href="#type">Types</a>

### <a id="testRegisterer" href="#testRegisterer">type testRegisterer struct{}</a>

```
searchKey: metrics.testRegisterer
```

```Go
type testRegisterer struct{}
```

#### <a id="testRegisterer.Register" href="#testRegisterer.Register">func (testRegisterer) Register(prometheus.Collector) error</a>

```
searchKey: metrics.testRegisterer.Register
```

```Go
func (testRegisterer) Register(prometheus.Collector) error
```

#### <a id="testRegisterer.MustRegister" href="#testRegisterer.MustRegister">func (testRegisterer) MustRegister(...prometheus.Collector)</a>

```
searchKey: metrics.testRegisterer.MustRegister
```

```Go
func (testRegisterer) MustRegister(...prometheus.Collector)
```

#### <a id="testRegisterer.Unregister" href="#testRegisterer.Unregister">func (testRegisterer) Unregister(prometheus.Collector) bool</a>

```
searchKey: metrics.testRegisterer.Unregister
```

```Go
func (testRegisterer) Unregister(prometheus.Collector) bool
```

### <a id="RequestMeter" href="#RequestMeter">type RequestMeter struct</a>

```
searchKey: metrics.RequestMeter
tags: [exported]
```

```Go
type RequestMeter struct {
	counter   *prometheus.CounterVec
	duration  *prometheus.HistogramVec
	subsystem string
}
```

RequestMeter wraps a Prometheus request meter (counter + duration histogram) updated by requests made by derived http.RoundTrippers. 

#### <a id="NewRequestMeter" href="#NewRequestMeter">func NewRequestMeter(subsystem, help string) *RequestMeter</a>

```
searchKey: metrics.NewRequestMeter
tags: [exported]
```

```Go
func NewRequestMeter(subsystem, help string) *RequestMeter
```

NewRequestMeter creates a new request meter. 

#### <a id="RequestMeter.Transport" href="#RequestMeter.Transport">func (rm *RequestMeter) Transport(transport http.RoundTripper, categoryFunc func(*url.URL) string) http.RoundTripper</a>

```
searchKey: metrics.RequestMeter.Transport
tags: [exported]
```

```Go
func (rm *RequestMeter) Transport(transport http.RoundTripper, categoryFunc func(*url.URL) string) http.RoundTripper
```

Transport returns an http.RoundTripper that updates rm for each request. The categoryFunc is called to determine the category label for each request. 

#### <a id="RequestMeter.Doer" href="#RequestMeter.Doer">func (rm *RequestMeter) Doer(cli httpcli.Doer, categoryFunc func(*url.URL) string) httpcli.Doer</a>

```
searchKey: metrics.RequestMeter.Doer
tags: [exported]
```

```Go
func (rm *RequestMeter) Doer(cli httpcli.Doer, categoryFunc func(*url.URL) string) httpcli.Doer
```

Doer returns an httpcli.Doer that updates rm for each request. The categoryFunc is called to determine the category label for each request. 

### <a id="requestCounterMiddleware" href="#requestCounterMiddleware">type requestCounterMiddleware struct</a>

```
searchKey: metrics.requestCounterMiddleware
```

```Go
type requestCounterMiddleware struct {
	meter        *RequestMeter
	cli          httpcli.Doer
	transport    http.RoundTripper
	categoryFunc func(*url.URL) string
}
```

#### <a id="requestCounterMiddleware.RoundTrip" href="#requestCounterMiddleware.RoundTrip">func (t *requestCounterMiddleware) RoundTrip(r *http.Request) (resp *http.Response, err error)</a>

```
searchKey: metrics.requestCounterMiddleware.RoundTrip
```

```Go
func (t *requestCounterMiddleware) RoundTrip(r *http.Request) (resp *http.Response, err error)
```

#### <a id="requestCounterMiddleware.Do" href="#requestCounterMiddleware.Do">func (t *requestCounterMiddleware) Do(req *http.Request) (*http.Response, error)</a>

```
searchKey: metrics.requestCounterMiddleware.Do
```

```Go
func (t *requestCounterMiddleware) Do(req *http.Request) (*http.Response, error)
```

### <a id="OperationMetrics" href="#OperationMetrics">type OperationMetrics struct</a>

```
searchKey: metrics.OperationMetrics
tags: [exported]
```

```Go
type OperationMetrics struct {
	Duration *prometheus.HistogramVec // How long did it take?
	Count    *prometheus.CounterVec   // How many things were processed?
	Errors   *prometheus.CounterVec   // How many errors occurred?
}
```

OperationMetrics contains three common metrics for any operation. 

#### <a id="NewOperationMetrics" href="#NewOperationMetrics">func NewOperationMetrics(r prometheus.Registerer, metricPrefix string, fns ...OperationMetricsOption) *OperationMetrics</a>

```
searchKey: metrics.NewOperationMetrics
tags: [exported]
```

```Go
func NewOperationMetrics(r prometheus.Registerer, metricPrefix string, fns ...OperationMetricsOption) *OperationMetrics
```

NewOperationMetrics creates an OperationMetrics value. The metrics will be immediately registered to the given registerer. This method panics on registration error. The supplied metricPrefix should be underscore_cased as it is used in the metric name. 

#### <a id="OperationMetrics.Observe" href="#OperationMetrics.Observe">func (m *OperationMetrics) Observe(secs, count float64, err *error, lvals ...string)</a>

```
searchKey: metrics.OperationMetrics.Observe
tags: [exported]
```

```Go
func (m *OperationMetrics) Observe(secs, count float64, err *error, lvals ...string)
```

Observe registers an observation of a single operation. 

### <a id="operationMetricOptions" href="#operationMetricOptions">type operationMetricOptions struct</a>

```
searchKey: metrics.operationMetricOptions
```

```Go
type operationMetricOptions struct {
	subsystem    string
	durationHelp string
	countHelp    string
	errorsHelp   string
	labels       []string
}
```

### <a id="OperationMetricsOption" href="#OperationMetricsOption">type OperationMetricsOption func(o *github.com/sourcegraph/sourcegraph/internal/metrics.operationMetricOptions)</a>

```
searchKey: metrics.OperationMetricsOption
tags: [exported]
```

```Go
type OperationMetricsOption func(o *operationMetricOptions)
```

OperationMetricsOption alter the default behavior of NewOperationMetrics. 

#### <a id="WithSubsystem" href="#WithSubsystem">func WithSubsystem(subsystem string) OperationMetricsOption</a>

```
searchKey: metrics.WithSubsystem
tags: [exported]
```

```Go
func WithSubsystem(subsystem string) OperationMetricsOption
```

WithSubsystem overrides the default subsystem for all metrics. 

#### <a id="WithDurationHelp" href="#WithDurationHelp">func WithDurationHelp(text string) OperationMetricsOption</a>

```
searchKey: metrics.WithDurationHelp
tags: [exported]
```

```Go
func WithDurationHelp(text string) OperationMetricsOption
```

WithDurationHelp overrides the default help text for duration metrics. 

#### <a id="WithCountHelp" href="#WithCountHelp">func WithCountHelp(text string) OperationMetricsOption</a>

```
searchKey: metrics.WithCountHelp
tags: [exported]
```

```Go
func WithCountHelp(text string) OperationMetricsOption
```

WithCountHelp overrides the default help text for count metrics. 

#### <a id="WithErrorsHelp" href="#WithErrorsHelp">func WithErrorsHelp(text string) OperationMetricsOption</a>

```
searchKey: metrics.WithErrorsHelp
tags: [exported]
```

```Go
func WithErrorsHelp(text string) OperationMetricsOption
```

WithErrorsHelp overrides the default help text for errors metrics. 

#### <a id="WithLabels" href="#WithLabels">func WithLabels(labels ...string) OperationMetricsOption</a>

```
searchKey: metrics.WithLabels
tags: [exported]
```

```Go
func WithLabels(labels ...string) OperationMetricsOption
```

WithLabels overrides the default labels for all metrics. 

### <a id="SingletonOperationMetrics" href="#SingletonOperationMetrics">type SingletonOperationMetrics struct</a>

```
searchKey: metrics.SingletonOperationMetrics
tags: [exported]
```

```Go
type SingletonOperationMetrics struct {
	sync.Once
	metrics *OperationMetrics
}
```

#### <a id="SingletonOperationMetrics.Get" href="#SingletonOperationMetrics.Get">func (m *SingletonOperationMetrics) Get(create func() *OperationMetrics) *OperationMetrics</a>

```
searchKey: metrics.SingletonOperationMetrics.Get
tags: [exported]
```

```Go
func (m *SingletonOperationMetrics) Get(create func() *OperationMetrics) *OperationMetrics
```

SingletonOperationMetrics returns an operation metrics instance. If no instance has been created yet, one is constructed with the given create function. This method is safe to access concurrently. 

## <a id="func" href="#func">Functions</a>

### <a id="MustRegisterDiskMonitor" href="#MustRegisterDiskMonitor">func MustRegisterDiskMonitor(path string)</a>

```
searchKey: metrics.MustRegisterDiskMonitor
tags: [exported]
```

```Go
func MustRegisterDiskMonitor(path string)
```

MustRegisterDiskMonitor exports two prometheus metrics "src_disk_space_available_bytes{path=$path}" and "src_disk_space_total_bytes{path=$path}". The values exported are for the filesystem that path is on. 

It is safe to call this function more than once for the same path. 

### <a id="mustRegisterOnce" href="#mustRegisterOnce">func mustRegisterOnce(c prometheus.Collector)</a>

```
searchKey: metrics.mustRegisterOnce
```

```Go
func mustRegisterOnce(c prometheus.Collector)
```

### <a id="testingHTTPClient" href="#testingHTTPClient">func testingHTTPClient(handler http.Handler) (*http.Client, func())</a>

```
searchKey: metrics.testingHTTPClient
```

```Go
func testingHTTPClient(handler http.Handler) (*http.Client, func())
```

### <a id="doRequest" href="#doRequest">func doRequest(hc *http.Client, u string) error</a>

```
searchKey: metrics.doRequest
```

```Go
func doRequest(hc *http.Client, u string) error
```

### <a id="TestRequestMeterTransport" href="#TestRequestMeterTransport">func TestRequestMeterTransport(t *testing.T)</a>

```
searchKey: metrics.TestRequestMeterTransport
```

```Go
func TestRequestMeterTransport(t *testing.T)
```

### <a id="TestMustRegisterDiskMonitor" href="#TestMustRegisterDiskMonitor">func TestMustRegisterDiskMonitor(t *testing.T)</a>

```
searchKey: metrics.TestMustRegisterDiskMonitor
```

```Go
func TestMustRegisterDiskMonitor(t *testing.T)
```

