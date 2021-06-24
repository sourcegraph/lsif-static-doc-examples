# Package pubsub

Package pubsub is a lightweight wrapper around pubsub which initializes pubsub based on environment variables. 

## Index

* [Variables](#var)
    * [var PubSubCredentialsFile](#PubSubCredentialsFile)
    * [var PubSubProjectID](#PubSubProjectID)
    * [var client](#client)
* [Functions](#func)
    * [func Enabled() bool](#Enabled)
    * [func Publish(topic string, msg string) error](#Publish)
    * [func init()](#init.publish.go)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="PubSubCredentialsFile" href="#PubSubCredentialsFile">var PubSubCredentialsFile</a>

```
searchKey: pubsub.PubSubCredentialsFile
tags: [variable string]
```

```Go
var PubSubCredentialsFile = ...
```

### <a id="PubSubProjectID" href="#PubSubProjectID">var PubSubProjectID</a>

```
searchKey: pubsub.PubSubProjectID
tags: [variable string]
```

```Go
var PubSubProjectID = ...
```

PubSubProjectID is used to create a new pubsub client. 

### <a id="client" href="#client">var client</a>

```
searchKey: pubsub.client
tags: [variable struct private]
```

```Go
var client *pubsub.Client
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Enabled" href="#Enabled">func Enabled() bool</a>

```
searchKey: pubsub.Enabled
tags: [function]
```

```Go
func Enabled() bool
```

Enabled returns true if pubsub has been configured to run. 

### <a id="Publish" href="#Publish">func Publish(topic string, msg string) error</a>

```
searchKey: pubsub.Publish
tags: [method]
```

```Go
func Publish(topic string, msg string) error
```

Publish publishes msg to the topic asynchronously. Messages are batched and sent according to the topic's PublishSettings. 

### <a id="init.publish.go" href="#init.publish.go">func init()</a>

```
searchKey: pubsub.init
tags: [function private]
```

```Go
func init()
```

