# Package main

## Index

* [Constants](#const)
    * [const port](#port)
* [Variables](#var)
    * [var logRequests](#logRequests)
    * [var requestMu](#requestMu)
    * [var metricWaitingRequestsGauge](#metricWaitingRequestsGauge)
    * [var hopHeaders](#hopHeaders)
* [Functions](#func)
    * [func main()](#main)
    * [func instrumentHandler(r prometheus.Registerer, h http.Handler) http.Handler](#instrumentHandler)
    * [func TestInstrumentHandler(t *testing.T)](#TestInstrumentHandler)


## <a id="const" href="#const">Constants</a>

### <a id="port" href="#port">const port</a>

```
searchKey: main.port
tags: [private]
```

```Go
const port = "3180"
```

## <a id="var" href="#var">Variables</a>

### <a id="logRequests" href="#logRequests">var logRequests</a>

```
searchKey: main.logRequests
tags: [private]
```

```Go
var logRequests, _ = strconv.ParseBool(env.Get("LOG_REQUESTS", "", "log HTTP requests"))
```

### <a id="requestMu" href="#requestMu">var requestMu</a>

```
searchKey: main.requestMu
tags: [private]
```

```Go
var requestMu sync.Mutex
```

requestMu ensures we only do one request at a time to prevent tripping abuse detection. 

### <a id="metricWaitingRequestsGauge" href="#metricWaitingRequestsGauge">var metricWaitingRequestsGauge</a>

```
searchKey: main.metricWaitingRequestsGauge
tags: [private]
```

```Go
var metricWaitingRequestsGauge = ...
```

### <a id="hopHeaders" href="#hopHeaders">var hopHeaders</a>

```
searchKey: main.hopHeaders
tags: [private]
```

```Go
var hopHeaders = ...
```

list obtained from httputil of headers not to forward. 

## <a id="func" href="#func">Functions</a>

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [private]
```

```Go
func main()
```

### <a id="instrumentHandler" href="#instrumentHandler">func instrumentHandler(r prometheus.Registerer, h http.Handler) http.Handler</a>

```
searchKey: main.instrumentHandler
tags: [private]
```

```Go
func instrumentHandler(r prometheus.Registerer, h http.Handler) http.Handler
```

### <a id="TestInstrumentHandler" href="#TestInstrumentHandler">func TestInstrumentHandler(t *testing.T)</a>

```
searchKey: main.TestInstrumentHandler
tags: [private]
```

```Go
func TestInstrumentHandler(t *testing.T)
```

