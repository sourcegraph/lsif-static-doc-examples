# Package resolvers

## Index

* Subpages
  * [enterprise/cmd/frontend/internal/codeintel/resolvers/graphql](resolvers/graphql.md)
  * [enterprise/cmd/frontend/internal/codeintel/resolvers/mocks](resolvers/mocks.md)
* [Constants](#const)
    * [const DefinitionsLimit](#DefinitionsLimit)
    * [const expectedFallbackIndexConfiguration](#expectedFallbackIndexConfiguration)
    * [const hugoDiff](#hugoDiff)
    * [const maximumIndexesPerMonikerSearch](#maximumIndexesPerMonikerSearch)
    * [const monikerLimit](#monikerLimit)
    * [const numAncestors](#numAncestors)
    * [const prometheusDiff](#prometheusDiff)
    * [const slowDefinitionsRequestThreshold](#slowDefinitionsRequestThreshold)
    * [const slowDiagnosticsRequestThreshold](#slowDiagnosticsRequestThreshold)
    * [const slowDocumentationPageRequestThreshold](#slowDocumentationPageRequestThreshold)
    * [const slowHoverRequestThreshold](#slowHoverRequestThreshold)
    * [const slowQueryResolverRequestThreshold](#slowQueryResolverRequestThreshold)
    * [const slowRangesRequestThreshold](#slowRangesRequestThreshold)
    * [const slowReferencesRequestThreshold](#slowReferencesRequestThreshold)
* [Variables](#var)
    * [var ErrConcurrentModification](#ErrConcurrentModification)
    * [var hugoTestCases](#hugoTestCases)
    * [var prometheusTestCases](#prometheusTestCases)
    * [var testRange1](#testRange1)
    * [var testRange2](#testRange2)
    * [var testRange3](#testRange3)
    * [var testRange4](#testRange4)
    * [var testRange5](#testRange5)
* [Types](#type)
    * [type AdjustedCodeIntelligenceRange struct](#AdjustedCodeIntelligenceRange)
    * [type AdjustedDiagnostic struct](#AdjustedDiagnostic)
    * [type AdjustedLocation struct](#AdjustedLocation)
    * [type CommitGraphResolver struct](#CommitGraphResolver)
        * [func NewCommitGraphResolver(stale bool, updatedAt *time.Time) *CommitGraphResolver](#NewCommitGraphResolver)
        * [func (r *CommitGraphResolver) Stale(ctx context.Context) (bool, error)](#CommitGraphResolver.Stale)
        * [func (r *CommitGraphResolver) UpdatedAt(ctx context.Context) (*graphqlbackend.DateTime, error)](#CommitGraphResolver.UpdatedAt)
    * [type DBStore interface](#DBStore)
    * [type DBStoreCommitGraphMetadataFunc struct](#DBStoreCommitGraphMetadataFunc)
        * [func (f *DBStoreCommitGraphMetadataFunc) History() []DBStoreCommitGraphMetadataFuncCall](#DBStoreCommitGraphMetadataFunc.History)
        * [func (f *DBStoreCommitGraphMetadataFunc) PushHook(hook func(context.Context, int) (bool, *time.Time, error))](#DBStoreCommitGraphMetadataFunc.PushHook)
        * [func (f *DBStoreCommitGraphMetadataFunc) PushReturn(r0 bool, r1 *time.Time, r2 error)](#DBStoreCommitGraphMetadataFunc.PushReturn)
        * [func (f *DBStoreCommitGraphMetadataFunc) SetDefaultHook(hook func(context.Context, int) (bool, *time.Time, error))](#DBStoreCommitGraphMetadataFunc.SetDefaultHook)
        * [func (f *DBStoreCommitGraphMetadataFunc) SetDefaultReturn(r0 bool, r1 *time.Time, r2 error)](#DBStoreCommitGraphMetadataFunc.SetDefaultReturn)
        * [func (f *DBStoreCommitGraphMetadataFunc) appendCall(r0 DBStoreCommitGraphMetadataFuncCall)](#DBStoreCommitGraphMetadataFunc.appendCall)
        * [func (f *DBStoreCommitGraphMetadataFunc) nextHook() func(context.Context, int) (bool, *time.Time, error)](#DBStoreCommitGraphMetadataFunc.nextHook)
    * [type DBStoreCommitGraphMetadataFuncCall struct](#DBStoreCommitGraphMetadataFuncCall)
        * [func (c DBStoreCommitGraphMetadataFuncCall) Args() []interface{}](#DBStoreCommitGraphMetadataFuncCall.Args)
        * [func (c DBStoreCommitGraphMetadataFuncCall) Results() []interface{}](#DBStoreCommitGraphMetadataFuncCall.Results)
    * [type DBStoreDefinitionDumpsFunc struct](#DBStoreDefinitionDumpsFunc)
        * [func (f *DBStoreDefinitionDumpsFunc) History() []DBStoreDefinitionDumpsFuncCall](#DBStoreDefinitionDumpsFunc.History)
        * [func (f *DBStoreDefinitionDumpsFunc) PushHook(hook func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error))](#DBStoreDefinitionDumpsFunc.PushHook)
        * [func (f *DBStoreDefinitionDumpsFunc) PushReturn(r0 []dbstore.Dump, r1 error)](#DBStoreDefinitionDumpsFunc.PushReturn)
        * [func (f *DBStoreDefinitionDumpsFunc) SetDefaultHook(hook func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error))](#DBStoreDefinitionDumpsFunc.SetDefaultHook)
        * [func (f *DBStoreDefinitionDumpsFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)](#DBStoreDefinitionDumpsFunc.SetDefaultReturn)
        * [func (f *DBStoreDefinitionDumpsFunc) appendCall(r0 DBStoreDefinitionDumpsFuncCall)](#DBStoreDefinitionDumpsFunc.appendCall)
        * [func (f *DBStoreDefinitionDumpsFunc) nextHook() func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error)](#DBStoreDefinitionDumpsFunc.nextHook)
    * [type DBStoreDefinitionDumpsFuncCall struct](#DBStoreDefinitionDumpsFuncCall)
        * [func (c DBStoreDefinitionDumpsFuncCall) Args() []interface{}](#DBStoreDefinitionDumpsFuncCall.Args)
        * [func (c DBStoreDefinitionDumpsFuncCall) Results() []interface{}](#DBStoreDefinitionDumpsFuncCall.Results)
    * [type DBStoreDeleteIndexByIDFunc struct](#DBStoreDeleteIndexByIDFunc)
        * [func (f *DBStoreDeleteIndexByIDFunc) History() []DBStoreDeleteIndexByIDFuncCall](#DBStoreDeleteIndexByIDFunc.History)
        * [func (f *DBStoreDeleteIndexByIDFunc) PushHook(hook func(context.Context, int) (bool, error))](#DBStoreDeleteIndexByIDFunc.PushHook)
        * [func (f *DBStoreDeleteIndexByIDFunc) PushReturn(r0 bool, r1 error)](#DBStoreDeleteIndexByIDFunc.PushReturn)
        * [func (f *DBStoreDeleteIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))](#DBStoreDeleteIndexByIDFunc.SetDefaultHook)
        * [func (f *DBStoreDeleteIndexByIDFunc) SetDefaultReturn(r0 bool, r1 error)](#DBStoreDeleteIndexByIDFunc.SetDefaultReturn)
        * [func (f *DBStoreDeleteIndexByIDFunc) appendCall(r0 DBStoreDeleteIndexByIDFuncCall)](#DBStoreDeleteIndexByIDFunc.appendCall)
        * [func (f *DBStoreDeleteIndexByIDFunc) nextHook() func(context.Context, int) (bool, error)](#DBStoreDeleteIndexByIDFunc.nextHook)
    * [type DBStoreDeleteIndexByIDFuncCall struct](#DBStoreDeleteIndexByIDFuncCall)
        * [func (c DBStoreDeleteIndexByIDFuncCall) Args() []interface{}](#DBStoreDeleteIndexByIDFuncCall.Args)
        * [func (c DBStoreDeleteIndexByIDFuncCall) Results() []interface{}](#DBStoreDeleteIndexByIDFuncCall.Results)
    * [type DBStoreDeleteUploadByIDFunc struct](#DBStoreDeleteUploadByIDFunc)
        * [func (f *DBStoreDeleteUploadByIDFunc) History() []DBStoreDeleteUploadByIDFuncCall](#DBStoreDeleteUploadByIDFunc.History)
        * [func (f *DBStoreDeleteUploadByIDFunc) PushHook(hook func(context.Context, int) (bool, error))](#DBStoreDeleteUploadByIDFunc.PushHook)
        * [func (f *DBStoreDeleteUploadByIDFunc) PushReturn(r0 bool, r1 error)](#DBStoreDeleteUploadByIDFunc.PushReturn)
        * [func (f *DBStoreDeleteUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))](#DBStoreDeleteUploadByIDFunc.SetDefaultHook)
        * [func (f *DBStoreDeleteUploadByIDFunc) SetDefaultReturn(r0 bool, r1 error)](#DBStoreDeleteUploadByIDFunc.SetDefaultReturn)
        * [func (f *DBStoreDeleteUploadByIDFunc) appendCall(r0 DBStoreDeleteUploadByIDFuncCall)](#DBStoreDeleteUploadByIDFunc.appendCall)
        * [func (f *DBStoreDeleteUploadByIDFunc) nextHook() func(context.Context, int) (bool, error)](#DBStoreDeleteUploadByIDFunc.nextHook)
    * [type DBStoreDeleteUploadByIDFuncCall struct](#DBStoreDeleteUploadByIDFuncCall)
        * [func (c DBStoreDeleteUploadByIDFuncCall) Args() []interface{}](#DBStoreDeleteUploadByIDFuncCall.Args)
        * [func (c DBStoreDeleteUploadByIDFuncCall) Results() []interface{}](#DBStoreDeleteUploadByIDFuncCall.Results)
    * [type DBStoreFindClosestDumpsFromGraphFragmentFunc struct](#DBStoreFindClosestDumpsFromGraphFragmentFunc)
        * [func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) History() []DBStoreFindClosestDumpsFromGraphFragmentFuncCall](#DBStoreFindClosestDumpsFromGraphFragmentFunc.History)
        * [func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) PushHook(hook func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error))](#DBStoreFindClosestDumpsFromGraphFragmentFunc.PushHook)
        * [func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) PushReturn(r0 []dbstore.Dump, r1 error)](#DBStoreFindClosestDumpsFromGraphFragmentFunc.PushReturn)
        * [func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) SetDefaultHook(hook func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error))](#DBStoreFindClosestDumpsFromGraphFragmentFunc.SetDefaultHook)
        * [func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)](#DBStoreFindClosestDumpsFromGraphFragmentFunc.SetDefaultReturn)
        * [func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) appendCall(r0 DBStoreFindClosestDumpsFromGraphFragmentFuncCall)](#DBStoreFindClosestDumpsFromGraphFragmentFunc.appendCall)
        * [func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) nextHook() func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error)](#DBStoreFindClosestDumpsFromGraphFragmentFunc.nextHook)
    * [type DBStoreFindClosestDumpsFromGraphFragmentFuncCall struct](#DBStoreFindClosestDumpsFromGraphFragmentFuncCall)
        * [func (c DBStoreFindClosestDumpsFromGraphFragmentFuncCall) Args() []interface{}](#DBStoreFindClosestDumpsFromGraphFragmentFuncCall.Args)
        * [func (c DBStoreFindClosestDumpsFromGraphFragmentFuncCall) Results() []interface{}](#DBStoreFindClosestDumpsFromGraphFragmentFuncCall.Results)
    * [type DBStoreFindClosestDumpsFunc struct](#DBStoreFindClosestDumpsFunc)
        * [func (f *DBStoreFindClosestDumpsFunc) History() []DBStoreFindClosestDumpsFuncCall](#DBStoreFindClosestDumpsFunc.History)
        * [func (f *DBStoreFindClosestDumpsFunc) PushHook(hook func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error))](#DBStoreFindClosestDumpsFunc.PushHook)
        * [func (f *DBStoreFindClosestDumpsFunc) PushReturn(r0 []dbstore.Dump, r1 error)](#DBStoreFindClosestDumpsFunc.PushReturn)
        * [func (f *DBStoreFindClosestDumpsFunc) SetDefaultHook(hook func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error))](#DBStoreFindClosestDumpsFunc.SetDefaultHook)
        * [func (f *DBStoreFindClosestDumpsFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)](#DBStoreFindClosestDumpsFunc.SetDefaultReturn)
        * [func (f *DBStoreFindClosestDumpsFunc) appendCall(r0 DBStoreFindClosestDumpsFuncCall)](#DBStoreFindClosestDumpsFunc.appendCall)
        * [func (f *DBStoreFindClosestDumpsFunc) nextHook() func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error)](#DBStoreFindClosestDumpsFunc.nextHook)
    * [type DBStoreFindClosestDumpsFuncCall struct](#DBStoreFindClosestDumpsFuncCall)
        * [func (c DBStoreFindClosestDumpsFuncCall) Args() []interface{}](#DBStoreFindClosestDumpsFuncCall.Args)
        * [func (c DBStoreFindClosestDumpsFuncCall) Results() []interface{}](#DBStoreFindClosestDumpsFuncCall.Results)
    * [type DBStoreGetDumpsByIDsFunc struct](#DBStoreGetDumpsByIDsFunc)
        * [func (f *DBStoreGetDumpsByIDsFunc) History() []DBStoreGetDumpsByIDsFuncCall](#DBStoreGetDumpsByIDsFunc.History)
        * [func (f *DBStoreGetDumpsByIDsFunc) PushHook(hook func(context.Context, []int) ([]dbstore.Dump, error))](#DBStoreGetDumpsByIDsFunc.PushHook)
        * [func (f *DBStoreGetDumpsByIDsFunc) PushReturn(r0 []dbstore.Dump, r1 error)](#DBStoreGetDumpsByIDsFunc.PushReturn)
        * [func (f *DBStoreGetDumpsByIDsFunc) SetDefaultHook(hook func(context.Context, []int) ([]dbstore.Dump, error))](#DBStoreGetDumpsByIDsFunc.SetDefaultHook)
        * [func (f *DBStoreGetDumpsByIDsFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)](#DBStoreGetDumpsByIDsFunc.SetDefaultReturn)
        * [func (f *DBStoreGetDumpsByIDsFunc) appendCall(r0 DBStoreGetDumpsByIDsFuncCall)](#DBStoreGetDumpsByIDsFunc.appendCall)
        * [func (f *DBStoreGetDumpsByIDsFunc) nextHook() func(context.Context, []int) ([]dbstore.Dump, error)](#DBStoreGetDumpsByIDsFunc.nextHook)
    * [type DBStoreGetDumpsByIDsFuncCall struct](#DBStoreGetDumpsByIDsFuncCall)
        * [func (c DBStoreGetDumpsByIDsFuncCall) Args() []interface{}](#DBStoreGetDumpsByIDsFuncCall.Args)
        * [func (c DBStoreGetDumpsByIDsFuncCall) Results() []interface{}](#DBStoreGetDumpsByIDsFuncCall.Results)
    * [type DBStoreGetIndexByIDFunc struct](#DBStoreGetIndexByIDFunc)
        * [func (f *DBStoreGetIndexByIDFunc) History() []DBStoreGetIndexByIDFuncCall](#DBStoreGetIndexByIDFunc.History)
        * [func (f *DBStoreGetIndexByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Index, bool, error))](#DBStoreGetIndexByIDFunc.PushHook)
        * [func (f *DBStoreGetIndexByIDFunc) PushReturn(r0 dbstore.Index, r1 bool, r2 error)](#DBStoreGetIndexByIDFunc.PushReturn)
        * [func (f *DBStoreGetIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Index, bool, error))](#DBStoreGetIndexByIDFunc.SetDefaultHook)
        * [func (f *DBStoreGetIndexByIDFunc) SetDefaultReturn(r0 dbstore.Index, r1 bool, r2 error)](#DBStoreGetIndexByIDFunc.SetDefaultReturn)
        * [func (f *DBStoreGetIndexByIDFunc) appendCall(r0 DBStoreGetIndexByIDFuncCall)](#DBStoreGetIndexByIDFunc.appendCall)
        * [func (f *DBStoreGetIndexByIDFunc) nextHook() func(context.Context, int) (dbstore.Index, bool, error)](#DBStoreGetIndexByIDFunc.nextHook)
    * [type DBStoreGetIndexByIDFuncCall struct](#DBStoreGetIndexByIDFuncCall)
        * [func (c DBStoreGetIndexByIDFuncCall) Args() []interface{}](#DBStoreGetIndexByIDFuncCall.Args)
        * [func (c DBStoreGetIndexByIDFuncCall) Results() []interface{}](#DBStoreGetIndexByIDFuncCall.Results)
    * [type DBStoreGetIndexConfigurationByRepositoryIDFunc struct](#DBStoreGetIndexConfigurationByRepositoryIDFunc)
        * [func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) History() []DBStoreGetIndexConfigurationByRepositoryIDFuncCall](#DBStoreGetIndexConfigurationByRepositoryIDFunc.History)
        * [func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))](#DBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook)
        * [func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)](#DBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn)
        * [func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))](#DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook)
        * [func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)](#DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn)
        * [func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) appendCall(r0 DBStoreGetIndexConfigurationByRepositoryIDFuncCall)](#DBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall)
        * [func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int) (dbstore.IndexConfiguration, bool, error)](#DBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook)
    * [type DBStoreGetIndexConfigurationByRepositoryIDFuncCall struct](#DBStoreGetIndexConfigurationByRepositoryIDFuncCall)
        * [func (c DBStoreGetIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}](#DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Args)
        * [func (c DBStoreGetIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}](#DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results)
    * [type DBStoreGetIndexesByIDsFunc struct](#DBStoreGetIndexesByIDsFunc)
        * [func (f *DBStoreGetIndexesByIDsFunc) History() []DBStoreGetIndexesByIDsFuncCall](#DBStoreGetIndexesByIDsFunc.History)
        * [func (f *DBStoreGetIndexesByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Index, error))](#DBStoreGetIndexesByIDsFunc.PushHook)
        * [func (f *DBStoreGetIndexesByIDsFunc) PushReturn(r0 []dbstore.Index, r1 error)](#DBStoreGetIndexesByIDsFunc.PushReturn)
        * [func (f *DBStoreGetIndexesByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Index, error))](#DBStoreGetIndexesByIDsFunc.SetDefaultHook)
        * [func (f *DBStoreGetIndexesByIDsFunc) SetDefaultReturn(r0 []dbstore.Index, r1 error)](#DBStoreGetIndexesByIDsFunc.SetDefaultReturn)
        * [func (f *DBStoreGetIndexesByIDsFunc) appendCall(r0 DBStoreGetIndexesByIDsFuncCall)](#DBStoreGetIndexesByIDsFunc.appendCall)
        * [func (f *DBStoreGetIndexesByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Index, error)](#DBStoreGetIndexesByIDsFunc.nextHook)
    * [type DBStoreGetIndexesByIDsFuncCall struct](#DBStoreGetIndexesByIDsFuncCall)
        * [func (c DBStoreGetIndexesByIDsFuncCall) Args() []interface{}](#DBStoreGetIndexesByIDsFuncCall.Args)
        * [func (c DBStoreGetIndexesByIDsFuncCall) Results() []interface{}](#DBStoreGetIndexesByIDsFuncCall.Results)
    * [type DBStoreGetIndexesFunc struct](#DBStoreGetIndexesFunc)
        * [func (f *DBStoreGetIndexesFunc) History() []DBStoreGetIndexesFuncCall](#DBStoreGetIndexesFunc.History)
        * [func (f *DBStoreGetIndexesFunc) PushHook(hook func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error))](#DBStoreGetIndexesFunc.PushHook)
        * [func (f *DBStoreGetIndexesFunc) PushReturn(r0 []dbstore.Index, r1 int, r2 error)](#DBStoreGetIndexesFunc.PushReturn)
        * [func (f *DBStoreGetIndexesFunc) SetDefaultHook(hook func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error))](#DBStoreGetIndexesFunc.SetDefaultHook)
        * [func (f *DBStoreGetIndexesFunc) SetDefaultReturn(r0 []dbstore.Index, r1 int, r2 error)](#DBStoreGetIndexesFunc.SetDefaultReturn)
        * [func (f *DBStoreGetIndexesFunc) appendCall(r0 DBStoreGetIndexesFuncCall)](#DBStoreGetIndexesFunc.appendCall)
        * [func (f *DBStoreGetIndexesFunc) nextHook() func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error)](#DBStoreGetIndexesFunc.nextHook)
    * [type DBStoreGetIndexesFuncCall struct](#DBStoreGetIndexesFuncCall)
        * [func (c DBStoreGetIndexesFuncCall) Args() []interface{}](#DBStoreGetIndexesFuncCall.Args)
        * [func (c DBStoreGetIndexesFuncCall) Results() []interface{}](#DBStoreGetIndexesFuncCall.Results)
    * [type DBStoreGetUploadByIDFunc struct](#DBStoreGetUploadByIDFunc)
        * [func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall](#DBStoreGetUploadByIDFunc.History)
        * [func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#DBStoreGetUploadByIDFunc.PushHook)
        * [func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)](#DBStoreGetUploadByIDFunc.PushReturn)
        * [func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#DBStoreGetUploadByIDFunc.SetDefaultHook)
        * [func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)](#DBStoreGetUploadByIDFunc.SetDefaultReturn)
        * [func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)](#DBStoreGetUploadByIDFunc.appendCall)
        * [func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)](#DBStoreGetUploadByIDFunc.nextHook)
    * [type DBStoreGetUploadByIDFuncCall struct](#DBStoreGetUploadByIDFuncCall)
        * [func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}](#DBStoreGetUploadByIDFuncCall.Args)
        * [func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}](#DBStoreGetUploadByIDFuncCall.Results)
    * [type DBStoreGetUploadsByIDsFunc struct](#DBStoreGetUploadsByIDsFunc)
        * [func (f *DBStoreGetUploadsByIDsFunc) History() []DBStoreGetUploadsByIDsFuncCall](#DBStoreGetUploadsByIDsFunc.History)
        * [func (f *DBStoreGetUploadsByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))](#DBStoreGetUploadsByIDsFunc.PushHook)
        * [func (f *DBStoreGetUploadsByIDsFunc) PushReturn(r0 []dbstore.Upload, r1 error)](#DBStoreGetUploadsByIDsFunc.PushReturn)
        * [func (f *DBStoreGetUploadsByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))](#DBStoreGetUploadsByIDsFunc.SetDefaultHook)
        * [func (f *DBStoreGetUploadsByIDsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 error)](#DBStoreGetUploadsByIDsFunc.SetDefaultReturn)
        * [func (f *DBStoreGetUploadsByIDsFunc) appendCall(r0 DBStoreGetUploadsByIDsFuncCall)](#DBStoreGetUploadsByIDsFunc.appendCall)
        * [func (f *DBStoreGetUploadsByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Upload, error)](#DBStoreGetUploadsByIDsFunc.nextHook)
    * [type DBStoreGetUploadsByIDsFuncCall struct](#DBStoreGetUploadsByIDsFuncCall)
        * [func (c DBStoreGetUploadsByIDsFuncCall) Args() []interface{}](#DBStoreGetUploadsByIDsFuncCall.Args)
        * [func (c DBStoreGetUploadsByIDsFuncCall) Results() []interface{}](#DBStoreGetUploadsByIDsFuncCall.Results)
    * [type DBStoreGetUploadsFunc struct](#DBStoreGetUploadsFunc)
        * [func (f *DBStoreGetUploadsFunc) History() []DBStoreGetUploadsFuncCall](#DBStoreGetUploadsFunc.History)
        * [func (f *DBStoreGetUploadsFunc) PushHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))](#DBStoreGetUploadsFunc.PushHook)
        * [func (f *DBStoreGetUploadsFunc) PushReturn(r0 []dbstore.Upload, r1 int, r2 error)](#DBStoreGetUploadsFunc.PushReturn)
        * [func (f *DBStoreGetUploadsFunc) SetDefaultHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))](#DBStoreGetUploadsFunc.SetDefaultHook)
        * [func (f *DBStoreGetUploadsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 int, r2 error)](#DBStoreGetUploadsFunc.SetDefaultReturn)
        * [func (f *DBStoreGetUploadsFunc) appendCall(r0 DBStoreGetUploadsFuncCall)](#DBStoreGetUploadsFunc.appendCall)
        * [func (f *DBStoreGetUploadsFunc) nextHook() func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)](#DBStoreGetUploadsFunc.nextHook)
    * [type DBStoreGetUploadsFuncCall struct](#DBStoreGetUploadsFuncCall)
        * [func (c DBStoreGetUploadsFuncCall) Args() []interface{}](#DBStoreGetUploadsFuncCall.Args)
        * [func (c DBStoreGetUploadsFuncCall) Results() []interface{}](#DBStoreGetUploadsFuncCall.Results)
    * [type DBStoreHasCommitFunc struct](#DBStoreHasCommitFunc)
        * [func (f *DBStoreHasCommitFunc) History() []DBStoreHasCommitFuncCall](#DBStoreHasCommitFunc.History)
        * [func (f *DBStoreHasCommitFunc) PushHook(hook func(context.Context, int, string) (bool, error))](#DBStoreHasCommitFunc.PushHook)
        * [func (f *DBStoreHasCommitFunc) PushReturn(r0 bool, r1 error)](#DBStoreHasCommitFunc.PushReturn)
        * [func (f *DBStoreHasCommitFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))](#DBStoreHasCommitFunc.SetDefaultHook)
        * [func (f *DBStoreHasCommitFunc) SetDefaultReturn(r0 bool, r1 error)](#DBStoreHasCommitFunc.SetDefaultReturn)
        * [func (f *DBStoreHasCommitFunc) appendCall(r0 DBStoreHasCommitFuncCall)](#DBStoreHasCommitFunc.appendCall)
        * [func (f *DBStoreHasCommitFunc) nextHook() func(context.Context, int, string) (bool, error)](#DBStoreHasCommitFunc.nextHook)
    * [type DBStoreHasCommitFuncCall struct](#DBStoreHasCommitFuncCall)
        * [func (c DBStoreHasCommitFuncCall) Args() []interface{}](#DBStoreHasCommitFuncCall.Args)
        * [func (c DBStoreHasCommitFuncCall) Results() []interface{}](#DBStoreHasCommitFuncCall.Results)
    * [type DBStoreHasRepositoryFunc struct](#DBStoreHasRepositoryFunc)
        * [func (f *DBStoreHasRepositoryFunc) History() []DBStoreHasRepositoryFuncCall](#DBStoreHasRepositoryFunc.History)
        * [func (f *DBStoreHasRepositoryFunc) PushHook(hook func(context.Context, int) (bool, error))](#DBStoreHasRepositoryFunc.PushHook)
        * [func (f *DBStoreHasRepositoryFunc) PushReturn(r0 bool, r1 error)](#DBStoreHasRepositoryFunc.PushReturn)
        * [func (f *DBStoreHasRepositoryFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))](#DBStoreHasRepositoryFunc.SetDefaultHook)
        * [func (f *DBStoreHasRepositoryFunc) SetDefaultReturn(r0 bool, r1 error)](#DBStoreHasRepositoryFunc.SetDefaultReturn)
        * [func (f *DBStoreHasRepositoryFunc) appendCall(r0 DBStoreHasRepositoryFuncCall)](#DBStoreHasRepositoryFunc.appendCall)
        * [func (f *DBStoreHasRepositoryFunc) nextHook() func(context.Context, int) (bool, error)](#DBStoreHasRepositoryFunc.nextHook)
    * [type DBStoreHasRepositoryFuncCall struct](#DBStoreHasRepositoryFuncCall)
        * [func (c DBStoreHasRepositoryFuncCall) Args() []interface{}](#DBStoreHasRepositoryFuncCall.Args)
        * [func (c DBStoreHasRepositoryFuncCall) Results() []interface{}](#DBStoreHasRepositoryFuncCall.Results)
    * [type DBStoreMarkRepositoryAsDirtyFunc struct](#DBStoreMarkRepositoryAsDirtyFunc)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) History() []DBStoreMarkRepositoryAsDirtyFuncCall](#DBStoreMarkRepositoryAsDirtyFunc.History)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) PushHook(hook func(context.Context, int) error)](#DBStoreMarkRepositoryAsDirtyFunc.PushHook)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) PushReturn(r0 error)](#DBStoreMarkRepositoryAsDirtyFunc.PushReturn)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultHook(hook func(context.Context, int) error)](#DBStoreMarkRepositoryAsDirtyFunc.SetDefaultHook)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultReturn(r0 error)](#DBStoreMarkRepositoryAsDirtyFunc.SetDefaultReturn)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) appendCall(r0 DBStoreMarkRepositoryAsDirtyFuncCall)](#DBStoreMarkRepositoryAsDirtyFunc.appendCall)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) nextHook() func(context.Context, int) error](#DBStoreMarkRepositoryAsDirtyFunc.nextHook)
    * [type DBStoreMarkRepositoryAsDirtyFuncCall struct](#DBStoreMarkRepositoryAsDirtyFuncCall)
        * [func (c DBStoreMarkRepositoryAsDirtyFuncCall) Args() []interface{}](#DBStoreMarkRepositoryAsDirtyFuncCall.Args)
        * [func (c DBStoreMarkRepositoryAsDirtyFuncCall) Results() []interface{}](#DBStoreMarkRepositoryAsDirtyFuncCall.Results)
    * [type DBStoreReferenceIDsAndFiltersFunc struct](#DBStoreReferenceIDsAndFiltersFunc)
        * [func (f *DBStoreReferenceIDsAndFiltersFunc) History() []DBStoreReferenceIDsAndFiltersFuncCall](#DBStoreReferenceIDsAndFiltersFunc.History)
        * [func (f *DBStoreReferenceIDsAndFiltersFunc) PushHook(hook func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error))](#DBStoreReferenceIDsAndFiltersFunc.PushHook)
        * [func (f *DBStoreReferenceIDsAndFiltersFunc) PushReturn(r0 dbstore.PackageReferenceScanner, r1 int, r2 error)](#DBStoreReferenceIDsAndFiltersFunc.PushReturn)
        * [func (f *DBStoreReferenceIDsAndFiltersFunc) SetDefaultHook(hook func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error))](#DBStoreReferenceIDsAndFiltersFunc.SetDefaultHook)
        * [func (f *DBStoreReferenceIDsAndFiltersFunc) SetDefaultReturn(r0 dbstore.PackageReferenceScanner, r1 int, r2 error)](#DBStoreReferenceIDsAndFiltersFunc.SetDefaultReturn)
        * [func (f *DBStoreReferenceIDsAndFiltersFunc) appendCall(r0 DBStoreReferenceIDsAndFiltersFuncCall)](#DBStoreReferenceIDsAndFiltersFunc.appendCall)
        * [func (f *DBStoreReferenceIDsAndFiltersFunc) nextHook() func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error)](#DBStoreReferenceIDsAndFiltersFunc.nextHook)
    * [type DBStoreReferenceIDsAndFiltersFuncCall struct](#DBStoreReferenceIDsAndFiltersFuncCall)
        * [func (c DBStoreReferenceIDsAndFiltersFuncCall) Args() []interface{}](#DBStoreReferenceIDsAndFiltersFuncCall.Args)
        * [func (c DBStoreReferenceIDsAndFiltersFuncCall) Results() []interface{}](#DBStoreReferenceIDsAndFiltersFuncCall.Results)
    * [type DBStoreRepoNameFunc struct](#DBStoreRepoNameFunc)
        * [func (f *DBStoreRepoNameFunc) History() []DBStoreRepoNameFuncCall](#DBStoreRepoNameFunc.History)
        * [func (f *DBStoreRepoNameFunc) PushHook(hook func(context.Context, int) (string, error))](#DBStoreRepoNameFunc.PushHook)
        * [func (f *DBStoreRepoNameFunc) PushReturn(r0 string, r1 error)](#DBStoreRepoNameFunc.PushReturn)
        * [func (f *DBStoreRepoNameFunc) SetDefaultHook(hook func(context.Context, int) (string, error))](#DBStoreRepoNameFunc.SetDefaultHook)
        * [func (f *DBStoreRepoNameFunc) SetDefaultReturn(r0 string, r1 error)](#DBStoreRepoNameFunc.SetDefaultReturn)
        * [func (f *DBStoreRepoNameFunc) appendCall(r0 DBStoreRepoNameFuncCall)](#DBStoreRepoNameFunc.appendCall)
        * [func (f *DBStoreRepoNameFunc) nextHook() func(context.Context, int) (string, error)](#DBStoreRepoNameFunc.nextHook)
    * [type DBStoreRepoNameFuncCall struct](#DBStoreRepoNameFuncCall)
        * [func (c DBStoreRepoNameFuncCall) Args() []interface{}](#DBStoreRepoNameFuncCall.Args)
        * [func (c DBStoreRepoNameFuncCall) Results() []interface{}](#DBStoreRepoNameFuncCall.Results)
    * [type DBStoreUpdateIndexConfigurationByRepositoryIDFunc struct](#DBStoreUpdateIndexConfigurationByRepositoryIDFunc)
        * [func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) History() []DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall](#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.History)
        * [func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int, []byte) error)](#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.PushHook)
        * [func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) PushReturn(r0 error)](#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.PushReturn)
        * [func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int, []byte) error)](#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultHook)
        * [func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 error)](#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultReturn)
        * [func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) appendCall(r0 DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall)](#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.appendCall)
        * [func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int, []byte) error](#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.nextHook)
    * [type DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall struct](#DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall)
        * [func (c DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}](#DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall.Args)
        * [func (c DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}](#DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall.Results)
    * [type EnqueuerDBStore enqueuer.DBStore](#EnqueuerDBStore)
    * [type EnqueuerDBStoreDirtyRepositoriesFunc struct](#EnqueuerDBStoreDirtyRepositoriesFunc)
        * [func (f *EnqueuerDBStoreDirtyRepositoriesFunc) History() []EnqueuerDBStoreDirtyRepositoriesFuncCall](#EnqueuerDBStoreDirtyRepositoriesFunc.History)
        * [func (f *EnqueuerDBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))](#EnqueuerDBStoreDirtyRepositoriesFunc.PushHook)
        * [func (f *EnqueuerDBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)](#EnqueuerDBStoreDirtyRepositoriesFunc.PushReturn)
        * [func (f *EnqueuerDBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))](#EnqueuerDBStoreDirtyRepositoriesFunc.SetDefaultHook)
        * [func (f *EnqueuerDBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)](#EnqueuerDBStoreDirtyRepositoriesFunc.SetDefaultReturn)
        * [func (f *EnqueuerDBStoreDirtyRepositoriesFunc) appendCall(r0 EnqueuerDBStoreDirtyRepositoriesFuncCall)](#EnqueuerDBStoreDirtyRepositoriesFunc.appendCall)
        * [func (f *EnqueuerDBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)](#EnqueuerDBStoreDirtyRepositoriesFunc.nextHook)
    * [type EnqueuerDBStoreDirtyRepositoriesFuncCall struct](#EnqueuerDBStoreDirtyRepositoriesFuncCall)
        * [func (c EnqueuerDBStoreDirtyRepositoriesFuncCall) Args() []interface{}](#EnqueuerDBStoreDirtyRepositoriesFuncCall.Args)
        * [func (c EnqueuerDBStoreDirtyRepositoriesFuncCall) Results() []interface{}](#EnqueuerDBStoreDirtyRepositoriesFuncCall.Results)
    * [type EnqueuerDBStoreDoneFunc struct](#EnqueuerDBStoreDoneFunc)
        * [func (f *EnqueuerDBStoreDoneFunc) History() []EnqueuerDBStoreDoneFuncCall](#EnqueuerDBStoreDoneFunc.History)
        * [func (f *EnqueuerDBStoreDoneFunc) PushHook(hook func(error) error)](#EnqueuerDBStoreDoneFunc.PushHook)
        * [func (f *EnqueuerDBStoreDoneFunc) PushReturn(r0 error)](#EnqueuerDBStoreDoneFunc.PushReturn)
        * [func (f *EnqueuerDBStoreDoneFunc) SetDefaultHook(hook func(error) error)](#EnqueuerDBStoreDoneFunc.SetDefaultHook)
        * [func (f *EnqueuerDBStoreDoneFunc) SetDefaultReturn(r0 error)](#EnqueuerDBStoreDoneFunc.SetDefaultReturn)
        * [func (f *EnqueuerDBStoreDoneFunc) appendCall(r0 EnqueuerDBStoreDoneFuncCall)](#EnqueuerDBStoreDoneFunc.appendCall)
        * [func (f *EnqueuerDBStoreDoneFunc) nextHook() func(error) error](#EnqueuerDBStoreDoneFunc.nextHook)
    * [type EnqueuerDBStoreDoneFuncCall struct](#EnqueuerDBStoreDoneFuncCall)
        * [func (c EnqueuerDBStoreDoneFuncCall) Args() []interface{}](#EnqueuerDBStoreDoneFuncCall.Args)
        * [func (c EnqueuerDBStoreDoneFuncCall) Results() []interface{}](#EnqueuerDBStoreDoneFuncCall.Results)
    * [type EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc struct](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc)
        * [func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) History() []EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.History)
        * [func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook)
        * [func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) PushReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn)
        * [func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook)
        * [func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn)
        * [func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) appendCall(r0 EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall)](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall)
        * [func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int) (dbstore.IndexConfiguration, bool, error)](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook)
    * [type EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall struct](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall)
        * [func (c EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall.Args)
        * [func (c EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}](#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results)
    * [type EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc struct](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc)
        * [func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) History() []EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.History)
        * [func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) PushHook(hook func(context.Context) ([]int, error))](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook)
        * [func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) PushReturn(r0 []int, r1 error)](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn)
        * [func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultHook(hook func(context.Context) ([]int, error))](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook)
        * [func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultReturn(r0 []int, r1 error)](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn)
        * [func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) appendCall(r0 EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall)](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall)
        * [func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) nextHook() func(context.Context) ([]int, error)](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook)
    * [type EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall struct](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall)
        * [func (c EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall) Args() []interface{}](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args)
        * [func (c EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall) Results() []interface{}](#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results)
    * [type EnqueuerDBStoreHandleFunc struct](#EnqueuerDBStoreHandleFunc)
        * [func (f *EnqueuerDBStoreHandleFunc) History() []EnqueuerDBStoreHandleFuncCall](#EnqueuerDBStoreHandleFunc.History)
        * [func (f *EnqueuerDBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)](#EnqueuerDBStoreHandleFunc.PushHook)
        * [func (f *EnqueuerDBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)](#EnqueuerDBStoreHandleFunc.PushReturn)
        * [func (f *EnqueuerDBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)](#EnqueuerDBStoreHandleFunc.SetDefaultHook)
        * [func (f *EnqueuerDBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)](#EnqueuerDBStoreHandleFunc.SetDefaultReturn)
        * [func (f *EnqueuerDBStoreHandleFunc) appendCall(r0 EnqueuerDBStoreHandleFuncCall)](#EnqueuerDBStoreHandleFunc.appendCall)
        * [func (f *EnqueuerDBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle](#EnqueuerDBStoreHandleFunc.nextHook)
    * [type EnqueuerDBStoreHandleFuncCall struct](#EnqueuerDBStoreHandleFuncCall)
        * [func (c EnqueuerDBStoreHandleFuncCall) Args() []interface{}](#EnqueuerDBStoreHandleFuncCall.Args)
        * [func (c EnqueuerDBStoreHandleFuncCall) Results() []interface{}](#EnqueuerDBStoreHandleFuncCall.Results)
    * [type EnqueuerDBStoreInsertIndexFunc struct](#EnqueuerDBStoreInsertIndexFunc)
        * [func (f *EnqueuerDBStoreInsertIndexFunc) History() []EnqueuerDBStoreInsertIndexFuncCall](#EnqueuerDBStoreInsertIndexFunc.History)
        * [func (f *EnqueuerDBStoreInsertIndexFunc) PushHook(hook func(context.Context, dbstore.Index) (int, error))](#EnqueuerDBStoreInsertIndexFunc.PushHook)
        * [func (f *EnqueuerDBStoreInsertIndexFunc) PushReturn(r0 int, r1 error)](#EnqueuerDBStoreInsertIndexFunc.PushReturn)
        * [func (f *EnqueuerDBStoreInsertIndexFunc) SetDefaultHook(hook func(context.Context, dbstore.Index) (int, error))](#EnqueuerDBStoreInsertIndexFunc.SetDefaultHook)
        * [func (f *EnqueuerDBStoreInsertIndexFunc) SetDefaultReturn(r0 int, r1 error)](#EnqueuerDBStoreInsertIndexFunc.SetDefaultReturn)
        * [func (f *EnqueuerDBStoreInsertIndexFunc) appendCall(r0 EnqueuerDBStoreInsertIndexFuncCall)](#EnqueuerDBStoreInsertIndexFunc.appendCall)
        * [func (f *EnqueuerDBStoreInsertIndexFunc) nextHook() func(context.Context, dbstore.Index) (int, error)](#EnqueuerDBStoreInsertIndexFunc.nextHook)
    * [type EnqueuerDBStoreInsertIndexFuncCall struct](#EnqueuerDBStoreInsertIndexFuncCall)
        * [func (c EnqueuerDBStoreInsertIndexFuncCall) Args() []interface{}](#EnqueuerDBStoreInsertIndexFuncCall.Args)
        * [func (c EnqueuerDBStoreInsertIndexFuncCall) Results() []interface{}](#EnqueuerDBStoreInsertIndexFuncCall.Results)
    * [type EnqueuerDBStoreIsQueuedFunc struct](#EnqueuerDBStoreIsQueuedFunc)
        * [func (f *EnqueuerDBStoreIsQueuedFunc) History() []EnqueuerDBStoreIsQueuedFuncCall](#EnqueuerDBStoreIsQueuedFunc.History)
        * [func (f *EnqueuerDBStoreIsQueuedFunc) PushHook(hook func(context.Context, int, string) (bool, error))](#EnqueuerDBStoreIsQueuedFunc.PushHook)
        * [func (f *EnqueuerDBStoreIsQueuedFunc) PushReturn(r0 bool, r1 error)](#EnqueuerDBStoreIsQueuedFunc.PushReturn)
        * [func (f *EnqueuerDBStoreIsQueuedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))](#EnqueuerDBStoreIsQueuedFunc.SetDefaultHook)
        * [func (f *EnqueuerDBStoreIsQueuedFunc) SetDefaultReturn(r0 bool, r1 error)](#EnqueuerDBStoreIsQueuedFunc.SetDefaultReturn)
        * [func (f *EnqueuerDBStoreIsQueuedFunc) appendCall(r0 EnqueuerDBStoreIsQueuedFuncCall)](#EnqueuerDBStoreIsQueuedFunc.appendCall)
        * [func (f *EnqueuerDBStoreIsQueuedFunc) nextHook() func(context.Context, int, string) (bool, error)](#EnqueuerDBStoreIsQueuedFunc.nextHook)
    * [type EnqueuerDBStoreIsQueuedFuncCall struct](#EnqueuerDBStoreIsQueuedFuncCall)
        * [func (c EnqueuerDBStoreIsQueuedFuncCall) Args() []interface{}](#EnqueuerDBStoreIsQueuedFuncCall.Args)
        * [func (c EnqueuerDBStoreIsQueuedFuncCall) Results() []interface{}](#EnqueuerDBStoreIsQueuedFuncCall.Results)
    * [type EnqueuerDBStoreTransactFunc struct](#EnqueuerDBStoreTransactFunc)
        * [func (f *EnqueuerDBStoreTransactFunc) History() []EnqueuerDBStoreTransactFuncCall](#EnqueuerDBStoreTransactFunc.History)
        * [func (f *EnqueuerDBStoreTransactFunc) PushHook(hook func(context.Context) (enqueuer.DBStore, error))](#EnqueuerDBStoreTransactFunc.PushHook)
        * [func (f *EnqueuerDBStoreTransactFunc) PushReturn(r0 enqueuer.DBStore, r1 error)](#EnqueuerDBStoreTransactFunc.PushReturn)
        * [func (f *EnqueuerDBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (enqueuer.DBStore, error))](#EnqueuerDBStoreTransactFunc.SetDefaultHook)
        * [func (f *EnqueuerDBStoreTransactFunc) SetDefaultReturn(r0 enqueuer.DBStore, r1 error)](#EnqueuerDBStoreTransactFunc.SetDefaultReturn)
        * [func (f *EnqueuerDBStoreTransactFunc) appendCall(r0 EnqueuerDBStoreTransactFuncCall)](#EnqueuerDBStoreTransactFunc.appendCall)
        * [func (f *EnqueuerDBStoreTransactFunc) nextHook() func(context.Context) (enqueuer.DBStore, error)](#EnqueuerDBStoreTransactFunc.nextHook)
    * [type EnqueuerDBStoreTransactFuncCall struct](#EnqueuerDBStoreTransactFuncCall)
        * [func (c EnqueuerDBStoreTransactFuncCall) Args() []interface{}](#EnqueuerDBStoreTransactFuncCall.Args)
        * [func (c EnqueuerDBStoreTransactFuncCall) Results() []interface{}](#EnqueuerDBStoreTransactFuncCall.Results)
    * [type EnqueuerGitserverClient enqueuer.GitserverClient](#EnqueuerGitserverClient)
    * [type EnqueuerGitserverClientFileExistsFunc struct](#EnqueuerGitserverClientFileExistsFunc)
        * [func (f *EnqueuerGitserverClientFileExistsFunc) History() []EnqueuerGitserverClientFileExistsFuncCall](#EnqueuerGitserverClientFileExistsFunc.History)
        * [func (f *EnqueuerGitserverClientFileExistsFunc) PushHook(hook func(context.Context, int, string, string) (bool, error))](#EnqueuerGitserverClientFileExistsFunc.PushHook)
        * [func (f *EnqueuerGitserverClientFileExistsFunc) PushReturn(r0 bool, r1 error)](#EnqueuerGitserverClientFileExistsFunc.PushReturn)
        * [func (f *EnqueuerGitserverClientFileExistsFunc) SetDefaultHook(hook func(context.Context, int, string, string) (bool, error))](#EnqueuerGitserverClientFileExistsFunc.SetDefaultHook)
        * [func (f *EnqueuerGitserverClientFileExistsFunc) SetDefaultReturn(r0 bool, r1 error)](#EnqueuerGitserverClientFileExistsFunc.SetDefaultReturn)
        * [func (f *EnqueuerGitserverClientFileExistsFunc) appendCall(r0 EnqueuerGitserverClientFileExistsFuncCall)](#EnqueuerGitserverClientFileExistsFunc.appendCall)
        * [func (f *EnqueuerGitserverClientFileExistsFunc) nextHook() func(context.Context, int, string, string) (bool, error)](#EnqueuerGitserverClientFileExistsFunc.nextHook)
    * [type EnqueuerGitserverClientFileExistsFuncCall struct](#EnqueuerGitserverClientFileExistsFuncCall)
        * [func (c EnqueuerGitserverClientFileExistsFuncCall) Args() []interface{}](#EnqueuerGitserverClientFileExistsFuncCall.Args)
        * [func (c EnqueuerGitserverClientFileExistsFuncCall) Results() []interface{}](#EnqueuerGitserverClientFileExistsFuncCall.Results)
    * [type EnqueuerGitserverClientHeadFunc struct](#EnqueuerGitserverClientHeadFunc)
        * [func (f *EnqueuerGitserverClientHeadFunc) History() []EnqueuerGitserverClientHeadFuncCall](#EnqueuerGitserverClientHeadFunc.History)
        * [func (f *EnqueuerGitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))](#EnqueuerGitserverClientHeadFunc.PushHook)
        * [func (f *EnqueuerGitserverClientHeadFunc) PushReturn(r0 string, r1 error)](#EnqueuerGitserverClientHeadFunc.PushReturn)
        * [func (f *EnqueuerGitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))](#EnqueuerGitserverClientHeadFunc.SetDefaultHook)
        * [func (f *EnqueuerGitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)](#EnqueuerGitserverClientHeadFunc.SetDefaultReturn)
        * [func (f *EnqueuerGitserverClientHeadFunc) appendCall(r0 EnqueuerGitserverClientHeadFuncCall)](#EnqueuerGitserverClientHeadFunc.appendCall)
        * [func (f *EnqueuerGitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)](#EnqueuerGitserverClientHeadFunc.nextHook)
    * [type EnqueuerGitserverClientHeadFuncCall struct](#EnqueuerGitserverClientHeadFuncCall)
        * [func (c EnqueuerGitserverClientHeadFuncCall) Args() []interface{}](#EnqueuerGitserverClientHeadFuncCall.Args)
        * [func (c EnqueuerGitserverClientHeadFuncCall) Results() []interface{}](#EnqueuerGitserverClientHeadFuncCall.Results)
    * [type EnqueuerGitserverClientListFilesFunc struct](#EnqueuerGitserverClientListFilesFunc)
        * [func (f *EnqueuerGitserverClientListFilesFunc) History() []EnqueuerGitserverClientListFilesFuncCall](#EnqueuerGitserverClientListFilesFunc.History)
        * [func (f *EnqueuerGitserverClientListFilesFunc) PushHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))](#EnqueuerGitserverClientListFilesFunc.PushHook)
        * [func (f *EnqueuerGitserverClientListFilesFunc) PushReturn(r0 []string, r1 error)](#EnqueuerGitserverClientListFilesFunc.PushReturn)
        * [func (f *EnqueuerGitserverClientListFilesFunc) SetDefaultHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))](#EnqueuerGitserverClientListFilesFunc.SetDefaultHook)
        * [func (f *EnqueuerGitserverClientListFilesFunc) SetDefaultReturn(r0 []string, r1 error)](#EnqueuerGitserverClientListFilesFunc.SetDefaultReturn)
        * [func (f *EnqueuerGitserverClientListFilesFunc) appendCall(r0 EnqueuerGitserverClientListFilesFuncCall)](#EnqueuerGitserverClientListFilesFunc.appendCall)
        * [func (f *EnqueuerGitserverClientListFilesFunc) nextHook() func(context.Context, int, string, *regexp.Regexp) ([]string, error)](#EnqueuerGitserverClientListFilesFunc.nextHook)
    * [type EnqueuerGitserverClientListFilesFuncCall struct](#EnqueuerGitserverClientListFilesFuncCall)
        * [func (c EnqueuerGitserverClientListFilesFuncCall) Args() []interface{}](#EnqueuerGitserverClientListFilesFuncCall.Args)
        * [func (c EnqueuerGitserverClientListFilesFuncCall) Results() []interface{}](#EnqueuerGitserverClientListFilesFuncCall.Results)
    * [type EnqueuerGitserverClientRawContentsFunc struct](#EnqueuerGitserverClientRawContentsFunc)
        * [func (f *EnqueuerGitserverClientRawContentsFunc) History() []EnqueuerGitserverClientRawContentsFuncCall](#EnqueuerGitserverClientRawContentsFunc.History)
        * [func (f *EnqueuerGitserverClientRawContentsFunc) PushHook(hook func(context.Context, int, string, string) ([]byte, error))](#EnqueuerGitserverClientRawContentsFunc.PushHook)
        * [func (f *EnqueuerGitserverClientRawContentsFunc) PushReturn(r0 []byte, r1 error)](#EnqueuerGitserverClientRawContentsFunc.PushReturn)
        * [func (f *EnqueuerGitserverClientRawContentsFunc) SetDefaultHook(hook func(context.Context, int, string, string) ([]byte, error))](#EnqueuerGitserverClientRawContentsFunc.SetDefaultHook)
        * [func (f *EnqueuerGitserverClientRawContentsFunc) SetDefaultReturn(r0 []byte, r1 error)](#EnqueuerGitserverClientRawContentsFunc.SetDefaultReturn)
        * [func (f *EnqueuerGitserverClientRawContentsFunc) appendCall(r0 EnqueuerGitserverClientRawContentsFuncCall)](#EnqueuerGitserverClientRawContentsFunc.appendCall)
        * [func (f *EnqueuerGitserverClientRawContentsFunc) nextHook() func(context.Context, int, string, string) ([]byte, error)](#EnqueuerGitserverClientRawContentsFunc.nextHook)
    * [type EnqueuerGitserverClientRawContentsFuncCall struct](#EnqueuerGitserverClientRawContentsFuncCall)
        * [func (c EnqueuerGitserverClientRawContentsFuncCall) Args() []interface{}](#EnqueuerGitserverClientRawContentsFuncCall.Args)
        * [func (c EnqueuerGitserverClientRawContentsFuncCall) Results() []interface{}](#EnqueuerGitserverClientRawContentsFuncCall.Results)
    * [type EnqueuerGitserverClientResolveRevisionFunc struct](#EnqueuerGitserverClientResolveRevisionFunc)
        * [func (f *EnqueuerGitserverClientResolveRevisionFunc) History() []EnqueuerGitserverClientResolveRevisionFuncCall](#EnqueuerGitserverClientResolveRevisionFunc.History)
        * [func (f *EnqueuerGitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))](#EnqueuerGitserverClientResolveRevisionFunc.PushHook)
        * [func (f *EnqueuerGitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)](#EnqueuerGitserverClientResolveRevisionFunc.PushReturn)
        * [func (f *EnqueuerGitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))](#EnqueuerGitserverClientResolveRevisionFunc.SetDefaultHook)
        * [func (f *EnqueuerGitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)](#EnqueuerGitserverClientResolveRevisionFunc.SetDefaultReturn)
        * [func (f *EnqueuerGitserverClientResolveRevisionFunc) appendCall(r0 EnqueuerGitserverClientResolveRevisionFuncCall)](#EnqueuerGitserverClientResolveRevisionFunc.appendCall)
        * [func (f *EnqueuerGitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)](#EnqueuerGitserverClientResolveRevisionFunc.nextHook)
    * [type EnqueuerGitserverClientResolveRevisionFuncCall struct](#EnqueuerGitserverClientResolveRevisionFuncCall)
        * [func (c EnqueuerGitserverClientResolveRevisionFuncCall) Args() []interface{}](#EnqueuerGitserverClientResolveRevisionFuncCall.Args)
        * [func (c EnqueuerGitserverClientResolveRevisionFuncCall) Results() []interface{}](#EnqueuerGitserverClientResolveRevisionFuncCall.Results)
    * [type GitserverClient interface](#GitserverClient)
    * [type GitserverClientCommitExistsFunc struct](#GitserverClientCommitExistsFunc)
        * [func (f *GitserverClientCommitExistsFunc) History() []GitserverClientCommitExistsFuncCall](#GitserverClientCommitExistsFunc.History)
        * [func (f *GitserverClientCommitExistsFunc) PushHook(hook func(context.Context, int, string) (bool, error))](#GitserverClientCommitExistsFunc.PushHook)
        * [func (f *GitserverClientCommitExistsFunc) PushReturn(r0 bool, r1 error)](#GitserverClientCommitExistsFunc.PushReturn)
        * [func (f *GitserverClientCommitExistsFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))](#GitserverClientCommitExistsFunc.SetDefaultHook)
        * [func (f *GitserverClientCommitExistsFunc) SetDefaultReturn(r0 bool, r1 error)](#GitserverClientCommitExistsFunc.SetDefaultReturn)
        * [func (f *GitserverClientCommitExistsFunc) appendCall(r0 GitserverClientCommitExistsFuncCall)](#GitserverClientCommitExistsFunc.appendCall)
        * [func (f *GitserverClientCommitExistsFunc) nextHook() func(context.Context, int, string) (bool, error)](#GitserverClientCommitExistsFunc.nextHook)
    * [type GitserverClientCommitExistsFuncCall struct](#GitserverClientCommitExistsFuncCall)
        * [func (c GitserverClientCommitExistsFuncCall) Args() []interface{}](#GitserverClientCommitExistsFuncCall.Args)
        * [func (c GitserverClientCommitExistsFuncCall) Results() []interface{}](#GitserverClientCommitExistsFuncCall.Results)
    * [type GitserverClientCommitGraphFunc struct](#GitserverClientCommitGraphFunc)
        * [func (f *GitserverClientCommitGraphFunc) History() []GitserverClientCommitGraphFuncCall](#GitserverClientCommitGraphFunc.History)
        * [func (f *GitserverClientCommitGraphFunc) PushHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))](#GitserverClientCommitGraphFunc.PushHook)
        * [func (f *GitserverClientCommitGraphFunc) PushReturn(r0 *gitserver.CommitGraph, r1 error)](#GitserverClientCommitGraphFunc.PushReturn)
        * [func (f *GitserverClientCommitGraphFunc) SetDefaultHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))](#GitserverClientCommitGraphFunc.SetDefaultHook)
        * [func (f *GitserverClientCommitGraphFunc) SetDefaultReturn(r0 *gitserver.CommitGraph, r1 error)](#GitserverClientCommitGraphFunc.SetDefaultReturn)
        * [func (f *GitserverClientCommitGraphFunc) appendCall(r0 GitserverClientCommitGraphFuncCall)](#GitserverClientCommitGraphFunc.appendCall)
        * [func (f *GitserverClientCommitGraphFunc) nextHook() func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)](#GitserverClientCommitGraphFunc.nextHook)
    * [type GitserverClientCommitGraphFuncCall struct](#GitserverClientCommitGraphFuncCall)
        * [func (c GitserverClientCommitGraphFuncCall) Args() []interface{}](#GitserverClientCommitGraphFuncCall.Args)
        * [func (c GitserverClientCommitGraphFuncCall) Results() []interface{}](#GitserverClientCommitGraphFuncCall.Results)
    * [type HunkCache interface](#HunkCache)
        * [func NewHunkCache(size int) (HunkCache, error)](#NewHunkCache)
    * [type IndexEnqueuer interface](#IndexEnqueuer)
    * [type IndexEnqueuerForceQueueIndexesForRepositoryFunc struct](#IndexEnqueuerForceQueueIndexesForRepositoryFunc)
        * [func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) History() []IndexEnqueuerForceQueueIndexesForRepositoryFuncCall](#IndexEnqueuerForceQueueIndexesForRepositoryFunc.History)
        * [func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) PushHook(hook func(context.Context, int) error)](#IndexEnqueuerForceQueueIndexesForRepositoryFunc.PushHook)
        * [func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) PushReturn(r0 error)](#IndexEnqueuerForceQueueIndexesForRepositoryFunc.PushReturn)
        * [func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) SetDefaultHook(hook func(context.Context, int) error)](#IndexEnqueuerForceQueueIndexesForRepositoryFunc.SetDefaultHook)
        * [func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) SetDefaultReturn(r0 error)](#IndexEnqueuerForceQueueIndexesForRepositoryFunc.SetDefaultReturn)
        * [func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) appendCall(r0 IndexEnqueuerForceQueueIndexesForRepositoryFuncCall)](#IndexEnqueuerForceQueueIndexesForRepositoryFunc.appendCall)
        * [func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) nextHook() func(context.Context, int) error](#IndexEnqueuerForceQueueIndexesForRepositoryFunc.nextHook)
    * [type IndexEnqueuerForceQueueIndexesForRepositoryFuncCall struct](#IndexEnqueuerForceQueueIndexesForRepositoryFuncCall)
        * [func (c IndexEnqueuerForceQueueIndexesForRepositoryFuncCall) Args() []interface{}](#IndexEnqueuerForceQueueIndexesForRepositoryFuncCall.Args)
        * [func (c IndexEnqueuerForceQueueIndexesForRepositoryFuncCall) Results() []interface{}](#IndexEnqueuerForceQueueIndexesForRepositoryFuncCall.Results)
    * [type IndexEnqueuerInferIndexConfigurationFunc struct](#IndexEnqueuerInferIndexConfigurationFunc)
        * [func (f *IndexEnqueuerInferIndexConfigurationFunc) History() []IndexEnqueuerInferIndexConfigurationFuncCall](#IndexEnqueuerInferIndexConfigurationFunc.History)
        * [func (f *IndexEnqueuerInferIndexConfigurationFunc) PushHook(hook func(context.Context, int) (*config.IndexConfiguration, error))](#IndexEnqueuerInferIndexConfigurationFunc.PushHook)
        * [func (f *IndexEnqueuerInferIndexConfigurationFunc) PushReturn(r0 *config.IndexConfiguration, r1 error)](#IndexEnqueuerInferIndexConfigurationFunc.PushReturn)
        * [func (f *IndexEnqueuerInferIndexConfigurationFunc) SetDefaultHook(hook func(context.Context, int) (*config.IndexConfiguration, error))](#IndexEnqueuerInferIndexConfigurationFunc.SetDefaultHook)
        * [func (f *IndexEnqueuerInferIndexConfigurationFunc) SetDefaultReturn(r0 *config.IndexConfiguration, r1 error)](#IndexEnqueuerInferIndexConfigurationFunc.SetDefaultReturn)
        * [func (f *IndexEnqueuerInferIndexConfigurationFunc) appendCall(r0 IndexEnqueuerInferIndexConfigurationFuncCall)](#IndexEnqueuerInferIndexConfigurationFunc.appendCall)
        * [func (f *IndexEnqueuerInferIndexConfigurationFunc) nextHook() func(context.Context, int) (*config.IndexConfiguration, error)](#IndexEnqueuerInferIndexConfigurationFunc.nextHook)
    * [type IndexEnqueuerInferIndexConfigurationFuncCall struct](#IndexEnqueuerInferIndexConfigurationFuncCall)
        * [func (c IndexEnqueuerInferIndexConfigurationFuncCall) Args() []interface{}](#IndexEnqueuerInferIndexConfigurationFuncCall.Args)
        * [func (c IndexEnqueuerInferIndexConfigurationFuncCall) Results() []interface{}](#IndexEnqueuerInferIndexConfigurationFuncCall.Results)
    * [type IndexesResolver struct](#IndexesResolver)
        * [func NewIndexesResolver(dbStore DBStore, opts store.GetIndexesOptions) *IndexesResolver](#NewIndexesResolver)
        * [func (r *IndexesResolver) Resolve(ctx context.Context) error](#IndexesResolver.Resolve)
        * [func (r *IndexesResolver) resolve(ctx context.Context) error](#IndexesResolver.resolve)
    * [type LSIFStore interface](#LSIFStore)
    * [type LSIFStoreBulkMonikerResultsFunc struct](#LSIFStoreBulkMonikerResultsFunc)
        * [func (f *LSIFStoreBulkMonikerResultsFunc) History() []LSIFStoreBulkMonikerResultsFuncCall](#LSIFStoreBulkMonikerResultsFunc.History)
        * [func (f *LSIFStoreBulkMonikerResultsFunc) PushHook(hook func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error))](#LSIFStoreBulkMonikerResultsFunc.PushHook)
        * [func (f *LSIFStoreBulkMonikerResultsFunc) PushReturn(r0 []lsifstore.Location, r1 int, r2 error)](#LSIFStoreBulkMonikerResultsFunc.PushReturn)
        * [func (f *LSIFStoreBulkMonikerResultsFunc) SetDefaultHook(hook func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error))](#LSIFStoreBulkMonikerResultsFunc.SetDefaultHook)
        * [func (f *LSIFStoreBulkMonikerResultsFunc) SetDefaultReturn(r0 []lsifstore.Location, r1 int, r2 error)](#LSIFStoreBulkMonikerResultsFunc.SetDefaultReturn)
        * [func (f *LSIFStoreBulkMonikerResultsFunc) appendCall(r0 LSIFStoreBulkMonikerResultsFuncCall)](#LSIFStoreBulkMonikerResultsFunc.appendCall)
        * [func (f *LSIFStoreBulkMonikerResultsFunc) nextHook() func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error)](#LSIFStoreBulkMonikerResultsFunc.nextHook)
    * [type LSIFStoreBulkMonikerResultsFuncCall struct](#LSIFStoreBulkMonikerResultsFuncCall)
        * [func (c LSIFStoreBulkMonikerResultsFuncCall) Args() []interface{}](#LSIFStoreBulkMonikerResultsFuncCall.Args)
        * [func (c LSIFStoreBulkMonikerResultsFuncCall) Results() []interface{}](#LSIFStoreBulkMonikerResultsFuncCall.Results)
    * [type LSIFStoreDefinitionsFunc struct](#LSIFStoreDefinitionsFunc)
        * [func (f *LSIFStoreDefinitionsFunc) History() []LSIFStoreDefinitionsFuncCall](#LSIFStoreDefinitionsFunc.History)
        * [func (f *LSIFStoreDefinitionsFunc) PushHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))](#LSIFStoreDefinitionsFunc.PushHook)
        * [func (f *LSIFStoreDefinitionsFunc) PushReturn(r0 []lsifstore.Location, r1 int, r2 error)](#LSIFStoreDefinitionsFunc.PushReturn)
        * [func (f *LSIFStoreDefinitionsFunc) SetDefaultHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))](#LSIFStoreDefinitionsFunc.SetDefaultHook)
        * [func (f *LSIFStoreDefinitionsFunc) SetDefaultReturn(r0 []lsifstore.Location, r1 int, r2 error)](#LSIFStoreDefinitionsFunc.SetDefaultReturn)
        * [func (f *LSIFStoreDefinitionsFunc) appendCall(r0 LSIFStoreDefinitionsFuncCall)](#LSIFStoreDefinitionsFunc.appendCall)
        * [func (f *LSIFStoreDefinitionsFunc) nextHook() func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)](#LSIFStoreDefinitionsFunc.nextHook)
    * [type LSIFStoreDefinitionsFuncCall struct](#LSIFStoreDefinitionsFuncCall)
        * [func (c LSIFStoreDefinitionsFuncCall) Args() []interface{}](#LSIFStoreDefinitionsFuncCall.Args)
        * [func (c LSIFStoreDefinitionsFuncCall) Results() []interface{}](#LSIFStoreDefinitionsFuncCall.Results)
    * [type LSIFStoreDiagnosticsFunc struct](#LSIFStoreDiagnosticsFunc)
        * [func (f *LSIFStoreDiagnosticsFunc) History() []LSIFStoreDiagnosticsFuncCall](#LSIFStoreDiagnosticsFunc.History)
        * [func (f *LSIFStoreDiagnosticsFunc) PushHook(hook func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error))](#LSIFStoreDiagnosticsFunc.PushHook)
        * [func (f *LSIFStoreDiagnosticsFunc) PushReturn(r0 []lsifstore.Diagnostic, r1 int, r2 error)](#LSIFStoreDiagnosticsFunc.PushReturn)
        * [func (f *LSIFStoreDiagnosticsFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error))](#LSIFStoreDiagnosticsFunc.SetDefaultHook)
        * [func (f *LSIFStoreDiagnosticsFunc) SetDefaultReturn(r0 []lsifstore.Diagnostic, r1 int, r2 error)](#LSIFStoreDiagnosticsFunc.SetDefaultReturn)
        * [func (f *LSIFStoreDiagnosticsFunc) appendCall(r0 LSIFStoreDiagnosticsFuncCall)](#LSIFStoreDiagnosticsFunc.appendCall)
        * [func (f *LSIFStoreDiagnosticsFunc) nextHook() func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error)](#LSIFStoreDiagnosticsFunc.nextHook)
    * [type LSIFStoreDiagnosticsFuncCall struct](#LSIFStoreDiagnosticsFuncCall)
        * [func (c LSIFStoreDiagnosticsFuncCall) Args() []interface{}](#LSIFStoreDiagnosticsFuncCall.Args)
        * [func (c LSIFStoreDiagnosticsFuncCall) Results() []interface{}](#LSIFStoreDiagnosticsFuncCall.Results)
    * [type LSIFStoreDocumentationPageFunc struct](#LSIFStoreDocumentationPageFunc)
        * [func (f *LSIFStoreDocumentationPageFunc) History() []LSIFStoreDocumentationPageFuncCall](#LSIFStoreDocumentationPageFunc.History)
        * [func (f *LSIFStoreDocumentationPageFunc) PushHook(hook func(context.Context, int, string) (*semantic.DocumentationPageData, error))](#LSIFStoreDocumentationPageFunc.PushHook)
        * [func (f *LSIFStoreDocumentationPageFunc) PushReturn(r0 *semantic.DocumentationPageData, r1 error)](#LSIFStoreDocumentationPageFunc.PushReturn)
        * [func (f *LSIFStoreDocumentationPageFunc) SetDefaultHook(hook func(context.Context, int, string) (*semantic.DocumentationPageData, error))](#LSIFStoreDocumentationPageFunc.SetDefaultHook)
        * [func (f *LSIFStoreDocumentationPageFunc) SetDefaultReturn(r0 *semantic.DocumentationPageData, r1 error)](#LSIFStoreDocumentationPageFunc.SetDefaultReturn)
        * [func (f *LSIFStoreDocumentationPageFunc) appendCall(r0 LSIFStoreDocumentationPageFuncCall)](#LSIFStoreDocumentationPageFunc.appendCall)
        * [func (f *LSIFStoreDocumentationPageFunc) nextHook() func(context.Context, int, string) (*semantic.DocumentationPageData, error)](#LSIFStoreDocumentationPageFunc.nextHook)
    * [type LSIFStoreDocumentationPageFuncCall struct](#LSIFStoreDocumentationPageFuncCall)
        * [func (c LSIFStoreDocumentationPageFuncCall) Args() []interface{}](#LSIFStoreDocumentationPageFuncCall.Args)
        * [func (c LSIFStoreDocumentationPageFuncCall) Results() []interface{}](#LSIFStoreDocumentationPageFuncCall.Results)
    * [type LSIFStoreExistsFunc struct](#LSIFStoreExistsFunc)
        * [func (f *LSIFStoreExistsFunc) History() []LSIFStoreExistsFuncCall](#LSIFStoreExistsFunc.History)
        * [func (f *LSIFStoreExistsFunc) PushHook(hook func(context.Context, int, string) (bool, error))](#LSIFStoreExistsFunc.PushHook)
        * [func (f *LSIFStoreExistsFunc) PushReturn(r0 bool, r1 error)](#LSIFStoreExistsFunc.PushReturn)
        * [func (f *LSIFStoreExistsFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))](#LSIFStoreExistsFunc.SetDefaultHook)
        * [func (f *LSIFStoreExistsFunc) SetDefaultReturn(r0 bool, r1 error)](#LSIFStoreExistsFunc.SetDefaultReturn)
        * [func (f *LSIFStoreExistsFunc) appendCall(r0 LSIFStoreExistsFuncCall)](#LSIFStoreExistsFunc.appendCall)
        * [func (f *LSIFStoreExistsFunc) nextHook() func(context.Context, int, string) (bool, error)](#LSIFStoreExistsFunc.nextHook)
    * [type LSIFStoreExistsFuncCall struct](#LSIFStoreExistsFuncCall)
        * [func (c LSIFStoreExistsFuncCall) Args() []interface{}](#LSIFStoreExistsFuncCall.Args)
        * [func (c LSIFStoreExistsFuncCall) Results() []interface{}](#LSIFStoreExistsFuncCall.Results)
    * [type LSIFStoreHoverFunc struct](#LSIFStoreHoverFunc)
        * [func (f *LSIFStoreHoverFunc) History() []LSIFStoreHoverFuncCall](#LSIFStoreHoverFunc.History)
        * [func (f *LSIFStoreHoverFunc) PushHook(hook func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error))](#LSIFStoreHoverFunc.PushHook)
        * [func (f *LSIFStoreHoverFunc) PushReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)](#LSIFStoreHoverFunc.PushReturn)
        * [func (f *LSIFStoreHoverFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error))](#LSIFStoreHoverFunc.SetDefaultHook)
        * [func (f *LSIFStoreHoverFunc) SetDefaultReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)](#LSIFStoreHoverFunc.SetDefaultReturn)
        * [func (f *LSIFStoreHoverFunc) appendCall(r0 LSIFStoreHoverFuncCall)](#LSIFStoreHoverFunc.appendCall)
        * [func (f *LSIFStoreHoverFunc) nextHook() func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error)](#LSIFStoreHoverFunc.nextHook)
    * [type LSIFStoreHoverFuncCall struct](#LSIFStoreHoverFuncCall)
        * [func (c LSIFStoreHoverFuncCall) Args() []interface{}](#LSIFStoreHoverFuncCall.Args)
        * [func (c LSIFStoreHoverFuncCall) Results() []interface{}](#LSIFStoreHoverFuncCall.Results)
    * [type LSIFStoreMonikersByPositionFunc struct](#LSIFStoreMonikersByPositionFunc)
        * [func (f *LSIFStoreMonikersByPositionFunc) History() []LSIFStoreMonikersByPositionFuncCall](#LSIFStoreMonikersByPositionFunc.History)
        * [func (f *LSIFStoreMonikersByPositionFunc) PushHook(hook func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error))](#LSIFStoreMonikersByPositionFunc.PushHook)
        * [func (f *LSIFStoreMonikersByPositionFunc) PushReturn(r0 [][]semantic.MonikerData, r1 error)](#LSIFStoreMonikersByPositionFunc.PushReturn)
        * [func (f *LSIFStoreMonikersByPositionFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error))](#LSIFStoreMonikersByPositionFunc.SetDefaultHook)
        * [func (f *LSIFStoreMonikersByPositionFunc) SetDefaultReturn(r0 [][]semantic.MonikerData, r1 error)](#LSIFStoreMonikersByPositionFunc.SetDefaultReturn)
        * [func (f *LSIFStoreMonikersByPositionFunc) appendCall(r0 LSIFStoreMonikersByPositionFuncCall)](#LSIFStoreMonikersByPositionFunc.appendCall)
        * [func (f *LSIFStoreMonikersByPositionFunc) nextHook() func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error)](#LSIFStoreMonikersByPositionFunc.nextHook)
    * [type LSIFStoreMonikersByPositionFuncCall struct](#LSIFStoreMonikersByPositionFuncCall)
        * [func (c LSIFStoreMonikersByPositionFuncCall) Args() []interface{}](#LSIFStoreMonikersByPositionFuncCall.Args)
        * [func (c LSIFStoreMonikersByPositionFuncCall) Results() []interface{}](#LSIFStoreMonikersByPositionFuncCall.Results)
    * [type LSIFStorePackageInformationFunc struct](#LSIFStorePackageInformationFunc)
        * [func (f *LSIFStorePackageInformationFunc) History() []LSIFStorePackageInformationFuncCall](#LSIFStorePackageInformationFunc.History)
        * [func (f *LSIFStorePackageInformationFunc) PushHook(hook func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error))](#LSIFStorePackageInformationFunc.PushHook)
        * [func (f *LSIFStorePackageInformationFunc) PushReturn(r0 semantic.PackageInformationData, r1 bool, r2 error)](#LSIFStorePackageInformationFunc.PushReturn)
        * [func (f *LSIFStorePackageInformationFunc) SetDefaultHook(hook func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error))](#LSIFStorePackageInformationFunc.SetDefaultHook)
        * [func (f *LSIFStorePackageInformationFunc) SetDefaultReturn(r0 semantic.PackageInformationData, r1 bool, r2 error)](#LSIFStorePackageInformationFunc.SetDefaultReturn)
        * [func (f *LSIFStorePackageInformationFunc) appendCall(r0 LSIFStorePackageInformationFuncCall)](#LSIFStorePackageInformationFunc.appendCall)
        * [func (f *LSIFStorePackageInformationFunc) nextHook() func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error)](#LSIFStorePackageInformationFunc.nextHook)
    * [type LSIFStorePackageInformationFuncCall struct](#LSIFStorePackageInformationFuncCall)
        * [func (c LSIFStorePackageInformationFuncCall) Args() []interface{}](#LSIFStorePackageInformationFuncCall.Args)
        * [func (c LSIFStorePackageInformationFuncCall) Results() []interface{}](#LSIFStorePackageInformationFuncCall.Results)
    * [type LSIFStoreRangesFunc struct](#LSIFStoreRangesFunc)
        * [func (f *LSIFStoreRangesFunc) History() []LSIFStoreRangesFuncCall](#LSIFStoreRangesFunc.History)
        * [func (f *LSIFStoreRangesFunc) PushHook(hook func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error))](#LSIFStoreRangesFunc.PushHook)
        * [func (f *LSIFStoreRangesFunc) PushReturn(r0 []lsifstore.CodeIntelligenceRange, r1 error)](#LSIFStoreRangesFunc.PushReturn)
        * [func (f *LSIFStoreRangesFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error))](#LSIFStoreRangesFunc.SetDefaultHook)
        * [func (f *LSIFStoreRangesFunc) SetDefaultReturn(r0 []lsifstore.CodeIntelligenceRange, r1 error)](#LSIFStoreRangesFunc.SetDefaultReturn)
        * [func (f *LSIFStoreRangesFunc) appendCall(r0 LSIFStoreRangesFuncCall)](#LSIFStoreRangesFunc.appendCall)
        * [func (f *LSIFStoreRangesFunc) nextHook() func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error)](#LSIFStoreRangesFunc.nextHook)
    * [type LSIFStoreRangesFuncCall struct](#LSIFStoreRangesFuncCall)
        * [func (c LSIFStoreRangesFuncCall) Args() []interface{}](#LSIFStoreRangesFuncCall.Args)
        * [func (c LSIFStoreRangesFuncCall) Results() []interface{}](#LSIFStoreRangesFuncCall.Results)
    * [type LSIFStoreReferencesFunc struct](#LSIFStoreReferencesFunc)
        * [func (f *LSIFStoreReferencesFunc) History() []LSIFStoreReferencesFuncCall](#LSIFStoreReferencesFunc.History)
        * [func (f *LSIFStoreReferencesFunc) PushHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))](#LSIFStoreReferencesFunc.PushHook)
        * [func (f *LSIFStoreReferencesFunc) PushReturn(r0 []lsifstore.Location, r1 int, r2 error)](#LSIFStoreReferencesFunc.PushReturn)
        * [func (f *LSIFStoreReferencesFunc) SetDefaultHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))](#LSIFStoreReferencesFunc.SetDefaultHook)
        * [func (f *LSIFStoreReferencesFunc) SetDefaultReturn(r0 []lsifstore.Location, r1 int, r2 error)](#LSIFStoreReferencesFunc.SetDefaultReturn)
        * [func (f *LSIFStoreReferencesFunc) appendCall(r0 LSIFStoreReferencesFuncCall)](#LSIFStoreReferencesFunc.appendCall)
        * [func (f *LSIFStoreReferencesFunc) nextHook() func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)](#LSIFStoreReferencesFunc.nextHook)
    * [type LSIFStoreReferencesFuncCall struct](#LSIFStoreReferencesFuncCall)
        * [func (c LSIFStoreReferencesFuncCall) Args() []interface{}](#LSIFStoreReferencesFuncCall.Args)
        * [func (c LSIFStoreReferencesFuncCall) Results() []interface{}](#LSIFStoreReferencesFuncCall.Results)
    * [type MockDBStore struct](#MockDBStore)
        * [func NewMockDBStore() *MockDBStore](#NewMockDBStore)
        * [func NewMockDBStoreFrom(i DBStore) *MockDBStore](#NewMockDBStoreFrom)
        * [func (m *MockDBStore) CommitGraphMetadata(v0 context.Context, v1 int) (bool, *time.Time, error)](#MockDBStore.CommitGraphMetadata)
        * [func (m *MockDBStore) DefinitionDumps(v0 context.Context, v1 []semantic.QualifiedMonikerData) ([]dbstore.Dump, error)](#MockDBStore.DefinitionDumps)
        * [func (m *MockDBStore) DeleteIndexByID(v0 context.Context, v1 int) (bool, error)](#MockDBStore.DeleteIndexByID)
        * [func (m *MockDBStore) DeleteUploadByID(v0 context.Context, v1 int) (bool, error)](#MockDBStore.DeleteUploadByID)
        * [func (m *MockDBStore) FindClosestDumps(v0 context.Context, v1 int, v2 string, v3 string, v4 bool, v5 string) ([]dbstore.Dump, error)](#MockDBStore.FindClosestDumps)
        * [func (m *MockDBStore) FindClosestDumpsFromGraphFragment(v0 context.Context, v1 int, v2 string, v3 string, v4 bool, v5 string, v6 *gitserver.CommitGraph) ([]dbstore.Dump, error)](#MockDBStore.FindClosestDumpsFromGraphFragment)
        * [func (m *MockDBStore) GetDumpsByIDs(v0 context.Context, v1 []int) ([]dbstore.Dump, error)](#MockDBStore.GetDumpsByIDs)
        * [func (m *MockDBStore) GetIndexByID(v0 context.Context, v1 int) (dbstore.Index, bool, error)](#MockDBStore.GetIndexByID)
        * [func (m *MockDBStore) GetIndexConfigurationByRepositoryID(v0 context.Context, v1 int) (dbstore.IndexConfiguration, bool, error)](#MockDBStore.GetIndexConfigurationByRepositoryID)
        * [func (m *MockDBStore) GetIndexes(v0 context.Context, v1 dbstore.GetIndexesOptions) ([]dbstore.Index, int, error)](#MockDBStore.GetIndexes)
        * [func (m *MockDBStore) GetIndexesByIDs(v0 context.Context, v1 ...int) ([]dbstore.Index, error)](#MockDBStore.GetIndexesByIDs)
        * [func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)](#MockDBStore.GetUploadByID)
        * [func (m *MockDBStore) GetUploads(v0 context.Context, v1 dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)](#MockDBStore.GetUploads)
        * [func (m *MockDBStore) GetUploadsByIDs(v0 context.Context, v1 ...int) ([]dbstore.Upload, error)](#MockDBStore.GetUploadsByIDs)
        * [func (m *MockDBStore) HasCommit(v0 context.Context, v1 int, v2 string) (bool, error)](#MockDBStore.HasCommit)
        * [func (m *MockDBStore) HasRepository(v0 context.Context, v1 int) (bool, error)](#MockDBStore.HasRepository)
        * [func (m *MockDBStore) MarkRepositoryAsDirty(v0 context.Context, v1 int) error](#MockDBStore.MarkRepositoryAsDirty)
        * [func (m *MockDBStore) ReferenceIDsAndFilters(v0 context.Context, v1 int, v2 string, v3 []semantic.QualifiedMonikerData, v4 int, v5 int) (dbstore.PackageReferenceScanner, int, error)](#MockDBStore.ReferenceIDsAndFilters)
        * [func (m *MockDBStore) RepoName(v0 context.Context, v1 int) (string, error)](#MockDBStore.RepoName)
        * [func (m *MockDBStore) UpdateIndexConfigurationByRepositoryID(v0 context.Context, v1 int, v2 []byte) error](#MockDBStore.UpdateIndexConfigurationByRepositoryID)
    * [type MockEnqueuerDBStore struct](#MockEnqueuerDBStore)
        * [func NewMockEnqueuerDBStore() *MockEnqueuerDBStore](#NewMockEnqueuerDBStore)
        * [func NewMockEnqueuerDBStoreFrom(i EnqueuerDBStore) *MockEnqueuerDBStore](#NewMockEnqueuerDBStoreFrom)
        * [func (m *MockEnqueuerDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)](#MockEnqueuerDBStore.DirtyRepositories)
        * [func (m *MockEnqueuerDBStore) Done(v0 error) error](#MockEnqueuerDBStore.Done)
        * [func (m *MockEnqueuerDBStore) GetIndexConfigurationByRepositoryID(v0 context.Context, v1 int) (dbstore.IndexConfiguration, bool, error)](#MockEnqueuerDBStore.GetIndexConfigurationByRepositoryID)
        * [func (m *MockEnqueuerDBStore) GetRepositoriesWithIndexConfiguration(v0 context.Context) ([]int, error)](#MockEnqueuerDBStore.GetRepositoriesWithIndexConfiguration)
        * [func (m *MockEnqueuerDBStore) Handle() *basestore.TransactableHandle](#MockEnqueuerDBStore.Handle)
        * [func (m *MockEnqueuerDBStore) InsertIndex(v0 context.Context, v1 dbstore.Index) (int, error)](#MockEnqueuerDBStore.InsertIndex)
        * [func (m *MockEnqueuerDBStore) IsQueued(v0 context.Context, v1 int, v2 string) (bool, error)](#MockEnqueuerDBStore.IsQueued)
        * [func (m *MockEnqueuerDBStore) Transact(v0 context.Context) (enqueuer.DBStore, error)](#MockEnqueuerDBStore.Transact)
    * [type MockEnqueuerGitserverClient struct](#MockEnqueuerGitserverClient)
        * [func NewMockEnqueuerGitserverClient() *MockEnqueuerGitserverClient](#NewMockEnqueuerGitserverClient)
        * [func NewMockEnqueuerGitserverClientFrom(i EnqueuerGitserverClient) *MockEnqueuerGitserverClient](#NewMockEnqueuerGitserverClientFrom)
        * [func (m *MockEnqueuerGitserverClient) FileExists(v0 context.Context, v1 int, v2 string, v3 string) (bool, error)](#MockEnqueuerGitserverClient.FileExists)
        * [func (m *MockEnqueuerGitserverClient) Head(v0 context.Context, v1 int) (string, error)](#MockEnqueuerGitserverClient.Head)
        * [func (m *MockEnqueuerGitserverClient) ListFiles(v0 context.Context, v1 int, v2 string, v3 *regexp.Regexp) ([]string, error)](#MockEnqueuerGitserverClient.ListFiles)
        * [func (m *MockEnqueuerGitserverClient) RawContents(v0 context.Context, v1 int, v2 string, v3 string) ([]byte, error)](#MockEnqueuerGitserverClient.RawContents)
        * [func (m *MockEnqueuerGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)](#MockEnqueuerGitserverClient.ResolveRevision)
    * [type MockGitserverClient struct](#MockGitserverClient)
        * [func NewMockGitserverClient() *MockGitserverClient](#NewMockGitserverClient)
        * [func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient](#NewMockGitserverClientFrom)
        * [func (m *MockGitserverClient) CommitExists(v0 context.Context, v1 int, v2 string) (bool, error)](#MockGitserverClient.CommitExists)
        * [func (m *MockGitserverClient) CommitGraph(v0 context.Context, v1 int, v2 gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)](#MockGitserverClient.CommitGraph)
    * [type MockIndexEnqueuer struct](#MockIndexEnqueuer)
        * [func NewMockIndexEnqueuer() *MockIndexEnqueuer](#NewMockIndexEnqueuer)
        * [func NewMockIndexEnqueuerFrom(i IndexEnqueuer) *MockIndexEnqueuer](#NewMockIndexEnqueuerFrom)
        * [func (m *MockIndexEnqueuer) ForceQueueIndexesForRepository(v0 context.Context, v1 int) error](#MockIndexEnqueuer.ForceQueueIndexesForRepository)
        * [func (m *MockIndexEnqueuer) InferIndexConfiguration(v0 context.Context, v1 int) (*config.IndexConfiguration, error)](#MockIndexEnqueuer.InferIndexConfiguration)
    * [type MockLSIFStore struct](#MockLSIFStore)
        * [func NewMockLSIFStore() *MockLSIFStore](#NewMockLSIFStore)
        * [func NewMockLSIFStoreFrom(i LSIFStore) *MockLSIFStore](#NewMockLSIFStoreFrom)
        * [func (m *MockLSIFStore) BulkMonikerResults(v0 context.Context, v1 string, v2 []int, v3 []semantic.MonikerData, v4 int, v5 int) ([]lsifstore.Location, int, error)](#MockLSIFStore.BulkMonikerResults)
        * [func (m *MockLSIFStore) Definitions(v0 context.Context, v1 int, v2 string, v3 int, v4 int, v5 int, v6 int) ([]lsifstore.Location, int, error)](#MockLSIFStore.Definitions)
        * [func (m *MockLSIFStore) Diagnostics(v0 context.Context, v1 int, v2 string, v3 int, v4 int) ([]lsifstore.Diagnostic, int, error)](#MockLSIFStore.Diagnostics)
        * [func (m *MockLSIFStore) DocumentationPage(v0 context.Context, v1 int, v2 string) (*semantic.DocumentationPageData, error)](#MockLSIFStore.DocumentationPage)
        * [func (m *MockLSIFStore) Exists(v0 context.Context, v1 int, v2 string) (bool, error)](#MockLSIFStore.Exists)
        * [func (m *MockLSIFStore) Hover(v0 context.Context, v1 int, v2 string, v3 int, v4 int) (string, lsifstore.Range, bool, error)](#MockLSIFStore.Hover)
        * [func (m *MockLSIFStore) MonikersByPosition(v0 context.Context, v1 int, v2 string, v3 int, v4 int) ([][]semantic.MonikerData, error)](#MockLSIFStore.MonikersByPosition)
        * [func (m *MockLSIFStore) PackageInformation(v0 context.Context, v1 int, v2 string, v3 string) (semantic.PackageInformationData, bool, error)](#MockLSIFStore.PackageInformation)
        * [func (m *MockLSIFStore) Ranges(v0 context.Context, v1 int, v2 string, v3 int, v4 int) ([]lsifstore.CodeIntelligenceRange, error)](#MockLSIFStore.Ranges)
        * [func (m *MockLSIFStore) References(v0 context.Context, v1 int, v2 string, v3 int, v4 int, v5 int, v6 int) ([]lsifstore.Location, int, error)](#MockLSIFStore.References)
    * [type MockPositionAdjuster struct](#MockPositionAdjuster)
        * [func NewMockPositionAdjuster() *MockPositionAdjuster](#NewMockPositionAdjuster)
        * [func NewMockPositionAdjusterFrom(i PositionAdjuster) *MockPositionAdjuster](#NewMockPositionAdjusterFrom)
        * [func (m *MockPositionAdjuster) AdjustPath(v0 context.Context, v1 string, v2 string, v3 bool) (string, bool, error)](#MockPositionAdjuster.AdjustPath)
        * [func (m *MockPositionAdjuster) AdjustPosition(v0 context.Context, v1 string, v2 string, v3 lsifstore.Position, v4 bool) (string, lsifstore.Position, bool, error)](#MockPositionAdjuster.AdjustPosition)
        * [func (m *MockPositionAdjuster) AdjustRange(v0 context.Context, v1 string, v2 string, v3 lsifstore.Range, v4 bool) (string, lsifstore.Range, bool, error)](#MockPositionAdjuster.AdjustRange)
    * [type MockRepoUpdaterClient struct](#MockRepoUpdaterClient)
        * [func NewMockRepoUpdaterClient() *MockRepoUpdaterClient](#NewMockRepoUpdaterClient)
        * [func NewMockRepoUpdaterClientFrom(i RepoUpdaterClient) *MockRepoUpdaterClient](#NewMockRepoUpdaterClientFrom)
        * [func (m *MockRepoUpdaterClient) EnqueueRepoUpdate(v0 context.Context, v1 api.RepoName) (*protocol.RepoUpdateResponse, error)](#MockRepoUpdaterClient.EnqueueRepoUpdate)
    * [type PositionAdjuster interface](#PositionAdjuster)
        * [func NewPositionAdjuster(repo *types.Repo, commit string, hunkCache HunkCache) PositionAdjuster](#NewPositionAdjuster)
        * [func noopPositionAdjuster() PositionAdjuster](#noopPositionAdjuster)
    * [type PositionAdjusterAdjustPathFunc struct](#PositionAdjusterAdjustPathFunc)
        * [func (f *PositionAdjusterAdjustPathFunc) History() []PositionAdjusterAdjustPathFuncCall](#PositionAdjusterAdjustPathFunc.History)
        * [func (f *PositionAdjusterAdjustPathFunc) PushHook(hook func(context.Context, string, string, bool) (string, bool, error))](#PositionAdjusterAdjustPathFunc.PushHook)
        * [func (f *PositionAdjusterAdjustPathFunc) PushReturn(r0 string, r1 bool, r2 error)](#PositionAdjusterAdjustPathFunc.PushReturn)
        * [func (f *PositionAdjusterAdjustPathFunc) SetDefaultHook(hook func(context.Context, string, string, bool) (string, bool, error))](#PositionAdjusterAdjustPathFunc.SetDefaultHook)
        * [func (f *PositionAdjusterAdjustPathFunc) SetDefaultReturn(r0 string, r1 bool, r2 error)](#PositionAdjusterAdjustPathFunc.SetDefaultReturn)
        * [func (f *PositionAdjusterAdjustPathFunc) appendCall(r0 PositionAdjusterAdjustPathFuncCall)](#PositionAdjusterAdjustPathFunc.appendCall)
        * [func (f *PositionAdjusterAdjustPathFunc) nextHook() func(context.Context, string, string, bool) (string, bool, error)](#PositionAdjusterAdjustPathFunc.nextHook)
    * [type PositionAdjusterAdjustPathFuncCall struct](#PositionAdjusterAdjustPathFuncCall)
        * [func (c PositionAdjusterAdjustPathFuncCall) Args() []interface{}](#PositionAdjusterAdjustPathFuncCall.Args)
        * [func (c PositionAdjusterAdjustPathFuncCall) Results() []interface{}](#PositionAdjusterAdjustPathFuncCall.Results)
    * [type PositionAdjusterAdjustPositionFunc struct](#PositionAdjusterAdjustPositionFunc)
        * [func (f *PositionAdjusterAdjustPositionFunc) History() []PositionAdjusterAdjustPositionFuncCall](#PositionAdjusterAdjustPositionFunc.History)
        * [func (f *PositionAdjusterAdjustPositionFunc) PushHook(hook func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error))](#PositionAdjusterAdjustPositionFunc.PushHook)
        * [func (f *PositionAdjusterAdjustPositionFunc) PushReturn(r0 string, r1 lsifstore.Position, r2 bool, r3 error)](#PositionAdjusterAdjustPositionFunc.PushReturn)
        * [func (f *PositionAdjusterAdjustPositionFunc) SetDefaultHook(hook func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error))](#PositionAdjusterAdjustPositionFunc.SetDefaultHook)
        * [func (f *PositionAdjusterAdjustPositionFunc) SetDefaultReturn(r0 string, r1 lsifstore.Position, r2 bool, r3 error)](#PositionAdjusterAdjustPositionFunc.SetDefaultReturn)
        * [func (f *PositionAdjusterAdjustPositionFunc) appendCall(r0 PositionAdjusterAdjustPositionFuncCall)](#PositionAdjusterAdjustPositionFunc.appendCall)
        * [func (f *PositionAdjusterAdjustPositionFunc) nextHook() func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error)](#PositionAdjusterAdjustPositionFunc.nextHook)
    * [type PositionAdjusterAdjustPositionFuncCall struct](#PositionAdjusterAdjustPositionFuncCall)
        * [func (c PositionAdjusterAdjustPositionFuncCall) Args() []interface{}](#PositionAdjusterAdjustPositionFuncCall.Args)
        * [func (c PositionAdjusterAdjustPositionFuncCall) Results() []interface{}](#PositionAdjusterAdjustPositionFuncCall.Results)
    * [type PositionAdjusterAdjustRangeFunc struct](#PositionAdjusterAdjustRangeFunc)
        * [func (f *PositionAdjusterAdjustRangeFunc) History() []PositionAdjusterAdjustRangeFuncCall](#PositionAdjusterAdjustRangeFunc.History)
        * [func (f *PositionAdjusterAdjustRangeFunc) PushHook(hook func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error))](#PositionAdjusterAdjustRangeFunc.PushHook)
        * [func (f *PositionAdjusterAdjustRangeFunc) PushReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)](#PositionAdjusterAdjustRangeFunc.PushReturn)
        * [func (f *PositionAdjusterAdjustRangeFunc) SetDefaultHook(hook func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error))](#PositionAdjusterAdjustRangeFunc.SetDefaultHook)
        * [func (f *PositionAdjusterAdjustRangeFunc) SetDefaultReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)](#PositionAdjusterAdjustRangeFunc.SetDefaultReturn)
        * [func (f *PositionAdjusterAdjustRangeFunc) appendCall(r0 PositionAdjusterAdjustRangeFuncCall)](#PositionAdjusterAdjustRangeFunc.appendCall)
        * [func (f *PositionAdjusterAdjustRangeFunc) nextHook() func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error)](#PositionAdjusterAdjustRangeFunc.nextHook)
    * [type PositionAdjusterAdjustRangeFuncCall struct](#PositionAdjusterAdjustRangeFuncCall)
        * [func (c PositionAdjusterAdjustRangeFuncCall) Args() []interface{}](#PositionAdjusterAdjustRangeFuncCall.Args)
        * [func (c PositionAdjusterAdjustRangeFuncCall) Results() []interface{}](#PositionAdjusterAdjustRangeFuncCall.Results)
    * [type QueryResolver interface](#QueryResolver)
        * [func NewQueryResolver(dbStore DBStore,...](#NewQueryResolver)
    * [type RepoUpdaterClient enqueuer.RepoUpdaterClient](#RepoUpdaterClient)
    * [type RepoUpdaterClientEnqueueRepoUpdateFunc struct](#RepoUpdaterClientEnqueueRepoUpdateFunc)
        * [func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) History() []RepoUpdaterClientEnqueueRepoUpdateFuncCall](#RepoUpdaterClientEnqueueRepoUpdateFunc.History)
        * [func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))](#RepoUpdaterClientEnqueueRepoUpdateFunc.PushHook)
        * [func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushReturn(r0 *protocol.RepoUpdateResponse, r1 error)](#RepoUpdaterClientEnqueueRepoUpdateFunc.PushReturn)
        * [func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))](#RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultHook)
        * [func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultReturn(r0 *protocol.RepoUpdateResponse, r1 error)](#RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultReturn)
        * [func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) appendCall(r0 RepoUpdaterClientEnqueueRepoUpdateFuncCall)](#RepoUpdaterClientEnqueueRepoUpdateFunc.appendCall)
        * [func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) nextHook() func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error)](#RepoUpdaterClientEnqueueRepoUpdateFunc.nextHook)
    * [type RepoUpdaterClientEnqueueRepoUpdateFuncCall struct](#RepoUpdaterClientEnqueueRepoUpdateFuncCall)
        * [func (c RepoUpdaterClientEnqueueRepoUpdateFuncCall) Args() []interface{}](#RepoUpdaterClientEnqueueRepoUpdateFuncCall.Args)
        * [func (c RepoUpdaterClientEnqueueRepoUpdateFuncCall) Results() []interface{}](#RepoUpdaterClientEnqueueRepoUpdateFuncCall.Results)
    * [type Resolver interface](#Resolver)
        * [func NewResolver(dbStore DBStore,...](#NewResolver)
    * [type UploadsResolver struct](#UploadsResolver)
        * [func NewUploadsResolver(dbStore DBStore, opts store.GetUploadsOptions) *UploadsResolver](#NewUploadsResolver)
        * [func (r *UploadsResolver) Resolve(ctx context.Context) error](#UploadsResolver.Resolve)
        * [func (r *UploadsResolver) resolve(ctx context.Context) error](#UploadsResolver.resolve)
    * [type adjustPositionTestCase struct](#adjustPositionTestCase)
    * [type adjustedUpload struct](#adjustedUpload)
    * [type cachedCommitChecker struct](#cachedCommitChecker)
        * [func newCachedCommitChecker(gitserverClient GitserverClient) *cachedCommitChecker](#newCachedCommitChecker)
        * [func (c *cachedCommitChecker) exists(ctx context.Context, repositoryID int, commit string) (bool, error)](#cachedCommitChecker.exists)
        * [func (c *cachedCommitChecker) set(repositoryID int, commit string)](#cachedCommitChecker.set)
    * [type cursorAdjustedUpload struct](#cursorAdjustedUpload)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
    * [type positionAdjuster struct](#positionAdjuster)
        * [func (p *positionAdjuster) AdjustPath(ctx context.Context, commit, path string, reverse bool) (string, bool, error)](#positionAdjuster.AdjustPath)
        * [func (p *positionAdjuster) AdjustPosition(ctx context.Context, commit, path string, px lsifstore.Position, reverse bool) (string, lsifstore.Position, bool, error)](#positionAdjuster.AdjustPosition)
        * [func (p *positionAdjuster) AdjustRange(ctx context.Context, commit, path string, rx lsifstore.Range, reverse bool) (string, lsifstore.Range, bool, error)](#positionAdjuster.AdjustRange)
        * [func (p *positionAdjuster) readHunks(ctx context.Context, repo *types.Repo, sourceCommit, targetCommit, path string) ([]*diff.Hunk, error)](#positionAdjuster.readHunks)
        * [func (p *positionAdjuster) readHunksCached(ctx context.Context, repo *types.Repo, sourceCommit, targetCommit, path string, reverse bool) ([]*diff.Hunk, error)](#positionAdjuster.readHunksCached)
    * [type qualifiedMonikerSet struct](#qualifiedMonikerSet)
        * [func newQualifiedMonikerSet() *qualifiedMonikerSet](#newQualifiedMonikerSet)
        * [func (s *qualifiedMonikerSet) add(qualifiedMoniker semantic.QualifiedMonikerData)](#qualifiedMonikerSet.add)
    * [type queryResolver struct](#queryResolver)
        * [func newQueryResolver(dbStore DBStore,...](#newQueryResolver)
        * [func (r *queryResolver) Definitions(ctx context.Context, line, character int) (_ []AdjustedLocation, err error)](#queryResolver.Definitions)
        * [func (r *queryResolver) Diagnostics(ctx context.Context, limit int) (adjustedDiagnostics []AdjustedDiagnostic, _ int, err error)](#queryResolver.Diagnostics)
        * [func (r *queryResolver) DocumentationPage(ctx context.Context, pathID string) (_ *semantic.DocumentationPageData, err error)](#queryResolver.DocumentationPage)
        * [func (r *queryResolver) Hover(ctx context.Context, line, character int) (_ string, _ lsifstore.Range, _ bool, err error)](#queryResolver.Hover)
        * [func (r *queryResolver) Ranges(ctx context.Context, startLine, endLine int) (adjustedRanges []AdjustedCodeIntelligenceRange, err error)](#queryResolver.Ranges)
        * [func (r *queryResolver) References(ctx context.Context, line, character, limit int, rawCursor string) (_ []AdjustedLocation, _ string, err error)](#queryResolver.References)
        * [func (r *queryResolver) adjustCodeIntelligenceRange(ctx context.Context, upload adjustedUpload, rn lsifstore.CodeIntelligenceRange) (AdjustedCodeIntelligenceRange, bool, error)](#queryResolver.adjustCodeIntelligenceRange)
        * [func (r *queryResolver) adjustDiagnostic(ctx context.Context, adjustedUpload adjustedUpload, diagnostic lsifstore.Diagnostic) (AdjustedDiagnostic, error)](#queryResolver.adjustDiagnostic)
        * [func (r *queryResolver) adjustLocation(ctx context.Context, dump store.Dump, location lsifstore.Location) (AdjustedLocation, error)](#queryResolver.adjustLocation)
        * [func (r *queryResolver) adjustLocations(ctx context.Context, uploadsByID map[int]dbstore.Dump, locations []lsifstore.Location) ([]AdjustedLocation, error)](#queryResolver.adjustLocations)
        * [func (r *queryResolver) adjustRange(ctx context.Context, repositoryID int, commit, path string, rn lsifstore.Range) (string, lsifstore.Range, bool, error)](#queryResolver.adjustRange)
        * [func (r *queryResolver) adjustUpload(ctx context.Context, line, character int, upload store.Dump) (adjustedUpload, bool, error)](#queryResolver.adjustUpload)
        * [func (r *queryResolver) adjustUploadPaths(ctx context.Context) ([]adjustedUpload, error)](#queryResolver.adjustUploadPaths)
        * [func (r *queryResolver) adjustUploads(ctx context.Context, line, character int) ([]adjustedUpload, error)](#queryResolver.adjustUploads)
        * [func (r *queryResolver) adjustedUploadsFromCursor(ctx context.Context, line, character int, uploadsByID map[int]dbstore.Dump, cursor *referencesCursor) ([]adjustedUpload, error)](#queryResolver.adjustedUploadsFromCursor)
        * [func (r *queryResolver) definitionUploadIDsFromCursor(ctx context.Context, adjustedUploads []adjustedUpload, orderedMonikers []semantic.QualifiedMonikerData, cursor *referencesCursor) ([]int, []dbstore.Dump, error)](#queryResolver.definitionUploadIDsFromCursor)
        * [func (r *queryResolver) definitionUploads(ctx context.Context, orderedMonikers []semantic.QualifiedMonikerData) ([]store.Dump, error)](#queryResolver.definitionUploads)
        * [func (r *queryResolver) monikerLocations(ctx context.Context, uploads []dbstore.Dump, orderedMonikers []semantic.QualifiedMonikerData, tableName string, limit, offset int) ([]lsifstore.Location, int, error)](#queryResolver.monikerLocations)
        * [func (r *queryResolver) orderedMonikers(ctx context.Context, adjustedUploads []adjustedUpload, kind string) ([]semantic.QualifiedMonikerData, error)](#queryResolver.orderedMonikers)
        * [func (r *queryResolver) orderedMonikersFromCursor(ctx context.Context, adjustedUploads []adjustedUpload, cursor *referencesCursor) ([]semantic.QualifiedMonikerData, error)](#queryResolver.orderedMonikersFromCursor)
        * [func (r *queryResolver) pageLocalReferences(ctx context.Context, adjustedUploads []adjustedUpload, cursor *referencesCursor, limit int) ([]lsifstore.Location, bool, error)](#queryResolver.pageLocalReferences)
        * [func (r *queryResolver) pageReferences(ctx context.Context, adjustedUploads []adjustedUpload, orderedMonikers []semantic.QualifiedMonikerData, definitionUploadIDs []int, uploadsByID map[int]dbstore.Dump, cursor *referencesCursor, limit int) ([]lsifstore.Location, bool, error)](#queryResolver.pageReferences)
        * [func (r *queryResolver) pageRemoteReferences(ctx context.Context, adjustedUploads []adjustedUpload, orderedMonikers []semantic.QualifiedMonikerData, definitionUploadIDs []int, uploadsByID map[int]dbstore.Dump, cursor *referencesCursor, limit int) ([]lsifstore.Location, bool, error)](#queryResolver.pageRemoteReferences)
        * [func (r *queryResolver) uploadIDsWithReferences(ctx context.Context, orderedMonikers []semantic.QualifiedMonikerData, ignoreIDs []int, limit, offset int) (ids []int, recordsScanned int, totalCount int, err error)](#queryResolver.uploadIDsWithReferences)
        * [func (r *queryResolver) uploadsByIDs(ctx context.Context, ids []int, uploadsByIDs map[int]dbstore.Dump) ([]dbstore.Dump, error)](#queryResolver.uploadsByIDs)
    * [type referencesCursor struct](#referencesCursor)
        * [func decodeCursor(rawEncoded string) (referencesCursor, error)](#decodeCursor)
    * [type resolver struct](#resolver)
        * [func newResolver(dbStore DBStore,...](#newResolver)
        * [func (r *resolver) CommitGraph(ctx context.Context, repositoryID int) (gql.CodeIntelligenceCommitGraphResolver, error)](#resolver.CommitGraph)
        * [func (r *resolver) DeleteIndexByID(ctx context.Context, id int) error](#resolver.DeleteIndexByID)
        * [func (r *resolver) DeleteUploadByID(ctx context.Context, uploadID int) error](#resolver.DeleteUploadByID)
        * [func (r *resolver) GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)](#resolver.GetIndexByID)
        * [func (r *resolver) GetIndexesByIDs(ctx context.Context, ids ...int) ([]store.Index, error)](#resolver.GetIndexesByIDs)
        * [func (r *resolver) GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)](#resolver.GetUploadByID)
        * [func (r *resolver) GetUploadsByIDs(ctx context.Context, ids ...int) ([]store.Upload, error)](#resolver.GetUploadsByIDs)
        * [func (r *resolver) IndexConfiguration(ctx context.Context, repositoryID int) ([]byte, error)](#resolver.IndexConfiguration)
        * [func (r *resolver) IndexConnectionResolver(opts store.GetIndexesOptions) *IndexesResolver](#resolver.IndexConnectionResolver)
        * [func (r *resolver) QueryResolver(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (_ QueryResolver, err error)](#resolver.QueryResolver)
        * [func (r *resolver) QueueAutoIndexJobForRepo(ctx context.Context, repositoryID int) error](#resolver.QueueAutoIndexJobForRepo)
        * [func (r *resolver) UpdateIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int, configuration string) error](#resolver.UpdateIndexConfigurationByRepositoryID)
        * [func (r *resolver) UploadConnectionResolver(opts store.GetUploadsOptions) *UploadsResolver](#resolver.UploadConnectionResolver)
        * [func (r *resolver) findClosestDumps(ctx context.Context, cachedCommitChecker *cachedCommitChecker, repositoryID int, commit, path string, exactPath bool, indexer string) (_ []store.Dump, err error)](#resolver.findClosestDumps)
        * [func (r *resolver) inferClosestUploads(ctx context.Context, repositoryID int, commit, path string, exactPath bool, indexer string) ([]store.Dump, error)](#resolver.inferClosestUploads)
* [Functions](#func)
    * [func TestAdjustPath(t *testing.T)](#TestAdjustPath)
    * [func TestAdjustPosition(t *testing.T)](#TestAdjustPosition)
    * [func TestAdjustPositionEmptyDiff(t *testing.T)](#TestAdjustPositionEmptyDiff)
    * [func TestAdjustPositionReverse(t *testing.T)](#TestAdjustPositionReverse)
    * [func TestAdjustRange(t *testing.T)](#TestAdjustRange)
    * [func TestAdjustRangeEmptyDiff(t *testing.T)](#TestAdjustRangeEmptyDiff)
    * [func TestAdjustRangeReverse(t *testing.T)](#TestAdjustRangeReverse)
    * [func TestDefinitions(t *testing.T)](#TestDefinitions)
    * [func TestDefinitionsRemote(t *testing.T)](#TestDefinitionsRemote)
    * [func TestDiagnostics(t *testing.T)](#TestDiagnostics)
    * [func TestFallbackIndexConfiguration(t *testing.T)](#TestFallbackIndexConfiguration)
    * [func TestFindClosestDumps(t *testing.T)](#TestFindClosestDumps)
    * [func TestFindClosestDumpsDoesNotInferClosestUploadForUnknownRepository(t *testing.T)](#TestFindClosestDumpsDoesNotInferClosestUploadForUnknownRepository)
    * [func TestFindClosestDumpsInfersClosestUploads(t *testing.T)](#TestFindClosestDumpsInfersClosestUploads)
    * [func TestHover(t *testing.T)](#TestHover)
    * [func TestHoverRemote(t *testing.T)](#TestHoverRemote)
    * [func TestQueryResolver(t *testing.T)](#TestQueryResolver)
    * [func TestRanges(t *testing.T)](#TestRanges)
    * [func TestRawAdjustPosition(t *testing.T)](#TestRawAdjustPosition)
    * [func TestReferences(t *testing.T)](#TestReferences)
    * [func TestReferencesRemote(t *testing.T)](#TestReferencesRemote)
    * [func adjustLine(hunks []*diff.Hunk, line int) (int, bool)](#adjustLine)
    * [func adjustPosition(hunks []*diff.Hunk, pos lsifstore.Position) (lsifstore.Position, bool)](#adjustPosition)
    * [func adjustRange(hunks []*diff.Hunk, r lsifstore.Range) (lsifstore.Range, bool)](#adjustRange)
    * [func createHoneyEvent(ctx context.Context, name string, observationArgs observation.Args, err *error, duration time.Duration) *libhoney.Event](#createHoneyEvent)
    * [func encodeCursor(cursor referencesCursor) string](#encodeCursor)
    * [func filterUploadsWithCommits(ctx context.Context, cachedCommitChecker *cachedCommitChecker, uploads []dbstore.Dump) ([]dbstore.Dump, error)](#filterUploadsWithCommits)
    * [func findHunk(hunks []*diff.Hunk, line int) *diff.Hunk](#findHunk)
    * [func intsToString(ints []int) string](#intsToString)
    * [func isSourceLocation(adjustedUploads []adjustedUpload, location lsifstore.Location) bool](#isSourceLocation)
    * [func lowSlowRequest(name string, duration time.Duration, err *error, observationArgs observation.Args)](#lowSlowRequest)
    * [func makeKey(parts ...string) string](#makeKey)
    * [func monikersToString(vs []semantic.QualifiedMonikerData) string](#monikersToString)
    * [func nextOffset(offset, count, totalCount int) *int](#nextOffset)
    * [func observeResolver(ctx context.Context,...](#observeResolver)
    * [func rangeContainsPosition(r lsifstore.Range, pos lsifstore.Position) bool](#rangeContainsPosition)
    * [func testFilter(filter []byte, orderedMonikers []semantic.QualifiedMonikerData) (bool, error)](#testFilter)
    * [func uploadIDsToString(vs []dbstore.Dump) string](#uploadIDsToString)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="DefinitionsLimit" href="#DefinitionsLimit">const DefinitionsLimit</a>

```
searchKey: resolvers.DefinitionsLimit
tags: [constant number]
```

```Go
const DefinitionsLimit = 100
```

DefinitionsLimit is maximum the number of locations returned from Definitions. 

### <a id="expectedFallbackIndexConfiguration" href="#expectedFallbackIndexConfiguration">const expectedFallbackIndexConfiguration</a>

```
searchKey: resolvers.expectedFallbackIndexConfiguration
tags: [constant string private]
```

```Go
const expectedFallbackIndexConfiguration = ...
```

### <a id="hugoDiff" href="#hugoDiff">const hugoDiff</a>

```
searchKey: resolvers.hugoDiff
tags: [constant string private]
```

```Go
const hugoDiff = ...
```

hugoDiff is a diff from github.com/gohugoio/hugo generated via the following command. git diff 8947c3fa0beec021e14b3f8040857335e1ecd473 3e9db2ad951dbb1000cd0f8f25e4a95445046679 -- resources/image.go 

### <a id="maximumIndexesPerMonikerSearch" href="#maximumIndexesPerMonikerSearch">const maximumIndexesPerMonikerSearch</a>

```
searchKey: resolvers.maximumIndexesPerMonikerSearch
tags: [constant number private]
```

```Go
const maximumIndexesPerMonikerSearch = 50
```

maximumIndexesPerMonikerSearch configures the maximum number of reference upload identifiers that can be passed to a single moniker search query. 

### <a id="monikerLimit" href="#monikerLimit">const monikerLimit</a>

```
searchKey: resolvers.monikerLimit
tags: [constant number private]
```

```Go
const monikerLimit = 10
```

monikerLimit is the maximum number of monikers that can be returned from orderedMonikers. 

### <a id="numAncestors" href="#numAncestors">const numAncestors</a>

```
searchKey: resolvers.numAncestors
tags: [constant number private]
```

```Go
const numAncestors = 100
```

numAncestors is the number of ancestors to query from gitserver when trying to find the closest ancestor we have data for. Setting this value too low (relative to a repository's commit rate) will cause requests for an unknown commit return too few results; setting this value too high will raise the latency of requests for an unknown commit. 

TODO(efritz) - make adjustable via site configuration 

### <a id="prometheusDiff" href="#prometheusDiff">const prometheusDiff</a>

```
searchKey: resolvers.prometheusDiff
tags: [constant string private]
```

```Go
const prometheusDiff = ...
```

prometheusDiff is a diff from github.com/prometheus/prometheus generated via the following command. git diff 52025bd7a9446c3178bf01dd2949d4874dd45f24 45fbed94d6ee17840254e78cfc421ab1db78f734 -- discovery/manager.go 

### <a id="slowDefinitionsRequestThreshold" href="#slowDefinitionsRequestThreshold">const slowDefinitionsRequestThreshold</a>

```
searchKey: resolvers.slowDefinitionsRequestThreshold
tags: [constant number private]
```

```Go
const slowDefinitionsRequestThreshold = time.Second
```

### <a id="slowDiagnosticsRequestThreshold" href="#slowDiagnosticsRequestThreshold">const slowDiagnosticsRequestThreshold</a>

```
searchKey: resolvers.slowDiagnosticsRequestThreshold
tags: [constant number private]
```

```Go
const slowDiagnosticsRequestThreshold = time.Second
```

### <a id="slowDocumentationPageRequestThreshold" href="#slowDocumentationPageRequestThreshold">const slowDocumentationPageRequestThreshold</a>

```
searchKey: resolvers.slowDocumentationPageRequestThreshold
tags: [constant number private]
```

```Go
const slowDocumentationPageRequestThreshold = time.Second
```

### <a id="slowHoverRequestThreshold" href="#slowHoverRequestThreshold">const slowHoverRequestThreshold</a>

```
searchKey: resolvers.slowHoverRequestThreshold
tags: [constant number private]
```

```Go
const slowHoverRequestThreshold = time.Second
```

### <a id="slowQueryResolverRequestThreshold" href="#slowQueryResolverRequestThreshold">const slowQueryResolverRequestThreshold</a>

```
searchKey: resolvers.slowQueryResolverRequestThreshold
tags: [constant number private]
```

```Go
const slowQueryResolverRequestThreshold = time.Second
```

### <a id="slowRangesRequestThreshold" href="#slowRangesRequestThreshold">const slowRangesRequestThreshold</a>

```
searchKey: resolvers.slowRangesRequestThreshold
tags: [constant number private]
```

```Go
const slowRangesRequestThreshold = time.Second
```

### <a id="slowReferencesRequestThreshold" href="#slowReferencesRequestThreshold">const slowReferencesRequestThreshold</a>

```
searchKey: resolvers.slowReferencesRequestThreshold
tags: [constant number private]
```

```Go
const slowReferencesRequestThreshold = time.Second
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrConcurrentModification" href="#ErrConcurrentModification">var ErrConcurrentModification</a>

```
searchKey: resolvers.ErrConcurrentModification
tags: [variable interface]
```

```Go
var ErrConcurrentModification = errors.New("result set changed while paginating")
```

ErrConcurrentModification occurs when a page of a references request cannot be resolved as the set of visible uploads have changed since the previous request for the same result set. 

### <a id="hugoTestCases" href="#hugoTestCases">var hugoTestCases</a>

```
searchKey: resolvers.hugoTestCases
tags: [variable array struct private]
```

```Go
var hugoTestCases = ...
```

### <a id="prometheusTestCases" href="#prometheusTestCases">var prometheusTestCases</a>

```
searchKey: resolvers.prometheusTestCases
tags: [variable array struct private]
```

```Go
var prometheusTestCases = ...
```

### <a id="testRange1" href="#testRange1">var testRange1</a>

```
searchKey: resolvers.testRange1
tags: [variable struct private]
```

```Go
var testRange1 = ...
```

### <a id="testRange2" href="#testRange2">var testRange2</a>

```
searchKey: resolvers.testRange2
tags: [variable struct private]
```

```Go
var testRange2 = ...
```

### <a id="testRange3" href="#testRange3">var testRange3</a>

```
searchKey: resolvers.testRange3
tags: [variable struct private]
```

```Go
var testRange3 = ...
```

### <a id="testRange4" href="#testRange4">var testRange4</a>

```
searchKey: resolvers.testRange4
tags: [variable struct private]
```

```Go
var testRange4 = ...
```

### <a id="testRange5" href="#testRange5">var testRange5</a>

```
searchKey: resolvers.testRange5
tags: [variable struct private]
```

```Go
var testRange5 = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="AdjustedCodeIntelligenceRange" href="#AdjustedCodeIntelligenceRange">type AdjustedCodeIntelligenceRange struct</a>

```
searchKey: resolvers.AdjustedCodeIntelligenceRange
tags: [struct]
```

```Go
type AdjustedCodeIntelligenceRange struct {
	Range       lsifstore.Range
	Definitions []AdjustedLocation
	References  []AdjustedLocation
	HoverText   string
}
```

AdjustedCodeIntelligenceRange stores definition, reference, and hover information for all ranges within a block of lines. The definition and reference locations have been adjusted to fit the target (originally requested) commit. 

### <a id="AdjustedDiagnostic" href="#AdjustedDiagnostic">type AdjustedDiagnostic struct</a>

```
searchKey: resolvers.AdjustedDiagnostic
tags: [struct]
```

```Go
type AdjustedDiagnostic struct {
	lsifstore.Diagnostic
	Dump           store.Dump
	AdjustedCommit string
	AdjustedRange  lsifstore.Range
}
```

AdjustedDiagnostic is a diagnostic from within a particular upload. The adjusted commit denotes the target commit for which the location was adjusted (the originally requested commit). 

### <a id="AdjustedLocation" href="#AdjustedLocation">type AdjustedLocation struct</a>

```
searchKey: resolvers.AdjustedLocation
tags: [struct]
```

```Go
type AdjustedLocation struct {
	Dump           store.Dump
	Path           string
	AdjustedCommit string
	AdjustedRange  lsifstore.Range
}
```

AdjustedLocation is a path and range pair from within a particular upload. The adjusted commit denotes the target commit for which the location was adjusted (the originally requested commit). 

### <a id="CommitGraphResolver" href="#CommitGraphResolver">type CommitGraphResolver struct</a>

```
searchKey: resolvers.CommitGraphResolver
tags: [struct]
```

```Go
type CommitGraphResolver struct {
	stale     bool
	updatedAt *time.Time
}
```

#### <a id="NewCommitGraphResolver" href="#NewCommitGraphResolver">func NewCommitGraphResolver(stale bool, updatedAt *time.Time) *CommitGraphResolver</a>

```
searchKey: resolvers.NewCommitGraphResolver
tags: [function]
```

```Go
func NewCommitGraphResolver(stale bool, updatedAt *time.Time) *CommitGraphResolver
```

#### <a id="CommitGraphResolver.Stale" href="#CommitGraphResolver.Stale">func (r *CommitGraphResolver) Stale(ctx context.Context) (bool, error)</a>

```
searchKey: resolvers.CommitGraphResolver.Stale
tags: [method]
```

```Go
func (r *CommitGraphResolver) Stale(ctx context.Context) (bool, error)
```

#### <a id="CommitGraphResolver.UpdatedAt" href="#CommitGraphResolver.UpdatedAt">func (r *CommitGraphResolver) UpdatedAt(ctx context.Context) (*graphqlbackend.DateTime, error)</a>

```
searchKey: resolvers.CommitGraphResolver.UpdatedAt
tags: [method]
```

```Go
func (r *CommitGraphResolver) UpdatedAt(ctx context.Context) (*graphqlbackend.DateTime, error)
```

### <a id="DBStore" href="#DBStore">type DBStore interface</a>

```
searchKey: resolvers.DBStore
tags: [interface]
```

```Go
type DBStore interface {
	gitserver.DBStore

	GetUploadByID(ctx context.Context, id int) (dbstore.Upload, bool, error)
	GetUploadsByIDs(ctx context.Context, ids ...int) ([]dbstore.Upload, error)
	GetUploads(ctx context.Context, opts dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
	DeleteUploadByID(ctx context.Context, id int) (bool, error)
	GetDumpsByIDs(ctx context.Context, ids []int) ([]dbstore.Dump, error)
	FindClosestDumps(ctx context.Context, repositoryID int, commit, path string, rootMustEnclosePath bool, indexer string) ([]dbstore.Dump, error)
	FindClosestDumpsFromGraphFragment(ctx context.Context, repositoryID int, commit, path string, rootMustEnclosePath bool, indexer string, graph *gitserver.CommitGraph) ([]dbstore.Dump, error)
	DefinitionDumps(ctx context.Context, monikers []semantic.QualifiedMonikerData) (_ []dbstore.Dump, err error)
	ReferenceIDsAndFilters(ctx context.Context, repositoryID int, commit string, monikers []semantic.QualifiedMonikerData, limit, offset int) (_ dbstore.PackageReferenceScanner, _ int, err error)
	HasRepository(ctx context.Context, repositoryID int) (bool, error)
	HasCommit(ctx context.Context, repositoryID int, commit string) (bool, error)
	MarkRepositoryAsDirty(ctx context.Context, repositoryID int) error
	CommitGraphMetadata(ctx context.Context, repositoryID int) (stale bool, updatedAt *time.Time, _ error)
	GetIndexByID(ctx context.Context, id int) (dbstore.Index, bool, error)
	GetIndexesByIDs(ctx context.Context, ids ...int) ([]dbstore.Index, error)
	GetIndexes(ctx context.Context, opts dbstore.GetIndexesOptions) ([]dbstore.Index, int, error)
	DeleteIndexByID(ctx context.Context, id int) (bool, error)
	GetIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int) (store.IndexConfiguration, bool, error)
	UpdateIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int, data []byte) error
}
```

### <a id="DBStoreCommitGraphMetadataFunc" href="#DBStoreCommitGraphMetadataFunc">type DBStoreCommitGraphMetadataFunc struct</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFunc
tags: [struct private]
```

```Go
type DBStoreCommitGraphMetadataFunc struct {
	defaultHook func(context.Context, int) (bool, *time.Time, error)
	hooks       []func(context.Context, int) (bool, *time.Time, error)
	history     []DBStoreCommitGraphMetadataFuncCall
	mutex       sync.Mutex
}
```

DBStoreCommitGraphMetadataFunc describes the behavior when the CommitGraphMetadata method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreCommitGraphMetadataFunc.History" href="#DBStoreCommitGraphMetadataFunc.History">func (f *DBStoreCommitGraphMetadataFunc) History() []DBStoreCommitGraphMetadataFuncCall</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFunc.History
tags: [method private]
```

```Go
func (f *DBStoreCommitGraphMetadataFunc) History() []DBStoreCommitGraphMetadataFuncCall
```

History returns a sequence of DBStoreCommitGraphMetadataFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreCommitGraphMetadataFunc.PushHook" href="#DBStoreCommitGraphMetadataFunc.PushHook">func (f *DBStoreCommitGraphMetadataFunc) PushHook(hook func(context.Context, int) (bool, *time.Time, error))</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreCommitGraphMetadataFunc) PushHook(hook func(context.Context, int) (bool, *time.Time, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CommitGraphMetadata method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreCommitGraphMetadataFunc.PushReturn" href="#DBStoreCommitGraphMetadataFunc.PushReturn">func (f *DBStoreCommitGraphMetadataFunc) PushReturn(r0 bool, r1 *time.Time, r2 error)</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreCommitGraphMetadataFunc) PushReturn(r0 bool, r1 *time.Time, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreCommitGraphMetadataFunc.SetDefaultHook" href="#DBStoreCommitGraphMetadataFunc.SetDefaultHook">func (f *DBStoreCommitGraphMetadataFunc) SetDefaultHook(hook func(context.Context, int) (bool, *time.Time, error))</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreCommitGraphMetadataFunc) SetDefaultHook(hook func(context.Context, int) (bool, *time.Time, error))
```

SetDefaultHook sets function that is called when the CommitGraphMetadata method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreCommitGraphMetadataFunc.SetDefaultReturn" href="#DBStoreCommitGraphMetadataFunc.SetDefaultReturn">func (f *DBStoreCommitGraphMetadataFunc) SetDefaultReturn(r0 bool, r1 *time.Time, r2 error)</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreCommitGraphMetadataFunc) SetDefaultReturn(r0 bool, r1 *time.Time, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreCommitGraphMetadataFunc.appendCall" href="#DBStoreCommitGraphMetadataFunc.appendCall">func (f *DBStoreCommitGraphMetadataFunc) appendCall(r0 DBStoreCommitGraphMetadataFuncCall)</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreCommitGraphMetadataFunc) appendCall(r0 DBStoreCommitGraphMetadataFuncCall)
```

#### <a id="DBStoreCommitGraphMetadataFunc.nextHook" href="#DBStoreCommitGraphMetadataFunc.nextHook">func (f *DBStoreCommitGraphMetadataFunc) nextHook() func(context.Context, int) (bool, *time.Time, error)</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreCommitGraphMetadataFunc) nextHook() func(context.Context, int) (bool, *time.Time, error)
```

### <a id="DBStoreCommitGraphMetadataFuncCall" href="#DBStoreCommitGraphMetadataFuncCall">type DBStoreCommitGraphMetadataFuncCall struct</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFuncCall
tags: [struct private]
```

```Go
type DBStoreCommitGraphMetadataFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 *time.Time
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreCommitGraphMetadataFuncCall is an object that describes an invocation of method CommitGraphMetadata on an instance of MockDBStore. 

#### <a id="DBStoreCommitGraphMetadataFuncCall.Args" href="#DBStoreCommitGraphMetadataFuncCall.Args">func (c DBStoreCommitGraphMetadataFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreCommitGraphMetadataFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreCommitGraphMetadataFuncCall.Results" href="#DBStoreCommitGraphMetadataFuncCall.Results">func (c DBStoreCommitGraphMetadataFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreCommitGraphMetadataFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreCommitGraphMetadataFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDefinitionDumpsFunc" href="#DBStoreDefinitionDumpsFunc">type DBStoreDefinitionDumpsFunc struct</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFunc
tags: [struct private]
```

```Go
type DBStoreDefinitionDumpsFunc struct {
	defaultHook func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error)
	hooks       []func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error)
	history     []DBStoreDefinitionDumpsFuncCall
	mutex       sync.Mutex
}
```

DBStoreDefinitionDumpsFunc describes the behavior when the DefinitionDumps method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDefinitionDumpsFunc.History" href="#DBStoreDefinitionDumpsFunc.History">func (f *DBStoreDefinitionDumpsFunc) History() []DBStoreDefinitionDumpsFuncCall</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFunc.History
tags: [method private]
```

```Go
func (f *DBStoreDefinitionDumpsFunc) History() []DBStoreDefinitionDumpsFuncCall
```

History returns a sequence of DBStoreDefinitionDumpsFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreDefinitionDumpsFunc.PushHook" href="#DBStoreDefinitionDumpsFunc.PushHook">func (f *DBStoreDefinitionDumpsFunc) PushHook(hook func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error))</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreDefinitionDumpsFunc) PushHook(hook func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DefinitionDumps method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDefinitionDumpsFunc.PushReturn" href="#DBStoreDefinitionDumpsFunc.PushReturn">func (f *DBStoreDefinitionDumpsFunc) PushReturn(r0 []dbstore.Dump, r1 error)</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreDefinitionDumpsFunc) PushReturn(r0 []dbstore.Dump, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDefinitionDumpsFunc.SetDefaultHook" href="#DBStoreDefinitionDumpsFunc.SetDefaultHook">func (f *DBStoreDefinitionDumpsFunc) SetDefaultHook(hook func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error))</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreDefinitionDumpsFunc) SetDefaultHook(hook func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error))
```

SetDefaultHook sets function that is called when the DefinitionDumps method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDefinitionDumpsFunc.SetDefaultReturn" href="#DBStoreDefinitionDumpsFunc.SetDefaultReturn">func (f *DBStoreDefinitionDumpsFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreDefinitionDumpsFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDefinitionDumpsFunc.appendCall" href="#DBStoreDefinitionDumpsFunc.appendCall">func (f *DBStoreDefinitionDumpsFunc) appendCall(r0 DBStoreDefinitionDumpsFuncCall)</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreDefinitionDumpsFunc) appendCall(r0 DBStoreDefinitionDumpsFuncCall)
```

#### <a id="DBStoreDefinitionDumpsFunc.nextHook" href="#DBStoreDefinitionDumpsFunc.nextHook">func (f *DBStoreDefinitionDumpsFunc) nextHook() func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreDefinitionDumpsFunc) nextHook() func(context.Context, []semantic.QualifiedMonikerData) ([]dbstore.Dump, error)
```

### <a id="DBStoreDefinitionDumpsFuncCall" href="#DBStoreDefinitionDumpsFuncCall">type DBStoreDefinitionDumpsFuncCall struct</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFuncCall
tags: [struct private]
```

```Go
type DBStoreDefinitionDumpsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []semantic.QualifiedMonikerData
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []dbstore.Dump
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreDefinitionDumpsFuncCall is an object that describes an invocation of method DefinitionDumps on an instance of MockDBStore. 

#### <a id="DBStoreDefinitionDumpsFuncCall.Args" href="#DBStoreDefinitionDumpsFuncCall.Args">func (c DBStoreDefinitionDumpsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreDefinitionDumpsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDefinitionDumpsFuncCall.Results" href="#DBStoreDefinitionDumpsFuncCall.Results">func (c DBStoreDefinitionDumpsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreDefinitionDumpsFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreDefinitionDumpsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDeleteIndexByIDFunc" href="#DBStoreDeleteIndexByIDFunc">type DBStoreDeleteIndexByIDFunc struct</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFunc
tags: [struct private]
```

```Go
type DBStoreDeleteIndexByIDFunc struct {
	defaultHook func(context.Context, int) (bool, error)
	hooks       []func(context.Context, int) (bool, error)
	history     []DBStoreDeleteIndexByIDFuncCall
	mutex       sync.Mutex
}
```

DBStoreDeleteIndexByIDFunc describes the behavior when the DeleteIndexByID method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDeleteIndexByIDFunc.History" href="#DBStoreDeleteIndexByIDFunc.History">func (f *DBStoreDeleteIndexByIDFunc) History() []DBStoreDeleteIndexByIDFuncCall</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFunc.History
tags: [method private]
```

```Go
func (f *DBStoreDeleteIndexByIDFunc) History() []DBStoreDeleteIndexByIDFuncCall
```

History returns a sequence of DBStoreDeleteIndexByIDFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreDeleteIndexByIDFunc.PushHook" href="#DBStoreDeleteIndexByIDFunc.PushHook">func (f *DBStoreDeleteIndexByIDFunc) PushHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreDeleteIndexByIDFunc) PushHook(hook func(context.Context, int) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteIndexByID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDeleteIndexByIDFunc.PushReturn" href="#DBStoreDeleteIndexByIDFunc.PushReturn">func (f *DBStoreDeleteIndexByIDFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreDeleteIndexByIDFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteIndexByIDFunc.SetDefaultHook" href="#DBStoreDeleteIndexByIDFunc.SetDefaultHook">func (f *DBStoreDeleteIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreDeleteIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))
```

SetDefaultHook sets function that is called when the DeleteIndexByID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDeleteIndexByIDFunc.SetDefaultReturn" href="#DBStoreDeleteIndexByIDFunc.SetDefaultReturn">func (f *DBStoreDeleteIndexByIDFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreDeleteIndexByIDFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteIndexByIDFunc.appendCall" href="#DBStoreDeleteIndexByIDFunc.appendCall">func (f *DBStoreDeleteIndexByIDFunc) appendCall(r0 DBStoreDeleteIndexByIDFuncCall)</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreDeleteIndexByIDFunc) appendCall(r0 DBStoreDeleteIndexByIDFuncCall)
```

#### <a id="DBStoreDeleteIndexByIDFunc.nextHook" href="#DBStoreDeleteIndexByIDFunc.nextHook">func (f *DBStoreDeleteIndexByIDFunc) nextHook() func(context.Context, int) (bool, error)</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreDeleteIndexByIDFunc) nextHook() func(context.Context, int) (bool, error)
```

### <a id="DBStoreDeleteIndexByIDFuncCall" href="#DBStoreDeleteIndexByIDFuncCall">type DBStoreDeleteIndexByIDFuncCall struct</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFuncCall
tags: [struct private]
```

```Go
type DBStoreDeleteIndexByIDFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreDeleteIndexByIDFuncCall is an object that describes an invocation of method DeleteIndexByID on an instance of MockDBStore. 

#### <a id="DBStoreDeleteIndexByIDFuncCall.Args" href="#DBStoreDeleteIndexByIDFuncCall.Args">func (c DBStoreDeleteIndexByIDFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreDeleteIndexByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDeleteIndexByIDFuncCall.Results" href="#DBStoreDeleteIndexByIDFuncCall.Results">func (c DBStoreDeleteIndexByIDFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreDeleteIndexByIDFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreDeleteIndexByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDeleteUploadByIDFunc" href="#DBStoreDeleteUploadByIDFunc">type DBStoreDeleteUploadByIDFunc struct</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFunc
tags: [struct private]
```

```Go
type DBStoreDeleteUploadByIDFunc struct {
	defaultHook func(context.Context, int) (bool, error)
	hooks       []func(context.Context, int) (bool, error)
	history     []DBStoreDeleteUploadByIDFuncCall
	mutex       sync.Mutex
}
```

DBStoreDeleteUploadByIDFunc describes the behavior when the DeleteUploadByID method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDeleteUploadByIDFunc.History" href="#DBStoreDeleteUploadByIDFunc.History">func (f *DBStoreDeleteUploadByIDFunc) History() []DBStoreDeleteUploadByIDFuncCall</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFunc.History
tags: [method private]
```

```Go
func (f *DBStoreDeleteUploadByIDFunc) History() []DBStoreDeleteUploadByIDFuncCall
```

History returns a sequence of DBStoreDeleteUploadByIDFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreDeleteUploadByIDFunc.PushHook" href="#DBStoreDeleteUploadByIDFunc.PushHook">func (f *DBStoreDeleteUploadByIDFunc) PushHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreDeleteUploadByIDFunc) PushHook(hook func(context.Context, int) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteUploadByID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDeleteUploadByIDFunc.PushReturn" href="#DBStoreDeleteUploadByIDFunc.PushReturn">func (f *DBStoreDeleteUploadByIDFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreDeleteUploadByIDFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteUploadByIDFunc.SetDefaultHook" href="#DBStoreDeleteUploadByIDFunc.SetDefaultHook">func (f *DBStoreDeleteUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreDeleteUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))
```

SetDefaultHook sets function that is called when the DeleteUploadByID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDeleteUploadByIDFunc.SetDefaultReturn" href="#DBStoreDeleteUploadByIDFunc.SetDefaultReturn">func (f *DBStoreDeleteUploadByIDFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreDeleteUploadByIDFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteUploadByIDFunc.appendCall" href="#DBStoreDeleteUploadByIDFunc.appendCall">func (f *DBStoreDeleteUploadByIDFunc) appendCall(r0 DBStoreDeleteUploadByIDFuncCall)</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreDeleteUploadByIDFunc) appendCall(r0 DBStoreDeleteUploadByIDFuncCall)
```

#### <a id="DBStoreDeleteUploadByIDFunc.nextHook" href="#DBStoreDeleteUploadByIDFunc.nextHook">func (f *DBStoreDeleteUploadByIDFunc) nextHook() func(context.Context, int) (bool, error)</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreDeleteUploadByIDFunc) nextHook() func(context.Context, int) (bool, error)
```

### <a id="DBStoreDeleteUploadByIDFuncCall" href="#DBStoreDeleteUploadByIDFuncCall">type DBStoreDeleteUploadByIDFuncCall struct</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFuncCall
tags: [struct private]
```

```Go
type DBStoreDeleteUploadByIDFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreDeleteUploadByIDFuncCall is an object that describes an invocation of method DeleteUploadByID on an instance of MockDBStore. 

#### <a id="DBStoreDeleteUploadByIDFuncCall.Args" href="#DBStoreDeleteUploadByIDFuncCall.Args">func (c DBStoreDeleteUploadByIDFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreDeleteUploadByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDeleteUploadByIDFuncCall.Results" href="#DBStoreDeleteUploadByIDFuncCall.Results">func (c DBStoreDeleteUploadByIDFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreDeleteUploadByIDFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreDeleteUploadByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreFindClosestDumpsFromGraphFragmentFunc" href="#DBStoreFindClosestDumpsFromGraphFragmentFunc">type DBStoreFindClosestDumpsFromGraphFragmentFunc struct</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFunc
tags: [struct private]
```

```Go
type DBStoreFindClosestDumpsFromGraphFragmentFunc struct {
	defaultHook func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error)
	hooks       []func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error)
	history     []DBStoreFindClosestDumpsFromGraphFragmentFuncCall
	mutex       sync.Mutex
}
```

DBStoreFindClosestDumpsFromGraphFragmentFunc describes the behavior when the FindClosestDumpsFromGraphFragment method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreFindClosestDumpsFromGraphFragmentFunc.History" href="#DBStoreFindClosestDumpsFromGraphFragmentFunc.History">func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) History() []DBStoreFindClosestDumpsFromGraphFragmentFuncCall</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFunc.History
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) History() []DBStoreFindClosestDumpsFromGraphFragmentFuncCall
```

History returns a sequence of DBStoreFindClosestDumpsFromGraphFragmentFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreFindClosestDumpsFromGraphFragmentFunc.PushHook" href="#DBStoreFindClosestDumpsFromGraphFragmentFunc.PushHook">func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) PushHook(hook func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error))</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) PushHook(hook func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the FindClosestDumpsFromGraphFragment method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreFindClosestDumpsFromGraphFragmentFunc.PushReturn" href="#DBStoreFindClosestDumpsFromGraphFragmentFunc.PushReturn">func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) PushReturn(r0 []dbstore.Dump, r1 error)</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) PushReturn(r0 []dbstore.Dump, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreFindClosestDumpsFromGraphFragmentFunc.SetDefaultHook" href="#DBStoreFindClosestDumpsFromGraphFragmentFunc.SetDefaultHook">func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) SetDefaultHook(hook func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error))</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) SetDefaultHook(hook func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error))
```

SetDefaultHook sets function that is called when the FindClosestDumpsFromGraphFragment method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreFindClosestDumpsFromGraphFragmentFunc.SetDefaultReturn" href="#DBStoreFindClosestDumpsFromGraphFragmentFunc.SetDefaultReturn">func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreFindClosestDumpsFromGraphFragmentFunc.appendCall" href="#DBStoreFindClosestDumpsFromGraphFragmentFunc.appendCall">func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) appendCall(r0 DBStoreFindClosestDumpsFromGraphFragmentFuncCall)</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) appendCall(r0 DBStoreFindClosestDumpsFromGraphFragmentFuncCall)
```

#### <a id="DBStoreFindClosestDumpsFromGraphFragmentFunc.nextHook" href="#DBStoreFindClosestDumpsFromGraphFragmentFunc.nextHook">func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) nextHook() func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFromGraphFragmentFunc) nextHook() func(context.Context, int, string, string, bool, string, *gitserver.CommitGraph) ([]dbstore.Dump, error)
```

### <a id="DBStoreFindClosestDumpsFromGraphFragmentFuncCall" href="#DBStoreFindClosestDumpsFromGraphFragmentFuncCall">type DBStoreFindClosestDumpsFromGraphFragmentFuncCall struct</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFuncCall
tags: [struct private]
```

```Go
type DBStoreFindClosestDumpsFromGraphFragmentFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 string
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 bool
	// Arg5 is the value of the 6th argument passed to this method
	// invocation.
	Arg5 string
	// Arg6 is the value of the 7th argument passed to this method
	// invocation.
	Arg6 *gitserver.CommitGraph
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []dbstore.Dump
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreFindClosestDumpsFromGraphFragmentFuncCall is an object that describes an invocation of method FindClosestDumpsFromGraphFragment on an instance of MockDBStore. 

#### <a id="DBStoreFindClosestDumpsFromGraphFragmentFuncCall.Args" href="#DBStoreFindClosestDumpsFromGraphFragmentFuncCall.Args">func (c DBStoreFindClosestDumpsFromGraphFragmentFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreFindClosestDumpsFromGraphFragmentFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreFindClosestDumpsFromGraphFragmentFuncCall.Results" href="#DBStoreFindClosestDumpsFromGraphFragmentFuncCall.Results">func (c DBStoreFindClosestDumpsFromGraphFragmentFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFromGraphFragmentFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreFindClosestDumpsFromGraphFragmentFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreFindClosestDumpsFunc" href="#DBStoreFindClosestDumpsFunc">type DBStoreFindClosestDumpsFunc struct</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFunc
tags: [struct private]
```

```Go
type DBStoreFindClosestDumpsFunc struct {
	defaultHook func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error)
	hooks       []func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error)
	history     []DBStoreFindClosestDumpsFuncCall
	mutex       sync.Mutex
}
```

DBStoreFindClosestDumpsFunc describes the behavior when the FindClosestDumps method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreFindClosestDumpsFunc.History" href="#DBStoreFindClosestDumpsFunc.History">func (f *DBStoreFindClosestDumpsFunc) History() []DBStoreFindClosestDumpsFuncCall</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFunc.History
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFunc) History() []DBStoreFindClosestDumpsFuncCall
```

History returns a sequence of DBStoreFindClosestDumpsFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreFindClosestDumpsFunc.PushHook" href="#DBStoreFindClosestDumpsFunc.PushHook">func (f *DBStoreFindClosestDumpsFunc) PushHook(hook func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error))</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFunc) PushHook(hook func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the FindClosestDumps method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreFindClosestDumpsFunc.PushReturn" href="#DBStoreFindClosestDumpsFunc.PushReturn">func (f *DBStoreFindClosestDumpsFunc) PushReturn(r0 []dbstore.Dump, r1 error)</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFunc) PushReturn(r0 []dbstore.Dump, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreFindClosestDumpsFunc.SetDefaultHook" href="#DBStoreFindClosestDumpsFunc.SetDefaultHook">func (f *DBStoreFindClosestDumpsFunc) SetDefaultHook(hook func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error))</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFunc) SetDefaultHook(hook func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error))
```

SetDefaultHook sets function that is called when the FindClosestDumps method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreFindClosestDumpsFunc.SetDefaultReturn" href="#DBStoreFindClosestDumpsFunc.SetDefaultReturn">func (f *DBStoreFindClosestDumpsFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreFindClosestDumpsFunc.appendCall" href="#DBStoreFindClosestDumpsFunc.appendCall">func (f *DBStoreFindClosestDumpsFunc) appendCall(r0 DBStoreFindClosestDumpsFuncCall)</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFunc) appendCall(r0 DBStoreFindClosestDumpsFuncCall)
```

#### <a id="DBStoreFindClosestDumpsFunc.nextHook" href="#DBStoreFindClosestDumpsFunc.nextHook">func (f *DBStoreFindClosestDumpsFunc) nextHook() func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreFindClosestDumpsFunc) nextHook() func(context.Context, int, string, string, bool, string) ([]dbstore.Dump, error)
```

### <a id="DBStoreFindClosestDumpsFuncCall" href="#DBStoreFindClosestDumpsFuncCall">type DBStoreFindClosestDumpsFuncCall struct</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFuncCall
tags: [struct private]
```

```Go
type DBStoreFindClosestDumpsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 string
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 bool
	// Arg5 is the value of the 6th argument passed to this method
	// invocation.
	Arg5 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []dbstore.Dump
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreFindClosestDumpsFuncCall is an object that describes an invocation of method FindClosestDumps on an instance of MockDBStore. 

#### <a id="DBStoreFindClosestDumpsFuncCall.Args" href="#DBStoreFindClosestDumpsFuncCall.Args">func (c DBStoreFindClosestDumpsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreFindClosestDumpsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreFindClosestDumpsFuncCall.Results" href="#DBStoreFindClosestDumpsFuncCall.Results">func (c DBStoreFindClosestDumpsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreFindClosestDumpsFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreFindClosestDumpsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetDumpsByIDsFunc" href="#DBStoreGetDumpsByIDsFunc">type DBStoreGetDumpsByIDsFunc struct</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFunc
tags: [struct private]
```

```Go
type DBStoreGetDumpsByIDsFunc struct {
	defaultHook func(context.Context, []int) ([]dbstore.Dump, error)
	hooks       []func(context.Context, []int) ([]dbstore.Dump, error)
	history     []DBStoreGetDumpsByIDsFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetDumpsByIDsFunc describes the behavior when the GetDumpsByIDs method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetDumpsByIDsFunc.History" href="#DBStoreGetDumpsByIDsFunc.History">func (f *DBStoreGetDumpsByIDsFunc) History() []DBStoreGetDumpsByIDsFuncCall</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetDumpsByIDsFunc) History() []DBStoreGetDumpsByIDsFuncCall
```

History returns a sequence of DBStoreGetDumpsByIDsFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetDumpsByIDsFunc.PushHook" href="#DBStoreGetDumpsByIDsFunc.PushHook">func (f *DBStoreGetDumpsByIDsFunc) PushHook(hook func(context.Context, []int) ([]dbstore.Dump, error))</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetDumpsByIDsFunc) PushHook(hook func(context.Context, []int) ([]dbstore.Dump, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetDumpsByIDs method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetDumpsByIDsFunc.PushReturn" href="#DBStoreGetDumpsByIDsFunc.PushReturn">func (f *DBStoreGetDumpsByIDsFunc) PushReturn(r0 []dbstore.Dump, r1 error)</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetDumpsByIDsFunc) PushReturn(r0 []dbstore.Dump, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetDumpsByIDsFunc.SetDefaultHook" href="#DBStoreGetDumpsByIDsFunc.SetDefaultHook">func (f *DBStoreGetDumpsByIDsFunc) SetDefaultHook(hook func(context.Context, []int) ([]dbstore.Dump, error))</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetDumpsByIDsFunc) SetDefaultHook(hook func(context.Context, []int) ([]dbstore.Dump, error))
```

SetDefaultHook sets function that is called when the GetDumpsByIDs method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetDumpsByIDsFunc.SetDefaultReturn" href="#DBStoreGetDumpsByIDsFunc.SetDefaultReturn">func (f *DBStoreGetDumpsByIDsFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetDumpsByIDsFunc) SetDefaultReturn(r0 []dbstore.Dump, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetDumpsByIDsFunc.appendCall" href="#DBStoreGetDumpsByIDsFunc.appendCall">func (f *DBStoreGetDumpsByIDsFunc) appendCall(r0 DBStoreGetDumpsByIDsFuncCall)</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetDumpsByIDsFunc) appendCall(r0 DBStoreGetDumpsByIDsFuncCall)
```

#### <a id="DBStoreGetDumpsByIDsFunc.nextHook" href="#DBStoreGetDumpsByIDsFunc.nextHook">func (f *DBStoreGetDumpsByIDsFunc) nextHook() func(context.Context, []int) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetDumpsByIDsFunc) nextHook() func(context.Context, []int) ([]dbstore.Dump, error)
```

### <a id="DBStoreGetDumpsByIDsFuncCall" href="#DBStoreGetDumpsByIDsFuncCall">type DBStoreGetDumpsByIDsFuncCall struct</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFuncCall
tags: [struct private]
```

```Go
type DBStoreGetDumpsByIDsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []dbstore.Dump
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreGetDumpsByIDsFuncCall is an object that describes an invocation of method GetDumpsByIDs on an instance of MockDBStore. 

#### <a id="DBStoreGetDumpsByIDsFuncCall.Args" href="#DBStoreGetDumpsByIDsFuncCall.Args">func (c DBStoreGetDumpsByIDsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetDumpsByIDsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetDumpsByIDsFuncCall.Results" href="#DBStoreGetDumpsByIDsFuncCall.Results">func (c DBStoreGetDumpsByIDsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreGetDumpsByIDsFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetDumpsByIDsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetIndexByIDFunc" href="#DBStoreGetIndexByIDFunc">type DBStoreGetIndexByIDFunc struct</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFunc
tags: [struct private]
```

```Go
type DBStoreGetIndexByIDFunc struct {
	defaultHook func(context.Context, int) (dbstore.Index, bool, error)
	hooks       []func(context.Context, int) (dbstore.Index, bool, error)
	history     []DBStoreGetIndexByIDFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetIndexByIDFunc describes the behavior when the GetIndexByID method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetIndexByIDFunc.History" href="#DBStoreGetIndexByIDFunc.History">func (f *DBStoreGetIndexByIDFunc) History() []DBStoreGetIndexByIDFuncCall</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetIndexByIDFunc) History() []DBStoreGetIndexByIDFuncCall
```

History returns a sequence of DBStoreGetIndexByIDFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetIndexByIDFunc.PushHook" href="#DBStoreGetIndexByIDFunc.PushHook">func (f *DBStoreGetIndexByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Index, bool, error))</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Index, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetIndexByID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetIndexByIDFunc.PushReturn" href="#DBStoreGetIndexByIDFunc.PushReturn">func (f *DBStoreGetIndexByIDFunc) PushReturn(r0 dbstore.Index, r1 bool, r2 error)</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexByIDFunc) PushReturn(r0 dbstore.Index, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexByIDFunc.SetDefaultHook" href="#DBStoreGetIndexByIDFunc.SetDefaultHook">func (f *DBStoreGetIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Index, bool, error))</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Index, bool, error))
```

SetDefaultHook sets function that is called when the GetIndexByID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetIndexByIDFunc.SetDefaultReturn" href="#DBStoreGetIndexByIDFunc.SetDefaultReturn">func (f *DBStoreGetIndexByIDFunc) SetDefaultReturn(r0 dbstore.Index, r1 bool, r2 error)</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexByIDFunc) SetDefaultReturn(r0 dbstore.Index, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexByIDFunc.appendCall" href="#DBStoreGetIndexByIDFunc.appendCall">func (f *DBStoreGetIndexByIDFunc) appendCall(r0 DBStoreGetIndexByIDFuncCall)</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetIndexByIDFunc) appendCall(r0 DBStoreGetIndexByIDFuncCall)
```

#### <a id="DBStoreGetIndexByIDFunc.nextHook" href="#DBStoreGetIndexByIDFunc.nextHook">func (f *DBStoreGetIndexByIDFunc) nextHook() func(context.Context, int) (dbstore.Index, bool, error)</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexByIDFunc) nextHook() func(context.Context, int) (dbstore.Index, bool, error)
```

### <a id="DBStoreGetIndexByIDFuncCall" href="#DBStoreGetIndexByIDFuncCall">type DBStoreGetIndexByIDFuncCall struct</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFuncCall
tags: [struct private]
```

```Go
type DBStoreGetIndexByIDFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 dbstore.Index
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 bool
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreGetIndexByIDFuncCall is an object that describes an invocation of method GetIndexByID on an instance of MockDBStore. 

#### <a id="DBStoreGetIndexByIDFuncCall.Args" href="#DBStoreGetIndexByIDFuncCall.Args">func (c DBStoreGetIndexByIDFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetIndexByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetIndexByIDFuncCall.Results" href="#DBStoreGetIndexByIDFuncCall.Results">func (c DBStoreGetIndexByIDFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreGetIndexByIDFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetIndexByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc">type DBStoreGetIndexConfigurationByRepositoryIDFunc struct</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFunc
tags: [struct private]
```

```Go
type DBStoreGetIndexConfigurationByRepositoryIDFunc struct {
	defaultHook func(context.Context, int) (dbstore.IndexConfiguration, bool, error)
	hooks       []func(context.Context, int) (dbstore.IndexConfiguration, bool, error)
	history     []DBStoreGetIndexConfigurationByRepositoryIDFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetIndexConfigurationByRepositoryIDFunc describes the behavior when the GetIndexConfigurationByRepositoryID method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.History" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.History">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) History() []DBStoreGetIndexConfigurationByRepositoryIDFuncCall</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) History() []DBStoreGetIndexConfigurationByRepositoryIDFuncCall
```

History returns a sequence of DBStoreGetIndexConfigurationByRepositoryIDFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetIndexConfigurationByRepositoryID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))
```

SetDefaultHook sets function that is called when the GetIndexConfigurationByRepositoryID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) appendCall(r0 DBStoreGetIndexConfigurationByRepositoryIDFuncCall)</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) appendCall(r0 DBStoreGetIndexConfigurationByRepositoryIDFuncCall)
```

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int) (dbstore.IndexConfiguration, bool, error)</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int) (dbstore.IndexConfiguration, bool, error)
```

### <a id="DBStoreGetIndexConfigurationByRepositoryIDFuncCall" href="#DBStoreGetIndexConfigurationByRepositoryIDFuncCall">type DBStoreGetIndexConfigurationByRepositoryIDFuncCall struct</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFuncCall
tags: [struct private]
```

```Go
type DBStoreGetIndexConfigurationByRepositoryIDFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 dbstore.IndexConfiguration
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 bool
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreGetIndexConfigurationByRepositoryIDFuncCall is an object that describes an invocation of method GetIndexConfigurationByRepositoryID on an instance of MockDBStore. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Args" href="#DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Args">func (c DBStoreGetIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results" href="#DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results">func (c DBStoreGetIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetIndexesByIDsFunc" href="#DBStoreGetIndexesByIDsFunc">type DBStoreGetIndexesByIDsFunc struct</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFunc
tags: [struct private]
```

```Go
type DBStoreGetIndexesByIDsFunc struct {
	defaultHook func(context.Context, ...int) ([]dbstore.Index, error)
	hooks       []func(context.Context, ...int) ([]dbstore.Index, error)
	history     []DBStoreGetIndexesByIDsFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetIndexesByIDsFunc describes the behavior when the GetIndexesByIDs method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetIndexesByIDsFunc.History" href="#DBStoreGetIndexesByIDsFunc.History">func (f *DBStoreGetIndexesByIDsFunc) History() []DBStoreGetIndexesByIDsFuncCall</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesByIDsFunc) History() []DBStoreGetIndexesByIDsFuncCall
```

History returns a sequence of DBStoreGetIndexesByIDsFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetIndexesByIDsFunc.PushHook" href="#DBStoreGetIndexesByIDsFunc.PushHook">func (f *DBStoreGetIndexesByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Index, error))</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Index, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetIndexesByIDs method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetIndexesByIDsFunc.PushReturn" href="#DBStoreGetIndexesByIDsFunc.PushReturn">func (f *DBStoreGetIndexesByIDsFunc) PushReturn(r0 []dbstore.Index, r1 error)</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesByIDsFunc) PushReturn(r0 []dbstore.Index, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexesByIDsFunc.SetDefaultHook" href="#DBStoreGetIndexesByIDsFunc.SetDefaultHook">func (f *DBStoreGetIndexesByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Index, error))</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Index, error))
```

SetDefaultHook sets function that is called when the GetIndexesByIDs method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetIndexesByIDsFunc.SetDefaultReturn" href="#DBStoreGetIndexesByIDsFunc.SetDefaultReturn">func (f *DBStoreGetIndexesByIDsFunc) SetDefaultReturn(r0 []dbstore.Index, r1 error)</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesByIDsFunc) SetDefaultReturn(r0 []dbstore.Index, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexesByIDsFunc.appendCall" href="#DBStoreGetIndexesByIDsFunc.appendCall">func (f *DBStoreGetIndexesByIDsFunc) appendCall(r0 DBStoreGetIndexesByIDsFuncCall)</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesByIDsFunc) appendCall(r0 DBStoreGetIndexesByIDsFuncCall)
```

#### <a id="DBStoreGetIndexesByIDsFunc.nextHook" href="#DBStoreGetIndexesByIDsFunc.nextHook">func (f *DBStoreGetIndexesByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Index, error)</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Index, error)
```

### <a id="DBStoreGetIndexesByIDsFuncCall" href="#DBStoreGetIndexesByIDsFuncCall">type DBStoreGetIndexesByIDsFuncCall struct</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFuncCall
tags: [struct private]
```

```Go
type DBStoreGetIndexesByIDsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is a slice containing the values of the variadic arguments
	// passed to this method invocation.
	Arg1 []int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []dbstore.Index
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreGetIndexesByIDsFuncCall is an object that describes an invocation of method GetIndexesByIDs on an instance of MockDBStore. 

#### <a id="DBStoreGetIndexesByIDsFuncCall.Args" href="#DBStoreGetIndexesByIDsFuncCall.Args">func (c DBStoreGetIndexesByIDsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetIndexesByIDsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. The variadic slice argument is flattened in this array such that one positional argument and three variadic arguments would result in a slice of four, not two. 

#### <a id="DBStoreGetIndexesByIDsFuncCall.Results" href="#DBStoreGetIndexesByIDsFuncCall.Results">func (c DBStoreGetIndexesByIDsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreGetIndexesByIDsFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetIndexesByIDsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetIndexesFunc" href="#DBStoreGetIndexesFunc">type DBStoreGetIndexesFunc struct</a>

```
searchKey: resolvers.DBStoreGetIndexesFunc
tags: [struct private]
```

```Go
type DBStoreGetIndexesFunc struct {
	defaultHook func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error)
	hooks       []func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error)
	history     []DBStoreGetIndexesFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetIndexesFunc describes the behavior when the GetIndexes method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetIndexesFunc.History" href="#DBStoreGetIndexesFunc.History">func (f *DBStoreGetIndexesFunc) History() []DBStoreGetIndexesFuncCall</a>

```
searchKey: resolvers.DBStoreGetIndexesFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesFunc) History() []DBStoreGetIndexesFuncCall
```

History returns a sequence of DBStoreGetIndexesFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetIndexesFunc.PushHook" href="#DBStoreGetIndexesFunc.PushHook">func (f *DBStoreGetIndexesFunc) PushHook(hook func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error))</a>

```
searchKey: resolvers.DBStoreGetIndexesFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesFunc) PushHook(hook func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetIndexes method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetIndexesFunc.PushReturn" href="#DBStoreGetIndexesFunc.PushReturn">func (f *DBStoreGetIndexesFunc) PushReturn(r0 []dbstore.Index, r1 int, r2 error)</a>

```
searchKey: resolvers.DBStoreGetIndexesFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesFunc) PushReturn(r0 []dbstore.Index, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexesFunc.SetDefaultHook" href="#DBStoreGetIndexesFunc.SetDefaultHook">func (f *DBStoreGetIndexesFunc) SetDefaultHook(hook func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error))</a>

```
searchKey: resolvers.DBStoreGetIndexesFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesFunc) SetDefaultHook(hook func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error))
```

SetDefaultHook sets function that is called when the GetIndexes method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetIndexesFunc.SetDefaultReturn" href="#DBStoreGetIndexesFunc.SetDefaultReturn">func (f *DBStoreGetIndexesFunc) SetDefaultReturn(r0 []dbstore.Index, r1 int, r2 error)</a>

```
searchKey: resolvers.DBStoreGetIndexesFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesFunc) SetDefaultReturn(r0 []dbstore.Index, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexesFunc.appendCall" href="#DBStoreGetIndexesFunc.appendCall">func (f *DBStoreGetIndexesFunc) appendCall(r0 DBStoreGetIndexesFuncCall)</a>

```
searchKey: resolvers.DBStoreGetIndexesFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesFunc) appendCall(r0 DBStoreGetIndexesFuncCall)
```

#### <a id="DBStoreGetIndexesFunc.nextHook" href="#DBStoreGetIndexesFunc.nextHook">func (f *DBStoreGetIndexesFunc) nextHook() func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error)</a>

```
searchKey: resolvers.DBStoreGetIndexesFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexesFunc) nextHook() func(context.Context, dbstore.GetIndexesOptions) ([]dbstore.Index, int, error)
```

### <a id="DBStoreGetIndexesFuncCall" href="#DBStoreGetIndexesFuncCall">type DBStoreGetIndexesFuncCall struct</a>

```
searchKey: resolvers.DBStoreGetIndexesFuncCall
tags: [struct private]
```

```Go
type DBStoreGetIndexesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 dbstore.GetIndexesOptions
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []dbstore.Index
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreGetIndexesFuncCall is an object that describes an invocation of method GetIndexes on an instance of MockDBStore. 

#### <a id="DBStoreGetIndexesFuncCall.Args" href="#DBStoreGetIndexesFuncCall.Args">func (c DBStoreGetIndexesFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreGetIndexesFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetIndexesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetIndexesFuncCall.Results" href="#DBStoreGetIndexesFuncCall.Results">func (c DBStoreGetIndexesFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreGetIndexesFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetIndexesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetUploadByIDFunc" href="#DBStoreGetUploadByIDFunc">type DBStoreGetUploadByIDFunc struct</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFunc
tags: [struct private]
```

```Go
type DBStoreGetUploadByIDFunc struct {
	defaultHook func(context.Context, int) (dbstore.Upload, bool, error)
	hooks       []func(context.Context, int) (dbstore.Upload, bool, error)
	history     []DBStoreGetUploadByIDFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetUploadByIDFunc describes the behavior when the GetUploadByID method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetUploadByIDFunc.History" href="#DBStoreGetUploadByIDFunc.History">func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall
```

History returns a sequence of DBStoreGetUploadByIDFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetUploadByIDFunc.PushHook" href="#DBStoreGetUploadByIDFunc.PushHook">func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploadByID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetUploadByIDFunc.PushReturn" href="#DBStoreGetUploadByIDFunc.PushReturn">func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadByIDFunc.SetDefaultHook" href="#DBStoreGetUploadByIDFunc.SetDefaultHook">func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

SetDefaultHook sets function that is called when the GetUploadByID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetUploadByIDFunc.SetDefaultReturn" href="#DBStoreGetUploadByIDFunc.SetDefaultReturn">func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadByIDFunc.appendCall" href="#DBStoreGetUploadByIDFunc.appendCall">func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)
```

#### <a id="DBStoreGetUploadByIDFunc.nextHook" href="#DBStoreGetUploadByIDFunc.nextHook">func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)
```

### <a id="DBStoreGetUploadByIDFuncCall" href="#DBStoreGetUploadByIDFuncCall">type DBStoreGetUploadByIDFuncCall struct</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFuncCall
tags: [struct private]
```

```Go
type DBStoreGetUploadByIDFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 dbstore.Upload
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 bool
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreGetUploadByIDFuncCall is an object that describes an invocation of method GetUploadByID on an instance of MockDBStore. 

#### <a id="DBStoreGetUploadByIDFuncCall.Args" href="#DBStoreGetUploadByIDFuncCall.Args">func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetUploadByIDFuncCall.Results" href="#DBStoreGetUploadByIDFuncCall.Results">func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreGetUploadByIDFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetUploadsByIDsFunc" href="#DBStoreGetUploadsByIDsFunc">type DBStoreGetUploadsByIDsFunc struct</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFunc
tags: [struct private]
```

```Go
type DBStoreGetUploadsByIDsFunc struct {
	defaultHook func(context.Context, ...int) ([]dbstore.Upload, error)
	hooks       []func(context.Context, ...int) ([]dbstore.Upload, error)
	history     []DBStoreGetUploadsByIDsFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetUploadsByIDsFunc describes the behavior when the GetUploadsByIDs method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetUploadsByIDsFunc.History" href="#DBStoreGetUploadsByIDsFunc.History">func (f *DBStoreGetUploadsByIDsFunc) History() []DBStoreGetUploadsByIDsFuncCall</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsByIDsFunc) History() []DBStoreGetUploadsByIDsFuncCall
```

History returns a sequence of DBStoreGetUploadsByIDsFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetUploadsByIDsFunc.PushHook" href="#DBStoreGetUploadsByIDsFunc.PushHook">func (f *DBStoreGetUploadsByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploadsByIDs method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetUploadsByIDsFunc.PushReturn" href="#DBStoreGetUploadsByIDsFunc.PushReturn">func (f *DBStoreGetUploadsByIDsFunc) PushReturn(r0 []dbstore.Upload, r1 error)</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsByIDsFunc) PushReturn(r0 []dbstore.Upload, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadsByIDsFunc.SetDefaultHook" href="#DBStoreGetUploadsByIDsFunc.SetDefaultHook">func (f *DBStoreGetUploadsByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))
```

SetDefaultHook sets function that is called when the GetUploadsByIDs method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetUploadsByIDsFunc.SetDefaultReturn" href="#DBStoreGetUploadsByIDsFunc.SetDefaultReturn">func (f *DBStoreGetUploadsByIDsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 error)</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsByIDsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadsByIDsFunc.appendCall" href="#DBStoreGetUploadsByIDsFunc.appendCall">func (f *DBStoreGetUploadsByIDsFunc) appendCall(r0 DBStoreGetUploadsByIDsFuncCall)</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsByIDsFunc) appendCall(r0 DBStoreGetUploadsByIDsFuncCall)
```

#### <a id="DBStoreGetUploadsByIDsFunc.nextHook" href="#DBStoreGetUploadsByIDsFunc.nextHook">func (f *DBStoreGetUploadsByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Upload, error)</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Upload, error)
```

### <a id="DBStoreGetUploadsByIDsFuncCall" href="#DBStoreGetUploadsByIDsFuncCall">type DBStoreGetUploadsByIDsFuncCall struct</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFuncCall
tags: [struct private]
```

```Go
type DBStoreGetUploadsByIDsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is a slice containing the values of the variadic arguments
	// passed to this method invocation.
	Arg1 []int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []dbstore.Upload
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreGetUploadsByIDsFuncCall is an object that describes an invocation of method GetUploadsByIDs on an instance of MockDBStore. 

#### <a id="DBStoreGetUploadsByIDsFuncCall.Args" href="#DBStoreGetUploadsByIDsFuncCall.Args">func (c DBStoreGetUploadsByIDsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetUploadsByIDsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. The variadic slice argument is flattened in this array such that one positional argument and three variadic arguments would result in a slice of four, not two. 

#### <a id="DBStoreGetUploadsByIDsFuncCall.Results" href="#DBStoreGetUploadsByIDsFuncCall.Results">func (c DBStoreGetUploadsByIDsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreGetUploadsByIDsFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetUploadsByIDsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetUploadsFunc" href="#DBStoreGetUploadsFunc">type DBStoreGetUploadsFunc struct</a>

```
searchKey: resolvers.DBStoreGetUploadsFunc
tags: [struct private]
```

```Go
type DBStoreGetUploadsFunc struct {
	defaultHook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
	hooks       []func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
	history     []DBStoreGetUploadsFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetUploadsFunc describes the behavior when the GetUploads method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetUploadsFunc.History" href="#DBStoreGetUploadsFunc.History">func (f *DBStoreGetUploadsFunc) History() []DBStoreGetUploadsFuncCall</a>

```
searchKey: resolvers.DBStoreGetUploadsFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsFunc) History() []DBStoreGetUploadsFuncCall
```

History returns a sequence of DBStoreGetUploadsFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetUploadsFunc.PushHook" href="#DBStoreGetUploadsFunc.PushHook">func (f *DBStoreGetUploadsFunc) PushHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))</a>

```
searchKey: resolvers.DBStoreGetUploadsFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsFunc) PushHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploads method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetUploadsFunc.PushReturn" href="#DBStoreGetUploadsFunc.PushReturn">func (f *DBStoreGetUploadsFunc) PushReturn(r0 []dbstore.Upload, r1 int, r2 error)</a>

```
searchKey: resolvers.DBStoreGetUploadsFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsFunc) PushReturn(r0 []dbstore.Upload, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadsFunc.SetDefaultHook" href="#DBStoreGetUploadsFunc.SetDefaultHook">func (f *DBStoreGetUploadsFunc) SetDefaultHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))</a>

```
searchKey: resolvers.DBStoreGetUploadsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsFunc) SetDefaultHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))
```

SetDefaultHook sets function that is called when the GetUploads method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetUploadsFunc.SetDefaultReturn" href="#DBStoreGetUploadsFunc.SetDefaultReturn">func (f *DBStoreGetUploadsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 int, r2 error)</a>

```
searchKey: resolvers.DBStoreGetUploadsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadsFunc.appendCall" href="#DBStoreGetUploadsFunc.appendCall">func (f *DBStoreGetUploadsFunc) appendCall(r0 DBStoreGetUploadsFuncCall)</a>

```
searchKey: resolvers.DBStoreGetUploadsFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsFunc) appendCall(r0 DBStoreGetUploadsFuncCall)
```

#### <a id="DBStoreGetUploadsFunc.nextHook" href="#DBStoreGetUploadsFunc.nextHook">func (f *DBStoreGetUploadsFunc) nextHook() func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)</a>

```
searchKey: resolvers.DBStoreGetUploadsFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadsFunc) nextHook() func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
```

### <a id="DBStoreGetUploadsFuncCall" href="#DBStoreGetUploadsFuncCall">type DBStoreGetUploadsFuncCall struct</a>

```
searchKey: resolvers.DBStoreGetUploadsFuncCall
tags: [struct private]
```

```Go
type DBStoreGetUploadsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 dbstore.GetUploadsOptions
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []dbstore.Upload
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreGetUploadsFuncCall is an object that describes an invocation of method GetUploads on an instance of MockDBStore. 

#### <a id="DBStoreGetUploadsFuncCall.Args" href="#DBStoreGetUploadsFuncCall.Args">func (c DBStoreGetUploadsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreGetUploadsFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetUploadsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetUploadsFuncCall.Results" href="#DBStoreGetUploadsFuncCall.Results">func (c DBStoreGetUploadsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreGetUploadsFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetUploadsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreHasCommitFunc" href="#DBStoreHasCommitFunc">type DBStoreHasCommitFunc struct</a>

```
searchKey: resolvers.DBStoreHasCommitFunc
tags: [struct private]
```

```Go
type DBStoreHasCommitFunc struct {
	defaultHook func(context.Context, int, string) (bool, error)
	hooks       []func(context.Context, int, string) (bool, error)
	history     []DBStoreHasCommitFuncCall
	mutex       sync.Mutex
}
```

DBStoreHasCommitFunc describes the behavior when the HasCommit method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreHasCommitFunc.History" href="#DBStoreHasCommitFunc.History">func (f *DBStoreHasCommitFunc) History() []DBStoreHasCommitFuncCall</a>

```
searchKey: resolvers.DBStoreHasCommitFunc.History
tags: [method private]
```

```Go
func (f *DBStoreHasCommitFunc) History() []DBStoreHasCommitFuncCall
```

History returns a sequence of DBStoreHasCommitFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreHasCommitFunc.PushHook" href="#DBStoreHasCommitFunc.PushHook">func (f *DBStoreHasCommitFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: resolvers.DBStoreHasCommitFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreHasCommitFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the HasCommit method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreHasCommitFunc.PushReturn" href="#DBStoreHasCommitFunc.PushReturn">func (f *DBStoreHasCommitFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.DBStoreHasCommitFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreHasCommitFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHasCommitFunc.SetDefaultHook" href="#DBStoreHasCommitFunc.SetDefaultHook">func (f *DBStoreHasCommitFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: resolvers.DBStoreHasCommitFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreHasCommitFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the HasCommit method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreHasCommitFunc.SetDefaultReturn" href="#DBStoreHasCommitFunc.SetDefaultReturn">func (f *DBStoreHasCommitFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.DBStoreHasCommitFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreHasCommitFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHasCommitFunc.appendCall" href="#DBStoreHasCommitFunc.appendCall">func (f *DBStoreHasCommitFunc) appendCall(r0 DBStoreHasCommitFuncCall)</a>

```
searchKey: resolvers.DBStoreHasCommitFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreHasCommitFunc) appendCall(r0 DBStoreHasCommitFuncCall)
```

#### <a id="DBStoreHasCommitFunc.nextHook" href="#DBStoreHasCommitFunc.nextHook">func (f *DBStoreHasCommitFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: resolvers.DBStoreHasCommitFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreHasCommitFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="DBStoreHasCommitFuncCall" href="#DBStoreHasCommitFuncCall">type DBStoreHasCommitFuncCall struct</a>

```
searchKey: resolvers.DBStoreHasCommitFuncCall
tags: [struct private]
```

```Go
type DBStoreHasCommitFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreHasCommitFuncCall is an object that describes an invocation of method HasCommit on an instance of MockDBStore. 

#### <a id="DBStoreHasCommitFuncCall.Args" href="#DBStoreHasCommitFuncCall.Args">func (c DBStoreHasCommitFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreHasCommitFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreHasCommitFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreHasCommitFuncCall.Results" href="#DBStoreHasCommitFuncCall.Results">func (c DBStoreHasCommitFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreHasCommitFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreHasCommitFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreHasRepositoryFunc" href="#DBStoreHasRepositoryFunc">type DBStoreHasRepositoryFunc struct</a>

```
searchKey: resolvers.DBStoreHasRepositoryFunc
tags: [struct private]
```

```Go
type DBStoreHasRepositoryFunc struct {
	defaultHook func(context.Context, int) (bool, error)
	hooks       []func(context.Context, int) (bool, error)
	history     []DBStoreHasRepositoryFuncCall
	mutex       sync.Mutex
}
```

DBStoreHasRepositoryFunc describes the behavior when the HasRepository method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreHasRepositoryFunc.History" href="#DBStoreHasRepositoryFunc.History">func (f *DBStoreHasRepositoryFunc) History() []DBStoreHasRepositoryFuncCall</a>

```
searchKey: resolvers.DBStoreHasRepositoryFunc.History
tags: [method private]
```

```Go
func (f *DBStoreHasRepositoryFunc) History() []DBStoreHasRepositoryFuncCall
```

History returns a sequence of DBStoreHasRepositoryFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreHasRepositoryFunc.PushHook" href="#DBStoreHasRepositoryFunc.PushHook">func (f *DBStoreHasRepositoryFunc) PushHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: resolvers.DBStoreHasRepositoryFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreHasRepositoryFunc) PushHook(hook func(context.Context, int) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the HasRepository method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreHasRepositoryFunc.PushReturn" href="#DBStoreHasRepositoryFunc.PushReturn">func (f *DBStoreHasRepositoryFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.DBStoreHasRepositoryFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreHasRepositoryFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHasRepositoryFunc.SetDefaultHook" href="#DBStoreHasRepositoryFunc.SetDefaultHook">func (f *DBStoreHasRepositoryFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: resolvers.DBStoreHasRepositoryFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreHasRepositoryFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))
```

SetDefaultHook sets function that is called when the HasRepository method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreHasRepositoryFunc.SetDefaultReturn" href="#DBStoreHasRepositoryFunc.SetDefaultReturn">func (f *DBStoreHasRepositoryFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.DBStoreHasRepositoryFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreHasRepositoryFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHasRepositoryFunc.appendCall" href="#DBStoreHasRepositoryFunc.appendCall">func (f *DBStoreHasRepositoryFunc) appendCall(r0 DBStoreHasRepositoryFuncCall)</a>

```
searchKey: resolvers.DBStoreHasRepositoryFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreHasRepositoryFunc) appendCall(r0 DBStoreHasRepositoryFuncCall)
```

#### <a id="DBStoreHasRepositoryFunc.nextHook" href="#DBStoreHasRepositoryFunc.nextHook">func (f *DBStoreHasRepositoryFunc) nextHook() func(context.Context, int) (bool, error)</a>

```
searchKey: resolvers.DBStoreHasRepositoryFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreHasRepositoryFunc) nextHook() func(context.Context, int) (bool, error)
```

### <a id="DBStoreHasRepositoryFuncCall" href="#DBStoreHasRepositoryFuncCall">type DBStoreHasRepositoryFuncCall struct</a>

```
searchKey: resolvers.DBStoreHasRepositoryFuncCall
tags: [struct private]
```

```Go
type DBStoreHasRepositoryFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreHasRepositoryFuncCall is an object that describes an invocation of method HasRepository on an instance of MockDBStore. 

#### <a id="DBStoreHasRepositoryFuncCall.Args" href="#DBStoreHasRepositoryFuncCall.Args">func (c DBStoreHasRepositoryFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreHasRepositoryFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreHasRepositoryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreHasRepositoryFuncCall.Results" href="#DBStoreHasRepositoryFuncCall.Results">func (c DBStoreHasRepositoryFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreHasRepositoryFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreHasRepositoryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreMarkRepositoryAsDirtyFunc" href="#DBStoreMarkRepositoryAsDirtyFunc">type DBStoreMarkRepositoryAsDirtyFunc struct</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFunc
tags: [struct private]
```

```Go
type DBStoreMarkRepositoryAsDirtyFunc struct {
	defaultHook func(context.Context, int) error
	hooks       []func(context.Context, int) error
	history     []DBStoreMarkRepositoryAsDirtyFuncCall
	mutex       sync.Mutex
}
```

DBStoreMarkRepositoryAsDirtyFunc describes the behavior when the MarkRepositoryAsDirty method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.History" href="#DBStoreMarkRepositoryAsDirtyFunc.History">func (f *DBStoreMarkRepositoryAsDirtyFunc) History() []DBStoreMarkRepositoryAsDirtyFuncCall</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFunc.History
tags: [method private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) History() []DBStoreMarkRepositoryAsDirtyFuncCall
```

History returns a sequence of DBStoreMarkRepositoryAsDirtyFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.PushHook" href="#DBStoreMarkRepositoryAsDirtyFunc.PushHook">func (f *DBStoreMarkRepositoryAsDirtyFunc) PushHook(hook func(context.Context, int) error)</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) PushHook(hook func(context.Context, int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkRepositoryAsDirty method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.PushReturn" href="#DBStoreMarkRepositoryAsDirtyFunc.PushReturn">func (f *DBStoreMarkRepositoryAsDirtyFunc) PushReturn(r0 error)</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.SetDefaultHook" href="#DBStoreMarkRepositoryAsDirtyFunc.SetDefaultHook">func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultHook(hook func(context.Context, int) error)</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultHook(hook func(context.Context, int) error)
```

SetDefaultHook sets function that is called when the MarkRepositoryAsDirty method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.SetDefaultReturn" href="#DBStoreMarkRepositoryAsDirtyFunc.SetDefaultReturn">func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.appendCall" href="#DBStoreMarkRepositoryAsDirtyFunc.appendCall">func (f *DBStoreMarkRepositoryAsDirtyFunc) appendCall(r0 DBStoreMarkRepositoryAsDirtyFuncCall)</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) appendCall(r0 DBStoreMarkRepositoryAsDirtyFuncCall)
```

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.nextHook" href="#DBStoreMarkRepositoryAsDirtyFunc.nextHook">func (f *DBStoreMarkRepositoryAsDirtyFunc) nextHook() func(context.Context, int) error</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) nextHook() func(context.Context, int) error
```

### <a id="DBStoreMarkRepositoryAsDirtyFuncCall" href="#DBStoreMarkRepositoryAsDirtyFuncCall">type DBStoreMarkRepositoryAsDirtyFuncCall struct</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFuncCall
tags: [struct private]
```

```Go
type DBStoreMarkRepositoryAsDirtyFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreMarkRepositoryAsDirtyFuncCall is an object that describes an invocation of method MarkRepositoryAsDirty on an instance of MockDBStore. 

#### <a id="DBStoreMarkRepositoryAsDirtyFuncCall.Args" href="#DBStoreMarkRepositoryAsDirtyFuncCall.Args">func (c DBStoreMarkRepositoryAsDirtyFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreMarkRepositoryAsDirtyFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreMarkRepositoryAsDirtyFuncCall.Results" href="#DBStoreMarkRepositoryAsDirtyFuncCall.Results">func (c DBStoreMarkRepositoryAsDirtyFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreMarkRepositoryAsDirtyFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreMarkRepositoryAsDirtyFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreReferenceIDsAndFiltersFunc" href="#DBStoreReferenceIDsAndFiltersFunc">type DBStoreReferenceIDsAndFiltersFunc struct</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFunc
tags: [struct private]
```

```Go
type DBStoreReferenceIDsAndFiltersFunc struct {
	defaultHook func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error)
	hooks       []func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error)
	history     []DBStoreReferenceIDsAndFiltersFuncCall
	mutex       sync.Mutex
}
```

DBStoreReferenceIDsAndFiltersFunc describes the behavior when the ReferenceIDsAndFilters method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreReferenceIDsAndFiltersFunc.History" href="#DBStoreReferenceIDsAndFiltersFunc.History">func (f *DBStoreReferenceIDsAndFiltersFunc) History() []DBStoreReferenceIDsAndFiltersFuncCall</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFunc.History
tags: [method private]
```

```Go
func (f *DBStoreReferenceIDsAndFiltersFunc) History() []DBStoreReferenceIDsAndFiltersFuncCall
```

History returns a sequence of DBStoreReferenceIDsAndFiltersFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreReferenceIDsAndFiltersFunc.PushHook" href="#DBStoreReferenceIDsAndFiltersFunc.PushHook">func (f *DBStoreReferenceIDsAndFiltersFunc) PushHook(hook func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error))</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreReferenceIDsAndFiltersFunc) PushHook(hook func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ReferenceIDsAndFilters method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreReferenceIDsAndFiltersFunc.PushReturn" href="#DBStoreReferenceIDsAndFiltersFunc.PushReturn">func (f *DBStoreReferenceIDsAndFiltersFunc) PushReturn(r0 dbstore.PackageReferenceScanner, r1 int, r2 error)</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreReferenceIDsAndFiltersFunc) PushReturn(r0 dbstore.PackageReferenceScanner, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreReferenceIDsAndFiltersFunc.SetDefaultHook" href="#DBStoreReferenceIDsAndFiltersFunc.SetDefaultHook">func (f *DBStoreReferenceIDsAndFiltersFunc) SetDefaultHook(hook func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error))</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreReferenceIDsAndFiltersFunc) SetDefaultHook(hook func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error))
```

SetDefaultHook sets function that is called when the ReferenceIDsAndFilters method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreReferenceIDsAndFiltersFunc.SetDefaultReturn" href="#DBStoreReferenceIDsAndFiltersFunc.SetDefaultReturn">func (f *DBStoreReferenceIDsAndFiltersFunc) SetDefaultReturn(r0 dbstore.PackageReferenceScanner, r1 int, r2 error)</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreReferenceIDsAndFiltersFunc) SetDefaultReturn(r0 dbstore.PackageReferenceScanner, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreReferenceIDsAndFiltersFunc.appendCall" href="#DBStoreReferenceIDsAndFiltersFunc.appendCall">func (f *DBStoreReferenceIDsAndFiltersFunc) appendCall(r0 DBStoreReferenceIDsAndFiltersFuncCall)</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreReferenceIDsAndFiltersFunc) appendCall(r0 DBStoreReferenceIDsAndFiltersFuncCall)
```

#### <a id="DBStoreReferenceIDsAndFiltersFunc.nextHook" href="#DBStoreReferenceIDsAndFiltersFunc.nextHook">func (f *DBStoreReferenceIDsAndFiltersFunc) nextHook() func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error)</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreReferenceIDsAndFiltersFunc) nextHook() func(context.Context, int, string, []semantic.QualifiedMonikerData, int, int) (dbstore.PackageReferenceScanner, int, error)
```

### <a id="DBStoreReferenceIDsAndFiltersFuncCall" href="#DBStoreReferenceIDsAndFiltersFuncCall">type DBStoreReferenceIDsAndFiltersFuncCall struct</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFuncCall
tags: [struct private]
```

```Go
type DBStoreReferenceIDsAndFiltersFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 []semantic.QualifiedMonikerData
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 int
	// Arg5 is the value of the 6th argument passed to this method
	// invocation.
	Arg5 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 dbstore.PackageReferenceScanner
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreReferenceIDsAndFiltersFuncCall is an object that describes an invocation of method ReferenceIDsAndFilters on an instance of MockDBStore. 

#### <a id="DBStoreReferenceIDsAndFiltersFuncCall.Args" href="#DBStoreReferenceIDsAndFiltersFuncCall.Args">func (c DBStoreReferenceIDsAndFiltersFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreReferenceIDsAndFiltersFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreReferenceIDsAndFiltersFuncCall.Results" href="#DBStoreReferenceIDsAndFiltersFuncCall.Results">func (c DBStoreReferenceIDsAndFiltersFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreReferenceIDsAndFiltersFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreReferenceIDsAndFiltersFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreRepoNameFunc" href="#DBStoreRepoNameFunc">type DBStoreRepoNameFunc struct</a>

```
searchKey: resolvers.DBStoreRepoNameFunc
tags: [struct private]
```

```Go
type DBStoreRepoNameFunc struct {
	defaultHook func(context.Context, int) (string, error)
	hooks       []func(context.Context, int) (string, error)
	history     []DBStoreRepoNameFuncCall
	mutex       sync.Mutex
}
```

DBStoreRepoNameFunc describes the behavior when the RepoName method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreRepoNameFunc.History" href="#DBStoreRepoNameFunc.History">func (f *DBStoreRepoNameFunc) History() []DBStoreRepoNameFuncCall</a>

```
searchKey: resolvers.DBStoreRepoNameFunc.History
tags: [method private]
```

```Go
func (f *DBStoreRepoNameFunc) History() []DBStoreRepoNameFuncCall
```

History returns a sequence of DBStoreRepoNameFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreRepoNameFunc.PushHook" href="#DBStoreRepoNameFunc.PushHook">func (f *DBStoreRepoNameFunc) PushHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: resolvers.DBStoreRepoNameFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreRepoNameFunc) PushHook(hook func(context.Context, int) (string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the RepoName method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreRepoNameFunc.PushReturn" href="#DBStoreRepoNameFunc.PushReturn">func (f *DBStoreRepoNameFunc) PushReturn(r0 string, r1 error)</a>

```
searchKey: resolvers.DBStoreRepoNameFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreRepoNameFunc) PushReturn(r0 string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreRepoNameFunc.SetDefaultHook" href="#DBStoreRepoNameFunc.SetDefaultHook">func (f *DBStoreRepoNameFunc) SetDefaultHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: resolvers.DBStoreRepoNameFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreRepoNameFunc) SetDefaultHook(hook func(context.Context, int) (string, error))
```

SetDefaultHook sets function that is called when the RepoName method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreRepoNameFunc.SetDefaultReturn" href="#DBStoreRepoNameFunc.SetDefaultReturn">func (f *DBStoreRepoNameFunc) SetDefaultReturn(r0 string, r1 error)</a>

```
searchKey: resolvers.DBStoreRepoNameFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreRepoNameFunc) SetDefaultReturn(r0 string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreRepoNameFunc.appendCall" href="#DBStoreRepoNameFunc.appendCall">func (f *DBStoreRepoNameFunc) appendCall(r0 DBStoreRepoNameFuncCall)</a>

```
searchKey: resolvers.DBStoreRepoNameFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreRepoNameFunc) appendCall(r0 DBStoreRepoNameFuncCall)
```

#### <a id="DBStoreRepoNameFunc.nextHook" href="#DBStoreRepoNameFunc.nextHook">func (f *DBStoreRepoNameFunc) nextHook() func(context.Context, int) (string, error)</a>

```
searchKey: resolvers.DBStoreRepoNameFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreRepoNameFunc) nextHook() func(context.Context, int) (string, error)
```

### <a id="DBStoreRepoNameFuncCall" href="#DBStoreRepoNameFuncCall">type DBStoreRepoNameFuncCall struct</a>

```
searchKey: resolvers.DBStoreRepoNameFuncCall
tags: [struct private]
```

```Go
type DBStoreRepoNameFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreRepoNameFuncCall is an object that describes an invocation of method RepoName on an instance of MockDBStore. 

#### <a id="DBStoreRepoNameFuncCall.Args" href="#DBStoreRepoNameFuncCall.Args">func (c DBStoreRepoNameFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreRepoNameFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreRepoNameFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreRepoNameFuncCall.Results" href="#DBStoreRepoNameFuncCall.Results">func (c DBStoreRepoNameFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreRepoNameFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreRepoNameFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFunc" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFunc">type DBStoreUpdateIndexConfigurationByRepositoryIDFunc struct</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFunc
tags: [struct private]
```

```Go
type DBStoreUpdateIndexConfigurationByRepositoryIDFunc struct {
	defaultHook func(context.Context, int, []byte) error
	hooks       []func(context.Context, int, []byte) error
	history     []DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall
	mutex       sync.Mutex
}
```

DBStoreUpdateIndexConfigurationByRepositoryIDFunc describes the behavior when the UpdateIndexConfigurationByRepositoryID method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFunc.History" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.History">func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) History() []DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFunc.History
tags: [method private]
```

```Go
func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) History() []DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall
```

History returns a sequence of DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFunc.PushHook" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.PushHook">func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int, []byte) error)</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int, []byte) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the UpdateIndexConfigurationByRepositoryID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFunc.PushReturn" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.PushReturn">func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) PushReturn(r0 error)</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultHook" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultHook">func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int, []byte) error)</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int, []byte) error)
```

SetDefaultHook sets function that is called when the UpdateIndexConfigurationByRepositoryID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultReturn" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultReturn">func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFunc.appendCall" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.appendCall">func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) appendCall(r0 DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall)</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) appendCall(r0 DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall)
```

#### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFunc.nextHook" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFunc.nextHook">func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int, []byte) error</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreUpdateIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int, []byte) error
```

### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall">type DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall struct</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall
tags: [struct private]
```

```Go
type DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 []byte
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall is an object that describes an invocation of method UpdateIndexConfigurationByRepositoryID on an instance of MockDBStore. 

#### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall.Args" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall.Args">func (c DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall.Results" href="#DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall.Results">func (c DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreUpdateIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerDBStore" href="#EnqueuerDBStore">type EnqueuerDBStore enqueuer.DBStore</a>

```
searchKey: resolvers.EnqueuerDBStore
tags: [interface]
```

```Go
type EnqueuerDBStore = enqueuer.DBStore
```

### <a id="EnqueuerDBStoreDirtyRepositoriesFunc" href="#EnqueuerDBStoreDirtyRepositoriesFunc">type EnqueuerDBStoreDirtyRepositoriesFunc struct</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFunc
tags: [struct private]
```

```Go
type EnqueuerDBStoreDirtyRepositoriesFunc struct {
	defaultHook func(context.Context) (map[int]int, error)
	hooks       []func(context.Context) (map[int]int, error)
	history     []EnqueuerDBStoreDirtyRepositoriesFuncCall
	mutex       sync.Mutex
}
```

EnqueuerDBStoreDirtyRepositoriesFunc describes the behavior when the DirtyRepositories method of the parent MockEnqueuerDBStore instance is invoked. 

#### <a id="EnqueuerDBStoreDirtyRepositoriesFunc.History" href="#EnqueuerDBStoreDirtyRepositoriesFunc.History">func (f *EnqueuerDBStoreDirtyRepositoriesFunc) History() []EnqueuerDBStoreDirtyRepositoriesFuncCall</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDirtyRepositoriesFunc) History() []EnqueuerDBStoreDirtyRepositoriesFuncCall
```

History returns a sequence of EnqueuerDBStoreDirtyRepositoriesFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerDBStoreDirtyRepositoriesFunc.PushHook" href="#EnqueuerDBStoreDirtyRepositoriesFunc.PushHook">func (f *EnqueuerDBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DirtyRepositories method of the parent MockEnqueuerDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerDBStoreDirtyRepositoriesFunc.PushReturn" href="#EnqueuerDBStoreDirtyRepositoriesFunc.PushReturn">func (f *EnqueuerDBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreDirtyRepositoriesFunc.SetDefaultHook" href="#EnqueuerDBStoreDirtyRepositoriesFunc.SetDefaultHook">func (f *EnqueuerDBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))
```

SetDefaultHook sets function that is called when the DirtyRepositories method of the parent MockEnqueuerDBStore instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerDBStoreDirtyRepositoriesFunc.SetDefaultReturn" href="#EnqueuerDBStoreDirtyRepositoriesFunc.SetDefaultReturn">func (f *EnqueuerDBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreDirtyRepositoriesFunc.appendCall" href="#EnqueuerDBStoreDirtyRepositoriesFunc.appendCall">func (f *EnqueuerDBStoreDirtyRepositoriesFunc) appendCall(r0 EnqueuerDBStoreDirtyRepositoriesFuncCall)</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDirtyRepositoriesFunc) appendCall(r0 EnqueuerDBStoreDirtyRepositoriesFuncCall)
```

#### <a id="EnqueuerDBStoreDirtyRepositoriesFunc.nextHook" href="#EnqueuerDBStoreDirtyRepositoriesFunc.nextHook">func (f *EnqueuerDBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)
```

### <a id="EnqueuerDBStoreDirtyRepositoriesFuncCall" href="#EnqueuerDBStoreDirtyRepositoriesFuncCall">type EnqueuerDBStoreDirtyRepositoriesFuncCall struct</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFuncCall
tags: [struct private]
```

```Go
type EnqueuerDBStoreDirtyRepositoriesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 map[int]int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerDBStoreDirtyRepositoriesFuncCall is an object that describes an invocation of method DirtyRepositories on an instance of MockEnqueuerDBStore. 

#### <a id="EnqueuerDBStoreDirtyRepositoriesFuncCall.Args" href="#EnqueuerDBStoreDirtyRepositoriesFuncCall.Args">func (c EnqueuerDBStoreDirtyRepositoriesFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerDBStoreDirtyRepositoriesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerDBStoreDirtyRepositoriesFuncCall.Results" href="#EnqueuerDBStoreDirtyRepositoriesFuncCall.Results">func (c EnqueuerDBStoreDirtyRepositoriesFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreDirtyRepositoriesFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerDBStoreDirtyRepositoriesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerDBStoreDoneFunc" href="#EnqueuerDBStoreDoneFunc">type EnqueuerDBStoreDoneFunc struct</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFunc
tags: [struct private]
```

```Go
type EnqueuerDBStoreDoneFunc struct {
	defaultHook func(error) error
	hooks       []func(error) error
	history     []EnqueuerDBStoreDoneFuncCall
	mutex       sync.Mutex
}
```

EnqueuerDBStoreDoneFunc describes the behavior when the Done method of the parent MockEnqueuerDBStore instance is invoked. 

#### <a id="EnqueuerDBStoreDoneFunc.History" href="#EnqueuerDBStoreDoneFunc.History">func (f *EnqueuerDBStoreDoneFunc) History() []EnqueuerDBStoreDoneFuncCall</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDoneFunc) History() []EnqueuerDBStoreDoneFuncCall
```

History returns a sequence of EnqueuerDBStoreDoneFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerDBStoreDoneFunc.PushHook" href="#EnqueuerDBStoreDoneFunc.PushHook">func (f *EnqueuerDBStoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockEnqueuerDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerDBStoreDoneFunc.PushReturn" href="#EnqueuerDBStoreDoneFunc.PushReturn">func (f *EnqueuerDBStoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreDoneFunc.SetDefaultHook" href="#EnqueuerDBStoreDoneFunc.SetDefaultHook">func (f *EnqueuerDBStoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockEnqueuerDBStore instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerDBStoreDoneFunc.SetDefaultReturn" href="#EnqueuerDBStoreDoneFunc.SetDefaultReturn">func (f *EnqueuerDBStoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreDoneFunc.appendCall" href="#EnqueuerDBStoreDoneFunc.appendCall">func (f *EnqueuerDBStoreDoneFunc) appendCall(r0 EnqueuerDBStoreDoneFuncCall)</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDoneFunc) appendCall(r0 EnqueuerDBStoreDoneFuncCall)
```

#### <a id="EnqueuerDBStoreDoneFunc.nextHook" href="#EnqueuerDBStoreDoneFunc.nextHook">func (f *EnqueuerDBStoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreDoneFunc) nextHook() func(error) error
```

### <a id="EnqueuerDBStoreDoneFuncCall" href="#EnqueuerDBStoreDoneFuncCall">type EnqueuerDBStoreDoneFuncCall struct</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFuncCall
tags: [struct private]
```

```Go
type EnqueuerDBStoreDoneFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 error
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

EnqueuerDBStoreDoneFuncCall is an object that describes an invocation of method Done on an instance of MockEnqueuerDBStore. 

#### <a id="EnqueuerDBStoreDoneFuncCall.Args" href="#EnqueuerDBStoreDoneFuncCall.Args">func (c EnqueuerDBStoreDoneFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerDBStoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerDBStoreDoneFuncCall.Results" href="#EnqueuerDBStoreDoneFuncCall.Results">func (c EnqueuerDBStoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreDoneFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerDBStoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc">type EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc struct</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc
tags: [struct private]
```

```Go
type EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc struct {
	defaultHook func(context.Context, int) (dbstore.IndexConfiguration, bool, error)
	hooks       []func(context.Context, int) (dbstore.IndexConfiguration, bool, error)
	history     []EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall
	mutex       sync.Mutex
}
```

EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc describes the behavior when the GetIndexConfigurationByRepositoryID method of the parent MockEnqueuerDBStore instance is invoked. 

#### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.History" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.History">func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) History() []EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) History() []EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall
```

History returns a sequence of EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook">func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetIndexConfigurationByRepositoryID method of the parent MockEnqueuerDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn">func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) PushReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) PushReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook">func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))
```

SetDefaultHook sets function that is called when the GetIndexConfigurationByRepositoryID method of the parent MockEnqueuerDBStore instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn">func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall">func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) appendCall(r0 EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall)</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) appendCall(r0 EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall)
```

#### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook">func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int) (dbstore.IndexConfiguration, bool, error)</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int) (dbstore.IndexConfiguration, bool, error)
```

### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall">type EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall struct</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall
tags: [struct private]
```

```Go
type EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 dbstore.IndexConfiguration
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 bool
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall is an object that describes an invocation of method GetIndexConfigurationByRepositoryID on an instance of MockEnqueuerDBStore. 

#### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall.Args" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall.Args">func (c EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results" href="#EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results">func (c EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc">type EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc struct</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc
tags: [struct private]
```

```Go
type EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc struct {
	defaultHook func(context.Context) ([]int, error)
	hooks       []func(context.Context) ([]int, error)
	history     []EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall
	mutex       sync.Mutex
}
```

EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc describes the behavior when the GetRepositoriesWithIndexConfiguration method of the parent MockEnqueuerDBStore instance is invoked. 

#### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.History" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.History">func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) History() []EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) History() []EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall
```

History returns a sequence of EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook">func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) PushHook(hook func(context.Context) ([]int, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) PushHook(hook func(context.Context) ([]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetRepositoriesWithIndexConfiguration method of the parent MockEnqueuerDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn">func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) PushReturn(r0 []int, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) PushReturn(r0 []int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook">func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultHook(hook func(context.Context) ([]int, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultHook(hook func(context.Context) ([]int, error))
```

SetDefaultHook sets function that is called when the GetRepositoriesWithIndexConfiguration method of the parent MockEnqueuerDBStore instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn">func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultReturn(r0 []int, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultReturn(r0 []int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall">func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) appendCall(r0 EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall)</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) appendCall(r0 EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall)
```

#### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook">func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) nextHook() func(context.Context) ([]int, error)</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc) nextHook() func(context.Context) ([]int, error)
```

### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall">type EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall struct</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall
tags: [struct private]
```

```Go
type EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall is an object that describes an invocation of method GetRepositoriesWithIndexConfiguration on an instance of MockEnqueuerDBStore. 

#### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args">func (c EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results" href="#EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results">func (c EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerDBStoreHandleFunc" href="#EnqueuerDBStoreHandleFunc">type EnqueuerDBStoreHandleFunc struct</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFunc
tags: [struct private]
```

```Go
type EnqueuerDBStoreHandleFunc struct {
	defaultHook func() *basestore.TransactableHandle
	hooks       []func() *basestore.TransactableHandle
	history     []EnqueuerDBStoreHandleFuncCall
	mutex       sync.Mutex
}
```

EnqueuerDBStoreHandleFunc describes the behavior when the Handle method of the parent MockEnqueuerDBStore instance is invoked. 

#### <a id="EnqueuerDBStoreHandleFunc.History" href="#EnqueuerDBStoreHandleFunc.History">func (f *EnqueuerDBStoreHandleFunc) History() []EnqueuerDBStoreHandleFuncCall</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreHandleFunc) History() []EnqueuerDBStoreHandleFuncCall
```

History returns a sequence of EnqueuerDBStoreHandleFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerDBStoreHandleFunc.PushHook" href="#EnqueuerDBStoreHandleFunc.PushHook">func (f *EnqueuerDBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)
```

PushHook adds a function to the end of hook queue. Each invocation of the Handle method of the parent MockEnqueuerDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerDBStoreHandleFunc.PushReturn" href="#EnqueuerDBStoreHandleFunc.PushReturn">func (f *EnqueuerDBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreHandleFunc.SetDefaultHook" href="#EnqueuerDBStoreHandleFunc.SetDefaultHook">func (f *EnqueuerDBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)
```

SetDefaultHook sets function that is called when the Handle method of the parent MockEnqueuerDBStore instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerDBStoreHandleFunc.SetDefaultReturn" href="#EnqueuerDBStoreHandleFunc.SetDefaultReturn">func (f *EnqueuerDBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreHandleFunc.appendCall" href="#EnqueuerDBStoreHandleFunc.appendCall">func (f *EnqueuerDBStoreHandleFunc) appendCall(r0 EnqueuerDBStoreHandleFuncCall)</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreHandleFunc) appendCall(r0 EnqueuerDBStoreHandleFuncCall)
```

#### <a id="EnqueuerDBStoreHandleFunc.nextHook" href="#EnqueuerDBStoreHandleFunc.nextHook">func (f *EnqueuerDBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle
```

### <a id="EnqueuerDBStoreHandleFuncCall" href="#EnqueuerDBStoreHandleFuncCall">type EnqueuerDBStoreHandleFuncCall struct</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFuncCall
tags: [struct private]
```

```Go
type EnqueuerDBStoreHandleFuncCall struct {
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *basestore.TransactableHandle
}
```

EnqueuerDBStoreHandleFuncCall is an object that describes an invocation of method Handle on an instance of MockEnqueuerDBStore. 

#### <a id="EnqueuerDBStoreHandleFuncCall.Args" href="#EnqueuerDBStoreHandleFuncCall.Args">func (c EnqueuerDBStoreHandleFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerDBStoreHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerDBStoreHandleFuncCall.Results" href="#EnqueuerDBStoreHandleFuncCall.Results">func (c EnqueuerDBStoreHandleFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreHandleFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerDBStoreHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerDBStoreInsertIndexFunc" href="#EnqueuerDBStoreInsertIndexFunc">type EnqueuerDBStoreInsertIndexFunc struct</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFunc
tags: [struct private]
```

```Go
type EnqueuerDBStoreInsertIndexFunc struct {
	defaultHook func(context.Context, dbstore.Index) (int, error)
	hooks       []func(context.Context, dbstore.Index) (int, error)
	history     []EnqueuerDBStoreInsertIndexFuncCall
	mutex       sync.Mutex
}
```

EnqueuerDBStoreInsertIndexFunc describes the behavior when the InsertIndex method of the parent MockEnqueuerDBStore instance is invoked. 

#### <a id="EnqueuerDBStoreInsertIndexFunc.History" href="#EnqueuerDBStoreInsertIndexFunc.History">func (f *EnqueuerDBStoreInsertIndexFunc) History() []EnqueuerDBStoreInsertIndexFuncCall</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreInsertIndexFunc) History() []EnqueuerDBStoreInsertIndexFuncCall
```

History returns a sequence of EnqueuerDBStoreInsertIndexFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerDBStoreInsertIndexFunc.PushHook" href="#EnqueuerDBStoreInsertIndexFunc.PushHook">func (f *EnqueuerDBStoreInsertIndexFunc) PushHook(hook func(context.Context, dbstore.Index) (int, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreInsertIndexFunc) PushHook(hook func(context.Context, dbstore.Index) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the InsertIndex method of the parent MockEnqueuerDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerDBStoreInsertIndexFunc.PushReturn" href="#EnqueuerDBStoreInsertIndexFunc.PushReturn">func (f *EnqueuerDBStoreInsertIndexFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreInsertIndexFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreInsertIndexFunc.SetDefaultHook" href="#EnqueuerDBStoreInsertIndexFunc.SetDefaultHook">func (f *EnqueuerDBStoreInsertIndexFunc) SetDefaultHook(hook func(context.Context, dbstore.Index) (int, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreInsertIndexFunc) SetDefaultHook(hook func(context.Context, dbstore.Index) (int, error))
```

SetDefaultHook sets function that is called when the InsertIndex method of the parent MockEnqueuerDBStore instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerDBStoreInsertIndexFunc.SetDefaultReturn" href="#EnqueuerDBStoreInsertIndexFunc.SetDefaultReturn">func (f *EnqueuerDBStoreInsertIndexFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreInsertIndexFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreInsertIndexFunc.appendCall" href="#EnqueuerDBStoreInsertIndexFunc.appendCall">func (f *EnqueuerDBStoreInsertIndexFunc) appendCall(r0 EnqueuerDBStoreInsertIndexFuncCall)</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreInsertIndexFunc) appendCall(r0 EnqueuerDBStoreInsertIndexFuncCall)
```

#### <a id="EnqueuerDBStoreInsertIndexFunc.nextHook" href="#EnqueuerDBStoreInsertIndexFunc.nextHook">func (f *EnqueuerDBStoreInsertIndexFunc) nextHook() func(context.Context, dbstore.Index) (int, error)</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreInsertIndexFunc) nextHook() func(context.Context, dbstore.Index) (int, error)
```

### <a id="EnqueuerDBStoreInsertIndexFuncCall" href="#EnqueuerDBStoreInsertIndexFuncCall">type EnqueuerDBStoreInsertIndexFuncCall struct</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFuncCall
tags: [struct private]
```

```Go
type EnqueuerDBStoreInsertIndexFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 dbstore.Index
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerDBStoreInsertIndexFuncCall is an object that describes an invocation of method InsertIndex on an instance of MockEnqueuerDBStore. 

#### <a id="EnqueuerDBStoreInsertIndexFuncCall.Args" href="#EnqueuerDBStoreInsertIndexFuncCall.Args">func (c EnqueuerDBStoreInsertIndexFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerDBStoreInsertIndexFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerDBStoreInsertIndexFuncCall.Results" href="#EnqueuerDBStoreInsertIndexFuncCall.Results">func (c EnqueuerDBStoreInsertIndexFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreInsertIndexFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerDBStoreInsertIndexFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerDBStoreIsQueuedFunc" href="#EnqueuerDBStoreIsQueuedFunc">type EnqueuerDBStoreIsQueuedFunc struct</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFunc
tags: [struct private]
```

```Go
type EnqueuerDBStoreIsQueuedFunc struct {
	defaultHook func(context.Context, int, string) (bool, error)
	hooks       []func(context.Context, int, string) (bool, error)
	history     []EnqueuerDBStoreIsQueuedFuncCall
	mutex       sync.Mutex
}
```

EnqueuerDBStoreIsQueuedFunc describes the behavior when the IsQueued method of the parent MockEnqueuerDBStore instance is invoked. 

#### <a id="EnqueuerDBStoreIsQueuedFunc.History" href="#EnqueuerDBStoreIsQueuedFunc.History">func (f *EnqueuerDBStoreIsQueuedFunc) History() []EnqueuerDBStoreIsQueuedFuncCall</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreIsQueuedFunc) History() []EnqueuerDBStoreIsQueuedFuncCall
```

History returns a sequence of EnqueuerDBStoreIsQueuedFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerDBStoreIsQueuedFunc.PushHook" href="#EnqueuerDBStoreIsQueuedFunc.PushHook">func (f *EnqueuerDBStoreIsQueuedFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreIsQueuedFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the IsQueued method of the parent MockEnqueuerDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerDBStoreIsQueuedFunc.PushReturn" href="#EnqueuerDBStoreIsQueuedFunc.PushReturn">func (f *EnqueuerDBStoreIsQueuedFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreIsQueuedFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreIsQueuedFunc.SetDefaultHook" href="#EnqueuerDBStoreIsQueuedFunc.SetDefaultHook">func (f *EnqueuerDBStoreIsQueuedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreIsQueuedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the IsQueued method of the parent MockEnqueuerDBStore instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerDBStoreIsQueuedFunc.SetDefaultReturn" href="#EnqueuerDBStoreIsQueuedFunc.SetDefaultReturn">func (f *EnqueuerDBStoreIsQueuedFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreIsQueuedFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreIsQueuedFunc.appendCall" href="#EnqueuerDBStoreIsQueuedFunc.appendCall">func (f *EnqueuerDBStoreIsQueuedFunc) appendCall(r0 EnqueuerDBStoreIsQueuedFuncCall)</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreIsQueuedFunc) appendCall(r0 EnqueuerDBStoreIsQueuedFuncCall)
```

#### <a id="EnqueuerDBStoreIsQueuedFunc.nextHook" href="#EnqueuerDBStoreIsQueuedFunc.nextHook">func (f *EnqueuerDBStoreIsQueuedFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreIsQueuedFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="EnqueuerDBStoreIsQueuedFuncCall" href="#EnqueuerDBStoreIsQueuedFuncCall">type EnqueuerDBStoreIsQueuedFuncCall struct</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFuncCall
tags: [struct private]
```

```Go
type EnqueuerDBStoreIsQueuedFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerDBStoreIsQueuedFuncCall is an object that describes an invocation of method IsQueued on an instance of MockEnqueuerDBStore. 

#### <a id="EnqueuerDBStoreIsQueuedFuncCall.Args" href="#EnqueuerDBStoreIsQueuedFuncCall.Args">func (c EnqueuerDBStoreIsQueuedFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerDBStoreIsQueuedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerDBStoreIsQueuedFuncCall.Results" href="#EnqueuerDBStoreIsQueuedFuncCall.Results">func (c EnqueuerDBStoreIsQueuedFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreIsQueuedFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerDBStoreIsQueuedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerDBStoreTransactFunc" href="#EnqueuerDBStoreTransactFunc">type EnqueuerDBStoreTransactFunc struct</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFunc
tags: [struct private]
```

```Go
type EnqueuerDBStoreTransactFunc struct {
	defaultHook func(context.Context) (enqueuer.DBStore, error)
	hooks       []func(context.Context) (enqueuer.DBStore, error)
	history     []EnqueuerDBStoreTransactFuncCall
	mutex       sync.Mutex
}
```

EnqueuerDBStoreTransactFunc describes the behavior when the Transact method of the parent MockEnqueuerDBStore instance is invoked. 

#### <a id="EnqueuerDBStoreTransactFunc.History" href="#EnqueuerDBStoreTransactFunc.History">func (f *EnqueuerDBStoreTransactFunc) History() []EnqueuerDBStoreTransactFuncCall</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreTransactFunc) History() []EnqueuerDBStoreTransactFuncCall
```

History returns a sequence of EnqueuerDBStoreTransactFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerDBStoreTransactFunc.PushHook" href="#EnqueuerDBStoreTransactFunc.PushHook">func (f *EnqueuerDBStoreTransactFunc) PushHook(hook func(context.Context) (enqueuer.DBStore, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreTransactFunc) PushHook(hook func(context.Context) (enqueuer.DBStore, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Transact method of the parent MockEnqueuerDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerDBStoreTransactFunc.PushReturn" href="#EnqueuerDBStoreTransactFunc.PushReturn">func (f *EnqueuerDBStoreTransactFunc) PushReturn(r0 enqueuer.DBStore, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreTransactFunc) PushReturn(r0 enqueuer.DBStore, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreTransactFunc.SetDefaultHook" href="#EnqueuerDBStoreTransactFunc.SetDefaultHook">func (f *EnqueuerDBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (enqueuer.DBStore, error))</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (enqueuer.DBStore, error))
```

SetDefaultHook sets function that is called when the Transact method of the parent MockEnqueuerDBStore instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerDBStoreTransactFunc.SetDefaultReturn" href="#EnqueuerDBStoreTransactFunc.SetDefaultReturn">func (f *EnqueuerDBStoreTransactFunc) SetDefaultReturn(r0 enqueuer.DBStore, r1 error)</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreTransactFunc) SetDefaultReturn(r0 enqueuer.DBStore, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerDBStoreTransactFunc.appendCall" href="#EnqueuerDBStoreTransactFunc.appendCall">func (f *EnqueuerDBStoreTransactFunc) appendCall(r0 EnqueuerDBStoreTransactFuncCall)</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreTransactFunc) appendCall(r0 EnqueuerDBStoreTransactFuncCall)
```

#### <a id="EnqueuerDBStoreTransactFunc.nextHook" href="#EnqueuerDBStoreTransactFunc.nextHook">func (f *EnqueuerDBStoreTransactFunc) nextHook() func(context.Context) (enqueuer.DBStore, error)</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerDBStoreTransactFunc) nextHook() func(context.Context) (enqueuer.DBStore, error)
```

### <a id="EnqueuerDBStoreTransactFuncCall" href="#EnqueuerDBStoreTransactFuncCall">type EnqueuerDBStoreTransactFuncCall struct</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFuncCall
tags: [struct private]
```

```Go
type EnqueuerDBStoreTransactFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 enqueuer.DBStore
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerDBStoreTransactFuncCall is an object that describes an invocation of method Transact on an instance of MockEnqueuerDBStore. 

#### <a id="EnqueuerDBStoreTransactFuncCall.Args" href="#EnqueuerDBStoreTransactFuncCall.Args">func (c EnqueuerDBStoreTransactFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerDBStoreTransactFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerDBStoreTransactFuncCall.Results" href="#EnqueuerDBStoreTransactFuncCall.Results">func (c EnqueuerDBStoreTransactFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerDBStoreTransactFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerDBStoreTransactFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerGitserverClient" href="#EnqueuerGitserverClient">type EnqueuerGitserverClient enqueuer.GitserverClient</a>

```
searchKey: resolvers.EnqueuerGitserverClient
tags: [interface]
```

```Go
type EnqueuerGitserverClient = enqueuer.GitserverClient
```

### <a id="EnqueuerGitserverClientFileExistsFunc" href="#EnqueuerGitserverClientFileExistsFunc">type EnqueuerGitserverClientFileExistsFunc struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFunc
tags: [struct private]
```

```Go
type EnqueuerGitserverClientFileExistsFunc struct {
	defaultHook func(context.Context, int, string, string) (bool, error)
	hooks       []func(context.Context, int, string, string) (bool, error)
	history     []EnqueuerGitserverClientFileExistsFuncCall
	mutex       sync.Mutex
}
```

EnqueuerGitserverClientFileExistsFunc describes the behavior when the FileExists method of the parent MockEnqueuerGitserverClient instance is invoked. 

#### <a id="EnqueuerGitserverClientFileExistsFunc.History" href="#EnqueuerGitserverClientFileExistsFunc.History">func (f *EnqueuerGitserverClientFileExistsFunc) History() []EnqueuerGitserverClientFileExistsFuncCall</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientFileExistsFunc) History() []EnqueuerGitserverClientFileExistsFuncCall
```

History returns a sequence of EnqueuerGitserverClientFileExistsFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerGitserverClientFileExistsFunc.PushHook" href="#EnqueuerGitserverClientFileExistsFunc.PushHook">func (f *EnqueuerGitserverClientFileExistsFunc) PushHook(hook func(context.Context, int, string, string) (bool, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientFileExistsFunc) PushHook(hook func(context.Context, int, string, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the FileExists method of the parent MockEnqueuerGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerGitserverClientFileExistsFunc.PushReturn" href="#EnqueuerGitserverClientFileExistsFunc.PushReturn">func (f *EnqueuerGitserverClientFileExistsFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientFileExistsFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientFileExistsFunc.SetDefaultHook" href="#EnqueuerGitserverClientFileExistsFunc.SetDefaultHook">func (f *EnqueuerGitserverClientFileExistsFunc) SetDefaultHook(hook func(context.Context, int, string, string) (bool, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientFileExistsFunc) SetDefaultHook(hook func(context.Context, int, string, string) (bool, error))
```

SetDefaultHook sets function that is called when the FileExists method of the parent MockEnqueuerGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerGitserverClientFileExistsFunc.SetDefaultReturn" href="#EnqueuerGitserverClientFileExistsFunc.SetDefaultReturn">func (f *EnqueuerGitserverClientFileExistsFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientFileExistsFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientFileExistsFunc.appendCall" href="#EnqueuerGitserverClientFileExistsFunc.appendCall">func (f *EnqueuerGitserverClientFileExistsFunc) appendCall(r0 EnqueuerGitserverClientFileExistsFuncCall)</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientFileExistsFunc) appendCall(r0 EnqueuerGitserverClientFileExistsFuncCall)
```

#### <a id="EnqueuerGitserverClientFileExistsFunc.nextHook" href="#EnqueuerGitserverClientFileExistsFunc.nextHook">func (f *EnqueuerGitserverClientFileExistsFunc) nextHook() func(context.Context, int, string, string) (bool, error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientFileExistsFunc) nextHook() func(context.Context, int, string, string) (bool, error)
```

### <a id="EnqueuerGitserverClientFileExistsFuncCall" href="#EnqueuerGitserverClientFileExistsFuncCall">type EnqueuerGitserverClientFileExistsFuncCall struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFuncCall
tags: [struct private]
```

```Go
type EnqueuerGitserverClientFileExistsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerGitserverClientFileExistsFuncCall is an object that describes an invocation of method FileExists on an instance of MockEnqueuerGitserverClient. 

#### <a id="EnqueuerGitserverClientFileExistsFuncCall.Args" href="#EnqueuerGitserverClientFileExistsFuncCall.Args">func (c EnqueuerGitserverClientFileExistsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientFileExistsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerGitserverClientFileExistsFuncCall.Results" href="#EnqueuerGitserverClientFileExistsFuncCall.Results">func (c EnqueuerGitserverClientFileExistsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientFileExistsFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientFileExistsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerGitserverClientHeadFunc" href="#EnqueuerGitserverClientHeadFunc">type EnqueuerGitserverClientHeadFunc struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFunc
tags: [struct private]
```

```Go
type EnqueuerGitserverClientHeadFunc struct {
	defaultHook func(context.Context, int) (string, error)
	hooks       []func(context.Context, int) (string, error)
	history     []EnqueuerGitserverClientHeadFuncCall
	mutex       sync.Mutex
}
```

EnqueuerGitserverClientHeadFunc describes the behavior when the Head method of the parent MockEnqueuerGitserverClient instance is invoked. 

#### <a id="EnqueuerGitserverClientHeadFunc.History" href="#EnqueuerGitserverClientHeadFunc.History">func (f *EnqueuerGitserverClientHeadFunc) History() []EnqueuerGitserverClientHeadFuncCall</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientHeadFunc) History() []EnqueuerGitserverClientHeadFuncCall
```

History returns a sequence of EnqueuerGitserverClientHeadFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerGitserverClientHeadFunc.PushHook" href="#EnqueuerGitserverClientHeadFunc.PushHook">func (f *EnqueuerGitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Head method of the parent MockEnqueuerGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerGitserverClientHeadFunc.PushReturn" href="#EnqueuerGitserverClientHeadFunc.PushReturn">func (f *EnqueuerGitserverClientHeadFunc) PushReturn(r0 string, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientHeadFunc) PushReturn(r0 string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientHeadFunc.SetDefaultHook" href="#EnqueuerGitserverClientHeadFunc.SetDefaultHook">func (f *EnqueuerGitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))
```

SetDefaultHook sets function that is called when the Head method of the parent MockEnqueuerGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerGitserverClientHeadFunc.SetDefaultReturn" href="#EnqueuerGitserverClientHeadFunc.SetDefaultReturn">func (f *EnqueuerGitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientHeadFunc.appendCall" href="#EnqueuerGitserverClientHeadFunc.appendCall">func (f *EnqueuerGitserverClientHeadFunc) appendCall(r0 EnqueuerGitserverClientHeadFuncCall)</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientHeadFunc) appendCall(r0 EnqueuerGitserverClientHeadFuncCall)
```

#### <a id="EnqueuerGitserverClientHeadFunc.nextHook" href="#EnqueuerGitserverClientHeadFunc.nextHook">func (f *EnqueuerGitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)
```

### <a id="EnqueuerGitserverClientHeadFuncCall" href="#EnqueuerGitserverClientHeadFuncCall">type EnqueuerGitserverClientHeadFuncCall struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFuncCall
tags: [struct private]
```

```Go
type EnqueuerGitserverClientHeadFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerGitserverClientHeadFuncCall is an object that describes an invocation of method Head on an instance of MockEnqueuerGitserverClient. 

#### <a id="EnqueuerGitserverClientHeadFuncCall.Args" href="#EnqueuerGitserverClientHeadFuncCall.Args">func (c EnqueuerGitserverClientHeadFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientHeadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerGitserverClientHeadFuncCall.Results" href="#EnqueuerGitserverClientHeadFuncCall.Results">func (c EnqueuerGitserverClientHeadFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientHeadFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientHeadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerGitserverClientListFilesFunc" href="#EnqueuerGitserverClientListFilesFunc">type EnqueuerGitserverClientListFilesFunc struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFunc
tags: [struct private]
```

```Go
type EnqueuerGitserverClientListFilesFunc struct {
	defaultHook func(context.Context, int, string, *regexp.Regexp) ([]string, error)
	hooks       []func(context.Context, int, string, *regexp.Regexp) ([]string, error)
	history     []EnqueuerGitserverClientListFilesFuncCall
	mutex       sync.Mutex
}
```

EnqueuerGitserverClientListFilesFunc describes the behavior when the ListFiles method of the parent MockEnqueuerGitserverClient instance is invoked. 

#### <a id="EnqueuerGitserverClientListFilesFunc.History" href="#EnqueuerGitserverClientListFilesFunc.History">func (f *EnqueuerGitserverClientListFilesFunc) History() []EnqueuerGitserverClientListFilesFuncCall</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientListFilesFunc) History() []EnqueuerGitserverClientListFilesFuncCall
```

History returns a sequence of EnqueuerGitserverClientListFilesFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerGitserverClientListFilesFunc.PushHook" href="#EnqueuerGitserverClientListFilesFunc.PushHook">func (f *EnqueuerGitserverClientListFilesFunc) PushHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientListFilesFunc) PushHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ListFiles method of the parent MockEnqueuerGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerGitserverClientListFilesFunc.PushReturn" href="#EnqueuerGitserverClientListFilesFunc.PushReturn">func (f *EnqueuerGitserverClientListFilesFunc) PushReturn(r0 []string, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientListFilesFunc) PushReturn(r0 []string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientListFilesFunc.SetDefaultHook" href="#EnqueuerGitserverClientListFilesFunc.SetDefaultHook">func (f *EnqueuerGitserverClientListFilesFunc) SetDefaultHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientListFilesFunc) SetDefaultHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))
```

SetDefaultHook sets function that is called when the ListFiles method of the parent MockEnqueuerGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerGitserverClientListFilesFunc.SetDefaultReturn" href="#EnqueuerGitserverClientListFilesFunc.SetDefaultReturn">func (f *EnqueuerGitserverClientListFilesFunc) SetDefaultReturn(r0 []string, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientListFilesFunc) SetDefaultReturn(r0 []string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientListFilesFunc.appendCall" href="#EnqueuerGitserverClientListFilesFunc.appendCall">func (f *EnqueuerGitserverClientListFilesFunc) appendCall(r0 EnqueuerGitserverClientListFilesFuncCall)</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientListFilesFunc) appendCall(r0 EnqueuerGitserverClientListFilesFuncCall)
```

#### <a id="EnqueuerGitserverClientListFilesFunc.nextHook" href="#EnqueuerGitserverClientListFilesFunc.nextHook">func (f *EnqueuerGitserverClientListFilesFunc) nextHook() func(context.Context, int, string, *regexp.Regexp) ([]string, error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientListFilesFunc) nextHook() func(context.Context, int, string, *regexp.Regexp) ([]string, error)
```

### <a id="EnqueuerGitserverClientListFilesFuncCall" href="#EnqueuerGitserverClientListFilesFuncCall">type EnqueuerGitserverClientListFilesFuncCall struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFuncCall
tags: [struct private]
```

```Go
type EnqueuerGitserverClientListFilesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 *regexp.Regexp
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerGitserverClientListFilesFuncCall is an object that describes an invocation of method ListFiles on an instance of MockEnqueuerGitserverClient. 

#### <a id="EnqueuerGitserverClientListFilesFuncCall.Args" href="#EnqueuerGitserverClientListFilesFuncCall.Args">func (c EnqueuerGitserverClientListFilesFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientListFilesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerGitserverClientListFilesFuncCall.Results" href="#EnqueuerGitserverClientListFilesFuncCall.Results">func (c EnqueuerGitserverClientListFilesFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientListFilesFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientListFilesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerGitserverClientRawContentsFunc" href="#EnqueuerGitserverClientRawContentsFunc">type EnqueuerGitserverClientRawContentsFunc struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFunc
tags: [struct private]
```

```Go
type EnqueuerGitserverClientRawContentsFunc struct {
	defaultHook func(context.Context, int, string, string) ([]byte, error)
	hooks       []func(context.Context, int, string, string) ([]byte, error)
	history     []EnqueuerGitserverClientRawContentsFuncCall
	mutex       sync.Mutex
}
```

EnqueuerGitserverClientRawContentsFunc describes the behavior when the RawContents method of the parent MockEnqueuerGitserverClient instance is invoked. 

#### <a id="EnqueuerGitserverClientRawContentsFunc.History" href="#EnqueuerGitserverClientRawContentsFunc.History">func (f *EnqueuerGitserverClientRawContentsFunc) History() []EnqueuerGitserverClientRawContentsFuncCall</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientRawContentsFunc) History() []EnqueuerGitserverClientRawContentsFuncCall
```

History returns a sequence of EnqueuerGitserverClientRawContentsFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerGitserverClientRawContentsFunc.PushHook" href="#EnqueuerGitserverClientRawContentsFunc.PushHook">func (f *EnqueuerGitserverClientRawContentsFunc) PushHook(hook func(context.Context, int, string, string) ([]byte, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientRawContentsFunc) PushHook(hook func(context.Context, int, string, string) ([]byte, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the RawContents method of the parent MockEnqueuerGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerGitserverClientRawContentsFunc.PushReturn" href="#EnqueuerGitserverClientRawContentsFunc.PushReturn">func (f *EnqueuerGitserverClientRawContentsFunc) PushReturn(r0 []byte, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientRawContentsFunc) PushReturn(r0 []byte, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientRawContentsFunc.SetDefaultHook" href="#EnqueuerGitserverClientRawContentsFunc.SetDefaultHook">func (f *EnqueuerGitserverClientRawContentsFunc) SetDefaultHook(hook func(context.Context, int, string, string) ([]byte, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientRawContentsFunc) SetDefaultHook(hook func(context.Context, int, string, string) ([]byte, error))
```

SetDefaultHook sets function that is called when the RawContents method of the parent MockEnqueuerGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerGitserverClientRawContentsFunc.SetDefaultReturn" href="#EnqueuerGitserverClientRawContentsFunc.SetDefaultReturn">func (f *EnqueuerGitserverClientRawContentsFunc) SetDefaultReturn(r0 []byte, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientRawContentsFunc) SetDefaultReturn(r0 []byte, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientRawContentsFunc.appendCall" href="#EnqueuerGitserverClientRawContentsFunc.appendCall">func (f *EnqueuerGitserverClientRawContentsFunc) appendCall(r0 EnqueuerGitserverClientRawContentsFuncCall)</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientRawContentsFunc) appendCall(r0 EnqueuerGitserverClientRawContentsFuncCall)
```

#### <a id="EnqueuerGitserverClientRawContentsFunc.nextHook" href="#EnqueuerGitserverClientRawContentsFunc.nextHook">func (f *EnqueuerGitserverClientRawContentsFunc) nextHook() func(context.Context, int, string, string) ([]byte, error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientRawContentsFunc) nextHook() func(context.Context, int, string, string) ([]byte, error)
```

### <a id="EnqueuerGitserverClientRawContentsFuncCall" href="#EnqueuerGitserverClientRawContentsFuncCall">type EnqueuerGitserverClientRawContentsFuncCall struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFuncCall
tags: [struct private]
```

```Go
type EnqueuerGitserverClientRawContentsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []byte
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerGitserverClientRawContentsFuncCall is an object that describes an invocation of method RawContents on an instance of MockEnqueuerGitserverClient. 

#### <a id="EnqueuerGitserverClientRawContentsFuncCall.Args" href="#EnqueuerGitserverClientRawContentsFuncCall.Args">func (c EnqueuerGitserverClientRawContentsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientRawContentsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerGitserverClientRawContentsFuncCall.Results" href="#EnqueuerGitserverClientRawContentsFuncCall.Results">func (c EnqueuerGitserverClientRawContentsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientRawContentsFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientRawContentsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="EnqueuerGitserverClientResolveRevisionFunc" href="#EnqueuerGitserverClientResolveRevisionFunc">type EnqueuerGitserverClientResolveRevisionFunc struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFunc
tags: [struct private]
```

```Go
type EnqueuerGitserverClientResolveRevisionFunc struct {
	defaultHook func(context.Context, int, string) (api.CommitID, error)
	hooks       []func(context.Context, int, string) (api.CommitID, error)
	history     []EnqueuerGitserverClientResolveRevisionFuncCall
	mutex       sync.Mutex
}
```

EnqueuerGitserverClientResolveRevisionFunc describes the behavior when the ResolveRevision method of the parent MockEnqueuerGitserverClient instance is invoked. 

#### <a id="EnqueuerGitserverClientResolveRevisionFunc.History" href="#EnqueuerGitserverClientResolveRevisionFunc.History">func (f *EnqueuerGitserverClientResolveRevisionFunc) History() []EnqueuerGitserverClientResolveRevisionFuncCall</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFunc.History
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientResolveRevisionFunc) History() []EnqueuerGitserverClientResolveRevisionFuncCall
```

History returns a sequence of EnqueuerGitserverClientResolveRevisionFuncCall objects describing the invocations of this function. 

#### <a id="EnqueuerGitserverClientResolveRevisionFunc.PushHook" href="#EnqueuerGitserverClientResolveRevisionFunc.PushHook">func (f *EnqueuerGitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFunc.PushHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ResolveRevision method of the parent MockEnqueuerGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="EnqueuerGitserverClientResolveRevisionFunc.PushReturn" href="#EnqueuerGitserverClientResolveRevisionFunc.PushReturn">func (f *EnqueuerGitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFunc.PushReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientResolveRevisionFunc.SetDefaultHook" href="#EnqueuerGitserverClientResolveRevisionFunc.SetDefaultHook">func (f *EnqueuerGitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))
```

SetDefaultHook sets function that is called when the ResolveRevision method of the parent MockEnqueuerGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="EnqueuerGitserverClientResolveRevisionFunc.SetDefaultReturn" href="#EnqueuerGitserverClientResolveRevisionFunc.SetDefaultReturn">func (f *EnqueuerGitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="EnqueuerGitserverClientResolveRevisionFunc.appendCall" href="#EnqueuerGitserverClientResolveRevisionFunc.appendCall">func (f *EnqueuerGitserverClientResolveRevisionFunc) appendCall(r0 EnqueuerGitserverClientResolveRevisionFuncCall)</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFunc.appendCall
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientResolveRevisionFunc) appendCall(r0 EnqueuerGitserverClientResolveRevisionFuncCall)
```

#### <a id="EnqueuerGitserverClientResolveRevisionFunc.nextHook" href="#EnqueuerGitserverClientResolveRevisionFunc.nextHook">func (f *EnqueuerGitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFunc.nextHook
tags: [method private]
```

```Go
func (f *EnqueuerGitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)
```

### <a id="EnqueuerGitserverClientResolveRevisionFuncCall" href="#EnqueuerGitserverClientResolveRevisionFuncCall">type EnqueuerGitserverClientResolveRevisionFuncCall struct</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFuncCall
tags: [struct private]
```

```Go
type EnqueuerGitserverClientResolveRevisionFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 api.CommitID
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

EnqueuerGitserverClientResolveRevisionFuncCall is an object that describes an invocation of method ResolveRevision on an instance of MockEnqueuerGitserverClient. 

#### <a id="EnqueuerGitserverClientResolveRevisionFuncCall.Args" href="#EnqueuerGitserverClientResolveRevisionFuncCall.Args">func (c EnqueuerGitserverClientResolveRevisionFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFuncCall.Args
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientResolveRevisionFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="EnqueuerGitserverClientResolveRevisionFuncCall.Results" href="#EnqueuerGitserverClientResolveRevisionFuncCall.Results">func (c EnqueuerGitserverClientResolveRevisionFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.EnqueuerGitserverClientResolveRevisionFuncCall.Results
tags: [method private]
```

```Go
func (c EnqueuerGitserverClientResolveRevisionFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClient" href="#GitserverClient">type GitserverClient interface</a>

```
searchKey: resolvers.GitserverClient
tags: [interface]
```

```Go
type GitserverClient interface {
	CommitExists(ctx context.Context, repositoryID int, commit string) (bool, error)
	CommitGraph(ctx context.Context, repositoryID int, options gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
}
```

### <a id="GitserverClientCommitExistsFunc" href="#GitserverClientCommitExistsFunc">type GitserverClientCommitExistsFunc struct</a>

```
searchKey: resolvers.GitserverClientCommitExistsFunc
tags: [struct private]
```

```Go
type GitserverClientCommitExistsFunc struct {
	defaultHook func(context.Context, int, string) (bool, error)
	hooks       []func(context.Context, int, string) (bool, error)
	history     []GitserverClientCommitExistsFuncCall
	mutex       sync.Mutex
}
```

GitserverClientCommitExistsFunc describes the behavior when the CommitExists method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientCommitExistsFunc.History" href="#GitserverClientCommitExistsFunc.History">func (f *GitserverClientCommitExistsFunc) History() []GitserverClientCommitExistsFuncCall</a>

```
searchKey: resolvers.GitserverClientCommitExistsFunc.History
tags: [method private]
```

```Go
func (f *GitserverClientCommitExistsFunc) History() []GitserverClientCommitExistsFuncCall
```

History returns a sequence of GitserverClientCommitExistsFuncCall objects describing the invocations of this function. 

#### <a id="GitserverClientCommitExistsFunc.PushHook" href="#GitserverClientCommitExistsFunc.PushHook">func (f *GitserverClientCommitExistsFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: resolvers.GitserverClientCommitExistsFunc.PushHook
tags: [method private]
```

```Go
func (f *GitserverClientCommitExistsFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CommitExists method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientCommitExistsFunc.PushReturn" href="#GitserverClientCommitExistsFunc.PushReturn">func (f *GitserverClientCommitExistsFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.GitserverClientCommitExistsFunc.PushReturn
tags: [method private]
```

```Go
func (f *GitserverClientCommitExistsFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitExistsFunc.SetDefaultHook" href="#GitserverClientCommitExistsFunc.SetDefaultHook">func (f *GitserverClientCommitExistsFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: resolvers.GitserverClientCommitExistsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *GitserverClientCommitExistsFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the CommitExists method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientCommitExistsFunc.SetDefaultReturn" href="#GitserverClientCommitExistsFunc.SetDefaultReturn">func (f *GitserverClientCommitExistsFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.GitserverClientCommitExistsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *GitserverClientCommitExistsFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitExistsFunc.appendCall" href="#GitserverClientCommitExistsFunc.appendCall">func (f *GitserverClientCommitExistsFunc) appendCall(r0 GitserverClientCommitExistsFuncCall)</a>

```
searchKey: resolvers.GitserverClientCommitExistsFunc.appendCall
tags: [method private]
```

```Go
func (f *GitserverClientCommitExistsFunc) appendCall(r0 GitserverClientCommitExistsFuncCall)
```

#### <a id="GitserverClientCommitExistsFunc.nextHook" href="#GitserverClientCommitExistsFunc.nextHook">func (f *GitserverClientCommitExistsFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: resolvers.GitserverClientCommitExistsFunc.nextHook
tags: [method private]
```

```Go
func (f *GitserverClientCommitExistsFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="GitserverClientCommitExistsFuncCall" href="#GitserverClientCommitExistsFuncCall">type GitserverClientCommitExistsFuncCall struct</a>

```
searchKey: resolvers.GitserverClientCommitExistsFuncCall
tags: [struct private]
```

```Go
type GitserverClientCommitExistsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GitserverClientCommitExistsFuncCall is an object that describes an invocation of method CommitExists on an instance of MockGitserverClient. 

#### <a id="GitserverClientCommitExistsFuncCall.Args" href="#GitserverClientCommitExistsFuncCall.Args">func (c GitserverClientCommitExistsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.GitserverClientCommitExistsFuncCall.Args
tags: [method private]
```

```Go
func (c GitserverClientCommitExistsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientCommitExistsFuncCall.Results" href="#GitserverClientCommitExistsFuncCall.Results">func (c GitserverClientCommitExistsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.GitserverClientCommitExistsFuncCall.Results
tags: [method private]
```

```Go
func (c GitserverClientCommitExistsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientCommitGraphFunc" href="#GitserverClientCommitGraphFunc">type GitserverClientCommitGraphFunc struct</a>

```
searchKey: resolvers.GitserverClientCommitGraphFunc
tags: [struct private]
```

```Go
type GitserverClientCommitGraphFunc struct {
	defaultHook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
	hooks       []func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
	history     []GitserverClientCommitGraphFuncCall
	mutex       sync.Mutex
}
```

GitserverClientCommitGraphFunc describes the behavior when the CommitGraph method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientCommitGraphFunc.History" href="#GitserverClientCommitGraphFunc.History">func (f *GitserverClientCommitGraphFunc) History() []GitserverClientCommitGraphFuncCall</a>

```
searchKey: resolvers.GitserverClientCommitGraphFunc.History
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) History() []GitserverClientCommitGraphFuncCall
```

History returns a sequence of GitserverClientCommitGraphFuncCall objects describing the invocations of this function. 

#### <a id="GitserverClientCommitGraphFunc.PushHook" href="#GitserverClientCommitGraphFunc.PushHook">func (f *GitserverClientCommitGraphFunc) PushHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))</a>

```
searchKey: resolvers.GitserverClientCommitGraphFunc.PushHook
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) PushHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CommitGraph method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientCommitGraphFunc.PushReturn" href="#GitserverClientCommitGraphFunc.PushReturn">func (f *GitserverClientCommitGraphFunc) PushReturn(r0 *gitserver.CommitGraph, r1 error)</a>

```
searchKey: resolvers.GitserverClientCommitGraphFunc.PushReturn
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) PushReturn(r0 *gitserver.CommitGraph, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitGraphFunc.SetDefaultHook" href="#GitserverClientCommitGraphFunc.SetDefaultHook">func (f *GitserverClientCommitGraphFunc) SetDefaultHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))</a>

```
searchKey: resolvers.GitserverClientCommitGraphFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) SetDefaultHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))
```

SetDefaultHook sets function that is called when the CommitGraph method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientCommitGraphFunc.SetDefaultReturn" href="#GitserverClientCommitGraphFunc.SetDefaultReturn">func (f *GitserverClientCommitGraphFunc) SetDefaultReturn(r0 *gitserver.CommitGraph, r1 error)</a>

```
searchKey: resolvers.GitserverClientCommitGraphFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) SetDefaultReturn(r0 *gitserver.CommitGraph, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitGraphFunc.appendCall" href="#GitserverClientCommitGraphFunc.appendCall">func (f *GitserverClientCommitGraphFunc) appendCall(r0 GitserverClientCommitGraphFuncCall)</a>

```
searchKey: resolvers.GitserverClientCommitGraphFunc.appendCall
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) appendCall(r0 GitserverClientCommitGraphFuncCall)
```

#### <a id="GitserverClientCommitGraphFunc.nextHook" href="#GitserverClientCommitGraphFunc.nextHook">func (f *GitserverClientCommitGraphFunc) nextHook() func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)</a>

```
searchKey: resolvers.GitserverClientCommitGraphFunc.nextHook
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) nextHook() func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
```

### <a id="GitserverClientCommitGraphFuncCall" href="#GitserverClientCommitGraphFuncCall">type GitserverClientCommitGraphFuncCall struct</a>

```
searchKey: resolvers.GitserverClientCommitGraphFuncCall
tags: [struct private]
```

```Go
type GitserverClientCommitGraphFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 gitserver.CommitGraphOptions
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *gitserver.CommitGraph
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GitserverClientCommitGraphFuncCall is an object that describes an invocation of method CommitGraph on an instance of MockGitserverClient. 

#### <a id="GitserverClientCommitGraphFuncCall.Args" href="#GitserverClientCommitGraphFuncCall.Args">func (c GitserverClientCommitGraphFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.GitserverClientCommitGraphFuncCall.Args
tags: [method private]
```

```Go
func (c GitserverClientCommitGraphFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientCommitGraphFuncCall.Results" href="#GitserverClientCommitGraphFuncCall.Results">func (c GitserverClientCommitGraphFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.GitserverClientCommitGraphFuncCall.Results
tags: [method private]
```

```Go
func (c GitserverClientCommitGraphFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="HunkCache" href="#HunkCache">type HunkCache interface</a>

```
searchKey: resolvers.HunkCache
tags: [interface]
```

```Go
type HunkCache interface {
	// Get returns the value (if any) and a boolean representing whether the value was
	// found or not.
	Get(key interface{}) (interface{}, bool)

	// Set attempts to add the key-value item to the cache with the given cost. If it
	// returns false, then the value as dropped and the item isn't added to the cache.
	Set(key, value interface{}, cost int64) bool
}
```

HunkCache is a LRU cache that holds git diff hunks. 

#### <a id="NewHunkCache" href="#NewHunkCache">func NewHunkCache(size int) (HunkCache, error)</a>

```
searchKey: resolvers.NewHunkCache
tags: [function]
```

```Go
func NewHunkCache(size int) (HunkCache, error)
```

NewHunkCache creates a data cache instance with the given maximum capacity. 

### <a id="IndexEnqueuer" href="#IndexEnqueuer">type IndexEnqueuer interface</a>

```
searchKey: resolvers.IndexEnqueuer
tags: [interface]
```

```Go
type IndexEnqueuer interface {
	ForceQueueIndexesForRepository(ctx context.Context, repositoryID int) error
	InferIndexConfiguration(ctx context.Context, repositoryID int) (*config.IndexConfiguration, error)
}
```

### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFunc" href="#IndexEnqueuerForceQueueIndexesForRepositoryFunc">type IndexEnqueuerForceQueueIndexesForRepositoryFunc struct</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFunc
tags: [struct private]
```

```Go
type IndexEnqueuerForceQueueIndexesForRepositoryFunc struct {
	defaultHook func(context.Context, int) error
	hooks       []func(context.Context, int) error
	history     []IndexEnqueuerForceQueueIndexesForRepositoryFuncCall
	mutex       sync.Mutex
}
```

IndexEnqueuerForceQueueIndexesForRepositoryFunc describes the behavior when the ForceQueueIndexesForRepository method of the parent MockIndexEnqueuer instance is invoked. 

#### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFunc.History" href="#IndexEnqueuerForceQueueIndexesForRepositoryFunc.History">func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) History() []IndexEnqueuerForceQueueIndexesForRepositoryFuncCall</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFunc.History
tags: [method private]
```

```Go
func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) History() []IndexEnqueuerForceQueueIndexesForRepositoryFuncCall
```

History returns a sequence of IndexEnqueuerForceQueueIndexesForRepositoryFuncCall objects describing the invocations of this function. 

#### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFunc.PushHook" href="#IndexEnqueuerForceQueueIndexesForRepositoryFunc.PushHook">func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) PushHook(hook func(context.Context, int) error)</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFunc.PushHook
tags: [method private]
```

```Go
func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) PushHook(hook func(context.Context, int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the ForceQueueIndexesForRepository method of the parent MockIndexEnqueuer instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFunc.PushReturn" href="#IndexEnqueuerForceQueueIndexesForRepositoryFunc.PushReturn">func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) PushReturn(r0 error)</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFunc.PushReturn
tags: [method private]
```

```Go
func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFunc.SetDefaultHook" href="#IndexEnqueuerForceQueueIndexesForRepositoryFunc.SetDefaultHook">func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) SetDefaultHook(hook func(context.Context, int) error)</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) SetDefaultHook(hook func(context.Context, int) error)
```

SetDefaultHook sets function that is called when the ForceQueueIndexesForRepository method of the parent MockIndexEnqueuer instance is invoked and the hook queue is empty. 

#### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFunc.SetDefaultReturn" href="#IndexEnqueuerForceQueueIndexesForRepositoryFunc.SetDefaultReturn">func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFunc.appendCall" href="#IndexEnqueuerForceQueueIndexesForRepositoryFunc.appendCall">func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) appendCall(r0 IndexEnqueuerForceQueueIndexesForRepositoryFuncCall)</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFunc.appendCall
tags: [method private]
```

```Go
func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) appendCall(r0 IndexEnqueuerForceQueueIndexesForRepositoryFuncCall)
```

#### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFunc.nextHook" href="#IndexEnqueuerForceQueueIndexesForRepositoryFunc.nextHook">func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) nextHook() func(context.Context, int) error</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFunc.nextHook
tags: [method private]
```

```Go
func (f *IndexEnqueuerForceQueueIndexesForRepositoryFunc) nextHook() func(context.Context, int) error
```

### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFuncCall" href="#IndexEnqueuerForceQueueIndexesForRepositoryFuncCall">type IndexEnqueuerForceQueueIndexesForRepositoryFuncCall struct</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFuncCall
tags: [struct private]
```

```Go
type IndexEnqueuerForceQueueIndexesForRepositoryFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

IndexEnqueuerForceQueueIndexesForRepositoryFuncCall is an object that describes an invocation of method ForceQueueIndexesForRepository on an instance of MockIndexEnqueuer. 

#### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFuncCall.Args" href="#IndexEnqueuerForceQueueIndexesForRepositoryFuncCall.Args">func (c IndexEnqueuerForceQueueIndexesForRepositoryFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFuncCall.Args
tags: [method private]
```

```Go
func (c IndexEnqueuerForceQueueIndexesForRepositoryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="IndexEnqueuerForceQueueIndexesForRepositoryFuncCall.Results" href="#IndexEnqueuerForceQueueIndexesForRepositoryFuncCall.Results">func (c IndexEnqueuerForceQueueIndexesForRepositoryFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.IndexEnqueuerForceQueueIndexesForRepositoryFuncCall.Results
tags: [method private]
```

```Go
func (c IndexEnqueuerForceQueueIndexesForRepositoryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="IndexEnqueuerInferIndexConfigurationFunc" href="#IndexEnqueuerInferIndexConfigurationFunc">type IndexEnqueuerInferIndexConfigurationFunc struct</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFunc
tags: [struct private]
```

```Go
type IndexEnqueuerInferIndexConfigurationFunc struct {
	defaultHook func(context.Context, int) (*config.IndexConfiguration, error)
	hooks       []func(context.Context, int) (*config.IndexConfiguration, error)
	history     []IndexEnqueuerInferIndexConfigurationFuncCall
	mutex       sync.Mutex
}
```

IndexEnqueuerInferIndexConfigurationFunc describes the behavior when the InferIndexConfiguration method of the parent MockIndexEnqueuer instance is invoked. 

#### <a id="IndexEnqueuerInferIndexConfigurationFunc.History" href="#IndexEnqueuerInferIndexConfigurationFunc.History">func (f *IndexEnqueuerInferIndexConfigurationFunc) History() []IndexEnqueuerInferIndexConfigurationFuncCall</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFunc.History
tags: [method private]
```

```Go
func (f *IndexEnqueuerInferIndexConfigurationFunc) History() []IndexEnqueuerInferIndexConfigurationFuncCall
```

History returns a sequence of IndexEnqueuerInferIndexConfigurationFuncCall objects describing the invocations of this function. 

#### <a id="IndexEnqueuerInferIndexConfigurationFunc.PushHook" href="#IndexEnqueuerInferIndexConfigurationFunc.PushHook">func (f *IndexEnqueuerInferIndexConfigurationFunc) PushHook(hook func(context.Context, int) (*config.IndexConfiguration, error))</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFunc.PushHook
tags: [method private]
```

```Go
func (f *IndexEnqueuerInferIndexConfigurationFunc) PushHook(hook func(context.Context, int) (*config.IndexConfiguration, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the InferIndexConfiguration method of the parent MockIndexEnqueuer instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="IndexEnqueuerInferIndexConfigurationFunc.PushReturn" href="#IndexEnqueuerInferIndexConfigurationFunc.PushReturn">func (f *IndexEnqueuerInferIndexConfigurationFunc) PushReturn(r0 *config.IndexConfiguration, r1 error)</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFunc.PushReturn
tags: [method private]
```

```Go
func (f *IndexEnqueuerInferIndexConfigurationFunc) PushReturn(r0 *config.IndexConfiguration, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="IndexEnqueuerInferIndexConfigurationFunc.SetDefaultHook" href="#IndexEnqueuerInferIndexConfigurationFunc.SetDefaultHook">func (f *IndexEnqueuerInferIndexConfigurationFunc) SetDefaultHook(hook func(context.Context, int) (*config.IndexConfiguration, error))</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *IndexEnqueuerInferIndexConfigurationFunc) SetDefaultHook(hook func(context.Context, int) (*config.IndexConfiguration, error))
```

SetDefaultHook sets function that is called when the InferIndexConfiguration method of the parent MockIndexEnqueuer instance is invoked and the hook queue is empty. 

#### <a id="IndexEnqueuerInferIndexConfigurationFunc.SetDefaultReturn" href="#IndexEnqueuerInferIndexConfigurationFunc.SetDefaultReturn">func (f *IndexEnqueuerInferIndexConfigurationFunc) SetDefaultReturn(r0 *config.IndexConfiguration, r1 error)</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *IndexEnqueuerInferIndexConfigurationFunc) SetDefaultReturn(r0 *config.IndexConfiguration, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="IndexEnqueuerInferIndexConfigurationFunc.appendCall" href="#IndexEnqueuerInferIndexConfigurationFunc.appendCall">func (f *IndexEnqueuerInferIndexConfigurationFunc) appendCall(r0 IndexEnqueuerInferIndexConfigurationFuncCall)</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFunc.appendCall
tags: [method private]
```

```Go
func (f *IndexEnqueuerInferIndexConfigurationFunc) appendCall(r0 IndexEnqueuerInferIndexConfigurationFuncCall)
```

#### <a id="IndexEnqueuerInferIndexConfigurationFunc.nextHook" href="#IndexEnqueuerInferIndexConfigurationFunc.nextHook">func (f *IndexEnqueuerInferIndexConfigurationFunc) nextHook() func(context.Context, int) (*config.IndexConfiguration, error)</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFunc.nextHook
tags: [method private]
```

```Go
func (f *IndexEnqueuerInferIndexConfigurationFunc) nextHook() func(context.Context, int) (*config.IndexConfiguration, error)
```

### <a id="IndexEnqueuerInferIndexConfigurationFuncCall" href="#IndexEnqueuerInferIndexConfigurationFuncCall">type IndexEnqueuerInferIndexConfigurationFuncCall struct</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFuncCall
tags: [struct private]
```

```Go
type IndexEnqueuerInferIndexConfigurationFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *config.IndexConfiguration
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

IndexEnqueuerInferIndexConfigurationFuncCall is an object that describes an invocation of method InferIndexConfiguration on an instance of MockIndexEnqueuer. 

#### <a id="IndexEnqueuerInferIndexConfigurationFuncCall.Args" href="#IndexEnqueuerInferIndexConfigurationFuncCall.Args">func (c IndexEnqueuerInferIndexConfigurationFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFuncCall.Args
tags: [method private]
```

```Go
func (c IndexEnqueuerInferIndexConfigurationFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="IndexEnqueuerInferIndexConfigurationFuncCall.Results" href="#IndexEnqueuerInferIndexConfigurationFuncCall.Results">func (c IndexEnqueuerInferIndexConfigurationFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.IndexEnqueuerInferIndexConfigurationFuncCall.Results
tags: [method private]
```

```Go
func (c IndexEnqueuerInferIndexConfigurationFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="IndexesResolver" href="#IndexesResolver">type IndexesResolver struct</a>

```
searchKey: resolvers.IndexesResolver
tags: [struct]
```

```Go
type IndexesResolver struct {
	dbStore DBStore
	opts    store.GetIndexesOptions
	once    sync.Once
	//
	Indexes    []store.Index
	TotalCount int
	NextOffset *int
	err        error
}
```

IndexesResolver wraps store.GetIndexes so that the underlying function can be invoked lazily and its results memoized. 

#### <a id="NewIndexesResolver" href="#NewIndexesResolver">func NewIndexesResolver(dbStore DBStore, opts store.GetIndexesOptions) *IndexesResolver</a>

```
searchKey: resolvers.NewIndexesResolver
tags: [function]
```

```Go
func NewIndexesResolver(dbStore DBStore, opts store.GetIndexesOptions) *IndexesResolver
```

NewIndexesResolver creates a new IndexesResolver which wil invoke store.GetIndexes with the given options. 

#### <a id="IndexesResolver.Resolve" href="#IndexesResolver.Resolve">func (r *IndexesResolver) Resolve(ctx context.Context) error</a>

```
searchKey: resolvers.IndexesResolver.Resolve
tags: [method]
```

```Go
func (r *IndexesResolver) Resolve(ctx context.Context) error
```

Resolve ensures that store.GetIndexes has been invoked. This function returns the error from the invocation, if any. If the error is nil, then the resolver's Indexes, TotalCount, and NextOffset fields will be populated. 

#### <a id="IndexesResolver.resolve" href="#IndexesResolver.resolve">func (r *IndexesResolver) resolve(ctx context.Context) error</a>

```
searchKey: resolvers.IndexesResolver.resolve
tags: [method private]
```

```Go
func (r *IndexesResolver) resolve(ctx context.Context) error
```

### <a id="LSIFStore" href="#LSIFStore">type LSIFStore interface</a>

```
searchKey: resolvers.LSIFStore
tags: [interface]
```

```Go
type LSIFStore interface {
	Exists(ctx context.Context, bundleID int, path string) (bool, error)
	Ranges(ctx context.Context, bundleID int, path string, startLine, endLine int) ([]lsifstore.CodeIntelligenceRange, error)
	Definitions(ctx context.Context, bundleID int, path string, line, character, limit, offset int) ([]lsifstore.Location, int, error)
	References(ctx context.Context, bundleID int, path string, line, character, limit, offset int) ([]lsifstore.Location, int, error)
	Hover(ctx context.Context, bundleID int, path string, line, character int) (string, lsifstore.Range, bool, error)
	Diagnostics(ctx context.Context, bundleID int, prefix string, limit, offset int) ([]lsifstore.Diagnostic, int, error)
	MonikersByPosition(ctx context.Context, bundleID int, path string, line, character int) ([][]semantic.MonikerData, error)
	BulkMonikerResults(ctx context.Context, tableName string, ids []int, args []semantic.MonikerData, limit, offset int) (_ []lsifstore.Location, _ int, err error)
	PackageInformation(ctx context.Context, bundleID int, path string, packageInformationID string) (semantic.PackageInformationData, bool, error)
	DocumentationPage(ctx context.Context, bundleID int, pathID string) (*semantic.DocumentationPageData, error)
}
```

### <a id="LSIFStoreBulkMonikerResultsFunc" href="#LSIFStoreBulkMonikerResultsFunc">type LSIFStoreBulkMonikerResultsFunc struct</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFunc
tags: [struct private]
```

```Go
type LSIFStoreBulkMonikerResultsFunc struct {
	defaultHook func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error)
	hooks       []func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error)
	history     []LSIFStoreBulkMonikerResultsFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreBulkMonikerResultsFunc describes the behavior when the BulkMonikerResults method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreBulkMonikerResultsFunc.History" href="#LSIFStoreBulkMonikerResultsFunc.History">func (f *LSIFStoreBulkMonikerResultsFunc) History() []LSIFStoreBulkMonikerResultsFuncCall</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFunc.History
tags: [method private]
```

```Go
func (f *LSIFStoreBulkMonikerResultsFunc) History() []LSIFStoreBulkMonikerResultsFuncCall
```

History returns a sequence of LSIFStoreBulkMonikerResultsFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStoreBulkMonikerResultsFunc.PushHook" href="#LSIFStoreBulkMonikerResultsFunc.PushHook">func (f *LSIFStoreBulkMonikerResultsFunc) PushHook(hook func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error))</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStoreBulkMonikerResultsFunc) PushHook(hook func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the BulkMonikerResults method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreBulkMonikerResultsFunc.PushReturn" href="#LSIFStoreBulkMonikerResultsFunc.PushReturn">func (f *LSIFStoreBulkMonikerResultsFunc) PushReturn(r0 []lsifstore.Location, r1 int, r2 error)</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStoreBulkMonikerResultsFunc) PushReturn(r0 []lsifstore.Location, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreBulkMonikerResultsFunc.SetDefaultHook" href="#LSIFStoreBulkMonikerResultsFunc.SetDefaultHook">func (f *LSIFStoreBulkMonikerResultsFunc) SetDefaultHook(hook func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error))</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStoreBulkMonikerResultsFunc) SetDefaultHook(hook func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error))
```

SetDefaultHook sets function that is called when the BulkMonikerResults method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreBulkMonikerResultsFunc.SetDefaultReturn" href="#LSIFStoreBulkMonikerResultsFunc.SetDefaultReturn">func (f *LSIFStoreBulkMonikerResultsFunc) SetDefaultReturn(r0 []lsifstore.Location, r1 int, r2 error)</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStoreBulkMonikerResultsFunc) SetDefaultReturn(r0 []lsifstore.Location, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreBulkMonikerResultsFunc.appendCall" href="#LSIFStoreBulkMonikerResultsFunc.appendCall">func (f *LSIFStoreBulkMonikerResultsFunc) appendCall(r0 LSIFStoreBulkMonikerResultsFuncCall)</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStoreBulkMonikerResultsFunc) appendCall(r0 LSIFStoreBulkMonikerResultsFuncCall)
```

#### <a id="LSIFStoreBulkMonikerResultsFunc.nextHook" href="#LSIFStoreBulkMonikerResultsFunc.nextHook">func (f *LSIFStoreBulkMonikerResultsFunc) nextHook() func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error)</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStoreBulkMonikerResultsFunc) nextHook() func(context.Context, string, []int, []semantic.MonikerData, int, int) ([]lsifstore.Location, int, error)
```

### <a id="LSIFStoreBulkMonikerResultsFuncCall" href="#LSIFStoreBulkMonikerResultsFuncCall">type LSIFStoreBulkMonikerResultsFuncCall struct</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFuncCall
tags: [struct private]
```

```Go
type LSIFStoreBulkMonikerResultsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 []int
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 []semantic.MonikerData
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 int
	// Arg5 is the value of the 6th argument passed to this method
	// invocation.
	Arg5 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []lsifstore.Location
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

LSIFStoreBulkMonikerResultsFuncCall is an object that describes an invocation of method BulkMonikerResults on an instance of MockLSIFStore. 

#### <a id="LSIFStoreBulkMonikerResultsFuncCall.Args" href="#LSIFStoreBulkMonikerResultsFuncCall.Args">func (c LSIFStoreBulkMonikerResultsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStoreBulkMonikerResultsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreBulkMonikerResultsFuncCall.Results" href="#LSIFStoreBulkMonikerResultsFuncCall.Results">func (c LSIFStoreBulkMonikerResultsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStoreBulkMonikerResultsFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStoreBulkMonikerResultsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreDefinitionsFunc" href="#LSIFStoreDefinitionsFunc">type LSIFStoreDefinitionsFunc struct</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFunc
tags: [struct private]
```

```Go
type LSIFStoreDefinitionsFunc struct {
	defaultHook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)
	hooks       []func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)
	history     []LSIFStoreDefinitionsFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreDefinitionsFunc describes the behavior when the Definitions method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreDefinitionsFunc.History" href="#LSIFStoreDefinitionsFunc.History">func (f *LSIFStoreDefinitionsFunc) History() []LSIFStoreDefinitionsFuncCall</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFunc.History
tags: [method private]
```

```Go
func (f *LSIFStoreDefinitionsFunc) History() []LSIFStoreDefinitionsFuncCall
```

History returns a sequence of LSIFStoreDefinitionsFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStoreDefinitionsFunc.PushHook" href="#LSIFStoreDefinitionsFunc.PushHook">func (f *LSIFStoreDefinitionsFunc) PushHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStoreDefinitionsFunc) PushHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Definitions method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreDefinitionsFunc.PushReturn" href="#LSIFStoreDefinitionsFunc.PushReturn">func (f *LSIFStoreDefinitionsFunc) PushReturn(r0 []lsifstore.Location, r1 int, r2 error)</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStoreDefinitionsFunc) PushReturn(r0 []lsifstore.Location, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreDefinitionsFunc.SetDefaultHook" href="#LSIFStoreDefinitionsFunc.SetDefaultHook">func (f *LSIFStoreDefinitionsFunc) SetDefaultHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStoreDefinitionsFunc) SetDefaultHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))
```

SetDefaultHook sets function that is called when the Definitions method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreDefinitionsFunc.SetDefaultReturn" href="#LSIFStoreDefinitionsFunc.SetDefaultReturn">func (f *LSIFStoreDefinitionsFunc) SetDefaultReturn(r0 []lsifstore.Location, r1 int, r2 error)</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStoreDefinitionsFunc) SetDefaultReturn(r0 []lsifstore.Location, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreDefinitionsFunc.appendCall" href="#LSIFStoreDefinitionsFunc.appendCall">func (f *LSIFStoreDefinitionsFunc) appendCall(r0 LSIFStoreDefinitionsFuncCall)</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStoreDefinitionsFunc) appendCall(r0 LSIFStoreDefinitionsFuncCall)
```

#### <a id="LSIFStoreDefinitionsFunc.nextHook" href="#LSIFStoreDefinitionsFunc.nextHook">func (f *LSIFStoreDefinitionsFunc) nextHook() func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStoreDefinitionsFunc) nextHook() func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)
```

### <a id="LSIFStoreDefinitionsFuncCall" href="#LSIFStoreDefinitionsFuncCall">type LSIFStoreDefinitionsFuncCall struct</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFuncCall
tags: [struct private]
```

```Go
type LSIFStoreDefinitionsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 int
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 int
	// Arg5 is the value of the 6th argument passed to this method
	// invocation.
	Arg5 int
	// Arg6 is the value of the 7th argument passed to this method
	// invocation.
	Arg6 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []lsifstore.Location
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

LSIFStoreDefinitionsFuncCall is an object that describes an invocation of method Definitions on an instance of MockLSIFStore. 

#### <a id="LSIFStoreDefinitionsFuncCall.Args" href="#LSIFStoreDefinitionsFuncCall.Args">func (c LSIFStoreDefinitionsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStoreDefinitionsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreDefinitionsFuncCall.Results" href="#LSIFStoreDefinitionsFuncCall.Results">func (c LSIFStoreDefinitionsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStoreDefinitionsFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStoreDefinitionsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreDiagnosticsFunc" href="#LSIFStoreDiagnosticsFunc">type LSIFStoreDiagnosticsFunc struct</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFunc
tags: [struct private]
```

```Go
type LSIFStoreDiagnosticsFunc struct {
	defaultHook func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error)
	hooks       []func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error)
	history     []LSIFStoreDiagnosticsFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreDiagnosticsFunc describes the behavior when the Diagnostics method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreDiagnosticsFunc.History" href="#LSIFStoreDiagnosticsFunc.History">func (f *LSIFStoreDiagnosticsFunc) History() []LSIFStoreDiagnosticsFuncCall</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFunc.History
tags: [method private]
```

```Go
func (f *LSIFStoreDiagnosticsFunc) History() []LSIFStoreDiagnosticsFuncCall
```

History returns a sequence of LSIFStoreDiagnosticsFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStoreDiagnosticsFunc.PushHook" href="#LSIFStoreDiagnosticsFunc.PushHook">func (f *LSIFStoreDiagnosticsFunc) PushHook(hook func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error))</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStoreDiagnosticsFunc) PushHook(hook func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Diagnostics method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreDiagnosticsFunc.PushReturn" href="#LSIFStoreDiagnosticsFunc.PushReturn">func (f *LSIFStoreDiagnosticsFunc) PushReturn(r0 []lsifstore.Diagnostic, r1 int, r2 error)</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStoreDiagnosticsFunc) PushReturn(r0 []lsifstore.Diagnostic, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreDiagnosticsFunc.SetDefaultHook" href="#LSIFStoreDiagnosticsFunc.SetDefaultHook">func (f *LSIFStoreDiagnosticsFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error))</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStoreDiagnosticsFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error))
```

SetDefaultHook sets function that is called when the Diagnostics method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreDiagnosticsFunc.SetDefaultReturn" href="#LSIFStoreDiagnosticsFunc.SetDefaultReturn">func (f *LSIFStoreDiagnosticsFunc) SetDefaultReturn(r0 []lsifstore.Diagnostic, r1 int, r2 error)</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStoreDiagnosticsFunc) SetDefaultReturn(r0 []lsifstore.Diagnostic, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreDiagnosticsFunc.appendCall" href="#LSIFStoreDiagnosticsFunc.appendCall">func (f *LSIFStoreDiagnosticsFunc) appendCall(r0 LSIFStoreDiagnosticsFuncCall)</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStoreDiagnosticsFunc) appendCall(r0 LSIFStoreDiagnosticsFuncCall)
```

#### <a id="LSIFStoreDiagnosticsFunc.nextHook" href="#LSIFStoreDiagnosticsFunc.nextHook">func (f *LSIFStoreDiagnosticsFunc) nextHook() func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error)</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStoreDiagnosticsFunc) nextHook() func(context.Context, int, string, int, int) ([]lsifstore.Diagnostic, int, error)
```

### <a id="LSIFStoreDiagnosticsFuncCall" href="#LSIFStoreDiagnosticsFuncCall">type LSIFStoreDiagnosticsFuncCall struct</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFuncCall
tags: [struct private]
```

```Go
type LSIFStoreDiagnosticsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 int
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []lsifstore.Diagnostic
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

LSIFStoreDiagnosticsFuncCall is an object that describes an invocation of method Diagnostics on an instance of MockLSIFStore. 

#### <a id="LSIFStoreDiagnosticsFuncCall.Args" href="#LSIFStoreDiagnosticsFuncCall.Args">func (c LSIFStoreDiagnosticsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStoreDiagnosticsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreDiagnosticsFuncCall.Results" href="#LSIFStoreDiagnosticsFuncCall.Results">func (c LSIFStoreDiagnosticsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStoreDiagnosticsFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStoreDiagnosticsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreDocumentationPageFunc" href="#LSIFStoreDocumentationPageFunc">type LSIFStoreDocumentationPageFunc struct</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFunc
tags: [struct private]
```

```Go
type LSIFStoreDocumentationPageFunc struct {
	defaultHook func(context.Context, int, string) (*semantic.DocumentationPageData, error)
	hooks       []func(context.Context, int, string) (*semantic.DocumentationPageData, error)
	history     []LSIFStoreDocumentationPageFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreDocumentationPageFunc describes the behavior when the DocumentationPage method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreDocumentationPageFunc.History" href="#LSIFStoreDocumentationPageFunc.History">func (f *LSIFStoreDocumentationPageFunc) History() []LSIFStoreDocumentationPageFuncCall</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFunc.History
tags: [method private]
```

```Go
func (f *LSIFStoreDocumentationPageFunc) History() []LSIFStoreDocumentationPageFuncCall
```

History returns a sequence of LSIFStoreDocumentationPageFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStoreDocumentationPageFunc.PushHook" href="#LSIFStoreDocumentationPageFunc.PushHook">func (f *LSIFStoreDocumentationPageFunc) PushHook(hook func(context.Context, int, string) (*semantic.DocumentationPageData, error))</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStoreDocumentationPageFunc) PushHook(hook func(context.Context, int, string) (*semantic.DocumentationPageData, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DocumentationPage method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreDocumentationPageFunc.PushReturn" href="#LSIFStoreDocumentationPageFunc.PushReturn">func (f *LSIFStoreDocumentationPageFunc) PushReturn(r0 *semantic.DocumentationPageData, r1 error)</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStoreDocumentationPageFunc) PushReturn(r0 *semantic.DocumentationPageData, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreDocumentationPageFunc.SetDefaultHook" href="#LSIFStoreDocumentationPageFunc.SetDefaultHook">func (f *LSIFStoreDocumentationPageFunc) SetDefaultHook(hook func(context.Context, int, string) (*semantic.DocumentationPageData, error))</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStoreDocumentationPageFunc) SetDefaultHook(hook func(context.Context, int, string) (*semantic.DocumentationPageData, error))
```

SetDefaultHook sets function that is called when the DocumentationPage method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreDocumentationPageFunc.SetDefaultReturn" href="#LSIFStoreDocumentationPageFunc.SetDefaultReturn">func (f *LSIFStoreDocumentationPageFunc) SetDefaultReturn(r0 *semantic.DocumentationPageData, r1 error)</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStoreDocumentationPageFunc) SetDefaultReturn(r0 *semantic.DocumentationPageData, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreDocumentationPageFunc.appendCall" href="#LSIFStoreDocumentationPageFunc.appendCall">func (f *LSIFStoreDocumentationPageFunc) appendCall(r0 LSIFStoreDocumentationPageFuncCall)</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStoreDocumentationPageFunc) appendCall(r0 LSIFStoreDocumentationPageFuncCall)
```

#### <a id="LSIFStoreDocumentationPageFunc.nextHook" href="#LSIFStoreDocumentationPageFunc.nextHook">func (f *LSIFStoreDocumentationPageFunc) nextHook() func(context.Context, int, string) (*semantic.DocumentationPageData, error)</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStoreDocumentationPageFunc) nextHook() func(context.Context, int, string) (*semantic.DocumentationPageData, error)
```

### <a id="LSIFStoreDocumentationPageFuncCall" href="#LSIFStoreDocumentationPageFuncCall">type LSIFStoreDocumentationPageFuncCall struct</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFuncCall
tags: [struct private]
```

```Go
type LSIFStoreDocumentationPageFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *semantic.DocumentationPageData
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

LSIFStoreDocumentationPageFuncCall is an object that describes an invocation of method DocumentationPage on an instance of MockLSIFStore. 

#### <a id="LSIFStoreDocumentationPageFuncCall.Args" href="#LSIFStoreDocumentationPageFuncCall.Args">func (c LSIFStoreDocumentationPageFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStoreDocumentationPageFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreDocumentationPageFuncCall.Results" href="#LSIFStoreDocumentationPageFuncCall.Results">func (c LSIFStoreDocumentationPageFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStoreDocumentationPageFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStoreDocumentationPageFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreExistsFunc" href="#LSIFStoreExistsFunc">type LSIFStoreExistsFunc struct</a>

```
searchKey: resolvers.LSIFStoreExistsFunc
tags: [struct private]
```

```Go
type LSIFStoreExistsFunc struct {
	defaultHook func(context.Context, int, string) (bool, error)
	hooks       []func(context.Context, int, string) (bool, error)
	history     []LSIFStoreExistsFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreExistsFunc describes the behavior when the Exists method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreExistsFunc.History" href="#LSIFStoreExistsFunc.History">func (f *LSIFStoreExistsFunc) History() []LSIFStoreExistsFuncCall</a>

```
searchKey: resolvers.LSIFStoreExistsFunc.History
tags: [method private]
```

```Go
func (f *LSIFStoreExistsFunc) History() []LSIFStoreExistsFuncCall
```

History returns a sequence of LSIFStoreExistsFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStoreExistsFunc.PushHook" href="#LSIFStoreExistsFunc.PushHook">func (f *LSIFStoreExistsFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: resolvers.LSIFStoreExistsFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStoreExistsFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Exists method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreExistsFunc.PushReturn" href="#LSIFStoreExistsFunc.PushReturn">func (f *LSIFStoreExistsFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.LSIFStoreExistsFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStoreExistsFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreExistsFunc.SetDefaultHook" href="#LSIFStoreExistsFunc.SetDefaultHook">func (f *LSIFStoreExistsFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: resolvers.LSIFStoreExistsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStoreExistsFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the Exists method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreExistsFunc.SetDefaultReturn" href="#LSIFStoreExistsFunc.SetDefaultReturn">func (f *LSIFStoreExistsFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: resolvers.LSIFStoreExistsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStoreExistsFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreExistsFunc.appendCall" href="#LSIFStoreExistsFunc.appendCall">func (f *LSIFStoreExistsFunc) appendCall(r0 LSIFStoreExistsFuncCall)</a>

```
searchKey: resolvers.LSIFStoreExistsFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStoreExistsFunc) appendCall(r0 LSIFStoreExistsFuncCall)
```

#### <a id="LSIFStoreExistsFunc.nextHook" href="#LSIFStoreExistsFunc.nextHook">func (f *LSIFStoreExistsFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: resolvers.LSIFStoreExistsFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStoreExistsFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="LSIFStoreExistsFuncCall" href="#LSIFStoreExistsFuncCall">type LSIFStoreExistsFuncCall struct</a>

```
searchKey: resolvers.LSIFStoreExistsFuncCall
tags: [struct private]
```

```Go
type LSIFStoreExistsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

LSIFStoreExistsFuncCall is an object that describes an invocation of method Exists on an instance of MockLSIFStore. 

#### <a id="LSIFStoreExistsFuncCall.Args" href="#LSIFStoreExistsFuncCall.Args">func (c LSIFStoreExistsFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStoreExistsFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStoreExistsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreExistsFuncCall.Results" href="#LSIFStoreExistsFuncCall.Results">func (c LSIFStoreExistsFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStoreExistsFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStoreExistsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreHoverFunc" href="#LSIFStoreHoverFunc">type LSIFStoreHoverFunc struct</a>

```
searchKey: resolvers.LSIFStoreHoverFunc
tags: [struct private]
```

```Go
type LSIFStoreHoverFunc struct {
	defaultHook func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error)
	hooks       []func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error)
	history     []LSIFStoreHoverFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreHoverFunc describes the behavior when the Hover method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreHoverFunc.History" href="#LSIFStoreHoverFunc.History">func (f *LSIFStoreHoverFunc) History() []LSIFStoreHoverFuncCall</a>

```
searchKey: resolvers.LSIFStoreHoverFunc.History
tags: [method private]
```

```Go
func (f *LSIFStoreHoverFunc) History() []LSIFStoreHoverFuncCall
```

History returns a sequence of LSIFStoreHoverFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStoreHoverFunc.PushHook" href="#LSIFStoreHoverFunc.PushHook">func (f *LSIFStoreHoverFunc) PushHook(hook func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error))</a>

```
searchKey: resolvers.LSIFStoreHoverFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStoreHoverFunc) PushHook(hook func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Hover method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreHoverFunc.PushReturn" href="#LSIFStoreHoverFunc.PushReturn">func (f *LSIFStoreHoverFunc) PushReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)</a>

```
searchKey: resolvers.LSIFStoreHoverFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStoreHoverFunc) PushReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreHoverFunc.SetDefaultHook" href="#LSIFStoreHoverFunc.SetDefaultHook">func (f *LSIFStoreHoverFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error))</a>

```
searchKey: resolvers.LSIFStoreHoverFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStoreHoverFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error))
```

SetDefaultHook sets function that is called when the Hover method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreHoverFunc.SetDefaultReturn" href="#LSIFStoreHoverFunc.SetDefaultReturn">func (f *LSIFStoreHoverFunc) SetDefaultReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)</a>

```
searchKey: resolvers.LSIFStoreHoverFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStoreHoverFunc) SetDefaultReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreHoverFunc.appendCall" href="#LSIFStoreHoverFunc.appendCall">func (f *LSIFStoreHoverFunc) appendCall(r0 LSIFStoreHoverFuncCall)</a>

```
searchKey: resolvers.LSIFStoreHoverFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStoreHoverFunc) appendCall(r0 LSIFStoreHoverFuncCall)
```

#### <a id="LSIFStoreHoverFunc.nextHook" href="#LSIFStoreHoverFunc.nextHook">func (f *LSIFStoreHoverFunc) nextHook() func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error)</a>

```
searchKey: resolvers.LSIFStoreHoverFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStoreHoverFunc) nextHook() func(context.Context, int, string, int, int) (string, lsifstore.Range, bool, error)
```

### <a id="LSIFStoreHoverFuncCall" href="#LSIFStoreHoverFuncCall">type LSIFStoreHoverFuncCall struct</a>

```
searchKey: resolvers.LSIFStoreHoverFuncCall
tags: [struct private]
```

```Go
type LSIFStoreHoverFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 int
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 lsifstore.Range
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 bool
	// Result3 is the value of the 4th result returned from this method
	// invocation.
	Result3 error
}
```

LSIFStoreHoverFuncCall is an object that describes an invocation of method Hover on an instance of MockLSIFStore. 

#### <a id="LSIFStoreHoverFuncCall.Args" href="#LSIFStoreHoverFuncCall.Args">func (c LSIFStoreHoverFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStoreHoverFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStoreHoverFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreHoverFuncCall.Results" href="#LSIFStoreHoverFuncCall.Results">func (c LSIFStoreHoverFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStoreHoverFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStoreHoverFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreMonikersByPositionFunc" href="#LSIFStoreMonikersByPositionFunc">type LSIFStoreMonikersByPositionFunc struct</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFunc
tags: [struct private]
```

```Go
type LSIFStoreMonikersByPositionFunc struct {
	defaultHook func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error)
	hooks       []func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error)
	history     []LSIFStoreMonikersByPositionFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreMonikersByPositionFunc describes the behavior when the MonikersByPosition method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreMonikersByPositionFunc.History" href="#LSIFStoreMonikersByPositionFunc.History">func (f *LSIFStoreMonikersByPositionFunc) History() []LSIFStoreMonikersByPositionFuncCall</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFunc.History
tags: [method private]
```

```Go
func (f *LSIFStoreMonikersByPositionFunc) History() []LSIFStoreMonikersByPositionFuncCall
```

History returns a sequence of LSIFStoreMonikersByPositionFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStoreMonikersByPositionFunc.PushHook" href="#LSIFStoreMonikersByPositionFunc.PushHook">func (f *LSIFStoreMonikersByPositionFunc) PushHook(hook func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error))</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStoreMonikersByPositionFunc) PushHook(hook func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MonikersByPosition method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreMonikersByPositionFunc.PushReturn" href="#LSIFStoreMonikersByPositionFunc.PushReturn">func (f *LSIFStoreMonikersByPositionFunc) PushReturn(r0 [][]semantic.MonikerData, r1 error)</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStoreMonikersByPositionFunc) PushReturn(r0 [][]semantic.MonikerData, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreMonikersByPositionFunc.SetDefaultHook" href="#LSIFStoreMonikersByPositionFunc.SetDefaultHook">func (f *LSIFStoreMonikersByPositionFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error))</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStoreMonikersByPositionFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error))
```

SetDefaultHook sets function that is called when the MonikersByPosition method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreMonikersByPositionFunc.SetDefaultReturn" href="#LSIFStoreMonikersByPositionFunc.SetDefaultReturn">func (f *LSIFStoreMonikersByPositionFunc) SetDefaultReturn(r0 [][]semantic.MonikerData, r1 error)</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStoreMonikersByPositionFunc) SetDefaultReturn(r0 [][]semantic.MonikerData, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreMonikersByPositionFunc.appendCall" href="#LSIFStoreMonikersByPositionFunc.appendCall">func (f *LSIFStoreMonikersByPositionFunc) appendCall(r0 LSIFStoreMonikersByPositionFuncCall)</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStoreMonikersByPositionFunc) appendCall(r0 LSIFStoreMonikersByPositionFuncCall)
```

#### <a id="LSIFStoreMonikersByPositionFunc.nextHook" href="#LSIFStoreMonikersByPositionFunc.nextHook">func (f *LSIFStoreMonikersByPositionFunc) nextHook() func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error)</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStoreMonikersByPositionFunc) nextHook() func(context.Context, int, string, int, int) ([][]semantic.MonikerData, error)
```

### <a id="LSIFStoreMonikersByPositionFuncCall" href="#LSIFStoreMonikersByPositionFuncCall">type LSIFStoreMonikersByPositionFuncCall struct</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFuncCall
tags: [struct private]
```

```Go
type LSIFStoreMonikersByPositionFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 int
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 [][]semantic.MonikerData
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

LSIFStoreMonikersByPositionFuncCall is an object that describes an invocation of method MonikersByPosition on an instance of MockLSIFStore. 

#### <a id="LSIFStoreMonikersByPositionFuncCall.Args" href="#LSIFStoreMonikersByPositionFuncCall.Args">func (c LSIFStoreMonikersByPositionFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStoreMonikersByPositionFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreMonikersByPositionFuncCall.Results" href="#LSIFStoreMonikersByPositionFuncCall.Results">func (c LSIFStoreMonikersByPositionFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStoreMonikersByPositionFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStoreMonikersByPositionFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStorePackageInformationFunc" href="#LSIFStorePackageInformationFunc">type LSIFStorePackageInformationFunc struct</a>

```
searchKey: resolvers.LSIFStorePackageInformationFunc
tags: [struct private]
```

```Go
type LSIFStorePackageInformationFunc struct {
	defaultHook func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error)
	hooks       []func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error)
	history     []LSIFStorePackageInformationFuncCall
	mutex       sync.Mutex
}
```

LSIFStorePackageInformationFunc describes the behavior when the PackageInformation method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStorePackageInformationFunc.History" href="#LSIFStorePackageInformationFunc.History">func (f *LSIFStorePackageInformationFunc) History() []LSIFStorePackageInformationFuncCall</a>

```
searchKey: resolvers.LSIFStorePackageInformationFunc.History
tags: [method private]
```

```Go
func (f *LSIFStorePackageInformationFunc) History() []LSIFStorePackageInformationFuncCall
```

History returns a sequence of LSIFStorePackageInformationFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStorePackageInformationFunc.PushHook" href="#LSIFStorePackageInformationFunc.PushHook">func (f *LSIFStorePackageInformationFunc) PushHook(hook func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error))</a>

```
searchKey: resolvers.LSIFStorePackageInformationFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStorePackageInformationFunc) PushHook(hook func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the PackageInformation method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStorePackageInformationFunc.PushReturn" href="#LSIFStorePackageInformationFunc.PushReturn">func (f *LSIFStorePackageInformationFunc) PushReturn(r0 semantic.PackageInformationData, r1 bool, r2 error)</a>

```
searchKey: resolvers.LSIFStorePackageInformationFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStorePackageInformationFunc) PushReturn(r0 semantic.PackageInformationData, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStorePackageInformationFunc.SetDefaultHook" href="#LSIFStorePackageInformationFunc.SetDefaultHook">func (f *LSIFStorePackageInformationFunc) SetDefaultHook(hook func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error))</a>

```
searchKey: resolvers.LSIFStorePackageInformationFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStorePackageInformationFunc) SetDefaultHook(hook func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error))
```

SetDefaultHook sets function that is called when the PackageInformation method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStorePackageInformationFunc.SetDefaultReturn" href="#LSIFStorePackageInformationFunc.SetDefaultReturn">func (f *LSIFStorePackageInformationFunc) SetDefaultReturn(r0 semantic.PackageInformationData, r1 bool, r2 error)</a>

```
searchKey: resolvers.LSIFStorePackageInformationFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStorePackageInformationFunc) SetDefaultReturn(r0 semantic.PackageInformationData, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStorePackageInformationFunc.appendCall" href="#LSIFStorePackageInformationFunc.appendCall">func (f *LSIFStorePackageInformationFunc) appendCall(r0 LSIFStorePackageInformationFuncCall)</a>

```
searchKey: resolvers.LSIFStorePackageInformationFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStorePackageInformationFunc) appendCall(r0 LSIFStorePackageInformationFuncCall)
```

#### <a id="LSIFStorePackageInformationFunc.nextHook" href="#LSIFStorePackageInformationFunc.nextHook">func (f *LSIFStorePackageInformationFunc) nextHook() func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error)</a>

```
searchKey: resolvers.LSIFStorePackageInformationFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStorePackageInformationFunc) nextHook() func(context.Context, int, string, string) (semantic.PackageInformationData, bool, error)
```

### <a id="LSIFStorePackageInformationFuncCall" href="#LSIFStorePackageInformationFuncCall">type LSIFStorePackageInformationFuncCall struct</a>

```
searchKey: resolvers.LSIFStorePackageInformationFuncCall
tags: [struct private]
```

```Go
type LSIFStorePackageInformationFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 semantic.PackageInformationData
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 bool
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

LSIFStorePackageInformationFuncCall is an object that describes an invocation of method PackageInformation on an instance of MockLSIFStore. 

#### <a id="LSIFStorePackageInformationFuncCall.Args" href="#LSIFStorePackageInformationFuncCall.Args">func (c LSIFStorePackageInformationFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStorePackageInformationFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStorePackageInformationFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStorePackageInformationFuncCall.Results" href="#LSIFStorePackageInformationFuncCall.Results">func (c LSIFStorePackageInformationFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStorePackageInformationFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStorePackageInformationFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreRangesFunc" href="#LSIFStoreRangesFunc">type LSIFStoreRangesFunc struct</a>

```
searchKey: resolvers.LSIFStoreRangesFunc
tags: [struct private]
```

```Go
type LSIFStoreRangesFunc struct {
	defaultHook func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error)
	hooks       []func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error)
	history     []LSIFStoreRangesFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreRangesFunc describes the behavior when the Ranges method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreRangesFunc.History" href="#LSIFStoreRangesFunc.History">func (f *LSIFStoreRangesFunc) History() []LSIFStoreRangesFuncCall</a>

```
searchKey: resolvers.LSIFStoreRangesFunc.History
tags: [method private]
```

```Go
func (f *LSIFStoreRangesFunc) History() []LSIFStoreRangesFuncCall
```

History returns a sequence of LSIFStoreRangesFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStoreRangesFunc.PushHook" href="#LSIFStoreRangesFunc.PushHook">func (f *LSIFStoreRangesFunc) PushHook(hook func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error))</a>

```
searchKey: resolvers.LSIFStoreRangesFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStoreRangesFunc) PushHook(hook func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Ranges method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreRangesFunc.PushReturn" href="#LSIFStoreRangesFunc.PushReturn">func (f *LSIFStoreRangesFunc) PushReturn(r0 []lsifstore.CodeIntelligenceRange, r1 error)</a>

```
searchKey: resolvers.LSIFStoreRangesFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStoreRangesFunc) PushReturn(r0 []lsifstore.CodeIntelligenceRange, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreRangesFunc.SetDefaultHook" href="#LSIFStoreRangesFunc.SetDefaultHook">func (f *LSIFStoreRangesFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error))</a>

```
searchKey: resolvers.LSIFStoreRangesFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStoreRangesFunc) SetDefaultHook(hook func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error))
```

SetDefaultHook sets function that is called when the Ranges method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreRangesFunc.SetDefaultReturn" href="#LSIFStoreRangesFunc.SetDefaultReturn">func (f *LSIFStoreRangesFunc) SetDefaultReturn(r0 []lsifstore.CodeIntelligenceRange, r1 error)</a>

```
searchKey: resolvers.LSIFStoreRangesFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStoreRangesFunc) SetDefaultReturn(r0 []lsifstore.CodeIntelligenceRange, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreRangesFunc.appendCall" href="#LSIFStoreRangesFunc.appendCall">func (f *LSIFStoreRangesFunc) appendCall(r0 LSIFStoreRangesFuncCall)</a>

```
searchKey: resolvers.LSIFStoreRangesFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStoreRangesFunc) appendCall(r0 LSIFStoreRangesFuncCall)
```

#### <a id="LSIFStoreRangesFunc.nextHook" href="#LSIFStoreRangesFunc.nextHook">func (f *LSIFStoreRangesFunc) nextHook() func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error)</a>

```
searchKey: resolvers.LSIFStoreRangesFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStoreRangesFunc) nextHook() func(context.Context, int, string, int, int) ([]lsifstore.CodeIntelligenceRange, error)
```

### <a id="LSIFStoreRangesFuncCall" href="#LSIFStoreRangesFuncCall">type LSIFStoreRangesFuncCall struct</a>

```
searchKey: resolvers.LSIFStoreRangesFuncCall
tags: [struct private]
```

```Go
type LSIFStoreRangesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 int
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []lsifstore.CodeIntelligenceRange
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

LSIFStoreRangesFuncCall is an object that describes an invocation of method Ranges on an instance of MockLSIFStore. 

#### <a id="LSIFStoreRangesFuncCall.Args" href="#LSIFStoreRangesFuncCall.Args">func (c LSIFStoreRangesFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStoreRangesFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStoreRangesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreRangesFuncCall.Results" href="#LSIFStoreRangesFuncCall.Results">func (c LSIFStoreRangesFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStoreRangesFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStoreRangesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreReferencesFunc" href="#LSIFStoreReferencesFunc">type LSIFStoreReferencesFunc struct</a>

```
searchKey: resolvers.LSIFStoreReferencesFunc
tags: [struct private]
```

```Go
type LSIFStoreReferencesFunc struct {
	defaultHook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)
	hooks       []func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)
	history     []LSIFStoreReferencesFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreReferencesFunc describes the behavior when the References method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreReferencesFunc.History" href="#LSIFStoreReferencesFunc.History">func (f *LSIFStoreReferencesFunc) History() []LSIFStoreReferencesFuncCall</a>

```
searchKey: resolvers.LSIFStoreReferencesFunc.History
tags: [method private]
```

```Go
func (f *LSIFStoreReferencesFunc) History() []LSIFStoreReferencesFuncCall
```

History returns a sequence of LSIFStoreReferencesFuncCall objects describing the invocations of this function. 

#### <a id="LSIFStoreReferencesFunc.PushHook" href="#LSIFStoreReferencesFunc.PushHook">func (f *LSIFStoreReferencesFunc) PushHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))</a>

```
searchKey: resolvers.LSIFStoreReferencesFunc.PushHook
tags: [method private]
```

```Go
func (f *LSIFStoreReferencesFunc) PushHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the References method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreReferencesFunc.PushReturn" href="#LSIFStoreReferencesFunc.PushReturn">func (f *LSIFStoreReferencesFunc) PushReturn(r0 []lsifstore.Location, r1 int, r2 error)</a>

```
searchKey: resolvers.LSIFStoreReferencesFunc.PushReturn
tags: [method private]
```

```Go
func (f *LSIFStoreReferencesFunc) PushReturn(r0 []lsifstore.Location, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreReferencesFunc.SetDefaultHook" href="#LSIFStoreReferencesFunc.SetDefaultHook">func (f *LSIFStoreReferencesFunc) SetDefaultHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))</a>

```
searchKey: resolvers.LSIFStoreReferencesFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LSIFStoreReferencesFunc) SetDefaultHook(hook func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error))
```

SetDefaultHook sets function that is called when the References method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreReferencesFunc.SetDefaultReturn" href="#LSIFStoreReferencesFunc.SetDefaultReturn">func (f *LSIFStoreReferencesFunc) SetDefaultReturn(r0 []lsifstore.Location, r1 int, r2 error)</a>

```
searchKey: resolvers.LSIFStoreReferencesFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LSIFStoreReferencesFunc) SetDefaultReturn(r0 []lsifstore.Location, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreReferencesFunc.appendCall" href="#LSIFStoreReferencesFunc.appendCall">func (f *LSIFStoreReferencesFunc) appendCall(r0 LSIFStoreReferencesFuncCall)</a>

```
searchKey: resolvers.LSIFStoreReferencesFunc.appendCall
tags: [method private]
```

```Go
func (f *LSIFStoreReferencesFunc) appendCall(r0 LSIFStoreReferencesFuncCall)
```

#### <a id="LSIFStoreReferencesFunc.nextHook" href="#LSIFStoreReferencesFunc.nextHook">func (f *LSIFStoreReferencesFunc) nextHook() func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)</a>

```
searchKey: resolvers.LSIFStoreReferencesFunc.nextHook
tags: [method private]
```

```Go
func (f *LSIFStoreReferencesFunc) nextHook() func(context.Context, int, string, int, int, int, int) ([]lsifstore.Location, int, error)
```

### <a id="LSIFStoreReferencesFuncCall" href="#LSIFStoreReferencesFuncCall">type LSIFStoreReferencesFuncCall struct</a>

```
searchKey: resolvers.LSIFStoreReferencesFuncCall
tags: [struct private]
```

```Go
type LSIFStoreReferencesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 int
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 int
	// Arg5 is the value of the 6th argument passed to this method
	// invocation.
	Arg5 int
	// Arg6 is the value of the 7th argument passed to this method
	// invocation.
	Arg6 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []lsifstore.Location
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

LSIFStoreReferencesFuncCall is an object that describes an invocation of method References on an instance of MockLSIFStore. 

#### <a id="LSIFStoreReferencesFuncCall.Args" href="#LSIFStoreReferencesFuncCall.Args">func (c LSIFStoreReferencesFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.LSIFStoreReferencesFuncCall.Args
tags: [method private]
```

```Go
func (c LSIFStoreReferencesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreReferencesFuncCall.Results" href="#LSIFStoreReferencesFuncCall.Results">func (c LSIFStoreReferencesFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.LSIFStoreReferencesFuncCall.Results
tags: [method private]
```

```Go
func (c LSIFStoreReferencesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockDBStore" href="#MockDBStore">type MockDBStore struct</a>

```
searchKey: resolvers.MockDBStore
tags: [struct private]
```

```Go
type MockDBStore struct {
	// CommitGraphMetadataFunc is an instance of a mock function object
	// controlling the behavior of the method CommitGraphMetadata.
	CommitGraphMetadataFunc *DBStoreCommitGraphMetadataFunc
	// DefinitionDumpsFunc is an instance of a mock function object
	// controlling the behavior of the method DefinitionDumps.
	DefinitionDumpsFunc *DBStoreDefinitionDumpsFunc
	// DeleteIndexByIDFunc is an instance of a mock function object
	// controlling the behavior of the method DeleteIndexByID.
	DeleteIndexByIDFunc *DBStoreDeleteIndexByIDFunc
	// DeleteUploadByIDFunc is an instance of a mock function object
	// controlling the behavior of the method DeleteUploadByID.
	DeleteUploadByIDFunc *DBStoreDeleteUploadByIDFunc
	// FindClosestDumpsFunc is an instance of a mock function object
	// controlling the behavior of the method FindClosestDumps.
	FindClosestDumpsFunc *DBStoreFindClosestDumpsFunc
	// FindClosestDumpsFromGraphFragmentFunc is an instance of a mock
	// function object controlling the behavior of the method
	// FindClosestDumpsFromGraphFragment.
	FindClosestDumpsFromGraphFragmentFunc *DBStoreFindClosestDumpsFromGraphFragmentFunc
	// GetDumpsByIDsFunc is an instance of a mock function object
	// controlling the behavior of the method GetDumpsByIDs.
	GetDumpsByIDsFunc *DBStoreGetDumpsByIDsFunc
	// GetIndexByIDFunc is an instance of a mock function object controlling
	// the behavior of the method GetIndexByID.
	GetIndexByIDFunc *DBStoreGetIndexByIDFunc
	// GetIndexConfigurationByRepositoryIDFunc is an instance of a mock
	// function object controlling the behavior of the method
	// GetIndexConfigurationByRepositoryID.
	GetIndexConfigurationByRepositoryIDFunc *DBStoreGetIndexConfigurationByRepositoryIDFunc
	// GetIndexesFunc is an instance of a mock function object controlling
	// the behavior of the method GetIndexes.
	GetIndexesFunc *DBStoreGetIndexesFunc
	// GetIndexesByIDsFunc is an instance of a mock function object
	// controlling the behavior of the method GetIndexesByIDs.
	GetIndexesByIDsFunc *DBStoreGetIndexesByIDsFunc
	// GetUploadByIDFunc is an instance of a mock function object
	// controlling the behavior of the method GetUploadByID.
	GetUploadByIDFunc *DBStoreGetUploadByIDFunc
	// GetUploadsFunc is an instance of a mock function object controlling
	// the behavior of the method GetUploads.
	GetUploadsFunc *DBStoreGetUploadsFunc
	// GetUploadsByIDsFunc is an instance of a mock function object
	// controlling the behavior of the method GetUploadsByIDs.
	GetUploadsByIDsFunc *DBStoreGetUploadsByIDsFunc
	// HasCommitFunc is an instance of a mock function object controlling
	// the behavior of the method HasCommit.
	HasCommitFunc *DBStoreHasCommitFunc
	// HasRepositoryFunc is an instance of a mock function object
	// controlling the behavior of the method HasRepository.
	HasRepositoryFunc *DBStoreHasRepositoryFunc
	// MarkRepositoryAsDirtyFunc is an instance of a mock function object
	// controlling the behavior of the method MarkRepositoryAsDirty.
	MarkRepositoryAsDirtyFunc *DBStoreMarkRepositoryAsDirtyFunc
	// ReferenceIDsAndFiltersFunc is an instance of a mock function object
	// controlling the behavior of the method ReferenceIDsAndFilters.
	ReferenceIDsAndFiltersFunc *DBStoreReferenceIDsAndFiltersFunc
	// RepoNameFunc is an instance of a mock function object controlling the
	// behavior of the method RepoName.
	RepoNameFunc *DBStoreRepoNameFunc
	// UpdateIndexConfigurationByRepositoryIDFunc is an instance of a mock
	// function object controlling the behavior of the method
	// UpdateIndexConfigurationByRepositoryID.
	UpdateIndexConfigurationByRepositoryIDFunc *DBStoreUpdateIndexConfigurationByRepositoryIDFunc
}
```

MockDBStore is a mock implementation of the DBStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockDBStore" href="#NewMockDBStore">func NewMockDBStore() *MockDBStore</a>

```
searchKey: resolvers.NewMockDBStore
tags: [function private]
```

```Go
func NewMockDBStore() *MockDBStore
```

NewMockDBStore creates a new mock of the DBStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockDBStoreFrom" href="#NewMockDBStoreFrom">func NewMockDBStoreFrom(i DBStore) *MockDBStore</a>

```
searchKey: resolvers.NewMockDBStoreFrom
tags: [function private]
```

```Go
func NewMockDBStoreFrom(i DBStore) *MockDBStore
```

NewMockDBStoreFrom creates a new mock of the MockDBStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockDBStore.CommitGraphMetadata" href="#MockDBStore.CommitGraphMetadata">func (m *MockDBStore) CommitGraphMetadata(v0 context.Context, v1 int) (bool, *time.Time, error)</a>

```
searchKey: resolvers.MockDBStore.CommitGraphMetadata
tags: [method private]
```

```Go
func (m *MockDBStore) CommitGraphMetadata(v0 context.Context, v1 int) (bool, *time.Time, error)
```

CommitGraphMetadata delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.DefinitionDumps" href="#MockDBStore.DefinitionDumps">func (m *MockDBStore) DefinitionDumps(v0 context.Context, v1 []semantic.QualifiedMonikerData) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.MockDBStore.DefinitionDumps
tags: [method private]
```

```Go
func (m *MockDBStore) DefinitionDumps(v0 context.Context, v1 []semantic.QualifiedMonikerData) ([]dbstore.Dump, error)
```

DefinitionDumps delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.DeleteIndexByID" href="#MockDBStore.DeleteIndexByID">func (m *MockDBStore) DeleteIndexByID(v0 context.Context, v1 int) (bool, error)</a>

```
searchKey: resolvers.MockDBStore.DeleteIndexByID
tags: [method private]
```

```Go
func (m *MockDBStore) DeleteIndexByID(v0 context.Context, v1 int) (bool, error)
```

DeleteIndexByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.DeleteUploadByID" href="#MockDBStore.DeleteUploadByID">func (m *MockDBStore) DeleteUploadByID(v0 context.Context, v1 int) (bool, error)</a>

```
searchKey: resolvers.MockDBStore.DeleteUploadByID
tags: [method private]
```

```Go
func (m *MockDBStore) DeleteUploadByID(v0 context.Context, v1 int) (bool, error)
```

DeleteUploadByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.FindClosestDumps" href="#MockDBStore.FindClosestDumps">func (m *MockDBStore) FindClosestDumps(v0 context.Context, v1 int, v2 string, v3 string, v4 bool, v5 string) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.MockDBStore.FindClosestDumps
tags: [method private]
```

```Go
func (m *MockDBStore) FindClosestDumps(v0 context.Context, v1 int, v2 string, v3 string, v4 bool, v5 string) ([]dbstore.Dump, error)
```

FindClosestDumps delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.FindClosestDumpsFromGraphFragment" href="#MockDBStore.FindClosestDumpsFromGraphFragment">func (m *MockDBStore) FindClosestDumpsFromGraphFragment(v0 context.Context, v1 int, v2 string, v3 string, v4 bool, v5 string, v6 *gitserver.CommitGraph) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.MockDBStore.FindClosestDumpsFromGraphFragment
tags: [method private]
```

```Go
func (m *MockDBStore) FindClosestDumpsFromGraphFragment(v0 context.Context, v1 int, v2 string, v3 string, v4 bool, v5 string, v6 *gitserver.CommitGraph) ([]dbstore.Dump, error)
```

FindClosestDumpsFromGraphFragment delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetDumpsByIDs" href="#MockDBStore.GetDumpsByIDs">func (m *MockDBStore) GetDumpsByIDs(v0 context.Context, v1 []int) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.MockDBStore.GetDumpsByIDs
tags: [method private]
```

```Go
func (m *MockDBStore) GetDumpsByIDs(v0 context.Context, v1 []int) ([]dbstore.Dump, error)
```

GetDumpsByIDs delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetIndexByID" href="#MockDBStore.GetIndexByID">func (m *MockDBStore) GetIndexByID(v0 context.Context, v1 int) (dbstore.Index, bool, error)</a>

```
searchKey: resolvers.MockDBStore.GetIndexByID
tags: [method private]
```

```Go
func (m *MockDBStore) GetIndexByID(v0 context.Context, v1 int) (dbstore.Index, bool, error)
```

GetIndexByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetIndexConfigurationByRepositoryID" href="#MockDBStore.GetIndexConfigurationByRepositoryID">func (m *MockDBStore) GetIndexConfigurationByRepositoryID(v0 context.Context, v1 int) (dbstore.IndexConfiguration, bool, error)</a>

```
searchKey: resolvers.MockDBStore.GetIndexConfigurationByRepositoryID
tags: [method private]
```

```Go
func (m *MockDBStore) GetIndexConfigurationByRepositoryID(v0 context.Context, v1 int) (dbstore.IndexConfiguration, bool, error)
```

GetIndexConfigurationByRepositoryID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetIndexes" href="#MockDBStore.GetIndexes">func (m *MockDBStore) GetIndexes(v0 context.Context, v1 dbstore.GetIndexesOptions) ([]dbstore.Index, int, error)</a>

```
searchKey: resolvers.MockDBStore.GetIndexes
tags: [method private]
```

```Go
func (m *MockDBStore) GetIndexes(v0 context.Context, v1 dbstore.GetIndexesOptions) ([]dbstore.Index, int, error)
```

GetIndexes delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetIndexesByIDs" href="#MockDBStore.GetIndexesByIDs">func (m *MockDBStore) GetIndexesByIDs(v0 context.Context, v1 ...int) ([]dbstore.Index, error)</a>

```
searchKey: resolvers.MockDBStore.GetIndexesByIDs
tags: [method private]
```

```Go
func (m *MockDBStore) GetIndexesByIDs(v0 context.Context, v1 ...int) ([]dbstore.Index, error)
```

GetIndexesByIDs delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetUploadByID" href="#MockDBStore.GetUploadByID">func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)</a>

```
searchKey: resolvers.MockDBStore.GetUploadByID
tags: [method private]
```

```Go
func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)
```

GetUploadByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetUploads" href="#MockDBStore.GetUploads">func (m *MockDBStore) GetUploads(v0 context.Context, v1 dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)</a>

```
searchKey: resolvers.MockDBStore.GetUploads
tags: [method private]
```

```Go
func (m *MockDBStore) GetUploads(v0 context.Context, v1 dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
```

GetUploads delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetUploadsByIDs" href="#MockDBStore.GetUploadsByIDs">func (m *MockDBStore) GetUploadsByIDs(v0 context.Context, v1 ...int) ([]dbstore.Upload, error)</a>

```
searchKey: resolvers.MockDBStore.GetUploadsByIDs
tags: [method private]
```

```Go
func (m *MockDBStore) GetUploadsByIDs(v0 context.Context, v1 ...int) ([]dbstore.Upload, error)
```

GetUploadsByIDs delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.HasCommit" href="#MockDBStore.HasCommit">func (m *MockDBStore) HasCommit(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: resolvers.MockDBStore.HasCommit
tags: [method private]
```

```Go
func (m *MockDBStore) HasCommit(v0 context.Context, v1 int, v2 string) (bool, error)
```

HasCommit delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.HasRepository" href="#MockDBStore.HasRepository">func (m *MockDBStore) HasRepository(v0 context.Context, v1 int) (bool, error)</a>

```
searchKey: resolvers.MockDBStore.HasRepository
tags: [method private]
```

```Go
func (m *MockDBStore) HasRepository(v0 context.Context, v1 int) (bool, error)
```

HasRepository delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.MarkRepositoryAsDirty" href="#MockDBStore.MarkRepositoryAsDirty">func (m *MockDBStore) MarkRepositoryAsDirty(v0 context.Context, v1 int) error</a>

```
searchKey: resolvers.MockDBStore.MarkRepositoryAsDirty
tags: [method private]
```

```Go
func (m *MockDBStore) MarkRepositoryAsDirty(v0 context.Context, v1 int) error
```

MarkRepositoryAsDirty delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.ReferenceIDsAndFilters" href="#MockDBStore.ReferenceIDsAndFilters">func (m *MockDBStore) ReferenceIDsAndFilters(v0 context.Context, v1 int, v2 string, v3 []semantic.QualifiedMonikerData, v4 int, v5 int) (dbstore.PackageReferenceScanner, int, error)</a>

```
searchKey: resolvers.MockDBStore.ReferenceIDsAndFilters
tags: [method private]
```

```Go
func (m *MockDBStore) ReferenceIDsAndFilters(v0 context.Context, v1 int, v2 string, v3 []semantic.QualifiedMonikerData, v4 int, v5 int) (dbstore.PackageReferenceScanner, int, error)
```

ReferenceIDsAndFilters delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.RepoName" href="#MockDBStore.RepoName">func (m *MockDBStore) RepoName(v0 context.Context, v1 int) (string, error)</a>

```
searchKey: resolvers.MockDBStore.RepoName
tags: [method private]
```

```Go
func (m *MockDBStore) RepoName(v0 context.Context, v1 int) (string, error)
```

RepoName delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.UpdateIndexConfigurationByRepositoryID" href="#MockDBStore.UpdateIndexConfigurationByRepositoryID">func (m *MockDBStore) UpdateIndexConfigurationByRepositoryID(v0 context.Context, v1 int, v2 []byte) error</a>

```
searchKey: resolvers.MockDBStore.UpdateIndexConfigurationByRepositoryID
tags: [method private]
```

```Go
func (m *MockDBStore) UpdateIndexConfigurationByRepositoryID(v0 context.Context, v1 int, v2 []byte) error
```

UpdateIndexConfigurationByRepositoryID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockEnqueuerDBStore" href="#MockEnqueuerDBStore">type MockEnqueuerDBStore struct</a>

```
searchKey: resolvers.MockEnqueuerDBStore
tags: [struct private]
```

```Go
type MockEnqueuerDBStore struct {
	// DirtyRepositoriesFunc is an instance of a mock function object
	// controlling the behavior of the method DirtyRepositories.
	DirtyRepositoriesFunc *EnqueuerDBStoreDirtyRepositoriesFunc
	// DoneFunc is an instance of a mock function object controlling the
	// behavior of the method Done.
	DoneFunc *EnqueuerDBStoreDoneFunc
	// GetIndexConfigurationByRepositoryIDFunc is an instance of a mock
	// function object controlling the behavior of the method
	// GetIndexConfigurationByRepositoryID.
	GetIndexConfigurationByRepositoryIDFunc *EnqueuerDBStoreGetIndexConfigurationByRepositoryIDFunc
	// GetRepositoriesWithIndexConfigurationFunc is an instance of a mock
	// function object controlling the behavior of the method
	// GetRepositoriesWithIndexConfiguration.
	GetRepositoriesWithIndexConfigurationFunc *EnqueuerDBStoreGetRepositoriesWithIndexConfigurationFunc
	// HandleFunc is an instance of a mock function object controlling the
	// behavior of the method Handle.
	HandleFunc *EnqueuerDBStoreHandleFunc
	// InsertIndexFunc is an instance of a mock function object controlling
	// the behavior of the method InsertIndex.
	InsertIndexFunc *EnqueuerDBStoreInsertIndexFunc
	// IsQueuedFunc is an instance of a mock function object controlling the
	// behavior of the method IsQueued.
	IsQueuedFunc *EnqueuerDBStoreIsQueuedFunc
	// TransactFunc is an instance of a mock function object controlling the
	// behavior of the method Transact.
	TransactFunc *EnqueuerDBStoreTransactFunc
}
```

MockEnqueuerDBStore is a mock implementation of the EnqueuerDBStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockEnqueuerDBStore" href="#NewMockEnqueuerDBStore">func NewMockEnqueuerDBStore() *MockEnqueuerDBStore</a>

```
searchKey: resolvers.NewMockEnqueuerDBStore
tags: [function private]
```

```Go
func NewMockEnqueuerDBStore() *MockEnqueuerDBStore
```

NewMockEnqueuerDBStore creates a new mock of the EnqueuerDBStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockEnqueuerDBStoreFrom" href="#NewMockEnqueuerDBStoreFrom">func NewMockEnqueuerDBStoreFrom(i EnqueuerDBStore) *MockEnqueuerDBStore</a>

```
searchKey: resolvers.NewMockEnqueuerDBStoreFrom
tags: [function private]
```

```Go
func NewMockEnqueuerDBStoreFrom(i EnqueuerDBStore) *MockEnqueuerDBStore
```

NewMockEnqueuerDBStoreFrom creates a new mock of the MockEnqueuerDBStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockEnqueuerDBStore.DirtyRepositories" href="#MockEnqueuerDBStore.DirtyRepositories">func (m *MockEnqueuerDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)</a>

```
searchKey: resolvers.MockEnqueuerDBStore.DirtyRepositories
tags: [method private]
```

```Go
func (m *MockEnqueuerDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)
```

DirtyRepositories delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerDBStore.Done" href="#MockEnqueuerDBStore.Done">func (m *MockEnqueuerDBStore) Done(v0 error) error</a>

```
searchKey: resolvers.MockEnqueuerDBStore.Done
tags: [method private]
```

```Go
func (m *MockEnqueuerDBStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerDBStore.GetIndexConfigurationByRepositoryID" href="#MockEnqueuerDBStore.GetIndexConfigurationByRepositoryID">func (m *MockEnqueuerDBStore) GetIndexConfigurationByRepositoryID(v0 context.Context, v1 int) (dbstore.IndexConfiguration, bool, error)</a>

```
searchKey: resolvers.MockEnqueuerDBStore.GetIndexConfigurationByRepositoryID
tags: [method private]
```

```Go
func (m *MockEnqueuerDBStore) GetIndexConfigurationByRepositoryID(v0 context.Context, v1 int) (dbstore.IndexConfiguration, bool, error)
```

GetIndexConfigurationByRepositoryID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerDBStore.GetRepositoriesWithIndexConfiguration" href="#MockEnqueuerDBStore.GetRepositoriesWithIndexConfiguration">func (m *MockEnqueuerDBStore) GetRepositoriesWithIndexConfiguration(v0 context.Context) ([]int, error)</a>

```
searchKey: resolvers.MockEnqueuerDBStore.GetRepositoriesWithIndexConfiguration
tags: [method private]
```

```Go
func (m *MockEnqueuerDBStore) GetRepositoriesWithIndexConfiguration(v0 context.Context) ([]int, error)
```

GetRepositoriesWithIndexConfiguration delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerDBStore.Handle" href="#MockEnqueuerDBStore.Handle">func (m *MockEnqueuerDBStore) Handle() *basestore.TransactableHandle</a>

```
searchKey: resolvers.MockEnqueuerDBStore.Handle
tags: [method private]
```

```Go
func (m *MockEnqueuerDBStore) Handle() *basestore.TransactableHandle
```

Handle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerDBStore.InsertIndex" href="#MockEnqueuerDBStore.InsertIndex">func (m *MockEnqueuerDBStore) InsertIndex(v0 context.Context, v1 dbstore.Index) (int, error)</a>

```
searchKey: resolvers.MockEnqueuerDBStore.InsertIndex
tags: [method private]
```

```Go
func (m *MockEnqueuerDBStore) InsertIndex(v0 context.Context, v1 dbstore.Index) (int, error)
```

InsertIndex delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerDBStore.IsQueued" href="#MockEnqueuerDBStore.IsQueued">func (m *MockEnqueuerDBStore) IsQueued(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: resolvers.MockEnqueuerDBStore.IsQueued
tags: [method private]
```

```Go
func (m *MockEnqueuerDBStore) IsQueued(v0 context.Context, v1 int, v2 string) (bool, error)
```

IsQueued delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerDBStore.Transact" href="#MockEnqueuerDBStore.Transact">func (m *MockEnqueuerDBStore) Transact(v0 context.Context) (enqueuer.DBStore, error)</a>

```
searchKey: resolvers.MockEnqueuerDBStore.Transact
tags: [method private]
```

```Go
func (m *MockEnqueuerDBStore) Transact(v0 context.Context) (enqueuer.DBStore, error)
```

Transact delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockEnqueuerGitserverClient" href="#MockEnqueuerGitserverClient">type MockEnqueuerGitserverClient struct</a>

```
searchKey: resolvers.MockEnqueuerGitserverClient
tags: [struct private]
```

```Go
type MockEnqueuerGitserverClient struct {
	// FileExistsFunc is an instance of a mock function object controlling
	// the behavior of the method FileExists.
	FileExistsFunc *EnqueuerGitserverClientFileExistsFunc
	// HeadFunc is an instance of a mock function object controlling the
	// behavior of the method Head.
	HeadFunc *EnqueuerGitserverClientHeadFunc
	// ListFilesFunc is an instance of a mock function object controlling
	// the behavior of the method ListFiles.
	ListFilesFunc *EnqueuerGitserverClientListFilesFunc
	// RawContentsFunc is an instance of a mock function object controlling
	// the behavior of the method RawContents.
	RawContentsFunc *EnqueuerGitserverClientRawContentsFunc
	// ResolveRevisionFunc is an instance of a mock function object
	// controlling the behavior of the method ResolveRevision.
	ResolveRevisionFunc *EnqueuerGitserverClientResolveRevisionFunc
}
```

MockEnqueuerGitserverClient is a mock implementation of the EnqueuerGitserverClient interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockEnqueuerGitserverClient" href="#NewMockEnqueuerGitserverClient">func NewMockEnqueuerGitserverClient() *MockEnqueuerGitserverClient</a>

```
searchKey: resolvers.NewMockEnqueuerGitserverClient
tags: [function private]
```

```Go
func NewMockEnqueuerGitserverClient() *MockEnqueuerGitserverClient
```

NewMockEnqueuerGitserverClient creates a new mock of the EnqueuerGitserverClient interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockEnqueuerGitserverClientFrom" href="#NewMockEnqueuerGitserverClientFrom">func NewMockEnqueuerGitserverClientFrom(i EnqueuerGitserverClient) *MockEnqueuerGitserverClient</a>

```
searchKey: resolvers.NewMockEnqueuerGitserverClientFrom
tags: [function private]
```

```Go
func NewMockEnqueuerGitserverClientFrom(i EnqueuerGitserverClient) *MockEnqueuerGitserverClient
```

NewMockEnqueuerGitserverClientFrom creates a new mock of the MockEnqueuerGitserverClient interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockEnqueuerGitserverClient.FileExists" href="#MockEnqueuerGitserverClient.FileExists">func (m *MockEnqueuerGitserverClient) FileExists(v0 context.Context, v1 int, v2 string, v3 string) (bool, error)</a>

```
searchKey: resolvers.MockEnqueuerGitserverClient.FileExists
tags: [method private]
```

```Go
func (m *MockEnqueuerGitserverClient) FileExists(v0 context.Context, v1 int, v2 string, v3 string) (bool, error)
```

FileExists delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerGitserverClient.Head" href="#MockEnqueuerGitserverClient.Head">func (m *MockEnqueuerGitserverClient) Head(v0 context.Context, v1 int) (string, error)</a>

```
searchKey: resolvers.MockEnqueuerGitserverClient.Head
tags: [method private]
```

```Go
func (m *MockEnqueuerGitserverClient) Head(v0 context.Context, v1 int) (string, error)
```

Head delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerGitserverClient.ListFiles" href="#MockEnqueuerGitserverClient.ListFiles">func (m *MockEnqueuerGitserverClient) ListFiles(v0 context.Context, v1 int, v2 string, v3 *regexp.Regexp) ([]string, error)</a>

```
searchKey: resolvers.MockEnqueuerGitserverClient.ListFiles
tags: [method private]
```

```Go
func (m *MockEnqueuerGitserverClient) ListFiles(v0 context.Context, v1 int, v2 string, v3 *regexp.Regexp) ([]string, error)
```

ListFiles delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerGitserverClient.RawContents" href="#MockEnqueuerGitserverClient.RawContents">func (m *MockEnqueuerGitserverClient) RawContents(v0 context.Context, v1 int, v2 string, v3 string) ([]byte, error)</a>

```
searchKey: resolvers.MockEnqueuerGitserverClient.RawContents
tags: [method private]
```

```Go
func (m *MockEnqueuerGitserverClient) RawContents(v0 context.Context, v1 int, v2 string, v3 string) ([]byte, error)
```

RawContents delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockEnqueuerGitserverClient.ResolveRevision" href="#MockEnqueuerGitserverClient.ResolveRevision">func (m *MockEnqueuerGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)</a>

```
searchKey: resolvers.MockEnqueuerGitserverClient.ResolveRevision
tags: [method private]
```

```Go
func (m *MockEnqueuerGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)
```

ResolveRevision delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockGitserverClient" href="#MockGitserverClient">type MockGitserverClient struct</a>

```
searchKey: resolvers.MockGitserverClient
tags: [struct private]
```

```Go
type MockGitserverClient struct {
	// CommitExistsFunc is an instance of a mock function object controlling
	// the behavior of the method CommitExists.
	CommitExistsFunc *GitserverClientCommitExistsFunc
	// CommitGraphFunc is an instance of a mock function object controlling
	// the behavior of the method CommitGraph.
	CommitGraphFunc *GitserverClientCommitGraphFunc
}
```

MockGitserverClient is a mock implementation of the GitserverClient interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockGitserverClient" href="#NewMockGitserverClient">func NewMockGitserverClient() *MockGitserverClient</a>

```
searchKey: resolvers.NewMockGitserverClient
tags: [function private]
```

```Go
func NewMockGitserverClient() *MockGitserverClient
```

NewMockGitserverClient creates a new mock of the GitserverClient interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGitserverClientFrom" href="#NewMockGitserverClientFrom">func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient</a>

```
searchKey: resolvers.NewMockGitserverClientFrom
tags: [function private]
```

```Go
func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient
```

NewMockGitserverClientFrom creates a new mock of the MockGitserverClient interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGitserverClient.CommitExists" href="#MockGitserverClient.CommitExists">func (m *MockGitserverClient) CommitExists(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: resolvers.MockGitserverClient.CommitExists
tags: [method private]
```

```Go
func (m *MockGitserverClient) CommitExists(v0 context.Context, v1 int, v2 string) (bool, error)
```

CommitExists delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.CommitGraph" href="#MockGitserverClient.CommitGraph">func (m *MockGitserverClient) CommitGraph(v0 context.Context, v1 int, v2 gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)</a>

```
searchKey: resolvers.MockGitserverClient.CommitGraph
tags: [method private]
```

```Go
func (m *MockGitserverClient) CommitGraph(v0 context.Context, v1 int, v2 gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
```

CommitGraph delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockIndexEnqueuer" href="#MockIndexEnqueuer">type MockIndexEnqueuer struct</a>

```
searchKey: resolvers.MockIndexEnqueuer
tags: [struct private]
```

```Go
type MockIndexEnqueuer struct {
	// ForceQueueIndexesForRepositoryFunc is an instance of a mock function
	// object controlling the behavior of the method
	// ForceQueueIndexesForRepository.
	ForceQueueIndexesForRepositoryFunc *IndexEnqueuerForceQueueIndexesForRepositoryFunc
	// InferIndexConfigurationFunc is an instance of a mock function object
	// controlling the behavior of the method InferIndexConfiguration.
	InferIndexConfigurationFunc *IndexEnqueuerInferIndexConfigurationFunc
}
```

MockIndexEnqueuer is a mock implementation of the IndexEnqueuer interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockIndexEnqueuer" href="#NewMockIndexEnqueuer">func NewMockIndexEnqueuer() *MockIndexEnqueuer</a>

```
searchKey: resolvers.NewMockIndexEnqueuer
tags: [function private]
```

```Go
func NewMockIndexEnqueuer() *MockIndexEnqueuer
```

NewMockIndexEnqueuer creates a new mock of the IndexEnqueuer interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockIndexEnqueuerFrom" href="#NewMockIndexEnqueuerFrom">func NewMockIndexEnqueuerFrom(i IndexEnqueuer) *MockIndexEnqueuer</a>

```
searchKey: resolvers.NewMockIndexEnqueuerFrom
tags: [function private]
```

```Go
func NewMockIndexEnqueuerFrom(i IndexEnqueuer) *MockIndexEnqueuer
```

NewMockIndexEnqueuerFrom creates a new mock of the MockIndexEnqueuer interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockIndexEnqueuer.ForceQueueIndexesForRepository" href="#MockIndexEnqueuer.ForceQueueIndexesForRepository">func (m *MockIndexEnqueuer) ForceQueueIndexesForRepository(v0 context.Context, v1 int) error</a>

```
searchKey: resolvers.MockIndexEnqueuer.ForceQueueIndexesForRepository
tags: [method private]
```

```Go
func (m *MockIndexEnqueuer) ForceQueueIndexesForRepository(v0 context.Context, v1 int) error
```

ForceQueueIndexesForRepository delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockIndexEnqueuer.InferIndexConfiguration" href="#MockIndexEnqueuer.InferIndexConfiguration">func (m *MockIndexEnqueuer) InferIndexConfiguration(v0 context.Context, v1 int) (*config.IndexConfiguration, error)</a>

```
searchKey: resolvers.MockIndexEnqueuer.InferIndexConfiguration
tags: [method private]
```

```Go
func (m *MockIndexEnqueuer) InferIndexConfiguration(v0 context.Context, v1 int) (*config.IndexConfiguration, error)
```

InferIndexConfiguration delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockLSIFStore" href="#MockLSIFStore">type MockLSIFStore struct</a>

```
searchKey: resolvers.MockLSIFStore
tags: [struct private]
```

```Go
type MockLSIFStore struct {
	// BulkMonikerResultsFunc is an instance of a mock function object
	// controlling the behavior of the method BulkMonikerResults.
	BulkMonikerResultsFunc *LSIFStoreBulkMonikerResultsFunc
	// DefinitionsFunc is an instance of a mock function object controlling
	// the behavior of the method Definitions.
	DefinitionsFunc *LSIFStoreDefinitionsFunc
	// DiagnosticsFunc is an instance of a mock function object controlling
	// the behavior of the method Diagnostics.
	DiagnosticsFunc *LSIFStoreDiagnosticsFunc
	// DocumentationPageFunc is an instance of a mock function object
	// controlling the behavior of the method DocumentationPage.
	DocumentationPageFunc *LSIFStoreDocumentationPageFunc
	// ExistsFunc is an instance of a mock function object controlling the
	// behavior of the method Exists.
	ExistsFunc *LSIFStoreExistsFunc
	// HoverFunc is an instance of a mock function object controlling the
	// behavior of the method Hover.
	HoverFunc *LSIFStoreHoverFunc
	// MonikersByPositionFunc is an instance of a mock function object
	// controlling the behavior of the method MonikersByPosition.
	MonikersByPositionFunc *LSIFStoreMonikersByPositionFunc
	// PackageInformationFunc is an instance of a mock function object
	// controlling the behavior of the method PackageInformation.
	PackageInformationFunc *LSIFStorePackageInformationFunc
	// RangesFunc is an instance of a mock function object controlling the
	// behavior of the method Ranges.
	RangesFunc *LSIFStoreRangesFunc
	// ReferencesFunc is an instance of a mock function object controlling
	// the behavior of the method References.
	ReferencesFunc *LSIFStoreReferencesFunc
}
```

MockLSIFStore is a mock implementation of the LSIFStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockLSIFStore" href="#NewMockLSIFStore">func NewMockLSIFStore() *MockLSIFStore</a>

```
searchKey: resolvers.NewMockLSIFStore
tags: [function private]
```

```Go
func NewMockLSIFStore() *MockLSIFStore
```

NewMockLSIFStore creates a new mock of the LSIFStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockLSIFStoreFrom" href="#NewMockLSIFStoreFrom">func NewMockLSIFStoreFrom(i LSIFStore) *MockLSIFStore</a>

```
searchKey: resolvers.NewMockLSIFStoreFrom
tags: [function private]
```

```Go
func NewMockLSIFStoreFrom(i LSIFStore) *MockLSIFStore
```

NewMockLSIFStoreFrom creates a new mock of the MockLSIFStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockLSIFStore.BulkMonikerResults" href="#MockLSIFStore.BulkMonikerResults">func (m *MockLSIFStore) BulkMonikerResults(v0 context.Context, v1 string, v2 []int, v3 []semantic.MonikerData, v4 int, v5 int) ([]lsifstore.Location, int, error)</a>

```
searchKey: resolvers.MockLSIFStore.BulkMonikerResults
tags: [method private]
```

```Go
func (m *MockLSIFStore) BulkMonikerResults(v0 context.Context, v1 string, v2 []int, v3 []semantic.MonikerData, v4 int, v5 int) ([]lsifstore.Location, int, error)
```

BulkMonikerResults delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.Definitions" href="#MockLSIFStore.Definitions">func (m *MockLSIFStore) Definitions(v0 context.Context, v1 int, v2 string, v3 int, v4 int, v5 int, v6 int) ([]lsifstore.Location, int, error)</a>

```
searchKey: resolvers.MockLSIFStore.Definitions
tags: [method private]
```

```Go
func (m *MockLSIFStore) Definitions(v0 context.Context, v1 int, v2 string, v3 int, v4 int, v5 int, v6 int) ([]lsifstore.Location, int, error)
```

Definitions delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.Diagnostics" href="#MockLSIFStore.Diagnostics">func (m *MockLSIFStore) Diagnostics(v0 context.Context, v1 int, v2 string, v3 int, v4 int) ([]lsifstore.Diagnostic, int, error)</a>

```
searchKey: resolvers.MockLSIFStore.Diagnostics
tags: [method private]
```

```Go
func (m *MockLSIFStore) Diagnostics(v0 context.Context, v1 int, v2 string, v3 int, v4 int) ([]lsifstore.Diagnostic, int, error)
```

Diagnostics delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.DocumentationPage" href="#MockLSIFStore.DocumentationPage">func (m *MockLSIFStore) DocumentationPage(v0 context.Context, v1 int, v2 string) (*semantic.DocumentationPageData, error)</a>

```
searchKey: resolvers.MockLSIFStore.DocumentationPage
tags: [method private]
```

```Go
func (m *MockLSIFStore) DocumentationPage(v0 context.Context, v1 int, v2 string) (*semantic.DocumentationPageData, error)
```

DocumentationPage delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.Exists" href="#MockLSIFStore.Exists">func (m *MockLSIFStore) Exists(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: resolvers.MockLSIFStore.Exists
tags: [method private]
```

```Go
func (m *MockLSIFStore) Exists(v0 context.Context, v1 int, v2 string) (bool, error)
```

Exists delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.Hover" href="#MockLSIFStore.Hover">func (m *MockLSIFStore) Hover(v0 context.Context, v1 int, v2 string, v3 int, v4 int) (string, lsifstore.Range, bool, error)</a>

```
searchKey: resolvers.MockLSIFStore.Hover
tags: [method private]
```

```Go
func (m *MockLSIFStore) Hover(v0 context.Context, v1 int, v2 string, v3 int, v4 int) (string, lsifstore.Range, bool, error)
```

Hover delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.MonikersByPosition" href="#MockLSIFStore.MonikersByPosition">func (m *MockLSIFStore) MonikersByPosition(v0 context.Context, v1 int, v2 string, v3 int, v4 int) ([][]semantic.MonikerData, error)</a>

```
searchKey: resolvers.MockLSIFStore.MonikersByPosition
tags: [method private]
```

```Go
func (m *MockLSIFStore) MonikersByPosition(v0 context.Context, v1 int, v2 string, v3 int, v4 int) ([][]semantic.MonikerData, error)
```

MonikersByPosition delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.PackageInformation" href="#MockLSIFStore.PackageInformation">func (m *MockLSIFStore) PackageInformation(v0 context.Context, v1 int, v2 string, v3 string) (semantic.PackageInformationData, bool, error)</a>

```
searchKey: resolvers.MockLSIFStore.PackageInformation
tags: [method private]
```

```Go
func (m *MockLSIFStore) PackageInformation(v0 context.Context, v1 int, v2 string, v3 string) (semantic.PackageInformationData, bool, error)
```

PackageInformation delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.Ranges" href="#MockLSIFStore.Ranges">func (m *MockLSIFStore) Ranges(v0 context.Context, v1 int, v2 string, v3 int, v4 int) ([]lsifstore.CodeIntelligenceRange, error)</a>

```
searchKey: resolvers.MockLSIFStore.Ranges
tags: [method private]
```

```Go
func (m *MockLSIFStore) Ranges(v0 context.Context, v1 int, v2 string, v3 int, v4 int) ([]lsifstore.CodeIntelligenceRange, error)
```

Ranges delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.References" href="#MockLSIFStore.References">func (m *MockLSIFStore) References(v0 context.Context, v1 int, v2 string, v3 int, v4 int, v5 int, v6 int) ([]lsifstore.Location, int, error)</a>

```
searchKey: resolvers.MockLSIFStore.References
tags: [method private]
```

```Go
func (m *MockLSIFStore) References(v0 context.Context, v1 int, v2 string, v3 int, v4 int, v5 int, v6 int) ([]lsifstore.Location, int, error)
```

References delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockPositionAdjuster" href="#MockPositionAdjuster">type MockPositionAdjuster struct</a>

```
searchKey: resolvers.MockPositionAdjuster
tags: [struct private]
```

```Go
type MockPositionAdjuster struct {
	// AdjustPathFunc is an instance of a mock function object controlling
	// the behavior of the method AdjustPath.
	AdjustPathFunc *PositionAdjusterAdjustPathFunc
	// AdjustPositionFunc is an instance of a mock function object
	// controlling the behavior of the method AdjustPosition.
	AdjustPositionFunc *PositionAdjusterAdjustPositionFunc
	// AdjustRangeFunc is an instance of a mock function object controlling
	// the behavior of the method AdjustRange.
	AdjustRangeFunc *PositionAdjusterAdjustRangeFunc
}
```

MockPositionAdjuster is a mock implementation of the PositionAdjuster interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockPositionAdjuster" href="#NewMockPositionAdjuster">func NewMockPositionAdjuster() *MockPositionAdjuster</a>

```
searchKey: resolvers.NewMockPositionAdjuster
tags: [function private]
```

```Go
func NewMockPositionAdjuster() *MockPositionAdjuster
```

NewMockPositionAdjuster creates a new mock of the PositionAdjuster interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockPositionAdjusterFrom" href="#NewMockPositionAdjusterFrom">func NewMockPositionAdjusterFrom(i PositionAdjuster) *MockPositionAdjuster</a>

```
searchKey: resolvers.NewMockPositionAdjusterFrom
tags: [function private]
```

```Go
func NewMockPositionAdjusterFrom(i PositionAdjuster) *MockPositionAdjuster
```

NewMockPositionAdjusterFrom creates a new mock of the MockPositionAdjuster interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockPositionAdjuster.AdjustPath" href="#MockPositionAdjuster.AdjustPath">func (m *MockPositionAdjuster) AdjustPath(v0 context.Context, v1 string, v2 string, v3 bool) (string, bool, error)</a>

```
searchKey: resolvers.MockPositionAdjuster.AdjustPath
tags: [method private]
```

```Go
func (m *MockPositionAdjuster) AdjustPath(v0 context.Context, v1 string, v2 string, v3 bool) (string, bool, error)
```

AdjustPath delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockPositionAdjuster.AdjustPosition" href="#MockPositionAdjuster.AdjustPosition">func (m *MockPositionAdjuster) AdjustPosition(v0 context.Context, v1 string, v2 string, v3 lsifstore.Position, v4 bool) (string, lsifstore.Position, bool, error)</a>

```
searchKey: resolvers.MockPositionAdjuster.AdjustPosition
tags: [method private]
```

```Go
func (m *MockPositionAdjuster) AdjustPosition(v0 context.Context, v1 string, v2 string, v3 lsifstore.Position, v4 bool) (string, lsifstore.Position, bool, error)
```

AdjustPosition delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockPositionAdjuster.AdjustRange" href="#MockPositionAdjuster.AdjustRange">func (m *MockPositionAdjuster) AdjustRange(v0 context.Context, v1 string, v2 string, v3 lsifstore.Range, v4 bool) (string, lsifstore.Range, bool, error)</a>

```
searchKey: resolvers.MockPositionAdjuster.AdjustRange
tags: [method private]
```

```Go
func (m *MockPositionAdjuster) AdjustRange(v0 context.Context, v1 string, v2 string, v3 lsifstore.Range, v4 bool) (string, lsifstore.Range, bool, error)
```

AdjustRange delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockRepoUpdaterClient" href="#MockRepoUpdaterClient">type MockRepoUpdaterClient struct</a>

```
searchKey: resolvers.MockRepoUpdaterClient
tags: [struct private]
```

```Go
type MockRepoUpdaterClient struct {
	// EnqueueRepoUpdateFunc is an instance of a mock function object
	// controlling the behavior of the method EnqueueRepoUpdate.
	EnqueueRepoUpdateFunc *RepoUpdaterClientEnqueueRepoUpdateFunc
}
```

MockRepoUpdaterClient is a mock implementation of the RepoUpdaterClient interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockRepoUpdaterClient" href="#NewMockRepoUpdaterClient">func NewMockRepoUpdaterClient() *MockRepoUpdaterClient</a>

```
searchKey: resolvers.NewMockRepoUpdaterClient
tags: [function private]
```

```Go
func NewMockRepoUpdaterClient() *MockRepoUpdaterClient
```

NewMockRepoUpdaterClient creates a new mock of the RepoUpdaterClient interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockRepoUpdaterClientFrom" href="#NewMockRepoUpdaterClientFrom">func NewMockRepoUpdaterClientFrom(i RepoUpdaterClient) *MockRepoUpdaterClient</a>

```
searchKey: resolvers.NewMockRepoUpdaterClientFrom
tags: [function private]
```

```Go
func NewMockRepoUpdaterClientFrom(i RepoUpdaterClient) *MockRepoUpdaterClient
```

NewMockRepoUpdaterClientFrom creates a new mock of the MockRepoUpdaterClient interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockRepoUpdaterClient.EnqueueRepoUpdate" href="#MockRepoUpdaterClient.EnqueueRepoUpdate">func (m *MockRepoUpdaterClient) EnqueueRepoUpdate(v0 context.Context, v1 api.RepoName) (*protocol.RepoUpdateResponse, error)</a>

```
searchKey: resolvers.MockRepoUpdaterClient.EnqueueRepoUpdate
tags: [method private]
```

```Go
func (m *MockRepoUpdaterClient) EnqueueRepoUpdate(v0 context.Context, v1 api.RepoName) (*protocol.RepoUpdateResponse, error)
```

EnqueueRepoUpdate delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="PositionAdjuster" href="#PositionAdjuster">type PositionAdjuster interface</a>

```
searchKey: resolvers.PositionAdjuster
tags: [interface]
```

```Go
type PositionAdjuster interface {
	// AdjustPath translates the given path from the source commit into the given target
	// commit. If revese is true, then the source and target commits are swapped.
	AdjustPath(ctx context.Context, commit, path string, reverse bool) (string, bool, error)

	// AdjustPosition translates the given position from the source commit into the given
	// target commit. The adjusted path and position are returned, along with a boolean flag
	// indicating that the translation was successful. If revese is true, then the source and
	// target commits are swapped.
	AdjustPosition(ctx context.Context, commit, path string, px lsifstore.Position, reverse bool) (string, lsifstore.Position, bool, error)

	// AdjustRange translates the given range from the source commit into the given target
	// commit. The adjusted path and range are returned, along with a boolean flag indicating
	// that the translation was successful. If revese is true, then the source and target commits
	// are swapped.
	AdjustRange(ctx context.Context, commit, path string, rx lsifstore.Range, reverse bool) (string, lsifstore.Range, bool, error)
}
```

PositionAdjuster translates a position within a git tree at a source commit into the equivalent position in a target commit commit. The position adjuster instance carries along with it the source commit. 

#### <a id="NewPositionAdjuster" href="#NewPositionAdjuster">func NewPositionAdjuster(repo *types.Repo, commit string, hunkCache HunkCache) PositionAdjuster</a>

```
searchKey: resolvers.NewPositionAdjuster
tags: [function]
```

```Go
func NewPositionAdjuster(repo *types.Repo, commit string, hunkCache HunkCache) PositionAdjuster
```

NewPositionAdjuster creates a new PositionAdjuster with the given repository and source commit. 

#### <a id="noopPositionAdjuster" href="#noopPositionAdjuster">func noopPositionAdjuster() PositionAdjuster</a>

```
searchKey: resolvers.noopPositionAdjuster
tags: [function private]
```

```Go
func noopPositionAdjuster() PositionAdjuster
```

### <a id="PositionAdjusterAdjustPathFunc" href="#PositionAdjusterAdjustPathFunc">type PositionAdjusterAdjustPathFunc struct</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFunc
tags: [struct private]
```

```Go
type PositionAdjusterAdjustPathFunc struct {
	defaultHook func(context.Context, string, string, bool) (string, bool, error)
	hooks       []func(context.Context, string, string, bool) (string, bool, error)
	history     []PositionAdjusterAdjustPathFuncCall
	mutex       sync.Mutex
}
```

PositionAdjusterAdjustPathFunc describes the behavior when the AdjustPath method of the parent MockPositionAdjuster instance is invoked. 

#### <a id="PositionAdjusterAdjustPathFunc.History" href="#PositionAdjusterAdjustPathFunc.History">func (f *PositionAdjusterAdjustPathFunc) History() []PositionAdjusterAdjustPathFuncCall</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFunc.History
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPathFunc) History() []PositionAdjusterAdjustPathFuncCall
```

History returns a sequence of PositionAdjusterAdjustPathFuncCall objects describing the invocations of this function. 

#### <a id="PositionAdjusterAdjustPathFunc.PushHook" href="#PositionAdjusterAdjustPathFunc.PushHook">func (f *PositionAdjusterAdjustPathFunc) PushHook(hook func(context.Context, string, string, bool) (string, bool, error))</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFunc.PushHook
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPathFunc) PushHook(hook func(context.Context, string, string, bool) (string, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the AdjustPath method of the parent MockPositionAdjuster instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="PositionAdjusterAdjustPathFunc.PushReturn" href="#PositionAdjusterAdjustPathFunc.PushReturn">func (f *PositionAdjusterAdjustPathFunc) PushReturn(r0 string, r1 bool, r2 error)</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFunc.PushReturn
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPathFunc) PushReturn(r0 string, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="PositionAdjusterAdjustPathFunc.SetDefaultHook" href="#PositionAdjusterAdjustPathFunc.SetDefaultHook">func (f *PositionAdjusterAdjustPathFunc) SetDefaultHook(hook func(context.Context, string, string, bool) (string, bool, error))</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPathFunc) SetDefaultHook(hook func(context.Context, string, string, bool) (string, bool, error))
```

SetDefaultHook sets function that is called when the AdjustPath method of the parent MockPositionAdjuster instance is invoked and the hook queue is empty. 

#### <a id="PositionAdjusterAdjustPathFunc.SetDefaultReturn" href="#PositionAdjusterAdjustPathFunc.SetDefaultReturn">func (f *PositionAdjusterAdjustPathFunc) SetDefaultReturn(r0 string, r1 bool, r2 error)</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPathFunc) SetDefaultReturn(r0 string, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="PositionAdjusterAdjustPathFunc.appendCall" href="#PositionAdjusterAdjustPathFunc.appendCall">func (f *PositionAdjusterAdjustPathFunc) appendCall(r0 PositionAdjusterAdjustPathFuncCall)</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFunc.appendCall
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPathFunc) appendCall(r0 PositionAdjusterAdjustPathFuncCall)
```

#### <a id="PositionAdjusterAdjustPathFunc.nextHook" href="#PositionAdjusterAdjustPathFunc.nextHook">func (f *PositionAdjusterAdjustPathFunc) nextHook() func(context.Context, string, string, bool) (string, bool, error)</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFunc.nextHook
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPathFunc) nextHook() func(context.Context, string, string, bool) (string, bool, error)
```

### <a id="PositionAdjusterAdjustPathFuncCall" href="#PositionAdjusterAdjustPathFuncCall">type PositionAdjusterAdjustPathFuncCall struct</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFuncCall
tags: [struct private]
```

```Go
type PositionAdjusterAdjustPathFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 bool
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 bool
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

PositionAdjusterAdjustPathFuncCall is an object that describes an invocation of method AdjustPath on an instance of MockPositionAdjuster. 

#### <a id="PositionAdjusterAdjustPathFuncCall.Args" href="#PositionAdjusterAdjustPathFuncCall.Args">func (c PositionAdjusterAdjustPathFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFuncCall.Args
tags: [method private]
```

```Go
func (c PositionAdjusterAdjustPathFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="PositionAdjusterAdjustPathFuncCall.Results" href="#PositionAdjusterAdjustPathFuncCall.Results">func (c PositionAdjusterAdjustPathFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.PositionAdjusterAdjustPathFuncCall.Results
tags: [method private]
```

```Go
func (c PositionAdjusterAdjustPathFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="PositionAdjusterAdjustPositionFunc" href="#PositionAdjusterAdjustPositionFunc">type PositionAdjusterAdjustPositionFunc struct</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFunc
tags: [struct private]
```

```Go
type PositionAdjusterAdjustPositionFunc struct {
	defaultHook func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error)
	hooks       []func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error)
	history     []PositionAdjusterAdjustPositionFuncCall
	mutex       sync.Mutex
}
```

PositionAdjusterAdjustPositionFunc describes the behavior when the AdjustPosition method of the parent MockPositionAdjuster instance is invoked. 

#### <a id="PositionAdjusterAdjustPositionFunc.History" href="#PositionAdjusterAdjustPositionFunc.History">func (f *PositionAdjusterAdjustPositionFunc) History() []PositionAdjusterAdjustPositionFuncCall</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFunc.History
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPositionFunc) History() []PositionAdjusterAdjustPositionFuncCall
```

History returns a sequence of PositionAdjusterAdjustPositionFuncCall objects describing the invocations of this function. 

#### <a id="PositionAdjusterAdjustPositionFunc.PushHook" href="#PositionAdjusterAdjustPositionFunc.PushHook">func (f *PositionAdjusterAdjustPositionFunc) PushHook(hook func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error))</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFunc.PushHook
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPositionFunc) PushHook(hook func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the AdjustPosition method of the parent MockPositionAdjuster instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="PositionAdjusterAdjustPositionFunc.PushReturn" href="#PositionAdjusterAdjustPositionFunc.PushReturn">func (f *PositionAdjusterAdjustPositionFunc) PushReturn(r0 string, r1 lsifstore.Position, r2 bool, r3 error)</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFunc.PushReturn
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPositionFunc) PushReturn(r0 string, r1 lsifstore.Position, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="PositionAdjusterAdjustPositionFunc.SetDefaultHook" href="#PositionAdjusterAdjustPositionFunc.SetDefaultHook">func (f *PositionAdjusterAdjustPositionFunc) SetDefaultHook(hook func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error))</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPositionFunc) SetDefaultHook(hook func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error))
```

SetDefaultHook sets function that is called when the AdjustPosition method of the parent MockPositionAdjuster instance is invoked and the hook queue is empty. 

#### <a id="PositionAdjusterAdjustPositionFunc.SetDefaultReturn" href="#PositionAdjusterAdjustPositionFunc.SetDefaultReturn">func (f *PositionAdjusterAdjustPositionFunc) SetDefaultReturn(r0 string, r1 lsifstore.Position, r2 bool, r3 error)</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPositionFunc) SetDefaultReturn(r0 string, r1 lsifstore.Position, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="PositionAdjusterAdjustPositionFunc.appendCall" href="#PositionAdjusterAdjustPositionFunc.appendCall">func (f *PositionAdjusterAdjustPositionFunc) appendCall(r0 PositionAdjusterAdjustPositionFuncCall)</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFunc.appendCall
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPositionFunc) appendCall(r0 PositionAdjusterAdjustPositionFuncCall)
```

#### <a id="PositionAdjusterAdjustPositionFunc.nextHook" href="#PositionAdjusterAdjustPositionFunc.nextHook">func (f *PositionAdjusterAdjustPositionFunc) nextHook() func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error)</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFunc.nextHook
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustPositionFunc) nextHook() func(context.Context, string, string, lsifstore.Position, bool) (string, lsifstore.Position, bool, error)
```

### <a id="PositionAdjusterAdjustPositionFuncCall" href="#PositionAdjusterAdjustPositionFuncCall">type PositionAdjusterAdjustPositionFuncCall struct</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFuncCall
tags: [struct private]
```

```Go
type PositionAdjusterAdjustPositionFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 lsifstore.Position
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 bool
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 lsifstore.Position
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 bool
	// Result3 is the value of the 4th result returned from this method
	// invocation.
	Result3 error
}
```

PositionAdjusterAdjustPositionFuncCall is an object that describes an invocation of method AdjustPosition on an instance of MockPositionAdjuster. 

#### <a id="PositionAdjusterAdjustPositionFuncCall.Args" href="#PositionAdjusterAdjustPositionFuncCall.Args">func (c PositionAdjusterAdjustPositionFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFuncCall.Args
tags: [method private]
```

```Go
func (c PositionAdjusterAdjustPositionFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="PositionAdjusterAdjustPositionFuncCall.Results" href="#PositionAdjusterAdjustPositionFuncCall.Results">func (c PositionAdjusterAdjustPositionFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.PositionAdjusterAdjustPositionFuncCall.Results
tags: [method private]
```

```Go
func (c PositionAdjusterAdjustPositionFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="PositionAdjusterAdjustRangeFunc" href="#PositionAdjusterAdjustRangeFunc">type PositionAdjusterAdjustRangeFunc struct</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFunc
tags: [struct private]
```

```Go
type PositionAdjusterAdjustRangeFunc struct {
	defaultHook func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error)
	hooks       []func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error)
	history     []PositionAdjusterAdjustRangeFuncCall
	mutex       sync.Mutex
}
```

PositionAdjusterAdjustRangeFunc describes the behavior when the AdjustRange method of the parent MockPositionAdjuster instance is invoked. 

#### <a id="PositionAdjusterAdjustRangeFunc.History" href="#PositionAdjusterAdjustRangeFunc.History">func (f *PositionAdjusterAdjustRangeFunc) History() []PositionAdjusterAdjustRangeFuncCall</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFunc.History
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustRangeFunc) History() []PositionAdjusterAdjustRangeFuncCall
```

History returns a sequence of PositionAdjusterAdjustRangeFuncCall objects describing the invocations of this function. 

#### <a id="PositionAdjusterAdjustRangeFunc.PushHook" href="#PositionAdjusterAdjustRangeFunc.PushHook">func (f *PositionAdjusterAdjustRangeFunc) PushHook(hook func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error))</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFunc.PushHook
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustRangeFunc) PushHook(hook func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the AdjustRange method of the parent MockPositionAdjuster instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="PositionAdjusterAdjustRangeFunc.PushReturn" href="#PositionAdjusterAdjustRangeFunc.PushReturn">func (f *PositionAdjusterAdjustRangeFunc) PushReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFunc.PushReturn
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustRangeFunc) PushReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="PositionAdjusterAdjustRangeFunc.SetDefaultHook" href="#PositionAdjusterAdjustRangeFunc.SetDefaultHook">func (f *PositionAdjusterAdjustRangeFunc) SetDefaultHook(hook func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error))</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustRangeFunc) SetDefaultHook(hook func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error))
```

SetDefaultHook sets function that is called when the AdjustRange method of the parent MockPositionAdjuster instance is invoked and the hook queue is empty. 

#### <a id="PositionAdjusterAdjustRangeFunc.SetDefaultReturn" href="#PositionAdjusterAdjustRangeFunc.SetDefaultReturn">func (f *PositionAdjusterAdjustRangeFunc) SetDefaultReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustRangeFunc) SetDefaultReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="PositionAdjusterAdjustRangeFunc.appendCall" href="#PositionAdjusterAdjustRangeFunc.appendCall">func (f *PositionAdjusterAdjustRangeFunc) appendCall(r0 PositionAdjusterAdjustRangeFuncCall)</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFunc.appendCall
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustRangeFunc) appendCall(r0 PositionAdjusterAdjustRangeFuncCall)
```

#### <a id="PositionAdjusterAdjustRangeFunc.nextHook" href="#PositionAdjusterAdjustRangeFunc.nextHook">func (f *PositionAdjusterAdjustRangeFunc) nextHook() func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error)</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFunc.nextHook
tags: [method private]
```

```Go
func (f *PositionAdjusterAdjustRangeFunc) nextHook() func(context.Context, string, string, lsifstore.Range, bool) (string, lsifstore.Range, bool, error)
```

### <a id="PositionAdjusterAdjustRangeFuncCall" href="#PositionAdjusterAdjustRangeFuncCall">type PositionAdjusterAdjustRangeFuncCall struct</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFuncCall
tags: [struct private]
```

```Go
type PositionAdjusterAdjustRangeFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 lsifstore.Range
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 bool
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 lsifstore.Range
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 bool
	// Result3 is the value of the 4th result returned from this method
	// invocation.
	Result3 error
}
```

PositionAdjusterAdjustRangeFuncCall is an object that describes an invocation of method AdjustRange on an instance of MockPositionAdjuster. 

#### <a id="PositionAdjusterAdjustRangeFuncCall.Args" href="#PositionAdjusterAdjustRangeFuncCall.Args">func (c PositionAdjusterAdjustRangeFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFuncCall.Args
tags: [method private]
```

```Go
func (c PositionAdjusterAdjustRangeFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="PositionAdjusterAdjustRangeFuncCall.Results" href="#PositionAdjusterAdjustRangeFuncCall.Results">func (c PositionAdjusterAdjustRangeFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.PositionAdjusterAdjustRangeFuncCall.Results
tags: [method private]
```

```Go
func (c PositionAdjusterAdjustRangeFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="QueryResolver" href="#QueryResolver">type QueryResolver interface</a>

```
searchKey: resolvers.QueryResolver
tags: [interface]
```

```Go
type QueryResolver interface {
	Ranges(ctx context.Context, startLine, endLine int) ([]AdjustedCodeIntelligenceRange, error)
	Definitions(ctx context.Context, line, character int) ([]AdjustedLocation, error)
	References(ctx context.Context, line, character, limit int, rawCursor string) ([]AdjustedLocation, string, error)
	Hover(ctx context.Context, line, character int) (string, lsifstore.Range, bool, error)
	Diagnostics(ctx context.Context, limit int) ([]AdjustedDiagnostic, int, error)
	DocumentationPage(ctx context.Context, pathID string) (*semantic.DocumentationPageData, error)
}
```

QueryResolver is the main interface to bundle-related operations exposed to the GraphQL API. This resolver consolidates the logic for bundle operations and is not itself concerned with GraphQL/API specifics (auth, validation, marshaling, etc.). This resolver is wrapped by a symmetrics resolver in this package's graphql subpackage, which is exposed directly by the API. 

#### <a id="NewQueryResolver" href="#NewQueryResolver">func NewQueryResolver(dbStore DBStore,...</a>

```
searchKey: resolvers.NewQueryResolver
tags: [function]
```

```Go
func NewQueryResolver(
	dbStore DBStore,
	lsifStore LSIFStore,
	cachedCommitChecker *cachedCommitChecker,
	positionAdjuster PositionAdjuster,
	repositoryID int,
	commit string,
	path string,
	uploads []store.Dump,
	operations *operations,
) QueryResolver
```

NewQueryResolver create a new query resolver with the given services. The methods of this struct return queries for the given repository, commit, and path, and will query only the bundles associated with the given dump objects. 

### <a id="RepoUpdaterClient" href="#RepoUpdaterClient">type RepoUpdaterClient enqueuer.RepoUpdaterClient</a>

```
searchKey: resolvers.RepoUpdaterClient
tags: [interface]
```

```Go
type RepoUpdaterClient = enqueuer.RepoUpdaterClient
```

### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc" href="#RepoUpdaterClientEnqueueRepoUpdateFunc">type RepoUpdaterClientEnqueueRepoUpdateFunc struct</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFunc
tags: [struct private]
```

```Go
type RepoUpdaterClientEnqueueRepoUpdateFunc struct {
	defaultHook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error)
	hooks       []func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error)
	history     []RepoUpdaterClientEnqueueRepoUpdateFuncCall
	mutex       sync.Mutex
}
```

RepoUpdaterClientEnqueueRepoUpdateFunc describes the behavior when the EnqueueRepoUpdate method of the parent MockRepoUpdaterClient instance is invoked. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.History" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.History">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) History() []RepoUpdaterClientEnqueueRepoUpdateFuncCall</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFunc.History
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) History() []RepoUpdaterClientEnqueueRepoUpdateFuncCall
```

History returns a sequence of RepoUpdaterClientEnqueueRepoUpdateFuncCall objects describing the invocations of this function. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.PushHook" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.PushHook">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFunc.PushHook
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the EnqueueRepoUpdate method of the parent MockRepoUpdaterClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.PushReturn" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.PushReturn">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushReturn(r0 *protocol.RepoUpdateResponse, r1 error)</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFunc.PushReturn
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushReturn(r0 *protocol.RepoUpdateResponse, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultHook" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultHook">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))
```

SetDefaultHook sets function that is called when the EnqueueRepoUpdate method of the parent MockRepoUpdaterClient instance is invoked and the hook queue is empty. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultReturn" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultReturn">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultReturn(r0 *protocol.RepoUpdateResponse, r1 error)</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultReturn(r0 *protocol.RepoUpdateResponse, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.appendCall" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.appendCall">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) appendCall(r0 RepoUpdaterClientEnqueueRepoUpdateFuncCall)</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFunc.appendCall
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) appendCall(r0 RepoUpdaterClientEnqueueRepoUpdateFuncCall)
```

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.nextHook" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.nextHook">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) nextHook() func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error)</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFunc.nextHook
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) nextHook() func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error)
```

### <a id="RepoUpdaterClientEnqueueRepoUpdateFuncCall" href="#RepoUpdaterClientEnqueueRepoUpdateFuncCall">type RepoUpdaterClientEnqueueRepoUpdateFuncCall struct</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFuncCall
tags: [struct private]
```

```Go
type RepoUpdaterClientEnqueueRepoUpdateFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.RepoName
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *protocol.RepoUpdateResponse
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

RepoUpdaterClientEnqueueRepoUpdateFuncCall is an object that describes an invocation of method EnqueueRepoUpdate on an instance of MockRepoUpdaterClient. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFuncCall.Args" href="#RepoUpdaterClientEnqueueRepoUpdateFuncCall.Args">func (c RepoUpdaterClientEnqueueRepoUpdateFuncCall) Args() []interface{}</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFuncCall.Args
tags: [method private]
```

```Go
func (c RepoUpdaterClientEnqueueRepoUpdateFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFuncCall.Results" href="#RepoUpdaterClientEnqueueRepoUpdateFuncCall.Results">func (c RepoUpdaterClientEnqueueRepoUpdateFuncCall) Results() []interface{}</a>

```
searchKey: resolvers.RepoUpdaterClientEnqueueRepoUpdateFuncCall.Results
tags: [method private]
```

```Go
func (c RepoUpdaterClientEnqueueRepoUpdateFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="Resolver" href="#Resolver">type Resolver interface</a>

```
searchKey: resolvers.Resolver
tags: [interface]
```

```Go
type Resolver interface {
	GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)
	GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)
	GetUploadsByIDs(ctx context.Context, ids ...int) ([]store.Upload, error)
	GetIndexesByIDs(ctx context.Context, ids ...int) ([]store.Index, error)
	UploadConnectionResolver(opts store.GetUploadsOptions) *UploadsResolver
	IndexConnectionResolver(opts store.GetIndexesOptions) *IndexesResolver
	DeleteUploadByID(ctx context.Context, uploadID int) error
	DeleteIndexByID(ctx context.Context, id int) error
	IndexConfiguration(ctx context.Context, repositoryID int) ([]byte, error)
	UpdateIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int, configuration string) error
	CommitGraph(ctx context.Context, repositoryID int) (gql.CodeIntelligenceCommitGraphResolver, error)
	QueueAutoIndexJobForRepo(ctx context.Context, repositoryID int) error
	QueryResolver(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (QueryResolver, error)
}
```

Resolver is the main interface to code intel-related operations exposed to the GraphQL API. This resolver consolidates the logic for code intel operations and is not itself concerned with GraphQL/API specifics (auth, validation, marshaling, etc.). This resolver is wrapped by a symmetrics resolver in this package's graphql subpackage, which is exposed directly by the API. 

#### <a id="NewResolver" href="#NewResolver">func NewResolver(dbStore DBStore,...</a>

```
searchKey: resolvers.NewResolver
tags: [function]
```

```Go
func NewResolver(
	dbStore DBStore,
	lsifStore LSIFStore,
	gitserverClient GitserverClient,
	indexEnqueuer IndexEnqueuer,
	hunkCache HunkCache,
	observationContext *observation.Context,
) Resolver
```

NewResolver creates a new resolver with the given services. 

### <a id="UploadsResolver" href="#UploadsResolver">type UploadsResolver struct</a>

```
searchKey: resolvers.UploadsResolver
tags: [struct]
```

```Go
type UploadsResolver struct {
	dbStore DBStore
	opts    store.GetUploadsOptions
	once    sync.Once
	//
	Uploads    []store.Upload
	TotalCount int
	NextOffset *int
	err        error
}
```

UploadsResolver wraps store.GetUploads so that the underlying function can be invoked lazily and its results memoized. 

#### <a id="NewUploadsResolver" href="#NewUploadsResolver">func NewUploadsResolver(dbStore DBStore, opts store.GetUploadsOptions) *UploadsResolver</a>

```
searchKey: resolvers.NewUploadsResolver
tags: [function]
```

```Go
func NewUploadsResolver(dbStore DBStore, opts store.GetUploadsOptions) *UploadsResolver
```

NewUploadsResolver creates a new UploadsResolver which wil invoke store.GetUploads with the given options. 

#### <a id="UploadsResolver.Resolve" href="#UploadsResolver.Resolve">func (r *UploadsResolver) Resolve(ctx context.Context) error</a>

```
searchKey: resolvers.UploadsResolver.Resolve
tags: [method]
```

```Go
func (r *UploadsResolver) Resolve(ctx context.Context) error
```

Resolve ensures that store.GetUploads has been invoked. This function returns the error from the invocation, if any. If the error is nil, then the resolver's Uploads, TotalCount, and NextOffset fields will be populated. 

#### <a id="UploadsResolver.resolve" href="#UploadsResolver.resolve">func (r *UploadsResolver) resolve(ctx context.Context) error</a>

```
searchKey: resolvers.UploadsResolver.resolve
tags: [method private]
```

```Go
func (r *UploadsResolver) resolve(ctx context.Context) error
```

### <a id="adjustPositionTestCase" href="#adjustPositionTestCase">type adjustPositionTestCase struct</a>

```
searchKey: resolvers.adjustPositionTestCase
tags: [struct private]
```

```Go
type adjustPositionTestCase struct {
	diff         string // The git diff output
	diffName     string // The git diff output name
	description  string // The description of the test
	line         int    // The target line (one-indexed)
	expectedOk   bool   // Whether the operation should succeed
	expectedLine int    // The expected adjusted line (one-indexed)
}
```

### <a id="adjustedUpload" href="#adjustedUpload">type adjustedUpload struct</a>

```
searchKey: resolvers.adjustedUpload
tags: [struct private]
```

```Go
type adjustedUpload struct {
	Upload               store.Dump
	AdjustedPath         string
	AdjustedPosition     lsifstore.Position
	AdjustedPathInBundle string
}
```

adjustedUpload pairs an upload visible from the current target commit with the current target path and position adjusted so that it matches the data within the underlying index. 

### <a id="cachedCommitChecker" href="#cachedCommitChecker">type cachedCommitChecker struct</a>

```
searchKey: resolvers.cachedCommitChecker
tags: [struct private]
```

```Go
type cachedCommitChecker struct {
	gitserverClient GitserverClient
	cache           map[int]map[string]bool
}
```

#### <a id="newCachedCommitChecker" href="#newCachedCommitChecker">func newCachedCommitChecker(gitserverClient GitserverClient) *cachedCommitChecker</a>

```
searchKey: resolvers.newCachedCommitChecker
tags: [function private]
```

```Go
func newCachedCommitChecker(gitserverClient GitserverClient) *cachedCommitChecker
```

#### <a id="cachedCommitChecker.exists" href="#cachedCommitChecker.exists">func (c *cachedCommitChecker) exists(ctx context.Context, repositoryID int, commit string) (bool, error)</a>

```
searchKey: resolvers.cachedCommitChecker.exists
tags: [method private]
```

```Go
func (c *cachedCommitChecker) exists(ctx context.Context, repositoryID int, commit string) (bool, error)
```

exists determines if the given commit is resolvable for the given repository. If we do not know the answer from a previous call to set or exists, we ask gitserver to resolve the commit and store the result for a subsequent call. 

#### <a id="cachedCommitChecker.set" href="#cachedCommitChecker.set">func (c *cachedCommitChecker) set(repositoryID int, commit string)</a>

```
searchKey: resolvers.cachedCommitChecker.set
tags: [method private]
```

```Go
func (c *cachedCommitChecker) set(repositoryID int, commit string)
```

set marks the given repository and commit as valid and resolvable by gitserver. 

### <a id="cursorAdjustedUpload" href="#cursorAdjustedUpload">type cursorAdjustedUpload struct</a>

```
searchKey: resolvers.cursorAdjustedUpload
tags: [struct private]
```

```Go
type cursorAdjustedUpload struct {
	DumpID               int                `json:"dumpID"`
	AdjustedPath         string             `json:"adjustedPath"`
	AdjustedPosition     lsifstore.Position `json:"adjustedPosition"`
	AdjustedPathInBundle string             `json:"adjustedPathInBundle"`
}
```

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: resolvers.operations
tags: [struct private]
```

```Go
type operations struct {
	queryResolver     *observation.Operation
	definitions       *observation.Operation
	diagnostics       *observation.Operation
	hover             *observation.Operation
	ranges            *observation.Operation
	references        *observation.Operation
	documentationPage *observation.Operation

	findClosestDumps *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context) *operations</a>

```
searchKey: resolvers.newOperations
tags: [function private]
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

### <a id="positionAdjuster" href="#positionAdjuster">type positionAdjuster struct</a>

```
searchKey: resolvers.positionAdjuster
tags: [struct private]
```

```Go
type positionAdjuster struct {
	repo      *types.Repo
	commit    string
	hunkCache HunkCache
}
```

#### <a id="positionAdjuster.AdjustPath" href="#positionAdjuster.AdjustPath">func (p *positionAdjuster) AdjustPath(ctx context.Context, commit, path string, reverse bool) (string, bool, error)</a>

```
searchKey: resolvers.positionAdjuster.AdjustPath
tags: [method private]
```

```Go
func (p *positionAdjuster) AdjustPath(ctx context.Context, commit, path string, reverse bool) (string, bool, error)
```

AdjustPath translates the given path from the source commit into the given target commit. If revese is true, then the source and target commits are swapped. 

#### <a id="positionAdjuster.AdjustPosition" href="#positionAdjuster.AdjustPosition">func (p *positionAdjuster) AdjustPosition(ctx context.Context, commit, path string, px lsifstore.Position, reverse bool) (string, lsifstore.Position, bool, error)</a>

```
searchKey: resolvers.positionAdjuster.AdjustPosition
tags: [method private]
```

```Go
func (p *positionAdjuster) AdjustPosition(ctx context.Context, commit, path string, px lsifstore.Position, reverse bool) (string, lsifstore.Position, bool, error)
```

AdjustPosition translates the given position from the source commit into the given target commit. The adjusted path and position are returned, along with a boolean flag indicating that the translation was successful. If revese is true, then the source and target commits are swapped. 

#### <a id="positionAdjuster.AdjustRange" href="#positionAdjuster.AdjustRange">func (p *positionAdjuster) AdjustRange(ctx context.Context, commit, path string, rx lsifstore.Range, reverse bool) (string, lsifstore.Range, bool, error)</a>

```
searchKey: resolvers.positionAdjuster.AdjustRange
tags: [method private]
```

```Go
func (p *positionAdjuster) AdjustRange(ctx context.Context, commit, path string, rx lsifstore.Range, reverse bool) (string, lsifstore.Range, bool, error)
```

AdjustRange translates the given range from the source commit into the given target commit. The adjusted path and range are returned, along with a boolean flag indicating that the translation was successful. If revese is true, then the source and target commits are swapped. 

#### <a id="positionAdjuster.readHunks" href="#positionAdjuster.readHunks">func (p *positionAdjuster) readHunks(ctx context.Context, repo *types.Repo, sourceCommit, targetCommit, path string) ([]*diff.Hunk, error)</a>

```
searchKey: resolvers.positionAdjuster.readHunks
tags: [method private]
```

```Go
func (p *positionAdjuster) readHunks(ctx context.Context, repo *types.Repo, sourceCommit, targetCommit, path string) ([]*diff.Hunk, error)
```

readHunks returns a position-ordered slice of changes (additions or deletions) of the given path between the given source and target commits. 

#### <a id="positionAdjuster.readHunksCached" href="#positionAdjuster.readHunksCached">func (p *positionAdjuster) readHunksCached(ctx context.Context, repo *types.Repo, sourceCommit, targetCommit, path string, reverse bool) ([]*diff.Hunk, error)</a>

```
searchKey: resolvers.positionAdjuster.readHunksCached
tags: [method private]
```

```Go
func (p *positionAdjuster) readHunksCached(ctx context.Context, repo *types.Repo, sourceCommit, targetCommit, path string, reverse bool) ([]*diff.Hunk, error)
```

readHunksCached returns a position-ordered slice of changes (additions or deletions) of the given path between the given source and target commits. If revese is true, then the source and target commits are swapped. If the position adjuster has a hunk cache, it will read from it before attempting to contact a remote server, and populate the cache with new results 

### <a id="qualifiedMonikerSet" href="#qualifiedMonikerSet">type qualifiedMonikerSet struct</a>

```
searchKey: resolvers.qualifiedMonikerSet
tags: [struct private]
```

```Go
type qualifiedMonikerSet struct {
	monikers       []semantic.QualifiedMonikerData
	monikerHashMap map[string]struct{}
}
```

#### <a id="newQualifiedMonikerSet" href="#newQualifiedMonikerSet">func newQualifiedMonikerSet() *qualifiedMonikerSet</a>

```
searchKey: resolvers.newQualifiedMonikerSet
tags: [function private]
```

```Go
func newQualifiedMonikerSet() *qualifiedMonikerSet
```

#### <a id="qualifiedMonikerSet.add" href="#qualifiedMonikerSet.add">func (s *qualifiedMonikerSet) add(qualifiedMoniker semantic.QualifiedMonikerData)</a>

```
searchKey: resolvers.qualifiedMonikerSet.add
tags: [method private]
```

```Go
func (s *qualifiedMonikerSet) add(qualifiedMoniker semantic.QualifiedMonikerData)
```

add the given qualified moniker to the set if it is distinct from all elements currently in the set. 

### <a id="queryResolver" href="#queryResolver">type queryResolver struct</a>

```
searchKey: resolvers.queryResolver
tags: [struct private]
```

```Go
type queryResolver struct {
	dbStore             DBStore
	lsifStore           LSIFStore
	cachedCommitChecker *cachedCommitChecker
	positionAdjuster    PositionAdjuster
	repositoryID        int
	commit              string
	path                string
	uploads             []store.Dump
	operations          *operations
}
```

#### <a id="newQueryResolver" href="#newQueryResolver">func newQueryResolver(dbStore DBStore,...</a>

```
searchKey: resolvers.newQueryResolver
tags: [function private]
```

```Go
func newQueryResolver(
	dbStore DBStore,
	lsifStore LSIFStore,
	cachedCommitChecker *cachedCommitChecker,
	positionAdjuster PositionAdjuster,
	repositoryID int,
	commit string,
	path string,
	uploads []store.Dump,
	operations *operations,
) *queryResolver
```

#### <a id="queryResolver.Definitions" href="#queryResolver.Definitions">func (r *queryResolver) Definitions(ctx context.Context, line, character int) (_ []AdjustedLocation, err error)</a>

```
searchKey: resolvers.queryResolver.Definitions
tags: [method private]
```

```Go
func (r *queryResolver) Definitions(ctx context.Context, line, character int) (_ []AdjustedLocation, err error)
```

Definitions returns the list of source locations that define the symbol at the given position. 

#### <a id="queryResolver.Diagnostics" href="#queryResolver.Diagnostics">func (r *queryResolver) Diagnostics(ctx context.Context, limit int) (adjustedDiagnostics []AdjustedDiagnostic, _ int, err error)</a>

```
searchKey: resolvers.queryResolver.Diagnostics
tags: [method private]
```

```Go
func (r *queryResolver) Diagnostics(ctx context.Context, limit int) (adjustedDiagnostics []AdjustedDiagnostic, _ int, err error)
```

Diagnostics returns the diagnostics for documents with the given path prefix. 

#### <a id="queryResolver.DocumentationPage" href="#queryResolver.DocumentationPage">func (r *queryResolver) DocumentationPage(ctx context.Context, pathID string) (_ *semantic.DocumentationPageData, err error)</a>

```
searchKey: resolvers.queryResolver.DocumentationPage
tags: [method private]
```

```Go
func (r *queryResolver) DocumentationPage(ctx context.Context, pathID string) (_ *semantic.DocumentationPageData, err error)
```

DocumentationPage returns the DocumentationPage for the given PathID. 

nil, nil is returned if the page does not exist. 

#### <a id="queryResolver.Hover" href="#queryResolver.Hover">func (r *queryResolver) Hover(ctx context.Context, line, character int) (_ string, _ lsifstore.Range, _ bool, err error)</a>

```
searchKey: resolvers.queryResolver.Hover
tags: [method private]
```

```Go
func (r *queryResolver) Hover(ctx context.Context, line, character int) (_ string, _ lsifstore.Range, _ bool, err error)
```

Hover returns the hover text and range for the symbol at the given position. 

#### <a id="queryResolver.Ranges" href="#queryResolver.Ranges">func (r *queryResolver) Ranges(ctx context.Context, startLine, endLine int) (adjustedRanges []AdjustedCodeIntelligenceRange, err error)</a>

```
searchKey: resolvers.queryResolver.Ranges
tags: [method private]
```

```Go
func (r *queryResolver) Ranges(ctx context.Context, startLine, endLine int) (adjustedRanges []AdjustedCodeIntelligenceRange, err error)
```

Ranges returns code intelligence for the ranges that fall within the given range of lines. These results are partial and do not include references outside the current file, or any location that requires cross-linking of bundles (cross-repo or cross-root). 

#### <a id="queryResolver.References" href="#queryResolver.References">func (r *queryResolver) References(ctx context.Context, line, character, limit int, rawCursor string) (_ []AdjustedLocation, _ string, err error)</a>

```
searchKey: resolvers.queryResolver.References
tags: [method private]
```

```Go
func (r *queryResolver) References(ctx context.Context, line, character, limit int, rawCursor string) (_ []AdjustedLocation, _ string, err error)
```

References returns the list of source locations that reference the symbol at the given position. 

#### <a id="queryResolver.adjustCodeIntelligenceRange" href="#queryResolver.adjustCodeIntelligenceRange">func (r *queryResolver) adjustCodeIntelligenceRange(ctx context.Context, upload adjustedUpload, rn lsifstore.CodeIntelligenceRange) (AdjustedCodeIntelligenceRange, bool, error)</a>

```
searchKey: resolvers.queryResolver.adjustCodeIntelligenceRange
tags: [method private]
```

```Go
func (r *queryResolver) adjustCodeIntelligenceRange(ctx context.Context, upload adjustedUpload, rn lsifstore.CodeIntelligenceRange) (AdjustedCodeIntelligenceRange, bool, error)
```

adjustCodeIntelligenceRange translates a range summary (relative to the indexed commit) into an equivalent range summary in the requested commit. If the translation fails, a false-valued flag is returned. 

#### <a id="queryResolver.adjustDiagnostic" href="#queryResolver.adjustDiagnostic">func (r *queryResolver) adjustDiagnostic(ctx context.Context, adjustedUpload adjustedUpload, diagnostic lsifstore.Diagnostic) (AdjustedDiagnostic, error)</a>

```
searchKey: resolvers.queryResolver.adjustDiagnostic
tags: [method private]
```

```Go
func (r *queryResolver) adjustDiagnostic(ctx context.Context, adjustedUpload adjustedUpload, diagnostic lsifstore.Diagnostic) (AdjustedDiagnostic, error)
```

adjustDiagnostic translates a diagnostic (relative to the indexed commit) into an equivalent diagnostic in the requested commit. 

#### <a id="queryResolver.adjustLocation" href="#queryResolver.adjustLocation">func (r *queryResolver) adjustLocation(ctx context.Context, dump store.Dump, location lsifstore.Location) (AdjustedLocation, error)</a>

```
searchKey: resolvers.queryResolver.adjustLocation
tags: [method private]
```

```Go
func (r *queryResolver) adjustLocation(ctx context.Context, dump store.Dump, location lsifstore.Location) (AdjustedLocation, error)
```

adjustLocation translates a location (relative to the indexed commit) into an equivalent location in the requested commit. If the translation fails, then the original commit and range are used as the commit and range of the adjusted location. 

#### <a id="queryResolver.adjustLocations" href="#queryResolver.adjustLocations">func (r *queryResolver) adjustLocations(ctx context.Context, uploadsByID map[int]dbstore.Dump, locations []lsifstore.Location) ([]AdjustedLocation, error)</a>

```
searchKey: resolvers.queryResolver.adjustLocations
tags: [method private]
```

```Go
func (r *queryResolver) adjustLocations(ctx context.Context, uploadsByID map[int]dbstore.Dump, locations []lsifstore.Location) ([]AdjustedLocation, error)
```

adjustLocations translates a set of locations into an equivalent set of locations in the requested commit. 

#### <a id="queryResolver.adjustRange" href="#queryResolver.adjustRange">func (r *queryResolver) adjustRange(ctx context.Context, repositoryID int, commit, path string, rn lsifstore.Range) (string, lsifstore.Range, bool, error)</a>

```
searchKey: resolvers.queryResolver.adjustRange
tags: [method private]
```

```Go
func (r *queryResolver) adjustRange(ctx context.Context, repositoryID int, commit, path string, rn lsifstore.Range) (string, lsifstore.Range, bool, error)
```

adjustRange translates a range (relative to the indexed commit) into an equivalent range in the requested commit. If the translation fails, then the original commit and range are returned along with a false-valued flag. 

#### <a id="queryResolver.adjustUpload" href="#queryResolver.adjustUpload">func (r *queryResolver) adjustUpload(ctx context.Context, line, character int, upload store.Dump) (adjustedUpload, bool, error)</a>

```
searchKey: resolvers.queryResolver.adjustUpload
tags: [method private]
```

```Go
func (r *queryResolver) adjustUpload(ctx context.Context, line, character int, upload store.Dump) (adjustedUpload, bool, error)
```

adjustUpload adjusts the current target path and the given position for the given upload. If the upload cannot be adjusted, a false-valued flag is returned. 

#### <a id="queryResolver.adjustUploadPaths" href="#queryResolver.adjustUploadPaths">func (r *queryResolver) adjustUploadPaths(ctx context.Context) ([]adjustedUpload, error)</a>

```
searchKey: resolvers.queryResolver.adjustUploadPaths
tags: [method private]
```

```Go
func (r *queryResolver) adjustUploadPaths(ctx context.Context) ([]adjustedUpload, error)
```

adjustUploadPaths adjusts the current target path for each upload visible from the current target commit. If an upload cannot be adjusted, it will be omitted from the returned slice. 

#### <a id="queryResolver.adjustUploads" href="#queryResolver.adjustUploads">func (r *queryResolver) adjustUploads(ctx context.Context, line, character int) ([]adjustedUpload, error)</a>

```
searchKey: resolvers.queryResolver.adjustUploads
tags: [method private]
```

```Go
func (r *queryResolver) adjustUploads(ctx context.Context, line, character int) ([]adjustedUpload, error)
```

adjustUploads adjusts the current target path and the given position for each upload visible from the current target commit. If an upload cannot be adjusted, it will be omitted from the returned slice. 

#### <a id="queryResolver.adjustedUploadsFromCursor" href="#queryResolver.adjustedUploadsFromCursor">func (r *queryResolver) adjustedUploadsFromCursor(ctx context.Context, line, character int, uploadsByID map[int]dbstore.Dump, cursor *referencesCursor) ([]adjustedUpload, error)</a>

```
searchKey: resolvers.queryResolver.adjustedUploadsFromCursor
tags: [method private]
```

```Go
func (r *queryResolver) adjustedUploadsFromCursor(ctx context.Context, line, character int, uploadsByID map[int]dbstore.Dump, cursor *referencesCursor) ([]adjustedUpload, error)
```

adjustedUploadsFromCursor adjusts the current target path and the given position for each upload visible from the current target commit. If an upload cannot be adjusted, it will be omitted from the returned slice. The returned slice will be cached on the given cursor. If this data is already stashed on the given cursor, the result is recalculated from the cursor data/resolver context, and we don't need to hit the database. 

An error is returned if the set of visible uploads has changed since the previous request of this result set (specifically if an index becomes invisible). This behavior may change in the future. 

#### <a id="queryResolver.definitionUploadIDsFromCursor" href="#queryResolver.definitionUploadIDsFromCursor">func (r *queryResolver) definitionUploadIDsFromCursor(ctx context.Context, adjustedUploads []adjustedUpload, orderedMonikers []semantic.QualifiedMonikerData, cursor *referencesCursor) ([]int, []dbstore.Dump, error)</a>

```
searchKey: resolvers.queryResolver.definitionUploadIDsFromCursor
tags: [method private]
```

```Go
func (r *queryResolver) definitionUploadIDsFromCursor(ctx context.Context, adjustedUploads []adjustedUpload, orderedMonikers []semantic.QualifiedMonikerData, cursor *referencesCursor) ([]int, []dbstore.Dump, error)
```

definitionUploadIDsFromCursor returns a set of identifiers for uploads that provide any of the given monikers. Uploads already present in the given adjusted uploads slice will be omitted from the returned slice. The returned slice will be cached on the given cursor. If this data is already stashed in the given cursor, we don't need to hit the database. 

The upload records returned from the database, if any, are also returned from this method to help reduce the number of database queries necessary. 

#### <a id="queryResolver.definitionUploads" href="#queryResolver.definitionUploads">func (r *queryResolver) definitionUploads(ctx context.Context, orderedMonikers []semantic.QualifiedMonikerData) ([]store.Dump, error)</a>

```
searchKey: resolvers.queryResolver.definitionUploads
tags: [method private]
```

```Go
func (r *queryResolver) definitionUploads(ctx context.Context, orderedMonikers []semantic.QualifiedMonikerData) ([]store.Dump, error)
```

definitionUploads returns the set of uploads that provide any of the given monikers. This method will not return uploads for commits which are unknown to gitserver. 

#### <a id="queryResolver.monikerLocations" href="#queryResolver.monikerLocations">func (r *queryResolver) monikerLocations(ctx context.Context, uploads []dbstore.Dump, orderedMonikers []semantic.QualifiedMonikerData, tableName string, limit, offset int) ([]lsifstore.Location, int, error)</a>

```
searchKey: resolvers.queryResolver.monikerLocations
tags: [method private]
```

```Go
func (r *queryResolver) monikerLocations(ctx context.Context, uploads []dbstore.Dump, orderedMonikers []semantic.QualifiedMonikerData, tableName string, limit, offset int) ([]lsifstore.Location, int, error)
```

monikerLocations returns the set of locations defined by any of the given uploads tagged with any of the given monikers. 

#### <a id="queryResolver.orderedMonikers" href="#queryResolver.orderedMonikers">func (r *queryResolver) orderedMonikers(ctx context.Context, adjustedUploads []adjustedUpload, kind string) ([]semantic.QualifiedMonikerData, error)</a>

```
searchKey: resolvers.queryResolver.orderedMonikers
tags: [method private]
```

```Go
func (r *queryResolver) orderedMonikers(ctx context.Context, adjustedUploads []adjustedUpload, kind string) ([]semantic.QualifiedMonikerData, error)
```

orderedMonikers returns the set of monikers attached to the ranges specified by the given upload list. If kind is a non-empty string, monikers with a distinct kind are ignored. 

The return slice is ordered by visible upload, then by specificity, i.e., monikers attached to enclosed ranges before before monikers attached to enclosing ranges. Monikers are de-duplicated, such that the second (third, ...) occurrences are removed. 

#### <a id="queryResolver.orderedMonikersFromCursor" href="#queryResolver.orderedMonikersFromCursor">func (r *queryResolver) orderedMonikersFromCursor(ctx context.Context, adjustedUploads []adjustedUpload, cursor *referencesCursor) ([]semantic.QualifiedMonikerData, error)</a>

```
searchKey: resolvers.queryResolver.orderedMonikersFromCursor
tags: [method private]
```

```Go
func (r *queryResolver) orderedMonikersFromCursor(ctx context.Context, adjustedUploads []adjustedUpload, cursor *referencesCursor) ([]semantic.QualifiedMonikerData, error)
```

orderedMonikersFromCursor returns the set of monikers attached to the ranges specified by the given upload list. The returned slice will be cached on the given cursor. If this data is already stashed in the given cursor, we don't need to hit the database. 

#### <a id="queryResolver.pageLocalReferences" href="#queryResolver.pageLocalReferences">func (r *queryResolver) pageLocalReferences(ctx context.Context, adjustedUploads []adjustedUpload, cursor *referencesCursor, limit int) ([]lsifstore.Location, bool, error)</a>

```
searchKey: resolvers.queryResolver.pageLocalReferences
tags: [method private]
```

```Go
func (r *queryResolver) pageLocalReferences(ctx context.Context, adjustedUploads []adjustedUpload, cursor *referencesCursor, limit int) ([]lsifstore.Location, bool, error)
```

pageLocalReferences returns a slice of the (local) result set denoted by the given cursor fulfilled by traversing the LSIF graph. The given cursor will be adjusted to reflect the offsets required to resolve the next page of results. If there are no more pages left in the result set, a false-valued flag is returned. 

#### <a id="queryResolver.pageReferences" href="#queryResolver.pageReferences">func (r *queryResolver) pageReferences(ctx context.Context, adjustedUploads []adjustedUpload, orderedMonikers []semantic.QualifiedMonikerData, definitionUploadIDs []int, uploadsByID map[int]dbstore.Dump, cursor *referencesCursor, limit int) ([]lsifstore.Location, bool, error)</a>

```
searchKey: resolvers.queryResolver.pageReferences
tags: [method private]
```

```Go
func (r *queryResolver) pageReferences(ctx context.Context, adjustedUploads []adjustedUpload, orderedMonikers []semantic.QualifiedMonikerData, definitionUploadIDs []int, uploadsByID map[int]dbstore.Dump, cursor *referencesCursor, limit int) ([]lsifstore.Location, bool, error)
```

pageReferences returns a slice of the result set denoted by the given cursor. The given cursor will be adjusted to reflect the offsets required to resolve the next page of results. If there are no more pages left in the result set, a false-valued flag is returned. 

#### <a id="queryResolver.pageRemoteReferences" href="#queryResolver.pageRemoteReferences">func (r *queryResolver) pageRemoteReferences(ctx context.Context, adjustedUploads []adjustedUpload, orderedMonikers []semantic.QualifiedMonikerData, definitionUploadIDs []int, uploadsByID map[int]dbstore.Dump, cursor *referencesCursor, limit int) ([]lsifstore.Location, bool, error)</a>

```
searchKey: resolvers.queryResolver.pageRemoteReferences
tags: [method private]
```

```Go
func (r *queryResolver) pageRemoteReferences(ctx context.Context, adjustedUploads []adjustedUpload, orderedMonikers []semantic.QualifiedMonikerData, definitionUploadIDs []int, uploadsByID map[int]dbstore.Dump, cursor *referencesCursor, limit int) ([]lsifstore.Location, bool, error)
```

pageRemoteReferences returns a slice of the (remote) result set denoted by the given cursor fulfilled by performing a moniker search over a group of indexes. The given cursor will be adjusted to reflect the offsets required to resolve the next page of results. If there are no more pages left in the result set, a false-valued flag is returned. 

#### <a id="queryResolver.uploadIDsWithReferences" href="#queryResolver.uploadIDsWithReferences">func (r *queryResolver) uploadIDsWithReferences(ctx context.Context, orderedMonikers []semantic.QualifiedMonikerData, ignoreIDs []int, limit, offset int) (ids []int, recordsScanned int, totalCount int, err error)</a>

```
searchKey: resolvers.queryResolver.uploadIDsWithReferences
tags: [method private]
```

```Go
func (r *queryResolver) uploadIDsWithReferences(ctx context.Context, orderedMonikers []semantic.QualifiedMonikerData, ignoreIDs []int, limit, offset int) (ids []int, recordsScanned int, totalCount int, err error)
```

uploadIDsWithReferences returns a slice of uploads that contain a reference to any of the given identifiers. This method will not return uploads for commits which are unknown to gitserver, nor will it return uploads which are listed in the given ignored identifier slice. This method also returns the number of records scanned (but possibly filtered out from the return slice) from the database (the offset for the subsequent request) and the total number of records in the database. 

#### <a id="queryResolver.uploadsByIDs" href="#queryResolver.uploadsByIDs">func (r *queryResolver) uploadsByIDs(ctx context.Context, ids []int, uploadsByIDs map[int]dbstore.Dump) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.queryResolver.uploadsByIDs
tags: [method private]
```

```Go
func (r *queryResolver) uploadsByIDs(ctx context.Context, ids []int, uploadsByIDs map[int]dbstore.Dump) ([]dbstore.Dump, error)
```

uploadsByIDs returns a slice of uploads with the given identifiers. This method will not return a new upload record for a commit which is unknown to gitserver. The given upload map is used as a caching mechanism - uploads present in the map are not fetched again from the database. 

### <a id="referencesCursor" href="#referencesCursor">type referencesCursor struct</a>

```
searchKey: resolvers.referencesCursor
tags: [struct private]
```

```Go
type referencesCursor struct {
	AdjustedUploads           []cursorAdjustedUpload          `json:"adjustedUploads"`
	DefinitionUploadIDs       []int                           `json:"definitionUploadIDs"`
	DefinitionUploadIDsCached bool                            `json:"definitionUploadIDsCached"`
	OrderedMonikers           []semantic.QualifiedMonikerData `json:"orderedMonikers"`
	RemotePhase               bool                            `json:"remotePhase"`
	LocalOffset               int                             `json:"localOffset"`
	LocalBatchOffset          int                             `json:"localBatchOffset"`
	BatchIDs                  []int                           `json:"batchIDs"`
	RemoteOffset              int                             `json:"remoteOffset"`
	RemoteBatchOffset         int                             `json:"remoteBatchOffset"`
}
```

referencesCursor stores (enough of) the state of a previous References request used to calculate the offset into the result set to be returned by the current request. 

#### <a id="decodeCursor" href="#decodeCursor">func decodeCursor(rawEncoded string) (referencesCursor, error)</a>

```
searchKey: resolvers.decodeCursor
tags: [function private]
```

```Go
func decodeCursor(rawEncoded string) (referencesCursor, error)
```

decodeCursor is the inverse of encodeCursor. If the given encoded string is empty, then a fresh cursor is returned. 

### <a id="resolver" href="#resolver">type resolver struct</a>

```
searchKey: resolvers.resolver
tags: [struct private]
```

```Go
type resolver struct {
	dbStore         DBStore
	lsifStore       LSIFStore
	gitserverClient GitserverClient
	indexEnqueuer   IndexEnqueuer
	hunkCache       HunkCache
	operations      *operations
}
```

#### <a id="newResolver" href="#newResolver">func newResolver(dbStore DBStore,...</a>

```
searchKey: resolvers.newResolver
tags: [function private]
```

```Go
func newResolver(
	dbStore DBStore,
	lsifStore LSIFStore,
	gitserverClient GitserverClient,
	indexEnqueuer IndexEnqueuer,
	hunkCache HunkCache,
	observationContext *observation.Context,
) *resolver
```

#### <a id="resolver.CommitGraph" href="#resolver.CommitGraph">func (r *resolver) CommitGraph(ctx context.Context, repositoryID int) (gql.CodeIntelligenceCommitGraphResolver, error)</a>

```
searchKey: resolvers.resolver.CommitGraph
tags: [method private]
```

```Go
func (r *resolver) CommitGraph(ctx context.Context, repositoryID int) (gql.CodeIntelligenceCommitGraphResolver, error)
```

#### <a id="resolver.DeleteIndexByID" href="#resolver.DeleteIndexByID">func (r *resolver) DeleteIndexByID(ctx context.Context, id int) error</a>

```
searchKey: resolvers.resolver.DeleteIndexByID
tags: [method private]
```

```Go
func (r *resolver) DeleteIndexByID(ctx context.Context, id int) error
```

#### <a id="resolver.DeleteUploadByID" href="#resolver.DeleteUploadByID">func (r *resolver) DeleteUploadByID(ctx context.Context, uploadID int) error</a>

```
searchKey: resolvers.resolver.DeleteUploadByID
tags: [method private]
```

```Go
func (r *resolver) DeleteUploadByID(ctx context.Context, uploadID int) error
```

#### <a id="resolver.GetIndexByID" href="#resolver.GetIndexByID">func (r *resolver) GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)</a>

```
searchKey: resolvers.resolver.GetIndexByID
tags: [method private]
```

```Go
func (r *resolver) GetIndexByID(ctx context.Context, id int) (store.Index, bool, error)
```

#### <a id="resolver.GetIndexesByIDs" href="#resolver.GetIndexesByIDs">func (r *resolver) GetIndexesByIDs(ctx context.Context, ids ...int) ([]store.Index, error)</a>

```
searchKey: resolvers.resolver.GetIndexesByIDs
tags: [method private]
```

```Go
func (r *resolver) GetIndexesByIDs(ctx context.Context, ids ...int) ([]store.Index, error)
```

#### <a id="resolver.GetUploadByID" href="#resolver.GetUploadByID">func (r *resolver) GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)</a>

```
searchKey: resolvers.resolver.GetUploadByID
tags: [method private]
```

```Go
func (r *resolver) GetUploadByID(ctx context.Context, id int) (store.Upload, bool, error)
```

#### <a id="resolver.GetUploadsByIDs" href="#resolver.GetUploadsByIDs">func (r *resolver) GetUploadsByIDs(ctx context.Context, ids ...int) ([]store.Upload, error)</a>

```
searchKey: resolvers.resolver.GetUploadsByIDs
tags: [method private]
```

```Go
func (r *resolver) GetUploadsByIDs(ctx context.Context, ids ...int) ([]store.Upload, error)
```

#### <a id="resolver.IndexConfiguration" href="#resolver.IndexConfiguration">func (r *resolver) IndexConfiguration(ctx context.Context, repositoryID int) ([]byte, error)</a>

```
searchKey: resolvers.resolver.IndexConfiguration
tags: [method private]
```

```Go
func (r *resolver) IndexConfiguration(ctx context.Context, repositoryID int) ([]byte, error)
```

#### <a id="resolver.IndexConnectionResolver" href="#resolver.IndexConnectionResolver">func (r *resolver) IndexConnectionResolver(opts store.GetIndexesOptions) *IndexesResolver</a>

```
searchKey: resolvers.resolver.IndexConnectionResolver
tags: [method private]
```

```Go
func (r *resolver) IndexConnectionResolver(opts store.GetIndexesOptions) *IndexesResolver
```

#### <a id="resolver.QueryResolver" href="#resolver.QueryResolver">func (r *resolver) QueryResolver(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (_ QueryResolver, err error)</a>

```
searchKey: resolvers.resolver.QueryResolver
tags: [method private]
```

```Go
func (r *resolver) QueryResolver(ctx context.Context, args *gql.GitBlobLSIFDataArgs) (_ QueryResolver, err error)
```

QueryResolver determines the set of dumps that can answer code intel queries for the given repository, commit, and path, then constructs a new query resolver instance which can be used to answer subsequent queries. 

#### <a id="resolver.QueueAutoIndexJobForRepo" href="#resolver.QueueAutoIndexJobForRepo">func (r *resolver) QueueAutoIndexJobForRepo(ctx context.Context, repositoryID int) error</a>

```
searchKey: resolvers.resolver.QueueAutoIndexJobForRepo
tags: [method private]
```

```Go
func (r *resolver) QueueAutoIndexJobForRepo(ctx context.Context, repositoryID int) error
```

#### <a id="resolver.UpdateIndexConfigurationByRepositoryID" href="#resolver.UpdateIndexConfigurationByRepositoryID">func (r *resolver) UpdateIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int, configuration string) error</a>

```
searchKey: resolvers.resolver.UpdateIndexConfigurationByRepositoryID
tags: [method private]
```

```Go
func (r *resolver) UpdateIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int, configuration string) error
```

#### <a id="resolver.UploadConnectionResolver" href="#resolver.UploadConnectionResolver">func (r *resolver) UploadConnectionResolver(opts store.GetUploadsOptions) *UploadsResolver</a>

```
searchKey: resolvers.resolver.UploadConnectionResolver
tags: [method private]
```

```Go
func (r *resolver) UploadConnectionResolver(opts store.GetUploadsOptions) *UploadsResolver
```

#### <a id="resolver.findClosestDumps" href="#resolver.findClosestDumps">func (r *resolver) findClosestDumps(ctx context.Context, cachedCommitChecker *cachedCommitChecker, repositoryID int, commit, path string, exactPath bool, indexer string) (_ []store.Dump, err error)</a>

```
searchKey: resolvers.resolver.findClosestDumps
tags: [method private]
```

```Go
func (r *resolver) findClosestDumps(ctx context.Context, cachedCommitChecker *cachedCommitChecker, repositoryID int, commit, path string, exactPath bool, indexer string) (_ []store.Dump, err error)
```

findClosestDumps returns the set of dumps that can most accurately answer code intelligence queries for the given path. If exactPath is true, then only dumps that definitely contain the exact document path are returned. Otherwise, dumps containing any document for which the given path is a prefix are returned. These dump IDs should be subsequently passed to invocations of Definitions, References, and Hover. 

#### <a id="resolver.inferClosestUploads" href="#resolver.inferClosestUploads">func (r *resolver) inferClosestUploads(ctx context.Context, repositoryID int, commit, path string, exactPath bool, indexer string) ([]store.Dump, error)</a>

```
searchKey: resolvers.resolver.inferClosestUploads
tags: [method private]
```

```Go
func (r *resolver) inferClosestUploads(ctx context.Context, repositoryID int, commit, path string, exactPath bool, indexer string) ([]store.Dump, error)
```

inferClosestUploads will return the set of visible uploads for the given commit. If this commit is newer than our last refresh of the lsif_nearest_uploads table for this repository, then we will mark the repository as dirty and quickly approximate the correct set of visible uploads. 

Because updating the entire commit graph is a blocking, expensive, and lock-guarded process, we  want to only do that in the background and do something chearp in latency-sensitive paths. To construct an approximate result, we query gitserver for a (relatively small) set of ancestors for the given commit, correlate that with the upload data we have for those commits, and re-run the visibility algorithm over the graph. This will not always produce the full set of visible commits - some responses may not contain all results while a subsequent request made after the lsif_nearest_uploads has been updated to include this commit will. 

TODO(efritz) - show an indication in the GraphQL response and the UI that this repo is refreshing. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestAdjustPath" href="#TestAdjustPath">func TestAdjustPath(t *testing.T)</a>

```
searchKey: resolvers.TestAdjustPath
tags: [function private test]
```

```Go
func TestAdjustPath(t *testing.T)
```

### <a id="TestAdjustPosition" href="#TestAdjustPosition">func TestAdjustPosition(t *testing.T)</a>

```
searchKey: resolvers.TestAdjustPosition
tags: [function private test]
```

```Go
func TestAdjustPosition(t *testing.T)
```

### <a id="TestAdjustPositionEmptyDiff" href="#TestAdjustPositionEmptyDiff">func TestAdjustPositionEmptyDiff(t *testing.T)</a>

```
searchKey: resolvers.TestAdjustPositionEmptyDiff
tags: [function private test]
```

```Go
func TestAdjustPositionEmptyDiff(t *testing.T)
```

### <a id="TestAdjustPositionReverse" href="#TestAdjustPositionReverse">func TestAdjustPositionReverse(t *testing.T)</a>

```
searchKey: resolvers.TestAdjustPositionReverse
tags: [function private test]
```

```Go
func TestAdjustPositionReverse(t *testing.T)
```

### <a id="TestAdjustRange" href="#TestAdjustRange">func TestAdjustRange(t *testing.T)</a>

```
searchKey: resolvers.TestAdjustRange
tags: [function private test]
```

```Go
func TestAdjustRange(t *testing.T)
```

### <a id="TestAdjustRangeEmptyDiff" href="#TestAdjustRangeEmptyDiff">func TestAdjustRangeEmptyDiff(t *testing.T)</a>

```
searchKey: resolvers.TestAdjustRangeEmptyDiff
tags: [function private test]
```

```Go
func TestAdjustRangeEmptyDiff(t *testing.T)
```

### <a id="TestAdjustRangeReverse" href="#TestAdjustRangeReverse">func TestAdjustRangeReverse(t *testing.T)</a>

```
searchKey: resolvers.TestAdjustRangeReverse
tags: [function private test]
```

```Go
func TestAdjustRangeReverse(t *testing.T)
```

### <a id="TestDefinitions" href="#TestDefinitions">func TestDefinitions(t *testing.T)</a>

```
searchKey: resolvers.TestDefinitions
tags: [function private test]
```

```Go
func TestDefinitions(t *testing.T)
```

### <a id="TestDefinitionsRemote" href="#TestDefinitionsRemote">func TestDefinitionsRemote(t *testing.T)</a>

```
searchKey: resolvers.TestDefinitionsRemote
tags: [function private test]
```

```Go
func TestDefinitionsRemote(t *testing.T)
```

### <a id="TestDiagnostics" href="#TestDiagnostics">func TestDiagnostics(t *testing.T)</a>

```
searchKey: resolvers.TestDiagnostics
tags: [function private test]
```

```Go
func TestDiagnostics(t *testing.T)
```

### <a id="TestFallbackIndexConfiguration" href="#TestFallbackIndexConfiguration">func TestFallbackIndexConfiguration(t *testing.T)</a>

```
searchKey: resolvers.TestFallbackIndexConfiguration
tags: [function private test]
```

```Go
func TestFallbackIndexConfiguration(t *testing.T)
```

### <a id="TestFindClosestDumps" href="#TestFindClosestDumps">func TestFindClosestDumps(t *testing.T)</a>

```
searchKey: resolvers.TestFindClosestDumps
tags: [function private test]
```

```Go
func TestFindClosestDumps(t *testing.T)
```

### <a id="TestFindClosestDumpsDoesNotInferClosestUploadForUnknownRepository" href="#TestFindClosestDumpsDoesNotInferClosestUploadForUnknownRepository">func TestFindClosestDumpsDoesNotInferClosestUploadForUnknownRepository(t *testing.T)</a>

```
searchKey: resolvers.TestFindClosestDumpsDoesNotInferClosestUploadForUnknownRepository
tags: [function private test]
```

```Go
func TestFindClosestDumpsDoesNotInferClosestUploadForUnknownRepository(t *testing.T)
```

### <a id="TestFindClosestDumpsInfersClosestUploads" href="#TestFindClosestDumpsInfersClosestUploads">func TestFindClosestDumpsInfersClosestUploads(t *testing.T)</a>

```
searchKey: resolvers.TestFindClosestDumpsInfersClosestUploads
tags: [function private test]
```

```Go
func TestFindClosestDumpsInfersClosestUploads(t *testing.T)
```

### <a id="TestHover" href="#TestHover">func TestHover(t *testing.T)</a>

```
searchKey: resolvers.TestHover
tags: [function private test]
```

```Go
func TestHover(t *testing.T)
```

### <a id="TestHoverRemote" href="#TestHoverRemote">func TestHoverRemote(t *testing.T)</a>

```
searchKey: resolvers.TestHoverRemote
tags: [function private test]
```

```Go
func TestHoverRemote(t *testing.T)
```

### <a id="TestQueryResolver" href="#TestQueryResolver">func TestQueryResolver(t *testing.T)</a>

```
searchKey: resolvers.TestQueryResolver
tags: [function private test]
```

```Go
func TestQueryResolver(t *testing.T)
```

### <a id="TestRanges" href="#TestRanges">func TestRanges(t *testing.T)</a>

```
searchKey: resolvers.TestRanges
tags: [function private test]
```

```Go
func TestRanges(t *testing.T)
```

### <a id="TestRawAdjustPosition" href="#TestRawAdjustPosition">func TestRawAdjustPosition(t *testing.T)</a>

```
searchKey: resolvers.TestRawAdjustPosition
tags: [function private test]
```

```Go
func TestRawAdjustPosition(t *testing.T)
```

### <a id="TestReferences" href="#TestReferences">func TestReferences(t *testing.T)</a>

```
searchKey: resolvers.TestReferences
tags: [function private test]
```

```Go
func TestReferences(t *testing.T)
```

### <a id="TestReferencesRemote" href="#TestReferencesRemote">func TestReferencesRemote(t *testing.T)</a>

```
searchKey: resolvers.TestReferencesRemote
tags: [function private test]
```

```Go
func TestReferencesRemote(t *testing.T)
```

### <a id="adjustLine" href="#adjustLine">func adjustLine(hunks []*diff.Hunk, line int) (int, bool)</a>

```
searchKey: resolvers.adjustLine
tags: [function private]
```

```Go
func adjustLine(hunks []*diff.Hunk, line int) (int, bool)
```

adjustLine translates the given line nubmerbased on the number of additions and deletions that occur before that line. This function returns a boolean flag indicating that the translation is successful. A translation fails when the given line has been edited. 

### <a id="adjustPosition" href="#adjustPosition">func adjustPosition(hunks []*diff.Hunk, pos lsifstore.Position) (lsifstore.Position, bool)</a>

```
searchKey: resolvers.adjustPosition
tags: [function private]
```

```Go
func adjustPosition(hunks []*diff.Hunk, pos lsifstore.Position) (lsifstore.Position, bool)
```

adjustPosition translates the given position by adjusting the line number based on the number of additions and deletions that occur before that line. This function returns a boolean flag indicating that the translation is successful. A translation fails when the line indicated by the position has been edited. 

### <a id="adjustRange" href="#adjustRange">func adjustRange(hunks []*diff.Hunk, r lsifstore.Range) (lsifstore.Range, bool)</a>

```
searchKey: resolvers.adjustRange
tags: [function private]
```

```Go
func adjustRange(hunks []*diff.Hunk, r lsifstore.Range) (lsifstore.Range, bool)
```

adjustRange translates the given range by calling adjustPosition on both of the range's endpoints. This function returns a boolean flag indicating that the translation was successful (which occurs when both endpoints of the range can be translated). 

### <a id="createHoneyEvent" href="#createHoneyEvent">func createHoneyEvent(ctx context.Context, name string, observationArgs observation.Args, err *error, duration time.Duration) *libhoney.Event</a>

```
searchKey: resolvers.createHoneyEvent
tags: [function private]
```

```Go
func createHoneyEvent(ctx context.Context, name string, observationArgs observation.Args, err *error, duration time.Duration) *libhoney.Event
```

### <a id="encodeCursor" href="#encodeCursor">func encodeCursor(cursor referencesCursor) string</a>

```
searchKey: resolvers.encodeCursor
tags: [function private]
```

```Go
func encodeCursor(cursor referencesCursor) string
```

encodeCursor returns an encoding of the given cursor suitable for a URL or a GraphQL token. 

### <a id="filterUploadsWithCommits" href="#filterUploadsWithCommits">func filterUploadsWithCommits(ctx context.Context, cachedCommitChecker *cachedCommitChecker, uploads []dbstore.Dump) ([]dbstore.Dump, error)</a>

```
searchKey: resolvers.filterUploadsWithCommits
tags: [function private]
```

```Go
func filterUploadsWithCommits(ctx context.Context, cachedCommitChecker *cachedCommitChecker, uploads []dbstore.Dump) ([]dbstore.Dump, error)
```

filterUploadsWithCommits removes the uploads for commits which are unknown to gitserver from the given lice. The slice is filtered in-place and returned (to update the slice length). 

### <a id="findHunk" href="#findHunk">func findHunk(hunks []*diff.Hunk, line int) *diff.Hunk</a>

```
searchKey: resolvers.findHunk
tags: [function private]
```

```Go
func findHunk(hunks []*diff.Hunk, line int) *diff.Hunk
```

findHunk returns the last thunk that does not begin after the given line. 

### <a id="intsToString" href="#intsToString">func intsToString(ints []int) string</a>

```
searchKey: resolvers.intsToString
tags: [function private]
```

```Go
func intsToString(ints []int) string
```

### <a id="isSourceLocation" href="#isSourceLocation">func isSourceLocation(adjustedUploads []adjustedUpload, location lsifstore.Location) bool</a>

```
searchKey: resolvers.isSourceLocation
tags: [function private]
```

```Go
func isSourceLocation(adjustedUploads []adjustedUpload, location lsifstore.Location) bool
```

isSourceLocation returns true if the given location encloses the source position within one of the visible uploads. 

### <a id="lowSlowRequest" href="#lowSlowRequest">func lowSlowRequest(name string, duration time.Duration, err *error, observationArgs observation.Args)</a>

```
searchKey: resolvers.lowSlowRequest
tags: [function private]
```

```Go
func lowSlowRequest(name string, duration time.Duration, err *error, observationArgs observation.Args)
```

### <a id="makeKey" href="#makeKey">func makeKey(parts ...string) string</a>

```
searchKey: resolvers.makeKey
tags: [function private]
```

```Go
func makeKey(parts ...string) string
```

### <a id="monikersToString" href="#monikersToString">func monikersToString(vs []semantic.QualifiedMonikerData) string</a>

```
searchKey: resolvers.monikersToString
tags: [function private]
```

```Go
func monikersToString(vs []semantic.QualifiedMonikerData) string
```

### <a id="nextOffset" href="#nextOffset">func nextOffset(offset, count, totalCount int) *int</a>

```
searchKey: resolvers.nextOffset
tags: [function private]
```

```Go
func nextOffset(offset, count, totalCount int) *int
```

nextOffset determines the offset that should be used for a subsequent request. If there are no more results in the paged result set, this function returns nil. 

### <a id="observeResolver" href="#observeResolver">func observeResolver(ctx context.Context,...</a>

```
searchKey: resolvers.observeResolver
tags: [function private]
```

```Go
func observeResolver(
	ctx context.Context,
	err *error,
	name string,
	operation *observation.Operation,
	threshold time.Duration,
	observationArgs observation.Args,
) (context.Context, observation.TraceLogger, func())
```

### <a id="rangeContainsPosition" href="#rangeContainsPosition">func rangeContainsPosition(r lsifstore.Range, pos lsifstore.Position) bool</a>

```
searchKey: resolvers.rangeContainsPosition
tags: [function private]
```

```Go
func rangeContainsPosition(r lsifstore.Range, pos lsifstore.Position) bool
```

rangeContainsPosition returns true if the given range encloses the given position. 

### <a id="testFilter" href="#testFilter">func testFilter(filter []byte, orderedMonikers []semantic.QualifiedMonikerData) (bool, error)</a>

```
searchKey: resolvers.testFilter
tags: [function private]
```

```Go
func testFilter(filter []byte, orderedMonikers []semantic.QualifiedMonikerData) (bool, error)
```

testFilter returns true if the given  encoded bloom filter includes any of the given monikers. 

### <a id="uploadIDsToString" href="#uploadIDsToString">func uploadIDsToString(vs []dbstore.Dump) string</a>

```
searchKey: resolvers.uploadIDsToString
tags: [function private]
```

```Go
func uploadIDsToString(vs []dbstore.Dump) string
```

