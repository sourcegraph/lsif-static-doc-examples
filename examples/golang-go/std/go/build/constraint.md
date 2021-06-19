# Package constraint

Package constraint implements parsing and evaluation of build constraint lines. See [https://golang.org/cmd/go/#hdr-Build_constraints](https://golang.org/cmd/go/#hdr-Build_constraints) for documentation about build constraints themselves. 

This package parses both the original “// +build” syntax and the “//go:build” syntax that will be added in Go 1.17. The parser is being included in Go 1.16 to allow tools that need to process Go 1.17 source code to still be built against the Go 1.16 release. See [https://golang.org/design/draft-gobuild](https://golang.org/design/draft-gobuild) for details about the “//go:build” syntax. 

## Index

* [Variables](#var)
    * [var errNotConstraint](#errNotConstraint)
    * [var errComplex](#errComplex)
    * [var exprStringTests](#exprStringTests)
    * [var lexTests](#lexTests)
    * [var parseExprTests](#parseExprTests)
    * [var parseExprErrorTests](#parseExprErrorTests)
    * [var exprEvalTests](#exprEvalTests)
    * [var parsePlusBuildExprTests](#parsePlusBuildExprTests)
    * [var constraintTests](#constraintTests)
    * [var plusBuildLinesTests](#plusBuildLinesTests)
* [Types](#type)
    * [type Expr interface](#Expr)
        * [func tag(tag string) Expr](#tag)
        * [func not(x Expr) Expr](#not)
        * [func and(x, y Expr) Expr](#and)
        * [func or(x, y Expr) Expr](#or)
        * [func Parse(line string) (Expr, error)](#Parse)
        * [func parseExpr(text string) (x Expr, err error)](#parseExpr)
        * [func parsePlusBuildExpr(text string) Expr](#parsePlusBuildExpr)
        * [func pushNot(x Expr, not bool) Expr](#pushNot)
    * [type TagExpr struct](#TagExpr)
        * [func (x *TagExpr) isExpr()](#TagExpr.isExpr)
        * [func (x *TagExpr) Eval(ok func(tag string) bool) bool](#TagExpr.Eval)
        * [func (x *TagExpr) String() string](#TagExpr.String)
    * [type NotExpr struct](#NotExpr)
        * [func (x *NotExpr) isExpr()](#NotExpr.isExpr)
        * [func (x *NotExpr) Eval(ok func(tag string) bool) bool](#NotExpr.Eval)
        * [func (x *NotExpr) String() string](#NotExpr.String)
    * [type AndExpr struct](#AndExpr)
        * [func (x *AndExpr) isExpr()](#AndExpr.isExpr)
        * [func (x *AndExpr) Eval(ok func(tag string) bool) bool](#AndExpr.Eval)
        * [func (x *AndExpr) String() string](#AndExpr.String)
    * [type OrExpr struct](#OrExpr)
        * [func (x *OrExpr) isExpr()](#OrExpr.isExpr)
        * [func (x *OrExpr) Eval(ok func(tag string) bool) bool](#OrExpr.Eval)
        * [func (x *OrExpr) String() string](#OrExpr.String)
    * [type SyntaxError struct](#SyntaxError)
        * [func (e *SyntaxError) Error() string](#SyntaxError.Error)
    * [type exprParser struct](#exprParser)
        * [func (p *exprParser) or() Expr](#exprParser.or)
        * [func (p *exprParser) and() Expr](#exprParser.and)
        * [func (p *exprParser) not() Expr](#exprParser.not)
        * [func (p *exprParser) atom() Expr](#exprParser.atom)
        * [func (p *exprParser) lex()](#exprParser.lex)
* [Functions](#func)
    * [func andArg(x Expr) string](#andArg)
    * [func orArg(x Expr) string](#orArg)
    * [func IsGoBuild(line string) bool](#IsGoBuild)
    * [func splitGoBuild(line string) (expr string, ok bool)](#splitGoBuild)
    * [func IsPlusBuild(line string) bool](#IsPlusBuild)
    * [func splitPlusBuild(line string) (expr string, ok bool)](#splitPlusBuild)
    * [func isValidTag(word string) bool](#isValidTag)
    * [func PlusBuildLines(x Expr) ([]string, error)](#PlusBuildLines)
    * [func appendSplitAnd(list []Expr, x Expr) []Expr](#appendSplitAnd)
    * [func appendSplitOr(list []Expr, x Expr) []Expr](#appendSplitOr)
    * [func TestExprString(t *testing.T)](#TestExprString)
    * [func TestLex(t *testing.T)](#TestLex)
    * [func lexHelp(p *exprParser) (tok string, err error)](#lexHelp)
    * [func TestParseExpr(t *testing.T)](#TestParseExpr)
    * [func TestParseError(t *testing.T)](#TestParseError)
    * [func TestExprEval(t *testing.T)](#TestExprEval)
    * [func TestParsePlusBuildExpr(t *testing.T)](#TestParsePlusBuildExpr)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestPlusBuildLines(t *testing.T)](#TestPlusBuildLines)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="errNotConstraint" href="#errNotConstraint">var errNotConstraint</a>

```
searchKey: constraint.errNotConstraint
```

```Go
var errNotConstraint = errors.New("not a build constraint")
```

### <a id="errComplex" href="#errComplex">var errComplex</a>

```
searchKey: constraint.errComplex
```

```Go
var errComplex = errors.New("expression too complex for // +build lines")
```

### <a id="exprStringTests" href="#exprStringTests">var exprStringTests</a>

```
searchKey: constraint.exprStringTests
```

```Go
var exprStringTests = ...
```

### <a id="lexTests" href="#lexTests">var lexTests</a>

```
searchKey: constraint.lexTests
```

```Go
var lexTests = ...
```

### <a id="parseExprTests" href="#parseExprTests">var parseExprTests</a>

```
searchKey: constraint.parseExprTests
```

```Go
var parseExprTests = ...
```

### <a id="parseExprErrorTests" href="#parseExprErrorTests">var parseExprErrorTests</a>

```
searchKey: constraint.parseExprErrorTests
```

```Go
var parseExprErrorTests = ...
```

### <a id="exprEvalTests" href="#exprEvalTests">var exprEvalTests</a>

```
searchKey: constraint.exprEvalTests
```

```Go
var exprEvalTests = ...
```

### <a id="parsePlusBuildExprTests" href="#parsePlusBuildExprTests">var parsePlusBuildExprTests</a>

```
searchKey: constraint.parsePlusBuildExprTests
```

```Go
var parsePlusBuildExprTests = ...
```

### <a id="constraintTests" href="#constraintTests">var constraintTests</a>

```
searchKey: constraint.constraintTests
```

```Go
var constraintTests = ...
```

### <a id="plusBuildLinesTests" href="#plusBuildLinesTests">var plusBuildLinesTests</a>

```
searchKey: constraint.plusBuildLinesTests
```

```Go
var plusBuildLinesTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Expr" href="#Expr">type Expr interface</a>

```
searchKey: constraint.Expr
tags: [exported]
```

```Go
type Expr interface {
	// String returns the string form of the expression,
	// using the boolean syntax used in //go:build lines.
	String() string

	// Eval reports whether the expression evaluates to true.
	// It calls ok(tag) as needed to find out whether a given build tag
	// is satisfied by the current build configuration.
	Eval(ok func(tag string) bool) bool

	// The presence of an isExpr method explicitly marks the type as an Expr.
	// Only implementations in this package should be used as Exprs.
	isExpr()
}
```

An Expr is a build tag constraint expression. The underlying concrete type is *AndExpr, *OrExpr, *NotExpr, or *TagExpr. 

#### <a id="tag" href="#tag">func tag(tag string) Expr</a>

```
searchKey: constraint.tag
```

```Go
func tag(tag string) Expr
```

#### <a id="not" href="#not">func not(x Expr) Expr</a>

```
searchKey: constraint.not
```

```Go
func not(x Expr) Expr
```

#### <a id="and" href="#and">func and(x, y Expr) Expr</a>

```
searchKey: constraint.and
```

```Go
func and(x, y Expr) Expr
```

#### <a id="or" href="#or">func or(x, y Expr) Expr</a>

```
searchKey: constraint.or
```

```Go
func or(x, y Expr) Expr
```

#### <a id="Parse" href="#Parse">func Parse(line string) (Expr, error)</a>

```
searchKey: constraint.Parse
tags: [exported]
```

```Go
func Parse(line string) (Expr, error)
```

Parse parses a single build constraint line of the form “//go:build ...” or “// +build ...” and returns the corresponding boolean expression. 

#### <a id="parseExpr" href="#parseExpr">func parseExpr(text string) (x Expr, err error)</a>

```
searchKey: constraint.parseExpr
```

```Go
func parseExpr(text string) (x Expr, err error)
```

parseExpr parses a boolean build tag expression. 

#### <a id="parsePlusBuildExpr" href="#parsePlusBuildExpr">func parsePlusBuildExpr(text string) Expr</a>

```
searchKey: constraint.parsePlusBuildExpr
```

```Go
func parsePlusBuildExpr(text string) Expr
```

parsePlusBuildExpr parses a legacy build tag expression (as used with “// +build”). 

#### <a id="pushNot" href="#pushNot">func pushNot(x Expr, not bool) Expr</a>

```
searchKey: constraint.pushNot
```

```Go
func pushNot(x Expr, not bool) Expr
```

pushNot applies DeMorgan's law to push negations down the expression, so that only tags are negated in the result. (It applies the rewrites !(X && Y) => (!X || !Y) and !(X || Y) => (!X && !Y).) 

### <a id="TagExpr" href="#TagExpr">type TagExpr struct</a>

```
searchKey: constraint.TagExpr
tags: [exported]
```

```Go
type TagExpr struct {
	Tag string // for example, “linux” or “cgo”
}
```

A TagExpr is an Expr for the single tag Tag. 

#### <a id="TagExpr.isExpr" href="#TagExpr.isExpr">func (x *TagExpr) isExpr()</a>

```
searchKey: constraint.TagExpr.isExpr
```

```Go
func (x *TagExpr) isExpr()
```

#### <a id="TagExpr.Eval" href="#TagExpr.Eval">func (x *TagExpr) Eval(ok func(tag string) bool) bool</a>

```
searchKey: constraint.TagExpr.Eval
tags: [exported]
```

```Go
func (x *TagExpr) Eval(ok func(tag string) bool) bool
```

#### <a id="TagExpr.String" href="#TagExpr.String">func (x *TagExpr) String() string</a>

```
searchKey: constraint.TagExpr.String
tags: [exported]
```

```Go
func (x *TagExpr) String() string
```

### <a id="NotExpr" href="#NotExpr">type NotExpr struct</a>

```
searchKey: constraint.NotExpr
tags: [exported]
```

```Go
type NotExpr struct {
	X Expr
}
```

A NotExpr represents the expression !X (the negation of X). 

#### <a id="NotExpr.isExpr" href="#NotExpr.isExpr">func (x *NotExpr) isExpr()</a>

```
searchKey: constraint.NotExpr.isExpr
```

```Go
func (x *NotExpr) isExpr()
```

#### <a id="NotExpr.Eval" href="#NotExpr.Eval">func (x *NotExpr) Eval(ok func(tag string) bool) bool</a>

```
searchKey: constraint.NotExpr.Eval
tags: [exported]
```

```Go
func (x *NotExpr) Eval(ok func(tag string) bool) bool
```

#### <a id="NotExpr.String" href="#NotExpr.String">func (x *NotExpr) String() string</a>

```
searchKey: constraint.NotExpr.String
tags: [exported]
```

```Go
func (x *NotExpr) String() string
```

### <a id="AndExpr" href="#AndExpr">type AndExpr struct</a>

```
searchKey: constraint.AndExpr
tags: [exported]
```

```Go
type AndExpr struct {
	X, Y Expr
}
```

An AndExpr represents the expression X && Y. 

#### <a id="AndExpr.isExpr" href="#AndExpr.isExpr">func (x *AndExpr) isExpr()</a>

```
searchKey: constraint.AndExpr.isExpr
```

```Go
func (x *AndExpr) isExpr()
```

#### <a id="AndExpr.Eval" href="#AndExpr.Eval">func (x *AndExpr) Eval(ok func(tag string) bool) bool</a>

```
searchKey: constraint.AndExpr.Eval
tags: [exported]
```

```Go
func (x *AndExpr) Eval(ok func(tag string) bool) bool
```

#### <a id="AndExpr.String" href="#AndExpr.String">func (x *AndExpr) String() string</a>

```
searchKey: constraint.AndExpr.String
tags: [exported]
```

```Go
func (x *AndExpr) String() string
```

### <a id="OrExpr" href="#OrExpr">type OrExpr struct</a>

```
searchKey: constraint.OrExpr
tags: [exported]
```

```Go
type OrExpr struct {
	X, Y Expr
}
```

An OrExpr represents the expression X || Y. 

#### <a id="OrExpr.isExpr" href="#OrExpr.isExpr">func (x *OrExpr) isExpr()</a>

```
searchKey: constraint.OrExpr.isExpr
```

```Go
func (x *OrExpr) isExpr()
```

#### <a id="OrExpr.Eval" href="#OrExpr.Eval">func (x *OrExpr) Eval(ok func(tag string) bool) bool</a>

```
searchKey: constraint.OrExpr.Eval
tags: [exported]
```

```Go
func (x *OrExpr) Eval(ok func(tag string) bool) bool
```

#### <a id="OrExpr.String" href="#OrExpr.String">func (x *OrExpr) String() string</a>

```
searchKey: constraint.OrExpr.String
tags: [exported]
```

```Go
func (x *OrExpr) String() string
```

### <a id="SyntaxError" href="#SyntaxError">type SyntaxError struct</a>

```
searchKey: constraint.SyntaxError
tags: [exported]
```

```Go
type SyntaxError struct {
	Offset int    // byte offset in input where error was detected
	Err    string // description of error
}
```

A SyntaxError reports a syntax error in a parsed build expression. 

#### <a id="SyntaxError.Error" href="#SyntaxError.Error">func (e *SyntaxError) Error() string</a>

```
searchKey: constraint.SyntaxError.Error
tags: [exported]
```

```Go
func (e *SyntaxError) Error() string
```

### <a id="exprParser" href="#exprParser">type exprParser struct</a>

```
searchKey: constraint.exprParser
```

```Go
type exprParser struct {
	s string // input string
	i int    // next read location in s

	tok   string // last token read
	isTag bool
	pos   int // position (start) of last token
}
```

An exprParser holds state for parsing a build expression. 

#### <a id="exprParser.or" href="#exprParser.or">func (p *exprParser) or() Expr</a>

```
searchKey: constraint.exprParser.or
```

```Go
func (p *exprParser) or() Expr
```

or parses a sequence of || expressions. On entry, the next input token has not yet been lexed. On exit, the next input token has been lexed and is in p.tok. 

#### <a id="exprParser.and" href="#exprParser.and">func (p *exprParser) and() Expr</a>

```
searchKey: constraint.exprParser.and
```

```Go
func (p *exprParser) and() Expr
```

and parses a sequence of && expressions. On entry, the next input token has not yet been lexed. On exit, the next input token has been lexed and is in p.tok. 

#### <a id="exprParser.not" href="#exprParser.not">func (p *exprParser) not() Expr</a>

```
searchKey: constraint.exprParser.not
```

```Go
func (p *exprParser) not() Expr
```

not parses a ! expression. On entry, the next input token has not yet been lexed. On exit, the next input token has been lexed and is in p.tok. 

#### <a id="exprParser.atom" href="#exprParser.atom">func (p *exprParser) atom() Expr</a>

```
searchKey: constraint.exprParser.atom
```

```Go
func (p *exprParser) atom() Expr
```

atom parses a tag or a parenthesized expression. On entry, the next input token HAS been lexed. On exit, the next input token has been lexed and is in p.tok. 

#### <a id="exprParser.lex" href="#exprParser.lex">func (p *exprParser) lex()</a>

```
searchKey: constraint.exprParser.lex
```

```Go
func (p *exprParser) lex()
```

lex finds and consumes the next token in the input stream. On return, p.tok is set to the token text, p.isTag reports whether the token was a tag, and p.pos records the byte offset of the start of the token in the input stream. If lex reaches the end of the input, p.tok is set to the empty string. For any other syntax error, lex panics with a SyntaxError. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="andArg" href="#andArg">func andArg(x Expr) string</a>

```
searchKey: constraint.andArg
```

```Go
func andArg(x Expr) string
```

### <a id="orArg" href="#orArg">func orArg(x Expr) string</a>

```
searchKey: constraint.orArg
```

```Go
func orArg(x Expr) string
```

### <a id="IsGoBuild" href="#IsGoBuild">func IsGoBuild(line string) bool</a>

```
searchKey: constraint.IsGoBuild
tags: [exported]
```

```Go
func IsGoBuild(line string) bool
```

IsGoBuild reports whether the line of text is a “//go:build” constraint. It only checks the prefix of the text, not that the expression itself parses. 

### <a id="splitGoBuild" href="#splitGoBuild">func splitGoBuild(line string) (expr string, ok bool)</a>

```
searchKey: constraint.splitGoBuild
```

```Go
func splitGoBuild(line string) (expr string, ok bool)
```

splitGoBuild splits apart the leading //go:build prefix in line from the build expression itself. It returns "", false if the input is not a //go:build line or if the input contains multiple lines. 

### <a id="IsPlusBuild" href="#IsPlusBuild">func IsPlusBuild(line string) bool</a>

```
searchKey: constraint.IsPlusBuild
tags: [exported]
```

```Go
func IsPlusBuild(line string) bool
```

IsPlusBuild reports whether the line of text is a “// +build” constraint. It only checks the prefix of the text, not that the expression itself parses. 

### <a id="splitPlusBuild" href="#splitPlusBuild">func splitPlusBuild(line string) (expr string, ok bool)</a>

```
searchKey: constraint.splitPlusBuild
```

```Go
func splitPlusBuild(line string) (expr string, ok bool)
```

splitPlusBuild splits apart the leading // +build prefix in line from the build expression itself. It returns "", false if the input is not a // +build line or if the input contains multiple lines. 

### <a id="isValidTag" href="#isValidTag">func isValidTag(word string) bool</a>

```
searchKey: constraint.isValidTag
```

```Go
func isValidTag(word string) bool
```

isValidTag reports whether the word is a valid build tag. Tags must be letters, digits, underscores or dots. Unlike in Go identifiers, all digits are fine (e.g., "386"). 

### <a id="PlusBuildLines" href="#PlusBuildLines">func PlusBuildLines(x Expr) ([]string, error)</a>

```
searchKey: constraint.PlusBuildLines
tags: [exported]
```

```Go
func PlusBuildLines(x Expr) ([]string, error)
```

PlusBuildLines returns a sequence of “// +build” lines that evaluate to the build expression x. If the expression is too complex to convert directly to “// +build” lines, PlusBuildLines returns an error. 

### <a id="appendSplitAnd" href="#appendSplitAnd">func appendSplitAnd(list []Expr, x Expr) []Expr</a>

```
searchKey: constraint.appendSplitAnd
```

```Go
func appendSplitAnd(list []Expr, x Expr) []Expr
```

appendSplitAnd appends x to list while splitting apart any top-level && expressions. For example, appendSplitAnd({W}, X && Y && Z) = {W, X, Y, Z}. 

### <a id="appendSplitOr" href="#appendSplitOr">func appendSplitOr(list []Expr, x Expr) []Expr</a>

```
searchKey: constraint.appendSplitOr
```

```Go
func appendSplitOr(list []Expr, x Expr) []Expr
```

appendSplitOr appends x to list while splitting apart any top-level || expressions. For example, appendSplitOr({W}, X || Y || Z) = {W, X, Y, Z}. 

### <a id="TestExprString" href="#TestExprString">func TestExprString(t *testing.T)</a>

```
searchKey: constraint.TestExprString
```

```Go
func TestExprString(t *testing.T)
```

### <a id="TestLex" href="#TestLex">func TestLex(t *testing.T)</a>

```
searchKey: constraint.TestLex
```

```Go
func TestLex(t *testing.T)
```

### <a id="lexHelp" href="#lexHelp">func lexHelp(p *exprParser) (tok string, err error)</a>

```
searchKey: constraint.lexHelp
```

```Go
func lexHelp(p *exprParser) (tok string, err error)
```

### <a id="TestParseExpr" href="#TestParseExpr">func TestParseExpr(t *testing.T)</a>

```
searchKey: constraint.TestParseExpr
```

```Go
func TestParseExpr(t *testing.T)
```

### <a id="TestParseError" href="#TestParseError">func TestParseError(t *testing.T)</a>

```
searchKey: constraint.TestParseError
```

```Go
func TestParseError(t *testing.T)
```

### <a id="TestExprEval" href="#TestExprEval">func TestExprEval(t *testing.T)</a>

```
searchKey: constraint.TestExprEval
```

```Go
func TestExprEval(t *testing.T)
```

### <a id="TestParsePlusBuildExpr" href="#TestParsePlusBuildExpr">func TestParsePlusBuildExpr(t *testing.T)</a>

```
searchKey: constraint.TestParsePlusBuildExpr
```

```Go
func TestParsePlusBuildExpr(t *testing.T)
```

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: constraint.TestParse
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestPlusBuildLines" href="#TestPlusBuildLines">func TestPlusBuildLines(t *testing.T)</a>

```
searchKey: constraint.TestPlusBuildLines
```

```Go
func TestPlusBuildLines(t *testing.T)
```

