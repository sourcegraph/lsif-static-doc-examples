# Package bitbucketcloud

## Index

* [Constants](#const)
    * [const RateLimitMaxBurstRequests](#RateLimitMaxBurstRequests)
    * [const rateLimitRequestsPerSecond](#rateLimitRequestsPerSecond)
* [Variables](#var)
    * [var normalizer](#normalizer)
    * [var requestCounter](#requestCounter)
    * [var update](#update)
* [Types](#type)
    * [type Client struct](#Client)
        * [func NewClient(apiURL *url.URL, httpClient httpcli.Doer) *Client](#NewClient)
        * [func NewTestClient(t testing.TB, name string, update bool, apiURL *url.URL) (*Client, func())](#NewTestClient)
        * [func (c *Client) Repos(ctx context.Context, pageToken *PageToken, accountName string) ([]*Repo, *PageToken, error)](#Client.Repos)
        * [func (c *Client) authenticate(req *http.Request) error](#Client.authenticate)
        * [func (c *Client) do(ctx context.Context, req *http.Request, result interface{}) error](#Client.do)
        * [func (c *Client) page(ctx context.Context, path string, qry url.Values, token *PageToken, results interface{}) (*PageToken, error)](#Client.page)
        * [func (c *Client) reqPage(ctx context.Context, url string, results interface{}) (*PageToken, error)](#Client.reqPage)
    * [type CloneLinks []struct](#CloneLinks)
        * [func (cl CloneLinks) HTTPS() (string, error)](#CloneLinks.HTTPS)
    * [type Link struct](#Link)
    * [type Links struct](#Links)
    * [type PageToken struct](#PageToken)
        * [func (t *PageToken) HasMore() bool](#PageToken.HasMore)
        * [func (t *PageToken) Values() url.Values](#PageToken.Values)
    * [type Repo struct](#Repo)
    * [type httpError struct](#httpError)
        * [func (e *httpError) Error() string](#httpError.Error)
        * [func (e *httpError) NotFound() bool](#httpError.NotFound)
        * [func (e *httpError) Unauthorized() bool](#httpError.Unauthorized)
* [Functions](#func)
    * [func GetenvTestBitbucketCloudUsername() string](#GetenvTestBitbucketCloudUsername)
    * [func TestClient_Repos(t *testing.T)](#TestClient_Repos)
    * [func normalize(path string) string](#normalize)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="RateLimitMaxBurstRequests" href="#RateLimitMaxBurstRequests">const RateLimitMaxBurstRequests</a>

```
searchKey: bitbucketcloud.RateLimitMaxBurstRequests
tags: [constant number]
```

```Go
const RateLimitMaxBurstRequests = 500
```

These fields define the self-imposed Bitbucket rate limit (since Bitbucket Cloud does not have a concept of rate limiting in HTTP response headers). 

See [https://godoc.org/golang.org/x/time/rate#Limiter](https://godoc.org/golang.org/x/time/rate#Limiter) for an explanation of these fields. 

The limits chosen here are based on the following logic: Bitbucket Cloud restricts "List all repositories" requests (which are a good portion of our requests) to 1,000/hr, and they restrict "List a user or team's repositories" requests (which are roughly equal to our repository lookup requests) to 1,000/hr. See `pkg/extsvc/bitbucketserver/client.go` for the calculations behind these limits` 

### <a id="rateLimitRequestsPerSecond" href="#rateLimitRequestsPerSecond">const rateLimitRequestsPerSecond</a>

```
searchKey: bitbucketcloud.rateLimitRequestsPerSecond
tags: [constant number private]
```

```Go
const rateLimitRequestsPerSecond = 2 // 120/min or 7200/hr

```

These fields define the self-imposed Bitbucket rate limit (since Bitbucket Cloud does not have a concept of rate limiting in HTTP response headers). 

See [https://godoc.org/golang.org/x/time/rate#Limiter](https://godoc.org/golang.org/x/time/rate#Limiter) for an explanation of these fields. 

The limits chosen here are based on the following logic: Bitbucket Cloud restricts "List all repositories" requests (which are a good portion of our requests) to 1,000/hr, and they restrict "List a user or team's repositories" requests (which are roughly equal to our repository lookup requests) to 1,000/hr. See `pkg/extsvc/bitbucketserver/client.go` for the calculations behind these limits` 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="normalizer" href="#normalizer">var normalizer</a>

```
searchKey: bitbucketcloud.normalizer
tags: [variable struct private]
```

```Go
var normalizer = lazyregexp.New("[^A-Za-z0-9-]+")
```

### <a id="requestCounter" href="#requestCounter">var requestCounter</a>

```
searchKey: bitbucketcloud.requestCounter
tags: [variable struct private]
```

```Go
var requestCounter = ...
```

### <a id="update" href="#update">var update</a>

```
searchKey: bitbucketcloud.update
tags: [variable boolean private]
```

```Go
var update = flag.Bool("update", false, "update testdata")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: bitbucketcloud.Client
tags: [struct]
```

```Go
type Client struct {
	// HTTP Client used to communicate with the API
	httpClient httpcli.Doer

	// URL is the base URL of Bitbucket Cloud.
	URL *url.URL

	// The username and app password credentials for accessing the server.
	Username, AppPassword string

	// RateLimit is the self-imposed rate limiter (since Bitbucket does not have a concept
	// of rate limiting in HTTP response headers).
	RateLimit *rate.Limiter
}
```

Client access a Bitbucket Cloud via the REST API 2.0. 

#### <a id="NewClient" href="#NewClient">func NewClient(apiURL *url.URL, httpClient httpcli.Doer) *Client</a>

```
searchKey: bitbucketcloud.NewClient
tags: [function]
```

```Go
func NewClient(apiURL *url.URL, httpClient httpcli.Doer) *Client
```

NewClient creates a new Bitbucket Cloud API client with given apiURL. If a nil httpClient is provided, http.DefaultClient will be used. Both Username and AppPassword fields are required to be set before calling any APIs. 

#### <a id="NewTestClient" href="#NewTestClient">func NewTestClient(t testing.TB, name string, update bool, apiURL *url.URL) (*Client, func())</a>

```
searchKey: bitbucketcloud.NewTestClient
tags: [function]
```

```Go
func NewTestClient(t testing.TB, name string, update bool, apiURL *url.URL) (*Client, func())
```

NewTestClient returns a bitbucketcloud.Client that records its interactions to testdata/vcr/. 

#### <a id="Client.Repos" href="#Client.Repos">func (c *Client) Repos(ctx context.Context, pageToken *PageToken, accountName string) ([]*Repo, *PageToken, error)</a>

```
searchKey: bitbucketcloud.Client.Repos
tags: [method]
```

```Go
func (c *Client) Repos(ctx context.Context, pageToken *PageToken, accountName string) ([]*Repo, *PageToken, error)
```

Repos returns a list of repositories that are fetched and populated based on given account name and pagination criteria. If the account requested is a team, results will be filtered down to the ones that the app password's user has access to. If the argument pageToken.Next is not empty, it will be used directly as the URL to make the request. The PageToken it returns may also contain the URL to the next page for succeeding requests if any. 

#### <a id="Client.authenticate" href="#Client.authenticate">func (c *Client) authenticate(req *http.Request) error</a>

```
searchKey: bitbucketcloud.Client.authenticate
tags: [method private]
```

```Go
func (c *Client) authenticate(req *http.Request) error
```

#### <a id="Client.do" href="#Client.do">func (c *Client) do(ctx context.Context, req *http.Request, result interface{}) error</a>

```
searchKey: bitbucketcloud.Client.do
tags: [method private]
```

```Go
func (c *Client) do(ctx context.Context, req *http.Request, result interface{}) error
```

#### <a id="Client.page" href="#Client.page">func (c *Client) page(ctx context.Context, path string, qry url.Values, token *PageToken, results interface{}) (*PageToken, error)</a>

```
searchKey: bitbucketcloud.Client.page
tags: [method private]
```

```Go
func (c *Client) page(ctx context.Context, path string, qry url.Values, token *PageToken, results interface{}) (*PageToken, error)
```

#### <a id="Client.reqPage" href="#Client.reqPage">func (c *Client) reqPage(ctx context.Context, url string, results interface{}) (*PageToken, error)</a>

```
searchKey: bitbucketcloud.Client.reqPage
tags: [method private]
```

```Go
func (c *Client) reqPage(ctx context.Context, url string, results interface{}) (*PageToken, error)
```

reqPage directly requests resources from given URL assuming all attributes have been included in the URL parameter. This is particular useful since the Bitbucket Cloud API 2.0 pagination renders the full link of next page in the response. See more at [https://developer.atlassian.com/bitbucket/api/2/reference/meta/pagination](https://developer.atlassian.com/bitbucket/api/2/reference/meta/pagination) However, for the very first request, use method page instead. 

### <a id="CloneLinks" href="#CloneLinks">type CloneLinks []struct</a>

```
searchKey: bitbucketcloud.CloneLinks
tags: [array struct]
```

```Go
type CloneLinks []struct {
	Href string `json:"href"`
	Name string `json:"name"`
}
```

#### <a id="CloneLinks.HTTPS" href="#CloneLinks.HTTPS">func (cl CloneLinks) HTTPS() (string, error)</a>

```
searchKey: bitbucketcloud.CloneLinks.HTTPS
tags: [method]
```

```Go
func (cl CloneLinks) HTTPS() (string, error)
```

HTTPS returns clone link named "https", it returns an error if not found. 

### <a id="Link" href="#Link">type Link struct</a>

```
searchKey: bitbucketcloud.Link
tags: [struct]
```

```Go
type Link struct {
	Href string `json:"href"`
}
```

### <a id="Links" href="#Links">type Links struct</a>

```
searchKey: bitbucketcloud.Links
tags: [struct]
```

```Go
type Links struct {
	Clone CloneLinks `json:"clone"`
	HTML  Link       `json:"html"`
}
```

### <a id="PageToken" href="#PageToken">type PageToken struct</a>

```
searchKey: bitbucketcloud.PageToken
tags: [struct]
```

```Go
type PageToken struct {
	Size    int    `json:"size"`
	Page    int    `json:"page"`
	Pagelen int    `json:"pagelen"`
	Next    string `json:"next"`
}
```

#### <a id="PageToken.HasMore" href="#PageToken.HasMore">func (t *PageToken) HasMore() bool</a>

```
searchKey: bitbucketcloud.PageToken.HasMore
tags: [method]
```

```Go
func (t *PageToken) HasMore() bool
```

#### <a id="PageToken.Values" href="#PageToken.Values">func (t *PageToken) Values() url.Values</a>

```
searchKey: bitbucketcloud.PageToken.Values
tags: [method]
```

```Go
func (t *PageToken) Values() url.Values
```

### <a id="Repo" href="#Repo">type Repo struct</a>

```
searchKey: bitbucketcloud.Repo
tags: [struct]
```

```Go
type Repo struct {
	Slug        string `json:"slug"`
	Name        string `json:"name"`
	FullName    string `json:"full_name"`
	UUID        string `json:"uuid"`
	SCM         string `json:"scm"`
	Description string `json:"description"`
	Parent      *Repo  `json:"parent"`
	IsPrivate   bool   `json:"is_private"`
	Links       Links  `json:"links"`
}
```

### <a id="httpError" href="#httpError">type httpError struct</a>

```
searchKey: bitbucketcloud.httpError
tags: [struct private]
```

```Go
type httpError struct {
	StatusCode int
	URL        *url.URL
	Body       []byte
}
```

#### <a id="httpError.Error" href="#httpError.Error">func (e *httpError) Error() string</a>

```
searchKey: bitbucketcloud.httpError.Error
tags: [method private]
```

```Go
func (e *httpError) Error() string
```

#### <a id="httpError.NotFound" href="#httpError.NotFound">func (e *httpError) NotFound() bool</a>

```
searchKey: bitbucketcloud.httpError.NotFound
tags: [method private]
```

```Go
func (e *httpError) NotFound() bool
```

#### <a id="httpError.Unauthorized" href="#httpError.Unauthorized">func (e *httpError) Unauthorized() bool</a>

```
searchKey: bitbucketcloud.httpError.Unauthorized
tags: [method private]
```

```Go
func (e *httpError) Unauthorized() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="GetenvTestBitbucketCloudUsername" href="#GetenvTestBitbucketCloudUsername">func GetenvTestBitbucketCloudUsername() string</a>

```
searchKey: bitbucketcloud.GetenvTestBitbucketCloudUsername
tags: [function]
```

```Go
func GetenvTestBitbucketCloudUsername() string
```

### <a id="TestClient_Repos" href="#TestClient_Repos">func TestClient_Repos(t *testing.T)</a>

```
searchKey: bitbucketcloud.TestClient_Repos
tags: [function private test]
```

```Go
func TestClient_Repos(t *testing.T)
```

### <a id="normalize" href="#normalize">func normalize(path string) string</a>

```
searchKey: bitbucketcloud.normalize
tags: [function private]
```

```Go
func normalize(path string) string
```

