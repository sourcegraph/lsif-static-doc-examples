# Package doc

Package doc extracts source code documentation from a Go AST. 

## Index

* [Constants](#const)
    * [const AllDecls](#AllDecls)
    * [const AllMethods](#AllMethods)
    * [const PreserveAST](#PreserveAST)
    * [const dataDir](#dataDir)
    * [const hostPart](#hostPart)
    * [const identRx](#identRx)
    * [const keepNL](#keepNL)
    * [const ldquo](#ldquo)
    * [const opHead](#opHead)
    * [const opPara](#opPara)
    * [const opPre](#opPre)
    * [const pathPart](#pathPart)
    * [const protoPart](#protoPart)
    * [const rdquo](#rdquo)
    * [const ulquo](#ulquo)
    * [const urlRx](#urlRx)
    * [const urquo](#urquo)
* [Variables](#var)
    * [var IllegalPrefixes](#IllegalPrefixes)
    * [var blocksTests](#blocksTests)
    * [var emphasizeTests](#emphasizeTests)
    * [var files](#files)
    * [var headingTests](#headingTests)
    * [var htmlQuoteReplacer](#htmlQuoteReplacer)
    * [var html_a](#html_a)
    * [var html_aq](#html_aq)
    * [var html_enda](#html_enda)
    * [var html_endh](#html_endh)
    * [var html_endi](#html_endi)
    * [var html_endp](#html_endp)
    * [var html_endpre](#html_endpre)
    * [var html_h](#html_h)
    * [var html_hq](#html_hq)
    * [var html_i](#html_i)
    * [var html_p](#html_p)
    * [var html_pre](#html_pre)
    * [var matchRx](#matchRx)
    * [var nl](#nl)
    * [var nonAlphaNumRx](#nonAlphaNumRx)
    * [var noteCommentRx](#noteCommentRx)
    * [var noteMarker](#noteMarker)
    * [var noteMarkerRx](#noteMarkerRx)
    * [var outputPrefix](#outputPrefix)
    * [var predeclaredConstants](#predeclaredConstants)
    * [var predeclaredFuncs](#predeclaredFuncs)
    * [var predeclaredTypes](#predeclaredTypes)
    * [var prefix](#prefix)
    * [var space](#space)
    * [var templateTxt](#templateTxt)
    * [var tests](#tests)
    * [var underscore](#underscore)
    * [var unicodeQuoteReplacer](#unicodeQuoteReplacer)
    * [var update](#update)
* [Types](#type)
    * [type Example struct](#Example)
    * [type Filter func(string) bool](#Filter)
    * [type Func struct](#Func)
        * [func customizeRecv(f *Func, recvTypeName string, embeddedIsPtr bool, level int) *Func](#customizeRecv)
    * [type Mode int](#Mode)
    * [type Note struct](#Note)
    * [type Package struct](#Package)
        * [func New(pkg *ast.Package, importPath string, mode Mode) *Package](#New)
        * [func NewFromFiles(fset *token.FileSet, files []*ast.File, importPath string, opts ...interface{}) (*Package, error)](#NewFromFiles)
        * [func (p *Package) Filter(f Filter)](#Package.Filter)
    * [type Type struct](#Type)
    * [type Value struct](#Value)
    * [type block struct](#block)
    * [type bundle struct](#bundle)
    * [type data struct](#data)
        * [func (d *data) Len() int](#data.Len)
        * [func (d *data) Less(i, j int) bool](#data.Less)
        * [func (d *data) Swap(i, j int)](#data.Swap)
    * [type embeddedSet map[*doc.namedType]bool](#embeddedSet)
    * [type lineWrapper struct](#lineWrapper)
        * [func (l *lineWrapper) flush()](#lineWrapper.flush)
        * [func (l *lineWrapper) write(text string)](#lineWrapper.write)
    * [type methodSet map[string]*doc.Func](#methodSet)
        * [func (mset methodSet) add(m *Func)](#methodSet.add)
        * [func (mset methodSet) set(f *ast.FuncDecl, preserveAST bool)](#methodSet.set)
    * [type namedType struct](#namedType)
    * [type op int](#op)
    * [type reader struct](#reader)
        * [func (r *reader) cleanupTypes()](#reader.cleanupTypes)
        * [func (r *reader) collectEmbeddedMethods(mset methodSet, typ *namedType, recvTypeName string, embeddedIsPtr bool, level int, visited embeddedSet)](#reader.collectEmbeddedMethods)
        * [func (r *reader) computeMethodSets()](#reader.computeMethodSets)
        * [func (r *reader) fileExports(src *ast.File)](#reader.fileExports)
        * [func (r *reader) filterDecl(decl ast.Decl) bool](#reader.filterDecl)
        * [func (r *reader) filterFieldList(parent *namedType, fields *ast.FieldList, ityp *ast.InterfaceType) (removedFields bool)](#reader.filterFieldList)
        * [func (r *reader) filterParamList(fields *ast.FieldList)](#reader.filterParamList)
        * [func (r *reader) filterSpec(spec ast.Spec) bool](#reader.filterSpec)
        * [func (r *reader) filterSpecList(list []ast.Spec, tok token.Token) []ast.Spec](#reader.filterSpecList)
        * [func (r *reader) filterType(parent *namedType, typ ast.Expr)](#reader.filterType)
        * [func (r *reader) isPredeclared(n string) bool](#reader.isPredeclared)
        * [func (r *reader) isVisible(name string) bool](#reader.isVisible)
        * [func (r *reader) lookupType(name string) *namedType](#reader.lookupType)
        * [func (r *reader) readDoc(comment *ast.CommentGroup)](#reader.readDoc)
        * [func (r *reader) readFile(src *ast.File)](#reader.readFile)
        * [func (r *reader) readFunc(fun *ast.FuncDecl)](#reader.readFunc)
        * [func (r *reader) readNote(list []*ast.Comment)](#reader.readNote)
        * [func (r *reader) readNotes(comments []*ast.CommentGroup)](#reader.readNotes)
        * [func (r *reader) readPackage(pkg *ast.Package, mode Mode)](#reader.readPackage)
        * [func (r *reader) readType(decl *ast.GenDecl, spec *ast.TypeSpec)](#reader.readType)
        * [func (r *reader) readValue(decl *ast.GenDecl)](#reader.readValue)
        * [func (r *reader) recordAnonymousField(parent *namedType, fieldType ast.Expr) (fname string)](#reader.recordAnonymousField)
        * [func (r *reader) remember(typ *ast.InterfaceType)](#reader.remember)
* [Functions](#func)
    * [func Examples(testFiles ...*ast.File) []*Example](#Examples)
    * [func IsPredeclared(s string) bool](#IsPredeclared)
    * [func Synopsis(s string) string](#Synopsis)
    * [func Test(t *testing.T)](#Test)
    * [func TestAnchorID(t *testing.T)](#TestAnchorID)
    * [func TestBlocks(t *testing.T)](#TestBlocks)
    * [func TestCommentEscape(t *testing.T)](#TestCommentEscape)
    * [func TestEmphasize(t *testing.T)](#TestEmphasize)
    * [func TestIsHeading(t *testing.T)](#TestIsHeading)
    * [func TestSynopsis(t *testing.T)](#TestSynopsis)
    * [func TestToText(t *testing.T)](#TestToText)
    * [func ToHTML(w io.Writer, text string, words map[string]string)](#ToHTML)
    * [func ToText(w io.Writer, text string, indent, preIndent string, width int)](#ToText)
    * [func anchorID(line string) string](#anchorID)
    * [func baseTypeName(x ast.Expr) (name string, imported bool)](#baseTypeName)
    * [func blocks(text string) []block](#blocks)
    * [func classifyExamples(p *Package, examples []*Example)](#classifyExamples)
    * [func clean(s string, flags int) string](#clean)
    * [func commentEscape(w io.Writer, text string, nice bool)](#commentEscape)
    * [func commonPrefix(a, b string) string](#commonPrefix)
    * [func convertQuotes(text string) string](#convertQuotes)
    * [func copyConstType(typ ast.Expr, pos token.Pos) ast.Expr](#copyConstType)
    * [func emphasize(w io.Writer, line string, words map[string]string, nice bool)](#emphasize)
    * [func exampleOutput(b *ast.BlockStmt, comments []*ast.CommentGroup) (output string, unordered, ok bool)](#exampleOutput)
    * [func fields(typ ast.Expr) (list []*ast.Field, isStruct bool)](#fields)
    * [func filterCompositeLit(lit *ast.CompositeLit, filter Filter, export bool)](#filterCompositeLit)
    * [func filterExprList(list []ast.Expr, filter Filter, export bool) []ast.Expr](#filterExprList)
    * [func filterFuncs(a []*Func, f Filter) []*Func](#filterFuncs)
    * [func filterIdentList(list []*ast.Ident) []*ast.Ident](#filterIdentList)
    * [func filterTypes(a []*Type, f Filter) []*Type](#filterTypes)
    * [func filterValues(a []*Value, f Filter) []*Value](#filterValues)
    * [func firstSentenceLen(s string) int](#firstSentenceLen)
    * [func hasExportedName(list []*ast.Ident) bool](#hasExportedName)
    * [func heading(line string) string](#heading)
    * [func indentFmt(indent, s string) string](#indentFmt)
    * [func indentLen(s string) int](#indentLen)
    * [func isBlank(s string) bool](#isBlank)
    * [func isExampleSuffix(s string) bool](#isExampleSuffix)
    * [func isGoFile(fi fs.FileInfo) bool](#isGoFile)
    * [func isTest(name, prefix string) bool](#isTest)
    * [func lastComment(b *ast.BlockStmt, c []*ast.CommentGroup) (i int, last *ast.CommentGroup)](#lastComment)
    * [func matchDecl(d *ast.GenDecl, f Filter) bool](#matchDecl)
    * [func matchFields(fields *ast.FieldList, f Filter) bool](#matchFields)
    * [func nodeFmt(node interface{}, fset *token.FileSet) string](#nodeFmt)
    * [func noteBodies(notes []*Note) []string](#noteBodies)
    * [func playExample(file *ast.File, f *ast.FuncDecl) *ast.File](#playExample)
    * [func playExampleFile(file *ast.File) *ast.File](#playExampleFile)
    * [func readTemplate(filename string) *template.Template](#readTemplate)
    * [func recvString(recv ast.Expr) string](#recvString)
    * [func removeErrorField(ityp *ast.InterfaceType)](#removeErrorField)
    * [func removeStar(s string) string](#removeStar)
    * [func simpleImporter(imports map[string]*ast.Object, path string) (*ast.Object, error)](#simpleImporter)
    * [func sortBy(less func(i, j int) bool, swap func(i, j int), n int)](#sortBy)
    * [func sortedFuncs(m methodSet, allMethods bool) []*Func](#sortedFuncs)
    * [func sortedKeys(m map[string]int) []string](#sortedKeys)
    * [func sortedTypes(m map[string]*namedType, allMethods bool) []*Type](#sortedTypes)
    * [func sortedValues(m []*Value, tok token.Token) []*Value](#sortedValues)
    * [func sortingName(d *ast.GenDecl) string](#sortingName)
    * [func specNames(specs []ast.Spec) []string](#specNames)
    * [func splitExampleName(s string, i int) (prefix, suffix string, ok bool)](#splitExampleName)
    * [func stripOutputComment(body *ast.BlockStmt, comments []*ast.CommentGroup) (*ast.BlockStmt, []*ast.CommentGroup)](#stripOutputComment)
    * [func synopsisFmt(s string) string](#synopsisFmt)
    * [func test(t *testing.T, mode Mode)](#test)
    * [func unindent(block []string)](#unindent)
    * [func updateIdentList(list []*ast.Ident) (hasExported bool)](#updateIdentList)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="AllDecls" href="#AllDecls">const AllDecls</a>

```
searchKey: doc.AllDecls
tags: [constant number]
```

```Go
const AllDecls Mode = 1 << iota
```

AllDecls says to extract documentation for all package-level declarations, not just exported ones. 

### <a id="AllMethods" href="#AllMethods">const AllMethods</a>

```
searchKey: doc.AllMethods
tags: [constant number]
```

```Go
const AllMethods
```

AllMethods says to show all embedded methods, not just the ones of invisible (unexported) anonymous fields. 

### <a id="PreserveAST" href="#PreserveAST">const PreserveAST</a>

```
searchKey: doc.PreserveAST
tags: [constant number]
```

```Go
const PreserveAST
```

PreserveAST says to leave the AST unmodified. Originally, pieces of the AST such as function bodies were nil-ed out to save memory in godoc, but not all programs want that behavior. 

### <a id="dataDir" href="#dataDir">const dataDir</a>

```
searchKey: doc.dataDir
tags: [constant string private]
```

```Go
const dataDir = "testdata"
```

### <a id="hostPart" href="#hostPart">const hostPart</a>

```
searchKey: doc.hostPart
tags: [constant string private]
```

```Go
const hostPart = `([a-zA-Z0-9_@\-.\[\]:]+)`
```

host (required) e.g. www.example.com or [::1]:8080 

### <a id="identRx" href="#identRx">const identRx</a>

```
searchKey: doc.identRx
tags: [constant string private]
```

```Go
const identRx = `[\pL_][\pL_0-9]*`
```

Regexp for Go identifiers 

### <a id="keepNL" href="#keepNL">const keepNL</a>

```
searchKey: doc.keepNL
tags: [constant number private]
```

```Go
const keepNL = 1 << iota
```

### <a id="ldquo" href="#ldquo">const ldquo</a>

```
searchKey: doc.ldquo
tags: [constant string private]
```

```Go
const ldquo = "&ldquo;"
```

### <a id="opHead" href="#opHead">const opHead</a>

```
searchKey: doc.opHead
tags: [constant number private]
```

```Go
const opHead
```

### <a id="opPara" href="#opPara">const opPara</a>

```
searchKey: doc.opPara
tags: [constant number private]
```

```Go
const opPara op = iota
```

### <a id="opPre" href="#opPre">const opPre</a>

```
searchKey: doc.opPre
tags: [constant number private]
```

```Go
const opPre
```

### <a id="pathPart" href="#pathPart">const pathPart</a>

```
searchKey: doc.pathPart
tags: [constant string private]
```

```Go
const pathPart = `([.,:;?!]*[a-zA-Z0-9$'()*+&#=@~_/\-\[\]%])*`
```

path+query+fragment (optional) e.g. /path/index.html?q=foo#bar 

### <a id="protoPart" href="#protoPart">const protoPart</a>

```
searchKey: doc.protoPart
tags: [constant string private]
```

```Go
const protoPart = `(https?|ftp|file|gopher|mailto|nntp)`
```

protocol (required) e.g. http 

### <a id="rdquo" href="#rdquo">const rdquo</a>

```
searchKey: doc.rdquo
tags: [constant string private]
```

```Go
const rdquo = "&rdquo;"
```

### <a id="ulquo" href="#ulquo">const ulquo</a>

```
searchKey: doc.ulquo
tags: [constant string private]
```

```Go
const ulquo = "“"
```

### <a id="urlRx" href="#urlRx">const urlRx</a>

```
searchKey: doc.urlRx
tags: [constant string private]
```

```Go
const urlRx = protoPart + `://` + hostPart + pathPart
```

### <a id="urquo" href="#urquo">const urquo</a>

```
searchKey: doc.urquo
tags: [constant string private]
```

```Go
const urquo = "”"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="IllegalPrefixes" href="#IllegalPrefixes">var IllegalPrefixes</a>

```
searchKey: doc.IllegalPrefixes
tags: [variable array string]
```

```Go
var IllegalPrefixes = []string{
	"copyright",
	"all rights",
	"author",
}
```

### <a id="blocksTests" href="#blocksTests">var blocksTests</a>

```
searchKey: doc.blocksTests
tags: [variable array struct private]
```

```Go
var blocksTests = ...
```

### <a id="emphasizeTests" href="#emphasizeTests">var emphasizeTests</a>

```
searchKey: doc.emphasizeTests
tags: [variable array struct private]
```

```Go
var emphasizeTests = ...
```

### <a id="files" href="#files">var files</a>

```
searchKey: doc.files
tags: [variable string private]
```

```Go
var files = flag.String("files", "", "consider only Go test files matching this regular expression")
```

### <a id="headingTests" href="#headingTests">var headingTests</a>

```
searchKey: doc.headingTests
tags: [variable array struct private]
```

```Go
var headingTests = ...
```

### <a id="htmlQuoteReplacer" href="#htmlQuoteReplacer">var htmlQuoteReplacer</a>

```
searchKey: doc.htmlQuoteReplacer
tags: [variable struct private]
```

```Go
var htmlQuoteReplacer = strings.NewReplacer(ulquo, ldquo, urquo, rdquo)
```

### <a id="html_a" href="#html_a">var html_a</a>

```
searchKey: doc.html_a
tags: [variable array number private]
```

```Go
var html_a = []byte(`<a href="`)
```

### <a id="html_aq" href="#html_aq">var html_aq</a>

```
searchKey: doc.html_aq
tags: [variable array number private]
```

```Go
var html_aq = []byte(`">`)
```

### <a id="html_enda" href="#html_enda">var html_enda</a>

```
searchKey: doc.html_enda
tags: [variable array number private]
```

```Go
var html_enda = []byte("</a>")
```

### <a id="html_endh" href="#html_endh">var html_endh</a>

```
searchKey: doc.html_endh
tags: [variable array number private]
```

```Go
var html_endh = []byte("</h3>\n")
```

### <a id="html_endi" href="#html_endi">var html_endi</a>

```
searchKey: doc.html_endi
tags: [variable array number private]
```

```Go
var html_endi = []byte("</i>")
```

### <a id="html_endp" href="#html_endp">var html_endp</a>

```
searchKey: doc.html_endp
tags: [variable array number private]
```

```Go
var html_endp = []byte("</p>\n")
```

### <a id="html_endpre" href="#html_endpre">var html_endpre</a>

```
searchKey: doc.html_endpre
tags: [variable array number private]
```

```Go
var html_endpre = []byte("</pre>\n")
```

### <a id="html_h" href="#html_h">var html_h</a>

```
searchKey: doc.html_h
tags: [variable array number private]
```

```Go
var html_h = []byte(`<h3 id="`)
```

### <a id="html_hq" href="#html_hq">var html_hq</a>

```
searchKey: doc.html_hq
tags: [variable array number private]
```

```Go
var html_hq = []byte(`">`)
```

### <a id="html_i" href="#html_i">var html_i</a>

```
searchKey: doc.html_i
tags: [variable array number private]
```

```Go
var html_i = []byte("<i>")
```

### <a id="html_p" href="#html_p">var html_p</a>

```
searchKey: doc.html_p
tags: [variable array number private]
```

```Go
var html_p = []byte("<p>\n")
```

### <a id="html_pre" href="#html_pre">var html_pre</a>

```
searchKey: doc.html_pre
tags: [variable array number private]
```

```Go
var html_pre = []byte("<pre>")
```

### <a id="matchRx" href="#matchRx">var matchRx</a>

```
searchKey: doc.matchRx
tags: [variable struct private]
```

```Go
var matchRx = lazyregexp.New(`(` + urlRx + `)|(` + identRx + `)`)
```

### <a id="nl" href="#nl">var nl</a>

```
searchKey: doc.nl
tags: [variable array number private]
```

```Go
var nl = []byte("\n")
```

### <a id="nonAlphaNumRx" href="#nonAlphaNumRx">var nonAlphaNumRx</a>

```
searchKey: doc.nonAlphaNumRx
tags: [variable struct private]
```

```Go
var nonAlphaNumRx = lazyregexp.New(`[^a-zA-Z0-9]`)
```

### <a id="noteCommentRx" href="#noteCommentRx">var noteCommentRx</a>

```
searchKey: doc.noteCommentRx
tags: [variable struct private]
```

```Go
var noteCommentRx = lazyregexp.New(`^/[/*][ \t]*` + noteMarker) // MARKER(uid) at comment start

```

### <a id="noteMarker" href="#noteMarker">var noteMarker</a>

```
searchKey: doc.noteMarker
tags: [variable string private]
```

```Go
var noteMarker // MARKER(uid), MARKER at least 2 chars, uid at least 1 char
 = ...
```

### <a id="noteMarkerRx" href="#noteMarkerRx">var noteMarkerRx</a>

```
searchKey: doc.noteMarkerRx
tags: [variable struct private]
```

```Go
var noteMarkerRx = lazyregexp.New(`^[ \t]*` + noteMarker) // MARKER(uid) at text start

```

### <a id="outputPrefix" href="#outputPrefix">var outputPrefix</a>

```
searchKey: doc.outputPrefix
tags: [variable struct private]
```

```Go
var outputPrefix = lazyregexp.New(`(?i)^[[:space:]]*(unordered )?output:`)
```

### <a id="predeclaredConstants" href="#predeclaredConstants">var predeclaredConstants</a>

```
searchKey: doc.predeclaredConstants
tags: [variable object private]
```

```Go
var predeclaredConstants = ...
```

### <a id="predeclaredFuncs" href="#predeclaredFuncs">var predeclaredFuncs</a>

```
searchKey: doc.predeclaredFuncs
tags: [variable object private]
```

```Go
var predeclaredFuncs = ...
```

### <a id="predeclaredTypes" href="#predeclaredTypes">var predeclaredTypes</a>

```
searchKey: doc.predeclaredTypes
tags: [variable object private]
```

```Go
var predeclaredTypes = ...
```

### <a id="prefix" href="#prefix">var prefix</a>

```
searchKey: doc.prefix
tags: [variable array number private]
```

```Go
var prefix = []byte("// ")
```

### <a id="space" href="#space">var space</a>

```
searchKey: doc.space
tags: [variable array number private]
```

```Go
var space = []byte(" ")
```

### <a id="templateTxt" href="#templateTxt">var templateTxt</a>

```
searchKey: doc.templateTxt
tags: [variable struct private]
```

```Go
var templateTxt = readTemplate("template.txt")
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: doc.tests
tags: [variable array struct private]
```

```Go
var tests = ...
```

### <a id="underscore" href="#underscore">var underscore</a>

```
searchKey: doc.underscore
tags: [variable struct private]
```

```Go
var underscore = ast.NewIdent("_")
```

### <a id="unicodeQuoteReplacer" href="#unicodeQuoteReplacer">var unicodeQuoteReplacer</a>

```
searchKey: doc.unicodeQuoteReplacer
tags: [variable struct private]
```

```Go
var unicodeQuoteReplacer = strings.NewReplacer("``", ulquo, "''", urquo)
```

### <a id="update" href="#update">var update</a>

```
searchKey: doc.update
tags: [variable boolean private]
```

```Go
var update = flag.Bool("update", false, "update golden (.out) files")
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Example" href="#Example">type Example struct</a>

```
searchKey: doc.Example
tags: [struct]
```

```Go
type Example struct {
	Name        string // name of the item being exemplified (including optional suffix)
	Suffix      string // example suffix, without leading '_' (only populated by NewFromFiles)
	Doc         string // example function doc string
	Code        ast.Node
	Play        *ast.File // a whole program version of the example
	Comments    []*ast.CommentGroup
	Output      string // expected output
	Unordered   bool
	EmptyOutput bool // expect empty output
	Order       int  // original source code order
}
```

An Example represents an example function found in a test source file. 

### <a id="Filter" href="#Filter">type Filter func(string) bool</a>

```
searchKey: doc.Filter
tags: [function]
```

```Go
type Filter func(string) bool
```

### <a id="Func" href="#Func">type Func struct</a>

```
searchKey: doc.Func
tags: [struct]
```

```Go
type Func struct {
	Doc  string
	Name string
	Decl *ast.FuncDecl

	// methods
	// (for functions, these fields have the respective zero value)
	Recv  string // actual   receiver "T" or "*T"
	Orig  string // original receiver "T" or "*T"
	Level int    // embedding level; 0 means not embedded

	// Examples is a sorted list of examples associated with this
	// function or method. Examples are extracted from _test.go files
	// provided to NewFromFiles.
	Examples []*Example
}
```

Func is the documentation for a func declaration. 

#### <a id="customizeRecv" href="#customizeRecv">func customizeRecv(f *Func, recvTypeName string, embeddedIsPtr bool, level int) *Func</a>

```
searchKey: doc.customizeRecv
tags: [method private]
```

```Go
func customizeRecv(f *Func, recvTypeName string, embeddedIsPtr bool, level int) *Func
```

### <a id="Mode" href="#Mode">type Mode int</a>

```
searchKey: doc.Mode
tags: [number]
```

```Go
type Mode int
```

Mode values control the operation of New and NewFromFiles. 

### <a id="Note" href="#Note">type Note struct</a>

```
searchKey: doc.Note
tags: [struct]
```

```Go
type Note struct {
	Pos, End token.Pos // position range of the comment containing the marker
	UID      string    // uid found with the marker
	Body     string    // note body text
}
```

A Note represents a marked comment starting with "MARKER(uid): note body". Any note with a marker of 2 or more upper case [A-Z] letters and a uid of at least one character is recognized. The ":" following the uid is optional. Notes are collected in the Package.Notes map indexed by the notes marker. 

### <a id="Package" href="#Package">type Package struct</a>

```
searchKey: doc.Package
tags: [struct]
```

```Go
type Package struct {
	Doc        string
	Name       string
	ImportPath string
	Imports    []string
	Filenames  []string
	Notes      map[string][]*Note

	// Deprecated: For backward compatibility Bugs is still populated,
	// but all new code should use Notes instead.
	Bugs []string

	// declarations
	Consts []*Value
	Types  []*Type
	Vars   []*Value
	Funcs  []*Func

	// Examples is a sorted list of examples associated with
	// the package. Examples are extracted from _test.go files
	// provided to NewFromFiles.
	Examples []*Example
}
```

Package is the documentation for an entire package. 

#### <a id="New" href="#New">func New(pkg *ast.Package, importPath string, mode Mode) *Package</a>

```
searchKey: doc.New
tags: [method]
```

```Go
func New(pkg *ast.Package, importPath string, mode Mode) *Package
```

New computes the package documentation for the given package AST. New takes ownership of the AST pkg and may edit or overwrite it. To have the Examples fields populated, use NewFromFiles and include the package's _test.go files. 

#### <a id="NewFromFiles" href="#NewFromFiles">func NewFromFiles(fset *token.FileSet, files []*ast.File, importPath string, opts ...interface{}) (*Package, error)</a>

```
searchKey: doc.NewFromFiles
tags: [method]
```

```Go
func NewFromFiles(fset *token.FileSet, files []*ast.File, importPath string, opts ...interface{}) (*Package, error)
```

NewFromFiles computes documentation for a package. 

The package is specified by a list of *ast.Files and corresponding file set, which must not be nil. NewFromFiles uses all provided files when computing documentation, so it is the caller's responsibility to provide only the files that match the desired build context. "go/build".Context.MatchFile can be used for determining whether a file matches a build context with the desired GOOS and GOARCH values, and other build constraints. The import path of the package is specified by importPath. 

Examples found in _test.go files are associated with the corresponding type, function, method, or the package, based on their name. If the example has a suffix in its name, it is set in the Example.Suffix field. Examples with malformed names are skipped. 

Optionally, a single extra argument of type Mode can be provided to control low-level aspects of the documentation extraction behavior. 

NewFromFiles takes ownership of the AST files and may edit them, unless the PreserveAST Mode bit is on. 

#### <a id="Package.Filter" href="#Package.Filter">func (p *Package) Filter(f Filter)</a>

```
searchKey: doc.Package.Filter
tags: [method]
```

```Go
func (p *Package) Filter(f Filter)
```

Filter eliminates documentation for names that don't pass through the filter f. TODO(gri): Recognize "Type.Method" as a name. 

### <a id="Type" href="#Type">type Type struct</a>

```
searchKey: doc.Type
tags: [struct]
```

```Go
type Type struct {
	Doc  string
	Name string
	Decl *ast.GenDecl

	// associated declarations
	Consts  []*Value // sorted list of constants of (mostly) this type
	Vars    []*Value // sorted list of variables of (mostly) this type
	Funcs   []*Func  // sorted list of functions returning this type
	Methods []*Func  // sorted list of methods (including embedded ones) of this type

	// Examples is a sorted list of examples associated with
	// this type. Examples are extracted from _test.go files
	// provided to NewFromFiles.
	Examples []*Example
}
```

Type is the documentation for a type declaration. 

### <a id="Value" href="#Value">type Value struct</a>

```
searchKey: doc.Value
tags: [struct]
```

```Go
type Value struct {
	Doc   string
	Names []string // var or const names in declaration order
	Decl  *ast.GenDecl

	order int
}
```

Value is the documentation for a (possibly grouped) var or const declaration. 

### <a id="block" href="#block">type block struct</a>

```
searchKey: doc.block
tags: [struct private]
```

```Go
type block struct {
	op    op
	lines []string
}
```

### <a id="bundle" href="#bundle">type bundle struct</a>

```
searchKey: doc.bundle
tags: [struct private]
```

```Go
type bundle struct {
	*Package
	FSet *token.FileSet
}
```

### <a id="data" href="#data">type data struct</a>

```
searchKey: doc.data
tags: [struct private]
```

```Go
type data struct {
	n    int
	swap func(i, j int)
	less func(i, j int) bool
}
```

#### <a id="data.Len" href="#data.Len">func (d *data) Len() int</a>

```
searchKey: doc.data.Len
tags: [function private]
```

```Go
func (d *data) Len() int
```

#### <a id="data.Less" href="#data.Less">func (d *data) Less(i, j int) bool</a>

```
searchKey: doc.data.Less
tags: [method private]
```

```Go
func (d *data) Less(i, j int) bool
```

#### <a id="data.Swap" href="#data.Swap">func (d *data) Swap(i, j int)</a>

```
searchKey: doc.data.Swap
tags: [method private]
```

```Go
func (d *data) Swap(i, j int)
```

### <a id="embeddedSet" href="#embeddedSet">type embeddedSet map[*doc.namedType]bool</a>

```
searchKey: doc.embeddedSet
tags: [object private]
```

```Go
type embeddedSet map[*namedType]bool
```

An embeddedSet describes a set of embedded types. 

### <a id="lineWrapper" href="#lineWrapper">type lineWrapper struct</a>

```
searchKey: doc.lineWrapper
tags: [struct private]
```

```Go
type lineWrapper struct {
	out       io.Writer
	printed   bool
	width     int
	indent    string
	n         int
	pendSpace int
}
```

#### <a id="lineWrapper.flush" href="#lineWrapper.flush">func (l *lineWrapper) flush()</a>

```
searchKey: doc.lineWrapper.flush
tags: [function private]
```

```Go
func (l *lineWrapper) flush()
```

#### <a id="lineWrapper.write" href="#lineWrapper.write">func (l *lineWrapper) write(text string)</a>

```
searchKey: doc.lineWrapper.write
tags: [method private]
```

```Go
func (l *lineWrapper) write(text string)
```

### <a id="methodSet" href="#methodSet">type methodSet map[string]*doc.Func</a>

```
searchKey: doc.methodSet
tags: [object private]
```

```Go
type methodSet map[string]*Func
```

A methodSet describes a set of methods. Entries where Decl == nil are conflict entries (more than one method with the same name at the same embedding level). 

#### <a id="methodSet.add" href="#methodSet.add">func (mset methodSet) add(m *Func)</a>

```
searchKey: doc.methodSet.add
tags: [method private]
```

```Go
func (mset methodSet) add(m *Func)
```

add adds method m to the method set; m is ignored if the method set already contains a method with the same name at the same or a higher level than m. 

#### <a id="methodSet.set" href="#methodSet.set">func (mset methodSet) set(f *ast.FuncDecl, preserveAST bool)</a>

```
searchKey: doc.methodSet.set
tags: [method private]
```

```Go
func (mset methodSet) set(f *ast.FuncDecl, preserveAST bool)
```

set creates the corresponding Func for f and adds it to mset. If there are multiple f's with the same name, set keeps the first one with documentation; conflicts are ignored. The boolean specifies whether to leave the AST untouched. 

### <a id="namedType" href="#namedType">type namedType struct</a>

```
searchKey: doc.namedType
tags: [struct private]
```

```Go
type namedType struct {
	doc  string       // doc comment for type
	name string       // type name
	decl *ast.GenDecl // nil if declaration hasn't been seen yet

	isEmbedded bool        // true if this type is embedded
	isStruct   bool        // true if this type is a struct
	embedded   embeddedSet // true if the embedded type is a pointer

	// associated declarations
	values  []*Value // consts and vars
	funcs   methodSet
	methods methodSet
}
```

A namedType represents a named unqualified (package local, or possibly predeclared) type. The namedType for a type name is always found via reader.lookupType. 

### <a id="op" href="#op">type op int</a>

```
searchKey: doc.op
tags: [number private]
```

```Go
type op int
```

### <a id="reader" href="#reader">type reader struct</a>

```
searchKey: doc.reader
tags: [struct private]
```

```Go
type reader struct {
	mode Mode

	// package properties
	doc       string // package documentation, if any
	filenames []string
	notes     map[string][]*Note

	// declarations
	imports   map[string]int
	hasDotImp bool     // if set, package contains a dot import
	values    []*Value // consts and vars
	order     int      // sort order of const and var declarations (when we can't use a name)
	types     map[string]*namedType
	funcs     methodSet

	// support for package-local error type declarations
	errorDecl bool                 // if set, type "error" was declared locally
	fixlist   []*ast.InterfaceType // list of interfaces containing anonymous field "error"
}
```

reader accumulates documentation for a single package. It modifies the AST: Comments (declaration documentation) that have been collected by the reader are set to nil in the respective AST nodes so that they are not printed twice (once when printing the documentation and once when printing the corresponding AST node). 

#### <a id="reader.cleanupTypes" href="#reader.cleanupTypes">func (r *reader) cleanupTypes()</a>

```
searchKey: doc.reader.cleanupTypes
tags: [function private]
```

```Go
func (r *reader) cleanupTypes()
```

cleanupTypes removes the association of functions and methods with types that have no declaration. Instead, these functions and methods are shown at the package level. It also removes types with missing declarations or which are not visible. 

#### <a id="reader.collectEmbeddedMethods" href="#reader.collectEmbeddedMethods">func (r *reader) collectEmbeddedMethods(mset methodSet, typ *namedType, recvTypeName string, embeddedIsPtr bool, level int, visited embeddedSet)</a>

```
searchKey: doc.reader.collectEmbeddedMethods
tags: [method private]
```

```Go
func (r *reader) collectEmbeddedMethods(mset methodSet, typ *namedType, recvTypeName string, embeddedIsPtr bool, level int, visited embeddedSet)
```

collectEmbeddedMethods collects the embedded methods of typ in mset. 

#### <a id="reader.computeMethodSets" href="#reader.computeMethodSets">func (r *reader) computeMethodSets()</a>

```
searchKey: doc.reader.computeMethodSets
tags: [function private]
```

```Go
func (r *reader) computeMethodSets()
```

computeMethodSets determines the actual method sets for each type encountered. 

#### <a id="reader.fileExports" href="#reader.fileExports">func (r *reader) fileExports(src *ast.File)</a>

```
searchKey: doc.reader.fileExports
tags: [method private]
```

```Go
func (r *reader) fileExports(src *ast.File)
```

fileExports removes unexported declarations from src in place. 

#### <a id="reader.filterDecl" href="#reader.filterDecl">func (r *reader) filterDecl(decl ast.Decl) bool</a>

```
searchKey: doc.reader.filterDecl
tags: [method private]
```

```Go
func (r *reader) filterDecl(decl ast.Decl) bool
```

#### <a id="reader.filterFieldList" href="#reader.filterFieldList">func (r *reader) filterFieldList(parent *namedType, fields *ast.FieldList, ityp *ast.InterfaceType) (removedFields bool)</a>

```
searchKey: doc.reader.filterFieldList
tags: [method private]
```

```Go
func (r *reader) filterFieldList(parent *namedType, fields *ast.FieldList, ityp *ast.InterfaceType) (removedFields bool)
```

filterFieldList removes unexported fields (field names) from the field list in place and reports whether fields were removed. Anonymous fields are recorded with the parent type. filterType is called with the types of all remaining fields. 

#### <a id="reader.filterParamList" href="#reader.filterParamList">func (r *reader) filterParamList(fields *ast.FieldList)</a>

```
searchKey: doc.reader.filterParamList
tags: [method private]
```

```Go
func (r *reader) filterParamList(fields *ast.FieldList)
```

filterParamList applies filterType to each parameter type in fields. 

#### <a id="reader.filterSpec" href="#reader.filterSpec">func (r *reader) filterSpec(spec ast.Spec) bool</a>

```
searchKey: doc.reader.filterSpec
tags: [method private]
```

```Go
func (r *reader) filterSpec(spec ast.Spec) bool
```

#### <a id="reader.filterSpecList" href="#reader.filterSpecList">func (r *reader) filterSpecList(list []ast.Spec, tok token.Token) []ast.Spec</a>

```
searchKey: doc.reader.filterSpecList
tags: [method private]
```

```Go
func (r *reader) filterSpecList(list []ast.Spec, tok token.Token) []ast.Spec
```

#### <a id="reader.filterType" href="#reader.filterType">func (r *reader) filterType(parent *namedType, typ ast.Expr)</a>

```
searchKey: doc.reader.filterType
tags: [method private]
```

```Go
func (r *reader) filterType(parent *namedType, typ ast.Expr)
```

filterType strips any unexported struct fields or method types from typ in place. If fields (or methods) have been removed, the corresponding struct or interface type has the Incomplete field set to true. 

#### <a id="reader.isPredeclared" href="#reader.isPredeclared">func (r *reader) isPredeclared(n string) bool</a>

```
searchKey: doc.reader.isPredeclared
tags: [method private]
```

```Go
func (r *reader) isPredeclared(n string) bool
```

isPredeclared reports whether n denotes a predeclared type. 

#### <a id="reader.isVisible" href="#reader.isVisible">func (r *reader) isVisible(name string) bool</a>

```
searchKey: doc.reader.isVisible
tags: [method private]
```

```Go
func (r *reader) isVisible(name string) bool
```

#### <a id="reader.lookupType" href="#reader.lookupType">func (r *reader) lookupType(name string) *namedType</a>

```
searchKey: doc.reader.lookupType
tags: [method private]
```

```Go
func (r *reader) lookupType(name string) *namedType
```

lookupType returns the base type with the given name. If the base type has not been encountered yet, a new type with the given name but no associated declaration is added to the type map. 

#### <a id="reader.readDoc" href="#reader.readDoc">func (r *reader) readDoc(comment *ast.CommentGroup)</a>

```
searchKey: doc.reader.readDoc
tags: [method private]
```

```Go
func (r *reader) readDoc(comment *ast.CommentGroup)
```

#### <a id="reader.readFile" href="#reader.readFile">func (r *reader) readFile(src *ast.File)</a>

```
searchKey: doc.reader.readFile
tags: [method private]
```

```Go
func (r *reader) readFile(src *ast.File)
```

readFile adds the AST for a source file to the reader. 

#### <a id="reader.readFunc" href="#reader.readFunc">func (r *reader) readFunc(fun *ast.FuncDecl)</a>

```
searchKey: doc.reader.readFunc
tags: [method private]
```

```Go
func (r *reader) readFunc(fun *ast.FuncDecl)
```

readFunc processes a func or method declaration. 

#### <a id="reader.readNote" href="#reader.readNote">func (r *reader) readNote(list []*ast.Comment)</a>

```
searchKey: doc.reader.readNote
tags: [method private]
```

```Go
func (r *reader) readNote(list []*ast.Comment)
```

readNote collects a single note from a sequence of comments. 

#### <a id="reader.readNotes" href="#reader.readNotes">func (r *reader) readNotes(comments []*ast.CommentGroup)</a>

```
searchKey: doc.reader.readNotes
tags: [method private]
```

```Go
func (r *reader) readNotes(comments []*ast.CommentGroup)
```

readNotes extracts notes from comments. A note must start at the beginning of a comment with "MARKER(uid):" and is followed by the note body (e.g., "// BUG(gri): fix this"). The note ends at the end of the comment group or at the start of another note in the same comment group, whichever comes first. 

#### <a id="reader.readPackage" href="#reader.readPackage">func (r *reader) readPackage(pkg *ast.Package, mode Mode)</a>

```
searchKey: doc.reader.readPackage
tags: [method private]
```

```Go
func (r *reader) readPackage(pkg *ast.Package, mode Mode)
```

#### <a id="reader.readType" href="#reader.readType">func (r *reader) readType(decl *ast.GenDecl, spec *ast.TypeSpec)</a>

```
searchKey: doc.reader.readType
tags: [method private]
```

```Go
func (r *reader) readType(decl *ast.GenDecl, spec *ast.TypeSpec)
```

readType processes a type declaration. 

#### <a id="reader.readValue" href="#reader.readValue">func (r *reader) readValue(decl *ast.GenDecl)</a>

```
searchKey: doc.reader.readValue
tags: [method private]
```

```Go
func (r *reader) readValue(decl *ast.GenDecl)
```

readValue processes a const or var declaration. 

#### <a id="reader.recordAnonymousField" href="#reader.recordAnonymousField">func (r *reader) recordAnonymousField(parent *namedType, fieldType ast.Expr) (fname string)</a>

```
searchKey: doc.reader.recordAnonymousField
tags: [method private]
```

```Go
func (r *reader) recordAnonymousField(parent *namedType, fieldType ast.Expr) (fname string)
```

recordAnonymousField registers fieldType as the type of an anonymous field in the parent type. If the field is imported (qualified name) or the parent is nil, the field is ignored. The function returns the field name. 

#### <a id="reader.remember" href="#reader.remember">func (r *reader) remember(typ *ast.InterfaceType)</a>

```
searchKey: doc.reader.remember
tags: [method private]
```

```Go
func (r *reader) remember(typ *ast.InterfaceType)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="Examples" href="#Examples">func Examples(testFiles ...*ast.File) []*Example</a>

```
searchKey: doc.Examples
tags: [method]
```

```Go
func Examples(testFiles ...*ast.File) []*Example
```

Examples returns the examples found in testFiles, sorted by Name field. The Order fields record the order in which the examples were encountered. The Suffix field is not populated when Examples is called directly, it is only populated by NewFromFiles for examples it finds in _test.go files. 

Playable Examples must be in a package whose name ends in "_test". An Example is "playable" (the Play field is non-nil) in either of these circumstances: 

```
- The example function is self-contained: the function references only
  identifiers from other packages (or predeclared identifiers, such as
  "int") and the test file does not include a dot import.
- The entire test file is the example: the file contains exactly one
  example function, zero test or benchmark functions, and at least one
  top-level function, type, variable, or constant declaration other
  than the example function.

```
### <a id="IsPredeclared" href="#IsPredeclared">func IsPredeclared(s string) bool</a>

```
searchKey: doc.IsPredeclared
tags: [method]
```

```Go
func IsPredeclared(s string) bool
```

IsPredeclared reports whether s is a predeclared identifier. 

### <a id="Synopsis" href="#Synopsis">func Synopsis(s string) string</a>

```
searchKey: doc.Synopsis
tags: [method]
```

```Go
func Synopsis(s string) string
```

Synopsis returns a cleaned version of the first sentence in s. That sentence ends after the first period followed by space and not preceded by exactly one uppercase letter. The result string has no \n, \r, or \t characters and uses only single spaces between words. If s starts with any of the IllegalPrefixes, the result is the empty string. 

### <a id="Test" href="#Test">func Test(t *testing.T)</a>

```
searchKey: doc.Test
tags: [method private test]
```

```Go
func Test(t *testing.T)
```

### <a id="TestAnchorID" href="#TestAnchorID">func TestAnchorID(t *testing.T)</a>

```
searchKey: doc.TestAnchorID
tags: [method private test]
```

```Go
func TestAnchorID(t *testing.T)
```

### <a id="TestBlocks" href="#TestBlocks">func TestBlocks(t *testing.T)</a>

```
searchKey: doc.TestBlocks
tags: [method private test]
```

```Go
func TestBlocks(t *testing.T)
```

### <a id="TestCommentEscape" href="#TestCommentEscape">func TestCommentEscape(t *testing.T)</a>

```
searchKey: doc.TestCommentEscape
tags: [method private test]
```

```Go
func TestCommentEscape(t *testing.T)
```

### <a id="TestEmphasize" href="#TestEmphasize">func TestEmphasize(t *testing.T)</a>

```
searchKey: doc.TestEmphasize
tags: [method private test]
```

```Go
func TestEmphasize(t *testing.T)
```

### <a id="TestIsHeading" href="#TestIsHeading">func TestIsHeading(t *testing.T)</a>

```
searchKey: doc.TestIsHeading
tags: [method private test]
```

```Go
func TestIsHeading(t *testing.T)
```

### <a id="TestSynopsis" href="#TestSynopsis">func TestSynopsis(t *testing.T)</a>

```
searchKey: doc.TestSynopsis
tags: [method private test]
```

```Go
func TestSynopsis(t *testing.T)
```

### <a id="TestToText" href="#TestToText">func TestToText(t *testing.T)</a>

```
searchKey: doc.TestToText
tags: [method private test]
```

```Go
func TestToText(t *testing.T)
```

### <a id="ToHTML" href="#ToHTML">func ToHTML(w io.Writer, text string, words map[string]string)</a>

```
searchKey: doc.ToHTML
tags: [method]
```

```Go
func ToHTML(w io.Writer, text string, words map[string]string)
```

ToHTML converts comment text to formatted HTML. The comment was prepared by DocReader, so it is known not to have leading, trailing blank lines nor to have trailing spaces at the end of lines. The comment markers have already been removed. 

Each span of unindented non-blank lines is converted into a single paragraph. There is one exception to the rule: a span that consists of a single line, is followed by another paragraph span, begins with a capital letter, and contains no punctuation other than parentheses and commas is formatted as a heading. 

A span of indented lines is converted into a <pre> block, with the common indent prefix removed. 

URLs in the comment text are converted into links; if the URL also appears in the words map, the link is taken from the map (if the corresponding map value is the empty string, the URL is not converted into a link). 

A pair of (consecutive) backticks (`) is converted to a unicode left quote (“), and a pair of (consecutive) single quotes (') is converted to a unicode right quote (”). 

Go identifiers that appear in the words map are italicized; if the corresponding map value is not the empty string, it is considered a URL and the word is converted into a link. 

### <a id="ToText" href="#ToText">func ToText(w io.Writer, text string, indent, preIndent string, width int)</a>

```
searchKey: doc.ToText
tags: [method]
```

```Go
func ToText(w io.Writer, text string, indent, preIndent string, width int)
```

ToText prepares comment text for presentation in textual output. It wraps paragraphs of text to width or fewer Unicode code points and then prefixes each line with the indent. In preformatted sections (such as program text), it prefixes each non-blank line with preIndent. 

A pair of (consecutive) backticks (`) is converted to a unicode left quote (“), and a pair of (consecutive) single quotes (') is converted to a unicode right quote (”). 

### <a id="anchorID" href="#anchorID">func anchorID(line string) string</a>

```
searchKey: doc.anchorID
tags: [method private]
```

```Go
func anchorID(line string) string
```

### <a id="baseTypeName" href="#baseTypeName">func baseTypeName(x ast.Expr) (name string, imported bool)</a>

```
searchKey: doc.baseTypeName
tags: [method private]
```

```Go
func baseTypeName(x ast.Expr) (name string, imported bool)
```

baseTypeName returns the name of the base type of x (or "") and whether the type is imported or not. 

### <a id="blocks" href="#blocks">func blocks(text string) []block</a>

```
searchKey: doc.blocks
tags: [method private]
```

```Go
func blocks(text string) []block
```

### <a id="classifyExamples" href="#classifyExamples">func classifyExamples(p *Package, examples []*Example)</a>

```
searchKey: doc.classifyExamples
tags: [method private]
```

```Go
func classifyExamples(p *Package, examples []*Example)
```

classifyExamples classifies examples and assigns them to the Examples field of the relevant Func, Type, or Package that the example is associated with. 

The classification process is ambiguous in some cases: 

```
- ExampleFoo_Bar matches a type named Foo_Bar
  or a method named Foo.Bar.
- ExampleFoo_bar matches a type named Foo_bar
  or Foo (with a "bar" suffix).

```
Examples with malformed names are not associated with anything. 

### <a id="clean" href="#clean">func clean(s string, flags int) string</a>

```
searchKey: doc.clean
tags: [method private]
```

```Go
func clean(s string, flags int) string
```

clean replaces each sequence of space, \n, \r, or \t characters with a single space and removes any trailing and leading spaces. If the keepNL flag is set, newline characters are passed through instead of being change to spaces. 

### <a id="commentEscape" href="#commentEscape">func commentEscape(w io.Writer, text string, nice bool)</a>

```
searchKey: doc.commentEscape
tags: [method private]
```

```Go
func commentEscape(w io.Writer, text string, nice bool)
```

Escape comment text for HTML. If nice is set, also turn ` into &ldquo; and ' into &rdquo;. 

### <a id="commonPrefix" href="#commonPrefix">func commonPrefix(a, b string) string</a>

```
searchKey: doc.commonPrefix
tags: [method private]
```

```Go
func commonPrefix(a, b string) string
```

### <a id="convertQuotes" href="#convertQuotes">func convertQuotes(text string) string</a>

```
searchKey: doc.convertQuotes
tags: [method private]
```

```Go
func convertQuotes(text string) string
```

### <a id="copyConstType" href="#copyConstType">func copyConstType(typ ast.Expr, pos token.Pos) ast.Expr</a>

```
searchKey: doc.copyConstType
tags: [method private]
```

```Go
func copyConstType(typ ast.Expr, pos token.Pos) ast.Expr
```

copyConstType returns a copy of typ with position pos. typ must be a valid constant type. In practice, only (possibly qualified) identifiers are possible. 

### <a id="emphasize" href="#emphasize">func emphasize(w io.Writer, line string, words map[string]string, nice bool)</a>

```
searchKey: doc.emphasize
tags: [method private]
```

```Go
func emphasize(w io.Writer, line string, words map[string]string, nice bool)
```

Emphasize and escape a line of text for HTML. URLs are converted into links; if the URL also appears in the words map, the link is taken from the map (if the corresponding map value is the empty string, the URL is not converted into a link). Go identifiers that appear in the words map are italicized; if the corresponding map value is not the empty string, it is considered a URL and the word is converted into a link. If nice is set, the remaining text's appearance is improved where it makes sense (e.g., ` is turned into &ldquo; and ' into &rdquo;). 

### <a id="exampleOutput" href="#exampleOutput">func exampleOutput(b *ast.BlockStmt, comments []*ast.CommentGroup) (output string, unordered, ok bool)</a>

```
searchKey: doc.exampleOutput
tags: [method private]
```

```Go
func exampleOutput(b *ast.BlockStmt, comments []*ast.CommentGroup) (output string, unordered, ok bool)
```

Extracts the expected output and whether there was a valid output comment 

### <a id="fields" href="#fields">func fields(typ ast.Expr) (list []*ast.Field, isStruct bool)</a>

```
searchKey: doc.fields
tags: [method private]
```

```Go
func fields(typ ast.Expr) (list []*ast.Field, isStruct bool)
```

fields returns a struct's fields or an interface's methods. 

### <a id="filterCompositeLit" href="#filterCompositeLit">func filterCompositeLit(lit *ast.CompositeLit, filter Filter, export bool)</a>

```
searchKey: doc.filterCompositeLit
tags: [method private]
```

```Go
func filterCompositeLit(lit *ast.CompositeLit, filter Filter, export bool)
```

### <a id="filterExprList" href="#filterExprList">func filterExprList(list []ast.Expr, filter Filter, export bool) []ast.Expr</a>

```
searchKey: doc.filterExprList
tags: [method private]
```

```Go
func filterExprList(list []ast.Expr, filter Filter, export bool) []ast.Expr
```

### <a id="filterFuncs" href="#filterFuncs">func filterFuncs(a []*Func, f Filter) []*Func</a>

```
searchKey: doc.filterFuncs
tags: [method private]
```

```Go
func filterFuncs(a []*Func, f Filter) []*Func
```

### <a id="filterIdentList" href="#filterIdentList">func filterIdentList(list []*ast.Ident) []*ast.Ident</a>

```
searchKey: doc.filterIdentList
tags: [method private]
```

```Go
func filterIdentList(list []*ast.Ident) []*ast.Ident
```

filterIdentList removes unexported names from list in place and returns the resulting list. 

### <a id="filterTypes" href="#filterTypes">func filterTypes(a []*Type, f Filter) []*Type</a>

```
searchKey: doc.filterTypes
tags: [method private]
```

```Go
func filterTypes(a []*Type, f Filter) []*Type
```

### <a id="filterValues" href="#filterValues">func filterValues(a []*Value, f Filter) []*Value</a>

```
searchKey: doc.filterValues
tags: [method private]
```

```Go
func filterValues(a []*Value, f Filter) []*Value
```

### <a id="firstSentenceLen" href="#firstSentenceLen">func firstSentenceLen(s string) int</a>

```
searchKey: doc.firstSentenceLen
tags: [method private]
```

```Go
func firstSentenceLen(s string) int
```

firstSentenceLen returns the length of the first sentence in s. The sentence ends after the first period followed by space and not preceded by exactly one uppercase letter. 

### <a id="hasExportedName" href="#hasExportedName">func hasExportedName(list []*ast.Ident) bool</a>

```
searchKey: doc.hasExportedName
tags: [method private]
```

```Go
func hasExportedName(list []*ast.Ident) bool
```

hasExportedName reports whether list contains any exported names. 

### <a id="heading" href="#heading">func heading(line string) string</a>

```
searchKey: doc.heading
tags: [method private]
```

```Go
func heading(line string) string
```

heading returns the trimmed line if it passes as a section heading; otherwise it returns the empty string. 

### <a id="indentFmt" href="#indentFmt">func indentFmt(indent, s string) string</a>

```
searchKey: doc.indentFmt
tags: [method private]
```

```Go
func indentFmt(indent, s string) string
```

### <a id="indentLen" href="#indentLen">func indentLen(s string) int</a>

```
searchKey: doc.indentLen
tags: [method private]
```

```Go
func indentLen(s string) int
```

### <a id="isBlank" href="#isBlank">func isBlank(s string) bool</a>

```
searchKey: doc.isBlank
tags: [method private]
```

```Go
func isBlank(s string) bool
```

### <a id="isExampleSuffix" href="#isExampleSuffix">func isExampleSuffix(s string) bool</a>

```
searchKey: doc.isExampleSuffix
tags: [method private]
```

```Go
func isExampleSuffix(s string) bool
```

### <a id="isGoFile" href="#isGoFile">func isGoFile(fi fs.FileInfo) bool</a>

```
searchKey: doc.isGoFile
tags: [method private]
```

```Go
func isGoFile(fi fs.FileInfo) bool
```

### <a id="isTest" href="#isTest">func isTest(name, prefix string) bool</a>

```
searchKey: doc.isTest
tags: [method private]
```

```Go
func isTest(name, prefix string) bool
```

isTest tells whether name looks like a test, example, or benchmark. It is a Test (say) if there is a character after Test that is not a lower-case letter. (We don't want Testiness.) 

### <a id="lastComment" href="#lastComment">func lastComment(b *ast.BlockStmt, c []*ast.CommentGroup) (i int, last *ast.CommentGroup)</a>

```
searchKey: doc.lastComment
tags: [method private]
```

```Go
func lastComment(b *ast.BlockStmt, c []*ast.CommentGroup) (i int, last *ast.CommentGroup)
```

lastComment returns the last comment inside the provided block. 

### <a id="matchDecl" href="#matchDecl">func matchDecl(d *ast.GenDecl, f Filter) bool</a>

```
searchKey: doc.matchDecl
tags: [method private]
```

```Go
func matchDecl(d *ast.GenDecl, f Filter) bool
```

### <a id="matchFields" href="#matchFields">func matchFields(fields *ast.FieldList, f Filter) bool</a>

```
searchKey: doc.matchFields
tags: [method private]
```

```Go
func matchFields(fields *ast.FieldList, f Filter) bool
```

### <a id="nodeFmt" href="#nodeFmt">func nodeFmt(node interface{}, fset *token.FileSet) string</a>

```
searchKey: doc.nodeFmt
tags: [method private]
```

```Go
func nodeFmt(node interface{}, fset *token.FileSet) string
```

### <a id="noteBodies" href="#noteBodies">func noteBodies(notes []*Note) []string</a>

```
searchKey: doc.noteBodies
tags: [method private]
```

```Go
func noteBodies(notes []*Note) []string
```

noteBodies returns a list of note body strings given a list of notes. This is only used to populate the deprecated Package.Bugs field. 

### <a id="playExample" href="#playExample">func playExample(file *ast.File, f *ast.FuncDecl) *ast.File</a>

```
searchKey: doc.playExample
tags: [method private]
```

```Go
func playExample(file *ast.File, f *ast.FuncDecl) *ast.File
```

playExample synthesizes a new *ast.File based on the provided file with the provided function body as the body of main. 

### <a id="playExampleFile" href="#playExampleFile">func playExampleFile(file *ast.File) *ast.File</a>

```
searchKey: doc.playExampleFile
tags: [method private]
```

```Go
func playExampleFile(file *ast.File) *ast.File
```

playExampleFile takes a whole file example and synthesizes a new *ast.File such that the example is function main in package main. 

### <a id="readTemplate" href="#readTemplate">func readTemplate(filename string) *template.Template</a>

```
searchKey: doc.readTemplate
tags: [method private]
```

```Go
func readTemplate(filename string) *template.Template
```

### <a id="recvString" href="#recvString">func recvString(recv ast.Expr) string</a>

```
searchKey: doc.recvString
tags: [method private]
```

```Go
func recvString(recv ast.Expr) string
```

recvString returns a string representation of recv of the form "T", "*T", or "BADRECV" (if not a proper receiver type). 

### <a id="removeErrorField" href="#removeErrorField">func removeErrorField(ityp *ast.InterfaceType)</a>

```
searchKey: doc.removeErrorField
tags: [method private]
```

```Go
func removeErrorField(ityp *ast.InterfaceType)
```

removeErrorField removes anonymous fields named "error" from an interface. This is called when "error" has been determined to be a local name, not the predeclared type. 

### <a id="removeStar" href="#removeStar">func removeStar(s string) string</a>

```
searchKey: doc.removeStar
tags: [method private]
```

```Go
func removeStar(s string) string
```

### <a id="simpleImporter" href="#simpleImporter">func simpleImporter(imports map[string]*ast.Object, path string) (*ast.Object, error)</a>

```
searchKey: doc.simpleImporter
tags: [method private]
```

```Go
func simpleImporter(imports map[string]*ast.Object, path string) (*ast.Object, error)
```

simpleImporter returns a (dummy) package object named by the last path component of the provided package path (as is the convention for packages). This is sufficient to resolve package identifiers without doing an actual import. It never returns an error. 

### <a id="sortBy" href="#sortBy">func sortBy(less func(i, j int) bool, swap func(i, j int), n int)</a>

```
searchKey: doc.sortBy
tags: [method private]
```

```Go
func sortBy(less func(i, j int) bool, swap func(i, j int), n int)
```

sortBy is a helper function for sorting 

### <a id="sortedFuncs" href="#sortedFuncs">func sortedFuncs(m methodSet, allMethods bool) []*Func</a>

```
searchKey: doc.sortedFuncs
tags: [method private]
```

```Go
func sortedFuncs(m methodSet, allMethods bool) []*Func
```

### <a id="sortedKeys" href="#sortedKeys">func sortedKeys(m map[string]int) []string</a>

```
searchKey: doc.sortedKeys
tags: [method private]
```

```Go
func sortedKeys(m map[string]int) []string
```

### <a id="sortedTypes" href="#sortedTypes">func sortedTypes(m map[string]*namedType, allMethods bool) []*Type</a>

```
searchKey: doc.sortedTypes
tags: [method private]
```

```Go
func sortedTypes(m map[string]*namedType, allMethods bool) []*Type
```

### <a id="sortedValues" href="#sortedValues">func sortedValues(m []*Value, tok token.Token) []*Value</a>

```
searchKey: doc.sortedValues
tags: [method private]
```

```Go
func sortedValues(m []*Value, tok token.Token) []*Value
```

### <a id="sortingName" href="#sortingName">func sortingName(d *ast.GenDecl) string</a>

```
searchKey: doc.sortingName
tags: [method private]
```

```Go
func sortingName(d *ast.GenDecl) string
```

sortingName returns the name to use when sorting d into place. 

### <a id="specNames" href="#specNames">func specNames(specs []ast.Spec) []string</a>

```
searchKey: doc.specNames
tags: [method private]
```

```Go
func specNames(specs []ast.Spec) []string
```

### <a id="splitExampleName" href="#splitExampleName">func splitExampleName(s string, i int) (prefix, suffix string, ok bool)</a>

```
searchKey: doc.splitExampleName
tags: [method private]
```

```Go
func splitExampleName(s string, i int) (prefix, suffix string, ok bool)
```

splitExampleName attempts to split example name s at index i, and reports if that produces a valid split. The suffix may be absent. Otherwise, it must start with a lower-case letter and be preceded by '_'. 

One of i == len(s) or s[i] == '_' must be true. 

### <a id="stripOutputComment" href="#stripOutputComment">func stripOutputComment(body *ast.BlockStmt, comments []*ast.CommentGroup) (*ast.BlockStmt, []*ast.CommentGroup)</a>

```
searchKey: doc.stripOutputComment
tags: [method private]
```

```Go
func stripOutputComment(body *ast.BlockStmt, comments []*ast.CommentGroup) (*ast.BlockStmt, []*ast.CommentGroup)
```

stripOutputComment finds and removes the "Output:" or "Unordered output:" comment from body and comments, and adjusts the body block's end position. 

### <a id="synopsisFmt" href="#synopsisFmt">func synopsisFmt(s string) string</a>

```
searchKey: doc.synopsisFmt
tags: [method private]
```

```Go
func synopsisFmt(s string) string
```

### <a id="test" href="#test">func test(t *testing.T, mode Mode)</a>

```
searchKey: doc.test
tags: [method private]
```

```Go
func test(t *testing.T, mode Mode)
```

### <a id="unindent" href="#unindent">func unindent(block []string)</a>

```
searchKey: doc.unindent
tags: [method private]
```

```Go
func unindent(block []string)
```

### <a id="updateIdentList" href="#updateIdentList">func updateIdentList(list []*ast.Ident) (hasExported bool)</a>

```
searchKey: doc.updateIdentList
tags: [method private]
```

```Go
func updateIdentList(list []*ast.Ident) (hasExported bool)
```

updateIdentList replaces all unexported identifiers with underscore and reports whether at least one exported name exists. 

