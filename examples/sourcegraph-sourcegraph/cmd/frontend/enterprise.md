# Package enterprise

## Index

* [Types](#type)
    * [type Services struct](#Services)
        * [func DefaultServices() Services](#DefaultServices)
    * [type NewCodeIntelUploadHandler func(internal bool) net/http.Handler](#NewCodeIntelUploadHandler)
    * [type NewExecutorProxyHandler func() net/http.Handler](#NewExecutorProxyHandler)
    * [type registerFunc func(webhook *github.com/sourcegraph/sourcegraph/cmd/frontend/webhooks.GitHubWebhook)](#registerFunc)
        * [func (fn registerFunc) Register(w *webhooks.GitHubWebhook)](#registerFunc.Register)
* [Functions](#func)
    * [func makeNotFoundHandler(handlerName string) http.Handler](#makeNotFoundHandler)


## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Services" href="#Services">type Services struct</a>

```
searchKey: enterprise.Services
tags: [exported]
```

```Go
type Services struct {
	GitHubWebhook             webhooks.Registerer
	GitLabWebhook             http.Handler
	BitbucketServerWebhook    http.Handler
	NewCodeIntelUploadHandler NewCodeIntelUploadHandler
	NewExecutorProxyHandler   NewExecutorProxyHandler
	AuthzResolver             graphqlbackend.AuthzResolver
	BatchChangesResolver      graphqlbackend.BatchChangesResolver
	CodeIntelResolver         graphqlbackend.CodeIntelResolver
	InsightsResolver          graphqlbackend.InsightsResolver
	CodeMonitorsResolver      graphqlbackend.CodeMonitorsResolver
	LicenseResolver           graphqlbackend.LicenseResolver
	DotcomResolver            graphqlbackend.DotcomRootResolver
}
```

Services is a bag of HTTP handlers and factory functions that are registered by the enterprise frontend setup hook. 

#### <a id="DefaultServices" href="#DefaultServices">func DefaultServices() Services</a>

```
searchKey: enterprise.DefaultServices
tags: [exported]
```

```Go
func DefaultServices() Services
```

DefaultServices creates a new Services value that has default implementations for all services. 

### <a id="NewCodeIntelUploadHandler" href="#NewCodeIntelUploadHandler">type NewCodeIntelUploadHandler func(internal bool) net/http.Handler</a>

```
searchKey: enterprise.NewCodeIntelUploadHandler
tags: [exported]
```

```Go
type NewCodeIntelUploadHandler func(internal bool) http.Handler
```

NewCodeIntelUploadHandler creates a new handler for the LSIF upload endpoint. The resulting handler skips auth checks when the internal flag is true. 

### <a id="NewExecutorProxyHandler" href="#NewExecutorProxyHandler">type NewExecutorProxyHandler func() net/http.Handler</a>

```
searchKey: enterprise.NewExecutorProxyHandler
tags: [exported]
```

```Go
type NewExecutorProxyHandler func() http.Handler
```

NewExecutorProxyHandler creates a new proxy handler for routes accessible to the executor services deployed separately from the k8s cluster. This handler is protected via a shared username and password. 

### <a id="registerFunc" href="#registerFunc">type registerFunc func(webhook *github.com/sourcegraph/sourcegraph/cmd/frontend/webhooks.GitHubWebhook)</a>

```
searchKey: enterprise.registerFunc
```

```Go
type registerFunc func(webhook *webhooks.GitHubWebhook)
```

#### <a id="registerFunc.Register" href="#registerFunc.Register">func (fn registerFunc) Register(w *webhooks.GitHubWebhook)</a>

```
searchKey: enterprise.registerFunc.Register
```

```Go
func (fn registerFunc) Register(w *webhooks.GitHubWebhook)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="makeNotFoundHandler" href="#makeNotFoundHandler">func makeNotFoundHandler(handlerName string) http.Handler</a>

```
searchKey: enterprise.makeNotFoundHandler
```

```Go
func makeNotFoundHandler(handlerName string) http.Handler
```

makeNotFoundHandler returns an HTTP handler that respond 404 for all requests. 

