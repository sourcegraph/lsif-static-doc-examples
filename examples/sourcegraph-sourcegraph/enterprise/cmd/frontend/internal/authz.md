# Package authz

## Index

* Subpages
  * [enterprise/cmd/frontend/internal/authz/resolvers](authz/resolvers.md)
* [Variables](#var)
    * [var clock](#clock)
* [Functions](#func)
    * [func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error](#Init)
    * [func init()](#init.init.go)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="clock" href="#clock">var clock</a>

```
searchKey: authz.clock
tags: [variable function private]
```

```Go
var clock = timeutil.Now
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Init" href="#Init">func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error</a>

```
searchKey: authz.Init
tags: [function]
```

```Go
func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error
```

### <a id="init.init.go" href="#init.init.go">func init()</a>

```
searchKey: authz.init
tags: [function private]
```

```Go
func init()
```

