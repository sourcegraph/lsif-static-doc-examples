# Package repos

## Index

* [Constants](#const)
    * [const regexpFlags](#regexpFlags)
* [Variables](#var)
    * [var MockResolveRepoGroups](#MockResolveRepoGroups)
    * [var dsn](#dsn)
* [Types](#type)
    * [type ExcludedRepos struct](#ExcludedRepos)
        * [func computeExcludedRepositories(ctx context.Context, db dbutil.DB, q query.Q, op database.ReposListOptions) (excluded ExcludedRepos)](#computeExcludedRepositories)
    * [type Options struct](#Options)
        * [func (op *Options) String() string](#Options.String)
    * [type RepoGroupValue interface](#RepoGroupValue)
    * [type RepoPath string](#RepoPath)
        * [func (r RepoPath) String() string](#RepoPath.String)
        * [func (RepoPath) value()](#RepoPath.value)
    * [type RepoRegexpPattern string](#RepoRegexpPattern)
        * [func (r RepoRegexpPattern) String() string](#RepoRegexpPattern.String)
        * [func (RepoRegexpPattern) value()](#RepoRegexpPattern.value)
    * [type Resolved struct](#Resolved)
        * [func (r *Resolved) String() string](#Resolved.String)
    * [type Resolver struct](#Resolver)
        * [func (r *Resolver) Resolve(ctx context.Context, op Options) (Resolved, error)](#Resolver.Resolve)
    * [type badRequestError struct](#badRequestError)
        * [func (e *badRequestError) BadRequest() bool](#badRequestError.BadRequest)
        * [func (e *badRequestError) Cause() error](#badRequestError.Cause)
        * [func (e *badRequestError) Error() string](#badRequestError.Error)
    * [type defaultReposFunc func(ctx context.Context) ([]github.com/sourcegraph/sourcegraph/internal/types.RepoName, error)](#defaultReposFunc)
    * [type patternRevspec struct](#patternRevspec)
* [Functions](#func)
    * [func BenchmarkGetRevsForMatchedRepo(b *testing.B)](#BenchmarkGetRevsForMatchedRepo)
    * [func ExactlyOneRepo(repoFilters []string) bool](#ExactlyOneRepo)
    * [func RepoGroupsToIncludePatterns(groupNames []string, groups map[string][]RepoGroupValue) (string, int)](#RepoGroupsToIncludePatterns)
    * [func ResolveRepoGroups(ctx context.Context, settings *schema.Settings) (groups map[string][]RepoGroupValue, err error)](#ResolveRepoGroups)
    * [func ResolveRepoGroupsFromSettings(settings *schema.Settings) map[string][]RepoGroupValue](#ResolveRepoGroupsFromSettings)
    * [func SearchLimits() schema.SearchLimits](#SearchLimits)
    * [func TestDefaultRepositories(t *testing.T)](#TestDefaultRepositories)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestRepoGroupValuesToRegexp(t *testing.T)](#TestRepoGroupValuesToRegexp)
    * [func TestResolveRepositoriesWithSearchContext(t *testing.T)](#TestResolveRepositoriesWithSearchContext)
    * [func TestResolveRepositoriesWithUserSearchContext(t *testing.T)](#TestResolveRepositoriesWithUserSearchContext)
    * [func TestRevisionValidation(t *testing.T)](#TestRevisionValidation)
    * [func TestSearchRevspecs(t *testing.T)](#TestSearchRevspecs)
    * [func TestUseDefaultReposIfMissingOrGlobalSearchContext(t *testing.T)](#TestUseDefaultReposIfMissingOrGlobalSearchContext)
    * [func UnionRegExps(patterns []string) string](#UnionRegExps)
    * [func defaultRepositories(ctx context.Context, getRawDefaultRepos defaultReposFunc, z *searchbackend.Zoekt, excludePatterns []string) (_ []types.RepoName, err error)](#defaultRepositories)
    * [func filterRepoHasCommitAfter(ctx context.Context, revisions []*search.RepositoryRevisions, after string) ([]*search.RepositoryRevisions, error)](#filterRepoHasCommitAfter)
    * [func findPatternRevs(includePatterns []string) (includePatternRevs []patternRevspec, err error)](#findPatternRevs)
    * [func getRevsForMatchedRepo(repo api.RepoName, pats []patternRevspec) (matched []search.RevisionSpecifier, clashing []search.RevisionSpecifier)](#getRevsForMatchedRepo)
    * [func optimizeRepoPatternWithHeuristics(repoPattern string) string](#optimizeRepoPatternWithHeuristics)
    * [func repoGroupValuesToRegexp(groupNames []string, groups map[string][]RepoGroupValue) []string](#repoGroupValuesToRegexp)
    * [func resolveVersionContext(versionContext string) (*schema.VersionContext, error)](#resolveVersionContext)
    * [func stringSliceToRevisionSpecifiers(revisions []string) []search.RevisionSpecifier](#stringSliceToRevisionSpecifiers)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="regexpFlags" href="#regexpFlags">const regexpFlags</a>

```
searchKey: repos.regexpFlags
tags: [constant number private]
```

```Go
const regexpFlags = regexpsyntax.ClassNL | regexpsyntax.PerlX | regexpsyntax.UnicodeGroups
```

Cf. golang/go/src/regexp/syntax/parse.go. 

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="MockResolveRepoGroups" href="#MockResolveRepoGroups">var MockResolveRepoGroups</a>

```
searchKey: repos.MockResolveRepoGroups
tags: [variable function]
```

```Go
var MockResolveRepoGroups func() (map[string][]RepoGroupValue, error)
```

### <a id="dsn" href="#dsn">var dsn</a>

```
searchKey: repos.dsn
tags: [variable string private]
```

```Go
var dsn = flag.String("dsn", "", "Database connection string to use in integration tests")
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="ExcludedRepos" href="#ExcludedRepos">type ExcludedRepos struct</a>

```
searchKey: repos.ExcludedRepos
tags: [struct]
```

```Go
type ExcludedRepos struct {
	Forks    int
	Archived int
}
```

ExcludedRepos is a type that counts how many repos with a certain label were excluded from search results. 

#### <a id="computeExcludedRepositories" href="#computeExcludedRepositories">func computeExcludedRepositories(ctx context.Context, db dbutil.DB, q query.Q, op database.ReposListOptions) (excluded ExcludedRepos)</a>

```
searchKey: repos.computeExcludedRepositories
tags: [method private]
```

```Go
func computeExcludedRepositories(ctx context.Context, db dbutil.DB, q query.Q, op database.ReposListOptions) (excluded ExcludedRepos)
```

computeExcludedRepositories returns a list of excluded repositories (Forks or archives) based on the search Query. 

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: repos.Options
tags: [struct]
```

```Go
type Options struct {
	RepoFilters        []string
	MinusRepoFilters   []string
	RepoGroupFilters   []string
	SearchContextSpec  string
	VersionContextName string
	UserSettings       *schema.Settings
	NoForks            bool
	OnlyForks          bool
	NoArchived         bool
	OnlyArchived       bool
	CommitAfter        string
	OnlyPrivate        bool
	OnlyPublic         bool
	Ranked             bool // Return results ordered by rank
	Limit              int
	Query              query.Q
}
```

#### <a id="Options.String" href="#Options.String">func (op *Options) String() string</a>

```
searchKey: repos.Options.String
tags: [function]
```

```Go
func (op *Options) String() string
```

### <a id="RepoGroupValue" href="#RepoGroupValue">type RepoGroupValue interface</a>

```
searchKey: repos.RepoGroupValue
tags: [interface]
```

```Go
type RepoGroupValue interface {
	value()
	String() string
}
```

A repogroup value is either a exact repo path RepoPath, or a regular expression pattern RepoRegexpPattern. 

### <a id="RepoPath" href="#RepoPath">type RepoPath string</a>

```
searchKey: repos.RepoPath
tags: [string]
```

```Go
type RepoPath string
```

#### <a id="RepoPath.String" href="#RepoPath.String">func (r RepoPath) String() string</a>

```
searchKey: repos.RepoPath.String
tags: [function]
```

```Go
func (r RepoPath) String() string
```

#### <a id="RepoPath.value" href="#RepoPath.value">func (RepoPath) value()</a>

```
searchKey: repos.RepoPath.value
tags: [function private]
```

```Go
func (RepoPath) value()
```

### <a id="RepoRegexpPattern" href="#RepoRegexpPattern">type RepoRegexpPattern string</a>

```
searchKey: repos.RepoRegexpPattern
tags: [string]
```

```Go
type RepoRegexpPattern string
```

#### <a id="RepoRegexpPattern.String" href="#RepoRegexpPattern.String">func (r RepoRegexpPattern) String() string</a>

```
searchKey: repos.RepoRegexpPattern.String
tags: [function]
```

```Go
func (r RepoRegexpPattern) String() string
```

#### <a id="RepoRegexpPattern.value" href="#RepoRegexpPattern.value">func (RepoRegexpPattern) value()</a>

```
searchKey: repos.RepoRegexpPattern.value
tags: [function private]
```

```Go
func (RepoRegexpPattern) value()
```

### <a id="Resolved" href="#Resolved">type Resolved struct</a>

```
searchKey: repos.Resolved
tags: [struct]
```

```Go
type Resolved struct {
	RepoRevs        []*search.RepositoryRevisions
	MissingRepoRevs []*search.RepositoryRevisions
	ExcludedRepos   ExcludedRepos
	OverLimit       bool
}
```

#### <a id="Resolved.String" href="#Resolved.String">func (r *Resolved) String() string</a>

```
searchKey: repos.Resolved.String
tags: [function]
```

```Go
func (r *Resolved) String() string
```

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: repos.Resolver
tags: [struct]
```

```Go
type Resolver struct {
	DB               dbutil.DB
	Zoekt            *searchbackend.Zoekt
	DefaultReposFunc defaultReposFunc
}
```

#### <a id="Resolver.Resolve" href="#Resolver.Resolve">func (r *Resolver) Resolve(ctx context.Context, op Options) (Resolved, error)</a>

```
searchKey: repos.Resolver.Resolve
tags: [method]
```

```Go
func (r *Resolver) Resolve(ctx context.Context, op Options) (Resolved, error)
```

### <a id="badRequestError" href="#badRequestError">type badRequestError struct</a>

```
searchKey: repos.badRequestError
tags: [struct private]
```

```Go
type badRequestError struct {
	err error
}
```

#### <a id="badRequestError.BadRequest" href="#badRequestError.BadRequest">func (e *badRequestError) BadRequest() bool</a>

```
searchKey: repos.badRequestError.BadRequest
tags: [function private]
```

```Go
func (e *badRequestError) BadRequest() bool
```

#### <a id="badRequestError.Cause" href="#badRequestError.Cause">func (e *badRequestError) Cause() error</a>

```
searchKey: repos.badRequestError.Cause
tags: [function private]
```

```Go
func (e *badRequestError) Cause() error
```

#### <a id="badRequestError.Error" href="#badRequestError.Error">func (e *badRequestError) Error() string</a>

```
searchKey: repos.badRequestError.Error
tags: [function private]
```

```Go
func (e *badRequestError) Error() string
```

### <a id="defaultReposFunc" href="#defaultReposFunc">type defaultReposFunc func(ctx context.Context) ([]github.com/sourcegraph/sourcegraph/internal/types.RepoName, error)</a>

```
searchKey: repos.defaultReposFunc
tags: [function private]
```

```Go
type defaultReposFunc func(ctx context.Context) ([]types.RepoName, error)
```

### <a id="patternRevspec" href="#patternRevspec">type patternRevspec struct</a>

```
searchKey: repos.patternRevspec
tags: [struct private]
```

```Go
type patternRevspec struct {
	includePattern *regexp.Regexp
	revs           []search.RevisionSpecifier
}
```

a patternRevspec maps an include pattern to a list of revisions for repos matching that pattern. "map" in this case does not mean an actual map, because we want regexp matches, not identity matches. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkGetRevsForMatchedRepo" href="#BenchmarkGetRevsForMatchedRepo">func BenchmarkGetRevsForMatchedRepo(b *testing.B)</a>

```
searchKey: repos.BenchmarkGetRevsForMatchedRepo
tags: [method private benchmark]
```

```Go
func BenchmarkGetRevsForMatchedRepo(b *testing.B)
```

### <a id="ExactlyOneRepo" href="#ExactlyOneRepo">func ExactlyOneRepo(repoFilters []string) bool</a>

```
searchKey: repos.ExactlyOneRepo
tags: [method]
```

```Go
func ExactlyOneRepo(repoFilters []string) bool
```

ExactlyOneRepo returns whether exactly one repo: literal field is specified and delineated by regex anchors ^ and $. This function helps determine whether we should return results for a single repo regardless of whether it is a fork or archive. 

### <a id="RepoGroupsToIncludePatterns" href="#RepoGroupsToIncludePatterns">func RepoGroupsToIncludePatterns(groupNames []string, groups map[string][]RepoGroupValue) (string, int)</a>

```
searchKey: repos.RepoGroupsToIncludePatterns
tags: [method]
```

```Go
func RepoGroupsToIncludePatterns(groupNames []string, groups map[string][]RepoGroupValue) (string, int)
```

RepoGroupsToIncludePatterns converts the repo groups from settings to an include pattern 

### <a id="ResolveRepoGroups" href="#ResolveRepoGroups">func ResolveRepoGroups(ctx context.Context, settings *schema.Settings) (groups map[string][]RepoGroupValue, err error)</a>

```
searchKey: repos.ResolveRepoGroups
tags: [method]
```

```Go
func ResolveRepoGroups(ctx context.Context, settings *schema.Settings) (groups map[string][]RepoGroupValue, err error)
```

ResolveRepoGroups retrieves the repository group from settings and checks the database for any user configured repogroups. 

### <a id="ResolveRepoGroupsFromSettings" href="#ResolveRepoGroupsFromSettings">func ResolveRepoGroupsFromSettings(settings *schema.Settings) map[string][]RepoGroupValue</a>

```
searchKey: repos.ResolveRepoGroupsFromSettings
tags: [method]
```

```Go
func ResolveRepoGroupsFromSettings(settings *schema.Settings) map[string][]RepoGroupValue
```

ResolveRepoGroupsFromSettings retrieves the repository group configuration from settings. Will not check the database for any user configured repogroups. 

### <a id="SearchLimits" href="#SearchLimits">func SearchLimits() schema.SearchLimits</a>

```
searchKey: repos.SearchLimits
tags: [function]
```

```Go
func SearchLimits() schema.SearchLimits
```

### <a id="TestDefaultRepositories" href="#TestDefaultRepositories">func TestDefaultRepositories(t *testing.T)</a>

```
searchKey: repos.TestDefaultRepositories
tags: [method private test]
```

```Go
func TestDefaultRepositories(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: repos.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestRepoGroupValuesToRegexp" href="#TestRepoGroupValuesToRegexp">func TestRepoGroupValuesToRegexp(t *testing.T)</a>

```
searchKey: repos.TestRepoGroupValuesToRegexp
tags: [method private test]
```

```Go
func TestRepoGroupValuesToRegexp(t *testing.T)
```

### <a id="TestResolveRepositoriesWithSearchContext" href="#TestResolveRepositoriesWithSearchContext">func TestResolveRepositoriesWithSearchContext(t *testing.T)</a>

```
searchKey: repos.TestResolveRepositoriesWithSearchContext
tags: [method private test]
```

```Go
func TestResolveRepositoriesWithSearchContext(t *testing.T)
```

### <a id="TestResolveRepositoriesWithUserSearchContext" href="#TestResolveRepositoriesWithUserSearchContext">func TestResolveRepositoriesWithUserSearchContext(t *testing.T)</a>

```
searchKey: repos.TestResolveRepositoriesWithUserSearchContext
tags: [method private test]
```

```Go
func TestResolveRepositoriesWithUserSearchContext(t *testing.T)
```

### <a id="TestRevisionValidation" href="#TestRevisionValidation">func TestRevisionValidation(t *testing.T)</a>

```
searchKey: repos.TestRevisionValidation
tags: [method private test]
```

```Go
func TestRevisionValidation(t *testing.T)
```

### <a id="TestSearchRevspecs" href="#TestSearchRevspecs">func TestSearchRevspecs(t *testing.T)</a>

```
searchKey: repos.TestSearchRevspecs
tags: [method private test]
```

```Go
func TestSearchRevspecs(t *testing.T)
```

TestSearchRevspecs tests a repository name against a list of repository specs with optional revspecs, and determines whether we get the expected error, list of matching rev specs, or list of clashing revspecs (if no matching rev specs were found) 

### <a id="TestUseDefaultReposIfMissingOrGlobalSearchContext" href="#TestUseDefaultReposIfMissingOrGlobalSearchContext">func TestUseDefaultReposIfMissingOrGlobalSearchContext(t *testing.T)</a>

```
searchKey: repos.TestUseDefaultReposIfMissingOrGlobalSearchContext
tags: [method private test]
```

```Go
func TestUseDefaultReposIfMissingOrGlobalSearchContext(t *testing.T)
```

### <a id="UnionRegExps" href="#UnionRegExps">func UnionRegExps(patterns []string) string</a>

```
searchKey: repos.UnionRegExps
tags: [method]
```

```Go
func UnionRegExps(patterns []string) string
```

### <a id="defaultRepositories" href="#defaultRepositories">func defaultRepositories(ctx context.Context, getRawDefaultRepos defaultReposFunc, z *searchbackend.Zoekt, excludePatterns []string) (_ []types.RepoName, err error)</a>

```
searchKey: repos.defaultRepositories
tags: [method private]
```

```Go
func defaultRepositories(ctx context.Context, getRawDefaultRepos defaultReposFunc, z *searchbackend.Zoekt, excludePatterns []string) (_ []types.RepoName, err error)
```

defaultRepositories returns the intersection of calling getRawDefaultRepos (db) and indexed repos (zoekt), minus repos matching excludePatterns. 

### <a id="filterRepoHasCommitAfter" href="#filterRepoHasCommitAfter">func filterRepoHasCommitAfter(ctx context.Context, revisions []*search.RepositoryRevisions, after string) ([]*search.RepositoryRevisions, error)</a>

```
searchKey: repos.filterRepoHasCommitAfter
tags: [method private]
```

```Go
func filterRepoHasCommitAfter(ctx context.Context, revisions []*search.RepositoryRevisions, after string) ([]*search.RepositoryRevisions, error)
```

### <a id="findPatternRevs" href="#findPatternRevs">func findPatternRevs(includePatterns []string) (includePatternRevs []patternRevspec, err error)</a>

```
searchKey: repos.findPatternRevs
tags: [method private]
```

```Go
func findPatternRevs(includePatterns []string) (includePatternRevs []patternRevspec, err error)
```

findPatternRevs mutates the given list of include patterns to be a raw list of the repository name patterns we want, separating out their revision specs, if any. 

### <a id="getRevsForMatchedRepo" href="#getRevsForMatchedRepo">func getRevsForMatchedRepo(repo api.RepoName, pats []patternRevspec) (matched []search.RevisionSpecifier, clashing []search.RevisionSpecifier)</a>

```
searchKey: repos.getRevsForMatchedRepo
tags: [method private]
```

```Go
func getRevsForMatchedRepo(repo api.RepoName, pats []patternRevspec) (matched []search.RevisionSpecifier, clashing []search.RevisionSpecifier)
```

given a repo name, determine whether it matched any patterns for which we have revspecs (or ref globs), and if so, return the matching/allowed ones. 

### <a id="optimizeRepoPatternWithHeuristics" href="#optimizeRepoPatternWithHeuristics">func optimizeRepoPatternWithHeuristics(repoPattern string) string</a>

```
searchKey: repos.optimizeRepoPatternWithHeuristics
tags: [method private]
```

```Go
func optimizeRepoPatternWithHeuristics(repoPattern string) string
```

### <a id="repoGroupValuesToRegexp" href="#repoGroupValuesToRegexp">func repoGroupValuesToRegexp(groupNames []string, groups map[string][]RepoGroupValue) []string</a>

```
searchKey: repos.repoGroupValuesToRegexp
tags: [method private]
```

```Go
func repoGroupValuesToRegexp(groupNames []string, groups map[string][]RepoGroupValue) []string
```

repoGroupValuesToRegexp does a lookup of all repo groups by name and converts their values to a list of regular expressions to search. 

### <a id="resolveVersionContext" href="#resolveVersionContext">func resolveVersionContext(versionContext string) (*schema.VersionContext, error)</a>

```
searchKey: repos.resolveVersionContext
tags: [method private]
```

```Go
func resolveVersionContext(versionContext string) (*schema.VersionContext, error)
```

NOTE: This function is not called if the version context is not used 

### <a id="stringSliceToRevisionSpecifiers" href="#stringSliceToRevisionSpecifiers">func stringSliceToRevisionSpecifiers(revisions []string) []search.RevisionSpecifier</a>

```
searchKey: repos.stringSliceToRevisionSpecifiers
tags: [method private]
```

```Go
func stringSliceToRevisionSpecifiers(revisions []string) []search.RevisionSpecifier
```

