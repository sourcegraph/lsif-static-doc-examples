# Package ast_test

## Index

* [Constants](#const)
    * [const src](#src)
    * [const input](#input)
    * [const golden](#golden)
* [Variables](#var)
    * [var res](#res)
* [Functions](#func)
    * [func ctext(list []*CommentGroup) string](#ctext)
    * [func TestCommentMap(t *testing.T)](#TestCommentMap)
    * [func TestFilter(t *testing.T)](#TestFilter)
    * [func ExampleInspect()](#ExampleInspect)
    * [func ExamplePrint()](#ExamplePrint)
    * [func ExampleCommentMap()](#ExampleCommentMap)
    * [func TestFilterDuplicates(t *testing.T)](#TestFilterDuplicates)
    * [func TestIssue33649(t *testing.T)](#TestIssue33649)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="src" href="#src">const src</a>

```
searchKey: ast_test.src
tags: [private]
```

```Go
const src = ...
```

### <a id="input" href="#input">const input</a>

```
searchKey: ast_test.input
tags: [private]
```

```Go
const input = ...
```

### <a id="golden" href="#golden">const golden</a>

```
searchKey: ast_test.golden
tags: [private]
```

```Go
const golden = ...
```

Calling ast.MergePackageFiles with ast.FilterFuncDuplicates keeps a duplicate entry with attached documentation in favor of one without, and it favors duplicate entries appearing later in the source over ones appearing earlier. This is why (*t2).f2 is kept and t2.f2 is eliminated in this test case. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="res" href="#res">var res</a>

```
searchKey: ast_test.res
tags: [private]
```

```Go
var res = ...
```

res maps a key of the form "line number: node type" to the associated comments' text. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ctext" href="#ctext">func ctext(list []*CommentGroup) string</a>

```
searchKey: ast_test.ctext
tags: [private]
```

```Go
func ctext(list []*CommentGroup) string
```

### <a id="TestCommentMap" href="#TestCommentMap">func TestCommentMap(t *testing.T)</a>

```
searchKey: ast_test.TestCommentMap
tags: [private]
```

```Go
func TestCommentMap(t *testing.T)
```

### <a id="TestFilter" href="#TestFilter">func TestFilter(t *testing.T)</a>

```
searchKey: ast_test.TestFilter
tags: [private]
```

```Go
func TestFilter(t *testing.T)
```

### <a id="ExampleInspect" href="#ExampleInspect">func ExampleInspect()</a>

```
searchKey: ast_test.ExampleInspect
tags: [private]
```

```Go
func ExampleInspect()
```

This example demonstrates how to inspect the AST of a Go program. 

### <a id="ExamplePrint" href="#ExamplePrint">func ExamplePrint()</a>

```
searchKey: ast_test.ExamplePrint
tags: [private]
```

```Go
func ExamplePrint()
```

This example shows what an AST looks like when printed for debugging. 

### <a id="ExampleCommentMap" href="#ExampleCommentMap">func ExampleCommentMap()</a>

```
searchKey: ast_test.ExampleCommentMap
tags: [private]
```

```Go
func ExampleCommentMap()
```

This example illustrates how to remove a variable declaration in a Go program while maintaining correct comment association using an ast.CommentMap. 

### <a id="TestFilterDuplicates" href="#TestFilterDuplicates">func TestFilterDuplicates(t *testing.T)</a>

```
searchKey: ast_test.TestFilterDuplicates
tags: [private]
```

```Go
func TestFilterDuplicates(t *testing.T)
```

### <a id="TestIssue33649" href="#TestIssue33649">func TestIssue33649(t *testing.T)</a>

```
searchKey: ast_test.TestIssue33649
tags: [private]
```

```Go
func TestIssue33649(t *testing.T)
```

