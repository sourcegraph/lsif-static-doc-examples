# Package typeparams

Package typeparams provides functions to work with type parameter data stored in the AST, while these AST changes are guarded by a build constraint. 

## Index

* [Constants](#const)
    * [const DisallowParsing](#DisallowParsing)
    * [const Enabled](#Enabled)
* [Functions](#func)
    * [func Get(ast.Node) *ast.FieldList](#Get)
    * [func IsListExpr(n ast.Node) bool](#IsListExpr)
    * [func PackExpr(list []ast.Expr) ast.Expr](#PackExpr)
    * [func Set(node ast.Node, params *ast.FieldList)](#Set)
    * [func UnpackExpr(expr ast.Expr) []ast.Expr](#UnpackExpr)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="DisallowParsing" href="#DisallowParsing">const DisallowParsing</a>

```
searchKey: typeparams.DisallowParsing
tags: [constant number]
```

```Go
const DisallowParsing = 1 << 30
```

DisallowParsing is the numeric value of a parsing mode that disallows type parameters. This only matters if the typeparams experiment is active, and may be used for running tests that disallow generics. 

### <a id="Enabled" href="#Enabled">const Enabled</a>

```
searchKey: typeparams.Enabled
tags: [constant boolean]
```

```Go
const Enabled = false
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Get" href="#Get">func Get(ast.Node) *ast.FieldList</a>

```
searchKey: typeparams.Get
tags: [method]
```

```Go
func Get(ast.Node) *ast.FieldList
```

### <a id="IsListExpr" href="#IsListExpr">func IsListExpr(n ast.Node) bool</a>

```
searchKey: typeparams.IsListExpr
tags: [method]
```

```Go
func IsListExpr(n ast.Node) bool
```

### <a id="PackExpr" href="#PackExpr">func PackExpr(list []ast.Expr) ast.Expr</a>

```
searchKey: typeparams.PackExpr
tags: [method]
```

```Go
func PackExpr(list []ast.Expr) ast.Expr
```

### <a id="Set" href="#Set">func Set(node ast.Node, params *ast.FieldList)</a>

```
searchKey: typeparams.Set
tags: [method]
```

```Go
func Set(node ast.Node, params *ast.FieldList)
```

### <a id="UnpackExpr" href="#UnpackExpr">func UnpackExpr(expr ast.Expr) []ast.Expr</a>

```
searchKey: typeparams.UnpackExpr
tags: [method]
```

```Go
func UnpackExpr(expr ast.Expr) []ast.Expr
```

