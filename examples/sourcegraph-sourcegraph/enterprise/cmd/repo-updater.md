# Package main

## Index

* Subpages
  * [enterprise/cmd/repo-updater/internal](repo-updater/internal.md)
* [Functions](#func)
    * [func main()](#main)
    * [func enterpriseInit(db *sql.DB,...](#enterpriseInit)
    * [func startBackgroundPermsSync(ctx context.Context, syncer *authz.PermsSyncer, db dbutil.DB)](#startBackgroundPermsSync)


## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

### <a id="enterpriseInit" href="#enterpriseInit">func enterpriseInit(db *sql.DB,...</a>

```
searchKey: main.enterpriseInit
```

```Go
func enterpriseInit(
	db *sql.DB,
	repoStore *repos.Store,
	keyring keyring.Ring,
	cf *httpcli.Factory,
	server *repoupdater.Server,
) (debugDumpers []debugserver.Dumper)
```

### <a id="startBackgroundPermsSync" href="#startBackgroundPermsSync">func startBackgroundPermsSync(ctx context.Context, syncer *authz.PermsSyncer, db dbutil.DB)</a>

```
searchKey: main.startBackgroundPermsSync
```

```Go
func startBackgroundPermsSync(ctx context.Context, syncer *authz.PermsSyncer, db dbutil.DB)
```

startBackgroundPermsSync sets up background permissions syncing. 

