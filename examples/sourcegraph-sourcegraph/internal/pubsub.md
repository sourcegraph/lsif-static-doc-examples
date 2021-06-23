# Package pubsub

Package pubsub is a lightweight wrapper around pubsub which initializes pubsub based on environment variables. 

## Index

* [Variables](#var)
    * [var PubSubProjectID](#PubSubProjectID)
    * [var PubSubCredentialsFile](#PubSubCredentialsFile)
    * [var client](#client)
* [Functions](#func)
    * [func Enabled() bool](#Enabled)
    * [func init()](#init.publish.go)
    * [func Publish(topic string, msg string) error](#Publish)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="PubSubProjectID" href="#PubSubProjectID">var PubSubProjectID</a>

```
searchKey: pubsub.PubSubProjectID
```

```Go
var PubSubProjectID = ...
```

PubSubProjectID is used to create a new pubsub client. 

### <a id="PubSubCredentialsFile" href="#PubSubCredentialsFile">var PubSubCredentialsFile</a>

```
searchKey: pubsub.PubSubCredentialsFile
```

```Go
var PubSubCredentialsFile = ...
```

### <a id="client" href="#client">var client</a>

```
searchKey: pubsub.client
tags: [private]
```

```Go
var client *pubsub.Client
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Enabled" href="#Enabled">func Enabled() bool</a>

```
searchKey: pubsub.Enabled
```

```Go
func Enabled() bool
```

Enabled returns true if pubsub has been configured to run. 

### <a id="init.publish.go" href="#init.publish.go">func init()</a>

```
searchKey: pubsub.init
tags: [private]
```

```Go
func init()
```

### <a id="Publish" href="#Publish">func Publish(topic string, msg string) error</a>

```
searchKey: pubsub.Publish
```

```Go
func Publish(topic string, msg string) error
```

Publish publishes msg to the topic asynchronously. Messages are batched and sent according to the topic's PublishSettings. 

