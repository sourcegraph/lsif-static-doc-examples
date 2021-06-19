# Package main

Command frontend contains the enterprise frontend implementation. 

It wraps the open source frontend command and merely injects a few proprietary things into it via e.g. blank/underscore imports in this file which register side effects with the frontend package. 

## Index

* Subpages
  * [enterprise/cmd/frontend/internal](frontend/internal.md)
* [Variables](#var)
    * [var initFunctions](#initFunctions)
* [Functions](#func)
    * [func main()](#main)
    * [func init()](#init)
    * [func enterpriseSetupHook(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services](#enterpriseSetupHook)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="initFunctions" href="#initFunctions">var initFunctions</a>

```
searchKey: main.initFunctions
```

```Go
var initFunctions = ...
```

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

### <a id="init" href="#init">func init()</a>

```
searchKey: main.init
```

```Go
func init()
```

### <a id="enterpriseSetupHook" href="#enterpriseSetupHook">func enterpriseSetupHook(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services</a>

```
searchKey: main.enterpriseSetupHook
```

```Go
func enterpriseSetupHook(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services
```

