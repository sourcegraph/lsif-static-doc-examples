# Package syntax

Package syntax parses search queries into parse trees. Most clients will use the parent package instead of this package. 

This package is derived from [http://github.com/bcampbell/qs](http://github.com/bcampbell/qs) (see NOTICE). 

## Index

* [Constants](#const)
    * [const TokenColon](#TokenColon)
    * [const TokenEOF](#TokenEOF)
    * [const TokenError](#TokenError)
    * [const TokenLiteral](#TokenLiteral)
    * [const TokenMinus](#TokenMinus)
    * [const TokenPattern](#TokenPattern)
    * [const TokenQuoted](#TokenQuoted)
    * [const TokenSep](#TokenSep)
    * [const _TokenType_name](#_TokenType_name)
* [Variables](#var)
    * [var singleCharTokens](#singleCharTokens)
    * [var _TokenType_index](#_TokenType_index)
* [Types](#type)
    * [type Expr struct](#Expr)
        * [func (e Expr) String() string](#Expr.String)
        * [func (e Expr) WithErrorsQuoted() Expr](#Expr.WithErrorsQuoted)
    * [type ParseError struct](#ParseError)
        * [func (e *ParseError) Error() string](#ParseError.Error)
    * [type ParseTree []*syntax.Expr](#ParseTree)
        * [func Map(p ParseTree, f func(e Expr) *Expr) ParseTree](#Map)
        * [func Parse(input string) (ParseTree, error)](#Parse)
        * [func ParseAllowingErrors(input string) ParseTree](#ParseAllowingErrors)
        * [func (p ParseTree) String() string](#ParseTree.String)
        * [func (p ParseTree) Values(field string) []string](#ParseTree.Values)
        * [func (p ParseTree) WithErrorsQuoted() ParseTree](#ParseTree.WithErrorsQuoted)
    * [type Token struct](#Token)
    * [type TokenType int](#TokenType)
        * [func (i TokenType) String() string](#TokenType.String)
    * [type context struct](#context)
    * [type parser struct](#parser)
        * [func (p *parser) backup()](#parser.backup)
        * [func (p *parser) errorExpr(toks ...Token) *Expr](#parser.errorExpr)
        * [func (p *parser) next() Token](#parser.next)
        * [func (p *parser) parseExpr(ctx context) (*Expr, error)](#parser.parseExpr)
        * [func (p *parser) parseExprList(ctx context) (exprList []*Expr, err error)](#parser.parseExprList)
        * [func (p *parser) parseExprSign(ctx context) (*Expr, error)](#parser.parseExprSign)
        * [func (p *parser) peek() Token](#parser.peek)
    * [type scanner struct](#scanner)
        * [func (s *scanner) backup()](#scanner.backup)
        * [func (s *scanner) emit(typ TokenType)](#scanner.emit)
        * [func (s *scanner) emitError(msg string)](#scanner.emitError)
        * [func (s *scanner) eof() bool](#scanner.eof)
        * [func (s *scanner) ignore()](#scanner.ignore)
        * [func (s *scanner) next() rune](#scanner.next)
        * [func (s *scanner) peek() rune](#scanner.peek)
    * [type stateFn func(*github.com/sourcegraph/sourcegraph/enterprise/internal/batches/search/syntax.scanner) github.com/sourcegraph/sourcegraph/enterprise/internal/batches/search/syntax.stateFn](#stateFn)
        * [func scanDefault(s *scanner) stateFn](#scanDefault)
        * [func scanLiteral(s *scanner) stateFn](#scanLiteral)
        * [func scanPattern(s *scanner) stateFn](#scanPattern)
        * [func scanQuoted(s *scanner) stateFn](#scanQuoted)
        * [func scanSpace(s *scanner) stateFn](#scanSpace)
        * [func scanText(s *scanner) stateFn](#scanText)
        * [func scanValue(s *scanner) stateFn](#scanValue)
* [Functions](#func)
    * [func Scan(input string) []Token](#Scan)
    * [func TestExpr_String(t *testing.T)](#TestExpr_String)
    * [func TestParseAllowingErrors(t *testing.T)](#TestParseAllowingErrors)
    * [func TestParser(t *testing.T)](#TestParser)
    * [func TestQuery_WithErrorsQuoted(t *testing.T)](#TestQuery_WithErrorsQuoted)
    * [func TestScanner(t *testing.T)](#TestScanner)
    * [func tokenTypes(tokens []Token) []TokenType](#tokenTypes)
    * [func tokenValues(tokens []Token) []string](#tokenValues)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="TokenColon" href="#TokenColon">const TokenColon</a>

```
searchKey: syntax.TokenColon
tags: [constant number]
```

```Go
const TokenColon
```

All TokenType values. 

### <a id="TokenEOF" href="#TokenEOF">const TokenEOF</a>

```
searchKey: syntax.TokenEOF
tags: [constant number]
```

```Go
const TokenEOF TokenType = iota
```

All TokenType values. 

### <a id="TokenError" href="#TokenError">const TokenError</a>

```
searchKey: syntax.TokenError
tags: [constant number]
```

```Go
const TokenError
```

All TokenType values. 

### <a id="TokenLiteral" href="#TokenLiteral">const TokenLiteral</a>

```
searchKey: syntax.TokenLiteral
tags: [constant number]
```

```Go
const TokenLiteral
```

All TokenType values. 

### <a id="TokenMinus" href="#TokenMinus">const TokenMinus</a>

```
searchKey: syntax.TokenMinus
tags: [constant number]
```

```Go
const TokenMinus
```

All TokenType values. 

### <a id="TokenPattern" href="#TokenPattern">const TokenPattern</a>

```
searchKey: syntax.TokenPattern
tags: [constant number]
```

```Go
const TokenPattern
```

All TokenType values. 

### <a id="TokenQuoted" href="#TokenQuoted">const TokenQuoted</a>

```
searchKey: syntax.TokenQuoted
tags: [constant number]
```

```Go
const TokenQuoted
```

All TokenType values. 

### <a id="TokenSep" href="#TokenSep">const TokenSep</a>

```
searchKey: syntax.TokenSep
tags: [constant number]
```

```Go
const TokenSep // separator (like a semicolon)

```

All TokenType values. 

### <a id="_TokenType_name" href="#_TokenType_name">const _TokenType_name</a>

```
searchKey: syntax._TokenType_name
tags: [constant string private]
```

```Go
const _TokenType_name = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="singleCharTokens" href="#singleCharTokens">var singleCharTokens</a>

```
searchKey: syntax.singleCharTokens
tags: [variable object private]
```

```Go
var singleCharTokens = map[rune]TokenType{
	':': TokenColon,
	'-': TokenMinus,
}
```

### <a id="_TokenType_index" href="#_TokenType_index">var _TokenType_index</a>

```
searchKey: syntax._TokenType_index
tags: [variable array number private]
```

```Go
var _TokenType_index = [...]uint8{0, 8, 18, 30, 41, 53, 63, 73, 81}
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Expr" href="#Expr">type Expr struct</a>

```
searchKey: syntax.Expr
tags: [struct]
```

```Go
type Expr struct {
	Pos       int       // the starting character position of the expression
	Not       bool      // the expression is negated (e.g., -term or -field:term)
	Field     string    // the field that this expression applies to
	Value     string    // the raw field value
	ValueType TokenType // the type of the value
}
```

An Expr describes an expression in the parse tree. 

#### <a id="Expr.String" href="#Expr.String">func (e Expr) String() string</a>

```
searchKey: syntax.Expr.String
tags: [method]
```

```Go
func (e Expr) String() string
```

#### <a id="Expr.WithErrorsQuoted" href="#Expr.WithErrorsQuoted">func (e Expr) WithErrorsQuoted() Expr</a>

```
searchKey: syntax.Expr.WithErrorsQuoted
tags: [method]
```

```Go
func (e Expr) WithErrorsQuoted() Expr
```

WithErrorsQuoted returns a new version of the expression, quoting in case of TokenError or an invalid regular expression. 

### <a id="ParseError" href="#ParseError">type ParseError struct</a>

```
searchKey: syntax.ParseError
tags: [struct]
```

```Go
type ParseError struct {
	Pos int    // the character position where the error occurred
	Msg string // description of the error
}
```

ParseError describes an error in query parsing. 

#### <a id="ParseError.Error" href="#ParseError.Error">func (e *ParseError) Error() string</a>

```
searchKey: syntax.ParseError.Error
tags: [method]
```

```Go
func (e *ParseError) Error() string
```

### <a id="ParseTree" href="#ParseTree">type ParseTree []*syntax.Expr</a>

```
searchKey: syntax.ParseTree
tags: [array struct]
```

```Go
type ParseTree []*Expr
```

The parse tree for search input. It is a list of expressions. 

#### <a id="Map" href="#Map">func Map(p ParseTree, f func(e Expr) *Expr) ParseTree</a>

```
searchKey: syntax.Map
tags: [function]
```

```Go
func Map(p ParseTree, f func(e Expr) *Expr) ParseTree
```

Map builds a new parse tree by running a function f on each expression in an existing parse tree and substituting the resulting expression. If f returns nil, the expression is removed in the new parse tree. 

#### <a id="Parse" href="#Parse">func Parse(input string) (ParseTree, error)</a>

```
searchKey: syntax.Parse
tags: [function]
```

```Go
func Parse(input string) (ParseTree, error)
```

Parse parses the input string and returns its parse tree. Returned errors are of type *ParseError, which includes the error position and message. 

BNF-ish query syntax: 

```
exprList  := {exprSign} | exprSign (sep exprSign)*
exprSign  := {"-"} expr
expr      := fieldExpr | lit | quoted | pattern
fieldExpr := lit ":" value
value     := lit | quoted

```
#### <a id="ParseAllowingErrors" href="#ParseAllowingErrors">func ParseAllowingErrors(input string) ParseTree</a>

```
searchKey: syntax.ParseAllowingErrors
tags: [function]
```

```Go
func ParseAllowingErrors(input string) ParseTree
```

ParseAllowingErrors works like Parse except that any errors are returned as TokenError within the Expr slice of the returned parse tree. 

#### <a id="ParseTree.String" href="#ParseTree.String">func (p ParseTree) String() string</a>

```
searchKey: syntax.ParseTree.String
tags: [method]
```

```Go
func (p ParseTree) String() string
```

String returns a string that parses to the parse tree, where expressions are separated by a single space. 

#### <a id="ParseTree.Values" href="#ParseTree.Values">func (p ParseTree) Values(field string) []string</a>

```
searchKey: syntax.ParseTree.Values
tags: [method]
```

```Go
func (p ParseTree) Values(field string) []string
```

Values returns the raw string values associated with a field. 

#### <a id="ParseTree.WithErrorsQuoted" href="#ParseTree.WithErrorsQuoted">func (p ParseTree) WithErrorsQuoted() ParseTree</a>

```
searchKey: syntax.ParseTree.WithErrorsQuoted
tags: [method]
```

```Go
func (p ParseTree) WithErrorsQuoted() ParseTree
```

WithErrorsQuoted converts a search input like `f:foo b(ar` to `f:foo "b(ar"`. 

### <a id="Token" href="#Token">type Token struct</a>

```
searchKey: syntax.Token
tags: [struct]
```

```Go
type Token struct {
	Type  TokenType // type of token
	Value string    // string value
	Pos   int       // starting character position
}
```

Token is a token in a query. 

### <a id="TokenType" href="#TokenType">type TokenType int</a>

```
searchKey: syntax.TokenType
tags: [number]
```

```Go
type TokenType int
```

TokenType is the set of lexical tokens in the query syntax. 

#### <a id="TokenType.String" href="#TokenType.String">func (i TokenType) String() string</a>

```
searchKey: syntax.TokenType.String
tags: [method]
```

```Go
func (i TokenType) String() string
```

### <a id="context" href="#context">type context struct</a>

```
searchKey: syntax.context
tags: [struct private]
```

```Go
type context struct {
	field string // name of the field currently in scope (or "")
}
```

context holds settings active within a given scope during parsing. 

### <a id="parser" href="#parser">type parser struct</a>

```
searchKey: syntax.parser
tags: [struct private]
```

```Go
type parser struct {
	tokens      []Token
	pos         int
	allowErrors bool
}
```

#### <a id="parser.backup" href="#parser.backup">func (p *parser) backup()</a>

```
searchKey: syntax.parser.backup
tags: [method private]
```

```Go
func (p *parser) backup()
```

backup steps back one position in the token stream. 

#### <a id="parser.errorExpr" href="#parser.errorExpr">func (p *parser) errorExpr(toks ...Token) *Expr</a>

```
searchKey: syntax.parser.errorExpr
tags: [method private]
```

```Go
func (p *parser) errorExpr(toks ...Token) *Expr
```

errorExpr makes an Expr with type TokenError, whose value is built from the given tokens plus any others up to the next separator (space) or EOF. 

#### <a id="parser.next" href="#parser.next">func (p *parser) next() Token</a>

```
searchKey: syntax.parser.next
tags: [method private]
```

```Go
func (p *parser) next() Token
```

next returns the next token in the stream and advances the cursor. 

#### <a id="parser.parseExpr" href="#parser.parseExpr">func (p *parser) parseExpr(ctx context) (*Expr, error)</a>

```
searchKey: syntax.parser.parseExpr
tags: [method private]
```

```Go
func (p *parser) parseExpr(ctx context) (*Expr, error)
```

expr := exprField | lit | quoted | pattern 

#### <a id="parser.parseExprList" href="#parser.parseExprList">func (p *parser) parseExprList(ctx context) (exprList []*Expr, err error)</a>

```
searchKey: syntax.parser.parseExprList
tags: [method private]
```

```Go
func (p *parser) parseExprList(ctx context) (exprList []*Expr, err error)
```

exprList := {exprSign} | exprSign (sep exprSign)* 

#### <a id="parser.parseExprSign" href="#parser.parseExprSign">func (p *parser) parseExprSign(ctx context) (*Expr, error)</a>

```
searchKey: syntax.parser.parseExprSign
tags: [method private]
```

```Go
func (p *parser) parseExprSign(ctx context) (*Expr, error)
```

exprSign := {"-"} expr 

#### <a id="parser.peek" href="#parser.peek">func (p *parser) peek() Token</a>

```
searchKey: syntax.parser.peek
tags: [method private]
```

```Go
func (p *parser) peek() Token
```

peek returns the next token without consuming it. Peeking beyond the end of the token stream will return TokenEOF. 

### <a id="scanner" href="#scanner">type scanner struct</a>

```
searchKey: syntax.scanner
tags: [struct private]
```

```Go
type scanner struct {
	input   string
	tokens  []Token
	pos     int
	prevPos int
	start   int
}
```

#### <a id="scanner.backup" href="#scanner.backup">func (s *scanner) backup()</a>

```
searchKey: syntax.scanner.backup
tags: [method private]
```

```Go
func (s *scanner) backup()
```

#### <a id="scanner.emit" href="#scanner.emit">func (s *scanner) emit(typ TokenType)</a>

```
searchKey: syntax.scanner.emit
tags: [method private]
```

```Go
func (s *scanner) emit(typ TokenType)
```

#### <a id="scanner.emitError" href="#scanner.emitError">func (s *scanner) emitError(msg string)</a>

```
searchKey: syntax.scanner.emitError
tags: [method private]
```

```Go
func (s *scanner) emitError(msg string)
```

#### <a id="scanner.eof" href="#scanner.eof">func (s *scanner) eof() bool</a>

```
searchKey: syntax.scanner.eof
tags: [method private]
```

```Go
func (s *scanner) eof() bool
```

#### <a id="scanner.ignore" href="#scanner.ignore">func (s *scanner) ignore()</a>

```
searchKey: syntax.scanner.ignore
tags: [method private]
```

```Go
func (s *scanner) ignore()
```

#### <a id="scanner.next" href="#scanner.next">func (s *scanner) next() rune</a>

```
searchKey: syntax.scanner.next
tags: [method private]
```

```Go
func (s *scanner) next() rune
```

#### <a id="scanner.peek" href="#scanner.peek">func (s *scanner) peek() rune</a>

```
searchKey: syntax.scanner.peek
tags: [method private]
```

```Go
func (s *scanner) peek() rune
```

### <a id="stateFn" href="#stateFn">type stateFn func(*github.com/sourcegraph/sourcegraph/enterprise/internal/batches/search/syntax.scanner) github.com/sourcegraph/sourcegraph/enterprise/internal/batches/search/syntax.stateFn</a>

```
searchKey: syntax.stateFn
tags: [function private]
```

```Go
type stateFn func(*scanner) stateFn
```

#### <a id="scanDefault" href="#scanDefault">func scanDefault(s *scanner) stateFn</a>

```
searchKey: syntax.scanDefault
tags: [function private]
```

```Go
func scanDefault(s *scanner) stateFn
```

#### <a id="scanLiteral" href="#scanLiteral">func scanLiteral(s *scanner) stateFn</a>

```
searchKey: syntax.scanLiteral
tags: [function private]
```

```Go
func scanLiteral(s *scanner) stateFn
```

#### <a id="scanPattern" href="#scanPattern">func scanPattern(s *scanner) stateFn</a>

```
searchKey: syntax.scanPattern
tags: [function private]
```

```Go
func scanPattern(s *scanner) stateFn
```

#### <a id="scanQuoted" href="#scanQuoted">func scanQuoted(s *scanner) stateFn</a>

```
searchKey: syntax.scanQuoted
tags: [function private]
```

```Go
func scanQuoted(s *scanner) stateFn
```

#### <a id="scanSpace" href="#scanSpace">func scanSpace(s *scanner) stateFn</a>

```
searchKey: syntax.scanSpace
tags: [function private]
```

```Go
func scanSpace(s *scanner) stateFn
```

#### <a id="scanText" href="#scanText">func scanText(s *scanner) stateFn</a>

```
searchKey: syntax.scanText
tags: [function private]
```

```Go
func scanText(s *scanner) stateFn
```

#### <a id="scanValue" href="#scanValue">func scanValue(s *scanner) stateFn</a>

```
searchKey: syntax.scanValue
tags: [function private]
```

```Go
func scanValue(s *scanner) stateFn
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Scan" href="#Scan">func Scan(input string) []Token</a>

```
searchKey: syntax.Scan
tags: [function]
```

```Go
func Scan(input string) []Token
```

Scan scans the query and returns a list of tokens. 

### <a id="TestExpr_String" href="#TestExpr_String">func TestExpr_String(t *testing.T)</a>

```
searchKey: syntax.TestExpr_String
tags: [function private test]
```

```Go
func TestExpr_String(t *testing.T)
```

### <a id="TestParseAllowingErrors" href="#TestParseAllowingErrors">func TestParseAllowingErrors(t *testing.T)</a>

```
searchKey: syntax.TestParseAllowingErrors
tags: [function private test]
```

```Go
func TestParseAllowingErrors(t *testing.T)
```

### <a id="TestParser" href="#TestParser">func TestParser(t *testing.T)</a>

```
searchKey: syntax.TestParser
tags: [function private test]
```

```Go
func TestParser(t *testing.T)
```

### <a id="TestQuery_WithErrorsQuoted" href="#TestQuery_WithErrorsQuoted">func TestQuery_WithErrorsQuoted(t *testing.T)</a>

```
searchKey: syntax.TestQuery_WithErrorsQuoted
tags: [function private test]
```

```Go
func TestQuery_WithErrorsQuoted(t *testing.T)
```

### <a id="TestScanner" href="#TestScanner">func TestScanner(t *testing.T)</a>

```
searchKey: syntax.TestScanner
tags: [function private test]
```

```Go
func TestScanner(t *testing.T)
```

### <a id="tokenTypes" href="#tokenTypes">func tokenTypes(tokens []Token) []TokenType</a>

```
searchKey: syntax.tokenTypes
tags: [function private]
```

```Go
func tokenTypes(tokens []Token) []TokenType
```

### <a id="tokenValues" href="#tokenValues">func tokenValues(tokens []Token) []string</a>

```
searchKey: syntax.tokenValues
tags: [function private]
```

```Go
func tokenValues(tokens []Token) []string
```

