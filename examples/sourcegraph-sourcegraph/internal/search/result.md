# Package result

## Index

* [Constants](#const)
    * [const rankFileMatch](#rankFileMatch)
    * [const rankCommitMatch](#rankCommitMatch)
    * [const rankDiffMatch](#rankDiffMatch)
    * [const rankRepoMatch](#rankRepoMatch)
    * [const TypeEmpty](#TypeEmpty)
    * [const TypeRepo](#TypeRepo)
    * [const TypeSymbol](#TypeSymbol)
    * [const TypeFile](#TypeFile)
    * [const TypePath](#TypePath)
    * [const TypeDiff](#TypeDiff)
    * [const TypeCommit](#TypeCommit)
* [Variables](#var)
    * [var TypeFromString](#TypeFromString)
    * [var toSelectKind](#toSelectKind)
* [Types](#type)
    * [type CommitMatch struct](#CommitMatch)
        * [func (r *CommitMatch) ResultCount() int](#CommitMatch.ResultCount)
        * [func (r *CommitMatch) RepoName() types.RepoName](#CommitMatch.RepoName)
        * [func (r *CommitMatch) Limit(limit int) int](#CommitMatch.Limit)
        * [func (r *CommitMatch) Select(path filter.SelectPath) Match](#CommitMatch.Select)
        * [func (r *CommitMatch) Key() Key](#CommitMatch.Key)
        * [func (r *CommitMatch) Label() string](#CommitMatch.Label)
        * [func (r *CommitMatch) Detail() string](#CommitMatch.Detail)
        * [func (r *CommitMatch) URL() *url.URL](#CommitMatch.URL)
        * [func (r *CommitMatch) searchResultMarker()](#CommitMatch.searchResultMarker)
    * [type deduper map[result.Key]result.Match](#deduper)
        * [func NewDeduper() deduper](#NewDeduper)
        * [func (d deduper) Add(m Match)](#deduper.Add)
        * [func (d deduper) Seen(m Match) bool](#deduper.Seen)
        * [func (d deduper) Results() []Match](#deduper.Results)
    * [type File struct](#File)
        * [func (f *File) URL() *url.URL](#File.URL)
    * [type FileMatch struct](#FileMatch)
        * [func (fm *FileMatch) RepoName() types.RepoName](#FileMatch.RepoName)
        * [func (fm *FileMatch) searchResultMarker()](#FileMatch.searchResultMarker)
        * [func (fm *FileMatch) ResultCount() int](#FileMatch.ResultCount)
        * [func (fm *FileMatch) Select(path filter.SelectPath) Match](#FileMatch.Select)
        * [func (fm *FileMatch) AppendMatches(src *FileMatch)](#FileMatch.AppendMatches)
        * [func (fm *FileMatch) Limit(limit int) int](#FileMatch.Limit)
        * [func (fm *FileMatch) Key() Key](#FileMatch.Key)
    * [type LineMatch struct](#LineMatch)
    * [type HighlightedRange struct](#HighlightedRange)
    * [type HighlightedString struct](#HighlightedString)
    * [type Match interface](#Match)
        * [func selectCommitDiffKind(c *CommitMatch, field string) Match](#selectCommitDiffKind)
    * [type Key struct](#Key)
        * [func (k Key) Less(other Key) bool](#Key.Less)
    * [type Matches []result.Match](#Matches)
        * [func (m Matches) Len() int](#Matches.Len)
        * [func (m Matches) Less(i, j int) bool](#Matches.Less)
        * [func (m Matches) Swap(i, j int)](#Matches.Swap)
    * [type RepoMatch struct](#RepoMatch)
        * [func (r RepoMatch) RepoName() types.RepoName](#RepoMatch.RepoName)
        * [func (r RepoMatch) Limit(limit int) int](#RepoMatch.Limit)
        * [func (r *RepoMatch) ResultCount() int](#RepoMatch.ResultCount)
        * [func (r *RepoMatch) Select(path filter.SelectPath) Match](#RepoMatch.Select)
        * [func (r *RepoMatch) URL() *url.URL](#RepoMatch.URL)
        * [func (r *RepoMatch) Key() Key](#RepoMatch.Key)
        * [func (r *RepoMatch) searchResultMarker()](#RepoMatch.searchResultMarker)
    * [type Types uint8](#Types)
        * [func (r Types) Has(t Types) bool](#Types.Has)
        * [func (r Types) With(t Types) Types](#Types.With)
        * [func (r Types) Without(t Types) Types](#Types.Without)
        * [func (r Types) String() string](#Types.String)
    * [type Symbol struct](#Symbol)
        * [func (s Symbol) LSPKind() lsp.SymbolKind](#Symbol.LSPKind)
        * [func (s *Symbol) offset() int](#Symbol.offset)
        * [func (s Symbol) Range() lsp.Range](#Symbol.Range)
    * [type Symbols []result.Symbol](#Symbols)
    * [type SymbolMatch struct](#SymbolMatch)
        * [func (s *SymbolMatch) URL() *url.URL](#SymbolMatch.URL)
* [Functions](#func)
    * [func displayRepoName(repoPath string) string](#displayRepoName)
    * [func selectModifiedLines(lines []string, highlights []HighlightedRange, prefix string, offset int32) []HighlightedRange](#selectModifiedLines)
    * [func modifiedLinesExist(lines []string, prefix string) bool](#modifiedLinesExist)
    * [func unescapePattern(pattern string) string](#unescapePattern)
    * [func urlFragmentFromRange(lspRange lsp.Range) string](#urlFragmentFromRange)
    * [func lineSpecFromPosition(pos lsp.Position, forceIncludeCharacter bool) string](#lineSpecFromPosition)
    * [func pick(symbols []*SymbolMatch, satisfy func(*SymbolMatch) bool) []*SymbolMatch](#pick)
    * [func SelectSymbolKind(symbols []*SymbolMatch, field string) []*SymbolMatch](#SelectSymbolKind)
    * [func TestDeduper(t *testing.T)](#TestDeduper)
    * [func TestSelect(t *testing.T)](#TestSelect)
    * [func TestSymbolRange(t *testing.T)](#TestSymbolRange)
    * [func TestSymbolURL(t *testing.T)](#TestSymbolURL)


## <a id="const" href="#const">Constants</a>

### <a id="rankFileMatch" href="#rankFileMatch">const rankFileMatch</a>

```
searchKey: result.rankFileMatch
```

```Go
const rankFileMatch = 0
```

Match ranks are used for sorting the different match types. Match types with lower ranks will be sorted before match types with higher ranks. 

### <a id="rankCommitMatch" href="#rankCommitMatch">const rankCommitMatch</a>

```
searchKey: result.rankCommitMatch
```

```Go
const rankCommitMatch = 1
```

Match ranks are used for sorting the different match types. Match types with lower ranks will be sorted before match types with higher ranks. 

### <a id="rankDiffMatch" href="#rankDiffMatch">const rankDiffMatch</a>

```
searchKey: result.rankDiffMatch
```

```Go
const rankDiffMatch = 2
```

Match ranks are used for sorting the different match types. Match types with lower ranks will be sorted before match types with higher ranks. 

### <a id="rankRepoMatch" href="#rankRepoMatch">const rankRepoMatch</a>

```
searchKey: result.rankRepoMatch
```

```Go
const rankRepoMatch = 3
```

Match ranks are used for sorting the different match types. Match types with lower ranks will be sorted before match types with higher ranks. 

### <a id="TypeEmpty" href="#TypeEmpty">const TypeEmpty</a>

```
searchKey: result.TypeEmpty
tags: [exported]
```

```Go
const TypeEmpty Types = 0
```

### <a id="TypeRepo" href="#TypeRepo">const TypeRepo</a>

```
searchKey: result.TypeRepo
tags: [exported]
```

```Go
const TypeRepo Types = 1 << (iota - 1)
```

### <a id="TypeSymbol" href="#TypeSymbol">const TypeSymbol</a>

```
searchKey: result.TypeSymbol
tags: [exported]
```

```Go
const TypeSymbol
```

### <a id="TypeFile" href="#TypeFile">const TypeFile</a>

```
searchKey: result.TypeFile
tags: [exported]
```

```Go
const TypeFile
```

### <a id="TypePath" href="#TypePath">const TypePath</a>

```
searchKey: result.TypePath
tags: [exported]
```

```Go
const TypePath
```

### <a id="TypeDiff" href="#TypeDiff">const TypeDiff</a>

```
searchKey: result.TypeDiff
tags: [exported]
```

```Go
const TypeDiff
```

### <a id="TypeCommit" href="#TypeCommit">const TypeCommit</a>

```
searchKey: result.TypeCommit
tags: [exported]
```

```Go
const TypeCommit
```

## <a id="var" href="#var">Variables</a>

### <a id="TypeFromString" href="#TypeFromString">var TypeFromString</a>

```
searchKey: result.TypeFromString
tags: [exported]
```

```Go
var TypeFromString = ...
```

### <a id="toSelectKind" href="#toSelectKind">var toSelectKind</a>

```
searchKey: result.toSelectKind
```

```Go
var toSelectKind = ...
```

toSelectKind maps an internal symbol kind (cf. ctagsKind) to a corresponding symbol selector kind value in select.go. The single selector value `kind` corresponds 1-to-1 with LSP symbol kinds. 

## <a id="type" href="#type">Types</a>

### <a id="CommitMatch" href="#CommitMatch">type CommitMatch struct</a>

```
searchKey: result.CommitMatch
tags: [exported]
```

```Go
type CommitMatch struct {
	Commit         git.Commit
	Repo           types.RepoName
	Refs           []string
	SourceRefs     []string
	MessagePreview *HighlightedString
	DiffPreview    *HighlightedString
	Body           HighlightedString
}
```

#### <a id="CommitMatch.ResultCount" href="#CommitMatch.ResultCount">func (r *CommitMatch) ResultCount() int</a>

```
searchKey: result.CommitMatch.ResultCount
tags: [exported]
```

```Go
func (r *CommitMatch) ResultCount() int
```

ResultCount for CommitSearchResult returns the number of highlights if there are highlights and 1 otherwise. We implemented this method because we want to return a more meaningful result count for streaming while maintaining backward compatibility for our GraphQL API. The GraphQL API calls ResultCount on the resolver, while streaming calls ResultCount on CommitSearchResult. 

#### <a id="CommitMatch.RepoName" href="#CommitMatch.RepoName">func (r *CommitMatch) RepoName() types.RepoName</a>

```
searchKey: result.CommitMatch.RepoName
tags: [exported]
```

```Go
func (r *CommitMatch) RepoName() types.RepoName
```

#### <a id="CommitMatch.Limit" href="#CommitMatch.Limit">func (r *CommitMatch) Limit(limit int) int</a>

```
searchKey: result.CommitMatch.Limit
tags: [exported]
```

```Go
func (r *CommitMatch) Limit(limit int) int
```

#### <a id="CommitMatch.Select" href="#CommitMatch.Select">func (r *CommitMatch) Select(path filter.SelectPath) Match</a>

```
searchKey: result.CommitMatch.Select
tags: [exported]
```

```Go
func (r *CommitMatch) Select(path filter.SelectPath) Match
```

#### <a id="CommitMatch.Key" href="#CommitMatch.Key">func (r *CommitMatch) Key() Key</a>

```
searchKey: result.CommitMatch.Key
tags: [exported]
```

```Go
func (r *CommitMatch) Key() Key
```

Key implements Match interface's Key() method 

#### <a id="CommitMatch.Label" href="#CommitMatch.Label">func (r *CommitMatch) Label() string</a>

```
searchKey: result.CommitMatch.Label
tags: [exported]
```

```Go
func (r *CommitMatch) Label() string
```

#### <a id="CommitMatch.Detail" href="#CommitMatch.Detail">func (r *CommitMatch) Detail() string</a>

```
searchKey: result.CommitMatch.Detail
tags: [exported]
```

```Go
func (r *CommitMatch) Detail() string
```

#### <a id="CommitMatch.URL" href="#CommitMatch.URL">func (r *CommitMatch) URL() *url.URL</a>

```
searchKey: result.CommitMatch.URL
tags: [exported]
```

```Go
func (r *CommitMatch) URL() *url.URL
```

#### <a id="CommitMatch.searchResultMarker" href="#CommitMatch.searchResultMarker">func (r *CommitMatch) searchResultMarker()</a>

```
searchKey: result.CommitMatch.searchResultMarker
```

```Go
func (r *CommitMatch) searchResultMarker()
```

### <a id="deduper" href="#deduper">type deduper map[result.Key]result.Match</a>

```
searchKey: result.deduper
```

```Go
type deduper map[Key]Match
```

#### <a id="NewDeduper" href="#NewDeduper">func NewDeduper() deduper</a>

```
searchKey: result.NewDeduper
tags: [exported]
```

```Go
func NewDeduper() deduper
```

#### <a id="deduper.Add" href="#deduper.Add">func (d deduper) Add(m Match)</a>

```
searchKey: result.deduper.Add
```

```Go
func (d deduper) Add(m Match)
```

#### <a id="deduper.Seen" href="#deduper.Seen">func (d deduper) Seen(m Match) bool</a>

```
searchKey: result.deduper.Seen
```

```Go
func (d deduper) Seen(m Match) bool
```

#### <a id="deduper.Results" href="#deduper.Results">func (d deduper) Results() []Match</a>

```
searchKey: result.deduper.Results
```

```Go
func (d deduper) Results() []Match
```

### <a id="File" href="#File">type File struct</a>

```
searchKey: result.File
tags: [exported]
```

```Go
type File struct {
	// InputRev is the Git revspec that the user originally requested to search. It is used to
	// preserve the original revision specifier from the user instead of navigating them to the
	// absolute commit ID when they select a result.
	InputRev *string        `json:"-"`
	Repo     types.RepoName `json:"-"`
	CommitID api.CommitID   `json:"-"`
	Path     string
}
```

File represents all the information we need to identify a file in a repository 

#### <a id="File.URL" href="#File.URL">func (f *File) URL() *url.URL</a>

```
searchKey: result.File.URL
tags: [exported]
```

```Go
func (f *File) URL() *url.URL
```

### <a id="FileMatch" href="#FileMatch">type FileMatch struct</a>

```
searchKey: result.FileMatch
tags: [exported]
```

```Go
type FileMatch struct {
	File

	LineMatches []*LineMatch
	Symbols     []*SymbolMatch `json:"-"`

	LimitHit bool
}
```

FileMatch represents either: - A collection of symbol results (len(Symbols) > 0) - A collection of text content results (len(LineMatches) > 0) - A result repsenting the whole file (len(Symbols) == 0 && len(LineMatches) == 0) 

#### <a id="FileMatch.RepoName" href="#FileMatch.RepoName">func (fm *FileMatch) RepoName() types.RepoName</a>

```
searchKey: result.FileMatch.RepoName
tags: [exported]
```

```Go
func (fm *FileMatch) RepoName() types.RepoName
```

#### <a id="FileMatch.searchResultMarker" href="#FileMatch.searchResultMarker">func (fm *FileMatch) searchResultMarker()</a>

```
searchKey: result.FileMatch.searchResultMarker
```

```Go
func (fm *FileMatch) searchResultMarker()
```

#### <a id="FileMatch.ResultCount" href="#FileMatch.ResultCount">func (fm *FileMatch) ResultCount() int</a>

```
searchKey: result.FileMatch.ResultCount
tags: [exported]
```

```Go
func (fm *FileMatch) ResultCount() int
```

#### <a id="FileMatch.Select" href="#FileMatch.Select">func (fm *FileMatch) Select(path filter.SelectPath) Match</a>

```
searchKey: result.FileMatch.Select
tags: [exported]
```

```Go
func (fm *FileMatch) Select(path filter.SelectPath) Match
```

#### <a id="FileMatch.AppendMatches" href="#FileMatch.AppendMatches">func (fm *FileMatch) AppendMatches(src *FileMatch)</a>

```
searchKey: result.FileMatch.AppendMatches
tags: [exported]
```

```Go
func (fm *FileMatch) AppendMatches(src *FileMatch)
```

AppendMatches appends the line matches from src as well as updating match counts and limit. 

#### <a id="FileMatch.Limit" href="#FileMatch.Limit">func (fm *FileMatch) Limit(limit int) int</a>

```
searchKey: result.FileMatch.Limit
tags: [exported]
```

```Go
func (fm *FileMatch) Limit(limit int) int
```

Limit will mutate fm such that it only has limit results. limit is a number greater than 0. 

```
if limit >= ResultCount then nothing is done and we return limit - ResultCount.
if limit < ResultCount then ResultCount becomes limit and we return 0.

```
#### <a id="FileMatch.Key" href="#FileMatch.Key">func (fm *FileMatch) Key() Key</a>

```
searchKey: result.FileMatch.Key
tags: [exported]
```

```Go
func (fm *FileMatch) Key() Key
```

### <a id="LineMatch" href="#LineMatch">type LineMatch struct</a>

```
searchKey: result.LineMatch
tags: [exported]
```

```Go
type LineMatch struct {
	Preview          string
	OffsetAndLengths [][2]int32
	LineNumber       int32
}
```

LineMatch is the struct used by vscode to receive search results for a line 

### <a id="HighlightedRange" href="#HighlightedRange">type HighlightedRange struct</a>

```
searchKey: result.HighlightedRange
tags: [exported]
```

```Go
type HighlightedRange struct {
	Line      int32
	Character int32
	Length    int32
}
```

### <a id="HighlightedString" href="#HighlightedString">type HighlightedString struct</a>

```
searchKey: result.HighlightedString
tags: [exported]
```

```Go
type HighlightedString struct {
	Value      string
	Highlights []HighlightedRange
}
```

### <a id="Match" href="#Match">type Match interface</a>

```
searchKey: result.Match
tags: [exported]
```

```Go
type Match interface {
	ResultCount() int
	Limit(int) int
	Select(filter.SelectPath) Match
	RepoName() types.RepoName

	// Key returns a key which uniquely identifies this match.
	Key() Key

	// ensure only types in this package can be a Match.
	searchResultMarker()
}
```

Match is *FileMatch | *RepoMatch | *CommitMatch. We have a private method to ensure only those types implement Match. 

#### <a id="selectCommitDiffKind" href="#selectCommitDiffKind">func selectCommitDiffKind(c *CommitMatch, field string) Match</a>

```
searchKey: result.selectCommitDiffKind
```

```Go
func selectCommitDiffKind(c *CommitMatch, field string) Match
```

selectCommitDiffKind returns a commit match `c` if it contains `added` (resp. `removed`) lines set by `field. It ensures that highlight information only applies to the modified lines selected by `field`. If there are no matches (i.e., no highlight information) coresponding to modified lines, it is removed from the result set (returns nil). 

### <a id="Key" href="#Key">type Key struct</a>

```
searchKey: result.Key
tags: [exported]
```

```Go
type Key struct {
	// Repo is the name of the repo the match belongs to
	Repo api.RepoName

	// Rev is the revision associated with the repo if it exists
	Rev string

	// Commit is the commit hash of the commit the match belongs to.
	// Empty if there is no commit associated with the match (e.g. RepoMatch)
	Commit api.CommitID

	// Path is the path of the file the match belongs to.
	// Empty if there is no file associated with the match (e.g. RepoMatch or CommitMatch)
	Path string

	// TypeRank is the sorting rank of the type this key belongs to.
	TypeRank int
}
```

Key is a sorting or deduplicating key for a Match. It contains all the identifying information for the Match. 

#### <a id="Key.Less" href="#Key.Less">func (k Key) Less(other Key) bool</a>

```
searchKey: result.Key.Less
tags: [exported]
```

```Go
func (k Key) Less(other Key) bool
```

Less compares one key to another for sorting 

### <a id="Matches" href="#Matches">type Matches []result.Match</a>

```
searchKey: result.Matches
tags: [exported]
```

```Go
type Matches []Match
```

Matches implements sort.Interface 

#### <a id="Matches.Len" href="#Matches.Len">func (m Matches) Len() int</a>

```
searchKey: result.Matches.Len
tags: [exported]
```

```Go
func (m Matches) Len() int
```

#### <a id="Matches.Less" href="#Matches.Less">func (m Matches) Less(i, j int) bool</a>

```
searchKey: result.Matches.Less
tags: [exported]
```

```Go
func (m Matches) Less(i, j int) bool
```

#### <a id="Matches.Swap" href="#Matches.Swap">func (m Matches) Swap(i, j int)</a>

```
searchKey: result.Matches.Swap
tags: [exported]
```

```Go
func (m Matches) Swap(i, j int)
```

### <a id="RepoMatch" href="#RepoMatch">type RepoMatch struct</a>

```
searchKey: result.RepoMatch
tags: [exported]
```

```Go
type RepoMatch struct {
	Name api.RepoName
	ID   api.RepoID

	// rev optionally specifies a revision to go to for search results.
	Rev string
}
```

#### <a id="RepoMatch.RepoName" href="#RepoMatch.RepoName">func (r RepoMatch) RepoName() types.RepoName</a>

```
searchKey: result.RepoMatch.RepoName
tags: [exported]
```

```Go
func (r RepoMatch) RepoName() types.RepoName
```

#### <a id="RepoMatch.Limit" href="#RepoMatch.Limit">func (r RepoMatch) Limit(limit int) int</a>

```
searchKey: result.RepoMatch.Limit
tags: [exported]
```

```Go
func (r RepoMatch) Limit(limit int) int
```

#### <a id="RepoMatch.ResultCount" href="#RepoMatch.ResultCount">func (r *RepoMatch) ResultCount() int</a>

```
searchKey: result.RepoMatch.ResultCount
tags: [exported]
```

```Go
func (r *RepoMatch) ResultCount() int
```

#### <a id="RepoMatch.Select" href="#RepoMatch.Select">func (r *RepoMatch) Select(path filter.SelectPath) Match</a>

```
searchKey: result.RepoMatch.Select
tags: [exported]
```

```Go
func (r *RepoMatch) Select(path filter.SelectPath) Match
```

#### <a id="RepoMatch.URL" href="#RepoMatch.URL">func (r *RepoMatch) URL() *url.URL</a>

```
searchKey: result.RepoMatch.URL
tags: [exported]
```

```Go
func (r *RepoMatch) URL() *url.URL
```

#### <a id="RepoMatch.Key" href="#RepoMatch.Key">func (r *RepoMatch) Key() Key</a>

```
searchKey: result.RepoMatch.Key
tags: [exported]
```

```Go
func (r *RepoMatch) Key() Key
```

#### <a id="RepoMatch.searchResultMarker" href="#RepoMatch.searchResultMarker">func (r *RepoMatch) searchResultMarker()</a>

```
searchKey: result.RepoMatch.searchResultMarker
```

```Go
func (r *RepoMatch) searchResultMarker()
```

### <a id="Types" href="#Types">type Types uint8</a>

```
searchKey: result.Types
tags: [exported]
```

```Go
type Types uint8
```

Types represents a set of result types. It's a bitset corresponding to the disjunction of types it represents. 

For example, the set of file and repo results is represented as Types(TypeFile|TypeRepo) 

#### <a id="Types.Has" href="#Types.Has">func (r Types) Has(t Types) bool</a>

```
searchKey: result.Types.Has
tags: [exported]
```

```Go
func (r Types) Has(t Types) bool
```

#### <a id="Types.With" href="#Types.With">func (r Types) With(t Types) Types</a>

```
searchKey: result.Types.With
tags: [exported]
```

```Go
func (r Types) With(t Types) Types
```

#### <a id="Types.Without" href="#Types.Without">func (r Types) Without(t Types) Types</a>

```
searchKey: result.Types.Without
tags: [exported]
```

```Go
func (r Types) Without(t Types) Types
```

#### <a id="Types.String" href="#Types.String">func (r Types) String() string</a>

```
searchKey: result.Types.String
tags: [exported]
```

```Go
func (r Types) String() string
```

### <a id="Symbol" href="#Symbol">type Symbol struct</a>

```
searchKey: result.Symbol
tags: [exported]
```

```Go
type Symbol struct {
	Name string

	// TODO (@camdencheek): remove path since it's duplicated
	// in the file reference of symbol match. Alternatively,
	// merge Symbol and SymbolMatch.
	Path       string
	Line       int
	Kind       string
	Language   string
	Parent     string
	ParentKind string
	Signature  string
	Pattern    string

	FileLimited bool
}
```

Symbol is a code symbol. 

#### <a id="Symbol.LSPKind" href="#Symbol.LSPKind">func (s Symbol) LSPKind() lsp.SymbolKind</a>

```
searchKey: result.Symbol.LSPKind
tags: [exported]
```

```Go
func (s Symbol) LSPKind() lsp.SymbolKind
```

#### <a id="Symbol.offset" href="#Symbol.offset">func (s *Symbol) offset() int</a>

```
searchKey: result.Symbol.offset
```

```Go
func (s *Symbol) offset() int
```

offset calculates a symbol offset based on the the only Symbol data member that currently exposes line content: the symbols Pattern member, which has the form /^ ... $/. We find the offset of the symbol name in this line, after escaping the Pattern. 

#### <a id="Symbol.Range" href="#Symbol.Range">func (s Symbol) Range() lsp.Range</a>

```
searchKey: result.Symbol.Range
tags: [exported]
```

```Go
func (s Symbol) Range() lsp.Range
```

### <a id="Symbols" href="#Symbols">type Symbols []result.Symbol</a>

```
searchKey: result.Symbols
tags: [exported]
```

```Go
type Symbols = []Symbol
```

Symbols is the result of a search on the symbols service. 

### <a id="SymbolMatch" href="#SymbolMatch">type SymbolMatch struct</a>

```
searchKey: result.SymbolMatch
tags: [exported]
```

```Go
type SymbolMatch struct {
	Symbol Symbol
	File   *File
}
```

SymbolMatch is a symbol search result decorated with extra metadata in the frontend. 

#### <a id="SymbolMatch.URL" href="#SymbolMatch.URL">func (s *SymbolMatch) URL() *url.URL</a>

```
searchKey: result.SymbolMatch.URL
tags: [exported]
```

```Go
func (s *SymbolMatch) URL() *url.URL
```

## <a id="func" href="#func">Functions</a>

### <a id="displayRepoName" href="#displayRepoName">func displayRepoName(repoPath string) string</a>

```
searchKey: result.displayRepoName
```

```Go
func displayRepoName(repoPath string) string
```

### <a id="selectModifiedLines" href="#selectModifiedLines">func selectModifiedLines(lines []string, highlights []HighlightedRange, prefix string, offset int32) []HighlightedRange</a>

```
searchKey: result.selectModifiedLines
```

```Go
func selectModifiedLines(lines []string, highlights []HighlightedRange, prefix string, offset int32) []HighlightedRange
```

selectModifiedLines extracts the highlight ranges that correspond to lines that have a `+` or `-` prefix (corresponding to additions resp. removals). 

### <a id="modifiedLinesExist" href="#modifiedLinesExist">func modifiedLinesExist(lines []string, prefix string) bool</a>

```
searchKey: result.modifiedLinesExist
```

```Go
func modifiedLinesExist(lines []string, prefix string) bool
```

modifiedLinesExist checks whether any `line` in lines starts with `prefix`. 

### <a id="unescapePattern" href="#unescapePattern">func unescapePattern(pattern string) string</a>

```
searchKey: result.unescapePattern
```

```Go
func unescapePattern(pattern string) string
```

unescapePattern expects a regexp pattern of the form /^ ... $/ and unescapes the pattern inside it. 

### <a id="urlFragmentFromRange" href="#urlFragmentFromRange">func urlFragmentFromRange(lspRange lsp.Range) string</a>

```
searchKey: result.urlFragmentFromRange
```

```Go
func urlFragmentFromRange(lspRange lsp.Range) string
```

### <a id="lineSpecFromPosition" href="#lineSpecFromPosition">func lineSpecFromPosition(pos lsp.Position, forceIncludeCharacter bool) string</a>

```
searchKey: result.lineSpecFromPosition
```

```Go
func lineSpecFromPosition(pos lsp.Position, forceIncludeCharacter bool) string
```

### <a id="pick" href="#pick">func pick(symbols []*SymbolMatch, satisfy func(*SymbolMatch) bool) []*SymbolMatch</a>

```
searchKey: result.pick
```

```Go
func pick(symbols []*SymbolMatch, satisfy func(*SymbolMatch) bool) []*SymbolMatch
```

### <a id="SelectSymbolKind" href="#SelectSymbolKind">func SelectSymbolKind(symbols []*SymbolMatch, field string) []*SymbolMatch</a>

```
searchKey: result.SelectSymbolKind
tags: [exported]
```

```Go
func SelectSymbolKind(symbols []*SymbolMatch, field string) []*SymbolMatch
```

### <a id="TestDeduper" href="#TestDeduper">func TestDeduper(t *testing.T)</a>

```
searchKey: result.TestDeduper
```

```Go
func TestDeduper(t *testing.T)
```

### <a id="TestSelect" href="#TestSelect">func TestSelect(t *testing.T)</a>

```
searchKey: result.TestSelect
```

```Go
func TestSelect(t *testing.T)
```

### <a id="TestSymbolRange" href="#TestSymbolRange">func TestSymbolRange(t *testing.T)</a>

```
searchKey: result.TestSymbolRange
```

```Go
func TestSymbolRange(t *testing.T)
```

### <a id="TestSymbolURL" href="#TestSymbolURL">func TestSymbolURL(t *testing.T)</a>

```
searchKey: result.TestSymbolURL
```

```Go
func TestSymbolURL(t *testing.T)
```

