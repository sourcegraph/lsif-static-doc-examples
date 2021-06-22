# Package template

Package template implements data-driven templates for generating textual output. 

To generate HTML output, see package html/template, which has the same interface as this package but automatically secures HTML output against certain attacks. 

Templates are executed by applying them to a data structure. Annotations in the template refer to elements of the data structure (typically a field of a struct or a key in a map) to control execution and derive values to be displayed. Execution of the template walks the structure and sets the cursor, represented by a period '.' and called "dot", to the value at the current location in the structure as execution proceeds. 

The input text for a template is UTF-8-encoded text in any format. "Actions"--data evaluations or control structures--are delimited by "{{" and "}}"; all text outside actions is copied to the output unchanged. Except for raw strings, actions may not span newlines, although comments can. 

Once parsed, a template may be executed safely in parallel, although if parallel executions share a Writer the output may be interleaved. 

Here is a trivial example that prints "17 items are made of wool". 

```
type Inventory struct {
	Material string
	Count    uint
}
sweaters := Inventory{"wool", 17}
tmpl, err := template.New("test").Parse("{{.Count}} items are made of {{.Material}}")
if err != nil { panic(err) }
err = tmpl.Execute(os.Stdout, sweaters)
if err != nil { panic(err) }

```
More intricate examples appear below. 

### hdr-Text_and_spacesText and spaces
By default, all text between actions is copied verbatim when the template is executed. For example, the string " items are made of " in the example above appears on standard output when the program is run. 

However, to aid in formatting template source code, if an action's left delimiter (by default "{{") is followed immediately by a minus sign and white space, all trailing white space is trimmed from the immediately preceding text. Similarly, if the right delimiter ("}}") is preceded by white space and a minus sign, all leading white space is trimmed from the immediately following text. In these trim markers, the white space must be present: "{{- 3}}" is like "{{3}}" but trims the immediately preceding text, while "{{-3}}" parses as an action containing the number -3. 

For instance, when executing the template whose source is 

```
"{{23 -}} < {{- 45}}"

```
the generated output would be 

```
"23<45"

```
For this trimming, the definition of white space characters is the same as in Go: space, horizontal tab, carriage return, and newline. 

### hdr-ActionsActions
Here is the list of actions. "Arguments" and "pipelines" are evaluations of data, defined in detail in the corresponding sections that follow. 

```
{{/* a comment */}}
{{- /* a comment with white space trimmed from preceding and following text */ -}}
	A comment; discarded. May contain newlines.
	Comments do not nest and must start and end at the
	delimiters, as shown here.

{{pipeline}}
	The default textual representation (the same as would be
	printed by fmt.Print) of the value of the pipeline is copied
	to the output.

{{if pipeline}} T1 {{end}}
	If the value of the pipeline is empty, no output is generated;
	otherwise, T1 is executed. The empty values are false, 0, any
	nil pointer or interface value, and any array, slice, map, or
	string of length zero.
	Dot is unaffected.

{{if pipeline}} T1 {{else}} T0 {{end}}
	If the value of the pipeline is empty, T0 is executed;
	otherwise, T1 is executed. Dot is unaffected.

{{if pipeline}} T1 {{else if pipeline}} T0 {{end}}
	To simplify the appearance of if-else chains, the else action
	of an if may include another if directly; the effect is exactly
	the same as writing
		{{if pipeline}} T1 {{else}}{{if pipeline}} T0 {{end}}{{end}}

{{range pipeline}} T1 {{end}}
	The value of the pipeline must be an array, slice, map, or channel.
	If the value of the pipeline has length zero, nothing is output;
	otherwise, dot is set to the successive elements of the array,
	slice, or map and T1 is executed. If the value is a map and the
	keys are of basic type with a defined order, the elements will be
	visited in sorted key order.

{{range pipeline}} T1 {{else}} T0 {{end}}
	The value of the pipeline must be an array, slice, map, or channel.
	If the value of the pipeline has length zero, dot is unaffected and
	T0 is executed; otherwise, dot is set to the successive elements
	of the array, slice, or map and T1 is executed.

{{template "name"}}
	The template with the specified name is executed with nil data.

{{template "name" pipeline}}
	The template with the specified name is executed with dot set
	to the value of the pipeline.

{{block "name" pipeline}} T1 {{end}}
	A block is shorthand for defining a template
		{{define "name"}} T1 {{end}}
	and then executing it in place
		{{template "name" pipeline}}
	The typical use is to define a set of root templates that are
	then customized by redefining the block templates within.

{{with pipeline}} T1 {{end}}
	If the value of the pipeline is empty, no output is generated;
	otherwise, dot is set to the value of the pipeline and T1 is
	executed.

{{with pipeline}} T1 {{else}} T0 {{end}}
	If the value of the pipeline is empty, dot is unaffected and T0
	is executed; otherwise, dot is set to the value of the pipeline
	and T1 is executed.

```
### hdr-ArgumentsArguments
An argument is a simple value, denoted by one of the following. 

```
- A boolean, string, character, integer, floating-point, imaginary
  or complex constant in Go syntax. These behave like Go's untyped
  constants. Note that, as in Go, whether a large integer constant
  overflows when assigned or passed to a function can depend on whether
  the host machine's ints are 32 or 64 bits.
- The keyword nil, representing an untyped Go nil.
- The character '.' (period):
	.
  The result is the value of dot.
- A variable name, which is a (possibly empty) alphanumeric string
  preceded by a dollar sign, such as
	$piOver2
  or
	$
  The result is the value of the variable.
  Variables are described below.
- The name of a field of the data, which must be a struct, preceded
  by a period, such as
	.Field
  The result is the value of the field. Field invocations may be
  chained:
    .Field1.Field2
  Fields can also be evaluated on variables, including chaining:
    $x.Field1.Field2
- The name of a key of the data, which must be a map, preceded
  by a period, such as
	.Key
  The result is the map element value indexed by the key.
  Key invocations may be chained and combined with fields to any
  depth:
    .Field1.Key1.Field2.Key2
  Although the key must be an alphanumeric identifier, unlike with
  field names they do not need to start with an upper case letter.
  Keys can also be evaluated on variables, including chaining:
    $x.key1.key2
- The name of a niladic method of the data, preceded by a period,
  such as
	.Method
  The result is the value of invoking the method with dot as the
  receiver, dot.Method(). Such a method must have one return value (of
  any type) or two return values, the second of which is an error.
  If it has two and the returned error is non-nil, execution terminates
  and an error is returned to the caller as the value of Execute.
  Method invocations may be chained and combined with fields and keys
  to any depth:
    .Field1.Key1.Method1.Field2.Key2.Method2
  Methods can also be evaluated on variables, including chaining:
    $x.Method1.Field
- The name of a niladic function, such as
	fun
  The result is the value of invoking the function, fun(). The return
  types and values behave as in methods. Functions and function
  names are described below.
- A parenthesized instance of one the above, for grouping. The result
  may be accessed by a field or map key invocation.
	print (.F1 arg1) (.F2 arg2)
	(.StructValuedMethod "arg").Field

```
Arguments may evaluate to any type; if they are pointers the implementation automatically indirects to the base type when required. If an evaluation yields a function value, such as a function-valued field of a struct, the function is not invoked automatically, but it can be used as a truth value for an if action and the like. To invoke it, use the call function, defined below. 

### hdr-PipelinesPipelines
A pipeline is a possibly chained sequence of "commands". A command is a simple value (argument) or a function or method call, possibly with multiple arguments: 

```
Argument
	The result is the value of evaluating the argument.
.Method [Argument...]
	The method can be alone or the last element of a chain but,
	unlike methods in the middle of a chain, it can take arguments.
	The result is the value of calling the method with the
	arguments:
		dot.Method(Argument1, etc.)
functionName [Argument...]
	The result is the value of calling the function associated
	with the name:
		function(Argument1, etc.)
	Functions and function names are described below.

```
A pipeline may be "chained" by separating a sequence of commands with pipeline characters '|'. In a chained pipeline, the result of each command is passed as the last argument of the following command. The output of the final command in the pipeline is the value of the pipeline. 

The output of a command will be either one value or two values, the second of which has type error. If that second value is present and evaluates to non-nil, execution terminates and the error is returned to the caller of Execute. 

### hdr-VariablesVariables
A pipeline inside an action may initialize a variable to capture the result. The initialization has syntax 

```
$variable := pipeline

```
where $variable is the name of the variable. An action that declares a variable produces no output. 

Variables previously declared can also be assigned, using the syntax 

```
$variable = pipeline

```
If a "range" action initializes a variable, the variable is set to the successive elements of the iteration. Also, a "range" may declare two variables, separated by a comma: 

```
range $index, $element := pipeline

```
in which case $index and $element are set to the successive values of the array/slice index or map key and element, respectively. Note that if there is only one variable, it is assigned the element; this is opposite to the convention in Go range clauses. 

A variable's scope extends to the "end" action of the control structure ("if", "with", or "range") in which it is declared, or to the end of the template if there is no such control structure. A template invocation does not inherit variables from the point of its invocation. 

When execution begins, $ is set to the data argument passed to Execute, that is, to the starting value of dot. 

### hdr-ExamplesExamples
Here are some example one-line templates demonstrating pipelines and variables. All produce the quoted word "output": 

```
{{"\"output\""}}
	A string constant.
{{`"output"`}}
	A raw string constant.
{{printf "%q" "output"}}
	A function call.
{{"output" | printf "%q"}}
	A function call whose final argument comes from the previous
	command.
{{printf "%q" (print "out" "put")}}
	A parenthesized argument.
{{"put" | printf "%s%s" "out" | printf "%q"}}
	A more elaborate call.
{{"output" | printf "%s" | printf "%q"}}
	A longer chain.
{{with "output"}}{{printf "%q" .}}{{end}}
	A with action using dot.
{{with $x := "output" | printf "%q"}}{{$x}}{{end}}
	A with action that creates and uses a variable.
{{with $x := "output"}}{{printf "%q" $x}}{{end}}
	A with action that uses the variable in another action.
{{with $x := "output"}}{{$x | printf "%q"}}{{end}}
	The same, but pipelined.

```
### hdr-FunctionsFunctions
During execution functions are found in two function maps: first in the template, then in the global function map. By default, no functions are defined in the template but the Funcs method can be used to add them. 

Predefined global functions are named as follows. 

```
and
	Returns the boolean AND of its arguments by returning the
	first empty argument or the last argument, that is,
	"and x y" behaves as "if x then y else x". All the
	arguments are evaluated.
call
	Returns the result of calling the first argument, which
	must be a function, with the remaining arguments as parameters.
	Thus "call .X.Y 1 2" is, in Go notation, dot.X.Y(1, 2) where
	Y is a func-valued field, map entry, or the like.
	The first argument must be the result of an evaluation
	that yields a value of function type (as distinct from
	a predefined function such as print). The function must
	return either one or two result values, the second of which
	is of type error. If the arguments don't match the function
	or the returned error value is non-nil, execution stops.
html
	Returns the escaped HTML equivalent of the textual
	representation of its arguments. This function is unavailable
	in html/template, with a few exceptions.
index
	Returns the result of indexing its first argument by the
	following arguments. Thus "index x 1 2 3" is, in Go syntax,
	x[1][2][3]. Each indexed item must be a map, slice, or array.
slice
	slice returns the result of slicing its first argument by the
	remaining arguments. Thus "slice x 1 2" is, in Go syntax, x[1:2],
	while "slice x" is x[:], "slice x 1" is x[1:], and "slice x 1 2 3"
	is x[1:2:3]. The first argument must be a string, slice, or array.
js
	Returns the escaped JavaScript equivalent of the textual
	representation of its arguments.
len
	Returns the integer length of its argument.
not
	Returns the boolean negation of its single argument.
or
	Returns the boolean OR of its arguments by returning the
	first non-empty argument or the last argument, that is,
	"or x y" behaves as "if x then x else y". All the
	arguments are evaluated.
print
	An alias for fmt.Sprint
printf
	An alias for fmt.Sprintf
println
	An alias for fmt.Sprintln
urlquery
	Returns the escaped value of the textual representation of
	its arguments in a form suitable for embedding in a URL query.
	This function is unavailable in html/template, with a few
	exceptions.

```
The boolean functions take any zero value to be false and a non-zero value to be true. 

There is also a set of binary comparison operators defined as functions: 

```
eq
	Returns the boolean truth of arg1 == arg2
ne
	Returns the boolean truth of arg1 != arg2
lt
	Returns the boolean truth of arg1 < arg2
le
	Returns the boolean truth of arg1 <= arg2
gt
	Returns the boolean truth of arg1 > arg2
ge
	Returns the boolean truth of arg1 >= arg2

```
For simpler multi-way equality tests, eq (only) accepts two or more arguments and compares the second and subsequent to the first, returning in effect 

