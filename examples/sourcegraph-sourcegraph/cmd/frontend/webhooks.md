# Package webhooks

## Index

* [Variables](#var)
    * [var dsn](#dsn)
    * [var eventPayload](#eventPayload)
* [Types](#type)
    * [type GitHubWebhook struct](#GitHubWebhook)
        * [func (h *GitHubWebhook) Dispatch(ctx context.Context, eventType string, extSvc *types.ExternalService, e interface{}) error](#GitHubWebhook.Dispatch)
        * [func (h *GitHubWebhook) Register(handler WebhookHandler, eventTypes ...string)](#GitHubWebhook.Register)
        * [func (h *GitHubWebhook) ServeHTTP(w http.ResponseWriter, r *http.Request)](#GitHubWebhook.ServeHTTP)
        * [func (h *GitHubWebhook) findAndValidateExternalService(ctx context.Context, sig string, body []byte) (*types.ExternalService, error)](#GitHubWebhook.findAndValidateExternalService)
        * [func (h *GitHubWebhook) getExternalService(r *http.Request, body []byte) (*types.ExternalService, error)](#GitHubWebhook.getExternalService)
    * [type Registerer interface](#Registerer)
    * [type WebhookHandler func(ctx context.Context, extSvc *github.com/sourcegraph/sourcegraph/internal/types.ExternalService, event interface{}) error](#WebhookHandler)
* [Functions](#func)
    * [func TestGithubWebhookDispatchError(t *testing.T)](#TestGithubWebhookDispatchError)
    * [func TestGithubWebhookDispatchNoHandler(t *testing.T)](#TestGithubWebhookDispatchNoHandler)
    * [func TestGithubWebhookDispatchSuccess(t *testing.T)](#TestGithubWebhookDispatchSuccess)
    * [func TestGithubWebhookDispatchSuccessMultiple(t *testing.T)](#TestGithubWebhookDispatchSuccessMultiple)
    * [func TestGithubWebhookExternalServices(t *testing.T)](#TestGithubWebhookExternalServices)
    * [func errString(err error) string](#errString)
    * [func marshalJSON(t testing.TB, v interface{}) string](#marshalJSON)
    * [func sign(t *testing.T, message, secret []byte) string](#sign)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="dsn" href="#dsn">var dsn</a>

```
searchKey: webhooks.dsn
tags: [variable string private]
```

```Go
var dsn = flag.String("dsn", "", "Database connection string to use in integration tests")
```

### <a id="eventPayload" href="#eventPayload">var eventPayload</a>

```
searchKey: webhooks.eventPayload
tags: [variable array number private]
```

```Go
var eventPayload = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="GitHubWebhook" href="#GitHubWebhook">type GitHubWebhook struct</a>

```
searchKey: webhooks.GitHubWebhook
tags: [struct]
```

```Go
type GitHubWebhook struct {
	ExternalServices *database.ExternalServiceStore

	mu       sync.RWMutex
	handlers map[string][]WebhookHandler
}
```

GitHubWebhook is responsible for handling incoming http requests for github webhooks and routing to any registered WebhookHandlers, events are routed by their event type, passed in the X-Github-Event header 

#### <a id="GitHubWebhook.Dispatch" href="#GitHubWebhook.Dispatch">func (h *GitHubWebhook) Dispatch(ctx context.Context, eventType string, extSvc *types.ExternalService, e interface{}) error</a>

```
searchKey: webhooks.GitHubWebhook.Dispatch
tags: [method]
```

```Go
func (h *GitHubWebhook) Dispatch(ctx context.Context, eventType string, extSvc *types.ExternalService, e interface{}) error
```

Dispatch accepts an event for a particular event type and dispatches it to the appropriate stack of handlers, if any are configured. 

#### <a id="GitHubWebhook.Register" href="#GitHubWebhook.Register">func (h *GitHubWebhook) Register(handler WebhookHandler, eventTypes ...string)</a>

```
searchKey: webhooks.GitHubWebhook.Register
tags: [method]
```

```Go
func (h *GitHubWebhook) Register(handler WebhookHandler, eventTypes ...string)
```

Register associates a given event type(s) with the specified handler. Handlers are organized into a stack and executed sequentially, so the order in which they are provided is significant. 

#### <a id="GitHubWebhook.ServeHTTP" href="#GitHubWebhook.ServeHTTP">func (h *GitHubWebhook) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: webhooks.GitHubWebhook.ServeHTTP
tags: [method]
```

```Go
func (h *GitHubWebhook) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

#### <a id="GitHubWebhook.findAndValidateExternalService" href="#GitHubWebhook.findAndValidateExternalService">func (h *GitHubWebhook) findAndValidateExternalService(ctx context.Context, sig string, body []byte) (*types.ExternalService, error)</a>

```
searchKey: webhooks.GitHubWebhook.findAndValidateExternalService
tags: [method private]
```

```Go
func (h *GitHubWebhook) findAndValidateExternalService(ctx context.Context, sig string, body []byte) (*types.ExternalService, error)
```

findExternalService is the slow path for validating an incoming webhook against a configured external service, it iterates over all configured external services and attempts to match the signature to the configured secret TODO: delete this once old style webhooks are deprecated 

#### <a id="GitHubWebhook.getExternalService" href="#GitHubWebhook.getExternalService">func (h *GitHubWebhook) getExternalService(r *http.Request, body []byte) (*types.ExternalService, error)</a>

```
searchKey: webhooks.GitHubWebhook.getExternalService
tags: [method private]
```

```Go
func (h *GitHubWebhook) getExternalService(r *http.Request, body []byte) (*types.ExternalService, error)
```

### <a id="Registerer" href="#Registerer">type Registerer interface</a>

```
searchKey: webhooks.Registerer
tags: [interface]
```

```Go
type Registerer interface {
	Register(webhook *GitHubWebhook)
}
```

### <a id="WebhookHandler" href="#WebhookHandler">type WebhookHandler func(ctx context.Context, extSvc *github.com/sourcegraph/sourcegraph/internal/types.ExternalService, event interface{}) error</a>

```
searchKey: webhooks.WebhookHandler
tags: [function]
```

```Go
type WebhookHandler func(ctx context.Context, extSvc *types.ExternalService, event interface{}) error
```

WebhookHandler is a handler for a webhook event, the 'event' param could be any of the event types permissible based on the event type(s) the handler was registered against. If you register a handler for many event types, you should do a type switch within your handler 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="TestGithubWebhookDispatchError" href="#TestGithubWebhookDispatchError">func TestGithubWebhookDispatchError(t *testing.T)</a>

```
searchKey: webhooks.TestGithubWebhookDispatchError
tags: [method private test]
```

```Go
func TestGithubWebhookDispatchError(t *testing.T)
```

### <a id="TestGithubWebhookDispatchNoHandler" href="#TestGithubWebhookDispatchNoHandler">func TestGithubWebhookDispatchNoHandler(t *testing.T)</a>

```
searchKey: webhooks.TestGithubWebhookDispatchNoHandler
tags: [method private test]
```

```Go
func TestGithubWebhookDispatchNoHandler(t *testing.T)
```

### <a id="TestGithubWebhookDispatchSuccess" href="#TestGithubWebhookDispatchSuccess">func TestGithubWebhookDispatchSuccess(t *testing.T)</a>

```
searchKey: webhooks.TestGithubWebhookDispatchSuccess
tags: [method private test]
```

```Go
func TestGithubWebhookDispatchSuccess(t *testing.T)
```

### <a id="TestGithubWebhookDispatchSuccessMultiple" href="#TestGithubWebhookDispatchSuccessMultiple">func TestGithubWebhookDispatchSuccessMultiple(t *testing.T)</a>

```
searchKey: webhooks.TestGithubWebhookDispatchSuccessMultiple
tags: [method private test]
```

```Go
func TestGithubWebhookDispatchSuccessMultiple(t *testing.T)
```

### <a id="TestGithubWebhookExternalServices" href="#TestGithubWebhookExternalServices">func TestGithubWebhookExternalServices(t *testing.T)</a>

```
searchKey: webhooks.TestGithubWebhookExternalServices
tags: [method private test]
```

```Go
func TestGithubWebhookExternalServices(t *testing.T)
```

### <a id="errString" href="#errString">func errString(err error) string</a>

```
searchKey: webhooks.errString
tags: [method private]
```

```Go
func errString(err error) string
```

### <a id="marshalJSON" href="#marshalJSON">func marshalJSON(t testing.TB, v interface{}) string</a>

```
searchKey: webhooks.marshalJSON
tags: [method private]
```

```Go
func marshalJSON(t testing.TB, v interface{}) string
```

### <a id="sign" href="#sign">func sign(t *testing.T, message, secret []byte) string</a>

```
searchKey: webhooks.sign
tags: [method private]
```

```Go
func sign(t *testing.T, message, secret []byte) string
```

