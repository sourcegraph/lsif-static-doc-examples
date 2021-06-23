# Package pathmatch

Package pathmatch provides helpers for matching paths against globs and regular expressions. 

## Index

* [Types](#type)
    * [type PathMatcher interface](#PathMatcher)
        * [func CompilePattern(pattern string, options CompileOptions) (PathMatcher, error)](#CompilePattern)
        * [func CompilePatterns(patterns []string, options CompileOptions) (PathMatcher, error)](#CompilePatterns)
        * [func CompilePathPatterns(includePatterns []string, excludePattern string, options CompileOptions) (PathMatcher, error)](#CompilePathPatterns)
    * [type pathMatcherFunc struct](#pathMatcherFunc)
        * [func (f *pathMatcherFunc) MatchPath(path string) bool](#pathMatcherFunc.MatchPath)
        * [func (f *pathMatcherFunc) String() string](#pathMatcherFunc.String)
    * [type regexpMatcher regexp.Regexp](#regexpMatcher)
        * [func (m *regexpMatcher) MatchPath(path string) bool](#regexpMatcher.MatchPath)
        * [func (m *regexpMatcher) String() string](#regexpMatcher.String)
    * [type CompileOptions struct](#CompileOptions)
    * [type pathMatcherAnd []pathmatch.PathMatcher](#pathMatcherAnd)
        * [func (pm pathMatcherAnd) MatchPath(path string) bool](#pathMatcherAnd.MatchPath)
        * [func (pm pathMatcherAnd) String() string](#pathMatcherAnd.String)
    * [type pathMatcherIncludeExclude struct](#pathMatcherIncludeExclude)
        * [func (pm pathMatcherIncludeExclude) MatchPath(path string) bool](#pathMatcherIncludeExclude.MatchPath)
        * [func (pm pathMatcherIncludeExclude) String() string](#pathMatcherIncludeExclude.String)
* [Functions](#func)
    * [func TestCompilePattern(t *testing.T)](#TestCompilePattern)
    * [func TestCompilePathPatterns(t *testing.T)](#TestCompilePathPatterns)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="PathMatcher" href="#PathMatcher">type PathMatcher interface</a>

```
searchKey: pathmatch.PathMatcher
```

```Go
type PathMatcher interface {
	MatchPath(path string) bool

	// String returns the source text used to compile the PatchMatcher.
	String() string
}
```

PathMatcher reports whether the path was matched. 

#### <a id="CompilePattern" href="#CompilePattern">func CompilePattern(pattern string, options CompileOptions) (PathMatcher, error)</a>

```
searchKey: pathmatch.CompilePattern
```

```Go
func CompilePattern(pattern string, options CompileOptions) (PathMatcher, error)
```

CompilePattern compiles pattern into a PathMatcher func. 

#### <a id="CompilePatterns" href="#CompilePatterns">func CompilePatterns(patterns []string, options CompileOptions) (PathMatcher, error)</a>

```
searchKey: pathmatch.CompilePatterns
```

```Go
func CompilePatterns(patterns []string, options CompileOptions) (PathMatcher, error)
```

CompilePatterns compiles the patterns into a PathMatcher func that matches a path iff all patterns match the path. 

#### <a id="CompilePathPatterns" href="#CompilePathPatterns">func CompilePathPatterns(includePatterns []string, excludePattern string, options CompileOptions) (PathMatcher, error)</a>

```
searchKey: pathmatch.CompilePathPatterns
```

```Go
func CompilePathPatterns(includePatterns []string, excludePattern string, options CompileOptions) (PathMatcher, error)
```

CompilePathPatterns returns a PathMatcher func that matches a path iff: 

* all of the includePatterns match the path; AND * the excludePattern does NOT match the path. 

This is the most common behavior for include/exclude paths in a search interface. 

### <a id="pathMatcherFunc" href="#pathMatcherFunc">type pathMatcherFunc struct</a>

```
searchKey: pathmatch.pathMatcherFunc
tags: [private]
```

```Go
type pathMatcherFunc struct {
	matcher func(path string) bool
	pattern string
}
```

#### <a id="pathMatcherFunc.MatchPath" href="#pathMatcherFunc.MatchPath">func (f *pathMatcherFunc) MatchPath(path string) bool</a>

```
searchKey: pathmatch.pathMatcherFunc.MatchPath
tags: [private]
```

```Go
func (f *pathMatcherFunc) MatchPath(path string) bool
```

#### <a id="pathMatcherFunc.String" href="#pathMatcherFunc.String">func (f *pathMatcherFunc) String() string</a>

```
searchKey: pathmatch.pathMatcherFunc.String
tags: [private]
```

```Go
func (f *pathMatcherFunc) String() string
```

### <a id="regexpMatcher" href="#regexpMatcher">type regexpMatcher regexp.Regexp</a>

```
searchKey: pathmatch.regexpMatcher
tags: [private]
```

```Go
type regexpMatcher regexp.Regexp
```

regexpMatcher is a PathMatcher backed by a regexp. 

#### <a id="regexpMatcher.MatchPath" href="#regexpMatcher.MatchPath">func (m *regexpMatcher) MatchPath(path string) bool</a>

```
searchKey: pathmatch.regexpMatcher.MatchPath
tags: [private]
```

```Go
func (m *regexpMatcher) MatchPath(path string) bool
```

#### <a id="regexpMatcher.String" href="#regexpMatcher.String">func (m *regexpMatcher) String() string</a>

```
searchKey: pathmatch.regexpMatcher.String
tags: [private]
```

```Go
func (m *regexpMatcher) String() string
```

### <a id="CompileOptions" href="#CompileOptions">type CompileOptions struct</a>

```
searchKey: pathmatch.CompileOptions
```

```Go
type CompileOptions struct {
	RegExp        bool // whether the patterns are regular expressions (false means globs)
	CaseSensitive bool // whether the patterns are case sensitive
}
```

CompileOptions specifies options about the patterns to compile. 

### <a id="pathMatcherAnd" href="#pathMatcherAnd">type pathMatcherAnd []pathmatch.PathMatcher</a>

```
searchKey: pathmatch.pathMatcherAnd
tags: [private]
```

```Go
type pathMatcherAnd []PathMatcher
```

pathMatcherAnd is a PathMatcher that matches a path iff all of the underlying matchers match the path. 

#### <a id="pathMatcherAnd.MatchPath" href="#pathMatcherAnd.MatchPath">func (pm pathMatcherAnd) MatchPath(path string) bool</a>

```
searchKey: pathmatch.pathMatcherAnd.MatchPath
tags: [private]
```

```Go
func (pm pathMatcherAnd) MatchPath(path string) bool
```

#### <a id="pathMatcherAnd.String" href="#pathMatcherAnd.String">func (pm pathMatcherAnd) String() string</a>

```
searchKey: pathmatch.pathMatcherAnd.String
tags: [private]
```

```Go
func (pm pathMatcherAnd) String() string
```

### <a id="pathMatcherIncludeExclude" href="#pathMatcherIncludeExclude">type pathMatcherIncludeExclude struct</a>

```
searchKey: pathmatch.pathMatcherIncludeExclude
tags: [private]
```

```Go
type pathMatcherIncludeExclude struct {
	include PathMatcher
	exclude PathMatcher
}
```

pathMatcherIncludeExclude is a PathMatcher that matches a path iff it matches the include matcher AND it does not match the exclude matcher. 

#### <a id="pathMatcherIncludeExclude.MatchPath" href="#pathMatcherIncludeExclude.MatchPath">func (pm pathMatcherIncludeExclude) MatchPath(path string) bool</a>

```
searchKey: pathmatch.pathMatcherIncludeExclude.MatchPath
tags: [private]
```

```Go
func (pm pathMatcherIncludeExclude) MatchPath(path string) bool
```

#### <a id="pathMatcherIncludeExclude.String" href="#pathMatcherIncludeExclude.String">func (pm pathMatcherIncludeExclude) String() string</a>

```
searchKey: pathmatch.pathMatcherIncludeExclude.String
tags: [private]
```

```Go
func (pm pathMatcherIncludeExclude) String() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestCompilePattern" href="#TestCompilePattern">func TestCompilePattern(t *testing.T)</a>

```
searchKey: pathmatch.TestCompilePattern
tags: [private]
```

```Go
func TestCompilePattern(t *testing.T)
```

### <a id="TestCompilePathPatterns" href="#TestCompilePathPatterns">func TestCompilePathPatterns(t *testing.T)</a>

```
searchKey: pathmatch.TestCompilePathPatterns
tags: [private]
```

```Go
func TestCompilePathPatterns(t *testing.T)
```

