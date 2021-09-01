# Package resolvers

## Index

* [Variables](#var)
    * [var errDisabledSourcegraphDotCom](#errDisabledSourcegraphDotCom)
    * [var now](#now)
    * [var parseSchemaErr](#parseSchemaErr)
    * [var parseSchemaOnce](#parseSchemaOnce)
    * [var parsedSchema](#parsedSchema)
* [Types](#type)
    * [type Resolver struct](#Resolver)
        * [func (r *Resolver) AuthorizedUserRepositories(ctx context.Context, args *graphqlbackend.AuthorizedRepoArgs) (graphqlbackend.RepositoryConnectionResolver, error)](#Resolver.AuthorizedUserRepositories)
        * [func (r *Resolver) AuthorizedUsers(ctx context.Context, args *graphqlbackend.RepoAuthorizedUserArgs) (graphqlbackend.UserConnectionResolver, error)](#Resolver.AuthorizedUsers)
        * [func (r *Resolver) RepositoryPermissionsInfo(ctx context.Context, id graphql.ID) (graphqlbackend.PermissionsInfoResolver, error)](#Resolver.RepositoryPermissionsInfo)
        * [func (r *Resolver) ScheduleRepositoryPermissionsSync(ctx context.Context, args *graphqlbackend.RepositoryIDArgs) (*graphqlbackend.EmptyResponse, error)](#Resolver.ScheduleRepositoryPermissionsSync)
        * [func (r *Resolver) ScheduleUserPermissionsSync(ctx context.Context, args *graphqlbackend.UserIDArgs) (*graphqlbackend.EmptyResponse, error)](#Resolver.ScheduleUserPermissionsSync)
        * [func (r *Resolver) SetRepositoryPermissionsForUsers(ctx context.Context, args *graphqlbackend.RepoPermsArgs) (resp *graphqlbackend.EmptyResponse, err error)](#Resolver.SetRepositoryPermissionsForUsers)
        * [func (r *Resolver) UserPermissionsInfo(ctx context.Context, id graphql.ID) (graphqlbackend.PermissionsInfoResolver, error)](#Resolver.UserPermissionsInfo)
        * [func (r *Resolver) UsersWithPendingPermissions(ctx context.Context) ([]string, error)](#Resolver.UsersWithPendingPermissions)
        * [func (r *Resolver) checkLicense() error](#Resolver.checkLicense)
    * [type fakeRepoupdaterClient struct](#fakeRepoupdaterClient)
        * [func (c *fakeRepoupdaterClient) SchedulePermsSync(ctx context.Context, args protocol.PermsSyncRequest) error](#fakeRepoupdaterClient.SchedulePermsSync)
    * [type permissionsInfoResolver struct](#permissionsInfoResolver)
        * [func (r *permissionsInfoResolver) Permissions() []string](#permissionsInfoResolver.Permissions)
        * [func (r *permissionsInfoResolver) SyncedAt() *graphqlbackend.DateTime](#permissionsInfoResolver.SyncedAt)
        * [func (r *permissionsInfoResolver) UpdatedAt() graphqlbackend.DateTime](#permissionsInfoResolver.UpdatedAt)
    * [type repositoryConnectionResolver struct](#repositoryConnectionResolver)
        * [func (r *repositoryConnectionResolver) Nodes(ctx context.Context) ([]*graphqlbackend.RepositoryResolver, error)](#repositoryConnectionResolver.Nodes)
        * [func (r *repositoryConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#repositoryConnectionResolver.PageInfo)
        * [func (r *repositoryConnectionResolver) TotalCount(ctx context.Context, args *graphqlbackend.TotalCountArgs) (*int32, error)](#repositoryConnectionResolver.TotalCount)
        * [func (r *repositoryConnectionResolver) compute(ctx context.Context) ([]*types.Repo, *graphqlutil.PageInfo, error)](#repositoryConnectionResolver.compute)
    * [type userConnectionResolver struct](#userConnectionResolver)
        * [func (r *userConnectionResolver) Nodes(ctx context.Context) ([]*graphqlbackend.UserResolver, error)](#userConnectionResolver.Nodes)
        * [func (r *userConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#userConnectionResolver.PageInfo)
        * [func (r *userConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#userConnectionResolver.TotalCount)
        * [func (r *userConnectionResolver) compute(ctx context.Context) ([]*types.User, *graphqlutil.PageInfo, error)](#userConnectionResolver.compute)
* [Functions](#func)
    * [func NewResolver(db dbutil.DB, clock func() time.Time) graphqlbackend.AuthzResolver](#NewResolver)
    * [func TestResolver_AuthorizedUserRepositories(t *testing.T)](#TestResolver_AuthorizedUserRepositories)
    * [func TestResolver_AuthorizedUsers(t *testing.T)](#TestResolver_AuthorizedUsers)
    * [func TestResolver_RepositoryPermissionsInfo(t *testing.T)](#TestResolver_RepositoryPermissionsInfo)
    * [func TestResolver_ScheduleRepositoryPermissionsSync(t *testing.T)](#TestResolver_ScheduleRepositoryPermissionsSync)
    * [func TestResolver_ScheduleUserPermissionsSync(t *testing.T)](#TestResolver_ScheduleUserPermissionsSync)
    * [func TestResolver_SetRepositoryPermissionsForUsers(t *testing.T)](#TestResolver_SetRepositoryPermissionsForUsers)
    * [func TestResolver_UserPermissionsInfo(t *testing.T)](#TestResolver_UserPermissionsInfo)
    * [func TestResolver_UsersWithPendingPermissions(t *testing.T)](#TestResolver_UsersWithPendingPermissions)
    * [func clock() time.Time](#clock)
    * [func mustParseGraphQLSchema(t *testing.T, db dbutil.DB) *graphql.Schema](#mustParseGraphQLSchema)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="errDisabledSourcegraphDotCom" href="#errDisabledSourcegraphDotCom">var errDisabledSourcegraphDotCom</a>

```
searchKey: resolvers.errDisabledSourcegraphDotCom
tags: [variable interface private]
```

```Go
var errDisabledSourcegraphDotCom = errors.New("not enabled on sourcegraph.com")
```

### <a id="now" href="#now">var now</a>

```
searchKey: resolvers.now
tags: [variable number private]
```

```Go
var now = timeutil.Now().UnixNano()
```

### <a id="parseSchemaErr" href="#parseSchemaErr">var parseSchemaErr</a>

```
searchKey: resolvers.parseSchemaErr
tags: [variable interface private]
```

```Go
var parseSchemaErr error
```

### <a id="parseSchemaOnce" href="#parseSchemaOnce">var parseSchemaOnce</a>

```
searchKey: resolvers.parseSchemaOnce
tags: [variable struct private]
```

```Go
var parseSchemaOnce sync.Once
```

### <a id="parsedSchema" href="#parsedSchema">var parsedSchema</a>

```
searchKey: resolvers.parsedSchema
tags: [variable struct private]
```

```Go
var parsedSchema *graphql.Schema
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: resolvers.Resolver
tags: [struct]
```

```Go
type Resolver struct {
	store             *edb.PermsStore
	repoupdaterClient interface {
		SchedulePermsSync(ctx context.Context, args protocol.PermsSyncRequest) error
	}
}
```

#### <a id="Resolver.AuthorizedUserRepositories" href="#Resolver.AuthorizedUserRepositories">func (r *Resolver) AuthorizedUserRepositories(ctx context.Context, args *graphqlbackend.AuthorizedRepoArgs) (graphqlbackend.RepositoryConnectionResolver, error)</a>

```
searchKey: resolvers.Resolver.AuthorizedUserRepositories
tags: [method]
```

```Go
func (r *Resolver) AuthorizedUserRepositories(ctx context.Context, args *graphqlbackend.AuthorizedRepoArgs) (graphqlbackend.RepositoryConnectionResolver, error)
```

#### <a id="Resolver.AuthorizedUsers" href="#Resolver.AuthorizedUsers">func (r *Resolver) AuthorizedUsers(ctx context.Context, args *graphqlbackend.RepoAuthorizedUserArgs) (graphqlbackend.UserConnectionResolver, error)</a>

```
searchKey: resolvers.Resolver.AuthorizedUsers
tags: [method]
```

```Go
func (r *Resolver) AuthorizedUsers(ctx context.Context, args *graphqlbackend.RepoAuthorizedUserArgs) (graphqlbackend.UserConnectionResolver, error)
```

#### <a id="Resolver.RepositoryPermissionsInfo" href="#Resolver.RepositoryPermissionsInfo">func (r *Resolver) RepositoryPermissionsInfo(ctx context.Context, id graphql.ID) (graphqlbackend.PermissionsInfoResolver, error)</a>

```
searchKey: resolvers.Resolver.RepositoryPermissionsInfo
tags: [method]
```

```Go
func (r *Resolver) RepositoryPermissionsInfo(ctx context.Context, id graphql.ID) (graphqlbackend.PermissionsInfoResolver, error)
```

#### <a id="Resolver.ScheduleRepositoryPermissionsSync" href="#Resolver.ScheduleRepositoryPermissionsSync">func (r *Resolver) ScheduleRepositoryPermissionsSync(ctx context.Context, args *graphqlbackend.RepositoryIDArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: resolvers.Resolver.ScheduleRepositoryPermissionsSync
tags: [method]
```

```Go
func (r *Resolver) ScheduleRepositoryPermissionsSync(ctx context.Context, args *graphqlbackend.RepositoryIDArgs) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="Resolver.ScheduleUserPermissionsSync" href="#Resolver.ScheduleUserPermissionsSync">func (r *Resolver) ScheduleUserPermissionsSync(ctx context.Context, args *graphqlbackend.UserIDArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: resolvers.Resolver.ScheduleUserPermissionsSync
tags: [method]
```

```Go
func (r *Resolver) ScheduleUserPermissionsSync(ctx context.Context, args *graphqlbackend.UserIDArgs) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="Resolver.SetRepositoryPermissionsForUsers" href="#Resolver.SetRepositoryPermissionsForUsers">func (r *Resolver) SetRepositoryPermissionsForUsers(ctx context.Context, args *graphqlbackend.RepoPermsArgs) (resp *graphqlbackend.EmptyResponse, err error)</a>

```
searchKey: resolvers.Resolver.SetRepositoryPermissionsForUsers
tags: [method]
```

```Go
func (r *Resolver) SetRepositoryPermissionsForUsers(ctx context.Context, args *graphqlbackend.RepoPermsArgs) (resp *graphqlbackend.EmptyResponse, err error)
```

#### <a id="Resolver.UserPermissionsInfo" href="#Resolver.UserPermissionsInfo">func (r *Resolver) UserPermissionsInfo(ctx context.Context, id graphql.ID) (graphqlbackend.PermissionsInfoResolver, error)</a>

```
searchKey: resolvers.Resolver.UserPermissionsInfo
tags: [method]
```

```Go
func (r *Resolver) UserPermissionsInfo(ctx context.Context, id graphql.ID) (graphqlbackend.PermissionsInfoResolver, error)
```

#### <a id="Resolver.UsersWithPendingPermissions" href="#Resolver.UsersWithPendingPermissions">func (r *Resolver) UsersWithPendingPermissions(ctx context.Context) ([]string, error)</a>

```
searchKey: resolvers.Resolver.UsersWithPendingPermissions
tags: [method]
```

```Go
func (r *Resolver) UsersWithPendingPermissions(ctx context.Context) ([]string, error)
```

#### <a id="Resolver.checkLicense" href="#Resolver.checkLicense">func (r *Resolver) checkLicense() error</a>

```
searchKey: resolvers.Resolver.checkLicense
tags: [method private]
```

```Go
func (r *Resolver) checkLicense() error
```

checkLicense returns a user-facing error if the ACLs feature is not purchased with the current license or any error occurred while validating the licence. 

### <a id="fakeRepoupdaterClient" href="#fakeRepoupdaterClient">type fakeRepoupdaterClient struct</a>

```
searchKey: resolvers.fakeRepoupdaterClient
tags: [struct private]
```

```Go
type fakeRepoupdaterClient struct {
	mockSchedulePermsSync func(ctx context.Context, args protocol.PermsSyncRequest) error
}
```

#### <a id="fakeRepoupdaterClient.SchedulePermsSync" href="#fakeRepoupdaterClient.SchedulePermsSync">func (c *fakeRepoupdaterClient) SchedulePermsSync(ctx context.Context, args protocol.PermsSyncRequest) error</a>

```
searchKey: resolvers.fakeRepoupdaterClient.SchedulePermsSync
tags: [method private]
```

```Go
func (c *fakeRepoupdaterClient) SchedulePermsSync(ctx context.Context, args protocol.PermsSyncRequest) error
```

### <a id="permissionsInfoResolver" href="#permissionsInfoResolver">type permissionsInfoResolver struct</a>

```
searchKey: resolvers.permissionsInfoResolver
tags: [struct private]
```

```Go
type permissionsInfoResolver struct {
	perms     authz.Perms
	syncedAt  time.Time
	updatedAt time.Time
}
```

#### <a id="permissionsInfoResolver.Permissions" href="#permissionsInfoResolver.Permissions">func (r *permissionsInfoResolver) Permissions() []string</a>

```
searchKey: resolvers.permissionsInfoResolver.Permissions
tags: [method private]
```

```Go
func (r *permissionsInfoResolver) Permissions() []string
```

#### <a id="permissionsInfoResolver.SyncedAt" href="#permissionsInfoResolver.SyncedAt">func (r *permissionsInfoResolver) SyncedAt() *graphqlbackend.DateTime</a>

```
searchKey: resolvers.permissionsInfoResolver.SyncedAt
tags: [method private]
```

```Go
func (r *permissionsInfoResolver) SyncedAt() *graphqlbackend.DateTime
```

#### <a id="permissionsInfoResolver.UpdatedAt" href="#permissionsInfoResolver.UpdatedAt">func (r *permissionsInfoResolver) UpdatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.permissionsInfoResolver.UpdatedAt
tags: [method private]
```

```Go
func (r *permissionsInfoResolver) UpdatedAt() graphqlbackend.DateTime
```

### <a id="repositoryConnectionResolver" href="#repositoryConnectionResolver">type repositoryConnectionResolver struct</a>

```
searchKey: resolvers.repositoryConnectionResolver
tags: [struct private]
```

```Go
type repositoryConnectionResolver struct {
	db  dbutil.DB
	ids *roaring.Bitmap

	first int32
	after *string

	// cache results because they are used by multiple fields
	once     sync.Once
	repos    []*types.Repo
	pageInfo *graphqlutil.PageInfo
	err      error
}
```

repositoryConnectionResolver resolves a list of repositories from the roaring bitmap with pagination. 

#### <a id="repositoryConnectionResolver.Nodes" href="#repositoryConnectionResolver.Nodes">func (r *repositoryConnectionResolver) Nodes(ctx context.Context) ([]*graphqlbackend.RepositoryResolver, error)</a>

```
searchKey: resolvers.repositoryConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *repositoryConnectionResolver) Nodes(ctx context.Context) ([]*graphqlbackend.RepositoryResolver, error)
```

#### <a id="repositoryConnectionResolver.PageInfo" href="#repositoryConnectionResolver.PageInfo">func (r *repositoryConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.repositoryConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *repositoryConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="repositoryConnectionResolver.TotalCount" href="#repositoryConnectionResolver.TotalCount">func (r *repositoryConnectionResolver) TotalCount(ctx context.Context, args *graphqlbackend.TotalCountArgs) (*int32, error)</a>

```
searchKey: resolvers.repositoryConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *repositoryConnectionResolver) TotalCount(ctx context.Context, args *graphqlbackend.TotalCountArgs) (*int32, error)
```

#### <a id="repositoryConnectionResolver.compute" href="#repositoryConnectionResolver.compute">func (r *repositoryConnectionResolver) compute(ctx context.Context) ([]*types.Repo, *graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.repositoryConnectionResolver.compute
tags: [method private]
```

```Go
func (r *repositoryConnectionResolver) compute(ctx context.Context) ([]*types.Repo, *graphqlutil.PageInfo, error)
```

🚨 SECURITY: It is the caller's responsibility to ensure the current authenticated user is the site admin because this method computes data from all available information in the database. 

### <a id="userConnectionResolver" href="#userConnectionResolver">type userConnectionResolver struct</a>

```
searchKey: resolvers.userConnectionResolver
tags: [struct private]
```

```Go
type userConnectionResolver struct {
	ids *roaring.Bitmap
	db  dbutil.DB

	first int32
	after *string

	// cache results because they are used by multiple fields
	once     sync.Once
	users    []*types.User
	pageInfo *graphqlutil.PageInfo
	err      error
}
```

userConnectionResolver resolves a list of user from the roaring bitmap with pagination. 

#### <a id="userConnectionResolver.Nodes" href="#userConnectionResolver.Nodes">func (r *userConnectionResolver) Nodes(ctx context.Context) ([]*graphqlbackend.UserResolver, error)</a>

```
searchKey: resolvers.userConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *userConnectionResolver) Nodes(ctx context.Context) ([]*graphqlbackend.UserResolver, error)
```

#### <a id="userConnectionResolver.PageInfo" href="#userConnectionResolver.PageInfo">func (r *userConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.userConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *userConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="userConnectionResolver.TotalCount" href="#userConnectionResolver.TotalCount">func (r *userConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.userConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *userConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="userConnectionResolver.compute" href="#userConnectionResolver.compute">func (r *userConnectionResolver) compute(ctx context.Context) ([]*types.User, *graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.userConnectionResolver.compute
tags: [method private]
```

```Go
func (r *userConnectionResolver) compute(ctx context.Context) ([]*types.User, *graphqlutil.PageInfo, error)
```

🚨 SECURITY: It is the caller's responsibility to ensure the current authenticated user is the site admin because this method computes data from all available information in the database. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewResolver" href="#NewResolver">func NewResolver(db dbutil.DB, clock func() time.Time) graphqlbackend.AuthzResolver</a>

```
searchKey: resolvers.NewResolver
tags: [function]
```

```Go
func NewResolver(db dbutil.DB, clock func() time.Time) graphqlbackend.AuthzResolver
```

### <a id="TestResolver_AuthorizedUserRepositories" href="#TestResolver_AuthorizedUserRepositories">func TestResolver_AuthorizedUserRepositories(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_AuthorizedUserRepositories
tags: [function private test]
```

```Go
func TestResolver_AuthorizedUserRepositories(t *testing.T)
```

### <a id="TestResolver_AuthorizedUsers" href="#TestResolver_AuthorizedUsers">func TestResolver_AuthorizedUsers(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_AuthorizedUsers
tags: [function private test]
```

```Go
func TestResolver_AuthorizedUsers(t *testing.T)
```

### <a id="TestResolver_RepositoryPermissionsInfo" href="#TestResolver_RepositoryPermissionsInfo">func TestResolver_RepositoryPermissionsInfo(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_RepositoryPermissionsInfo
tags: [function private test]
```

```Go
func TestResolver_RepositoryPermissionsInfo(t *testing.T)
```

### <a id="TestResolver_ScheduleRepositoryPermissionsSync" href="#TestResolver_ScheduleRepositoryPermissionsSync">func TestResolver_ScheduleRepositoryPermissionsSync(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_ScheduleRepositoryPermissionsSync
tags: [function private test]
```

```Go
func TestResolver_ScheduleRepositoryPermissionsSync(t *testing.T)
```

### <a id="TestResolver_ScheduleUserPermissionsSync" href="#TestResolver_ScheduleUserPermissionsSync">func TestResolver_ScheduleUserPermissionsSync(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_ScheduleUserPermissionsSync
tags: [function private test]
```

```Go
func TestResolver_ScheduleUserPermissionsSync(t *testing.T)
```

### <a id="TestResolver_SetRepositoryPermissionsForUsers" href="#TestResolver_SetRepositoryPermissionsForUsers">func TestResolver_SetRepositoryPermissionsForUsers(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_SetRepositoryPermissionsForUsers
tags: [function private test]
```

```Go
func TestResolver_SetRepositoryPermissionsForUsers(t *testing.T)
```

### <a id="TestResolver_UserPermissionsInfo" href="#TestResolver_UserPermissionsInfo">func TestResolver_UserPermissionsInfo(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_UserPermissionsInfo
tags: [function private test]
```

```Go
func TestResolver_UserPermissionsInfo(t *testing.T)
```

### <a id="TestResolver_UsersWithPendingPermissions" href="#TestResolver_UsersWithPendingPermissions">func TestResolver_UsersWithPendingPermissions(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_UsersWithPendingPermissions
tags: [function private test]
```

```Go
func TestResolver_UsersWithPendingPermissions(t *testing.T)
```

### <a id="clock" href="#clock">func clock() time.Time</a>

```
searchKey: resolvers.clock
tags: [function private]
```

```Go
func clock() time.Time
```

### <a id="mustParseGraphQLSchema" href="#mustParseGraphQLSchema">func mustParseGraphQLSchema(t *testing.T, db dbutil.DB) *graphql.Schema</a>

```
searchKey: resolvers.mustParseGraphQLSchema
tags: [function private]
```

```Go
func mustParseGraphQLSchema(t *testing.T, db dbutil.DB) *graphql.Schema
```

