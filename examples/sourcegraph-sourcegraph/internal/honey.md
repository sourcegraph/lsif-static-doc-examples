# Package honey

package honey is a lightweight wrapper around libhoney which initializes honeycomb based on environment variables. 

## Index

* [Variables](#var)
    * [var apiKey](#apiKey)
* [Types](#type)
    * [type SearchEventArgs struct](#SearchEventArgs)
* [Functions](#func)
    * [func Builder(dataset string) *libhoney.Builder](#Builder)
    * [func Enabled() bool](#Enabled)
    * [func Event(dataset string) *libhoney.Event](#Event)
    * [func EventWithFields(dataset string, fields map[string]interface{}) *libhoney.Event](#EventWithFields)
    * [func SearchEvent(ctx context.Context, args SearchEventArgs) *libhoney.Event](#SearchEvent)
    * [func init()](#init.honey.go)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="apiKey" href="#apiKey">var apiKey</a>

```
searchKey: honey.apiKey
tags: [variable string private]
```

```Go
var apiKey = env.Get("HONEYCOMB_TEAM", "", "The key used for Honeycomb event tracking.")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="SearchEventArgs" href="#SearchEventArgs">type SearchEventArgs struct</a>

```
searchKey: honey.SearchEventArgs
tags: [struct]
```

```Go
type SearchEventArgs struct {
	OriginalQuery string
	Typ           string
	Source        string
	Status        string
	AlertType     string
	DurationMs    int64
	ResultSize    int
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Builder" href="#Builder">func Builder(dataset string) *libhoney.Builder</a>

```
searchKey: honey.Builder
tags: [function]
```

```Go
func Builder(dataset string) *libhoney.Builder
```

Builder creates a builder for logging to a dataset. 

### <a id="Enabled" href="#Enabled">func Enabled() bool</a>

```
searchKey: honey.Enabled
tags: [function]
```

```Go
func Enabled() bool
```

Enabled returns true if honeycomb has been configured to run. 

### <a id="Event" href="#Event">func Event(dataset string) *libhoney.Event</a>

```
searchKey: honey.Event
tags: [function]
```

```Go
func Event(dataset string) *libhoney.Event
```

Event creates an event for logging to dataset. Event.Send will only work if Enabled() returns true. 

### <a id="EventWithFields" href="#EventWithFields">func EventWithFields(dataset string, fields map[string]interface{}) *libhoney.Event</a>

```
searchKey: honey.EventWithFields
tags: [function]
```

```Go
func EventWithFields(dataset string, fields map[string]interface{}) *libhoney.Event
```

EventWithFields creates an event for logging to the given dataset. The given fields are assigned to the event. 

### <a id="SearchEvent" href="#SearchEvent">func SearchEvent(ctx context.Context, args SearchEventArgs) *libhoney.Event</a>

```
searchKey: honey.SearchEvent
tags: [function]
```

```Go
func SearchEvent(ctx context.Context, args SearchEventArgs) *libhoney.Event
```

SearchEvent returns a honey event for the dataset "search". 

### <a id="init.honey.go" href="#init.honey.go">func init()</a>

```
searchKey: honey.init
tags: [function private]
```

```Go
func init()
```

