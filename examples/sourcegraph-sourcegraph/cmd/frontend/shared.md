# Package shared

Package shared contains the frontend command implementation shared 

## Index

* [Functions](#func)
    * [func Main(enterpriseSetupHook func(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services)](#Main)


## <a id="func" href="#func">Functions</a>

### <a id="Main" href="#Main">func Main(enterpriseSetupHook func(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services)</a>

```
searchKey: shared.Main
tags: [function]
```

```Go
func Main(enterpriseSetupHook func(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services)
```

Main is the main function that runs the frontend process. 

It is exposed as function in a package so that it can be called by other main package implementations such as Sourcegraph Enterprise, which import proprietary/private code. 

