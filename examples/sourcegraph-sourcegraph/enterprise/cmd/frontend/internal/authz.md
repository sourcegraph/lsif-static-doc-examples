# Package authz

## Index

* Subpages
  * [enterprise/cmd/frontend/internal/authz/resolvers](authz/resolvers.md)
* [Variables](#var)
    * [var clock](#clock)
* [Functions](#func)
    * [func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error](#Init)
    * [func init()](#init)


## <a id="var" href="#var">Variables</a>

### <a id="clock" href="#clock">var clock</a>

```
searchKey: authz.clock
```

```Go
var clock = timeutil.Now
```

## <a id="func" href="#func">Functions</a>

### <a id="Init" href="#Init">func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error</a>

```
searchKey: authz.Init
tags: [exported]
```

```Go
func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error
```

### <a id="init" href="#init">func init()</a>

```
searchKey: authz.init
```

```Go
func init()
```

