# Package gitserver

## Index

* Subpages
  * [internal/gitserver/protocol](gitserver/protocol.md)
* [Variables](#var)
    * [var requestMeter](#requestMeter)
    * [var defaultTransport](#defaultTransport)
    * [var DefaultClient](#DefaultClient)
    * [var deadlineExceededCounter](#deadlineExceededCounter)
    * [var MockIsRepoCloneable](#MockIsRepoCloneable)
    * [var DefaultReverseProxy](#DefaultReverseProxy)
* [Types](#type)
    * [type Client struct](#Client)
        * [func NewClient(cli httpcli.Doer) *Client](#NewClient)
        * [func (c *Client) AddrForRepo(repo api.RepoName) string](#Client.AddrForRepo)
        * [func (c *Client) addrForKey(key string) string](#Client.addrForKey)
        * [func (c *Client) ArchiveURL(repo api.RepoName, opt ArchiveOptions) *url.URL](#Client.ArchiveURL)
        * [func (c *Client) Archive(ctx context.Context, repo api.RepoName, opt ArchiveOptions) (_ io.ReadCloser, err error)](#Client.Archive)
        * [func (c *Client) P4Exec(ctx context.Context, host, user, password string, args ...string) (_ io.ReadCloser, _ http.Header, errRes error)](#Client.P4Exec)
        * [func (c *Client) Command(name string, arg ...string) *Cmd](#Client.Command)
        * [func (c *Client) WaitForGitServers(ctx context.Context) error](#Client.WaitForGitServers)
        * [func (c *Client) pingAll(ctx context.Context) []error](#Client.pingAll)
        * [func (c *Client) ping(ctx context.Context, addr string) error](#Client.ping)
        * [func (c *Client) ListGitolite(ctx context.Context, gitoliteHost string) (list []*gitolite.Repo, err error)](#Client.ListGitolite)
        * [func (c *Client) ListCloned(ctx context.Context) ([]string, error)](#Client.ListCloned)
        * [func (c *Client) GetGitolitePhabricatorMetadata(ctx context.Context, gitoliteHost string, repoName api.RepoName) (*protocol.GitolitePhabricatorMetadataResponse, error)](#Client.GetGitolitePhabricatorMetadata)
        * [func (c *Client) doListOne(ctx context.Context, urlSuffix, addr string) ([]string, error)](#Client.doListOne)
        * [func (c *Client) RequestRepoUpdate(ctx context.Context, repo api.RepoName, since time.Duration) (*protocol.RepoUpdateResponse, error)](#Client.RequestRepoUpdate)
        * [func (c *Client) IsRepoCloneable(ctx context.Context, repo api.RepoName) error](#Client.IsRepoCloneable)
        * [func (c *Client) IsRepoCloned(ctx context.Context, repo api.RepoName) (bool, error)](#Client.IsRepoCloned)
        * [func (c *Client) RepoCloneProgress(ctx context.Context, repos ...api.RepoName) (*protocol.RepoCloneProgressResponse, error)](#Client.RepoCloneProgress)
        * [func (c *Client) RepoInfo(ctx context.Context, repos ...api.RepoName) (*protocol.RepoInfoResponse, error)](#Client.RepoInfo)
        * [func (c *Client) ReposStats(ctx context.Context) (map[string]*protocol.ReposStats, error)](#Client.ReposStats)
        * [func (c *Client) doReposStats(ctx context.Context, addr string) (*protocol.ReposStats, error)](#Client.doReposStats)
        * [func (c *Client) Remove(ctx context.Context, repo api.RepoName) error](#Client.Remove)
        * [func (c *Client) httpPost(ctx context.Context, repo api.RepoName, op string, payload interface{}) (resp *http.Response, err error)](#Client.httpPost)
        * [func (c *Client) do(ctx context.Context, repo api.RepoName, method, op string, payload interface{}) (resp *http.Response, err error)](#Client.do)
        * [func (c *Client) CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)](#Client.CreateCommitFromPatch)
    * [type ArchiveOptions struct](#ArchiveOptions)
    * [type archiveReader struct](#archiveReader)
        * [func (a *archiveReader) Read(p []byte) (int, error)](#archiveReader.Read)
        * [func (a *archiveReader) Close() error](#archiveReader.Close)
    * [type badRequestError struct](#badRequestError)
        * [func (e badRequestError) BadRequest() bool](#badRequestError.BadRequest)
    * [type Cmd struct](#Cmd)
        * [func (c *Cmd) sendExec(ctx context.Context) (_ io.ReadCloser, _ http.Header, errRes error)](#Cmd.sendExec)
        * [func (c *Cmd) DividedOutput(ctx context.Context) ([]byte, []byte, error)](#Cmd.DividedOutput)
        * [func (c *Cmd) Run(ctx context.Context) error](#Cmd.Run)
        * [func (c *Cmd) Output(ctx context.Context) ([]byte, error)](#Cmd.Output)
        * [func (c *Cmd) CombinedOutput(ctx context.Context) ([]byte, error)](#Cmd.CombinedOutput)
        * [func (c *Cmd) String() string](#Cmd.String)
    * [type cmdReader struct](#cmdReader)
        * [func (c *cmdReader) Read(p []byte) (int, error)](#cmdReader.Read)
        * [func (c *cmdReader) Close() error](#cmdReader.Close)
    * [type RepoNotCloneableErr struct](#RepoNotCloneableErr)
        * [func (e *RepoNotCloneableErr) NotFound() bool](#RepoNotCloneableErr.NotFound)
        * [func (e *RepoNotCloneableErr) Error() string](#RepoNotCloneableErr.Error)
    * [type RevisionNotFoundError struct](#RevisionNotFoundError)
        * [func (e *RevisionNotFoundError) Error() string](#RevisionNotFoundError.Error)
        * [func (e *RevisionNotFoundError) HTTPStatusCode() int](#RevisionNotFoundError.HTTPStatusCode)
        * [func (RevisionNotFoundError) NotFound() bool](#RevisionNotFoundError.NotFound)
    * [type ReverseProxy struct](#ReverseProxy)
        * [func NewReverseProxy(transport http.RoundTripper, httpLimiter *parallel.Run) *ReverseProxy](#NewReverseProxy)
        * [func (p *ReverseProxy) ServeHTTP(repo api.RepoName, method, op string, director func(req *http.Request), res http.ResponseWriter, req *http.Request)](#ReverseProxy.ServeHTTP)
* [Functions](#func)
    * [func AddrForRepo(repo api.RepoName, addrs []string) string](#AddrForRepo)
    * [func addrForKey(key string, addrs []string) string](#addrForKey)
    * [func StdoutReader(ctx context.Context, c *Cmd) (io.ReadCloser, error)](#StdoutReader)
    * [func userFromContext(ctx context.Context) string](#userFromContext)
    * [func IsRevisionNotFound(err error) bool](#IsRevisionNotFound)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="requestMeter" href="#requestMeter">var requestMeter</a>

```
searchKey: gitserver.requestMeter
tags: [private]
```

```Go
var requestMeter = ...
```

### <a id="defaultTransport" href="#defaultTransport">var defaultTransport</a>

```
searchKey: gitserver.defaultTransport
tags: [private]
```

```Go
var defaultTransport = ...
```

defaultTransport is the default transport used in the default client and the default reverse proxy. ot.Transport will propagate opentracing spans. 

### <a id="DefaultClient" href="#DefaultClient">var DefaultClient</a>

```
searchKey: gitserver.DefaultClient
```

```Go
var DefaultClient = NewClient(&http.Client{Transport: defaultTransport})
```

DefaultClient is the default Client. Unless overwritten it is connected to servers specified by SRC_GIT_SERVERS. 

### <a id="deadlineExceededCounter" href="#deadlineExceededCounter">var deadlineExceededCounter</a>

```
searchKey: gitserver.deadlineExceededCounter
tags: [private]
```

```Go
var deadlineExceededCounter = ...
```

### <a id="MockIsRepoCloneable" href="#MockIsRepoCloneable">var MockIsRepoCloneable</a>

```
searchKey: gitserver.MockIsRepoCloneable
```

```Go
var MockIsRepoCloneable func(api.RepoName) error
```

MockIsRepoCloneable mocks (*Client).IsRepoCloneable for tests. 

### <a id="DefaultReverseProxy" href="#DefaultReverseProxy">var DefaultReverseProxy</a>

```
searchKey: gitserver.DefaultReverseProxy
```

```Go
var DefaultReverseProxy = NewReverseProxy(defaultTransport, DefaultClient.HTTPLimiter)
```

DefaultReverseProxy is the default ReverseProxy. It uses the same transport and HTTP limiter as the default client. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: gitserver.Client
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
```

```Go
func NewClient(cli httpcli.Doer) *Client
```

NewClient returns a new gitserver.Client instantiated with default arguments and httpcli.Doer. 

#### <a id="Client.AddrForRepo" href="#Client.AddrForRepo">func (c *Client) AddrForRepo(repo api.RepoName) string</a>

```
searchKey: gitserver.Client.AddrForRepo
```

```Go
func (c *Client) AddrForRepo(repo api.RepoName) string
```

AddrForRepo returns the gitserver address to use for the given repo name. 

#### <a id="Client.addrForKey" href="#Client.addrForKey">func (c *Client) addrForKey(key string) string</a>

```
searchKey: gitserver.Client.addrForKey
tags: [private]
```

```Go
func (c *Client) addrForKey(key string) string
```

addrForKey returns the gitserver address to use for the given string key, which is hashed for sharding purposes. 

#### <a id="Client.ArchiveURL" href="#Client.ArchiveURL">func (c *Client) ArchiveURL(repo api.RepoName, opt ArchiveOptions) *url.URL</a>

```
searchKey: gitserver.Client.ArchiveURL
```

```Go
func (c *Client) ArchiveURL(repo api.RepoName, opt ArchiveOptions) *url.URL
```

ArchiveURL returns a URL from which an archive of the given Git repository can be downloaded from. 

#### <a id="Client.Archive" href="#Client.Archive">func (c *Client) Archive(ctx context.Context, repo api.RepoName, opt ArchiveOptions) (_ io.ReadCloser, err error)</a>

```
searchKey: gitserver.Client.Archive
```

```Go
func (c *Client) Archive(ctx context.Context, repo api.RepoName, opt ArchiveOptions) (_ io.ReadCloser, err error)
```

Archive produces an archive from a Git repository. 

#### <a id="Client.P4Exec" href="#Client.P4Exec">func (c *Client) P4Exec(ctx context.Context, host, user, password string, args ...string) (_ io.ReadCloser, _ http.Header, errRes error)</a>

```
searchKey: gitserver.Client.P4Exec
```

```Go
func (c *Client) P4Exec(ctx context.Context, host, user, password string, args ...string) (_ io.ReadCloser, _ http.Header, errRes error)
```

P4Exec sends a p4 command with given arguments and returns an io.ReadCloser for the output. 

#### <a id="Client.Command" href="#Client.Command">func (c *Client) Command(name string, arg ...string) *Cmd</a>

```
searchKey: gitserver.Client.Command
```

```Go
func (c *Client) Command(name string, arg ...string) *Cmd
```

Command creates a new Cmd. Command name must be 'git', otherwise it panics. 

#### <a id="Client.WaitForGitServers" href="#Client.WaitForGitServers">func (c *Client) WaitForGitServers(ctx context.Context) error</a>

```
searchKey: gitserver.Client.WaitForGitServers
```

```Go
func (c *Client) WaitForGitServers(ctx context.Context) error
```

WaitForGitServers retries a noop request to all gitserver instances until getting back a successful response. 

#### <a id="Client.pingAll" href="#Client.pingAll">func (c *Client) pingAll(ctx context.Context) []error</a>

```
searchKey: gitserver.Client.pingAll
tags: [private]
```

```Go
func (c *Client) pingAll(ctx context.Context) []error
```

#### <a id="Client.ping" href="#Client.ping">func (c *Client) ping(ctx context.Context, addr string) error</a>

```
searchKey: gitserver.Client.ping
tags: [private]
```

```Go
func (c *Client) ping(ctx context.Context, addr string) error
```

#### <a id="Client.ListGitolite" href="#Client.ListGitolite">func (c *Client) ListGitolite(ctx context.Context, gitoliteHost string) (list []*gitolite.Repo, err error)</a>

```
searchKey: gitserver.Client.ListGitolite
```

```Go
func (c *Client) ListGitolite(ctx context.Context, gitoliteHost string) (list []*gitolite.Repo, err error)
```

ListGitolite lists Gitolite repositories. 

#### <a id="Client.ListCloned" href="#Client.ListCloned">func (c *Client) ListCloned(ctx context.Context) ([]string, error)</a>

```
searchKey: gitserver.Client.ListCloned
```

```Go
func (c *Client) ListCloned(ctx context.Context) ([]string, error)
```

ListCloned lists all cloned repositories 

#### <a id="Client.GetGitolitePhabricatorMetadata" href="#Client.GetGitolitePhabricatorMetadata">func (c *Client) GetGitolitePhabricatorMetadata(ctx context.Context, gitoliteHost string, repoName api.RepoName) (*protocol.GitolitePhabricatorMetadataResponse, error)</a>

```
searchKey: gitserver.Client.GetGitolitePhabricatorMetadata
```

```Go
func (c *Client) GetGitolitePhabricatorMetadata(ctx context.Context, gitoliteHost string, repoName api.RepoName) (*protocol.GitolitePhabricatorMetadataResponse, error)
```

GetGitolitePhabricatorMetadata returns Phabricator metadata for a Gitolite repository fetched via a user-provided command. 

#### <a id="Client.doListOne" href="#Client.doListOne">func (c *Client) doListOne(ctx context.Context, urlSuffix, addr string) ([]string, error)</a>

```
searchKey: gitserver.Client.doListOne
tags: [private]
```

```Go
func (c *Client) doListOne(ctx context.Context, urlSuffix, addr string) ([]string, error)
```

#### <a id="Client.RequestRepoUpdate" href="#Client.RequestRepoUpdate">func (c *Client) RequestRepoUpdate(ctx context.Context, repo api.RepoName, since time.Duration) (*protocol.RepoUpdateResponse, error)</a>

```
searchKey: gitserver.Client.RequestRepoUpdate
```

```Go
func (c *Client) RequestRepoUpdate(ctx context.Context, repo api.RepoName, since time.Duration) (*protocol.RepoUpdateResponse, error)
```

RequestRepoUpdate is the new protocol endpoint for synchronous requests with more detailed responses. Do not use this if you are not repo-updater. 

Repo updates are not guaranteed to occur. If a repo has been updated recently (within the Since duration specified in the request), the update won't happen. 

#### <a id="Client.IsRepoCloneable" href="#Client.IsRepoCloneable">func (c *Client) IsRepoCloneable(ctx context.Context, repo api.RepoName) error</a>

```
searchKey: gitserver.Client.IsRepoCloneable
```

```Go
func (c *Client) IsRepoCloneable(ctx context.Context, repo api.RepoName) error
```

IsRepoCloneable returns nil if the repository is cloneable. 

#### <a id="Client.IsRepoCloned" href="#Client.IsRepoCloned">func (c *Client) IsRepoCloned(ctx context.Context, repo api.RepoName) (bool, error)</a>

```
searchKey: gitserver.Client.IsRepoCloned
```

```Go
func (c *Client) IsRepoCloned(ctx context.Context, repo api.RepoName) (bool, error)
```

#### <a id="Client.RepoCloneProgress" href="#Client.RepoCloneProgress">func (c *Client) RepoCloneProgress(ctx context.Context, repos ...api.RepoName) (*protocol.RepoCloneProgressResponse, error)</a>

```
searchKey: gitserver.Client.RepoCloneProgress
```

```Go
func (c *Client) RepoCloneProgress(ctx context.Context, repos ...api.RepoName) (*protocol.RepoCloneProgressResponse, error)
```

#### <a id="Client.RepoInfo" href="#Client.RepoInfo">func (c *Client) RepoInfo(ctx context.Context, repos ...api.RepoName) (*protocol.RepoInfoResponse, error)</a>

```
searchKey: gitserver.Client.RepoInfo
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
```

```Go
func (c *Client) ReposStats(ctx context.Context) (map[string]*protocol.ReposStats, error)
```

ReposStats will return a map of the ReposStats for each gitserver in a map. If we fail to fetch a stat from a gitserver, it won't be in the returned map and will be appended to the error. If no errors occur err will be nil. 

Note: If the statistics for a gitserver have not been computed, the UpdatedAt field will be zero. This can happen for new gitservers. 

#### <a id="Client.doReposStats" href="#Client.doReposStats">func (c *Client) doReposStats(ctx context.Context, addr string) (*protocol.ReposStats, error)</a>

```
searchKey: gitserver.Client.doReposStats
tags: [private]
```

```Go
func (c *Client) doReposStats(ctx context.Context, addr string) (*protocol.ReposStats, error)
```

#### <a id="Client.Remove" href="#Client.Remove">func (c *Client) Remove(ctx context.Context, repo api.RepoName) error</a>

```
searchKey: gitserver.Client.Remove
```

```Go
func (c *Client) Remove(ctx context.Context, repo api.RepoName) error
```

Remove removes the repository clone from gitserver. 

#### <a id="Client.httpPost" href="#Client.httpPost">func (c *Client) httpPost(ctx context.Context, repo api.RepoName, op string, payload interface{}) (resp *http.Response, err error)</a>

```
searchKey: gitserver.Client.httpPost
tags: [private]
```

```Go
func (c *Client) httpPost(ctx context.Context, repo api.RepoName, op string, payload interface{}) (resp *http.Response, err error)
```

#### <a id="Client.do" href="#Client.do">func (c *Client) do(ctx context.Context, repo api.RepoName, method, op string, payload interface{}) (resp *http.Response, err error)</a>

```
searchKey: gitserver.Client.do
tags: [private]
```

```Go
func (c *Client) do(ctx context.Context, repo api.RepoName, method, op string, payload interface{}) (resp *http.Response, err error)
```

do performs a request to a gitserver, sharding based on the given repo name (the repo name is otherwise not used). 

#### <a id="Client.CreateCommitFromPatch" href="#Client.CreateCommitFromPatch">func (c *Client) CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)</a>

```
searchKey: gitserver.Client.CreateCommitFromPatch
```

```Go
func (c *Client) CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)
```

CreateCommitFromPatch will attempt to create a commit from a patch If possible, the error returned will be of type protocol.CreateCommitFromPatchError 

### <a id="ArchiveOptions" href="#ArchiveOptions">type ArchiveOptions struct</a>

```
searchKey: gitserver.ArchiveOptions
```

```Go
type ArchiveOptions struct {
	Treeish string   // the tree or commit to produce an archive for
	Format  string   // format of the resulting archive (usually "tar" or "zip")
	Paths   []string // if nonempty, only include these paths
}
```

ArchiveOptions contains options for the Archive func. 

### <a id="archiveReader" href="#archiveReader">type archiveReader struct</a>

```
searchKey: gitserver.archiveReader
tags: [private]
```

```Go
type archiveReader struct {
	base io.ReadCloser
	repo api.RepoName
	spec string
}
```

archiveReader wraps the StdoutReader yielded by gitserver's Cmd.StdoutReader with one that knows how to report a repository-not-found error more carefully. 

#### <a id="archiveReader.Read" href="#archiveReader.Read">func (a *archiveReader) Read(p []byte) (int, error)</a>

```
searchKey: gitserver.archiveReader.Read
tags: [private]
```

```Go
func (a *archiveReader) Read(p []byte) (int, error)
```

Read checks the known output behavior of the StdoutReader. 

#### <a id="archiveReader.Close" href="#archiveReader.Close">func (a *archiveReader) Close() error</a>

```
searchKey: gitserver.archiveReader.Close
tags: [private]
```

```Go
func (a *archiveReader) Close() error
```

### <a id="badRequestError" href="#badRequestError">type badRequestError struct</a>

```
searchKey: gitserver.badRequestError
tags: [private]
```

```Go
type badRequestError struct{ error }
```

#### <a id="badRequestError.BadRequest" href="#badRequestError.BadRequest">func (e badRequestError) BadRequest() bool</a>

```
searchKey: gitserver.badRequestError.BadRequest
tags: [private]
```

```Go
func (e badRequestError) BadRequest() bool
```

### <a id="Cmd" href="#Cmd">type Cmd struct</a>

```
searchKey: gitserver.Cmd
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

#### <a id="Cmd.sendExec" href="#Cmd.sendExec">func (c *Cmd) sendExec(ctx context.Context) (_ io.ReadCloser, _ http.Header, errRes error)</a>

```
searchKey: gitserver.Cmd.sendExec
tags: [private]
```

```Go
func (c *Cmd) sendExec(ctx context.Context) (_ io.ReadCloser, _ http.Header, errRes error)
```

#### <a id="Cmd.DividedOutput" href="#Cmd.DividedOutput">func (c *Cmd) DividedOutput(ctx context.Context) ([]byte, []byte, error)</a>

```
searchKey: gitserver.Cmd.DividedOutput
```

```Go
func (c *Cmd) DividedOutput(ctx context.Context) ([]byte, []byte, error)
```

DividedOutput runs the command and returns its standard output and standard error. 

#### <a id="Cmd.Run" href="#Cmd.Run">func (c *Cmd) Run(ctx context.Context) error</a>

```
searchKey: gitserver.Cmd.Run
```

```Go
func (c *Cmd) Run(ctx context.Context) error
```

Run starts the specified command and waits for it to complete. 

#### <a id="Cmd.Output" href="#Cmd.Output">func (c *Cmd) Output(ctx context.Context) ([]byte, error)</a>

```
searchKey: gitserver.Cmd.Output
```

```Go
func (c *Cmd) Output(ctx context.Context) ([]byte, error)
```

Output runs the command and returns its standard output. 

#### <a id="Cmd.CombinedOutput" href="#Cmd.CombinedOutput">func (c *Cmd) CombinedOutput(ctx context.Context) ([]byte, error)</a>

```
searchKey: gitserver.Cmd.CombinedOutput
```

```Go
func (c *Cmd) CombinedOutput(ctx context.Context) ([]byte, error)
```

CombinedOutput runs the command and returns its combined standard output and standard error. 

#### <a id="Cmd.String" href="#Cmd.String">func (c *Cmd) String() string</a>

```
searchKey: gitserver.Cmd.String
```

```Go
func (c *Cmd) String() string
```

### <a id="cmdReader" href="#cmdReader">type cmdReader struct</a>

```
searchKey: gitserver.cmdReader
tags: [private]
```

```Go
type cmdReader struct {
	rc      io.ReadCloser
	trailer http.Header
}
```

#### <a id="cmdReader.Read" href="#cmdReader.Read">func (c *cmdReader) Read(p []byte) (int, error)</a>

```
searchKey: gitserver.cmdReader.Read
tags: [private]
```

```Go
func (c *cmdReader) Read(p []byte) (int, error)
```

#### <a id="cmdReader.Close" href="#cmdReader.Close">func (c *cmdReader) Close() error</a>

```
searchKey: gitserver.cmdReader.Close
tags: [private]
```

```Go
func (c *cmdReader) Close() error
```

### <a id="RepoNotCloneableErr" href="#RepoNotCloneableErr">type RepoNotCloneableErr struct</a>

```
searchKey: gitserver.RepoNotCloneableErr
```

```Go
type RepoNotCloneableErr struct {
	repo     api.RepoName
	reason   string
	notFound bool
}
```

RepoNotCloneableErr is the error that happens when a repository can not be cloned. 

#### <a id="RepoNotCloneableErr.NotFound" href="#RepoNotCloneableErr.NotFound">func (e *RepoNotCloneableErr) NotFound() bool</a>

```
searchKey: gitserver.RepoNotCloneableErr.NotFound
```

```Go
func (e *RepoNotCloneableErr) NotFound() bool
```

NotFound returns true if the repo could not be cloned because it wasn't found. This may be because the repo doesn't exist, or because the repo is private and there are insufficient permissions. 

#### <a id="RepoNotCloneableErr.Error" href="#RepoNotCloneableErr.Error">func (e *RepoNotCloneableErr) Error() string</a>

```
searchKey: gitserver.RepoNotCloneableErr.Error
```

```Go
func (e *RepoNotCloneableErr) Error() string
```

### <a id="RevisionNotFoundError" href="#RevisionNotFoundError">type RevisionNotFoundError struct</a>

```
searchKey: gitserver.RevisionNotFoundError
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
```

```Go
func (e *RevisionNotFoundError) Error() string
```

#### <a id="RevisionNotFoundError.HTTPStatusCode" href="#RevisionNotFoundError.HTTPStatusCode">func (e *RevisionNotFoundError) HTTPStatusCode() int</a>

```
searchKey: gitserver.RevisionNotFoundError.HTTPStatusCode
```

```Go
func (e *RevisionNotFoundError) HTTPStatusCode() int
```

#### <a id="RevisionNotFoundError.NotFound" href="#RevisionNotFoundError.NotFound">func (RevisionNotFoundError) NotFound() bool</a>

```
searchKey: gitserver.RevisionNotFoundError.NotFound
```

```Go
func (RevisionNotFoundError) NotFound() bool
```

### <a id="ReverseProxy" href="#ReverseProxy">type ReverseProxy struct</a>

```
searchKey: gitserver.ReverseProxy
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
```

```Go
func NewReverseProxy(transport http.RoundTripper, httpLimiter *parallel.Run) *ReverseProxy
```

NewReverseProxy returns a new gitserver.ReverseProxy instantiated with the given transport and HTTP limiter. 

#### <a id="ReverseProxy.ServeHTTP" href="#ReverseProxy.ServeHTTP">func (p *ReverseProxy) ServeHTTP(repo api.RepoName, method, op string, director func(req *http.Request), res http.ResponseWriter, req *http.Request)</a>

```
searchKey: gitserver.ReverseProxy.ServeHTTP
```

```Go
func (p *ReverseProxy) ServeHTTP(repo api.RepoName, method, op string, director func(req *http.Request), res http.ResponseWriter, req *http.Request)
```

ServeHTTP creates a one-shot proxy with the given director and proxies the given request to gitserver. The director must rewrite the request to the correct gitserver address, which should be obtained via a gitserver client's AddrForRepo method. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="AddrForRepo" href="#AddrForRepo">func AddrForRepo(repo api.RepoName, addrs []string) string</a>

```
searchKey: gitserver.AddrForRepo
```

```Go
func AddrForRepo(repo api.RepoName, addrs []string) string
```

AddrForRepo returns the gitserver address to use for the given repo name. It should never be called with an empty slice. 

### <a id="addrForKey" href="#addrForKey">func addrForKey(key string, addrs []string) string</a>

```
searchKey: gitserver.addrForKey
tags: [private]
```

```Go
func addrForKey(key string, addrs []string) string
```

addrForKey returns the gitserver address to use for the given string key, which is hashed for sharding purposes. 

### <a id="StdoutReader" href="#StdoutReader">func StdoutReader(ctx context.Context, c *Cmd) (io.ReadCloser, error)</a>

```
searchKey: gitserver.StdoutReader
```

```Go
func StdoutReader(ctx context.Context, c *Cmd) (io.ReadCloser, error)
```

StdoutReader returns an io.ReadCloser of stdout of c. If the command has a non-zero return value, Read returns a non io.EOF error. Do not pass in a started command. 

### <a id="userFromContext" href="#userFromContext">func userFromContext(ctx context.Context) string</a>

```
searchKey: gitserver.userFromContext
tags: [private]
```

```Go
func userFromContext(ctx context.Context) string
```

### <a id="IsRevisionNotFound" href="#IsRevisionNotFound">func IsRevisionNotFound(err error) bool</a>

```
searchKey: gitserver.IsRevisionNotFound
```

```Go
func IsRevisionNotFound(err error) bool
```

IsRevisionNotFound reports if err is a RevisionNotFoundError. 

