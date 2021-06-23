# Package mux_test

## Index

* [Types](#type)
    * [type authenticationMiddleware struct](#authenticationMiddleware)
        * [func (amw *authenticationMiddleware) Populate()](#authenticationMiddleware.Populate)
        * [func (amw *authenticationMiddleware) Middleware(next http.Handler) http.Handler](#authenticationMiddleware.Middleware)
* [Functions](#func)
    * [func Example_authenticationMiddleware()](#Example_authenticationMiddleware)
    * [func ExampleCORSMethodMiddleware()](#ExampleCORSMethodMiddleware)
    * [func ExampleRoute_HeadersRegexp()](#ExampleRoute_HeadersRegexp)
    * [func ExampleRoute_HeadersRegexp_exactMatch()](#ExampleRoute_HeadersRegexp_exactMatch)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="authenticationMiddleware" href="#authenticationMiddleware">type authenticationMiddleware struct</a>

```
searchKey: mux_test.authenticationMiddleware
tags: [private]
```

```Go
type authenticationMiddleware struct {
	tokenUsers map[string]string
}
```

Define our struct 

#### <a id="authenticationMiddleware.Populate" href="#authenticationMiddleware.Populate">func (amw *authenticationMiddleware) Populate()</a>

```
searchKey: mux_test.authenticationMiddleware.Populate
tags: [private]
```

```Go
func (amw *authenticationMiddleware) Populate()
```

Initialize it somewhere 

#### <a id="authenticationMiddleware.Middleware" href="#authenticationMiddleware.Middleware">func (amw *authenticationMiddleware) Middleware(next http.Handler) http.Handler</a>

```
searchKey: mux_test.authenticationMiddleware.Middleware
tags: [private]
```

```Go
func (amw *authenticationMiddleware) Middleware(next http.Handler) http.Handler
```

Middleware function, which will be called for each request 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Example_authenticationMiddleware" href="#Example_authenticationMiddleware">func Example_authenticationMiddleware()</a>

```
searchKey: mux_test.Example_authenticationMiddleware
tags: [private]
```

```Go
func Example_authenticationMiddleware()
```

### <a id="ExampleCORSMethodMiddleware" href="#ExampleCORSMethodMiddleware">func ExampleCORSMethodMiddleware()</a>

```
searchKey: mux_test.ExampleCORSMethodMiddleware
tags: [private]
```

```Go
func ExampleCORSMethodMiddleware()
```

### <a id="ExampleRoute_HeadersRegexp" href="#ExampleRoute_HeadersRegexp">func ExampleRoute_HeadersRegexp()</a>

```
searchKey: mux_test.ExampleRoute_HeadersRegexp
tags: [private]
```

```Go
func ExampleRoute_HeadersRegexp()
```

This example demonstrates setting a regular expression matcher for the header value. A plain word will match any value that contains a matching substring as if the pattern was wrapped with `.*`. 

### <a id="ExampleRoute_HeadersRegexp_exactMatch" href="#ExampleRoute_HeadersRegexp_exactMatch">func ExampleRoute_HeadersRegexp_exactMatch()</a>

```
searchKey: mux_test.ExampleRoute_HeadersRegexp_exactMatch
tags: [private]
```

```Go
func ExampleRoute_HeadersRegexp_exactMatch()
```

This example demonstrates setting a strict regular expression matcher for the header value. Using the start and end of string anchors, the value must be an exact match. 

