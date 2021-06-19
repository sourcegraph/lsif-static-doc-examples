# Package lsifstore

## Index

* Subpages
  * [enterprise/internal/codeintel/stores/lsifstore/migration](lsifstore/migration.md)
* [Constants](#const)
    * [const clearQuery](#clearQuery)
    * [const CurrentDocumentSchemaVersion](#CurrentDocumentSchemaVersion)
    * [const CurrentDefinitionsSchemaVersion](#CurrentDefinitionsSchemaVersion)
    * [const CurrentReferencesSchemaVersion](#CurrentReferencesSchemaVersion)
    * [const writeDocumentsTemporaryTableQuery](#writeDocumentsTemporaryTableQuery)
    * [const writeDocumentsInsertQuery](#writeDocumentsInsertQuery)
    * [const writeResultChunksTemporaryTableQuery](#writeResultChunksTemporaryTableQuery)
    * [const writeResultChunksInsertQuery](#writeResultChunksInsertQuery)
    * [const writeDefinitionsReferencesTemporaryTableQuery](#writeDefinitionsReferencesTemporaryTableQuery)
    * [const writeDefinitionReferencesInsertQuery](#writeDefinitionReferencesInsertQuery)
    * [const writeDocumentationPagesTemporaryTableQuery](#writeDocumentationPagesTemporaryTableQuery)
    * [const writeDocumentationPagesInsertQuery](#writeDocumentationPagesInsertQuery)
    * [const diagnosticsQuery](#diagnosticsQuery)
    * [const documentationPageDataQuery](#documentationPageDataQuery)
    * [const existsQuery](#existsQuery)
    * [const hoverDocumentQuery](#hoverDocumentQuery)
    * [const translateIDsToResultChunkIndexesQuery](#translateIDsToResultChunkIndexesQuery)
    * [const resultChunkBatchSize](#resultChunkBatchSize)
    * [const readLocationsFromResultChunksQuery](#readLocationsFromResultChunksQuery)
    * [const documentBatchSize](#documentBatchSize)
    * [const readRangesFromDocumentsQuery](#readRangesFromDocumentsQuery)
    * [const locationsDocumentQuery](#locationsDocumentQuery)
    * [const monikersDocumentQuery](#monikersDocumentQuery)
    * [const bulkMonikerResultsQuery](#bulkMonikerResultsQuery)
    * [const packageInformationQuery](#packageInformationQuery)
    * [const MaximumRangesDefinitionLocations](#MaximumRangesDefinitionLocations)
    * [const rangesDocumentQuery](#rangesDocumentQuery)
    * [const testBundleID](#testBundleID)
* [Variables](#var)
    * [var tableNames](#tableNames)
    * [var ErrNoMetadata](#ErrNoMetadata)
* [Types](#type)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
    * [type QualifiedDocumentData struct](#QualifiedDocumentData)
    * [type QualifiedMonikerLocations struct](#QualifiedMonikerLocations)
    * [type Serializer struct](#Serializer)
        * [func NewSerializer() *Serializer](#NewSerializer)
        * [func (s *Serializer) MarshalDocumentData(document semantic.DocumentData) (data MarshalledDocumentData, err error)](#Serializer.MarshalDocumentData)
        * [func (s *Serializer) MarshalLegacyDocumentData(document semantic.DocumentData) ([]byte, error)](#Serializer.MarshalLegacyDocumentData)
        * [func (s *Serializer) MarshalResultChunkData(resultChunks semantic.ResultChunkData) ([]byte, error)](#Serializer.MarshalResultChunkData)
        * [func (s *Serializer) MarshalLocations(locations []semantic.LocationData) ([]byte, error)](#Serializer.MarshalLocations)
        * [func (s *Serializer) encode(payload interface{}) (_ []byte, err error)](#Serializer.encode)
        * [func (s *Serializer) UnmarshalDocumentData(data MarshalledDocumentData) (document semantic.DocumentData, err error)](#Serializer.UnmarshalDocumentData)
        * [func (s *Serializer) UnmarshalLegacyDocumentData(data []byte) (document semantic.DocumentData, err error)](#Serializer.UnmarshalLegacyDocumentData)
        * [func (s *Serializer) UnmarshalResultChunkData(data []byte) (resultChunk semantic.ResultChunkData, err error)](#Serializer.UnmarshalResultChunkData)
        * [func (s *Serializer) UnmarshalLocations(data []byte) (locations []semantic.LocationData, err error)](#Serializer.UnmarshalLocations)
        * [func (s *Serializer) decode(data []byte, target interface{}) (err error)](#Serializer.decode)
        * [func (s *Serializer) MarshalDocumentationPageData(documentationPage *semantic.DocumentationPageData) ([]byte, error)](#Serializer.MarshalDocumentationPageData)
        * [func (s *Serializer) UnmarshalDocumentationPageData(data []byte) (documentationPage *semantic.DocumentationPageData, err error)](#Serializer.UnmarshalDocumentationPageData)
    * [type MarshalledDocumentData struct](#MarshalledDocumentData)
    * [type Store struct](#Store)
        * [func NewStore(db dbutil.DB, observationContext *observation.Context) *Store](#NewStore)
        * [func populateTestStore(t testing.TB) *Store](#populateTestStore)
        * [func (s *Store) Clear(ctx context.Context, bundleIDs ...int) (err error)](#Store.Clear)
        * [func (s *Store) WriteMeta(ctx context.Context, bundleID int, meta semantic.MetaData) (err error)](#Store.WriteMeta)
        * [func (s *Store) WriteDocuments(ctx context.Context, bundleID int, documents chan semantic.KeyedDocumentData) (err error)](#Store.WriteDocuments)
        * [func (s *Store) WriteResultChunks(ctx context.Context, bundleID int, resultChunks chan semantic.IndexedResultChunkData) (err error)](#Store.WriteResultChunks)
        * [func (s *Store) WriteDefinitions(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)](#Store.WriteDefinitions)
        * [func (s *Store) WriteReferences(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)](#Store.WriteReferences)
        * [func (s *Store) writeDefinitionReferences(ctx context.Context, bundleID int, tableName string, version int, monikerLocations chan semantic.MonikerLocations, traceLog observation.TraceLogger) (err error)](#Store.writeDefinitionReferences)
        * [func (s *Store) WriteDocumentationPages(ctx context.Context, bundleID int, documentationPages chan *semantic.DocumentationPageData) (err error)](#Store.WriteDocumentationPages)
        * [func (s *Store) Diagnostics(ctx context.Context, bundleID int, prefix string, limit, offset int) (_ []Diagnostic, _ int, err error)](#Store.Diagnostics)
        * [func (s *Store) DocumentationPage(ctx context.Context, bundleID int, pathID string) (_ *semantic.DocumentationPageData, err error)](#Store.DocumentationPage)
        * [func (s *Store) scanFirstDocumentationPageData(rows *sql.Rows, queryErr error) (_ *semantic.DocumentationPageData, err error)](#Store.scanFirstDocumentationPageData)
        * [func (s *Store) Exists(ctx context.Context, bundleID int, path string) (_ bool, err error)](#Store.Exists)
        * [func (s *Store) Hover(ctx context.Context, bundleID int, path string, line, character int) (_ string, _ Range, _ bool, err error)](#Store.Hover)
        * [func (s *Store) Definitions(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)](#Store.Definitions)
        * [func (s *Store) References(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)](#Store.References)
        * [func (s *Store) definitionsReferences(ctx context.Context, extractor func(r semantic.RangeData) semantic.ID, operation *observation.Operation, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)](#Store.definitionsReferences)
        * [func (s *Store) locations(ctx context.Context, bundleID int, ids []semantic.ID, limit, offset int) (_ map[semantic.ID][]Location, _ int, err error)](#Store.locations)
        * [func (s *Store) translateIDsToResultChunkIndexes(ctx context.Context, bundleID int, ids []semantic.ID) ([]int, error)](#Store.translateIDsToResultChunkIndexes)
        * [func (s *Store) readLocationsFromResultChunks(ctx context.Context, bundleID int, ids []semantic.ID, indexes []int, targetPath string) (map[semantic.ID]map[string][]semantic.ID, int, error)](#Store.readLocationsFromResultChunks)
        * [func (s *Store) readRangesFromDocuments(ctx context.Context, bundleID int, ids []semantic.ID, paths []string, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, traceLog observation.TraceLogger) (map[semantic.ID][]Location, int, error)](#Store.readRangesFromDocuments)
        * [func (s *Store) readRangesFromDocument(bundleID int, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, locationsByResultID map[semantic.ID][]Location, path string, document semantic.DocumentData, traceLog observation.TraceLogger) int](#Store.readRangesFromDocument)
        * [func (s *Store) MonikersByPosition(ctx context.Context, bundleID int, path string, line, character int) (_ [][]semantic.MonikerData, err error)](#Store.MonikersByPosition)
        * [func (s *Store) BulkMonikerResults(ctx context.Context, tableName string, uploadIDs []int, monikers []semantic.MonikerData, limit, offset int) (_ []Location, _ int, err error)](#Store.BulkMonikerResults)
        * [func (s *Store) PackageInformation(ctx context.Context, bundleID int, path, packageInformationID string) (_ semantic.PackageInformationData, _ bool, err error)](#Store.PackageInformation)
        * [func (s *Store) Ranges(ctx context.Context, bundleID int, path string, startLine, endLine int) (_ []CodeIntelligenceRange, err error)](#Store.Ranges)
        * [func (s *Store) locationsWithinFile(ctx context.Context, bundleID int, ids []semantic.ID, path string, documentData semantic.DocumentData) (_ map[semantic.ID][]Location, err error)](#Store.locationsWithinFile)
        * [func (s *Store) scanDocumentData(rows *sql.Rows, queryErr error) (_ []QualifiedDocumentData, err error)](#Store.scanDocumentData)
        * [func (s *Store) makeDocumentVisitor(f func(string, semantic.DocumentData)) func(rows *sql.Rows, queryErr error) error](#Store.makeDocumentVisitor)
        * [func (s *Store) scanFirstDocumentData(rows *sql.Rows, queryErr error) (_ QualifiedDocumentData, _ bool, err error)](#Store.scanFirstDocumentData)
        * [func (s *Store) scanSingleDocumentDataObject(rows *sql.Rows) (QualifiedDocumentData, error)](#Store.scanSingleDocumentDataObject)
        * [func (s *Store) makeResultChunkVisitor(rows *sql.Rows, queryErr error) func(func(int, semantic.ResultChunkData)) error](#Store.makeResultChunkVisitor)
        * [func (s *Store) scanQualifiedMonikerLocations(rows *sql.Rows, queryErr error) (_ []QualifiedMonikerLocations, err error)](#Store.scanQualifiedMonikerLocations)
        * [func (s *Store) scanSingleQualifiedMonikerLocationsObject(rows *sql.Rows) (QualifiedMonikerLocations, error)](#Store.scanSingleQualifiedMonikerLocationsObject)
        * [func (s *Store) Transact(ctx context.Context) (*Store, error)](#Store.Transact)
        * [func (s *Store) Done(err error) error](#Store.Done)
    * [type Package struct](#Package)
    * [type PackageReference struct](#PackageReference)
    * [type Location struct](#Location)
    * [type Range struct](#Range)
        * [func newRange(startLine, startCharacter, endLine, endCharacter int) Range](#newRange)
    * [type Position struct](#Position)
    * [type Diagnostic struct](#Diagnostic)
    * [type CodeIntelligenceRange struct](#CodeIntelligenceRange)
* [Functions](#func)
    * [func intsToString(vs []int) string](#intsToString)
    * [func withBatchInserter(ctx context.Context, db dbutil.DB, tableName string, columns []string, f func(inserter *batch.Inserter) error) (err error)](#withBatchInserter)
    * [func limitResultMap(ids []semantic.ID, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, limit, offset int) (limited map[semantic.ID]map[string][]semantic.ID, referencedPaths []string)](#limitResultMap)
    * [func pathsFromResultMap(rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID) []string](#pathsFromResultMap)
    * [func sortLocations(locations []Location)](#sortLocations)
    * [func compareBundleRanges(r1, r2 Range) bool](#compareBundleRanges)
    * [func idsToString(vs []semantic.ID) string](#idsToString)
    * [func extractResultIDs(ranges []semantic.RangeData, fn func(r semantic.RangeData) semantic.ID) []semantic.ID](#extractResultIDs)
    * [func monikersToString(vs []semantic.MonikerData) string](#monikersToString)
    * [func init()](#init)
    * [func init()](#init)
    * [func TestClear(t *testing.T)](#TestClear)
    * [func TestDatabaseExists(t *testing.T)](#TestDatabaseExists)
    * [func TestDatabaseHover(t *testing.T)](#TestDatabaseHover)
    * [func TestDatabaseDefinitions(t *testing.T)](#TestDatabaseDefinitions)
    * [func TestDatabaseReferences(t *testing.T)](#TestDatabaseReferences)
    * [func TestDatabaseMonikersByPosition(t *testing.T)](#TestDatabaseMonikersByPosition)
    * [func TestDatabaseBulkMonikerResults(t *testing.T)](#TestDatabaseBulkMonikerResults)
    * [func TestDatabasePackageInformation(t *testing.T)](#TestDatabasePackageInformation)
    * [func TestDatabaseRanges(t *testing.T)](#TestDatabaseRanges)
    * [func TestDocumentData(t *testing.T)](#TestDocumentData)
    * [func TestResultChunkData(t *testing.T)](#TestResultChunkData)
    * [func TestLocations(t *testing.T)](#TestLocations)
    * [func init()](#init)


## <a id="const" href="#const">Constants</a>

### <a id="clearQuery" href="#clearQuery">const clearQuery</a>

```
searchKey: lsifstore.clearQuery
```

```Go
const clearQuery = ...
```

### <a id="CurrentDocumentSchemaVersion" href="#CurrentDocumentSchemaVersion">const CurrentDocumentSchemaVersion</a>

```
searchKey: lsifstore.CurrentDocumentSchemaVersion
tags: [exported]
```

```Go
const CurrentDocumentSchemaVersion = 3
```

CurrentDocumentSchemaVersion is the schema version used for new lsif_data_documents rows. 

### <a id="CurrentDefinitionsSchemaVersion" href="#CurrentDefinitionsSchemaVersion">const CurrentDefinitionsSchemaVersion</a>

```
searchKey: lsifstore.CurrentDefinitionsSchemaVersion
tags: [exported]
```

```Go
const CurrentDefinitionsSchemaVersion = 2
```

CurrentDefinitionsSchemaVersion is the schema version used for new lsif_data_definitions rows. 

### <a id="CurrentReferencesSchemaVersion" href="#CurrentReferencesSchemaVersion">const CurrentReferencesSchemaVersion</a>

```
searchKey: lsifstore.CurrentReferencesSchemaVersion
tags: [exported]
```

```Go
const CurrentReferencesSchemaVersion = 2
```

CurrentReferencesSchemaVersion is the schema version used for new lsif_data_references rows. 

### <a id="writeDocumentsTemporaryTableQuery" href="#writeDocumentsTemporaryTableQuery">const writeDocumentsTemporaryTableQuery</a>

```
searchKey: lsifstore.writeDocumentsTemporaryTableQuery
```

```Go
const writeDocumentsTemporaryTableQuery = ...
```

### <a id="writeDocumentsInsertQuery" href="#writeDocumentsInsertQuery">const writeDocumentsInsertQuery</a>

```
searchKey: lsifstore.writeDocumentsInsertQuery
```

```Go
const writeDocumentsInsertQuery = ...
```

### <a id="writeResultChunksTemporaryTableQuery" href="#writeResultChunksTemporaryTableQuery">const writeResultChunksTemporaryTableQuery</a>

```
searchKey: lsifstore.writeResultChunksTemporaryTableQuery
```

```Go
const writeResultChunksTemporaryTableQuery = ...
```

### <a id="writeResultChunksInsertQuery" href="#writeResultChunksInsertQuery">const writeResultChunksInsertQuery</a>

```
searchKey: lsifstore.writeResultChunksInsertQuery
```

```Go
const writeResultChunksInsertQuery = ...
```

### <a id="writeDefinitionsReferencesTemporaryTableQuery" href="#writeDefinitionsReferencesTemporaryTableQuery">const writeDefinitionsReferencesTemporaryTableQuery</a>

```
searchKey: lsifstore.writeDefinitionsReferencesTemporaryTableQuery
```

```Go
const writeDefinitionsReferencesTemporaryTableQuery = ...
```

### <a id="writeDefinitionReferencesInsertQuery" href="#writeDefinitionReferencesInsertQuery">const writeDefinitionReferencesInsertQuery</a>

```
searchKey: lsifstore.writeDefinitionReferencesInsertQuery
```

```Go
const writeDefinitionReferencesInsertQuery = ...
```

### <a id="writeDocumentationPagesTemporaryTableQuery" href="#writeDocumentationPagesTemporaryTableQuery">const writeDocumentationPagesTemporaryTableQuery</a>

```
searchKey: lsifstore.writeDocumentationPagesTemporaryTableQuery
```

```Go
const writeDocumentationPagesTemporaryTableQuery = ...
```

### <a id="writeDocumentationPagesInsertQuery" href="#writeDocumentationPagesInsertQuery">const writeDocumentationPagesInsertQuery</a>

```
searchKey: lsifstore.writeDocumentationPagesInsertQuery
```

```Go
const writeDocumentationPagesInsertQuery = ...
```

### <a id="diagnosticsQuery" href="#diagnosticsQuery">const diagnosticsQuery</a>

```
searchKey: lsifstore.diagnosticsQuery
```

```Go
const diagnosticsQuery = ...
```

### <a id="documentationPageDataQuery" href="#documentationPageDataQuery">const documentationPageDataQuery</a>

```
searchKey: lsifstore.documentationPageDataQuery
```

```Go
const documentationPageDataQuery = ...
```

### <a id="existsQuery" href="#existsQuery">const existsQuery</a>

```
searchKey: lsifstore.existsQuery
```

```Go
const existsQuery = ...
```

### <a id="hoverDocumentQuery" href="#hoverDocumentQuery">const hoverDocumentQuery</a>

```
searchKey: lsifstore.hoverDocumentQuery
```

```Go
const hoverDocumentQuery = ...
```

### <a id="translateIDsToResultChunkIndexesQuery" href="#translateIDsToResultChunkIndexesQuery">const translateIDsToResultChunkIndexesQuery</a>

```
searchKey: lsifstore.translateIDsToResultChunkIndexesQuery
```

```Go
const translateIDsToResultChunkIndexesQuery = ...
```

### <a id="resultChunkBatchSize" href="#resultChunkBatchSize">const resultChunkBatchSize</a>

```
searchKey: lsifstore.resultChunkBatchSize
```

```Go
const resultChunkBatchSize = 50
```

resultChunkBatchSize is the maximum number of result chunks we will query at once to resolve a single locations request. 

### <a id="readLocationsFromResultChunksQuery" href="#readLocationsFromResultChunksQuery">const readLocationsFromResultChunksQuery</a>

```
searchKey: lsifstore.readLocationsFromResultChunksQuery
```

```Go
const readLocationsFromResultChunksQuery = ...
```

### <a id="documentBatchSize" href="#documentBatchSize">const documentBatchSize</a>

```
searchKey: lsifstore.documentBatchSize
```

```Go
const documentBatchSize = 50
```

documentBatchSize is the maximum number of documents we will query at once to resolve a single locations request. 

### <a id="readRangesFromDocumentsQuery" href="#readRangesFromDocumentsQuery">const readRangesFromDocumentsQuery</a>

```
searchKey: lsifstore.readRangesFromDocumentsQuery
```

```Go
const readRangesFromDocumentsQuery = ...
```

### <a id="locationsDocumentQuery" href="#locationsDocumentQuery">const locationsDocumentQuery</a>

```
searchKey: lsifstore.locationsDocumentQuery
```

```Go
const locationsDocumentQuery = ...
```

### <a id="monikersDocumentQuery" href="#monikersDocumentQuery">const monikersDocumentQuery</a>

```
searchKey: lsifstore.monikersDocumentQuery
```

```Go
const monikersDocumentQuery = ...
```

### <a id="bulkMonikerResultsQuery" href="#bulkMonikerResultsQuery">const bulkMonikerResultsQuery</a>

```
searchKey: lsifstore.bulkMonikerResultsQuery
```

```Go
const bulkMonikerResultsQuery = ...
```

### <a id="packageInformationQuery" href="#packageInformationQuery">const packageInformationQuery</a>

```
searchKey: lsifstore.packageInformationQuery
```

```Go
const packageInformationQuery = ...
```

### <a id="MaximumRangesDefinitionLocations" href="#MaximumRangesDefinitionLocations">const MaximumRangesDefinitionLocations</a>

```
searchKey: lsifstore.MaximumRangesDefinitionLocations
tags: [exported]
```

```Go
const MaximumRangesDefinitionLocations = 10000
```

MaximumRangesDefinitionLocations is the maximum limit when querying definition locations for a Ranges request. 

### <a id="rangesDocumentQuery" href="#rangesDocumentQuery">const rangesDocumentQuery</a>

```
searchKey: lsifstore.rangesDocumentQuery
```

```Go
const rangesDocumentQuery = ...
```

### <a id="testBundleID" href="#testBundleID">const testBundleID</a>

```
searchKey: lsifstore.testBundleID
```

```Go
const testBundleID = 39162
```

## <a id="var" href="#var">Variables</a>

### <a id="tableNames" href="#tableNames">var tableNames</a>

```
searchKey: lsifstore.tableNames
```

```Go
var tableNames = ...
```

### <a id="ErrNoMetadata" href="#ErrNoMetadata">var ErrNoMetadata</a>

```
searchKey: lsifstore.ErrNoMetadata
tags: [exported]
```

```Go
var ErrNoMetadata = errors.New("no rows in meta table")
```

ErrNoMetadata occurs if we can't determine the number of result chunks for an index. 

## <a id="type" href="#type">Types</a>

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: lsifstore.operations
```

```Go
type operations struct {
	bulkMonikerResults      *observation.Operation
	clear                   *observation.Operation
	definitions             *observation.Operation
	diagnostics             *observation.Operation
	exists                  *observation.Operation
	hover                   *observation.Operation
	monikerResults          *observation.Operation
	monikersByPosition      *observation.Operation
	packageInformation      *observation.Operation
	ranges                  *observation.Operation
	references              *observation.Operation
	documentationPage       *observation.Operation
	writeDefinitions        *observation.Operation
	writeDocuments          *observation.Operation
	writeMeta               *observation.Operation
	writeReferences         *observation.Operation
	writeResultChunks       *observation.Operation
	writeDocumentationPages *observation.Operation

	locations           *observation.Operation
	locationsWithinFile *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context) *operations</a>

```
searchKey: lsifstore.newOperations
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

### <a id="QualifiedDocumentData" href="#QualifiedDocumentData">type QualifiedDocumentData struct</a>

```
searchKey: lsifstore.QualifiedDocumentData
tags: [exported]
```

```Go
type QualifiedDocumentData struct {
	UploadID int
	semantic.KeyedDocumentData
}
```

### <a id="QualifiedMonikerLocations" href="#QualifiedMonikerLocations">type QualifiedMonikerLocations struct</a>

```
searchKey: lsifstore.QualifiedMonikerLocations
tags: [exported]
```

```Go
type QualifiedMonikerLocations struct {
	DumpID int
	semantic.MonikerLocations
}
```

### <a id="Serializer" href="#Serializer">type Serializer struct</a>

```
searchKey: lsifstore.Serializer
tags: [exported]
```

```Go
type Serializer struct {
	readers sync.Pool
	writers sync.Pool
}
```

#### <a id="NewSerializer" href="#NewSerializer">func NewSerializer() *Serializer</a>

```
searchKey: lsifstore.NewSerializer
tags: [exported]
```

```Go
func NewSerializer() *Serializer
```

#### <a id="Serializer.MarshalDocumentData" href="#Serializer.MarshalDocumentData">func (s *Serializer) MarshalDocumentData(document semantic.DocumentData) (data MarshalledDocumentData, err error)</a>

```
searchKey: lsifstore.Serializer.MarshalDocumentData
tags: [exported]
```

```Go
func (s *Serializer) MarshalDocumentData(document semantic.DocumentData) (data MarshalledDocumentData, err error)
```

MarshalDocumentData transforms the fields of the given document data payload into a set of string of bytes writable to disk. 

#### <a id="Serializer.MarshalLegacyDocumentData" href="#Serializer.MarshalLegacyDocumentData">func (s *Serializer) MarshalLegacyDocumentData(document semantic.DocumentData) ([]byte, error)</a>

```
searchKey: lsifstore.Serializer.MarshalLegacyDocumentData
tags: [exported]
```

```Go
func (s *Serializer) MarshalLegacyDocumentData(document semantic.DocumentData) ([]byte, error)
```

MarshalLegacyDocumentData encodes a legacy-formatted document (the value in the `data` column). 

#### <a id="Serializer.MarshalResultChunkData" href="#Serializer.MarshalResultChunkData">func (s *Serializer) MarshalResultChunkData(resultChunks semantic.ResultChunkData) ([]byte, error)</a>

```
searchKey: lsifstore.Serializer.MarshalResultChunkData
tags: [exported]
```

```Go
func (s *Serializer) MarshalResultChunkData(resultChunks semantic.ResultChunkData) ([]byte, error)
```

MarshalResultChunkData transforms result chunk data into a string of bytes writable to disk. 

#### <a id="Serializer.MarshalLocations" href="#Serializer.MarshalLocations">func (s *Serializer) MarshalLocations(locations []semantic.LocationData) ([]byte, error)</a>

```
searchKey: lsifstore.Serializer.MarshalLocations
tags: [exported]
```

```Go
func (s *Serializer) MarshalLocations(locations []semantic.LocationData) ([]byte, error)
```

MarshalLocations transforms a slice of locations into a string of bytes writable to disk. 

#### <a id="Serializer.encode" href="#Serializer.encode">func (s *Serializer) encode(payload interface{}) (_ []byte, err error)</a>

```
searchKey: lsifstore.Serializer.encode
```

```Go
func (s *Serializer) encode(payload interface{}) (_ []byte, err error)
```

encode gob-encodes and compresses the given payload. 

#### <a id="Serializer.UnmarshalDocumentData" href="#Serializer.UnmarshalDocumentData">func (s *Serializer) UnmarshalDocumentData(data MarshalledDocumentData) (document semantic.DocumentData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalDocumentData
tags: [exported]
```

```Go
func (s *Serializer) UnmarshalDocumentData(data MarshalledDocumentData) (document semantic.DocumentData, err error)
```

UnmarshalDocumentData is the inverse of MarshalDocumentData. 

#### <a id="Serializer.UnmarshalLegacyDocumentData" href="#Serializer.UnmarshalLegacyDocumentData">func (s *Serializer) UnmarshalLegacyDocumentData(data []byte) (document semantic.DocumentData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalLegacyDocumentData
tags: [exported]
```

```Go
func (s *Serializer) UnmarshalLegacyDocumentData(data []byte) (document semantic.DocumentData, err error)
```

UnmarshalLegacyDocumentData unmarshals a legacy-formatted document (the value in the `data` column). 

#### <a id="Serializer.UnmarshalResultChunkData" href="#Serializer.UnmarshalResultChunkData">func (s *Serializer) UnmarshalResultChunkData(data []byte) (resultChunk semantic.ResultChunkData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalResultChunkData
tags: [exported]
```

```Go
func (s *Serializer) UnmarshalResultChunkData(data []byte) (resultChunk semantic.ResultChunkData, err error)
```

UnmarshalResultChunkData is the inverse of MarshalResultChunkData. 

#### <a id="Serializer.UnmarshalLocations" href="#Serializer.UnmarshalLocations">func (s *Serializer) UnmarshalLocations(data []byte) (locations []semantic.LocationData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalLocations
tags: [exported]
```

```Go
func (s *Serializer) UnmarshalLocations(data []byte) (locations []semantic.LocationData, err error)
```

UnmarshalLocations is the inverse of MarshalLocations. 

#### <a id="Serializer.decode" href="#Serializer.decode">func (s *Serializer) decode(data []byte, target interface{}) (err error)</a>

```
searchKey: lsifstore.Serializer.decode
```

```Go
func (s *Serializer) decode(data []byte, target interface{}) (err error)
```

encode decompresses gob-decodes the given data and sets the given pointer. If the given data is empty, the pointer will not be assigned. 

#### <a id="Serializer.MarshalDocumentationPageData" href="#Serializer.MarshalDocumentationPageData">func (s *Serializer) MarshalDocumentationPageData(documentationPage *semantic.DocumentationPageData) ([]byte, error)</a>

```
searchKey: lsifstore.Serializer.MarshalDocumentationPageData
tags: [exported]
```

```Go
func (s *Serializer) MarshalDocumentationPageData(documentationPage *semantic.DocumentationPageData) ([]byte, error)
```

MarshalDocumentationPageData transforms documentation page data into a string of bytes writable to disk. 

#### <a id="Serializer.UnmarshalDocumentationPageData" href="#Serializer.UnmarshalDocumentationPageData">func (s *Serializer) UnmarshalDocumentationPageData(data []byte) (documentationPage *semantic.DocumentationPageData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalDocumentationPageData
tags: [exported]
```

```Go
func (s *Serializer) UnmarshalDocumentationPageData(data []byte) (documentationPage *semantic.DocumentationPageData, err error)
```

UnmarshalDocumentationPageData is the inverse of MarshalDocumentationPageData. 

### <a id="MarshalledDocumentData" href="#MarshalledDocumentData">type MarshalledDocumentData struct</a>

```
searchKey: lsifstore.MarshalledDocumentData
tags: [exported]
```

```Go
type MarshalledDocumentData struct {
	Ranges             []byte
	HoverResults       []byte
	Monikers           []byte
	PackageInformation []byte
	Diagnostics        []byte
}
```

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: lsifstore.Store
tags: [exported]
```

```Go
type Store struct {
	*basestore.Store
	serializer *Serializer
	operations *operations
}
```

#### <a id="NewStore" href="#NewStore">func NewStore(db dbutil.DB, observationContext *observation.Context) *Store</a>

```
searchKey: lsifstore.NewStore
tags: [exported]
```

```Go
func NewStore(db dbutil.DB, observationContext *observation.Context) *Store
```

#### <a id="populateTestStore" href="#populateTestStore">func populateTestStore(t testing.TB) *Store</a>

```
searchKey: lsifstore.populateTestStore
```

```Go
func populateTestStore(t testing.TB) *Store
```

#### <a id="Store.Clear" href="#Store.Clear">func (s *Store) Clear(ctx context.Context, bundleIDs ...int) (err error)</a>

```
searchKey: lsifstore.Store.Clear
tags: [exported]
```

```Go
func (s *Store) Clear(ctx context.Context, bundleIDs ...int) (err error)
```

#### <a id="Store.WriteMeta" href="#Store.WriteMeta">func (s *Store) WriteMeta(ctx context.Context, bundleID int, meta semantic.MetaData) (err error)</a>

```
searchKey: lsifstore.Store.WriteMeta
tags: [exported]
```

```Go
func (s *Store) WriteMeta(ctx context.Context, bundleID int, meta semantic.MetaData) (err error)
```

WriteMeta is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.WriteDocuments" href="#Store.WriteDocuments">func (s *Store) WriteDocuments(ctx context.Context, bundleID int, documents chan semantic.KeyedDocumentData) (err error)</a>

```
searchKey: lsifstore.Store.WriteDocuments
tags: [exported]
```

```Go
func (s *Store) WriteDocuments(ctx context.Context, bundleID int, documents chan semantic.KeyedDocumentData) (err error)
```

WriteDocuments is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.WriteResultChunks" href="#Store.WriteResultChunks">func (s *Store) WriteResultChunks(ctx context.Context, bundleID int, resultChunks chan semantic.IndexedResultChunkData) (err error)</a>

```
searchKey: lsifstore.Store.WriteResultChunks
tags: [exported]
```

```Go
func (s *Store) WriteResultChunks(ctx context.Context, bundleID int, resultChunks chan semantic.IndexedResultChunkData) (err error)
```

WriteResultChunks is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.WriteDefinitions" href="#Store.WriteDefinitions">func (s *Store) WriteDefinitions(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)</a>

```
searchKey: lsifstore.Store.WriteDefinitions
tags: [exported]
```

```Go
func (s *Store) WriteDefinitions(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)
```

WriteDefinitions is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.WriteReferences" href="#Store.WriteReferences">func (s *Store) WriteReferences(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)</a>

```
searchKey: lsifstore.Store.WriteReferences
tags: [exported]
```

```Go
func (s *Store) WriteReferences(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)
```

WriteReferences is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.writeDefinitionReferences" href="#Store.writeDefinitionReferences">func (s *Store) writeDefinitionReferences(ctx context.Context, bundleID int, tableName string, version int, monikerLocations chan semantic.MonikerLocations, traceLog observation.TraceLogger) (err error)</a>

```
searchKey: lsifstore.Store.writeDefinitionReferences
```

```Go
func (s *Store) writeDefinitionReferences(ctx context.Context, bundleID int, tableName string, version int, monikerLocations chan semantic.MonikerLocations, traceLog observation.TraceLogger) (err error)
```

#### <a id="Store.WriteDocumentationPages" href="#Store.WriteDocumentationPages">func (s *Store) WriteDocumentationPages(ctx context.Context, bundleID int, documentationPages chan *semantic.DocumentationPageData) (err error)</a>

```
searchKey: lsifstore.Store.WriteDocumentationPages
tags: [exported]
```

```Go
func (s *Store) WriteDocumentationPages(ctx context.Context, bundleID int, documentationPages chan *semantic.DocumentationPageData) (err error)
```

WriteDocumentationPages is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.Diagnostics" href="#Store.Diagnostics">func (s *Store) Diagnostics(ctx context.Context, bundleID int, prefix string, limit, offset int) (_ []Diagnostic, _ int, err error)</a>

```
searchKey: lsifstore.Store.Diagnostics
tags: [exported]
```

```Go
func (s *Store) Diagnostics(ctx context.Context, bundleID int, prefix string, limit, offset int) (_ []Diagnostic, _ int, err error)
```

Diagnostics returns the diagnostics for the documents that have the given path prefix. This method also returns the size of the complete result set to aid in pagination. 

#### <a id="Store.DocumentationPage" href="#Store.DocumentationPage">func (s *Store) DocumentationPage(ctx context.Context, bundleID int, pathID string) (_ *semantic.DocumentationPageData, err error)</a>

```
searchKey: lsifstore.Store.DocumentationPage
tags: [exported]
```

```Go
func (s *Store) DocumentationPage(ctx context.Context, bundleID int, pathID string) (_ *semantic.DocumentationPageData, err error)
```

DocumentationPage returns the documentation page with the given PathID. 

#### <a id="Store.scanFirstDocumentationPageData" href="#Store.scanFirstDocumentationPageData">func (s *Store) scanFirstDocumentationPageData(rows *sql.Rows, queryErr error) (_ *semantic.DocumentationPageData, err error)</a>

```
searchKey: lsifstore.Store.scanFirstDocumentationPageData
```

```Go
func (s *Store) scanFirstDocumentationPageData(rows *sql.Rows, queryErr error) (_ *semantic.DocumentationPageData, err error)
```

scanFirstDocumentationPageData reads the first DocumentationPageData row. If no rows match the query, a nil is returned. 

#### <a id="Store.Exists" href="#Store.Exists">func (s *Store) Exists(ctx context.Context, bundleID int, path string) (_ bool, err error)</a>

```
searchKey: lsifstore.Store.Exists
tags: [exported]
```

```Go
func (s *Store) Exists(ctx context.Context, bundleID int, path string) (_ bool, err error)
```

Exists determines if the path exists in the database. 

#### <a id="Store.Hover" href="#Store.Hover">func (s *Store) Hover(ctx context.Context, bundleID int, path string, line, character int) (_ string, _ Range, _ bool, err error)</a>

```
searchKey: lsifstore.Store.Hover
tags: [exported]
```

```Go
func (s *Store) Hover(ctx context.Context, bundleID int, path string, line, character int) (_ string, _ Range, _ bool, err error)
```

Hover returns the hover text of the symbol at the given position. 

#### <a id="Store.Definitions" href="#Store.Definitions">func (s *Store) Definitions(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.Definitions
tags: [exported]
```

```Go
func (s *Store) Definitions(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)
```

Definitions returns the set of locations defining the symbol at the given position. 

#### <a id="Store.References" href="#Store.References">func (s *Store) References(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.References
tags: [exported]
```

```Go
func (s *Store) References(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)
```

References returns the set of locations referencing the symbol at the given position. 

#### <a id="Store.definitionsReferences" href="#Store.definitionsReferences">func (s *Store) definitionsReferences(ctx context.Context, extractor func(r semantic.RangeData) semantic.ID, operation *observation.Operation, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.definitionsReferences
```

```Go
func (s *Store) definitionsReferences(ctx context.Context, extractor func(r semantic.RangeData) semantic.ID, operation *observation.Operation, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)
```

#### <a id="Store.locations" href="#Store.locations">func (s *Store) locations(ctx context.Context, bundleID int, ids []semantic.ID, limit, offset int) (_ map[semantic.ID][]Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.locations
```

```Go
func (s *Store) locations(ctx context.Context, bundleID int, ids []semantic.ID, limit, offset int) (_ map[semantic.ID][]Location, _ int, err error)
```

locations queries the locations associated with the given definition or reference identifiers. This method returns a map from result set identifiers to another map from document paths to locations within that document, as well as a total count of locations within the map. 

#### <a id="Store.translateIDsToResultChunkIndexes" href="#Store.translateIDsToResultChunkIndexes">func (s *Store) translateIDsToResultChunkIndexes(ctx context.Context, bundleID int, ids []semantic.ID) ([]int, error)</a>

```
searchKey: lsifstore.Store.translateIDsToResultChunkIndexes
```

```Go
func (s *Store) translateIDsToResultChunkIndexes(ctx context.Context, bundleID int, ids []semantic.ID) ([]int, error)
```

translateIDsToResultChunkIndexes converts a set of result set identifiers within a given bundle into a deduplicated and sorted set of result chunk indexes that compoletely cover those identifiers. 

#### <a id="Store.readLocationsFromResultChunks" href="#Store.readLocationsFromResultChunks">func (s *Store) readLocationsFromResultChunks(ctx context.Context, bundleID int, ids []semantic.ID, indexes []int, targetPath string) (map[semantic.ID]map[string][]semantic.ID, int, error)</a>

```
searchKey: lsifstore.Store.readLocationsFromResultChunks
```

```Go
func (s *Store) readLocationsFromResultChunks(ctx context.Context, bundleID int, ids []semantic.ID, indexes []int, targetPath string) (map[semantic.ID]map[string][]semantic.ID, int, error)
```

readLocationsFromResultChunks reads the given result chunk indexes for a given bundle. This method returns a map from documents to range identifiers that compose each of the given input result set identifiers. If a non-empty target path is supplied, then any range falling outside that document path will be omitted from the output. 

#### <a id="Store.readRangesFromDocuments" href="#Store.readRangesFromDocuments">func (s *Store) readRangesFromDocuments(ctx context.Context, bundleID int, ids []semantic.ID, paths []string, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, traceLog observation.TraceLogger) (map[semantic.ID][]Location, int, error)</a>

```
searchKey: lsifstore.Store.readRangesFromDocuments
```

```Go
func (s *Store) readRangesFromDocuments(ctx context.Context, bundleID int, ids []semantic.ID, paths []string, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, traceLog observation.TraceLogger) (map[semantic.ID][]Location, int, error)
```

readRangesFromDocuments extracts range data from the documents with the given paths. This method returns a map from result set identifiers to the set of locations composing that result set. The output resolves the missing data given via the rangeIDsByResultID parameter. This method also returns a total count of ranges in the result set. 

#### <a id="Store.readRangesFromDocument" href="#Store.readRangesFromDocument">func (s *Store) readRangesFromDocument(bundleID int, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, locationsByResultID map[semantic.ID][]Location, path string, document semantic.DocumentData, traceLog observation.TraceLogger) int</a>

```
searchKey: lsifstore.Store.readRangesFromDocument
```

```Go
func (s *Store) readRangesFromDocument(bundleID int, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, locationsByResultID map[semantic.ID][]Location, path string, document semantic.DocumentData, traceLog observation.TraceLogger) int
```

readRangesFromDocument extracts range data from the given document. This method populates the given locationsByResultId map, which resolves the missing data given via the rangeIDsByResultID parameter. This method returns a total count of ranges in the result set. 

#### <a id="Store.MonikersByPosition" href="#Store.MonikersByPosition">func (s *Store) MonikersByPosition(ctx context.Context, bundleID int, path string, line, character int) (_ [][]semantic.MonikerData, err error)</a>

```
searchKey: lsifstore.Store.MonikersByPosition
tags: [exported]
```

```Go
func (s *Store) MonikersByPosition(ctx context.Context, bundleID int, path string, line, character int) (_ [][]semantic.MonikerData, err error)
```

MonikersByPosition returns all monikers attached ranges containing the given position. If multiple ranges contain the position, then this method will return multiple sets of monikers. Each slice of monikers are attached to a single range. The order of the output slice is "outside-in", so that the range attached to earlier monikers enclose the range attached to later monikers. 

#### <a id="Store.BulkMonikerResults" href="#Store.BulkMonikerResults">func (s *Store) BulkMonikerResults(ctx context.Context, tableName string, uploadIDs []int, monikers []semantic.MonikerData, limit, offset int) (_ []Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.BulkMonikerResults
tags: [exported]
```

```Go
func (s *Store) BulkMonikerResults(ctx context.Context, tableName string, uploadIDs []int, monikers []semantic.MonikerData, limit, offset int) (_ []Location, _ int, err error)
```

BulkMonikerResults returns the locations within one of the given bundles that define or reference one of the given monikers. This method also returns the size of the complete result set to aid in pagination. 

#### <a id="Store.PackageInformation" href="#Store.PackageInformation">func (s *Store) PackageInformation(ctx context.Context, bundleID int, path, packageInformationID string) (_ semantic.PackageInformationData, _ bool, err error)</a>

```
searchKey: lsifstore.Store.PackageInformation
tags: [exported]
```

```Go
func (s *Store) PackageInformation(ctx context.Context, bundleID int, path, packageInformationID string) (_ semantic.PackageInformationData, _ bool, err error)
```

PackageInformation looks up package information data by identifier. 

#### <a id="Store.Ranges" href="#Store.Ranges">func (s *Store) Ranges(ctx context.Context, bundleID int, path string, startLine, endLine int) (_ []CodeIntelligenceRange, err error)</a>

```
searchKey: lsifstore.Store.Ranges
tags: [exported]
```

```Go
func (s *Store) Ranges(ctx context.Context, bundleID int, path string, startLine, endLine int) (_ []CodeIntelligenceRange, err error)
```

Ranges returns definition, reference, and hover data for each range within the given span of lines. 

#### <a id="Store.locationsWithinFile" href="#Store.locationsWithinFile">func (s *Store) locationsWithinFile(ctx context.Context, bundleID int, ids []semantic.ID, path string, documentData semantic.DocumentData) (_ map[semantic.ID][]Location, err error)</a>

```
searchKey: lsifstore.Store.locationsWithinFile
```

```Go
func (s *Store) locationsWithinFile(ctx context.Context, bundleID int, ids []semantic.ID, path string, documentData semantic.DocumentData) (_ map[semantic.ID][]Location, err error)
```

locationsWithinFile queries the file-local locations associated with the given definition or reference identifiers. Like locations, this method returns a map from result set identifiers to another map from document paths to locations within that document. 

#### <a id="Store.scanDocumentData" href="#Store.scanDocumentData">func (s *Store) scanDocumentData(rows *sql.Rows, queryErr error) (_ []QualifiedDocumentData, err error)</a>

```
searchKey: lsifstore.Store.scanDocumentData
```

```Go
func (s *Store) scanDocumentData(rows *sql.Rows, queryErr error) (_ []QualifiedDocumentData, err error)
```

scanDocumentData reads qualified document data from the given row object. 

#### <a id="Store.makeDocumentVisitor" href="#Store.makeDocumentVisitor">func (s *Store) makeDocumentVisitor(f func(string, semantic.DocumentData)) func(rows *sql.Rows, queryErr error) error</a>

```
searchKey: lsifstore.Store.makeDocumentVisitor
```

```Go
func (s *Store) makeDocumentVisitor(f func(string, semantic.DocumentData)) func(rows *sql.Rows, queryErr error) error
```

makeDocumentVisitor returns a function that calls the given visitor function over each matching decoded document value. 

#### <a id="Store.scanFirstDocumentData" href="#Store.scanFirstDocumentData">func (s *Store) scanFirstDocumentData(rows *sql.Rows, queryErr error) (_ QualifiedDocumentData, _ bool, err error)</a>

```
searchKey: lsifstore.Store.scanFirstDocumentData
```

```Go
func (s *Store) scanFirstDocumentData(rows *sql.Rows, queryErr error) (_ QualifiedDocumentData, _ bool, err error)
```

scanFirstDocumentData reads qualified document data from its given row object and returns the first one. If no rows match the query, a false-valued flag is returned. 

#### <a id="Store.scanSingleDocumentDataObject" href="#Store.scanSingleDocumentDataObject">func (s *Store) scanSingleDocumentDataObject(rows *sql.Rows) (QualifiedDocumentData, error)</a>

```
searchKey: lsifstore.Store.scanSingleDocumentDataObject
```

```Go
func (s *Store) scanSingleDocumentDataObject(rows *sql.Rows) (QualifiedDocumentData, error)
```

scanSingleDocumentDataObject populates a qualified document data value from the given cursor. 

#### <a id="Store.makeResultChunkVisitor" href="#Store.makeResultChunkVisitor">func (s *Store) makeResultChunkVisitor(rows *sql.Rows, queryErr error) func(func(int, semantic.ResultChunkData)) error</a>

```
searchKey: lsifstore.Store.makeResultChunkVisitor
```

```Go
func (s *Store) makeResultChunkVisitor(rows *sql.Rows, queryErr error) func(func(int, semantic.ResultChunkData)) error
```

makeResultChunkVisitor returns a function that accepts a mapping function, reads result chunk values from the given row object and calls the mapping function on each decoded result set. 

#### <a id="Store.scanQualifiedMonikerLocations" href="#Store.scanQualifiedMonikerLocations">func (s *Store) scanQualifiedMonikerLocations(rows *sql.Rows, queryErr error) (_ []QualifiedMonikerLocations, err error)</a>

```
searchKey: lsifstore.Store.scanQualifiedMonikerLocations
```

```Go
func (s *Store) scanQualifiedMonikerLocations(rows *sql.Rows, queryErr error) (_ []QualifiedMonikerLocations, err error)
```

scanQualifiedMonikerLocations reads moniker locations values from the given row object. 

#### <a id="Store.scanSingleQualifiedMonikerLocationsObject" href="#Store.scanSingleQualifiedMonikerLocationsObject">func (s *Store) scanSingleQualifiedMonikerLocationsObject(rows *sql.Rows) (QualifiedMonikerLocations, error)</a>

```
searchKey: lsifstore.Store.scanSingleQualifiedMonikerLocationsObject
```

```Go
func (s *Store) scanSingleQualifiedMonikerLocationsObject(rows *sql.Rows) (QualifiedMonikerLocations, error)
```

scanSingleQualifiedMonikerLocationsObject populates a qualified moniker locations value from the given cursor. 

#### <a id="Store.Transact" href="#Store.Transact">func (s *Store) Transact(ctx context.Context) (*Store, error)</a>

```
searchKey: lsifstore.Store.Transact
tags: [exported]
```

```Go
func (s *Store) Transact(ctx context.Context) (*Store, error)
```

#### <a id="Store.Done" href="#Store.Done">func (s *Store) Done(err error) error</a>

```
searchKey: lsifstore.Store.Done
tags: [exported]
```

```Go
func (s *Store) Done(err error) error
```

### <a id="Package" href="#Package">type Package struct</a>

```
searchKey: lsifstore.Package
tags: [exported]
```

```Go
type Package struct {
	DumpID  int
	Scheme  string
	Name    string
	Version string
}
```

Package pairs a package name and the dump that provides it. 

### <a id="PackageReference" href="#PackageReference">type PackageReference struct</a>

```
searchKey: lsifstore.PackageReference
tags: [exported]
```

```Go
type PackageReference struct {
	Package
	Filter []byte // a bloom filter of identifiers imported by this dependent
}
```

PackageReferences pairs a package name/version with a dump that depends on it. 

### <a id="Location" href="#Location">type Location struct</a>

```
searchKey: lsifstore.Location
tags: [exported]
```

```Go
type Location struct {
	DumpID int
	Path   string
	Range  Range
}
```

Location is an LSP-like location scoped to a dump. 

### <a id="Range" href="#Range">type Range struct</a>

```
searchKey: lsifstore.Range
tags: [exported]
```

```Go
type Range struct {
	Start Position
	End   Position
}
```

Range is an inclusive bounds within a file. 

#### <a id="newRange" href="#newRange">func newRange(startLine, startCharacter, endLine, endCharacter int) Range</a>

```
searchKey: lsifstore.newRange
```

```Go
func newRange(startLine, startCharacter, endLine, endCharacter int) Range
```

### <a id="Position" href="#Position">type Position struct</a>

```
searchKey: lsifstore.Position
tags: [exported]
```

```Go
type Position struct {
	Line      int
	Character int
}
```

Position is a unique position within a file. 

### <a id="Diagnostic" href="#Diagnostic">type Diagnostic struct</a>

```
searchKey: lsifstore.Diagnostic
tags: [exported]
```

```Go
type Diagnostic struct {
	DumpID int
	Path   string
	semantic.DiagnosticData
}
```

Diagnostic describes diagnostic information attached to a location within a particular dump. 

### <a id="CodeIntelligenceRange" href="#CodeIntelligenceRange">type CodeIntelligenceRange struct</a>

```
searchKey: lsifstore.CodeIntelligenceRange
tags: [exported]
```

```Go
type CodeIntelligenceRange struct {
	Range       Range
	Definitions []Location
	References  []Location
	HoverText   string
}
```

CodeIntelligenceRange pairs a range with its definitions, reference, and hover text. 

## <a id="func" href="#func">Functions</a>

### <a id="intsToString" href="#intsToString">func intsToString(vs []int) string</a>

```
searchKey: lsifstore.intsToString
```

```Go
func intsToString(vs []int) string
```

### <a id="withBatchInserter" href="#withBatchInserter">func withBatchInserter(ctx context.Context, db dbutil.DB, tableName string, columns []string, f func(inserter *batch.Inserter) error) (err error)</a>

```
searchKey: lsifstore.withBatchInserter
```

```Go
func withBatchInserter(ctx context.Context, db dbutil.DB, tableName string, columns []string, f func(inserter *batch.Inserter) error) (err error)
```

withBatchInserter runs batch.WithInserter in a number of goroutines proportional to the maximum number of CPUs that can be executing simultaneously. 

### <a id="limitResultMap" href="#limitResultMap">func limitResultMap(ids []semantic.ID, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, limit, offset int) (limited map[semantic.ID]map[string][]semantic.ID, referencedPaths []string)</a>

```
searchKey: lsifstore.limitResultMap
```

```Go
func limitResultMap(ids []semantic.ID, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, limit, offset int) (limited map[semantic.ID]map[string][]semantic.ID, referencedPaths []string)
```

limitResultMap returns a map symmetric to the given rangeIDsByResultID that includes only the location results on the current page specified by limit and offset, as well as a deduplicated and sorted list of paths that exist in the second-level of the returned map. 

### <a id="pathsFromResultMap" href="#pathsFromResultMap">func pathsFromResultMap(rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID) []string</a>

```
searchKey: lsifstore.pathsFromResultMap
```

```Go
func pathsFromResultMap(rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID) []string
```

pathsFromResultMap returns a deduplicated and sorted set of document paths present in the given map. 

### <a id="sortLocations" href="#sortLocations">func sortLocations(locations []Location)</a>

```
searchKey: lsifstore.sortLocations
```

```Go
func sortLocations(locations []Location)
```

sortLocations sorts locations by document, then by offset within a document. 

### <a id="compareBundleRanges" href="#compareBundleRanges">func compareBundleRanges(r1, r2 Range) bool</a>

```
searchKey: lsifstore.compareBundleRanges
```

```Go
func compareBundleRanges(r1, r2 Range) bool
```

compareBundleRanges returns true if r1's start position occurs before r2's start position. 

### <a id="idsToString" href="#idsToString">func idsToString(vs []semantic.ID) string</a>

```
searchKey: lsifstore.idsToString
```

```Go
func idsToString(vs []semantic.ID) string
```

### <a id="extractResultIDs" href="#extractResultIDs">func extractResultIDs(ranges []semantic.RangeData, fn func(r semantic.RangeData) semantic.ID) []semantic.ID</a>

```
searchKey: lsifstore.extractResultIDs
```

```Go
func extractResultIDs(ranges []semantic.RangeData, fn func(r semantic.RangeData) semantic.ID) []semantic.ID
```

extractResultIDs extracts result identifiers from each range in the given list. The output list is relative to the input range list, but with duplicates removed. 

### <a id="monikersToString" href="#monikersToString">func monikersToString(vs []semantic.MonikerData) string</a>

```
searchKey: lsifstore.monikersToString
```

```Go
func monikersToString(vs []semantic.MonikerData) string
```

### <a id="init" href="#init">func init()</a>

```
searchKey: lsifstore.init
```

```Go
func init()
```

### <a id="init" href="#init">func init()</a>

```
searchKey: lsifstore.init
```

```Go
func init()
```

### <a id="TestClear" href="#TestClear">func TestClear(t *testing.T)</a>

```
searchKey: lsifstore.TestClear
```

```Go
func TestClear(t *testing.T)
```

### <a id="TestDatabaseExists" href="#TestDatabaseExists">func TestDatabaseExists(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseExists
```

```Go
func TestDatabaseExists(t *testing.T)
```

### <a id="TestDatabaseHover" href="#TestDatabaseHover">func TestDatabaseHover(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseHover
```

```Go
func TestDatabaseHover(t *testing.T)
```

### <a id="TestDatabaseDefinitions" href="#TestDatabaseDefinitions">func TestDatabaseDefinitions(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseDefinitions
```

```Go
func TestDatabaseDefinitions(t *testing.T)
```

### <a id="TestDatabaseReferences" href="#TestDatabaseReferences">func TestDatabaseReferences(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseReferences
```

```Go
func TestDatabaseReferences(t *testing.T)
```

### <a id="TestDatabaseMonikersByPosition" href="#TestDatabaseMonikersByPosition">func TestDatabaseMonikersByPosition(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseMonikersByPosition
```

```Go
func TestDatabaseMonikersByPosition(t *testing.T)
```

### <a id="TestDatabaseBulkMonikerResults" href="#TestDatabaseBulkMonikerResults">func TestDatabaseBulkMonikerResults(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseBulkMonikerResults
```

```Go
func TestDatabaseBulkMonikerResults(t *testing.T)
```

### <a id="TestDatabasePackageInformation" href="#TestDatabasePackageInformation">func TestDatabasePackageInformation(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabasePackageInformation
```

```Go
func TestDatabasePackageInformation(t *testing.T)
```

### <a id="TestDatabaseRanges" href="#TestDatabaseRanges">func TestDatabaseRanges(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseRanges
```

```Go
func TestDatabaseRanges(t *testing.T)
```

### <a id="TestDocumentData" href="#TestDocumentData">func TestDocumentData(t *testing.T)</a>

```
searchKey: lsifstore.TestDocumentData
```

```Go
func TestDocumentData(t *testing.T)
```

### <a id="TestResultChunkData" href="#TestResultChunkData">func TestResultChunkData(t *testing.T)</a>

```
searchKey: lsifstore.TestResultChunkData
```

```Go
func TestResultChunkData(t *testing.T)
```

### <a id="TestLocations" href="#TestLocations">func TestLocations(t *testing.T)</a>

```
searchKey: lsifstore.TestLocations
```

```Go
func TestLocations(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: lsifstore.init
```

```Go
func init()
```

