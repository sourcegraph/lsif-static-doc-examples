# Package format

Package format implements standard formatting of Go source. 

Note that formatting of Go source code changes over time, so tools relying on consistent formatting should execute a specific version of the gofmt binary instead of using this package. That way, the formatting will be stable, and the tools won't need to be recompiled each time gofmt changes. 

For example, pre-submit checks that use this package directly would behave differently depending on what Go version each developer uses, causing the check to be inherently fragile. 

## Index

* [Constants](#const)
    * [const tabWidth](#tabWidth)
    * [const printerMode](#printerMode)
    * [const printerNormalizeNumbers](#printerNormalizeNumbers)
    * [const parserMode](#parserMode)
    * [const testfile](#testfile)
* [Variables](#var)
    * [var config](#config)
    * [var tests](#tests)
* [Functions](#func)
    * [func Node(dst io.Writer, fset *token.FileSet, node interface{}) error](#Node)
    * [func Source(src []byte) ([]byte, error)](#Source)
    * [func hasUnsortedImports(file *ast.File) bool](#hasUnsortedImports)
    * [func parse(fset *token.FileSet, filename string, src []byte, fragmentOk bool) (file *ast.File,...](#parse)
    * [func format(fset *token.FileSet,...](#format)
    * [func isSpace(b byte) bool](#isSpace)
    * [func diff(t *testing.T, dst, src []byte)](#diff)
    * [func TestNode(t *testing.T)](#TestNode)
    * [func TestNodeNoModify(t *testing.T)](#TestNodeNoModify)
    * [func TestSource(t *testing.T)](#TestSource)
    * [func String(s string) (string, error)](#String)
    * [func TestPartial(t *testing.T)](#TestPartial)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="tabWidth" href="#tabWidth">const tabWidth</a>

```
searchKey: format.tabWidth
```

```Go
const tabWidth = 8
```

Keep these in sync with cmd/gofmt/gofmt.go. 

### <a id="printerMode" href="#printerMode">const printerMode</a>

```
searchKey: format.printerMode
```

```Go
const printerMode = printer.UseSpaces | printer.TabIndent | printerNormalizeNumbers
```

Keep these in sync with cmd/gofmt/gofmt.go. 

### <a id="printerNormalizeNumbers" href="#printerNormalizeNumbers">const printerNormalizeNumbers</a>

```
searchKey: format.printerNormalizeNumbers
```

```Go
const printerNormalizeNumbers = 1 << 30
```

Keep these in sync with cmd/gofmt/gofmt.go. 

printerNormalizeNumbers means to canonicalize number literal prefixes and exponents while printing. See [https://golang.org/doc/go1.13#gofmt](https://golang.org/doc/go1.13#gofmt). 

This value is defined in go/printer specifically for go/format and cmd/gofmt. 

### <a id="parserMode" href="#parserMode">const parserMode</a>

```
searchKey: format.parserMode
```

```Go
const parserMode = parser.ParseComments
```

### <a id="testfile" href="#testfile">const testfile</a>

```
searchKey: format.testfile
```

```Go
const testfile = "format_test.go"
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="config" href="#config">var config</a>

```
searchKey: format.config
```

```Go
var config = printer.Config{Mode: printerMode, Tabwidth: tabWidth}
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: format.tests
```

```Go
var tests = ...
```

Test cases that are expected to fail are marked by the prefix "ERROR". The formatted result must look the same as the input for successful tests. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="Node" href="#Node">func Node(dst io.Writer, fset *token.FileSet, node interface{}) error</a>

```
searchKey: format.Node
tags: [exported]
```

```Go
func Node(dst io.Writer, fset *token.FileSet, node interface{}) error
```

Node formats node in canonical gofmt style and writes the result to dst. 

The node type must be *ast.File, *printer.CommentedNode, []ast.Decl, []ast.Stmt, or assignment-compatible to ast.Expr, ast.Decl, ast.Spec, or ast.Stmt. Node does not modify node. Imports are not sorted for nodes representing partial source files (for instance, if the node is not an *ast.File or a *printer.CommentedNode not wrapping an *ast.File). 

The function may return early (before the entire result is written) and return a formatting error, for instance due to an incorrect AST. 

### <a id="Source" href="#Source">func Source(src []byte) ([]byte, error)</a>

```
searchKey: format.Source
tags: [exported]
```

```Go
func Source(src []byte) ([]byte, error)
```

Source formats src in canonical gofmt style and returns the result or an (I/O or syntax) error. src is expected to be a syntactically correct Go source file, or a list of Go declarations or statements. 

If src is a partial source file, the leading and trailing space of src is applied to the result (such that it has the same leading and trailing space as src), and the result is indented by the same amount as the first line of src containing code. Imports are not sorted for partial source files. 

### <a id="hasUnsortedImports" href="#hasUnsortedImports">func hasUnsortedImports(file *ast.File) bool</a>

```
searchKey: format.hasUnsortedImports
```

```Go
func hasUnsortedImports(file *ast.File) bool
```

### <a id="parse" href="#parse">func parse(fset *token.FileSet, filename string, src []byte, fragmentOk bool) (file *ast.File,...</a>

```
searchKey: format.parse
```

```Go
func parse(fset *token.FileSet, filename string, src []byte, fragmentOk bool) (
	file *ast.File,
	sourceAdj func(src []byte, indent int) []byte,
	indentAdj int,
	err error,
)
```

parse parses src, which was read from the named file, as a Go source file, declaration, or statement list. 

### <a id="format" href="#format">func format(fset *token.FileSet,...</a>

```
searchKey: format.format
```

```Go
func format(
	fset *token.FileSet,
	file *ast.File,
	sourceAdj func(src []byte, indent int) []byte,
	indentAdj int,
	src []byte,
	cfg printer.Config,
) ([]byte, error)
```

format formats the given package file originally obtained from src and adjusts the result based on the original source via sourceAdj and indentAdj. 

### <a id="isSpace" href="#isSpace">func isSpace(b byte) bool</a>

```
searchKey: format.isSpace
```

```Go
func isSpace(b byte) bool
```

isSpace reports whether the byte is a space character. isSpace defines a space as being among the following bytes: ' ', '\t', '\n' and '\r'. 

### <a id="diff" href="#diff">func diff(t *testing.T, dst, src []byte)</a>

```
searchKey: format.diff
```

```Go
func diff(t *testing.T, dst, src []byte)
```

### <a id="TestNode" href="#TestNode">func TestNode(t *testing.T)</a>

```
searchKey: format.TestNode
```

```Go
func TestNode(t *testing.T)
```

### <a id="TestNodeNoModify" href="#TestNodeNoModify">func TestNodeNoModify(t *testing.T)</a>

```
searchKey: format.TestNodeNoModify
```

```Go
func TestNodeNoModify(t *testing.T)
```

Node is documented to not modify the AST. Test that it is so even when numbers are normalized. 

### <a id="TestSource" href="#TestSource">func TestSource(t *testing.T)</a>

```
searchKey: format.TestSource
```

```Go
func TestSource(t *testing.T)
```

### <a id="String" href="#String">func String(s string) (string, error)</a>

```
searchKey: format.String
```

```Go
func String(s string) (string, error)
```

### <a id="TestPartial" href="#TestPartial">func TestPartial(t *testing.T)</a>

```
searchKey: format.TestPartial
```

```Go
func TestPartial(t *testing.T)
```

