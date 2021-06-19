# Package routevar

Package routevar contains routines for parsing and generating URL route variables. 

## Index

* [Constants](#const)
    * [const Def](#Def)
    * [const RepoPattern](#RepoPattern)
    * [const RepoPathDelim](#RepoPathDelim)
    * [const pathComponentNotDelim](#pathComponentNotDelim)
    * [const RevPattern](#RevPattern)
* [Variables](#var)
    * [var namedCaptureGroup](#namedCaptureGroup)
    * [var Repo](#Repo)
    * [var Rev](#Rev)
    * [var RepoRevSuffix](#RepoRevSuffix)
    * [var repoPattern](#repoPattern)
* [Types](#type)
    * [type DefAtRev struct](#DefAtRev)
        * [func ToDefAtRev(routeVars map[string]string) DefAtRev](#ToDefAtRev)
    * [type RepoRev struct](#RepoRev)
        * [func ToRepoRev(routeVars map[string]string) RepoRev](#ToRepoRev)
    * [type InvalidError struct](#InvalidError)
        * [func (e InvalidError) Error() string](#InvalidError.Error)
* [Functions](#func)
    * [func defURLPathToKeyPath(s string) string](#defURLPathToKeyPath)
    * [func DefRouteVars(s DefAtRev) map[string]string](#DefRouteVars)
    * [func namedToNonCapturingGroups(pat string) string](#namedToNonCapturingGroups)
    * [func ParseRepo(spec string) (repo api.RepoName, err error)](#ParseRepo)
    * [func RepoRouteVars(repo api.RepoName) map[string]string](#RepoRouteVars)
    * [func ToRepo(routeVars map[string]string) api.RepoName](#ToRepo)
    * [func RepoRevRouteVars(s RepoRev) map[string]string](#RepoRevRouteVars)
    * [func pathUnescape(p string) string](#pathUnescape)
    * [func TestDefRouteVars(t *testing.T)](#TestDefRouteVars)
    * [func pairs(m map[string]string) []string](#pairs)
    * [func TestNamedToNonCapturingGroups(t *testing.T)](#TestNamedToNonCapturingGroups)
    * [func TestRepoPattern(t *testing.T)](#TestRepoPattern)
    * [func TestRevPattern(t *testing.T)](#TestRevPattern)
    * [func TestRepo(t *testing.T)](#TestRepo)
    * [func TestRev(t *testing.T)](#TestRev)
    * [func TestRepoRevSpec(t *testing.T)](#TestRepoRevSpec)


## <a id="const" href="#const">Constants</a>

### <a id="Def" href="#Def">const Def</a>

```
searchKey: routevar.Def
tags: [exported]
```

```Go
const Def = "{UnitType}/{Unit:.+?}/-/{Path:.*?}"
```

Def captures def paths in URL routes. 

### <a id="RepoPattern" href="#RepoPattern">const RepoPattern</a>

```
searchKey: routevar.RepoPattern
tags: [exported]
```

```Go
const RepoPattern = `(?P<repo>(?:` + pathComponentNotDelim + `/)*` + pathComponentNotDelim + `)`
```

RepoPattern is the regexp pattern that matches repo path strings ("repo" or "domain.com/repo" or "domain.com/path/to/repo"). 

### <a id="RepoPathDelim" href="#RepoPathDelim">const RepoPathDelim</a>

```
searchKey: routevar.RepoPathDelim
tags: [exported]
```

```Go
const RepoPathDelim = "-"
```

### <a id="pathComponentNotDelim" href="#pathComponentNotDelim">const pathComponentNotDelim</a>

```
searchKey: routevar.pathComponentNotDelim
```

```Go
const pathComponentNotDelim = `(?:[^@/` + RepoPathDelim + `]|(?:[^/@]{2,}))`
```

### <a id="RevPattern" href="#RevPattern">const RevPattern</a>

```
searchKey: routevar.RevPattern
tags: [exported]
```

```Go
const RevPattern = `(?P<rev>(?:` + pathComponentNotDelim + `/)*` + pathComponentNotDelim + `)`
```

RevPattern is the regexp pattern that matches a VCS revision specifier (e.g., "master" or "my/branch~1", or a full 40-char commit ID). 

## <a id="var" href="#var">Variables</a>

### <a id="namedCaptureGroup" href="#namedCaptureGroup">var namedCaptureGroup</a>

```
searchKey: routevar.namedCaptureGroup
```

```Go
var namedCaptureGroup = lazyregexp.New(`\(\?P<[^>]+>`)
```

namedCaptureGroup matches the syntax for the opening of a regexp named capture group (`(?P<name>`). 

### <a id="Repo" href="#Repo">var Repo</a>

```
searchKey: routevar.Repo
tags: [exported]
```

```Go
var Repo = `{Repo:` + namedToNonCapturingGroups(RepoPattern) + `}`
```

### <a id="Rev" href="#Rev">var Rev</a>

```
searchKey: routevar.Rev
tags: [exported]
```

```Go
var Rev = `{Rev:` + namedToNonCapturingGroups(RevPattern) + `}`
```

### <a id="RepoRevSuffix" href="#RepoRevSuffix">var RepoRevSuffix</a>

```
searchKey: routevar.RepoRevSuffix
tags: [exported]
```

```Go
var RepoRevSuffix = `{Rev:` + namedToNonCapturingGroups(`(?:@`+RevPattern+`)?`) + `}`
```

### <a id="repoPattern" href="#repoPattern">var repoPattern</a>

```
searchKey: routevar.repoPattern
```

```Go
var repoPattern = lazyregexp.New("^" + RepoPattern + "$")
```

## <a id="type" href="#type">Types</a>

### <a id="DefAtRev" href="#DefAtRev">type DefAtRev struct</a>

```
searchKey: routevar.DefAtRev
tags: [exported]
```

```Go
type DefAtRev struct {
	RepoRev
	Unit, UnitType, Path string
}
```

DefAtRev refers to a def at a non-absolute commit ID (unlike DefSpec/DefKey, which require the CommitID field to have an absolute commit ID). 

#### <a id="ToDefAtRev" href="#ToDefAtRev">func ToDefAtRev(routeVars map[string]string) DefAtRev</a>

```
searchKey: routevar.ToDefAtRev
tags: [exported]
```

```Go
func ToDefAtRev(routeVars map[string]string) DefAtRev
```

### <a id="RepoRev" href="#RepoRev">type RepoRev struct</a>

```
searchKey: routevar.RepoRev
tags: [exported]
```

```Go
type RepoRev struct {
	Repo api.RepoName // a repo path
	Rev  string       // a VCS revision specifier (branch, "master~7", commit ID, etc.)
}
```

A RepoRev specifies a repo at a revision. The revision need not be an absolute commit ID. This RepoRev type is appropriate for user input (e.g., from a URL), where it is convenient to allow users to specify non-absolute commit IDs that the server can resolve. 

#### <a id="ToRepoRev" href="#ToRepoRev">func ToRepoRev(routeVars map[string]string) RepoRev</a>

```
searchKey: routevar.ToRepoRev
tags: [exported]
```

```Go
func ToRepoRev(routeVars map[string]string) RepoRev
```

ToRepoRev marshals a map containing route variables generated by (RepoRevSpec).RouteVars() and returns the equivalent RepoRevSpec struct. 

### <a id="InvalidError" href="#InvalidError">type InvalidError struct</a>

```
searchKey: routevar.InvalidError
tags: [exported]
```

```Go
type InvalidError struct {
	Type  string // Repo, etc.
	Input string // the original string input
	Err   error  // underlying error (nil for routine regexp match failures)
}
```

InvalidError occurs when a spec string is invalid. 

#### <a id="InvalidError.Error" href="#InvalidError.Error">func (e InvalidError) Error() string</a>

```
searchKey: routevar.InvalidError.Error
tags: [exported]
```

```Go
func (e InvalidError) Error() string
```

## <a id="func" href="#func">Functions</a>

### <a id="defURLPathToKeyPath" href="#defURLPathToKeyPath">func defURLPathToKeyPath(s string) string</a>

```
searchKey: routevar.defURLPathToKeyPath
```

```Go
func defURLPathToKeyPath(s string) string
```

### <a id="DefRouteVars" href="#DefRouteVars">func DefRouteVars(s DefAtRev) map[string]string</a>

```
searchKey: routevar.DefRouteVars
tags: [exported]
```

```Go
func DefRouteVars(s DefAtRev) map[string]string
```

### <a id="namedToNonCapturingGroups" href="#namedToNonCapturingGroups">func namedToNonCapturingGroups(pat string) string</a>

```
searchKey: routevar.namedToNonCapturingGroups
```

```Go
func namedToNonCapturingGroups(pat string) string
```

namedToNonCapturingGroups converts named capturing groups `(?P<myname>...)` to non-capturing groups `(?:...)` for use in mux route declarations (which assume that the route patterns do not have any capturing groups). 

### <a id="ParseRepo" href="#ParseRepo">func ParseRepo(spec string) (repo api.RepoName, err error)</a>

```
searchKey: routevar.ParseRepo
tags: [exported]
```

```Go
func ParseRepo(spec string) (repo api.RepoName, err error)
```

ParseRepo parses a repo path string. If spec is invalid, an InvalidError is returned. 

### <a id="RepoRouteVars" href="#RepoRouteVars">func RepoRouteVars(repo api.RepoName) map[string]string</a>

```
searchKey: routevar.RepoRouteVars
tags: [exported]
```

```Go
func RepoRouteVars(repo api.RepoName) map[string]string
```

RepoRouteVars returns route variables for constructing repository routes. 

### <a id="ToRepo" href="#ToRepo">func ToRepo(routeVars map[string]string) api.RepoName</a>

```
searchKey: routevar.ToRepo
tags: [exported]
```

```Go
func ToRepo(routeVars map[string]string) api.RepoName
```

ToRepo returns the repo path string from a map containing route variables. 

### <a id="RepoRevRouteVars" href="#RepoRevRouteVars">func RepoRevRouteVars(s RepoRev) map[string]string</a>

```
searchKey: routevar.RepoRevRouteVars
tags: [exported]
```

```Go
func RepoRevRouteVars(s RepoRev) map[string]string
```

RepoRevRouteVars returns route variables for constructing routes to a repository revision. 

### <a id="pathUnescape" href="#pathUnescape">func pathUnescape(p string) string</a>

```
searchKey: routevar.pathUnescape
```

```Go
func pathUnescape(p string) string
```

pathUnescape is a limited version of url.QueryEscape that only unescapes '?'. 

### <a id="TestDefRouteVars" href="#TestDefRouteVars">func TestDefRouteVars(t *testing.T)</a>

```
searchKey: routevar.TestDefRouteVars
```

```Go
func TestDefRouteVars(t *testing.T)
```

### <a id="pairs" href="#pairs">func pairs(m map[string]string) []string</a>

```
searchKey: routevar.pairs
```

```Go
func pairs(m map[string]string) []string
```

pairs converts map's keys and values to a slice of []string{key1, value1, key2, value2, ...}. 

### <a id="TestNamedToNonCapturingGroups" href="#TestNamedToNonCapturingGroups">func TestNamedToNonCapturingGroups(t *testing.T)</a>

```
searchKey: routevar.TestNamedToNonCapturingGroups
```

```Go
func TestNamedToNonCapturingGroups(t *testing.T)
```

### <a id="TestRepoPattern" href="#TestRepoPattern">func TestRepoPattern(t *testing.T)</a>

```
searchKey: routevar.TestRepoPattern
```

```Go
func TestRepoPattern(t *testing.T)
```

### <a id="TestRevPattern" href="#TestRevPattern">func TestRevPattern(t *testing.T)</a>

```
searchKey: routevar.TestRevPattern
```

```Go
func TestRevPattern(t *testing.T)
```

### <a id="TestRepo" href="#TestRepo">func TestRepo(t *testing.T)</a>

```
searchKey: routevar.TestRepo
```

```Go
func TestRepo(t *testing.T)
```

### <a id="TestRev" href="#TestRev">func TestRev(t *testing.T)</a>

```
searchKey: routevar.TestRev
```

```Go
func TestRev(t *testing.T)
```

### <a id="TestRepoRevSpec" href="#TestRepoRevSpec">func TestRepoRevSpec(t *testing.T)</a>

```
searchKey: routevar.TestRepoRevSpec
```

```Go
func TestRepoRevSpec(t *testing.T)
```

