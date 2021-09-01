# Package protocol

## Index

* [Types](#type)
    * [type CreateCommitFromPatchError struct](#CreateCommitFromPatchError)
        * [func (e *CreateCommitFromPatchError) Error() string](#CreateCommitFromPatchError.Error)
    * [type CreateCommitFromPatchRequest struct](#CreateCommitFromPatchRequest)
    * [type CreateCommitFromPatchResponse struct](#CreateCommitFromPatchResponse)
        * [func (e *CreateCommitFromPatchResponse) SetError(repo, command, out string, err error)](#CreateCommitFromPatchResponse.SetError)
    * [type ExecRequest struct](#ExecRequest)
    * [type GitolitePhabricatorMetadataResponse struct](#GitolitePhabricatorMetadataResponse)
    * [type HTTPSConfig struct](#HTTPSConfig)
    * [type IsRepoCloneableRequest struct](#IsRepoCloneableRequest)
    * [type IsRepoCloneableResponse struct](#IsRepoCloneableResponse)
    * [type IsRepoClonedRequest struct](#IsRepoClonedRequest)
    * [type NotFoundPayload struct](#NotFoundPayload)
    * [type P4ExecRequest struct](#P4ExecRequest)
    * [type PatchCommitInfo struct](#PatchCommitInfo)
    * [type PushConfig struct](#PushConfig)
    * [type RemoteOpts struct](#RemoteOpts)
    * [type RepoCloneProgress struct](#RepoCloneProgress)
    * [type RepoCloneProgressRequest struct](#RepoCloneProgressRequest)
    * [type RepoCloneProgressResponse struct](#RepoCloneProgressResponse)
    * [type RepoDeleteRequest struct](#RepoDeleteRequest)
    * [type RepoInfo struct](#RepoInfo)
    * [type RepoInfoRequest struct](#RepoInfoRequest)
    * [type RepoInfoResponse struct](#RepoInfoResponse)
    * [type RepoUpdateRequest struct](#RepoUpdateRequest)
    * [type RepoUpdateResponse struct](#RepoUpdateResponse)
    * [type ReposStats struct](#ReposStats)
    * [type SSHConfig struct](#SSHConfig)
* [Functions](#func)
    * [func NormalizeRepo(input api.RepoName) api.RepoName](#NormalizeRepo)
    * [func TestNormalizeRepo(t *testing.T)](#TestNormalizeRepo)
    * [func hasUpperASCII(s string) bool](#hasUpperASCII)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CreateCommitFromPatchError" href="#CreateCommitFromPatchError">type CreateCommitFromPatchError struct</a>

```
searchKey: protocol.CreateCommitFromPatchError
tags: [struct]
```

```Go
type CreateCommitFromPatchError struct {
	// RepositoryName is the name of the repository
	RepositoryName string

	// InternalError is the internal error
	InternalError string

	// Command is the last git command that was attempted
	Command string
	// CombinedOutput is the combined stderr and stdout from running the command
	CombinedOutput string
}
```

CreateCommitFromPatchError is populated on errors running CreateCommitFromPatch 

#### <a id="CreateCommitFromPatchError.Error" href="#CreateCommitFromPatchError.Error">func (e *CreateCommitFromPatchError) Error() string</a>

```
searchKey: protocol.CreateCommitFromPatchError.Error
tags: [method]
```

```Go
func (e *CreateCommitFromPatchError) Error() string
```

Error returns a detailed error conforming to the error interface 

### <a id="CreateCommitFromPatchRequest" href="#CreateCommitFromPatchRequest">type CreateCommitFromPatchRequest struct</a>

```
searchKey: protocol.CreateCommitFromPatchRequest
tags: [struct]
```

```Go
type CreateCommitFromPatchRequest struct {
	// Repo is the repository to get information about.
	Repo api.RepoName
	// BaseCommit is the revision that the staging area object is based on
	BaseCommit api.CommitID
	// Patch is the diff contents to be used to create the staging area revision
	Patch string
	// TargetRef is the ref that will be created for this patch
	TargetRef string
	// If set to true and the TargetRef already exists, an unique number will be appended to the end (ie TargetRef-{#}). The generated ref will be returned.
	UniqueRef bool
	// CommitInfo is the information that will be used when creating the commit from a patch
	CommitInfo PatchCommitInfo
	// Push specifies whether the target ref will be pushed to the code host: if
	// nil, no push will be attempted, if non-nil, a push will be attempted.
	Push *PushConfig
	// GitApplyArgs are the arguments that will be passed to `git apply` along
	// with `--cached`.
	GitApplyArgs []string
}
```

CreateCommitFromPatchRequest is the request information needed for creating the simulated staging area git object for a repo. 

### <a id="CreateCommitFromPatchResponse" href="#CreateCommitFromPatchResponse">type CreateCommitFromPatchResponse struct</a>

```
searchKey: protocol.CreateCommitFromPatchResponse
tags: [struct]
```

```Go
type CreateCommitFromPatchResponse struct {
	// Rev is the tag that the staging object can be found at
	Rev string

	// Error is populated only on error
	Error *CreateCommitFromPatchError
}
```

CreateCommitFromPatchResponse is the response type returned after creating a commit from a patch 

#### <a id="CreateCommitFromPatchResponse.SetError" href="#CreateCommitFromPatchResponse.SetError">func (e *CreateCommitFromPatchResponse) SetError(repo, command, out string, err error)</a>

```
searchKey: protocol.CreateCommitFromPatchResponse.SetError
tags: [method]
```

```Go
func (e *CreateCommitFromPatchResponse) SetError(repo, command, out string, err error)
```

SetError adds the supplied error related details to e. 

### <a id="ExecRequest" href="#ExecRequest">type ExecRequest struct</a>

```
searchKey: protocol.ExecRequest
tags: [struct]
```

```Go
type ExecRequest struct {
	Repo api.RepoName `json:"repo"`

	EnsureRevision string      `json:"ensureRevision"`
	Args           []string    `json:"args"`
	Opt            *RemoteOpts `json:"opt"`
}
```

ExecRequest is a request to execute a command inside a git repository. 

Note that this request is deserialized by both gitserver and the frontend's internal proxy route and any major change to this structure will need to be reconciled in both places. 

### <a id="GitolitePhabricatorMetadataResponse" href="#GitolitePhabricatorMetadataResponse">type GitolitePhabricatorMetadataResponse struct</a>

```
searchKey: protocol.GitolitePhabricatorMetadataResponse
tags: [struct]
```

```Go
type GitolitePhabricatorMetadataResponse struct {
	Callsign string `json:"callsign"`
}
```

GitolitePhabricatorMetadataResponse is the response for a request for Phabricator metadata through the Gitolite API 

### <a id="HTTPSConfig" href="#HTTPSConfig">type HTTPSConfig struct</a>

```
searchKey: protocol.HTTPSConfig
tags: [struct]
```

```Go
type HTTPSConfig struct {
	User string `json:"user"` // the username provided to the remote
	Pass string `json:"pass"` // the password provided to the remote
}
```

HTTPSConfig configures and authenticates HTTPS for communication with remotes. 

### <a id="IsRepoCloneableRequest" href="#IsRepoCloneableRequest">type IsRepoCloneableRequest struct</a>

```
searchKey: protocol.IsRepoCloneableRequest
tags: [struct]
```

```Go
type IsRepoCloneableRequest struct {
	// Repo is the repository to check.
	Repo api.RepoName `json:"Repo"`
}
```

IsRepoCloneableRequest is a request to determine if a repo is cloneable. 

### <a id="IsRepoCloneableResponse" href="#IsRepoCloneableResponse">type IsRepoCloneableResponse struct</a>

```
searchKey: protocol.IsRepoCloneableResponse
tags: [struct]
```

```Go
type IsRepoCloneableResponse struct {
	Cloneable bool   // whether the repo is cloneable
	Reason    string // if not cloneable, the reason why not
}
```

IsRepoCloneableResponse is the response type for the IsRepoCloneableRequest. 

### <a id="IsRepoClonedRequest" href="#IsRepoClonedRequest">type IsRepoClonedRequest struct</a>

```
searchKey: protocol.IsRepoClonedRequest
tags: [struct]
```

```Go
type IsRepoClonedRequest struct {
	// Repo is the repository to check.
	Repo api.RepoName
}
```

IsRepoClonedRequest is a request to determine if a repo currently exists on gitserver. 

### <a id="NotFoundPayload" href="#NotFoundPayload">type NotFoundPayload struct</a>

```
searchKey: protocol.NotFoundPayload
tags: [struct]
```

```Go
type NotFoundPayload struct {
	CloneInProgress bool `json:"cloneInProgress"` // If true, exec returned with noop because clone is in progress.

	// CloneProgress is a progress message from the running clone command.
	CloneProgress string `json:"cloneProgress,omitempty"`
}
```

### <a id="P4ExecRequest" href="#P4ExecRequest">type P4ExecRequest struct</a>

```
searchKey: protocol.P4ExecRequest
tags: [struct]
```

```Go
type P4ExecRequest struct {
	P4Port   string   `json:"p4port"`
	P4User   string   `json:"p4user"`
	P4Passwd string   `json:"p4passwd"`
	Args     []string `json:"args"`
}
```

P4ExecRequest is a request to execute a p4 command with given arguments. 

Note that this request is deserialized by both gitserver and the frontend's internal proxy route and any major change to this structure will need to be reconciled in both places. 

### <a id="PatchCommitInfo" href="#PatchCommitInfo">type PatchCommitInfo struct</a>

```
searchKey: protocol.PatchCommitInfo
tags: [struct]
```

```Go
type PatchCommitInfo struct {
	Message        string
	AuthorName     string
	AuthorEmail    string
	CommitterName  string
	CommitterEmail string
	Date           time.Time
}
```

PatchCommitInfo will be used for commit information when creating a commit from a patch 

### <a id="PushConfig" href="#PushConfig">type PushConfig struct</a>

```
searchKey: protocol.PushConfig
tags: [struct]
```

```Go
type PushConfig struct {
	// RemoteURL is the git remote URL to which to push the commits.
	// The URL needs to include HTTP basic auth credentials if no
	// unauthenticated requests are allowed by the remote host.
	RemoteURL string

	// PrivateKey is used when the remote URL uses scheme `ssh`. If set,
	// this value is used as the content of the private key. Needs to be
	// set in conjunction with a passphrase.
	PrivateKey string

	// Passphrase is the passphrase to decrypt the private key. It is required
	// when passing PrivateKey.
	Passphrase string
}
```

PushConfig provides the configuration required to push one or more commits to a code host. 

### <a id="RemoteOpts" href="#RemoteOpts">type RemoteOpts struct</a>

```
searchKey: protocol.RemoteOpts
tags: [struct]
```

```Go
type RemoteOpts struct {
	SSH   *SSHConfig   `json:"ssh"`   // SSH configuration for communication with the remote
	HTTPS *HTTPSConfig `json:"https"` // HTTPS configuration for communication with the remote
}
```

RemoteOpts configures interactions with a remote repository. 

### <a id="RepoCloneProgress" href="#RepoCloneProgress">type RepoCloneProgress struct</a>

```
searchKey: protocol.RepoCloneProgress
tags: [struct]
```

```Go
type RepoCloneProgress struct {
	CloneInProgress bool   // whether the repository is currently being cloned
	CloneProgress   string // a progress message from the running clone command.
	Cloned          bool   // whether the repository has been cloned successfully
}
```

RepoCloneProgress is information about the clone progress of a repo 

### <a id="RepoCloneProgressRequest" href="#RepoCloneProgressRequest">type RepoCloneProgressRequest struct</a>

```
searchKey: protocol.RepoCloneProgressRequest
tags: [struct]
```

```Go
type RepoCloneProgressRequest struct {
	Repos []api.RepoName
}
```

RepoCloneProgressRequest is a request for information about the clone progress of multiple repositories on gitserver. 

### <a id="RepoCloneProgressResponse" href="#RepoCloneProgressResponse">type RepoCloneProgressResponse struct</a>

```
searchKey: protocol.RepoCloneProgressResponse
tags: [struct]
```

```Go
type RepoCloneProgressResponse struct {
	Results map[api.RepoName]*RepoCloneProgress
}
```

RepoCloneProgressResponse is the response to a repository clone progress request for multiple repositories at the same time. 

### <a id="RepoDeleteRequest" href="#RepoDeleteRequest">type RepoDeleteRequest struct</a>

```
searchKey: protocol.RepoDeleteRequest
tags: [struct]
```

```Go
type RepoDeleteRequest struct {
	// Repo is the repository to delete.
	Repo api.RepoName
}
```

RepoDeleteRequest is a request to delete a repository clone on gitserver 

### <a id="RepoInfo" href="#RepoInfo">type RepoInfo struct</a>

```
searchKey: protocol.RepoInfo
tags: [struct]
```

```Go
type RepoInfo struct {
	URL             string     // this repository's Git remote URL
	CloneInProgress bool       // whether the repository is currently being cloned
	CloneProgress   string     // a progress message from the running clone command.
	Cloned          bool       // whether the repository has been cloned successfully
	LastFetched     *time.Time // when the last `git remote update` or `git fetch` occurred
	LastChanged     *time.Time // timestamp of the most recent ref in the git repository

	// CloneTime is the time the clone occurred. Note: Repositories may be
	// re-cloned automatically, so this time is likely to move forward
	// periodically.
	CloneTime *time.Time
}
```

RepoInfo is the information requests about a single repository via a RepoInfoRequest. 

### <a id="RepoInfoRequest" href="#RepoInfoRequest">type RepoInfoRequest struct</a>

```
searchKey: protocol.RepoInfoRequest
tags: [struct]
```

```Go
type RepoInfoRequest struct {
	// Repos are the repositories to get information about.
	Repos []api.RepoName
}
```

RepoInfoRequest is a request for information about multiple repositories on gitserver. 

### <a id="RepoInfoResponse" href="#RepoInfoResponse">type RepoInfoResponse struct</a>

```
searchKey: protocol.RepoInfoResponse
tags: [struct]
```

```Go
type RepoInfoResponse struct {
	// Results mapping from the repository name to the repository information.
	Results map[api.RepoName]*RepoInfo
}
```

RepoInfoResponse is the response to a repository information request for multiple repositories at the same time. 

### <a id="RepoUpdateRequest" href="#RepoUpdateRequest">type RepoUpdateRequest struct</a>

```
searchKey: protocol.RepoUpdateRequest
tags: [struct]
```

```Go
type RepoUpdateRequest struct {
	Repo  api.RepoName  `json:"repo"`  // identifying URL for repo
	Since time.Duration `json:"since"` // debounce interval for queries, used only with request-repo-update
}
```

RepoUpdateRequest is a request to update the contents of a given repo, or clone it if it doesn't exist. 

### <a id="RepoUpdateResponse" href="#RepoUpdateResponse">type RepoUpdateResponse struct</a>

```
searchKey: protocol.RepoUpdateResponse
tags: [struct]
```

```Go
type RepoUpdateResponse struct {
	Cloned          bool
	CloneInProgress bool
	LastFetched     *time.Time
	LastChanged     *time.Time
	Error           string // an error reported by the update, as opposed to a protocol error
	QueueCap        int    // size of the clone queue
	QueueLen        int    // current clone operations
	// Following items likely provided only if the request specified waiting.
	Received *time.Time // time request was received by handler function
	Started  *time.Time // time request actually started processing
	Finished *time.Time // time request completed
}
```

RepoUpdateResponse returns meta information of the repo enqueued for update. 

TODO just use RepoInfoResponse? 

### <a id="ReposStats" href="#ReposStats">type ReposStats struct</a>

```
searchKey: protocol.ReposStats
tags: [struct]
```

```Go
type ReposStats struct {
	// UpdatedAt is the time these statistics were computed. If UpdateAt is
	// zero, the statistics have not yet been computed. This can happen on a
	// new gitserver.
	UpdatedAt time.Time

	// GitDirBytes is the amount of bytes stored in .git directories.
	GitDirBytes int64
}
```

ReposStats is an aggregation of statistics from a gitserver. 

### <a id="SSHConfig" href="#SSHConfig">type SSHConfig struct</a>

```
searchKey: protocol.SSHConfig
tags: [struct]
```

```Go
type SSHConfig struct {
	User       string `json:"user,omitempty"`      // SSH user (if empty, inferred from URL)
	PublicKey  []byte `json:"publicKey,omitempty"` // SSH public key (if nil, inferred from PrivateKey)
	PrivateKey []byte `json:"privateKey"`          // SSH private key, usually passed to ssh.ParsePrivateKey (passphrases currently unsupported)
}
```

SSHConfig configures and authenticates SSH for communication with remotes. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NormalizeRepo" href="#NormalizeRepo">func NormalizeRepo(input api.RepoName) api.RepoName</a>

```
searchKey: protocol.NormalizeRepo
tags: [function]
```

```Go
func NormalizeRepo(input api.RepoName) api.RepoName
```

### <a id="TestNormalizeRepo" href="#TestNormalizeRepo">func TestNormalizeRepo(t *testing.T)</a>

```
searchKey: protocol.TestNormalizeRepo
tags: [function private test]
```

```Go
func TestNormalizeRepo(t *testing.T)
```

### <a id="hasUpperASCII" href="#hasUpperASCII">func hasUpperASCII(s string) bool</a>

```
searchKey: protocol.hasUpperASCII
tags: [function private]
```

```Go
func hasUpperASCII(s string) bool
```

hasUpperASCII returns true if s contains any upper-case letters in ASCII, or if it contains any non-ascii characters. 

