# Package doc

Package doc extracts source code documentation from a Go AST. 

## Index

* [Constants](#const)
    * [const ldquo](#ldquo)
    * [const rdquo](#rdquo)
    * [const ulquo](#ulquo)
    * [const urquo](#urquo)
    * [const identRx](#identRx)
    * [const protoPart](#protoPart)
    * [const hostPart](#hostPart)
    * [const pathPart](#pathPart)
    * [const urlRx](#urlRx)
    * [const opPara](#opPara)
    * [const opHead](#opHead)
    * [const opPre](#opPre)
    * [const AllDecls](#AllDecls)
    * [const AllMethods](#AllMethods)
    * [const PreserveAST](#PreserveAST)
    * [const keepNL](#keepNL)
    * [const dataDir](#dataDir)
* [Variables](#var)
    * [var htmlQuoteReplacer](#htmlQuoteReplacer)
    * [var unicodeQuoteReplacer](#unicodeQuoteReplacer)
    * [var matchRx](#matchRx)
    * [var html_a](#html_a)
    * [var html_aq](#html_aq)
    * [var html_enda](#html_enda)
    * [var html_i](#html_i)
    * [var html_endi](#html_endi)
    * [var html_p](#html_p)
    * [var html_endp](#html_endp)
    * [var html_pre](#html_pre)
    * [var html_endpre](#html_endpre)
    * [var html_h](#html_h)
    * [var html_hq](#html_hq)
    * [var html_endh](#html_endh)
    * [var nonAlphaNumRx](#nonAlphaNumRx)
    * [var nl](#nl)
    * [var space](#space)
    * [var prefix](#prefix)
    * [var outputPrefix](#outputPrefix)
    * [var underscore](#underscore)
    * [var noteMarker](#noteMarker)
    * [var noteMarkerRx](#noteMarkerRx)
    * [var noteCommentRx](#noteCommentRx)
    * [var predeclaredTypes](#predeclaredTypes)
    * [var predeclaredFuncs](#predeclaredFuncs)
    * [var predeclaredConstants](#predeclaredConstants)
    * [var IllegalPrefixes](#IllegalPrefixes)
    * [var headingTests](#headingTests)
    * [var blocksTests](#blocksTests)
    * [var emphasizeTests](#emphasizeTests)
    * [var update](#update)
    * [var files](#files)
    * [var templateTxt](#templateTxt)
    * [var tests](#tests)
* [Types](#type)
    * [type op int](#op)
    * [type block struct](#block)
    * [type lineWrapper struct](#lineWrapper)
        * [func (l *lineWrapper) write(text string)](#lineWrapper.write)
        * [func (l *lineWrapper) flush()](#lineWrapper.flush)
    * [type Package struct](#Package)
        * [func New(pkg *ast.Package, importPath string, mode Mode) *Package](#New)
        * [func NewFromFiles(fset *token.FileSet, files []*ast.File, importPath string, opts ...interface{}) (*Package, error)](#NewFromFiles)
        * [func (p *Package) Filter(f Filter)](#Package.Filter)
    * [type Value struct](#Value)
    * [type Type struct](#Type)
    * [type Func struct](#Func)
        * [func customizeRecv(f *Func, recvTypeName string, embeddedIsPtr bool, level int) *Func](#customizeRecv)
    * [type Note struct](#Note)
    * [type Mode int](#Mode)
    * [type Example struct](#Example)
    * [type Filter func(string) bool](#Filter)
    * [type methodSet map[string]*doc.Func](#methodSet)
        * [func (mset methodSet) set(f *ast.FuncDecl, preserveAST bool)](#methodSet.set)
        * [func (mset methodSet) add(m *Func)](#methodSet.add)
    * [type embeddedSet map[*doc.namedType]bool](#embeddedSet)
    * [type namedType struct](#namedType)
    * [type reader struct](#reader)
        * [func (r *reader) filterFieldList(parent *namedType, fields *ast.FieldList, ityp *ast.InterfaceType) (removedFields bool)](#reader.filterFieldList)
        * [func (r *reader) filterParamList(fields *ast.FieldList)](#reader.filterParamList)
        * [func (r *reader) filterType(parent *namedType, typ ast.Expr)](#reader.filterType)
        * [func (r *reader) filterSpec(spec ast.Spec) bool](#reader.filterSpec)
        * [func (r *reader) filterSpecList(list []ast.Spec, tok token.Token) []ast.Spec](#reader.filterSpecList)
        * [func (r *reader) filterDecl(decl ast.Decl) bool](#reader.filterDecl)
        * [func (r *reader) fileExports(src *ast.File)](#reader.fileExports)
        * [func (r *reader) isVisible(name string) bool](#reader.isVisible)
        * [func (r *reader) lookupType(name string) *namedType](#reader.lookupType)
        * [func (r *reader) recordAnonymousField(parent *namedType, fieldType ast.Expr) (fname string)](#reader.recordAnonymousField)
        * [func (r *reader) readDoc(comment *ast.CommentGroup)](#reader.readDoc)
        * [func (r *reader) remember(typ *ast.InterfaceType)](#reader.remember)
        * [func (r *reader) readValue(decl *ast.GenDecl)](#reader.readValue)
        * [func (r *reader) readType(decl *ast.GenDecl, spec *ast.TypeSpec)](#reader.readType)
        * [func (r *reader) isPredeclared(n string) bool](#reader.isPredeclared)
        * [func (r *reader) readFunc(fun *ast.FuncDecl)](#reader.readFunc)
        * [func (r *reader) readNote(list []*ast.Comment)](#reader.readNote)
        * [func (r *reader) readNotes(comments []*ast.CommentGroup)](#reader.readNotes)
        * [func (r *reader) readFile(src *ast.File)](#reader.readFile)
        * [func (r *reader) readPackage(pkg *ast.Package, mode Mode)](#reader.readPackage)
        * [func (r *reader) collectEmbeddedMethods(mset methodSet, typ *namedType, recvTypeName string, embeddedIsPtr bool, level int, visited embeddedSet)](#reader.collectEmbeddedMethods)
        * [func (r *reader) computeMethodSets()](#reader.computeMethodSets)
        * [func (r *reader) cleanupTypes()](#reader.cleanupTypes)
    * [type data struct](#data)
        * [func (d *data) Len() int](#data.Len)
        * [func (d *data) Swap(i, j int)](#data.Swap)
        * [func (d *data) Less(i, j int) bool](#data.Less)
    * [type bundle struct](#bundle)
* [Functions](#func)
    * [func commentEscape(w io.Writer, text string, nice bool)](#commentEscape)
    * [func convertQuotes(text string) string](#convertQuotes)
    * [func emphasize(w io.Writer, line string, words map[string]string, nice bool)](#emphasize)
    * [func indentLen(s string) int](#indentLen)
    * [func isBlank(s string) bool](#isBlank)
    * [func commonPrefix(a, b string) string](#commonPrefix)
    * [func unindent(block []string)](#unindent)
    * [func heading(line string) string](#heading)
    * [func anchorID(line string) string](#anchorID)
    * [func ToHTML(w io.Writer, text string, words map[string]string)](#ToHTML)
    * [func blocks(text string) []block](#blocks)
    * [func ToText(w io.Writer, text string, indent, preIndent string, width int)](#ToText)
    * [func simpleImporter(imports map[string]*ast.Object, path string) (*ast.Object, error)](#simpleImporter)
    * [func Examples(testFiles ...*ast.File) []*Example](#Examples)
    * [func exampleOutput(b *ast.BlockStmt, comments []*ast.CommentGroup) (output string, unordered, ok bool)](#exampleOutput)
    * [func isTest(name, prefix string) bool](#isTest)
    * [func playExample(file *ast.File, f *ast.FuncDecl) *ast.File](#playExample)
    * [func playExampleFile(file *ast.File) *ast.File](#playExampleFile)
    * [func stripOutputComment(body *ast.BlockStmt, comments []*ast.CommentGroup) (*ast.BlockStmt, []*ast.CommentGroup)](#stripOutputComment)
    * [func lastComment(b *ast.BlockStmt, c []*ast.CommentGroup) (i int, last *ast.CommentGroup)](#lastComment)
    * [func classifyExamples(p *Package, examples []*Example)](#classifyExamples)
    * [func splitExampleName(s string, i int) (prefix, suffix string, ok bool)](#splitExampleName)
    * [func isExampleSuffix(s string) bool](#isExampleSuffix)
    * [func filterIdentList(list []*ast.Ident) []*ast.Ident](#filterIdentList)
    * [func filterCompositeLit(lit *ast.CompositeLit, filter Filter, export bool)](#filterCompositeLit)
    * [func filterExprList(list []ast.Expr, filter Filter, export bool) []ast.Expr](#filterExprList)
    * [func updateIdentList(list []*ast.Ident) (hasExported bool)](#updateIdentList)
    * [func hasExportedName(list []*ast.Ident) bool](#hasExportedName)
    * [func removeErrorField(ityp *ast.InterfaceType)](#removeErrorField)
    * [func copyConstType(typ ast.Expr, pos token.Pos) ast.Expr](#copyConstType)
    * [func matchFields(fields *ast.FieldList, f Filter) bool](#matchFields)
    * [func matchDecl(d *ast.GenDecl, f Filter) bool](#matchDecl)
    * [func filterValues(a []*Value, f Filter) []*Value](#filterValues)
    * [func filterFuncs(a []*Func, f Filter) []*Func](#filterFuncs)
    * [func filterTypes(a []*Type, f Filter) []*Type](#filterTypes)
    * [func recvString(recv ast.Expr) string](#recvString)
    * [func baseTypeName(x ast.Expr) (name string, imported bool)](#baseTypeName)
    * [func specNames(specs []ast.Spec) []string](#specNames)
    * [func fields(typ ast.Expr) (list []*ast.Field, isStruct bool)](#fields)
    * [func sortBy(less func(i, j int) bool, swap func(i, j int), n int)](#sortBy)
    * [func sortedKeys(m map[string]int) []string](#sortedKeys)
    * [func sortingName(d *ast.GenDecl) string](#sortingName)
    * [func sortedValues(m []*Value, tok token.Token) []*Value](#sortedValues)
    * [func sortedTypes(m map[string]*namedType, allMethods bool) []*Type](#sortedTypes)
    * [func removeStar(s string) string](#removeStar)
    * [func sortedFuncs(m methodSet, allMethods bool) []*Func](#sortedFuncs)
    * [func noteBodies(notes []*Note) []string](#noteBodies)
    * [func IsPredeclared(s string) bool](#IsPredeclared)
    * [func firstSentenceLen(s string) int](#firstSentenceLen)
    * [func clean(s string, flags int) string](#clean)
    * [func Synopsis(s string) string](#Synopsis)
    * [func TestIsHeading(t *testing.T)](#TestIsHeading)
    * [func TestBlocks(t *testing.T)](#TestBlocks)
    * [func TestToText(t *testing.T)](#TestToText)
    * [func TestEmphasize(t *testing.T)](#TestEmphasize)
    * [func TestCommentEscape(t *testing.T)](#TestCommentEscape)
    * [func readTemplate(filename string) *template.Template](#readTemplate)
    * [func nodeFmt(node interface{}, fset *token.FileSet) string](#nodeFmt)
    * [func synopsisFmt(s string) string](#synopsisFmt)
    * [func indentFmt(indent, s string) string](#indentFmt)
    * [func isGoFile(fi fs.FileInfo) bool](#isGoFile)
    * [func test(t *testing.T, mode Mode)](#test)
    * [func Test(t *testing.T)](#Test)
    * [func TestAnchorID(t *testing.T)](#TestAnchorID)
    * [func TestSynopsis(t *testing.T)](#TestSynopsis)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="ldquo" href="#ldquo">const ldquo</a>

```
searchKey: doc.ldquo
```

```Go
const ldquo = "&ldquo;"
```

### <a id="rdquo" href="#rdquo">const rdquo</a>

```
searchKey: doc.rdquo
```

```Go
const rdquo = "&rdquo;"
```

### <a id="ulquo" href="#ulquo">const ulquo</a>

```
searchKey: doc.ulquo
```

```Go
const ulquo = "“"
```

### <a id="urquo" href="#urquo">const urquo</a>

```
searchKey: doc.urquo
```

```Go
const urquo = "”"
```

### <a id="identRx" href="#identRx">const identRx</a>

```
searchKey: doc.identRx
```

```Go
const identRx = `[\pL_][\pL_0-9]*`
```

Regexp for Go identifiers 

### <a id="protoPart" href="#protoPart">const protoPart</a>

```
searchKey: doc.protoPart
```

```Go
const protoPart = `(https?|ftp|file|gopher|mailto|nntp)`
```

protocol (required) e.g. http 

### <a id="hostPart" href="#hostPart">const hostPart</a>

```
searchKey: doc.hostPart
```

```Go
const hostPart = `([a-zA-Z0-9_@\-.\[\]:]+)`
```

host (required) e.g. www.example.com or [::1]:8080 

### <a id="pathPart" href="#pathPart">const pathPart</a>

```
searchKey: doc.pathPart
```

```Go
const pathPart = `([.,:;?!]*[a-zA-Z0-9$'()*+&#=@~_/\-\[\]%])*`
```

path+query+fragment (optional) e.g. /path/index.html?q=foo#bar 

### <a id="urlRx" href="#urlRx">const urlRx</a>

```
searchKey: doc.urlRx
```

```Go
const urlRx = protoPart + `://` + hostPart + pathPart
```

### <a id="opPara" href="#opPara">const opPara</a>

```
searchKey: doc.opPara
```

```Go
const opPara op = iota
```

### <a id="opHead" href="#opHead">const opHead</a>

```
searchKey: doc.opHead
```

```Go
const opHead
```

### <a id="opPre" href="#opPre">const opPre</a>

```
searchKey: doc.opPre
```

```Go
const opPre
```

### <a id="AllDecls" href="#AllDecls">const AllDecls</a>

```
searchKey: doc.AllDecls
tags: [exported]
```

```Go
const AllDecls Mode = 1 << iota
```

AllDecls says to extract documentation for all package-level declarations, not just exported ones. 

### <a id="AllMethods" href="#AllMethods">const AllMethods</a>

```
searchKey: doc.AllMethods
tags: [exported]
```

```Go
const AllMethods
```

AllMethods says to show all embedded methods, not just the ones of invisible (unexported) anonymous fields. 

### <a id="PreserveAST" href="#PreserveAST">const PreserveAST</a>

```
searchKey: doc.PreserveAST
tags: [exported]
```

```Go
const PreserveAST
```

PreserveAST says to leave the AST unmodified. Originally, pieces of the AST such as function bodies were nil-ed out to save memory in godoc, but not all programs want that behavior. 

### <a id="keepNL" href="#keepNL">const keepNL</a>

```
searchKey: doc.keepNL
```

```Go
const keepNL = 1 << iota
```

### <a id="dataDir" href="#dataDir">const dataDir</a>

```
searchKey: doc.dataDir
```

```Go
const dataDir = "testdata"
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="htmlQuoteReplacer" href="#htmlQuoteReplacer">var htmlQuoteReplacer</a>

```
searchKey: doc.htmlQuoteReplacer
```

```Go
var htmlQuoteReplacer = strings.NewReplacer(ulquo, ldquo, urquo, rdquo)
```

### <a id="unicodeQuoteReplacer" href="#unicodeQuoteReplacer">var unicodeQuoteReplacer</a>

```
searchKey: doc.unicodeQuoteReplacer
```

```Go
var unicodeQuoteReplacer = strings.NewReplacer("``", ulquo, "''", urquo)
```

### <a id="matchRx" href="#matchRx">var matchRx</a>

```
searchKey: doc.matchRx
```

```Go
var matchRx = lazyregexp.New(`(` + urlRx + `)|(` + identRx + `)`)
```

### <a id="html_a" href="#html_a">var html_a</a>

```
searchKey: doc.html_a
```

```Go
var html_a = []byte(`<a href="`)
```

### <a id="html_aq" href="#html_aq">var html_aq</a>

```
searchKey: doc.html_aq
```

```Go
var html_aq = []byte(`">`)
```

### <a id="html_enda" href="#html_enda">var html_enda</a>

```
searchKey: doc.html_enda
```

```Go
var html_enda = []byte("</a>")
```

### <a id="html_i" href="#html_i">var html_i</a>

```
searchKey: doc.html_i
```

```Go
var html_i = []byte("<i>")
```

### <a id="html_endi" href="#html_endi">var html_endi</a>

```
searchKey: doc.html_endi
```

```Go
var html_endi = []byte("</i>")
```

### <a id="html_p" href="#html_p">var html_p</a>

```
searchKey: doc.html_p
```

```Go
var html_p = []byte("<p>\n")
```

### <a id="html_endp" href="#html_endp">var html_endp</a>

```
searchKey: doc.html_endp
```

```Go
var html_endp = []byte("</p>\n")
```

### <a id="html_pre" href="#html_pre">var html_pre</a>

```
searchKey: doc.html_pre
```

```Go
var html_pre = []byte("<pre>")
```

### <a id="html_endpre" href="#html_endpre">var html_endpre</a>

```
searchKey: doc.html_endpre
```

```Go
var html_endpre = []byte("</pre>\n")
```

### <a id="html_h" href="#html_h">var html_h</a>

```
searchKey: doc.html_h
```

```Go
var html_h = []byte(`<h3 id="`)
```

### <a id="html_hq" href="#html_hq">var html_hq</a>

```
searchKey: doc.html_hq
```

```Go
var html_hq = []byte(`">`)
```

### <a id="html_endh" href="#html_endh">var html_endh</a>

```
searchKey: doc.html_endh
```

```Go
var html_endh = []byte("</h3>\n")
```

### <a id="nonAlphaNumRx" href="#nonAlphaNumRx">var nonAlphaNumRx</a>

```
searchKey: doc.nonAlphaNumRx
```

```Go
var nonAlphaNumRx = lazyregexp.New(`[^a-zA-Z0-9]`)
```

### <a id="nl" href="#nl">var nl</a>

```
searchKey: doc.nl
```

```Go
var nl = []byte("\n")
```

### <a id="space" href="#space">var space</a>

```
searchKey: doc.space
```

```Go
var space = []byte(" ")
```

### <a id="prefix" href="#prefix">var prefix</a>

```
searchKey: doc.prefix
```

```Go
var prefix = []byte("// ")
```

### <a id="outputPrefix" href="#outputPrefix">var outputPrefix</a>

```
searchKey: doc.outputPrefix
```

```Go
var outputPrefix = lazyregexp.New(`(?i)^[[:space:]]*(unordered )?output:`)
```

### <a id="underscore" href="#underscore">var underscore</a>

```
searchKey: doc.underscore
```

```Go
var underscore = ast.NewIdent("_")
```

### <a id="noteMarker" href="#noteMarker">var noteMarker</a>

```
searchKey: doc.noteMarker
```

```Go
var noteMarker // MARKER(uid), MARKER at least 2 chars, uid at least 1 char
 = ...
```

### <a id="noteMarkerRx" href="#noteMarkerRx">var noteMarkerRx</a>

```
searchKey: doc.noteMarkerRx
```

```Go
var noteMarkerRx = lazyregexp.New(`^[ \t]*` + noteMarker) // MARKER(uid) at text start

```

### <a id="noteCommentRx" href="#noteCommentRx">var noteCommentRx</a>

```
searchKey: doc.noteCommentRx
```

```Go
var noteCommentRx = lazyregexp.New(`^/[/*][ \t]*` + noteMarker) // MARKER(uid) at comment start

```

### <a id="predeclaredTypes" href="#predeclaredTypes">var predeclaredTypes</a>

```
searchKey: doc.predeclaredTypes
```

```Go
var predeclaredTypes = ...
```

### <a id="predeclaredFuncs" href="#predeclaredFuncs">var predeclaredFuncs</a>

```
searchKey: doc.predeclaredFuncs
```

```Go
var predeclaredFuncs = ...
```

### <a id="predeclaredConstants" href="#predeclaredConstants">var predeclaredConstants</a>

```
searchKey: doc.predeclaredConstants
```

```Go
var predeclaredConstants = ...
```

### <a id="IllegalPrefixes" href="#IllegalPrefixes">var IllegalPrefixes</a>

```
searchKey: doc.IllegalPrefixes
tags: [exported]
```

```Go
var IllegalPrefixes = []string{
	"copyright",
	"all rights",
	"author",
}
```

### <a id="headingTests" href="#headingTests">var headingTests</a>

```
searchKey: doc.headingTests
```

```Go
var headingTests = ...
```

### <a id="blocksTests" href="#blocksTests">var blocksTests</a>

```
searchKey: doc.blocksTests
```

```Go
var blocksTests = ...
```

### <a id="emphasizeTests" href="#emphasizeTests">var emphasizeTests</a>

```
searchKey: doc.emphasizeTests
```

```Go
var emphasizeTests = ...
```

### <a id="update" href="#update">var update</a>

```
searchKey: doc.update
```

```Go
var update = flag.Bool("update", false, "update golden (.out) files")
```

### <a id="files" href="#files">var files</a>

```
searchKey: doc.files
```

```Go
var files = flag.String("files", "", "consider only Go test files matching this regular expression")
```

### <a id="templateTxt" href="#templateTxt">var templateTxt</a>

```
searchKey: doc.templateTxt
```

```Go
var templateTxt = readTemplate("template.txt")
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: doc.tests
```

```Go
var tests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="op" href="#op">type op int</a>

```
searchKey: doc.op
```

```Go
type op int
```

### <a id="block" href="#block">type block struct</a>

```
searchKey: doc.block
```

```Go
type block struct {
	op    op
	lines []string
}
```

### <a id="lineWrapper" href="#lineWrapper">type lineWrapper struct</a>

```
searchKey: doc.lineWrapper
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

#### <a id="lineWrapper.write" href="#lineWrapper.write">func (l *lineWrapper) write(text string)</a>

```
searchKey: doc.lineWrapper.write
```

```Go
func (l *lineWrapper) write(text string)
```

#### <a id="lineWrapper.flush" href="#lineWrapper.flush">func (l *lineWrapper) flush()</a>

```
searchKey: doc.lineWrapper.flush
```

```Go
func (l *lineWrapper) flush()
```

### <a id="Package" href="#Package">type Package struct</a>

```
searchKey: doc.Package
tags: [exported]
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
tags: [exported]
```

```Go
func New(pkg *ast.Package, importPath string, mode Mode) *Package
```

New computes the package documentation for the given package AST. New takes ownership of the AST pkg and may edit or overwrite it. To have the Examples fields populated, use NewFromFiles and include the package's _test.go files. 

#### <a id="NewFromFiles" href="#NewFromFiles">func NewFromFiles(fset *token.FileSet, files []*ast.File, importPath string, opts ...interface{}) (*Package, error)</a>

```
searchKey: doc.NewFromFiles
tags: [exported]
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
tags: [exported]
```

```Go
func (p *Package) Filter(f Filter)
```

Filter eliminates documentation for names that don't pass through the filter f. TODO(gri): Recognize "Type.Method" as a name. 

### <a id="Value" href="#Value">type Value struct</a>

```
searchKey: doc.Value
tags: [exported]
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

### <a id="Type" href="#Type">type Type struct</a>

```
searchKey: doc.Type
tags: [exported]
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

### <a id="Func" href="#Func">type Func struct</a>

```
searchKey: doc.Func
tags: [exported]
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
```

```Go
func customizeRecv(f *Func, recvTypeName string, embeddedIsPtr bool, level int) *Func
```

### <a id="Note" href="#Note">type Note struct</a>

```
searchKey: doc.Note
tags: [exported]
```

```Go
type Note struct {
	Pos, End token.Pos // position range of the comment containing the marker
	UID      string    // uid found with the marker
	Body     string    // note body text
}
```

A Note represents a marked comment starting with "MARKER(uid): note body". Any note with a marker of 2 or more upper case [A-Z] letters and a uid of at least one character is recognized. The ":" following the uid is optional. Notes are collected in the Package.Notes map indexed by the notes marker. 

### <a id="Mode" href="#Mode">type Mode int</a>

```
searchKey: doc.Mode
tags: [exported]
```

```Go
type Mode int
```

Mode values control the operation of New and NewFromFiles. 

### <a id="Example" href="#Example">type Example struct</a>

```
searchKey: doc.Example
tags: [exported]
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
tags: [exported]
```

```Go
type Filter func(string) bool
```

### <a id="methodSet" href="#methodSet">type methodSet map[string]*doc.Func</a>

```
searchKey: doc.methodSet
```

```Go
type methodSet map[string]*Func
```

A methodSet describes a set of methods. Entries where Decl == nil are conflict entries (more than one method with the same name at the same embedding level). 

#### <a id="methodSet.set" href="#methodSet.set">func (mset methodSet) set(f *ast.FuncDecl, preserveAST bool)</a>

```
searchKey: doc.methodSet.set
```

```Go
func (mset methodSet) set(f *ast.FuncDecl, preserveAST bool)
```

set creates the corresponding Func for f and adds it to mset. If there are multiple f's with the same name, set keeps the first one with documentation; conflicts are ignored. The boolean specifies whether to leave the AST untouched. 

#### <a id="methodSet.add" href="#methodSet.add">func (mset methodSet) add(m *Func)</a>

```
searchKey: doc.methodSet.add
```

```Go
func (mset methodSet) add(m *Func)
```

add adds method m to the method set; m is ignored if the method set already contains a method with the same name at the same or a higher level than m. 

### <a id="embeddedSet" href="#embeddedSet">type embeddedSet map[*doc.namedType]bool</a>

```
searchKey: doc.embeddedSet
```

```Go
type embeddedSet map[*namedType]bool
```

An embeddedSet describes a set of embedded types. 

### <a id="namedType" href="#namedType">type namedType struct</a>

```
searchKey: doc.namedType
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

### <a id="reader" href="#reader">type reader struct</a>

```
searchKey: doc.reader
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

#### <a id="reader.filterFieldList" href="#reader.filterFieldList">func (r *reader) filterFieldList(parent *namedType, fields *ast.FieldList, ityp *ast.InterfaceType) (removedFields bool)</a>

```
searchKey: doc.reader.filterFieldList
```

```Go
func (r *reader) filterFieldList(parent *namedType, fields *ast.FieldList, ityp *ast.InterfaceType) (removedFields bool)
```

filterFieldList removes unexported fields (field names) from the field list in place and reports whether fields were removed. Anonymous fields are recorded with the parent type. filterType is called with the types of all remaining fields. 

#### <a id="reader.filterParamList" href="#reader.filterParamList">func (r *reader) filterParamList(fields *ast.FieldList)</a>

```
searchKey: doc.reader.filterParamList
```

```Go
func (r *reader) filterParamList(fields *ast.FieldList)
```

filterParamList applies filterType to each parameter type in fields. 

#### <a id="reader.filterType" href="#reader.filterType">func (r *reader) filterType(parent *namedType, typ ast.Expr)</a>

```
searchKey: doc.reader.filterType
```

```Go
func (r *reader) filterType(parent *namedType, typ ast.Expr)
```

filterType strips any unexported struct fields or method types from typ in place. If fields (or methods) have been removed, the corresponding struct or interface type has the Incomplete field set to true. 

#### <a id="reader.filterSpec" href="#reader.filterSpec">func (r *reader) filterSpec(spec ast.Spec) bool</a>

```
searchKey: doc.reader.filterSpec
```

```Go
func (r *reader) filterSpec(spec ast.Spec) bool
```

#### <a id="reader.filterSpecList" href="#reader.filterSpecList">func (r *reader) filterSpecList(list []ast.Spec, tok token.Token) []ast.Spec</a>

```
searchKey: doc.reader.filterSpecList
```

```Go
func (r *reader) filterSpecList(list []ast.Spec, tok token.Token) []ast.Spec
```

#### <a id="reader.filterDecl" href="#reader.filterDecl">func (r *reader) filterDecl(decl ast.Decl) bool</a>

```
searchKey: doc.reader.filterDecl
```

```Go
func (r *reader) filterDecl(decl ast.Decl) bool
```

#### <a id="reader.fileExports" href="#reader.fileExports">func (r *reader) fileExports(src *ast.File)</a>

```
searchKey: doc.reader.fileExports
```

```Go
func (r *reader) fileExports(src *ast.File)
```

fileExports removes unexported declarations from src in place. 

#### <a id="reader.isVisible" href="#reader.isVisible">func (r *reader) isVisible(name string) bool</a>

```
searchKey: doc.reader.isVisible
```

```Go
func (r *reader) isVisible(name string) bool
```

#### <a id="reader.lookupType" href="#reader.lookupType">func (r *reader) lookupType(name string) *namedType</a>

```
searchKey: doc.reader.lookupType
```

```Go
func (r *reader) lookupType(name string) *namedType
```

lookupType returns the base type with the given name. If the base type has not been encountered yet, a new type with the given name but no associated declaration is added to the type map. 

#### <a id="reader.recordAnonymousField" href="#reader.recordAnonymousField">func (r *reader) recordAnonymousField(parent *namedType, fieldType ast.Expr) (fname string)</a>

```
searchKey: doc.reader.recordAnonymousField
```

```Go
func (r *reader) recordAnonymousField(parent *namedType, fieldType ast.Expr) (fname string)
```

recordAnonymousField registers fieldType as the type of an anonymous field in the parent type. If the field is imported (qualified name) or the parent is nil, the field is ignored. The function returns the field name. 

#### <a id="reader.readDoc" href="#reader.readDoc">func (r *reader) readDoc(comment *ast.CommentGroup)</a>

```
searchKey: doc.reader.readDoc
```

```Go
func (r *reader) readDoc(comment *ast.CommentGroup)
```

#### <a id="reader.remember" href="#reader.remember">func (r *reader) remember(typ *ast.InterfaceType)</a>

```
searchKey: doc.reader.remember
```

```Go
func (r *reader) remember(typ *ast.InterfaceType)
```

#### <a id="reader.readValue" href="#reader.readValue">func (r *reader) readValue(decl *ast.GenDecl)</a>

```
searchKey: doc.reader.readValue
```

```Go
func (r *reader) readValue(decl *ast.GenDecl)
```

readValue processes a const or var declaration. 

#### <a id="reader.readType" href="#reader.readType">func (r *reader) readType(decl *ast.GenDecl, spec *ast.TypeSpec)</a>

```
searchKey: doc.reader.readType
```

```Go
func (r *reader) readType(decl *ast.GenDecl, spec *ast.TypeSpec)
```

readType processes a type declaration. 

#### <a id="reader.isPredeclared" href="#reader.isPredeclared">func (r *reader) isPredeclared(n string) bool</a>

```
searchKey: doc.reader.isPredeclared
```

```Go
func (r *reader) isPredeclared(n string) bool
```

isPredeclared reports whether n denotes a predeclared type. 

#### <a id="reader.readFunc" href="#reader.readFunc">func (r *reader) readFunc(fun *ast.FuncDecl)</a>

```
searchKey: doc.reader.readFunc
```

```Go
func (r *reader) readFunc(fun *ast.FuncDecl)
```

readFunc processes a func or method declaration. 

#### <a id="reader.readNote" href="#reader.readNote">func (r *reader) readNote(list []*ast.Comment)</a>

```
searchKey: doc.reader.readNote
```

```Go
func (r *reader) readNote(list []*ast.Comment)
```

readNote collects a single note from a sequence of comments. 

#### <a id="reader.readNotes" href="#reader.readNotes">func (r *reader) readNotes(comments []*ast.CommentGroup)</a>

```
searchKey: doc.reader.readNotes
```

```Go
func (r *reader) readNotes(comments []*ast.CommentGroup)
```

readNotes extracts notes from comments. A note must start at the beginning of a comment with "MARKER(uid):" and is followed by the note body (e.g., "// BUG(gri): fix this"). The note ends at the end of the comment group or at the start of another note in the same comment group, whichever comes first. 

#### <a id="reader.readFile" href="#reader.readFile">func (r *reader) readFile(src *ast.File)</a>

```
searchKey: doc.reader.readFile
```

```Go
func (r *reader) readFile(src *ast.File)
```

readFile adds the AST for a source file to the reader. 

#### <a id="reader.readPackage" href="#reader.readPackage">func (r *reader) readPackage(pkg *ast.Package, mode Mode)</a>

```
searchKey: doc.reader.readPackage
```

```Go
func (r *reader) readPackage(pkg *ast.Package, mode Mode)
```

#### <a id="reader.collectEmbeddedMethods" href="#reader.collectEmbeddedMethods">func (r *reader) collectEmbeddedMethods(mset methodSet, typ *namedType, recvTypeName string, embeddedIsPtr bool, level int, visited embeddedSet)</a>

```
searchKey: doc.reader.collectEmbeddedMethods
```

```Go
func (r *reader) collectEmbeddedMethods(mset methodSet, typ *namedType, recvTypeName string, embeddedIsPtr bool, level int, visited embeddedSet)
```

collectEmbeddedMethods collects the embedded methods of typ in mset. 

#### <a id="reader.computeMethodSets" href="#reader.computeMethodSets">func (r *reader) computeMethodSets()</a>

```
searchKey: doc.reader.computeMethodSets
```

```Go
func (r *reader) computeMethodSets()
```

computeMethodSets determines the actual method sets for each type encountered. 

#### <a id="reader.cleanupTypes" href="#reader.cleanupTypes">func (r *reader) cleanupTypes()</a>

```
searchKey: doc.reader.cleanupTypes
```

```Go
func (r *reader) cleanupTypes()
```

cleanupTypes removes the association of functions and methods with types that have no declaration. Instead, these functions and methods are shown at the package level. It also removes types with missing declarations or which are not visible. 

### <a id="data" href="#data">type data struct</a>

```
searchKey: doc.data
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
```

```Go
func (d *data) Len() int
```

#### <a id="data.Swap" href="#data.Swap">func (d *data) Swap(i, j int)</a>

```
searchKey: doc.data.Swap
```

```Go
func (d *data) Swap(i, j int)
```

#### <a id="data.Less" href="#data.Less">func (d *data) Less(i, j int) bool</a>

```
searchKey: doc.data.Less
```

```Go
func (d *data) Less(i, j int) bool
```

### <a id="bundle" href="#bundle">type bundle struct</a>

```
searchKey: doc.bundle
```

```Go
type bundle struct {
	*Package
	FSet *token.FileSet
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="commentEscape" href="#commentEscape">func commentEscape(w io.Writer, text string, nice bool)</a>

```
searchKey: doc.commentEscape
```

```Go
func commentEscape(w io.Writer, text string, nice bool)
```

Escape comment text for HTML. If nice is set, also turn ` into &ldquo; and ' into &rdquo;. 

### <a id="convertQuotes" href="#convertQuotes">func convertQuotes(text string) string</a>

```
searchKey: doc.convertQuotes
```

```Go
func convertQuotes(text string) string
```

### <a id="emphasize" href="#emphasize">func emphasize(w io.Writer, line string, words map[string]string, nice bool)</a>

```
searchKey: doc.emphasize
```

```Go
func emphasize(w io.Writer, line string, words map[string]string, nice bool)
```

Emphasize and escape a line of text for HTML. URLs are converted into links; if the URL also appears in the words map, the link is taken from the map (if the corresponding map value is the empty string, the URL is not converted into a link). Go identifiers that appear in the words map are italicized; if the corresponding map value is not the empty string, it is considered a URL and the word is converted into a link. If nice is set, the remaining text's appearance is improved where it makes sense (e.g., ` is turned into &ldquo; and ' into &rdquo;). 

### <a id="indentLen" href="#indentLen">func indentLen(s string) int</a>

```
searchKey: doc.indentLen
```

```Go
func indentLen(s string) int
```

### <a id="isBlank" href="#isBlank">func isBlank(s string) bool</a>

```
searchKey: doc.isBlank
```

```Go
func isBlank(s string) bool
```

### <a id="commonPrefix" href="#commonPrefix">func commonPrefix(a, b string) string</a>

```
searchKey: doc.commonPrefix
```

```Go
func commonPrefix(a, b string) string
```

### <a id="unindent" href="#unindent">func unindent(block []string)</a>

```
searchKey: doc.unindent
```

```Go
func unindent(block []string)
```

### <a id="heading" href="#heading">func heading(line string) string</a>

```
searchKey: doc.heading
```

```Go
func heading(line string) string
```

heading returns the trimmed line if it passes as a section heading; otherwise it returns the empty string. 

### <a id="anchorID" href="#anchorID">func anchorID(line string) string</a>

```
searchKey: doc.anchorID
```

```Go
func anchorID(line string) string
```

### <a id="ToHTML" href="#ToHTML">func ToHTML(w io.Writer, text string, words map[string]string)</a>

```
searchKey: doc.ToHTML
tags: [exported]
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

### <a id="blocks" href="#blocks">func blocks(text string) []block</a>

```
searchKey: doc.blocks
```

```Go
func blocks(text string) []block
```

### <a id="ToText" href="#ToText">func ToText(w io.Writer, text string, indent, preIndent string, width int)</a>

```
searchKey: doc.ToText
tags: [exported]
```

```Go
func ToText(w io.Writer, text string, indent, preIndent string, width int)
```

ToText prepares comment text for presentation in textual output. It wraps paragraphs of text to width or fewer Unicode code points and then prefixes each line with the indent. In preformatted sections (such as program text), it prefixes each non-blank line with preIndent. 

A pair of (consecutive) backticks (`) is converted to a unicode left quote (“), and a pair of (consecutive) single quotes (') is converted to a unicode right quote (”). 

### <a id="simpleImporter" href="#simpleImporter">func simpleImporter(imports map[string]*ast.Object, path string) (*ast.Object, error)</a>

```
searchKey: doc.simpleImporter
```

```Go
func simpleImporter(imports map[string]*ast.Object, path string) (*ast.Object, error)
```

simpleImporter returns a (dummy) package object named by the last path component of the provided package path (as is the convention for packages). This is sufficient to resolve package identifiers without doing an actual import. It never returns an error. 

### <a id="Examples" href="#Examples">func Examples(testFiles ...*ast.File) []*Example</a>

```
searchKey: doc.Examples
tags: [exported]
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
### <a id="exampleOutput" href="#exampleOutput">func exampleOutput(b *ast.BlockStmt, comments []*ast.CommentGroup) (output string, unordered, ok bool)</a>

```
searchKey: doc.exampleOutput
```

```Go
func exampleOutput(b *ast.BlockStmt, comments []*ast.CommentGroup) (output string, unordered, ok bool)
```

Extracts the expected output and whether there was a valid output comment 

### <a id="isTest" href="#isTest">func isTest(name, prefix string) bool</a>

```
searchKey: doc.isTest
```

```Go
func isTest(name, prefix string) bool
```

isTest tells whether name looks like a test, example, or benchmark. It is a Test (say) if there is a character after Test that is not a lower-case letter. (We don't want Testiness.) 

### <a id="playExample" href="#playExample">func playExample(file *ast.File, f *ast.FuncDecl) *ast.File</a>

```
searchKey: doc.playExample
```

```Go
func playExample(file *ast.File, f *ast.FuncDecl) *ast.File
```

playExample synthesizes a new *ast.File based on the provided file with the provided function body as the body of main. 

### <a id="playExampleFile" href="#playExampleFile">func playExampleFile(file *ast.File) *ast.File</a>

```
searchKey: doc.playExampleFile
```

```Go
func playExampleFile(file *ast.File) *ast.File
```

playExampleFile takes a whole file example and synthesizes a new *ast.File such that the example is function main in package main. 

### <a id="stripOutputComment" href="#stripOutputComment">func stripOutputComment(body *ast.BlockStmt, comments []*ast.CommentGroup) (*ast.BlockStmt, []*ast.CommentGroup)</a>

```
searchKey: doc.stripOutputComment
```

```Go
func stripOutputComment(body *ast.BlockStmt, comments []*ast.CommentGroup) (*ast.BlockStmt, []*ast.CommentGroup)
```

stripOutputComment finds and removes the "Output:" or "Unordered output:" comment from body and comments, and adjusts the body block's end position. 

### <a id="lastComment" href="#lastComment">func lastComment(b *ast.BlockStmt, c []*ast.CommentGroup) (i int, last *ast.CommentGroup)</a>

```
searchKey: doc.lastComment
```

```Go
func lastComment(b *ast.BlockStmt, c []*ast.CommentGroup) (i int, last *ast.CommentGroup)
```

lastComment returns the last comment inside the provided block. 

### <a id="classifyExamples" href="#classifyExamples">func classifyExamples(p *Package, examples []*Example)</a>

```
searchKey: doc.classifyExamples
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

### <a id="splitExampleName" href="#splitExampleName">func splitExampleName(s string, i int) (prefix, suffix string, ok bool)</a>

```
searchKey: doc.splitExampleName
```

```Go
func splitExampleName(s string, i int) (prefix, suffix string, ok bool)
```

splitExampleName attempts to split example name s at index i, and reports if that produces a valid split. The suffix may be absent. Otherwise, it must start with a lower-case letter and be preceded by '_'. 

One of i == len(s) or s[i] == '_' must be true. 

### <a id="isExampleSuffix" href="#isExampleSuffix">func isExampleSuffix(s string) bool</a>

```
searchKey: doc.isExampleSuffix
```

```Go
func isExampleSuffix(s string) bool
```

### <a id="filterIdentList" href="#filterIdentList">func filterIdentList(list []*ast.Ident) []*ast.Ident</a>

```
searchKey: doc.filterIdentList
```

```Go
func filterIdentList(list []*ast.Ident) []*ast.Ident
```

filterIdentList removes unexported names from list in place and returns the resulting list. 

### <a id="filterCompositeLit" href="#filterCompositeLit">func filterCompositeLit(lit *ast.CompositeLit, filter Filter, export bool)</a>

```
searchKey: doc.filterCompositeLit
```

```Go
func filterCompositeLit(lit *ast.CompositeLit, filter Filter, export bool)
```

### <a id="filterExprList" href="#filterExprList">func filterExprList(list []ast.Expr, filter Filter, export bool) []ast.Expr</a>

```
searchKey: doc.filterExprList
```

```Go
func filterExprList(list []ast.Expr, filter Filter, export bool) []ast.Expr
```

### <a id="updateIdentList" href="#updateIdentList">func updateIdentList(list []*ast.Ident) (hasExported bool)</a>

```
searchKey: doc.updateIdentList
```

```Go
func updateIdentList(list []*ast.Ident) (hasExported bool)
```

updateIdentList replaces all unexported identifiers with underscore and reports whether at least one exported name exists. 

### <a id="hasExportedName" href="#hasExportedName">func hasExportedName(list []*ast.Ident) bool</a>

```
searchKey: doc.hasExportedName
```

```Go
func hasExportedName(list []*ast.Ident) bool
```

hasExportedName reports whether list contains any exported names. 

### <a id="removeErrorField" href="#removeErrorField">func removeErrorField(ityp *ast.InterfaceType)</a>

```
searchKey: doc.removeErrorField
```

```Go
func removeErrorField(ityp *ast.InterfaceType)
```

removeErrorField removes anonymous fields named "error" from an interface. This is called when "error" has been determined to be a local name, not the predeclared type. 

### <a id="copyConstType" href="#copyConstType">func copyConstType(typ ast.Expr, pos token.Pos) ast.Expr</a>

```
searchKey: doc.copyConstType
```

```Go
func copyConstType(typ ast.Expr, pos token.Pos) ast.Expr
```

copyConstType returns a copy of typ with position pos. typ must be a valid constant type. In practice, only (possibly qualified) identifiers are possible. 

### <a id="matchFields" href="#matchFields">func matchFields(fields *ast.FieldList, f Filter) bool</a>

```
searchKey: doc.matchFields
```

```Go
func matchFields(fields *ast.FieldList, f Filter) bool
```

### <a id="matchDecl" href="#matchDecl">func matchDecl(d *ast.GenDecl, f Filter) bool</a>

```
searchKey: doc.matchDecl
```

```Go
func matchDecl(d *ast.GenDecl, f Filter) bool
```

### <a id="filterValues" href="#filterValues">func filterValues(a []*Value, f Filter) []*Value</a>

```
searchKey: doc.filterValues
```

```Go
func filterValues(a []*Value, f Filter) []*Value
```

### <a id="filterFuncs" href="#filterFuncs">func filterFuncs(a []*Func, f Filter) []*Func</a>

```
searchKey: doc.filterFuncs
```

```Go
func filterFuncs(a []*Func, f Filter) []*Func
```

### <a id="filterTypes" href="#filterTypes">func filterTypes(a []*Type, f Filter) []*Type</a>

```
searchKey: doc.filterTypes
```

```Go
func filterTypes(a []*Type, f Filter) []*Type
```

### <a id="recvString" href="#recvString">func recvString(recv ast.Expr) string</a>

```
searchKey: doc.recvString
```

```Go
func recvString(recv ast.Expr) string
```

recvString returns a string representation of recv of the form "T", "*T", or "BADRECV" (if not a proper receiver type). 

### <a id="baseTypeName" href="#baseTypeName">func baseTypeName(x ast.Expr) (name string, imported bool)</a>

```
searchKey: doc.baseTypeName
```

```Go
func baseTypeName(x ast.Expr) (name string, imported bool)
```

baseTypeName returns the name of the base type of x (or "") and whether the type is imported or not. 

### <a id="specNames" href="#specNames">func specNames(specs []ast.Spec) []string</a>

```
searchKey: doc.specNames
```

```Go
func specNames(specs []ast.Spec) []string
```

### <a id="fields" href="#fields">func fields(typ ast.Expr) (list []*ast.Field, isStruct bool)</a>

```
searchKey: doc.fields
```

```Go
func fields(typ ast.Expr) (list []*ast.Field, isStruct bool)
```

fields returns a struct's fields or an interface's methods. 

### <a id="sortBy" href="#sortBy">func sortBy(less func(i, j int) bool, swap func(i, j int), n int)</a>

```
searchKey: doc.sortBy
```

```Go
func sortBy(less func(i, j int) bool, swap func(i, j int), n int)
```

sortBy is a helper function for sorting 

### <a id="sortedKeys" href="#sortedKeys">func sortedKeys(m map[string]int) []string</a>

```
searchKey: doc.sortedKeys
```

```Go
func sortedKeys(m map[string]int) []string
```

### <a id="sortingName" href="#sortingName">func sortingName(d *ast.GenDecl) string</a>

```
searchKey: doc.sortingName
```

```Go
func sortingName(d *ast.GenDecl) string
```

sortingName returns the name to use when sorting d into place. 

### <a id="sortedValues" href="#sortedValues">func sortedValues(m []*Value, tok token.Token) []*Value</a>

```
searchKey: doc.sortedValues
```

```Go
func sortedValues(m []*Value, tok token.Token) []*Value
```

### <a id="sortedTypes" href="#sortedTypes">func sortedTypes(m map[string]*namedType, allMethods bool) []*Type</a>

```
searchKey: doc.sortedTypes
```

```Go
func sortedTypes(m map[string]*namedType, allMethods bool) []*Type
```

### <a id="removeStar" href="#removeStar">func removeStar(s string) string</a>

```
searchKey: doc.removeStar
```

```Go
func removeStar(s string) string
```

### <a id="sortedFuncs" href="#sortedFuncs">func sortedFuncs(m methodSet, allMethods bool) []*Func</a>

```
searchKey: doc.sortedFuncs
```

```Go
func sortedFuncs(m methodSet, allMethods bool) []*Func
```

### <a id="noteBodies" href="#noteBodies">func noteBodies(notes []*Note) []string</a>

```
searchKey: doc.noteBodies
```

```Go
func noteBodies(notes []*Note) []string
```

noteBodies returns a list of note body strings given a list of notes. This is only used to populate the deprecated Package.Bugs field. 

### <a id="IsPredeclared" href="#IsPredeclared">func IsPredeclared(s string) bool</a>

```
searchKey: doc.IsPredeclared
tags: [exported]
```

```Go
func IsPredeclared(s string) bool
```

IsPredeclared reports whether s is a predeclared identifier. 

### <a id="firstSentenceLen" href="#firstSentenceLen">func firstSentenceLen(s string) int</a>

```
searchKey: doc.firstSentenceLen
```

```Go
func firstSentenceLen(s string) int
```

firstSentenceLen returns the length of the first sentence in s. The sentence ends after the first period followed by space and not preceded by exactly one uppercase letter. 

### <a id="clean" href="#clean">func clean(s string, flags int) string</a>

```
searchKey: doc.clean
```

```Go
func clean(s string, flags int) string
```

clean replaces each sequence of space, \n, \r, or \t characters with a single space and removes any trailing and leading spaces. If the keepNL flag is set, newline characters are passed through instead of being change to spaces. 

### <a id="Synopsis" href="#Synopsis">func Synopsis(s string) string</a>

```
searchKey: doc.Synopsis
tags: [exported]
```

```Go
func Synopsis(s string) string
```

Synopsis returns a cleaned version of the first sentence in s. That sentence ends after the first period followed by space and not preceded by exactly one uppercase letter. The result string has no \n, \r, or \t characters and uses only single spaces between words. If s starts with any of the IllegalPrefixes, the result is the empty string. 

### <a id="TestIsHeading" href="#TestIsHeading">func TestIsHeading(t *testing.T)</a>

```
searchKey: doc.TestIsHeading
```

```Go
func TestIsHeading(t *testing.T)
```

### <a id="TestBlocks" href="#TestBlocks">func TestBlocks(t *testing.T)</a>

```
searchKey: doc.TestBlocks
```

```Go
func TestBlocks(t *testing.T)
```

### <a id="TestToText" href="#TestToText">func TestToText(t *testing.T)</a>

```
searchKey: doc.TestToText
```

```Go
func TestToText(t *testing.T)
```

### <a id="TestEmphasize" href="#TestEmphasize">func TestEmphasize(t *testing.T)</a>

```
searchKey: doc.TestEmphasize
```

```Go
func TestEmphasize(t *testing.T)
```

### <a id="TestCommentEscape" href="#TestCommentEscape">func TestCommentEscape(t *testing.T)</a>

```
searchKey: doc.TestCommentEscape
```

```Go
func TestCommentEscape(t *testing.T)
```

### <a id="readTemplate" href="#readTemplate">func readTemplate(filename string) *template.Template</a>

```
searchKey: doc.readTemplate
```

```Go
func readTemplate(filename string) *template.Template
```

### <a id="nodeFmt" href="#nodeFmt">func nodeFmt(node interface{}, fset *token.FileSet) string</a>

```
searchKey: doc.nodeFmt
```

```Go
func nodeFmt(node interface{}, fset *token.FileSet) string
```

### <a id="synopsisFmt" href="#synopsisFmt">func synopsisFmt(s string) string</a>

```
searchKey: doc.synopsisFmt
```

```Go
func synopsisFmt(s string) string
```

### <a id="indentFmt" href="#indentFmt">func indentFmt(indent, s string) string</a>

```
searchKey: doc.indentFmt
```

```Go
func indentFmt(indent, s string) string
```

### <a id="isGoFile" href="#isGoFile">func isGoFile(fi fs.FileInfo) bool</a>

```
searchKey: doc.isGoFile
```

```Go
func isGoFile(fi fs.FileInfo) bool
```

### <a id="test" href="#test">func test(t *testing.T, mode Mode)</a>

```
searchKey: doc.test
```

```Go
func test(t *testing.T, mode Mode)
```

### <a id="Test" href="#Test">func Test(t *testing.T)</a>

```
searchKey: doc.Test
```

```Go
func Test(t *testing.T)
```

### <a id="TestAnchorID" href="#TestAnchorID">func TestAnchorID(t *testing.T)</a>

```
searchKey: doc.TestAnchorID
```

```Go
func TestAnchorID(t *testing.T)
```

### <a id="TestSynopsis" href="#TestSynopsis">func TestSynopsis(t *testing.T)</a>

```
searchKey: doc.TestSynopsis
```

```Go
func TestSynopsis(t *testing.T)
```
