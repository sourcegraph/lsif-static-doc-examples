# Package repoupdater

Package repoupdater implements the repo-updater service HTTP handler. 

## Index

* [Variables](#var)
    * [var mockRepoLookup](#mockRepoLookup)
    * [var dsn](#dsn)
* [Types](#type)
    * [type HandlerMetrics struct](#HandlerMetrics)
        * [func NewHandlerMetrics() HandlerMetrics](#NewHandlerMetrics)
        * [func (m HandlerMetrics) MustRegister(r prometheus.Registerer)](#HandlerMetrics.MustRegister)
    * [type observedHandler struct](#observedHandler)
        * [func (h *observedHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)](#observedHandler.ServeHTTP)
    * [type responseRecorder struct](#responseRecorder)
        * [func (w *responseRecorder) WriteHeader(code int)](#responseRecorder.WriteHeader)
        * [func (w *responseRecorder) Write(p []byte) (int, error)](#responseRecorder.Write)
    * [type Server struct](#Server)
        * [func (s *Server) Handler() http.Handler](#Server.Handler)
        * [func (s *Server) handleRepoUpdateSchedulerInfo(w http.ResponseWriter, r *http.Request)](#Server.handleRepoUpdateSchedulerInfo)
        * [func (s *Server) handleRepoLookup(w http.ResponseWriter, r *http.Request)](#Server.handleRepoLookup)
        * [func (s *Server) handleEnqueueRepoUpdate(w http.ResponseWriter, r *http.Request)](#Server.handleEnqueueRepoUpdate)
        * [func (s *Server) enqueueRepoUpdate(ctx context.Context, req *protocol.RepoUpdateRequest) (resp *protocol.RepoUpdateResponse, httpStatus int, err error)](#Server.enqueueRepoUpdate)
        * [func (s *Server) handleExternalServiceSync(w http.ResponseWriter, r *http.Request)](#Server.handleExternalServiceSync)
        * [func (s *Server) repoLookup(ctx context.Context, args protocol.RepoLookupArgs) (result *protocol.RepoLookupResult, err error)](#Server.repoLookup)
        * [func (s *Server) remoteRepoSync(ctx context.Context, codehost *extsvc.CodeHost, remoteName string) (*protocol.RepoLookupResult, error)](#Server.remoteRepoSync)
        * [func (s *Server) handleEnqueueChangesetSync(w http.ResponseWriter, r *http.Request)](#Server.handleEnqueueChangesetSync)
        * [func (s *Server) handleSchedulePermsSync(w http.ResponseWriter, r *http.Request)](#Server.handleSchedulePermsSync)
    * [type fakeRepoSource struct](#fakeRepoSource)
        * [func (s *fakeRepoSource) GetRepo(context.Context, string) (*types.Repo, error)](#fakeRepoSource.GetRepo)
    * [type fakeScheduler struct{}](#fakeScheduler)
        * [func (s *fakeScheduler) UpdateOnce(_ api.RepoID, _ api.RepoName)](#fakeScheduler.UpdateOnce)
        * [func (s *fakeScheduler) ScheduleInfo(id api.RepoID) *protocol.RepoUpdateSchedulerInfoResult](#fakeScheduler.ScheduleInfo)
    * [type fakePermsSyncer struct{}](#fakePermsSyncer)
        * [func (*fakePermsSyncer) ScheduleUsers(ctx context.Context, userIDs ...int32)](#fakePermsSyncer.ScheduleUsers)
        * [func (*fakePermsSyncer) ScheduleRepos(ctx context.Context, repoIDs ...api.RepoID)](#fakePermsSyncer.ScheduleRepos)
    * [type testSource struct](#testSource)
        * [func (t testSource) ListRepos(ctx context.Context, results chan repos.SourceResult)](#testSource.ListRepos)
        * [func (t testSource) ExternalServices() types.ExternalServices](#testSource.ExternalServices)
        * [func (t testSource) WithAuthenticator(a auth.Authenticator) (repos.Source, error)](#testSource.WithAuthenticator)
        * [func (t testSource) ValidateAuthenticator(ctx context.Context) error](#testSource.ValidateAuthenticator)
* [Functions](#func)
    * [func ObservedHandler(log log15.Logger,...](#ObservedHandler)
    * [func respond(w http.ResponseWriter, code int, v interface{})](#respond)
    * [func externalServiceValidate(ctx context.Context, req protocol.ExternalServiceSyncRequest, src repos.Source) error](#externalServiceValidate)
    * [func newRepoInfo(r *types.Repo) (*protocol.RepoInfo, error)](#newRepoInfo)
    * [func pathAppend(base, p string) string](#pathAppend)
    * [func isUnauthorized(err error) bool](#isUnauthorized)
    * [func isTemporarilyUnavailable(err error) bool](#isTemporarilyUnavailable)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestIntegration(t *testing.T)](#TestIntegration)
    * [func TestServer_handleRepoLookup(t *testing.T)](#TestServer_handleRepoLookup)
    * [func testServerEnqueueRepoUpdate(t *testing.T, store *repos.Store) func(t *testing.T)](#testServerEnqueueRepoUpdate)
    * [func testRepoLookup(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(t *testing.T)](#testRepoLookup)
    * [func TestServer_handleSchedulePermsSync(t *testing.T)](#TestServer_handleSchedulePermsSync)
    * [func TestExternalServiceValidate_ValidatesToken(t *testing.T)](#TestExternalServiceValidate_ValidatesToken)


## <a id="var" href="#var">Variables</a>

### <a id="mockRepoLookup" href="#mockRepoLookup">var mockRepoLookup</a>

```
searchKey: repoupdater.mockRepoLookup
tags: [private]
```

```Go
var mockRepoLookup func(protocol.RepoLookupArgs) (*protocol.RepoLookupResult, error)
```

### <a id="dsn" href="#dsn">var dsn</a>

```
searchKey: repoupdater.dsn
tags: [private]
```

```Go
var dsn = flag.String("dsn", "", "Database connection string to use in integration tests")
```

## <a id="type" href="#type">Types</a>

### <a id="HandlerMetrics" href="#HandlerMetrics">type HandlerMetrics struct</a>

```
searchKey: repoupdater.HandlerMetrics
```

```Go
type HandlerMetrics struct {
	ServeHTTP *metrics.OperationMetrics
}
```

HandlerMetrics encapsulates the Prometheus metrics of an http.Handler. 

#### <a id="NewHandlerMetrics" href="#NewHandlerMetrics">func NewHandlerMetrics() HandlerMetrics</a>

```
searchKey: repoupdater.NewHandlerMetrics
```

```Go
func NewHandlerMetrics() HandlerMetrics
```

NewHandlerMetrics returns HandlerMetrics that need to be registered in a Prometheus registry. 

#### <a id="HandlerMetrics.MustRegister" href="#HandlerMetrics.MustRegister">func (m HandlerMetrics) MustRegister(r prometheus.Registerer)</a>

```
searchKey: repoupdater.HandlerMetrics.MustRegister
```

```Go
func (m HandlerMetrics) MustRegister(r prometheus.Registerer)
```

MustRegister registers all metrics in HandlerMetrics in the given prometheus.Registerer. It panics in case of failure. 

### <a id="observedHandler" href="#observedHandler">type observedHandler struct</a>

```
searchKey: repoupdater.observedHandler
tags: [private]
```

```Go
type observedHandler struct {
	next    http.Handler
	log     log15.Logger
	metrics HandlerMetrics
}
```

#### <a id="observedHandler.ServeHTTP" href="#observedHandler.ServeHTTP">func (h *observedHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: repoupdater.observedHandler.ServeHTTP
tags: [private]
```

```Go
func (h *observedHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

### <a id="responseRecorder" href="#responseRecorder">type responseRecorder struct</a>

```
searchKey: repoupdater.responseRecorder
tags: [private]
```

```Go
type responseRecorder struct {
	http.ResponseWriter
	code    int
	written int64
}
```

#### <a id="responseRecorder.WriteHeader" href="#responseRecorder.WriteHeader">func (w *responseRecorder) WriteHeader(code int)</a>

```
searchKey: repoupdater.responseRecorder.WriteHeader
tags: [private]
```

```Go
func (w *responseRecorder) WriteHeader(code int)
```

WriteHeader may not be explicitly called, so care must be taken to initialize w.code to its default value of http.StatusOK. 

#### <a id="responseRecorder.Write" href="#responseRecorder.Write">func (w *responseRecorder) Write(p []byte) (int, error)</a>

```
searchKey: repoupdater.responseRecorder.Write
tags: [private]
```

```Go
func (w *responseRecorder) Write(p []byte) (int, error)
```

### <a id="Server" href="#Server">type Server struct</a>

```
searchKey: repoupdater.Server
```

```Go
type Server struct {
	*repos.Store
	*repos.Syncer
	SourcegraphDotComMode bool
	GithubDotComSource    interface {
		GetRepo(ctx context.Context, nameWithOwner string) (*types.Repo, error)
	}
	GitLabDotComSource interface {
		GetRepo(ctx context.Context, projectWithNamespace string) (*types.Repo, error)
	}
	Scheduler interface {
		UpdateOnce(id api.RepoID, name api.RepoName)
		ScheduleInfo(id api.RepoID) *protocol.RepoUpdateSchedulerInfoResult
	}
	GitserverClient interface {
		ListCloned(context.Context) ([]string, error)
	}
	ChangesetSyncRegistry interface {
		// EnqueueChangesetSyncs will queue the supplied changesets to sync ASAP.
		EnqueueChangesetSyncs(ctx context.Context, ids []int64) error
		// HandleExternalServiceSync should be called when an external service changes so that
		// the registry can start or stop the syncer associated with the service
		HandleExternalServiceSync(es api.ExternalService)
	}
	RateLimitSyncer interface {
		// SyncRateLimiters should be called when an external service changes so that
		// our internal rate limiters are kept in sync
		SyncRateLimiters(ctx context.Context) error
	}
	PermsSyncer interface {
		// ScheduleUsers schedules new permissions syncing requests for given users.
		ScheduleUsers(ctx context.Context, userIDs ...int32)
		// ScheduleRepos schedules new permissions syncing requests for given repositories.
		ScheduleRepos(ctx context.Context, repoIDs ...api.RepoID)
	}
}
```

Server is a repoupdater server. 

#### <a id="Server.Handler" href="#Server.Handler">func (s *Server) Handler() http.Handler</a>

```
searchKey: repoupdater.Server.Handler
```

```Go
func (s *Server) Handler() http.Handler
```

Handler returns the http.Handler that should be used to serve requests. 

#### <a id="Server.handleRepoUpdateSchedulerInfo" href="#Server.handleRepoUpdateSchedulerInfo">func (s *Server) handleRepoUpdateSchedulerInfo(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: repoupdater.Server.handleRepoUpdateSchedulerInfo
tags: [private]
```

```Go
func (s *Server) handleRepoUpdateSchedulerInfo(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleRepoLookup" href="#Server.handleRepoLookup">func (s *Server) handleRepoLookup(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: repoupdater.Server.handleRepoLookup
tags: [private]
```

```Go
func (s *Server) handleRepoLookup(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleEnqueueRepoUpdate" href="#Server.handleEnqueueRepoUpdate">func (s *Server) handleEnqueueRepoUpdate(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: repoupdater.Server.handleEnqueueRepoUpdate
tags: [private]
```

```Go
func (s *Server) handleEnqueueRepoUpdate(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.enqueueRepoUpdate" href="#Server.enqueueRepoUpdate">func (s *Server) enqueueRepoUpdate(ctx context.Context, req *protocol.RepoUpdateRequest) (resp *protocol.RepoUpdateResponse, httpStatus int, err error)</a>

```
searchKey: repoupdater.Server.enqueueRepoUpdate
tags: [private]
```

```Go
func (s *Server) enqueueRepoUpdate(ctx context.Context, req *protocol.RepoUpdateRequest) (resp *protocol.RepoUpdateResponse, httpStatus int, err error)
```

#### <a id="Server.handleExternalServiceSync" href="#Server.handleExternalServiceSync">func (s *Server) handleExternalServiceSync(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: repoupdater.Server.handleExternalServiceSync
tags: [private]
```

```Go
func (s *Server) handleExternalServiceSync(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.repoLookup" href="#Server.repoLookup">func (s *Server) repoLookup(ctx context.Context, args protocol.RepoLookupArgs) (result *protocol.RepoLookupResult, err error)</a>

```
searchKey: repoupdater.Server.repoLookup
tags: [private]
```

```Go
func (s *Server) repoLookup(ctx context.Context, args protocol.RepoLookupArgs) (result *protocol.RepoLookupResult, err error)
```

#### <a id="Server.remoteRepoSync" href="#Server.remoteRepoSync">func (s *Server) remoteRepoSync(ctx context.Context, codehost *extsvc.CodeHost, remoteName string) (*protocol.RepoLookupResult, error)</a>

```
searchKey: repoupdater.Server.remoteRepoSync
tags: [private]
```

```Go
func (s *Server) remoteRepoSync(ctx context.Context, codehost *extsvc.CodeHost, remoteName string) (*protocol.RepoLookupResult, error)
```

remoteRepoSync is used by Sourcegraph.com to incrementally sync metadata for remoteName on codehost. 

#### <a id="Server.handleEnqueueChangesetSync" href="#Server.handleEnqueueChangesetSync">func (s *Server) handleEnqueueChangesetSync(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: repoupdater.Server.handleEnqueueChangesetSync
tags: [private]
```

```Go
func (s *Server) handleEnqueueChangesetSync(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleSchedulePermsSync" href="#Server.handleSchedulePermsSync">func (s *Server) handleSchedulePermsSync(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: repoupdater.Server.handleSchedulePermsSync
tags: [private]
```

```Go
func (s *Server) handleSchedulePermsSync(w http.ResponseWriter, r *http.Request)
```

### <a id="fakeRepoSource" href="#fakeRepoSource">type fakeRepoSource struct</a>

```
searchKey: repoupdater.fakeRepoSource
tags: [private]
```

```Go
type fakeRepoSource struct {
	repo *types.Repo
	err  error
}
```

#### <a id="fakeRepoSource.GetRepo" href="#fakeRepoSource.GetRepo">func (s *fakeRepoSource) GetRepo(context.Context, string) (*types.Repo, error)</a>

```
searchKey: repoupdater.fakeRepoSource.GetRepo
tags: [private]
```

```Go
func (s *fakeRepoSource) GetRepo(context.Context, string) (*types.Repo, error)
```

### <a id="fakeScheduler" href="#fakeScheduler">type fakeScheduler struct{}</a>

```
searchKey: repoupdater.fakeScheduler
tags: [private]
```

```Go
type fakeScheduler struct{}
```

#### <a id="fakeScheduler.UpdateOnce" href="#fakeScheduler.UpdateOnce">func (s *fakeScheduler) UpdateOnce(_ api.RepoID, _ api.RepoName)</a>

```
searchKey: repoupdater.fakeScheduler.UpdateOnce
tags: [private]
```

```Go
func (s *fakeScheduler) UpdateOnce(_ api.RepoID, _ api.RepoName)
```

#### <a id="fakeScheduler.ScheduleInfo" href="#fakeScheduler.ScheduleInfo">func (s *fakeScheduler) ScheduleInfo(id api.RepoID) *protocol.RepoUpdateSchedulerInfoResult</a>

```
searchKey: repoupdater.fakeScheduler.ScheduleInfo
tags: [private]
```

```Go
func (s *fakeScheduler) ScheduleInfo(id api.RepoID) *protocol.RepoUpdateSchedulerInfoResult
```

### <a id="fakePermsSyncer" href="#fakePermsSyncer">type fakePermsSyncer struct{}</a>

```
searchKey: repoupdater.fakePermsSyncer
tags: [private]
```

```Go
type fakePermsSyncer struct{}
```

#### <a id="fakePermsSyncer.ScheduleUsers" href="#fakePermsSyncer.ScheduleUsers">func (*fakePermsSyncer) ScheduleUsers(ctx context.Context, userIDs ...int32)</a>

```
searchKey: repoupdater.fakePermsSyncer.ScheduleUsers
tags: [private]
```

```Go
func (*fakePermsSyncer) ScheduleUsers(ctx context.Context, userIDs ...int32)
```

#### <a id="fakePermsSyncer.ScheduleRepos" href="#fakePermsSyncer.ScheduleRepos">func (*fakePermsSyncer) ScheduleRepos(ctx context.Context, repoIDs ...api.RepoID)</a>

```
searchKey: repoupdater.fakePermsSyncer.ScheduleRepos
tags: [private]
```

```Go
func (*fakePermsSyncer) ScheduleRepos(ctx context.Context, repoIDs ...api.RepoID)
```

### <a id="testSource" href="#testSource">type testSource struct</a>

```
searchKey: repoupdater.testSource
tags: [private]
```

```Go
type testSource struct {
	fn func() error
}
```

#### <a id="testSource.ListRepos" href="#testSource.ListRepos">func (t testSource) ListRepos(ctx context.Context, results chan repos.SourceResult)</a>

```
searchKey: repoupdater.testSource.ListRepos
tags: [private]
```

```Go
func (t testSource) ListRepos(ctx context.Context, results chan repos.SourceResult)
```

#### <a id="testSource.ExternalServices" href="#testSource.ExternalServices">func (t testSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repoupdater.testSource.ExternalServices
tags: [private]
```

```Go
func (t testSource) ExternalServices() types.ExternalServices
```

#### <a id="testSource.WithAuthenticator" href="#testSource.WithAuthenticator">func (t testSource) WithAuthenticator(a auth.Authenticator) (repos.Source, error)</a>

```
searchKey: repoupdater.testSource.WithAuthenticator
tags: [private]
```

```Go
func (t testSource) WithAuthenticator(a auth.Authenticator) (repos.Source, error)
```

#### <a id="testSource.ValidateAuthenticator" href="#testSource.ValidateAuthenticator">func (t testSource) ValidateAuthenticator(ctx context.Context) error</a>

```
searchKey: repoupdater.testSource.ValidateAuthenticator
tags: [private]
```

```Go
func (t testSource) ValidateAuthenticator(ctx context.Context) error
```

## <a id="func" href="#func">Functions</a>

### <a id="ObservedHandler" href="#ObservedHandler">func ObservedHandler(log log15.Logger,...</a>

```
searchKey: repoupdater.ObservedHandler
```

```Go
func ObservedHandler(
	log log15.Logger,
	m HandlerMetrics,
	tr opentracing.Tracer,
) func(http.Handler) http.Handler
```

ObservedHandler returns a decorator that wraps an http.Handler with logging, Prometheus metrics and tracing. 

### <a id="respond" href="#respond">func respond(w http.ResponseWriter, code int, v interface{})</a>

```
searchKey: repoupdater.respond
tags: [private]
```

```Go
func respond(w http.ResponseWriter, code int, v interface{})
```

TODO(tsenart): Reuse this function in all handlers. 

### <a id="externalServiceValidate" href="#externalServiceValidate">func externalServiceValidate(ctx context.Context, req protocol.ExternalServiceSyncRequest, src repos.Source) error</a>

```
searchKey: repoupdater.externalServiceValidate
tags: [private]
```

```Go
func externalServiceValidate(ctx context.Context, req protocol.ExternalServiceSyncRequest, src repos.Source) error
```

### <a id="newRepoInfo" href="#newRepoInfo">func newRepoInfo(r *types.Repo) (*protocol.RepoInfo, error)</a>

```
searchKey: repoupdater.newRepoInfo
tags: [private]
```

```Go
func newRepoInfo(r *types.Repo) (*protocol.RepoInfo, error)
```

### <a id="pathAppend" href="#pathAppend">func pathAppend(base, p string) string</a>

```
searchKey: repoupdater.pathAppend
tags: [private]
```

```Go
func pathAppend(base, p string) string
```

### <a id="isUnauthorized" href="#isUnauthorized">func isUnauthorized(err error) bool</a>

```
searchKey: repoupdater.isUnauthorized
tags: [private]
```

```Go
func isUnauthorized(err error) bool
```

### <a id="isTemporarilyUnavailable" href="#isTemporarilyUnavailable">func isTemporarilyUnavailable(err error) bool</a>

```
searchKey: repoupdater.isTemporarilyUnavailable
tags: [private]
```

```Go
func isTemporarilyUnavailable(err error) bool
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: repoupdater.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestIntegration" href="#TestIntegration">func TestIntegration(t *testing.T)</a>

```
searchKey: repoupdater.TestIntegration
tags: [private]
```

```Go
func TestIntegration(t *testing.T)
```

### <a id="TestServer_handleRepoLookup" href="#TestServer_handleRepoLookup">func TestServer_handleRepoLookup(t *testing.T)</a>

```
searchKey: repoupdater.TestServer_handleRepoLookup
tags: [private]
```

```Go
func TestServer_handleRepoLookup(t *testing.T)
```

### <a id="testServerEnqueueRepoUpdate" href="#testServerEnqueueRepoUpdate">func testServerEnqueueRepoUpdate(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repoupdater.testServerEnqueueRepoUpdate
tags: [private]
```

```Go
func testServerEnqueueRepoUpdate(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testRepoLookup" href="#testRepoLookup">func testRepoLookup(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(t *testing.T)</a>

```
searchKey: repoupdater.testRepoLookup
tags: [private]
```

```Go
func testRepoLookup(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(t *testing.T)
```

### <a id="TestServer_handleSchedulePermsSync" href="#TestServer_handleSchedulePermsSync">func TestServer_handleSchedulePermsSync(t *testing.T)</a>

```
searchKey: repoupdater.TestServer_handleSchedulePermsSync
tags: [private]
```

```Go
func TestServer_handleSchedulePermsSync(t *testing.T)
```

### <a id="TestExternalServiceValidate_ValidatesToken" href="#TestExternalServiceValidate_ValidatesToken">func TestExternalServiceValidate_ValidatesToken(t *testing.T)</a>

```
searchKey: repoupdater.TestExternalServiceValidate_ValidatesToken
tags: [private]
```

```Go
func TestExternalServiceValidate_ValidatesToken(t *testing.T)
```

