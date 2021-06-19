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

```
tags: [exported]
```

### <a id="gqlSearch" href="#gqlSearch">const gqlSearch</a>

```
searchKey: main.gqlSearch
```

```Go
const gqlSearch = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="FrontendHost" href="#FrontendHost">var FrontendHost</a>

```
searchKey: main.FrontendHost
tags: [exported]
```

```Go
var FrontendHost = ...
```

### <a id="FrontendPort" href="#FrontendPort">var FrontendPort</a>

```
searchKey: main.FrontendPort
tags: [exported]
```

```Go
var FrontendPort = ...
```

### <a id="SearchQueriesEnv" href="#SearchQueriesEnv">var SearchQueriesEnv</a>

```
searchKey: main.SearchQueriesEnv
tags: [exported]
```

```Go
var SearchQueriesEnv = env.Get("loadTestSearches", "[]", "Search queries to use in load testing")
```

### <a id="QueryPeriodMSEnv" href="#QueryPeriodMSEnv">var QueryPeriodMSEnv</a>

```
searchKey: main.QueryPeriodMSEnv
tags: [exported]
```

```Go
var QueryPeriodMSEnv = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="GQLSearchVars" href="#GQLSearchVars">type GQLSearchVars struct</a>

```
searchKey: main.GQLSearchVars
tags: [exported]
```

```Go
type GQLSearchVars struct {
	Query string `json:"query"`
}
```

### <a id="GraphQLResponseSearch" href="#GraphQLResponseSearch">type GraphQLResponseSearch struct</a>

```
searchKey: main.GraphQLResponseSearch
tags: [exported]
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
tags: [exported]
```

```Go
type GraphQLQuery struct {
	Query     string      `json:"query"`
	Variables interface{} `json:"variables"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

### <a id="frontendURL" href="#frontendURL">func frontendURL(thePath string) string</a>

```
searchKey: main.frontendURL
```

```Go
func frontendURL(thePath string) string
```

### <a id="run" href="#run">func run() error</a>

```
searchKey: main.run
```

```Go
func run() error
```

### <a id="search" href="#search">func search(v GQLSearchVars) (int, error)</a>

```
searchKey: main.search
```

```Go
func search(v GQLSearchVars) (int, error)
```

