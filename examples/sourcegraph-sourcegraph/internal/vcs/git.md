# Package git

## Index

* [Constants](#const)
    * [const partsPerCommit](#partsPerCommit)
    * [const logFormatWithRefs](#logFormatWithRefs)
    * [const logFormatWithoutRefs](#logFormatWithoutRefs)
    * [const ModeSubmodule](#ModeSubmodule)
    * [const DevNullSHA](#DevNullSHA)
    * [const ObjectTypeCommit](#ObjectTypeCommit)
    * [const ObjectTypeTag](#ObjectTypeTag)
    * [const ObjectTypeTree](#ObjectTypeTree)
    * [const ObjectTypeBlob](#ObjectTypeBlob)
* [Variables](#var)
    * [var logEntryPattern](#logEntryPattern)
    * [var recordGetCommitQueries](#recordGetCommitQueries)
    * [var runCommitLog](#runCommitLog)
    * [var errLogOnelineBatchScannerClosed](#errLogOnelineBatchScannerClosed)
    * [var validRawLogDiffSearchFormatArgs](#validRawLogDiffSearchFormatArgs)
    * [var gitCmdAllowlist](#gitCmdAllowlist)
    * [var gitCommonAllowlist](#gitCommonAllowlist)
    * [var Mocks](#Mocks)
    * [var emptyMocks](#emptyMocks)
    * [var invalidBranch](#invalidBranch)
    * [var lsTreeRootCacheMu](#lsTreeRootCacheMu)
    * [var lsTreeRootCache](#lsTreeRootCache)
    * [var root](#root)
    * [var Times](#Times)
    * [var NonExistentCommitID](#NonExistentCommitID)
* [Types](#type)
    * [type BlameOptions struct](#BlameOptions)
    * [type Hunk struct](#Hunk)
    * [type blobReader struct](#blobReader)
        * [func newBlobReader(ctx context.Context, repo api.RepoName, commit api.CommitID, name string) (*blobReader, error)](#newBlobReader)
        * [func (br *blobReader) Read(p []byte) (int, error)](#blobReader.Read)
        * [func (br *blobReader) Close() error](#blobReader.Close)
        * [func (br *blobReader) convertError(err error) error](#blobReader.convertError)
    * [type Commit struct](#Commit)
        * [func getCommit(ctx context.Context, repo api.RepoName, id api.CommitID, opt ResolveRevisionOptions) (_ *Commit, err error)](#getCommit)
        * [func GetCommit(ctx context.Context, repo api.RepoName, id api.CommitID, opt ResolveRevisionOptions) (*Commit, error)](#GetCommit)
        * [func FirstEverCommit(ctx context.Context, repo api.RepoName) (*Commit, error)](#FirstEverCommit)
        * [func FindNearestCommit(ctx context.Context, repoName api.RepoName, revSpec string, target time.Time) (*Commit, error)](#FindNearestCommit)
        * [func parseCommitFromLog(data []byte) (commit *Commit, refs []string, rest []byte, err error)](#parseCommitFromLog)
    * [type Message string](#Message)
        * [func (m Message) Subject() string](#Message.Subject)
        * [func (m Message) Body() string](#Message.Body)
    * [type Signature struct](#Signature)
    * [type CommitsOptions struct](#CommitsOptions)
    * [type onelineCommit struct](#onelineCommit)
    * [type DiffOptions struct](#DiffOptions)
    * [type DiffFileIterator struct](#DiffFileIterator)
        * [func Diff(ctx context.Context, opts DiffOptions) (*DiffFileIterator, error)](#Diff)
        * [func (i *DiffFileIterator) Close() error](#DiffFileIterator.Close)
        * [func (i *DiffFileIterator) Next() (*diff.FileDiff, error)](#DiffFileIterator.Next)
    * [type diffHunkLineInfo struct](#diffHunkLineInfo)
        * [func (info diffHunkLineInfo) changed() bool](#diffHunkLineInfo.changed)
    * [type TextSearchOptions struct](#TextSearchOptions)
    * [type PathOptions struct](#PathOptions)
    * [type RawLogDiffSearchOptions struct](#RawLogDiffSearchOptions)
    * [type LogCommitSearchResult struct](#LogCommitSearchResult)
    * [type LogCommitSearchEvent struct](#LogCommitSearchEvent)
    * [type RawDiff struct](#RawDiff)
    * [type Highlight struct](#Highlight)
    * [type refResolveCache struct](#refResolveCache)
        * [func (r *refResolveCache) resolveHEADSymbolicRef(ctx context.Context, repo api.RepoName) (target string, err error)](#refResolveCache.resolveHEADSymbolicRef)
    * [type cmdFunc func(args []string) github.com/sourcegraph/sourcegraph/internal/vcs/git.cmd](#cmdFunc)
        * [func gitserverCmdFunc(repo api.RepoName) cmdFunc](#gitserverCmdFunc)
    * [type cmd interface](#cmd)
    * [type Submodule struct](#Submodule)
    * [type ObjectInfo interface](#ObjectInfo)
    * [type objectInfo git.OID](#objectInfo)
        * [func (oid objectInfo) OID() OID](#objectInfo.OID)
    * [type OID [20]byte](#OID)
        * [func GetObject(ctx context.Context, repo api.RepoName, objectName string) (oid OID, objectType ObjectType, err error)](#GetObject)
        * [func decodeOID(sha string) (OID, error)](#decodeOID)
        * [func (oid OID) String() string](#OID.String)
    * [type ObjectType string](#ObjectType)
    * [type RefGlob struct](#RefGlob)
    * [type RefGlobs []git.compiledRefGlobPattern](#RefGlobs)
        * [func CompileRefGlobs(globs []RefGlob) (RefGlobs, error)](#CompileRefGlobs)
        * [func (gs RefGlobs) Match(ref string) bool](#RefGlobs.Match)
    * [type compiledRefGlobPattern struct](#compiledRefGlobPattern)
    * [type Branch struct](#Branch)
    * [type BranchesOptions struct](#BranchesOptions)
    * [type Tag struct](#Tag)
    * [type BehindAhead struct](#BehindAhead)
        * [func GetBehindAhead(ctx context.Context, repo api.RepoName, left, right string) (*BehindAhead, error)](#GetBehindAhead)
    * [type Branches []*git.Branch](#Branches)
        * [func (p Branches) Len() int](#Branches.Len)
        * [func (p Branches) Less(i, j int) bool](#Branches.Less)
        * [func (p Branches) Swap(i, j int)](#Branches.Swap)
    * [type ByAuthorDate []*git.Branch](#ByAuthorDate)
        * [func (p ByAuthorDate) Len() int](#ByAuthorDate.Len)
        * [func (p ByAuthorDate) Less(i, j int) bool](#ByAuthorDate.Less)
        * [func (p ByAuthorDate) Swap(i, j int)](#ByAuthorDate.Swap)
    * [type Tags []*git.Tag](#Tags)
        * [func (p Tags) Len() int](#Tags.Len)
        * [func (p Tags) Less(i, j int) bool](#Tags.Less)
        * [func (p Tags) Swap(i, j int)](#Tags.Swap)
    * [type branchFilter map[string]struct{}](#branchFilter)
        * [func (f branchFilter) allows(name string) bool](#branchFilter.allows)
        * [func (f branchFilter) add(list []string)](#branchFilter.add)
    * [type byteSlices [][]byte](#byteSlices)
        * [func (p byteSlices) Len() int](#byteSlices.Len)
        * [func (p byteSlices) Less(i, j int) bool](#byteSlices.Less)
        * [func (p byteSlices) Swap(i, j int)](#byteSlices.Swap)
    * [type Ref struct](#Ref)
    * [type ResolveRevisionOptions struct](#ResolveRevisionOptions)
    * [type BadCommitError struct](#BadCommitError)
        * [func (e BadCommitError) Error() string](#BadCommitError.Error)
    * [type ShortLogOptions struct](#ShortLogOptions)
    * [type PersonCount struct](#PersonCount)
        * [func (p *PersonCount) String() string](#PersonCount.String)
    * [type closer bool](#closer)
        * [func (c *closer) Read(p []byte) (int, error)](#closer.Read)
        * [func (c *closer) Close() error](#closer.Close)
* [Functions](#func)
    * [func BlameFile(ctx context.Context, repo api.RepoName, path string, opt *BlameOptions) ([]*Hunk, error)](#BlameFile)
    * [func blameFileCmd(ctx context.Context, command cmdFunc, path string, opt *BlameOptions) ([]*Hunk, error)](#blameFileCmd)
    * [func ReadFile(ctx context.Context, repo api.RepoName, commit api.CommitID, name string, maxBytes int64) ([]byte, error)](#ReadFile)
    * [func NewFileReader(ctx context.Context, repo api.RepoName, commit api.CommitID, name string) (io.ReadCloser, error)](#NewFileReader)
    * [func readFileBytes(ctx context.Context, repo api.RepoName, commit api.CommitID, name string, maxBytes int64) ([]byte, error)](#readFileBytes)
    * [func Commits(ctx context.Context, repo api.RepoName, opt CommitsOptions) ([]*Commit, error)](#Commits)
    * [func HasCommitAfter(ctx context.Context, repo api.RepoName, date string, revspec string) (bool, error)](#HasCommitAfter)
    * [func isBadObjectErr(output, obj string) bool](#isBadObjectErr)
    * [func commitLog(ctx context.Context, repo api.RepoName, opt CommitsOptions) (commits []*Commit, err error)](#commitLog)
    * [func commitLogArgs(initialArgs []string, opt CommitsOptions) (args []string, err error)](#commitLogArgs)
    * [func CommitCount(ctx context.Context, repo api.RepoName, opt CommitsOptions) (uint, error)](#CommitCount)
    * [func logOnelineBatchScanner(scan func() (*onelineCommit, error), maxBatchSize int, debounce time.Duration) (next func() ([]*onelineCommit, error), cleanup func())](#logOnelineBatchScanner)
    * [func logOnelineScanner(r io.Reader) func() (*onelineCommit, error)](#logOnelineScanner)
    * [func compilePathMatcher(options PathOptions) (pathmatch.PathMatcher, error)](#compilePathMatcher)
    * [func filterAndHighlightDiff(rawDiff []byte, query *regexp.Regexp, onlyMatchingHunks bool, pathMatcher pathmatch.PathMatcher) (_ []byte, _ []Highlight, err error)](#filterAndHighlightDiff)
    * [func truncateLongLines(data []byte, maxCharsPerLine int) []byte](#truncateLongLines)
    * [func diffHunkLineStatus(line []byte) (added, removed bool)](#diffHunkLineStatus)
    * [func computeDiffHunkInfo(lines [][]byte, query *regexp.Regexp, matchContextLines int) []diffHunkLineInfo](#computeDiffHunkInfo)
    * [func splitHunkMatches(hunks []*diff.Hunk, query *regexp.Regexp, matchContextLines, maxLinesPerHunk int) (results []*diff.Hunk)](#splitHunkMatches)
    * [func CompilePathMatcher(options PathOptions) (pathmatch.PathMatcher, error)](#CompilePathMatcher)
    * [func isValidRawLogDiffSearchFormatArgs(formatArgs []string) bool](#isValidRawLogDiffSearchFormatArgs)
    * [func RawLogDiffSearch(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions) (results []*LogCommitSearchResult, complete bool, err error)](#RawLogDiffSearch)
    * [func RawLogDiffSearchStream(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions) <-chan LogCommitSearchEvent](#RawLogDiffSearchStream)
    * [func doLogDiffSearchStream(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions, c chan LogCommitSearchEvent) (complete bool, err error)](#doLogDiffSearchStream)
    * [func rawLogSearchCmd(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions) (*gitserver.Cmd, error)](#rawLogSearchCmd)
    * [func rawShowSearch(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions, cache *refResolveCache, onelineCommits []*onelineCommit) (results []*LogCommitSearchResult, complete bool, err error)](#rawShowSearch)
    * [func logDiffCommonArgs(opt RawLogDiffSearchOptions) []string](#logDiffCommonArgs)
    * [func filterAndResolveRefs(ctx context.Context, repo api.RepoName, refs []string, cache *refResolveCache) ([]string, error)](#filterAndResolveRefs)
    * [func deadlineLabel(ctx context.Context) string](#deadlineLabel)
    * [func regexpToGlobBestEffort(p string) (glob string, equiv bool)](#regexpToGlobBestEffort)
    * [func globQuoteMeta(s []rune) string](#globQuoteMeta)
    * [func checkSpecArgSafety(spec string) error](#checkSpecArgSafety)
    * [func ExecSafe(ctx context.Context, repo api.RepoName, params []string) (stdout, stderr []byte, exitCode int, err error)](#ExecSafe)
    * [func ExecReader(ctx context.Context, repo api.RepoName, args []string) (io.ReadCloser, error)](#ExecReader)
    * [func readUntilTimeout(ctx context.Context, cmd *gitserver.Cmd) ([]byte, bool, error)](#readUntilTimeout)
    * [func isAllowedGitArg(allowedArgs []string, arg string) bool](#isAllowedGitArg)
    * [func isAllowedGitCmd(args []string) bool](#isAllowedGitCmd)
    * [func MergeBase(ctx context.Context, repo api.RepoName, a, b api.CommitID) (api.CommitID, error)](#MergeBase)
    * [func ResetMocks()](#ResetMocks)
    * [func HumanReadableBranchName(text string) string](#HumanReadableBranchName)
    * [func EnsureRefPrefix(ref string) string](#EnsureRefPrefix)
    * [func AbbreviateRef(ref string) string](#AbbreviateRef)
    * [func ListBranches(ctx context.Context, repo api.RepoName, opt BranchesOptions) ([]*Branch, error)](#ListBranches)
    * [func branches(ctx context.Context, repo api.RepoName, args ...string) ([]string, error)](#branches)
    * [func ListTags(ctx context.Context, repo api.RepoName) ([]*Tag, error)](#ListTags)
    * [func parseTags(in []byte) ([]*Tag, error)](#parseTags)
    * [func ListRefs(ctx context.Context, repo api.RepoName) ([]Ref, error)](#ListRefs)
    * [func showRef(ctx context.Context, repo api.RepoName, args ...string) ([]Ref, error)](#showRef)
    * [func ValidateBranchName(branch string) bool](#ValidateBranchName)
    * [func IsAbsoluteRevision(s string) bool](#IsAbsoluteRevision)
    * [func ensureAbsoluteCommit(commitID api.CommitID) error](#ensureAbsoluteCommit)
    * [func ResolveRevision(ctx context.Context, repo api.RepoName, spec string, opt ResolveRevisionOptions) (api.CommitID, error)](#ResolveRevision)
    * [func runRevParse(ctx context.Context, cmd *gitserver.Cmd, spec string) (api.CommitID, error)](#runRevParse)
    * [func ShortLog(ctx context.Context, repo api.RepoName, opt ShortLogOptions) ([]*PersonCount, error)](#ShortLog)
    * [func parseShortLog(out []byte) ([]*PersonCount, error)](#parseShortLog)
    * [func lenientParseAddress(address string) (*mail.Address, error)](#lenientParseAddress)
    * [func Lstat(ctx context.Context, repo api.RepoName, commit api.CommitID, path string) (fs.FileInfo, error)](#Lstat)
    * [func Stat(ctx context.Context, repo api.RepoName, commit api.CommitID, path string) (fs.FileInfo, error)](#Stat)
    * [func ReadDir(ctx context.Context, repo api.RepoName, commit api.CommitID, path string, recurse bool) ([]fs.FileInfo, error)](#ReadDir)
    * [func LsFiles(ctx context.Context, repo api.RepoName, commit api.CommitID) ([]string, error)](#LsFiles)
    * [func lsTree(ctx context.Context, repo api.RepoName, commit api.CommitID, path string, recurse bool) ([]fs.FileInfo, error)](#lsTree)
    * [func lsTreeUncached(ctx context.Context, repo api.RepoName, commit api.CommitID, path string, recurse bool) ([]fs.FileInfo, error)](#lsTreeUncached)
    * [func TestRepository_BlameFile(t *testing.T)](#TestRepository_BlameFile)
    * [func TestRead(t *testing.T)](#TestRead)
    * [func TestRepository_GetCommit(t *testing.T)](#TestRepository_GetCommit)
    * [func TestRepository_HasCommitAfter(t *testing.T)](#TestRepository_HasCommitAfter)
    * [func TestRepository_FirstEverCommit(t *testing.T)](#TestRepository_FirstEverCommit)
    * [func TestRepository_FindNearestCommit(t *testing.T)](#TestRepository_FindNearestCommit)
    * [func TestRepository_Commits(t *testing.T)](#TestRepository_Commits)
    * [func TestRepository_Commits_options(t *testing.T)](#TestRepository_Commits_options)
    * [func TestRepository_Commits_options_path(t *testing.T)](#TestRepository_Commits_options_path)
    * [func TestLogOnelineBatchScanner_batchclosed(t *testing.T)](#TestLogOnelineBatchScanner_batchclosed)
    * [func TestLogOnelineBatchScanner_closed(t *testing.T)](#TestLogOnelineBatchScanner_closed)
    * [func TestLogOnelineBatchScanner_debounce(t *testing.T)](#TestLogOnelineBatchScanner_debounce)
    * [func TestLogOnelineBatchScanner_empty(t *testing.T)](#TestLogOnelineBatchScanner_empty)
    * [func TestLogOnelineBatchScanner_small(t *testing.T)](#TestLogOnelineBatchScanner_small)
    * [func TestMessage(t *testing.T)](#TestMessage)
    * [func TestFilterAndHighlightDiff(t *testing.T)](#TestFilterAndHighlightDiff)
    * [func TestSplitHunkMatches(t *testing.T)](#TestSplitHunkMatches)
    * [func TestTruncateLongLines(t *testing.T)](#TestTruncateLongLines)
    * [func TestRepository_RawLogDiffSearch(t *testing.T)](#TestRepository_RawLogDiffSearch)
    * [func TestRepository_RawLogDiffSearch_empty(t *testing.T)](#TestRepository_RawLogDiffSearch_empty)
    * [func TestRegexpToGlobBestEffort(t *testing.T)](#TestRegexpToGlobBestEffort)
    * [func TestDiff(t *testing.T)](#TestDiff)
    * [func TestDiffFileIterator(t *testing.T)](#TestDiffFileIterator)
    * [func TestExecSafe(t *testing.T)](#TestExecSafe)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func init()](#init.main_test.go)
    * [func AsJSON(v interface{}) string](#AsJSON)
    * [func InitGitRepository(t testing.TB, cmds ...string) string](#InitGitRepository)
    * [func GitCommand(dir, name string, args ...string) *exec.Cmd](#GitCommand)
    * [func MakeGitRepository(t testing.TB, cmds ...string) api.RepoName](#MakeGitRepository)
    * [func CommitsEqual(a, b *Commit) bool](#CommitsEqual)
    * [func MustParseTime(layout, value string) time.Time](#MustParseTime)
    * [func AppleTime(t string) string](#AppleTime)
    * [func ComputeCommitHash(repoDir string, git bool) string](#ComputeCommitHash)
    * [func TestMerger_MergeBase(t *testing.T)](#TestMerger_MergeBase)
    * [func TestGetObject(t *testing.T)](#TestGetObject)
    * [func TestRefGlobs(t *testing.T)](#TestRefGlobs)
    * [func TestHumanReadableBranchName(t *testing.T)](#TestHumanReadableBranchName)
    * [func TestRepository_ListBranches(t *testing.T)](#TestRepository_ListBranches)
    * [func TestRepository_Branches_MergedInto(t *testing.T)](#TestRepository_Branches_MergedInto)
    * [func TestRepository_Branches_ContainsCommit(t *testing.T)](#TestRepository_Branches_ContainsCommit)
    * [func TestRepository_Branches_BehindAheadCounts(t *testing.T)](#TestRepository_Branches_BehindAheadCounts)
    * [func TestRepository_Branches_IncludeCommit(t *testing.T)](#TestRepository_Branches_IncludeCommit)
    * [func TestRepository_ListTags(t *testing.T)](#TestRepository_ListTags)
    * [func TestRepository_parseTags_WithoutCreatorDate(t *testing.T)](#TestRepository_parseTags_WithoutCreatorDate)
    * [func TestValidateBranchName(t *testing.T)](#TestValidateBranchName)
    * [func TestIsAbsoluteRevision(t *testing.T)](#TestIsAbsoluteRevision)
    * [func TestRepository_ResolveBranch(t *testing.T)](#TestRepository_ResolveBranch)
    * [func TestRepository_ResolveBranch_error(t *testing.T)](#TestRepository_ResolveBranch_error)
    * [func TestRepository_ResolveTag(t *testing.T)](#TestRepository_ResolveTag)
    * [func TestRepository_ResolveTag_error(t *testing.T)](#TestRepository_ResolveTag_error)
    * [func TestParseShortLog(t *testing.T)](#TestParseShortLog)
    * [func TestRepository_FileSystem_Symlinks(t *testing.T)](#TestRepository_FileSystem_Symlinks)
    * [func TestRepository_FileSystem(t *testing.T)](#TestRepository_FileSystem)
    * [func TestRepository_FileSystem_quoteChars(t *testing.T)](#TestRepository_FileSystem_quoteChars)
    * [func TestRepository_FileSystem_gitSubmodules(t *testing.T)](#TestRepository_FileSystem_gitSubmodules)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="partsPerCommit" href="#partsPerCommit">const partsPerCommit</a>

```
searchKey: git.partsPerCommit
tags: [private]
```

```Go
const partsPerCommit = 10 // number of \x00-separated fields per commit

```

### <a id="logFormatWithRefs" href="#logFormatWithRefs">const logFormatWithRefs</a>

```
searchKey: git.logFormatWithRefs
tags: [private]
```

```Go
const logFormatWithRefs = ...
```

include refs (slow on repos with many refs) 

### <a id="logFormatWithoutRefs" href="#logFormatWithoutRefs">const logFormatWithoutRefs</a>

```
searchKey: git.logFormatWithoutRefs
tags: [private]
```

```Go
const logFormatWithoutRefs = ...
```

don't include refs (faster, should be used if refs are not needed) 

### <a id="ModeSubmodule" href="#ModeSubmodule">const ModeSubmodule</a>

```
searchKey: git.ModeSubmodule
```

```Go
const ModeSubmodule = 0160000 | os.ModeDevice
```

ModeSubmodule is an os.FileMode mask indicating that the file is a Git submodule. 

To avoid being reported as a regular file mode by (os.FileMode).IsRegular, it sets other bits (os.ModeDevice) beyond the Git "160000" commit mode bits. The choice of os.ModeDevice is arbitrary. 

### <a id="DevNullSHA" href="#DevNullSHA">const DevNullSHA</a>

```
searchKey: git.DevNullSHA
```

```Go
const DevNullSHA = "4b825dc642cb6eb9a060e54bf8d69288fbee4904"
```

4b825dc642cb6eb9a060e54bf8d69288fbee4904 is `git hash-object -t tree /dev/null`, which is used as the base when computing the `git diff` of the root commit. 

### <a id="ObjectTypeCommit" href="#ObjectTypeCommit">const ObjectTypeCommit</a>

```
searchKey: git.ObjectTypeCommit
```

```Go
const ObjectTypeCommit ObjectType = "commit"
```

Standard Git object types. 

### <a id="ObjectTypeTag" href="#ObjectTypeTag">const ObjectTypeTag</a>

```
searchKey: git.ObjectTypeTag
```

```Go
const ObjectTypeTag ObjectType = "tag"
```

Standard Git object types. 

### <a id="ObjectTypeTree" href="#ObjectTypeTree">const ObjectTypeTree</a>

```
searchKey: git.ObjectTypeTree
```

```Go
const ObjectTypeTree ObjectType = "tree"
```

Standard Git object types. 

### <a id="ObjectTypeBlob" href="#ObjectTypeBlob">const ObjectTypeBlob</a>

```
searchKey: git.ObjectTypeBlob
```

```Go
const ObjectTypeBlob ObjectType = "blob"
```

Standard Git object types. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="logEntryPattern" href="#logEntryPattern">var logEntryPattern</a>

```
searchKey: git.logEntryPattern
tags: [private]
```

```Go
var logEntryPattern = lazyregexp.New(`^\s*([0-9]+)\s+(.*)$`)
```

logEntryPattern is the regexp pattern that matches entries in the output of the `git shortlog -sne` command. 

### <a id="recordGetCommitQueries" href="#recordGetCommitQueries">var recordGetCommitQueries</a>

```
searchKey: git.recordGetCommitQueries
tags: [private]
```

```Go
var recordGetCommitQueries = os.Getenv("RECORD_GET_COMMIT_QUERIES") == "1"
```

### <a id="runCommitLog" href="#runCommitLog">var runCommitLog</a>

```
searchKey: git.runCommitLog
tags: [private]
```

```Go
var runCommitLog = ...
```

runCommitLog sends the git command to gitserver. It interprets missing revision responses and converts them into RevisionNotFoundError. It is declared as a variable so that we can swap it out in tests 

### <a id="errLogOnelineBatchScannerClosed" href="#errLogOnelineBatchScannerClosed">var errLogOnelineBatchScannerClosed</a>

```
searchKey: git.errLogOnelineBatchScannerClosed
tags: [private]
```

```Go
var errLogOnelineBatchScannerClosed = errors.New("logOnelineBatchScanner closed")
```

errLogOnelineBatchScannerClosed is returned if a read is attempted on a closed logOnelineBatchScanner. 

### <a id="validRawLogDiffSearchFormatArgs" href="#validRawLogDiffSearchFormatArgs">var validRawLogDiffSearchFormatArgs</a>

```
searchKey: git.validRawLogDiffSearchFormatArgs
tags: [private]
```

```Go
var validRawLogDiffSearchFormatArgs = ...
```

### <a id="gitCmdAllowlist" href="#gitCmdAllowlist">var gitCmdAllowlist</a>

```
searchKey: git.gitCmdAllowlist
tags: [private]
```

```Go
var gitCmdAllowlist = ...
```

gitCmdAllowlist are commands and arguments that are allowed to execute when calling ExecSafe. 

### <a id="gitCommonAllowlist" href="#gitCommonAllowlist">var gitCommonAllowlist</a>

```
searchKey: git.gitCommonAllowlist
tags: [private]
```

```Go
var gitCommonAllowlist = ...
```

`git log`, `git show`, `git diff`, etc., share a large common set of allowed args. 

### <a id="Mocks" href="#Mocks">var Mocks</a>

```
searchKey: git.Mocks
```

```Go
var Mocks, emptyMocks struct {
	GetCommit        func(api.CommitID) (*Commit, error)
	ExecSafe         func(params []string) (stdout, stderr []byte, exitCode int, err error)
	ExecReader       func(args []string) (reader io.ReadCloser, err error)
	RawLogDiffSearch func(opt RawLogDiffSearchOptions) ([]*LogCommitSearchResult, bool, error)
	NewFileReader    func(commit api.CommitID, name string) (io.ReadCloser, error)
	ReadFile         func(commit api.CommitID, name string) ([]byte, error)
	ReadDir          func(commit api.CommitID, name string, recurse bool) ([]fs.FileInfo, error)
	LsFiles          func(repo api.RepoName, commit api.CommitID) ([]string, error)
	ResolveRevision  func(spec string, opt ResolveRevisionOptions) (api.CommitID, error)
	Stat             func(commit api.CommitID, name string) (fs.FileInfo, error)
	GetObject        func(objectName string) (OID, ObjectType, error)
	Commits          func(repo api.RepoName, opt CommitsOptions) ([]*Commit, error)
	MergeBase        func(repo api.RepoName, a, b api.CommitID) (api.CommitID, error)
} = ...
```

Mocks is used to mock behavior in tests. Tests must call ResetMocks() when finished to ensure its mocks are not (inadvertently) used by subsequent tests. 

(The emptyMocks is used by ResetMocks to zero out Mocks without needing to use a named type.) 

### <a id="emptyMocks" href="#emptyMocks">var emptyMocks</a>

```
searchKey: git.emptyMocks
tags: [private]
```

```Go
var Mocks, emptyMocks struct {
	GetCommit        func(api.CommitID) (*Commit, error)
	ExecSafe         func(params []string) (stdout, stderr []byte, exitCode int, err error)
	ExecReader       func(args []string) (reader io.ReadCloser, err error)
	RawLogDiffSearch func(opt RawLogDiffSearchOptions) ([]*LogCommitSearchResult, bool, error)
	NewFileReader    func(commit api.CommitID, name string) (io.ReadCloser, error)
	ReadFile         func(commit api.CommitID, name string) ([]byte, error)
	ReadDir          func(commit api.CommitID, name string, recurse bool) ([]fs.FileInfo, error)
	LsFiles          func(repo api.RepoName, commit api.CommitID) ([]string, error)
	ResolveRevision  func(spec string, opt ResolveRevisionOptions) (api.CommitID, error)
	Stat             func(commit api.CommitID, name string) (fs.FileInfo, error)
	GetObject        func(objectName string) (OID, ObjectType, error)
	Commits          func(repo api.RepoName, opt CommitsOptions) ([]*Commit, error)
	MergeBase        func(repo api.RepoName, a, b api.CommitID) (api.CommitID, error)
} = ...
```

Mocks is used to mock behavior in tests. Tests must call ResetMocks() when finished to ensure its mocks are not (inadvertently) used by subsequent tests. 

(The emptyMocks is used by ResetMocks to zero out Mocks without needing to use a named type.) 

### <a id="invalidBranch" href="#invalidBranch">var invalidBranch</a>

```
searchKey: git.invalidBranch
tags: [private]
```

```Go
var invalidBranch = ...
```

### <a id="lsTreeRootCacheMu" href="#lsTreeRootCacheMu">var lsTreeRootCacheMu</a>

```
searchKey: git.lsTreeRootCacheMu
tags: [private]
```

```Go
var lsTreeRootCacheMu sync.Mutex
```

lsTreeRootCache caches the result of running `git ls-tree ...` on a repository's root path (because non-root paths are likely to have a lower cache hit rate). It is intended to improve the perceived performance of large monorepos, where the tree for a given repo+commit (usually the repo's latest commit on default branch) will be requested frequently and would take multiple seconds to compute if uncached. 

### <a id="lsTreeRootCache" href="#lsTreeRootCache">var lsTreeRootCache</a>

```
searchKey: git.lsTreeRootCache
tags: [private]
```

```Go
var lsTreeRootCache = lru.New(5)
```

lsTreeRootCache caches the result of running `git ls-tree ...` on a repository's root path (because non-root paths are likely to have a lower cache hit rate). It is intended to improve the perceived performance of large monorepos, where the tree for a given repo+commit (usually the repo's latest commit on default branch) will be requested frequently and would take multiple seconds to compute if uncached. 

### <a id="root" href="#root">var root</a>

```
searchKey: git.root
tags: [private]
```

```Go
var root string
```

### <a id="Times" href="#Times">var Times</a>

```
searchKey: git.Times
tags: [private]
```

```Go
var Times = []string{
	AppleTime("2006-01-02T15:04:05Z"),
	AppleTime("2014-05-06T19:20:21Z"),
}
```

### <a id="NonExistentCommitID" href="#NonExistentCommitID">var NonExistentCommitID</a>

```
searchKey: git.NonExistentCommitID
tags: [private]
```

```Go
var NonExistentCommitID = api.CommitID(strings.Repeat("a", 40))
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="BlameOptions" href="#BlameOptions">type BlameOptions struct</a>

```
searchKey: git.BlameOptions
```

```Go
type BlameOptions struct {
	NewestCommit api.CommitID `json:",omitempty" url:",omitempty"`
	OldestCommit api.CommitID `json:",omitempty" url:",omitempty"` // or "" for the root commit

	StartLine int `json:",omitempty" url:",omitempty"` // 1-indexed start byte (or 0 for beginning of file)
	EndLine   int `json:",omitempty" url:",omitempty"` // 1-indexed end byte (or 0 for end of file)
}
```

BlameOptions configures a blame. 

### <a id="Hunk" href="#Hunk">type Hunk struct</a>

```
searchKey: git.Hunk
```

```Go
type Hunk struct {
	StartLine int // 1-indexed start line number
	EndLine   int // 1-indexed end line number
	StartByte int // 0-indexed start byte position (inclusive)
	EndByte   int // 0-indexed end byte position (exclusive)
	api.CommitID
	Author  Signature
	Message string
}
```

A Hunk is a contiguous portion of a file associated with a commit. 

### <a id="blobReader" href="#blobReader">type blobReader struct</a>

```
searchKey: git.blobReader
tags: [private]
```

```Go
type blobReader struct {
	ctx    context.Context
	repo   api.RepoName
	commit api.CommitID
	name   string
	cmd    *gitserver.Cmd
	rc     io.ReadCloser
}
```

blobReader, which should be created using newBlobReader, is a struct that allows us to get a ReadCloser to a specific named file at a specific commit 

#### <a id="newBlobReader" href="#newBlobReader">func newBlobReader(ctx context.Context, repo api.RepoName, commit api.CommitID, name string) (*blobReader, error)</a>

```
searchKey: git.newBlobReader
tags: [private]
```

```Go
func newBlobReader(ctx context.Context, repo api.RepoName, commit api.CommitID, name string) (*blobReader, error)
```

#### <a id="blobReader.Read" href="#blobReader.Read">func (br *blobReader) Read(p []byte) (int, error)</a>

```
searchKey: git.blobReader.Read
tags: [private]
```

```Go
func (br *blobReader) Read(p []byte) (int, error)
```

#### <a id="blobReader.Close" href="#blobReader.Close">func (br *blobReader) Close() error</a>

```
searchKey: git.blobReader.Close
tags: [private]
```

```Go
func (br *blobReader) Close() error
```

#### <a id="blobReader.convertError" href="#blobReader.convertError">func (br *blobReader) convertError(err error) error</a>

```
searchKey: git.blobReader.convertError
tags: [private]
```

```Go
func (br *blobReader) convertError(err error) error
```

convertError converts an error returned from 'git show' into a more appropriate error type 

### <a id="Commit" href="#Commit">type Commit struct</a>

```
searchKey: git.Commit
```

```Go
type Commit struct {
	ID        api.CommitID `json:"ID,omitempty"`
	Author    Signature    `json:"Author"`
	Committer *Signature   `json:"Committer,omitempty"`
	Message   Message      `json:"Message,omitempty"`
	// Parents are the commit IDs of this commit's parent commits.
	Parents []api.CommitID `json:"Parents,omitempty"`
}
```

#### <a id="getCommit" href="#getCommit">func getCommit(ctx context.Context, repo api.RepoName, id api.CommitID, opt ResolveRevisionOptions) (_ *Commit, err error)</a>

```
searchKey: git.getCommit
tags: [private]
```

```Go
func getCommit(ctx context.Context, repo api.RepoName, id api.CommitID, opt ResolveRevisionOptions) (_ *Commit, err error)
```

getCommit returns the commit with the given id. 

#### <a id="GetCommit" href="#GetCommit">func GetCommit(ctx context.Context, repo api.RepoName, id api.CommitID, opt ResolveRevisionOptions) (*Commit, error)</a>

```
searchKey: git.GetCommit
```

```Go
func GetCommit(ctx context.Context, repo api.RepoName, id api.CommitID, opt ResolveRevisionOptions) (*Commit, error)
```

GetCommit returns the commit with the given commit ID, or ErrCommitNotFound if no such commit exists. 

The remoteURLFunc is called to get the Git remote URL if it's not set in repo and if it is needed. The Git remote URL is only required if the gitserver doesn't already contain a clone of the repository or if the commit must be fetched from the remote. 

#### <a id="FirstEverCommit" href="#FirstEverCommit">func FirstEverCommit(ctx context.Context, repo api.RepoName) (*Commit, error)</a>

```
searchKey: git.FirstEverCommit
```

```Go
func FirstEverCommit(ctx context.Context, repo api.RepoName) (*Commit, error)
```

FirstEverCommit returns the first commit ever made to the repository. 

#### <a id="FindNearestCommit" href="#FindNearestCommit">func FindNearestCommit(ctx context.Context, repoName api.RepoName, revSpec string, target time.Time) (*Commit, error)</a>

```
searchKey: git.FindNearestCommit
```

```Go
func FindNearestCommit(ctx context.Context, repoName api.RepoName, revSpec string, target time.Time) (*Commit, error)
```

FindNearestCommit finds the commit in the given repository revSpec (e.g. `HEAD` or `mybranch`) whose author date most closely matches the target time. 

Can return a commit very far away if no nearby one exists. Can theoretically return nil, nil if no commits at all are found. 

#### <a id="parseCommitFromLog" href="#parseCommitFromLog">func parseCommitFromLog(data []byte) (commit *Commit, refs []string, rest []byte, err error)</a>

```
searchKey: git.parseCommitFromLog
tags: [private]
```

```Go
func parseCommitFromLog(data []byte) (commit *Commit, refs []string, rest []byte, err error)
```

parseCommitFromLog parses the next commit from data and returns the commit and the remaining data. The data arg is a byte array that contains NUL-separated log fields as formatted by logFormatFlag. 

### <a id="Message" href="#Message">type Message string</a>

```
searchKey: git.Message
```

```Go
type Message string
```

#### <a id="Message.Subject" href="#Message.Subject">func (m Message) Subject() string</a>

```
searchKey: git.Message.Subject
```

```Go
func (m Message) Subject() string
```

Subject returns the first line of the commit message 

#### <a id="Message.Body" href="#Message.Body">func (m Message) Body() string</a>

```
searchKey: git.Message.Body
```

```Go
func (m Message) Body() string
```

Body returns the contents of the Git commit message after the subject. 

### <a id="Signature" href="#Signature">type Signature struct</a>

```
searchKey: git.Signature
```

```Go
type Signature struct {
	Name  string    `json:"Name,omitempty"`
	Email string    `json:"Email,omitempty"`
	Date  time.Time `json:"Date"`
}
```

### <a id="CommitsOptions" href="#CommitsOptions">type CommitsOptions struct</a>

```
searchKey: git.CommitsOptions
```

```Go
type CommitsOptions struct {
	Range string // commit range (revspec, "A..B", "A...B", etc.)

	N    uint // limit the number of returned commits to this many (0 means no limit)
	Skip uint // skip this many commits at the beginning

	MessageQuery string // include only commits whose commit message contains this substring

	Author string // include only commits whose author matches this
	After  string // include only commits after this date
	Before string // include only commits before this date

	Reverse   bool // Whether or not commits should be given in reverse order (optional)
	DateOrder bool // Whether or not commits should be sorted by date (optional)

	Path string // only commits modifying the given path are selected (optional)

	// When true we opt out of attempting to fetch missing revisions
	NoEnsureRevision bool
}
```

CommitsOptions specifies options for (Repository).Commits (Repository).CommitCount. 

### <a id="onelineCommit" href="#onelineCommit">type onelineCommit struct</a>

```
searchKey: git.onelineCommit
tags: [private]
```

```Go
type onelineCommit struct {
	sha1      string // sha1 commit ID
	sourceRef string // `git log --source` source ref
}
```

onelineCommit contains (a subset of the) information about a commit returned by `git log --oneline --source`. 

### <a id="DiffOptions" href="#DiffOptions">type DiffOptions struct</a>

```
searchKey: git.DiffOptions
```

```Go
type DiffOptions struct {
	Repo api.RepoName

	// These fields must be valid <commit> inputs as defined by gitrevisions(7).
	Base string
	Head string
}
```

### <a id="DiffFileIterator" href="#DiffFileIterator">type DiffFileIterator struct</a>

```
searchKey: git.DiffFileIterator
```

```Go
type DiffFileIterator struct {
	rdr  io.ReadCloser
	mfdr *diff.MultiFileDiffReader
}
```

#### <a id="Diff" href="#Diff">func Diff(ctx context.Context, opts DiffOptions) (*DiffFileIterator, error)</a>

```
searchKey: git.Diff
```

```Go
func Diff(ctx context.Context, opts DiffOptions) (*DiffFileIterator, error)
```

Diff returns an iterator that can be used to access the diff between two commits on a per-file basis. The iterator must be closed with Close when no longer required. 

#### <a id="DiffFileIterator.Close" href="#DiffFileIterator.Close">func (i *DiffFileIterator) Close() error</a>

```
searchKey: git.DiffFileIterator.Close
```

```Go
func (i *DiffFileIterator) Close() error
```

#### <a id="DiffFileIterator.Next" href="#DiffFileIterator.Next">func (i *DiffFileIterator) Next() (*diff.FileDiff, error)</a>

```
searchKey: git.DiffFileIterator.Next
```

```Go
func (i *DiffFileIterator) Next() (*diff.FileDiff, error)
```

Next returns the next file diff. If no more diffs are available, the diff will be nil and the error will be io.EOF. 

### <a id="diffHunkLineInfo" href="#diffHunkLineInfo">type diffHunkLineInfo struct</a>

```
searchKey: git.diffHunkLineInfo
tags: [private]
```

```Go
type diffHunkLineInfo struct {
	added    bool // line starts with '+'
	removed  bool // line starts with '-'
	matching bool // line matches query (only computed for changed lines)
	context  bool // include because it's context for a matching changed line
}
```

#### <a id="diffHunkLineInfo.changed" href="#diffHunkLineInfo.changed">func (info diffHunkLineInfo) changed() bool</a>

```
searchKey: git.diffHunkLineInfo.changed
tags: [private]
```

```Go
func (info diffHunkLineInfo) changed() bool
```

### <a id="TextSearchOptions" href="#TextSearchOptions">type TextSearchOptions struct</a>

```
searchKey: git.TextSearchOptions
```

```Go
type TextSearchOptions struct {
	Pattern         string // the pattern to look for
	IsRegExp        bool   // whether the pattern is a regexp (if false, treated as exact string)
	IsCaseSensitive bool   // whether the pattern should be matched case-sensitively
}
```

TextSearchOptions contains common options for text search commands. 

### <a id="PathOptions" href="#PathOptions">type PathOptions struct</a>

```
searchKey: git.PathOptions
```

```Go
type PathOptions struct {
	IncludePatterns []string // include paths matching all of these patterns
	ExcludePattern  string   // exclude paths matching any of these patterns
	IsRegExp        bool     // whether the pattern is a regexp (if false, treated as exact string)
	IsCaseSensitive bool     // whether the pattern should be matched case-sensitively
}
```

PathOptions contains common options for commands that can be limited to only certain paths. 

### <a id="RawLogDiffSearchOptions" href="#RawLogDiffSearchOptions">type RawLogDiffSearchOptions struct</a>

```
searchKey: git.RawLogDiffSearchOptions
```

```Go
type RawLogDiffSearchOptions struct {
	// Query specifies the search query to find.
	Query TextSearchOptions

	// MatchChangedOccurrenceCount makes the operation run `git log -S` not `git log -G`.
	// See `git log --help` for more information.
	MatchChangedOccurrenceCount bool

	// Diff is whether the diff should be computed and returned.
	Diff bool

	// OnlyMatchingHunks makes the diff only include hunks that match the query. If false,
	// all hunks from files that match the query are included.
	OnlyMatchingHunks bool

	// Paths specifies the paths to include/exclude.
	Paths PathOptions

	// FormatArgs is a list of format args that are passed to the `git log` command.
	// Because the output is parsed, it is expected to be in a known format. If the
	// FormatArgs does not match one of the server's expected values, the operation
	// will fail.
	//
	// If nil, the default format args are used.
	FormatArgs []string

	// RawArgs is a list of non-format args that are passed to the `git log` command.
	// It should not contain any "--" elements; those should be passed using the Paths
	// field.
	//
	// No arguments that affect the format of the output should be present in this
	// slice.
	Args []string
}
```

RawLogDiffSearchOptions specifies options to (Repository).RawLogDiffSearch. 

### <a id="LogCommitSearchResult" href="#LogCommitSearchResult">type LogCommitSearchResult struct</a>

```
searchKey: git.LogCommitSearchResult
```

```Go
type LogCommitSearchResult struct {
	Commit         Commit      // the commit whose diff was matched
	Diff           *RawDiff    // the diff, with non-matching/irrelevant portions deleted (respecting diff syntax)
	DiffHighlights []Highlight // highlighted query matches in the diff

	// Refs is the list of ref names of this commit (from `git log --decorate`).
	Refs []string

	// SourceRefs is the list of ref names by which this commit was reached. (See
	// `git log --help` documentation on the `--source` flag.)
	SourceRefs []string

	// Incomplete indicates that this result may represent a subset of the actual data.
	// This can occur when the underlying command returns early due to an impending
	// timeout.
	Incomplete bool
}
```

LogCommitSearchResult describes a matching diff from (Repository).RawLogDiffSearch. 

### <a id="LogCommitSearchEvent" href="#LogCommitSearchEvent">type LogCommitSearchEvent struct</a>

```
searchKey: git.LogCommitSearchEvent
```

```Go
type LogCommitSearchEvent struct {
	// Results are new commit results found.
	Results []*LogCommitSearchResult

	// Complete is false when the results may have been parsed from only
	// partial output from the underlying git command (because, e.g., it timed
	// out during execution and only returned partial output).
	//
	// Complete defaults to true, but once false will remain false.
	Complete bool

	// Error is non-nil if an error occurred. It will be the last event if
	// set.
	//
	// Note: Results will be empty if Error is set.
	Error error
}
```

LogCommitSearchEvent are emitted by RawLogDiffSearchStream 

### <a id="RawDiff" href="#RawDiff">type RawDiff struct</a>

```
searchKey: git.RawDiff
```

```Go
type RawDiff struct {
	Raw string // the raw diff output
}
```

A RawDiff represents changes between two commits. 

### <a id="Highlight" href="#Highlight">type Highlight struct</a>

```
searchKey: git.Highlight
```

```Go
type Highlight struct {
	Line      int // the 1-indexed line number
	Character int // the 1-indexed character on the line
	Length    int // the length of the highlight, in characters (on the same line)
}
```

Highlight represents a highlighted region in a string. 

### <a id="refResolveCache" href="#refResolveCache">type refResolveCache struct</a>

```
searchKey: git.refResolveCache
tags: [private]
```

```Go
type refResolveCache struct {
	mu      sync.Mutex
	results map[string]struct {
		target string
		err    error
	}
}
```

cachedRefResolver is a short-lived cache for ref resolutions. Only use it for the lifetime of a single request and for a single repo. 

#### <a id="refResolveCache.resolveHEADSymbolicRef" href="#refResolveCache.resolveHEADSymbolicRef">func (r *refResolveCache) resolveHEADSymbolicRef(ctx context.Context, repo api.RepoName) (target string, err error)</a>

```
searchKey: git.refResolveCache.resolveHEADSymbolicRef
tags: [private]
```

```Go
func (r *refResolveCache) resolveHEADSymbolicRef(ctx context.Context, repo api.RepoName) (target string, err error)
```

### <a id="cmdFunc" href="#cmdFunc">type cmdFunc func(args []string) github.com/sourcegraph/sourcegraph/internal/vcs/git.cmd</a>

```
searchKey: git.cmdFunc
tags: [private]
```

```Go
type cmdFunc func(args []string) cmd
```

cmdFunc is a func that creates a new executable Git command. 

#### <a id="gitserverCmdFunc" href="#gitserverCmdFunc">func gitserverCmdFunc(repo api.RepoName) cmdFunc</a>

```
searchKey: git.gitserverCmdFunc
tags: [private]
```

```Go
func gitserverCmdFunc(repo api.RepoName) cmdFunc
```

### <a id="cmd" href="#cmd">type cmd interface</a>

```
searchKey: git.cmd
tags: [private]
```

```Go
type cmd interface {
	Output(context.Context) ([]byte, error)
	String() string
}
```

cmd is an executable Git command. 

### <a id="Submodule" href="#Submodule">type Submodule struct</a>

```
searchKey: git.Submodule
```

```Go
type Submodule struct {
	// URL is the submodule repository clone URL.
	URL string

	// Path is the path of the submodule relative to the repository root.
	Path string

	// CommitID is the pinned commit ID of the submodule (in the
	// submodule repository's commit ID space).
	CommitID api.CommitID
}
```

Submodule holds information about a Git submodule and is returned in the FileInfo's Sys field by Stat/Lstat/ReadDir calls. 

### <a id="ObjectInfo" href="#ObjectInfo">type ObjectInfo interface</a>

```
searchKey: git.ObjectInfo
```

```Go
type ObjectInfo interface {
	OID() OID
}
```

ObjectInfo holds information about a Git object and is returned in (fs.FileInfo).Sys for blobs and trees from Stat/Lstat/ReadDir calls. 

### <a id="objectInfo" href="#objectInfo">type objectInfo git.OID</a>

```
searchKey: git.objectInfo
tags: [private]
```

```Go
type objectInfo OID
```

#### <a id="objectInfo.OID" href="#objectInfo.OID">func (oid objectInfo) OID() OID</a>

```
searchKey: git.objectInfo.OID
tags: [private]
```

```Go
func (oid objectInfo) OID() OID
```

### <a id="OID" href="#OID">type OID [20]byte</a>

```
searchKey: git.OID
```

```Go
type OID [20]byte
```

OID is a Git OID (40-char hex-encoded). 

#### <a id="GetObject" href="#GetObject">func GetObject(ctx context.Context, repo api.RepoName, objectName string) (oid OID, objectType ObjectType, err error)</a>

```
searchKey: git.GetObject
```

```Go
func GetObject(ctx context.Context, repo api.RepoName, objectName string) (oid OID, objectType ObjectType, err error)
```

GetObject looks up a Git object and returns information about it. 

#### <a id="decodeOID" href="#decodeOID">func decodeOID(sha string) (OID, error)</a>

```
searchKey: git.decodeOID
tags: [private]
```

```Go
func decodeOID(sha string) (OID, error)
```

#### <a id="OID.String" href="#OID.String">func (oid OID) String() string</a>

```
searchKey: git.OID.String
```

```Go
func (oid OID) String() string
```

### <a id="ObjectType" href="#ObjectType">type ObjectType string</a>

```
searchKey: git.ObjectType
```

```Go
type ObjectType string
```

ObjectType is a valid Git object type (commit, tag, tree, and blob). 

### <a id="RefGlob" href="#RefGlob">type RefGlob struct</a>

```
searchKey: git.RefGlob
```

```Go
type RefGlob struct {
	// Include is a glob pattern for including refs interpreted as in `git log --glob`. See the
	// git-log(1) manual page for details.
	Include string

	// Exclude is a glob pattern for excluding refs interpreted as in `git log --exclude`. See the
	// git-log(1) manual page for details.
	Exclude string
}
```

RefGlob describes a glob pattern that either includes or excludes refs. Exactly 1 of the fields must be set. 

### <a id="RefGlobs" href="#RefGlobs">type RefGlobs []git.compiledRefGlobPattern</a>

```
searchKey: git.RefGlobs
```

```Go
type RefGlobs []compiledRefGlobPattern
```

RefGlobs is a compiled matcher based on RefGlob patterns. Use CompileRefGlobs to create it. 

#### <a id="CompileRefGlobs" href="#CompileRefGlobs">func CompileRefGlobs(globs []RefGlob) (RefGlobs, error)</a>

```
searchKey: git.CompileRefGlobs
```

```Go
func CompileRefGlobs(globs []RefGlob) (RefGlobs, error)
```

CompileRefGlobs compiles the ordered ref glob patterns (interpreted as in `git log --glob ... --exclude ...`; see the git-log(1) manual page) into a matcher. If the input patterns are invalid, an error is returned. 

#### <a id="RefGlobs.Match" href="#RefGlobs.Match">func (gs RefGlobs) Match(ref string) bool</a>

```
searchKey: git.RefGlobs.Match
```

```Go
func (gs RefGlobs) Match(ref string) bool
```

Match reports whether the named ref matches the ref globs. 

### <a id="compiledRefGlobPattern" href="#compiledRefGlobPattern">type compiledRefGlobPattern struct</a>

```
searchKey: git.compiledRefGlobPattern
tags: [private]
```

```Go
type compiledRefGlobPattern struct {
	pattern glob.Glob
	include bool // true for include, false for exclude
}
```

### <a id="Branch" href="#Branch">type Branch struct</a>

```
searchKey: git.Branch
```

```Go
type Branch struct {
	// Name is the name of this branch.
	Name string `json:"Name,omitempty"`
	// Head is the commit ID of this branch's head commit.
	Head api.CommitID `json:"Head,omitempty"`
	// Commit optionally contains commit information for this branch's head commit.
	// It is populated if IncludeCommit option is set.
	Commit *Commit `json:"Commit,omitempty"`
	// Counts optionally contains the commit counts relative to specified branch.
	Counts *BehindAhead `json:"Counts,omitempty"`
}
```

A Branch is a VCS branch. 

### <a id="BranchesOptions" href="#BranchesOptions">type BranchesOptions struct</a>

```
searchKey: git.BranchesOptions
```

```Go
type BranchesOptions struct {
	// MergedInto will cause the returned list to be restricted to only
	// branches that were merged into this branch name.
	MergedInto string `json:"MergedInto,omitempty" url:",omitempty"`
	// IncludeCommit controls whether complete commit information is included.
	IncludeCommit bool `json:"IncludeCommit,omitempty" url:",omitempty"`
	// BehindAheadBranch specifies a branch name. If set to something other than blank
	// string, then each returned branch will include a behind/ahead commit counts
	// information against the specified base branch. If left blank, then branches will
	// not include that information and their Counts will be nil.
	BehindAheadBranch string `json:"BehindAheadBranch,omitempty" url:",omitempty"`
	// ContainsCommit filters the list of branches to only those that
	// contain a specific commit ID (if set).
	ContainsCommit string `json:"ContainsCommit,omitempty" url:",omitempty"`
}
```

BranchesOptions specifies options for the list of branches returned by (Repository).Branches. 

### <a id="Tag" href="#Tag">type Tag struct</a>

```
searchKey: git.Tag
```

```Go
type Tag struct {
	Name         string `json:"Name,omitempty"`
	api.CommitID `json:"CommitID,omitempty"`
	CreatorDate  time.Time
}
```

A Tag is a VCS tag. 

### <a id="BehindAhead" href="#BehindAhead">type BehindAhead struct</a>

```
searchKey: git.BehindAhead
```

```Go
type BehindAhead struct {
	Behind uint32 `json:"Behind,omitempty"`
	Ahead  uint32 `json:"Ahead,omitempty"`
}
```

BehindAhead is a set of behind/ahead counts. 

#### <a id="GetBehindAhead" href="#GetBehindAhead">func GetBehindAhead(ctx context.Context, repo api.RepoName, left, right string) (*BehindAhead, error)</a>

```
searchKey: git.GetBehindAhead
```

```Go
func GetBehindAhead(ctx context.Context, repo api.RepoName, left, right string) (*BehindAhead, error)
```

GetBehindAhead returns the behind/ahead commit counts information for right vs. left (both Git revspecs). 

### <a id="Branches" href="#Branches">type Branches []*git.Branch</a>

```
searchKey: git.Branches
```

```Go
type Branches []*Branch
```

#### <a id="Branches.Len" href="#Branches.Len">func (p Branches) Len() int</a>

```
searchKey: git.Branches.Len
```

```Go
func (p Branches) Len() int
```

#### <a id="Branches.Less" href="#Branches.Less">func (p Branches) Less(i, j int) bool</a>

```
searchKey: git.Branches.Less
```

```Go
func (p Branches) Less(i, j int) bool
```

#### <a id="Branches.Swap" href="#Branches.Swap">func (p Branches) Swap(i, j int)</a>

```
searchKey: git.Branches.Swap
```

```Go
func (p Branches) Swap(i, j int)
```

### <a id="ByAuthorDate" href="#ByAuthorDate">type ByAuthorDate []*git.Branch</a>

```
searchKey: git.ByAuthorDate
```

```Go
type ByAuthorDate []*Branch
```

ByAuthorDate sorts by author date. Requires full commit information to be included. 

#### <a id="ByAuthorDate.Len" href="#ByAuthorDate.Len">func (p ByAuthorDate) Len() int</a>

```
searchKey: git.ByAuthorDate.Len
```

```Go
func (p ByAuthorDate) Len() int
```

#### <a id="ByAuthorDate.Less" href="#ByAuthorDate.Less">func (p ByAuthorDate) Less(i, j int) bool</a>

```
searchKey: git.ByAuthorDate.Less
```

```Go
func (p ByAuthorDate) Less(i, j int) bool
```

#### <a id="ByAuthorDate.Swap" href="#ByAuthorDate.Swap">func (p ByAuthorDate) Swap(i, j int)</a>

```
searchKey: git.ByAuthorDate.Swap
```

```Go
func (p ByAuthorDate) Swap(i, j int)
```

### <a id="Tags" href="#Tags">type Tags []*git.Tag</a>

```
searchKey: git.Tags
```

```Go
type Tags []*Tag
```

#### <a id="Tags.Len" href="#Tags.Len">func (p Tags) Len() int</a>

```
searchKey: git.Tags.Len
```

```Go
func (p Tags) Len() int
```

#### <a id="Tags.Less" href="#Tags.Less">func (p Tags) Less(i, j int) bool</a>

```
searchKey: git.Tags.Less
```

```Go
func (p Tags) Less(i, j int) bool
```

#### <a id="Tags.Swap" href="#Tags.Swap">func (p Tags) Swap(i, j int)</a>

```
searchKey: git.Tags.Swap
```

```Go
func (p Tags) Swap(i, j int)
```

### <a id="branchFilter" href="#branchFilter">type branchFilter map[string]struct{}</a>

```
searchKey: git.branchFilter
tags: [private]
```

```Go
type branchFilter map[string]struct{}
```

branchFilter is a filter for branch names. If not empty, only contained branch names are allowed. If empty, all names are allowed. The map should be made so it's not nil. 

#### <a id="branchFilter.allows" href="#branchFilter.allows">func (f branchFilter) allows(name string) bool</a>

```
searchKey: git.branchFilter.allows
tags: [private]
```

```Go
func (f branchFilter) allows(name string) bool
```

allows will return true if the current filter set-up validates against the passed string. If there are no filters, all strings pass. 

#### <a id="branchFilter.add" href="#branchFilter.add">func (f branchFilter) add(list []string)</a>

```
searchKey: git.branchFilter.add
tags: [private]
```

```Go
func (f branchFilter) add(list []string)
```

add adds a slice of strings to the filter. 

### <a id="byteSlices" href="#byteSlices">type byteSlices [][]byte</a>

```
searchKey: git.byteSlices
tags: [private]
```

```Go
type byteSlices [][]byte
```

#### <a id="byteSlices.Len" href="#byteSlices.Len">func (p byteSlices) Len() int</a>

```
searchKey: git.byteSlices.Len
tags: [private]
```

```Go
func (p byteSlices) Len() int
```

#### <a id="byteSlices.Less" href="#byteSlices.Less">func (p byteSlices) Less(i, j int) bool</a>

```
searchKey: git.byteSlices.Less
tags: [private]
```

```Go
func (p byteSlices) Less(i, j int) bool
```

#### <a id="byteSlices.Swap" href="#byteSlices.Swap">func (p byteSlices) Swap(i, j int)</a>

```
searchKey: git.byteSlices.Swap
tags: [private]
```

```Go
func (p byteSlices) Swap(i, j int)
```

### <a id="Ref" href="#Ref">type Ref struct</a>

```
searchKey: git.Ref
```

```Go
type Ref struct {
	Name     string // the full name of the ref (e.g., "refs/heads/mybranch")
	CommitID api.CommitID
}
```

Ref describes a Git ref. 

### <a id="ResolveRevisionOptions" href="#ResolveRevisionOptions">type ResolveRevisionOptions struct</a>

```
searchKey: git.ResolveRevisionOptions
```

```Go
type ResolveRevisionOptions struct {
	NoEnsureRevision bool // do not try to fetch from remote if revision doesn't exist locally
}
```

ResolveRevisionOptions configure how we resolve revisions. The zero value should contain appropriate default values. 

### <a id="BadCommitError" href="#BadCommitError">type BadCommitError struct</a>

```
searchKey: git.BadCommitError
```

```Go
type BadCommitError struct {
	Spec   string
	Commit api.CommitID
	Repo   api.RepoName
}
```

#### <a id="BadCommitError.Error" href="#BadCommitError.Error">func (e BadCommitError) Error() string</a>

```
searchKey: git.BadCommitError.Error
```

```Go
func (e BadCommitError) Error() string
```

### <a id="ShortLogOptions" href="#ShortLogOptions">type ShortLogOptions struct</a>

```
searchKey: git.ShortLogOptions
```

```Go
type ShortLogOptions struct {
	Range string // the range for which stats will be fetched
	After string // the date after which to collect commits
	Path  string // compute stats for commits that touch this path
}
```

ShortLogOptions contains options for (Repository).ShortLog. 

### <a id="PersonCount" href="#PersonCount">type PersonCount struct</a>

```
searchKey: git.PersonCount
```

```Go
type PersonCount struct {
	Name  string
	Email string
	Count int32
}
```

A PersonCount is a contributor to a repository. 

#### <a id="PersonCount.String" href="#PersonCount.String">func (p *PersonCount) String() string</a>

```
searchKey: git.PersonCount.String
```

```Go
func (p *PersonCount) String() string
```

### <a id="closer" href="#closer">type closer bool</a>

```
searchKey: git.closer
tags: [private]
```

```Go
type closer bool
```

#### <a id="closer.Read" href="#closer.Read">func (c *closer) Read(p []byte) (int, error)</a>

```
searchKey: git.closer.Read
tags: [private]
```

```Go
func (c *closer) Read(p []byte) (int, error)
```

#### <a id="closer.Close" href="#closer.Close">func (c *closer) Close() error</a>

```
searchKey: git.closer.Close
tags: [private]
```

```Go
func (c *closer) Close() error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BlameFile" href="#BlameFile">func BlameFile(ctx context.Context, repo api.RepoName, path string, opt *BlameOptions) ([]*Hunk, error)</a>

```
searchKey: git.BlameFile
```

```Go
func BlameFile(ctx context.Context, repo api.RepoName, path string, opt *BlameOptions) ([]*Hunk, error)
```

BlameFile returns Git blame information about a file. 

### <a id="blameFileCmd" href="#blameFileCmd">func blameFileCmd(ctx context.Context, command cmdFunc, path string, opt *BlameOptions) ([]*Hunk, error)</a>

```
searchKey: git.blameFileCmd
tags: [private]
```

```Go
func blameFileCmd(ctx context.Context, command cmdFunc, path string, opt *BlameOptions) ([]*Hunk, error)
```

### <a id="ReadFile" href="#ReadFile">func ReadFile(ctx context.Context, repo api.RepoName, commit api.CommitID, name string, maxBytes int64) ([]byte, error)</a>

```
searchKey: git.ReadFile
```

```Go
func ReadFile(ctx context.Context, repo api.RepoName, commit api.CommitID, name string, maxBytes int64) ([]byte, error)
```

ReadFile returns the first maxBytes of the named file at commit. If maxBytes <= 0, the entire file is read. (If you just need to check a file's existence, use Stat, not ReadFile.) 

### <a id="NewFileReader" href="#NewFileReader">func NewFileReader(ctx context.Context, repo api.RepoName, commit api.CommitID, name string) (io.ReadCloser, error)</a>

```
searchKey: git.NewFileReader
```

```Go
func NewFileReader(ctx context.Context, repo api.RepoName, commit api.CommitID, name string) (io.ReadCloser, error)
```

NewFileReader returns an io.ReadCloser reading from the named file at commit. The caller should always close the reader after use 

### <a id="readFileBytes" href="#readFileBytes">func readFileBytes(ctx context.Context, repo api.RepoName, commit api.CommitID, name string, maxBytes int64) ([]byte, error)</a>

```
searchKey: git.readFileBytes
tags: [private]
```

```Go
func readFileBytes(ctx context.Context, repo api.RepoName, commit api.CommitID, name string, maxBytes int64) ([]byte, error)
```

### <a id="Commits" href="#Commits">func Commits(ctx context.Context, repo api.RepoName, opt CommitsOptions) ([]*Commit, error)</a>

```
searchKey: git.Commits
```

```Go
func Commits(ctx context.Context, repo api.RepoName, opt CommitsOptions) ([]*Commit, error)
```

Commits returns all commits matching the options. 

### <a id="HasCommitAfter" href="#HasCommitAfter">func HasCommitAfter(ctx context.Context, repo api.RepoName, date string, revspec string) (bool, error)</a>

```
searchKey: git.HasCommitAfter
```

```Go
func HasCommitAfter(ctx context.Context, repo api.RepoName, date string, revspec string) (bool, error)
```

HasCommitAfter indicates the staleness of a repository. It returns a boolean indicating if a repository contains a commit past a specified date. 

### <a id="isBadObjectErr" href="#isBadObjectErr">func isBadObjectErr(output, obj string) bool</a>

```
searchKey: git.isBadObjectErr
tags: [private]
```

```Go
func isBadObjectErr(output, obj string) bool
```

### <a id="commitLog" href="#commitLog">func commitLog(ctx context.Context, repo api.RepoName, opt CommitsOptions) (commits []*Commit, err error)</a>

```
searchKey: git.commitLog
tags: [private]
```

```Go
func commitLog(ctx context.Context, repo api.RepoName, opt CommitsOptions) (commits []*Commit, err error)
```

commitLog returns a list of commits. 

The caller is responsible for doing checkSpecArgSafety on opt.Head and opt.Base. 

### <a id="commitLogArgs" href="#commitLogArgs">func commitLogArgs(initialArgs []string, opt CommitsOptions) (args []string, err error)</a>

```
searchKey: git.commitLogArgs
tags: [private]
```

```Go
func commitLogArgs(initialArgs []string, opt CommitsOptions) (args []string, err error)
```

### <a id="CommitCount" href="#CommitCount">func CommitCount(ctx context.Context, repo api.RepoName, opt CommitsOptions) (uint, error)</a>

```
searchKey: git.CommitCount
```

```Go
func CommitCount(ctx context.Context, repo api.RepoName, opt CommitsOptions) (uint, error)
```

CommitCount returns the number of commits that would be returned by Commits. 

### <a id="logOnelineBatchScanner" href="#logOnelineBatchScanner">func logOnelineBatchScanner(scan func() (*onelineCommit, error), maxBatchSize int, debounce time.Duration) (next func() ([]*onelineCommit, error), cleanup func())</a>

```
searchKey: git.logOnelineBatchScanner
tags: [private]
```

```Go
func logOnelineBatchScanner(scan func() (*onelineCommit, error), maxBatchSize int, debounce time.Duration) (next func() ([]*onelineCommit, error), cleanup func())
```

logOnelineBatchScanner wraps logOnelineScanner to batch up reads. 

next will return at least 1 commit and at most maxBatchSize entries. After debounce time it will return what has been batched so far (or wait until an entry is available). The last response from next will return a non-nil error. 

cleanup must be called when done. This function creates a goroutine to batch up calls to scan. 

### <a id="logOnelineScanner" href="#logOnelineScanner">func logOnelineScanner(r io.Reader) func() (*onelineCommit, error)</a>

```
searchKey: git.logOnelineScanner
tags: [private]
```

```Go
func logOnelineScanner(r io.Reader) func() (*onelineCommit, error)
```

logOnelineScanner parses the commits from the reader of: 

```
git log --pretty='format:%H %S' -z --source --no-patch

```
Once it returns an error the scanner should be disregarded. io.EOF is returned when there is no more data to read. 

### <a id="compilePathMatcher" href="#compilePathMatcher">func compilePathMatcher(options PathOptions) (pathmatch.PathMatcher, error)</a>

```
searchKey: git.compilePathMatcher
tags: [private]
```

```Go
func compilePathMatcher(options PathOptions) (pathmatch.PathMatcher, error)
```

compilePathMatcher compiles the path options into a PathMatcher. 

### <a id="filterAndHighlightDiff" href="#filterAndHighlightDiff">func filterAndHighlightDiff(rawDiff []byte, query *regexp.Regexp, onlyMatchingHunks bool, pathMatcher pathmatch.PathMatcher) (_ []byte, _ []Highlight, err error)</a>

```
searchKey: git.filterAndHighlightDiff
tags: [private]
```

```Go
func filterAndHighlightDiff(rawDiff []byte, query *regexp.Regexp, onlyMatchingHunks bool, pathMatcher pathmatch.PathMatcher) (_ []byte, _ []Highlight, err error)
```

filterAndHighlightDiff returns the raw diff with query matches highlighted and only hunks that satisfy the query (if onlyMatchingHunks) and path matcher. 

### <a id="truncateLongLines" href="#truncateLongLines">func truncateLongLines(data []byte, maxCharsPerLine int) []byte</a>

```
searchKey: git.truncateLongLines
tags: [private]
```

```Go
func truncateLongLines(data []byte, maxCharsPerLine int) []byte
```

### <a id="diffHunkLineStatus" href="#diffHunkLineStatus">func diffHunkLineStatus(line []byte) (added, removed bool)</a>

```
searchKey: git.diffHunkLineStatus
tags: [private]
```

```Go
func diffHunkLineStatus(line []byte) (added, removed bool)
```

### <a id="computeDiffHunkInfo" href="#computeDiffHunkInfo">func computeDiffHunkInfo(lines [][]byte, query *regexp.Regexp, matchContextLines int) []diffHunkLineInfo</a>

```
searchKey: git.computeDiffHunkInfo
tags: [private]
```

```Go
func computeDiffHunkInfo(lines [][]byte, query *regexp.Regexp, matchContextLines int) []diffHunkLineInfo
```

### <a id="splitHunkMatches" href="#splitHunkMatches">func splitHunkMatches(hunks []*diff.Hunk, query *regexp.Regexp, matchContextLines, maxLinesPerHunk int) (results []*diff.Hunk)</a>

```
searchKey: git.splitHunkMatches
tags: [private]
```

```Go
func splitHunkMatches(hunks []*diff.Hunk, query *regexp.Regexp, matchContextLines, maxLinesPerHunk int) (results []*diff.Hunk)
```

splitHunkMatches returns a list of hunks that are a subset of the input hunks, filtered down to only hunks that match the query. Non-matching context lines and non-matching changed lines are eliminated, and the hunk header (start/end lines) are adjusted accordingly. 

### <a id="CompilePathMatcher" href="#CompilePathMatcher">func CompilePathMatcher(options PathOptions) (pathmatch.PathMatcher, error)</a>

```
searchKey: git.CompilePathMatcher
```

```Go
func CompilePathMatcher(options PathOptions) (pathmatch.PathMatcher, error)
```

CompilePathMatcher compiles the path options into a PathMatcher. 

### <a id="isValidRawLogDiffSearchFormatArgs" href="#isValidRawLogDiffSearchFormatArgs">func isValidRawLogDiffSearchFormatArgs(formatArgs []string) bool</a>

```
searchKey: git.isValidRawLogDiffSearchFormatArgs
tags: [private]
```

```Go
func isValidRawLogDiffSearchFormatArgs(formatArgs []string) bool
```

### <a id="RawLogDiffSearch" href="#RawLogDiffSearch">func RawLogDiffSearch(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions) (results []*LogCommitSearchResult, complete bool, err error)</a>

```
searchKey: git.RawLogDiffSearch
```

```Go
func RawLogDiffSearch(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions) (results []*LogCommitSearchResult, complete bool, err error)
```

RawLogDiffSearch wraps RawLogDiffSearchStream providing a blocking API. See RawLogDiffSearchStream. 

### <a id="RawLogDiffSearchStream" href="#RawLogDiffSearchStream">func RawLogDiffSearchStream(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions) <-chan LogCommitSearchEvent</a>

```
searchKey: git.RawLogDiffSearchStream
```

```Go
func RawLogDiffSearchStream(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions) <-chan LogCommitSearchEvent
```

RawLogDiffSearchStream runs a raw `git log` command that is expected to return logs with patches. It returns a subset of the output, including only hunks that actually match the given pattern. 

The returned channel must be read until closed, otherwise you may leak resources. 

### <a id="doLogDiffSearchStream" href="#doLogDiffSearchStream">func doLogDiffSearchStream(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions, c chan LogCommitSearchEvent) (complete bool, err error)</a>

```
searchKey: git.doLogDiffSearchStream
tags: [private]
```

```Go
func doLogDiffSearchStream(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions, c chan LogCommitSearchEvent) (complete bool, err error)
```

doLogDiffSearchStream is called by RawLogDiffSearchStream to send events down c. It uses named return values to simplify sending errors down the channel. The return values can be ignored. 

### <a id="rawLogSearchCmd" href="#rawLogSearchCmd">func rawLogSearchCmd(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions) (*gitserver.Cmd, error)</a>

```
searchKey: git.rawLogSearchCmd
tags: [private]
```

```Go
func rawLogSearchCmd(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions) (*gitserver.Cmd, error)
```

### <a id="rawShowSearch" href="#rawShowSearch">func rawShowSearch(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions, cache *refResolveCache, onelineCommits []*onelineCommit) (results []*LogCommitSearchResult, complete bool, err error)</a>

```
searchKey: git.rawShowSearch
tags: [private]
```

```Go
func rawShowSearch(ctx context.Context, repo api.RepoName, opt RawLogDiffSearchOptions, cache *refResolveCache, onelineCommits []*onelineCommit) (results []*LogCommitSearchResult, complete bool, err error)
```

rawShowSearch runs git show on each commit in onelineCommits. We need to do this to further filter hunks. 

### <a id="logDiffCommonArgs" href="#logDiffCommonArgs">func logDiffCommonArgs(opt RawLogDiffSearchOptions) []string</a>

```
searchKey: git.logDiffCommonArgs
tags: [private]
```

```Go
func logDiffCommonArgs(opt RawLogDiffSearchOptions) []string
```

### <a id="filterAndResolveRefs" href="#filterAndResolveRefs">func filterAndResolveRefs(ctx context.Context, repo api.RepoName, refs []string, cache *refResolveCache) ([]string, error)</a>

```
searchKey: git.filterAndResolveRefs
tags: [private]
```

```Go
func filterAndResolveRefs(ctx context.Context, repo api.RepoName, refs []string, cache *refResolveCache) ([]string, error)
```

filterAndResolveRefs replaces "HEAD" entries with the names of the ref they refer to, and it omits "HEAD -> ..." entries. 

### <a id="deadlineLabel" href="#deadlineLabel">func deadlineLabel(ctx context.Context) string</a>

```
searchKey: git.deadlineLabel
tags: [private]
```

```Go
func deadlineLabel(ctx context.Context) string
```

### <a id="regexpToGlobBestEffort" href="#regexpToGlobBestEffort">func regexpToGlobBestEffort(p string) (glob string, equiv bool)</a>

```
searchKey: git.regexpToGlobBestEffort
tags: [private]
```

```Go
func regexpToGlobBestEffort(p string) (glob string, equiv bool)
```

regexpToGlobBestEffort performs a best-effort conversion of the regexp p to an equivalent glob pattern. The glob matches a superset of what the regexp matches. If equiv is true, then the glob is exactly equivalent to the pattern; otherwise it is a strict superset and post-filtering is necessary. The glob never matches a strict subset of p (that would make it possible to correctly post-filter). 

[https://git-scm.com/docs/gitglossary#gitglossary-aiddefpathspecapathspec](https://git-scm.com/docs/gitglossary#gitglossary-aiddefpathspecapathspec) 

### <a id="globQuoteMeta" href="#globQuoteMeta">func globQuoteMeta(s []rune) string</a>

```
searchKey: git.globQuoteMeta
tags: [private]
```

```Go
func globQuoteMeta(s []rune) string
```

### <a id="checkSpecArgSafety" href="#checkSpecArgSafety">func checkSpecArgSafety(spec string) error</a>

```
searchKey: git.checkSpecArgSafety
tags: [private]
```

```Go
func checkSpecArgSafety(spec string) error
```

checkSpecArgSafety returns a non-nil err if spec begins with a "-", which could cause it to be interpreted as a git command line argument. 

### <a id="ExecSafe" href="#ExecSafe">func ExecSafe(ctx context.Context, repo api.RepoName, params []string) (stdout, stderr []byte, exitCode int, err error)</a>

```
searchKey: git.ExecSafe
```

```Go
func ExecSafe(ctx context.Context, repo api.RepoName, params []string) (stdout, stderr []byte, exitCode int, err error)
```

ExecSafe executes a Git subcommand iff it is allowed according to a allowlist. 

An error is only returned when there is a failure unrelated to the actual command being executed. If the executed command exits with a nonzero exit code, err == nil. This is similar to how http.Get returns a nil error for HTTP non-2xx responses. 

### <a id="ExecReader" href="#ExecReader">func ExecReader(ctx context.Context, repo api.RepoName, args []string) (io.ReadCloser, error)</a>

```
searchKey: git.ExecReader
```

```Go
func ExecReader(ctx context.Context, repo api.RepoName, args []string) (io.ReadCloser, error)
```

ExecReader executes an arbitrary `git` command (`git [args...]`) and returns a reader connected to its stdout. 

### <a id="readUntilTimeout" href="#readUntilTimeout">func readUntilTimeout(ctx context.Context, cmd *gitserver.Cmd) ([]byte, bool, error)</a>

```
searchKey: git.readUntilTimeout
tags: [private]
```

```Go
func readUntilTimeout(ctx context.Context, cmd *gitserver.Cmd) ([]byte, bool, error)
```

### <a id="isAllowedGitArg" href="#isAllowedGitArg">func isAllowedGitArg(allowedArgs []string, arg string) bool</a>

```
searchKey: git.isAllowedGitArg
tags: [private]
```

```Go
func isAllowedGitArg(allowedArgs []string, arg string) bool
```

isAllowedGitArg checks if the arg is allowed. 

### <a id="isAllowedGitCmd" href="#isAllowedGitCmd">func isAllowedGitCmd(args []string) bool</a>

```
searchKey: git.isAllowedGitCmd
tags: [private]
```

```Go
func isAllowedGitCmd(args []string) bool
```

isAllowedGitCmd checks if the cmd and arguments are allowed. 

### <a id="MergeBase" href="#MergeBase">func MergeBase(ctx context.Context, repo api.RepoName, a, b api.CommitID) (api.CommitID, error)</a>

```
searchKey: git.MergeBase
```

```Go
func MergeBase(ctx context.Context, repo api.RepoName, a, b api.CommitID) (api.CommitID, error)
```

MergeBase returns the merge base commit for the specified commits. 

### <a id="ResetMocks" href="#ResetMocks">func ResetMocks()</a>

```
searchKey: git.ResetMocks
```

```Go
func ResetMocks()
```

ResetMocks clears the mock functions set on Mocks (so that subsequent tests don't inadvertently use them). 

### <a id="HumanReadableBranchName" href="#HumanReadableBranchName">func HumanReadableBranchName(text string) string</a>

```
searchKey: git.HumanReadableBranchName
```

```Go
func HumanReadableBranchName(text string) string
```

HumanReadableBranchName returns a human readable branch name from the given text. It replaces unicode characters with their ASCII equivalent or similar and connects each component with a dash. 

Example: "Change coördination mechanism" -> "change-coordination-mechanism" 

### <a id="EnsureRefPrefix" href="#EnsureRefPrefix">func EnsureRefPrefix(ref string) string</a>

```
searchKey: git.EnsureRefPrefix
```

```Go
func EnsureRefPrefix(ref string) string
```

EnsureRefPrefix checks whether the ref is a full ref and contains the "refs/heads" prefix (i.e. "refs/heads/master") or just an abbreviated ref (i.e. "master") and adds the "refs/heads/" prefix if the latter is the case. 

### <a id="AbbreviateRef" href="#AbbreviateRef">func AbbreviateRef(ref string) string</a>

```
searchKey: git.AbbreviateRef
```

```Go
func AbbreviateRef(ref string) string
```

AbbreviateRef removes the "refs/heads/" prefix from a given ref. If the ref doesn't have the prefix, it returns it unchanged. 

### <a id="ListBranches" href="#ListBranches">func ListBranches(ctx context.Context, repo api.RepoName, opt BranchesOptions) ([]*Branch, error)</a>

```
searchKey: git.ListBranches
```

```Go
func ListBranches(ctx context.Context, repo api.RepoName, opt BranchesOptions) ([]*Branch, error)
```

ListBranches returns a list of all branches in the repository. 

### <a id="branches" href="#branches">func branches(ctx context.Context, repo api.RepoName, args ...string) ([]string, error)</a>

```
searchKey: git.branches
tags: [private]
```

```Go
func branches(ctx context.Context, repo api.RepoName, args ...string) ([]string, error)
```

branches runs the `git branch` command followed by the given arguments and returns the list of branches if successful. 

### <a id="ListTags" href="#ListTags">func ListTags(ctx context.Context, repo api.RepoName) ([]*Tag, error)</a>

```
searchKey: git.ListTags
```

```Go
func ListTags(ctx context.Context, repo api.RepoName) ([]*Tag, error)
```

ListTags returns a list of all tags in the repository. 

### <a id="parseTags" href="#parseTags">func parseTags(in []byte) ([]*Tag, error)</a>

```
searchKey: git.parseTags
tags: [private]
```

```Go
func parseTags(in []byte) ([]*Tag, error)
```

### <a id="ListRefs" href="#ListRefs">func ListRefs(ctx context.Context, repo api.RepoName) ([]Ref, error)</a>

```
searchKey: git.ListRefs
```

```Go
func ListRefs(ctx context.Context, repo api.RepoName) ([]Ref, error)
```

ListRefs returns a list of all refs in the repository. 

### <a id="showRef" href="#showRef">func showRef(ctx context.Context, repo api.RepoName, args ...string) ([]Ref, error)</a>

```
searchKey: git.showRef
tags: [private]
```

```Go
func showRef(ctx context.Context, repo api.RepoName, args ...string) ([]Ref, error)
```

### <a id="ValidateBranchName" href="#ValidateBranchName">func ValidateBranchName(branch string) bool</a>

```
searchKey: git.ValidateBranchName
```

```Go
func ValidateBranchName(branch string) bool
```

ValidateBranchName returns false if the given string is not a valid branch name. It follows the rules here: [https://git-scm.com/docs/git-check-ref-format](https://git-scm.com/docs/git-check-ref-format) NOTE: It does not require a slash as mentioned in point 2. 

### <a id="IsAbsoluteRevision" href="#IsAbsoluteRevision">func IsAbsoluteRevision(s string) bool</a>

```
searchKey: git.IsAbsoluteRevision
```

```Go
func IsAbsoluteRevision(s string) bool
```

IsAbsoluteRevision checks if the revision is a git OID SHA string. 

Note: This doesn't mean the SHA exists in a repository, nor does it mean it isn't a ref. Git allows 40-char hexadecimal strings to be references. 

### <a id="ensureAbsoluteCommit" href="#ensureAbsoluteCommit">func ensureAbsoluteCommit(commitID api.CommitID) error</a>

```
searchKey: git.ensureAbsoluteCommit
tags: [private]
```

```Go
func ensureAbsoluteCommit(commitID api.CommitID) error
```

### <a id="ResolveRevision" href="#ResolveRevision">func ResolveRevision(ctx context.Context, repo api.RepoName, spec string, opt ResolveRevisionOptions) (api.CommitID, error)</a>

```
searchKey: git.ResolveRevision
```

```Go
func ResolveRevision(ctx context.Context, repo api.RepoName, spec string, opt ResolveRevisionOptions) (api.CommitID, error)
```

ResolveRevision will return the absolute commit for a commit-ish spec. If spec is empty, HEAD is used. 

Error cases: * Repo does not exist: vcs.RepoNotExistError * Commit does not exist: RevisionNotFoundError * Empty repository: RevisionNotFoundError * Other unexpected errors. 

### <a id="runRevParse" href="#runRevParse">func runRevParse(ctx context.Context, cmd *gitserver.Cmd, spec string) (api.CommitID, error)</a>

```
searchKey: git.runRevParse
tags: [private]
```

```Go
func runRevParse(ctx context.Context, cmd *gitserver.Cmd, spec string) (api.CommitID, error)
```

runRevParse sends the git rev-parse command to gitserver. It interprets missing revision responses and converts them into RevisionNotFoundError. 

### <a id="ShortLog" href="#ShortLog">func ShortLog(ctx context.Context, repo api.RepoName, opt ShortLogOptions) ([]*PersonCount, error)</a>

```
searchKey: git.ShortLog
```

```Go
func ShortLog(ctx context.Context, repo api.RepoName, opt ShortLogOptions) ([]*PersonCount, error)
```

ShortLog returns the per-author commit statistics of the repo. 

### <a id="parseShortLog" href="#parseShortLog">func parseShortLog(out []byte) ([]*PersonCount, error)</a>

```
searchKey: git.parseShortLog
tags: [private]
```

```Go
func parseShortLog(out []byte) ([]*PersonCount, error)
```

### <a id="lenientParseAddress" href="#lenientParseAddress">func lenientParseAddress(address string) (*mail.Address, error)</a>

```
searchKey: git.lenientParseAddress
tags: [private]
```

```Go
func lenientParseAddress(address string) (*mail.Address, error)
```

lenientParseAddress is just like mail.ParseAddress, except that it treats the following somewhat-common malformed syntax where a user has misconfigured their email address as their name: 

```
foo@gmail.com <foo@gmail.com>

```
As a valid name, whereas mail.ParseAddress would return an error: 

```
mail: expected single address, got "<foo@gmail.com>"

```
### <a id="Lstat" href="#Lstat">func Lstat(ctx context.Context, repo api.RepoName, commit api.CommitID, path string) (fs.FileInfo, error)</a>

```
searchKey: git.Lstat
```

```Go
func Lstat(ctx context.Context, repo api.RepoName, commit api.CommitID, path string) (fs.FileInfo, error)
```

Lstat returns a FileInfo describing the named file at commit. If the file is a symbolic link, the returned FileInfo describes the symbolic link.  Lstat makes no attempt to follow the link. 

### <a id="Stat" href="#Stat">func Stat(ctx context.Context, repo api.RepoName, commit api.CommitID, path string) (fs.FileInfo, error)</a>

```
searchKey: git.Stat
```

```Go
func Stat(ctx context.Context, repo api.RepoName, commit api.CommitID, path string) (fs.FileInfo, error)
```

Stat returns a FileInfo describing the named file at commit. 

### <a id="ReadDir" href="#ReadDir">func ReadDir(ctx context.Context, repo api.RepoName, commit api.CommitID, path string, recurse bool) ([]fs.FileInfo, error)</a>

```
searchKey: git.ReadDir
```

```Go
func ReadDir(ctx context.Context, repo api.RepoName, commit api.CommitID, path string, recurse bool) ([]fs.FileInfo, error)
```

ReadDir reads the contents of the named directory at commit. 

### <a id="LsFiles" href="#LsFiles">func LsFiles(ctx context.Context, repo api.RepoName, commit api.CommitID) ([]string, error)</a>

```
searchKey: git.LsFiles
```

```Go
func LsFiles(ctx context.Context, repo api.RepoName, commit api.CommitID) ([]string, error)
```

LsFiles returns the output of `git ls-files` 

### <a id="lsTree" href="#lsTree">func lsTree(ctx context.Context, repo api.RepoName, commit api.CommitID, path string, recurse bool) ([]fs.FileInfo, error)</a>

```
searchKey: git.lsTree
tags: [private]
```

```Go
func lsTree(ctx context.Context, repo api.RepoName, commit api.CommitID, path string, recurse bool) ([]fs.FileInfo, error)
```

lsTree returns ls of tree at path. 

### <a id="lsTreeUncached" href="#lsTreeUncached">func lsTreeUncached(ctx context.Context, repo api.RepoName, commit api.CommitID, path string, recurse bool) ([]fs.FileInfo, error)</a>

```
searchKey: git.lsTreeUncached
tags: [private]
```

```Go
func lsTreeUncached(ctx context.Context, repo api.RepoName, commit api.CommitID, path string, recurse bool) ([]fs.FileInfo, error)
```

### <a id="TestRepository_BlameFile" href="#TestRepository_BlameFile">func TestRepository_BlameFile(t *testing.T)</a>

```
searchKey: git.TestRepository_BlameFile
tags: [private]
```

```Go
func TestRepository_BlameFile(t *testing.T)
```

### <a id="TestRead" href="#TestRead">func TestRead(t *testing.T)</a>

```
searchKey: git.TestRead
tags: [private]
```

```Go
func TestRead(t *testing.T)
```

### <a id="TestRepository_GetCommit" href="#TestRepository_GetCommit">func TestRepository_GetCommit(t *testing.T)</a>

```
searchKey: git.TestRepository_GetCommit
tags: [private]
```

```Go
func TestRepository_GetCommit(t *testing.T)
```

### <a id="TestRepository_HasCommitAfter" href="#TestRepository_HasCommitAfter">func TestRepository_HasCommitAfter(t *testing.T)</a>

```
searchKey: git.TestRepository_HasCommitAfter
tags: [private]
```

```Go
func TestRepository_HasCommitAfter(t *testing.T)
```

### <a id="TestRepository_FirstEverCommit" href="#TestRepository_FirstEverCommit">func TestRepository_FirstEverCommit(t *testing.T)</a>

```
searchKey: git.TestRepository_FirstEverCommit
tags: [private]
```

```Go
func TestRepository_FirstEverCommit(t *testing.T)
```

### <a id="TestRepository_FindNearestCommit" href="#TestRepository_FindNearestCommit">func TestRepository_FindNearestCommit(t *testing.T)</a>

```
searchKey: git.TestRepository_FindNearestCommit
tags: [private]
```

```Go
func TestRepository_FindNearestCommit(t *testing.T)
```

### <a id="TestRepository_Commits" href="#TestRepository_Commits">func TestRepository_Commits(t *testing.T)</a>

```
searchKey: git.TestRepository_Commits
tags: [private]
```

```Go
func TestRepository_Commits(t *testing.T)
```

### <a id="TestRepository_Commits_options" href="#TestRepository_Commits_options">func TestRepository_Commits_options(t *testing.T)</a>

```
searchKey: git.TestRepository_Commits_options
tags: [private]
```

```Go
func TestRepository_Commits_options(t *testing.T)
```

### <a id="TestRepository_Commits_options_path" href="#TestRepository_Commits_options_path">func TestRepository_Commits_options_path(t *testing.T)</a>

```
searchKey: git.TestRepository_Commits_options_path
tags: [private]
```

```Go
func TestRepository_Commits_options_path(t *testing.T)
```

### <a id="TestLogOnelineBatchScanner_batchclosed" href="#TestLogOnelineBatchScanner_batchclosed">func TestLogOnelineBatchScanner_batchclosed(t *testing.T)</a>

```
searchKey: git.TestLogOnelineBatchScanner_batchclosed
tags: [private]
```

```Go
func TestLogOnelineBatchScanner_batchclosed(t *testing.T)
```

Test we return errLogOnelineBatchScannerClosed is returned. It is very complicated to ensure we cover the code paths we care about. 

### <a id="TestLogOnelineBatchScanner_closed" href="#TestLogOnelineBatchScanner_closed">func TestLogOnelineBatchScanner_closed(t *testing.T)</a>

```
searchKey: git.TestLogOnelineBatchScanner_closed
tags: [private]
```

```Go
func TestLogOnelineBatchScanner_closed(t *testing.T)
```

This test is much simpler since we just set the batchsize to 1 to ensure we only ever test the first attempt to read resultC 

### <a id="TestLogOnelineBatchScanner_debounce" href="#TestLogOnelineBatchScanner_debounce">func TestLogOnelineBatchScanner_debounce(t *testing.T)</a>

```
searchKey: git.TestLogOnelineBatchScanner_debounce
tags: [private]
```

```Go
func TestLogOnelineBatchScanner_debounce(t *testing.T)
```

### <a id="TestLogOnelineBatchScanner_empty" href="#TestLogOnelineBatchScanner_empty">func TestLogOnelineBatchScanner_empty(t *testing.T)</a>

```
searchKey: git.TestLogOnelineBatchScanner_empty
tags: [private]
```

```Go
func TestLogOnelineBatchScanner_empty(t *testing.T)
```

### <a id="TestLogOnelineBatchScanner_small" href="#TestLogOnelineBatchScanner_small">func TestLogOnelineBatchScanner_small(t *testing.T)</a>

```
searchKey: git.TestLogOnelineBatchScanner_small
tags: [private]
```

```Go
func TestLogOnelineBatchScanner_small(t *testing.T)
```

### <a id="TestMessage" href="#TestMessage">func TestMessage(t *testing.T)</a>

```
searchKey: git.TestMessage
tags: [private]
```

```Go
func TestMessage(t *testing.T)
```

### <a id="TestFilterAndHighlightDiff" href="#TestFilterAndHighlightDiff">func TestFilterAndHighlightDiff(t *testing.T)</a>

```
searchKey: git.TestFilterAndHighlightDiff
tags: [private]
```

```Go
func TestFilterAndHighlightDiff(t *testing.T)
```

### <a id="TestSplitHunkMatches" href="#TestSplitHunkMatches">func TestSplitHunkMatches(t *testing.T)</a>

```
searchKey: git.TestSplitHunkMatches
tags: [private]
```

```Go
func TestSplitHunkMatches(t *testing.T)
```

### <a id="TestTruncateLongLines" href="#TestTruncateLongLines">func TestTruncateLongLines(t *testing.T)</a>

```
searchKey: git.TestTruncateLongLines
tags: [private]
```

```Go
func TestTruncateLongLines(t *testing.T)
```

### <a id="TestRepository_RawLogDiffSearch" href="#TestRepository_RawLogDiffSearch">func TestRepository_RawLogDiffSearch(t *testing.T)</a>

```
searchKey: git.TestRepository_RawLogDiffSearch
tags: [private]
```

```Go
func TestRepository_RawLogDiffSearch(t *testing.T)
```

### <a id="TestRepository_RawLogDiffSearch_empty" href="#TestRepository_RawLogDiffSearch_empty">func TestRepository_RawLogDiffSearch_empty(t *testing.T)</a>

```
searchKey: git.TestRepository_RawLogDiffSearch_empty
tags: [private]
```

```Go
func TestRepository_RawLogDiffSearch_empty(t *testing.T)
```

### <a id="TestRegexpToGlobBestEffort" href="#TestRegexpToGlobBestEffort">func TestRegexpToGlobBestEffort(t *testing.T)</a>

```
searchKey: git.TestRegexpToGlobBestEffort
tags: [private]
```

```Go
func TestRegexpToGlobBestEffort(t *testing.T)
```

### <a id="TestDiff" href="#TestDiff">func TestDiff(t *testing.T)</a>

```
searchKey: git.TestDiff
tags: [private]
```

```Go
func TestDiff(t *testing.T)
```

### <a id="TestDiffFileIterator" href="#TestDiffFileIterator">func TestDiffFileIterator(t *testing.T)</a>

```
searchKey: git.TestDiffFileIterator
tags: [private]
```

```Go
func TestDiffFileIterator(t *testing.T)
```

### <a id="TestExecSafe" href="#TestExecSafe">func TestExecSafe(t *testing.T)</a>

```
searchKey: git.TestExecSafe
tags: [private]
```

```Go
func TestExecSafe(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: git.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

### <a id="init.main_test.go" href="#init.main_test.go">func init()</a>

```
searchKey: git.init
tags: [private]
```

```Go
func init()
```

done in init since the go vet analysis "ctrlflow" is tripped up if this is done as part of TestMain. 

### <a id="AsJSON" href="#AsJSON">func AsJSON(v interface{}) string</a>

```
searchKey: git.AsJSON
tags: [private]
```

```Go
func AsJSON(v interface{}) string
```

### <a id="InitGitRepository" href="#InitGitRepository">func InitGitRepository(t testing.TB, cmds ...string) string</a>

```
searchKey: git.InitGitRepository
tags: [private]
```

```Go
func InitGitRepository(t testing.TB, cmds ...string) string
```

InitGitRepository initializes a new Git repository and runs cmds in a new temporary directory (returned as dir). 

### <a id="GitCommand" href="#GitCommand">func GitCommand(dir, name string, args ...string) *exec.Cmd</a>

```
searchKey: git.GitCommand
tags: [private]
```

```Go
func GitCommand(dir, name string, args ...string) *exec.Cmd
```

### <a id="MakeGitRepository" href="#MakeGitRepository">func MakeGitRepository(t testing.TB, cmds ...string) api.RepoName</a>

```
searchKey: git.MakeGitRepository
tags: [private]
```

```Go
func MakeGitRepository(t testing.TB, cmds ...string) api.RepoName
```

MakeGitRepository calls initGitRepository to create a new Git repository and returns a handle to it. 

### <a id="CommitsEqual" href="#CommitsEqual">func CommitsEqual(a, b *Commit) bool</a>

```
searchKey: git.CommitsEqual
tags: [private]
```

```Go
func CommitsEqual(a, b *Commit) bool
```

### <a id="MustParseTime" href="#MustParseTime">func MustParseTime(layout, value string) time.Time</a>

```
searchKey: git.MustParseTime
tags: [private]
```

```Go
func MustParseTime(layout, value string) time.Time
```

### <a id="AppleTime" href="#AppleTime">func AppleTime(t string) string</a>

```
searchKey: git.AppleTime
tags: [private]
```

```Go
func AppleTime(t string) string
```

### <a id="ComputeCommitHash" href="#ComputeCommitHash">func ComputeCommitHash(repoDir string, git bool) string</a>

```
searchKey: git.ComputeCommitHash
tags: [private]
```

```Go
func ComputeCommitHash(repoDir string, git bool) string
```

Computes hash of last commit in a given repo dir On Windows, content of a "link file" differs based on the tool that produced it. For example: - Cygwin may create four different link types, see [https://cygwin.com/cygwin-ug-net/using.html#pathnames-symlinks](https://cygwin.com/cygwin-ug-net/using.html#pathnames-symlinks), - MSYS's ln copies target file Such behavior makes impossible precalculation of SHA hashes to be used in TestRepository_FileSystem_Symlinks because for example Git for Windows ([http://git-scm.com](http://git-scm.com)) is not aware of symlinks and computes link file's SHA which may differ from original file content's SHA. As a temporary workaround, we calculating SHA hash by asking git/hg to compute it 

### <a id="TestMerger_MergeBase" href="#TestMerger_MergeBase">func TestMerger_MergeBase(t *testing.T)</a>

```
searchKey: git.TestMerger_MergeBase
tags: [private]
```

```Go
func TestMerger_MergeBase(t *testing.T)
```

### <a id="TestGetObject" href="#TestGetObject">func TestGetObject(t *testing.T)</a>

```
searchKey: git.TestGetObject
tags: [private]
```

```Go
func TestGetObject(t *testing.T)
```

### <a id="TestRefGlobs" href="#TestRefGlobs">func TestRefGlobs(t *testing.T)</a>

```
searchKey: git.TestRefGlobs
tags: [private]
```

```Go
func TestRefGlobs(t *testing.T)
```

### <a id="TestHumanReadableBranchName" href="#TestHumanReadableBranchName">func TestHumanReadableBranchName(t *testing.T)</a>

```
searchKey: git.TestHumanReadableBranchName
tags: [private]
```

```Go
func TestHumanReadableBranchName(t *testing.T)
```

### <a id="TestRepository_ListBranches" href="#TestRepository_ListBranches">func TestRepository_ListBranches(t *testing.T)</a>

```
searchKey: git.TestRepository_ListBranches
tags: [private]
```

```Go
func TestRepository_ListBranches(t *testing.T)
```

### <a id="TestRepository_Branches_MergedInto" href="#TestRepository_Branches_MergedInto">func TestRepository_Branches_MergedInto(t *testing.T)</a>

```
searchKey: git.TestRepository_Branches_MergedInto
tags: [private]
```

```Go
func TestRepository_Branches_MergedInto(t *testing.T)
```

### <a id="TestRepository_Branches_ContainsCommit" href="#TestRepository_Branches_ContainsCommit">func TestRepository_Branches_ContainsCommit(t *testing.T)</a>

```
searchKey: git.TestRepository_Branches_ContainsCommit
tags: [private]
```

```Go
func TestRepository_Branches_ContainsCommit(t *testing.T)
```

### <a id="TestRepository_Branches_BehindAheadCounts" href="#TestRepository_Branches_BehindAheadCounts">func TestRepository_Branches_BehindAheadCounts(t *testing.T)</a>

```
searchKey: git.TestRepository_Branches_BehindAheadCounts
tags: [private]
```

```Go
func TestRepository_Branches_BehindAheadCounts(t *testing.T)
```

### <a id="TestRepository_Branches_IncludeCommit" href="#TestRepository_Branches_IncludeCommit">func TestRepository_Branches_IncludeCommit(t *testing.T)</a>

```
searchKey: git.TestRepository_Branches_IncludeCommit
tags: [private]
```

```Go
func TestRepository_Branches_IncludeCommit(t *testing.T)
```

### <a id="TestRepository_ListTags" href="#TestRepository_ListTags">func TestRepository_ListTags(t *testing.T)</a>

```
searchKey: git.TestRepository_ListTags
tags: [private]
```

```Go
func TestRepository_ListTags(t *testing.T)
```

### <a id="TestRepository_parseTags_WithoutCreatorDate" href="#TestRepository_parseTags_WithoutCreatorDate">func TestRepository_parseTags_WithoutCreatorDate(t *testing.T)</a>

```
searchKey: git.TestRepository_parseTags_WithoutCreatorDate
tags: [private]
```

```Go
func TestRepository_parseTags_WithoutCreatorDate(t *testing.T)
```

See [https://github.com/sourcegraph/sourcegraph/issues/5453](https://github.com/sourcegraph/sourcegraph/issues/5453) 

### <a id="TestValidateBranchName" href="#TestValidateBranchName">func TestValidateBranchName(t *testing.T)</a>

```
searchKey: git.TestValidateBranchName
tags: [private]
```

```Go
func TestValidateBranchName(t *testing.T)
```

### <a id="TestIsAbsoluteRevision" href="#TestIsAbsoluteRevision">func TestIsAbsoluteRevision(t *testing.T)</a>

```
searchKey: git.TestIsAbsoluteRevision
tags: [private]
```

```Go
func TestIsAbsoluteRevision(t *testing.T)
```

### <a id="TestRepository_ResolveBranch" href="#TestRepository_ResolveBranch">func TestRepository_ResolveBranch(t *testing.T)</a>

```
searchKey: git.TestRepository_ResolveBranch
tags: [private]
```

```Go
func TestRepository_ResolveBranch(t *testing.T)
```

### <a id="TestRepository_ResolveBranch_error" href="#TestRepository_ResolveBranch_error">func TestRepository_ResolveBranch_error(t *testing.T)</a>

```
searchKey: git.TestRepository_ResolveBranch_error
tags: [private]
```

```Go
func TestRepository_ResolveBranch_error(t *testing.T)
```

### <a id="TestRepository_ResolveTag" href="#TestRepository_ResolveTag">func TestRepository_ResolveTag(t *testing.T)</a>

```
searchKey: git.TestRepository_ResolveTag
tags: [private]
```

```Go
func TestRepository_ResolveTag(t *testing.T)
```

### <a id="TestRepository_ResolveTag_error" href="#TestRepository_ResolveTag_error">func TestRepository_ResolveTag_error(t *testing.T)</a>

```
searchKey: git.TestRepository_ResolveTag_error
tags: [private]
```

```Go
func TestRepository_ResolveTag_error(t *testing.T)
```

### <a id="TestParseShortLog" href="#TestParseShortLog">func TestParseShortLog(t *testing.T)</a>

```
searchKey: git.TestParseShortLog
tags: [private]
```

```Go
func TestParseShortLog(t *testing.T)
```

### <a id="TestRepository_FileSystem_Symlinks" href="#TestRepository_FileSystem_Symlinks">func TestRepository_FileSystem_Symlinks(t *testing.T)</a>

```
searchKey: git.TestRepository_FileSystem_Symlinks
tags: [private]
```

```Go
func TestRepository_FileSystem_Symlinks(t *testing.T)
```

### <a id="TestRepository_FileSystem" href="#TestRepository_FileSystem">func TestRepository_FileSystem(t *testing.T)</a>

```
searchKey: git.TestRepository_FileSystem
tags: [private]
```

```Go
func TestRepository_FileSystem(t *testing.T)
```

### <a id="TestRepository_FileSystem_quoteChars" href="#TestRepository_FileSystem_quoteChars">func TestRepository_FileSystem_quoteChars(t *testing.T)</a>

```
searchKey: git.TestRepository_FileSystem_quoteChars
tags: [private]
```

```Go
func TestRepository_FileSystem_quoteChars(t *testing.T)
```

### <a id="TestRepository_FileSystem_gitSubmodules" href="#TestRepository_FileSystem_gitSubmodules">func TestRepository_FileSystem_gitSubmodules(t *testing.T)</a>

```
searchKey: git.TestRepository_FileSystem_gitSubmodules
tags: [private]
```

```Go
func TestRepository_FileSystem_gitSubmodules(t *testing.T)
```

