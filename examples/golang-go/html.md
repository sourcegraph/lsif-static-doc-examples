# Package html

Package html provides functions for escaping and unescaping HTML text. 

## Index

* Subpages
  * [html/template](html/template.md)
  * [html/template_test](html/template_test.md)
* [Constants](#const)
    * [const longestEntityWithoutSemicolon](#longestEntityWithoutSemicolon)
* [Variables](#var)
    * [var benchEscapeData](#benchEscapeData)
    * [var benchEscapeNone](#benchEscapeNone)
    * [var benchUnescapeDense](#benchUnescapeDense)
    * [var benchUnescapeSparse](#benchUnescapeSparse)
    * [var entity](#entity)
    * [var entity2](#entity2)
    * [var htmlEscaper](#htmlEscaper)
    * [var populateMapsOnce](#populateMapsOnce)
    * [var replacementTable](#replacementTable)
    * [var unescapeTests](#unescapeTests)
* [Types](#type)
    * [type unescapeTest struct](#unescapeTest)
* [Functions](#func)
    * [func BenchmarkEscape(b *testing.B)](#BenchmarkEscape)
    * [func BenchmarkEscapeNone(b *testing.B)](#BenchmarkEscapeNone)
    * [func BenchmarkUnescape(b *testing.B)](#BenchmarkUnescape)
    * [func BenchmarkUnescapeDense(b *testing.B)](#BenchmarkUnescapeDense)
    * [func BenchmarkUnescapeNone(b *testing.B)](#BenchmarkUnescapeNone)
    * [func BenchmarkUnescapeSparse(b *testing.B)](#BenchmarkUnescapeSparse)
    * [func EscapeString(s string) string](#EscapeString)
    * [func TestEntityLength(t *testing.T)](#TestEntityLength)
    * [func TestUnescape(t *testing.T)](#TestUnescape)
    * [func TestUnescapeEscape(t *testing.T)](#TestUnescapeEscape)
    * [func UnescapeString(s string) string](#UnescapeString)
    * [func init()](#init.entity_test.go)
    * [func populateMaps()](#populateMaps)
    * [func unescapeEntity(b []byte, dst, src int) (dst1, src1 int)](#unescapeEntity)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="longestEntityWithoutSemicolon" href="#longestEntityWithoutSemicolon">const longestEntityWithoutSemicolon</a>

```
searchKey: html.longestEntityWithoutSemicolon
tags: [constant number private]
```

```Go
const longestEntityWithoutSemicolon = 6
```

All entities that do not end with ';' are 6 or fewer bytes long. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="benchEscapeData" href="#benchEscapeData">var benchEscapeData</a>

```
searchKey: html.benchEscapeData
tags: [variable string private]
```

```Go
var benchEscapeData = strings.Repeat("AAAAA < BBBBB > CCCCC & DDDDD ' EEEEE \" ", 100)
```

### <a id="benchEscapeNone" href="#benchEscapeNone">var benchEscapeNone</a>

```
searchKey: html.benchEscapeNone
tags: [variable string private]
```

```Go
var benchEscapeNone = strings.Repeat("AAAAA x BBBBB x CCCCC x DDDDD x EEEEE x ", 100)
```

### <a id="benchUnescapeDense" href="#benchUnescapeDense">var benchUnescapeDense</a>

```
searchKey: html.benchUnescapeDense
tags: [variable string private]
```

```Go
var benchUnescapeDense = strings.Repeat("&amp;&lt; &amp; &lt;", 100)
```

### <a id="benchUnescapeSparse" href="#benchUnescapeSparse">var benchUnescapeSparse</a>

```
searchKey: html.benchUnescapeSparse
tags: [variable string private]
```

```Go
var benchUnescapeSparse = ...
```

### <a id="entity" href="#entity">var entity</a>

```
searchKey: html.entity
tags: [variable object private]
```

```Go
var entity map[string]rune
```

entity is a map from HTML entity names to their values. The semicolon matters: [https://html.spec.whatwg.org/multipage/named-characters.html](https://html.spec.whatwg.org/multipage/named-characters.html) lists both "amp" and "amp;" as two separate entries. 

Note that the HTML5 list is larger than the HTML4 list at [http://www.w3.org/TR/html4/sgml/entities.html](http://www.w3.org/TR/html4/sgml/entities.html) 

### <a id="entity2" href="#entity2">var entity2</a>

```
searchKey: html.entity2
tags: [variable object private]
```

```Go
var entity2 map[string][2]rune
```

HTML entities that are two unicode codepoints. 

### <a id="htmlEscaper" href="#htmlEscaper">var htmlEscaper</a>

```
searchKey: html.htmlEscaper
tags: [variable struct private]
```

```Go
var htmlEscaper = ...
```

### <a id="populateMapsOnce" href="#populateMapsOnce">var populateMapsOnce</a>

```
searchKey: html.populateMapsOnce
tags: [variable struct private]
```

```Go
var populateMapsOnce sync.Once
```

populateMapsOnce guards calling populateMaps. 

### <a id="replacementTable" href="#replacementTable">var replacementTable</a>

```
searchKey: html.replacementTable
tags: [variable array number private]
```

```Go
var replacementTable = ...
```

These replacements permit compatibility with old numeric entities that assumed Windows-1252 encoding. [https://html.spec.whatwg.org/multipage/parsing.html#numeric-character-reference-end-state](https://html.spec.whatwg.org/multipage/parsing.html#numeric-character-reference-end-state) 

### <a id="unescapeTests" href="#unescapeTests">var unescapeTests</a>

```
searchKey: html.unescapeTests
tags: [variable array struct private]
```

```Go
var unescapeTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="unescapeTest" href="#unescapeTest">type unescapeTest struct</a>

```
searchKey: html.unescapeTest
tags: [struct private]
```

```Go
type unescapeTest struct {
	// A short description of the test case.
	desc string
	// The HTML text.
	html string
	// The unescaped text.
	unescaped string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkEscape" href="#BenchmarkEscape">func BenchmarkEscape(b *testing.B)</a>

```
searchKey: html.BenchmarkEscape
tags: [method private benchmark]
```

```Go
func BenchmarkEscape(b *testing.B)
```

### <a id="BenchmarkEscapeNone" href="#BenchmarkEscapeNone">func BenchmarkEscapeNone(b *testing.B)</a>

```
searchKey: html.BenchmarkEscapeNone
tags: [method private benchmark]
```

```Go
func BenchmarkEscapeNone(b *testing.B)
```

### <a id="BenchmarkUnescape" href="#BenchmarkUnescape">func BenchmarkUnescape(b *testing.B)</a>

```
searchKey: html.BenchmarkUnescape
tags: [method private benchmark]
```

```Go
func BenchmarkUnescape(b *testing.B)
```

### <a id="BenchmarkUnescapeDense" href="#BenchmarkUnescapeDense">func BenchmarkUnescapeDense(b *testing.B)</a>

```
searchKey: html.BenchmarkUnescapeDense
tags: [method private benchmark]
```

```Go
func BenchmarkUnescapeDense(b *testing.B)
```

### <a id="BenchmarkUnescapeNone" href="#BenchmarkUnescapeNone">func BenchmarkUnescapeNone(b *testing.B)</a>

```
searchKey: html.BenchmarkUnescapeNone
tags: [method private benchmark]
```

```Go
func BenchmarkUnescapeNone(b *testing.B)
```

### <a id="BenchmarkUnescapeSparse" href="#BenchmarkUnescapeSparse">func BenchmarkUnescapeSparse(b *testing.B)</a>

```
searchKey: html.BenchmarkUnescapeSparse
tags: [method private benchmark]
```

```Go
func BenchmarkUnescapeSparse(b *testing.B)
```

### <a id="EscapeString" href="#EscapeString">func EscapeString(s string) string</a>

```
searchKey: html.EscapeString
tags: [method]
```

```Go
func EscapeString(s string) string
```

EscapeString escapes special characters like "<" to become "&lt;". It escapes only five such characters: <, >, &, ' and ". UnescapeString(EscapeString(s)) == s always holds, but the converse isn't always true. 

### <a id="TestEntityLength" href="#TestEntityLength">func TestEntityLength(t *testing.T)</a>

```
searchKey: html.TestEntityLength
tags: [method private test]
```

```Go
func TestEntityLength(t *testing.T)
```

### <a id="TestUnescape" href="#TestUnescape">func TestUnescape(t *testing.T)</a>

```
searchKey: html.TestUnescape
tags: [method private test]
```

```Go
func TestUnescape(t *testing.T)
```

### <a id="TestUnescapeEscape" href="#TestUnescapeEscape">func TestUnescapeEscape(t *testing.T)</a>

```
searchKey: html.TestUnescapeEscape
tags: [method private test]
```

```Go
func TestUnescapeEscape(t *testing.T)
```

### <a id="UnescapeString" href="#UnescapeString">func UnescapeString(s string) string</a>

```
searchKey: html.UnescapeString
tags: [method]
```

```Go
func UnescapeString(s string) string
```

UnescapeString unescapes entities like "&lt;" to become "<". It unescapes a larger range of entities than EscapeString escapes. For example, "&aacute;" unescapes to "á", as does "&#225;" and "&#xE1;". UnescapeString(EscapeString(s)) == s always holds, but the converse isn't always true. 

### <a id="init.entity_test.go" href="#init.entity_test.go">func init()</a>

```
searchKey: html.init
tags: [function private]
```

```Go
func init()
```

### <a id="populateMaps" href="#populateMaps">func populateMaps()</a>

```
searchKey: html.populateMaps
tags: [function private]
```

```Go
func populateMaps()
```

populateMaps populates entity and entity2. 

### <a id="unescapeEntity" href="#unescapeEntity">func unescapeEntity(b []byte, dst, src int) (dst1, src1 int)</a>

```
searchKey: html.unescapeEntity
tags: [method private]
```

```Go
func unescapeEntity(b []byte, dst, src int) (dst1, src1 int)
```

unescapeEntity reads an entity like "&lt;" from b[src:] and writes the corresponding "<" to b[dst:], returning the incremented dst and src cursors. Precondition: b[src] == '&' && dst <= src. 

