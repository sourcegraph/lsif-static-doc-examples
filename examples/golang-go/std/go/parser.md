# Package parser

Package parser implements a parser for Go source files. Input may be provided in a variety of forms (see the various Parse* functions); the output is an abstract syntax tree (AST) representing the Go source. The parser is invoked through one of the Parse* functions. 

The parser accepts a larger language than is syntactically permitted by the Go spec, for simplicity, and for improved robustness in the presence of syntax errors. For instance, in method declarations, the receiver is treated like an ordinary parameter list and thus may contain multiple entries where the spec permits exactly one. Consequently, the corresponding field in the AST (ast.FuncDecl.Recv) field is not restricted to one entry. 

## Index

* [Constants](#const)
    * [const PackageClauseOnly](#PackageClauseOnly)
    * [const ImportsOnly](#ImportsOnly)
    * [const ParseComments](#ParseComments)
    * [const Trace](#Trace)
    * [const DeclarationErrors](#DeclarationErrors)
    * [const SpuriousErrors](#SpuriousErrors)
    * [const SkipObjectResolution](#SkipObjectResolution)
    * [const AllErrors](#AllErrors)
    * [const basic](#basic)
    * [const labelOk](#labelOk)
    * [const rangeOk](#rangeOk)
    * [const debugResolve](#debugResolve)
    * [const testdata](#testdata)
* [Variables](#var)
    * [var stmtStart](#stmtStart)
    * [var declStart](#declStart)
    * [var exprEnd](#exprEnd)
    * [var unresolved](#unresolved)
    * [var errRx](#errRx)
    * [var validFiles](#validFiles)
    * [var imports](#imports)
    * [var src](#src)
    * [var valids](#valids)
    * [var validWithTParamsOnly](#validWithTParamsOnly)
    * [var invalids](#invalids)
    * [var invalidNoTParamErrs](#invalidNoTParamErrs)
    * [var invalidTParamErrs](#invalidTParamErrs)
* [Types](#type)
    * [type Mode uint](#Mode)
    * [type parser struct](#parser)
        * [func trace(p *parser, msg string) *parser](#trace)
        * [func (p *parser) init(fset *token.FileSet, filename string, src []byte, mode Mode)](#parser.init)
        * [func (p *parser) parseTypeParams() bool](#parser.parseTypeParams)
        * [func (p *parser) printTrace(a ...interface{})](#parser.printTrace)
        * [func (p *parser) next0()](#parser.next0)
        * [func (p *parser) consumeComment() (comment *ast.Comment, endline int)](#parser.consumeComment)
        * [func (p *parser) consumeCommentGroup(n int) (comments *ast.CommentGroup, endline int)](#parser.consumeCommentGroup)
        * [func (p *parser) next()](#parser.next)
        * [func (p *parser) error(pos token.Pos, msg string)](#parser.error)
        * [func (p *parser) errorExpected(pos token.Pos, msg string)](#parser.errorExpected)
        * [func (p *parser) expect(tok token.Token) token.Pos](#parser.expect)
        * [func (p *parser) expect2(tok token.Token) (pos token.Pos)](#parser.expect2)
        * [func (p *parser) expectClosing(tok token.Token, context string) token.Pos](#parser.expectClosing)
        * [func (p *parser) expectSemi()](#parser.expectSemi)
        * [func (p *parser) atComma(context string, follow token.Token) bool](#parser.atComma)
        * [func (p *parser) advance(to map[token.Token]bool)](#parser.advance)
        * [func (p *parser) safePos(pos token.Pos) (res token.Pos)](#parser.safePos)
        * [func (p *parser) parseIdent() *ast.Ident](#parser.parseIdent)
        * [func (p *parser) parseIdentList() (list []*ast.Ident)](#parser.parseIdentList)
        * [func (p *parser) parseExprList() (list []ast.Expr)](#parser.parseExprList)
        * [func (p *parser) parseList(inRhs bool) []ast.Expr](#parser.parseList)
        * [func (p *parser) parseType() ast.Expr](#parser.parseType)
        * [func (p *parser) parseQualifiedIdent(ident *ast.Ident) ast.Expr](#parser.parseQualifiedIdent)
        * [func (p *parser) parseTypeName(ident *ast.Ident) ast.Expr](#parser.parseTypeName)
        * [func (p *parser) parseArrayLen() ast.Expr](#parser.parseArrayLen)
        * [func (p *parser) parseArrayFieldOrTypeInstance(x *ast.Ident) (*ast.Ident, ast.Expr)](#parser.parseArrayFieldOrTypeInstance)
        * [func (p *parser) parseFieldDecl() *ast.Field](#parser.parseFieldDecl)
        * [func (p *parser) parseStructType() *ast.StructType](#parser.parseStructType)
        * [func (p *parser) parsePointerType() *ast.StarExpr](#parser.parsePointerType)
        * [func (p *parser) parseDotsType() *ast.Ellipsis](#parser.parseDotsType)
        * [func (p *parser) parseParamDecl(name *ast.Ident) (f field)](#parser.parseParamDecl)
        * [func (p *parser) parseParameterList(name0 *ast.Ident, closing token.Token, parseParamDecl func(*ast.Ident) field, tparams bool) (params []*ast.Field)](#parser.parseParameterList)
        * [func (p *parser) parseParameters(acceptTParams bool) (tparams, params *ast.FieldList)](#parser.parseParameters)
        * [func (p *parser) parseResult() *ast.FieldList](#parser.parseResult)
        * [func (p *parser) parseFuncType() *ast.FuncType](#parser.parseFuncType)
        * [func (p *parser) parseMethodSpec() *ast.Field](#parser.parseMethodSpec)
        * [func (p *parser) parseInterfaceType() *ast.InterfaceType](#parser.parseInterfaceType)
        * [func (p *parser) parseMapType() *ast.MapType](#parser.parseMapType)
        * [func (p *parser) parseChanType() *ast.ChanType](#parser.parseChanType)
        * [func (p *parser) parseTypeInstance(typ ast.Expr) ast.Expr](#parser.parseTypeInstance)
        * [func (p *parser) tryIdentOrType() ast.Expr](#parser.tryIdentOrType)
        * [func (p *parser) parseStmtList() (list []ast.Stmt)](#parser.parseStmtList)
        * [func (p *parser) parseBody() *ast.BlockStmt](#parser.parseBody)
        * [func (p *parser) parseBlockStmt() *ast.BlockStmt](#parser.parseBlockStmt)
        * [func (p *parser) parseFuncTypeOrLit() ast.Expr](#parser.parseFuncTypeOrLit)
        * [func (p *parser) parseOperand() ast.Expr](#parser.parseOperand)
        * [func (p *parser) parseSelector(x ast.Expr) ast.Expr](#parser.parseSelector)
        * [func (p *parser) parseTypeAssertion(x ast.Expr) ast.Expr](#parser.parseTypeAssertion)
        * [func (p *parser) parseIndexOrSliceOrInstance(x ast.Expr) ast.Expr](#parser.parseIndexOrSliceOrInstance)
        * [func (p *parser) parseCallOrConversion(fun ast.Expr) *ast.CallExpr](#parser.parseCallOrConversion)
        * [func (p *parser) parseValue() ast.Expr](#parser.parseValue)
        * [func (p *parser) parseElement() ast.Expr](#parser.parseElement)
        * [func (p *parser) parseElementList() (list []ast.Expr)](#parser.parseElementList)
        * [func (p *parser) parseLiteralValue(typ ast.Expr) ast.Expr](#parser.parseLiteralValue)
        * [func (p *parser) checkExpr(x ast.Expr) ast.Expr](#parser.checkExpr)
        * [func (p *parser) checkExprOrType(x ast.Expr) ast.Expr](#parser.checkExprOrType)
        * [func (p *parser) parsePrimaryExpr() (x ast.Expr)](#parser.parsePrimaryExpr)
        * [func (p *parser) parseUnaryExpr() ast.Expr](#parser.parseUnaryExpr)
        * [func (p *parser) tokPrec() (token.Token, int)](#parser.tokPrec)
        * [func (p *parser) parseBinaryExpr(prec1 int) ast.Expr](#parser.parseBinaryExpr)
        * [func (p *parser) parseExpr() ast.Expr](#parser.parseExpr)
        * [func (p *parser) parseRhs() ast.Expr](#parser.parseRhs)
        * [func (p *parser) parseRhsOrType() ast.Expr](#parser.parseRhsOrType)
        * [func (p *parser) parseSimpleStmt(mode int) (ast.Stmt, bool)](#parser.parseSimpleStmt)
        * [func (p *parser) checkAssignStmt(as *ast.AssignStmt)](#parser.checkAssignStmt)
        * [func (p *parser) parseCallExpr(callType string) *ast.CallExpr](#parser.parseCallExpr)
        * [func (p *parser) parseGoStmt() ast.Stmt](#parser.parseGoStmt)
        * [func (p *parser) parseDeferStmt() ast.Stmt](#parser.parseDeferStmt)
        * [func (p *parser) parseReturnStmt() *ast.ReturnStmt](#parser.parseReturnStmt)
        * [func (p *parser) parseBranchStmt(tok token.Token) *ast.BranchStmt](#parser.parseBranchStmt)
        * [func (p *parser) makeExpr(s ast.Stmt, want string) ast.Expr](#parser.makeExpr)
        * [func (p *parser) parseIfHeader() (init ast.Stmt, cond ast.Expr)](#parser.parseIfHeader)
        * [func (p *parser) parseIfStmt() *ast.IfStmt](#parser.parseIfStmt)
        * [func (p *parser) parseTypeList() (list []ast.Expr)](#parser.parseTypeList)
        * [func (p *parser) parseCaseClause(typeSwitch bool) *ast.CaseClause](#parser.parseCaseClause)
        * [func (p *parser) isTypeSwitchGuard(s ast.Stmt) bool](#parser.isTypeSwitchGuard)
        * [func (p *parser) parseSwitchStmt() ast.Stmt](#parser.parseSwitchStmt)
        * [func (p *parser) parseCommClause() *ast.CommClause](#parser.parseCommClause)
        * [func (p *parser) parseSelectStmt() *ast.SelectStmt](#parser.parseSelectStmt)
        * [func (p *parser) parseForStmt() ast.Stmt](#parser.parseForStmt)
        * [func (p *parser) parseStmt() (s ast.Stmt)](#parser.parseStmt)
        * [func (p *parser) parseImportSpec(doc *ast.CommentGroup, _ token.Pos, _ token.Token, _ int) ast.Spec](#parser.parseImportSpec)
        * [func (p *parser) parseValueSpec(doc *ast.CommentGroup, _ token.Pos, keyword token.Token, iota int) ast.Spec](#parser.parseValueSpec)
        * [func (p *parser) parseGenericType(spec *ast.TypeSpec, openPos token.Pos, name0 *ast.Ident, closeTok token.Token)](#parser.parseGenericType)
        * [func (p *parser) parseTypeSpec(doc *ast.CommentGroup, _ token.Pos, _ token.Token, _ int) ast.Spec](#parser.parseTypeSpec)
        * [func (p *parser) parseGenDecl(keyword token.Token, f parseSpecFunction) *ast.GenDecl](#parser.parseGenDecl)
        * [func (p *parser) parseFuncDecl() *ast.FuncDecl](#parser.parseFuncDecl)
        * [func (p *parser) parseDecl(sync map[token.Token]bool) ast.Decl](#parser.parseDecl)
        * [func (p *parser) parseFile() *ast.File](#parser.parseFile)
    * [type bailout struct{}](#bailout)
    * [type field struct](#field)
    * [type parseSpecFunction func(doc *go/ast.CommentGroup, pos go/token.Pos, keyword go/token.Token, iota int) go/ast.Spec](#parseSpecFunction)
    * [type resolver struct](#resolver)
        * [func (r *resolver) dump(format string, args ...interface{})](#resolver.dump)
        * [func (r *resolver) sprintf(format string, args ...interface{}) string](#resolver.sprintf)
        * [func (r *resolver) openScope(pos token.Pos)](#resolver.openScope)
        * [func (r *resolver) closeScope()](#resolver.closeScope)
        * [func (r *resolver) openLabelScope()](#resolver.openLabelScope)
        * [func (r *resolver) closeLabelScope()](#resolver.closeLabelScope)
        * [func (r *resolver) declare(decl, data interface{}, scope *ast.Scope, kind ast.ObjKind, idents ...*ast.Ident)](#resolver.declare)
        * [func (r *resolver) shortVarDecl(decl *ast.AssignStmt)](#resolver.shortVarDecl)
        * [func (r *resolver) resolve(ident *ast.Ident, collectUnresolved bool)](#resolver.resolve)
        * [func (r *resolver) walkExprs(list []ast.Expr)](#resolver.walkExprs)
        * [func (r *resolver) walkLHS(list []ast.Expr)](#resolver.walkLHS)
        * [func (r *resolver) walkStmts(list []ast.Stmt)](#resolver.walkStmts)
        * [func (r *resolver) Visit(node ast.Node) ast.Visitor](#resolver.Visit)
        * [func (r *resolver) walkFuncType(typ *ast.FuncType)](#resolver.walkFuncType)
        * [func (r *resolver) resolveList(list *ast.FieldList)](#resolver.resolveList)
        * [func (r *resolver) declareList(list *ast.FieldList, kind ast.ObjKind)](#resolver.declareList)
        * [func (r *resolver) walkFieldList(list *ast.FieldList, kind ast.ObjKind)](#resolver.walkFieldList)
        * [func (r *resolver) walkTParams(list *ast.FieldList)](#resolver.walkTParams)
        * [func (r *resolver) walkBody(body *ast.BlockStmt)](#resolver.walkBody)
* [Functions](#func)
    * [func readSource(filename string, src interface{}) ([]byte, error)](#readSource)
    * [func ParseFile(fset *token.FileSet, filename string, src interface{}, mode Mode) (f *ast.File, err error)](#ParseFile)
    * [func ParseDir(fset *token.FileSet, path string, filter func(fs.FileInfo) bool, mode Mode) (pkgs map[string]*ast.Package, first error)](#ParseDir)
    * [func ParseExprFrom(fset *token.FileSet, filename string, src interface{}, mode Mode) (expr ast.Expr, err error)](#ParseExprFrom)
    * [func ParseExpr(x string) (ast.Expr, error)](#ParseExpr)
    * [func un(p *parser)](#un)
    * [func assert(cond bool, msg string)](#assert)
    * [func unparen(x ast.Expr) ast.Expr](#unparen)
    * [func isTypeSwitchAssert(x ast.Expr) bool](#isTypeSwitchAssert)
    * [func isValidImport(lit string) bool](#isValidImport)
    * [func resolveFile(file *ast.File, handle *token.File, declErr func(token.Pos, string))](#resolveFile)
    * [func getFile(fset *token.FileSet, filename string) (file *token.File)](#getFile)
    * [func getPos(fset *token.FileSet, filename string, offset int) token.Pos](#getPos)
    * [func expectedErrors(fset *token.FileSet, filename string, src []byte) map[token.Pos]string](#expectedErrors)
    * [func compareErrors(t *testing.T, fset *token.FileSet, expected map[token.Pos]string, found scanner.ErrorList)](#compareErrors)
    * [func checkErrors(t *testing.T, filename string, input interface{}, mode Mode, expectErrors bool)](#checkErrors)
    * [func TestErrors(t *testing.T)](#TestErrors)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func nameFilter(filename string) bool](#nameFilter)
    * [func dirFilter(f fs.FileInfo) bool](#dirFilter)
    * [func TestParseFile(t *testing.T)](#TestParseFile)
    * [func TestParseExprFrom(t *testing.T)](#TestParseExprFrom)
    * [func TestParseDir(t *testing.T)](#TestParseDir)
    * [func TestIssue42951(t *testing.T)](#TestIssue42951)
    * [func TestParseExpr(t *testing.T)](#TestParseExpr)
    * [func TestColonEqualsScope(t *testing.T)](#TestColonEqualsScope)
    * [func TestVarScope(t *testing.T)](#TestVarScope)
    * [func TestObjects(t *testing.T)](#TestObjects)
    * [func TestUnresolved(t *testing.T)](#TestUnresolved)
    * [func TestImports(t *testing.T)](#TestImports)
    * [func TestCommentGroups(t *testing.T)](#TestCommentGroups)
    * [func getField(file *ast.File, fieldname string) *ast.Field](#getField)
    * [func commentText(c *ast.CommentGroup) string](#commentText)
    * [func checkFieldComments(t *testing.T, file *ast.File, fieldname, lead, line string)](#checkFieldComments)
    * [func TestLeadAndLineComments(t *testing.T)](#TestLeadAndLineComments)
    * [func TestIssue9979(t *testing.T)](#TestIssue9979)
    * [func TestIncompleteSelection(t *testing.T)](#TestIncompleteSelection)
    * [func TestLastLineComment(t *testing.T)](#TestLastLineComment)
    * [func readFile(filename string) []byte](#readFile)
    * [func BenchmarkParse(b *testing.B)](#BenchmarkParse)
    * [func BenchmarkParseOnly(b *testing.B)](#BenchmarkParseOnly)
    * [func BenchmarkResolve(b *testing.B)](#BenchmarkResolve)
    * [func TestResolution(t *testing.T)](#TestResolution)
    * [func declsFromParser(file *ast.File) map[token.Pos]token.Pos](#declsFromParser)
    * [func declsFromComments(handle *token.File, src []byte) map[token.Pos]token.Pos](#declsFromComments)
    * [func positionMarkers(handle *token.File, src []byte) (decls map[string]token.Pos, uses map[string][]token.Pos)](#positionMarkers)
    * [func annotatedObj(lit string) (name string, decl, use bool)](#annotatedObj)
    * [func TestValid(t *testing.T)](#TestValid)
    * [func TestSingle(t *testing.T)](#TestSingle)
    * [func TestInvalid(t *testing.T)](#TestInvalid)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="PackageClauseOnly" href="#PackageClauseOnly">const PackageClauseOnly</a>

```
searchKey: parser.PackageClauseOnly
tags: [exported]
```

```Go
const PackageClauseOnly Mode = 1 << iota // stop parsing after package clause

```

### <a id="ImportsOnly" href="#ImportsOnly">const ImportsOnly</a>

```
searchKey: parser.ImportsOnly
tags: [exported]
```

```Go
const ImportsOnly // stop parsing after import declarations

```

### <a id="ParseComments" href="#ParseComments">const ParseComments</a>

```
searchKey: parser.ParseComments
tags: [exported]
```

```Go
const ParseComments // parse comments and add them to AST

```

### <a id="Trace" href="#Trace">const Trace</a>

```
searchKey: parser.Trace
tags: [exported]
```

```Go
const Trace // print a trace of parsed productions

```

### <a id="DeclarationErrors" href="#DeclarationErrors">const DeclarationErrors</a>

```
searchKey: parser.DeclarationErrors
tags: [exported]
```

```Go
const DeclarationErrors // report declaration errors

```

### <a id="SpuriousErrors" href="#SpuriousErrors">const SpuriousErrors</a>

```
searchKey: parser.SpuriousErrors
tags: [exported]
```

```Go
const SpuriousErrors // same as AllErrors, for backward-compatibility

```

### <a id="SkipObjectResolution" href="#SkipObjectResolution">const SkipObjectResolution</a>

```
searchKey: parser.SkipObjectResolution
tags: [exported]
```

```Go
const SkipObjectResolution // don't resolve identifiers to objects - see ParseFile

```

### <a id="AllErrors" href="#AllErrors">const AllErrors</a>

```
searchKey: parser.AllErrors
tags: [exported]
```

```Go
const AllErrors = SpuriousErrors // report all errors (not just the first 10 on different lines)

```

### <a id="basic" href="#basic">const basic</a>

```
searchKey: parser.basic
```

```Go
const basic = iota
```

Parsing modes for parseSimpleStmt. 

### <a id="labelOk" href="#labelOk">const labelOk</a>

```
searchKey: parser.labelOk
```

```Go
const labelOk
```

Parsing modes for parseSimpleStmt. 

### <a id="rangeOk" href="#rangeOk">const rangeOk</a>

```
searchKey: parser.rangeOk
```

```Go
const rangeOk
```

Parsing modes for parseSimpleStmt. 

### <a id="debugResolve" href="#debugResolve">const debugResolve</a>

```
searchKey: parser.debugResolve
```

```Go
const debugResolve = false
```

### <a id="testdata" href="#testdata">const testdata</a>

```
searchKey: parser.testdata
```

```Go
const testdata = "testdata"
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="stmtStart" href="#stmtStart">var stmtStart</a>

```
searchKey: parser.stmtStart
```

```Go
var stmtStart = ...
```

### <a id="declStart" href="#declStart">var declStart</a>

```
searchKey: parser.declStart
```

```Go
var declStart = map[token.Token]bool{
	token.CONST: true,
	token.TYPE:  true,
	token.VAR:   true,
}
```

### <a id="exprEnd" href="#exprEnd">var exprEnd</a>

```
searchKey: parser.exprEnd
```

```Go
var exprEnd = ...
```

### <a id="unresolved" href="#unresolved">var unresolved</a>

```
searchKey: parser.unresolved
```

```Go
var unresolved = new(ast.Object)
```

The unresolved object is a sentinel to mark identifiers that have been added to the list of unresolved identifiers. The sentinel is only used for verifying internal consistency. 

### <a id="errRx" href="#errRx">var errRx</a>

```
searchKey: parser.errRx
```

```Go
var errRx = regexp.MustCompile(`^/\* *ERROR *(HERE)? *"([^"]*)" *\*/$`)
```

ERROR comments must be of the form /* ERROR "rx" */ and rx is a regular expression that matches the expected error message. The special form /* ERROR HERE "rx" */ must be used for error messages that appear immediately after a token, rather than at a token's position. 

### <a id="validFiles" href="#validFiles">var validFiles</a>

```
searchKey: parser.validFiles
```

```Go
var validFiles = []string{
	"parser.go",
	"parser_test.go",
	"error_test.go",
	"short_test.go",
}
```

### <a id="imports" href="#imports">var imports</a>

```
searchKey: parser.imports
```

```Go
var imports = ...
```

### <a id="src" href="#src">var src</a>

```
searchKey: parser.src
```

```Go
var src = readFile("parser.go")
```

TODO(rFindley): use a testdata file or file from another package here, to 

```
avoid a moving target.

```
### <a id="valids" href="#valids">var valids</a>

```
searchKey: parser.valids
```

```Go
var valids = ...
```

### <a id="validWithTParamsOnly" href="#validWithTParamsOnly">var validWithTParamsOnly</a>

```
searchKey: parser.validWithTParamsOnly
```

```Go
var validWithTParamsOnly = ...
```

validWithTParamsOnly holds source code examples that are valid if parseTypeParams is set, but invalid if not. When checking with the parseTypeParams set, errors are ignored. 

### <a id="invalids" href="#invalids">var invalids</a>

```
searchKey: parser.invalids
```

```Go
var invalids = ...
```

### <a id="invalidNoTParamErrs" href="#invalidNoTParamErrs">var invalidNoTParamErrs</a>

```
searchKey: parser.invalidNoTParamErrs
```

```Go
var invalidNoTParamErrs = ...
```

invalidNoTParamErrs holds invalid source code examples annotated with the error messages produced when ParseTypeParams is not set. 

### <a id="invalidTParamErrs" href="#invalidTParamErrs">var invalidTParamErrs</a>

```
searchKey: parser.invalidTParamErrs
```

```Go
var invalidTParamErrs = ...
```

invalidTParamErrs holds invalid source code examples annotated with the error messages produced when ParseTypeParams is set. 

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Mode" href="#Mode">type Mode uint</a>

```
searchKey: parser.Mode
tags: [exported]
```

```Go
type Mode uint
```

A Mode value is a set of flags (or 0). They control the amount of source code parsed and other optional parser functionality. 

### <a id="parser" href="#parser">type parser struct</a>

```
searchKey: parser.parser
```

```Go
type parser struct {
	file    *token.File
	errors  scanner.ErrorList
	scanner scanner.Scanner

	// Tracing/debugging
	mode   Mode // parsing mode
	trace  bool // == (mode&Trace != 0)
	indent int  // indentation used for tracing output

	// Comments
	comments    []*ast.CommentGroup
	leadComment *ast.CommentGroup // last lead comment
	lineComment *ast.CommentGroup // last line comment

	// Next token
	pos token.Pos   // token position
	tok token.Token // one token look-ahead
	lit string      // token literal

	// Error recovery
	// (used to limit the number of calls to parser.advance
	// w/o making scanning progress - avoids potential endless
	// loops across multiple parser functions during error recovery)
	syncPos token.Pos // last synchronization position
	syncCnt int       // number of parser.advance calls without progress

	// Non-syntactic parser control
	exprLev int  // < 0: in control clause, >= 0: in expression
	inRhs   bool // if set, the parser is parsing a rhs expression

	imports []*ast.ImportSpec // list of imports
}
```

The parser structure holds the parser's internal state. 

#### <a id="trace" href="#trace">func trace(p *parser, msg string) *parser</a>

```
searchKey: parser.trace
```

```Go
func trace(p *parser, msg string) *parser
```

#### <a id="parser.init" href="#parser.init">func (p *parser) init(fset *token.FileSet, filename string, src []byte, mode Mode)</a>

```
searchKey: parser.parser.init
```

```Go
func (p *parser) init(fset *token.FileSet, filename string, src []byte, mode Mode)
```

#### <a id="parser.parseTypeParams" href="#parser.parseTypeParams">func (p *parser) parseTypeParams() bool</a>

```
searchKey: parser.parser.parseTypeParams
```

```Go
func (p *parser) parseTypeParams() bool
```

#### <a id="parser.printTrace" href="#parser.printTrace">func (p *parser) printTrace(a ...interface{})</a>

```
searchKey: parser.parser.printTrace
```

```Go
func (p *parser) printTrace(a ...interface{})
```

#### <a id="parser.next0" href="#parser.next0">func (p *parser) next0()</a>

```
searchKey: parser.parser.next0
```

```Go
func (p *parser) next0()
```

Advance to the next token. 

#### <a id="parser.consumeComment" href="#parser.consumeComment">func (p *parser) consumeComment() (comment *ast.Comment, endline int)</a>

```
searchKey: parser.parser.consumeComment
```

```Go
func (p *parser) consumeComment() (comment *ast.Comment, endline int)
```

Consume a comment and return it and the line on which it ends. 

#### <a id="parser.consumeCommentGroup" href="#parser.consumeCommentGroup">func (p *parser) consumeCommentGroup(n int) (comments *ast.CommentGroup, endline int)</a>

```
searchKey: parser.parser.consumeCommentGroup
```

```Go
func (p *parser) consumeCommentGroup(n int) (comments *ast.CommentGroup, endline int)
```

Consume a group of adjacent comments, add it to the parser's comments list, and return it together with the line at which the last comment in the group ends. A non-comment token or n empty lines terminate a comment group. 

#### <a id="parser.next" href="#parser.next">func (p *parser) next()</a>

```
searchKey: parser.parser.next
```

```Go
func (p *parser) next()
```

Advance to the next non-comment token. In the process, collect any comment groups encountered, and remember the last lead and line comments. 

A lead comment is a comment group that starts and ends in a line without any other tokens and that is followed by a non-comment token on the line immediately after the comment group. 

A line comment is a comment group that follows a non-comment token on the same line, and that has no tokens after it on the line where it ends. 

Lead and line comments may be considered documentation that is stored in the AST. 

#### <a id="parser.error" href="#parser.error">func (p *parser) error(pos token.Pos, msg string)</a>

```
searchKey: parser.parser.error
```

```Go
func (p *parser) error(pos token.Pos, msg string)
```

#### <a id="parser.errorExpected" href="#parser.errorExpected">func (p *parser) errorExpected(pos token.Pos, msg string)</a>

```
searchKey: parser.parser.errorExpected
```

```Go
func (p *parser) errorExpected(pos token.Pos, msg string)
```

#### <a id="parser.expect" href="#parser.expect">func (p *parser) expect(tok token.Token) token.Pos</a>

```
searchKey: parser.parser.expect
```

```Go
func (p *parser) expect(tok token.Token) token.Pos
```

#### <a id="parser.expect2" href="#parser.expect2">func (p *parser) expect2(tok token.Token) (pos token.Pos)</a>

```
searchKey: parser.parser.expect2
```

```Go
func (p *parser) expect2(tok token.Token) (pos token.Pos)
```

expect2 is like expect, but it returns an invalid position if the expected token is not found. 

#### <a id="parser.expectClosing" href="#parser.expectClosing">func (p *parser) expectClosing(tok token.Token, context string) token.Pos</a>

```
searchKey: parser.parser.expectClosing
```

```Go
func (p *parser) expectClosing(tok token.Token, context string) token.Pos
```

expectClosing is like expect but provides a better error message for the common case of a missing comma before a newline. 

#### <a id="parser.expectSemi" href="#parser.expectSemi">func (p *parser) expectSemi()</a>

```
searchKey: parser.parser.expectSemi
```

```Go
func (p *parser) expectSemi()
```

#### <a id="parser.atComma" href="#parser.atComma">func (p *parser) atComma(context string, follow token.Token) bool</a>

```
searchKey: parser.parser.atComma
```

```Go
func (p *parser) atComma(context string, follow token.Token) bool
```

#### <a id="parser.advance" href="#parser.advance">func (p *parser) advance(to map[token.Token]bool)</a>

```
searchKey: parser.parser.advance
```

```Go
func (p *parser) advance(to map[token.Token]bool)
```

advance consumes tokens until the current token p.tok is in the 'to' set, or token.EOF. For error recovery. 

#### <a id="parser.safePos" href="#parser.safePos">func (p *parser) safePos(pos token.Pos) (res token.Pos)</a>

```
searchKey: parser.parser.safePos
```

```Go
func (p *parser) safePos(pos token.Pos) (res token.Pos)
```

safePos returns a valid file position for a given position: If pos is valid to begin with, safePos returns pos. If pos is out-of-range, safePos returns the EOF position. 

This is hack to work around "artificial" end positions in the AST which are computed by adding 1 to (presumably valid) token positions. If the token positions are invalid due to parse errors, the resulting end position may be past the file's EOF position, which would lead to panics if used later on. 

#### <a id="parser.parseIdent" href="#parser.parseIdent">func (p *parser) parseIdent() *ast.Ident</a>

```
searchKey: parser.parser.parseIdent
```

```Go
func (p *parser) parseIdent() *ast.Ident
```

#### <a id="parser.parseIdentList" href="#parser.parseIdentList">func (p *parser) parseIdentList() (list []*ast.Ident)</a>

```
searchKey: parser.parser.parseIdentList
```

```Go
func (p *parser) parseIdentList() (list []*ast.Ident)
```

#### <a id="parser.parseExprList" href="#parser.parseExprList">func (p *parser) parseExprList() (list []ast.Expr)</a>

```
searchKey: parser.parser.parseExprList
```

```Go
func (p *parser) parseExprList() (list []ast.Expr)
```

If lhs is set, result list elements which are identifiers are not resolved. 

#### <a id="parser.parseList" href="#parser.parseList">func (p *parser) parseList(inRhs bool) []ast.Expr</a>

```
searchKey: parser.parser.parseList
```

```Go
func (p *parser) parseList(inRhs bool) []ast.Expr
```

#### <a id="parser.parseType" href="#parser.parseType">func (p *parser) parseType() ast.Expr</a>

```
searchKey: parser.parser.parseType
```

```Go
func (p *parser) parseType() ast.Expr
```

#### <a id="parser.parseQualifiedIdent" href="#parser.parseQualifiedIdent">func (p *parser) parseQualifiedIdent(ident *ast.Ident) ast.Expr</a>

```
searchKey: parser.parser.parseQualifiedIdent
```

```Go
func (p *parser) parseQualifiedIdent(ident *ast.Ident) ast.Expr
```

#### <a id="parser.parseTypeName" href="#parser.parseTypeName">func (p *parser) parseTypeName(ident *ast.Ident) ast.Expr</a>

```
searchKey: parser.parser.parseTypeName
```

```Go
func (p *parser) parseTypeName(ident *ast.Ident) ast.Expr
```

If the result is an identifier, it is not resolved. 

#### <a id="parser.parseArrayLen" href="#parser.parseArrayLen">func (p *parser) parseArrayLen() ast.Expr</a>

```
searchKey: parser.parser.parseArrayLen
```

```Go
func (p *parser) parseArrayLen() ast.Expr
```

#### <a id="parser.parseArrayFieldOrTypeInstance" href="#parser.parseArrayFieldOrTypeInstance">func (p *parser) parseArrayFieldOrTypeInstance(x *ast.Ident) (*ast.Ident, ast.Expr)</a>

```
searchKey: parser.parser.parseArrayFieldOrTypeInstance
```

```Go
func (p *parser) parseArrayFieldOrTypeInstance(x *ast.Ident) (*ast.Ident, ast.Expr)
```

#### <a id="parser.parseFieldDecl" href="#parser.parseFieldDecl">func (p *parser) parseFieldDecl() *ast.Field</a>

```
searchKey: parser.parser.parseFieldDecl
```

```Go
func (p *parser) parseFieldDecl() *ast.Field
```

#### <a id="parser.parseStructType" href="#parser.parseStructType">func (p *parser) parseStructType() *ast.StructType</a>

```
searchKey: parser.parser.parseStructType
```

```Go
func (p *parser) parseStructType() *ast.StructType
```

#### <a id="parser.parsePointerType" href="#parser.parsePointerType">func (p *parser) parsePointerType() *ast.StarExpr</a>

```
searchKey: parser.parser.parsePointerType
```

```Go
func (p *parser) parsePointerType() *ast.StarExpr
```

#### <a id="parser.parseDotsType" href="#parser.parseDotsType">func (p *parser) parseDotsType() *ast.Ellipsis</a>

```
searchKey: parser.parser.parseDotsType
```

```Go
func (p *parser) parseDotsType() *ast.Ellipsis
```

#### <a id="parser.parseParamDecl" href="#parser.parseParamDecl">func (p *parser) parseParamDecl(name *ast.Ident) (f field)</a>

```
searchKey: parser.parser.parseParamDecl
```

```Go
func (p *parser) parseParamDecl(name *ast.Ident) (f field)
```

#### <a id="parser.parseParameterList" href="#parser.parseParameterList">func (p *parser) parseParameterList(name0 *ast.Ident, closing token.Token, parseParamDecl func(*ast.Ident) field, tparams bool) (params []*ast.Field)</a>

```
searchKey: parser.parser.parseParameterList
```

```Go
func (p *parser) parseParameterList(name0 *ast.Ident, closing token.Token, parseParamDecl func(*ast.Ident) field, tparams bool) (params []*ast.Field)
```

#### <a id="parser.parseParameters" href="#parser.parseParameters">func (p *parser) parseParameters(acceptTParams bool) (tparams, params *ast.FieldList)</a>

```
searchKey: parser.parser.parseParameters
```

```Go
func (p *parser) parseParameters(acceptTParams bool) (tparams, params *ast.FieldList)
```

#### <a id="parser.parseResult" href="#parser.parseResult">func (p *parser) parseResult() *ast.FieldList</a>

```
searchKey: parser.parser.parseResult
```

```Go
func (p *parser) parseResult() *ast.FieldList
```

#### <a id="parser.parseFuncType" href="#parser.parseFuncType">func (p *parser) parseFuncType() *ast.FuncType</a>

```
searchKey: parser.parser.parseFuncType
```

```Go
func (p *parser) parseFuncType() *ast.FuncType
```

#### <a id="parser.parseMethodSpec" href="#parser.parseMethodSpec">func (p *parser) parseMethodSpec() *ast.Field</a>

```
searchKey: parser.parser.parseMethodSpec
```

```Go
func (p *parser) parseMethodSpec() *ast.Field
```

#### <a id="parser.parseInterfaceType" href="#parser.parseInterfaceType">func (p *parser) parseInterfaceType() *ast.InterfaceType</a>

```
searchKey: parser.parser.parseInterfaceType
```

```Go
func (p *parser) parseInterfaceType() *ast.InterfaceType
```

#### <a id="parser.parseMapType" href="#parser.parseMapType">func (p *parser) parseMapType() *ast.MapType</a>

```
searchKey: parser.parser.parseMapType
```

```Go
func (p *parser) parseMapType() *ast.MapType
```

#### <a id="parser.parseChanType" href="#parser.parseChanType">func (p *parser) parseChanType() *ast.ChanType</a>

```
searchKey: parser.parser.parseChanType
```

```Go
func (p *parser) parseChanType() *ast.ChanType
```

#### <a id="parser.parseTypeInstance" href="#parser.parseTypeInstance">func (p *parser) parseTypeInstance(typ ast.Expr) ast.Expr</a>

```
searchKey: parser.parser.parseTypeInstance
```

```Go
func (p *parser) parseTypeInstance(typ ast.Expr) ast.Expr
```

#### <a id="parser.tryIdentOrType" href="#parser.tryIdentOrType">func (p *parser) tryIdentOrType() ast.Expr</a>

```
searchKey: parser.parser.tryIdentOrType
```

```Go
func (p *parser) tryIdentOrType() ast.Expr
```

#### <a id="parser.parseStmtList" href="#parser.parseStmtList">func (p *parser) parseStmtList() (list []ast.Stmt)</a>

```
searchKey: parser.parser.parseStmtList
```

```Go
func (p *parser) parseStmtList() (list []ast.Stmt)
```

#### <a id="parser.parseBody" href="#parser.parseBody">func (p *parser) parseBody() *ast.BlockStmt</a>

```
searchKey: parser.parser.parseBody
```

```Go
func (p *parser) parseBody() *ast.BlockStmt
```

#### <a id="parser.parseBlockStmt" href="#parser.parseBlockStmt">func (p *parser) parseBlockStmt() *ast.BlockStmt</a>

```
searchKey: parser.parser.parseBlockStmt
```

```Go
func (p *parser) parseBlockStmt() *ast.BlockStmt
```

#### <a id="parser.parseFuncTypeOrLit" href="#parser.parseFuncTypeOrLit">func (p *parser) parseFuncTypeOrLit() ast.Expr</a>

```
searchKey: parser.parser.parseFuncTypeOrLit
```

```Go
func (p *parser) parseFuncTypeOrLit() ast.Expr
```

#### <a id="parser.parseOperand" href="#parser.parseOperand">func (p *parser) parseOperand() ast.Expr</a>

```
searchKey: parser.parser.parseOperand
```

```Go
func (p *parser) parseOperand() ast.Expr
```

parseOperand may return an expression or a raw type (incl. array types of the form [...]T. Callers must verify the result. 

#### <a id="parser.parseSelector" href="#parser.parseSelector">func (p *parser) parseSelector(x ast.Expr) ast.Expr</a>

```
searchKey: parser.parser.parseSelector
```

```Go
func (p *parser) parseSelector(x ast.Expr) ast.Expr
```

#### <a id="parser.parseTypeAssertion" href="#parser.parseTypeAssertion">func (p *parser) parseTypeAssertion(x ast.Expr) ast.Expr</a>

```
searchKey: parser.parser.parseTypeAssertion
```

```Go
func (p *parser) parseTypeAssertion(x ast.Expr) ast.Expr
```

#### <a id="parser.parseIndexOrSliceOrInstance" href="#parser.parseIndexOrSliceOrInstance">func (p *parser) parseIndexOrSliceOrInstance(x ast.Expr) ast.Expr</a>

```
searchKey: parser.parser.parseIndexOrSliceOrInstance
```

```Go
func (p *parser) parseIndexOrSliceOrInstance(x ast.Expr) ast.Expr
```

#### <a id="parser.parseCallOrConversion" href="#parser.parseCallOrConversion">func (p *parser) parseCallOrConversion(fun ast.Expr) *ast.CallExpr</a>

```
searchKey: parser.parser.parseCallOrConversion
```

```Go
func (p *parser) parseCallOrConversion(fun ast.Expr) *ast.CallExpr
```

#### <a id="parser.parseValue" href="#parser.parseValue">func (p *parser) parseValue() ast.Expr</a>

```
searchKey: parser.parser.parseValue
```

```Go
func (p *parser) parseValue() ast.Expr
```

#### <a id="parser.parseElement" href="#parser.parseElement">func (p *parser) parseElement() ast.Expr</a>

```
searchKey: parser.parser.parseElement
```

```Go
func (p *parser) parseElement() ast.Expr
```

#### <a id="parser.parseElementList" href="#parser.parseElementList">func (p *parser) parseElementList() (list []ast.Expr)</a>

```
searchKey: parser.parser.parseElementList
```

```Go
func (p *parser) parseElementList() (list []ast.Expr)
```

#### <a id="parser.parseLiteralValue" href="#parser.parseLiteralValue">func (p *parser) parseLiteralValue(typ ast.Expr) ast.Expr</a>

```
searchKey: parser.parser.parseLiteralValue
```

```Go
func (p *parser) parseLiteralValue(typ ast.Expr) ast.Expr
```

#### <a id="parser.checkExpr" href="#parser.checkExpr">func (p *parser) checkExpr(x ast.Expr) ast.Expr</a>

```
searchKey: parser.parser.checkExpr
```

```Go
func (p *parser) checkExpr(x ast.Expr) ast.Expr
```

checkExpr checks that x is an expression (and not a type). 

#### <a id="parser.checkExprOrType" href="#parser.checkExprOrType">func (p *parser) checkExprOrType(x ast.Expr) ast.Expr</a>

```
searchKey: parser.parser.checkExprOrType
```

```Go
func (p *parser) checkExprOrType(x ast.Expr) ast.Expr
```

checkExprOrType checks that x is an expression or a type (and not a raw type such as [...]T). 

#### <a id="parser.parsePrimaryExpr" href="#parser.parsePrimaryExpr">func (p *parser) parsePrimaryExpr() (x ast.Expr)</a>

```
searchKey: parser.parser.parsePrimaryExpr
```

```Go
func (p *parser) parsePrimaryExpr() (x ast.Expr)
```

#### <a id="parser.parseUnaryExpr" href="#parser.parseUnaryExpr">func (p *parser) parseUnaryExpr() ast.Expr</a>

```
searchKey: parser.parser.parseUnaryExpr
```

```Go
func (p *parser) parseUnaryExpr() ast.Expr
```

#### <a id="parser.tokPrec" href="#parser.tokPrec">func (p *parser) tokPrec() (token.Token, int)</a>

```
searchKey: parser.parser.tokPrec
```

```Go
func (p *parser) tokPrec() (token.Token, int)
```

#### <a id="parser.parseBinaryExpr" href="#parser.parseBinaryExpr">func (p *parser) parseBinaryExpr(prec1 int) ast.Expr</a>

```
searchKey: parser.parser.parseBinaryExpr
```

```Go
func (p *parser) parseBinaryExpr(prec1 int) ast.Expr
```

#### <a id="parser.parseExpr" href="#parser.parseExpr">func (p *parser) parseExpr() ast.Expr</a>

```
searchKey: parser.parser.parseExpr
```

```Go
func (p *parser) parseExpr() ast.Expr
```

The result may be a type or even a raw type ([...]int). Callers must check the result (using checkExpr or checkExprOrType), depending on context. 

#### <a id="parser.parseRhs" href="#parser.parseRhs">func (p *parser) parseRhs() ast.Expr</a>

```
searchKey: parser.parser.parseRhs
```

```Go
func (p *parser) parseRhs() ast.Expr
```

#### <a id="parser.parseRhsOrType" href="#parser.parseRhsOrType">func (p *parser) parseRhsOrType() ast.Expr</a>

```
searchKey: parser.parser.parseRhsOrType
```

```Go
func (p *parser) parseRhsOrType() ast.Expr
```

#### <a id="parser.parseSimpleStmt" href="#parser.parseSimpleStmt">func (p *parser) parseSimpleStmt(mode int) (ast.Stmt, bool)</a>

```
searchKey: parser.parser.parseSimpleStmt
```

```Go
func (p *parser) parseSimpleStmt(mode int) (ast.Stmt, bool)
```

parseSimpleStmt returns true as 2nd result if it parsed the assignment of a range clause (with mode == rangeOk). The returned statement is an assignment with a right-hand side that is a single unary expression of the form "range x". No guarantees are given for the left-hand side. 

#### <a id="parser.checkAssignStmt" href="#parser.checkAssignStmt">func (p *parser) checkAssignStmt(as *ast.AssignStmt)</a>

```
searchKey: parser.parser.checkAssignStmt
```

```Go
func (p *parser) checkAssignStmt(as *ast.AssignStmt)
```

#### <a id="parser.parseCallExpr" href="#parser.parseCallExpr">func (p *parser) parseCallExpr(callType string) *ast.CallExpr</a>

```
searchKey: parser.parser.parseCallExpr
```

```Go
func (p *parser) parseCallExpr(callType string) *ast.CallExpr
```

#### <a id="parser.parseGoStmt" href="#parser.parseGoStmt">func (p *parser) parseGoStmt() ast.Stmt</a>

```
searchKey: parser.parser.parseGoStmt
```

```Go
func (p *parser) parseGoStmt() ast.Stmt
```

#### <a id="parser.parseDeferStmt" href="#parser.parseDeferStmt">func (p *parser) parseDeferStmt() ast.Stmt</a>

```
searchKey: parser.parser.parseDeferStmt
```

```Go
func (p *parser) parseDeferStmt() ast.Stmt
```

#### <a id="parser.parseReturnStmt" href="#parser.parseReturnStmt">func (p *parser) parseReturnStmt() *ast.ReturnStmt</a>

```
searchKey: parser.parser.parseReturnStmt
```

```Go
func (p *parser) parseReturnStmt() *ast.ReturnStmt
```

#### <a id="parser.parseBranchStmt" href="#parser.parseBranchStmt">func (p *parser) parseBranchStmt(tok token.Token) *ast.BranchStmt</a>

```
searchKey: parser.parser.parseBranchStmt
```

```Go
func (p *parser) parseBranchStmt(tok token.Token) *ast.BranchStmt
```

#### <a id="parser.makeExpr" href="#parser.makeExpr">func (p *parser) makeExpr(s ast.Stmt, want string) ast.Expr</a>

```
searchKey: parser.parser.makeExpr
```

```Go
func (p *parser) makeExpr(s ast.Stmt, want string) ast.Expr
```

#### <a id="parser.parseIfHeader" href="#parser.parseIfHeader">func (p *parser) parseIfHeader() (init ast.Stmt, cond ast.Expr)</a>

```
searchKey: parser.parser.parseIfHeader
```

```Go
func (p *parser) parseIfHeader() (init ast.Stmt, cond ast.Expr)
```

parseIfHeader is an adjusted version of parser.header in cmd/compile/internal/syntax/parser.go, which has been tuned for better error handling. 

#### <a id="parser.parseIfStmt" href="#parser.parseIfStmt">func (p *parser) parseIfStmt() *ast.IfStmt</a>

```
searchKey: parser.parser.parseIfStmt
```

```Go
func (p *parser) parseIfStmt() *ast.IfStmt
```

#### <a id="parser.parseTypeList" href="#parser.parseTypeList">func (p *parser) parseTypeList() (list []ast.Expr)</a>

```
searchKey: parser.parser.parseTypeList
```

```Go
func (p *parser) parseTypeList() (list []ast.Expr)
```

#### <a id="parser.parseCaseClause" href="#parser.parseCaseClause">func (p *parser) parseCaseClause(typeSwitch bool) *ast.CaseClause</a>

```
searchKey: parser.parser.parseCaseClause
```

```Go
func (p *parser) parseCaseClause(typeSwitch bool) *ast.CaseClause
```

#### <a id="parser.isTypeSwitchGuard" href="#parser.isTypeSwitchGuard">func (p *parser) isTypeSwitchGuard(s ast.Stmt) bool</a>

```
searchKey: parser.parser.isTypeSwitchGuard
```

```Go
func (p *parser) isTypeSwitchGuard(s ast.Stmt) bool
```

#### <a id="parser.parseSwitchStmt" href="#parser.parseSwitchStmt">func (p *parser) parseSwitchStmt() ast.Stmt</a>

```
searchKey: parser.parser.parseSwitchStmt
```

```Go
func (p *parser) parseSwitchStmt() ast.Stmt
```

#### <a id="parser.parseCommClause" href="#parser.parseCommClause">func (p *parser) parseCommClause() *ast.CommClause</a>

```
searchKey: parser.parser.parseCommClause
```

```Go
func (p *parser) parseCommClause() *ast.CommClause
```

#### <a id="parser.parseSelectStmt" href="#parser.parseSelectStmt">func (p *parser) parseSelectStmt() *ast.SelectStmt</a>

```
searchKey: parser.parser.parseSelectStmt
```

```Go
func (p *parser) parseSelectStmt() *ast.SelectStmt
```

#### <a id="parser.parseForStmt" href="#parser.parseForStmt">func (p *parser) parseForStmt() ast.Stmt</a>

```
searchKey: parser.parser.parseForStmt
```

```Go
func (p *parser) parseForStmt() ast.Stmt
```

#### <a id="parser.parseStmt" href="#parser.parseStmt">func (p *parser) parseStmt() (s ast.Stmt)</a>

```
searchKey: parser.parser.parseStmt
```

```Go
func (p *parser) parseStmt() (s ast.Stmt)
```

#### <a id="parser.parseImportSpec" href="#parser.parseImportSpec">func (p *parser) parseImportSpec(doc *ast.CommentGroup, _ token.Pos, _ token.Token, _ int) ast.Spec</a>

```
searchKey: parser.parser.parseImportSpec
```

```Go
func (p *parser) parseImportSpec(doc *ast.CommentGroup, _ token.Pos, _ token.Token, _ int) ast.Spec
```

#### <a id="parser.parseValueSpec" href="#parser.parseValueSpec">func (p *parser) parseValueSpec(doc *ast.CommentGroup, _ token.Pos, keyword token.Token, iota int) ast.Spec</a>

```
searchKey: parser.parser.parseValueSpec
```

```Go
func (p *parser) parseValueSpec(doc *ast.CommentGroup, _ token.Pos, keyword token.Token, iota int) ast.Spec
```

#### <a id="parser.parseGenericType" href="#parser.parseGenericType">func (p *parser) parseGenericType(spec *ast.TypeSpec, openPos token.Pos, name0 *ast.Ident, closeTok token.Token)</a>

```
searchKey: parser.parser.parseGenericType
```

```Go
func (p *parser) parseGenericType(spec *ast.TypeSpec, openPos token.Pos, name0 *ast.Ident, closeTok token.Token)
```

#### <a id="parser.parseTypeSpec" href="#parser.parseTypeSpec">func (p *parser) parseTypeSpec(doc *ast.CommentGroup, _ token.Pos, _ token.Token, _ int) ast.Spec</a>

```
searchKey: parser.parser.parseTypeSpec
```

```Go
func (p *parser) parseTypeSpec(doc *ast.CommentGroup, _ token.Pos, _ token.Token, _ int) ast.Spec
```

#### <a id="parser.parseGenDecl" href="#parser.parseGenDecl">func (p *parser) parseGenDecl(keyword token.Token, f parseSpecFunction) *ast.GenDecl</a>

```
searchKey: parser.parser.parseGenDecl
```

```Go
func (p *parser) parseGenDecl(keyword token.Token, f parseSpecFunction) *ast.GenDecl
```

#### <a id="parser.parseFuncDecl" href="#parser.parseFuncDecl">func (p *parser) parseFuncDecl() *ast.FuncDecl</a>

```
searchKey: parser.parser.parseFuncDecl
```

```Go
func (p *parser) parseFuncDecl() *ast.FuncDecl
```

#### <a id="parser.parseDecl" href="#parser.parseDecl">func (p *parser) parseDecl(sync map[token.Token]bool) ast.Decl</a>

```
searchKey: parser.parser.parseDecl
```

```Go
func (p *parser) parseDecl(sync map[token.Token]bool) ast.Decl
```

#### <a id="parser.parseFile" href="#parser.parseFile">func (p *parser) parseFile() *ast.File</a>

```
searchKey: parser.parser.parseFile
```

```Go
func (p *parser) parseFile() *ast.File
```

### <a id="bailout" href="#bailout">type bailout struct{}</a>

```
searchKey: parser.bailout
```

```Go
type bailout struct{}
```

A bailout panic is raised to indicate early termination. 

### <a id="field" href="#field">type field struct</a>

```
searchKey: parser.field
```

```Go
type field struct {
	name *ast.Ident
	typ  ast.Expr
}
```

### <a id="parseSpecFunction" href="#parseSpecFunction">type parseSpecFunction func(doc *go/ast.CommentGroup, pos go/token.Pos, keyword go/token.Token, iota int) go/ast.Spec</a>

```
searchKey: parser.parseSpecFunction
```

```Go
type parseSpecFunction func(doc *ast.CommentGroup, pos token.Pos, keyword token.Token, iota int) ast.Spec
```

### <a id="resolver" href="#resolver">type resolver struct</a>

```
searchKey: parser.resolver
```

```Go
type resolver struct {
	handle  *token.File
	declErr func(token.Pos, string)

	// Ordinary identifier scopes
	pkgScope   *ast.Scope   // pkgScope.Outer == nil
	topScope   *ast.Scope   // top-most scope; may be pkgScope
	unresolved []*ast.Ident // unresolved identifiers

	// Label scopes
	// (maintained by open/close LabelScope)
	labelScope  *ast.Scope     // label scope for current function
	targetStack [][]*ast.Ident // stack of unresolved labels
}
```

#### <a id="resolver.dump" href="#resolver.dump">func (r *resolver) dump(format string, args ...interface{})</a>

```
searchKey: parser.resolver.dump
```

```Go
func (r *resolver) dump(format string, args ...interface{})
```

#### <a id="resolver.sprintf" href="#resolver.sprintf">func (r *resolver) sprintf(format string, args ...interface{}) string</a>

```
searchKey: parser.resolver.sprintf
```

```Go
func (r *resolver) sprintf(format string, args ...interface{}) string
```

#### <a id="resolver.openScope" href="#resolver.openScope">func (r *resolver) openScope(pos token.Pos)</a>

```
searchKey: parser.resolver.openScope
```

```Go
func (r *resolver) openScope(pos token.Pos)
```

#### <a id="resolver.closeScope" href="#resolver.closeScope">func (r *resolver) closeScope()</a>

```
searchKey: parser.resolver.closeScope
```

```Go
func (r *resolver) closeScope()
```

#### <a id="resolver.openLabelScope" href="#resolver.openLabelScope">func (r *resolver) openLabelScope()</a>

```
searchKey: parser.resolver.openLabelScope
```

```Go
func (r *resolver) openLabelScope()
```

#### <a id="resolver.closeLabelScope" href="#resolver.closeLabelScope">func (r *resolver) closeLabelScope()</a>

```
searchKey: parser.resolver.closeLabelScope
```

```Go
func (r *resolver) closeLabelScope()
```

#### <a id="resolver.declare" href="#resolver.declare">func (r *resolver) declare(decl, data interface{}, scope *ast.Scope, kind ast.ObjKind, idents ...*ast.Ident)</a>

```
searchKey: parser.resolver.declare
```

```Go
func (r *resolver) declare(decl, data interface{}, scope *ast.Scope, kind ast.ObjKind, idents ...*ast.Ident)
```

#### <a id="resolver.shortVarDecl" href="#resolver.shortVarDecl">func (r *resolver) shortVarDecl(decl *ast.AssignStmt)</a>

```
searchKey: parser.resolver.shortVarDecl
```

```Go
func (r *resolver) shortVarDecl(decl *ast.AssignStmt)
```

#### <a id="resolver.resolve" href="#resolver.resolve">func (r *resolver) resolve(ident *ast.Ident, collectUnresolved bool)</a>

```
searchKey: parser.resolver.resolve
```

```Go
func (r *resolver) resolve(ident *ast.Ident, collectUnresolved bool)
```

If x is an identifier, resolve attempts to resolve x by looking up the object it denotes. If no object is found and collectUnresolved is set, x is marked as unresolved and collected in the list of unresolved identifiers. 

#### <a id="resolver.walkExprs" href="#resolver.walkExprs">func (r *resolver) walkExprs(list []ast.Expr)</a>

```
searchKey: parser.resolver.walkExprs
```

```Go
func (r *resolver) walkExprs(list []ast.Expr)
```

#### <a id="resolver.walkLHS" href="#resolver.walkLHS">func (r *resolver) walkLHS(list []ast.Expr)</a>

```
searchKey: parser.resolver.walkLHS
```

```Go
func (r *resolver) walkLHS(list []ast.Expr)
```

#### <a id="resolver.walkStmts" href="#resolver.walkStmts">func (r *resolver) walkStmts(list []ast.Stmt)</a>

```
searchKey: parser.resolver.walkStmts
```

```Go
func (r *resolver) walkStmts(list []ast.Stmt)
```

#### <a id="resolver.Visit" href="#resolver.Visit">func (r *resolver) Visit(node ast.Node) ast.Visitor</a>

```
searchKey: parser.resolver.Visit
```

```Go
func (r *resolver) Visit(node ast.Node) ast.Visitor
```

#### <a id="resolver.walkFuncType" href="#resolver.walkFuncType">func (r *resolver) walkFuncType(typ *ast.FuncType)</a>

```
searchKey: parser.resolver.walkFuncType
```

```Go
func (r *resolver) walkFuncType(typ *ast.FuncType)
```

#### <a id="resolver.resolveList" href="#resolver.resolveList">func (r *resolver) resolveList(list *ast.FieldList)</a>

```
searchKey: parser.resolver.resolveList
```

```Go
func (r *resolver) resolveList(list *ast.FieldList)
```

#### <a id="resolver.declareList" href="#resolver.declareList">func (r *resolver) declareList(list *ast.FieldList, kind ast.ObjKind)</a>

```
searchKey: parser.resolver.declareList
```

```Go
func (r *resolver) declareList(list *ast.FieldList, kind ast.ObjKind)
```

#### <a id="resolver.walkFieldList" href="#resolver.walkFieldList">func (r *resolver) walkFieldList(list *ast.FieldList, kind ast.ObjKind)</a>

```
searchKey: parser.resolver.walkFieldList
```

```Go
func (r *resolver) walkFieldList(list *ast.FieldList, kind ast.ObjKind)
```

#### <a id="resolver.walkTParams" href="#resolver.walkTParams">func (r *resolver) walkTParams(list *ast.FieldList)</a>

```
searchKey: parser.resolver.walkTParams
```

```Go
func (r *resolver) walkTParams(list *ast.FieldList)
```

walkTParams is like walkFieldList, but declares type parameters eagerly so that they may be resolved in the constraint expressions held in the field Type. 

#### <a id="resolver.walkBody" href="#resolver.walkBody">func (r *resolver) walkBody(body *ast.BlockStmt)</a>

```
searchKey: parser.resolver.walkBody
```

```Go
func (r *resolver) walkBody(body *ast.BlockStmt)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="readSource" href="#readSource">func readSource(filename string, src interface{}) ([]byte, error)</a>

```
searchKey: parser.readSource
```

```Go
func readSource(filename string, src interface{}) ([]byte, error)
```

If src != nil, readSource converts src to a []byte if possible; otherwise it returns an error. If src == nil, readSource returns the result of reading the file specified by filename. 

### <a id="ParseFile" href="#ParseFile">func ParseFile(fset *token.FileSet, filename string, src interface{}, mode Mode) (f *ast.File, err error)</a>

```
searchKey: parser.ParseFile
tags: [exported]
```

```Go
func ParseFile(fset *token.FileSet, filename string, src interface{}, mode Mode) (f *ast.File, err error)
```

ParseFile parses the source code of a single Go source file and returns the corresponding ast.File node. The source code may be provided via the filename of the source file, or via the src parameter. 

If src != nil, ParseFile parses the source from src and the filename is only used when recording position information. The type of the argument for the src parameter must be string, []byte, or io.Reader. If src == nil, ParseFile parses the file specified by filename. 

The mode parameter controls the amount of source text parsed and other optional parser functionality. If the SkipObjectResolution mode bit is set, the object resolution phase of parsing will be skipped, causing File.Scope, File.Unresolved, and all Ident.Obj fields to be nil. 

Position information is recorded in the file set fset, which must not be nil. 

If the source couldn't be read, the returned AST is nil and the error indicates the specific failure. If the source was read but syntax errors were found, the result is a partial AST (with ast.Bad* nodes representing the fragments of erroneous source code). Multiple errors are returned via a scanner.ErrorList which is sorted by source position. 

### <a id="ParseDir" href="#ParseDir">func ParseDir(fset *token.FileSet, path string, filter func(fs.FileInfo) bool, mode Mode) (pkgs map[string]*ast.Package, first error)</a>

```
searchKey: parser.ParseDir
tags: [exported]
```

```Go
func ParseDir(fset *token.FileSet, path string, filter func(fs.FileInfo) bool, mode Mode) (pkgs map[string]*ast.Package, first error)
```

ParseDir calls ParseFile for all files with names ending in ".go" in the directory specified by path and returns a map of package name -> package AST with all the packages found. 

If filter != nil, only the files with fs.FileInfo entries passing through the filter (and ending in ".go") are considered. The mode bits are passed to ParseFile unchanged. Position information is recorded in fset, which must not be nil. 

If the directory couldn't be read, a nil map and the respective error are returned. If a parse error occurred, a non-nil but incomplete map and the first error encountered are returned. 

### <a id="ParseExprFrom" href="#ParseExprFrom">func ParseExprFrom(fset *token.FileSet, filename string, src interface{}, mode Mode) (expr ast.Expr, err error)</a>

```
searchKey: parser.ParseExprFrom
tags: [exported]
```

```Go
func ParseExprFrom(fset *token.FileSet, filename string, src interface{}, mode Mode) (expr ast.Expr, err error)
```

ParseExprFrom is a convenience function for parsing an expression. The arguments have the same meaning as for ParseFile, but the source must be a valid Go (type or value) expression. Specifically, fset must not be nil. 

If the source couldn't be read, the returned AST is nil and the error indicates the specific failure. If the source was read but syntax errors were found, the result is a partial AST (with ast.Bad* nodes representing the fragments of erroneous source code). Multiple errors are returned via a scanner.ErrorList which is sorted by source position. 

### <a id="ParseExpr" href="#ParseExpr">func ParseExpr(x string) (ast.Expr, error)</a>

```
searchKey: parser.ParseExpr
tags: [exported]
```

```Go
func ParseExpr(x string) (ast.Expr, error)
```

ParseExpr is a convenience function for obtaining the AST of an expression x. The position information recorded in the AST is undefined. The filename used in error messages is the empty string. 

If syntax errors were found, the result is a partial AST (with ast.Bad* nodes representing the fragments of erroneous source code). Multiple errors are returned via a scanner.ErrorList which is sorted by source position. 

### <a id="un" href="#un">func un(p *parser)</a>

```
searchKey: parser.un
```

```Go
func un(p *parser)
```

Usage pattern: defer un(trace(p, "...")) 

### <a id="assert" href="#assert">func assert(cond bool, msg string)</a>

```
searchKey: parser.assert
```

```Go
func assert(cond bool, msg string)
```

### <a id="unparen" href="#unparen">func unparen(x ast.Expr) ast.Expr</a>

```
searchKey: parser.unparen
```

```Go
func unparen(x ast.Expr) ast.Expr
```

If x is of the form (T), unparen returns unparen(T), otherwise it returns x. 

### <a id="isTypeSwitchAssert" href="#isTypeSwitchAssert">func isTypeSwitchAssert(x ast.Expr) bool</a>

```
searchKey: parser.isTypeSwitchAssert
```

```Go
func isTypeSwitchAssert(x ast.Expr) bool
```

### <a id="isValidImport" href="#isValidImport">func isValidImport(lit string) bool</a>

```
searchKey: parser.isValidImport
```

```Go
func isValidImport(lit string) bool
```

### <a id="resolveFile" href="#resolveFile">func resolveFile(file *ast.File, handle *token.File, declErr func(token.Pos, string))</a>

```
searchKey: parser.resolveFile
```

```Go
func resolveFile(file *ast.File, handle *token.File, declErr func(token.Pos, string))
```

resolveFile walks the given file to resolve identifiers within the file scope, updating ast.Ident.Obj fields with declaration information. 

If declErr is non-nil, it is used to report declaration errors during resolution. tok is used to format position in error messages. 

### <a id="getFile" href="#getFile">func getFile(fset *token.FileSet, filename string) (file *token.File)</a>

```
searchKey: parser.getFile
```

```Go
func getFile(fset *token.FileSet, filename string) (file *token.File)
```

getFile assumes that each filename occurs at most once 

### <a id="getPos" href="#getPos">func getPos(fset *token.FileSet, filename string, offset int) token.Pos</a>

```
searchKey: parser.getPos
```

```Go
func getPos(fset *token.FileSet, filename string, offset int) token.Pos
```

### <a id="expectedErrors" href="#expectedErrors">func expectedErrors(fset *token.FileSet, filename string, src []byte) map[token.Pos]string</a>

```
searchKey: parser.expectedErrors
```

```Go
func expectedErrors(fset *token.FileSet, filename string, src []byte) map[token.Pos]string
```

expectedErrors collects the regular expressions of ERROR comments found in files and returns them as a map of error positions to error messages. 

### <a id="compareErrors" href="#compareErrors">func compareErrors(t *testing.T, fset *token.FileSet, expected map[token.Pos]string, found scanner.ErrorList)</a>

```
searchKey: parser.compareErrors
```

```Go
func compareErrors(t *testing.T, fset *token.FileSet, expected map[token.Pos]string, found scanner.ErrorList)
```

compareErrors compares the map of expected error messages with the list of found errors and reports discrepancies. 

### <a id="checkErrors" href="#checkErrors">func checkErrors(t *testing.T, filename string, input interface{}, mode Mode, expectErrors bool)</a>

```
searchKey: parser.checkErrors
```

```Go
func checkErrors(t *testing.T, filename string, input interface{}, mode Mode, expectErrors bool)
```

### <a id="TestErrors" href="#TestErrors">func TestErrors(t *testing.T)</a>

```
searchKey: parser.TestErrors
```

```Go
func TestErrors(t *testing.T)
```

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: parser.TestParse
```

```Go
func TestParse(t *testing.T)
```

### <a id="nameFilter" href="#nameFilter">func nameFilter(filename string) bool</a>

```
searchKey: parser.nameFilter
```

```Go
func nameFilter(filename string) bool
```

### <a id="dirFilter" href="#dirFilter">func dirFilter(f fs.FileInfo) bool</a>

```
searchKey: parser.dirFilter
```

```Go
func dirFilter(f fs.FileInfo) bool
```

### <a id="TestParseFile" href="#TestParseFile">func TestParseFile(t *testing.T)</a>

```
searchKey: parser.TestParseFile
```

```Go
func TestParseFile(t *testing.T)
```

### <a id="TestParseExprFrom" href="#TestParseExprFrom">func TestParseExprFrom(t *testing.T)</a>

```
searchKey: parser.TestParseExprFrom
```

```Go
func TestParseExprFrom(t *testing.T)
```

### <a id="TestParseDir" href="#TestParseDir">func TestParseDir(t *testing.T)</a>

```
searchKey: parser.TestParseDir
```

```Go
func TestParseDir(t *testing.T)
```

### <a id="TestIssue42951" href="#TestIssue42951">func TestIssue42951(t *testing.T)</a>

```
searchKey: parser.TestIssue42951
```

```Go
func TestIssue42951(t *testing.T)
```

### <a id="TestParseExpr" href="#TestParseExpr">func TestParseExpr(t *testing.T)</a>

```
searchKey: parser.TestParseExpr
```

```Go
func TestParseExpr(t *testing.T)
```

### <a id="TestColonEqualsScope" href="#TestColonEqualsScope">func TestColonEqualsScope(t *testing.T)</a>

```
searchKey: parser.TestColonEqualsScope
```

```Go
func TestColonEqualsScope(t *testing.T)
```

### <a id="TestVarScope" href="#TestVarScope">func TestVarScope(t *testing.T)</a>

```
searchKey: parser.TestVarScope
```

```Go
func TestVarScope(t *testing.T)
```

### <a id="TestObjects" href="#TestObjects">func TestObjects(t *testing.T)</a>

```
searchKey: parser.TestObjects
```

```Go
func TestObjects(t *testing.T)
```

### <a id="TestUnresolved" href="#TestUnresolved">func TestUnresolved(t *testing.T)</a>

```
searchKey: parser.TestUnresolved
```

```Go
func TestUnresolved(t *testing.T)
```

### <a id="TestImports" href="#TestImports">func TestImports(t *testing.T)</a>

```
searchKey: parser.TestImports
```

```Go
func TestImports(t *testing.T)
```

### <a id="TestCommentGroups" href="#TestCommentGroups">func TestCommentGroups(t *testing.T)</a>

```
searchKey: parser.TestCommentGroups
```

```Go
func TestCommentGroups(t *testing.T)
```

### <a id="getField" href="#getField">func getField(file *ast.File, fieldname string) *ast.Field</a>

```
searchKey: parser.getField
```

```Go
func getField(file *ast.File, fieldname string) *ast.Field
```

### <a id="commentText" href="#commentText">func commentText(c *ast.CommentGroup) string</a>

```
searchKey: parser.commentText
```

```Go
func commentText(c *ast.CommentGroup) string
```

Don't use ast.CommentGroup.Text() - we want to see exact comment text. 

### <a id="checkFieldComments" href="#checkFieldComments">func checkFieldComments(t *testing.T, file *ast.File, fieldname, lead, line string)</a>

```
searchKey: parser.checkFieldComments
```

```Go
func checkFieldComments(t *testing.T, file *ast.File, fieldname, lead, line string)
```

### <a id="TestLeadAndLineComments" href="#TestLeadAndLineComments">func TestLeadAndLineComments(t *testing.T)</a>

```
searchKey: parser.TestLeadAndLineComments
```

```Go
func TestLeadAndLineComments(t *testing.T)
```

### <a id="TestIssue9979" href="#TestIssue9979">func TestIssue9979(t *testing.T)</a>

```
searchKey: parser.TestIssue9979
```

```Go
func TestIssue9979(t *testing.T)
```

TestIssue9979 verifies that empty statements are contained within their enclosing blocks. 

### <a id="TestIncompleteSelection" href="#TestIncompleteSelection">func TestIncompleteSelection(t *testing.T)</a>

```
searchKey: parser.TestIncompleteSelection
```

```Go
func TestIncompleteSelection(t *testing.T)
```

TestIncompleteSelection ensures that an incomplete selector expression is parsed as a (blank) *ast.SelectorExpr, not a *ast.BadExpr. 

### <a id="TestLastLineComment" href="#TestLastLineComment">func TestLastLineComment(t *testing.T)</a>

```
searchKey: parser.TestLastLineComment
```

```Go
func TestLastLineComment(t *testing.T)
```

### <a id="readFile" href="#readFile">func readFile(filename string) []byte</a>

```
searchKey: parser.readFile
```

```Go
func readFile(filename string) []byte
```

### <a id="BenchmarkParse" href="#BenchmarkParse">func BenchmarkParse(b *testing.B)</a>

```
searchKey: parser.BenchmarkParse
```

```Go
func BenchmarkParse(b *testing.B)
```

### <a id="BenchmarkParseOnly" href="#BenchmarkParseOnly">func BenchmarkParseOnly(b *testing.B)</a>

```
searchKey: parser.BenchmarkParseOnly
```

```Go
func BenchmarkParseOnly(b *testing.B)
```

### <a id="BenchmarkResolve" href="#BenchmarkResolve">func BenchmarkResolve(b *testing.B)</a>

```
searchKey: parser.BenchmarkResolve
```

```Go
func BenchmarkResolve(b *testing.B)
```

### <a id="TestResolution" href="#TestResolution">func TestResolution(t *testing.T)</a>

```
searchKey: parser.TestResolution
```

```Go
func TestResolution(t *testing.T)
```

TestResolution checks that identifiers are resolved to the declarations annotated in the source, by comparing the positions of the resulting Ident.Obj.Decl to positions marked in the source via special comments. 

In the test source, any comment prefixed with '=' or '@' (or both) marks the previous token position as the declaration ('=') or a use ('@') of an identifier. The text following '=' and '@' in the comment string is the label to use for the location.  Declaration labels must be unique within the file, and use labels must refer to an existing declaration label. It's OK for a comment to denote both the declaration and use of a label (e.g. '=@foo'). Leading and trailing whitespace is ignored. Any comment not beginning with '=' or '@' is ignored. 

### <a id="declsFromParser" href="#declsFromParser">func declsFromParser(file *ast.File) map[token.Pos]token.Pos</a>

```
searchKey: parser.declsFromParser
```

```Go
func declsFromParser(file *ast.File) map[token.Pos]token.Pos
```

declsFromParser walks the file and collects the map associating an identifier position with its declaration position. 

### <a id="declsFromComments" href="#declsFromComments">func declsFromComments(handle *token.File, src []byte) map[token.Pos]token.Pos</a>

```
searchKey: parser.declsFromComments
```

```Go
func declsFromComments(handle *token.File, src []byte) map[token.Pos]token.Pos
```

declsFromComments looks at comments annotating uses and declarations, and maps each identifier use to its corresponding declaration. See the description of these annotations in the documentation for TestResolution. 

### <a id="positionMarkers" href="#positionMarkers">func positionMarkers(handle *token.File, src []byte) (decls map[string]token.Pos, uses map[string][]token.Pos)</a>

```
searchKey: parser.positionMarkers
```

```Go
func positionMarkers(handle *token.File, src []byte) (decls map[string]token.Pos, uses map[string][]token.Pos)
```

positionMarkers extracts named positions from the source denoted by comments prefixed with '=' (declarations) and '@' (uses): for example '@foo' or '=@bar'. It returns a map of name->position for declarations, and name->position(s) for uses. 

### <a id="annotatedObj" href="#annotatedObj">func annotatedObj(lit string) (name string, decl, use bool)</a>

```
searchKey: parser.annotatedObj
```

```Go
func annotatedObj(lit string) (name string, decl, use bool)
```

### <a id="TestValid" href="#TestValid">func TestValid(t *testing.T)</a>

```
searchKey: parser.TestValid
```

```Go
func TestValid(t *testing.T)
```

### <a id="TestSingle" href="#TestSingle">func TestSingle(t *testing.T)</a>

```
searchKey: parser.TestSingle
```

```Go
func TestSingle(t *testing.T)
```

TestSingle is useful to track down a problem with a single short test program. 

### <a id="TestInvalid" href="#TestInvalid">func TestInvalid(t *testing.T)</a>

```
searchKey: parser.TestInvalid
```

```Go
func TestInvalid(t *testing.T)
```

