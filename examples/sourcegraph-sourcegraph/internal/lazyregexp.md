# Package lazyregexp

Package lazyregexp is a thin wrapper over regexp, allowing the use of global regexp variables without forcing them to be compiled at init. 

## Index

* [Variables](#var)
    * [var inTest](#inTest)
* [Types](#type)
    * [type Regexp struct](#Regexp)
        * [func New(str string) *Regexp](#New)
        * [func NewPOSIX(str string) *Regexp](#NewPOSIX)
        * [func (r *Regexp) FindAllIndex(b []byte, n int) [][]int](#Regexp.FindAllIndex)
        * [func (r *Regexp) FindAllString(s string, n int) []string](#Regexp.FindAllString)
        * [func (r *Regexp) FindAllStringSubmatch(s string, n int) [][]string](#Regexp.FindAllStringSubmatch)
        * [func (r *Regexp) FindString(s string) string](#Regexp.FindString)
        * [func (r *Regexp) FindStringSubmatch(s string) []string](#Regexp.FindStringSubmatch)
        * [func (r *Regexp) FindStringSubmatchIndex(s string) []int](#Regexp.FindStringSubmatchIndex)
        * [func (r *Regexp) FindSubmatch(s []byte) [][]byte](#Regexp.FindSubmatch)
        * [func (r *Regexp) Match(b []byte) bool](#Regexp.Match)
        * [func (r *Regexp) MatchString(s string) bool](#Regexp.MatchString)
        * [func (r *Regexp) ReplaceAll(src, repl []byte) []byte](#Regexp.ReplaceAll)
        * [func (r *Regexp) ReplaceAllLiteralString(src, repl string) string](#Regexp.ReplaceAllLiteralString)
        * [func (r *Regexp) ReplaceAllString(src, repl string) string](#Regexp.ReplaceAllString)
        * [func (r *Regexp) ReplaceAllStringFunc(src string, repl func(string) string) string](#Regexp.ReplaceAllStringFunc)
        * [func (r *Regexp) Split(s string, n int) []string](#Regexp.Split)
        * [func (r *Regexp) SubexpNames() []string](#Regexp.SubexpNames)
        * [func (r *Regexp) build()](#Regexp.build)
        * [func (r *Regexp) re() *regexp.Regexp](#Regexp.re)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="inTest" href="#inTest">var inTest</a>

```
searchKey: lazyregexp.inTest
tags: [variable boolean private]
```

```Go
var inTest = len(os.Args) > 0 && strings.HasSuffix(strings.TrimSuffix(os.Args[0], ".exe"), ".test")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Regexp" href="#Regexp">type Regexp struct</a>

```
searchKey: lazyregexp.Regexp
tags: [struct]
```

```Go
type Regexp struct {
	str   string
	posix bool
	once  sync.Once
	rx    *regexp.Regexp
}
```

Regexp is a wrapper around regexp.Regexp, where the underlying regexp will be compiled the first time it is needed. 

#### <a id="New" href="#New">func New(str string) *Regexp</a>

```
searchKey: lazyregexp.New
tags: [function]
```

```Go
func New(str string) *Regexp
```

New creates a new lazy regexp, delaying the compiling work until it is first needed. If the code is being run as part of tests, the regexp compiling will happen immediately. 

#### <a id="NewPOSIX" href="#NewPOSIX">func NewPOSIX(str string) *Regexp</a>

```
searchKey: lazyregexp.NewPOSIX
tags: [function]
```

```Go
func NewPOSIX(str string) *Regexp
```

NewPOSIX creates a new lazy regexp, delaying the compiling work until it is first needed. If the code is being run as part of tests, the regexp compiling will happen immediately. 

#### <a id="Regexp.FindAllIndex" href="#Regexp.FindAllIndex">func (r *Regexp) FindAllIndex(b []byte, n int) [][]int</a>

```
searchKey: lazyregexp.Regexp.FindAllIndex
tags: [method]
```

```Go
func (r *Regexp) FindAllIndex(b []byte, n int) [][]int
```

#### <a id="Regexp.FindAllString" href="#Regexp.FindAllString">func (r *Regexp) FindAllString(s string, n int) []string</a>

```
searchKey: lazyregexp.Regexp.FindAllString
tags: [method]
```

```Go
func (r *Regexp) FindAllString(s string, n int) []string
```

#### <a id="Regexp.FindAllStringSubmatch" href="#Regexp.FindAllStringSubmatch">func (r *Regexp) FindAllStringSubmatch(s string, n int) [][]string</a>

```
searchKey: lazyregexp.Regexp.FindAllStringSubmatch
tags: [method]
```

```Go
func (r *Regexp) FindAllStringSubmatch(s string, n int) [][]string
```

#### <a id="Regexp.FindString" href="#Regexp.FindString">func (r *Regexp) FindString(s string) string</a>

```
searchKey: lazyregexp.Regexp.FindString
tags: [method]
```

```Go
func (r *Regexp) FindString(s string) string
```

#### <a id="Regexp.FindStringSubmatch" href="#Regexp.FindStringSubmatch">func (r *Regexp) FindStringSubmatch(s string) []string</a>

```
searchKey: lazyregexp.Regexp.FindStringSubmatch
tags: [method]
```

```Go
func (r *Regexp) FindStringSubmatch(s string) []string
```

#### <a id="Regexp.FindStringSubmatchIndex" href="#Regexp.FindStringSubmatchIndex">func (r *Regexp) FindStringSubmatchIndex(s string) []int</a>

```
searchKey: lazyregexp.Regexp.FindStringSubmatchIndex
tags: [method]
```

```Go
func (r *Regexp) FindStringSubmatchIndex(s string) []int
```

#### <a id="Regexp.FindSubmatch" href="#Regexp.FindSubmatch">func (r *Regexp) FindSubmatch(s []byte) [][]byte</a>

```
searchKey: lazyregexp.Regexp.FindSubmatch
tags: [method]
```

```Go
func (r *Regexp) FindSubmatch(s []byte) [][]byte
```

#### <a id="Regexp.Match" href="#Regexp.Match">func (r *Regexp) Match(b []byte) bool</a>

```
searchKey: lazyregexp.Regexp.Match
tags: [method]
```

```Go
func (r *Regexp) Match(b []byte) bool
```

#### <a id="Regexp.MatchString" href="#Regexp.MatchString">func (r *Regexp) MatchString(s string) bool</a>

```
searchKey: lazyregexp.Regexp.MatchString
tags: [method]
```

```Go
func (r *Regexp) MatchString(s string) bool
```

#### <a id="Regexp.ReplaceAll" href="#Regexp.ReplaceAll">func (r *Regexp) ReplaceAll(src, repl []byte) []byte</a>

```
searchKey: lazyregexp.Regexp.ReplaceAll
tags: [method]
```

```Go
func (r *Regexp) ReplaceAll(src, repl []byte) []byte
```

#### <a id="Regexp.ReplaceAllLiteralString" href="#Regexp.ReplaceAllLiteralString">func (r *Regexp) ReplaceAllLiteralString(src, repl string) string</a>

```
searchKey: lazyregexp.Regexp.ReplaceAllLiteralString
tags: [method]
```

```Go
func (r *Regexp) ReplaceAllLiteralString(src, repl string) string
```

#### <a id="Regexp.ReplaceAllString" href="#Regexp.ReplaceAllString">func (r *Regexp) ReplaceAllString(src, repl string) string</a>

```
searchKey: lazyregexp.Regexp.ReplaceAllString
tags: [method]
```

```Go
func (r *Regexp) ReplaceAllString(src, repl string) string
```

#### <a id="Regexp.ReplaceAllStringFunc" href="#Regexp.ReplaceAllStringFunc">func (r *Regexp) ReplaceAllStringFunc(src string, repl func(string) string) string</a>

```
searchKey: lazyregexp.Regexp.ReplaceAllStringFunc
tags: [method]
```

```Go
func (r *Regexp) ReplaceAllStringFunc(src string, repl func(string) string) string
```

#### <a id="Regexp.Split" href="#Regexp.Split">func (r *Regexp) Split(s string, n int) []string</a>

```
searchKey: lazyregexp.Regexp.Split
tags: [method]
```

```Go
func (r *Regexp) Split(s string, n int) []string
```

#### <a id="Regexp.SubexpNames" href="#Regexp.SubexpNames">func (r *Regexp) SubexpNames() []string</a>

```
searchKey: lazyregexp.Regexp.SubexpNames
tags: [method]
```

```Go
func (r *Regexp) SubexpNames() []string
```

#### <a id="Regexp.build" href="#Regexp.build">func (r *Regexp) build()</a>

```
searchKey: lazyregexp.Regexp.build
tags: [method private]
```

```Go
func (r *Regexp) build()
```

#### <a id="Regexp.re" href="#Regexp.re">func (r *Regexp) re() *regexp.Regexp</a>

```
searchKey: lazyregexp.Regexp.re
tags: [method private]
```

```Go
func (r *Regexp) re() *regexp.Regexp
```

