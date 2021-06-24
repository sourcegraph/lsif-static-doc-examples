# Package template

Package template (html/template) implements data-driven templates for generating HTML output safe against code injection. It provides the same interface as package text/template and should be used instead of text/template whenever the output is HTML. 

The documentation here focuses on the security features of the package. For information about how to program the templates themselves, see the documentation for text/template. 

### hdr-IntroductionIntroduction
This package wraps package text/template so you can share its template API to parse and execute HTML templates safely. 

```
tmpl, err := template.New("name").Parse(...)
// Error checking elided
err = tmpl.Execute(out, data)

```
If successful, tmpl will now be injection-safe. Otherwise, err is an error defined in the docs for ErrorCode. 

HTML templates treat data values as plain text which should be encoded so they can be safely embedded in an HTML document. The escaping is contextual, so actions can appear within JavaScript, CSS, and URI contexts. 

The security model used by this package assumes that template authors are trusted, while Execute's data parameter is not. More details are provided below. 

Example 

```
import "text/template"
...
t, err := template.New("foo").Parse(`{{define "T"}}Hello, {{.}}!{{end}}`)
err = t.ExecuteTemplate(out, "T", "<script>alert('you have been pwned')</script>")

```
produces 

```
Hello, <script>alert('you have been pwned')</script>!

```
but the contextual autoescaping in html/template 

```
import "html/template"
...
t, err := template.New("foo").Parse(`{{define "T"}}Hello, {{.}}!{{end}}`)
err = t.ExecuteTemplate(out, "T", "<script>alert('you have been pwned')</script>")

```
produces safe, escaped HTML output 

```
Hello, &lt;script&gt;alert(&#39;you have been pwned&#39;)&lt;/script&gt;!

```
### hdr-ContextsContexts
This package understands HTML, CSS, JavaScript, and URIs. It adds sanitizing functions to each simple action pipeline, so given the excerpt 

```
<a href="/search?q={{.}}">{{.}}</a>

```
At parse time each {{.}} is overwritten to add escaping functions as necessary. In this case it becomes 

```
<a href="/search?q={{. | urlescaper | attrescaper}}">{{. | htmlescaper}}</a>

```
where urlescaper, attrescaper, and htmlescaper are aliases for internal escaping functions. 

For these internal escaping functions, if an action pipeline evaluates to a nil interface value, it is treated as though it were an empty string. 

### hdr-Namespaced_and_data__attributesNamespaced and data- attributes
Attributes with a namespace are treated as if they had no namespace. Given the excerpt 

```
<a my:href="{{.}}"></a>

```
At parse time the attribute will be treated as if it were just "href". So at parse time the template becomes: 

```
<a my:href="{{. | urlescaper | attrescaper}}"></a>

```
Similarly to attributes with namespaces, attributes with a "data-" prefix are treated as if they had no "data-" prefix. So given 

```
<a data-href="{{.}}"></a>

```
At parse time this becomes 

```
<a data-href="{{. | urlescaper | attrescaper}}"></a>

```
If an attribute has both a namespace and a "data-" prefix, only the namespace will be removed when determining the context. For example 

```
<a my:data-href="{{.}}"></a>

```
This is handled as if "my:data-href" was just "data-href" and not "href" as it would be if the "data-" prefix were to be ignored too. Thus at parse time this becomes just 

```
<a my:data-href="{{. | attrescaper}}"></a>

```
As a special case, attributes with the namespace "xmlns" are always treated as containing URLs. Given the excerpts 

```
<a xmlns:title="{{.}}"></a>
<a xmlns:href="{{.}}"></a>
<a xmlns:onclick="{{.}}"></a>

```
At parse time they become: 

```
<a xmlns:title="{{. | urlescaper | attrescaper}}"></a>
<a xmlns:href="{{. | urlescaper | attrescaper}}"></a>
<a xmlns:onclick="{{. | urlescaper | attrescaper}}"></a>

```
### hdr-ErrorsErrors
See the documentation of ErrorCode for details. 

### hdr-A_fuller_pictureA fuller picture
The rest of this package comment may be skipped on first reading; it includes details necessary to understand escaping contexts and error messages. Most users will not need to understand these details. 

### hdr-ContextsContexts
Assuming {{.}} is `O'Reilly: How are <i>you</i>?`, the table below shows how {{.}} appears when used in the context to the left. 

```
Context                          {{.}} After
{{.}}                            O'Reilly: How are &lt;i&gt;you&lt;/i&gt;?
<a title='{{.}}'>                O&#39;Reilly: How are you?
<a href="/{{.}}">                O&#39;Reilly: How are %3ci%3eyou%3c/i%3e?
<a href="?q={{.}}">              O&#39;Reilly%3a%20How%20are%3ci%3e...%3f
<a onx='f("{{.}}")'>             O\x27Reilly: How are \x3ci\x3eyou...?
<a onx='f({{.}})'>               "O\x27Reilly: How are \x3ci\x3eyou...?"
<a onx='pattern = /{{.}}/;'>     O\x27Reilly: How are \x3ci\x3eyou...\x3f

```
If used in an unsafe context, then the value might be filtered out: 

```
Context                          {{.}} After
<a href="{{.}}">                 #ZgotmplZ

```
since "O'Reilly:" is not an allowed protocol like "http:". 

If {{.}} is the innocuous word, `left`, then it can appear more widely, 

```
Context                              {{.}} After
{{.}}                                left
<a title='{{.}}'>                    left
<a href='{{.}}'>                     left
<a href='/{{.}}'>                    left
<a href='?dir={{.}}'>                left
<a style="border-{{.}}: 4px">        left
<a style="align: {{.}}">             left
<a style="background: '{{.}}'>       left
<a style="background: url('{{.}}')>  left
<style>p.{{.}} {color:red}</style>   left

```
Non-string values can be used in JavaScript contexts. If {{.}} is 

```
struct{A,B string}{ "foo", "bar" }

```
in the escaped template 

```
<script>var pair = {{.}};</script>

```
then the template output is 

```
<script>var pair = {"A": "foo", "B": "bar"};</script>

```
See package json to understand how non-string content is marshaled for embedding in JavaScript contexts. 

### hdr-Typed_StringsTyped Strings
By default, this package assumes that all pipelines produce a plain text string. It adds escaping pipeline stages necessary to correctly and safely embed that plain text string in the appropriate context. 

When a data value is not plain text, you can make sure it is not over-escaped by marking it with its type. 

Types HTML, JS, URL, and others from content.go can carry safe content that is exempted from escaping. 

The template 

```
Hello, {{.}}!

```
can be invoked with 

```
tmpl.Execute(out, template.HTML(`<b>World</b>`))

```
to produce 

```
Hello, <b>World</b>!

```
instead of the 

```
Hello, &lt;b&gt;World&lt;b&gt;!

```
that would have been produced if {{.}} was a regular string. 

