# Package searchcontexts

## Index

* [Constants](#const)
    * [const GlobalSearchContextName](#GlobalSearchContextName)
    * [const searchContextSpecPrefix](#searchContextSpecPrefix)
    * [const maxSearchContextNameLength](#maxSearchContextNameLength)
    * [const maxSearchContextDescriptionLength](#maxSearchContextDescriptionLength)
    * [const maxRevisionLength](#maxRevisionLength)
* [Variables](#var)
    * [var validateSearchContextNameRegexp](#validateSearchContextNameRegexp)
    * [var namespacedSearchContextSpecRegexp](#namespacedSearchContextSpecRegexp)
* [Types](#type)
    * [type ParsedSearchContextSpec struct](#ParsedSearchContextSpec)
        * [func ParseSearchContextSpec(searchContextSpec string) ParsedSearchContextSpec](#ParseSearchContextSpec)
* [Functions](#func)
    * [func ResolveSearchContextSpec(ctx context.Context, db dbutil.DB, searchContextSpec string) (*types.SearchContext, error)](#ResolveSearchContextSpec)
    * [func ValidateSearchContextWriteAccessForCurrentUser(ctx context.Context, db dbutil.DB, namespaceUserID, namespaceOrgID int32, public bool) error](#ValidateSearchContextWriteAccessForCurrentUser)
    * [func validateSearchContextName(name string) error](#validateSearchContextName)
    * [func validateSearchContextDescription(description string) error](#validateSearchContextDescription)
    * [func validateSearchContextRepositoryRevisions(repositoryRevisions []*types.SearchContextRepositoryRevisions) error](#validateSearchContextRepositoryRevisions)
    * [func validateSearchContextDoesNotExist(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error](#validateSearchContextDoesNotExist)
    * [func CreateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)](#CreateSearchContextWithRepositoryRevisions)
    * [func UpdateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)](#UpdateSearchContextWithRepositoryRevisions)
    * [func DeleteSearchContext(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error](#DeleteSearchContext)
    * [func GetAutoDefinedSearchContexts(ctx context.Context, db dbutil.DB) ([]*types.SearchContext, error)](#GetAutoDefinedSearchContexts)
    * [func GetRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContextID int64) ([]*search.RepositoryRevisions, error)](#GetRepositoryRevisions)
    * [func IsAutoDefinedSearchContext(searchContext *types.SearchContext) bool](#IsAutoDefinedSearchContext)
    * [func IsInstanceLevelSearchContext(searchContext *types.SearchContext) bool](#IsInstanceLevelSearchContext)
    * [func IsGlobalSearchContextSpec(searchContextSpec string) bool](#IsGlobalSearchContextSpec)
    * [func IsGlobalSearchContext(searchContext *types.SearchContext) bool](#IsGlobalSearchContext)
    * [func GetUserSearchContext(name string, userID int32) *types.SearchContext](#GetUserSearchContext)
    * [func GetGlobalSearchContext() *types.SearchContext](#GetGlobalSearchContext)
    * [func GetSearchContextSpec(searchContext *types.SearchContext) string](#GetSearchContextSpec)
    * [func getVersionContextRepositoryRevisions(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) ([]*types.SearchContextRepositoryRevisions, error)](#getVersionContextRepositoryRevisions)
    * [func getSearchContextFromVersionContext(versionContext *schema.VersionContext) *types.SearchContext](#getSearchContextFromVersionContext)
    * [func ConvertVersionContextToSearchContext(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) (*types.SearchContext, error)](#ConvertVersionContextToSearchContext)
    * [func init()](#init)
    * [func TestResolvingValidSearchContextSpecs(t *testing.T)](#TestResolvingValidSearchContextSpecs)
    * [func TestResolvingInvalidSearchContextSpecs(t *testing.T)](#TestResolvingInvalidSearchContextSpecs)
    * [func TestConstructingSearchContextSpecs(t *testing.T)](#TestConstructingSearchContextSpecs)
    * [func TestGettingSearchContextFromVersionContext(t *testing.T)](#TestGettingSearchContextFromVersionContext)
    * [func createRepos(ctx context.Context, repoStore *database.RepoStore) ([]types.RepoName, error)](#createRepos)
    * [func TestConvertingVersionContextToSearchContext(t *testing.T)](#TestConvertingVersionContextToSearchContext)
    * [func TestResolvingSearchContextRepoNames(t *testing.T)](#TestResolvingSearchContextRepoNames)
    * [func TestSearchContextWriteAccessValidation(t *testing.T)](#TestSearchContextWriteAccessValidation)
    * [func TestCreatingSearchContexts(t *testing.T)](#TestCreatingSearchContexts)
    * [func TestUpdatingSearchContexts(t *testing.T)](#TestUpdatingSearchContexts)
    * [func TestDeletingAutoDefinedSearchContext(t *testing.T)](#TestDeletingAutoDefinedSearchContext)


## <a id="const" href="#const">Constants</a>

### <a id="GlobalSearchContextName" href="#GlobalSearchContextName">const GlobalSearchContextName</a>

```
searchKey: searchcontexts.GlobalSearchContextName
tags: [exported]
```

```Go
const GlobalSearchContextName = "global"
```

### <a id="searchContextSpecPrefix" href="#searchContextSpecPrefix">const searchContextSpecPrefix</a>

```
searchKey: searchcontexts.searchContextSpecPrefix
```

```Go
const searchContextSpecPrefix = "@"
```

### <a id="maxSearchContextNameLength" href="#maxSearchContextNameLength">const maxSearchContextNameLength</a>

```
searchKey: searchcontexts.maxSearchContextNameLength
```

```Go
const maxSearchContextNameLength = 32
```

### <a id="maxSearchContextDescriptionLength" href="#maxSearchContextDescriptionLength">const maxSearchContextDescriptionLength</a>

```
searchKey: searchcontexts.maxSearchContextDescriptionLength
```

```Go
const maxSearchContextDescriptionLength = 1024
```

### <a id="maxRevisionLength" href="#maxRevisionLength">const maxRevisionLength</a>

```
searchKey: searchcontexts.maxRevisionLength
```

```Go
const maxRevisionLength = 255
```

## <a id="var" href="#var">Variables</a>

### <a id="validateSearchContextNameRegexp" href="#validateSearchContextNameRegexp">var validateSearchContextNameRegexp</a>

```
searchKey: searchcontexts.validateSearchContextNameRegexp
```

```Go
var validateSearchContextNameRegexp = lazyregexp.New(`^[a-zA-Z0-9_\-\/\.]+$`)
```

### <a id="namespacedSearchContextSpecRegexp" href="#namespacedSearchContextSpecRegexp">var namespacedSearchContextSpecRegexp</a>

```
searchKey: searchcontexts.namespacedSearchContextSpecRegexp
```

```Go
var namespacedSearchContextSpecRegexp = lazyregexp.New(searchContextSpecPrefix + `(.*?)\/(.*)`)
```

## <a id="type" href="#type">Types</a>

### <a id="ParsedSearchContextSpec" href="#ParsedSearchContextSpec">type ParsedSearchContextSpec struct</a>

```
searchKey: searchcontexts.ParsedSearchContextSpec
tags: [exported]
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
tags: [exported]
```

```Go
func ParseSearchContextSpec(searchContextSpec string) ParsedSearchContextSpec
```

## <a id="func" href="#func">Functions</a>

### <a id="ResolveSearchContextSpec" href="#ResolveSearchContextSpec">func ResolveSearchContextSpec(ctx context.Context, db dbutil.DB, searchContextSpec string) (*types.SearchContext, error)</a>

```
searchKey: searchcontexts.ResolveSearchContextSpec
tags: [exported]
```

```Go
func ResolveSearchContextSpec(ctx context.Context, db dbutil.DB, searchContextSpec string) (*types.SearchContext, error)
```

### <a id="ValidateSearchContextWriteAccessForCurrentUser" href="#ValidateSearchContextWriteAccessForCurrentUser">func ValidateSearchContextWriteAccessForCurrentUser(ctx context.Context, db dbutil.DB, namespaceUserID, namespaceOrgID int32, public bool) error</a>

```
searchKey: searchcontexts.ValidateSearchContextWriteAccessForCurrentUser
tags: [exported]
```

```Go
func ValidateSearchContextWriteAccessForCurrentUser(ctx context.Context, db dbutil.DB, namespaceUserID, namespaceOrgID int32, public bool) error
```

### <a id="validateSearchContextName" href="#validateSearchContextName">func validateSearchContextName(name string) error</a>

```
searchKey: searchcontexts.validateSearchContextName
```

```Go
func validateSearchContextName(name string) error
```

### <a id="validateSearchContextDescription" href="#validateSearchContextDescription">func validateSearchContextDescription(description string) error</a>

```
searchKey: searchcontexts.validateSearchContextDescription
```

```Go
func validateSearchContextDescription(description string) error
```

### <a id="validateSearchContextRepositoryRevisions" href="#validateSearchContextRepositoryRevisions">func validateSearchContextRepositoryRevisions(repositoryRevisions []*types.SearchContextRepositoryRevisions) error</a>

```
searchKey: searchcontexts.validateSearchContextRepositoryRevisions
```

```Go
func validateSearchContextRepositoryRevisions(repositoryRevisions []*types.SearchContextRepositoryRevisions) error
```

### <a id="validateSearchContextDoesNotExist" href="#validateSearchContextDoesNotExist">func validateSearchContextDoesNotExist(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error</a>

```
searchKey: searchcontexts.validateSearchContextDoesNotExist
```

```Go
func validateSearchContextDoesNotExist(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error
```

### <a id="CreateSearchContextWithRepositoryRevisions" href="#CreateSearchContextWithRepositoryRevisions">func CreateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)</a>

```
searchKey: searchcontexts.CreateSearchContextWithRepositoryRevisions
tags: [exported]
```

```Go
func CreateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)
```

### <a id="UpdateSearchContextWithRepositoryRevisions" href="#UpdateSearchContextWithRepositoryRevisions">func UpdateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)</a>

```
searchKey: searchcontexts.UpdateSearchContextWithRepositoryRevisions
tags: [exported]
```

```Go
func UpdateSearchContextWithRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (*types.SearchContext, error)
```

### <a id="DeleteSearchContext" href="#DeleteSearchContext">func DeleteSearchContext(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error</a>

```
searchKey: searchcontexts.DeleteSearchContext
tags: [exported]
```

```Go
func DeleteSearchContext(ctx context.Context, db dbutil.DB, searchContext *types.SearchContext) error
```

### <a id="GetAutoDefinedSearchContexts" href="#GetAutoDefinedSearchContexts">func GetAutoDefinedSearchContexts(ctx context.Context, db dbutil.DB) ([]*types.SearchContext, error)</a>

```
searchKey: searchcontexts.GetAutoDefinedSearchContexts
tags: [exported]
```

```Go
func GetAutoDefinedSearchContexts(ctx context.Context, db dbutil.DB) ([]*types.SearchContext, error)
```

### <a id="GetRepositoryRevisions" href="#GetRepositoryRevisions">func GetRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContextID int64) ([]*search.RepositoryRevisions, error)</a>

```
searchKey: searchcontexts.GetRepositoryRevisions
tags: [exported]
```

```Go
func GetRepositoryRevisions(ctx context.Context, db dbutil.DB, searchContextID int64) ([]*search.RepositoryRevisions, error)
```

### <a id="IsAutoDefinedSearchContext" href="#IsAutoDefinedSearchContext">func IsAutoDefinedSearchContext(searchContext *types.SearchContext) bool</a>

```
searchKey: searchcontexts.IsAutoDefinedSearchContext
tags: [exported]
```

```Go
func IsAutoDefinedSearchContext(searchContext *types.SearchContext) bool
```

### <a id="IsInstanceLevelSearchContext" href="#IsInstanceLevelSearchContext">func IsInstanceLevelSearchContext(searchContext *types.SearchContext) bool</a>

```
searchKey: searchcontexts.IsInstanceLevelSearchContext
tags: [exported]
```

```Go
func IsInstanceLevelSearchContext(searchContext *types.SearchContext) bool
```

### <a id="IsGlobalSearchContextSpec" href="#IsGlobalSearchContextSpec">func IsGlobalSearchContextSpec(searchContextSpec string) bool</a>

```
searchKey: searchcontexts.IsGlobalSearchContextSpec
tags: [exported]
```

```Go
func IsGlobalSearchContextSpec(searchContextSpec string) bool
```

### <a id="IsGlobalSearchContext" href="#IsGlobalSearchContext">func IsGlobalSearchContext(searchContext *types.SearchContext) bool</a>

```
searchKey: searchcontexts.IsGlobalSearchContext
tags: [exported]
```

```Go
func IsGlobalSearchContext(searchContext *types.SearchContext) bool
```

### <a id="GetUserSearchContext" href="#GetUserSearchContext">func GetUserSearchContext(name string, userID int32) *types.SearchContext</a>

```
searchKey: searchcontexts.GetUserSearchContext
tags: [exported]
```

```Go
func GetUserSearchContext(name string, userID int32) *types.SearchContext
```

### <a id="GetGlobalSearchContext" href="#GetGlobalSearchContext">func GetGlobalSearchContext() *types.SearchContext</a>

```
searchKey: searchcontexts.GetGlobalSearchContext
tags: [exported]
```

```Go
func GetGlobalSearchContext() *types.SearchContext
```

### <a id="GetSearchContextSpec" href="#GetSearchContextSpec">func GetSearchContextSpec(searchContext *types.SearchContext) string</a>

```
searchKey: searchcontexts.GetSearchContextSpec
tags: [exported]
```

```Go
func GetSearchContextSpec(searchContext *types.SearchContext) string
```

### <a id="getVersionContextRepositoryRevisions" href="#getVersionContextRepositoryRevisions">func getVersionContextRepositoryRevisions(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) ([]*types.SearchContextRepositoryRevisions, error)</a>

```
searchKey: searchcontexts.getVersionContextRepositoryRevisions
```

```Go
func getVersionContextRepositoryRevisions(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) ([]*types.SearchContextRepositoryRevisions, error)
```

### <a id="getSearchContextFromVersionContext" href="#getSearchContextFromVersionContext">func getSearchContextFromVersionContext(versionContext *schema.VersionContext) *types.SearchContext</a>

```
searchKey: searchcontexts.getSearchContextFromVersionContext
```

```Go
func getSearchContextFromVersionContext(versionContext *schema.VersionContext) *types.SearchContext
```

### <a id="ConvertVersionContextToSearchContext" href="#ConvertVersionContextToSearchContext">func ConvertVersionContextToSearchContext(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) (*types.SearchContext, error)</a>

```
searchKey: searchcontexts.ConvertVersionContextToSearchContext
tags: [exported]
```

```Go
func ConvertVersionContextToSearchContext(ctx context.Context, db dbutil.DB, versionContext *schema.VersionContext) (*types.SearchContext, error)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: searchcontexts.init
```

```Go
func init()
```

### <a id="TestResolvingValidSearchContextSpecs" href="#TestResolvingValidSearchContextSpecs">func TestResolvingValidSearchContextSpecs(t *testing.T)</a>

```
searchKey: searchcontexts.TestResolvingValidSearchContextSpecs
```

```Go
func TestResolvingValidSearchContextSpecs(t *testing.T)
```

### <a id="TestResolvingInvalidSearchContextSpecs" href="#TestResolvingInvalidSearchContextSpecs">func TestResolvingInvalidSearchContextSpecs(t *testing.T)</a>

```
searchKey: searchcontexts.TestResolvingInvalidSearchContextSpecs
```

```Go
func TestResolvingInvalidSearchContextSpecs(t *testing.T)
```

### <a id="TestConstructingSearchContextSpecs" href="#TestConstructingSearchContextSpecs">func TestConstructingSearchContextSpecs(t *testing.T)</a>

```
searchKey: searchcontexts.TestConstructingSearchContextSpecs
```

```Go
func TestConstructingSearchContextSpecs(t *testing.T)
```

### <a id="TestGettingSearchContextFromVersionContext" href="#TestGettingSearchContextFromVersionContext">func TestGettingSearchContextFromVersionContext(t *testing.T)</a>

```
searchKey: searchcontexts.TestGettingSearchContextFromVersionContext
```

```Go
func TestGettingSearchContextFromVersionContext(t *testing.T)
```

### <a id="createRepos" href="#createRepos">func createRepos(ctx context.Context, repoStore *database.RepoStore) ([]types.RepoName, error)</a>

```
searchKey: searchcontexts.createRepos
```

```Go
func createRepos(ctx context.Context, repoStore *database.RepoStore) ([]types.RepoName, error)
```

### <a id="TestConvertingVersionContextToSearchContext" href="#TestConvertingVersionContextToSearchContext">func TestConvertingVersionContextToSearchContext(t *testing.T)</a>

```
searchKey: searchcontexts.TestConvertingVersionContextToSearchContext
```

```Go
func TestConvertingVersionContextToSearchContext(t *testing.T)
```

### <a id="TestResolvingSearchContextRepoNames" href="#TestResolvingSearchContextRepoNames">func TestResolvingSearchContextRepoNames(t *testing.T)</a>

```
searchKey: searchcontexts.TestResolvingSearchContextRepoNames
```

```Go
func TestResolvingSearchContextRepoNames(t *testing.T)
```

### <a id="TestSearchContextWriteAccessValidation" href="#TestSearchContextWriteAccessValidation">func TestSearchContextWriteAccessValidation(t *testing.T)</a>

```
searchKey: searchcontexts.TestSearchContextWriteAccessValidation
```

```Go
func TestSearchContextWriteAccessValidation(t *testing.T)
```

### <a id="TestCreatingSearchContexts" href="#TestCreatingSearchContexts">func TestCreatingSearchContexts(t *testing.T)</a>

```
searchKey: searchcontexts.TestCreatingSearchContexts
```

```Go
func TestCreatingSearchContexts(t *testing.T)
```

### <a id="TestUpdatingSearchContexts" href="#TestUpdatingSearchContexts">func TestUpdatingSearchContexts(t *testing.T)</a>

```
searchKey: searchcontexts.TestUpdatingSearchContexts
```

```Go
func TestUpdatingSearchContexts(t *testing.T)
```

### <a id="TestDeletingAutoDefinedSearchContext" href="#TestDeletingAutoDefinedSearchContext">func TestDeletingAutoDefinedSearchContext(t *testing.T)</a>

```
searchKey: searchcontexts.TestDeletingAutoDefinedSearchContext
```

```Go
func TestDeletingAutoDefinedSearchContext(t *testing.T)
```
