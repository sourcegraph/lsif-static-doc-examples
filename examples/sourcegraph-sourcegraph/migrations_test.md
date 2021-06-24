# Package migrations_test

## Index

* [Functions](#func)
    * [func TestCodeIntelMigrations(t *testing.T)](#TestCodeIntelMigrations)
    * [func TestFrontendMigrations(t *testing.T)](#TestFrontendMigrations)
    * [func TestIDConstraints(t *testing.T)](#TestIDConstraints)
    * [func init()](#init.migrations_test.go)
    * [func testMigrations(t *testing.T, db *sql.DB, database *dbconn.Database)](#testMigrations)


## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestCodeIntelMigrations" href="#TestCodeIntelMigrations">func TestCodeIntelMigrations(t *testing.T)</a>

```
searchKey: migrations_test.TestCodeIntelMigrations
tags: [method private test]
```

```Go
func TestCodeIntelMigrations(t *testing.T)
```

### <a id="TestFrontendMigrations" href="#TestFrontendMigrations">func TestFrontendMigrations(t *testing.T)</a>

```
searchKey: migrations_test.TestFrontendMigrations
tags: [method private test]
```

```Go
func TestFrontendMigrations(t *testing.T)
```

### <a id="TestIDConstraints" href="#TestIDConstraints">func TestIDConstraints(t *testing.T)</a>

```
searchKey: migrations_test.TestIDConstraints
tags: [method private test]
```

```Go
func TestIDConstraints(t *testing.T)
```

### <a id="init.migrations_test.go" href="#init.migrations_test.go">func init()</a>

```
searchKey: migrations_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="testMigrations" href="#testMigrations">func testMigrations(t *testing.T, db *sql.DB, database *dbconn.Database)</a>

```
searchKey: migrations_test.testMigrations
tags: [method private]
```

```Go
func testMigrations(t *testing.T, db *sql.DB, database *dbconn.Database)
```

testMigrations runs all migrations up, then the migrations for the given database all the way back down, then back up to check for syntax errors and reversibility. 

