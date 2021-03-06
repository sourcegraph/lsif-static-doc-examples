# Package queryrunnerapi

Package queryrunnerapi implements a client for the query-runner service. 

## Index

* [Constants](#const)
    * [const PathSavedQueryWasCreatedOrUpdated](#PathSavedQueryWasCreatedOrUpdated)
    * [const PathSavedQueryWasDeleted](#PathSavedQueryWasDeleted)
    * [const PathTestNotification](#PathTestNotification)
* [Variables](#var)
    * [var Client](#Client)
    * [var queryRunnerURL](#queryRunnerURL)
* [Types](#type)
    * [type ErrorResponse struct](#ErrorResponse)
    * [type SavedQueryWasCreatedOrUpdatedArgs struct](#SavedQueryWasCreatedOrUpdatedArgs)
    * [type SavedQueryWasDeletedArgs struct](#SavedQueryWasDeletedArgs)
    * [type SubjectAndConfig struct](#SubjectAndConfig)
    * [type TestNotificationArgs struct](#TestNotificationArgs)
    * [type client struct](#client)
        * [func (c *client) SavedQueryWasCreatedOrUpdated(ctx context.Context, subject api.SettingsSubject, config api.PartialConfigSavedQueries, disableSubscriptionNotifications bool) error](#client.SavedQueryWasCreatedOrUpdated)
        * [func (c *client) SavedQueryWasDeleted(ctx context.Context, spec api.SavedQueryIDSpec, disableSubscriptionNotifications bool) error](#client.SavedQueryWasDeleted)
        * [func (c *client) TestNotification(ctx context.Context, savedSearch api.SavedQuerySpecAndConfig)](#client.TestNotification)
        * [func (c *client) post(path string, data interface{}) error](#client.post)


## <a id="const" href="#const">Constants</a>

### <a id="PathSavedQueryWasCreatedOrUpdated" href="#PathSavedQueryWasCreatedOrUpdated">const PathSavedQueryWasCreatedOrUpdated</a>

```
searchKey: queryrunnerapi.PathSavedQueryWasCreatedOrUpdated
tags: [constant string]
```

```Go
const PathSavedQueryWasCreatedOrUpdated = "/saved-query-was-created-or-updated"
```

### <a id="PathSavedQueryWasDeleted" href="#PathSavedQueryWasDeleted">const PathSavedQueryWasDeleted</a>

```
searchKey: queryrunnerapi.PathSavedQueryWasDeleted
tags: [constant string]
```

```Go
const PathSavedQueryWasDeleted = "/saved-query-was-deleted"
```

### <a id="PathTestNotification" href="#PathTestNotification">const PathTestNotification</a>

```
searchKey: queryrunnerapi.PathTestNotification
tags: [constant string]
```

```Go
const PathTestNotification = "/test-notification"
```

## <a id="var" href="#var">Variables</a>

### <a id="Client" href="#Client">var Client</a>

```
searchKey: queryrunnerapi.Client
tags: [variable struct]
```

```Go
var Client = &client{
	client: &http.Client{
		Timeout: 5 * time.Second,
	},
}
```

### <a id="queryRunnerURL" href="#queryRunnerURL">var queryRunnerURL</a>

```
searchKey: queryrunnerapi.queryRunnerURL
tags: [variable string private]
```

```Go
var queryRunnerURL = ...
```

## <a id="type" href="#type">Types</a>

### <a id="ErrorResponse" href="#ErrorResponse">type ErrorResponse struct</a>

```
searchKey: queryrunnerapi.ErrorResponse
tags: [struct]
```

```Go
type ErrorResponse struct {
	Message string
}
```

### <a id="SavedQueryWasCreatedOrUpdatedArgs" href="#SavedQueryWasCreatedOrUpdatedArgs">type SavedQueryWasCreatedOrUpdatedArgs struct</a>

```
searchKey: queryrunnerapi.SavedQueryWasCreatedOrUpdatedArgs
tags: [struct]
```

```Go
type SavedQueryWasCreatedOrUpdatedArgs struct {
	SubjectAndConfig                 *SubjectAndConfig
	DisableSubscriptionNotifications bool
}
```

### <a id="SavedQueryWasDeletedArgs" href="#SavedQueryWasDeletedArgs">type SavedQueryWasDeletedArgs struct</a>

```
searchKey: queryrunnerapi.SavedQueryWasDeletedArgs
tags: [struct]
```

```Go
type SavedQueryWasDeletedArgs struct {
	Spec                             api.SavedQueryIDSpec
	DisableSubscriptionNotifications bool
}
```

### <a id="SubjectAndConfig" href="#SubjectAndConfig">type SubjectAndConfig struct</a>

```
searchKey: queryrunnerapi.SubjectAndConfig
tags: [struct]
```

```Go
type SubjectAndConfig struct {
	Subject api.SettingsSubject
	Config  api.PartialConfigSavedQueries
}
```

### <a id="TestNotificationArgs" href="#TestNotificationArgs">type TestNotificationArgs struct</a>

```
searchKey: queryrunnerapi.TestNotificationArgs
tags: [struct]
```

```Go
type TestNotificationArgs struct {
	SavedSearch api.SavedQuerySpecAndConfig
}
```

### <a id="client" href="#client">type client struct</a>

```
searchKey: queryrunnerapi.client
tags: [struct private]
```

```Go
type client struct {
	client *http.Client
}
```

#### <a id="client.SavedQueryWasCreatedOrUpdated" href="#client.SavedQueryWasCreatedOrUpdated">func (c *client) SavedQueryWasCreatedOrUpdated(ctx context.Context, subject api.SettingsSubject, config api.PartialConfigSavedQueries, disableSubscriptionNotifications bool) error</a>

```
searchKey: queryrunnerapi.client.SavedQueryWasCreatedOrUpdated
tags: [method private]
```

```Go
func (c *client) SavedQueryWasCreatedOrUpdated(ctx context.Context, subject api.SettingsSubject, config api.PartialConfigSavedQueries, disableSubscriptionNotifications bool) error
```

SavedQueryWasCreated should be called whenever a saved query was created or updated after the server has started. 

#### <a id="client.SavedQueryWasDeleted" href="#client.SavedQueryWasDeleted">func (c *client) SavedQueryWasDeleted(ctx context.Context, spec api.SavedQueryIDSpec, disableSubscriptionNotifications bool) error</a>

```
searchKey: queryrunnerapi.client.SavedQueryWasDeleted
tags: [method private]
```

```Go
func (c *client) SavedQueryWasDeleted(ctx context.Context, spec api.SavedQueryIDSpec, disableSubscriptionNotifications bool) error
```

SavedQueryWasDeleted should be called whenever a saved query was deleted after the server has started. 

#### <a id="client.TestNotification" href="#client.TestNotification">func (c *client) TestNotification(ctx context.Context, savedSearch api.SavedQuerySpecAndConfig)</a>

```
searchKey: queryrunnerapi.client.TestNotification
tags: [method private]
```

```Go
func (c *client) TestNotification(ctx context.Context, savedSearch api.SavedQuerySpecAndConfig)
```

TestNotification is called to send a test notification for a saved search. Users may perform this action to test that the configured notifications are working. 

#### <a id="client.post" href="#client.post">func (c *client) post(path string, data interface{}) error</a>

```
searchKey: queryrunnerapi.client.post
tags: [method private]
```

```Go
func (c *client) post(path string, data interface{}) error
```

