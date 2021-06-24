# Package main

Command frontend contains the enterprise frontend implementation. 

It wraps the open source frontend command and merely injects a few proprietary things into it via e.g. blank/underscore imports in this file which register side effects with the frontend package. 

## Index

* Subpages
  * [enterprise/cmd/frontend/internal](frontend/internal.md)
* [Variables](#var)
    * [var initFunctions](#initFunctions)
* [Functions](#func)
    * [func enterpriseSetupHook(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services](#enterpriseSetupHook)
    * [func init()](#init.main.go)
    * [func main()](#main)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="initFunctions" href="#initFunctions">var initFunctions</a>

```
searchKey: main.initFunctions
tags: [variable object private]
```

```Go
var initFunctions = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="enterpriseSetupHook" href="#enterpriseSetupHook">func enterpriseSetupHook(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services</a>

```
searchKey: main.enterpriseSetupHook
tags: [method private]
```

```Go
func enterpriseSetupHook(db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner) enterprise.Services
```

### <a id="init.main.go" href="#init.main.go">func init()</a>

```
searchKey: main.init
tags: [function private]
```

```Go
func init()
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

