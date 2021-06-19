# Package cli

Package cli contains CLI commands for the "src" program. 

It is a library, not a main package, so that other test packages may use its definitions (e.g., to invoke commands or create CLI argument strings directly in Go in a type-safe manner). 

## Index

* Subpages
  * [cmd/frontend/internal/cli/loghandlers](cli/loghandlers.md)
  * [cmd/frontend/internal/cli/middleware](cli/middleware.md)
  * [cmd/frontend/internal/cli/middleware_test](cli/middleware_test.md)
* [Constants](#const)
    * [const corsAllowHeader](#corsAllowHeader)
    * [const logoColor](#logoColor)
    * [const skipSysReqsEnvVar](#skipSysReqsEnvVar)
* [Variables](#var)
    * [var metricConfigOverrideUpdates](#metricConfigOverrideUpdates)
    * [var serviceConnectionsVal](#serviceConnectionsVal)
    * [var serviceConnectionsOnce](#serviceConnectionsOnce)
    * [var traceFields](#traceFields)
    * [var traceThreshold](#traceThreshold)
    * [var printLogo](#printLogo)
    * [var httpAddr](#httpAddr)
    * [var httpAddrInternal](#httpAddrInternal)
    * [var nginxAddr](#nginxAddr)
    * [var devExtension](#devExtension)
    * [var prodExtension](#prodExtension)
    * [var skipSysReqsEnv](#skipSysReqsEnv)
* [Types](#type)
    * [type configurationSource struct{}](#configurationSource)
        * [func (c configurationSource) Read(ctx context.Context) (conftypes.RawUnified, error)](#configurationSource.Read)
        * [func (c configurationSource) Write(ctx context.Context, input conftypes.RawUnified) error](#configurationSource.Write)
* [Functions](#func)
    * [func printConfigValidation()](#printConfigValidation)
    * [func overrideSiteConfig(ctx context.Context) error](#overrideSiteConfig)
    * [func overrideGlobalSettings(ctx context.Context, db dbutil.DB) error](#overrideGlobalSettings)
    * [func overrideExtSvcConfig(ctx context.Context, db dbutil.DB) error](#overrideExtSvcConfig)
    * [func watchUpdate(ctx context.Context, path string, update func(context.Context) error)](#watchUpdate)
    * [func watchPaths(ctx context.Context, paths ...string) (<-chan error, error)](#watchPaths)
    * [func serviceConnections() conftypes.ServiceConnections](#serviceConnections)
    * [func gitServers() []string](#gitServers)
    * [func comparePostgresDSNs(dsn1, dsn2 string) error](#comparePostgresDSNs)
    * [func newExternalHTTPHandler(db dbutil.DB, schema *graphql.Schema, gitHubWebhook webhooks.Registerer, gitLabWebhook, bitbucketServerWebhook http.Handler, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, newExecutorProxyHandler enterprise.NewExecutorProxyHandler, rateLimitWatcher graphqlbackend.LimitWatcher) (http.Handler, error)](#newExternalHTTPHandler)
    * [func healthCheckMiddleware(next http.Handler) http.Handler](#healthCheckMiddleware)
    * [func newInternalHTTPHandler(schema *graphql.Schema, db dbutil.DB, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimitWatcher graphqlbackend.LimitWatcher) http.Handler](#newInternalHTTPHandler)
    * [func withInternalActor(h http.Handler) http.Handler](#withInternalActor)
    * [func secureHeadersMiddleware(next http.Handler) http.Handler](#secureHeadersMiddleware)
    * [func isTrustedOrigin(r *http.Request) bool](#isTrustedOrigin)
    * [func newOutOfBandMigrationRunner(ctx context.Context, db *sql.DB) *oobmigration.Runner](#newOutOfBandMigrationRunner)
    * [func validateOutOfBandMigrationRunner(ctx context.Context, outOfBandMigrationRunner *oobmigration.Runner)](#validateOutOfBandMigrationRunner)
    * [func init()](#init)
    * [func defaultExternalURL(nginxAddr, httpAddr string) *url.URL](#defaultExternalURL)
    * [func InitDB() (*sql.DB, error)](#InitDB)
    * [func Main(enterpriseSetupHook func(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services) error](#Main)
    * [func makeExternalAPI(db dbutil.DB, schema *graphql.Schema, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)](#makeExternalAPI)
    * [func makeInternalAPI(schema *graphql.Schema, db dbutil.DB, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)](#makeInternalAPI)
    * [func isAllowedOrigin(origin string, allowedOrigins []string) bool](#isAllowedOrigin)
    * [func makeRateLimitWatcher() (*graphqlbackend.BasicLimitWatcher, error)](#makeRateLimitWatcher)
    * [func skippedSysReqs() []string](#skippedSysReqs)
    * [func checkSysReqs(ctx context.Context, w io.Writer) error](#checkSysReqs)
    * [func TestServiceConnections(t *testing.T)](#TestServiceConnections)


## <a id="const" href="#const">Constants</a>

### <a id="corsAllowHeader" href="#corsAllowHeader">const corsAllowHeader</a>

```
searchKey: cli.corsAllowHeader
```

```Go
const corsAllowHeader = "X-Requested-With"
```

corsAllowHeader is the HTTP header that, if present (and assuming secureHeadersMiddleware is used), indicates that the incoming HTTP request is either same-origin or is from an allowed origin. See [https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet#Protecting_REST_Services:_Use_of_Custom_Request_Headers](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet#Protecting_REST_Services:_Use_of_Custom_Request_Headers) for more information on this technique. 

### <a id="logoColor" href="#logoColor">const logoColor</a>

```
searchKey: cli.logoColor
```

```Go
const logoColor = ...
```

TODO(sqs): use non-colored logo if terminal doesn't support color 

### <a id="skipSysReqsEnvVar" href="#skipSysReqsEnvVar">const skipSysReqsEnvVar</a>

```
searchKey: cli.skipSysReqsEnvVar
```

```Go
const skipSysReqsEnvVar = "SRC_SKIP_REQS"
```

## <a id="var" href="#var">Variables</a>

### <a id="metricConfigOverrideUpdates" href="#metricConfigOverrideUpdates">var metricConfigOverrideUpdates</a>

```
searchKey: cli.metricConfigOverrideUpdates
```

```Go
var metricConfigOverrideUpdates = ...
```

### <a id="serviceConnectionsVal" href="#serviceConnectionsVal">var serviceConnectionsVal</a>

```
searchKey: cli.serviceConnectionsVal
```

```Go
var serviceConnectionsVal conftypes.ServiceConnections
```

### <a id="serviceConnectionsOnce" href="#serviceConnectionsOnce">var serviceConnectionsOnce</a>

```
searchKey: cli.serviceConnectionsOnce
```

```Go
var serviceConnectionsOnce sync.Once
```

### <a id="traceFields" href="#traceFields">var traceFields</a>

```
searchKey: cli.traceFields
```

```Go
var traceFields = ...
```

### <a id="traceThreshold" href="#traceThreshold">var traceThreshold</a>

```
searchKey: cli.traceThreshold
```

```Go
var traceThreshold = ...
```

### <a id="printLogo" href="#printLogo">var printLogo</a>

```
searchKey: cli.printLogo
```

```Go
var printLogo, _ = ...
```

### <a id="httpAddr" href="#httpAddr">var httpAddr</a>

```
searchKey: cli.httpAddr
```

```Go
var httpAddr = env.Get("SRC_HTTP_ADDR", ":3080", "HTTP listen address for app and HTTP API")
```

### <a id="httpAddrInternal" href="#httpAddrInternal">var httpAddrInternal</a>

```
searchKey: cli.httpAddrInternal
```

```Go
var httpAddrInternal = envvar.HTTPAddrInternal
```

### <a id="nginxAddr" href="#nginxAddr">var nginxAddr</a>

```
searchKey: cli.nginxAddr
```

```Go
var nginxAddr = ...
```

### <a id="devExtension" href="#devExtension">var devExtension</a>

```
searchKey: cli.devExtension
```

```Go
var devExtension = "chrome-extension://bmfbcejdknlknpncfpeloejonjoledha"
```

dev browser browser extension ID. You can find this by going to chrome://extensions 

### <a id="prodExtension" href="#prodExtension">var prodExtension</a>

```
searchKey: cli.prodExtension
```

```Go
var prodExtension = "chrome-extension://dgjhfomjieaadpoljlnidmbgkdffpack"
```

production browser extension ID. This is found by viewing our extension in the chrome store. 

### <a id="skipSysReqsEnv" href="#skipSysReqsEnv">var skipSysReqsEnv</a>

```
searchKey: cli.skipSysReqsEnv
```

```Go
var skipSysReqsEnv = env.Get(skipSysReqsEnvVar, "false", "skip system requirement checks")
```

## <a id="type" href="#type">Types</a>

### <a id="configurationSource" href="#configurationSource">type configurationSource struct{}</a>

```
searchKey: cli.configurationSource
```

```Go
type configurationSource struct{}
```

#### <a id="configurationSource.Read" href="#configurationSource.Read">func (c configurationSource) Read(ctx context.Context) (conftypes.RawUnified, error)</a>

```
searchKey: cli.configurationSource.Read
```

```Go
func (c configurationSource) Read(ctx context.Context) (conftypes.RawUnified, error)
```

#### <a id="configurationSource.Write" href="#configurationSource.Write">func (c configurationSource) Write(ctx context.Context, input conftypes.RawUnified) error</a>

```
searchKey: cli.configurationSource.Write
```

```Go
func (c configurationSource) Write(ctx context.Context, input conftypes.RawUnified) error
```

## <a id="func" href="#func">Functions</a>

### <a id="printConfigValidation" href="#printConfigValidation">func printConfigValidation()</a>

```
searchKey: cli.printConfigValidation
```

```Go
func printConfigValidation()
```

### <a id="overrideSiteConfig" href="#overrideSiteConfig">func overrideSiteConfig(ctx context.Context) error</a>

```
searchKey: cli.overrideSiteConfig
```

```Go
func overrideSiteConfig(ctx context.Context) error
```

### <a id="overrideGlobalSettings" href="#overrideGlobalSettings">func overrideGlobalSettings(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: cli.overrideGlobalSettings
```

```Go
func overrideGlobalSettings(ctx context.Context, db dbutil.DB) error
```

### <a id="overrideExtSvcConfig" href="#overrideExtSvcConfig">func overrideExtSvcConfig(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: cli.overrideExtSvcConfig
```

```Go
func overrideExtSvcConfig(ctx context.Context, db dbutil.DB) error
```

### <a id="watchUpdate" href="#watchUpdate">func watchUpdate(ctx context.Context, path string, update func(context.Context) error)</a>

```
searchKey: cli.watchUpdate
```

```Go
func watchUpdate(ctx context.Context, path string, update func(context.Context) error)
```

### <a id="watchPaths" href="#watchPaths">func watchPaths(ctx context.Context, paths ...string) (<-chan error, error)</a>

```
searchKey: cli.watchPaths
```

```Go
func watchPaths(ctx context.Context, paths ...string) (<-chan error, error)
```

watchPaths returns a channel which watches the non-empty paths. Whenever any path changes a nil error is sent down chan. If an error occurs it is sent. chan is closed when ctx is Done. 

Note: This can send many events even if the file content hasn't changed. For example chmod events are sent. Another is a rename is two events for watcher (remove and create). Additionally if a file is removed the watch is removed. Even if a file with the same name is created in its place later. 

### <a id="serviceConnections" href="#serviceConnections">func serviceConnections() conftypes.ServiceConnections</a>

```
searchKey: cli.serviceConnections
```

```Go
func serviceConnections() conftypes.ServiceConnections
```

### <a id="gitServers" href="#gitServers">func gitServers() []string</a>

```
searchKey: cli.gitServers
```

```Go
func gitServers() []string
```

### <a id="comparePostgresDSNs" href="#comparePostgresDSNs">func comparePostgresDSNs(dsn1, dsn2 string) error</a>

```
searchKey: cli.comparePostgresDSNs
```

```Go
func comparePostgresDSNs(dsn1, dsn2 string) error
```

comparePostgresDSNs returns an error if one of the given Postgres DSN values are not a valid URL, or if they are both valid URLs but point to the same database. We consider two DSNs to be the same when they specify the same host, port, and path. It's possible that different hosts/ports map to the same physical machine, so we could conceivably return false negatives here and the tricksy site-admin may have pulled the wool over our eyes. This shouldn't actually affect anything operationally in the near-term, but may just make migrations harder when we need to have them manually separate the data. 

### <a id="newExternalHTTPHandler" href="#newExternalHTTPHandler">func newExternalHTTPHandler(db dbutil.DB, schema *graphql.Schema, gitHubWebhook webhooks.Registerer, gitLabWebhook, bitbucketServerWebhook http.Handler, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, newExecutorProxyHandler enterprise.NewExecutorProxyHandler, rateLimitWatcher graphqlbackend.LimitWatcher) (http.Handler, error)</a>

```
searchKey: cli.newExternalHTTPHandler
```

```Go
func newExternalHTTPHandler(db dbutil.DB, schema *graphql.Schema, gitHubWebhook webhooks.Registerer, gitLabWebhook, bitbucketServerWebhook http.Handler, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, newExecutorProxyHandler enterprise.NewExecutorProxyHandler, rateLimitWatcher graphqlbackend.LimitWatcher) (http.Handler, error)
```

newExternalHTTPHandler creates and returns the HTTP handler that serves the app and API pages to external clients. 

### <a id="healthCheckMiddleware" href="#healthCheckMiddleware">func healthCheckMiddleware(next http.Handler) http.Handler</a>

```
searchKey: cli.healthCheckMiddleware
```

```Go
func healthCheckMiddleware(next http.Handler) http.Handler
```

### <a id="newInternalHTTPHandler" href="#newInternalHTTPHandler">func newInternalHTTPHandler(schema *graphql.Schema, db dbutil.DB, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimitWatcher graphqlbackend.LimitWatcher) http.Handler</a>

```
searchKey: cli.newInternalHTTPHandler
```

```Go
func newInternalHTTPHandler(schema *graphql.Schema, db dbutil.DB, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimitWatcher graphqlbackend.LimitWatcher) http.Handler
```

newInternalHTTPHandler creates and returns the HTTP handler for the internal API (accessible to other internal services). 

### <a id="withInternalActor" href="#withInternalActor">func withInternalActor(h http.Handler) http.Handler</a>

```
searchKey: cli.withInternalActor
```

```Go
func withInternalActor(h http.Handler) http.Handler
```

withInternalActor wraps an existing HTTP handler by setting an internal actor in the HTTP request context. 

🚨 SECURITY: This should *never* be called to wrap externally accessible handlers (i.e., only use for the internal endpoint), because internal requests will bypass repository permissions checks. 

### <a id="secureHeadersMiddleware" href="#secureHeadersMiddleware">func secureHeadersMiddleware(next http.Handler) http.Handler</a>

```
searchKey: cli.secureHeadersMiddleware
```

```Go
func secureHeadersMiddleware(next http.Handler) http.Handler
```

secureHeadersMiddleware adds and checks for HTTP security-related headers. 

🚨 SECURITY: This handler is served to all clients, even on private servers to clients who have not authenticated. It must not reveal any sensitive information. 

### <a id="isTrustedOrigin" href="#isTrustedOrigin">func isTrustedOrigin(r *http.Request) bool</a>

```
searchKey: cli.isTrustedOrigin
```

```Go
func isTrustedOrigin(r *http.Request) bool
```

isTrustedOrigin returns whether the HTTP request's Origin is trusted to initiate authenticated cross-origin requests. 

### <a id="newOutOfBandMigrationRunner" href="#newOutOfBandMigrationRunner">func newOutOfBandMigrationRunner(ctx context.Context, db *sql.DB) *oobmigration.Runner</a>

```
searchKey: cli.newOutOfBandMigrationRunner
```

```Go
func newOutOfBandMigrationRunner(ctx context.Context, db *sql.DB) *oobmigration.Runner
```

newOutOfBandMigrationRunner creates and validates an out of band migrator instance. This method may issue a `log.Fatal` when there are migrations left in an unexpected state for the current application version. 

### <a id="validateOutOfBandMigrationRunner" href="#validateOutOfBandMigrationRunner">func validateOutOfBandMigrationRunner(ctx context.Context, outOfBandMigrationRunner *oobmigration.Runner)</a>

```
searchKey: cli.validateOutOfBandMigrationRunner
```

```Go
func validateOutOfBandMigrationRunner(ctx context.Context, outOfBandMigrationRunner *oobmigration.Runner)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: cli.init
```

```Go
func init()
```

### <a id="defaultExternalURL" href="#defaultExternalURL">func defaultExternalURL(nginxAddr, httpAddr string) *url.URL</a>

```
searchKey: cli.defaultExternalURL
```

```Go
func defaultExternalURL(nginxAddr, httpAddr string) *url.URL
```

defaultExternalURL returns the default external URL of the application. 

### <a id="InitDB" href="#InitDB">func InitDB() (*sql.DB, error)</a>

```
searchKey: cli.InitDB
tags: [exported]
```

```Go
func InitDB() (*sql.DB, error)
```

InitDB initializes and returns the global database connection and sets the version of the frontend in our versions table. 

### <a id="Main" href="#Main">func Main(enterpriseSetupHook func(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services) error</a>

```
searchKey: cli.Main
tags: [exported]
```

```Go
func Main(enterpriseSetupHook func(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services) error
```

Main is the main entrypoint for the frontend server program. 

### <a id="makeExternalAPI" href="#makeExternalAPI">func makeExternalAPI(db dbutil.DB, schema *graphql.Schema, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)</a>

```
searchKey: cli.makeExternalAPI
```

```Go
func makeExternalAPI(db dbutil.DB, schema *graphql.Schema, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)
```

### <a id="makeInternalAPI" href="#makeInternalAPI">func makeInternalAPI(schema *graphql.Schema, db dbutil.DB, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)</a>

```
searchKey: cli.makeInternalAPI
```

```Go
func makeInternalAPI(schema *graphql.Schema, db dbutil.DB, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)
```

### <a id="isAllowedOrigin" href="#isAllowedOrigin">func isAllowedOrigin(origin string, allowedOrigins []string) bool</a>

```
searchKey: cli.isAllowedOrigin
```

```Go
func isAllowedOrigin(origin string, allowedOrigins []string) bool
```

### <a id="makeRateLimitWatcher" href="#makeRateLimitWatcher">func makeRateLimitWatcher() (*graphqlbackend.BasicLimitWatcher, error)</a>

```
searchKey: cli.makeRateLimitWatcher
```

```Go
func makeRateLimitWatcher() (*graphqlbackend.BasicLimitWatcher, error)
```

### <a id="skippedSysReqs" href="#skippedSysReqs">func skippedSysReqs() []string</a>

```
searchKey: cli.skippedSysReqs
```

```Go
func skippedSysReqs() []string
```

skippedSysReqs returns a list of sysreq names to skip (e.g., "Docker"). 

### <a id="checkSysReqs" href="#checkSysReqs">func checkSysReqs(ctx context.Context, w io.Writer) error</a>

```
searchKey: cli.checkSysReqs
```

```Go
func checkSysReqs(ctx context.Context, w io.Writer) error
```

checkSysReqs uses package sysreq to check for the presence of system requirements. If any are missing, it prints a message to w and returns a non-nil error. 

### <a id="TestServiceConnections" href="#TestServiceConnections">func TestServiceConnections(t *testing.T)</a>

```
searchKey: cli.TestServiceConnections
```

```Go
func TestServiceConnections(t *testing.T)
```

