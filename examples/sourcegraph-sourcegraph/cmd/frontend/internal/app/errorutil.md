# Package errorutil

Package errorutil exports a HTTP Middleware for HTTP handlers which return errors. 

## Index

* [Functions](#func)
    * [func Handler(h func(http.ResponseWriter, *http.Request) error) http.Handler](#Handler)


## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Handler" href="#Handler">func Handler(h func(http.ResponseWriter, *http.Request) error) http.Handler</a>

```
searchKey: errorutil.Handler
tags: [function]
```

```Go
func Handler(h func(http.ResponseWriter, *http.Request) error) http.Handler
```

Handler is a wrapper func for app HTTP handlers that enables app error pages. 

