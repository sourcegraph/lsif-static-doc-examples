# Package shared

## Index

* [Constants](#const)
    * [const port](#port)
* [Variables](#var)
    * [var stateHTMLTemplate](#stateHTMLTemplate)
* [Types](#type)
    * [type EnterpriseInit func(db *database/sql.DB, store *github.com/sourcegraph/sourcegraph/internal/repos.Store, keyring github.com/sourcegraph/sourcegraph/internal/encryption/keyring.Ring, cf *github.com/sourcegraph/sourcegraph/internal/httpcli.Factory, server *github.com/sourcegraph/sourcegraph/cmd/repo-updater/repoupdater.Server) []github.com/sourcegraph/sourcegraph/internal/debugserver.Dumper](#EnterpriseInit)
    * [type scheduler interface](#scheduler)
* [Functions](#func)
    * [func Main(enterpriseInit EnterpriseInit)](#Main)
    * [func syncScheduler(ctx context.Context, sched scheduler, gitserverClient *gitserver.Client, store *repos.Store)](#syncScheduler)
    * [func watchSyncer(ctx context.Context, syncer *repos.Syncer, sched scheduler, gps *repos.GitolitePhabricatorMetadataSyncer)](#watchSyncer)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="port" href="#port">const port</a>

```
searchKey: shared.port
tags: [constant string private]
```

```Go
const port = "3182"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="stateHTMLTemplate" href="#stateHTMLTemplate">var stateHTMLTemplate</a>

```
searchKey: shared.stateHTMLTemplate
tags: [variable string private]
```

```Go
var stateHTMLTemplate string
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="EnterpriseInit" href="#EnterpriseInit">type EnterpriseInit func(db *database/sql.DB, store *github.com/sourcegraph/sourcegraph/internal/repos.Store, keyring github.com/sourcegraph/sourcegraph/internal/encryption/keyring.Ring, cf *github.com/sourcegraph/sourcegraph/internal/httpcli.Factory, server *github.com/sourcegraph/sourcegraph/cmd/repo-updater/repoupdater.Server) []github.com/sourcegraph/sourcegraph/internal/debugserver.Dumper</a>

```
searchKey: shared.EnterpriseInit
tags: [function]
```

```Go
type EnterpriseInit func(db *sql.DB, store *repos.Store, keyring keyring.Ring, cf *httpcli.Factory, server *repoupdater.Server) []debugserver.Dumper
```

EnterpriseInit is a function that allows enterprise code to be triggered when dependencies created in Main are ready for use. 

### <a id="scheduler" href="#scheduler">type scheduler interface</a>

```
searchKey: shared.scheduler
tags: [interface private]
```

```Go
type scheduler interface {
	// UpdateFromDiff updates the scheduled and queued repos from the given sync diff.
	UpdateFromDiff(repos.Diff)

	// SetCloned ensures uncloned repos are given priority in the scheduler.
	SetCloned([]string)

	// EnsureScheduled ensures that all the repos provided are known to the scheduler
	EnsureScheduled([]types.RepoName)
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="Main" href="#Main">func Main(enterpriseInit EnterpriseInit)</a>

```
searchKey: shared.Main
tags: [method]
```

```Go
func Main(enterpriseInit EnterpriseInit)
```

### <a id="syncScheduler" href="#syncScheduler">func syncScheduler(ctx context.Context, sched scheduler, gitserverClient *gitserver.Client, store *repos.Store)</a>

```
searchKey: shared.syncScheduler
tags: [method private]
```

```Go
func syncScheduler(ctx context.Context, sched scheduler, gitserverClient *gitserver.Client, store *repos.Store)
```

syncScheduler will periodically list the cloned repositories on gitserver and update the scheduler with the list. It also ensures that if any of our default repos are missing from the cloned list they will be added for cloning ASAP. 

### <a id="watchSyncer" href="#watchSyncer">func watchSyncer(ctx context.Context, syncer *repos.Syncer, sched scheduler, gps *repos.GitolitePhabricatorMetadataSyncer)</a>

```
searchKey: shared.watchSyncer
tags: [method private]
```

```Go
func watchSyncer(ctx context.Context, syncer *repos.Syncer, sched scheduler, gps *repos.GitolitePhabricatorMetadataSyncer)
```

