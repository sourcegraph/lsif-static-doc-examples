# Package lazytemplate

Package lazytemplate is a thin wrapper over text/template, allowing the use of global template variables without forcing them to be parsed at init. 

## Index

* [Variables](#var)
    * [var inTest](#inTest)
* [Types](#type)
    * [type Template struct](#Template)
        * [func New(name, text string) *Template](#New)
        * [func (r *Template) Execute(w io.Writer, data interface{}) error](#Template.Execute)
        * [func (r *Template) build()](#Template.build)
        * [func (r *Template) tp() *template.Template](#Template.tp)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="inTest" href="#inTest">var inTest</a>

```
searchKey: lazytemplate.inTest
tags: [variable boolean private]
```

```Go
var inTest = len(os.Args) > 0 && strings.HasSuffix(strings.TrimSuffix(os.Args[0], ".exe"), ".test")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Template" href="#Template">type Template struct</a>

```
searchKey: lazytemplate.Template
tags: [struct]
```

```Go
type Template struct {
	name, text string

	once sync.Once
	tmpl *template.Template
}
```

Template is a wrapper around text/template.Template, where the underlying template will be parsed the first time it is needed. 

#### <a id="New" href="#New">func New(name, text string) *Template</a>

```
searchKey: lazytemplate.New
tags: [function]
```

```Go
func New(name, text string) *Template
```

New creates a new lazy template, delaying the parsing work until it is first needed. If the code is being run as part of tests, the template parsing will happen immediately. 

#### <a id="Template.Execute" href="#Template.Execute">func (r *Template) Execute(w io.Writer, data interface{}) error</a>

```
searchKey: lazytemplate.Template.Execute
tags: [method]
```

```Go
func (r *Template) Execute(w io.Writer, data interface{}) error
```

#### <a id="Template.build" href="#Template.build">func (r *Template) build()</a>

```
searchKey: lazytemplate.Template.build
tags: [method private]
```

```Go
func (r *Template) build()
```

#### <a id="Template.tp" href="#Template.tp">func (r *Template) tp() *template.Template</a>

```
searchKey: lazytemplate.Template.tp
tags: [method private]
```

```Go
func (r *Template) tp() *template.Template
```

