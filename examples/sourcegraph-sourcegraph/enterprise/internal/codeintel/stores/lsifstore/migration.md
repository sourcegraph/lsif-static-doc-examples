# Package migration

## Index

* [Constants](#const)
    * [const DefinitionsCountMigrationID](#DefinitionsCountMigrationID)
    * [const DiagnosticsCountMigrationID](#DiagnosticsCountMigrationID)
    * [const DocumentColumnSplitMigrationID](#DocumentColumnSplitMigrationID)
    * [const ReferencesCountMigrationID](#ReferencesCountMigrationID)
    * [const migratorProgressQuery](#migratorProgressQuery)
    * [const processRowsQuery](#processRowsQuery)
    * [const runUpdateBoundsQuery](#runUpdateBoundsQuery)
    * [const selectAndLockDumpQuery](#selectAndLockDumpQuery)
    * [const updateBatchTemporaryTableQuery](#updateBatchTemporaryTableQuery)
    * [const updateBatchUpdateQuery](#updateBatchUpdateQuery)
* [Variables](#var)
    * [var temporaryTableExpression](#temporaryTableExpression)
    * [var temporaryTableName](#temporaryTableName)
* [Types](#type)
    * [type Migrator struct](#Migrator)
        * [func (m *Migrator) Down(ctx context.Context) error](#Migrator.Down)
        * [func (m *Migrator) Progress(ctx context.Context) (float64, error)](#Migrator.Progress)
        * [func (m *Migrator) Up(ctx context.Context) (err error)](#Migrator.Up)
        * [func (m *Migrator) processRows(ctx context.Context, tx *lsifstore.Store, dumpID, version int, driverFunc driverFunc) (_ <-chan []interface{}, err error)](#Migrator.processRows)
        * [func (m *Migrator) run(ctx context.Context, sourceVersion, targetVersion int, driverFunc driverFunc) (err error)](#Migrator.run)
        * [func (m *Migrator) selectAndLockDump(ctx context.Context, tx *lsifstore.Store, sourceVersion int) (_ int, _ bool, err error)](#Migrator.selectAndLockDump)
        * [func (m *Migrator) updateBatch(ctx context.Context, tx *lsifstore.Store, dumpID, targetVersion int, rowValues <-chan []interface{}) error](#Migrator.updateBatch)
    * [type diagnosticsCountMigrator struct](#diagnosticsCountMigrator)
        * [func (m *diagnosticsCountMigrator) MigrateRowDown(scanner scanner) ([]interface{}, error)](#diagnosticsCountMigrator.MigrateRowDown)
        * [func (m *diagnosticsCountMigrator) MigrateRowUp(scanner scanner) ([]interface{}, error)](#diagnosticsCountMigrator.MigrateRowUp)
    * [type documentColumnSplitMigrator struct](#documentColumnSplitMigrator)
        * [func (m *documentColumnSplitMigrator) MigrateRowDown(scanner scanner) ([]interface{}, error)](#documentColumnSplitMigrator.MigrateRowDown)
        * [func (m *documentColumnSplitMigrator) MigrateRowUp(scanner scanner) ([]interface{}, error)](#documentColumnSplitMigrator.MigrateRowUp)
    * [type driverFunc func(scanner github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/lsifstore/migration.scanner) ([]interface{}, error)](#driverFunc)
    * [type fieldSpec struct](#fieldSpec)
    * [type locationsCountMigrator struct](#locationsCountMigrator)
        * [func (m *locationsCountMigrator) MigrateRowDown(scanner scanner) ([]interface{}, error)](#locationsCountMigrator.MigrateRowDown)
        * [func (m *locationsCountMigrator) MigrateRowUp(scanner scanner) ([]interface{}, error)](#locationsCountMigrator.MigrateRowUp)
    * [type migrationDriver interface](#migrationDriver)
    * [type migratorOptions struct](#migratorOptions)
    * [type scanner interface](#scanner)
    * [type testMigrationDriver struct{}](#testMigrationDriver)
        * [func (m *testMigrationDriver) MigrateRowDown(scanner scanner) ([]interface{}, error)](#testMigrationDriver.MigrateRowDown)
        * [func (m *testMigrationDriver) MigrateRowUp(scanner scanner) ([]interface{}, error)](#testMigrationDriver.MigrateRowUp)
* [Functions](#func)
    * [func NewDiagnosticsCountMigrator(store *lsifstore.Store, batchSize int) oobmigration.Migrator](#NewDiagnosticsCountMigrator)
    * [func NewDocumentColumnSplitMigrator(store *lsifstore.Store, batchSize int) oobmigration.Migrator](#NewDocumentColumnSplitMigrator)
    * [func NewLocationsCountMigrator(store *lsifstore.Store, tableName string, batchSize int) oobmigration.Migrator](#NewLocationsCountMigrator)
    * [func TestDiagnosticsCountMigrator(t *testing.T)](#TestDiagnosticsCountMigrator)
    * [func TestDocumentColumnSplitMigrator(t *testing.T)](#TestDocumentColumnSplitMigrator)
    * [func TestLocationsCountMigrator(t *testing.T)](#TestLocationsCountMigrator)
    * [func TestMigratorRemovesBoundsWithoutData(t *testing.T)](#TestMigratorRemovesBoundsWithoutData)
    * [func init()](#init.migration_test.go)
    * [func newMigrator(store *lsifstore.Store, driver migrationDriver, options migratorOptions) oobmigration.Migrator](#newMigrator)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="DefinitionsCountMigrationID" href="#DefinitionsCountMigrationID">const DefinitionsCountMigrationID</a>

```
searchKey: migration.DefinitionsCountMigrationID
tags: [constant number]
```

```Go
const DefinitionsCountMigrationID = 4
```

DefinitionsCountMigrationID is the primary key of the migration record handled by an instance of locationsCountMigrator. This is associated with the out-of-band migration record inserted in migrations/frontend/1528395807_lsif_locations_migration.up.sql. 

### <a id="DiagnosticsCountMigrationID" href="#DiagnosticsCountMigrationID">const DiagnosticsCountMigrationID</a>

```
searchKey: migration.DiagnosticsCountMigrationID
tags: [constant number]
```

```Go
const DiagnosticsCountMigrationID = 1
```

DiagnosticsCountMigrationID is the primary key of the migration record handled by an instance of diagnosticsCountMigrator. This is associated with the out-of-band migration record inserted in migrations/frontend/1528395786_diagnostic_counts_migration.up.sql. 

### <a id="DocumentColumnSplitMigrationID" href="#DocumentColumnSplitMigrationID">const DocumentColumnSplitMigrationID</a>

```
searchKey: migration.DocumentColumnSplitMigrationID
tags: [constant number]
```

```Go
const DocumentColumnSplitMigrationID = 7
```

DocumentColumnSplitMigrationID is the primary key of the migration record handled by an instance of documentColumnSplitMigrator. This explodes the data payload into several columns by type. This is associated with the out-of-band migration record inserted in migrations/frontend/1528395810_split_document_payload.up.sql. 

### <a id="ReferencesCountMigrationID" href="#ReferencesCountMigrationID">const ReferencesCountMigrationID</a>

```
searchKey: migration.ReferencesCountMigrationID
tags: [constant number]
```

```Go
const ReferencesCountMigrationID = 5
```

ReferencesCountMigrationID is the primary key of the migration record handled by an instance of locationsCountMigrator. This is associated with the out-of-band migration record inserted in migrations/frontend/1528395807_lsif_locations_migration.up.sql. 

### <a id="migratorProgressQuery" href="#migratorProgressQuery">const migratorProgressQuery</a>

```
searchKey: migration.migratorProgressQuery
tags: [constant string private]
```

```Go
const migratorProgressQuery = ...
```

### <a id="processRowsQuery" href="#processRowsQuery">const processRowsQuery</a>

```
searchKey: migration.processRowsQuery
tags: [constant string private]
```

```Go
const processRowsQuery = ...
```

### <a id="runUpdateBoundsQuery" href="#runUpdateBoundsQuery">const runUpdateBoundsQuery</a>

```
searchKey: migration.runUpdateBoundsQuery
tags: [constant string private]
```

```Go
const runUpdateBoundsQuery = ...
```

### <a id="selectAndLockDumpQuery" href="#selectAndLockDumpQuery">const selectAndLockDumpQuery</a>

```
searchKey: migration.selectAndLockDumpQuery
tags: [constant string private]
```

```Go
const selectAndLockDumpQuery = ...
```

### <a id="updateBatchTemporaryTableQuery" href="#updateBatchTemporaryTableQuery">const updateBatchTemporaryTableQuery</a>

```
searchKey: migration.updateBatchTemporaryTableQuery
tags: [constant string private]
```

```Go
const updateBatchTemporaryTableQuery = ...
```

### <a id="updateBatchUpdateQuery" href="#updateBatchUpdateQuery">const updateBatchUpdateQuery</a>

```
searchKey: migration.updateBatchUpdateQuery
tags: [constant string private]
```

```Go
const updateBatchUpdateQuery = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="temporaryTableExpression" href="#temporaryTableExpression">var temporaryTableExpression</a>

```
searchKey: migration.temporaryTableExpression
tags: [variable struct private]
```

```Go
var temporaryTableExpression = sqlf.Sprintf(temporaryTableName)
```

### <a id="temporaryTableName" href="#temporaryTableName">var temporaryTableName</a>

```
searchKey: migration.temporaryTableName
tags: [variable string private]
```

```Go
var temporaryTableName = "t_migration_payload"
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Migrator" href="#Migrator">type Migrator struct</a>

```
searchKey: migration.Migrator
tags: [struct]
```

```Go
type Migrator struct {
	store                    *lsifstore.Store
	driver                   migrationDriver
	options                  migratorOptions
	selectionExpressions     []*sqlf.Query // expressions used in select query
	temporaryTableFieldNames []string      // names of fields inserted into temporary table
	temporaryTableFieldSpecs []*sqlf.Query // names of fields inserted into temporary table
	updateConditions         []*sqlf.Query // expressions used for the update statement
	updateAssignments        []*sqlf.Query // expressions used to assign to the target table
}
```

Migrator is a code-intelligence-specific out-of-band migration runner. This migrator can be configured by supplying a different driver instance, which controls the update behavior over every matching row in the migration set. 

Code intelligence tables are very large and using a full table scan count is too expensvie to use in an out-of-band migration. For each table we need to perform a migration over, we introduce a second aggregate table that tracks the minimum and maximum schema version of each data record  associated with a particular upload record. 

We have the following assumptions about the schema (for a configured table T): 

1. There is an index on T.dump_id 2. For each distinct dump_id in table T, there is a corresponding row in table 

```
T_schema_version. This invariant is kept up to date via triggers on insert.

```
3. Table T_schema_version has the following schema: 

```
CREATE TABLE T_schema_versions (
    dump_id            integer PRIMARY KEY NOT NULL,
    min_schema_version integer,
    max_schema_version integer
);

```
When selecting a set of candidate records to migrate, we first use the each upload record's schema version bounds to determine if there are still records associated with that upload that may still need migrating. This set allows us to use the dump_id index on the target table. These counts can be maintained efficiently within the same transaction as a batch of migration updates. This requires counting within a small indexed subset of the original table. When checking progress, we can efficiently do a full-table on the much smaller aggregate table. 

#### <a id="Migrator.Down" href="#Migrator.Down">func (m *Migrator) Down(ctx context.Context) error</a>

```
searchKey: migration.Migrator.Down
tags: [method]
```

```Go
func (m *Migrator) Down(ctx context.Context) error
```

Down runs a batch of the migration in reverse. 

#### <a id="Migrator.Progress" href="#Migrator.Progress">func (m *Migrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: migration.Migrator.Progress
tags: [method]
```

```Go
func (m *Migrator) Progress(ctx context.Context) (float64, error)
```

Progress returns the ratio between the number of upload records that have been completely migrated over the total number of upload records. A record is migrated if its schema version is no less than the target migration version. 

#### <a id="Migrator.Up" href="#Migrator.Up">func (m *Migrator) Up(ctx context.Context) (err error)</a>

```
searchKey: migration.Migrator.Up
tags: [method]
```

```Go
func (m *Migrator) Up(ctx context.Context) (err error)
```

Up runs a batch of the migration. 

#### <a id="Migrator.processRows" href="#Migrator.processRows">func (m *Migrator) processRows(ctx context.Context, tx *lsifstore.Store, dumpID, version int, driverFunc driverFunc) (_ <-chan []interface{}, err error)</a>

```
searchKey: migration.Migrator.processRows
tags: [method private]
```

```Go
func (m *Migrator) processRows(ctx context.Context, tx *lsifstore.Store, dumpID, version int, driverFunc driverFunc) (_ <-chan []interface{}, err error)
```

processRows selects a batch of rows from the target table associated with the given dump identifier to  update and calls the given driver func over each row. The driver func returns the set of values that should be used to update that row. These values are fed into a channel usable for batch insert. 

#### <a id="Migrator.run" href="#Migrator.run">func (m *Migrator) run(ctx context.Context, sourceVersion, targetVersion int, driverFunc driverFunc) (err error)</a>

```
searchKey: migration.Migrator.run
tags: [method private]
```

```Go
func (m *Migrator) run(ctx context.Context, sourceVersion, targetVersion int, driverFunc driverFunc) (err error)
```

run performs a batch of updates with the given driver function. Records with the given source version will be selected for candidacy, and their version will match the given target version after an update. 

#### <a id="Migrator.selectAndLockDump" href="#Migrator.selectAndLockDump">func (m *Migrator) selectAndLockDump(ctx context.Context, tx *lsifstore.Store, sourceVersion int) (_ int, _ bool, err error)</a>

```
searchKey: migration.Migrator.selectAndLockDump
tags: [method private]
```

```Go
func (m *Migrator) selectAndLockDump(ctx context.Context, tx *lsifstore.Store, sourceVersion int) (_ int, _ bool, err error)
```

selectAndLockDump chooses and row-locks a schema version row associated with a particular dump. Having each batch of updates touch only rows associated with a single dump reduces contention when multiple migrators are running. This method returns the dump identifier and a boolean flag indicating that such a dump could be selected. 

#### <a id="Migrator.updateBatch" href="#Migrator.updateBatch">func (m *Migrator) updateBatch(ctx context.Context, tx *lsifstore.Store, dumpID, targetVersion int, rowValues <-chan []interface{}) error</a>

```
searchKey: migration.Migrator.updateBatch
tags: [method private]
```

```Go
func (m *Migrator) updateBatch(ctx context.Context, tx *lsifstore.Store, dumpID, targetVersion int, rowValues <-chan []interface{}) error
```

updateBatch creates a temporary table symmetric to the target table but without any of the read-only fields. Then, the given row values are bulk inserted into the temporary table. Finally, the rows in the temporary table are used to update the target table. 

### <a id="diagnosticsCountMigrator" href="#diagnosticsCountMigrator">type diagnosticsCountMigrator struct</a>

```
searchKey: migration.diagnosticsCountMigrator
tags: [struct private]
```

```Go
type diagnosticsCountMigrator struct {
	serializer *lsifstore.Serializer
}
```

#### <a id="diagnosticsCountMigrator.MigrateRowDown" href="#diagnosticsCountMigrator.MigrateRowDown">func (m *diagnosticsCountMigrator) MigrateRowDown(scanner scanner) ([]interface{}, error)</a>

```
searchKey: migration.diagnosticsCountMigrator.MigrateRowDown
tags: [method private]
```

```Go
func (m *diagnosticsCountMigrator) MigrateRowDown(scanner scanner) ([]interface{}, error)
```

MigrateRowDown sets num_diagnostics back to zero to undo the migration up direction. 

#### <a id="diagnosticsCountMigrator.MigrateRowUp" href="#diagnosticsCountMigrator.MigrateRowUp">func (m *diagnosticsCountMigrator) MigrateRowUp(scanner scanner) ([]interface{}, error)</a>

```
searchKey: migration.diagnosticsCountMigrator.MigrateRowUp
tags: [method private]
```

```Go
func (m *diagnosticsCountMigrator) MigrateRowUp(scanner scanner) ([]interface{}, error)
```

MigrateRowUp reads the payload of the given row and returns an updateSpec on how to modify the record to conform to the new schema. 

### <a id="documentColumnSplitMigrator" href="#documentColumnSplitMigrator">type documentColumnSplitMigrator struct</a>

```
searchKey: migration.documentColumnSplitMigrator
tags: [struct private]
```

```Go
type documentColumnSplitMigrator struct {
	serializer *lsifstore.Serializer
}
```

#### <a id="documentColumnSplitMigrator.MigrateRowDown" href="#documentColumnSplitMigrator.MigrateRowDown">func (m *documentColumnSplitMigrator) MigrateRowDown(scanner scanner) ([]interface{}, error)</a>

```
searchKey: migration.documentColumnSplitMigrator.MigrateRowDown
tags: [method private]
```

```Go
func (m *documentColumnSplitMigrator) MigrateRowDown(scanner scanner) ([]interface{}, error)
```

MigrateRowDown sets num_diagnostics back to zero to undo the migration up direction. 

#### <a id="documentColumnSplitMigrator.MigrateRowUp" href="#documentColumnSplitMigrator.MigrateRowUp">func (m *documentColumnSplitMigrator) MigrateRowUp(scanner scanner) ([]interface{}, error)</a>

```
searchKey: migration.documentColumnSplitMigrator.MigrateRowUp
tags: [method private]
```

```Go
func (m *documentColumnSplitMigrator) MigrateRowUp(scanner scanner) ([]interface{}, error)
```

MigrateRowUp reads the payload of the given row and returns an updateSpec on how to modify the record to conform to the new schema. 

### <a id="driverFunc" href="#driverFunc">type driverFunc func(scanner github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/lsifstore/migration.scanner) ([]interface{}, error)</a>

```
searchKey: migration.driverFunc
tags: [function private]
```

```Go
type driverFunc func(scanner scanner) ([]interface{}, error)
```

driverFunc is the type of MigrateRowUp and MigrateRowDown. 

### <a id="fieldSpec" href="#fieldSpec">type fieldSpec struct</a>

```
searchKey: migration.fieldSpec
tags: [struct private]
```

```Go
type fieldSpec struct {
	// name is the name of the column.
	name string

	// postgresType is the type (with modifiers) of the column.
	postgresType string

	// primaryKey indicates that the field is part of a composite primary key.
	primaryKey bool

	// readOnly indicates that the field should be skipped on updates.
	readOnly bool

	// updateOnly indicates that the field should be skipped on selects.
	updateOnly bool
}
```

### <a id="locationsCountMigrator" href="#locationsCountMigrator">type locationsCountMigrator struct</a>

```
searchKey: migration.locationsCountMigrator
tags: [struct private]
```

```Go
type locationsCountMigrator struct {
	serializer *lsifstore.Serializer
}
```

#### <a id="locationsCountMigrator.MigrateRowDown" href="#locationsCountMigrator.MigrateRowDown">func (m *locationsCountMigrator) MigrateRowDown(scanner scanner) ([]interface{}, error)</a>

```
searchKey: migration.locationsCountMigrator.MigrateRowDown
tags: [method private]
```

```Go
func (m *locationsCountMigrator) MigrateRowDown(scanner scanner) ([]interface{}, error)
```

MigrateRowDown sets num_locations back to zero to undo the migration up direction. 

#### <a id="locationsCountMigrator.MigrateRowUp" href="#locationsCountMigrator.MigrateRowUp">func (m *locationsCountMigrator) MigrateRowUp(scanner scanner) ([]interface{}, error)</a>

```
searchKey: migration.locationsCountMigrator.MigrateRowUp
tags: [method private]
```

```Go
func (m *locationsCountMigrator) MigrateRowUp(scanner scanner) ([]interface{}, error)
```

MigrateRowUp reads the payload of the given row and returns an updateSpec on how to modify the record to conform to the new schema. 

### <a id="migrationDriver" href="#migrationDriver">type migrationDriver interface</a>

```
searchKey: migration.migrationDriver
tags: [interface private]
```

```Go
type migrationDriver interface {
	// MigrateRowUp determines which fields to update for the given row. The scanner will receive
	// the values of the primary keys plus any additional non-updateOnly fields supplied via the
	// migrator's fields option. Implementations must return the same number of values as the set
	// of primary keys plus any additional non-selectOnly fields supplied via the migrator's fields
	// option.
	MigrateRowUp(scanner scanner) ([]interface{}, error)

	// MigrateRowDown undoes the migration for the given row.  The scanner will receive the values
	// of the primary keys plus any additional non-updateOnly fields supplied via the migrator's
	// fields option. Implementations must return the same number of values as the set  of primary
	// keys plus any additional non-selectOnly fields supplied via the migrator's fields option.
	MigrateRowDown(scanner scanner) ([]interface{}, error)
}
```

### <a id="migratorOptions" href="#migratorOptions">type migratorOptions struct</a>

```
searchKey: migration.migratorOptions
tags: [struct private]
```

```Go
type migratorOptions struct {
	// tableName is the name of the table undergoing migration.
	tableName string

	// targetVersion is the value of the row's schema version after an up migration.
	targetVersion int

	// batchSize limits the number of rows that will be scanned on each call to Up/Down.
	batchSize int

	// fields is an ordered set of fields used to construct temporary tables and update queries.
	fields []fieldSpec
}
```

### <a id="scanner" href="#scanner">type scanner interface</a>

```
searchKey: migration.scanner
tags: [interface private]
```

```Go
type scanner interface {
	Scan(dest ...interface{}) error
}
```

### <a id="testMigrationDriver" href="#testMigrationDriver">type testMigrationDriver struct{}</a>

```
searchKey: migration.testMigrationDriver
tags: [struct private]
```

```Go
type testMigrationDriver struct{}
```

#### <a id="testMigrationDriver.MigrateRowDown" href="#testMigrationDriver.MigrateRowDown">func (m *testMigrationDriver) MigrateRowDown(scanner scanner) ([]interface{}, error)</a>

```
searchKey: migration.testMigrationDriver.MigrateRowDown
tags: [method private]
```

```Go
func (m *testMigrationDriver) MigrateRowDown(scanner scanner) ([]interface{}, error)
```

#### <a id="testMigrationDriver.MigrateRowUp" href="#testMigrationDriver.MigrateRowUp">func (m *testMigrationDriver) MigrateRowUp(scanner scanner) ([]interface{}, error)</a>

```
searchKey: migration.testMigrationDriver.MigrateRowUp
tags: [method private]
```

```Go
func (m *testMigrationDriver) MigrateRowUp(scanner scanner) ([]interface{}, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewDiagnosticsCountMigrator" href="#NewDiagnosticsCountMigrator">func NewDiagnosticsCountMigrator(store *lsifstore.Store, batchSize int) oobmigration.Migrator</a>

```
searchKey: migration.NewDiagnosticsCountMigrator
tags: [method]
```

```Go
func NewDiagnosticsCountMigrator(store *lsifstore.Store, batchSize int) oobmigration.Migrator
```

NewDiagnosticsCountMigrator creates a new Migrator instance that reads records from the lsif_data_documents table with a schema version of 1 and populates that record's (new) num_diagnostics column. Updated records will have a schema version of 2. 

### <a id="NewDocumentColumnSplitMigrator" href="#NewDocumentColumnSplitMigrator">func NewDocumentColumnSplitMigrator(store *lsifstore.Store, batchSize int) oobmigration.Migrator</a>

```
searchKey: migration.NewDocumentColumnSplitMigrator
tags: [method]
```

```Go
func NewDocumentColumnSplitMigrator(store *lsifstore.Store, batchSize int) oobmigration.Migrator
```

NewDocumentColumnSplitMigrator creates a new Migrator instance that reads records from the lsif_data_documents table with a schema version of 2 and unsets the payload in favor of populating the new ranges, hovers, monikers, packages, and diagnostics columns. Updated records will have a schema version of 3. 

### <a id="NewLocationsCountMigrator" href="#NewLocationsCountMigrator">func NewLocationsCountMigrator(store *lsifstore.Store, tableName string, batchSize int) oobmigration.Migrator</a>

```
searchKey: migration.NewLocationsCountMigrator
tags: [method]
```

```Go
func NewLocationsCountMigrator(store *lsifstore.Store, tableName string, batchSize int) oobmigration.Migrator
```

NewLocationsCountMigrator creates a new Migrator instance that reads records from the given table with a schema version of 1 and populates that record's (new) num_locations column. Updated records will have a schema version of 2. 

### <a id="TestDiagnosticsCountMigrator" href="#TestDiagnosticsCountMigrator">func TestDiagnosticsCountMigrator(t *testing.T)</a>

```
searchKey: migration.TestDiagnosticsCountMigrator
tags: [method private test]
```

```Go
func TestDiagnosticsCountMigrator(t *testing.T)
```

### <a id="TestDocumentColumnSplitMigrator" href="#TestDocumentColumnSplitMigrator">func TestDocumentColumnSplitMigrator(t *testing.T)</a>

```
searchKey: migration.TestDocumentColumnSplitMigrator
tags: [method private test]
```

```Go
func TestDocumentColumnSplitMigrator(t *testing.T)
```

### <a id="TestLocationsCountMigrator" href="#TestLocationsCountMigrator">func TestLocationsCountMigrator(t *testing.T)</a>

```
searchKey: migration.TestLocationsCountMigrator
tags: [method private test]
```

```Go
func TestLocationsCountMigrator(t *testing.T)
```

### <a id="TestMigratorRemovesBoundsWithoutData" href="#TestMigratorRemovesBoundsWithoutData">func TestMigratorRemovesBoundsWithoutData(t *testing.T)</a>

```
searchKey: migration.TestMigratorRemovesBoundsWithoutData
tags: [method private test]
```

```Go
func TestMigratorRemovesBoundsWithoutData(t *testing.T)
```

### <a id="init.migration_test.go" href="#init.migration_test.go">func init()</a>

```
searchKey: migration.init
tags: [function private]
```

```Go
func init()
```

### <a id="newMigrator" href="#newMigrator">func newMigrator(store *lsifstore.Store, driver migrationDriver, options migratorOptions) oobmigration.Migrator</a>

```
searchKey: migration.newMigrator
tags: [method private]
```

```Go
func newMigrator(store *lsifstore.Store, driver migrationDriver, options migratorOptions) oobmigration.Migrator
```

