# Package searchcontexts

## Index

* [Constants](#const)
    * [const GlobalSearchContextName](#GlobalSearchContextName)
    * [const maxRevisionLength](#maxRevisionLength)
    * [const maxSearchContextDescriptionLength](#maxSearchContextDescriptionLength)
    * [const maxSearchContextNameLength](#maxSearchContextNameLength)
    * [const searchContextSpecPrefix](#searchContextSpecPrefix)
* [Variables](#var)
    * [var namespacedSearchContextSpecRegexp](#namespacedSearchContextSpecRegexp)
    * [var validateSearchContextNameRegexp](#validateSearchContextNameRegexp)
* [Types](#type)
    * [type ParsedSearchContextSpec struct](#ParsedSearchContextSpec)
        * [func ParseSearchContextSpec(searchContextSpec string) ParsedSearchContextSpec](#ParseSearchContextSpec)
* [Functions](#func)
    * [func ConvertVersionContextToSearchContext(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) (*types.SearchContext, error)](#ConvertVersionContextToSearchContext)
    * [func CreateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)](#CreateSearchContextWithRepositoryRevisions)
    * [func DeleteSearchContext(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error](#DeleteSearchContext)
    * [func GetAutoDefinedSearchContexts(ctx context.Context, db dbutil.DB) ([]*types.SearchContext, error)](#GetAutoDefinedSearchContexts)
    * [func GetGlobalSearchContext() *types.SearchContext](#GetGlobalSearchContext)
    * [func GetRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContextID int64) ([]*search.RepositoryRevisions, error)](#GetRepositoryRevisions)
    * [func GetSearchContextSpec(searchContext *types.SearchContext) string](#GetSearchContextSpec)
    * [func GetUserSearchContext(name string, userID int32) *types.SearchContext](#GetUserSearchContext)
    * [func IsAutoDefinedSearchContext(searchContext *types.SearchContext) bool](#IsAutoDefinedSearchContext)
    * [func IsGlobalSearchContext(searchContext *types.SearchContext) bool](#IsGlobalSearchContext)
    * [func IsGlobalSearchContextSpec(searchContextSpec string) bool](#IsGlobalSearchContextSpec)
    * [func IsInstanceLevelSearchContext(searchContext *types.SearchContext) bool](#IsInstanceLevelSearchContext)
    * [func ResolveSearchContextSpec(ctx context.Context, db dbutil.DB, searchContextSpec string) (*types.SearchContext, error)](#ResolveSearchContextSpec)
    * [func TestConstructingSearchContextSpecs(t *testing.T)](#TestConstructingSearchContextSpecs)
    * [func TestConvertingVersionContextToSearchContext(t *testing.T)](#TestConvertingVersionContextToSearchContext)
    * [func TestCreatingSearchContexts(t *testing.T)](#TestCreatingSearchContexts)
    * [func TestDeletingAutoDefinedSearchContext(t *testing.T)](#TestDeletingAutoDefinedSearchContext)
    * [func TestGettingSearchContextFromVersionContext(t *testing.T)](#TestGettingSearchContextFromVersionContext)
    * [func TestResolvingInvalidSearchContextSpecs(t *testing.T)](#TestResolvingInvalidSearchContextSpecs)
    * [func TestResolvingSearchContextRepoNames(t *testing.T)](#TestResolvingSearchContextRepoNames)
    * [func TestResolvingValidSearchContextSpecs(t *testing.T)](#TestResolvingValidSearchContextSpecs)
    * [func TestSearchContextWriteAccessValidation(t *testing.T)](#TestSearchContextWriteAccessValidation)
    * [func TestUpdatingSearchContexts(t *testing.T)](#TestUpdatingSearchContexts)
    * [func UpdateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)](#UpdateSearchContextWithRepositoryRevisions)
    * [func ValidateSearchContextWriteAccessForCurrentUser(ctx context.Context, db dbutil.DB, namespaceUserID, namespaceOrgID int32, public bool) error](#ValidateSearchContextWriteAccessForCurrentUser)
    * [func createRepos(ctx context.Context, repoStore *database.RepoStore) ([]types.RepoName, error)](#createRepos)
    * [func getSearchContextFromVersionContext(versionContext *schema.VersionContext) *types.SearchContext](#getSearchContextFromVersionContext)
    * [func getVersionContextRepositoryRevisions(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) ([]*types.SearchContextRepositoryRevisions, error)](#getVersionContextRepositoryRevisions)
    * [func init()](#init.search_contexts_test.go)
    * [func validateSearchContextDescription(description string) error](#validateSearchContextDescription)
    * [func validateSearchContextDoesNotExist(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error](#validateSearchContextDoesNotExist)
    * [func validateSearchContextName(name string) error](#validateSearchContextName)
    * [func validateSearchContextRepositoryRevisions(repositoryRevisions []*types.SearchContextRepositoryRevisions) error](#validateSearchContextRepositoryRevisions)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="GlobalSearchContextName" href="#GlobalSearchContextName">const GlobalSearchContextName</a>

```
searchKey: searchcontexts.GlobalSearchContextName
tags: [constant string]
```

```Go
const GlobalSearchContextName = "global"
```

### <a id="maxRevisionLength" href="#maxRevisionLength">const maxRevisionLength</a>

```
searchKey: searchcontexts.maxRevisionLength
tags: [constant number private]
```

```Go
const maxRevisionLength = 255
```

### <a id="maxSearchContextDescriptionLength" href="#maxSearchContextDescriptionLength">const maxSearchContextDescriptionLength</a>

```
searchKey: searchcontexts.maxSearchContextDescriptionLength
tags: [constant number private]
```

```Go
const maxSearchContextDescriptionLength = 1024
```

### <a id="maxSearchContextNameLength" href="#maxSearchContextNameLength">const maxSearchContextNameLength</a>

```
searchKey: searchcontexts.maxSearchContextNameLength
tags: [constant number private]
```

```Go
const maxSearchContextNameLength = 32
```

### <a id="searchContextSpecPrefix" href="#searchContextSpecPrefix">const searchContextSpecPrefix</a>

```
searchKey: searchcontexts.searchContextSpecPrefix
tags: [constant string private]
```

```Go
const searchContextSpecPrefix = "@"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="namespacedSearchContextSpecRegexp" href="#namespacedSearchContextSpecRegexp">var namespacedSearchContextSpecRegexp</a>

```
searchKey: searchcontexts.namespacedSearchContextSpecRegexp
tags: [variable struct private]
```

```Go
var namespacedSearchContextSpecRegexp = lazyregexp.New(searchContextSpecPrefix + `(.*?)\/(.*)`)
```

### <a id="validateSearchContextNameRegexp" href="#validateSearchContextNameRegexp">var validateSearchContextNameRegexp</a>

```
searchKey: searchcontexts.validateSearchContextNameRegexp
tags: [variable struct private]
```

```Go
var validateSearchContextNameRegexp = lazyregexp.New(`^[a-zA-Z0-9_\-\/\.]+$`)
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ParsedSearchContextSpec" href="#ParsedSearchContextSpec">type ParsedSearchContextSpec struct</a>

```
searchKey: searchcontexts.ParsedSearchContextSpec
tags: [struct]
```

```Go
type ParsedSearchContextSpec struct {
	NamespaceName     string
	SearchContextName string
}
```

#### <a id="ParseSearchContextSpec" href="#ParseSearchContextSpec">func ParseSearchContextSpec(searchContextSpec string) ParsedSearchContextSpec</a>

```
searchKey: searchcontexts.ParseSearchContextSpec
tags: [function]
```

```Go
func ParseSearchContextSpec(searchContextSpec string) ParsedSearchContextSpec
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ConvertVersionContextToSearchContext" href="#ConvertVersionContextToSearchContext">func ConvertVersionContextToSearchContext(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) (*types.SearchContext, error)</a>

```
searchKey: searchcontexts.ConvertVersionContextToSearchContext
tags: [function]
```

```Go
func ConvertVersionContextToSearchContext(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) (*types.SearchContext, error)
```

### <a id="CreateSearchContextWithRepositoryRevisions" href="#CreateSearchContextWithRepositoryRevisions">func CreateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)</a>

```
searchKey: searchcontexts.CreateSearchContextWithRepositoryRevisions
tags: [function]
```

```Go
func CreateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)
```

### <a id="DeleteSearchContext" href="#DeleteSearchContext">func DeleteSearchContext(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error</a>

```
searchKey: searchcontexts.DeleteSearchContext
tags: [function]
```

```Go
func DeleteSearchContext(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error
```

### <a id="GetAutoDefinedSearchContexts" href="#GetAutoDefinedSearchContexts">func GetAutoDefinedSearchContexts(ctx context.Context, db dbutil.DB) ([]*types.SearchContext, error)</a>

```
searchKey: searchcontexts.GetAutoDefinedSearchContexts
tags: [function]
```

```Go
func GetAutoDefinedSearchContexts(ctx context.Context, db dbutil.DB) ([]*types.SearchContext, error)
```

### <a id="GetGlobalSearchContext" href="#GetGlobalSearchContext">func GetGlobalSearchContext() *types.SearchContext</a>

```
searchKey: searchcontexts.GetGlobalSearchContext
tags: [function]
```

```Go
func GetGlobalSearchContext() *types.SearchContext
```

### <a id="GetRepositoryRevisions" href="#GetRepositoryRevisions">func GetRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContextID int64) ([]*search.RepositoryRevisions, error)</a>

```
searchKey: searchcontexts.GetRepositoryRevisions
tags: [function]
```

```Go
func GetRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContextID int64) ([]*search.RepositoryRevisions, error)
```

### <a id="GetSearchContextSpec" href="#GetSearchContextSpec">func GetSearchContextSpec(searchContext *types.SearchContext) string</a>

```
searchKey: searchcontexts.GetSearchContextSpec
tags: [function]
```

```Go
func GetSearchContextSpec(searchContext *types.SearchContext) string
```

### <a id="GetUserSearchContext" href="#GetUserSearchContext">func GetUserSearchContext(name string, userID int32) *types.SearchContext</a>

```
searchKey: searchcontexts.GetUserSearchContext
tags: [function]
```

```Go
func GetUserSearchContext(name string, userID int32) *types.SearchContext
```

### <a id="IsAutoDefinedSearchContext" href="#IsAutoDefinedSearchContext">func IsAutoDefinedSearchContext(searchContext *types.SearchContext) bool</a>

```
searchKey: searchcontexts.IsAutoDefinedSearchContext
tags: [function]
```

```Go
func IsAutoDefinedSearchContext(searchContext *types.SearchContext) bool
```

### <a id="IsGlobalSearchContext" href="#IsGlobalSearchContext">func IsGlobalSearchContext(searchContext *types.SearchContext) bool</a>

```
searchKey: searchcontexts.IsGlobalSearchContext
tags: [function]
```

```Go
func IsGlobalSearchContext(searchContext *types.SearchContext) bool
```

### <a id="IsGlobalSearchContextSpec" href="#IsGlobalSearchContextSpec">func IsGlobalSearchContextSpec(searchContextSpec string) bool</a>

```
searchKey: searchcontexts.IsGlobalSearchContextSpec
tags: [function]
```

```Go
func IsGlobalSearchContextSpec(searchContextSpec string) bool
```

### <a id="IsInstanceLevelSearchContext" href="#IsInstanceLevelSearchContext">func IsInstanceLevelSearchContext(searchContext *types.SearchContext) bool</a>

```
searchKey: searchcontexts.IsInstanceLevelSearchContext
tags: [function]
```

```Go
func IsInstanceLevelSearchContext(searchContext *types.SearchContext) bool
```

### <a id="ResolveSearchContextSpec" href="#ResolveSearchContextSpec">func ResolveSearchContextSpec(ctx context.Context, db dbutil.DB, searchContextSpec string) (*types.SearchContext, error)</a>

```
searchKey: searchcontexts.ResolveSearchContextSpec
tags: [function]
```

```Go
func ResolveSearchContextSpec(ctx context.Context, db dbutil.DB, searchContextSpec string) (*types.SearchContext, error)
```

### <a id="TestConstructingSearchContextSpecs" href="#TestConstructingSearchContextSpecs">func TestConstructingSearchContextSpecs(t *testing.T)</a>

```
searchKey: searchcontexts.TestConstructingSearchContextSpecs
tags: [function private test]
```

```Go
func TestConstructingSearchContextSpecs(t *testing.T)
```

### <a id="TestConvertingVersionContextToSearchContext" href="#TestConvertingVersionContextToSearchContext">func TestConvertingVersionContextToSearchContext(t *testing.T)</a>

```
searchKey: searchcontexts.TestConvertingVersionContextToSearchContext
tags: [function private test]
```

```Go
func TestConvertingVersionContextToSearchContext(t *testing.T)
```

### <a id="TestCreatingSearchContexts" href="#TestCreatingSearchContexts">func TestCreatingSearchContexts(t *testing.T)</a>

```
searchKey: searchcontexts.TestCreatingSearchContexts
tags: [function private test]
```

```Go
func TestCreatingSearchContexts(t *testing.T)
```

### <a id="TestDeletingAutoDefinedSearchContext" href="#TestDeletingAutoDefinedSearchContext">func TestDeletingAutoDefinedSearchContext(t *testing.T)</a>

```
searchKey: searchcontexts.TestDeletingAutoDefinedSearchContext
tags: [function private test]
```

```Go
func TestDeletingAutoDefinedSearchContext(t *testing.T)
```

### <a id="TestGettingSearchContextFromVersionContext" href="#TestGettingSearchContextFromVersionContext">func TestGettingSearchContextFromVersionContext(t *testing.T)</a>

```
searchKey: searchcontexts.TestGettingSearchContextFromVersionContext
tags: [function private test]
```

```Go
func TestGettingSearchContextFromVersionContext(t *testing.T)
```

### <a id="TestResolvingInvalidSearchContextSpecs" href="#TestResolvingInvalidSearchContextSpecs">func TestResolvingInvalidSearchContextSpecs(t *testing.T)</a>

```
searchKey: searchcontexts.TestResolvingInvalidSearchContextSpecs
tags: [function private test]
```

```Go
func TestResolvingInvalidSearchContextSpecs(t *testing.T)
```

### <a id="TestResolvingSearchContextRepoNames" href="#TestResolvingSearchContextRepoNames">func TestResolvingSearchContextRepoNames(t *testing.T)</a>

```
searchKey: searchcontexts.TestResolvingSearchContextRepoNames
tags: [function private test]
```

```Go
func TestResolvingSearchContextRepoNames(t *testing.T)
```

### <a id="TestResolvingValidSearchContextSpecs" href="#TestResolvingValidSearchContextSpecs">func TestResolvingValidSearchContextSpecs(t *testing.T)</a>

```
searchKey: searchcontexts.TestResolvingValidSearchContextSpecs
tags: [function private test]
```

```Go
func TestResolvingValidSearchContextSpecs(t *testing.T)
```

### <a id="TestSearchContextWriteAccessValidation" href="#TestSearchContextWriteAccessValidation">func TestSearchContextWriteAccessValidation(t *testing.T)</a>

```
searchKey: searchcontexts.TestSearchContextWriteAccessValidation
tags: [function private test]
```

```Go
func TestSearchContextWriteAccessValidation(t *testing.T)
```

### <a id="TestUpdatingSearchContexts" href="#TestUpdatingSearchContexts">func TestUpdatingSearchContexts(t *testing.T)</a>

```
searchKey: searchcontexts.TestUpdatingSearchContexts
tags: [function private test]
```

```Go
func TestUpdatingSearchContexts(t *testing.T)
```

### <a id="UpdateSearchContextWithRepositoryRevisions" href="#UpdateSearchContextWithRepositoryRevisions">func UpdateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)</a>

```
searchKey: searchcontexts.UpdateSearchContextWithRepositoryRevisions
tags: [function]
```

```Go
func UpdateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)
```

### <a id="ValidateSearchContextWriteAccessForCurrentUser" href="#ValidateSearchContextWriteAccessForCurrentUser">func ValidateSearchContextWriteAccessForCurrentUser(ctx context.Context, db dbutil.DB, namespaceUserID, namespaceOrgID int32, public bool) error</a>

```
searchKey: searchcontexts.ValidateSearchContextWriteAccessForCurrentUser
tags: [function]
```

```Go
func ValidateSearchContextWriteAccessForCurrentUser(ctx context.Context, db dbutil.DB, namespaceUserID, namespaceOrgID int32, public bool) error
```

### <a id="createRepos" href="#createRepos">func createRepos(ctx context.Context, repoStore *database.RepoStore) ([]types.RepoName, error)</a>

```
searchKey: searchcontexts.createRepos
tags: [function private]
```

```Go
func createRepos(ctx context.Context, repoStore *database.RepoStore) ([]types.RepoName, error)
```

### <a id="getSearchContextFromVersionContext" href="#getSearchContextFromVersionContext">func getSearchContextFromVersionContext(versionContext *schema.VersionContext) *types.SearchContext</a>

```
searchKey: searchcontexts.getSearchContextFromVersionContext
tags: [function private]
```

```Go
func getSearchContextFromVersionContext(versionContext *schema.VersionContext) *types.SearchContext
```

### <a id="getVersionContextRepositoryRevisions" href="#getVersionContextRepositoryRevisions">func getVersionContextRepositoryRevisions(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) ([]*types.SearchContextRepositoryRevisions, error)</a>

```
searchKey: searchcontexts.getVersionContextRepositoryRevisions
tags: [function private]
```

```Go
func getVersionContextRepositoryRevisions(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) ([]*types.SearchContextRepositoryRevisions, error)
```

### <a id="init.search_contexts_test.go" href="#init.search_contexts_test.go">func init()</a>

```
searchKey: searchcontexts.init
tags: [function private]
```

```Go
func init()
```

### <a id="validateSearchContextDescription" href="#validateSearchContextDescription">func validateSearchContextDescription(description string) error</a>

```
searchKey: searchcontexts.validateSearchContextDescription
tags: [function private]
```

```Go
func validateSearchContextDescription(description string) error
```

### <a id="validateSearchContextDoesNotExist" href="#validateSearchContextDoesNotExist">func validateSearchContextDoesNotExist(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error</a>

```
searchKey: searchcontexts.validateSearchContextDoesNotExist
tags: [function private]
```

```Go
func validateSearchContextDoesNotExist(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error
```

### <a id="validateSearchContextName" href="#validateSearchContextName">func validateSearchContextName(name string) error</a>

```
searchKey: searchcontexts.validateSearchContextName
tags: [function private]
```

```Go
func validateSearchContextName(name string) error
```

### <a id="validateSearchContextRepositoryRevisions" href="#validateSearchContextRepositoryRevisions">func validateSearchContextRepositoryRevisions(repositoryRevisions []*types.SearchContextRepositoryRevisions) error</a>

```
searchKey: searchcontexts.validateSearchContextRepositoryRevisions
tags: [function private]
```

```Go
func validateSearchContextRepositoryRevisions(repositoryRevisions []*types.SearchContextRepositoryRevisions) error
```

