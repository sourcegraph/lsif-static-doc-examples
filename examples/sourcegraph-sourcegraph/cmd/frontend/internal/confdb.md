# Package confdb

Package confdb contains the DB logic for configuration storage / manipulation. 

Only the frontend imports this package. 

All other users should go through the conf package and NOT interact with the database on their own. 

## Index

* [Variables](#var)
    * [var ErrNewerEdit](#ErrNewerEdit)
* [Types](#type)
    * [type SiteConfig struct](#SiteConfig)
        * [func SiteCreateIfUpToDate(ctx context.Context, lastID *int32, contents string) (latest *SiteConfig, err error)](#SiteCreateIfUpToDate)
        * [func SiteGetLatest(ctx context.Context) (latest *SiteConfig, err error)](#SiteGetLatest)
        * [func createIfUpToDate(ctx context.Context, tx queryable, lastID *int32, contents string) (latest *SiteConfig, err error)](#createIfUpToDate)
        * [func getLatest(ctx context.Context, tx queryable) (*SiteConfig, error)](#getLatest)
    * [type queryable interface](#queryable)
        * [func newTransaction(ctx context.Context) (tx queryable, done func(), err error)](#newTransaction)
* [Functions](#func)
    * [func TestSiteCreateIfUpToDate(t *testing.T)](#TestSiteCreateIfUpToDate)
    * [func TestSiteCreate_RejectInvalidJSON(t *testing.T)](#TestSiteCreate_RejectInvalidJSON)
    * [func TestSiteGetLatestDefault(t *testing.T)](#TestSiteGetLatestDefault)
    * [func addDefault(ctx context.Context, tx queryable, contents string) (newLastID *int32, err error)](#addDefault)
    * [func init()](#init.db_test.go)
    * [func parseQueryRows(ctx context.Context, rows *sql.Rows) ([]*SiteConfig, error)](#parseQueryRows)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ErrNewerEdit" href="#ErrNewerEdit">var ErrNewerEdit</a>

```
searchKey: confdb.ErrNewerEdit
tags: [variable interface]
```

```Go
var ErrNewerEdit = errors.New("someone else has already applied a newer edit")
```

ErrNewerEdit is returned by SiteCreateIfUpToDate when a newer edit has already been applied and the edit has been rejected. 

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="SiteConfig" href="#SiteConfig">type SiteConfig struct</a>

```
searchKey: confdb.SiteConfig
tags: [struct]
```

```Go
type SiteConfig struct {
	ID        int32     // the unique ID of this config
	Contents  string    // the raw JSON content (with comments and trailing commas allowed)
	CreatedAt time.Time // the date when this config was created
	UpdatedAt time.Time // the date when this config was updated
}
```

SiteConfig contains the contents of a site config along with associated metadata. 

#### <a id="SiteCreateIfUpToDate" href="#SiteCreateIfUpToDate">func SiteCreateIfUpToDate(ctx context.Context, lastID *int32, contents string) (latest *SiteConfig, err error)</a>

```
searchKey: confdb.SiteCreateIfUpToDate
tags: [method]
```

```Go
func SiteCreateIfUpToDate(ctx context.Context, lastID *int32, contents string) (latest *SiteConfig, err error)
```

SiteCreateIfUpToDate saves the given site config "contents" to the database iff the supplied "lastID" is equal to the one that was most recently saved to the database. 

The site config that was most recently saved to the database is returned. An error is returned if "contents" is invalid JSON. 

🚨 SECURITY: This method does NOT verify the user is an admin. The caller is responsible for ensuring this or that the response never makes it to a user. 

#### <a id="SiteGetLatest" href="#SiteGetLatest">func SiteGetLatest(ctx context.Context) (latest *SiteConfig, err error)</a>

```
searchKey: confdb.SiteGetLatest
tags: [method]
```

```Go
func SiteGetLatest(ctx context.Context) (latest *SiteConfig, err error)
```

SiteGetLatest returns the site config that was most recently saved to the database. This returns nil, nil if there is not yet a site config in the database. 

🚨 SECURITY: This method does NOT verify the user is an admin. The caller is responsible for ensuring this or that the response never makes it to a user. 

#### <a id="createIfUpToDate" href="#createIfUpToDate">func createIfUpToDate(ctx context.Context, tx queryable, lastID *int32, contents string) (latest *SiteConfig, err error)</a>

```
searchKey: confdb.createIfUpToDate
tags: [method private]
```

```Go
func createIfUpToDate(ctx context.Context, tx queryable, lastID *int32, contents string) (latest *SiteConfig, err error)
```

#### <a id="getLatest" href="#getLatest">func getLatest(ctx context.Context, tx queryable) (*SiteConfig, error)</a>

```
searchKey: confdb.getLatest
tags: [method private]
```

```Go
func getLatest(ctx context.Context, tx queryable) (*SiteConfig, error)
```

### <a id="queryable" href="#queryable">type queryable interface</a>

```
searchKey: confdb.queryable
tags: [interface private]
```

```Go
type queryable interface {
	QueryContext(ctx context.Context, query string, args ...interface{}) (*sql.Rows, error)
	QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row
}
```

queryable allows us to reuse the same logic for certain operations both inside and outside an explicit transaction. 

#### <a id="newTransaction" href="#newTransaction">func newTransaction(ctx context.Context) (tx queryable, done func(), err error)</a>

```
searchKey: confdb.newTransaction
tags: [method private]
```

```Go
func newTransaction(ctx context.Context) (tx queryable, done func(), err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestSiteCreateIfUpToDate" href="#TestSiteCreateIfUpToDate">func TestSiteCreateIfUpToDate(t *testing.T)</a>

```
searchKey: confdb.TestSiteCreateIfUpToDate
tags: [method private test]
```

```Go
func TestSiteCreateIfUpToDate(t *testing.T)
```

### <a id="TestSiteCreate_RejectInvalidJSON" href="#TestSiteCreate_RejectInvalidJSON">func TestSiteCreate_RejectInvalidJSON(t *testing.T)</a>

```
searchKey: confdb.TestSiteCreate_RejectInvalidJSON
tags: [method private test]
```

```Go
func TestSiteCreate_RejectInvalidJSON(t *testing.T)
```

### <a id="TestSiteGetLatestDefault" href="#TestSiteGetLatestDefault">func TestSiteGetLatestDefault(t *testing.T)</a>

```
searchKey: confdb.TestSiteGetLatestDefault
tags: [method private test]
```

```Go
func TestSiteGetLatestDefault(t *testing.T)
```

### <a id="addDefault" href="#addDefault">func addDefault(ctx context.Context, tx queryable, contents string) (newLastID *int32, err error)</a>

```
searchKey: confdb.addDefault
tags: [method private]
```

```Go
func addDefault(ctx context.Context, tx queryable, contents string) (newLastID *int32, err error)
```

### <a id="init.db_test.go" href="#init.db_test.go">func init()</a>

```
searchKey: confdb.init
tags: [function private]
```

```Go
func init()
```

### <a id="parseQueryRows" href="#parseQueryRows">func parseQueryRows(ctx context.Context, rows *sql.Rows) ([]*SiteConfig, error)</a>

```
searchKey: confdb.parseQueryRows
tags: [method private]
```

```Go
func parseQueryRows(ctx context.Context, rows *sql.Rows) ([]*SiteConfig, error)
```

