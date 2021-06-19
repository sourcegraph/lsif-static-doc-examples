# Package symbols

## Index

* [Variables](#var)
    * [var symbolsURL](#symbolsURL)
    * [var DefaultClient](#DefaultClient)
* [Types](#type)
    * [type Client struct](#Client)
        * [func (c *Client) url(key key) (string, error)](#Client.url)
        * [func (c *Client) Search(ctx context.Context, args search.SymbolsParameters) (result *result.Symbols, err error)](#Client.Search)
        * [func (c *Client) httpPost(ctx context.Context, method string, key key, payload interface{}) (resp *http.Response, err error)](#Client.httpPost)
    * [type key struct](#key)


## <a id="var" href="#var">Variables</a>

### <a id="symbolsURL" href="#symbolsURL">var symbolsURL</a>

```
searchKey: symbols.symbolsURL
```

```Go
var symbolsURL = env.Get("SYMBOLS_URL", "k8s+http://symbols:3184", "symbols service URL")
```

### <a id="DefaultClient" href="#DefaultClient">var DefaultClient</a>

```
searchKey: symbols.DefaultClient
tags: [exported]
```

```Go
var DefaultClient = ...
```

DefaultClient is the default Client. Unless overwritten, it is connected to the server specified by the SYMBOLS_URL environment variable. 

## <a id="type" href="#type">Types</a>

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: symbols.Client
tags: [exported]
```

```Go
type Client struct {
	// URL to symbols service.
	URL string

	// HTTP client to use
	HTTPClient *http.Client

	// Limits concurrency of outstanding HTTP posts
	HTTPLimiter *parallel.Run

	once     sync.Once
	endpoint *endpoint.Map
}
```

Client is a symbols service client. 

#### <a id="Client.url" href="#Client.url">func (c *Client) url(key key) (string, error)</a>

```
searchKey: symbols.Client.url
```

```Go
func (c *Client) url(key key) (string, error)
```

#### <a id="Client.Search" href="#Client.Search">func (c *Client) Search(ctx context.Context, args search.SymbolsParameters) (result *result.Symbols, err error)</a>

```
searchKey: symbols.Client.Search
tags: [exported]
```

```Go
func (c *Client) Search(ctx context.Context, args search.SymbolsParameters) (result *result.Symbols, err error)
```

Search performs a symbol search on the symbols service. 

#### <a id="Client.httpPost" href="#Client.httpPost">func (c *Client) httpPost(ctx context.Context, method string, key key, payload interface{}) (resp *http.Response, err error)</a>

```
searchKey: symbols.Client.httpPost
```

```Go
func (c *Client) httpPost(ctx context.Context, method string, key key, payload interface{}) (resp *http.Response, err error)
```

### <a id="key" href="#key">type key struct</a>

```
searchKey: symbols.key
```

```Go
type key struct {
	repo     api.RepoName
	commitID api.CommitID
}
```

