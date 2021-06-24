# Package app

Package app contains the front-end Web application. 

## Index

* Subpages
  * [cmd/frontend/internal/app/assetsutil](app/assetsutil.md)
  * [cmd/frontend/internal/app/debugproxies](app/debugproxies.md)
  * [cmd/frontend/internal/app/errorutil](app/errorutil.md)
  * [cmd/frontend/internal/app/jscontext](app/jscontext.md)
  * [cmd/frontend/internal/app/router](app/router.md)
  * [cmd/frontend/internal/app/ui](app/ui.md)
  * [cmd/frontend/internal/app/updatecheck](app/updatecheck.md)
* [Constants](#const)
    * [const errMonitoringNotLicensed](#errMonitoringNotLicensed)
* [Variables](#var)
    * [var PreMountGrafanaHook](#PreMountGrafanaHook)
    * [var allowRobotsVar](#allowRobotsVar)
    * [var grafanaURLFromEnv](#grafanaURLFromEnv)
    * [var jaegerURLFromEnv](#jaegerURLFromEnv)
    * [var openSearchDescription](#openSearchDescription)
    * [var regDriveLetter](#regDriveLetter)
    * [var ssoSignOutHandler](#ssoSignOutHandler)
* [Types](#type)
    * [type SignOutURL struct](#SignOutURL)
    * [type editorOpenFileRequest struct](#editorOpenFileRequest)
    * [type editorRequest struct](#editorRequest)
        * [func parseEditorRequest(q url.Values) (*editorRequest, error)](#parseEditorRequest)
        * [func (r *editorRequest) addTracking(q url.Values)](#editorRequest.addTracking)
        * [func (r *editorRequest) openFileRedirect(ctx context.Context) (string, error)](#editorRequest.openFileRedirect)
        * [func (r *editorRequest) redirectURL(ctx context.Context) (string, error)](#editorRequest.redirectURL)
        * [func (r *editorRequest) searchRedirect(ctx context.Context) (string, error)](#editorRequest.searchRedirect)
    * [type editorSearchRequest struct](#editorSearchRequest)
    * [type goSymbolSpec struct](#goSymbolSpec)
        * [func parseGoSymbolURLPath(path string) (*goSymbolSpec, error)](#parseGoSymbolURLPath)
    * [type invalidSymbolURLPathError struct](#invalidSymbolURLPathError)
        * [func (s *invalidSymbolURLPathError) Error() string](#invalidSymbolURLPathError.Error)
    * [type stringMapFS struct](#stringMapFS)
        * [func mapFS(m map[string]string) *stringMapFS](#mapFS)
        * [func (fs *stringMapFS) ListAllFiles(ctx context.Context) ([]string, error)](#stringMapFS.ListAllFiles)
    * [type symbolLocationArgs struct](#symbolLocationArgs)
    * [type test struct](#test)
* [Functions](#func)
    * [func IsAbs(path string) bool](#IsAbs)
    * [func IsURI(s lsp.DocumentURI) bool](#IsURI)
    * [func IsVendorDir(dir string) bool](#IsVendorDir)
    * [func NewHandler(db dbutil.DB) http.Handler](#NewHandler)
    * [func Panicf(r interface{}, format string, v ...interface{}) error](#Panicf)
    * [func PathEqual(a, b string) bool](#PathEqual)
    * [func PathHasPrefix(s, prefix string) bool](#PathHasPrefix)
    * [func PathToURI(path string) lsp.DocumentURI](#PathToURI)
    * [func PathTrimPrefix(s, prefix string) string](#PathTrimPrefix)
    * [func PrepareContext(bctx *build.Context, ctx context.Context, vfs ctxvfs.FileSystem)](#PrepareContext)
    * [func RegisterSSOSignOutHandler(f func(w http.ResponseWriter, r *http.Request))](#RegisterSSOSignOutHandler)
    * [func TestEditorRedirect(t *testing.T)](#TestEditorRedirect)
    * [func TestEditorRev(t *testing.T)](#TestEditorRev)
    * [func TestGrafanaLicensing(t *testing.T)](#TestGrafanaLicensing)
    * [func TestLatestPingHandler(t *testing.T)](#TestLatestPingHandler)
    * [func TestParseGoSymbolURLPath(t *testing.T)](#TestParseGoSymbolURLPath)
    * [func TestRobotsTxt(t *testing.T)](#TestRobotsTxt)
    * [func TestSymbolLocation(t *testing.T)](#TestSymbolLocation)
    * [func TestUsageStatsArchiveHandler(t *testing.T)](#TestUsageStatsArchiveHandler)
    * [func Test_prometheusValidator(t *testing.T)](#Test_prometheusValidator)
    * [func UriToPath(uri lsp.DocumentURI) string](#UriToPath)
    * [func UriToRealPath(uri lsp.DocumentURI) string](#UriToRealPath)
    * [func addDebugHandlers(r *mux.Router, db dbutil.DB)](#addDebugHandlers)
    * [func addGrafana(r *mux.Router, db dbutil.DB)](#addGrafana)
    * [func addGrafanaNotLicensedHandler(r *mux.Router, db dbutil.DB)](#addGrafanaNotLicensedHandler)
    * [func addJaeger(r *mux.Router, db dbutil.DB)](#addJaeger)
    * [func addNoGrafanaHandler(r *mux.Router, db dbutil.DB)](#addNoGrafanaHandler)
    * [func addNoJaegerHandler(r *mux.Router, db dbutil.DB)](#addNoJaegerHandler)
    * [func addNoK8sClientHandler(r *mux.Router, db dbutil.DB)](#addNoK8sClientHandler)
    * [func adminOnly(next http.Handler, db dbutil.DB) http.Handler](#adminOnly)
    * [func badgeValue(r *http.Request) (int, error)](#badgeValue)
    * [func badgeValueFmt(totalRefs int) string](#badgeValueFmt)
    * [func buildContextFromVFS(ctx context.Context, vfs ctxvfs.FileSystem) build.Context](#buildContextFromVFS)
    * [func editorRev(ctx context.Context, repoName api.RepoName, rev string, beExplicit bool) (string, error)](#editorRev)
    * [func favicon(w http.ResponseWriter, r *http.Request)](#favicon)
    * [func httpLogAndError(w http.ResponseWriter, msg string, code int, errArgs ...interface{})](#httpLogAndError)
    * [func init()](#init.app_test.go)
    * [func init()](#init.debug.go)
    * [func init()](#init.ping_test.go)
    * [func init()](#init.usage_stats_test.go)
    * [func isGoRepoPath(pkg string) bool](#isGoRepoPath)
    * [func isURI(s string) bool](#isURI)
    * [func latestPingHandler(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)](#latestPingHandler)
    * [func logSignOutEvent(r *http.Request, db dbutil.DB, name string)](#logSignOutEvent)
    * [func mkLocation(uri string, line, character int) *lsp.Location](#mkLocation)
    * [func newPrometheusValidator(prom srcprometheus.Client, promErr error) conf.Validator](#newPrometheusValidator)
    * [func normalizePath(s string) string](#normalizePath)
    * [func openSearch(w http.ResponseWriter, r *http.Request)](#openSearch)
    * [func parseFiles(fset *token.FileSet, bctx *build.Context, importPath, srcDir string) (*ast.Package, error)](#parseFiles)
    * [func repoVFS(ctx context.Context, name api.RepoName, rev api.CommitID) (ctxvfs.FileSystem, error)](#repoVFS)
    * [func robotsTxt(w http.ResponseWriter, r *http.Request)](#robotsTxt)
    * [func robotsTxtHelper(w io.Writer, allowRobots bool)](#robotsTxtHelper)
    * [func serveEditor(w http.ResponseWriter, r *http.Request) error](#serveEditor)
    * [func serveGDDORefs(w http.ResponseWriter, r *http.Request) error](#serveGDDORefs)
    * [func serveGoSymbolURL(w http.ResponseWriter, r *http.Request) error](#serveGoSymbolURL)
    * [func serveRepoBadge(w http.ResponseWriter, r *http.Request) error](#serveRepoBadge)
    * [func serveSignOutHandler(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)](#serveSignOutHandler)
    * [func serveVerifyEmail(w http.ResponseWriter, r *http.Request)](#serveVerifyEmail)
    * [func strptr(s string) *string](#strptr)
    * [func symbolLocation(ctx context.Context, vfs ctxvfs.FileSystem, commitID api.CommitID, symbolSpec *goSymbolSpec, pkgPath string) (*lsp.Location, error)](#symbolLocation)
    * [func trimFilePrefix(s string) string](#trimFilePrefix)
    * [func usageStatsArchiveHandler(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)](#usageStatsArchiveHandler)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="errMonitoringNotLicensed" href="#errMonitoringNotLicensed">const errMonitoringNotLicensed</a>

```
searchKey: app.errMonitoringNotLicensed
tags: [constant string private]
```

```Go
const errMonitoringNotLicensed = ...
```

This error is returned if the current license does not support monitoring. 

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="PreMountGrafanaHook" href="#PreMountGrafanaHook">var PreMountGrafanaHook</a>

```
searchKey: app.PreMountGrafanaHook
tags: [variable function]
```

```Go
var PreMountGrafanaHook func() error
```

PreMountGrafanaHook (if set) is invoked as a hook prior to mounting a the Grafana endpoint to the debug router. 

### <a id="allowRobotsVar" href="#allowRobotsVar">var allowRobotsVar</a>

```
searchKey: app.allowRobotsVar
tags: [variable string private]
```

```Go
var allowRobotsVar = env.Get("ROBOTS_TXT_ALLOW", "false", "allow search engines to index the site")
```

### <a id="grafanaURLFromEnv" href="#grafanaURLFromEnv">var grafanaURLFromEnv</a>

```
searchKey: app.grafanaURLFromEnv
tags: [variable string private]
```

```Go
var grafanaURLFromEnv = env.Get("GRAFANA_SERVER_URL", "", "URL at which Grafana can be reached")
```

### <a id="jaegerURLFromEnv" href="#jaegerURLFromEnv">var jaegerURLFromEnv</a>

```
searchKey: app.jaegerURLFromEnv
tags: [variable string private]
```

```Go
var jaegerURLFromEnv = env.Get("JAEGER_SERVER_URL", "", "URL at which Jaeger UI can be reached")
```

### <a id="openSearchDescription" href="#openSearchDescription">var openSearchDescription</a>

```
searchKey: app.openSearchDescription
tags: [variable struct private]
```

```Go
var openSearchDescription = ...
```

### <a id="regDriveLetter" href="#regDriveLetter">var regDriveLetter</a>

```
searchKey: app.regDriveLetter
tags: [variable struct private]
```

```Go
var regDriveLetter = lazyregexp.New("^/[a-zA-Z]:")
```

### <a id="ssoSignOutHandler" href="#ssoSignOutHandler">var ssoSignOutHandler</a>

```
searchKey: app.ssoSignOutHandler
tags: [variable function private]
```

```Go
var ssoSignOutHandler func(w http.ResponseWriter, r *http.Request)
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="SignOutURL" href="#SignOutURL">type SignOutURL struct</a>

```
searchKey: app.SignOutURL
tags: [struct]
```

```Go
type SignOutURL struct {
	ProviderDisplayName string
	ProviderServiceType string
	URL                 string
}
```

### <a id="editorOpenFileRequest" href="#editorOpenFileRequest">type editorOpenFileRequest struct</a>

```
searchKey: app.editorOpenFileRequest
tags: [struct private]
```

```Go
type editorOpenFileRequest struct {
	remoteURL         string            // Git repository remote URL.
	hostnameToPattern map[string]string // Map of Git remote URL hostnames to patterns describing how they map to Sourcegraph repositories
	branch            string            // Git branch name.
	revision          string            // Git revision.
	file              string            // Unix filepath relative to repository root.

	// Zero-based cursor selection parameters. Required.
	startRow, endRow int
	startCol, endCol int
}
```

editorSearchRequest represents parameters for "open file on Sourcegraph" editor requests. 

### <a id="editorRequest" href="#editorRequest">type editorRequest struct</a>

```
searchKey: app.editorRequest
tags: [struct private]
```

```Go
type editorRequest struct {
	// Fields that are required in all requests.
	editor  string // editor name, e.g. "Atom", "Sublime", etc.
	version string // editor extension version

	// Fields that are optional in all requests.
	utmProductName    string // Editor product name. Only present in JetBrains today (e.g. "IntelliJ", "GoLand")
	utmProductVersion string // Editor product version. Only present in JetBrains today.

	// openFileRequest is non-nil if this is an "open file on Sourcegraph" request.
	openFileRequest *editorOpenFileRequest

	// searchRequest is non-nil if this is a "search on Sourcegraph" request.
	searchRequest *editorSearchRequest
}
```

editorRequest represents the parameters to a Sourcegraph "open file", "search", etc. editor request. 

#### <a id="parseEditorRequest" href="#parseEditorRequest">func parseEditorRequest(q url.Values) (*editorRequest, error)</a>

```
searchKey: app.parseEditorRequest
tags: [method private]
```

```Go
func parseEditorRequest(q url.Values) (*editorRequest, error)
```

parseEditorRequest parses an editor request from the search query values. 

#### <a id="editorRequest.addTracking" href="#editorRequest.addTracking">func (r *editorRequest) addTracking(q url.Values)</a>

```
searchKey: app.editorRequest.addTracking
tags: [method private]
```

```Go
func (r *editorRequest) addTracking(q url.Values)
```

addTracking adds the tracking ?utm_... parameters to the given query values. 

#### <a id="editorRequest.openFileRedirect" href="#editorRequest.openFileRedirect">func (r *editorRequest) openFileRedirect(ctx context.Context) (string, error)</a>

```
searchKey: app.editorRequest.openFileRedirect
tags: [method private]
```

```Go
func (r *editorRequest) openFileRedirect(ctx context.Context) (string, error)
```

openFile returns the redirect URL for the pre-validated open-file request. 

#### <a id="editorRequest.redirectURL" href="#editorRequest.redirectURL">func (r *editorRequest) redirectURL(ctx context.Context) (string, error)</a>

```
searchKey: app.editorRequest.redirectURL
tags: [method private]
```

```Go
func (r *editorRequest) redirectURL(ctx context.Context) (string, error)
```

openFile returns the redirect URL for the pre-validated request. 

#### <a id="editorRequest.searchRedirect" href="#editorRequest.searchRedirect">func (r *editorRequest) searchRedirect(ctx context.Context) (string, error)</a>

```
searchKey: app.editorRequest.searchRedirect
tags: [method private]
```

```Go
func (r *editorRequest) searchRedirect(ctx context.Context) (string, error)
```

searchRedirect returns the redirect URL for the pre-validated search request. 

### <a id="editorSearchRequest" href="#editorSearchRequest">type editorSearchRequest struct</a>

```
searchKey: app.editorSearchRequest
tags: [struct private]
```

```Go
type editorSearchRequest struct {
	query string // The literal search query

	// Optional git repository remote URL. When present, the search will be performed just
	// in the repository (not globally).
	remoteURL         string
	hostnameToPattern map[string]string // Map of Git remote URL hostnames to patterns describing how they map to Sourcegraph repositories

	// Optional git repository branch name and revision. When one is present and remoteURL
	// is present, the search will be performed just at this branch/revision.
	branch   string
	revision string

	// Optional unix filepath relative to the repository root. When present, the search
	// will be performed with a file: search filter.
	file string
}
```

editorSearchRequest represents parameters for "search on Sourcegraph" editor requests. 

### <a id="goSymbolSpec" href="#goSymbolSpec">type goSymbolSpec struct</a>

```
searchKey: app.goSymbolSpec
tags: [struct private]
```

```Go
type goSymbolSpec struct {
	Pkg      string
	Receiver *string
	Symbol   string
}
```

#### <a id="parseGoSymbolURLPath" href="#parseGoSymbolURLPath">func parseGoSymbolURLPath(path string) (*goSymbolSpec, error)</a>

```
searchKey: app.parseGoSymbolURLPath
tags: [method private]
```

```Go
func parseGoSymbolURLPath(path string) (*goSymbolSpec, error)
```

### <a id="invalidSymbolURLPathError" href="#invalidSymbolURLPathError">type invalidSymbolURLPathError struct</a>

```
searchKey: app.invalidSymbolURLPathError
tags: [struct private]
```

```Go
type invalidSymbolURLPathError struct {
	Path string
}
```

#### <a id="invalidSymbolURLPathError.Error" href="#invalidSymbolURLPathError.Error">func (s *invalidSymbolURLPathError) Error() string</a>

```
searchKey: app.invalidSymbolURLPathError.Error
tags: [function private]
```

```Go
func (s *invalidSymbolURLPathError) Error() string
```

### <a id="stringMapFS" href="#stringMapFS">type stringMapFS struct</a>

```
searchKey: app.stringMapFS
tags: [struct private]
```

```Go
type stringMapFS struct {
	ctxvfs.FileSystem
	filenames []string
}
```

#### <a id="mapFS" href="#mapFS">func mapFS(m map[string]string) *stringMapFS</a>

```
searchKey: app.mapFS
tags: [method private]
```

```Go
func mapFS(m map[string]string) *stringMapFS
```

mapFS lets us easily instantiate a VFS with a map[string]string (which is less noisy than map[string][]byte in test fixtures). 

#### <a id="stringMapFS.ListAllFiles" href="#stringMapFS.ListAllFiles">func (fs *stringMapFS) ListAllFiles(ctx context.Context) ([]string, error)</a>

```
searchKey: app.stringMapFS.ListAllFiles
tags: [method private]
```

```Go
func (fs *stringMapFS) ListAllFiles(ctx context.Context) ([]string, error)
```

### <a id="symbolLocationArgs" href="#symbolLocationArgs">type symbolLocationArgs struct</a>

```
searchKey: app.symbolLocationArgs
tags: [struct private]
```

```Go
type symbolLocationArgs struct {
	vfs        map[string]string
	commitID   api.CommitID
	importPath string
	path       string
	receiver   *string
	symbol     string
}
```

### <a id="test" href="#test">type test struct</a>

```
searchKey: app.test
tags: [struct private]
```

```Go
type test struct {
	args symbolLocationArgs
	want *lsp.Location
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="IsAbs" href="#IsAbs">func IsAbs(path string) bool</a>

```
searchKey: app.IsAbs
tags: [method]
```

```Go
func IsAbs(path string) bool
```

IsAbs returns true if the given path is absolute 

### <a id="IsURI" href="#IsURI">func IsURI(s lsp.DocumentURI) bool</a>

```
searchKey: app.IsURI
tags: [method]
```

```Go
func IsURI(s lsp.DocumentURI) bool
```

IsURI tells if s denotes an URI 

### <a id="IsVendorDir" href="#IsVendorDir">func IsVendorDir(dir string) bool</a>

```
searchKey: app.IsVendorDir
tags: [method]
```

```Go
func IsVendorDir(dir string) bool
```

IsVendorDir tells if the specified directory is a vendor directory. 

### <a id="NewHandler" href="#NewHandler">func NewHandler(db dbutil.DB) http.Handler</a>

```
searchKey: app.NewHandler
tags: [method]
```

```Go
func NewHandler(db dbutil.DB) http.Handler
```

NewHandler returns a new app handler that uses the app router. 

🚨 SECURITY: The caller MUST wrap the returned handler in middleware that checks authentication and sets the actor in the request context. 

### <a id="Panicf" href="#Panicf">func Panicf(r interface{}, format string, v ...interface{}) error</a>

```
searchKey: app.Panicf
tags: [method]
```

```Go
func Panicf(r interface{}, format string, v ...interface{}) error
```

Panicf takes the return value of recover() and outputs data to the log with the stack trace appended. Arguments are handled in the manner of fmt.Printf. Arguments should format to a string which identifies what the panic code was doing. Returns a non-nil error if it recovered from a panic. 

### <a id="PathEqual" href="#PathEqual">func PathEqual(a, b string) bool</a>

```
searchKey: app.PathEqual
tags: [method]
```

```Go
func PathEqual(a, b string) bool
```

PathEqual returns true if both a and b are equal 

### <a id="PathHasPrefix" href="#PathHasPrefix">func PathHasPrefix(s, prefix string) bool</a>

```
searchKey: app.PathHasPrefix
tags: [method]
```

```Go
func PathHasPrefix(s, prefix string) bool
```

PathHasPrefix returns true if s is starts with the given prefix 

### <a id="PathToURI" href="#PathToURI">func PathToURI(path string) lsp.DocumentURI</a>

```
searchKey: app.PathToURI
tags: [method]
```

```Go
func PathToURI(path string) lsp.DocumentURI
```

PathToURI converts given absolute path to file URI 

### <a id="PathTrimPrefix" href="#PathTrimPrefix">func PathTrimPrefix(s, prefix string) string</a>

```
searchKey: app.PathTrimPrefix
tags: [method]
```

```Go
func PathTrimPrefix(s, prefix string) string
```

PathTrimPrefix removes the prefix from s 

### <a id="PrepareContext" href="#PrepareContext">func PrepareContext(bctx *build.Context, ctx context.Context, vfs ctxvfs.FileSystem)</a>

```
searchKey: app.PrepareContext
tags: [method]
```

```Go
func PrepareContext(bctx *build.Context, ctx context.Context, vfs ctxvfs.FileSystem)
```

### <a id="RegisterSSOSignOutHandler" href="#RegisterSSOSignOutHandler">func RegisterSSOSignOutHandler(f func(w http.ResponseWriter, r *http.Request))</a>

```
searchKey: app.RegisterSSOSignOutHandler
tags: [method]
```

```Go
func RegisterSSOSignOutHandler(f func(w http.ResponseWriter, r *http.Request))
```

RegisterSSOSignOutHandler registers a SSO sign-out handler that takes care of cleaning up SSO session state, both on Sourcegraph and on the SSO provider. This function should only be called once from an init function. 

### <a id="TestEditorRedirect" href="#TestEditorRedirect">func TestEditorRedirect(t *testing.T)</a>

```
searchKey: app.TestEditorRedirect
tags: [method private test]
```

```Go
func TestEditorRedirect(t *testing.T)
```

### <a id="TestEditorRev" href="#TestEditorRev">func TestEditorRev(t *testing.T)</a>

```
searchKey: app.TestEditorRev
tags: [method private test]
```

```Go
func TestEditorRev(t *testing.T)
```

### <a id="TestGrafanaLicensing" href="#TestGrafanaLicensing">func TestGrafanaLicensing(t *testing.T)</a>

```
searchKey: app.TestGrafanaLicensing
tags: [method private test]
```

```Go
func TestGrafanaLicensing(t *testing.T)
```

### <a id="TestLatestPingHandler" href="#TestLatestPingHandler">func TestLatestPingHandler(t *testing.T)</a>

```
searchKey: app.TestLatestPingHandler
tags: [method private test]
```

```Go
func TestLatestPingHandler(t *testing.T)
```

### <a id="TestParseGoSymbolURLPath" href="#TestParseGoSymbolURLPath">func TestParseGoSymbolURLPath(t *testing.T)</a>

```
searchKey: app.TestParseGoSymbolURLPath
tags: [method private test]
```

```Go
func TestParseGoSymbolURLPath(t *testing.T)
```

### <a id="TestRobotsTxt" href="#TestRobotsTxt">func TestRobotsTxt(t *testing.T)</a>

```
searchKey: app.TestRobotsTxt
tags: [method private test]
```

```Go
func TestRobotsTxt(t *testing.T)
```

### <a id="TestSymbolLocation" href="#TestSymbolLocation">func TestSymbolLocation(t *testing.T)</a>

```
searchKey: app.TestSymbolLocation
tags: [method private test]
```

```Go
func TestSymbolLocation(t *testing.T)
```

### <a id="TestUsageStatsArchiveHandler" href="#TestUsageStatsArchiveHandler">func TestUsageStatsArchiveHandler(t *testing.T)</a>

```
searchKey: app.TestUsageStatsArchiveHandler
tags: [method private test]
```

```Go
func TestUsageStatsArchiveHandler(t *testing.T)
```

### <a id="Test_prometheusValidator" href="#Test_prometheusValidator">func Test_prometheusValidator(t *testing.T)</a>

```
searchKey: app.Test_prometheusValidator
tags: [method private test]
```

```Go
func Test_prometheusValidator(t *testing.T)
```

### <a id="UriToPath" href="#UriToPath">func UriToPath(uri lsp.DocumentURI) string</a>

```
searchKey: app.UriToPath
tags: [method]
```

```Go
func UriToPath(uri lsp.DocumentURI) string
```

UriToPath converts given file URI to path 

### <a id="UriToRealPath" href="#UriToRealPath">func UriToRealPath(uri lsp.DocumentURI) string</a>

```
searchKey: app.UriToRealPath
tags: [method]
```

```Go
func UriToRealPath(uri lsp.DocumentURI) string
```

UriToRealPath converts the given file URI to the platform specific path 

### <a id="addDebugHandlers" href="#addDebugHandlers">func addDebugHandlers(r *mux.Router, db dbutil.DB)</a>

```
searchKey: app.addDebugHandlers
tags: [method private]
```

```Go
func addDebugHandlers(r *mux.Router, db dbutil.DB)
```

addDebugHandlers registers the reverse proxies to each services debug endpoints. 

### <a id="addGrafana" href="#addGrafana">func addGrafana(r *mux.Router, db dbutil.DB)</a>

```
searchKey: app.addGrafana
tags: [method private]
```

```Go
func addGrafana(r *mux.Router, db dbutil.DB)
```

addReverseProxyForService registers a reverse proxy for the specified service. 

### <a id="addGrafanaNotLicensedHandler" href="#addGrafanaNotLicensedHandler">func addGrafanaNotLicensedHandler(r *mux.Router, db dbutil.DB)</a>

```
searchKey: app.addGrafanaNotLicensedHandler
tags: [method private]
```

```Go
func addGrafanaNotLicensedHandler(r *mux.Router, db dbutil.DB)
```

### <a id="addJaeger" href="#addJaeger">func addJaeger(r *mux.Router, db dbutil.DB)</a>

```
searchKey: app.addJaeger
tags: [method private]
```

```Go
func addJaeger(r *mux.Router, db dbutil.DB)
```

### <a id="addNoGrafanaHandler" href="#addNoGrafanaHandler">func addNoGrafanaHandler(r *mux.Router, db dbutil.DB)</a>

```
searchKey: app.addNoGrafanaHandler
tags: [method private]
```

```Go
func addNoGrafanaHandler(r *mux.Router, db dbutil.DB)
```

### <a id="addNoJaegerHandler" href="#addNoJaegerHandler">func addNoJaegerHandler(r *mux.Router, db dbutil.DB)</a>

```
searchKey: app.addNoJaegerHandler
tags: [method private]
```

```Go
func addNoJaegerHandler(r *mux.Router, db dbutil.DB)
```

### <a id="addNoK8sClientHandler" href="#addNoK8sClientHandler">func addNoK8sClientHandler(r *mux.Router, db dbutil.DB)</a>

```
searchKey: app.addNoK8sClientHandler
tags: [method private]
```

```Go
func addNoK8sClientHandler(r *mux.Router, db dbutil.DB)
```

### <a id="adminOnly" href="#adminOnly">func adminOnly(next http.Handler, db dbutil.DB) http.Handler</a>

```
searchKey: app.adminOnly
tags: [method private]
```

```Go
func adminOnly(next http.Handler, db dbutil.DB) http.Handler
```

adminOnly is a HTTP middleware which only allows requests by admins. 

### <a id="badgeValue" href="#badgeValue">func badgeValue(r *http.Request) (int, error)</a>

```
searchKey: app.badgeValue
tags: [method private]
```

```Go
func badgeValue(r *http.Request) (int, error)
```

NOTE: Keep in sync with services/backend/httpapi/repo_shield.go 

### <a id="badgeValueFmt" href="#badgeValueFmt">func badgeValueFmt(totalRefs int) string</a>

```
searchKey: app.badgeValueFmt
tags: [method private]
```

```Go
func badgeValueFmt(totalRefs int) string
```

NOTE: Keep in sync with services/backend/httpapi/repo_shield.go 

### <a id="buildContextFromVFS" href="#buildContextFromVFS">func buildContextFromVFS(ctx context.Context, vfs ctxvfs.FileSystem) build.Context</a>

```
searchKey: app.buildContextFromVFS
tags: [method private]
```

```Go
func buildContextFromVFS(ctx context.Context, vfs ctxvfs.FileSystem) build.Context
```

### <a id="editorRev" href="#editorRev">func editorRev(ctx context.Context, repoName api.RepoName, rev string, beExplicit bool) (string, error)</a>

```
searchKey: app.editorRev
tags: [method private]
```

```Go
func editorRev(ctx context.Context, repoName api.RepoName, rev string, beExplicit bool) (string, error)
```

### <a id="favicon" href="#favicon">func favicon(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: app.favicon
tags: [method private]
```

```Go
func favicon(w http.ResponseWriter, r *http.Request)
```

### <a id="httpLogAndError" href="#httpLogAndError">func httpLogAndError(w http.ResponseWriter, msg string, code int, errArgs ...interface{})</a>

```
searchKey: app.httpLogAndError
tags: [method private]
```

```Go
func httpLogAndError(w http.ResponseWriter, msg string, code int, errArgs ...interface{})
```

### <a id="init.app_test.go" href="#init.app_test.go">func init()</a>

```
searchKey: app.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.debug.go" href="#init.debug.go">func init()</a>

```
searchKey: app.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.ping_test.go" href="#init.ping_test.go">func init()</a>

```
searchKey: app.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.usage_stats_test.go" href="#init.usage_stats_test.go">func init()</a>

```
searchKey: app.init
tags: [function private]
```

```Go
func init()
```

### <a id="isGoRepoPath" href="#isGoRepoPath">func isGoRepoPath(pkg string) bool</a>

```
searchKey: app.isGoRepoPath
tags: [method private]
```

```Go
func isGoRepoPath(pkg string) bool
```

isGoRepoPath returns whether pkg is (likely to be) a Go stdlib package import path. 

### <a id="isURI" href="#isURI">func isURI(s string) bool</a>

```
searchKey: app.isURI
tags: [method private]
```

```Go
func isURI(s string) bool
```

### <a id="latestPingHandler" href="#latestPingHandler">func latestPingHandler(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: app.latestPingHandler
tags: [method private]
```

```Go
func latestPingHandler(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)
```

latestPingHandler fetches the most recent ping data from the event log (if any is present) and returns it as JSON. 

### <a id="logSignOutEvent" href="#logSignOutEvent">func logSignOutEvent(r *http.Request, db dbutil.DB, name string)</a>

```
searchKey: app.logSignOutEvent
tags: [method private]
```

```Go
func logSignOutEvent(r *http.Request, db dbutil.DB, name string)
```

logSignOutEvent records an event into the security event log. 

### <a id="mkLocation" href="#mkLocation">func mkLocation(uri string, line, character int) *lsp.Location</a>

```
searchKey: app.mkLocation
tags: [method private]
```

```Go
func mkLocation(uri string, line, character int) *lsp.Location
```

### <a id="newPrometheusValidator" href="#newPrometheusValidator">func newPrometheusValidator(prom srcprometheus.Client, promErr error) conf.Validator</a>

```
searchKey: app.newPrometheusValidator
tags: [method private]
```

```Go
func newPrometheusValidator(prom srcprometheus.Client, promErr error) conf.Validator
```

newPrometheusValidator renders problems with the Prometheus deployment and relevant site configuration as reported by `prom-wrapper` inside the `sourcegraph/prometheus` container if Prometheus is enabled. 

It also accepts the error from creating `srcprometheus.Client` as an parameter, to validate Prometheus configuration. 

### <a id="normalizePath" href="#normalizePath">func normalizePath(s string) string</a>

```
searchKey: app.normalizePath
tags: [method private]
```

```Go
func normalizePath(s string) string
```

### <a id="openSearch" href="#openSearch">func openSearch(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: app.openSearch
tags: [method private]
```

```Go
func openSearch(w http.ResponseWriter, r *http.Request)
```

### <a id="parseFiles" href="#parseFiles">func parseFiles(fset *token.FileSet, bctx *build.Context, importPath, srcDir string) (*ast.Package, error)</a>

```
searchKey: app.parseFiles
tags: [method private]
```

```Go
func parseFiles(fset *token.FileSet, bctx *build.Context, importPath, srcDir string) (*ast.Package, error)
```

### <a id="repoVFS" href="#repoVFS">func repoVFS(ctx context.Context, name api.RepoName, rev api.CommitID) (ctxvfs.FileSystem, error)</a>

```
searchKey: app.repoVFS
tags: [method private]
```

```Go
func repoVFS(ctx context.Context, name api.RepoName, rev api.CommitID) (ctxvfs.FileSystem, error)
```

### <a id="robotsTxt" href="#robotsTxt">func robotsTxt(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: app.robotsTxt
tags: [method private]
```

```Go
func robotsTxt(w http.ResponseWriter, r *http.Request)
```

### <a id="robotsTxtHelper" href="#robotsTxtHelper">func robotsTxtHelper(w io.Writer, allowRobots bool)</a>

```
searchKey: app.robotsTxtHelper
tags: [method private]
```

```Go
func robotsTxtHelper(w io.Writer, allowRobots bool)
```

### <a id="serveEditor" href="#serveEditor">func serveEditor(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: app.serveEditor
tags: [method private]
```

```Go
func serveEditor(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveGDDORefs" href="#serveGDDORefs">func serveGDDORefs(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: app.serveGDDORefs
tags: [method private]
```

```Go
func serveGDDORefs(w http.ResponseWriter, r *http.Request) error
```

serveGDDORefs handles requests referred from godoc.org refs links. 

### <a id="serveGoSymbolURL" href="#serveGoSymbolURL">func serveGoSymbolURL(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: app.serveGoSymbolURL
tags: [method private]
```

```Go
func serveGoSymbolURL(w http.ResponseWriter, r *http.Request) error
```

serveGoSymbolURL handles Go symbol URLs (e.g., [https://sourcegraph.com/go/github.com/gorilla/mux/-/Vars](https://sourcegraph.com/go/github.com/gorilla/mux/-/Vars)) by redirecting them to the file and line/column URL of the definition. 

### <a id="serveRepoBadge" href="#serveRepoBadge">func serveRepoBadge(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: app.serveRepoBadge
tags: [method private]
```

```Go
func serveRepoBadge(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveSignOutHandler" href="#serveSignOutHandler">func serveSignOutHandler(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: app.serveSignOutHandler
tags: [method private]
```

```Go
func serveSignOutHandler(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)
```

### <a id="serveVerifyEmail" href="#serveVerifyEmail">func serveVerifyEmail(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: app.serveVerifyEmail
tags: [method private]
```

```Go
func serveVerifyEmail(w http.ResponseWriter, r *http.Request)
```

### <a id="strptr" href="#strptr">func strptr(s string) *string</a>

```
searchKey: app.strptr
tags: [method private]
```

```Go
func strptr(s string) *string
```

### <a id="symbolLocation" href="#symbolLocation">func symbolLocation(ctx context.Context, vfs ctxvfs.FileSystem, commitID api.CommitID, symbolSpec *goSymbolSpec, pkgPath string) (*lsp.Location, error)</a>

```
searchKey: app.symbolLocation
tags: [method private]
```

```Go
func symbolLocation(ctx context.Context, vfs ctxvfs.FileSystem, commitID api.CommitID, symbolSpec *goSymbolSpec, pkgPath string) (*lsp.Location, error)
```

### <a id="trimFilePrefix" href="#trimFilePrefix">func trimFilePrefix(s string) string</a>

```
searchKey: app.trimFilePrefix
tags: [method private]
```

```Go
func trimFilePrefix(s string) string
```

### <a id="usageStatsArchiveHandler" href="#usageStatsArchiveHandler">func usageStatsArchiveHandler(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: app.usageStatsArchiveHandler
tags: [method private]
```

```Go
func usageStatsArchiveHandler(db dbutil.DB) func(w http.ResponseWriter, r *http.Request)
```

