# Package main

## Index

* [Variables](#var)
    * [var client](#client)
    * [var initSG](#initSG)
    * [var addRepos](#addRepos)
    * [var baseURL](#baseURL)
    * [var email](#email)
    * [var username](#username)
    * [var password](#password)
    * [var githubToken](#githubToken)
    * [var addReposConfig](#addReposConfig)
    * [var home](#home)
    * [var profile](#profile)
* [Functions](#func)
    * [func main()](#main)
    * [func initSourcegraph()](#initSourcegraph)
    * [func mustMarshalJSONString(v interface{}) string](#mustMarshalJSONString)
    * [func addReposCommand()](#addReposCommand)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="client" href="#client">var client</a>

```
searchKey: main.client
tags: [private]
```

```Go
var client *gqltestutil.Client
```

### <a id="initSG" href="#initSG">var initSG</a>

```
searchKey: main.initSG
tags: [private]
```

```Go
var initSG = flag.NewFlagSet("initserver", flag.ExitOnError)
```

### <a id="addRepos" href="#addRepos">var addRepos</a>

```
searchKey: main.addRepos
tags: [private]
```

```Go
var addRepos = flag.NewFlagSet("addrepos", flag.ExitOnError)
```

### <a id="baseURL" href="#baseURL">var baseURL</a>

```
searchKey: main.baseURL
tags: [private]
```

```Go
var baseURL = ...
```

### <a id="email" href="#email">var email</a>

```
searchKey: main.email
tags: [private]
```

```Go
var email = ...
```

### <a id="username" href="#username">var username</a>

```
searchKey: main.username
tags: [private]
```

```Go
var username = ...
```

### <a id="password" href="#password">var password</a>

```
searchKey: main.password
tags: [private]
```

```Go
var password = ...
```

### <a id="githubToken" href="#githubToken">var githubToken</a>

```
searchKey: main.githubToken
tags: [private]
```

```Go
var githubToken = ...
```

### <a id="addReposConfig" href="#addReposConfig">var addReposConfig</a>

```
searchKey: main.addReposConfig
tags: [private]
```

```Go
var addReposConfig = ...
```

### <a id="home" href="#home">var home</a>

```
searchKey: main.home
tags: [private]
```

```Go
var home = os.Getenv("HOME")
```

### <a id="profile" href="#profile">var profile</a>

```
searchKey: main.profile
tags: [private]
```

```Go
var profile = home + "/.profile"
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [private]
```

```Go
func main()
```

### <a id="initSourcegraph" href="#initSourcegraph">func initSourcegraph()</a>

```
searchKey: main.initSourcegraph
tags: [private]
```

```Go
func initSourcegraph()
```

### <a id="mustMarshalJSONString" href="#mustMarshalJSONString">func mustMarshalJSONString(v interface{}) string</a>

```
searchKey: main.mustMarshalJSONString
tags: [private]
```

```Go
func mustMarshalJSONString(v interface{}) string
```

### <a id="addReposCommand" href="#addReposCommand">func addReposCommand()</a>

```
searchKey: main.addReposCommand
tags: [private]
```

```Go
func addReposCommand()
```

