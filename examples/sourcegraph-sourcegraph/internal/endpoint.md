# Package endpoint

Package endpoint provides a consistent hash map for URLs to kubernetes endpoints. 

## Index

* [Variables](#var)
    * [var metricEndpointSize](#metricEndpointSize)
* [Types](#type)
    * [type hashFn func(data []byte) uint32](#hashFn)
    * [type hashMap struct](#hashMap)
        * [func hashMapNew(replicas int, fn hashFn) *hashMap](#hashMapNew)
        * [func endpointsToMap(u *k8sURL, eps corev1.Endpoints) (*hashMap, error)](#endpointsToMap)
        * [func newConsistentHashMap(keys []string) *hashMap](#newConsistentHashMap)
        * [func (m *hashMap) isEmpty() bool](#hashMap.isEmpty)
        * [func (m *hashMap) add(keys ...string)](#hashMap.add)
        * [func (m *hashMap) get(key string, exclude map[string]bool) string](#hashMap.get)
    * [type Map struct](#Map)
        * [func New(urlspec string) *Map](#New)
        * [func Static(endpoints ...string) *Map](#Static)
        * [func Empty(err error) *Map](#Empty)
        * [func (m *Map) String() string](#Map.String)
        * [func (m *Map) Get(key string, exclude map[string]bool) (string, error)](#Map.Get)
        * [func (m *Map) GetMany(keys ...string) ([]string, error)](#Map.GetMany)
        * [func (m *Map) Endpoints() (map[string]struct{}, error)](#Map.Endpoints)
        * [func (m *Map) getUrls() (*hashMap, error)](#Map.getUrls)
    * [type k8sURL struct](#k8sURL)
        * [func parseURL(rawurl string) (*k8sURL, error)](#parseURL)
        * [func (u *k8sURL) endpointURL(endpoint string) string](#k8sURL.endpointURL)
* [Functions](#func)
    * [func inform(client v1.EndpointsInterface, m *Map, u *k8sURL) error](#inform)
    * [func namespace() string](#namespace)
    * [func loadClient() (client *kubernetes.Clientset, ns string, err error)](#loadClient)
    * [func TestNew(t *testing.T)](#TestNew)
    * [func TestStatic(t *testing.T)](#TestStatic)
    * [func TestExclude(t *testing.T)](#TestExclude)
    * [func expectEndpoints(t *testing.T, m *Map, exclude map[string]bool, endpoints ...string)](#expectEndpoints)
    * [func TestEndpoints(t *testing.T)](#TestEndpoints)
    * [func TestK8sURL(t *testing.T)](#TestK8sURL)


## <a id="var" href="#var">Variables</a>

### <a id="metricEndpointSize" href="#metricEndpointSize">var metricEndpointSize</a>

```
searchKey: endpoint.metricEndpointSize
```

```Go
var metricEndpointSize = ...
```

## <a id="type" href="#type">Types</a>

### <a id="hashFn" href="#hashFn">type hashFn func(data []byte) uint32</a>

```
searchKey: endpoint.hashFn
```

```Go
type hashFn func(data []byte) uint32
```

### <a id="hashMap" href="#hashMap">type hashMap struct</a>

```
searchKey: endpoint.hashMap
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

#### <a id="hashMapNew" href="#hashMapNew">func hashMapNew(replicas int, fn hashFn) *hashMap</a>

```
searchKey: endpoint.hashMapNew
```

```Go
func hashMapNew(replicas int, fn hashFn) *hashMap
```

#### <a id="endpointsToMap" href="#endpointsToMap">func endpointsToMap(u *k8sURL, eps corev1.Endpoints) (*hashMap, error)</a>

```
searchKey: endpoint.endpointsToMap
```

```Go
func endpointsToMap(u *k8sURL, eps corev1.Endpoints) (*hashMap, error)
```

#### <a id="newConsistentHashMap" href="#newConsistentHashMap">func newConsistentHashMap(keys []string) *hashMap</a>

```
searchKey: endpoint.newConsistentHashMap
```

```Go
func newConsistentHashMap(keys []string) *hashMap
```

#### <a id="hashMap.isEmpty" href="#hashMap.isEmpty">func (m *hashMap) isEmpty() bool</a>

```
searchKey: endpoint.hashMap.isEmpty
```

```Go
func (m *hashMap) isEmpty() bool
```

Returns true if there are no items available. 

#### <a id="hashMap.add" href="#hashMap.add">func (m *hashMap) add(keys ...string)</a>

```
searchKey: endpoint.hashMap.add
```

```Go
func (m *hashMap) add(keys ...string)
```

Adds some keys to the hash. 

#### <a id="hashMap.get" href="#hashMap.get">func (m *hashMap) get(key string, exclude map[string]bool) string</a>

```
searchKey: endpoint.hashMap.get
```

```Go
func (m *hashMap) get(key string, exclude map[string]bool) string
```

Gets the closest item in the hash to the provided key that is not in exclude. 

### <a id="Map" href="#Map">type Map struct</a>

```
searchKey: endpoint.Map
tags: [exported]
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

#### <a id="New" href="#New">func New(urlspec string) *Map</a>

```
searchKey: endpoint.New
tags: [exported]
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
tags: [exported]
```

```Go
func Static(endpoints ...string) *Map
```

Static returns an Endpoint map which consistently hashes over endpoints. 

There are no requirements on endpoints, it can be any arbitrary string. Unlike static endpoints created via New. 

Static Maps are guaranteed to never return an error. 

#### <a id="Empty" href="#Empty">func Empty(err error) *Map</a>

```
searchKey: endpoint.Empty
tags: [exported]
```

```Go
func Empty(err error) *Map
```

Empty returns an Endpoint map which always fails with err. 

#### <a id="Map.String" href="#Map.String">func (m *Map) String() string</a>

```
searchKey: endpoint.Map.String
tags: [exported]
```

```Go
func (m *Map) String() string
```

#### <a id="Map.Get" href="#Map.Get">func (m *Map) Get(key string, exclude map[string]bool) (string, error)</a>

```
searchKey: endpoint.Map.Get
tags: [exported]
```

```Go
func (m *Map) Get(key string, exclude map[string]bool) (string, error)
```

Get the closest URL in the hash to the provided key that is not in exclude. If no URL is found, "" is returned. 

Note: For k8s URLs we return URLs based on the registered endpoints. The endpoint may not actually be available yet / at the moment. So users of the URL should implement a retry strategy. 

#### <a id="Map.GetMany" href="#Map.GetMany">func (m *Map) GetMany(keys ...string) ([]string, error)</a>

```
searchKey: endpoint.Map.GetMany
tags: [exported]
```

```Go
func (m *Map) GetMany(keys ...string) ([]string, error)
```

GetMany is the same as calling Get on each item of keys. It will only acquire the underlying endpoint map once, so is preferred to calling Get for each key which will acquire the endpoint map for each call. The benefit is it is faster (O(1) mutex acquires vs O(n)) and consistent (endpoint map is immutable vs may change between Get calls). 

#### <a id="Map.Endpoints" href="#Map.Endpoints">func (m *Map) Endpoints() (map[string]struct{}, error)</a>

```
searchKey: endpoint.Map.Endpoints
tags: [exported]
```

```Go
func (m *Map) Endpoints() (map[string]struct{}, error)
```

Endpoints returns a set of all addresses. Do not modify the returned value. 

#### <a id="Map.getUrls" href="#Map.getUrls">func (m *Map) getUrls() (*hashMap, error)</a>

```
searchKey: endpoint.Map.getUrls
```

```Go
func (m *Map) getUrls() (*hashMap, error)
```

### <a id="k8sURL" href="#k8sURL">type k8sURL struct</a>

```
searchKey: endpoint.k8sURL
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
```

```Go
func parseURL(rawurl string) (*k8sURL, error)
```

#### <a id="k8sURL.endpointURL" href="#k8sURL.endpointURL">func (u *k8sURL) endpointURL(endpoint string) string</a>

```
searchKey: endpoint.k8sURL.endpointURL
```

```Go
func (u *k8sURL) endpointURL(endpoint string) string
```

## <a id="func" href="#func">Functions</a>

### <a id="inform" href="#inform">func inform(client v1.EndpointsInterface, m *Map, u *k8sURL) error</a>

```
searchKey: endpoint.inform
```

```Go
func inform(client v1.EndpointsInterface, m *Map, u *k8sURL) error
```

### <a id="namespace" href="#namespace">func namespace() string</a>

```
searchKey: endpoint.namespace
```

```Go
func namespace() string
```

namespace returns the namespace the pod is currently running in this is done because the k8s client we previously used set the namespace when the client was created, the official k8s client does not 

### <a id="loadClient" href="#loadClient">func loadClient() (client *kubernetes.Clientset, ns string, err error)</a>

```
searchKey: endpoint.loadClient
```

```Go
func loadClient() (client *kubernetes.Clientset, ns string, err error)
```

### <a id="TestNew" href="#TestNew">func TestNew(t *testing.T)</a>

```
searchKey: endpoint.TestNew
```

```Go
func TestNew(t *testing.T)
```

### <a id="TestStatic" href="#TestStatic">func TestStatic(t *testing.T)</a>

```
searchKey: endpoint.TestStatic
```

```Go
func TestStatic(t *testing.T)
```

### <a id="TestExclude" href="#TestExclude">func TestExclude(t *testing.T)</a>

```
searchKey: endpoint.TestExclude
```

```Go
func TestExclude(t *testing.T)
```

### <a id="expectEndpoints" href="#expectEndpoints">func expectEndpoints(t *testing.T, m *Map, exclude map[string]bool, endpoints ...string)</a>

```
searchKey: endpoint.expectEndpoints
```

```Go
func expectEndpoints(t *testing.T, m *Map, exclude map[string]bool, endpoints ...string)
```

### <a id="TestEndpoints" href="#TestEndpoints">func TestEndpoints(t *testing.T)</a>

```
searchKey: endpoint.TestEndpoints
```

```Go
func TestEndpoints(t *testing.T)
```

### <a id="TestK8sURL" href="#TestK8sURL">func TestK8sURL(t *testing.T)</a>

```
searchKey: endpoint.TestK8sURL
```

```Go
func TestK8sURL(t *testing.T)
```

