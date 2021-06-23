# Package main

## Index

* [Variables](#var)
    * [var client](#client)
    * [var long](#long)
    * [var baseURL](#baseURL)
    * [var email](#email)
    * [var username](#username)
    * [var password](#password)
    * [var githubToken](#githubToken)
    * [var awsAccessKeyID](#awsAccessKeyID)
    * [var awsSecretAccessKey](#awsSecretAccessKey)
    * [var awsCodeCommitUsername](#awsCodeCommitUsername)
    * [var awsCodeCommitPassword](#awsCodeCommitPassword)
    * [var bbsURL](#bbsURL)
    * [var bbsToken](#bbsToken)
    * [var bbsUsername](#bbsUsername)
    * [var azureDevOpsUsername](#azureDevOpsUsername)
    * [var azureDevOpsToken](#azureDevOpsToken)
* [Types](#type)
    * [type searchClient interface](#searchClient)
* [Functions](#func)
    * [func TestAccessToken(t *testing.T)](#TestAccessToken)
    * [func TestExternalService(t *testing.T)](#TestExternalService)
    * [func TestExternalService_AWSCodeCommit(t *testing.T)](#TestExternalService_AWSCodeCommit)
    * [func TestExternalService_BitbucketServer(t *testing.T)](#TestExternalService_BitbucketServer)
    * [func TestFeatureFlags(t *testing.T)](#TestFeatureFlags)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func mustMarshalJSONString(v interface{}) string](#mustMarshalJSONString)
    * [func TestOrganization(t *testing.T)](#TestOrganization)
    * [func TestRepository(t *testing.T)](#TestRepository)
    * [func TestRepository_NameWithSpace(t *testing.T)](#TestRepository_NameWithSpace)
    * [func TestSearch(t *testing.T)](#TestSearch)
    * [func testSearchClient(t *testing.T, client searchClient)](#testSearchClient)
    * [func testSearchOther(t *testing.T)](#testSearchOther)
    * [func testSearchContextsCRUD(t *testing.T, client *gqltestutil.Client)](#testSearchContextsCRUD)
    * [func testListingSearchContexts(t *testing.T, client *gqltestutil.Client)](#testListingSearchContexts)
    * [func TestSiteConfig(t *testing.T)](#TestSiteConfig)


## <a id="var" href="#var">Variables</a>

### <a id="client" href="#client">var client</a>

```
searchKey: main.client
tags: [private]
```

```Go
var client *gqltestutil.Client
```

### <a id="long" href="#long">var long</a>

```
searchKey: main.long
tags: [private]
```

```Go
var long = ...
```

### <a id="baseURL" href="#baseURL">var baseURL</a>

```
searchKey: main.baseURL
tags: [private]
```

```Go
var baseURL = ...
```

### <a id="email" href="#email">var email</a>

```
searchKey: main.email
tags: [private]
```

```Go
var email = flag.String("email", "gqltest@sourcegraph.com", "The email of the admin user")
```

### <a id="username" href="#username">var username</a>

```
searchKey: main.username
tags: [private]
```

```Go
var username = flag.String("username", "gqltest-admin", "The username of the admin user")
```

### <a id="password" href="#password">var password</a>

```
searchKey: main.password
tags: [private]
```

```Go
var password = flag.String("password", "supersecurepassword", "The password of the admin user")
```

### <a id="githubToken" href="#githubToken">var githubToken</a>

```
searchKey: main.githubToken
tags: [private]
```

```Go
var githubToken = ...
```

### <a id="awsAccessKeyID" href="#awsAccessKeyID">var awsAccessKeyID</a>

```
searchKey: main.awsAccessKeyID
tags: [private]
```

```Go
var awsAccessKeyID = ...
```

### <a id="awsSecretAccessKey" href="#awsSecretAccessKey">var awsSecretAccessKey</a>

```
searchKey: main.awsSecretAccessKey
tags: [private]
```

```Go
var awsSecretAccessKey = ...
```

### <a id="awsCodeCommitUsername" href="#awsCodeCommitUsername">var awsCodeCommitUsername</a>

```
searchKey: main.awsCodeCommitUsername
tags: [private]
```

```Go
var awsCodeCommitUsername = ...
```

### <a id="awsCodeCommitPassword" href="#awsCodeCommitPassword">var awsCodeCommitPassword</a>

```
searchKey: main.awsCodeCommitPassword
tags: [private]
```

```Go
var awsCodeCommitPassword = ...
```

### <a id="bbsURL" href="#bbsURL">var bbsURL</a>

```
searchKey: main.bbsURL
tags: [private]
```

```Go
var bbsURL = flag.String("bbs-url", os.Getenv("BITBUCKET_SERVER_URL"), "The Bitbucket Server URL")
```

### <a id="bbsToken" href="#bbsToken">var bbsToken</a>

```
searchKey: main.bbsToken
tags: [private]
```

```Go
var bbsToken = ...
```

### <a id="bbsUsername" href="#bbsUsername">var bbsUsername</a>

```
searchKey: main.bbsUsername
tags: [private]
```

```Go
var bbsUsername = ...
```

### <a id="azureDevOpsUsername" href="#azureDevOpsUsername">var azureDevOpsUsername</a>

```
searchKey: main.azureDevOpsUsername
tags: [private]
```

```Go
var azureDevOpsUsername = ...
```

### <a id="azureDevOpsToken" href="#azureDevOpsToken">var azureDevOpsToken</a>

```
searchKey: main.azureDevOpsToken
tags: [private]
```

```Go
var azureDevOpsToken = ...
```

## <a id="type" href="#type">Types</a>

### <a id="searchClient" href="#searchClient">type searchClient interface</a>

```
searchKey: main.searchClient
tags: [private]
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

### <a id="TestAccessToken" href="#TestAccessToken">func TestAccessToken(t *testing.T)</a>

```
searchKey: main.TestAccessToken
tags: [private]
```

```Go
func TestAccessToken(t *testing.T)
```

### <a id="TestExternalService" href="#TestExternalService">func TestExternalService(t *testing.T)</a>

```
searchKey: main.TestExternalService
tags: [private]
```

```Go
func TestExternalService(t *testing.T)
```

### <a id="TestExternalService_AWSCodeCommit" href="#TestExternalService_AWSCodeCommit">func TestExternalService_AWSCodeCommit(t *testing.T)</a>

```
searchKey: main.TestExternalService_AWSCodeCommit
tags: [private]
```

```Go
func TestExternalService_AWSCodeCommit(t *testing.T)
```

### <a id="TestExternalService_BitbucketServer" href="#TestExternalService_BitbucketServer">func TestExternalService_BitbucketServer(t *testing.T)</a>

```
searchKey: main.TestExternalService_BitbucketServer
tags: [private]
```

```Go
func TestExternalService_BitbucketServer(t *testing.T)
```

### <a id="TestFeatureFlags" href="#TestFeatureFlags">func TestFeatureFlags(t *testing.T)</a>

```
searchKey: main.TestFeatureFlags
tags: [private]
```

```Go
func TestFeatureFlags(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: main.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

### <a id="mustMarshalJSONString" href="#mustMarshalJSONString">func mustMarshalJSONString(v interface{}) string</a>

```
searchKey: main.mustMarshalJSONString
tags: [private]
```

```Go
func mustMarshalJSONString(v interface{}) string
```

### <a id="TestOrganization" href="#TestOrganization">func TestOrganization(t *testing.T)</a>

```
searchKey: main.TestOrganization
tags: [private]
```

```Go
func TestOrganization(t *testing.T)
```

### <a id="TestRepository" href="#TestRepository">func TestRepository(t *testing.T)</a>

```
searchKey: main.TestRepository
tags: [private]
```

```Go
func TestRepository(t *testing.T)
```

### <a id="TestRepository_NameWithSpace" href="#TestRepository_NameWithSpace">func TestRepository_NameWithSpace(t *testing.T)</a>

```
searchKey: main.TestRepository_NameWithSpace
tags: [private]
```

```Go
func TestRepository_NameWithSpace(t *testing.T)
```

### <a id="TestSearch" href="#TestSearch">func TestSearch(t *testing.T)</a>

```
searchKey: main.TestSearch
tags: [private]
```

```Go
func TestSearch(t *testing.T)
```

### <a id="testSearchClient" href="#testSearchClient">func testSearchClient(t *testing.T, client searchClient)</a>

```
searchKey: main.testSearchClient
tags: [private]
```

```Go
func testSearchClient(t *testing.T, client searchClient)
```

### <a id="testSearchOther" href="#testSearchOther">func testSearchOther(t *testing.T)</a>

```
searchKey: main.testSearchOther
tags: [private]
```

```Go
func testSearchOther(t *testing.T)
```

testSearchOther other contains search tests for parts of the GraphQL API which are not replicated in the streaming API (statistics and suggestions). 

### <a id="testSearchContextsCRUD" href="#testSearchContextsCRUD">func testSearchContextsCRUD(t *testing.T, client *gqltestutil.Client)</a>

```
searchKey: main.testSearchContextsCRUD
tags: [private]
```

```Go
func testSearchContextsCRUD(t *testing.T, client *gqltestutil.Client)
```

### <a id="testListingSearchContexts" href="#testListingSearchContexts">func testListingSearchContexts(t *testing.T, client *gqltestutil.Client)</a>

```
searchKey: main.testListingSearchContexts
tags: [private]
```

```Go
func testListingSearchContexts(t *testing.T, client *gqltestutil.Client)
```

### <a id="TestSiteConfig" href="#TestSiteConfig">func TestSiteConfig(t *testing.T)</a>

```
searchKey: main.TestSiteConfig
tags: [private]
```

```Go
func TestSiteConfig(t *testing.T)
```

