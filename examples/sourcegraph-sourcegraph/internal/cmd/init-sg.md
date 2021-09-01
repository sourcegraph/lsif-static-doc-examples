# Package main

## Index

* [Variables](#var)
    * [var addRepos](#addRepos)
    * [var addReposConfig](#addReposConfig)
    * [var baseURL](#baseURL)
    * [var client](#client)
    * [var email](#email)
    * [var githubToken](#githubToken)
    * [var home](#home)
    * [var initSG](#initSG)
    * [var password](#password)
    * [var profile](#profile)
    * [var username](#username)
* [Functions](#func)
    * [func addReposCommand()](#addReposCommand)
    * [func initSourcegraph()](#initSourcegraph)
    * [func main()](#main)
    * [func mustMarshalJSONString(v interface{}) string](#mustMarshalJSONString)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="addRepos" href="#addRepos">var addRepos</a>

```
searchKey: main.addRepos
tags: [variable struct private]
```

```Go
var addRepos = flag.NewFlagSet("addrepos", flag.ExitOnError)
```

### <a id="addReposConfig" href="#addReposConfig">var addReposConfig</a>

```
searchKey: main.addReposConfig
tags: [variable string private]
```

```Go
var addReposConfig = ...
```

### <a id="baseURL" href="#baseURL">var baseURL</a>

```
searchKey: main.baseURL
tags: [variable string private]
```

```Go
var baseURL = ...
```

### <a id="client" href="#client">var client</a>

```
searchKey: main.client
tags: [variable struct private]
```

```Go
var client *gqltestutil.Client
```

### <a id="email" href="#email">var email</a>

```
searchKey: main.email
tags: [variable string private]
```

```Go
var email = ...
```

### <a id="githubToken" href="#githubToken">var githubToken</a>

```
searchKey: main.githubToken
tags: [variable string private]
```

```Go
var githubToken = ...
```

### <a id="home" href="#home">var home</a>

```
searchKey: main.home
tags: [variable string private]
```

```Go
var home = os.Getenv("HOME")
```

### <a id="initSG" href="#initSG">var initSG</a>

```
searchKey: main.initSG
tags: [variable struct private]
```

```Go
var initSG = flag.NewFlagSet("initserver", flag.ExitOnError)
```

### <a id="password" href="#password">var password</a>

```
searchKey: main.password
tags: [variable string private]
```

```Go
var password = ...
```

### <a id="profile" href="#profile">var profile</a>

```
searchKey: main.profile
tags: [variable string private]
```

```Go
var profile = home + "/.profile"
```

### <a id="username" href="#username">var username</a>

```
searchKey: main.username
tags: [variable string private]
```

```Go
var username = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="addReposCommand" href="#addReposCommand">func addReposCommand()</a>

```
searchKey: main.addReposCommand
tags: [function private]
```

```Go
func addReposCommand()
```

### <a id="initSourcegraph" href="#initSourcegraph">func initSourcegraph()</a>

```
searchKey: main.initSourcegraph
tags: [function private]
```

```Go
func initSourcegraph()
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="mustMarshalJSONString" href="#mustMarshalJSONString">func mustMarshalJSONString(v interface{}) string</a>

```
searchKey: main.mustMarshalJSONString
tags: [function private]
```

```Go
func mustMarshalJSONString(v interface{}) string
```

