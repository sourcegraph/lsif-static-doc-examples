# Package eventlogger

## Index

* [Types](#type)
    * [type TelemetryRequest struct](#TelemetryRequest)
* [Functions](#func)
    * [func LogEvent(userID int32, name string, argument json.RawMessage)](#LogEvent)
    * [func logEvent(userID int32, name string, argument json.RawMessage) error](#logEvent)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="TelemetryRequest" href="#TelemetryRequest">type TelemetryRequest struct</a>

```
searchKey: eventlogger.TelemetryRequest
tags: [struct]
```

```Go
type TelemetryRequest struct {
	UserID    int32
	EventName string
	Argument  json.RawMessage
}
```

TelemetryRequest represents a request to log telemetry. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="LogEvent" href="#LogEvent">func LogEvent(userID int32, name string, argument json.RawMessage)</a>

```
searchKey: eventlogger.LogEvent
tags: [function]
```

```Go
func LogEvent(userID int32, name string, argument json.RawMessage)
```

LogEvent sends a payload representing an event to the api/telemetry endpoint. 

This method should be invoked after the frontend service has started. It is safe to not do so (it will just log an error), but logging the actual event will fail otherwise. Consider using e.g. api.InternalClient.RetryPingUntilAvailable to wait for the frontend to start. 

Note: This does not block since it creates a new goroutine. 

### <a id="logEvent" href="#logEvent">func logEvent(userID int32, name string, argument json.RawMessage) error</a>

```
searchKey: eventlogger.logEvent
tags: [function private]
```

```Go
func logEvent(userID int32, name string, argument json.RawMessage) error
```

logEvent sends a payload representing some user event to the InternalClient telemetry API 

