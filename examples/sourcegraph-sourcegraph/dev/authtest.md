# Package authtest

## Index

* [Variables](#var)
    * [var client](#client)
    * [var long](#long)
    * [var baseURL](#baseURL)
    * [var email](#email)
    * [var username](#username)
    * [var password](#password)
    * [var githubToken](#githubToken)
    * [var dotcom](#dotcom)
* [Functions](#func)
    * [func TestCodeIntelEndpoints(t *testing.T)](#TestCodeIntelEndpoints)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func mustMarshalJSONString(v interface{}) string](#mustMarshalJSONString)
    * [func TestOrganization(t *testing.T)](#TestOrganization)
    * [func TestRepository(t *testing.T)](#TestRepository)
    * [func TestSiteAdminEndpoints(t *testing.T)](#TestSiteAdminEndpoints)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="client" href="#client">var client</a>

```
searchKey: authtest.client
```

```Go
var client *gqltestutil.Client
```

### <a id="long" href="#long">var long</a>

```
searchKey: authtest.long
```

```Go
var long = ...
```

### <a id="baseURL" href="#baseURL">var baseURL</a>

```
searchKey: authtest.baseURL
```

```Go
var baseURL = ...
```

### <a id="email" href="#email">var email</a>

```
searchKey: authtest.email
```

```Go
var email = flag.String("email", "authtest@sourcegraph.com", "The email of the admin user")
```

### <a id="username" href="#username">var username</a>

```
searchKey: authtest.username
```

```Go
var username = flag.String("username", "authtest-admin", "The username of the admin user")
```

### <a id="password" href="#password">var password</a>

```
searchKey: authtest.password
```

```Go
var password = flag.String("password", "supersecurepassword", "The password of the admin user")
```

### <a id="githubToken" href="#githubToken">var githubToken</a>

```
searchKey: authtest.githubToken
```

```Go
var githubToken = ...
```

### <a id="dotcom" href="#dotcom">var dotcom</a>

```
searchKey: authtest.dotcom
```

```Go
var dotcom = flag.Bool("dotcom", false, "Whether to test dotcom specific constraints")
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="TestCodeIntelEndpoints" href="#TestCodeIntelEndpoints">func TestCodeIntelEndpoints(t *testing.T)</a>

```
searchKey: authtest.TestCodeIntelEndpoints
```

```Go
func TestCodeIntelEndpoints(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: authtest.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="mustMarshalJSONString" href="#mustMarshalJSONString">func mustMarshalJSONString(v interface{}) string</a>

```
searchKey: authtest.mustMarshalJSONString
```

```Go
func mustMarshalJSONString(v interface{}) string
```

### <a id="TestOrganization" href="#TestOrganization">func TestOrganization(t *testing.T)</a>

```
searchKey: authtest.TestOrganization
```

```Go
func TestOrganization(t *testing.T)
```

### <a id="TestRepository" href="#TestRepository">func TestRepository(t *testing.T)</a>

```
searchKey: authtest.TestRepository
```

```Go
func TestRepository(t *testing.T)
```

### <a id="TestSiteAdminEndpoints" href="#TestSiteAdminEndpoints">func TestSiteAdminEndpoints(t *testing.T)</a>

```
searchKey: authtest.TestSiteAdminEndpoints
```

```Go
func TestSiteAdminEndpoints(t *testing.T)
```

