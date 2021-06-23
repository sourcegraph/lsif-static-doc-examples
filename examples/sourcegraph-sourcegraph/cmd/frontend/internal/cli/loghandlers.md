# Package loghandlers

Package loghandlers contains log15 handlers/filters used by the sourcegraph cli 

## Index

* [Variables](#var)
    * [var noiseyRPC](#noiseyRPC)
    * [var traces](#traces)
* [Functions](#func)
    * [func Trace(types []string, threshold time.Duration) func(*log15.Record) bool](#Trace)
    * [func NotNoisey(r *log15.Record) bool](#NotNoisey)
    * [func TestNotNoisey(t *testing.T)](#TestNotNoisey)
    * [func TestTrace_All(t *testing.T)](#TestTrace_All)
    * [func TestTrace_None(t *testing.T)](#TestTrace_None)
    * [func TestTrace_Specific(t *testing.T)](#TestTrace_Specific)
    * [func TestTrace_Threshold(t *testing.T)](#TestTrace_Threshold)
    * [func mkRecord(lvl log15.Lvl, msg string, ctx ...interface{}) log15.Record](#mkRecord)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="noiseyRPC" href="#noiseyRPC">var noiseyRPC</a>

```
searchKey: loghandlers.noiseyRPC
tags: [private]
```

```Go
var noiseyRPC = []string{"MirrorRepos.RefreshVCS"}
```

### <a id="traces" href="#traces">var traces</a>

```
searchKey: loghandlers.traces
tags: [private]
```

```Go
var traces = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Trace" href="#Trace">func Trace(types []string, threshold time.Duration) func(*log15.Record) bool</a>

```
searchKey: loghandlers.Trace
```

```Go
func Trace(types []string, threshold time.Duration) func(*log15.Record) bool
```

Trace returns a filter for the given traces that run longer than threshold 

### <a id="NotNoisey" href="#NotNoisey">func NotNoisey(r *log15.Record) bool</a>

```
searchKey: loghandlers.NotNoisey
```

```Go
func NotNoisey(r *log15.Record) bool
```

NotNoisey filters out high firing and low signal debug logs 

### <a id="TestNotNoisey" href="#TestNotNoisey">func TestNotNoisey(t *testing.T)</a>

```
searchKey: loghandlers.TestNotNoisey
tags: [private]
```

```Go
func TestNotNoisey(t *testing.T)
```

### <a id="TestTrace_All" href="#TestTrace_All">func TestTrace_All(t *testing.T)</a>

```
searchKey: loghandlers.TestTrace_All
tags: [private]
```

```Go
func TestTrace_All(t *testing.T)
```

### <a id="TestTrace_None" href="#TestTrace_None">func TestTrace_None(t *testing.T)</a>

```
searchKey: loghandlers.TestTrace_None
tags: [private]
```

```Go
func TestTrace_None(t *testing.T)
```

### <a id="TestTrace_Specific" href="#TestTrace_Specific">func TestTrace_Specific(t *testing.T)</a>

```
searchKey: loghandlers.TestTrace_Specific
tags: [private]
```

```Go
func TestTrace_Specific(t *testing.T)
```

### <a id="TestTrace_Threshold" href="#TestTrace_Threshold">func TestTrace_Threshold(t *testing.T)</a>

```
searchKey: loghandlers.TestTrace_Threshold
tags: [private]
```

```Go
func TestTrace_Threshold(t *testing.T)
```

### <a id="mkRecord" href="#mkRecord">func mkRecord(lvl log15.Lvl, msg string, ctx ...interface{}) log15.Record</a>

```
searchKey: loghandlers.mkRecord
tags: [private]
```

```Go
func mkRecord(lvl log15.Lvl, msg string, ctx ...interface{}) log15.Record
```

