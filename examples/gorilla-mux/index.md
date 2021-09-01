# Package mux

Package mux implements a request router and dispatcher. 

The name mux stands for "HTTP request multiplexer". Like the standard http.ServeMux, mux.Router matches incoming requests against a list of registered routes and calls a handler for the route that matches the URL or other conditions. The main features are: 

```
* Requests can be matched based on URL host, path, path prefix, schemes,
  header and query values, HTTP methods or using custom matchers.
* URL hosts, paths and query values can have variables with an optional
  regular expression.
* Registered URLs can be built, or "reversed", which helps maintaining
  references to resources.
* Routes can be used as subrouters: nested routes are only tested if the
  parent route matches. This is useful to define groups of routes that
  share common conditions like a host, a path prefix or other repeated
  attributes. As a bonus, this optimizes request matching.
* It implements the http.Handler interface so it is compatible with the
  standard http.ServeMux.

```
Let's start registering a couple of URL paths and handlers: 

```
func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", HomeHandler)
	r.HandleFunc("/products", ProductsHandler)
	r.HandleFunc("/articles", ArticlesHandler)
	http.Handle("/", r)
}

```
Here we register three routes mapping URL paths to handlers. This is equivalent to how http.HandleFunc() works: if an incoming request URL matches one of the paths, the corresponding handler is called passing (http.ResponseWriter, *http.Request) as parameters. 

Paths can have variables. They are defined using the format {name} or {name:pattern}. If a regular expression pattern is not defined, the matched variable will be anything until the next slash. For example: 

```
r := mux.NewRouter()
r.HandleFunc("/products/{key}", ProductHandler)
r.HandleFunc("/articles/{category}/", ArticlesCategoryHandler)
r.HandleFunc("/articles/{category}/{id:[0-9]+}", ArticleHandler)

```
Groups can be used inside patterns, as long as they are non-capturing (?:re). For example: 

```
r.HandleFunc("/articles/{category}/{sort:(?:asc|desc|new)}", ArticlesCategoryHandler)

```
The names are used to create a map of route variables which can be retrieved calling mux.Vars(): 

```
vars := mux.Vars(request)
category := vars["category"]

```
Note that if any capturing groups are present, mux will panic() during parsing. To prevent this, convert any capturing groups to non-capturing, e.g. change "/{sort:(asc|desc)}" to "/{sort:(?:asc|desc)}". This is a change from prior versions which behaved unpredictably when capturing groups were present. 

And this is all you need to know about the basic usage. More advanced options are explained below. 

Routes can also be restricted to a domain or subdomain. Just define a host pattern to be matched. They can also have variables: 

```
r := mux.NewRouter()
// Only matches if domain is "www.example.com".
r.Host("www.example.com")
// Matches a dynamic subdomain.
r.Host("{subdomain:[a-z]+}.domain.com")

```
There are several other matchers that can be added. To match path prefixes: 

```
r.PathPrefix("/products/")

```
...or HTTP methods: 

```
r.Methods("GET", "POST")

```
...or URL schemes: 

```
r.Schemes("https")

```
...or header values: 

```
r.Headers("X-Requested-With", "XMLHttpRequest")

```
...or query values: 

```
r.Queries("key", "value")

```
...or to use a custom matcher function: 

```
r.MatcherFunc(func(r *http.Request, rm *RouteMatch) bool {
	return r.ProtoMajor == 0
})

```
...and finally, it is possible to combine several matchers in a single route: 

```
r.HandleFunc("/products", ProductsHandler).
  Host("www.example.com").
  Methods("GET").
  Schemes("http")

```
Setting the same matching conditions again and again can be boring, so we have a way to group several routes that share the same requirements. We call it "subrouting". 

For example, let's say we have several URLs that should only match when the host is "www.example.com". Create a route for that host and get a "subrouter" from it: 

```
r := mux.NewRouter()
s := r.Host("www.example.com").Subrouter()

```
Then register routes in the subrouter: 

```
s.HandleFunc("/products/", ProductsHandler)
s.HandleFunc("/products/{key}", ProductHandler)
s.HandleFunc("/articles/{category}/{id:[0-9]+}"), ArticleHandler)

```
The three URL paths we registered above will only be tested if the domain is "www.example.com", because the subrouter is tested first. This is not only convenient, but also optimizes request matching. You can create subrouters combining any attribute matchers accepted by a route. 

Subrouters can be used to create domain or path "namespaces": you define subrouters in a central place and then parts of the app can register its paths relatively to a given subrouter. 

There's one more thing about subroutes. When a subrouter has a path prefix, the inner routes use it as base for their paths: 

```
r := mux.NewRouter()
s := r.PathPrefix("/products").Subrouter()
// "/products/"
s.HandleFunc("/", ProductsHandler)
// "/products/{key}/"
s.HandleFunc("/{key}/", ProductHandler)
// "/products/{key}/details"
s.HandleFunc("/{key}/details", ProductDetailsHandler)

```
Note that the path provided to PathPrefix() represents a "wildcard": calling PathPrefix("/static/").Handler(...) means that the handler will be passed any request that matches "/static/*". This makes it easy to serve static files with mux: 

```
func main() {
	var dir string

	flag.StringVar(&dir, "dir", ".", "the directory to serve files from. Defaults to the current dir")
	flag.Parse()
	r := mux.NewRouter()

	// This will serve files under [http://localhost:8000/static/](http://localhost:8000/static/)<filename>
	r.PathPrefix("/static/").Handler(http.StripPrefix("/static/", http.FileServer(http.Dir(dir))))

	srv := &http.Server{
		Handler:      r,
		Addr:         "127.0.0.1:8000",
		// Good practice: enforce timeouts for servers you create!
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Fatal(srv.ListenAndServe())
}

```
Now let's see how to build registered URLs. 

Routes can be named. All routes that define a name can have their URLs built, or "reversed". We define a name calling Name() on a route. For example: 

```
r := mux.NewRouter()
r.HandleFunc("/articles/{category}/{id:[0-9]+}", ArticleHandler).
  Name("article")

```
To build a URL, get the route and call the URL() method, passing a sequence of key/value pairs for the route variables. For the previous route, we would do: 

```
url, err := r.Get("article").URL("category", "technology", "id", "42")

```
...and the result will be a url.URL with the following path: 

```
"/articles/technology/42"

```
This also works for host and query value variables: 

```
r := mux.NewRouter()
r.Host("{subdomain}.domain.com").
  Path("/articles/{category}/{id:[0-9]+}").
  Queries("filter", "{filter}").
  HandlerFunc(ArticleHandler).
  Name("article")

// url.String() will be "[http://news.domain.com/articles/technology/42?filter=gorilla](http://news.domain.com/articles/technology/42?filter=gorilla)"
url, err := r.Get("article").URL("subdomain", "news",
                                 "category", "technology",
                                 "id", "42",
                                 "filter", "gorilla")

```
All variables defined in the route are required, and their values must conform to the corresponding patterns. These requirements guarantee that a generated URL will always match a registered route -- the only exception is for explicitly defined "build-only" routes which never match. 

Regex support also exists for matching Headers within a route. For example, we could do: 

```
r.HeadersRegexp("Content-Type", "application/(text|json)")

```
...and the route will match both requests with a Content-Type of `application/json` as well as `application/text` 

There's also a way to build only the URL host or path for a route: use the methods URLHost() or URLPath() instead. For the previous route, we would do: 

```
// "[http://news.domain.com/](http://news.domain.com/)"
host, err := r.Get("article").URLHost("subdomain", "news")

// "/articles/technology/42"
path, err := r.Get("article").URLPath("category", "technology", "id", "42")

```
And if you use subrouters, host and path defined separately can be built as well: 

```
r := mux.NewRouter()
s := r.Host("{subdomain}.domain.com").Subrouter()
s.Path("/articles/{category}/{id:[0-9]+}").
  HandlerFunc(ArticleHandler).
  Name("article")

// "[http://news.domain.com/articles/technology/42](http://news.domain.com/articles/technology/42)"
url, err := r.Get("article").URL("subdomain", "news",
                                 "category", "technology",
                                 "id", "42")

```
Mux supports the addition of middlewares to a Router, which are executed in the order they are added if a match is found, including its subrouters. Middlewares are (typically) small pieces of code which take one request, do something with it, and pass it down to another middleware or the final handler. Some common use cases for middleware are request logging, header manipulation, or ResponseWriter hijacking. 

```
type MiddlewareFunc func(http.Handler) http.Handler

```
Typically, the returned handler is a closure which does something with the http.ResponseWriter and http.Request passed to it, and then calls the handler passed as parameter to the MiddlewareFunc (closures can access variables from the context where they are created). 

A very basic middleware which logs the URI of the request being handled could be written as: 

```
func simpleMw(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// Do stuff here
		log.Println(r.RequestURI)
		// Call the next handler, which can be another middleware in the chain, or the final handler.
		next.ServeHTTP(w, r)
	})
}

```
Middlewares can be added to a router using `Router.Use()`: 

```
r := mux.NewRouter()
r.HandleFunc("/", handler)
r.Use(simpleMw)

```
A more complex authentication middleware, which maps session token to users, could be written as: 

```
// Define our struct
type authenticationMiddleware struct {
	tokenUsers map[string]string
}

// Initialize it somewhere
func (amw *authenticationMiddleware) Populate() {
	amw.tokenUsers["00000000"] = "user0"
	amw.tokenUsers["aaaaaaaa"] = "userA"
	amw.tokenUsers["05f717e5"] = "randomUser"
	amw.tokenUsers["deadbeef"] = "user0"
}

// Middleware function, which will be called for each request
func (amw *authenticationMiddleware) Middleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		token := r.Header.Get("X-Session-Token")

		if user, found := amw.tokenUsers[token]; found {
			// We found the token in our map
			log.Printf("Authenticated user %s\n", user)
			next.ServeHTTP(w, r)
		} else {
			http.Error(w, "Forbidden", http.StatusForbidden)
		}
	})
}

r := mux.NewRouter()
r.HandleFunc("/", handler)

amw := authenticationMiddleware{tokenUsers: make(map[string]string)}
amw.Populate()

r.Use(amw.Middleware)

```
Note: The handler chain will be stopped if your middleware doesn't call `next.ServeHTTP()` with the corresponding parameters. This can be used to abort a request if the middleware writer wants to. 

## Index

* Subpages
  * [mux_test](mux_test.md)
