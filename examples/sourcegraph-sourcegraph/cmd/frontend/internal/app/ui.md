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
    * [const routeHome](#routeHome)
    * [const routeSearch](#routeSearch)
    * [const routeSearchBadge](#routeSearchBadge)
    * [const routeRepo](#routeRepo)
    * [const routeRepoSettings](#routeRepoSettings)
    * [const routeRepoCommit](#routeRepoCommit)
    * [const routeRepoBranches](#routeRepoBranches)
    * [const routeRepoDocs](#routeRepoDocs)
    * [const routeRepoCommits](#routeRepoCommits)
    * [const routeRepoTags](#routeRepoTags)
    * [const routeRepoCompare](#routeRepoCompare)
    * [const routeRepoStats](#routeRepoStats)
    * [const routeInsights](#routeInsights)
    * [const routeBatchChanges](#routeBatchChanges)
    * [const routeCodeMonitoring](#routeCodeMonitoring)
    * [const routeContexts](#routeContexts)
    * [const routeThreads](#routeThreads)
    * [const routeTree](#routeTree)
    * [const routeBlob](#routeBlob)
    * [const routeRaw](#routeRaw)
    * [const routeOrganizations](#routeOrganizations)
    * [const routeSettings](#routeSettings)
    * [const routeSiteAdmin](#routeSiteAdmin)
    * [const routeAPIConsole](#routeAPIConsole)
    * [const routeUser](#routeUser)
    * [const routeUserSettings](#routeUserSettings)
    * [const routeUserRedirect](#routeUserRedirect)
    * [const routeAboutSubdomain](#routeAboutSubdomain)
    * [const aboutRedirectScheme](#aboutRedirectScheme)
    * [const aboutRedirectHost](#aboutRedirectHost)
    * [const routeSurvey](#routeSurvey)
    * [const routeSurveyScore](#routeSurveyScore)
    * [const routeRegistry](#routeRegistry)
    * [const routeExtensions](#routeExtensions)
    * [const routeHelp](#routeHelp)
    * [const routeRepoGroups](#routeRepoGroups)
    * [const routeCncf](#routeCncf)
    * [const routeSnippets](#routeSnippets)
    * [const routeSubscriptions](#routeSubscriptions)
    * [const routeStats](#routeStats)
    * [const routeViews](#routeViews)
    * [const routeDevToolTime](#routeDevToolTime)
    * [const routeSearchQueryBuilder](#routeSearchQueryBuilder)
    * [const routeSearchStream](#routeSearchStream)
    * [const routeSearchConsole](#routeSearchConsole)
    * [const routeLegacyLogin](#routeLegacyLogin)
    * [const routeLegacyCareers](#routeLegacyCareers)
    * [const routeLegacyDefLanding](#routeLegacyDefLanding)
    * [const routeLegacyOldRouteDefLanding](#routeLegacyOldRouteDefLanding)
    * [const routeLegacyRepoLanding](#routeLegacyRepoLanding)
    * [const routeLegacyDefRedirectToDefLanding](#routeLegacyDefRedirectToDefLanding)
    * [const routeLegacyCampaigns](#routeLegacyCampaigns)
* [Variables](#var)
    * [var webpackDevServer](#webpackDevServer)
    * [var mockNewCommon](#mockNewCommon)
    * [var goSymbolReg](#goSymbolReg)
    * [var legacyDefLandingCounter](#legacyDefLandingCounter)
    * [var legacyRepoLandingCounter](#legacyRepoLandingCounter)
    * [var singleLineRegexp](#singleLineRegexp)
    * [var multiLineRangeRegexp](#multiLineRangeRegexp)
    * [var metricRawDuration](#metricRawDuration)
    * [var metricRawArchiveRunning](#metricRawArchiveRunning)
    * [var aboutRedirects](#aboutRedirects)
    * [var mockServeRepo](#mockServeRepo)
    * [var appHTML](#appHTML)
    * [var errorHTML](#errorHTML)
    * [var versionCacheMu](#versionCacheMu)
    * [var versionCache](#versionCache)
    * [var noAssetVersionString](#noAssetVersionString)
    * [var funcMap](#funcMap)
    * [var loadTemplateMu](#loadTemplateMu)
    * [var loadTemplateCache](#loadTemplateCache)
* [Types](#type)
    * [type InjectedHTML struct](#InjectedHTML)
    * [type Metadata struct](#Metadata)
    * [type Common struct](#Common)
        * [func newCommon(w http.ResponseWriter, r *http.Request, title string, serveError serveErrorHandler) (*Common, error)](#newCommon)
    * [type serveErrorHandler func(w net/http.ResponseWriter, r *net/http.Request, err error, statusCode int)](#serveErrorHandler)
    * [type handlerFunc func(w net/http.ResponseWriter, r *net/http.Request) error](#handlerFunc)
        * [func serveBrandedPageString(titles string, description *string) handlerFunc](#serveBrandedPageString)
        * [func serveBasicPage(title func(c *Common, r *http.Request) string, description *string) handlerFunc](#serveBasicPage)
        * [func serveTree(title func(c *Common, r *http.Request) string) handlerFunc](#serveTree)
        * [func serveRepoOrBlob(routeName string, title func(c *Common, r *http.Request) string) handlerFunc](#serveRepoOrBlob)
    * [type lineRange struct](#lineRange)
        * [func findLineRangeInQueryParameters(queryParameters map[string][]string) *lineRange](#findLineRangeInQueryParameters)
        * [func getLineRange(value string) *lineRange](#getLineRange)
    * [type recoverError struct](#recoverError)
        * [func (r recoverError) Error() string](#recoverError.Error)
    * [type pageError struct](#pageError)
* [Functions](#func)
    * [func repoShortName(name api.RepoName) string](#repoShortName)
    * [func serveHome(w http.ResponseWriter, r *http.Request) error](#serveHome)
    * [func serveSignIn(w http.ResponseWriter, r *http.Request) error](#serveSignIn)
    * [func redirectTreeOrBlob(routeName, path string, common *Common, w http.ResponseWriter, r *http.Request) (requestHandled bool, err error)](#redirectTreeOrBlob)
    * [func searchBadgeHandler() *httputil.ReverseProxy](#searchBadgeHandler)
    * [func servePingFromSelfHosted(w http.ResponseWriter, r *http.Request) error](#servePingFromSelfHosted)
    * [func serveHelp(w http.ResponseWriter, r *http.Request)](#serveHelp)
    * [func serveRepoLanding(w http.ResponseWriter, r *http.Request) error](#serveRepoLanding)
    * [func serveDefLanding(w http.ResponseWriter, r *http.Request) (err error)](#serveDefLanding)
    * [func serveDefRedirectToDefLanding(w http.ResponseWriter, r *http.Request)](#serveDefRedirectToDefLanding)
    * [func serveOldRouteDefLanding(w http.ResponseWriter, r *http.Request)](#serveOldRouteDefLanding)
    * [func formatLineRange(lineRange *lineRange) string](#formatLineRange)
    * [func getBlobPreviewImageURL(previewServiceURL string, blobURLPath string, lineRange *lineRange) string](#getBlobPreviewImageURL)
    * [func getBlobPreviewTitle(blobFilePath string, lineRange *lineRange) string](#getBlobPreviewTitle)
    * [func serveRaw(w http.ResponseWriter, r *http.Request) (err error)](#serveRaw)
    * [func openArchiveReader(ctx context.Context, opts vfsutil.ArchiveOpts) (io.ReadCloser, error)](#openArchiveReader)
    * [func Router() *mux.Router](#Router)
    * [func InitRouter(db dbutil.DB)](#InitRouter)
    * [func newRouter() *mux.Router](#newRouter)
    * [func brandNameSubtitle(titles ...string) string](#brandNameSubtitle)
    * [func initRouter(db dbutil.DB, router *mux.Router)](#initRouter)
    * [func staticRedirectHandler(u string, code int) http.Handler](#staticRedirectHandler)
    * [func limitString(s string, n int, ellipsis bool) string](#limitString)
    * [func handler(f func(w http.ResponseWriter, r *http.Request) error) http.Handler](#handler)
    * [func serveError(w http.ResponseWriter, r *http.Request, err error, statusCode int)](#serveError)
    * [func dangerouslyServeError(w http.ResponseWriter, r *http.Request, err error, statusCode int)](#dangerouslyServeError)
    * [func serveErrorNoDebug(w http.ResponseWriter, r *http.Request, err error, statusCode int, nodebug, forceServeError bool)](#serveErrorNoDebug)
    * [func serveErrorTest(w http.ResponseWriter, r *http.Request) error](#serveErrorTest)
    * [func mapKeys(m map[string]string) (keys []string)](#mapKeys)
    * [func loadTemplate(path string) (*template.Template, error)](#loadTemplate)
    * [func doLoadTemplate(path string) (*template.Template, error)](#doLoadTemplate)
    * [func renderTemplate(w http.ResponseWriter, name string, data interface{}) error](#renderTemplate)
    * [func TestRedirects(t *testing.T)](#TestRedirects)
    * [func TestRepoShortName(t *testing.T)](#TestRepoShortName)
    * [func TestNewCommon_repo_error(t *testing.T)](#TestNewCommon_repo_error)
    * [func TestRedirectTreeOrBlob(t *testing.T)](#TestRedirectTreeOrBlob)
    * [func init()](#init)
    * [func TestServeHelp(t *testing.T)](#TestServeHelp)
    * [func TestFindLineRangeInQueryParameters(t *testing.T)](#TestFindLineRangeInQueryParameters)
    * [func TestGetBlobPreviewImageURL(t *testing.T)](#TestGetBlobPreviewImageURL)
    * [func TestGetBlobPreviewTitle(t *testing.T)](#TestGetBlobPreviewTitle)
    * [func initHTTPTestGitServer(t *testing.T, httpStatusCode int, resp string)](#initHTTPTestGitServer)
    * [func Test_serveRawWithHTTPRequestMethodHEAD(t *testing.T)](#Test_serveRawWithHTTPRequestMethodHEAD)
    * [func Test_serveRawWithContentArchive(t *testing.T)](#Test_serveRawWithContentArchive)
    * [func Test_serveRawWithContentTypePlain(t *testing.T)](#Test_serveRawWithContentTypePlain)
    * [func init()](#init)
    * [func TestRouter(t *testing.T)](#TestRouter)
    * [func TestRouter_RootPath(t *testing.T)](#TestRouter_RootPath)
    * [func TestLoadTemplate(t *testing.T)](#TestLoadTemplate)


## <a id="const" href="#const">Constants</a>

### <a id="routeHome" href="#routeHome">const routeHome</a>

```
searchKey: ui.routeHome
```

```Go
const routeHome = "home"
```

### <a id="routeSearch" href="#routeSearch">const routeSearch</a>

```
searchKey: ui.routeSearch
```

```Go
const routeSearch = "search"
```

### <a id="routeSearchBadge" href="#routeSearchBadge">const routeSearchBadge</a>

```
searchKey: ui.routeSearchBadge
```

```Go
const routeSearchBadge = "search-badge"
```

### <a id="routeRepo" href="#routeRepo">const routeRepo</a>

```
searchKey: ui.routeRepo
```

```Go
const routeRepo = "repo"
```

### <a id="routeRepoSettings" href="#routeRepoSettings">const routeRepoSettings</a>

```
searchKey: ui.routeRepoSettings
```

```Go
const routeRepoSettings = "repo-settings"
```

### <a id="routeRepoCommit" href="#routeRepoCommit">const routeRepoCommit</a>

```
searchKey: ui.routeRepoCommit
```

```Go
const routeRepoCommit = "repo-commit"
```

### <a id="routeRepoBranches" href="#routeRepoBranches">const routeRepoBranches</a>

```
searchKey: ui.routeRepoBranches
```

```Go
const routeRepoBranches = "repo-branches"
```

### <a id="routeRepoDocs" href="#routeRepoDocs">const routeRepoDocs</a>

```
searchKey: ui.routeRepoDocs
```

```Go
const routeRepoDocs = "repo-docs"
```

### <a id="routeRepoCommits" href="#routeRepoCommits">const routeRepoCommits</a>

```
searchKey: ui.routeRepoCommits
```

```Go
const routeRepoCommits = "repo-commits"
```

### <a id="routeRepoTags" href="#routeRepoTags">const routeRepoTags</a>

```
searchKey: ui.routeRepoTags
```

```Go
const routeRepoTags = "repo-tags"
```

### <a id="routeRepoCompare" href="#routeRepoCompare">const routeRepoCompare</a>

```
searchKey: ui.routeRepoCompare
```

```Go
const routeRepoCompare = "repo-compare"
```

### <a id="routeRepoStats" href="#routeRepoStats">const routeRepoStats</a>

```
searchKey: ui.routeRepoStats
```

```Go
const routeRepoStats = "repo-stats"
```

### <a id="routeInsights" href="#routeInsights">const routeInsights</a>

```
searchKey: ui.routeInsights
```

```Go
const routeInsights = "insights"
```

### <a id="routeBatchChanges" href="#routeBatchChanges">const routeBatchChanges</a>

```
searchKey: ui.routeBatchChanges
```

```Go
const routeBatchChanges = "batch-changes"
```

### <a id="routeCodeMonitoring" href="#routeCodeMonitoring">const routeCodeMonitoring</a>

```
searchKey: ui.routeCodeMonitoring
```

```Go
const routeCodeMonitoring = "code-monitoring"
```

### <a id="routeContexts" href="#routeContexts">const routeContexts</a>

```
searchKey: ui.routeContexts
```

```Go
const routeContexts = "contexts"
```

### <a id="routeThreads" href="#routeThreads">const routeThreads</a>

```
searchKey: ui.routeThreads
```

```Go
const routeThreads = "threads"
```

### <a id="routeTree" href="#routeTree">const routeTree</a>

```
searchKey: ui.routeTree
```

```Go
const routeTree = "tree"
```

### <a id="routeBlob" href="#routeBlob">const routeBlob</a>

```
searchKey: ui.routeBlob
```

```Go
const routeBlob = "blob"
```

### <a id="routeRaw" href="#routeRaw">const routeRaw</a>

```
searchKey: ui.routeRaw
```

```Go
const routeRaw = "raw"
```

### <a id="routeOrganizations" href="#routeOrganizations">const routeOrganizations</a>

```
searchKey: ui.routeOrganizations
```

```Go
const routeOrganizations = "org"
```

### <a id="routeSettings" href="#routeSettings">const routeSettings</a>

```
searchKey: ui.routeSettings
```

```Go
const routeSettings = "settings"
```

### <a id="routeSiteAdmin" href="#routeSiteAdmin">const routeSiteAdmin</a>

```
searchKey: ui.routeSiteAdmin
```

```Go
const routeSiteAdmin = "site-admin"
```

### <a id="routeAPIConsole" href="#routeAPIConsole">const routeAPIConsole</a>

```
searchKey: ui.routeAPIConsole
```

```Go
const routeAPIConsole = "api-console"
```

### <a id="routeUser" href="#routeUser">const routeUser</a>

```
searchKey: ui.routeUser
```

```Go
const routeUser = "user"
```

### <a id="routeUserSettings" href="#routeUserSettings">const routeUserSettings</a>

```
searchKey: ui.routeUserSettings
```

```Go
const routeUserSettings = "user-settings"
```

### <a id="routeUserRedirect" href="#routeUserRedirect">const routeUserRedirect</a>

```
searchKey: ui.routeUserRedirect
```

```Go
const routeUserRedirect = "user-redirect"
```

### <a id="routeAboutSubdomain" href="#routeAboutSubdomain">const routeAboutSubdomain</a>

```
searchKey: ui.routeAboutSubdomain
```

```Go
const routeAboutSubdomain = "about-subdomain"
```

### <a id="aboutRedirectScheme" href="#aboutRedirectScheme">const aboutRedirectScheme</a>

```
searchKey: ui.aboutRedirectScheme
```

```Go
const aboutRedirectScheme = "https"
```

### <a id="aboutRedirectHost" href="#aboutRedirectHost">const aboutRedirectHost</a>

```
searchKey: ui.aboutRedirectHost
```

```Go
const aboutRedirectHost = "about.sourcegraph.com"
```

### <a id="routeSurvey" href="#routeSurvey">const routeSurvey</a>

```
searchKey: ui.routeSurvey
```

```Go
const routeSurvey = "survey"
```

### <a id="routeSurveyScore" href="#routeSurveyScore">const routeSurveyScore</a>

```
searchKey: ui.routeSurveyScore
```

```Go
const routeSurveyScore = "survey-score"
```

### <a id="routeRegistry" href="#routeRegistry">const routeRegistry</a>

```
searchKey: ui.routeRegistry
```

```Go
const routeRegistry = "registry"
```

### <a id="routeExtensions" href="#routeExtensions">const routeExtensions</a>

```
searchKey: ui.routeExtensions
```

```Go
const routeExtensions = "extensions"
```

### <a id="routeHelp" href="#routeHelp">const routeHelp</a>

```
searchKey: ui.routeHelp
```

```Go
const routeHelp = "help"
```

### <a id="routeRepoGroups" href="#routeRepoGroups">const routeRepoGroups</a>

```
searchKey: ui.routeRepoGroups
```

```Go
const routeRepoGroups = "repo-groups"
```

### <a id="routeCncf" href="#routeCncf">const routeCncf</a>

```
searchKey: ui.routeCncf
```

```Go
const routeCncf = "repo-groups.cncf"
```

### <a id="routeSnippets" href="#routeSnippets">const routeSnippets</a>

```
searchKey: ui.routeSnippets
```

```Go
const routeSnippets = "snippets"
```

### <a id="routeSubscriptions" href="#routeSubscriptions">const routeSubscriptions</a>

```
searchKey: ui.routeSubscriptions
```

```Go
const routeSubscriptions = "subscriptions"
```

### <a id="routeStats" href="#routeStats">const routeStats</a>

```
searchKey: ui.routeStats
```

```Go
const routeStats = "stats"
```

### <a id="routeViews" href="#routeViews">const routeViews</a>

```
searchKey: ui.routeViews
```

```Go
const routeViews = "views"
```

### <a id="routeDevToolTime" href="#routeDevToolTime">const routeDevToolTime</a>

```
searchKey: ui.routeDevToolTime
```

```Go
const routeDevToolTime = "devtooltime"
```

### <a id="routeSearchQueryBuilder" href="#routeSearchQueryBuilder">const routeSearchQueryBuilder</a>

```
searchKey: ui.routeSearchQueryBuilder
```

```Go
const routeSearchQueryBuilder = "search.query-builder"
```

### <a id="routeSearchStream" href="#routeSearchStream">const routeSearchStream</a>

```
searchKey: ui.routeSearchStream
```

```Go
const routeSearchStream = "search.stream"
```

### <a id="routeSearchConsole" href="#routeSearchConsole">const routeSearchConsole</a>

```
searchKey: ui.routeSearchConsole
```

```Go
const routeSearchConsole = "search.console"
```

### <a id="routeLegacyLogin" href="#routeLegacyLogin">const routeLegacyLogin</a>

```
searchKey: ui.routeLegacyLogin
```

```Go
const routeLegacyLogin = "login"
```

Legacy redirects 

### <a id="routeLegacyCareers" href="#routeLegacyCareers">const routeLegacyCareers</a>

```
searchKey: ui.routeLegacyCareers
```

```Go
const routeLegacyCareers = "careers"
```

### <a id="routeLegacyDefLanding" href="#routeLegacyDefLanding">const routeLegacyDefLanding</a>

```
searchKey: ui.routeLegacyDefLanding
```

```Go
const routeLegacyDefLanding = "page.def.landing"
```

### <a id="routeLegacyOldRouteDefLanding" href="#routeLegacyOldRouteDefLanding">const routeLegacyOldRouteDefLanding</a>

```
searchKey: ui.routeLegacyOldRouteDefLanding
```

```Go
const routeLegacyOldRouteDefLanding = "page.def.landing.old"
```

### <a id="routeLegacyRepoLanding" href="#routeLegacyRepoLanding">const routeLegacyRepoLanding</a>

```
searchKey: ui.routeLegacyRepoLanding
```

```Go
const routeLegacyRepoLanding = "page.repo.landing"
```

### <a id="routeLegacyDefRedirectToDefLanding" href="#routeLegacyDefRedirectToDefLanding">const routeLegacyDefRedirectToDefLanding</a>

```
searchKey: ui.routeLegacyDefRedirectToDefLanding
```

```Go
const routeLegacyDefRedirectToDefLanding = "page.def.redirect"
```

### <a id="routeLegacyCampaigns" href="#routeLegacyCampaigns">const routeLegacyCampaigns</a>

```
searchKey: ui.routeLegacyCampaigns
```

```Go
const routeLegacyCampaigns = "campaigns"
```

## <a id="var" href="#var">Variables</a>

### <a id="webpackDevServer" href="#webpackDevServer">var webpackDevServer</a>

```
searchKey: ui.webpackDevServer
```

```Go
var webpackDevServer, _ = strconv.ParseBool(os.Getenv("WEBPACK_DEV_SERVER"))
```

### <a id="mockNewCommon" href="#mockNewCommon">var mockNewCommon</a>

```
searchKey: ui.mockNewCommon
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
### <a id="goSymbolReg" href="#goSymbolReg">var goSymbolReg</a>

```
searchKey: ui.goSymbolReg
```

```Go
var goSymbolReg = lazyregexp.New("/info/GoPackage/(.+)$")
```

### <a id="legacyDefLandingCounter" href="#legacyDefLandingCounter">var legacyDefLandingCounter</a>

```
searchKey: ui.legacyDefLandingCounter
```

```Go
var legacyDefLandingCounter = ...
```

### <a id="legacyRepoLandingCounter" href="#legacyRepoLandingCounter">var legacyRepoLandingCounter</a>

```
searchKey: ui.legacyRepoLandingCounter
```

```Go
var legacyRepoLandingCounter = ...
```

### <a id="singleLineRegexp" href="#singleLineRegexp">var singleLineRegexp</a>

```
searchKey: ui.singleLineRegexp
```

```Go
var singleLineRegexp = lazyregexp.New(`^L(\d+)(?::\d+)?$`)
```

### <a id="multiLineRangeRegexp" href="#multiLineRangeRegexp">var multiLineRangeRegexp</a>

```
searchKey: ui.multiLineRangeRegexp
```

```Go
var multiLineRangeRegexp = lazyregexp.New(`^L(\d+)(?::\d+)?-(\d+)(?::\d+)?$`)
```

### <a id="metricRawDuration" href="#metricRawDuration">var metricRawDuration</a>

```
searchKey: ui.metricRawDuration
```

```Go
var metricRawDuration = ...
```

### <a id="metricRawArchiveRunning" href="#metricRawArchiveRunning">var metricRawArchiveRunning</a>

```
searchKey: ui.metricRawArchiveRunning
```

```Go
var metricRawArchiveRunning = ...
```

### <a id="aboutRedirects" href="#aboutRedirects">var aboutRedirects</a>

```
searchKey: ui.aboutRedirects
```

```Go
var aboutRedirects = ...
```

aboutRedirects contains map entries, each of which indicates that sourcegraph.com/$KEY should redirect to about.sourcegraph.com/$VALUE. 

### <a id="mockServeRepo" href="#mockServeRepo">var mockServeRepo</a>

```
searchKey: ui.mockServeRepo
```

```Go
var mockServeRepo func(w http.ResponseWriter, r *http.Request)
```

### <a id="appHTML" href="#appHTML">var appHTML</a>

```
searchKey: ui.appHTML
```

```Go
var appHTML string
```

### <a id="errorHTML" href="#errorHTML">var errorHTML</a>

```
searchKey: ui.errorHTML
```

```Go
var errorHTML string
```

### <a id="versionCacheMu" href="#versionCacheMu">var versionCacheMu</a>

```
searchKey: ui.versionCacheMu
```

```Go
var versionCacheMu sync.RWMutex
```

### <a id="versionCache" href="#versionCache">var versionCache</a>

```
searchKey: ui.versionCache
```

```Go
var versionCache = make(map[string]string)
```

### <a id="noAssetVersionString" href="#noAssetVersionString">var noAssetVersionString</a>

```
searchKey: ui.noAssetVersionString
```

```Go
var _, noAssetVersionString = os.LookupEnv("WEBPACK_DEV_SERVER")
```

### <a id="funcMap" href="#funcMap">var funcMap</a>

```
searchKey: ui.funcMap
```

```Go
var funcMap = ...
```

Functions that are exposed to templates. 

### <a id="loadTemplateMu" href="#loadTemplateMu">var loadTemplateMu</a>

```
searchKey: ui.loadTemplateMu
```

```Go
var loadTemplateMu sync.RWMutex
```

### <a id="loadTemplateCache" href="#loadTemplateCache">var loadTemplateCache</a>

```
searchKey: ui.loadTemplateCache
```

```Go
var loadTemplateCache = map[string]*template.Template{}
```

## <a id="type" href="#type">Types</a>

### <a id="InjectedHTML" href="#InjectedHTML">type InjectedHTML struct</a>

```
searchKey: ui.InjectedHTML
tags: [exported]
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
tags: [exported]
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

### <a id="Common" href="#Common">type Common struct</a>

```
searchKey: ui.Common
tags: [exported]
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

### <a id="serveErrorHandler" href="#serveErrorHandler">type serveErrorHandler func(w net/http.ResponseWriter, r *net/http.Request, err error, statusCode int)</a>

```
searchKey: ui.serveErrorHandler
```

```Go
type serveErrorHandler func(w http.ResponseWriter, r *http.Request, err error, statusCode int)
```

serveErrorHandler is a function signature used in newCommon and mockNewCommon. This is used as syntactic sugar to prevent programmer's (fragile creatures from planet Earth) from crashing out. 

### <a id="handlerFunc" href="#handlerFunc">type handlerFunc func(w net/http.ResponseWriter, r *net/http.Request) error</a>

```
searchKey: ui.handlerFunc
```

```Go
type handlerFunc func(w http.ResponseWriter, r *http.Request) error
```

#### <a id="serveBrandedPageString" href="#serveBrandedPageString">func serveBrandedPageString(titles string, description *string) handlerFunc</a>

```
searchKey: ui.serveBrandedPageString
```

```Go
func serveBrandedPageString(titles string, description *string) handlerFunc
```

#### <a id="serveBasicPage" href="#serveBasicPage">func serveBasicPage(title func(c *Common, r *http.Request) string, description *string) handlerFunc</a>

```
searchKey: ui.serveBasicPage
```

```Go
func serveBasicPage(title func(c *Common, r *http.Request) string, description *string) handlerFunc
```

#### <a id="serveTree" href="#serveTree">func serveTree(title func(c *Common, r *http.Request) string) handlerFunc</a>

```
searchKey: ui.serveTree
```

```Go
func serveTree(title func(c *Common, r *http.Request) string) handlerFunc
```

serveTree serves the tree (directory) pages. 

#### <a id="serveRepoOrBlob" href="#serveRepoOrBlob">func serveRepoOrBlob(routeName string, title func(c *Common, r *http.Request) string) handlerFunc</a>

```
searchKey: ui.serveRepoOrBlob
```

```Go
func serveRepoOrBlob(routeName string, title func(c *Common, r *http.Request) string) handlerFunc
```

### <a id="lineRange" href="#lineRange">type lineRange struct</a>

```
searchKey: ui.lineRange
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
```

```Go
func findLineRangeInQueryParameters(queryParameters map[string][]string) *lineRange
```

#### <a id="getLineRange" href="#getLineRange">func getLineRange(value string) *lineRange</a>

```
searchKey: ui.getLineRange
```

```Go
func getLineRange(value string) *lineRange
```

### <a id="recoverError" href="#recoverError">type recoverError struct</a>

```
searchKey: ui.recoverError
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
```

```Go
func (r recoverError) Error() string
```

### <a id="pageError" href="#pageError">type pageError struct</a>

```
searchKey: ui.pageError
```

```Go
type pageError struct {
	StatusCode int    `json:"statusCode"`
	StatusText string `json:"statusText"`
	Error      string `json:"error"`
	ErrorID    string `json:"errorID"`
}
```

## <a id="func" href="#func">Functions</a>

### <a id="repoShortName" href="#repoShortName">func repoShortName(name api.RepoName) string</a>

```
searchKey: ui.repoShortName
```

```Go
func repoShortName(name api.RepoName) string
```

repoShortName trims the first path element of the given repo name if it has at least two path components. 

### <a id="serveHome" href="#serveHome">func serveHome(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.serveHome
```

```Go
func serveHome(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveSignIn" href="#serveSignIn">func serveSignIn(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.serveSignIn
```

```Go
func serveSignIn(w http.ResponseWriter, r *http.Request) error
```

### <a id="redirectTreeOrBlob" href="#redirectTreeOrBlob">func redirectTreeOrBlob(routeName, path string, common *Common, w http.ResponseWriter, r *http.Request) (requestHandled bool, err error)</a>

```
searchKey: ui.redirectTreeOrBlob
```

```Go
func redirectTreeOrBlob(routeName, path string, common *Common, w http.ResponseWriter, r *http.Request) (requestHandled bool, err error)
```

redirectTreeOrBlob redirects a blob page to a tree page if the file is actually a directory, or a tree page to a blob page if the directory is actually a file. 

### <a id="searchBadgeHandler" href="#searchBadgeHandler">func searchBadgeHandler() *httputil.ReverseProxy</a>

```
searchKey: ui.searchBadgeHandler
```

```Go
func searchBadgeHandler() *httputil.ReverseProxy
```

searchBadgeHandler serves the search readme badges from the search-badger service [https://github.com/sourcegraph/search-badger](https://github.com/sourcegraph/search-badger) 

### <a id="servePingFromSelfHosted" href="#servePingFromSelfHosted">func servePingFromSelfHosted(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.servePingFromSelfHosted
```

```Go
func servePingFromSelfHosted(w http.ResponseWriter, r *http.Request) error
```

### <a id="serveHelp" href="#serveHelp">func serveHelp(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: ui.serveHelp
```

```Go
func serveHelp(w http.ResponseWriter, r *http.Request)
```

serveHelp redirects to documentation pages on [https://docs.sourcegraph.com](https://docs.sourcegraph.com) for the current product version, i.e., /help/PATH -> [https://docs.sourcegraph.com/](https://docs.sourcegraph.com/)@VERSION/PATH. In unreleased development builds (whose docs aren't necessarily available on [https://docs.sourcegraph.com](https://docs.sourcegraph.com), it shows a message with instructions on how to see the docs.) 

### <a id="serveRepoLanding" href="#serveRepoLanding">func serveRepoLanding(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.serveRepoLanding
```

```Go
func serveRepoLanding(w http.ResponseWriter, r *http.Request) error
```

serveRepoLanding simply redirects the old (sourcegraph.com/<repo>/-/info) repo landing page URLs directly to the repo itself (sourcegraph.com/<repo>). 

### <a id="serveDefLanding" href="#serveDefLanding">func serveDefLanding(w http.ResponseWriter, r *http.Request) (err error)</a>

```
searchKey: ui.serveDefLanding
```

```Go
func serveDefLanding(w http.ResponseWriter, r *http.Request) (err error)
```

### <a id="serveDefRedirectToDefLanding" href="#serveDefRedirectToDefLanding">func serveDefRedirectToDefLanding(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: ui.serveDefRedirectToDefLanding
```

```Go
func serveDefRedirectToDefLanding(w http.ResponseWriter, r *http.Request)
```

serveDefRedirectToDefLanding redirects from /REPO/refs/... and /REPO/def/... URLs to the def landing page. Those URLs used to point to JavaScript-backed pages in the UI for a refs list and code view, respectively, but now def URLs are only for SEO (and thus those URLs are only handled by this package). 

### <a id="serveOldRouteDefLanding" href="#serveOldRouteDefLanding">func serveOldRouteDefLanding(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: ui.serveOldRouteDefLanding
```

```Go
func serveOldRouteDefLanding(w http.ResponseWriter, r *http.Request)
```

Redirect from old /land/ def landing URLs to new /info/ URLs 

### <a id="formatLineRange" href="#formatLineRange">func formatLineRange(lineRange *lineRange) string</a>

```
searchKey: ui.formatLineRange
```

```Go
func formatLineRange(lineRange *lineRange) string
```

### <a id="getBlobPreviewImageURL" href="#getBlobPreviewImageURL">func getBlobPreviewImageURL(previewServiceURL string, blobURLPath string, lineRange *lineRange) string</a>

```
searchKey: ui.getBlobPreviewImageURL
```

```Go
func getBlobPreviewImageURL(previewServiceURL string, blobURLPath string, lineRange *lineRange) string
```

### <a id="getBlobPreviewTitle" href="#getBlobPreviewTitle">func getBlobPreviewTitle(blobFilePath string, lineRange *lineRange) string</a>

```
searchKey: ui.getBlobPreviewTitle
```

```Go
func getBlobPreviewTitle(blobFilePath string, lineRange *lineRange) string
```

### <a id="serveRaw" href="#serveRaw">func serveRaw(w http.ResponseWriter, r *http.Request) (err error)</a>

```
searchKey: ui.serveRaw
```

```Go
func serveRaw(w http.ResponseWriter, r *http.Request) (err error)
```

### <a id="openArchiveReader" href="#openArchiveReader">func openArchiveReader(ctx context.Context, opts vfsutil.ArchiveOpts) (io.ReadCloser, error)</a>

```
searchKey: ui.openArchiveReader
```

```Go
func openArchiveReader(ctx context.Context, opts vfsutil.ArchiveOpts) (io.ReadCloser, error)
```

openArchiveReader runs git archive and streams the output. Note: we do not use vfsutil since most archives are just streamed once so caching locally is not useful. Additionally we transfer the output over the internet, so we use default compression levels on zips (instead of no compression). 

### <a id="Router" href="#Router">func Router() *mux.Router</a>

```
searchKey: ui.Router
tags: [exported]
```

```Go
func Router() *mux.Router
```

Router returns the router that serves pages for our web app. 

### <a id="InitRouter" href="#InitRouter">func InitRouter(db dbutil.DB)</a>

```
searchKey: ui.InitRouter
tags: [exported]
```

```Go
func InitRouter(db dbutil.DB)
```

InitRouter create the router that serves pages for our web app and assigns it to uirouter.Router. The router can be accessed by calling Router(). 

### <a id="newRouter" href="#newRouter">func newRouter() *mux.Router</a>

```
searchKey: ui.newRouter
```

```Go
func newRouter() *mux.Router
```

### <a id="brandNameSubtitle" href="#brandNameSubtitle">func brandNameSubtitle(titles ...string) string</a>

```
searchKey: ui.brandNameSubtitle
```

```Go
func brandNameSubtitle(titles ...string) string
```

brandNameSubtitle returns a string with the specified title sequence and the brand name as the last title component. This function indirectly calls conf.Get(), so should not be invoked from any function that is invoked by an init function. 

### <a id="initRouter" href="#initRouter">func initRouter(db dbutil.DB, router *mux.Router)</a>

```
searchKey: ui.initRouter
```

```Go
func initRouter(db dbutil.DB, router *mux.Router)
```

### <a id="staticRedirectHandler" href="#staticRedirectHandler">func staticRedirectHandler(u string, code int) http.Handler</a>

```
searchKey: ui.staticRedirectHandler
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
### <a id="limitString" href="#limitString">func limitString(s string, n int, ellipsis bool) string</a>

```
searchKey: ui.limitString
```

```Go
func limitString(s string, n int, ellipsis bool) string
```

limitString limits the given string to at most N characters, optionally adding an ellipsis (…) at the end. 

### <a id="handler" href="#handler">func handler(f func(w http.ResponseWriter, r *http.Request) error) http.Handler</a>

```
searchKey: ui.handler
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
### <a id="serveError" href="#serveError">func serveError(w http.ResponseWriter, r *http.Request, err error, statusCode int)</a>

```
searchKey: ui.serveError
```

```Go
func serveError(w http.ResponseWriter, r *http.Request, err error, statusCode int)
```

serveError serves the error template with the specified error message. It is assumed that the error message could accidentally contain sensitive data, and as such is only presented to the user in debug mode. 

### <a id="dangerouslyServeError" href="#dangerouslyServeError">func dangerouslyServeError(w http.ResponseWriter, r *http.Request, err error, statusCode int)</a>

```
searchKey: ui.dangerouslyServeError
```

```Go
func dangerouslyServeError(w http.ResponseWriter, r *http.Request, err error, statusCode int)
```

dangerouslyServeError is like serveError except it always shows the error to the user and as such, if it contains sensitive information, it can leak sensitive information. 

See [https://github.com/sourcegraph/sourcegraph/issues/9453](https://github.com/sourcegraph/sourcegraph/issues/9453) 

### <a id="serveErrorNoDebug" href="#serveErrorNoDebug">func serveErrorNoDebug(w http.ResponseWriter, r *http.Request, err error, statusCode int, nodebug, forceServeError bool)</a>

```
searchKey: ui.serveErrorNoDebug
```

```Go
func serveErrorNoDebug(w http.ResponseWriter, r *http.Request, err error, statusCode int, nodebug, forceServeError bool)
```

serveErrorNoDebug should not be called by anyone except serveErrorTest. 

### <a id="serveErrorTest" href="#serveErrorTest">func serveErrorTest(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: ui.serveErrorTest
```

```Go
func serveErrorTest(w http.ResponseWriter, r *http.Request) error
```

serveErrorTest makes it easy to test styling/layout of the error template by visiting: 

```
[http://localhost:3080/__errorTest?nodebug=true&error=theerror&status=500](http://localhost:3080/__errorTest?nodebug=true&error=theerror&status=500)

```
The `nodebug=true` parameter hides error messages (which is ALWAYS the case in production), `error` controls the error message text, and status controls the status code. 

### <a id="mapKeys" href="#mapKeys">func mapKeys(m map[string]string) (keys []string)</a>

```
searchKey: ui.mapKeys
```

```Go
func mapKeys(m map[string]string) (keys []string)
```

### <a id="loadTemplate" href="#loadTemplate">func loadTemplate(path string) (*template.Template, error)</a>

```
searchKey: ui.loadTemplate
```

```Go
func loadTemplate(path string) (*template.Template, error)
```

loadTemplate loads the template with the given path. Also loaded along with that template is any templates under the shared/ directory. 

### <a id="doLoadTemplate" href="#doLoadTemplate">func doLoadTemplate(path string) (*template.Template, error)</a>

```
searchKey: ui.doLoadTemplate
```

```Go
func doLoadTemplate(path string) (*template.Template, error)
```

doLoadTemplate should only be called by loadTemplate. 

### <a id="renderTemplate" href="#renderTemplate">func renderTemplate(w http.ResponseWriter, name string, data interface{}) error</a>

```
searchKey: ui.renderTemplate
```

```Go
func renderTemplate(w http.ResponseWriter, name string, data interface{}) error
```

renderTemplate renders the template with the given name. The template name is its file name, relative to the template directory. 

The given data is accessible in the template via $.Foobar 

### <a id="TestRedirects" href="#TestRedirects">func TestRedirects(t *testing.T)</a>

```
searchKey: ui.TestRedirects
```

```Go
func TestRedirects(t *testing.T)
```

### <a id="TestRepoShortName" href="#TestRepoShortName">func TestRepoShortName(t *testing.T)</a>

```
searchKey: ui.TestRepoShortName
```

```Go
func TestRepoShortName(t *testing.T)
```

### <a id="TestNewCommon_repo_error" href="#TestNewCommon_repo_error">func TestNewCommon_repo_error(t *testing.T)</a>

```
searchKey: ui.TestNewCommon_repo_error
```

```Go
func TestNewCommon_repo_error(t *testing.T)
```

### <a id="TestRedirectTreeOrBlob" href="#TestRedirectTreeOrBlob">func TestRedirectTreeOrBlob(t *testing.T)</a>

```
searchKey: ui.TestRedirectTreeOrBlob
```

```Go
func TestRedirectTreeOrBlob(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: ui.init
```

```Go
func init()
```

### <a id="TestServeHelp" href="#TestServeHelp">func TestServeHelp(t *testing.T)</a>

```
searchKey: ui.TestServeHelp
```

```Go
func TestServeHelp(t *testing.T)
```

### <a id="TestFindLineRangeInQueryParameters" href="#TestFindLineRangeInQueryParameters">func TestFindLineRangeInQueryParameters(t *testing.T)</a>

```
searchKey: ui.TestFindLineRangeInQueryParameters
```

```Go
func TestFindLineRangeInQueryParameters(t *testing.T)
```

### <a id="TestGetBlobPreviewImageURL" href="#TestGetBlobPreviewImageURL">func TestGetBlobPreviewImageURL(t *testing.T)</a>

```
searchKey: ui.TestGetBlobPreviewImageURL
```

```Go
func TestGetBlobPreviewImageURL(t *testing.T)
```

### <a id="TestGetBlobPreviewTitle" href="#TestGetBlobPreviewTitle">func TestGetBlobPreviewTitle(t *testing.T)</a>

```
searchKey: ui.TestGetBlobPreviewTitle
```

```Go
func TestGetBlobPreviewTitle(t *testing.T)
```

### <a id="initHTTPTestGitServer" href="#initHTTPTestGitServer">func initHTTPTestGitServer(t *testing.T, httpStatusCode int, resp string)</a>

```
searchKey: ui.initHTTPTestGitServer
```

```Go
func initHTTPTestGitServer(t *testing.T, httpStatusCode int, resp string)
```

initHTTPTestGitServer instantiates an httptest.Server to make it return an HTTP response as set by httpStatusCode and a body as set by resp. It also ensures that the server is closed during test cleanup, thus ensuring that the caller does not have to remember to close the server. 

Finally, initHTTPTestGitServer patches the gitserver.DefaultClient.Addrs to the URL of the test HTTP server, so that API calls to the gitserver are received by the test HTTP server. 

TL;DR: This function helps us to mock the gitserver without having to define mock functions for each of the gitserver client methods. 

### <a id="Test_serveRawWithHTTPRequestMethodHEAD" href="#Test_serveRawWithHTTPRequestMethodHEAD">func Test_serveRawWithHTTPRequestMethodHEAD(t *testing.T)</a>

```
searchKey: ui.Test_serveRawWithHTTPRequestMethodHEAD
```

```Go
func Test_serveRawWithHTTPRequestMethodHEAD(t *testing.T)
```

### <a id="Test_serveRawWithContentArchive" href="#Test_serveRawWithContentArchive">func Test_serveRawWithContentArchive(t *testing.T)</a>

```
searchKey: ui.Test_serveRawWithContentArchive
```

```Go
func Test_serveRawWithContentArchive(t *testing.T)
```

### <a id="Test_serveRawWithContentTypePlain" href="#Test_serveRawWithContentTypePlain">func Test_serveRawWithContentTypePlain(t *testing.T)</a>

```
searchKey: ui.Test_serveRawWithContentTypePlain
```

```Go
func Test_serveRawWithContentTypePlain(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: ui.init
```

```Go
func init()
```

### <a id="TestRouter" href="#TestRouter">func TestRouter(t *testing.T)</a>

```
searchKey: ui.TestRouter
```

```Go
func TestRouter(t *testing.T)
```

### <a id="TestRouter_RootPath" href="#TestRouter_RootPath">func TestRouter_RootPath(t *testing.T)</a>

```
searchKey: ui.TestRouter_RootPath
```

```Go
func TestRouter_RootPath(t *testing.T)
```

### <a id="TestLoadTemplate" href="#TestLoadTemplate">func TestLoadTemplate(t *testing.T)</a>

```
searchKey: ui.TestLoadTemplate
```

```Go
func TestLoadTemplate(t *testing.T)
```

