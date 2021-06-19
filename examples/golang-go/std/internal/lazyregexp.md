# Package lazyregexp

Package lazyregexp is a thin wrapper over regexp, allowing the use of global regexp variables without forcing them to be compiled at init. 

## Index

* [Variables](#var)
    * [var inTest](#inTest)
* [Types](#type)
    * [type Regexp struct](#Regexp)
        * [func New(str string) *Regexp](#New)
        * [func (r *Regexp) re() *regexp.Regexp](#Regexp.re)
        * [func (r *Regexp) build()](#Regexp.build)
        * [func (r *Regexp) FindSubmatch(s []byte) [][]byte](#Regexp.FindSubmatch)
        * [func (r *Regexp) FindStringSubmatch(s string) []string](#Regexp.FindStringSubmatch)
        * [func (r *Regexp) FindStringSubmatchIndex(s string) []int](#Regexp.FindStringSubmatchIndex)
        * [func (r *Regexp) ReplaceAllString(src, repl string) string](#Regexp.ReplaceAllString)
        * [func (r *Regexp) FindString(s string) string](#Regexp.FindString)
        * [func (r *Regexp) FindAllString(s string, n int) []string](#Regexp.FindAllString)
        * [func (r *Regexp) MatchString(s string) bool](#Regexp.MatchString)
        * [func (r *Regexp) SubexpNames() []string](#Regexp.SubexpNames)


## <a id="var" href="#var">Variables</a>

### <a id="inTest" href="#inTest">var inTest</a>

```
searchKey: lazyregexp.inTest
```

```Go
var inTest = len(os.Args) > 0 && strings.HasSuffix(strings.TrimSuffix(os.Args[0], ".exe"), ".test")
```

## <a id="type" href="#type">Types</a>

### <a id="Regexp" href="#Regexp">type Regexp struct</a>

```
searchKey: lazyregexp.Regexp
tags: [exported]
```

```Go
type Regexp struct {
	str  string
	once sync.Once
	rx   *regexp.Regexp
}
```

Regexp is a wrapper around regexp.Regexp, where the underlying regexp will be compiled the first time it is needed. 

#### <a id="New" href="#New">func New(str string) *Regexp</a>

```
searchKey: lazyregexp.New
tags: [exported]
```

```Go
func New(str string) *Regexp
```

New creates a new lazy regexp, delaying the compiling work until it is first needed. If the code is being run as part of tests, the regexp compiling will happen immediately. 

#### <a id="Regexp.re" href="#Regexp.re">func (r *Regexp) re() *regexp.Regexp</a>

```
searchKey: lazyregexp.Regexp.re
```

```Go
func (r *Regexp) re() *regexp.Regexp
```

#### <a id="Regexp.build" href="#Regexp.build">func (r *Regexp) build()</a>

```
searchKey: lazyregexp.Regexp.build
```

```Go
func (r *Regexp) build()
```

#### <a id="Regexp.FindSubmatch" href="#Regexp.FindSubmatch">func (r *Regexp) FindSubmatch(s []byte) [][]byte</a>

```
searchKey: lazyregexp.Regexp.FindSubmatch
tags: [exported]
```

```Go
func (r *Regexp) FindSubmatch(s []byte) [][]byte
```

#### <a id="Regexp.FindStringSubmatch" href="#Regexp.FindStringSubmatch">func (r *Regexp) FindStringSubmatch(s string) []string</a>

```
searchKey: lazyregexp.Regexp.FindStringSubmatch
tags: [exported]
```

```Go
func (r *Regexp) FindStringSubmatch(s string) []string
```

#### <a id="Regexp.FindStringSubmatchIndex" href="#Regexp.FindStringSubmatchIndex">func (r *Regexp) FindStringSubmatchIndex(s string) []int</a>

```
searchKey: lazyregexp.Regexp.FindStringSubmatchIndex
tags: [exported]
```

```Go
func (r *Regexp) FindStringSubmatchIndex(s string) []int
```

#### <a id="Regexp.ReplaceAllString" href="#Regexp.ReplaceAllString">func (r *Regexp) ReplaceAllString(src, repl string) string</a>

```
searchKey: lazyregexp.Regexp.ReplaceAllString
tags: [exported]
```

```Go
func (r *Regexp) ReplaceAllString(src, repl string) string
```

#### <a id="Regexp.FindString" href="#Regexp.FindString">func (r *Regexp) FindString(s string) string</a>

```
searchKey: lazyregexp.Regexp.FindString
tags: [exported]
```

```Go
func (r *Regexp) FindString(s string) string
```

#### <a id="Regexp.FindAllString" href="#Regexp.FindAllString">func (r *Regexp) FindAllString(s string, n int) []string</a>

```
searchKey: lazyregexp.Regexp.FindAllString
tags: [exported]
```

```Go
func (r *Regexp) FindAllString(s string, n int) []string
```

#### <a id="Regexp.MatchString" href="#Regexp.MatchString">func (r *Regexp) MatchString(s string) bool</a>

```
searchKey: lazyregexp.Regexp.MatchString
tags: [exported]
```

```Go
func (r *Regexp) MatchString(s string) bool
```

#### <a id="Regexp.SubexpNames" href="#Regexp.SubexpNames">func (r *Regexp) SubexpNames() []string</a>

```
searchKey: lazyregexp.Regexp.SubexpNames
tags: [exported]
```

```Go
func (r *Regexp) SubexpNames() []string
```

