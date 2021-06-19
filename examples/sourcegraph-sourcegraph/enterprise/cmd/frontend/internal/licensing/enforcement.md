# Package enforcement

Package enforcement provides hooks that enforce validations on a per-tier basis. 

## Index

* [Types](#type)
    * [type ExternalServicesStore interface](#ExternalServicesStore)
    * [type fakeDB struct](#fakeDB)
        * [func (db *fakeDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)](#fakeDB.QueryContext)
        * [func (db *fakeDB) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)](#fakeDB.ExecContext)
        * [func (db *fakeDB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row](#fakeDB.QueryRowContext)
* [Functions](#func)
    * [func WriteSubscriptionErrorResponseForFeature(w http.ResponseWriter, featureNameHumanReadable string)](#WriteSubscriptionErrorResponseForFeature)
    * [func WriteSubscriptionErrorResponse(w http.ResponseWriter, statusCode int, title, message string)](#WriteSubscriptionErrorResponse)
    * [func NewBeforeCreateExternalServiceHook() func(ctx context.Context, db dbutil.DB) error](#NewBeforeCreateExternalServiceHook)
    * [func NewPreMountGrafanaHook() func() error](#NewPreMountGrafanaHook)
    * [func NewBeforeCreateUserHook() func(context.Context, dbutil.DB) error](#NewBeforeCreateUserHook)
    * [func NewAfterCreateUserHook() func(context.Context, dbutil.DB, *types.User) error](#NewAfterCreateUserHook)
    * [func NewBeforeSetUserIsSiteAdmin() func(isSiteAdmin bool) error](#NewBeforeSetUserIsSiteAdmin)
    * [func TestNewPreCreateExternalServiceHook(t *testing.T)](#TestNewPreCreateExternalServiceHook)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestEnforcement_PreCreateUser(t *testing.T)](#TestEnforcement_PreCreateUser)
    * [func TestEnforcement_AfterCreateUser(t *testing.T)](#TestEnforcement_AfterCreateUser)
    * [func TestEnforcement_PreSetUserIsSiteAdmin(t *testing.T)](#TestEnforcement_PreSetUserIsSiteAdmin)


## <a id="type" href="#type">Types</a>

### <a id="ExternalServicesStore" href="#ExternalServicesStore">type ExternalServicesStore interface</a>

```
searchKey: enforcement.ExternalServicesStore
tags: [exported]
```

```Go
type ExternalServicesStore interface {
	Count(context.Context, database.ExternalServicesListOptions) (int, error)
}
```

ExternalServicesStore is implemented by any type that can act as a repository for external services (e.g. GitHub, GitLab). 

### <a id="fakeDB" href="#fakeDB">type fakeDB struct</a>

```
searchKey: enforcement.fakeDB
```

```Go
type fakeDB struct {
	execContext func(ctx context.Context, query string, args ...interface{}) (sql.Result, error)
}
```

#### <a id="fakeDB.QueryContext" href="#fakeDB.QueryContext">func (db *fakeDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)</a>

```
searchKey: enforcement.fakeDB.QueryContext
```

```Go
func (db *fakeDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)
```

#### <a id="fakeDB.ExecContext" href="#fakeDB.ExecContext">func (db *fakeDB) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)</a>

```
searchKey: enforcement.fakeDB.ExecContext
```

```Go
func (db *fakeDB) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)
```

#### <a id="fakeDB.QueryRowContext" href="#fakeDB.QueryRowContext">func (db *fakeDB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row</a>

```
searchKey: enforcement.fakeDB.QueryRowContext
```

```Go
func (db *fakeDB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row
```

## <a id="func" href="#func">Functions</a>

### <a id="WriteSubscriptionErrorResponseForFeature" href="#WriteSubscriptionErrorResponseForFeature">func WriteSubscriptionErrorResponseForFeature(w http.ResponseWriter, featureNameHumanReadable string)</a>

```
searchKey: enforcement.WriteSubscriptionErrorResponseForFeature
tags: [exported]
```

```Go
func WriteSubscriptionErrorResponseForFeature(w http.ResponseWriter, featureNameHumanReadable string)
```

WriteSubscriptionErrorResponseForFeature is a wrapper around WriteSubscriptionErrorResponse that generates the error title and message indicating that the current license does not active the given feature. 

### <a id="WriteSubscriptionErrorResponse" href="#WriteSubscriptionErrorResponse">func WriteSubscriptionErrorResponse(w http.ResponseWriter, statusCode int, title, message string)</a>

```
searchKey: enforcement.WriteSubscriptionErrorResponse
tags: [exported]
```

```Go
func WriteSubscriptionErrorResponse(w http.ResponseWriter, statusCode int, title, message string)
```

WriteSubscriptionErrorResponse writes an HTTP response that displays a standalone error page to the user. 

The title and message should be full sentences that describe the problem and how to fix it. Use WriteSubscriptionErrorResponseForFeature to generate these for the common case of a failed license feature check. 

### <a id="NewBeforeCreateExternalServiceHook" href="#NewBeforeCreateExternalServiceHook">func NewBeforeCreateExternalServiceHook() func(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: enforcement.NewBeforeCreateExternalServiceHook
tags: [exported]
```

```Go
func NewBeforeCreateExternalServiceHook() func(ctx context.Context, db dbutil.DB) error
```

NewBeforeCreateExternalServiceHook enforces any per-tier validations prior to creating a new external service. 

### <a id="NewPreMountGrafanaHook" href="#NewPreMountGrafanaHook">func NewPreMountGrafanaHook() func() error</a>

```
searchKey: enforcement.NewPreMountGrafanaHook
tags: [exported]
```

```Go
func NewPreMountGrafanaHook() func() error
```

NewPreMountGrafanaHook enforces any per-tier validations prior to mounting the Grafana endpoints in the debug router. 

### <a id="NewBeforeCreateUserHook" href="#NewBeforeCreateUserHook">func NewBeforeCreateUserHook() func(context.Context, dbutil.DB) error</a>

```
searchKey: enforcement.NewBeforeCreateUserHook
tags: [exported]
```

```Go
func NewBeforeCreateUserHook() func(context.Context, dbutil.DB) error
```

NewBeforeCreateUserHook returns a BeforeCreateUserHook closure with the given UsersStore that determines whether new user is allowed to be created. 

### <a id="NewAfterCreateUserHook" href="#NewAfterCreateUserHook">func NewAfterCreateUserHook() func(context.Context, dbutil.DB, *types.User) error</a>

```
searchKey: enforcement.NewAfterCreateUserHook
tags: [exported]
```

```Go
func NewAfterCreateUserHook() func(context.Context, dbutil.DB, *types.User) error
```

NewAfterCreateUserHook returns a AfterCreateUserHook closure that determines whether a new user should be promoted to site admin based on the product license. 

### <a id="NewBeforeSetUserIsSiteAdmin" href="#NewBeforeSetUserIsSiteAdmin">func NewBeforeSetUserIsSiteAdmin() func(isSiteAdmin bool) error</a>

```
searchKey: enforcement.NewBeforeSetUserIsSiteAdmin
tags: [exported]
```

```Go
func NewBeforeSetUserIsSiteAdmin() func(isSiteAdmin bool) error
```

NewBeforeSetUserIsSiteAdmin returns a BeforeSetUserIsSiteAdmin closure that determines whether non-site admin roles are allowed (i.e. revoke site admins) based on the product license. 

### <a id="TestNewPreCreateExternalServiceHook" href="#TestNewPreCreateExternalServiceHook">func TestNewPreCreateExternalServiceHook(t *testing.T)</a>

```
searchKey: enforcement.TestNewPreCreateExternalServiceHook
```

```Go
func TestNewPreCreateExternalServiceHook(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: enforcement.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestEnforcement_PreCreateUser" href="#TestEnforcement_PreCreateUser">func TestEnforcement_PreCreateUser(t *testing.T)</a>

```
searchKey: enforcement.TestEnforcement_PreCreateUser
```

```Go
func TestEnforcement_PreCreateUser(t *testing.T)
```

### <a id="TestEnforcement_AfterCreateUser" href="#TestEnforcement_AfterCreateUser">func TestEnforcement_AfterCreateUser(t *testing.T)</a>

```
searchKey: enforcement.TestEnforcement_AfterCreateUser
```

```Go
func TestEnforcement_AfterCreateUser(t *testing.T)
```

### <a id="TestEnforcement_PreSetUserIsSiteAdmin" href="#TestEnforcement_PreSetUserIsSiteAdmin">func TestEnforcement_PreSetUserIsSiteAdmin(t *testing.T)</a>

```
searchKey: enforcement.TestEnforcement_PreSetUserIsSiteAdmin
```

```Go
func TestEnforcement_PreSetUserIsSiteAdmin(t *testing.T)
```

