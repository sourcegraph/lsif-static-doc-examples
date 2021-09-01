# Package query

Package query provides an expression tree structure which can be converted into WHERE queries. It is used by DB APIs to expose a more powerful query interface. 

## Index

* [Types](#type)
    * [type Q interface{}](#Q)
        * [func And(children ...Q) Q](#And)
        * [func Not(child Q) Q](#Not)
        * [func Or(children ...Q) Q](#Or)
    * [type and struct](#and)
    * [type not struct](#not)
    * [type or struct](#or)
    * [type printfBindVar struct{}](#printfBindVar)
        * [func (printfBindVar) BindVar(i int) string](#printfBindVar.BindVar)
* [Functions](#func)
    * [func Eval(q Q, atomToQueryFn func(q Q) (*sqlf.Query, error)) (*sqlf.Query, error)](#Eval)
    * [func Print(q Q) string](#Print)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Q" href="#Q">type Q interface{}</a>

```
searchKey: query.Q
tags: [interface]
```

```Go
type Q interface{}
```

Q is a query item. It is converted into a *sqlf.Query by Eval. 

#### <a id="And" href="#And">func And(children ...Q) Q</a>

```
searchKey: query.And
tags: [function]
```

```Go
func And(children ...Q) Q
```

And returns a Q which when evaluated will join the children by "AND". 

#### <a id="Not" href="#Not">func Not(child Q) Q</a>

```
searchKey: query.Not
tags: [function]
```

```Go
func Not(child Q) Q
```

Not returns a Q which when evaluated will wrap child with "NOT". 

#### <a id="Or" href="#Or">func Or(children ...Q) Q</a>

```
searchKey: query.Or
tags: [function]
```

```Go
func Or(children ...Q) Q
```

Or returns a Q which when evaluated will join the children by "OR". 

### <a id="and" href="#and">type and struct</a>

```
searchKey: query.and
tags: [struct private]
```

```Go
type and struct {
	Children []Q
}
```

### <a id="not" href="#not">type not struct</a>

```
searchKey: query.not
tags: [struct private]
```

```Go
type not struct {
	Child Q
}
```

### <a id="or" href="#or">type or struct</a>

```
searchKey: query.or
tags: [struct private]
```

```Go
type or struct {
	Children []Q
}
```

### <a id="printfBindVar" href="#printfBindVar">type printfBindVar struct{}</a>

```
searchKey: query.printfBindVar
tags: [struct private]
```

```Go
type printfBindVar struct{}
```

#### <a id="printfBindVar.BindVar" href="#printfBindVar.BindVar">func (printfBindVar) BindVar(i int) string</a>

```
searchKey: query.printfBindVar.BindVar
tags: [method private]
```

```Go
func (printfBindVar) BindVar(i int) string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Eval" href="#Eval">func Eval(q Q, atomToQueryFn func(q Q) (*sqlf.Query, error)) (*sqlf.Query, error)</a>

```
searchKey: query.Eval
tags: [function]
```

```Go
func Eval(q Q, atomToQueryFn func(q Q) (*sqlf.Query, error)) (*sqlf.Query, error)
```

Eval runs all atoms of q through atomToQueryFn, returning the final query to run. If any call of atomToQueryFn returns an error, that error is returned by Eval. 

Eval handles And, Or, Not and booleans. Otherwise every other Q will be passed to atomToQueryFn. 

For example in the expression 

```
And("atom1", Or(true, "atom2", &atom3{})

```
atomToQueryFn is responsible for converting "atom1", "atom2" and &atom3{} into sqlf.Query patterns. Eval will return the expression: 

```
(query1 AND (query2 OR query3))

```
Where queryN is the respective output of atomToQueryFn. 

Typically we expect atomToQueryFn to return a SQL condition like "name LIKE $q". It should also handle unexpected values/types being passed in via returning an error. See ExampleEval for a real example of a atomToQueryFn. 

### <a id="Print" href="#Print">func Print(q Q) string</a>

```
searchKey: query.Print
tags: [function]
```

```Go
func Print(q Q) string
```

Print returns a string representing Q. 

