# Package batches

This package is the main root for all our code. It is meant to be the only batch changes enterprise package to be used outside this folder. 

## Index

* Subpages
  * [enterprise/internal/batches/background](batches/background.md)
  * [enterprise/internal/batches/global](batches/global.md)
  * [enterprise/internal/batches/reconciler](batches/reconciler.md)
  * [enterprise/internal/batches/resolvers](batches/resolvers.md)
  * [enterprise/internal/batches/rewirer](batches/rewirer.md)
  * [enterprise/internal/batches/scheduler](batches/scheduler.md)
  * [enterprise/internal/batches/search](batches/search.md)
  * [enterprise/internal/batches/service](batches/service.md)
  * [enterprise/internal/batches/sources](batches/sources.md)
  * [enterprise/internal/batches/state](batches/state.md)
  * [enterprise/internal/batches/store](batches/store.md)
  * [enterprise/internal/batches/syncer](batches/syncer.md)
  * [enterprise/internal/batches/testing](batches/testing.md)
  * [enterprise/internal/batches/types](batches/types.md)
  * [enterprise/internal/batches/webhooks](batches/webhooks.md)
* [Functions](#func)
    * [func InitBackgroundJobs(ctx context.Context,...](#InitBackgroundJobs)
    * [func InitFrontend(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error](#InitFrontend)


## <a id="func" href="#func">Functions</a>

### <a id="InitBackgroundJobs" href="#InitBackgroundJobs">func InitBackgroundJobs(ctx context.Context,...</a>

```
searchKey: batches.InitBackgroundJobs
tags: [exported]
```

```Go
func InitBackgroundJobs(
	ctx context.Context,
	db dbutil.DB,
	key encryption.Key,
	cf *httpcli.Factory,
) interface {
	// EnqueueChangesetSyncs will queue the supplied changesets to sync ASAP.
	EnqueueChangesetSyncs(ctx context.Context, ids []int64) error
	// HandleExternalServiceSync should be called when an external service changes so that
	// the registry can start or stop the syncer associated with the service
	HandleExternalServiceSync(es api.ExternalService)
}
```

InitBackgroundJobs starts all jobs required to run batches. Currently, it is called from repo-updater and in the future will be the main entry point for the batch changes worker. 

### <a id="InitFrontend" href="#InitFrontend">func InitFrontend(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error</a>

```
searchKey: batches.InitFrontend
tags: [exported]
```

```Go
func InitFrontend(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error
```

InitFrontend initializes the given enterpriseServices to include the required resolvers for batch changes and sets up webhook handlers for changeset events. 

