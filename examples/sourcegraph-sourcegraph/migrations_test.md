# Package migrations_test

## Index

* [Functions](#func)
    * [func init()](#init)
    * [func TestIDConstraints(t *testing.T)](#TestIDConstraints)
    * [func TestFrontendMigrations(t *testing.T)](#TestFrontendMigrations)
    * [func TestCodeIntelMigrations(t *testing.T)](#TestCodeIntelMigrations)
    * [func testMigrations(t *testing.T, db *sql.DB, database *dbconn.Database)](#testMigrations)


## <a id="func" href="#func">Functions</a>

### <a id="init" href="#init">func init()</a>

```
searchKey: migrations_test.init
```

```Go
func init()
```

### <a id="TestIDConstraints" href="#TestIDConstraints">func TestIDConstraints(t *testing.T)</a>

```
searchKey: migrations_test.TestIDConstraints
```

```Go
func TestIDConstraints(t *testing.T)
```

### <a id="TestFrontendMigrations" href="#TestFrontendMigrations">func TestFrontendMigrations(t *testing.T)</a>

```
searchKey: migrations_test.TestFrontendMigrations
```

```Go
func TestFrontendMigrations(t *testing.T)
```

### <a id="TestCodeIntelMigrations" href="#TestCodeIntelMigrations">func TestCodeIntelMigrations(t *testing.T)</a>

```
searchKey: migrations_test.TestCodeIntelMigrations
```

```Go
func TestCodeIntelMigrations(t *testing.T)
```

### <a id="testMigrations" href="#testMigrations">func testMigrations(t *testing.T, db *sql.DB, database *dbconn.Database)</a>

```
searchKey: migrations_test.testMigrations
```

```Go
func testMigrations(t *testing.T, db *sql.DB, database *dbconn.Database)
```

testMigrations runs all migrations up, then the migrations for the given database all the way back down, then back up to check for syntax errors and reversibility. 

