# Package linkheader

## Index

* [Functions](#func)
    * [func ExtractNextURL(resp *http.Response) (string, bool)](#ExtractNextURL)
    * [func ExtractURL(resp *http.Response, rel string) (string, bool)](#ExtractURL)


## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="ExtractNextURL" href="#ExtractNextURL">func ExtractNextURL(resp *http.Response) (string, bool)</a>

```
searchKey: linkheader.ExtractNextURL
tags: [method]
```

```Go
func ExtractNextURL(resp *http.Response) (string, bool)
```

ExtractNextURL retrieves the URL with rel="next" from the Link header. 

### <a id="ExtractURL" href="#ExtractURL">func ExtractURL(resp *http.Response, rel string) (string, bool)</a>

```
searchKey: linkheader.ExtractURL
tags: [method]
```

```Go
func ExtractURL(resp *http.Response, rel string) (string, bool)
```

ExtractURL retrieves the URL with given rel froim the Link header. 