### hdr-Security_ModelSecurity Model
[https://rawgit.com/mikesamuel/sanitized-jquery-templates/trunk/safetemplate.html#problem_definition](https://rawgit.com/mikesamuel/sanitized-jquery-templates/trunk/safetemplate.html#problem_definition) defines "safe" as used by this package. 

This package assumes that template authors are trusted, that Execute's data parameter is not, and seeks to preserve the properties below in the face of untrusted data: 

Structure Preservation Property: "... when a template author writes an HTML tag in a safe templating language, the browser will interpret the corresponding portion of the output as a tag regardless of the values of untrusted data, and similarly for other structures such as attribute boundaries and JS and CSS string boundaries." 

Code Effect Property: "... only code specified by the template author should run as a result of injecting the template output into a page and all code specified by the template author should run as a result of the same." 

Least Surprise Property: "A developer (or code reviewer) familiar with HTML, CSS, and JavaScript, who knows that contextual autoescaping happens should be able to look at a {{.}} and correctly infer what sanitization happens." 

## Index

* [Constants](#const)
    * [const ErrAmbigContext](#ErrAmbigContext)
    * [const ErrBadHTML](#ErrBadHTML)
    * [const ErrBranchEnd](#ErrBranchEnd)
    * [const ErrEndContext](#ErrEndContext)
    * [const ErrNoSuchTemplate](#ErrNoSuchTemplate)
    * [const ErrOutputContext](#ErrOutputContext)
    * [const ErrPartialCharset](#ErrPartialCharset)
    * [const ErrPartialEscape](#ErrPartialEscape)
    * [const ErrPredefinedEscaper](#ErrPredefinedEscaper)
    * [const ErrRangeLoopReentry](#ErrRangeLoopReentry)
    * [const ErrSlashAmbig](#ErrSlashAmbig)
    * [const OK](#OK)
    * [const alwaysErrorText](#alwaysErrorText)
    * [const attrNone](#attrNone)
    * [const attrScript](#attrScript)
    * [const attrScriptType](#attrScriptType)
    * [const attrSrcset](#attrSrcset)
    * [const attrStyle](#attrStyle)
    * [const attrURL](#attrURL)
    * [const cloneText1](#cloneText1)
    * [const cloneText2](#cloneText2)
    * [const cloneText3](#cloneText3)
    * [const cloneText4](#cloneText4)
    * [const contentTypeCSS](#contentTypeCSS)
    * [const contentTypeHTML](#contentTypeHTML)
    * [const contentTypeHTMLAttr](#contentTypeHTMLAttr)
    * [const contentTypeJS](#contentTypeJS)
    * [const contentTypeJSStr](#contentTypeJSStr)
    * [const contentTypePlain](#contentTypePlain)
    * [const contentTypeSrcset](#contentTypeSrcset)
    * [const contentTypeURL](#contentTypeURL)
    * [const contentTypeUnsafe](#contentTypeUnsafe)
    * [const delimDoubleQuote](#delimDoubleQuote)
    * [const delimNone](#delimNone)
    * [const delimSingleQuote](#delimSingleQuote)
    * [const delimSpaceOrTagEnd](#delimSpaceOrTagEnd)
    * [const elementNone](#elementNone)
    * [const elementScript](#elementScript)
    * [const elementStyle](#elementStyle)
    * [const elementTextarea](#elementTextarea)
    * [const elementTitle](#elementTitle)
    * [const execErrorText](#execErrorText)
    * [const filterFailsafe](#filterFailsafe)
    * [const htmlSpaceAndASCIIAlnumBytes](#htmlSpaceAndASCIIAlnumBytes)
    * [const jsCtxDivOp](#jsCtxDivOp)
    * [const jsCtxRegexp](#jsCtxRegexp)
    * [const jsCtxUnknown](#jsCtxUnknown)
    * [const multiText1](#multiText1)
    * [const multiText2](#multiText2)
    * [const raceText](#raceText)
    * [const stateAfterName](#stateAfterName)
    * [const stateAttr](#stateAttr)
    * [const stateAttrName](#stateAttrName)
    * [const stateBeforeValue](#stateBeforeValue)
    * [const stateCSS](#stateCSS)
    * [const stateCSSBlockCmt](#stateCSSBlockCmt)
    * [const stateCSSDqStr](#stateCSSDqStr)
    * [const stateCSSDqURL](#stateCSSDqURL)
    * [const stateCSSLineCmt](#stateCSSLineCmt)
    * [const stateCSSSqStr](#stateCSSSqStr)
    * [const stateCSSSqURL](#stateCSSSqURL)
    * [const stateCSSURL](#stateCSSURL)
    * [const stateError](#stateError)
    * [const stateHTMLCmt](#stateHTMLCmt)
    * [const stateJS](#stateJS)
    * [const stateJSBlockCmt](#stateJSBlockCmt)
    * [const stateJSDqStr](#stateJSDqStr)
    * [const stateJSLineCmt](#stateJSLineCmt)
    * [const stateJSRegexp](#stateJSRegexp)
    * [const stateJSSqStr](#stateJSSqStr)
    * [const stateRCDATA](#stateRCDATA)
    * [const stateSrcset](#stateSrcset)
    * [const stateTag](#stateTag)
    * [const stateText](#stateText)
    * [const stateURL](#stateURL)
    * [const testTemplates](#testTemplates)
    * [const treeTemplate](#treeTemplate)
    * [const urlPartNone](#urlPartNone)
    * [const urlPartPreQuery](#urlPartPreQuery)
    * [const urlPartQueryOrFrag](#urlPartQueryOrFrag)
    * [const urlPartUnknown](#urlPartUnknown)
    * [const _attr_name](#_attr_name)
    * [const _delim_name](#_delim_name)
    * [const _element_name](#_element_name)
    * [const _jsCtx_name](#_jsCtx_name)
    * [const _state_name](#_state_name)
    * [const _urlPart_name](#_urlPart_name)
* [Variables](#var)
    * [var alwaysError](#alwaysError)
    * [var attrStartStates](#attrStartStates)
    * [var attrTypeMap](#attrTypeMap)
    * [var bigInt](#bigInt)
    * [var bigUint](#bigUint)
    * [var blockCommentEnd](#blockCommentEnd)
    * [var cmpTests](#cmpTests)
    * [var commentEnd](#commentEnd)
    * [var commentStart](#commentStart)
    * [var cssReplacementTable](#cssReplacementTable)
    * [var debug](#debug)
    * [var delimEnds](#delimEnds)
    * [var delimPairs](#delimPairs)
    * [var doctypeBytes](#doctypeBytes)
    * [var elementContentType](#elementContentType)
    * [var elementNameMap](#elementNameMap)
    * [var equivEscapers](#equivEscapers)
    * [var errorType](#errorType)
    * [var escapeOK](#escapeOK)
    * [var execTests](#execTests)
    * [var expressionBytes](#expressionBytes)
    * [var fmtStringerType](#fmtStringerType)
    * [var funcMap](#funcMap)
    * [var htmlNormReplacementTable](#htmlNormReplacementTable)
    * [var htmlNospaceNormReplacementTable](#htmlNospaceNormReplacementTable)
    * [var htmlNospaceReplacementTable](#htmlNospaceReplacementTable)
    * [var htmlReplacementTable](#htmlReplacementTable)
    * [var iVal](#iVal)
    * [var jsRegexpReplacementTable](#jsRegexpReplacementTable)
    * [var jsStrNormReplacementTable](#jsStrNormReplacementTable)
    * [var jsStrReplacementTable](#jsStrReplacementTable)
    * [var jsonMarshalType](#jsonMarshalType)
    * [var lowUnicodeReplacementTable](#lowUnicodeReplacementTable)
    * [var mozBindingBytes](#mozBindingBytes)
    * [var multiExecTests](#multiExecTests)
    * [var myError](#myError)
    * [var predefinedEscapers](#predefinedEscapers)
    * [var redundantFuncs](#redundantFuncs)
    * [var regexpPrecederKeywords](#regexpPrecederKeywords)
    * [var siVal](#siVal)
    * [var specialTagEndMarkers](#specialTagEndMarkers)
    * [var specialTagEndPrefix](#specialTagEndPrefix)
    * [var tSliceOfNil](#tSliceOfNil)
    * [var tVal](#tVal)
    * [var tagEndSeparators](#tagEndSeparators)
    * [var templateFileExecTests](#templateFileExecTests)
    * [var transitionFunc](#transitionFunc)
    * [var _attr_index](#_attr_index)
    * [var _delim_index](#_delim_index)
    * [var _element_index](#_element_index)
    * [var _jsCtx_index](#_jsCtx_index)
    * [var _state_index](#_state_index)
    * [var _urlPart_index](#_urlPart_index)
* [Types](#type)
    * [type CSS string](#CSS)
    * [type Error struct](#Error)
        * [func eatAttrName(s []byte, i int) (int, *Error)](#eatAttrName)
        * [func errorf(k ErrorCode, node parse.Node, line int, f string, args ...interface{}) *Error](#errorf)
        * [func (e *Error) Error() string](#Error.Error)
    * [type ErrorCode int](#ErrorCode)
    * [type ErrorWriter int](#ErrorWriter)
        * [func (e ErrorWriter) Write(p []byte) (int, error)](#ErrorWriter.Write)
    * [type FuncMap map[string]interface{}](#FuncMap)
    * [type HTML string](#HTML)
    * [type HTMLAttr string](#HTMLAttr)
    * [type I interface](#I)
    * [type Issue7379 int](#Issue7379)
        * [func (Issue7379) SomeMethod(x int) string](#Issue7379.SomeMethod)
    * [type JS string](#JS)
    * [type JSStr string](#JSStr)
    * [type S []string](#S)
        * [func (S) Method0() string](#S.Method0)
    * [type Srcset string](#Srcset)
    * [type T struct](#T)
        * [func (t *T) Copy() *T](#T.Copy)
        * [func (t *T) GetU() *U](#T.GetU)
        * [func (t *T) MAdd(a int, b []int) []int](#T.MAdd)
        * [func (t *T) Method0() string](#T.Method0)
        * [func (t *T) Method1(a int) int](#T.Method1)
        * [func (t *T) Method2(a uint16, b string) string](#T.Method2)
        * [func (t *T) Method3(v interface{}) string](#T.Method3)
        * [func (t *T) MyError(error bool) (bool, error)](#T.MyError)
    * [type Template struct](#Template)
        * [func Must(t *Template, err error) *Template](#Must)
        * [func New(name string) *Template](#New)
        * [func ParseFS(fs fs.FS, patterns ...string) (*Template, error)](#ParseFS)
        * [func ParseFiles(filenames ...string) (*Template, error)](#ParseFiles)
        * [func ParseGlob(pattern string) (*Template, error)](#ParseGlob)
        * [func parseFS(t *Template, fsys fs.FS, patterns []string) (*Template, error)](#parseFS)
        * [func parseFiles(t *Template, readFile func(string) (string, []byte, error), filenames ...string) (*Template, error)](#parseFiles)
        * [func parseGlob(t *Template, pattern string) (*Template, error)](#parseGlob)
        * [func (t *Template) AddParseTree(name string, tree *parse.Tree) (*Template, error)](#Template.AddParseTree)
        * [func (t *Template) Clone() (*Template, error)](#Template.Clone)
        * [func (t *Template) DefinedTemplates() string](#Template.DefinedTemplates)
        * [func (t *Template) Delims(left, right string) *Template](#Template.Delims)
        * [func (t *Template) Execute(wr io.Writer, data interface{}) error](#Template.Execute)
        * [func (t *Template) ExecuteTemplate(wr io.Writer, name string, data interface{}) error](#Template.ExecuteTemplate)
        * [func (t *Template) Funcs(funcMap FuncMap) *Template](#Template.Funcs)
        * [func (t *Template) Lookup(name string) *Template](#Template.Lookup)
        * [func (t *Template) Name() string](#Template.Name)
        * [func (t *Template) New(name string) *Template](#Template.New)
        * [func (t *Template) Option(opt ...string) *Template](#Template.Option)
        * [func (t *Template) Parse(text string) (*Template, error)](#Template.Parse)
        * [func (t *Template) ParseFS(fs fs.FS, patterns ...string) (*Template, error)](#Template.ParseFS)
        * [func (t *Template) ParseFiles(filenames ...string) (*Template, error)](#Template.ParseFiles)
        * [func (t *Template) ParseGlob(pattern string) (*Template, error)](#Template.ParseGlob)
        * [func (t *Template) Templates() []*Template](#Template.Templates)
        * [func (t *Template) checkCanParse() error](#Template.checkCanParse)
        * [func (t *Template) escape() error](#Template.escape)
        * [func (t *Template) lookupAndEscapeTemplate(name string) (tmpl *Template, err error)](#Template.lookupAndEscapeTemplate)
        * [func (t *Template) new(name string) *Template](#Template.new)
    * [type Tree struct](#Tree)
    * [type U struct](#U)
        * [func (u *U) TrueFalse(b bool) string](#U.TrueFalse)
    * [type URL string](#URL)
    * [type V struct](#V)
        * [func (v *V) String() string](#V.String)
    * [type W struct](#W)
        * [func (w *W) Error() string](#W.Error)
    * [type attr uint8](#attr)
        * [func (i attr) String() string](#attr.String)
    * [type badMarshaler struct{}](#badMarshaler)
        * [func (x *badMarshaler) MarshalJSON() ([]byte, error)](#badMarshaler.MarshalJSON)
    * [type cmpTest struct](#cmpTest)
    * [type contentType uint8](#contentType)
        * [func attrType(name string) contentType](#attrType)
        * [func stringify(args ...interface{}) (string, contentType)](#stringify)
    * [type context struct](#context)
        * [func contextAfterText(c context, s []byte) (context, int)](#contextAfterText)
        * [func join(a, b context, node parse.Node, nodeName string) context](#join)
        * [func nudge(c context) context](#nudge)
        * [func tAfterName(c context, s []byte) (context, int)](#tAfterName)
        * [func tAttr(c context, s []byte) (context, int)](#tAttr)
        * [func tAttrName(c context, s []byte) (context, int)](#tAttrName)
        * [func tBeforeValue(c context, s []byte) (context, int)](#tBeforeValue)
        * [func tBlockCmt(c context, s []byte) (context, int)](#tBlockCmt)
        * [func tCSS(c context, s []byte) (context, int)](#tCSS)
        * [func tCSSStr(c context, s []byte) (context, int)](#tCSSStr)
        * [func tError(c context, s []byte) (context, int)](#tError)
        * [func tHTMLCmt(c context, s []byte) (context, int)](#tHTMLCmt)
        * [func tJS(c context, s []byte) (context, int)](#tJS)
        * [func tJSDelimited(c context, s []byte) (context, int)](#tJSDelimited)
        * [func tLineCmt(c context, s []byte) (context, int)](#tLineCmt)
        * [func tSpecialTagEnd(c context, s []byte) (context, int)](#tSpecialTagEnd)
        * [func tTag(c context, s []byte) (context, int)](#tTag)
        * [func tText(c context, s []byte) (context, int)](#tText)
        * [func tURL(c context, s []byte) (context, int)](#tURL)
        * [func (c context) String() string](#context.String)
        * [func (c context) eq(d context) bool](#context.eq)
        * [func (c context) mangle(templateName string) string](#context.mangle)
    * [type delim uint8](#delim)
        * [func (i delim) String() string](#delim.String)
    * [type element uint8](#element)
        * [func eatTagName(s []byte, i int) (int, element)](#eatTagName)
        * [func (i element) String() string](#element.String)
    * [type errorer struct](#errorer)
        * [func (s *errorer) Error() string](#errorer.Error)
    * [type escaper struct](#escaper)
        * [func makeEscaper(n *nameSpace) escaper](#makeEscaper)
        * [func (e *escaper) arbitraryTemplate() *Template](#escaper.arbitraryTemplate)
        * [func (e *escaper) commit()](#escaper.commit)
        * [func (e *escaper) computeOutCtx(c context, t *template.Template) context](#escaper.computeOutCtx)
        * [func (e *escaper) editActionNode(n *parse.ActionNode, cmds []string)](#escaper.editActionNode)
        * [func (e *escaper) editTemplateNode(n *parse.TemplateNode, callee string)](#escaper.editTemplateNode)
        * [func (e *escaper) editTextNode(n *parse.TextNode, text []byte)](#escaper.editTextNode)
        * [func (e *escaper) escape(c context, n parse.Node) context](#escaper.escape)
        * [func (e *escaper) escapeAction(c context, n *parse.ActionNode) context](#escaper.escapeAction)
        * [func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string) context](#escaper.escapeBranch)
        * [func (e *escaper) escapeList(c context, n *parse.ListNode) context](#escaper.escapeList)
        * [func (e *escaper) escapeListConditionally(c context, n *parse.ListNode, filter func(*escaper, context) bool) (context, bool)](#escaper.escapeListConditionally)
        * [func (e *escaper) escapeTemplate(c context, n *parse.TemplateNode) context](#escaper.escapeTemplate)
        * [func (e *escaper) escapeTemplateBody(c context, t *template.Template) (context, bool)](#escaper.escapeTemplateBody)
        * [func (e *escaper) escapeText(c context, n *parse.TextNode) context](#escaper.escapeText)
        * [func (e *escaper) escapeTree(c context, node parse.Node, name string, line int) (context, string)](#escaper.escapeTree)
        * [func (e *escaper) template(name string) *template.Template](#escaper.template)
    * [type execTest struct](#execTest)
    * [type goodMarshaler struct{}](#goodMarshaler)
        * [func (x *goodMarshaler) MarshalJSON() ([]byte, error)](#goodMarshaler.MarshalJSON)
    * [type jsCtx uint8](#jsCtx)
        * [func nextJSCtx(s []byte, preceding jsCtx) jsCtx](#nextJSCtx)
        * [func (i jsCtx) String() string](#jsCtx.String)
    * [type myStringer struct](#myStringer)
        * [func (s *myStringer) String() string](#myStringer.String)
    * [type nameSpace struct](#nameSpace)
    * [type recursiveInvoker struct](#recursiveInvoker)
        * [func (r *recursiveInvoker) Recur() (string, error)](#recursiveInvoker.Recur)
    * [type state uint8](#state)
        * [func (i state) String() string](#state.String)
    * [type urlPart uint8](#urlPart)
        * [func (i urlPart) String() string](#urlPart.String)
* [Functions](#func)
    * [func BenchmarkCSSEscaper(b *testing.B)](#BenchmarkCSSEscaper)
    * [func BenchmarkCSSEscaperNoSpecials(b *testing.B)](#BenchmarkCSSEscaperNoSpecials)
    * [func BenchmarkCSSValueFilter(b *testing.B)](#BenchmarkCSSValueFilter)
    * [func BenchmarkCSSValueFilterOk(b *testing.B)](#BenchmarkCSSValueFilterOk)
    * [func BenchmarkDecodeCSS(b *testing.B)](#BenchmarkDecodeCSS)
    * [func BenchmarkDecodeCSSNoSpecials(b *testing.B)](#BenchmarkDecodeCSSNoSpecials)
    * [func BenchmarkEscapedExecute(b *testing.B)](#BenchmarkEscapedExecute)
    * [func BenchmarkHTMLNospaceEscaper(b *testing.B)](#BenchmarkHTMLNospaceEscaper)
    * [func BenchmarkHTMLNospaceEscaperNoSpecials(b *testing.B)](#BenchmarkHTMLNospaceEscaperNoSpecials)
    * [func BenchmarkJSRegexpEscaper(b *testing.B)](#BenchmarkJSRegexpEscaper)
    * [func BenchmarkJSRegexpEscaperNoSpecials(b *testing.B)](#BenchmarkJSRegexpEscaperNoSpecials)
    * [func BenchmarkJSStrEscaper(b *testing.B)](#BenchmarkJSStrEscaper)
    * [func BenchmarkJSStrEscaperNoSpecials(b *testing.B)](#BenchmarkJSStrEscaperNoSpecials)
    * [func BenchmarkJSValEscaperWithNum(b *testing.B)](#BenchmarkJSValEscaperWithNum)
    * [func BenchmarkJSValEscaperWithObj(b *testing.B)](#BenchmarkJSValEscaperWithObj)
    * [func BenchmarkJSValEscaperWithObjNoSpecials(b *testing.B)](#BenchmarkJSValEscaperWithObjNoSpecials)
    * [func BenchmarkJSValEscaperWithStr(b *testing.B)](#BenchmarkJSValEscaperWithStr)
    * [func BenchmarkJSValEscaperWithStrNoSpecials(b *testing.B)](#BenchmarkJSValEscaperWithStrNoSpecials)
    * [func BenchmarkSrcsetFilter(b *testing.B)](#BenchmarkSrcsetFilter)
    * [func BenchmarkSrcsetFilterNoSpecials(b *testing.B)](#BenchmarkSrcsetFilterNoSpecials)
    * [func BenchmarkStripTags(b *testing.B)](#BenchmarkStripTags)
    * [func BenchmarkStripTagsNoSpecials(b *testing.B)](#BenchmarkStripTagsNoSpecials)
    * [func BenchmarkTemplateSpecialTags(b *testing.B)](#BenchmarkTemplateSpecialTags)
    * [func BenchmarkURLEscaper(b *testing.B)](#BenchmarkURLEscaper)
    * [func BenchmarkURLEscaperNoSpecials(b *testing.B)](#BenchmarkURLEscaperNoSpecials)
    * [func BenchmarkURLNormalizer(b *testing.B)](#BenchmarkURLNormalizer)
    * [func BenchmarkURLNormalizerNoSpecials(b *testing.B)](#BenchmarkURLNormalizerNoSpecials)
    * [func HTMLEscape(w io.Writer, b []byte)](#HTMLEscape)
    * [func HTMLEscapeString(s string) string](#HTMLEscapeString)
    * [func HTMLEscaper(args ...interface{}) string](#HTMLEscaper)
    * [func IsTrue(val interface{}) (truth, ok bool)](#IsTrue)
    * [func JSEscape(w io.Writer, b []byte)](#JSEscape)
    * [func JSEscapeString(s string) string](#JSEscapeString)
    * [func JSEscaper(args ...interface{}) string](#JSEscaper)
    * [func TestAddParseTreeHTML(t *testing.T)](#TestAddParseTreeHTML)
    * [func TestAddParseTreeToUnparsedTemplate(t *testing.T)](#TestAddParseTreeToUnparsedTemplate)
    * [func TestAddrOfIndex(t *testing.T)](#TestAddrOfIndex)
    * [func TestAliasedParseTreeDoesNotOverescape(t *testing.T)](#TestAliasedParseTreeDoesNotOverescape)
    * [func TestBadFuncNames(t *testing.T)](#TestBadFuncNames)
    * [func TestBlock(t *testing.T)](#TestBlock)
    * [func TestCSSEscaper(t *testing.T)](#TestCSSEscaper)
    * [func TestCSSValueFilter(t *testing.T)](#TestCSSValueFilter)
    * [func TestClone(t *testing.T)](#TestClone)
    * [func TestCloneCrash(t *testing.T)](#TestCloneCrash)
    * [func TestCloneGrowth(t *testing.T)](#TestCloneGrowth)
    * [func TestClonePipe(t *testing.T)](#TestClonePipe)
    * [func TestCloneRedefinedName(t *testing.T)](#TestCloneRedefinedName)
    * [func TestCloneThenParse(t *testing.T)](#TestCloneThenParse)
    * [func TestComparison(t *testing.T)](#TestComparison)
    * [func TestDecodeCSS(t *testing.T)](#TestDecodeCSS)
    * [func TestDelims(t *testing.T)](#TestDelims)
    * [func TestEmptyTemplate(t *testing.T)](#TestEmptyTemplate)
    * [func TestEmptyTemplateCloneCrash(t *testing.T)](#TestEmptyTemplateCloneCrash)
    * [func TestEmptyTemplateHTML(t *testing.T)](#TestEmptyTemplateHTML)
    * [func TestEndsWithCSSKeyword(t *testing.T)](#TestEndsWithCSSKeyword)
    * [func TestEnsurePipelineContains(t *testing.T)](#TestEnsurePipelineContains)
    * [func TestErrorOnUndefined(t *testing.T)](#TestErrorOnUndefined)
    * [func TestErrors(t *testing.T)](#TestErrors)
    * [func TestEscape(t *testing.T)](#TestEscape)
    * [func TestEscapeErrorsNotIgnorable(t *testing.T)](#TestEscapeErrorsNotIgnorable)
    * [func TestEscapeMalformedPipelines(t *testing.T)](#TestEscapeMalformedPipelines)
    * [func TestEscapeMap(t *testing.T)](#TestEscapeMap)
    * [func TestEscapeRace(t *testing.T)](#TestEscapeRace)
    * [func TestEscapeSet(t *testing.T)](#TestEscapeSet)
    * [func TestEscapeSetErrorsNotIgnorable(t *testing.T)](#TestEscapeSetErrorsNotIgnorable)
    * [func TestEscapeText(t *testing.T)](#TestEscapeText)
    * [func TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T)](#TestEscapersOnLower7AndSelectHighCodepoints)
    * [func TestEscapingNilNonemptyInterfaces(t *testing.T)](#TestEscapingNilNonemptyInterfaces)
    * [func TestEvalFieldErrors(t *testing.T)](#TestEvalFieldErrors)
    * [func TestExecError(t *testing.T)](#TestExecError)
    * [func TestExecute(t *testing.T)](#TestExecute)
    * [func TestExecuteError(t *testing.T)](#TestExecuteError)
    * [func TestExecuteGivesExecError(t *testing.T)](#TestExecuteGivesExecError)
    * [func TestExecuteOnNewTemplate(t *testing.T)](#TestExecuteOnNewTemplate)
    * [func TestExecutePanicDuringCall(t *testing.T)](#TestExecutePanicDuringCall)
    * [func TestFinalForPrintf(t *testing.T)](#TestFinalForPrintf)
    * [func TestFindEndTag(t *testing.T)](#TestFindEndTag)
    * [func TestFuncMapWorksAfterClone(t *testing.T)](#TestFuncMapWorksAfterClone)
    * [func TestGoodFuncNames(t *testing.T)](#TestGoodFuncNames)
    * [func TestHTMLNospaceEscaper(t *testing.T)](#TestHTMLNospaceEscaper)
    * [func TestHexDecode(t *testing.T)](#TestHexDecode)
    * [func TestIdempotentExecute(t *testing.T)](#TestIdempotentExecute)
    * [func TestIndirectPrint(t *testing.T)](#TestIndirectPrint)
    * [func TestInterfaceValues(t *testing.T)](#TestInterfaceValues)
    * [func TestIsCSSNmchar(t *testing.T)](#TestIsCSSNmchar)
    * [func TestIsJsMimeType(t *testing.T)](#TestIsJsMimeType)
    * [func TestIssue19294(t *testing.T)](#TestIssue19294)
    * [func TestIssue31810(t *testing.T)](#TestIssue31810)
    * [func TestJSEscaping(t *testing.T)](#TestJSEscaping)
    * [func TestJSRegexpEscaper(t *testing.T)](#TestJSRegexpEscaper)
    * [func TestJSStrEscaper(t *testing.T)](#TestJSStrEscaper)
    * [func TestJSValEscaper(t *testing.T)](#TestJSValEscaper)
    * [func TestMaxExecDepth(t *testing.T)](#TestMaxExecDepth)
    * [func TestMessageForExecuteEmpty(t *testing.T)](#TestMessageForExecuteEmpty)
    * [func TestMissingMapKey(t *testing.T)](#TestMissingMapKey)
    * [func TestMultiExecute(t *testing.T)](#TestMultiExecute)
    * [func TestNextJsCtx(t *testing.T)](#TestNextJsCtx)
    * [func TestOrphanedTemplate(t *testing.T)](#TestOrphanedTemplate)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestParseFS(t *testing.T)](#TestParseFS)
    * [func TestParseFiles(t *testing.T)](#TestParseFiles)
    * [func TestParseFilesWithData(t *testing.T)](#TestParseFilesWithData)
    * [func TestParseGlob(t *testing.T)](#TestParseGlob)
    * [func TestParseGlobWithData(t *testing.T)](#TestParseGlobWithData)
    * [func TestParseZipFS(t *testing.T)](#TestParseZipFS)
    * [func TestPipeToMethodIsEscaped(t *testing.T)](#TestPipeToMethodIsEscaped)
    * [func TestRecursiveExecute(t *testing.T)](#TestRecursiveExecute)
    * [func TestRecursiveExecuteViaMethod(t *testing.T)](#TestRecursiveExecuteViaMethod)
    * [func TestRedefinition(t *testing.T)](#TestRedefinition)
    * [func TestRedundantFuncs(t *testing.T)](#TestRedundantFuncs)
    * [func TestSkipCSSSpace(t *testing.T)](#TestSkipCSSSpace)
    * [func TestSrcsetFilter(t *testing.T)](#TestSrcsetFilter)
    * [func TestStringer(t *testing.T)](#TestStringer)
    * [func TestStripTags(t *testing.T)](#TestStripTags)
    * [func TestTemplateCloneExecuteRace(t *testing.T)](#TestTemplateCloneExecuteRace)
    * [func TestTemplateCloneLookup(t *testing.T)](#TestTemplateCloneLookup)
    * [func TestTemplateFuncsAfterClone(t *testing.T)](#TestTemplateFuncsAfterClone)
    * [func TestTemplateLookUp(t *testing.T)](#TestTemplateLookUp)
    * [func TestTemplates(t *testing.T)](#TestTemplates)
    * [func TestTree(t *testing.T)](#TestTree)
    * [func TestTypedContent(t *testing.T)](#TestTypedContent)
    * [func TestURLFilters(t *testing.T)](#TestURLFilters)
    * [func TestURLNormalizer(t *testing.T)](#TestURLNormalizer)
    * [func TestUnterminatedStringError(t *testing.T)](#TestUnterminatedStringError)
    * [func URLQueryEscaper(args ...interface{}) string](#URLQueryEscaper)
    * [func add(args ...int) int](#add)
    * [func appendCmd(cmds []*parse.CommandNode, cmd *parse.CommandNode) []*parse.CommandNode](#appendCmd)
    * [func asciiAlpha(c byte) bool](#asciiAlpha)
    * [func asciiAlphaNum(c byte) bool](#asciiAlphaNum)
    * [func attrEscaper(args ...interface{}) string](#attrEscaper)
    * [func commentEscaper(args ...interface{}) string](#commentEscaper)
    * [func count(n int) chan string](#count)
    * [func cssEscaper(args ...interface{}) string](#cssEscaper)
    * [func cssValueFilter(args ...interface{}) string](#cssValueFilter)
    * [func dddArg(a int, b ...string) string](#dddArg)
    * [func decodeCSS(s []byte) []byte](#decodeCSS)
    * [func eatWhiteSpace(s []byte, i int) int](#eatWhiteSpace)
    * [func echo(arg interface{}) interface{}](#echo)
    * [func endsWithCSSKeyword(b []byte, kw string) bool](#endsWithCSSKeyword)
    * [func ensurePipelineContains(p *parse.PipeNode, s []string)](#ensurePipelineContains)
    * [func escFnsEq(a, b string) bool](#escFnsEq)
    * [func escapeTemplate(tmpl *Template, node parse.Node, name string) error](#escapeTemplate)
    * [func evalArgs(args ...interface{}) string](#evalArgs)
    * [func filterSrcsetElement(s string, left int, right int, b *bytes.Buffer)](#filterSrcsetElement)
    * [func funcNameTestFunc() int](#funcNameTestFunc)
    * [func hexDecode(s []byte) rune](#hexDecode)
    * [func htmlEscaper(args ...interface{}) string](#htmlEscaper)
    * [func htmlNameFilter(args ...interface{}) string](#htmlNameFilter)
    * [func htmlNospaceEscaper(args ...interface{}) string](#htmlNospaceEscaper)
    * [func htmlReplacer(s string, replacementTable []string, badRunes bool) string](#htmlReplacer)
    * [func indexTagEnd(s []byte, tag []byte) int](#indexTagEnd)
    * [func indirect(a interface{}) interface{}](#indirect)
    * [func indirectToJSONMarshaler(a interface{}) interface{}](#indirectToJSONMarshaler)
    * [func indirectToStringerOrError(a interface{}) interface{}](#indirectToStringerOrError)
    * [func isCSSNmchar(r rune) bool](#isCSSNmchar)
    * [func isCSSSpace(b byte) bool](#isCSSSpace)
    * [func isComment(s state) bool](#isComment)
    * [func isHTMLSpace(c byte) bool](#isHTMLSpace)
    * [func isHTMLSpaceOrASCIIAlnum(c byte) bool](#isHTMLSpaceOrASCIIAlnum)
    * [func isHex(c byte) bool](#isHex)
    * [func isInTag(s state) bool](#isInTag)
    * [func isJSIdentPart(r rune) bool](#isJSIdentPart)
    * [func isJSType(mimeType string) bool](#isJSType)
    * [func isSafeURL(s string) bool](#isSafeURL)
    * [func jsRegexpEscaper(args ...interface{}) string](#jsRegexpEscaper)
    * [func jsStrEscaper(args ...interface{}) string](#jsStrEscaper)
    * [func jsValEscaper(args ...interface{}) string](#jsValEscaper)
    * [func makemap(arg ...string) map[string]string](#makemap)
    * [func mapOfThree() interface{}](#mapOfThree)
    * [func newIdentCmd(identifier string, pos parse.Pos) *parse.CommandNode](#newIdentCmd)
    * [func newInt(n int) *int](#newInt)
    * [func newIntSlice(n ...int) *[]int](#newIntSlice)
    * [func newString(s string) *string](#newString)
    * [func normalizeEscFn(e string) string](#normalizeEscFn)
    * [func oneArg(a string) string](#oneArg)
    * [func processURLOnto(s string, norm bool, b *bytes.Buffer) bool](#processURLOnto)
    * [func rcdataEscaper(args ...interface{}) string](#rcdataEscaper)
    * [func readFileFS(fsys fs.FS) func(string) (string, []byte, error)](#readFileFS)
    * [func readFileOS(file string) (name string, b []byte, err error)](#readFileOS)
    * [func replace(s string, replacementTable []string) string](#replace)
    * [func returnInt() int](#returnInt)
    * [func skipCSSSpace(c []byte) []byte](#skipCSSSpace)
    * [func srcsetFilterAndEscaper(args ...interface{}) string](#srcsetFilterAndEscaper)
    * [func stringer(s fmt.Stringer) string](#stringer)
    * [func stripTags(html string) string](#stripTags)
    * [func testBadFuncName(name string, t *testing.T)](#testBadFuncName)
    * [func testExecute(execTests []execTest, template *Template, t *testing.T)](#testExecute)
    * [func twoArgs(a, b string) string](#twoArgs)
    * [func typeOf(arg interface{}) string](#typeOf)
    * [func urlEscaper(args ...interface{}) string](#urlEscaper)
    * [func urlFilter(args ...interface{}) string](#urlFilter)
    * [func urlNormalizer(args ...interface{}) string](#urlNormalizer)
    * [func urlProcessor(norm bool, args ...interface{}) string](#urlProcessor)
    * [func valueString(v string) string](#valueString)
    * [func vfunc(V, *V) string](#vfunc)
    * [func zeroArgs() string](#zeroArgs)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="ErrAmbigContext" href="#ErrAmbigContext">const ErrAmbigContext</a>

```
searchKey: template.ErrAmbigContext
tags: [constant number]
```

```Go
const ErrAmbigContext
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrAmbigContext: "... appears in an ambiguous context within a URL" Example: 

```
<a href="
   {{if .C}}
     /path/
   {{else}}
     /search?q=
   {{end}}
   {{.X}}
">

```
Discussion: 

```
 {{.X}} is in an ambiguous URL context since, depending on {{.C}},
it may be either a URL suffix or a query parameter.
 Moving {{.X}} into the condition removes the ambiguity:
 <a href="{{if .C}}/path/{{.X}}{{else}}/search?q={{.X}}">

```
### <a id="ErrBadHTML" href="#ErrBadHTML">const ErrBadHTML</a>

```
searchKey: template.ErrBadHTML
tags: [constant number]
```

```Go
const ErrBadHTML
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrBadHTML: "expected space, attr name, or end of tag, but got ...", 

```
"... in unquoted attr", "... in attribute name"

```
Example: 

```
<a href = /search?q=foo>
<href=foo>
<form na<e=...>
<option selected<

```
Discussion: 

```
This is often due to a typo in an HTML element, but some runes
are banned in tag names, attribute names, and unquoted attribute
values because they can tickle parser ambiguities.
Quoting all attributes is the best policy.

```
### <a id="ErrBranchEnd" href="#ErrBranchEnd">const ErrBranchEnd</a>

```
searchKey: template.ErrBranchEnd
tags: [constant number]
```

```Go
const ErrBranchEnd
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrBranchEnd: "{{if}} branches end in different contexts" Example: 

```
{{if .C}}<a href="{{end}}{{.X}}

```
Discussion: 

```
Package html/template statically examines each path through an
{{if}}, {{range}}, or {{with}} to escape any following pipelines.
The example is ambiguous since {{.X}} might be an HTML text node,
or a URL prefix in an HTML attribute. The context of {{.X}} is
used to figure out how to escape it, but that context depends on
the run-time value of {{.C}} which is not statically known.

The problem is usually something like missing quotes or angle
brackets, or can be avoided by refactoring to put the two contexts
into different branches of an if, range or with. If the problem
is in a {{range}} over a collection that should never be empty,
adding a dummy {{else}} can help.

```
### <a id="ErrEndContext" href="#ErrEndContext">const ErrEndContext</a>

```
searchKey: template.ErrEndContext
tags: [constant number]
```

```Go
const ErrEndContext
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrEndContext: "... ends in a non-text context: ..." Examples: 

```
<div
<div title="no close quote>
<script>f()

```
Discussion: 

```
Executed templates should produce a DocumentFragment of HTML.
Templates that end without closing tags will trigger this error.
Templates that should not be used in an HTML context or that
produce incomplete Fragments should not be executed directly.

{{define "main"}} <script>{{template "helper"}}</script> {{end}}
{{define "helper"}} document.write(' <div title=" ') {{end}}

"helper" does not produce a valid document fragment, so should
not be Executed directly.

```
### <a id="ErrNoSuchTemplate" href="#ErrNoSuchTemplate">const ErrNoSuchTemplate</a>

```
searchKey: template.ErrNoSuchTemplate
tags: [constant number]
```

```Go
const ErrNoSuchTemplate
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrNoSuchTemplate: "no such template ..." Examples: 

```
{{define "main"}}<div {{template "attrs"}}>{{end}}
{{define "attrs"}}href="{{.URL}}"{{end}}

```
Discussion: 

```
Package html/template looks through template calls to compute the
context.
Here the {{.URL}} in "attrs" must be treated as a URL when called
from "main", but you will get this error if "attrs" is not defined
when "main" is parsed.

```
### <a id="ErrOutputContext" href="#ErrOutputContext">const ErrOutputContext</a>

```
searchKey: template.ErrOutputContext
tags: [constant number]
```

```Go
const ErrOutputContext
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrOutputContext: "cannot compute output context for template ..." Examples: 

```
{{define "t"}}{{if .T}}{{template "t" .T}}{{end}}{{.H}}",{{end}}

```
Discussion: 

```
A recursive template does not end in the same context in which it
starts, and a reliable output context cannot be computed.
Look for typos in the named template.
If the template should not be called in the named start context,
look for calls to that template in unexpected contexts.
Maybe refactor recursive templates to not be recursive.

```
### <a id="ErrPartialCharset" href="#ErrPartialCharset">const ErrPartialCharset</a>

```
searchKey: template.ErrPartialCharset
tags: [constant number]
```

```Go
const ErrPartialCharset
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrPartialCharset: "unfinished JS regexp charset in ..." Example: 

```
<script>var pattern = /foo[{{.Chars}}]/</script>

```
Discussion: 

```
Package html/template does not support interpolation into regular
expression literal character sets.

```
### <a id="ErrPartialEscape" href="#ErrPartialEscape">const ErrPartialEscape</a>

```
searchKey: template.ErrPartialEscape
tags: [constant number]
```

```Go
const ErrPartialEscape
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrPartialEscape: "unfinished escape sequence in ..." Example: 

```
<script>alert("\{{.X}}")</script>

```
Discussion: 

```
Package html/template does not support actions following a
backslash.
This is usually an error and there are better solutions; for
example
  <script>alert("{{.X}}")</script>
should work, and if {{.X}} is a partial escape sequence such as
"xA0", mark the whole sequence as safe content: JSStr(`\xA0`)

```
### <a id="ErrPredefinedEscaper" href="#ErrPredefinedEscaper">const ErrPredefinedEscaper</a>

```
searchKey: template.ErrPredefinedEscaper
tags: [constant number]
```

```Go
const ErrPredefinedEscaper
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrPredefinedEscaper: "predefined escaper ... disallowed in template" Example: 

```
<div class={{. | html}}>Hello<div>

```
Discussion: 

```
Package html/template already contextually escapes all pipelines to
produce HTML output safe against code injection. Manually escaping
pipeline output using the predefined escapers "html" or "urlquery" is
unnecessary, and may affect the correctness or safety of the escaped
pipeline output in Go 1.8 and earlier.

In most cases, such as the given example, this error can be resolved by
simply removing the predefined escaper from the pipeline and letting the
contextual autoescaper handle the escaping of the pipeline. In other
instances, where the predefined escaper occurs in the middle of a
pipeline where subsequent commands expect escaped input, e.g.
  {{.X | html | makeALink}}
where makeALink does
  return `<a href="`+input+`">link</a>`
consider refactoring the surrounding template to make use of the
contextual autoescaper, i.e.
  <a href="{{.X}}">link</a>

To ease migration to Go 1.9 and beyond, "html" and "urlquery" will
continue to be allowed as the last command in a pipeline. However, if the
pipeline occurs in an unquoted attribute value context, "html" is
disallowed. Avoid using "html" and "urlquery" entirely in new templates.

```
### <a id="ErrRangeLoopReentry" href="#ErrRangeLoopReentry">const ErrRangeLoopReentry</a>

```
searchKey: template.ErrRangeLoopReentry
tags: [constant number]
```

```Go
const ErrRangeLoopReentry
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrRangeLoopReentry: "on range loop re-entry: ..." Example: 

```
<script>var x = [{{range .}}'{{.}},{{end}}]</script>

```
Discussion: 

```
If an iteration through a range would cause it to end in a
different context than an earlier pass, there is no single context.
In the example, there is missing a quote, so it is not clear
whether {{.}} is meant to be inside a JS string or in a JS value
context. The second iteration would produce something like

  <script>var x = ['firstValue,'secondValue]</script>

```
### <a id="ErrSlashAmbig" href="#ErrSlashAmbig">const ErrSlashAmbig</a>

```
searchKey: template.ErrSlashAmbig
tags: [constant number]
```

```Go
const ErrSlashAmbig
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
ErrSlashAmbig: '/' could start a division or regexp. Example: 

```
<script>
  {{if .C}}var x = 1{{end}}
  /-{{.N}}/i.test(x) ? doThis : doThat();
</script>

```
Discussion: 

```
The example above could produce `var x = 1/-2/i.test(s)...`
in which the first '/' is a mathematical division operator or it
could produce `/-2/i.test(s)` in which the first '/' starts a
regexp literal.
Look for missing semicolons inside branches, and maybe add
parentheses to make it clear which interpretation you intend.

```
### <a id="OK" href="#OK">const OK</a>

```
searchKey: template.OK
tags: [constant number]
```

```Go
const OK ErrorCode = iota
```

We define codes for each error that manifests while escaping templates, but escaped templates may also fail at runtime. 

Output: "ZgotmplZ" Example: 

```
<img src="{{.X}}">
where {{.X}} evaluates to `javascript:...`

```
Discussion: 

```
"ZgotmplZ" is a special value that indicates that unsafe content reached a
CSS or URL context at runtime. The output of the example will be
  <img src="#ZgotmplZ">
If the data comes from a trusted source, use content types to exempt it
from filtering: URL(`javascript:...`).

```
OK indicates the lack of an error. 

### <a id="alwaysErrorText" href="#alwaysErrorText">const alwaysErrorText</a>

```
searchKey: template.alwaysErrorText
tags: [constant string private]
```

```Go
const alwaysErrorText = "always be failing"
```

### <a id="attrNone" href="#attrNone">const attrNone</a>

```
searchKey: template.attrNone
tags: [constant number private]
```

```Go
const attrNone attr = iota
```

attrNone corresponds to a normal attribute or no attribute. 

### <a id="attrScript" href="#attrScript">const attrScript</a>

```
searchKey: template.attrScript
tags: [constant number private]
```

```Go
const attrScript
```

attrScript corresponds to an event handler attribute. 

### <a id="attrScriptType" href="#attrScriptType">const attrScriptType</a>

```
searchKey: template.attrScriptType
tags: [constant number private]
```

```Go
const attrScriptType
```

attrScriptType corresponds to the type attribute in script HTML element 

### <a id="attrSrcset" href="#attrSrcset">const attrSrcset</a>

```
searchKey: template.attrSrcset
tags: [constant number private]
```

```Go
const attrSrcset
```

attrSrcset corresponds to a srcset attribute. 

### <a id="attrStyle" href="#attrStyle">const attrStyle</a>

```
searchKey: template.attrStyle
tags: [constant number private]
```

```Go
const attrStyle
```

attrStyle corresponds to the style attribute whose value is CSS. 

### <a id="attrURL" href="#attrURL">const attrURL</a>

```
searchKey: template.attrURL
tags: [constant number private]
```

```Go
const attrURL
```

attrURL corresponds to an attribute whose value is a URL. 

### <a id="cloneText1" href="#cloneText1">const cloneText1</a>

```
searchKey: template.cloneText1
tags: [constant string private]
```

```Go
const cloneText1 = `{{define "a"}}{{template "b"}}{{template "c"}}{{end}}`
```

### <a id="cloneText2" href="#cloneText2">const cloneText2</a>

```
searchKey: template.cloneText2
tags: [constant string private]
```

```Go
const cloneText2 = `{{define "b"}}b{{end}}`
```

### <a id="cloneText3" href="#cloneText3">const cloneText3</a>

```
searchKey: template.cloneText3
tags: [constant string private]
```

```Go
const cloneText3 = `{{define "c"}}root{{end}}`
```

### <a id="cloneText4" href="#cloneText4">const cloneText4</a>

```
searchKey: template.cloneText4
tags: [constant string private]
```

```Go
const cloneText4 = `{{define "c"}}clone{{end}}`
```

### <a id="contentTypeCSS" href="#contentTypeCSS">const contentTypeCSS</a>

```
searchKey: template.contentTypeCSS
tags: [constant number private]
```

```Go
const contentTypeCSS
```

### <a id="contentTypeHTML" href="#contentTypeHTML">const contentTypeHTML</a>

```
searchKey: template.contentTypeHTML
tags: [constant number private]
```

```Go
const contentTypeHTML
```

### <a id="contentTypeHTMLAttr" href="#contentTypeHTMLAttr">const contentTypeHTMLAttr</a>

```
searchKey: template.contentTypeHTMLAttr
tags: [constant number private]
```

```Go
const contentTypeHTMLAttr
```

### <a id="contentTypeJS" href="#contentTypeJS">const contentTypeJS</a>

```
searchKey: template.contentTypeJS
tags: [constant number private]
```

```Go
const contentTypeJS
```

### <a id="contentTypeJSStr" href="#contentTypeJSStr">const contentTypeJSStr</a>

```
searchKey: template.contentTypeJSStr
tags: [constant number private]
```

```Go
const contentTypeJSStr
```

### <a id="contentTypePlain" href="#contentTypePlain">const contentTypePlain</a>

```
searchKey: template.contentTypePlain
tags: [constant number private]
```

```Go
const contentTypePlain contentType = iota
```

### <a id="contentTypeSrcset" href="#contentTypeSrcset">const contentTypeSrcset</a>

```
searchKey: template.contentTypeSrcset
tags: [constant number private]
```

```Go
const contentTypeSrcset
```

### <a id="contentTypeURL" href="#contentTypeURL">const contentTypeURL</a>

```
searchKey: template.contentTypeURL
tags: [constant number private]
```

```Go
const contentTypeURL
```

### <a id="contentTypeUnsafe" href="#contentTypeUnsafe">const contentTypeUnsafe</a>

```
searchKey: template.contentTypeUnsafe
tags: [constant number private]
```

```Go
const contentTypeUnsafe
```

contentTypeUnsafe is used in attr.go for values that affect how embedded content and network messages are formed, vetted, or interpreted; or which credentials network messages carry. 

### <a id="delimDoubleQuote" href="#delimDoubleQuote">const delimDoubleQuote</a>

```
searchKey: template.delimDoubleQuote
tags: [constant number private]
```

```Go
const delimDoubleQuote
```

delimDoubleQuote occurs when a double quote (") closes the attribute. 

### <a id="delimNone" href="#delimNone">const delimNone</a>

```
searchKey: template.delimNone
tags: [constant number private]
```

```Go
const delimNone delim = iota
```

delimNone occurs outside any attribute. 

### <a id="delimSingleQuote" href="#delimSingleQuote">const delimSingleQuote</a>

```
searchKey: template.delimSingleQuote
tags: [constant number private]
```

```Go
const delimSingleQuote
```

delimSingleQuote occurs when a single quote (') closes the attribute. 

### <a id="delimSpaceOrTagEnd" href="#delimSpaceOrTagEnd">const delimSpaceOrTagEnd</a>

```
searchKey: template.delimSpaceOrTagEnd
tags: [constant number private]
```

```Go
const delimSpaceOrTagEnd
```

delimSpaceOrTagEnd occurs when a space or right angle bracket (>) closes the attribute. 

### <a id="elementNone" href="#elementNone">const elementNone</a>

```
searchKey: template.elementNone
tags: [constant number private]
```

```Go
const elementNone element = iota
```

elementNone occurs outside a special tag or special element body. 

### <a id="elementScript" href="#elementScript">const elementScript</a>

```
searchKey: template.elementScript
tags: [constant number private]
```

```Go
const elementScript
```

elementScript corresponds to the raw text <script> element with JS MIME type or no type attribute. 

### <a id="elementStyle" href="#elementStyle">const elementStyle</a>

```
searchKey: template.elementStyle
tags: [constant number private]
```

```Go
const elementStyle
```

elementStyle corresponds to the raw text <style> element. 

### <a id="elementTextarea" href="#elementTextarea">const elementTextarea</a>

```
searchKey: template.elementTextarea
tags: [constant number private]
```

```Go
const elementTextarea
```

elementTextarea corresponds to the RCDATA <textarea> element. 

### <a id="elementTitle" href="#elementTitle">const elementTitle</a>

```
searchKey: template.elementTitle
tags: [constant number private]
```

```Go
const elementTitle
```

elementTitle corresponds to the RCDATA <title> element. 

### <a id="execErrorText" href="#execErrorText">const execErrorText</a>

```
searchKey: template.execErrorText
tags: [constant string private]
```

```Go
const execErrorText = ...
```

### <a id="filterFailsafe" href="#filterFailsafe">const filterFailsafe</a>

```
searchKey: template.filterFailsafe
tags: [constant string private]
```

```Go
const filterFailsafe = "ZgotmplZ"
```

filterFailsafe is an innocuous word that is emitted in place of unsafe values by sanitizer functions. It is not a keyword in any programming language, contains no special characters, is not empty, and when it appears in output it is distinct enough that a developer can find the source of the problem via a search engine. 

### <a id="htmlSpaceAndASCIIAlnumBytes" href="#htmlSpaceAndASCIIAlnumBytes">const htmlSpaceAndASCIIAlnumBytes</a>

```
searchKey: template.htmlSpaceAndASCIIAlnumBytes
tags: [constant string private]
```

```Go
const htmlSpaceAndASCIIAlnumBytes = ...
```

Derived from [https://play.golang.org/p/Dhmj7FORT5](https://play.golang.org/p/Dhmj7FORT5) 

### <a id="jsCtxDivOp" href="#jsCtxDivOp">const jsCtxDivOp</a>

```
searchKey: template.jsCtxDivOp
tags: [constant number private]
```

```Go
const jsCtxDivOp
```

jsCtxDivOp occurs where a '/' would start a division operator. 

### <a id="jsCtxRegexp" href="#jsCtxRegexp">const jsCtxRegexp</a>

```
searchKey: template.jsCtxRegexp
tags: [constant number private]
```

```Go
const jsCtxRegexp jsCtx = iota
```

jsCtxRegexp occurs where a '/' would start a regexp literal. 

### <a id="jsCtxUnknown" href="#jsCtxUnknown">const jsCtxUnknown</a>

```
searchKey: template.jsCtxUnknown
tags: [constant number private]
```

```Go
const jsCtxUnknown
```

jsCtxUnknown occurs where a '/' is ambiguous due to context joining. 

### <a id="multiText1" href="#multiText1">const multiText1</a>

```
searchKey: template.multiText1
tags: [constant string private]
```

```Go
const multiText1 = `
	{{define "x"}}TEXT{{end}}
	{{define "dotV"}}{{.V}}{{end}}
`
```

These strings are also in testdata/*. 

### <a id="multiText2" href="#multiText2">const multiText2</a>

```
searchKey: template.multiText2
tags: [constant string private]
```

```Go
const multiText2 = `
	{{define "dot"}}{{.}}{{end}}
	{{define "nested"}}{{template "dot" .}}{{end}}
`
```

### <a id="raceText" href="#raceText">const raceText</a>

```
searchKey: template.raceText
tags: [constant string private]
```

```Go
const raceText = ...
```

### <a id="stateAfterName" href="#stateAfterName">const stateAfterName</a>

```
searchKey: template.stateAfterName
tags: [constant number private]
```

```Go
const stateAfterName
```

stateAfterName occurs after an attr name has ended but before any equals sign. It occurs between the ^'s in ` name^ ^= value`. 

### <a id="stateAttr" href="#stateAttr">const stateAttr</a>

```
searchKey: template.stateAttr
tags: [constant number private]
```

```Go
const stateAttr
```

stateAttr occurs inside an HTML attribute whose content is text. 

### <a id="stateAttrName" href="#stateAttrName">const stateAttrName</a>

```
searchKey: template.stateAttrName
tags: [constant number private]
```

```Go
const stateAttrName
```

stateAttrName occurs inside an attribute name. It occurs between the ^'s in ` ^name^ = value`. 

### <a id="stateBeforeValue" href="#stateBeforeValue">const stateBeforeValue</a>

```
searchKey: template.stateBeforeValue
tags: [constant number private]
```

```Go
const stateBeforeValue
```

stateBeforeValue occurs after the equals sign but before the value. It occurs between the ^'s in ` name =^ ^value`. 

### <a id="stateCSS" href="#stateCSS">const stateCSS</a>

```
searchKey: template.stateCSS
tags: [constant number private]
```

```Go
const stateCSS
```

stateCSS occurs inside a <style> element or style attribute. 

### <a id="stateCSSBlockCmt" href="#stateCSSBlockCmt">const stateCSSBlockCmt</a>

```
searchKey: template.stateCSSBlockCmt
tags: [constant number private]
```

```Go
const stateCSSBlockCmt
```

stateCSSBlockCmt occurs inside a CSS /* block comment */. 

### <a id="stateCSSDqStr" href="#stateCSSDqStr">const stateCSSDqStr</a>

```
searchKey: template.stateCSSDqStr
tags: [constant number private]
```

```Go
const stateCSSDqStr
```

stateCSSDqStr occurs inside a CSS double quoted string. 

### <a id="stateCSSDqURL" href="#stateCSSDqURL">const stateCSSDqURL</a>

```
searchKey: template.stateCSSDqURL
tags: [constant number private]
```

```Go
const stateCSSDqURL
```

stateCSSDqURL occurs inside a CSS double quoted url("..."). 

### <a id="stateCSSLineCmt" href="#stateCSSLineCmt">const stateCSSLineCmt</a>

```
searchKey: template.stateCSSLineCmt
tags: [constant number private]
```

```Go
const stateCSSLineCmt
```

stateCSSLineCmt occurs inside a CSS // line comment. 

### <a id="stateCSSSqStr" href="#stateCSSSqStr">const stateCSSSqStr</a>

```
searchKey: template.stateCSSSqStr
tags: [constant number private]
```

```Go
const stateCSSSqStr
```

stateCSSSqStr occurs inside a CSS single quoted string. 

### <a id="stateCSSSqURL" href="#stateCSSSqURL">const stateCSSSqURL</a>

```
searchKey: template.stateCSSSqURL
tags: [constant number private]
```

```Go
const stateCSSSqURL
```

stateCSSSqURL occurs inside a CSS single quoted url('...'). 

### <a id="stateCSSURL" href="#stateCSSURL">const stateCSSURL</a>

```
searchKey: template.stateCSSURL
tags: [constant number private]
```

```Go
const stateCSSURL
```

stateCSSURL occurs inside a CSS unquoted url(...). 

### <a id="stateError" href="#stateError">const stateError</a>

```
searchKey: template.stateError
tags: [constant number private]
```

```Go
const stateError
```

stateError is an infectious error state outside any valid HTML/CSS/JS construct. 

### <a id="stateHTMLCmt" href="#stateHTMLCmt">const stateHTMLCmt</a>

```
searchKey: template.stateHTMLCmt
tags: [constant number private]
```

```Go
const stateHTMLCmt
```

stateHTMLCmt occurs inside an <!-- HTML comment -->. 

### <a id="stateJS" href="#stateJS">const stateJS</a>

```
searchKey: template.stateJS
tags: [constant number private]
```

```Go
const stateJS
```

stateJS occurs inside an event handler or script element. 

### <a id="stateJSBlockCmt" href="#stateJSBlockCmt">const stateJSBlockCmt</a>

```
searchKey: template.stateJSBlockCmt
tags: [constant number private]
```

```Go
const stateJSBlockCmt
```

stateJSBlockCmt occurs inside a JavaScript /* block comment */. 

### <a id="stateJSDqStr" href="#stateJSDqStr">const stateJSDqStr</a>

```
searchKey: template.stateJSDqStr
tags: [constant number private]
```

```Go
const stateJSDqStr
```

stateJSDqStr occurs inside a JavaScript double quoted string. 

### <a id="stateJSLineCmt" href="#stateJSLineCmt">const stateJSLineCmt</a>

```
searchKey: template.stateJSLineCmt
tags: [constant number private]
```

```Go
const stateJSLineCmt
```

stateJSLineCmt occurs inside a JavaScript // line comment. 

### <a id="stateJSRegexp" href="#stateJSRegexp">const stateJSRegexp</a>

```
searchKey: template.stateJSRegexp
tags: [constant number private]
```

```Go
const stateJSRegexp
```

stateJSRegexp occurs inside a JavaScript regexp literal. 

### <a id="stateJSSqStr" href="#stateJSSqStr">const stateJSSqStr</a>

```
searchKey: template.stateJSSqStr
tags: [constant number private]
```

```Go
const stateJSSqStr
```

stateJSSqStr occurs inside a JavaScript single quoted string. 

### <a id="stateRCDATA" href="#stateRCDATA">const stateRCDATA</a>

```
searchKey: template.stateRCDATA
tags: [constant number private]
```

```Go
const stateRCDATA
```

stateRCDATA occurs inside an RCDATA element (<textarea> or <title>) as described at [https://www.w3.org/TR/html5/syntax.html#elements-0](https://www.w3.org/TR/html5/syntax.html#elements-0) 

### <a id="stateSrcset" href="#stateSrcset">const stateSrcset</a>

```
searchKey: template.stateSrcset
tags: [constant number private]
```

```Go
const stateSrcset
```

stateSrcset occurs inside an HTML srcset attribute. 

### <a id="stateTag" href="#stateTag">const stateTag</a>

```
searchKey: template.stateTag
tags: [constant number private]
```

```Go
const stateTag
```

stateTag occurs before an HTML attribute or the end of a tag. 

### <a id="stateText" href="#stateText">const stateText</a>

```
searchKey: template.stateText
tags: [constant number private]
```

```Go
const stateText state = iota
```

stateText is parsed character data. An HTML parser is in this state when its parse position is outside an HTML tag, directive, comment, and special element body. 

### <a id="stateURL" href="#stateURL">const stateURL</a>

```
searchKey: template.stateURL
tags: [constant number private]
```

```Go
const stateURL
```

stateURL occurs inside an HTML attribute whose content is a URL. 

### <a id="testTemplates" href="#testTemplates">const testTemplates</a>

```
searchKey: template.testTemplates
tags: [constant string private]
```

```Go
const testTemplates = `{{define "one"}}one{{end}}{{define "two"}}two{{end}}`
```

### <a id="treeTemplate" href="#treeTemplate">const treeTemplate</a>

```
searchKey: template.treeTemplate
tags: [constant string private]
```

```Go
const treeTemplate = ...
```

Use different delimiters to test Set.Delims. Also test the trimming of leading and trailing spaces. 

### <a id="urlPartNone" href="#urlPartNone">const urlPartNone</a>

```
searchKey: template.urlPartNone
tags: [constant number private]
```

```Go
const urlPartNone urlPart = iota
```

urlPartNone occurs when not in a URL, or possibly at the start: ^ in "^[http://auth/path?k=v#frag](http://auth/path?k=v#frag)". 

### <a id="urlPartPreQuery" href="#urlPartPreQuery">const urlPartPreQuery</a>

```
searchKey: template.urlPartPreQuery
tags: [constant number private]
```

```Go
const urlPartPreQuery
```

urlPartPreQuery occurs in the scheme, authority, or path; between the ^s in "h^ttp://auth/path^?k=v#frag". 

### <a id="urlPartQueryOrFrag" href="#urlPartQueryOrFrag">const urlPartQueryOrFrag</a>

```
searchKey: template.urlPartQueryOrFrag
tags: [constant number private]
```

```Go
const urlPartQueryOrFrag
```

urlPartQueryOrFrag occurs in the query portion between the ^s in "[http://auth/path?](http://auth/path?)^k=v#frag^". 

### <a id="urlPartUnknown" href="#urlPartUnknown">const urlPartUnknown</a>

```
searchKey: template.urlPartUnknown
tags: [constant number private]
```

```Go
const urlPartUnknown
```

urlPartUnknown occurs due to joining of contexts both before and after the query separator. 

### <a id="_attr_name" href="#_attr_name">const _attr_name</a>

```
searchKey: template._attr_name
tags: [constant string private]
```

```Go
const _attr_name = "attrNoneattrScriptattrScriptTypeattrStyleattrURLattrSrcset"
```

### <a id="_delim_name" href="#_delim_name">const _delim_name</a>

```
searchKey: template._delim_name
tags: [constant string private]
```

```Go
const _delim_name = "delimNonedelimDoubleQuotedelimSingleQuotedelimSpaceOrTagEnd"
```

### <a id="_element_name" href="#_element_name">const _element_name</a>

```
searchKey: template._element_name
tags: [constant string private]
```

```Go
const _element_name = "elementNoneelementScriptelementStyleelementTextareaelementTitle"
```

### <a id="_jsCtx_name" href="#_jsCtx_name">const _jsCtx_name</a>

```
searchKey: template._jsCtx_name
tags: [constant string private]
```

```Go
const _jsCtx_name = "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
```

### <a id="_state_name" href="#_state_name">const _state_name</a>

```
searchKey: template._state_name
tags: [constant string private]
```

```Go
const _state_name = ...
```

### <a id="_urlPart_name" href="#_urlPart_name">const _urlPart_name</a>

```
searchKey: template._urlPart_name
tags: [constant string private]
```

```Go
const _urlPart_name = "urlPartNoneurlPartPreQueryurlPartQueryOrFragurlPartUnknown"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="alwaysError" href="#alwaysError">var alwaysError</a>

```
searchKey: template.alwaysError
tags: [variable interface private]
```

```Go
var alwaysError = errors.New(alwaysErrorText)
```

### <a id="attrStartStates" href="#attrStartStates">var attrStartStates</a>

```
searchKey: template.attrStartStates
tags: [variable array number private]
```

```Go
var attrStartStates = ...
```

### <a id="attrTypeMap" href="#attrTypeMap">var attrTypeMap</a>

```
searchKey: template.attrTypeMap
tags: [variable object private]
```

```Go
var attrTypeMap = ...
```

attrTypeMap[n] describes the value of the given attribute. If an attribute affects (or can mask) the encoding or interpretation of other content, or affects the contents, idempotency, or credentials of a network message, then the value in this map is contentTypeUnsafe. This map is derived from HTML5, specifically [https://www.w3.org/TR/html5/Overview.html#attributes-1](https://www.w3.org/TR/html5/Overview.html#attributes-1) as well as "%URI"-typed attributes from [https://www.w3.org/TR/html4/index/attributes.html](https://www.w3.org/TR/html4/index/attributes.html) 

### <a id="bigInt" href="#bigInt">var bigInt</a>

```
searchKey: template.bigInt
tags: [variable string private]
```

```Go
var bigInt = fmt.Sprintf("0x%x", int(1<<uint(reflect.TypeOf(0).Bits()-1)-1))
```

bigInt and bigUint are hex string representing numbers either side of the max int boundary. We do it this way so the test doesn't depend on ints being 32 bits. 

### <a id="bigUint" href="#bigUint">var bigUint</a>

```
searchKey: template.bigUint
tags: [variable string private]
```

```Go
var bigUint = fmt.Sprintf("0x%x", uint(1<<uint(reflect.TypeOf(0).Bits()-1)))
```

bigInt and bigUint are hex string representing numbers either side of the max int boundary. We do it this way so the test doesn't depend on ints being 32 bits. 

### <a id="blockCommentEnd" href="#blockCommentEnd">var blockCommentEnd</a>

```
searchKey: template.blockCommentEnd
tags: [variable array number private]
```

```Go
var blockCommentEnd = []byte("*/")
```

### <a id="cmpTests" href="#cmpTests">var cmpTests</a>

```
searchKey: template.cmpTests
tags: [variable array struct private]
```

```Go
var cmpTests = ...
```

### <a id="commentEnd" href="#commentEnd">var commentEnd</a>

```
searchKey: template.commentEnd
tags: [variable array number private]
```

```Go
var commentEnd = []byte("-->")
```

### <a id="commentStart" href="#commentStart">var commentStart</a>

```
searchKey: template.commentStart
tags: [variable array number private]
```

```Go
var commentStart = []byte("<!--")
```

### <a id="cssReplacementTable" href="#cssReplacementTable">var cssReplacementTable</a>

```
searchKey: template.cssReplacementTable
tags: [variable array string private]
```

```Go
var cssReplacementTable = ...
```

### <a id="debug" href="#debug">var debug</a>

```
searchKey: template.debug
tags: [variable boolean private]
```

```Go
var debug = flag.Bool("debug", false, "show the errors produced by the tests")
```

### <a id="delimEnds" href="#delimEnds">var delimEnds</a>

```
searchKey: template.delimEnds
tags: [variable array string private]
```

```Go
var delimEnds = ...
```

delimEnds maps each delim to a string of characters that terminate it. 

### <a id="delimPairs" href="#delimPairs">var delimPairs</a>

```
searchKey: template.delimPairs
tags: [variable array string private]
```

```Go
var delimPairs = []string{
	"", "",
	"{{", "}}",
	"|", "|",
	"(日)", "(本)",
}
```

### <a id="doctypeBytes" href="#doctypeBytes">var doctypeBytes</a>

```
searchKey: template.doctypeBytes
tags: [variable array number private]
```

```Go
var doctypeBytes = []byte("<!DOCTYPE")
```

### <a id="elementContentType" href="#elementContentType">var elementContentType</a>

```
searchKey: template.elementContentType
tags: [variable array number private]
```

```Go
var elementContentType = ...
```

### <a id="elementNameMap" href="#elementNameMap">var elementNameMap</a>

```
searchKey: template.elementNameMap
tags: [variable object private]
```

```Go
var elementNameMap = ...
```

### <a id="equivEscapers" href="#equivEscapers">var equivEscapers</a>

```
searchKey: template.equivEscapers
tags: [variable object private]
```

```Go
var equivEscapers = ...
```

equivEscapers matches contextual escapers to equivalent predefined template escapers. 

### <a id="errorType" href="#errorType">var errorType</a>

```
searchKey: template.errorType
tags: [variable interface private]
```

```Go
var errorType = reflect.TypeOf((*error)(nil)).Elem()
```

### <a id="escapeOK" href="#escapeOK">var escapeOK</a>

```
searchKey: template.escapeOK
tags: [variable interface private]
```

```Go
var escapeOK = fmt.Errorf("template escaped correctly")
```

escapeOK is a sentinel value used to indicate valid escaping. 

### <a id="execTests" href="#execTests">var execTests</a>

```
searchKey: template.execTests
tags: [variable array struct private]
```

```Go
var execTests = ...
```

### <a id="expressionBytes" href="#expressionBytes">var expressionBytes</a>

```
searchKey: template.expressionBytes
tags: [variable array number private]
```

```Go
var expressionBytes = []byte("expression")
```

### <a id="fmtStringerType" href="#fmtStringerType">var fmtStringerType</a>

```
searchKey: template.fmtStringerType
tags: [variable interface private]
```

```Go
var fmtStringerType = reflect.TypeOf((*fmt.Stringer)(nil)).Elem()
```

### <a id="funcMap" href="#funcMap">var funcMap</a>

```
searchKey: template.funcMap
tags: [variable object private]
```

```Go
var funcMap = ...
```

funcMap maps command names to functions that render their inputs safe. 

### <a id="htmlNormReplacementTable" href="#htmlNormReplacementTable">var htmlNormReplacementTable</a>

```
searchKey: template.htmlNormReplacementTable
tags: [variable array string private]
```

```Go
var htmlNormReplacementTable = ...
```

htmlNormReplacementTable is like htmlReplacementTable but without '&' to avoid over-encoding existing entities. 

### <a id="htmlNospaceNormReplacementTable" href="#htmlNospaceNormReplacementTable">var htmlNospaceNormReplacementTable</a>

```
searchKey: template.htmlNospaceNormReplacementTable
tags: [variable array string private]
```

```Go
var htmlNospaceNormReplacementTable = ...
```

htmlNospaceNormReplacementTable is like htmlNospaceReplacementTable but without '&' to avoid over-encoding existing entities. 

### <a id="htmlNospaceReplacementTable" href="#htmlNospaceReplacementTable">var htmlNospaceReplacementTable</a>

```
searchKey: template.htmlNospaceReplacementTable
tags: [variable array string private]
```

```Go
var htmlNospaceReplacementTable = ...
```

htmlNospaceReplacementTable contains the runes that need to be escaped inside an unquoted attribute value. The set of runes escaped is the union of the HTML specials and those determined by running the JS below in browsers: <div id=d></div> <script>(function () { var a = [], d = document.getElementById("d"), i, c, s; for (i = 0; i < 0x10000; ++i) { 

```
c = String.fromCharCode(i);
d.innerHTML = "<span title=" + c + "lt" + c + "></span>"
s = d.getElementsByTagName("SPAN")[0];
if (!s || s.title !== c + "lt" + c) { a.push(i.toString(16)); }

```
} document.write(a.join(", ")); })()</script> 

### <a id="htmlReplacementTable" href="#htmlReplacementTable">var htmlReplacementTable</a>

```
searchKey: template.htmlReplacementTable
tags: [variable array string private]
```

```Go
var htmlReplacementTable = ...
```

htmlReplacementTable contains the runes that need to be escaped inside a quoted attribute value or in a text node. 

### <a id="iVal" href="#iVal">var iVal</a>

```
searchKey: template.iVal
tags: [variable interface private]
```

```Go
var iVal I = tVal
```

### <a id="jsRegexpReplacementTable" href="#jsRegexpReplacementTable">var jsRegexpReplacementTable</a>

```
searchKey: template.jsRegexpReplacementTable
tags: [variable array string private]
```

```Go
var jsRegexpReplacementTable = ...
```

### <a id="jsStrNormReplacementTable" href="#jsStrNormReplacementTable">var jsStrNormReplacementTable</a>

```
searchKey: template.jsStrNormReplacementTable
tags: [variable array string private]
```

```Go
var jsStrNormReplacementTable = ...
```

jsStrNormReplacementTable is like jsStrReplacementTable but does not overencode existing escapes since this table has no entry for `\`. 

### <a id="jsStrReplacementTable" href="#jsStrReplacementTable">var jsStrReplacementTable</a>

```
searchKey: template.jsStrReplacementTable
tags: [variable array string private]
```

```Go
var jsStrReplacementTable = ...
```

### <a id="jsonMarshalType" href="#jsonMarshalType">var jsonMarshalType</a>

```
searchKey: template.jsonMarshalType
tags: [variable interface private]
```

```Go
var jsonMarshalType = reflect.TypeOf((*json.Marshaler)(nil)).Elem()
```

### <a id="lowUnicodeReplacementTable" href="#lowUnicodeReplacementTable">var lowUnicodeReplacementTable</a>

```
searchKey: template.lowUnicodeReplacementTable
tags: [variable array string private]
```

```Go
var lowUnicodeReplacementTable = ...
```

### <a id="mozBindingBytes" href="#mozBindingBytes">var mozBindingBytes</a>

```
searchKey: template.mozBindingBytes
tags: [variable array number private]
```

```Go
var mozBindingBytes = []byte("mozbinding")
```

### <a id="multiExecTests" href="#multiExecTests">var multiExecTests</a>

```
searchKey: template.multiExecTests
tags: [variable array struct private]
```

```Go
var multiExecTests = ...
```

### <a id="myError" href="#myError">var myError</a>

```
searchKey: template.myError
tags: [variable interface private]
```

```Go
var myError = errors.New("my error")
```

### <a id="predefinedEscapers" href="#predefinedEscapers">var predefinedEscapers</a>

```
searchKey: template.predefinedEscapers
tags: [variable object private]
```

```Go
var predefinedEscapers = map[string]bool{
	"html":     true,
	"urlquery": true,
}
```

predefinedEscapers contains template predefined escapers that are equivalent to some contextual escapers. Keep in sync with equivEscapers. 

### <a id="redundantFuncs" href="#redundantFuncs">var redundantFuncs</a>

```
searchKey: template.redundantFuncs
tags: [variable object private]
```

```Go
var redundantFuncs = ...
```

redundantFuncs[a][b] implies that funcMap[b](funcMap[a](x)) == funcMap[a](x) for all x. 

### <a id="regexpPrecederKeywords" href="#regexpPrecederKeywords">var regexpPrecederKeywords</a>

```
searchKey: template.regexpPrecederKeywords
tags: [variable object private]
```

```Go
var regexpPrecederKeywords = ...
```

regexpPrecederKeywords is a set of reserved JS keywords that can precede a regular expression in JS source. 

### <a id="siVal" href="#siVal">var siVal</a>

```
searchKey: template.siVal
tags: [variable interface private]
```

```Go
var siVal = I(S{"a", "b"})
```

### <a id="specialTagEndMarkers" href="#specialTagEndMarkers">var specialTagEndMarkers</a>

```
searchKey: template.specialTagEndMarkers
tags: [variable array array number private]
```

```Go
var specialTagEndMarkers = ...
```

specialTagEndMarkers maps element types to the character sequence that case-insensitively signals the end of the special tag body. 

### <a id="specialTagEndPrefix" href="#specialTagEndPrefix">var specialTagEndPrefix</a>

```
searchKey: template.specialTagEndPrefix
tags: [variable array number private]
```

```Go
var specialTagEndPrefix = []byte("</")
```

### <a id="tSliceOfNil" href="#tSliceOfNil">var tSliceOfNil</a>

```
searchKey: template.tSliceOfNil
tags: [variable array struct private]
```

```Go
var tSliceOfNil = []*T{nil}
```

### <a id="tVal" href="#tVal">var tVal</a>

```
searchKey: template.tVal
tags: [variable struct private]
```

```Go
var tVal = ...
```

### <a id="tagEndSeparators" href="#tagEndSeparators">var tagEndSeparators</a>

```
searchKey: template.tagEndSeparators
tags: [variable array number private]
```

```Go
var tagEndSeparators = []byte("> \t\n\f/")
```

### <a id="templateFileExecTests" href="#templateFileExecTests">var templateFileExecTests</a>

```
searchKey: template.templateFileExecTests
tags: [variable array struct private]
```

```Go
var templateFileExecTests = ...
```

### <a id="transitionFunc" href="#transitionFunc">var transitionFunc</a>

```
searchKey: template.transitionFunc
tags: [variable array function private]
```

```Go
var transitionFunc = ...
```

transitionFunc is the array of context transition functions for text nodes. A transition function takes a context and template text input, and returns the updated context and the number of bytes consumed from the front of the input. 

### <a id="_attr_index" href="#_attr_index">var _attr_index</a>

```
searchKey: template._attr_index
tags: [variable array number private]
```

```Go
var _attr_index = [...]uint8{0, 8, 18, 32, 41, 48, 58}
```

### <a id="_delim_index" href="#_delim_index">var _delim_index</a>

```
searchKey: template._delim_index
tags: [variable array number private]
```

```Go
var _delim_index = [...]uint8{0, 9, 25, 41, 59}
```

### <a id="_element_index" href="#_element_index">var _element_index</a>

```
searchKey: template._element_index
tags: [variable array number private]
```

```Go
var _element_index = [...]uint8{0, 11, 24, 36, 51, 63}
```

### <a id="_jsCtx_index" href="#_jsCtx_index">var _jsCtx_index</a>

```
searchKey: template._jsCtx_index
tags: [variable array number private]
```

```Go
var _jsCtx_index = [...]uint8{0, 11, 21, 33}
```

### <a id="_state_index" href="#_state_index">var _state_index</a>

```
searchKey: template._state_index
tags: [variable array number private]
```

```Go
var _state_index = ...
```

### <a id="_urlPart_index" href="#_urlPart_index">var _urlPart_index</a>

```
searchKey: template._urlPart_index
tags: [variable array number private]
```

```Go
var _urlPart_index = [...]uint8{0, 11, 26, 44, 58}
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="CSS" href="#CSS">type CSS string</a>

```
searchKey: template.CSS
tags: [string]
```

```Go
type CSS string
```

Strings of content from a trusted source. 

CSS encapsulates known safe content that matches any of: 

```
1. The CSS3 stylesheet production, such as `p { color: purple }`.
2. The CSS3 rule production, such as `a[href=~"https:"].foo#bar`.
3. CSS3 declaration productions, such as `color: red; margin: 2px`.
4. The CSS3 value production, such as `rgba(0, 0, 255, 127)`.

```
See [https://www.w3.org/TR/css3-syntax/#parsing](https://www.w3.org/TR/css3-syntax/#parsing) and [https://web.archive.org/web/20090211114933/http://w3.org/TR/css3-syntax#style](https://web.archive.org/web/20090211114933/http://w3.org/TR/css3-syntax#style) 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

### <a id="Error" href="#Error">type Error struct</a>

```
searchKey: template.Error
tags: [struct]
```

```Go
type Error struct {
	// ErrorCode describes the kind of error.
	ErrorCode ErrorCode
	// Node is the node that caused the problem, if known.
	// If not nil, it overrides Name and Line.
	Node parse.Node
	// Name is the name of the template in which the error was encountered.
	Name string
	// Line is the line number of the error in the template source or 0.
	Line int
	// Description is a human-readable description of the problem.
	Description string
}
```

Error describes a problem encountered during template Escaping. 

#### <a id="eatAttrName" href="#eatAttrName">func eatAttrName(s []byte, i int) (int, *Error)</a>

```
searchKey: template.eatAttrName
tags: [method private]
```

```Go
func eatAttrName(s []byte, i int) (int, *Error)
```

eatAttrName returns the largest j such that s[i:j] is an attribute name. It returns an error if s[i:] does not look like it begins with an attribute name, such as encountering a quote mark without a preceding equals sign. 

#### <a id="errorf" href="#errorf">func errorf(k ErrorCode, node parse.Node, line int, f string, args ...interface{}) *Error</a>

```
searchKey: template.errorf
tags: [method private]
```

```Go
func errorf(k ErrorCode, node parse.Node, line int, f string, args ...interface{}) *Error
```

errorf creates an error given a format string f and args. The template Name still needs to be supplied. 

#### <a id="Error.Error" href="#Error.Error">func (e *Error) Error() string</a>

```
searchKey: template.Error.Error
tags: [function]
```

```Go
func (e *Error) Error() string
```

### <a id="ErrorCode" href="#ErrorCode">type ErrorCode int</a>

```
searchKey: template.ErrorCode
tags: [number]
```

```Go
type ErrorCode int
```

ErrorCode is a code for a kind of error. 

### <a id="ErrorWriter" href="#ErrorWriter">type ErrorWriter int</a>

```
searchKey: template.ErrorWriter
tags: [number private]
```

```Go
type ErrorWriter int
```

#### <a id="ErrorWriter.Write" href="#ErrorWriter.Write">func (e ErrorWriter) Write(p []byte) (int, error)</a>

```
searchKey: template.ErrorWriter.Write
tags: [method private]
```

```Go
func (e ErrorWriter) Write(p []byte) (int, error)
```

### <a id="FuncMap" href="#FuncMap">type FuncMap map[string]interface{}</a>

```
searchKey: template.FuncMap
tags: [object]
```

```Go
type FuncMap map[string]interface{}
```

FuncMap is the type of the map defining the mapping from names to functions. Each function must have either a single return value, or two return values of which the second has type error. In that case, if the second (error) argument evaluates to non-nil during execution, execution terminates and Execute returns that error. FuncMap has the same base type as FuncMap in "text/template", copied here so clients need not import "text/template". 

### <a id="HTML" href="#HTML">type HTML string</a>

```
searchKey: template.HTML
tags: [string]
```

```Go
type HTML string
```

Strings of content from a trusted source. 

HTML encapsulates a known safe HTML document fragment. It should not be used for HTML from a third-party, or HTML with unclosed tags or comments. The outputs of a sound HTML sanitizer and a template escaped by this package are fine for use with HTML. 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

### <a id="HTMLAttr" href="#HTMLAttr">type HTMLAttr string</a>

```
searchKey: template.HTMLAttr
tags: [string]
```

```Go
type HTMLAttr string
```

Strings of content from a trusted source. 

HTMLAttr encapsulates an HTML attribute from a trusted source, for example, ` dir="ltr"`. 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

### <a id="I" href="#I">type I interface</a>

```
searchKey: template.I
tags: [interface private]
```

```Go
type I interface {
	Method0() string
}
```

A non-empty interface. 

### <a id="Issue7379" href="#Issue7379">type Issue7379 int</a>

```
searchKey: template.Issue7379
tags: [number private]
```

```Go
type Issue7379 int
```

#### <a id="Issue7379.SomeMethod" href="#Issue7379.SomeMethod">func (Issue7379) SomeMethod(x int) string</a>

```
searchKey: template.Issue7379.SomeMethod
tags: [method private]
```

```Go
func (Issue7379) SomeMethod(x int) string
```

### <a id="JS" href="#JS">type JS string</a>

```
searchKey: template.JS
tags: [string]
```

```Go
type JS string
```

Strings of content from a trusted source. 

JS encapsulates a known safe EcmaScript5 Expression, for example, `(x + y * z())`. Template authors are responsible for ensuring that typed expressions do not break the intended precedence and that there is no statement/expression ambiguity as when passing an expression like "{ foo: bar() }\n['foo']()", which is both a valid Expression and a valid Program with a very different meaning. 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

Using JS to include valid but untrusted JSON is not safe. A safe alternative is to parse the JSON with json.Unmarshal and then pass the resultant object into the template, where it will be converted to sanitized JSON when presented in a JavaScript context. 

### <a id="JSStr" href="#JSStr">type JSStr string</a>

```
searchKey: template.JSStr
tags: [string]
```

```Go
type JSStr string
```

Strings of content from a trusted source. 

JSStr encapsulates a sequence of characters meant to be embedded between quotes in a JavaScript expression. The string must match a series of StringCharacters: 

```
StringCharacter :: SourceCharacter but not `\` or LineTerminator
                 | EscapeSequence

```
Note that LineContinuations are not allowed. JSStr("foo\\nbar") is fine, but JSStr("foo\\\nbar") is not. 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

### <a id="S" href="#S">type S []string</a>

```
searchKey: template.S
tags: [array string private]
```

```Go
type S []string
```

#### <a id="S.Method0" href="#S.Method0">func (S) Method0() string</a>

```
searchKey: template.S.Method0
tags: [function private]
```

```Go
func (S) Method0() string
```

### <a id="Srcset" href="#Srcset">type Srcset string</a>

```
searchKey: template.Srcset
tags: [string]
```

```Go
type Srcset string
```

Strings of content from a trusted source. 

Srcset encapsulates a known safe srcset attribute (see [https://w3c.github.io/html/semantics-embedded-content.html#element-attrdef-img-srcset](https://w3c.github.io/html/semantics-embedded-content.html#element-attrdef-img-srcset)). 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

### <a id="T" href="#T">type T struct</a>

```
searchKey: template.T
tags: [struct private]
```

```Go
type T struct {
	// Basics
	True        bool
	I           int
	U16         uint16
	X, S        string
	FloatZero   float64
	ComplexZero complex128
	// Nested structs.
	U *U
	// Struct with String method.
	V0     V
	V1, V2 *V
	// Struct with Error method.
	W0     W
	W1, W2 *W
	// Slices
	SI      []int
	SICap   []int
	SIEmpty []int
	SB      []bool
	// Arrays
	AI [3]int
	// Maps
	MSI      map[string]int
	MSIone   map[string]int // one element, for deterministic output
	MSIEmpty map[string]int
	MXI      map[interface{}]int
	MII      map[int]int
	MI32S    map[int32]string
	MI64S    map[int64]string
	MUI32S   map[uint32]string
	MUI64S   map[uint64]string
	MI8S     map[int8]string
	MUI8S    map[uint8]string
	SMSI     []map[string]int
	// Empty interfaces; used to see if we can dig inside one.
	Empty0 interface{} // nil
	Empty1 interface{}
	Empty2 interface{}
	Empty3 interface{}
	Empty4 interface{}
	// Non-empty interfaces.
	NonEmptyInterface         I
	NonEmptyInterfacePtS      *I
	NonEmptyInterfaceNil      I
	NonEmptyInterfaceTypedNil I
	// Stringer.
	Str fmt.Stringer
	Err error
	// Pointers
	PI  *int
	PS  *string
	PSI *[]int
	NIL *int
	// Function (not method)
	BinaryFunc      func(string, string) string
	VariadicFunc    func(...string) string
	VariadicFuncInt func(int, ...string) string
	NilOKFunc       func(*int) bool
	ErrFunc         func() (string, error)
	PanicFunc       func() string
	// Template to test evaluation of templates.
	Tmpl *Template
	// Unexported field; cannot be accessed by template.
	unexported int
}
```

T has lots of interesting pieces to use to test execution. 

#### <a id="T.Copy" href="#T.Copy">func (t *T) Copy() *T</a>

```
searchKey: template.T.Copy
tags: [function private]
```

```Go
func (t *T) Copy() *T
```

#### <a id="T.GetU" href="#T.GetU">func (t *T) GetU() *U</a>

```
searchKey: template.T.GetU
tags: [function private]
```

```Go
func (t *T) GetU() *U
```

A few methods to test chaining. 

#### <a id="T.MAdd" href="#T.MAdd">func (t *T) MAdd(a int, b []int) []int</a>

```
searchKey: template.T.MAdd
tags: [method private]
```

```Go
func (t *T) MAdd(a int, b []int) []int
```

#### <a id="T.Method0" href="#T.Method0">func (t *T) Method0() string</a>

```
searchKey: template.T.Method0
tags: [function private]
```

```Go
func (t *T) Method0() string
```

Simple methods with and without arguments. 

#### <a id="T.Method1" href="#T.Method1">func (t *T) Method1(a int) int</a>

```
searchKey: template.T.Method1
tags: [method private]
```

```Go
func (t *T) Method1(a int) int
```

#### <a id="T.Method2" href="#T.Method2">func (t *T) Method2(a uint16, b string) string</a>

```
searchKey: template.T.Method2
tags: [method private]
```

```Go
func (t *T) Method2(a uint16, b string) string
```

#### <a id="T.Method3" href="#T.Method3">func (t *T) Method3(v interface{}) string</a>

```
searchKey: template.T.Method3
tags: [method private]
```

```Go
func (t *T) Method3(v interface{}) string
```

#### <a id="T.MyError" href="#T.MyError">func (t *T) MyError(error bool) (bool, error)</a>

```
searchKey: template.T.MyError
tags: [method private]
```

```Go
func (t *T) MyError(error bool) (bool, error)
```

MyError returns a value and an error according to its argument. 

### <a id="Template" href="#Template">type Template struct</a>

```
searchKey: template.Template
tags: [struct]
```

```Go
type Template struct {
	// Sticky error if escaping fails, or escapeOK if succeeded.
	escapeErr error
	// We could embed the text/template field, but it's safer not to because
	// we need to keep our version of the name space and the underlying
	// template's in sync.
	text *template.Template
	// The underlying template's parse tree, updated to be HTML-safe.
	Tree       *parse.Tree
	*nameSpace // common to all associated templates
}
```

Template is a specialized Template from "text/template" that produces a safe HTML document fragment. 

#### <a id="Must" href="#Must">func Must(t *Template, err error) *Template</a>

```
searchKey: template.Must
tags: [method]
```

```Go
func Must(t *Template, err error) *Template
```

Must is a helper that wraps a call to a function returning (*Template, error) and panics if the error is non-nil. It is intended for use in variable initializations such as 

```
var t = template.Must(template.New("name").Parse("html"))

```
#### <a id="New" href="#New">func New(name string) *Template</a>

```
searchKey: template.New
tags: [method]
```

```Go
func New(name string) *Template
```

New allocates a new HTML template with the given name. 

#### <a id="ParseFS" href="#ParseFS">func ParseFS(fs fs.FS, patterns ...string) (*Template, error)</a>

```
searchKey: template.ParseFS
tags: [method]
```

```Go
func ParseFS(fs fs.FS, patterns ...string) (*Template, error)
```

ParseFS is like ParseFiles or ParseGlob but reads from the file system fs instead of the host operating system's file system. It accepts a list of glob patterns. (Note that most file names serve as glob patterns matching only themselves.) 

#### <a id="ParseFiles" href="#ParseFiles">func ParseFiles(filenames ...string) (*Template, error)</a>

```
searchKey: template.ParseFiles
tags: [method]
```

```Go
func ParseFiles(filenames ...string) (*Template, error)
```

ParseFiles creates a new Template and parses the template definitions from the named files. The returned template's name will have the (base) name and (parsed) contents of the first file. There must be at least one file. If an error occurs, parsing stops and the returned *Template is nil. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. For instance, ParseFiles("a/foo", "b/foo") stores "b/foo" as the template named "foo", while "a/foo" is unavailable. 

#### <a id="ParseGlob" href="#ParseGlob">func ParseGlob(pattern string) (*Template, error)</a>

```
searchKey: template.ParseGlob
tags: [method]
```

```Go
func ParseGlob(pattern string) (*Template, error)
```

ParseGlob creates a new Template and parses the template definitions from the files identified by the pattern. The files are matched according to the semantics of filepath.Match, and the pattern must match at least one file. The returned template will have the (base) name and (parsed) contents of the first file matched by the pattern. ParseGlob is equivalent to calling ParseFiles with the list of files matched by the pattern. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. 

#### <a id="parseFS" href="#parseFS">func parseFS(t *Template, fsys fs.FS, patterns []string) (*Template, error)</a>

```
searchKey: template.parseFS
tags: [method private]
```

```Go
func parseFS(t *Template, fsys fs.FS, patterns []string) (*Template, error)
```

#### <a id="parseFiles" href="#parseFiles">func parseFiles(t *Template, readFile func(string) (string, []byte, error), filenames ...string) (*Template, error)</a>

```
searchKey: template.parseFiles
tags: [method private]
```

```Go
func parseFiles(t *Template, readFile func(string) (string, []byte, error), filenames ...string) (*Template, error)
```

parseFiles is the helper for the method and function. If the argument template is nil, it is created from the first file. 

#### <a id="parseGlob" href="#parseGlob">func parseGlob(t *Template, pattern string) (*Template, error)</a>

```
searchKey: template.parseGlob
tags: [method private]
```

```Go
func parseGlob(t *Template, pattern string) (*Template, error)
```

parseGlob is the implementation of the function and method ParseGlob. 

#### <a id="Template.AddParseTree" href="#Template.AddParseTree">func (t *Template) AddParseTree(name string, tree *parse.Tree) (*Template, error)</a>

```
searchKey: template.Template.AddParseTree
tags: [method]
```

```Go
func (t *Template) AddParseTree(name string, tree *parse.Tree) (*Template, error)
```

AddParseTree creates a new template with the name and parse tree and associates it with t. 

It returns an error if t or any associated template has already been executed. 

#### <a id="Template.Clone" href="#Template.Clone">func (t *Template) Clone() (*Template, error)</a>

```
searchKey: template.Template.Clone
tags: [function]
```

```Go
func (t *Template) Clone() (*Template, error)
```

Clone returns a duplicate of the template, including all associated templates. The actual representation is not copied, but the name space of associated templates is, so further calls to Parse in the copy will add templates to the copy but not to the original. Clone can be used to prepare common templates and use them with variant definitions for other templates by adding the variants after the clone is made. 

It returns an error if t has already been executed. 

#### <a id="Template.DefinedTemplates" href="#Template.DefinedTemplates">func (t *Template) DefinedTemplates() string</a>

```
searchKey: template.Template.DefinedTemplates
tags: [function]
```

```Go
func (t *Template) DefinedTemplates() string
```

DefinedTemplates returns a string listing the defined templates, prefixed by the string "; defined templates are: ". If there are none, it returns the empty string. Used to generate an error message. 

#### <a id="Template.Delims" href="#Template.Delims">func (t *Template) Delims(left, right string) *Template</a>

```
searchKey: template.Template.Delims
tags: [method]
```

```Go
func (t *Template) Delims(left, right string) *Template
```

Delims sets the action delimiters to the specified strings, to be used in subsequent calls to Parse, ParseFiles, or ParseGlob. Nested template definitions will inherit the settings. An empty delimiter stands for the corresponding default: {{ or }}. The return value is the template, so calls can be chained. 

#### <a id="Template.Execute" href="#Template.Execute">func (t *Template) Execute(wr io.Writer, data interface{}) error</a>

```
searchKey: template.Template.Execute
tags: [method]
```

```Go
func (t *Template) Execute(wr io.Writer, data interface{}) error
```

Execute applies a parsed template to the specified data object, writing the output to wr. If an error occurs executing the template or writing its output, execution stops, but partial results may already have been written to the output writer. A template may be executed safely in parallel, although if parallel executions share a Writer the output may be interleaved. 

#### <a id="Template.ExecuteTemplate" href="#Template.ExecuteTemplate">func (t *Template) ExecuteTemplate(wr io.Writer, name string, data interface{}) error</a>

```
searchKey: template.Template.ExecuteTemplate
tags: [method]
```

```Go
func (t *Template) ExecuteTemplate(wr io.Writer, name string, data interface{}) error
```

ExecuteTemplate applies the template associated with t that has the given name to the specified data object and writes the output to wr. If an error occurs executing the template or writing its output, execution stops, but partial results may already have been written to the output writer. A template may be executed safely in parallel, although if parallel executions share a Writer the output may be interleaved. 

#### <a id="Template.Funcs" href="#Template.Funcs">func (t *Template) Funcs(funcMap FuncMap) *Template</a>

```
searchKey: template.Template.Funcs
tags: [method]
```

```Go
func (t *Template) Funcs(funcMap FuncMap) *Template
```

Funcs adds the elements of the argument map to the template's function map. It must be called before the template is parsed. It panics if a value in the map is not a function with appropriate return type. However, it is legal to overwrite elements of the map. The return value is the template, so calls can be chained. 

#### <a id="Template.Lookup" href="#Template.Lookup">func (t *Template) Lookup(name string) *Template</a>

```
searchKey: template.Template.Lookup
tags: [method]
```

```Go
func (t *Template) Lookup(name string) *Template
```

Lookup returns the template with the given name that is associated with t, or nil if there is no such template. 

#### <a id="Template.Name" href="#Template.Name">func (t *Template) Name() string</a>

```
searchKey: template.Template.Name
tags: [function]
```

```Go
func (t *Template) Name() string
```

Name returns the name of the template. 

#### <a id="Template.New" href="#Template.New">func (t *Template) New(name string) *Template</a>

```
searchKey: template.Template.New
tags: [method]
```

```Go
func (t *Template) New(name string) *Template
```

New allocates a new HTML template associated with the given one and with the same delimiters. The association, which is transitive, allows one template to invoke another with a {{template}} action. 

If a template with the given name already exists, the new HTML template will replace it. The existing template will be reset and disassociated with t. 

#### <a id="Template.Option" href="#Template.Option">func (t *Template) Option(opt ...string) *Template</a>

```
searchKey: template.Template.Option
tags: [method]
```

```Go
func (t *Template) Option(opt ...string) *Template
```

Option sets options for the template. Options are described by strings, either a simple string or "key=value". There can be at most one equals sign in an option string. If the option string is unrecognized or otherwise invalid, Option panics. 

Known options: 

missingkey: Control the behavior during execution if a map is indexed with a key that is not present in the map. 

```
"missingkey=default" or "missingkey=invalid"
	The default behavior: Do nothing and continue execution.
	If printed, the result of the index operation is the string
	"<no value>".
"missingkey=zero"
	The operation returns the zero value for the map type's element.
"missingkey=error"
	Execution stops immediately with an error.

```
#### <a id="Template.Parse" href="#Template.Parse">func (t *Template) Parse(text string) (*Template, error)</a>

```
searchKey: template.Template.Parse
tags: [method]
```

```Go
func (t *Template) Parse(text string) (*Template, error)
```

Parse parses text as a template body for t. Named template definitions ({{define ...}} or {{block ...}} statements) in text define additional templates associated with t and are removed from the definition of t itself. 

Templates can be redefined in successive calls to Parse, before the first use of Execute on t or any associated template. A template definition with a body containing only white space and comments is considered empty and will not replace an existing template's body. This allows using Parse to add new named template definitions without overwriting the main template body. 

#### <a id="Template.ParseFS" href="#Template.ParseFS">func (t *Template) ParseFS(fs fs.FS, patterns ...string) (*Template, error)</a>

```
searchKey: template.Template.ParseFS
tags: [method]
```

```Go
func (t *Template) ParseFS(fs fs.FS, patterns ...string) (*Template, error)
```

ParseFS is like ParseFiles or ParseGlob but reads from the file system fs instead of the host operating system's file system. It accepts a list of glob patterns. (Note that most file names serve as glob patterns matching only themselves.) 

#### <a id="Template.ParseFiles" href="#Template.ParseFiles">func (t *Template) ParseFiles(filenames ...string) (*Template, error)</a>

```
searchKey: template.Template.ParseFiles
tags: [method]
```

```Go
func (t *Template) ParseFiles(filenames ...string) (*Template, error)
```

ParseFiles parses the named files and associates the resulting templates with t. If an error occurs, parsing stops and the returned template is nil; otherwise it is t. There must be at least one file. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. 

ParseFiles returns an error if t or any associated template has already been executed. 

#### <a id="Template.ParseGlob" href="#Template.ParseGlob">func (t *Template) ParseGlob(pattern string) (*Template, error)</a>

```
searchKey: template.Template.ParseGlob
tags: [method]
```

```Go
func (t *Template) ParseGlob(pattern string) (*Template, error)
```

ParseGlob parses the template definitions in the files identified by the pattern and associates the resulting templates with t. The files are matched according to the semantics of filepath.Match, and the pattern must match at least one file. ParseGlob is equivalent to calling t.ParseFiles with the list of files matched by the pattern. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. 

ParseGlob returns an error if t or any associated template has already been executed. 

#### <a id="Template.Templates" href="#Template.Templates">func (t *Template) Templates() []*Template</a>

```
searchKey: template.Template.Templates
tags: [function]
```

```Go
func (t *Template) Templates() []*Template
```

Templates returns a slice of the templates associated with t, including t itself. 

#### <a id="Template.checkCanParse" href="#Template.checkCanParse">func (t *Template) checkCanParse() error</a>

```
searchKey: template.Template.checkCanParse
tags: [function private]
```

```Go
func (t *Template) checkCanParse() error
```

checkCanParse checks whether it is OK to parse templates. If not, it returns an error. 

#### <a id="Template.escape" href="#Template.escape">func (t *Template) escape() error</a>

```
searchKey: template.Template.escape
tags: [function private]
```

```Go
func (t *Template) escape() error
```

escape escapes all associated templates. 

#### <a id="Template.lookupAndEscapeTemplate" href="#Template.lookupAndEscapeTemplate">func (t *Template) lookupAndEscapeTemplate(name string) (tmpl *Template, err error)</a>

```
searchKey: template.Template.lookupAndEscapeTemplate
tags: [method private]
```

```Go
func (t *Template) lookupAndEscapeTemplate(name string) (tmpl *Template, err error)
```

lookupAndEscapeTemplate guarantees that the template with the given name is escaped, or returns an error if it cannot be. It returns the named template. 

#### <a id="Template.new" href="#Template.new">func (t *Template) new(name string) *Template</a>

```
searchKey: template.Template.new
tags: [method private]
```

```Go
func (t *Template) new(name string) *Template
```

new is the implementation of New, without the lock. 

### <a id="Tree" href="#Tree">type Tree struct</a>

```
searchKey: template.Tree
tags: [struct private]
```

```Go
type Tree struct {
	Val         int
	Left, Right *Tree
}
```

### <a id="U" href="#U">type U struct</a>

```
searchKey: template.U
tags: [struct private]
```

```Go
type U struct {
	V string
}
```

#### <a id="U.TrueFalse" href="#U.TrueFalse">func (u *U) TrueFalse(b bool) string</a>

```
searchKey: template.U.TrueFalse
tags: [method private]
```

```Go
func (u *U) TrueFalse(b bool) string
```

### <a id="URL" href="#URL">type URL string</a>

```
searchKey: template.URL
tags: [string]
```

```Go
type URL string
```

Strings of content from a trusted source. 

URL encapsulates a known safe URL or URL substring (see RFC 3986). A URL like `javascript:checkThatFormNotEditedBeforeLeavingPage()` from a trusted source should go in the page, but by default dynamic `javascript:` URLs are filtered out since they are a frequently exploited injection vector. 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

### <a id="V" href="#V">type V struct</a>

```
searchKey: template.V
tags: [struct private]
```

```Go
type V struct {
	j int
}
```

#### <a id="V.String" href="#V.String">func (v *V) String() string</a>

```
searchKey: template.V.String
tags: [function private]
```

```Go
func (v *V) String() string
```

### <a id="W" href="#W">type W struct</a>

```
searchKey: template.W
tags: [struct private]
```

```Go
type W struct {
	k int
}
```

#### <a id="W.Error" href="#W.Error">func (w *W) Error() string</a>

```
searchKey: template.W.Error
tags: [function private]
```

```Go
func (w *W) Error() string
```

### <a id="attr" href="#attr">type attr uint8</a>

```
searchKey: template.attr
tags: [number private]
```

```Go
type attr uint8
```

attr identifies the current HTML attribute when inside the attribute, that is, starting from stateAttrName until stateTag/stateText (exclusive). 

#### <a id="attr.String" href="#attr.String">func (i attr) String() string</a>

```
searchKey: template.attr.String
tags: [function private]
```

```Go
func (i attr) String() string
```

### <a id="badMarshaler" href="#badMarshaler">type badMarshaler struct{}</a>

```
searchKey: template.badMarshaler
tags: [struct private]
```

```Go
type badMarshaler struct{}
```

#### <a id="badMarshaler.MarshalJSON" href="#badMarshaler.MarshalJSON">func (x *badMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: template.badMarshaler.MarshalJSON
tags: [function private]
```

```Go
func (x *badMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="cmpTest" href="#cmpTest">type cmpTest struct</a>

```
searchKey: template.cmpTest
tags: [struct private]
```

```Go
type cmpTest struct {
	expr  string
	truth string
	ok    bool
}
```

### <a id="contentType" href="#contentType">type contentType uint8</a>

```
searchKey: template.contentType
tags: [number private]
```

```Go
type contentType uint8
```

#### <a id="attrType" href="#attrType">func attrType(name string) contentType</a>

```
searchKey: template.attrType
tags: [method private]
```

```Go
func attrType(name string) contentType
```

attrType returns a conservative (upper-bound on authority) guess at the type of the lowercase named attribute. 

#### <a id="stringify" href="#stringify">func stringify(args ...interface{}) (string, contentType)</a>

```
searchKey: template.stringify
tags: [method private]
```

```Go
func stringify(args ...interface{}) (string, contentType)
```

stringify converts its arguments to a string and the type of the content. All pointers are dereferenced, as in the text/template package. 

### <a id="context" href="#context">type context struct</a>

```
searchKey: template.context
tags: [struct private]
```

```Go
type context struct {
	state   state
	delim   delim
	urlPart urlPart
	jsCtx   jsCtx
	attr    attr
	element element
	err     *Error
}
```

context describes the state an HTML parser must be in when it reaches the portion of HTML produced by evaluating a particular template node. 

The zero value of type context is the start context for a template that produces an HTML fragment as defined at [https://www.w3.org/TR/html5/syntax.html#the-end](https://www.w3.org/TR/html5/syntax.html#the-end) where the context element is null. 

#### <a id="contextAfterText" href="#contextAfterText">func contextAfterText(c context, s []byte) (context, int)</a>

```
searchKey: template.contextAfterText
tags: [method private]
```

```Go
func contextAfterText(c context, s []byte) (context, int)
```

contextAfterText starts in context c, consumes some tokens from the front of s, then returns the context after those tokens and the unprocessed suffix. 

#### <a id="join" href="#join">func join(a, b context, node parse.Node, nodeName string) context</a>

```
searchKey: template.join
tags: [method private]
```

```Go
func join(a, b context, node parse.Node, nodeName string) context
```

join joins the two contexts of a branch template node. The result is an error context if either of the input contexts are error contexts, or if the input contexts differ. 

#### <a id="nudge" href="#nudge">func nudge(c context) context</a>

```
searchKey: template.nudge
tags: [method private]
```

```Go
func nudge(c context) context
```

nudge returns the context that would result from following empty string transitions from the input context. For example, parsing: 

```
`<a href=`

```
will end in context{stateBeforeValue, attrURL}, but parsing one extra rune: 

```
`<a href=x`

```
will end in context{stateURL, delimSpaceOrTagEnd, ...}. There are two transitions that happen when the 'x' is seen: (1) Transition from a before-value state to a start-of-value state without 

```
consuming any character.

```
(2) Consume 'x' and transition past the first value character. In this case, nudging produces the context after (1) happens. 

#### <a id="tAfterName" href="#tAfterName">func tAfterName(c context, s []byte) (context, int)</a>

```
searchKey: template.tAfterName
tags: [method private]
```

```Go
func tAfterName(c context, s []byte) (context, int)
```

tAfterName is the context transition function for stateAfterName. 

#### <a id="tAttr" href="#tAttr">func tAttr(c context, s []byte) (context, int)</a>

```
searchKey: template.tAttr
tags: [method private]
```

```Go
func tAttr(c context, s []byte) (context, int)
```

tAttr is the context transition function for the attribute state. 

#### <a id="tAttrName" href="#tAttrName">func tAttrName(c context, s []byte) (context, int)</a>

```
searchKey: template.tAttrName
tags: [method private]
```

```Go
func tAttrName(c context, s []byte) (context, int)
```

tAttrName is the context transition function for stateAttrName. 

#### <a id="tBeforeValue" href="#tBeforeValue">func tBeforeValue(c context, s []byte) (context, int)</a>

```
searchKey: template.tBeforeValue
tags: [method private]
```

```Go
func tBeforeValue(c context, s []byte) (context, int)
```

tBeforeValue is the context transition function for stateBeforeValue. 

#### <a id="tBlockCmt" href="#tBlockCmt">func tBlockCmt(c context, s []byte) (context, int)</a>

```
searchKey: template.tBlockCmt
tags: [method private]
```

```Go
func tBlockCmt(c context, s []byte) (context, int)
```

tBlockCmt is the context transition function for /*comment*/ states. 

#### <a id="tCSS" href="#tCSS">func tCSS(c context, s []byte) (context, int)</a>

```
searchKey: template.tCSS
tags: [method private]
```

```Go
func tCSS(c context, s []byte) (context, int)
```

tCSS is the context transition function for the CSS state. 

#### <a id="tCSSStr" href="#tCSSStr">func tCSSStr(c context, s []byte) (context, int)</a>

```
searchKey: template.tCSSStr
tags: [method private]
```

```Go
func tCSSStr(c context, s []byte) (context, int)
```

tCSSStr is the context transition function for the CSS string and URL states. 

#### <a id="tError" href="#tError">func tError(c context, s []byte) (context, int)</a>

```
searchKey: template.tError
tags: [method private]
```

```Go
func tError(c context, s []byte) (context, int)
```

tError is the context transition function for the error state. 

#### <a id="tHTMLCmt" href="#tHTMLCmt">func tHTMLCmt(c context, s []byte) (context, int)</a>

```
searchKey: template.tHTMLCmt
tags: [method private]
```

```Go
func tHTMLCmt(c context, s []byte) (context, int)
```

tHTMLCmt is the context transition function for stateHTMLCmt. 

#### <a id="tJS" href="#tJS">func tJS(c context, s []byte) (context, int)</a>

```
searchKey: template.tJS
tags: [method private]
```

```Go
func tJS(c context, s []byte) (context, int)
```

tJS is the context transition function for the JS state. 

#### <a id="tJSDelimited" href="#tJSDelimited">func tJSDelimited(c context, s []byte) (context, int)</a>

```
searchKey: template.tJSDelimited
tags: [method private]
```

```Go
func tJSDelimited(c context, s []byte) (context, int)
```

tJSDelimited is the context transition function for the JS string and regexp states. 

#### <a id="tLineCmt" href="#tLineCmt">func tLineCmt(c context, s []byte) (context, int)</a>

```
searchKey: template.tLineCmt
tags: [method private]
```

```Go
func tLineCmt(c context, s []byte) (context, int)
```

tLineCmt is the context transition function for //comment states. 

#### <a id="tSpecialTagEnd" href="#tSpecialTagEnd">func tSpecialTagEnd(c context, s []byte) (context, int)</a>

```
searchKey: template.tSpecialTagEnd
tags: [method private]
```

```Go
func tSpecialTagEnd(c context, s []byte) (context, int)
```

tSpecialTagEnd is the context transition function for raw text and RCDATA element states. 

#### <a id="tTag" href="#tTag">func tTag(c context, s []byte) (context, int)</a>

```
searchKey: template.tTag
tags: [method private]
```

```Go
func tTag(c context, s []byte) (context, int)
```

tTag is the context transition function for the tag state. 

#### <a id="tText" href="#tText">func tText(c context, s []byte) (context, int)</a>

```
searchKey: template.tText
tags: [method private]
```

```Go
func tText(c context, s []byte) (context, int)
```

tText is the context transition function for the text state. 

#### <a id="tURL" href="#tURL">func tURL(c context, s []byte) (context, int)</a>

```
searchKey: template.tURL
tags: [method private]
```

```Go
func tURL(c context, s []byte) (context, int)
```

tURL is the context transition function for the URL state. 

#### <a id="context.String" href="#context.String">func (c context) String() string</a>

```
searchKey: template.context.String
tags: [function private]
```

```Go
func (c context) String() string
```

#### <a id="context.eq" href="#context.eq">func (c context) eq(d context) bool</a>

```
searchKey: template.context.eq
tags: [method private]
```

```Go
func (c context) eq(d context) bool
```

eq reports whether two contexts are equal. 

#### <a id="context.mangle" href="#context.mangle">func (c context) mangle(templateName string) string</a>

```
searchKey: template.context.mangle
tags: [method private]
```

```Go
func (c context) mangle(templateName string) string
```

mangle produces an identifier that includes a suffix that distinguishes it from template names mangled with different contexts. 

### <a id="delim" href="#delim">type delim uint8</a>

```
searchKey: template.delim
tags: [number private]
```

```Go
type delim uint8
```

delim is the delimiter that will end the current HTML attribute. 

#### <a id="delim.String" href="#delim.String">func (i delim) String() string</a>

```
searchKey: template.delim.String
tags: [function private]
```

```Go
func (i delim) String() string
```

### <a id="element" href="#element">type element uint8</a>

```
searchKey: template.element
tags: [number private]
```

```Go
type element uint8
```

element identifies the HTML element when inside a start tag or special body. Certain HTML element (for example <script> and <style>) have bodies that are treated differently from stateText so the element type is necessary to transition into the correct context at the end of a tag and to identify the end delimiter for the body. 

#### <a id="eatTagName" href="#eatTagName">func eatTagName(s []byte, i int) (int, element)</a>

```
searchKey: template.eatTagName
tags: [method private]
```

```Go
func eatTagName(s []byte, i int) (int, element)
```

eatTagName returns the largest j such that s[i:j] is a tag name and the tag type. 

#### <a id="element.String" href="#element.String">func (i element) String() string</a>

```
searchKey: template.element.String
tags: [function private]
```

```Go
func (i element) String() string
```

### <a id="errorer" href="#errorer">type errorer struct</a>

```
searchKey: template.errorer
tags: [struct private]
```

```Go
type errorer struct {
	v int
}
```

#### <a id="errorer.Error" href="#errorer.Error">func (s *errorer) Error() string</a>

```
searchKey: template.errorer.Error
tags: [function private]
```

```Go
func (s *errorer) Error() string
```

### <a id="escaper" href="#escaper">type escaper struct</a>

```
searchKey: template.escaper
tags: [struct private]
```

```Go
type escaper struct {
	// ns is the nameSpace that this escaper is associated with.
	ns *nameSpace
	// output[templateName] is the output context for a templateName that
	// has been mangled to include its input context.
	output map[string]context
	// derived[c.mangle(name)] maps to a template derived from the template
	// named name templateName for the start context c.
	derived map[string]*template.Template
	// called[templateName] is a set of called mangled template names.
	called map[string]bool
	// xxxNodeEdits are the accumulated edits to apply during commit.
	// Such edits are not applied immediately in case a template set
	// executes a given template in different escaping contexts.
	actionNodeEdits   map[*parse.ActionNode][]string
	templateNodeEdits map[*parse.TemplateNode]string
	textNodeEdits     map[*parse.TextNode][]byte
}
```

escaper collects type inferences about templates and changes needed to make templates injection safe. 

#### <a id="makeEscaper" href="#makeEscaper">func makeEscaper(n *nameSpace) escaper</a>

```
searchKey: template.makeEscaper
tags: [method private]
```

```Go
func makeEscaper(n *nameSpace) escaper
```

makeEscaper creates a blank escaper for the given set. 

#### <a id="escaper.arbitraryTemplate" href="#escaper.arbitraryTemplate">func (e *escaper) arbitraryTemplate() *Template</a>

```
searchKey: template.escaper.arbitraryTemplate
tags: [function private]
```

```Go
func (e *escaper) arbitraryTemplate() *Template
```

arbitraryTemplate returns an arbitrary template from the name space associated with e and panics if no templates are found. 

#### <a id="escaper.commit" href="#escaper.commit">func (e *escaper) commit()</a>

```
searchKey: template.escaper.commit
tags: [function private]
```

```Go
func (e *escaper) commit()
```

commit applies changes to actions and template calls needed to contextually autoescape content and adds any derived templates to the set. 

#### <a id="escaper.computeOutCtx" href="#escaper.computeOutCtx">func (e *escaper) computeOutCtx(c context, t *template.Template) context</a>

```
searchKey: template.escaper.computeOutCtx
tags: [method private]
```

```Go
func (e *escaper) computeOutCtx(c context, t *template.Template) context
```

computeOutCtx takes a template and its start context and computes the output context while storing any inferences in e. 

#### <a id="escaper.editActionNode" href="#escaper.editActionNode">func (e *escaper) editActionNode(n *parse.ActionNode, cmds []string)</a>

```
searchKey: template.escaper.editActionNode
tags: [method private]
```

```Go
func (e *escaper) editActionNode(n *parse.ActionNode, cmds []string)
```

editActionNode records a change to an action pipeline for later commit. 

#### <a id="escaper.editTemplateNode" href="#escaper.editTemplateNode">func (e *escaper) editTemplateNode(n *parse.TemplateNode, callee string)</a>

```
searchKey: template.escaper.editTemplateNode
tags: [method private]
```

```Go
func (e *escaper) editTemplateNode(n *parse.TemplateNode, callee string)
```

editTemplateNode records a change to a {{template}} callee for later commit. 

#### <a id="escaper.editTextNode" href="#escaper.editTextNode">func (e *escaper) editTextNode(n *parse.TextNode, text []byte)</a>

```
searchKey: template.escaper.editTextNode
tags: [method private]
```

```Go
func (e *escaper) editTextNode(n *parse.TextNode, text []byte)
```

editTextNode records a change to a text node for later commit. 

#### <a id="escaper.escape" href="#escaper.escape">func (e *escaper) escape(c context, n parse.Node) context</a>

```
searchKey: template.escaper.escape
tags: [method private]
```

```Go
func (e *escaper) escape(c context, n parse.Node) context
```

escape escapes a template node. 

#### <a id="escaper.escapeAction" href="#escaper.escapeAction">func (e *escaper) escapeAction(c context, n *parse.ActionNode) context</a>

```
searchKey: template.escaper.escapeAction
tags: [method private]
```

```Go
func (e *escaper) escapeAction(c context, n *parse.ActionNode) context
```

escapeAction escapes an action template node. 

#### <a id="escaper.escapeBranch" href="#escaper.escapeBranch">func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string) context</a>

```
searchKey: template.escaper.escapeBranch
tags: [method private]
```

```Go
func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string) context
```

escapeBranch escapes a branch template node: "if", "range" and "with". 

#### <a id="escaper.escapeList" href="#escaper.escapeList">func (e *escaper) escapeList(c context, n *parse.ListNode) context</a>

```
searchKey: template.escaper.escapeList
tags: [method private]
```

```Go
func (e *escaper) escapeList(c context, n *parse.ListNode) context
```

escapeList escapes a list template node. 

#### <a id="escaper.escapeListConditionally" href="#escaper.escapeListConditionally">func (e *escaper) escapeListConditionally(c context, n *parse.ListNode, filter func(*escaper, context) bool) (context, bool)</a>

```
searchKey: template.escaper.escapeListConditionally
tags: [method private]
```

```Go
func (e *escaper) escapeListConditionally(c context, n *parse.ListNode, filter func(*escaper, context) bool) (context, bool)
```

escapeListConditionally escapes a list node but only preserves edits and inferences in e if the inferences and output context satisfy filter. It returns the best guess at an output context, and the result of the filter which is the same as whether e was updated. 

#### <a id="escaper.escapeTemplate" href="#escaper.escapeTemplate">func (e *escaper) escapeTemplate(c context, n *parse.TemplateNode) context</a>

```
searchKey: template.escaper.escapeTemplate
tags: [method private]
```

```Go
func (e *escaper) escapeTemplate(c context, n *parse.TemplateNode) context
```

escapeTemplate escapes a {{template}} call node. 

#### <a id="escaper.escapeTemplateBody" href="#escaper.escapeTemplateBody">func (e *escaper) escapeTemplateBody(c context, t *template.Template) (context, bool)</a>

```
searchKey: template.escaper.escapeTemplateBody
tags: [method private]
```

```Go
func (e *escaper) escapeTemplateBody(c context, t *template.Template) (context, bool)
```

escapeTemplateBody escapes the given template assuming the given output context, and returns the best guess at the output context and whether the assumption was correct. 

#### <a id="escaper.escapeText" href="#escaper.escapeText">func (e *escaper) escapeText(c context, n *parse.TextNode) context</a>

```
searchKey: template.escaper.escapeText
tags: [method private]
```

```Go
func (e *escaper) escapeText(c context, n *parse.TextNode) context
```

escapeText escapes a text template node. 

#### <a id="escaper.escapeTree" href="#escaper.escapeTree">func (e *escaper) escapeTree(c context, node parse.Node, name string, line int) (context, string)</a>

```
searchKey: template.escaper.escapeTree
tags: [method private]
```

```Go
func (e *escaper) escapeTree(c context, node parse.Node, name string, line int) (context, string)
```

escapeTree escapes the named template starting in the given context as necessary and returns its output context. 

#### <a id="escaper.template" href="#escaper.template">func (e *escaper) template(name string) *template.Template</a>

```
searchKey: template.escaper.template
tags: [method private]
```

```Go
func (e *escaper) template(name string) *template.Template
```

template returns the named template given a mangled template name. 

### <a id="execTest" href="#execTest">type execTest struct</a>

```
searchKey: template.execTest
tags: [struct private]
```

```Go
type execTest struct {
	name   string
	input  string
	output string
	data   interface{}
	ok     bool
}
```

### <a id="goodMarshaler" href="#goodMarshaler">type goodMarshaler struct{}</a>

```
searchKey: template.goodMarshaler
tags: [struct private]
```

```Go
type goodMarshaler struct{}
```

#### <a id="goodMarshaler.MarshalJSON" href="#goodMarshaler.MarshalJSON">func (x *goodMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: template.goodMarshaler.MarshalJSON
tags: [function private]
```

```Go
func (x *goodMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="jsCtx" href="#jsCtx">type jsCtx uint8</a>

```
searchKey: template.jsCtx
tags: [number private]
```

```Go
type jsCtx uint8
```

jsCtx determines whether a '/' starts a regular expression literal or a division operator. 

#### <a id="nextJSCtx" href="#nextJSCtx">func nextJSCtx(s []byte, preceding jsCtx) jsCtx</a>

```
searchKey: template.nextJSCtx
tags: [method private]
```

```Go
func nextJSCtx(s []byte, preceding jsCtx) jsCtx
```

nextJSCtx returns the context that determines whether a slash after the given run of tokens starts a regular expression instead of a division operator: / or /=. 

This assumes that the token run does not include any string tokens, comment tokens, regular expression literal tokens, or division operators. 

This fails on some valid but nonsensical JavaScript programs like "x = ++/foo/i" which is quite different than "x++/foo/i", but is not known to fail on any known useful programs. It is based on the draft JavaScript 2.0 lexical grammar and requires one token of lookbehind: [https://www.mozilla.org/js/language/js20-2000-07/rationale/syntax.html](https://www.mozilla.org/js/language/js20-2000-07/rationale/syntax.html) 

#### <a id="jsCtx.String" href="#jsCtx.String">func (i jsCtx) String() string</a>

```
searchKey: template.jsCtx.String
tags: [function private]
```

```Go
func (i jsCtx) String() string
```

### <a id="myStringer" href="#myStringer">type myStringer struct</a>

```
searchKey: template.myStringer
tags: [struct private]
```

```Go
type myStringer struct {
	v int
}
```

Test that we print using the String method. Was issue 3073. 

#### <a id="myStringer.String" href="#myStringer.String">func (s *myStringer) String() string</a>

```
searchKey: template.myStringer.String
tags: [function private]
```

```Go
func (s *myStringer) String() string
```

### <a id="nameSpace" href="#nameSpace">type nameSpace struct</a>

```
searchKey: template.nameSpace
tags: [struct private]
```

```Go
type nameSpace struct {
	mu      sync.Mutex
	set     map[string]*Template
	escaped bool
	esc     escaper
}
```

nameSpace is the data structure shared by all templates in an association. 

### <a id="recursiveInvoker" href="#recursiveInvoker">type recursiveInvoker struct</a>

```
searchKey: template.recursiveInvoker
tags: [struct private]
```

```Go
type recursiveInvoker struct {
	t    *testing.T
	tmpl *Template
}
```

recursiveInvoker is for TestRecursiveExecuteViaMethod. 

#### <a id="recursiveInvoker.Recur" href="#recursiveInvoker.Recur">func (r *recursiveInvoker) Recur() (string, error)</a>

```
searchKey: template.recursiveInvoker.Recur
tags: [function private]
```

```Go
func (r *recursiveInvoker) Recur() (string, error)
```

### <a id="state" href="#state">type state uint8</a>

```
searchKey: template.state
tags: [number private]
```

```Go
type state uint8
```

state describes a high-level HTML parser state. 

It bounds the top of the element stack, and by extension the HTML insertion mode, but also contains state that does not correspond to anything in the HTML5 parsing algorithm because a single token production in the HTML grammar may contain embedded actions in a template. For instance, the quoted HTML attribute produced by 

```
<div title="Hello {{.World}}">

```
is a single token in HTML's grammar but in a template spans several nodes. 

#### <a id="state.String" href="#state.String">func (i state) String() string</a>

```
searchKey: template.state.String
tags: [function private]
```

```Go
func (i state) String() string
```

### <a id="urlPart" href="#urlPart">type urlPart uint8</a>

```
searchKey: template.urlPart
tags: [number private]
```

```Go
type urlPart uint8
```

urlPart identifies a part in an RFC 3986 hierarchical URL to allow different encoding strategies. 

#### <a id="urlPart.String" href="#urlPart.String">func (i urlPart) String() string</a>

```
searchKey: template.urlPart.String
tags: [function private]
```

```Go
func (i urlPart) String() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkCSSEscaper" href="#BenchmarkCSSEscaper">func BenchmarkCSSEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkCSSEscaper
tags: [method private benchmark]
```

```Go
func BenchmarkCSSEscaper(b *testing.B)
```

### <a id="BenchmarkCSSEscaperNoSpecials" href="#BenchmarkCSSEscaperNoSpecials">func BenchmarkCSSEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkCSSEscaperNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkCSSEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkCSSValueFilter" href="#BenchmarkCSSValueFilter">func BenchmarkCSSValueFilter(b *testing.B)</a>

```
searchKey: template.BenchmarkCSSValueFilter
tags: [method private benchmark]
```

```Go
func BenchmarkCSSValueFilter(b *testing.B)
```

### <a id="BenchmarkCSSValueFilterOk" href="#BenchmarkCSSValueFilterOk">func BenchmarkCSSValueFilterOk(b *testing.B)</a>

```
searchKey: template.BenchmarkCSSValueFilterOk
tags: [method private benchmark]
```

```Go
func BenchmarkCSSValueFilterOk(b *testing.B)
```

### <a id="BenchmarkDecodeCSS" href="#BenchmarkDecodeCSS">func BenchmarkDecodeCSS(b *testing.B)</a>

```
searchKey: template.BenchmarkDecodeCSS
tags: [method private benchmark]
```

```Go
func BenchmarkDecodeCSS(b *testing.B)
```

### <a id="BenchmarkDecodeCSSNoSpecials" href="#BenchmarkDecodeCSSNoSpecials">func BenchmarkDecodeCSSNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkDecodeCSSNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkDecodeCSSNoSpecials(b *testing.B)
```

### <a id="BenchmarkEscapedExecute" href="#BenchmarkEscapedExecute">func BenchmarkEscapedExecute(b *testing.B)</a>

```
searchKey: template.BenchmarkEscapedExecute
tags: [method private benchmark]
```

```Go
func BenchmarkEscapedExecute(b *testing.B)
```

### <a id="BenchmarkHTMLNospaceEscaper" href="#BenchmarkHTMLNospaceEscaper">func BenchmarkHTMLNospaceEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkHTMLNospaceEscaper
tags: [method private benchmark]
```

```Go
func BenchmarkHTMLNospaceEscaper(b *testing.B)
```

### <a id="BenchmarkHTMLNospaceEscaperNoSpecials" href="#BenchmarkHTMLNospaceEscaperNoSpecials">func BenchmarkHTMLNospaceEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkHTMLNospaceEscaperNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkHTMLNospaceEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkJSRegexpEscaper" href="#BenchmarkJSRegexpEscaper">func BenchmarkJSRegexpEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkJSRegexpEscaper
tags: [method private benchmark]
```

```Go
func BenchmarkJSRegexpEscaper(b *testing.B)
```

### <a id="BenchmarkJSRegexpEscaperNoSpecials" href="#BenchmarkJSRegexpEscaperNoSpecials">func BenchmarkJSRegexpEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkJSRegexpEscaperNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkJSRegexpEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkJSStrEscaper" href="#BenchmarkJSStrEscaper">func BenchmarkJSStrEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkJSStrEscaper
tags: [method private benchmark]
```

```Go
func BenchmarkJSStrEscaper(b *testing.B)
```

### <a id="BenchmarkJSStrEscaperNoSpecials" href="#BenchmarkJSStrEscaperNoSpecials">func BenchmarkJSStrEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkJSStrEscaperNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkJSStrEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkJSValEscaperWithNum" href="#BenchmarkJSValEscaperWithNum">func BenchmarkJSValEscaperWithNum(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithNum
tags: [method private benchmark]
```

```Go
func BenchmarkJSValEscaperWithNum(b *testing.B)
```

### <a id="BenchmarkJSValEscaperWithObj" href="#BenchmarkJSValEscaperWithObj">func BenchmarkJSValEscaperWithObj(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithObj
tags: [method private benchmark]
```

```Go
func BenchmarkJSValEscaperWithObj(b *testing.B)
```

### <a id="BenchmarkJSValEscaperWithObjNoSpecials" href="#BenchmarkJSValEscaperWithObjNoSpecials">func BenchmarkJSValEscaperWithObjNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithObjNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkJSValEscaperWithObjNoSpecials(b *testing.B)
```

### <a id="BenchmarkJSValEscaperWithStr" href="#BenchmarkJSValEscaperWithStr">func BenchmarkJSValEscaperWithStr(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithStr
tags: [method private benchmark]
```

```Go
func BenchmarkJSValEscaperWithStr(b *testing.B)
```

### <a id="BenchmarkJSValEscaperWithStrNoSpecials" href="#BenchmarkJSValEscaperWithStrNoSpecials">func BenchmarkJSValEscaperWithStrNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithStrNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkJSValEscaperWithStrNoSpecials(b *testing.B)
```

### <a id="BenchmarkSrcsetFilter" href="#BenchmarkSrcsetFilter">func BenchmarkSrcsetFilter(b *testing.B)</a>

```
searchKey: template.BenchmarkSrcsetFilter
tags: [method private benchmark]
```

```Go
func BenchmarkSrcsetFilter(b *testing.B)
```

### <a id="BenchmarkSrcsetFilterNoSpecials" href="#BenchmarkSrcsetFilterNoSpecials">func BenchmarkSrcsetFilterNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkSrcsetFilterNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkSrcsetFilterNoSpecials(b *testing.B)
```

### <a id="BenchmarkStripTags" href="#BenchmarkStripTags">func BenchmarkStripTags(b *testing.B)</a>

```
searchKey: template.BenchmarkStripTags
tags: [method private benchmark]
```

```Go
func BenchmarkStripTags(b *testing.B)
```

### <a id="BenchmarkStripTagsNoSpecials" href="#BenchmarkStripTagsNoSpecials">func BenchmarkStripTagsNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkStripTagsNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkStripTagsNoSpecials(b *testing.B)
```

### <a id="BenchmarkTemplateSpecialTags" href="#BenchmarkTemplateSpecialTags">func BenchmarkTemplateSpecialTags(b *testing.B)</a>

```
searchKey: template.BenchmarkTemplateSpecialTags
tags: [method private benchmark]
```

```Go
func BenchmarkTemplateSpecialTags(b *testing.B)
```

### <a id="BenchmarkURLEscaper" href="#BenchmarkURLEscaper">func BenchmarkURLEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkURLEscaper
tags: [method private benchmark]
```

```Go
func BenchmarkURLEscaper(b *testing.B)
```

### <a id="BenchmarkURLEscaperNoSpecials" href="#BenchmarkURLEscaperNoSpecials">func BenchmarkURLEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkURLEscaperNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkURLEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkURLNormalizer" href="#BenchmarkURLNormalizer">func BenchmarkURLNormalizer(b *testing.B)</a>

```
searchKey: template.BenchmarkURLNormalizer
tags: [method private benchmark]
```

```Go
func BenchmarkURLNormalizer(b *testing.B)
```

### <a id="BenchmarkURLNormalizerNoSpecials" href="#BenchmarkURLNormalizerNoSpecials">func BenchmarkURLNormalizerNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkURLNormalizerNoSpecials
tags: [method private benchmark]
```

```Go
func BenchmarkURLNormalizerNoSpecials(b *testing.B)
```

### <a id="HTMLEscape" href="#HTMLEscape">func HTMLEscape(w io.Writer, b []byte)</a>

```
searchKey: template.HTMLEscape
tags: [method]
```

```Go
func HTMLEscape(w io.Writer, b []byte)
```

HTMLEscape writes to w the escaped HTML equivalent of the plain text data b. 

### <a id="HTMLEscapeString" href="#HTMLEscapeString">func HTMLEscapeString(s string) string</a>

```
searchKey: template.HTMLEscapeString
tags: [method]
```

```Go
func HTMLEscapeString(s string) string
```

HTMLEscapeString returns the escaped HTML equivalent of the plain text data s. 

### <a id="HTMLEscaper" href="#HTMLEscaper">func HTMLEscaper(args ...interface{}) string</a>

```
searchKey: template.HTMLEscaper
tags: [method]
```

```Go
func HTMLEscaper(args ...interface{}) string
```

HTMLEscaper returns the escaped HTML equivalent of the textual representation of its arguments. 

### <a id="IsTrue" href="#IsTrue">func IsTrue(val interface{}) (truth, ok bool)</a>

```
searchKey: template.IsTrue
tags: [method]
```

```Go
func IsTrue(val interface{}) (truth, ok bool)
```

IsTrue reports whether the value is 'true', in the sense of not the zero of its type, and whether the value has a meaningful truth value. This is the definition of truth used by if and other such actions. 

### <a id="JSEscape" href="#JSEscape">func JSEscape(w io.Writer, b []byte)</a>

```
searchKey: template.JSEscape
tags: [method]
```

```Go
func JSEscape(w io.Writer, b []byte)
```

JSEscape writes to w the escaped JavaScript equivalent of the plain text data b. 

### <a id="JSEscapeString" href="#JSEscapeString">func JSEscapeString(s string) string</a>

```
searchKey: template.JSEscapeString
tags: [method]
```

```Go
func JSEscapeString(s string) string
```

JSEscapeString returns the escaped JavaScript equivalent of the plain text data s. 

### <a id="JSEscaper" href="#JSEscaper">func JSEscaper(args ...interface{}) string</a>

```
searchKey: template.JSEscaper
tags: [method]
```

```Go
func JSEscaper(args ...interface{}) string
```

JSEscaper returns the escaped JavaScript equivalent of the textual representation of its arguments. 

### <a id="TestAddParseTreeHTML" href="#TestAddParseTreeHTML">func TestAddParseTreeHTML(t *testing.T)</a>

```
searchKey: template.TestAddParseTreeHTML
tags: [method private test]
```

```Go
func TestAddParseTreeHTML(t *testing.T)
```

### <a id="TestAddParseTreeToUnparsedTemplate" href="#TestAddParseTreeToUnparsedTemplate">func TestAddParseTreeToUnparsedTemplate(t *testing.T)</a>

```
searchKey: template.TestAddParseTreeToUnparsedTemplate
tags: [method private test]
```

```Go
func TestAddParseTreeToUnparsedTemplate(t *testing.T)
```

Issue 7032 

### <a id="TestAddrOfIndex" href="#TestAddrOfIndex">func TestAddrOfIndex(t *testing.T)</a>

```
searchKey: template.TestAddrOfIndex
tags: [method private test]
```

```Go
func TestAddrOfIndex(t *testing.T)
```

### <a id="TestAliasedParseTreeDoesNotOverescape" href="#TestAliasedParseTreeDoesNotOverescape">func TestAliasedParseTreeDoesNotOverescape(t *testing.T)</a>

```
searchKey: template.TestAliasedParseTreeDoesNotOverescape
tags: [method private test]
```

```Go
func TestAliasedParseTreeDoesNotOverescape(t *testing.T)
```

Covers issue 21844. 

### <a id="TestBadFuncNames" href="#TestBadFuncNames">func TestBadFuncNames(t *testing.T)</a>

```
searchKey: template.TestBadFuncNames
tags: [method private test]
```

```Go
func TestBadFuncNames(t *testing.T)
```

### <a id="TestBlock" href="#TestBlock">func TestBlock(t *testing.T)</a>

```
searchKey: template.TestBlock
tags: [method private test]
```

```Go
func TestBlock(t *testing.T)
```

### <a id="TestCSSEscaper" href="#TestCSSEscaper">func TestCSSEscaper(t *testing.T)</a>

```
searchKey: template.TestCSSEscaper
tags: [method private test]
```

```Go
func TestCSSEscaper(t *testing.T)
```

### <a id="TestCSSValueFilter" href="#TestCSSValueFilter">func TestCSSValueFilter(t *testing.T)</a>

```
searchKey: template.TestCSSValueFilter
tags: [method private test]
```

```Go
func TestCSSValueFilter(t *testing.T)
```

### <a id="TestClone" href="#TestClone">func TestClone(t *testing.T)</a>

```
searchKey: template.TestClone
tags: [method private test]
```

```Go
func TestClone(t *testing.T)
```

### <a id="TestCloneCrash" href="#TestCloneCrash">func TestCloneCrash(t *testing.T)</a>

```
searchKey: template.TestCloneCrash
tags: [method private test]
```

```Go
func TestCloneCrash(t *testing.T)
```

This used to crash; [https://golang.org/issue/3281](https://golang.org/issue/3281) 

### <a id="TestCloneGrowth" href="#TestCloneGrowth">func TestCloneGrowth(t *testing.T)</a>

```
searchKey: template.TestCloneGrowth
tags: [method private test]
```

```Go
func TestCloneGrowth(t *testing.T)
```

### <a id="TestClonePipe" href="#TestClonePipe">func TestClonePipe(t *testing.T)</a>

```
searchKey: template.TestClonePipe
tags: [method private test]
```

```Go
func TestClonePipe(t *testing.T)
```

Issue 24791. 

### <a id="TestCloneRedefinedName" href="#TestCloneRedefinedName">func TestCloneRedefinedName(t *testing.T)</a>

```
searchKey: template.TestCloneRedefinedName
tags: [method private test]
```

```Go
func TestCloneRedefinedName(t *testing.T)
```

[https://golang.org/issue/17735](https://golang.org/issue/17735) 

### <a id="TestCloneThenParse" href="#TestCloneThenParse">func TestCloneThenParse(t *testing.T)</a>

```
searchKey: template.TestCloneThenParse
tags: [method private test]
```

```Go
func TestCloneThenParse(t *testing.T)
```

Ensure that this guarantee from the docs is upheld: "Further calls to Parse in the copy will add templates to the copy but not to the original." 

### <a id="TestComparison" href="#TestComparison">func TestComparison(t *testing.T)</a>

```
searchKey: template.TestComparison
tags: [method private test]
```

```Go
func TestComparison(t *testing.T)
```

### <a id="TestDecodeCSS" href="#TestDecodeCSS">func TestDecodeCSS(t *testing.T)</a>

```
searchKey: template.TestDecodeCSS
tags: [method private test]
```

```Go
func TestDecodeCSS(t *testing.T)
```

### <a id="TestDelims" href="#TestDelims">func TestDelims(t *testing.T)</a>

```
searchKey: template.TestDelims
tags: [method private test]
```

```Go
func TestDelims(t *testing.T)
```

### <a id="TestEmptyTemplate" href="#TestEmptyTemplate">func TestEmptyTemplate(t *testing.T)</a>

```
searchKey: template.TestEmptyTemplate
tags: [method private test]
```

```Go
func TestEmptyTemplate(t *testing.T)
```

### <a id="TestEmptyTemplateCloneCrash" href="#TestEmptyTemplateCloneCrash">func TestEmptyTemplateCloneCrash(t *testing.T)</a>

```
searchKey: template.TestEmptyTemplateCloneCrash
tags: [method private test]
```

```Go
func TestEmptyTemplateCloneCrash(t *testing.T)
```

Issue 10879 

### <a id="TestEmptyTemplateHTML" href="#TestEmptyTemplateHTML">func TestEmptyTemplateHTML(t *testing.T)</a>

```
searchKey: template.TestEmptyTemplateHTML
tags: [method private test]
```

```Go
func TestEmptyTemplateHTML(t *testing.T)
```

This is a test for issue 3272. 

### <a id="TestEndsWithCSSKeyword" href="#TestEndsWithCSSKeyword">func TestEndsWithCSSKeyword(t *testing.T)</a>

```
searchKey: template.TestEndsWithCSSKeyword
tags: [method private test]
```

```Go
func TestEndsWithCSSKeyword(t *testing.T)
```

### <a id="TestEnsurePipelineContains" href="#TestEnsurePipelineContains">func TestEnsurePipelineContains(t *testing.T)</a>

```
searchKey: template.TestEnsurePipelineContains
tags: [method private test]
```

```Go
func TestEnsurePipelineContains(t *testing.T)
```

### <a id="TestErrorOnUndefined" href="#TestErrorOnUndefined">func TestErrorOnUndefined(t *testing.T)</a>

```
searchKey: template.TestErrorOnUndefined
tags: [method private test]
```

```Go
func TestErrorOnUndefined(t *testing.T)
```

Unlike text/template, html/template crashed if given an incomplete template, that is, a template that had been named but not given any content. This is issue #10204. 

### <a id="TestErrors" href="#TestErrors">func TestErrors(t *testing.T)</a>

```
searchKey: template.TestErrors
tags: [method private test]
```

```Go
func TestErrors(t *testing.T)
```

### <a id="TestEscape" href="#TestEscape">func TestEscape(t *testing.T)</a>

```
searchKey: template.TestEscape
tags: [method private test]
```

```Go
func TestEscape(t *testing.T)
```

### <a id="TestEscapeErrorsNotIgnorable" href="#TestEscapeErrorsNotIgnorable">func TestEscapeErrorsNotIgnorable(t *testing.T)</a>

```
searchKey: template.TestEscapeErrorsNotIgnorable
tags: [method private test]
```

```Go
func TestEscapeErrorsNotIgnorable(t *testing.T)
```

### <a id="TestEscapeMalformedPipelines" href="#TestEscapeMalformedPipelines">func TestEscapeMalformedPipelines(t *testing.T)</a>

```
searchKey: template.TestEscapeMalformedPipelines
tags: [method private test]
```

```Go
func TestEscapeMalformedPipelines(t *testing.T)
```

### <a id="TestEscapeMap" href="#TestEscapeMap">func TestEscapeMap(t *testing.T)</a>

```
searchKey: template.TestEscapeMap
tags: [method private test]
```

```Go
func TestEscapeMap(t *testing.T)
```

### <a id="TestEscapeRace" href="#TestEscapeRace">func TestEscapeRace(t *testing.T)</a>

```
searchKey: template.TestEscapeRace
tags: [method private test]
```

```Go
func TestEscapeRace(t *testing.T)
```

### <a id="TestEscapeSet" href="#TestEscapeSet">func TestEscapeSet(t *testing.T)</a>

```
searchKey: template.TestEscapeSet
tags: [method private test]
```

```Go
func TestEscapeSet(t *testing.T)
```

### <a id="TestEscapeSetErrorsNotIgnorable" href="#TestEscapeSetErrorsNotIgnorable">func TestEscapeSetErrorsNotIgnorable(t *testing.T)</a>

```
searchKey: template.TestEscapeSetErrorsNotIgnorable
tags: [method private test]
```

```Go
func TestEscapeSetErrorsNotIgnorable(t *testing.T)
```

### <a id="TestEscapeText" href="#TestEscapeText">func TestEscapeText(t *testing.T)</a>

```
searchKey: template.TestEscapeText
tags: [method private test]
```

```Go
func TestEscapeText(t *testing.T)
```

### <a id="TestEscapersOnLower7AndSelectHighCodepoints" href="#TestEscapersOnLower7AndSelectHighCodepoints">func TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T)</a>

```
searchKey: template.TestEscapersOnLower7AndSelectHighCodepoints
tags: [method private test]
```

```Go
func TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T)
```

### <a id="TestEscapingNilNonemptyInterfaces" href="#TestEscapingNilNonemptyInterfaces">func TestEscapingNilNonemptyInterfaces(t *testing.T)</a>

```
searchKey: template.TestEscapingNilNonemptyInterfaces
tags: [method private test]
```

```Go
func TestEscapingNilNonemptyInterfaces(t *testing.T)
```

[https://golang.org/issue/5982](https://golang.org/issue/5982) 

### <a id="TestEvalFieldErrors" href="#TestEvalFieldErrors">func TestEvalFieldErrors(t *testing.T)</a>

```
searchKey: template.TestEvalFieldErrors
tags: [method private test]
```

```Go
func TestEvalFieldErrors(t *testing.T)
```

### <a id="TestExecError" href="#TestExecError">func TestExecError(t *testing.T)</a>

```
searchKey: template.TestExecError
tags: [method private test]
```

```Go
func TestExecError(t *testing.T)
```

Check that an error from a nested template contains all the relevant information. 

### <a id="TestExecute" href="#TestExecute">func TestExecute(t *testing.T)</a>

```
searchKey: template.TestExecute
tags: [method private test]
```

```Go
func TestExecute(t *testing.T)
```

### <a id="TestExecuteError" href="#TestExecuteError">func TestExecuteError(t *testing.T)</a>

```
searchKey: template.TestExecuteError
tags: [method private test]
```

```Go
func TestExecuteError(t *testing.T)
```

Check that an error from a method flows back to the top. 

### <a id="TestExecuteGivesExecError" href="#TestExecuteGivesExecError">func TestExecuteGivesExecError(t *testing.T)</a>

```
searchKey: template.TestExecuteGivesExecError
tags: [method private test]
```

```Go
func TestExecuteGivesExecError(t *testing.T)
```

### <a id="TestExecuteOnNewTemplate" href="#TestExecuteOnNewTemplate">func TestExecuteOnNewTemplate(t *testing.T)</a>

```
searchKey: template.TestExecuteOnNewTemplate
tags: [method private test]
```

```Go
func TestExecuteOnNewTemplate(t *testing.T)
```

### <a id="TestExecutePanicDuringCall" href="#TestExecutePanicDuringCall">func TestExecutePanicDuringCall(t *testing.T)</a>

```
searchKey: template.TestExecutePanicDuringCall
tags: [method private test]
```

```Go
func TestExecutePanicDuringCall(t *testing.T)
```

Check that panics during calls are recovered and returned as errors. 

### <a id="TestFinalForPrintf" href="#TestFinalForPrintf">func TestFinalForPrintf(t *testing.T)</a>

```
searchKey: template.TestFinalForPrintf
tags: [method private test]
```

```Go
func TestFinalForPrintf(t *testing.T)
```

### <a id="TestFindEndTag" href="#TestFindEndTag">func TestFindEndTag(t *testing.T)</a>

```
searchKey: template.TestFindEndTag
tags: [method private test]
```

```Go
func TestFindEndTag(t *testing.T)
```

### <a id="TestFuncMapWorksAfterClone" href="#TestFuncMapWorksAfterClone">func TestFuncMapWorksAfterClone(t *testing.T)</a>

```
searchKey: template.TestFuncMapWorksAfterClone
tags: [method private test]
```

```Go
func TestFuncMapWorksAfterClone(t *testing.T)
```

[https://golang.org/issue/5980](https://golang.org/issue/5980) 

### <a id="TestGoodFuncNames" href="#TestGoodFuncNames">func TestGoodFuncNames(t *testing.T)</a>

```
searchKey: template.TestGoodFuncNames
tags: [method private test]
```

```Go
func TestGoodFuncNames(t *testing.T)
```

### <a id="TestHTMLNospaceEscaper" href="#TestHTMLNospaceEscaper">func TestHTMLNospaceEscaper(t *testing.T)</a>

```
searchKey: template.TestHTMLNospaceEscaper
tags: [method private test]
```

```Go
func TestHTMLNospaceEscaper(t *testing.T)
```

### <a id="TestHexDecode" href="#TestHexDecode">func TestHexDecode(t *testing.T)</a>

```
searchKey: template.TestHexDecode
tags: [method private test]
```

```Go
func TestHexDecode(t *testing.T)
```

### <a id="TestIdempotentExecute" href="#TestIdempotentExecute">func TestIdempotentExecute(t *testing.T)</a>

```
searchKey: template.TestIdempotentExecute
tags: [method private test]
```

```Go
func TestIdempotentExecute(t *testing.T)
```

This covers issue #20842. 

### <a id="TestIndirectPrint" href="#TestIndirectPrint">func TestIndirectPrint(t *testing.T)</a>

```
searchKey: template.TestIndirectPrint
tags: [method private test]
```

```Go
func TestIndirectPrint(t *testing.T)
```

### <a id="TestInterfaceValues" href="#TestInterfaceValues">func TestInterfaceValues(t *testing.T)</a>

```
searchKey: template.TestInterfaceValues
tags: [method private test]
```

```Go
func TestInterfaceValues(t *testing.T)
```

### <a id="TestIsCSSNmchar" href="#TestIsCSSNmchar">func TestIsCSSNmchar(t *testing.T)</a>

```
searchKey: template.TestIsCSSNmchar
tags: [method private test]
```

```Go
func TestIsCSSNmchar(t *testing.T)
```

### <a id="TestIsJsMimeType" href="#TestIsJsMimeType">func TestIsJsMimeType(t *testing.T)</a>

```
searchKey: template.TestIsJsMimeType
tags: [method private test]
```

```Go
func TestIsJsMimeType(t *testing.T)
```

### <a id="TestIssue19294" href="#TestIssue19294">func TestIssue19294(t *testing.T)</a>

```
searchKey: template.TestIssue19294
tags: [method private test]
```

```Go
func TestIssue19294(t *testing.T)
```

Issue 19249 was a regression in 1.8 caused by the handling of empty templates added in that release, which got different answers depending on the order templates appeared in the internal map. 

### <a id="TestIssue31810" href="#TestIssue31810">func TestIssue31810(t *testing.T)</a>

```
searchKey: template.TestIssue31810
tags: [method private test]
```

```Go
func TestIssue31810(t *testing.T)
```

Issue 31810. Check that a parenthesized first argument behaves properly. 

### <a id="TestJSEscaping" href="#TestJSEscaping">func TestJSEscaping(t *testing.T)</a>

```
searchKey: template.TestJSEscaping
tags: [method private test]
```

```Go
func TestJSEscaping(t *testing.T)
```

### <a id="TestJSRegexpEscaper" href="#TestJSRegexpEscaper">func TestJSRegexpEscaper(t *testing.T)</a>

```
searchKey: template.TestJSRegexpEscaper
tags: [method private test]
```

```Go
func TestJSRegexpEscaper(t *testing.T)
```

### <a id="TestJSStrEscaper" href="#TestJSStrEscaper">func TestJSStrEscaper(t *testing.T)</a>

```
searchKey: template.TestJSStrEscaper
tags: [method private test]
```

```Go
func TestJSStrEscaper(t *testing.T)
```

### <a id="TestJSValEscaper" href="#TestJSValEscaper">func TestJSValEscaper(t *testing.T)</a>

```
searchKey: template.TestJSValEscaper
tags: [method private test]
```

```Go
func TestJSValEscaper(t *testing.T)
```

### <a id="TestMaxExecDepth" href="#TestMaxExecDepth">func TestMaxExecDepth(t *testing.T)</a>

```
searchKey: template.TestMaxExecDepth
tags: [method private test]
```

```Go
func TestMaxExecDepth(t *testing.T)
```

### <a id="TestMessageForExecuteEmpty" href="#TestMessageForExecuteEmpty">func TestMessageForExecuteEmpty(t *testing.T)</a>

```
searchKey: template.TestMessageForExecuteEmpty
tags: [method private test]
```

```Go
func TestMessageForExecuteEmpty(t *testing.T)
```

### <a id="TestMissingMapKey" href="#TestMissingMapKey">func TestMissingMapKey(t *testing.T)</a>

```
searchKey: template.TestMissingMapKey
tags: [method private test]
```

```Go
func TestMissingMapKey(t *testing.T)
```

### <a id="TestMultiExecute" href="#TestMultiExecute">func TestMultiExecute(t *testing.T)</a>

```
searchKey: template.TestMultiExecute
tags: [method private test]
```

```Go
func TestMultiExecute(t *testing.T)
```

### <a id="TestNextJsCtx" href="#TestNextJsCtx">func TestNextJsCtx(t *testing.T)</a>

```
searchKey: template.TestNextJsCtx
tags: [method private test]
```

```Go
func TestNextJsCtx(t *testing.T)
```

### <a id="TestOrphanedTemplate" href="#TestOrphanedTemplate">func TestOrphanedTemplate(t *testing.T)</a>

```
searchKey: template.TestOrphanedTemplate
tags: [method private test]
```

```Go
func TestOrphanedTemplate(t *testing.T)
```

Covers issue 22780. 

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: template.TestParse
tags: [method private test]
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestParseFS" href="#TestParseFS">func TestParseFS(t *testing.T)</a>

```
searchKey: template.TestParseFS
tags: [method private test]
```

```Go
func TestParseFS(t *testing.T)
```

### <a id="TestParseFiles" href="#TestParseFiles">func TestParseFiles(t *testing.T)</a>

```
searchKey: template.TestParseFiles
tags: [method private test]
```

```Go
func TestParseFiles(t *testing.T)
```

### <a id="TestParseFilesWithData" href="#TestParseFilesWithData">func TestParseFilesWithData(t *testing.T)</a>

```
searchKey: template.TestParseFilesWithData
tags: [method private test]
```

```Go
func TestParseFilesWithData(t *testing.T)
```

### <a id="TestParseGlob" href="#TestParseGlob">func TestParseGlob(t *testing.T)</a>

```
searchKey: template.TestParseGlob
tags: [method private test]
```

```Go
func TestParseGlob(t *testing.T)
```

### <a id="TestParseGlobWithData" href="#TestParseGlobWithData">func TestParseGlobWithData(t *testing.T)</a>

```
searchKey: template.TestParseGlobWithData
tags: [method private test]
```

```Go
func TestParseGlobWithData(t *testing.T)
```

### <a id="TestParseZipFS" href="#TestParseZipFS">func TestParseZipFS(t *testing.T)</a>

```
searchKey: template.TestParseZipFS
tags: [method private test]
```

```Go
func TestParseZipFS(t *testing.T)
```

### <a id="TestPipeToMethodIsEscaped" href="#TestPipeToMethodIsEscaped">func TestPipeToMethodIsEscaped(t *testing.T)</a>

```
searchKey: template.TestPipeToMethodIsEscaped
tags: [method private test]
```

```Go
func TestPipeToMethodIsEscaped(t *testing.T)
```

This is a test for issue 7379: type assertion error caused panic, and then the code to handle the panic breaks escaping. It's hard to see the second problem once the first is fixed, but its fix is trivial so we let that go. See the discussion for issue 7379. 

### <a id="TestRecursiveExecute" href="#TestRecursiveExecute">func TestRecursiveExecute(t *testing.T)</a>

```
searchKey: template.TestRecursiveExecute
tags: [method private test]
```

```Go
func TestRecursiveExecute(t *testing.T)
```

### <a id="TestRecursiveExecuteViaMethod" href="#TestRecursiveExecuteViaMethod">func TestRecursiveExecuteViaMethod(t *testing.T)</a>

```
searchKey: template.TestRecursiveExecuteViaMethod
tags: [method private test]
```

```Go
func TestRecursiveExecuteViaMethod(t *testing.T)
```

### <a id="TestRedefinition" href="#TestRedefinition">func TestRedefinition(t *testing.T)</a>

```
searchKey: template.TestRedefinition
tags: [method private test]
```

```Go
func TestRedefinition(t *testing.T)
```

### <a id="TestRedundantFuncs" href="#TestRedundantFuncs">func TestRedundantFuncs(t *testing.T)</a>

```
searchKey: template.TestRedundantFuncs
tags: [method private test]
```

```Go
func TestRedundantFuncs(t *testing.T)
```

### <a id="TestSkipCSSSpace" href="#TestSkipCSSSpace">func TestSkipCSSSpace(t *testing.T)</a>

```
searchKey: template.TestSkipCSSSpace
tags: [method private test]
```

```Go
func TestSkipCSSSpace(t *testing.T)
```

### <a id="TestSrcsetFilter" href="#TestSrcsetFilter">func TestSrcsetFilter(t *testing.T)</a>

```
searchKey: template.TestSrcsetFilter
tags: [method private test]
```

```Go
func TestSrcsetFilter(t *testing.T)
```

### <a id="TestStringer" href="#TestStringer">func TestStringer(t *testing.T)</a>

```
searchKey: template.TestStringer
tags: [method private test]
```

```Go
func TestStringer(t *testing.T)
```

### <a id="TestStripTags" href="#TestStripTags">func TestStripTags(t *testing.T)</a>

```
searchKey: template.TestStripTags
tags: [method private test]
```

```Go
func TestStripTags(t *testing.T)
```

### <a id="TestTemplateCloneExecuteRace" href="#TestTemplateCloneExecuteRace">func TestTemplateCloneExecuteRace(t *testing.T)</a>

```
searchKey: template.TestTemplateCloneExecuteRace
tags: [method private test]
```

```Go
func TestTemplateCloneExecuteRace(t *testing.T)
```

[https://golang.org/issue/16101](https://golang.org/issue/16101) 

### <a id="TestTemplateCloneLookup" href="#TestTemplateCloneLookup">func TestTemplateCloneLookup(t *testing.T)</a>

```
searchKey: template.TestTemplateCloneLookup
tags: [method private test]
```

```Go
func TestTemplateCloneLookup(t *testing.T)
```

### <a id="TestTemplateFuncsAfterClone" href="#TestTemplateFuncsAfterClone">func TestTemplateFuncsAfterClone(t *testing.T)</a>

```
searchKey: template.TestTemplateFuncsAfterClone
tags: [method private test]
```

```Go
func TestTemplateFuncsAfterClone(t *testing.T)
```

Issue 43295. 

### <a id="TestTemplateLookUp" href="#TestTemplateLookUp">func TestTemplateLookUp(t *testing.T)</a>

```
searchKey: template.TestTemplateLookUp
tags: [method private test]
```

```Go
func TestTemplateLookUp(t *testing.T)
```

Issue 10910, 10926 

### <a id="TestTemplates" href="#TestTemplates">func TestTemplates(t *testing.T)</a>

```
searchKey: template.TestTemplates
tags: [method private test]
```

```Go
func TestTemplates(t *testing.T)
```

### <a id="TestTree" href="#TestTree">func TestTree(t *testing.T)</a>

```
searchKey: template.TestTree
tags: [method private test]
```

```Go
func TestTree(t *testing.T)
```

### <a id="TestTypedContent" href="#TestTypedContent">func TestTypedContent(t *testing.T)</a>

```
searchKey: template.TestTypedContent
tags: [method private test]
```

```Go
func TestTypedContent(t *testing.T)
```

### <a id="TestURLFilters" href="#TestURLFilters">func TestURLFilters(t *testing.T)</a>

```
searchKey: template.TestURLFilters
tags: [method private test]
```

```Go
func TestURLFilters(t *testing.T)
```

### <a id="TestURLNormalizer" href="#TestURLNormalizer">func TestURLNormalizer(t *testing.T)</a>

```
searchKey: template.TestURLNormalizer
tags: [method private test]
```

```Go
func TestURLNormalizer(t *testing.T)
```

### <a id="TestUnterminatedStringError" href="#TestUnterminatedStringError">func TestUnterminatedStringError(t *testing.T)</a>

```
searchKey: template.TestUnterminatedStringError
tags: [method private test]
```

```Go
func TestUnterminatedStringError(t *testing.T)
```

Test that the error message for multiline unterminated string refers to the line number of the opening quote. 

### <a id="URLQueryEscaper" href="#URLQueryEscaper">func URLQueryEscaper(args ...interface{}) string</a>

```
searchKey: template.URLQueryEscaper
tags: [method]
```

```Go
func URLQueryEscaper(args ...interface{}) string
```

URLQueryEscaper returns the escaped value of the textual representation of its arguments in a form suitable for embedding in a URL query. 

### <a id="add" href="#add">func add(args ...int) int</a>

```
searchKey: template.add
tags: [method private]
```

```Go
func add(args ...int) int
```

### <a id="appendCmd" href="#appendCmd">func appendCmd(cmds []*parse.CommandNode, cmd *parse.CommandNode) []*parse.CommandNode</a>

```
searchKey: template.appendCmd
tags: [method private]
```

```Go
func appendCmd(cmds []*parse.CommandNode, cmd *parse.CommandNode) []*parse.CommandNode
```

appendCmd appends the given command to the end of the command pipeline unless it is redundant with the last command. 

### <a id="asciiAlpha" href="#asciiAlpha">func asciiAlpha(c byte) bool</a>

```
searchKey: template.asciiAlpha
tags: [method private]
```

```Go
func asciiAlpha(c byte) bool
```

asciiAlpha reports whether c is an ASCII letter. 

### <a id="asciiAlphaNum" href="#asciiAlphaNum">func asciiAlphaNum(c byte) bool</a>

```
searchKey: template.asciiAlphaNum
tags: [method private]
```

```Go
func asciiAlphaNum(c byte) bool
```

asciiAlphaNum reports whether c is an ASCII letter or digit. 

### <a id="attrEscaper" href="#attrEscaper">func attrEscaper(args ...interface{}) string</a>

```
searchKey: template.attrEscaper
tags: [method private]
```

```Go
func attrEscaper(args ...interface{}) string
```

attrEscaper escapes for inclusion in quoted attribute values. 

### <a id="commentEscaper" href="#commentEscaper">func commentEscaper(args ...interface{}) string</a>

```
searchKey: template.commentEscaper
tags: [method private]
```

```Go
func commentEscaper(args ...interface{}) string
```

commentEscaper returns the empty string regardless of input. Comment content does not correspond to any parsed structure or human-readable content, so the simplest and most secure policy is to drop content interpolated into comments. This approach is equally valid whether or not static comment content is removed from the template. 

### <a id="count" href="#count">func count(n int) chan string</a>

```
searchKey: template.count
tags: [method private]
```

```Go
func count(n int) chan string
```

count returns a channel that will deliver n sequential 1-letter strings starting at "a" 

### <a id="cssEscaper" href="#cssEscaper">func cssEscaper(args ...interface{}) string</a>

```
searchKey: template.cssEscaper
tags: [method private]
```

```Go
func cssEscaper(args ...interface{}) string
```

cssEscaper escapes HTML and CSS special characters using \<hex>+ escapes. 

### <a id="cssValueFilter" href="#cssValueFilter">func cssValueFilter(args ...interface{}) string</a>

```
searchKey: template.cssValueFilter
tags: [method private]
```

```Go
func cssValueFilter(args ...interface{}) string
```

cssValueFilter allows innocuous CSS values in the output including CSS quantities (10px or 25%), ID or class literals (#foo, .bar), keyword values (inherit, blue), and colors (#888). It filters out unsafe values, such as those that affect token boundaries, and anything that might execute scripts. 

### <a id="dddArg" href="#dddArg">func dddArg(a int, b ...string) string</a>

```
searchKey: template.dddArg
tags: [method private]
```

```Go
func dddArg(a int, b ...string) string
```

### <a id="decodeCSS" href="#decodeCSS">func decodeCSS(s []byte) []byte</a>

```
searchKey: template.decodeCSS
tags: [method private]
```

```Go
func decodeCSS(s []byte) []byte
```

decodeCSS decodes CSS3 escapes given a sequence of stringchars. If there is no change, it returns the input, otherwise it returns a slice backed by a new array. [https://www.w3.org/TR/css3-syntax/#SUBTOK-stringchar](https://www.w3.org/TR/css3-syntax/#SUBTOK-stringchar) defines stringchar. 

### <a id="eatWhiteSpace" href="#eatWhiteSpace">func eatWhiteSpace(s []byte, i int) int</a>

```
searchKey: template.eatWhiteSpace
tags: [method private]
```

```Go
func eatWhiteSpace(s []byte, i int) int
```

eatWhiteSpace returns the largest j such that s[i:j] is white space. 

### <a id="echo" href="#echo">func echo(arg interface{}) interface{}</a>

```
searchKey: template.echo
tags: [method private]
```

```Go
func echo(arg interface{}) interface{}
```

### <a id="endsWithCSSKeyword" href="#endsWithCSSKeyword">func endsWithCSSKeyword(b []byte, kw string) bool</a>

```
searchKey: template.endsWithCSSKeyword
tags: [method private]
```

```Go
func endsWithCSSKeyword(b []byte, kw string) bool
```

endsWithCSSKeyword reports whether b ends with an ident that case-insensitively matches the lower-case kw. 

### <a id="ensurePipelineContains" href="#ensurePipelineContains">func ensurePipelineContains(p *parse.PipeNode, s []string)</a>

```
searchKey: template.ensurePipelineContains
tags: [method private]
```

```Go
func ensurePipelineContains(p *parse.PipeNode, s []string)
```

ensurePipelineContains ensures that the pipeline ends with the commands with the identifiers in s in order. If the pipeline ends with a predefined escaper (i.e. "html" or "urlquery"), merge it with the identifiers in s. 

### <a id="escFnsEq" href="#escFnsEq">func escFnsEq(a, b string) bool</a>

```
searchKey: template.escFnsEq
tags: [method private]
```

```Go
func escFnsEq(a, b string) bool
```

escFnsEq reports whether the two escaping functions are equivalent. 

### <a id="escapeTemplate" href="#escapeTemplate">func escapeTemplate(tmpl *Template, node parse.Node, name string) error</a>

```
searchKey: template.escapeTemplate
tags: [method private]
```

```Go
func escapeTemplate(tmpl *Template, node parse.Node, name string) error
```

escapeTemplate rewrites the named template, which must be associated with t, to guarantee that the output of any of the named templates is properly escaped. If no error is returned, then the named templates have been modified. Otherwise the named templates have been rendered unusable. 

### <a id="evalArgs" href="#evalArgs">func evalArgs(args ...interface{}) string</a>

```
searchKey: template.evalArgs
tags: [method private]
```

```Go
func evalArgs(args ...interface{}) string
```

evalArgs formats the list of arguments into a string. It is equivalent to fmt.Sprint(args...), except that it deferences all pointers. 

### <a id="filterSrcsetElement" href="#filterSrcsetElement">func filterSrcsetElement(s string, left int, right int, b *bytes.Buffer)</a>

```
searchKey: template.filterSrcsetElement
tags: [method private]
```

```Go
func filterSrcsetElement(s string, left int, right int, b *bytes.Buffer)
```

### <a id="funcNameTestFunc" href="#funcNameTestFunc">func funcNameTestFunc() int</a>

```
searchKey: template.funcNameTestFunc
tags: [function private]
```

```Go
func funcNameTestFunc() int
```

### <a id="hexDecode" href="#hexDecode">func hexDecode(s []byte) rune</a>

```
searchKey: template.hexDecode
tags: [method private]
```

```Go
func hexDecode(s []byte) rune
```

hexDecode decodes a short hex digit sequence: "10" -> 16. 

### <a id="htmlEscaper" href="#htmlEscaper">func htmlEscaper(args ...interface{}) string</a>

```
searchKey: template.htmlEscaper
tags: [method private]
```

```Go
func htmlEscaper(args ...interface{}) string
```

htmlEscaper escapes for inclusion in HTML text. 

### <a id="htmlNameFilter" href="#htmlNameFilter">func htmlNameFilter(args ...interface{}) string</a>

```
searchKey: template.htmlNameFilter
tags: [method private]
```

```Go
func htmlNameFilter(args ...interface{}) string
```

htmlNameFilter accepts valid parts of an HTML attribute or tag name or a known-safe HTML attribute. 

### <a id="htmlNospaceEscaper" href="#htmlNospaceEscaper">func htmlNospaceEscaper(args ...interface{}) string</a>

```
searchKey: template.htmlNospaceEscaper
tags: [method private]
```

```Go
func htmlNospaceEscaper(args ...interface{}) string
```

htmlNospaceEscaper escapes for inclusion in unquoted attribute values. 

### <a id="htmlReplacer" href="#htmlReplacer">func htmlReplacer(s string, replacementTable []string, badRunes bool) string</a>

```
searchKey: template.htmlReplacer
tags: [method private]
```

```Go
func htmlReplacer(s string, replacementTable []string, badRunes bool) string
```

htmlReplacer returns s with runes replaced according to replacementTable and when badRunes is true, certain bad runes are allowed through unescaped. 

### <a id="indexTagEnd" href="#indexTagEnd">func indexTagEnd(s []byte, tag []byte) int</a>

```
searchKey: template.indexTagEnd
tags: [method private]
```

```Go
func indexTagEnd(s []byte, tag []byte) int
```

indexTagEnd finds the index of a special tag end in a case insensitive way, or returns -1 

### <a id="indirect" href="#indirect">func indirect(a interface{}) interface{}</a>

```
searchKey: template.indirect
tags: [method private]
```

```Go
func indirect(a interface{}) interface{}
```

indirect returns the value, after dereferencing as many times as necessary to reach the base type (or nil). 

### <a id="indirectToJSONMarshaler" href="#indirectToJSONMarshaler">func indirectToJSONMarshaler(a interface{}) interface{}</a>

```
searchKey: template.indirectToJSONMarshaler
tags: [method private]
```

```Go
func indirectToJSONMarshaler(a interface{}) interface{}
```

indirectToJSONMarshaler returns the value, after dereferencing as many times as necessary to reach the base type (or nil) or an implementation of json.Marshal. 

### <a id="indirectToStringerOrError" href="#indirectToStringerOrError">func indirectToStringerOrError(a interface{}) interface{}</a>

```
searchKey: template.indirectToStringerOrError
tags: [method private]
```

```Go
func indirectToStringerOrError(a interface{}) interface{}
```

indirectToStringerOrError returns the value, after dereferencing as many times as necessary to reach the base type (or nil) or an implementation of fmt.Stringer or error, 

### <a id="isCSSNmchar" href="#isCSSNmchar">func isCSSNmchar(r rune) bool</a>

```
searchKey: template.isCSSNmchar
tags: [method private]
```

```Go
func isCSSNmchar(r rune) bool
```

isCSSNmchar reports whether rune is allowed anywhere in a CSS identifier. 

### <a id="isCSSSpace" href="#isCSSSpace">func isCSSSpace(b byte) bool</a>

```
searchKey: template.isCSSSpace
tags: [method private]
```

```Go
func isCSSSpace(b byte) bool
```

isCSSSpace reports whether b is a CSS space char as defined in wc. 

### <a id="isComment" href="#isComment">func isComment(s state) bool</a>

```
searchKey: template.isComment
tags: [method private]
```

```Go
func isComment(s state) bool
```

isComment is true for any state that contains content meant for template authors & maintainers, not for end-users or machines. 

### <a id="isHTMLSpace" href="#isHTMLSpace">func isHTMLSpace(c byte) bool</a>

```
searchKey: template.isHTMLSpace
tags: [method private]
```

```Go
func isHTMLSpace(c byte) bool
```

isHTMLSpace is true iff c is a whitespace character per [https://infra.spec.whatwg.org/#ascii-whitespace](https://infra.spec.whatwg.org/#ascii-whitespace) 

### <a id="isHTMLSpaceOrASCIIAlnum" href="#isHTMLSpaceOrASCIIAlnum">func isHTMLSpaceOrASCIIAlnum(c byte) bool</a>

```
searchKey: template.isHTMLSpaceOrASCIIAlnum
tags: [method private]
```

```Go
func isHTMLSpaceOrASCIIAlnum(c byte) bool
```

### <a id="isHex" href="#isHex">func isHex(c byte) bool</a>

```
searchKey: template.isHex
tags: [method private]
```

```Go
func isHex(c byte) bool
```

isHex reports whether the given character is a hex digit. 

### <a id="isInTag" href="#isInTag">func isInTag(s state) bool</a>

```
searchKey: template.isInTag
tags: [method private]
```

```Go
func isInTag(s state) bool
```

isInTag return whether s occurs solely inside an HTML tag. 

### <a id="isJSIdentPart" href="#isJSIdentPart">func isJSIdentPart(r rune) bool</a>

```
searchKey: template.isJSIdentPart
tags: [method private]
```

```Go
func isJSIdentPart(r rune) bool
```

isJSIdentPart reports whether the given rune is a JS identifier part. It does not handle all the non-Latin letters, joiners, and combining marks, but it does handle every codepoint that can occur in a numeric literal or a keyword. 

### <a id="isJSType" href="#isJSType">func isJSType(mimeType string) bool</a>

```
searchKey: template.isJSType
tags: [method private]
```

```Go
func isJSType(mimeType string) bool
```

isJSType reports whether the given MIME type should be considered JavaScript. 

It is used to determine whether a script tag with a type attribute is a javascript container. 

### <a id="isSafeURL" href="#isSafeURL">func isSafeURL(s string) bool</a>

```
searchKey: template.isSafeURL
tags: [method private]
```

```Go
func isSafeURL(s string) bool
```

isSafeURL is true if s is a relative URL or if URL has a protocol in (http, https, mailto). 

### <a id="jsRegexpEscaper" href="#jsRegexpEscaper">func jsRegexpEscaper(args ...interface{}) string</a>

```
searchKey: template.jsRegexpEscaper
tags: [method private]
```

```Go
func jsRegexpEscaper(args ...interface{}) string
```

jsRegexpEscaper behaves like jsStrEscaper but escapes regular expression specials so the result is treated literally when included in a regular expression literal. /foo{{.X}}bar/ matches the string "foo" followed by the literal text of {{.X}} followed by the string "bar". 

### <a id="jsStrEscaper" href="#jsStrEscaper">func jsStrEscaper(args ...interface{}) string</a>

```
searchKey: template.jsStrEscaper
tags: [method private]
```

```Go
func jsStrEscaper(args ...interface{}) string
```

jsStrEscaper produces a string that can be included between quotes in JavaScript source, in JavaScript embedded in an HTML5 <script> element, or in an HTML5 event handler attribute such as onclick. 

### <a id="jsValEscaper" href="#jsValEscaper">func jsValEscaper(args ...interface{}) string</a>

```
searchKey: template.jsValEscaper
tags: [method private]
```

```Go
func jsValEscaper(args ...interface{}) string
```

jsValEscaper escapes its inputs to a JS Expression (section 11.14) that has neither side-effects nor free variables outside (NaN, Infinity). 

### <a id="makemap" href="#makemap">func makemap(arg ...string) map[string]string</a>

```
searchKey: template.makemap
tags: [method private]
```

```Go
func makemap(arg ...string) map[string]string
```

### <a id="mapOfThree" href="#mapOfThree">func mapOfThree() interface{}</a>

```
searchKey: template.mapOfThree
tags: [function private]
```

```Go
func mapOfThree() interface{}
```

### <a id="newIdentCmd" href="#newIdentCmd">func newIdentCmd(identifier string, pos parse.Pos) *parse.CommandNode</a>

```
searchKey: template.newIdentCmd
tags: [method private]
```

```Go
func newIdentCmd(identifier string, pos parse.Pos) *parse.CommandNode
```

newIdentCmd produces a command containing a single identifier node. 

### <a id="newInt" href="#newInt">func newInt(n int) *int</a>

```
searchKey: template.newInt
tags: [method private]
```

```Go
func newInt(n int) *int
```

Helpers for creation. 

### <a id="newIntSlice" href="#newIntSlice">func newIntSlice(n ...int) *[]int</a>

```
searchKey: template.newIntSlice
tags: [method private]
```

```Go
func newIntSlice(n ...int) *[]int
```

### <a id="newString" href="#newString">func newString(s string) *string</a>

```
searchKey: template.newString
tags: [method private]
```

```Go
func newString(s string) *string
```

### <a id="normalizeEscFn" href="#normalizeEscFn">func normalizeEscFn(e string) string</a>

```
searchKey: template.normalizeEscFn
tags: [method private]
```

```Go
func normalizeEscFn(e string) string
```

normalizeEscFn(a) is equal to normalizeEscFn(b) for any pair of names of escaper functions a and b that are equivalent. 

### <a id="oneArg" href="#oneArg">func oneArg(a string) string</a>

```
searchKey: template.oneArg
tags: [method private]
```

```Go
func oneArg(a string) string
```

### <a id="processURLOnto" href="#processURLOnto">func processURLOnto(s string, norm bool, b *bytes.Buffer) bool</a>

```
searchKey: template.processURLOnto
tags: [method private]
```

```Go
func processURLOnto(s string, norm bool, b *bytes.Buffer) bool
```

processURLOnto appends a normalized URL corresponding to its input to b and reports whether the appended content differs from s. 

### <a id="rcdataEscaper" href="#rcdataEscaper">func rcdataEscaper(args ...interface{}) string</a>

```
searchKey: template.rcdataEscaper
tags: [method private]
```

```Go
func rcdataEscaper(args ...interface{}) string
```

rcdataEscaper escapes for inclusion in an RCDATA element body. 

### <a id="readFileFS" href="#readFileFS">func readFileFS(fsys fs.FS) func(string) (string, []byte, error)</a>

```
searchKey: template.readFileFS
tags: [method private]
```

```Go
func readFileFS(fsys fs.FS) func(string) (string, []byte, error)
```

### <a id="readFileOS" href="#readFileOS">func readFileOS(file string) (name string, b []byte, err error)</a>

```
searchKey: template.readFileOS
tags: [method private]
```

```Go
func readFileOS(file string) (name string, b []byte, err error)
```

### <a id="replace" href="#replace">func replace(s string, replacementTable []string) string</a>

```
searchKey: template.replace
tags: [method private]
```

```Go
func replace(s string, replacementTable []string) string
```

replace replaces each rune r of s with replacementTable[r], provided that r < len(replacementTable). If replacementTable[r] is the empty string then no replacement is made. It also replaces runes U+2028 and U+2029 with the raw strings `\u2028` and `\u2029`. 

### <a id="returnInt" href="#returnInt">func returnInt() int</a>

```
searchKey: template.returnInt
tags: [function private]
```

```Go
func returnInt() int
```

returnInt returns an int 

### <a id="skipCSSSpace" href="#skipCSSSpace">func skipCSSSpace(c []byte) []byte</a>

```
searchKey: template.skipCSSSpace
tags: [method private]
```

```Go
func skipCSSSpace(c []byte) []byte
```

skipCSSSpace returns a suffix of c, skipping over a single space. 

### <a id="srcsetFilterAndEscaper" href="#srcsetFilterAndEscaper">func srcsetFilterAndEscaper(args ...interface{}) string</a>

```
searchKey: template.srcsetFilterAndEscaper
tags: [method private]
```

```Go
func srcsetFilterAndEscaper(args ...interface{}) string
```

Filters and normalizes srcset values which are comma separated URLs followed by metadata. 

### <a id="stringer" href="#stringer">func stringer(s fmt.Stringer) string</a>

```
searchKey: template.stringer
tags: [method private]
```

```Go
func stringer(s fmt.Stringer) string
```

### <a id="stripTags" href="#stripTags">func stripTags(html string) string</a>

```
searchKey: template.stripTags
tags: [method private]
```

```Go
func stripTags(html string) string
```

stripTags takes a snippet of HTML and returns only the text content. For example, `<b>&iexcl;Hi!</b> <script>...</script>` -> `&iexcl;Hi! `. 

### <a id="testBadFuncName" href="#testBadFuncName">func testBadFuncName(name string, t *testing.T)</a>

```
searchKey: template.testBadFuncName
tags: [method private]
```

```Go
func testBadFuncName(name string, t *testing.T)
```

### <a id="testExecute" href="#testExecute">func testExecute(execTests []execTest, template *Template, t *testing.T)</a>

```
searchKey: template.testExecute
tags: [method private]
```

```Go
func testExecute(execTests []execTest, template *Template, t *testing.T)
```

### <a id="twoArgs" href="#twoArgs">func twoArgs(a, b string) string</a>

```
searchKey: template.twoArgs
tags: [method private]
```

```Go
func twoArgs(a, b string) string
```

### <a id="typeOf" href="#typeOf">func typeOf(arg interface{}) string</a>

```
searchKey: template.typeOf
tags: [method private]
```

```Go
func typeOf(arg interface{}) string
```

### <a id="urlEscaper" href="#urlEscaper">func urlEscaper(args ...interface{}) string</a>

```
searchKey: template.urlEscaper
tags: [method private]
```

```Go
func urlEscaper(args ...interface{}) string
```

urlEscaper produces an output that can be embedded in a URL query. The output can be embedded in an HTML attribute without further escaping. 

### <a id="urlFilter" href="#urlFilter">func urlFilter(args ...interface{}) string</a>

```
searchKey: template.urlFilter
tags: [method private]
```

```Go
func urlFilter(args ...interface{}) string
```

urlFilter returns its input unless it contains an unsafe scheme in which case it defangs the entire URL. 

Schemes that cause unintended side effects that are irreversible without user interaction are considered unsafe. For example, clicking on a "javascript:" link can immediately trigger JavaScript code execution. 

This filter conservatively assumes that all schemes other than the following are unsafe: 

```
* http:   Navigates to a new website, and may open a new window or tab.
          These side effects can be reversed by navigating back to the
          previous website, or closing the window or tab. No irreversible
          changes will take place without further user interaction with
          the new website.
* https:  Same as http.
* mailto: Opens an email program and starts a new draft. This side effect
          is not irreversible until the user explicitly clicks send; it
          can be undone by closing the email program.

```
To allow URLs containing other schemes to bypass this filter, developers must explicitly indicate that such a URL is expected and safe by encapsulating it in a template.URL value. 

### <a id="urlNormalizer" href="#urlNormalizer">func urlNormalizer(args ...interface{}) string</a>

```
searchKey: template.urlNormalizer
tags: [method private]
```

```Go
func urlNormalizer(args ...interface{}) string
```

urlNormalizer normalizes URL content so it can be embedded in a quote-delimited string or parenthesis delimited url(...). The normalizer does not encode all HTML specials. Specifically, it does not encode '&' so correct embedding in an HTML attribute requires escaping of '&' to '&amp;'. 

### <a id="urlProcessor" href="#urlProcessor">func urlProcessor(norm bool, args ...interface{}) string</a>

```
searchKey: template.urlProcessor
tags: [method private]
```

```Go
func urlProcessor(norm bool, args ...interface{}) string
```

urlProcessor normalizes (when norm is true) or escapes its input to produce a valid hierarchical or opaque URL part. 

### <a id="valueString" href="#valueString">func valueString(v string) string</a>

```
searchKey: template.valueString
tags: [method private]
```

```Go
func valueString(v string) string
```

valueString takes a string, not a pointer. 

### <a id="vfunc" href="#vfunc">func vfunc(V, *V) string</a>

```
searchKey: template.vfunc
tags: [method private]
```

```Go
func vfunc(V, *V) string
```

vfunc takes a *V and a V 

### <a id="zeroArgs" href="#zeroArgs">func zeroArgs() string</a>

```
searchKey: template.zeroArgs
tags: [function private]
```

```Go
func zeroArgs() string
```

