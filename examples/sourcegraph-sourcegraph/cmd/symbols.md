# Package main

Command symbols is a service that serves code symbols (functions, variables, etc.) from a repository at a specific commit. 

## Index

* Subpages
  * [cmd/symbols/internal](symbols/internal.md)
* [Constants](#const)
    * [const port](#port)
* [Functions](#func)
    * [func main()](#main)
    * [func shutdownOnSIGINT(s *http.Server)](#shutdownOnSIGINT)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="port" href="#port">const port</a>

```
searchKey: main.port
```

```Go
const port = "3184"
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

### <a id="shutdownOnSIGINT" href="#shutdownOnSIGINT">func shutdownOnSIGINT(s *http.Server)</a>

```
searchKey: main.shutdownOnSIGINT
```

```Go
func shutdownOnSIGINT(s *http.Server)
```