* [Constants](#const)
    * [const regexpTypeHost](#regexpTypeHost)
    * [const regexpTypePath](#regexpTypePath)
    * [const regexpTypePrefix](#regexpTypePrefix)
    * [const regexpTypeQuery](#regexpTypeQuery)
    * [const routeKey](#routeKey)
    * [const varsKey](#varsKey)
* [Variables](#var)
    * [var ErrMethodMismatch](#ErrMethodMismatch)
    * [var ErrNotFound](#ErrNotFound)
    * [var SkipRouter](#SkipRouter)
    * [var headerMatcherTests](#headerMatcherTests)
    * [var hostMatcherTests](#hostMatcherTests)
    * [var methodMatcherTests](#methodMatcherTests)
    * [var pathMatcherTests](#pathMatcherTests)
    * [var schemeMatcherTests](#schemeMatcherTests)
    * [var urlBuildingTests](#urlBuildingTests)
* [Types](#type)
    * [type BuildVarsFunc func(map[string]string) map[string]string](#BuildVarsFunc)
    * [type MatcherFunc func(*net/http.Request, *github.com/gorilla/mux.RouteMatch) bool](#MatcherFunc)
        * [func (m MatcherFunc) Match(r *http.Request, match *RouteMatch) bool](#MatcherFunc.Match)
    * [type MiddlewareFunc func(net/http.Handler) net/http.Handler](#MiddlewareFunc)
        * [func CORSMethodMiddleware(r *Router) MiddlewareFunc](#CORSMethodMiddleware)
        * [func (mw MiddlewareFunc) Middleware(handler http.Handler) http.Handler](#MiddlewareFunc.Middleware)
    * [type ResponseRecorder struct](#ResponseRecorder)
        * [func NewRecorder() *ResponseRecorder](#NewRecorder)
        * [func (rw *ResponseRecorder) Flush()](#ResponseRecorder.Flush)
        * [func (rw *ResponseRecorder) Header() http.Header](#ResponseRecorder.Header)
        * [func (rw *ResponseRecorder) Write(buf []byte) (int, error)](#ResponseRecorder.Write)
        * [func (rw *ResponseRecorder) WriteHeader(code int)](#ResponseRecorder.WriteHeader)
    * [type Route struct](#Route)
        * [func CurrentRoute(r *http.Request) *Route](#CurrentRoute)
        * [func (r *Route) BuildOnly() *Route](#Route.BuildOnly)
        * [func (r *Route) BuildVarsFunc(f BuildVarsFunc) *Route](#Route.BuildVarsFunc)
        * [func (r *Route) GetError() error](#Route.GetError)
        * [func (r *Route) GetHandler() http.Handler](#Route.GetHandler)
        * [func (r *Route) GetHostTemplate() (string, error)](#Route.GetHostTemplate)
        * [func (r *Route) GetMethods() ([]string, error)](#Route.GetMethods)
        * [func (r *Route) GetName() string](#Route.GetName)
        * [func (r *Route) GetPathRegexp() (string, error)](#Route.GetPathRegexp)
        * [func (r *Route) GetPathTemplate() (string, error)](#Route.GetPathTemplate)
        * [func (r *Route) GetQueriesRegexp() ([]string, error)](#Route.GetQueriesRegexp)
        * [func (r *Route) GetQueriesTemplates() ([]string, error)](#Route.GetQueriesTemplates)
        * [func (r *Route) GoString() string](#Route.GoString)
        * [func (r *Route) Handler(handler http.Handler) *Route](#Route.Handler)
        * [func (r *Route) HandlerFunc(f func(http.ResponseWriter, *http.Request)) *Route](#Route.HandlerFunc)
        * [func (r *Route) Headers(pairs ...string) *Route](#Route.Headers)
        * [func (r *Route) HeadersRegexp(pairs ...string) *Route](#Route.HeadersRegexp)
        * [func (r *Route) Host(tpl string) *Route](#Route.Host)
        * [func (r *Route) Match(req *http.Request, match *RouteMatch) bool](#Route.Match)
        * [func (r *Route) MatcherFunc(f MatcherFunc) *Route](#Route.MatcherFunc)
        * [func (r *Route) Methods(methods ...string) *Route](#Route.Methods)
        * [func (r *Route) Name(name string) *Route](#Route.Name)
        * [func (r *Route) Path(tpl string) *Route](#Route.Path)
        * [func (r *Route) PathPrefix(tpl string) *Route](#Route.PathPrefix)
        * [func (r *Route) Queries(pairs ...string) *Route](#Route.Queries)
        * [func (r *Route) Schemes(schemes ...string) *Route](#Route.Schemes)
        * [func (r *Route) SkipClean() bool](#Route.SkipClean)
        * [func (r *Route) Subrouter() *Router](#Route.Subrouter)
        * [func (r *Route) URL(pairs ...string) (*url.URL, error)](#Route.URL)
        * [func (r *Route) URLHost(pairs ...string) (*url.URL, error)](#Route.URLHost)
        * [func (r *Route) URLPath(pairs ...string) (*url.URL, error)](#Route.URLPath)
        * [func (r *Route) addMatcher(m matcher) *Route](#Route.addMatcher)
        * [func (r *Route) addRegexpMatcher(tpl string, typ regexpType) error](#Route.addRegexpMatcher)
        * [func (r *Route) buildVars(m map[string]string) map[string]string](#Route.buildVars)
        * [func (r *Route) prepareVars(pairs ...string) (map[string]string, error)](#Route.prepareVars)
    * [type RouteMatch struct](#RouteMatch)
    * [type Router struct](#Router)
        * [func NewRouter() *Router](#NewRouter)
        * [func (r *Router) BuildVarsFunc(f BuildVarsFunc) *Route](#Router.BuildVarsFunc)
        * [func (r *Router) Get(name string) *Route](#Router.Get)
        * [func (r *Router) GetRoute(name string) *Route](#Router.GetRoute)
        * [func (r *Router) Handle(path string, handler http.Handler) *Route](#Router.Handle)
        * [func (r *Router) HandleFunc(path string, f func(http.ResponseWriter,...](#Router.HandleFunc)
        * [func (r *Router) Headers(pairs ...string) *Route](#Router.Headers)
        * [func (r *Router) Host(tpl string) *Route](#Router.Host)
        * [func (r *Router) Match(req *http.Request, match *RouteMatch) bool](#Router.Match)
        * [func (r *Router) MatcherFunc(f MatcherFunc) *Route](#Router.MatcherFunc)
        * [func (r *Router) Methods(methods ...string) *Route](#Router.Methods)
        * [func (r *Router) Name(name string) *Route](#Router.Name)
        * [func (r *Router) NewRoute() *Route](#Router.NewRoute)
        * [func (r *Router) Path(tpl string) *Route](#Router.Path)
        * [func (r *Router) PathPrefix(tpl string) *Route](#Router.PathPrefix)
        * [func (r *Router) Queries(pairs ...string) *Route](#Router.Queries)
        * [func (r *Router) Schemes(schemes ...string) *Route](#Router.Schemes)
        * [func (r *Router) ServeHTTP(w http.ResponseWriter, req *http.Request)](#Router.ServeHTTP)
        * [func (r *Router) SkipClean(value bool) *Router](#Router.SkipClean)
        * [func (r *Router) StrictSlash(value bool) *Router](#Router.StrictSlash)
        * [func (r *Router) Use(mwf ...MiddlewareFunc)](#Router.Use)
        * [func (r *Router) UseEncodedPath() *Router](#Router.UseEncodedPath)
        * [func (r *Router) Walk(walkFn WalkFunc) error](#Router.Walk)
        * [func (r *Router) useInterface(mw middleware)](#Router.useInterface)
        * [func (r *Router) walk(walkFn WalkFunc, ancestors []*Route) error](#Router.walk)
    * [type TestA301ResponseWriter struct](#TestA301ResponseWriter)
        * [func (ho *TestA301ResponseWriter) Header() http.Header](#TestA301ResponseWriter.Header)
        * [func (ho *TestA301ResponseWriter) Write(b []byte) (int, error)](#TestA301ResponseWriter.Write)
        * [func (ho *TestA301ResponseWriter) WriteHeader(code int)](#TestA301ResponseWriter.WriteHeader)
    * [type WalkFunc func(route *github.com/gorilla/mux.Route, router *github.com/gorilla/mux.Router, ancestors []*github.com/gorilla/mux.Route) error](#WalkFunc)
    * [type contextKey int](#contextKey)
    * [type customMethodNotAllowedHandler struct](#customMethodNotAllowedHandler)
        * [func (h customMethodNotAllowedHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)](#customMethodNotAllowedHandler.ServeHTTP)
    * [type headerMatcher map[string]string](#headerMatcher)
        * [func (m headerMatcher) Match(r *http.Request, match *RouteMatch) bool](#headerMatcher.Match)
    * [type headerMatcherTest struct](#headerMatcherTest)
    * [type headerRegexMatcher map[string]*regexp.Regexp](#headerRegexMatcher)
        * [func (m headerRegexMatcher) Match(r *http.Request, match *RouteMatch) bool](#headerRegexMatcher.Match)
    * [type hostMatcherTest struct](#hostMatcherTest)
    * [type matcher interface](#matcher)
    * [type methodMatcher []string](#methodMatcher)
        * [func (m methodMatcher) Match(r *http.Request, match *RouteMatch) bool](#methodMatcher.Match)
    * [type methodMatcherTest struct](#methodMatcherTest)
    * [type methodsSubrouterTest struct](#methodsSubrouterTest)
    * [type middleware interface](#middleware)
    * [type pathMatcherTest struct](#pathMatcherTest)
    * [type regexpType int](#regexpType)
    * [type routeConf struct](#routeConf)
        * [func copyRouteConf(r routeConf) routeConf](#copyRouteConf)
    * [type routeRegexp struct](#routeRegexp)
        * [func copyRouteRegexp(r *routeRegexp) *routeRegexp](#copyRouteRegexp)
        * [func newRouteRegexp(tpl string, typ regexpType, options routeRegexpOptions) (*routeRegexp, error)](#newRouteRegexp)
        * [func (r *routeRegexp) GoString() string](#routeRegexp.GoString)
        * [func (r *routeRegexp) Match(req *http.Request, match *RouteMatch) bool](#routeRegexp.Match)
        * [func (r *routeRegexp) getURLQuery(req *http.Request) string](#routeRegexp.getURLQuery)
        * [func (r *routeRegexp) matchQueryString(req *http.Request) bool](#routeRegexp.matchQueryString)
        * [func (r *routeRegexp) url(values map[string]string) (string, error)](#routeRegexp.url)
    * [type routeRegexpGroup struct](#routeRegexpGroup)
        * [func (v routeRegexpGroup) setMatch(req *http.Request, m *RouteMatch, r *Route)](#routeRegexpGroup.setMatch)
    * [type routeRegexpOptions struct](#routeRegexpOptions)
    * [type routeTest struct](#routeTest)
    * [type schemeMatcher []string](#schemeMatcher)
        * [func (m schemeMatcher) Match(r *http.Request, match *RouteMatch) bool](#schemeMatcher.Match)
    * [type schemeMatcherTest struct](#schemeMatcherTest)
    * [type testMiddleware struct](#testMiddleware)
        * [func (tm *testMiddleware) Middleware(h http.Handler) http.Handler](#testMiddleware.Middleware)
    * [type urlBuildingTest struct](#urlBuildingTest)
* [Functions](#func)
    * [func BenchmarkManyPathVariables(b *testing.B)](#BenchmarkManyPathVariables)
    * [func BenchmarkMux(b *testing.B)](#BenchmarkMux)
    * [func BenchmarkMuxAlternativeInRegexp(b *testing.B)](#BenchmarkMuxAlternativeInRegexp)
    * [func Benchmark_findQueryKey(b *testing.B)](#Benchmark_findQueryKey)
    * [func Benchmark_findQueryKeyGoLib(b *testing.B)](#Benchmark_findQueryKeyGoLib)
    * [func ExampleSetURLVars()](#ExampleSetURLVars)
    * [func SetURLVars(r *http.Request, val map[string]string) *http.Request](#SetURLVars)
    * [func Test301Redirect(t *testing.T)](#Test301Redirect)
    * [func TestBuildVarsFunc(t *testing.T)](#TestBuildVarsFunc)
    * [func TestCORSMethodMiddleware(t *testing.T)](#TestCORSMethodMiddleware)
    * [func TestCORSMethodMiddlewareSubrouter(t *testing.T)](#TestCORSMethodMiddlewareSubrouter)
    * [func TestContextMiddleware(t *testing.T)](#TestContextMiddleware)
    * [func TestErrMatchNotFound(t *testing.T)](#TestErrMatchNotFound)
    * [func TestHeaderMatcher(t *testing.T)](#TestHeaderMatcher)
    * [func TestHeaders(t *testing.T)](#TestHeaders)
    * [func TestHost(t *testing.T)](#TestHost)
    * [func TestHostMatcher(t *testing.T)](#TestHostMatcher)
    * [func TestMatchedRouteName(t *testing.T)](#TestMatchedRouteName)
    * [func TestMatcherFunc(t *testing.T)](#TestMatcherFunc)
    * [func TestMethodMatcher(t *testing.T)](#TestMethodMatcher)
    * [func TestMethodNotAllowed(t *testing.T)](#TestMethodNotAllowed)
    * [func TestMethods(t *testing.T)](#TestMethods)
    * [func TestMethodsSubrouterCatchall(t *testing.T)](#TestMethodsSubrouterCatchall)
    * [func TestMethodsSubrouterPathPrefix(t *testing.T)](#TestMethodsSubrouterPathPrefix)
    * [func TestMethodsSubrouterPathVariable(t *testing.T)](#TestMethodsSubrouterPathVariable)
    * [func TestMethodsSubrouterStrictSlash(t *testing.T)](#TestMethodsSubrouterStrictSlash)
    * [func TestMethodsSubrouterSubrouter(t *testing.T)](#TestMethodsSubrouterSubrouter)
    * [func TestMiddleware(t *testing.T)](#TestMiddleware)
    * [func TestMiddlewareAdd(t *testing.T)](#TestMiddlewareAdd)
    * [func TestMiddlewareExecution(t *testing.T)](#TestMiddlewareExecution)
    * [func TestMiddlewareMethodMismatch(t *testing.T)](#TestMiddlewareMethodMismatch)
    * [func TestMiddlewareMethodMismatchSubrouter(t *testing.T)](#TestMiddlewareMethodMismatchSubrouter)
    * [func TestMiddlewareNotFound(t *testing.T)](#TestMiddlewareNotFound)
    * [func TestMiddlewareNotFoundSubrouter(t *testing.T)](#TestMiddlewareNotFoundSubrouter)
    * [func TestMiddlewareOnMultiSubrouter(t *testing.T)](#TestMiddlewareOnMultiSubrouter)
    * [func TestMiddlewareSubrouter(t *testing.T)](#TestMiddlewareSubrouter)
    * [func TestNameMultipleCalls(t *testing.T)](#TestNameMultipleCalls)
    * [func TestNamedRoutes(t *testing.T)](#TestNamedRoutes)
    * [func TestNewRegexp(t *testing.T)](#TestNewRegexp)
    * [func TestNoMatchMethodErrorHandler(t *testing.T)](#TestNoMatchMethodErrorHandler)
    * [func TestPanicOnCapturingGroups(t *testing.T)](#TestPanicOnCapturingGroups)
    * [func TestPath(t *testing.T)](#TestPath)
    * [func TestPathMatcher(t *testing.T)](#TestPathMatcher)
    * [func TestPathPrefix(t *testing.T)](#TestPathPrefix)
    * [func TestQueries(t *testing.T)](#TestQueries)
    * [func TestRedirectSlash(t *testing.T)](#TestRedirectSlash)
    * [func TestRouteMatchers(t *testing.T)](#TestRouteMatchers)
    * [func TestSchemeHostPath(t *testing.T)](#TestSchemeHostPath)
    * [func TestSchemeMatcher(t *testing.T)](#TestSchemeMatcher)
    * [func TestSchemeMatchers(t *testing.T)](#TestSchemeMatchers)
    * [func TestSchemes(t *testing.T)](#TestSchemes)
    * [func TestSkipClean(t *testing.T)](#TestSkipClean)
    * [func TestStrictSlash(t *testing.T)](#TestStrictSlash)
    * [func TestSubRouter(t *testing.T)](#TestSubRouter)
    * [func TestSubRouting(t *testing.T)](#TestSubRouting)
    * [func TestSubrouterCustomMethodNotAllowed(t *testing.T)](#TestSubrouterCustomMethodNotAllowed)
    * [func TestSubrouterErrorHandling(t *testing.T)](#TestSubrouterErrorHandling)
    * [func TestSubrouterHeader(t *testing.T)](#TestSubrouterHeader)
    * [func TestSubrouterMatching(t *testing.T)](#TestSubrouterMatching)
    * [func TestSubrouterNotFound(t *testing.T)](#TestSubrouterNotFound)
    * [func TestUrlBuilding(t *testing.T)](#TestUrlBuilding)
    * [func TestUseEncodedPath(t *testing.T)](#TestUseEncodedPath)
    * [func TestVariableNames(t *testing.T)](#TestVariableNames)
    * [func TestWalkErrorHandler(t *testing.T)](#TestWalkErrorHandler)
    * [func TestWalkErrorMatcher(t *testing.T)](#TestWalkErrorMatcher)
    * [func TestWalkErrorRoute(t *testing.T)](#TestWalkErrorRoute)
    * [func TestWalkNested(t *testing.T)](#TestWalkNested)
    * [func TestWalkSingleDepth(t *testing.T)](#TestWalkSingleDepth)
    * [func TestWalkSubrouters(t *testing.T)](#TestWalkSubrouters)
    * [func Test_copyRouteConf(t *testing.T)](#Test_copyRouteConf)
    * [func Test_findFirstQueryKey(t *testing.T)](#Test_findFirstQueryKey)
    * [func Vars(r *http.Request) map[string]string](#Vars)
    * [func braceIndices(s string) ([]int, error)](#braceIndices)
    * [func checkPairs(pairs ...string) (int, error)](#checkPairs)
    * [func cleanPath(p string) string](#cleanPath)
    * [func dummyHandler(w http.ResponseWriter, r *http.Request)](#dummyHandler)
    * [func extractVars(input string, matches []int, names []string, output map[string]string)](#extractVars)
    * [func findFirstQueryKey(rawQuery, key string) (value string, ok bool)](#findFirstQueryKey)
    * [func getAllMethodsForRoute(r *Router, req *http.Request) ([]string, error)](#getAllMethodsForRoute)
    * [func getHost(r *http.Request) string](#getHost)
    * [func getRouteTemplate(route *Route) string](#getRouteTemplate)
    * [func mapFromPairsToRegex(pairs ...string) (map[string]*regexp.Regexp, error)](#mapFromPairsToRegex)
    * [func mapFromPairsToString(pairs ...string) (map[string]string, error)](#mapFromPairsToString)
    * [func mapToPairs(m map[string]string) []string](#mapToPairs)
    * [func matchInArray(arr []string, value string) bool](#matchInArray)
    * [func matchMapWithRegex(toCheck map[string]*regexp.Regexp, toMatch map[string][]string, canonicalKey bool) bool](#matchMapWithRegex)
    * [func matchMapWithString(toCheck map[string]string, toMatch map[string][]string, canonicalKey bool) bool](#matchMapWithString)
    * [func methodHandler(method string) http.HandlerFunc](#methodHandler)
    * [func methodNotAllowed(w http.ResponseWriter, r *http.Request)](#methodNotAllowed)
    * [func methodNotAllowedHandler() http.Handler](#methodNotAllowedHandler)
    * [func newRequest(method, url string) *http.Request](#newRequest)
    * [func newRequestHost(method, url, host string) *http.Request](#newRequestHost)
    * [func newRequestWithHeaders(method, url string, headers ...string) *http.Request](#newRequestWithHeaders)
    * [func requestWithRoute(r *http.Request, route *Route) *http.Request](#requestWithRoute)
    * [func requestWithVars(r *http.Request, vars map[string]string) *http.Request](#requestWithVars)
    * [func stringHandler(s string) http.HandlerFunc](#stringHandler)
    * [func stringMapEqual(m1, m2 map[string]string) bool](#stringMapEqual)
    * [func testMethods(t *testing.T, test routeTest)](#testMethods)
    * [func testMethodsSubrouter(t *testing.T, test methodsSubrouterTest)](#testMethodsSubrouter)
    * [func testQueriesRegexp(t *testing.T, test routeTest)](#testQueriesRegexp)
    * [func testQueriesTemplates(t *testing.T, test routeTest)](#testQueriesTemplates)
    * [func testRegexp(t *testing.T, test routeTest)](#testRegexp)
    * [func testRoute(t *testing.T, test routeTest)](#testRoute)
    * [func testTemplate(t *testing.T, test routeTest)](#testTemplate)
    * [func testUseEscapedRoute(t *testing.T, test routeTest)](#testUseEscapedRoute)
    * [func uniqueVars(s1, s2 []string) error](#uniqueVars)
    * [func varGroupName(idx int) string](#varGroupName)


## <a id="const" href="#const">Constants</a>

### <a id="regexpTypeHost" href="#regexpTypeHost">const regexpTypeHost</a>

```
searchKey: mux.regexpTypeHost
tags: [constant number private]
```

```Go
const regexpTypeHost regexpType = 1
```

### <a id="regexpTypePath" href="#regexpTypePath">const regexpTypePath</a>

```
searchKey: mux.regexpTypePath
tags: [constant number private]
```

```Go
const regexpTypePath regexpType = 0
```

### <a id="regexpTypePrefix" href="#regexpTypePrefix">const regexpTypePrefix</a>

```
searchKey: mux.regexpTypePrefix
tags: [constant number private]
```

```Go
const regexpTypePrefix regexpType = 2
```

### <a id="regexpTypeQuery" href="#regexpTypeQuery">const regexpTypeQuery</a>

```
searchKey: mux.regexpTypeQuery
tags: [constant number private]
```

```Go
const regexpTypeQuery regexpType = 3
```

### <a id="routeKey" href="#routeKey">const routeKey</a>

```
searchKey: mux.routeKey
tags: [constant number private]
```

```Go
const routeKey
```

### <a id="varsKey" href="#varsKey">const varsKey</a>

```
searchKey: mux.varsKey
tags: [constant number private]
```

```Go
const varsKey contextKey = iota
```

## <a id="var" href="#var">Variables</a>

### <a id="ErrMethodMismatch" href="#ErrMethodMismatch">var ErrMethodMismatch</a>

```
searchKey: mux.ErrMethodMismatch
tags: [variable interface]
```

```Go
var ErrMethodMismatch = errors.New("method is not allowed")
```

ErrMethodMismatch is returned when the method in the request does not match the method defined against the route. 

### <a id="ErrNotFound" href="#ErrNotFound">var ErrNotFound</a>

```
searchKey: mux.ErrNotFound
tags: [variable interface]
```

```Go
var ErrNotFound = errors.New("no matching route was found")
```

ErrNotFound is returned when no route match is found. 

### <a id="SkipRouter" href="#SkipRouter">var SkipRouter</a>

```
searchKey: mux.SkipRouter
tags: [variable interface]
```

```Go
var SkipRouter = errors.New("skip this router")
```

SkipRouter is used as a return value from WalkFuncs to indicate that the router that walk is about to descend down to should be skipped. 

### <a id="headerMatcherTests" href="#headerMatcherTests">var headerMatcherTests</a>

```
searchKey: mux.headerMatcherTests
tags: [variable array struct private]
```

```Go
var headerMatcherTests = ...
```

### <a id="hostMatcherTests" href="#hostMatcherTests">var hostMatcherTests</a>

```
searchKey: mux.hostMatcherTests
tags: [variable array struct private]
```

```Go
var hostMatcherTests = ...
```

### <a id="methodMatcherTests" href="#methodMatcherTests">var methodMatcherTests</a>

```
searchKey: mux.methodMatcherTests
tags: [variable array struct private]
```

```Go
var methodMatcherTests = ...
```

### <a id="pathMatcherTests" href="#pathMatcherTests">var pathMatcherTests</a>

```
searchKey: mux.pathMatcherTests
tags: [variable array struct private]
```

```Go
var pathMatcherTests = ...
```

### <a id="schemeMatcherTests" href="#schemeMatcherTests">var schemeMatcherTests</a>

```
searchKey: mux.schemeMatcherTests
tags: [variable array struct private]
```

```Go
var schemeMatcherTests = ...
```

### <a id="urlBuildingTests" href="#urlBuildingTests">var urlBuildingTests</a>

```
searchKey: mux.urlBuildingTests
tags: [variable array struct private]
```

```Go
var urlBuildingTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="BuildVarsFunc" href="#BuildVarsFunc">type BuildVarsFunc func(map[string]string) map[string]string</a>

```
searchKey: mux.BuildVarsFunc
tags: [function]
```

```Go
type BuildVarsFunc func(map[string]string) map[string]string
```

BuildVarsFunc is the function signature used by custom build variable functions (which can modify route variables before a route's URL is built). 

### <a id="MatcherFunc" href="#MatcherFunc">type MatcherFunc func(*net/http.Request, *github.com/gorilla/mux.RouteMatch) bool</a>

```
searchKey: mux.MatcherFunc
tags: [function]
```

```Go
type MatcherFunc func(*http.Request, *RouteMatch) bool
```

MatcherFunc is the function signature used by custom matchers. 

#### <a id="MatcherFunc.Match" href="#MatcherFunc.Match">func (m MatcherFunc) Match(r *http.Request, match *RouteMatch) bool</a>

```
searchKey: mux.MatcherFunc.Match
tags: [method]
```

```Go
func (m MatcherFunc) Match(r *http.Request, match *RouteMatch) bool
```

Match returns the match for a given request. 

### <a id="MiddlewareFunc" href="#MiddlewareFunc">type MiddlewareFunc func(net/http.Handler) net/http.Handler</a>

```
searchKey: mux.MiddlewareFunc
tags: [function]
```

```Go
type MiddlewareFunc func(http.Handler) http.Handler
```

MiddlewareFunc is a function which receives an http.Handler and returns another http.Handler. Typically, the returned handler is a closure which does something with the http.ResponseWriter and http.Request passed to it, and then calls the handler passed as parameter to the MiddlewareFunc. 

#### <a id="CORSMethodMiddleware" href="#CORSMethodMiddleware">func CORSMethodMiddleware(r *Router) MiddlewareFunc</a>

```
searchKey: mux.CORSMethodMiddleware
tags: [function]
```

```Go
func CORSMethodMiddleware(r *Router) MiddlewareFunc
```

CORSMethodMiddleware automatically sets the Access-Control-Allow-Methods response header on requests for routes that have an OPTIONS method matcher to all the method matchers on the route. Routes that do not explicitly handle OPTIONS requests will not be processed by the middleware. See examples for usage. 

#### <a id="MiddlewareFunc.Middleware" href="#MiddlewareFunc.Middleware">func (mw MiddlewareFunc) Middleware(handler http.Handler) http.Handler</a>

```
searchKey: mux.MiddlewareFunc.Middleware
tags: [method]
```

```Go
func (mw MiddlewareFunc) Middleware(handler http.Handler) http.Handler
```

Middleware allows MiddlewareFunc to implement the middleware interface. 

### <a id="ResponseRecorder" href="#ResponseRecorder">type ResponseRecorder struct</a>

```
searchKey: mux.ResponseRecorder
tags: [struct private]
```

```Go
type ResponseRecorder struct {
	Code      int           // the HTTP response code from WriteHeader
	HeaderMap http.Header   // the HTTP response headers
	Body      *bytes.Buffer // if non-nil, the bytes.Buffer to append written data to
	Flushed   bool
}
```

ResponseRecorder is an implementation of http.ResponseWriter that records its mutations for later inspection in tests. 

#### <a id="NewRecorder" href="#NewRecorder">func NewRecorder() *ResponseRecorder</a>

```
searchKey: mux.NewRecorder
tags: [function private]
```

```Go
func NewRecorder() *ResponseRecorder
```

NewRecorder returns an initialized ResponseRecorder. 

#### <a id="ResponseRecorder.Flush" href="#ResponseRecorder.Flush">func (rw *ResponseRecorder) Flush()</a>

```
searchKey: mux.ResponseRecorder.Flush
tags: [method private]
```

```Go
func (rw *ResponseRecorder) Flush()
```

Flush sets rw.Flushed to true. 

#### <a id="ResponseRecorder.Header" href="#ResponseRecorder.Header">func (rw *ResponseRecorder) Header() http.Header</a>

```
searchKey: mux.ResponseRecorder.Header
tags: [method private]
```

```Go
func (rw *ResponseRecorder) Header() http.Header
```

Header returns the response headers. 

#### <a id="ResponseRecorder.Write" href="#ResponseRecorder.Write">func (rw *ResponseRecorder) Write(buf []byte) (int, error)</a>

```
searchKey: mux.ResponseRecorder.Write
tags: [method private]
```

```Go
func (rw *ResponseRecorder) Write(buf []byte) (int, error)
```

Write always succeeds and writes to rw.Body, if not nil. 

#### <a id="ResponseRecorder.WriteHeader" href="#ResponseRecorder.WriteHeader">func (rw *ResponseRecorder) WriteHeader(code int)</a>

```
searchKey: mux.ResponseRecorder.WriteHeader
tags: [method private]
```

```Go
func (rw *ResponseRecorder) WriteHeader(code int)
```

WriteHeader sets rw.Code. 

### <a id="Route" href="#Route">type Route struct</a>

```
searchKey: mux.Route
tags: [struct]
```

```Go
type Route struct {
	// Request handler for the route.
	handler http.Handler
	// If true, this route never matches: it is only used to build URLs.
	buildOnly bool
	// The name used to build URLs.
	name string
	// Error resulted from building a route.
	err error

	// "global" reference to all named routes
	namedRoutes map[string]*Route

	// config possibly passed in from `Router`
	routeConf
}
```

Route stores information to match a request and build URLs. 

#### <a id="CurrentRoute" href="#CurrentRoute">func CurrentRoute(r *http.Request) *Route</a>

```
searchKey: mux.CurrentRoute
tags: [function]
```

```Go
func CurrentRoute(r *http.Request) *Route
```

CurrentRoute returns the matched route for the current request, if any. This only works when called inside the handler of the matched route because the matched route is stored in the request context which is cleared after the handler returns. 

#### <a id="Route.BuildOnly" href="#Route.BuildOnly">func (r *Route) BuildOnly() *Route</a>

```
searchKey: mux.Route.BuildOnly
tags: [method]
```

```Go
func (r *Route) BuildOnly() *Route
```

BuildOnly sets the route to never match: it is only used to build URLs. 

#### <a id="Route.BuildVarsFunc" href="#Route.BuildVarsFunc">func (r *Route) BuildVarsFunc(f BuildVarsFunc) *Route</a>

```
searchKey: mux.Route.BuildVarsFunc
tags: [method]
```

```Go
func (r *Route) BuildVarsFunc(f BuildVarsFunc) *Route
```

BuildVarsFunc adds a custom function to be used to modify build variables before a route's URL is built. 

#### <a id="Route.GetError" href="#Route.GetError">func (r *Route) GetError() error</a>

```
searchKey: mux.Route.GetError
tags: [method]
```

```Go
func (r *Route) GetError() error
```

GetError returns an error resulted from building the route, if any. 

#### <a id="Route.GetHandler" href="#Route.GetHandler">func (r *Route) GetHandler() http.Handler</a>

```
searchKey: mux.Route.GetHandler
tags: [method]
```

```Go
func (r *Route) GetHandler() http.Handler
```

GetHandler returns the handler for the route, if any. 

#### <a id="Route.GetHostTemplate" href="#Route.GetHostTemplate">func (r *Route) GetHostTemplate() (string, error)</a>

```
searchKey: mux.Route.GetHostTemplate
tags: [method]
```

```Go
func (r *Route) GetHostTemplate() (string, error)
```

GetHostTemplate returns the template used to build the route match. This is useful for building simple REST API documentation and for instrumentation against third-party services. An error will be returned if the route does not define a host. 

#### <a id="Route.GetMethods" href="#Route.GetMethods">func (r *Route) GetMethods() ([]string, error)</a>

```
searchKey: mux.Route.GetMethods
tags: [method]
```

```Go
func (r *Route) GetMethods() ([]string, error)
```

GetMethods returns the methods the route matches against This is useful for building simple REST API documentation and for instrumentation against third-party services. An error will be returned if route does not have methods. 

#### <a id="Route.GetName" href="#Route.GetName">func (r *Route) GetName() string</a>

```
searchKey: mux.Route.GetName
tags: [method]
```

```Go
func (r *Route) GetName() string
```

GetName returns the name for the route, if any. 

#### <a id="Route.GetPathRegexp" href="#Route.GetPathRegexp">func (r *Route) GetPathRegexp() (string, error)</a>

```
searchKey: mux.Route.GetPathRegexp
tags: [method]
```

```Go
func (r *Route) GetPathRegexp() (string, error)
```

GetPathRegexp returns the expanded regular expression used to match route path. This is useful for building simple REST API documentation and for instrumentation against third-party services. An error will be returned if the route does not define a path. 

#### <a id="Route.GetPathTemplate" href="#Route.GetPathTemplate">func (r *Route) GetPathTemplate() (string, error)</a>

```
searchKey: mux.Route.GetPathTemplate
tags: [method]
```

```Go
func (r *Route) GetPathTemplate() (string, error)
```

GetPathTemplate returns the template used to build the route match. This is useful for building simple REST API documentation and for instrumentation against third-party services. An error will be returned if the route does not define a path. 

#### <a id="Route.GetQueriesRegexp" href="#Route.GetQueriesRegexp">func (r *Route) GetQueriesRegexp() ([]string, error)</a>

```
searchKey: mux.Route.GetQueriesRegexp
tags: [method]
```

```Go
func (r *Route) GetQueriesRegexp() ([]string, error)
```

GetQueriesRegexp returns the expanded regular expressions used to match the route queries. This is useful for building simple REST API documentation and for instrumentation against third-party services. An error will be returned if the route does not have queries. 

#### <a id="Route.GetQueriesTemplates" href="#Route.GetQueriesTemplates">func (r *Route) GetQueriesTemplates() ([]string, error)</a>

```
searchKey: mux.Route.GetQueriesTemplates
tags: [method]
```

```Go
func (r *Route) GetQueriesTemplates() ([]string, error)
```

GetQueriesTemplates returns the templates used to build the query matching. This is useful for building simple REST API documentation and for instrumentation against third-party services. An error will be returned if the route does not define queries. 

#### <a id="Route.GoString" href="#Route.GoString">func (r *Route) GoString() string</a>

```
searchKey: mux.Route.GoString
tags: [method private]
```

```Go
func (r *Route) GoString() string
```

#### <a id="Route.Handler" href="#Route.Handler">func (r *Route) Handler(handler http.Handler) *Route</a>

```
searchKey: mux.Route.Handler
tags: [method]
```

```Go
func (r *Route) Handler(handler http.Handler) *Route
```

Handler sets a handler for the route. 

#### <a id="Route.HandlerFunc" href="#Route.HandlerFunc">func (r *Route) HandlerFunc(f func(http.ResponseWriter, *http.Request)) *Route</a>

```
searchKey: mux.Route.HandlerFunc
tags: [method]
```

```Go
func (r *Route) HandlerFunc(f func(http.ResponseWriter, *http.Request)) *Route
```

HandlerFunc sets a handler function for the route. 

#### <a id="Route.Headers" href="#Route.Headers">func (r *Route) Headers(pairs ...string) *Route</a>

```
searchKey: mux.Route.Headers
tags: [method]
```

```Go
func (r *Route) Headers(pairs ...string) *Route
```

Headers adds a matcher for request header values. It accepts a sequence of key/value pairs to be matched. For example: 

```
r := mux.NewRouter()
r.Headers("Content-Type", "application/json",
          "X-Requested-With", "XMLHttpRequest")

```
The above route will only match if both request header values match. If the value is an empty string, it will match any value if the key is set. 

#### <a id="Route.HeadersRegexp" href="#Route.HeadersRegexp">func (r *Route) HeadersRegexp(pairs ...string) *Route</a>

```
searchKey: mux.Route.HeadersRegexp
tags: [method]
```

```Go
func (r *Route) HeadersRegexp(pairs ...string) *Route
```

HeadersRegexp accepts a sequence of key/value pairs, where the value has regex support. For example: 

```
r := mux.NewRouter()
r.HeadersRegexp("Content-Type", "application/(text|json)",
          "X-Requested-With", "XMLHttpRequest")

```
The above route will only match if both the request header matches both regular expressions. If the value is an empty string, it will match any value if the key is set. Use the start and end of string anchors (^ and $) to match an exact value. 

#### <a id="Route.Host" href="#Route.Host">func (r *Route) Host(tpl string) *Route</a>

```
searchKey: mux.Route.Host
tags: [method]
```

```Go
func (r *Route) Host(tpl string) *Route
```

Host adds a matcher for the URL host. It accepts a template with zero or more URL variables enclosed by {}. Variables can define an optional regexp pattern to be matched: 

- {name} matches anything until the next dot. 

- {name:pattern} matches the given regexp pattern. 

For example: 

```
r := mux.NewRouter()
r.Host("www.example.com")
r.Host("{subdomain}.domain.com")
r.Host("{subdomain:[a-z]+}.domain.com")

```
Variable names must be unique in a given route. They can be retrieved calling mux.Vars(request). 

#### <a id="Route.Match" href="#Route.Match">func (r *Route) Match(req *http.Request, match *RouteMatch) bool</a>

```
searchKey: mux.Route.Match
tags: [method]
```

```Go
func (r *Route) Match(req *http.Request, match *RouteMatch) bool
```

Match matches the route against the request. 

#### <a id="Route.MatcherFunc" href="#Route.MatcherFunc">func (r *Route) MatcherFunc(f MatcherFunc) *Route</a>

```
searchKey: mux.Route.MatcherFunc
tags: [method]
```

```Go
func (r *Route) MatcherFunc(f MatcherFunc) *Route
```

MatcherFunc adds a custom function to be used as request matcher. 

#### <a id="Route.Methods" href="#Route.Methods">func (r *Route) Methods(methods ...string) *Route</a>

```
searchKey: mux.Route.Methods
tags: [method]
```

```Go
func (r *Route) Methods(methods ...string) *Route
```

Methods adds a matcher for HTTP methods. It accepts a sequence of one or more methods to be matched, e.g.: "GET", "POST", "PUT". 

#### <a id="Route.Name" href="#Route.Name">func (r *Route) Name(name string) *Route</a>

```
searchKey: mux.Route.Name
tags: [method]
```

```Go
func (r *Route) Name(name string) *Route
```

Name sets the name for the route, used to build URLs. It is an error to call Name more than once on a route. 

#### <a id="Route.Path" href="#Route.Path">func (r *Route) Path(tpl string) *Route</a>

```
searchKey: mux.Route.Path
tags: [method]
```

```Go
func (r *Route) Path(tpl string) *Route
```

Path adds a matcher for the URL path. It accepts a template with zero or more URL variables enclosed by {}. The template must start with a "/". Variables can define an optional regexp pattern to be matched: 

- {name} matches anything until the next slash. 

- {name:pattern} matches the given regexp pattern. 

For example: 

```
r := mux.NewRouter()
r.Path("/products/").Handler(ProductsHandler)
r.Path("/products/{key}").Handler(ProductsHandler)
r.Path("/articles/{category}/{id:[0-9]+}").
  Handler(ArticleHandler)

```
Variable names must be unique in a given route. They can be retrieved calling mux.Vars(request). 

#### <a id="Route.PathPrefix" href="#Route.PathPrefix">func (r *Route) PathPrefix(tpl string) *Route</a>

```
searchKey: mux.Route.PathPrefix
tags: [method]
```

```Go
func (r *Route) PathPrefix(tpl string) *Route
```

PathPrefix adds a matcher for the URL path prefix. This matches if the given template is a prefix of the full URL path. See Route.Path() for details on the tpl argument. 

Note that it does not treat slashes specially ("/foobar/" will be matched by the prefix "/foo") so you may want to use a trailing slash here. 

Also note that the setting of Router.StrictSlash() has no effect on routes with a PathPrefix matcher. 

#### <a id="Route.Queries" href="#Route.Queries">func (r *Route) Queries(pairs ...string) *Route</a>

```
searchKey: mux.Route.Queries
tags: [method]
```

```Go
func (r *Route) Queries(pairs ...string) *Route
```

Queries adds a matcher for URL query values. It accepts a sequence of key/value pairs. Values may define variables. For example: 

```
r := mux.NewRouter()
r.Queries("foo", "bar", "id", "{id:[0-9]+}")

```
The above route will only match if the URL contains the defined queries values, e.g.: ?foo=bar&id=42. 

If the value is an empty string, it will match any value if the key is set. 

Variables can define an optional regexp pattern to be matched: 

- {name} matches anything until the next slash. 

- {name:pattern} matches the given regexp pattern. 

#### <a id="Route.Schemes" href="#Route.Schemes">func (r *Route) Schemes(schemes ...string) *Route</a>

```
searchKey: mux.Route.Schemes
tags: [method]
```

```Go
func (r *Route) Schemes(schemes ...string) *Route
```

Schemes adds a matcher for URL schemes. It accepts a sequence of schemes to be matched, e.g.: "http", "https". If the request's URL has a scheme set, it will be matched against. Generally, the URL scheme will only be set if a previous handler set it, such as the ProxyHeaders handler from gorilla/handlers. If unset, the scheme will be determined based on the request's TLS termination state. The first argument to Schemes will be used when constructing a route URL. 

#### <a id="Route.SkipClean" href="#Route.SkipClean">func (r *Route) SkipClean() bool</a>

```
searchKey: mux.Route.SkipClean
tags: [method]
```

```Go
func (r *Route) SkipClean() bool
```

SkipClean reports whether path cleaning is enabled for this route via Router.SkipClean. 

#### <a id="Route.Subrouter" href="#Route.Subrouter">func (r *Route) Subrouter() *Router</a>

```
searchKey: mux.Route.Subrouter
tags: [method]
```

```Go
func (r *Route) Subrouter() *Router
```

Subrouter creates a subrouter for the route. 

It will test the inner routes only if the parent route matched. For example: 

```
r := mux.NewRouter()
s := r.Host("www.example.com").Subrouter()
s.HandleFunc("/products/", ProductsHandler)
s.HandleFunc("/products/{key}", ProductHandler)
s.HandleFunc("/articles/{category}/{id:[0-9]+}"), ArticleHandler)

```
Here, the routes registered in the subrouter won't be tested if the host doesn't match. 

#### <a id="Route.URL" href="#Route.URL">func (r *Route) URL(pairs ...string) (*url.URL, error)</a>

```
searchKey: mux.Route.URL
tags: [method]
```

```Go
func (r *Route) URL(pairs ...string) (*url.URL, error)
```

URL builds a URL for the route. 

It accepts a sequence of key/value pairs for the route variables. For example, given this route: 

```
r := mux.NewRouter()
r.HandleFunc("/articles/{category}/{id:[0-9]+}", ArticleHandler).
  Name("article")

```
...a URL for it can be built using: 

```
url, err := r.Get("article").URL("category", "technology", "id", "42")

```
...which will return an url.URL with the following path: 

```
"/articles/technology/42"

```
This also works for host variables: 

```
r := mux.NewRouter()
r.HandleFunc("/articles/{category}/{id:[0-9]+}", ArticleHandler).
  Host("{subdomain}.domain.com").
  Name("article")

// url.String() will be "[http://news.domain.com/articles/technology/42](http://news.domain.com/articles/technology/42)"
url, err := r.Get("article").URL("subdomain", "news",
                                 "category", "technology",
                                 "id", "42")

```
The scheme of the resulting url will be the first argument that was passed to Schemes: 

```
// url.String() will be "[https://example.com](https://example.com)"
r := mux.NewRouter()
url, err := r.Host("example.com")
             .Schemes("https", "http").URL()

```
All variables defined in the route are required, and their values must conform to the corresponding patterns. 

#### <a id="Route.URLHost" href="#Route.URLHost">func (r *Route) URLHost(pairs ...string) (*url.URL, error)</a>

```
searchKey: mux.Route.URLHost
tags: [method]
```

```Go
func (r *Route) URLHost(pairs ...string) (*url.URL, error)
```

URLHost builds the host part of the URL for a route. See Route.URL(). 

The route must have a host defined. 

#### <a id="Route.URLPath" href="#Route.URLPath">func (r *Route) URLPath(pairs ...string) (*url.URL, error)</a>

```
searchKey: mux.Route.URLPath
tags: [method]
```

```Go
func (r *Route) URLPath(pairs ...string) (*url.URL, error)
```

URLPath builds the path part of the URL for a route. See Route.URL(). 

The route must have a path defined. 

#### <a id="Route.addMatcher" href="#Route.addMatcher">func (r *Route) addMatcher(m matcher) *Route</a>

```
searchKey: mux.Route.addMatcher
tags: [method private]
```

```Go
func (r *Route) addMatcher(m matcher) *Route
```

addMatcher adds a matcher to the route. 

#### <a id="Route.addRegexpMatcher" href="#Route.addRegexpMatcher">func (r *Route) addRegexpMatcher(tpl string, typ regexpType) error</a>

```
searchKey: mux.Route.addRegexpMatcher
tags: [method private]
```

```Go
func (r *Route) addRegexpMatcher(tpl string, typ regexpType) error
```

addRegexpMatcher adds a host or path matcher and builder to a route. 

#### <a id="Route.buildVars" href="#Route.buildVars">func (r *Route) buildVars(m map[string]string) map[string]string</a>

```
searchKey: mux.Route.buildVars
tags: [method private]
```

```Go
func (r *Route) buildVars(m map[string]string) map[string]string
```

#### <a id="Route.prepareVars" href="#Route.prepareVars">func (r *Route) prepareVars(pairs ...string) (map[string]string, error)</a>

```
searchKey: mux.Route.prepareVars
tags: [method private]
```

```Go
func (r *Route) prepareVars(pairs ...string) (map[string]string, error)
```

prepareVars converts the route variable pairs into a map. If the route has a BuildVarsFunc, it is invoked. 

### <a id="RouteMatch" href="#RouteMatch">type RouteMatch struct</a>

```
searchKey: mux.RouteMatch
tags: [struct]
```

```Go
type RouteMatch struct {
	Route   *Route
	Handler http.Handler
	Vars    map[string]string

	// MatchErr is set to appropriate matching error
	// It is set to ErrMethodMismatch if there is a mismatch in
	// the request method and route method
	MatchErr error
}
```

RouteMatch stores information about a matched route. 

### <a id="Router" href="#Router">type Router struct</a>

```
searchKey: mux.Router
tags: [struct]
```

```Go
type Router struct {
	// Configurable Handler to be used when no route matches.
	NotFoundHandler http.Handler

	// Configurable Handler to be used when the request method does not match the route.
	MethodNotAllowedHandler http.Handler

	// Routes to be matched, in order.
	routes []*Route

	// Routes by name for URL building.
	namedRoutes map[string]*Route

	// If true, do not clear the request context after handling the request.
	//
	// Deprecated: No effect, since the context is stored on the request itself.
	KeepContext bool

	// Slice of middlewares to be called after a match is found
	middlewares []middleware

	// configuration shared with `Route`
	routeConf
}
```

Router registers routes to be matched and dispatches a handler. 

It implements the http.Handler interface, so it can be registered to serve requests: 

```
var router = mux.NewRouter()

func main() {
    http.Handle("/", router)
}

```
Or, for Google App Engine, register it in a init() function: 

```
func init() {
    http.Handle("/", router)
}

```
This will send all incoming requests to the router. 

#### <a id="NewRouter" href="#NewRouter">func NewRouter() *Router</a>

```
searchKey: mux.NewRouter
tags: [function]
```

```Go
func NewRouter() *Router
```

NewRouter returns a new router instance. 

#### <a id="Router.BuildVarsFunc" href="#Router.BuildVarsFunc">func (r *Router) BuildVarsFunc(f BuildVarsFunc) *Route</a>

```
searchKey: mux.Router.BuildVarsFunc
tags: [method]
```

```Go
func (r *Router) BuildVarsFunc(f BuildVarsFunc) *Route
```

BuildVarsFunc registers a new route with a custom function for modifying route variables before building a URL. 

#### <a id="Router.Get" href="#Router.Get">func (r *Router) Get(name string) *Route</a>

```
searchKey: mux.Router.Get
tags: [method]
```

```Go
func (r *Router) Get(name string) *Route
```

Get returns a route registered with the given name. 

#### <a id="Router.GetRoute" href="#Router.GetRoute">func (r *Router) GetRoute(name string) *Route</a>

```
searchKey: mux.Router.GetRoute
tags: [method]
```

```Go
func (r *Router) GetRoute(name string) *Route
```

GetRoute returns a route registered with the given name. This method was renamed to Get() and remains here for backwards compatibility. 

#### <a id="Router.Handle" href="#Router.Handle">func (r *Router) Handle(path string, handler http.Handler) *Route</a>

```
searchKey: mux.Router.Handle
tags: [method]
```

```Go
func (r *Router) Handle(path string, handler http.Handler) *Route
```

Handle registers a new route with a matcher for the URL path. See Route.Path() and Route.Handler(). 

#### <a id="Router.HandleFunc" href="#Router.HandleFunc">func (r *Router) HandleFunc(path string, f func(http.ResponseWriter,...</a>

```
searchKey: mux.Router.HandleFunc
tags: [method]
```

```Go
func (r *Router) HandleFunc(path string, f func(http.ResponseWriter,
	*http.Request)) *Route
```

HandleFunc registers a new route with a matcher for the URL path. See Route.Path() and Route.HandlerFunc(). 

#### <a id="Router.Headers" href="#Router.Headers">func (r *Router) Headers(pairs ...string) *Route</a>

```
searchKey: mux.Router.Headers
tags: [method]
```

```Go
func (r *Router) Headers(pairs ...string) *Route
```

Headers registers a new route with a matcher for request header values. See Route.Headers(). 

#### <a id="Router.Host" href="#Router.Host">func (r *Router) Host(tpl string) *Route</a>

```
searchKey: mux.Router.Host
tags: [method]
```

```Go
func (r *Router) Host(tpl string) *Route
```

Host registers a new route with a matcher for the URL host. See Route.Host(). 

#### <a id="Router.Match" href="#Router.Match">func (r *Router) Match(req *http.Request, match *RouteMatch) bool</a>

```
searchKey: mux.Router.Match
tags: [method]
```

```Go
func (r *Router) Match(req *http.Request, match *RouteMatch) bool
```

Match attempts to match the given request against the router's registered routes. 

If the request matches a route of this router or one of its subrouters the Route, Handler, and Vars fields of the the match argument are filled and this function returns true. 

If the request does not match any of this router's or its subrouters' routes then this function returns false. If available, a reason for the match failure will be filled in the match argument's MatchErr field. If the match failure type (eg: not found) has a registered handler, the handler is assigned to the Handler field of the match argument. 

#### <a id="Router.MatcherFunc" href="#Router.MatcherFunc">func (r *Router) MatcherFunc(f MatcherFunc) *Route</a>

```
searchKey: mux.Router.MatcherFunc
tags: [method]
```

```Go
func (r *Router) MatcherFunc(f MatcherFunc) *Route
```

MatcherFunc registers a new route with a custom matcher function. See Route.MatcherFunc(). 

#### <a id="Router.Methods" href="#Router.Methods">func (r *Router) Methods(methods ...string) *Route</a>

```
searchKey: mux.Router.Methods
tags: [method]
```

```Go
func (r *Router) Methods(methods ...string) *Route
```

Methods registers a new route with a matcher for HTTP methods. See Route.Methods(). 

#### <a id="Router.Name" href="#Router.Name">func (r *Router) Name(name string) *Route</a>

```
searchKey: mux.Router.Name
tags: [method]
```

```Go
func (r *Router) Name(name string) *Route
```

Name registers a new route with a name. See Route.Name(). 

#### <a id="Router.NewRoute" href="#Router.NewRoute">func (r *Router) NewRoute() *Route</a>

```
searchKey: mux.Router.NewRoute
tags: [method]
```

```Go
func (r *Router) NewRoute() *Route
```

NewRoute registers an empty route. 

#### <a id="Router.Path" href="#Router.Path">func (r *Router) Path(tpl string) *Route</a>

```
searchKey: mux.Router.Path
tags: [method]
```

```Go
func (r *Router) Path(tpl string) *Route
```

Path registers a new route with a matcher for the URL path. See Route.Path(). 

#### <a id="Router.PathPrefix" href="#Router.PathPrefix">func (r *Router) PathPrefix(tpl string) *Route</a>

```
searchKey: mux.Router.PathPrefix
tags: [method]
```

```Go
func (r *Router) PathPrefix(tpl string) *Route
```

PathPrefix registers a new route with a matcher for the URL path prefix. See Route.PathPrefix(). 

#### <a id="Router.Queries" href="#Router.Queries">func (r *Router) Queries(pairs ...string) *Route</a>

```
searchKey: mux.Router.Queries
tags: [method]
```

```Go
func (r *Router) Queries(pairs ...string) *Route
```

Queries registers a new route with a matcher for URL query values. See Route.Queries(). 

#### <a id="Router.Schemes" href="#Router.Schemes">func (r *Router) Schemes(schemes ...string) *Route</a>

```
searchKey: mux.Router.Schemes
tags: [method]
```

```Go
func (r *Router) Schemes(schemes ...string) *Route
```

Schemes registers a new route with a matcher for URL schemes. See Route.Schemes(). 

#### <a id="Router.ServeHTTP" href="#Router.ServeHTTP">func (r *Router) ServeHTTP(w http.ResponseWriter, req *http.Request)</a>

```
searchKey: mux.Router.ServeHTTP
tags: [method]
```

```Go
func (r *Router) ServeHTTP(w http.ResponseWriter, req *http.Request)
```

ServeHTTP dispatches the handler registered in the matched route. 

When there is a match, the route variables can be retrieved calling mux.Vars(request). 

#### <a id="Router.SkipClean" href="#Router.SkipClean">func (r *Router) SkipClean(value bool) *Router</a>

```
searchKey: mux.Router.SkipClean
tags: [method]
```

```Go
func (r *Router) SkipClean(value bool) *Router
```

SkipClean defines the path cleaning behaviour for new routes. The initial value is false. Users should be careful about which routes are not cleaned 

When true, if the route path is "/path//to", it will remain with the double slash. This is helpful if you have a route like: /fetch/[http://xkcd.com/534/](http://xkcd.com/534/) 

When false, the path will be cleaned, so /fetch/[http://xkcd.com/534/](http://xkcd.com/534/) will become /fetch/http/xkcd.com/534 

#### <a id="Router.StrictSlash" href="#Router.StrictSlash">func (r *Router) StrictSlash(value bool) *Router</a>

```
searchKey: mux.Router.StrictSlash
tags: [method]
```

```Go
func (r *Router) StrictSlash(value bool) *Router
```

StrictSlash defines the trailing slash behavior for new routes. The initial value is false. 

When true, if the route path is "/path/", accessing "/path" will perform a redirect to the former and vice versa. In other words, your application will always see the path as specified in the route. 

When false, if the route path is "/path", accessing "/path/" will not match this route and vice versa. 

The re-direct is a HTTP 301 (Moved Permanently). Note that when this is set for routes with a non-idempotent method (e.g. POST, PUT), the subsequent re-directed request will be made as a GET by most clients. Use middleware or client settings to modify this behaviour as needed. 

Special case: when a route sets a path prefix using the PathPrefix() method, strict slash is ignored for that route because the redirect behavior can't be determined from a prefix alone. However, any subrouters created from that route inherit the original StrictSlash setting. 

#### <a id="Router.Use" href="#Router.Use">func (r *Router) Use(mwf ...MiddlewareFunc)</a>

```
searchKey: mux.Router.Use
tags: [method]
```

```Go
func (r *Router) Use(mwf ...MiddlewareFunc)
```

Use appends a MiddlewareFunc to the chain. Middleware can be used to intercept or otherwise modify requests and/or responses, and are executed in the order that they are applied to the Router. 

#### <a id="Router.UseEncodedPath" href="#Router.UseEncodedPath">func (r *Router) UseEncodedPath() *Router</a>

```
searchKey: mux.Router.UseEncodedPath
tags: [method]
```

```Go
func (r *Router) UseEncodedPath() *Router
```

UseEncodedPath tells the router to match the encoded original path to the routes. For eg. "/path/foo%2Fbar/to" will match the path "/path/{var}/to". 

If not called, the router will match the unencoded path to the routes. For eg. "/path/foo%2Fbar/to" will match the path "/path/foo/bar/to" 

#### <a id="Router.Walk" href="#Router.Walk">func (r *Router) Walk(walkFn WalkFunc) error</a>

```
searchKey: mux.Router.Walk
tags: [method]
```

```Go
func (r *Router) Walk(walkFn WalkFunc) error
```

Walk walks the router and all its sub-routers, calling walkFn for each route in the tree. The routes are walked in the order they were added. Sub-routers are explored depth-first. 

#### <a id="Router.useInterface" href="#Router.useInterface">func (r *Router) useInterface(mw middleware)</a>

```
searchKey: mux.Router.useInterface
tags: [method private]
```

```Go
func (r *Router) useInterface(mw middleware)
```

useInterface appends a middleware to the chain. Middleware can be used to intercept or otherwise modify requests and/or responses, and are executed in the order that they are applied to the Router. 

#### <a id="Router.walk" href="#Router.walk">func (r *Router) walk(walkFn WalkFunc, ancestors []*Route) error</a>

```
searchKey: mux.Router.walk
tags: [method private]
```

```Go
func (r *Router) walk(walkFn WalkFunc, ancestors []*Route) error
```

### <a id="TestA301ResponseWriter" href="#TestA301ResponseWriter">type TestA301ResponseWriter struct</a>

```
searchKey: mux.TestA301ResponseWriter
tags: [struct private]
```

```Go
type TestA301ResponseWriter struct {
	hh     http.Header
	status int
}
```

#### <a id="TestA301ResponseWriter.Header" href="#TestA301ResponseWriter.Header">func (ho *TestA301ResponseWriter) Header() http.Header</a>

```
searchKey: mux.TestA301ResponseWriter.Header
tags: [method private]
```

```Go
func (ho *TestA301ResponseWriter) Header() http.Header
```

#### <a id="TestA301ResponseWriter.Write" href="#TestA301ResponseWriter.Write">func (ho *TestA301ResponseWriter) Write(b []byte) (int, error)</a>

```
searchKey: mux.TestA301ResponseWriter.Write
tags: [method private]
```

```Go
func (ho *TestA301ResponseWriter) Write(b []byte) (int, error)
```

#### <a id="TestA301ResponseWriter.WriteHeader" href="#TestA301ResponseWriter.WriteHeader">func (ho *TestA301ResponseWriter) WriteHeader(code int)</a>

```
searchKey: mux.TestA301ResponseWriter.WriteHeader
tags: [method private]
```

```Go
func (ho *TestA301ResponseWriter) WriteHeader(code int)
```

### <a id="WalkFunc" href="#WalkFunc">type WalkFunc func(route *github.com/gorilla/mux.Route, router *github.com/gorilla/mux.Router, ancestors []*github.com/gorilla/mux.Route) error</a>

```
searchKey: mux.WalkFunc
tags: [function]
```

```Go
type WalkFunc func(route *Route, router *Router, ancestors []*Route) error
```

WalkFunc is the type of the function called for each route visited by Walk. At every invocation, it is given the current route, and the current router, and a list of ancestor routes that lead to the current route. 

### <a id="contextKey" href="#contextKey">type contextKey int</a>

```
searchKey: mux.contextKey
tags: [number private]
```

```Go
type contextKey int
```

### <a id="customMethodNotAllowedHandler" href="#customMethodNotAllowedHandler">type customMethodNotAllowedHandler struct</a>

```
searchKey: mux.customMethodNotAllowedHandler
tags: [struct private]
```

```Go
type customMethodNotAllowedHandler struct {
	msg string
}
```

#### <a id="customMethodNotAllowedHandler.ServeHTTP" href="#customMethodNotAllowedHandler.ServeHTTP">func (h customMethodNotAllowedHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: mux.customMethodNotAllowedHandler.ServeHTTP
tags: [method private]
```

```Go
func (h customMethodNotAllowedHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

### <a id="headerMatcher" href="#headerMatcher">type headerMatcher map[string]string</a>

```
searchKey: mux.headerMatcher
tags: [object private]
```

```Go
type headerMatcher map[string]string
```

headerMatcher matches the request against header values. 

#### <a id="headerMatcher.Match" href="#headerMatcher.Match">func (m headerMatcher) Match(r *http.Request, match *RouteMatch) bool</a>

```
searchKey: mux.headerMatcher.Match
tags: [method private]
```

```Go
func (m headerMatcher) Match(r *http.Request, match *RouteMatch) bool
```

### <a id="headerMatcherTest" href="#headerMatcherTest">type headerMatcherTest struct</a>

```
searchKey: mux.headerMatcherTest
tags: [struct private]
```

```Go
type headerMatcherTest struct {
	matcher headerMatcher
	headers map[string]string
	result  bool
}
```

### <a id="headerRegexMatcher" href="#headerRegexMatcher">type headerRegexMatcher map[string]*regexp.Regexp</a>

```
searchKey: mux.headerRegexMatcher
tags: [object private]
```

```Go
type headerRegexMatcher map[string]*regexp.Regexp
```

headerRegexMatcher matches the request against the route given a regex for the header 

#### <a id="headerRegexMatcher.Match" href="#headerRegexMatcher.Match">func (m headerRegexMatcher) Match(r *http.Request, match *RouteMatch) bool</a>

```
searchKey: mux.headerRegexMatcher.Match
tags: [method private]
```

```Go
func (m headerRegexMatcher) Match(r *http.Request, match *RouteMatch) bool
```

### <a id="hostMatcherTest" href="#hostMatcherTest">type hostMatcherTest struct</a>

```
searchKey: mux.hostMatcherTest
tags: [struct private]
```

```Go
type hostMatcherTest struct {
	matcher *Route
	url     string
	vars    map[string]string
	result  bool
}
```

### <a id="matcher" href="#matcher">type matcher interface</a>

```
searchKey: mux.matcher
tags: [interface private]
```

```Go
type matcher interface {
	Match(*http.Request, *RouteMatch) bool
}
```

matcher types try to match a request. 

### <a id="methodMatcher" href="#methodMatcher">type methodMatcher []string</a>

```
searchKey: mux.methodMatcher
tags: [array string private]
```

```Go
type methodMatcher []string
```

methodMatcher matches the request against HTTP methods. 

#### <a id="methodMatcher.Match" href="#methodMatcher.Match">func (m methodMatcher) Match(r *http.Request, match *RouteMatch) bool</a>

```
searchKey: mux.methodMatcher.Match
tags: [method private]
```

```Go
func (m methodMatcher) Match(r *http.Request, match *RouteMatch) bool
```

### <a id="methodMatcherTest" href="#methodMatcherTest">type methodMatcherTest struct</a>

```
searchKey: mux.methodMatcherTest
tags: [struct private]
```

```Go
type methodMatcherTest struct {
	matcher methodMatcher
	method  string
	result  bool
}
```

### <a id="methodsSubrouterTest" href="#methodsSubrouterTest">type methodsSubrouterTest struct</a>

```
searchKey: mux.methodsSubrouterTest
tags: [struct private]
```

```Go
type methodsSubrouterTest struct {
	title    string
	wantCode int
	router   *Router
	// method is the input into the request and expected response
	method string
	// input request path
	path string
	// redirectTo is the expected location path for strict-slash matches
	redirectTo string
}
```

methodsSubrouterTest models the data necessary for testing handler matching for subrouters created after HTTP methods matcher registration. 

### <a id="middleware" href="#middleware">type middleware interface</a>

```
searchKey: mux.middleware
tags: [interface private]
```

```Go
type middleware interface {
	Middleware(handler http.Handler) http.Handler
}
```

middleware interface is anything which implements a MiddlewareFunc named Middleware. 

### <a id="pathMatcherTest" href="#pathMatcherTest">type pathMatcherTest struct</a>

```
searchKey: mux.pathMatcherTest
tags: [struct private]
```

```Go
type pathMatcherTest struct {
	matcher *Route
	url     string
	vars    map[string]string
	result  bool
}
```

### <a id="regexpType" href="#regexpType">type regexpType int</a>

```
searchKey: mux.regexpType
tags: [number private]
```

```Go
type regexpType int
```

### <a id="routeConf" href="#routeConf">type routeConf struct</a>

```
searchKey: mux.routeConf
tags: [struct private]
```

```Go
type routeConf struct {
	// If true, "/path/foo%2Fbar/to" will match the path "/path/{var}/to"
	useEncodedPath bool

	// If true, when the path pattern is "/path/", accessing "/path" will
	// redirect to the former and vice versa.
	strictSlash bool

	// If true, when the path pattern is "/path//to", accessing "/path//to"
	// will not redirect
	skipClean bool

	// Manager for the variables from host and path.
	regexp routeRegexpGroup

	// List of matchers.
	matchers []matcher

	// The scheme used when building URLs.
	buildScheme string

	buildVarsFunc BuildVarsFunc
}
```

common route configuration shared between `Router` and `Route` 

#### <a id="copyRouteConf" href="#copyRouteConf">func copyRouteConf(r routeConf) routeConf</a>

```
searchKey: mux.copyRouteConf
tags: [function private]
```

```Go
func copyRouteConf(r routeConf) routeConf
```

returns an effective deep copy of `routeConf` 

### <a id="routeRegexp" href="#routeRegexp">type routeRegexp struct</a>

```
searchKey: mux.routeRegexp
tags: [struct private]
```

```Go
type routeRegexp struct {
	// The unmodified template.
	template string
	// The type of match
	regexpType regexpType
	// Options for matching
	options routeRegexpOptions
	// Expanded regexp.
	regexp *regexp.Regexp
	// Reverse template.
	reverse string
	// Variable names.
	varsN []string
	// Variable regexps (validators).
	varsR []*regexp.Regexp
	// Wildcard host-port (no strict port match in hostname)
	wildcardHostPort bool
}
```

routeRegexp stores a regexp to match a host or path and information to collect and validate route variables. 

#### <a id="copyRouteRegexp" href="#copyRouteRegexp">func copyRouteRegexp(r *routeRegexp) *routeRegexp</a>

```
searchKey: mux.copyRouteRegexp
tags: [function private]
```

```Go
func copyRouteRegexp(r *routeRegexp) *routeRegexp
```

#### <a id="newRouteRegexp" href="#newRouteRegexp">func newRouteRegexp(tpl string, typ regexpType, options routeRegexpOptions) (*routeRegexp, error)</a>

```
searchKey: mux.newRouteRegexp
tags: [function private]
```

```Go
func newRouteRegexp(tpl string, typ regexpType, options routeRegexpOptions) (*routeRegexp, error)
```

newRouteRegexp parses a route template and returns a routeRegexp, used to match a host, a path or a query string. 

It will extract named variables, assemble a regexp to be matched, create a "reverse" template to build URLs and compile regexps to validate variable values used in URL building. 

Previously we accepted only Python-like identifiers for variable names ([a-zA-Z_][a-zA-Z0-9_]*), but currently the only restriction is that name and pattern can't be empty, and names can't contain a colon. 

#### <a id="routeRegexp.GoString" href="#routeRegexp.GoString">func (r *routeRegexp) GoString() string</a>

```
searchKey: mux.routeRegexp.GoString
tags: [method private]
```

```Go
func (r *routeRegexp) GoString() string
```

#### <a id="routeRegexp.Match" href="#routeRegexp.Match">func (r *routeRegexp) Match(req *http.Request, match *RouteMatch) bool</a>

```
searchKey: mux.routeRegexp.Match
tags: [method private]
```

```Go
func (r *routeRegexp) Match(req *http.Request, match *RouteMatch) bool
```

Match matches the regexp against the URL host or path. 

#### <a id="routeRegexp.getURLQuery" href="#routeRegexp.getURLQuery">func (r *routeRegexp) getURLQuery(req *http.Request) string</a>

```
searchKey: mux.routeRegexp.getURLQuery
tags: [method private]
```

```Go
func (r *routeRegexp) getURLQuery(req *http.Request) string
```

getURLQuery returns a single query parameter from a request URL. For a URL with foo=bar&baz=ding, we return only the relevant key value pair for the routeRegexp. 

#### <a id="routeRegexp.matchQueryString" href="#routeRegexp.matchQueryString">func (r *routeRegexp) matchQueryString(req *http.Request) bool</a>

```
searchKey: mux.routeRegexp.matchQueryString
tags: [method private]
```

```Go
func (r *routeRegexp) matchQueryString(req *http.Request) bool
```

#### <a id="routeRegexp.url" href="#routeRegexp.url">func (r *routeRegexp) url(values map[string]string) (string, error)</a>

```
searchKey: mux.routeRegexp.url
tags: [method private]
```

```Go
func (r *routeRegexp) url(values map[string]string) (string, error)
```

url builds a URL part using the given values. 

### <a id="routeRegexpGroup" href="#routeRegexpGroup">type routeRegexpGroup struct</a>

```
searchKey: mux.routeRegexpGroup
tags: [struct private]
```

```Go
type routeRegexpGroup struct {
	host    *routeRegexp
	path    *routeRegexp
	queries []*routeRegexp
}
```

routeRegexpGroup groups the route matchers that carry variables. 

#### <a id="routeRegexpGroup.setMatch" href="#routeRegexpGroup.setMatch">func (v routeRegexpGroup) setMatch(req *http.Request, m *RouteMatch, r *Route)</a>

```
searchKey: mux.routeRegexpGroup.setMatch
tags: [method private]
```

```Go
func (v routeRegexpGroup) setMatch(req *http.Request, m *RouteMatch, r *Route)
```

setMatch extracts the variables from the URL once a route matches. 

### <a id="routeRegexpOptions" href="#routeRegexpOptions">type routeRegexpOptions struct</a>

```
searchKey: mux.routeRegexpOptions
tags: [struct private]
```

```Go
type routeRegexpOptions struct {
	strictSlash    bool
	useEncodedPath bool
}
```

### <a id="routeTest" href="#routeTest">type routeTest struct</a>

```
searchKey: mux.routeTest
tags: [struct private]
```

```Go
type routeTest struct {
	title           string            // title of the test
	route           *Route            // the route being tested
	request         *http.Request     // a request to test the route
	vars            map[string]string // the expected vars of the match
	scheme          string            // the expected scheme of the built URL
	host            string            // the expected host of the built URL
	path            string            // the expected path of the built URL
	query           string            // the expected query string of the built URL
	pathTemplate    string            // the expected path template of the route
	hostTemplate    string            // the expected host template of the route
	queriesTemplate string            // the expected query template of the route
	methods         []string          // the expected route methods
	pathRegexp      string            // the expected path regexp
	queriesRegexp   string            // the expected query regexp
	shouldMatch     bool              // whether the request is expected to match the route at all
	shouldRedirect  bool              // whether the request should result in a redirect
}
```

### <a id="schemeMatcher" href="#schemeMatcher">type schemeMatcher []string</a>

```
searchKey: mux.schemeMatcher
tags: [array string private]
```

```Go
type schemeMatcher []string
```

schemeMatcher matches the request against URL schemes. 

#### <a id="schemeMatcher.Match" href="#schemeMatcher.Match">func (m schemeMatcher) Match(r *http.Request, match *RouteMatch) bool</a>

```
searchKey: mux.schemeMatcher.Match
tags: [method private]
```

```Go
func (m schemeMatcher) Match(r *http.Request, match *RouteMatch) bool
```

### <a id="schemeMatcherTest" href="#schemeMatcherTest">type schemeMatcherTest struct</a>

```
searchKey: mux.schemeMatcherTest
tags: [struct private]
```

```Go
type schemeMatcherTest struct {
	matcher schemeMatcher
	url     string
	result  bool
}
```

### <a id="testMiddleware" href="#testMiddleware">type testMiddleware struct</a>

```
searchKey: mux.testMiddleware
tags: [struct private]
```

```Go
type testMiddleware struct {
	timesCalled uint
}
```

#### <a id="testMiddleware.Middleware" href="#testMiddleware.Middleware">func (tm *testMiddleware) Middleware(h http.Handler) http.Handler</a>

```
searchKey: mux.testMiddleware.Middleware
tags: [method private]
```

```Go
func (tm *testMiddleware) Middleware(h http.Handler) http.Handler
```

### <a id="urlBuildingTest" href="#urlBuildingTest">type urlBuildingTest struct</a>

```
searchKey: mux.urlBuildingTest
tags: [struct private]
```

```Go
type urlBuildingTest struct {
	route *Route
	vars  []string
	url   string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkManyPathVariables" href="#BenchmarkManyPathVariables">func BenchmarkManyPathVariables(b *testing.B)</a>

```
searchKey: mux.BenchmarkManyPathVariables
tags: [function private benchmark]
```

```Go
func BenchmarkManyPathVariables(b *testing.B)
```

### <a id="BenchmarkMux" href="#BenchmarkMux">func BenchmarkMux(b *testing.B)</a>

```
searchKey: mux.BenchmarkMux
tags: [function private benchmark]
```

```Go
func BenchmarkMux(b *testing.B)
```

### <a id="BenchmarkMuxAlternativeInRegexp" href="#BenchmarkMuxAlternativeInRegexp">func BenchmarkMuxAlternativeInRegexp(b *testing.B)</a>

```
searchKey: mux.BenchmarkMuxAlternativeInRegexp
tags: [function private benchmark]
```

```Go
func BenchmarkMuxAlternativeInRegexp(b *testing.B)
```

### <a id="Benchmark_findQueryKey" href="#Benchmark_findQueryKey">func Benchmark_findQueryKey(b *testing.B)</a>

```
searchKey: mux.Benchmark_findQueryKey
tags: [function private benchmark]
```

```Go
func Benchmark_findQueryKey(b *testing.B)
```

### <a id="Benchmark_findQueryKeyGoLib" href="#Benchmark_findQueryKeyGoLib">func Benchmark_findQueryKeyGoLib(b *testing.B)</a>

```
searchKey: mux.Benchmark_findQueryKeyGoLib
tags: [function private benchmark]
```

```Go
func Benchmark_findQueryKeyGoLib(b *testing.B)
```

### <a id="ExampleSetURLVars" href="#ExampleSetURLVars">func ExampleSetURLVars()</a>

```
searchKey: mux.ExampleSetURLVars
tags: [function private]
```

```Go
func ExampleSetURLVars()
```

### <a id="SetURLVars" href="#SetURLVars">func SetURLVars(r *http.Request, val map[string]string) *http.Request</a>

```
searchKey: mux.SetURLVars
tags: [function]
```

```Go
func SetURLVars(r *http.Request, val map[string]string) *http.Request
```

SetURLVars sets the URL variables for the given request, to be accessed via mux.Vars for testing route behaviour. Arguments are not modified, a shallow copy is returned. 

This API should only be used for testing purposes; it provides a way to inject variables into the request context. Alternatively, URL variables can be set by making a route that captures the required variables, starting a server and sending the request to that server. 

### <a id="Test301Redirect" href="#Test301Redirect">func Test301Redirect(t *testing.T)</a>

```
searchKey: mux.Test301Redirect
tags: [function private test]
```

```Go
func Test301Redirect(t *testing.T)
```

### <a id="TestBuildVarsFunc" href="#TestBuildVarsFunc">func TestBuildVarsFunc(t *testing.T)</a>

```
searchKey: mux.TestBuildVarsFunc
tags: [function private test]
```

```Go
func TestBuildVarsFunc(t *testing.T)
```

### <a id="TestCORSMethodMiddleware" href="#TestCORSMethodMiddleware">func TestCORSMethodMiddleware(t *testing.T)</a>

```
searchKey: mux.TestCORSMethodMiddleware
tags: [function private test]
```

```Go
func TestCORSMethodMiddleware(t *testing.T)
```

### <a id="TestCORSMethodMiddlewareSubrouter" href="#TestCORSMethodMiddlewareSubrouter">func TestCORSMethodMiddlewareSubrouter(t *testing.T)</a>

```
searchKey: mux.TestCORSMethodMiddlewareSubrouter
tags: [function private test]
```

```Go
func TestCORSMethodMiddlewareSubrouter(t *testing.T)
```

### <a id="TestContextMiddleware" href="#TestContextMiddleware">func TestContextMiddleware(t *testing.T)</a>

```
searchKey: mux.TestContextMiddleware
tags: [function private test]
```

```Go
func TestContextMiddleware(t *testing.T)
```

### <a id="TestErrMatchNotFound" href="#TestErrMatchNotFound">func TestErrMatchNotFound(t *testing.T)</a>

```
searchKey: mux.TestErrMatchNotFound
tags: [function private test]
```

```Go
func TestErrMatchNotFound(t *testing.T)
```

### <a id="TestHeaderMatcher" href="#TestHeaderMatcher">func TestHeaderMatcher(t *testing.T)</a>

```
searchKey: mux.TestHeaderMatcher
tags: [function private test]
```

```Go
func TestHeaderMatcher(t *testing.T)
```

### <a id="TestHeaders" href="#TestHeaders">func TestHeaders(t *testing.T)</a>

```
searchKey: mux.TestHeaders
tags: [function private test]
```

```Go
func TestHeaders(t *testing.T)
```

### <a id="TestHost" href="#TestHost">func TestHost(t *testing.T)</a>

```
searchKey: mux.TestHost
tags: [function private test]
```

```Go
func TestHost(t *testing.T)
```

### <a id="TestHostMatcher" href="#TestHostMatcher">func TestHostMatcher(t *testing.T)</a>

```
searchKey: mux.TestHostMatcher
tags: [function private test]
```

```Go
func TestHostMatcher(t *testing.T)
```

### <a id="TestMatchedRouteName" href="#TestMatchedRouteName">func TestMatchedRouteName(t *testing.T)</a>

```
searchKey: mux.TestMatchedRouteName
tags: [function private test]
```

```Go
func TestMatchedRouteName(t *testing.T)
```

### <a id="TestMatcherFunc" href="#TestMatcherFunc">func TestMatcherFunc(t *testing.T)</a>

```
searchKey: mux.TestMatcherFunc
tags: [function private test]
```

```Go
func TestMatcherFunc(t *testing.T)
```

### <a id="TestMethodMatcher" href="#TestMethodMatcher">func TestMethodMatcher(t *testing.T)</a>

```
searchKey: mux.TestMethodMatcher
tags: [function private test]
```

```Go
func TestMethodMatcher(t *testing.T)
```

### <a id="TestMethodNotAllowed" href="#TestMethodNotAllowed">func TestMethodNotAllowed(t *testing.T)</a>

```
searchKey: mux.TestMethodNotAllowed
tags: [function private test]
```

```Go
func TestMethodNotAllowed(t *testing.T)
```

### <a id="TestMethods" href="#TestMethods">func TestMethods(t *testing.T)</a>

```
searchKey: mux.TestMethods
tags: [function private test]
```

```Go
func TestMethods(t *testing.T)
```

### <a id="TestMethodsSubrouterCatchall" href="#TestMethodsSubrouterCatchall">func TestMethodsSubrouterCatchall(t *testing.T)</a>

```
searchKey: mux.TestMethodsSubrouterCatchall
tags: [function private test]
```

```Go
func TestMethodsSubrouterCatchall(t *testing.T)
```

TestMethodsSubrouterCatchall matches handlers for subrouters where a catchall handler is set for a mis-matching method. 

### <a id="TestMethodsSubrouterPathPrefix" href="#TestMethodsSubrouterPathPrefix">func TestMethodsSubrouterPathPrefix(t *testing.T)</a>

```
searchKey: mux.TestMethodsSubrouterPathPrefix
tags: [function private test]
```

```Go
func TestMethodsSubrouterPathPrefix(t *testing.T)
```

TestMethodsSubrouterPathPrefix matches handlers on subrouters created on a router with a path prefix matcher and method matcher. 

### <a id="TestMethodsSubrouterPathVariable" href="#TestMethodsSubrouterPathVariable">func TestMethodsSubrouterPathVariable(t *testing.T)</a>

```
searchKey: mux.TestMethodsSubrouterPathVariable
tags: [function private test]
```

```Go
func TestMethodsSubrouterPathVariable(t *testing.T)
```

TestMethodsSubrouterPathVariable matches handlers on matching paths with path variables in them. 

### <a id="TestMethodsSubrouterStrictSlash" href="#TestMethodsSubrouterStrictSlash">func TestMethodsSubrouterStrictSlash(t *testing.T)</a>

```
searchKey: mux.TestMethodsSubrouterStrictSlash
tags: [function private test]
```

```Go
func TestMethodsSubrouterStrictSlash(t *testing.T)
```

TestMethodsSubrouterStrictSlash matches handlers on subrouters with strict-slash matchers. 

### <a id="TestMethodsSubrouterSubrouter" href="#TestMethodsSubrouterSubrouter">func TestMethodsSubrouterSubrouter(t *testing.T)</a>

```
searchKey: mux.TestMethodsSubrouterSubrouter
tags: [function private test]
```

```Go
func TestMethodsSubrouterSubrouter(t *testing.T)
```

TestMethodsSubrouterSubrouter matches handlers on subrouters produced from method matchers registered on a root subrouter. 

### <a id="TestMiddleware" href="#TestMiddleware">func TestMiddleware(t *testing.T)</a>

```
searchKey: mux.TestMiddleware
tags: [function private test]
```

```Go
func TestMiddleware(t *testing.T)
```

### <a id="TestMiddlewareAdd" href="#TestMiddlewareAdd">func TestMiddlewareAdd(t *testing.T)</a>

```
searchKey: mux.TestMiddlewareAdd
tags: [function private test]
```

```Go
func TestMiddlewareAdd(t *testing.T)
```

### <a id="TestMiddlewareExecution" href="#TestMiddlewareExecution">func TestMiddlewareExecution(t *testing.T)</a>

```
searchKey: mux.TestMiddlewareExecution
tags: [function private test]
```

```Go
func TestMiddlewareExecution(t *testing.T)
```

### <a id="TestMiddlewareMethodMismatch" href="#TestMiddlewareMethodMismatch">func TestMiddlewareMethodMismatch(t *testing.T)</a>

```
searchKey: mux.TestMiddlewareMethodMismatch
tags: [function private test]
```

```Go
func TestMiddlewareMethodMismatch(t *testing.T)
```

### <a id="TestMiddlewareMethodMismatchSubrouter" href="#TestMiddlewareMethodMismatchSubrouter">func TestMiddlewareMethodMismatchSubrouter(t *testing.T)</a>

```
searchKey: mux.TestMiddlewareMethodMismatchSubrouter
tags: [function private test]
```

```Go
func TestMiddlewareMethodMismatchSubrouter(t *testing.T)
```

### <a id="TestMiddlewareNotFound" href="#TestMiddlewareNotFound">func TestMiddlewareNotFound(t *testing.T)</a>

```
searchKey: mux.TestMiddlewareNotFound
tags: [function private test]
```

```Go
func TestMiddlewareNotFound(t *testing.T)
```

### <a id="TestMiddlewareNotFoundSubrouter" href="#TestMiddlewareNotFoundSubrouter">func TestMiddlewareNotFoundSubrouter(t *testing.T)</a>

```
searchKey: mux.TestMiddlewareNotFoundSubrouter
tags: [function private test]
```

```Go
func TestMiddlewareNotFoundSubrouter(t *testing.T)
```

### <a id="TestMiddlewareOnMultiSubrouter" href="#TestMiddlewareOnMultiSubrouter">func TestMiddlewareOnMultiSubrouter(t *testing.T)</a>

```
searchKey: mux.TestMiddlewareOnMultiSubrouter
tags: [function private test]
```

```Go
func TestMiddlewareOnMultiSubrouter(t *testing.T)
```

### <a id="TestMiddlewareSubrouter" href="#TestMiddlewareSubrouter">func TestMiddlewareSubrouter(t *testing.T)</a>

```
searchKey: mux.TestMiddlewareSubrouter
tags: [function private test]
```

```Go
func TestMiddlewareSubrouter(t *testing.T)
```

### <a id="TestNameMultipleCalls" href="#TestNameMultipleCalls">func TestNameMultipleCalls(t *testing.T)</a>

```
searchKey: mux.TestNameMultipleCalls
tags: [function private test]
```

```Go
func TestNameMultipleCalls(t *testing.T)
```

### <a id="TestNamedRoutes" href="#TestNamedRoutes">func TestNamedRoutes(t *testing.T)</a>

```
searchKey: mux.TestNamedRoutes
tags: [function private test]
```

```Go
func TestNamedRoutes(t *testing.T)
```

### <a id="TestNewRegexp" href="#TestNewRegexp">func TestNewRegexp(t *testing.T)</a>

```
searchKey: mux.TestNewRegexp
tags: [function private test]
```

```Go
func TestNewRegexp(t *testing.T)
```

Test for the new regexp library, still not available in stable Go. 

### <a id="TestNoMatchMethodErrorHandler" href="#TestNoMatchMethodErrorHandler">func TestNoMatchMethodErrorHandler(t *testing.T)</a>

```
searchKey: mux.TestNoMatchMethodErrorHandler
tags: [function private test]
```

```Go
func TestNoMatchMethodErrorHandler(t *testing.T)
```

### <a id="TestPanicOnCapturingGroups" href="#TestPanicOnCapturingGroups">func TestPanicOnCapturingGroups(t *testing.T)</a>

```
searchKey: mux.TestPanicOnCapturingGroups
tags: [function private test]
```

```Go
func TestPanicOnCapturingGroups(t *testing.T)
```

See: [https://github.com/gorilla/mux/issues/200](https://github.com/gorilla/mux/issues/200) 

### <a id="TestPath" href="#TestPath">func TestPath(t *testing.T)</a>

```
searchKey: mux.TestPath
tags: [function private test]
```

```Go
func TestPath(t *testing.T)
```

### <a id="TestPathMatcher" href="#TestPathMatcher">func TestPathMatcher(t *testing.T)</a>

```
searchKey: mux.TestPathMatcher
tags: [function private test]
```

```Go
func TestPathMatcher(t *testing.T)
```

### <a id="TestPathPrefix" href="#TestPathPrefix">func TestPathPrefix(t *testing.T)</a>

```
searchKey: mux.TestPathPrefix
tags: [function private test]
```

```Go
func TestPathPrefix(t *testing.T)
```

### <a id="TestQueries" href="#TestQueries">func TestQueries(t *testing.T)</a>

```
searchKey: mux.TestQueries
tags: [function private test]
```

```Go
func TestQueries(t *testing.T)
```

### <a id="TestRedirectSlash" href="#TestRedirectSlash">func TestRedirectSlash(t *testing.T)</a>

```
searchKey: mux.TestRedirectSlash
tags: [function private test]
```

```Go
func TestRedirectSlash(t *testing.T)
```

### <a id="TestRouteMatchers" href="#TestRouteMatchers">func TestRouteMatchers(t *testing.T)</a>

```
searchKey: mux.TestRouteMatchers
tags: [function private test]
```

```Go
func TestRouteMatchers(t *testing.T)
```

### <a id="TestSchemeHostPath" href="#TestSchemeHostPath">func TestSchemeHostPath(t *testing.T)</a>

```
searchKey: mux.TestSchemeHostPath
tags: [function private test]
```

```Go
func TestSchemeHostPath(t *testing.T)
```

### <a id="TestSchemeMatcher" href="#TestSchemeMatcher">func TestSchemeMatcher(t *testing.T)</a>

```
searchKey: mux.TestSchemeMatcher
tags: [function private test]
```

```Go
func TestSchemeMatcher(t *testing.T)
```

### <a id="TestSchemeMatchers" href="#TestSchemeMatchers">func TestSchemeMatchers(t *testing.T)</a>

```
searchKey: mux.TestSchemeMatchers
tags: [function private test]
```

```Go
func TestSchemeMatchers(t *testing.T)
```

### <a id="TestSchemes" href="#TestSchemes">func TestSchemes(t *testing.T)</a>

```
searchKey: mux.TestSchemes
tags: [function private test]
```

```Go
func TestSchemes(t *testing.T)
```

### <a id="TestSkipClean" href="#TestSkipClean">func TestSkipClean(t *testing.T)</a>

```
searchKey: mux.TestSkipClean
tags: [function private test]
```

```Go
func TestSkipClean(t *testing.T)
```

### <a id="TestStrictSlash" href="#TestStrictSlash">func TestStrictSlash(t *testing.T)</a>

```
searchKey: mux.TestStrictSlash
tags: [function private test]
```

```Go
func TestStrictSlash(t *testing.T)
```

### <a id="TestSubRouter" href="#TestSubRouter">func TestSubRouter(t *testing.T)</a>

```
searchKey: mux.TestSubRouter
tags: [function private test]
```

```Go
func TestSubRouter(t *testing.T)
```

### <a id="TestSubRouting" href="#TestSubRouting">func TestSubRouting(t *testing.T)</a>

```
searchKey: mux.TestSubRouting
tags: [function private test]
```

```Go
func TestSubRouting(t *testing.T)
```

### <a id="TestSubrouterCustomMethodNotAllowed" href="#TestSubrouterCustomMethodNotAllowed">func TestSubrouterCustomMethodNotAllowed(t *testing.T)</a>

```
searchKey: mux.TestSubrouterCustomMethodNotAllowed
tags: [function private test]
```

```Go
func TestSubrouterCustomMethodNotAllowed(t *testing.T)
```

### <a id="TestSubrouterErrorHandling" href="#TestSubrouterErrorHandling">func TestSubrouterErrorHandling(t *testing.T)</a>

```
searchKey: mux.TestSubrouterErrorHandling
tags: [function private test]
```

```Go
func TestSubrouterErrorHandling(t *testing.T)
```

### <a id="TestSubrouterHeader" href="#TestSubrouterHeader">func TestSubrouterHeader(t *testing.T)</a>

```
searchKey: mux.TestSubrouterHeader
tags: [function private test]
```

```Go
func TestSubrouterHeader(t *testing.T)
```

[https://plus.google.com/101022900381697718949/posts/eWy6DjFJ6uW](https://plus.google.com/101022900381697718949/posts/eWy6DjFJ6uW) 

### <a id="TestSubrouterMatching" href="#TestSubrouterMatching">func TestSubrouterMatching(t *testing.T)</a>

```
searchKey: mux.TestSubrouterMatching
tags: [function private test]
```

```Go
func TestSubrouterMatching(t *testing.T)
```

### <a id="TestSubrouterNotFound" href="#TestSubrouterNotFound">func TestSubrouterNotFound(t *testing.T)</a>

```
searchKey: mux.TestSubrouterNotFound
tags: [function private test]
```

```Go
func TestSubrouterNotFound(t *testing.T)
```

### <a id="TestUrlBuilding" href="#TestUrlBuilding">func TestUrlBuilding(t *testing.T)</a>

```
searchKey: mux.TestUrlBuilding
tags: [function private test]
```

```Go
func TestUrlBuilding(t *testing.T)
```

### <a id="TestUseEncodedPath" href="#TestUseEncodedPath">func TestUseEncodedPath(t *testing.T)</a>

```
searchKey: mux.TestUseEncodedPath
tags: [function private test]
```

```Go
func TestUseEncodedPath(t *testing.T)
```

### <a id="TestVariableNames" href="#TestVariableNames">func TestVariableNames(t *testing.T)</a>

```
searchKey: mux.TestVariableNames
tags: [function private test]
```

```Go
func TestVariableNames(t *testing.T)
```

### <a id="TestWalkErrorHandler" href="#TestWalkErrorHandler">func TestWalkErrorHandler(t *testing.T)</a>

```
searchKey: mux.TestWalkErrorHandler
tags: [function private test]
```

```Go
func TestWalkErrorHandler(t *testing.T)
```

### <a id="TestWalkErrorMatcher" href="#TestWalkErrorMatcher">func TestWalkErrorMatcher(t *testing.T)</a>

```
searchKey: mux.TestWalkErrorMatcher
tags: [function private test]
```

```Go
func TestWalkErrorMatcher(t *testing.T)
```

### <a id="TestWalkErrorRoute" href="#TestWalkErrorRoute">func TestWalkErrorRoute(t *testing.T)</a>

```
searchKey: mux.TestWalkErrorRoute
tags: [function private test]
```

```Go
func TestWalkErrorRoute(t *testing.T)
```

### <a id="TestWalkNested" href="#TestWalkNested">func TestWalkNested(t *testing.T)</a>

```
searchKey: mux.TestWalkNested
tags: [function private test]
```

```Go
func TestWalkNested(t *testing.T)
```

### <a id="TestWalkSingleDepth" href="#TestWalkSingleDepth">func TestWalkSingleDepth(t *testing.T)</a>

```
searchKey: mux.TestWalkSingleDepth
tags: [function private test]
```

```Go
func TestWalkSingleDepth(t *testing.T)
```

### <a id="TestWalkSubrouters" href="#TestWalkSubrouters">func TestWalkSubrouters(t *testing.T)</a>

```
searchKey: mux.TestWalkSubrouters
tags: [function private test]
```

```Go
func TestWalkSubrouters(t *testing.T)
```

### <a id="Test_copyRouteConf" href="#Test_copyRouteConf">func Test_copyRouteConf(t *testing.T)</a>

```
searchKey: mux.Test_copyRouteConf
tags: [function private test]
```

```Go
func Test_copyRouteConf(t *testing.T)
```

verify that copyRouteConf copies fields as expected. 

### <a id="Test_findFirstQueryKey" href="#Test_findFirstQueryKey">func Test_findFirstQueryKey(t *testing.T)</a>

```
searchKey: mux.Test_findFirstQueryKey
tags: [function private test]
```

```Go
func Test_findFirstQueryKey(t *testing.T)
```

### <a id="Vars" href="#Vars">func Vars(r *http.Request) map[string]string</a>

```
searchKey: mux.Vars
tags: [function]
```

```Go
func Vars(r *http.Request) map[string]string
```

Vars returns the route variables for the current request, if any. 

### <a id="braceIndices" href="#braceIndices">func braceIndices(s string) ([]int, error)</a>

```
searchKey: mux.braceIndices
tags: [function private]
```

```Go
func braceIndices(s string) ([]int, error)
```

braceIndices returns the first level curly brace indices from a string. It returns an error in case of unbalanced braces. 

### <a id="checkPairs" href="#checkPairs">func checkPairs(pairs ...string) (int, error)</a>

```
searchKey: mux.checkPairs
tags: [function private]
```

```Go
func checkPairs(pairs ...string) (int, error)
```

checkPairs returns the count of strings passed in, and an error if the count is not an even number. 

### <a id="cleanPath" href="#cleanPath">func cleanPath(p string) string</a>

```
searchKey: mux.cleanPath
tags: [function private]
```

```Go
func cleanPath(p string) string
```

cleanPath returns the canonical path for p, eliminating . and .. elements. Borrowed from the net/http package. 

### <a id="dummyHandler" href="#dummyHandler">func dummyHandler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: mux.dummyHandler
tags: [function private]
```

```Go
func dummyHandler(w http.ResponseWriter, r *http.Request)
```

### <a id="extractVars" href="#extractVars">func extractVars(input string, matches []int, names []string, output map[string]string)</a>

```
searchKey: mux.extractVars
tags: [function private]
```

```Go
func extractVars(input string, matches []int, names []string, output map[string]string)
```

### <a id="findFirstQueryKey" href="#findFirstQueryKey">func findFirstQueryKey(rawQuery, key string) (value string, ok bool)</a>

```
searchKey: mux.findFirstQueryKey
tags: [function private]
```

```Go
func findFirstQueryKey(rawQuery, key string) (value string, ok bool)
```

findFirstQueryKey returns the same result as (*url.URL).Query()[key][0]. If key was not found, empty string and false is returned. 

### <a id="getAllMethodsForRoute" href="#getAllMethodsForRoute">func getAllMethodsForRoute(r *Router, req *http.Request) ([]string, error)</a>

```
searchKey: mux.getAllMethodsForRoute
tags: [function private]
```

```Go
func getAllMethodsForRoute(r *Router, req *http.Request) ([]string, error)
```

getAllMethodsForRoute returns all the methods from method matchers matching a given request. 

### <a id="getHost" href="#getHost">func getHost(r *http.Request) string</a>

```
searchKey: mux.getHost
tags: [function private]
```

```Go
func getHost(r *http.Request) string
```

getHost tries its best to return the request host. According to section 14.23 of RFC 2616 the Host header can include the port number if the default value of 80 is not used. 

### <a id="getRouteTemplate" href="#getRouteTemplate">func getRouteTemplate(route *Route) string</a>

```
searchKey: mux.getRouteTemplate
tags: [function private]
```

```Go
func getRouteTemplate(route *Route) string
```

### <a id="mapFromPairsToRegex" href="#mapFromPairsToRegex">func mapFromPairsToRegex(pairs ...string) (map[string]*regexp.Regexp, error)</a>

```
searchKey: mux.mapFromPairsToRegex
tags: [function private]
```

```Go
func mapFromPairsToRegex(pairs ...string) (map[string]*regexp.Regexp, error)
```

mapFromPairsToRegex converts variadic string parameters to a string to regex map. 

### <a id="mapFromPairsToString" href="#mapFromPairsToString">func mapFromPairsToString(pairs ...string) (map[string]string, error)</a>

```
searchKey: mux.mapFromPairsToString
tags: [function private]
```

```Go
func mapFromPairsToString(pairs ...string) (map[string]string, error)
```

mapFromPairsToString converts variadic string parameters to a string to string map. 

### <a id="mapToPairs" href="#mapToPairs">func mapToPairs(m map[string]string) []string</a>

```
searchKey: mux.mapToPairs
tags: [function private]
```

```Go
func mapToPairs(m map[string]string) []string
```

mapToPairs converts a string map to a slice of string pairs 

### <a id="matchInArray" href="#matchInArray">func matchInArray(arr []string, value string) bool</a>

```
searchKey: mux.matchInArray
tags: [function private]
```

```Go
func matchInArray(arr []string, value string) bool
```

matchInArray returns true if the given string value is in the array. 

### <a id="matchMapWithRegex" href="#matchMapWithRegex">func matchMapWithRegex(toCheck map[string]*regexp.Regexp, toMatch map[string][]string, canonicalKey bool) bool</a>

```
searchKey: mux.matchMapWithRegex
tags: [function private]
```

```Go
func matchMapWithRegex(toCheck map[string]*regexp.Regexp, toMatch map[string][]string, canonicalKey bool) bool
```

matchMapWithRegex returns true if the given key/value pairs exist in a given map compiled against the given regex 

### <a id="matchMapWithString" href="#matchMapWithString">func matchMapWithString(toCheck map[string]string, toMatch map[string][]string, canonicalKey bool) bool</a>

```
searchKey: mux.matchMapWithString
tags: [function private]
```

```Go
func matchMapWithString(toCheck map[string]string, toMatch map[string][]string, canonicalKey bool) bool
```

matchMapWithString returns true if the given key/value pairs exist in a given map. 

### <a id="methodHandler" href="#methodHandler">func methodHandler(method string) http.HandlerFunc</a>

```
searchKey: mux.methodHandler
tags: [function private]
```

```Go
func methodHandler(method string) http.HandlerFunc
```

methodHandler writes the method string in response. 

### <a id="methodNotAllowed" href="#methodNotAllowed">func methodNotAllowed(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: mux.methodNotAllowed
tags: [function private]
```

```Go
func methodNotAllowed(w http.ResponseWriter, r *http.Request)
```

methodNotAllowed replies to the request with an HTTP status code 405. 

### <a id="methodNotAllowedHandler" href="#methodNotAllowedHandler">func methodNotAllowedHandler() http.Handler</a>

```
searchKey: mux.methodNotAllowedHandler
tags: [function private]
```

```Go
func methodNotAllowedHandler() http.Handler
```

methodNotAllowedHandler returns a simple request handler that replies to each request with a status code 405. 

### <a id="newRequest" href="#newRequest">func newRequest(method, url string) *http.Request</a>

```
searchKey: mux.newRequest
tags: [function private]
```

```Go
func newRequest(method, url string) *http.Request
```

newRequest is a helper function to create a new request with a method and url. The request returned is a 'server' request as opposed to a 'client' one through simulated write onto the wire and read off of the wire. The differences between requests are detailed in the net/http package. 

### <a id="newRequestHost" href="#newRequestHost">func newRequestHost(method, url, host string) *http.Request</a>

```
searchKey: mux.newRequestHost
tags: [function private]
```

```Go
func newRequestHost(method, url, host string) *http.Request
```

newRequestHost a new request with a method, url, and host header 

### <a id="newRequestWithHeaders" href="#newRequestWithHeaders">func newRequestWithHeaders(method, url string, headers ...string) *http.Request</a>

```
searchKey: mux.newRequestWithHeaders
tags: [function private]
```

```Go
func newRequestWithHeaders(method, url string, headers ...string) *http.Request
```

create a new request with the provided headers 

### <a id="requestWithRoute" href="#requestWithRoute">func requestWithRoute(r *http.Request, route *Route) *http.Request</a>

```
searchKey: mux.requestWithRoute
tags: [function private]
```

```Go
func requestWithRoute(r *http.Request, route *Route) *http.Request
```

### <a id="requestWithVars" href="#requestWithVars">func requestWithVars(r *http.Request, vars map[string]string) *http.Request</a>

```
searchKey: mux.requestWithVars
tags: [function private]
```

```Go
func requestWithVars(r *http.Request, vars map[string]string) *http.Request
```

### <a id="stringHandler" href="#stringHandler">func stringHandler(s string) http.HandlerFunc</a>

```
searchKey: mux.stringHandler
tags: [function private]
```

```Go
func stringHandler(s string) http.HandlerFunc
```

stringHandler returns a handler func that writes a message 's' to the http.ResponseWriter. 

### <a id="stringMapEqual" href="#stringMapEqual">func stringMapEqual(m1, m2 map[string]string) bool</a>

```
searchKey: mux.stringMapEqual
tags: [function private]
```

```Go
func stringMapEqual(m1, m2 map[string]string) bool
```

stringMapEqual checks the equality of two string maps 

### <a id="testMethods" href="#testMethods">func testMethods(t *testing.T, test routeTest)</a>

```
searchKey: mux.testMethods
tags: [function private]
```

```Go
func testMethods(t *testing.T, test routeTest)
```

### <a id="testMethodsSubrouter" href="#testMethodsSubrouter">func testMethodsSubrouter(t *testing.T, test methodsSubrouterTest)</a>

```
searchKey: mux.testMethodsSubrouter
tags: [function private]
```

```Go
func testMethodsSubrouter(t *testing.T, test methodsSubrouterTest)
```

testMethodsSubrouter runs an individual methodsSubrouterTest. 

### <a id="testQueriesRegexp" href="#testQueriesRegexp">func testQueriesRegexp(t *testing.T, test routeTest)</a>

```
searchKey: mux.testQueriesRegexp
tags: [function private]
```

```Go
func testQueriesRegexp(t *testing.T, test routeTest)
```

### <a id="testQueriesTemplates" href="#testQueriesTemplates">func testQueriesTemplates(t *testing.T, test routeTest)</a>

```
searchKey: mux.testQueriesTemplates
tags: [function private]
```

```Go
func testQueriesTemplates(t *testing.T, test routeTest)
```

### <a id="testRegexp" href="#testRegexp">func testRegexp(t *testing.T, test routeTest)</a>

```
searchKey: mux.testRegexp
tags: [function private]
```

```Go
func testRegexp(t *testing.T, test routeTest)
```

### <a id="testRoute" href="#testRoute">func testRoute(t *testing.T, test routeTest)</a>

```
searchKey: mux.testRoute
tags: [function private]
```

```Go
func testRoute(t *testing.T, test routeTest)
```

### <a id="testTemplate" href="#testTemplate">func testTemplate(t *testing.T, test routeTest)</a>

```
searchKey: mux.testTemplate
tags: [function private]
```

```Go
func testTemplate(t *testing.T, test routeTest)
```

### <a id="testUseEscapedRoute" href="#testUseEscapedRoute">func testUseEscapedRoute(t *testing.T, test routeTest)</a>

```
searchKey: mux.testUseEscapedRoute
tags: [function private]
```

```Go
func testUseEscapedRoute(t *testing.T, test routeTest)
```

### <a id="uniqueVars" href="#uniqueVars">func uniqueVars(s1, s2 []string) error</a>

```
searchKey: mux.uniqueVars
tags: [function private]
```

```Go
func uniqueVars(s1, s2 []string) error
```

uniqueVars returns an error if two slices contain duplicated strings. 

### <a id="varGroupName" href="#varGroupName">func varGroupName(idx int) string</a>

```
searchKey: mux.varGroupName
tags: [function private]
```

```Go
func varGroupName(idx int) string
```

varGroupName builds a capturing group name for the indexed variable. 

