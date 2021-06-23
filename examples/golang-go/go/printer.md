# Package printer

Package printer implements printing of AST nodes. 

## Index

* [Constants](#const)
    * [const commaTerm](#commaTerm)
    * [const noIndent](#noIndent)
    * [const filteredMsg](#filteredMsg)
    * [const maxNewlines](#maxNewlines)
    * [const debug](#debug)
    * [const infinity](#infinity)
    * [const ignore](#ignore)
    * [const blank](#blank)
    * [const vtab](#vtab)
    * [const newline](#newline)
    * [const formfeed](#formfeed)
    * [const indent](#indent)
    * [const unindent](#unindent)
    * [const noExtraBlank](#noExtraBlank)
    * [const noExtraLinebreak](#noExtraLinebreak)
    * [const inSpace](#inSpace)
    * [const inEscape](#inEscape)
    * [const inText](#inText)
    * [const RawFormat](#RawFormat)
    * [const TabIndent](#TabIndent)
    * [const UseSpaces](#UseSpaces)
    * [const SourcePos](#SourcePos)
    * [const normalizeNumbers](#normalizeNumbers)
    * [const dataDir](#dataDir)
    * [const tabwidth](#tabwidth)
    * [const export](#export)
    * [const rawFormat](#rawFormat)
    * [const normNumber](#normNumber)
    * [const idempotent](#idempotent)
    * [const allowTypeParams](#allowTypeParams)
* [Variables](#var)
    * [var aNewline](#aNewline)
    * [var testfile](#testfile)
    * [var update](#update)
    * [var fset](#fset)
    * [var data](#data)
    * [var decls](#decls)
    * [var stmts](#stmts)
* [Types](#type)
    * [type exprListMode uint](#exprListMode)
    * [type whiteSpace byte](#whiteSpace)
    * [type pmode int](#pmode)
    * [type commentInfo struct](#commentInfo)
    * [type printer struct](#printer)
        * [func (p *printer) fixGoBuildLines()](#printer.fixGoBuildLines)
        * [func (p *printer) lineAt(start int) []byte](#printer.lineAt)
        * [func (p *printer) commentTextAt(start int) string](#printer.commentTextAt)
        * [func (p *printer) linebreak(line, min int, ws whiteSpace, newSection bool) (nbreaks int)](#printer.linebreak)
        * [func (p *printer) setComment(g *ast.CommentGroup)](#printer.setComment)
        * [func (p *printer) identList(list []*ast.Ident, indent bool)](#printer.identList)
        * [func (p *printer) exprList(prev0 token.Pos, list []ast.Expr, depth int, mode exprListMode, next0 token.Pos, isIncomplete bool)](#printer.exprList)
        * [func (p *printer) parameters(fields *ast.FieldList, isTypeParam bool)](#printer.parameters)
        * [func (p *printer) signature(sig *ast.FuncType)](#printer.signature)
        * [func (p *printer) isOneLineFieldList(list []*ast.Field) bool](#printer.isOneLineFieldList)
        * [func (p *printer) setLineComment(text string)](#printer.setLineComment)
        * [func (p *printer) fieldList(fields *ast.FieldList, isStruct, isIncomplete bool)](#printer.fieldList)
        * [func (p *printer) binaryExpr(x *ast.BinaryExpr, prec1, cutoff, depth int)](#printer.binaryExpr)
        * [func (p *printer) expr1(expr ast.Expr, prec1, depth int)](#printer.expr1)
        * [func (p *printer) possibleSelectorExpr(expr ast.Expr, prec1, depth int) bool](#printer.possibleSelectorExpr)
        * [func (p *printer) selectorExpr(x *ast.SelectorExpr, depth int, isMethod bool) bool](#printer.selectorExpr)
        * [func (p *printer) expr0(x ast.Expr, depth int)](#printer.expr0)
        * [func (p *printer) expr(x ast.Expr)](#printer.expr)
        * [func (p *printer) stmtList(list []ast.Stmt, nindent int, nextIsRBrace bool)](#printer.stmtList)
        * [func (p *printer) block(b *ast.BlockStmt, nindent int)](#printer.block)
        * [func (p *printer) controlClause(isForStmt bool, init ast.Stmt, expr ast.Expr, post ast.Stmt)](#printer.controlClause)
        * [func (p *printer) indentList(list []ast.Expr) bool](#printer.indentList)
        * [func (p *printer) stmt(stmt ast.Stmt, nextIsRBrace bool)](#printer.stmt)
        * [func (p *printer) valueSpec(s *ast.ValueSpec, keepType bool)](#printer.valueSpec)
        * [func (p *printer) spec(spec ast.Spec, n int, doIndent bool)](#printer.spec)
        * [func (p *printer) genDecl(d *ast.GenDecl)](#printer.genDecl)
        * [func (p *printer) nodeSize(n ast.Node, maxSize int) (size int)](#printer.nodeSize)
        * [func (p *printer) numLines(n ast.Node) int](#printer.numLines)
        * [func (p *printer) bodySize(b *ast.BlockStmt, maxSize int) int](#printer.bodySize)
        * [func (p *printer) funcBody(headerSize int, sep whiteSpace, b *ast.BlockStmt)](#printer.funcBody)
        * [func (p *printer) distanceFrom(startPos token.Pos, startOutCol int) int](#printer.distanceFrom)
        * [func (p *printer) funcDecl(d *ast.FuncDecl)](#printer.funcDecl)
        * [func (p *printer) decl(decl ast.Decl)](#printer.decl)
        * [func (p *printer) declList(list []ast.Decl)](#printer.declList)
        * [func (p *printer) file(src *ast.File)](#printer.file)
        * [func (p *printer) init(cfg *Config, fset *token.FileSet, nodeSizes map[ast.Node]int)](#printer.init.printer.go)
        * [func (p *printer) internalError(msg ...interface{})](#printer.internalError)
        * [func (p *printer) commentsHaveNewline(list []*ast.Comment) bool](#printer.commentsHaveNewline)
        * [func (p *printer) nextComment()](#printer.nextComment)
        * [func (p *printer) commentBefore(next token.Position) bool](#printer.commentBefore)
        * [func (p *printer) commentSizeBefore(next token.Position) int](#printer.commentSizeBefore)
        * [func (p *printer) recordLine(linePtr *int)](#printer.recordLine)
        * [func (p *printer) linesFrom(line int) int](#printer.linesFrom)
        * [func (p *printer) posFor(pos token.Pos) token.Position](#printer.posFor)
        * [func (p *printer) lineFor(pos token.Pos) int](#printer.lineFor)
        * [func (p *printer) writeLineDirective(pos token.Position)](#printer.writeLineDirective)
        * [func (p *printer) writeIndent()](#printer.writeIndent)
        * [func (p *printer) writeByte(ch byte, n int)](#printer.writeByte)
        * [func (p *printer) writeString(pos token.Position, s string, isLit bool)](#printer.writeString)
        * [func (p *printer) writeCommentPrefix(pos, next token.Position, prev *ast.Comment, tok token.Token)](#printer.writeCommentPrefix)
        * [func (p *printer) writeComment(comment *ast.Comment)](#printer.writeComment)
        * [func (p *printer) writeCommentSuffix(needsLinebreak bool) (wroteNewline, droppedFF bool)](#printer.writeCommentSuffix)
        * [func (p *printer) containsLinebreak() bool](#printer.containsLinebreak)
        * [func (p *printer) intersperseComments(next token.Position, tok token.Token) (wroteNewline, droppedFF bool)](#printer.intersperseComments)
        * [func (p *printer) writeWhitespace(n int)](#printer.writeWhitespace)
        * [func (p *printer) print(args ...interface{})](#printer.print)
        * [func (p *printer) flush(next token.Position, tok token.Token) (wroteNewline, droppedFF bool)](#printer.flush)
        * [func (p *printer) printNode(node interface{}) error](#printer.printNode)
    * [type trimmer struct](#trimmer)
        * [func (p *trimmer) resetSpace()](#trimmer.resetSpace)
        * [func (p *trimmer) Write(data []byte) (n int, err error)](#trimmer.Write)
    * [type Mode uint](#Mode)
    * [type Config struct](#Config)
        * [func (cfg *Config) fprint(output io.Writer, fset *token.FileSet, node interface{}, nodeSizes map[ast.Node]int) (err error)](#Config.fprint)
        * [func (cfg *Config) Fprint(output io.Writer, fset *token.FileSet, node interface{}) error](#Config.Fprint)
    * [type CommentedNode struct](#CommentedNode)
    * [type checkMode uint](#checkMode)
    * [type entry struct](#entry)
    * [type visitor chan *ast.Ident](#visitor)
        * [func (v visitor) Visit(n ast.Node) (w ast.Visitor)](#visitor.Visit)
    * [type limitWriter struct](#limitWriter)
        * [func (l *limitWriter) Write(buf []byte) (n int, err error)](#limitWriter.Write)
* [Functions](#func)
    * [func appendLines(x, y []byte) []byte](#appendLines)
    * [func isNL(b byte) bool](#isNL)
    * [func identListSize(list []*ast.Ident, maxSize int) (size int)](#identListSize)
    * [func walkBinary(e *ast.BinaryExpr) (has4, has5 bool, maxProblem int)](#walkBinary)
    * [func cutoff(e *ast.BinaryExpr, depth int) int](#cutoff)
    * [func diffPrec(expr ast.Expr, prec int) int](#diffPrec)
    * [func reduceDepth(depth int) int](#reduceDepth)
    * [func isBinary(expr ast.Expr) bool](#isBinary)
    * [func normalizedNumber(lit *ast.BasicLit) *ast.BasicLit](#normalizedNumber)
    * [func isTypeName(x ast.Expr) bool](#isTypeName)
    * [func stripParens(x ast.Expr) ast.Expr](#stripParens)
    * [func stripParensAlways(x ast.Expr) ast.Expr](#stripParensAlways)
    * [func keepTypeColumn(specs []ast.Spec) []bool](#keepTypeColumn)
    * [func sanitizeImportPath(lit *ast.BasicLit) *ast.BasicLit](#sanitizeImportPath)
    * [func declToken(decl ast.Decl) (tok token.Token)](#declToken)
    * [func isBlank(s string) bool](#isBlank)
    * [func commonPrefix(a, b string) string](#commonPrefix)
    * [func trimRight(s string) string](#trimRight)
    * [func stripCommonPrefix(lines []string)](#stripCommonPrefix)
    * [func nlimit(n int) int](#nlimit)
    * [func mayCombine(prev token.Token, next byte) (b bool)](#mayCombine)
    * [func getDoc(n ast.Node) *ast.CommentGroup](#getDoc)
    * [func getLastComment(n ast.Node) *ast.CommentGroup](#getLastComment)
    * [func Fprint(output io.Writer, fset *token.FileSet, node interface{}) error](#Fprint)
    * [func testprint(out io.Writer, file *ast.File)](#testprint)
    * [func initialize()](#initialize)
    * [func BenchmarkPrint(b *testing.B)](#BenchmarkPrint)
    * [func format(src []byte, mode checkMode) ([]byte, error)](#format)
    * [func lineAt(text []byte, offs int) []byte](#lineAt)
    * [func diff(aname, bname string, a, b []byte) error](#diff)
    * [func runcheck(t *testing.T, source, golden string, mode checkMode)](#runcheck)
    * [func check(t *testing.T, source, golden string, mode checkMode)](#check)
    * [func TestFiles(t *testing.T)](#TestFiles)
    * [func TestLineComments(t *testing.T)](#TestLineComments)
    * [func init()](#init.printer_test.go)
    * [func TestBadNodes(t *testing.T)](#TestBadNodes)
    * [func testComment(t *testing.T, f *ast.File, srclen int, comment *ast.Comment)](#testComment)
    * [func TestBadComments(t *testing.T)](#TestBadComments)
    * [func idents(f *ast.File) <-chan *ast.Ident](#idents)
    * [func identCount(f *ast.File) int](#identCount)
    * [func TestSourcePos(t *testing.T)](#TestSourcePos)
    * [func TestIssue5945(t *testing.T)](#TestIssue5945)
    * [func TestDeclLists(t *testing.T)](#TestDeclLists)
    * [func TestStmtLists(t *testing.T)](#TestStmtLists)
    * [func TestBaseIndent(t *testing.T)](#TestBaseIndent)
    * [func TestFuncType(t *testing.T)](#TestFuncType)
    * [func TestWriteErrors(t *testing.T)](#TestWriteErrors)
    * [func TestX(t *testing.T)](#TestX)
    * [func TestCommentedNode(t *testing.T)](#TestCommentedNode)
    * [func TestIssue11151(t *testing.T)](#TestIssue11151)
    * [func TestParenthesizedDecl(t *testing.T)](#TestParenthesizedDecl)
    * [func TestIssue32854(t *testing.T)](#TestIssue32854)


## <a id="const" href="#const">Constants</a>

### <a id="commaTerm" href="#commaTerm">const commaTerm</a>

```
searchKey: printer.commaTerm
tags: [private]
```

```Go
const commaTerm exprListMode = 1 << iota // list is optionally terminated by a comma

```

### <a id="noIndent" href="#noIndent">const noIndent</a>

```
searchKey: printer.noIndent
tags: [private]
```

```Go
const noIndent // no extra indentation in multi-line lists

```

### <a id="filteredMsg" href="#filteredMsg">const filteredMsg</a>

```
searchKey: printer.filteredMsg
tags: [private]
```

```Go
const filteredMsg = "contains filtered or unexported fields"
```

### <a id="maxNewlines" href="#maxNewlines">const maxNewlines</a>

```
searchKey: printer.maxNewlines
tags: [private]
```

```Go
const maxNewlines = 2 // max. number of newlines between source text

```

### <a id="debug" href="#debug">const debug</a>

```
searchKey: printer.debug
tags: [private]
```

```Go
const debug = false // enable for debugging

```

### <a id="infinity" href="#infinity">const infinity</a>

```
searchKey: printer.infinity
tags: [private]
```

```Go
const infinity = 1 << 30
```

### <a id="ignore" href="#ignore">const ignore</a>

```
searchKey: printer.ignore
tags: [private]
```

```Go
const ignore = whiteSpace(0)
```

### <a id="blank" href="#blank">const blank</a>

```
searchKey: printer.blank
tags: [private]
```

```Go
const blank = whiteSpace(' ')
```

### <a id="vtab" href="#vtab">const vtab</a>

```
searchKey: printer.vtab
tags: [private]
```

```Go
const vtab = whiteSpace('\v')
```

### <a id="newline" href="#newline">const newline</a>

```
searchKey: printer.newline
tags: [private]
```

```Go
const newline = whiteSpace('\n')
```

### <a id="formfeed" href="#formfeed">const formfeed</a>

```
searchKey: printer.formfeed
tags: [private]
```

```Go
const formfeed = whiteSpace('\f')
```

### <a id="indent" href="#indent">const indent</a>

```
searchKey: printer.indent
tags: [private]
```

```Go
const indent = whiteSpace('>')
```

### <a id="unindent" href="#unindent">const unindent</a>

```
searchKey: printer.unindent
tags: [private]
```

```Go
const unindent = whiteSpace('<')
```

### <a id="noExtraBlank" href="#noExtraBlank">const noExtraBlank</a>

```
searchKey: printer.noExtraBlank
tags: [private]
```

```Go
const noExtraBlank pmode = 1 << iota // disables extra blank after /*-style comment

```

### <a id="noExtraLinebreak" href="#noExtraLinebreak">const noExtraLinebreak</a>

```
searchKey: printer.noExtraLinebreak
tags: [private]
```

```Go
const noExtraLinebreak // disables extra line break after /*-style comment

```

### <a id="inSpace" href="#inSpace">const inSpace</a>

```
searchKey: printer.inSpace
tags: [private]
```

```Go
const inSpace = iota // inside space

```

trimmer is implemented as a state machine. It can be in one of the following states: 

### <a id="inEscape" href="#inEscape">const inEscape</a>

```
searchKey: printer.inEscape
tags: [private]
```

```Go
const inEscape // inside text bracketed by tabwriter.Escapes

```

trimmer is implemented as a state machine. It can be in one of the following states: 

### <a id="inText" href="#inText">const inText</a>

```
searchKey: printer.inText
tags: [private]
```

```Go
const inText // inside text

```

trimmer is implemented as a state machine. It can be in one of the following states: 

### <a id="RawFormat" href="#RawFormat">const RawFormat</a>

```
searchKey: printer.RawFormat
```

```Go
const RawFormat Mode = 1 << iota // do not use a tabwriter; if set, UseSpaces is ignored

```

### <a id="TabIndent" href="#TabIndent">const TabIndent</a>

```
searchKey: printer.TabIndent
```

```Go
const TabIndent // use tabs for indentation independent of UseSpaces

```

### <a id="UseSpaces" href="#UseSpaces">const UseSpaces</a>

```
searchKey: printer.UseSpaces
```

```Go
const UseSpaces // use spaces instead of tabs for alignment

```

### <a id="SourcePos" href="#SourcePos">const SourcePos</a>

```
searchKey: printer.SourcePos
```

```Go
const SourcePos // emit //line directives to preserve original source positions

```

### <a id="normalizeNumbers" href="#normalizeNumbers">const normalizeNumbers</a>

```
searchKey: printer.normalizeNumbers
tags: [private]
```

```Go
const normalizeNumbers Mode = 1 << 30
```

The mode below is not included in printer's public API because editing code text is deemed out of scope. Because this mode is unexported, it's also possible to modify or remove it based on the evolving needs of go/format and cmd/gofmt without breaking users. See discussion in CL 240683. 

normalizeNumbers means to canonicalize number literal prefixes and exponents while printing. 

This value is known in and used by go/format and cmd/gofmt. It is currently more convenient and performant for those packages to apply number normalization during printing, rather than by modifying the AST in advance. 

### <a id="dataDir" href="#dataDir">const dataDir</a>

```
searchKey: printer.dataDir
tags: [private]
```

```Go
const dataDir = "testdata"
```

### <a id="tabwidth" href="#tabwidth">const tabwidth</a>

```
searchKey: printer.tabwidth
tags: [private]
```

```Go
const tabwidth = 8
```

### <a id="export" href="#export">const export</a>

```
searchKey: printer.export
tags: [private]
```

```Go
const export checkMode = 1 << iota
```

### <a id="rawFormat" href="#rawFormat">const rawFormat</a>

```
searchKey: printer.rawFormat
tags: [private]
```

```Go
const rawFormat
```

### <a id="normNumber" href="#normNumber">const normNumber</a>

```
searchKey: printer.normNumber
tags: [private]
```

```Go
const normNumber
```

### <a id="idempotent" href="#idempotent">const idempotent</a>

```
searchKey: printer.idempotent
tags: [private]
```

```Go
const idempotent
```

### <a id="allowTypeParams" href="#allowTypeParams">const allowTypeParams</a>

```
searchKey: printer.allowTypeParams
tags: [private]
```

```Go
const allowTypeParams
```

## <a id="var" href="#var">Variables</a>

### <a id="aNewline" href="#aNewline">var aNewline</a>

```
searchKey: printer.aNewline
tags: [private]
```

```Go
var aNewline = []byte("\n")
```

### <a id="testfile" href="#testfile">var testfile</a>

```
searchKey: printer.testfile
tags: [private]
```

```Go
var testfile *ast.File
```

### <a id="update" href="#update">var update</a>

```
searchKey: printer.update
tags: [private]
```

```Go
var update = flag.Bool("update", false, "update golden files")
```

### <a id="fset" href="#fset">var fset</a>

```
searchKey: printer.fset
tags: [private]
```

```Go
var fset = token.NewFileSet()
```

### <a id="data" href="#data">var data</a>

```
searchKey: printer.data
tags: [private]
```

```Go
var data = ...
```

Use go test -update to create/update the respective golden files. 

### <a id="decls" href="#decls">var decls</a>

```
searchKey: printer.decls
tags: [private]
```

```Go
var decls = ...
```

### <a id="stmts" href="#stmts">var stmts</a>

```
searchKey: printer.stmts
tags: [private]
```

```Go
var stmts = ...
```

## <a id="type" href="#type">Types</a>

### <a id="exprListMode" href="#exprListMode">type exprListMode uint</a>

```
searchKey: printer.exprListMode
tags: [private]
```

```Go
type exprListMode uint
```

### <a id="whiteSpace" href="#whiteSpace">type whiteSpace byte</a>

```
searchKey: printer.whiteSpace
tags: [private]
```

```Go
type whiteSpace byte
```

### <a id="pmode" href="#pmode">type pmode int</a>

```
searchKey: printer.pmode
tags: [private]
```

```Go
type pmode int
```

A pmode value represents the current printer mode. 

### <a id="commentInfo" href="#commentInfo">type commentInfo struct</a>

```
searchKey: printer.commentInfo
tags: [private]
```

```Go
type commentInfo struct {
	cindex         int               // current comment index
	comment        *ast.CommentGroup // = printer.comments[cindex]; or nil
	commentOffset  int               // = printer.posFor(printer.comments[cindex].List[0].Pos()).Offset; or infinity
	commentNewline bool              // true if the comment group contains newlines
}
```

### <a id="printer" href="#printer">type printer struct</a>

```
searchKey: printer.printer
tags: [private]
```

```Go
type printer struct {
	// Configuration (does not change after initialization)
	Config
	fset *token.FileSet

	// Current state
	output       []byte       // raw printer result
	indent       int          // current indentation
	level        int          // level == 0: outside composite literal; level > 0: inside composite literal
	mode         pmode        // current printer mode
	endAlignment bool         // if set, terminate alignment immediately
	impliedSemi  bool         // if set, a linebreak implies a semicolon
	lastTok      token.Token  // last token printed (token.ILLEGAL if it's whitespace)
	prevOpen     token.Token  // previous non-brace "open" token (, [, or token.ILLEGAL
	wsbuf        []whiteSpace // delayed white space
	goBuild      []int        // start index of all //go:build comments in output
	plusBuild    []int        // start index of all // +build comments in output

	// Positions
	// The out position differs from the pos position when the result
	// formatting differs from the source formatting (in the amount of
	// white space). If there's a difference and SourcePos is set in
	// ConfigMode, //line directives are used in the output to restore
	// original source positions for a reader.
	pos     token.Position // current position in AST (source) space
	out     token.Position // current position in output space
	last    token.Position // value of pos after calling writeString
	linePtr *int           // if set, record out.Line for the next token in *linePtr

	// The list of all source comments, in order of appearance.
	comments        []*ast.CommentGroup // may be nil
	useNodeComments bool                // if not set, ignore lead and line comments of nodes

	// Information about p.comments[p.cindex]; set up by nextComment.
	commentInfo

	// Cache of already computed node sizes.
	nodeSizes map[ast.Node]int

	// Cache of most recently computed line position.
	cachedPos  token.Pos
	cachedLine int // line corresponding to cachedPos
}
```

#### <a id="printer.fixGoBuildLines" href="#printer.fixGoBuildLines">func (p *printer) fixGoBuildLines()</a>

```
searchKey: printer.printer.fixGoBuildLines
tags: [private]
```

```Go
func (p *printer) fixGoBuildLines()
```

#### <a id="printer.lineAt" href="#printer.lineAt">func (p *printer) lineAt(start int) []byte</a>

```
searchKey: printer.printer.lineAt
tags: [private]
```

```Go
func (p *printer) lineAt(start int) []byte
```

#### <a id="printer.commentTextAt" href="#printer.commentTextAt">func (p *printer) commentTextAt(start int) string</a>

```
searchKey: printer.printer.commentTextAt
tags: [private]
```

```Go
func (p *printer) commentTextAt(start int) string
```

#### <a id="printer.linebreak" href="#printer.linebreak">func (p *printer) linebreak(line, min int, ws whiteSpace, newSection bool) (nbreaks int)</a>

```
searchKey: printer.printer.linebreak
tags: [private]
```

```Go
func (p *printer) linebreak(line, min int, ws whiteSpace, newSection bool) (nbreaks int)
```

Print as many newlines as necessary (but at least min newlines) to get to the current line. ws is printed before the first line break. If newSection is set, the first line break is printed as formfeed. Returns 0 if no line breaks were printed, returns 1 if there was exactly one newline printed, and returns a value > 1 if there was a formfeed or more than one newline printed. 

TODO(gri): linebreak may add too many lines if the next statement at "line" 

```
is preceded by comments because the computation of n assumes
the current position before the comment and the target position
after the comment. Thus, after interspersing such comments, the
space taken up by them is not considered to reduce the number of
linebreaks. At the moment there is no easy way to know about
future (not yet interspersed) comments in this function.

```
#### <a id="printer.setComment" href="#printer.setComment">func (p *printer) setComment(g *ast.CommentGroup)</a>

```
searchKey: printer.printer.setComment
tags: [private]
```

```Go
func (p *printer) setComment(g *ast.CommentGroup)
```

setComment sets g as the next comment if g != nil and if node comments are enabled - this mode is used when printing source code fragments such as exports only. It assumes that there is no pending comment in p.comments and at most one pending comment in the p.comment cache. 

#### <a id="printer.identList" href="#printer.identList">func (p *printer) identList(list []*ast.Ident, indent bool)</a>

```
searchKey: printer.printer.identList
tags: [private]
```

```Go
func (p *printer) identList(list []*ast.Ident, indent bool)
```

If indent is set, a multi-line identifier list is indented after the first linebreak encountered. 

#### <a id="printer.exprList" href="#printer.exprList">func (p *printer) exprList(prev0 token.Pos, list []ast.Expr, depth int, mode exprListMode, next0 token.Pos, isIncomplete bool)</a>

```
searchKey: printer.printer.exprList
tags: [private]
```

```Go
func (p *printer) exprList(prev0 token.Pos, list []ast.Expr, depth int, mode exprListMode, next0 token.Pos, isIncomplete bool)
```

Print a list of expressions. If the list spans multiple source lines, the original line breaks are respected between expressions. 

TODO(gri) Consider rewriting this to be independent of []ast.Expr 

```
so that we can use the algorithm for any kind of list
(e.g., pass list via a channel over which to range).

```
#### <a id="printer.parameters" href="#printer.parameters">func (p *printer) parameters(fields *ast.FieldList, isTypeParam bool)</a>

```
searchKey: printer.printer.parameters
tags: [private]
```

```Go
func (p *printer) parameters(fields *ast.FieldList, isTypeParam bool)
```

#### <a id="printer.signature" href="#printer.signature">func (p *printer) signature(sig *ast.FuncType)</a>

```
searchKey: printer.printer.signature
tags: [private]
```

```Go
func (p *printer) signature(sig *ast.FuncType)
```

#### <a id="printer.isOneLineFieldList" href="#printer.isOneLineFieldList">func (p *printer) isOneLineFieldList(list []*ast.Field) bool</a>

```
searchKey: printer.printer.isOneLineFieldList
tags: [private]
```

```Go
func (p *printer) isOneLineFieldList(list []*ast.Field) bool
```

#### <a id="printer.setLineComment" href="#printer.setLineComment">func (p *printer) setLineComment(text string)</a>

```
searchKey: printer.printer.setLineComment
tags: [private]
```

```Go
func (p *printer) setLineComment(text string)
```

#### <a id="printer.fieldList" href="#printer.fieldList">func (p *printer) fieldList(fields *ast.FieldList, isStruct, isIncomplete bool)</a>

```
searchKey: printer.printer.fieldList
tags: [private]
```

```Go
func (p *printer) fieldList(fields *ast.FieldList, isStruct, isIncomplete bool)
```

#### <a id="printer.binaryExpr" href="#printer.binaryExpr">func (p *printer) binaryExpr(x *ast.BinaryExpr, prec1, cutoff, depth int)</a>

```
searchKey: printer.printer.binaryExpr
tags: [private]
```

```Go
func (p *printer) binaryExpr(x *ast.BinaryExpr, prec1, cutoff, depth int)
```

Format the binary expression: decide the cutoff and then format. Let's call depth == 1 Normal mode, and depth > 1 Compact mode. (Algorithm suggestion by Russ Cox.) 

The precedences are: 

```
5             *  /  %  <<  >>  &  &^
4             +  -  |  ^
3             ==  !=  <  <=  >  >=
2             &&
1             ||

```
The only decision is whether there will be spaces around levels 4 and 5. There are never spaces at level 6 (unary), and always spaces at levels 3 and below. 

To choose the cutoff, look at the whole expression but excluding primary expressions (function calls, parenthesized exprs), and apply these rules: 

```
	1) If there is a binary operator with a right side unary operand
	   that would clash without a space, the cutoff must be (in order):

		/*	6
		&&	6
		&^	6
		++	5
		--	5

        (Comparison operators always have spaces around them.)

	2) If there is a mix of level 5 and level 4 operators, then the cutoff
	   is 5 (use spaces to distinguish precedence) in Normal mode
	   and 4 (never use spaces) in Compact mode.

	3) If there are no level 4 operators or no level 5 operators, then the
	   cutoff is 6 (always use spaces) in Normal mode
	   and 4 (never use spaces) in Compact mode.

```
#### <a id="printer.expr1" href="#printer.expr1">func (p *printer) expr1(expr ast.Expr, prec1, depth int)</a>

```
searchKey: printer.printer.expr1
tags: [private]
```

```Go
func (p *printer) expr1(expr ast.Expr, prec1, depth int)
```

#### <a id="printer.possibleSelectorExpr" href="#printer.possibleSelectorExpr">func (p *printer) possibleSelectorExpr(expr ast.Expr, prec1, depth int) bool</a>

```
searchKey: printer.printer.possibleSelectorExpr
tags: [private]
```

```Go
func (p *printer) possibleSelectorExpr(expr ast.Expr, prec1, depth int) bool
```

#### <a id="printer.selectorExpr" href="#printer.selectorExpr">func (p *printer) selectorExpr(x *ast.SelectorExpr, depth int, isMethod bool) bool</a>

```
searchKey: printer.printer.selectorExpr
tags: [private]
```

```Go
func (p *printer) selectorExpr(x *ast.SelectorExpr, depth int, isMethod bool) bool
```

selectorExpr handles an *ast.SelectorExpr node and reports whether x spans multiple lines. 

#### <a id="printer.expr0" href="#printer.expr0">func (p *printer) expr0(x ast.Expr, depth int)</a>

```
searchKey: printer.printer.expr0
tags: [private]
```

```Go
func (p *printer) expr0(x ast.Expr, depth int)
```

#### <a id="printer.expr" href="#printer.expr">func (p *printer) expr(x ast.Expr)</a>

```
searchKey: printer.printer.expr
tags: [private]
```

```Go
func (p *printer) expr(x ast.Expr)
```

#### <a id="printer.stmtList" href="#printer.stmtList">func (p *printer) stmtList(list []ast.Stmt, nindent int, nextIsRBrace bool)</a>

```
searchKey: printer.printer.stmtList
tags: [private]
```

```Go
func (p *printer) stmtList(list []ast.Stmt, nindent int, nextIsRBrace bool)
```

Print the statement list indented, but without a newline after the last statement. Extra line breaks between statements in the source are respected but at most one empty line is printed between statements. 

#### <a id="printer.block" href="#printer.block">func (p *printer) block(b *ast.BlockStmt, nindent int)</a>

```
searchKey: printer.printer.block
tags: [private]
```

```Go
func (p *printer) block(b *ast.BlockStmt, nindent int)
```

block prints an *ast.BlockStmt; it always spans at least two lines. 

#### <a id="printer.controlClause" href="#printer.controlClause">func (p *printer) controlClause(isForStmt bool, init ast.Stmt, expr ast.Expr, post ast.Stmt)</a>

```
searchKey: printer.printer.controlClause
tags: [private]
```

```Go
func (p *printer) controlClause(isForStmt bool, init ast.Stmt, expr ast.Expr, post ast.Stmt)
```

#### <a id="printer.indentList" href="#printer.indentList">func (p *printer) indentList(list []ast.Expr) bool</a>

```
searchKey: printer.printer.indentList
tags: [private]
```

```Go
func (p *printer) indentList(list []ast.Expr) bool
```

indentList reports whether an expression list would look better if it were indented wholesale (starting with the very first element, rather than starting at the first line break). 

#### <a id="printer.stmt" href="#printer.stmt">func (p *printer) stmt(stmt ast.Stmt, nextIsRBrace bool)</a>

```
searchKey: printer.printer.stmt
tags: [private]
```

```Go
func (p *printer) stmt(stmt ast.Stmt, nextIsRBrace bool)
```

#### <a id="printer.valueSpec" href="#printer.valueSpec">func (p *printer) valueSpec(s *ast.ValueSpec, keepType bool)</a>

```
searchKey: printer.printer.valueSpec
tags: [private]
```

```Go
func (p *printer) valueSpec(s *ast.ValueSpec, keepType bool)
```

#### <a id="printer.spec" href="#printer.spec">func (p *printer) spec(spec ast.Spec, n int, doIndent bool)</a>

```
searchKey: printer.printer.spec
tags: [private]
```

```Go
func (p *printer) spec(spec ast.Spec, n int, doIndent bool)
```

The parameter n is the number of specs in the group. If doIndent is set, multi-line identifier lists in the spec are indented when the first linebreak is encountered. 

#### <a id="printer.genDecl" href="#printer.genDecl">func (p *printer) genDecl(d *ast.GenDecl)</a>

```
searchKey: printer.printer.genDecl
tags: [private]
```

```Go
func (p *printer) genDecl(d *ast.GenDecl)
```

#### <a id="printer.nodeSize" href="#printer.nodeSize">func (p *printer) nodeSize(n ast.Node, maxSize int) (size int)</a>

```
searchKey: printer.printer.nodeSize
tags: [private]
```

```Go
func (p *printer) nodeSize(n ast.Node, maxSize int) (size int)
```

nodeSize determines the size of n in chars after formatting. The result is <= maxSize if the node fits on one line with at most maxSize chars and the formatted output doesn't contain any control chars. Otherwise, the result is > maxSize. 

#### <a id="printer.numLines" href="#printer.numLines">func (p *printer) numLines(n ast.Node) int</a>

```
searchKey: printer.printer.numLines
tags: [private]
```

```Go
func (p *printer) numLines(n ast.Node) int
```

numLines returns the number of lines spanned by node n in the original source. 

#### <a id="printer.bodySize" href="#printer.bodySize">func (p *printer) bodySize(b *ast.BlockStmt, maxSize int) int</a>

```
searchKey: printer.printer.bodySize
tags: [private]
```

```Go
func (p *printer) bodySize(b *ast.BlockStmt, maxSize int) int
```

bodySize is like nodeSize but it is specialized for *ast.BlockStmt's. 

#### <a id="printer.funcBody" href="#printer.funcBody">func (p *printer) funcBody(headerSize int, sep whiteSpace, b *ast.BlockStmt)</a>

```
searchKey: printer.printer.funcBody
tags: [private]
```

```Go
func (p *printer) funcBody(headerSize int, sep whiteSpace, b *ast.BlockStmt)
```

funcBody prints a function body following a function header of given headerSize. If the header's and block's size are "small enough" and the block is "simple enough", the block is printed on the current line, without line breaks, spaced from the header by sep. Otherwise the block's opening "{" is printed on the current line, followed by lines for the block's statements and its closing "}". 

#### <a id="printer.distanceFrom" href="#printer.distanceFrom">func (p *printer) distanceFrom(startPos token.Pos, startOutCol int) int</a>

```
searchKey: printer.printer.distanceFrom
tags: [private]
```

```Go
func (p *printer) distanceFrom(startPos token.Pos, startOutCol int) int
```

distanceFrom returns the column difference between p.out (the current output position) and startOutCol. If the start position is on a different line from the current position (or either is unknown), the result is infinity. 

#### <a id="printer.funcDecl" href="#printer.funcDecl">func (p *printer) funcDecl(d *ast.FuncDecl)</a>

```
searchKey: printer.printer.funcDecl
tags: [private]
```

```Go
func (p *printer) funcDecl(d *ast.FuncDecl)
```

#### <a id="printer.decl" href="#printer.decl">func (p *printer) decl(decl ast.Decl)</a>

```
searchKey: printer.printer.decl
tags: [private]
```

```Go
func (p *printer) decl(decl ast.Decl)
```

#### <a id="printer.declList" href="#printer.declList">func (p *printer) declList(list []ast.Decl)</a>

```
searchKey: printer.printer.declList
tags: [private]
```

```Go
func (p *printer) declList(list []ast.Decl)
```

#### <a id="printer.file" href="#printer.file">func (p *printer) file(src *ast.File)</a>

```
searchKey: printer.printer.file
tags: [private]
```

```Go
func (p *printer) file(src *ast.File)
```

#### <a id="printer.init.printer.go" href="#printer.init.printer.go">func (p *printer) init(cfg *Config, fset *token.FileSet, nodeSizes map[ast.Node]int)</a>

```
searchKey: printer.printer.init
tags: [private]
```

```Go
func (p *printer) init(cfg *Config, fset *token.FileSet, nodeSizes map[ast.Node]int)
```

#### <a id="printer.internalError" href="#printer.internalError">func (p *printer) internalError(msg ...interface{})</a>

```
searchKey: printer.printer.internalError
tags: [private]
```

```Go
func (p *printer) internalError(msg ...interface{})
```

#### <a id="printer.commentsHaveNewline" href="#printer.commentsHaveNewline">func (p *printer) commentsHaveNewline(list []*ast.Comment) bool</a>

```
searchKey: printer.printer.commentsHaveNewline
tags: [private]
```

```Go
func (p *printer) commentsHaveNewline(list []*ast.Comment) bool
```

commentsHaveNewline reports whether a list of comments belonging to an *ast.CommentGroup contains newlines. Because the position information may only be partially correct, we also have to read the comment text. 

#### <a id="printer.nextComment" href="#printer.nextComment">func (p *printer) nextComment()</a>

```
searchKey: printer.printer.nextComment
tags: [private]
```

```Go
func (p *printer) nextComment()
```

#### <a id="printer.commentBefore" href="#printer.commentBefore">func (p *printer) commentBefore(next token.Position) bool</a>

```
searchKey: printer.printer.commentBefore
tags: [private]
```

```Go
func (p *printer) commentBefore(next token.Position) bool
```

commentBefore reports whether the current comment group occurs before the next position in the source code and printing it does not introduce implicit semicolons. 

#### <a id="printer.commentSizeBefore" href="#printer.commentSizeBefore">func (p *printer) commentSizeBefore(next token.Position) int</a>

```
searchKey: printer.printer.commentSizeBefore
tags: [private]
```

```Go
func (p *printer) commentSizeBefore(next token.Position) int
```

commentSizeBefore returns the estimated size of the comments on the same line before the next position. 

#### <a id="printer.recordLine" href="#printer.recordLine">func (p *printer) recordLine(linePtr *int)</a>

```
searchKey: printer.printer.recordLine
tags: [private]
```

```Go
func (p *printer) recordLine(linePtr *int)
```

recordLine records the output line number for the next non-whitespace token in *linePtr. It is used to compute an accurate line number for a formatted construct, independent of pending (not yet emitted) whitespace or comments. 

#### <a id="printer.linesFrom" href="#printer.linesFrom">func (p *printer) linesFrom(line int) int</a>

```
searchKey: printer.printer.linesFrom
tags: [private]
```

```Go
func (p *printer) linesFrom(line int) int
```

linesFrom returns the number of output lines between the current output line and the line argument, ignoring any pending (not yet emitted) whitespace or comments. It is used to compute an accurate size (in number of lines) for a formatted construct. 

#### <a id="printer.posFor" href="#printer.posFor">func (p *printer) posFor(pos token.Pos) token.Position</a>

```
searchKey: printer.printer.posFor
tags: [private]
```

```Go
func (p *printer) posFor(pos token.Pos) token.Position
```

#### <a id="printer.lineFor" href="#printer.lineFor">func (p *printer) lineFor(pos token.Pos) int</a>

```
searchKey: printer.printer.lineFor
tags: [private]
```

```Go
func (p *printer) lineFor(pos token.Pos) int
```

#### <a id="printer.writeLineDirective" href="#printer.writeLineDirective">func (p *printer) writeLineDirective(pos token.Position)</a>

```
searchKey: printer.printer.writeLineDirective
tags: [private]
```

```Go
func (p *printer) writeLineDirective(pos token.Position)
```

writeLineDirective writes a //line directive if necessary. 

#### <a id="printer.writeIndent" href="#printer.writeIndent">func (p *printer) writeIndent()</a>

```
searchKey: printer.printer.writeIndent
tags: [private]
```

```Go
func (p *printer) writeIndent()
```

writeIndent writes indentation. 

#### <a id="printer.writeByte" href="#printer.writeByte">func (p *printer) writeByte(ch byte, n int)</a>

```
searchKey: printer.printer.writeByte
tags: [private]
```

```Go
func (p *printer) writeByte(ch byte, n int)
```

writeByte writes ch n times to p.output and updates p.pos. Only used to write formatting (white space) characters. 

#### <a id="printer.writeString" href="#printer.writeString">func (p *printer) writeString(pos token.Position, s string, isLit bool)</a>

```
searchKey: printer.printer.writeString
tags: [private]
```

```Go
func (p *printer) writeString(pos token.Position, s string, isLit bool)
```

writeString writes the string s to p.output and updates p.pos, p.out, and p.last. If isLit is set, s is escaped w/ tabwriter.Escape characters to protect s from being interpreted by the tabwriter. 

Note: writeString is only used to write Go tokens, literals, and comments, all of which must be written literally. Thus, it is correct to always set isLit = true. However, setting it explicitly only when needed (i.e., when we don't know that s contains no tabs or line breaks) avoids processing extra escape characters and reduces run time of the printer benchmark by up to 10%. 

#### <a id="printer.writeCommentPrefix" href="#printer.writeCommentPrefix">func (p *printer) writeCommentPrefix(pos, next token.Position, prev *ast.Comment, tok token.Token)</a>

```
searchKey: printer.printer.writeCommentPrefix
tags: [private]
```

```Go
func (p *printer) writeCommentPrefix(pos, next token.Position, prev *ast.Comment, tok token.Token)
```

writeCommentPrefix writes the whitespace before a comment. If there is any pending whitespace, it consumes as much of it as is likely to help position the comment nicely. pos is the comment position, next the position of the item after all pending comments, prev is the previous comment in a group of comments (or nil), and tok is the next token. 

#### <a id="printer.writeComment" href="#printer.writeComment">func (p *printer) writeComment(comment *ast.Comment)</a>

```
searchKey: printer.printer.writeComment
tags: [private]
```

```Go
func (p *printer) writeComment(comment *ast.Comment)
```

#### <a id="printer.writeCommentSuffix" href="#printer.writeCommentSuffix">func (p *printer) writeCommentSuffix(needsLinebreak bool) (wroteNewline, droppedFF bool)</a>

```
searchKey: printer.printer.writeCommentSuffix
tags: [private]
```

```Go
func (p *printer) writeCommentSuffix(needsLinebreak bool) (wroteNewline, droppedFF bool)
```

writeCommentSuffix writes a line break after a comment if indicated and processes any leftover indentation information. If a line break is needed, the kind of break (newline vs formfeed) depends on the pending whitespace. The writeCommentSuffix result indicates if a newline was written or if a formfeed was dropped from the whitespace buffer. 

#### <a id="printer.containsLinebreak" href="#printer.containsLinebreak">func (p *printer) containsLinebreak() bool</a>

```
searchKey: printer.printer.containsLinebreak
tags: [private]
```

```Go
func (p *printer) containsLinebreak() bool
```

containsLinebreak reports whether the whitespace buffer contains any line breaks. 

#### <a id="printer.intersperseComments" href="#printer.intersperseComments">func (p *printer) intersperseComments(next token.Position, tok token.Token) (wroteNewline, droppedFF bool)</a>

```
searchKey: printer.printer.intersperseComments
tags: [private]
```

```Go
func (p *printer) intersperseComments(next token.Position, tok token.Token) (wroteNewline, droppedFF bool)
```

intersperseComments consumes all comments that appear before the next token tok and prints it together with the buffered whitespace (i.e., the whitespace that needs to be written before the next token). A heuristic is used to mix the comments and whitespace. The intersperseComments result indicates if a newline was written or if a formfeed was dropped from the whitespace buffer. 

#### <a id="printer.writeWhitespace" href="#printer.writeWhitespace">func (p *printer) writeWhitespace(n int)</a>

```
searchKey: printer.printer.writeWhitespace
tags: [private]
```

```Go
func (p *printer) writeWhitespace(n int)
```

whiteWhitespace writes the first n whitespace entries. 

#### <a id="printer.print" href="#printer.print">func (p *printer) print(args ...interface{})</a>

```
searchKey: printer.printer.print
tags: [private]
```

```Go
func (p *printer) print(args ...interface{})
```

print prints a list of "items" (roughly corresponding to syntactic tokens, but also including whitespace and formatting information). It is the only print function that should be called directly from any of the AST printing functions in nodes.go. 

Whitespace is accumulated until a non-whitespace token appears. Any comments that need to appear before that token are printed first, taking into account the amount and structure of any pending white- space for best comment placement. Then, any leftover whitespace is printed, followed by the actual token. 

#### <a id="printer.flush" href="#printer.flush">func (p *printer) flush(next token.Position, tok token.Token) (wroteNewline, droppedFF bool)</a>

```
searchKey: printer.printer.flush
tags: [private]
```

```Go
func (p *printer) flush(next token.Position, tok token.Token) (wroteNewline, droppedFF bool)
```

flush prints any pending comments and whitespace occurring textually before the position of the next token tok. The flush result indicates if a newline was written or if a formfeed was dropped from the whitespace buffer. 

#### <a id="printer.printNode" href="#printer.printNode">func (p *printer) printNode(node interface{}) error</a>

```
searchKey: printer.printer.printNode
tags: [private]
```

```Go
func (p *printer) printNode(node interface{}) error
```

### <a id="trimmer" href="#trimmer">type trimmer struct</a>

```
searchKey: printer.trimmer
tags: [private]
```

```Go
type trimmer struct {
	output io.Writer
	state  int
	space  []byte
}
```

A trimmer is an io.Writer filter for stripping tabwriter.Escape characters, trailing blanks and tabs, and for converting formfeed and vtab characters into newlines and htabs (in case no tabwriter is used). Text bracketed by tabwriter.Escape characters is passed through unchanged. 

#### <a id="trimmer.resetSpace" href="#trimmer.resetSpace">func (p *trimmer) resetSpace()</a>

```
searchKey: printer.trimmer.resetSpace
tags: [private]
```

```Go
func (p *trimmer) resetSpace()
```

#### <a id="trimmer.Write" href="#trimmer.Write">func (p *trimmer) Write(data []byte) (n int, err error)</a>

```
searchKey: printer.trimmer.Write
tags: [private]
```

```Go
func (p *trimmer) Write(data []byte) (n int, err error)
```

### <a id="Mode" href="#Mode">type Mode uint</a>

```
searchKey: printer.Mode
```

```Go
type Mode uint
```

A Mode value is a set of flags (or 0). They control printing. 

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: printer.Config
```

```Go
type Config struct {
	Mode     Mode // default: 0
	Tabwidth int  // default: 8
	Indent   int  // default: 0 (all code is indented at least by this much)
}
```

A Config node controls the output of Fprint. 

#### <a id="Config.fprint" href="#Config.fprint">func (cfg *Config) fprint(output io.Writer, fset *token.FileSet, node interface{}, nodeSizes map[ast.Node]int) (err error)</a>

```
searchKey: printer.Config.fprint
tags: [private]
```

```Go
func (cfg *Config) fprint(output io.Writer, fset *token.FileSet, node interface{}, nodeSizes map[ast.Node]int) (err error)
```

fprint implements Fprint and takes a nodesSizes map for setting up the printer state. 

#### <a id="Config.Fprint" href="#Config.Fprint">func (cfg *Config) Fprint(output io.Writer, fset *token.FileSet, node interface{}) error</a>

```
searchKey: printer.Config.Fprint
```

```Go
func (cfg *Config) Fprint(output io.Writer, fset *token.FileSet, node interface{}) error
```

Fprint "pretty-prints" an AST node to output for a given configuration cfg. Position information is interpreted relative to the file set fset. The node type must be *ast.File, *CommentedNode, []ast.Decl, []ast.Stmt, or assignment-compatible to ast.Expr, ast.Decl, ast.Spec, or ast.Stmt. 

### <a id="CommentedNode" href="#CommentedNode">type CommentedNode struct</a>

```
searchKey: printer.CommentedNode
```

```Go
type CommentedNode struct {
	Node     interface{} // *ast.File, or ast.Expr, ast.Decl, ast.Spec, or ast.Stmt
	Comments []*ast.CommentGroup
}
```

A CommentedNode bundles an AST node and corresponding comments. It may be provided as argument to any of the Fprint functions. 

### <a id="checkMode" href="#checkMode">type checkMode uint</a>

```
searchKey: printer.checkMode
tags: [private]
```

```Go
type checkMode uint
```

### <a id="entry" href="#entry">type entry struct</a>

```
searchKey: printer.entry
tags: [private]
```

```Go
type entry struct {
	source, golden string
	mode           checkMode
}
```

### <a id="visitor" href="#visitor">type visitor chan *ast.Ident</a>

```
searchKey: printer.visitor
tags: [private]
```

```Go
type visitor chan *ast.Ident
```

#### <a id="visitor.Visit" href="#visitor.Visit">func (v visitor) Visit(n ast.Node) (w ast.Visitor)</a>

```
searchKey: printer.visitor.Visit
tags: [private]
```

```Go
func (v visitor) Visit(n ast.Node) (w ast.Visitor)
```

### <a id="limitWriter" href="#limitWriter">type limitWriter struct</a>

```
searchKey: printer.limitWriter
tags: [private]
```

```Go
type limitWriter struct {
	remaining int
	errCount  int
}
```

#### <a id="limitWriter.Write" href="#limitWriter.Write">func (l *limitWriter) Write(buf []byte) (n int, err error)</a>

```
searchKey: printer.limitWriter.Write
tags: [private]
```

```Go
func (l *limitWriter) Write(buf []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

### <a id="appendLines" href="#appendLines">func appendLines(x, y []byte) []byte</a>

```
searchKey: printer.appendLines
tags: [private]
```

```Go
func appendLines(x, y []byte) []byte
```

appendLines is like append(x, y...) but it avoids creating doubled blank lines, which would not be gofmt-standard output. It assumes that only whole blocks of lines are being appended, not line fragments. 

### <a id="isNL" href="#isNL">func isNL(b byte) bool</a>

```
searchKey: printer.isNL
tags: [private]
```

```Go
func isNL(b byte) bool
```

### <a id="identListSize" href="#identListSize">func identListSize(list []*ast.Ident, maxSize int) (size int)</a>

```
searchKey: printer.identListSize
tags: [private]
```

```Go
func identListSize(list []*ast.Ident, maxSize int) (size int)
```

### <a id="walkBinary" href="#walkBinary">func walkBinary(e *ast.BinaryExpr) (has4, has5 bool, maxProblem int)</a>

```
searchKey: printer.walkBinary
tags: [private]
```

```Go
func walkBinary(e *ast.BinaryExpr) (has4, has5 bool, maxProblem int)
```

### <a id="cutoff" href="#cutoff">func cutoff(e *ast.BinaryExpr, depth int) int</a>

```
searchKey: printer.cutoff
tags: [private]
```

```Go
func cutoff(e *ast.BinaryExpr, depth int) int
```

### <a id="diffPrec" href="#diffPrec">func diffPrec(expr ast.Expr, prec int) int</a>

```
searchKey: printer.diffPrec
tags: [private]
```

```Go
func diffPrec(expr ast.Expr, prec int) int
```

### <a id="reduceDepth" href="#reduceDepth">func reduceDepth(depth int) int</a>

```
searchKey: printer.reduceDepth
tags: [private]
```

```Go
func reduceDepth(depth int) int
```

### <a id="isBinary" href="#isBinary">func isBinary(expr ast.Expr) bool</a>

```
searchKey: printer.isBinary
tags: [private]
```

```Go
func isBinary(expr ast.Expr) bool
```

### <a id="normalizedNumber" href="#normalizedNumber">func normalizedNumber(lit *ast.BasicLit) *ast.BasicLit</a>

```
searchKey: printer.normalizedNumber
tags: [private]
```

```Go
func normalizedNumber(lit *ast.BasicLit) *ast.BasicLit
```

normalizedNumber rewrites base prefixes and exponents of numbers to use lower-case letters (0X123 to 0x123 and 1.2E3 to 1.2e3), and removes leading 0's from integer imaginary literals (0765i to 765i). It leaves hexadecimal digits alone. 

normalizedNumber doesn't modify the ast.BasicLit value lit points to. If lit is not a number or a number in canonical format already, lit is returned as is. Otherwise a new ast.BasicLit is created. 

### <a id="isTypeName" href="#isTypeName">func isTypeName(x ast.Expr) bool</a>

```
searchKey: printer.isTypeName
tags: [private]
```

```Go
func isTypeName(x ast.Expr) bool
```

### <a id="stripParens" href="#stripParens">func stripParens(x ast.Expr) ast.Expr</a>

```
searchKey: printer.stripParens
tags: [private]
```

```Go
func stripParens(x ast.Expr) ast.Expr
```

### <a id="stripParensAlways" href="#stripParensAlways">func stripParensAlways(x ast.Expr) ast.Expr</a>

```
searchKey: printer.stripParensAlways
tags: [private]
```

```Go
func stripParensAlways(x ast.Expr) ast.Expr
```

### <a id="keepTypeColumn" href="#keepTypeColumn">func keepTypeColumn(specs []ast.Spec) []bool</a>

```
searchKey: printer.keepTypeColumn
tags: [private]
```

```Go
func keepTypeColumn(specs []ast.Spec) []bool
```

The keepTypeColumn function determines if the type column of a series of consecutive const or var declarations must be kept, or if initialization values (V) can be placed in the type column (T) instead. The i'th entry in the result slice is true if the type column in spec[i] must be kept. 

For example, the declaration: 

```
	const (
		foobar int = 42 // comment
		x          = 7  // comment
		foo
             bar = 991
	)

```
leads to the type/values matrix below. A run of value columns (V) can be moved into the type column if there is no type for any of the values in that column (we only move entire columns so that they align properly). 

```
	matrix        formatted     result
                   matrix
	T  V    ->    T  V     ->   true      there is a T and so the type
	-  V          -  V          true      column must be kept
	-  -          -  -          false
	-  V          V  -          false     V is moved into T column

```
### <a id="sanitizeImportPath" href="#sanitizeImportPath">func sanitizeImportPath(lit *ast.BasicLit) *ast.BasicLit</a>

```
searchKey: printer.sanitizeImportPath
tags: [private]
```

```Go
func sanitizeImportPath(lit *ast.BasicLit) *ast.BasicLit
```

### <a id="declToken" href="#declToken">func declToken(decl ast.Decl) (tok token.Token)</a>

```
searchKey: printer.declToken
tags: [private]
```

```Go
func declToken(decl ast.Decl) (tok token.Token)
```

### <a id="isBlank" href="#isBlank">func isBlank(s string) bool</a>

```
searchKey: printer.isBlank
tags: [private]
```

```Go
func isBlank(s string) bool
```

Returns true if s contains only white space (only tabs and blanks can appear in the printer's context). 

### <a id="commonPrefix" href="#commonPrefix">func commonPrefix(a, b string) string</a>

```
searchKey: printer.commonPrefix
tags: [private]
```

```Go
func commonPrefix(a, b string) string
```

commonPrefix returns the common prefix of a and b. 

### <a id="trimRight" href="#trimRight">func trimRight(s string) string</a>

```
searchKey: printer.trimRight
tags: [private]
```

```Go
func trimRight(s string) string
```

trimRight returns s with trailing whitespace removed. 

### <a id="stripCommonPrefix" href="#stripCommonPrefix">func stripCommonPrefix(lines []string)</a>

```
searchKey: printer.stripCommonPrefix
tags: [private]
```

```Go
func stripCommonPrefix(lines []string)
```

stripCommonPrefix removes a common prefix from /*-style comment lines (unless no comment line is indented, all but the first line have some form of space prefix). The prefix is computed using heuristics such that is likely that the comment contents are nicely laid out after re-printing each line using the printer's current indentation. 

### <a id="nlimit" href="#nlimit">func nlimit(n int) int</a>

```
searchKey: printer.nlimit
tags: [private]
```

```Go
func nlimit(n int) int
```

nlimit limits n to maxNewlines. 

### <a id="mayCombine" href="#mayCombine">func mayCombine(prev token.Token, next byte) (b bool)</a>

```
searchKey: printer.mayCombine
tags: [private]
```

```Go
func mayCombine(prev token.Token, next byte) (b bool)
```

### <a id="getDoc" href="#getDoc">func getDoc(n ast.Node) *ast.CommentGroup</a>

```
searchKey: printer.getDoc
tags: [private]
```

```Go
func getDoc(n ast.Node) *ast.CommentGroup
```

getNode returns the ast.CommentGroup associated with n, if any. 

### <a id="getLastComment" href="#getLastComment">func getLastComment(n ast.Node) *ast.CommentGroup</a>

```
searchKey: printer.getLastComment
tags: [private]
```

```Go
func getLastComment(n ast.Node) *ast.CommentGroup
```

### <a id="Fprint" href="#Fprint">func Fprint(output io.Writer, fset *token.FileSet, node interface{}) error</a>

```
searchKey: printer.Fprint
```

```Go
func Fprint(output io.Writer, fset *token.FileSet, node interface{}) error
```

Fprint "pretty-prints" an AST node to output. It calls Config.Fprint with default settings. Note that gofmt uses tabs for indentation but spaces for alignment; use format.Node (package go/format) for output that matches gofmt. 

### <a id="testprint" href="#testprint">func testprint(out io.Writer, file *ast.File)</a>

```
searchKey: printer.testprint
tags: [private]
```

```Go
func testprint(out io.Writer, file *ast.File)
```

### <a id="initialize" href="#initialize">func initialize()</a>

```
searchKey: printer.initialize
tags: [private]
```

```Go
func initialize()
```

cannot initialize in init because (printer) Fprint launches goroutines. 

### <a id="BenchmarkPrint" href="#BenchmarkPrint">func BenchmarkPrint(b *testing.B)</a>

```
searchKey: printer.BenchmarkPrint
tags: [private]
```

```Go
func BenchmarkPrint(b *testing.B)
```

### <a id="format" href="#format">func format(src []byte, mode checkMode) ([]byte, error)</a>

```
searchKey: printer.format
tags: [private]
```

```Go
func format(src []byte, mode checkMode) ([]byte, error)
```

format parses src, prints the corresponding AST, verifies the resulting src is syntactically correct, and returns the resulting src or an error if any. 

### <a id="lineAt" href="#lineAt">func lineAt(text []byte, offs int) []byte</a>

```
searchKey: printer.lineAt
tags: [private]
```

```Go
func lineAt(text []byte, offs int) []byte
```

lineAt returns the line in text starting at offset offs. 

### <a id="diff" href="#diff">func diff(aname, bname string, a, b []byte) error</a>

```
searchKey: printer.diff
tags: [private]
```

```Go
func diff(aname, bname string, a, b []byte) error
```

diff compares a and b. 

### <a id="runcheck" href="#runcheck">func runcheck(t *testing.T, source, golden string, mode checkMode)</a>

```
searchKey: printer.runcheck
tags: [private]
```

```Go
func runcheck(t *testing.T, source, golden string, mode checkMode)
```

### <a id="check" href="#check">func check(t *testing.T, source, golden string, mode checkMode)</a>

```
searchKey: printer.check
tags: [private]
```

```Go
func check(t *testing.T, source, golden string, mode checkMode)
```

### <a id="TestFiles" href="#TestFiles">func TestFiles(t *testing.T)</a>

```
searchKey: printer.TestFiles
tags: [private]
```

```Go
func TestFiles(t *testing.T)
```

### <a id="TestLineComments" href="#TestLineComments">func TestLineComments(t *testing.T)</a>

```
searchKey: printer.TestLineComments
tags: [private]
```

```Go
func TestLineComments(t *testing.T)
```

TestLineComments, using a simple test case, checks that consecutive line comments are properly terminated with a newline even if the AST position information is incorrect. 

### <a id="init.printer_test.go" href="#init.printer_test.go">func init()</a>

```
searchKey: printer.init
tags: [private]
```

```Go
func init()
```

Verify that the printer can be invoked during initialization. 

### <a id="TestBadNodes" href="#TestBadNodes">func TestBadNodes(t *testing.T)</a>

```
searchKey: printer.TestBadNodes
tags: [private]
```

```Go
func TestBadNodes(t *testing.T)
```

Verify that the printer doesn't crash if the AST contains BadXXX nodes. 

### <a id="testComment" href="#testComment">func testComment(t *testing.T, f *ast.File, srclen int, comment *ast.Comment)</a>

```
searchKey: printer.testComment
tags: [private]
```

```Go
func testComment(t *testing.T, f *ast.File, srclen int, comment *ast.Comment)
```

testComment verifies that f can be parsed again after printing it with its first comment set to comment at any possible source offset. 

### <a id="TestBadComments" href="#TestBadComments">func TestBadComments(t *testing.T)</a>

```
searchKey: printer.TestBadComments
tags: [private]
```

```Go
func TestBadComments(t *testing.T)
```

Verify that the printer produces a correct program even if the position information of comments introducing newlines is incorrect. 

### <a id="idents" href="#idents">func idents(f *ast.File) <-chan *ast.Ident</a>

```
searchKey: printer.idents
tags: [private]
```

```Go
func idents(f *ast.File) <-chan *ast.Ident
```

idents is an iterator that returns all idents in f via the result channel. 

### <a id="identCount" href="#identCount">func identCount(f *ast.File) int</a>

```
searchKey: printer.identCount
tags: [private]
```

```Go
func identCount(f *ast.File) int
```

identCount returns the number of identifiers found in f. 

### <a id="TestSourcePos" href="#TestSourcePos">func TestSourcePos(t *testing.T)</a>

```
searchKey: printer.TestSourcePos
tags: [private]
```

```Go
func TestSourcePos(t *testing.T)
```

Verify that the SourcePos mode emits correct //line directives by testing that position information for matching identifiers is maintained. 

### <a id="TestIssue5945" href="#TestIssue5945">func TestIssue5945(t *testing.T)</a>

```
searchKey: printer.TestIssue5945
tags: [private]
```

```Go
func TestIssue5945(t *testing.T)
```

Verify that the SourcePos mode doesn't emit unnecessary //line directives before empty lines. 

### <a id="TestDeclLists" href="#TestDeclLists">func TestDeclLists(t *testing.T)</a>

```
searchKey: printer.TestDeclLists
tags: [private]
```

```Go
func TestDeclLists(t *testing.T)
```

### <a id="TestStmtLists" href="#TestStmtLists">func TestStmtLists(t *testing.T)</a>

```
searchKey: printer.TestStmtLists
tags: [private]
```

```Go
func TestStmtLists(t *testing.T)
```

### <a id="TestBaseIndent" href="#TestBaseIndent">func TestBaseIndent(t *testing.T)</a>

```
searchKey: printer.TestBaseIndent
tags: [private]
```

```Go
func TestBaseIndent(t *testing.T)
```

### <a id="TestFuncType" href="#TestFuncType">func TestFuncType(t *testing.T)</a>

```
searchKey: printer.TestFuncType
tags: [private]
```

```Go
func TestFuncType(t *testing.T)
```

TestFuncType tests that an ast.FuncType with a nil Params field can be printed (per go/ast specification). Test case for issue 3870. 

### <a id="TestWriteErrors" href="#TestWriteErrors">func TestWriteErrors(t *testing.T)</a>

```
searchKey: printer.TestWriteErrors
tags: [private]
```

```Go
func TestWriteErrors(t *testing.T)
```

Test whether the printer stops writing after the first error 

### <a id="TestX" href="#TestX">func TestX(t *testing.T)</a>

```
searchKey: printer.TestX
tags: [private]
```

```Go
func TestX(t *testing.T)
```

TextX is a skeleton test that can be filled in for debugging one-off cases. Do not remove. 

### <a id="TestCommentedNode" href="#TestCommentedNode">func TestCommentedNode(t *testing.T)</a>

```
searchKey: printer.TestCommentedNode
tags: [private]
```

```Go
func TestCommentedNode(t *testing.T)
```

### <a id="TestIssue11151" href="#TestIssue11151">func TestIssue11151(t *testing.T)</a>

```
searchKey: printer.TestIssue11151
tags: [private]
```

```Go
func TestIssue11151(t *testing.T)
```

### <a id="TestParenthesizedDecl" href="#TestParenthesizedDecl">func TestParenthesizedDecl(t *testing.T)</a>

```
searchKey: printer.TestParenthesizedDecl
tags: [private]
```

```Go
func TestParenthesizedDecl(t *testing.T)
```

If a declaration has multiple specifications, a parenthesized declaration must be printed even if Lparen is token.NoPos. 

### <a id="TestIssue32854" href="#TestIssue32854">func TestIssue32854(t *testing.T)</a>

```
searchKey: printer.TestIssue32854
tags: [private]
```

```Go
func TestIssue32854(t *testing.T)
```

Verify that we don't print a newline between "return" and its results, as that would incorrectly cause a naked return. 

