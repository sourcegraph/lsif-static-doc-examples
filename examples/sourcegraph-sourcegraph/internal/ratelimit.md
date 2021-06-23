# Package ratelimit

## Index

* [Variables](#var)
    * [var DefaultMonitorRegistry](#DefaultMonitorRegistry)
    * [var DefaultRegistry](#DefaultRegistry)
* [Types](#type)
    * [type MonitorRegistry struct](#MonitorRegistry)
        * [func NewMonitorRegistry() *MonitorRegistry](#NewMonitorRegistry)
        * [func (r *MonitorRegistry) GetOrSet(baseURL, authHash, resource string, monitor *Monitor) *Monitor](#MonitorRegistry.GetOrSet)
        * [func (r *MonitorRegistry) Count() int](#MonitorRegistry.Count)
    * [type MetricsCollector struct](#MetricsCollector)
    * [type Monitor struct](#Monitor)
        * [func (c *Monitor) Get() (remaining int, reset, retry time.Duration, known bool)](#Monitor.Get)
        * [func (c *Monitor) RecommendedWaitForBackgroundOp(cost int) (timeRemaining time.Duration)](#Monitor.RecommendedWaitForBackgroundOp)
        * [func (c *Monitor) Update(h http.Header)](#Monitor.Update)
        * [func (c *Monitor) SetCollector(collector *MetricsCollector)](#Monitor.SetCollector)
        * [func (c *Monitor) now() time.Time](#Monitor.now)
    * [type Registry struct](#Registry)
        * [func NewRegistry() *Registry](#NewRegistry)
        * [func (r *Registry) Get(baseURL string) *rate.Limiter](#Registry.Get)
        * [func (r *Registry) GetOrSet(baseURL string, fallback *rate.Limiter) *rate.Limiter](#Registry.GetOrSet)
        * [func (r *Registry) Count() int](#Registry.Count)
* [Functions](#func)
    * [func normaliseURL(rawURL string) string](#normaliseURL)
    * [func TestMonitor_RecommendedWaitForBackgroundOp(t *testing.T)](#TestMonitor_RecommendedWaitForBackgroundOp)
    * [func TestMonitor_RecommendedWaitForBackgroundOp_RetryAfter(t *testing.T)](#TestMonitor_RecommendedWaitForBackgroundOp_RetryAfter)
    * [func TestMonitor_Update(t *testing.T)](#TestMonitor_Update)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="DefaultMonitorRegistry" href="#DefaultMonitorRegistry">var DefaultMonitorRegistry</a>

```
searchKey: ratelimit.DefaultMonitorRegistry
```

```Go
var DefaultMonitorRegistry = NewMonitorRegistry()
```

DefaultMonitorRegistry is the default global rate limit monitor registry. It will hold rate limit mappings for each instance of our services. 

### <a id="DefaultRegistry" href="#DefaultRegistry">var DefaultRegistry</a>

```
searchKey: ratelimit.DefaultRegistry
```

```Go
var DefaultRegistry = NewRegistry()
```

DefaultRegistry is the default global rate limit registry. It will hold rate limit mappings for each instance of our services. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="MonitorRegistry" href="#MonitorRegistry">type MonitorRegistry struct</a>

```
searchKey: ratelimit.MonitorRegistry
```

```Go
type MonitorRegistry struct {
	mu sync.Mutex
	// Monitor per code host / token tuple, keys are the normalized base URL for a
	// code host, plus the token hash.
	monitors map[string]*Monitor
}
```

MonitorRegistry keeps a mapping of external service URL to *Monitor. 

#### <a id="NewMonitorRegistry" href="#NewMonitorRegistry">func NewMonitorRegistry() *MonitorRegistry</a>

```
searchKey: ratelimit.NewMonitorRegistry
```

```Go
func NewMonitorRegistry() *MonitorRegistry
```

NewMonitorRegistry creates a new empty registry. 

#### <a id="MonitorRegistry.GetOrSet" href="#MonitorRegistry.GetOrSet">func (r *MonitorRegistry) GetOrSet(baseURL, authHash, resource string, monitor *Monitor) *Monitor</a>

```
searchKey: ratelimit.MonitorRegistry.GetOrSet
```

```Go
func (r *MonitorRegistry) GetOrSet(baseURL, authHash, resource string, monitor *Monitor) *Monitor
```

GetOrSet fetches the rate limit monitor associated with the given code host / token tuple and an optional resource key. If none has been configured yet, the provided monitor will be set. 

#### <a id="MonitorRegistry.Count" href="#MonitorRegistry.Count">func (r *MonitorRegistry) Count() int</a>

```
searchKey: ratelimit.MonitorRegistry.Count
```

```Go
func (r *MonitorRegistry) Count() int
```

Count returns the total number of rate limiters in the registry 

### <a id="MetricsCollector" href="#MetricsCollector">type MetricsCollector struct</a>

```
searchKey: ratelimit.MetricsCollector
```

```Go
type MetricsCollector struct {
	Remaining    func(n float64)
	WaitDuration func(n time.Duration)
}
```

MetricsCollector is used so that we can inject metric collection functions for difference monitor configurations. 

### <a id="Monitor" href="#Monitor">type Monitor struct</a>

```
searchKey: ratelimit.Monitor
```

```Go
type Monitor struct {
	HeaderPrefix string // "X-" (GitHub) or "" (GitLab)

	mu        sync.Mutex
	known     bool
	limit     int               // last RateLimit-Limit HTTP response header value
	remaining int               // last RateLimit-Remaining HTTP response header value
	reset     time.Time         // last RateLimit-Remaining HTTP response header value
	retry     time.Time         // deadline based on Retry-After HTTP response header value
	collector *MetricsCollector // metrics collector

	clock func() time.Time
}
```

Monitor monitors an external service's rate limit based on the X-RateLimit-Remaining or RateLimit-Remaining headers. It supports both GitHub's and GitLab's APIs. 

It is intended to be embedded in an API client struct. 

#### <a id="Monitor.Get" href="#Monitor.Get">func (c *Monitor) Get() (remaining int, reset, retry time.Duration, known bool)</a>

```
searchKey: ratelimit.Monitor.Get
```

```Go
func (c *Monitor) Get() (remaining int, reset, retry time.Duration, known bool)
```

Get reports the client's rate limit status (as of the last API response it received). 

#### <a id="Monitor.RecommendedWaitForBackgroundOp" href="#Monitor.RecommendedWaitForBackgroundOp">func (c *Monitor) RecommendedWaitForBackgroundOp(cost int) (timeRemaining time.Duration)</a>

```
searchKey: ratelimit.Monitor.RecommendedWaitForBackgroundOp
```

```Go
func (c *Monitor) RecommendedWaitForBackgroundOp(cost int) (timeRemaining time.Duration)
```

RecommendedWaitForBackgroundOp returns the recommended wait time before performing a periodic background operation with the given rate limit cost. It takes the rate limit information from the last API request into account. 

For example, suppose the rate limit resets to 5,000 points in 30 minutes and currently 1,500 points remain. You want to perform a cost-500 operation. Only 4 more cost-500 operations are allowed in the next 30 minutes (per the rate limit): 

```
                       -500         -500         -500
      Now   |------------*------------*------------*------------| 30 min from now
Remaining  1500         1000         500           0           5000 (reset)

```
Assuming no other operations are being performed (that count against the rate limit), the recommended wait would be 7.5 minutes (30 minutes / 4), so that the operations are evenly spaced out. 

A small constant additional wait is added to account for other simultaneous operations and clock out-of-synchronization. 

See [https://developer.github.com/v4/guides/resource-limitations/#rate-limit](https://developer.github.com/v4/guides/resource-limitations/#rate-limit). 

#### <a id="Monitor.Update" href="#Monitor.Update">func (c *Monitor) Update(h http.Header)</a>

```
searchKey: ratelimit.Monitor.Update
```

```Go
func (c *Monitor) Update(h http.Header)
```

Update updates the monitor's rate limit information based on the HTTP response headers. 

#### <a id="Monitor.SetCollector" href="#Monitor.SetCollector">func (c *Monitor) SetCollector(collector *MetricsCollector)</a>

```
searchKey: ratelimit.Monitor.SetCollector
```

```Go
func (c *Monitor) SetCollector(collector *MetricsCollector)
```

SetCollector sets the metric collector. 

#### <a id="Monitor.now" href="#Monitor.now">func (c *Monitor) now() time.Time</a>

```
searchKey: ratelimit.Monitor.now
tags: [private]
```

```Go
func (c *Monitor) now() time.Time
```

### <a id="Registry" href="#Registry">type Registry struct</a>

```
searchKey: ratelimit.Registry
```

```Go
type Registry struct {
	mu sync.Mutex
	// Rate limiter per code host, keys are the normalized base URL for a
	// code host.
	rateLimiters map[string]*rate.Limiter
}
```

Registry keeps a mapping of external service URL to *rate.Limiter. By default an infinite limiter is returned. 

#### <a id="NewRegistry" href="#NewRegistry">func NewRegistry() *Registry</a>

```
searchKey: ratelimit.NewRegistry
```

```Go
func NewRegistry() *Registry
```

NewRegistry creates a new empty registry. 

#### <a id="Registry.Get" href="#Registry.Get">func (r *Registry) Get(baseURL string) *rate.Limiter</a>

```
searchKey: ratelimit.Registry.Get
```

```Go
func (r *Registry) Get(baseURL string) *rate.Limiter
```

Get fetches the rate limiter associated with the given code host. If none has been configured an infinite limiter is returned. 

#### <a id="Registry.GetOrSet" href="#Registry.GetOrSet">func (r *Registry) GetOrSet(baseURL string, fallback *rate.Limiter) *rate.Limiter</a>

```
searchKey: ratelimit.Registry.GetOrSet
```

```Go
func (r *Registry) GetOrSet(baseURL string, fallback *rate.Limiter) *rate.Limiter
```

GetOrSet fetches the rate limiter associated with the given code host. If none has been configured yet, the provided limiter will be set. A nil limiter will fall back to an infinite limiter. 

#### <a id="Registry.Count" href="#Registry.Count">func (r *Registry) Count() int</a>

```
searchKey: ratelimit.Registry.Count
```

```Go
func (r *Registry) Count() int
```

Count returns the total number of rate limiters in the registry 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="normaliseURL" href="#normaliseURL">func normaliseURL(rawURL string) string</a>

```
searchKey: ratelimit.normaliseURL
tags: [private]
```

```Go
func normaliseURL(rawURL string) string
```

normaliseURL will attempt to normalise rawURL. If there is an error parsing it, we'll just return rawURL lower cased. 

### <a id="TestMonitor_RecommendedWaitForBackgroundOp" href="#TestMonitor_RecommendedWaitForBackgroundOp">func TestMonitor_RecommendedWaitForBackgroundOp(t *testing.T)</a>

```
searchKey: ratelimit.TestMonitor_RecommendedWaitForBackgroundOp
tags: [private]
```

```Go
func TestMonitor_RecommendedWaitForBackgroundOp(t *testing.T)
```

### <a id="TestMonitor_RecommendedWaitForBackgroundOp_RetryAfter" href="#TestMonitor_RecommendedWaitForBackgroundOp_RetryAfter">func TestMonitor_RecommendedWaitForBackgroundOp_RetryAfter(t *testing.T)</a>

```
searchKey: ratelimit.TestMonitor_RecommendedWaitForBackgroundOp_RetryAfter
tags: [private]
```

```Go
func TestMonitor_RecommendedWaitForBackgroundOp_RetryAfter(t *testing.T)
```

### <a id="TestMonitor_Update" href="#TestMonitor_Update">func TestMonitor_Update(t *testing.T)</a>

```
searchKey: ratelimit.TestMonitor_Update
tags: [private]
```

```Go
func TestMonitor_Update(t *testing.T)
```

