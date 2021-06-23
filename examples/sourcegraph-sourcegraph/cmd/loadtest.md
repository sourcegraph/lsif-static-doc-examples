# Package main

## Index

* [Constants](#const)
    * [const gqlSearch](#gqlSearch)
* [Variables](#var)
    * [var FrontendHost](#FrontendHost)
    * [var FrontendPort](#FrontendPort)
    * [var SearchQueriesEnv](#SearchQueriesEnv)
    * [var QueryPeriodMSEnv](#QueryPeriodMSEnv)
* [Types](#type)
    * [type GQLSearchVars struct](#GQLSearchVars)
    * [type GraphQLResponseSearch struct](#GraphQLResponseSearch)
    * [type GraphQLQuery struct](#GraphQLQuery)
* [Functions](#func)
    * [func main()](#main)
    * [func frontendURL(thePath string) string](#frontendURL)
    * [func run() error](#run)
    * [func search(v GQLSearchVars) (int, error)](#search)


## <a id="const" href="#const">Constants</a>

### <a id="gqlSearch" href="#gqlSearch">const gqlSearch</a>

```
searchKey: main.gqlSearch
tags: [private]
```

```Go
const gqlSearch = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="FrontendHost" href="#FrontendHost">var FrontendHost</a>

```
searchKey: main.FrontendHost
```

```Go
var FrontendHost = ...
```

### <a id="FrontendPort" href="#FrontendPort">var FrontendPort</a>

```
searchKey: main.FrontendPort
```

```Go
var FrontendPort = ...
```

### <a id="SearchQueriesEnv" href="#SearchQueriesEnv">var SearchQueriesEnv</a>

```
searchKey: main.SearchQueriesEnv
```

```Go
var SearchQueriesEnv = env.Get("loadTestSearches", "[]", "Search queries to use in load testing")
```

### <a id="QueryPeriodMSEnv" href="#QueryPeriodMSEnv">var QueryPeriodMSEnv</a>

```
searchKey: main.QueryPeriodMSEnv
```

```Go
var QueryPeriodMSEnv = ...
```

## <a id="type" href="#type">Types</a>

### <a id="GQLSearchVars" href="#GQLSearchVars">type GQLSearchVars struct</a>

```
searchKey: main.GQLSearchVars
```

```Go
type GQLSearchVars struct {
	Query string `json:"query"`
}
```

### <a id="GraphQLResponseSearch" href="#GraphQLResponseSearch">type GraphQLResponseSearch struct</a>

```
searchKey: main.GraphQLResponseSearch
```

```Go
type GraphQLResponseSearch struct {
	Data struct {
		Search struct {
			Results struct {
				Results []interface{} `json:"results"`
			} `json:"results"`
		} `json:"search"`
	} `json:"data"`
}
```

### <a id="GraphQLQuery" href="#GraphQLQuery">type GraphQLQuery struct</a>

```
searchKey: main.GraphQLQuery
```

```Go
type GraphQLQuery struct {
	Query     string      `json:"query"`
	Variables interface{} `json:"variables"`
}
```

## <a id="func" href="#func">Functions</a>

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [private]
```

```Go
func main()
```

### <a id="frontendURL" href="#frontendURL">func frontendURL(thePath string) string</a>

```
searchKey: main.frontendURL
tags: [private]
```

```Go
func frontendURL(thePath string) string
```

### <a id="run" href="#run">func run() error</a>

```
searchKey: main.run
tags: [private]
```

```Go
func run() error
```

### <a id="search" href="#search">func search(v GQLSearchVars) (int, error)</a>

```
searchKey: main.search
tags: [private]
```

```Go
func search(v GQLSearchVars) (int, error)
```

