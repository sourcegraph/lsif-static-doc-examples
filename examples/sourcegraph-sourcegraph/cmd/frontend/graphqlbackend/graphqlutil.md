# Package graphqlutil

Package graphqlutil contains utilities for working with GraphQL. 

## Index

* [Types](#type)
    * [type ConnectionArgs struct](#ConnectionArgs)
        * [func (a ConnectionArgs) Set(o **database.LimitOffset)](#ConnectionArgs.Set)
        * [func (a ConnectionArgs) GetFirst() int32](#ConnectionArgs.GetFirst)
    * [type PageInfo struct](#PageInfo)
        * [func HasNextPage(hasNextPage bool) *PageInfo](#HasNextPage)
        * [func NextPageCursor(endCursor string) *PageInfo](#NextPageCursor)
        * [func (r *PageInfo) EndCursor() *string](#PageInfo.EndCursor)
        * [func (r *PageInfo) HasNextPage() bool](#PageInfo.HasNextPage)


## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="ConnectionArgs" href="#ConnectionArgs">type ConnectionArgs struct</a>

```
searchKey: graphqlutil.ConnectionArgs
tags: [exported]
```

```Go
type ConnectionArgs struct {
	First *int32 // return the first n items
}
```

ConnectionArgs is the common set of arguments to GraphQL fields that return connections (lists). 

#### <a id="ConnectionArgs.Set" href="#ConnectionArgs.Set">func (a ConnectionArgs) Set(o **database.LimitOffset)</a>

```
searchKey: graphqlutil.ConnectionArgs.Set
tags: [exported]
```

```Go
func (a ConnectionArgs) Set(o **database.LimitOffset)
```

Set is a convenience method for setting the DB limit and offset in a DB XyzListOptions struct. 

#### <a id="ConnectionArgs.GetFirst" href="#ConnectionArgs.GetFirst">func (a ConnectionArgs) GetFirst() int32</a>

```
searchKey: graphqlutil.ConnectionArgs.GetFirst
tags: [exported]
```

```Go
func (a ConnectionArgs) GetFirst() int32
```

GetFirst is a convenience method returning the value of First, defaulting to the type's zero value if nil. 

### <a id="PageInfo" href="#PageInfo">type PageInfo struct</a>

```
searchKey: graphqlutil.PageInfo
tags: [exported]
```

```Go
type PageInfo struct {
	endCursor   *string
	hasNextPage bool
}
```

PageInfo implements the GraphQL type PageInfo. 

#### <a id="HasNextPage" href="#HasNextPage">func HasNextPage(hasNextPage bool) *PageInfo</a>

```
searchKey: graphqlutil.HasNextPage
tags: [exported]
```

```Go
func HasNextPage(hasNextPage bool) *PageInfo
```

HasNextPage returns a new PageInfo with the given hasNextPage value. 

#### <a id="NextPageCursor" href="#NextPageCursor">func NextPageCursor(endCursor string) *PageInfo</a>

```
searchKey: graphqlutil.NextPageCursor
tags: [exported]
```

```Go
func NextPageCursor(endCursor string) *PageInfo
```

NextPageCursor returns a new PageInfo indicating there is a next page with the given end cursor. 

#### <a id="PageInfo.EndCursor" href="#PageInfo.EndCursor">func (r *PageInfo) EndCursor() *string</a>

```
searchKey: graphqlutil.PageInfo.EndCursor
tags: [exported]
```

```Go
func (r *PageInfo) EndCursor() *string
```

#### <a id="PageInfo.HasNextPage" href="#PageInfo.HasNextPage">func (r *PageInfo) HasNextPage() bool</a>

```
searchKey: graphqlutil.PageInfo.HasNextPage
tags: [exported]
```

```Go
func (r *PageInfo) HasNextPage() bool
```

