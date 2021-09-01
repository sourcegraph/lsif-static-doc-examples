# Package main

## Index

* [Constants](#const)
    * [const port](#port)
* [Variables](#var)
    * [var hopHeaders](#hopHeaders)
    * [var logRequests](#logRequests)
    * [var metricWaitingRequestsGauge](#metricWaitingRequestsGauge)
    * [var requestMu](#requestMu)
* [Functions](#func)
    * [func TestInstrumentHandler(t *testing.T)](#TestInstrumentHandler)
    * [func instrumentHandler(r prometheus.Registerer, h http.Handler) http.Handler](#instrumentHandler)
    * [func main()](#main)


## <a id="const" href="#const">Constants</a>

### <a id="port" href="#port">const port</a>

```
searchKey: main.port
tags: [constant string private]
```

```Go
const port = "3180"
```

## <a id="var" href="#var">Variables</a>

### <a id="hopHeaders" href="#hopHeaders">var hopHeaders</a>

```
searchKey: main.hopHeaders
tags: [variable object private]
```

```Go
var hopHeaders = ...
```

list obtained from httputil of headers not to forward. 

### <a id="logRequests" href="#logRequests">var logRequests</a>

```
searchKey: main.logRequests
tags: [variable boolean private]
```

```Go
var logRequests, _ = strconv.ParseBool(env.Get("LOG_REQUESTS", "", "log HTTP requests"))
```

### <a id="metricWaitingRequestsGauge" href="#metricWaitingRequestsGauge">var metricWaitingRequestsGauge</a>

```
searchKey: main.metricWaitingRequestsGauge
tags: [variable interface private]
```

```Go
var metricWaitingRequestsGauge = ...
```

### <a id="requestMu" href="#requestMu">var requestMu</a>

```
searchKey: main.requestMu
tags: [variable struct private]
```

```Go
var requestMu sync.Mutex
```

requestMu ensures we only do one request at a time to prevent tripping abuse detection. 

## <a id="func" href="#func">Functions</a>

### <a id="TestInstrumentHandler" href="#TestInstrumentHandler">func TestInstrumentHandler(t *testing.T)</a>

```
searchKey: main.TestInstrumentHandler
tags: [function private test]
```

```Go
func TestInstrumentHandler(t *testing.T)
```

### <a id="instrumentHandler" href="#instrumentHandler">func instrumentHandler(r prometheus.Registerer, h http.Handler) http.Handler</a>

```
searchKey: main.instrumentHandler
tags: [function private]
```

```Go
func instrumentHandler(r prometheus.Registerer, h http.Handler) http.Handler
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

