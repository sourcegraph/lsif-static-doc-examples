# Package main

## Index

* Subpages
  * [enterprise/cmd/worker/internal](worker/internal.md)
* [Functions](#func)
    * [func main()](#main)
    * [func setAuthzProviders()](#setAuthzProviders)


## <a id="func" href="#func">Functions</a>

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [private]
```

```Go
func main()
```

### <a id="setAuthzProviders" href="#setAuthzProviders">func setAuthzProviders()</a>

```
searchKey: main.setAuthzProviders
tags: [private]
```

```Go
func setAuthzProviders()
```

setAuthProviders waits for the database to be initialized, then periodically refreshes the global authz providers. This changes the repositories that are visible for reads based on the current actor stored in an operation's context, which is likely an internal actor for many of the jobs configured in this service. This also enables repository update operations to fetch permissions from code hosts. 

