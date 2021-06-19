# Package searcher

Package searcher provides a client for our just in time text searching service "searcher". 

## Index

* [Variables](#var)
    * [var requestCounter](#requestCounter)
    * [var searchHTTPClient](#searchHTTPClient)
    * [var MockSearch](#MockSearch)
* [Types](#type)
    * [type searcherError struct](#searcherError)
        * [func (e *searcherError) BadRequest() bool](#searcherError.BadRequest)
        * [func (e *searcherError) Temporary() bool](#searcherError.Temporary)
        * [func (e *searcherError) Error() string](#searcherError.Error)
* [Functions](#func)
    * [func Search(ctx context.Context, searcherURLs *endpoint.Map, repo api.RepoName, branch string, commit api.CommitID, indexed bool, p *search.TextPatternInfo, fetchTimeout time.Duration, indexerEndpoints []string) (matches []*protocol.FileMatch, limitHit bool, err error)](#Search)
    * [func textSearchURL(ctx context.Context, url string) ([]*protocol.FileMatch, bool, error)](#textSearchURL)


## <a id="var" href="#var">Variables</a>

### <a id="requestCounter" href="#requestCounter">var requestCounter</a>

```
searchKey: searcher.requestCounter
```

```Go
var requestCounter = ...
```

### <a id="searchHTTPClient" href="#searchHTTPClient">var searchHTTPClient</a>

```
searchKey: searcher.searchHTTPClient
```

```Go
var searchHTTPClient = ...
```

### <a id="MockSearch" href="#MockSearch">var MockSearch</a>

```
searchKey: searcher.MockSearch
tags: [exported]
```

```Go
var MockSearch func(ctx context.Context, repo api.RepoName, commit api.CommitID, p *search.TextPatternInfo, fetchTimeout time.Duration) (matches []*protocol.FileMatch, limitHit bool, err error) = ...
```

## <a id="type" href="#type">Types</a>

### <a id="searcherError" href="#searcherError">type searcherError struct</a>

```
searchKey: searcher.searcherError
```

```Go
type searcherError struct {
	StatusCode int
	Message    string
}
```

#### <a id="searcherError.BadRequest" href="#searcherError.BadRequest">func (e *searcherError) BadRequest() bool</a>

```
searchKey: searcher.searcherError.BadRequest
```

```Go
func (e *searcherError) BadRequest() bool
```

#### <a id="searcherError.Temporary" href="#searcherError.Temporary">func (e *searcherError) Temporary() bool</a>

```
searchKey: searcher.searcherError.Temporary
```

```Go
func (e *searcherError) Temporary() bool
```

#### <a id="searcherError.Error" href="#searcherError.Error">func (e *searcherError) Error() string</a>

```
searchKey: searcher.searcherError.Error
```

```Go
func (e *searcherError) Error() string
```

## <a id="func" href="#func">Functions</a>

### <a id="Search" href="#Search">func Search(ctx context.Context, searcherURLs *endpoint.Map, repo api.RepoName, branch string, commit api.CommitID, indexed bool, p *search.TextPatternInfo, fetchTimeout time.Duration, indexerEndpoints []string) (matches []*protocol.FileMatch, limitHit bool, err error)</a>

```
searchKey: searcher.Search
tags: [exported]
```

```Go
func Search(ctx context.Context, searcherURLs *endpoint.Map, repo api.RepoName, branch string, commit api.CommitID, indexed bool, p *search.TextPatternInfo, fetchTimeout time.Duration, indexerEndpoints []string) (matches []*protocol.FileMatch, limitHit bool, err error)
```

Search searches repo@commit with p. 

### <a id="textSearchURL" href="#textSearchURL">func textSearchURL(ctx context.Context, url string) ([]*protocol.FileMatch, bool, error)</a>

```
searchKey: searcher.textSearchURL
```

```Go
func textSearchURL(ctx context.Context, url string) ([]*protocol.FileMatch, bool, error)
```

