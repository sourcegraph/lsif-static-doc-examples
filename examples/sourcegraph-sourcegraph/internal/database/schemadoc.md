# Package main

## Index

* [Constants](#const)
    * [const databaseNamePrefix](#databaseNamePrefix)
    * [const containerName](#containerName)
* [Variables](#var)
    * [var logger](#logger)
    * [var versionRe](#versionRe)
    * [var databases](#databases)
* [Types](#type)
    * [type runFunc func(quiet bool, cmd ...string) (string, error)](#runFunc)
        * [func runWithPrefix(prefix []string) runFunc](#runWithPrefix)
    * [type table struct](#table)
* [Functions](#func)
    * [func main()](#main)
    * [func mainErr() error](#mainErr)
    * [func mainLocal() error](#mainLocal)
    * [func mainContainer() error](#mainContainer)
    * [func generateAndWrite(database *dbconn.Database, dataSource string, commandPrefix []string, destinationFile string) error](#generateAndWrite)
    * [func startDocker() (commandPrefix []string, shutdown func(), _ error)](#startDocker)
    * [func generateInternal(database *dbconn.Database, dataSource string, run runFunc) (string, error)](#generateInternal)
    * [func getTables(db *sql.DB) (tables []table, _ error)](#getTables)
    * [func describeTable(db *sql.DB, databaseName string, table table, run runFunc) (string, error)](#describeTable)
    * [func getTableComment(db *sql.DB, table string) (comment string, _ error)](#getTableComment)
    * [func getViewQuery(db *sql.DB, view string) (query string, _ error)](#getViewQuery)
    * [func getColumnComments(db *sql.DB, table string) (map[string]string, error)](#getColumnComments)
    * [func describeTypes(db *sql.DB) (map[string][]string, error)](#describeTypes)


## <a id="const" href="#const">Constants</a>

### <a id="databaseNamePrefix" href="#databaseNamePrefix">const databaseNamePrefix</a>

```
searchKey: main.databaseNamePrefix
```

```Go
const databaseNamePrefix = "schemadoc-gen-temp-"
```

### <a id="containerName" href="#containerName">const containerName</a>

```
searchKey: main.containerName
```

```Go
const containerName = "schemadoc"
```

## <a id="var" href="#var">Variables</a>

### <a id="logger" href="#logger">var logger</a>

```
searchKey: main.logger
```

```Go
var logger = log.New(os.Stderr, "", log.LstdFlags)
```

### <a id="versionRe" href="#versionRe">var versionRe</a>

```
searchKey: main.versionRe
```

```Go
var versionRe = lazyregexp.New(fmt.Sprintf(`\b%s\b`, regexp.QuoteMeta(`12\.\d+`)))
```

### <a id="databases" href="#databases">var databases</a>

```
searchKey: main.databases
```

```Go
var databases = ...
```

## <a id="type" href="#type">Types</a>

### <a id="runFunc" href="#runFunc">type runFunc func(quiet bool, cmd ...string) (string, error)</a>

```
searchKey: main.runFunc
```

```Go
type runFunc func(quiet bool, cmd ...string) (string, error)
```

#### <a id="runWithPrefix" href="#runWithPrefix">func runWithPrefix(prefix []string) runFunc</a>

```
searchKey: main.runWithPrefix
```

```Go
func runWithPrefix(prefix []string) runFunc
```

### <a id="table" href="#table">type table struct</a>

```
searchKey: main.table
```

```Go
type table struct {
	name   string
	isView bool
}
```

## <a id="func" href="#func">Functions</a>

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

This script generates markdown formatted output containing descriptions of the current dabase schema, obtained from postgres. The correct PGHOST, PGPORT, PGUSER etc. env variables must be set to run this script. 

### <a id="mainErr" href="#mainErr">func mainErr() error</a>

```
searchKey: main.mainErr
```

```Go
func mainErr() error
```

### <a id="mainLocal" href="#mainLocal">func mainLocal() error</a>

```
searchKey: main.mainLocal
```

```Go
func mainLocal() error
```

### <a id="mainContainer" href="#mainContainer">func mainContainer() error</a>

```
searchKey: main.mainContainer
```

```Go
func mainContainer() error
```

### <a id="generateAndWrite" href="#generateAndWrite">func generateAndWrite(database *dbconn.Database, dataSource string, commandPrefix []string, destinationFile string) error</a>

```
searchKey: main.generateAndWrite
```

```Go
func generateAndWrite(database *dbconn.Database, dataSource string, commandPrefix []string, destinationFile string) error
```

### <a id="startDocker" href="#startDocker">func startDocker() (commandPrefix []string, shutdown func(), _ error)</a>

```
searchKey: main.startDocker
```

```Go
func startDocker() (commandPrefix []string, shutdown func(), _ error)
```

### <a id="generateInternal" href="#generateInternal">func generateInternal(database *dbconn.Database, dataSource string, run runFunc) (string, error)</a>

```
searchKey: main.generateInternal
```

```Go
func generateInternal(database *dbconn.Database, dataSource string, run runFunc) (string, error)
```

### <a id="getTables" href="#getTables">func getTables(db *sql.DB) (tables []table, _ error)</a>

```
searchKey: main.getTables
```

```Go
func getTables(db *sql.DB) (tables []table, _ error)
```

### <a id="describeTable" href="#describeTable">func describeTable(db *sql.DB, databaseName string, table table, run runFunc) (string, error)</a>

```
searchKey: main.describeTable
```

```Go
func describeTable(db *sql.DB, databaseName string, table table, run runFunc) (string, error)
```

### <a id="getTableComment" href="#getTableComment">func getTableComment(db *sql.DB, table string) (comment string, _ error)</a>

```
searchKey: main.getTableComment
```

```Go
func getTableComment(db *sql.DB, table string) (comment string, _ error)
```

### <a id="getViewQuery" href="#getViewQuery">func getViewQuery(db *sql.DB, view string) (query string, _ error)</a>

```
searchKey: main.getViewQuery
```

```Go
func getViewQuery(db *sql.DB, view string) (query string, _ error)
```

### <a id="getColumnComments" href="#getColumnComments">func getColumnComments(db *sql.DB, table string) (map[string]string, error)</a>

```
searchKey: main.getColumnComments
```

```Go
func getColumnComments(db *sql.DB, table string) (map[string]string, error)
```

### <a id="describeTypes" href="#describeTypes">func describeTypes(db *sql.DB) (map[string][]string, error)</a>

```
searchKey: main.describeTypes
```

```Go
func describeTypes(db *sql.DB) (map[string][]string, error)
```

