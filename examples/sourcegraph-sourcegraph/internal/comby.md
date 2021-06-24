# Package comby

## Index

* [Constants](#const)
    * [const combyPath](#combyPath)
* [Variables](#var)
    * [var MatchHoleRegexp](#MatchHoleRegexp)
    * [var matchRegexpPattern](#matchRegexpPattern)
    * [var onMatchWhitespace](#onMatchWhitespace)
* [Types](#type)
    * [type Args struct](#Args)
        * [func (args Args) String() string](#Args.String)
    * [type DirPath string](#DirPath)
        * [func (DirPath) Value()](#DirPath.Value)
    * [type FileDiff struct](#FileDiff)
    * [type FileMatch struct](#FileMatch)
    * [type Hole string](#Hole)
        * [func (t Hole) String() string](#Hole.String)
        * [func (Hole) term()](#Hole.term)
    * [type Input interface](#Input)
    * [type Literal string](#Literal)
        * [func (t Literal) String() string](#Literal.String)
        * [func (Literal) term()](#Literal.term)
    * [type Location struct](#Location)
    * [type Match struct](#Match)
    * [type Range struct](#Range)
    * [type Term interface](#Term)
    * [type ZipPath string](#ZipPath)
        * [func (ZipPath) Value()](#ZipPath.Value)
* [Functions](#func)
    * [func Matches(ctx context.Context, args Args) (matches []FileMatch, err error)](#Matches)
    * [func PipeTo(ctx context.Context, args Args, w io.Writer) (err error)](#PipeTo)
    * [func StructuralPatToRegexpQuery(pattern string, shortcircuit bool) string](#StructuralPatToRegexpQuery)
    * [func TestMatchesInZip(t *testing.T)](#TestMatchesInZip)
    * [func TestMatchesUnmarshalling(t *testing.T)](#TestMatchesUnmarshalling)
    * [func TestStructuralPatToRegexpQuery(t *testing.T)](#TestStructuralPatToRegexpQuery)
    * [func exists() bool](#exists)
    * [func kill(pid int)](#kill)
    * [func parseTemplate(buf []byte) []Term](#parseTemplate)
    * [func rawArgs(args Args) (rawArgs []string)](#rawArgs)
    * [func splitOnHolesPattern() string](#splitOnHolesPattern)
    * [func waitForCompletion(cmd *exec.Cmd, stdout, stderr io.ReadCloser, w io.Writer) (err error)](#waitForCompletion)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="combyPath" href="#combyPath">const combyPath</a>

```
searchKey: comby.combyPath
tags: [constant string private]
```

```Go
const combyPath = "comby"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="MatchHoleRegexp" href="#MatchHoleRegexp">var MatchHoleRegexp</a>

```
searchKey: comby.MatchHoleRegexp
tags: [variable struct]
```

```Go
var MatchHoleRegexp = lazyregexp.New(splitOnHolesPattern())
```

### <a id="matchRegexpPattern" href="#matchRegexpPattern">var matchRegexpPattern</a>

```
searchKey: comby.matchRegexpPattern
tags: [variable struct private]
```

```Go
var matchRegexpPattern = lazyregexp.New(`:\[(\w+)?~(.*)\]`)
```

### <a id="onMatchWhitespace" href="#onMatchWhitespace">var onMatchWhitespace</a>

```
searchKey: comby.onMatchWhitespace
tags: [variable struct private]
```

```Go
var onMatchWhitespace = lazyregexp.New(`[\s]+`)
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Args" href="#Args">type Args struct</a>

```
searchKey: comby.Args
tags: [struct]
```

```Go
type Args struct {
	// An Input to process (either a path to a directory or zip file)
	Input

	// A template pattern that expresses what to match
	MatchTemplate string

	// A rule that places constraints on matching or rewriting
	Rule string

	// A template pattern that expresses how matches should be rewritten
	RewriteTemplate string

	// Matcher is a file extension (e.g., '.go') which denotes which language parser to use
	Matcher string

	// If MatchOnly is set to true, then comby will only find matches and not perform replacement
	MatchOnly bool

	// FilePatterns is a list of file patterns (suffixes) to filter and process
	FilePatterns []string

	// NumWorkers is the number of worker processes to fork in parallel
	NumWorkers int
}
```

#### <a id="Args.String" href="#Args.String">func (args Args) String() string</a>

```
searchKey: comby.Args.String
tags: [function]
```

```Go
func (args Args) String() string
```

### <a id="DirPath" href="#DirPath">type DirPath string</a>

```
searchKey: comby.DirPath
tags: [string]
```

```Go
type DirPath string
```

#### <a id="DirPath.Value" href="#DirPath.Value">func (DirPath) Value()</a>

```
searchKey: comby.DirPath.Value
tags: [function]
```

```Go
func (DirPath) Value()
```

### <a id="FileDiff" href="#FileDiff">type FileDiff struct</a>

```
searchKey: comby.FileDiff
tags: [struct]
```

```Go
type FileDiff struct {
	URI  string `json:"uri"`
	Diff string `json:"diff"`
}
```

FileDiff represents a diff for a file 

### <a id="FileMatch" href="#FileMatch">type FileMatch struct</a>

```
searchKey: comby.FileMatch
tags: [struct]
```

```Go
type FileMatch struct {
	URI     string  `json:"uri"`
	Matches []Match `json:"matches"`
}
```

FileMatch represents all the matches in a single file 

### <a id="Hole" href="#Hole">type Hole string</a>

```
searchKey: comby.Hole
tags: [string]
```

```Go
type Hole string
```

#### <a id="Hole.String" href="#Hole.String">func (t Hole) String() string</a>

```
searchKey: comby.Hole.String
tags: [function]
```

```Go
func (t Hole) String() string
```

#### <a id="Hole.term" href="#Hole.term">func (Hole) term()</a>

```
searchKey: comby.Hole.term
tags: [function private]
```

```Go
func (Hole) term()
```

### <a id="Input" href="#Input">type Input interface</a>

```
searchKey: comby.Input
tags: [interface]
```

```Go
type Input interface {
	Value()
}
```

### <a id="Literal" href="#Literal">type Literal string</a>

```
searchKey: comby.Literal
tags: [string]
```

```Go
type Literal string
```

#### <a id="Literal.String" href="#Literal.String">func (t Literal) String() string</a>

```
searchKey: comby.Literal.String
tags: [function]
```

```Go
func (t Literal) String() string
```

#### <a id="Literal.term" href="#Literal.term">func (Literal) term()</a>

```
searchKey: comby.Literal.term
tags: [function private]
```

```Go
func (Literal) term()
```

### <a id="Location" href="#Location">type Location struct</a>

```
searchKey: comby.Location
tags: [struct]
```

```Go
type Location struct {
	Offset int `json:"offset"`
	Line   int `json:"line"`
	Column int `json:"column"`
}
```

Location is the location in a file 

### <a id="Match" href="#Match">type Match struct</a>

```
searchKey: comby.Match
tags: [struct]
```

```Go
type Match struct {
	Range   Range  `json:"range"`
	Matched string `json:"matched"`
}
```

Match represents a range of matched characters and the matched content 

### <a id="Range" href="#Range">type Range struct</a>

```
searchKey: comby.Range
tags: [struct]
```

```Go
type Range struct {
	Start Location `json:"start"`
	End   Location `json:"end"`
}
```

Range is a range of start location to end location 

### <a id="Term" href="#Term">type Term interface</a>

```
searchKey: comby.Term
tags: [interface]
```

```Go
type Term interface {
	term()
	String() string
}
```

### <a id="ZipPath" href="#ZipPath">type ZipPath string</a>

```
searchKey: comby.ZipPath
tags: [string]
```

```Go
type ZipPath string
```

#### <a id="ZipPath.Value" href="#ZipPath.Value">func (ZipPath) Value()</a>

```
searchKey: comby.ZipPath.Value
tags: [function]
```

```Go
func (ZipPath) Value()
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Matches" href="#Matches">func Matches(ctx context.Context, args Args) (matches []FileMatch, err error)</a>

```
searchKey: comby.Matches
tags: [method]
```

```Go
func Matches(ctx context.Context, args Args) (matches []FileMatch, err error)
```

Matches returns all matches in all files for which comby finds matches. 

### <a id="PipeTo" href="#PipeTo">func PipeTo(ctx context.Context, args Args, w io.Writer) (err error)</a>

```
searchKey: comby.PipeTo
tags: [method]
```

```Go
func PipeTo(ctx context.Context, args Args, w io.Writer) (err error)
```

### <a id="StructuralPatToRegexpQuery" href="#StructuralPatToRegexpQuery">func StructuralPatToRegexpQuery(pattern string, shortcircuit bool) string</a>

```
searchKey: comby.StructuralPatToRegexpQuery
tags: [method]
```

```Go
func StructuralPatToRegexpQuery(pattern string, shortcircuit bool) string
```

StructuralPatToRegexpQuery converts a comby pattern to an approximate regular expression query. It converts whitespace in the pattern so that content across newlines can be matched in the index. As an incomplete approximation, we use the regex pattern .*? to scan ahead. A shortcircuit option returns a regexp query that may find true matches faster, but may miss all possible matches. 

Example: "ParseInt(:[args]) if err != nil" -> "ParseInt(.*)\s+if\s+err!=\s+nil" 

### <a id="TestMatchesInZip" href="#TestMatchesInZip">func TestMatchesInZip(t *testing.T)</a>

```
searchKey: comby.TestMatchesInZip
tags: [method private test]
```

```Go
func TestMatchesInZip(t *testing.T)
```

### <a id="TestMatchesUnmarshalling" href="#TestMatchesUnmarshalling">func TestMatchesUnmarshalling(t *testing.T)</a>

```
searchKey: comby.TestMatchesUnmarshalling
tags: [method private test]
```

```Go
func TestMatchesUnmarshalling(t *testing.T)
```

### <a id="TestStructuralPatToRegexpQuery" href="#TestStructuralPatToRegexpQuery">func TestStructuralPatToRegexpQuery(t *testing.T)</a>

```
searchKey: comby.TestStructuralPatToRegexpQuery
tags: [method private test]
```

```Go
func TestStructuralPatToRegexpQuery(t *testing.T)
```

### <a id="exists" href="#exists">func exists() bool</a>

```
searchKey: comby.exists
tags: [function private]
```

```Go
func exists() bool
```

### <a id="kill" href="#kill">func kill(pid int)</a>

```
searchKey: comby.kill
tags: [method private]
```

```Go
func kill(pid int)
```

### <a id="parseTemplate" href="#parseTemplate">func parseTemplate(buf []byte) []Term</a>

```
searchKey: comby.parseTemplate
tags: [method private]
```

```Go
func parseTemplate(buf []byte) []Term
```

parseTemplate parses a comby pattern to a list of Terms where a Term is either a literal or hole metasyntax. 

### <a id="rawArgs" href="#rawArgs">func rawArgs(args Args) (rawArgs []string)</a>

```
searchKey: comby.rawArgs
tags: [method private]
```

```Go
func rawArgs(args Args) (rawArgs []string)
```

### <a id="splitOnHolesPattern" href="#splitOnHolesPattern">func splitOnHolesPattern() string</a>

```
searchKey: comby.splitOnHolesPattern
tags: [function private]
```

```Go
func splitOnHolesPattern() string
```

### <a id="waitForCompletion" href="#waitForCompletion">func waitForCompletion(cmd *exec.Cmd, stdout, stderr io.ReadCloser, w io.Writer) (err error)</a>

```
searchKey: comby.waitForCompletion
tags: [method private]
```

```Go
func waitForCompletion(cmd *exec.Cmd, stdout, stderr io.ReadCloser, w io.Writer) (err error)
```

