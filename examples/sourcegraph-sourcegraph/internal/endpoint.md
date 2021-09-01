# Package endpoint

Package endpoint provides a consistent hash map for URLs to kubernetes endpoints. 

## Index

* [Variables](#var)
    * [var metricEndpointSize](#metricEndpointSize)
* [Types](#type)
    * [type Map struct](#Map)
        * [func Empty(err error) *Map](#Empty)
        * [func New(urlspec string) *Map](#New)
        * [func Static(endpoints ...string) *Map](#Static)
        * [func (m *Map) Endpoints() (map[string]struct{}, error)](#Map.Endpoints)
        * [func (m *Map) Get(key string, exclude map[string]bool) (string, error)](#Map.Get)
        * [func (m *Map) GetMany(keys ...string) ([]string, error)](#Map.GetMany)
        * [func (m *Map) String() string](#Map.String)
        * [func (m *Map) getUrls() (*hashMap, error)](#Map.getUrls)
    * [type hashFn func(data []byte) uint32](#hashFn)
    * [type hashMap struct](#hashMap)
        * [func endpointsToMap(u *k8sURL, eps corev1.Endpoints) (*hashMap, error)](#endpointsToMap)
        * [func hashMapNew(replicas int, fn hashFn) *hashMap](#hashMapNew)
        * [func newConsistentHashMap(keys []string) *hashMap](#newConsistentHashMap)
        * [func (m *hashMap) add(keys ...string)](#hashMap.add)
        * [func (m *hashMap) get(key string, exclude map[string]bool) string](#hashMap.get)
        * [func (m *hashMap) isEmpty() bool](#hashMap.isEmpty)
    * [type k8sURL struct](#k8sURL)
        * [func parseURL(rawurl string) (*k8sURL, error)](#parseURL)
        * [func (u *k8sURL) endpointURL(endpoint string) string](#k8sURL.endpointURL)
* [Functions](#func)
    * [func TestEndpoints(t *testing.T)](#TestEndpoints)
    * [func TestExclude(t *testing.T)](#TestExclude)
    * [func TestK8sURL(t *testing.T)](#TestK8sURL)
    * [func TestNew(t *testing.T)](#TestNew)
    * [func TestStatic(t *testing.T)](#TestStatic)
    * [func expectEndpoints(t *testing.T, m *Map, exclude map[string]bool, endpoints ...string)](#expectEndpoints)
    * [func inform(client v1.EndpointsInterface, m *Map, u *k8sURL) error](#inform)
    * [func loadClient() (client *kubernetes.Clientset, ns string, err error)](#loadClient)
    * [func namespace() string](#namespace)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="metricEndpointSize" href="#metricEndpointSize">var metricEndpointSize</a>

```
searchKey: endpoint.metricEndpointSize
tags: [variable struct private]
```

```Go
var metricEndpointSize = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Map" href="#Map">type Map struct</a>

```
searchKey: endpoint.Map
tags: [struct]
```

```Go
type Map struct {
	mu      sync.Mutex
	init    func() (*hashMap, error)
	err     error
	urls    *hashMap
	urlspec string
}
```

Map is a consistent hash map to URLs. It uses the kubernetes API to watch the endpoints for a service and update the map when they change. It can also fallback to static URLs if not configured for kubernetes. 

#### <a id="Empty" href="#Empty">func Empty(err error) *Map</a>

```
searchKey: endpoint.Empty
tags: [function]
```

```Go
func Empty(err error) *Map
```

Empty returns an Endpoint map which always fails with err. 

#### <a id="New" href="#New">func New(urlspec string) *Map</a>

```
searchKey: endpoint.New
tags: [function]
```

```Go
func New(urlspec string) *Map
```

New creates a new Map for the URL specifier. 

If the scheme is prefixed with "k8s+", one URL is expected and the format is expected to match e.g. k8s+[http://service.namespace:port/path](http://service.namespace:port/path). namespace, port and path are optional. URLs of this form will consistently hash among the endpoints for the Kubernetes service. The values returned by Get will look like [http://endpoint:port/path](http://endpoint:port/path). 

If the scheme is not prefixed with "k8s+", a space separated list of URLs is expected. The map will consistently hash against these URLs in this case. This is useful for specifying non-Kubernetes endpoints. 

Examples URL specifiers: 

```
"k8s+[http://searcher](http://searcher)"
"[http://searcher-1](http://searcher-1) [http://searcher-2](http://searcher-2) [http://searcher-3](http://searcher-3)"

```
#### <a id="Static" href="#Static">func Static(endpoints ...string) *Map</a>

```
searchKey: endpoint.Static
tags: [function]
```

```Go
func Static(endpoints ...string) *Map
```

Static returns an Endpoint map which consistently hashes over endpoints. 

There are no requirements on endpoints, it can be any arbitrary string. Unlike static endpoints created via New. 

Static Maps are guaranteed to never return an error. 

#### <a id="Map.Endpoints" href="#Map.Endpoints">func (m *Map) Endpoints() (map[string]struct{}, error)</a>

```
searchKey: endpoint.Map.Endpoints
tags: [method]
```

```Go
func (m *Map) Endpoints() (map[string]struct{}, error)
```

Endpoints returns a set of all addresses. Do not modify the returned value. 

#### <a id="Map.Get" href="#Map.Get">func (m *Map) Get(key string, exclude map[string]bool) (string, error)</a>

```
searchKey: endpoint.Map.Get
tags: [method]
```

```Go
func (m *Map) Get(key string, exclude map[string]bool) (string, error)
```

Get the closest URL in the hash to the provided key that is not in exclude. If no URL is found, "" is returned. 

Note: For k8s URLs we return URLs based on the registered endpoints. The endpoint may not actually be available yet / at the moment. So users of the URL should implement a retry strategy. 

#### <a id="Map.GetMany" href="#Map.GetMany">func (m *Map) GetMany(keys ...string) ([]string, error)</a>

```
searchKey: endpoint.Map.GetMany
tags: [method]
```

```Go
func (m *Map) GetMany(keys ...string) ([]string, error)
```

GetMany is the same as calling Get on each item of keys. It will only acquire the underlying endpoint map once, so is preferred to calling Get for each key which will acquire the endpoint map for each call. The benefit is it is faster (O(1) mutex acquires vs O(n)) and consistent (endpoint map is immutable vs may change between Get calls). 

#### <a id="Map.String" href="#Map.String">func (m *Map) String() string</a>

```
searchKey: endpoint.Map.String
tags: [method]
```

```Go
func (m *Map) String() string
```

#### <a id="Map.getUrls" href="#Map.getUrls">func (m *Map) getUrls() (*hashMap, error)</a>

```
searchKey: endpoint.Map.getUrls
tags: [method private]
```

```Go
func (m *Map) getUrls() (*hashMap, error)
```

### <a id="hashFn" href="#hashFn">type hashFn func(data []byte) uint32</a>

```
searchKey: endpoint.hashFn
tags: [function private]
```

```Go
type hashFn func(data []byte) uint32
```

### <a id="hashMap" href="#hashMap">type hashMap struct</a>

```
searchKey: endpoint.hashMap
tags: [struct private]
```

```Go
type hashMap struct {
	hash     hashFn
	replicas int
	keys     []int // Sorted
	hashMap  map[int]string
	values   map[string]struct{}
}
```

#### <a id="endpointsToMap" href="#endpointsToMap">func endpointsToMap(u *k8sURL, eps corev1.Endpoints) (*hashMap, error)</a>

```
searchKey: endpoint.endpointsToMap
tags: [function private]
```

```Go
func endpointsToMap(u *k8sURL, eps corev1.Endpoints) (*hashMap, error)
```

#### <a id="hashMapNew" href="#hashMapNew">func hashMapNew(replicas int, fn hashFn) *hashMap</a>

```
searchKey: endpoint.hashMapNew
tags: [function private]
```

```Go
func hashMapNew(replicas int, fn hashFn) *hashMap
```

#### <a id="newConsistentHashMap" href="#newConsistentHashMap">func newConsistentHashMap(keys []string) *hashMap</a>

```
searchKey: endpoint.newConsistentHashMap
tags: [function private]
```

```Go
func newConsistentHashMap(keys []string) *hashMap
```

#### <a id="hashMap.add" href="#hashMap.add">func (m *hashMap) add(keys ...string)</a>

```
searchKey: endpoint.hashMap.add
tags: [method private]
```

```Go
func (m *hashMap) add(keys ...string)
```

Adds some keys to the hash. 

#### <a id="hashMap.get" href="#hashMap.get">func (m *hashMap) get(key string, exclude map[string]bool) string</a>

```
searchKey: endpoint.hashMap.get
tags: [method private]
```

```Go
func (m *hashMap) get(key string, exclude map[string]bool) string
```

Gets the closest item in the hash to the provided key that is not in exclude. 

#### <a id="hashMap.isEmpty" href="#hashMap.isEmpty">func (m *hashMap) isEmpty() bool</a>

```
searchKey: endpoint.hashMap.isEmpty
tags: [method private]
```

```Go
func (m *hashMap) isEmpty() bool
```

Returns true if there are no items available. 

### <a id="k8sURL" href="#k8sURL">type k8sURL struct</a>

```
searchKey: endpoint.k8sURL
tags: [struct private]
```

```Go
type k8sURL struct {
	url.URL

	Service   string
	Namespace string
}
```

#### <a id="parseURL" href="#parseURL">func parseURL(rawurl string) (*k8sURL, error)</a>

```
searchKey: endpoint.parseURL
tags: [function private]
```

```Go
func parseURL(rawurl string) (*k8sURL, error)
```

#### <a id="k8sURL.endpointURL" href="#k8sURL.endpointURL">func (u *k8sURL) endpointURL(endpoint string) string</a>

```
searchKey: endpoint.k8sURL.endpointURL
tags: [method private]
```

```Go
func (u *k8sURL) endpointURL(endpoint string) string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestEndpoints" href="#TestEndpoints">func TestEndpoints(t *testing.T)</a>

```
searchKey: endpoint.TestEndpoints
tags: [function private test]
```

```Go
func TestEndpoints(t *testing.T)
```

### <a id="TestExclude" href="#TestExclude">func TestExclude(t *testing.T)</a>

```
searchKey: endpoint.TestExclude
tags: [function private test]
```

```Go
func TestExclude(t *testing.T)
```

### <a id="TestK8sURL" href="#TestK8sURL">func TestK8sURL(t *testing.T)</a>

```
searchKey: endpoint.TestK8sURL
tags: [function private test]
```

```Go
func TestK8sURL(t *testing.T)
```

### <a id="TestNew" href="#TestNew">func TestNew(t *testing.T)</a>

```
searchKey: endpoint.TestNew
tags: [function private test]
```

```Go
func TestNew(t *testing.T)
```

### <a id="TestStatic" href="#TestStatic">func TestStatic(t *testing.T)</a>

```
searchKey: endpoint.TestStatic
tags: [function private test]
```

```Go
func TestStatic(t *testing.T)
```

### <a id="expectEndpoints" href="#expectEndpoints">func expectEndpoints(t *testing.T, m *Map, exclude map[string]bool, endpoints ...string)</a>

```
searchKey: endpoint.expectEndpoints
tags: [function private]
```

```Go
func expectEndpoints(t *testing.T, m *Map, exclude map[string]bool, endpoints ...string)
```

### <a id="inform" href="#inform">func inform(client v1.EndpointsInterface, m *Map, u *k8sURL) error</a>

```
searchKey: endpoint.inform
tags: [function private]
```

```Go
func inform(client v1.EndpointsInterface, m *Map, u *k8sURL) error
```

### <a id="loadClient" href="#loadClient">func loadClient() (client *kubernetes.Clientset, ns string, err error)</a>

```
searchKey: endpoint.loadClient
tags: [function private]
```

```Go
func loadClient() (client *kubernetes.Clientset, ns string, err error)
```

### <a id="namespace" href="#namespace">func namespace() string</a>

```
searchKey: endpoint.namespace
tags: [function private]
```

```Go
func namespace() string
```

namespace returns the namespace the pod is currently running in this is done because the k8s client we previously used set the namespace when the client was created, the official k8s client does not 