```
arg1==arg2 || arg1==arg3 || arg1==arg4 ...

```
(Unlike with || in Go, however, eq is a function call and all the arguments will be evaluated.) 

The comparison functions work on any values whose type Go defines as comparable. For basic types such as integers, the rules are relaxed: size and exact type are ignored, so any integer value, signed or unsigned, may be compared with any other integer value. (The arithmetic value is compared, not the bit pattern, so all negative integers are less than all unsigned integers.) However, as usual, one may not compare an int with a float32 and so on. 

### hdr-Associated_templatesAssociated templates
Each template is named by a string specified when it is created. Also, each template is associated with zero or more other templates that it may invoke by name; such associations are transitive and form a name space of templates. 

A template may use a template invocation to instantiate another associated template; see the explanation of the "template" action above. The name must be that of a template associated with the template that contains the invocation. 

### hdr-Nested_template_definitionsNested template definitions
When parsing a template, another template may be defined and associated with the template being parsed. Template definitions must appear at the top level of the template, much like global variables in a Go program. 

The syntax of such definitions is to surround each template declaration with a "define" and "end" action. 

The define action names the template being created by providing a string constant. Here is a simple example: 

```
`{{define "T1"}}ONE{{end}}
{{define "T2"}}TWO{{end}}
{{define "T3"}}{{template "T1"}} {{template "T2"}}{{end}}
{{template "T3"}}`

```
This defines two templates, T1 and T2, and a third T3 that invokes the other two when it is executed. Finally it invokes T3. If executed this template will produce the text 

```
ONE TWO

```
By construction, a template may reside in only one association. If it's necessary to have a template addressable from multiple associations, the template definition must be parsed multiple times to create distinct *Template values, or must be copied with the Clone or AddParseTree method. 

Parse may be called multiple times to assemble the various associated templates; see the ParseFiles and ParseGlob functions and methods for simple ways to parse related templates stored in files. 

A template may be executed directly or through ExecuteTemplate, which executes an associated template identified by name. To invoke our example above, we might write, 

```
err := tmpl.Execute(os.Stdout, "no data needed")
if err != nil {
	log.Fatalf("execution failed: %s", err)
}

```
or to invoke a particular template explicitly by name, 

```
err := tmpl.ExecuteTemplate(os.Stdout, "T2", "no data needed")
if err != nil {
	log.Fatalf("execution failed: %s", err)
}

```
## Index

* Subpages
  * [text/template/parse](template/parse.md)
