# Package insights

## Index

* Subpages
  * [enterprise/internal/insights/background](insights/background.md)
  * [enterprise/internal/insights/compression](insights/compression.md)
  * [enterprise/internal/insights/dbtesting](insights/dbtesting.md)
  * [enterprise/internal/insights/discovery](insights/discovery.md)
  * [enterprise/internal/insights/resolvers](insights/resolvers.md)
  * [enterprise/internal/insights/store](insights/store.md)
* [Functions](#func)
    * [func IsEnabled() bool](#IsEnabled)
    * [func Init(ctx context.Context, postgres dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error](#Init)
    * [func InitializeCodeInsightsDB() (*sql.DB, error)](#InitializeCodeInsightsDB)


## <a id="func" href="#func">Functions</a>

### <a id="IsEnabled" href="#IsEnabled">func IsEnabled() bool</a>

```
searchKey: insights.IsEnabled
tags: [exported]
```

```Go
func IsEnabled() bool
```

IsEnabled tells if code insights are enabled or not. 

### <a id="Init" href="#Init">func Init(ctx context.Context, postgres dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error</a>

```
searchKey: insights.Init
tags: [exported]
```

```Go
func Init(ctx context.Context, postgres dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error
```

Init initializes the given enterpriseServices to include the required resolvers for insights. 

### <a id="InitializeCodeInsightsDB" href="#InitializeCodeInsightsDB">func InitializeCodeInsightsDB() (*sql.DB, error)</a>

```
searchKey: insights.InitializeCodeInsightsDB
tags: [exported]
```

```Go
func InitializeCodeInsightsDB() (*sql.DB, error)
```

InitializeCodeInsightsDB connects to and initializes the Code Insights Timescale DB, running database migrations before returning. It is safe to call from multiple services/containers (in which case, one's migration will win and the other caller will receive an error and should exit and restart until the other finishes.) 

