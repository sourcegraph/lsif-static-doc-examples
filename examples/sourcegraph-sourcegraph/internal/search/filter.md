# Package filter

## Index

* [Constants](#const)
    * [const Commit](#Commit)
    * [const Content](#Content)
    * [const File](#File)
    * [const Repository](#Repository)
    * [const Symbol](#Symbol)
* [Variables](#var)
    * [var validSelectors](#validSelectors)
* [Types](#type)
    * [type SelectPath []string](#SelectPath)
        * [func SelectPathFromString(s string) (SelectPath, error)](#SelectPathFromString)
        * [func (sp SelectPath) String() string](#SelectPath.String)
        * [func (sp SelectPath) Root() string](#SelectPath.Root)
    * [type object map[string]filter.object](#object)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="Commit" href="#Commit">const Commit</a>

```
searchKey: filter.Commit
```

```Go
const Commit = "commit"
```

### <a id="Content" href="#Content">const Content</a>

```
searchKey: filter.Content
```

```Go
const Content = "content"
```

### <a id="File" href="#File">const File</a>

```
searchKey: filter.File
```

```Go
const File = "file"
```

### <a id="Repository" href="#Repository">const Repository</a>

```
searchKey: filter.Repository
```

```Go
const Repository = "repo"
```

### <a id="Symbol" href="#Symbol">const Symbol</a>

```
searchKey: filter.Symbol
```

```Go
const Symbol = "symbol"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="validSelectors" href="#validSelectors">var validSelectors</a>

```
searchKey: filter.validSelectors
tags: [private]
```

```Go
var validSelectors = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="SelectPath" href="#SelectPath">type SelectPath []string</a>

```
searchKey: filter.SelectPath
```

```Go
type SelectPath []string
```

SelectPath represents a parsed and validated select value 

#### <a id="SelectPathFromString" href="#SelectPathFromString">func SelectPathFromString(s string) (SelectPath, error)</a>

```
searchKey: filter.SelectPathFromString
```

```Go
func SelectPathFromString(s string) (SelectPath, error)
```

#### <a id="SelectPath.String" href="#SelectPath.String">func (sp SelectPath) String() string</a>

```
searchKey: filter.SelectPath.String
```

```Go
func (sp SelectPath) String() string
```

#### <a id="SelectPath.Root" href="#SelectPath.Root">func (sp SelectPath) Root() string</a>

```
searchKey: filter.SelectPath.Root
```

```Go
func (sp SelectPath) Root() string
```

Root is the top-level result type that is being selected. Returns an empty string if SelectPath is empty 

### <a id="object" href="#object">type object map[string]filter.object</a>

```
searchKey: filter.object
tags: [private]
```

```Go
type object map[string]object
```