* [Constants](#const)
    * [const invalidKind](#invalidKind)
    * [const boolKind](#boolKind)
    * [const complexKind](#complexKind)
    * [const intKind](#intKind)
    * [const floatKind](#floatKind)
    * [const stringKind](#stringKind)
    * [const uintKind](#uintKind)
    * [const mapInvalid](#mapInvalid)
    * [const mapZeroValue](#mapZeroValue)
    * [const mapError](#mapError)
    * [const execErrorText](#execErrorText)
    * [const treeTemplate](#treeTemplate)
    * [const testTemplates](#testTemplates)
    * [const alwaysErrorText](#alwaysErrorText)
    * [const noError](#noError)
    * [const hasError](#hasError)
    * [const multiText1](#multiText1)
    * [const multiText2](#multiText2)
    * [const cloneText1](#cloneText1)
    * [const cloneText2](#cloneText2)
    * [const cloneText3](#cloneText3)
    * [const cloneText4](#cloneText4)
* [Variables](#var)
    * [var maxExecDepth](#maxExecDepth)
    * [var zero](#zero)
    * [var missingVal](#missingVal)
    * [var errorType](#errorType)
    * [var fmtStringerType](#fmtStringerType)
    * [var reflectValueType](#reflectValueType)
    * [var builtinFuncsOnce](#builtinFuncsOnce)
    * [var errBadComparisonType](#errBadComparisonType)
    * [var errBadComparison](#errBadComparison)
    * [var errNoComparison](#errNoComparison)
    * [var htmlQuot](#htmlQuot)
    * [var htmlApos](#htmlApos)
    * [var htmlAmp](#htmlAmp)
    * [var htmlLt](#htmlLt)
    * [var htmlGt](#htmlGt)
    * [var htmlNull](#htmlNull)
    * [var jsLowUni](#jsLowUni)
    * [var hex](#hex)
    * [var jsBackslash](#jsBackslash)
    * [var jsApos](#jsApos)
    * [var jsQuot](#jsQuot)
    * [var jsLt](#jsLt)
    * [var jsGt](#jsGt)
    * [var jsAmp](#jsAmp)
    * [var jsEq](#jsEq)
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
    * [var multiParseTests](#multiParseTests)
    * [var multiExecTests](#multiExecTests)
    * [var templateFileExecTests](#templateFileExecTests)
* [Types](#type)
    * [type state struct](#state)
        * [func (s *state) push(name string, value reflect.Value)](#state.push)
        * [func (s *state) mark() int](#state.mark)
        * [func (s *state) pop(mark int)](#state.pop)
        * [func (s *state) setVar(name string, value reflect.Value)](#state.setVar)
        * [func (s *state) setTopVar(n int, value reflect.Value)](#state.setTopVar)
        * [func (s *state) varValue(name string) reflect.Value](#state.varValue)
        * [func (s *state) at(node parse.Node)](#state.at)
        * [func (s *state) errorf(format string, args ...interface{})](#state.errorf)
        * [func (s *state) writeError(err error)](#state.writeError)
        * [func (s *state) walk(dot reflect.Value, node parse.Node)](#state.walk)
        * [func (s *state) walkIfOrWith(typ parse.NodeType, dot reflect.Value, pipe *parse.PipeNode, list, elseList *parse.ListNode)](#state.walkIfOrWith)
        * [func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode)](#state.walkRange)
        * [func (s *state) walkTemplate(dot reflect.Value, t *parse.TemplateNode)](#state.walkTemplate)
        * [func (s *state) evalPipeline(dot reflect.Value, pipe *parse.PipeNode) (value reflect.Value)](#state.evalPipeline)
        * [func (s *state) notAFunction(args []parse.Node, final reflect.Value)](#state.notAFunction)
        * [func (s *state) evalCommand(dot reflect.Value, cmd *parse.CommandNode, final reflect.Value) reflect.Value](#state.evalCommand)
        * [func (s *state) idealConstant(constant *parse.NumberNode) reflect.Value](#state.idealConstant)
        * [func (s *state) evalFieldNode(dot reflect.Value, field *parse.FieldNode, args []parse.Node, final reflect.Value) reflect.Value](#state.evalFieldNode)
        * [func (s *state) evalChainNode(dot reflect.Value, chain *parse.ChainNode, args []parse.Node, final reflect.Value) reflect.Value](#state.evalChainNode)
        * [func (s *state) evalVariableNode(dot reflect.Value, variable *parse.VariableNode, args []parse.Node, final reflect.Value) reflect.Value](#state.evalVariableNode)
        * [func (s *state) evalFieldChain(dot, receiver reflect.Value, node parse.Node, ident []string, args []parse.Node, final reflect.Value) reflect.Value](#state.evalFieldChain)
        * [func (s *state) evalFunction(dot reflect.Value, node *parse.IdentifierNode, cmd parse.Node, args []parse.Node, final reflect.Value) reflect.Value](#state.evalFunction)
        * [func (s *state) evalField(dot reflect.Value, fieldName string, node parse.Node, args []parse.Node, final, receiver reflect.Value) reflect.Value](#state.evalField)
        * [func (s *state) evalCall(dot, fun reflect.Value, node parse.Node, name string, args []parse.Node, final reflect.Value) reflect.Value](#state.evalCall)
        * [func (s *state) validateType(value reflect.Value, typ reflect.Type) reflect.Value](#state.validateType)
        * [func (s *state) evalArg(dot reflect.Value, typ reflect.Type, n parse.Node) reflect.Value](#state.evalArg)
        * [func (s *state) evalBool(typ reflect.Type, n parse.Node) reflect.Value](#state.evalBool)
        * [func (s *state) evalString(typ reflect.Type, n parse.Node) reflect.Value](#state.evalString)
        * [func (s *state) evalInteger(typ reflect.Type, n parse.Node) reflect.Value](#state.evalInteger)
        * [func (s *state) evalUnsignedInteger(typ reflect.Type, n parse.Node) reflect.Value](#state.evalUnsignedInteger)
        * [func (s *state) evalFloat(typ reflect.Type, n parse.Node) reflect.Value](#state.evalFloat)
        * [func (s *state) evalComplex(typ reflect.Type, n parse.Node) reflect.Value](#state.evalComplex)
        * [func (s *state) evalEmptyInterface(dot reflect.Value, n parse.Node) reflect.Value](#state.evalEmptyInterface)
        * [func (s *state) printValue(n parse.Node, v reflect.Value)](#state.printValue)
    * [type variable struct](#variable)
    * [type missingValType struct{}](#missingValType)
    * [type ExecError struct](#ExecError)
        * [func (e ExecError) Error() string](#ExecError.Error)
        * [func (e ExecError) Unwrap() error](#ExecError.Unwrap)
    * [type writeError struct](#writeError)
    * [type FuncMap map[string]interface{}](#FuncMap)
        * [func builtins() FuncMap](#builtins)
    * [type kind int](#kind)
        * [func basicKind(v reflect.Value) (kind, error)](#basicKind)
    * [type missingKeyAction int](#missingKeyAction)
    * [type option struct](#option)
    * [type common struct](#common)
    * [type Template struct](#Template)
        * [func Must(t *Template, err error) *Template](#Must)
        * [func ParseFiles(filenames ...string) (*Template, error)](#ParseFiles)
        * [func parseFiles(t *Template, readFile func(string) (string, []byte, error), filenames ...string) (*Template, error)](#parseFiles)
        * [func ParseGlob(pattern string) (*Template, error)](#ParseGlob)
        * [func parseGlob(t *Template, pattern string) (*Template, error)](#parseGlob)
        * [func ParseFS(fsys fs.FS, patterns ...string) (*Template, error)](#ParseFS)
        * [func parseFS(t *Template, fsys fs.FS, patterns []string) (*Template, error)](#parseFS)
        * [func New(name string) *Template](#New)
        * [func (t *Template) ExecuteTemplate(wr io.Writer, name string, data interface{}) error](#Template.ExecuteTemplate)
        * [func (t *Template) Execute(wr io.Writer, data interface{}) error](#Template.Execute)
        * [func (t *Template) execute(wr io.Writer, data interface{}) (err error)](#Template.execute)
        * [func (t *Template) DefinedTemplates() string](#Template.DefinedTemplates)
        * [func (t *Template) ParseFiles(filenames ...string) (*Template, error)](#Template.ParseFiles)
        * [func (t *Template) ParseGlob(pattern string) (*Template, error)](#Template.ParseGlob)
        * [func (t *Template) ParseFS(fsys fs.FS, patterns ...string) (*Template, error)](#Template.ParseFS)
        * [func (t *Template) Option(opt ...string) *Template](#Template.Option)
        * [func (t *Template) setOption(opt string)](#Template.setOption)
        * [func (t *Template) Name() string](#Template.Name)
        * [func (t *Template) New(name string) *Template](#Template.New)
        * [func (t *Template) init()](#Template.init)
        * [func (t *Template) Clone() (*Template, error)](#Template.Clone)
        * [func (t *Template) copy(c *common) *Template](#Template.copy)
        * [func (t *Template) AddParseTree(name string, tree *parse.Tree) (*Template, error)](#Template.AddParseTree)
        * [func (t *Template) Templates() []*Template](#Template.Templates)
        * [func (t *Template) Delims(left, right string) *Template](#Template.Delims)
        * [func (t *Template) Funcs(funcMap FuncMap) *Template](#Template.Funcs)
        * [func (t *Template) Lookup(name string) *Template](#Template.Lookup)
        * [func (t *Template) Parse(text string) (*Template, error)](#Template.Parse)
        * [func (t *Template) associate(new *Template, tree *parse.Tree) bool](#Template.associate)
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
    * [type CustomError struct{}](#CustomError)
        * [func (*CustomError) Error() string](#CustomError.Error)
    * [type Tree struct](#Tree)
    * [type cmpTest struct](#cmpTest)
    * [type ErrorWriter int](#ErrorWriter)
        * [func (e ErrorWriter) Write(p []byte) (int, error)](#ErrorWriter.Write)
    * [type multiParseTest struct](#multiParseTest)
* [Functions](#func)
    * [func initMaxExecDepth() int](#initMaxExecDepth)
    * [func doublePercent(str string) string](#doublePercent)
    * [func errRecover(errp *error)](#errRecover)
    * [func IsTrue(val interface{}) (truth, ok bool)](#IsTrue)
    * [func isTrue(val reflect.Value) (truth, ok bool)](#isTrue)
    * [func isRuneInt(s string) bool](#isRuneInt)
    * [func isHexInt(s string) bool](#isHexInt)
    * [func canBeNil(typ reflect.Type) bool](#canBeNil)
    * [func indirect(v reflect.Value) (rv reflect.Value, isNil bool)](#indirect)
    * [func indirectInterface(v reflect.Value) reflect.Value](#indirectInterface)
    * [func printableValue(v reflect.Value) (interface{}, bool)](#printableValue)
    * [func builtinFuncs() map[string]reflect.Value](#builtinFuncs)
    * [func createValueFuncs(funcMap FuncMap) map[string]reflect.Value](#createValueFuncs)
    * [func addValueFuncs(out map[string]reflect.Value, in FuncMap)](#addValueFuncs)
    * [func addFuncs(out, in FuncMap)](#addFuncs)
    * [func goodFunc(typ reflect.Type) bool](#goodFunc)
    * [func goodName(name string) bool](#goodName)
    * [func findFunction(name string, tmpl *Template) (reflect.Value, bool)](#findFunction)
    * [func prepareArg(value reflect.Value, argType reflect.Type) (reflect.Value, error)](#prepareArg)
    * [func intLike(typ reflect.Kind) bool](#intLike)
    * [func indexArg(index reflect.Value, cap int) (int, error)](#indexArg)
    * [func index(item reflect.Value, indexes ...reflect.Value) (reflect.Value, error)](#index)
    * [func slice(item reflect.Value, indexes ...reflect.Value) (reflect.Value, error)](#slice)
    * [func length(item reflect.Value) (int, error)](#length)
    * [func call(fn reflect.Value, args ...reflect.Value) (reflect.Value, error)](#call)
    * [func safeCall(fun reflect.Value, args []reflect.Value) (val reflect.Value, err error)](#safeCall)
    * [func truth(arg reflect.Value) bool](#truth)
    * [func and(arg0 reflect.Value, args ...reflect.Value) reflect.Value](#and)
    * [func or(arg0 reflect.Value, args ...reflect.Value) reflect.Value](#or)
    * [func not(arg reflect.Value) bool](#not)
    * [func eq(arg1 reflect.Value, arg2 ...reflect.Value) (bool, error)](#eq)
    * [func ne(arg1, arg2 reflect.Value) (bool, error)](#ne)
    * [func lt(arg1, arg2 reflect.Value) (bool, error)](#lt)
    * [func le(arg1, arg2 reflect.Value) (bool, error)](#le)
    * [func gt(arg1, arg2 reflect.Value) (bool, error)](#gt)
    * [func ge(arg1, arg2 reflect.Value) (bool, error)](#ge)
    * [func HTMLEscape(w io.Writer, b []byte)](#HTMLEscape)
    * [func HTMLEscapeString(s string) string](#HTMLEscapeString)
    * [func HTMLEscaper(args ...interface{}) string](#HTMLEscaper)
    * [func JSEscape(w io.Writer, b []byte)](#JSEscape)
    * [func JSEscapeString(s string) string](#JSEscapeString)
    * [func jsIsSpecial(r rune) bool](#jsIsSpecial)
    * [func JSEscaper(args ...interface{}) string](#JSEscaper)
    * [func URLQueryEscaper(args ...interface{}) string](#URLQueryEscaper)
    * [func evalArgs(args []interface{}) string](#evalArgs)
    * [func readFileOS(file string) (name string, b []byte, err error)](#readFileOS)
    * [func readFileFS(fsys fs.FS) func(string) (string, []byte, error)](#readFileFS)
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
    * [func TestExecError_CustomError(t *testing.T)](#TestExecError_CustomError)
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
    * [func TestIssue43065(t *testing.T)](#TestIssue43065)
    * [func TestIssue39807(t *testing.T)](#TestIssue39807)
    * [func TestMultiParse(t *testing.T)](#TestMultiParse)
    * [func TestMultiExecute(t *testing.T)](#TestMultiExecute)
    * [func TestParseFiles(t *testing.T)](#TestParseFiles)
    * [func TestParseGlob(t *testing.T)](#TestParseGlob)
    * [func TestParseFS(t *testing.T)](#TestParseFS)
    * [func TestParseFilesWithData(t *testing.T)](#TestParseFilesWithData)
    * [func TestParseGlobWithData(t *testing.T)](#TestParseGlobWithData)
    * [func TestClone(t *testing.T)](#TestClone)
    * [func TestAddParseTree(t *testing.T)](#TestAddParseTree)
    * [func TestAddParseTreeToUnparsedTemplate(t *testing.T)](#TestAddParseTreeToUnparsedTemplate)
    * [func TestRedefinition(t *testing.T)](#TestRedefinition)
    * [func TestEmptyTemplateCloneCrash(t *testing.T)](#TestEmptyTemplateCloneCrash)
    * [func TestTemplateLookUp(t *testing.T)](#TestTemplateLookUp)
    * [func TestNew(t *testing.T)](#TestNew)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestEmptyTemplate(t *testing.T)](#TestEmptyTemplate)
    * [func TestIssue19294(t *testing.T)](#TestIssue19294)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="invalidKind" href="#invalidKind">const invalidKind</a>

```
searchKey: template.invalidKind
```

```Go
const invalidKind kind = iota
```

### <a id="boolKind" href="#boolKind">const boolKind</a>

```
searchKey: template.boolKind
```

```Go
const boolKind
```

### <a id="complexKind" href="#complexKind">const complexKind</a>

```
searchKey: template.complexKind
```

```Go
const complexKind
```

### <a id="intKind" href="#intKind">const intKind</a>

```
searchKey: template.intKind
```

```Go
const intKind
```

### <a id="floatKind" href="#floatKind">const floatKind</a>

```
searchKey: template.floatKind
```

```Go
const floatKind
```

### <a id="stringKind" href="#stringKind">const stringKind</a>

```
searchKey: template.stringKind
```

```Go
const stringKind
```

### <a id="uintKind" href="#uintKind">const uintKind</a>

```
searchKey: template.uintKind
```

```Go
const uintKind
```

### <a id="mapInvalid" href="#mapInvalid">const mapInvalid</a>

```
searchKey: template.mapInvalid
```

```Go
const mapInvalid missingKeyAction = iota // Return an invalid reflect.Value.

```

### <a id="mapZeroValue" href="#mapZeroValue">const mapZeroValue</a>

```
searchKey: template.mapZeroValue
```

```Go
const mapZeroValue // Return the zero value for the map element.

```

### <a id="mapError" href="#mapError">const mapError</a>

```
searchKey: template.mapError
```

```Go
const mapError // Error out

```

### <a id="execErrorText" href="#execErrorText">const execErrorText</a>

```
searchKey: template.execErrorText
```

```Go
const execErrorText = ...
```

### <a id="treeTemplate" href="#treeTemplate">const treeTemplate</a>

```
searchKey: template.treeTemplate
```

```Go
const treeTemplate = ...
```

Use different delimiters to test Set.Delims. Also test the trimming of leading and trailing spaces. 

### <a id="testTemplates" href="#testTemplates">const testTemplates</a>

```
searchKey: template.testTemplates
```

```Go
const testTemplates = `{{define "one"}}one{{end}}{{define "two"}}two{{end}}`
```

### <a id="alwaysErrorText" href="#alwaysErrorText">const alwaysErrorText</a>

```
searchKey: template.alwaysErrorText
```

```Go
const alwaysErrorText = "always be failing"
```

### <a id="noError" href="#noError">const noError</a>

```
searchKey: template.noError
```

```Go
const noError = true
```

### <a id="hasError" href="#hasError">const hasError</a>

```
searchKey: template.hasError
```

```Go
const hasError = false
```

### <a id="multiText1" href="#multiText1">const multiText1</a>

```
searchKey: template.multiText1
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
```

```Go
const cloneText1 = `{{define "a"}}{{template "b"}}{{template "c"}}{{end}}`
```

### <a id="cloneText2" href="#cloneText2">const cloneText2</a>

```
searchKey: template.cloneText2
```

```Go
const cloneText2 = `{{define "b"}}b{{end}}`
```

### <a id="cloneText3" href="#cloneText3">const cloneText3</a>

```
searchKey: template.cloneText3
```

```Go
const cloneText3 = `{{define "c"}}root{{end}}`
```

### <a id="cloneText4" href="#cloneText4">const cloneText4</a>

```
searchKey: template.cloneText4
```

```Go
const cloneText4 = `{{define "c"}}clone{{end}}`
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="maxExecDepth" href="#maxExecDepth">var maxExecDepth</a>

```
searchKey: template.maxExecDepth
```

```Go
var maxExecDepth = initMaxExecDepth()
```

maxExecDepth specifies the maximum stack depth of templates within templates. This limit is only practically reached by accidentally recursive template invocations. This limit allows us to return an error instead of triggering a stack overflow. 

### <a id="zero" href="#zero">var zero</a>

```
searchKey: template.zero
```

```Go
var zero reflect.Value
```

### <a id="missingVal" href="#missingVal">var missingVal</a>

```
searchKey: template.missingVal
```

```Go
var missingVal = reflect.ValueOf(missingValType{})
```

### <a id="errorType" href="#errorType">var errorType</a>

```
searchKey: template.errorType
```

```Go
var errorType = reflect.TypeOf((*error)(nil)).Elem()
```

### <a id="fmtStringerType" href="#fmtStringerType">var fmtStringerType</a>

```
searchKey: template.fmtStringerType
```

```Go
var fmtStringerType = reflect.TypeOf((*fmt.Stringer)(nil)).Elem()
```

### <a id="reflectValueType" href="#reflectValueType">var reflectValueType</a>

```
searchKey: template.reflectValueType
```

```Go
var reflectValueType = reflect.TypeOf((*reflect.Value)(nil)).Elem()
```

### <a id="builtinFuncsOnce" href="#builtinFuncsOnce">var builtinFuncsOnce</a>

```
searchKey: template.builtinFuncsOnce
```

```Go
var builtinFuncsOnce struct {
	sync.Once
	v map[string]reflect.Value
}
```

### <a id="errBadComparisonType" href="#errBadComparisonType">var errBadComparisonType</a>

```
searchKey: template.errBadComparisonType
```

```Go
var errBadComparisonType = errors.New("invalid type for comparison")
```

### <a id="errBadComparison" href="#errBadComparison">var errBadComparison</a>

```
searchKey: template.errBadComparison
```

```Go
var errBadComparison = errors.New("incompatible types for comparison")
```

### <a id="errNoComparison" href="#errNoComparison">var errNoComparison</a>

```
searchKey: template.errNoComparison
```

```Go
var errNoComparison = errors.New("missing argument for comparison")
```

### <a id="htmlQuot" href="#htmlQuot">var htmlQuot</a>

```
searchKey: template.htmlQuot
```

```Go
var htmlQuot = []byte("&#34;") // shorter than "&quot;"

```

### <a id="htmlApos" href="#htmlApos">var htmlApos</a>

```
searchKey: template.htmlApos
```

```Go
var htmlApos = []byte("&#39;") // shorter than "&apos;" and apos was not in HTML until HTML5

```

### <a id="htmlAmp" href="#htmlAmp">var htmlAmp</a>

```
searchKey: template.htmlAmp
```

```Go
var htmlAmp = []byte("&amp;")
```

### <a id="htmlLt" href="#htmlLt">var htmlLt</a>

```
searchKey: template.htmlLt
```

```Go
var htmlLt = []byte("&lt;")
```

### <a id="htmlGt" href="#htmlGt">var htmlGt</a>

```
searchKey: template.htmlGt
```

```Go
var htmlGt = []byte("&gt;")
```

### <a id="htmlNull" href="#htmlNull">var htmlNull</a>

```
searchKey: template.htmlNull
```

```Go
var htmlNull = []byte("\uFFFD")
```

### <a id="jsLowUni" href="#jsLowUni">var jsLowUni</a>

```
searchKey: template.jsLowUni
```

```Go
var jsLowUni = []byte(`\u00`)
```

### <a id="hex" href="#hex">var hex</a>

```
searchKey: template.hex
```

```Go
var hex = []byte("0123456789ABCDEF")
```

### <a id="jsBackslash" href="#jsBackslash">var jsBackslash</a>

```
searchKey: template.jsBackslash
```

```Go
var jsBackslash = []byte(`\\`)
```

### <a id="jsApos" href="#jsApos">var jsApos</a>

```
searchKey: template.jsApos
```

```Go
var jsApos = []byte(`\'`)
```

### <a id="jsQuot" href="#jsQuot">var jsQuot</a>

```
searchKey: template.jsQuot
```

```Go
var jsQuot = []byte(`\"`)
```

### <a id="jsLt" href="#jsLt">var jsLt</a>

```
searchKey: template.jsLt
```

```Go
var jsLt = []byte(`\u003C`)
```

### <a id="jsGt" href="#jsGt">var jsGt</a>

```
searchKey: template.jsGt
```

```Go
var jsGt = []byte(`\u003E`)
```

### <a id="jsAmp" href="#jsAmp">var jsAmp</a>

```
searchKey: template.jsAmp
```

```Go
var jsAmp = []byte(`\u0026`)
```

### <a id="jsEq" href="#jsEq">var jsEq</a>

```
searchKey: template.jsEq
```

```Go
var jsEq = []byte(`\u003D`)
```

### <a id="debug" href="#debug">var debug</a>

```
searchKey: template.debug
```

```Go
var debug = flag.Bool("debug", false, "show the errors produced by the tests")
```

### <a id="siVal" href="#siVal">var siVal</a>

```
searchKey: template.siVal
```

```Go
var siVal = I(S{"a", "b"})
```

### <a id="tVal" href="#tVal">var tVal</a>

```
searchKey: template.tVal
```

```Go
var tVal = ...
```

### <a id="tSliceOfNil" href="#tSliceOfNil">var tSliceOfNil</a>

```
searchKey: template.tSliceOfNil
```

```Go
var tSliceOfNil = []*T{nil}
```

### <a id="iVal" href="#iVal">var iVal</a>

```
searchKey: template.iVal
```

```Go
var iVal I = tVal
```

### <a id="myError" href="#myError">var myError</a>

```
searchKey: template.myError
```

```Go
var myError = errors.New("my error")
```

### <a id="bigInt" href="#bigInt">var bigInt</a>

```
searchKey: template.bigInt
```

```Go
var bigInt = fmt.Sprintf("0x%x", int(1<<uint(reflect.TypeOf(0).Bits()-1)-1))
```

bigInt and bigUint are hex string representing numbers either side of the max int boundary. We do it this way so the test doesn't depend on ints being 32 bits. 

### <a id="bigUint" href="#bigUint">var bigUint</a>

```
searchKey: template.bigUint
```

```Go
var bigUint = fmt.Sprintf("0x%x", uint(1<<uint(reflect.TypeOf(0).Bits()-1)))
```

bigInt and bigUint are hex string representing numbers either side of the max int boundary. We do it this way so the test doesn't depend on ints being 32 bits. 

### <a id="execTests" href="#execTests">var execTests</a>

```
searchKey: template.execTests
```

```Go
var execTests = ...
```

### <a id="delimPairs" href="#delimPairs">var delimPairs</a>

```
searchKey: template.delimPairs
```

```Go
var delimPairs = []string{
	"", "",
	"{{", "}}",
	"<<", ">>",
	"|", "|",
	"(日)", "(本)",
}
```

### <a id="cmpTests" href="#cmpTests">var cmpTests</a>

```
searchKey: template.cmpTests
```

```Go
var cmpTests = ...
```

### <a id="alwaysError" href="#alwaysError">var alwaysError</a>

```
searchKey: template.alwaysError
```

```Go
var alwaysError = errors.New(alwaysErrorText)
```

### <a id="multiParseTests" href="#multiParseTests">var multiParseTests</a>

```
searchKey: template.multiParseTests
```

```Go
var multiParseTests = ...
```

### <a id="multiExecTests" href="#multiExecTests">var multiExecTests</a>

```
searchKey: template.multiExecTests
```

```Go
var multiExecTests = ...
```

### <a id="templateFileExecTests" href="#templateFileExecTests">var templateFileExecTests</a>

```
searchKey: template.templateFileExecTests
```

```Go
var templateFileExecTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="state" href="#state">type state struct</a>

```
searchKey: template.state
```

```Go
type state struct {
	tmpl  *Template
	wr    io.Writer
	node  parse.Node // current node, for errors
	vars  []variable // push-down stack of variable values.
	depth int        // the height of the stack of executing templates.
}
```

state represents the state of an execution. It's not part of the template so that multiple executions of the same template can execute in parallel. 

#### <a id="state.push" href="#state.push">func (s *state) push(name string, value reflect.Value)</a>

```
searchKey: template.state.push
```

```Go
func (s *state) push(name string, value reflect.Value)
```

push pushes a new variable on the stack. 

#### <a id="state.mark" href="#state.mark">func (s *state) mark() int</a>

```
searchKey: template.state.mark
```

```Go
func (s *state) mark() int
```

mark returns the length of the variable stack. 

#### <a id="state.pop" href="#state.pop">func (s *state) pop(mark int)</a>

```
searchKey: template.state.pop
```

```Go
func (s *state) pop(mark int)
```

pop pops the variable stack up to the mark. 

#### <a id="state.setVar" href="#state.setVar">func (s *state) setVar(name string, value reflect.Value)</a>

```
searchKey: template.state.setVar
```

```Go
func (s *state) setVar(name string, value reflect.Value)
```

setVar overwrites the last declared variable with the given name. Used by variable assignments. 

#### <a id="state.setTopVar" href="#state.setTopVar">func (s *state) setTopVar(n int, value reflect.Value)</a>

```
searchKey: template.state.setTopVar
```

```Go
func (s *state) setTopVar(n int, value reflect.Value)
```

setTopVar overwrites the top-nth variable on the stack. Used by range iterations. 

#### <a id="state.varValue" href="#state.varValue">func (s *state) varValue(name string) reflect.Value</a>

```
searchKey: template.state.varValue
```

```Go
func (s *state) varValue(name string) reflect.Value
```

varValue returns the value of the named variable. 

#### <a id="state.at" href="#state.at">func (s *state) at(node parse.Node)</a>

```
searchKey: template.state.at
```

```Go
func (s *state) at(node parse.Node)
```

at marks the state to be on node n, for error reporting. 

#### <a id="state.errorf" href="#state.errorf">func (s *state) errorf(format string, args ...interface{})</a>

```
searchKey: template.state.errorf
```

```Go
func (s *state) errorf(format string, args ...interface{})
```

errorf records an ExecError and terminates processing. 

#### <a id="state.writeError" href="#state.writeError">func (s *state) writeError(err error)</a>

```
searchKey: template.state.writeError
```

```Go
func (s *state) writeError(err error)
```

#### <a id="state.walk" href="#state.walk">func (s *state) walk(dot reflect.Value, node parse.Node)</a>

```
searchKey: template.state.walk
```

```Go
func (s *state) walk(dot reflect.Value, node parse.Node)
```

Walk functions step through the major pieces of the template structure, generating output as they go. 

#### <a id="state.walkIfOrWith" href="#state.walkIfOrWith">func (s *state) walkIfOrWith(typ parse.NodeType, dot reflect.Value, pipe *parse.PipeNode, list, elseList *parse.ListNode)</a>

```
searchKey: template.state.walkIfOrWith
```

```Go
func (s *state) walkIfOrWith(typ parse.NodeType, dot reflect.Value, pipe *parse.PipeNode, list, elseList *parse.ListNode)
```

walkIfOrWith walks an 'if' or 'with' node. The two control structures are identical in behavior except that 'with' sets dot. 

#### <a id="state.walkRange" href="#state.walkRange">func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode)</a>

```
searchKey: template.state.walkRange
```

```Go
func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode)
```

#### <a id="state.walkTemplate" href="#state.walkTemplate">func (s *state) walkTemplate(dot reflect.Value, t *parse.TemplateNode)</a>

```
searchKey: template.state.walkTemplate
```

```Go
func (s *state) walkTemplate(dot reflect.Value, t *parse.TemplateNode)
```

#### <a id="state.evalPipeline" href="#state.evalPipeline">func (s *state) evalPipeline(dot reflect.Value, pipe *parse.PipeNode) (value reflect.Value)</a>

```
searchKey: template.state.evalPipeline
```

```Go
func (s *state) evalPipeline(dot reflect.Value, pipe *parse.PipeNode) (value reflect.Value)
```

evalPipeline returns the value acquired by evaluating a pipeline. If the pipeline has a variable declaration, the variable will be pushed on the stack. Callers should therefore pop the stack after they are finished executing commands depending on the pipeline value. 

#### <a id="state.notAFunction" href="#state.notAFunction">func (s *state) notAFunction(args []parse.Node, final reflect.Value)</a>

```
searchKey: template.state.notAFunction
```

```Go
func (s *state) notAFunction(args []parse.Node, final reflect.Value)
```

#### <a id="state.evalCommand" href="#state.evalCommand">func (s *state) evalCommand(dot reflect.Value, cmd *parse.CommandNode, final reflect.Value) reflect.Value</a>

```
searchKey: template.state.evalCommand
```

```Go
func (s *state) evalCommand(dot reflect.Value, cmd *parse.CommandNode, final reflect.Value) reflect.Value
```

#### <a id="state.idealConstant" href="#state.idealConstant">func (s *state) idealConstant(constant *parse.NumberNode) reflect.Value</a>

```
searchKey: template.state.idealConstant
```

```Go
func (s *state) idealConstant(constant *parse.NumberNode) reflect.Value
```

idealConstant is called to return the value of a number in a context where we don't know the type. In that case, the syntax of the number tells us its type, and we use Go rules to resolve. Note there is no such thing as a uint ideal constant in this situation - the value must be of int type. 

#### <a id="state.evalFieldNode" href="#state.evalFieldNode">func (s *state) evalFieldNode(dot reflect.Value, field *parse.FieldNode, args []parse.Node, final reflect.Value) reflect.Value</a>

```
searchKey: template.state.evalFieldNode
```

```Go
func (s *state) evalFieldNode(dot reflect.Value, field *parse.FieldNode, args []parse.Node, final reflect.Value) reflect.Value
```

#### <a id="state.evalChainNode" href="#state.evalChainNode">func (s *state) evalChainNode(dot reflect.Value, chain *parse.ChainNode, args []parse.Node, final reflect.Value) reflect.Value</a>

```
searchKey: template.state.evalChainNode
```

```Go
func (s *state) evalChainNode(dot reflect.Value, chain *parse.ChainNode, args []parse.Node, final reflect.Value) reflect.Value
```

#### <a id="state.evalVariableNode" href="#state.evalVariableNode">func (s *state) evalVariableNode(dot reflect.Value, variable *parse.VariableNode, args []parse.Node, final reflect.Value) reflect.Value</a>

```
searchKey: template.state.evalVariableNode
```

```Go
func (s *state) evalVariableNode(dot reflect.Value, variable *parse.VariableNode, args []parse.Node, final reflect.Value) reflect.Value
```

#### <a id="state.evalFieldChain" href="#state.evalFieldChain">func (s *state) evalFieldChain(dot, receiver reflect.Value, node parse.Node, ident []string, args []parse.Node, final reflect.Value) reflect.Value</a>

```
searchKey: template.state.evalFieldChain
```

```Go
func (s *state) evalFieldChain(dot, receiver reflect.Value, node parse.Node, ident []string, args []parse.Node, final reflect.Value) reflect.Value
```

evalFieldChain evaluates .X.Y.Z possibly followed by arguments. dot is the environment in which to evaluate arguments, while receiver is the value being walked along the chain. 

#### <a id="state.evalFunction" href="#state.evalFunction">func (s *state) evalFunction(dot reflect.Value, node *parse.IdentifierNode, cmd parse.Node, args []parse.Node, final reflect.Value) reflect.Value</a>

```
searchKey: template.state.evalFunction
```

```Go
func (s *state) evalFunction(dot reflect.Value, node *parse.IdentifierNode, cmd parse.Node, args []parse.Node, final reflect.Value) reflect.Value
```

#### <a id="state.evalField" href="#state.evalField">func (s *state) evalField(dot reflect.Value, fieldName string, node parse.Node, args []parse.Node, final, receiver reflect.Value) reflect.Value</a>

```
searchKey: template.state.evalField
```

```Go
func (s *state) evalField(dot reflect.Value, fieldName string, node parse.Node, args []parse.Node, final, receiver reflect.Value) reflect.Value
```

evalField evaluates an expression like (.Field) or (.Field arg1 arg2). The 'final' argument represents the return value from the preceding value of the pipeline, if any. 

#### <a id="state.evalCall" href="#state.evalCall">func (s *state) evalCall(dot, fun reflect.Value, node parse.Node, name string, args []parse.Node, final reflect.Value) reflect.Value</a>

```
searchKey: template.state.evalCall
```

```Go
func (s *state) evalCall(dot, fun reflect.Value, node parse.Node, name string, args []parse.Node, final reflect.Value) reflect.Value
```

evalCall executes a function or method call. If it's a method, fun already has the receiver bound, so it looks just like a function call. The arg list, if non-nil, includes (in the manner of the shell), arg[0] as the function itself. 

#### <a id="state.validateType" href="#state.validateType">func (s *state) validateType(value reflect.Value, typ reflect.Type) reflect.Value</a>

```
searchKey: template.state.validateType
```

```Go
func (s *state) validateType(value reflect.Value, typ reflect.Type) reflect.Value
```

validateType guarantees that the value is valid and assignable to the type. 

#### <a id="state.evalArg" href="#state.evalArg">func (s *state) evalArg(dot reflect.Value, typ reflect.Type, n parse.Node) reflect.Value</a>

```
searchKey: template.state.evalArg
```

```Go
func (s *state) evalArg(dot reflect.Value, typ reflect.Type, n parse.Node) reflect.Value
```

#### <a id="state.evalBool" href="#state.evalBool">func (s *state) evalBool(typ reflect.Type, n parse.Node) reflect.Value</a>

```
searchKey: template.state.evalBool
```

```Go
func (s *state) evalBool(typ reflect.Type, n parse.Node) reflect.Value
```

#### <a id="state.evalString" href="#state.evalString">func (s *state) evalString(typ reflect.Type, n parse.Node) reflect.Value</a>

```
searchKey: template.state.evalString
```

```Go
func (s *state) evalString(typ reflect.Type, n parse.Node) reflect.Value
```

#### <a id="state.evalInteger" href="#state.evalInteger">func (s *state) evalInteger(typ reflect.Type, n parse.Node) reflect.Value</a>

```
searchKey: template.state.evalInteger
```

```Go
func (s *state) evalInteger(typ reflect.Type, n parse.Node) reflect.Value
```

#### <a id="state.evalUnsignedInteger" href="#state.evalUnsignedInteger">func (s *state) evalUnsignedInteger(typ reflect.Type, n parse.Node) reflect.Value</a>

```
searchKey: template.state.evalUnsignedInteger
```

```Go
func (s *state) evalUnsignedInteger(typ reflect.Type, n parse.Node) reflect.Value
```

#### <a id="state.evalFloat" href="#state.evalFloat">func (s *state) evalFloat(typ reflect.Type, n parse.Node) reflect.Value</a>

```
searchKey: template.state.evalFloat
```

```Go
func (s *state) evalFloat(typ reflect.Type, n parse.Node) reflect.Value
```

#### <a id="state.evalComplex" href="#state.evalComplex">func (s *state) evalComplex(typ reflect.Type, n parse.Node) reflect.Value</a>

```
searchKey: template.state.evalComplex
```

```Go
func (s *state) evalComplex(typ reflect.Type, n parse.Node) reflect.Value
```

#### <a id="state.evalEmptyInterface" href="#state.evalEmptyInterface">func (s *state) evalEmptyInterface(dot reflect.Value, n parse.Node) reflect.Value</a>

```
searchKey: template.state.evalEmptyInterface
```

```Go
func (s *state) evalEmptyInterface(dot reflect.Value, n parse.Node) reflect.Value
```

#### <a id="state.printValue" href="#state.printValue">func (s *state) printValue(n parse.Node, v reflect.Value)</a>

```
searchKey: template.state.printValue
```

```Go
func (s *state) printValue(n parse.Node, v reflect.Value)
```

printValue writes the textual representation of the value to the output of the template. 

### <a id="variable" href="#variable">type variable struct</a>

```
searchKey: template.variable
```

```Go
type variable struct {
	name  string
	value reflect.Value
}
```

variable holds the dynamic value of a variable such as $, $x etc. 

### <a id="missingValType" href="#missingValType">type missingValType struct{}</a>

```
searchKey: template.missingValType
```

```Go
type missingValType struct{}
```

### <a id="ExecError" href="#ExecError">type ExecError struct</a>

```
searchKey: template.ExecError
tags: [exported]
```

```Go
type ExecError struct {
	Name string // Name of template.
	Err  error  // Pre-formatted error.
}
```

ExecError is the custom error type returned when Execute has an error evaluating its template. (If a write error occurs, the actual error is returned; it will not be of type ExecError.) 

#### <a id="ExecError.Error" href="#ExecError.Error">func (e ExecError) Error() string</a>

```
searchKey: template.ExecError.Error
tags: [exported]
```

```Go
func (e ExecError) Error() string
```

#### <a id="ExecError.Unwrap" href="#ExecError.Unwrap">func (e ExecError) Unwrap() error</a>

```
searchKey: template.ExecError.Unwrap
tags: [exported]
```

```Go
func (e ExecError) Unwrap() error
```

### <a id="writeError" href="#writeError">type writeError struct</a>

```
searchKey: template.writeError
```

```Go
type writeError struct {
	Err error // Original error.
}
```

writeError is the wrapper type used internally when Execute has an error writing to its output. We strip the wrapper in errRecover. Note that this is not an implementation of error, so it cannot escape from the package as an error value. 

### <a id="FuncMap" href="#FuncMap">type FuncMap map[string]interface{}</a>

```
searchKey: template.FuncMap
tags: [exported]
```

```Go
type FuncMap map[string]interface{}
```

FuncMap is the type of the map defining the mapping from names to functions. Each function must have either a single return value, or two return values of which the second has type error. In that case, if the second (error) return value evaluates to non-nil during execution, execution terminates and Execute returns that error. 

Errors returned by Execute wrap the underlying error; call errors.As to uncover them. 

When template execution invokes a function with an argument list, that list must be assignable to the function's parameter types. Functions meant to apply to arguments of arbitrary type can use parameters of type interface{} or of type reflect.Value. Similarly, functions meant to return a result of arbitrary type can return interface{} or reflect.Value. 

#### <a id="builtins" href="#builtins">func builtins() FuncMap</a>

```
searchKey: template.builtins
```

```Go
func builtins() FuncMap
```

builtins returns the FuncMap. It is not a global variable so the linker can dead code eliminate more when this isn't called. See golang.org/issue/36021. TODO: revert this back to a global map once golang.org/issue/2559 is fixed. 

### <a id="kind" href="#kind">type kind int</a>

```
searchKey: template.kind
```

```Go
type kind int
```

#### <a id="basicKind" href="#basicKind">func basicKind(v reflect.Value) (kind, error)</a>

```
searchKey: template.basicKind
```

```Go
func basicKind(v reflect.Value) (kind, error)
```

### <a id="missingKeyAction" href="#missingKeyAction">type missingKeyAction int</a>

```
searchKey: template.missingKeyAction
```

```Go
type missingKeyAction int
```

missingKeyAction defines how to respond to indexing a map with a key that is not present. 

### <a id="option" href="#option">type option struct</a>

```
searchKey: template.option
```

```Go
type option struct {
	missingKey missingKeyAction
}
```

### <a id="common" href="#common">type common struct</a>

```
searchKey: template.common
```

```Go
type common struct {
	tmpl   map[string]*Template // Map from name to defined templates.
	muTmpl sync.RWMutex         // protects tmpl
	option option
	// We use two maps, one for parsing and one for execution.
	// This separation makes the API cleaner since it doesn't
	// expose reflection to the client.
	muFuncs    sync.RWMutex // protects parseFuncs and execFuncs
	parseFuncs FuncMap
	execFuncs  map[string]reflect.Value
}
```

common holds the information shared by related templates. 

### <a id="Template" href="#Template">type Template struct</a>

```
searchKey: template.Template
tags: [exported]
```

```Go
type Template struct {
	name string
	*parse.Tree
	*common
	leftDelim  string
	rightDelim string
}
```

Template is the representation of a parsed template. The *parse.Tree field is exported only for use by html/template and should be treated as unexported by all other clients. 

#### <a id="Must" href="#Must">func Must(t *Template, err error) *Template</a>

```
searchKey: template.Must
tags: [exported]
```

```Go
func Must(t *Template, err error) *Template
```

Must is a helper that wraps a call to a function returning (*Template, error) and panics if the error is non-nil. It is intended for use in variable initializations such as 

```
var t = template.Must(template.New("name").Parse("text"))

```
#### <a id="ParseFiles" href="#ParseFiles">func ParseFiles(filenames ...string) (*Template, error)</a>

```
searchKey: template.ParseFiles
tags: [exported]
```

```Go
func ParseFiles(filenames ...string) (*Template, error)
```

ParseFiles creates a new Template and parses the template definitions from the named files. The returned template's name will have the base name and parsed contents of the first file. There must be at least one file. If an error occurs, parsing stops and the returned *Template is nil. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. For instance, ParseFiles("a/foo", "b/foo") stores "b/foo" as the template named "foo", while "a/foo" is unavailable. 

#### <a id="parseFiles" href="#parseFiles">func parseFiles(t *Template, readFile func(string) (string, []byte, error), filenames ...string) (*Template, error)</a>

```
searchKey: template.parseFiles
```

```Go
func parseFiles(t *Template, readFile func(string) (string, []byte, error), filenames ...string) (*Template, error)
```

parseFiles is the helper for the method and function. If the argument template is nil, it is created from the first file. 

#### <a id="ParseGlob" href="#ParseGlob">func ParseGlob(pattern string) (*Template, error)</a>

```
searchKey: template.ParseGlob
tags: [exported]
```

```Go
func ParseGlob(pattern string) (*Template, error)
```

ParseGlob creates a new Template and parses the template definitions from the files identified by the pattern. The files are matched according to the semantics of filepath.Match, and the pattern must match at least one file. The returned template will have the (base) name and (parsed) contents of the first file matched by the pattern. ParseGlob is equivalent to calling ParseFiles with the list of files matched by the pattern. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. 

#### <a id="parseGlob" href="#parseGlob">func parseGlob(t *Template, pattern string) (*Template, error)</a>

```
searchKey: template.parseGlob
```

```Go
func parseGlob(t *Template, pattern string) (*Template, error)
```

parseGlob is the implementation of the function and method ParseGlob. 

#### <a id="ParseFS" href="#ParseFS">func ParseFS(fsys fs.FS, patterns ...string) (*Template, error)</a>

```
searchKey: template.ParseFS
tags: [exported]
```

```Go
func ParseFS(fsys fs.FS, patterns ...string) (*Template, error)
```

ParseFS is like ParseFiles or ParseGlob but reads from the file system fsys instead of the host operating system's file system. It accepts a list of glob patterns. (Note that most file names serve as glob patterns matching only themselves.) 

#### <a id="parseFS" href="#parseFS">func parseFS(t *Template, fsys fs.FS, patterns []string) (*Template, error)</a>

```
searchKey: template.parseFS
```

```Go
func parseFS(t *Template, fsys fs.FS, patterns []string) (*Template, error)
```

#### <a id="New" href="#New">func New(name string) *Template</a>

```
searchKey: template.New
tags: [exported]
```

```Go
func New(name string) *Template
```

New allocates a new, undefined template with the given name. 

#### <a id="Template.ExecuteTemplate" href="#Template.ExecuteTemplate">func (t *Template) ExecuteTemplate(wr io.Writer, name string, data interface{}) error</a>

```
searchKey: template.Template.ExecuteTemplate
tags: [exported]
```

```Go
func (t *Template) ExecuteTemplate(wr io.Writer, name string, data interface{}) error
```

ExecuteTemplate applies the template associated with t that has the given name to the specified data object and writes the output to wr. If an error occurs executing the template or writing its output, execution stops, but partial results may already have been written to the output writer. A template may be executed safely in parallel, although if parallel executions share a Writer the output may be interleaved. 

#### <a id="Template.Execute" href="#Template.Execute">func (t *Template) Execute(wr io.Writer, data interface{}) error</a>

```
searchKey: template.Template.Execute
tags: [exported]
```

```Go
func (t *Template) Execute(wr io.Writer, data interface{}) error
```

Execute applies a parsed template to the specified data object, and writes the output to wr. If an error occurs executing the template or writing its output, execution stops, but partial results may already have been written to the output writer. A template may be executed safely in parallel, although if parallel executions share a Writer the output may be interleaved. 

If data is a reflect.Value, the template applies to the concrete value that the reflect.Value holds, as in fmt.Print. 

#### <a id="Template.execute" href="#Template.execute">func (t *Template) execute(wr io.Writer, data interface{}) (err error)</a>

```
searchKey: template.Template.execute
```

```Go
func (t *Template) execute(wr io.Writer, data interface{}) (err error)
```

#### <a id="Template.DefinedTemplates" href="#Template.DefinedTemplates">func (t *Template) DefinedTemplates() string</a>

```
searchKey: template.Template.DefinedTemplates
tags: [exported]
```

```Go
func (t *Template) DefinedTemplates() string
```

DefinedTemplates returns a string listing the defined templates, prefixed by the string "; defined templates are: ". If there are none, it returns the empty string. For generating an error message here and in html/template. 

#### <a id="Template.ParseFiles" href="#Template.ParseFiles">func (t *Template) ParseFiles(filenames ...string) (*Template, error)</a>

```
searchKey: template.Template.ParseFiles
tags: [exported]
```

```Go
func (t *Template) ParseFiles(filenames ...string) (*Template, error)
```

ParseFiles parses the named files and associates the resulting templates with t. If an error occurs, parsing stops and the returned template is nil; otherwise it is t. There must be at least one file. Since the templates created by ParseFiles are named by the base names of the argument files, t should usually have the name of one of the (base) names of the files. If it does not, depending on t's contents before calling ParseFiles, t.Execute may fail. In that case use t.ExecuteTemplate to execute a valid template. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. 

#### <a id="Template.ParseGlob" href="#Template.ParseGlob">func (t *Template) ParseGlob(pattern string) (*Template, error)</a>

```
searchKey: template.Template.ParseGlob
tags: [exported]
```

```Go
func (t *Template) ParseGlob(pattern string) (*Template, error)
```

ParseGlob parses the template definitions in the files identified by the pattern and associates the resulting templates with t. The files are matched according to the semantics of filepath.Match, and the pattern must match at least one file. ParseGlob is equivalent to calling t.ParseFiles with the list of files matched by the pattern. 

When parsing multiple files with the same name in different directories, the last one mentioned will be the one that results. 

#### <a id="Template.ParseFS" href="#Template.ParseFS">func (t *Template) ParseFS(fsys fs.FS, patterns ...string) (*Template, error)</a>

```
searchKey: template.Template.ParseFS
tags: [exported]
```

```Go
func (t *Template) ParseFS(fsys fs.FS, patterns ...string) (*Template, error)
```

ParseFS is like ParseFiles or ParseGlob but reads from the file system fsys instead of the host operating system's file system. It accepts a list of glob patterns. (Note that most file names serve as glob patterns matching only themselves.) 

#### <a id="Template.Option" href="#Template.Option">func (t *Template) Option(opt ...string) *Template</a>

```
searchKey: template.Template.Option
tags: [exported]
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
#### <a id="Template.setOption" href="#Template.setOption">func (t *Template) setOption(opt string)</a>

```
searchKey: template.Template.setOption
```

```Go
func (t *Template) setOption(opt string)
```

#### <a id="Template.Name" href="#Template.Name">func (t *Template) Name() string</a>

```
searchKey: template.Template.Name
tags: [exported]
```

```Go
func (t *Template) Name() string
```

Name returns the name of the template. 

#### <a id="Template.New" href="#Template.New">func (t *Template) New(name string) *Template</a>

```
searchKey: template.Template.New
tags: [exported]
```

```Go
func (t *Template) New(name string) *Template
```

New allocates a new, undefined template associated with the given one and with the same delimiters. The association, which is transitive, allows one template to invoke another with a {{template}} action. 

Because associated templates share underlying data, template construction cannot be done safely in parallel. Once the templates are constructed, they can be executed in parallel. 

#### <a id="Template.init" href="#Template.init">func (t *Template) init()</a>

```
searchKey: template.Template.init
```

```Go
func (t *Template) init()
```

init guarantees that t has a valid common structure. 

#### <a id="Template.Clone" href="#Template.Clone">func (t *Template) Clone() (*Template, error)</a>

```
searchKey: template.Template.Clone
tags: [exported]
```

```Go
func (t *Template) Clone() (*Template, error)
```

Clone returns a duplicate of the template, including all associated templates. The actual representation is not copied, but the name space of associated templates is, so further calls to Parse in the copy will add templates to the copy but not to the original. Clone can be used to prepare common templates and use them with variant definitions for other templates by adding the variants after the clone is made. 

#### <a id="Template.copy" href="#Template.copy">func (t *Template) copy(c *common) *Template</a>

```
searchKey: template.Template.copy
```

```Go
func (t *Template) copy(c *common) *Template
```

copy returns a shallow copy of t, with common set to the argument. 

#### <a id="Template.AddParseTree" href="#Template.AddParseTree">func (t *Template) AddParseTree(name string, tree *parse.Tree) (*Template, error)</a>

```
searchKey: template.Template.AddParseTree
tags: [exported]
```

```Go
func (t *Template) AddParseTree(name string, tree *parse.Tree) (*Template, error)
```

AddParseTree associates the argument parse tree with the template t, giving it the specified name. If the template has not been defined, this tree becomes its definition. If it has been defined and already has that name, the existing definition is replaced; otherwise a new template is created, defined, and returned. 

#### <a id="Template.Templates" href="#Template.Templates">func (t *Template) Templates() []*Template</a>

```
searchKey: template.Template.Templates
tags: [exported]
```

```Go
func (t *Template) Templates() []*Template
```

Templates returns a slice of defined templates associated with t. 

#### <a id="Template.Delims" href="#Template.Delims">func (t *Template) Delims(left, right string) *Template</a>

```
searchKey: template.Template.Delims
tags: [exported]
```

```Go
func (t *Template) Delims(left, right string) *Template
```

Delims sets the action delimiters to the specified strings, to be used in subsequent calls to Parse, ParseFiles, or ParseGlob. Nested template definitions will inherit the settings. An empty delimiter stands for the corresponding default: {{ or }}. The return value is the template, so calls can be chained. 

#### <a id="Template.Funcs" href="#Template.Funcs">func (t *Template) Funcs(funcMap FuncMap) *Template</a>

```
searchKey: template.Template.Funcs
tags: [exported]
```

```Go
func (t *Template) Funcs(funcMap FuncMap) *Template
```

Funcs adds the elements of the argument map to the template's function map. It must be called before the template is parsed. It panics if a value in the map is not a function with appropriate return type or if the name cannot be used syntactically as a function in a template. It is legal to overwrite elements of the map. The return value is the template, so calls can be chained. 

#### <a id="Template.Lookup" href="#Template.Lookup">func (t *Template) Lookup(name string) *Template</a>

```
searchKey: template.Template.Lookup
tags: [exported]
```

```Go
func (t *Template) Lookup(name string) *Template
```

Lookup returns the template with the given name that is associated with t. It returns nil if there is no such template or the template has no definition. 

#### <a id="Template.Parse" href="#Template.Parse">func (t *Template) Parse(text string) (*Template, error)</a>

```
searchKey: template.Template.Parse
tags: [exported]
```

```Go
func (t *Template) Parse(text string) (*Template, error)
```

Parse parses text as a template body for t. Named template definitions ({{define ...}} or {{block ...}} statements) in text define additional templates associated with t and are removed from the definition of t itself. 

Templates can be redefined in successive calls to Parse. A template definition with a body containing only white space and comments is considered empty and will not replace an existing template's body. This allows using Parse to add new named template definitions without overwriting the main template body. 

#### <a id="Template.associate" href="#Template.associate">func (t *Template) associate(new *Template, tree *parse.Tree) bool</a>

```
searchKey: template.Template.associate
```

```Go
func (t *Template) associate(new *Template, tree *parse.Tree) bool
```

associate installs the new template into the group of templates associated with t. The two are already known to share the common structure. The boolean return value reports whether to store this tree as t.Tree. 

### <a id="T" href="#T">type T struct</a>

```
searchKey: template.T
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
```

```Go
func (t *T) Method0() string
```

Simple methods with and without arguments. 

#### <a id="T.Method1" href="#T.Method1">func (t *T) Method1(a int) int</a>

```
searchKey: template.T.Method1
```

```Go
func (t *T) Method1(a int) int
```

#### <a id="T.Method2" href="#T.Method2">func (t *T) Method2(a uint16, b string) string</a>

```
searchKey: template.T.Method2
```

```Go
func (t *T) Method2(a uint16, b string) string
```

#### <a id="T.Method3" href="#T.Method3">func (t *T) Method3(v interface{}) string</a>

```
searchKey: template.T.Method3
```

```Go
func (t *T) Method3(v interface{}) string
```

#### <a id="T.Copy" href="#T.Copy">func (t *T) Copy() *T</a>

```
searchKey: template.T.Copy
```

```Go
func (t *T) Copy() *T
```

#### <a id="T.MAdd" href="#T.MAdd">func (t *T) MAdd(a int, b []int) []int</a>

```
searchKey: template.T.MAdd
```

```Go
func (t *T) MAdd(a int, b []int) []int
```

#### <a id="T.MyError" href="#T.MyError">func (t *T) MyError(error bool) (bool, error)</a>

```
searchKey: template.T.MyError
```

```Go
func (t *T) MyError(error bool) (bool, error)
```

MyError returns a value and an error according to its argument. 

#### <a id="T.GetU" href="#T.GetU">func (t *T) GetU() *U</a>

```
searchKey: template.T.GetU
```

```Go
func (t *T) GetU() *U
```

A few methods to test chaining. 

### <a id="S" href="#S">type S []string</a>

```
searchKey: template.S
```

```Go
type S []string
```

#### <a id="S.Method0" href="#S.Method0">func (S) Method0() string</a>

```
searchKey: template.S.Method0
```

```Go
func (S) Method0() string
```

### <a id="U" href="#U">type U struct</a>

```
searchKey: template.U
```

```Go
type U struct {
	V string
}
```

#### <a id="U.TrueFalse" href="#U.TrueFalse">func (u *U) TrueFalse(b bool) string</a>

```
searchKey: template.U.TrueFalse
```

```Go
func (u *U) TrueFalse(b bool) string
```

### <a id="V" href="#V">type V struct</a>

```
searchKey: template.V
```

```Go
type V struct {
	j int
}
```

#### <a id="V.String" href="#V.String">func (v *V) String() string</a>

```
searchKey: template.V.String
```

```Go
func (v *V) String() string
```

### <a id="W" href="#W">type W struct</a>

```
searchKey: template.W
```

```Go
type W struct {
	k int
}
```

#### <a id="W.Error" href="#W.Error">func (w *W) Error() string</a>

```
searchKey: template.W.Error
```

```Go
func (w *W) Error() string
```

### <a id="I" href="#I">type I interface</a>

```
searchKey: template.I
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

### <a id="CustomError" href="#CustomError">type CustomError struct{}</a>

```
searchKey: template.CustomError
```

```Go
type CustomError struct{}
```

#### <a id="CustomError.Error" href="#CustomError.Error">func (*CustomError) Error() string</a>

```
searchKey: template.CustomError.Error
```

```Go
func (*CustomError) Error() string
```

### <a id="Tree" href="#Tree">type Tree struct</a>

```
searchKey: template.Tree
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
```

```Go
type ErrorWriter int
```

#### <a id="ErrorWriter.Write" href="#ErrorWriter.Write">func (e ErrorWriter) Write(p []byte) (int, error)</a>

```
searchKey: template.ErrorWriter.Write
```

```Go
func (e ErrorWriter) Write(p []byte) (int, error)
```

### <a id="multiParseTest" href="#multiParseTest">type multiParseTest struct</a>

```
searchKey: template.multiParseTest
```

```Go
type multiParseTest struct {
	name    string
	input   string
	ok      bool
	names   []string
	results []string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="initMaxExecDepth" href="#initMaxExecDepth">func initMaxExecDepth() int</a>

```
searchKey: template.initMaxExecDepth
```

```Go
func initMaxExecDepth() int
```

### <a id="doublePercent" href="#doublePercent">func doublePercent(str string) string</a>

```
searchKey: template.doublePercent
```

```Go
func doublePercent(str string) string
```

doublePercent returns the string with %'s replaced by %%, if necessary, so it can be used safely inside a Printf format string. 

### <a id="errRecover" href="#errRecover">func errRecover(errp *error)</a>

```
searchKey: template.errRecover
```

```Go
func errRecover(errp *error)
```

errRecover is the handler that turns panics into returns from the top level of Parse. 

### <a id="IsTrue" href="#IsTrue">func IsTrue(val interface{}) (truth, ok bool)</a>

```
searchKey: template.IsTrue
tags: [exported]
```

```Go
func IsTrue(val interface{}) (truth, ok bool)
```

IsTrue reports whether the value is 'true', in the sense of not the zero of its type, and whether the value has a meaningful truth value. This is the definition of truth used by if and other such actions. 

### <a id="isTrue" href="#isTrue">func isTrue(val reflect.Value) (truth, ok bool)</a>

```
searchKey: template.isTrue
```

```Go
func isTrue(val reflect.Value) (truth, ok bool)
```

### <a id="isRuneInt" href="#isRuneInt">func isRuneInt(s string) bool</a>

```
searchKey: template.isRuneInt
```

```Go
func isRuneInt(s string) bool
```

### <a id="isHexInt" href="#isHexInt">func isHexInt(s string) bool</a>

```
searchKey: template.isHexInt
```

```Go
func isHexInt(s string) bool
```

### <a id="canBeNil" href="#canBeNil">func canBeNil(typ reflect.Type) bool</a>

```
searchKey: template.canBeNil
```

```Go
func canBeNil(typ reflect.Type) bool
```

canBeNil reports whether an untyped nil can be assigned to the type. See reflect.Zero. 

### <a id="indirect" href="#indirect">func indirect(v reflect.Value) (rv reflect.Value, isNil bool)</a>

```
searchKey: template.indirect
```

```Go
func indirect(v reflect.Value) (rv reflect.Value, isNil bool)
```

indirect returns the item at the end of indirection, and a bool to indicate if it's nil. If the returned bool is true, the returned value's kind will be either a pointer or interface. 

### <a id="indirectInterface" href="#indirectInterface">func indirectInterface(v reflect.Value) reflect.Value</a>

```
searchKey: template.indirectInterface
```

```Go
func indirectInterface(v reflect.Value) reflect.Value
```

indirectInterface returns the concrete value in an interface value, or else the zero reflect.Value. That is, if v represents the interface value x, the result is the same as reflect.ValueOf(x): the fact that x was an interface value is forgotten. 

### <a id="printableValue" href="#printableValue">func printableValue(v reflect.Value) (interface{}, bool)</a>

```
searchKey: template.printableValue
```

```Go
func printableValue(v reflect.Value) (interface{}, bool)
```

printableValue returns the, possibly indirected, interface value inside v that is best for a call to formatted printer. 

### <a id="builtinFuncs" href="#builtinFuncs">func builtinFuncs() map[string]reflect.Value</a>

```
searchKey: template.builtinFuncs
```

```Go
func builtinFuncs() map[string]reflect.Value
```

builtinFuncsOnce lazily computes & caches the builtinFuncs map. TODO: revert this back to a global map once golang.org/issue/2559 is fixed. 

### <a id="createValueFuncs" href="#createValueFuncs">func createValueFuncs(funcMap FuncMap) map[string]reflect.Value</a>

```
searchKey: template.createValueFuncs
```

```Go
func createValueFuncs(funcMap FuncMap) map[string]reflect.Value
```

createValueFuncs turns a FuncMap into a map[string]reflect.Value 

### <a id="addValueFuncs" href="#addValueFuncs">func addValueFuncs(out map[string]reflect.Value, in FuncMap)</a>

```
searchKey: template.addValueFuncs
```

```Go
func addValueFuncs(out map[string]reflect.Value, in FuncMap)
```

addValueFuncs adds to values the functions in funcs, converting them to reflect.Values. 

### <a id="addFuncs" href="#addFuncs">func addFuncs(out, in FuncMap)</a>

```
searchKey: template.addFuncs
```

```Go
func addFuncs(out, in FuncMap)
```

addFuncs adds to values the functions in funcs. It does no checking of the input - call addValueFuncs first. 

### <a id="goodFunc" href="#goodFunc">func goodFunc(typ reflect.Type) bool</a>

```
searchKey: template.goodFunc
```

```Go
func goodFunc(typ reflect.Type) bool
```

goodFunc reports whether the function or method has the right result signature. 

### <a id="goodName" href="#goodName">func goodName(name string) bool</a>

```
searchKey: template.goodName
```

```Go
func goodName(name string) bool
```

goodName reports whether the function name is a valid identifier. 

### <a id="findFunction" href="#findFunction">func findFunction(name string, tmpl *Template) (reflect.Value, bool)</a>

```
searchKey: template.findFunction
```

```Go
func findFunction(name string, tmpl *Template) (reflect.Value, bool)
```

findFunction looks for a function in the template, and global map. 

### <a id="prepareArg" href="#prepareArg">func prepareArg(value reflect.Value, argType reflect.Type) (reflect.Value, error)</a>

```
searchKey: template.prepareArg
```

```Go
func prepareArg(value reflect.Value, argType reflect.Type) (reflect.Value, error)
```

prepareArg checks if value can be used as an argument of type argType, and converts an invalid value to appropriate zero if possible. 

### <a id="intLike" href="#intLike">func intLike(typ reflect.Kind) bool</a>

```
searchKey: template.intLike
```

```Go
func intLike(typ reflect.Kind) bool
```

### <a id="indexArg" href="#indexArg">func indexArg(index reflect.Value, cap int) (int, error)</a>

```
searchKey: template.indexArg
```

```Go
func indexArg(index reflect.Value, cap int) (int, error)
```

indexArg checks if a reflect.Value can be used as an index, and converts it to int if possible. 

### <a id="index" href="#index">func index(item reflect.Value, indexes ...reflect.Value) (reflect.Value, error)</a>

```
searchKey: template.index
```

```Go
func index(item reflect.Value, indexes ...reflect.Value) (reflect.Value, error)
```

index returns the result of indexing its first argument by the following arguments. Thus "index x 1 2 3" is, in Go syntax, x[1][2][3]. Each indexed item must be a map, slice, or array. 

### <a id="slice" href="#slice">func slice(item reflect.Value, indexes ...reflect.Value) (reflect.Value, error)</a>

```
searchKey: template.slice
```

```Go
func slice(item reflect.Value, indexes ...reflect.Value) (reflect.Value, error)
```

slice returns the result of slicing its first argument by the remaining arguments. Thus "slice x 1 2" is, in Go syntax, x[1:2], while "slice x" is x[:], "slice x 1" is x[1:], and "slice x 1 2 3" is x[1:2:3]. The first argument must be a string, slice, or array. 

### <a id="length" href="#length">func length(item reflect.Value) (int, error)</a>

```
searchKey: template.length
```

```Go
func length(item reflect.Value) (int, error)
```

length returns the length of the item, with an error if it has no defined length. 

### <a id="call" href="#call">func call(fn reflect.Value, args ...reflect.Value) (reflect.Value, error)</a>

```
searchKey: template.call
```

```Go
func call(fn reflect.Value, args ...reflect.Value) (reflect.Value, error)
```

call returns the result of evaluating the first argument as a function. The function must return 1 result, or 2 results, the second of which is an error. 

### <a id="safeCall" href="#safeCall">func safeCall(fun reflect.Value, args []reflect.Value) (val reflect.Value, err error)</a>

```
searchKey: template.safeCall
```

```Go
func safeCall(fun reflect.Value, args []reflect.Value) (val reflect.Value, err error)
```

safeCall runs fun.Call(args), and returns the resulting value and error, if any. If the call panics, the panic value is returned as an error. 

### <a id="truth" href="#truth">func truth(arg reflect.Value) bool</a>

```
searchKey: template.truth
```

```Go
func truth(arg reflect.Value) bool
```

### <a id="and" href="#and">func and(arg0 reflect.Value, args ...reflect.Value) reflect.Value</a>

```
searchKey: template.and
```

```Go
func and(arg0 reflect.Value, args ...reflect.Value) reflect.Value
```

and computes the Boolean AND of its arguments, returning the first false argument it encounters, or the last argument. 

### <a id="or" href="#or">func or(arg0 reflect.Value, args ...reflect.Value) reflect.Value</a>

```
searchKey: template.or
```

```Go
func or(arg0 reflect.Value, args ...reflect.Value) reflect.Value
```

or computes the Boolean OR of its arguments, returning the first true argument it encounters, or the last argument. 

### <a id="not" href="#not">func not(arg reflect.Value) bool</a>

```
searchKey: template.not
```

```Go
func not(arg reflect.Value) bool
```

not returns the Boolean negation of its argument. 

### <a id="eq" href="#eq">func eq(arg1 reflect.Value, arg2 ...reflect.Value) (bool, error)</a>

```
searchKey: template.eq
```

```Go
func eq(arg1 reflect.Value, arg2 ...reflect.Value) (bool, error)
```

eq evaluates the comparison a == b || a == c || ... 

### <a id="ne" href="#ne">func ne(arg1, arg2 reflect.Value) (bool, error)</a>

```
searchKey: template.ne
```

```Go
func ne(arg1, arg2 reflect.Value) (bool, error)
```

ne evaluates the comparison a != b. 

### <a id="lt" href="#lt">func lt(arg1, arg2 reflect.Value) (bool, error)</a>

```
searchKey: template.lt
```

```Go
func lt(arg1, arg2 reflect.Value) (bool, error)
```

lt evaluates the comparison a < b. 

### <a id="le" href="#le">func le(arg1, arg2 reflect.Value) (bool, error)</a>

```
searchKey: template.le
```

```Go
func le(arg1, arg2 reflect.Value) (bool, error)
```

le evaluates the comparison <= b. 

### <a id="gt" href="#gt">func gt(arg1, arg2 reflect.Value) (bool, error)</a>

```
searchKey: template.gt
```

```Go
func gt(arg1, arg2 reflect.Value) (bool, error)
```

gt evaluates the comparison a > b. 

### <a id="ge" href="#ge">func ge(arg1, arg2 reflect.Value) (bool, error)</a>

```
searchKey: template.ge
```

```Go
func ge(arg1, arg2 reflect.Value) (bool, error)
```

ge evaluates the comparison a >= b. 

### <a id="HTMLEscape" href="#HTMLEscape">func HTMLEscape(w io.Writer, b []byte)</a>

```
searchKey: template.HTMLEscape
tags: [exported]
```

```Go
func HTMLEscape(w io.Writer, b []byte)
```

HTMLEscape writes to w the escaped HTML equivalent of the plain text data b. 

### <a id="HTMLEscapeString" href="#HTMLEscapeString">func HTMLEscapeString(s string) string</a>

```
searchKey: template.HTMLEscapeString
tags: [exported]
```

```Go
func HTMLEscapeString(s string) string
```

HTMLEscapeString returns the escaped HTML equivalent of the plain text data s. 

### <a id="HTMLEscaper" href="#HTMLEscaper">func HTMLEscaper(args ...interface{}) string</a>

```
searchKey: template.HTMLEscaper
tags: [exported]
```

```Go
func HTMLEscaper(args ...interface{}) string
```

HTMLEscaper returns the escaped HTML equivalent of the textual representation of its arguments. 

### <a id="JSEscape" href="#JSEscape">func JSEscape(w io.Writer, b []byte)</a>

```
searchKey: template.JSEscape
tags: [exported]
```

```Go
func JSEscape(w io.Writer, b []byte)
```

JSEscape writes to w the escaped JavaScript equivalent of the plain text data b. 

### <a id="JSEscapeString" href="#JSEscapeString">func JSEscapeString(s string) string</a>

```
searchKey: template.JSEscapeString
tags: [exported]
```

```Go
func JSEscapeString(s string) string
```

JSEscapeString returns the escaped JavaScript equivalent of the plain text data s. 

### <a id="jsIsSpecial" href="#jsIsSpecial">func jsIsSpecial(r rune) bool</a>

```
searchKey: template.jsIsSpecial
```

```Go
func jsIsSpecial(r rune) bool
```

### <a id="JSEscaper" href="#JSEscaper">func JSEscaper(args ...interface{}) string</a>

```
searchKey: template.JSEscaper
tags: [exported]
```

```Go
func JSEscaper(args ...interface{}) string
```

JSEscaper returns the escaped JavaScript equivalent of the textual representation of its arguments. 

### <a id="URLQueryEscaper" href="#URLQueryEscaper">func URLQueryEscaper(args ...interface{}) string</a>

```
searchKey: template.URLQueryEscaper
tags: [exported]
```

```Go
func URLQueryEscaper(args ...interface{}) string
```

URLQueryEscaper returns the escaped value of the textual representation of its arguments in a form suitable for embedding in a URL query. 

### <a id="evalArgs" href="#evalArgs">func evalArgs(args []interface{}) string</a>

```
searchKey: template.evalArgs
```

```Go
func evalArgs(args []interface{}) string
```

evalArgs formats the list of arguments into a string. It is therefore equivalent to 

```
fmt.Sprint(args...)

```
except that each argument is indirected (if a pointer), as required, using the same rules as the default string evaluation during template execution. 

### <a id="readFileOS" href="#readFileOS">func readFileOS(file string) (name string, b []byte, err error)</a>

```
searchKey: template.readFileOS
```

```Go
func readFileOS(file string) (name string, b []byte, err error)
```

### <a id="readFileFS" href="#readFileFS">func readFileFS(fsys fs.FS) func(string) (string, []byte, error)</a>

```
searchKey: template.readFileFS
```

```Go
func readFileFS(fsys fs.FS) func(string) (string, []byte, error)
```

### <a id="newInt" href="#newInt">func newInt(n int) *int</a>

```
searchKey: template.newInt
```

```Go
func newInt(n int) *int
```

Helpers for creation. 

### <a id="newString" href="#newString">func newString(s string) *string</a>

```
searchKey: template.newString
```

```Go
func newString(s string) *string
```

### <a id="newIntSlice" href="#newIntSlice">func newIntSlice(n ...int) *[]int</a>

```
searchKey: template.newIntSlice
```

```Go
func newIntSlice(n ...int) *[]int
```

### <a id="typeOf" href="#typeOf">func typeOf(arg interface{}) string</a>

```
searchKey: template.typeOf
```

```Go
func typeOf(arg interface{}) string
```

### <a id="zeroArgs" href="#zeroArgs">func zeroArgs() string</a>

```
searchKey: template.zeroArgs
```

```Go
func zeroArgs() string
```

### <a id="oneArg" href="#oneArg">func oneArg(a string) string</a>

```
searchKey: template.oneArg
```

```Go
func oneArg(a string) string
```

### <a id="twoArgs" href="#twoArgs">func twoArgs(a, b string) string</a>

```
searchKey: template.twoArgs
```

```Go
func twoArgs(a, b string) string
```

### <a id="dddArg" href="#dddArg">func dddArg(a int, b ...string) string</a>

```
searchKey: template.dddArg
```

```Go
func dddArg(a int, b ...string) string
```

### <a id="count" href="#count">func count(n int) chan string</a>

```
searchKey: template.count
```

```Go
func count(n int) chan string
```

count returns a channel that will deliver n sequential 1-letter strings starting at "a" 

### <a id="vfunc" href="#vfunc">func vfunc(V, *V) string</a>

```
searchKey: template.vfunc
```

```Go
func vfunc(V, *V) string
```

vfunc takes a *V and a V 

### <a id="valueString" href="#valueString">func valueString(v string) string</a>

```
searchKey: template.valueString
```

```Go
func valueString(v string) string
```

valueString takes a string, not a pointer. 

### <a id="returnInt" href="#returnInt">func returnInt() int</a>

```
searchKey: template.returnInt
```

```Go
func returnInt() int
```

returnInt returns an int 

### <a id="add" href="#add">func add(args ...int) int</a>

```
searchKey: template.add
```

```Go
func add(args ...int) int
```

### <a id="echo" href="#echo">func echo(arg interface{}) interface{}</a>

```
searchKey: template.echo
```

```Go
func echo(arg interface{}) interface{}
```

### <a id="makemap" href="#makemap">func makemap(arg ...string) map[string]string</a>

```
searchKey: template.makemap
```

```Go
func makemap(arg ...string) map[string]string
```

### <a id="stringer" href="#stringer">func stringer(s fmt.Stringer) string</a>

```
searchKey: template.stringer
```

```Go
func stringer(s fmt.Stringer) string
```

### <a id="mapOfThree" href="#mapOfThree">func mapOfThree() interface{}</a>

```
searchKey: template.mapOfThree
```

```Go
func mapOfThree() interface{}
```

### <a id="testExecute" href="#testExecute">func testExecute(execTests []execTest, template *Template, t *testing.T)</a>

```
searchKey: template.testExecute
```

```Go
func testExecute(execTests []execTest, template *Template, t *testing.T)
```

### <a id="TestExecute" href="#TestExecute">func TestExecute(t *testing.T)</a>

```
searchKey: template.TestExecute
```

```Go
func TestExecute(t *testing.T)
```

### <a id="TestDelims" href="#TestDelims">func TestDelims(t *testing.T)</a>

```
searchKey: template.TestDelims
```

```Go
func TestDelims(t *testing.T)
```

### <a id="TestExecuteError" href="#TestExecuteError">func TestExecuteError(t *testing.T)</a>

```
searchKey: template.TestExecuteError
```

```Go
func TestExecuteError(t *testing.T)
```

Check that an error from a method flows back to the top. 

### <a id="TestExecError" href="#TestExecError">func TestExecError(t *testing.T)</a>

```
searchKey: template.TestExecError
```

```Go
func TestExecError(t *testing.T)
```

Check that an error from a nested template contains all the relevant information. 

### <a id="TestExecError_CustomError" href="#TestExecError_CustomError">func TestExecError_CustomError(t *testing.T)</a>

```
searchKey: template.TestExecError_CustomError
```

```Go
func TestExecError_CustomError(t *testing.T)
```

Check that a custom error can be returned. 

### <a id="TestJSEscaping" href="#TestJSEscaping">func TestJSEscaping(t *testing.T)</a>

```
searchKey: template.TestJSEscaping
```

```Go
func TestJSEscaping(t *testing.T)
```

### <a id="TestTree" href="#TestTree">func TestTree(t *testing.T)</a>

```
searchKey: template.TestTree
```

```Go
func TestTree(t *testing.T)
```

### <a id="TestExecuteOnNewTemplate" href="#TestExecuteOnNewTemplate">func TestExecuteOnNewTemplate(t *testing.T)</a>

```
searchKey: template.TestExecuteOnNewTemplate
```

```Go
func TestExecuteOnNewTemplate(t *testing.T)
```

### <a id="TestMessageForExecuteEmpty" href="#TestMessageForExecuteEmpty">func TestMessageForExecuteEmpty(t *testing.T)</a>

```
searchKey: template.TestMessageForExecuteEmpty
```

```Go
func TestMessageForExecuteEmpty(t *testing.T)
```

### <a id="TestFinalForPrintf" href="#TestFinalForPrintf">func TestFinalForPrintf(t *testing.T)</a>

```
searchKey: template.TestFinalForPrintf
```

```Go
func TestFinalForPrintf(t *testing.T)
```

### <a id="TestComparison" href="#TestComparison">func TestComparison(t *testing.T)</a>

```
searchKey: template.TestComparison
```

```Go
func TestComparison(t *testing.T)
```

### <a id="TestMissingMapKey" href="#TestMissingMapKey">func TestMissingMapKey(t *testing.T)</a>

```
searchKey: template.TestMissingMapKey
```

```Go
func TestMissingMapKey(t *testing.T)
```

### <a id="TestUnterminatedStringError" href="#TestUnterminatedStringError">func TestUnterminatedStringError(t *testing.T)</a>

```
searchKey: template.TestUnterminatedStringError
```

```Go
func TestUnterminatedStringError(t *testing.T)
```

Test that the error message for multiline unterminated string refers to the line number of the opening quote. 

### <a id="TestExecuteGivesExecError" href="#TestExecuteGivesExecError">func TestExecuteGivesExecError(t *testing.T)</a>

```
searchKey: template.TestExecuteGivesExecError
```

```Go
func TestExecuteGivesExecError(t *testing.T)
```

### <a id="funcNameTestFunc" href="#funcNameTestFunc">func funcNameTestFunc() int</a>

```
searchKey: template.funcNameTestFunc
```

```Go
func funcNameTestFunc() int
```

### <a id="TestGoodFuncNames" href="#TestGoodFuncNames">func TestGoodFuncNames(t *testing.T)</a>

```
searchKey: template.TestGoodFuncNames
```

```Go
func TestGoodFuncNames(t *testing.T)
```

### <a id="TestBadFuncNames" href="#TestBadFuncNames">func TestBadFuncNames(t *testing.T)</a>

```
searchKey: template.TestBadFuncNames
```

```Go
func TestBadFuncNames(t *testing.T)
```

### <a id="testBadFuncName" href="#testBadFuncName">func testBadFuncName(name string, t *testing.T)</a>

```
searchKey: template.testBadFuncName
```

```Go
func testBadFuncName(name string, t *testing.T)
```

### <a id="TestBlock" href="#TestBlock">func TestBlock(t *testing.T)</a>

```
searchKey: template.TestBlock
```

```Go
func TestBlock(t *testing.T)
```

### <a id="TestEvalFieldErrors" href="#TestEvalFieldErrors">func TestEvalFieldErrors(t *testing.T)</a>

```
searchKey: template.TestEvalFieldErrors
```

```Go
func TestEvalFieldErrors(t *testing.T)
```

### <a id="TestMaxExecDepth" href="#TestMaxExecDepth">func TestMaxExecDepth(t *testing.T)</a>

```
searchKey: template.TestMaxExecDepth
```

```Go
func TestMaxExecDepth(t *testing.T)
```

### <a id="TestAddrOfIndex" href="#TestAddrOfIndex">func TestAddrOfIndex(t *testing.T)</a>

```
searchKey: template.TestAddrOfIndex
```

```Go
func TestAddrOfIndex(t *testing.T)
```

### <a id="TestInterfaceValues" href="#TestInterfaceValues">func TestInterfaceValues(t *testing.T)</a>

```
searchKey: template.TestInterfaceValues
```

```Go
func TestInterfaceValues(t *testing.T)
```

### <a id="TestExecutePanicDuringCall" href="#TestExecutePanicDuringCall">func TestExecutePanicDuringCall(t *testing.T)</a>

```
searchKey: template.TestExecutePanicDuringCall
```

```Go
func TestExecutePanicDuringCall(t *testing.T)
```

Check that panics during calls are recovered and returned as errors. 

### <a id="TestIssue31810" href="#TestIssue31810">func TestIssue31810(t *testing.T)</a>

```
searchKey: template.TestIssue31810
```

```Go
func TestIssue31810(t *testing.T)
```

Issue 31810. Check that a parenthesized first argument behaves properly. 

### <a id="TestIssue43065" href="#TestIssue43065">func TestIssue43065(t *testing.T)</a>

```
searchKey: template.TestIssue43065
```

```Go
func TestIssue43065(t *testing.T)
```

Issue 43065, range over send only channel 

### <a id="TestIssue39807" href="#TestIssue39807">func TestIssue39807(t *testing.T)</a>

```
searchKey: template.TestIssue39807
```

```Go
func TestIssue39807(t *testing.T)
```

Issue 39807: data race in html/template & text/template 

### <a id="TestMultiParse" href="#TestMultiParse">func TestMultiParse(t *testing.T)</a>

```
searchKey: template.TestMultiParse
```

```Go
func TestMultiParse(t *testing.T)
```

### <a id="TestMultiExecute" href="#TestMultiExecute">func TestMultiExecute(t *testing.T)</a>

```
searchKey: template.TestMultiExecute
```

```Go
func TestMultiExecute(t *testing.T)
```

### <a id="TestParseFiles" href="#TestParseFiles">func TestParseFiles(t *testing.T)</a>

```
searchKey: template.TestParseFiles
```

```Go
func TestParseFiles(t *testing.T)
```

### <a id="TestParseGlob" href="#TestParseGlob">func TestParseGlob(t *testing.T)</a>

```
searchKey: template.TestParseGlob
```

```Go
func TestParseGlob(t *testing.T)
```

### <a id="TestParseFS" href="#TestParseFS">func TestParseFS(t *testing.T)</a>

```
searchKey: template.TestParseFS
```

```Go
func TestParseFS(t *testing.T)
```

### <a id="TestParseFilesWithData" href="#TestParseFilesWithData">func TestParseFilesWithData(t *testing.T)</a>

```
searchKey: template.TestParseFilesWithData
```

```Go
func TestParseFilesWithData(t *testing.T)
```

### <a id="TestParseGlobWithData" href="#TestParseGlobWithData">func TestParseGlobWithData(t *testing.T)</a>

```
searchKey: template.TestParseGlobWithData
```

```Go
func TestParseGlobWithData(t *testing.T)
```

### <a id="TestClone" href="#TestClone">func TestClone(t *testing.T)</a>

```
searchKey: template.TestClone
```

```Go
func TestClone(t *testing.T)
```

### <a id="TestAddParseTree" href="#TestAddParseTree">func TestAddParseTree(t *testing.T)</a>

```
searchKey: template.TestAddParseTree
```

```Go
func TestAddParseTree(t *testing.T)
```

### <a id="TestAddParseTreeToUnparsedTemplate" href="#TestAddParseTreeToUnparsedTemplate">func TestAddParseTreeToUnparsedTemplate(t *testing.T)</a>

```
searchKey: template.TestAddParseTreeToUnparsedTemplate
```

```Go
func TestAddParseTreeToUnparsedTemplate(t *testing.T)
```

Issue 7032 

### <a id="TestRedefinition" href="#TestRedefinition">func TestRedefinition(t *testing.T)</a>

```
searchKey: template.TestRedefinition
```

```Go
func TestRedefinition(t *testing.T)
```

### <a id="TestEmptyTemplateCloneCrash" href="#TestEmptyTemplateCloneCrash">func TestEmptyTemplateCloneCrash(t *testing.T)</a>

```
searchKey: template.TestEmptyTemplateCloneCrash
```

```Go
func TestEmptyTemplateCloneCrash(t *testing.T)
```

Issue 10879 

### <a id="TestTemplateLookUp" href="#TestTemplateLookUp">func TestTemplateLookUp(t *testing.T)</a>

```
searchKey: template.TestTemplateLookUp
```

```Go
func TestTemplateLookUp(t *testing.T)
```

Issue 10910, 10926 

### <a id="TestNew" href="#TestNew">func TestNew(t *testing.T)</a>

```
searchKey: template.TestNew
```

```Go
func TestNew(t *testing.T)
```

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: template.TestParse
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestEmptyTemplate" href="#TestEmptyTemplate">func TestEmptyTemplate(t *testing.T)</a>

```
searchKey: template.TestEmptyTemplate
```

```Go
func TestEmptyTemplate(t *testing.T)
```

### <a id="TestIssue19294" href="#TestIssue19294">func TestIssue19294(t *testing.T)</a>

```
searchKey: template.TestIssue19294
```

```Go
func TestIssue19294(t *testing.T)
```

Issue 19249 was a regression in 1.8 caused by the handling of empty templates added in that release, which got different answers depending on the order templates appeared in the internal map. 

