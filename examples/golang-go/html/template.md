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
    * [const _attr_name](#_attr_name)
    * [const contentTypePlain](#contentTypePlain)
    * [const contentTypeCSS](#contentTypeCSS)
    * [const contentTypeHTML](#contentTypeHTML)
    * [const contentTypeHTMLAttr](#contentTypeHTMLAttr)
    * [const contentTypeJS](#contentTypeJS)
    * [const contentTypeJSStr](#contentTypeJSStr)
    * [const contentTypeURL](#contentTypeURL)
    * [const contentTypeSrcset](#contentTypeSrcset)
    * [const contentTypeUnsafe](#contentTypeUnsafe)
    * [const stateText](#stateText)
    * [const stateTag](#stateTag)
    * [const stateAttrName](#stateAttrName)
    * [const stateAfterName](#stateAfterName)
    * [const stateBeforeValue](#stateBeforeValue)
    * [const stateHTMLCmt](#stateHTMLCmt)
    * [const stateRCDATA](#stateRCDATA)
    * [const stateAttr](#stateAttr)
    * [const stateURL](#stateURL)
    * [const stateSrcset](#stateSrcset)
    * [const stateJS](#stateJS)
    * [const stateJSDqStr](#stateJSDqStr)
    * [const stateJSSqStr](#stateJSSqStr)
    * [const stateJSRegexp](#stateJSRegexp)
    * [const stateJSBlockCmt](#stateJSBlockCmt)
    * [const stateJSLineCmt](#stateJSLineCmt)
    * [const stateCSS](#stateCSS)
    * [const stateCSSDqStr](#stateCSSDqStr)
    * [const stateCSSSqStr](#stateCSSSqStr)
    * [const stateCSSDqURL](#stateCSSDqURL)
    * [const stateCSSSqURL](#stateCSSSqURL)
    * [const stateCSSURL](#stateCSSURL)
    * [const stateCSSBlockCmt](#stateCSSBlockCmt)
    * [const stateCSSLineCmt](#stateCSSLineCmt)
    * [const stateError](#stateError)
    * [const delimNone](#delimNone)
    * [const delimDoubleQuote](#delimDoubleQuote)
    * [const delimSingleQuote](#delimSingleQuote)
    * [const delimSpaceOrTagEnd](#delimSpaceOrTagEnd)
    * [const urlPartNone](#urlPartNone)
    * [const urlPartPreQuery](#urlPartPreQuery)
    * [const urlPartQueryOrFrag](#urlPartQueryOrFrag)
    * [const urlPartUnknown](#urlPartUnknown)
    * [const jsCtxRegexp](#jsCtxRegexp)
    * [const jsCtxDivOp](#jsCtxDivOp)
    * [const jsCtxUnknown](#jsCtxUnknown)
    * [const elementNone](#elementNone)
    * [const elementScript](#elementScript)
    * [const elementStyle](#elementStyle)
    * [const elementTextarea](#elementTextarea)
    * [const elementTitle](#elementTitle)
    * [const attrNone](#attrNone)
    * [const attrScript](#attrScript)
    * [const attrScriptType](#attrScriptType)
    * [const attrStyle](#attrStyle)
    * [const attrURL](#attrURL)
    * [const attrSrcset](#attrSrcset)
    * [const _delim_name](#_delim_name)
    * [const _element_name](#_element_name)
    * [const OK](#OK)
    * [const ErrAmbigContext](#ErrAmbigContext)
    * [const ErrBadHTML](#ErrBadHTML)
    * [const ErrBranchEnd](#ErrBranchEnd)
    * [const ErrEndContext](#ErrEndContext)
    * [const ErrNoSuchTemplate](#ErrNoSuchTemplate)
    * [const ErrOutputContext](#ErrOutputContext)
    * [const ErrPartialCharset](#ErrPartialCharset)
    * [const ErrPartialEscape](#ErrPartialEscape)
    * [const ErrRangeLoopReentry](#ErrRangeLoopReentry)
    * [const ErrSlashAmbig](#ErrSlashAmbig)
    * [const ErrPredefinedEscaper](#ErrPredefinedEscaper)
    * [const filterFailsafe](#filterFailsafe)
    * [const _jsCtx_name](#_jsCtx_name)
    * [const _state_name](#_state_name)
    * [const htmlSpaceAndASCIIAlnumBytes](#htmlSpaceAndASCIIAlnumBytes)
    * [const _urlPart_name](#_urlPart_name)
    * [const execErrorText](#execErrorText)
    * [const treeTemplate](#treeTemplate)
    * [const testTemplates](#testTemplates)
    * [const alwaysErrorText](#alwaysErrorText)
    * [const raceText](#raceText)
    * [const multiText1](#multiText1)
    * [const multiText2](#multiText2)
    * [const cloneText1](#cloneText1)
    * [const cloneText2](#cloneText2)
    * [const cloneText3](#cloneText3)
    * [const cloneText4](#cloneText4)
* [Variables](#var)
    * [var attrTypeMap](#attrTypeMap)
    * [var _attr_index](#_attr_index)
    * [var errorType](#errorType)
    * [var fmtStringerType](#fmtStringerType)
    * [var cssReplacementTable](#cssReplacementTable)
    * [var expressionBytes](#expressionBytes)
    * [var mozBindingBytes](#mozBindingBytes)
    * [var _delim_index](#_delim_index)
    * [var _element_index](#_element_index)
    * [var funcMap](#funcMap)
    * [var predefinedEscapers](#predefinedEscapers)
    * [var equivEscapers](#equivEscapers)
    * [var redundantFuncs](#redundantFuncs)
    * [var delimEnds](#delimEnds)
    * [var doctypeBytes](#doctypeBytes)
    * [var htmlReplacementTable](#htmlReplacementTable)
    * [var htmlNormReplacementTable](#htmlNormReplacementTable)
    * [var htmlNospaceReplacementTable](#htmlNospaceReplacementTable)
    * [var htmlNospaceNormReplacementTable](#htmlNospaceNormReplacementTable)
    * [var regexpPrecederKeywords](#regexpPrecederKeywords)
    * [var jsonMarshalType](#jsonMarshalType)
    * [var lowUnicodeReplacementTable](#lowUnicodeReplacementTable)
    * [var jsStrReplacementTable](#jsStrReplacementTable)
    * [var jsStrNormReplacementTable](#jsStrNormReplacementTable)
    * [var jsRegexpReplacementTable](#jsRegexpReplacementTable)
    * [var _jsCtx_index](#_jsCtx_index)
    * [var _state_index](#_state_index)
    * [var escapeOK](#escapeOK)
    * [var transitionFunc](#transitionFunc)
    * [var commentStart](#commentStart)
    * [var commentEnd](#commentEnd)
    * [var elementContentType](#elementContentType)
    * [var attrStartStates](#attrStartStates)
    * [var specialTagEndMarkers](#specialTagEndMarkers)
    * [var specialTagEndPrefix](#specialTagEndPrefix)
    * [var tagEndSeparators](#tagEndSeparators)
    * [var blockCommentEnd](#blockCommentEnd)
    * [var elementNameMap](#elementNameMap)
    * [var _urlPart_index](#_urlPart_index)
    * [var debug](#debug)
    * [var siVal](#siVal)
    * [var tVal](#tVal)
    * [var tSliceOfNil](#tSliceOfNil)
    * [var iVal](#iVal)
    * [var myError](#myError)
    * [var bigInt](#bigInt)
    * [var bigUint](#bigUint)
    * [var execTests](#execTests)
    * [var delimPairs](#delimPairs)
    * [var cmpTests](#cmpTests)
    * [var alwaysError](#alwaysError)
    * [var multiExecTests](#multiExecTests)
    * [var templateFileExecTests](#templateFileExecTests)
* [Types](#type)
    * [type CSS string](#CSS)
    * [type HTML string](#HTML)
    * [type HTMLAttr string](#HTMLAttr)
    * [type JS string](#JS)
    * [type JSStr string](#JSStr)
    * [type URL string](#URL)
    * [type Srcset string](#Srcset)
    * [type contentType uint8](#contentType)
        * [func attrType(name string) contentType](#attrType)
        * [func stringify(args ...interface{}) (string, contentType)](#stringify)
    * [type context struct](#context)
        * [func nudge(c context) context](#nudge)
        * [func join(a, b context, node parse.Node, nodeName string) context](#join)
        * [func contextAfterText(c context, s []byte) (context, int)](#contextAfterText)
        * [func tText(c context, s []byte) (context, int)](#tText)
        * [func tTag(c context, s []byte) (context, int)](#tTag)
        * [func tAttrName(c context, s []byte) (context, int)](#tAttrName)
        * [func tAfterName(c context, s []byte) (context, int)](#tAfterName)
        * [func tBeforeValue(c context, s []byte) (context, int)](#tBeforeValue)
        * [func tHTMLCmt(c context, s []byte) (context, int)](#tHTMLCmt)
        * [func tSpecialTagEnd(c context, s []byte) (context, int)](#tSpecialTagEnd)
        * [func tAttr(c context, s []byte) (context, int)](#tAttr)
        * [func tURL(c context, s []byte) (context, int)](#tURL)
        * [func tJS(c context, s []byte) (context, int)](#tJS)
        * [func tJSDelimited(c context, s []byte) (context, int)](#tJSDelimited)
        * [func tBlockCmt(c context, s []byte) (context, int)](#tBlockCmt)
        * [func tLineCmt(c context, s []byte) (context, int)](#tLineCmt)
        * [func tCSS(c context, s []byte) (context, int)](#tCSS)
        * [func tCSSStr(c context, s []byte) (context, int)](#tCSSStr)
        * [func tError(c context, s []byte) (context, int)](#tError)
        * [func (c context) String() string](#context.String)
        * [func (c context) eq(d context) bool](#context.eq)
        * [func (c context) mangle(templateName string) string](#context.mangle)
    * [type state uint8](#state)
        * [func (i state) String() string](#state.String)
    * [type delim uint8](#delim)
        * [func (i delim) String() string](#delim.String)
    * [type urlPart uint8](#urlPart)
        * [func (i urlPart) String() string](#urlPart.String)
    * [type jsCtx uint8](#jsCtx)
        * [func nextJSCtx(s []byte, preceding jsCtx) jsCtx](#nextJSCtx)
        * [func (i jsCtx) String() string](#jsCtx.String)
    * [type element uint8](#element)
        * [func eatTagName(s []byte, i int) (int, element)](#eatTagName)
        * [func (i element) String() string](#element.String)
    * [type attr uint8](#attr)
        * [func (i attr) String() string](#attr.String)
    * [type Error struct](#Error)
        * [func errorf(k ErrorCode, node parse.Node, line int, f string, args ...interface{}) *Error](#errorf)
        * [func eatAttrName(s []byte, i int) (int, *Error)](#eatAttrName)
        * [func (e *Error) Error() string](#Error.Error)
    * [type ErrorCode int](#ErrorCode)
    * [type escaper struct](#escaper)
        * [func makeEscaper(n *nameSpace) escaper](#makeEscaper)
        * [func (e *escaper) escape(c context, n parse.Node) context](#escaper.escape)
        * [func (e *escaper) escapeAction(c context, n *parse.ActionNode) context](#escaper.escapeAction)
        * [func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string) context](#escaper.escapeBranch)
        * [func (e *escaper) escapeList(c context, n *parse.ListNode) context](#escaper.escapeList)
        * [func (e *escaper) escapeListConditionally(c context, n *parse.ListNode, filter func(*escaper, context) bool) (context, bool)](#escaper.escapeListConditionally)
        * [func (e *escaper) escapeTemplate(c context, n *parse.TemplateNode) context](#escaper.escapeTemplate)
        * [func (e *escaper) escapeTree(c context, node parse.Node, name string, line int) (context, string)](#escaper.escapeTree)
        * [func (e *escaper) computeOutCtx(c context, t *template.Template) context](#escaper.computeOutCtx)
        * [func (e *escaper) escapeTemplateBody(c context, t *template.Template) (context, bool)](#escaper.escapeTemplateBody)
        * [func (e *escaper) escapeText(c context, n *parse.TextNode) context](#escaper.escapeText)
        * [func (e *escaper) editActionNode(n *parse.ActionNode, cmds []string)](#escaper.editActionNode)
        * [func (e *escaper) editTemplateNode(n *parse.TemplateNode, callee string)](#escaper.editTemplateNode)
        * [func (e *escaper) editTextNode(n *parse.TextNode, text []byte)](#escaper.editTextNode)
        * [func (e *escaper) commit()](#escaper.commit)
        * [func (e *escaper) template(name string) *template.Template](#escaper.template)
        * [func (e *escaper) arbitraryTemplate() *Template](#escaper.arbitraryTemplate)
    * [type Template struct](#Template)
        * [func New(name string) *Template](#New)
        * [func Must(t *Template, err error) *Template](#Must)
        * [func ParseFiles(filenames ...string) (*Template, error)](#ParseFiles)
        * [func parseFiles(t *Template, readFile func(string) (string, []byte, error), filenames ...string) (*Template, error)](#parseFiles)
        * [func ParseGlob(pattern string) (*Template, error)](#ParseGlob)
        * [func parseGlob(t *Template, pattern string) (*Template, error)](#parseGlob)
        * [func ParseFS(fs fs.FS, patterns ...string) (*Template, error)](#ParseFS)
        * [func parseFS(t *Template, fsys fs.FS, patterns []string) (*Template, error)](#parseFS)
        * [func (t *Template) Templates() []*Template](#Template.Templates)
        * [func (t *Template) Option(opt ...string) *Template](#Template.Option)
        * [func (t *Template) checkCanParse() error](#Template.checkCanParse)
        * [func (t *Template) escape() error](#Template.escape)
        * [func (t *Template) Execute(wr io.Writer, data interface{}) error](#Template.Execute)
        * [func (t *Template) ExecuteTemplate(wr io.Writer, name string, data interface{}) error](#Template.ExecuteTemplate)
        * [func (t *Template) lookupAndEscapeTemplate(name string) (tmpl *Template, err error)](#Template.lookupAndEscapeTemplate)
        * [func (t *Template) DefinedTemplates() string](#Template.DefinedTemplates)
        * [func (t *Template) Parse(text string) (*Template, error)](#Template.Parse)
        * [func (t *Template) AddParseTree(name string, tree *parse.Tree) (*Template, error)](#Template.AddParseTree)
        * [func (t *Template) Clone() (*Template, error)](#Template.Clone)
        * [func (t *Template) New(name string) *Template](#Template.New)
        * [func (t *Template) new(name string) *Template](#Template.new)
        * [func (t *Template) Name() string](#Template.Name)
        * [func (t *Template) Funcs(funcMap FuncMap) *Template](#Template.Funcs)
        * [func (t *Template) Delims(left, right string) *Template](#Template.Delims)
        * [func (t *Template) Lookup(name string) *Template](#Template.Lookup)
        * [func (t *Template) ParseFiles(filenames ...string) (*Template, error)](#Template.ParseFiles)
        * [func (t *Template) ParseGlob(pattern string) (*Template, error)](#Template.ParseGlob)
        * [func (t *Template) ParseFS(fs fs.FS, patterns ...string) (*Template, error)](#Template.ParseFS)
    * [type nameSpace struct](#nameSpace)
    * [type FuncMap map[string]interface{}](#FuncMap)
    * [type myStringer struct](#myStringer)
        * [func (s *myStringer) String() string](#myStringer.String)
    * [type errorer struct](#errorer)
        * [func (s *errorer) Error() string](#errorer.Error)
    * [type badMarshaler struct{}](#badMarshaler)
        * [func (x *badMarshaler) MarshalJSON() ([]byte, error)](#badMarshaler.MarshalJSON)
    * [type goodMarshaler struct{}](#goodMarshaler)
        * [func (x *goodMarshaler) MarshalJSON() ([]byte, error)](#goodMarshaler.MarshalJSON)
    * [type Issue7379 int](#Issue7379)
        * [func (Issue7379) SomeMethod(x int) string](#Issue7379.SomeMethod)
    * [type T struct](#T)
        * [func (t *T) Method0() string](#T.Method0)
        * [func (t *T) Method1(a int) int](#T.Method1)
        * [func (t *T) Method2(a uint16, b string) string](#T.Method2)
        * [func (t *T) Method3(v interface{}) string](#T.Method3)
        * [func (t *T) Copy() *T](#T.Copy)
        * [func (t *T) MAdd(a int, b []int) []int](#T.MAdd)
        * [func (t *T) MyError(error bool) (bool, error)](#T.MyError)
        * [func (t *T) GetU() *U](#T.GetU)
    * [type S []string](#S)
        * [func (S) Method0() string](#S.Method0)
    * [type U struct](#U)
        * [func (u *U) TrueFalse(b bool) string](#U.TrueFalse)
    * [type V struct](#V)
        * [func (v *V) String() string](#V.String)
    * [type W struct](#W)
        * [func (w *W) Error() string](#W.Error)
    * [type I interface](#I)
    * [type execTest struct](#execTest)
    * [type Tree struct](#Tree)
    * [type cmpTest struct](#cmpTest)
    * [type ErrorWriter int](#ErrorWriter)
        * [func (e ErrorWriter) Write(p []byte) (int, error)](#ErrorWriter.Write)
    * [type recursiveInvoker struct](#recursiveInvoker)
        * [func (r *recursiveInvoker) Recur() (string, error)](#recursiveInvoker.Recur)
* [Functions](#func)
    * [func indirect(a interface{}) interface{}](#indirect)
    * [func indirectToStringerOrError(a interface{}) interface{}](#indirectToStringerOrError)
    * [func isComment(s state) bool](#isComment)
    * [func isInTag(s state) bool](#isInTag)
    * [func endsWithCSSKeyword(b []byte, kw string) bool](#endsWithCSSKeyword)
    * [func isCSSNmchar(r rune) bool](#isCSSNmchar)
    * [func decodeCSS(s []byte) []byte](#decodeCSS)
    * [func isHex(c byte) bool](#isHex)
    * [func hexDecode(s []byte) rune](#hexDecode)
    * [func skipCSSSpace(c []byte) []byte](#skipCSSSpace)
    * [func isCSSSpace(b byte) bool](#isCSSSpace)
    * [func cssEscaper(args ...interface{}) string](#cssEscaper)
    * [func cssValueFilter(args ...interface{}) string](#cssValueFilter)
    * [func escapeTemplate(tmpl *Template, node parse.Node, name string) error](#escapeTemplate)
    * [func evalArgs(args ...interface{}) string](#evalArgs)
    * [func ensurePipelineContains(p *parse.PipeNode, s []string)](#ensurePipelineContains)
    * [func escFnsEq(a, b string) bool](#escFnsEq)
    * [func normalizeEscFn(e string) string](#normalizeEscFn)
    * [func appendCmd(cmds []*parse.CommandNode, cmd *parse.CommandNode) []*parse.CommandNode](#appendCmd)
    * [func newIdentCmd(identifier string, pos parse.Pos) *parse.CommandNode](#newIdentCmd)
    * [func HTMLEscape(w io.Writer, b []byte)](#HTMLEscape)
    * [func HTMLEscapeString(s string) string](#HTMLEscapeString)
    * [func HTMLEscaper(args ...interface{}) string](#HTMLEscaper)
    * [func JSEscape(w io.Writer, b []byte)](#JSEscape)
    * [func JSEscapeString(s string) string](#JSEscapeString)
    * [func JSEscaper(args ...interface{}) string](#JSEscaper)
    * [func URLQueryEscaper(args ...interface{}) string](#URLQueryEscaper)
    * [func htmlNospaceEscaper(args ...interface{}) string](#htmlNospaceEscaper)
    * [func attrEscaper(args ...interface{}) string](#attrEscaper)
    * [func rcdataEscaper(args ...interface{}) string](#rcdataEscaper)
    * [func htmlEscaper(args ...interface{}) string](#htmlEscaper)
    * [func htmlReplacer(s string, replacementTable []string, badRunes bool) string](#htmlReplacer)
    * [func stripTags(html string) string](#stripTags)
    * [func htmlNameFilter(args ...interface{}) string](#htmlNameFilter)
    * [func commentEscaper(args ...interface{}) string](#commentEscaper)
    * [func indirectToJSONMarshaler(a interface{}) interface{}](#indirectToJSONMarshaler)
    * [func jsValEscaper(args ...interface{}) string](#jsValEscaper)
    * [func jsStrEscaper(args ...interface{}) string](#jsStrEscaper)
    * [func jsRegexpEscaper(args ...interface{}) string](#jsRegexpEscaper)
    * [func replace(s string, replacementTable []string) string](#replace)
    * [func isJSIdentPart(r rune) bool](#isJSIdentPart)
    * [func isJSType(mimeType string) bool](#isJSType)
    * [func IsTrue(val interface{}) (truth, ok bool)](#IsTrue)
    * [func readFileOS(file string) (name string, b []byte, err error)](#readFileOS)
    * [func readFileFS(fsys fs.FS) func(string) (string, []byte, error)](#readFileFS)
    * [func indexTagEnd(s []byte, tag []byte) int](#indexTagEnd)
    * [func asciiAlpha(c byte) bool](#asciiAlpha)
    * [func asciiAlphaNum(c byte) bool](#asciiAlphaNum)
    * [func eatWhiteSpace(s []byte, i int) int](#eatWhiteSpace)
    * [func urlFilter(args ...interface{}) string](#urlFilter)
    * [func isSafeURL(s string) bool](#isSafeURL)
    * [func urlEscaper(args ...interface{}) string](#urlEscaper)
    * [func urlNormalizer(args ...interface{}) string](#urlNormalizer)
    * [func urlProcessor(norm bool, args ...interface{}) string](#urlProcessor)
    * [func processURLOnto(s string, norm bool, b *bytes.Buffer) bool](#processURLOnto)
    * [func srcsetFilterAndEscaper(args ...interface{}) string](#srcsetFilterAndEscaper)
    * [func isHTMLSpace(c byte) bool](#isHTMLSpace)
    * [func isHTMLSpaceOrASCIIAlnum(c byte) bool](#isHTMLSpaceOrASCIIAlnum)
    * [func filterSrcsetElement(s string, left int, right int, b *bytes.Buffer)](#filterSrcsetElement)
    * [func TestAddParseTreeHTML(t *testing.T)](#TestAddParseTreeHTML)
    * [func TestClone(t *testing.T)](#TestClone)
    * [func TestTemplates(t *testing.T)](#TestTemplates)
    * [func TestCloneCrash(t *testing.T)](#TestCloneCrash)
    * [func TestCloneThenParse(t *testing.T)](#TestCloneThenParse)
    * [func TestFuncMapWorksAfterClone(t *testing.T)](#TestFuncMapWorksAfterClone)
    * [func TestTemplateCloneExecuteRace(t *testing.T)](#TestTemplateCloneExecuteRace)
    * [func TestTemplateCloneLookup(t *testing.T)](#TestTemplateCloneLookup)
    * [func TestCloneGrowth(t *testing.T)](#TestCloneGrowth)
    * [func TestCloneRedefinedName(t *testing.T)](#TestCloneRedefinedName)
    * [func TestClonePipe(t *testing.T)](#TestClonePipe)
    * [func TestTypedContent(t *testing.T)](#TestTypedContent)
    * [func TestStringer(t *testing.T)](#TestStringer)
    * [func TestEscapingNilNonemptyInterfaces(t *testing.T)](#TestEscapingNilNonemptyInterfaces)
    * [func TestEndsWithCSSKeyword(t *testing.T)](#TestEndsWithCSSKeyword)
    * [func TestIsCSSNmchar(t *testing.T)](#TestIsCSSNmchar)
    * [func TestDecodeCSS(t *testing.T)](#TestDecodeCSS)
    * [func TestHexDecode(t *testing.T)](#TestHexDecode)
    * [func TestSkipCSSSpace(t *testing.T)](#TestSkipCSSSpace)
    * [func TestCSSEscaper(t *testing.T)](#TestCSSEscaper)
    * [func TestCSSValueFilter(t *testing.T)](#TestCSSValueFilter)
    * [func BenchmarkCSSEscaper(b *testing.B)](#BenchmarkCSSEscaper)
    * [func BenchmarkCSSEscaperNoSpecials(b *testing.B)](#BenchmarkCSSEscaperNoSpecials)
    * [func BenchmarkDecodeCSS(b *testing.B)](#BenchmarkDecodeCSS)
    * [func BenchmarkDecodeCSSNoSpecials(b *testing.B)](#BenchmarkDecodeCSSNoSpecials)
    * [func BenchmarkCSSValueFilter(b *testing.B)](#BenchmarkCSSValueFilter)
    * [func BenchmarkCSSValueFilterOk(b *testing.B)](#BenchmarkCSSValueFilterOk)
    * [func TestEscape(t *testing.T)](#TestEscape)
    * [func TestEscapeMap(t *testing.T)](#TestEscapeMap)
    * [func TestEscapeSet(t *testing.T)](#TestEscapeSet)
    * [func TestErrors(t *testing.T)](#TestErrors)
    * [func TestEscapeText(t *testing.T)](#TestEscapeText)
    * [func TestEnsurePipelineContains(t *testing.T)](#TestEnsurePipelineContains)
    * [func TestEscapeMalformedPipelines(t *testing.T)](#TestEscapeMalformedPipelines)
    * [func TestEscapeErrorsNotIgnorable(t *testing.T)](#TestEscapeErrorsNotIgnorable)
    * [func TestEscapeSetErrorsNotIgnorable(t *testing.T)](#TestEscapeSetErrorsNotIgnorable)
    * [func TestRedundantFuncs(t *testing.T)](#TestRedundantFuncs)
    * [func TestIndirectPrint(t *testing.T)](#TestIndirectPrint)
    * [func TestEmptyTemplateHTML(t *testing.T)](#TestEmptyTemplateHTML)
    * [func TestPipeToMethodIsEscaped(t *testing.T)](#TestPipeToMethodIsEscaped)
    * [func TestErrorOnUndefined(t *testing.T)](#TestErrorOnUndefined)
    * [func TestIdempotentExecute(t *testing.T)](#TestIdempotentExecute)
    * [func BenchmarkEscapedExecute(b *testing.B)](#BenchmarkEscapedExecute)
    * [func TestOrphanedTemplate(t *testing.T)](#TestOrphanedTemplate)
    * [func TestAliasedParseTreeDoesNotOverescape(t *testing.T)](#TestAliasedParseTreeDoesNotOverescape)
    * [func newInt(n int) *int](#newInt)
    * [func newString(s string) *string](#newString)
    * [func newIntSlice(n ...int) *[]int](#newIntSlice)
    * [func typeOf(arg interface{}) string](#typeOf)
    * [func zeroArgs() string](#zeroArgs)
    * [func oneArg(a string) string](#oneArg)
    * [func twoArgs(a, b string) string](#twoArgs)
    * [func dddArg(a int, b ...string) string](#dddArg)
    * [func count(n int) chan string](#count)
    * [func vfunc(V, *V) string](#vfunc)
    * [func valueString(v string) string](#valueString)
    * [func returnInt() int](#returnInt)
    * [func add(args ...int) int](#add)
    * [func echo(arg interface{}) interface{}](#echo)
    * [func makemap(arg ...string) map[string]string](#makemap)
    * [func stringer(s fmt.Stringer) string](#stringer)
    * [func mapOfThree() interface{}](#mapOfThree)
    * [func testExecute(execTests []execTest, template *Template, t *testing.T)](#testExecute)
    * [func TestExecute(t *testing.T)](#TestExecute)
    * [func TestDelims(t *testing.T)](#TestDelims)
    * [func TestExecuteError(t *testing.T)](#TestExecuteError)
    * [func TestExecError(t *testing.T)](#TestExecError)
    * [func TestJSEscaping(t *testing.T)](#TestJSEscaping)
    * [func TestTree(t *testing.T)](#TestTree)
    * [func TestExecuteOnNewTemplate(t *testing.T)](#TestExecuteOnNewTemplate)
    * [func TestMessageForExecuteEmpty(t *testing.T)](#TestMessageForExecuteEmpty)
    * [func TestFinalForPrintf(t *testing.T)](#TestFinalForPrintf)
    * [func TestComparison(t *testing.T)](#TestComparison)
    * [func TestMissingMapKey(t *testing.T)](#TestMissingMapKey)
    * [func TestUnterminatedStringError(t *testing.T)](#TestUnterminatedStringError)
    * [func TestExecuteGivesExecError(t *testing.T)](#TestExecuteGivesExecError)
    * [func funcNameTestFunc() int](#funcNameTestFunc)
    * [func TestGoodFuncNames(t *testing.T)](#TestGoodFuncNames)
    * [func TestBadFuncNames(t *testing.T)](#TestBadFuncNames)
    * [func testBadFuncName(name string, t *testing.T)](#testBadFuncName)
    * [func TestBlock(t *testing.T)](#TestBlock)
    * [func TestEvalFieldErrors(t *testing.T)](#TestEvalFieldErrors)
    * [func TestMaxExecDepth(t *testing.T)](#TestMaxExecDepth)
    * [func TestAddrOfIndex(t *testing.T)](#TestAddrOfIndex)
    * [func TestInterfaceValues(t *testing.T)](#TestInterfaceValues)
    * [func TestExecutePanicDuringCall(t *testing.T)](#TestExecutePanicDuringCall)
    * [func TestIssue31810(t *testing.T)](#TestIssue31810)
    * [func TestEscapeRace(t *testing.T)](#TestEscapeRace)
    * [func TestRecursiveExecute(t *testing.T)](#TestRecursiveExecute)
    * [func TestRecursiveExecuteViaMethod(t *testing.T)](#TestRecursiveExecuteViaMethod)
    * [func TestTemplateFuncsAfterClone(t *testing.T)](#TestTemplateFuncsAfterClone)
    * [func TestHTMLNospaceEscaper(t *testing.T)](#TestHTMLNospaceEscaper)
    * [func TestStripTags(t *testing.T)](#TestStripTags)
    * [func BenchmarkHTMLNospaceEscaper(b *testing.B)](#BenchmarkHTMLNospaceEscaper)
    * [func BenchmarkHTMLNospaceEscaperNoSpecials(b *testing.B)](#BenchmarkHTMLNospaceEscaperNoSpecials)
    * [func BenchmarkStripTags(b *testing.B)](#BenchmarkStripTags)
    * [func BenchmarkStripTagsNoSpecials(b *testing.B)](#BenchmarkStripTagsNoSpecials)
    * [func TestNextJsCtx(t *testing.T)](#TestNextJsCtx)
    * [func TestJSValEscaper(t *testing.T)](#TestJSValEscaper)
    * [func TestJSStrEscaper(t *testing.T)](#TestJSStrEscaper)
    * [func TestJSRegexpEscaper(t *testing.T)](#TestJSRegexpEscaper)
    * [func TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T)](#TestEscapersOnLower7AndSelectHighCodepoints)
    * [func TestIsJsMimeType(t *testing.T)](#TestIsJsMimeType)
    * [func BenchmarkJSValEscaperWithNum(b *testing.B)](#BenchmarkJSValEscaperWithNum)
    * [func BenchmarkJSValEscaperWithStr(b *testing.B)](#BenchmarkJSValEscaperWithStr)
    * [func BenchmarkJSValEscaperWithStrNoSpecials(b *testing.B)](#BenchmarkJSValEscaperWithStrNoSpecials)
    * [func BenchmarkJSValEscaperWithObj(b *testing.B)](#BenchmarkJSValEscaperWithObj)
    * [func BenchmarkJSValEscaperWithObjNoSpecials(b *testing.B)](#BenchmarkJSValEscaperWithObjNoSpecials)
    * [func BenchmarkJSStrEscaperNoSpecials(b *testing.B)](#BenchmarkJSStrEscaperNoSpecials)
    * [func BenchmarkJSStrEscaper(b *testing.B)](#BenchmarkJSStrEscaper)
    * [func BenchmarkJSRegexpEscaperNoSpecials(b *testing.B)](#BenchmarkJSRegexpEscaperNoSpecials)
    * [func BenchmarkJSRegexpEscaper(b *testing.B)](#BenchmarkJSRegexpEscaper)
    * [func TestMultiExecute(t *testing.T)](#TestMultiExecute)
    * [func TestParseFiles(t *testing.T)](#TestParseFiles)
    * [func TestParseGlob(t *testing.T)](#TestParseGlob)
    * [func TestParseFS(t *testing.T)](#TestParseFS)
    * [func TestParseFilesWithData(t *testing.T)](#TestParseFilesWithData)
    * [func TestParseGlobWithData(t *testing.T)](#TestParseGlobWithData)
    * [func TestParseZipFS(t *testing.T)](#TestParseZipFS)
    * [func TestAddParseTreeToUnparsedTemplate(t *testing.T)](#TestAddParseTreeToUnparsedTemplate)
    * [func TestRedefinition(t *testing.T)](#TestRedefinition)
    * [func TestEmptyTemplateCloneCrash(t *testing.T)](#TestEmptyTemplateCloneCrash)
    * [func TestTemplateLookUp(t *testing.T)](#TestTemplateLookUp)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestEmptyTemplate(t *testing.T)](#TestEmptyTemplate)
    * [func TestIssue19294(t *testing.T)](#TestIssue19294)
    * [func TestFindEndTag(t *testing.T)](#TestFindEndTag)
    * [func BenchmarkTemplateSpecialTags(b *testing.B)](#BenchmarkTemplateSpecialTags)
    * [func TestURLNormalizer(t *testing.T)](#TestURLNormalizer)
    * [func TestURLFilters(t *testing.T)](#TestURLFilters)
    * [func TestSrcsetFilter(t *testing.T)](#TestSrcsetFilter)
    * [func BenchmarkURLEscaper(b *testing.B)](#BenchmarkURLEscaper)
    * [func BenchmarkURLEscaperNoSpecials(b *testing.B)](#BenchmarkURLEscaperNoSpecials)
    * [func BenchmarkURLNormalizer(b *testing.B)](#BenchmarkURLNormalizer)
    * [func BenchmarkURLNormalizerNoSpecials(b *testing.B)](#BenchmarkURLNormalizerNoSpecials)
    * [func BenchmarkSrcsetFilter(b *testing.B)](#BenchmarkSrcsetFilter)
    * [func BenchmarkSrcsetFilterNoSpecials(b *testing.B)](#BenchmarkSrcsetFilterNoSpecials)


## <a id="const" href="#const">Constants</a>

### <a id="_attr_name" href="#_attr_name">const _attr_name</a>

```
searchKey: template._attr_name
tags: [private]
```

```Go
const _attr_name = "attrNoneattrScriptattrScriptTypeattrStyleattrURLattrSrcset"
```

### <a id="contentTypePlain" href="#contentTypePlain">const contentTypePlain</a>

```
searchKey: template.contentTypePlain
tags: [private]
```

```Go
const contentTypePlain contentType = iota
```

### <a id="contentTypeCSS" href="#contentTypeCSS">const contentTypeCSS</a>

```
searchKey: template.contentTypeCSS
tags: [private]
```

```Go
const contentTypeCSS
```

### <a id="contentTypeHTML" href="#contentTypeHTML">const contentTypeHTML</a>

```
searchKey: template.contentTypeHTML
tags: [private]
```

```Go
const contentTypeHTML
```

### <a id="contentTypeHTMLAttr" href="#contentTypeHTMLAttr">const contentTypeHTMLAttr</a>

```
searchKey: template.contentTypeHTMLAttr
tags: [private]
```

```Go
const contentTypeHTMLAttr
```

### <a id="contentTypeJS" href="#contentTypeJS">const contentTypeJS</a>

```
searchKey: template.contentTypeJS
tags: [private]
```

```Go
const contentTypeJS
```

### <a id="contentTypeJSStr" href="#contentTypeJSStr">const contentTypeJSStr</a>

```
searchKey: template.contentTypeJSStr
tags: [private]
```

```Go
const contentTypeJSStr
```

### <a id="contentTypeURL" href="#contentTypeURL">const contentTypeURL</a>

```
searchKey: template.contentTypeURL
tags: [private]
```

```Go
const contentTypeURL
```

### <a id="contentTypeSrcset" href="#contentTypeSrcset">const contentTypeSrcset</a>

```
searchKey: template.contentTypeSrcset
tags: [private]
```

```Go
const contentTypeSrcset
```

### <a id="contentTypeUnsafe" href="#contentTypeUnsafe">const contentTypeUnsafe</a>

```
searchKey: template.contentTypeUnsafe
tags: [private]
```

```Go
const contentTypeUnsafe
```

contentTypeUnsafe is used in attr.go for values that affect how embedded content and network messages are formed, vetted, or interpreted; or which credentials network messages carry. 

### <a id="stateText" href="#stateText">const stateText</a>

```
searchKey: template.stateText
tags: [private]
```

```Go
const stateText state = iota
```

stateText is parsed character data. An HTML parser is in this state when its parse position is outside an HTML tag, directive, comment, and special element body. 

### <a id="stateTag" href="#stateTag">const stateTag</a>

```
searchKey: template.stateTag
tags: [private]
```

```Go
const stateTag
```

stateTag occurs before an HTML attribute or the end of a tag. 

### <a id="stateAttrName" href="#stateAttrName">const stateAttrName</a>

```
searchKey: template.stateAttrName
tags: [private]
```

```Go
const stateAttrName
```

stateAttrName occurs inside an attribute name. It occurs between the ^'s in ` ^name^ = value`. 

### <a id="stateAfterName" href="#stateAfterName">const stateAfterName</a>

```
searchKey: template.stateAfterName
tags: [private]
```

```Go
const stateAfterName
```

stateAfterName occurs after an attr name has ended but before any equals sign. It occurs between the ^'s in ` name^ ^= value`. 

### <a id="stateBeforeValue" href="#stateBeforeValue">const stateBeforeValue</a>

```
searchKey: template.stateBeforeValue
tags: [private]
```

```Go
const stateBeforeValue
```

stateBeforeValue occurs after the equals sign but before the value. It occurs between the ^'s in ` name =^ ^value`. 

### <a id="stateHTMLCmt" href="#stateHTMLCmt">const stateHTMLCmt</a>

```
searchKey: template.stateHTMLCmt
tags: [private]
```

```Go
const stateHTMLCmt
```

stateHTMLCmt occurs inside an <!-- HTML comment -->. 

### <a id="stateRCDATA" href="#stateRCDATA">const stateRCDATA</a>

```
searchKey: template.stateRCDATA
tags: [private]
```

```Go
const stateRCDATA
```

stateRCDATA occurs inside an RCDATA element (<textarea> or <title>) as described at [https://www.w3.org/TR/html5/syntax.html#elements-0](https://www.w3.org/TR/html5/syntax.html#elements-0) 

### <a id="stateAttr" href="#stateAttr">const stateAttr</a>

```
searchKey: template.stateAttr
tags: [private]
```

```Go
const stateAttr
```

stateAttr occurs inside an HTML attribute whose content is text. 

### <a id="stateURL" href="#stateURL">const stateURL</a>

```
searchKey: template.stateURL
tags: [private]
```

```Go
const stateURL
```

stateURL occurs inside an HTML attribute whose content is a URL. 

### <a id="stateSrcset" href="#stateSrcset">const stateSrcset</a>

```
searchKey: template.stateSrcset
tags: [private]
```

```Go
const stateSrcset
```

stateSrcset occurs inside an HTML srcset attribute. 

### <a id="stateJS" href="#stateJS">const stateJS</a>

```
searchKey: template.stateJS
tags: [private]
```

```Go
const stateJS
```

stateJS occurs inside an event handler or script element. 

### <a id="stateJSDqStr" href="#stateJSDqStr">const stateJSDqStr</a>

```
searchKey: template.stateJSDqStr
tags: [private]
```

```Go
const stateJSDqStr
```

stateJSDqStr occurs inside a JavaScript double quoted string. 

### <a id="stateJSSqStr" href="#stateJSSqStr">const stateJSSqStr</a>

```
searchKey: template.stateJSSqStr
tags: [private]
```

```Go
const stateJSSqStr
```

stateJSSqStr occurs inside a JavaScript single quoted string. 

### <a id="stateJSRegexp" href="#stateJSRegexp">const stateJSRegexp</a>

```
searchKey: template.stateJSRegexp
tags: [private]
```

```Go
const stateJSRegexp
```

stateJSRegexp occurs inside a JavaScript regexp literal. 

### <a id="stateJSBlockCmt" href="#stateJSBlockCmt">const stateJSBlockCmt</a>

```
searchKey: template.stateJSBlockCmt
tags: [private]
```

```Go
const stateJSBlockCmt
```

stateJSBlockCmt occurs inside a JavaScript /* block comment */. 

### <a id="stateJSLineCmt" href="#stateJSLineCmt">const stateJSLineCmt</a>

```
searchKey: template.stateJSLineCmt
tags: [private]
```

```Go
const stateJSLineCmt
```

stateJSLineCmt occurs inside a JavaScript // line comment. 

### <a id="stateCSS" href="#stateCSS">const stateCSS</a>

```
searchKey: template.stateCSS
tags: [private]
```

```Go
const stateCSS
```

stateCSS occurs inside a <style> element or style attribute. 

### <a id="stateCSSDqStr" href="#stateCSSDqStr">const stateCSSDqStr</a>

```
searchKey: template.stateCSSDqStr
tags: [private]
```

```Go
const stateCSSDqStr
```

stateCSSDqStr occurs inside a CSS double quoted string. 

### <a id="stateCSSSqStr" href="#stateCSSSqStr">const stateCSSSqStr</a>

```
searchKey: template.stateCSSSqStr
tags: [private]
```

```Go
const stateCSSSqStr
```

stateCSSSqStr occurs inside a CSS single quoted string. 

### <a id="stateCSSDqURL" href="#stateCSSDqURL">const stateCSSDqURL</a>

```
searchKey: template.stateCSSDqURL
tags: [private]
```

```Go
const stateCSSDqURL
```

stateCSSDqURL occurs inside a CSS double quoted url("..."). 

### <a id="stateCSSSqURL" href="#stateCSSSqURL">const stateCSSSqURL</a>

```
searchKey: template.stateCSSSqURL
tags: [private]
```

```Go
const stateCSSSqURL
```

stateCSSSqURL occurs inside a CSS single quoted url('...'). 

### <a id="stateCSSURL" href="#stateCSSURL">const stateCSSURL</a>

```
searchKey: template.stateCSSURL
tags: [private]
```

```Go
const stateCSSURL
```

stateCSSURL occurs inside a CSS unquoted url(...). 

### <a id="stateCSSBlockCmt" href="#stateCSSBlockCmt">const stateCSSBlockCmt</a>

```
searchKey: template.stateCSSBlockCmt
tags: [private]
```

```Go
const stateCSSBlockCmt
```

stateCSSBlockCmt occurs inside a CSS /* block comment */. 

### <a id="stateCSSLineCmt" href="#stateCSSLineCmt">const stateCSSLineCmt</a>

```
searchKey: template.stateCSSLineCmt
tags: [private]
```

```Go
const stateCSSLineCmt
```

stateCSSLineCmt occurs inside a CSS // line comment. 

### <a id="stateError" href="#stateError">const stateError</a>

```
searchKey: template.stateError
tags: [private]
```

```Go
const stateError
```

stateError is an infectious error state outside any valid HTML/CSS/JS construct. 

### <a id="delimNone" href="#delimNone">const delimNone</a>

```
searchKey: template.delimNone
tags: [private]
```

```Go
const delimNone delim = iota
```

delimNone occurs outside any attribute. 

### <a id="delimDoubleQuote" href="#delimDoubleQuote">const delimDoubleQuote</a>

```
searchKey: template.delimDoubleQuote
tags: [private]
```

```Go
const delimDoubleQuote
```

delimDoubleQuote occurs when a double quote (") closes the attribute. 

### <a id="delimSingleQuote" href="#delimSingleQuote">const delimSingleQuote</a>

```
searchKey: template.delimSingleQuote
tags: [private]
```

```Go
const delimSingleQuote
```

delimSingleQuote occurs when a single quote (') closes the attribute. 

### <a id="delimSpaceOrTagEnd" href="#delimSpaceOrTagEnd">const delimSpaceOrTagEnd</a>

```
searchKey: template.delimSpaceOrTagEnd
tags: [private]
```

```Go
const delimSpaceOrTagEnd
```

delimSpaceOrTagEnd occurs when a space or right angle bracket (>) closes the attribute. 

### <a id="urlPartNone" href="#urlPartNone">const urlPartNone</a>

```
searchKey: template.urlPartNone
tags: [private]
```

```Go
const urlPartNone urlPart = iota
```

urlPartNone occurs when not in a URL, or possibly at the start: ^ in "^[http://auth/path?k=v#frag](http://auth/path?k=v#frag)". 

### <a id="urlPartPreQuery" href="#urlPartPreQuery">const urlPartPreQuery</a>

```
searchKey: template.urlPartPreQuery
tags: [private]
```

```Go
const urlPartPreQuery
```

urlPartPreQuery occurs in the scheme, authority, or path; between the ^s in "h^ttp://auth/path^?k=v#frag". 

### <a id="urlPartQueryOrFrag" href="#urlPartQueryOrFrag">const urlPartQueryOrFrag</a>

```
searchKey: template.urlPartQueryOrFrag
tags: [private]
```

```Go
const urlPartQueryOrFrag
```

urlPartQueryOrFrag occurs in the query portion between the ^s in "[http://auth/path?](http://auth/path?)^k=v#frag^". 

### <a id="urlPartUnknown" href="#urlPartUnknown">const urlPartUnknown</a>

```
searchKey: template.urlPartUnknown
tags: [private]
```

```Go
const urlPartUnknown
```

urlPartUnknown occurs due to joining of contexts both before and after the query separator. 

### <a id="jsCtxRegexp" href="#jsCtxRegexp">const jsCtxRegexp</a>

```
searchKey: template.jsCtxRegexp
tags: [private]
```

```Go
const jsCtxRegexp jsCtx = iota
```

jsCtxRegexp occurs where a '/' would start a regexp literal. 

### <a id="jsCtxDivOp" href="#jsCtxDivOp">const jsCtxDivOp</a>

```
searchKey: template.jsCtxDivOp
tags: [private]
```

```Go
const jsCtxDivOp
```

jsCtxDivOp occurs where a '/' would start a division operator. 

### <a id="jsCtxUnknown" href="#jsCtxUnknown">const jsCtxUnknown</a>

```
searchKey: template.jsCtxUnknown
tags: [private]
```

```Go
const jsCtxUnknown
```

jsCtxUnknown occurs where a '/' is ambiguous due to context joining. 

### <a id="elementNone" href="#elementNone">const elementNone</a>

```
searchKey: template.elementNone
tags: [private]
```

```Go
const elementNone element = iota
```

elementNone occurs outside a special tag or special element body. 

### <a id="elementScript" href="#elementScript">const elementScript</a>

```
searchKey: template.elementScript
tags: [private]
```

```Go
const elementScript
```

elementScript corresponds to the raw text <script> element with JS MIME type or no type attribute. 

### <a id="elementStyle" href="#elementStyle">const elementStyle</a>

```
searchKey: template.elementStyle
tags: [private]
```

```Go
const elementStyle
```

elementStyle corresponds to the raw text <style> element. 

### <a id="elementTextarea" href="#elementTextarea">const elementTextarea</a>

```
searchKey: template.elementTextarea
tags: [private]
```

```Go
const elementTextarea
```

elementTextarea corresponds to the RCDATA <textarea> element. 

### <a id="elementTitle" href="#elementTitle">const elementTitle</a>

```
searchKey: template.elementTitle
tags: [private]
```

```Go
const elementTitle
```

elementTitle corresponds to the RCDATA <title> element. 

### <a id="attrNone" href="#attrNone">const attrNone</a>

```
searchKey: template.attrNone
tags: [private]
```

```Go
const attrNone attr = iota
```

attrNone corresponds to a normal attribute or no attribute. 

### <a id="attrScript" href="#attrScript">const attrScript</a>

```
searchKey: template.attrScript
tags: [private]
```

```Go
const attrScript
```

attrScript corresponds to an event handler attribute. 

### <a id="attrScriptType" href="#attrScriptType">const attrScriptType</a>

```
searchKey: template.attrScriptType
tags: [private]
```

```Go
const attrScriptType
```

attrScriptType corresponds to the type attribute in script HTML element 

### <a id="attrStyle" href="#attrStyle">const attrStyle</a>

```
searchKey: template.attrStyle
tags: [private]
```

```Go
const attrStyle
```

attrStyle corresponds to the style attribute whose value is CSS. 

### <a id="attrURL" href="#attrURL">const attrURL</a>

```
searchKey: template.attrURL
tags: [private]
```

```Go
const attrURL
```

attrURL corresponds to an attribute whose value is a URL. 

### <a id="attrSrcset" href="#attrSrcset">const attrSrcset</a>

```
searchKey: template.attrSrcset
tags: [private]
```

```Go
const attrSrcset
```

attrSrcset corresponds to a srcset attribute. 

### <a id="_delim_name" href="#_delim_name">const _delim_name</a>

```
searchKey: template._delim_name
tags: [private]
```

```Go
const _delim_name = "delimNonedelimDoubleQuotedelimSingleQuotedelimSpaceOrTagEnd"
```

### <a id="_element_name" href="#_element_name">const _element_name</a>

```
searchKey: template._element_name
tags: [private]
```

```Go
const _element_name = "elementNoneelementScriptelementStyleelementTextareaelementTitle"
```

### <a id="OK" href="#OK">const OK</a>

```
searchKey: template.OK
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

### <a id="ErrAmbigContext" href="#ErrAmbigContext">const ErrAmbigContext</a>

```
searchKey: template.ErrAmbigContext
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
### <a id="ErrRangeLoopReentry" href="#ErrRangeLoopReentry">const ErrRangeLoopReentry</a>

```
searchKey: template.ErrRangeLoopReentry
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
### <a id="ErrPredefinedEscaper" href="#ErrPredefinedEscaper">const ErrPredefinedEscaper</a>

```
searchKey: template.ErrPredefinedEscaper
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
### <a id="filterFailsafe" href="#filterFailsafe">const filterFailsafe</a>

```
searchKey: template.filterFailsafe
tags: [private]
```

```Go
const filterFailsafe = "ZgotmplZ"
```

filterFailsafe is an innocuous word that is emitted in place of unsafe values by sanitizer functions. It is not a keyword in any programming language, contains no special characters, is not empty, and when it appears in output it is distinct enough that a developer can find the source of the problem via a search engine. 

### <a id="_jsCtx_name" href="#_jsCtx_name">const _jsCtx_name</a>

```
searchKey: template._jsCtx_name
tags: [private]
```

```Go
const _jsCtx_name = "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
```

### <a id="_state_name" href="#_state_name">const _state_name</a>

```
searchKey: template._state_name
tags: [private]
```

```Go
const _state_name = ...
```

### <a id="htmlSpaceAndASCIIAlnumBytes" href="#htmlSpaceAndASCIIAlnumBytes">const htmlSpaceAndASCIIAlnumBytes</a>

```
searchKey: template.htmlSpaceAndASCIIAlnumBytes
tags: [private]
```

```Go
const htmlSpaceAndASCIIAlnumBytes = ...
```

Derived from [https://play.golang.org/p/Dhmj7FORT5](https://play.golang.org/p/Dhmj7FORT5) 

### <a id="_urlPart_name" href="#_urlPart_name">const _urlPart_name</a>

```
searchKey: template._urlPart_name
tags: [private]
```

```Go
const _urlPart_name = "urlPartNoneurlPartPreQueryurlPartQueryOrFragurlPartUnknown"
```

### <a id="execErrorText" href="#execErrorText">const execErrorText</a>

```
searchKey: template.execErrorText
tags: [private]
```

```Go
const execErrorText = ...
```

### <a id="treeTemplate" href="#treeTemplate">const treeTemplate</a>

```
searchKey: template.treeTemplate
tags: [private]
```

```Go
const treeTemplate = ...
```

Use different delimiters to test Set.Delims. Also test the trimming of leading and trailing spaces. 

### <a id="testTemplates" href="#testTemplates">const testTemplates</a>

```
searchKey: template.testTemplates
tags: [private]
```

```Go
const testTemplates = `{{define "one"}}one{{end}}{{define "two"}}two{{end}}`
```

### <a id="alwaysErrorText" href="#alwaysErrorText">const alwaysErrorText</a>

```
searchKey: template.alwaysErrorText
tags: [private]
```

```Go
const alwaysErrorText = "always be failing"
```

### <a id="raceText" href="#raceText">const raceText</a>

```
searchKey: template.raceText
tags: [private]
```

```Go
const raceText = ...
```

### <a id="multiText1" href="#multiText1">const multiText1</a>

```
searchKey: template.multiText1
tags: [private]
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
tags: [private]
```

```Go
const multiText2 = `
	{{define "dot"}}{{.}}{{end}}
	{{define "nested"}}{{template "dot" .}}{{end}}
`
```

### <a id="cloneText1" href="#cloneText1">const cloneText1</a>

```
searchKey: template.cloneText1
tags: [private]
```

```Go
const cloneText1 = `{{define "a"}}{{template "b"}}{{template "c"}}{{end}}`
```

### <a id="cloneText2" href="#cloneText2">const cloneText2</a>

```
searchKey: template.cloneText2
tags: [private]
```

```Go
const cloneText2 = `{{define "b"}}b{{end}}`
```

### <a id="cloneText3" href="#cloneText3">const cloneText3</a>

```
searchKey: template.cloneText3
tags: [private]
```

```Go
const cloneText3 = `{{define "c"}}root{{end}}`
```

### <a id="cloneText4" href="#cloneText4">const cloneText4</a>

```
searchKey: template.cloneText4
tags: [private]
```

```Go
const cloneText4 = `{{define "c"}}clone{{end}}`
```

## <a id="var" href="#var">Variables</a>

### <a id="attrTypeMap" href="#attrTypeMap">var attrTypeMap</a>

```
searchKey: template.attrTypeMap
tags: [private]
```

```Go
var attrTypeMap = ...
```

attrTypeMap[n] describes the value of the given attribute. If an attribute affects (or can mask) the encoding or interpretation of other content, or affects the contents, idempotency, or credentials of a network message, then the value in this map is contentTypeUnsafe. This map is derived from HTML5, specifically [https://www.w3.org/TR/html5/Overview.html#attributes-1](https://www.w3.org/TR/html5/Overview.html#attributes-1) as well as "%URI"-typed attributes from [https://www.w3.org/TR/html4/index/attributes.html](https://www.w3.org/TR/html4/index/attributes.html) 

### <a id="_attr_index" href="#_attr_index">var _attr_index</a>

```
searchKey: template._attr_index
tags: [private]
```

```Go
var _attr_index = [...]uint8{0, 8, 18, 32, 41, 48, 58}
```

### <a id="errorType" href="#errorType">var errorType</a>

```
searchKey: template.errorType
tags: [private]
```

```Go
var errorType = reflect.TypeOf((*error)(nil)).Elem()
```

### <a id="fmtStringerType" href="#fmtStringerType">var fmtStringerType</a>

```
searchKey: template.fmtStringerType
tags: [private]
```

```Go
var fmtStringerType = reflect.TypeOf((*fmt.Stringer)(nil)).Elem()
```

### <a id="cssReplacementTable" href="#cssReplacementTable">var cssReplacementTable</a>

```
searchKey: template.cssReplacementTable
tags: [private]
```

```Go
var cssReplacementTable = ...
```

### <a id="expressionBytes" href="#expressionBytes">var expressionBytes</a>

```
searchKey: template.expressionBytes
tags: [private]
```

```Go
var expressionBytes = []byte("expression")
```

### <a id="mozBindingBytes" href="#mozBindingBytes">var mozBindingBytes</a>

```
searchKey: template.mozBindingBytes
tags: [private]
```

```Go
var mozBindingBytes = []byte("mozbinding")
```

### <a id="_delim_index" href="#_delim_index">var _delim_index</a>

```
searchKey: template._delim_index
tags: [private]
```

```Go
var _delim_index = [...]uint8{0, 9, 25, 41, 59}
```

### <a id="_element_index" href="#_element_index">var _element_index</a>

```
searchKey: template._element_index
tags: [private]
```

```Go
var _element_index = [...]uint8{0, 11, 24, 36, 51, 63}
```

### <a id="funcMap" href="#funcMap">var funcMap</a>

```
searchKey: template.funcMap
tags: [private]
```

```Go
var funcMap = ...
```

funcMap maps command names to functions that render their inputs safe. 

### <a id="predefinedEscapers" href="#predefinedEscapers">var predefinedEscapers</a>

```
searchKey: template.predefinedEscapers
tags: [private]
```

```Go
var predefinedEscapers = map[string]bool{
	"html":     true,
	"urlquery": true,
}
```

predefinedEscapers contains template predefined escapers that are equivalent to some contextual escapers. Keep in sync with equivEscapers. 

### <a id="equivEscapers" href="#equivEscapers">var equivEscapers</a>

```
searchKey: template.equivEscapers
tags: [private]
```

```Go
var equivEscapers = ...
```

equivEscapers matches contextual escapers to equivalent predefined template escapers. 

### <a id="redundantFuncs" href="#redundantFuncs">var redundantFuncs</a>

```
searchKey: template.redundantFuncs
tags: [private]
```

```Go
var redundantFuncs = ...
```

redundantFuncs[a][b] implies that funcMap[b](funcMap[a](x)) == funcMap[a](x) for all x. 

### <a id="delimEnds" href="#delimEnds">var delimEnds</a>

```
searchKey: template.delimEnds
tags: [private]
```

```Go
var delimEnds = ...
```

delimEnds maps each delim to a string of characters that terminate it. 

### <a id="doctypeBytes" href="#doctypeBytes">var doctypeBytes</a>

```
searchKey: template.doctypeBytes
tags: [private]
```

```Go
var doctypeBytes = []byte("<!DOCTYPE")
```

### <a id="htmlReplacementTable" href="#htmlReplacementTable">var htmlReplacementTable</a>

```
searchKey: template.htmlReplacementTable
tags: [private]
```

```Go
var htmlReplacementTable = ...
```

htmlReplacementTable contains the runes that need to be escaped inside a quoted attribute value or in a text node. 

### <a id="htmlNormReplacementTable" href="#htmlNormReplacementTable">var htmlNormReplacementTable</a>

```
searchKey: template.htmlNormReplacementTable
tags: [private]
```

```Go
var htmlNormReplacementTable = ...
```

htmlNormReplacementTable is like htmlReplacementTable but without '&' to avoid over-encoding existing entities. 

### <a id="htmlNospaceReplacementTable" href="#htmlNospaceReplacementTable">var htmlNospaceReplacementTable</a>

```
searchKey: template.htmlNospaceReplacementTable
tags: [private]
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

### <a id="htmlNospaceNormReplacementTable" href="#htmlNospaceNormReplacementTable">var htmlNospaceNormReplacementTable</a>

```
searchKey: template.htmlNospaceNormReplacementTable
tags: [private]
```

```Go
var htmlNospaceNormReplacementTable = ...
```

htmlNospaceNormReplacementTable is like htmlNospaceReplacementTable but without '&' to avoid over-encoding existing entities. 

### <a id="regexpPrecederKeywords" href="#regexpPrecederKeywords">var regexpPrecederKeywords</a>

```
searchKey: template.regexpPrecederKeywords
tags: [private]
```

```Go
var regexpPrecederKeywords = ...
```

regexpPrecederKeywords is a set of reserved JS keywords that can precede a regular expression in JS source. 

### <a id="jsonMarshalType" href="#jsonMarshalType">var jsonMarshalType</a>

```
searchKey: template.jsonMarshalType
tags: [private]
```

```Go
var jsonMarshalType = reflect.TypeOf((*json.Marshaler)(nil)).Elem()
```

### <a id="lowUnicodeReplacementTable" href="#lowUnicodeReplacementTable">var lowUnicodeReplacementTable</a>

```
searchKey: template.lowUnicodeReplacementTable
tags: [private]
```

```Go
var lowUnicodeReplacementTable = ...
```

### <a id="jsStrReplacementTable" href="#jsStrReplacementTable">var jsStrReplacementTable</a>

```
searchKey: template.jsStrReplacementTable
tags: [private]
```

```Go
var jsStrReplacementTable = ...
```

### <a id="jsStrNormReplacementTable" href="#jsStrNormReplacementTable">var jsStrNormReplacementTable</a>

```
searchKey: template.jsStrNormReplacementTable
tags: [private]
```

```Go
var jsStrNormReplacementTable = ...
```

jsStrNormReplacementTable is like jsStrReplacementTable but does not overencode existing escapes since this table has no entry for `\`. 

### <a id="jsRegexpReplacementTable" href="#jsRegexpReplacementTable">var jsRegexpReplacementTable</a>

```
searchKey: template.jsRegexpReplacementTable
tags: [private]
```

```Go
var jsRegexpReplacementTable = ...
```

### <a id="_jsCtx_index" href="#_jsCtx_index">var _jsCtx_index</a>

```
searchKey: template._jsCtx_index
tags: [private]
```

```Go
var _jsCtx_index = [...]uint8{0, 11, 21, 33}
```

### <a id="_state_index" href="#_state_index">var _state_index</a>

```
searchKey: template._state_index
tags: [private]
```

```Go
var _state_index = ...
```

### <a id="escapeOK" href="#escapeOK">var escapeOK</a>

```
searchKey: template.escapeOK
tags: [private]
```

```Go
var escapeOK = fmt.Errorf("template escaped correctly")
```

escapeOK is a sentinel value used to indicate valid escaping. 

### <a id="transitionFunc" href="#transitionFunc">var transitionFunc</a>

```
searchKey: template.transitionFunc
tags: [private]
```

```Go
var transitionFunc = ...
```

transitionFunc is the array of context transition functions for text nodes. A transition function takes a context and template text input, and returns the updated context and the number of bytes consumed from the front of the input. 

### <a id="commentStart" href="#commentStart">var commentStart</a>

```
searchKey: template.commentStart
tags: [private]
```

```Go
var commentStart = []byte("<!--")
```

### <a id="commentEnd" href="#commentEnd">var commentEnd</a>

```
searchKey: template.commentEnd
tags: [private]
```

```Go
var commentEnd = []byte("-->")
```

### <a id="elementContentType" href="#elementContentType">var elementContentType</a>

```
searchKey: template.elementContentType
tags: [private]
```

```Go
var elementContentType = ...
```

### <a id="attrStartStates" href="#attrStartStates">var attrStartStates</a>

```
searchKey: template.attrStartStates
tags: [private]
```

```Go
var attrStartStates = ...
```

### <a id="specialTagEndMarkers" href="#specialTagEndMarkers">var specialTagEndMarkers</a>

```
searchKey: template.specialTagEndMarkers
tags: [private]
```

```Go
var specialTagEndMarkers = ...
```

specialTagEndMarkers maps element types to the character sequence that case-insensitively signals the end of the special tag body. 

### <a id="specialTagEndPrefix" href="#specialTagEndPrefix">var specialTagEndPrefix</a>

```
searchKey: template.specialTagEndPrefix
tags: [private]
```

```Go
var specialTagEndPrefix = []byte("</")
```

### <a id="tagEndSeparators" href="#tagEndSeparators">var tagEndSeparators</a>

```
searchKey: template.tagEndSeparators
tags: [private]
```

```Go
var tagEndSeparators = []byte("> \t\n\f/")
```

### <a id="blockCommentEnd" href="#blockCommentEnd">var blockCommentEnd</a>

```
searchKey: template.blockCommentEnd
tags: [private]
```

```Go
var blockCommentEnd = []byte("*/")
```

### <a id="elementNameMap" href="#elementNameMap">var elementNameMap</a>

```
searchKey: template.elementNameMap
tags: [private]
```

```Go
var elementNameMap = ...
```

### <a id="_urlPart_index" href="#_urlPart_index">var _urlPart_index</a>

```
searchKey: template._urlPart_index
tags: [private]
```

```Go
var _urlPart_index = [...]uint8{0, 11, 26, 44, 58}
```

### <a id="debug" href="#debug">var debug</a>

```
searchKey: template.debug
tags: [private]
```

```Go
var debug = flag.Bool("debug", false, "show the errors produced by the tests")
```

### <a id="siVal" href="#siVal">var siVal</a>

```
searchKey: template.siVal
tags: [private]
```

```Go
var siVal = I(S{"a", "b"})
```

### <a id="tVal" href="#tVal">var tVal</a>

```
searchKey: template.tVal
tags: [private]
```

```Go
var tVal = ...
```

### <a id="tSliceOfNil" href="#tSliceOfNil">var tSliceOfNil</a>

```
searchKey: template.tSliceOfNil
tags: [private]
```

```Go
var tSliceOfNil = []*T{nil}
```

### <a id="iVal" href="#iVal">var iVal</a>

```
searchKey: template.iVal
tags: [private]
```

```Go
var iVal I = tVal
```

### <a id="myError" href="#myError">var myError</a>

```
searchKey: template.myError
tags: [private]
```

```Go
var myError = errors.New("my error")
```

### <a id="bigInt" href="#bigInt">var bigInt</a>

```
searchKey: template.bigInt
tags: [private]
```

```Go
var bigInt = fmt.Sprintf("0x%x", int(1<<uint(reflect.TypeOf(0).Bits()-1)-1))
```

bigInt and bigUint are hex string representing numbers either side of the max int boundary. We do it this way so the test doesn't depend on ints being 32 bits. 

### <a id="bigUint" href="#bigUint">var bigUint</a>

```
searchKey: template.bigUint
tags: [private]
```

```Go
var bigUint = fmt.Sprintf("0x%x", uint(1<<uint(reflect.TypeOf(0).Bits()-1)))
```

bigInt and bigUint are hex string representing numbers either side of the max int boundary. We do it this way so the test doesn't depend on ints being 32 bits. 

### <a id="execTests" href="#execTests">var execTests</a>

```
searchKey: template.execTests
tags: [private]
```

```Go
var execTests = ...
```

### <a id="delimPairs" href="#delimPairs">var delimPairs</a>

```
searchKey: template.delimPairs
tags: [private]
```

```Go
var delimPairs = []string{
	"", "",
	"{{", "}}",
	"|", "|",
	"(日)", "(本)",
}
```

### <a id="cmpTests" href="#cmpTests">var cmpTests</a>

```
searchKey: template.cmpTests
tags: [private]
```

```Go
var cmpTests = ...
```

### <a id="alwaysError" href="#alwaysError">var alwaysError</a>

```
searchKey: template.alwaysError
tags: [private]
```

```Go
var alwaysError = errors.New(alwaysErrorText)
```

### <a id="multiExecTests" href="#multiExecTests">var multiExecTests</a>

```
searchKey: template.multiExecTests
tags: [private]
```

```Go
var multiExecTests = ...
```

### <a id="templateFileExecTests" href="#templateFileExecTests">var templateFileExecTests</a>

```
searchKey: template.templateFileExecTests
tags: [private]
```

```Go
var templateFileExecTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="CSS" href="#CSS">type CSS string</a>

```
searchKey: template.CSS
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

### <a id="HTML" href="#HTML">type HTML string</a>

```
searchKey: template.HTML
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
```

```Go
type HTMLAttr string
```

Strings of content from a trusted source. 

HTMLAttr encapsulates an HTML attribute from a trusted source, for example, ` dir="ltr"`. 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

### <a id="JS" href="#JS">type JS string</a>

```
searchKey: template.JS
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

### <a id="URL" href="#URL">type URL string</a>

```
searchKey: template.URL
```

```Go
type URL string
```

Strings of content from a trusted source. 

URL encapsulates a known safe URL or URL substring (see RFC 3986). A URL like `javascript:checkThatFormNotEditedBeforeLeavingPage()` from a trusted source should go in the page, but by default dynamic `javascript:` URLs are filtered out since they are a frequently exploited injection vector. 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

### <a id="Srcset" href="#Srcset">type Srcset string</a>

```
searchKey: template.Srcset
```

```Go
type Srcset string
```

Strings of content from a trusted source. 

Srcset encapsulates a known safe srcset attribute (see [https://w3c.github.io/html/semantics-embedded-content.html#element-attrdef-img-srcset](https://w3c.github.io/html/semantics-embedded-content.html#element-attrdef-img-srcset)). 

Use of this type presents a security risk: the encapsulated content should come from a trusted source, as it will be included verbatim in the template output. 

### <a id="contentType" href="#contentType">type contentType uint8</a>

```
searchKey: template.contentType
tags: [private]
```

```Go
type contentType uint8
```

#### <a id="attrType" href="#attrType">func attrType(name string) contentType</a>

```
searchKey: template.attrType
tags: [private]
```

```Go
func attrType(name string) contentType
```

attrType returns a conservative (upper-bound on authority) guess at the type of the lowercase named attribute. 

#### <a id="stringify" href="#stringify">func stringify(args ...interface{}) (string, contentType)</a>

```
searchKey: template.stringify
tags: [private]
```

```Go
func stringify(args ...interface{}) (string, contentType)
```

stringify converts its arguments to a string and the type of the content. All pointers are dereferenced, as in the text/template package. 

### <a id="context" href="#context">type context struct</a>

```
searchKey: template.context
tags: [private]
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

#### <a id="nudge" href="#nudge">func nudge(c context) context</a>

```
searchKey: template.nudge
tags: [private]
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

#### <a id="join" href="#join">func join(a, b context, node parse.Node, nodeName string) context</a>

```
searchKey: template.join
tags: [private]
```

```Go
func join(a, b context, node parse.Node, nodeName string) context
```

join joins the two contexts of a branch template node. The result is an error context if either of the input contexts are error contexts, or if the input contexts differ. 

#### <a id="contextAfterText" href="#contextAfterText">func contextAfterText(c context, s []byte) (context, int)</a>

```
searchKey: template.contextAfterText
tags: [private]
```

```Go
func contextAfterText(c context, s []byte) (context, int)
```

contextAfterText starts in context c, consumes some tokens from the front of s, then returns the context after those tokens and the unprocessed suffix. 

#### <a id="tText" href="#tText">func tText(c context, s []byte) (context, int)</a>

```
searchKey: template.tText
tags: [private]
```

```Go
func tText(c context, s []byte) (context, int)
```

tText is the context transition function for the text state. 

#### <a id="tTag" href="#tTag">func tTag(c context, s []byte) (context, int)</a>

```
searchKey: template.tTag
tags: [private]
```

```Go
func tTag(c context, s []byte) (context, int)
```

tTag is the context transition function for the tag state. 

#### <a id="tAttrName" href="#tAttrName">func tAttrName(c context, s []byte) (context, int)</a>

```
searchKey: template.tAttrName
tags: [private]
```

```Go
func tAttrName(c context, s []byte) (context, int)
```

tAttrName is the context transition function for stateAttrName. 

#### <a id="tAfterName" href="#tAfterName">func tAfterName(c context, s []byte) (context, int)</a>

```
searchKey: template.tAfterName
tags: [private]
```

```Go
func tAfterName(c context, s []byte) (context, int)
```

tAfterName is the context transition function for stateAfterName. 

#### <a id="tBeforeValue" href="#tBeforeValue">func tBeforeValue(c context, s []byte) (context, int)</a>

```
searchKey: template.tBeforeValue
tags: [private]
```

```Go
func tBeforeValue(c context, s []byte) (context, int)
```

tBeforeValue is the context transition function for stateBeforeValue. 

#### <a id="tHTMLCmt" href="#tHTMLCmt">func tHTMLCmt(c context, s []byte) (context, int)</a>

```
searchKey: template.tHTMLCmt
tags: [private]
```

```Go
func tHTMLCmt(c context, s []byte) (context, int)
```

tHTMLCmt is the context transition function for stateHTMLCmt. 

#### <a id="tSpecialTagEnd" href="#tSpecialTagEnd">func tSpecialTagEnd(c context, s []byte) (context, int)</a>

```
searchKey: template.tSpecialTagEnd
tags: [private]
```

```Go
func tSpecialTagEnd(c context, s []byte) (context, int)
```

tSpecialTagEnd is the context transition function for raw text and RCDATA element states. 

#### <a id="tAttr" href="#tAttr">func tAttr(c context, s []byte) (context, int)</a>

```
searchKey: template.tAttr
tags: [private]
```

```Go
func tAttr(c context, s []byte) (context, int)
```

tAttr is the context transition function for the attribute state. 

#### <a id="tURL" href="#tURL">func tURL(c context, s []byte) (context, int)</a>

```
searchKey: template.tURL
tags: [private]
```

```Go
func tURL(c context, s []byte) (context, int)
```

tURL is the context transition function for the URL state. 

#### <a id="tJS" href="#tJS">func tJS(c context, s []byte) (context, int)</a>

```
searchKey: template.tJS
tags: [private]
```

```Go
func tJS(c context, s []byte) (context, int)
```

tJS is the context transition function for the JS state. 

#### <a id="tJSDelimited" href="#tJSDelimited">func tJSDelimited(c context, s []byte) (context, int)</a>

```
searchKey: template.tJSDelimited
tags: [private]
```

```Go
func tJSDelimited(c context, s []byte) (context, int)
```

tJSDelimited is the context transition function for the JS string and regexp states. 

#### <a id="tBlockCmt" href="#tBlockCmt">func tBlockCmt(c context, s []byte) (context, int)</a>

```
searchKey: template.tBlockCmt
tags: [private]
```

```Go
func tBlockCmt(c context, s []byte) (context, int)
```

tBlockCmt is the context transition function for /*comment*/ states. 

#### <a id="tLineCmt" href="#tLineCmt">func tLineCmt(c context, s []byte) (context, int)</a>

```
searchKey: template.tLineCmt
tags: [private]
```

```Go
func tLineCmt(c context, s []byte) (context, int)
```

tLineCmt is the context transition function for //comment states. 

#### <a id="tCSS" href="#tCSS">func tCSS(c context, s []byte) (context, int)</a>

```
searchKey: template.tCSS
tags: [private]
```

```Go
func tCSS(c context, s []byte) (context, int)
```

tCSS is the context transition function for the CSS state. 

#### <a id="tCSSStr" href="#tCSSStr">func tCSSStr(c context, s []byte) (context, int)</a>

```
searchKey: template.tCSSStr
tags: [private]
```

```Go
func tCSSStr(c context, s []byte) (context, int)
```

tCSSStr is the context transition function for the CSS string and URL states. 

#### <a id="tError" href="#tError">func tError(c context, s []byte) (context, int)</a>

```
searchKey: template.tError
tags: [private]
```

```Go
func tError(c context, s []byte) (context, int)
```

tError is the context transition function for the error state. 

#### <a id="context.String" href="#context.String">func (c context) String() string</a>

```
searchKey: template.context.String
tags: [private]
```

```Go
func (c context) String() string
```

#### <a id="context.eq" href="#context.eq">func (c context) eq(d context) bool</a>

```
searchKey: template.context.eq
tags: [private]
```

```Go
func (c context) eq(d context) bool
```

eq reports whether two contexts are equal. 

#### <a id="context.mangle" href="#context.mangle">func (c context) mangle(templateName string) string</a>

```
searchKey: template.context.mangle
tags: [private]
```

```Go
func (c context) mangle(templateName string) string
```

mangle produces an identifier that includes a suffix that distinguishes it from template names mangled with different contexts. 

### <a id="state" href="#state">type state uint8</a>

```
searchKey: template.state
tags: [private]
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
tags: [private]
```

```Go
func (i state) String() string
```

### <a id="delim" href="#delim">type delim uint8</a>

```
searchKey: template.delim
tags: [private]
```

```Go
type delim uint8
```

delim is the delimiter that will end the current HTML attribute. 

#### <a id="delim.String" href="#delim.String">func (i delim) String() string</a>

```
searchKey: template.delim.String
tags: [private]
```

```Go
func (i delim) String() string
```

### <a id="urlPart" href="#urlPart">type urlPart uint8</a>

```
searchKey: template.urlPart
tags: [private]
```

```Go
type urlPart uint8
```

urlPart identifies a part in an RFC 3986 hierarchical URL to allow different encoding strategies. 

#### <a id="urlPart.String" href="#urlPart.String">func (i urlPart) String() string</a>

```
searchKey: template.urlPart.String
tags: [private]
```

```Go
func (i urlPart) String() string
```

### <a id="jsCtx" href="#jsCtx">type jsCtx uint8</a>

```
searchKey: template.jsCtx
tags: [private]
```

```Go
type jsCtx uint8
```

jsCtx determines whether a '/' starts a regular expression literal or a division operator. 

#### <a id="nextJSCtx" href="#nextJSCtx">func nextJSCtx(s []byte, preceding jsCtx) jsCtx</a>

```
searchKey: template.nextJSCtx
tags: [private]
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
tags: [private]
```

```Go
func (i jsCtx) String() string
```

### <a id="element" href="#element">type element uint8</a>

```
searchKey: template.element
tags: [private]
```

```Go
type element uint8
```

element identifies the HTML element when inside a start tag or special body. Certain HTML element (for example <script> and <style>) have bodies that are treated differently from stateText so the element type is necessary to transition into the correct context at the end of a tag and to identify the end delimiter for the body. 

#### <a id="eatTagName" href="#eatTagName">func eatTagName(s []byte, i int) (int, element)</a>

```
searchKey: template.eatTagName
tags: [private]
```

```Go
func eatTagName(s []byte, i int) (int, element)
```

eatTagName returns the largest j such that s[i:j] is a tag name and the tag type. 

#### <a id="element.String" href="#element.String">func (i element) String() string</a>

```
searchKey: template.element.String
tags: [private]
```

```Go
func (i element) String() string
```

### <a id="attr" href="#attr">type attr uint8</a>

```
searchKey: template.attr
tags: [private]
```

```Go
type attr uint8
```

attr identifies the current HTML attribute when inside the attribute, that is, starting from stateAttrName until stateTag/stateText (exclusive). 

#### <a id="attr.String" href="#attr.String">func (i attr) String() string</a>

```
searchKey: template.attr.String
tags: [private]
```

```Go
func (i attr) String() string
```

### <a id="Error" href="#Error">type Error struct</a>

```
searchKey: template.Error
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

#### <a id="errorf" href="#errorf">func errorf(k ErrorCode, node parse.Node, line int, f string, args ...interface{}) *Error</a>

```
searchKey: template.errorf
tags: [private]
```

```Go
func errorf(k ErrorCode, node parse.Node, line int, f string, args ...interface{}) *Error
```

errorf creates an error given a format string f and args. The template Name still needs to be supplied. 

#### <a id="eatAttrName" href="#eatAttrName">func eatAttrName(s []byte, i int) (int, *Error)</a>

```
searchKey: template.eatAttrName
tags: [private]
```

```Go
func eatAttrName(s []byte, i int) (int, *Error)
```

eatAttrName returns the largest j such that s[i:j] is an attribute name. It returns an error if s[i:] does not look like it begins with an attribute name, such as encountering a quote mark without a preceding equals sign. 

#### <a id="Error.Error" href="#Error.Error">func (e *Error) Error() string</a>

```
searchKey: template.Error.Error
```

```Go
func (e *Error) Error() string
```

### <a id="ErrorCode" href="#ErrorCode">type ErrorCode int</a>

```
searchKey: template.ErrorCode
```

```Go
type ErrorCode int
```

ErrorCode is a code for a kind of error. 

### <a id="escaper" href="#escaper">type escaper struct</a>

```
searchKey: template.escaper
tags: [private]
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
tags: [private]
```

```Go
func makeEscaper(n *nameSpace) escaper
```

makeEscaper creates a blank escaper for the given set. 

#### <a id="escaper.escape" href="#escaper.escape">func (e *escaper) escape(c context, n parse.Node) context</a>

```
searchKey: template.escaper.escape
tags: [private]
```

```Go
func (e *escaper) escape(c context, n parse.Node) context
```

escape escapes a template node. 

#### <a id="escaper.escapeAction" href="#escaper.escapeAction">func (e *escaper) escapeAction(c context, n *parse.ActionNode) context</a>

```
searchKey: template.escaper.escapeAction
tags: [private]
```

```Go
func (e *escaper) escapeAction(c context, n *parse.ActionNode) context
```

escapeAction escapes an action template node. 

#### <a id="escaper.escapeBranch" href="#escaper.escapeBranch">func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string) context</a>

```
searchKey: template.escaper.escapeBranch
tags: [private]
```

```Go
func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string) context
```

escapeBranch escapes a branch template node: "if", "range" and "with". 

#### <a id="escaper.escapeList" href="#escaper.escapeList">func (e *escaper) escapeList(c context, n *parse.ListNode) context</a>

```
searchKey: template.escaper.escapeList
tags: [private]
```

```Go
func (e *escaper) escapeList(c context, n *parse.ListNode) context
```

escapeList escapes a list template node. 

#### <a id="escaper.escapeListConditionally" href="#escaper.escapeListConditionally">func (e *escaper) escapeListConditionally(c context, n *parse.ListNode, filter func(*escaper, context) bool) (context, bool)</a>

```
searchKey: template.escaper.escapeListConditionally
tags: [private]
```

```Go
func (e *escaper) escapeListConditionally(c context, n *parse.ListNode, filter func(*escaper, context) bool) (context, bool)
```

escapeListConditionally escapes a list node but only preserves edits and inferences in e if the inferences and output context satisfy filter. It returns the best guess at an output context, and the result of the filter which is the same as whether e was updated. 

#### <a id="escaper.escapeTemplate" href="#escaper.escapeTemplate">func (e *escaper) escapeTemplate(c context, n *parse.TemplateNode) context</a>

```
searchKey: template.escaper.escapeTemplate
tags: [private]
```

```Go
func (e *escaper) escapeTemplate(c context, n *parse.TemplateNode) context
```

escapeTemplate escapes a {{template}} call node. 

#### <a id="escaper.escapeTree" href="#escaper.escapeTree">func (e *escaper) escapeTree(c context, node parse.Node, name string, line int) (context, string)</a>

```
searchKey: template.escaper.escapeTree
tags: [private]
```

```Go
func (e *escaper) escapeTree(c context, node parse.Node, name string, line int) (context, string)
```

escapeTree escapes the named template starting in the given context as necessary and returns its output context. 

#### <a id="escaper.computeOutCtx" href="#escaper.computeOutCtx">func (e *escaper) computeOutCtx(c context, t *template.Template) context</a>

```
searchKey: template.escaper.computeOutCtx
tags: [private]
```

```Go
func (e *escaper) computeOutCtx(c context, t *template.Template) context
```

computeOutCtx takes a template and its start context and computes the output context while storing any inferences in e. 

#### <a id="escaper.escapeTemplateBody" href="#escaper.escapeTemplateBody">func (e *escaper) escapeTemplateBody(c context, t *template.Template) (context, bool)</a>

```
searchKey: template.escaper.escapeTemplateBody
tags: [private]
```

```Go
func (e *escaper) escapeTemplateBody(c context, t *template.Template) (context, bool)
```

escapeTemplateBody escapes the given template assuming the given output context, and returns the best guess at the output context and whether the assumption was correct. 

#### <a id="escaper.escapeText" href="#escaper.escapeText">func (e *escaper) escapeText(c context, n *parse.TextNode) context</a>

```
searchKey: template.escaper.escapeText
tags: [private]
```

```Go
func (e *escaper) escapeText(c context, n *parse.TextNode) context
```

escapeText escapes a text template node. 

#### <a id="escaper.editActionNode" href="#escaper.editActionNode">func (e *escaper) editActionNode(n *parse.ActionNode, cmds []string)</a>

```
searchKey: template.escaper.editActionNode
tags: [private]
```

```Go
func (e *escaper) editActionNode(n *parse.ActionNode, cmds []string)
```

editActionNode records a change to an action pipeline for later commit. 

#### <a id="escaper.editTemplateNode" href="#escaper.editTemplateNode">func (e *escaper) editTemplateNode(n *parse.TemplateNode, callee string)</a>

```
searchKey: template.escaper.editTemplateNode
tags: [private]
```

```Go
func (e *escaper) editTemplateNode(n *parse.TemplateNode, callee string)
```

editTemplateNode records a change to a {{template}} callee for later commit. 

#### <a id="escaper.editTextNode" href="#escaper.editTextNode">func (e *escaper) editTextNode(n *parse.TextNode, text []byte)</a>

```
searchKey: template.escaper.editTextNode
tags: [private]
```

```Go
func (e *escaper) editTextNode(n *parse.TextNode, text []byte)
```

editTextNode records a change to a text node for later commit. 

#### <a id="escaper.commit" href="#escaper.commit">func (e *escaper) commit()</a>

```
searchKey: template.escaper.commit
tags: [private]
```

```Go
func (e *escaper) commit()
```

commit applies changes to actions and template calls needed to contextually autoescape content and adds any derived templates to the set. 

#### <a id="escaper.template" href="#escaper.template">func (e *escaper) template(name string) *template.Template</a>

```
searchKey: template.escaper.template
tags: [private]
```

```Go
func (e *escaper) template(name string) *template.Template
```

template returns the named template given a mangled template name. 

#### <a id="escaper.arbitraryTemplate" href="#escaper.arbitraryTemplate">func (e *escaper) arbitraryTemplate() *Template</a>

```
searchKey: template.escaper.arbitraryTemplate
tags: [private]
```

```Go
func (e *escaper) arbitraryTemplate() *Template
```

arbitraryTemplate returns an arbitrary template from the name space associated with e and panics if no templates are found. 

### <a id="Template" href="#Template">type Template struct</a>

```
searchKey: template.Template
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

#### <a id="New" href="#New">func New(name string) *Template</a>

```
searchKey: template.New
```

```Go
func New(name string) *Template
```

New allocates a new HTML template with the given name. 

#### <a id="Must" href="#Must">func Must(t *Template, err error) *Template</a>

```
searchKey: template.Must
```

```Go
func Must(t *Template, err error) *Template
```

Must is a helper that wraps a call to a function returning (*Template, error) and panics if the error is non-nil. It is intended for use in variable initializations such as 

```
var t = template.Must(template.New("name").Parse("html"))

```
#### <a id="ParseFiles" href="#ParseFiles">func ParseFiles(filenames ...string) (*Template, error)</a>

```
searchKey: template.ParseFiles
```

```Go
func ParseFiles(filenames ...string) (*Template, error)
```

ParseFiles creates a new Template and parses the template definitions from the named files. The returned template's name will have the (base) name and (parsed) contents of the first file. There must be at least one file. If an error occurs, parsing stops and the returned *Template is nil. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. For instance, ParseFiles("a/foo", "b/foo") stores "b/foo" as the template named "foo", while "a/foo" is unavailable. 

#### <a id="parseFiles" href="#parseFiles">func parseFiles(t *Template, readFile func(string) (string, []byte, error), filenames ...string) (*Template, error)</a>

```
searchKey: template.parseFiles
tags: [private]
```

```Go
func parseFiles(t *Template, readFile func(string) (string, []byte, error), filenames ...string) (*Template, error)
```

parseFiles is the helper for the method and function. If the argument template is nil, it is created from the first file. 

#### <a id="ParseGlob" href="#ParseGlob">func ParseGlob(pattern string) (*Template, error)</a>

```
searchKey: template.ParseGlob
```

```Go
func ParseGlob(pattern string) (*Template, error)
```

ParseGlob creates a new Template and parses the template definitions from the files identified by the pattern. The files are matched according to the semantics of filepath.Match, and the pattern must match at least one file. The returned template will have the (base) name and (parsed) contents of the first file matched by the pattern. ParseGlob is equivalent to calling ParseFiles with the list of files matched by the pattern. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. 

#### <a id="parseGlob" href="#parseGlob">func parseGlob(t *Template, pattern string) (*Template, error)</a>

```
searchKey: template.parseGlob
tags: [private]
```

```Go
func parseGlob(t *Template, pattern string) (*Template, error)
```

parseGlob is the implementation of the function and method ParseGlob. 

#### <a id="ParseFS" href="#ParseFS">func ParseFS(fs fs.FS, patterns ...string) (*Template, error)</a>

```
searchKey: template.ParseFS
```

```Go
func ParseFS(fs fs.FS, patterns ...string) (*Template, error)
```

ParseFS is like ParseFiles or ParseGlob but reads from the file system fs instead of the host operating system's file system. It accepts a list of glob patterns. (Note that most file names serve as glob patterns matching only themselves.) 

#### <a id="parseFS" href="#parseFS">func parseFS(t *Template, fsys fs.FS, patterns []string) (*Template, error)</a>

```
searchKey: template.parseFS
tags: [private]
```

```Go
func parseFS(t *Template, fsys fs.FS, patterns []string) (*Template, error)
```

#### <a id="Template.Templates" href="#Template.Templates">func (t *Template) Templates() []*Template</a>

```
searchKey: template.Template.Templates
```

```Go
func (t *Template) Templates() []*Template
```

Templates returns a slice of the templates associated with t, including t itself. 

#### <a id="Template.Option" href="#Template.Option">func (t *Template) Option(opt ...string) *Template</a>

```
searchKey: template.Template.Option
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
#### <a id="Template.checkCanParse" href="#Template.checkCanParse">func (t *Template) checkCanParse() error</a>

```
searchKey: template.Template.checkCanParse
tags: [private]
```

```Go
func (t *Template) checkCanParse() error
```

checkCanParse checks whether it is OK to parse templates. If not, it returns an error. 

#### <a id="Template.escape" href="#Template.escape">func (t *Template) escape() error</a>

```
searchKey: template.Template.escape
tags: [private]
```

```Go
func (t *Template) escape() error
```

escape escapes all associated templates. 

#### <a id="Template.Execute" href="#Template.Execute">func (t *Template) Execute(wr io.Writer, data interface{}) error</a>

```
searchKey: template.Template.Execute
```

```Go
func (t *Template) Execute(wr io.Writer, data interface{}) error
```

Execute applies a parsed template to the specified data object, writing the output to wr. If an error occurs executing the template or writing its output, execution stops, but partial results may already have been written to the output writer. A template may be executed safely in parallel, although if parallel executions share a Writer the output may be interleaved. 

#### <a id="Template.ExecuteTemplate" href="#Template.ExecuteTemplate">func (t *Template) ExecuteTemplate(wr io.Writer, name string, data interface{}) error</a>

```
searchKey: template.Template.ExecuteTemplate
```

```Go
func (t *Template) ExecuteTemplate(wr io.Writer, name string, data interface{}) error
```

ExecuteTemplate applies the template associated with t that has the given name to the specified data object and writes the output to wr. If an error occurs executing the template or writing its output, execution stops, but partial results may already have been written to the output writer. A template may be executed safely in parallel, although if parallel executions share a Writer the output may be interleaved. 

#### <a id="Template.lookupAndEscapeTemplate" href="#Template.lookupAndEscapeTemplate">func (t *Template) lookupAndEscapeTemplate(name string) (tmpl *Template, err error)</a>

```
searchKey: template.Template.lookupAndEscapeTemplate
tags: [private]
```

```Go
func (t *Template) lookupAndEscapeTemplate(name string) (tmpl *Template, err error)
```

lookupAndEscapeTemplate guarantees that the template with the given name is escaped, or returns an error if it cannot be. It returns the named template. 

#### <a id="Template.DefinedTemplates" href="#Template.DefinedTemplates">func (t *Template) DefinedTemplates() string</a>

```
searchKey: template.Template.DefinedTemplates
```

```Go
func (t *Template) DefinedTemplates() string
```

DefinedTemplates returns a string listing the defined templates, prefixed by the string "; defined templates are: ". If there are none, it returns the empty string. Used to generate an error message. 

#### <a id="Template.Parse" href="#Template.Parse">func (t *Template) Parse(text string) (*Template, error)</a>

```
searchKey: template.Template.Parse
```

```Go
func (t *Template) Parse(text string) (*Template, error)
```

Parse parses text as a template body for t. Named template definitions ({{define ...}} or {{block ...}} statements) in text define additional templates associated with t and are removed from the definition of t itself. 

Templates can be redefined in successive calls to Parse, before the first use of Execute on t or any associated template. A template definition with a body containing only white space and comments is considered empty and will not replace an existing template's body. This allows using Parse to add new named template definitions without overwriting the main template body. 

#### <a id="Template.AddParseTree" href="#Template.AddParseTree">func (t *Template) AddParseTree(name string, tree *parse.Tree) (*Template, error)</a>

```
searchKey: template.Template.AddParseTree
```

```Go
func (t *Template) AddParseTree(name string, tree *parse.Tree) (*Template, error)
```

AddParseTree creates a new template with the name and parse tree and associates it with t. 

It returns an error if t or any associated template has already been executed. 

#### <a id="Template.Clone" href="#Template.Clone">func (t *Template) Clone() (*Template, error)</a>

```
searchKey: template.Template.Clone
```

```Go
func (t *Template) Clone() (*Template, error)
```

Clone returns a duplicate of the template, including all associated templates. The actual representation is not copied, but the name space of associated templates is, so further calls to Parse in the copy will add templates to the copy but not to the original. Clone can be used to prepare common templates and use them with variant definitions for other templates by adding the variants after the clone is made. 

It returns an error if t has already been executed. 

#### <a id="Template.New" href="#Template.New">func (t *Template) New(name string) *Template</a>

```
searchKey: template.Template.New
```

```Go
func (t *Template) New(name string) *Template
```

New allocates a new HTML template associated with the given one and with the same delimiters. The association, which is transitive, allows one template to invoke another with a {{template}} action. 

If a template with the given name already exists, the new HTML template will replace it. The existing template will be reset and disassociated with t. 

#### <a id="Template.new" href="#Template.new">func (t *Template) new(name string) *Template</a>

```
searchKey: template.Template.new
tags: [private]
```

```Go
func (t *Template) new(name string) *Template
```

new is the implementation of New, without the lock. 

#### <a id="Template.Name" href="#Template.Name">func (t *Template) Name() string</a>

```
searchKey: template.Template.Name
```

```Go
func (t *Template) Name() string
```

Name returns the name of the template. 

#### <a id="Template.Funcs" href="#Template.Funcs">func (t *Template) Funcs(funcMap FuncMap) *Template</a>

```
searchKey: template.Template.Funcs
```

```Go
func (t *Template) Funcs(funcMap FuncMap) *Template
```

Funcs adds the elements of the argument map to the template's function map. It must be called before the template is parsed. It panics if a value in the map is not a function with appropriate return type. However, it is legal to overwrite elements of the map. The return value is the template, so calls can be chained. 

#### <a id="Template.Delims" href="#Template.Delims">func (t *Template) Delims(left, right string) *Template</a>

```
searchKey: template.Template.Delims
```

```Go
func (t *Template) Delims(left, right string) *Template
```

Delims sets the action delimiters to the specified strings, to be used in subsequent calls to Parse, ParseFiles, or ParseGlob. Nested template definitions will inherit the settings. An empty delimiter stands for the corresponding default: {{ or }}. The return value is the template, so calls can be chained. 

#### <a id="Template.Lookup" href="#Template.Lookup">func (t *Template) Lookup(name string) *Template</a>

```
searchKey: template.Template.Lookup
```

```Go
func (t *Template) Lookup(name string) *Template
```

Lookup returns the template with the given name that is associated with t, or nil if there is no such template. 

#### <a id="Template.ParseFiles" href="#Template.ParseFiles">func (t *Template) ParseFiles(filenames ...string) (*Template, error)</a>

```
searchKey: template.Template.ParseFiles
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
```

```Go
func (t *Template) ParseGlob(pattern string) (*Template, error)
```

ParseGlob parses the template definitions in the files identified by the pattern and associates the resulting templates with t. The files are matched according to the semantics of filepath.Match, and the pattern must match at least one file. ParseGlob is equivalent to calling t.ParseFiles with the list of files matched by the pattern. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. 

ParseGlob returns an error if t or any associated template has already been executed. 

#### <a id="Template.ParseFS" href="#Template.ParseFS">func (t *Template) ParseFS(fs fs.FS, patterns ...string) (*Template, error)</a>

```
searchKey: template.Template.ParseFS
```

```Go
func (t *Template) ParseFS(fs fs.FS, patterns ...string) (*Template, error)
```

ParseFS is like ParseFiles or ParseGlob but reads from the file system fs instead of the host operating system's file system. It accepts a list of glob patterns. (Note that most file names serve as glob patterns matching only themselves.) 

### <a id="nameSpace" href="#nameSpace">type nameSpace struct</a>

```
searchKey: template.nameSpace
tags: [private]
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

### <a id="FuncMap" href="#FuncMap">type FuncMap map[string]interface{}</a>

```
searchKey: template.FuncMap
```

```Go
type FuncMap map[string]interface{}
```

FuncMap is the type of the map defining the mapping from names to functions. Each function must have either a single return value, or two return values of which the second has type error. In that case, if the second (error) argument evaluates to non-nil during execution, execution terminates and Execute returns that error. FuncMap has the same base type as FuncMap in "text/template", copied here so clients need not import "text/template". 

### <a id="myStringer" href="#myStringer">type myStringer struct</a>

```
searchKey: template.myStringer
tags: [private]
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
tags: [private]
```

```Go
func (s *myStringer) String() string
```

### <a id="errorer" href="#errorer">type errorer struct</a>

```
searchKey: template.errorer
tags: [private]
```

```Go
type errorer struct {
	v int
}
```

#### <a id="errorer.Error" href="#errorer.Error">func (s *errorer) Error() string</a>

```
searchKey: template.errorer.Error
tags: [private]
```

```Go
func (s *errorer) Error() string
```

### <a id="badMarshaler" href="#badMarshaler">type badMarshaler struct{}</a>

```
searchKey: template.badMarshaler
tags: [private]
```

```Go
type badMarshaler struct{}
```

#### <a id="badMarshaler.MarshalJSON" href="#badMarshaler.MarshalJSON">func (x *badMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: template.badMarshaler.MarshalJSON
tags: [private]
```

```Go
func (x *badMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="goodMarshaler" href="#goodMarshaler">type goodMarshaler struct{}</a>

```
searchKey: template.goodMarshaler
tags: [private]
```

```Go
type goodMarshaler struct{}
```

#### <a id="goodMarshaler.MarshalJSON" href="#goodMarshaler.MarshalJSON">func (x *goodMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: template.goodMarshaler.MarshalJSON
tags: [private]
```

```Go
func (x *goodMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="Issue7379" href="#Issue7379">type Issue7379 int</a>

```
searchKey: template.Issue7379
tags: [private]
```

```Go
type Issue7379 int
```

#### <a id="Issue7379.SomeMethod" href="#Issue7379.SomeMethod">func (Issue7379) SomeMethod(x int) string</a>

```
searchKey: template.Issue7379.SomeMethod
tags: [private]
```

```Go
func (Issue7379) SomeMethod(x int) string
```

### <a id="T" href="#T">type T struct</a>

```
searchKey: template.T
tags: [private]
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

#### <a id="T.Method0" href="#T.Method0">func (t *T) Method0() string</a>

```
searchKey: template.T.Method0
tags: [private]
```

```Go
func (t *T) Method0() string
```

Simple methods with and without arguments. 

#### <a id="T.Method1" href="#T.Method1">func (t *T) Method1(a int) int</a>

```
searchKey: template.T.Method1
tags: [private]
```

```Go
func (t *T) Method1(a int) int
```

#### <a id="T.Method2" href="#T.Method2">func (t *T) Method2(a uint16, b string) string</a>

```
searchKey: template.T.Method2
tags: [private]
```

```Go
func (t *T) Method2(a uint16, b string) string
```

#### <a id="T.Method3" href="#T.Method3">func (t *T) Method3(v interface{}) string</a>

```
searchKey: template.T.Method3
tags: [private]
```

```Go
func (t *T) Method3(v interface{}) string
```

#### <a id="T.Copy" href="#T.Copy">func (t *T) Copy() *T</a>

```
searchKey: template.T.Copy
tags: [private]
```

```Go
func (t *T) Copy() *T
```

#### <a id="T.MAdd" href="#T.MAdd">func (t *T) MAdd(a int, b []int) []int</a>

```
searchKey: template.T.MAdd
tags: [private]
```

```Go
func (t *T) MAdd(a int, b []int) []int
```

#### <a id="T.MyError" href="#T.MyError">func (t *T) MyError(error bool) (bool, error)</a>

```
searchKey: template.T.MyError
tags: [private]
```

```Go
func (t *T) MyError(error bool) (bool, error)
```

MyError returns a value and an error according to its argument. 

#### <a id="T.GetU" href="#T.GetU">func (t *T) GetU() *U</a>

```
searchKey: template.T.GetU
tags: [private]
```

```Go
func (t *T) GetU() *U
```

A few methods to test chaining. 

### <a id="S" href="#S">type S []string</a>

```
searchKey: template.S
tags: [private]
```

```Go
type S []string
```

#### <a id="S.Method0" href="#S.Method0">func (S) Method0() string</a>

```
searchKey: template.S.Method0
tags: [private]
```

```Go
func (S) Method0() string
```

### <a id="U" href="#U">type U struct</a>

```
searchKey: template.U
tags: [private]
```

```Go
type U struct {
	V string
}
```

#### <a id="U.TrueFalse" href="#U.TrueFalse">func (u *U) TrueFalse(b bool) string</a>

```
searchKey: template.U.TrueFalse
tags: [private]
```

```Go
func (u *U) TrueFalse(b bool) string
```

### <a id="V" href="#V">type V struct</a>

```
searchKey: template.V
tags: [private]
```

```Go
type V struct {
	j int
}
```

#### <a id="V.String" href="#V.String">func (v *V) String() string</a>

```
searchKey: template.V.String
tags: [private]
```

```Go
func (v *V) String() string
```

### <a id="W" href="#W">type W struct</a>

```
searchKey: template.W
tags: [private]
```

```Go
type W struct {
	k int
}
```

#### <a id="W.Error" href="#W.Error">func (w *W) Error() string</a>

```
searchKey: template.W.Error
tags: [private]
```

```Go
func (w *W) Error() string
```

### <a id="I" href="#I">type I interface</a>

```
searchKey: template.I
tags: [private]
```

```Go
type I interface {
	Method0() string
}
```

A non-empty interface. 

### <a id="execTest" href="#execTest">type execTest struct</a>

```
searchKey: template.execTest
tags: [private]
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

### <a id="Tree" href="#Tree">type Tree struct</a>

```
searchKey: template.Tree
tags: [private]
```

```Go
type Tree struct {
	Val         int
	Left, Right *Tree
}
```

### <a id="cmpTest" href="#cmpTest">type cmpTest struct</a>

```
searchKey: template.cmpTest
tags: [private]
```

```Go
type cmpTest struct {
	expr  string
	truth string
	ok    bool
}
```

### <a id="ErrorWriter" href="#ErrorWriter">type ErrorWriter int</a>

```
searchKey: template.ErrorWriter
tags: [private]
```

```Go
type ErrorWriter int
```

#### <a id="ErrorWriter.Write" href="#ErrorWriter.Write">func (e ErrorWriter) Write(p []byte) (int, error)</a>

```
searchKey: template.ErrorWriter.Write
tags: [private]
```

```Go
func (e ErrorWriter) Write(p []byte) (int, error)
```

### <a id="recursiveInvoker" href="#recursiveInvoker">type recursiveInvoker struct</a>

```
searchKey: template.recursiveInvoker
tags: [private]
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
tags: [private]
```

```Go
func (r *recursiveInvoker) Recur() (string, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="indirect" href="#indirect">func indirect(a interface{}) interface{}</a>

```
searchKey: template.indirect
tags: [private]
```

```Go
func indirect(a interface{}) interface{}
```

indirect returns the value, after dereferencing as many times as necessary to reach the base type (or nil). 

### <a id="indirectToStringerOrError" href="#indirectToStringerOrError">func indirectToStringerOrError(a interface{}) interface{}</a>

```
searchKey: template.indirectToStringerOrError
tags: [private]
```

```Go
func indirectToStringerOrError(a interface{}) interface{}
```

indirectToStringerOrError returns the value, after dereferencing as many times as necessary to reach the base type (or nil) or an implementation of fmt.Stringer or error, 

### <a id="isComment" href="#isComment">func isComment(s state) bool</a>

```
searchKey: template.isComment
tags: [private]
```

```Go
func isComment(s state) bool
```

isComment is true for any state that contains content meant for template authors & maintainers, not for end-users or machines. 

### <a id="isInTag" href="#isInTag">func isInTag(s state) bool</a>

```
searchKey: template.isInTag
tags: [private]
```

```Go
func isInTag(s state) bool
```

isInTag return whether s occurs solely inside an HTML tag. 

### <a id="endsWithCSSKeyword" href="#endsWithCSSKeyword">func endsWithCSSKeyword(b []byte, kw string) bool</a>

```
searchKey: template.endsWithCSSKeyword
tags: [private]
```

```Go
func endsWithCSSKeyword(b []byte, kw string) bool
```

endsWithCSSKeyword reports whether b ends with an ident that case-insensitively matches the lower-case kw. 

### <a id="isCSSNmchar" href="#isCSSNmchar">func isCSSNmchar(r rune) bool</a>

```
searchKey: template.isCSSNmchar
tags: [private]
```

```Go
func isCSSNmchar(r rune) bool
```

isCSSNmchar reports whether rune is allowed anywhere in a CSS identifier. 

### <a id="decodeCSS" href="#decodeCSS">func decodeCSS(s []byte) []byte</a>

```
searchKey: template.decodeCSS
tags: [private]
```

```Go
func decodeCSS(s []byte) []byte
```

decodeCSS decodes CSS3 escapes given a sequence of stringchars. If there is no change, it returns the input, otherwise it returns a slice backed by a new array. [https://www.w3.org/TR/css3-syntax/#SUBTOK-stringchar](https://www.w3.org/TR/css3-syntax/#SUBTOK-stringchar) defines stringchar. 

### <a id="isHex" href="#isHex">func isHex(c byte) bool</a>

```
searchKey: template.isHex
tags: [private]
```

```Go
func isHex(c byte) bool
```

isHex reports whether the given character is a hex digit. 

### <a id="hexDecode" href="#hexDecode">func hexDecode(s []byte) rune</a>

```
searchKey: template.hexDecode
tags: [private]
```

```Go
func hexDecode(s []byte) rune
```

hexDecode decodes a short hex digit sequence: "10" -> 16. 

### <a id="skipCSSSpace" href="#skipCSSSpace">func skipCSSSpace(c []byte) []byte</a>

```
searchKey: template.skipCSSSpace
tags: [private]
```

```Go
func skipCSSSpace(c []byte) []byte
```

skipCSSSpace returns a suffix of c, skipping over a single space. 

### <a id="isCSSSpace" href="#isCSSSpace">func isCSSSpace(b byte) bool</a>

```
searchKey: template.isCSSSpace
tags: [private]
```

```Go
func isCSSSpace(b byte) bool
```

isCSSSpace reports whether b is a CSS space char as defined in wc. 

### <a id="cssEscaper" href="#cssEscaper">func cssEscaper(args ...interface{}) string</a>

```
searchKey: template.cssEscaper
tags: [private]
```

```Go
func cssEscaper(args ...interface{}) string
```

cssEscaper escapes HTML and CSS special characters using \<hex>+ escapes. 

### <a id="cssValueFilter" href="#cssValueFilter">func cssValueFilter(args ...interface{}) string</a>

```
searchKey: template.cssValueFilter
tags: [private]
```

```Go
func cssValueFilter(args ...interface{}) string
```

cssValueFilter allows innocuous CSS values in the output including CSS quantities (10px or 25%), ID or class literals (#foo, .bar), keyword values (inherit, blue), and colors (#888). It filters out unsafe values, such as those that affect token boundaries, and anything that might execute scripts. 

### <a id="escapeTemplate" href="#escapeTemplate">func escapeTemplate(tmpl *Template, node parse.Node, name string) error</a>

```
searchKey: template.escapeTemplate
tags: [private]
```

```Go
func escapeTemplate(tmpl *Template, node parse.Node, name string) error
```

escapeTemplate rewrites the named template, which must be associated with t, to guarantee that the output of any of the named templates is properly escaped. If no error is returned, then the named templates have been modified. Otherwise the named templates have been rendered unusable. 

### <a id="evalArgs" href="#evalArgs">func evalArgs(args ...interface{}) string</a>

```
searchKey: template.evalArgs
tags: [private]
```

```Go
func evalArgs(args ...interface{}) string
```

evalArgs formats the list of arguments into a string. It is equivalent to fmt.Sprint(args...), except that it deferences all pointers. 

### <a id="ensurePipelineContains" href="#ensurePipelineContains">func ensurePipelineContains(p *parse.PipeNode, s []string)</a>

```
searchKey: template.ensurePipelineContains
tags: [private]
```

```Go
func ensurePipelineContains(p *parse.PipeNode, s []string)
```

ensurePipelineContains ensures that the pipeline ends with the commands with the identifiers in s in order. If the pipeline ends with a predefined escaper (i.e. "html" or "urlquery"), merge it with the identifiers in s. 

### <a id="escFnsEq" href="#escFnsEq">func escFnsEq(a, b string) bool</a>

```
searchKey: template.escFnsEq
tags: [private]
```

```Go
func escFnsEq(a, b string) bool
```

escFnsEq reports whether the two escaping functions are equivalent. 

### <a id="normalizeEscFn" href="#normalizeEscFn">func normalizeEscFn(e string) string</a>

```
searchKey: template.normalizeEscFn
tags: [private]
```

```Go
func normalizeEscFn(e string) string
```

normalizeEscFn(a) is equal to normalizeEscFn(b) for any pair of names of escaper functions a and b that are equivalent. 

### <a id="appendCmd" href="#appendCmd">func appendCmd(cmds []*parse.CommandNode, cmd *parse.CommandNode) []*parse.CommandNode</a>

```
searchKey: template.appendCmd
tags: [private]
```

```Go
func appendCmd(cmds []*parse.CommandNode, cmd *parse.CommandNode) []*parse.CommandNode
```

appendCmd appends the given command to the end of the command pipeline unless it is redundant with the last command. 

### <a id="newIdentCmd" href="#newIdentCmd">func newIdentCmd(identifier string, pos parse.Pos) *parse.CommandNode</a>

```
searchKey: template.newIdentCmd
tags: [private]
```

```Go
func newIdentCmd(identifier string, pos parse.Pos) *parse.CommandNode
```

newIdentCmd produces a command containing a single identifier node. 

### <a id="HTMLEscape" href="#HTMLEscape">func HTMLEscape(w io.Writer, b []byte)</a>

```
searchKey: template.HTMLEscape
```

```Go
func HTMLEscape(w io.Writer, b []byte)
```

HTMLEscape writes to w the escaped HTML equivalent of the plain text data b. 

### <a id="HTMLEscapeString" href="#HTMLEscapeString">func HTMLEscapeString(s string) string</a>

```
searchKey: template.HTMLEscapeString
```

```Go
func HTMLEscapeString(s string) string
```

HTMLEscapeString returns the escaped HTML equivalent of the plain text data s. 

### <a id="HTMLEscaper" href="#HTMLEscaper">func HTMLEscaper(args ...interface{}) string</a>

```
searchKey: template.HTMLEscaper
```

```Go
func HTMLEscaper(args ...interface{}) string
```

HTMLEscaper returns the escaped HTML equivalent of the textual representation of its arguments. 

### <a id="JSEscape" href="#JSEscape">func JSEscape(w io.Writer, b []byte)</a>

```
searchKey: template.JSEscape
```

```Go
func JSEscape(w io.Writer, b []byte)
```

JSEscape writes to w the escaped JavaScript equivalent of the plain text data b. 

### <a id="JSEscapeString" href="#JSEscapeString">func JSEscapeString(s string) string</a>

```
searchKey: template.JSEscapeString
```

```Go
func JSEscapeString(s string) string
```

JSEscapeString returns the escaped JavaScript equivalent of the plain text data s. 

### <a id="JSEscaper" href="#JSEscaper">func JSEscaper(args ...interface{}) string</a>

```
searchKey: template.JSEscaper
```

```Go
func JSEscaper(args ...interface{}) string
```

JSEscaper returns the escaped JavaScript equivalent of the textual representation of its arguments. 

### <a id="URLQueryEscaper" href="#URLQueryEscaper">func URLQueryEscaper(args ...interface{}) string</a>

```
searchKey: template.URLQueryEscaper
```

```Go
func URLQueryEscaper(args ...interface{}) string
```

URLQueryEscaper returns the escaped value of the textual representation of its arguments in a form suitable for embedding in a URL query. 

### <a id="htmlNospaceEscaper" href="#htmlNospaceEscaper">func htmlNospaceEscaper(args ...interface{}) string</a>

```
searchKey: template.htmlNospaceEscaper
tags: [private]
```

```Go
func htmlNospaceEscaper(args ...interface{}) string
```

htmlNospaceEscaper escapes for inclusion in unquoted attribute values. 

### <a id="attrEscaper" href="#attrEscaper">func attrEscaper(args ...interface{}) string</a>

```
searchKey: template.attrEscaper
tags: [private]
```

```Go
func attrEscaper(args ...interface{}) string
```

attrEscaper escapes for inclusion in quoted attribute values. 

### <a id="rcdataEscaper" href="#rcdataEscaper">func rcdataEscaper(args ...interface{}) string</a>

```
searchKey: template.rcdataEscaper
tags: [private]
```

```Go
func rcdataEscaper(args ...interface{}) string
```

rcdataEscaper escapes for inclusion in an RCDATA element body. 

### <a id="htmlEscaper" href="#htmlEscaper">func htmlEscaper(args ...interface{}) string</a>

```
searchKey: template.htmlEscaper
tags: [private]
```

```Go
func htmlEscaper(args ...interface{}) string
```

htmlEscaper escapes for inclusion in HTML text. 

### <a id="htmlReplacer" href="#htmlReplacer">func htmlReplacer(s string, replacementTable []string, badRunes bool) string</a>

```
searchKey: template.htmlReplacer
tags: [private]
```

```Go
func htmlReplacer(s string, replacementTable []string, badRunes bool) string
```

htmlReplacer returns s with runes replaced according to replacementTable and when badRunes is true, certain bad runes are allowed through unescaped. 

### <a id="stripTags" href="#stripTags">func stripTags(html string) string</a>

```
searchKey: template.stripTags
tags: [private]
```

```Go
func stripTags(html string) string
```

stripTags takes a snippet of HTML and returns only the text content. For example, `<b>&iexcl;Hi!</b> <script>...</script>` -> `&iexcl;Hi! `. 

### <a id="htmlNameFilter" href="#htmlNameFilter">func htmlNameFilter(args ...interface{}) string</a>

```
searchKey: template.htmlNameFilter
tags: [private]
```

```Go
func htmlNameFilter(args ...interface{}) string
```

htmlNameFilter accepts valid parts of an HTML attribute or tag name or a known-safe HTML attribute. 

### <a id="commentEscaper" href="#commentEscaper">func commentEscaper(args ...interface{}) string</a>

```
searchKey: template.commentEscaper
tags: [private]
```

```Go
func commentEscaper(args ...interface{}) string
```

commentEscaper returns the empty string regardless of input. Comment content does not correspond to any parsed structure or human-readable content, so the simplest and most secure policy is to drop content interpolated into comments. This approach is equally valid whether or not static comment content is removed from the template. 

### <a id="indirectToJSONMarshaler" href="#indirectToJSONMarshaler">func indirectToJSONMarshaler(a interface{}) interface{}</a>

```
searchKey: template.indirectToJSONMarshaler
tags: [private]
```

```Go
func indirectToJSONMarshaler(a interface{}) interface{}
```

indirectToJSONMarshaler returns the value, after dereferencing as many times as necessary to reach the base type (or nil) or an implementation of json.Marshal. 

### <a id="jsValEscaper" href="#jsValEscaper">func jsValEscaper(args ...interface{}) string</a>

```
searchKey: template.jsValEscaper
tags: [private]
```

```Go
func jsValEscaper(args ...interface{}) string
```

jsValEscaper escapes its inputs to a JS Expression (section 11.14) that has neither side-effects nor free variables outside (NaN, Infinity). 

### <a id="jsStrEscaper" href="#jsStrEscaper">func jsStrEscaper(args ...interface{}) string</a>

```
searchKey: template.jsStrEscaper
tags: [private]
```

```Go
func jsStrEscaper(args ...interface{}) string
```

jsStrEscaper produces a string that can be included between quotes in JavaScript source, in JavaScript embedded in an HTML5 <script> element, or in an HTML5 event handler attribute such as onclick. 

### <a id="jsRegexpEscaper" href="#jsRegexpEscaper">func jsRegexpEscaper(args ...interface{}) string</a>

```
searchKey: template.jsRegexpEscaper
tags: [private]
```

```Go
func jsRegexpEscaper(args ...interface{}) string
```

jsRegexpEscaper behaves like jsStrEscaper but escapes regular expression specials so the result is treated literally when included in a regular expression literal. /foo{{.X}}bar/ matches the string "foo" followed by the literal text of {{.X}} followed by the string "bar". 

### <a id="replace" href="#replace">func replace(s string, replacementTable []string) string</a>

```
searchKey: template.replace
tags: [private]
```

```Go
func replace(s string, replacementTable []string) string
```

replace replaces each rune r of s with replacementTable[r], provided that r < len(replacementTable). If replacementTable[r] is the empty string then no replacement is made. It also replaces runes U+2028 and U+2029 with the raw strings `\u2028` and `\u2029`. 

### <a id="isJSIdentPart" href="#isJSIdentPart">func isJSIdentPart(r rune) bool</a>

```
searchKey: template.isJSIdentPart
tags: [private]
```

```Go
func isJSIdentPart(r rune) bool
```

isJSIdentPart reports whether the given rune is a JS identifier part. It does not handle all the non-Latin letters, joiners, and combining marks, but it does handle every codepoint that can occur in a numeric literal or a keyword. 

### <a id="isJSType" href="#isJSType">func isJSType(mimeType string) bool</a>

```
searchKey: template.isJSType
tags: [private]
```

```Go
func isJSType(mimeType string) bool
```

isJSType reports whether the given MIME type should be considered JavaScript. 

It is used to determine whether a script tag with a type attribute is a javascript container. 

### <a id="IsTrue" href="#IsTrue">func IsTrue(val interface{}) (truth, ok bool)</a>

```
searchKey: template.IsTrue
```

```Go
func IsTrue(val interface{}) (truth, ok bool)
```

IsTrue reports whether the value is 'true', in the sense of not the zero of its type, and whether the value has a meaningful truth value. This is the definition of truth used by if and other such actions. 

### <a id="readFileOS" href="#readFileOS">func readFileOS(file string) (name string, b []byte, err error)</a>

```
searchKey: template.readFileOS
tags: [private]
```

```Go
func readFileOS(file string) (name string, b []byte, err error)
```

### <a id="readFileFS" href="#readFileFS">func readFileFS(fsys fs.FS) func(string) (string, []byte, error)</a>

```
searchKey: template.readFileFS
tags: [private]
```

```Go
func readFileFS(fsys fs.FS) func(string) (string, []byte, error)
```

### <a id="indexTagEnd" href="#indexTagEnd">func indexTagEnd(s []byte, tag []byte) int</a>

```
searchKey: template.indexTagEnd
tags: [private]
```

```Go
func indexTagEnd(s []byte, tag []byte) int
```

indexTagEnd finds the index of a special tag end in a case insensitive way, or returns -1 

### <a id="asciiAlpha" href="#asciiAlpha">func asciiAlpha(c byte) bool</a>

```
searchKey: template.asciiAlpha
tags: [private]
```

```Go
func asciiAlpha(c byte) bool
```

asciiAlpha reports whether c is an ASCII letter. 

### <a id="asciiAlphaNum" href="#asciiAlphaNum">func asciiAlphaNum(c byte) bool</a>

```
searchKey: template.asciiAlphaNum
tags: [private]
```

```Go
func asciiAlphaNum(c byte) bool
```

asciiAlphaNum reports whether c is an ASCII letter or digit. 

### <a id="eatWhiteSpace" href="#eatWhiteSpace">func eatWhiteSpace(s []byte, i int) int</a>

```
searchKey: template.eatWhiteSpace
tags: [private]
```

```Go
func eatWhiteSpace(s []byte, i int) int
```

eatWhiteSpace returns the largest j such that s[i:j] is white space. 

### <a id="urlFilter" href="#urlFilter">func urlFilter(args ...interface{}) string</a>

```
searchKey: template.urlFilter
tags: [private]
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

### <a id="isSafeURL" href="#isSafeURL">func isSafeURL(s string) bool</a>

```
searchKey: template.isSafeURL
tags: [private]
```

```Go
func isSafeURL(s string) bool
```

isSafeURL is true if s is a relative URL or if URL has a protocol in (http, https, mailto). 

### <a id="urlEscaper" href="#urlEscaper">func urlEscaper(args ...interface{}) string</a>

```
searchKey: template.urlEscaper
tags: [private]
```

```Go
func urlEscaper(args ...interface{}) string
```

urlEscaper produces an output that can be embedded in a URL query. The output can be embedded in an HTML attribute without further escaping. 

### <a id="urlNormalizer" href="#urlNormalizer">func urlNormalizer(args ...interface{}) string</a>

```
searchKey: template.urlNormalizer
tags: [private]
```

```Go
func urlNormalizer(args ...interface{}) string
```

urlNormalizer normalizes URL content so it can be embedded in a quote-delimited string or parenthesis delimited url(...). The normalizer does not encode all HTML specials. Specifically, it does not encode '&' so correct embedding in an HTML attribute requires escaping of '&' to '&amp;'. 

### <a id="urlProcessor" href="#urlProcessor">func urlProcessor(norm bool, args ...interface{}) string</a>

```
searchKey: template.urlProcessor
tags: [private]
```

```Go
func urlProcessor(norm bool, args ...interface{}) string
```

urlProcessor normalizes (when norm is true) or escapes its input to produce a valid hierarchical or opaque URL part. 

### <a id="processURLOnto" href="#processURLOnto">func processURLOnto(s string, norm bool, b *bytes.Buffer) bool</a>

```
searchKey: template.processURLOnto
tags: [private]
```

```Go
func processURLOnto(s string, norm bool, b *bytes.Buffer) bool
```

processURLOnto appends a normalized URL corresponding to its input to b and reports whether the appended content differs from s. 

### <a id="srcsetFilterAndEscaper" href="#srcsetFilterAndEscaper">func srcsetFilterAndEscaper(args ...interface{}) string</a>

```
searchKey: template.srcsetFilterAndEscaper
tags: [private]
```

```Go
func srcsetFilterAndEscaper(args ...interface{}) string
```

Filters and normalizes srcset values which are comma separated URLs followed by metadata. 

### <a id="isHTMLSpace" href="#isHTMLSpace">func isHTMLSpace(c byte) bool</a>

```
searchKey: template.isHTMLSpace
tags: [private]
```

```Go
func isHTMLSpace(c byte) bool
```

isHTMLSpace is true iff c is a whitespace character per [https://infra.spec.whatwg.org/#ascii-whitespace](https://infra.spec.whatwg.org/#ascii-whitespace) 

### <a id="isHTMLSpaceOrASCIIAlnum" href="#isHTMLSpaceOrASCIIAlnum">func isHTMLSpaceOrASCIIAlnum(c byte) bool</a>

```
searchKey: template.isHTMLSpaceOrASCIIAlnum
tags: [private]
```

```Go
func isHTMLSpaceOrASCIIAlnum(c byte) bool
```

### <a id="filterSrcsetElement" href="#filterSrcsetElement">func filterSrcsetElement(s string, left int, right int, b *bytes.Buffer)</a>

```
searchKey: template.filterSrcsetElement
tags: [private]
```

```Go
func filterSrcsetElement(s string, left int, right int, b *bytes.Buffer)
```

### <a id="TestAddParseTreeHTML" href="#TestAddParseTreeHTML">func TestAddParseTreeHTML(t *testing.T)</a>

```
searchKey: template.TestAddParseTreeHTML
tags: [private]
```

```Go
func TestAddParseTreeHTML(t *testing.T)
```

### <a id="TestClone" href="#TestClone">func TestClone(t *testing.T)</a>

```
searchKey: template.TestClone
tags: [private]
```

```Go
func TestClone(t *testing.T)
```

### <a id="TestTemplates" href="#TestTemplates">func TestTemplates(t *testing.T)</a>

```
searchKey: template.TestTemplates
tags: [private]
```

```Go
func TestTemplates(t *testing.T)
```

### <a id="TestCloneCrash" href="#TestCloneCrash">func TestCloneCrash(t *testing.T)</a>

```
searchKey: template.TestCloneCrash
tags: [private]
```

```Go
func TestCloneCrash(t *testing.T)
```

This used to crash; [https://golang.org/issue/3281](https://golang.org/issue/3281) 

### <a id="TestCloneThenParse" href="#TestCloneThenParse">func TestCloneThenParse(t *testing.T)</a>

```
searchKey: template.TestCloneThenParse
tags: [private]
```

```Go
func TestCloneThenParse(t *testing.T)
```

Ensure that this guarantee from the docs is upheld: "Further calls to Parse in the copy will add templates to the copy but not to the original." 

### <a id="TestFuncMapWorksAfterClone" href="#TestFuncMapWorksAfterClone">func TestFuncMapWorksAfterClone(t *testing.T)</a>

```
searchKey: template.TestFuncMapWorksAfterClone
tags: [private]
```

```Go
func TestFuncMapWorksAfterClone(t *testing.T)
```

[https://golang.org/issue/5980](https://golang.org/issue/5980) 

### <a id="TestTemplateCloneExecuteRace" href="#TestTemplateCloneExecuteRace">func TestTemplateCloneExecuteRace(t *testing.T)</a>

```
searchKey: template.TestTemplateCloneExecuteRace
tags: [private]
```

```Go
func TestTemplateCloneExecuteRace(t *testing.T)
```

[https://golang.org/issue/16101](https://golang.org/issue/16101) 

### <a id="TestTemplateCloneLookup" href="#TestTemplateCloneLookup">func TestTemplateCloneLookup(t *testing.T)</a>

```
searchKey: template.TestTemplateCloneLookup
tags: [private]
```

```Go
func TestTemplateCloneLookup(t *testing.T)
```

### <a id="TestCloneGrowth" href="#TestCloneGrowth">func TestCloneGrowth(t *testing.T)</a>

```
searchKey: template.TestCloneGrowth
tags: [private]
```

```Go
func TestCloneGrowth(t *testing.T)
```

### <a id="TestCloneRedefinedName" href="#TestCloneRedefinedName">func TestCloneRedefinedName(t *testing.T)</a>

```
searchKey: template.TestCloneRedefinedName
tags: [private]
```

```Go
func TestCloneRedefinedName(t *testing.T)
```

[https://golang.org/issue/17735](https://golang.org/issue/17735) 

### <a id="TestClonePipe" href="#TestClonePipe">func TestClonePipe(t *testing.T)</a>

```
searchKey: template.TestClonePipe
tags: [private]
```

```Go
func TestClonePipe(t *testing.T)
```

Issue 24791. 

### <a id="TestTypedContent" href="#TestTypedContent">func TestTypedContent(t *testing.T)</a>

```
searchKey: template.TestTypedContent
tags: [private]
```

```Go
func TestTypedContent(t *testing.T)
```

### <a id="TestStringer" href="#TestStringer">func TestStringer(t *testing.T)</a>

```
searchKey: template.TestStringer
tags: [private]
```

```Go
func TestStringer(t *testing.T)
```

### <a id="TestEscapingNilNonemptyInterfaces" href="#TestEscapingNilNonemptyInterfaces">func TestEscapingNilNonemptyInterfaces(t *testing.T)</a>

```
searchKey: template.TestEscapingNilNonemptyInterfaces
tags: [private]
```

```Go
func TestEscapingNilNonemptyInterfaces(t *testing.T)
```

[https://golang.org/issue/5982](https://golang.org/issue/5982) 

### <a id="TestEndsWithCSSKeyword" href="#TestEndsWithCSSKeyword">func TestEndsWithCSSKeyword(t *testing.T)</a>

```
searchKey: template.TestEndsWithCSSKeyword
tags: [private]
```

```Go
func TestEndsWithCSSKeyword(t *testing.T)
```

### <a id="TestIsCSSNmchar" href="#TestIsCSSNmchar">func TestIsCSSNmchar(t *testing.T)</a>

```
searchKey: template.TestIsCSSNmchar
tags: [private]
```

```Go
func TestIsCSSNmchar(t *testing.T)
```

### <a id="TestDecodeCSS" href="#TestDecodeCSS">func TestDecodeCSS(t *testing.T)</a>

```
searchKey: template.TestDecodeCSS
tags: [private]
```

```Go
func TestDecodeCSS(t *testing.T)
```

### <a id="TestHexDecode" href="#TestHexDecode">func TestHexDecode(t *testing.T)</a>

```
searchKey: template.TestHexDecode
tags: [private]
```

```Go
func TestHexDecode(t *testing.T)
```

### <a id="TestSkipCSSSpace" href="#TestSkipCSSSpace">func TestSkipCSSSpace(t *testing.T)</a>

```
searchKey: template.TestSkipCSSSpace
tags: [private]
```

```Go
func TestSkipCSSSpace(t *testing.T)
```

### <a id="TestCSSEscaper" href="#TestCSSEscaper">func TestCSSEscaper(t *testing.T)</a>

```
searchKey: template.TestCSSEscaper
tags: [private]
```

```Go
func TestCSSEscaper(t *testing.T)
```

### <a id="TestCSSValueFilter" href="#TestCSSValueFilter">func TestCSSValueFilter(t *testing.T)</a>

```
searchKey: template.TestCSSValueFilter
tags: [private]
```

```Go
func TestCSSValueFilter(t *testing.T)
```

### <a id="BenchmarkCSSEscaper" href="#BenchmarkCSSEscaper">func BenchmarkCSSEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkCSSEscaper
tags: [private]
```

```Go
func BenchmarkCSSEscaper(b *testing.B)
```

### <a id="BenchmarkCSSEscaperNoSpecials" href="#BenchmarkCSSEscaperNoSpecials">func BenchmarkCSSEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkCSSEscaperNoSpecials
tags: [private]
```

```Go
func BenchmarkCSSEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkDecodeCSS" href="#BenchmarkDecodeCSS">func BenchmarkDecodeCSS(b *testing.B)</a>

```
searchKey: template.BenchmarkDecodeCSS
tags: [private]
```

```Go
func BenchmarkDecodeCSS(b *testing.B)
```

### <a id="BenchmarkDecodeCSSNoSpecials" href="#BenchmarkDecodeCSSNoSpecials">func BenchmarkDecodeCSSNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkDecodeCSSNoSpecials
tags: [private]
```

```Go
func BenchmarkDecodeCSSNoSpecials(b *testing.B)
```

### <a id="BenchmarkCSSValueFilter" href="#BenchmarkCSSValueFilter">func BenchmarkCSSValueFilter(b *testing.B)</a>

```
searchKey: template.BenchmarkCSSValueFilter
tags: [private]
```

```Go
func BenchmarkCSSValueFilter(b *testing.B)
```

### <a id="BenchmarkCSSValueFilterOk" href="#BenchmarkCSSValueFilterOk">func BenchmarkCSSValueFilterOk(b *testing.B)</a>

```
searchKey: template.BenchmarkCSSValueFilterOk
tags: [private]
```

```Go
func BenchmarkCSSValueFilterOk(b *testing.B)
```

### <a id="TestEscape" href="#TestEscape">func TestEscape(t *testing.T)</a>

```
searchKey: template.TestEscape
tags: [private]
```

```Go
func TestEscape(t *testing.T)
```

### <a id="TestEscapeMap" href="#TestEscapeMap">func TestEscapeMap(t *testing.T)</a>

```
searchKey: template.TestEscapeMap
tags: [private]
```

```Go
func TestEscapeMap(t *testing.T)
```

### <a id="TestEscapeSet" href="#TestEscapeSet">func TestEscapeSet(t *testing.T)</a>

```
searchKey: template.TestEscapeSet
tags: [private]
```

```Go
func TestEscapeSet(t *testing.T)
```

### <a id="TestErrors" href="#TestErrors">func TestErrors(t *testing.T)</a>

```
searchKey: template.TestErrors
tags: [private]
```

```Go
func TestErrors(t *testing.T)
```

### <a id="TestEscapeText" href="#TestEscapeText">func TestEscapeText(t *testing.T)</a>

```
searchKey: template.TestEscapeText
tags: [private]
```

```Go
func TestEscapeText(t *testing.T)
```

### <a id="TestEnsurePipelineContains" href="#TestEnsurePipelineContains">func TestEnsurePipelineContains(t *testing.T)</a>

```
searchKey: template.TestEnsurePipelineContains
tags: [private]
```

```Go
func TestEnsurePipelineContains(t *testing.T)
```

### <a id="TestEscapeMalformedPipelines" href="#TestEscapeMalformedPipelines">func TestEscapeMalformedPipelines(t *testing.T)</a>

```
searchKey: template.TestEscapeMalformedPipelines
tags: [private]
```

```Go
func TestEscapeMalformedPipelines(t *testing.T)
```

### <a id="TestEscapeErrorsNotIgnorable" href="#TestEscapeErrorsNotIgnorable">func TestEscapeErrorsNotIgnorable(t *testing.T)</a>

```
searchKey: template.TestEscapeErrorsNotIgnorable
tags: [private]
```

```Go
func TestEscapeErrorsNotIgnorable(t *testing.T)
```

### <a id="TestEscapeSetErrorsNotIgnorable" href="#TestEscapeSetErrorsNotIgnorable">func TestEscapeSetErrorsNotIgnorable(t *testing.T)</a>

```
searchKey: template.TestEscapeSetErrorsNotIgnorable
tags: [private]
```

```Go
func TestEscapeSetErrorsNotIgnorable(t *testing.T)
```

### <a id="TestRedundantFuncs" href="#TestRedundantFuncs">func TestRedundantFuncs(t *testing.T)</a>

```
searchKey: template.TestRedundantFuncs
tags: [private]
```

```Go
func TestRedundantFuncs(t *testing.T)
```

### <a id="TestIndirectPrint" href="#TestIndirectPrint">func TestIndirectPrint(t *testing.T)</a>

```
searchKey: template.TestIndirectPrint
tags: [private]
```

```Go
func TestIndirectPrint(t *testing.T)
```

### <a id="TestEmptyTemplateHTML" href="#TestEmptyTemplateHTML">func TestEmptyTemplateHTML(t *testing.T)</a>

```
searchKey: template.TestEmptyTemplateHTML
tags: [private]
```

```Go
func TestEmptyTemplateHTML(t *testing.T)
```

This is a test for issue 3272. 

### <a id="TestPipeToMethodIsEscaped" href="#TestPipeToMethodIsEscaped">func TestPipeToMethodIsEscaped(t *testing.T)</a>

```
searchKey: template.TestPipeToMethodIsEscaped
tags: [private]
```

```Go
func TestPipeToMethodIsEscaped(t *testing.T)
```

This is a test for issue 7379: type assertion error caused panic, and then the code to handle the panic breaks escaping. It's hard to see the second problem once the first is fixed, but its fix is trivial so we let that go. See the discussion for issue 7379. 

### <a id="TestErrorOnUndefined" href="#TestErrorOnUndefined">func TestErrorOnUndefined(t *testing.T)</a>

```
searchKey: template.TestErrorOnUndefined
tags: [private]
```

```Go
func TestErrorOnUndefined(t *testing.T)
```

Unlike text/template, html/template crashed if given an incomplete template, that is, a template that had been named but not given any content. This is issue #10204. 

### <a id="TestIdempotentExecute" href="#TestIdempotentExecute">func TestIdempotentExecute(t *testing.T)</a>

```
searchKey: template.TestIdempotentExecute
tags: [private]
```

```Go
func TestIdempotentExecute(t *testing.T)
```

This covers issue #20842. 

### <a id="BenchmarkEscapedExecute" href="#BenchmarkEscapedExecute">func BenchmarkEscapedExecute(b *testing.B)</a>

```
searchKey: template.BenchmarkEscapedExecute
tags: [private]
```

```Go
func BenchmarkEscapedExecute(b *testing.B)
```

### <a id="TestOrphanedTemplate" href="#TestOrphanedTemplate">func TestOrphanedTemplate(t *testing.T)</a>

```
searchKey: template.TestOrphanedTemplate
tags: [private]
```

```Go
func TestOrphanedTemplate(t *testing.T)
```

Covers issue 22780. 

### <a id="TestAliasedParseTreeDoesNotOverescape" href="#TestAliasedParseTreeDoesNotOverescape">func TestAliasedParseTreeDoesNotOverescape(t *testing.T)</a>

```
searchKey: template.TestAliasedParseTreeDoesNotOverescape
tags: [private]
```

```Go
func TestAliasedParseTreeDoesNotOverescape(t *testing.T)
```

Covers issue 21844. 

### <a id="newInt" href="#newInt">func newInt(n int) *int</a>

```
searchKey: template.newInt
tags: [private]
```

```Go
func newInt(n int) *int
```

Helpers for creation. 

### <a id="newString" href="#newString">func newString(s string) *string</a>

```
searchKey: template.newString
tags: [private]
```

```Go
func newString(s string) *string
```

### <a id="newIntSlice" href="#newIntSlice">func newIntSlice(n ...int) *[]int</a>

```
searchKey: template.newIntSlice
tags: [private]
```

```Go
func newIntSlice(n ...int) *[]int
```

### <a id="typeOf" href="#typeOf">func typeOf(arg interface{}) string</a>

```
searchKey: template.typeOf
tags: [private]
```

```Go
func typeOf(arg interface{}) string
```

### <a id="zeroArgs" href="#zeroArgs">func zeroArgs() string</a>

```
searchKey: template.zeroArgs
tags: [private]
```

```Go
func zeroArgs() string
```

### <a id="oneArg" href="#oneArg">func oneArg(a string) string</a>

```
searchKey: template.oneArg
tags: [private]
```

```Go
func oneArg(a string) string
```

### <a id="twoArgs" href="#twoArgs">func twoArgs(a, b string) string</a>

```
searchKey: template.twoArgs
tags: [private]
```

```Go
func twoArgs(a, b string) string
```

### <a id="dddArg" href="#dddArg">func dddArg(a int, b ...string) string</a>

```
searchKey: template.dddArg
tags: [private]
```

```Go
func dddArg(a int, b ...string) string
```

### <a id="count" href="#count">func count(n int) chan string</a>

```
searchKey: template.count
tags: [private]
```

```Go
func count(n int) chan string
```

count returns a channel that will deliver n sequential 1-letter strings starting at "a" 

### <a id="vfunc" href="#vfunc">func vfunc(V, *V) string</a>

```
searchKey: template.vfunc
tags: [private]
```

```Go
func vfunc(V, *V) string
```

vfunc takes a *V and a V 

### <a id="valueString" href="#valueString">func valueString(v string) string</a>

```
searchKey: template.valueString
tags: [private]
```

```Go
func valueString(v string) string
```

valueString takes a string, not a pointer. 

### <a id="returnInt" href="#returnInt">func returnInt() int</a>

```
searchKey: template.returnInt
tags: [private]
```

```Go
func returnInt() int
```

returnInt returns an int 

### <a id="add" href="#add">func add(args ...int) int</a>

```
searchKey: template.add
tags: [private]
```

```Go
func add(args ...int) int
```

### <a id="echo" href="#echo">func echo(arg interface{}) interface{}</a>

```
searchKey: template.echo
tags: [private]
```

```Go
func echo(arg interface{}) interface{}
```

### <a id="makemap" href="#makemap">func makemap(arg ...string) map[string]string</a>

```
searchKey: template.makemap
tags: [private]
```

```Go
func makemap(arg ...string) map[string]string
```

### <a id="stringer" href="#stringer">func stringer(s fmt.Stringer) string</a>

```
searchKey: template.stringer
tags: [private]
```

```Go
func stringer(s fmt.Stringer) string
```

### <a id="mapOfThree" href="#mapOfThree">func mapOfThree() interface{}</a>

```
searchKey: template.mapOfThree
tags: [private]
```

```Go
func mapOfThree() interface{}
```

### <a id="testExecute" href="#testExecute">func testExecute(execTests []execTest, template *Template, t *testing.T)</a>

```
searchKey: template.testExecute
tags: [private]
```

```Go
func testExecute(execTests []execTest, template *Template, t *testing.T)
```

### <a id="TestExecute" href="#TestExecute">func TestExecute(t *testing.T)</a>

```
searchKey: template.TestExecute
tags: [private]
```

```Go
func TestExecute(t *testing.T)
```

### <a id="TestDelims" href="#TestDelims">func TestDelims(t *testing.T)</a>

```
searchKey: template.TestDelims
tags: [private]
```

```Go
func TestDelims(t *testing.T)
```

### <a id="TestExecuteError" href="#TestExecuteError">func TestExecuteError(t *testing.T)</a>

```
searchKey: template.TestExecuteError
tags: [private]
```

```Go
func TestExecuteError(t *testing.T)
```

Check that an error from a method flows back to the top. 

### <a id="TestExecError" href="#TestExecError">func TestExecError(t *testing.T)</a>

```
searchKey: template.TestExecError
tags: [private]
```

```Go
func TestExecError(t *testing.T)
```

Check that an error from a nested template contains all the relevant information. 

### <a id="TestJSEscaping" href="#TestJSEscaping">func TestJSEscaping(t *testing.T)</a>

```
searchKey: template.TestJSEscaping
tags: [private]
```

```Go
func TestJSEscaping(t *testing.T)
```

### <a id="TestTree" href="#TestTree">func TestTree(t *testing.T)</a>

```
searchKey: template.TestTree
tags: [private]
```

```Go
func TestTree(t *testing.T)
```

### <a id="TestExecuteOnNewTemplate" href="#TestExecuteOnNewTemplate">func TestExecuteOnNewTemplate(t *testing.T)</a>

```
searchKey: template.TestExecuteOnNewTemplate
tags: [private]
```

```Go
func TestExecuteOnNewTemplate(t *testing.T)
```

### <a id="TestMessageForExecuteEmpty" href="#TestMessageForExecuteEmpty">func TestMessageForExecuteEmpty(t *testing.T)</a>

```
searchKey: template.TestMessageForExecuteEmpty
tags: [private]
```

```Go
func TestMessageForExecuteEmpty(t *testing.T)
```

### <a id="TestFinalForPrintf" href="#TestFinalForPrintf">func TestFinalForPrintf(t *testing.T)</a>

```
searchKey: template.TestFinalForPrintf
tags: [private]
```

```Go
func TestFinalForPrintf(t *testing.T)
```

### <a id="TestComparison" href="#TestComparison">func TestComparison(t *testing.T)</a>

```
searchKey: template.TestComparison
tags: [private]
```

```Go
func TestComparison(t *testing.T)
```

### <a id="TestMissingMapKey" href="#TestMissingMapKey">func TestMissingMapKey(t *testing.T)</a>

```
searchKey: template.TestMissingMapKey
tags: [private]
```

```Go
func TestMissingMapKey(t *testing.T)
```

### <a id="TestUnterminatedStringError" href="#TestUnterminatedStringError">func TestUnterminatedStringError(t *testing.T)</a>

```
searchKey: template.TestUnterminatedStringError
tags: [private]
```

```Go
func TestUnterminatedStringError(t *testing.T)
```

Test that the error message for multiline unterminated string refers to the line number of the opening quote. 

### <a id="TestExecuteGivesExecError" href="#TestExecuteGivesExecError">func TestExecuteGivesExecError(t *testing.T)</a>

```
searchKey: template.TestExecuteGivesExecError
tags: [private]
```

```Go
func TestExecuteGivesExecError(t *testing.T)
```

### <a id="funcNameTestFunc" href="#funcNameTestFunc">func funcNameTestFunc() int</a>

```
searchKey: template.funcNameTestFunc
tags: [private]
```

```Go
func funcNameTestFunc() int
```

### <a id="TestGoodFuncNames" href="#TestGoodFuncNames">func TestGoodFuncNames(t *testing.T)</a>

```
searchKey: template.TestGoodFuncNames
tags: [private]
```

```Go
func TestGoodFuncNames(t *testing.T)
```

### <a id="TestBadFuncNames" href="#TestBadFuncNames">func TestBadFuncNames(t *testing.T)</a>

```
searchKey: template.TestBadFuncNames
tags: [private]
```

```Go
func TestBadFuncNames(t *testing.T)
```

### <a id="testBadFuncName" href="#testBadFuncName">func testBadFuncName(name string, t *testing.T)</a>

```
searchKey: template.testBadFuncName
tags: [private]
```

```Go
func testBadFuncName(name string, t *testing.T)
```

### <a id="TestBlock" href="#TestBlock">func TestBlock(t *testing.T)</a>

```
searchKey: template.TestBlock
tags: [private]
```

```Go
func TestBlock(t *testing.T)
```

### <a id="TestEvalFieldErrors" href="#TestEvalFieldErrors">func TestEvalFieldErrors(t *testing.T)</a>

```
searchKey: template.TestEvalFieldErrors
tags: [private]
```

```Go
func TestEvalFieldErrors(t *testing.T)
```

### <a id="TestMaxExecDepth" href="#TestMaxExecDepth">func TestMaxExecDepth(t *testing.T)</a>

```
searchKey: template.TestMaxExecDepth
tags: [private]
```

```Go
func TestMaxExecDepth(t *testing.T)
```

### <a id="TestAddrOfIndex" href="#TestAddrOfIndex">func TestAddrOfIndex(t *testing.T)</a>

```
searchKey: template.TestAddrOfIndex
tags: [private]
```

```Go
func TestAddrOfIndex(t *testing.T)
```

### <a id="TestInterfaceValues" href="#TestInterfaceValues">func TestInterfaceValues(t *testing.T)</a>

```
searchKey: template.TestInterfaceValues
tags: [private]
```

```Go
func TestInterfaceValues(t *testing.T)
```

### <a id="TestExecutePanicDuringCall" href="#TestExecutePanicDuringCall">func TestExecutePanicDuringCall(t *testing.T)</a>

```
searchKey: template.TestExecutePanicDuringCall
tags: [private]
```

```Go
func TestExecutePanicDuringCall(t *testing.T)
```

Check that panics during calls are recovered and returned as errors. 

### <a id="TestIssue31810" href="#TestIssue31810">func TestIssue31810(t *testing.T)</a>

```
searchKey: template.TestIssue31810
tags: [private]
```

```Go
func TestIssue31810(t *testing.T)
```

Issue 31810. Check that a parenthesized first argument behaves properly. 

### <a id="TestEscapeRace" href="#TestEscapeRace">func TestEscapeRace(t *testing.T)</a>

```
searchKey: template.TestEscapeRace
tags: [private]
```

```Go
func TestEscapeRace(t *testing.T)
```

### <a id="TestRecursiveExecute" href="#TestRecursiveExecute">func TestRecursiveExecute(t *testing.T)</a>

```
searchKey: template.TestRecursiveExecute
tags: [private]
```

```Go
func TestRecursiveExecute(t *testing.T)
```

### <a id="TestRecursiveExecuteViaMethod" href="#TestRecursiveExecuteViaMethod">func TestRecursiveExecuteViaMethod(t *testing.T)</a>

```
searchKey: template.TestRecursiveExecuteViaMethod
tags: [private]
```

```Go
func TestRecursiveExecuteViaMethod(t *testing.T)
```

### <a id="TestTemplateFuncsAfterClone" href="#TestTemplateFuncsAfterClone">func TestTemplateFuncsAfterClone(t *testing.T)</a>

```
searchKey: template.TestTemplateFuncsAfterClone
tags: [private]
```

```Go
func TestTemplateFuncsAfterClone(t *testing.T)
```

Issue 43295. 

### <a id="TestHTMLNospaceEscaper" href="#TestHTMLNospaceEscaper">func TestHTMLNospaceEscaper(t *testing.T)</a>

```
searchKey: template.TestHTMLNospaceEscaper
tags: [private]
```

```Go
func TestHTMLNospaceEscaper(t *testing.T)
```

### <a id="TestStripTags" href="#TestStripTags">func TestStripTags(t *testing.T)</a>

```
searchKey: template.TestStripTags
tags: [private]
```

```Go
func TestStripTags(t *testing.T)
```

### <a id="BenchmarkHTMLNospaceEscaper" href="#BenchmarkHTMLNospaceEscaper">func BenchmarkHTMLNospaceEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkHTMLNospaceEscaper
tags: [private]
```

```Go
func BenchmarkHTMLNospaceEscaper(b *testing.B)
```

### <a id="BenchmarkHTMLNospaceEscaperNoSpecials" href="#BenchmarkHTMLNospaceEscaperNoSpecials">func BenchmarkHTMLNospaceEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkHTMLNospaceEscaperNoSpecials
tags: [private]
```

```Go
func BenchmarkHTMLNospaceEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkStripTags" href="#BenchmarkStripTags">func BenchmarkStripTags(b *testing.B)</a>

```
searchKey: template.BenchmarkStripTags
tags: [private]
```

```Go
func BenchmarkStripTags(b *testing.B)
```

### <a id="BenchmarkStripTagsNoSpecials" href="#BenchmarkStripTagsNoSpecials">func BenchmarkStripTagsNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkStripTagsNoSpecials
tags: [private]
```

```Go
func BenchmarkStripTagsNoSpecials(b *testing.B)
```

### <a id="TestNextJsCtx" href="#TestNextJsCtx">func TestNextJsCtx(t *testing.T)</a>

```
searchKey: template.TestNextJsCtx
tags: [private]
```

```Go
func TestNextJsCtx(t *testing.T)
```

### <a id="TestJSValEscaper" href="#TestJSValEscaper">func TestJSValEscaper(t *testing.T)</a>

```
searchKey: template.TestJSValEscaper
tags: [private]
```

```Go
func TestJSValEscaper(t *testing.T)
```

### <a id="TestJSStrEscaper" href="#TestJSStrEscaper">func TestJSStrEscaper(t *testing.T)</a>

```
searchKey: template.TestJSStrEscaper
tags: [private]
```

```Go
func TestJSStrEscaper(t *testing.T)
```

### <a id="TestJSRegexpEscaper" href="#TestJSRegexpEscaper">func TestJSRegexpEscaper(t *testing.T)</a>

```
searchKey: template.TestJSRegexpEscaper
tags: [private]
```

```Go
func TestJSRegexpEscaper(t *testing.T)
```

### <a id="TestEscapersOnLower7AndSelectHighCodepoints" href="#TestEscapersOnLower7AndSelectHighCodepoints">func TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T)</a>

```
searchKey: template.TestEscapersOnLower7AndSelectHighCodepoints
tags: [private]
```

```Go
func TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T)
```

### <a id="TestIsJsMimeType" href="#TestIsJsMimeType">func TestIsJsMimeType(t *testing.T)</a>

```
searchKey: template.TestIsJsMimeType
tags: [private]
```

```Go
func TestIsJsMimeType(t *testing.T)
```

### <a id="BenchmarkJSValEscaperWithNum" href="#BenchmarkJSValEscaperWithNum">func BenchmarkJSValEscaperWithNum(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithNum
tags: [private]
```

```Go
func BenchmarkJSValEscaperWithNum(b *testing.B)
```

### <a id="BenchmarkJSValEscaperWithStr" href="#BenchmarkJSValEscaperWithStr">func BenchmarkJSValEscaperWithStr(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithStr
tags: [private]
```

```Go
func BenchmarkJSValEscaperWithStr(b *testing.B)
```

### <a id="BenchmarkJSValEscaperWithStrNoSpecials" href="#BenchmarkJSValEscaperWithStrNoSpecials">func BenchmarkJSValEscaperWithStrNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithStrNoSpecials
tags: [private]
```

```Go
func BenchmarkJSValEscaperWithStrNoSpecials(b *testing.B)
```

### <a id="BenchmarkJSValEscaperWithObj" href="#BenchmarkJSValEscaperWithObj">func BenchmarkJSValEscaperWithObj(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithObj
tags: [private]
```

```Go
func BenchmarkJSValEscaperWithObj(b *testing.B)
```

### <a id="BenchmarkJSValEscaperWithObjNoSpecials" href="#BenchmarkJSValEscaperWithObjNoSpecials">func BenchmarkJSValEscaperWithObjNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkJSValEscaperWithObjNoSpecials
tags: [private]
```

```Go
func BenchmarkJSValEscaperWithObjNoSpecials(b *testing.B)
```

### <a id="BenchmarkJSStrEscaperNoSpecials" href="#BenchmarkJSStrEscaperNoSpecials">func BenchmarkJSStrEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkJSStrEscaperNoSpecials
tags: [private]
```

```Go
func BenchmarkJSStrEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkJSStrEscaper" href="#BenchmarkJSStrEscaper">func BenchmarkJSStrEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkJSStrEscaper
tags: [private]
```

```Go
func BenchmarkJSStrEscaper(b *testing.B)
```

### <a id="BenchmarkJSRegexpEscaperNoSpecials" href="#BenchmarkJSRegexpEscaperNoSpecials">func BenchmarkJSRegexpEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkJSRegexpEscaperNoSpecials
tags: [private]
```

```Go
func BenchmarkJSRegexpEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkJSRegexpEscaper" href="#BenchmarkJSRegexpEscaper">func BenchmarkJSRegexpEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkJSRegexpEscaper
tags: [private]
```

```Go
func BenchmarkJSRegexpEscaper(b *testing.B)
```

### <a id="TestMultiExecute" href="#TestMultiExecute">func TestMultiExecute(t *testing.T)</a>

```
searchKey: template.TestMultiExecute
tags: [private]
```

```Go
func TestMultiExecute(t *testing.T)
```

### <a id="TestParseFiles" href="#TestParseFiles">func TestParseFiles(t *testing.T)</a>

```
searchKey: template.TestParseFiles
tags: [private]
```

```Go
func TestParseFiles(t *testing.T)
```

### <a id="TestParseGlob" href="#TestParseGlob">func TestParseGlob(t *testing.T)</a>

```
searchKey: template.TestParseGlob
tags: [private]
```

```Go
func TestParseGlob(t *testing.T)
```

### <a id="TestParseFS" href="#TestParseFS">func TestParseFS(t *testing.T)</a>

```
searchKey: template.TestParseFS
tags: [private]
```

```Go
func TestParseFS(t *testing.T)
```

### <a id="TestParseFilesWithData" href="#TestParseFilesWithData">func TestParseFilesWithData(t *testing.T)</a>

```
searchKey: template.TestParseFilesWithData
tags: [private]
```

```Go
func TestParseFilesWithData(t *testing.T)
```

### <a id="TestParseGlobWithData" href="#TestParseGlobWithData">func TestParseGlobWithData(t *testing.T)</a>

```
searchKey: template.TestParseGlobWithData
tags: [private]
```

```Go
func TestParseGlobWithData(t *testing.T)
```

### <a id="TestParseZipFS" href="#TestParseZipFS">func TestParseZipFS(t *testing.T)</a>

```
searchKey: template.TestParseZipFS
tags: [private]
```

```Go
func TestParseZipFS(t *testing.T)
```

### <a id="TestAddParseTreeToUnparsedTemplate" href="#TestAddParseTreeToUnparsedTemplate">func TestAddParseTreeToUnparsedTemplate(t *testing.T)</a>

```
searchKey: template.TestAddParseTreeToUnparsedTemplate
tags: [private]
```

```Go
func TestAddParseTreeToUnparsedTemplate(t *testing.T)
```

Issue 7032 

### <a id="TestRedefinition" href="#TestRedefinition">func TestRedefinition(t *testing.T)</a>

```
searchKey: template.TestRedefinition
tags: [private]
```

```Go
func TestRedefinition(t *testing.T)
```

### <a id="TestEmptyTemplateCloneCrash" href="#TestEmptyTemplateCloneCrash">func TestEmptyTemplateCloneCrash(t *testing.T)</a>

```
searchKey: template.TestEmptyTemplateCloneCrash
tags: [private]
```

```Go
func TestEmptyTemplateCloneCrash(t *testing.T)
```

Issue 10879 

### <a id="TestTemplateLookUp" href="#TestTemplateLookUp">func TestTemplateLookUp(t *testing.T)</a>

```
searchKey: template.TestTemplateLookUp
tags: [private]
```

```Go
func TestTemplateLookUp(t *testing.T)
```

Issue 10910, 10926 

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: template.TestParse
tags: [private]
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestEmptyTemplate" href="#TestEmptyTemplate">func TestEmptyTemplate(t *testing.T)</a>

```
searchKey: template.TestEmptyTemplate
tags: [private]
```

```Go
func TestEmptyTemplate(t *testing.T)
```

### <a id="TestIssue19294" href="#TestIssue19294">func TestIssue19294(t *testing.T)</a>

```
searchKey: template.TestIssue19294
tags: [private]
```

```Go
func TestIssue19294(t *testing.T)
```

Issue 19249 was a regression in 1.8 caused by the handling of empty templates added in that release, which got different answers depending on the order templates appeared in the internal map. 

### <a id="TestFindEndTag" href="#TestFindEndTag">func TestFindEndTag(t *testing.T)</a>

```
searchKey: template.TestFindEndTag
tags: [private]
```

```Go
func TestFindEndTag(t *testing.T)
```

### <a id="BenchmarkTemplateSpecialTags" href="#BenchmarkTemplateSpecialTags">func BenchmarkTemplateSpecialTags(b *testing.B)</a>

```
searchKey: template.BenchmarkTemplateSpecialTags
tags: [private]
```

```Go
func BenchmarkTemplateSpecialTags(b *testing.B)
```

### <a id="TestURLNormalizer" href="#TestURLNormalizer">func TestURLNormalizer(t *testing.T)</a>

```
searchKey: template.TestURLNormalizer
tags: [private]
```

```Go
func TestURLNormalizer(t *testing.T)
```

### <a id="TestURLFilters" href="#TestURLFilters">func TestURLFilters(t *testing.T)</a>

```
searchKey: template.TestURLFilters
tags: [private]
```

```Go
func TestURLFilters(t *testing.T)
```

### <a id="TestSrcsetFilter" href="#TestSrcsetFilter">func TestSrcsetFilter(t *testing.T)</a>

```
searchKey: template.TestSrcsetFilter
tags: [private]
```

```Go
func TestSrcsetFilter(t *testing.T)
```

### <a id="BenchmarkURLEscaper" href="#BenchmarkURLEscaper">func BenchmarkURLEscaper(b *testing.B)</a>

```
searchKey: template.BenchmarkURLEscaper
tags: [private]
```

```Go
func BenchmarkURLEscaper(b *testing.B)
```

### <a id="BenchmarkURLEscaperNoSpecials" href="#BenchmarkURLEscaperNoSpecials">func BenchmarkURLEscaperNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkURLEscaperNoSpecials
tags: [private]
```

```Go
func BenchmarkURLEscaperNoSpecials(b *testing.B)
```

### <a id="BenchmarkURLNormalizer" href="#BenchmarkURLNormalizer">func BenchmarkURLNormalizer(b *testing.B)</a>

```
searchKey: template.BenchmarkURLNormalizer
tags: [private]
```

```Go
func BenchmarkURLNormalizer(b *testing.B)
```

### <a id="BenchmarkURLNormalizerNoSpecials" href="#BenchmarkURLNormalizerNoSpecials">func BenchmarkURLNormalizerNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkURLNormalizerNoSpecials
tags: [private]
```

```Go
func BenchmarkURLNormalizerNoSpecials(b *testing.B)
```

### <a id="BenchmarkSrcsetFilter" href="#BenchmarkSrcsetFilter">func BenchmarkSrcsetFilter(b *testing.B)</a>

```
searchKey: template.BenchmarkSrcsetFilter
tags: [private]
```

```Go
func BenchmarkSrcsetFilter(b *testing.B)
```

### <a id="BenchmarkSrcsetFilterNoSpecials" href="#BenchmarkSrcsetFilterNoSpecials">func BenchmarkSrcsetFilterNoSpecials(b *testing.B)</a>

```
searchKey: template.BenchmarkSrcsetFilterNoSpecials
tags: [private]
```

```Go
func BenchmarkSrcsetFilterNoSpecials(b *testing.B)
```

