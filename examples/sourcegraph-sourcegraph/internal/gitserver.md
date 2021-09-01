# Package gitserver

## Index

* Subpages
  * [internal/gitserver/protocol](gitserver/protocol.md)
* [Variables](#var)
    * [var DefaultClient](#DefaultClient)
    * [var DefaultReverseProxy](#DefaultReverseProxy)
    * [var MockIsRepoCloneable](#MockIsRepoCloneable)
    * [var deadlineExceededCounter](#deadlineExceededCounter)
    * [var defaultTransport](#defaultTransport)
    * [var requestMeter](#requestMeter)
* [Types](#type)
    * [type ArchiveOptions struct](#ArchiveOptions)
    * [type Client struct](#Client)
        * [func NewClient(cli httpcli.Doer) *Client](#NewClient)
        * [func (c *Client) AddrForRepo(repo api.RepoName) string](#Client.AddrForRepo)
        * [func (c *Client) Archive(ctx context.Context, repo api.RepoName, opt ArchiveOptions) (_ io.ReadCloser, err error)](#Client.Archive)
        * [func (c *Client) ArchiveURL(repo api.RepoName, opt ArchiveOptions) *url.URL](#Client.ArchiveURL)
        * [func (c *Client) Command(name string, arg ...string) *Cmd](#Client.Command)
        * [func (c *Client) CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)](#Client.CreateCommitFromPatch)
        * [func (c *Client) GetGitolitePhabricatorMetadata(ctx context.Context, gitoliteHost string, repoName api.RepoName) (*protocol.GitolitePhabricatorMetadataResponse, error)](#Client.GetGitolitePhabricatorMetadata)
        * [func (c *Client) IsRepoCloneable(ctx context.Context, repo api.RepoName) error](#Client.IsRepoCloneable)
        * [func (c *Client) IsRepoCloned(ctx context.Context, repo api.RepoName) (bool, error)](#Client.IsRepoCloned)
        * [func (c *Client) ListCloned(ctx context.Context) ([]string, error)](#Client.ListCloned)
        * [func (c *Client) ListGitolite(ctx context.Context, gitoliteHost string) (list []*gitolite.Repo, err error)](#Client.ListGitolite)
        * [func (c *Client) P4Exec(ctx context.Context, host, user, password string, args ...string) (_ io.ReadCloser, _ http.Header, errRes error)](#Client.P4Exec)
        * [func (c *Client) Remove(ctx context.Context, repo api.RepoName) error](#Client.Remove)
        * [func (c *Client) RepoCloneProgress(ctx context.Context, repos ...api.RepoName) (*protocol.RepoCloneProgressResponse, error)](#Client.RepoCloneProgress)
        * [func (c *Client) RepoInfo(ctx context.Context, repos ...api.RepoName) (*protocol.RepoInfoResponse, error)](#Client.RepoInfo)
        * [func (c *Client) ReposStats(ctx context.Context) (map[string]*protocol.ReposStats, error)](#Client.ReposStats)
        * [func (c *Client) RequestRepoUpdate(ctx context.Context, repo api.RepoName, since time.Duration) (*protocol.RepoUpdateResponse, error)](#Client.RequestRepoUpdate)
        * [func (c *Client) WaitForGitServers(ctx context.Context) error](#Client.WaitForGitServers)
        * [func (c *Client) addrForKey(key string) string](#Client.addrForKey)
        * [func (c *Client) do(ctx context.Context, repo api.RepoName, method, op string, payload interface{}) (resp *http.Response, err error)](#Client.do)
        * [func (c *Client) doListOne(ctx context.Context, urlSuffix, addr string) ([]string, error)](#Client.doListOne)
        * [func (c *Client) doReposStats(ctx context.Context, addr string) (*protocol.ReposStats, error)](#Client.doReposStats)
        * [func (c *Client) httpPost(ctx context.Context, repo api.RepoName, op string, payload interface{}) (resp *http.Response, err error)](#Client.httpPost)
        * [func (c *Client) ping(ctx context.Context, addr string) error](#Client.ping)
        * [func (c *Client) pingAll(ctx context.Context) []error](#Client.pingAll)
    * [type Cmd struct](#Cmd)
        * [func (c *Cmd) CombinedOutput(ctx context.Context) ([]byte, error)](#Cmd.CombinedOutput)
        * [func (c *Cmd) DividedOutput(ctx context.Context) ([]byte, []byte, error)](#Cmd.DividedOutput)
        * [func (c *Cmd) Output(ctx context.Context) ([]byte, error)](#Cmd.Output)
        * [func (c *Cmd) Run(ctx context.Context) error](#Cmd.Run)
        * [func (c *Cmd) String() string](#Cmd.String)
        * [func (c *Cmd) sendExec(ctx context.Context) (_ io.ReadCloser, _ http.Header, errRes error)](#Cmd.sendExec)
    * [type RepoNotCloneableErr struct](#RepoNotCloneableErr)
        * [func (e *RepoNotCloneableErr) Error() string](#RepoNotCloneableErr.Error)
        * [func (e *RepoNotCloneableErr) NotFound() bool](#RepoNotCloneableErr.NotFound)
    * [type ReverseProxy struct](#ReverseProxy)
        * [func NewReverseProxy(transport http.RoundTripper, httpLimiter *parallel.Run) *ReverseProxy](#NewReverseProxy)
        * [func (p *ReverseProxy) ServeHTTP(repo api.RepoName, method, op string, director func(req *http.Request), res http.ResponseWriter, req *http.Request)](#ReverseProxy.ServeHTTP)
    * [type RevisionNotFoundError struct](#RevisionNotFoundError)
        * [func (e *RevisionNotFoundError) Error() string](#RevisionNotFoundError.Error)
        * [func (e *RevisionNotFoundError) HTTPStatusCode() int](#RevisionNotFoundError.HTTPStatusCode)
        * [func (RevisionNotFoundError) NotFound() bool](#RevisionNotFoundError.NotFound)
    * [type archiveReader struct](#archiveReader)
        * [func (a *archiveReader) Close() error](#archiveReader.Close)
        * [func (a *archiveReader) Read(p []byte) (int, error)](#archiveReader.Read)
    * [type badRequestError struct](#badRequestError)
        * [func (e badRequestError) BadRequest() bool](#badRequestError.BadRequest)
    * [type cmdReader struct](#cmdReader)
        * [func (c *cmdReader) Close() error](#cmdReader.Close)
        * [func (c *cmdReader) Read(p []byte) (int, error)](#cmdReader.Read)
* [Functions](#func)
    * [func AddrForRepo(repo api.RepoName, addrs []string) string](#AddrForRepo)
    * [func IsRevisionNotFound(err error) bool](#IsRevisionNotFound)
    * [func StdoutReader(ctx context.Context, c *Cmd) (io.ReadCloser, error)](#StdoutReader)
    * [func addrForKey(key string, addrs []string) string](#addrForKey)
    * [func userFromContext(ctx context.Context) string](#userFromContext)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="DefaultClient" href="#DefaultClient">var DefaultClient</a>

```
searchKey: gitserver.DefaultClient
tags: [variable struct]
```

```Go
var DefaultClient = NewClient(&http.Client{Transport: defaultTransport})
```

DefaultClient is the default Client. Unless overwritten it is connected to servers specified by SRC_GIT_SERVERS. 

### <a id="DefaultReverseProxy" href="#DefaultReverseProxy">var DefaultReverseProxy</a>

```
searchKey: gitserver.DefaultReverseProxy
tags: [variable struct]
```

```Go
var DefaultReverseProxy = NewReverseProxy(defaultTransport, DefaultClient.HTTPLimiter)
```

DefaultReverseProxy is the default ReverseProxy. It uses the same transport and HTTP limiter as the default client. 

### <a id="MockIsRepoCloneable" href="#MockIsRepoCloneable">var MockIsRepoCloneable</a>

```
searchKey: gitserver.MockIsRepoCloneable
tags: [variable function]
```

```Go
var MockIsRepoCloneable func(api.RepoName) error
```

MockIsRepoCloneable mocks (*Client).IsRepoCloneable for tests. 

### <a id="deadlineExceededCounter" href="#deadlineExceededCounter">var deadlineExceededCounter</a>

```
searchKey: gitserver.deadlineExceededCounter
tags: [variable interface private]
```

```Go
var deadlineExceededCounter = ...
```

### <a id="defaultTransport" href="#defaultTransport">var defaultTransport</a>

```
searchKey: gitserver.defaultTransport
tags: [variable struct private]
```

```Go
var defaultTransport = ...
```

defaultTransport is the default transport used in the default client and the default reverse proxy. ot.Transport will propagate opentracing spans. 

### <a id="requestMeter" href="#requestMeter">var requestMeter</a>

```
searchKey: gitserver.requestMeter
tags: [variable struct private]
```

```Go
var requestMeter = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ArchiveOptions" href="#ArchiveOptions">type ArchiveOptions struct</a>

```
searchKey: gitserver.ArchiveOptions
tags: [struct]
```

```Go
type ArchiveOptions struct {
	Treeish string   // the tree or commit to produce an archive for
	Format  string   // format of the resulting archive (usually "tar" or "zip")
	Paths   []string // if nonempty, only include these paths
}
```

ArchiveOptions contains options for the Archive func. 

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: gitserver.Client
tags: [struct]
```

```Go
type Client struct {
	// HTTP client to use
	HTTPClient httpcli.Doer

	// Limits concurrency of outstanding HTTP posts
	HTTPLimiter *parallel.Run

	// Addrs is a function which should return the addresses for gitservers. It
	// is called each time a request is made. The function must be safe for
	// concurrent use. It may return different results at different times.
	Addrs func() []string

	// UserAgent is a string identifying who the client is. It will be logged in
	// the telemetry in gitserver.
	UserAgent string
}
```

Client is a gitserver client. 

#### <a id="NewClient" href="#NewClient">func NewClient(cli httpcli.Doer) *Client</a>

```
searchKey: gitserver.NewClient
tags: [function]
```

```Go
func NewClient(cli httpcli.Doer) *Client
```

NewClient returns a new gitserver.Client instantiated with default arguments and httpcli.Doer. 

#### <a id="Client.AddrForRepo" href="#Client.AddrForRepo">func (c *Client) AddrForRepo(repo api.RepoName) string</a>

```
searchKey: gitserver.Client.AddrForRepo
tags: [method]
```

```Go
func (c *Client) AddrForRepo(repo api.RepoName) string
```

AddrForRepo returns the gitserver address to use for the given repo name. 

#### <a id="Client.Archive" href="#Client.Archive">func (c *Client) Archive(ctx context.Context, repo api.RepoName, opt ArchiveOptions) (_ io.ReadCloser, err error)</a>

```
searchKey: gitserver.Client.Archive
tags: [method]
```

```Go
func (c *Client) Archive(ctx context.Context, repo api.RepoName, opt ArchiveOptions) (_ io.ReadCloser, err error)
```

Archive produces an archive from a Git repository. 

#### <a id="Client.ArchiveURL" href="#Client.ArchiveURL">func (c *Client) ArchiveURL(repo api.RepoName, opt ArchiveOptions) *url.URL</a>

```
searchKey: gitserver.Client.ArchiveURL
tags: [method]
```

```Go
func (c *Client) ArchiveURL(repo api.RepoName, opt ArchiveOptions) *url.URL
```

ArchiveURL returns a URL from which an archive of the given Git repository can be downloaded from. 

#### <a id="Client.Command" href="#Client.Command">func (c *Client) Command(name string, arg ...string) *Cmd</a>

```
searchKey: gitserver.Client.Command
tags: [method]
```

```Go
func (c *Client) Command(name string, arg ...string) *Cmd
```

Command creates a new Cmd. Command name must be 'git', otherwise it panics. 

#### <a id="Client.CreateCommitFromPatch" href="#Client.CreateCommitFromPatch">func (c *Client) CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)</a>

```
searchKey: gitserver.Client.CreateCommitFromPatch
tags: [method]
```

```Go
func (c *Client) CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)
```

CreateCommitFromPatch will attempt to create a commit from a patch If possible, the error returned will be of type protocol.CreateCommitFromPatchError 

#### <a id="Client.GetGitolitePhabricatorMetadata" href="#Client.GetGitolitePhabricatorMetadata">func (c *Client) GetGitolitePhabricatorMetadata(ctx context.Context, gitoliteHost string, repoName api.RepoName) (*protocol.GitolitePhabricatorMetadataResponse, error)</a>

```
searchKey: gitserver.Client.GetGitolitePhabricatorMetadata
tags: [method]
```

```Go
func (c *Client) GetGitolitePhabricatorMetadata(ctx context.Context, gitoliteHost string, repoName api.RepoName) (*protocol.GitolitePhabricatorMetadataResponse, error)
```

GetGitolitePhabricatorMetadata returns Phabricator metadata for a Gitolite repository fetched via a user-provided command. 

#### <a id="Client.IsRepoCloneable" href="#Client.IsRepoCloneable">func (c *Client) IsRepoCloneable(ctx context.Context, repo api.RepoName) error</a>

```
searchKey: gitserver.Client.IsRepoCloneable
tags: [method]
```

```Go
func (c *Client) IsRepoCloneable(ctx context.Context, repo api.RepoName) error
```

IsRepoCloneable returns nil if the repository is cloneable. 

#### <a id="Client.IsRepoCloned" href="#Client.IsRepoCloned">func (c *Client) IsRepoCloned(ctx context.Context, repo api.RepoName) (bool, error)</a>

```
searchKey: gitserver.Client.IsRepoCloned
tags: [method]
```

```Go
func (c *Client) IsRepoCloned(ctx context.Context, repo api.RepoName) (bool, error)
```

#### <a id="Client.ListCloned" href="#Client.ListCloned">func (c *Client) ListCloned(ctx context.Context) ([]string, error)</a>

```
searchKey: gitserver.Client.ListCloned
tags: [method]
```

```Go
func (c *Client) ListCloned(ctx context.Context) ([]string, error)
```

ListCloned lists all cloned repositories 

#### <a id="Client.ListGitolite" href="#Client.ListGitolite">func (c *Client) ListGitolite(ctx context.Context, gitoliteHost string) (list []*gitolite.Repo, err error)</a>

```
searchKey: gitserver.Client.ListGitolite
tags: [method]
```

```Go
func (c *Client) ListGitolite(ctx context.Context, gitoliteHost string) (list []*gitolite.Repo, err error)
```

ListGitolite lists Gitolite repositories. 

#### <a id="Client.P4Exec" href="#Client.P4Exec">func (c *Client) P4Exec(ctx context.Context, host, user, password string, args ...string) (_ io.ReadCloser, _ http.Header, errRes error)</a>

```
searchKey: gitserver.Client.P4Exec
tags: [method]
```

```Go
func (c *Client) P4Exec(ctx context.Context, host, user, password string, args ...string) (_ io.ReadCloser, _ http.Header, errRes error)
```

P4Exec sends a p4 command with given arguments and returns an io.ReadCloser for the output. 

#### <a id="Client.Remove" href="#Client.Remove">func (c *Client) Remove(ctx context.Context, repo api.RepoName) error</a>

```
searchKey: gitserver.Client.Remove
tags: [method]
```

```Go
func (c *Client) Remove(ctx context.Context, repo api.RepoName) error
```

Remove removes the repository clone from gitserver. 

#### <a id="Client.RepoCloneProgress" href="#Client.RepoCloneProgress">func (c *Client) RepoCloneProgress(ctx context.Context, repos ...api.RepoName) (*protocol.RepoCloneProgressResponse, error)</a>

```
searchKey: gitserver.Client.RepoCloneProgress
tags: [method]
```

```Go
func (c *Client) RepoCloneProgress(ctx context.Context, repos ...api.RepoName) (*protocol.RepoCloneProgressResponse, error)
```

#### <a id="Client.RepoInfo" href="#Client.RepoInfo">func (c *Client) RepoInfo(ctx context.Context, repos ...api.RepoName) (*protocol.RepoInfoResponse, error)</a>

```
searchKey: gitserver.Client.RepoInfo
tags: [method]
```

```Go
func (c *Client) RepoInfo(ctx context.Context, repos ...api.RepoName) (*protocol.RepoInfoResponse, error)
```

RepoInfo retrieves information about one or more repositories on gitserver. 

The repository not existing is not an error; in that case, RepoInfoResponse.Results[i].Cloned will be false and the error will be nil. 

If multiple errors occurred, an incomplete result is returned along with a *multierror.Error. 

#### <a id="Client.ReposStats" href="#Client.ReposStats">func (c *Client) ReposStats(ctx context.Context) (map[string]*protocol.ReposStats, error)</a>

```
searchKey: gitserver.Client.ReposStats
tags: [method]
```

```Go
func (c *Client) ReposStats(ctx context.Context) (map[string]*protocol.ReposStats, error)
```

ReposStats will return a map of the ReposStats for each gitserver in a map. If we fail to fetch a stat from a gitserver, it won't be in the returned map and will be appended to the error. If no errors occur err will be nil. 

Note: If the statistics for a gitserver have not been computed, the UpdatedAt field will be zero. This can happen for new gitservers. 

#### <a id="Client.RequestRepoUpdate" href="#Client.RequestRepoUpdate">func (c *Client) RequestRepoUpdate(ctx context.Context, repo api.RepoName, since time.Duration) (*protocol.RepoUpdateResponse, error)</a>

```
searchKey: gitserver.Client.RequestRepoUpdate
tags: [method]
```

```Go
func (c *Client) RequestRepoUpdate(ctx context.Context, repo api.RepoName, since time.Duration) (*protocol.RepoUpdateResponse, error)
```

RequestRepoUpdate is the new protocol endpoint for synchronous requests with more detailed responses. Do not use this if you are not repo-updater. 

Repo updates are not guaranteed to occur. If a repo has been updated recently (within the Since duration specified in the request), the update won't happen. 

#### <a id="Client.WaitForGitServers" href="#Client.WaitForGitServers">func (c *Client) WaitForGitServers(ctx context.Context) error</a>

```
searchKey: gitserver.Client.WaitForGitServers
tags: [method]
```

```Go
func (c *Client) WaitForGitServers(ctx context.Context) error
```

WaitForGitServers retries a noop request to all gitserver instances until getting back a successful response. 

#### <a id="Client.addrForKey" href="#Client.addrForKey">func (c *Client) addrForKey(key string) string</a>

```
searchKey: gitserver.Client.addrForKey
tags: [method private]
```

```Go
func (c *Client) addrForKey(key string) string
```

addrForKey returns the gitserver address to use for the given string key, which is hashed for sharding purposes. 

#### <a id="Client.do" href="#Client.do">func (c *Client) do(ctx context.Context, repo api.RepoName, method, op string, payload interface{}) (resp *http.Response, err error)</a>

```
searchKey: gitserver.Client.do
tags: [method private]
```

```Go
func (c *Client) do(ctx context.Context, repo api.RepoName, method, op string, payload interface{}) (resp *http.Response, err error)
```

do performs a request to a gitserver, sharding based on the given repo name (the repo name is otherwise not used). 

#### <a id="Client.doListOne" href="#Client.doListOne">func (c *Client) doListOne(ctx context.Context, urlSuffix, addr string) ([]string, error)</a>

```
searchKey: gitserver.Client.doListOne
tags: [method private]
```

```Go
func (c *Client) doListOne(ctx context.Context, urlSuffix, addr string) ([]string, error)
```

#### <a id="Client.doReposStats" href="#Client.doReposStats">func (c *Client) doReposStats(ctx context.Context, addr string) (*protocol.ReposStats, error)</a>

```
searchKey: gitserver.Client.doReposStats
tags: [method private]
```

```Go
func (c *Client) doReposStats(ctx context.Context, addr string) (*protocol.ReposStats, error)
```

#### <a id="Client.httpPost" href="#Client.httpPost">func (c *Client) httpPost(ctx context.Context, repo api.RepoName, op string, payload interface{}) (resp *http.Response, err error)</a>

```
searchKey: gitserver.Client.httpPost
tags: [method private]
```

```Go
func (c *Client) httpPost(ctx context.Context, repo api.RepoName, op string, payload interface{}) (resp *http.Response, err error)
```

#### <a id="Client.ping" href="#Client.ping">func (c *Client) ping(ctx context.Context, addr string) error</a>

```
searchKey: gitserver.Client.ping
tags: [method private]
```

```Go
func (c *Client) ping(ctx context.Context, addr string) error
```

#### <a id="Client.pingAll" href="#Client.pingAll">func (c *Client) pingAll(ctx context.Context) []error</a>

```
searchKey: gitserver.Client.pingAll
tags: [method private]
```

```Go
func (c *Client) pingAll(ctx context.Context) []error
```

### <a id="Cmd" href="#Cmd">type Cmd struct</a>

```
searchKey: gitserver.Cmd
tags: [struct]
```

```Go
type Cmd struct {
	client *Client

	Args           []string
	Repo           api.RepoName // the repository to execute the command in
	EnsureRevision string
	ExitStatus     int
}
```

Cmd represents a command to be executed remotely. 

#### <a id="Cmd.CombinedOutput" href="#Cmd.CombinedOutput">func (c *Cmd) CombinedOutput(ctx context.Context) ([]byte, error)</a>

```
searchKey: gitserver.Cmd.CombinedOutput
tags: [method]
```

```Go
func (c *Cmd) CombinedOutput(ctx context.Context) ([]byte, error)
```

CombinedOutput runs the command and returns its combined standard output and standard error. 

#### <a id="Cmd.DividedOutput" href="#Cmd.DividedOutput">func (c *Cmd) DividedOutput(ctx context.Context) ([]byte, []byte, error)</a>

```
searchKey: gitserver.Cmd.DividedOutput
tags: [method]
```

```Go
func (c *Cmd) DividedOutput(ctx context.Context) ([]byte, []byte, error)
```

DividedOutput runs the command and returns its standard output and standard error. 

#### <a id="Cmd.Output" href="#Cmd.Output">func (c *Cmd) Output(ctx context.Context) ([]byte, error)</a>

```
searchKey: gitserver.Cmd.Output
tags: [method]
```

```Go
func (c *Cmd) Output(ctx context.Context) ([]byte, error)
```

Output runs the command and returns its standard output. 

#### <a id="Cmd.Run" href="#Cmd.Run">func (c *Cmd) Run(ctx context.Context) error</a>

```
searchKey: gitserver.Cmd.Run
tags: [method]
```

```Go
func (c *Cmd) Run(ctx context.Context) error
```

Run starts the specified command and waits for it to complete. 

#### <a id="Cmd.String" href="#Cmd.String">func (c *Cmd) String() string</a>

```
searchKey: gitserver.Cmd.String
tags: [method]
```

```Go
func (c *Cmd) String() string
```

#### <a id="Cmd.sendExec" href="#Cmd.sendExec">func (c *Cmd) sendExec(ctx context.Context) (_ io.ReadCloser, _ http.Header, errRes error)</a>

```
searchKey: gitserver.Cmd.sendExec
tags: [method private]
```

```Go
func (c *Cmd) sendExec(ctx context.Context) (_ io.ReadCloser, _ http.Header, errRes error)
```

### <a id="RepoNotCloneableErr" href="#RepoNotCloneableErr">type RepoNotCloneableErr struct</a>

```
searchKey: gitserver.RepoNotCloneableErr
tags: [struct]
```

```Go
type RepoNotCloneableErr struct {
	repo     api.RepoName
	reason   string
	notFound bool
}
```

RepoNotCloneableErr is the error that happens when a repository can not be cloned. 

#### <a id="RepoNotCloneableErr.Error" href="#RepoNotCloneableErr.Error">func (e *RepoNotCloneableErr) Error() string</a>

```
searchKey: gitserver.RepoNotCloneableErr.Error
tags: [method]
```

```Go
func (e *RepoNotCloneableErr) Error() string
```

#### <a id="RepoNotCloneableErr.NotFound" href="#RepoNotCloneableErr.NotFound">func (e *RepoNotCloneableErr) NotFound() bool</a>

```
searchKey: gitserver.RepoNotCloneableErr.NotFound
tags: [method]
```

```Go
func (e *RepoNotCloneableErr) NotFound() bool
```

NotFound returns true if the repo could not be cloned because it wasn't found. This may be because the repo doesn't exist, or because the repo is private and there are insufficient permissions. 

### <a id="ReverseProxy" href="#ReverseProxy">type ReverseProxy struct</a>

```
searchKey: gitserver.ReverseProxy
tags: [struct]
```

```Go
type ReverseProxy struct {
	Transport http.RoundTripper

	// Limits concurrency of outstanding HTTP posts
	HTTPLimiter *parallel.Run
}
```

ReverseProxy is a gitserver reverse proxy. 

#### <a id="NewReverseProxy" href="#NewReverseProxy">func NewReverseProxy(transport http.RoundTripper, httpLimiter *parallel.Run) *ReverseProxy</a>

```
searchKey: gitserver.NewReverseProxy
tags: [function]
```

```Go
func NewReverseProxy(transport http.RoundTripper, httpLimiter *parallel.Run) *ReverseProxy
```

NewReverseProxy returns a new gitserver.ReverseProxy instantiated with the given transport and HTTP limiter. 

#### <a id="ReverseProxy.ServeHTTP" href="#ReverseProxy.ServeHTTP">func (p *ReverseProxy) ServeHTTP(repo api.RepoName, method, op string, director func(req *http.Request), res http.ResponseWriter, req *http.Request)</a>

```
searchKey: gitserver.ReverseProxy.ServeHTTP
tags: [method]
```

```Go
func (p *ReverseProxy) ServeHTTP(repo api.RepoName, method, op string, director func(req *http.Request), res http.ResponseWriter, req *http.Request)
```

ServeHTTP creates a one-shot proxy with the given director and proxies the given request to gitserver. The director must rewrite the request to the correct gitserver address, which should be obtained via a gitserver client's AddrForRepo method. 

### <a id="RevisionNotFoundError" href="#RevisionNotFoundError">type RevisionNotFoundError struct</a>

```
searchKey: gitserver.RevisionNotFoundError
tags: [struct]
```

```Go
type RevisionNotFoundError struct {
	Repo api.RepoName
	Spec string
}
```

RevisionNotFoundError is an error that reports a revision doesn't exist. 

#### <a id="RevisionNotFoundError.Error" href="#RevisionNotFoundError.Error">func (e *RevisionNotFoundError) Error() string</a>

```
searchKey: gitserver.RevisionNotFoundError.Error
tags: [method]
```

```Go
func (e *RevisionNotFoundError) Error() string
```

#### <a id="RevisionNotFoundError.HTTPStatusCode" href="#RevisionNotFoundError.HTTPStatusCode">func (e *RevisionNotFoundError) HTTPStatusCode() int</a>

```
searchKey: gitserver.RevisionNotFoundError.HTTPStatusCode
tags: [method]
```

```Go
func (e *RevisionNotFoundError) HTTPStatusCode() int
```

#### <a id="RevisionNotFoundError.NotFound" href="#RevisionNotFoundError.NotFound">func (RevisionNotFoundError) NotFound() bool</a>

```
searchKey: gitserver.RevisionNotFoundError.NotFound
tags: [method]
```

```Go
func (RevisionNotFoundError) NotFound() bool
```

### <a id="archiveReader" href="#archiveReader">type archiveReader struct</a>

```
searchKey: gitserver.archiveReader
tags: [struct private]
```

```Go
type archiveReader struct {
	base io.ReadCloser
	repo api.RepoName
	spec string
}
```

archiveReader wraps the StdoutReader yielded by gitserver's Cmd.StdoutReader with one that knows how to report a repository-not-found error more carefully. 

#### <a id="archiveReader.Close" href="#archiveReader.Close">func (a *archiveReader) Close() error</a>

```
searchKey: gitserver.archiveReader.Close
tags: [method private]
```

```Go
func (a *archiveReader) Close() error
```

#### <a id="archiveReader.Read" href="#archiveReader.Read">func (a *archiveReader) Read(p []byte) (int, error)</a>

```
searchKey: gitserver.archiveReader.Read
tags: [method private]
```

```Go
func (a *archiveReader) Read(p []byte) (int, error)
```

Read checks the known output behavior of the StdoutReader. 

### <a id="badRequestError" href="#badRequestError">type badRequestError struct</a>

```
searchKey: gitserver.badRequestError
tags: [struct private]
```

```Go
type badRequestError struct{ error }
```

#### <a id="badRequestError.BadRequest" href="#badRequestError.BadRequest">func (e badRequestError) BadRequest() bool</a>

```
searchKey: gitserver.badRequestError.BadRequest
tags: [method private]
```

```Go
func (e badRequestError) BadRequest() bool
```

### <a id="cmdReader" href="#cmdReader">type cmdReader struct</a>

```
searchKey: gitserver.cmdReader
tags: [struct private]
```

```Go
type cmdReader struct {
	rc      io.ReadCloser
	trailer http.Header
}
```

#### <a id="cmdReader.Close" href="#cmdReader.Close">func (c *cmdReader) Close() error</a>

```
searchKey: gitserver.cmdReader.Close
tags: [method private]
```

```Go
func (c *cmdReader) Close() error
```

#### <a id="cmdReader.Read" href="#cmdReader.Read">func (c *cmdReader) Read(p []byte) (int, error)</a>

```
searchKey: gitserver.cmdReader.Read
tags: [method private]
```

```Go
func (c *cmdReader) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="AddrForRepo" href="#AddrForRepo">func AddrForRepo(repo api.RepoName, addrs []string) string</a>

```
searchKey: gitserver.AddrForRepo
tags: [function]
```

```Go
func AddrForRepo(repo api.RepoName, addrs []string) string
```

AddrForRepo returns the gitserver address to use for the given repo name. It should never be called with an empty slice. 

### <a id="IsRevisionNotFound" href="#IsRevisionNotFound">func IsRevisionNotFound(err error) bool</a>

```
searchKey: gitserver.IsRevisionNotFound
tags: [function]
```

```Go
func IsRevisionNotFound(err error) bool
```

IsRevisionNotFound reports if err is a RevisionNotFoundError. 

### <a id="StdoutReader" href="#StdoutReader">func StdoutReader(ctx context.Context, c *Cmd) (io.ReadCloser, error)</a>

```
searchKey: gitserver.StdoutReader
tags: [function]
```

```Go
func StdoutReader(ctx context.Context, c *Cmd) (io.ReadCloser, error)
```

StdoutReader returns an io.ReadCloser of stdout of c. If the command has a non-zero return value, Read returns a non io.EOF error. Do not pass in a started command. 

### <a id="addrForKey" href="#addrForKey">func addrForKey(key string, addrs []string) string</a>

```
searchKey: gitserver.addrForKey
tags: [function private]
```

```Go
func addrForKey(key string, addrs []string) string
```

addrForKey returns the gitserver address to use for the given string key, which is hashed for sharding purposes. 

### <a id="userFromContext" href="#userFromContext">func userFromContext(ctx context.Context) string</a>

```
searchKey: gitserver.userFromContext
tags: [function private]
```

```Go
func userFromContext(ctx context.Context) string
```

