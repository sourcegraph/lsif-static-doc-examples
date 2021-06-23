# Package logging

## Index

* [Variables](#var)
    * [var logColors](#logColors)
    * [var logLabels](#logLabels)
* [Types](#type)
    * [type ErrorLogger interface](#ErrorLogger)
    * [type Options struct](#Options)
    * [type Option func(*github.com/sourcegraph/sourcegraph/internal/logging.Options)](#Option)
        * [func ServiceName(s string) Option](#ServiceName)
        * [func Filter(f func(*log15.Record) bool) Option](#Filter)
* [Functions](#func)
    * [func Log(lg ErrorLogger, msg string, err *error, ctx ...interface{})](#Log)
    * [func condensedFormat(r *log15.Record) []byte](#condensedFormat)
    * [func init()](#init.main.go)
    * [func LogEntryLevelString(l log15.Lvl) string](#LogEntryLevelString)
    * [func Init(options ...Option)](#Init)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="logColors" href="#logColors">var logColors</a>

```
searchKey: logging.logColors
tags: [private]
```

```Go
var logColors = ...
```

### <a id="logLabels" href="#logLabels">var logLabels</a>

```
searchKey: logging.logLabels
tags: [private]
```

```Go
var logLabels = ...
```

We'd prefer these in caps, not lowercase, and don't need the 4-character alignment 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ErrorLogger" href="#ErrorLogger">type ErrorLogger interface</a>

```
searchKey: logging.ErrorLogger
```

```Go
type ErrorLogger interface {
	Error(msg string, ctx ...interface{})
}
```

ErrorLogger captures the method required for logging an error. 

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: logging.Options
```

```Go
type Options struct {
	filters     []func(*log15.Record) bool
	serviceName string
}
```

Options control the behavior of a tracer. 

### <a id="Option" href="#Option">type Option func(*github.com/sourcegraph/sourcegraph/internal/logging.Options)</a>

```
searchKey: logging.Option
```

```Go
type Option func(*Options)
```

If this idiom seems strange: [https://github.com/tmrts/go-patterns/blob/master/idiom/functional-options.md](https://github.com/tmrts/go-patterns/blob/master/idiom/functional-options.md) 

#### <a id="ServiceName" href="#ServiceName">func ServiceName(s string) Option</a>

```
searchKey: logging.ServiceName
```

```Go
func ServiceName(s string) Option
```

#### <a id="Filter" href="#Filter">func Filter(f func(*log15.Record) bool) Option</a>

```
searchKey: logging.Filter
```

```Go
func Filter(f func(*log15.Record) bool) Option
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Log" href="#Log">func Log(lg ErrorLogger, msg string, err *error, ctx ...interface{})</a>

```
searchKey: logging.Log
```

```Go
func Log(lg ErrorLogger, msg string, err *error, ctx ...interface{})
```

Log logs the given message and context when the given error is defined. 

### <a id="condensedFormat" href="#condensedFormat">func condensedFormat(r *log15.Record) []byte</a>

```
searchKey: logging.condensedFormat
tags: [private]
```

```Go
func condensedFormat(r *log15.Record) []byte
```

### <a id="init.main.go" href="#init.main.go">func init()</a>

```
searchKey: logging.init
tags: [private]
```

```Go
func init()
```

### <a id="LogEntryLevelString" href="#LogEntryLevelString">func LogEntryLevelString(l log15.Lvl) string</a>

```
searchKey: logging.LogEntryLevelString
```

```Go
func LogEntryLevelString(l log15.Lvl) string
```

For severity field, see [https://cloud.google.com/logging/docs/reference/v2/rest/v2/LogEntry](https://cloud.google.com/logging/docs/reference/v2/rest/v2/LogEntry) 

### <a id="Init" href="#Init">func Init(options ...Option)</a>

```
searchKey: logging.Init
```

```Go
func Init(options ...Option)
```

Init initializes log15's root logger based on Sourcegraph-wide logging configuration variables. See [https://docs.sourcegraph.com/admin/observability#logs](https://docs.sourcegraph.com/admin/observability#logs) 

