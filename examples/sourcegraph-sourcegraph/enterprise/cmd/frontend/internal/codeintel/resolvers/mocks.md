# Package mocks

## Index

* [Types](#type)
    * [type MockQueryResolver struct](#MockQueryResolver)
        * [func NewMockQueryResolver() *MockQueryResolver](#NewMockQueryResolver)
        * [func NewMockQueryResolverFrom(i resolvers.QueryResolver) *MockQueryResolver](#NewMockQueryResolverFrom)
        * [func (m *MockQueryResolver) Definitions(v0 context.Context, v1 int, v2 int) ([]resolvers.AdjustedLocation, error)](#MockQueryResolver.Definitions)
        * [func (m *MockQueryResolver) Diagnostics(v0 context.Context, v1 int) ([]resolvers.AdjustedDiagnostic, int, error)](#MockQueryResolver.Diagnostics)
        * [func (m *MockQueryResolver) DocumentationPage(v0 context.Context, v1 string) (*semantic.DocumentationPageData, error)](#MockQueryResolver.DocumentationPage)
        * [func (m *MockQueryResolver) Hover(v0 context.Context, v1 int, v2 int) (string, lsifstore.Range, bool, error)](#MockQueryResolver.Hover)
        * [func (m *MockQueryResolver) Ranges(v0 context.Context, v1 int, v2 int) ([]resolvers.AdjustedCodeIntelligenceRange, error)](#MockQueryResolver.Ranges)
        * [func (m *MockQueryResolver) References(v0 context.Context, v1 int, v2 int, v3 int, v4 string) ([]resolvers.AdjustedLocation, string, error)](#MockQueryResolver.References)
    * [type MockResolver struct](#MockResolver)
        * [func NewMockResolver() *MockResolver](#NewMockResolver)
        * [func NewMockResolverFrom(i resolvers.Resolver) *MockResolver](#NewMockResolverFrom)
        * [func (m *MockResolver) CommitGraph(v0 context.Context, v1 int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error)](#MockResolver.CommitGraph)
        * [func (m *MockResolver) DeleteIndexByID(v0 context.Context, v1 int) error](#MockResolver.DeleteIndexByID)
        * [func (m *MockResolver) DeleteUploadByID(v0 context.Context, v1 int) error](#MockResolver.DeleteUploadByID)
        * [func (m *MockResolver) GetIndexByID(v0 context.Context, v1 int) (dbstore.Index, bool, error)](#MockResolver.GetIndexByID)
        * [func (m *MockResolver) GetIndexesByIDs(v0 context.Context, v1 ...int) ([]dbstore.Index, error)](#MockResolver.GetIndexesByIDs)
        * [func (m *MockResolver) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)](#MockResolver.GetUploadByID)
        * [func (m *MockResolver) GetUploadsByIDs(v0 context.Context, v1 ...int) ([]dbstore.Upload, error)](#MockResolver.GetUploadsByIDs)
        * [func (m *MockResolver) IndexConfiguration(v0 context.Context, v1 int) ([]byte, error)](#MockResolver.IndexConfiguration)
        * [func (m *MockResolver) IndexConnectionResolver(v0 dbstore.GetIndexesOptions) *resolvers.IndexesResolver](#MockResolver.IndexConnectionResolver)
        * [func (m *MockResolver) QueryResolver(v0 context.Context, v1 *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error)](#MockResolver.QueryResolver)
        * [func (m *MockResolver) QueueAutoIndexJobForRepo(v0 context.Context, v1 int) error](#MockResolver.QueueAutoIndexJobForRepo)
        * [func (m *MockResolver) UpdateIndexConfigurationByRepositoryID(v0 context.Context, v1 int, v2 string) error](#MockResolver.UpdateIndexConfigurationByRepositoryID)
        * [func (m *MockResolver) UploadConnectionResolver(v0 dbstore.GetUploadsOptions) *resolvers.UploadsResolver](#MockResolver.UploadConnectionResolver)
    * [type QueryResolverDefinitionsFunc struct](#QueryResolverDefinitionsFunc)
        * [func (f *QueryResolverDefinitionsFunc) History() []QueryResolverDefinitionsFuncCall](#QueryResolverDefinitionsFunc.History)
        * [func (f *QueryResolverDefinitionsFunc) PushHook(hook func(context.Context, int, int) ([]resolvers.AdjustedLocation, error))](#QueryResolverDefinitionsFunc.PushHook)
        * [func (f *QueryResolverDefinitionsFunc) PushReturn(r0 []resolvers.AdjustedLocation, r1 error)](#QueryResolverDefinitionsFunc.PushReturn)
        * [func (f *QueryResolverDefinitionsFunc) SetDefaultHook(hook func(context.Context, int, int) ([]resolvers.AdjustedLocation, error))](#QueryResolverDefinitionsFunc.SetDefaultHook)
        * [func (f *QueryResolverDefinitionsFunc) SetDefaultReturn(r0 []resolvers.AdjustedLocation, r1 error)](#QueryResolverDefinitionsFunc.SetDefaultReturn)
        * [func (f *QueryResolverDefinitionsFunc) appendCall(r0 QueryResolverDefinitionsFuncCall)](#QueryResolverDefinitionsFunc.appendCall)
        * [func (f *QueryResolverDefinitionsFunc) nextHook() func(context.Context, int, int) ([]resolvers.AdjustedLocation, error)](#QueryResolverDefinitionsFunc.nextHook)
    * [type QueryResolverDefinitionsFuncCall struct](#QueryResolverDefinitionsFuncCall)
        * [func (c QueryResolverDefinitionsFuncCall) Args() []interface{}](#QueryResolverDefinitionsFuncCall.Args)
        * [func (c QueryResolverDefinitionsFuncCall) Results() []interface{}](#QueryResolverDefinitionsFuncCall.Results)
    * [type QueryResolverDiagnosticsFunc struct](#QueryResolverDiagnosticsFunc)
        * [func (f *QueryResolverDiagnosticsFunc) History() []QueryResolverDiagnosticsFuncCall](#QueryResolverDiagnosticsFunc.History)
        * [func (f *QueryResolverDiagnosticsFunc) PushHook(hook func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error))](#QueryResolverDiagnosticsFunc.PushHook)
        * [func (f *QueryResolverDiagnosticsFunc) PushReturn(r0 []resolvers.AdjustedDiagnostic, r1 int, r2 error)](#QueryResolverDiagnosticsFunc.PushReturn)
        * [func (f *QueryResolverDiagnosticsFunc) SetDefaultHook(hook func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error))](#QueryResolverDiagnosticsFunc.SetDefaultHook)
        * [func (f *QueryResolverDiagnosticsFunc) SetDefaultReturn(r0 []resolvers.AdjustedDiagnostic, r1 int, r2 error)](#QueryResolverDiagnosticsFunc.SetDefaultReturn)
        * [func (f *QueryResolverDiagnosticsFunc) appendCall(r0 QueryResolverDiagnosticsFuncCall)](#QueryResolverDiagnosticsFunc.appendCall)
        * [func (f *QueryResolverDiagnosticsFunc) nextHook() func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error)](#QueryResolverDiagnosticsFunc.nextHook)
    * [type QueryResolverDiagnosticsFuncCall struct](#QueryResolverDiagnosticsFuncCall)
        * [func (c QueryResolverDiagnosticsFuncCall) Args() []interface{}](#QueryResolverDiagnosticsFuncCall.Args)
        * [func (c QueryResolverDiagnosticsFuncCall) Results() []interface{}](#QueryResolverDiagnosticsFuncCall.Results)
    * [type QueryResolverDocumentationPageFunc struct](#QueryResolverDocumentationPageFunc)
        * [func (f *QueryResolverDocumentationPageFunc) History() []QueryResolverDocumentationPageFuncCall](#QueryResolverDocumentationPageFunc.History)
        * [func (f *QueryResolverDocumentationPageFunc) PushHook(hook func(context.Context, string) (*semantic.DocumentationPageData, error))](#QueryResolverDocumentationPageFunc.PushHook)
        * [func (f *QueryResolverDocumentationPageFunc) PushReturn(r0 *semantic.DocumentationPageData, r1 error)](#QueryResolverDocumentationPageFunc.PushReturn)
        * [func (f *QueryResolverDocumentationPageFunc) SetDefaultHook(hook func(context.Context, string) (*semantic.DocumentationPageData, error))](#QueryResolverDocumentationPageFunc.SetDefaultHook)
        * [func (f *QueryResolverDocumentationPageFunc) SetDefaultReturn(r0 *semantic.DocumentationPageData, r1 error)](#QueryResolverDocumentationPageFunc.SetDefaultReturn)
        * [func (f *QueryResolverDocumentationPageFunc) appendCall(r0 QueryResolverDocumentationPageFuncCall)](#QueryResolverDocumentationPageFunc.appendCall)
        * [func (f *QueryResolverDocumentationPageFunc) nextHook() func(context.Context, string) (*semantic.DocumentationPageData, error)](#QueryResolverDocumentationPageFunc.nextHook)
    * [type QueryResolverDocumentationPageFuncCall struct](#QueryResolverDocumentationPageFuncCall)
        * [func (c QueryResolverDocumentationPageFuncCall) Args() []interface{}](#QueryResolverDocumentationPageFuncCall.Args)
        * [func (c QueryResolverDocumentationPageFuncCall) Results() []interface{}](#QueryResolverDocumentationPageFuncCall.Results)
    * [type QueryResolverHoverFunc struct](#QueryResolverHoverFunc)
        * [func (f *QueryResolverHoverFunc) History() []QueryResolverHoverFuncCall](#QueryResolverHoverFunc.History)
        * [func (f *QueryResolverHoverFunc) PushHook(hook func(context.Context, int, int) (string, lsifstore.Range, bool, error))](#QueryResolverHoverFunc.PushHook)
        * [func (f *QueryResolverHoverFunc) PushReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)](#QueryResolverHoverFunc.PushReturn)
        * [func (f *QueryResolverHoverFunc) SetDefaultHook(hook func(context.Context, int, int) (string, lsifstore.Range, bool, error))](#QueryResolverHoverFunc.SetDefaultHook)
        * [func (f *QueryResolverHoverFunc) SetDefaultReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)](#QueryResolverHoverFunc.SetDefaultReturn)
        * [func (f *QueryResolverHoverFunc) appendCall(r0 QueryResolverHoverFuncCall)](#QueryResolverHoverFunc.appendCall)
        * [func (f *QueryResolverHoverFunc) nextHook() func(context.Context, int, int) (string, lsifstore.Range, bool, error)](#QueryResolverHoverFunc.nextHook)
    * [type QueryResolverHoverFuncCall struct](#QueryResolverHoverFuncCall)
        * [func (c QueryResolverHoverFuncCall) Args() []interface{}](#QueryResolverHoverFuncCall.Args)
        * [func (c QueryResolverHoverFuncCall) Results() []interface{}](#QueryResolverHoverFuncCall.Results)
    * [type QueryResolverRangesFunc struct](#QueryResolverRangesFunc)
        * [func (f *QueryResolverRangesFunc) History() []QueryResolverRangesFuncCall](#QueryResolverRangesFunc.History)
        * [func (f *QueryResolverRangesFunc) PushHook(hook func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error))](#QueryResolverRangesFunc.PushHook)
        * [func (f *QueryResolverRangesFunc) PushReturn(r0 []resolvers.AdjustedCodeIntelligenceRange, r1 error)](#QueryResolverRangesFunc.PushReturn)
        * [func (f *QueryResolverRangesFunc) SetDefaultHook(hook func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error))](#QueryResolverRangesFunc.SetDefaultHook)
        * [func (f *QueryResolverRangesFunc) SetDefaultReturn(r0 []resolvers.AdjustedCodeIntelligenceRange, r1 error)](#QueryResolverRangesFunc.SetDefaultReturn)
        * [func (f *QueryResolverRangesFunc) appendCall(r0 QueryResolverRangesFuncCall)](#QueryResolverRangesFunc.appendCall)
        * [func (f *QueryResolverRangesFunc) nextHook() func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error)](#QueryResolverRangesFunc.nextHook)
    * [type QueryResolverRangesFuncCall struct](#QueryResolverRangesFuncCall)
        * [func (c QueryResolverRangesFuncCall) Args() []interface{}](#QueryResolverRangesFuncCall.Args)
        * [func (c QueryResolverRangesFuncCall) Results() []interface{}](#QueryResolverRangesFuncCall.Results)
    * [type QueryResolverReferencesFunc struct](#QueryResolverReferencesFunc)
        * [func (f *QueryResolverReferencesFunc) History() []QueryResolverReferencesFuncCall](#QueryResolverReferencesFunc.History)
        * [func (f *QueryResolverReferencesFunc) PushHook(hook func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error))](#QueryResolverReferencesFunc.PushHook)
        * [func (f *QueryResolverReferencesFunc) PushReturn(r0 []resolvers.AdjustedLocation, r1 string, r2 error)](#QueryResolverReferencesFunc.PushReturn)
        * [func (f *QueryResolverReferencesFunc) SetDefaultHook(hook func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error))](#QueryResolverReferencesFunc.SetDefaultHook)
        * [func (f *QueryResolverReferencesFunc) SetDefaultReturn(r0 []resolvers.AdjustedLocation, r1 string, r2 error)](#QueryResolverReferencesFunc.SetDefaultReturn)
        * [func (f *QueryResolverReferencesFunc) appendCall(r0 QueryResolverReferencesFuncCall)](#QueryResolverReferencesFunc.appendCall)
        * [func (f *QueryResolverReferencesFunc) nextHook() func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error)](#QueryResolverReferencesFunc.nextHook)
    * [type QueryResolverReferencesFuncCall struct](#QueryResolverReferencesFuncCall)
        * [func (c QueryResolverReferencesFuncCall) Args() []interface{}](#QueryResolverReferencesFuncCall.Args)
        * [func (c QueryResolverReferencesFuncCall) Results() []interface{}](#QueryResolverReferencesFuncCall.Results)
    * [type ResolverCommitGraphFunc struct](#ResolverCommitGraphFunc)
        * [func (f *ResolverCommitGraphFunc) History() []ResolverCommitGraphFuncCall](#ResolverCommitGraphFunc.History)
        * [func (f *ResolverCommitGraphFunc) PushHook(hook func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error))](#ResolverCommitGraphFunc.PushHook)
        * [func (f *ResolverCommitGraphFunc) PushReturn(r0 graphqlbackend.CodeIntelligenceCommitGraphResolver, r1 error)](#ResolverCommitGraphFunc.PushReturn)
        * [func (f *ResolverCommitGraphFunc) SetDefaultHook(hook func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error))](#ResolverCommitGraphFunc.SetDefaultHook)
        * [func (f *ResolverCommitGraphFunc) SetDefaultReturn(r0 graphqlbackend.CodeIntelligenceCommitGraphResolver, r1 error)](#ResolverCommitGraphFunc.SetDefaultReturn)
        * [func (f *ResolverCommitGraphFunc) appendCall(r0 ResolverCommitGraphFuncCall)](#ResolverCommitGraphFunc.appendCall)
        * [func (f *ResolverCommitGraphFunc) nextHook() func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error)](#ResolverCommitGraphFunc.nextHook)
    * [type ResolverCommitGraphFuncCall struct](#ResolverCommitGraphFuncCall)
        * [func (c ResolverCommitGraphFuncCall) Args() []interface{}](#ResolverCommitGraphFuncCall.Args)
        * [func (c ResolverCommitGraphFuncCall) Results() []interface{}](#ResolverCommitGraphFuncCall.Results)
    * [type ResolverDeleteIndexByIDFunc struct](#ResolverDeleteIndexByIDFunc)
        * [func (f *ResolverDeleteIndexByIDFunc) History() []ResolverDeleteIndexByIDFuncCall](#ResolverDeleteIndexByIDFunc.History)
        * [func (f *ResolverDeleteIndexByIDFunc) PushHook(hook func(context.Context, int) error)](#ResolverDeleteIndexByIDFunc.PushHook)
        * [func (f *ResolverDeleteIndexByIDFunc) PushReturn(r0 error)](#ResolverDeleteIndexByIDFunc.PushReturn)
        * [func (f *ResolverDeleteIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) error)](#ResolverDeleteIndexByIDFunc.SetDefaultHook)
        * [func (f *ResolverDeleteIndexByIDFunc) SetDefaultReturn(r0 error)](#ResolverDeleteIndexByIDFunc.SetDefaultReturn)
        * [func (f *ResolverDeleteIndexByIDFunc) appendCall(r0 ResolverDeleteIndexByIDFuncCall)](#ResolverDeleteIndexByIDFunc.appendCall)
        * [func (f *ResolverDeleteIndexByIDFunc) nextHook() func(context.Context, int) error](#ResolverDeleteIndexByIDFunc.nextHook)
    * [type ResolverDeleteIndexByIDFuncCall struct](#ResolverDeleteIndexByIDFuncCall)
        * [func (c ResolverDeleteIndexByIDFuncCall) Args() []interface{}](#ResolverDeleteIndexByIDFuncCall.Args)
        * [func (c ResolverDeleteIndexByIDFuncCall) Results() []interface{}](#ResolverDeleteIndexByIDFuncCall.Results)
    * [type ResolverDeleteUploadByIDFunc struct](#ResolverDeleteUploadByIDFunc)
        * [func (f *ResolverDeleteUploadByIDFunc) History() []ResolverDeleteUploadByIDFuncCall](#ResolverDeleteUploadByIDFunc.History)
        * [func (f *ResolverDeleteUploadByIDFunc) PushHook(hook func(context.Context, int) error)](#ResolverDeleteUploadByIDFunc.PushHook)
        * [func (f *ResolverDeleteUploadByIDFunc) PushReturn(r0 error)](#ResolverDeleteUploadByIDFunc.PushReturn)
        * [func (f *ResolverDeleteUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) error)](#ResolverDeleteUploadByIDFunc.SetDefaultHook)
        * [func (f *ResolverDeleteUploadByIDFunc) SetDefaultReturn(r0 error)](#ResolverDeleteUploadByIDFunc.SetDefaultReturn)
        * [func (f *ResolverDeleteUploadByIDFunc) appendCall(r0 ResolverDeleteUploadByIDFuncCall)](#ResolverDeleteUploadByIDFunc.appendCall)
        * [func (f *ResolverDeleteUploadByIDFunc) nextHook() func(context.Context, int) error](#ResolverDeleteUploadByIDFunc.nextHook)
    * [type ResolverDeleteUploadByIDFuncCall struct](#ResolverDeleteUploadByIDFuncCall)
        * [func (c ResolverDeleteUploadByIDFuncCall) Args() []interface{}](#ResolverDeleteUploadByIDFuncCall.Args)
        * [func (c ResolverDeleteUploadByIDFuncCall) Results() []interface{}](#ResolverDeleteUploadByIDFuncCall.Results)
    * [type ResolverGetIndexByIDFunc struct](#ResolverGetIndexByIDFunc)
        * [func (f *ResolverGetIndexByIDFunc) History() []ResolverGetIndexByIDFuncCall](#ResolverGetIndexByIDFunc.History)
        * [func (f *ResolverGetIndexByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Index, bool, error))](#ResolverGetIndexByIDFunc.PushHook)
        * [func (f *ResolverGetIndexByIDFunc) PushReturn(r0 dbstore.Index, r1 bool, r2 error)](#ResolverGetIndexByIDFunc.PushReturn)
        * [func (f *ResolverGetIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Index, bool, error))](#ResolverGetIndexByIDFunc.SetDefaultHook)
        * [func (f *ResolverGetIndexByIDFunc) SetDefaultReturn(r0 dbstore.Index, r1 bool, r2 error)](#ResolverGetIndexByIDFunc.SetDefaultReturn)
        * [func (f *ResolverGetIndexByIDFunc) appendCall(r0 ResolverGetIndexByIDFuncCall)](#ResolverGetIndexByIDFunc.appendCall)
        * [func (f *ResolverGetIndexByIDFunc) nextHook() func(context.Context, int) (dbstore.Index, bool, error)](#ResolverGetIndexByIDFunc.nextHook)
    * [type ResolverGetIndexByIDFuncCall struct](#ResolverGetIndexByIDFuncCall)
        * [func (c ResolverGetIndexByIDFuncCall) Args() []interface{}](#ResolverGetIndexByIDFuncCall.Args)
        * [func (c ResolverGetIndexByIDFuncCall) Results() []interface{}](#ResolverGetIndexByIDFuncCall.Results)
    * [type ResolverGetIndexesByIDsFunc struct](#ResolverGetIndexesByIDsFunc)
        * [func (f *ResolverGetIndexesByIDsFunc) History() []ResolverGetIndexesByIDsFuncCall](#ResolverGetIndexesByIDsFunc.History)
        * [func (f *ResolverGetIndexesByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Index, error))](#ResolverGetIndexesByIDsFunc.PushHook)
        * [func (f *ResolverGetIndexesByIDsFunc) PushReturn(r0 []dbstore.Index, r1 error)](#ResolverGetIndexesByIDsFunc.PushReturn)
        * [func (f *ResolverGetIndexesByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Index, error))](#ResolverGetIndexesByIDsFunc.SetDefaultHook)
        * [func (f *ResolverGetIndexesByIDsFunc) SetDefaultReturn(r0 []dbstore.Index, r1 error)](#ResolverGetIndexesByIDsFunc.SetDefaultReturn)
        * [func (f *ResolverGetIndexesByIDsFunc) appendCall(r0 ResolverGetIndexesByIDsFuncCall)](#ResolverGetIndexesByIDsFunc.appendCall)
        * [func (f *ResolverGetIndexesByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Index, error)](#ResolverGetIndexesByIDsFunc.nextHook)
    * [type ResolverGetIndexesByIDsFuncCall struct](#ResolverGetIndexesByIDsFuncCall)
        * [func (c ResolverGetIndexesByIDsFuncCall) Args() []interface{}](#ResolverGetIndexesByIDsFuncCall.Args)
        * [func (c ResolverGetIndexesByIDsFuncCall) Results() []interface{}](#ResolverGetIndexesByIDsFuncCall.Results)
    * [type ResolverGetUploadByIDFunc struct](#ResolverGetUploadByIDFunc)
        * [func (f *ResolverGetUploadByIDFunc) History() []ResolverGetUploadByIDFuncCall](#ResolverGetUploadByIDFunc.History)
        * [func (f *ResolverGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#ResolverGetUploadByIDFunc.PushHook)
        * [func (f *ResolverGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)](#ResolverGetUploadByIDFunc.PushReturn)
        * [func (f *ResolverGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#ResolverGetUploadByIDFunc.SetDefaultHook)
        * [func (f *ResolverGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)](#ResolverGetUploadByIDFunc.SetDefaultReturn)
        * [func (f *ResolverGetUploadByIDFunc) appendCall(r0 ResolverGetUploadByIDFuncCall)](#ResolverGetUploadByIDFunc.appendCall)
        * [func (f *ResolverGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)](#ResolverGetUploadByIDFunc.nextHook)
    * [type ResolverGetUploadByIDFuncCall struct](#ResolverGetUploadByIDFuncCall)
        * [func (c ResolverGetUploadByIDFuncCall) Args() []interface{}](#ResolverGetUploadByIDFuncCall.Args)
        * [func (c ResolverGetUploadByIDFuncCall) Results() []interface{}](#ResolverGetUploadByIDFuncCall.Results)
    * [type ResolverGetUploadsByIDsFunc struct](#ResolverGetUploadsByIDsFunc)
        * [func (f *ResolverGetUploadsByIDsFunc) History() []ResolverGetUploadsByIDsFuncCall](#ResolverGetUploadsByIDsFunc.History)
        * [func (f *ResolverGetUploadsByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))](#ResolverGetUploadsByIDsFunc.PushHook)
        * [func (f *ResolverGetUploadsByIDsFunc) PushReturn(r0 []dbstore.Upload, r1 error)](#ResolverGetUploadsByIDsFunc.PushReturn)
        * [func (f *ResolverGetUploadsByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))](#ResolverGetUploadsByIDsFunc.SetDefaultHook)
        * [func (f *ResolverGetUploadsByIDsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 error)](#ResolverGetUploadsByIDsFunc.SetDefaultReturn)
        * [func (f *ResolverGetUploadsByIDsFunc) appendCall(r0 ResolverGetUploadsByIDsFuncCall)](#ResolverGetUploadsByIDsFunc.appendCall)
        * [func (f *ResolverGetUploadsByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Upload, error)](#ResolverGetUploadsByIDsFunc.nextHook)
    * [type ResolverGetUploadsByIDsFuncCall struct](#ResolverGetUploadsByIDsFuncCall)
        * [func (c ResolverGetUploadsByIDsFuncCall) Args() []interface{}](#ResolverGetUploadsByIDsFuncCall.Args)
        * [func (c ResolverGetUploadsByIDsFuncCall) Results() []interface{}](#ResolverGetUploadsByIDsFuncCall.Results)
    * [type ResolverIndexConfigurationFunc struct](#ResolverIndexConfigurationFunc)
        * [func (f *ResolverIndexConfigurationFunc) History() []ResolverIndexConfigurationFuncCall](#ResolverIndexConfigurationFunc.History)
        * [func (f *ResolverIndexConfigurationFunc) PushHook(hook func(context.Context, int) ([]byte, error))](#ResolverIndexConfigurationFunc.PushHook)
        * [func (f *ResolverIndexConfigurationFunc) PushReturn(r0 []byte, r1 error)](#ResolverIndexConfigurationFunc.PushReturn)
        * [func (f *ResolverIndexConfigurationFunc) SetDefaultHook(hook func(context.Context, int) ([]byte, error))](#ResolverIndexConfigurationFunc.SetDefaultHook)
        * [func (f *ResolverIndexConfigurationFunc) SetDefaultReturn(r0 []byte, r1 error)](#ResolverIndexConfigurationFunc.SetDefaultReturn)
        * [func (f *ResolverIndexConfigurationFunc) appendCall(r0 ResolverIndexConfigurationFuncCall)](#ResolverIndexConfigurationFunc.appendCall)
        * [func (f *ResolverIndexConfigurationFunc) nextHook() func(context.Context, int) ([]byte, error)](#ResolverIndexConfigurationFunc.nextHook)
    * [type ResolverIndexConfigurationFuncCall struct](#ResolverIndexConfigurationFuncCall)
        * [func (c ResolverIndexConfigurationFuncCall) Args() []interface{}](#ResolverIndexConfigurationFuncCall.Args)
        * [func (c ResolverIndexConfigurationFuncCall) Results() []interface{}](#ResolverIndexConfigurationFuncCall.Results)
    * [type ResolverIndexConnectionResolverFunc struct](#ResolverIndexConnectionResolverFunc)
        * [func (f *ResolverIndexConnectionResolverFunc) History() []ResolverIndexConnectionResolverFuncCall](#ResolverIndexConnectionResolverFunc.History)
        * [func (f *ResolverIndexConnectionResolverFunc) PushHook(hook func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver)](#ResolverIndexConnectionResolverFunc.PushHook)
        * [func (f *ResolverIndexConnectionResolverFunc) PushReturn(r0 *resolvers.IndexesResolver)](#ResolverIndexConnectionResolverFunc.PushReturn)
        * [func (f *ResolverIndexConnectionResolverFunc) SetDefaultHook(hook func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver)](#ResolverIndexConnectionResolverFunc.SetDefaultHook)
        * [func (f *ResolverIndexConnectionResolverFunc) SetDefaultReturn(r0 *resolvers.IndexesResolver)](#ResolverIndexConnectionResolverFunc.SetDefaultReturn)
        * [func (f *ResolverIndexConnectionResolverFunc) appendCall(r0 ResolverIndexConnectionResolverFuncCall)](#ResolverIndexConnectionResolverFunc.appendCall)
        * [func (f *ResolverIndexConnectionResolverFunc) nextHook() func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver](#ResolverIndexConnectionResolverFunc.nextHook)
    * [type ResolverIndexConnectionResolverFuncCall struct](#ResolverIndexConnectionResolverFuncCall)
        * [func (c ResolverIndexConnectionResolverFuncCall) Args() []interface{}](#ResolverIndexConnectionResolverFuncCall.Args)
        * [func (c ResolverIndexConnectionResolverFuncCall) Results() []interface{}](#ResolverIndexConnectionResolverFuncCall.Results)
    * [type ResolverQueryResolverFunc struct](#ResolverQueryResolverFunc)
        * [func (f *ResolverQueryResolverFunc) History() []ResolverQueryResolverFuncCall](#ResolverQueryResolverFunc.History)
        * [func (f *ResolverQueryResolverFunc) PushHook(hook func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error))](#ResolverQueryResolverFunc.PushHook)
        * [func (f *ResolverQueryResolverFunc) PushReturn(r0 resolvers.QueryResolver, r1 error)](#ResolverQueryResolverFunc.PushReturn)
        * [func (f *ResolverQueryResolverFunc) SetDefaultHook(hook func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error))](#ResolverQueryResolverFunc.SetDefaultHook)
        * [func (f *ResolverQueryResolverFunc) SetDefaultReturn(r0 resolvers.QueryResolver, r1 error)](#ResolverQueryResolverFunc.SetDefaultReturn)
        * [func (f *ResolverQueryResolverFunc) appendCall(r0 ResolverQueryResolverFuncCall)](#ResolverQueryResolverFunc.appendCall)
        * [func (f *ResolverQueryResolverFunc) nextHook() func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error)](#ResolverQueryResolverFunc.nextHook)
    * [type ResolverQueryResolverFuncCall struct](#ResolverQueryResolverFuncCall)
        * [func (c ResolverQueryResolverFuncCall) Args() []interface{}](#ResolverQueryResolverFuncCall.Args)
        * [func (c ResolverQueryResolverFuncCall) Results() []interface{}](#ResolverQueryResolverFuncCall.Results)
    * [type ResolverQueueAutoIndexJobForRepoFunc struct](#ResolverQueueAutoIndexJobForRepoFunc)
        * [func (f *ResolverQueueAutoIndexJobForRepoFunc) History() []ResolverQueueAutoIndexJobForRepoFuncCall](#ResolverQueueAutoIndexJobForRepoFunc.History)
        * [func (f *ResolverQueueAutoIndexJobForRepoFunc) PushHook(hook func(context.Context, int) error)](#ResolverQueueAutoIndexJobForRepoFunc.PushHook)
        * [func (f *ResolverQueueAutoIndexJobForRepoFunc) PushReturn(r0 error)](#ResolverQueueAutoIndexJobForRepoFunc.PushReturn)
        * [func (f *ResolverQueueAutoIndexJobForRepoFunc) SetDefaultHook(hook func(context.Context, int) error)](#ResolverQueueAutoIndexJobForRepoFunc.SetDefaultHook)
        * [func (f *ResolverQueueAutoIndexJobForRepoFunc) SetDefaultReturn(r0 error)](#ResolverQueueAutoIndexJobForRepoFunc.SetDefaultReturn)
        * [func (f *ResolverQueueAutoIndexJobForRepoFunc) appendCall(r0 ResolverQueueAutoIndexJobForRepoFuncCall)](#ResolverQueueAutoIndexJobForRepoFunc.appendCall)
        * [func (f *ResolverQueueAutoIndexJobForRepoFunc) nextHook() func(context.Context, int) error](#ResolverQueueAutoIndexJobForRepoFunc.nextHook)
    * [type ResolverQueueAutoIndexJobForRepoFuncCall struct](#ResolverQueueAutoIndexJobForRepoFuncCall)
        * [func (c ResolverQueueAutoIndexJobForRepoFuncCall) Args() []interface{}](#ResolverQueueAutoIndexJobForRepoFuncCall.Args)
        * [func (c ResolverQueueAutoIndexJobForRepoFuncCall) Results() []interface{}](#ResolverQueueAutoIndexJobForRepoFuncCall.Results)
    * [type ResolverUpdateIndexConfigurationByRepositoryIDFunc struct](#ResolverUpdateIndexConfigurationByRepositoryIDFunc)
        * [func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) History() []ResolverUpdateIndexConfigurationByRepositoryIDFuncCall](#ResolverUpdateIndexConfigurationByRepositoryIDFunc.History)
        * [func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int, string) error)](#ResolverUpdateIndexConfigurationByRepositoryIDFunc.PushHook)
        * [func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) PushReturn(r0 error)](#ResolverUpdateIndexConfigurationByRepositoryIDFunc.PushReturn)
        * [func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int, string) error)](#ResolverUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultHook)
        * [func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 error)](#ResolverUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultReturn)
        * [func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) appendCall(r0 ResolverUpdateIndexConfigurationByRepositoryIDFuncCall)](#ResolverUpdateIndexConfigurationByRepositoryIDFunc.appendCall)
        * [func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int, string) error](#ResolverUpdateIndexConfigurationByRepositoryIDFunc.nextHook)
    * [type ResolverUpdateIndexConfigurationByRepositoryIDFuncCall struct](#ResolverUpdateIndexConfigurationByRepositoryIDFuncCall)
        * [func (c ResolverUpdateIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}](#ResolverUpdateIndexConfigurationByRepositoryIDFuncCall.Args)
        * [func (c ResolverUpdateIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}](#ResolverUpdateIndexConfigurationByRepositoryIDFuncCall.Results)
    * [type ResolverUploadConnectionResolverFunc struct](#ResolverUploadConnectionResolverFunc)
        * [func (f *ResolverUploadConnectionResolverFunc) History() []ResolverUploadConnectionResolverFuncCall](#ResolverUploadConnectionResolverFunc.History)
        * [func (f *ResolverUploadConnectionResolverFunc) PushHook(hook func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver)](#ResolverUploadConnectionResolverFunc.PushHook)
        * [func (f *ResolverUploadConnectionResolverFunc) PushReturn(r0 *resolvers.UploadsResolver)](#ResolverUploadConnectionResolverFunc.PushReturn)
        * [func (f *ResolverUploadConnectionResolverFunc) SetDefaultHook(hook func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver)](#ResolverUploadConnectionResolverFunc.SetDefaultHook)
        * [func (f *ResolverUploadConnectionResolverFunc) SetDefaultReturn(r0 *resolvers.UploadsResolver)](#ResolverUploadConnectionResolverFunc.SetDefaultReturn)
        * [func (f *ResolverUploadConnectionResolverFunc) appendCall(r0 ResolverUploadConnectionResolverFuncCall)](#ResolverUploadConnectionResolverFunc.appendCall)
        * [func (f *ResolverUploadConnectionResolverFunc) nextHook() func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver](#ResolverUploadConnectionResolverFunc.nextHook)
    * [type ResolverUploadConnectionResolverFuncCall struct](#ResolverUploadConnectionResolverFuncCall)
        * [func (c ResolverUploadConnectionResolverFuncCall) Args() []interface{}](#ResolverUploadConnectionResolverFuncCall.Args)
        * [func (c ResolverUploadConnectionResolverFuncCall) Results() []interface{}](#ResolverUploadConnectionResolverFuncCall.Results)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="MockQueryResolver" href="#MockQueryResolver">type MockQueryResolver struct</a>

```
searchKey: mocks.MockQueryResolver
tags: [struct]
```

```Go
type MockQueryResolver struct {
	// DefinitionsFunc is an instance of a mock function object controlling
	// the behavior of the method Definitions.
	DefinitionsFunc *QueryResolverDefinitionsFunc
	// DiagnosticsFunc is an instance of a mock function object controlling
	// the behavior of the method Diagnostics.
	DiagnosticsFunc *QueryResolverDiagnosticsFunc
	// DocumentationPageFunc is an instance of a mock function object
	// controlling the behavior of the method DocumentationPage.
	DocumentationPageFunc *QueryResolverDocumentationPageFunc
	// HoverFunc is an instance of a mock function object controlling the
	// behavior of the method Hover.
	HoverFunc *QueryResolverHoverFunc
	// RangesFunc is an instance of a mock function object controlling the
	// behavior of the method Ranges.
	RangesFunc *QueryResolverRangesFunc
	// ReferencesFunc is an instance of a mock function object controlling
	// the behavior of the method References.
	ReferencesFunc *QueryResolverReferencesFunc
}
```

MockQueryResolver is a mock implementation of the QueryResolver interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockQueryResolver" href="#NewMockQueryResolver">func NewMockQueryResolver() *MockQueryResolver</a>

```
searchKey: mocks.NewMockQueryResolver
tags: [function]
```

```Go
func NewMockQueryResolver() *MockQueryResolver
```

NewMockQueryResolver creates a new mock of the QueryResolver interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockQueryResolverFrom" href="#NewMockQueryResolverFrom">func NewMockQueryResolverFrom(i resolvers.QueryResolver) *MockQueryResolver</a>

```
searchKey: mocks.NewMockQueryResolverFrom
tags: [function]
```

```Go
func NewMockQueryResolverFrom(i resolvers.QueryResolver) *MockQueryResolver
```

NewMockQueryResolverFrom creates a new mock of the MockQueryResolver interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockQueryResolver.Definitions" href="#MockQueryResolver.Definitions">func (m *MockQueryResolver) Definitions(v0 context.Context, v1 int, v2 int) ([]resolvers.AdjustedLocation, error)</a>

```
searchKey: mocks.MockQueryResolver.Definitions
tags: [method]
```

```Go
func (m *MockQueryResolver) Definitions(v0 context.Context, v1 int, v2 int) ([]resolvers.AdjustedLocation, error)
```

Definitions delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockQueryResolver.Diagnostics" href="#MockQueryResolver.Diagnostics">func (m *MockQueryResolver) Diagnostics(v0 context.Context, v1 int) ([]resolvers.AdjustedDiagnostic, int, error)</a>

```
searchKey: mocks.MockQueryResolver.Diagnostics
tags: [method]
```

```Go
func (m *MockQueryResolver) Diagnostics(v0 context.Context, v1 int) ([]resolvers.AdjustedDiagnostic, int, error)
```

Diagnostics delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockQueryResolver.DocumentationPage" href="#MockQueryResolver.DocumentationPage">func (m *MockQueryResolver) DocumentationPage(v0 context.Context, v1 string) (*semantic.DocumentationPageData, error)</a>

```
searchKey: mocks.MockQueryResolver.DocumentationPage
tags: [method]
```

```Go
func (m *MockQueryResolver) DocumentationPage(v0 context.Context, v1 string) (*semantic.DocumentationPageData, error)
```

DocumentationPage delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockQueryResolver.Hover" href="#MockQueryResolver.Hover">func (m *MockQueryResolver) Hover(v0 context.Context, v1 int, v2 int) (string, lsifstore.Range, bool, error)</a>

```
searchKey: mocks.MockQueryResolver.Hover
tags: [method]
```

```Go
func (m *MockQueryResolver) Hover(v0 context.Context, v1 int, v2 int) (string, lsifstore.Range, bool, error)
```

Hover delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockQueryResolver.Ranges" href="#MockQueryResolver.Ranges">func (m *MockQueryResolver) Ranges(v0 context.Context, v1 int, v2 int) ([]resolvers.AdjustedCodeIntelligenceRange, error)</a>

```
searchKey: mocks.MockQueryResolver.Ranges
tags: [method]
```

```Go
func (m *MockQueryResolver) Ranges(v0 context.Context, v1 int, v2 int) ([]resolvers.AdjustedCodeIntelligenceRange, error)
```

Ranges delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockQueryResolver.References" href="#MockQueryResolver.References">func (m *MockQueryResolver) References(v0 context.Context, v1 int, v2 int, v3 int, v4 string) ([]resolvers.AdjustedLocation, string, error)</a>

```
searchKey: mocks.MockQueryResolver.References
tags: [method]
```

```Go
func (m *MockQueryResolver) References(v0 context.Context, v1 int, v2 int, v3 int, v4 string) ([]resolvers.AdjustedLocation, string, error)
```

References delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockResolver" href="#MockResolver">type MockResolver struct</a>

```
searchKey: mocks.MockResolver
tags: [struct]
```

```Go
type MockResolver struct {
	// CommitGraphFunc is an instance of a mock function object controlling
	// the behavior of the method CommitGraph.
	CommitGraphFunc *ResolverCommitGraphFunc
	// DeleteIndexByIDFunc is an instance of a mock function object
	// controlling the behavior of the method DeleteIndexByID.
	DeleteIndexByIDFunc *ResolverDeleteIndexByIDFunc
	// DeleteUploadByIDFunc is an instance of a mock function object
	// controlling the behavior of the method DeleteUploadByID.
	DeleteUploadByIDFunc *ResolverDeleteUploadByIDFunc
	// GetIndexByIDFunc is an instance of a mock function object controlling
	// the behavior of the method GetIndexByID.
	GetIndexByIDFunc *ResolverGetIndexByIDFunc
	// GetIndexesByIDsFunc is an instance of a mock function object
	// controlling the behavior of the method GetIndexesByIDs.
	GetIndexesByIDsFunc *ResolverGetIndexesByIDsFunc
	// GetUploadByIDFunc is an instance of a mock function object
	// controlling the behavior of the method GetUploadByID.
	GetUploadByIDFunc *ResolverGetUploadByIDFunc
	// GetUploadsByIDsFunc is an instance of a mock function object
	// controlling the behavior of the method GetUploadsByIDs.
	GetUploadsByIDsFunc *ResolverGetUploadsByIDsFunc
	// IndexConfigurationFunc is an instance of a mock function object
	// controlling the behavior of the method IndexConfiguration.
	IndexConfigurationFunc *ResolverIndexConfigurationFunc
	// IndexConnectionResolverFunc is an instance of a mock function object
	// controlling the behavior of the method IndexConnectionResolver.
	IndexConnectionResolverFunc *ResolverIndexConnectionResolverFunc
	// QueryResolverFunc is an instance of a mock function object
	// controlling the behavior of the method QueryResolver.
	QueryResolverFunc *ResolverQueryResolverFunc
	// QueueAutoIndexJobForRepoFunc is an instance of a mock function object
	// controlling the behavior of the method QueueAutoIndexJobForRepo.
	QueueAutoIndexJobForRepoFunc *ResolverQueueAutoIndexJobForRepoFunc
	// UpdateIndexConfigurationByRepositoryIDFunc is an instance of a mock
	// function object controlling the behavior of the method
	// UpdateIndexConfigurationByRepositoryID.
	UpdateIndexConfigurationByRepositoryIDFunc *ResolverUpdateIndexConfigurationByRepositoryIDFunc
	// UploadConnectionResolverFunc is an instance of a mock function object
	// controlling the behavior of the method UploadConnectionResolver.
	UploadConnectionResolverFunc *ResolverUploadConnectionResolverFunc
}
```

MockResolver is a mock implementation of the Resolver interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/resolvers) used for unit testing. 

#### <a id="NewMockResolver" href="#NewMockResolver">func NewMockResolver() *MockResolver</a>

```
searchKey: mocks.NewMockResolver
tags: [function]
```

```Go
func NewMockResolver() *MockResolver
```

NewMockResolver creates a new mock of the Resolver interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockResolverFrom" href="#NewMockResolverFrom">func NewMockResolverFrom(i resolvers.Resolver) *MockResolver</a>

```
searchKey: mocks.NewMockResolverFrom
tags: [function]
```

```Go
func NewMockResolverFrom(i resolvers.Resolver) *MockResolver
```

NewMockResolverFrom creates a new mock of the MockResolver interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockResolver.CommitGraph" href="#MockResolver.CommitGraph">func (m *MockResolver) CommitGraph(v0 context.Context, v1 int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error)</a>

```
searchKey: mocks.MockResolver.CommitGraph
tags: [method]
```

```Go
func (m *MockResolver) CommitGraph(v0 context.Context, v1 int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error)
```

CommitGraph delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.DeleteIndexByID" href="#MockResolver.DeleteIndexByID">func (m *MockResolver) DeleteIndexByID(v0 context.Context, v1 int) error</a>

```
searchKey: mocks.MockResolver.DeleteIndexByID
tags: [method]
```

```Go
func (m *MockResolver) DeleteIndexByID(v0 context.Context, v1 int) error
```

DeleteIndexByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.DeleteUploadByID" href="#MockResolver.DeleteUploadByID">func (m *MockResolver) DeleteUploadByID(v0 context.Context, v1 int) error</a>

```
searchKey: mocks.MockResolver.DeleteUploadByID
tags: [method]
```

```Go
func (m *MockResolver) DeleteUploadByID(v0 context.Context, v1 int) error
```

DeleteUploadByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.GetIndexByID" href="#MockResolver.GetIndexByID">func (m *MockResolver) GetIndexByID(v0 context.Context, v1 int) (dbstore.Index, bool, error)</a>

```
searchKey: mocks.MockResolver.GetIndexByID
tags: [method]
```

```Go
func (m *MockResolver) GetIndexByID(v0 context.Context, v1 int) (dbstore.Index, bool, error)
```

GetIndexByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.GetIndexesByIDs" href="#MockResolver.GetIndexesByIDs">func (m *MockResolver) GetIndexesByIDs(v0 context.Context, v1 ...int) ([]dbstore.Index, error)</a>

```
searchKey: mocks.MockResolver.GetIndexesByIDs
tags: [method]
```

```Go
func (m *MockResolver) GetIndexesByIDs(v0 context.Context, v1 ...int) ([]dbstore.Index, error)
```

GetIndexesByIDs delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.GetUploadByID" href="#MockResolver.GetUploadByID">func (m *MockResolver) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)</a>

```
searchKey: mocks.MockResolver.GetUploadByID
tags: [method]
```

```Go
func (m *MockResolver) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)
```

GetUploadByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.GetUploadsByIDs" href="#MockResolver.GetUploadsByIDs">func (m *MockResolver) GetUploadsByIDs(v0 context.Context, v1 ...int) ([]dbstore.Upload, error)</a>

```
searchKey: mocks.MockResolver.GetUploadsByIDs
tags: [method]
```

```Go
func (m *MockResolver) GetUploadsByIDs(v0 context.Context, v1 ...int) ([]dbstore.Upload, error)
```

GetUploadsByIDs delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.IndexConfiguration" href="#MockResolver.IndexConfiguration">func (m *MockResolver) IndexConfiguration(v0 context.Context, v1 int) ([]byte, error)</a>

```
searchKey: mocks.MockResolver.IndexConfiguration
tags: [method]
```

```Go
func (m *MockResolver) IndexConfiguration(v0 context.Context, v1 int) ([]byte, error)
```

IndexConfiguration delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.IndexConnectionResolver" href="#MockResolver.IndexConnectionResolver">func (m *MockResolver) IndexConnectionResolver(v0 dbstore.GetIndexesOptions) *resolvers.IndexesResolver</a>

```
searchKey: mocks.MockResolver.IndexConnectionResolver
tags: [method]
```

```Go
func (m *MockResolver) IndexConnectionResolver(v0 dbstore.GetIndexesOptions) *resolvers.IndexesResolver
```

IndexConnectionResolver delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.QueryResolver" href="#MockResolver.QueryResolver">func (m *MockResolver) QueryResolver(v0 context.Context, v1 *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error)</a>

```
searchKey: mocks.MockResolver.QueryResolver
tags: [method]
```

```Go
func (m *MockResolver) QueryResolver(v0 context.Context, v1 *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error)
```

QueryResolver delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.QueueAutoIndexJobForRepo" href="#MockResolver.QueueAutoIndexJobForRepo">func (m *MockResolver) QueueAutoIndexJobForRepo(v0 context.Context, v1 int) error</a>

```
searchKey: mocks.MockResolver.QueueAutoIndexJobForRepo
tags: [method]
```

```Go
func (m *MockResolver) QueueAutoIndexJobForRepo(v0 context.Context, v1 int) error
```

QueueAutoIndexJobForRepo delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.UpdateIndexConfigurationByRepositoryID" href="#MockResolver.UpdateIndexConfigurationByRepositoryID">func (m *MockResolver) UpdateIndexConfigurationByRepositoryID(v0 context.Context, v1 int, v2 string) error</a>

```
searchKey: mocks.MockResolver.UpdateIndexConfigurationByRepositoryID
tags: [method]
```

```Go
func (m *MockResolver) UpdateIndexConfigurationByRepositoryID(v0 context.Context, v1 int, v2 string) error
```

UpdateIndexConfigurationByRepositoryID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockResolver.UploadConnectionResolver" href="#MockResolver.UploadConnectionResolver">func (m *MockResolver) UploadConnectionResolver(v0 dbstore.GetUploadsOptions) *resolvers.UploadsResolver</a>

```
searchKey: mocks.MockResolver.UploadConnectionResolver
tags: [method]
```

```Go
func (m *MockResolver) UploadConnectionResolver(v0 dbstore.GetUploadsOptions) *resolvers.UploadsResolver
```

UploadConnectionResolver delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="QueryResolverDefinitionsFunc" href="#QueryResolverDefinitionsFunc">type QueryResolverDefinitionsFunc struct</a>

```
searchKey: mocks.QueryResolverDefinitionsFunc
tags: [struct]
```

```Go
type QueryResolverDefinitionsFunc struct {
	defaultHook func(context.Context, int, int) ([]resolvers.AdjustedLocation, error)
	hooks       []func(context.Context, int, int) ([]resolvers.AdjustedLocation, error)
	history     []QueryResolverDefinitionsFuncCall
	mutex       sync.Mutex
}
```

QueryResolverDefinitionsFunc describes the behavior when the Definitions method of the parent MockQueryResolver instance is invoked. 

#### <a id="QueryResolverDefinitionsFunc.History" href="#QueryResolverDefinitionsFunc.History">func (f *QueryResolverDefinitionsFunc) History() []QueryResolverDefinitionsFuncCall</a>

```
searchKey: mocks.QueryResolverDefinitionsFunc.History
tags: [method]
```

```Go
func (f *QueryResolverDefinitionsFunc) History() []QueryResolverDefinitionsFuncCall
```

History returns a sequence of QueryResolverDefinitionsFuncCall objects describing the invocations of this function. 

#### <a id="QueryResolverDefinitionsFunc.PushHook" href="#QueryResolverDefinitionsFunc.PushHook">func (f *QueryResolverDefinitionsFunc) PushHook(hook func(context.Context, int, int) ([]resolvers.AdjustedLocation, error))</a>

```
searchKey: mocks.QueryResolverDefinitionsFunc.PushHook
tags: [method]
```

```Go
func (f *QueryResolverDefinitionsFunc) PushHook(hook func(context.Context, int, int) ([]resolvers.AdjustedLocation, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Definitions method of the parent MockQueryResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="QueryResolverDefinitionsFunc.PushReturn" href="#QueryResolverDefinitionsFunc.PushReturn">func (f *QueryResolverDefinitionsFunc) PushReturn(r0 []resolvers.AdjustedLocation, r1 error)</a>

```
searchKey: mocks.QueryResolverDefinitionsFunc.PushReturn
tags: [method]
```

```Go
func (f *QueryResolverDefinitionsFunc) PushReturn(r0 []resolvers.AdjustedLocation, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverDefinitionsFunc.SetDefaultHook" href="#QueryResolverDefinitionsFunc.SetDefaultHook">func (f *QueryResolverDefinitionsFunc) SetDefaultHook(hook func(context.Context, int, int) ([]resolvers.AdjustedLocation, error))</a>

```
searchKey: mocks.QueryResolverDefinitionsFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *QueryResolverDefinitionsFunc) SetDefaultHook(hook func(context.Context, int, int) ([]resolvers.AdjustedLocation, error))
```

SetDefaultHook sets function that is called when the Definitions method of the parent MockQueryResolver instance is invoked and the hook queue is empty. 

#### <a id="QueryResolverDefinitionsFunc.SetDefaultReturn" href="#QueryResolverDefinitionsFunc.SetDefaultReturn">func (f *QueryResolverDefinitionsFunc) SetDefaultReturn(r0 []resolvers.AdjustedLocation, r1 error)</a>

```
searchKey: mocks.QueryResolverDefinitionsFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *QueryResolverDefinitionsFunc) SetDefaultReturn(r0 []resolvers.AdjustedLocation, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverDefinitionsFunc.appendCall" href="#QueryResolverDefinitionsFunc.appendCall">func (f *QueryResolverDefinitionsFunc) appendCall(r0 QueryResolverDefinitionsFuncCall)</a>

```
searchKey: mocks.QueryResolverDefinitionsFunc.appendCall
tags: [method private]
```

```Go
func (f *QueryResolverDefinitionsFunc) appendCall(r0 QueryResolverDefinitionsFuncCall)
```

#### <a id="QueryResolverDefinitionsFunc.nextHook" href="#QueryResolverDefinitionsFunc.nextHook">func (f *QueryResolverDefinitionsFunc) nextHook() func(context.Context, int, int) ([]resolvers.AdjustedLocation, error)</a>

```
searchKey: mocks.QueryResolverDefinitionsFunc.nextHook
tags: [method private]
```

```Go
func (f *QueryResolverDefinitionsFunc) nextHook() func(context.Context, int, int) ([]resolvers.AdjustedLocation, error)
```

### <a id="QueryResolverDefinitionsFuncCall" href="#QueryResolverDefinitionsFuncCall">type QueryResolverDefinitionsFuncCall struct</a>

```
searchKey: mocks.QueryResolverDefinitionsFuncCall
tags: [struct]
```

```Go
type QueryResolverDefinitionsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []resolvers.AdjustedLocation
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

QueryResolverDefinitionsFuncCall is an object that describes an invocation of method Definitions on an instance of MockQueryResolver. 

#### <a id="QueryResolverDefinitionsFuncCall.Args" href="#QueryResolverDefinitionsFuncCall.Args">func (c QueryResolverDefinitionsFuncCall) Args() []interface{}</a>

```
searchKey: mocks.QueryResolverDefinitionsFuncCall.Args
tags: [method]
```

```Go
func (c QueryResolverDefinitionsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="QueryResolverDefinitionsFuncCall.Results" href="#QueryResolverDefinitionsFuncCall.Results">func (c QueryResolverDefinitionsFuncCall) Results() []interface{}</a>

```
searchKey: mocks.QueryResolverDefinitionsFuncCall.Results
tags: [method]
```

```Go
func (c QueryResolverDefinitionsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="QueryResolverDiagnosticsFunc" href="#QueryResolverDiagnosticsFunc">type QueryResolverDiagnosticsFunc struct</a>

```
searchKey: mocks.QueryResolverDiagnosticsFunc
tags: [struct]
```

```Go
type QueryResolverDiagnosticsFunc struct {
	defaultHook func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error)
	hooks       []func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error)
	history     []QueryResolverDiagnosticsFuncCall
	mutex       sync.Mutex
}
```

QueryResolverDiagnosticsFunc describes the behavior when the Diagnostics method of the parent MockQueryResolver instance is invoked. 

#### <a id="QueryResolverDiagnosticsFunc.History" href="#QueryResolverDiagnosticsFunc.History">func (f *QueryResolverDiagnosticsFunc) History() []QueryResolverDiagnosticsFuncCall</a>

```
searchKey: mocks.QueryResolverDiagnosticsFunc.History
tags: [method]
```

```Go
func (f *QueryResolverDiagnosticsFunc) History() []QueryResolverDiagnosticsFuncCall
```

History returns a sequence of QueryResolverDiagnosticsFuncCall objects describing the invocations of this function. 

#### <a id="QueryResolverDiagnosticsFunc.PushHook" href="#QueryResolverDiagnosticsFunc.PushHook">func (f *QueryResolverDiagnosticsFunc) PushHook(hook func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error))</a>

```
searchKey: mocks.QueryResolverDiagnosticsFunc.PushHook
tags: [method]
```

```Go
func (f *QueryResolverDiagnosticsFunc) PushHook(hook func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Diagnostics method of the parent MockQueryResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="QueryResolverDiagnosticsFunc.PushReturn" href="#QueryResolverDiagnosticsFunc.PushReturn">func (f *QueryResolverDiagnosticsFunc) PushReturn(r0 []resolvers.AdjustedDiagnostic, r1 int, r2 error)</a>

```
searchKey: mocks.QueryResolverDiagnosticsFunc.PushReturn
tags: [method]
```

```Go
func (f *QueryResolverDiagnosticsFunc) PushReturn(r0 []resolvers.AdjustedDiagnostic, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverDiagnosticsFunc.SetDefaultHook" href="#QueryResolverDiagnosticsFunc.SetDefaultHook">func (f *QueryResolverDiagnosticsFunc) SetDefaultHook(hook func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error))</a>

```
searchKey: mocks.QueryResolverDiagnosticsFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *QueryResolverDiagnosticsFunc) SetDefaultHook(hook func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error))
```

SetDefaultHook sets function that is called when the Diagnostics method of the parent MockQueryResolver instance is invoked and the hook queue is empty. 

#### <a id="QueryResolverDiagnosticsFunc.SetDefaultReturn" href="#QueryResolverDiagnosticsFunc.SetDefaultReturn">func (f *QueryResolverDiagnosticsFunc) SetDefaultReturn(r0 []resolvers.AdjustedDiagnostic, r1 int, r2 error)</a>

```
searchKey: mocks.QueryResolverDiagnosticsFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *QueryResolverDiagnosticsFunc) SetDefaultReturn(r0 []resolvers.AdjustedDiagnostic, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverDiagnosticsFunc.appendCall" href="#QueryResolverDiagnosticsFunc.appendCall">func (f *QueryResolverDiagnosticsFunc) appendCall(r0 QueryResolverDiagnosticsFuncCall)</a>

```
searchKey: mocks.QueryResolverDiagnosticsFunc.appendCall
tags: [method private]
```

```Go
func (f *QueryResolverDiagnosticsFunc) appendCall(r0 QueryResolverDiagnosticsFuncCall)
```

#### <a id="QueryResolverDiagnosticsFunc.nextHook" href="#QueryResolverDiagnosticsFunc.nextHook">func (f *QueryResolverDiagnosticsFunc) nextHook() func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error)</a>

```
searchKey: mocks.QueryResolverDiagnosticsFunc.nextHook
tags: [method private]
```

```Go
func (f *QueryResolverDiagnosticsFunc) nextHook() func(context.Context, int) ([]resolvers.AdjustedDiagnostic, int, error)
```

### <a id="QueryResolverDiagnosticsFuncCall" href="#QueryResolverDiagnosticsFuncCall">type QueryResolverDiagnosticsFuncCall struct</a>

```
searchKey: mocks.QueryResolverDiagnosticsFuncCall
tags: [struct]
```

```Go
type QueryResolverDiagnosticsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []resolvers.AdjustedDiagnostic
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

QueryResolverDiagnosticsFuncCall is an object that describes an invocation of method Diagnostics on an instance of MockQueryResolver. 

#### <a id="QueryResolverDiagnosticsFuncCall.Args" href="#QueryResolverDiagnosticsFuncCall.Args">func (c QueryResolverDiagnosticsFuncCall) Args() []interface{}</a>

```
searchKey: mocks.QueryResolverDiagnosticsFuncCall.Args
tags: [method]
```

```Go
func (c QueryResolverDiagnosticsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="QueryResolverDiagnosticsFuncCall.Results" href="#QueryResolverDiagnosticsFuncCall.Results">func (c QueryResolverDiagnosticsFuncCall) Results() []interface{}</a>

```
searchKey: mocks.QueryResolverDiagnosticsFuncCall.Results
tags: [method]
```

```Go
func (c QueryResolverDiagnosticsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="QueryResolverDocumentationPageFunc" href="#QueryResolverDocumentationPageFunc">type QueryResolverDocumentationPageFunc struct</a>

```
searchKey: mocks.QueryResolverDocumentationPageFunc
tags: [struct]
```

```Go
type QueryResolverDocumentationPageFunc struct {
	defaultHook func(context.Context, string) (*semantic.DocumentationPageData, error)
	hooks       []func(context.Context, string) (*semantic.DocumentationPageData, error)
	history     []QueryResolverDocumentationPageFuncCall
	mutex       sync.Mutex
}
```

QueryResolverDocumentationPageFunc describes the behavior when the DocumentationPage method of the parent MockQueryResolver instance is invoked. 

#### <a id="QueryResolverDocumentationPageFunc.History" href="#QueryResolverDocumentationPageFunc.History">func (f *QueryResolverDocumentationPageFunc) History() []QueryResolverDocumentationPageFuncCall</a>

```
searchKey: mocks.QueryResolverDocumentationPageFunc.History
tags: [method]
```

```Go
func (f *QueryResolverDocumentationPageFunc) History() []QueryResolverDocumentationPageFuncCall
```

History returns a sequence of QueryResolverDocumentationPageFuncCall objects describing the invocations of this function. 

#### <a id="QueryResolverDocumentationPageFunc.PushHook" href="#QueryResolverDocumentationPageFunc.PushHook">func (f *QueryResolverDocumentationPageFunc) PushHook(hook func(context.Context, string) (*semantic.DocumentationPageData, error))</a>

```
searchKey: mocks.QueryResolverDocumentationPageFunc.PushHook
tags: [method]
```

```Go
func (f *QueryResolverDocumentationPageFunc) PushHook(hook func(context.Context, string) (*semantic.DocumentationPageData, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DocumentationPage method of the parent MockQueryResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="QueryResolverDocumentationPageFunc.PushReturn" href="#QueryResolverDocumentationPageFunc.PushReturn">func (f *QueryResolverDocumentationPageFunc) PushReturn(r0 *semantic.DocumentationPageData, r1 error)</a>

```
searchKey: mocks.QueryResolverDocumentationPageFunc.PushReturn
tags: [method]
```

```Go
func (f *QueryResolverDocumentationPageFunc) PushReturn(r0 *semantic.DocumentationPageData, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverDocumentationPageFunc.SetDefaultHook" href="#QueryResolverDocumentationPageFunc.SetDefaultHook">func (f *QueryResolverDocumentationPageFunc) SetDefaultHook(hook func(context.Context, string) (*semantic.DocumentationPageData, error))</a>

```
searchKey: mocks.QueryResolverDocumentationPageFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *QueryResolverDocumentationPageFunc) SetDefaultHook(hook func(context.Context, string) (*semantic.DocumentationPageData, error))
```

SetDefaultHook sets function that is called when the DocumentationPage method of the parent MockQueryResolver instance is invoked and the hook queue is empty. 

#### <a id="QueryResolverDocumentationPageFunc.SetDefaultReturn" href="#QueryResolverDocumentationPageFunc.SetDefaultReturn">func (f *QueryResolverDocumentationPageFunc) SetDefaultReturn(r0 *semantic.DocumentationPageData, r1 error)</a>

```
searchKey: mocks.QueryResolverDocumentationPageFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *QueryResolverDocumentationPageFunc) SetDefaultReturn(r0 *semantic.DocumentationPageData, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverDocumentationPageFunc.appendCall" href="#QueryResolverDocumentationPageFunc.appendCall">func (f *QueryResolverDocumentationPageFunc) appendCall(r0 QueryResolverDocumentationPageFuncCall)</a>

```
searchKey: mocks.QueryResolverDocumentationPageFunc.appendCall
tags: [method private]
```

```Go
func (f *QueryResolverDocumentationPageFunc) appendCall(r0 QueryResolverDocumentationPageFuncCall)
```

#### <a id="QueryResolverDocumentationPageFunc.nextHook" href="#QueryResolverDocumentationPageFunc.nextHook">func (f *QueryResolverDocumentationPageFunc) nextHook() func(context.Context, string) (*semantic.DocumentationPageData, error)</a>

```
searchKey: mocks.QueryResolverDocumentationPageFunc.nextHook
tags: [method private]
```

```Go
func (f *QueryResolverDocumentationPageFunc) nextHook() func(context.Context, string) (*semantic.DocumentationPageData, error)
```

### <a id="QueryResolverDocumentationPageFuncCall" href="#QueryResolverDocumentationPageFuncCall">type QueryResolverDocumentationPageFuncCall struct</a>

```
searchKey: mocks.QueryResolverDocumentationPageFuncCall
tags: [struct]
```

```Go
type QueryResolverDocumentationPageFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *semantic.DocumentationPageData
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

QueryResolverDocumentationPageFuncCall is an object that describes an invocation of method DocumentationPage on an instance of MockQueryResolver. 

#### <a id="QueryResolverDocumentationPageFuncCall.Args" href="#QueryResolverDocumentationPageFuncCall.Args">func (c QueryResolverDocumentationPageFuncCall) Args() []interface{}</a>

```
searchKey: mocks.QueryResolverDocumentationPageFuncCall.Args
tags: [method]
```

```Go
func (c QueryResolverDocumentationPageFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="QueryResolverDocumentationPageFuncCall.Results" href="#QueryResolverDocumentationPageFuncCall.Results">func (c QueryResolverDocumentationPageFuncCall) Results() []interface{}</a>

```
searchKey: mocks.QueryResolverDocumentationPageFuncCall.Results
tags: [method]
```

```Go
func (c QueryResolverDocumentationPageFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="QueryResolverHoverFunc" href="#QueryResolverHoverFunc">type QueryResolverHoverFunc struct</a>

```
searchKey: mocks.QueryResolverHoverFunc
tags: [struct]
```

```Go
type QueryResolverHoverFunc struct {
	defaultHook func(context.Context, int, int) (string, lsifstore.Range, bool, error)
	hooks       []func(context.Context, int, int) (string, lsifstore.Range, bool, error)
	history     []QueryResolverHoverFuncCall
	mutex       sync.Mutex
}
```

QueryResolverHoverFunc describes the behavior when the Hover method of the parent MockQueryResolver instance is invoked. 

#### <a id="QueryResolverHoverFunc.History" href="#QueryResolverHoverFunc.History">func (f *QueryResolverHoverFunc) History() []QueryResolverHoverFuncCall</a>

```
searchKey: mocks.QueryResolverHoverFunc.History
tags: [method]
```

```Go
func (f *QueryResolverHoverFunc) History() []QueryResolverHoverFuncCall
```

History returns a sequence of QueryResolverHoverFuncCall objects describing the invocations of this function. 

#### <a id="QueryResolverHoverFunc.PushHook" href="#QueryResolverHoverFunc.PushHook">func (f *QueryResolverHoverFunc) PushHook(hook func(context.Context, int, int) (string, lsifstore.Range, bool, error))</a>

```
searchKey: mocks.QueryResolverHoverFunc.PushHook
tags: [method]
```

```Go
func (f *QueryResolverHoverFunc) PushHook(hook func(context.Context, int, int) (string, lsifstore.Range, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Hover method of the parent MockQueryResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="QueryResolverHoverFunc.PushReturn" href="#QueryResolverHoverFunc.PushReturn">func (f *QueryResolverHoverFunc) PushReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)</a>

```
searchKey: mocks.QueryResolverHoverFunc.PushReturn
tags: [method]
```

```Go
func (f *QueryResolverHoverFunc) PushReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverHoverFunc.SetDefaultHook" href="#QueryResolverHoverFunc.SetDefaultHook">func (f *QueryResolverHoverFunc) SetDefaultHook(hook func(context.Context, int, int) (string, lsifstore.Range, bool, error))</a>

```
searchKey: mocks.QueryResolverHoverFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *QueryResolverHoverFunc) SetDefaultHook(hook func(context.Context, int, int) (string, lsifstore.Range, bool, error))
```

SetDefaultHook sets function that is called when the Hover method of the parent MockQueryResolver instance is invoked and the hook queue is empty. 

#### <a id="QueryResolverHoverFunc.SetDefaultReturn" href="#QueryResolverHoverFunc.SetDefaultReturn">func (f *QueryResolverHoverFunc) SetDefaultReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)</a>

```
searchKey: mocks.QueryResolverHoverFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *QueryResolverHoverFunc) SetDefaultReturn(r0 string, r1 lsifstore.Range, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverHoverFunc.appendCall" href="#QueryResolverHoverFunc.appendCall">func (f *QueryResolverHoverFunc) appendCall(r0 QueryResolverHoverFuncCall)</a>

```
searchKey: mocks.QueryResolverHoverFunc.appendCall
tags: [method private]
```

```Go
func (f *QueryResolverHoverFunc) appendCall(r0 QueryResolverHoverFuncCall)
```

#### <a id="QueryResolverHoverFunc.nextHook" href="#QueryResolverHoverFunc.nextHook">func (f *QueryResolverHoverFunc) nextHook() func(context.Context, int, int) (string, lsifstore.Range, bool, error)</a>

```
searchKey: mocks.QueryResolverHoverFunc.nextHook
tags: [method private]
```

```Go
func (f *QueryResolverHoverFunc) nextHook() func(context.Context, int, int) (string, lsifstore.Range, bool, error)
```

### <a id="QueryResolverHoverFuncCall" href="#QueryResolverHoverFuncCall">type QueryResolverHoverFuncCall struct</a>

```
searchKey: mocks.QueryResolverHoverFuncCall
tags: [struct]
```

```Go
type QueryResolverHoverFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 int
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

QueryResolverHoverFuncCall is an object that describes an invocation of method Hover on an instance of MockQueryResolver. 

#### <a id="QueryResolverHoverFuncCall.Args" href="#QueryResolverHoverFuncCall.Args">func (c QueryResolverHoverFuncCall) Args() []interface{}</a>

```
searchKey: mocks.QueryResolverHoverFuncCall.Args
tags: [method]
```

```Go
func (c QueryResolverHoverFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="QueryResolverHoverFuncCall.Results" href="#QueryResolverHoverFuncCall.Results">func (c QueryResolverHoverFuncCall) Results() []interface{}</a>

```
searchKey: mocks.QueryResolverHoverFuncCall.Results
tags: [method]
```

```Go
func (c QueryResolverHoverFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="QueryResolverRangesFunc" href="#QueryResolverRangesFunc">type QueryResolverRangesFunc struct</a>

```
searchKey: mocks.QueryResolverRangesFunc
tags: [struct]
```

```Go
type QueryResolverRangesFunc struct {
	defaultHook func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error)
	hooks       []func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error)
	history     []QueryResolverRangesFuncCall
	mutex       sync.Mutex
}
```

QueryResolverRangesFunc describes the behavior when the Ranges method of the parent MockQueryResolver instance is invoked. 

#### <a id="QueryResolverRangesFunc.History" href="#QueryResolverRangesFunc.History">func (f *QueryResolverRangesFunc) History() []QueryResolverRangesFuncCall</a>

```
searchKey: mocks.QueryResolverRangesFunc.History
tags: [method]
```

```Go
func (f *QueryResolverRangesFunc) History() []QueryResolverRangesFuncCall
```

History returns a sequence of QueryResolverRangesFuncCall objects describing the invocations of this function. 

#### <a id="QueryResolverRangesFunc.PushHook" href="#QueryResolverRangesFunc.PushHook">func (f *QueryResolverRangesFunc) PushHook(hook func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error))</a>

```
searchKey: mocks.QueryResolverRangesFunc.PushHook
tags: [method]
```

```Go
func (f *QueryResolverRangesFunc) PushHook(hook func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Ranges method of the parent MockQueryResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="QueryResolverRangesFunc.PushReturn" href="#QueryResolverRangesFunc.PushReturn">func (f *QueryResolverRangesFunc) PushReturn(r0 []resolvers.AdjustedCodeIntelligenceRange, r1 error)</a>

```
searchKey: mocks.QueryResolverRangesFunc.PushReturn
tags: [method]
```

```Go
func (f *QueryResolverRangesFunc) PushReturn(r0 []resolvers.AdjustedCodeIntelligenceRange, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverRangesFunc.SetDefaultHook" href="#QueryResolverRangesFunc.SetDefaultHook">func (f *QueryResolverRangesFunc) SetDefaultHook(hook func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error))</a>

```
searchKey: mocks.QueryResolverRangesFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *QueryResolverRangesFunc) SetDefaultHook(hook func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error))
```

SetDefaultHook sets function that is called when the Ranges method of the parent MockQueryResolver instance is invoked and the hook queue is empty. 

#### <a id="QueryResolverRangesFunc.SetDefaultReturn" href="#QueryResolverRangesFunc.SetDefaultReturn">func (f *QueryResolverRangesFunc) SetDefaultReturn(r0 []resolvers.AdjustedCodeIntelligenceRange, r1 error)</a>

```
searchKey: mocks.QueryResolverRangesFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *QueryResolverRangesFunc) SetDefaultReturn(r0 []resolvers.AdjustedCodeIntelligenceRange, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverRangesFunc.appendCall" href="#QueryResolverRangesFunc.appendCall">func (f *QueryResolverRangesFunc) appendCall(r0 QueryResolverRangesFuncCall)</a>

```
searchKey: mocks.QueryResolverRangesFunc.appendCall
tags: [method private]
```

```Go
func (f *QueryResolverRangesFunc) appendCall(r0 QueryResolverRangesFuncCall)
```

#### <a id="QueryResolverRangesFunc.nextHook" href="#QueryResolverRangesFunc.nextHook">func (f *QueryResolverRangesFunc) nextHook() func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error)</a>

```
searchKey: mocks.QueryResolverRangesFunc.nextHook
tags: [method private]
```

```Go
func (f *QueryResolverRangesFunc) nextHook() func(context.Context, int, int) ([]resolvers.AdjustedCodeIntelligenceRange, error)
```

### <a id="QueryResolverRangesFuncCall" href="#QueryResolverRangesFuncCall">type QueryResolverRangesFuncCall struct</a>

```
searchKey: mocks.QueryResolverRangesFuncCall
tags: [struct]
```

```Go
type QueryResolverRangesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []resolvers.AdjustedCodeIntelligenceRange
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

QueryResolverRangesFuncCall is an object that describes an invocation of method Ranges on an instance of MockQueryResolver. 

#### <a id="QueryResolverRangesFuncCall.Args" href="#QueryResolverRangesFuncCall.Args">func (c QueryResolverRangesFuncCall) Args() []interface{}</a>

```
searchKey: mocks.QueryResolverRangesFuncCall.Args
tags: [method]
```

```Go
func (c QueryResolverRangesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="QueryResolverRangesFuncCall.Results" href="#QueryResolverRangesFuncCall.Results">func (c QueryResolverRangesFuncCall) Results() []interface{}</a>

```
searchKey: mocks.QueryResolverRangesFuncCall.Results
tags: [method]
```

```Go
func (c QueryResolverRangesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="QueryResolverReferencesFunc" href="#QueryResolverReferencesFunc">type QueryResolverReferencesFunc struct</a>

```
searchKey: mocks.QueryResolverReferencesFunc
tags: [struct]
```

```Go
type QueryResolverReferencesFunc struct {
	defaultHook func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error)
	hooks       []func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error)
	history     []QueryResolverReferencesFuncCall
	mutex       sync.Mutex
}
```

QueryResolverReferencesFunc describes the behavior when the References method of the parent MockQueryResolver instance is invoked. 

#### <a id="QueryResolverReferencesFunc.History" href="#QueryResolverReferencesFunc.History">func (f *QueryResolverReferencesFunc) History() []QueryResolverReferencesFuncCall</a>

```
searchKey: mocks.QueryResolverReferencesFunc.History
tags: [method]
```

```Go
func (f *QueryResolverReferencesFunc) History() []QueryResolverReferencesFuncCall
```

History returns a sequence of QueryResolverReferencesFuncCall objects describing the invocations of this function. 

#### <a id="QueryResolverReferencesFunc.PushHook" href="#QueryResolverReferencesFunc.PushHook">func (f *QueryResolverReferencesFunc) PushHook(hook func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error))</a>

```
searchKey: mocks.QueryResolverReferencesFunc.PushHook
tags: [method]
```

```Go
func (f *QueryResolverReferencesFunc) PushHook(hook func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the References method of the parent MockQueryResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="QueryResolverReferencesFunc.PushReturn" href="#QueryResolverReferencesFunc.PushReturn">func (f *QueryResolverReferencesFunc) PushReturn(r0 []resolvers.AdjustedLocation, r1 string, r2 error)</a>

```
searchKey: mocks.QueryResolverReferencesFunc.PushReturn
tags: [method]
```

```Go
func (f *QueryResolverReferencesFunc) PushReturn(r0 []resolvers.AdjustedLocation, r1 string, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverReferencesFunc.SetDefaultHook" href="#QueryResolverReferencesFunc.SetDefaultHook">func (f *QueryResolverReferencesFunc) SetDefaultHook(hook func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error))</a>

```
searchKey: mocks.QueryResolverReferencesFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *QueryResolverReferencesFunc) SetDefaultHook(hook func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error))
```

SetDefaultHook sets function that is called when the References method of the parent MockQueryResolver instance is invoked and the hook queue is empty. 

#### <a id="QueryResolverReferencesFunc.SetDefaultReturn" href="#QueryResolverReferencesFunc.SetDefaultReturn">func (f *QueryResolverReferencesFunc) SetDefaultReturn(r0 []resolvers.AdjustedLocation, r1 string, r2 error)</a>

```
searchKey: mocks.QueryResolverReferencesFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *QueryResolverReferencesFunc) SetDefaultReturn(r0 []resolvers.AdjustedLocation, r1 string, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="QueryResolverReferencesFunc.appendCall" href="#QueryResolverReferencesFunc.appendCall">func (f *QueryResolverReferencesFunc) appendCall(r0 QueryResolverReferencesFuncCall)</a>

```
searchKey: mocks.QueryResolverReferencesFunc.appendCall
tags: [method private]
```

```Go
func (f *QueryResolverReferencesFunc) appendCall(r0 QueryResolverReferencesFuncCall)
```

#### <a id="QueryResolverReferencesFunc.nextHook" href="#QueryResolverReferencesFunc.nextHook">func (f *QueryResolverReferencesFunc) nextHook() func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error)</a>

```
searchKey: mocks.QueryResolverReferencesFunc.nextHook
tags: [method private]
```

```Go
func (f *QueryResolverReferencesFunc) nextHook() func(context.Context, int, int, int, string) ([]resolvers.AdjustedLocation, string, error)
```

### <a id="QueryResolverReferencesFuncCall" href="#QueryResolverReferencesFuncCall">type QueryResolverReferencesFuncCall struct</a>

```
searchKey: mocks.QueryResolverReferencesFuncCall
tags: [struct]
```

```Go
type QueryResolverReferencesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 int
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 int
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []resolvers.AdjustedLocation
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 string
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

QueryResolverReferencesFuncCall is an object that describes an invocation of method References on an instance of MockQueryResolver. 

#### <a id="QueryResolverReferencesFuncCall.Args" href="#QueryResolverReferencesFuncCall.Args">func (c QueryResolverReferencesFuncCall) Args() []interface{}</a>

```
searchKey: mocks.QueryResolverReferencesFuncCall.Args
tags: [method]
```

```Go
func (c QueryResolverReferencesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="QueryResolverReferencesFuncCall.Results" href="#QueryResolverReferencesFuncCall.Results">func (c QueryResolverReferencesFuncCall) Results() []interface{}</a>

```
searchKey: mocks.QueryResolverReferencesFuncCall.Results
tags: [method]
```

```Go
func (c QueryResolverReferencesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverCommitGraphFunc" href="#ResolverCommitGraphFunc">type ResolverCommitGraphFunc struct</a>

```
searchKey: mocks.ResolverCommitGraphFunc
tags: [struct]
```

```Go
type ResolverCommitGraphFunc struct {
	defaultHook func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error)
	hooks       []func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error)
	history     []ResolverCommitGraphFuncCall
	mutex       sync.Mutex
}
```

ResolverCommitGraphFunc describes the behavior when the CommitGraph method of the parent MockResolver instance is invoked. 

#### <a id="ResolverCommitGraphFunc.History" href="#ResolverCommitGraphFunc.History">func (f *ResolverCommitGraphFunc) History() []ResolverCommitGraphFuncCall</a>

```
searchKey: mocks.ResolverCommitGraphFunc.History
tags: [method]
```

```Go
func (f *ResolverCommitGraphFunc) History() []ResolverCommitGraphFuncCall
```

History returns a sequence of ResolverCommitGraphFuncCall objects describing the invocations of this function. 

#### <a id="ResolverCommitGraphFunc.PushHook" href="#ResolverCommitGraphFunc.PushHook">func (f *ResolverCommitGraphFunc) PushHook(hook func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error))</a>

```
searchKey: mocks.ResolverCommitGraphFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverCommitGraphFunc) PushHook(hook func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CommitGraph method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverCommitGraphFunc.PushReturn" href="#ResolverCommitGraphFunc.PushReturn">func (f *ResolverCommitGraphFunc) PushReturn(r0 graphqlbackend.CodeIntelligenceCommitGraphResolver, r1 error)</a>

```
searchKey: mocks.ResolverCommitGraphFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverCommitGraphFunc) PushReturn(r0 graphqlbackend.CodeIntelligenceCommitGraphResolver, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverCommitGraphFunc.SetDefaultHook" href="#ResolverCommitGraphFunc.SetDefaultHook">func (f *ResolverCommitGraphFunc) SetDefaultHook(hook func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error))</a>

```
searchKey: mocks.ResolverCommitGraphFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverCommitGraphFunc) SetDefaultHook(hook func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error))
```

SetDefaultHook sets function that is called when the CommitGraph method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverCommitGraphFunc.SetDefaultReturn" href="#ResolverCommitGraphFunc.SetDefaultReturn">func (f *ResolverCommitGraphFunc) SetDefaultReturn(r0 graphqlbackend.CodeIntelligenceCommitGraphResolver, r1 error)</a>

```
searchKey: mocks.ResolverCommitGraphFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverCommitGraphFunc) SetDefaultReturn(r0 graphqlbackend.CodeIntelligenceCommitGraphResolver, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverCommitGraphFunc.appendCall" href="#ResolverCommitGraphFunc.appendCall">func (f *ResolverCommitGraphFunc) appendCall(r0 ResolverCommitGraphFuncCall)</a>

```
searchKey: mocks.ResolverCommitGraphFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverCommitGraphFunc) appendCall(r0 ResolverCommitGraphFuncCall)
```

#### <a id="ResolverCommitGraphFunc.nextHook" href="#ResolverCommitGraphFunc.nextHook">func (f *ResolverCommitGraphFunc) nextHook() func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error)</a>

```
searchKey: mocks.ResolverCommitGraphFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverCommitGraphFunc) nextHook() func(context.Context, int) (graphqlbackend.CodeIntelligenceCommitGraphResolver, error)
```

### <a id="ResolverCommitGraphFuncCall" href="#ResolverCommitGraphFuncCall">type ResolverCommitGraphFuncCall struct</a>

```
searchKey: mocks.ResolverCommitGraphFuncCall
tags: [struct]
```

```Go
type ResolverCommitGraphFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 graphqlbackend.CodeIntelligenceCommitGraphResolver
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

ResolverCommitGraphFuncCall is an object that describes an invocation of method CommitGraph on an instance of MockResolver. 

#### <a id="ResolverCommitGraphFuncCall.Args" href="#ResolverCommitGraphFuncCall.Args">func (c ResolverCommitGraphFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverCommitGraphFuncCall.Args
tags: [method]
```

```Go
func (c ResolverCommitGraphFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverCommitGraphFuncCall.Results" href="#ResolverCommitGraphFuncCall.Results">func (c ResolverCommitGraphFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverCommitGraphFuncCall.Results
tags: [method]
```

```Go
func (c ResolverCommitGraphFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverDeleteIndexByIDFunc" href="#ResolverDeleteIndexByIDFunc">type ResolverDeleteIndexByIDFunc struct</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFunc
tags: [struct]
```

```Go
type ResolverDeleteIndexByIDFunc struct {
	defaultHook func(context.Context, int) error
	hooks       []func(context.Context, int) error
	history     []ResolverDeleteIndexByIDFuncCall
	mutex       sync.Mutex
}
```

ResolverDeleteIndexByIDFunc describes the behavior when the DeleteIndexByID method of the parent MockResolver instance is invoked. 

#### <a id="ResolverDeleteIndexByIDFunc.History" href="#ResolverDeleteIndexByIDFunc.History">func (f *ResolverDeleteIndexByIDFunc) History() []ResolverDeleteIndexByIDFuncCall</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFunc.History
tags: [method]
```

```Go
func (f *ResolverDeleteIndexByIDFunc) History() []ResolverDeleteIndexByIDFuncCall
```

History returns a sequence of ResolverDeleteIndexByIDFuncCall objects describing the invocations of this function. 

#### <a id="ResolverDeleteIndexByIDFunc.PushHook" href="#ResolverDeleteIndexByIDFunc.PushHook">func (f *ResolverDeleteIndexByIDFunc) PushHook(hook func(context.Context, int) error)</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverDeleteIndexByIDFunc) PushHook(hook func(context.Context, int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteIndexByID method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverDeleteIndexByIDFunc.PushReturn" href="#ResolverDeleteIndexByIDFunc.PushReturn">func (f *ResolverDeleteIndexByIDFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverDeleteIndexByIDFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverDeleteIndexByIDFunc.SetDefaultHook" href="#ResolverDeleteIndexByIDFunc.SetDefaultHook">func (f *ResolverDeleteIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) error)</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverDeleteIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) error)
```

SetDefaultHook sets function that is called when the DeleteIndexByID method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverDeleteIndexByIDFunc.SetDefaultReturn" href="#ResolverDeleteIndexByIDFunc.SetDefaultReturn">func (f *ResolverDeleteIndexByIDFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverDeleteIndexByIDFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverDeleteIndexByIDFunc.appendCall" href="#ResolverDeleteIndexByIDFunc.appendCall">func (f *ResolverDeleteIndexByIDFunc) appendCall(r0 ResolverDeleteIndexByIDFuncCall)</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverDeleteIndexByIDFunc) appendCall(r0 ResolverDeleteIndexByIDFuncCall)
```

#### <a id="ResolverDeleteIndexByIDFunc.nextHook" href="#ResolverDeleteIndexByIDFunc.nextHook">func (f *ResolverDeleteIndexByIDFunc) nextHook() func(context.Context, int) error</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverDeleteIndexByIDFunc) nextHook() func(context.Context, int) error
```

### <a id="ResolverDeleteIndexByIDFuncCall" href="#ResolverDeleteIndexByIDFuncCall">type ResolverDeleteIndexByIDFuncCall struct</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFuncCall
tags: [struct]
```

```Go
type ResolverDeleteIndexByIDFuncCall struct {
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

ResolverDeleteIndexByIDFuncCall is an object that describes an invocation of method DeleteIndexByID on an instance of MockResolver. 

#### <a id="ResolverDeleteIndexByIDFuncCall.Args" href="#ResolverDeleteIndexByIDFuncCall.Args">func (c ResolverDeleteIndexByIDFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFuncCall.Args
tags: [method]
```

```Go
func (c ResolverDeleteIndexByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverDeleteIndexByIDFuncCall.Results" href="#ResolverDeleteIndexByIDFuncCall.Results">func (c ResolverDeleteIndexByIDFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverDeleteIndexByIDFuncCall.Results
tags: [method]
```

```Go
func (c ResolverDeleteIndexByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverDeleteUploadByIDFunc" href="#ResolverDeleteUploadByIDFunc">type ResolverDeleteUploadByIDFunc struct</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFunc
tags: [struct]
```

```Go
type ResolverDeleteUploadByIDFunc struct {
	defaultHook func(context.Context, int) error
	hooks       []func(context.Context, int) error
	history     []ResolverDeleteUploadByIDFuncCall
	mutex       sync.Mutex
}
```

ResolverDeleteUploadByIDFunc describes the behavior when the DeleteUploadByID method of the parent MockResolver instance is invoked. 

#### <a id="ResolverDeleteUploadByIDFunc.History" href="#ResolverDeleteUploadByIDFunc.History">func (f *ResolverDeleteUploadByIDFunc) History() []ResolverDeleteUploadByIDFuncCall</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFunc.History
tags: [method]
```

```Go
func (f *ResolverDeleteUploadByIDFunc) History() []ResolverDeleteUploadByIDFuncCall
```

History returns a sequence of ResolverDeleteUploadByIDFuncCall objects describing the invocations of this function. 

#### <a id="ResolverDeleteUploadByIDFunc.PushHook" href="#ResolverDeleteUploadByIDFunc.PushHook">func (f *ResolverDeleteUploadByIDFunc) PushHook(hook func(context.Context, int) error)</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverDeleteUploadByIDFunc) PushHook(hook func(context.Context, int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteUploadByID method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverDeleteUploadByIDFunc.PushReturn" href="#ResolverDeleteUploadByIDFunc.PushReturn">func (f *ResolverDeleteUploadByIDFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverDeleteUploadByIDFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverDeleteUploadByIDFunc.SetDefaultHook" href="#ResolverDeleteUploadByIDFunc.SetDefaultHook">func (f *ResolverDeleteUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) error)</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverDeleteUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) error)
```

SetDefaultHook sets function that is called when the DeleteUploadByID method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverDeleteUploadByIDFunc.SetDefaultReturn" href="#ResolverDeleteUploadByIDFunc.SetDefaultReturn">func (f *ResolverDeleteUploadByIDFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverDeleteUploadByIDFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverDeleteUploadByIDFunc.appendCall" href="#ResolverDeleteUploadByIDFunc.appendCall">func (f *ResolverDeleteUploadByIDFunc) appendCall(r0 ResolverDeleteUploadByIDFuncCall)</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverDeleteUploadByIDFunc) appendCall(r0 ResolverDeleteUploadByIDFuncCall)
```

#### <a id="ResolverDeleteUploadByIDFunc.nextHook" href="#ResolverDeleteUploadByIDFunc.nextHook">func (f *ResolverDeleteUploadByIDFunc) nextHook() func(context.Context, int) error</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverDeleteUploadByIDFunc) nextHook() func(context.Context, int) error
```

### <a id="ResolverDeleteUploadByIDFuncCall" href="#ResolverDeleteUploadByIDFuncCall">type ResolverDeleteUploadByIDFuncCall struct</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFuncCall
tags: [struct]
```

```Go
type ResolverDeleteUploadByIDFuncCall struct {
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

ResolverDeleteUploadByIDFuncCall is an object that describes an invocation of method DeleteUploadByID on an instance of MockResolver. 

#### <a id="ResolverDeleteUploadByIDFuncCall.Args" href="#ResolverDeleteUploadByIDFuncCall.Args">func (c ResolverDeleteUploadByIDFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFuncCall.Args
tags: [method]
```

```Go
func (c ResolverDeleteUploadByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverDeleteUploadByIDFuncCall.Results" href="#ResolverDeleteUploadByIDFuncCall.Results">func (c ResolverDeleteUploadByIDFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverDeleteUploadByIDFuncCall.Results
tags: [method]
```

```Go
func (c ResolverDeleteUploadByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverGetIndexByIDFunc" href="#ResolverGetIndexByIDFunc">type ResolverGetIndexByIDFunc struct</a>

```
searchKey: mocks.ResolverGetIndexByIDFunc
tags: [struct]
```

```Go
type ResolverGetIndexByIDFunc struct {
	defaultHook func(context.Context, int) (dbstore.Index, bool, error)
	hooks       []func(context.Context, int) (dbstore.Index, bool, error)
	history     []ResolverGetIndexByIDFuncCall
	mutex       sync.Mutex
}
```

ResolverGetIndexByIDFunc describes the behavior when the GetIndexByID method of the parent MockResolver instance is invoked. 

#### <a id="ResolverGetIndexByIDFunc.History" href="#ResolverGetIndexByIDFunc.History">func (f *ResolverGetIndexByIDFunc) History() []ResolverGetIndexByIDFuncCall</a>

```
searchKey: mocks.ResolverGetIndexByIDFunc.History
tags: [method]
```

```Go
func (f *ResolverGetIndexByIDFunc) History() []ResolverGetIndexByIDFuncCall
```

History returns a sequence of ResolverGetIndexByIDFuncCall objects describing the invocations of this function. 

#### <a id="ResolverGetIndexByIDFunc.PushHook" href="#ResolverGetIndexByIDFunc.PushHook">func (f *ResolverGetIndexByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Index, bool, error))</a>

```
searchKey: mocks.ResolverGetIndexByIDFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverGetIndexByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Index, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetIndexByID method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverGetIndexByIDFunc.PushReturn" href="#ResolverGetIndexByIDFunc.PushReturn">func (f *ResolverGetIndexByIDFunc) PushReturn(r0 dbstore.Index, r1 bool, r2 error)</a>

```
searchKey: mocks.ResolverGetIndexByIDFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverGetIndexByIDFunc) PushReturn(r0 dbstore.Index, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverGetIndexByIDFunc.SetDefaultHook" href="#ResolverGetIndexByIDFunc.SetDefaultHook">func (f *ResolverGetIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Index, bool, error))</a>

```
searchKey: mocks.ResolverGetIndexByIDFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverGetIndexByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Index, bool, error))
```

SetDefaultHook sets function that is called when the GetIndexByID method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverGetIndexByIDFunc.SetDefaultReturn" href="#ResolverGetIndexByIDFunc.SetDefaultReturn">func (f *ResolverGetIndexByIDFunc) SetDefaultReturn(r0 dbstore.Index, r1 bool, r2 error)</a>

```
searchKey: mocks.ResolverGetIndexByIDFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverGetIndexByIDFunc) SetDefaultReturn(r0 dbstore.Index, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverGetIndexByIDFunc.appendCall" href="#ResolverGetIndexByIDFunc.appendCall">func (f *ResolverGetIndexByIDFunc) appendCall(r0 ResolverGetIndexByIDFuncCall)</a>

```
searchKey: mocks.ResolverGetIndexByIDFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverGetIndexByIDFunc) appendCall(r0 ResolverGetIndexByIDFuncCall)
```

#### <a id="ResolverGetIndexByIDFunc.nextHook" href="#ResolverGetIndexByIDFunc.nextHook">func (f *ResolverGetIndexByIDFunc) nextHook() func(context.Context, int) (dbstore.Index, bool, error)</a>

```
searchKey: mocks.ResolverGetIndexByIDFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverGetIndexByIDFunc) nextHook() func(context.Context, int) (dbstore.Index, bool, error)
```

### <a id="ResolverGetIndexByIDFuncCall" href="#ResolverGetIndexByIDFuncCall">type ResolverGetIndexByIDFuncCall struct</a>

```
searchKey: mocks.ResolverGetIndexByIDFuncCall
tags: [struct]
```

```Go
type ResolverGetIndexByIDFuncCall struct {
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

ResolverGetIndexByIDFuncCall is an object that describes an invocation of method GetIndexByID on an instance of MockResolver. 

#### <a id="ResolverGetIndexByIDFuncCall.Args" href="#ResolverGetIndexByIDFuncCall.Args">func (c ResolverGetIndexByIDFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverGetIndexByIDFuncCall.Args
tags: [method]
```

```Go
func (c ResolverGetIndexByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverGetIndexByIDFuncCall.Results" href="#ResolverGetIndexByIDFuncCall.Results">func (c ResolverGetIndexByIDFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverGetIndexByIDFuncCall.Results
tags: [method]
```

```Go
func (c ResolverGetIndexByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverGetIndexesByIDsFunc" href="#ResolverGetIndexesByIDsFunc">type ResolverGetIndexesByIDsFunc struct</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFunc
tags: [struct]
```

```Go
type ResolverGetIndexesByIDsFunc struct {
	defaultHook func(context.Context, ...int) ([]dbstore.Index, error)
	hooks       []func(context.Context, ...int) ([]dbstore.Index, error)
	history     []ResolverGetIndexesByIDsFuncCall
	mutex       sync.Mutex
}
```

ResolverGetIndexesByIDsFunc describes the behavior when the GetIndexesByIDs method of the parent MockResolver instance is invoked. 

#### <a id="ResolverGetIndexesByIDsFunc.History" href="#ResolverGetIndexesByIDsFunc.History">func (f *ResolverGetIndexesByIDsFunc) History() []ResolverGetIndexesByIDsFuncCall</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFunc.History
tags: [method]
```

```Go
func (f *ResolverGetIndexesByIDsFunc) History() []ResolverGetIndexesByIDsFuncCall
```

History returns a sequence of ResolverGetIndexesByIDsFuncCall objects describing the invocations of this function. 

#### <a id="ResolverGetIndexesByIDsFunc.PushHook" href="#ResolverGetIndexesByIDsFunc.PushHook">func (f *ResolverGetIndexesByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Index, error))</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverGetIndexesByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Index, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetIndexesByIDs method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverGetIndexesByIDsFunc.PushReturn" href="#ResolverGetIndexesByIDsFunc.PushReturn">func (f *ResolverGetIndexesByIDsFunc) PushReturn(r0 []dbstore.Index, r1 error)</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverGetIndexesByIDsFunc) PushReturn(r0 []dbstore.Index, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverGetIndexesByIDsFunc.SetDefaultHook" href="#ResolverGetIndexesByIDsFunc.SetDefaultHook">func (f *ResolverGetIndexesByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Index, error))</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverGetIndexesByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Index, error))
```

SetDefaultHook sets function that is called when the GetIndexesByIDs method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverGetIndexesByIDsFunc.SetDefaultReturn" href="#ResolverGetIndexesByIDsFunc.SetDefaultReturn">func (f *ResolverGetIndexesByIDsFunc) SetDefaultReturn(r0 []dbstore.Index, r1 error)</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverGetIndexesByIDsFunc) SetDefaultReturn(r0 []dbstore.Index, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverGetIndexesByIDsFunc.appendCall" href="#ResolverGetIndexesByIDsFunc.appendCall">func (f *ResolverGetIndexesByIDsFunc) appendCall(r0 ResolverGetIndexesByIDsFuncCall)</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverGetIndexesByIDsFunc) appendCall(r0 ResolverGetIndexesByIDsFuncCall)
```

#### <a id="ResolverGetIndexesByIDsFunc.nextHook" href="#ResolverGetIndexesByIDsFunc.nextHook">func (f *ResolverGetIndexesByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Index, error)</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverGetIndexesByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Index, error)
```

### <a id="ResolverGetIndexesByIDsFuncCall" href="#ResolverGetIndexesByIDsFuncCall">type ResolverGetIndexesByIDsFuncCall struct</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFuncCall
tags: [struct]
```

```Go
type ResolverGetIndexesByIDsFuncCall struct {
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

ResolverGetIndexesByIDsFuncCall is an object that describes an invocation of method GetIndexesByIDs on an instance of MockResolver. 

#### <a id="ResolverGetIndexesByIDsFuncCall.Args" href="#ResolverGetIndexesByIDsFuncCall.Args">func (c ResolverGetIndexesByIDsFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFuncCall.Args
tags: [method]
```

```Go
func (c ResolverGetIndexesByIDsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. The variadic slice argument is flattened in this array such that one positional argument and three variadic arguments would result in a slice of four, not two. 

#### <a id="ResolverGetIndexesByIDsFuncCall.Results" href="#ResolverGetIndexesByIDsFuncCall.Results">func (c ResolverGetIndexesByIDsFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverGetIndexesByIDsFuncCall.Results
tags: [method]
```

```Go
func (c ResolverGetIndexesByIDsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverGetUploadByIDFunc" href="#ResolverGetUploadByIDFunc">type ResolverGetUploadByIDFunc struct</a>

```
searchKey: mocks.ResolverGetUploadByIDFunc
tags: [struct]
```

```Go
type ResolverGetUploadByIDFunc struct {
	defaultHook func(context.Context, int) (dbstore.Upload, bool, error)
	hooks       []func(context.Context, int) (dbstore.Upload, bool, error)
	history     []ResolverGetUploadByIDFuncCall
	mutex       sync.Mutex
}
```

ResolverGetUploadByIDFunc describes the behavior when the GetUploadByID method of the parent MockResolver instance is invoked. 

#### <a id="ResolverGetUploadByIDFunc.History" href="#ResolverGetUploadByIDFunc.History">func (f *ResolverGetUploadByIDFunc) History() []ResolverGetUploadByIDFuncCall</a>

```
searchKey: mocks.ResolverGetUploadByIDFunc.History
tags: [method]
```

```Go
func (f *ResolverGetUploadByIDFunc) History() []ResolverGetUploadByIDFuncCall
```

History returns a sequence of ResolverGetUploadByIDFuncCall objects describing the invocations of this function. 

#### <a id="ResolverGetUploadByIDFunc.PushHook" href="#ResolverGetUploadByIDFunc.PushHook">func (f *ResolverGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: mocks.ResolverGetUploadByIDFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploadByID method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverGetUploadByIDFunc.PushReturn" href="#ResolverGetUploadByIDFunc.PushReturn">func (f *ResolverGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: mocks.ResolverGetUploadByIDFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverGetUploadByIDFunc.SetDefaultHook" href="#ResolverGetUploadByIDFunc.SetDefaultHook">func (f *ResolverGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: mocks.ResolverGetUploadByIDFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

SetDefaultHook sets function that is called when the GetUploadByID method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverGetUploadByIDFunc.SetDefaultReturn" href="#ResolverGetUploadByIDFunc.SetDefaultReturn">func (f *ResolverGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: mocks.ResolverGetUploadByIDFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverGetUploadByIDFunc.appendCall" href="#ResolverGetUploadByIDFunc.appendCall">func (f *ResolverGetUploadByIDFunc) appendCall(r0 ResolverGetUploadByIDFuncCall)</a>

```
searchKey: mocks.ResolverGetUploadByIDFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverGetUploadByIDFunc) appendCall(r0 ResolverGetUploadByIDFuncCall)
```

#### <a id="ResolverGetUploadByIDFunc.nextHook" href="#ResolverGetUploadByIDFunc.nextHook">func (f *ResolverGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)</a>

```
searchKey: mocks.ResolverGetUploadByIDFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)
```

### <a id="ResolverGetUploadByIDFuncCall" href="#ResolverGetUploadByIDFuncCall">type ResolverGetUploadByIDFuncCall struct</a>

```
searchKey: mocks.ResolverGetUploadByIDFuncCall
tags: [struct]
```

```Go
type ResolverGetUploadByIDFuncCall struct {
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

ResolverGetUploadByIDFuncCall is an object that describes an invocation of method GetUploadByID on an instance of MockResolver. 

#### <a id="ResolverGetUploadByIDFuncCall.Args" href="#ResolverGetUploadByIDFuncCall.Args">func (c ResolverGetUploadByIDFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverGetUploadByIDFuncCall.Args
tags: [method]
```

```Go
func (c ResolverGetUploadByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverGetUploadByIDFuncCall.Results" href="#ResolverGetUploadByIDFuncCall.Results">func (c ResolverGetUploadByIDFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverGetUploadByIDFuncCall.Results
tags: [method]
```

```Go
func (c ResolverGetUploadByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverGetUploadsByIDsFunc" href="#ResolverGetUploadsByIDsFunc">type ResolverGetUploadsByIDsFunc struct</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFunc
tags: [struct]
```

```Go
type ResolverGetUploadsByIDsFunc struct {
	defaultHook func(context.Context, ...int) ([]dbstore.Upload, error)
	hooks       []func(context.Context, ...int) ([]dbstore.Upload, error)
	history     []ResolverGetUploadsByIDsFuncCall
	mutex       sync.Mutex
}
```

ResolverGetUploadsByIDsFunc describes the behavior when the GetUploadsByIDs method of the parent MockResolver instance is invoked. 

#### <a id="ResolverGetUploadsByIDsFunc.History" href="#ResolverGetUploadsByIDsFunc.History">func (f *ResolverGetUploadsByIDsFunc) History() []ResolverGetUploadsByIDsFuncCall</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFunc.History
tags: [method]
```

```Go
func (f *ResolverGetUploadsByIDsFunc) History() []ResolverGetUploadsByIDsFuncCall
```

History returns a sequence of ResolverGetUploadsByIDsFuncCall objects describing the invocations of this function. 

#### <a id="ResolverGetUploadsByIDsFunc.PushHook" href="#ResolverGetUploadsByIDsFunc.PushHook">func (f *ResolverGetUploadsByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverGetUploadsByIDsFunc) PushHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploadsByIDs method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverGetUploadsByIDsFunc.PushReturn" href="#ResolverGetUploadsByIDsFunc.PushReturn">func (f *ResolverGetUploadsByIDsFunc) PushReturn(r0 []dbstore.Upload, r1 error)</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverGetUploadsByIDsFunc) PushReturn(r0 []dbstore.Upload, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverGetUploadsByIDsFunc.SetDefaultHook" href="#ResolverGetUploadsByIDsFunc.SetDefaultHook">func (f *ResolverGetUploadsByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverGetUploadsByIDsFunc) SetDefaultHook(hook func(context.Context, ...int) ([]dbstore.Upload, error))
```

SetDefaultHook sets function that is called when the GetUploadsByIDs method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverGetUploadsByIDsFunc.SetDefaultReturn" href="#ResolverGetUploadsByIDsFunc.SetDefaultReturn">func (f *ResolverGetUploadsByIDsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 error)</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverGetUploadsByIDsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverGetUploadsByIDsFunc.appendCall" href="#ResolverGetUploadsByIDsFunc.appendCall">func (f *ResolverGetUploadsByIDsFunc) appendCall(r0 ResolverGetUploadsByIDsFuncCall)</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverGetUploadsByIDsFunc) appendCall(r0 ResolverGetUploadsByIDsFuncCall)
```

#### <a id="ResolverGetUploadsByIDsFunc.nextHook" href="#ResolverGetUploadsByIDsFunc.nextHook">func (f *ResolverGetUploadsByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Upload, error)</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverGetUploadsByIDsFunc) nextHook() func(context.Context, ...int) ([]dbstore.Upload, error)
```

### <a id="ResolverGetUploadsByIDsFuncCall" href="#ResolverGetUploadsByIDsFuncCall">type ResolverGetUploadsByIDsFuncCall struct</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFuncCall
tags: [struct]
```

```Go
type ResolverGetUploadsByIDsFuncCall struct {
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

ResolverGetUploadsByIDsFuncCall is an object that describes an invocation of method GetUploadsByIDs on an instance of MockResolver. 

#### <a id="ResolverGetUploadsByIDsFuncCall.Args" href="#ResolverGetUploadsByIDsFuncCall.Args">func (c ResolverGetUploadsByIDsFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFuncCall.Args
tags: [method]
```

```Go
func (c ResolverGetUploadsByIDsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. The variadic slice argument is flattened in this array such that one positional argument and three variadic arguments would result in a slice of four, not two. 

#### <a id="ResolverGetUploadsByIDsFuncCall.Results" href="#ResolverGetUploadsByIDsFuncCall.Results">func (c ResolverGetUploadsByIDsFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverGetUploadsByIDsFuncCall.Results
tags: [method]
```

```Go
func (c ResolverGetUploadsByIDsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverIndexConfigurationFunc" href="#ResolverIndexConfigurationFunc">type ResolverIndexConfigurationFunc struct</a>

```
searchKey: mocks.ResolverIndexConfigurationFunc
tags: [struct]
```

```Go
type ResolverIndexConfigurationFunc struct {
	defaultHook func(context.Context, int) ([]byte, error)
	hooks       []func(context.Context, int) ([]byte, error)
	history     []ResolverIndexConfigurationFuncCall
	mutex       sync.Mutex
}
```

ResolverIndexConfigurationFunc describes the behavior when the IndexConfiguration method of the parent MockResolver instance is invoked. 

#### <a id="ResolverIndexConfigurationFunc.History" href="#ResolverIndexConfigurationFunc.History">func (f *ResolverIndexConfigurationFunc) History() []ResolverIndexConfigurationFuncCall</a>

```
searchKey: mocks.ResolverIndexConfigurationFunc.History
tags: [method]
```

```Go
func (f *ResolverIndexConfigurationFunc) History() []ResolverIndexConfigurationFuncCall
```

History returns a sequence of ResolverIndexConfigurationFuncCall objects describing the invocations of this function. 

#### <a id="ResolverIndexConfigurationFunc.PushHook" href="#ResolverIndexConfigurationFunc.PushHook">func (f *ResolverIndexConfigurationFunc) PushHook(hook func(context.Context, int) ([]byte, error))</a>

```
searchKey: mocks.ResolverIndexConfigurationFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverIndexConfigurationFunc) PushHook(hook func(context.Context, int) ([]byte, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the IndexConfiguration method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverIndexConfigurationFunc.PushReturn" href="#ResolverIndexConfigurationFunc.PushReturn">func (f *ResolverIndexConfigurationFunc) PushReturn(r0 []byte, r1 error)</a>

```
searchKey: mocks.ResolverIndexConfigurationFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverIndexConfigurationFunc) PushReturn(r0 []byte, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverIndexConfigurationFunc.SetDefaultHook" href="#ResolverIndexConfigurationFunc.SetDefaultHook">func (f *ResolverIndexConfigurationFunc) SetDefaultHook(hook func(context.Context, int) ([]byte, error))</a>

```
searchKey: mocks.ResolverIndexConfigurationFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverIndexConfigurationFunc) SetDefaultHook(hook func(context.Context, int) ([]byte, error))
```

SetDefaultHook sets function that is called when the IndexConfiguration method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverIndexConfigurationFunc.SetDefaultReturn" href="#ResolverIndexConfigurationFunc.SetDefaultReturn">func (f *ResolverIndexConfigurationFunc) SetDefaultReturn(r0 []byte, r1 error)</a>

```
searchKey: mocks.ResolverIndexConfigurationFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverIndexConfigurationFunc) SetDefaultReturn(r0 []byte, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverIndexConfigurationFunc.appendCall" href="#ResolverIndexConfigurationFunc.appendCall">func (f *ResolverIndexConfigurationFunc) appendCall(r0 ResolverIndexConfigurationFuncCall)</a>

```
searchKey: mocks.ResolverIndexConfigurationFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverIndexConfigurationFunc) appendCall(r0 ResolverIndexConfigurationFuncCall)
```

#### <a id="ResolverIndexConfigurationFunc.nextHook" href="#ResolverIndexConfigurationFunc.nextHook">func (f *ResolverIndexConfigurationFunc) nextHook() func(context.Context, int) ([]byte, error)</a>

```
searchKey: mocks.ResolverIndexConfigurationFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverIndexConfigurationFunc) nextHook() func(context.Context, int) ([]byte, error)
```

### <a id="ResolverIndexConfigurationFuncCall" href="#ResolverIndexConfigurationFuncCall">type ResolverIndexConfigurationFuncCall struct</a>

```
searchKey: mocks.ResolverIndexConfigurationFuncCall
tags: [struct]
```

```Go
type ResolverIndexConfigurationFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []byte
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

ResolverIndexConfigurationFuncCall is an object that describes an invocation of method IndexConfiguration on an instance of MockResolver. 

#### <a id="ResolverIndexConfigurationFuncCall.Args" href="#ResolverIndexConfigurationFuncCall.Args">func (c ResolverIndexConfigurationFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverIndexConfigurationFuncCall.Args
tags: [method]
```

```Go
func (c ResolverIndexConfigurationFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverIndexConfigurationFuncCall.Results" href="#ResolverIndexConfigurationFuncCall.Results">func (c ResolverIndexConfigurationFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverIndexConfigurationFuncCall.Results
tags: [method]
```

```Go
func (c ResolverIndexConfigurationFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverIndexConnectionResolverFunc" href="#ResolverIndexConnectionResolverFunc">type ResolverIndexConnectionResolverFunc struct</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFunc
tags: [struct]
```

```Go
type ResolverIndexConnectionResolverFunc struct {
	defaultHook func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver
	hooks       []func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver
	history     []ResolverIndexConnectionResolverFuncCall
	mutex       sync.Mutex
}
```

ResolverIndexConnectionResolverFunc describes the behavior when the IndexConnectionResolver method of the parent MockResolver instance is invoked. 

#### <a id="ResolverIndexConnectionResolverFunc.History" href="#ResolverIndexConnectionResolverFunc.History">func (f *ResolverIndexConnectionResolverFunc) History() []ResolverIndexConnectionResolverFuncCall</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFunc.History
tags: [method]
```

```Go
func (f *ResolverIndexConnectionResolverFunc) History() []ResolverIndexConnectionResolverFuncCall
```

History returns a sequence of ResolverIndexConnectionResolverFuncCall objects describing the invocations of this function. 

#### <a id="ResolverIndexConnectionResolverFunc.PushHook" href="#ResolverIndexConnectionResolverFunc.PushHook">func (f *ResolverIndexConnectionResolverFunc) PushHook(hook func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver)</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverIndexConnectionResolverFunc) PushHook(hook func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver)
```

PushHook adds a function to the end of hook queue. Each invocation of the IndexConnectionResolver method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverIndexConnectionResolverFunc.PushReturn" href="#ResolverIndexConnectionResolverFunc.PushReturn">func (f *ResolverIndexConnectionResolverFunc) PushReturn(r0 *resolvers.IndexesResolver)</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverIndexConnectionResolverFunc) PushReturn(r0 *resolvers.IndexesResolver)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverIndexConnectionResolverFunc.SetDefaultHook" href="#ResolverIndexConnectionResolverFunc.SetDefaultHook">func (f *ResolverIndexConnectionResolverFunc) SetDefaultHook(hook func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver)</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverIndexConnectionResolverFunc) SetDefaultHook(hook func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver)
```

SetDefaultHook sets function that is called when the IndexConnectionResolver method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverIndexConnectionResolverFunc.SetDefaultReturn" href="#ResolverIndexConnectionResolverFunc.SetDefaultReturn">func (f *ResolverIndexConnectionResolverFunc) SetDefaultReturn(r0 *resolvers.IndexesResolver)</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverIndexConnectionResolverFunc) SetDefaultReturn(r0 *resolvers.IndexesResolver)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverIndexConnectionResolverFunc.appendCall" href="#ResolverIndexConnectionResolverFunc.appendCall">func (f *ResolverIndexConnectionResolverFunc) appendCall(r0 ResolverIndexConnectionResolverFuncCall)</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverIndexConnectionResolverFunc) appendCall(r0 ResolverIndexConnectionResolverFuncCall)
```

#### <a id="ResolverIndexConnectionResolverFunc.nextHook" href="#ResolverIndexConnectionResolverFunc.nextHook">func (f *ResolverIndexConnectionResolverFunc) nextHook() func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverIndexConnectionResolverFunc) nextHook() func(dbstore.GetIndexesOptions) *resolvers.IndexesResolver
```

### <a id="ResolverIndexConnectionResolverFuncCall" href="#ResolverIndexConnectionResolverFuncCall">type ResolverIndexConnectionResolverFuncCall struct</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFuncCall
tags: [struct]
```

```Go
type ResolverIndexConnectionResolverFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 dbstore.GetIndexesOptions
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *resolvers.IndexesResolver
}
```

ResolverIndexConnectionResolverFuncCall is an object that describes an invocation of method IndexConnectionResolver on an instance of MockResolver. 

#### <a id="ResolverIndexConnectionResolverFuncCall.Args" href="#ResolverIndexConnectionResolverFuncCall.Args">func (c ResolverIndexConnectionResolverFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFuncCall.Args
tags: [method]
```

```Go
func (c ResolverIndexConnectionResolverFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverIndexConnectionResolverFuncCall.Results" href="#ResolverIndexConnectionResolverFuncCall.Results">func (c ResolverIndexConnectionResolverFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverIndexConnectionResolverFuncCall.Results
tags: [method]
```

```Go
func (c ResolverIndexConnectionResolverFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverQueryResolverFunc" href="#ResolverQueryResolverFunc">type ResolverQueryResolverFunc struct</a>

```
searchKey: mocks.ResolverQueryResolverFunc
tags: [struct]
```

```Go
type ResolverQueryResolverFunc struct {
	defaultHook func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error)
	hooks       []func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error)
	history     []ResolverQueryResolverFuncCall
	mutex       sync.Mutex
}
```

ResolverQueryResolverFunc describes the behavior when the QueryResolver method of the parent MockResolver instance is invoked. 

#### <a id="ResolverQueryResolverFunc.History" href="#ResolverQueryResolverFunc.History">func (f *ResolverQueryResolverFunc) History() []ResolverQueryResolverFuncCall</a>

```
searchKey: mocks.ResolverQueryResolverFunc.History
tags: [method]
```

```Go
func (f *ResolverQueryResolverFunc) History() []ResolverQueryResolverFuncCall
```

History returns a sequence of ResolverQueryResolverFuncCall objects describing the invocations of this function. 

#### <a id="ResolverQueryResolverFunc.PushHook" href="#ResolverQueryResolverFunc.PushHook">func (f *ResolverQueryResolverFunc) PushHook(hook func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error))</a>

```
searchKey: mocks.ResolverQueryResolverFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverQueryResolverFunc) PushHook(hook func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the QueryResolver method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverQueryResolverFunc.PushReturn" href="#ResolverQueryResolverFunc.PushReturn">func (f *ResolverQueryResolverFunc) PushReturn(r0 resolvers.QueryResolver, r1 error)</a>

```
searchKey: mocks.ResolverQueryResolverFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverQueryResolverFunc) PushReturn(r0 resolvers.QueryResolver, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverQueryResolverFunc.SetDefaultHook" href="#ResolverQueryResolverFunc.SetDefaultHook">func (f *ResolverQueryResolverFunc) SetDefaultHook(hook func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error))</a>

```
searchKey: mocks.ResolverQueryResolverFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverQueryResolverFunc) SetDefaultHook(hook func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error))
```

SetDefaultHook sets function that is called when the QueryResolver method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverQueryResolverFunc.SetDefaultReturn" href="#ResolverQueryResolverFunc.SetDefaultReturn">func (f *ResolverQueryResolverFunc) SetDefaultReturn(r0 resolvers.QueryResolver, r1 error)</a>

```
searchKey: mocks.ResolverQueryResolverFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverQueryResolverFunc) SetDefaultReturn(r0 resolvers.QueryResolver, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverQueryResolverFunc.appendCall" href="#ResolverQueryResolverFunc.appendCall">func (f *ResolverQueryResolverFunc) appendCall(r0 ResolverQueryResolverFuncCall)</a>

```
searchKey: mocks.ResolverQueryResolverFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverQueryResolverFunc) appendCall(r0 ResolverQueryResolverFuncCall)
```

#### <a id="ResolverQueryResolverFunc.nextHook" href="#ResolverQueryResolverFunc.nextHook">func (f *ResolverQueryResolverFunc) nextHook() func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error)</a>

```
searchKey: mocks.ResolverQueryResolverFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverQueryResolverFunc) nextHook() func(context.Context, *graphqlbackend.GitBlobLSIFDataArgs) (resolvers.QueryResolver, error)
```

### <a id="ResolverQueryResolverFuncCall" href="#ResolverQueryResolverFuncCall">type ResolverQueryResolverFuncCall struct</a>

```
searchKey: mocks.ResolverQueryResolverFuncCall
tags: [struct]
```

```Go
type ResolverQueryResolverFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *graphqlbackend.GitBlobLSIFDataArgs
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 resolvers.QueryResolver
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

ResolverQueryResolverFuncCall is an object that describes an invocation of method QueryResolver on an instance of MockResolver. 

#### <a id="ResolverQueryResolverFuncCall.Args" href="#ResolverQueryResolverFuncCall.Args">func (c ResolverQueryResolverFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverQueryResolverFuncCall.Args
tags: [method]
```

```Go
func (c ResolverQueryResolverFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverQueryResolverFuncCall.Results" href="#ResolverQueryResolverFuncCall.Results">func (c ResolverQueryResolverFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverQueryResolverFuncCall.Results
tags: [method]
```

```Go
func (c ResolverQueryResolverFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverQueueAutoIndexJobForRepoFunc" href="#ResolverQueueAutoIndexJobForRepoFunc">type ResolverQueueAutoIndexJobForRepoFunc struct</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFunc
tags: [struct]
```

```Go
type ResolverQueueAutoIndexJobForRepoFunc struct {
	defaultHook func(context.Context, int) error
	hooks       []func(context.Context, int) error
	history     []ResolverQueueAutoIndexJobForRepoFuncCall
	mutex       sync.Mutex
}
```

ResolverQueueAutoIndexJobForRepoFunc describes the behavior when the QueueAutoIndexJobForRepo method of the parent MockResolver instance is invoked. 

#### <a id="ResolverQueueAutoIndexJobForRepoFunc.History" href="#ResolverQueueAutoIndexJobForRepoFunc.History">func (f *ResolverQueueAutoIndexJobForRepoFunc) History() []ResolverQueueAutoIndexJobForRepoFuncCall</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFunc.History
tags: [method]
```

```Go
func (f *ResolverQueueAutoIndexJobForRepoFunc) History() []ResolverQueueAutoIndexJobForRepoFuncCall
```

History returns a sequence of ResolverQueueAutoIndexJobForRepoFuncCall objects describing the invocations of this function. 

#### <a id="ResolverQueueAutoIndexJobForRepoFunc.PushHook" href="#ResolverQueueAutoIndexJobForRepoFunc.PushHook">func (f *ResolverQueueAutoIndexJobForRepoFunc) PushHook(hook func(context.Context, int) error)</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverQueueAutoIndexJobForRepoFunc) PushHook(hook func(context.Context, int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the QueueAutoIndexJobForRepo method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverQueueAutoIndexJobForRepoFunc.PushReturn" href="#ResolverQueueAutoIndexJobForRepoFunc.PushReturn">func (f *ResolverQueueAutoIndexJobForRepoFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverQueueAutoIndexJobForRepoFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverQueueAutoIndexJobForRepoFunc.SetDefaultHook" href="#ResolverQueueAutoIndexJobForRepoFunc.SetDefaultHook">func (f *ResolverQueueAutoIndexJobForRepoFunc) SetDefaultHook(hook func(context.Context, int) error)</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverQueueAutoIndexJobForRepoFunc) SetDefaultHook(hook func(context.Context, int) error)
```

SetDefaultHook sets function that is called when the QueueAutoIndexJobForRepo method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverQueueAutoIndexJobForRepoFunc.SetDefaultReturn" href="#ResolverQueueAutoIndexJobForRepoFunc.SetDefaultReturn">func (f *ResolverQueueAutoIndexJobForRepoFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverQueueAutoIndexJobForRepoFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverQueueAutoIndexJobForRepoFunc.appendCall" href="#ResolverQueueAutoIndexJobForRepoFunc.appendCall">func (f *ResolverQueueAutoIndexJobForRepoFunc) appendCall(r0 ResolverQueueAutoIndexJobForRepoFuncCall)</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverQueueAutoIndexJobForRepoFunc) appendCall(r0 ResolverQueueAutoIndexJobForRepoFuncCall)
```

#### <a id="ResolverQueueAutoIndexJobForRepoFunc.nextHook" href="#ResolverQueueAutoIndexJobForRepoFunc.nextHook">func (f *ResolverQueueAutoIndexJobForRepoFunc) nextHook() func(context.Context, int) error</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverQueueAutoIndexJobForRepoFunc) nextHook() func(context.Context, int) error
```

### <a id="ResolverQueueAutoIndexJobForRepoFuncCall" href="#ResolverQueueAutoIndexJobForRepoFuncCall">type ResolverQueueAutoIndexJobForRepoFuncCall struct</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFuncCall
tags: [struct]
```

```Go
type ResolverQueueAutoIndexJobForRepoFuncCall struct {
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

ResolverQueueAutoIndexJobForRepoFuncCall is an object that describes an invocation of method QueueAutoIndexJobForRepo on an instance of MockResolver. 

#### <a id="ResolverQueueAutoIndexJobForRepoFuncCall.Args" href="#ResolverQueueAutoIndexJobForRepoFuncCall.Args">func (c ResolverQueueAutoIndexJobForRepoFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFuncCall.Args
tags: [method]
```

```Go
func (c ResolverQueueAutoIndexJobForRepoFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverQueueAutoIndexJobForRepoFuncCall.Results" href="#ResolverQueueAutoIndexJobForRepoFuncCall.Results">func (c ResolverQueueAutoIndexJobForRepoFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverQueueAutoIndexJobForRepoFuncCall.Results
tags: [method]
```

```Go
func (c ResolverQueueAutoIndexJobForRepoFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFunc" href="#ResolverUpdateIndexConfigurationByRepositoryIDFunc">type ResolverUpdateIndexConfigurationByRepositoryIDFunc struct</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFunc
tags: [struct]
```

```Go
type ResolverUpdateIndexConfigurationByRepositoryIDFunc struct {
	defaultHook func(context.Context, int, string) error
	hooks       []func(context.Context, int, string) error
	history     []ResolverUpdateIndexConfigurationByRepositoryIDFuncCall
	mutex       sync.Mutex
}
```

ResolverUpdateIndexConfigurationByRepositoryIDFunc describes the behavior when the UpdateIndexConfigurationByRepositoryID method of the parent MockResolver instance is invoked. 

#### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFunc.History" href="#ResolverUpdateIndexConfigurationByRepositoryIDFunc.History">func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) History() []ResolverUpdateIndexConfigurationByRepositoryIDFuncCall</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFunc.History
tags: [method]
```

```Go
func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) History() []ResolverUpdateIndexConfigurationByRepositoryIDFuncCall
```

History returns a sequence of ResolverUpdateIndexConfigurationByRepositoryIDFuncCall objects describing the invocations of this function. 

#### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFunc.PushHook" href="#ResolverUpdateIndexConfigurationByRepositoryIDFunc.PushHook">func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int, string) error)</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int, string) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the UpdateIndexConfigurationByRepositoryID method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFunc.PushReturn" href="#ResolverUpdateIndexConfigurationByRepositoryIDFunc.PushReturn">func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultHook" href="#ResolverUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultHook">func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int, string) error)</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int, string) error)
```

SetDefaultHook sets function that is called when the UpdateIndexConfigurationByRepositoryID method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultReturn" href="#ResolverUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultReturn">func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFunc.appendCall" href="#ResolverUpdateIndexConfigurationByRepositoryIDFunc.appendCall">func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) appendCall(r0 ResolverUpdateIndexConfigurationByRepositoryIDFuncCall)</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) appendCall(r0 ResolverUpdateIndexConfigurationByRepositoryIDFuncCall)
```

#### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFunc.nextHook" href="#ResolverUpdateIndexConfigurationByRepositoryIDFunc.nextHook">func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int, string) error</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverUpdateIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int, string) error
```

### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFuncCall" href="#ResolverUpdateIndexConfigurationByRepositoryIDFuncCall">type ResolverUpdateIndexConfigurationByRepositoryIDFuncCall struct</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFuncCall
tags: [struct]
```

```Go
type ResolverUpdateIndexConfigurationByRepositoryIDFuncCall struct {
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
	Result0 error
}
```

ResolverUpdateIndexConfigurationByRepositoryIDFuncCall is an object that describes an invocation of method UpdateIndexConfigurationByRepositoryID on an instance of MockResolver. 

#### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFuncCall.Args" href="#ResolverUpdateIndexConfigurationByRepositoryIDFuncCall.Args">func (c ResolverUpdateIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFuncCall.Args
tags: [method]
```

```Go
func (c ResolverUpdateIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverUpdateIndexConfigurationByRepositoryIDFuncCall.Results" href="#ResolverUpdateIndexConfigurationByRepositoryIDFuncCall.Results">func (c ResolverUpdateIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverUpdateIndexConfigurationByRepositoryIDFuncCall.Results
tags: [method]
```

```Go
func (c ResolverUpdateIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="ResolverUploadConnectionResolverFunc" href="#ResolverUploadConnectionResolverFunc">type ResolverUploadConnectionResolverFunc struct</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFunc
tags: [struct]
```

```Go
type ResolverUploadConnectionResolverFunc struct {
	defaultHook func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver
	hooks       []func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver
	history     []ResolverUploadConnectionResolverFuncCall
	mutex       sync.Mutex
}
```

ResolverUploadConnectionResolverFunc describes the behavior when the UploadConnectionResolver method of the parent MockResolver instance is invoked. 

#### <a id="ResolverUploadConnectionResolverFunc.History" href="#ResolverUploadConnectionResolverFunc.History">func (f *ResolverUploadConnectionResolverFunc) History() []ResolverUploadConnectionResolverFuncCall</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFunc.History
tags: [method]
```

```Go
func (f *ResolverUploadConnectionResolverFunc) History() []ResolverUploadConnectionResolverFuncCall
```

History returns a sequence of ResolverUploadConnectionResolverFuncCall objects describing the invocations of this function. 

#### <a id="ResolverUploadConnectionResolverFunc.PushHook" href="#ResolverUploadConnectionResolverFunc.PushHook">func (f *ResolverUploadConnectionResolverFunc) PushHook(hook func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver)</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFunc.PushHook
tags: [method]
```

```Go
func (f *ResolverUploadConnectionResolverFunc) PushHook(hook func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver)
```

PushHook adds a function to the end of hook queue. Each invocation of the UploadConnectionResolver method of the parent MockResolver instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ResolverUploadConnectionResolverFunc.PushReturn" href="#ResolverUploadConnectionResolverFunc.PushReturn">func (f *ResolverUploadConnectionResolverFunc) PushReturn(r0 *resolvers.UploadsResolver)</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFunc.PushReturn
tags: [method]
```

```Go
func (f *ResolverUploadConnectionResolverFunc) PushReturn(r0 *resolvers.UploadsResolver)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ResolverUploadConnectionResolverFunc.SetDefaultHook" href="#ResolverUploadConnectionResolverFunc.SetDefaultHook">func (f *ResolverUploadConnectionResolverFunc) SetDefaultHook(hook func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver)</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *ResolverUploadConnectionResolverFunc) SetDefaultHook(hook func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver)
```

SetDefaultHook sets function that is called when the UploadConnectionResolver method of the parent MockResolver instance is invoked and the hook queue is empty. 

#### <a id="ResolverUploadConnectionResolverFunc.SetDefaultReturn" href="#ResolverUploadConnectionResolverFunc.SetDefaultReturn">func (f *ResolverUploadConnectionResolverFunc) SetDefaultReturn(r0 *resolvers.UploadsResolver)</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *ResolverUploadConnectionResolverFunc) SetDefaultReturn(r0 *resolvers.UploadsResolver)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ResolverUploadConnectionResolverFunc.appendCall" href="#ResolverUploadConnectionResolverFunc.appendCall">func (f *ResolverUploadConnectionResolverFunc) appendCall(r0 ResolverUploadConnectionResolverFuncCall)</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFunc.appendCall
tags: [method private]
```

```Go
func (f *ResolverUploadConnectionResolverFunc) appendCall(r0 ResolverUploadConnectionResolverFuncCall)
```

#### <a id="ResolverUploadConnectionResolverFunc.nextHook" href="#ResolverUploadConnectionResolverFunc.nextHook">func (f *ResolverUploadConnectionResolverFunc) nextHook() func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFunc.nextHook
tags: [method private]
```

```Go
func (f *ResolverUploadConnectionResolverFunc) nextHook() func(dbstore.GetUploadsOptions) *resolvers.UploadsResolver
```

### <a id="ResolverUploadConnectionResolverFuncCall" href="#ResolverUploadConnectionResolverFuncCall">type ResolverUploadConnectionResolverFuncCall struct</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFuncCall
tags: [struct]
```

```Go
type ResolverUploadConnectionResolverFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 dbstore.GetUploadsOptions
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *resolvers.UploadsResolver
}
```

ResolverUploadConnectionResolverFuncCall is an object that describes an invocation of method UploadConnectionResolver on an instance of MockResolver. 

#### <a id="ResolverUploadConnectionResolverFuncCall.Args" href="#ResolverUploadConnectionResolverFuncCall.Args">func (c ResolverUploadConnectionResolverFuncCall) Args() []interface{}</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFuncCall.Args
tags: [method]
```

```Go
func (c ResolverUploadConnectionResolverFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ResolverUploadConnectionResolverFuncCall.Results" href="#ResolverUploadConnectionResolverFuncCall.Results">func (c ResolverUploadConnectionResolverFuncCall) Results() []interface{}</a>

```
searchKey: mocks.ResolverUploadConnectionResolverFuncCall.Results
tags: [method]
```

```Go
func (c ResolverUploadConnectionResolverFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

