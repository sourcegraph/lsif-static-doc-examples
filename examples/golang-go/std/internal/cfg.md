# Package cfg

Package cfg holds configuration shared by the Go command and internal/testenv. Definitions that don't need to be exposed outside of cmd/go should be in cmd/go/internal/cfg instead of this package. 

## Index

* [Constants](#const)
    * [const KnownEnv](#KnownEnv)


## <a id="const" href="#const">Constants</a>

### <a id="KnownEnv" href="#KnownEnv">const KnownEnv</a>

```
searchKey: cfg.KnownEnv
tags: [exported]
```

```Go
const KnownEnv = ...
```

KnownEnv is a list of environment variables that affect the operation of the Go command. 

