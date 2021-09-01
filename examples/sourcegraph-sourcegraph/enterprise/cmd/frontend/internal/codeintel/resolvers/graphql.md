# Package graphql

## Index

* [Constants](#const)
    * [const DefaultDiagnosticsPageSize](#DefaultDiagnosticsPageSize)
    * [const DefaultIndexPageSize](#DefaultIndexPageSize)
    * [const DefaultReferencesPageSize](#DefaultReferencesPageSize)
    * [const DefaultUploadPageSize](#DefaultUploadPageSize)
    * [const numCommits](#numCommits)
    * [const numPaths](#numPaths)
    * [const numRepositories](#numRepositories)
    * [const numRoutines](#numRoutines)
* [Variables](#var)
    * [var ErrIllegalBounds](#ErrIllegalBounds)
    * [var ErrIllegalLimit](#ErrIllegalLimit)
    * [var autoIndexingEnabled](#autoIndexingEnabled)
    * [var errAutoIndexingNotEnabled](#errAutoIndexingNotEnabled)
    * [var severities](#severities)
* [Types](#type)
    * [type CachedLocationResolver struct](#CachedLocationResolver)
        * [func NewCachedLocationResolver(db dbutil.DB) *CachedLocationResolver](#NewCachedLocationResolver)
        * [func (r *CachedLocationResolver) Commit(ctx context.Context, id api.RepoID, commit string) (*gql.GitCommitResolver, error)](#CachedLocationResolver.Commit)
        * [func (r *CachedLocationResolver) Path(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)](#CachedLocationResolver.Path)
        * [func (r *CachedLocationResolver) Repository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)](#CachedLocationResolver.Repository)
        * [func (r *CachedLocationResolver) cachedCommit(ctx context.Context, id api.RepoID, commit string) (*cachedCommitResolver, error)](#CachedLocationResolver.cachedCommit)
        * [func (r *CachedLocationResolver) cachedPath(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)](#CachedLocationResolver.cachedPath)
        * [func (r *CachedLocationResolver) cachedRepository(ctx context.Context, id api.RepoID) (*cachedRepositoryResolver, error)](#CachedLocationResolver.cachedRepository)
        * [func (r *CachedLocationResolver) resolveCommit(ctx context.Context, repositoryResolver *gql.RepositoryResolver, commit string) (*gql.GitCommitResolver, error)](#CachedLocationResolver.resolveCommit)
        * [func (r *CachedLocationResolver) resolvePath(ctx context.Context, commitResolver *gql.GitCommitResolver, path string) (*gql.GitTreeEntryResolver, error)](#CachedLocationResolver.resolvePath)
        * [func (r *CachedLocationResolver) resolveRepository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)](#CachedLocationResolver.resolveRepository)
    * [type CodeIntelligenceRangeConnectionResolver struct](#CodeIntelligenceRangeConnectionResolver)
        * [func (r *CodeIntelligenceRangeConnectionResolver) Nodes(ctx context.Context) ([]gql.CodeIntelligenceRangeResolver, error)](#CodeIntelligenceRangeConnectionResolver.Nodes)
    * [type CodeIntelligenceRangeResolver struct](#CodeIntelligenceRangeResolver)
        * [func (r *CodeIntelligenceRangeResolver) Definitions(ctx context.Context) (gql.LocationConnectionResolver, error)](#CodeIntelligenceRangeResolver.Definitions)
        * [func (r *CodeIntelligenceRangeResolver) Hover(ctx context.Context) (gql.HoverResolver, error)](#CodeIntelligenceRangeResolver.Hover)
        * [func (r *CodeIntelligenceRangeResolver) Range(ctx context.Context) (gql.RangeResolver, error)](#CodeIntelligenceRangeResolver.Range)
        * [func (r *CodeIntelligenceRangeResolver) References(ctx context.Context) (gql.LocationConnectionResolver, error)](#CodeIntelligenceRangeResolver.References)
    * [type DiagnosticConnectionResolver struct](#DiagnosticConnectionResolver)
        * [func (r *DiagnosticConnectionResolver) Nodes(ctx context.Context) ([]gql.DiagnosticResolver, error)](#DiagnosticConnectionResolver.Nodes)
        * [func (r *DiagnosticConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#DiagnosticConnectionResolver.PageInfo)
        * [func (r *DiagnosticConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#DiagnosticConnectionResolver.TotalCount)
    * [type DiagnosticResolver struct](#DiagnosticResolver)
        * [func (r *DiagnosticResolver) Code() (*string, error)](#DiagnosticResolver.Code)
        * [func (r *DiagnosticResolver) Location(ctx context.Context) (gql.LocationResolver, error)](#DiagnosticResolver.Location)
        * [func (r *DiagnosticResolver) Message() (*string, error)](#DiagnosticResolver.Message)
        * [func (r *DiagnosticResolver) Severity() (*string, error)](#DiagnosticResolver.Severity)
        * [func (r *DiagnosticResolver) Source() (*string, error)](#DiagnosticResolver.Source)
    * [type DocumentationPageResolver struct](#DocumentationPageResolver)
        * [func (r *DocumentationPageResolver) Tree() gql.JSONValue](#DocumentationPageResolver.Tree)
    * [type HoverResolver struct](#HoverResolver)
        * [func (r *HoverResolver) Markdown() gql.Markdown](#HoverResolver.Markdown)
        * [func (r *HoverResolver) Range() gql.RangeResolver](#HoverResolver.Range)
    * [type IndexConfigurationResolver struct](#IndexConfigurationResolver)
        * [func (r *IndexConfigurationResolver) Configuration() *string](#IndexConfigurationResolver.Configuration)
    * [type IndexConnectionResolver struct](#IndexConnectionResolver)
        * [func (r *IndexConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFIndexResolver, error)](#IndexConnectionResolver.Nodes)
        * [func (r *IndexConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#IndexConnectionResolver.PageInfo)
        * [func (r *IndexConnectionResolver) TotalCount(ctx context.Context) (*int32, error)](#IndexConnectionResolver.TotalCount)
    * [type IndexResolver struct](#IndexResolver)
        * [func (r *IndexResolver) AssociatedUpload(ctx context.Context) (gql.LSIFUploadResolver, error)](#IndexResolver.AssociatedUpload)
        * [func (r *IndexResolver) Failure() *string](#IndexResolver.Failure)
        * [func (r *IndexResolver) FinishedAt() *gql.DateTime](#IndexResolver.FinishedAt)
        * [func (r *IndexResolver) ID() graphql.ID](#IndexResolver.ID)
        * [func (r *IndexResolver) InputCommit() string](#IndexResolver.InputCommit)
        * [func (r *IndexResolver) InputIndexer() string](#IndexResolver.InputIndexer)
        * [func (r *IndexResolver) InputRoot() string](#IndexResolver.InputRoot)
        * [func (r *IndexResolver) PlaceInQueue() *int32](#IndexResolver.PlaceInQueue)
        * [func (r *IndexResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)](#IndexResolver.ProjectRoot)
        * [func (r *IndexResolver) QueuedAt() gql.DateTime](#IndexResolver.QueuedAt)
        * [func (r *IndexResolver) StartedAt() *gql.DateTime](#IndexResolver.StartedAt)
        * [func (r *IndexResolver) State() string](#IndexResolver.State)
        * [func (r *IndexResolver) Steps() gql.IndexStepsResolver](#IndexResolver.Steps)
    * [type LocationConnectionResolver struct](#LocationConnectionResolver)
        * [func (r *LocationConnectionResolver) Nodes(ctx context.Context) ([]gql.LocationResolver, error)](#LocationConnectionResolver.Nodes)
        * [func (r *LocationConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#LocationConnectionResolver.PageInfo)
    * [type Prefetcher struct](#Prefetcher)
        * [func NewPrefetcher(resolver resolvers.Resolver) *Prefetcher](#NewPrefetcher)
        * [func (p *Prefetcher) GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)](#Prefetcher.GetIndexByID)
        * [func (p *Prefetcher) GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)](#Prefetcher.GetUploadByID)
        * [func (p *Prefetcher) MarkIndex(id int)](#Prefetcher.MarkIndex)
        * [func (p *Prefetcher) MarkUpload(id int)](#Prefetcher.MarkUpload)
    * [type QueryResolver struct](#QueryResolver)
        * [func (r *QueryResolver) Definitions(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.LocationConnectionResolver, error)](#QueryResolver.Definitions)
        * [func (r *QueryResolver) Diagnostics(ctx context.Context, args *gql.LSIFDiagnosticsArgs) (gql.DiagnosticConnectionResolver, error)](#QueryResolver.Diagnostics)
        * [func (r *QueryResolver) DocumentationPage(ctx context.Context, args *gql.LSIFDocumentationPageArgs) (gql.DocumentationPageResolver, error)](#QueryResolver.DocumentationPage)
        * [func (r *QueryResolver) Hover(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.HoverResolver, error)](#QueryResolver.Hover)
        * [func (r *QueryResolver) Ranges(ctx context.Context, args *gql.LSIFRangesArgs) (gql.CodeIntelligenceRangeConnectionResolver, error)](#QueryResolver.Ranges)
        * [func (r *QueryResolver) References(ctx context.Context, args *gql.LSIFPagedQueryPositionArgs) (gql.LocationConnectionResolver, error)](#QueryResolver.References)
        * [func (r *QueryResolver) ToGitBlobLSIFData() (gql.GitBlobLSIFDataResolver, bool)](#QueryResolver.ToGitBlobLSIFData)
        * [func (r *QueryResolver) ToGitTreeLSIFData() (gql.GitTreeLSIFDataResolver, bool)](#QueryResolver.ToGitTreeLSIFData)
    * [type Resolver struct](#Resolver)
        * [func (r *Resolver) CommitGraph(ctx context.Context, id graphql.ID) (gql.CodeIntelligenceCommitGraphResolver, error)](#Resolver.CommitGraph)
        * [func (r *Resolver) DeleteLSIFIndex(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)](#Resolver.DeleteLSIFIndex)
        * [func (r *Resolver) DeleteLSIFUpload(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)](#Resolver.DeleteLSIFUpload)
        * [func (r *Resolver) GitBlobLSIFData(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (gql.GitBlobLSIFDataResolver, error)](#Resolver.GitBlobLSIFData)
        * [func (r *Resolver) IndexConfiguration(ctx context.Context, id graphql.ID) (gql.IndexConfigurationResolver, error)](#Resolver.IndexConfiguration)
        * [func (r *Resolver) LSIFIndexByID(ctx context.Context, id graphql.ID) (gql.LSIFIndexResolver, error)](#Resolver.LSIFIndexByID)
        * [func (r *Resolver) LSIFIndexes(ctx context.Context, args *gql.LSIFIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)](#Resolver.LSIFIndexes)
        * [func (r *Resolver) LSIFIndexesByRepo(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)](#Resolver.LSIFIndexesByRepo)
        * [func (r *Resolver) LSIFUploadByID(ctx context.Context, id graphql.ID) (gql.LSIFUploadResolver, error)](#Resolver.LSIFUploadByID)
        * [func (r *Resolver) LSIFUploads(ctx context.Context, args *gql.LSIFUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)](#Resolver.LSIFUploads)
        * [func (r *Resolver) LSIFUploadsByRepo(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)](#Resolver.LSIFUploadsByRepo)
        * [func (r *Resolver) NodeResolvers() map[string]gql.NodeByIDFunc](#Resolver.NodeResolvers)
        * [func (r *Resolver) QueueAutoIndexJobForRepo(ctx context.Context, args *struct{ Repository graphql.ID }) (*gql.EmptyResponse, error)](#Resolver.QueueAutoIndexJobForRepo)
        * [func (r *Resolver) UpdateRepositoryIndexConfiguration(ctx context.Context, args *gql.UpdateRepositoryIndexConfigurationArgs) (*gql.EmptyResponse, error)](#Resolver.UpdateRepositoryIndexConfiguration)
    * [type UploadConnectionResolver struct](#UploadConnectionResolver)
        * [func (r *UploadConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFUploadResolver, error)](#UploadConnectionResolver.Nodes)
        * [func (r *UploadConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#UploadConnectionResolver.PageInfo)
        * [func (r *UploadConnectionResolver) TotalCount(ctx context.Context) (*int32, error)](#UploadConnectionResolver.TotalCount)
    * [type UploadResolver struct](#UploadResolver)
        * [func (r *UploadResolver) AssociatedIndex(ctx context.Context) (gql.LSIFIndexResolver, error)](#UploadResolver.AssociatedIndex)
        * [func (r *UploadResolver) Failure() *string](#UploadResolver.Failure)
        * [func (r *UploadResolver) FinishedAt() *gql.DateTime](#UploadResolver.FinishedAt)
        * [func (r *UploadResolver) ID() graphql.ID](#UploadResolver.ID)
        * [func (r *UploadResolver) InputCommit() string](#UploadResolver.InputCommit)
        * [func (r *UploadResolver) InputIndexer() string](#UploadResolver.InputIndexer)
        * [func (r *UploadResolver) InputRoot() string](#UploadResolver.InputRoot)
        * [func (r *UploadResolver) IsLatestForRepo() bool](#UploadResolver.IsLatestForRepo)
        * [func (r *UploadResolver) PlaceInQueue() *int32](#UploadResolver.PlaceInQueue)
        * [func (r *UploadResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)](#UploadResolver.ProjectRoot)
        * [func (r *UploadResolver) StartedAt() *gql.DateTime](#UploadResolver.StartedAt)
        * [func (r *UploadResolver) State() string](#UploadResolver.State)
        * [func (r *UploadResolver) UploadedAt() gql.DateTime](#UploadResolver.UploadedAt)
    * [type cachedCommitResolver struct](#cachedCommitResolver)
    * [type cachedRepositoryResolver struct](#cachedRepositoryResolver)
    * [type executionLogEntryResolver struct](#executionLogEntryResolver)
        * [func (r *executionLogEntryResolver) Command() []string](#executionLogEntryResolver.Command)
        * [func (r *executionLogEntryResolver) DurationMilliseconds() int32](#executionLogEntryResolver.DurationMilliseconds)
        * [func (r *executionLogEntryResolver) ExitCode() int32](#executionLogEntryResolver.ExitCode)
        * [func (r *executionLogEntryResolver) Key() string](#executionLogEntryResolver.Key)
        * [func (r *executionLogEntryResolver) Out(ctx context.Context) (string, error)](#executionLogEntryResolver.Out)
        * [func (r *executionLogEntryResolver) StartTime() gql.DateTime](#executionLogEntryResolver.StartTime)
    * [type indexStepResolver struct](#indexStepResolver)
        * [func (r *indexStepResolver) IndexerArgs() []string](#indexStepResolver.IndexerArgs)
        * [func (r *indexStepResolver) LogEntry() gql.ExecutionLogEntryResolver](#indexStepResolver.LogEntry)
        * [func (r *indexStepResolver) Outfile() *string](#indexStepResolver.Outfile)
    * [type indexStepsResolver struct](#indexStepsResolver)
        * [func (r *indexStepsResolver) Index() gql.IndexStepResolver](#indexStepsResolver.Index)
        * [func (r *indexStepsResolver) PreIndex() []gql.PreIndexStepResolver](#indexStepsResolver.PreIndex)
        * [func (r *indexStepsResolver) Setup() []gql.ExecutionLogEntryResolver](#indexStepsResolver.Setup)
        * [func (r *indexStepsResolver) Teardown() []gql.ExecutionLogEntryResolver](#indexStepsResolver.Teardown)
        * [func (r *indexStepsResolver) Upload() gql.ExecutionLogEntryResolver](#indexStepsResolver.Upload)
        * [func (r *indexStepsResolver) executionLogEntryResolversWithPrefix(prefix string) []gql.ExecutionLogEntryResolver](#indexStepsResolver.executionLogEntryResolversWithPrefix)
        * [func (r *indexStepsResolver) findExecutionLogEntry(key string) (workerutil.ExecutionLogEntry, bool)](#indexStepsResolver.findExecutionLogEntry)
    * [type preIndexStepResolver struct](#preIndexStepResolver)
        * [func (r *preIndexStepResolver) Commands() []string](#preIndexStepResolver.Commands)
        * [func (r *preIndexStepResolver) Image() string](#preIndexStepResolver.Image)
        * [func (r *preIndexStepResolver) LogEntry() gql.ExecutionLogEntryResolver](#preIndexStepResolver.LogEntry)
        * [func (r *preIndexStepResolver) Root() string](#preIndexStepResolver.Root)
* [Functions](#func)
    * [func NewDiagnosticConnectionResolver(diagnostics []resolvers.AdjustedDiagnostic, totalCount int, locationResolver *CachedLocationResolver) gql.DiagnosticConnectionResolver](#NewDiagnosticConnectionResolver)
    * [func NewDiagnosticResolver(diagnostic resolvers.AdjustedDiagnostic, locationResolver *CachedLocationResolver) gql.DiagnosticResolver](#NewDiagnosticResolver)
    * [func NewHoverResolver(text string, lspRange lsp.Range) gql.HoverResolver](#NewHoverResolver)
    * [func NewIndexConfigurationResolver(configuration []byte) gql.IndexConfigurationResolver](#NewIndexConfigurationResolver)
    * [func NewIndexConnectionResolver(resolver *resolvers.IndexesResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexConnectionResolver](#NewIndexConnectionResolver)
    * [func NewIndexResolver(index store.Index, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexResolver](#NewIndexResolver)
    * [func NewLocationConnectionResolver(locations []resolvers.AdjustedLocation, cursor *string, locationResolver *CachedLocationResolver) gql.LocationConnectionResolver](#NewLocationConnectionResolver)
    * [func NewQueryResolver(resolver resolvers.QueryResolver, locationResolver *CachedLocationResolver) gql.GitBlobLSIFDataResolver](#NewQueryResolver)
    * [func NewResolver(db dbutil.DB, resolver resolvers.Resolver) gql.CodeIntelResolver](#NewResolver)
    * [func NewUploadConnectionResolver(resolver *resolvers.UploadsResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadConnectionResolver](#NewUploadConnectionResolver)
    * [func NewUploadResolver(upload store.Upload, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadResolver](#NewUploadResolver)
    * [func TestCachedLocationResolver(t *testing.T)](#TestCachedLocationResolver)
    * [func TestCachedLocationResolverUnknownCommit(t *testing.T)](#TestCachedLocationResolverUnknownCommit)
    * [func TestCachedLocationResolverUnknownRepository(t *testing.T)](#TestCachedLocationResolverUnknownRepository)
    * [func TestCursor(t *testing.T)](#TestCursor)
    * [func TestCursorEmpty(t *testing.T)](#TestCursorEmpty)
    * [func TestDefinitions(t *testing.T)](#TestDefinitions)
    * [func TestDeleteLSIFIndex(t *testing.T)](#TestDeleteLSIFIndex)
    * [func TestDeleteLSIFIndexUnauthenticated(t *testing.T)](#TestDeleteLSIFIndexUnauthenticated)
    * [func TestDeleteLSIFUpload(t *testing.T)](#TestDeleteLSIFUpload)
    * [func TestDeleteLSIFUploadUnauthenticated(t *testing.T)](#TestDeleteLSIFUploadUnauthenticated)
    * [func TestDerefBool(t *testing.T)](#TestDerefBool)
    * [func TestDerefInt32(t *testing.T)](#TestDerefInt32)
    * [func TestDerefString(t *testing.T)](#TestDerefString)
    * [func TestDiagnostics(t *testing.T)](#TestDiagnostics)
    * [func TestDiagnosticsDefaultIllegalLimit(t *testing.T)](#TestDiagnosticsDefaultIllegalLimit)
    * [func TestDiagnosticsDefaultLimit(t *testing.T)](#TestDiagnosticsDefaultLimit)
    * [func TestHover(t *testing.T)](#TestHover)
    * [func TestIndexID(t *testing.T)](#TestIndexID)
    * [func TestIntCursor(t *testing.T)](#TestIntCursor)
    * [func TestIntCursorEmpty(t *testing.T)](#TestIntCursorEmpty)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestMakeGetIndexesOptions(t *testing.T)](#TestMakeGetIndexesOptions)
    * [func TestMakeGetIndexesOptionsDefaults(t *testing.T)](#TestMakeGetIndexesOptionsDefaults)
    * [func TestMakeGetUploadsOptions(t *testing.T)](#TestMakeGetUploadsOptions)
    * [func TestMakeGetUploadsOptionsDefaults(t *testing.T)](#TestMakeGetUploadsOptionsDefaults)
    * [func TestPrefetcherIndexes(t *testing.T)](#TestPrefetcherIndexes)
    * [func TestPrefetcherUploads(t *testing.T)](#TestPrefetcherUploads)
    * [func TestRanges(t *testing.T)](#TestRanges)
    * [func TestReferences(t *testing.T)](#TestReferences)
    * [func TestReferencesDefaultIllegalLimit(t *testing.T)](#TestReferencesDefaultIllegalLimit)
    * [func TestReferencesDefaultLimit(t *testing.T)](#TestReferencesDefaultLimit)
    * [func TestResolveLocations(t *testing.T)](#TestResolveLocations)
    * [func TestUnmarshalUploadIDString(t *testing.T)](#TestUnmarshalUploadIDString)
    * [func TestUploadID(t *testing.T)](#TestUploadID)
    * [func boolPtr(val bool) *bool](#boolPtr)
    * [func convertPosition(line, character int) lsp.Position](#convertPosition)
    * [func convertRange(r lsifstore.Range) lsp.Range](#convertRange)
    * [func decodeCursor(val *string) (string, error)](#decodeCursor)
    * [func decodeIntCursor(val *string) (int, error)](#decodeIntCursor)
    * [func derefBool(val *bool, defaultValue bool) bool](#derefBool)
    * [func derefInt32(val *int32, defaultValue int) int](#derefInt32)
    * [func derefString(val *string, defaultValue string) string](#derefString)
    * [func encodeCursor(val *string) *graphqlutil.PageInfo](#encodeCursor)
    * [func encodeIntCursor(val *int32) *graphqlutil.PageInfo](#encodeIntCursor)
    * [func init()](#init.resolver_test.go)
    * [func intPtr(val int32) *int32](#intPtr)
    * [func makeGetIndexesOptions(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (store.GetIndexesOptions, error)](#makeGetIndexesOptions)
    * [func makeGetUploadsOptions(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (store.GetUploadsOptions, error)](#makeGetUploadsOptions)
    * [func marshalLSIFIndexGQLID(indexID int64) graphql.ID](#marshalLSIFIndexGQLID)
    * [func marshalLSIFUploadGQLID(uploadID int64) graphql.ID](#marshalLSIFUploadGQLID)
    * [func resolveLocation(ctx context.Context, locationResolver *CachedLocationResolver, location resolvers.AdjustedLocation) (gql.LocationResolver, error)](#resolveLocation)
    * [func resolveLocations(ctx context.Context, locationResolver *CachedLocationResolver, locations []resolvers.AdjustedLocation) ([]gql.LocationResolver, error)](#resolveLocations)
    * [func resolveRepositoryID(ctx context.Context, id graphql.ID) (int, error)](#resolveRepositoryID)
    * [func strPtr(val string) *string](#strPtr)
    * [func toInt32(val *int) *int32](#toInt32)
    * [func toSeverity(val int) (*string, error)](#toSeverity)
    * [func unmarshalLSIFIndexGQLID(id graphql.ID) (indexID int64, err error)](#unmarshalLSIFIndexGQLID)
    * [func unmarshalLSIFUploadGQLID(id graphql.ID) (uploadID int64, err error)](#unmarshalLSIFUploadGQLID)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="DefaultDiagnosticsPageSize" href="#DefaultDiagnosticsPageSize">const DefaultDiagnosticsPageSize</a>

```
searchKey: graphql.DefaultDiagnosticsPageSize
tags: [constant number]
```

```Go
const DefaultDiagnosticsPageSize = 100
```

DefaultDiagnosticsPageSize is the diagnostic result page size when no limit is supplied. 

### <a id="DefaultIndexPageSize" href="#DefaultIndexPageSize">const DefaultIndexPageSize</a>

```
searchKey: graphql.DefaultIndexPageSize
tags: [constant number]
```

```Go
const DefaultIndexPageSize = 50
```

### <a id="DefaultReferencesPageSize" href="#DefaultReferencesPageSize">const DefaultReferencesPageSize</a>

```
searchKey: graphql.DefaultReferencesPageSize
tags: [constant number]
```

```Go
const DefaultReferencesPageSize = 100
```

DefaultReferencesPageSize is the reference result page size when no limit is supplied. 

### <a id="DefaultUploadPageSize" href="#DefaultUploadPageSize">const DefaultUploadPageSize</a>

```
searchKey: graphql.DefaultUploadPageSize
tags: [constant number]
```

```Go
const DefaultUploadPageSize = 50
```

### <a id="numCommits" href="#numCommits">const numCommits</a>

```
searchKey: graphql.numCommits
tags: [constant number private]
```

```Go
const numCommits = 10 // per repo

```

### <a id="numPaths" href="#numPaths">const numPaths</a>

```
searchKey: graphql.numPaths
tags: [constant number private]
```

```Go
const numPaths = 10 // per commit

```

### <a id="numRepositories" href="#numRepositories">const numRepositories</a>

```
searchKey: graphql.numRepositories
tags: [constant number private]
```

```Go
const numRepositories = 10
```

### <a id="numRoutines" href="#numRoutines">const numRoutines</a>

```
searchKey: graphql.numRoutines
tags: [constant number private]
```

```Go
const numRoutines = 5
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrIllegalBounds" href="#ErrIllegalBounds">var ErrIllegalBounds</a>

```
searchKey: graphql.ErrIllegalBounds
tags: [variable interface]
```

```Go
var ErrIllegalBounds = errors.New("illegal bounds")
```

ErrIllegalBounds occurs when a negative or zero-width bound is supplied by the user. 

### <a id="ErrIllegalLimit" href="#ErrIllegalLimit">var ErrIllegalLimit</a>

```
searchKey: graphql.ErrIllegalLimit
tags: [variable interface]
```

```Go
var ErrIllegalLimit = errors.New("illegal limit")
```

ErrIllegalLimit occurs when the user requests less than one object per page. 

### <a id="autoIndexingEnabled" href="#autoIndexingEnabled">var autoIndexingEnabled</a>

```
searchKey: graphql.autoIndexingEnabled
tags: [variable function private]
```

```Go
var autoIndexingEnabled = conf.CodeIntelAutoIndexingEnabled
```

### <a id="errAutoIndexingNotEnabled" href="#errAutoIndexingNotEnabled">var errAutoIndexingNotEnabled</a>

```
searchKey: graphql.errAutoIndexingNotEnabled
tags: [variable interface private]
```

```Go
var errAutoIndexingNotEnabled = errors.New("precise code intelligence auto indexing is not enabled")
```

### <a id="severities" href="#severities">var severities</a>

```
searchKey: graphql.severities
tags: [variable object private]
```

```Go
var severities = map[int]string{
	1: "ERROR",
	2: "WARNING",
	3: "INFORMATION",
	4: "HINT",
}
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CachedLocationResolver" href="#CachedLocationResolver">type CachedLocationResolver struct</a>

```
searchKey: graphql.CachedLocationResolver
tags: [struct]
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
tags: [function]
```

```Go
func NewCachedLocationResolver(db dbutil.DB) *CachedLocationResolver
```

NewCachedLocationResolver creates a location resolver with an empty cache. 

#### <a id="CachedLocationResolver.Commit" href="#CachedLocationResolver.Commit">func (r *CachedLocationResolver) Commit(ctx context.Context, id api.RepoID, commit string) (*gql.GitCommitResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.Commit
tags: [method]
```

```Go
func (r *CachedLocationResolver) Commit(ctx context.Context, id api.RepoID, commit string) (*gql.GitCommitResolver, error)
```

Commit resolves the git commit with the given repository identifier and commit hash. This method may return a nil resolver if the commit is not known by gitserver. 

#### <a id="CachedLocationResolver.Path" href="#CachedLocationResolver.Path">func (r *CachedLocationResolver) Path(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.Path
tags: [method]
```

```Go
func (r *CachedLocationResolver) Path(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)
```

Path resolves the git tree entry with the given repository identifier, commit hash, and relative path. This method may return a nil resolver if the commit is not known by gitserver. 

#### <a id="CachedLocationResolver.Repository" href="#CachedLocationResolver.Repository">func (r *CachedLocationResolver) Repository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.Repository
tags: [method]
```

```Go
func (r *CachedLocationResolver) Repository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)
```

Repository resolves the repository with the given identifier. This method may return a nil resolver if the repository is not known by gitserver - this happens if there is exists still a bundle for a repo that has since been deleted. 

#### <a id="CachedLocationResolver.cachedCommit" href="#CachedLocationResolver.cachedCommit">func (r *CachedLocationResolver) cachedCommit(ctx context.Context, id api.RepoID, commit string) (*cachedCommitResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.cachedCommit
tags: [method private]
```

```Go
func (r *CachedLocationResolver) cachedCommit(ctx context.Context, id api.RepoID, commit string) (*cachedCommitResolver, error)
```

cachedCommit resolves the commit with the given repository identifier and commit hash if the resulting resolver does not already exist in the cache. The cache is tested/populated with double-checked locking, which ensures that the resolver is created exactly once per GraphQL request. 

See [https://en.wikipedia.org/wiki/Double-checked_locking](https://en.wikipedia.org/wiki/Double-checked_locking). 

#### <a id="CachedLocationResolver.cachedPath" href="#CachedLocationResolver.cachedPath">func (r *CachedLocationResolver) cachedPath(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.cachedPath
tags: [method private]
```

```Go
func (r *CachedLocationResolver) cachedPath(ctx context.Context, id api.RepoID, commit, path string) (*gql.GitTreeEntryResolver, error)
```

cachedPath resolves the commit with the given repository identifier, commit hash, and relative path if the resulting resolver does not already exist in the cache. The cache is tested/populated with double-checked locking, which ensures that the resolver is created exactly once per GraphQL request. 

See [https://en.wikipedia.org/wiki/Double-checked_locking](https://en.wikipedia.org/wiki/Double-checked_locking). 

#### <a id="CachedLocationResolver.cachedRepository" href="#CachedLocationResolver.cachedRepository">func (r *CachedLocationResolver) cachedRepository(ctx context.Context, id api.RepoID) (*cachedRepositoryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.cachedRepository
tags: [method private]
```

```Go
func (r *CachedLocationResolver) cachedRepository(ctx context.Context, id api.RepoID) (*cachedRepositoryResolver, error)
```

cachedRepository resolves the repository with the given identifier if the resulting resolver does not already exist in the cache. The cache is tested/populated with double-checked locking, which ensures that the resolver is created exactly once per GraphQL request. 

See [https://en.wikipedia.org/wiki/Double-checked_locking](https://en.wikipedia.org/wiki/Double-checked_locking). 

#### <a id="CachedLocationResolver.resolveCommit" href="#CachedLocationResolver.resolveCommit">func (r *CachedLocationResolver) resolveCommit(ctx context.Context, repositoryResolver *gql.RepositoryResolver, commit string) (*gql.GitCommitResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.resolveCommit
tags: [method private]
```

```Go
func (r *CachedLocationResolver) resolveCommit(ctx context.Context, repositoryResolver *gql.RepositoryResolver, commit string) (*gql.GitCommitResolver, error)
```

Commit resolves the git commit with the given repository resolver and commit hash. This method may return a nil resolver if the commit is not known by gitserver. This method must be called only when constructing a resolver to populate the cache. 

#### <a id="CachedLocationResolver.resolvePath" href="#CachedLocationResolver.resolvePath">func (r *CachedLocationResolver) resolvePath(ctx context.Context, commitResolver *gql.GitCommitResolver, path string) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.resolvePath
tags: [method private]
```

```Go
func (r *CachedLocationResolver) resolvePath(ctx context.Context, commitResolver *gql.GitCommitResolver, path string) (*gql.GitTreeEntryResolver, error)
```

Path resolves the git tree entry with the given commit resolver and relative path. This method must be called only when constructing a resolver to populate the cache. 

#### <a id="CachedLocationResolver.resolveRepository" href="#CachedLocationResolver.resolveRepository">func (r *CachedLocationResolver) resolveRepository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)</a>

```
searchKey: graphql.CachedLocationResolver.resolveRepository
tags: [method private]
```

```Go
func (r *CachedLocationResolver) resolveRepository(ctx context.Context, id api.RepoID) (*gql.RepositoryResolver, error)
```

Repository resolves the repository with the given identifier. This method may return a nil resolver if the repository is not known by gitserver - this happens if there is exists still a bundle for a repo that has since been deleted. This method must be called only when constructing a resolver to populate the cache. 

### <a id="CodeIntelligenceRangeConnectionResolver" href="#CodeIntelligenceRangeConnectionResolver">type CodeIntelligenceRangeConnectionResolver struct</a>

```
searchKey: graphql.CodeIntelligenceRangeConnectionResolver
tags: [struct]
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
tags: [method]
```

```Go
func (r *CodeIntelligenceRangeConnectionResolver) Nodes(ctx context.Context) ([]gql.CodeIntelligenceRangeResolver, error)
```

### <a id="CodeIntelligenceRangeResolver" href="#CodeIntelligenceRangeResolver">type CodeIntelligenceRangeResolver struct</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver
tags: [struct]
```

```Go
type CodeIntelligenceRangeResolver struct {
	r                resolvers.AdjustedCodeIntelligenceRange
	locationResolver *CachedLocationResolver
}
```

#### <a id="CodeIntelligenceRangeResolver.Definitions" href="#CodeIntelligenceRangeResolver.Definitions">func (r *CodeIntelligenceRangeResolver) Definitions(ctx context.Context) (gql.LocationConnectionResolver, error)</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver.Definitions
tags: [method]
```

```Go
func (r *CodeIntelligenceRangeResolver) Definitions(ctx context.Context) (gql.LocationConnectionResolver, error)
```

#### <a id="CodeIntelligenceRangeResolver.Hover" href="#CodeIntelligenceRangeResolver.Hover">func (r *CodeIntelligenceRangeResolver) Hover(ctx context.Context) (gql.HoverResolver, error)</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver.Hover
tags: [method]
```

```Go
func (r *CodeIntelligenceRangeResolver) Hover(ctx context.Context) (gql.HoverResolver, error)
```

#### <a id="CodeIntelligenceRangeResolver.Range" href="#CodeIntelligenceRangeResolver.Range">func (r *CodeIntelligenceRangeResolver) Range(ctx context.Context) (gql.RangeResolver, error)</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver.Range
tags: [method]
```

```Go
func (r *CodeIntelligenceRangeResolver) Range(ctx context.Context) (gql.RangeResolver, error)
```

#### <a id="CodeIntelligenceRangeResolver.References" href="#CodeIntelligenceRangeResolver.References">func (r *CodeIntelligenceRangeResolver) References(ctx context.Context) (gql.LocationConnectionResolver, error)</a>

```
searchKey: graphql.CodeIntelligenceRangeResolver.References
tags: [method]
```

```Go
func (r *CodeIntelligenceRangeResolver) References(ctx context.Context) (gql.LocationConnectionResolver, error)
```

### <a id="DiagnosticConnectionResolver" href="#DiagnosticConnectionResolver">type DiagnosticConnectionResolver struct</a>

```
searchKey: graphql.DiagnosticConnectionResolver
tags: [struct]
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
tags: [method]
```

```Go
func (r *DiagnosticConnectionResolver) Nodes(ctx context.Context) ([]gql.DiagnosticResolver, error)
```

#### <a id="DiagnosticConnectionResolver.PageInfo" href="#DiagnosticConnectionResolver.PageInfo">func (r *DiagnosticConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphql.DiagnosticConnectionResolver.PageInfo
tags: [method]
```

```Go
func (r *DiagnosticConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="DiagnosticConnectionResolver.TotalCount" href="#DiagnosticConnectionResolver.TotalCount">func (r *DiagnosticConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphql.DiagnosticConnectionResolver.TotalCount
tags: [method]
```

```Go
func (r *DiagnosticConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

### <a id="DiagnosticResolver" href="#DiagnosticResolver">type DiagnosticResolver struct</a>

```
searchKey: graphql.DiagnosticResolver
tags: [struct]
```

```Go
type DiagnosticResolver struct {
	diagnostic       resolvers.AdjustedDiagnostic
	locationResolver *CachedLocationResolver
}
```

#### <a id="DiagnosticResolver.Code" href="#DiagnosticResolver.Code">func (r *DiagnosticResolver) Code() (*string, error)</a>

```
searchKey: graphql.DiagnosticResolver.Code
tags: [method]
```

```Go
func (r *DiagnosticResolver) Code() (*string, error)
```

#### <a id="DiagnosticResolver.Location" href="#DiagnosticResolver.Location">func (r *DiagnosticResolver) Location(ctx context.Context) (gql.LocationResolver, error)</a>

```
searchKey: graphql.DiagnosticResolver.Location
tags: [method]
```

```Go
func (r *DiagnosticResolver) Location(ctx context.Context) (gql.LocationResolver, error)
```

#### <a id="DiagnosticResolver.Message" href="#DiagnosticResolver.Message">func (r *DiagnosticResolver) Message() (*string, error)</a>

```
searchKey: graphql.DiagnosticResolver.Message
tags: [method]
```

```Go
func (r *DiagnosticResolver) Message() (*string, error)
```

#### <a id="DiagnosticResolver.Severity" href="#DiagnosticResolver.Severity">func (r *DiagnosticResolver) Severity() (*string, error)</a>

```
searchKey: graphql.DiagnosticResolver.Severity
tags: [method]
```

```Go
func (r *DiagnosticResolver) Severity() (*string, error)
```

#### <a id="DiagnosticResolver.Source" href="#DiagnosticResolver.Source">func (r *DiagnosticResolver) Source() (*string, error)</a>

```
searchKey: graphql.DiagnosticResolver.Source
tags: [method]
```

```Go
func (r *DiagnosticResolver) Source() (*string, error)
```

### <a id="DocumentationPageResolver" href="#DocumentationPageResolver">type DocumentationPageResolver struct</a>

```
searchKey: graphql.DocumentationPageResolver
tags: [struct]
```

```Go
type DocumentationPageResolver struct {
	tree gql.JSONValue
}
```

#### <a id="DocumentationPageResolver.Tree" href="#DocumentationPageResolver.Tree">func (r *DocumentationPageResolver) Tree() gql.JSONValue</a>

```
searchKey: graphql.DocumentationPageResolver.Tree
tags: [method]
```

```Go
func (r *DocumentationPageResolver) Tree() gql.JSONValue
```

### <a id="HoverResolver" href="#HoverResolver">type HoverResolver struct</a>

```
searchKey: graphql.HoverResolver
tags: [struct]
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
tags: [method]
```

```Go
func (r *HoverResolver) Markdown() gql.Markdown
```

#### <a id="HoverResolver.Range" href="#HoverResolver.Range">func (r *HoverResolver) Range() gql.RangeResolver</a>

```
searchKey: graphql.HoverResolver.Range
tags: [method]
```

```Go
func (r *HoverResolver) Range() gql.RangeResolver
```

### <a id="IndexConfigurationResolver" href="#IndexConfigurationResolver">type IndexConfigurationResolver struct</a>

```
searchKey: graphql.IndexConfigurationResolver
tags: [struct]
```

```Go
type IndexConfigurationResolver struct {
	configuration []byte
}
```

#### <a id="IndexConfigurationResolver.Configuration" href="#IndexConfigurationResolver.Configuration">func (r *IndexConfigurationResolver) Configuration() *string</a>

```
searchKey: graphql.IndexConfigurationResolver.Configuration
tags: [method]
```

```Go
func (r *IndexConfigurationResolver) Configuration() *string
```

### <a id="IndexConnectionResolver" href="#IndexConnectionResolver">type IndexConnectionResolver struct</a>

```
searchKey: graphql.IndexConnectionResolver
tags: [struct]
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
tags: [method]
```

```Go
func (r *IndexConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFIndexResolver, error)
```

#### <a id="IndexConnectionResolver.PageInfo" href="#IndexConnectionResolver.PageInfo">func (r *IndexConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphql.IndexConnectionResolver.PageInfo
tags: [method]
```

```Go
func (r *IndexConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="IndexConnectionResolver.TotalCount" href="#IndexConnectionResolver.TotalCount">func (r *IndexConnectionResolver) TotalCount(ctx context.Context) (*int32, error)</a>

```
searchKey: graphql.IndexConnectionResolver.TotalCount
tags: [method]
```

```Go
func (r *IndexConnectionResolver) TotalCount(ctx context.Context) (*int32, error)
```

### <a id="IndexResolver" href="#IndexResolver">type IndexResolver struct</a>

```
searchKey: graphql.IndexResolver
tags: [struct]
```

```Go
type IndexResolver struct {
	index            store.Index
	prefetcher       *Prefetcher
	locationResolver *CachedLocationResolver
}
```

#### <a id="IndexResolver.AssociatedUpload" href="#IndexResolver.AssociatedUpload">func (r *IndexResolver) AssociatedUpload(ctx context.Context) (gql.LSIFUploadResolver, error)</a>

```
searchKey: graphql.IndexResolver.AssociatedUpload
tags: [method]
```

```Go
func (r *IndexResolver) AssociatedUpload(ctx context.Context) (gql.LSIFUploadResolver, error)
```

#### <a id="IndexResolver.Failure" href="#IndexResolver.Failure">func (r *IndexResolver) Failure() *string</a>

```
searchKey: graphql.IndexResolver.Failure
tags: [method]
```

```Go
func (r *IndexResolver) Failure() *string
```

#### <a id="IndexResolver.FinishedAt" href="#IndexResolver.FinishedAt">func (r *IndexResolver) FinishedAt() *gql.DateTime</a>

```
searchKey: graphql.IndexResolver.FinishedAt
tags: [method]
```

```Go
func (r *IndexResolver) FinishedAt() *gql.DateTime
```

#### <a id="IndexResolver.ID" href="#IndexResolver.ID">func (r *IndexResolver) ID() graphql.ID</a>

```
searchKey: graphql.IndexResolver.ID
tags: [method]
```

```Go
func (r *IndexResolver) ID() graphql.ID
```

#### <a id="IndexResolver.InputCommit" href="#IndexResolver.InputCommit">func (r *IndexResolver) InputCommit() string</a>

```
searchKey: graphql.IndexResolver.InputCommit
tags: [method]
```

```Go
func (r *IndexResolver) InputCommit() string
```

#### <a id="IndexResolver.InputIndexer" href="#IndexResolver.InputIndexer">func (r *IndexResolver) InputIndexer() string</a>

```
searchKey: graphql.IndexResolver.InputIndexer
tags: [method]
```

```Go
func (r *IndexResolver) InputIndexer() string
```

#### <a id="IndexResolver.InputRoot" href="#IndexResolver.InputRoot">func (r *IndexResolver) InputRoot() string</a>

```
searchKey: graphql.IndexResolver.InputRoot
tags: [method]
```

```Go
func (r *IndexResolver) InputRoot() string
```

#### <a id="IndexResolver.PlaceInQueue" href="#IndexResolver.PlaceInQueue">func (r *IndexResolver) PlaceInQueue() *int32</a>

```
searchKey: graphql.IndexResolver.PlaceInQueue
tags: [method]
```

```Go
func (r *IndexResolver) PlaceInQueue() *int32
```

#### <a id="IndexResolver.ProjectRoot" href="#IndexResolver.ProjectRoot">func (r *IndexResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.IndexResolver.ProjectRoot
tags: [method]
```

```Go
func (r *IndexResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)
```

#### <a id="IndexResolver.QueuedAt" href="#IndexResolver.QueuedAt">func (r *IndexResolver) QueuedAt() gql.DateTime</a>

```
searchKey: graphql.IndexResolver.QueuedAt
tags: [method]
```

```Go
func (r *IndexResolver) QueuedAt() gql.DateTime
```

#### <a id="IndexResolver.StartedAt" href="#IndexResolver.StartedAt">func (r *IndexResolver) StartedAt() *gql.DateTime</a>

```
searchKey: graphql.IndexResolver.StartedAt
tags: [method]
```

```Go
func (r *IndexResolver) StartedAt() *gql.DateTime
```

#### <a id="IndexResolver.State" href="#IndexResolver.State">func (r *IndexResolver) State() string</a>

```
searchKey: graphql.IndexResolver.State
tags: [method]
```

```Go
func (r *IndexResolver) State() string
```

#### <a id="IndexResolver.Steps" href="#IndexResolver.Steps">func (r *IndexResolver) Steps() gql.IndexStepsResolver</a>

```
searchKey: graphql.IndexResolver.Steps
tags: [method]
```

```Go
func (r *IndexResolver) Steps() gql.IndexStepsResolver
```

### <a id="LocationConnectionResolver" href="#LocationConnectionResolver">type LocationConnectionResolver struct</a>

```
searchKey: graphql.LocationConnectionResolver
tags: [struct]
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
tags: [method]
```

```Go
func (r *LocationConnectionResolver) Nodes(ctx context.Context) ([]gql.LocationResolver, error)
```

#### <a id="LocationConnectionResolver.PageInfo" href="#LocationConnectionResolver.PageInfo">func (r *LocationConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphql.LocationConnectionResolver.PageInfo
tags: [method]
```

```Go
func (r *LocationConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="Prefetcher" href="#Prefetcher">type Prefetcher struct</a>

```
searchKey: graphql.Prefetcher
tags: [struct]
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
tags: [function]
```

```Go
func NewPrefetcher(resolver resolvers.Resolver) *Prefetcher
```

NewPrefetcher returns a prefetcher with an empty cache. 

#### <a id="Prefetcher.GetIndexByID" href="#Prefetcher.GetIndexByID">func (p *Prefetcher) GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)</a>

```
searchKey: graphql.Prefetcher.GetIndexByID
tags: [method]
```

```Go
func (p *Prefetcher) GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)
```

GetIndexByID will return an index with the given identifier as well as a boolean flag indicating such a record's existence. If the given ID has already been fetched by another call to GetIndexByID, that record is returned immediately. Otherwise, the given identifier will be added to the current batch of identifiers constructed via calls to MarkIndex. All indexes will in the current batch are requested at once and the index with the given identifier is returned from that result set. 

#### <a id="Prefetcher.GetUploadByID" href="#Prefetcher.GetUploadByID">func (p *Prefetcher) GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)</a>

```
searchKey: graphql.Prefetcher.GetUploadByID
tags: [method]
```

```Go
func (p *Prefetcher) GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)
```

GetUploadByID will return an upload with the given identifier as well as a boolean flag indicating such a record's existence. If the given ID has already been fetched by another call to GetUploadByID, that record is returned immediately. Otherwise, the given identifier will be added to the current batch of identifiers constructed via calls to MarkUpload. All uploads will in the current batch are requested at once and the upload with the given identifier is returned from that result set. 

#### <a id="Prefetcher.MarkIndex" href="#Prefetcher.MarkIndex">func (p *Prefetcher) MarkIndex(id int)</a>

```
searchKey: graphql.Prefetcher.MarkIndex
tags: [method]
```

```Go
func (p *Prefetcher) MarkIndex(id int)
```

MarkIndex adds the given identifier to the next batch of indexes to fetch. 

#### <a id="Prefetcher.MarkUpload" href="#Prefetcher.MarkUpload">func (p *Prefetcher) MarkUpload(id int)</a>

```
searchKey: graphql.Prefetcher.MarkUpload
tags: [method]
```

```Go
func (p *Prefetcher) MarkUpload(id int)
```

MarkUpload adds the given identifier to the next batch of uploads to fetch. 

### <a id="QueryResolver" href="#QueryResolver">type QueryResolver struct</a>

```
searchKey: graphql.QueryResolver
tags: [struct]
```

```Go
type QueryResolver struct {
	resolver         resolvers.QueryResolver
	locationResolver *CachedLocationResolver
}
```

QueryResolver is the main interface to bundle-related operations exposed to the GraphQL API. This resolver concerns itself with GraphQL/API-specific behaviors (auth, validation, marshaling, etc.). All code intel-specific behavior is delegated to the underlying resolver instance, which is defined in the parent package. 

#### <a id="QueryResolver.Definitions" href="#QueryResolver.Definitions">func (r *QueryResolver) Definitions(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.LocationConnectionResolver, error)</a>

```
searchKey: graphql.QueryResolver.Definitions
tags: [method]
```

```Go
func (r *QueryResolver) Definitions(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.LocationConnectionResolver, error)
```

#### <a id="QueryResolver.Diagnostics" href="#QueryResolver.Diagnostics">func (r *QueryResolver) Diagnostics(ctx context.Context, args *gql.LSIFDiagnosticsArgs) (gql.DiagnosticConnectionResolver, error)</a>

```
searchKey: graphql.QueryResolver.Diagnostics
tags: [method]
```

```Go
func (r *QueryResolver) Diagnostics(ctx context.Context, args *gql.LSIFDiagnosticsArgs) (gql.DiagnosticConnectionResolver, error)
```

#### <a id="QueryResolver.DocumentationPage" href="#QueryResolver.DocumentationPage">func (r *QueryResolver) DocumentationPage(ctx context.Context, args *gql.LSIFDocumentationPageArgs) (gql.DocumentationPageResolver, error)</a>

```
searchKey: graphql.QueryResolver.DocumentationPage
tags: [method]
```

```Go
func (r *QueryResolver) DocumentationPage(ctx context.Context, args *gql.LSIFDocumentationPageArgs) (gql.DocumentationPageResolver, error)
```

#### <a id="QueryResolver.Hover" href="#QueryResolver.Hover">func (r *QueryResolver) Hover(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.HoverResolver, error)</a>

```
searchKey: graphql.QueryResolver.Hover
tags: [method]
```

```Go
func (r *QueryResolver) Hover(ctx context.Context, args *gql.LSIFQueryPositionArgs) (gql.HoverResolver, error)
```

#### <a id="QueryResolver.Ranges" href="#QueryResolver.Ranges">func (r *QueryResolver) Ranges(ctx context.Context, args *gql.LSIFRangesArgs) (gql.CodeIntelligenceRangeConnectionResolver, error)</a>

```
searchKey: graphql.QueryResolver.Ranges
tags: [method]
```

```Go
func (r *QueryResolver) Ranges(ctx context.Context, args *gql.LSIFRangesArgs) (gql.CodeIntelligenceRangeConnectionResolver, error)
```

#### <a id="QueryResolver.References" href="#QueryResolver.References">func (r *QueryResolver) References(ctx context.Context, args *gql.LSIFPagedQueryPositionArgs) (gql.LocationConnectionResolver, error)</a>

```
searchKey: graphql.QueryResolver.References
tags: [method]
```

```Go
func (r *QueryResolver) References(ctx context.Context, args *gql.LSIFPagedQueryPositionArgs) (gql.LocationConnectionResolver, error)
```

#### <a id="QueryResolver.ToGitBlobLSIFData" href="#QueryResolver.ToGitBlobLSIFData">func (r *QueryResolver) ToGitBlobLSIFData() (gql.GitBlobLSIFDataResolver, bool)</a>

```
searchKey: graphql.QueryResolver.ToGitBlobLSIFData
tags: [method]
```

```Go
func (r *QueryResolver) ToGitBlobLSIFData() (gql.GitBlobLSIFDataResolver, bool)
```

#### <a id="QueryResolver.ToGitTreeLSIFData" href="#QueryResolver.ToGitTreeLSIFData">func (r *QueryResolver) ToGitTreeLSIFData() (gql.GitTreeLSIFDataResolver, bool)</a>

```
searchKey: graphql.QueryResolver.ToGitTreeLSIFData
tags: [method]
```

```Go
func (r *QueryResolver) ToGitTreeLSIFData() (gql.GitTreeLSIFDataResolver, bool)
```

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: graphql.Resolver
tags: [struct]
```

```Go
type Resolver struct {
	resolver         resolvers.Resolver
	locationResolver *CachedLocationResolver
}
```

Resolver is the main interface to code intel-related operations exposted to the GraphQL API. This resolver concerns itself with GraphQL/API-specific behaviors (auth, validation, marshaling, etc.). All code intel-specific behavior is delegated to the underlying resolver instance, which is defined in the parent package. 

#### <a id="Resolver.CommitGraph" href="#Resolver.CommitGraph">func (r *Resolver) CommitGraph(ctx context.Context, id graphql.ID) (gql.CodeIntelligenceCommitGraphResolver, error)</a>

```
searchKey: graphql.Resolver.CommitGraph
tags: [method]
```

```Go
func (r *Resolver) CommitGraph(ctx context.Context, id graphql.ID) (gql.CodeIntelligenceCommitGraphResolver, error)
```

#### <a id="Resolver.DeleteLSIFIndex" href="#Resolver.DeleteLSIFIndex">func (r *Resolver) DeleteLSIFIndex(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)</a>

```
searchKey: graphql.Resolver.DeleteLSIFIndex
tags: [method]
```

```Go
func (r *Resolver) DeleteLSIFIndex(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)
```

#### <a id="Resolver.DeleteLSIFUpload" href="#Resolver.DeleteLSIFUpload">func (r *Resolver) DeleteLSIFUpload(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)</a>

```
searchKey: graphql.Resolver.DeleteLSIFUpload
tags: [method]
```

```Go
func (r *Resolver) DeleteLSIFUpload(ctx context.Context, args *struct{ ID graphql.ID }) (*gql.EmptyResponse, error)
```

#### <a id="Resolver.GitBlobLSIFData" href="#Resolver.GitBlobLSIFData">func (r *Resolver) GitBlobLSIFData(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (gql.GitBlobLSIFDataResolver, error)</a>

```
searchKey: graphql.Resolver.GitBlobLSIFData
tags: [method]
```

```Go
func (r *Resolver) GitBlobLSIFData(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (gql.GitBlobLSIFDataResolver, error)
```

#### <a id="Resolver.IndexConfiguration" href="#Resolver.IndexConfiguration">func (r *Resolver) IndexConfiguration(ctx context.Context, id graphql.ID) (gql.IndexConfigurationResolver, error)</a>

```
searchKey: graphql.Resolver.IndexConfiguration
tags: [method]
```

```Go
func (r *Resolver) IndexConfiguration(ctx context.Context, id graphql.ID) (gql.IndexConfigurationResolver, error)
```

#### <a id="Resolver.LSIFIndexByID" href="#Resolver.LSIFIndexByID">func (r *Resolver) LSIFIndexByID(ctx context.Context, id graphql.ID) (gql.LSIFIndexResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFIndexByID
tags: [method]
```

```Go
func (r *Resolver) LSIFIndexByID(ctx context.Context, id graphql.ID) (gql.LSIFIndexResolver, error)
```

#### <a id="Resolver.LSIFIndexes" href="#Resolver.LSIFIndexes">func (r *Resolver) LSIFIndexes(ctx context.Context, args *gql.LSIFIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFIndexes
tags: [method]
```

```Go
func (r *Resolver) LSIFIndexes(ctx context.Context, args *gql.LSIFIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)
```

#### <a id="Resolver.LSIFIndexesByRepo" href="#Resolver.LSIFIndexesByRepo">func (r *Resolver) LSIFIndexesByRepo(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFIndexesByRepo
tags: [method]
```

```Go
func (r *Resolver) LSIFIndexesByRepo(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (gql.LSIFIndexConnectionResolver, error)
```

#### <a id="Resolver.LSIFUploadByID" href="#Resolver.LSIFUploadByID">func (r *Resolver) LSIFUploadByID(ctx context.Context, id graphql.ID) (gql.LSIFUploadResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFUploadByID
tags: [method]
```

```Go
func (r *Resolver) LSIFUploadByID(ctx context.Context, id graphql.ID) (gql.LSIFUploadResolver, error)
```

#### <a id="Resolver.LSIFUploads" href="#Resolver.LSIFUploads">func (r *Resolver) LSIFUploads(ctx context.Context, args *gql.LSIFUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFUploads
tags: [method]
```

```Go
func (r *Resolver) LSIFUploads(ctx context.Context, args *gql.LSIFUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)
```

#### <a id="Resolver.LSIFUploadsByRepo" href="#Resolver.LSIFUploadsByRepo">func (r *Resolver) LSIFUploadsByRepo(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)</a>

```
searchKey: graphql.Resolver.LSIFUploadsByRepo
tags: [method]
```

```Go
func (r *Resolver) LSIFUploadsByRepo(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (gql.LSIFUploadConnectionResolver, error)
```

#### <a id="Resolver.NodeResolvers" href="#Resolver.NodeResolvers">func (r *Resolver) NodeResolvers() map[string]gql.NodeByIDFunc</a>

```
searchKey: graphql.Resolver.NodeResolvers
tags: [method]
```

```Go
func (r *Resolver) NodeResolvers() map[string]gql.NodeByIDFunc
```

#### <a id="Resolver.QueueAutoIndexJobForRepo" href="#Resolver.QueueAutoIndexJobForRepo">func (r *Resolver) QueueAutoIndexJobForRepo(ctx context.Context, args *struct{ Repository graphql.ID }) (*gql.EmptyResponse, error)</a>

```
searchKey: graphql.Resolver.QueueAutoIndexJobForRepo
tags: [method]
```

```Go
func (r *Resolver) QueueAutoIndexJobForRepo(ctx context.Context, args *struct{ Repository graphql.ID }) (*gql.EmptyResponse, error)
```

#### <a id="Resolver.UpdateRepositoryIndexConfiguration" href="#Resolver.UpdateRepositoryIndexConfiguration">func (r *Resolver) UpdateRepositoryIndexConfiguration(ctx context.Context, args *gql.UpdateRepositoryIndexConfigurationArgs) (*gql.EmptyResponse, error)</a>

```
searchKey: graphql.Resolver.UpdateRepositoryIndexConfiguration
tags: [method]
```

```Go
func (r *Resolver) UpdateRepositoryIndexConfiguration(ctx context.Context, args *gql.UpdateRepositoryIndexConfigurationArgs) (*gql.EmptyResponse, error)
```

### <a id="UploadConnectionResolver" href="#UploadConnectionResolver">type UploadConnectionResolver struct</a>

```
searchKey: graphql.UploadConnectionResolver
tags: [struct]
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
tags: [method]
```

```Go
func (r *UploadConnectionResolver) Nodes(ctx context.Context) ([]gql.LSIFUploadResolver, error)
```

#### <a id="UploadConnectionResolver.PageInfo" href="#UploadConnectionResolver.PageInfo">func (r *UploadConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphql.UploadConnectionResolver.PageInfo
tags: [method]
```

```Go
func (r *UploadConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="UploadConnectionResolver.TotalCount" href="#UploadConnectionResolver.TotalCount">func (r *UploadConnectionResolver) TotalCount(ctx context.Context) (*int32, error)</a>

```
searchKey: graphql.UploadConnectionResolver.TotalCount
tags: [method]
```

```Go
func (r *UploadConnectionResolver) TotalCount(ctx context.Context) (*int32, error)
```

### <a id="UploadResolver" href="#UploadResolver">type UploadResolver struct</a>

```
searchKey: graphql.UploadResolver
tags: [struct]
```

```Go
type UploadResolver struct {
	upload           store.Upload
	prefetcher       *Prefetcher
	locationResolver *CachedLocationResolver
}
```

#### <a id="UploadResolver.AssociatedIndex" href="#UploadResolver.AssociatedIndex">func (r *UploadResolver) AssociatedIndex(ctx context.Context) (gql.LSIFIndexResolver, error)</a>

```
searchKey: graphql.UploadResolver.AssociatedIndex
tags: [method]
```

```Go
func (r *UploadResolver) AssociatedIndex(ctx context.Context) (gql.LSIFIndexResolver, error)
```

#### <a id="UploadResolver.Failure" href="#UploadResolver.Failure">func (r *UploadResolver) Failure() *string</a>

```
searchKey: graphql.UploadResolver.Failure
tags: [method]
```

```Go
func (r *UploadResolver) Failure() *string
```

#### <a id="UploadResolver.FinishedAt" href="#UploadResolver.FinishedAt">func (r *UploadResolver) FinishedAt() *gql.DateTime</a>

```
searchKey: graphql.UploadResolver.FinishedAt
tags: [method]
```

```Go
func (r *UploadResolver) FinishedAt() *gql.DateTime
```

#### <a id="UploadResolver.ID" href="#UploadResolver.ID">func (r *UploadResolver) ID() graphql.ID</a>

```
searchKey: graphql.UploadResolver.ID
tags: [method]
```

```Go
func (r *UploadResolver) ID() graphql.ID
```

#### <a id="UploadResolver.InputCommit" href="#UploadResolver.InputCommit">func (r *UploadResolver) InputCommit() string</a>

```
searchKey: graphql.UploadResolver.InputCommit
tags: [method]
```

```Go
func (r *UploadResolver) InputCommit() string
```

#### <a id="UploadResolver.InputIndexer" href="#UploadResolver.InputIndexer">func (r *UploadResolver) InputIndexer() string</a>

```
searchKey: graphql.UploadResolver.InputIndexer
tags: [method]
```

```Go
func (r *UploadResolver) InputIndexer() string
```

#### <a id="UploadResolver.InputRoot" href="#UploadResolver.InputRoot">func (r *UploadResolver) InputRoot() string</a>

```
searchKey: graphql.UploadResolver.InputRoot
tags: [method]
```

```Go
func (r *UploadResolver) InputRoot() string
```

#### <a id="UploadResolver.IsLatestForRepo" href="#UploadResolver.IsLatestForRepo">func (r *UploadResolver) IsLatestForRepo() bool</a>

```
searchKey: graphql.UploadResolver.IsLatestForRepo
tags: [method]
```

```Go
func (r *UploadResolver) IsLatestForRepo() bool
```

#### <a id="UploadResolver.PlaceInQueue" href="#UploadResolver.PlaceInQueue">func (r *UploadResolver) PlaceInQueue() *int32</a>

```
searchKey: graphql.UploadResolver.PlaceInQueue
tags: [method]
```

```Go
func (r *UploadResolver) PlaceInQueue() *int32
```

#### <a id="UploadResolver.ProjectRoot" href="#UploadResolver.ProjectRoot">func (r *UploadResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)</a>

```
searchKey: graphql.UploadResolver.ProjectRoot
tags: [method]
```

```Go
func (r *UploadResolver) ProjectRoot(ctx context.Context) (*gql.GitTreeEntryResolver, error)
```

#### <a id="UploadResolver.StartedAt" href="#UploadResolver.StartedAt">func (r *UploadResolver) StartedAt() *gql.DateTime</a>

```
searchKey: graphql.UploadResolver.StartedAt
tags: [method]
```

```Go
func (r *UploadResolver) StartedAt() *gql.DateTime
```

#### <a id="UploadResolver.State" href="#UploadResolver.State">func (r *UploadResolver) State() string</a>

```
searchKey: graphql.UploadResolver.State
tags: [method]
```

```Go
func (r *UploadResolver) State() string
```

#### <a id="UploadResolver.UploadedAt" href="#UploadResolver.UploadedAt">func (r *UploadResolver) UploadedAt() gql.DateTime</a>

```
searchKey: graphql.UploadResolver.UploadedAt
tags: [method]
```

```Go
func (r *UploadResolver) UploadedAt() gql.DateTime
```

### <a id="cachedCommitResolver" href="#cachedCommitResolver">type cachedCommitResolver struct</a>

```
searchKey: graphql.cachedCommitResolver
tags: [struct private]
```

```Go
type cachedCommitResolver struct {
	sync.RWMutex
	resolver *gql.GitCommitResolver
	children map[string]*gql.GitTreeEntryResolver
}
```

### <a id="cachedRepositoryResolver" href="#cachedRepositoryResolver">type cachedRepositoryResolver struct</a>

```
searchKey: graphql.cachedRepositoryResolver
tags: [struct private]
```

```Go
type cachedRepositoryResolver struct {
	sync.RWMutex
	resolver *gql.RepositoryResolver
	children map[string]*cachedCommitResolver
}
```

### <a id="executionLogEntryResolver" href="#executionLogEntryResolver">type executionLogEntryResolver struct</a>

```
searchKey: graphql.executionLogEntryResolver
tags: [struct private]
```

```Go
type executionLogEntryResolver struct {
	entry workerutil.ExecutionLogEntry
}
```

#### <a id="executionLogEntryResolver.Command" href="#executionLogEntryResolver.Command">func (r *executionLogEntryResolver) Command() []string</a>

```
searchKey: graphql.executionLogEntryResolver.Command
tags: [method private]
```

```Go
func (r *executionLogEntryResolver) Command() []string
```

#### <a id="executionLogEntryResolver.DurationMilliseconds" href="#executionLogEntryResolver.DurationMilliseconds">func (r *executionLogEntryResolver) DurationMilliseconds() int32</a>

```
searchKey: graphql.executionLogEntryResolver.DurationMilliseconds
tags: [method private]
```

```Go
func (r *executionLogEntryResolver) DurationMilliseconds() int32
```

#### <a id="executionLogEntryResolver.ExitCode" href="#executionLogEntryResolver.ExitCode">func (r *executionLogEntryResolver) ExitCode() int32</a>

```
searchKey: graphql.executionLogEntryResolver.ExitCode
tags: [method private]
```

```Go
func (r *executionLogEntryResolver) ExitCode() int32
```

#### <a id="executionLogEntryResolver.Key" href="#executionLogEntryResolver.Key">func (r *executionLogEntryResolver) Key() string</a>

```
searchKey: graphql.executionLogEntryResolver.Key
tags: [method private]
```

```Go
func (r *executionLogEntryResolver) Key() string
```

#### <a id="executionLogEntryResolver.Out" href="#executionLogEntryResolver.Out">func (r *executionLogEntryResolver) Out(ctx context.Context) (string, error)</a>

```
searchKey: graphql.executionLogEntryResolver.Out
tags: [method private]
```

```Go
func (r *executionLogEntryResolver) Out(ctx context.Context) (string, error)
```

#### <a id="executionLogEntryResolver.StartTime" href="#executionLogEntryResolver.StartTime">func (r *executionLogEntryResolver) StartTime() gql.DateTime</a>

```
searchKey: graphql.executionLogEntryResolver.StartTime
tags: [method private]
```

```Go
func (r *executionLogEntryResolver) StartTime() gql.DateTime
```

### <a id="indexStepResolver" href="#indexStepResolver">type indexStepResolver struct</a>

```
searchKey: graphql.indexStepResolver
tags: [struct private]
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
tags: [method private]
```

```Go
func (r *indexStepResolver) IndexerArgs() []string
```

#### <a id="indexStepResolver.LogEntry" href="#indexStepResolver.LogEntry">func (r *indexStepResolver) LogEntry() gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepResolver.LogEntry
tags: [method private]
```

```Go
func (r *indexStepResolver) LogEntry() gql.ExecutionLogEntryResolver
```

#### <a id="indexStepResolver.Outfile" href="#indexStepResolver.Outfile">func (r *indexStepResolver) Outfile() *string</a>

```
searchKey: graphql.indexStepResolver.Outfile
tags: [method private]
```

```Go
func (r *indexStepResolver) Outfile() *string
```

### <a id="indexStepsResolver" href="#indexStepsResolver">type indexStepsResolver struct</a>

```
searchKey: graphql.indexStepsResolver
tags: [struct private]
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

#### <a id="indexStepsResolver.Index" href="#indexStepsResolver.Index">func (r *indexStepsResolver) Index() gql.IndexStepResolver</a>

```
searchKey: graphql.indexStepsResolver.Index
tags: [method private]
```

```Go
func (r *indexStepsResolver) Index() gql.IndexStepResolver
```

#### <a id="indexStepsResolver.PreIndex" href="#indexStepsResolver.PreIndex">func (r *indexStepsResolver) PreIndex() []gql.PreIndexStepResolver</a>

```
searchKey: graphql.indexStepsResolver.PreIndex
tags: [method private]
```

```Go
func (r *indexStepsResolver) PreIndex() []gql.PreIndexStepResolver
```

#### <a id="indexStepsResolver.Setup" href="#indexStepsResolver.Setup">func (r *indexStepsResolver) Setup() []gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepsResolver.Setup
tags: [method private]
```

```Go
func (r *indexStepsResolver) Setup() []gql.ExecutionLogEntryResolver
```

#### <a id="indexStepsResolver.Teardown" href="#indexStepsResolver.Teardown">func (r *indexStepsResolver) Teardown() []gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepsResolver.Teardown
tags: [method private]
```

```Go
func (r *indexStepsResolver) Teardown() []gql.ExecutionLogEntryResolver
```

#### <a id="indexStepsResolver.Upload" href="#indexStepsResolver.Upload">func (r *indexStepsResolver) Upload() gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepsResolver.Upload
tags: [method private]
```

```Go
func (r *indexStepsResolver) Upload() gql.ExecutionLogEntryResolver
```

#### <a id="indexStepsResolver.executionLogEntryResolversWithPrefix" href="#indexStepsResolver.executionLogEntryResolversWithPrefix">func (r *indexStepsResolver) executionLogEntryResolversWithPrefix(prefix string) []gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.indexStepsResolver.executionLogEntryResolversWithPrefix
tags: [method private]
```

```Go
func (r *indexStepsResolver) executionLogEntryResolversWithPrefix(prefix string) []gql.ExecutionLogEntryResolver
```

#### <a id="indexStepsResolver.findExecutionLogEntry" href="#indexStepsResolver.findExecutionLogEntry">func (r *indexStepsResolver) findExecutionLogEntry(key string) (workerutil.ExecutionLogEntry, bool)</a>

```
searchKey: graphql.indexStepsResolver.findExecutionLogEntry
tags: [method private]
```

```Go
func (r *indexStepsResolver) findExecutionLogEntry(key string) (workerutil.ExecutionLogEntry, bool)
```

### <a id="preIndexStepResolver" href="#preIndexStepResolver">type preIndexStepResolver struct</a>

```
searchKey: graphql.preIndexStepResolver
tags: [struct private]
```

```Go
type preIndexStepResolver struct {
	step  store.DockerStep
	entry *workerutil.ExecutionLogEntry
}
```

#### <a id="preIndexStepResolver.Commands" href="#preIndexStepResolver.Commands">func (r *preIndexStepResolver) Commands() []string</a>

```
searchKey: graphql.preIndexStepResolver.Commands
tags: [method private]
```

```Go
func (r *preIndexStepResolver) Commands() []string
```

#### <a id="preIndexStepResolver.Image" href="#preIndexStepResolver.Image">func (r *preIndexStepResolver) Image() string</a>

```
searchKey: graphql.preIndexStepResolver.Image
tags: [method private]
```

```Go
func (r *preIndexStepResolver) Image() string
```

#### <a id="preIndexStepResolver.LogEntry" href="#preIndexStepResolver.LogEntry">func (r *preIndexStepResolver) LogEntry() gql.ExecutionLogEntryResolver</a>

```
searchKey: graphql.preIndexStepResolver.LogEntry
tags: [method private]
```

```Go
func (r *preIndexStepResolver) LogEntry() gql.ExecutionLogEntryResolver
```

#### <a id="preIndexStepResolver.Root" href="#preIndexStepResolver.Root">func (r *preIndexStepResolver) Root() string</a>

```
searchKey: graphql.preIndexStepResolver.Root
tags: [method private]
```

```Go
func (r *preIndexStepResolver) Root() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewDiagnosticConnectionResolver" href="#NewDiagnosticConnectionResolver">func NewDiagnosticConnectionResolver(diagnostics []resolvers.AdjustedDiagnostic, totalCount int, locationResolver *CachedLocationResolver) gql.DiagnosticConnectionResolver</a>

```
searchKey: graphql.NewDiagnosticConnectionResolver
tags: [function]
```

```Go
func NewDiagnosticConnectionResolver(diagnostics []resolvers.AdjustedDiagnostic, totalCount int, locationResolver *CachedLocationResolver) gql.DiagnosticConnectionResolver
```

### <a id="NewDiagnosticResolver" href="#NewDiagnosticResolver">func NewDiagnosticResolver(diagnostic resolvers.AdjustedDiagnostic, locationResolver *CachedLocationResolver) gql.DiagnosticResolver</a>

```
searchKey: graphql.NewDiagnosticResolver
tags: [function]
```

```Go
func NewDiagnosticResolver(diagnostic resolvers.AdjustedDiagnostic, locationResolver *CachedLocationResolver) gql.DiagnosticResolver
```

### <a id="NewHoverResolver" href="#NewHoverResolver">func NewHoverResolver(text string, lspRange lsp.Range) gql.HoverResolver</a>

```
searchKey: graphql.NewHoverResolver
tags: [function]
```

```Go
func NewHoverResolver(text string, lspRange lsp.Range) gql.HoverResolver
```

### <a id="NewIndexConfigurationResolver" href="#NewIndexConfigurationResolver">func NewIndexConfigurationResolver(configuration []byte) gql.IndexConfigurationResolver</a>

```
searchKey: graphql.NewIndexConfigurationResolver
tags: [function]
```

```Go
func NewIndexConfigurationResolver(configuration []byte) gql.IndexConfigurationResolver
```

### <a id="NewIndexConnectionResolver" href="#NewIndexConnectionResolver">func NewIndexConnectionResolver(resolver *resolvers.IndexesResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexConnectionResolver</a>

```
searchKey: graphql.NewIndexConnectionResolver
tags: [function]
```

```Go
func NewIndexConnectionResolver(resolver *resolvers.IndexesResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexConnectionResolver
```

### <a id="NewIndexResolver" href="#NewIndexResolver">func NewIndexResolver(index store.Index, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexResolver</a>

```
searchKey: graphql.NewIndexResolver
tags: [function]
```

```Go
func NewIndexResolver(index store.Index, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFIndexResolver
```

### <a id="NewLocationConnectionResolver" href="#NewLocationConnectionResolver">func NewLocationConnectionResolver(locations []resolvers.AdjustedLocation, cursor *string, locationResolver *CachedLocationResolver) gql.LocationConnectionResolver</a>

```
searchKey: graphql.NewLocationConnectionResolver
tags: [function]
```

```Go
func NewLocationConnectionResolver(locations []resolvers.AdjustedLocation, cursor *string, locationResolver *CachedLocationResolver) gql.LocationConnectionResolver
```

### <a id="NewQueryResolver" href="#NewQueryResolver">func NewQueryResolver(resolver resolvers.QueryResolver, locationResolver *CachedLocationResolver) gql.GitBlobLSIFDataResolver</a>

```
searchKey: graphql.NewQueryResolver
tags: [function]
```

```Go
func NewQueryResolver(resolver resolvers.QueryResolver, locationResolver *CachedLocationResolver) gql.GitBlobLSIFDataResolver
```

NewQueryResolver creates a new QueryResolver with the given resolver that defines all code intel-specific behavior. A cached location resolver instance is also given to the query resolver, which should be used to resolve all location-related values. 

### <a id="NewResolver" href="#NewResolver">func NewResolver(db dbutil.DB, resolver resolvers.Resolver) gql.CodeIntelResolver</a>

```
searchKey: graphql.NewResolver
tags: [function]
```

```Go
func NewResolver(db dbutil.DB, resolver resolvers.Resolver) gql.CodeIntelResolver
```

NewResolver creates a new Resolver with the given resolver that defines all code intel-specific behavior. 

### <a id="NewUploadConnectionResolver" href="#NewUploadConnectionResolver">func NewUploadConnectionResolver(resolver *resolvers.UploadsResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadConnectionResolver</a>

```
searchKey: graphql.NewUploadConnectionResolver
tags: [function]
```

```Go
func NewUploadConnectionResolver(resolver *resolvers.UploadsResolver, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadConnectionResolver
```

### <a id="NewUploadResolver" href="#NewUploadResolver">func NewUploadResolver(upload store.Upload, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadResolver</a>

```
searchKey: graphql.NewUploadResolver
tags: [function]
```

```Go
func NewUploadResolver(upload store.Upload, prefetcher *Prefetcher, locationResolver *CachedLocationResolver) gql.LSIFUploadResolver
```

### <a id="TestCachedLocationResolver" href="#TestCachedLocationResolver">func TestCachedLocationResolver(t *testing.T)</a>

```
searchKey: graphql.TestCachedLocationResolver
tags: [function private test]
```

```Go
func TestCachedLocationResolver(t *testing.T)
```

### <a id="TestCachedLocationResolverUnknownCommit" href="#TestCachedLocationResolverUnknownCommit">func TestCachedLocationResolverUnknownCommit(t *testing.T)</a>

```
searchKey: graphql.TestCachedLocationResolverUnknownCommit
tags: [function private test]
```

```Go
func TestCachedLocationResolverUnknownCommit(t *testing.T)
```

### <a id="TestCachedLocationResolverUnknownRepository" href="#TestCachedLocationResolverUnknownRepository">func TestCachedLocationResolverUnknownRepository(t *testing.T)</a>

```
searchKey: graphql.TestCachedLocationResolverUnknownRepository
tags: [function private test]
```

```Go
func TestCachedLocationResolverUnknownRepository(t *testing.T)
```

### <a id="TestCursor" href="#TestCursor">func TestCursor(t *testing.T)</a>

```
searchKey: graphql.TestCursor
tags: [function private test]
```

```Go
func TestCursor(t *testing.T)
```

### <a id="TestCursorEmpty" href="#TestCursorEmpty">func TestCursorEmpty(t *testing.T)</a>

```
searchKey: graphql.TestCursorEmpty
tags: [function private test]
```

```Go
func TestCursorEmpty(t *testing.T)
```

### <a id="TestDefinitions" href="#TestDefinitions">func TestDefinitions(t *testing.T)</a>

```
searchKey: graphql.TestDefinitions
tags: [function private test]
```

```Go
func TestDefinitions(t *testing.T)
```

### <a id="TestDeleteLSIFIndex" href="#TestDeleteLSIFIndex">func TestDeleteLSIFIndex(t *testing.T)</a>

```
searchKey: graphql.TestDeleteLSIFIndex
tags: [function private test]
```

```Go
func TestDeleteLSIFIndex(t *testing.T)
```

### <a id="TestDeleteLSIFIndexUnauthenticated" href="#TestDeleteLSIFIndexUnauthenticated">func TestDeleteLSIFIndexUnauthenticated(t *testing.T)</a>

```
searchKey: graphql.TestDeleteLSIFIndexUnauthenticated
tags: [function private test]
```

```Go
func TestDeleteLSIFIndexUnauthenticated(t *testing.T)
```

### <a id="TestDeleteLSIFUpload" href="#TestDeleteLSIFUpload">func TestDeleteLSIFUpload(t *testing.T)</a>

```
searchKey: graphql.TestDeleteLSIFUpload
tags: [function private test]
```

```Go
func TestDeleteLSIFUpload(t *testing.T)
```

### <a id="TestDeleteLSIFUploadUnauthenticated" href="#TestDeleteLSIFUploadUnauthenticated">func TestDeleteLSIFUploadUnauthenticated(t *testing.T)</a>

```
searchKey: graphql.TestDeleteLSIFUploadUnauthenticated
tags: [function private test]
```

```Go
func TestDeleteLSIFUploadUnauthenticated(t *testing.T)
```

### <a id="TestDerefBool" href="#TestDerefBool">func TestDerefBool(t *testing.T)</a>

```
searchKey: graphql.TestDerefBool
tags: [function private test]
```

```Go
func TestDerefBool(t *testing.T)
```

### <a id="TestDerefInt32" href="#TestDerefInt32">func TestDerefInt32(t *testing.T)</a>

```
searchKey: graphql.TestDerefInt32
tags: [function private test]
```

```Go
func TestDerefInt32(t *testing.T)
```

### <a id="TestDerefString" href="#TestDerefString">func TestDerefString(t *testing.T)</a>

```
searchKey: graphql.TestDerefString
tags: [function private test]
```

```Go
func TestDerefString(t *testing.T)
```

### <a id="TestDiagnostics" href="#TestDiagnostics">func TestDiagnostics(t *testing.T)</a>

```
searchKey: graphql.TestDiagnostics
tags: [function private test]
```

```Go
func TestDiagnostics(t *testing.T)
```

### <a id="TestDiagnosticsDefaultIllegalLimit" href="#TestDiagnosticsDefaultIllegalLimit">func TestDiagnosticsDefaultIllegalLimit(t *testing.T)</a>

```
searchKey: graphql.TestDiagnosticsDefaultIllegalLimit
tags: [function private test]
```

```Go
func TestDiagnosticsDefaultIllegalLimit(t *testing.T)
```

### <a id="TestDiagnosticsDefaultLimit" href="#TestDiagnosticsDefaultLimit">func TestDiagnosticsDefaultLimit(t *testing.T)</a>

```
searchKey: graphql.TestDiagnosticsDefaultLimit
tags: [function private test]
```

```Go
func TestDiagnosticsDefaultLimit(t *testing.T)
```

### <a id="TestHover" href="#TestHover">func TestHover(t *testing.T)</a>

```
searchKey: graphql.TestHover
tags: [function private test]
```

```Go
func TestHover(t *testing.T)
```

### <a id="TestIndexID" href="#TestIndexID">func TestIndexID(t *testing.T)</a>

```
searchKey: graphql.TestIndexID
tags: [function private test]
```

```Go
func TestIndexID(t *testing.T)
```

### <a id="TestIntCursor" href="#TestIntCursor">func TestIntCursor(t *testing.T)</a>

```
searchKey: graphql.TestIntCursor
tags: [function private test]
```

```Go
func TestIntCursor(t *testing.T)
```

### <a id="TestIntCursorEmpty" href="#TestIntCursorEmpty">func TestIntCursorEmpty(t *testing.T)</a>

```
searchKey: graphql.TestIntCursorEmpty
tags: [function private test]
```

```Go
func TestIntCursorEmpty(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: graphql.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestMakeGetIndexesOptions" href="#TestMakeGetIndexesOptions">func TestMakeGetIndexesOptions(t *testing.T)</a>

```
searchKey: graphql.TestMakeGetIndexesOptions
tags: [function private test]
```

```Go
func TestMakeGetIndexesOptions(t *testing.T)
```

### <a id="TestMakeGetIndexesOptionsDefaults" href="#TestMakeGetIndexesOptionsDefaults">func TestMakeGetIndexesOptionsDefaults(t *testing.T)</a>

```
searchKey: graphql.TestMakeGetIndexesOptionsDefaults
tags: [function private test]
```

```Go
func TestMakeGetIndexesOptionsDefaults(t *testing.T)
```

### <a id="TestMakeGetUploadsOptions" href="#TestMakeGetUploadsOptions">func TestMakeGetUploadsOptions(t *testing.T)</a>

```
searchKey: graphql.TestMakeGetUploadsOptions
tags: [function private test]
```

```Go
func TestMakeGetUploadsOptions(t *testing.T)
```

### <a id="TestMakeGetUploadsOptionsDefaults" href="#TestMakeGetUploadsOptionsDefaults">func TestMakeGetUploadsOptionsDefaults(t *testing.T)</a>

```
searchKey: graphql.TestMakeGetUploadsOptionsDefaults
tags: [function private test]
```

```Go
func TestMakeGetUploadsOptionsDefaults(t *testing.T)
```

### <a id="TestPrefetcherIndexes" href="#TestPrefetcherIndexes">func TestPrefetcherIndexes(t *testing.T)</a>

```
searchKey: graphql.TestPrefetcherIndexes
tags: [function private test]
```

```Go
func TestPrefetcherIndexes(t *testing.T)
```

### <a id="TestPrefetcherUploads" href="#TestPrefetcherUploads">func TestPrefetcherUploads(t *testing.T)</a>

```
searchKey: graphql.TestPrefetcherUploads
tags: [function private test]
```

```Go
func TestPrefetcherUploads(t *testing.T)
```

### <a id="TestRanges" href="#TestRanges">func TestRanges(t *testing.T)</a>

```
searchKey: graphql.TestRanges
tags: [function private test]
```

```Go
func TestRanges(t *testing.T)
```

### <a id="TestReferences" href="#TestReferences">func TestReferences(t *testing.T)</a>

```
searchKey: graphql.TestReferences
tags: [function private test]
```

```Go
func TestReferences(t *testing.T)
```

### <a id="TestReferencesDefaultIllegalLimit" href="#TestReferencesDefaultIllegalLimit">func TestReferencesDefaultIllegalLimit(t *testing.T)</a>

```
searchKey: graphql.TestReferencesDefaultIllegalLimit
tags: [function private test]
```

```Go
func TestReferencesDefaultIllegalLimit(t *testing.T)
```

### <a id="TestReferencesDefaultLimit" href="#TestReferencesDefaultLimit">func TestReferencesDefaultLimit(t *testing.T)</a>

```
searchKey: graphql.TestReferencesDefaultLimit
tags: [function private test]
```

```Go
func TestReferencesDefaultLimit(t *testing.T)
```

### <a id="TestResolveLocations" href="#TestResolveLocations">func TestResolveLocations(t *testing.T)</a>

```
searchKey: graphql.TestResolveLocations
tags: [function private test]
```

```Go
func TestResolveLocations(t *testing.T)
```

### <a id="TestUnmarshalUploadIDString" href="#TestUnmarshalUploadIDString">func TestUnmarshalUploadIDString(t *testing.T)</a>

```
searchKey: graphql.TestUnmarshalUploadIDString
tags: [function private test]
```

```Go
func TestUnmarshalUploadIDString(t *testing.T)
```

### <a id="TestUploadID" href="#TestUploadID">func TestUploadID(t *testing.T)</a>

```
searchKey: graphql.TestUploadID
tags: [function private test]
```

```Go
func TestUploadID(t *testing.T)
```

### <a id="boolPtr" href="#boolPtr">func boolPtr(val bool) *bool</a>

```
searchKey: graphql.boolPtr
tags: [function private]
```

```Go
func boolPtr(val bool) *bool
```

intPtr creates a pointer to the given value. 

### <a id="convertPosition" href="#convertPosition">func convertPosition(line, character int) lsp.Position</a>

```
searchKey: graphql.convertPosition
tags: [function private]
```

```Go
func convertPosition(line, character int) lsp.Position
```

convertPosition creates an LSP position from a line and character pair. 

### <a id="convertRange" href="#convertRange">func convertRange(r lsifstore.Range) lsp.Range</a>

```
searchKey: graphql.convertRange
tags: [function private]
```

```Go
func convertRange(r lsifstore.Range) lsp.Range
```

convertRange creates an LSP range from a bundle range. 

### <a id="decodeCursor" href="#decodeCursor">func decodeCursor(val *string) (string, error)</a>

```
searchKey: graphql.decodeCursor
tags: [function private]
```

```Go
func decodeCursor(val *string) (string, error)
```

decodeCursor decodes the given cursor value. It is assumed to be a value previously returned from the function encodeCursor. An empty string is returned if no cursor is supplied. Invalid cursors return errors. 

### <a id="decodeIntCursor" href="#decodeIntCursor">func decodeIntCursor(val *string) (int, error)</a>

```
searchKey: graphql.decodeIntCursor
tags: [function private]
```

```Go
func decodeIntCursor(val *string) (int, error)
```

decodeIntCursor decodes the given integer cursor value. It is assumed to be a value previously returned from the function encodeIntCursor. The zero value is returned if no cursor is supplied. Invalid cursors return errors. 

### <a id="derefBool" href="#derefBool">func derefBool(val *bool, defaultValue bool) bool</a>

```
searchKey: graphql.derefBool
tags: [function private]
```

```Go
func derefBool(val *bool, defaultValue bool) bool
```

derefBool returns the underlying value in the given pointer. If the pointer is nil, the default value is returned. 

### <a id="derefInt32" href="#derefInt32">func derefInt32(val *int32, defaultValue int) int</a>

```
searchKey: graphql.derefInt32
tags: [function private]
```

```Go
func derefInt32(val *int32, defaultValue int) int
```

derefInt32 returns the underlying value in the given pointer. If the pointer is nil, the default value is returned. 

### <a id="derefString" href="#derefString">func derefString(val *string, defaultValue string) string</a>

```
searchKey: graphql.derefString
tags: [function private]
```

```Go
func derefString(val *string, defaultValue string) string
```

derefString returns the underlying value in the given pointer. If the pointer is nil, the default value is returned. 

### <a id="encodeCursor" href="#encodeCursor">func encodeCursor(val *string) *graphqlutil.PageInfo</a>

```
searchKey: graphql.encodeCursor
tags: [function private]
```

```Go
func encodeCursor(val *string) *graphqlutil.PageInfo
```

encodeCursor creates a PageInfo object from the given cursor. If the cursor is not defined, then an object indicating the end of the result set is returned. The cursor is base64 encoded for transfer, and should be decoded using the function decodeCursor. 

### <a id="encodeIntCursor" href="#encodeIntCursor">func encodeIntCursor(val *int32) *graphqlutil.PageInfo</a>

```
searchKey: graphql.encodeIntCursor
tags: [function private]
```

```Go
func encodeIntCursor(val *int32) *graphqlutil.PageInfo
```

encodeIntCursor creates a PageInfo object from the given new offset value. If the new offset value, then an object indicating the end of the result set is returned. The cursor is base64 encoded for transfer, and should be decoded using the function decodeIntCursor. 

### <a id="init.resolver_test.go" href="#init.resolver_test.go">func init()</a>

```
searchKey: graphql.init
tags: [function private]
```

```Go
func init()
```

### <a id="intPtr" href="#intPtr">func intPtr(val int32) *int32</a>

```
searchKey: graphql.intPtr
tags: [function private]
```

```Go
func intPtr(val int32) *int32
```

intPtr creates a pointer to the given value. 

### <a id="makeGetIndexesOptions" href="#makeGetIndexesOptions">func makeGetIndexesOptions(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (store.GetIndexesOptions, error)</a>

```
searchKey: graphql.makeGetIndexesOptions
tags: [function private]
```

```Go
func makeGetIndexesOptions(ctx context.Context, args *gql.LSIFRepositoryIndexesQueryArgs) (store.GetIndexesOptions, error)
```

makeGetIndexesOptions translates the given GraphQL arguments into options defined by the store.GetIndexes operations. 

### <a id="makeGetUploadsOptions" href="#makeGetUploadsOptions">func makeGetUploadsOptions(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (store.GetUploadsOptions, error)</a>

```
searchKey: graphql.makeGetUploadsOptions
tags: [function private]
```

```Go
func makeGetUploadsOptions(ctx context.Context, args *gql.LSIFRepositoryUploadsQueryArgs) (store.GetUploadsOptions, error)
```

makeGetUploadsOptions translates the given GraphQL arguments into options defined by the store.GetUploads operations. 

### <a id="marshalLSIFIndexGQLID" href="#marshalLSIFIndexGQLID">func marshalLSIFIndexGQLID(indexID int64) graphql.ID</a>

```
searchKey: graphql.marshalLSIFIndexGQLID
tags: [function private]
```

```Go
func marshalLSIFIndexGQLID(indexID int64) graphql.ID
```

### <a id="marshalLSIFUploadGQLID" href="#marshalLSIFUploadGQLID">func marshalLSIFUploadGQLID(uploadID int64) graphql.ID</a>

```
searchKey: graphql.marshalLSIFUploadGQLID
tags: [function private]
```

```Go
func marshalLSIFUploadGQLID(uploadID int64) graphql.ID
```

### <a id="resolveLocation" href="#resolveLocation">func resolveLocation(ctx context.Context, locationResolver *CachedLocationResolver, location resolvers.AdjustedLocation) (gql.LocationResolver, error)</a>

```
searchKey: graphql.resolveLocation
tags: [function private]
```

```Go
func resolveLocation(ctx context.Context, locationResolver *CachedLocationResolver, location resolvers.AdjustedLocation) (gql.LocationResolver, error)
```

resolveLocation creates a LocationResolver for the given adjusted location. This function may return a nil resolver if the location's commit is not known by gitserver. 

### <a id="resolveLocations" href="#resolveLocations">func resolveLocations(ctx context.Context, locationResolver *CachedLocationResolver, locations []resolvers.AdjustedLocation) ([]gql.LocationResolver, error)</a>

```
searchKey: graphql.resolveLocations
tags: [function private]
```

```Go
func resolveLocations(ctx context.Context, locationResolver *CachedLocationResolver, locations []resolvers.AdjustedLocation) ([]gql.LocationResolver, error)
```

resolveLocations creates a slide of LocationResolvers for the given list of adjusted locations. The resulting list may be smaller than the the input list as any locations with a commit not known by gitserver will be skipped. 

### <a id="resolveRepositoryID" href="#resolveRepositoryID">func resolveRepositoryID(ctx context.Context, id graphql.ID) (int, error)</a>

```
searchKey: graphql.resolveRepositoryID
tags: [function private]
```

```Go
func resolveRepositoryID(ctx context.Context, id graphql.ID) (int, error)
```

resolveRepositoryByID gets a repository's internal identifier from a GraphQL identifier. 

### <a id="strPtr" href="#strPtr">func strPtr(val string) *string</a>

```
searchKey: graphql.strPtr
tags: [function private]
```

```Go
func strPtr(val string) *string
```

strPtr creates a pointer to the given value. If the value is an empty string, a nil pointer is returned. 

### <a id="toInt32" href="#toInt32">func toInt32(val *int) *int32</a>

```
searchKey: graphql.toInt32
tags: [function private]
```

```Go
func toInt32(val *int) *int32
```

toInt32 translates the given int pointer into an int32 pointer. 

### <a id="toSeverity" href="#toSeverity">func toSeverity(val int) (*string, error)</a>

```
searchKey: graphql.toSeverity
tags: [function private]
```

```Go
func toSeverity(val int) (*string, error)
```

### <a id="unmarshalLSIFIndexGQLID" href="#unmarshalLSIFIndexGQLID">func unmarshalLSIFIndexGQLID(id graphql.ID) (indexID int64, err error)</a>

```
searchKey: graphql.unmarshalLSIFIndexGQLID
tags: [function private]
```

```Go
func unmarshalLSIFIndexGQLID(id graphql.ID) (indexID int64, err error)
```

### <a id="unmarshalLSIFUploadGQLID" href="#unmarshalLSIFUploadGQLID">func unmarshalLSIFUploadGQLID(id graphql.ID) (uploadID int64, err error)</a>

```
searchKey: graphql.unmarshalLSIFUploadGQLID
tags: [function private]
```

```Go
func unmarshalLSIFUploadGQLID(id graphql.ID) (uploadID int64, err error)
```

