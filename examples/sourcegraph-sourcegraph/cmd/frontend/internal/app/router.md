# Package router

Package router contains the URL router for the frontend app. 

It is in a separate package from app so that other packages may use it to generate URLs without resulting in Go import cycles. 

## Index

* [Constants](#const)
    * [const revSuffixNoDots](#revSuffixNoDots)
    * [const RobotsTxt](#RobotsTxt)
    * [const Favicon](#Favicon)
    * [const OpenSearch](#OpenSearch)
    * [const RepoBadge](#RepoBadge)
    * [const Logout](#Logout)
    * [const SignIn](#SignIn)
    * [const SignOut](#SignOut)
    * [const SignUp](#SignUp)
    * [const SiteInit](#SiteInit)
    * [const VerifyEmail](#VerifyEmail)
    * [const ResetPasswordInit](#ResetPasswordInit)
    * [const ResetPasswordCode](#ResetPasswordCode)
    * [const CheckUsernameTaken](#CheckUsernameTaken)
    * [const RegistryExtensionBundle](#RegistryExtensionBundle)
    * [const UsageStatsDownload](#UsageStatsDownload)
    * [const LatestPing](#LatestPing)
    * [const OldToolsRedirect](#OldToolsRedirect)
    * [const OldTreeRedirect](#OldTreeRedirect)
    * [const GDDORefs](#GDDORefs)
    * [const Editor](#Editor)
    * [const Debug](#Debug)
    * [const DebugHeaders](#DebugHeaders)
    * [const GopherconLiveBlog](#GopherconLiveBlog)
    * [const GoSymbolURL](#GoSymbolURL)
    * [const UI](#UI)
* [Variables](#var)
    * [var router](#router)
* [Functions](#func)
    * [func URLToRepoTreeEntry(repo api.RepoName, rev, path string) *url.URL](#URLToRepoTreeEntry)
    * [func revStr(rev string) string](#revStr)
    * [func addOldTreeRedirectRoute(matchRouter *mux.Router)](#addOldTreeRedirectRoute)
    * [func Router() *mux.Router](#Router)
    * [func newRouter() *mux.Router](#newRouter)
    * [func TestOldTreesRedirect(t *testing.T)](#TestOldTreesRedirect)


## <a id="const" href="#const">Constants</a>

### <a id="revSuffixNoDots" href="#revSuffixNoDots">const revSuffixNoDots</a>

```
searchKey: router.revSuffixNoDots
```

```Go
const revSuffixNoDots = `{Rev:(?:@(?:(?:[^@=/.-]|(?:[^=/@.]{2,}))/)*(?:[^@=/.-]|(?:[^=/@.]{2,})))?}`
```

same as spec.unresolvedRevPattern but also not allowing path components starting with ".". 

### <a id="RobotsTxt" href="#RobotsTxt">const RobotsTxt</a>

```
searchKey: router.RobotsTxt
tags: [exported]
```

```Go
const RobotsTxt = "robots-txt"
```

### <a id="Favicon" href="#Favicon">const Favicon</a>

```
searchKey: router.Favicon
tags: [exported]
```

```Go
const Favicon = "favicon"
```

### <a id="OpenSearch" href="#OpenSearch">const OpenSearch</a>

```
searchKey: router.OpenSearch
tags: [exported]
```

```Go
const OpenSearch = "opensearch"
```

### <a id="RepoBadge" href="#RepoBadge">const RepoBadge</a>

```
searchKey: router.RepoBadge
tags: [exported]
```

```Go
const RepoBadge = "repo.badge"
```

### <a id="Logout" href="#Logout">const Logout</a>

```
searchKey: router.Logout
tags: [exported]
```

```Go
const Logout = "logout"
```

### <a id="SignIn" href="#SignIn">const SignIn</a>

```
searchKey: router.SignIn
tags: [exported]
```

```Go
const SignIn = "sign-in"
```

### <a id="SignOut" href="#SignOut">const SignOut</a>

```
searchKey: router.SignOut
tags: [exported]
```

```Go
const SignOut = "sign-out"
```

### <a id="SignUp" href="#SignUp">const SignUp</a>

```
searchKey: router.SignUp
tags: [exported]
```

```Go
const SignUp = "sign-up"
```

### <a id="SiteInit" href="#SiteInit">const SiteInit</a>

```
searchKey: router.SiteInit
tags: [exported]
```

```Go
const SiteInit = "site-init"
```

### <a id="VerifyEmail" href="#VerifyEmail">const VerifyEmail</a>

```
searchKey: router.VerifyEmail
tags: [exported]
```

```Go
const VerifyEmail = "verify-email"
```

### <a id="ResetPasswordInit" href="#ResetPasswordInit">const ResetPasswordInit</a>

```
searchKey: router.ResetPasswordInit
tags: [exported]
```

```Go
const ResetPasswordInit = "reset-password.init"
```

### <a id="ResetPasswordCode" href="#ResetPasswordCode">const ResetPasswordCode</a>

```
searchKey: router.ResetPasswordCode
tags: [exported]
```

```Go
const ResetPasswordCode = "reset-password.code"
```

### <a id="CheckUsernameTaken" href="#CheckUsernameTaken">const CheckUsernameTaken</a>

```
searchKey: router.CheckUsernameTaken
tags: [exported]
```

```Go
const CheckUsernameTaken = "check-username-taken"
```

### <a id="RegistryExtensionBundle" href="#RegistryExtensionBundle">const RegistryExtensionBundle</a>

```
searchKey: router.RegistryExtensionBundle
tags: [exported]
```

```Go
const RegistryExtensionBundle = "registry.extension.bundle"
```

### <a id="UsageStatsDownload" href="#UsageStatsDownload">const UsageStatsDownload</a>

```
searchKey: router.UsageStatsDownload
tags: [exported]
```

```Go
const UsageStatsDownload = "usage-stats.download"
```

### <a id="LatestPing" href="#LatestPing">const LatestPing</a>

```
searchKey: router.LatestPing
tags: [exported]
```

```Go
const LatestPing = "pings.latest"
```

### <a id="OldToolsRedirect" href="#OldToolsRedirect">const OldToolsRedirect</a>

```
searchKey: router.OldToolsRedirect
tags: [exported]
```

```Go
const OldToolsRedirect = "old-tools-redirect"
```

### <a id="OldTreeRedirect" href="#OldTreeRedirect">const OldTreeRedirect</a>

```
searchKey: router.OldTreeRedirect
tags: [exported]
```

```Go
const OldTreeRedirect = "old-tree-redirect"
```

### <a id="GDDORefs" href="#GDDORefs">const GDDORefs</a>

```
searchKey: router.GDDORefs
tags: [exported]
```

```Go
const GDDORefs = "gddo.refs"
```

### <a id="Editor" href="#Editor">const Editor</a>

```
searchKey: router.Editor
tags: [exported]
```

```Go
const Editor = "editor"
```

### <a id="Debug" href="#Debug">const Debug</a>

```
searchKey: router.Debug
tags: [exported]
```

```Go
const Debug = "debug"
```

### <a id="DebugHeaders" href="#DebugHeaders">const DebugHeaders</a>

```
searchKey: router.DebugHeaders
tags: [exported]
```

```Go
const DebugHeaders = "debug.headers"
```

### <a id="GopherconLiveBlog" href="#GopherconLiveBlog">const GopherconLiveBlog</a>

```
searchKey: router.GopherconLiveBlog
tags: [exported]
```

```Go
const GopherconLiveBlog = "gophercon.live.blog"
```

### <a id="GoSymbolURL" href="#GoSymbolURL">const GoSymbolURL</a>

```
searchKey: router.GoSymbolURL
tags: [exported]
```

```Go
const GoSymbolURL = "go-symbol-url"
```

### <a id="UI" href="#UI">const UI</a>

```
searchKey: router.UI
tags: [exported]
```

```Go
const UI = "ui"
```

## <a id="var" href="#var">Variables</a>

### <a id="router" href="#router">var router</a>

```
searchKey: router.router
```

```Go
var router = newRouter()
```

## <a id="func" href="#func">Functions</a>

### <a id="URLToRepoTreeEntry" href="#URLToRepoTreeEntry">func URLToRepoTreeEntry(repo api.RepoName, rev, path string) *url.URL</a>

```
searchKey: router.URLToRepoTreeEntry
tags: [exported]
```

```Go
func URLToRepoTreeEntry(repo api.RepoName, rev, path string) *url.URL
```

### <a id="revStr" href="#revStr">func revStr(rev string) string</a>

```
searchKey: router.revStr
```

```Go
func revStr(rev string) string
```

### <a id="addOldTreeRedirectRoute" href="#addOldTreeRedirectRoute">func addOldTreeRedirectRoute(matchRouter *mux.Router)</a>

```
searchKey: router.addOldTreeRedirectRoute
```

```Go
func addOldTreeRedirectRoute(matchRouter *mux.Router)
```

### <a id="Router" href="#Router">func Router() *mux.Router</a>

```
searchKey: router.Router
tags: [exported]
```

```Go
func Router() *mux.Router
```

Router returns the frontend app router. 

### <a id="newRouter" href="#newRouter">func newRouter() *mux.Router</a>

```
searchKey: router.newRouter
```

```Go
func newRouter() *mux.Router
```

### <a id="TestOldTreesRedirect" href="#TestOldTreesRedirect">func TestOldTreesRedirect(t *testing.T)</a>

```
searchKey: router.TestOldTreesRedirect
```

```Go
func TestOldTreesRedirect(t *testing.T)
```

