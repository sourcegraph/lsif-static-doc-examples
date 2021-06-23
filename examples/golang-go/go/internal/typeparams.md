# Package typeparams

Package typeparams provides functions to work with type parameter data stored in the AST, while these AST changes are guarded by a build constraint. 

## Index

* [Constants](#const)
    * [const DisallowParsing](#DisallowParsing)
    * [const Enabled](#Enabled)
* [Functions](#func)
    * [func PackExpr(list []ast.Expr) ast.Expr](#PackExpr)
    * [func UnpackExpr(expr ast.Expr) []ast.Expr](#UnpackExpr)
    * [func IsListExpr(n ast.Node) bool](#IsListExpr)
    * [func Get(ast.Node) *ast.FieldList](#Get)
    * [func Set(node ast.Node, params *ast.FieldList)](#Set)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="DisallowParsing" href="#DisallowParsing">const DisallowParsing</a>

```
searchKey: typeparams.DisallowParsing
```

```Go
const DisallowParsing = 1 << 30
```

DisallowParsing is the numeric value of a parsing mode that disallows type parameters. This only matters if the typeparams experiment is active, and may be used for running tests that disallow generics. 

### <a id="Enabled" href="#Enabled">const Enabled</a>

```
searchKey: typeparams.Enabled
```

```Go
const Enabled = false
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="PackExpr" href="#PackExpr">func PackExpr(list []ast.Expr) ast.Expr</a>

```
searchKey: typeparams.PackExpr
```

```Go
func PackExpr(list []ast.Expr) ast.Expr
```

### <a id="UnpackExpr" href="#UnpackExpr">func UnpackExpr(expr ast.Expr) []ast.Expr</a>

```
searchKey: typeparams.UnpackExpr
```

```Go
func UnpackExpr(expr ast.Expr) []ast.Expr
```

### <a id="IsListExpr" href="#IsListExpr">func IsListExpr(n ast.Node) bool</a>

```
searchKey: typeparams.IsListExpr
```

```Go
func IsListExpr(n ast.Node) bool
```

### <a id="Get" href="#Get">func Get(ast.Node) *ast.FieldList</a>

```
searchKey: typeparams.Get
```

```Go
func Get(ast.Node) *ast.FieldList
```

### <a id="Set" href="#Set">func Set(node ast.Node, params *ast.FieldList)</a>

```
searchKey: typeparams.Set
```

```Go
func Set(node ast.Node, params *ast.FieldList)
```

