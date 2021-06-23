# Package comby

## Index

* [Constants](#const)
    * [const combyPath](#combyPath)
* [Variables](#var)
    * [var MatchHoleRegexp](#MatchHoleRegexp)
    * [var matchRegexpPattern](#matchRegexpPattern)
    * [var onMatchWhitespace](#onMatchWhitespace)
* [Types](#type)
    * [type Term interface](#Term)
    * [type Literal string](#Literal)
        * [func (Literal) term()](#Literal.term)
        * [func (t Literal) String() string](#Literal.String)
    * [type Hole string](#Hole)
        * [func (Hole) term()](#Hole.term)
        * [func (t Hole) String() string](#Hole.String)
    * [type Input interface](#Input)
    * [type ZipPath string](#ZipPath)
        * [func (ZipPath) Value()](#ZipPath.Value)
    * [type DirPath string](#DirPath)
        * [func (DirPath) Value()](#DirPath.Value)
    * [type Args struct](#Args)
        * [func (args Args) String() string](#Args.String)
    * [type Location struct](#Location)
    * [type Range struct](#Range)
    * [type Match struct](#Match)
    * [type FileMatch struct](#FileMatch)
    * [type FileDiff struct](#FileDiff)
* [Functions](#func)
    * [func exists() bool](#exists)
    * [func rawArgs(args Args) (rawArgs []string)](#rawArgs)
    * [func waitForCompletion(cmd *exec.Cmd, stdout, stderr io.ReadCloser, w io.Writer) (err error)](#waitForCompletion)
    * [func kill(pid int)](#kill)
    * [func PipeTo(ctx context.Context, args Args, w io.Writer) (err error)](#PipeTo)
    * [func Matches(ctx context.Context, args Args) (matches []FileMatch, err error)](#Matches)
    * [func splitOnHolesPattern() string](#splitOnHolesPattern)
    * [func parseTemplate(buf []byte) []Term](#parseTemplate)
    * [func StructuralPatToRegexpQuery(pattern string, shortcircuit bool) string](#StructuralPatToRegexpQuery)
    * [func TestMatchesUnmarshalling(t *testing.T)](#TestMatchesUnmarshalling)
    * [func TestMatchesInZip(t *testing.T)](#TestMatchesInZip)
    * [func TestStructuralPatToRegexpQuery(t *testing.T)](#TestStructuralPatToRegexpQuery)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="combyPath" href="#combyPath">const combyPath</a>

```
searchKey: comby.combyPath
tags: [private]
```

```Go
const combyPath = "comby"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="MatchHoleRegexp" href="#MatchHoleRegexp">var MatchHoleRegexp</a>

```
searchKey: comby.MatchHoleRegexp
```

```Go
var MatchHoleRegexp = lazyregexp.New(splitOnHolesPattern())
```

### <a id="matchRegexpPattern" href="#matchRegexpPattern">var matchRegexpPattern</a>

```
searchKey: comby.matchRegexpPattern
tags: [private]
```

```Go
var matchRegexpPattern = lazyregexp.New(`:\[(\w+)?~(.*)\]`)
```

### <a id="onMatchWhitespace" href="#onMatchWhitespace">var onMatchWhitespace</a>

```
searchKey: comby.onMatchWhitespace
tags: [private]
```

```Go
var onMatchWhitespace = lazyregexp.New(`[\s]+`)
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Term" href="#Term">type Term interface</a>

```
searchKey: comby.Term
```

```Go
type Term interface {
	term()
	String() string
}
```

### <a id="Literal" href="#Literal">type Literal string</a>

```
searchKey: comby.Literal
```

```Go
type Literal string
```

#### <a id="Literal.term" href="#Literal.term">func (Literal) term()</a>

```
searchKey: comby.Literal.term
tags: [private]
```

```Go
func (Literal) term()
```

#### <a id="Literal.String" href="#Literal.String">func (t Literal) String() string</a>

```
searchKey: comby.Literal.String
```

```Go
func (t Literal) String() string
```

### <a id="Hole" href="#Hole">type Hole string</a>

```
searchKey: comby.Hole
```

```Go
type Hole string
```

#### <a id="Hole.term" href="#Hole.term">func (Hole) term()</a>

```
searchKey: comby.Hole.term
tags: [private]
```

```Go
func (Hole) term()
```

#### <a id="Hole.String" href="#Hole.String">func (t Hole) String() string</a>

```
searchKey: comby.Hole.String
```

```Go
func (t Hole) String() string
```

### <a id="Input" href="#Input">type Input interface</a>

```
searchKey: comby.Input
```

```Go
type Input interface {
	Value()
}
```

### <a id="ZipPath" href="#ZipPath">type ZipPath string</a>

```
searchKey: comby.ZipPath
```

```Go
type ZipPath string
```

#### <a id="ZipPath.Value" href="#ZipPath.Value">func (ZipPath) Value()</a>

```
searchKey: comby.ZipPath.Value
```

```Go
func (ZipPath) Value()
```

### <a id="DirPath" href="#DirPath">type DirPath string</a>

```
searchKey: comby.DirPath
```

```Go
type DirPath string
```

#### <a id="DirPath.Value" href="#DirPath.Value">func (DirPath) Value()</a>

```
searchKey: comby.DirPath.Value
```

```Go
func (DirPath) Value()
```

### <a id="Args" href="#Args">type Args struct</a>

```
searchKey: comby.Args
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
```

```Go
func (args Args) String() string
```

### <a id="Location" href="#Location">type Location struct</a>

```
searchKey: comby.Location
```

```Go
type Location struct {
	Offset int `json:"offset"`
	Line   int `json:"line"`
	Column int `json:"column"`
}
```

Location is the location in a file 

### <a id="Range" href="#Range">type Range struct</a>

```
searchKey: comby.Range
```

```Go
type Range struct {
	Start Location `json:"start"`
	End   Location `json:"end"`
}
```

Range is a range of start location to end location 

### <a id="Match" href="#Match">type Match struct</a>

```
searchKey: comby.Match
```

```Go
type Match struct {
	Range   Range  `json:"range"`
	Matched string `json:"matched"`
}
```

Match represents a range of matched characters and the matched content 

### <a id="FileMatch" href="#FileMatch">type FileMatch struct</a>

```
searchKey: comby.FileMatch
```

```Go
type FileMatch struct {
	URI     string  `json:"uri"`
	Matches []Match `json:"matches"`
}
```

FileMatch represents all the matches in a single file 

### <a id="FileDiff" href="#FileDiff">type FileDiff struct</a>

```
searchKey: comby.FileDiff
```

```Go
type FileDiff struct {
	URI  string `json:"uri"`
	Diff string `json:"diff"`
}
```

FileDiff represents a diff for a file 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="exists" href="#exists">func exists() bool</a>

```
searchKey: comby.exists
tags: [private]
```

```Go
func exists() bool
```

### <a id="rawArgs" href="#rawArgs">func rawArgs(args Args) (rawArgs []string)</a>

```
searchKey: comby.rawArgs
tags: [private]
```

```Go
func rawArgs(args Args) (rawArgs []string)
```

### <a id="waitForCompletion" href="#waitForCompletion">func waitForCompletion(cmd *exec.Cmd, stdout, stderr io.ReadCloser, w io.Writer) (err error)</a>

```
searchKey: comby.waitForCompletion
tags: [private]
```

```Go
func waitForCompletion(cmd *exec.Cmd, stdout, stderr io.ReadCloser, w io.Writer) (err error)
```

### <a id="kill" href="#kill">func kill(pid int)</a>

```
searchKey: comby.kill
tags: [private]
```

```Go
func kill(pid int)
```

### <a id="PipeTo" href="#PipeTo">func PipeTo(ctx context.Context, args Args, w io.Writer) (err error)</a>

```
searchKey: comby.PipeTo
```

```Go
func PipeTo(ctx context.Context, args Args, w io.Writer) (err error)
```

### <a id="Matches" href="#Matches">func Matches(ctx context.Context, args Args) (matches []FileMatch, err error)</a>

```
searchKey: comby.Matches
```

```Go
func Matches(ctx context.Context, args Args) (matches []FileMatch, err error)
```

Matches returns all matches in all files for which comby finds matches. 

### <a id="splitOnHolesPattern" href="#splitOnHolesPattern">func splitOnHolesPattern() string</a>

```
searchKey: comby.splitOnHolesPattern
tags: [private]
```

```Go
func splitOnHolesPattern() string
```

### <a id="parseTemplate" href="#parseTemplate">func parseTemplate(buf []byte) []Term</a>

```
searchKey: comby.parseTemplate
tags: [private]
```

```Go
func parseTemplate(buf []byte) []Term
```

parseTemplate parses a comby pattern to a list of Terms where a Term is either a literal or hole metasyntax. 

### <a id="StructuralPatToRegexpQuery" href="#StructuralPatToRegexpQuery">func StructuralPatToRegexpQuery(pattern string, shortcircuit bool) string</a>

```
searchKey: comby.StructuralPatToRegexpQuery
```

```Go
func StructuralPatToRegexpQuery(pattern string, shortcircuit bool) string
```

StructuralPatToRegexpQuery converts a comby pattern to an approximate regular expression query. It converts whitespace in the pattern so that content across newlines can be matched in the index. As an incomplete approximation, we use the regex pattern .*? to scan ahead. A shortcircuit option returns a regexp query that may find true matches faster, but may miss all possible matches. 

Example: "ParseInt(:[args]) if err != nil" -> "ParseInt(.*)\s+if\s+err!=\s+nil" 

### <a id="TestMatchesUnmarshalling" href="#TestMatchesUnmarshalling">func TestMatchesUnmarshalling(t *testing.T)</a>

```
searchKey: comby.TestMatchesUnmarshalling
tags: [private]
```

```Go
func TestMatchesUnmarshalling(t *testing.T)
```

### <a id="TestMatchesInZip" href="#TestMatchesInZip">func TestMatchesInZip(t *testing.T)</a>

```
searchKey: comby.TestMatchesInZip
tags: [private]
```

```Go
func TestMatchesInZip(t *testing.T)
```

### <a id="TestStructuralPatToRegexpQuery" href="#TestStructuralPatToRegexpQuery">func TestStructuralPatToRegexpQuery(t *testing.T)</a>

```
searchKey: comby.TestStructuralPatToRegexpQuery
tags: [private]
```

```Go
func TestStructuralPatToRegexpQuery(t *testing.T)
```

