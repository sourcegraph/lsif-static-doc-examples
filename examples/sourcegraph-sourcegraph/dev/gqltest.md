# Package main

## Index

* [Variables](#var)
    * [var awsAccessKeyID](#awsAccessKeyID)
    * [var awsCodeCommitPassword](#awsCodeCommitPassword)
    * [var awsCodeCommitUsername](#awsCodeCommitUsername)
    * [var awsSecretAccessKey](#awsSecretAccessKey)
    * [var azureDevOpsToken](#azureDevOpsToken)
    * [var azureDevOpsUsername](#azureDevOpsUsername)
    * [var baseURL](#baseURL)
    * [var bbsToken](#bbsToken)
    * [var bbsURL](#bbsURL)
    * [var bbsUsername](#bbsUsername)
    * [var client](#client)
    * [var email](#email)
    * [var githubToken](#githubToken)
    * [var long](#long)
    * [var password](#password)
    * [var username](#username)
* [Types](#type)
    * [type searchClient interface](#searchClient)
* [Functions](#func)
    * [func TestAccessToken(t *testing.T)](#TestAccessToken)
    * [func TestExternalService(t *testing.T)](#TestExternalService)
    * [func TestExternalService_AWSCodeCommit(t *testing.T)](#TestExternalService_AWSCodeCommit)
    * [func TestExternalService_BitbucketServer(t *testing.T)](#TestExternalService_BitbucketServer)
    * [func TestFeatureFlags(t *testing.T)](#TestFeatureFlags)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestOrganization(t *testing.T)](#TestOrganization)
    * [func TestRepository(t *testing.T)](#TestRepository)
    * [func TestRepository_NameWithSpace(t *testing.T)](#TestRepository_NameWithSpace)
    * [func TestSearch(t *testing.T)](#TestSearch)
    * [func TestSiteConfig(t *testing.T)](#TestSiteConfig)
    * [func mustMarshalJSONString(v interface{}) string](#mustMarshalJSONString)
    * [func testListingSearchContexts(t *testing.T, client *gqltestutil.Client)](#testListingSearchContexts)
    * [func testSearchClient(t *testing.T, client searchClient)](#testSearchClient)
    * [func testSearchContextsCRUD(t *testing.T, client *gqltestutil.Client)](#testSearchContextsCRUD)
    * [func testSearchOther(t *testing.T)](#testSearchOther)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="awsAccessKeyID" href="#awsAccessKeyID">var awsAccessKeyID</a>

```
searchKey: main.awsAccessKeyID
tags: [variable string private]
```

```Go
var awsAccessKeyID = ...
```

### <a id="awsCodeCommitPassword" href="#awsCodeCommitPassword">var awsCodeCommitPassword</a>

```
searchKey: main.awsCodeCommitPassword
tags: [variable string private]
```

```Go
var awsCodeCommitPassword = ...
```

### <a id="awsCodeCommitUsername" href="#awsCodeCommitUsername">var awsCodeCommitUsername</a>

```
searchKey: main.awsCodeCommitUsername
tags: [variable string private]
```

```Go
var awsCodeCommitUsername = ...
```

### <a id="awsSecretAccessKey" href="#awsSecretAccessKey">var awsSecretAccessKey</a>

```
searchKey: main.awsSecretAccessKey
tags: [variable string private]
```

```Go
var awsSecretAccessKey = ...
```

### <a id="azureDevOpsToken" href="#azureDevOpsToken">var azureDevOpsToken</a>

```
searchKey: main.azureDevOpsToken
tags: [variable string private]
```

```Go
var azureDevOpsToken = ...
```

### <a id="azureDevOpsUsername" href="#azureDevOpsUsername">var azureDevOpsUsername</a>

```
searchKey: main.azureDevOpsUsername
tags: [variable string private]
```

```Go
var azureDevOpsUsername = ...
```

### <a id="baseURL" href="#baseURL">var baseURL</a>

```
searchKey: main.baseURL
tags: [variable string private]
```

```Go
var baseURL = ...
```

### <a id="bbsToken" href="#bbsToken">var bbsToken</a>

```
searchKey: main.bbsToken
tags: [variable string private]
```

```Go
var bbsToken = ...
```

### <a id="bbsURL" href="#bbsURL">var bbsURL</a>

```
searchKey: main.bbsURL
tags: [variable string private]
```

```Go
var bbsURL = flag.String("bbs-url", os.Getenv("BITBUCKET_SERVER_URL"), "The Bitbucket Server URL")
```

### <a id="bbsUsername" href="#bbsUsername">var bbsUsername</a>

```
searchKey: main.bbsUsername
tags: [variable string private]
```

```Go
var bbsUsername = ...
```

### <a id="client" href="#client">var client</a>

```
searchKey: main.client
tags: [variable struct private]
```

```Go
var client *gqltestutil.Client
```

### <a id="email" href="#email">var email</a>

```
searchKey: main.email
tags: [variable string private]
```

```Go
var email = flag.String("email", "gqltest@sourcegraph.com", "The email of the admin user")
```

### <a id="githubToken" href="#githubToken">var githubToken</a>

```
searchKey: main.githubToken
tags: [variable string private]
```

```Go
var githubToken = ...
```

### <a id="long" href="#long">var long</a>

```
searchKey: main.long
tags: [variable boolean private]
```

```Go
var long = ...
```

### <a id="password" href="#password">var password</a>

```
searchKey: main.password
tags: [variable string private]
```

```Go
var password = flag.String("password", "supersecurepassword", "The password of the admin user")
```

### <a id="username" href="#username">var username</a>

```
searchKey: main.username
tags: [variable string private]
```

```Go
var username = flag.String("username", "gqltest-admin", "The username of the admin user")
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="searchClient" href="#searchClient">type searchClient interface</a>

```
searchKey: main.searchClient
tags: [interface private]
```

```Go
type searchClient interface {
	SearchRepositories(query string) (gqltestutil.SearchRepositoryResults, error)
	SearchFiles(query string) (*gqltestutil.SearchFileResults, error)
	SearchAll(query string) ([]*gqltestutil.AnyResult, error)

	OverwriteSettings(subjectID, contents string) error
	AuthenticatedUserID() string
}
```

searchClient is an interface so we can swap out a streaming vs graphql based search API. It only supports the methods that streaming supports. 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="TestAccessToken" href="#TestAccessToken">func TestAccessToken(t *testing.T)</a>

```
searchKey: main.TestAccessToken
tags: [method private test]
```

```Go
func TestAccessToken(t *testing.T)
```

### <a id="TestExternalService" href="#TestExternalService">func TestExternalService(t *testing.T)</a>

```
searchKey: main.TestExternalService
tags: [method private test]
```

```Go
func TestExternalService(t *testing.T)
```

### <a id="TestExternalService_AWSCodeCommit" href="#TestExternalService_AWSCodeCommit">func TestExternalService_AWSCodeCommit(t *testing.T)</a>

```
searchKey: main.TestExternalService_AWSCodeCommit
tags: [method private test]
```

```Go
func TestExternalService_AWSCodeCommit(t *testing.T)
```

### <a id="TestExternalService_BitbucketServer" href="#TestExternalService_BitbucketServer">func TestExternalService_BitbucketServer(t *testing.T)</a>

```
searchKey: main.TestExternalService_BitbucketServer
tags: [method private test]
```

```Go
func TestExternalService_BitbucketServer(t *testing.T)
```

### <a id="TestFeatureFlags" href="#TestFeatureFlags">func TestFeatureFlags(t *testing.T)</a>

```
searchKey: main.TestFeatureFlags
tags: [method private test]
```

```Go
func TestFeatureFlags(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: main.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestOrganization" href="#TestOrganization">func TestOrganization(t *testing.T)</a>

```
searchKey: main.TestOrganization
tags: [method private test]
```

```Go
func TestOrganization(t *testing.T)
```

### <a id="TestRepository" href="#TestRepository">func TestRepository(t *testing.T)</a>

```
searchKey: main.TestRepository
tags: [method private test]
```

```Go
func TestRepository(t *testing.T)
```

### <a id="TestRepository_NameWithSpace" href="#TestRepository_NameWithSpace">func TestRepository_NameWithSpace(t *testing.T)</a>

```
searchKey: main.TestRepository_NameWithSpace
tags: [method private test]
```

```Go
func TestRepository_NameWithSpace(t *testing.T)
```

### <a id="TestSearch" href="#TestSearch">func TestSearch(t *testing.T)</a>

```
searchKey: main.TestSearch
tags: [method private test]
```

```Go
func TestSearch(t *testing.T)
```

### <a id="TestSiteConfig" href="#TestSiteConfig">func TestSiteConfig(t *testing.T)</a>

```
searchKey: main.TestSiteConfig
tags: [method private test]
```

```Go
func TestSiteConfig(t *testing.T)
```

### <a id="mustMarshalJSONString" href="#mustMarshalJSONString">func mustMarshalJSONString(v interface{}) string</a>

```
searchKey: main.mustMarshalJSONString
tags: [method private]
```

```Go
func mustMarshalJSONString(v interface{}) string
```

### <a id="testListingSearchContexts" href="#testListingSearchContexts">func testListingSearchContexts(t *testing.T, client *gqltestutil.Client)</a>

```
searchKey: main.testListingSearchContexts
tags: [method private]
```

```Go
func testListingSearchContexts(t *testing.T, client *gqltestutil.Client)
```

### <a id="testSearchClient" href="#testSearchClient">func testSearchClient(t *testing.T, client searchClient)</a>

```
searchKey: main.testSearchClient
tags: [method private]
```

```Go
func testSearchClient(t *testing.T, client searchClient)
```

### <a id="testSearchContextsCRUD" href="#testSearchContextsCRUD">func testSearchContextsCRUD(t *testing.T, client *gqltestutil.Client)</a>

```
searchKey: main.testSearchContextsCRUD
tags: [method private]
```

```Go
func testSearchContextsCRUD(t *testing.T, client *gqltestutil.Client)
```

### <a id="testSearchOther" href="#testSearchOther">func testSearchOther(t *testing.T)</a>

```
searchKey: main.testSearchOther
tags: [method private]
```

```Go
func testSearchOther(t *testing.T)
```

testSearchOther other contains search tests for parts of the GraphQL API which are not replicated in the streaming API (statistics and suggestions). 

