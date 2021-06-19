# Package search

## Index

* Subpages
  * [enterprise/internal/batches/search/syntax](search/syntax.md)
* [Types](#type)
    * [type ErrExpr struct](#ErrExpr)
        * [func createErrExpr(input string, expr *syntax.Expr) ErrExpr](#createErrExpr)
        * [func (e ErrExpr) Error() string](#ErrExpr.Error)
    * [type ErrUnsupportedField struct](#ErrUnsupportedField)
        * [func (e ErrUnsupportedField) Error() string](#ErrUnsupportedField.Error)
    * [type ErrUnsupportedValueType struct](#ErrUnsupportedValueType)
        * [func (e ErrUnsupportedValueType) Error() string](#ErrUnsupportedValueType.Error)
    * [type TextSearchTerm struct](#TextSearchTerm)
* [Functions](#func)
    * [func ParseTextSearch(search string) ([]TextSearchTerm, error)](#ParseTextSearch)
    * [func TestChangesetSearch(t *testing.T)](#TestChangesetSearch)


## <a id="type" href="#type">Types</a>

### <a id="ErrExpr" href="#ErrExpr">type ErrExpr struct</a>

```
searchKey: search.ErrExpr
tags: [exported]
```

```Go
type ErrExpr struct {
	Pos   int
	Input string
}
```

ErrExpr is a base type for errors that occur in a specific expression within a parse tree, and is intended to be embedded within other error types. 

#### <a id="createErrExpr" href="#createErrExpr">func createErrExpr(input string, expr *syntax.Expr) ErrExpr</a>

```
searchKey: search.createErrExpr
```

```Go
func createErrExpr(input string, expr *syntax.Expr) ErrExpr
```

#### <a id="ErrExpr.Error" href="#ErrExpr.Error">func (e ErrExpr) Error() string</a>

```
searchKey: search.ErrExpr.Error
tags: [exported]
```

```Go
func (e ErrExpr) Error() string
```

### <a id="ErrUnsupportedField" href="#ErrUnsupportedField">type ErrUnsupportedField struct</a>

```
searchKey: search.ErrUnsupportedField
tags: [exported]
```

```Go
type ErrUnsupportedField struct {
	ErrExpr
	Field string
}
```

#### <a id="ErrUnsupportedField.Error" href="#ErrUnsupportedField.Error">func (e ErrUnsupportedField) Error() string</a>

```
searchKey: search.ErrUnsupportedField.Error
tags: [exported]
```

```Go
func (e ErrUnsupportedField) Error() string
```

### <a id="ErrUnsupportedValueType" href="#ErrUnsupportedValueType">type ErrUnsupportedValueType struct</a>

```
searchKey: search.ErrUnsupportedValueType
tags: [exported]
```

```Go
type ErrUnsupportedValueType struct {
	ErrExpr
	ValueType syntax.TokenType
}
```

#### <a id="ErrUnsupportedValueType.Error" href="#ErrUnsupportedValueType.Error">func (e ErrUnsupportedValueType) Error() string</a>

```
searchKey: search.ErrUnsupportedValueType.Error
tags: [exported]
```

```Go
func (e ErrUnsupportedValueType) Error() string
```

### <a id="TextSearchTerm" href="#TextSearchTerm">type TextSearchTerm struct</a>

```
searchKey: search.TextSearchTerm
tags: [exported]
```

```Go
type TextSearchTerm struct {
	Term string
	Not  bool
}
```

TextSearchTerm represents a single term within a search string. 

## <a id="func" href="#func">Functions</a>

### <a id="ParseTextSearch" href="#ParseTextSearch">func ParseTextSearch(search string) ([]TextSearchTerm, error)</a>

```
searchKey: search.ParseTextSearch
tags: [exported]
```

```Go
func ParseTextSearch(search string) ([]TextSearchTerm, error)
```

ParseTextSearch parses a free-form text search string into a slice of expressions, respecting quoted strings and negation. 

### <a id="TestChangesetSearch" href="#TestChangesetSearch">func TestChangesetSearch(t *testing.T)</a>

```
searchKey: search.TestChangesetSearch
```

```Go
func TestChangesetSearch(t *testing.T)
```

