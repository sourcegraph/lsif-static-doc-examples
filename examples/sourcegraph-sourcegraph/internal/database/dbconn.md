# Package dbconn

Package dbconn provides functionality to connect to our DB and migrate it. 

Most services should connect to the frontend for DB access instead, using api.InternalClient. 

## Index

* [Constants](#const)
    * [const bulkInsertionKey](#bulkInsertionKey)
* [Variables](#var)
    * [var Global](#Global)
    * [var defaultDataSource](#defaultDataSource)
    * [var defaultApplicationName](#defaultApplicationName)
    * [var versionPattern](#versionPattern)
    * [var startupTimeout](#startupTimeout)
    * [var registerOnce](#registerOnce)
    * [var postgresBulkInsertRowsPattern](#postgresBulkInsertRowsPattern)
    * [var postgresBulkInsertRowsReplacement](#postgresBulkInsertRowsReplacement)
    * [var Frontend](#Frontend)
    * [var CodeIntel](#CodeIntel)
    * [var CodeInsights](#CodeInsights)
* [Types](#type)
    * [type key int](#key)
    * [type hook struct{}](#hook)
        * [func (h *hook) Before(ctx context.Context, query string, args ...interface{}) (context.Context, error)](#hook.Before)
        * [func (h *hook) After(ctx context.Context, query string, args ...interface{}) (context.Context, error)](#hook.After)
        * [func (h *hook) OnError(ctx context.Context, err error, query string, args ...interface{}) error](#hook.OnError)
    * [type Database struct](#Database)
    * [type stdoutLogger struct{}](#stdoutLogger)
        * [func (stdoutLogger) Printf(format string, v ...interface{})](#stdoutLogger.Printf)
        * [func (logger stdoutLogger) Verbose() bool](#stdoutLogger.Verbose)
* [Functions](#func)
    * [func SetupGlobalConnection(dataSource string) (err error)](#SetupGlobalConnection)
    * [func New(dataSource, dbNameSuffix string) (*sql.DB, error)](#New)
    * [func NewRaw(dataSource string) (*sql.DB, error)](#NewRaw)
    * [func checkVersion(db *sql.DB) error](#checkVersion)
    * [func buildConfig(dataSource string) (*pgx.ConnConfig, error)](#buildConfig)
    * [func openDBWithStartupWait(cfg *pgx.ConnConfig) (db *sql.DB, err error)](#openDBWithStartupWait)
    * [func isDatabaseLikelyStartingUp(err error) bool](#isDatabaseLikelyStartingUp)
    * [func Open(dataSource string) (*sql.DB, error)](#Open)
    * [func open(cfg *pgx.ConnConfig) (*sql.DB, error)](#open)
    * [func Ping(ctx context.Context) error](#Ping)
    * [func BulkInsertion(ctx context.Context) bool](#BulkInsertion)
    * [func WithBulkInsertion(ctx context.Context, bulkInsertion bool) context.Context](#WithBulkInsertion)
    * [func registerPrometheusCollector(db *sql.DB, dbNameSuffix string)](#registerPrometheusCollector)
    * [func configureConnectionPool(db *sql.DB)](#configureConnectionPool)
    * [func MigrateDB(db *sql.DB, database *Database) error](#MigrateDB)
    * [func NewMigrate(db *sql.DB, database *Database) (*migrate.Migrate, error)](#NewMigrate)
    * [func DoMigrate(m *migrate.Migrate) (err error)](#DoMigrate)
    * [func TestBuildConfig(t *testing.T)](#TestBuildConfig)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="bulkInsertionKey" href="#bulkInsertionKey">const bulkInsertionKey</a>

```
searchKey: dbconn.bulkInsertionKey
tags: [private]
```

```Go
const bulkInsertionKey key = iota
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Global" href="#Global">var Global</a>

```
searchKey: dbconn.Global
```

```Go
var Global *sql.DB
```

Global is the global DB connection. Only use this after a call to SetupGlobalConnection. 

### <a id="defaultDataSource" href="#defaultDataSource">var defaultDataSource</a>

```
searchKey: dbconn.defaultDataSource
tags: [private]
```

```Go
var defaultDataSource = ...
```

### <a id="defaultApplicationName" href="#defaultApplicationName">var defaultApplicationName</a>

```
searchKey: dbconn.defaultApplicationName
tags: [private]
```

```Go
var defaultApplicationName = ...
```

### <a id="versionPattern" href="#versionPattern">var versionPattern</a>

```
searchKey: dbconn.versionPattern
tags: [private]
```

```Go
var versionPattern = lazyregexp.New(`^PostgreSQL (\d+)\.`)
```

### <a id="startupTimeout" href="#startupTimeout">var startupTimeout</a>

```
searchKey: dbconn.startupTimeout
tags: [private]
```

```Go
var startupTimeout = ...
```

### <a id="registerOnce" href="#registerOnce">var registerOnce</a>

```
searchKey: dbconn.registerOnce
tags: [private]
```

```Go
var registerOnce sync.Once
```

### <a id="postgresBulkInsertRowsPattern" href="#postgresBulkInsertRowsPattern">var postgresBulkInsertRowsPattern</a>

```
searchKey: dbconn.postgresBulkInsertRowsPattern
tags: [private]
```

```Go
var postgresBulkInsertRowsPattern = lazyregexp.New(`(\([$\d,\s]+\)[,\s]*)+`)
```

postgresBulkInsertRowsPattern matches `($1, $2, $3), ($4, $5, $6), ...` which we use to cut out the row payloads from bulk insertion tracing data. We don't need all the parameter data for such requests, which are too big to fit into Jaeger spans. Note that we don't just capture `($1.*`, as we want queries with a trailing ON CONFLICT clause not to be semantically mangled in the log output. 

### <a id="postgresBulkInsertRowsReplacement" href="#postgresBulkInsertRowsReplacement">var postgresBulkInsertRowsReplacement</a>

```
searchKey: dbconn.postgresBulkInsertRowsReplacement
tags: [private]
```

```Go
var postgresBulkInsertRowsReplacement = []byte("(...) ")
```

postgresBulkInsertRowsReplacement replaces the all-placeholder rows matched by the pattern defined above. 

### <a id="Frontend" href="#Frontend">var Frontend</a>

```
searchKey: dbconn.Frontend
```

```Go
var Frontend = ...
```

### <a id="CodeIntel" href="#CodeIntel">var CodeIntel</a>

```
searchKey: dbconn.CodeIntel
```

```Go
var CodeIntel = ...
```

### <a id="CodeInsights" href="#CodeInsights">var CodeInsights</a>

```
searchKey: dbconn.CodeInsights
```

```Go
var CodeInsights = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="key" href="#key">type key int</a>

```
searchKey: dbconn.key
tags: [private]
```

```Go
type key int
```

### <a id="hook" href="#hook">type hook struct{}</a>

```
searchKey: dbconn.hook
tags: [private]
```

```Go
type hook struct{}
```

#### <a id="hook.Before" href="#hook.Before">func (h *hook) Before(ctx context.Context, query string, args ...interface{}) (context.Context, error)</a>

```
searchKey: dbconn.hook.Before
tags: [private]
```

```Go
func (h *hook) Before(ctx context.Context, query string, args ...interface{}) (context.Context, error)
```

Before implements sqlhooks.Hooks 

#### <a id="hook.After" href="#hook.After">func (h *hook) After(ctx context.Context, query string, args ...interface{}) (context.Context, error)</a>

```
searchKey: dbconn.hook.After
tags: [private]
```

```Go
func (h *hook) After(ctx context.Context, query string, args ...interface{}) (context.Context, error)
```

After implements sqlhooks.Hooks 

#### <a id="hook.OnError" href="#hook.OnError">func (h *hook) OnError(ctx context.Context, err error, query string, args ...interface{}) error</a>

```
searchKey: dbconn.hook.OnError
tags: [private]
```

```Go
func (h *hook) OnError(ctx context.Context, err error, query string, args ...interface{}) error
```

After implements sqlhooks.OnErroer 

### <a id="Database" href="#Database">type Database struct</a>

```
searchKey: dbconn.Database
```

```Go
type Database struct {
	// Name is the name of the database.
	Name string

	// MigrationsTable is the migrations SQL table name.
	MigrationsTable string

	// FS describes the raw migration assets to run to migrate the target schema to a new
	// version.
	FS fs.FS

	// TargetsTimescaleDB indicates if the database targets TimescaleDB. Otherwise, Postgres.
	TargetsTimescaleDB bool
}
```

Database describes one of our Postgres (or Postgres-like) databases. 

### <a id="stdoutLogger" href="#stdoutLogger">type stdoutLogger struct{}</a>

```
searchKey: dbconn.stdoutLogger
tags: [private]
```

```Go
type stdoutLogger struct{}
```

#### <a id="stdoutLogger.Printf" href="#stdoutLogger.Printf">func (stdoutLogger) Printf(format string, v ...interface{})</a>

```
searchKey: dbconn.stdoutLogger.Printf
tags: [private]
```

```Go
func (stdoutLogger) Printf(format string, v ...interface{})
```

#### <a id="stdoutLogger.Verbose" href="#stdoutLogger.Verbose">func (logger stdoutLogger) Verbose() bool</a>

```
searchKey: dbconn.stdoutLogger.Verbose
tags: [private]
```

```Go
func (logger stdoutLogger) Verbose() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="SetupGlobalConnection" href="#SetupGlobalConnection">func SetupGlobalConnection(dataSource string) (err error)</a>

```
searchKey: dbconn.SetupGlobalConnection
```

```Go
func SetupGlobalConnection(dataSource string) (err error)
```

SetupGlobalConnection connects to the given data source and stores the handle globally. 

Note: github.com/jackc/pgx parses the environment as well. This function will also use the value of PGDATASOURCE if supplied and dataSource is the empty string. 

### <a id="New" href="#New">func New(dataSource, dbNameSuffix string) (*sql.DB, error)</a>

```
searchKey: dbconn.New
```

```Go
func New(dataSource, dbNameSuffix string) (*sql.DB, error)
```

New connects to the given data source and returns the handle. 

Note: github.com/jackc/pgx parses the environment as well. This function will also use the value of PGDATASOURCE if supplied and dataSource is the empty string. 

### <a id="NewRaw" href="#NewRaw">func NewRaw(dataSource string) (*sql.DB, error)</a>

```
searchKey: dbconn.NewRaw
```

```Go
func NewRaw(dataSource string) (*sql.DB, error)
```

NewRaw connects to the given data source and returns the handle. 

Prefer to call New as it also configures a connection pool and metrics. Use this method only in internal utilities (such as schemadoc). 

### <a id="checkVersion" href="#checkVersion">func checkVersion(db *sql.DB) error</a>

```
searchKey: dbconn.checkVersion
tags: [private]
```

```Go
func checkVersion(db *sql.DB) error
```

### <a id="buildConfig" href="#buildConfig">func buildConfig(dataSource string) (*pgx.ConnConfig, error)</a>

```
searchKey: dbconn.buildConfig
tags: [private]
```

```Go
func buildConfig(dataSource string) (*pgx.ConnConfig, error)
```

buildConfig takes either a Postgres connection string or connection URI, parses it, and returns a config with additional parameters. 

### <a id="openDBWithStartupWait" href="#openDBWithStartupWait">func openDBWithStartupWait(cfg *pgx.ConnConfig) (db *sql.DB, err error)</a>

```
searchKey: dbconn.openDBWithStartupWait
tags: [private]
```

```Go
func openDBWithStartupWait(cfg *pgx.ConnConfig) (db *sql.DB, err error)
```

### <a id="isDatabaseLikelyStartingUp" href="#isDatabaseLikelyStartingUp">func isDatabaseLikelyStartingUp(err error) bool</a>

```
searchKey: dbconn.isDatabaseLikelyStartingUp
tags: [private]
```

```Go
func isDatabaseLikelyStartingUp(err error) bool
```

isDatabaseLikelyStartingUp returns whether the err likely just means the PostgreSQL database is starting up, and it should not be treated as a fatal error during program initialization. 

### <a id="Open" href="#Open">func Open(dataSource string) (*sql.DB, error)</a>

```
searchKey: dbconn.Open
```

```Go
func Open(dataSource string) (*sql.DB, error)
```

Open creates a new DB handle with the given schema by connecting to the database identified by dataSource (e.g., "dbname=mypgdb" or blank to use the PG* env vars). 

Open assumes that the database already exists. 

### <a id="open" href="#open">func open(cfg *pgx.ConnConfig) (*sql.DB, error)</a>

```
searchKey: dbconn.open
tags: [private]
```

```Go
func open(cfg *pgx.ConnConfig) (*sql.DB, error)
```

### <a id="Ping" href="#Ping">func Ping(ctx context.Context) error</a>

```
searchKey: dbconn.Ping
```

```Go
func Ping(ctx context.Context) error
```

Ping attempts to contact the database and returns a non-nil error upon failure. It is intended to be used by health checks. 

### <a id="BulkInsertion" href="#BulkInsertion">func BulkInsertion(ctx context.Context) bool</a>

```
searchKey: dbconn.BulkInsertion
```

```Go
func BulkInsertion(ctx context.Context) bool
```

BulkInsertion returns true if the bulkInsertionKey context value is true. 

### <a id="WithBulkInsertion" href="#WithBulkInsertion">func WithBulkInsertion(ctx context.Context, bulkInsertion bool) context.Context</a>

```
searchKey: dbconn.WithBulkInsertion
```

```Go
func WithBulkInsertion(ctx context.Context, bulkInsertion bool) context.Context
```

WithBulkInsertion sets the bulkInsertionKey context value. 

### <a id="registerPrometheusCollector" href="#registerPrometheusCollector">func registerPrometheusCollector(db *sql.DB, dbNameSuffix string)</a>

```
searchKey: dbconn.registerPrometheusCollector
tags: [private]
```

```Go
func registerPrometheusCollector(db *sql.DB, dbNameSuffix string)
```

### <a id="configureConnectionPool" href="#configureConnectionPool">func configureConnectionPool(db *sql.DB)</a>

```
searchKey: dbconn.configureConnectionPool
tags: [private]
```

```Go
func configureConnectionPool(db *sql.DB)
```

configureConnectionPool sets reasonable sizes on the built in DB queue. By default the connection pool is unbounded, which leads to the error `pq: sorry too many clients already`. 

### <a id="MigrateDB" href="#MigrateDB">func MigrateDB(db *sql.DB, database *Database) error</a>

```
searchKey: dbconn.MigrateDB
```

```Go
func MigrateDB(db *sql.DB, database *Database) error
```

### <a id="NewMigrate" href="#NewMigrate">func NewMigrate(db *sql.DB, database *Database) (*migrate.Migrate, error)</a>

```
searchKey: dbconn.NewMigrate
```

```Go
func NewMigrate(db *sql.DB, database *Database) (*migrate.Migrate, error)
```

NewMigrate returns a new configured migration object for the given database. The migration can be subsequently run by invoking `dbconn.DoMigrate`. 

### <a id="DoMigrate" href="#DoMigrate">func DoMigrate(m *migrate.Migrate) (err error)</a>

```
searchKey: dbconn.DoMigrate
```

```Go
func DoMigrate(m *migrate.Migrate) (err error)
```

DoMigrate runs all up migrations. 

### <a id="TestBuildConfig" href="#TestBuildConfig">func TestBuildConfig(t *testing.T)</a>

```
searchKey: dbconn.TestBuildConfig
tags: [private]
```

```Go
func TestBuildConfig(t *testing.T)
```

