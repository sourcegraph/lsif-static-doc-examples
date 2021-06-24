# Package enforcement

Package enforcement provides hooks that enforce validations on a per-tier basis. 

## Index

* [Types](#type)
    * [type ExternalServicesStore interface](#ExternalServicesStore)
    * [type fakeDB struct](#fakeDB)
        * [func (db *fakeDB) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)](#fakeDB.ExecContext)
        * [func (db *fakeDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)](#fakeDB.QueryContext)
        * [func (db *fakeDB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row](#fakeDB.QueryRowContext)
* [Functions](#func)
    * [func NewAfterCreateUserHook() func(context.Context, dbutil.DB, *types.User) error](#NewAfterCreateUserHook)
    * [func NewBeforeCreateExternalServiceHook() func(ctx context.Context, db dbutil.DB) error](#NewBeforeCreateExternalServiceHook)
    * [func NewBeforeCreateUserHook() func(context.Context, dbutil.DB) error](#NewBeforeCreateUserHook)
    * [func NewBeforeSetUserIsSiteAdmin() func(isSiteAdmin bool) error](#NewBeforeSetUserIsSiteAdmin)
    * [func NewPreMountGrafanaHook() func() error](#NewPreMountGrafanaHook)
    * [func TestEnforcement_AfterCreateUser(t *testing.T)](#TestEnforcement_AfterCreateUser)
    * [func TestEnforcement_PreCreateUser(t *testing.T)](#TestEnforcement_PreCreateUser)
    * [func TestEnforcement_PreSetUserIsSiteAdmin(t *testing.T)](#TestEnforcement_PreSetUserIsSiteAdmin)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestNewPreCreateExternalServiceHook(t *testing.T)](#TestNewPreCreateExternalServiceHook)
    * [func WriteSubscriptionErrorResponse(w http.ResponseWriter, statusCode int, title, message string)](#WriteSubscriptionErrorResponse)
    * [func WriteSubscriptionErrorResponseForFeature(w http.ResponseWriter, featureNameHumanReadable string)](#WriteSubscriptionErrorResponseForFeature)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="ExternalServicesStore" href="#ExternalServicesStore">type ExternalServicesStore interface</a>

```
searchKey: enforcement.ExternalServicesStore
tags: [interface]
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
tags: [struct private]
```

```Go
type fakeDB struct {
	execContext func(ctx context.Context, query string, args ...interface{}) (sql.Result, error)
}
```

#### <a id="fakeDB.ExecContext" href="#fakeDB.ExecContext">func (db *fakeDB) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)</a>

```
searchKey: enforcement.fakeDB.ExecContext
tags: [method private]
```

```Go
func (db *fakeDB) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)
```

#### <a id="fakeDB.QueryContext" href="#fakeDB.QueryContext">func (db *fakeDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)</a>

```
searchKey: enforcement.fakeDB.QueryContext
tags: [method private]
```

```Go
func (db *fakeDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)
```

#### <a id="fakeDB.QueryRowContext" href="#fakeDB.QueryRowContext">func (db *fakeDB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row</a>

```
searchKey: enforcement.fakeDB.QueryRowContext
tags: [method private]
```

```Go
func (db *fakeDB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewAfterCreateUserHook" href="#NewAfterCreateUserHook">func NewAfterCreateUserHook() func(context.Context, dbutil.DB, *types.User) error</a>

```
searchKey: enforcement.NewAfterCreateUserHook
tags: [function]
```

```Go
func NewAfterCreateUserHook() func(context.Context, dbutil.DB, *types.User) error
```

NewAfterCreateUserHook returns a AfterCreateUserHook closure that determines whether a new user should be promoted to site admin based on the product license. 

### <a id="NewBeforeCreateExternalServiceHook" href="#NewBeforeCreateExternalServiceHook">func NewBeforeCreateExternalServiceHook() func(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: enforcement.NewBeforeCreateExternalServiceHook
tags: [function]
```

```Go
func NewBeforeCreateExternalServiceHook() func(ctx context.Context, db dbutil.DB) error
```

NewBeforeCreateExternalServiceHook enforces any per-tier validations prior to creating a new external service. 

### <a id="NewBeforeCreateUserHook" href="#NewBeforeCreateUserHook">func NewBeforeCreateUserHook() func(context.Context, dbutil.DB) error</a>

```
searchKey: enforcement.NewBeforeCreateUserHook
tags: [function]
```

```Go
func NewBeforeCreateUserHook() func(context.Context, dbutil.DB) error
```

NewBeforeCreateUserHook returns a BeforeCreateUserHook closure with the given UsersStore that determines whether new user is allowed to be created. 

### <a id="NewBeforeSetUserIsSiteAdmin" href="#NewBeforeSetUserIsSiteAdmin">func NewBeforeSetUserIsSiteAdmin() func(isSiteAdmin bool) error</a>

```
searchKey: enforcement.NewBeforeSetUserIsSiteAdmin
tags: [function]
```

```Go
func NewBeforeSetUserIsSiteAdmin() func(isSiteAdmin bool) error
```

NewBeforeSetUserIsSiteAdmin returns a BeforeSetUserIsSiteAdmin closure that determines whether non-site admin roles are allowed (i.e. revoke site admins) based on the product license. 

### <a id="NewPreMountGrafanaHook" href="#NewPreMountGrafanaHook">func NewPreMountGrafanaHook() func() error</a>

```
searchKey: enforcement.NewPreMountGrafanaHook
tags: [function]
```

```Go
func NewPreMountGrafanaHook() func() error
```

NewPreMountGrafanaHook enforces any per-tier validations prior to mounting the Grafana endpoints in the debug router. 

### <a id="TestEnforcement_AfterCreateUser" href="#TestEnforcement_AfterCreateUser">func TestEnforcement_AfterCreateUser(t *testing.T)</a>

```
searchKey: enforcement.TestEnforcement_AfterCreateUser
tags: [method private test]
```

```Go
func TestEnforcement_AfterCreateUser(t *testing.T)
```

### <a id="TestEnforcement_PreCreateUser" href="#TestEnforcement_PreCreateUser">func TestEnforcement_PreCreateUser(t *testing.T)</a>

```
searchKey: enforcement.TestEnforcement_PreCreateUser
tags: [method private test]
```

```Go
func TestEnforcement_PreCreateUser(t *testing.T)
```

### <a id="TestEnforcement_PreSetUserIsSiteAdmin" href="#TestEnforcement_PreSetUserIsSiteAdmin">func TestEnforcement_PreSetUserIsSiteAdmin(t *testing.T)</a>

```
searchKey: enforcement.TestEnforcement_PreSetUserIsSiteAdmin
tags: [method private test]
```

```Go
func TestEnforcement_PreSetUserIsSiteAdmin(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: enforcement.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestNewPreCreateExternalServiceHook" href="#TestNewPreCreateExternalServiceHook">func TestNewPreCreateExternalServiceHook(t *testing.T)</a>

```
searchKey: enforcement.TestNewPreCreateExternalServiceHook
tags: [method private test]
```

```Go
func TestNewPreCreateExternalServiceHook(t *testing.T)
```

### <a id="WriteSubscriptionErrorResponse" href="#WriteSubscriptionErrorResponse">func WriteSubscriptionErrorResponse(w http.ResponseWriter, statusCode int, title, message string)</a>

```
searchKey: enforcement.WriteSubscriptionErrorResponse
tags: [method]
```

```Go
func WriteSubscriptionErrorResponse(w http.ResponseWriter, statusCode int, title, message string)
```

WriteSubscriptionErrorResponse writes an HTTP response that displays a standalone error page to the user. 

The title and message should be full sentences that describe the problem and how to fix it. Use WriteSubscriptionErrorResponseForFeature to generate these for the common case of a failed license feature check. 

### <a id="WriteSubscriptionErrorResponseForFeature" href="#WriteSubscriptionErrorResponseForFeature">func WriteSubscriptionErrorResponseForFeature(w http.ResponseWriter, featureNameHumanReadable string)</a>

```
searchKey: enforcement.WriteSubscriptionErrorResponseForFeature
tags: [method]
```

```Go
func WriteSubscriptionErrorResponseForFeature(w http.ResponseWriter, featureNameHumanReadable string)
```

WriteSubscriptionErrorResponseForFeature is a wrapper around WriteSubscriptionErrorResponse that generates the error title and message indicating that the current license does not active the given feature. 

