# Package httpapi

Package httpapi contains the HTTP API. 

## Index

* Subpages
  * [cmd/frontend/internal/httpapi/router](httpapi/router.md)
  * [cmd/frontend/internal/httpapi/webhookhandlers](httpapi/webhookhandlers.md)
* [Variables](#var)
    * [var allowedFilenames](#allowedFilenames)
    * [var schemaDecoder](#schemaDecoder)
    * [var srcCliDownloadsURL](#srcCliDownloadsURL)
    * [var traceGraphQLQueriesSample](#traceGraphQLQueriesSample)
* [Types](#type)
    * [type errorHandler struct](#errorHandler)
        * [func (h *errorHandler) Handle(w http.ResponseWriter, r *http.Request, status int, err error)](#errorHandler.Handle)
    * [type gitServiceHandler struct](#gitServiceHandler)
        * [func (s *gitServiceHandler) redirectToGitServer(w http.ResponseWriter, r *http.Request, gitPath string)](#gitServiceHandler.redirectToGitServer)
        * [func (s *gitServiceHandler) serveGitUploadPack(w http.ResponseWriter, r *http.Request)](#gitServiceHandler.serveGitUploadPack)
        * [func (s *gitServiceHandler) serveInfoRefs(w http.ResponseWriter, r *http.Request)](#gitServiceHandler.serveInfoRefs)
    * [type graphQLQueryParams struct](#graphQLQueryParams)
    * [type mockAddrForRepo struct{}](#mockAddrForRepo)
        * [func (mockAddrForRepo) AddrForRepo(name api.RepoName) string](#mockAddrForRepo.AddrForRepo)
    * [type mockRepos struct](#mockRepos)
        * [func (r *mockRepos) List(ctx context.Context, opt database.ReposListOptions) ([]*types.Repo, error)](#mockRepos.List)
        * [func (r *mockRepos) ListIndexable(context.Context) ([]types.RepoName, error)](#mockRepos.ListIndexable)
    * [type reposListServer struct](#reposListServer)
        * [func (h *reposListServer) serveIndex(w http.ResponseWriter, r *http.Request) error](#reposListServer.serveIndex)
    * [type suffixIndexers bool](#suffixIndexers)
        * [func (b suffixIndexers) Enabled() bool](#suffixIndexers.Enabled)
        * [func (b suffixIndexers) ReposSubset(ctx context.Context, hostname string, indexed map[string]struct{}, repoNames []string) ([]string, error)](#suffixIndexers.ReposSubset)
    * [type traceData struct](#traceData)
* [Functions](#func)
    * [func AccessTokenAuthMiddleware(db dbutil.DB, next http.Handler) http.Handler](#AccessTokenAuthMiddleware)
    * [func NewHandler(db dbutil.DB, m *mux.Router, schema *graphql.Schema, githubWebhook webhooks.Registerer, gitlabWebhook, bitbucketServerWebhook http.Handler, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimiter graphqlbackend.LimitWatcher) http.Handler](#NewHandler)
    * [func NewInternalHandler(m *mux.Router, db dbutil.DB, schema *graphql.Schema, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimitWatcher graphqlbackend.LimitWatcher) http.Handler](#NewInternalHandler)
    * [func TestAccessTokenAuthMiddleware(t *testing.T)](#TestAccessTokenAuthMiddleware)
    * [func TestGitServiceHandlers(t *testing.T)](#TestGitServiceHandlers)
    * [func TestRepoRankFromConfig(t *testing.T)](#TestRepoRankFromConfig)
    * [func TestRepoRefresh(t *testing.T)](#TestRepoRefresh)
    * [func TestRepoShield(t *testing.T)](#TestRepoShield)
    * [func TestRepoShieldFmt(t *testing.T)](#TestRepoShieldFmt)
    * [func TestReposIndex(t *testing.T)](#TestReposIndex)
    * [func badgeValue(r *http.Request) (int, error)](#badgeValue)
    * [func badgeValueFmt(totalRefs int) string](#badgeValueFmt)
    * [func getUID(r *http.Request) (uid string, ip bool, anonymous bool)](#getUID)
    * [func handlePing(w http.ResponseWriter, r *http.Request)](#handlePing)
    * [func init()](#init.api_test.go)
    * [func init()](#init.db_test.go)
    * [func init()](#init.httpapi.go)
    * [func isExpectedRelease(filename string) bool](#isExpectedRelease)
    * [func jsonMiddleware(errorHandler *errorHandler) func(func(http.ResponseWriter, *http.Request) error) http.Handler](#jsonMiddleware)
    * [func newTest() *httptestutil.Client](#newTest)
    * [func repoRankFromConfig(siteConfig schema.SiteConfiguration, repoName string) float64](#repoRankFromConfig)
    * [func serveCanSendEmail(w http.ResponseWriter, r *http.Request) error](#serveCanSendEmail)
    * [func serveConfiguration(w http.ResponseWriter, r *http.Request) error](#serveConfiguration)
    * [func serveExternalServiceConfigs(w http.ResponseWriter, r *http.Request) error](#serveExternalServiceConfigs)
    * [func serveExternalServicesList(w http.ResponseWriter, r *http.Request) error](#serveExternalServicesList)
    * [func serveExternalURL(w http.ResponseWriter, r *http.Request) error](#serveExternalURL)
    * [func serveGitExec(w http.ResponseWriter, r *http.Request) error](#serveGitExec)
    * [func serveGitResolveRevision(w http.ResponseWriter, r *http.Request) error](#serveGitResolveRevision)
    * [func serveGitTar(w http.ResponseWriter, r *http.Request) error](#serveGitTar)
    * [func serveGraphQL(schema *graphql.Schema, rlw graphqlbackend.LimitWatcher, isInternal bool) func(w http.ResponseWriter, r *http.Request) (err error)](#serveGraphQL)
    * [func serveOrgsGetByName(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error](#serveOrgsGetByName)
    * [func serveOrgsListUsers(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error](#serveOrgsListUsers)
    * [func servePhabricatorRepoCreate(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error](#servePhabricatorRepoCreate)
    * [func serveRepoRefresh(w http.ResponseWriter, r *http.Request) error](#serveRepoRefresh)
    * [func serveRepoShield(w http.ResponseWriter, r *http.Request) error](#serveRepoShield)
    * [func serveReposGetByName(w http.ResponseWriter, r *http.Request) error](#serveReposGetByName)
    * [func serveReposListEnabled(w http.ResponseWriter, r *http.Request) error](#serveReposListEnabled)
    * [func serveSavedQueriesDeleteInfo(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error](#serveSavedQueriesDeleteInfo)
    * [func serveSavedQueriesGetInfo(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error](#serveSavedQueriesGetInfo)
    * [func serveSavedQueriesListAll(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error](#serveSavedQueriesListAll)
    * [func serveSavedQueriesSetInfo(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error](#serveSavedQueriesSetInfo)
    * [func serveSearchConfiguration(w http.ResponseWriter, r *http.Request) error](#serveSearchConfiguration)
    * [func serveSendEmail(w http.ResponseWriter, r *http.Request) error](#serveSendEmail)
    * [func serveSettingsGetForSubject(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error](#serveSettingsGetForSubject)
    * [func serveUserEmailsGetEmail(w http.ResponseWriter, r *http.Request) error](#serveUserEmailsGetEmail)
    * [func serveUsersGetByUsername(w http.ResponseWriter, r *http.Request) error](#serveUsersGetByUsername)
    * [func srcCliDownloadServe(w http.ResponseWriter, r *http.Request) error](#srcCliDownloadServe)
    * [func srcCliVersion() string](#srcCliVersion)
    * [func srcCliVersionServe(w http.ResponseWriter, r *http.Request) error](#srcCliVersionServe)
    * [func telemetryHandler(db dbutil.DB) http.Handler](#telemetryHandler)
    * [func traceGraphQL(data traceData)](#traceGraphQL)
    * [func writeJSON(w http.ResponseWriter, v interface{}) error](#writeJSON)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="allowedFilenames" href="#allowedFilenames">var allowedFilenames</a>

```
searchKey: httpapi.allowedFilenames
tags: [variable array string private]
```

```Go
var allowedFilenames = ...
```

### <a id="schemaDecoder" href="#schemaDecoder">var schemaDecoder</a>

```
searchKey: httpapi.schemaDecoder
tags: [variable struct private]
```

```Go
var schemaDecoder = schema.NewDecoder()
```

### <a id="srcCliDownloadsURL" href="#srcCliDownloadsURL">var srcCliDownloadsURL</a>

```
searchKey: httpapi.srcCliDownloadsURL
tags: [variable string private]
```

```Go
var srcCliDownloadsURL = "https://github.com/sourcegraph/src-cli/releases/download"
```

### <a id="traceGraphQLQueriesSample" href="#traceGraphQLQueriesSample">var traceGraphQLQueriesSample</a>

```
searchKey: httpapi.traceGraphQLQueriesSample
tags: [variable number private]
```

```Go
var traceGraphQLQueriesSample = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="errorHandler" href="#errorHandler">type errorHandler struct</a>

```
searchKey: httpapi.errorHandler
tags: [struct private]
```

```Go
type errorHandler struct {
	WriteErrBody bool
}
```

#### <a id="errorHandler.Handle" href="#errorHandler.Handle">func (h *errorHandler) Handle(w http.ResponseWriter, r *http.Request, status int, err error)</a>

```
searchKey: httpapi.errorHandler.Handle
tags: [method private]
```

```Go
func (h *errorHandler) Handle(w http.ResponseWriter, r *http.Request, status int, err error)
```

### <a id="gitServiceHandler" href="#gitServiceHandler">type gitServiceHandler struct</a>

```
searchKey: httpapi.gitServiceHandler
tags: [struct private]
```

```Go
type gitServiceHandler struct {
	Gitserver interface {
		AddrForRepo(api.RepoName) string
	}
}
```

gitServiceHandler are handlers which redirect git clone requests to the gitserver for the repo. 

#### <a id="gitServiceHandler.redirectToGitServer" href="#gitServiceHandler.redirectToGitServer">func (s *gitServiceHandler) redirectToGitServer(w http.ResponseWriter, r *http.Request, gitPath string)</a>

```
searchKey: httpapi.gitServiceHandler.redirectToGitServer
tags: [method private]
```

```Go
func (s *gitServiceHandler) redirectToGitServer(w http.ResponseWriter, r *http.Request, gitPath string)
```

#### <a id="gitServiceHandler.serveGitUploadPack" href="#gitServiceHandler.serveGitUploadPack">func (s *gitServiceHandler) serveGitUploadPack(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: httpapi.gitServiceHandler.serveGitUploadPack
tags: [method private]
```

```Go
func (s *gitServiceHandler) serveGitUploadPack(w http.ResponseWriter, r *http.Request)
```

#### <a id="gitServiceHandler.serveInfoRefs" href="#gitServiceHandler.serveInfoRefs">func (s *gitServiceHandler) serveInfoRefs(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: httpapi.gitServiceHandler.serveInfoRefs
tags: [method private]
```

```Go
func (s *gitServiceHandler) serveInfoRefs(w http.ResponseWriter, r *http.Request)
```

### <a id="graphQLQueryParams" href="#graphQLQueryParams">type graphQLQueryParams struct</a>

```
searchKey: httpapi.graphQLQueryParams
tags: [struct private]
```

```Go
type graphQLQueryParams struct {
	Query         string                 `json:"query"`
	OperationName string                 `json:"operationName"`
	Variables     map[string]interface{} `json:"variables"`
}
```

### <a id="mockAddrForRepo" href="#mockAddrForRepo">type mockAddrForRepo struct{}</a>

```
searchKey: httpapi.mockAddrForRepo
tags: [struct private]
```

```Go
type mockAddrForRepo struct{}
```

#### <a id="mockAddrForRepo.AddrForRepo" href="#mockAddrForRepo.AddrForRepo">func (mockAddrForRepo) AddrForRepo(name api.RepoName) string</a>

```
searchKey: httpapi.mockAddrForRepo.AddrForRepo
tags: [method private]
```

```Go
func (mockAddrForRepo) AddrForRepo(name api.RepoName) string
```

### <a id="mockRepos" href="#mockRepos">type mockRepos struct</a>

```
searchKey: httpapi.mockRepos
tags: [struct private]
```

```Go
type mockRepos struct {
	defaultRepos []string
	repos        []string
}
```

#### <a id="mockRepos.List" href="#mockRepos.List">func (r *mockRepos) List(ctx context.Context, opt database.ReposListOptions) ([]*types.Repo, error)</a>

```
searchKey: httpapi.mockRepos.List
tags: [method private]
```

```Go
func (r *mockRepos) List(ctx context.Context, opt database.ReposListOptions) ([]*types.Repo, error)
```

#### <a id="mockRepos.ListIndexable" href="#mockRepos.ListIndexable">func (r *mockRepos) ListIndexable(context.Context) ([]types.RepoName, error)</a>

```
searchKey: httpapi.mockRepos.ListIndexable
tags: [method private]
```

```Go
func (r *mockRepos) ListIndexable(context.Context) ([]types.RepoName, error)
```

### <a id="reposListServer" href="#reposListServer">type reposListServer struct</a>

```
searchKey: httpapi.reposListServer
tags: [struct private]
```

```Go
type reposListServer struct {
	// SourcegraphDotComMode is true if this instance of Sourcegraph is http://sourcegraph.com
	SourcegraphDotComMode bool

	// Repos is the subset of backend.Repos methods we use. Declared as an
	// interface for testing.
	Repos interface {
		// ListIndexable returns the repositories to index on Sourcegraph.com
		ListIndexable(context.Context) ([]types.RepoName, error)
		// List returns a list of repositories
		List(context.Context, database.ReposListOptions) ([]*types.Repo, error)
	}

	// Indexers is the subset of searchbackend.Indexers methods we
	// use. reposListServer is used by indexed-search to get the list of
	// repositories to index. These methods are used to return the correct
	// subset for horizontal indexed search. Declared as an interface for
	// testing.
	Indexers interface {
		// ReposSubset returns the subset of repoNames that hostname should
		// index.
		ReposSubset(ctx context.Context, hostname string, indexed map[string]struct{}, repoNames []string) ([]string, error)
		// Enabled is true if horizontal indexed search is enabled.
		Enabled() bool
	}
}
```

#### <a id="reposListServer.serveIndex" href="#reposListServer.serveIndex">func (h *reposListServer) serveIndex(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.reposListServer.serveIndex
tags: [method private]
```

```Go
func (h *reposListServer) serveIndex(w http.ResponseWriter, r *http.Request) error
```

serveIndex is used by zoekt to get the list of repositories for it to index. 

### <a id="suffixIndexers" href="#suffixIndexers">type suffixIndexers bool</a>

```
searchKey: httpapi.suffixIndexers
tags: [boolean private]
```

```Go
type suffixIndexers bool
```

suffixIndexers mocks Indexers. ReposSubset will return all repoNames with the suffix of hostname. 

#### <a id="suffixIndexers.Enabled" href="#suffixIndexers.Enabled">func (b suffixIndexers) Enabled() bool</a>

```
searchKey: httpapi.suffixIndexers.Enabled
tags: [method private]
```

```Go
func (b suffixIndexers) Enabled() bool
```

#### <a id="suffixIndexers.ReposSubset" href="#suffixIndexers.ReposSubset">func (b suffixIndexers) ReposSubset(ctx context.Context, hostname string, indexed map[string]struct{}, repoNames []string) ([]string, error)</a>

```
searchKey: httpapi.suffixIndexers.ReposSubset
tags: [method private]
```

```Go
func (b suffixIndexers) ReposSubset(ctx context.Context, hostname string, indexed map[string]struct{}, repoNames []string) ([]string, error)
```

### <a id="traceData" href="#traceData">type traceData struct</a>

```
searchKey: httpapi.traceData
tags: [struct private]
```

```Go
type traceData struct {
	queryParams   graphQLQueryParams
	execStart     time.Time
	uid           string
	anonymous     bool
	isInternal    bool
	requestName   string
	requestSource string
	queryErrors   []*gqlerrors.QueryError

	cost      *graphqlbackend.QueryCost
	costError error

	limited     bool
	limitError  error
	limitResult throttled.RateLimitResult
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="AccessTokenAuthMiddleware" href="#AccessTokenAuthMiddleware">func AccessTokenAuthMiddleware(db dbutil.DB, next http.Handler) http.Handler</a>

```
searchKey: httpapi.AccessTokenAuthMiddleware
tags: [function]
```

```Go
func AccessTokenAuthMiddleware(db dbutil.DB, next http.Handler) http.Handler
```

AccessTokenAuthMiddleware authenticates the user based on the token query parameter or the "Authorization" header. 

### <a id="NewHandler" href="#NewHandler">func NewHandler(db dbutil.DB, m *mux.Router, schema *graphql.Schema, githubWebhook webhooks.Registerer, gitlabWebhook, bitbucketServerWebhook http.Handler, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimiter graphqlbackend.LimitWatcher) http.Handler</a>

```
searchKey: httpapi.NewHandler
tags: [function]
```

```Go
func NewHandler(db dbutil.DB, m *mux.Router, schema *graphql.Schema, githubWebhook webhooks.Registerer, gitlabWebhook, bitbucketServerWebhook http.Handler, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimiter graphqlbackend.LimitWatcher) http.Handler
```

NewHandler returns a new API handler that uses the provided API router, which must have been created by httpapi/router.New, or creates a new one if nil. 

🚨 SECURITY: The caller MUST wrap the returned handler in middleware that checks authentication and sets the actor in the request context. 

### <a id="NewInternalHandler" href="#NewInternalHandler">func NewInternalHandler(m *mux.Router, db dbutil.DB, schema *graphql.Schema, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimitWatcher graphqlbackend.LimitWatcher) http.Handler</a>

```
searchKey: httpapi.NewInternalHandler
tags: [function]
```

```Go
func NewInternalHandler(m *mux.Router, db dbutil.DB, schema *graphql.Schema, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimitWatcher graphqlbackend.LimitWatcher) http.Handler
```

NewInternalHandler returns a new API handler for internal endpoints that uses the provided API router, which must have been created by httpapi/router.NewInternal. 

🚨 SECURITY: This handler should not be served on a publicly exposed port. 🚨 This handler is not guaranteed to provide the same authorization checks as public API handlers. 

### <a id="TestAccessTokenAuthMiddleware" href="#TestAccessTokenAuthMiddleware">func TestAccessTokenAuthMiddleware(t *testing.T)</a>

```
searchKey: httpapi.TestAccessTokenAuthMiddleware
tags: [function private test]
```

```Go
func TestAccessTokenAuthMiddleware(t *testing.T)
```

### <a id="TestGitServiceHandlers" href="#TestGitServiceHandlers">func TestGitServiceHandlers(t *testing.T)</a>

```
searchKey: httpapi.TestGitServiceHandlers
tags: [function private test]
```

```Go
func TestGitServiceHandlers(t *testing.T)
```

### <a id="TestRepoRankFromConfig" href="#TestRepoRankFromConfig">func TestRepoRankFromConfig(t *testing.T)</a>

```
searchKey: httpapi.TestRepoRankFromConfig
tags: [function private test]
```

```Go
func TestRepoRankFromConfig(t *testing.T)
```

### <a id="TestRepoRefresh" href="#TestRepoRefresh">func TestRepoRefresh(t *testing.T)</a>

```
searchKey: httpapi.TestRepoRefresh
tags: [function private test]
```

```Go
func TestRepoRefresh(t *testing.T)
```

### <a id="TestRepoShield" href="#TestRepoShield">func TestRepoShield(t *testing.T)</a>

```
searchKey: httpapi.TestRepoShield
tags: [function private test]
```

```Go
func TestRepoShield(t *testing.T)
```

### <a id="TestRepoShieldFmt" href="#TestRepoShieldFmt">func TestRepoShieldFmt(t *testing.T)</a>

```
searchKey: httpapi.TestRepoShieldFmt
tags: [function private test]
```

```Go
func TestRepoShieldFmt(t *testing.T)
```

### <a id="TestReposIndex" href="#TestReposIndex">func TestReposIndex(t *testing.T)</a>

```
searchKey: httpapi.TestReposIndex
tags: [function private test]
```

```Go
func TestReposIndex(t *testing.T)
```

### <a id="badgeValue" href="#badgeValue">func badgeValue(r *http.Request) (int, error)</a>

```
searchKey: httpapi.badgeValue
tags: [function private]
```

```Go
func badgeValue(r *http.Request) (int, error)
```

NOTE: Keep in sync with services/backend/httpapi/repo_shield.go 

### <a id="badgeValueFmt" href="#badgeValueFmt">func badgeValueFmt(totalRefs int) string</a>

```
searchKey: httpapi.badgeValueFmt
tags: [function private]
```

```Go
func badgeValueFmt(totalRefs int) string
```

NOTE: Keep in sync with services/backend/httpapi/repo_shield.go 

### <a id="getUID" href="#getUID">func getUID(r *http.Request) (uid string, ip bool, anonymous bool)</a>

```
searchKey: httpapi.getUID
tags: [function private]
```

```Go
func getUID(r *http.Request) (uid string, ip bool, anonymous bool)
```

### <a id="handlePing" href="#handlePing">func handlePing(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: httpapi.handlePing
tags: [function private]
```

```Go
func handlePing(w http.ResponseWriter, r *http.Request)
```

### <a id="init.api_test.go" href="#init.api_test.go">func init()</a>

```
searchKey: httpapi.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.db_test.go" href="#init.db_test.go">func init()</a>

```
searchKey: httpapi.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.httpapi.go" href="#init.httpapi.go">func init()</a>

```
searchKey: httpapi.init
tags: [function private]
```

```Go
func init()
```

### <a id="isExpectedRelease" href="#isExpectedRelease">func isExpectedRelease(filename string) bool</a>

```
searchKey: httpapi.isExpectedRelease
tags: [function private]
```

```Go
func isExpectedRelease(filename string) bool
```

### <a id="jsonMiddleware" href="#jsonMiddleware">func jsonMiddleware(errorHandler *errorHandler) func(func(http.ResponseWriter, *http.Request) error) http.Handler</a>

```
searchKey: httpapi.jsonMiddleware
tags: [function private]
```

```Go
func jsonMiddleware(errorHandler *errorHandler) func(func(http.ResponseWriter, *http.Request) error) http.Handler
```

### <a id="newTest" href="#newTest">func newTest() *httptestutil.Client</a>

```
searchKey: httpapi.newTest
tags: [function private]
```

```Go
func newTest() *httptestutil.Client
```

### <a id="repoRankFromConfig" href="#repoRankFromConfig">func repoRankFromConfig(siteConfig schema.SiteConfiguration, repoName string) float64</a>

```
searchKey: httpapi.repoRankFromConfig
tags: [function private]
```

```Go
func repoRankFromConfig(siteConfig schema.SiteConfiguration, repoName string) float64
```

### <a id="serveCanSendEmail" href="#serveCanSendEmail">func serveCanSendEmail(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveCanSendEmail
tags: [function private]
```

```Go
func serveCanSendEmail(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveConfiguration" href="#serveConfiguration">func serveConfiguration(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveConfiguration
tags: [function private]
```

```Go
func serveConfiguration(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveExternalServiceConfigs" href="#serveExternalServiceConfigs">func serveExternalServiceConfigs(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveExternalServiceConfigs
tags: [function private]
```

```Go
func serveExternalServiceConfigs(w http.ResponseWriter, r *http.Request) error
```

serveExternalServiceConfigs serves a JSON response that is an array of all external service configs that match the requested kind. 

### <a id="serveExternalServicesList" href="#serveExternalServicesList">func serveExternalServicesList(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveExternalServicesList
tags: [function private]
```

```Go
func serveExternalServicesList(w http.ResponseWriter, r *http.Request) error
```

serveExternalServicesList serves a JSON response that is an array of all external services of the given kind 

### <a id="serveExternalURL" href="#serveExternalURL">func serveExternalURL(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveExternalURL
tags: [function private]
```

```Go
func serveExternalURL(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveGitExec" href="#serveGitExec">func serveGitExec(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveGitExec
tags: [function private]
```

```Go
func serveGitExec(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveGitResolveRevision" href="#serveGitResolveRevision">func serveGitResolveRevision(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveGitResolveRevision
tags: [function private]
```

```Go
func serveGitResolveRevision(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveGitTar" href="#serveGitTar">func serveGitTar(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveGitTar
tags: [function private]
```

```Go
func serveGitTar(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveGraphQL" href="#serveGraphQL">func serveGraphQL(schema *graphql.Schema, rlw graphqlbackend.LimitWatcher, isInternal bool) func(w http.ResponseWriter, r *http.Request) (err error)</a>

```
searchKey: httpapi.serveGraphQL
tags: [function private]
```

```Go
func serveGraphQL(schema *graphql.Schema, rlw graphqlbackend.LimitWatcher, isInternal bool) func(w http.ResponseWriter, r *http.Request) (err error)
```

### <a id="serveOrgsGetByName" href="#serveOrgsGetByName">func serveOrgsGetByName(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveOrgsGetByName
tags: [function private]
```

```Go
func serveOrgsGetByName(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveOrgsListUsers" href="#serveOrgsListUsers">func serveOrgsListUsers(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveOrgsListUsers
tags: [function private]
```

```Go
func serveOrgsListUsers(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error
```

### <a id="servePhabricatorRepoCreate" href="#servePhabricatorRepoCreate">func servePhabricatorRepoCreate(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.servePhabricatorRepoCreate
tags: [function private]
```

```Go
func servePhabricatorRepoCreate(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveRepoRefresh" href="#serveRepoRefresh">func serveRepoRefresh(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveRepoRefresh
tags: [function private]
```

```Go
func serveRepoRefresh(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveRepoShield" href="#serveRepoShield">func serveRepoShield(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveRepoShield
tags: [function private]
```

```Go
func serveRepoShield(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveReposGetByName" href="#serveReposGetByName">func serveReposGetByName(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveReposGetByName
tags: [function private]
```

```Go
func serveReposGetByName(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveReposListEnabled" href="#serveReposListEnabled">func serveReposListEnabled(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveReposListEnabled
tags: [function private]
```

```Go
func serveReposListEnabled(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveSavedQueriesDeleteInfo" href="#serveSavedQueriesDeleteInfo">func serveSavedQueriesDeleteInfo(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveSavedQueriesDeleteInfo
tags: [function private]
```

```Go
func serveSavedQueriesDeleteInfo(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveSavedQueriesGetInfo" href="#serveSavedQueriesGetInfo">func serveSavedQueriesGetInfo(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveSavedQueriesGetInfo
tags: [function private]
```

```Go
func serveSavedQueriesGetInfo(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveSavedQueriesListAll" href="#serveSavedQueriesListAll">func serveSavedQueriesListAll(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveSavedQueriesListAll
tags: [function private]
```

```Go
func serveSavedQueriesListAll(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveSavedQueriesSetInfo" href="#serveSavedQueriesSetInfo">func serveSavedQueriesSetInfo(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveSavedQueriesSetInfo
tags: [function private]
```

```Go
func serveSavedQueriesSetInfo(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveSearchConfiguration" href="#serveSearchConfiguration">func serveSearchConfiguration(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveSearchConfiguration
tags: [function private]
```

```Go
func serveSearchConfiguration(w http.ResponseWriter, r *http.Request) error
```

serveSearchConfiguration is _only_ used by the zoekt index server. Zoekt does not depend on frontend and therefore does not have access to `conf.Watch`. Additionally, it only cares about certain search specific settings so this search specific endpoint is used rather than serving the entire site settings from /.internal/configuration. 

This endpoint also supports batch requests to avoid managing concurrency in zoekt. On vertically scaled instances we have observed zoekt requesting this endpoint concurrently leading to socket starvation. 

### <a id="serveSendEmail" href="#serveSendEmail">func serveSendEmail(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveSendEmail
tags: [function private]
```

```Go
func serveSendEmail(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveSettingsGetForSubject" href="#serveSettingsGetForSubject">func serveSettingsGetForSubject(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveSettingsGetForSubject
tags: [function private]
```

```Go
func serveSettingsGetForSubject(db dbutil.DB) func(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveUserEmailsGetEmail" href="#serveUserEmailsGetEmail">func serveUserEmailsGetEmail(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveUserEmailsGetEmail
tags: [function private]
```

```Go
func serveUserEmailsGetEmail(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveUsersGetByUsername" href="#serveUsersGetByUsername">func serveUsersGetByUsername(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.serveUsersGetByUsername
tags: [function private]
```

```Go
func serveUsersGetByUsername(w http.ResponseWriter, r *http.Request) error
```

### <a id="srcCliDownloadServe" href="#srcCliDownloadServe">func srcCliDownloadServe(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.srcCliDownloadServe
tags: [function private]
```

```Go
func srcCliDownloadServe(w http.ResponseWriter, r *http.Request) error
```

### <a id="srcCliVersion" href="#srcCliVersion">func srcCliVersion() string</a>

```
searchKey: httpapi.srcCliVersion
tags: [function private]
```

```Go
func srcCliVersion() string
```

### <a id="srcCliVersionServe" href="#srcCliVersionServe">func srcCliVersionServe(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: httpapi.srcCliVersionServe
tags: [function private]
```

```Go
func srcCliVersionServe(w http.ResponseWriter, r *http.Request) error
```

### <a id="telemetryHandler" href="#telemetryHandler">func telemetryHandler(db dbutil.DB) http.Handler</a>

```
searchKey: httpapi.telemetryHandler
tags: [function private]
```

```Go
func telemetryHandler(db dbutil.DB) http.Handler
```

### <a id="traceGraphQL" href="#traceGraphQL">func traceGraphQL(data traceData)</a>

```
searchKey: httpapi.traceGraphQL
tags: [function private]
```

```Go
func traceGraphQL(data traceData)
```

### <a id="writeJSON" href="#writeJSON">func writeJSON(w http.ResponseWriter, v interface{}) error</a>

```
searchKey: httpapi.writeJSON
tags: [function private]
```

```Go
func writeJSON(w http.ResponseWriter, v interface{}) error
```

writeJSON writes a JSON Content-Type header and a JSON-encoded object to the http.ResponseWriter. 

