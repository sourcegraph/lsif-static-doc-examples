# Package ui

Package ui handles server-side rendering of the Sourcegraph web app. 

### hdr-DevelopmentDevelopment
To develop, simply update the template files in cmd/frontend/internal/app/ui/... and reload the page (the templates will be automatically reloaded). 

### hdr-Testing_the_error_pageTesting the error page
Testing out the layout/styling of the error page that is used to handle internal server errors, 404s, etc. is very easy by visiting: 

```
[http://localhost:3080/__errorTest?nodebug=true&error=theerror&status=500](http://localhost:3080/__errorTest?nodebug=true&error=theerror&status=500)

```
The parameters are as follows: 

```
nodebug=true -- hides error messages (which is ALWAYS the case in production)
error=theerror -- controls the error message text
status=500 -- controls the status code

```
## Index

* Subpages
  * [cmd/frontend/internal/app/ui/router](ui/router.md)
* [Constants](#const)
    * [const aboutRedirectHost](#aboutRedirectHost)
    * [const aboutRedirectScheme](#aboutRedirectScheme)
    * [const routeAPIConsole](#routeAPIConsole)
    * [const routeAboutSubdomain](#routeAboutSubdomain)
    * [const routeBatchChanges](#routeBatchChanges)
    * [const routeBlob](#routeBlob)
    * [const routeCncf](#routeCncf)
    * [const routeCodeMonitoring](#routeCodeMonitoring)
    * [const routeContexts](#routeContexts)
    * [const routeDevToolTime](#routeDevToolTime)
    * [const routeExtensions](#routeExtensions)
    * [const routeHelp](#routeHelp)
    * [const routeHome](#routeHome)
    * [const routeInsights](#routeInsights)
    * [const routeLegacyCampaigns](#routeLegacyCampaigns)
    * [const routeLegacyCareers](#routeLegacyCareers)
    * [const routeLegacyDefLanding](#routeLegacyDefLanding)
    * [const routeLegacyDefRedirectToDefLanding](#routeLegacyDefRedirectToDefLanding)
    * [const routeLegacyLogin](#routeLegacyLogin)
    * [const routeLegacyOldRouteDefLanding](#routeLegacyOldRouteDefLanding)
    * [const routeLegacyRepoLanding](#routeLegacyRepoLanding)
    * [const routeOrganizations](#routeOrganizations)
    * [const routeRaw](#routeRaw)
    * [const routeRegistry](#routeRegistry)
    * [const routeRepo](#routeRepo)
    * [const routeRepoBranches](#routeRepoBranches)
    * [const routeRepoCommit](#routeRepoCommit)
    * [const routeRepoCommits](#routeRepoCommits)
    * [const routeRepoCompare](#routeRepoCompare)
    * [const routeRepoDocs](#routeRepoDocs)
    * [const routeRepoGroups](#routeRepoGroups)
    * [const routeRepoSettings](#routeRepoSettings)
    * [const routeRepoStats](#routeRepoStats)
    * [const routeRepoTags](#routeRepoTags)
    * [const routeSearch](#routeSearch)
    * [const routeSearchBadge](#routeSearchBadge)
    * [const routeSearchConsole](#routeSearchConsole)
    * [const routeSearchQueryBuilder](#routeSearchQueryBuilder)
    * [const routeSearchStream](#routeSearchStream)
    * [const routeSettings](#routeSettings)
    * [const routeSiteAdmin](#routeSiteAdmin)
    * [const routeSnippets](#routeSnippets)
    * [const routeStats](#routeStats)
    * [const routeSubscriptions](#routeSubscriptions)
    * [const routeSurvey](#routeSurvey)
    * [const routeSurveyScore](#routeSurveyScore)
    * [const routeThreads](#routeThreads)
    * [const routeTree](#routeTree)
    * [const routeUser](#routeUser)
    * [const routeUserRedirect](#routeUserRedirect)
    * [const routeUserSettings](#routeUserSettings)
    * [const routeViews](#routeViews)
* [Variables](#var)
    * [var aboutRedirects](#aboutRedirects)
    * [var appHTML](#appHTML)
    * [var errorHTML](#errorHTML)
    * [var funcMap](#funcMap)
    * [var goSymbolReg](#goSymbolReg)
    * [var legacyDefLandingCounter](#legacyDefLandingCounter)
    * [var legacyRepoLandingCounter](#legacyRepoLandingCounter)
    * [var loadTemplateCache](#loadTemplateCache)
    * [var loadTemplateMu](#loadTemplateMu)
    * [var metricRawArchiveRunning](#metricRawArchiveRunning)
    * [var metricRawDuration](#metricRawDuration)
    * [var mockNewCommon](#mockNewCommon)
    * [var mockServeRepo](#mockServeRepo)
    * [var multiLineRangeRegexp](#multiLineRangeRegexp)
    * [var noAssetVersionString](#noAssetVersionString)
    * [var singleLineRegexp](#singleLineRegexp)
    * [var versionCache](#versionCache)
    * [var versionCacheMu](#versionCacheMu)
    * [var webpackDevServer](#webpackDevServer)
* [Types](#type)
    * [type Common struct](#Common)
        * [func newCommon(w http.ResponseWriter, r *http.Request, title string, serveError serveErrorHandler) (*Common, error)](#newCommon)
    * [type InjectedHTML struct](#InjectedHTML)
    * [type Metadata struct](#Metadata)
    * [type handlerFunc func(w net/http.ResponseWriter, r *net/http.Request) error](#handlerFunc)
        * [func serveBasicPage(title func(c *Common, r *http.Request) string, description *string) handlerFunc](#serveBasicPage)
        * [func serveBrandedPageString(titles string, description *string) handlerFunc](#serveBrandedPageString)
        * [func serveRepoOrBlob(routeName string, title func(c *Common, r *http.Request) string) handlerFunc](#serveRepoOrBlob)
        * [func serveTree(title func(c *Common, r *http.Request) string) handlerFunc](#serveTree)
    * [type lineRange struct](#lineRange)
        * [func findLineRangeInQueryParameters(queryParameters map[string][]string) *lineRange](#findLineRangeInQueryParameters)
        * [func getLineRange(value string) *lineRange](#getLineRange)
    * [type pageError struct](#pageError)
    * [type recoverError struct](#recoverError)
        * [func (r recoverError) Error() string](#recoverError.Error)
    * [type serveErrorHandler func(w net/http.ResponseWriter, r *net/http.Request, err error, statusCode int)](#serveErrorHandler)
* [Functions](#func)
    * [func InitRouter(db dbutil.DB)](#InitRouter)
    * [func Router() *mux.Router](#Router)
    * [func TestFindLineRangeInQueryParameters(t *testing.T)](#TestFindLineRangeInQueryParameters)
    * [func TestGetBlobPreviewImageURL(t *testing.T)](#TestGetBlobPreviewImageURL)
    * [func TestGetBlobPreviewTitle(t *testing.T)](#TestGetBlobPreviewTitle)
    * [func TestLoadTemplate(t *testing.T)](#TestLoadTemplate)
    * [func TestNewCommon_repo_error(t *testing.T)](#TestNewCommon_repo_error)
    * [func TestRedirectTreeOrBlob(t *testing.T)](#TestRedirectTreeOrBlob)
    * [func TestRedirects(t *testing.T)](#TestRedirects)
    * [func TestRepoShortName(t *testing.T)](#TestRepoShortName)
    * [func TestRouter(t *testing.T)](#TestRouter)
    * [func TestRouter_RootPath(t *testing.T)](#TestRouter_RootPath)
    * [func TestServeHelp(t *testing.T)](#TestServeHelp)
    * [func Test_serveRawWithContentArchive(t *testing.T)](#Test_serveRawWithContentArchive)
    * [func Test_serveRawWithContentTypePlain(t *testing.T)](#Test_serveRawWithContentTypePlain)
    * [func Test_serveRawWithHTTPRequestMethodHEAD(t *testing.T)](#Test_serveRawWithHTTPRequestMethodHEAD)
    * [func brandNameSubtitle(titles ...string) string](#brandNameSubtitle)
    * [func dangerouslyServeError(w http.ResponseWriter, r *http.Request, err error, statusCode int)](#dangerouslyServeError)
    * [func doLoadTemplate(path string) (*template.Template, error)](#doLoadTemplate)
    * [func formatLineRange(lineRange *lineRange) string](#formatLineRange)
    * [func getBlobPreviewImageURL(previewServiceURL string, blobURLPath string, lineRange *lineRange) string](#getBlobPreviewImageURL)
    * [func getBlobPreviewTitle(blobFilePath string, lineRange *lineRange) string](#getBlobPreviewTitle)
    * [func handler(f func(w http.ResponseWriter, r *http.Request) error) http.Handler](#handler)
    * [func init()](#init.handlers_test.go)
    * [func init()](#init.router_test.go)
    * [func initHTTPTestGitServer(t *testing.T, httpStatusCode int, resp string)](#initHTTPTestGitServer)
    * [func initRouter(db dbutil.DB, router *mux.Router)](#initRouter)
    * [func limitString(s string, n int, ellipsis bool) string](#limitString)
    * [func loadTemplate(path string) (*template.Template, error)](#loadTemplate)
    * [func mapKeys(m map[string]string) (keys []string)](#mapKeys)
    * [func newRouter() *mux.Router](#newRouter)
    * [func openArchiveReader(ctx context.Context, opts vfsutil.ArchiveOpts) (io.ReadCloser, error)](#openArchiveReader)
    * [func redirectTreeOrBlob(routeName, path string, common *Common, w http.ResponseWriter, r *http.Request) (requestHandled bool, err error)](#redirectTreeOrBlob)
    * [func renderTemplate(w http.ResponseWriter, name string, data interface{}) error](#renderTemplate)
    * [func repoShortName(name api.RepoName) string](#repoShortName)
    * [func searchBadgeHandler() *httputil.ReverseProxy](#searchBadgeHandler)
    * [func serveDefLanding(w http.ResponseWriter, r *http.Request) (err error)](#serveDefLanding)
    * [func serveDefRedirectToDefLanding(w http.ResponseWriter, r *http.Request)](#serveDefRedirectToDefLanding)
    * [func serveError(w http.ResponseWriter, r *http.Request, err error, statusCode int)](#serveError)
    * [func serveErrorNoDebug(w http.ResponseWriter, r *http.Request, err error, statusCode int, nodebug, forceServeError bool)](#serveErrorNoDebug)
    * [func serveErrorTest(w http.ResponseWriter, r *http.Request) error](#serveErrorTest)
    * [func serveHelp(w http.ResponseWriter, r *http.Request)](#serveHelp)
    * [func serveHome(w http.ResponseWriter, r *http.Request) error](#serveHome)
    * [func serveOldRouteDefLanding(w http.ResponseWriter, r *http.Request)](#serveOldRouteDefLanding)
    * [func servePingFromSelfHosted(w http.ResponseWriter, r *http.Request) error](#servePingFromSelfHosted)
    * [func serveRaw(w http.ResponseWriter, r *http.Request) (err error)](#serveRaw)
    * [func serveRepoLanding(w http.ResponseWriter, r *http.Request) error](#serveRepoLanding)
    * [func serveSignIn(w http.ResponseWriter, r *http.Request) error](#serveSignIn)
    * [func staticRedirectHandler(u string, code int) http.Handler](#staticRedirectHandler)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="aboutRedirectHost" href="#aboutRedirectHost">const aboutRedirectHost</a>

```
searchKey: ui.aboutRedirectHost
tags: [constant string private]
```

```Go
const aboutRedirectHost = "about.sourcegraph.com"
```

### <a id="aboutRedirectScheme" href="#aboutRedirectScheme">const aboutRedirectScheme</a>

```
searchKey: ui.aboutRedirectScheme
tags: [constant string private]
```

```Go
const aboutRedirectScheme = "https"
```

### <a id="routeAPIConsole" href="#routeAPIConsole">const routeAPIConsole</a>

```
searchKey: ui.routeAPIConsole
tags: [constant string private]
```

```Go
const routeAPIConsole = "api-console"
```

### <a id="routeAboutSubdomain" href="#routeAboutSubdomain">const routeAboutSubdomain</a>

```
searchKey: ui.routeAboutSubdomain
tags: [constant string private]
```

```Go
const routeAboutSubdomain = "about-subdomain"
```

### <a id="routeBatchChanges" href="#routeBatchChanges">const routeBatchChanges</a>

```
searchKey: ui.routeBatchChanges
tags: [constant string private]
```

```Go
const routeBatchChanges = "batch-changes"
```

### <a id="routeBlob" href="#routeBlob">const routeBlob</a>

```
searchKey: ui.routeBlob
tags: [constant string private]
```

```Go
const routeBlob = "blob"
```

### <a id="routeCncf" href="#routeCncf">const routeCncf</a>

```
searchKey: ui.routeCncf
tags: [constant string private]
```

```Go
const routeCncf = "repo-groups.cncf"
```

### <a id="routeCodeMonitoring" href="#routeCodeMonitoring">const routeCodeMonitoring</a>

```
searchKey: ui.routeCodeMonitoring
tags: [constant string private]
```

```Go
const routeCodeMonitoring = "code-monitoring"
```

### <a id="routeContexts" href="#routeContexts">const routeContexts</a>

```
searchKey: ui.routeContexts
tags: [constant string private]
```

```Go
const routeContexts = "contexts"
```

### <a id="routeDevToolTime" href="#routeDevToolTime">const routeDevToolTime</a>

```
searchKey: ui.routeDevToolTime
tags: [constant string private]
```

```Go
const routeDevToolTime = "devtooltime"
```

### <a id="routeExtensions" href="#routeExtensions">const routeExtensions</a>

```
searchKey: ui.routeExtensions
tags: [constant string private]
```

```Go
const routeExtensions = "extensions"
```

### <a id="routeHelp" href="#routeHelp">const routeHelp</a>

```
searchKey: ui.routeHelp
tags: [constant string private]
```

```Go
const routeHelp = "help"
```

### <a id="routeHome" href="#routeHome">const routeHome</a>

```
searchKey: ui.routeHome
tags: [constant string private]
```

```Go
const routeHome = "home"
```

### <a id="routeInsights" href="#routeInsights">const routeInsights</a>

```
searchKey: ui.routeInsights
tags: [constant string private]
```

```Go
const routeInsights = "insights"
```

### <a id="routeLegacyCampaigns" href="#routeLegacyCampaigns">const routeLegacyCampaigns</a>

```
searchKey: ui.routeLegacyCampaigns
tags: [constant string private]
```

```Go
const routeLegacyCampaigns = "campaigns"
```

### <a id="routeLegacyCareers" href="#routeLegacyCareers">const routeLegacyCareers</a>

```
searchKey: ui.routeLegacyCareers
tags: [constant string private]
```

```Go
const routeLegacyCareers = "careers"
```

### <a id="routeLegacyDefLanding" href="#routeLegacyDefLanding">const routeLegacyDefLanding</a>

```
searchKey: ui.routeLegacyDefLanding
tags: [constant string private]
```

```Go
const routeLegacyDefLanding = "page.def.landing"
```

### <a id="routeLegacyDefRedirectToDefLanding" href="#routeLegacyDefRedirectToDefLanding">const routeLegacyDefRedirectToDefLanding</a>

```
searchKey: ui.routeLegacyDefRedirectToDefLanding
tags: [constant string private]
```

```Go
const routeLegacyDefRedirectToDefLanding = "page.def.redirect"
```

### <a id="routeLegacyLogin" href="#routeLegacyLogin">const routeLegacyLogin</a>

```
searchKey: ui.routeLegacyLogin
tags: [constant string private]
```

```Go
const routeLegacyLogin = "login"
```

Legacy redirects 

### <a id="routeLegacyOldRouteDefLanding" href="#routeLegacyOldRouteDefLanding">const routeLegacyOldRouteDefLanding</a>

```
searchKey: ui.routeLegacyOldRouteDefLanding
tags: [constant string private]
```

```Go
const routeLegacyOldRouteDefLanding = "page.def.landing.old"
```

### <a id="routeLegacyRepoLanding" href="#routeLegacyRepoLanding">const routeLegacyRepoLanding</a>

```
searchKey: ui.routeLegacyRepoLanding
tags: [constant string private]
```

```Go
const routeLegacyRepoLanding = "page.repo.landing"
```

### <a id="routeOrganizations" href="#routeOrganizations">const routeOrganizations</a>

```
searchKey: ui.routeOrganizations
tags: [constant string private]
```

```Go
const routeOrganizations = "org"
```

### <a id="routeRaw" href="#routeRaw">const routeRaw</a>

```
searchKey: ui.routeRaw
tags: [constant string private]
```

```Go
const routeRaw = "raw"
```

### <a id="routeRegistry" href="#routeRegistry">const routeRegistry</a>

```
searchKey: ui.routeRegistry
tags: [constant string private]
```

```Go
const routeRegistry = "registry"
```

### <a id="routeRepo" href="#routeRepo">const routeRepo</a>

```
searchKey: ui.routeRepo
tags: [constant string private]
```

```Go
const routeRepo = "repo"
```

### <a id="routeRepoBranches" href="#routeRepoBranches">const routeRepoBranches</a>

```
searchKey: ui.routeRepoBranches
tags: [constant string private]
```

```Go
const routeRepoBranches = "repo-branches"
```

### <a id="routeRepoCommit" href="#routeRepoCommit">const routeRepoCommit</a>

```
searchKey: ui.routeRepoCommit
tags: [constant string private]
```

```Go
const routeRepoCommit = "repo-commit"
```

### <a id="routeRepoCommits" href="#routeRepoCommits">const routeRepoCommits</a>

```
searchKey: ui.routeRepoCommits
tags: [constant string private]
```

```Go
const routeRepoCommits = "repo-commits"
```

### <a id="routeRepoCompare" href="#routeRepoCompare">const routeRepoCompare</a>

```
searchKey: ui.routeRepoCompare
tags: [constant string private]
```

```Go
const routeRepoCompare = "repo-compare"
```

### <a id="routeRepoDocs" href="#routeRepoDocs">const routeRepoDocs</a>

```
searchKey: ui.routeRepoDocs
tags: [constant string private]
```

```Go
const routeRepoDocs = "repo-docs"
```

### <a id="routeRepoGroups" href="#routeRepoGroups">const routeRepoGroups</a>

```
searchKey: ui.routeRepoGroups
tags: [constant string private]
```

```Go
const routeRepoGroups = "repo-groups"
```

### <a id="routeRepoSettings" href="#routeRepoSettings">const routeRepoSettings</a>

```
searchKey: ui.routeRepoSettings
tags: [constant string private]
```

```Go
const routeRepoSettings = "repo-settings"
```

### <a id="routeRepoStats" href="#routeRepoStats">const routeRepoStats</a>

```
searchKey: ui.routeRepoStats
tags: [constant string private]
```

```Go
const routeRepoStats = "repo-stats"
```

### <a id="routeRepoTags" href="#routeRepoTags">const routeRepoTags</a>

```
searchKey: ui.routeRepoTags
tags: [constant string private]
```

```Go
const routeRepoTags = "repo-tags"
```

### <a id="routeSearch" href="#routeSearch">const routeSearch</a>

```
searchKey: ui.routeSearch
tags: [constant string private]
```

```Go
const routeSearch = "search"
```

### <a id="routeSearchBadge" href="#routeSearchBadge">const routeSearchBadge</a>

```
searchKey: ui.routeSearchBadge
tags: [constant string private]
```

```Go
const routeSearchBadge = "search-badge"
```

### <a id="routeSearchConsole" href="#routeSearchConsole">const routeSearchConsole</a>

```
searchKey: ui.routeSearchConsole
tags: [constant string private]
```

```Go
const routeSearchConsole = "search.console"
```

### <a id="routeSearchQueryBuilder" href="#routeSearchQueryBuilder">const routeSearchQueryBuilder</a>

```
searchKey: ui.routeSearchQueryBuilder
tags: [constant string private]
```

```Go
const routeSearchQueryBuilder = "search.query-builder"
```

### <a id="routeSearchStream" href="#routeSearchStream">const routeSearchStream</a>

```
searchKey: ui.routeSearchStream
tags: [constant string private]
```

```Go
const routeSearchStream = "search.stream"
```

### <a id="routeSettings" href="#routeSettings">const routeSettings</a>

```
searchKey: ui.routeSettings
tags: [constant string private]
```

```Go
const routeSettings = "settings"
```

### <a id="routeSiteAdmin" href="#routeSiteAdmin">const routeSiteAdmin</a>

```
searchKey: ui.routeSiteAdmin
tags: [constant string private]
```

```Go
const routeSiteAdmin = "site-admin"
```

### <a id="routeSnippets" href="#routeSnippets">const routeSnippets</a>

```
searchKey: ui.routeSnippets
tags: [constant string private]
```

```Go
const routeSnippets = "snippets"
```

### <a id="routeStats" href="#routeStats">const routeStats</a>

```
searchKey: ui.routeStats
tags: [constant string private]
```

```Go
const routeStats = "stats"
```

### <a id="routeSubscriptions" href="#routeSubscriptions">const routeSubscriptions</a>

```
searchKey: ui.routeSubscriptions
tags: [constant string private]
```

```Go
const routeSubscriptions = "subscriptions"
```

### <a id="routeSurvey" href="#routeSurvey">const routeSurvey</a>

```
searchKey: ui.routeSurvey
tags: [constant string private]
```

```Go
const routeSurvey = "survey"
```

### <a id="routeSurveyScore" href="#routeSurveyScore">const routeSurveyScore</a>

```
searchKey: ui.routeSurveyScore
tags: [constant string private]
```

```Go
const routeSurveyScore = "survey-score"
```

### <a id="routeThreads" href="#routeThreads">const routeThreads</a>

```
searchKey: ui.routeThreads
tags: [constant string private]
```

```Go
const routeThreads = "threads"
```

### <a id="routeTree" href="#routeTree">const routeTree</a>

```
searchKey: ui.routeTree
tags: [constant string private]
```

```Go
const routeTree = "tree"
```

### <a id="routeUser" href="#routeUser">const routeUser</a>

```
searchKey: ui.routeUser
tags: [constant string private]
```

```Go
const routeUser = "user"
```

### <a id="routeUserRedirect" href="#routeUserRedirect">const routeUserRedirect</a>

```
searchKey: ui.routeUserRedirect
tags: [constant string private]
```

```Go
const routeUserRedirect = "user-redirect"
```

### <a id="routeUserSettings" href="#routeUserSettings">const routeUserSettings</a>

```
searchKey: ui.routeUserSettings
tags: [constant string private]
```

```Go
const routeUserSettings = "user-settings"
```

### <a id="routeViews" href="#routeViews">const routeViews</a>

```
searchKey: ui.routeViews
tags: [constant string private]
```

```Go
const routeViews = "views"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="aboutRedirects" href="#aboutRedirects">var aboutRedirects</a>

```
searchKey: ui.aboutRedirects
tags: [variable object private]
```

```Go
var aboutRedirects = ...
```

aboutRedirects contains map entries, each of which indicates that sourcegraph.com/$KEY should redirect to about.sourcegraph.com/$VALUE. 

### <a id="appHTML" href="#appHTML">var appHTML</a>

```
searchKey: ui.appHTML
tags: [variable string private]
```

```Go
var appHTML string
```

### <a id="errorHTML" href="#errorHTML">var errorHTML</a>

```
searchKey: ui.errorHTML
tags: [variable string private]
```

```Go
var errorHTML string
```

### <a id="funcMap" href="#funcMap">var funcMap</a>

```
searchKey: ui.funcMap
tags: [variable object private]
```

```Go
var funcMap = ...
```

Functions that are exposed to templates. 

### <a id="goSymbolReg" href="#goSymbolReg">var goSymbolReg</a>

```
searchKey: ui.goSymbolReg
tags: [variable struct private]
```

```Go
var goSymbolReg = lazyregexp.New("/info/GoPackage/(.+)$")
```

### <a id="legacyDefLandingCounter" href="#legacyDefLandingCounter">var legacyDefLandingCounter</a>

```
searchKey: ui.legacyDefLandingCounter
tags: [variable interface private]
```

```Go
var legacyDefLandingCounter = ...
```

### <a id="legacyRepoLandingCounter" href="#legacyRepoLandingCounter">var legacyRepoLandingCounter</a>

```
searchKey: ui.legacyRepoLandingCounter
tags: [variable interface private]
```

```Go
var legacyRepoLandingCounter = ...
```

### <a id="loadTemplateCache" href="#loadTemplateCache">var loadTemplateCache</a>

```
searchKey: ui.loadTemplateCache
tags: [variable object private]
```

```Go
var loadTemplateCache = map[string]*template.Template{}
```

### <a id="loadTemplateMu" href="#loadTemplateMu">var loadTemplateMu</a>

```
searchKey: ui.loadTemplateMu
tags: [variable struct private]
```

```Go
var loadTemplateMu sync.RWMutex
```

### <a id="metricRawArchiveRunning" href="#metricRawArchiveRunning">var metricRawArchiveRunning</a>

```
searchKey: ui.metricRawArchiveRunning
tags: [variable struct private]
```

```Go
var metricRawArchiveRunning = ...
```

### <a id="metricRawDuration" href="#metricRawDuration">var metricRawDuration</a>

```
searchKey: ui.metricRawDuration
tags: [variable struct private]
```

```Go
var metricRawDuration = ...
```

### <a id="mockNewCommon" href="#mockNewCommon">var mockNewCommon</a>

```
searchKey: ui.mockNewCommon
tags: [variable function private]
```

```Go
var mockNewCommon func(w http.ResponseWriter, r *http.Request, title string, serveError serveErrorHandler) (*Common, error) = ...
```

mockNewCommon is used in tests to mock newCommon (duh!). 

Ensure that the mock is reset at the end of every test by adding a call like the following: 

```
defer func() {
	mockNewCommon = nil
}()

```
### <a id="mockServeRepo" href="#mockServeRepo">var mockServeRepo</a>

```
searchKey: ui.mockServeRepo
tags: [variable function private]
```

```Go
var mockServeRepo func(w http.ResponseWriter, r *http.Request)
```

### <a id="multiLineRangeRegexp" href="#multiLineRangeRegexp">var multiLineRangeRegexp</a>

```
searchKey: ui.multiLineRangeRegexp
tags: [variable struct private]
```

```Go
var multiLineRangeRegexp = lazyregexp.New(`^L(\d+)(?::\d+)?-(\d+)(?::\d+)?$`)
```

### <a id="noAssetVersionString" href="#noAssetVersionString">var noAssetVersionString</a>

```
searchKey: ui.noAssetVersionString
tags: [variable boolean private]
```

```Go
var _, noAssetVersionString = os.LookupEnv("WEBPACK_DEV_SERVER")
```

### <a id="singleLineRegexp" href="#singleLineRegexp">var singleLineRegexp</a>

```
searchKey: ui.singleLineRegexp
tags: [variable struct private]
```

```Go
var singleLineRegexp = lazyregexp.New(`^L(\d+)(?::\d+)?$`)
```

### <a id="versionCache" href="#versionCache">var versionCache</a>

```
searchKey: ui.versionCache
tags: [variable object private]
```

```Go
var versionCache = make(map[string]string)
```

### <a id="versionCacheMu" href="#versionCacheMu">var versionCacheMu</a>

```
searchKey: ui.versionCacheMu
tags: [variable struct private]
```

```Go
var versionCacheMu sync.RWMutex
```

### <a id="webpackDevServer" href="#webpackDevServer">var webpackDevServer</a>

```
searchKey: ui.webpackDevServer
tags: [variable boolean private]
```

```Go
var webpackDevServer, _ = strconv.ParseBool(os.Getenv("WEBPACK_DEV_SERVER"))
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Common" href="#Common">type Common struct</a>

```
searchKey: ui.Common
tags: [struct]
```

```Go
type Common struct {
	Injected InjectedHTML
	Metadata *Metadata
	Context  jscontext.JSContext
	Title    string
	Error    *pageError

	Manifest *assets.WebpackManifest

	WebpackDevServer bool // whether the Webpack dev server is running (WEBPACK_DEV_SERVER env var)

	// The fields below have zero values when not on a repo page.
	Repo         *types.Repo
	Rev          string // unresolved / user-specified revision (e.x.: "@master")
	api.CommitID        // resolved SHA1 revision
}
```

#### <a id="newCommon" href="#newCommon">func newCommon(w http.ResponseWriter, r *http.Request, title string, serveError serveErrorHandler) (*Common, error)</a>

```
searchKey: ui.newCommon
tags: [method private]
```

```Go
func newCommon(w http.ResponseWriter, r *http.Request, title string, serveError serveErrorHandler) (*Common, error)
```

newCommon builds a *Common data structure, returning an error if one occurs. 

In the event of the repository having been renamed, the request is handled by newCommon and nil, nil is returned. Basic usage looks like: 

```
common, err := newCommon(w, r, serveError)
if err != nil {
	return err
}
if common == nil {
	return nil // request was handled
}

```
In the case of a repository that is cloning, a Common data structure is returned but it has an incomplete RevSpec. 

### <a id="InjectedHTML" href="#InjectedHTML">type InjectedHTML struct</a>

```
searchKey: ui.InjectedHTML
tags: [struct]
```

```Go
type InjectedHTML struct {
	HeadTop    template.HTML
	HeadBottom template.HTML
	BodyTop    template.HTML
	BodyBottom template.HTML
}
```

### <a id="Metadata" href="#Metadata">type Metadata struct</a>

```
searchKey: ui.Metadata
tags: [struct]
```

```Go
type Metadata struct {
	// Title is the title of the page for Twitter cards, OpenGraph, etc.
	// e.g. "Open in Sourcegraph"
	Title string

	// Description is the description of the page for Twitter cards, OpenGraph,
	// etc. e.g. "View this link in Sourcegraph Editor."
	Description string

	// ShowPreview controls whether or not OpenGraph/Twitter card/etc metadata is rendered.
	ShowPreview bool

	// PreviewImage contains the URL of the preview image for relevant routes (e.g. blob).
	PreviewImage string
}
```

### <a id="handlerFunc" href="#handlerFunc">type handlerFunc func(w net/http.ResponseWriter, r *net/http.Request) error</a>

```
searchKey: ui.handlerFunc
tags: [function private]
```

```Go
type handlerFunc func(w http.ResponseWriter, r *http.Request) error
```

#### <a id="serveBasicPage" href="#serveBasicPage">func serveBasicPage(title func(c *Common, r *http.Request) string, description *string) handlerFunc</a>

```
searchKey: ui.serveBasicPage
tags: [method private]
```

```Go
func serveBasicPage(title func(c *Common, r *http.Request) string, description *string) handlerFunc
```

#### <a id="serveBrandedPageString" href="#serveBrandedPageString">func serveBrandedPageString(titles string, description *string) handlerFunc</a>

```
searchKey: ui.serveBrandedPageString
tags: [method private]
```

```Go
func serveBrandedPageString(titles string, description *string) handlerFunc
```

#### <a id="serveRepoOrBlob" href="#serveRepoOrBlob">func serveRepoOrBlob(routeName string, title func(c *Common, r *http.Request) string) handlerFunc</a>

```
searchKey: ui.serveRepoOrBlob
tags: [method private]
```

```Go
func serveRepoOrBlob(routeName string, title func(c *Common, r *http.Request) string) handlerFunc
```

#### <a id="serveTree" href="#serveTree">func serveTree(title func(c *Common, r *http.Request) string) handlerFunc</a>

```
searchKey: ui.serveTree
tags: [method private]
```

```Go
func serveTree(title func(c *Common, r *http.Request) string) handlerFunc
```

serveTree serves the tree (directory) pages. 

### <a id="lineRange" href="#lineRange">type lineRange struct</a>

```
searchKey: ui.lineRange
tags: [struct private]
```

```Go
type lineRange struct {
	StartLine int
	EndLine   int
}
```

#### <a id="findLineRangeInQueryParameters" href="#findLineRangeInQueryParameters">func findLineRangeInQueryParameters(queryParameters map[string][]string) *lineRange</a>

```
searchKey: ui.findLineRangeInQueryParameters
tags: [method private]
```

```Go
func findLineRangeInQueryParameters(queryParameters map[string][]string) *lineRange
```

#### <a id="getLineRange" href="#getLineRange">func getLineRange(value string) *lineRange</a>

```
searchKey: ui.getLineRange
tags: [method private]
```

```Go
func getLineRange(value string) *lineRange
```

### <a id="pageError" href="#pageError">type pageError struct</a>

```
searchKey: ui.pageError
tags: [struct private]
```

```Go
type pageError struct {
	StatusCode int    `json:"statusCode"`
	StatusText string `json:"statusText"`
	Error      string `json:"error"`
	ErrorID    string `json:"errorID"`
}
```

### <a id="recoverError" href="#recoverError">type recoverError struct</a>

```
searchKey: ui.recoverError
tags: [struct private]
```

```Go
type recoverError struct {
	recover interface{}
	stack   []byte
}
```

#### <a id="recoverError.Error" href="#recoverError.Error">func (r recoverError) Error() string</a>

```
searchKey: ui.recoverError.Error
tags: [function private]
```

```Go
func (r recoverError) Error() string
```

### <a id="serveErrorHandler" href="#serveErrorHandler">type serveErrorHandler func(w net/http.ResponseWriter, r *net/http.Request, err error, statusCode int)</a>

```
searchKey: ui.serveErrorHandler
tags: [function private]
```

```Go
type serveErrorHandler func(w http.ResponseWriter, r *http.Request, err error, statusCode int)
```

serveErrorHandler is a function signature used in newCommon and mockNewCommon. This is used as syntactic sugar to prevent programmer's (fragile creatures from planet Earth) from crashing out. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="InitRouter" href="#InitRouter">func InitRouter(db dbutil.DB)</a>

```
searchKey: ui.InitRouter
tags: [method]
```

```Go
func InitRouter(db dbutil.DB)
```

InitRouter create the router that serves pages for our web app and assigns it to uirouter.Router. The router can be accessed by calling Router(). 

### <a id="Router" href="#Router">func Router() *mux.Router</a>

```
searchKey: ui.Router
tags: [function]
```

```Go
func Router() *mux.Router
```

Router returns the router that serves pages for our web app. 

### <a id="TestFindLineRangeInQueryParameters" href="#TestFindLineRangeInQueryParameters">func TestFindLineRangeInQueryParameters(t *testing.T)</a>

```
searchKey: ui.TestFindLineRangeInQueryParameters
tags: [method private test]
```

```Go
func TestFindLineRangeInQueryParameters(t *testing.T)
```

### <a id="TestGetBlobPreviewImageURL" href="#TestGetBlobPreviewImageURL">func TestGetBlobPreviewImageURL(t *testing.T)</a>

```
searchKey: ui.TestGetBlobPreviewImageURL
tags: [method private test]
```

```Go
func TestGetBlobPreviewImageURL(t *testing.T)
```

### <a id="TestGetBlobPreviewTitle" href="#TestGetBlobPreviewTitle">func TestGetBlobPreviewTitle(t *testing.T)</a>

```
searchKey: ui.TestGetBlobPreviewTitle
tags: [method private test]
```

```Go
func TestGetBlobPreviewTitle(t *testing.T)
```

### <a id="TestLoadTemplate" href="#TestLoadTemplate">func TestLoadTemplate(t *testing.T)</a>

```
searchKey: ui.TestLoadTemplate
tags: [method private test]
```

```Go
func TestLoadTemplate(t *testing.T)
```

### <a id="TestNewCommon_repo_error" href="#TestNewCommon_repo_error">func TestNewCommon_repo_error(t *testing.T)</a>

```
searchKey: ui.TestNewCommon_repo_error
tags: [method private test]
```

```Go
func TestNewCommon_repo_error(t *testing.T)
```

### <a id="TestRedirectTreeOrBlob" href="#TestRedirectTreeOrBlob">func TestRedirectTreeOrBlob(t *testing.T)</a>

```
searchKey: ui.TestRedirectTreeOrBlob
tags: [method private test]
```

```Go
func TestRedirectTreeOrBlob(t *testing.T)
```

### <a id="TestRedirects" href="#TestRedirects">func TestRedirects(t *testing.T)</a>

```
searchKey: ui.TestRedirects
tags: [method private test]
```

```Go
func TestRedirects(t *testing.T)
```

### <a id="TestRepoShortName" href="#TestRepoShortName">func TestRepoShortName(t *testing.T)</a>

```
searchKey: ui.TestRepoShortName
tags: [method private test]
```

```Go
func TestRepoShortName(t *testing.T)
```

### <a id="TestRouter" href="#TestRouter">func TestRouter(t *testing.T)</a>

```
searchKey: ui.TestRouter
tags: [method private test]
```

```Go
func TestRouter(t *testing.T)
```

### <a id="TestRouter_RootPath" href="#TestRouter_RootPath">func TestRouter_RootPath(t *testing.T)</a>

```
searchKey: ui.TestRouter_RootPath
tags: [method private test]
```

```Go
func TestRouter_RootPath(t *testing.T)
```

### <a id="TestServeHelp" href="#TestServeHelp">func TestServeHelp(t *testing.T)</a>

```
searchKey: ui.TestServeHelp
tags: [method private test]
```

```Go
func TestServeHelp(t *testing.T)
```

### <a id="Test_serveRawWithContentArchive" href="#Test_serveRawWithContentArchive">func Test_serveRawWithContentArchive(t *testing.T)</a>

```
searchKey: ui.Test_serveRawWithContentArchive
tags: [method private test]
```

```Go
func Test_serveRawWithContentArchive(t *testing.T)
```

### <a id="Test_serveRawWithContentTypePlain" href="#Test_serveRawWithContentTypePlain">func Test_serveRawWithContentTypePlain(t *testing.T)</a>

```
searchKey: ui.Test_serveRawWithContentTypePlain
tags: [method private test]
```

```Go
func Test_serveRawWithContentTypePlain(t *testing.T)
```

### <a id="Test_serveRawWithHTTPRequestMethodHEAD" href="#Test_serveRawWithHTTPRequestMethodHEAD">func Test_serveRawWithHTTPRequestMethodHEAD(t *testing.T)</a>

```
searchKey: ui.Test_serveRawWithHTTPRequestMethodHEAD
tags: [method private test]
```

```Go
func Test_serveRawWithHTTPRequestMethodHEAD(t *testing.T)
```

### <a id="brandNameSubtitle" href="#brandNameSubtitle">func brandNameSubtitle(titles ...string) string</a>

```
searchKey: ui.brandNameSubtitle
tags: [method private]
```

```Go
func brandNameSubtitle(titles ...string) string
```

brandNameSubtitle returns a string with the specified title sequence and the brand name as the last title component. This function indirectly calls conf.Get(), so should not be invoked from any function that is invoked by an init function. 

### <a id="dangerouslyServeError" href="#dangerouslyServeError">func dangerouslyServeError(w http.ResponseWriter, r *http.Request, err error, statusCode int)</a>

```
searchKey: ui.dangerouslyServeError
tags: [method private]
```

```Go
func dangerouslyServeError(w http.ResponseWriter, r *http.Request, err error, statusCode int)
```

dangerouslyServeError is like serveError except it always shows the error to the user and as such, if it contains sensitive information, it can leak sensitive information. 

See [https://github.com/sourcegraph/sourcegraph/issues/9453](https://github.com/sourcegraph/sourcegraph/issues/9453) 

### <a id="doLoadTemplate" href="#doLoadTemplate">func doLoadTemplate(path string) (*template.Template, error)</a>

```
searchKey: ui.doLoadTemplate
tags: [method private]
```

```Go
func doLoadTemplate(path string) (*template.Template, error)
```

doLoadTemplate should only be called by loadTemplate. 

### <a id="formatLineRange" href="#formatLineRange">func formatLineRange(lineRange *lineRange) string</a>

```
searchKey: ui.formatLineRange
tags: [method private]
```

```Go
func formatLineRange(lineRange *lineRange) string
```

### <a id="getBlobPreviewImageURL" href="#getBlobPreviewImageURL">func getBlobPreviewImageURL(previewServiceURL string, blobURLPath string, lineRange *lineRange) string</a>

```
searchKey: ui.getBlobPreviewImageURL
tags: [method private]
```

```Go
func getBlobPreviewImageURL(previewServiceURL string, blobURLPath string, lineRange *lineRange) string
```

### <a id="getBlobPreviewTitle" href="#getBlobPreviewTitle">func getBlobPreviewTitle(blobFilePath string, lineRange *lineRange) string</a>

```
searchKey: ui.getBlobPreviewTitle
tags: [method private]
```

```Go
func getBlobPreviewTitle(blobFilePath string, lineRange *lineRange) string
```

### <a id="handler" href="#handler">func handler(f func(w http.ResponseWriter, r *http.Request) error) http.Handler</a>

```
searchKey: ui.handler
tags: [method private]
```

```Go
func handler(f func(w http.ResponseWriter, r *http.Request) error) http.Handler
```

handler wraps an HTTP handler that returns potential errors. If any error is returned, serveError is called. 

Clients that wish to return their own HTTP status code should use this from their handler: 

```
	serveError(w, r, err, http.MyStatusCode)
 return nil

```
### <a id="init.handlers_test.go" href="#init.handlers_test.go">func init()</a>

```
searchKey: ui.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.router_test.go" href="#init.router_test.go">func init()</a>

```
searchKey: ui.init
tags: [function private]
```

```Go
func init()
```

### <a id="initHTTPTestGitServer" href="#initHTTPTestGitServer">func initHTTPTestGitServer(t *testing.T, httpStatusCode int, resp string)</a>

```
searchKey: ui.initHTTPTestGitServer
tags: [method private]
```

```Go
func initHTTPTestGitServer(t *testing.T, httpStatusCode int, resp string)
```

initHTTPTestGitServer instantiates an httptest.Server to make it return an HTTP response as set by httpStatusCode and a body as set by resp. It also ensures that the server is closed during test cleanup, thus ensuring that the caller does not have to remember to close the server. 

Finally, initHTTPTestGitServer patches the gitserver.DefaultClient.Addrs to the URL of the test HTTP server, so that API calls to the gitserver are received by the test HTTP server. 

TL;DR: This function helps us to mock the gitserver without having to define mock functions for each of the gitserver client methods. 

### <a id="initRouter" href="#initRouter">func initRouter(db dbutil.DB, router *mux.Router)</a>

```
searchKey: ui.initRouter
tags: [method private]
```

```Go
func initRouter(db dbutil.DB, router *mux.Router)
```

### <a id="limitString" href="#limitString">func limitString(s string, n int, ellipsis bool) string</a>

```
searchKey: ui.limitString
tags: [method private]
```

```Go
func limitString(s string, n int, ellipsis bool) string
```

limitString limits the given string to at most N characters, optionally adding an ellipsis (…) at the end. 

### <a id="loadTemplate" href="#loadTemplate">func loadTemplate(path string) (*template.Template, error)</a>

```
searchKey: ui.loadTemplate
tags: [method private]
```

```Go
func loadTemplate(path string) (*template.Template, error)
```

loadTemplate loads the template with the given path. Also loaded along with that template is any templates under the shared/ directory. 

### <a id="mapKeys" href="#mapKeys">func mapKeys(m map[string]string) (keys []string)</a>

```
searchKey: ui.mapKeys
tags: [method private]
```

```Go
func mapKeys(m map[string]string) (keys []string)
```

### <a id="newRouter" href="#newRouter">func newRouter() *mux.Router</a>

```
searchKey: ui.newRouter
tags: [function private]
```

```Go
func newRouter() *mux.Router
```

### <a id="openArchiveReader" href="#openArchiveReader">func openArchiveReader(ctx context.Context, opts vfsutil.ArchiveOpts) (io.ReadCloser, error)</a>

```
searchKey: ui.openArchiveReader
tags: [method private]
```

```Go
func openArchiveReader(ctx context.Context, opts vfsutil.ArchiveOpts) (io.ReadCloser, error)
```

openArchiveReader runs git archive and streams the output. Note: we do not use vfsutil since most archives are just streamed once so caching locally is not useful. Additionally we transfer the output over the internet, so we use default compression levels on zips (instead of no compression). 

### <a id="redirectTreeOrBlob" href="#redirectTreeOrBlob">func redirectTreeOrBlob(routeName, path string, common *Common, w http.ResponseWriter, r *http.Request) (requestHandled bool, err error)</a>

```
searchKey: ui.redirectTreeOrBlob
tags: [method private]
```

```Go
func redirectTreeOrBlob(routeName, path string, common *Common, w http.ResponseWriter, r *http.Request) (requestHandled bool, err error)
```

redirectTreeOrBlob redirects a blob page to a tree page if the file is actually a directory, or a tree page to a blob page if the directory is actually a file. 

### <a id="renderTemplate" href="#renderTemplate">func renderTemplate(w http.ResponseWriter, name string, data interface{}) error</a>

```
searchKey: ui.renderTemplate
tags: [method private]
```

```Go
func renderTemplate(w http.ResponseWriter, name string, data interface{}) error
```

renderTemplate renders the template with the given name. The template name is its file name, relative to the template directory. 

The given data is accessible in the template via $.Foobar 

### <a id="repoShortName" href="#repoShortName">func repoShortName(name api.RepoName) string</a>

```
searchKey: ui.repoShortName
tags: [method private]
```

```Go
func repoShortName(name api.RepoName) string
```

repoShortName trims the first path element of the given repo name if it has at least two path components. 

### <a id="searchBadgeHandler" href="#searchBadgeHandler">func searchBadgeHandler() *httputil.ReverseProxy</a>

```
searchKey: ui.searchBadgeHandler
tags: [function private]
```

```Go
func searchBadgeHandler() *httputil.ReverseProxy
```

searchBadgeHandler serves the search readme badges from the search-badger service [https://github.com/sourcegraph/search-badger](https://github.com/sourcegraph/search-badger) 

### <a id="serveDefLanding" href="#serveDefLanding">func serveDefLanding(w http.ResponseWriter, r *http.Request) (err error)</a>

```
searchKey: ui.serveDefLanding
tags: [method private]
```

```Go
func serveDefLanding(w http.ResponseWriter, r *http.Request) (err error)
```

### <a id="serveDefRedirectToDefLanding" href="#serveDefRedirectToDefLanding">func serveDefRedirectToDefLanding(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: ui.serveDefRedirectToDefLanding
tags: [method private]
```

```Go
func serveDefRedirectToDefLanding(w http.ResponseWriter, r *http.Request)
```

serveDefRedirectToDefLanding redirects from /REPO/refs/... and /REPO/def/... URLs to the def landing page. Those URLs used to point to JavaScript-backed pages in the UI for a refs list and code view, respectively, but now def URLs are only for SEO (and thus those URLs are only handled by this package). 

### <a id="serveError" href="#serveError">func serveError(w http.ResponseWriter, r *http.Request, err error, statusCode int)</a>

```
searchKey: ui.serveError
tags: [method private]
```

```Go
func serveError(w http.ResponseWriter, r *http.Request, err error, statusCode int)
```

serveError serves the error template with the specified error message. It is assumed that the error message could accidentally contain sensitive data, and as such is only presented to the user in debug mode. 

### <a id="serveErrorNoDebug" href="#serveErrorNoDebug">func serveErrorNoDebug(w http.ResponseWriter, r *http.Request, err error, statusCode int, nodebug, forceServeError bool)</a>

```
searchKey: ui.serveErrorNoDebug
tags: [method private]
```

```Go
func serveErrorNoDebug(w http.ResponseWriter, r *http.Request, err error, statusCode int, nodebug, forceServeError bool)
```

serveErrorNoDebug should not be called by anyone except serveErrorTest. 

### <a id="serveErrorTest" href="#serveErrorTest">func serveErrorTest(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.serveErrorTest
tags: [method private]
```

```Go
func serveErrorTest(w http.ResponseWriter, r *http.Request) error
```

serveErrorTest makes it easy to test styling/layout of the error template by visiting: 

```
[http://localhost:3080/__errorTest?nodebug=true&error=theerror&status=500](http://localhost:3080/__errorTest?nodebug=true&error=theerror&status=500)

```
The `nodebug=true` parameter hides error messages (which is ALWAYS the case in production), `error` controls the error message text, and status controls the status code. 

### <a id="serveHelp" href="#serveHelp">func serveHelp(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: ui.serveHelp
tags: [method private]
```

```Go
func serveHelp(w http.ResponseWriter, r *http.Request)
```

serveHelp redirects to documentation pages on [https://docs.sourcegraph.com](https://docs.sourcegraph.com) for the current product version, i.e., /help/PATH -> [https://docs.sourcegraph.com/](https://docs.sourcegraph.com/)@VERSION/PATH. In unreleased development builds (whose docs aren't necessarily available on [https://docs.sourcegraph.com](https://docs.sourcegraph.com), it shows a message with instructions on how to see the docs.) 

### <a id="serveHome" href="#serveHome">func serveHome(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.serveHome
tags: [method private]
```

```Go
func serveHome(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveOldRouteDefLanding" href="#serveOldRouteDefLanding">func serveOldRouteDefLanding(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: ui.serveOldRouteDefLanding
tags: [method private]
```

```Go
func serveOldRouteDefLanding(w http.ResponseWriter, r *http.Request)
```

Redirect from old /land/ def landing URLs to new /info/ URLs 

### <a id="servePingFromSelfHosted" href="#servePingFromSelfHosted">func servePingFromSelfHosted(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.servePingFromSelfHosted
tags: [method private]
```

```Go
func servePingFromSelfHosted(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveRaw" href="#serveRaw">func serveRaw(w http.ResponseWriter, r *http.Request) (err error)</a>

```
searchKey: ui.serveRaw
tags: [method private]
```

```Go
func serveRaw(w http.ResponseWriter, r *http.Request) (err error)
```

### <a id="serveRepoLanding" href="#serveRepoLanding">func serveRepoLanding(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.serveRepoLanding
tags: [method private]
```

```Go
func serveRepoLanding(w http.ResponseWriter, r *http.Request) error
```

serveRepoLanding simply redirects the old (sourcegraph.com/<repo>/-/info) repo landing page URLs directly to the repo itself (sourcegraph.com/<repo>). 

### <a id="serveSignIn" href="#serveSignIn">func serveSignIn(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.serveSignIn
tags: [method private]
```

```Go
func serveSignIn(w http.ResponseWriter, r *http.Request) error
```

### <a id="staticRedirectHandler" href="#staticRedirectHandler">func staticRedirectHandler(u string, code int) http.Handler</a>

```
searchKey: ui.staticRedirectHandler
tags: [method private]
```

```Go
func staticRedirectHandler(u string, code int) http.Handler
```

staticRedirectHandler returns an HTTP handler that redirects all requests to the specified url or relative path with the specified status code. 

The scheme, host, and path in the specified url override ones in the incoming request. For example: 

```
staticRedirectHandler("[http://google.com](http://google.com)") serving "[https://sourcegraph.com/foobar?q=foo](https://sourcegraph.com/foobar?q=foo)" -> "[http://google.com/foobar?q=foo](http://google.com/foobar?q=foo)"
staticRedirectHandler("/foo") serving "[https://sourcegraph.com/bar?q=foo](https://sourcegraph.com/bar?q=foo)" -> "[https://sourcegraph.com/foo?q=foo](https://sourcegraph.com/foo?q=foo)"

```
