# Package migrations_test

## Index

* [Functions](#func)
    * [func init()](#init.migrations_test.go)
    * [func TestIDConstraints(t *testing.T)](#TestIDConstraints)
    * [func TestFrontendMigrations(t *testing.T)](#TestFrontendMigrations)
    * [func TestCodeIntelMigrations(t *testing.T)](#TestCodeIntelMigrations)
    * [func testMigrations(t *testing.T, db *sql.DB, database *dbconn.Database)](#testMigrations)


## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="init.migrations_test.go" href="#init.migrations_test.go">func init()</a>

```
searchKey: migrations_test.init
tags: [private]
```

```Go
func init()
```

### <a id="TestIDConstraints" href="#TestIDConstraints">func TestIDConstraints(t *testing.T)</a>

```
searchKey: migrations_test.TestIDConstraints
tags: [private]
```

```Go
func TestIDConstraints(t *testing.T)
```

### <a id="TestFrontendMigrations" href="#TestFrontendMigrations">func TestFrontendMigrations(t *testing.T)</a>

```
searchKey: migrations_test.TestFrontendMigrations
tags: [private]
```

```Go
func TestFrontendMigrations(t *testing.T)
```

### <a id="TestCodeIntelMigrations" href="#TestCodeIntelMigrations">func TestCodeIntelMigrations(t *testing.T)</a>

```
searchKey: migrations_test.TestCodeIntelMigrations
tags: [private]
```

```Go
func TestCodeIntelMigrations(t *testing.T)
```

### <a id="testMigrations" href="#testMigrations">func testMigrations(t *testing.T, db *sql.DB, database *dbconn.Database)</a>

```
searchKey: migrations_test.testMigrations
tags: [private]
```

```Go
func testMigrations(t *testing.T, db *sql.DB, database *dbconn.Database)
```

testMigrations runs all migrations up, then the migrations for the given database all the way back down, then back up to check for syntax errors and reversibility. 

