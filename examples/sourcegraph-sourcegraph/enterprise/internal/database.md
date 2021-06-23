# Package database

## Index

* [Variables](#var)
    * [var Mocks](#Mocks)
    * [var ErrPermsUpdatedAtNotSet](#ErrPermsUpdatedAtNotSet)
    * [var ErrPermsSyncedAtNotSet](#ErrPermsSyncedAtNotSet)
    * [var dsn](#dsn)
    * [var now](#now)
* [Types](#type)
    * [type authzStore struct](#authzStore)
        * [func (s *authzStore) GrantPendingPermissions(ctx context.Context, args *database.GrantPendingPermissionsArgs) (err error)](#authzStore.GrantPendingPermissions)
        * [func (s *authzStore) AuthorizedRepos(ctx context.Context, args *database.AuthorizedReposArgs) ([]*types.Repo, error)](#authzStore.AuthorizedRepos)
        * [func (s *authzStore) RevokeUserPermissions(ctx context.Context, args *database.RevokeUserPermissionsArgs) (err error)](#authzStore.RevokeUserPermissions)
    * [type MockStores struct](#MockStores)
    * [type PermsStore struct](#PermsStore)
        * [func Perms(db dbutil.DB, clock func() time.Time) *PermsStore](#Perms)
        * [func (s *PermsStore) With(other basestore.ShareableStore) *PermsStore](#PermsStore.With)
        * [func (s *PermsStore) Transact(ctx context.Context) (*PermsStore, error)](#PermsStore.Transact)
        * [func (s *PermsStore) Done(err error) error](#PermsStore.Done)
        * [func (s *PermsStore) LoadUserPermissions(ctx context.Context, p *authz.UserPermissions) (err error)](#PermsStore.LoadUserPermissions)
        * [func (s *PermsStore) LoadRepoPermissions(ctx context.Context, p *authz.RepoPermissions) (err error)](#PermsStore.LoadRepoPermissions)
        * [func (s *PermsStore) SetUserPermissions(ctx context.Context, p *authz.UserPermissions) (err error)](#PermsStore.SetUserPermissions)
        * [func (s *PermsStore) SetRepoPermissions(ctx context.Context, p *authz.RepoPermissions) (err error)](#PermsStore.SetRepoPermissions)
        * [func (s *PermsStore) TouchRepoPermissions(ctx context.Context, repoID int32) (err error)](#PermsStore.TouchRepoPermissions)
        * [func (s *PermsStore) LoadUserPendingPermissions(ctx context.Context, p *authz.UserPendingPermissions) (err error)](#PermsStore.LoadUserPendingPermissions)
        * [func (s *PermsStore) SetRepoPendingPermissions(ctx context.Context, accounts *extsvc.Accounts, p *authz.RepoPermissions) (err error)](#PermsStore.SetRepoPendingPermissions)
        * [func (s *PermsStore) loadUserPendingPermissionsIDs(ctx context.Context, q *sqlf.Query) (ids []uint32, err error)](#PermsStore.loadUserPendingPermissionsIDs)
        * [func (s *PermsStore) GrantPendingPermissions(ctx context.Context, userID int32, p *authz.UserPendingPermissions) (err error)](#PermsStore.GrantPendingPermissions)
        * [func (s *PermsStore) ListPendingUsers(ctx context.Context, serviceType, serviceID string) (bindIDs []string, err error)](#PermsStore.ListPendingUsers)
        * [func (s *PermsStore) DeleteAllUserPermissions(ctx context.Context, userID int32) (err error)](#PermsStore.DeleteAllUserPermissions)
        * [func (s *PermsStore) DeleteAllUserPendingPermissions(ctx context.Context, accounts *extsvc.Accounts) (err error)](#PermsStore.DeleteAllUserPendingPermissions)
        * [func (s *PermsStore) execute(ctx context.Context, q *sqlf.Query, vs ...interface{}) (err error)](#PermsStore.execute)
        * [func (s *PermsStore) load(ctx context.Context, q *sqlf.Query) (*permsLoadValues, error)](#PermsStore.load)
        * [func (s *PermsStore) ListExternalAccounts(ctx context.Context, userID int32) (accounts []*extsvc.Account, err error)](#PermsStore.ListExternalAccounts)
        * [func (s *PermsStore) GetUserIDsByExternalAccounts(ctx context.Context, accounts *extsvc.Accounts) (_ map[string]int32, err error)](#PermsStore.GetUserIDsByExternalAccounts)
        * [func (s *PermsStore) UserIDsWithNoPerms(ctx context.Context) ([]int32, error)](#PermsStore.UserIDsWithNoPerms)
        * [func (s *PermsStore) RepoIDsWithNoPerms(ctx context.Context) ([]api.RepoID, error)](#PermsStore.RepoIDsWithNoPerms)
        * [func (s *PermsStore) UserIDsWithOldestPerms(ctx context.Context, limit int) (map[int32]time.Time, error)](#PermsStore.UserIDsWithOldestPerms)
        * [func (s *PermsStore) ReposIDsWithOldestPerms(ctx context.Context, limit int) (map[api.RepoID]time.Time, error)](#PermsStore.ReposIDsWithOldestPerms)
        * [func (s *PermsStore) loadIDsWithTime(ctx context.Context, q *sqlf.Query) (map[int32]time.Time, error)](#PermsStore.loadIDsWithTime)
        * [func (s *PermsStore) Metrics(ctx context.Context, staleDur time.Duration) (*PermsMetrics, error)](#PermsStore.Metrics)
        * [func (s *PermsStore) observe(ctx context.Context, family, title string) (context.Context, func(*error, ...otlog.Field))](#PermsStore.observe)
    * [type permsLoadValues struct](#permsLoadValues)
    * [type PermsMetrics struct](#PermsMetrics)
    * [type MockPerms struct](#MockPerms)
* [Functions](#func)
    * [func NewAuthzStore(db dbutil.DB, clock func() time.Time) database.AuthzStore](#NewAuthzStore)
    * [func NewExternalServicesStore(d dbutil.DB) *database.ExternalServiceStore](#NewExternalServicesStore)
    * [func loadUserPermissionsQuery(p *authz.UserPermissions, lock string) *sqlf.Query](#loadUserPermissionsQuery)
    * [func loadRepoPermissionsQuery(p *authz.RepoPermissions, lock string) *sqlf.Query](#loadRepoPermissionsQuery)
    * [func upsertUserPermissionsQuery(p *authz.UserPermissions) (*sqlf.Query, error)](#upsertUserPermissionsQuery)
    * [func upsertUserPermissionsBatchQuery(addedUserIDs, removedUserIDs, objectIDs []uint32, perm authz.Perms, permType authz.PermType, updatedAt time.Time) (*sqlf.Query, error)](#upsertUserPermissionsBatchQuery)
    * [func upsertRepoPermissionsQuery(p *authz.RepoPermissions) (*sqlf.Query, error)](#upsertRepoPermissionsQuery)
    * [func loadUserPendingPermissionsQuery(p *authz.UserPendingPermissions, lock string) *sqlf.Query](#loadUserPendingPermissionsQuery)
    * [func insertUserPendingPermissionsBatchQuery(accounts *extsvc.Accounts,...](#insertUserPendingPermissionsBatchQuery)
    * [func loadRepoPendingPermissionsQuery(p *authz.RepoPermissions, lock string) *sqlf.Query](#loadRepoPendingPermissionsQuery)
    * [func updateUserPendingPermissionsBatchQuery(addedUserIDs, removedUserIDs, objectIDs []uint32, perm authz.Perms, permType authz.PermType, updatedAt time.Time) (*sqlf.Query, error)](#updateUserPendingPermissionsBatchQuery)
    * [func upsertRepoPendingPermissionsBatchQuery(ps ...*authz.RepoPermissions) (*sqlf.Query, error)](#upsertRepoPendingPermissionsBatchQuery)
    * [func upsertRepoPermissionsBatchQuery(addedRepoIDs, removedRepoIDs, userIDs []uint32, perm authz.Perms, updatedAt time.Time) (*sqlf.Query, error)](#upsertRepoPermissionsBatchQuery)
    * [func deleteUserPendingPermissionsQuery(p *authz.UserPendingPermissions) *sqlf.Query](#deleteUserPendingPermissionsQuery)
    * [func TestAuthzStore_GrantPendingPermissions(t *testing.T)](#TestAuthzStore_GrantPendingPermissions)
    * [func TestAuthzStore_AuthorizedRepos(t *testing.T)](#TestAuthzStore_AuthorizedRepos)
    * [func TestAuthzStore_RevokeUserPermissions(t *testing.T)](#TestAuthzStore_RevokeUserPermissions)
    * [func init()](#init.db_test.go)
    * [func equal(t testing.TB, name string, want, have interface{})](#equal)
    * [func TestExternalServices_ValidateConfig(t *testing.T)](#TestExternalServices_ValidateConfig)
    * [func TestIntegration_PermsStore(t *testing.T)](#TestIntegration_PermsStore)
    * [func cleanupPermsTables(t *testing.T, s *PermsStore)](#cleanupPermsTables)
    * [func bitmapToArray(bm *roaring.Bitmap) []int](#bitmapToArray)
    * [func toBitmap(ids ...uint32) *roaring.Bitmap](#toBitmap)
    * [func clock() time.Time](#clock)
    * [func testPermsStore_LoadUserPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_LoadUserPermissions)
    * [func testPermsStore_LoadRepoPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_LoadRepoPermissions)
    * [func checkRegularPermsTable(s *PermsStore, sql string, expects map[int32][]uint32) error](#checkRegularPermsTable)
    * [func testPermsStore_SetUserPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_SetUserPermissions)
    * [func testPermsStore_SetRepoPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_SetRepoPermissions)
    * [func testPermsStore_TouchRepoPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_TouchRepoPermissions)
    * [func testPermsStore_LoadUserPendingPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_LoadUserPendingPermissions)
    * [func checkUserPendingPermsTable(ctx context.Context,...](#checkUserPendingPermsTable)
    * [func checkRepoPendingPermsTable(ctx context.Context,...](#checkRepoPendingPermsTable)
    * [func testPermsStore_SetRepoPendingPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_SetRepoPendingPermissions)
    * [func testPermsStore_ListPendingUsers(db *sql.DB) func(*testing.T)](#testPermsStore_ListPendingUsers)
    * [func testPermsStore_GrantPendingPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_GrantPendingPermissions)
    * [func testPermsStore_SetPendingPermissionsAfterGrant(db *sql.DB) func(*testing.T)](#testPermsStore_SetPendingPermissionsAfterGrant)
    * [func testPermsStore_DeleteAllUserPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_DeleteAllUserPermissions)
    * [func testPermsStore_DeleteAllUserPendingPermissions(db *sql.DB) func(*testing.T)](#testPermsStore_DeleteAllUserPendingPermissions)
    * [func testPermsStore_DatabaseDeadlocks(db *sql.DB) func(*testing.T)](#testPermsStore_DatabaseDeadlocks)
    * [func cleanupUsersTable(t *testing.T, s *PermsStore)](#cleanupUsersTable)
    * [func testPermsStore_ListExternalAccounts(db *sql.DB) func(*testing.T)](#testPermsStore_ListExternalAccounts)
    * [func testPermsStore_GetUserIDsByExternalAccounts(db *sql.DB) func(*testing.T)](#testPermsStore_GetUserIDsByExternalAccounts)
    * [func testPermsStore_UserIDsWithNoPerms(db *sql.DB) func(*testing.T)](#testPermsStore_UserIDsWithNoPerms)
    * [func cleanupReposTable(t *testing.T, s *PermsStore)](#cleanupReposTable)
    * [func testPermsStore_RepoIDsWithNoPerms(db *sql.DB) func(*testing.T)](#testPermsStore_RepoIDsWithNoPerms)
    * [func testPermsStore_UserIDsWithOldestPerms(db *sql.DB) func(*testing.T)](#testPermsStore_UserIDsWithOldestPerms)
    * [func testPermsStore_ReposIDsWithOldestPerms(db *sql.DB) func(*testing.T)](#testPermsStore_ReposIDsWithOldestPerms)
    * [func testPermsStore_Metrics(db *sql.DB) func(*testing.T)](#testPermsStore_Metrics)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Mocks" href="#Mocks">var Mocks</a>

```
searchKey: database.Mocks
```

```Go
var Mocks MockStores
```

### <a id="ErrPermsUpdatedAtNotSet" href="#ErrPermsUpdatedAtNotSet">var ErrPermsUpdatedAtNotSet</a>

```
searchKey: database.ErrPermsUpdatedAtNotSet
```

```Go
var ErrPermsUpdatedAtNotSet = errors.New("permissions UpdatedAt timestamp must be set")
```

### <a id="ErrPermsSyncedAtNotSet" href="#ErrPermsSyncedAtNotSet">var ErrPermsSyncedAtNotSet</a>

```
searchKey: database.ErrPermsSyncedAtNotSet
```

```Go
var ErrPermsSyncedAtNotSet = errors.New("permissions SyncedAt timestamp must be set")
```

### <a id="dsn" href="#dsn">var dsn</a>

```
searchKey: database.dsn
tags: [private]
```

```Go
var dsn = flag.String("dsn", "", "Database connection string to use in integration tests")
```

### <a id="now" href="#now">var now</a>

```
searchKey: database.now
tags: [private]
```

```Go
var now = timeutil.Now().UnixNano()
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="authzStore" href="#authzStore">type authzStore struct</a>

```
searchKey: database.authzStore
tags: [private]
```

```Go
type authzStore struct {
	store *PermsStore
}
```

#### <a id="authzStore.GrantPendingPermissions" href="#authzStore.GrantPendingPermissions">func (s *authzStore) GrantPendingPermissions(ctx context.Context, args *database.GrantPendingPermissionsArgs) (err error)</a>

```
searchKey: database.authzStore.GrantPendingPermissions
tags: [private]
```

```Go
func (s *authzStore) GrantPendingPermissions(ctx context.Context, args *database.GrantPendingPermissionsArgs) (err error)
```

GrantPendingPermissions grants pending permissions for a user, which implements the database.AuthzStore interface. It uses provided arguments to retrieve information directly from the database to offload security concerns from the caller. 

It's possible that there are more than one verified emails and external accounts associated to the user and all of them have pending permissions, we can safely grant all of them whenever possible because permissions are unioned. 

#### <a id="authzStore.AuthorizedRepos" href="#authzStore.AuthorizedRepos">func (s *authzStore) AuthorizedRepos(ctx context.Context, args *database.AuthorizedReposArgs) ([]*types.Repo, error)</a>

```
searchKey: database.authzStore.AuthorizedRepos
tags: [private]
```

```Go
func (s *authzStore) AuthorizedRepos(ctx context.Context, args *database.AuthorizedReposArgs) ([]*types.Repo, error)
```

AuthorizedRepos checks if a user is authorized to access repositories in the candidate list, which implements the database.AuthzStore interface. 

#### <a id="authzStore.RevokeUserPermissions" href="#authzStore.RevokeUserPermissions">func (s *authzStore) RevokeUserPermissions(ctx context.Context, args *database.RevokeUserPermissionsArgs) (err error)</a>

```
searchKey: database.authzStore.RevokeUserPermissions
tags: [private]
```

```Go
func (s *authzStore) RevokeUserPermissions(ctx context.Context, args *database.RevokeUserPermissionsArgs) (err error)
```

RevokeUserPermissions deletes both effective and pending permissions that could be related to a user, which implements the database.AuthzStore interface. It proactively clean up left-over pending permissions to prevent accidental reuse (i.e. another user with same username or email address(es) but not the same person). 

### <a id="MockStores" href="#MockStores">type MockStores struct</a>

```
searchKey: database.MockStores
```

```Go
type MockStores struct {
	Perms MockPerms
}
```

MockStores has a field for each store interface with the concrete mock type (to obviate the need for tedious type assertions in test code). 

### <a id="PermsStore" href="#PermsStore">type PermsStore struct</a>

```
searchKey: database.PermsStore
```

```Go
type PermsStore struct {
	*basestore.Store

	clock func() time.Time
}
```

PermsStore is the unified interface for managing permissions explicitly in the database. It is concurrency-safe and maintains data consistency over the 'user_permissions', 'repo_permissions', 'user_pending_permissions', and 'repo_pending_permissions' tables. 

#### <a id="Perms" href="#Perms">func Perms(db dbutil.DB, clock func() time.Time) *PermsStore</a>

```
searchKey: database.Perms
```

```Go
func Perms(db dbutil.DB, clock func() time.Time) *PermsStore
```

NewPermsStore returns a new PermsStore with given parameters. 

#### <a id="PermsStore.With" href="#PermsStore.With">func (s *PermsStore) With(other basestore.ShareableStore) *PermsStore</a>

```
searchKey: database.PermsStore.With
```

```Go
func (s *PermsStore) With(other basestore.ShareableStore) *PermsStore
```

#### <a id="PermsStore.Transact" href="#PermsStore.Transact">func (s *PermsStore) Transact(ctx context.Context) (*PermsStore, error)</a>

```
searchKey: database.PermsStore.Transact
```

```Go
func (s *PermsStore) Transact(ctx context.Context) (*PermsStore, error)
```

Transact begins a new transaction and make a new PermsStore over it. 

#### <a id="PermsStore.Done" href="#PermsStore.Done">func (s *PermsStore) Done(err error) error</a>

```
searchKey: database.PermsStore.Done
```

```Go
func (s *PermsStore) Done(err error) error
```

#### <a id="PermsStore.LoadUserPermissions" href="#PermsStore.LoadUserPermissions">func (s *PermsStore) LoadUserPermissions(ctx context.Context, p *authz.UserPermissions) (err error)</a>

```
searchKey: database.PermsStore.LoadUserPermissions
```

```Go
func (s *PermsStore) LoadUserPermissions(ctx context.Context, p *authz.UserPermissions) (err error)
```

LoadUserPermissions loads stored user permissions into p. An ErrPermsNotFound is returned when there are no valid permissions available. 

#### <a id="PermsStore.LoadRepoPermissions" href="#PermsStore.LoadRepoPermissions">func (s *PermsStore) LoadRepoPermissions(ctx context.Context, p *authz.RepoPermissions) (err error)</a>

```
searchKey: database.PermsStore.LoadRepoPermissions
```

```Go
func (s *PermsStore) LoadRepoPermissions(ctx context.Context, p *authz.RepoPermissions) (err error)
```

LoadRepoPermissions loads stored repository permissions into p. An ErrPermsNotFound is returned when there are no valid permissions available. 

#### <a id="PermsStore.SetUserPermissions" href="#PermsStore.SetUserPermissions">func (s *PermsStore) SetUserPermissions(ctx context.Context, p *authz.UserPermissions) (err error)</a>

```
searchKey: database.PermsStore.SetUserPermissions
```

```Go
func (s *PermsStore) SetUserPermissions(ctx context.Context, p *authz.UserPermissions) (err error)
```

SetUserPermissions performs a full update for p, new object IDs found in p will be upserted and object IDs no longer in p will be removed. This method updates both `user_permissions` and `repo_permissions` tables. 

Example input: &UserPermissions{ 

```
UserID: 1,
Perm: authz.Read,
Type: authz.PermRepos,
IDs: bitmap{1, 2},

```
} 

Table states for input: 

```
	"user_permissions":
  user_id | permission | object_type | object_ids_ints | updated_at | synced_at
 ---------+------------+-------------+-----------------+------------+-----------
        1 |       read |       repos |          {1, 2} |      NOW() |     NOW()

 "repo_permissions":
  repo_id | permission | user_ids_ints | updated_at |  synced_at
 ---------+------------+---------------+------------+-------------
        1 |       read |           {1} |      NOW() | <Unchanged>
        2 |       read |           {1} |      NOW() | <Unchanged>

```
#### <a id="PermsStore.SetRepoPermissions" href="#PermsStore.SetRepoPermissions">func (s *PermsStore) SetRepoPermissions(ctx context.Context, p *authz.RepoPermissions) (err error)</a>

```
searchKey: database.PermsStore.SetRepoPermissions
```

```Go
func (s *PermsStore) SetRepoPermissions(ctx context.Context, p *authz.RepoPermissions) (err error)
```

SetRepoPermissions performs a full update for p, new user IDs found in p will be upserted and user IDs no longer in p will be removed. This method updates both `user_permissions` and `repo_permissions` tables. 

This method starts its own transaction for update consistency if the caller hasn't started one already. 

Example input: &RepoPermissions{ 

```
RepoID: 1,
Perm: authz.Read,
UserIDs: bitmap{1, 2},

```
} 

Table states for input: 

```
	"user_permissions":
  user_id | permission | object_type | object_ids_ints | updated_at |  synced_at
 ---------+------------+-------------+-----------------+------------+-------------
        1 |       read |       repos |             {1} |      NOW() | <Unchanged>
        2 |       read |       repos |             {1} |      NOW() | <Unchanged>

 "repo_permissions":
  repo_id | permission | user_ids_ints | updated_at | synced_at
 ---------+------------+---------------+------------+-----------
        1 |       read |        {1, 2} |      NOW() |     NOW()

```
#### <a id="PermsStore.TouchRepoPermissions" href="#PermsStore.TouchRepoPermissions">func (s *PermsStore) TouchRepoPermissions(ctx context.Context, repoID int32) (err error)</a>

```
searchKey: database.PermsStore.TouchRepoPermissions
```

```Go
func (s *PermsStore) TouchRepoPermissions(ctx context.Context, repoID int32) (err error)
```

TouchRepoPermissions only updates the value of both `updated_at` and `synced_at` columns of the `repo_permissions` table without modifying the permissions bits. It inserts a new row when the row does not yet exist. The use case is to trick the scheduler to skip the repository for syncing permissions when we can't sync permissions for the repository (e.g. due to insufficient permissions of the access token). 

#### <a id="PermsStore.LoadUserPendingPermissions" href="#PermsStore.LoadUserPendingPermissions">func (s *PermsStore) LoadUserPendingPermissions(ctx context.Context, p *authz.UserPendingPermissions) (err error)</a>

```
searchKey: database.PermsStore.LoadUserPendingPermissions
```

```Go
func (s *PermsStore) LoadUserPendingPermissions(ctx context.Context, p *authz.UserPendingPermissions) (err error)
```

LoadUserPendingPermissions returns pending permissions found by given parameters. An ErrPermsNotFound is returned when there are no pending permissions available. 

#### <a id="PermsStore.SetRepoPendingPermissions" href="#PermsStore.SetRepoPendingPermissions">func (s *PermsStore) SetRepoPendingPermissions(ctx context.Context, accounts *extsvc.Accounts, p *authz.RepoPermissions) (err error)</a>

```
searchKey: database.PermsStore.SetRepoPendingPermissions
```

```Go
func (s *PermsStore) SetRepoPendingPermissions(ctx context.Context, accounts *extsvc.Accounts, p *authz.RepoPermissions) (err error)
```

SetRepoPendingPermissions performs a full update for p with given accounts, new account IDs found will be upserted and account IDs no longer in AccountIDs will be removed. 

This method updates both `user_pending_permissions` and `repo_pending_permissions` tables. 

This method starts its own transaction for update consistency if the caller hasn't started one already. 

Example input: 

```
&extsvc.Accounts{
    ServiceType: "sourcegraph",
    ServiceID:   "[https://sourcegraph.com/](https://sourcegraph.com/)",
    AccountIDs:  []string{"alice", "bob"},
}
&authz.RepoPermissions{
    RepoID: 1,
    Perm: authz.Read,
}

```
Table states for input: 

```
	"user_pending_permissions":
  id | service_type |        service_id        | bind_id | permission | object_type | object_ids_ints | updated_at
 ----+--------------+--------------------------+---------+------------+-------------+-----------------+-----------
   1 | sourcegraph  | [https://sourcegraph.com/](https://sourcegraph.com/) |   alice |       read |       repos |             {1} | <DateTime>
   2 | sourcegraph  | [https://sourcegraph.com/](https://sourcegraph.com/) |     bob |       read |       repos |             {1} | <DateTime>

 "repo_pending_permissions":
  repo_id | permission | user_ids_ints | updated_at
 ---------+------------+---------------+------------
        1 |       read |        {1, 2} | <DateTime>

```
#### <a id="PermsStore.loadUserPendingPermissionsIDs" href="#PermsStore.loadUserPendingPermissionsIDs">func (s *PermsStore) loadUserPendingPermissionsIDs(ctx context.Context, q *sqlf.Query) (ids []uint32, err error)</a>

```
searchKey: database.PermsStore.loadUserPendingPermissionsIDs
tags: [private]
```

```Go
func (s *PermsStore) loadUserPendingPermissionsIDs(ctx context.Context, q *sqlf.Query) (ids []uint32, err error)
```

#### <a id="PermsStore.GrantPendingPermissions" href="#PermsStore.GrantPendingPermissions">func (s *PermsStore) GrantPendingPermissions(ctx context.Context, userID int32, p *authz.UserPendingPermissions) (err error)</a>

```
searchKey: database.PermsStore.GrantPendingPermissions
```

```Go
func (s *PermsStore) GrantPendingPermissions(ctx context.Context, userID int32, p *authz.UserPendingPermissions) (err error)
```

GrantPendingPermissions is used to grant pending permissions when the associated "ServiceType", "ServiceID" and "BindID" found in p becomes effective for a given user, e.g. username as bind ID when a user is created, email as bind ID when the email address is verified. 

Because there could be multiple external services and bind IDs that are associated with a single user (e.g. same user on different code hosts, multiple email addresses), it merges data from "repo_pending_permissions" and "user_pending_permissions" tables to "repo_permissions" and "user_permissions" tables for the user. Therefore, permissions are unioned not replaced, which is one of the main differences from SetRepoPermissions and SetRepoPendingPermissions methods. Another main difference is that multiple calls to this method are not idempotent as it conceptually does nothing when there is no data in the pending permissions tables for the user. 

This method starts its own transaction for update consistency if the caller hasn't started one already. 

🚨 SECURITY: This method takes arbitrary string as a valid bind ID and does not interpret the meaning of the value it represents. Therefore, it is caller's responsibility to ensure the legitimate relation between the given user ID and the bind ID found in p. 

#### <a id="PermsStore.ListPendingUsers" href="#PermsStore.ListPendingUsers">func (s *PermsStore) ListPendingUsers(ctx context.Context, serviceType, serviceID string) (bindIDs []string, err error)</a>

```
searchKey: database.PermsStore.ListPendingUsers
```

```Go
func (s *PermsStore) ListPendingUsers(ctx context.Context, serviceType, serviceID string) (bindIDs []string, err error)
```

ListPendingUsers returns a list of bind IDs who have pending permissions by given service type and ID. 

#### <a id="PermsStore.DeleteAllUserPermissions" href="#PermsStore.DeleteAllUserPermissions">func (s *PermsStore) DeleteAllUserPermissions(ctx context.Context, userID int32) (err error)</a>

```
searchKey: database.PermsStore.DeleteAllUserPermissions
```

```Go
func (s *PermsStore) DeleteAllUserPermissions(ctx context.Context, userID int32) (err error)
```

DeleteAllUserPermissions deletes all rows with given user ID from the "user_permissions" table, which effectively removes access to all repositories for the user. 

#### <a id="PermsStore.DeleteAllUserPendingPermissions" href="#PermsStore.DeleteAllUserPendingPermissions">func (s *PermsStore) DeleteAllUserPendingPermissions(ctx context.Context, accounts *extsvc.Accounts) (err error)</a>

```
searchKey: database.PermsStore.DeleteAllUserPendingPermissions
```

```Go
func (s *PermsStore) DeleteAllUserPendingPermissions(ctx context.Context, accounts *extsvc.Accounts) (err error)
```

DeleteAllUserPendingPermissions deletes all rows with given bind IDs from the "user_pending_permissions" table. It accepts list of bind IDs because a user has multiple bind IDs, e.g. username and email addresses. 

#### <a id="PermsStore.execute" href="#PermsStore.execute">func (s *PermsStore) execute(ctx context.Context, q *sqlf.Query, vs ...interface{}) (err error)</a>

```
searchKey: database.PermsStore.execute
tags: [private]
```

```Go
func (s *PermsStore) execute(ctx context.Context, q *sqlf.Query, vs ...interface{}) (err error)
```

#### <a id="PermsStore.load" href="#PermsStore.load">func (s *PermsStore) load(ctx context.Context, q *sqlf.Query) (*permsLoadValues, error)</a>

```
searchKey: database.PermsStore.load
tags: [private]
```

```Go
func (s *PermsStore) load(ctx context.Context, q *sqlf.Query) (*permsLoadValues, error)
```

load is a generic method that scans three values from one database table row, these values must have types and be scanned in the order of int32 (id), []byte (ids), time.Time (updatedAt) and nullable time.Time (syncedAt). In addition, it unmarshalles the []byte into a *roaring.Bitmap. 

#### <a id="PermsStore.ListExternalAccounts" href="#PermsStore.ListExternalAccounts">func (s *PermsStore) ListExternalAccounts(ctx context.Context, userID int32) (accounts []*extsvc.Account, err error)</a>

```
searchKey: database.PermsStore.ListExternalAccounts
```

```Go
func (s *PermsStore) ListExternalAccounts(ctx context.Context, userID int32) (accounts []*extsvc.Account, err error)
```

ListExternalAccounts returns all external accounts that are associated with given user. 

#### <a id="PermsStore.GetUserIDsByExternalAccounts" href="#PermsStore.GetUserIDsByExternalAccounts">func (s *PermsStore) GetUserIDsByExternalAccounts(ctx context.Context, accounts *extsvc.Accounts) (_ map[string]int32, err error)</a>

```
searchKey: database.PermsStore.GetUserIDsByExternalAccounts
```

```Go
func (s *PermsStore) GetUserIDsByExternalAccounts(ctx context.Context, accounts *extsvc.Accounts) (_ map[string]int32, err error)
```

GetUserIDsByExternalAccounts returns all user IDs matched by given external account specs. The returned set has mapping relation as "account ID -> user ID". The number of results could be less than the candidate list due to some users are not associated with any external account. 

#### <a id="PermsStore.UserIDsWithNoPerms" href="#PermsStore.UserIDsWithNoPerms">func (s *PermsStore) UserIDsWithNoPerms(ctx context.Context) ([]int32, error)</a>

```
searchKey: database.PermsStore.UserIDsWithNoPerms
```

```Go
func (s *PermsStore) UserIDsWithNoPerms(ctx context.Context) ([]int32, error)
```

UserIDsWithNoPerms returns a list of user IDs with no permissions found in the database. 

#### <a id="PermsStore.RepoIDsWithNoPerms" href="#PermsStore.RepoIDsWithNoPerms">func (s *PermsStore) RepoIDsWithNoPerms(ctx context.Context) ([]api.RepoID, error)</a>

```
searchKey: database.PermsStore.RepoIDsWithNoPerms
```

```Go
func (s *PermsStore) RepoIDsWithNoPerms(ctx context.Context) ([]api.RepoID, error)
```

RepoIDsWithNoPerms returns a list of private repository IDs with no permissions found in the database. 

#### <a id="PermsStore.UserIDsWithOldestPerms" href="#PermsStore.UserIDsWithOldestPerms">func (s *PermsStore) UserIDsWithOldestPerms(ctx context.Context, limit int) (map[int32]time.Time, error)</a>

```
searchKey: database.PermsStore.UserIDsWithOldestPerms
```

```Go
func (s *PermsStore) UserIDsWithOldestPerms(ctx context.Context, limit int) (map[int32]time.Time, error)
```

UserIDsWithOldestPerms returns a list of user ID and last updated pairs for users who have the least recent synced permissions in the database and capped results by the limit. 

#### <a id="PermsStore.ReposIDsWithOldestPerms" href="#PermsStore.ReposIDsWithOldestPerms">func (s *PermsStore) ReposIDsWithOldestPerms(ctx context.Context, limit int) (map[api.RepoID]time.Time, error)</a>

```
searchKey: database.PermsStore.ReposIDsWithOldestPerms
```

```Go
func (s *PermsStore) ReposIDsWithOldestPerms(ctx context.Context, limit int) (map[api.RepoID]time.Time, error)
```

ReposIDsWithOldestPerms returns a list of repository ID and last updated pairs for repositories that have the least recent synced permissions in the database and caps results by the limit. 

#### <a id="PermsStore.loadIDsWithTime" href="#PermsStore.loadIDsWithTime">func (s *PermsStore) loadIDsWithTime(ctx context.Context, q *sqlf.Query) (map[int32]time.Time, error)</a>

```
searchKey: database.PermsStore.loadIDsWithTime
tags: [private]
```

```Go
func (s *PermsStore) loadIDsWithTime(ctx context.Context, q *sqlf.Query) (map[int32]time.Time, error)
```

loadIDsWithTime runs the query and returns a list of ID and nullable time pairs. 

#### <a id="PermsStore.Metrics" href="#PermsStore.Metrics">func (s *PermsStore) Metrics(ctx context.Context, staleDur time.Duration) (*PermsMetrics, error)</a>

```
searchKey: database.PermsStore.Metrics
```

```Go
func (s *PermsStore) Metrics(ctx context.Context, staleDur time.Duration) (*PermsMetrics, error)
```

Metrics returns calculated metrics values by querying the database. The "staleDur" argument indicates how long ago was the last update to be considered as stale. 

#### <a id="PermsStore.observe" href="#PermsStore.observe">func (s *PermsStore) observe(ctx context.Context, family, title string) (context.Context, func(*error, ...otlog.Field))</a>

```
searchKey: database.PermsStore.observe
tags: [private]
```

```Go
func (s *PermsStore) observe(ctx context.Context, family, title string) (context.Context, func(*error, ...otlog.Field))
```

### <a id="permsLoadValues" href="#permsLoadValues">type permsLoadValues struct</a>

```
searchKey: database.permsLoadValues
tags: [private]
```

```Go
type permsLoadValues struct {
	id        int32           // An integer ID
	ids       *roaring.Bitmap // Bitmap of unmarshalled IDs
	updatedAt time.Time       // Last updated time of the row
	syncedAt  time.Time       // Last synced time of the row
}
```

permsLoadValues contains return values of (*PermsStore).load method. 

### <a id="PermsMetrics" href="#PermsMetrics">type PermsMetrics struct</a>

```
searchKey: database.PermsMetrics
```

```Go
type PermsMetrics struct {
	// The number of users with stale permissions.
	UsersWithStalePerms int64
	// The seconds between users with oldest and the most up-to-date permissions.
	UsersPermsGapSeconds float64
	// The number of repositories with stale permissions.
	ReposWithStalePerms int64
	// The seconds between repositories with oldest and the most up-to-date permissions.
	ReposPermsGapSeconds float64
}
```

PermsMetrics contains metrics values calculated by querying the database. 

### <a id="MockPerms" href="#MockPerms">type MockPerms struct</a>

```
searchKey: database.MockPerms
```

```Go
type MockPerms struct {
	Transact                     func(ctx context.Context) (*PermsStore, error)
	LoadRepoPermissions          func(ctx context.Context, p *authz.RepoPermissions) error
	LoadUserPermissions          func(ctx context.Context, p *authz.UserPermissions) error
	LoadUserPendingPermissions   func(ctx context.Context, p *authz.UserPendingPermissions) error
	SetUserPermissions           func(ctx context.Context, p *authz.UserPermissions) error
	SetRepoPermissions           func(ctx context.Context, p *authz.RepoPermissions) error
	SetRepoPendingPermissions    func(ctx context.Context, accounts *extsvc.Accounts, p *authz.RepoPermissions) error
	TouchRepoPermissions         func(ctx context.Context, repoID int32) error
	ListPendingUsers             func(ctx context.Context) ([]string, error)
	ListExternalAccounts         func(ctx context.Context, userID int32) ([]*extsvc.Account, error)
	GetUserIDsByExternalAccounts func(ctx context.Context, accounts *extsvc.Accounts) (map[string]int32, error)
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewAuthzStore" href="#NewAuthzStore">func NewAuthzStore(db dbutil.DB, clock func() time.Time) database.AuthzStore</a>

```
searchKey: database.NewAuthzStore
```

```Go
func NewAuthzStore(db dbutil.DB, clock func() time.Time) database.AuthzStore
```

NewAuthzStore returns an OSS database.AuthzStore set with enterprise implementation. 

### <a id="NewExternalServicesStore" href="#NewExternalServicesStore">func NewExternalServicesStore(d dbutil.DB) *database.ExternalServiceStore</a>

```
searchKey: database.NewExternalServicesStore
```

```Go
func NewExternalServicesStore(d dbutil.DB) *database.ExternalServiceStore
```

NewExternalServicesStore returns an OSS database.ExternalServicesStore set with enterprise validators. 

### <a id="loadUserPermissionsQuery" href="#loadUserPermissionsQuery">func loadUserPermissionsQuery(p *authz.UserPermissions, lock string) *sqlf.Query</a>

```
searchKey: database.loadUserPermissionsQuery
tags: [private]
```

```Go
func loadUserPermissionsQuery(p *authz.UserPermissions, lock string) *sqlf.Query
```

### <a id="loadRepoPermissionsQuery" href="#loadRepoPermissionsQuery">func loadRepoPermissionsQuery(p *authz.RepoPermissions, lock string) *sqlf.Query</a>

```
searchKey: database.loadRepoPermissionsQuery
tags: [private]
```

```Go
func loadRepoPermissionsQuery(p *authz.RepoPermissions, lock string) *sqlf.Query
```

### <a id="upsertUserPermissionsQuery" href="#upsertUserPermissionsQuery">func upsertUserPermissionsQuery(p *authz.UserPermissions) (*sqlf.Query, error)</a>

```
searchKey: database.upsertUserPermissionsQuery
tags: [private]
```

```Go
func upsertUserPermissionsQuery(p *authz.UserPermissions) (*sqlf.Query, error)
```

upsertUserPermissionsQuery upserts single row of user permissions, it does the same thing as upsertUserPermissionsBatchQuery but also updates "synced_at" column to the value of p.SyncedAt field. 

### <a id="upsertUserPermissionsBatchQuery" href="#upsertUserPermissionsBatchQuery">func upsertUserPermissionsBatchQuery(addedUserIDs, removedUserIDs, objectIDs []uint32, perm authz.Perms, permType authz.PermType, updatedAt time.Time) (*sqlf.Query, error)</a>

```
searchKey: database.upsertUserPermissionsBatchQuery
tags: [private]
```

```Go
func upsertUserPermissionsBatchQuery(addedUserIDs, removedUserIDs, objectIDs []uint32, perm authz.Perms, permType authz.PermType, updatedAt time.Time) (*sqlf.Query, error)
```

upsertUserPermissionsBatchQuery composes a SQL query that does both addition (for `addedUserIDs`) and deletion ( for `removedUserIDs`) of `objectIDs` using upsert. 

### <a id="upsertRepoPermissionsQuery" href="#upsertRepoPermissionsQuery">func upsertRepoPermissionsQuery(p *authz.RepoPermissions) (*sqlf.Query, error)</a>

```
searchKey: database.upsertRepoPermissionsQuery
tags: [private]
```

```Go
func upsertRepoPermissionsQuery(p *authz.RepoPermissions) (*sqlf.Query, error)
```

upsertRepoPermissionsQuery upserts single row of repository permissions, it does the same thing as upsertRepoPermissionsBatchQuery but also updates "synced_at" column to the value of p.SyncedAt field. 

### <a id="loadUserPendingPermissionsQuery" href="#loadUserPendingPermissionsQuery">func loadUserPendingPermissionsQuery(p *authz.UserPendingPermissions, lock string) *sqlf.Query</a>

```
searchKey: database.loadUserPendingPermissionsQuery
tags: [private]
```

```Go
func loadUserPendingPermissionsQuery(p *authz.UserPendingPermissions, lock string) *sqlf.Query
```

### <a id="insertUserPendingPermissionsBatchQuery" href="#insertUserPendingPermissionsBatchQuery">func insertUserPendingPermissionsBatchQuery(accounts *extsvc.Accounts,...</a>

```
searchKey: database.insertUserPendingPermissionsBatchQuery
tags: [private]
```

```Go
func insertUserPendingPermissionsBatchQuery(
	accounts *extsvc.Accounts,
	p *authz.RepoPermissions,
) (*sqlf.Query, error)
```

### <a id="loadRepoPendingPermissionsQuery" href="#loadRepoPendingPermissionsQuery">func loadRepoPendingPermissionsQuery(p *authz.RepoPermissions, lock string) *sqlf.Query</a>

```
searchKey: database.loadRepoPendingPermissionsQuery
tags: [private]
```

```Go
func loadRepoPendingPermissionsQuery(p *authz.RepoPermissions, lock string) *sqlf.Query
```

### <a id="updateUserPendingPermissionsBatchQuery" href="#updateUserPendingPermissionsBatchQuery">func updateUserPendingPermissionsBatchQuery(addedUserIDs, removedUserIDs, objectIDs []uint32, perm authz.Perms, permType authz.PermType, updatedAt time.Time) (*sqlf.Query, error)</a>

```
searchKey: database.updateUserPendingPermissionsBatchQuery
tags: [private]
```

```Go
func updateUserPendingPermissionsBatchQuery(addedUserIDs, removedUserIDs, objectIDs []uint32, perm authz.Perms, permType authz.PermType, updatedAt time.Time) (*sqlf.Query, error)
```

updateUserPendingPermissionsBatchQuery composes a SQL query that does both addition (for `addedUserIDs`) and deletion ( for `removedUserIDs`) of `objectIDs` using update. 

### <a id="upsertRepoPendingPermissionsBatchQuery" href="#upsertRepoPendingPermissionsBatchQuery">func upsertRepoPendingPermissionsBatchQuery(ps ...*authz.RepoPermissions) (*sqlf.Query, error)</a>

```
searchKey: database.upsertRepoPendingPermissionsBatchQuery
tags: [private]
```

```Go
func upsertRepoPendingPermissionsBatchQuery(ps ...*authz.RepoPermissions) (*sqlf.Query, error)
```

### <a id="upsertRepoPermissionsBatchQuery" href="#upsertRepoPermissionsBatchQuery">func upsertRepoPermissionsBatchQuery(addedRepoIDs, removedRepoIDs, userIDs []uint32, perm authz.Perms, updatedAt time.Time) (*sqlf.Query, error)</a>

```
searchKey: database.upsertRepoPermissionsBatchQuery
tags: [private]
```

```Go
func upsertRepoPermissionsBatchQuery(addedRepoIDs, removedRepoIDs, userIDs []uint32, perm authz.Perms, updatedAt time.Time) (*sqlf.Query, error)
```

upsertRepoPermissionsBatchQuery composes a SQL query that does both addition (for `addedRepoIDs`) and deletion ( for `removedRepoIDs`) of `userIDs` using upsert. 

### <a id="deleteUserPendingPermissionsQuery" href="#deleteUserPendingPermissionsQuery">func deleteUserPendingPermissionsQuery(p *authz.UserPendingPermissions) *sqlf.Query</a>

```
searchKey: database.deleteUserPendingPermissionsQuery
tags: [private]
```

```Go
func deleteUserPendingPermissionsQuery(p *authz.UserPendingPermissions) *sqlf.Query
```

### <a id="TestAuthzStore_GrantPendingPermissions" href="#TestAuthzStore_GrantPendingPermissions">func TestAuthzStore_GrantPendingPermissions(t *testing.T)</a>

```
searchKey: database.TestAuthzStore_GrantPendingPermissions
tags: [private]
```

```Go
func TestAuthzStore_GrantPendingPermissions(t *testing.T)
```

### <a id="TestAuthzStore_AuthorizedRepos" href="#TestAuthzStore_AuthorizedRepos">func TestAuthzStore_AuthorizedRepos(t *testing.T)</a>

```
searchKey: database.TestAuthzStore_AuthorizedRepos
tags: [private]
```

```Go
func TestAuthzStore_AuthorizedRepos(t *testing.T)
```

### <a id="TestAuthzStore_RevokeUserPermissions" href="#TestAuthzStore_RevokeUserPermissions">func TestAuthzStore_RevokeUserPermissions(t *testing.T)</a>

```
searchKey: database.TestAuthzStore_RevokeUserPermissions
tags: [private]
```

```Go
func TestAuthzStore_RevokeUserPermissions(t *testing.T)
```

### <a id="init.db_test.go" href="#init.db_test.go">func init()</a>

```
searchKey: database.init
tags: [private]
```

```Go
func init()
```

### <a id="equal" href="#equal">func equal(t testing.TB, name string, want, have interface{})</a>

```
searchKey: database.equal
tags: [private]
```

```Go
func equal(t testing.TB, name string, want, have interface{})
```

### <a id="TestExternalServices_ValidateConfig" href="#TestExternalServices_ValidateConfig">func TestExternalServices_ValidateConfig(t *testing.T)</a>

```
searchKey: database.TestExternalServices_ValidateConfig
tags: [private]
```

```Go
func TestExternalServices_ValidateConfig(t *testing.T)
```

This test lives in cmd/enterprise because it tests a proprietary super-set of the validation performed by the OSS version. 

### <a id="TestIntegration_PermsStore" href="#TestIntegration_PermsStore">func TestIntegration_PermsStore(t *testing.T)</a>

```
searchKey: database.TestIntegration_PermsStore
tags: [private]
```

```Go
func TestIntegration_PermsStore(t *testing.T)
```

### <a id="cleanupPermsTables" href="#cleanupPermsTables">func cleanupPermsTables(t *testing.T, s *PermsStore)</a>

```
searchKey: database.cleanupPermsTables
tags: [private]
```

```Go
func cleanupPermsTables(t *testing.T, s *PermsStore)
```

### <a id="bitmapToArray" href="#bitmapToArray">func bitmapToArray(bm *roaring.Bitmap) []int</a>

```
searchKey: database.bitmapToArray
tags: [private]
```

```Go
func bitmapToArray(bm *roaring.Bitmap) []int
```

### <a id="toBitmap" href="#toBitmap">func toBitmap(ids ...uint32) *roaring.Bitmap</a>

```
searchKey: database.toBitmap
tags: [private]
```

```Go
func toBitmap(ids ...uint32) *roaring.Bitmap
```

### <a id="clock" href="#clock">func clock() time.Time</a>

```
searchKey: database.clock
tags: [private]
```

```Go
func clock() time.Time
```

### <a id="testPermsStore_LoadUserPermissions" href="#testPermsStore_LoadUserPermissions">func testPermsStore_LoadUserPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_LoadUserPermissions
tags: [private]
```

```Go
func testPermsStore_LoadUserPermissions(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_LoadRepoPermissions" href="#testPermsStore_LoadRepoPermissions">func testPermsStore_LoadRepoPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_LoadRepoPermissions
tags: [private]
```

```Go
func testPermsStore_LoadRepoPermissions(db *sql.DB) func(*testing.T)
```

### <a id="checkRegularPermsTable" href="#checkRegularPermsTable">func checkRegularPermsTable(s *PermsStore, sql string, expects map[int32][]uint32) error</a>

```
searchKey: database.checkRegularPermsTable
tags: [private]
```

```Go
func checkRegularPermsTable(s *PermsStore, sql string, expects map[int32][]uint32) error
```

### <a id="testPermsStore_SetUserPermissions" href="#testPermsStore_SetUserPermissions">func testPermsStore_SetUserPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_SetUserPermissions
tags: [private]
```

```Go
func testPermsStore_SetUserPermissions(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_SetRepoPermissions" href="#testPermsStore_SetRepoPermissions">func testPermsStore_SetRepoPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_SetRepoPermissions
tags: [private]
```

```Go
func testPermsStore_SetRepoPermissions(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_TouchRepoPermissions" href="#testPermsStore_TouchRepoPermissions">func testPermsStore_TouchRepoPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_TouchRepoPermissions
tags: [private]
```

```Go
func testPermsStore_TouchRepoPermissions(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_LoadUserPendingPermissions" href="#testPermsStore_LoadUserPendingPermissions">func testPermsStore_LoadUserPendingPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_LoadUserPendingPermissions
tags: [private]
```

```Go
func testPermsStore_LoadUserPendingPermissions(db *sql.DB) func(*testing.T)
```

### <a id="checkUserPendingPermsTable" href="#checkUserPendingPermsTable">func checkUserPendingPermsTable(ctx context.Context,...</a>

```
searchKey: database.checkUserPendingPermsTable
tags: [private]
```

```Go
func checkUserPendingPermsTable(
	ctx context.Context,
	s *PermsStore,
	expects map[extsvc.AccountSpec][]uint32,
) (
	idToSpecs map[int32]extsvc.AccountSpec,
	err error,
)
```

### <a id="checkRepoPendingPermsTable" href="#checkRepoPendingPermsTable">func checkRepoPendingPermsTable(ctx context.Context,...</a>

```
searchKey: database.checkRepoPendingPermsTable
tags: [private]
```

```Go
func checkRepoPendingPermsTable(
	ctx context.Context,
	s *PermsStore,
	idToSpecs map[int32]extsvc.AccountSpec,
	expects map[int32][]extsvc.AccountSpec,
) error
```

### <a id="testPermsStore_SetRepoPendingPermissions" href="#testPermsStore_SetRepoPendingPermissions">func testPermsStore_SetRepoPendingPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_SetRepoPendingPermissions
tags: [private]
```

```Go
func testPermsStore_SetRepoPendingPermissions(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_ListPendingUsers" href="#testPermsStore_ListPendingUsers">func testPermsStore_ListPendingUsers(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_ListPendingUsers
tags: [private]
```

```Go
func testPermsStore_ListPendingUsers(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_GrantPendingPermissions" href="#testPermsStore_GrantPendingPermissions">func testPermsStore_GrantPendingPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_GrantPendingPermissions
tags: [private]
```

```Go
func testPermsStore_GrantPendingPermissions(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_SetPendingPermissionsAfterGrant" href="#testPermsStore_SetPendingPermissionsAfterGrant">func testPermsStore_SetPendingPermissionsAfterGrant(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_SetPendingPermissionsAfterGrant
tags: [private]
```

```Go
func testPermsStore_SetPendingPermissionsAfterGrant(db *sql.DB) func(*testing.T)
```

This test is used to ensure we ignore invalid pending user IDs on updating repository pending permissions because permissions have been granted for those users. 

### <a id="testPermsStore_DeleteAllUserPermissions" href="#testPermsStore_DeleteAllUserPermissions">func testPermsStore_DeleteAllUserPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_DeleteAllUserPermissions
tags: [private]
```

```Go
func testPermsStore_DeleteAllUserPermissions(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_DeleteAllUserPendingPermissions" href="#testPermsStore_DeleteAllUserPendingPermissions">func testPermsStore_DeleteAllUserPendingPermissions(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_DeleteAllUserPendingPermissions
tags: [private]
```

```Go
func testPermsStore_DeleteAllUserPendingPermissions(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_DatabaseDeadlocks" href="#testPermsStore_DatabaseDeadlocks">func testPermsStore_DatabaseDeadlocks(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_DatabaseDeadlocks
tags: [private]
```

```Go
func testPermsStore_DatabaseDeadlocks(db *sql.DB) func(*testing.T)
```

### <a id="cleanupUsersTable" href="#cleanupUsersTable">func cleanupUsersTable(t *testing.T, s *PermsStore)</a>

```
searchKey: database.cleanupUsersTable
tags: [private]
```

```Go
func cleanupUsersTable(t *testing.T, s *PermsStore)
```

### <a id="testPermsStore_ListExternalAccounts" href="#testPermsStore_ListExternalAccounts">func testPermsStore_ListExternalAccounts(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_ListExternalAccounts
tags: [private]
```

```Go
func testPermsStore_ListExternalAccounts(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_GetUserIDsByExternalAccounts" href="#testPermsStore_GetUserIDsByExternalAccounts">func testPermsStore_GetUserIDsByExternalAccounts(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_GetUserIDsByExternalAccounts
tags: [private]
```

```Go
func testPermsStore_GetUserIDsByExternalAccounts(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_UserIDsWithNoPerms" href="#testPermsStore_UserIDsWithNoPerms">func testPermsStore_UserIDsWithNoPerms(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_UserIDsWithNoPerms
tags: [private]
```

```Go
func testPermsStore_UserIDsWithNoPerms(db *sql.DB) func(*testing.T)
```

### <a id="cleanupReposTable" href="#cleanupReposTable">func cleanupReposTable(t *testing.T, s *PermsStore)</a>

```
searchKey: database.cleanupReposTable
tags: [private]
```

```Go
func cleanupReposTable(t *testing.T, s *PermsStore)
```

### <a id="testPermsStore_RepoIDsWithNoPerms" href="#testPermsStore_RepoIDsWithNoPerms">func testPermsStore_RepoIDsWithNoPerms(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_RepoIDsWithNoPerms
tags: [private]
```

```Go
func testPermsStore_RepoIDsWithNoPerms(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_UserIDsWithOldestPerms" href="#testPermsStore_UserIDsWithOldestPerms">func testPermsStore_UserIDsWithOldestPerms(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_UserIDsWithOldestPerms
tags: [private]
```

```Go
func testPermsStore_UserIDsWithOldestPerms(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_ReposIDsWithOldestPerms" href="#testPermsStore_ReposIDsWithOldestPerms">func testPermsStore_ReposIDsWithOldestPerms(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_ReposIDsWithOldestPerms
tags: [private]
```

```Go
func testPermsStore_ReposIDsWithOldestPerms(db *sql.DB) func(*testing.T)
```

### <a id="testPermsStore_Metrics" href="#testPermsStore_Metrics">func testPermsStore_Metrics(db *sql.DB) func(*testing.T)</a>

```
searchKey: database.testPermsStore_Metrics
tags: [private]
```

```Go
func testPermsStore_Metrics(db *sql.DB) func(*testing.T)
```

