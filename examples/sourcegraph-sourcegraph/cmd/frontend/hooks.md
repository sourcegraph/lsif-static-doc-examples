# Package hooks

Package hooks allow hooking into the frontend. 

## Index

* [Variables](#var)
    * [var PostAuthMiddleware](#PostAuthMiddleware)


## <a id="var" href="#var">Variables</a>

### <a id="PostAuthMiddleware" href="#PostAuthMiddleware">var PostAuthMiddleware</a>

```
searchKey: hooks.PostAuthMiddleware
```

```Go
var PostAuthMiddleware func(http.Handler) http.Handler
```

PostAuthMiddleware is an HTTP handler middleware that, if set, runs just before auth-related middleware. The client is authenticated when PostAuthMiddleware is called. 

