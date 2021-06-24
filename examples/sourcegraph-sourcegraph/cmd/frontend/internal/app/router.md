# Package router

Package router contains the URL router for the frontend app. 

It is in a separate package from app so that other packages may use it to generate URLs without resulting in Go import cycles. 

## Index

* [Constants](#const)
    * [const CheckUsernameTaken](#CheckUsernameTaken)
    * [const Debug](#Debug)
    * [const DebugHeaders](#DebugHeaders)
    * [const Editor](#Editor)
    * [const Favicon](#Favicon)
    * [const GDDORefs](#GDDORefs)
    * [const GoSymbolURL](#GoSymbolURL)
    * [const GopherconLiveBlog](#GopherconLiveBlog)
    * [const LatestPing](#LatestPing)
    * [const Logout](#Logout)
    * [const OldToolsRedirect](#OldToolsRedirect)
    * [const OldTreeRedirect](#OldTreeRedirect)
    * [const OpenSearch](#OpenSearch)
    * [const RegistryExtensionBundle](#RegistryExtensionBundle)
    * [const RepoBadge](#RepoBadge)
    * [const ResetPasswordCode](#ResetPasswordCode)
    * [const ResetPasswordInit](#ResetPasswordInit)
    * [const RobotsTxt](#RobotsTxt)
    * [const SignIn](#SignIn)
    * [const SignOut](#SignOut)
    * [const SignUp](#SignUp)
    * [const SiteInit](#SiteInit)
    * [const UI](#UI)
    * [const UsageStatsDownload](#UsageStatsDownload)
    * [const VerifyEmail](#VerifyEmail)
    * [const revSuffixNoDots](#revSuffixNoDots)
* [Variables](#var)
    * [var router](#router)
* [Functions](#func)
    * [func Router() *mux.Router](#Router)
    * [func TestOldTreesRedirect(t *testing.T)](#TestOldTreesRedirect)
    * [func URLToRepoTreeEntry(repo api.RepoName, rev, path string) *url.URL](#URLToRepoTreeEntry)
    * [func addOldTreeRedirectRoute(matchRouter *mux.Router)](#addOldTreeRedirectRoute)
    * [func newRouter() *mux.Router](#newRouter)
    * [func revStr(rev string) string](#revStr)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="CheckUsernameTaken" href="#CheckUsernameTaken">const CheckUsernameTaken</a>

```
searchKey: router.CheckUsernameTaken
tags: [constant string]
```

```Go
const CheckUsernameTaken = "check-username-taken"
```

### <a id="Debug" href="#Debug">const Debug</a>

```
searchKey: router.Debug
tags: [constant string]
```

```Go
const Debug = "debug"
```

### <a id="DebugHeaders" href="#DebugHeaders">const DebugHeaders</a>

```
searchKey: router.DebugHeaders
tags: [constant string]
```

```Go
const DebugHeaders = "debug.headers"
```

### <a id="Editor" href="#Editor">const Editor</a>

```
searchKey: router.Editor
tags: [constant string]
```

```Go
const Editor = "editor"
```

### <a id="Favicon" href="#Favicon">const Favicon</a>

```
searchKey: router.Favicon
tags: [constant string]
```

```Go
const Favicon = "favicon"
```

### <a id="GDDORefs" href="#GDDORefs">const GDDORefs</a>

```
searchKey: router.GDDORefs
tags: [constant string]
```

```Go
const GDDORefs = "gddo.refs"
```

### <a id="GoSymbolURL" href="#GoSymbolURL">const GoSymbolURL</a>

```
searchKey: router.GoSymbolURL
tags: [constant string]
```

```Go
const GoSymbolURL = "go-symbol-url"
```

### <a id="GopherconLiveBlog" href="#GopherconLiveBlog">const GopherconLiveBlog</a>

```
searchKey: router.GopherconLiveBlog
tags: [constant string]
```

```Go
const GopherconLiveBlog = "gophercon.live.blog"
```

### <a id="LatestPing" href="#LatestPing">const LatestPing</a>

```
searchKey: router.LatestPing
tags: [constant string]
```

```Go
const LatestPing = "pings.latest"
```

### <a id="Logout" href="#Logout">const Logout</a>

```
searchKey: router.Logout
tags: [constant string]
```

```Go
const Logout = "logout"
```

### <a id="OldToolsRedirect" href="#OldToolsRedirect">const OldToolsRedirect</a>

```
searchKey: router.OldToolsRedirect
tags: [constant string]
```

```Go
const OldToolsRedirect = "old-tools-redirect"
```

### <a id="OldTreeRedirect" href="#OldTreeRedirect">const OldTreeRedirect</a>

```
searchKey: router.OldTreeRedirect
tags: [constant string]
```

```Go
const OldTreeRedirect = "old-tree-redirect"
```

### <a id="OpenSearch" href="#OpenSearch">const OpenSearch</a>

```
searchKey: router.OpenSearch
tags: [constant string]
```

```Go
const OpenSearch = "opensearch"
```

### <a id="RegistryExtensionBundle" href="#RegistryExtensionBundle">const RegistryExtensionBundle</a>

```
searchKey: router.RegistryExtensionBundle
tags: [constant string]
```

```Go
const RegistryExtensionBundle = "registry.extension.bundle"
```

### <a id="RepoBadge" href="#RepoBadge">const RepoBadge</a>

```
searchKey: router.RepoBadge
tags: [constant string]
```

```Go
const RepoBadge = "repo.badge"
```

### <a id="ResetPasswordCode" href="#ResetPasswordCode">const ResetPasswordCode</a>

```
searchKey: router.ResetPasswordCode
tags: [constant string]
```

```Go
const ResetPasswordCode = "reset-password.code"
```

### <a id="ResetPasswordInit" href="#ResetPasswordInit">const ResetPasswordInit</a>

```
searchKey: router.ResetPasswordInit
tags: [constant string]
```

```Go
const ResetPasswordInit = "reset-password.init"
```

### <a id="RobotsTxt" href="#RobotsTxt">const RobotsTxt</a>

```
searchKey: router.RobotsTxt
tags: [constant string]
```

```Go
const RobotsTxt = "robots-txt"
```

### <a id="SignIn" href="#SignIn">const SignIn</a>

```
searchKey: router.SignIn
tags: [constant string]
```

```Go
const SignIn = "sign-in"
```

### <a id="SignOut" href="#SignOut">const SignOut</a>

```
searchKey: router.SignOut
tags: [constant string]
```

```Go
const SignOut = "sign-out"
```

### <a id="SignUp" href="#SignUp">const SignUp</a>

```
searchKey: router.SignUp
tags: [constant string]
```

```Go
const SignUp = "sign-up"
```

### <a id="SiteInit" href="#SiteInit">const SiteInit</a>

```
searchKey: router.SiteInit
tags: [constant string]
```

```Go
const SiteInit = "site-init"
```

### <a id="UI" href="#UI">const UI</a>

```
searchKey: router.UI
tags: [constant string]
```

```Go
const UI = "ui"
```

### <a id="UsageStatsDownload" href="#UsageStatsDownload">const UsageStatsDownload</a>

```
searchKey: router.UsageStatsDownload
tags: [constant string]
```

```Go
const UsageStatsDownload = "usage-stats.download"
```

### <a id="VerifyEmail" href="#VerifyEmail">const VerifyEmail</a>

```
searchKey: router.VerifyEmail
tags: [constant string]
```

```Go
const VerifyEmail = "verify-email"
```

### <a id="revSuffixNoDots" href="#revSuffixNoDots">const revSuffixNoDots</a>

```
searchKey: router.revSuffixNoDots
tags: [constant string private]
```

```Go
const revSuffixNoDots = `{Rev:(?:@(?:(?:[^@=/.-]|(?:[^=/@.]{2,}))/)*(?:[^@=/.-]|(?:[^=/@.]{2,})))?}`
```

same as spec.unresolvedRevPattern but also not allowing path components starting with ".". 

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="router" href="#router">var router</a>

```
searchKey: router.router
tags: [variable struct private]
```

```Go
var router = newRouter()
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Router" href="#Router">func Router() *mux.Router</a>

```
searchKey: router.Router
tags: [function]
```

```Go
func Router() *mux.Router
```

Router returns the frontend app router. 

### <a id="TestOldTreesRedirect" href="#TestOldTreesRedirect">func TestOldTreesRedirect(t *testing.T)</a>

```
searchKey: router.TestOldTreesRedirect
tags: [method private test]
```

```Go
func TestOldTreesRedirect(t *testing.T)
```

### <a id="URLToRepoTreeEntry" href="#URLToRepoTreeEntry">func URLToRepoTreeEntry(repo api.RepoName, rev, path string) *url.URL</a>

```
searchKey: router.URLToRepoTreeEntry
tags: [method]
```

```Go
func URLToRepoTreeEntry(repo api.RepoName, rev, path string) *url.URL
```

### <a id="addOldTreeRedirectRoute" href="#addOldTreeRedirectRoute">func addOldTreeRedirectRoute(matchRouter *mux.Router)</a>

```
searchKey: router.addOldTreeRedirectRoute
tags: [method private]
```

```Go
func addOldTreeRedirectRoute(matchRouter *mux.Router)
```

### <a id="newRouter" href="#newRouter">func newRouter() *mux.Router</a>

```
searchKey: router.newRouter
tags: [function private]
```

```Go
func newRouter() *mux.Router
```

### <a id="revStr" href="#revStr">func revStr(rev string) string</a>

```
searchKey: router.revStr
tags: [method private]
```

```Go
func revStr(rev string) string
```

