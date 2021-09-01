# Package lsifstore

## Index

* Subpages
  * [enterprise/internal/codeintel/stores/lsifstore/migration](lsifstore/migration.md)
* [Constants](#const)
    * [const CurrentDefinitionsSchemaVersion](#CurrentDefinitionsSchemaVersion)
    * [const CurrentDocumentSchemaVersion](#CurrentDocumentSchemaVersion)
    * [const CurrentReferencesSchemaVersion](#CurrentReferencesSchemaVersion)
    * [const MaximumRangesDefinitionLocations](#MaximumRangesDefinitionLocations)
    * [const bulkMonikerResultsQuery](#bulkMonikerResultsQuery)
    * [const clearQuery](#clearQuery)
    * [const diagnosticsQuery](#diagnosticsQuery)
    * [const documentBatchSize](#documentBatchSize)
    * [const documentationPageDataQuery](#documentationPageDataQuery)
    * [const existsQuery](#existsQuery)
    * [const hoverDocumentQuery](#hoverDocumentQuery)
    * [const locationsDocumentQuery](#locationsDocumentQuery)
    * [const monikersDocumentQuery](#monikersDocumentQuery)
    * [const packageInformationQuery](#packageInformationQuery)
    * [const rangesDocumentQuery](#rangesDocumentQuery)
    * [const readLocationsFromResultChunksQuery](#readLocationsFromResultChunksQuery)
    * [const readRangesFromDocumentsQuery](#readRangesFromDocumentsQuery)
    * [const resultChunkBatchSize](#resultChunkBatchSize)
    * [const testBundleID](#testBundleID)
    * [const translateIDsToResultChunkIndexesQuery](#translateIDsToResultChunkIndexesQuery)
    * [const writeDefinitionReferencesInsertQuery](#writeDefinitionReferencesInsertQuery)
    * [const writeDefinitionsReferencesTemporaryTableQuery](#writeDefinitionsReferencesTemporaryTableQuery)
    * [const writeDocumentationPagesInsertQuery](#writeDocumentationPagesInsertQuery)
    * [const writeDocumentationPagesTemporaryTableQuery](#writeDocumentationPagesTemporaryTableQuery)
    * [const writeDocumentsInsertQuery](#writeDocumentsInsertQuery)
    * [const writeDocumentsTemporaryTableQuery](#writeDocumentsTemporaryTableQuery)
    * [const writeResultChunksInsertQuery](#writeResultChunksInsertQuery)
    * [const writeResultChunksTemporaryTableQuery](#writeResultChunksTemporaryTableQuery)
* [Variables](#var)
    * [var ErrNoMetadata](#ErrNoMetadata)
    * [var tableNames](#tableNames)
* [Types](#type)
    * [type CodeIntelligenceRange struct](#CodeIntelligenceRange)
    * [type Diagnostic struct](#Diagnostic)
    * [type Location struct](#Location)
    * [type MarshalledDocumentData struct](#MarshalledDocumentData)
    * [type Package struct](#Package)
    * [type PackageReference struct](#PackageReference)
    * [type Position struct](#Position)
    * [type QualifiedDocumentData struct](#QualifiedDocumentData)
    * [type QualifiedMonikerLocations struct](#QualifiedMonikerLocations)
    * [type Range struct](#Range)
        * [func newRange(startLine, startCharacter, endLine, endCharacter int) Range](#newRange)
    * [type Serializer struct](#Serializer)
        * [func NewSerializer() *Serializer](#NewSerializer)
        * [func (s *Serializer) MarshalDocumentData(document semantic.DocumentData) (data MarshalledDocumentData, err error)](#Serializer.MarshalDocumentData)
        * [func (s *Serializer) MarshalDocumentationPageData(documentationPage *semantic.DocumentationPageData) ([]byte, error)](#Serializer.MarshalDocumentationPageData)
        * [func (s *Serializer) MarshalLegacyDocumentData(document semantic.DocumentData) ([]byte, error)](#Serializer.MarshalLegacyDocumentData)
        * [func (s *Serializer) MarshalLocations(locations []semantic.LocationData) ([]byte, error)](#Serializer.MarshalLocations)
        * [func (s *Serializer) MarshalResultChunkData(resultChunks semantic.ResultChunkData) ([]byte, error)](#Serializer.MarshalResultChunkData)
        * [func (s *Serializer) UnmarshalDocumentData(data MarshalledDocumentData) (document semantic.DocumentData, err error)](#Serializer.UnmarshalDocumentData)
        * [func (s *Serializer) UnmarshalDocumentationPageData(data []byte) (documentationPage *semantic.DocumentationPageData, err error)](#Serializer.UnmarshalDocumentationPageData)
        * [func (s *Serializer) UnmarshalLegacyDocumentData(data []byte) (document semantic.DocumentData, err error)](#Serializer.UnmarshalLegacyDocumentData)
        * [func (s *Serializer) UnmarshalLocations(data []byte) (locations []semantic.LocationData, err error)](#Serializer.UnmarshalLocations)
        * [func (s *Serializer) UnmarshalResultChunkData(data []byte) (resultChunk semantic.ResultChunkData, err error)](#Serializer.UnmarshalResultChunkData)
        * [func (s *Serializer) decode(data []byte, target interface{}) (err error)](#Serializer.decode)
        * [func (s *Serializer) encode(payload interface{}) (_ []byte, err error)](#Serializer.encode)
    * [type Store struct](#Store)
        * [func NewStore(db dbutil.DB, observationContext *observation.Context) *Store](#NewStore)
        * [func populateTestStore(t testing.TB) *Store](#populateTestStore)
        * [func (s *Store) BulkMonikerResults(ctx context.Context, tableName string, uploadIDs []int, monikers []semantic.MonikerData, limit, offset int) (_ []Location, _ int, err error)](#Store.BulkMonikerResults)
        * [func (s *Store) Clear(ctx context.Context, bundleIDs ...int) (err error)](#Store.Clear)
        * [func (s *Store) Definitions(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)](#Store.Definitions)
        * [func (s *Store) Diagnostics(ctx context.Context, bundleID int, prefix string, limit, offset int) (_ []Diagnostic, _ int, err error)](#Store.Diagnostics)
        * [func (s *Store) DocumentationPage(ctx context.Context, bundleID int, pathID string) (_ *semantic.DocumentationPageData, err error)](#Store.DocumentationPage)
        * [func (s *Store) Done(err error) error](#Store.Done)
        * [func (s *Store) Exists(ctx context.Context, bundleID int, path string) (_ bool, err error)](#Store.Exists)
        * [func (s *Store) Hover(ctx context.Context, bundleID int, path string, line, character int) (_ string, _ Range, _ bool, err error)](#Store.Hover)
        * [func (s *Store) MonikersByPosition(ctx context.Context, bundleID int, path string, line, character int) (_ [][]semantic.MonikerData, err error)](#Store.MonikersByPosition)
        * [func (s *Store) PackageInformation(ctx context.Context, bundleID int, path, packageInformationID string) (_ semantic.PackageInformationData, _ bool, err error)](#Store.PackageInformation)
        * [func (s *Store) Ranges(ctx context.Context, bundleID int, path string, startLine, endLine int) (_ []CodeIntelligenceRange, err error)](#Store.Ranges)
        * [func (s *Store) References(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)](#Store.References)
        * [func (s *Store) Transact(ctx context.Context) (*Store, error)](#Store.Transact)
        * [func (s *Store) WriteDefinitions(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)](#Store.WriteDefinitions)
        * [func (s *Store) WriteDocumentationPages(ctx context.Context, bundleID int, documentationPages chan *semantic.DocumentationPageData) (err error)](#Store.WriteDocumentationPages)
        * [func (s *Store) WriteDocuments(ctx context.Context, bundleID int, documents chan semantic.KeyedDocumentData) (err error)](#Store.WriteDocuments)
        * [func (s *Store) WriteMeta(ctx context.Context, bundleID int, meta semantic.MetaData) (err error)](#Store.WriteMeta)
        * [func (s *Store) WriteReferences(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)](#Store.WriteReferences)
        * [func (s *Store) WriteResultChunks(ctx context.Context, bundleID int, resultChunks chan semantic.IndexedResultChunkData) (err error)](#Store.WriteResultChunks)
        * [func (s *Store) definitionsReferences(ctx context.Context, extractor func(r semantic.RangeData) semantic.ID, operation *observation.Operation, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)](#Store.definitionsReferences)
        * [func (s *Store) locations(ctx context.Context, bundleID int, ids []semantic.ID, limit, offset int) (_ map[semantic.ID][]Location, _ int, err error)](#Store.locations)
        * [func (s *Store) locationsWithinFile(ctx context.Context, bundleID int, ids []semantic.ID, path string, documentData semantic.DocumentData) (_ map[semantic.ID][]Location, err error)](#Store.locationsWithinFile)
        * [func (s *Store) makeDocumentVisitor(f func(string, semantic.DocumentData)) func(rows *sql.Rows, queryErr error) error](#Store.makeDocumentVisitor)
        * [func (s *Store) makeResultChunkVisitor(rows *sql.Rows, queryErr error) func(func(int, semantic.ResultChunkData)) error](#Store.makeResultChunkVisitor)
        * [func (s *Store) readLocationsFromResultChunks(ctx context.Context, bundleID int, ids []semantic.ID, indexes []int, targetPath string) (map[semantic.ID]map[string][]semantic.ID, int, error)](#Store.readLocationsFromResultChunks)
        * [func (s *Store) readRangesFromDocument(bundleID int, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, locationsByResultID map[semantic.ID][]Location, path string, document semantic.DocumentData, traceLog observation.TraceLogger) int](#Store.readRangesFromDocument)
        * [func (s *Store) readRangesFromDocuments(ctx context.Context, bundleID int, ids []semantic.ID, paths []string, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, traceLog observation.TraceLogger) (map[semantic.ID][]Location, int, error)](#Store.readRangesFromDocuments)
        * [func (s *Store) scanDocumentData(rows *sql.Rows, queryErr error) (_ []QualifiedDocumentData, err error)](#Store.scanDocumentData)
        * [func (s *Store) scanFirstDocumentData(rows *sql.Rows, queryErr error) (_ QualifiedDocumentData, _ bool, err error)](#Store.scanFirstDocumentData)
        * [func (s *Store) scanFirstDocumentationPageData(rows *sql.Rows, queryErr error) (_ *semantic.DocumentationPageData, err error)](#Store.scanFirstDocumentationPageData)
        * [func (s *Store) scanQualifiedMonikerLocations(rows *sql.Rows, queryErr error) (_ []QualifiedMonikerLocations, err error)](#Store.scanQualifiedMonikerLocations)
        * [func (s *Store) scanSingleDocumentDataObject(rows *sql.Rows) (QualifiedDocumentData, error)](#Store.scanSingleDocumentDataObject)
        * [func (s *Store) scanSingleQualifiedMonikerLocationsObject(rows *sql.Rows) (QualifiedMonikerLocations, error)](#Store.scanSingleQualifiedMonikerLocationsObject)
        * [func (s *Store) translateIDsToResultChunkIndexes(ctx context.Context, bundleID int, ids []semantic.ID) ([]int, error)](#Store.translateIDsToResultChunkIndexes)
        * [func (s *Store) writeDefinitionReferences(ctx context.Context, bundleID int, tableName string, version int, monikerLocations chan semantic.MonikerLocations, traceLog observation.TraceLogger) (err error)](#Store.writeDefinitionReferences)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
* [Functions](#func)
    * [func TestClear(t *testing.T)](#TestClear)
    * [func TestDatabaseBulkMonikerResults(t *testing.T)](#TestDatabaseBulkMonikerResults)
    * [func TestDatabaseDefinitions(t *testing.T)](#TestDatabaseDefinitions)
    * [func TestDatabaseExists(t *testing.T)](#TestDatabaseExists)
    * [func TestDatabaseHover(t *testing.T)](#TestDatabaseHover)
    * [func TestDatabaseMonikersByPosition(t *testing.T)](#TestDatabaseMonikersByPosition)
    * [func TestDatabasePackageInformation(t *testing.T)](#TestDatabasePackageInformation)
    * [func TestDatabaseRanges(t *testing.T)](#TestDatabaseRanges)
    * [func TestDatabaseReferences(t *testing.T)](#TestDatabaseReferences)
    * [func TestDocumentData(t *testing.T)](#TestDocumentData)
    * [func TestLocations(t *testing.T)](#TestLocations)
    * [func TestResultChunkData(t *testing.T)](#TestResultChunkData)
    * [func compareBundleRanges(r1, r2 Range) bool](#compareBundleRanges)
    * [func extractResultIDs(ranges []semantic.RangeData, fn func(r semantic.RangeData) semantic.ID) []semantic.ID](#extractResultIDs)
    * [func idsToString(vs []semantic.ID) string](#idsToString)
    * [func init()](#init.serializer.go)
    * [func init()](#init.serializer_documentation.go)
    * [func init()](#init.store_test.go)
    * [func intsToString(vs []int) string](#intsToString)
    * [func limitResultMap(ids []semantic.ID, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, limit, offset int) (limited map[semantic.ID]map[string][]semantic.ID, referencedPaths []string)](#limitResultMap)
    * [func monikersToString(vs []semantic.MonikerData) string](#monikersToString)
    * [func pathsFromResultMap(rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID) []string](#pathsFromResultMap)
    * [func sortLocations(locations []Location)](#sortLocations)
    * [func withBatchInserter(ctx context.Context, db dbutil.DB, tableName string, columns []string, f func(inserter *batch.Inserter) error) (err error)](#withBatchInserter)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="CurrentDefinitionsSchemaVersion" href="#CurrentDefinitionsSchemaVersion">const CurrentDefinitionsSchemaVersion</a>

```
searchKey: lsifstore.CurrentDefinitionsSchemaVersion
tags: [constant number]
```

```Go
const CurrentDefinitionsSchemaVersion = 2
```

CurrentDefinitionsSchemaVersion is the schema version used for new lsif_data_definitions rows. 

### <a id="CurrentDocumentSchemaVersion" href="#CurrentDocumentSchemaVersion">const CurrentDocumentSchemaVersion</a>

```
searchKey: lsifstore.CurrentDocumentSchemaVersion
tags: [constant number]
```

```Go
const CurrentDocumentSchemaVersion = 3
```

CurrentDocumentSchemaVersion is the schema version used for new lsif_data_documents rows. 

### <a id="CurrentReferencesSchemaVersion" href="#CurrentReferencesSchemaVersion">const CurrentReferencesSchemaVersion</a>

```
searchKey: lsifstore.CurrentReferencesSchemaVersion
tags: [constant number]
```

```Go
const CurrentReferencesSchemaVersion = 2
```

CurrentReferencesSchemaVersion is the schema version used for new lsif_data_references rows. 

### <a id="MaximumRangesDefinitionLocations" href="#MaximumRangesDefinitionLocations">const MaximumRangesDefinitionLocations</a>

```
searchKey: lsifstore.MaximumRangesDefinitionLocations
tags: [constant number]
```

```Go
const MaximumRangesDefinitionLocations = 10000
```

MaximumRangesDefinitionLocations is the maximum limit when querying definition locations for a Ranges request. 

### <a id="bulkMonikerResultsQuery" href="#bulkMonikerResultsQuery">const bulkMonikerResultsQuery</a>

```
searchKey: lsifstore.bulkMonikerResultsQuery
tags: [constant string private]
```

```Go
const bulkMonikerResultsQuery = ...
```

### <a id="clearQuery" href="#clearQuery">const clearQuery</a>

```
searchKey: lsifstore.clearQuery
tags: [constant string private]
```

```Go
const clearQuery = ...
```

### <a id="diagnosticsQuery" href="#diagnosticsQuery">const diagnosticsQuery</a>

```
searchKey: lsifstore.diagnosticsQuery
tags: [constant string private]
```

```Go
const diagnosticsQuery = ...
```

### <a id="documentBatchSize" href="#documentBatchSize">const documentBatchSize</a>

```
searchKey: lsifstore.documentBatchSize
tags: [constant number private]
```

```Go
const documentBatchSize = 50
```

documentBatchSize is the maximum number of documents we will query at once to resolve a single locations request. 

### <a id="documentationPageDataQuery" href="#documentationPageDataQuery">const documentationPageDataQuery</a>

```
searchKey: lsifstore.documentationPageDataQuery
tags: [constant string private]
```

```Go
const documentationPageDataQuery = ...
```

### <a id="existsQuery" href="#existsQuery">const existsQuery</a>

```
searchKey: lsifstore.existsQuery
tags: [constant string private]
```

```Go
const existsQuery = ...
```

### <a id="hoverDocumentQuery" href="#hoverDocumentQuery">const hoverDocumentQuery</a>

```
searchKey: lsifstore.hoverDocumentQuery
tags: [constant string private]
```

```Go
const hoverDocumentQuery = ...
```

### <a id="locationsDocumentQuery" href="#locationsDocumentQuery">const locationsDocumentQuery</a>

```
searchKey: lsifstore.locationsDocumentQuery
tags: [constant string private]
```

```Go
const locationsDocumentQuery = ...
```

### <a id="monikersDocumentQuery" href="#monikersDocumentQuery">const monikersDocumentQuery</a>

```
searchKey: lsifstore.monikersDocumentQuery
tags: [constant string private]
```

```Go
const monikersDocumentQuery = ...
```

### <a id="packageInformationQuery" href="#packageInformationQuery">const packageInformationQuery</a>

```
searchKey: lsifstore.packageInformationQuery
tags: [constant string private]
```

```Go
const packageInformationQuery = ...
```

### <a id="rangesDocumentQuery" href="#rangesDocumentQuery">const rangesDocumentQuery</a>

```
searchKey: lsifstore.rangesDocumentQuery
tags: [constant string private]
```

```Go
const rangesDocumentQuery = ...
```

### <a id="readLocationsFromResultChunksQuery" href="#readLocationsFromResultChunksQuery">const readLocationsFromResultChunksQuery</a>

```
searchKey: lsifstore.readLocationsFromResultChunksQuery
tags: [constant string private]
```

```Go
const readLocationsFromResultChunksQuery = ...
```

### <a id="readRangesFromDocumentsQuery" href="#readRangesFromDocumentsQuery">const readRangesFromDocumentsQuery</a>

```
searchKey: lsifstore.readRangesFromDocumentsQuery
tags: [constant string private]
```

```Go
const readRangesFromDocumentsQuery = ...
```

### <a id="resultChunkBatchSize" href="#resultChunkBatchSize">const resultChunkBatchSize</a>

```
searchKey: lsifstore.resultChunkBatchSize
tags: [constant number private]
```

```Go
const resultChunkBatchSize = 50
```

resultChunkBatchSize is the maximum number of result chunks we will query at once to resolve a single locations request. 

### <a id="testBundleID" href="#testBundleID">const testBundleID</a>

```
searchKey: lsifstore.testBundleID
tags: [constant number private]
```

```Go
const testBundleID = 39162
```

### <a id="translateIDsToResultChunkIndexesQuery" href="#translateIDsToResultChunkIndexesQuery">const translateIDsToResultChunkIndexesQuery</a>

```
searchKey: lsifstore.translateIDsToResultChunkIndexesQuery
tags: [constant string private]
```

```Go
const translateIDsToResultChunkIndexesQuery = ...
```

### <a id="writeDefinitionReferencesInsertQuery" href="#writeDefinitionReferencesInsertQuery">const writeDefinitionReferencesInsertQuery</a>

```
searchKey: lsifstore.writeDefinitionReferencesInsertQuery
tags: [constant string private]
```

```Go
const writeDefinitionReferencesInsertQuery = ...
```

### <a id="writeDefinitionsReferencesTemporaryTableQuery" href="#writeDefinitionsReferencesTemporaryTableQuery">const writeDefinitionsReferencesTemporaryTableQuery</a>

```
searchKey: lsifstore.writeDefinitionsReferencesTemporaryTableQuery
tags: [constant string private]
```

```Go
const writeDefinitionsReferencesTemporaryTableQuery = ...
```

### <a id="writeDocumentationPagesInsertQuery" href="#writeDocumentationPagesInsertQuery">const writeDocumentationPagesInsertQuery</a>

```
searchKey: lsifstore.writeDocumentationPagesInsertQuery
tags: [constant string private]
```

```Go
const writeDocumentationPagesInsertQuery = ...
```

### <a id="writeDocumentationPagesTemporaryTableQuery" href="#writeDocumentationPagesTemporaryTableQuery">const writeDocumentationPagesTemporaryTableQuery</a>

```
searchKey: lsifstore.writeDocumentationPagesTemporaryTableQuery
tags: [constant string private]
```

```Go
const writeDocumentationPagesTemporaryTableQuery = ...
```

### <a id="writeDocumentsInsertQuery" href="#writeDocumentsInsertQuery">const writeDocumentsInsertQuery</a>

```
searchKey: lsifstore.writeDocumentsInsertQuery
tags: [constant string private]
```

```Go
const writeDocumentsInsertQuery = ...
```

### <a id="writeDocumentsTemporaryTableQuery" href="#writeDocumentsTemporaryTableQuery">const writeDocumentsTemporaryTableQuery</a>

```
searchKey: lsifstore.writeDocumentsTemporaryTableQuery
tags: [constant string private]
```

```Go
const writeDocumentsTemporaryTableQuery = ...
```

### <a id="writeResultChunksInsertQuery" href="#writeResultChunksInsertQuery">const writeResultChunksInsertQuery</a>

```
searchKey: lsifstore.writeResultChunksInsertQuery
tags: [constant string private]
```

```Go
const writeResultChunksInsertQuery = ...
```

### <a id="writeResultChunksTemporaryTableQuery" href="#writeResultChunksTemporaryTableQuery">const writeResultChunksTemporaryTableQuery</a>

```
searchKey: lsifstore.writeResultChunksTemporaryTableQuery
tags: [constant string private]
```

```Go
const writeResultChunksTemporaryTableQuery = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrNoMetadata" href="#ErrNoMetadata">var ErrNoMetadata</a>

```
searchKey: lsifstore.ErrNoMetadata
tags: [variable interface]
```

```Go
var ErrNoMetadata = errors.New("no rows in meta table")
```

ErrNoMetadata occurs if we can't determine the number of result chunks for an index. 

### <a id="tableNames" href="#tableNames">var tableNames</a>

```
searchKey: lsifstore.tableNames
tags: [variable array string private]
```

```Go
var tableNames = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CodeIntelligenceRange" href="#CodeIntelligenceRange">type CodeIntelligenceRange struct</a>

```
searchKey: lsifstore.CodeIntelligenceRange
tags: [struct]
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

### <a id="Diagnostic" href="#Diagnostic">type Diagnostic struct</a>

```
searchKey: lsifstore.Diagnostic
tags: [struct]
```

```Go
type Diagnostic struct {
	DumpID int
	Path   string
	semantic.DiagnosticData
}
```

Diagnostic describes diagnostic information attached to a location within a particular dump. 

### <a id="Location" href="#Location">type Location struct</a>

```
searchKey: lsifstore.Location
tags: [struct]
```

```Go
type Location struct {
	DumpID int
	Path   string
	Range  Range
}
```

Location is an LSP-like location scoped to a dump. 

### <a id="MarshalledDocumentData" href="#MarshalledDocumentData">type MarshalledDocumentData struct</a>

```
searchKey: lsifstore.MarshalledDocumentData
tags: [struct]
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

### <a id="Package" href="#Package">type Package struct</a>

```
searchKey: lsifstore.Package
tags: [struct]
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
tags: [struct]
```

```Go
type PackageReference struct {
	Package
	Filter []byte // a bloom filter of identifiers imported by this dependent
}
```

PackageReferences pairs a package name/version with a dump that depends on it. 

### <a id="Position" href="#Position">type Position struct</a>

```
searchKey: lsifstore.Position
tags: [struct]
```

```Go
type Position struct {
	Line      int
	Character int
}
```

Position is a unique position within a file. 

### <a id="QualifiedDocumentData" href="#QualifiedDocumentData">type QualifiedDocumentData struct</a>

```
searchKey: lsifstore.QualifiedDocumentData
tags: [struct]
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
tags: [struct]
```

```Go
type QualifiedMonikerLocations struct {
	DumpID int
	semantic.MonikerLocations
}
```

### <a id="Range" href="#Range">type Range struct</a>

```
searchKey: lsifstore.Range
tags: [struct]
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
tags: [function private]
```

```Go
func newRange(startLine, startCharacter, endLine, endCharacter int) Range
```

### <a id="Serializer" href="#Serializer">type Serializer struct</a>

```
searchKey: lsifstore.Serializer
tags: [struct]
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
tags: [function]
```

```Go
func NewSerializer() *Serializer
```

#### <a id="Serializer.MarshalDocumentData" href="#Serializer.MarshalDocumentData">func (s *Serializer) MarshalDocumentData(document semantic.DocumentData) (data MarshalledDocumentData, err error)</a>

```
searchKey: lsifstore.Serializer.MarshalDocumentData
tags: [method]
```

```Go
func (s *Serializer) MarshalDocumentData(document semantic.DocumentData) (data MarshalledDocumentData, err error)
```

MarshalDocumentData transforms the fields of the given document data payload into a set of string of bytes writable to disk. 

#### <a id="Serializer.MarshalDocumentationPageData" href="#Serializer.MarshalDocumentationPageData">func (s *Serializer) MarshalDocumentationPageData(documentationPage *semantic.DocumentationPageData) ([]byte, error)</a>

```
searchKey: lsifstore.Serializer.MarshalDocumentationPageData
tags: [method]
```

```Go
func (s *Serializer) MarshalDocumentationPageData(documentationPage *semantic.DocumentationPageData) ([]byte, error)
```

MarshalDocumentationPageData transforms documentation page data into a string of bytes writable to disk. 

#### <a id="Serializer.MarshalLegacyDocumentData" href="#Serializer.MarshalLegacyDocumentData">func (s *Serializer) MarshalLegacyDocumentData(document semantic.DocumentData) ([]byte, error)</a>

```
searchKey: lsifstore.Serializer.MarshalLegacyDocumentData
tags: [method]
```

```Go
func (s *Serializer) MarshalLegacyDocumentData(document semantic.DocumentData) ([]byte, error)
```

MarshalLegacyDocumentData encodes a legacy-formatted document (the value in the `data` column). 

#### <a id="Serializer.MarshalLocations" href="#Serializer.MarshalLocations">func (s *Serializer) MarshalLocations(locations []semantic.LocationData) ([]byte, error)</a>

```
searchKey: lsifstore.Serializer.MarshalLocations
tags: [method]
```

```Go
func (s *Serializer) MarshalLocations(locations []semantic.LocationData) ([]byte, error)
```

MarshalLocations transforms a slice of locations into a string of bytes writable to disk. 

#### <a id="Serializer.MarshalResultChunkData" href="#Serializer.MarshalResultChunkData">func (s *Serializer) MarshalResultChunkData(resultChunks semantic.ResultChunkData) ([]byte, error)</a>

```
searchKey: lsifstore.Serializer.MarshalResultChunkData
tags: [method]
```

```Go
func (s *Serializer) MarshalResultChunkData(resultChunks semantic.ResultChunkData) ([]byte, error)
```

MarshalResultChunkData transforms result chunk data into a string of bytes writable to disk. 

#### <a id="Serializer.UnmarshalDocumentData" href="#Serializer.UnmarshalDocumentData">func (s *Serializer) UnmarshalDocumentData(data MarshalledDocumentData) (document semantic.DocumentData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalDocumentData
tags: [method]
```

```Go
func (s *Serializer) UnmarshalDocumentData(data MarshalledDocumentData) (document semantic.DocumentData, err error)
```

UnmarshalDocumentData is the inverse of MarshalDocumentData. 

#### <a id="Serializer.UnmarshalDocumentationPageData" href="#Serializer.UnmarshalDocumentationPageData">func (s *Serializer) UnmarshalDocumentationPageData(data []byte) (documentationPage *semantic.DocumentationPageData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalDocumentationPageData
tags: [method]
```

```Go
func (s *Serializer) UnmarshalDocumentationPageData(data []byte) (documentationPage *semantic.DocumentationPageData, err error)
```

UnmarshalDocumentationPageData is the inverse of MarshalDocumentationPageData. 

#### <a id="Serializer.UnmarshalLegacyDocumentData" href="#Serializer.UnmarshalLegacyDocumentData">func (s *Serializer) UnmarshalLegacyDocumentData(data []byte) (document semantic.DocumentData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalLegacyDocumentData
tags: [method]
```

```Go
func (s *Serializer) UnmarshalLegacyDocumentData(data []byte) (document semantic.DocumentData, err error)
```

UnmarshalLegacyDocumentData unmarshals a legacy-formatted document (the value in the `data` column). 

#### <a id="Serializer.UnmarshalLocations" href="#Serializer.UnmarshalLocations">func (s *Serializer) UnmarshalLocations(data []byte) (locations []semantic.LocationData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalLocations
tags: [method]
```

```Go
func (s *Serializer) UnmarshalLocations(data []byte) (locations []semantic.LocationData, err error)
```

UnmarshalLocations is the inverse of MarshalLocations. 

#### <a id="Serializer.UnmarshalResultChunkData" href="#Serializer.UnmarshalResultChunkData">func (s *Serializer) UnmarshalResultChunkData(data []byte) (resultChunk semantic.ResultChunkData, err error)</a>

```
searchKey: lsifstore.Serializer.UnmarshalResultChunkData
tags: [method]
```

```Go
func (s *Serializer) UnmarshalResultChunkData(data []byte) (resultChunk semantic.ResultChunkData, err error)
```

UnmarshalResultChunkData is the inverse of MarshalResultChunkData. 

#### <a id="Serializer.decode" href="#Serializer.decode">func (s *Serializer) decode(data []byte, target interface{}) (err error)</a>

```
searchKey: lsifstore.Serializer.decode
tags: [method private]
```

```Go
func (s *Serializer) decode(data []byte, target interface{}) (err error)
```

encode decompresses gob-decodes the given data and sets the given pointer. If the given data is empty, the pointer will not be assigned. 

#### <a id="Serializer.encode" href="#Serializer.encode">func (s *Serializer) encode(payload interface{}) (_ []byte, err error)</a>

```
searchKey: lsifstore.Serializer.encode
tags: [method private]
```

```Go
func (s *Serializer) encode(payload interface{}) (_ []byte, err error)
```

encode gob-encodes and compresses the given payload. 

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: lsifstore.Store
tags: [struct]
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
tags: [function]
```

```Go
func NewStore(db dbutil.DB, observationContext *observation.Context) *Store
```

#### <a id="populateTestStore" href="#populateTestStore">func populateTestStore(t testing.TB) *Store</a>

```
searchKey: lsifstore.populateTestStore
tags: [function private]
```

```Go
func populateTestStore(t testing.TB) *Store
```

#### <a id="Store.BulkMonikerResults" href="#Store.BulkMonikerResults">func (s *Store) BulkMonikerResults(ctx context.Context, tableName string, uploadIDs []int, monikers []semantic.MonikerData, limit, offset int) (_ []Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.BulkMonikerResults
tags: [method]
```

```Go
func (s *Store) BulkMonikerResults(ctx context.Context, tableName string, uploadIDs []int, monikers []semantic.MonikerData, limit, offset int) (_ []Location, _ int, err error)
```

BulkMonikerResults returns the locations within one of the given bundles that define or reference one of the given monikers. This method also returns the size of the complete result set to aid in pagination. 

#### <a id="Store.Clear" href="#Store.Clear">func (s *Store) Clear(ctx context.Context, bundleIDs ...int) (err error)</a>

```
searchKey: lsifstore.Store.Clear
tags: [method]
```

```Go
func (s *Store) Clear(ctx context.Context, bundleIDs ...int) (err error)
```

#### <a id="Store.Definitions" href="#Store.Definitions">func (s *Store) Definitions(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.Definitions
tags: [method]
```

```Go
func (s *Store) Definitions(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)
```

Definitions returns the set of locations defining the symbol at the given position. 

#### <a id="Store.Diagnostics" href="#Store.Diagnostics">func (s *Store) Diagnostics(ctx context.Context, bundleID int, prefix string, limit, offset int) (_ []Diagnostic, _ int, err error)</a>

```
searchKey: lsifstore.Store.Diagnostics
tags: [method]
```

```Go
func (s *Store) Diagnostics(ctx context.Context, bundleID int, prefix string, limit, offset int) (_ []Diagnostic, _ int, err error)
```

Diagnostics returns the diagnostics for the documents that have the given path prefix. This method also returns the size of the complete result set to aid in pagination. 

#### <a id="Store.DocumentationPage" href="#Store.DocumentationPage">func (s *Store) DocumentationPage(ctx context.Context, bundleID int, pathID string) (_ *semantic.DocumentationPageData, err error)</a>

```
searchKey: lsifstore.Store.DocumentationPage
tags: [method]
```

```Go
func (s *Store) DocumentationPage(ctx context.Context, bundleID int, pathID string) (_ *semantic.DocumentationPageData, err error)
```

DocumentationPage returns the documentation page with the given PathID. 

#### <a id="Store.Done" href="#Store.Done">func (s *Store) Done(err error) error</a>

```
searchKey: lsifstore.Store.Done
tags: [method]
```

```Go
func (s *Store) Done(err error) error
```

#### <a id="Store.Exists" href="#Store.Exists">func (s *Store) Exists(ctx context.Context, bundleID int, path string) (_ bool, err error)</a>

```
searchKey: lsifstore.Store.Exists
tags: [method]
```

```Go
func (s *Store) Exists(ctx context.Context, bundleID int, path string) (_ bool, err error)
```

Exists determines if the path exists in the database. 

#### <a id="Store.Hover" href="#Store.Hover">func (s *Store) Hover(ctx context.Context, bundleID int, path string, line, character int) (_ string, _ Range, _ bool, err error)</a>

```
searchKey: lsifstore.Store.Hover
tags: [method]
```

```Go
func (s *Store) Hover(ctx context.Context, bundleID int, path string, line, character int) (_ string, _ Range, _ bool, err error)
```

Hover returns the hover text of the symbol at the given position. 

#### <a id="Store.MonikersByPosition" href="#Store.MonikersByPosition">func (s *Store) MonikersByPosition(ctx context.Context, bundleID int, path string, line, character int) (_ [][]semantic.MonikerData, err error)</a>

```
searchKey: lsifstore.Store.MonikersByPosition
tags: [method]
```

```Go
func (s *Store) MonikersByPosition(ctx context.Context, bundleID int, path string, line, character int) (_ [][]semantic.MonikerData, err error)
```

MonikersByPosition returns all monikers attached ranges containing the given position. If multiple ranges contain the position, then this method will return multiple sets of monikers. Each slice of monikers are attached to a single range. The order of the output slice is "outside-in", so that the range attached to earlier monikers enclose the range attached to later monikers. 

#### <a id="Store.PackageInformation" href="#Store.PackageInformation">func (s *Store) PackageInformation(ctx context.Context, bundleID int, path, packageInformationID string) (_ semantic.PackageInformationData, _ bool, err error)</a>

```
searchKey: lsifstore.Store.PackageInformation
tags: [method]
```

```Go
func (s *Store) PackageInformation(ctx context.Context, bundleID int, path, packageInformationID string) (_ semantic.PackageInformationData, _ bool, err error)
```

PackageInformation looks up package information data by identifier. 

#### <a id="Store.Ranges" href="#Store.Ranges">func (s *Store) Ranges(ctx context.Context, bundleID int, path string, startLine, endLine int) (_ []CodeIntelligenceRange, err error)</a>

```
searchKey: lsifstore.Store.Ranges
tags: [method]
```

```Go
func (s *Store) Ranges(ctx context.Context, bundleID int, path string, startLine, endLine int) (_ []CodeIntelligenceRange, err error)
```

Ranges returns definition, reference, and hover data for each range within the given span of lines. 

#### <a id="Store.References" href="#Store.References">func (s *Store) References(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.References
tags: [method]
```

```Go
func (s *Store) References(ctx context.Context, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)
```

References returns the set of locations referencing the symbol at the given position. 

#### <a id="Store.Transact" href="#Store.Transact">func (s *Store) Transact(ctx context.Context) (*Store, error)</a>

```
searchKey: lsifstore.Store.Transact
tags: [method]
```

```Go
func (s *Store) Transact(ctx context.Context) (*Store, error)
```

#### <a id="Store.WriteDefinitions" href="#Store.WriteDefinitions">func (s *Store) WriteDefinitions(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)</a>

```
searchKey: lsifstore.Store.WriteDefinitions
tags: [method]
```

```Go
func (s *Store) WriteDefinitions(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)
```

WriteDefinitions is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.WriteDocumentationPages" href="#Store.WriteDocumentationPages">func (s *Store) WriteDocumentationPages(ctx context.Context, bundleID int, documentationPages chan *semantic.DocumentationPageData) (err error)</a>

```
searchKey: lsifstore.Store.WriteDocumentationPages
tags: [method]
```

```Go
func (s *Store) WriteDocumentationPages(ctx context.Context, bundleID int, documentationPages chan *semantic.DocumentationPageData) (err error)
```

WriteDocumentationPages is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.WriteDocuments" href="#Store.WriteDocuments">func (s *Store) WriteDocuments(ctx context.Context, bundleID int, documents chan semantic.KeyedDocumentData) (err error)</a>

```
searchKey: lsifstore.Store.WriteDocuments
tags: [method]
```

```Go
func (s *Store) WriteDocuments(ctx context.Context, bundleID int, documents chan semantic.KeyedDocumentData) (err error)
```

WriteDocuments is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.WriteMeta" href="#Store.WriteMeta">func (s *Store) WriteMeta(ctx context.Context, bundleID int, meta semantic.MetaData) (err error)</a>

```
searchKey: lsifstore.Store.WriteMeta
tags: [method]
```

```Go
func (s *Store) WriteMeta(ctx context.Context, bundleID int, meta semantic.MetaData) (err error)
```

WriteMeta is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.WriteReferences" href="#Store.WriteReferences">func (s *Store) WriteReferences(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)</a>

```
searchKey: lsifstore.Store.WriteReferences
tags: [method]
```

```Go
func (s *Store) WriteReferences(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) (err error)
```

WriteReferences is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.WriteResultChunks" href="#Store.WriteResultChunks">func (s *Store) WriteResultChunks(ctx context.Context, bundleID int, resultChunks chan semantic.IndexedResultChunkData) (err error)</a>

```
searchKey: lsifstore.Store.WriteResultChunks
tags: [method]
```

```Go
func (s *Store) WriteResultChunks(ctx context.Context, bundleID int, resultChunks chan semantic.IndexedResultChunkData) (err error)
```

WriteResultChunks is called (transactionally) from the precise-code-intel-worker. 

#### <a id="Store.definitionsReferences" href="#Store.definitionsReferences">func (s *Store) definitionsReferences(ctx context.Context, extractor func(r semantic.RangeData) semantic.ID, operation *observation.Operation, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.definitionsReferences
tags: [method private]
```

```Go
func (s *Store) definitionsReferences(ctx context.Context, extractor func(r semantic.RangeData) semantic.ID, operation *observation.Operation, bundleID int, path string, line, character, limit, offset int) (_ []Location, _ int, err error)
```

#### <a id="Store.locations" href="#Store.locations">func (s *Store) locations(ctx context.Context, bundleID int, ids []semantic.ID, limit, offset int) (_ map[semantic.ID][]Location, _ int, err error)</a>

```
searchKey: lsifstore.Store.locations
tags: [method private]
```

```Go
func (s *Store) locations(ctx context.Context, bundleID int, ids []semantic.ID, limit, offset int) (_ map[semantic.ID][]Location, _ int, err error)
```

locations queries the locations associated with the given definition or reference identifiers. This method returns a map from result set identifiers to another map from document paths to locations within that document, as well as a total count of locations within the map. 

#### <a id="Store.locationsWithinFile" href="#Store.locationsWithinFile">func (s *Store) locationsWithinFile(ctx context.Context, bundleID int, ids []semantic.ID, path string, documentData semantic.DocumentData) (_ map[semantic.ID][]Location, err error)</a>

```
searchKey: lsifstore.Store.locationsWithinFile
tags: [method private]
```

```Go
func (s *Store) locationsWithinFile(ctx context.Context, bundleID int, ids []semantic.ID, path string, documentData semantic.DocumentData) (_ map[semantic.ID][]Location, err error)
```

locationsWithinFile queries the file-local locations associated with the given definition or reference identifiers. Like locations, this method returns a map from result set identifiers to another map from document paths to locations within that document. 

#### <a id="Store.makeDocumentVisitor" href="#Store.makeDocumentVisitor">func (s *Store) makeDocumentVisitor(f func(string, semantic.DocumentData)) func(rows *sql.Rows, queryErr error) error</a>

```
searchKey: lsifstore.Store.makeDocumentVisitor
tags: [method private]
```

```Go
func (s *Store) makeDocumentVisitor(f func(string, semantic.DocumentData)) func(rows *sql.Rows, queryErr error) error
```

makeDocumentVisitor returns a function that calls the given visitor function over each matching decoded document value. 

#### <a id="Store.makeResultChunkVisitor" href="#Store.makeResultChunkVisitor">func (s *Store) makeResultChunkVisitor(rows *sql.Rows, queryErr error) func(func(int, semantic.ResultChunkData)) error</a>

```
searchKey: lsifstore.Store.makeResultChunkVisitor
tags: [method private]
```

```Go
func (s *Store) makeResultChunkVisitor(rows *sql.Rows, queryErr error) func(func(int, semantic.ResultChunkData)) error
```

makeResultChunkVisitor returns a function that accepts a mapping function, reads result chunk values from the given row object and calls the mapping function on each decoded result set. 

#### <a id="Store.readLocationsFromResultChunks" href="#Store.readLocationsFromResultChunks">func (s *Store) readLocationsFromResultChunks(ctx context.Context, bundleID int, ids []semantic.ID, indexes []int, targetPath string) (map[semantic.ID]map[string][]semantic.ID, int, error)</a>

```
searchKey: lsifstore.Store.readLocationsFromResultChunks
tags: [method private]
```

```Go
func (s *Store) readLocationsFromResultChunks(ctx context.Context, bundleID int, ids []semantic.ID, indexes []int, targetPath string) (map[semantic.ID]map[string][]semantic.ID, int, error)
```

readLocationsFromResultChunks reads the given result chunk indexes for a given bundle. This method returns a map from documents to range identifiers that compose each of the given input result set identifiers. If a non-empty target path is supplied, then any range falling outside that document path will be omitted from the output. 

#### <a id="Store.readRangesFromDocument" href="#Store.readRangesFromDocument">func (s *Store) readRangesFromDocument(bundleID int, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, locationsByResultID map[semantic.ID][]Location, path string, document semantic.DocumentData, traceLog observation.TraceLogger) int</a>

```
searchKey: lsifstore.Store.readRangesFromDocument
tags: [method private]
```

```Go
func (s *Store) readRangesFromDocument(bundleID int, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, locationsByResultID map[semantic.ID][]Location, path string, document semantic.DocumentData, traceLog observation.TraceLogger) int
```

readRangesFromDocument extracts range data from the given document. This method populates the given locationsByResultId map, which resolves the missing data given via the rangeIDsByResultID parameter. This method returns a total count of ranges in the result set. 

#### <a id="Store.readRangesFromDocuments" href="#Store.readRangesFromDocuments">func (s *Store) readRangesFromDocuments(ctx context.Context, bundleID int, ids []semantic.ID, paths []string, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, traceLog observation.TraceLogger) (map[semantic.ID][]Location, int, error)</a>

```
searchKey: lsifstore.Store.readRangesFromDocuments
tags: [method private]
```

```Go
func (s *Store) readRangesFromDocuments(ctx context.Context, bundleID int, ids []semantic.ID, paths []string, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, traceLog observation.TraceLogger) (map[semantic.ID][]Location, int, error)
```

readRangesFromDocuments extracts range data from the documents with the given paths. This method returns a map from result set identifiers to the set of locations composing that result set. The output resolves the missing data given via the rangeIDsByResultID parameter. This method also returns a total count of ranges in the result set. 

#### <a id="Store.scanDocumentData" href="#Store.scanDocumentData">func (s *Store) scanDocumentData(rows *sql.Rows, queryErr error) (_ []QualifiedDocumentData, err error)</a>

```
searchKey: lsifstore.Store.scanDocumentData
tags: [method private]
```

```Go
func (s *Store) scanDocumentData(rows *sql.Rows, queryErr error) (_ []QualifiedDocumentData, err error)
```

scanDocumentData reads qualified document data from the given row object. 

#### <a id="Store.scanFirstDocumentData" href="#Store.scanFirstDocumentData">func (s *Store) scanFirstDocumentData(rows *sql.Rows, queryErr error) (_ QualifiedDocumentData, _ bool, err error)</a>

```
searchKey: lsifstore.Store.scanFirstDocumentData
tags: [method private]
```

```Go
func (s *Store) scanFirstDocumentData(rows *sql.Rows, queryErr error) (_ QualifiedDocumentData, _ bool, err error)
```

scanFirstDocumentData reads qualified document data from its given row object and returns the first one. If no rows match the query, a false-valued flag is returned. 

#### <a id="Store.scanFirstDocumentationPageData" href="#Store.scanFirstDocumentationPageData">func (s *Store) scanFirstDocumentationPageData(rows *sql.Rows, queryErr error) (_ *semantic.DocumentationPageData, err error)</a>

```
searchKey: lsifstore.Store.scanFirstDocumentationPageData
tags: [method private]
```

```Go
func (s *Store) scanFirstDocumentationPageData(rows *sql.Rows, queryErr error) (_ *semantic.DocumentationPageData, err error)
```

scanFirstDocumentationPageData reads the first DocumentationPageData row. If no rows match the query, a nil is returned. 

#### <a id="Store.scanQualifiedMonikerLocations" href="#Store.scanQualifiedMonikerLocations">func (s *Store) scanQualifiedMonikerLocations(rows *sql.Rows, queryErr error) (_ []QualifiedMonikerLocations, err error)</a>

```
searchKey: lsifstore.Store.scanQualifiedMonikerLocations
tags: [method private]
```

```Go
func (s *Store) scanQualifiedMonikerLocations(rows *sql.Rows, queryErr error) (_ []QualifiedMonikerLocations, err error)
```

scanQualifiedMonikerLocations reads moniker locations values from the given row object. 

#### <a id="Store.scanSingleDocumentDataObject" href="#Store.scanSingleDocumentDataObject">func (s *Store) scanSingleDocumentDataObject(rows *sql.Rows) (QualifiedDocumentData, error)</a>

```
searchKey: lsifstore.Store.scanSingleDocumentDataObject
tags: [method private]
```

```Go
func (s *Store) scanSingleDocumentDataObject(rows *sql.Rows) (QualifiedDocumentData, error)
```

scanSingleDocumentDataObject populates a qualified document data value from the given cursor. 

#### <a id="Store.scanSingleQualifiedMonikerLocationsObject" href="#Store.scanSingleQualifiedMonikerLocationsObject">func (s *Store) scanSingleQualifiedMonikerLocationsObject(rows *sql.Rows) (QualifiedMonikerLocations, error)</a>

```
searchKey: lsifstore.Store.scanSingleQualifiedMonikerLocationsObject
tags: [method private]
```

```Go
func (s *Store) scanSingleQualifiedMonikerLocationsObject(rows *sql.Rows) (QualifiedMonikerLocations, error)
```

scanSingleQualifiedMonikerLocationsObject populates a qualified moniker locations value from the given cursor. 

#### <a id="Store.translateIDsToResultChunkIndexes" href="#Store.translateIDsToResultChunkIndexes">func (s *Store) translateIDsToResultChunkIndexes(ctx context.Context, bundleID int, ids []semantic.ID) ([]int, error)</a>

```
searchKey: lsifstore.Store.translateIDsToResultChunkIndexes
tags: [method private]
```

```Go
func (s *Store) translateIDsToResultChunkIndexes(ctx context.Context, bundleID int, ids []semantic.ID) ([]int, error)
```

translateIDsToResultChunkIndexes converts a set of result set identifiers within a given bundle into a deduplicated and sorted set of result chunk indexes that compoletely cover those identifiers. 

#### <a id="Store.writeDefinitionReferences" href="#Store.writeDefinitionReferences">func (s *Store) writeDefinitionReferences(ctx context.Context, bundleID int, tableName string, version int, monikerLocations chan semantic.MonikerLocations, traceLog observation.TraceLogger) (err error)</a>

```
searchKey: lsifstore.Store.writeDefinitionReferences
tags: [method private]
```

```Go
func (s *Store) writeDefinitionReferences(ctx context.Context, bundleID int, tableName string, version int, monikerLocations chan semantic.MonikerLocations, traceLog observation.TraceLogger) (err error)
```

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: lsifstore.operations
tags: [struct private]
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
tags: [function private]
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestClear" href="#TestClear">func TestClear(t *testing.T)</a>

```
searchKey: lsifstore.TestClear
tags: [function private test]
```

```Go
func TestClear(t *testing.T)
```

### <a id="TestDatabaseBulkMonikerResults" href="#TestDatabaseBulkMonikerResults">func TestDatabaseBulkMonikerResults(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseBulkMonikerResults
tags: [function private test]
```

```Go
func TestDatabaseBulkMonikerResults(t *testing.T)
```

### <a id="TestDatabaseDefinitions" href="#TestDatabaseDefinitions">func TestDatabaseDefinitions(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseDefinitions
tags: [function private test]
```

```Go
func TestDatabaseDefinitions(t *testing.T)
```

### <a id="TestDatabaseExists" href="#TestDatabaseExists">func TestDatabaseExists(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseExists
tags: [function private test]
```

```Go
func TestDatabaseExists(t *testing.T)
```

### <a id="TestDatabaseHover" href="#TestDatabaseHover">func TestDatabaseHover(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseHover
tags: [function private test]
```

```Go
func TestDatabaseHover(t *testing.T)
```

### <a id="TestDatabaseMonikersByPosition" href="#TestDatabaseMonikersByPosition">func TestDatabaseMonikersByPosition(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseMonikersByPosition
tags: [function private test]
```

```Go
func TestDatabaseMonikersByPosition(t *testing.T)
```

### <a id="TestDatabasePackageInformation" href="#TestDatabasePackageInformation">func TestDatabasePackageInformation(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabasePackageInformation
tags: [function private test]
```

```Go
func TestDatabasePackageInformation(t *testing.T)
```

### <a id="TestDatabaseRanges" href="#TestDatabaseRanges">func TestDatabaseRanges(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseRanges
tags: [function private test]
```

```Go
func TestDatabaseRanges(t *testing.T)
```

### <a id="TestDatabaseReferences" href="#TestDatabaseReferences">func TestDatabaseReferences(t *testing.T)</a>

```
searchKey: lsifstore.TestDatabaseReferences
tags: [function private test]
```

```Go
func TestDatabaseReferences(t *testing.T)
```

### <a id="TestDocumentData" href="#TestDocumentData">func TestDocumentData(t *testing.T)</a>

```
searchKey: lsifstore.TestDocumentData
tags: [function private test]
```

```Go
func TestDocumentData(t *testing.T)
```

### <a id="TestLocations" href="#TestLocations">func TestLocations(t *testing.T)</a>

```
searchKey: lsifstore.TestLocations
tags: [function private test]
```

```Go
func TestLocations(t *testing.T)
```

### <a id="TestResultChunkData" href="#TestResultChunkData">func TestResultChunkData(t *testing.T)</a>

```
searchKey: lsifstore.TestResultChunkData
tags: [function private test]
```

```Go
func TestResultChunkData(t *testing.T)
```

### <a id="compareBundleRanges" href="#compareBundleRanges">func compareBundleRanges(r1, r2 Range) bool</a>

```
searchKey: lsifstore.compareBundleRanges
tags: [function private]
```

```Go
func compareBundleRanges(r1, r2 Range) bool
```

compareBundleRanges returns true if r1's start position occurs before r2's start position. 

### <a id="extractResultIDs" href="#extractResultIDs">func extractResultIDs(ranges []semantic.RangeData, fn func(r semantic.RangeData) semantic.ID) []semantic.ID</a>

```
searchKey: lsifstore.extractResultIDs
tags: [function private]
```

```Go
func extractResultIDs(ranges []semantic.RangeData, fn func(r semantic.RangeData) semantic.ID) []semantic.ID
```

extractResultIDs extracts result identifiers from each range in the given list. The output list is relative to the input range list, but with duplicates removed. 

### <a id="idsToString" href="#idsToString">func idsToString(vs []semantic.ID) string</a>

```
searchKey: lsifstore.idsToString
tags: [function private]
```

```Go
func idsToString(vs []semantic.ID) string
```

### <a id="init.serializer.go" href="#init.serializer.go">func init()</a>

```
searchKey: lsifstore.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.serializer_documentation.go" href="#init.serializer_documentation.go">func init()</a>

```
searchKey: lsifstore.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.store_test.go" href="#init.store_test.go">func init()</a>

```
searchKey: lsifstore.init
tags: [function private]
```

```Go
func init()
```

### <a id="intsToString" href="#intsToString">func intsToString(vs []int) string</a>

```
searchKey: lsifstore.intsToString
tags: [function private]
```

```Go
func intsToString(vs []int) string
```

### <a id="limitResultMap" href="#limitResultMap">func limitResultMap(ids []semantic.ID, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, limit, offset int) (limited map[semantic.ID]map[string][]semantic.ID, referencedPaths []string)</a>

```
searchKey: lsifstore.limitResultMap
tags: [function private]
```

```Go
func limitResultMap(ids []semantic.ID, rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID, limit, offset int) (limited map[semantic.ID]map[string][]semantic.ID, referencedPaths []string)
```

limitResultMap returns a map symmetric to the given rangeIDsByResultID that includes only the location results on the current page specified by limit and offset, as well as a deduplicated and sorted list of paths that exist in the second-level of the returned map. 

### <a id="monikersToString" href="#monikersToString">func monikersToString(vs []semantic.MonikerData) string</a>

```
searchKey: lsifstore.monikersToString
tags: [function private]
```

```Go
func monikersToString(vs []semantic.MonikerData) string
```

### <a id="pathsFromResultMap" href="#pathsFromResultMap">func pathsFromResultMap(rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID) []string</a>

```
searchKey: lsifstore.pathsFromResultMap
tags: [function private]
```

```Go
func pathsFromResultMap(rangeIDsByResultID map[semantic.ID]map[string][]semantic.ID) []string
```

pathsFromResultMap returns a deduplicated and sorted set of document paths present in the given map. 

### <a id="sortLocations" href="#sortLocations">func sortLocations(locations []Location)</a>

```
searchKey: lsifstore.sortLocations
tags: [function private]
```

```Go
func sortLocations(locations []Location)
```

sortLocations sorts locations by document, then by offset within a document. 

### <a id="withBatchInserter" href="#withBatchInserter">func withBatchInserter(ctx context.Context, db dbutil.DB, tableName string, columns []string, f func(inserter *batch.Inserter) error) (err error)</a>

```
searchKey: lsifstore.withBatchInserter
tags: [function private]
```

```Go
func withBatchInserter(ctx context.Context, db dbutil.DB, tableName string, columns []string, f func(inserter *batch.Inserter) error) (err error)
```

withBatchInserter runs batch.WithInserter in a number of goroutines proportional to the maximum number of CPUs that can be executing simultaneously. 

