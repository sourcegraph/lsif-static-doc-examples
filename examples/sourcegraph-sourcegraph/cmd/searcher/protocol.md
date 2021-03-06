# Package protocol

Package protocol contains structures used by the searcher API. 

## Index

* [Types](#type)
    * [type FileMatch struct](#FileMatch)
    * [type LineMatch struct](#LineMatch)
    * [type PatternInfo struct](#PatternInfo)
        * [func (p *PatternInfo) String() string](#PatternInfo.String)
    * [type Request struct](#Request)
    * [type Response struct](#Response)


## <a id="type" href="#type">Types</a>

### <a id="FileMatch" href="#FileMatch">type FileMatch struct</a>

```
searchKey: protocol.FileMatch
tags: [struct]
```

```Go
type FileMatch struct {
	Path        string
	LineMatches []LineMatch
	// MatchCount is the number of matches. Different from len(LineMatches), as multiple lines may correspond to one logical match.
	MatchCount int

	// LimitHit is true if LineMatches may not include all LineMatches.
	LimitHit bool
}
```

FileMatch is the struct used by vscode to receive search results 

### <a id="LineMatch" href="#LineMatch">type LineMatch struct</a>

```
searchKey: protocol.LineMatch
tags: [struct]
```

```Go
type LineMatch struct {
	// Preview is the matched line.
	Preview string

	// LineNumber is the 0-based line number. Note: Our editors present
	// 1-based line numbers, but internally vscode uses 0-based.
	LineNumber int

	// OffsetAndLengths is a slice of 2-tuples (Offset, Length)
	// representing each match on a line.
	// Offsets and lengths are measured in characters, not bytes.
	OffsetAndLengths [][2]int
}
```

LineMatch is the struct used by vscode to receive search results for a line. 

### <a id="PatternInfo" href="#PatternInfo">type PatternInfo struct</a>

```
searchKey: protocol.PatternInfo
tags: [struct]
```

```Go
type PatternInfo struct {
	// Pattern is the search query. It is a regular expression if IsRegExp
	// is true, otherwise a fixed string. eg "route variable"
	Pattern string

	// IsNegated if true will invert the matching logic for regexp searches. IsNegated=true is
	// not supported for structural searches.
	IsNegated bool

	// IsRegExp if true will treat the Pattern as a regular expression.
	IsRegExp bool

	// IsStructuralPat if true will treat the pattern as a Comby structural search pattern.
	IsStructuralPat bool

	// IsWordMatch if true will only match the pattern at word boundaries.
	IsWordMatch bool

	// IsCaseSensitive if false will ignore the case of text and pattern
	// when finding matches.
	IsCaseSensitive bool

	// ExcludePattern is a pattern that may not match the returned files' paths.
	// eg '**/node_modules'
	ExcludePattern string

	// IncludePatterns is a list of patterns that must *all* match the returned
	// files' paths.
	// eg '**/node_modules'
	//
	// The patterns are ANDed together; a file's path must match all patterns
	// for it to be kept. That is also why it is a list (unlike the singular
	// ExcludePattern); it is not possible in general to construct a single
	// glob or Go regexp that represents multiple such patterns ANDed together.
	IncludePatterns []string

	// IncludeExcludePatternAreRegExps indicates that ExcludePattern, IncludePattern,
	// and IncludePatterns are regular expressions (not globs).
	PathPatternsAreRegExps bool

	// IncludeExcludePatternAreCaseSensitive indicates that ExcludePattern, IncludePattern,
	// and IncludePatterns are case sensitive.
	PathPatternsAreCaseSensitive bool

	// FileMatchLimit limits the number of files with matches that are returned.
	FileMatchLimit int

	// PatternMatchesPath is whether the pattern should be matched against the content
	// of files.
	PatternMatchesContent bool

	// PatternMatchesPath is whether a file whose path matches Pattern (but whose contents don't) should be
	// considered a match.
	PatternMatchesPath bool

	// Languages is the languages passed via the lang filters (e.g., "lang:c")
	Languages []string

	// CombyRule is a rule that constrains matching for structural search.
	// It only applies when IsStructuralPat is true.
	// As a temporary measure, the expression `where "backcompat" == "backcompat"` acts as
	// a flag to activate the old structural search path, which queries zoekt for the
	// file list in the frontend and passes it to searcher.
	CombyRule string

	// Select is the value of the the select field in the query. It is not necessary to
	// use it since selection is done after the query completes, but exposing it can enable
	// optimizations.
	Select string
}
```

PatternInfo describes a search request on a repo. Most of the fields are based on PatternInfo used in vscode. 

#### <a id="PatternInfo.String" href="#PatternInfo.String">func (p *PatternInfo) String() string</a>

```
searchKey: protocol.PatternInfo.String
tags: [method]
```

```Go
func (p *PatternInfo) String() string
```

### <a id="Request" href="#Request">type Request struct</a>

```
searchKey: protocol.Request
tags: [struct]
```

```Go
type Request struct {
	// Repo is the name of the repository to search. eg "github.com/gorilla/mux"
	Repo api.RepoName

	// URL specifies the repository's Git remote URL (for gitserver). It is optional. See
	// (gitserver.ExecRequest).URL for documentation on what it is used for.
	URL string

	// Commit is which commit to search. It is required to be resolved,
	// not a ref like HEAD or master. eg
	// "599cba5e7b6137d46ddf58fb1765f5d928e69604"
	Commit api.CommitID

	// Branch is used for structural search as an alternative to Commit
	// because Zoekt only takes branch names
	Branch string

	PatternInfo

	// The amount of time to wait for a repo archive to fetch.
	// It is parsed with time.ParseDuration.
	//
	// This timeout should be low when searching across many repos
	// so that unfetched repos don't delay the search, and because we are likely
	// to get results from the repos that have already been fetched.
	//
	// This timeout should be high when searching across a single repo
	// because returning results slowly is better than returning no results at all.
	//
	// This only times out how long we wait for the fetch request;
	// the fetch will still happen in the background so future requests don't have to wait.
	FetchTimeout string

	// The deadline for the search request.
	// It is parsed with time.Time.UnmarshalText.
	Deadline string

	// Endpoint(s) for reaching Zoekt. See description in
	// endpoint.go:Static(...)
	IndexerEndpoints []string

	// Whether the revision to be searched is indexed or unindexed. This matters for
	// structural search because it will query Zoekt for indexed structural search.
	Indexed bool
}
```

Request represents a request to searcher 

### <a id="Response" href="#Response">type Response struct</a>

```
searchKey: protocol.Response
tags: [struct]
```

```Go
type Response struct {
	Matches []FileMatch

	// LimitHit is true if Matches may not include all FileMatches because a match limit was hit.
	LimitHit bool

	// DeadlineHit is true if Matches may not include all FileMatches because a deadline was hit.
	DeadlineHit bool
}
```

Response represents the response from a Search request. 

