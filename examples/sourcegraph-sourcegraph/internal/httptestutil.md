# Package httptestutil

## Index

* [Types](#type)
    * [type Client struct](#Client)
        * [func NewTest(h http.Handler) *Client](#NewTest)
        * [func (c *Client) Do(req *http.Request) (*http.Response, error)](#Client.Do)
        * [func (c *Client) DoJSON(method, url string, in, out interface{}) error](#Client.DoJSON)
        * [func (c Client) DoNoFollowRedirects(req *http.Request) (*http.Response, error)](#Client.DoNoFollowRedirects)
        * [func (c *Client) DoOK(req *http.Request) (*http.Response, error)](#Client.DoOK)
        * [func (c *Client) Get(url string) (*http.Response, error)](#Client.Get)
        * [func (c *Client) GetJSON(url string, v interface{}) error](#Client.GetJSON)
        * [func (c Client) GetNoFollowRedirects(url_ string) (*http.Response, error)](#Client.GetNoFollowRedirects)
        * [func (c *Client) GetOK(url string) (*http.Response, error)](#Client.GetOK)
        * [func (c *Client) PostFormNoFollowRedirects(url string, data url.Values) (*http.Response, error)](#Client.PostFormNoFollowRedirects)
        * [func (c *Client) PostOK(url string, body io.Reader) (*http.Response, error)](#Client.PostOK)
    * [type handlerTransport struct](#handlerTransport)
        * [func (t handlerTransport) RoundTrip(req *http.Request) (*http.Response, error)](#handlerTransport.RoundTrip)
* [Functions](#func)
    * [func NewGitHubRecorderFactory(t testing.TB, update bool, name string) (*httpcli.Factory, func())](#NewGitHubRecorderFactory)
    * [func NewRecorder(file string, record bool, filters ...cassette.Filter) (*recorder.Recorder, error)](#NewRecorder)
    * [func NewRecorderFactory(t testing.TB, update bool, name string) (*httpcli.Factory, func())](#NewRecorderFactory)
    * [func NewRecorderOpt(rec *recorder.Recorder) httpcli.Opt](#NewRecorderOpt)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: httptestutil.Client
tags: [struct]
```

```Go
type Client struct{ http.Client }
```

#### <a id="NewTest" href="#NewTest">func NewTest(h http.Handler) *Client</a>

```
searchKey: httptestutil.NewTest
tags: [method]
```

```Go
func NewTest(h http.Handler) *Client
```

#### <a id="Client.Do" href="#Client.Do">func (c *Client) Do(req *http.Request) (*http.Response, error)</a>

```
searchKey: httptestutil.Client.Do
tags: [method]
```

```Go
func (c *Client) Do(req *http.Request) (*http.Response, error)
```

Do buffers the response body so that callers need not call resp.Body.Close(). 

#### <a id="Client.DoJSON" href="#Client.DoJSON">func (c *Client) DoJSON(method, url string, in, out interface{}) error</a>

```
searchKey: httptestutil.Client.DoJSON
tags: [method]
```

```Go
func (c *Client) DoJSON(method, url string, in, out interface{}) error
```

#### <a id="Client.DoNoFollowRedirects" href="#Client.DoNoFollowRedirects">func (c Client) DoNoFollowRedirects(req *http.Request) (*http.Response, error)</a>

```
searchKey: httptestutil.Client.DoNoFollowRedirects
tags: [method]
```

```Go
func (c Client) DoNoFollowRedirects(req *http.Request) (*http.Response, error)
```

#### <a id="Client.DoOK" href="#Client.DoOK">func (c *Client) DoOK(req *http.Request) (*http.Response, error)</a>

```
searchKey: httptestutil.Client.DoOK
tags: [method]
```

```Go
func (c *Client) DoOK(req *http.Request) (*http.Response, error)
```

DoOK checks that the response is HTTP 200. 

#### <a id="Client.Get" href="#Client.Get">func (c *Client) Get(url string) (*http.Response, error)</a>

```
searchKey: httptestutil.Client.Get
tags: [method]
```

```Go
func (c *Client) Get(url string) (*http.Response, error)
```

Get buffers the response body so that callers need not call resp.Body.Close(). 

#### <a id="Client.GetJSON" href="#Client.GetJSON">func (c *Client) GetJSON(url string, v interface{}) error</a>

```
searchKey: httptestutil.Client.GetJSON
tags: [method]
```

```Go
func (c *Client) GetJSON(url string, v interface{}) error
```

#### <a id="Client.GetNoFollowRedirects" href="#Client.GetNoFollowRedirects">func (c Client) GetNoFollowRedirects(url_ string) (*http.Response, error)</a>

```
searchKey: httptestutil.Client.GetNoFollowRedirects
tags: [method]
```

```Go
func (c Client) GetNoFollowRedirects(url_ string) (*http.Response, error)
```

#### <a id="Client.GetOK" href="#Client.GetOK">func (c *Client) GetOK(url string) (*http.Response, error)</a>

```
searchKey: httptestutil.Client.GetOK
tags: [method]
```

```Go
func (c *Client) GetOK(url string) (*http.Response, error)
```

GetOK checks that the response is HTTP 200. 

#### <a id="Client.PostFormNoFollowRedirects" href="#Client.PostFormNoFollowRedirects">func (c *Client) PostFormNoFollowRedirects(url string, data url.Values) (*http.Response, error)</a>

```
searchKey: httptestutil.Client.PostFormNoFollowRedirects
tags: [method]
```

```Go
func (c *Client) PostFormNoFollowRedirects(url string, data url.Values) (*http.Response, error)
```

#### <a id="Client.PostOK" href="#Client.PostOK">func (c *Client) PostOK(url string, body io.Reader) (*http.Response, error)</a>

```
searchKey: httptestutil.Client.PostOK
tags: [method]
```

```Go
func (c *Client) PostOK(url string, body io.Reader) (*http.Response, error)
```

PostOK checks that the response is HTTP 200. 

### <a id="handlerTransport" href="#handlerTransport">type handlerTransport struct</a>

```
searchKey: httptestutil.handlerTransport
tags: [struct private]
```

```Go
type handlerTransport struct {
	http.Handler
}
```

#### <a id="handlerTransport.RoundTrip" href="#handlerTransport.RoundTrip">func (t handlerTransport) RoundTrip(req *http.Request) (*http.Response, error)</a>

```
searchKey: httptestutil.handlerTransport.RoundTrip
tags: [method private]
```

```Go
func (t handlerTransport) RoundTrip(req *http.Request) (*http.Response, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewGitHubRecorderFactory" href="#NewGitHubRecorderFactory">func NewGitHubRecorderFactory(t testing.TB, update bool, name string) (*httpcli.Factory, func())</a>

```
searchKey: httptestutil.NewGitHubRecorderFactory
tags: [method]
```

```Go
func NewGitHubRecorderFactory(t testing.TB, update bool, name string) (*httpcli.Factory, func())
```

NewGitHubRecorderFactory returns a *http.Factory that rewrites HTTP requests to github-proxy to github.com and records all HTTP requests in "testdata/vcr/{name}" with {name} being the name that's passed in. 

If update is true, the HTTP requests are recorded, otherwise they're replayed from the recorded cassette. 

### <a id="NewRecorder" href="#NewRecorder">func NewRecorder(file string, record bool, filters ...cassette.Filter) (*recorder.Recorder, error)</a>

```
searchKey: httptestutil.NewRecorder
tags: [method]
```

```Go
func NewRecorder(file string, record bool, filters ...cassette.Filter) (*recorder.Recorder, error)
```

NewRecorder returns an HTTP interaction recorder with the given record mode and filters. It strips away the HTTP Authorization and Set-Cookie headers. 

### <a id="NewRecorderFactory" href="#NewRecorderFactory">func NewRecorderFactory(t testing.TB, update bool, name string) (*httpcli.Factory, func())</a>

```
searchKey: httptestutil.NewRecorderFactory
tags: [method]
```

```Go
func NewRecorderFactory(t testing.TB, update bool, name string) (*httpcli.Factory, func())
```

NewRecorderFactory returns a *httpcli.Factory that records all HTTP requests in "testdata/vcr/{name}" with {name} being the name that's passed in. 

If update is true, the HTTP requests are recorded, otherwise they're replayed from the recorded cassette. 

### <a id="NewRecorderOpt" href="#NewRecorderOpt">func NewRecorderOpt(rec *recorder.Recorder) httpcli.Opt</a>

```
searchKey: httptestutil.NewRecorderOpt
tags: [method]
```

```Go
func NewRecorderOpt(rec *recorder.Recorder) httpcli.Opt
```

NewRecorderOpt returns an httpcli.Opt that wraps the Transport of an http.Client with the given recorder. 

