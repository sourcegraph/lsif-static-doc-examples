# Package symbols

## Index

* [Variables](#var)
    * [var DefaultClient](#DefaultClient)
    * [var symbolsURL](#symbolsURL)
* [Types](#type)
    * [type Client struct](#Client)
        * [func (c *Client) Search(ctx context.Context, args search.SymbolsParameters) (result *result.Symbols, err error)](#Client.Search)
        * [func (c *Client) httpPost(ctx context.Context, method string, key key, payload interface{}) (resp *http.Response, err error)](#Client.httpPost)
        * [func (c *Client) url(key key) (string, error)](#Client.url)
    * [type key struct](#key)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="DefaultClient" href="#DefaultClient">var DefaultClient</a>

```
searchKey: symbols.DefaultClient
tags: [variable struct]
```

```Go
var DefaultClient = ...
```

DefaultClient is the default Client. Unless overwritten, it is connected to the server specified by the SYMBOLS_URL environment variable. 

### <a id="symbolsURL" href="#symbolsURL">var symbolsURL</a>

```
searchKey: symbols.symbolsURL
tags: [variable string private]
```

```Go
var symbolsURL = env.Get("SYMBOLS_URL", "k8s+http://symbols:3184", "symbols service URL")
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: symbols.Client
tags: [struct]
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

#### <a id="Client.Search" href="#Client.Search">func (c *Client) Search(ctx context.Context, args search.SymbolsParameters) (result *result.Symbols, err error)</a>

```
searchKey: symbols.Client.Search
tags: [method]
```

```Go
func (c *Client) Search(ctx context.Context, args search.SymbolsParameters) (result *result.Symbols, err error)
```

Search performs a symbol search on the symbols service. 

#### <a id="Client.httpPost" href="#Client.httpPost">func (c *Client) httpPost(ctx context.Context, method string, key key, payload interface{}) (resp *http.Response, err error)</a>

```
searchKey: symbols.Client.httpPost
tags: [method private]
```

```Go
func (c *Client) httpPost(ctx context.Context, method string, key key, payload interface{}) (resp *http.Response, err error)
```

#### <a id="Client.url" href="#Client.url">func (c *Client) url(key key) (string, error)</a>

```
searchKey: symbols.Client.url
tags: [method private]
```

```Go
func (c *Client) url(key key) (string, error)
```

### <a id="key" href="#key">type key struct</a>

```
searchKey: symbols.key
tags: [struct private]
```

```Go
type key struct {
	repo     api.RepoName
	commitID api.CommitID
}
```

