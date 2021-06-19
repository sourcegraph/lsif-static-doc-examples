# Package logs

## Index

* [Functions](#func)
    * [func LogSlowSearchesThreshold() time.Duration](#LogSlowSearchesThreshold)
    * [func MapToLog15Ctx(m map[string]interface{}) []interface{}](#MapToLog15Ctx)


## <a id="func" href="#func">Functions</a>

### <a id="LogSlowSearchesThreshold" href="#LogSlowSearchesThreshold">func LogSlowSearchesThreshold() time.Duration</a>

```
searchKey: logs.LogSlowSearchesThreshold
tags: [exported]
```

```Go
func LogSlowSearchesThreshold() time.Duration
```

LogSlowSearchesThreshold returns the minimum duration configured in site settings for logging slow searches. 

### <a id="MapToLog15Ctx" href="#MapToLog15Ctx">func MapToLog15Ctx(m map[string]interface{}) []interface{}</a>

```
searchKey: logs.MapToLog15Ctx
tags: [exported]
```

```Go
func MapToLog15Ctx(m map[string]interface{}) []interface{}
```

MapToLog15Ctx translates a map to log15 context fields. 
