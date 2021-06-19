# Package honey

package honey is a lightweight wrapper around libhoney which initializes honeycomb based on environment variables. 

## Index

* [Variables](#var)
    * [var apiKey](#apiKey)
* [Types](#type)
    * [type SearchEventArgs struct](#SearchEventArgs)
* [Functions](#func)
    * [func Enabled() bool](#Enabled)
    * [func Event(dataset string) *libhoney.Event](#Event)
    * [func EventWithFields(dataset string, fields map[string]interface{}) *libhoney.Event](#EventWithFields)
    * [func Builder(dataset string) *libhoney.Builder](#Builder)
    * [func init()](#init)
    * [func SearchEvent(ctx context.Context, args SearchEventArgs) *libhoney.Event](#SearchEvent)


## <a id="var" href="#var">Variables</a>

### <a id="apiKey" href="#apiKey">var apiKey</a>

```
searchKey: honey.apiKey
```

```Go
var apiKey = env.Get("HONEYCOMB_TEAM", "", "The key used for Honeycomb event tracking.")
```

## <a id="type" href="#type">Types</a>

### <a id="SearchEventArgs" href="#SearchEventArgs">type SearchEventArgs struct</a>

```
searchKey: honey.SearchEventArgs
tags: [exported]
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

### <a id="Enabled" href="#Enabled">func Enabled() bool</a>

```
searchKey: honey.Enabled
tags: [exported]
```

```Go
func Enabled() bool
```

Enabled returns true if honeycomb has been configured to run. 

### <a id="Event" href="#Event">func Event(dataset string) *libhoney.Event</a>

```
searchKey: honey.Event
tags: [exported]
```

```Go
func Event(dataset string) *libhoney.Event
```

Event creates an event for logging to dataset. Event.Send will only work if Enabled() returns true. 

### <a id="EventWithFields" href="#EventWithFields">func EventWithFields(dataset string, fields map[string]interface{}) *libhoney.Event</a>

```
searchKey: honey.EventWithFields
tags: [exported]
```

```Go
func EventWithFields(dataset string, fields map[string]interface{}) *libhoney.Event
```

EventWithFields creates an event for logging to the given dataset. The given fields are assigned to the event. 

### <a id="Builder" href="#Builder">func Builder(dataset string) *libhoney.Builder</a>

```
searchKey: honey.Builder
tags: [exported]
```

```Go
func Builder(dataset string) *libhoney.Builder
```

Builder creates a builder for logging to a dataset. 

### <a id="init" href="#init">func init()</a>

```
searchKey: honey.init
```

```Go
func init()
```

### <a id="SearchEvent" href="#SearchEvent">func SearchEvent(ctx context.Context, args SearchEventArgs) *libhoney.Event</a>

```
searchKey: honey.SearchEvent
tags: [exported]
```

```Go
func SearchEvent(ctx context.Context, args SearchEventArgs) *libhoney.Event
```

SearchEvent returns a honey event for the dataset "search". 

