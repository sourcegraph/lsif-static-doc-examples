# Package codeintel

## Index

* Subpages
  * [enterprise/cmd/frontend/internal/codeintel/httpapi](codeintel/httpapi.md)
  * [enterprise/cmd/frontend/internal/codeintel/resolvers](codeintel/resolvers.md)
* [Variables](#var)
    * [var config](#config)
    * [var services](#services)
    * [var once](#once)
* [Types](#type)
    * [type Config struct](#Config)
* [Functions](#func)
    * [func init()](#init)
    * [func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error](#Init)
    * [func newResolver(ctx context.Context, db dbutil.DB, observationContext *observation.Context) (gql.CodeIntelResolver, error)](#newResolver)
    * [func newUploadHandler(ctx context.Context, db dbutil.DB) (func(internal bool) http.Handler, error)](#newUploadHandler)
    * [func registerMigrations(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) error](#registerMigrations)
    * [func initServices(ctx context.Context, db dbutil.DB) error](#initServices)
    * [func mustInitializeCodeIntelDB() *sql.DB](#mustInitializeCodeIntelDB)
    * [func NewCodeIntelUploadHandler(ctx context.Context, db dbutil.DB, internal bool) (http.Handler, error)](#NewCodeIntelUploadHandler)


## <a id="var" href="#var">Variables</a>

### <a id="config" href="#config">var config</a>

```
searchKey: codeintel.config
```

```Go
var config = &Config{}
```

### <a id="services" href="#services">var services</a>

```
searchKey: codeintel.services
```

```Go
var services struct {
	dbStore         *store.Store
	locker          *locker.Locker
	lsifStore       *lsifstore.Store
	uploadStore     uploadstore.Store
	gitserverClient *gitserver.Client
	indexEnqueuer   *enqueuer.IndexEnqueuer
	err             error
} = ...
```

### <a id="once" href="#once">var once</a>

```
searchKey: codeintel.once
```

```Go
var once sync.Once
```

## <a id="type" href="#type">Types</a>

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: codeintel.Config
tags: [exported]
```

```Go
type Config struct {
	env.BaseConfig

	UploadStoreConfig                         *uploadstore.Config
	HunkCacheSize                             int
	DiagnosticsCountMigrationBatchSize        int
	DiagnosticsCountMigrationBatchInterval    time.Duration
	DefinitionsCountMigrationBatchSize        int
	DefinitionsCountMigrationBatchInterval    time.Duration
	ReferencesCountMigrationBatchSize         int
	ReferencesCountMigrationBatchInterval     time.Duration
	DocumentColumnSplitMigrationBatchSize     int
	DocumentColumnSplitMigrationBatchInterval time.Duration
	CommittedAtMigrationBatchSize             int
	CommittedAtMigrationBatchInterval         time.Duration
}
```

## <a id="func" href="#func">Functions</a>

### <a id="init" href="#init">func init()</a>

```
searchKey: codeintel.init
```

```Go
func init()
```

### <a id="Init" href="#Init">func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error</a>

```
searchKey: codeintel.Init
tags: [exported]
```

```Go
func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error
```

### <a id="newResolver" href="#newResolver">func newResolver(ctx context.Context, db dbutil.DB, observationContext *observation.Context) (gql.CodeIntelResolver, error)</a>

```
searchKey: codeintel.newResolver
```

```Go
func newResolver(ctx context.Context, db dbutil.DB, observationContext *observation.Context) (gql.CodeIntelResolver, error)
```

### <a id="newUploadHandler" href="#newUploadHandler">func newUploadHandler(ctx context.Context, db dbutil.DB) (func(internal bool) http.Handler, error)</a>

```
searchKey: codeintel.newUploadHandler
```

```Go
func newUploadHandler(ctx context.Context, db dbutil.DB) (func(internal bool) http.Handler, error)
```

### <a id="registerMigrations" href="#registerMigrations">func registerMigrations(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) error</a>

```
searchKey: codeintel.registerMigrations
```

```Go
func registerMigrations(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) error
```

registerMigrations registers all out-of-band migration instances that should run for the current version of Sourcegraph. 

### <a id="initServices" href="#initServices">func initServices(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: codeintel.initServices
```

```Go
func initServices(ctx context.Context, db dbutil.DB) error
```

### <a id="mustInitializeCodeIntelDB" href="#mustInitializeCodeIntelDB">func mustInitializeCodeIntelDB() *sql.DB</a>

```
searchKey: codeintel.mustInitializeCodeIntelDB
```

```Go
func mustInitializeCodeIntelDB() *sql.DB
```

### <a id="NewCodeIntelUploadHandler" href="#NewCodeIntelUploadHandler">func NewCodeIntelUploadHandler(ctx context.Context, db dbutil.DB, internal bool) (http.Handler, error)</a>

```
searchKey: codeintel.NewCodeIntelUploadHandler
tags: [exported]
```

```Go
func NewCodeIntelUploadHandler(ctx context.Context, db dbutil.DB, internal bool) (http.Handler, error)
```

NewCodeIntelUploadHandler creates a new code intel LSIF upload HTTP handler. This is used by both the enterprise frontend codeintel init code to install handlers in the frontend API as well as the the enterprise frontend executor init code to install handlers in the proxy. 

