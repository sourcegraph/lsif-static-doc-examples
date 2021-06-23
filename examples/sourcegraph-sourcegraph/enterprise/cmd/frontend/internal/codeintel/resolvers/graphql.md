# Package graphql

## Index

* [Constants](#const)
    * [const DefaultReferencesPageSize](#DefaultReferencesPageSize)
    * [const DefaultDiagnosticsPageSize](#DefaultDiagnosticsPageSize)
    * [const DefaultUploadPageSize](#DefaultUploadPageSize)
    * [const DefaultIndexPageSize](#DefaultIndexPageSize)
    * [const numRoutines](#numRoutines)
    * [const numRepositories](#numRepositories)
    * [const numCommits](#numCommits)
    * [const numPaths](#numPaths)
* [Variables](#var)
    * [var severities](#severities)
    * [var ErrIllegalLimit](#ErrIllegalLimit)
    * [var ErrIllegalBounds](#ErrIllegalBounds)
    * [var errAutoIndexingNotEnabled](#errAutoIndexingNotEnabled)
    * [var autoIndexingEnabled](#autoIndexingEnabled)
* [Types](#type)
    * [type DiagnosticResolver struct](#DiagnosticResolver)
        * [func (r *DiagnosticResolver) Severity() (*string, error)](#DiagnosticResolver.Severity)
        * [func (r *DiagnosticResolver) Code() (*string, error)](#DiagnosticResolver.Code)
        * [func (r *DiagnosticResolver) Source() (*string, error)](#DiagnosticResolver.Source)
        * [func (r *DiagnosticResolver) Message() (*string, error)](#DiagnosticResolver.Message)
        * [func (r *DiagnosticResolver) Location(ctx context.Context) (gql.LocationResolver, error)](#DiagnosticResolver.Location)
    * [type DiagnosticConnectionResolver struct](#DiagnosticConnectionResolver)
        * [func (r *DiagnosticConnectionResolver) Nodes(ctx context.Context) ([]gql.DiagnosticResolver, error)](#DiagnosticConnectionResolver.Nodes)
        * [func (r *DiagnosticConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#DiagnosticConnectionResolver.TotalCount)
        * [func (r *DiagnosticConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#DiagnosticConnectionResolver.PageInfo)
    * [type executionLogEntryResolver struct](#executionLogEntryResolver)
        * [func (r *executionLogEntryResolver) Key() string](#executionLogEntryResolver.Key)
        * [func (r *executionLogEntryResolver) Command() []string](#executionLogEntryResolver.Command)
        * [func (r *executionLogEntryResolver) ExitCode() int32](#executionLogEntryResolver.ExitCode)
        * [func (r *executionLogEntryResolver) StartTime() gql.DateTime](#executionLogEntryResolver.StartTime)
        * [func (r *executionLogEntryResolver) DurationMilliseconds() int32](#executionLogEntryResolver.DurationMilliseconds)
        * [func (r *executionLogEntryResolver) Out(ctx context.Context) (string, error)](#executionLogEntryResolver.Out)
    * [type HoverResolver struct](#HoverResolver)
        * [func (r *HoverResolver) Markdown() gql.Markdown](#HoverResolver.Markdown)
        * [func (r *HoverResolver) Range() gql.RangeResolver](#HoverResolver.Range)
    * [type IndexResolver struct](#IndexResolver)
        * [func (r *IndexResolver) ID() graphql.ID](#IndexResolver.ID)
        * [func (r *IndexResolver) InputCommit() string](#IndexResolver.InputCommit)
        * [func (r *IndexResolver) InputRoot() string](#IndexResolver.InputRoot)
        * [func (r *IndexResolver) InputIndexer() string](#IndexResolver.InputIndexer)
        * [func (r *IndexResolver) QueuedAt() gql.DateTime](#IndexResolver.QueuedAt)
        * [func (r *IndexResolver) Failure() *string](#IndexResolver.Failure)
        * [func (r *IndexResolver) StartedAt() *gql.DateTime](#IndexResolver.StartedAt)
        * [func (r *IndexResolver) FinishedAt() *gql.DateTime](#IndexResolver.FinishedAt)
        * [func (r *IndexResolver) Steps() gql.IndexStepsResolver](#IndexResolver.Steps)
        * [func (r *IndexResolver) PlaceInQueue() *int32](#IndexResolver.PlaceInQueue)
        * [func (r *IndexResolver) State() string](#IndexResolver.State)
        * [func (r *IndexResolver) AssociatedUpload(ctx context.Context) (gql.LSIFUploadResolver, error)](#IndexResolver.AssociatedUpload)
        * [func (r *IndexResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)](#IndexResolver.ProjectRoot)
    * [type IndexConfigurationResolver struct](#IndexConfigurationResolver)
        * [func (r *IndexConfigurationResolver) Configuration() *string](#IndexConfigurationResolver.Configuration)
    * [type IndexConnectionResolver struct](#IndexConnectionResolver)
        * [func (r *IndexConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFIndexResolver, error)](#IndexConnectionResolver.Nodes)
        * [func (r *IndexConnectionResolver) TotalCount(ctx context.Context) (*int32, error)](#IndexConnectionResolver.TotalCount)
        * [func (r *IndexConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#IndexConnectionResolver.PageInfo)
    * [type indexStepsResolver struct](#indexStepsResolver)
        * [func (r *indexStepsResolver) Setup() []gql.ExecutionLogEntryResolver](#indexStepsResolver.Setup)
        * [func (r *indexStepsResolver) PreIndex() []gql.PreIndexStepResolver](#indexStepsResolver.PreIndex)
        * [func (r *indexStepsResolver) Index() gql.IndexStepResolver](#indexStepsResolver.Index)
        * [func (r *indexStepsResolver) Upload() gql.ExecutionLogEntryResolver](#indexStepsResolver.Upload)
        * [func (r *indexStepsResolver) Teardown() []gql.ExecutionLogEntryResolver](#indexStepsResolver.Teardown)
        * [func (r *indexStepsResolver) findExecutionLogEntry(key string) (workerutil.ExecutionLogEntry, bool)](#indexStepsResolver.findExecutionLogEntry)
        * [func (r *indexStepsResolver) executionLogEntryResolversWithPrefix(prefix string) []gql.ExecutionLogEntryResolver](#indexStepsResolver.executionLogEntryResolversWithPrefix)
    * [type indexStepResolver struct](#indexStepResolver)
        * [func (r *indexStepResolver) IndexerArgs() []string](#indexStepResolver.IndexerArgs)
        * [func (r *indexStepResolver) Outfile() *string](#indexStepResolver.Outfile)
        * [func (r *indexStepResolver) LogEntry() gql.ExecutionLogEntryResolver](#indexStepResolver.LogEntry)
    * [type preIndexStepResolver struct](#preIndexStepResolver)
        * [func (r *preIndexStepResolver) Root() string](#preIndexStepResolver.Root)
        * [func (r *preIndexStepResolver) Image() string](#preIndexStepResolver.Image)
        * [func (r *preIndexStepResolver) Commands() []string](#preIndexStepResolver.Commands)
        * [func (r *preIndexStepResolver) LogEntry() gql.ExecutionLogEntryResolver](#preIndexStepResolver.LogEntry)
    * [type LocationConnectionResolver struct](#LocationConnectionResolver)
        * [func (r *LocationConnectionResolver) Nodes(ctx context.Context) ([]gql.LocationResolver, error)](#LocationConnectionResolver.Nodes)
        * [func (r *LocationConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#LocationConnectionResolver.PageInfo)
    * [type CachedLocationResolver struct](#CachedLocationResolver)
        * [func NewCachedLocationResolver(db dbutil.DB) *CachedLocationResolver](#NewCachedLocationResolver)
        * [func (r *CachedLocationResolver) Repository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)](#CachedLocationResolver.Repository)
        * [func (r *CachedLocationResolver) Commit(ctx context.Context, id api.RepoID, commit string) (*gql.GitCommitResolver, error)](#CachedLocationResolver.Commit)
        * [func (r *CachedLocationResolver) Path(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)](#CachedLocationResolver.Path)
        * [func (r *CachedLocationResolver) cachedRepository(ctx context.Context, id api.RepoID) (*cachedRepositoryResolver, error)](#CachedLocationResolver.cachedRepository)
        * [func (r *CachedLocationResolver) cachedCommit(ctx context.Context, id api.RepoID, commit string) (*cachedCommitResolver, error)](#CachedLocationResolver.cachedCommit)
        * [func (r *CachedLocationResolver) cachedPath(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)](#CachedLocationResolver.cachedPath)
        * [func (r *CachedLocationResolver) resolveRepository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)](#CachedLocationResolver.resolveRepository)
        * [func (r *CachedLocationResolver) resolveCommit(ctx context.Context, repositoryResolver *gql.RepositoryResolver, commit string) (*gql.GitCommitResolver, error)](#CachedLocationResolver.resolveCommit)
        * [func (r *CachedLocationResolver) resolvePath(ctx context.Context, commitResolver *gql.GitCommitResolver, path string) (*gql.GitTreeEntryResolver, error)](#CachedLocationResolver.resolvePath)
    * [type cachedRepositoryResolver struct](#cachedRepositoryResolver)
    * [type cachedCommitResolver struct](#cachedCommitResolver)
    * [type Prefetcher struct](#Prefetcher)
        * [func NewPrefetcher(resolver resolvers.Resolver) *Prefetcher](#NewPrefetcher)
        * [func (p *Prefetcher) MarkUpload(id int)](#Prefetcher.MarkUpload)
        * [func (p *Prefetcher) GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)](#Prefetcher.GetUploadByID)
        * [func (p *Prefetcher) MarkIndex(id int)](#Prefetcher.MarkIndex)
        * [func (p *Prefetcher) GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)](#Prefetcher.GetIndexByID)
    * [type QueryResolver struct](#QueryResolver)
        * [func (r *QueryResolver) ToGitTreeLSIFData() (gql.GitTreeLSIFDataResolver, bool)](#QueryResolver.ToGitTreeLSIFData)
        * [func (r *QueryResolver) ToGitBlobLSIFData() (gql.GitBlobLSIFDataResolver, bool)](#QueryResolver.ToGitBlobLSIFData)
        * [func (r *QueryResolver) Ranges(ctx context.Context, args *gql.LSIFRangesArgs) (gql.CodeIntelligenceRangeConnectionResolver, error)](#QueryResolver.Ranges)
        * [func (r *QueryResolver) Definitions(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.LocationConnectionResolver, error)](#QueryResolver.Definitions)
        * [func (r *QueryResolver) References(ctx context.Context, args *gql.LSIFPagedQueryPositionArgs) (gql.LocationConnectionResolver, error)](#QueryResolver.References)
        * [func (r *QueryResolver) Hover(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.HoverResolver, error)](#QueryResolver.Hover)
        * [func (r *QueryResolver) Diagnostics(ctx context.Context, args *gql.LSIFDiagnosticsArgs) (gql.DiagnosticConnectionResolver, error)](#QueryResolver.Diagnostics)
        * [func (r *QueryResolver) DocumentationPage(ctx context.Context, args *gql.LSIFDocumentationPageArgs) (gql.DocumentationPageResolver, error)](#QueryResolver.DocumentationPage)
    * [type DocumentationPageResolver struct](#DocumentationPageResolver)
        * [func (r *DocumentationPageResolver) Tree() gql.JSONValue](#DocumentationPageResolver.Tree)
    * [type CodeIntelligenceRangeResolver struct](#CodeIntelligenceRangeResolver)
        * [func (r *CodeIntelligenceRangeResolver) Range(ctx context.Context) (gql.RangeResolver, error)](#CodeIntelligenceRangeResolver.Range)
        * [func (r *CodeIntelligenceRangeResolver) Definitions(ctx context.Context) (gql.LocationConnectionResolver, error)](#CodeIntelligenceRangeResolver.Definitions)
        * [func (r *CodeIntelligenceRangeResolver) References(ctx context.Context) (gql.LocationConnectionResolver, error)](#CodeIntelligenceRangeResolver.References)
        * [func (r *CodeIntelligenceRangeResolver) Hover(ctx context.Context) (gql.HoverResolver, error)](#CodeIntelligenceRangeResolver.Hover)
    * [type CodeIntelligenceRangeConnectionResolver struct](#CodeIntelligenceRangeConnectionResolver)
        * [func (r *CodeIntelligenceRangeConnectionResolver) Nodes(ctx context.Context) ([]gql.CodeIntelligenceRangeResolver, error)](#CodeIntelligenceRangeConnectionResolver.Nodes)
    * [type Resolver struct](#Resolver)
        * [func (r *Resolver) NodeResolvers() map[string]gql.NodeByIDFunc](#Resolver.NodeResolvers)
        * [func (r *Resolver) LSIFUploadByID(ctx context.Context, id graphql.ID) (gql.LSIFUploadResolver, error)](#Resolver.LSIFUploadByID)
        * [func (r *Resolver) LSIFUploads(ctx context.Context, args *gql.LSIFUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)](#Resolver.LSIFUploads)
        * [func (r *Resolver) LSIFUploadsByRepo(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)](#Resolver.LSIFUploadsByRepo)
        * [func (r *Resolver) DeleteLSIFUpload(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)](#Resolver.DeleteLSIFUpload)
        * [func (r *Resolver) LSIFIndexByID(ctx context.Context, id graphql.ID) (gql.LSIFIndexResolver, error)](#Resolver.LSIFIndexByID)
        * [func (r *Resolver) LSIFIndexes(ctx context.Context, args *gql.LSIFIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)](#Resolver.LSIFIndexes)
        * [func (r *Resolver) LSIFIndexesByRepo(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)](#Resolver.LSIFIndexesByRepo)
        * [func (r *Resolver) DeleteLSIFIndex(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)](#Resolver.DeleteLSIFIndex)
        * [func (r *Resolver) IndexConfiguration(ctx context.Context, id graphql.ID) (gql.IndexConfigurationResolver, error)](#Resolver.IndexConfiguration)
        * [func (r *Resolver) UpdateRepositoryIndexConfiguration(ctx context.Context, args *gql.UpdateRepositoryIndexConfigurationArgs) (*gql.EmptyResponse, error)](#Resolver.UpdateRepositoryIndexConfiguration)
        * [func (r *Resolver) CommitGraph(ctx context.Context, id graphql.ID) (gql.CodeIntelligenceCommitGraphResolver, error)](#Resolver.CommitGraph)
        * [func (r *Resolver) QueueAutoIndexJobForRepo(ctx context.Context, args *struct{ Repository graphql.ID }) (*gql.EmptyResponse, error)](#Resolver.QueueAutoIndexJobForRepo)
        * [func (r *Resolver) GitBlobLSIFData(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (gql.GitBlobLSIFDataResolver, error)](#Resolver.GitBlobLSIFData)
    * [type UploadResolver struct](#UploadResolver)
        * [func (r *UploadResolver) ID() graphql.ID](#UploadResolver.ID)
        * [func (r *UploadResolver) InputCommit() string](#UploadResolver.InputCommit)
        * [func (r *UploadResolver) InputRoot() string](#UploadResolver.InputRoot)
        * [func (r *UploadResolver) IsLatestForRepo() bool](#UploadResolver.IsLatestForRepo)
        * [func (r *UploadResolver) UploadedAt() gql.DateTime](#UploadResolver.UploadedAt)
        * [func (r *UploadResolver) Failure() *string](#UploadResolver.Failure)
        * [func (r *UploadResolver) StartedAt() *gql.DateTime](#UploadResolver.StartedAt)
        * [func (r *UploadResolver) FinishedAt() *gql.DateTime](#UploadResolver.FinishedAt)
        * [func (r *UploadResolver) InputIndexer() string](#UploadResolver.InputIndexer)
        * [func (r *UploadResolver) PlaceInQueue() *int32](#UploadResolver.PlaceInQueue)
        * [func (r *UploadResolver) State() string](#UploadResolver.State)
        * [func (r *UploadResolver) AssociatedIndex(ctx context.Context) (gql.LSIFIndexResolver, error)](#UploadResolver.AssociatedIndex)
        * [func (r *UploadResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)](#UploadResolver.ProjectRoot)
    * [type UploadConnectionResolver struct](#UploadConnectionResolver)
        * [func (r *UploadConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFUploadResolver, error)](#UploadConnectionResolver.Nodes)
        * [func (r *UploadConnectionResolver) TotalCount(ctx context.Context) (*int32, error)](#UploadConnectionResolver.TotalCount)
        * [func (r *UploadConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#UploadConnectionResolver.PageInfo)
* [Functions](#func)
    * [func encodeCursor(val *string) *graphqlutil.PageInfo](#encodeCursor)
    * [func decodeCursor(val *string) (string, error)](#decodeCursor)
    * [func encodeIntCursor(val *int32) *graphqlutil.PageInfo](#encodeIntCursor)
    * [func decodeIntCursor(val *string) (int, error)](#decodeIntCursor)
    * [func NewDiagnosticResolver(diagnostic resolvers.AdjustedDiagnostic, locationResolver *CachedLocationResolver) gql.DiagnosticResolver](#NewDiagnosticResolver)
    * [func toSeverity(val int) (*string, error)](#toSeverity)
    * [func NewDiagnosticConnectionResolver(diagnostics []resolvers.AdjustedDiagnostic, totalCount int, locationResolver *CachedLocationResolver) gql.DiagnosticConnectionResolver](#NewDiagnosticConnectionResolver)
    * [func NewHoverResolver(text string, lspRange lsp.Range) gql.HoverResolver](#NewHoverResolver)
    * [func marshalLSIFUploadGQLID(uploadID int64) graphql.ID](#marshalLSIFUploadGQLID)
    * [func unmarshalLSIFUploadGQLID(id graphql.ID) (uploadID int64, err error)](#unmarshalLSIFUploadGQLID)
    * [func marshalLSIFIndexGQLID(indexID int64) graphql.ID](#marshalLSIFIndexGQLID)
    * [func unmarshalLSIFIndexGQLID(id graphql.ID) (indexID int64, err error)](#unmarshalLSIFIndexGQLID)
    * [func NewIndexResolver(index store.Index, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexResolver](#NewIndexResolver)
    * [func NewIndexConfigurationResolver(configuration []byte) gql.IndexConfigurationResolver](#NewIndexConfigurationResolver)
    * [func NewIndexConnectionResolver(resolver *resolvers.IndexesResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexConnectionResolver](#NewIndexConnectionResolver)
    * [func NewLocationConnectionResolver(locations []resolvers.AdjustedLocation, cursor *string, locationResolver *CachedLocationResolver) gql.LocationConnectionResolver](#NewLocationConnectionResolver)
    * [func resolveLocations(ctx context.Context, locationResolver *CachedLocationResolver, locations []resolvers.AdjustedLocation) ([]gql.LocationResolver, error)](#resolveLocations)
    * [func resolveLocation(ctx context.Context, locationResolver *CachedLocationResolver, location resolvers.AdjustedLocation) (gql.LocationResolver, error)](#resolveLocation)
    * [func NewQueryResolver(resolver resolvers.QueryResolver, locationResolver *CachedLocationResolver) gql.GitBlobLSIFDataResolver](#NewQueryResolver)
    * [func NewResolver(db dbutil.DB, resolver resolvers.Resolver) gql.CodeIntelResolver](#NewResolver)
    * [func makeGetUploadsOptions(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (store.GetUploadsOptions, error)](#makeGetUploadsOptions)
    * [func makeGetIndexesOptions(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (store.GetIndexesOptions, error)](#makeGetIndexesOptions)
    * [func resolveRepositoryID(ctx context.Context, id graphql.ID) (int, error)](#resolveRepositoryID)
    * [func NewUploadResolver(upload store.Upload, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadResolver](#NewUploadResolver)
    * [func NewUploadConnectionResolver(resolver *resolvers.UploadsResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadConnectionResolver](#NewUploadConnectionResolver)
    * [func strPtr(val string) *string](#strPtr)
    * [func intPtr(val int32) *int32](#intPtr)
    * [func boolPtr(val bool) *bool](#boolPtr)
    * [func toInt32(val *int) *int32](#toInt32)
    * [func derefString(val *string, defaultValue string) string](#derefString)
    * [func derefInt32(val *int32, defaultValue int) int](#derefInt32)
    * [func derefBool(val *bool, defaultValue bool) bool](#derefBool)
    * [func convertRange(r lsifstore.Range) lsp.Range](#convertRange)
    * [func convertPosition(line, character int) lsp.Position](#convertPosition)
    * [func TestCursor(t *testing.T)](#TestCursor)
    * [func TestCursorEmpty(t *testing.T)](#TestCursorEmpty)
    * [func TestIntCursor(t *testing.T)](#TestIntCursor)
    * [func TestIntCursorEmpty(t *testing.T)](#TestIntCursorEmpty)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestUploadID(t *testing.T)](#TestUploadID)
    * [func TestUnmarshalUploadIDString(t *testing.T)](#TestUnmarshalUploadIDString)
    * [func TestIndexID(t *testing.T)](#TestIndexID)
    * [func TestCachedLocationResolver(t *testing.T)](#TestCachedLocationResolver)
    * [func TestCachedLocationResolverUnknownRepository(t *testing.T)](#TestCachedLocationResolverUnknownRepository)
    * [func TestCachedLocationResolverUnknownCommit(t *testing.T)](#TestCachedLocationResolverUnknownCommit)
    * [func TestResolveLocations(t *testing.T)](#TestResolveLocations)
    * [func TestPrefetcherUploads(t *testing.T)](#TestPrefetcherUploads)
    * [func TestPrefetcherIndexes(t *testing.T)](#TestPrefetcherIndexes)
    * [func TestRanges(t *testing.T)](#TestRanges)
    * [func TestDefinitions(t *testing.T)](#TestDefinitions)
    * [func TestReferences(t *testing.T)](#TestReferences)
    * [func TestReferencesDefaultLimit(t *testing.T)](#TestReferencesDefaultLimit)
    * [func TestReferencesDefaultIllegalLimit(t *testing.T)](#TestReferencesDefaultIllegalLimit)
    * [func TestHover(t *testing.T)](#TestHover)
    * [func TestDiagnostics(t *testing.T)](#TestDiagnostics)
    * [func TestDiagnosticsDefaultLimit(t *testing.T)](#TestDiagnosticsDefaultLimit)
    * [func TestDiagnosticsDefaultIllegalLimit(t *testing.T)](#TestDiagnosticsDefaultIllegalLimit)
    * [func init()](#init.resolver_test.go)
    * [func TestDeleteLSIFUpload(t *testing.T)](#TestDeleteLSIFUpload)
    * [func TestDeleteLSIFUploadUnauthenticated(t *testing.T)](#TestDeleteLSIFUploadUnauthenticated)
    * [func TestDeleteLSIFIndex(t *testing.T)](#TestDeleteLSIFIndex)
    * [func TestDeleteLSIFIndexUnauthenticated(t *testing.T)](#TestDeleteLSIFIndexUnauthenticated)
    * [func TestMakeGetUploadsOptions(t *testing.T)](#TestMakeGetUploadsOptions)
    * [func TestMakeGetUploadsOptionsDefaults(t *testing.T)](#TestMakeGetUploadsOptionsDefaults)
    * [func TestMakeGetIndexesOptions(t *testing.T)](#TestMakeGetIndexesOptions)
    * [func TestMakeGetIndexesOptionsDefaults(t *testing.T)](#TestMakeGetIndexesOptionsDefaults)
    * [func TestDerefString(t *testing.T)](#TestDerefString)
    * [func TestDerefInt32(t *testing.T)](#TestDerefInt32)
    * [func TestDerefBool(t *testing.T)](#TestDerefBool)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="DefaultReferencesPageSize" href="#DefaultReferencesPageSize">const DefaultReferencesPageSize</a>

```
searchKey: graphql.DefaultReferencesPageSize
```

```Go
const DefaultReferencesPageSize = 100
```

DefaultReferencesPageSize is the reference result page size when no limit is supplied. 

### <a id="DefaultDiagnosticsPageSize" href="#DefaultDiagnosticsPageSize">const DefaultDiagnosticsPageSize</a>

```
searchKey: graphql.DefaultDiagnosticsPageSize
```

```Go
const DefaultDiagnosticsPageSize = 100
```

DefaultDiagnosticsPageSize is the diagnostic result page size when no limit is supplied. 

### <a id="DefaultUploadPageSize" href="#DefaultUploadPageSize">const DefaultUploadPageSize</a>

```
searchKey: graphql.DefaultUploadPageSize
```

```Go
const DefaultUploadPageSize = 50
```

### <a id="DefaultIndexPageSize" href="#DefaultIndexPageSize">const DefaultIndexPageSize</a>

```
searchKey: graphql.DefaultIndexPageSize
```

```Go
const DefaultIndexPageSize = 50
```

### <a id="numRoutines" href="#numRoutines">const numRoutines</a>

```
searchKey: graphql.numRoutines
tags: [private]
```

```Go
const numRoutines = 5
```

### <a id="numRepositories" href="#numRepositories">const numRepositories</a>

```
searchKey: graphql.numRepositories
tags: [private]
```

```Go
const numRepositories = 10
```

### <a id="numCommits" href="#numCommits">const numCommits</a>

```
searchKey: graphql.numCommits
tags: [private]
```

```Go
const numCommits = 10 // per repo

```

### <a id="numPaths" href="#numPaths">const numPaths</a>

```
searchKey: graphql.numPaths
tags: [private]
```

```Go
const numPaths = 10 // per commit

```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="severities" href="#severities">var severities</a>

```
searchKey: graphql.severities
tags: [private]
```

```Go
var severities = map[int]string{
	1: "ERROR",
	2: "WARNING",
	3: "INFORMATION",
	4: "HINT",
}
```

### <a id="ErrIllegalLimit" href="#ErrIllegalLimit">var ErrIllegalLimit</a>

```
searchKey: graphql.ErrIllegalLimit
```

```Go
var ErrIllegalLimit = errors.New("illegal limit")
```

ErrIllegalLimit occurs when the user requests less than one object per page. 

### <a id="ErrIllegalBounds" href="#ErrIllegalBounds">var ErrIllegalBounds</a>

```
searchKey: graphql.ErrIllegalBounds
```

```Go
var ErrIllegalBounds = errors.New("illegal bounds")
```

ErrIllegalBounds occurs when a negative or zero-width bound is supplied by the user. 

### <a id="errAutoIndexingNotEnabled" href="#errAutoIndexingNotEnabled">var errAutoIndexingNotEnabled</a>

```
searchKey: graphql.errAutoIndexingNotEnabled
tags: [private]
```

```Go
var errAutoIndexingNotEnabled = errors.New("precise code intelligence auto indexing is not enabled")
```

### <a id="autoIndexingEnabled" href="#autoIndexingEnabled">var autoIndexingEnabled</a>

```
searchKey: graphql.autoIndexingEnabled
tags: [private]
```

```Go
var autoIndexingEnabled = conf.CodeIntelAutoIndexingEnabled
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="DiagnosticResolver" href="#DiagnosticResolver">type DiagnosticResolver struct</a>

```
searchKey: graphql.DiagnosticResolver
```

```Go
type DiagnosticResolver struct {
	diagnostic       resolvers.AdjustedDiagnostic
	locationResolver *CachedLocationResolver
}
```

#### <a id="DiagnosticResolver.Severity" href="#DiagnosticResolver.Severity">func (r *DiagnosticResolver) Severity() (*string, error)</a>

```
searchKey: graphql.DiagnosticResolver.Severity
```

```Go
func (r *DiagnosticResolver) Severity() (*string, error)
```

#### <a id="DiagnosticResolver.Code" href="#DiagnosticResolver.Code">func (r *DiagnosticResolver) Code() (*string, error)</a>

```
searchKey: graphql.DiagnosticResolver.Code
```

```Go
func (r *DiagnosticResolver) Code() (*string, error)
```

#### <a id="DiagnosticResolver.Source" href="#DiagnosticResolver.Source">func (r *DiagnosticResolver) Source() (*string, error)</a>

```
searchKey: graphql.DiagnosticResolver.Source
```

```Go
func (r *DiagnosticResolver) Source() (*string, error)
```

#### <a id="DiagnosticResolver.Message" href="#DiagnosticResolver.Message">func (r *DiagnosticResolver) Message() (*string, error)</a>

```
searchKey: graphql.DiagnosticResolver.Message
```

```Go
func (r *DiagnosticResolver) Message() (*string, error)
```

#### <a id="DiagnosticResolver.Location" href="#DiagnosticResolver.Location">func (r *DiagnosticResolver) Location(ctx context.Context) (gql.LocationResolver, error)</a>

```
searchKey: graphql.DiagnosticResolver.Location
```

```Go
func (r *DiagnosticResolver) Location(ctx context.Context) (gql.LocationResolver, error)
```

### <a id="DiagnosticConnectionResolver" href="#DiagnosticConnectionResolver">type DiagnosticConnectionResolver struct</a>

```
searchKey: graphql.DiagnosticConnectionResolver
```

```Go
type DiagnosticConnectionResolver struct {
	diagnostics      []resolvers.AdjustedDiagnostic
	totalCount       int
	locationResolver *CachedLocationResolver
}
```

#### <a id="DiagnosticConnectionResolver.Nodes" href="#DiagnosticConnectionResolver.Nodes">func (r *DiagnosticConnectionResolver) Nodes(ctx context.Context) ([]gql.DiagnosticResolver, error)</a>

```
searchKey: graphql.DiagnosticConnectionResolver.Nodes
```

```Go
func (r *DiagnosticConnectionResolver) Nodes(ctx context.Context) ([]gql.DiagnosticResolver, error)
```

#### <a id="DiagnosticConnectionResolver.TotalCount" href="#DiagnosticConnectionResolver.TotalCount">func (r *DiagnosticConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphql.DiagnosticConnectionResolver.TotalCount
```

```Go
func (r *DiagnosticConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="DiagnosticConnectionResolver.PageInfo" href="#DiagnosticConnectionResolver.PageInfo">func (r *DiagnosticConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphql.DiagnosticConnectionResolver.PageInfo
```

```Go
func (r *DiagnosticConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="executionLogEntryResolver" href="#executionLogEntryResolver">type executionLogEntryResolver struct</a>

```
searchKey: graphql.executionLogEntryResolver
tags: [private]
```

```Go
type executionLogEntryResolver struct {
	entry workerutil.ExecutionLogEntry
}
```

#### <a id="executionLogEntryResolver.Key" href="#executionLogEntryResolver.Key">func (r *executionLogEntryResolver) Key() string</a>

```
searchKey: graphql.executionLogEntryResolver.Key
tags: [private]
```

```Go
func (r *executionLogEntryResolver) Key() string
```

#### <a id="executionLogEntryResolver.Command" href="#executionLogEntryResolver.Command">func (r *executionLogEntryResolver) Command() []string</a>

```
searchKey: graphql.executionLogEntryResolver.Command
tags: [private]
```

```Go
func (r *executionLogEntryResolver) Command() []string
```

#### <a id="executionLogEntryResolver.ExitCode" href="#executionLogEntryResolver.ExitCode">func (r *executionLogEntryResolver) ExitCode() int32</a>

```
searchKey: graphql.executionLogEntryResolver.ExitCode
tags: [private]
```

```Go
func (r *executionLogEntryResolver) ExitCode() int32
```

#### <a id="executionLogEntryResolver.StartTime" href="#executionLogEntryResolver.StartTime">func (r *executionLogEntryResolver) StartTime() gql.DateTime</a>

```
searchKey: graphql.executionLogEntryResolver.StartTime
tags: [private]
```

```Go
func (r *executionLogEntryResolver) StartTime() gql.DateTime
```

#### <a id="executionLogEntryResolver.DurationMilliseconds" href="#executionLogEntryResolver.DurationMilliseconds">func (r *executionLogEntryResolver) DurationMilliseconds() int32</a>

```
searchKey: graphql.executionLogEntryResolver.DurationMilliseconds
tags: [private]
```

```Go
func (r *executionLogEntryResolver) DurationMilliseconds() int32
```

#### <a id="executionLogEntryResolver.Out" href="#executionLogEntryResolver.Out">func (r *executionLogEntryResolver) Out(ctx context.Context) (string, error)</a>

```
searchKey: graphql.executionLogEntryResolver.Out
tags: [private]
```

```Go
func (r *executionLogEntryResolver) Out(ctx context.Context) (string, error)
```

### <a id="HoverResolver" href="#HoverResolver">type HoverResolver struct</a>

```
searchKey: graphql.HoverResolver
```

```Go
type HoverResolver struct {
	text     string
	lspRange lsp.Range
}
```

#### <a id="HoverResolver.Markdown" href="#HoverResolver.Markdown">func (r *HoverResolver) Markdown() gql.Markdown</a>

```
searchKey: graphql.HoverResolver.Markdown
```

```Go
func (r *HoverResolver) Markdown() gql.Markdown
```

#### <a id="HoverResolver.Range" href="#HoverResolver.Range">func (r *HoverResolver) Range() gql.RangeResolver</a>

```
searchKey: graphql.HoverResolver.Range
```

```Go
func (r *HoverResolver) Range() gql.RangeResolver
```

### <a id="IndexResolver" href="#IndexResolver">type IndexResolver struct</a>

```
searchKey: graphql.IndexResolver
```

```Go
type IndexResolver struct {
	index            store.Index
	prefetcher       *Prefetcher
	locationResolver *CachedLocationResolver
}
```

#### <a id="IndexResolver.ID" href="#IndexResolver.ID">func (r *IndexResolver) ID() graphql.ID</a>

```
searchKey: graphql.IndexResolver.ID
```

```Go
func (r *IndexResolver) ID() graphql.ID
```

#### <a id="IndexResolver.InputCommit" href="#IndexResolver.InputCommit">func (r *IndexResolver) InputCommit() string</a>

```
searchKey: graphql.IndexResolver.InputCommit
```

```Go
func (r *IndexResolver) InputCommit() string
```

#### <a id="IndexResolver.InputRoot" href="#IndexResolver.InputRoot">func (r *IndexResolver) InputRoot() string</a>

```
searchKey: graphql.IndexResolver.InputRoot
```

```Go
func (r *IndexResolver) InputRoot() string
```

#### <a id="IndexResolver.InputIndexer" href="#IndexResolver.InputIndexer">func (r *IndexResolver) InputIndexer() string</a>

```
searchKey: graphql.IndexResolver.InputIndexer
```

```Go
func (r *IndexResolver) InputIndexer() string
```

#### <a id="IndexResolver.QueuedAt" href="#IndexResolver.QueuedAt">func (r *IndexResolver) QueuedAt() gql.DateTime</a>

```
searchKey: graphql.IndexResolver.QueuedAt
```

```Go
func (r *IndexResolver) QueuedAt() gql.DateTime
```

#### <a id="IndexResolver.Failure" href="#IndexResolver.Failure">func (r *IndexResolver) Failure() *string</a>

```
searchKey: graphql.IndexResolver.Failure
```

```Go
func (r *IndexResolver) Failure() *string
```

#### <a id="IndexResolver.StartedAt" href="#IndexResolver.StartedAt">func (r *IndexResolver) StartedAt() *gql.DateTime</a>

```
searchKey: graphql.IndexResolver.StartedAt
```

```Go
func (r *IndexResolver) StartedAt() *gql.DateTime
```

#### <a id="IndexResolver.FinishedAt" href="#IndexResolver.FinishedAt">func (r *IndexResolver) FinishedAt() *gql.DateTime</a>

```
searchKey: graphql.IndexResolver.FinishedAt
```

```Go
func (r *IndexResolver) FinishedAt() *gql.DateTime
```

#### <a id="IndexResolver.Steps" href="#IndexResolver.Steps">func (r *IndexResolver) Steps() gql.IndexStepsResolver</a>

```
searchKey: graphql.IndexResolver.Steps
```

```Go
func (r *IndexResolver) Steps() gql.IndexStepsResolver
```

#### <a id="IndexResolver.PlaceInQueue" href="#IndexResolver.PlaceInQueue">func (r *IndexResolver) PlaceInQueue() *int32</a>

```
searchKey: graphql.IndexResolver.PlaceInQueue
```

```Go
func (r *IndexResolver) PlaceInQueue() *int32
```

#### <a id="IndexResolver.State" href="#IndexResolver.State">func (r *IndexResolver) State() string</a>

```
searchKey: graphql.IndexResolver.State
```

```Go
func (r *IndexResolver) State() string
```

#### <a id="IndexResolver.AssociatedUpload" href="#IndexResolver.AssociatedUpload">func (r *IndexResolver) AssociatedUpload(ctx context.Context) (gql.LSIFUploadResolver, error)</a>

```
searchKey: graphql.IndexResolver.AssociatedUpload
```

```Go
func (r *IndexResolver) AssociatedUpload(ctx context.Context) (gql.LSIFUploadResolver, error)
```

#### <a id="IndexResolver.ProjectRoot" href="#IndexResolver.ProjectRoot">func (r *IndexResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.IndexResolver.ProjectRoot
```

```Go
func (r *IndexResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)
```

### <a id="IndexConfigurationResolver" href="#IndexConfigurationResolver">type IndexConfigurationResolver struct</a>

```
searchKey: graphql.IndexConfigurationResolver
```

```Go
type IndexConfigurationResolver struct {
	configuration []byte
}
```

#### <a id="IndexConfigurationResolver.Configuration" href="#IndexConfigurationResolver.Configuration">func (r *IndexConfigurationResolver) Configuration() *string</a>

```
searchKey: graphql.IndexConfigurationResolver.Configuration
```

```Go
func (r *IndexConfigurationResolver) Configuration() *string
```

### <a id="IndexConnectionResolver" href="#IndexConnectionResolver">type IndexConnectionResolver struct</a>

```
searchKey: graphql.IndexConnectionResolver
```

```Go
type IndexConnectionResolver struct {
	resolver         *resolvers.IndexesResolver
	prefetcher       *Prefetcher
	locationResolver *CachedLocationResolver
}
```

#### <a id="IndexConnectionResolver.Nodes" href="#IndexConnectionResolver.Nodes">func (r *IndexConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFIndexResolver, error)</a>

```
searchKey: graphql.IndexConnectionResolver.Nodes
```

```Go
func (r *IndexConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFIndexResolver, error)
```

#### <a id="IndexConnectionResolver.TotalCount" href="#IndexConnectionResolver.TotalCount">func (r *IndexConnectionResolver) TotalCount(ctx context.Context) (*int32, error)</a>

```
searchKey: graphql.IndexConnectionResolver.TotalCount
```

```Go
func (r *IndexConnectionResolver) TotalCount(ctx context.Context) (*int32, error)
```

#### <a id="IndexConnectionResolver.PageInfo" href="#IndexConnectionResolver.PageInfo">func (r *IndexConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphql.IndexConnectionResolver.PageInfo
```

```Go
func (r *IndexConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="indexStepsResolver" href="#indexStepsResolver">type indexStepsResolver struct</a>

```
searchKey: graphql.indexStepsResolver
tags: [private]
```

```Go
type indexStepsResolver struct {
	index store.Index
}
```

indexStepsResolver resolves the steps of an index record. 

Index jobs are broken into three parts: 

```
- pre-index steps; all but the last docker step
- index step; the last docker step
- upload step; the only src-cli step

```
The setup and teardown steps match the executor setup and teardown. 

#### <a id="indexStepsResolver.Setup" href="#indexStepsResolver.Setup">func (r *indexStepsResolver) Setup() []gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepsResolver.Setup
tags: [private]
```

```Go
func (r *indexStepsResolver) Setup() []gql.ExecutionLogEntryResolver
```

#### <a id="indexStepsResolver.PreIndex" href="#indexStepsResolver.PreIndex">func (r *indexStepsResolver) PreIndex() []gql.PreIndexStepResolver</a>

```
searchKey: graphql.indexStepsResolver.PreIndex
tags: [private]
```

```Go
func (r *indexStepsResolver) PreIndex() []gql.PreIndexStepResolver
```

#### <a id="indexStepsResolver.Index" href="#indexStepsResolver.Index">func (r *indexStepsResolver) Index() gql.IndexStepResolver</a>

```
searchKey: graphql.indexStepsResolver.Index
tags: [private]
```

```Go
func (r *indexStepsResolver) Index() gql.IndexStepResolver
```

#### <a id="indexStepsResolver.Upload" href="#indexStepsResolver.Upload">func (r *indexStepsResolver) Upload() gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepsResolver.Upload
tags: [private]
```

```Go
func (r *indexStepsResolver) Upload() gql.ExecutionLogEntryResolver
```

#### <a id="indexStepsResolver.Teardown" href="#indexStepsResolver.Teardown">func (r *indexStepsResolver) Teardown() []gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepsResolver.Teardown
tags: [private]
```

```Go
func (r *indexStepsResolver) Teardown() []gql.ExecutionLogEntryResolver
```

#### <a id="indexStepsResolver.findExecutionLogEntry" href="#indexStepsResolver.findExecutionLogEntry">func (r *indexStepsResolver) findExecutionLogEntry(key string) (workerutil.ExecutionLogEntry, bool)</a>

```
searchKey: graphql.indexStepsResolver.findExecutionLogEntry
tags: [private]
```

```Go
func (r *indexStepsResolver) findExecutionLogEntry(key string) (workerutil.ExecutionLogEntry, bool)
```

#### <a id="indexStepsResolver.executionLogEntryResolversWithPrefix" href="#indexStepsResolver.executionLogEntryResolversWithPrefix">func (r *indexStepsResolver) executionLogEntryResolversWithPrefix(prefix string) []gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepsResolver.executionLogEntryResolversWithPrefix
tags: [private]
```

```Go
func (r *indexStepsResolver) executionLogEntryResolversWithPrefix(prefix string) []gql.ExecutionLogEntryResolver
```

### <a id="indexStepResolver" href="#indexStepResolver">type indexStepResolver struct</a>

```
searchKey: graphql.indexStepResolver
tags: [private]
```

```Go
type indexStepResolver struct {
	index store.Index
	entry *workerutil.ExecutionLogEntry
}
```

#### <a id="indexStepResolver.IndexerArgs" href="#indexStepResolver.IndexerArgs">func (r *indexStepResolver) IndexerArgs() []string</a>

```
searchKey: graphql.indexStepResolver.IndexerArgs
tags: [private]
```

```Go
func (r *indexStepResolver) IndexerArgs() []string
```

#### <a id="indexStepResolver.Outfile" href="#indexStepResolver.Outfile">func (r *indexStepResolver) Outfile() *string</a>

```
searchKey: graphql.indexStepResolver.Outfile
tags: [private]
```

```Go
func (r *indexStepResolver) Outfile() *string
```

#### <a id="indexStepResolver.LogEntry" href="#indexStepResolver.LogEntry">func (r *indexStepResolver) LogEntry() gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepResolver.LogEntry
tags: [private]
```

```Go
func (r *indexStepResolver) LogEntry() gql.ExecutionLogEntryResolver
```

### <a id="preIndexStepResolver" href="#preIndexStepResolver">type preIndexStepResolver struct</a>

```
searchKey: graphql.preIndexStepResolver
tags: [private]
```

```Go
type preIndexStepResolver struct {
	step  store.DockerStep
	entry *workerutil.ExecutionLogEntry
}
```

#### <a id="preIndexStepResolver.Root" href="#preIndexStepResolver.Root">func (r *preIndexStepResolver) Root() string</a>

```
searchKey: graphql.preIndexStepResolver.Root
tags: [private]
```

```Go
func (r *preIndexStepResolver) Root() string
```

#### <a id="preIndexStepResolver.Image" href="#preIndexStepResolver.Image">func (r *preIndexStepResolver) Image() string</a>

```
searchKey: graphql.preIndexStepResolver.Image
tags: [private]
```

```Go
func (r *preIndexStepResolver) Image() string
```

#### <a id="preIndexStepResolver.Commands" href="#preIndexStepResolver.Commands">func (r *preIndexStepResolver) Commands() []string</a>

```
searchKey: graphql.preIndexStepResolver.Commands
tags: [private]
```

```Go
func (r *preIndexStepResolver) Commands() []string
```

#### <a id="preIndexStepResolver.LogEntry" href="#preIndexStepResolver.LogEntry">func (r *preIndexStepResolver) LogEntry() gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.preIndexStepResolver.LogEntry
tags: [private]
```

```Go
func (r *preIndexStepResolver) LogEntry() gql.ExecutionLogEntryResolver
```

### <a id="LocationConnectionResolver" href="#LocationConnectionResolver">type LocationConnectionResolver struct</a>

```
searchKey: graphql.LocationConnectionResolver
```

```Go
type LocationConnectionResolver struct {
	locations        []resolvers.AdjustedLocation
	cursor           *string
	locationResolver *CachedLocationResolver
}
```

#### <a id="LocationConnectionResolver.Nodes" href="#LocationConnectionResolver.Nodes">func (r *LocationConnectionResolver) Nodes(ctx context.Context) ([]gql.LocationResolver, error)</a>

```
searchKey: graphql.LocationConnectionResolver.Nodes
```

```Go
func (r *LocationConnectionResolver) Nodes(ctx context.Context) ([]gql.LocationResolver, error)
```

#### <a id="LocationConnectionResolver.PageInfo" href="#LocationConnectionResolver.PageInfo">func (r *LocationConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphql.LocationConnectionResolver.PageInfo
```

```Go
func (r *LocationConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="CachedLocationResolver" href="#CachedLocationResolver">type CachedLocationResolver struct</a>

```
searchKey: graphql.CachedLocationResolver
```

```Go
type CachedLocationResolver struct {
	sync.RWMutex
	children map[api.RepoID]*cachedRepositoryResolver
	db       dbutil.DB
}
```

CachedLocationResolver resolves repositories, commits, and git tree entries and caches the resulting resolvers so that the same request does not re-resolve the same repository, commit, or path multiple times during execution. This cache reduces the number duplicate of database and gitserver queries for definition, reference, and diagnostic queries, which return collections of results that often refer to a small set of repositories, commits, and paths with a large multiplicity. 

This resolver maintains a hierarchy of caches as a way to decrease lock contention. Resolution of a repository holds the top-level lock. Resolution of a commit holds a lock associated with the parent repository. Similarly, resolution of a path holds a lock associated with the parent commit. 

#### <a id="NewCachedLocationResolver" href="#NewCachedLocationResolver">func NewCachedLocationResolver(db dbutil.DB) *CachedLocationResolver</a>

```
searchKey: graphql.NewCachedLocationResolver
```

```Go
func NewCachedLocationResolver(db dbutil.DB) *CachedLocationResolver
```

NewCachedLocationResolver creates a location resolver with an empty cache. 

#### <a id="CachedLocationResolver.Repository" href="#CachedLocationResolver.Repository">func (r *CachedLocationResolver) Repository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.Repository
```

```Go
func (r *CachedLocationResolver) Repository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)
```

Repository resolves the repository with the given identifier. This method may return a nil resolver if the repository is not known by gitserver - this happens if there is exists still a bundle for a repo that has since been deleted. 

#### <a id="CachedLocationResolver.Commit" href="#CachedLocationResolver.Commit">func (r *CachedLocationResolver) Commit(ctx context.Context, id api.RepoID, commit string) (*gql.GitCommitResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.Commit
```

```Go
func (r *CachedLocationResolver) Commit(ctx context.Context, id api.RepoID, commit string) (*gql.GitCommitResolver, error)
```

Commit resolves the git commit with the given repository identifier and commit hash. This method may return a nil resolver if the commit is not known by gitserver. 

#### <a id="CachedLocationResolver.Path" href="#CachedLocationResolver.Path">func (r *CachedLocationResolver) Path(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.Path
```

```Go
func (r *CachedLocationResolver) Path(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)
```

Path resolves the git tree entry with the given repository identifier, commit hash, and relative path. This method may return a nil resolver if the commit is not known by gitserver. 

#### <a id="CachedLocationResolver.cachedRepository" href="#CachedLocationResolver.cachedRepository">func (r *CachedLocationResolver) cachedRepository(ctx context.Context, id api.RepoID) (*cachedRepositoryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.cachedRepository
tags: [private]
```

```Go
func (r *CachedLocationResolver) cachedRepository(ctx context.Context, id api.RepoID) (*cachedRepositoryResolver, error)
```

cachedRepository resolves the repository with the given identifier if the resulting resolver does not already exist in the cache. The cache is tested/populated with double-checked locking, which ensures that the resolver is created exactly once per GraphQL request. 

See [https://en.wikipedia.org/wiki/Double-checked_locking](https://en.wikipedia.org/wiki/Double-checked_locking). 

#### <a id="CachedLocationResolver.cachedCommit" href="#CachedLocationResolver.cachedCommit">func (r *CachedLocationResolver) cachedCommit(ctx context.Context, id api.RepoID, commit string) (*cachedCommitResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.cachedCommit
tags: [private]
```

```Go
func (r *CachedLocationResolver) cachedCommit(ctx context.Context, id api.RepoID, commit string) (*cachedCommitResolver, error)
```

cachedCommit resolves the commit with the given repository identifier and commit hash if the resulting resolver does not already exist in the cache. The cache is tested/populated with double-checked locking, which ensures that the resolver is created exactly once per GraphQL request. 

See [https://en.wikipedia.org/wiki/Double-checked_locking](https://en.wikipedia.org/wiki/Double-checked_locking). 

#### <a id="CachedLocationResolver.cachedPath" href="#CachedLocationResolver.cachedPath">func (r *CachedLocationResolver) cachedPath(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.cachedPath
tags: [private]
```

```Go
func (r *CachedLocationResolver) cachedPath(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)
```

cachedPath resolves the commit with the given repository identifier, commit hash, and relative path if the resulting resolver does not already exist in the cache. The cache is tested/populated with double-checked locking, which ensures that the resolver is created exactly once per GraphQL request. 

See [https://en.wikipedia.org/wiki/Double-checked_locking](https://en.wikipedia.org/wiki/Double-checked_locking). 

#### <a id="CachedLocationResolver.resolveRepository" href="#CachedLocationResolver.resolveRepository">func (r *CachedLocationResolver) resolveRepository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.resolveRepository
tags: [private]
```

```Go
func (r *CachedLocationResolver) resolveRepository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)
```

Repository resolves the repository with the given identifier. This method may return a nil resolver if the repository is not known by gitserver - this happens if there is exists still a bundle for a repo that has since been deleted. This method must be called only when constructing a resolver to populate the cache. 

#### <a id="CachedLocationResolver.resolveCommit" href="#CachedLocationResolver.resolveCommit">func (r *CachedLocationResolver) resolveCommit(ctx context.Context, repositoryResolver *gql.RepositoryResolver, commit string) (*gql.GitCommitResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.resolveCommit
tags: [private]
```

```Go
func (r *CachedLocationResolver) resolveCommit(ctx context.Context, repositoryResolver *gql.RepositoryResolver, commit string) (*gql.GitCommitResolver, error)
```

Commit resolves the git commit with the given repository resolver and commit hash. This method may return a nil resolver if the commit is not known by gitserver. This method must be called only when constructing a resolver to populate the cache. 

#### <a id="CachedLocationResolver.resolvePath" href="#CachedLocationResolver.resolvePath">func (r *CachedLocationResolver) resolvePath(ctx context.Context, commitResolver *gql.GitCommitResolver, path string) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.resolvePath
tags: [private]
```

```Go
func (r *CachedLocationResolver) resolvePath(ctx context.Context, commitResolver *gql.GitCommitResolver, path string) (*gql.GitTreeEntryResolver, error)
```

Path resolves the git tree entry with the given commit resolver and relative path. This method must be called only when constructing a resolver to populate the cache. 

### <a id="cachedRepositoryResolver" href="#cachedRepositoryResolver">type cachedRepositoryResolver struct</a>

```
searchKey: graphql.cachedRepositoryResolver
tags: [private]
```

```Go
type cachedRepositoryResolver struct {
	sync.RWMutex
	resolver *gql.RepositoryResolver
	children map[string]*cachedCommitResolver
}
```

### <a id="cachedCommitResolver" href="#cachedCommitResolver">type cachedCommitResolver struct</a>

```
searchKey: graphql.cachedCommitResolver
tags: [private]
```

```Go
type cachedCommitResolver struct {
	sync.RWMutex
	resolver *gql.GitCommitResolver
	children map[string]*gql.GitTreeEntryResolver
}
```

### <a id="Prefetcher" href="#Prefetcher">type Prefetcher struct</a>

```
searchKey: graphql.Prefetcher
```

```Go
type Prefetcher struct {
	sync.RWMutex
	resolver    resolvers.Resolver
	uploadIDs   []int
	indexIDs    []int
	uploadCache map[int]store.Upload
	indexCache  map[int]store.Index
}
```

Prefetcher is a batch query utility and cache used to reduce the amount of database queries made by a tree of upload and index resolvers. A single prefetcher instance is shared by all sibling resolvers resulting from an upload or index connection, as well as index records resulting from an upload resolver (and vice versa). 

#### <a id="NewPrefetcher" href="#NewPrefetcher">func NewPrefetcher(resolver resolvers.Resolver) *Prefetcher</a>

```
searchKey: graphql.NewPrefetcher
```

```Go
func NewPrefetcher(resolver resolvers.Resolver) *Prefetcher
```

NewPrefetcher returns a prefetcher with an empty cache. 

#### <a id="Prefetcher.MarkUpload" href="#Prefetcher.MarkUpload">func (p *Prefetcher) MarkUpload(id int)</a>

```
searchKey: graphql.Prefetcher.MarkUpload
```

```Go
func (p *Prefetcher) MarkUpload(id int)
```

MarkUpload adds the given identifier to the next batch of uploads to fetch. 

#### <a id="Prefetcher.GetUploadByID" href="#Prefetcher.GetUploadByID">func (p *Prefetcher) GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)</a>

```
searchKey: graphql.Prefetcher.GetUploadByID
```

```Go
func (p *Prefetcher) GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)
```

GetUploadByID will return an upload with the given identifier as well as a boolean flag indicating such a record's existence. If the given ID has already been fetched by another call to GetUploadByID, that record is returned immediately. Otherwise, the given identifier will be added to the current batch of identifiers constructed via calls to MarkUpload. All uploads will in the current batch are requested at once and the upload with the given identifier is returned from that result set. 

#### <a id="Prefetcher.MarkIndex" href="#Prefetcher.MarkIndex">func (p *Prefetcher) MarkIndex(id int)</a>

```
searchKey: graphql.Prefetcher.MarkIndex
```

```Go
func (p *Prefetcher) MarkIndex(id int)
```

MarkIndex adds the given identifier to the next batch of indexes to fetch. 

#### <a id="Prefetcher.GetIndexByID" href="#Prefetcher.GetIndexByID">func (p *Prefetcher) GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)</a>

```
searchKey: graphql.Prefetcher.GetIndexByID
```

```Go
func (p *Prefetcher) GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)
```

GetIndexByID will return an index with the given identifier as well as a boolean flag indicating such a record's existence. If the given ID has already been fetched by another call to GetIndexByID, that record is returned immediately. Otherwise, the given identifier will be added to the current batch of identifiers constructed via calls to MarkIndex. All indexes will in the current batch are requested at once and the index with the given identifier is returned from that result set. 

### <a id="QueryResolver" href="#QueryResolver">type QueryResolver struct</a>

```
searchKey: graphql.QueryResolver
```

```Go
type QueryResolver struct {
	resolver         resolvers.QueryResolver
	locationResolver *CachedLocationResolver
}
```

QueryResolver is the main interface to bundle-related operations exposed to the GraphQL API. This resolver concerns itself with GraphQL/API-specific behaviors (auth, validation, marshaling, etc.). All code intel-specific behavior is delegated to the underlying resolver instance, which is defined in the parent package. 

#### <a id="QueryResolver.ToGitTreeLSIFData" href="#QueryResolver.ToGitTreeLSIFData">func (r *QueryResolver) ToGitTreeLSIFData() (gql.GitTreeLSIFDataResolver, bool)</a>

```
searchKey: graphql.QueryResolver.ToGitTreeLSIFData
```

```Go
func (r *QueryResolver) ToGitTreeLSIFData() (gql.GitTreeLSIFDataResolver, bool)
```

#### <a id="QueryResolver.ToGitBlobLSIFData" href="#QueryResolver.ToGitBlobLSIFData">func (r *QueryResolver) ToGitBlobLSIFData() (gql.GitBlobLSIFDataResolver, bool)</a>

```
searchKey: graphql.QueryResolver.ToGitBlobLSIFData
```

```Go
func (r *QueryResolver) ToGitBlobLSIFData() (gql.GitBlobLSIFDataResolver, bool)
```

#### <a id="QueryResolver.Ranges" href="#QueryResolver.Ranges">func (r *QueryResolver) Ranges(ctx context.Context, args *gql.LSIFRangesArgs) (gql.CodeIntelligenceRangeConnectionResolver, error)</a>

```
searchKey: graphql.QueryResolver.Ranges
```

```Go
func (r *QueryResolver) Ranges(ctx context.Context, args *gql.LSIFRangesArgs) (gql.CodeIntelligenceRangeConnectionResolver, error)
```

#### <a id="QueryResolver.Definitions" href="#QueryResolver.Definitions">func (r *QueryResolver) Definitions(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.LocationConnectionResolver, error)</a>

```
searchKey: graphql.QueryResolver.Definitions
```

```Go
func (r *QueryResolver) Definitions(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.LocationConnectionResolver, error)
```

#### <a id="QueryResolver.References" href="#QueryResolver.References">func (r *QueryResolver) References(ctx context.Context, args *gql.LSIFPagedQueryPositionArgs) (gql.LocationConnectionResolver, error)</a>

```
searchKey: graphql.QueryResolver.References
```

```Go
func (r *QueryResolver) References(ctx context.Context, args *gql.LSIFPagedQueryPositionArgs) (gql.LocationConnectionResolver, error)
```

#### <a id="QueryResolver.Hover" href="#QueryResolver.Hover">func (r *QueryResolver) Hover(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.HoverResolver, error)</a>

```
searchKey: graphql.QueryResolver.Hover
```

```Go
func (r *QueryResolver) Hover(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.HoverResolver, error)
```

#### <a id="QueryResolver.Diagnostics" href="#QueryResolver.Diagnostics">func (r *QueryResolver) Diagnostics(ctx context.Context, args *gql.LSIFDiagnosticsArgs) (gql.DiagnosticConnectionResolver, error)</a>

```
searchKey: graphql.QueryResolver.Diagnostics
```

```Go
func (r *QueryResolver) Diagnostics(ctx context.Context, args *gql.LSIFDiagnosticsArgs) (gql.DiagnosticConnectionResolver, error)
```

#### <a id="QueryResolver.DocumentationPage" href="#QueryResolver.DocumentationPage">func (r *QueryResolver) DocumentationPage(ctx context.Context, args *gql.LSIFDocumentationPageArgs) (gql.DocumentationPageResolver, error)</a>

```
searchKey: graphql.QueryResolver.DocumentationPage
```

```Go
func (r *QueryResolver) DocumentationPage(ctx context.Context, args *gql.LSIFDocumentationPageArgs) (gql.DocumentationPageResolver, error)
```

### <a id="DocumentationPageResolver" href="#DocumentationPageResolver">type DocumentationPageResolver struct</a>

```
searchKey: graphql.DocumentationPageResolver
```

```Go
type DocumentationPageResolver struct {
	tree gql.JSONValue
}
```

#### <a id="DocumentationPageResolver.Tree" href="#DocumentationPageResolver.Tree">func (r *DocumentationPageResolver) Tree() gql.JSONValue</a>

```
searchKey: graphql.DocumentationPageResolver.Tree
```

```Go
func (r *DocumentationPageResolver) Tree() gql.JSONValue
```

### <a id="CodeIntelligenceRangeResolver" href="#CodeIntelligenceRangeResolver">type CodeIntelligenceRangeResolver struct</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver
```

```Go
type CodeIntelligenceRangeResolver struct {
	r                resolvers.AdjustedCodeIntelligenceRange
	locationResolver *CachedLocationResolver
}
```

#### <a id="CodeIntelligenceRangeResolver.Range" href="#CodeIntelligenceRangeResolver.Range">func (r *CodeIntelligenceRangeResolver) Range(ctx context.Context) (gql.RangeResolver, error)</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver.Range
```

```Go
func (r *CodeIntelligenceRangeResolver) Range(ctx context.Context) (gql.RangeResolver, error)
```

#### <a id="CodeIntelligenceRangeResolver.Definitions" href="#CodeIntelligenceRangeResolver.Definitions">func (r *CodeIntelligenceRangeResolver) Definitions(ctx context.Context) (gql.LocationConnectionResolver, error)</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver.Definitions
```

```Go
func (r *CodeIntelligenceRangeResolver) Definitions(ctx context.Context) (gql.LocationConnectionResolver, error)
```

#### <a id="CodeIntelligenceRangeResolver.References" href="#CodeIntelligenceRangeResolver.References">func (r *CodeIntelligenceRangeResolver) References(ctx context.Context) (gql.LocationConnectionResolver, error)</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver.References
```

```Go
func (r *CodeIntelligenceRangeResolver) References(ctx context.Context) (gql.LocationConnectionResolver, error)
```

#### <a id="CodeIntelligenceRangeResolver.Hover" href="#CodeIntelligenceRangeResolver.Hover">func (r *CodeIntelligenceRangeResolver) Hover(ctx context.Context) (gql.HoverResolver, error)</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver.Hover
```

```Go
func (r *CodeIntelligenceRangeResolver) Hover(ctx context.Context) (gql.HoverResolver, error)
```

### <a id="CodeIntelligenceRangeConnectionResolver" href="#CodeIntelligenceRangeConnectionResolver">type CodeIntelligenceRangeConnectionResolver struct</a>

```
searchKey: graphql.CodeIntelligenceRangeConnectionResolver
```

```Go
type CodeIntelligenceRangeConnectionResolver struct {
	ranges           []resolvers.AdjustedCodeIntelligenceRange
	locationResolver *CachedLocationResolver
}
```

#### <a id="CodeIntelligenceRangeConnectionResolver.Nodes" href="#CodeIntelligenceRangeConnectionResolver.Nodes">func (r *CodeIntelligenceRangeConnectionResolver) Nodes(ctx context.Context) ([]gql.CodeIntelligenceRangeResolver, error)</a>

```
searchKey: graphql.CodeIntelligenceRangeConnectionResolver.Nodes
```

```Go
func (r *CodeIntelligenceRangeConnectionResolver) Nodes(ctx context.Context) ([]gql.CodeIntelligenceRangeResolver, error)
```

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: graphql.Resolver
```

```Go
type Resolver struct {
	resolver         resolvers.Resolver
	locationResolver *CachedLocationResolver
}
```

Resolver is the main interface to code intel-related operations exposted to the GraphQL API. This resolver concerns itself with GraphQL/API-specific behaviors (auth, validation, marshaling, etc.). All code intel-specific behavior is delegated to the underlying resolver instance, which is defined in the parent package. 

#### <a id="Resolver.NodeResolvers" href="#Resolver.NodeResolvers">func (r *Resolver) NodeResolvers() map[string]gql.NodeByIDFunc</a>

```
searchKey: graphql.Resolver.NodeResolvers
```

```Go
func (r *Resolver) NodeResolvers() map[string]gql.NodeByIDFunc
```

#### <a id="Resolver.LSIFUploadByID" href="#Resolver.LSIFUploadByID">func (r *Resolver) LSIFUploadByID(ctx context.Context, id graphql.ID) (gql.LSIFUploadResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFUploadByID
```

```Go
func (r *Resolver) LSIFUploadByID(ctx context.Context, id graphql.ID) (gql.LSIFUploadResolver, error)
```

#### <a id="Resolver.LSIFUploads" href="#Resolver.LSIFUploads">func (r *Resolver) LSIFUploads(ctx context.Context, args *gql.LSIFUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFUploads
```

```Go
func (r *Resolver) LSIFUploads(ctx context.Context, args *gql.LSIFUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)
```

#### <a id="Resolver.LSIFUploadsByRepo" href="#Resolver.LSIFUploadsByRepo">func (r *Resolver) LSIFUploadsByRepo(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFUploadsByRepo
```

```Go
func (r *Resolver) LSIFUploadsByRepo(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)
```

#### <a id="Resolver.DeleteLSIFUpload" href="#Resolver.DeleteLSIFUpload">func (r *Resolver) DeleteLSIFUpload(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)</a>

```
searchKey: graphql.Resolver.DeleteLSIFUpload
```

```Go
func (r *Resolver) DeleteLSIFUpload(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)
```

#### <a id="Resolver.LSIFIndexByID" href="#Resolver.LSIFIndexByID">func (r *Resolver) LSIFIndexByID(ctx context.Context, id graphql.ID) (gql.LSIFIndexResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFIndexByID
```

```Go
func (r *Resolver) LSIFIndexByID(ctx context.Context, id graphql.ID) (gql.LSIFIndexResolver, error)
```

#### <a id="Resolver.LSIFIndexes" href="#Resolver.LSIFIndexes">func (r *Resolver) LSIFIndexes(ctx context.Context, args *gql.LSIFIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFIndexes
```

```Go
func (r *Resolver) LSIFIndexes(ctx context.Context, args *gql.LSIFIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)
```

#### <a id="Resolver.LSIFIndexesByRepo" href="#Resolver.LSIFIndexesByRepo">func (r *Resolver) LSIFIndexesByRepo(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFIndexesByRepo
```

```Go
func (r *Resolver) LSIFIndexesByRepo(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)
```

#### <a id="Resolver.DeleteLSIFIndex" href="#Resolver.DeleteLSIFIndex">func (r *Resolver) DeleteLSIFIndex(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)</a>

```
searchKey: graphql.Resolver.DeleteLSIFIndex
```

```Go
func (r *Resolver) DeleteLSIFIndex(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)
```

#### <a id="Resolver.IndexConfiguration" href="#Resolver.IndexConfiguration">func (r *Resolver) IndexConfiguration(ctx context.Context, id graphql.ID) (gql.IndexConfigurationResolver, error)</a>

```
searchKey: graphql.Resolver.IndexConfiguration
```

```Go
func (r *Resolver) IndexConfiguration(ctx context.Context, id graphql.ID) (gql.IndexConfigurationResolver, error)
```

#### <a id="Resolver.UpdateRepositoryIndexConfiguration" href="#Resolver.UpdateRepositoryIndexConfiguration">func (r *Resolver) UpdateRepositoryIndexConfiguration(ctx context.Context, args *gql.UpdateRepositoryIndexConfigurationArgs) (*gql.EmptyResponse, error)</a>

```
searchKey: graphql.Resolver.UpdateRepositoryIndexConfiguration
```

```Go
func (r *Resolver) UpdateRepositoryIndexConfiguration(ctx context.Context, args *gql.UpdateRepositoryIndexConfigurationArgs) (*gql.EmptyResponse, error)
```

#### <a id="Resolver.CommitGraph" href="#Resolver.CommitGraph">func (r *Resolver) CommitGraph(ctx context.Context, id graphql.ID) (gql.CodeIntelligenceCommitGraphResolver, error)</a>

```
searchKey: graphql.Resolver.CommitGraph
```

```Go
func (r *Resolver) CommitGraph(ctx context.Context, id graphql.ID) (gql.CodeIntelligenceCommitGraphResolver, error)
```

#### <a id="Resolver.QueueAutoIndexJobForRepo" href="#Resolver.QueueAutoIndexJobForRepo">func (r *Resolver) QueueAutoIndexJobForRepo(ctx context.Context, args *struct{ Repository graphql.ID }) (*gql.EmptyResponse, error)</a>

```
searchKey: graphql.Resolver.QueueAutoIndexJobForRepo
```

```Go
func (r *Resolver) QueueAutoIndexJobForRepo(ctx context.Context, args *struct{ Repository graphql.ID }) (*gql.EmptyResponse, error)
```

#### <a id="Resolver.GitBlobLSIFData" href="#Resolver.GitBlobLSIFData">func (r *Resolver) GitBlobLSIFData(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (gql.GitBlobLSIFDataResolver, error)</a>

```
searchKey: graphql.Resolver.GitBlobLSIFData
```

```Go
func (r *Resolver) GitBlobLSIFData(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (gql.GitBlobLSIFDataResolver, error)
```

### <a id="UploadResolver" href="#UploadResolver">type UploadResolver struct</a>

```
searchKey: graphql.UploadResolver
```

```Go
type UploadResolver struct {
	upload           store.Upload
	prefetcher       *Prefetcher
	locationResolver *CachedLocationResolver
}
```

#### <a id="UploadResolver.ID" href="#UploadResolver.ID">func (r *UploadResolver) ID() graphql.ID</a>

```
searchKey: graphql.UploadResolver.ID
```

```Go
func (r *UploadResolver) ID() graphql.ID
```

#### <a id="UploadResolver.InputCommit" href="#UploadResolver.InputCommit">func (r *UploadResolver) InputCommit() string</a>

```
searchKey: graphql.UploadResolver.InputCommit
```

```Go
func (r *UploadResolver) InputCommit() string
```

#### <a id="UploadResolver.InputRoot" href="#UploadResolver.InputRoot">func (r *UploadResolver) InputRoot() string</a>

```
searchKey: graphql.UploadResolver.InputRoot
```

```Go
func (r *UploadResolver) InputRoot() string
```

#### <a id="UploadResolver.IsLatestForRepo" href="#UploadResolver.IsLatestForRepo">func (r *UploadResolver) IsLatestForRepo() bool</a>

```
searchKey: graphql.UploadResolver.IsLatestForRepo
```

```Go
func (r *UploadResolver) IsLatestForRepo() bool
```

#### <a id="UploadResolver.UploadedAt" href="#UploadResolver.UploadedAt">func (r *UploadResolver) UploadedAt() gql.DateTime</a>

```
searchKey: graphql.UploadResolver.UploadedAt
```

```Go
func (r *UploadResolver) UploadedAt() gql.DateTime
```

#### <a id="UploadResolver.Failure" href="#UploadResolver.Failure">func (r *UploadResolver) Failure() *string</a>

```
searchKey: graphql.UploadResolver.Failure
```

```Go
func (r *UploadResolver) Failure() *string
```

#### <a id="UploadResolver.StartedAt" href="#UploadResolver.StartedAt">func (r *UploadResolver) StartedAt() *gql.DateTime</a>

```
searchKey: graphql.UploadResolver.StartedAt
```

```Go
func (r *UploadResolver) StartedAt() *gql.DateTime
```

#### <a id="UploadResolver.FinishedAt" href="#UploadResolver.FinishedAt">func (r *UploadResolver) FinishedAt() *gql.DateTime</a>

```
searchKey: graphql.UploadResolver.FinishedAt
```

```Go
func (r *UploadResolver) FinishedAt() *gql.DateTime
```

#### <a id="UploadResolver.InputIndexer" href="#UploadResolver.InputIndexer">func (r *UploadResolver) InputIndexer() string</a>

```
searchKey: graphql.UploadResolver.InputIndexer
```

```Go
func (r *UploadResolver) InputIndexer() string
```

#### <a id="UploadResolver.PlaceInQueue" href="#UploadResolver.PlaceInQueue">func (r *UploadResolver) PlaceInQueue() *int32</a>

```
searchKey: graphql.UploadResolver.PlaceInQueue
```

```Go
func (r *UploadResolver) PlaceInQueue() *int32
```

#### <a id="UploadResolver.State" href="#UploadResolver.State">func (r *UploadResolver) State() string</a>

```
searchKey: graphql.UploadResolver.State
```

```Go
func (r *UploadResolver) State() string
```

#### <a id="UploadResolver.AssociatedIndex" href="#UploadResolver.AssociatedIndex">func (r *UploadResolver) AssociatedIndex(ctx context.Context) (gql.LSIFIndexResolver, error)</a>

```
searchKey: graphql.UploadResolver.AssociatedIndex
```

```Go
func (r *UploadResolver) AssociatedIndex(ctx context.Context) (gql.LSIFIndexResolver, error)
```

#### <a id="UploadResolver.ProjectRoot" href="#UploadResolver.ProjectRoot">func (r *UploadResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.UploadResolver.ProjectRoot
```

```Go
func (r *UploadResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)
```

### <a id="UploadConnectionResolver" href="#UploadConnectionResolver">type UploadConnectionResolver struct</a>

```
searchKey: graphql.UploadConnectionResolver
```

```Go
type UploadConnectionResolver struct {
	resolver         *resolvers.UploadsResolver
	prefetcher       *Prefetcher
	locationResolver *CachedLocationResolver
}
```

#### <a id="UploadConnectionResolver.Nodes" href="#UploadConnectionResolver.Nodes">func (r *UploadConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFUploadResolver, error)</a>

```
searchKey: graphql.UploadConnectionResolver.Nodes
```

```Go
func (r *UploadConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFUploadResolver, error)
```

#### <a id="UploadConnectionResolver.TotalCount" href="#UploadConnectionResolver.TotalCount">func (r *UploadConnectionResolver) TotalCount(ctx context.Context) (*int32, error)</a>

```
searchKey: graphql.UploadConnectionResolver.TotalCount
```

```Go
func (r *UploadConnectionResolver) TotalCount(ctx context.Context) (*int32, error)
```

#### <a id="UploadConnectionResolver.PageInfo" href="#UploadConnectionResolver.PageInfo">func (r *UploadConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphql.UploadConnectionResolver.PageInfo
```

```Go
func (r *UploadConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="encodeCursor" href="#encodeCursor">func encodeCursor(val *string) *graphqlutil.PageInfo</a>

```
searchKey: graphql.encodeCursor
tags: [private]
```

```Go
func encodeCursor(val *string) *graphqlutil.PageInfo
```

encodeCursor creates a PageInfo object from the given cursor. If the cursor is not defined, then an object indicating the end of the result set is returned. The cursor is base64 encoded for transfer, and should be decoded using the function decodeCursor. 

### <a id="decodeCursor" href="#decodeCursor">func decodeCursor(val *string) (string, error)</a>

```
searchKey: graphql.decodeCursor
tags: [private]
```

```Go
func decodeCursor(val *string) (string, error)
```

decodeCursor decodes the given cursor value. It is assumed to be a value previously returned from the function encodeCursor. An empty string is returned if no cursor is supplied. Invalid cursors return errors. 

### <a id="encodeIntCursor" href="#encodeIntCursor">func encodeIntCursor(val *int32) *graphqlutil.PageInfo</a>

```
searchKey: graphql.encodeIntCursor
tags: [private]
```

```Go
func encodeIntCursor(val *int32) *graphqlutil.PageInfo
```

encodeIntCursor creates a PageInfo object from the given new offset value. If the new offset value, then an object indicating the end of the result set is returned. The cursor is base64 encoded for transfer, and should be decoded using the function decodeIntCursor. 

### <a id="decodeIntCursor" href="#decodeIntCursor">func decodeIntCursor(val *string) (int, error)</a>

```
searchKey: graphql.decodeIntCursor
tags: [private]
```

```Go
func decodeIntCursor(val *string) (int, error)
```

decodeIntCursor decodes the given integer cursor value. It is assumed to be a value previously returned from the function encodeIntCursor. The zero value is returned if no cursor is supplied. Invalid cursors return errors. 

### <a id="NewDiagnosticResolver" href="#NewDiagnosticResolver">func NewDiagnosticResolver(diagnostic resolvers.AdjustedDiagnostic, locationResolver *CachedLocationResolver) gql.DiagnosticResolver</a>

```
searchKey: graphql.NewDiagnosticResolver
```

```Go
func NewDiagnosticResolver(diagnostic resolvers.AdjustedDiagnostic, locationResolver *CachedLocationResolver) gql.DiagnosticResolver
```

### <a id="toSeverity" href="#toSeverity">func toSeverity(val int) (*string, error)</a>

```
searchKey: graphql.toSeverity
tags: [private]
```

```Go
func toSeverity(val int) (*string, error)
```

### <a id="NewDiagnosticConnectionResolver" href="#NewDiagnosticConnectionResolver">func NewDiagnosticConnectionResolver(diagnostics []resolvers.AdjustedDiagnostic, totalCount int, locationResolver *CachedLocationResolver) gql.DiagnosticConnectionResolver</a>

```
searchKey: graphql.NewDiagnosticConnectionResolver
```

```Go
func NewDiagnosticConnectionResolver(diagnostics []resolvers.AdjustedDiagnostic, totalCount int, locationResolver *CachedLocationResolver) gql.DiagnosticConnectionResolver
```

### <a id="NewHoverResolver" href="#NewHoverResolver">func NewHoverResolver(text string, lspRange lsp.Range) gql.HoverResolver</a>

```
searchKey: graphql.NewHoverResolver
```

```Go
func NewHoverResolver(text string, lspRange lsp.Range) gql.HoverResolver
```

### <a id="marshalLSIFUploadGQLID" href="#marshalLSIFUploadGQLID">func marshalLSIFUploadGQLID(uploadID int64) graphql.ID</a>

```
searchKey: graphql.marshalLSIFUploadGQLID
tags: [private]
```

```Go
func marshalLSIFUploadGQLID(uploadID int64) graphql.ID
```

### <a id="unmarshalLSIFUploadGQLID" href="#unmarshalLSIFUploadGQLID">func unmarshalLSIFUploadGQLID(id graphql.ID) (uploadID int64, err error)</a>

```
searchKey: graphql.unmarshalLSIFUploadGQLID
tags: [private]
```

```Go
func unmarshalLSIFUploadGQLID(id graphql.ID) (uploadID int64, err error)
```

### <a id="marshalLSIFIndexGQLID" href="#marshalLSIFIndexGQLID">func marshalLSIFIndexGQLID(indexID int64) graphql.ID</a>

```
searchKey: graphql.marshalLSIFIndexGQLID
tags: [private]
```

```Go
func marshalLSIFIndexGQLID(indexID int64) graphql.ID
```

### <a id="unmarshalLSIFIndexGQLID" href="#unmarshalLSIFIndexGQLID">func unmarshalLSIFIndexGQLID(id graphql.ID) (indexID int64, err error)</a>

```
searchKey: graphql.unmarshalLSIFIndexGQLID
tags: [private]
```

```Go
func unmarshalLSIFIndexGQLID(id graphql.ID) (indexID int64, err error)
```

### <a id="NewIndexResolver" href="#NewIndexResolver">func NewIndexResolver(index store.Index, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexResolver</a>

```
searchKey: graphql.NewIndexResolver
```

```Go
func NewIndexResolver(index store.Index, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexResolver
```

### <a id="NewIndexConfigurationResolver" href="#NewIndexConfigurationResolver">func NewIndexConfigurationResolver(configuration []byte) gql.IndexConfigurationResolver</a>

```
searchKey: graphql.NewIndexConfigurationResolver
```

```Go
func NewIndexConfigurationResolver(configuration []byte) gql.IndexConfigurationResolver
```

### <a id="NewIndexConnectionResolver" href="#NewIndexConnectionResolver">func NewIndexConnectionResolver(resolver *resolvers.IndexesResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexConnectionResolver</a>

```
searchKey: graphql.NewIndexConnectionResolver
```

```Go
func NewIndexConnectionResolver(resolver *resolvers.IndexesResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexConnectionResolver
```

### <a id="NewLocationConnectionResolver" href="#NewLocationConnectionResolver">func NewLocationConnectionResolver(locations []resolvers.AdjustedLocation, cursor *string, locationResolver *CachedLocationResolver) gql.LocationConnectionResolver</a>

```
searchKey: graphql.NewLocationConnectionResolver
```

```Go
func NewLocationConnectionResolver(locations []resolvers.AdjustedLocation, cursor *string, locationResolver *CachedLocationResolver) gql.LocationConnectionResolver
```

### <a id="resolveLocations" href="#resolveLocations">func resolveLocations(ctx context.Context, locationResolver *CachedLocationResolver, locations []resolvers.AdjustedLocation) ([]gql.LocationResolver, error)</a>

```
searchKey: graphql.resolveLocations
tags: [private]
```

```Go
func resolveLocations(ctx context.Context, locationResolver *CachedLocationResolver, locations []resolvers.AdjustedLocation) ([]gql.LocationResolver, error)
```

resolveLocations creates a slide of LocationResolvers for the given list of adjusted locations. The resulting list may be smaller than the the input list as any locations with a commit not known by gitserver will be skipped. 

### <a id="resolveLocation" href="#resolveLocation">func resolveLocation(ctx context.Context, locationResolver *CachedLocationResolver, location resolvers.AdjustedLocation) (gql.LocationResolver, error)</a>

```
searchKey: graphql.resolveLocation
tags: [private]
```

```Go
func resolveLocation(ctx context.Context, locationResolver *CachedLocationResolver, location resolvers.AdjustedLocation) (gql.LocationResolver, error)
```

resolveLocation creates a LocationResolver for the given adjusted location. This function may return a nil resolver if the location's commit is not known by gitserver. 

### <a id="NewQueryResolver" href="#NewQueryResolver">func NewQueryResolver(resolver resolvers.QueryResolver, locationResolver *CachedLocationResolver) gql.GitBlobLSIFDataResolver</a>

```
searchKey: graphql.NewQueryResolver
```

```Go
func NewQueryResolver(resolver resolvers.QueryResolver, locationResolver *CachedLocationResolver) gql.GitBlobLSIFDataResolver
```

NewQueryResolver creates a new QueryResolver with the given resolver that defines all code intel-specific behavior. A cached location resolver instance is also given to the query resolver, which should be used to resolve all location-related values. 

### <a id="NewResolver" href="#NewResolver">func NewResolver(db dbutil.DB, resolver resolvers.Resolver) gql.CodeIntelResolver</a>

```
searchKey: graphql.NewResolver
```

```Go
func NewResolver(db dbutil.DB, resolver resolvers.Resolver) gql.CodeIntelResolver
```

NewResolver creates a new Resolver with the given resolver that defines all code intel-specific behavior. 

### <a id="makeGetUploadsOptions" href="#makeGetUploadsOptions">func makeGetUploadsOptions(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (store.GetUploadsOptions, error)</a>

```
searchKey: graphql.makeGetUploadsOptions
tags: [private]
```

```Go
func makeGetUploadsOptions(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (store.GetUploadsOptions, error)
```

makeGetUploadsOptions translates the given GraphQL arguments into options defined by the store.GetUploads operations. 

### <a id="makeGetIndexesOptions" href="#makeGetIndexesOptions">func makeGetIndexesOptions(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (store.GetIndexesOptions, error)</a>

```
searchKey: graphql.makeGetIndexesOptions
tags: [private]
```

```Go
func makeGetIndexesOptions(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (store.GetIndexesOptions, error)
```

makeGetIndexesOptions translates the given GraphQL arguments into options defined by the store.GetIndexes operations. 

### <a id="resolveRepositoryID" href="#resolveRepositoryID">func resolveRepositoryID(ctx context.Context, id graphql.ID) (int, error)</a>

```
searchKey: graphql.resolveRepositoryID
tags: [private]
```

```Go
func resolveRepositoryID(ctx context.Context, id graphql.ID) (int, error)
```

resolveRepositoryByID gets a repository's internal identifier from a GraphQL identifier. 

### <a id="NewUploadResolver" href="#NewUploadResolver">func NewUploadResolver(upload store.Upload, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadResolver</a>

```
searchKey: graphql.NewUploadResolver
```

```Go
func NewUploadResolver(upload store.Upload, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadResolver
```

### <a id="NewUploadConnectionResolver" href="#NewUploadConnectionResolver">func NewUploadConnectionResolver(resolver *resolvers.UploadsResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadConnectionResolver</a>

```
searchKey: graphql.NewUploadConnectionResolver
```

```Go
func NewUploadConnectionResolver(resolver *resolvers.UploadsResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadConnectionResolver
```

### <a id="strPtr" href="#strPtr">func strPtr(val string) *string</a>

```
searchKey: graphql.strPtr
tags: [private]
```

```Go
func strPtr(val string) *string
```

strPtr creates a pointer to the given value. If the value is an empty string, a nil pointer is returned. 

### <a id="intPtr" href="#intPtr">func intPtr(val int32) *int32</a>

```
searchKey: graphql.intPtr
tags: [private]
```

```Go
func intPtr(val int32) *int32
```

intPtr creates a pointer to the given value. 

### <a id="boolPtr" href="#boolPtr">func boolPtr(val bool) *bool</a>

```
searchKey: graphql.boolPtr
tags: [private]
```

```Go
func boolPtr(val bool) *bool
```

intPtr creates a pointer to the given value. 

### <a id="toInt32" href="#toInt32">func toInt32(val *int) *int32</a>

```
searchKey: graphql.toInt32
tags: [private]
```

```Go
func toInt32(val *int) *int32
```

toInt32 translates the given int pointer into an int32 pointer. 

### <a id="derefString" href="#derefString">func derefString(val *string, defaultValue string) string</a>

```
searchKey: graphql.derefString
tags: [private]
```

```Go
func derefString(val *string, defaultValue string) string
```

derefString returns the underlying value in the given pointer. If the pointer is nil, the default value is returned. 

### <a id="derefInt32" href="#derefInt32">func derefInt32(val *int32, defaultValue int) int</a>

```
searchKey: graphql.derefInt32
tags: [private]
```

```Go
func derefInt32(val *int32, defaultValue int) int
```

derefInt32 returns the underlying value in the given pointer. If the pointer is nil, the default value is returned. 

### <a id="derefBool" href="#derefBool">func derefBool(val *bool, defaultValue bool) bool</a>

```
searchKey: graphql.derefBool
tags: [private]
```

```Go
func derefBool(val *bool, defaultValue bool) bool
```

derefBool returns the underlying value in the given pointer. If the pointer is nil, the default value is returned. 

### <a id="convertRange" href="#convertRange">func convertRange(r lsifstore.Range) lsp.Range</a>

```
searchKey: graphql.convertRange
tags: [private]
```

```Go
func convertRange(r lsifstore.Range) lsp.Range
```

convertRange creates an LSP range from a bundle range. 

### <a id="convertPosition" href="#convertPosition">func convertPosition(line, character int) lsp.Position</a>

```
searchKey: graphql.convertPosition
tags: [private]
```

```Go
func convertPosition(line, character int) lsp.Position
```

convertPosition creates an LSP position from a line and character pair. 

### <a id="TestCursor" href="#TestCursor">func TestCursor(t *testing.T)</a>

```
searchKey: graphql.TestCursor
tags: [private]
```

```Go
func TestCursor(t *testing.T)
```

### <a id="TestCursorEmpty" href="#TestCursorEmpty">func TestCursorEmpty(t *testing.T)</a>

```
searchKey: graphql.TestCursorEmpty
tags: [private]
```

```Go
func TestCursorEmpty(t *testing.T)
```

### <a id="TestIntCursor" href="#TestIntCursor">func TestIntCursor(t *testing.T)</a>

```
searchKey: graphql.TestIntCursor
tags: [private]
```

```Go
func TestIntCursor(t *testing.T)
```

### <a id="TestIntCursorEmpty" href="#TestIntCursorEmpty">func TestIntCursorEmpty(t *testing.T)</a>

```
searchKey: graphql.TestIntCursorEmpty
tags: [private]
```

```Go
func TestIntCursorEmpty(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: graphql.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestUploadID" href="#TestUploadID">func TestUploadID(t *testing.T)</a>

```
searchKey: graphql.TestUploadID
tags: [private]
```

```Go
func TestUploadID(t *testing.T)
```

### <a id="TestUnmarshalUploadIDString" href="#TestUnmarshalUploadIDString">func TestUnmarshalUploadIDString(t *testing.T)</a>

```
searchKey: graphql.TestUnmarshalUploadIDString
tags: [private]
```

```Go
func TestUnmarshalUploadIDString(t *testing.T)
```

### <a id="TestIndexID" href="#TestIndexID">func TestIndexID(t *testing.T)</a>

```
searchKey: graphql.TestIndexID
tags: [private]
```

```Go
func TestIndexID(t *testing.T)
```

### <a id="TestCachedLocationResolver" href="#TestCachedLocationResolver">func TestCachedLocationResolver(t *testing.T)</a>

```
searchKey: graphql.TestCachedLocationResolver
tags: [private]
```

```Go
func TestCachedLocationResolver(t *testing.T)
```

### <a id="TestCachedLocationResolverUnknownRepository" href="#TestCachedLocationResolverUnknownRepository">func TestCachedLocationResolverUnknownRepository(t *testing.T)</a>

```
searchKey: graphql.TestCachedLocationResolverUnknownRepository
tags: [private]
```

```Go
func TestCachedLocationResolverUnknownRepository(t *testing.T)
```

### <a id="TestCachedLocationResolverUnknownCommit" href="#TestCachedLocationResolverUnknownCommit">func TestCachedLocationResolverUnknownCommit(t *testing.T)</a>

```
searchKey: graphql.TestCachedLocationResolverUnknownCommit
tags: [private]
```

```Go
func TestCachedLocationResolverUnknownCommit(t *testing.T)
```

### <a id="TestResolveLocations" href="#TestResolveLocations">func TestResolveLocations(t *testing.T)</a>

```
searchKey: graphql.TestResolveLocations
tags: [private]
```

```Go
func TestResolveLocations(t *testing.T)
```

### <a id="TestPrefetcherUploads" href="#TestPrefetcherUploads">func TestPrefetcherUploads(t *testing.T)</a>

```
searchKey: graphql.TestPrefetcherUploads
tags: [private]
```

```Go
func TestPrefetcherUploads(t *testing.T)
```

### <a id="TestPrefetcherIndexes" href="#TestPrefetcherIndexes">func TestPrefetcherIndexes(t *testing.T)</a>

```
searchKey: graphql.TestPrefetcherIndexes
tags: [private]
```

```Go
func TestPrefetcherIndexes(t *testing.T)
```

### <a id="TestRanges" href="#TestRanges">func TestRanges(t *testing.T)</a>

```
searchKey: graphql.TestRanges
tags: [private]
```

```Go
func TestRanges(t *testing.T)
```

### <a id="TestDefinitions" href="#TestDefinitions">func TestDefinitions(t *testing.T)</a>

```
searchKey: graphql.TestDefinitions
tags: [private]
```

```Go
func TestDefinitions(t *testing.T)
```

### <a id="TestReferences" href="#TestReferences">func TestReferences(t *testing.T)</a>

```
searchKey: graphql.TestReferences
tags: [private]
```

```Go
func TestReferences(t *testing.T)
```

### <a id="TestReferencesDefaultLimit" href="#TestReferencesDefaultLimit">func TestReferencesDefaultLimit(t *testing.T)</a>

```
searchKey: graphql.TestReferencesDefaultLimit
tags: [private]
```

```Go
func TestReferencesDefaultLimit(t *testing.T)
```

### <a id="TestReferencesDefaultIllegalLimit" href="#TestReferencesDefaultIllegalLimit">func TestReferencesDefaultIllegalLimit(t *testing.T)</a>

```
searchKey: graphql.TestReferencesDefaultIllegalLimit
tags: [private]
```

```Go
func TestReferencesDefaultIllegalLimit(t *testing.T)
```

### <a id="TestHover" href="#TestHover">func TestHover(t *testing.T)</a>

```
searchKey: graphql.TestHover
tags: [private]
```

```Go
func TestHover(t *testing.T)
```

### <a id="TestDiagnostics" href="#TestDiagnostics">func TestDiagnostics(t *testing.T)</a>

```
searchKey: graphql.TestDiagnostics
tags: [private]
```

```Go
func TestDiagnostics(t *testing.T)
```

### <a id="TestDiagnosticsDefaultLimit" href="#TestDiagnosticsDefaultLimit">func TestDiagnosticsDefaultLimit(t *testing.T)</a>

```
searchKey: graphql.TestDiagnosticsDefaultLimit
tags: [private]
```

```Go
func TestDiagnosticsDefaultLimit(t *testing.T)
```

### <a id="TestDiagnosticsDefaultIllegalLimit" href="#TestDiagnosticsDefaultIllegalLimit">func TestDiagnosticsDefaultIllegalLimit(t *testing.T)</a>

```
searchKey: graphql.TestDiagnosticsDefaultIllegalLimit
tags: [private]
```

```Go
func TestDiagnosticsDefaultIllegalLimit(t *testing.T)
```

### <a id="init.resolver_test.go" href="#init.resolver_test.go">func init()</a>

```
searchKey: graphql.init
tags: [private]
```

```Go
func init()
```

### <a id="TestDeleteLSIFUpload" href="#TestDeleteLSIFUpload">func TestDeleteLSIFUpload(t *testing.T)</a>

```
searchKey: graphql.TestDeleteLSIFUpload
tags: [private]
```

```Go
func TestDeleteLSIFUpload(t *testing.T)
```

### <a id="TestDeleteLSIFUploadUnauthenticated" href="#TestDeleteLSIFUploadUnauthenticated">func TestDeleteLSIFUploadUnauthenticated(t *testing.T)</a>

```
searchKey: graphql.TestDeleteLSIFUploadUnauthenticated
tags: [private]
```

```Go
func TestDeleteLSIFUploadUnauthenticated(t *testing.T)
```

### <a id="TestDeleteLSIFIndex" href="#TestDeleteLSIFIndex">func TestDeleteLSIFIndex(t *testing.T)</a>

```
searchKey: graphql.TestDeleteLSIFIndex
tags: [private]
```

```Go
func TestDeleteLSIFIndex(t *testing.T)
```

### <a id="TestDeleteLSIFIndexUnauthenticated" href="#TestDeleteLSIFIndexUnauthenticated">func TestDeleteLSIFIndexUnauthenticated(t *testing.T)</a>

```
searchKey: graphql.TestDeleteLSIFIndexUnauthenticated
tags: [private]
```

```Go
func TestDeleteLSIFIndexUnauthenticated(t *testing.T)
```

### <a id="TestMakeGetUploadsOptions" href="#TestMakeGetUploadsOptions">func TestMakeGetUploadsOptions(t *testing.T)</a>

```
searchKey: graphql.TestMakeGetUploadsOptions
tags: [private]
```

```Go
func TestMakeGetUploadsOptions(t *testing.T)
```

### <a id="TestMakeGetUploadsOptionsDefaults" href="#TestMakeGetUploadsOptionsDefaults">func TestMakeGetUploadsOptionsDefaults(t *testing.T)</a>

```
searchKey: graphql.TestMakeGetUploadsOptionsDefaults
tags: [private]
```

```Go
func TestMakeGetUploadsOptionsDefaults(t *testing.T)
```

### <a id="TestMakeGetIndexesOptions" href="#TestMakeGetIndexesOptions">func TestMakeGetIndexesOptions(t *testing.T)</a>

```
searchKey: graphql.TestMakeGetIndexesOptions
tags: [private]
```

```Go
func TestMakeGetIndexesOptions(t *testing.T)
```

### <a id="TestMakeGetIndexesOptionsDefaults" href="#TestMakeGetIndexesOptionsDefaults">func TestMakeGetIndexesOptionsDefaults(t *testing.T)</a>

```
searchKey: graphql.TestMakeGetIndexesOptionsDefaults
tags: [private]
```

```Go
func TestMakeGetIndexesOptionsDefaults(t *testing.T)
```

### <a id="TestDerefString" href="#TestDerefString">func TestDerefString(t *testing.T)</a>

```
searchKey: graphql.TestDerefString
tags: [private]
```

```Go
func TestDerefString(t *testing.T)
```

### <a id="TestDerefInt32" href="#TestDerefInt32">func TestDerefInt32(t *testing.T)</a>

```
searchKey: graphql.TestDerefInt32
tags: [private]
```

```Go
func TestDerefInt32(t *testing.T)
```

### <a id="TestDerefBool" href="#TestDerefBool">func TestDerefBool(t *testing.T)</a>

```
searchKey: graphql.TestDerefBool
tags: [private]
```

```Go
func TestDerefBool(t *testing.T)
```

