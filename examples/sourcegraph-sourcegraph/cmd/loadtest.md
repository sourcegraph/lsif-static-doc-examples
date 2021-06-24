# Package main

## Index

* [Constants](#const)
    * [const gqlSearch](#gqlSearch)
* [Variables](#var)
    * [var FrontendHost](#FrontendHost)
    * [var FrontendPort](#FrontendPort)
    * [var QueryPeriodMSEnv](#QueryPeriodMSEnv)
    * [var SearchQueriesEnv](#SearchQueriesEnv)
* [Types](#type)
    * [type GQLSearchVars struct](#GQLSearchVars)
    * [type GraphQLQuery struct](#GraphQLQuery)
    * [type GraphQLResponseSearch struct](#GraphQLResponseSearch)
* [Functions](#func)
    * [func frontendURL(thePath string) string](#frontendURL)
    * [func main()](#main)
    * [func run() error](#run)
    * [func search(v GQLSearchVars) (int, error)](#search)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="gqlSearch" href="#gqlSearch">const gqlSearch</a>

```
searchKey: main.gqlSearch
tags: [constant string private]
```

```Go
const gqlSearch = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="FrontendHost" href="#FrontendHost">var FrontendHost</a>

```
searchKey: main.FrontendHost
tags: [variable string]
```

```Go
var FrontendHost = ...
```

### <a id="FrontendPort" href="#FrontendPort">var FrontendPort</a>

```
searchKey: main.FrontendPort
tags: [variable string]
```

```Go
var FrontendPort = ...
```

### <a id="QueryPeriodMSEnv" href="#QueryPeriodMSEnv">var QueryPeriodMSEnv</a>

```
searchKey: main.QueryPeriodMSEnv
tags: [variable string]
```

```Go
var QueryPeriodMSEnv = ...
```

### <a id="SearchQueriesEnv" href="#SearchQueriesEnv">var SearchQueriesEnv</a>

```
searchKey: main.SearchQueriesEnv
tags: [variable string]
```

```Go
var SearchQueriesEnv = env.Get("loadTestSearches", "[]", "Search queries to use in load testing")
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="GQLSearchVars" href="#GQLSearchVars">type GQLSearchVars struct</a>

```
searchKey: main.GQLSearchVars
tags: [struct]
```

```Go
type GQLSearchVars struct {
	Query string `json:"query"`
}
```

### <a id="GraphQLQuery" href="#GraphQLQuery">type GraphQLQuery struct</a>

```
searchKey: main.GraphQLQuery
tags: [struct]
```

```Go
type GraphQLQuery struct {
	Query     string      `json:"query"`
	Variables interface{} `json:"variables"`
}
```

### <a id="GraphQLResponseSearch" href="#GraphQLResponseSearch">type GraphQLResponseSearch struct</a>

```
searchKey: main.GraphQLResponseSearch
tags: [struct]
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

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="frontendURL" href="#frontendURL">func frontendURL(thePath string) string</a>

```
searchKey: main.frontendURL
tags: [method private]
```

```Go
func frontendURL(thePath string) string
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="run" href="#run">func run() error</a>

```
searchKey: main.run
tags: [function private]
```

```Go
func run() error
```

### <a id="search" href="#search">func search(v GQLSearchVars) (int, error)</a>

```
searchKey: main.search
tags: [method private]
```

```Go
func search(v GQLSearchVars) (int, error)
```

