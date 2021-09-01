# Package backend

Package backend contains structs and functions which interact with our backends, mostly our DB backend. 

## Index

* [Constants](#const)
    * [const authzBypass](#authzBypass)
    * [const getFirstVersionQuery](#getFirstVersionQuery)
    * [const getVersionQuery](#getVersionQuery)
    * [const upsertVersionQuery](#upsertVersionQuery)
* [Variables](#var)
    * [var ErrMustBeSiteAdmin](#ErrMustBeSiteAdmin)
    * [var ErrNotAnOrgMember](#ErrNotAnOrgMember)
    * [var ErrNotAuthenticated](#ErrNotAuthenticated)
    * [var MockCountGoImporters](#MockCountGoImporters)
    * [var MockMakePasswordResetURL](#MockMakePasswordResetURL)
    * [var Mocks](#Mocks)
    * [var Repos](#Repos)
    * [var Symbols](#Symbols)
    * [var UserEmails](#UserEmails)
    * [var countGoImportersHTTPClient](#countGoImportersHTTPClient)
    * [var errRepoNotFound](#errRepoNotFound)
    * [var goImportersCountCache](#goImportersCountCache)
    * [var inventoryCache](#inventoryCache)
    * [var metricIsRepoCloneable](#metricIsRepoCloneable)
    * [var metricLabels](#metricLabels)
    * [var requestDuration](#requestDuration)
    * [var requestGauge](#requestGauge)
    * [var updateAccountEmailTemplate](#updateAccountEmailTemplate)
    * [var useEnhancedLanguageDetection](#useEnhancedLanguageDetection)
    * [var verifyEmailTemplates](#verifyEmailTemplates)
* [Types](#type)
    * [type ErrRepoSeeOther struct](#ErrRepoSeeOther)
        * [func (e ErrRepoSeeOther) Error() string](#ErrRepoSeeOther.Error)
    * [type InsufficientAuthorizationError struct](#InsufficientAuthorizationError)
        * [func (e *InsufficientAuthorizationError) Error() string](#InsufficientAuthorizationError.Error)
        * [func (e *InsufficientAuthorizationError) Unauthorized() bool](#InsufficientAuthorizationError.Unauthorized)
    * [type MockRepos struct](#MockRepos)
        * [func (s *MockRepos) MockGet(t *testing.T, wantRepo api.RepoID) (called *bool)](#MockRepos.MockGet)
        * [func (s *MockRepos) MockGetByName(t *testing.T, wantName api.RepoName, repo api.RepoID) (called *bool)](#MockRepos.MockGetByName)
        * [func (s *MockRepos) MockGetCommit_Return_NoCheck(t *testing.T, commit *git.Commit) (called *bool)](#MockRepos.MockGetCommit_Return_NoCheck)
        * [func (s *MockRepos) MockGet_Return(t *testing.T, returns *types.Repo) (called *bool)](#MockRepos.MockGet_Return)
        * [func (s *MockRepos) MockList(t *testing.T, wantRepos ...api.RepoName) (called *bool)](#MockRepos.MockList)
        * [func (s *MockRepos) MockResolveRev_NoCheck(t *testing.T, commitID api.CommitID) (called *bool)](#MockRepos.MockResolveRev_NoCheck)
        * [func (s *MockRepos) MockResolveRev_NotFound(t *testing.T, wantRepo api.RepoID, wantRev string) (called *bool)](#MockRepos.MockResolveRev_NotFound)
    * [type MockServices struct](#MockServices)
    * [type UpgradeError struct](#UpgradeError)
        * [func (e UpgradeError) Error() string](#UpgradeError.Error)
    * [type contextKey int](#contextKey)
    * [type gitObjectInfo string](#gitObjectInfo)
        * [func (oid gitObjectInfo) OID() git.OID](#gitObjectInfo.OID)
    * [type mockRoundTripper struct](#mockRoundTripper)
        * [func (t mockRoundTripper) RoundTrip(req *http.Request) (*http.Response, error)](#mockRoundTripper.RoundTrip)
    * [type repos struct](#repos)
        * [func (s *repos) Add(ctx context.Context, name api.RepoName) (addedName api.RepoName, err error)](#repos.Add)
        * [func (s *repos) Get(ctx context.Context, repo api.RepoID) (_ *types.Repo, err error)](#repos.Get)
        * [func (s *repos) GetByName(ctx context.Context, name api.RepoName) (_ *types.Repo, err error)](#repos.GetByName)
        * [func (s *repos) GetCommit(ctx context.Context, repo *types.Repo, commitID api.CommitID) (res *git.Commit, err error)](#repos.GetCommit)
        * [func (s *repos) GetInventory(ctx context.Context, repo *types.Repo, commitID api.CommitID, forceEnhancedLanguageDetection bool) (res *inventory.Inventory, err error)](#repos.GetInventory)
        * [func (s *repos) List(ctx context.Context, opt database.ReposListOptions) (repos []*types.Repo, err error)](#repos.List)
        * [func (s *repos) ListDefault(ctx context.Context) (repos []types.RepoName, err error)](#repos.ListDefault)
        * [func (s *repos) ListIndexable(ctx context.Context) (repos []types.RepoName, err error)](#repos.ListIndexable)
        * [func (s *repos) ResolveRev(ctx context.Context, repo *types.Repo, rev string) (commitID api.CommitID, err error)](#repos.ResolveRev)
    * [type symbols struct{}](#symbols)
        * [func (symbols) ListTags(ctx context.Context, args search.SymbolsParameters) (result.Symbols, error)](#symbols.ListTags)
    * [type userEmails struct{}](#userEmails)
        * [func (userEmails) Add(ctx context.Context, db dbutil.DB, userID int32, email string) error](#userEmails.Add)
        * [func (userEmails) SendUserEmailOnFieldUpdate(ctx context.Context, id int32, change string) error](#userEmails.SendUserEmailOnFieldUpdate)
* [Functions](#func)
    * [func CheckCurrentUserIsSiteAdmin(ctx context.Context, db dbutil.DB) error](#CheckCurrentUserIsSiteAdmin)
    * [func CheckOrgAccess(ctx context.Context, db dbutil.DB, orgID int32) error](#CheckOrgAccess)
    * [func CheckOrgAccessOrSiteAdmin(ctx context.Context, db dbutil.DB, orgID int32) error](#CheckOrgAccessOrSiteAdmin)
    * [func CheckSameUser(ctx context.Context, subjectUserID int32) error](#CheckSameUser)
    * [func CheckSiteAdminOrSameUser(ctx context.Context, db dbutil.DB, subjectUserID int32) error](#CheckSiteAdminOrSameUser)
    * [func CheckUserIsSiteAdmin(ctx context.Context, db dbutil.DB, userID int32) error](#CheckUserIsSiteAdmin)
    * [func CountGoImporters(ctx context.Context, repo api.RepoName) (count int, err error)](#CountGoImporters)
    * [func CurrentUser(ctx context.Context, db dbutil.DB) (*types.User, error)](#CurrentUser)
    * [func GetFirstServiceVersion(ctx context.Context, service string) (version string, err error)](#GetFirstServiceVersion)
    * [func InventoryContext(repo api.RepoName, commitID api.CommitID, forceEnhancedLanguageDetection bool) (inventory.Context, error)](#InventoryContext)
    * [func IsValidUpgrade(previous, latest *semver.Version) bool](#IsValidUpgrade)
    * [func MakeEmailVerificationCode() (string, error)](#MakeEmailVerificationCode)
    * [func MakePasswordResetURL(ctx context.Context, userID int32) (*url.URL, error)](#MakePasswordResetURL)
    * [func MakeRandomHardToGuessPassword() string](#MakeRandomHardToGuessPassword)
    * [func SendUserEmailVerificationEmail(ctx context.Context, username, email, code string) error](#SendUserEmailVerificationEmail)
    * [func TestCheckEmailAbuse(t *testing.T)](#TestCheckEmailAbuse)
    * [func TestCountGoImporters(t *testing.T)](#TestCountGoImporters)
    * [func TestGetFirstServiceVersion(t *testing.T)](#TestGetFirstServiceVersion)
    * [func TestIsPossibleExternallyImportableGoPackageDir(t *testing.T)](#TestIsPossibleExternallyImportableGoPackageDir)
    * [func TestIsValidUpgrade(t *testing.T)](#TestIsValidUpgrade)
    * [func TestListGoPackagesInRepoImprecise(t *testing.T)](#TestListGoPackagesInRepoImprecise)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestReposGetInventory(t *testing.T)](#TestReposGetInventory)
    * [func TestReposService_Get(t *testing.T)](#TestReposService_Get)
    * [func TestReposService_List(t *testing.T)](#TestReposService_List)
    * [func TestRepos_Add(t *testing.T)](#TestRepos_Add)
    * [func TestRepos_GetCommit_repoupdaterError(t *testing.T)](#TestRepos_GetCommit_repoupdaterError)
    * [func TestRepos_ResolveRev_commitIDSpecified_failsToResolve(t *testing.T)](#TestRepos_ResolveRev_commitIDSpecified_failsToResolve)
    * [func TestRepos_ResolveRev_commitIDSpecified_resolvesCommitID(t *testing.T)](#TestRepos_ResolveRev_commitIDSpecified_resolvesCommitID)
    * [func TestRepos_ResolveRev_noCommitIDSpecified_resolvesRev(t *testing.T)](#TestRepos_ResolveRev_noCommitIDSpecified_resolvesRev)
    * [func TestRepos_ResolveRev_noRevSpecified_getsDefaultBranch(t *testing.T)](#TestRepos_ResolveRev_noRevSpecified_getsDefaultBranch)
    * [func TestSendUserEmailOnFieldUpdate(t *testing.T)](#TestSendUserEmailOnFieldUpdate)
    * [func TestSendUserEmailVerificationEmail(t *testing.T)](#TestSendUserEmailVerificationEmail)
    * [func TestUpdateServiceVersion(t *testing.T)](#TestUpdateServiceVersion)
    * [func UpdateServiceVersion(ctx context.Context, service, version string) error](#UpdateServiceVersion)
    * [func WithAuthzBypass(ctx context.Context) context.Context](#WithAuthzBypass)
    * [func checkEmailAbuse(ctx context.Context, userID int32) (abused bool, reason string, err error)](#checkEmailAbuse)
    * [func checkOrgAccess(ctx context.Context, db dbutil.DB, orgID int32, allowAdmin bool) error](#checkOrgAccess)
    * [func checkUserIsOrgMember(ctx context.Context, db dbutil.DB, userID, orgID int32) error](#checkUserIsOrgMember)
    * [func hasAuthzBypass(ctx context.Context) bool](#hasAuthzBypass)
    * [func init()](#init.versions_test.go)
    * [func isPossibleExternallyImportableGoPackageDir(dirPath string) bool](#isPossibleExternallyImportableGoPackageDir)
    * [func listGoPackagesInRepoImprecise(ctx context.Context, repoName api.RepoName) ([]string, error)](#listGoPackagesInRepoImprecise)
    * [func shouldRedirect(name api.RepoName) bool](#shouldRedirect)
    * [func testContext() context.Context](#testContext)
    * [func trace(ctx context.Context, server, method string, arg interface{}, err *error) (context.Context, func())](#trace)


## <a id="const" href="#const">Constants</a>

### <a id="authzBypass" href="#authzBypass">const authzBypass</a>

```
searchKey: backend.authzBypass
tags: [constant number private]
```

```Go
const authzBypass contextKey = iota
```

### <a id="getFirstVersionQuery" href="#getFirstVersionQuery">const getFirstVersionQuery</a>

```
searchKey: backend.getFirstVersionQuery
tags: [constant string private]
```

```Go
const getFirstVersionQuery = `SELECT first_version FROM versions WHERE service = %s`
```

### <a id="getVersionQuery" href="#getVersionQuery">const getVersionQuery</a>

```
searchKey: backend.getVersionQuery
tags: [constant string private]
```

```Go
const getVersionQuery = `SELECT version FROM versions WHERE service = %s`
```

### <a id="upsertVersionQuery" href="#upsertVersionQuery">const upsertVersionQuery</a>

```
searchKey: backend.upsertVersionQuery
tags: [constant string private]
```

```Go
const upsertVersionQuery = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="ErrMustBeSiteAdmin" href="#ErrMustBeSiteAdmin">var ErrMustBeSiteAdmin</a>

```
searchKey: backend.ErrMustBeSiteAdmin
tags: [variable interface]
```

```Go
var ErrMustBeSiteAdmin = errors.New("must be site admin")
```

### <a id="ErrNotAnOrgMember" href="#ErrNotAnOrgMember">var ErrNotAnOrgMember</a>

```
searchKey: backend.ErrNotAnOrgMember
tags: [variable interface]
```

```Go
var ErrNotAnOrgMember = errors.New("current user is not an org member")
```

### <a id="ErrNotAuthenticated" href="#ErrNotAuthenticated">var ErrNotAuthenticated</a>

```
searchKey: backend.ErrNotAuthenticated
tags: [variable interface]
```

```Go
var ErrNotAuthenticated = errors.New("not authenticated")
```

### <a id="MockCountGoImporters" href="#MockCountGoImporters">var MockCountGoImporters</a>

```
searchKey: backend.MockCountGoImporters
tags: [variable function]
```

```Go
var MockCountGoImporters func(ctx context.Context, repo api.RepoName) (int, error)
```

### <a id="MockMakePasswordResetURL" href="#MockMakePasswordResetURL">var MockMakePasswordResetURL</a>

```
searchKey: backend.MockMakePasswordResetURL
tags: [variable function]
```

```Go
var MockMakePasswordResetURL func(ctx context.Context, userID int32) (*url.URL, error)
```

### <a id="Mocks" href="#Mocks">var Mocks</a>

```
searchKey: backend.Mocks
tags: [variable struct]
```

```Go
var Mocks MockServices
```

### <a id="Repos" href="#Repos">var Repos</a>

```
searchKey: backend.Repos
tags: [variable struct]
```

```Go
var Repos = ...
```

### <a id="Symbols" href="#Symbols">var Symbols</a>

```
searchKey: backend.Symbols
tags: [variable struct]
```

```Go
var Symbols = &symbols{}
```

Symbols backend. 

### <a id="UserEmails" href="#UserEmails">var UserEmails</a>

```
searchKey: backend.UserEmails
tags: [variable struct]
```

```Go
var UserEmails = &userEmails{}
```

UserEmails contains backend methods related to user email addresses. 

### <a id="countGoImportersHTTPClient" href="#countGoImportersHTTPClient">var countGoImportersHTTPClient</a>

```
searchKey: backend.countGoImportersHTTPClient
tags: [variable struct private]
```

```Go
var countGoImportersHTTPClient *http.Client // mockable in tests

```

### <a id="errRepoNotFound" href="#errRepoNotFound">var errRepoNotFound</a>

```
searchKey: backend.errRepoNotFound
tags: [variable struct private]
```

```Go
var errRepoNotFound = &errcode.Mock{
	Message:    "repo not found",
	IsNotFound: true,
}
```

### <a id="goImportersCountCache" href="#goImportersCountCache">var goImportersCountCache</a>

```
searchKey: backend.goImportersCountCache
tags: [variable struct private]
```

```Go
var goImportersCountCache = rcache.NewWithTTL("go-importers-count", 14400) // 4 hours

```

### <a id="inventoryCache" href="#inventoryCache">var inventoryCache</a>

```
searchKey: backend.inventoryCache
tags: [variable struct private]
```

```Go
var inventoryCache = rcache.New(fmt.Sprintf("inv:v2:enhanced_%v", useEnhancedLanguageDetection))
```

### <a id="metricIsRepoCloneable" href="#metricIsRepoCloneable">var metricIsRepoCloneable</a>

```
searchKey: backend.metricIsRepoCloneable
tags: [variable struct private]
```

```Go
var metricIsRepoCloneable = ...
```

### <a id="metricLabels" href="#metricLabels">var metricLabels</a>

```
searchKey: backend.metricLabels
tags: [variable array string private]
```

```Go
var metricLabels = []string{"method", "success"}
```

### <a id="requestDuration" href="#requestDuration">var requestDuration</a>

```
searchKey: backend.requestDuration
tags: [variable struct private]
```

```Go
var requestDuration = ...
```

### <a id="requestGauge" href="#requestGauge">var requestGauge</a>

```
searchKey: backend.requestGauge
tags: [variable struct private]
```

```Go
var requestGauge = ...
```

### <a id="updateAccountEmailTemplate" href="#updateAccountEmailTemplate">var updateAccountEmailTemplate</a>

```
searchKey: backend.updateAccountEmailTemplate
tags: [variable struct private]
```

```Go
var updateAccountEmailTemplate = ...
```

### <a id="useEnhancedLanguageDetection" href="#useEnhancedLanguageDetection">var useEnhancedLanguageDetection</a>

```
searchKey: backend.useEnhancedLanguageDetection
tags: [variable boolean private]
```

```Go
var useEnhancedLanguageDetection, _ = ...
```

Feature flag for enhanced (but much slower) language detection that uses file contents, not just filenames. Enabled by default. 

### <a id="verifyEmailTemplates" href="#verifyEmailTemplates">var verifyEmailTemplates</a>

```
searchKey: backend.verifyEmailTemplates
tags: [variable struct private]
```

```Go
var verifyEmailTemplates = ...
```

## <a id="type" href="#type">Types</a>

### <a id="ErrRepoSeeOther" href="#ErrRepoSeeOther">type ErrRepoSeeOther struct</a>

```
searchKey: backend.ErrRepoSeeOther
tags: [struct]
```

```Go
type ErrRepoSeeOther struct {
	// RedirectURL is the base URL for the repository at an external location.
	RedirectURL string
}
```

ErrRepoSeeOther indicates that the repo does not exist on this server but might exist on an external Sourcegraph server. 

#### <a id="ErrRepoSeeOther.Error" href="#ErrRepoSeeOther.Error">func (e ErrRepoSeeOther) Error() string</a>

```
searchKey: backend.ErrRepoSeeOther.Error
tags: [method]
```

```Go
func (e ErrRepoSeeOther) Error() string
```

### <a id="InsufficientAuthorizationError" href="#InsufficientAuthorizationError">type InsufficientAuthorizationError struct</a>

```
searchKey: backend.InsufficientAuthorizationError
tags: [struct]
```

```Go
type InsufficientAuthorizationError struct {
	Message string
}
```

InsufficientAuthorizationError is an error that occurs when the authentication is technically valid (e.g., the token is not expired) but does not yield a user with privileges to perform a certain action. 

#### <a id="InsufficientAuthorizationError.Error" href="#InsufficientAuthorizationError.Error">func (e *InsufficientAuthorizationError) Error() string</a>

```
searchKey: backend.InsufficientAuthorizationError.Error
tags: [method]
```

```Go
func (e *InsufficientAuthorizationError) Error() string
```

#### <a id="InsufficientAuthorizationError.Unauthorized" href="#InsufficientAuthorizationError.Unauthorized">func (e *InsufficientAuthorizationError) Unauthorized() bool</a>

```
searchKey: backend.InsufficientAuthorizationError.Unauthorized
tags: [method]
```

```Go
func (e *InsufficientAuthorizationError) Unauthorized() bool
```

### <a id="MockRepos" href="#MockRepos">type MockRepos struct</a>

```
searchKey: backend.MockRepos
tags: [struct]
```

```Go
type MockRepos struct {
	Get          func(v0 context.Context, id api.RepoID) (*types.Repo, error)
	GetByName    func(v0 context.Context, name api.RepoName) (*types.Repo, error)
	List         func(v0 context.Context, v1 database.ReposListOptions) ([]*types.Repo, error)
	GetCommit    func(v0 context.Context, repo *types.Repo, commitID api.CommitID) (*git.Commit, error)
	ResolveRev   func(v0 context.Context, repo *types.Repo, rev string) (api.CommitID, error)
	GetInventory func(v0 context.Context, repo *types.Repo, commitID api.CommitID) (*inventory.Inventory, error)
}
```

#### <a id="MockRepos.MockGet" href="#MockRepos.MockGet">func (s *MockRepos) MockGet(t *testing.T, wantRepo api.RepoID) (called *bool)</a>

```
searchKey: backend.MockRepos.MockGet
tags: [method]
```

```Go
func (s *MockRepos) MockGet(t *testing.T, wantRepo api.RepoID) (called *bool)
```

#### <a id="MockRepos.MockGetByName" href="#MockRepos.MockGetByName">func (s *MockRepos) MockGetByName(t *testing.T, wantName api.RepoName, repo api.RepoID) (called *bool)</a>

```
searchKey: backend.MockRepos.MockGetByName
tags: [method]
```

```Go
func (s *MockRepos) MockGetByName(t *testing.T, wantName api.RepoName, repo api.RepoID) (called *bool)
```

#### <a id="MockRepos.MockGetCommit_Return_NoCheck" href="#MockRepos.MockGetCommit_Return_NoCheck">func (s *MockRepos) MockGetCommit_Return_NoCheck(t *testing.T, commit *git.Commit) (called *bool)</a>

```
searchKey: backend.MockRepos.MockGetCommit_Return_NoCheck
tags: [method]
```

```Go
func (s *MockRepos) MockGetCommit_Return_NoCheck(t *testing.T, commit *git.Commit) (called *bool)
```

#### <a id="MockRepos.MockGet_Return" href="#MockRepos.MockGet_Return">func (s *MockRepos) MockGet_Return(t *testing.T, returns *types.Repo) (called *bool)</a>

```
searchKey: backend.MockRepos.MockGet_Return
tags: [method]
```

```Go
func (s *MockRepos) MockGet_Return(t *testing.T, returns *types.Repo) (called *bool)
```

#### <a id="MockRepos.MockList" href="#MockRepos.MockList">func (s *MockRepos) MockList(t *testing.T, wantRepos ...api.RepoName) (called *bool)</a>

```
searchKey: backend.MockRepos.MockList
tags: [method]
```

```Go
func (s *MockRepos) MockList(t *testing.T, wantRepos ...api.RepoName) (called *bool)
```

#### <a id="MockRepos.MockResolveRev_NoCheck" href="#MockRepos.MockResolveRev_NoCheck">func (s *MockRepos) MockResolveRev_NoCheck(t *testing.T, commitID api.CommitID) (called *bool)</a>

```
searchKey: backend.MockRepos.MockResolveRev_NoCheck
tags: [method]
```

```Go
func (s *MockRepos) MockResolveRev_NoCheck(t *testing.T, commitID api.CommitID) (called *bool)
```

#### <a id="MockRepos.MockResolveRev_NotFound" href="#MockRepos.MockResolveRev_NotFound">func (s *MockRepos) MockResolveRev_NotFound(t *testing.T, wantRepo api.RepoID, wantRev string) (called *bool)</a>

```
searchKey: backend.MockRepos.MockResolveRev_NotFound
tags: [method]
```

```Go
func (s *MockRepos) MockResolveRev_NotFound(t *testing.T, wantRepo api.RepoID, wantRev string) (called *bool)
```

### <a id="MockServices" href="#MockServices">type MockServices struct</a>

```
searchKey: backend.MockServices
tags: [struct]
```

```Go
type MockServices struct {
	Repos MockRepos
}
```

### <a id="UpgradeError" href="#UpgradeError">type UpgradeError struct</a>

```
searchKey: backend.UpgradeError
tags: [struct]
```

```Go
type UpgradeError struct {
	Service  string
	Previous *semver.Version
	Latest   *semver.Version
}
```

UpgradeError is returned by UpdateServiceVersion when it faces an upgrade policy violation error. 

#### <a id="UpgradeError.Error" href="#UpgradeError.Error">func (e UpgradeError) Error() string</a>

```
searchKey: backend.UpgradeError.Error
tags: [method]
```

```Go
func (e UpgradeError) Error() string
```

Error implements the error interface. 

### <a id="contextKey" href="#contextKey">type contextKey int</a>

```
searchKey: backend.contextKey
tags: [number private]
```

```Go
type contextKey int
```

### <a id="gitObjectInfo" href="#gitObjectInfo">type gitObjectInfo string</a>

```
searchKey: backend.gitObjectInfo
tags: [string private]
```

```Go
type gitObjectInfo string
```

#### <a id="gitObjectInfo.OID" href="#gitObjectInfo.OID">func (oid gitObjectInfo) OID() git.OID</a>

```
searchKey: backend.gitObjectInfo.OID
tags: [method private]
```

```Go
func (oid gitObjectInfo) OID() git.OID
```

### <a id="mockRoundTripper" href="#mockRoundTripper">type mockRoundTripper struct</a>

```
searchKey: backend.mockRoundTripper
tags: [struct private]
```

```Go
type mockRoundTripper struct {
	response string
}
```

#### <a id="mockRoundTripper.RoundTrip" href="#mockRoundTripper.RoundTrip">func (t mockRoundTripper) RoundTrip(req *http.Request) (*http.Response, error)</a>

```
searchKey: backend.mockRoundTripper.RoundTrip
tags: [method private]
```

```Go
func (t mockRoundTripper) RoundTrip(req *http.Request) (*http.Response, error)
```

### <a id="repos" href="#repos">type repos struct</a>

```
searchKey: backend.repos
tags: [struct private]
```

```Go
type repos struct {
	store *database.RepoStore
	cache *dbcache.DefaultRepoLister
}
```

#### <a id="repos.Add" href="#repos.Add">func (s *repos) Add(ctx context.Context, name api.RepoName) (addedName api.RepoName, err error)</a>

```
searchKey: backend.repos.Add
tags: [method private]
```

```Go
func (s *repos) Add(ctx context.Context, name api.RepoName) (addedName api.RepoName, err error)
```

Add adds the repository with the given name to the database by calling repo-updater when in sourcegraph.com mode. It's possible that the repo has been renamed on the code host in which case a different name may be returned. 

#### <a id="repos.Get" href="#repos.Get">func (s *repos) Get(ctx context.Context, repo api.RepoID) (_ *types.Repo, err error)</a>

```
searchKey: backend.repos.Get
tags: [method private]
```

```Go
func (s *repos) Get(ctx context.Context, repo api.RepoID) (_ *types.Repo, err error)
```

#### <a id="repos.GetByName" href="#repos.GetByName">func (s *repos) GetByName(ctx context.Context, name api.RepoName) (_ *types.Repo, err error)</a>

```
searchKey: backend.repos.GetByName
tags: [method private]
```

```Go
func (s *repos) GetByName(ctx context.Context, name api.RepoName) (_ *types.Repo, err error)
```

GetByName retrieves the repository with the given name. On sourcegraph.com, if the name refers to a repository on a github.com or gitlab.com that is not yet present in the database, it will automatically look up the repository externally and add it to the database before returning it. 

#### <a id="repos.GetCommit" href="#repos.GetCommit">func (s *repos) GetCommit(ctx context.Context, repo *types.Repo, commitID api.CommitID) (res *git.Commit, err error)</a>

```
searchKey: backend.repos.GetCommit
tags: [method private]
```

```Go
func (s *repos) GetCommit(ctx context.Context, repo *types.Repo, commitID api.CommitID) (res *git.Commit, err error)
```

#### <a id="repos.GetInventory" href="#repos.GetInventory">func (s *repos) GetInventory(ctx context.Context, repo *types.Repo, commitID api.CommitID, forceEnhancedLanguageDetection bool) (res *inventory.Inventory, err error)</a>

```
searchKey: backend.repos.GetInventory
tags: [method private]
```

```Go
func (s *repos) GetInventory(ctx context.Context, repo *types.Repo, commitID api.CommitID, forceEnhancedLanguageDetection bool) (res *inventory.Inventory, err error)
```

#### <a id="repos.List" href="#repos.List">func (s *repos) List(ctx context.Context, opt database.ReposListOptions) (repos []*types.Repo, err error)</a>

```
searchKey: backend.repos.List
tags: [method private]
```

```Go
func (s *repos) List(ctx context.Context, opt database.ReposListOptions) (repos []*types.Repo, err error)
```

#### <a id="repos.ListDefault" href="#repos.ListDefault">func (s *repos) ListDefault(ctx context.Context) (repos []types.RepoName, err error)</a>

```
searchKey: backend.repos.ListDefault
tags: [method private]
```

```Go
func (s *repos) ListDefault(ctx context.Context) (repos []types.RepoName, err error)
```

ListDefault calls database.DefaultRepos.ListPublic, with tracing. It lists all public default repos and also any private repos added by the current user. 

#### <a id="repos.ListIndexable" href="#repos.ListIndexable">func (s *repos) ListIndexable(ctx context.Context) (repos []types.RepoName, err error)</a>

```
searchKey: backend.repos.ListIndexable
tags: [method private]
```

```Go
func (s *repos) ListIndexable(ctx context.Context) (repos []types.RepoName, err error)
```

ListIndexable calls database.DefaultRepos.List, with tracing. It lists ALL default repos which could include private user added repos. 

#### <a id="repos.ResolveRev" href="#repos.ResolveRev">func (s *repos) ResolveRev(ctx context.Context, repo *types.Repo, rev string) (commitID api.CommitID, err error)</a>

```
searchKey: backend.repos.ResolveRev
tags: [method private]
```

```Go
func (s *repos) ResolveRev(ctx context.Context, repo *types.Repo, rev string) (commitID api.CommitID, err error)
```

ResolveRev will return the absolute commit for a commit-ish spec in a repo. If no rev is specified, HEAD is used. Error cases: * Repo does not exist: vcs.RepoNotExistError * Commit does not exist: git.RevisionNotFoundError * Empty repository: git.RevisionNotFoundError * The user does not have permission: errcode.IsNotFound * Other unexpected errors. 

### <a id="symbols" href="#symbols">type symbols struct{}</a>

```
searchKey: backend.symbols
tags: [struct private]
```

```Go
type symbols struct{}
```

#### <a id="symbols.ListTags" href="#symbols.ListTags">func (symbols) ListTags(ctx context.Context, args search.SymbolsParameters) (result.Symbols, error)</a>

```
searchKey: backend.symbols.ListTags
tags: [method private]
```

```Go
func (symbols) ListTags(ctx context.Context, args search.SymbolsParameters) (result.Symbols, error)
```

ListTags returns symbols in a repository from ctags. 

### <a id="userEmails" href="#userEmails">type userEmails struct{}</a>

```
searchKey: backend.userEmails
tags: [struct private]
```

```Go
type userEmails struct{}
```

#### <a id="userEmails.Add" href="#userEmails.Add">func (userEmails) Add(ctx context.Context, db dbutil.DB, userID int32, email string) error</a>

```
searchKey: backend.userEmails.Add
tags: [method private]
```

```Go
func (userEmails) Add(ctx context.Context, db dbutil.DB, userID int32, email string) error
```

Add adds an email address to a user. If email verification is required, it sends an email verification email. 

#### <a id="userEmails.SendUserEmailOnFieldUpdate" href="#userEmails.SendUserEmailOnFieldUpdate">func (userEmails) SendUserEmailOnFieldUpdate(ctx context.Context, id int32, change string) error</a>

```
searchKey: backend.userEmails.SendUserEmailOnFieldUpdate
tags: [method private]
```

```Go
func (userEmails) SendUserEmailOnFieldUpdate(ctx context.Context, id int32, change string) error
```

SendUserEmailOnFieldUpdate sends the user an email that important account information has changed. The change is the information we want to provide the user about the change 

## <a id="func" href="#func">Functions</a>

### <a id="CheckCurrentUserIsSiteAdmin" href="#CheckCurrentUserIsSiteAdmin">func CheckCurrentUserIsSiteAdmin(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: backend.CheckCurrentUserIsSiteAdmin
tags: [function]
```

```Go
func CheckCurrentUserIsSiteAdmin(ctx context.Context, db dbutil.DB) error
```

CheckCurrentUserIsSiteAdmin returns an error if the current user is NOT a site admin. 

### <a id="CheckOrgAccess" href="#CheckOrgAccess">func CheckOrgAccess(ctx context.Context, db dbutil.DB, orgID int32) error</a>

```
searchKey: backend.CheckOrgAccess
tags: [function]
```

```Go
func CheckOrgAccess(ctx context.Context, db dbutil.DB, orgID int32) error
```

CheckOrgAccess returns an error if the user is not a member of the organization with the specified ID. 

It is used when an action on a user can be performed by the organization's members, but nobody else. 

### <a id="CheckOrgAccessOrSiteAdmin" href="#CheckOrgAccessOrSiteAdmin">func CheckOrgAccessOrSiteAdmin(ctx context.Context, db dbutil.DB, orgID int32) error</a>

```
searchKey: backend.CheckOrgAccessOrSiteAdmin
tags: [function]
```

```Go
func CheckOrgAccessOrSiteAdmin(ctx context.Context, db dbutil.DB, orgID int32) error
```

CheckOrgAccessOrSiteAdmin returns an error if the user is NEITHER (1) a site admin NOR (2) a member of the organization with the specified ID. 

It is used when an action on a user can be performed by site admins and the organization's members, but nobody else. 

### <a id="CheckSameUser" href="#CheckSameUser">func CheckSameUser(ctx context.Context, subjectUserID int32) error</a>

```
searchKey: backend.CheckSameUser
tags: [function]
```

```Go
func CheckSameUser(ctx context.Context, subjectUserID int32) error
```

CheckSameUser returns an error if the user is not the user specified by subjectUserID. 

### <a id="CheckSiteAdminOrSameUser" href="#CheckSiteAdminOrSameUser">func CheckSiteAdminOrSameUser(ctx context.Context, db dbutil.DB, subjectUserID int32) error</a>

```
searchKey: backend.CheckSiteAdminOrSameUser
tags: [function]
```

```Go
func CheckSiteAdminOrSameUser(ctx context.Context, db dbutil.DB, subjectUserID int32) error
```

CheckSiteAdminOrSameUser returns an error if the user is NEITHER (1) a site admin NOR (2) the user specified by subjectUserID. 

It is used when an action on a user can be performed by site admins and the user themselves, but nobody else. 

Returns an error containing the name of the given user. 

### <a id="CheckUserIsSiteAdmin" href="#CheckUserIsSiteAdmin">func CheckUserIsSiteAdmin(ctx context.Context, db dbutil.DB, userID int32) error</a>

```
searchKey: backend.CheckUserIsSiteAdmin
tags: [function]
```

```Go
func CheckUserIsSiteAdmin(ctx context.Context, db dbutil.DB, userID int32) error
```

CheckUserIsSiteAdmin returns an error if the user is NOT a site admin. 

### <a id="CountGoImporters" href="#CountGoImporters">func CountGoImporters(ctx context.Context, repo api.RepoName) (count int, err error)</a>

```
searchKey: backend.CountGoImporters
tags: [function]
```

```Go
func CountGoImporters(ctx context.Context, repo api.RepoName) (count int, err error)
```

CountGoImporters returns the number of Go importers for the repository's Go subpackages. This is a special case used only on Sourcegraph.com for repository badges. 

TODO: The import path is not always the same as the repository name. 

### <a id="CurrentUser" href="#CurrentUser">func CurrentUser(ctx context.Context, db dbutil.DB) (*types.User, error)</a>

```
searchKey: backend.CurrentUser
tags: [function]
```

```Go
func CurrentUser(ctx context.Context, db dbutil.DB) (*types.User, error)
```

CurrentUser gets the current authenticated user It returns nil, nil if no user is found 

### <a id="GetFirstServiceVersion" href="#GetFirstServiceVersion">func GetFirstServiceVersion(ctx context.Context, service string) (version string, err error)</a>

```
searchKey: backend.GetFirstServiceVersion
tags: [function]
```

```Go
func GetFirstServiceVersion(ctx context.Context, service string) (version string, err error)
```

GetFirstServiceVersion returns the first version registered for the given Sourcegraph service. This method will return an error if UpdateServiceVersion has never been called for the given service. 

### <a id="InventoryContext" href="#InventoryContext">func InventoryContext(repo api.RepoName, commitID api.CommitID, forceEnhancedLanguageDetection bool) (inventory.Context, error)</a>

```
searchKey: backend.InventoryContext
tags: [function]
```

```Go
func InventoryContext(repo api.RepoName, commitID api.CommitID, forceEnhancedLanguageDetection bool) (inventory.Context, error)
```

InventoryContext returns the inventory context for computing the inventory for the repository at the given commit. 

### <a id="IsValidUpgrade" href="#IsValidUpgrade">func IsValidUpgrade(previous, latest *semver.Version) bool</a>

```
searchKey: backend.IsValidUpgrade
tags: [function]
```

```Go
func IsValidUpgrade(previous, latest *semver.Version) bool
```

IsValidUpgrade returns true if the given previous and latest versions comply with our documented upgrade policy. All roll-backs or downgrades are supported. 

[https://docs.sourcegraph.com/#upgrading-sourcegraph](https://docs.sourcegraph.com/#upgrading-sourcegraph) 

### <a id="MakeEmailVerificationCode" href="#MakeEmailVerificationCode">func MakeEmailVerificationCode() (string, error)</a>

```
searchKey: backend.MakeEmailVerificationCode
tags: [function]
```

```Go
func MakeEmailVerificationCode() (string, error)
```

MakeEmailVerificationCode returns a random string that can be used as an email verification code. If there is not enough entropy to create a random string, it returns a non-nil error. 

### <a id="MakePasswordResetURL" href="#MakePasswordResetURL">func MakePasswordResetURL(ctx context.Context, userID int32) (*url.URL, error)</a>

```
searchKey: backend.MakePasswordResetURL
tags: [function]
```

```Go
func MakePasswordResetURL(ctx context.Context, userID int32) (*url.URL, error)
```

### <a id="MakeRandomHardToGuessPassword" href="#MakeRandomHardToGuessPassword">func MakeRandomHardToGuessPassword() string</a>

```
searchKey: backend.MakeRandomHardToGuessPassword
tags: [function]
```

```Go
func MakeRandomHardToGuessPassword() string
```

### <a id="SendUserEmailVerificationEmail" href="#SendUserEmailVerificationEmail">func SendUserEmailVerificationEmail(ctx context.Context, username, email, code string) error</a>

```
searchKey: backend.SendUserEmailVerificationEmail
tags: [function]
```

```Go
func SendUserEmailVerificationEmail(ctx context.Context, username, email, code string) error
```

SendUserEmailVerificationEmail sends an email to the user to verify the email address. The code is the verification code that the user must provide to verify their access to the email address. 

### <a id="TestCheckEmailAbuse" href="#TestCheckEmailAbuse">func TestCheckEmailAbuse(t *testing.T)</a>

```
searchKey: backend.TestCheckEmailAbuse
tags: [function private test]
```

```Go
func TestCheckEmailAbuse(t *testing.T)
```

### <a id="TestCountGoImporters" href="#TestCountGoImporters">func TestCountGoImporters(t *testing.T)</a>

```
searchKey: backend.TestCountGoImporters
tags: [function private test]
```

```Go
func TestCountGoImporters(t *testing.T)
```

### <a id="TestGetFirstServiceVersion" href="#TestGetFirstServiceVersion">func TestGetFirstServiceVersion(t *testing.T)</a>

```
searchKey: backend.TestGetFirstServiceVersion
tags: [function private test]
```

```Go
func TestGetFirstServiceVersion(t *testing.T)
```

### <a id="TestIsPossibleExternallyImportableGoPackageDir" href="#TestIsPossibleExternallyImportableGoPackageDir">func TestIsPossibleExternallyImportableGoPackageDir(t *testing.T)</a>

```
searchKey: backend.TestIsPossibleExternallyImportableGoPackageDir
tags: [function private test]
```

```Go
func TestIsPossibleExternallyImportableGoPackageDir(t *testing.T)
```

### <a id="TestIsValidUpgrade" href="#TestIsValidUpgrade">func TestIsValidUpgrade(t *testing.T)</a>

```
searchKey: backend.TestIsValidUpgrade
tags: [function private test]
```

```Go
func TestIsValidUpgrade(t *testing.T)
```

### <a id="TestListGoPackagesInRepoImprecise" href="#TestListGoPackagesInRepoImprecise">func TestListGoPackagesInRepoImprecise(t *testing.T)</a>

```
searchKey: backend.TestListGoPackagesInRepoImprecise
tags: [function private test]
```

```Go
func TestListGoPackagesInRepoImprecise(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: backend.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestReposGetInventory" href="#TestReposGetInventory">func TestReposGetInventory(t *testing.T)</a>

```
searchKey: backend.TestReposGetInventory
tags: [function private test]
```

```Go
func TestReposGetInventory(t *testing.T)
```

### <a id="TestReposService_Get" href="#TestReposService_Get">func TestReposService_Get(t *testing.T)</a>

```
searchKey: backend.TestReposService_Get
tags: [function private test]
```

```Go
func TestReposService_Get(t *testing.T)
```

### <a id="TestReposService_List" href="#TestReposService_List">func TestReposService_List(t *testing.T)</a>

```
searchKey: backend.TestReposService_List
tags: [function private test]
```

```Go
func TestReposService_List(t *testing.T)
```

### <a id="TestRepos_Add" href="#TestRepos_Add">func TestRepos_Add(t *testing.T)</a>

```
searchKey: backend.TestRepos_Add
tags: [function private test]
```

```Go
func TestRepos_Add(t *testing.T)
```

### <a id="TestRepos_GetCommit_repoupdaterError" href="#TestRepos_GetCommit_repoupdaterError">func TestRepos_GetCommit_repoupdaterError(t *testing.T)</a>

```
searchKey: backend.TestRepos_GetCommit_repoupdaterError
tags: [function private test]
```

```Go
func TestRepos_GetCommit_repoupdaterError(t *testing.T)
```

### <a id="TestRepos_ResolveRev_commitIDSpecified_failsToResolve" href="#TestRepos_ResolveRev_commitIDSpecified_failsToResolve">func TestRepos_ResolveRev_commitIDSpecified_failsToResolve(t *testing.T)</a>

```
searchKey: backend.TestRepos_ResolveRev_commitIDSpecified_failsToResolve
tags: [function private test]
```

```Go
func TestRepos_ResolveRev_commitIDSpecified_failsToResolve(t *testing.T)
```

### <a id="TestRepos_ResolveRev_commitIDSpecified_resolvesCommitID" href="#TestRepos_ResolveRev_commitIDSpecified_resolvesCommitID">func TestRepos_ResolveRev_commitIDSpecified_resolvesCommitID(t *testing.T)</a>

```
searchKey: backend.TestRepos_ResolveRev_commitIDSpecified_resolvesCommitID
tags: [function private test]
```

```Go
func TestRepos_ResolveRev_commitIDSpecified_resolvesCommitID(t *testing.T)
```

### <a id="TestRepos_ResolveRev_noCommitIDSpecified_resolvesRev" href="#TestRepos_ResolveRev_noCommitIDSpecified_resolvesRev">func TestRepos_ResolveRev_noCommitIDSpecified_resolvesRev(t *testing.T)</a>

```
searchKey: backend.TestRepos_ResolveRev_noCommitIDSpecified_resolvesRev
tags: [function private test]
```

```Go
func TestRepos_ResolveRev_noCommitIDSpecified_resolvesRev(t *testing.T)
```

### <a id="TestRepos_ResolveRev_noRevSpecified_getsDefaultBranch" href="#TestRepos_ResolveRev_noRevSpecified_getsDefaultBranch">func TestRepos_ResolveRev_noRevSpecified_getsDefaultBranch(t *testing.T)</a>

```
searchKey: backend.TestRepos_ResolveRev_noRevSpecified_getsDefaultBranch
tags: [function private test]
```

```Go
func TestRepos_ResolveRev_noRevSpecified_getsDefaultBranch(t *testing.T)
```

### <a id="TestSendUserEmailOnFieldUpdate" href="#TestSendUserEmailOnFieldUpdate">func TestSendUserEmailOnFieldUpdate(t *testing.T)</a>

```
searchKey: backend.TestSendUserEmailOnFieldUpdate
tags: [function private test]
```

```Go
func TestSendUserEmailOnFieldUpdate(t *testing.T)
```

### <a id="TestSendUserEmailVerificationEmail" href="#TestSendUserEmailVerificationEmail">func TestSendUserEmailVerificationEmail(t *testing.T)</a>

```
searchKey: backend.TestSendUserEmailVerificationEmail
tags: [function private test]
```

```Go
func TestSendUserEmailVerificationEmail(t *testing.T)
```

### <a id="TestUpdateServiceVersion" href="#TestUpdateServiceVersion">func TestUpdateServiceVersion(t *testing.T)</a>

```
searchKey: backend.TestUpdateServiceVersion
tags: [function private test]
```

```Go
func TestUpdateServiceVersion(t *testing.T)
```

### <a id="UpdateServiceVersion" href="#UpdateServiceVersion">func UpdateServiceVersion(ctx context.Context, service, version string) error</a>

```
searchKey: backend.UpdateServiceVersion
tags: [function]
```

```Go
func UpdateServiceVersion(ctx context.Context, service, version string) error
```

UpdateServiceVersion updates the latest version for the given Sourcegraph service. It enforces our documented upgrade policy. [https://docs.sourcegraph.com/#upgrading-sourcegraph](https://docs.sourcegraph.com/#upgrading-sourcegraph) 

### <a id="WithAuthzBypass" href="#WithAuthzBypass">func WithAuthzBypass(ctx context.Context) context.Context</a>

```
searchKey: backend.WithAuthzBypass
tags: [function]
```

```Go
func WithAuthzBypass(ctx context.Context) context.Context
```

WithAuthzBypass returns a context that backend.CheckXyz funcs report as being a site admin. It is used to bypass the backend.CheckXyz access control funcs when needed. 

🚨 SECURITY: The caller MUST ensure that it performs its own access controls or removal of sensitive data. 

### <a id="checkEmailAbuse" href="#checkEmailAbuse">func checkEmailAbuse(ctx context.Context, userID int32) (abused bool, reason string, err error)</a>

```
searchKey: backend.checkEmailAbuse
tags: [function private]
```

```Go
func checkEmailAbuse(ctx context.Context, userID int32) (abused bool, reason string, err error)
```

checkEmailAbuse performs abuse prevention checks to prevent email abuse, i.e. users using emails of other people whom they want to annoy. 

### <a id="checkOrgAccess" href="#checkOrgAccess">func checkOrgAccess(ctx context.Context, db dbutil.DB, orgID int32, allowAdmin bool) error</a>

```
searchKey: backend.checkOrgAccess
tags: [function private]
```

```Go
func checkOrgAccess(ctx context.Context, db dbutil.DB, orgID int32, allowAdmin bool) error
```

checkOrgAccess is a helper method used above which allows optionally allowing site admins to access all organisations. 

### <a id="checkUserIsOrgMember" href="#checkUserIsOrgMember">func checkUserIsOrgMember(ctx context.Context, db dbutil.DB, userID, orgID int32) error</a>

```
searchKey: backend.checkUserIsOrgMember
tags: [function private]
```

```Go
func checkUserIsOrgMember(ctx context.Context, db dbutil.DB, userID, orgID int32) error
```

### <a id="hasAuthzBypass" href="#hasAuthzBypass">func hasAuthzBypass(ctx context.Context) bool</a>

```
searchKey: backend.hasAuthzBypass
tags: [function private]
```

```Go
func hasAuthzBypass(ctx context.Context) bool
```

### <a id="init.versions_test.go" href="#init.versions_test.go">func init()</a>

```
searchKey: backend.init
tags: [function private]
```

```Go
func init()
```

### <a id="isPossibleExternallyImportableGoPackageDir" href="#isPossibleExternallyImportableGoPackageDir">func isPossibleExternallyImportableGoPackageDir(dirPath string) bool</a>

```
searchKey: backend.isPossibleExternallyImportableGoPackageDir
tags: [function private]
```

```Go
func isPossibleExternallyImportableGoPackageDir(dirPath string) bool
```

### <a id="listGoPackagesInRepoImprecise" href="#listGoPackagesInRepoImprecise">func listGoPackagesInRepoImprecise(ctx context.Context, repoName api.RepoName) ([]string, error)</a>

```
searchKey: backend.listGoPackagesInRepoImprecise
tags: [function private]
```

```Go
func listGoPackagesInRepoImprecise(ctx context.Context, repoName api.RepoName) ([]string, error)
```

listGoPackagesInRepoImprecise returns a list of import paths for all (probable) Go packages in the repository. It computes the list based solely on the repository name (as a prefix) and filenames in the repository; it does not parse or build the Go files to determine the list precisely. 

### <a id="shouldRedirect" href="#shouldRedirect">func shouldRedirect(name api.RepoName) bool</a>

```
searchKey: backend.shouldRedirect
tags: [function private]
```

```Go
func shouldRedirect(name api.RepoName) bool
```

### <a id="testContext" href="#testContext">func testContext() context.Context</a>

```
searchKey: backend.testContext
tags: [function private]
```

```Go
func testContext() context.Context
```

testContext creates a new context.Context for use by tests 

### <a id="trace" href="#trace">func trace(ctx context.Context, server, method string, arg interface{}, err *error) (context.Context, func())</a>

```
searchKey: backend.trace
tags: [function private]
```

```Go
func trace(ctx context.Context, server, method string, arg interface{}, err *error) (context.Context, func())
```

