# Package reposource

## Index

* [Constants](#const)
    * [const DefaultRepositoryPathPattern](#DefaultRepositoryPathPattern)
    * [const NameTransformationRegex](#NameTransformationRegex)
* [Variables](#var)
    * [var cloneURLResolvers](#cloneURLResolvers)
    * [var nonSCPURLRegex](#nonSCPURLRegex)
    * [var otherRepoNameReplacer](#otherRepoNameReplacer)
* [Types](#type)
    * [type AWS struct](#AWS)
        * [func (c AWS) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)](#AWS.CloneURLToRepoName)
    * [type BitbucketCloud struct](#BitbucketCloud)
        * [func (c BitbucketCloud) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)](#BitbucketCloud.CloneURLToRepoName)
    * [type BitbucketServer struct](#BitbucketServer)
        * [func (c BitbucketServer) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)](#BitbucketServer.CloneURLToRepoName)
    * [type GitHub struct](#GitHub)
        * [func (c GitHub) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)](#GitHub.CloneURLToRepoName)
    * [type GitLab struct](#GitLab)
        * [func (c GitLab) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)](#GitLab.CloneURLToRepoName)
    * [type Gitolite struct](#Gitolite)
        * [func (c Gitolite) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)](#Gitolite.CloneURLToRepoName)
    * [type NameTransformation struct](#NameTransformation)
        * [func NewNameTransformation(opts NameTransformationOptions) (NameTransformation, error)](#NewNameTransformation)
        * [func (nt NameTransformation) Kind() NameTransformationKind](#NameTransformation.Kind)
        * [func (nt NameTransformation) Transform(s string) string](#NameTransformation.Transform)
    * [type NameTransformationKind string](#NameTransformationKind)
    * [type NameTransformationOptions struct](#NameTransformationOptions)
    * [type NameTransformations []reposource.NameTransformation](#NameTransformations)
        * [func CompileGitLabNameTransformations(ts []*schema.GitLabNameTransformation) (NameTransformations, error)](#CompileGitLabNameTransformations)
        * [func (nts NameTransformations) Transform(s string) string](#NameTransformations.Transform)
    * [type Other struct](#Other)
        * [func (c Other) CloneURLToRepoName(cloneURL string) (api.RepoName, error)](#Other.CloneURLToRepoName)
        * [func (c Other) CloneURLToRepoURI(cloneURL string) (string, error)](#Other.CloneURLToRepoURI)
    * [type RepoSource interface](#RepoSource)
    * [type cloneURLResolver struct](#cloneURLResolver)
    * [type urlToRepoName struct](#urlToRepoName)
    * [type urlToRepoNameErr struct](#urlToRepoNameErr)
* [Functions](#func)
    * [func AWSRepoName(repositoryPathPattern, name string) api.RepoName](#AWSRepoName)
    * [func BitbucketCloudRepoName(repositoryPathPattern, host, nameWithOwner string) api.RepoName](#BitbucketCloudRepoName)
    * [func BitbucketServerRepoName(repositoryPathPattern, host, projectKey, repoSlug string) api.RepoName](#BitbucketServerRepoName)
    * [func CustomCloneURLToRepoName(cloneURL string) (repoName api.RepoName)](#CustomCloneURLToRepoName)
    * [func GitHubRepoName(repositoryPathPattern, host, nameWithOwner string) api.RepoName](#GitHubRepoName)
    * [func GitLabRepoName(repositoryPathPattern, host, pathWithNamespace string, nts NameTransformations) api.RepoName](#GitLabRepoName)
    * [func GitoliteRepoName(prefix, gitoliteName string) api.RepoName](#GitoliteRepoName)
    * [func OtherRepoName(repositoryPathPattern, base, relativeRepoPath string) string](#OtherRepoName)
    * [func PerforceRepoName(repositoryPathPattern, depot string) api.RepoName](#PerforceRepoName)
    * [func TestAWS_cloneURLToRepoName(t *testing.T)](#TestAWS_cloneURLToRepoName)
    * [func TestBitbucketCloud_cloneURLToRepoName(t *testing.T)](#TestBitbucketCloud_cloneURLToRepoName)
    * [func TestBitbucketServer_cloneURLToRepoName(t *testing.T)](#TestBitbucketServer_cloneURLToRepoName)
    * [func TestCustomCloneURLToRepoName(t *testing.T)](#TestCustomCloneURLToRepoName)
    * [func TestGitHub_cloneURLToRepoName(t *testing.T)](#TestGitHub_cloneURLToRepoName)
    * [func TestGitLab_cloneURLToRepoName(t *testing.T)](#TestGitLab_cloneURLToRepoName)
    * [func TestGitolite_cloneURLToRepoName(t *testing.T)](#TestGitolite_cloneURLToRepoName)
    * [func TestNameTransformations(t *testing.T)](#TestNameTransformations)
    * [func TestOtherCloneURLToRepoName(t *testing.T)](#TestOtherCloneURLToRepoName)
    * [func TestParseCloneURL(t *testing.T)](#TestParseCloneURL)
    * [func cloneURLToRepoName(cloneURL, baseURL, repositoryPathPattern string) (string, error)](#cloneURLToRepoName)
    * [func hostname(url *url.URL) string](#hostname)
    * [func init()](#init.custom.go)
    * [func mapString(r *regexp.Regexp, in string, outTmpl string) string](#mapString)
    * [func parseCloneURL(cloneURL string) (*url.URL, error)](#parseCloneURL)
    * [func parseURLs(cloneURL, baseURL string) (parsedCloneURL, parsedBaseURL *url.URL, equalHosts bool, err error)](#parseURLs)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="DefaultRepositoryPathPattern" href="#DefaultRepositoryPathPattern">const DefaultRepositoryPathPattern</a>

```
searchKey: reposource.DefaultRepositoryPathPattern
tags: [constant string]
```

```Go
const DefaultRepositoryPathPattern = "{base}/{repo}"
```

### <a id="NameTransformationRegex" href="#NameTransformationRegex">const NameTransformationRegex</a>

```
searchKey: reposource.NameTransformationRegex
tags: [constant string]
```

```Go
const NameTransformationRegex NameTransformationKind = "regex"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="cloneURLResolvers" href="#cloneURLResolvers">var cloneURLResolvers</a>

```
searchKey: reposource.cloneURLResolvers
tags: [variable function private]
```

```Go
var cloneURLResolvers = ...
```

cloneURLResolvers is the list of clone-URL-to-repo-URI mappings, derived from the site config 

### <a id="nonSCPURLRegex" href="#nonSCPURLRegex">var nonSCPURLRegex</a>

```
searchKey: reposource.nonSCPURLRegex
tags: [variable struct private]
```

```Go
var nonSCPURLRegex = lazyregexp.New(`^(git\+)?(https?|ssh|rsync|file|git)://`)
```

### <a id="otherRepoNameReplacer" href="#otherRepoNameReplacer">var otherRepoNameReplacer</a>

```
searchKey: reposource.otherRepoNameReplacer
tags: [variable struct private]
```

```Go
var otherRepoNameReplacer = strings.NewReplacer(":", "-", "@", "-", "//", "")
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="AWS" href="#AWS">type AWS struct</a>

```
searchKey: reposource.AWS
tags: [struct]
```

```Go
type AWS struct {
	*schema.AWSCodeCommitConnection
}
```

#### <a id="AWS.CloneURLToRepoName" href="#AWS.CloneURLToRepoName">func (c AWS) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)</a>

```
searchKey: reposource.AWS.CloneURLToRepoName
tags: [method]
```

```Go
func (c AWS) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)
```

### <a id="BitbucketCloud" href="#BitbucketCloud">type BitbucketCloud struct</a>

```
searchKey: reposource.BitbucketCloud
tags: [struct]
```

```Go
type BitbucketCloud struct {
	*schema.BitbucketCloudConnection
}
```

#### <a id="BitbucketCloud.CloneURLToRepoName" href="#BitbucketCloud.CloneURLToRepoName">func (c BitbucketCloud) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)</a>

```
searchKey: reposource.BitbucketCloud.CloneURLToRepoName
tags: [method]
```

```Go
func (c BitbucketCloud) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)
```

### <a id="BitbucketServer" href="#BitbucketServer">type BitbucketServer struct</a>

```
searchKey: reposource.BitbucketServer
tags: [struct]
```

```Go
type BitbucketServer struct {
	*schema.BitbucketServerConnection
}
```

#### <a id="BitbucketServer.CloneURLToRepoName" href="#BitbucketServer.CloneURLToRepoName">func (c BitbucketServer) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)</a>

```
searchKey: reposource.BitbucketServer.CloneURLToRepoName
tags: [method]
```

```Go
func (c BitbucketServer) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)
```

### <a id="GitHub" href="#GitHub">type GitHub struct</a>

```
searchKey: reposource.GitHub
tags: [struct]
```

```Go
type GitHub struct {
	*schema.GitHubConnection
}
```

#### <a id="GitHub.CloneURLToRepoName" href="#GitHub.CloneURLToRepoName">func (c GitHub) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)</a>

```
searchKey: reposource.GitHub.CloneURLToRepoName
tags: [method]
```

```Go
func (c GitHub) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)
```

### <a id="GitLab" href="#GitLab">type GitLab struct</a>

```
searchKey: reposource.GitLab
tags: [struct]
```

```Go
type GitLab struct {
	*schema.GitLabConnection
}
```

#### <a id="GitLab.CloneURLToRepoName" href="#GitLab.CloneURLToRepoName">func (c GitLab) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)</a>

```
searchKey: reposource.GitLab.CloneURLToRepoName
tags: [method]
```

```Go
func (c GitLab) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)
```

### <a id="Gitolite" href="#Gitolite">type Gitolite struct</a>

```
searchKey: reposource.Gitolite
tags: [struct]
```

```Go
type Gitolite struct {
	*schema.GitoliteConnection
}
```

#### <a id="Gitolite.CloneURLToRepoName" href="#Gitolite.CloneURLToRepoName">func (c Gitolite) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)</a>

```
searchKey: reposource.Gitolite.CloneURLToRepoName
tags: [method]
```

```Go
func (c Gitolite) CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)
```

### <a id="NameTransformation" href="#NameTransformation">type NameTransformation struct</a>

```
searchKey: reposource.NameTransformation
tags: [struct]
```

```Go
type NameTransformation struct {
	kind NameTransformationKind

	// Fields for regex replacement transformation.
	regexp      *regexp.Regexp
	replacement string
}
```

NameTransformation describes the rule to transform a repository name. 

#### <a id="NewNameTransformation" href="#NewNameTransformation">func NewNameTransformation(opts NameTransformationOptions) (NameTransformation, error)</a>

```
searchKey: reposource.NewNameTransformation
tags: [method]
```

```Go
func NewNameTransformation(opts NameTransformationOptions) (NameTransformation, error)
```

#### <a id="NameTransformation.Kind" href="#NameTransformation.Kind">func (nt NameTransformation) Kind() NameTransformationKind</a>

```
searchKey: reposource.NameTransformation.Kind
tags: [function]
```

```Go
func (nt NameTransformation) Kind() NameTransformationKind
```

#### <a id="NameTransformation.Transform" href="#NameTransformation.Transform">func (nt NameTransformation) Transform(s string) string</a>

```
searchKey: reposource.NameTransformation.Transform
tags: [method]
```

```Go
func (nt NameTransformation) Transform(s string) string
```

Transform performs the transformation to given string. 

### <a id="NameTransformationKind" href="#NameTransformationKind">type NameTransformationKind string</a>

```
searchKey: reposource.NameTransformationKind
tags: [string]
```

```Go
type NameTransformationKind string
```

### <a id="NameTransformationOptions" href="#NameTransformationOptions">type NameTransformationOptions struct</a>

```
searchKey: reposource.NameTransformationOptions
tags: [struct]
```

```Go
type NameTransformationOptions struct {
	// Options for regex replacement transformation.
	Regex       string
	Replacement string
}
```

### <a id="NameTransformations" href="#NameTransformations">type NameTransformations []reposource.NameTransformation</a>

```
searchKey: reposource.NameTransformations
tags: [array struct]
```

```Go
type NameTransformations []NameTransformation
```

NameTransformations is a list of transformation rules. 

#### <a id="CompileGitLabNameTransformations" href="#CompileGitLabNameTransformations">func CompileGitLabNameTransformations(ts []*schema.GitLabNameTransformation) (NameTransformations, error)</a>

```
searchKey: reposource.CompileGitLabNameTransformations
tags: [method]
```

```Go
func CompileGitLabNameTransformations(ts []*schema.GitLabNameTransformation) (NameTransformations, error)
```

CompileGitLabNameTransformations compiles a list of GitLabNameTransformation into common NameTransformation, it halts and returns when any compile error occurred. 

#### <a id="NameTransformations.Transform" href="#NameTransformations.Transform">func (nts NameTransformations) Transform(s string) string</a>

```
searchKey: reposource.NameTransformations.Transform
tags: [method]
```

```Go
func (nts NameTransformations) Transform(s string) string
```

Transform iterates and performs the list of transformations. 

### <a id="Other" href="#Other">type Other struct</a>

```
searchKey: reposource.Other
tags: [struct]
```

```Go
type Other struct {
	*schema.OtherExternalServiceConnection
}
```

#### <a id="Other.CloneURLToRepoName" href="#Other.CloneURLToRepoName">func (c Other) CloneURLToRepoName(cloneURL string) (api.RepoName, error)</a>

```
searchKey: reposource.Other.CloneURLToRepoName
tags: [method]
```

```Go
func (c Other) CloneURLToRepoName(cloneURL string) (api.RepoName, error)
```

#### <a id="Other.CloneURLToRepoURI" href="#Other.CloneURLToRepoURI">func (c Other) CloneURLToRepoURI(cloneURL string) (string, error)</a>

```
searchKey: reposource.Other.CloneURLToRepoURI
tags: [method]
```

```Go
func (c Other) CloneURLToRepoURI(cloneURL string) (string, error)
```

### <a id="RepoSource" href="#RepoSource">type RepoSource interface</a>

```
searchKey: reposource.RepoSource
tags: [interface]
```

```Go
type RepoSource interface {
	// cloneURLToRepoName maps a Git clone URL (format documented here:
	// https://git-scm.com/docs/git-clone#_git_urls_a_id_urls_a) to the expected repo name for the
	// repository on the code host.  It does not actually check if the repository exists in the code
	// host. It merely does the mapping based on the rules set in the code host config.
	//
	// If the clone URL does not correspond to a repository that could exist on the code host, the
	// empty string is returned and err is nil. If there is an unrelated error, an error is
	// returned.
	CloneURLToRepoName(cloneURL string) (repoName api.RepoName, err error)
}
```

RepoSource is a wrapper around a repository source (typically a code host config) that provides a method to map clone URLs to repo names using only the configuration (i.e., no network requests). 

### <a id="cloneURLResolver" href="#cloneURLResolver">type cloneURLResolver struct</a>

```
searchKey: reposource.cloneURLResolver
tags: [struct private]
```

```Go
type cloneURLResolver struct {
	from *regexp.Regexp
	to   string
}
```

### <a id="urlToRepoName" href="#urlToRepoName">type urlToRepoName struct</a>

```
searchKey: reposource.urlToRepoName
tags: [struct private]
```

```Go
type urlToRepoName struct {
	cloneURL string
	repoName string
}
```

urlToRepoName represents a cloneURL and expected corresponding repo name 

### <a id="urlToRepoNameErr" href="#urlToRepoNameErr">type urlToRepoNameErr struct</a>

```
searchKey: reposource.urlToRepoNameErr
tags: [struct private]
```

```Go
type urlToRepoNameErr struct {
	cloneURL string
	repoName string
	err      error
}
```

urlToRepoNameErr is similar to urlToRepoName, but with an expected error value 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="AWSRepoName" href="#AWSRepoName">func AWSRepoName(repositoryPathPattern, name string) api.RepoName</a>

```
searchKey: reposource.AWSRepoName
tags: [method]
```

```Go
func AWSRepoName(repositoryPathPattern, name string) api.RepoName
```

### <a id="BitbucketCloudRepoName" href="#BitbucketCloudRepoName">func BitbucketCloudRepoName(repositoryPathPattern, host, nameWithOwner string) api.RepoName</a>

```
searchKey: reposource.BitbucketCloudRepoName
tags: [method]
```

```Go
func BitbucketCloudRepoName(repositoryPathPattern, host, nameWithOwner string) api.RepoName
```

### <a id="BitbucketServerRepoName" href="#BitbucketServerRepoName">func BitbucketServerRepoName(repositoryPathPattern, host, projectKey, repoSlug string) api.RepoName</a>

```
searchKey: reposource.BitbucketServerRepoName
tags: [method]
```

```Go
func BitbucketServerRepoName(repositoryPathPattern, host, projectKey, repoSlug string) api.RepoName
```

### <a id="CustomCloneURLToRepoName" href="#CustomCloneURLToRepoName">func CustomCloneURLToRepoName(cloneURL string) (repoName api.RepoName)</a>

```
searchKey: reposource.CustomCloneURLToRepoName
tags: [method]
```

```Go
func CustomCloneURLToRepoName(cloneURL string) (repoName api.RepoName)
```

CustomCloneURLToRepoName maps from clone URL to repo name using custom mappings specified by the user in site config. An empty string return value indicates no match. 

### <a id="GitHubRepoName" href="#GitHubRepoName">func GitHubRepoName(repositoryPathPattern, host, nameWithOwner string) api.RepoName</a>

```
searchKey: reposource.GitHubRepoName
tags: [method]
```

```Go
func GitHubRepoName(repositoryPathPattern, host, nameWithOwner string) api.RepoName
```

### <a id="GitLabRepoName" href="#GitLabRepoName">func GitLabRepoName(repositoryPathPattern, host, pathWithNamespace string, nts NameTransformations) api.RepoName</a>

```
searchKey: reposource.GitLabRepoName
tags: [method]
```

```Go
func GitLabRepoName(repositoryPathPattern, host, pathWithNamespace string, nts NameTransformations) api.RepoName
```

### <a id="GitoliteRepoName" href="#GitoliteRepoName">func GitoliteRepoName(prefix, gitoliteName string) api.RepoName</a>

```
searchKey: reposource.GitoliteRepoName
tags: [method]
```

```Go
func GitoliteRepoName(prefix, gitoliteName string) api.RepoName
```

GitoliteRepoName returns the Sourcegraph name for a repository given the Gitolite prefix (defined in the Gitolite external service config) and the Gitolite repository name. This is normally just the prefix concatenated with the Gitolite name. Gitolite permits the "@" character, but Sourcegraph does not, so "@" characters are rewritten to be "-". 

### <a id="OtherRepoName" href="#OtherRepoName">func OtherRepoName(repositoryPathPattern, base, relativeRepoPath string) string</a>

```
searchKey: reposource.OtherRepoName
tags: [method]
```

```Go
func OtherRepoName(repositoryPathPattern, base, relativeRepoPath string) string
```

### <a id="PerforceRepoName" href="#PerforceRepoName">func PerforceRepoName(repositoryPathPattern, depot string) api.RepoName</a>

```
searchKey: reposource.PerforceRepoName
tags: [method]
```

```Go
func PerforceRepoName(repositoryPathPattern, depot string) api.RepoName
```

### <a id="TestAWS_cloneURLToRepoName" href="#TestAWS_cloneURLToRepoName">func TestAWS_cloneURLToRepoName(t *testing.T)</a>

```
searchKey: reposource.TestAWS_cloneURLToRepoName
tags: [method private test]
```

```Go
func TestAWS_cloneURLToRepoName(t *testing.T)
```

### <a id="TestBitbucketCloud_cloneURLToRepoName" href="#TestBitbucketCloud_cloneURLToRepoName">func TestBitbucketCloud_cloneURLToRepoName(t *testing.T)</a>

```
searchKey: reposource.TestBitbucketCloud_cloneURLToRepoName
tags: [method private test]
```

```Go
func TestBitbucketCloud_cloneURLToRepoName(t *testing.T)
```

### <a id="TestBitbucketServer_cloneURLToRepoName" href="#TestBitbucketServer_cloneURLToRepoName">func TestBitbucketServer_cloneURLToRepoName(t *testing.T)</a>

```
searchKey: reposource.TestBitbucketServer_cloneURLToRepoName
tags: [method private test]
```

```Go
func TestBitbucketServer_cloneURLToRepoName(t *testing.T)
```

### <a id="TestCustomCloneURLToRepoName" href="#TestCustomCloneURLToRepoName">func TestCustomCloneURLToRepoName(t *testing.T)</a>

```
searchKey: reposource.TestCustomCloneURLToRepoName
tags: [method private test]
```

```Go
func TestCustomCloneURLToRepoName(t *testing.T)
```

### <a id="TestGitHub_cloneURLToRepoName" href="#TestGitHub_cloneURLToRepoName">func TestGitHub_cloneURLToRepoName(t *testing.T)</a>

```
searchKey: reposource.TestGitHub_cloneURLToRepoName
tags: [method private test]
```

```Go
func TestGitHub_cloneURLToRepoName(t *testing.T)
```

### <a id="TestGitLab_cloneURLToRepoName" href="#TestGitLab_cloneURLToRepoName">func TestGitLab_cloneURLToRepoName(t *testing.T)</a>

```
searchKey: reposource.TestGitLab_cloneURLToRepoName
tags: [method private test]
```

```Go
func TestGitLab_cloneURLToRepoName(t *testing.T)
```

### <a id="TestGitolite_cloneURLToRepoName" href="#TestGitolite_cloneURLToRepoName">func TestGitolite_cloneURLToRepoName(t *testing.T)</a>

```
searchKey: reposource.TestGitolite_cloneURLToRepoName
tags: [method private test]
```

```Go
func TestGitolite_cloneURLToRepoName(t *testing.T)
```

### <a id="TestNameTransformations" href="#TestNameTransformations">func TestNameTransformations(t *testing.T)</a>

```
searchKey: reposource.TestNameTransformations
tags: [method private test]
```

```Go
func TestNameTransformations(t *testing.T)
```

### <a id="TestOtherCloneURLToRepoName" href="#TestOtherCloneURLToRepoName">func TestOtherCloneURLToRepoName(t *testing.T)</a>

```
searchKey: reposource.TestOtherCloneURLToRepoName
tags: [method private test]
```

```Go
func TestOtherCloneURLToRepoName(t *testing.T)
```

### <a id="TestParseCloneURL" href="#TestParseCloneURL">func TestParseCloneURL(t *testing.T)</a>

```
searchKey: reposource.TestParseCloneURL
tags: [method private test]
```

```Go
func TestParseCloneURL(t *testing.T)
```

### <a id="cloneURLToRepoName" href="#cloneURLToRepoName">func cloneURLToRepoName(cloneURL, baseURL, repositoryPathPattern string) (string, error)</a>

```
searchKey: reposource.cloneURLToRepoName
tags: [method private]
```

```Go
func cloneURLToRepoName(cloneURL, baseURL, repositoryPathPattern string) (string, error)
```

### <a id="hostname" href="#hostname">func hostname(url *url.URL) string</a>

```
searchKey: reposource.hostname
tags: [method private]
```

```Go
func hostname(url *url.URL) string
```

hostname returns the hostname of a URL without www. 

### <a id="init.custom.go" href="#init.custom.go">func init()</a>

```
searchKey: reposource.init
tags: [function private]
```

```Go
func init()
```

### <a id="mapString" href="#mapString">func mapString(r *regexp.Regexp, in string, outTmpl string) string</a>

```
searchKey: reposource.mapString
tags: [method private]
```

```Go
func mapString(r *regexp.Regexp, in string, outTmpl string) string
```

### <a id="parseCloneURL" href="#parseCloneURL">func parseCloneURL(cloneURL string) (*url.URL, error)</a>

```
searchKey: reposource.parseCloneURL
tags: [method private]
```

```Go
func parseCloneURL(cloneURL string) (*url.URL, error)
```

parseCloneURL parses a git clone URL into a URL struct. It supports the SCP-style git@host:path syntax that is common among code hosts. 

### <a id="parseURLs" href="#parseURLs">func parseURLs(cloneURL, baseURL string) (parsedCloneURL, parsedBaseURL *url.URL, equalHosts bool, err error)</a>

```
searchKey: reposource.parseURLs
tags: [method private]
```

```Go
func parseURLs(cloneURL, baseURL string) (parsedCloneURL, parsedBaseURL *url.URL, equalHosts bool, err error)
```

parseURLs parses the clone URL and repository host base URL into structs. It also returns a boolean indicating whether the hostnames of the URLs match. 

