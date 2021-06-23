# Package gitserver

## Index

* [Constants](#const)
    * [const RefTypeUnknown](#RefTypeUnknown)
    * [const RefTypeBranch](#RefTypeBranch)
    * [const RefTypeTag](#RefTypeTag)
* [Variables](#var)
    * [var refPrefixes](#refPrefixes)
* [Types](#type)
    * [type Client struct](#Client)
        * [func New(dbStore DBStore, observationContext *observation.Context) *Client](#New)
        * [func (c *Client) CommitExists(ctx context.Context, repositoryID int, commit string) (_ bool, err error)](#Client.CommitExists)
        * [func (c *Client) Head(ctx context.Context, repositoryID int) (_ string, err error)](#Client.Head)
        * [func (c *Client) CommitDate(ctx context.Context, repositoryID int, commit string) (_ time.Time, err error)](#Client.CommitDate)
        * [func (c *Client) CommitGraph(ctx context.Context, repositoryID int, opts CommitGraphOptions) (_ *CommitGraph, err error)](#Client.CommitGraph)
        * [func (c *Client) RefDescriptions(ctx context.Context, repositoryID int) (_ map[string]RefDescription, err error)](#Client.RefDescriptions)
        * [func (c *Client) RawContents(ctx context.Context, repositoryID int, commit, file string) (_ []byte, err error)](#Client.RawContents)
        * [func (c *Client) DirectoryChildren(ctx context.Context, repositoryID int, commit string, dirnames []string) (_ map[string][]string, err error)](#Client.DirectoryChildren)
        * [func (c *Client) FileExists(ctx context.Context, repositoryID int, commit, file string) (_ bool, err error)](#Client.FileExists)
        * [func (c *Client) ListFiles(ctx context.Context, repositoryID int, commit string, pattern *regexp.Regexp) (_ []string, err error)](#Client.ListFiles)
        * [func (c *Client) ResolveRevision(ctx context.Context, repositoryID int, versionString string) (commitID api.CommitID, err error)](#Client.ResolveRevision)
        * [func (c *Client) execGitCommand(ctx context.Context, repositoryID int, args ...string) (string, error)](#Client.execGitCommand)
        * [func (c *Client) execResolveRevGitCommand(ctx context.Context, repositoryID int, revision string, args ...string) (string, error)](#Client.execResolveRevGitCommand)
        * [func (c *Client) repositoryIDToRepo(ctx context.Context, repositoryID int) (api.RepoName, error)](#Client.repositoryIDToRepo)
    * [type CommitGraph struct](#CommitGraph)
        * [func ParseCommitGraph(lines []string) *CommitGraph](#ParseCommitGraph)
        * [func (c *CommitGraph) Graph() map[string][]string](#CommitGraph.Graph)
        * [func (c *CommitGraph) Order() []string](#CommitGraph.Order)
    * [type CommitGraphOptions struct](#CommitGraphOptions)
    * [type RefDescription struct](#RefDescription)
    * [type RefType int](#RefType)
    * [type DBStore interface](#DBStore)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
* [Functions](#func)
    * [func parseRefDescriptions(lines []string) (map[string]RefDescription, error)](#parseRefDescriptions)
    * [func TestParseCommitGraph(t *testing.T)](#TestParseCommitGraph)
    * [func TestParseCommitGraphPartial(t *testing.T)](#TestParseCommitGraphPartial)
    * [func TestParseRefDescriptions(t *testing.T)](#TestParseRefDescriptions)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="RefTypeUnknown" href="#RefTypeUnknown">const RefTypeUnknown</a>

```
searchKey: gitserver.RefTypeUnknown
```

```Go
const RefTypeUnknown RefType = iota
```

### <a id="RefTypeBranch" href="#RefTypeBranch">const RefTypeBranch</a>

```
searchKey: gitserver.RefTypeBranch
```

```Go
const RefTypeBranch
```

### <a id="RefTypeTag" href="#RefTypeTag">const RefTypeTag</a>

```
searchKey: gitserver.RefTypeTag
```

```Go
const RefTypeTag
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="refPrefixes" href="#refPrefixes">var refPrefixes</a>

```
searchKey: gitserver.refPrefixes
tags: [private]
```

```Go
var refPrefixes = map[string]RefType{
	"refs/heads/": RefTypeBranch,
	"refs/tags/":  RefTypeTag,
}
```

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
	dbStore    DBStore
	operations *operations
}
```

#### <a id="New" href="#New">func New(dbStore DBStore, observationContext *observation.Context) *Client</a>

```
searchKey: gitserver.New
```

```Go
func New(dbStore DBStore, observationContext *observation.Context) *Client
```

#### <a id="Client.CommitExists" href="#Client.CommitExists">func (c *Client) CommitExists(ctx context.Context, repositoryID int, commit string) (_ bool, err error)</a>

```
searchKey: gitserver.Client.CommitExists
```

```Go
func (c *Client) CommitExists(ctx context.Context, repositoryID int, commit string) (_ bool, err error)
```

Head determines the tip commit of the default branch for the given repository. 

#### <a id="Client.Head" href="#Client.Head">func (c *Client) Head(ctx context.Context, repositoryID int) (_ string, err error)</a>

```
searchKey: gitserver.Client.Head
```

```Go
func (c *Client) Head(ctx context.Context, repositoryID int) (_ string, err error)
```

Head determines the tip commit of the default branch for the given repository. 

#### <a id="Client.CommitDate" href="#Client.CommitDate">func (c *Client) CommitDate(ctx context.Context, repositoryID int, commit string) (_ time.Time, err error)</a>

```
searchKey: gitserver.Client.CommitDate
```

```Go
func (c *Client) CommitDate(ctx context.Context, repositoryID int, commit string) (_ time.Time, err error)
```

CommitDate returns the time that the given commit was committed. 

#### <a id="Client.CommitGraph" href="#Client.CommitGraph">func (c *Client) CommitGraph(ctx context.Context, repositoryID int, opts CommitGraphOptions) (_ *CommitGraph, err error)</a>

```
searchKey: gitserver.Client.CommitGraph
```

```Go
func (c *Client) CommitGraph(ctx context.Context, repositoryID int, opts CommitGraphOptions) (_ *CommitGraph, err error)
```

CommitGraph returns the commit graph for the given repository as a mapping from a commit to its parents. If a commit is supplied, the returned graph will be rooted at the given commit. If a non-zero limit is supplied, at most that many commits will be returned. 

#### <a id="Client.RefDescriptions" href="#Client.RefDescriptions">func (c *Client) RefDescriptions(ctx context.Context, repositoryID int) (_ map[string]RefDescription, err error)</a>

```
searchKey: gitserver.Client.RefDescriptions
```

```Go
func (c *Client) RefDescriptions(ctx context.Context, repositoryID int) (_ map[string]RefDescription, err error)
```

RefDescriptions returns a map from commits to descriptions of the tip of each branch and tag of the given repository. 

#### <a id="Client.RawContents" href="#Client.RawContents">func (c *Client) RawContents(ctx context.Context, repositoryID int, commit, file string) (_ []byte, err error)</a>

```
searchKey: gitserver.Client.RawContents
```

```Go
func (c *Client) RawContents(ctx context.Context, repositoryID int, commit, file string) (_ []byte, err error)
```

RawContents returns the contents of a file in a particular commit of a repository. 

#### <a id="Client.DirectoryChildren" href="#Client.DirectoryChildren">func (c *Client) DirectoryChildren(ctx context.Context, repositoryID int, commit string, dirnames []string) (_ map[string][]string, err error)</a>

```
searchKey: gitserver.Client.DirectoryChildren
```

```Go
func (c *Client) DirectoryChildren(ctx context.Context, repositoryID int, commit string, dirnames []string) (_ map[string][]string, err error)
```

DirectoryChildren determines all children known to git for the given directory names via an invocation of git ls-tree. The keys of the resulting map are the input (unsanitized) dirnames, and the value of that key are the files nested under that directory. 

#### <a id="Client.FileExists" href="#Client.FileExists">func (c *Client) FileExists(ctx context.Context, repositoryID int, commit, file string) (_ bool, err error)</a>

```
searchKey: gitserver.Client.FileExists
```

```Go
func (c *Client) FileExists(ctx context.Context, repositoryID int, commit, file string) (_ bool, err error)
```

FileExists determines whether a file exists in a particular commit of a repository. 

#### <a id="Client.ListFiles" href="#Client.ListFiles">func (c *Client) ListFiles(ctx context.Context, repositoryID int, commit string, pattern *regexp.Regexp) (_ []string, err error)</a>

```
searchKey: gitserver.Client.ListFiles
```

```Go
func (c *Client) ListFiles(ctx context.Context, repositoryID int, commit string, pattern *regexp.Regexp) (_ []string, err error)
```

ListFiles returns a list of root-relative file paths matching the given pattern in a particular commit of a repository. 

#### <a id="Client.ResolveRevision" href="#Client.ResolveRevision">func (c *Client) ResolveRevision(ctx context.Context, repositoryID int, versionString string) (commitID api.CommitID, err error)</a>

```
searchKey: gitserver.Client.ResolveRevision
```

```Go
func (c *Client) ResolveRevision(ctx context.Context, repositoryID int, versionString string) (commitID api.CommitID, err error)
```

ResolveRevision returns the absolute commit for a commit-ish spec. 

#### <a id="Client.execGitCommand" href="#Client.execGitCommand">func (c *Client) execGitCommand(ctx context.Context, repositoryID int, args ...string) (string, error)</a>

```
searchKey: gitserver.Client.execGitCommand
tags: [private]
```

```Go
func (c *Client) execGitCommand(ctx context.Context, repositoryID int, args ...string) (string, error)
```

execGitCommand executes a git command for the given repository by identifier. 

#### <a id="Client.execResolveRevGitCommand" href="#Client.execResolveRevGitCommand">func (c *Client) execResolveRevGitCommand(ctx context.Context, repositoryID int, revision string, args ...string) (string, error)</a>

```
searchKey: gitserver.Client.execResolveRevGitCommand
tags: [private]
```

```Go
func (c *Client) execResolveRevGitCommand(ctx context.Context, repositoryID int, revision string, args ...string) (string, error)
```

execResolveRevGitCommand executes a git command for the given repository by identifier if the given revision is resolvable prior to running the command. 

#### <a id="Client.repositoryIDToRepo" href="#Client.repositoryIDToRepo">func (c *Client) repositoryIDToRepo(ctx context.Context, repositoryID int) (api.RepoName, error)</a>

```
searchKey: gitserver.Client.repositoryIDToRepo
tags: [private]
```

```Go
func (c *Client) repositoryIDToRepo(ctx context.Context, repositoryID int) (api.RepoName, error)
```

repositoryIDToRepo creates a api.RepoName from a repository identifier. 

### <a id="CommitGraph" href="#CommitGraph">type CommitGraph struct</a>

```
searchKey: gitserver.CommitGraph
```

```Go
type CommitGraph struct {
	graph map[string][]string
	order []string
}
```

#### <a id="ParseCommitGraph" href="#ParseCommitGraph">func ParseCommitGraph(lines []string) *CommitGraph</a>

```
searchKey: gitserver.ParseCommitGraph
```

```Go
func ParseCommitGraph(lines []string) *CommitGraph
```

ParseCommitGraph converts the output of git log into a map from commits to parent commits, and a topological ordering of commits such that parents come before children. If a commit is listed but has no ancestors then its parent slice is empty, but is still present in the map and the ordering. If the ordering is to be correct, the git log output must be formatted with --topo-order. 

#### <a id="CommitGraph.Graph" href="#CommitGraph.Graph">func (c *CommitGraph) Graph() map[string][]string</a>

```
searchKey: gitserver.CommitGraph.Graph
```

```Go
func (c *CommitGraph) Graph() map[string][]string
```

#### <a id="CommitGraph.Order" href="#CommitGraph.Order">func (c *CommitGraph) Order() []string</a>

```
searchKey: gitserver.CommitGraph.Order
```

```Go
func (c *CommitGraph) Order() []string
```

### <a id="CommitGraphOptions" href="#CommitGraphOptions">type CommitGraphOptions struct</a>

```
searchKey: gitserver.CommitGraphOptions
```

```Go
type CommitGraphOptions struct {
	Commit  string
	AllRefs bool
	Limit   int
	Since   *time.Time
}
```

### <a id="RefDescription" href="#RefDescription">type RefDescription struct</a>

```
searchKey: gitserver.RefDescription
```

```Go
type RefDescription struct {
	Name            string
	Type            RefType
	IsDefaultBranch bool
	CreatedDate     time.Time
}
```

RefDescription describes a commit at the head of a branch or tag. 

### <a id="RefType" href="#RefType">type RefType int</a>

```
searchKey: gitserver.RefType
```

```Go
type RefType int
```

### <a id="DBStore" href="#DBStore">type DBStore interface</a>

```
searchKey: gitserver.DBStore
```

```Go
type DBStore interface {
	RepoName(ctx context.Context, repositoryID int) (string, error)
}
```

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: gitserver.operations
tags: [private]
```

```Go
type operations struct {
	commitDate        *observation.Operation
	commitExists      *observation.Operation
	commitGraph       *observation.Operation
	directoryChildren *observation.Operation
	fileExists        *observation.Operation
	head              *observation.Operation
	listFiles         *observation.Operation
	rawContents       *observation.Operation
	refDescriptions   *observation.Operation
	resolveRevision   *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context) *operations</a>

```
searchKey: gitserver.newOperations
tags: [private]
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="parseRefDescriptions" href="#parseRefDescriptions">func parseRefDescriptions(lines []string) (map[string]RefDescription, error)</a>

```
searchKey: gitserver.parseRefDescriptions
tags: [private]
```

```Go
func parseRefDescriptions(lines []string) (map[string]RefDescription, error)
```

parseRefDescriptions converts the output of the for-each-ref command in the RefDescriptions method to a map from commits to RefDescription objects. Each line should conform to the format string `%(objectname):%(refname):%(HEAD):%(creatordate)`, where 

- %(objectname) is the 40-character revhash - %(refname) is the name of the tag or branch (prefixed with refs/heads/ or ref/tags/) - %(HEAD) is `*` if the branch is the default branch (and whitesace otherwise) - %(creatordate) is the ISO-formatted date the object was created 

### <a id="TestParseCommitGraph" href="#TestParseCommitGraph">func TestParseCommitGraph(t *testing.T)</a>

```
searchKey: gitserver.TestParseCommitGraph
tags: [private]
```

```Go
func TestParseCommitGraph(t *testing.T)
```

### <a id="TestParseCommitGraphPartial" href="#TestParseCommitGraphPartial">func TestParseCommitGraphPartial(t *testing.T)</a>

```
searchKey: gitserver.TestParseCommitGraphPartial
tags: [private]
```

```Go
func TestParseCommitGraphPartial(t *testing.T)
```

### <a id="TestParseRefDescriptions" href="#TestParseRefDescriptions">func TestParseRefDescriptions(t *testing.T)</a>

```
searchKey: gitserver.TestParseRefDescriptions
tags: [private]
```

```Go
func TestParseRefDescriptions(t *testing.T)
```

