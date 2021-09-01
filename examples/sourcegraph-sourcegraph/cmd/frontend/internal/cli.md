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
    * [var devExtension](#devExtension)
    * [var httpAddr](#httpAddr)
    * [var httpAddrInternal](#httpAddrInternal)
    * [var metricConfigOverrideUpdates](#metricConfigOverrideUpdates)
    * [var nginxAddr](#nginxAddr)
    * [var printLogo](#printLogo)
    * [var prodExtension](#prodExtension)
    * [var serviceConnectionsOnce](#serviceConnectionsOnce)
    * [var serviceConnectionsVal](#serviceConnectionsVal)
    * [var skipSysReqsEnv](#skipSysReqsEnv)
    * [var traceFields](#traceFields)
    * [var traceThreshold](#traceThreshold)
* [Types](#type)
    * [type configurationSource struct{}](#configurationSource)
        * [func (c configurationSource) Read(ctx context.Context) (conftypes.RawUnified, error)](#configurationSource.Read)
        * [func (c configurationSource) Write(ctx context.Context, input conftypes.RawUnified) error](#configurationSource.Write)
* [Functions](#func)
    * [func InitDB() (*sql.DB, error)](#InitDB)
    * [func Main(enterpriseSetupHook func(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services) error](#Main)
    * [func TestServiceConnections(t *testing.T)](#TestServiceConnections)
    * [func checkSysReqs(ctx context.Context, w io.Writer) error](#checkSysReqs)
    * [func comparePostgresDSNs(dsn1, dsn2 string) error](#comparePostgresDSNs)
    * [func defaultExternalURL(nginxAddr, httpAddr string) *url.URL](#defaultExternalURL)
    * [func gitServers() []string](#gitServers)
    * [func healthCheckMiddleware(next http.Handler) http.Handler](#healthCheckMiddleware)
    * [func init()](#init.serve_cmd.go)
    * [func isAllowedOrigin(origin string, allowedOrigins []string) bool](#isAllowedOrigin)
    * [func isTrustedOrigin(r *http.Request) bool](#isTrustedOrigin)
    * [func makeExternalAPI(db dbutil.DB, schema *graphql.Schema, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)](#makeExternalAPI)
    * [func makeInternalAPI(schema *graphql.Schema, db dbutil.DB, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)](#makeInternalAPI)
    * [func makeRateLimitWatcher() (*graphqlbackend.BasicLimitWatcher, error)](#makeRateLimitWatcher)
    * [func newExternalHTTPHandler(db dbutil.DB, schema *graphql.Schema, gitHubWebhook webhooks.Registerer, gitLabWebhook, bitbucketServerWebhook http.Handler, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, newExecutorProxyHandler enterprise.NewExecutorProxyHandler, rateLimitWatcher graphqlbackend.LimitWatcher) (http.Handler, error)](#newExternalHTTPHandler)
    * [func newInternalHTTPHandler(schema *graphql.Schema, db dbutil.DB, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimitWatcher graphqlbackend.LimitWatcher) http.Handler](#newInternalHTTPHandler)
    * [func newOutOfBandMigrationRunner(ctx context.Context, db *sql.DB) *oobmigration.Runner](#newOutOfBandMigrationRunner)
    * [func overrideExtSvcConfig(ctx context.Context, db dbutil.DB) error](#overrideExtSvcConfig)
    * [func overrideGlobalSettings(ctx context.Context, db dbutil.DB) error](#overrideGlobalSettings)
    * [func overrideSiteConfig(ctx context.Context) error](#overrideSiteConfig)
    * [func printConfigValidation()](#printConfigValidation)
    * [func secureHeadersMiddleware(next http.Handler) http.Handler](#secureHeadersMiddleware)
    * [func serviceConnections() conftypes.ServiceConnections](#serviceConnections)
    * [func skippedSysReqs() []string](#skippedSysReqs)
    * [func validateOutOfBandMigrationRunner(ctx context.Context, outOfBandMigrationRunner *oobmigration.Runner)](#validateOutOfBandMigrationRunner)
    * [func watchPaths(ctx context.Context, paths ...string) (<-chan error, error)](#watchPaths)
    * [func watchUpdate(ctx context.Context, path string, update func(context.Context) error)](#watchUpdate)
    * [func withInternalActor(h http.Handler) http.Handler](#withInternalActor)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="corsAllowHeader" href="#corsAllowHeader">const corsAllowHeader</a>

```
searchKey: cli.corsAllowHeader
tags: [constant string private]
```

```Go
const corsAllowHeader = "X-Requested-With"
```

corsAllowHeader is the HTTP header that, if present (and assuming secureHeadersMiddleware is used), indicates that the incoming HTTP request is either same-origin or is from an allowed origin. See [https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet#Protecting_REST_Services:_Use_of_Custom_Request_Headers](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet#Protecting_REST_Services:_Use_of_Custom_Request_Headers) for more information on this technique. 

### <a id="logoColor" href="#logoColor">const logoColor</a>

```
searchKey: cli.logoColor
tags: [constant string private]
```

```Go
const logoColor = ...
```

TODO(sqs): use non-colored logo if terminal doesn't support color 

### <a id="skipSysReqsEnvVar" href="#skipSysReqsEnvVar">const skipSysReqsEnvVar</a>

```
searchKey: cli.skipSysReqsEnvVar
tags: [constant string private]
```

```Go
const skipSysReqsEnvVar = "SRC_SKIP_REQS"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="devExtension" href="#devExtension">var devExtension</a>

```
searchKey: cli.devExtension
tags: [variable string private]
```

```Go
var devExtension = "chrome-extension://bmfbcejdknlknpncfpeloejonjoledha"
```

dev browser browser extension ID. You can find this by going to chrome://extensions 

### <a id="httpAddr" href="#httpAddr">var httpAddr</a>

```
searchKey: cli.httpAddr
tags: [variable string private]
```

```Go
var httpAddr = env.Get("SRC_HTTP_ADDR", ":3080", "HTTP listen address for app and HTTP API")
```

### <a id="httpAddrInternal" href="#httpAddrInternal">var httpAddrInternal</a>

```
searchKey: cli.httpAddrInternal
tags: [variable string private]
```

```Go
var httpAddrInternal = envvar.HTTPAddrInternal
```

### <a id="metricConfigOverrideUpdates" href="#metricConfigOverrideUpdates">var metricConfigOverrideUpdates</a>

```
searchKey: cli.metricConfigOverrideUpdates
tags: [variable struct private]
```

```Go
var metricConfigOverrideUpdates = ...
```

### <a id="nginxAddr" href="#nginxAddr">var nginxAddr</a>

```
searchKey: cli.nginxAddr
tags: [variable string private]
```

```Go
var nginxAddr = ...
```

### <a id="printLogo" href="#printLogo">var printLogo</a>

```
searchKey: cli.printLogo
tags: [variable boolean private]
```

```Go
var printLogo, _ = ...
```

### <a id="prodExtension" href="#prodExtension">var prodExtension</a>

```
searchKey: cli.prodExtension
tags: [variable string private]
```

```Go
var prodExtension = "chrome-extension://dgjhfomjieaadpoljlnidmbgkdffpack"
```

production browser extension ID. This is found by viewing our extension in the chrome store. 

### <a id="serviceConnectionsOnce" href="#serviceConnectionsOnce">var serviceConnectionsOnce</a>

```
searchKey: cli.serviceConnectionsOnce
tags: [variable struct private]
```

```Go
var serviceConnectionsOnce sync.Once
```

### <a id="serviceConnectionsVal" href="#serviceConnectionsVal">var serviceConnectionsVal</a>

```
searchKey: cli.serviceConnectionsVal
tags: [variable struct private]
```

```Go
var serviceConnectionsVal conftypes.ServiceConnections
```

### <a id="skipSysReqsEnv" href="#skipSysReqsEnv">var skipSysReqsEnv</a>

```
searchKey: cli.skipSysReqsEnv
tags: [variable string private]
```

```Go
var skipSysReqsEnv = env.Get(skipSysReqsEnvVar, "false", "skip system requirement checks")
```

### <a id="traceFields" href="#traceFields">var traceFields</a>

```
searchKey: cli.traceFields
tags: [variable string private]
```

```Go
var traceFields = ...
```

### <a id="traceThreshold" href="#traceThreshold">var traceThreshold</a>

```
searchKey: cli.traceThreshold
tags: [variable string private]
```

```Go
var traceThreshold = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="configurationSource" href="#configurationSource">type configurationSource struct{}</a>

```
searchKey: cli.configurationSource
tags: [struct private]
```

```Go
type configurationSource struct{}
```

#### <a id="configurationSource.Read" href="#configurationSource.Read">func (c configurationSource) Read(ctx context.Context) (conftypes.RawUnified, error)</a>

```
searchKey: cli.configurationSource.Read
tags: [method private]
```

```Go
func (c configurationSource) Read(ctx context.Context) (conftypes.RawUnified, error)
```

#### <a id="configurationSource.Write" href="#configurationSource.Write">func (c configurationSource) Write(ctx context.Context, input conftypes.RawUnified) error</a>

```
searchKey: cli.configurationSource.Write
tags: [method private]
```

```Go
func (c configurationSource) Write(ctx context.Context, input conftypes.RawUnified) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="InitDB" href="#InitDB">func InitDB() (*sql.DB, error)</a>

```
searchKey: cli.InitDB
tags: [function]
```

```Go
func InitDB() (*sql.DB, error)
```

InitDB initializes and returns the global database connection and sets the version of the frontend in our versions table. 

### <a id="Main" href="#Main">func Main(enterpriseSetupHook func(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services) error</a>

```
searchKey: cli.Main
tags: [function]
```

```Go
func Main(enterpriseSetupHook func(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services) error
```

Main is the main entrypoint for the frontend server program. 

### <a id="TestServiceConnections" href="#TestServiceConnections">func TestServiceConnections(t *testing.T)</a>

```
searchKey: cli.TestServiceConnections
tags: [function private test]
```

```Go
func TestServiceConnections(t *testing.T)
```

### <a id="checkSysReqs" href="#checkSysReqs">func checkSysReqs(ctx context.Context, w io.Writer) error</a>

```
searchKey: cli.checkSysReqs
tags: [function private]
```

```Go
func checkSysReqs(ctx context.Context, w io.Writer) error
```

checkSysReqs uses package sysreq to check for the presence of system requirements. If any are missing, it prints a message to w and returns a non-nil error. 

### <a id="comparePostgresDSNs" href="#comparePostgresDSNs">func comparePostgresDSNs(dsn1, dsn2 string) error</a>

```
searchKey: cli.comparePostgresDSNs
tags: [function private]
```

```Go
func comparePostgresDSNs(dsn1, dsn2 string) error
```

comparePostgresDSNs returns an error if one of the given Postgres DSN values are not a valid URL, or if they are both valid URLs but point to the same database. We consider two DSNs to be the same when they specify the same host, port, and path. It's possible that different hosts/ports map to the same physical machine, so we could conceivably return false negatives here and the tricksy site-admin may have pulled the wool over our eyes. This shouldn't actually affect anything operationally in the near-term, but may just make migrations harder when we need to have them manually separate the data. 

### <a id="defaultExternalURL" href="#defaultExternalURL">func defaultExternalURL(nginxAddr, httpAddr string) *url.URL</a>

```
searchKey: cli.defaultExternalURL
tags: [function private]
```

```Go
func defaultExternalURL(nginxAddr, httpAddr string) *url.URL
```

defaultExternalURL returns the default external URL of the application. 

### <a id="gitServers" href="#gitServers">func gitServers() []string</a>

```
searchKey: cli.gitServers
tags: [function private]
```

```Go
func gitServers() []string
```

### <a id="healthCheckMiddleware" href="#healthCheckMiddleware">func healthCheckMiddleware(next http.Handler) http.Handler</a>

```
searchKey: cli.healthCheckMiddleware
tags: [function private]
```

```Go
func healthCheckMiddleware(next http.Handler) http.Handler
```

### <a id="init.serve_cmd.go" href="#init.serve_cmd.go">func init()</a>

```
searchKey: cli.init
tags: [function private]
```

```Go
func init()
```

### <a id="isAllowedOrigin" href="#isAllowedOrigin">func isAllowedOrigin(origin string, allowedOrigins []string) bool</a>

```
searchKey: cli.isAllowedOrigin
tags: [function private]
```

```Go
func isAllowedOrigin(origin string, allowedOrigins []string) bool
```

### <a id="isTrustedOrigin" href="#isTrustedOrigin">func isTrustedOrigin(r *http.Request) bool</a>

```
searchKey: cli.isTrustedOrigin
tags: [function private]
```

```Go
func isTrustedOrigin(r *http.Request) bool
```

isTrustedOrigin returns whether the HTTP request's Origin is trusted to initiate authenticated cross-origin requests. 

### <a id="makeExternalAPI" href="#makeExternalAPI">func makeExternalAPI(db dbutil.DB, schema *graphql.Schema, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)</a>

```
searchKey: cli.makeExternalAPI
tags: [function private]
```

```Go
func makeExternalAPI(db dbutil.DB, schema *graphql.Schema, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)
```

### <a id="makeInternalAPI" href="#makeInternalAPI">func makeInternalAPI(schema *graphql.Schema, db dbutil.DB, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)</a>

```
searchKey: cli.makeInternalAPI
tags: [function private]
```

```Go
func makeInternalAPI(schema *graphql.Schema, db dbutil.DB, enterprise enterprise.Services, rateLimiter graphqlbackend.LimitWatcher) (goroutine.BackgroundRoutine, error)
```

### <a id="makeRateLimitWatcher" href="#makeRateLimitWatcher">func makeRateLimitWatcher() (*graphqlbackend.BasicLimitWatcher, error)</a>

```
searchKey: cli.makeRateLimitWatcher
tags: [function private]
```

```Go
func makeRateLimitWatcher() (*graphqlbackend.BasicLimitWatcher, error)
```

### <a id="newExternalHTTPHandler" href="#newExternalHTTPHandler">func newExternalHTTPHandler(db dbutil.DB, schema *graphql.Schema, gitHubWebhook webhooks.Registerer, gitLabWebhook, bitbucketServerWebhook http.Handler, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, newExecutorProxyHandler enterprise.NewExecutorProxyHandler, rateLimitWatcher graphqlbackend.LimitWatcher) (http.Handler, error)</a>

```
searchKey: cli.newExternalHTTPHandler
tags: [function private]
```

```Go
func newExternalHTTPHandler(db dbutil.DB, schema *graphql.Schema, gitHubWebhook webhooks.Registerer, gitLabWebhook, bitbucketServerWebhook http.Handler, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, newExecutorProxyHandler enterprise.NewExecutorProxyHandler, rateLimitWatcher graphqlbackend.LimitWatcher) (http.Handler, error)
```

newExternalHTTPHandler creates and returns the HTTP handler that serves the app and API pages to external clients. 

### <a id="newInternalHTTPHandler" href="#newInternalHTTPHandler">func newInternalHTTPHandler(schema *graphql.Schema, db dbutil.DB, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimitWatcher graphqlbackend.LimitWatcher) http.Handler</a>

```
searchKey: cli.newInternalHTTPHandler
tags: [function private]
```

```Go
func newInternalHTTPHandler(schema *graphql.Schema, db dbutil.DB, newCodeIntelUploadHandler enterprise.NewCodeIntelUploadHandler, rateLimitWatcher graphqlbackend.LimitWatcher) http.Handler
```

newInternalHTTPHandler creates and returns the HTTP handler for the internal API (accessible to other internal services). 

### <a id="newOutOfBandMigrationRunner" href="#newOutOfBandMigrationRunner">func newOutOfBandMigrationRunner(ctx context.Context, db *sql.DB) *oobmigration.Runner</a>

```
searchKey: cli.newOutOfBandMigrationRunner
tags: [function private]
```

```Go
func newOutOfBandMigrationRunner(ctx context.Context, db *sql.DB) *oobmigration.Runner
```

newOutOfBandMigrationRunner creates and validates an out of band migrator instance. This method may issue a `log.Fatal` when there are migrations left in an unexpected state for the current application version. 

### <a id="overrideExtSvcConfig" href="#overrideExtSvcConfig">func overrideExtSvcConfig(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: cli.overrideExtSvcConfig
tags: [function private]
```

```Go
func overrideExtSvcConfig(ctx context.Context, db dbutil.DB) error
```

### <a id="overrideGlobalSettings" href="#overrideGlobalSettings">func overrideGlobalSettings(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: cli.overrideGlobalSettings
tags: [function private]
```

```Go
func overrideGlobalSettings(ctx context.Context, db dbutil.DB) error
```

### <a id="overrideSiteConfig" href="#overrideSiteConfig">func overrideSiteConfig(ctx context.Context) error</a>

```
searchKey: cli.overrideSiteConfig
tags: [function private]
```

```Go
func overrideSiteConfig(ctx context.Context) error
```

### <a id="printConfigValidation" href="#printConfigValidation">func printConfigValidation()</a>

```
searchKey: cli.printConfigValidation
tags: [function private]
```

```Go
func printConfigValidation()
```

### <a id="secureHeadersMiddleware" href="#secureHeadersMiddleware">func secureHeadersMiddleware(next http.Handler) http.Handler</a>

```
searchKey: cli.secureHeadersMiddleware
tags: [function private]
```

```Go
func secureHeadersMiddleware(next http.Handler) http.Handler
```

secureHeadersMiddleware adds and checks for HTTP security-related headers. 

🚨 SECURITY: This handler is served to all clients, even on private servers to clients who have not authenticated. It must not reveal any sensitive information. 

### <a id="serviceConnections" href="#serviceConnections">func serviceConnections() conftypes.ServiceConnections</a>

```
searchKey: cli.serviceConnections
tags: [function private]
```

```Go
func serviceConnections() conftypes.ServiceConnections
```

### <a id="skippedSysReqs" href="#skippedSysReqs">func skippedSysReqs() []string</a>

```
searchKey: cli.skippedSysReqs
tags: [function private]
```

```Go
func skippedSysReqs() []string
```

skippedSysReqs returns a list of sysreq names to skip (e.g., "Docker"). 

### <a id="validateOutOfBandMigrationRunner" href="#validateOutOfBandMigrationRunner">func validateOutOfBandMigrationRunner(ctx context.Context, outOfBandMigrationRunner *oobmigration.Runner)</a>

```
searchKey: cli.validateOutOfBandMigrationRunner
tags: [function private]
```

```Go
func validateOutOfBandMigrationRunner(ctx context.Context, outOfBandMigrationRunner *oobmigration.Runner)
```

### <a id="watchPaths" href="#watchPaths">func watchPaths(ctx context.Context, paths ...string) (<-chan error, error)</a>

```
searchKey: cli.watchPaths
tags: [function private]
```

```Go
func watchPaths(ctx context.Context, paths ...string) (<-chan error, error)
```

watchPaths returns a channel which watches the non-empty paths. Whenever any path changes a nil error is sent down chan. If an error occurs it is sent. chan is closed when ctx is Done. 

Note: This can send many events even if the file content hasn't changed. For example chmod events are sent. Another is a rename is two events for watcher (remove and create). Additionally if a file is removed the watch is removed. Even if a file with the same name is created in its place later. 

### <a id="watchUpdate" href="#watchUpdate">func watchUpdate(ctx context.Context, path string, update func(context.Context) error)</a>

```
searchKey: cli.watchUpdate
tags: [function private]
```

```Go
func watchUpdate(ctx context.Context, path string, update func(context.Context) error)
```

### <a id="withInternalActor" href="#withInternalActor">func withInternalActor(h http.Handler) http.Handler</a>

```
searchKey: cli.withInternalActor
tags: [function private]
```

```Go
func withInternalActor(h http.Handler) http.Handler
```

withInternalActor wraps an existing HTTP handler by setting an internal actor in the HTTP request context. 

🚨 SECURITY: This should *never* be called to wrap externally accessible handlers (i.e., only use for the internal endpoint), because internal requests will bypass repository permissions checks. 

