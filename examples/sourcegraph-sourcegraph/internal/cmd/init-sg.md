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

### <a id="client" href="#client">var client</a>

```
searchKey: main.client
```

```Go
var client *gqltestutil.Client
```

### <a id="initSG" href="#initSG">var initSG</a>

```
searchKey: main.initSG
```

```Go
var initSG = flag.NewFlagSet("initserver", flag.ExitOnError)
```

### <a id="addRepos" href="#addRepos">var addRepos</a>

```
searchKey: main.addRepos
```

```Go
var addRepos = flag.NewFlagSet("addrepos", flag.ExitOnError)
```

### <a id="baseURL" href="#baseURL">var baseURL</a>

```
searchKey: main.baseURL
```

```Go
var baseURL = ...
```

### <a id="email" href="#email">var email</a>

```
searchKey: main.email
```

```Go
var email = ...
```

### <a id="username" href="#username">var username</a>

```
searchKey: main.username
```

```Go
var username = ...
```

### <a id="password" href="#password">var password</a>

```
searchKey: main.password
```

```Go
var password = ...
```

### <a id="githubToken" href="#githubToken">var githubToken</a>

```
searchKey: main.githubToken
```

```Go
var githubToken = ...
```

### <a id="addReposConfig" href="#addReposConfig">var addReposConfig</a>

```
searchKey: main.addReposConfig
```

```Go
var addReposConfig = ...
```

### <a id="home" href="#home">var home</a>

```
searchKey: main.home
```

```Go
var home = os.Getenv("HOME")
```

### <a id="profile" href="#profile">var profile</a>

```
searchKey: main.profile
```

```Go
var profile = home + "/.profile"
```

## <a id="func" href="#func">Functions</a>

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

### <a id="initSourcegraph" href="#initSourcegraph">func initSourcegraph()</a>

```
searchKey: main.initSourcegraph
```

```Go
func initSourcegraph()
```

### <a id="mustMarshalJSONString" href="#mustMarshalJSONString">func mustMarshalJSONString(v interface{}) string</a>

```
searchKey: main.mustMarshalJSONString
```

```Go
func mustMarshalJSONString(v interface{}) string
```

### <a id="addReposCommand" href="#addReposCommand">func addReposCommand()</a>

```
searchKey: main.addReposCommand
```

```Go
func addReposCommand()
```

