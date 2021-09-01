# Package authtest

## Index

* [Variables](#var)
    * [var baseURL](#baseURL)
    * [var client](#client)
    * [var dotcom](#dotcom)
    * [var email](#email)
    * [var githubToken](#githubToken)
    * [var long](#long)
    * [var password](#password)
    * [var username](#username)
* [Functions](#func)
    * [func TestCodeIntelEndpoints(t *testing.T)](#TestCodeIntelEndpoints)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestOrganization(t *testing.T)](#TestOrganization)
    * [func TestRepository(t *testing.T)](#TestRepository)
    * [func TestSiteAdminEndpoints(t *testing.T)](#TestSiteAdminEndpoints)
    * [func mustMarshalJSONString(v interface{}) string](#mustMarshalJSONString)


## <a id="var" href="#var">Variables</a>

### <a id="baseURL" href="#baseURL">var baseURL</a>

```
searchKey: authtest.baseURL
tags: [variable string private]
```

```Go
var baseURL = ...
```

### <a id="client" href="#client">var client</a>

```
searchKey: authtest.client
tags: [variable struct private]
```

```Go
var client *gqltestutil.Client
```

### <a id="dotcom" href="#dotcom">var dotcom</a>

```
searchKey: authtest.dotcom
tags: [variable boolean private]
```

```Go
var dotcom = flag.Bool("dotcom", false, "Whether to test dotcom specific constraints")
```

### <a id="email" href="#email">var email</a>

```
searchKey: authtest.email
tags: [variable string private]
```

```Go
var email = flag.String("email", "authtest@sourcegraph.com", "The email of the admin user")
```

### <a id="githubToken" href="#githubToken">var githubToken</a>

```
searchKey: authtest.githubToken
tags: [variable string private]
```

```Go
var githubToken = ...
```

### <a id="long" href="#long">var long</a>

```
searchKey: authtest.long
tags: [variable boolean private]
```

```Go
var long = ...
```

### <a id="password" href="#password">var password</a>

```
searchKey: authtest.password
tags: [variable string private]
```

```Go
var password = flag.String("password", "supersecurepassword", "The password of the admin user")
```

### <a id="username" href="#username">var username</a>

```
searchKey: authtest.username
tags: [variable string private]
```

```Go
var username = flag.String("username", "authtest-admin", "The username of the admin user")
```

## <a id="func" href="#func">Functions</a>

### <a id="TestCodeIntelEndpoints" href="#TestCodeIntelEndpoints">func TestCodeIntelEndpoints(t *testing.T)</a>

```
searchKey: authtest.TestCodeIntelEndpoints
tags: [function private test]
```

```Go
func TestCodeIntelEndpoints(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: authtest.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestOrganization" href="#TestOrganization">func TestOrganization(t *testing.T)</a>

```
searchKey: authtest.TestOrganization
tags: [function private test]
```

```Go
func TestOrganization(t *testing.T)
```

### <a id="TestRepository" href="#TestRepository">func TestRepository(t *testing.T)</a>

```
searchKey: authtest.TestRepository
tags: [function private test]
```

```Go
func TestRepository(t *testing.T)
```

### <a id="TestSiteAdminEndpoints" href="#TestSiteAdminEndpoints">func TestSiteAdminEndpoints(t *testing.T)</a>

```
searchKey: authtest.TestSiteAdminEndpoints
tags: [function private test]
```

```Go
func TestSiteAdminEndpoints(t *testing.T)
```

### <a id="mustMarshalJSONString" href="#mustMarshalJSONString">func mustMarshalJSONString(v interface{}) string</a>

```
searchKey: authtest.mustMarshalJSONString
tags: [function private]
```

```Go
func mustMarshalJSONString(v interface{}) string
```

