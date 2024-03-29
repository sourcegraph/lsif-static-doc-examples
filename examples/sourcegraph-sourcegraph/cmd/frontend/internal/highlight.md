# Package highlight

## Index

* [Variables](#var)
    * [var ErrBinary](#ErrBinary)
    * [var Mocks](#Mocks)
    * [var SyntectLanguageMap](#SyntectLanguageMap)
    * [var client](#client)
    * [var emptyMocks](#emptyMocks)
    * [var metricRequestHistogram](#metricRequestHistogram)
    * [var requestCounter](#requestCounter)
    * [var syntectServer](#syntectServer)
* [Types](#type)
    * [type LineRange struct](#LineRange)
    * [type Metadata struct](#Metadata)
    * [type Params struct](#Params)
* [Functions](#func)
    * [func Code(ctx context.Context, p Params) (h template.HTML, aborted bool, err error)](#Code)
    * [func CodeAsLines(ctx context.Context, p Params) ([]template.HTML, bool, error)](#CodeAsLines)
    * [func IsBinary(content []byte) bool](#IsBinary)
    * [func ResetMocks()](#ResetMocks)
    * [func SplitLineRanges(html template.HTML, ranges []LineRange) ([][]string, error)](#SplitLineRanges)
    * [func TestCodeAsLines(t *testing.T)](#TestCodeAsLines)
    * [func TestGeneratePlainTable(t *testing.T)](#TestGeneratePlainTable)
    * [func TestGeneratePlainTableSecurity(t *testing.T)](#TestGeneratePlainTableSecurity)
    * [func TestSplitHighlightedLines(t *testing.T)](#TestSplitHighlightedLines)
    * [func TestSplitLineRanges(t *testing.T)](#TestSplitLineRanges)
    * [func Test_normalizeFilepath(t *testing.T)](#Test_normalizeFilepath)
    * [func firstCharacters(s string, n int) string](#firstCharacters)
    * [func generatePlainTable(code string) (template.HTML, error)](#generatePlainTable)
    * [func init()](#init.highlight.go)
    * [func normalizeFilepath(p string) string](#normalizeFilepath)
    * [func splitHighlightedLines(input template.HTML, wholeRow bool) ([]template.HTML, error)](#splitHighlightedLines)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrBinary" href="#ErrBinary">var ErrBinary</a>

```
searchKey: highlight.ErrBinary
tags: [variable interface]
```

```Go
var ErrBinary = errors.New("cannot render binary file")
```

ErrBinary is returned when a binary file was attempted to be highlighted. 

### <a id="Mocks" href="#Mocks">var Mocks</a>

```
searchKey: highlight.Mocks
tags: [variable struct]
```

```Go
var Mocks, emptyMocks struct {
	Code func(p Params) (h template.HTML, aborted bool, err error)
}
```

Mocks is used to mock behavior in tests. Tests must call ResetMocks() when finished to ensure its mocks are not (inadvertently) used by subsequent tests. 

(The emptyMocks is used by ResetMocks to zero out Mocks without needing to use a named type.) 

### <a id="SyntectLanguageMap" href="#SyntectLanguageMap">var SyntectLanguageMap</a>

```
searchKey: highlight.SyntectLanguageMap
tags: [variable object]
```

```Go
var SyntectLanguageMap = ...
```

SyntectLanguageMap is a map that maps language identifiers that may be provided at the end of markdown code fences to valid syntect file extensions. 

### <a id="client" href="#client">var client</a>

```
searchKey: highlight.client
tags: [variable struct private]
```

```Go
var client *gosyntect.Client
```

### <a id="emptyMocks" href="#emptyMocks">var emptyMocks</a>

```
searchKey: highlight.emptyMocks
tags: [variable struct private]
```

```Go
var Mocks, emptyMocks struct {
	Code func(p Params) (h template.HTML, aborted bool, err error)
}
```

Mocks is used to mock behavior in tests. Tests must call ResetMocks() when finished to ensure its mocks are not (inadvertently) used by subsequent tests. 

(The emptyMocks is used by ResetMocks to zero out Mocks without needing to use a named type.) 

### <a id="metricRequestHistogram" href="#metricRequestHistogram">var metricRequestHistogram</a>

```
searchKey: highlight.metricRequestHistogram
tags: [variable interface private]
```

```Go
var metricRequestHistogram = ...
```

### <a id="requestCounter" href="#requestCounter">var requestCounter</a>

```
searchKey: highlight.requestCounter
tags: [variable struct private]
```

```Go
var requestCounter = ...
```

TODO (Dax): Determine if Histogram provides value and either use only histogram or counter, not both 

### <a id="syntectServer" href="#syntectServer">var syntectServer</a>

```
searchKey: highlight.syntectServer
tags: [variable string private]
```

```Go
var syntectServer = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="LineRange" href="#LineRange">type LineRange struct</a>

```
searchKey: highlight.LineRange
tags: [struct]
```

```Go
type LineRange struct {
	// StartLine is the 0-based inclusive start line of the range.
	StartLine int32

	// EndLine is the 0-based exclusive end line of the range.
	EndLine int32
}
```

LineRange describes a line range. 

It uses int32 for GraphQL compatability. 

### <a id="Metadata" href="#Metadata">type Metadata struct</a>

```
searchKey: highlight.Metadata
tags: [struct]
```

```Go
type Metadata struct {
	RepoName string
	Revision string
}
```

Metadata contains metadata about a request to highlight code. It is used to ensure that when syntax highlighting takes a long time or errors out, we can log enough information to track down what the problematic code we were trying to highlight was. 

All fields are optional. 

### <a id="Params" href="#Params">type Params struct</a>

```
searchKey: highlight.Params
tags: [struct]
```

```Go
type Params struct {
	// Content is the file content.
	Content []byte

	// Filepath is used to detect the language, it must contain at least the
	// file name + extension.
	Filepath string

	// DisableTimeout indicates whether or not a user has requested to wait as
	// long as needed to get highlighted results (this should never be on by
	// default, as some files can take a very long time to highlight).
	DisableTimeout bool

	// Whether or not the light theme should be used to highlight the code.
	IsLightTheme bool

	// HighlightLongLines, if true, highlighting lines which are greater than
	// 2000 bytes is enabled. This may produce a significant amount of HTML
	// which some browsers (such as Chrome, but not Firefox) may have trouble
	// rendering efficiently.
	HighlightLongLines bool

	// Whether or not to simulate the syntax highlighter taking too long to
	// respond.
	SimulateTimeout bool

	// Metadata provides optional metadata about the code we're highlighting.
	Metadata Metadata
}
```

Params defines mandatory and optional parameters to use when highlighting code. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Code" href="#Code">func Code(ctx context.Context, p Params) (h template.HTML, aborted bool, err error)</a>

```
searchKey: highlight.Code
tags: [function]
```

```Go
func Code(ctx context.Context, p Params) (h template.HTML, aborted bool, err error)
```

Code highlights the given file content with the given filepath (must contain at least the file name + extension) and returns the properly escaped HTML table representing the highlighted code. 

The returned boolean represents whether or not highlighting was aborted due to timeout. In this scenario, a plain text table is returned. 

In the event the input content is binary, ErrBinary is returned. 

### <a id="CodeAsLines" href="#CodeAsLines">func CodeAsLines(ctx context.Context, p Params) ([]template.HTML, bool, error)</a>

```
searchKey: highlight.CodeAsLines
tags: [function]
```

```Go
func CodeAsLines(ctx context.Context, p Params) ([]template.HTML, bool, error)
```

CodeAsLines highlights the file and returns a list of highlighted lines. The returned boolean represents whether or not highlighting was aborted due to timeout. 

In the event the input content is binary, ErrBinary is returned. 

### <a id="IsBinary" href="#IsBinary">func IsBinary(content []byte) bool</a>

```
searchKey: highlight.IsBinary
tags: [function]
```

```Go
func IsBinary(content []byte) bool
```

IsBinary is a helper to tell if the content of a file is binary or not. 

### <a id="ResetMocks" href="#ResetMocks">func ResetMocks()</a>

```
searchKey: highlight.ResetMocks
tags: [function]
```

```Go
func ResetMocks()
```

ResetMocks clears the mock functions set on Mocks (so that subsequent tests don't inadvertently use them). 

### <a id="SplitLineRanges" href="#SplitLineRanges">func SplitLineRanges(html template.HTML, ranges []LineRange) ([][]string, error)</a>

```
searchKey: highlight.SplitLineRanges
tags: [function]
```

```Go
func SplitLineRanges(html template.HTML, ranges []LineRange) ([][]string, error)
```

SplitLineRanges takes a syntax highlighted HTML table (returned by highlight.Code) and splits out the specified line ranges, returning HTML table rows `<tr>...</tr>` for each line range. 

Input line ranges will automatically be clamped within the bounds of the file. 

### <a id="TestCodeAsLines" href="#TestCodeAsLines">func TestCodeAsLines(t *testing.T)</a>

```
searchKey: highlight.TestCodeAsLines
tags: [function private test]
```

```Go
func TestCodeAsLines(t *testing.T)
```

### <a id="TestGeneratePlainTable" href="#TestGeneratePlainTable">func TestGeneratePlainTable(t *testing.T)</a>

```
searchKey: highlight.TestGeneratePlainTable
tags: [function private test]
```

```Go
func TestGeneratePlainTable(t *testing.T)
```

### <a id="TestGeneratePlainTableSecurity" href="#TestGeneratePlainTableSecurity">func TestGeneratePlainTableSecurity(t *testing.T)</a>

```
searchKey: highlight.TestGeneratePlainTableSecurity
tags: [function private test]
```

```Go
func TestGeneratePlainTableSecurity(t *testing.T)
```

### <a id="TestSplitHighlightedLines" href="#TestSplitHighlightedLines">func TestSplitHighlightedLines(t *testing.T)</a>

```
searchKey: highlight.TestSplitHighlightedLines
tags: [function private test]
```

```Go
func TestSplitHighlightedLines(t *testing.T)
```

### <a id="TestSplitLineRanges" href="#TestSplitLineRanges">func TestSplitLineRanges(t *testing.T)</a>

```
searchKey: highlight.TestSplitLineRanges
tags: [function private test]
```

```Go
func TestSplitLineRanges(t *testing.T)
```

### <a id="Test_normalizeFilepath" href="#Test_normalizeFilepath">func Test_normalizeFilepath(t *testing.T)</a>

```
searchKey: highlight.Test_normalizeFilepath
tags: [function private test]
```

```Go
func Test_normalizeFilepath(t *testing.T)
```

### <a id="firstCharacters" href="#firstCharacters">func firstCharacters(s string, n int) string</a>

```
searchKey: highlight.firstCharacters
tags: [function private]
```

```Go
func firstCharacters(s string, n int) string
```

### <a id="generatePlainTable" href="#generatePlainTable">func generatePlainTable(code string) (template.HTML, error)</a>

```
searchKey: highlight.generatePlainTable
tags: [function private]
```

```Go
func generatePlainTable(code string) (template.HTML, error)
```

### <a id="init.highlight.go" href="#init.highlight.go">func init()</a>

```
searchKey: highlight.init
tags: [function private]
```

```Go
func init()
```

### <a id="normalizeFilepath" href="#normalizeFilepath">func normalizeFilepath(p string) string</a>

```
searchKey: highlight.normalizeFilepath
tags: [function private]
```

```Go
func normalizeFilepath(p string) string
```

normalizeFilepath ensures that the filepath p has a lowercase extension, i.e. it applies the following transformations: 

```
a/b/c/FOO.TXT → a/b/c/FOO.txt
FOO.Sh → FOO.sh

```
The following are left unmodified, as they already have lowercase extensions: 

```
a/b/c/FOO.txt
a/b/c/Makefile
Makefile.am
FOO.txt

```
It expects the filepath uses forward slashes always. 

### <a id="splitHighlightedLines" href="#splitHighlightedLines">func splitHighlightedLines(input template.HTML, wholeRow bool) ([]template.HTML, error)</a>

```
searchKey: highlight.splitHighlightedLines
tags: [function private]
```

```Go
func splitHighlightedLines(input template.HTML, wholeRow bool) ([]template.HTML, error)
```

splitHighlightedLines takes the highlighted HTML table and returns a slice of highlighted strings, where each string corresponds a single line in the original, highlighted file. 

