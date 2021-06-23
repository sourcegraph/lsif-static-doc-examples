# Package vcs

## Index

* Subpages
  * [internal/vcs/git](vcs/git.md)
  * [internal/vcs/util](vcs/util.md)
* [Constants](#const)
    * [const usernameRe](#usernameRe)
    * [const urlRe](#urlRe)
    * [const repoRe](#repoRe)
    * [const formatStdlib](#formatStdlib)
    * [const formatRsync](#formatRsync)
    * [const formatLocal](#formatLocal)
* [Variables](#var)
    * [var schemes](#schemes)
    * [var scpSyntax](#scpSyntax)
* [Types](#type)
    * [type RepoNotExistError struct](#RepoNotExistError)
        * [func (RepoNotExistError) NotFound() bool](#RepoNotExistError.NotFound)
        * [func (e *RepoNotExistError) Error() string](#RepoNotExistError.Error)
    * [type URL struct](#URL)
        * [func ParseURL(rawurl string) (u *URL, err error)](#ParseURL)
        * [func parseScheme(rawurl string) (*URL, error)](#parseScheme)
        * [func parseScp(rawurl string) (*URL, error)](#parseScp)
        * [func parseLocal(rawurl string) (*URL, error)](#parseLocal)
        * [func (u *URL) String() string](#URL.String)
        * [func (u *URL) IsSSH() bool](#URL.IsSSH)
    * [type urlFormat int](#urlFormat)
* [Functions](#func)
    * [func IsRepoNotExist(err error) bool](#IsRepoNotExist)
    * [func IsCloneInProgress(err error) bool](#IsCloneInProgress)
    * [func TestParseURL(t *testing.T)](#TestParseURL)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="usernameRe" href="#usernameRe">const usernameRe</a>

```
searchKey: vcs.usernameRe
tags: [private]
```

```Go
const usernameRe = "([a-zA-Z0-9-._~]+@)"
```

usernameRe is the regexp for the username part in a repo URL. Eg: sourcegraph@ 

### <a id="urlRe" href="#urlRe">const urlRe</a>

```
searchKey: vcs.urlRe
tags: [private]
```

```Go
const urlRe = "([a-zA-Z0-9._-]+)"
```

urlRe is the regexp for the url part in a repo URL. Eg: github.com 

### <a id="repoRe" href="#repoRe">const repoRe</a>

```
searchKey: vcs.repoRe
tags: [private]
```

```Go
const repoRe = `([a-zA-Z0-9\@./._-]+)(?:\?||$)(.*)`
```

repoRe is the regexp for the repo in a repo URL. Eg: sourcegraph/sourcegraph 

### <a id="formatStdlib" href="#formatStdlib">const formatStdlib</a>

```
searchKey: vcs.formatStdlib
tags: [private]
```

```Go
const formatStdlib urlFormat = iota
```

### <a id="formatRsync" href="#formatRsync">const formatRsync</a>

```
searchKey: vcs.formatRsync
tags: [private]
```

```Go
const formatRsync
```

### <a id="formatLocal" href="#formatLocal">const formatLocal</a>

```
searchKey: vcs.formatLocal
tags: [private]
```

```Go
const formatLocal
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="schemes" href="#schemes">var schemes</a>

```
searchKey: vcs.schemes
tags: [private]
```

```Go
var schemes = ...
```

### <a id="scpSyntax" href="#scpSyntax">var scpSyntax</a>

```
searchKey: vcs.scpSyntax
tags: [private]
```

```Go
var scpSyntax = regexp.MustCompile(fmt.Sprintf(`^%s?%s:%s$`, usernameRe, urlRe, repoRe))
```

scpSyntax was modified from [https://golang.org/src/cmd/go/vcs.go](https://golang.org/src/cmd/go/vcs.go). 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="RepoNotExistError" href="#RepoNotExistError">type RepoNotExistError struct</a>

```
searchKey: vcs.RepoNotExistError
```

```Go
type RepoNotExistError struct {
	Repo api.RepoName

	// CloneInProgress reports whether the repository is in process of being cloned.
	CloneInProgress bool

	// CloneProgress is a progress message from the running clone command.
	CloneProgress string
}
```

RepoNotExistError is an error that reports a repository doesn't exist. 

#### <a id="RepoNotExistError.NotFound" href="#RepoNotExistError.NotFound">func (RepoNotExistError) NotFound() bool</a>

```
searchKey: vcs.RepoNotExistError.NotFound
```

```Go
func (RepoNotExistError) NotFound() bool
```

#### <a id="RepoNotExistError.Error" href="#RepoNotExistError.Error">func (e *RepoNotExistError) Error() string</a>

```
searchKey: vcs.RepoNotExistError.Error
```

```Go
func (e *RepoNotExistError) Error() string
```

### <a id="URL" href="#URL">type URL struct</a>

```
searchKey: vcs.URL
```

```Go
type URL struct {
	url.URL

	format urlFormat
}
```

URL wraps url.URL to provide rsync format compatible `String()` functionality. eg git@foo.com:foo/bar.git stdlib URL.String() would marshal those URLs with a leading slash in the path, which for standard git hosts changes path semantics. This function will only use stdlib URL.String() if a scheme is specified, otherwise it uses a custom format built for compatibility 

#### <a id="ParseURL" href="#ParseURL">func ParseURL(rawurl string) (u *URL, err error)</a>

```
searchKey: vcs.ParseURL
```

```Go
func ParseURL(rawurl string) (u *URL, err error)
```

ParseURL parses rawurl into a URL structure. Parse first attempts to find a standard URL with a valid VCS URL scheme. If that cannot be found, it then attempts to find a SCP-like URL. And if that cannot be found, it assumes rawurl is a local path. If none of these rules apply, Parse returns an error. 

Code copied and modified from github.com/whilp/git-urls to support perforce scheme. 

#### <a id="parseScheme" href="#parseScheme">func parseScheme(rawurl string) (*URL, error)</a>

```
searchKey: vcs.parseScheme
tags: [private]
```

```Go
func parseScheme(rawurl string) (*URL, error)
```

#### <a id="parseScp" href="#parseScp">func parseScp(rawurl string) (*URL, error)</a>

```
searchKey: vcs.parseScp
tags: [private]
```

```Go
func parseScp(rawurl string) (*URL, error)
```

parseScp parses rawurl into a URL object. The rawurl must be an SCP-like URL, otherwise ParseScp returns an error. 

#### <a id="parseLocal" href="#parseLocal">func parseLocal(rawurl string) (*URL, error)</a>

```
searchKey: vcs.parseLocal
tags: [private]
```

```Go
func parseLocal(rawurl string) (*URL, error)
```

parseLocal parses rawurl into a URL object with a "file" scheme. This will effectively never return an error. 

#### <a id="URL.String" href="#URL.String">func (u *URL) String() string</a>

```
searchKey: vcs.URL.String
```

```Go
func (u *URL) String() string
```

String will return standard url.URL.String() if the url has a .Scheme set, but if not it will produce an rsync format URL, eg `git@foo.com:foo/bar.git` 

#### <a id="URL.IsSSH" href="#URL.IsSSH">func (u *URL) IsSSH() bool</a>

```
searchKey: vcs.URL.IsSSH
```

```Go
func (u *URL) IsSSH() bool
```

IsSSH returns whether this URL is SSH based, which for vcs.URL means if the scheme is either empty or `ssh`, this is because of rsync format urls being cloned over SSH, but not including a scheme. 

### <a id="urlFormat" href="#urlFormat">type urlFormat int</a>

```
searchKey: vcs.urlFormat
tags: [private]
```

```Go
type urlFormat int
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="IsRepoNotExist" href="#IsRepoNotExist">func IsRepoNotExist(err error) bool</a>

```
searchKey: vcs.IsRepoNotExist
```

```Go
func IsRepoNotExist(err error) bool
```

IsRepoNotExist reports if err is a RepoNotExistError. 

### <a id="IsCloneInProgress" href="#IsCloneInProgress">func IsCloneInProgress(err error) bool</a>

```
searchKey: vcs.IsCloneInProgress
```

```Go
func IsCloneInProgress(err error) bool
```

IsCloneInProgress reports if err is a RepoNotExistError which has a clone in progress. 

### <a id="TestParseURL" href="#TestParseURL">func TestParseURL(t *testing.T)</a>

```
searchKey: vcs.TestParseURL
tags: [private]
```

```Go
func TestParseURL(t *testing.T)
```

