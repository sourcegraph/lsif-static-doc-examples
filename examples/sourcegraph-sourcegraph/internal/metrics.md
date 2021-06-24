# Package metrics

## Index

* [Variables](#var)
    * [var TestRegisterer](#TestRegisterer)
    * [var registerer](#registerer)
* [Types](#type)
    * [type OperationMetrics struct](#OperationMetrics)
        * [func NewOperationMetrics(r prometheus.Registerer, metricPrefix string, fns ...OperationMetricsOption) *OperationMetrics](#NewOperationMetrics)
        * [func (m *OperationMetrics) Observe(secs, count float64, err *error, lvals ...string)](#OperationMetrics.Observe)
    * [type OperationMetricsOption func(o *github.com/sourcegraph/sourcegraph/internal/metrics.operationMetricOptions)](#OperationMetricsOption)
        * [func WithCountHelp(text string) OperationMetricsOption](#WithCountHelp)
        * [func WithDurationHelp(text string) OperationMetricsOption](#WithDurationHelp)
        * [func WithErrorsHelp(text string) OperationMetricsOption](#WithErrorsHelp)
        * [func WithLabels(labels ...string) OperationMetricsOption](#WithLabels)
        * [func WithSubsystem(subsystem string) OperationMetricsOption](#WithSubsystem)
    * [type RequestMeter struct](#RequestMeter)
        * [func NewRequestMeter(subsystem, help string) *RequestMeter](#NewRequestMeter)
        * [func (rm *RequestMeter) Doer(cli httpcli.Doer, categoryFunc func(*url.URL) string) httpcli.Doer](#RequestMeter.Doer)
        * [func (rm *RequestMeter) Transport(transport http.RoundTripper, categoryFunc func(*url.URL) string) http.RoundTripper](#RequestMeter.Transport)
    * [type SingletonOperationMetrics struct](#SingletonOperationMetrics)
        * [func (m *SingletonOperationMetrics) Get(create func() *OperationMetrics) *OperationMetrics](#SingletonOperationMetrics.Get)
    * [type operationMetricOptions struct](#operationMetricOptions)
    * [type requestCounterMiddleware struct](#requestCounterMiddleware)
        * [func (t *requestCounterMiddleware) Do(req *http.Request) (*http.Response, error)](#requestCounterMiddleware.Do)
        * [func (t *requestCounterMiddleware) RoundTrip(r *http.Request) (resp *http.Response, err error)](#requestCounterMiddleware.RoundTrip)
    * [type testRegisterer struct{}](#testRegisterer)
        * [func (testRegisterer) MustRegister(...prometheus.Collector)](#testRegisterer.MustRegister)
        * [func (testRegisterer) Register(prometheus.Collector) error](#testRegisterer.Register)
        * [func (testRegisterer) Unregister(prometheus.Collector) bool](#testRegisterer.Unregister)
* [Functions](#func)
    * [func MustRegisterDiskMonitor(path string)](#MustRegisterDiskMonitor)
    * [func TestMustRegisterDiskMonitor(t *testing.T)](#TestMustRegisterDiskMonitor)
    * [func TestRequestMeterTransport(t *testing.T)](#TestRequestMeterTransport)
    * [func doRequest(hc *http.Client, u string) error](#doRequest)
    * [func mustRegisterOnce(c prometheus.Collector)](#mustRegisterOnce)
    * [func testingHTTPClient(handler http.Handler) (*http.Client, func())](#testingHTTPClient)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="TestRegisterer" href="#TestRegisterer">var TestRegisterer</a>

```
searchKey: metrics.TestRegisterer
tags: [variable interface]
```

```Go
var TestRegisterer prometheus.Registerer = testRegisterer{}
```

TestRegisterer is a behaviorless Prometheus Registerer usable for unit tests. 

### <a id="registerer" href="#registerer">var registerer</a>

```
searchKey: metrics.registerer
tags: [variable interface private]
```

```Go
var registerer = prometheus.DefaultRegisterer
```

registerer exists so we can override it in tests 

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="OperationMetrics" href="#OperationMetrics">type OperationMetrics struct</a>

```
searchKey: metrics.OperationMetrics
tags: [struct]
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
tags: [method]
```

```Go
func NewOperationMetrics(r prometheus.Registerer, metricPrefix string, fns ...OperationMetricsOption) *OperationMetrics
```

NewOperationMetrics creates an OperationMetrics value. The metrics will be immediately registered to the given registerer. This method panics on registration error. The supplied metricPrefix should be underscore_cased as it is used in the metric name. 

#### <a id="OperationMetrics.Observe" href="#OperationMetrics.Observe">func (m *OperationMetrics) Observe(secs, count float64, err *error, lvals ...string)</a>

```
searchKey: metrics.OperationMetrics.Observe
tags: [method]
```

```Go
func (m *OperationMetrics) Observe(secs, count float64, err *error, lvals ...string)
```

Observe registers an observation of a single operation. 

### <a id="OperationMetricsOption" href="#OperationMetricsOption">type OperationMetricsOption func(o *github.com/sourcegraph/sourcegraph/internal/metrics.operationMetricOptions)</a>

```
searchKey: metrics.OperationMetricsOption
tags: [function]
```

```Go
type OperationMetricsOption func(o *operationMetricOptions)
```

OperationMetricsOption alter the default behavior of NewOperationMetrics. 

#### <a id="WithCountHelp" href="#WithCountHelp">func WithCountHelp(text string) OperationMetricsOption</a>

```
searchKey: metrics.WithCountHelp
tags: [method]
```

```Go
func WithCountHelp(text string) OperationMetricsOption
```

WithCountHelp overrides the default help text for count metrics. 

#### <a id="WithDurationHelp" href="#WithDurationHelp">func WithDurationHelp(text string) OperationMetricsOption</a>

```
searchKey: metrics.WithDurationHelp
tags: [method]
```

```Go
func WithDurationHelp(text string) OperationMetricsOption
```

WithDurationHelp overrides the default help text for duration metrics. 

#### <a id="WithErrorsHelp" href="#WithErrorsHelp">func WithErrorsHelp(text string) OperationMetricsOption</a>

```
searchKey: metrics.WithErrorsHelp
tags: [method]
```

```Go
func WithErrorsHelp(text string) OperationMetricsOption
```

WithErrorsHelp overrides the default help text for errors metrics. 

#### <a id="WithLabels" href="#WithLabels">func WithLabels(labels ...string) OperationMetricsOption</a>

```
searchKey: metrics.WithLabels
tags: [method]
```

```Go
func WithLabels(labels ...string) OperationMetricsOption
```

WithLabels overrides the default labels for all metrics. 

#### <a id="WithSubsystem" href="#WithSubsystem">func WithSubsystem(subsystem string) OperationMetricsOption</a>

```
searchKey: metrics.WithSubsystem
tags: [method]
```

```Go
func WithSubsystem(subsystem string) OperationMetricsOption
```

WithSubsystem overrides the default subsystem for all metrics. 

### <a id="RequestMeter" href="#RequestMeter">type RequestMeter struct</a>

```
searchKey: metrics.RequestMeter
tags: [struct]
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
tags: [method]
```

```Go
func NewRequestMeter(subsystem, help string) *RequestMeter
```

NewRequestMeter creates a new request meter. 

#### <a id="RequestMeter.Doer" href="#RequestMeter.Doer">func (rm *RequestMeter) Doer(cli httpcli.Doer, categoryFunc func(*url.URL) string) httpcli.Doer</a>

```
searchKey: metrics.RequestMeter.Doer
tags: [method]
```

```Go
func (rm *RequestMeter) Doer(cli httpcli.Doer, categoryFunc func(*url.URL) string) httpcli.Doer
```

Doer returns an httpcli.Doer that updates rm for each request. The categoryFunc is called to determine the category label for each request. 

#### <a id="RequestMeter.Transport" href="#RequestMeter.Transport">func (rm *RequestMeter) Transport(transport http.RoundTripper, categoryFunc func(*url.URL) string) http.RoundTripper</a>

```
searchKey: metrics.RequestMeter.Transport
tags: [method]
```

```Go
func (rm *RequestMeter) Transport(transport http.RoundTripper, categoryFunc func(*url.URL) string) http.RoundTripper
```

Transport returns an http.RoundTripper that updates rm for each request. The categoryFunc is called to determine the category label for each request. 

### <a id="SingletonOperationMetrics" href="#SingletonOperationMetrics">type SingletonOperationMetrics struct</a>

```
searchKey: metrics.SingletonOperationMetrics
tags: [struct]
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
tags: [method]
```

```Go
func (m *SingletonOperationMetrics) Get(create func() *OperationMetrics) *OperationMetrics
```

SingletonOperationMetrics returns an operation metrics instance. If no instance has been created yet, one is constructed with the given create function. This method is safe to access concurrently. 

### <a id="operationMetricOptions" href="#operationMetricOptions">type operationMetricOptions struct</a>

```
searchKey: metrics.operationMetricOptions
tags: [struct private]
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

### <a id="requestCounterMiddleware" href="#requestCounterMiddleware">type requestCounterMiddleware struct</a>

```
searchKey: metrics.requestCounterMiddleware
tags: [struct private]
```

```Go
type requestCounterMiddleware struct {
	meter        *RequestMeter
	cli          httpcli.Doer
	transport    http.RoundTripper
	categoryFunc func(*url.URL) string
}
```

#### <a id="requestCounterMiddleware.Do" href="#requestCounterMiddleware.Do">func (t *requestCounterMiddleware) Do(req *http.Request) (*http.Response, error)</a>

```
searchKey: metrics.requestCounterMiddleware.Do
tags: [method private]
```

```Go
func (t *requestCounterMiddleware) Do(req *http.Request) (*http.Response, error)
```

#### <a id="requestCounterMiddleware.RoundTrip" href="#requestCounterMiddleware.RoundTrip">func (t *requestCounterMiddleware) RoundTrip(r *http.Request) (resp *http.Response, err error)</a>

```
searchKey: metrics.requestCounterMiddleware.RoundTrip
tags: [method private]
```

```Go
func (t *requestCounterMiddleware) RoundTrip(r *http.Request) (resp *http.Response, err error)
```

### <a id="testRegisterer" href="#testRegisterer">type testRegisterer struct{}</a>

```
searchKey: metrics.testRegisterer
tags: [struct private]
```

```Go
type testRegisterer struct{}
```

#### <a id="testRegisterer.MustRegister" href="#testRegisterer.MustRegister">func (testRegisterer) MustRegister(...prometheus.Collector)</a>

```
searchKey: metrics.testRegisterer.MustRegister
tags: [method private]
```

```Go
func (testRegisterer) MustRegister(...prometheus.Collector)
```

#### <a id="testRegisterer.Register" href="#testRegisterer.Register">func (testRegisterer) Register(prometheus.Collector) error</a>

```
searchKey: metrics.testRegisterer.Register
tags: [method private]
```

```Go
func (testRegisterer) Register(prometheus.Collector) error
```

#### <a id="testRegisterer.Unregister" href="#testRegisterer.Unregister">func (testRegisterer) Unregister(prometheus.Collector) bool</a>

```
searchKey: metrics.testRegisterer.Unregister
tags: [method private]
```

```Go
func (testRegisterer) Unregister(prometheus.Collector) bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="MustRegisterDiskMonitor" href="#MustRegisterDiskMonitor">func MustRegisterDiskMonitor(path string)</a>

```
searchKey: metrics.MustRegisterDiskMonitor
tags: [method]
```

```Go
func MustRegisterDiskMonitor(path string)
```

MustRegisterDiskMonitor exports two prometheus metrics "src_disk_space_available_bytes{path=$path}" and "src_disk_space_total_bytes{path=$path}". The values exported are for the filesystem that path is on. 

It is safe to call this function more than once for the same path. 

### <a id="TestMustRegisterDiskMonitor" href="#TestMustRegisterDiskMonitor">func TestMustRegisterDiskMonitor(t *testing.T)</a>

```
searchKey: metrics.TestMustRegisterDiskMonitor
tags: [method private test]
```

```Go
func TestMustRegisterDiskMonitor(t *testing.T)
```

### <a id="TestRequestMeterTransport" href="#TestRequestMeterTransport">func TestRequestMeterTransport(t *testing.T)</a>

```
searchKey: metrics.TestRequestMeterTransport
tags: [method private test]
```

```Go
func TestRequestMeterTransport(t *testing.T)
```

### <a id="doRequest" href="#doRequest">func doRequest(hc *http.Client, u string) error</a>

```
searchKey: metrics.doRequest
tags: [method private]
```

```Go
func doRequest(hc *http.Client, u string) error
```

### <a id="mustRegisterOnce" href="#mustRegisterOnce">func mustRegisterOnce(c prometheus.Collector)</a>

```
searchKey: metrics.mustRegisterOnce
tags: [method private]
```

```Go
func mustRegisterOnce(c prometheus.Collector)
```

### <a id="testingHTTPClient" href="#testingHTTPClient">func testingHTTPClient(handler http.Handler) (*http.Client, func())</a>

```
searchKey: metrics.testingHTTPClient
tags: [method private]
```

```Go
func testingHTTPClient(handler http.Handler) (*http.Client, func())
```

