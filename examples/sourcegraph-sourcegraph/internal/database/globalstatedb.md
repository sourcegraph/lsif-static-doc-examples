# Package globalstatedb

## Index

* [Variables](#var)
    * [var Mock](#Mock)
* [Types](#type)
    * [type State struct](#State)
        * [func Get(ctx context.Context) (*State, error)](#Get)
        * [func getConfiguration(ctx context.Context) (*State, error)](#getConfiguration)
    * [type queryExecDatabaseHandler interface](#queryExecDatabaseHandler)
    * [type execDatabaseHandler interface](#execDatabaseHandler)
* [Functions](#func)
    * [func SiteInitialized(ctx context.Context) (alreadyInitialized bool, err error)](#SiteInitialized)
    * [func EnsureInitialized(ctx context.Context, dbh queryExecDatabaseHandler) (alreadyInitialized bool, err error)](#EnsureInitialized)
    * [func tryInsertNew(ctx context.Context, dbh execDatabaseHandler) error](#tryInsertNew)
    * [func init()](#init)
    * [func TestGet(t *testing.T)](#TestGet)


## <a id="var" href="#var">Variables</a>

### <a id="Mock" href="#Mock">var Mock</a>

```
searchKey: globalstatedb.Mock
tags: [exported]
```

```Go
var Mock = struct {
	Get func(ctx context.Context) (*State, error)
}{}
```

## <a id="type" href="#type">Types</a>

### <a id="State" href="#State">type State struct</a>

```
searchKey: globalstatedb.State
tags: [exported]
```

```Go
type State struct {
	SiteID      string
	Initialized bool // whether the initial site admin account has been created
}
```

#### <a id="Get" href="#Get">func Get(ctx context.Context) (*State, error)</a>

```
searchKey: globalstatedb.Get
tags: [exported]
```

```Go
func Get(ctx context.Context) (*State, error)
```

#### <a id="getConfiguration" href="#getConfiguration">func getConfiguration(ctx context.Context) (*State, error)</a>

```
searchKey: globalstatedb.getConfiguration
```

```Go
func getConfiguration(ctx context.Context) (*State, error)
```

### <a id="queryExecDatabaseHandler" href="#queryExecDatabaseHandler">type queryExecDatabaseHandler interface</a>

```
searchKey: globalstatedb.queryExecDatabaseHandler
```

```Go
type queryExecDatabaseHandler interface {
	QueryRow(ctx context.Context, query *sqlf.Query) *sql.Row
	Exec(ctx context.Context, query *sqlf.Query) error
}
```

### <a id="execDatabaseHandler" href="#execDatabaseHandler">type execDatabaseHandler interface</a>

```
searchKey: globalstatedb.execDatabaseHandler
```

```Go
type execDatabaseHandler interface {
	Exec(ctx context.Context, query *sqlf.Query) error
}
```

## <a id="func" href="#func">Functions</a>

### <a id="SiteInitialized" href="#SiteInitialized">func SiteInitialized(ctx context.Context) (alreadyInitialized bool, err error)</a>

```
searchKey: globalstatedb.SiteInitialized
tags: [exported]
```

```Go
func SiteInitialized(ctx context.Context) (alreadyInitialized bool, err error)
```

### <a id="EnsureInitialized" href="#EnsureInitialized">func EnsureInitialized(ctx context.Context, dbh queryExecDatabaseHandler) (alreadyInitialized bool, err error)</a>

```
searchKey: globalstatedb.EnsureInitialized
tags: [exported]
```

```Go
func EnsureInitialized(ctx context.Context, dbh queryExecDatabaseHandler) (alreadyInitialized bool, err error)
```

EnsureInitialized ensures the site is marked as having been initialized. If the site was already initialized, it does nothing. It returns whether the site was already initialized prior to the call. 

🚨 SECURITY: Initialization is an important security measure. If a new account is created on a site that is not initialized, and no other accounts exist, it is granted site admin privileges. If the site *has* been initialized, then a new account is not granted site admin privileges (even if all other users are deleted). This reduces the risk of (1) a site admin accidentally deleting all user accounts and opening up their site to any attacker becoming a site admin and (2) a bug in user account creation code letting attackers create site admin accounts. 

### <a id="tryInsertNew" href="#tryInsertNew">func tryInsertNew(ctx context.Context, dbh execDatabaseHandler) error</a>

```
searchKey: globalstatedb.tryInsertNew
```

```Go
func tryInsertNew(ctx context.Context, dbh execDatabaseHandler) error
```

### <a id="init" href="#init">func init()</a>

```
searchKey: globalstatedb.init
```

```Go
func init()
```

### <a id="TestGet" href="#TestGet">func TestGet(t *testing.T)</a>

```
searchKey: globalstatedb.TestGet
```

```Go
func TestGet(t *testing.T)
```

