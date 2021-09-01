# Package routevar

Package routevar contains routines for parsing and generating URL route variables. 

## Index

* [Constants](#const)
    * [const Def](#Def)
    * [const RepoPathDelim](#RepoPathDelim)
    * [const RepoPattern](#RepoPattern)
    * [const RevPattern](#RevPattern)
    * [const pathComponentNotDelim](#pathComponentNotDelim)
* [Variables](#var)
    * [var Repo](#Repo)
    * [var RepoRevSuffix](#RepoRevSuffix)
    * [var Rev](#Rev)
    * [var namedCaptureGroup](#namedCaptureGroup)
    * [var repoPattern](#repoPattern)
* [Types](#type)
    * [type DefAtRev struct](#DefAtRev)
        * [func ToDefAtRev(routeVars map[string]string) DefAtRev](#ToDefAtRev)
    * [type InvalidError struct](#InvalidError)
        * [func (e InvalidError) Error() string](#InvalidError.Error)
    * [type RepoRev struct](#RepoRev)
        * [func ToRepoRev(routeVars map[string]string) RepoRev](#ToRepoRev)
* [Functions](#func)
    * [func DefRouteVars(s DefAtRev) map[string]string](#DefRouteVars)
    * [func ParseRepo(spec string) (repo api.RepoName, err error)](#ParseRepo)
    * [func RepoRevRouteVars(s RepoRev) map[string]string](#RepoRevRouteVars)
    * [func RepoRouteVars(repo api.RepoName) map[string]string](#RepoRouteVars)
    * [func TestDefRouteVars(t *testing.T)](#TestDefRouteVars)
    * [func TestNamedToNonCapturingGroups(t *testing.T)](#TestNamedToNonCapturingGroups)
    * [func TestRepo(t *testing.T)](#TestRepo)
    * [func TestRepoPattern(t *testing.T)](#TestRepoPattern)
    * [func TestRepoRevSpec(t *testing.T)](#TestRepoRevSpec)
    * [func TestRev(t *testing.T)](#TestRev)
    * [func TestRevPattern(t *testing.T)](#TestRevPattern)
    * [func ToRepo(routeVars map[string]string) api.RepoName](#ToRepo)
    * [func defURLPathToKeyPath(s string) string](#defURLPathToKeyPath)
    * [func namedToNonCapturingGroups(pat string) string](#namedToNonCapturingGroups)
    * [func pairs(m map[string]string) []string](#pairs)
    * [func pathUnescape(p string) string](#pathUnescape)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="Def" href="#Def">const Def</a>

```
searchKey: routevar.Def
tags: [constant string]
```

```Go
const Def = "{UnitType}/{Unit:.+?}/-/{Path:.*?}"
```

Def captures def paths in URL routes. 

### <a id="RepoPathDelim" href="#RepoPathDelim">const RepoPathDelim</a>

```
searchKey: routevar.RepoPathDelim
tags: [constant string]
```

```Go
const RepoPathDelim = "-"
```

### <a id="RepoPattern" href="#RepoPattern">const RepoPattern</a>

```
searchKey: routevar.RepoPattern
tags: [constant string]
```

```Go
const RepoPattern = `(?P<repo>(?:` + pathComponentNotDelim + `/)*` + pathComponentNotDelim + `)`
```

RepoPattern is the regexp pattern that matches repo path strings ("repo" or "domain.com/repo" or "domain.com/path/to/repo"). 

### <a id="RevPattern" href="#RevPattern">const RevPattern</a>

```
searchKey: routevar.RevPattern
tags: [constant string]
```

```Go
const RevPattern = `(?P<rev>(?:` + pathComponentNotDelim + `/)*` + pathComponentNotDelim + `)`
```

RevPattern is the regexp pattern that matches a VCS revision specifier (e.g., "master" or "my/branch~1", or a full 40-char commit ID). 

### <a id="pathComponentNotDelim" href="#pathComponentNotDelim">const pathComponentNotDelim</a>

```
searchKey: routevar.pathComponentNotDelim
tags: [constant string private]
```

```Go
const pathComponentNotDelim = `(?:[^@/` + RepoPathDelim + `]|(?:[^/@]{2,}))`
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Repo" href="#Repo">var Repo</a>

```
searchKey: routevar.Repo
tags: [variable string]
```

```Go
var Repo = `{Repo:` + namedToNonCapturingGroups(RepoPattern) + `}`
```

### <a id="RepoRevSuffix" href="#RepoRevSuffix">var RepoRevSuffix</a>

```
searchKey: routevar.RepoRevSuffix
tags: [variable string]
```

```Go
var RepoRevSuffix = `{Rev:` + namedToNonCapturingGroups(`(?:@`+RevPattern+`)?`) + `}`
```

### <a id="Rev" href="#Rev">var Rev</a>

```
searchKey: routevar.Rev
tags: [variable string]
```

```Go
var Rev = `{Rev:` + namedToNonCapturingGroups(RevPattern) + `}`
```

### <a id="namedCaptureGroup" href="#namedCaptureGroup">var namedCaptureGroup</a>

```
searchKey: routevar.namedCaptureGroup
tags: [variable struct private]
```

```Go
var namedCaptureGroup = lazyregexp.New(`\(\?P<[^>]+>`)
```

namedCaptureGroup matches the syntax for the opening of a regexp named capture group (`(?P<name>`). 

### <a id="repoPattern" href="#repoPattern">var repoPattern</a>

```
searchKey: routevar.repoPattern
tags: [variable struct private]
```

```Go
var repoPattern = lazyregexp.New("^" + RepoPattern + "$")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="DefAtRev" href="#DefAtRev">type DefAtRev struct</a>

```
searchKey: routevar.DefAtRev
tags: [struct]
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
tags: [function]
```

```Go
func ToDefAtRev(routeVars map[string]string) DefAtRev
```

### <a id="InvalidError" href="#InvalidError">type InvalidError struct</a>

```
searchKey: routevar.InvalidError
tags: [struct]
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
tags: [method]
```

```Go
func (e InvalidError) Error() string
```

### <a id="RepoRev" href="#RepoRev">type RepoRev struct</a>

```
searchKey: routevar.RepoRev
tags: [struct]
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
tags: [function]
```

```Go
func ToRepoRev(routeVars map[string]string) RepoRev
```

ToRepoRev marshals a map containing route variables generated by (RepoRevSpec).RouteVars() and returns the equivalent RepoRevSpec struct. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="DefRouteVars" href="#DefRouteVars">func DefRouteVars(s DefAtRev) map[string]string</a>

```
searchKey: routevar.DefRouteVars
tags: [function]
```

```Go
func DefRouteVars(s DefAtRev) map[string]string
```

### <a id="ParseRepo" href="#ParseRepo">func ParseRepo(spec string) (repo api.RepoName, err error)</a>

```
searchKey: routevar.ParseRepo
tags: [function]
```

```Go
func ParseRepo(spec string) (repo api.RepoName, err error)
```

ParseRepo parses a repo path string. If spec is invalid, an InvalidError is returned. 

### <a id="RepoRevRouteVars" href="#RepoRevRouteVars">func RepoRevRouteVars(s RepoRev) map[string]string</a>

```
searchKey: routevar.RepoRevRouteVars
tags: [function]
```

```Go
func RepoRevRouteVars(s RepoRev) map[string]string
```

RepoRevRouteVars returns route variables for constructing routes to a repository revision. 

### <a id="RepoRouteVars" href="#RepoRouteVars">func RepoRouteVars(repo api.RepoName) map[string]string</a>

```
searchKey: routevar.RepoRouteVars
tags: [function]
```

```Go
func RepoRouteVars(repo api.RepoName) map[string]string
```

RepoRouteVars returns route variables for constructing repository routes. 

### <a id="TestDefRouteVars" href="#TestDefRouteVars">func TestDefRouteVars(t *testing.T)</a>

```
searchKey: routevar.TestDefRouteVars
tags: [function private test]
```

```Go
func TestDefRouteVars(t *testing.T)
```

### <a id="TestNamedToNonCapturingGroups" href="#TestNamedToNonCapturingGroups">func TestNamedToNonCapturingGroups(t *testing.T)</a>

```
searchKey: routevar.TestNamedToNonCapturingGroups
tags: [function private test]
```

```Go
func TestNamedToNonCapturingGroups(t *testing.T)
```

### <a id="TestRepo" href="#TestRepo">func TestRepo(t *testing.T)</a>

```
searchKey: routevar.TestRepo
tags: [function private test]
```

```Go
func TestRepo(t *testing.T)
```

### <a id="TestRepoPattern" href="#TestRepoPattern">func TestRepoPattern(t *testing.T)</a>

```
searchKey: routevar.TestRepoPattern
tags: [function private test]
```

```Go
func TestRepoPattern(t *testing.T)
```

### <a id="TestRepoRevSpec" href="#TestRepoRevSpec">func TestRepoRevSpec(t *testing.T)</a>

```
searchKey: routevar.TestRepoRevSpec
tags: [function private test]
```

```Go
func TestRepoRevSpec(t *testing.T)
```

### <a id="TestRev" href="#TestRev">func TestRev(t *testing.T)</a>

```
searchKey: routevar.TestRev
tags: [function private test]
```

```Go
func TestRev(t *testing.T)
```

### <a id="TestRevPattern" href="#TestRevPattern">func TestRevPattern(t *testing.T)</a>

```
searchKey: routevar.TestRevPattern
tags: [function private test]
```

```Go
func TestRevPattern(t *testing.T)
```

### <a id="ToRepo" href="#ToRepo">func ToRepo(routeVars map[string]string) api.RepoName</a>

```
searchKey: routevar.ToRepo
tags: [function]
```

```Go
func ToRepo(routeVars map[string]string) api.RepoName
```

ToRepo returns the repo path string from a map containing route variables. 

### <a id="defURLPathToKeyPath" href="#defURLPathToKeyPath">func defURLPathToKeyPath(s string) string</a>

```
searchKey: routevar.defURLPathToKeyPath
tags: [function private]
```

```Go
func defURLPathToKeyPath(s string) string
```

### <a id="namedToNonCapturingGroups" href="#namedToNonCapturingGroups">func namedToNonCapturingGroups(pat string) string</a>

```
searchKey: routevar.namedToNonCapturingGroups
tags: [function private]
```

```Go
func namedToNonCapturingGroups(pat string) string
```

namedToNonCapturingGroups converts named capturing groups `(?P<myname>...)` to non-capturing groups `(?:...)` for use in mux route declarations (which assume that the route patterns do not have any capturing groups). 

### <a id="pairs" href="#pairs">func pairs(m map[string]string) []string</a>

```
searchKey: routevar.pairs
tags: [function private]
```

```Go
func pairs(m map[string]string) []string
```

pairs converts map's keys and values to a slice of []string{key1, value1, key2, value2, ...}. 

### <a id="pathUnescape" href="#pathUnescape">func pathUnescape(p string) string</a>

```
searchKey: routevar.pathUnescape
tags: [function private]
```

```Go
func pathUnescape(p string) string
```

pathUnescape is a limited version of url.QueryEscape that only unescapes '?'. 

