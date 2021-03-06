# Package debugproxies

## Index

* [Types](#type)
    * [type Endpoint struct](#Endpoint)
    * [type ReverseProxyHandler struct](#ReverseProxyHandler)
        * [func (rph *ReverseProxyHandler) AddToRouter(r *mux.Router)](#ReverseProxyHandler.AddToRouter)
        * [func (rph *ReverseProxyHandler) Populate(peps []Endpoint)](#ReverseProxyHandler.Populate)
        * [func (rph *ReverseProxyHandler) serveIndex(w http.ResponseWriter, r *http.Request)](#ReverseProxyHandler.serveIndex)
        * [func (rph *ReverseProxyHandler) serveReverseProxy(w http.ResponseWriter, r *http.Request) error](#ReverseProxyHandler.serveReverseProxy)
    * [type ScanConsumer func([]github.com/sourcegraph/sourcegraph/cmd/frontend/internal/app/debugproxies.Endpoint)](#ScanConsumer)
    * [type clusterScanner struct](#clusterScanner)
        * [func (cs *clusterScanner) runEventLoop()](#clusterScanner.runEventLoop)
        * [func (cs *clusterScanner) scanCluster()](#clusterScanner.scanCluster)
        * [func (cs *clusterScanner) watchEndpointEvents() (bool, error)](#clusterScanner.watchEndpointEvents)
    * [type proxyEndpoint struct](#proxyEndpoint)
* [Functions](#func)
    * [func StartClusterScanner(consumer ScanConsumer) error](#StartClusterScanner)
    * [func TestClusterScan(t *testing.T)](#TestClusterScan)
    * [func TestDisplayNameFromEndpoint(t *testing.T)](#TestDisplayNameFromEndpoint)
    * [func TestIndexLinks(t *testing.T)](#TestIndexLinks)
    * [func TestReverseProxyRequestPaths(t *testing.T)](#TestReverseProxyRequestPaths)
    * [func adminOnly(next http.Handler) http.Handler](#adminOnly)
    * [func displayNameFromEndpoint(ep Endpoint) string](#displayNameFromEndpoint)
    * [func namespace() string](#namespace)
    * [func reverseProxyFromHost(host string, pathPrefix string) http.Handler](#reverseProxyFromHost)
    * [func startClusterScannerWithClient(client *kubernetes.Clientset, ns string, consumer ScanConsumer) error](#startClusterScannerWithClient)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Endpoint" href="#Endpoint">type Endpoint struct</a>

```
searchKey: debugproxies.Endpoint
tags: [struct]
```

```Go
type Endpoint struct {
	// Service to which the endpoint belongs
	Service string
	// Addr:port, so hostname part of a URL (ip address ok)
	Addr string
	// Hostname of the endpoint, if set. Only use this for display purposes,
	// it doesn't include the port nor is it gaurenteed to be resolvable.
	Hostname string
}
```

Represents an endpoint 

### <a id="ReverseProxyHandler" href="#ReverseProxyHandler">type ReverseProxyHandler struct</a>

```
searchKey: debugproxies.ReverseProxyHandler
tags: [struct]
```

```Go
type ReverseProxyHandler struct {
	// protects the reverseProxies map
	sync.RWMutex
	// keys are the displayNames
	reverseProxies map[string]*proxyEndpoint
}
```

ReverseProxyHandler handles serving the index page and routing the requests being proxied to their respective reverse proxy. proxyEndpoints come from callers calling ReverseProxyHandler.Populate(). zero value is useful and will provide a "no endpoint found" index until some endpoints get populated. 

#### <a id="ReverseProxyHandler.AddToRouter" href="#ReverseProxyHandler.AddToRouter">func (rph *ReverseProxyHandler) AddToRouter(r *mux.Router)</a>

```
searchKey: debugproxies.ReverseProxyHandler.AddToRouter
tags: [method]
```

```Go
func (rph *ReverseProxyHandler) AddToRouter(r *mux.Router)
```

#### <a id="ReverseProxyHandler.Populate" href="#ReverseProxyHandler.Populate">func (rph *ReverseProxyHandler) Populate(peps []Endpoint)</a>

```
searchKey: debugproxies.ReverseProxyHandler.Populate
tags: [method]
```

```Go
func (rph *ReverseProxyHandler) Populate(peps []Endpoint)
```

Populate declares the proxyEndpoints to use. This method can be called at any time from any goroutine. It completely replaces the previous proxied endpoints with the ones specified in the call. 

#### <a id="ReverseProxyHandler.serveIndex" href="#ReverseProxyHandler.serveIndex">func (rph *ReverseProxyHandler) serveIndex(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: debugproxies.ReverseProxyHandler.serveIndex
tags: [method private]
```

```Go
func (rph *ReverseProxyHandler) serveIndex(w http.ResponseWriter, r *http.Request)
```

serveIndex composes the simple index page with the endpoints sorted by their name. 

#### <a id="ReverseProxyHandler.serveReverseProxy" href="#ReverseProxyHandler.serveReverseProxy">func (rph *ReverseProxyHandler) serveReverseProxy(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: debugproxies.ReverseProxyHandler.serveReverseProxy
tags: [method private]
```

```Go
func (rph *ReverseProxyHandler) serveReverseProxy(w http.ResponseWriter, r *http.Request) error
```

serveReverseProxy routes the request to the appropriate reverse proxy by splitting the request path and finding the displayName under which the proxy lives. 

### <a id="ScanConsumer" href="#ScanConsumer">type ScanConsumer func([]github.com/sourcegraph/sourcegraph/cmd/frontend/internal/app/debugproxies.Endpoint)</a>

```
searchKey: debugproxies.ScanConsumer
tags: [function]
```

```Go
type ScanConsumer func([]Endpoint)
```

ScanConsumer is the callback to consume scan results. 

### <a id="clusterScanner" href="#clusterScanner">type clusterScanner struct</a>

```
searchKey: debugproxies.clusterScanner
tags: [struct private]
```

```Go
type clusterScanner struct {
	client    v1.CoreV1Interface
	namespace string
	consume   ScanConsumer
}
```

clusterScanner scans the cluster for endpoints belonging to services that have annotation sourcegraph.prometheus/scrape=true. It runs an event loop that reacts to changes to the endpoints set. Everytime there is a change it calls the ScanConsumer. 

#### <a id="clusterScanner.runEventLoop" href="#clusterScanner.runEventLoop">func (cs *clusterScanner) runEventLoop()</a>

```
searchKey: debugproxies.clusterScanner.runEventLoop
tags: [method private]
```

```Go
func (cs *clusterScanner) runEventLoop()
```

Runs the k8s.Watch endpoints event loop, and triggers a rescan of cluster when something changes with endpoints. Before spinning in the loop does an initial scan. 

#### <a id="clusterScanner.scanCluster" href="#clusterScanner.scanCluster">func (cs *clusterScanner) scanCluster()</a>

```
searchKey: debugproxies.clusterScanner.scanCluster
tags: [method private]
```

```Go
func (cs *clusterScanner) scanCluster()
```

scanCluster looks for endpoints belonging to services that have annotation sourcegraph.prometheus/scrape=true. It derives the appropriate port from the prometheus.io/port annotation. 

#### <a id="clusterScanner.watchEndpointEvents" href="#clusterScanner.watchEndpointEvents">func (cs *clusterScanner) watchEndpointEvents() (bool, error)</a>

```
searchKey: debugproxies.clusterScanner.watchEndpointEvents
tags: [method private]
```

```Go
func (cs *clusterScanner) watchEndpointEvents() (bool, error)
```

watchEndpointEvents uses the k8s watch API operation to watch for endpoint events. Spins forever unless an error occurs that would necessitate creating a new watcher. The caller will then call again creating the new watcher. 

### <a id="proxyEndpoint" href="#proxyEndpoint">type proxyEndpoint struct</a>

```
searchKey: debugproxies.proxyEndpoint
tags: [struct private]
```

```Go
type proxyEndpoint struct {
	reverseProxy http.Handler
	host         string
}
```

proxyEndpoint couples the reverse proxy with the endpoint it proxies. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="StartClusterScanner" href="#StartClusterScanner">func StartClusterScanner(consumer ScanConsumer) error</a>

```
searchKey: debugproxies.StartClusterScanner
tags: [function]
```

```Go
func StartClusterScanner(consumer ScanConsumer) error
```

Starts a cluster scanner with the specified consumer. Does not block. 

### <a id="TestClusterScan" href="#TestClusterScan">func TestClusterScan(t *testing.T)</a>

```
searchKey: debugproxies.TestClusterScan
tags: [function private test]
```

```Go
func TestClusterScan(t *testing.T)
```

### <a id="TestDisplayNameFromEndpoint" href="#TestDisplayNameFromEndpoint">func TestDisplayNameFromEndpoint(t *testing.T)</a>

```
searchKey: debugproxies.TestDisplayNameFromEndpoint
tags: [function private test]
```

```Go
func TestDisplayNameFromEndpoint(t *testing.T)
```

### <a id="TestIndexLinks" href="#TestIndexLinks">func TestIndexLinks(t *testing.T)</a>

```
searchKey: debugproxies.TestIndexLinks
tags: [function private test]
```

```Go
func TestIndexLinks(t *testing.T)
```

### <a id="TestReverseProxyRequestPaths" href="#TestReverseProxyRequestPaths">func TestReverseProxyRequestPaths(t *testing.T)</a>

```
searchKey: debugproxies.TestReverseProxyRequestPaths
tags: [function private test]
```

```Go
func TestReverseProxyRequestPaths(t *testing.T)
```

### <a id="adminOnly" href="#adminOnly">func adminOnly(next http.Handler) http.Handler</a>

```
searchKey: debugproxies.adminOnly
tags: [function private]
```

```Go
func adminOnly(next http.Handler) http.Handler
```

adminOnly is a HTTP middleware which only allows requests by admins. 

### <a id="displayNameFromEndpoint" href="#displayNameFromEndpoint">func displayNameFromEndpoint(ep Endpoint) string</a>

```
searchKey: debugproxies.displayNameFromEndpoint
tags: [function private]
```

```Go
func displayNameFromEndpoint(ep Endpoint) string
```

Creates a display name from an endpoint suited for using in a URL link. 

### <a id="namespace" href="#namespace">func namespace() string</a>

```
searchKey: debugproxies.namespace
tags: [function private]
```

```Go
func namespace() string
```

namespace returns the namespace the pod is currently running in this is done because the k8s client we previously used set the namespace when the client was created, the official k8s client does not 

### <a id="reverseProxyFromHost" href="#reverseProxyFromHost">func reverseProxyFromHost(host string, pathPrefix string) http.Handler</a>

```
searchKey: debugproxies.reverseProxyFromHost
tags: [function private]
```

```Go
func reverseProxyFromHost(host string, pathPrefix string) http.Handler
```

reverseProxyFromHost creates a reverse proxy from specified host with the path prefix that will be stripped from request before it gets sent to the destination endpoint. 

### <a id="startClusterScannerWithClient" href="#startClusterScannerWithClient">func startClusterScannerWithClient(client *kubernetes.Clientset, ns string, consumer ScanConsumer) error</a>

```
searchKey: debugproxies.startClusterScannerWithClient
tags: [function private]
```

```Go
func startClusterScannerWithClient(client *kubernetes.Clientset, ns string, consumer ScanConsumer) error
```

Starts a cluster scanner with the specified client and consumer. Does not block. 

