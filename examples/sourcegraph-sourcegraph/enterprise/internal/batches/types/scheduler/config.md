# Package config

## Index

* [Variables](#var)
    * [var config](#config)
    * [var mu](#mu)
* [Types](#type)
    * [type configuration struct](#configuration)
        * [func ensureConfig() *configuration](#ensureConfig)
        * [func newConfiguration() *configuration](#newConfiguration)
        * [func (c *configuration) Active() *window.Configuration](#configuration.Active)
        * [func (c *configuration) Subscribe() chan *window.Configuration](#configuration.Subscribe)
        * [func (c *configuration) Unsubscribe(ch chan *window.Configuration)](#configuration.Unsubscribe)
        * [func (c *configuration) notify()](#configuration.notify)
* [Functions](#func)
    * [func ActiveWindow() *window.Configuration](#ActiveWindow)
    * [func Subscribe() chan *window.Configuration](#Subscribe)
    * [func Unsubscribe(ch chan *window.Configuration)](#Unsubscribe)
    * [func Reset()](#Reset)
    * [func sameConfiguration(prev, next *[]*schema.BatchChangeRolloutWindow) bool](#sameConfiguration)
    * [func TestConfiguration(t *testing.T)](#TestConfiguration)


## <a id="var" href="#var">Variables</a>

### <a id="config" href="#config">var config</a>

```
searchKey: config.config
```

```Go
var config *configuration
```

This is a singleton because, well, the entire site configuration system essentially is. 

### <a id="mu" href="#mu">var mu</a>

```
searchKey: config.mu
```

```Go
var mu sync.Mutex
```

This is a singleton because, well, the entire site configuration system essentially is. 

## <a id="type" href="#type">Types</a>

### <a id="configuration" href="#configuration">type configuration struct</a>

```
searchKey: config.configuration
```

```Go
type configuration struct {
	mu          sync.RWMutex
	active      *window.Configuration
	raw         *[]*schema.BatchChangeRolloutWindow
	subscribers map[chan *window.Configuration]struct{}
}
```

configuration wraps window.Configuration in a thread-safe manner, while allowing consuming code to subscribe to configuration updates. 

#### <a id="ensureConfig" href="#ensureConfig">func ensureConfig() *configuration</a>

```
searchKey: config.ensureConfig
```

```Go
func ensureConfig() *configuration
```

ensureConfig grabs the current configuration, lazily constructing it if necessary. It momentarily locks the singleton mutex, but releases it when it returns the config. This protects us against race conditions when overwriting the config, since Go doesn't guarantee even pointer writes are atomic, but doesn't provide any safety to the user. As a result, this shouldn't be used for anything that involves writing to the config. 

#### <a id="newConfiguration" href="#newConfiguration">func newConfiguration() *configuration</a>

```
searchKey: config.newConfiguration
```

```Go
func newConfiguration() *configuration
```

#### <a id="configuration.Active" href="#configuration.Active">func (c *configuration) Active() *window.Configuration</a>

```
searchKey: config.configuration.Active
```

```Go
func (c *configuration) Active() *window.Configuration
```

#### <a id="configuration.Subscribe" href="#configuration.Subscribe">func (c *configuration) Subscribe() chan *window.Configuration</a>

```
searchKey: config.configuration.Subscribe
```

```Go
func (c *configuration) Subscribe() chan *window.Configuration
```

#### <a id="configuration.Unsubscribe" href="#configuration.Unsubscribe">func (c *configuration) Unsubscribe(ch chan *window.Configuration)</a>

```
searchKey: config.configuration.Unsubscribe
```

```Go
func (c *configuration) Unsubscribe(ch chan *window.Configuration)
```

#### <a id="configuration.notify" href="#configuration.notify">func (c *configuration) notify()</a>

```
searchKey: config.configuration.notify
```

```Go
func (c *configuration) notify()
```

## <a id="func" href="#func">Functions</a>

### <a id="ActiveWindow" href="#ActiveWindow">func ActiveWindow() *window.Configuration</a>

```
searchKey: config.ActiveWindow
tags: [exported]
```

```Go
func ActiveWindow() *window.Configuration
```

ActiveWindow returns the window configuration in effect at the present time. This is not a live object, and may become outdated if held for long periods. 

### <a id="Subscribe" href="#Subscribe">func Subscribe() chan *window.Configuration</a>

```
searchKey: config.Subscribe
tags: [exported]
```

```Go
func Subscribe() chan *window.Configuration
```

Subscribe returns a channel that will receive a message with the new configuration each time it is updated. 

### <a id="Unsubscribe" href="#Unsubscribe">func Unsubscribe(ch chan *window.Configuration)</a>

```
searchKey: config.Unsubscribe
tags: [exported]
```

```Go
func Unsubscribe(ch chan *window.Configuration)
```

Unsubscribe removes a channel returned from Subscribe() from the notification list. 

### <a id="Reset" href="#Reset">func Reset()</a>

```
searchKey: config.Reset
tags: [exported]
```

```Go
func Reset()
```

Reset destroys the existing singleton and forces it to be reinitialised the next time Active() is called. This should never be used in non-testing code. 

### <a id="sameConfiguration" href="#sameConfiguration">func sameConfiguration(prev, next *[]*schema.BatchChangeRolloutWindow) bool</a>

```
searchKey: config.sameConfiguration
```

```Go
func sameConfiguration(prev, next *[]*schema.BatchChangeRolloutWindow) bool
```

### <a id="TestConfiguration" href="#TestConfiguration">func TestConfiguration(t *testing.T)</a>

```
searchKey: config.TestConfiguration
```

```Go
func TestConfiguration(t *testing.T)
```

