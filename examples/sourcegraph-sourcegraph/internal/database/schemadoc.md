# Package main

## Index

* [Constants](#const)
    * [const containerName](#containerName)
    * [const databaseNamePrefix](#databaseNamePrefix)
* [Variables](#var)
    * [var databases](#databases)
    * [var logger](#logger)
    * [var versionRe](#versionRe)
* [Types](#type)
    * [type runFunc func(quiet bool, cmd ...string) (string, error)](#runFunc)
        * [func runWithPrefix(prefix []string) runFunc](#runWithPrefix)
    * [type table struct](#table)
* [Functions](#func)
    * [func describeTable(db *sql.DB, databaseName string, table table, run runFunc) (string, error)](#describeTable)
    * [func describeTypes(db *sql.DB) (map[string][]string, error)](#describeTypes)
    * [func generateAndWrite(database *dbconn.Database, dataSource string, commandPrefix []string, destinationFile string) error](#generateAndWrite)
    * [func generateInternal(database *dbconn.Database, dataSource string, run runFunc) (string, error)](#generateInternal)
    * [func getColumnComments(db *sql.DB, table string) (map[string]string, error)](#getColumnComments)
    * [func getTableComment(db *sql.DB, table string) (comment string, _ error)](#getTableComment)
    * [func getTables(db *sql.DB) (tables []table, _ error)](#getTables)
    * [func getViewQuery(db *sql.DB, view string) (query string, _ error)](#getViewQuery)
    * [func main()](#main)
    * [func mainContainer() error](#mainContainer)
    * [func mainErr() error](#mainErr)
    * [func mainLocal() error](#mainLocal)
    * [func startDocker() (commandPrefix []string, shutdown func(), _ error)](#startDocker)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="containerName" href="#containerName">const containerName</a>

```
searchKey: main.containerName
tags: [constant string private]
```

```Go
const containerName = "schemadoc"
```

### <a id="databaseNamePrefix" href="#databaseNamePrefix">const databaseNamePrefix</a>

```
searchKey: main.databaseNamePrefix
tags: [constant string private]
```

```Go
const databaseNamePrefix = "schemadoc-gen-temp-"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="databases" href="#databases">var databases</a>

```
searchKey: main.databases
tags: [variable object private]
```

```Go
var databases = ...
```

### <a id="logger" href="#logger">var logger</a>

```
searchKey: main.logger
tags: [variable struct private]
```

```Go
var logger = log.New(os.Stderr, "", log.LstdFlags)
```

### <a id="versionRe" href="#versionRe">var versionRe</a>

```
searchKey: main.versionRe
tags: [variable struct private]
```

```Go
var versionRe = lazyregexp.New(fmt.Sprintf(`\b%s\b`, regexp.QuoteMeta(`12\.\d+`)))
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="runFunc" href="#runFunc">type runFunc func(quiet bool, cmd ...string) (string, error)</a>

```
searchKey: main.runFunc
tags: [function private]
```

```Go
type runFunc func(quiet bool, cmd ...string) (string, error)
```

#### <a id="runWithPrefix" href="#runWithPrefix">func runWithPrefix(prefix []string) runFunc</a>

```
searchKey: main.runWithPrefix
tags: [method private]
```

```Go
func runWithPrefix(prefix []string) runFunc
```

### <a id="table" href="#table">type table struct</a>

```
searchKey: main.table
tags: [struct private]
```

```Go
type table struct {
	name   string
	isView bool
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="describeTable" href="#describeTable">func describeTable(db *sql.DB, databaseName string, table table, run runFunc) (string, error)</a>

```
searchKey: main.describeTable
tags: [method private]
```

```Go
func describeTable(db *sql.DB, databaseName string, table table, run runFunc) (string, error)
```

### <a id="describeTypes" href="#describeTypes">func describeTypes(db *sql.DB) (map[string][]string, error)</a>

```
searchKey: main.describeTypes
tags: [method private]
```

```Go
func describeTypes(db *sql.DB) (map[string][]string, error)
```

### <a id="generateAndWrite" href="#generateAndWrite">func generateAndWrite(database *dbconn.Database, dataSource string, commandPrefix []string, destinationFile string) error</a>

```
searchKey: main.generateAndWrite
tags: [method private]
```

```Go
func generateAndWrite(database *dbconn.Database, dataSource string, commandPrefix []string, destinationFile string) error
```

### <a id="generateInternal" href="#generateInternal">func generateInternal(database *dbconn.Database, dataSource string, run runFunc) (string, error)</a>

```
searchKey: main.generateInternal
tags: [method private]
```

```Go
func generateInternal(database *dbconn.Database, dataSource string, run runFunc) (string, error)
```

### <a id="getColumnComments" href="#getColumnComments">func getColumnComments(db *sql.DB, table string) (map[string]string, error)</a>

```
searchKey: main.getColumnComments
tags: [method private]
```

```Go
func getColumnComments(db *sql.DB, table string) (map[string]string, error)
```

### <a id="getTableComment" href="#getTableComment">func getTableComment(db *sql.DB, table string) (comment string, _ error)</a>

```
searchKey: main.getTableComment
tags: [method private]
```

```Go
func getTableComment(db *sql.DB, table string) (comment string, _ error)
```

### <a id="getTables" href="#getTables">func getTables(db *sql.DB) (tables []table, _ error)</a>

```
searchKey: main.getTables
tags: [method private]
```

```Go
func getTables(db *sql.DB) (tables []table, _ error)
```

### <a id="getViewQuery" href="#getViewQuery">func getViewQuery(db *sql.DB, view string) (query string, _ error)</a>

```
searchKey: main.getViewQuery
tags: [method private]
```

```Go
func getViewQuery(db *sql.DB, view string) (query string, _ error)
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

This script generates markdown formatted output containing descriptions of the current dabase schema, obtained from postgres. The correct PGHOST, PGPORT, PGUSER etc. env variables must be set to run this script. 

### <a id="mainContainer" href="#mainContainer">func mainContainer() error</a>

```
searchKey: main.mainContainer
tags: [function private]
```

```Go
func mainContainer() error
```

### <a id="mainErr" href="#mainErr">func mainErr() error</a>

```
searchKey: main.mainErr
tags: [function private]
```

```Go
func mainErr() error
```

### <a id="mainLocal" href="#mainLocal">func mainLocal() error</a>

```
searchKey: main.mainLocal
tags: [function private]
```

```Go
func mainLocal() error
```

### <a id="startDocker" href="#startDocker">func startDocker() (commandPrefix []string, shutdown func(), _ error)</a>

```
searchKey: main.startDocker
tags: [function private]
```

```Go
func startDocker() (commandPrefix []string, shutdown func(), _ error)
```

