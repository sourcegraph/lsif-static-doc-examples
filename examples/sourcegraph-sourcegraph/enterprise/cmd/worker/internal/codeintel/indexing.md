# Package indexing

## Index

* [Constants](#const)
    * [const defaultRepositoriesQueuedPerSecond](#defaultRepositoriesQueuedPerSecond)
* [Variables](#var)
    * [var dependencyIndexingRepositoryIDs](#dependencyIndexingRepositoryIDs)
    * [var indexSchedulerEnabled](#indexSchedulerEnabled)
    * [var enabledRepoGroupNames](#enabledRepoGroupNames)
    * [var singletonOperations](#singletonOperations)
    * [var once](#once)
* [Types](#type)
    * [type dependencyIndexingSchedulerHandler struct](#dependencyIndexingSchedulerHandler)
        * [func (h *dependencyIndexingSchedulerHandler) Handle(ctx context.Context, tx dbworkerstore.Store, record workerutil.Record) error](#dependencyIndexingSchedulerHandler.Handle)
        * [func (h *dependencyIndexingSchedulerHandler) shouldIndexDependencies(ctx context.Context, store DBStore, uploadID int) (bool, error)](#dependencyIndexingSchedulerHandler.shouldIndexDependencies)
    * [type DBStore interface](#DBStore)
    * [type DBStoreShim struct](#DBStoreShim)
        * [func (s *DBStoreShim) With(other basestore.ShareableStore) DBStore](#DBStoreShim.With)
    * [type IndexingSettingStore interface](#IndexingSettingStore)
    * [type IndexingRepoStore interface](#IndexingRepoStore)
    * [type GitserverClient interface](#GitserverClient)
    * [type IndexEnqueuer interface](#IndexEnqueuer)
    * [type IndexScheduler struct](#IndexScheduler)
        * [func (s *IndexScheduler) Handle(ctx context.Context) error](#IndexScheduler.Handle)
        * [func (s *IndexScheduler) HandleError(err error)](#IndexScheduler.HandleError)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
    * [type MockDBStore struct](#MockDBStore)
        * [func NewMockDBStore() *MockDBStore](#NewMockDBStore)
        * [func NewMockDBStoreFrom(i DBStore) *MockDBStore](#NewMockDBStoreFrom)
        * [func (m *MockDBStore) GetAutoindexDisabledRepositories(v0 context.Context) ([]int, error)](#MockDBStore.GetAutoindexDisabledRepositories)
        * [func (m *MockDBStore) GetRepositoriesWithIndexConfiguration(v0 context.Context) ([]int, error)](#MockDBStore.GetRepositoriesWithIndexConfiguration)
        * [func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)](#MockDBStore.GetUploadByID)
        * [func (m *MockDBStore) GetUploads(v0 context.Context, v1 dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)](#MockDBStore.GetUploads)
        * [func (m *MockDBStore) ReferencesForUpload(v0 context.Context, v1 int) (dbstore.PackageReferenceScanner, error)](#MockDBStore.ReferencesForUpload)
        * [func (m *MockDBStore) With(v0 basestore.ShareableStore) DBStore](#MockDBStore.With)
    * [type DBStoreGetAutoindexDisabledRepositoriesFunc struct](#DBStoreGetAutoindexDisabledRepositoriesFunc)
        * [func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) SetDefaultHook(hook func(context.Context) ([]int, error))](#DBStoreGetAutoindexDisabledRepositoriesFunc.SetDefaultHook)
        * [func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) PushHook(hook func(context.Context) ([]int, error))](#DBStoreGetAutoindexDisabledRepositoriesFunc.PushHook)
        * [func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) SetDefaultReturn(r0 []int, r1 error)](#DBStoreGetAutoindexDisabledRepositoriesFunc.SetDefaultReturn)
        * [func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) PushReturn(r0 []int, r1 error)](#DBStoreGetAutoindexDisabledRepositoriesFunc.PushReturn)
        * [func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) nextHook() func(context.Context) ([]int, error)](#DBStoreGetAutoindexDisabledRepositoriesFunc.nextHook)
        * [func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) appendCall(r0 DBStoreGetAutoindexDisabledRepositoriesFuncCall)](#DBStoreGetAutoindexDisabledRepositoriesFunc.appendCall)
        * [func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) History() []DBStoreGetAutoindexDisabledRepositoriesFuncCall](#DBStoreGetAutoindexDisabledRepositoriesFunc.History)
    * [type DBStoreGetAutoindexDisabledRepositoriesFuncCall struct](#DBStoreGetAutoindexDisabledRepositoriesFuncCall)
        * [func (c DBStoreGetAutoindexDisabledRepositoriesFuncCall) Args() []interface{}](#DBStoreGetAutoindexDisabledRepositoriesFuncCall.Args)
        * [func (c DBStoreGetAutoindexDisabledRepositoriesFuncCall) Results() []interface{}](#DBStoreGetAutoindexDisabledRepositoriesFuncCall.Results)
    * [type DBStoreGetRepositoriesWithIndexConfigurationFunc struct](#DBStoreGetRepositoriesWithIndexConfigurationFunc)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultHook(hook func(context.Context) ([]int, error))](#DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushHook(hook func(context.Context) ([]int, error))](#DBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultReturn(r0 []int, r1 error)](#DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushReturn(r0 []int, r1 error)](#DBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) nextHook() func(context.Context) ([]int, error)](#DBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) appendCall(r0 DBStoreGetRepositoriesWithIndexConfigurationFuncCall)](#DBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) History() []DBStoreGetRepositoriesWithIndexConfigurationFuncCall](#DBStoreGetRepositoriesWithIndexConfigurationFunc.History)
    * [type DBStoreGetRepositoriesWithIndexConfigurationFuncCall struct](#DBStoreGetRepositoriesWithIndexConfigurationFuncCall)
        * [func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Args() []interface{}](#DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args)
        * [func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Results() []interface{}](#DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results)
    * [type DBStoreGetUploadByIDFunc struct](#DBStoreGetUploadByIDFunc)
        * [func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#DBStoreGetUploadByIDFunc.SetDefaultHook)
        * [func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#DBStoreGetUploadByIDFunc.PushHook)
        * [func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)](#DBStoreGetUploadByIDFunc.SetDefaultReturn)
        * [func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)](#DBStoreGetUploadByIDFunc.PushReturn)
        * [func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)](#DBStoreGetUploadByIDFunc.nextHook)
        * [func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)](#DBStoreGetUploadByIDFunc.appendCall)
        * [func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall](#DBStoreGetUploadByIDFunc.History)
    * [type DBStoreGetUploadByIDFuncCall struct](#DBStoreGetUploadByIDFuncCall)
        * [func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}](#DBStoreGetUploadByIDFuncCall.Args)
        * [func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}](#DBStoreGetUploadByIDFuncCall.Results)
    * [type DBStoreGetUploadsFunc struct](#DBStoreGetUploadsFunc)
        * [func (f *DBStoreGetUploadsFunc) SetDefaultHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))](#DBStoreGetUploadsFunc.SetDefaultHook)
        * [func (f *DBStoreGetUploadsFunc) PushHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))](#DBStoreGetUploadsFunc.PushHook)
        * [func (f *DBStoreGetUploadsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 int, r2 error)](#DBStoreGetUploadsFunc.SetDefaultReturn)
        * [func (f *DBStoreGetUploadsFunc) PushReturn(r0 []dbstore.Upload, r1 int, r2 error)](#DBStoreGetUploadsFunc.PushReturn)
        * [func (f *DBStoreGetUploadsFunc) nextHook() func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)](#DBStoreGetUploadsFunc.nextHook)
        * [func (f *DBStoreGetUploadsFunc) appendCall(r0 DBStoreGetUploadsFuncCall)](#DBStoreGetUploadsFunc.appendCall)
        * [func (f *DBStoreGetUploadsFunc) History() []DBStoreGetUploadsFuncCall](#DBStoreGetUploadsFunc.History)
    * [type DBStoreGetUploadsFuncCall struct](#DBStoreGetUploadsFuncCall)
        * [func (c DBStoreGetUploadsFuncCall) Args() []interface{}](#DBStoreGetUploadsFuncCall.Args)
        * [func (c DBStoreGetUploadsFuncCall) Results() []interface{}](#DBStoreGetUploadsFuncCall.Results)
    * [type DBStoreReferencesForUploadFunc struct](#DBStoreReferencesForUploadFunc)
        * [func (f *DBStoreReferencesForUploadFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.PackageReferenceScanner, error))](#DBStoreReferencesForUploadFunc.SetDefaultHook)
        * [func (f *DBStoreReferencesForUploadFunc) PushHook(hook func(context.Context, int) (dbstore.PackageReferenceScanner, error))](#DBStoreReferencesForUploadFunc.PushHook)
        * [func (f *DBStoreReferencesForUploadFunc) SetDefaultReturn(r0 dbstore.PackageReferenceScanner, r1 error)](#DBStoreReferencesForUploadFunc.SetDefaultReturn)
        * [func (f *DBStoreReferencesForUploadFunc) PushReturn(r0 dbstore.PackageReferenceScanner, r1 error)](#DBStoreReferencesForUploadFunc.PushReturn)
        * [func (f *DBStoreReferencesForUploadFunc) nextHook() func(context.Context, int) (dbstore.PackageReferenceScanner, error)](#DBStoreReferencesForUploadFunc.nextHook)
        * [func (f *DBStoreReferencesForUploadFunc) appendCall(r0 DBStoreReferencesForUploadFuncCall)](#DBStoreReferencesForUploadFunc.appendCall)
        * [func (f *DBStoreReferencesForUploadFunc) History() []DBStoreReferencesForUploadFuncCall](#DBStoreReferencesForUploadFunc.History)
    * [type DBStoreReferencesForUploadFuncCall struct](#DBStoreReferencesForUploadFuncCall)
        * [func (c DBStoreReferencesForUploadFuncCall) Args() []interface{}](#DBStoreReferencesForUploadFuncCall.Args)
        * [func (c DBStoreReferencesForUploadFuncCall) Results() []interface{}](#DBStoreReferencesForUploadFuncCall.Results)
    * [type DBStoreWithFunc struct](#DBStoreWithFunc)
        * [func (f *DBStoreWithFunc) SetDefaultHook(hook func(basestore.ShareableStore) DBStore)](#DBStoreWithFunc.SetDefaultHook)
        * [func (f *DBStoreWithFunc) PushHook(hook func(basestore.ShareableStore) DBStore)](#DBStoreWithFunc.PushHook)
        * [func (f *DBStoreWithFunc) SetDefaultReturn(r0 DBStore)](#DBStoreWithFunc.SetDefaultReturn)
        * [func (f *DBStoreWithFunc) PushReturn(r0 DBStore)](#DBStoreWithFunc.PushReturn)
        * [func (f *DBStoreWithFunc) nextHook() func(basestore.ShareableStore) DBStore](#DBStoreWithFunc.nextHook)
        * [func (f *DBStoreWithFunc) appendCall(r0 DBStoreWithFuncCall)](#DBStoreWithFunc.appendCall)
        * [func (f *DBStoreWithFunc) History() []DBStoreWithFuncCall](#DBStoreWithFunc.History)
    * [type DBStoreWithFuncCall struct](#DBStoreWithFuncCall)
        * [func (c DBStoreWithFuncCall) Args() []interface{}](#DBStoreWithFuncCall.Args)
        * [func (c DBStoreWithFuncCall) Results() []interface{}](#DBStoreWithFuncCall.Results)
    * [type MockGitserverClient struct](#MockGitserverClient)
        * [func NewMockGitserverClient() *MockGitserverClient](#NewMockGitserverClient)
        * [func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient](#NewMockGitserverClientFrom)
        * [func (m *MockGitserverClient) FileExists(v0 context.Context, v1 int, v2 string, v3 string) (bool, error)](#MockGitserverClient.FileExists)
        * [func (m *MockGitserverClient) Head(v0 context.Context, v1 int) (string, error)](#MockGitserverClient.Head)
        * [func (m *MockGitserverClient) ListFiles(v0 context.Context, v1 int, v2 string, v3 *regexp.Regexp) ([]string, error)](#MockGitserverClient.ListFiles)
        * [func (m *MockGitserverClient) RawContents(v0 context.Context, v1 int, v2 string, v3 string) ([]byte, error)](#MockGitserverClient.RawContents)
        * [func (m *MockGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)](#MockGitserverClient.ResolveRevision)
    * [type GitserverClientFileExistsFunc struct](#GitserverClientFileExistsFunc)
        * [func (f *GitserverClientFileExistsFunc) SetDefaultHook(hook func(context.Context, int, string, string) (bool, error))](#GitserverClientFileExistsFunc.SetDefaultHook)
        * [func (f *GitserverClientFileExistsFunc) PushHook(hook func(context.Context, int, string, string) (bool, error))](#GitserverClientFileExistsFunc.PushHook)
        * [func (f *GitserverClientFileExistsFunc) SetDefaultReturn(r0 bool, r1 error)](#GitserverClientFileExistsFunc.SetDefaultReturn)
        * [func (f *GitserverClientFileExistsFunc) PushReturn(r0 bool, r1 error)](#GitserverClientFileExistsFunc.PushReturn)
        * [func (f *GitserverClientFileExistsFunc) nextHook() func(context.Context, int, string, string) (bool, error)](#GitserverClientFileExistsFunc.nextHook)
        * [func (f *GitserverClientFileExistsFunc) appendCall(r0 GitserverClientFileExistsFuncCall)](#GitserverClientFileExistsFunc.appendCall)
        * [func (f *GitserverClientFileExistsFunc) History() []GitserverClientFileExistsFuncCall](#GitserverClientFileExistsFunc.History)
    * [type GitserverClientFileExistsFuncCall struct](#GitserverClientFileExistsFuncCall)
        * [func (c GitserverClientFileExistsFuncCall) Args() []interface{}](#GitserverClientFileExistsFuncCall.Args)
        * [func (c GitserverClientFileExistsFuncCall) Results() []interface{}](#GitserverClientFileExistsFuncCall.Results)
    * [type GitserverClientHeadFunc struct](#GitserverClientHeadFunc)
        * [func (f *GitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))](#GitserverClientHeadFunc.SetDefaultHook)
        * [func (f *GitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))](#GitserverClientHeadFunc.PushHook)
        * [func (f *GitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)](#GitserverClientHeadFunc.SetDefaultReturn)
        * [func (f *GitserverClientHeadFunc) PushReturn(r0 string, r1 error)](#GitserverClientHeadFunc.PushReturn)
        * [func (f *GitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)](#GitserverClientHeadFunc.nextHook)
        * [func (f *GitserverClientHeadFunc) appendCall(r0 GitserverClientHeadFuncCall)](#GitserverClientHeadFunc.appendCall)
        * [func (f *GitserverClientHeadFunc) History() []GitserverClientHeadFuncCall](#GitserverClientHeadFunc.History)
    * [type GitserverClientHeadFuncCall struct](#GitserverClientHeadFuncCall)
        * [func (c GitserverClientHeadFuncCall) Args() []interface{}](#GitserverClientHeadFuncCall.Args)
        * [func (c GitserverClientHeadFuncCall) Results() []interface{}](#GitserverClientHeadFuncCall.Results)
    * [type GitserverClientListFilesFunc struct](#GitserverClientListFilesFunc)
        * [func (f *GitserverClientListFilesFunc) SetDefaultHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))](#GitserverClientListFilesFunc.SetDefaultHook)
        * [func (f *GitserverClientListFilesFunc) PushHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))](#GitserverClientListFilesFunc.PushHook)
        * [func (f *GitserverClientListFilesFunc) SetDefaultReturn(r0 []string, r1 error)](#GitserverClientListFilesFunc.SetDefaultReturn)
        * [func (f *GitserverClientListFilesFunc) PushReturn(r0 []string, r1 error)](#GitserverClientListFilesFunc.PushReturn)
        * [func (f *GitserverClientListFilesFunc) nextHook() func(context.Context, int, string, *regexp.Regexp) ([]string, error)](#GitserverClientListFilesFunc.nextHook)
        * [func (f *GitserverClientListFilesFunc) appendCall(r0 GitserverClientListFilesFuncCall)](#GitserverClientListFilesFunc.appendCall)
        * [func (f *GitserverClientListFilesFunc) History() []GitserverClientListFilesFuncCall](#GitserverClientListFilesFunc.History)
    * [type GitserverClientListFilesFuncCall struct](#GitserverClientListFilesFuncCall)
        * [func (c GitserverClientListFilesFuncCall) Args() []interface{}](#GitserverClientListFilesFuncCall.Args)
        * [func (c GitserverClientListFilesFuncCall) Results() []interface{}](#GitserverClientListFilesFuncCall.Results)
    * [type GitserverClientRawContentsFunc struct](#GitserverClientRawContentsFunc)
        * [func (f *GitserverClientRawContentsFunc) SetDefaultHook(hook func(context.Context, int, string, string) ([]byte, error))](#GitserverClientRawContentsFunc.SetDefaultHook)
        * [func (f *GitserverClientRawContentsFunc) PushHook(hook func(context.Context, int, string, string) ([]byte, error))](#GitserverClientRawContentsFunc.PushHook)
        * [func (f *GitserverClientRawContentsFunc) SetDefaultReturn(r0 []byte, r1 error)](#GitserverClientRawContentsFunc.SetDefaultReturn)
        * [func (f *GitserverClientRawContentsFunc) PushReturn(r0 []byte, r1 error)](#GitserverClientRawContentsFunc.PushReturn)
        * [func (f *GitserverClientRawContentsFunc) nextHook() func(context.Context, int, string, string) ([]byte, error)](#GitserverClientRawContentsFunc.nextHook)
        * [func (f *GitserverClientRawContentsFunc) appendCall(r0 GitserverClientRawContentsFuncCall)](#GitserverClientRawContentsFunc.appendCall)
        * [func (f *GitserverClientRawContentsFunc) History() []GitserverClientRawContentsFuncCall](#GitserverClientRawContentsFunc.History)
    * [type GitserverClientRawContentsFuncCall struct](#GitserverClientRawContentsFuncCall)
        * [func (c GitserverClientRawContentsFuncCall) Args() []interface{}](#GitserverClientRawContentsFuncCall.Args)
        * [func (c GitserverClientRawContentsFuncCall) Results() []interface{}](#GitserverClientRawContentsFuncCall.Results)
    * [type GitserverClientResolveRevisionFunc struct](#GitserverClientResolveRevisionFunc)
        * [func (f *GitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))](#GitserverClientResolveRevisionFunc.SetDefaultHook)
        * [func (f *GitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))](#GitserverClientResolveRevisionFunc.PushHook)
        * [func (f *GitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)](#GitserverClientResolveRevisionFunc.SetDefaultReturn)
        * [func (f *GitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)](#GitserverClientResolveRevisionFunc.PushReturn)
        * [func (f *GitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)](#GitserverClientResolveRevisionFunc.nextHook)
        * [func (f *GitserverClientResolveRevisionFunc) appendCall(r0 GitserverClientResolveRevisionFuncCall)](#GitserverClientResolveRevisionFunc.appendCall)
        * [func (f *GitserverClientResolveRevisionFunc) History() []GitserverClientResolveRevisionFuncCall](#GitserverClientResolveRevisionFunc.History)
    * [type GitserverClientResolveRevisionFuncCall struct](#GitserverClientResolveRevisionFuncCall)
        * [func (c GitserverClientResolveRevisionFuncCall) Args() []interface{}](#GitserverClientResolveRevisionFuncCall.Args)
        * [func (c GitserverClientResolveRevisionFuncCall) Results() []interface{}](#GitserverClientResolveRevisionFuncCall.Results)
    * [type MockIndexEnqueuer struct](#MockIndexEnqueuer)
        * [func NewMockIndexEnqueuer() *MockIndexEnqueuer](#NewMockIndexEnqueuer)
        * [func NewMockIndexEnqueuerFrom(i IndexEnqueuer) *MockIndexEnqueuer](#NewMockIndexEnqueuerFrom)
        * [func (m *MockIndexEnqueuer) QueueIndexesForPackage(v0 context.Context, v1 semantic.Package) error](#MockIndexEnqueuer.QueueIndexesForPackage)
        * [func (m *MockIndexEnqueuer) QueueIndexesForRepository(v0 context.Context, v1 int) error](#MockIndexEnqueuer.QueueIndexesForRepository)
    * [type IndexEnqueuerQueueIndexesForPackageFunc struct](#IndexEnqueuerQueueIndexesForPackageFunc)
        * [func (f *IndexEnqueuerQueueIndexesForPackageFunc) SetDefaultHook(hook func(context.Context, semantic.Package) error)](#IndexEnqueuerQueueIndexesForPackageFunc.SetDefaultHook)
        * [func (f *IndexEnqueuerQueueIndexesForPackageFunc) PushHook(hook func(context.Context, semantic.Package) error)](#IndexEnqueuerQueueIndexesForPackageFunc.PushHook)
        * [func (f *IndexEnqueuerQueueIndexesForPackageFunc) SetDefaultReturn(r0 error)](#IndexEnqueuerQueueIndexesForPackageFunc.SetDefaultReturn)
        * [func (f *IndexEnqueuerQueueIndexesForPackageFunc) PushReturn(r0 error)](#IndexEnqueuerQueueIndexesForPackageFunc.PushReturn)
        * [func (f *IndexEnqueuerQueueIndexesForPackageFunc) nextHook() func(context.Context, semantic.Package) error](#IndexEnqueuerQueueIndexesForPackageFunc.nextHook)
        * [func (f *IndexEnqueuerQueueIndexesForPackageFunc) appendCall(r0 IndexEnqueuerQueueIndexesForPackageFuncCall)](#IndexEnqueuerQueueIndexesForPackageFunc.appendCall)
        * [func (f *IndexEnqueuerQueueIndexesForPackageFunc) History() []IndexEnqueuerQueueIndexesForPackageFuncCall](#IndexEnqueuerQueueIndexesForPackageFunc.History)
    * [type IndexEnqueuerQueueIndexesForPackageFuncCall struct](#IndexEnqueuerQueueIndexesForPackageFuncCall)
        * [func (c IndexEnqueuerQueueIndexesForPackageFuncCall) Args() []interface{}](#IndexEnqueuerQueueIndexesForPackageFuncCall.Args)
        * [func (c IndexEnqueuerQueueIndexesForPackageFuncCall) Results() []interface{}](#IndexEnqueuerQueueIndexesForPackageFuncCall.Results)
    * [type IndexEnqueuerQueueIndexesForRepositoryFunc struct](#IndexEnqueuerQueueIndexesForRepositoryFunc)
        * [func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) SetDefaultHook(hook func(context.Context, int) error)](#IndexEnqueuerQueueIndexesForRepositoryFunc.SetDefaultHook)
        * [func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) PushHook(hook func(context.Context, int) error)](#IndexEnqueuerQueueIndexesForRepositoryFunc.PushHook)
        * [func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) SetDefaultReturn(r0 error)](#IndexEnqueuerQueueIndexesForRepositoryFunc.SetDefaultReturn)
        * [func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) PushReturn(r0 error)](#IndexEnqueuerQueueIndexesForRepositoryFunc.PushReturn)
        * [func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) nextHook() func(context.Context, int) error](#IndexEnqueuerQueueIndexesForRepositoryFunc.nextHook)
        * [func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) appendCall(r0 IndexEnqueuerQueueIndexesForRepositoryFuncCall)](#IndexEnqueuerQueueIndexesForRepositoryFunc.appendCall)
        * [func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) History() []IndexEnqueuerQueueIndexesForRepositoryFuncCall](#IndexEnqueuerQueueIndexesForRepositoryFunc.History)
    * [type IndexEnqueuerQueueIndexesForRepositoryFuncCall struct](#IndexEnqueuerQueueIndexesForRepositoryFuncCall)
        * [func (c IndexEnqueuerQueueIndexesForRepositoryFuncCall) Args() []interface{}](#IndexEnqueuerQueueIndexesForRepositoryFuncCall.Args)
        * [func (c IndexEnqueuerQueueIndexesForRepositoryFuncCall) Results() []interface{}](#IndexEnqueuerQueueIndexesForRepositoryFuncCall.Results)
    * [type MockIndexingRepoStore struct](#MockIndexingRepoStore)
        * [func NewMockIndexingRepoStore() *MockIndexingRepoStore](#NewMockIndexingRepoStore)
        * [func NewMockIndexingRepoStoreFrom(i IndexingRepoStore) *MockIndexingRepoStore](#NewMockIndexingRepoStoreFrom)
        * [func (m *MockIndexingRepoStore) ListRepoNames(v0 context.Context, v1 database.ReposListOptions) ([]types.RepoName, error)](#MockIndexingRepoStore.ListRepoNames)
    * [type IndexingRepoStoreListRepoNamesFunc struct](#IndexingRepoStoreListRepoNamesFunc)
        * [func (f *IndexingRepoStoreListRepoNamesFunc) SetDefaultHook(hook func(context.Context, database.ReposListOptions) ([]types.RepoName, error))](#IndexingRepoStoreListRepoNamesFunc.SetDefaultHook)
        * [func (f *IndexingRepoStoreListRepoNamesFunc) PushHook(hook func(context.Context, database.ReposListOptions) ([]types.RepoName, error))](#IndexingRepoStoreListRepoNamesFunc.PushHook)
        * [func (f *IndexingRepoStoreListRepoNamesFunc) SetDefaultReturn(r0 []types.RepoName, r1 error)](#IndexingRepoStoreListRepoNamesFunc.SetDefaultReturn)
        * [func (f *IndexingRepoStoreListRepoNamesFunc) PushReturn(r0 []types.RepoName, r1 error)](#IndexingRepoStoreListRepoNamesFunc.PushReturn)
        * [func (f *IndexingRepoStoreListRepoNamesFunc) nextHook() func(context.Context, database.ReposListOptions) ([]types.RepoName, error)](#IndexingRepoStoreListRepoNamesFunc.nextHook)
        * [func (f *IndexingRepoStoreListRepoNamesFunc) appendCall(r0 IndexingRepoStoreListRepoNamesFuncCall)](#IndexingRepoStoreListRepoNamesFunc.appendCall)
        * [func (f *IndexingRepoStoreListRepoNamesFunc) History() []IndexingRepoStoreListRepoNamesFuncCall](#IndexingRepoStoreListRepoNamesFunc.History)
    * [type IndexingRepoStoreListRepoNamesFuncCall struct](#IndexingRepoStoreListRepoNamesFuncCall)
        * [func (c IndexingRepoStoreListRepoNamesFuncCall) Args() []interface{}](#IndexingRepoStoreListRepoNamesFuncCall.Args)
        * [func (c IndexingRepoStoreListRepoNamesFuncCall) Results() []interface{}](#IndexingRepoStoreListRepoNamesFuncCall.Results)
    * [type MockIndexingSettingStore struct](#MockIndexingSettingStore)
        * [func NewMockIndexingSettingStore() *MockIndexingSettingStore](#NewMockIndexingSettingStore)
        * [func NewMockIndexingSettingStoreFrom(i IndexingSettingStore) *MockIndexingSettingStore](#NewMockIndexingSettingStoreFrom)
        * [func (m *MockIndexingSettingStore) GetLastestSchemaSettings(v0 context.Context, v1 api.SettingsSubject) (*schema.Settings, error)](#MockIndexingSettingStore.GetLastestSchemaSettings)
    * [type IndexingSettingStoreGetLastestSchemaSettingsFunc struct](#IndexingSettingStoreGetLastestSchemaSettingsFunc)
        * [func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) SetDefaultHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))](#IndexingSettingStoreGetLastestSchemaSettingsFunc.SetDefaultHook)
        * [func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) PushHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))](#IndexingSettingStoreGetLastestSchemaSettingsFunc.PushHook)
        * [func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) SetDefaultReturn(r0 *schema.Settings, r1 error)](#IndexingSettingStoreGetLastestSchemaSettingsFunc.SetDefaultReturn)
        * [func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) PushReturn(r0 *schema.Settings, r1 error)](#IndexingSettingStoreGetLastestSchemaSettingsFunc.PushReturn)
        * [func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) nextHook() func(context.Context, api.SettingsSubject) (*schema.Settings, error)](#IndexingSettingStoreGetLastestSchemaSettingsFunc.nextHook)
        * [func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) appendCall(r0 IndexingSettingStoreGetLastestSchemaSettingsFuncCall)](#IndexingSettingStoreGetLastestSchemaSettingsFunc.appendCall)
        * [func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) History() []IndexingSettingStoreGetLastestSchemaSettingsFuncCall](#IndexingSettingStoreGetLastestSchemaSettingsFunc.History)
    * [type IndexingSettingStoreGetLastestSchemaSettingsFuncCall struct](#IndexingSettingStoreGetLastestSchemaSettingsFuncCall)
        * [func (c IndexingSettingStoreGetLastestSchemaSettingsFuncCall) Args() []interface{}](#IndexingSettingStoreGetLastestSchemaSettingsFuncCall.Args)
        * [func (c IndexingSettingStoreGetLastestSchemaSettingsFuncCall) Results() []interface{}](#IndexingSettingStoreGetLastestSchemaSettingsFuncCall.Results)
    * [type MockPackageReferenceScanner struct](#MockPackageReferenceScanner)
        * [func NewMockPackageReferenceScanner() *MockPackageReferenceScanner](#NewMockPackageReferenceScanner)
        * [func NewMockPackageReferenceScannerFrom(i dbstore.PackageReferenceScanner) *MockPackageReferenceScanner](#NewMockPackageReferenceScannerFrom)
        * [func (m *MockPackageReferenceScanner) Close() error](#MockPackageReferenceScanner.Close)
        * [func (m *MockPackageReferenceScanner) Next() (lsifstore.PackageReference, bool, error)](#MockPackageReferenceScanner.Next)
    * [type PackageReferenceScannerCloseFunc struct](#PackageReferenceScannerCloseFunc)
        * [func (f *PackageReferenceScannerCloseFunc) SetDefaultHook(hook func() error)](#PackageReferenceScannerCloseFunc.SetDefaultHook)
        * [func (f *PackageReferenceScannerCloseFunc) PushHook(hook func() error)](#PackageReferenceScannerCloseFunc.PushHook)
        * [func (f *PackageReferenceScannerCloseFunc) SetDefaultReturn(r0 error)](#PackageReferenceScannerCloseFunc.SetDefaultReturn)
        * [func (f *PackageReferenceScannerCloseFunc) PushReturn(r0 error)](#PackageReferenceScannerCloseFunc.PushReturn)
        * [func (f *PackageReferenceScannerCloseFunc) nextHook() func() error](#PackageReferenceScannerCloseFunc.nextHook)
        * [func (f *PackageReferenceScannerCloseFunc) appendCall(r0 PackageReferenceScannerCloseFuncCall)](#PackageReferenceScannerCloseFunc.appendCall)
        * [func (f *PackageReferenceScannerCloseFunc) History() []PackageReferenceScannerCloseFuncCall](#PackageReferenceScannerCloseFunc.History)
    * [type PackageReferenceScannerCloseFuncCall struct](#PackageReferenceScannerCloseFuncCall)
        * [func (c PackageReferenceScannerCloseFuncCall) Args() []interface{}](#PackageReferenceScannerCloseFuncCall.Args)
        * [func (c PackageReferenceScannerCloseFuncCall) Results() []interface{}](#PackageReferenceScannerCloseFuncCall.Results)
    * [type PackageReferenceScannerNextFunc struct](#PackageReferenceScannerNextFunc)
        * [func (f *PackageReferenceScannerNextFunc) SetDefaultHook(hook func() (lsifstore.PackageReference, bool, error))](#PackageReferenceScannerNextFunc.SetDefaultHook)
        * [func (f *PackageReferenceScannerNextFunc) PushHook(hook func() (lsifstore.PackageReference, bool, error))](#PackageReferenceScannerNextFunc.PushHook)
        * [func (f *PackageReferenceScannerNextFunc) SetDefaultReturn(r0 lsifstore.PackageReference, r1 bool, r2 error)](#PackageReferenceScannerNextFunc.SetDefaultReturn)
        * [func (f *PackageReferenceScannerNextFunc) PushReturn(r0 lsifstore.PackageReference, r1 bool, r2 error)](#PackageReferenceScannerNextFunc.PushReturn)
        * [func (f *PackageReferenceScannerNextFunc) nextHook() func() (lsifstore.PackageReference, bool, error)](#PackageReferenceScannerNextFunc.nextHook)
        * [func (f *PackageReferenceScannerNextFunc) appendCall(r0 PackageReferenceScannerNextFuncCall)](#PackageReferenceScannerNextFunc.appendCall)
        * [func (f *PackageReferenceScannerNextFunc) History() []PackageReferenceScannerNextFuncCall](#PackageReferenceScannerNextFunc.History)
    * [type PackageReferenceScannerNextFuncCall struct](#PackageReferenceScannerNextFuncCall)
        * [func (c PackageReferenceScannerNextFuncCall) Args() []interface{}](#PackageReferenceScannerNextFuncCall.Args)
        * [func (c PackageReferenceScannerNextFuncCall) Results() []interface{}](#PackageReferenceScannerNextFuncCall.Results)
* [Functions](#func)
    * [func NewDependencyIndexingScheduler(dbStore DBStore,...](#NewDependencyIndexingScheduler)
    * [func NewIndexScheduler(dbStore DBStore,...](#NewIndexScheduler)
    * [func deduplicateRepositoryIDs(ids ...[]int) (repositoryIDs []int)](#deduplicateRepositoryIDs)
    * [func isRepoNotExist(err error) bool](#isRepoNotExist)
    * [func TestDependencyIndexingSchedulerHandler(t *testing.T)](#TestDependencyIndexingSchedulerHandler)
    * [func TestDependencyIndexingSchedulerHandlerShouldSkipRepository(t *testing.T)](#TestDependencyIndexingSchedulerHandlerShouldSkipRepository)
    * [func init()](#init.index_scheduler_test.go)
    * [func TestIndexSchedulerUpdate(t *testing.T)](#TestIndexSchedulerUpdate)
    * [func TestDisabledAutoindexConfiguration(t *testing.T)](#TestDisabledAutoindexConfiguration)
    * [func TestMain(m *testing.M)](#TestMain)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="defaultRepositoriesQueuedPerSecond" href="#defaultRepositoriesQueuedPerSecond">const defaultRepositoriesQueuedPerSecond</a>

```
searchKey: indexing.defaultRepositoriesQueuedPerSecond
tags: [private]
```

```Go
const defaultRepositoriesQueuedPerSecond = 25
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="dependencyIndexingRepositoryIDs" href="#dependencyIndexingRepositoryIDs">var dependencyIndexingRepositoryIDs</a>

```
searchKey: indexing.dependencyIndexingRepositoryIDs
tags: [private]
```

```Go
var dependencyIndexingRepositoryIDs = []int{
	35703861,
	36146693,
	36809250,
	38967070,
}
```

### <a id="indexSchedulerEnabled" href="#indexSchedulerEnabled">var indexSchedulerEnabled</a>

```
searchKey: indexing.indexSchedulerEnabled
tags: [private]
```

```Go
var indexSchedulerEnabled = conf.CodeIntelAutoIndexingEnabled
```

For mocking in tests 

### <a id="enabledRepoGroupNames" href="#enabledRepoGroupNames">var enabledRepoGroupNames</a>

```
searchKey: indexing.enabledRepoGroupNames
tags: [private]
```

```Go
var enabledRepoGroupNames = []string{"cncf"}
```

Used to filter the valid repo group names 

### <a id="singletonOperations" href="#singletonOperations">var singletonOperations</a>

```
searchKey: indexing.singletonOperations
tags: [private]
```

```Go
var singletonOperations *operations
```

### <a id="once" href="#once">var once</a>

```
searchKey: indexing.once
tags: [private]
```

```Go
var once sync.Once
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="dependencyIndexingSchedulerHandler" href="#dependencyIndexingSchedulerHandler">type dependencyIndexingSchedulerHandler struct</a>

```
searchKey: indexing.dependencyIndexingSchedulerHandler
tags: [private]
```

```Go
type dependencyIndexingSchedulerHandler struct {
	dbStore       DBStore
	indexEnqueuer IndexEnqueuer
}
```

#### <a id="dependencyIndexingSchedulerHandler.Handle" href="#dependencyIndexingSchedulerHandler.Handle">func (h *dependencyIndexingSchedulerHandler) Handle(ctx context.Context, tx dbworkerstore.Store, record workerutil.Record) error</a>

```
searchKey: indexing.dependencyIndexingSchedulerHandler.Handle
tags: [private]
```

```Go
func (h *dependencyIndexingSchedulerHandler) Handle(ctx context.Context, tx dbworkerstore.Store, record workerutil.Record) error
```

Handle iterates all import monikers associated with a given upload that has recently completed processing. Each moniker is interpreted according to its scheme to determine the dependent repository and commit. A set of indexing jobs are enqueued for each repository and commit pair. 

#### <a id="dependencyIndexingSchedulerHandler.shouldIndexDependencies" href="#dependencyIndexingSchedulerHandler.shouldIndexDependencies">func (h *dependencyIndexingSchedulerHandler) shouldIndexDependencies(ctx context.Context, store DBStore, uploadID int) (bool, error)</a>

```
searchKey: indexing.dependencyIndexingSchedulerHandler.shouldIndexDependencies
tags: [private]
```

```Go
func (h *dependencyIndexingSchedulerHandler) shouldIndexDependencies(ctx context.Context, store DBStore, uploadID int) (bool, error)
```

shouldIndexDependencies returns true if the given upload should undergo dependency indexing. Currently, we're only enabling dependency indexing for a small, hard-coded list of repository identifiers in the Cloud env. 

### <a id="DBStore" href="#DBStore">type DBStore interface</a>

```
searchKey: indexing.DBStore
```

```Go
type DBStore interface {
	With(other basestore.ShareableStore) DBStore
	GetRepositoriesWithIndexConfiguration(ctx context.Context) ([]int, error)
	GetAutoindexDisabledRepositories(ctx context.Context) ([]int, error)
	GetUploads(ctx context.Context, opts dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
	GetUploadByID(ctx context.Context, id int) (dbstore.Upload, bool, error)
	ReferencesForUpload(ctx context.Context, uploadID int) (dbstore.PackageReferenceScanner, error)
}
```

### <a id="DBStoreShim" href="#DBStoreShim">type DBStoreShim struct</a>

```
searchKey: indexing.DBStoreShim
```

```Go
type DBStoreShim struct {
	*dbstore.Store
}
```

#### <a id="DBStoreShim.With" href="#DBStoreShim.With">func (s *DBStoreShim) With(other basestore.ShareableStore) DBStore</a>

```
searchKey: indexing.DBStoreShim.With
```

```Go
func (s *DBStoreShim) With(other basestore.ShareableStore) DBStore
```

### <a id="IndexingSettingStore" href="#IndexingSettingStore">type IndexingSettingStore interface</a>

```
searchKey: indexing.IndexingSettingStore
```

```Go
type IndexingSettingStore interface {
	GetLastestSchemaSettings(context.Context, api.SettingsSubject) (*schema.Settings, error)
}
```

### <a id="IndexingRepoStore" href="#IndexingRepoStore">type IndexingRepoStore interface</a>

```
searchKey: indexing.IndexingRepoStore
```

```Go
type IndexingRepoStore interface {
	ListRepoNames(ctx context.Context, opt database.ReposListOptions) (results []types.RepoName, err error)
}
```

### <a id="GitserverClient" href="#GitserverClient">type GitserverClient interface</a>

```
searchKey: indexing.GitserverClient
```

```Go
type GitserverClient interface {
	Head(ctx context.Context, repositoryID int) (string, error)
	ListFiles(ctx context.Context, repositoryID int, commit string, pattern *regexp.Regexp) ([]string, error)
	FileExists(ctx context.Context, repositoryID int, commit, file string) (bool, error)
	RawContents(ctx context.Context, repositoryID int, commit, file string) ([]byte, error)
	ResolveRevision(ctx context.Context, repositoryID int, versionString string) (api.CommitID, error)
}
```

### <a id="IndexEnqueuer" href="#IndexEnqueuer">type IndexEnqueuer interface</a>

```
searchKey: indexing.IndexEnqueuer
```

```Go
type IndexEnqueuer interface {
	QueueIndexesForRepository(ctx context.Context, repositoryID int) error
	QueueIndexesForPackage(ctx context.Context, pkg semantic.Package) error
}
```

### <a id="IndexScheduler" href="#IndexScheduler">type IndexScheduler struct</a>

```
searchKey: indexing.IndexScheduler
```

```Go
type IndexScheduler struct {
	dbStore       DBStore
	settingStore  IndexingSettingStore
	repoStore     IndexingRepoStore
	indexEnqueuer IndexEnqueuer
	limiter       *rate.Limiter
	operations    *operations
}
```

#### <a id="IndexScheduler.Handle" href="#IndexScheduler.Handle">func (s *IndexScheduler) Handle(ctx context.Context) error</a>

```
searchKey: indexing.IndexScheduler.Handle
```

```Go
func (s *IndexScheduler) Handle(ctx context.Context) error
```

#### <a id="IndexScheduler.HandleError" href="#IndexScheduler.HandleError">func (s *IndexScheduler) HandleError(err error)</a>

```
searchKey: indexing.IndexScheduler.HandleError
```

```Go
func (s *IndexScheduler) HandleError(err error)
```

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: indexing.operations
tags: [private]
```

```Go
type operations struct {
	HandleIndexScheduler *observation.Operation
	QueueRepository      *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context) *operations</a>

```
searchKey: indexing.newOperations
tags: [private]
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

### <a id="MockDBStore" href="#MockDBStore">type MockDBStore struct</a>

```
searchKey: indexing.MockDBStore
tags: [private]
```

```Go
type MockDBStore struct {
	// GetAutoindexDisabledRepositoriesFunc is an instance of a mock
	// function object controlling the behavior of the method
	// GetAutoindexDisabledRepositories.
	GetAutoindexDisabledRepositoriesFunc *DBStoreGetAutoindexDisabledRepositoriesFunc
	// GetRepositoriesWithIndexConfigurationFunc is an instance of a mock
	// function object controlling the behavior of the method
	// GetRepositoriesWithIndexConfiguration.
	GetRepositoriesWithIndexConfigurationFunc *DBStoreGetRepositoriesWithIndexConfigurationFunc
	// GetUploadByIDFunc is an instance of a mock function object
	// controlling the behavior of the method GetUploadByID.
	GetUploadByIDFunc *DBStoreGetUploadByIDFunc
	// GetUploadsFunc is an instance of a mock function object controlling
	// the behavior of the method GetUploads.
	GetUploadsFunc *DBStoreGetUploadsFunc
	// ReferencesForUploadFunc is an instance of a mock function object
	// controlling the behavior of the method ReferencesForUpload.
	ReferencesForUploadFunc *DBStoreReferencesForUploadFunc
	// WithFunc is an instance of a mock function object controlling the
	// behavior of the method With.
	WithFunc *DBStoreWithFunc
}
```

MockDBStore is a mock implementation of the DBStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/indexing) used for unit testing. 

#### <a id="NewMockDBStore" href="#NewMockDBStore">func NewMockDBStore() *MockDBStore</a>

```
searchKey: indexing.NewMockDBStore
tags: [private]
```

```Go
func NewMockDBStore() *MockDBStore
```

NewMockDBStore creates a new mock of the DBStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockDBStoreFrom" href="#NewMockDBStoreFrom">func NewMockDBStoreFrom(i DBStore) *MockDBStore</a>

```
searchKey: indexing.NewMockDBStoreFrom
tags: [private]
```

```Go
func NewMockDBStoreFrom(i DBStore) *MockDBStore
```

NewMockDBStoreFrom creates a new mock of the MockDBStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockDBStore.GetAutoindexDisabledRepositories" href="#MockDBStore.GetAutoindexDisabledRepositories">func (m *MockDBStore) GetAutoindexDisabledRepositories(v0 context.Context) ([]int, error)</a>

```
searchKey: indexing.MockDBStore.GetAutoindexDisabledRepositories
tags: [private]
```

```Go
func (m *MockDBStore) GetAutoindexDisabledRepositories(v0 context.Context) ([]int, error)
```

GetAutoindexDisabledRepositories delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetRepositoriesWithIndexConfiguration" href="#MockDBStore.GetRepositoriesWithIndexConfiguration">func (m *MockDBStore) GetRepositoriesWithIndexConfiguration(v0 context.Context) ([]int, error)</a>

```
searchKey: indexing.MockDBStore.GetRepositoriesWithIndexConfiguration
tags: [private]
```

```Go
func (m *MockDBStore) GetRepositoriesWithIndexConfiguration(v0 context.Context) ([]int, error)
```

GetRepositoriesWithIndexConfiguration delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetUploadByID" href="#MockDBStore.GetUploadByID">func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)</a>

```
searchKey: indexing.MockDBStore.GetUploadByID
tags: [private]
```

```Go
func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)
```

GetUploadByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetUploads" href="#MockDBStore.GetUploads">func (m *MockDBStore) GetUploads(v0 context.Context, v1 dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)</a>

```
searchKey: indexing.MockDBStore.GetUploads
tags: [private]
```

```Go
func (m *MockDBStore) GetUploads(v0 context.Context, v1 dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
```

GetUploads delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.ReferencesForUpload" href="#MockDBStore.ReferencesForUpload">func (m *MockDBStore) ReferencesForUpload(v0 context.Context, v1 int) (dbstore.PackageReferenceScanner, error)</a>

```
searchKey: indexing.MockDBStore.ReferencesForUpload
tags: [private]
```

```Go
func (m *MockDBStore) ReferencesForUpload(v0 context.Context, v1 int) (dbstore.PackageReferenceScanner, error)
```

ReferencesForUpload delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.With" href="#MockDBStore.With">func (m *MockDBStore) With(v0 basestore.ShareableStore) DBStore</a>

```
searchKey: indexing.MockDBStore.With
tags: [private]
```

```Go
func (m *MockDBStore) With(v0 basestore.ShareableStore) DBStore
```

With delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="DBStoreGetAutoindexDisabledRepositoriesFunc" href="#DBStoreGetAutoindexDisabledRepositoriesFunc">type DBStoreGetAutoindexDisabledRepositoriesFunc struct</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFunc
tags: [private]
```

```Go
type DBStoreGetAutoindexDisabledRepositoriesFunc struct {
	defaultHook func(context.Context) ([]int, error)
	hooks       []func(context.Context) ([]int, error)
	history     []DBStoreGetAutoindexDisabledRepositoriesFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetAutoindexDisabledRepositoriesFunc describes the behavior when the GetAutoindexDisabledRepositories method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetAutoindexDisabledRepositoriesFunc.SetDefaultHook" href="#DBStoreGetAutoindexDisabledRepositoriesFunc.SetDefaultHook">func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) SetDefaultHook(hook func(context.Context) ([]int, error))</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) SetDefaultHook(hook func(context.Context) ([]int, error))
```

SetDefaultHook sets function that is called when the GetAutoindexDisabledRepositories method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetAutoindexDisabledRepositoriesFunc.PushHook" href="#DBStoreGetAutoindexDisabledRepositoriesFunc.PushHook">func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) PushHook(hook func(context.Context) ([]int, error))</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) PushHook(hook func(context.Context) ([]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetAutoindexDisabledRepositories method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetAutoindexDisabledRepositoriesFunc.SetDefaultReturn" href="#DBStoreGetAutoindexDisabledRepositoriesFunc.SetDefaultReturn">func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) SetDefaultReturn(r0 []int, r1 error)</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) SetDefaultReturn(r0 []int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetAutoindexDisabledRepositoriesFunc.PushReturn" href="#DBStoreGetAutoindexDisabledRepositoriesFunc.PushReturn">func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) PushReturn(r0 []int, r1 error)</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) PushReturn(r0 []int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetAutoindexDisabledRepositoriesFunc.nextHook" href="#DBStoreGetAutoindexDisabledRepositoriesFunc.nextHook">func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) nextHook() func(context.Context) ([]int, error)</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) nextHook() func(context.Context) ([]int, error)
```

#### <a id="DBStoreGetAutoindexDisabledRepositoriesFunc.appendCall" href="#DBStoreGetAutoindexDisabledRepositoriesFunc.appendCall">func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) appendCall(r0 DBStoreGetAutoindexDisabledRepositoriesFuncCall)</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) appendCall(r0 DBStoreGetAutoindexDisabledRepositoriesFuncCall)
```

#### <a id="DBStoreGetAutoindexDisabledRepositoriesFunc.History" href="#DBStoreGetAutoindexDisabledRepositoriesFunc.History">func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) History() []DBStoreGetAutoindexDisabledRepositoriesFuncCall</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFunc.History
tags: [private]
```

```Go
func (f *DBStoreGetAutoindexDisabledRepositoriesFunc) History() []DBStoreGetAutoindexDisabledRepositoriesFuncCall
```

History returns a sequence of DBStoreGetAutoindexDisabledRepositoriesFuncCall objects describing the invocations of this function. 

### <a id="DBStoreGetAutoindexDisabledRepositoriesFuncCall" href="#DBStoreGetAutoindexDisabledRepositoriesFuncCall">type DBStoreGetAutoindexDisabledRepositoriesFuncCall struct</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFuncCall
tags: [private]
```

```Go
type DBStoreGetAutoindexDisabledRepositoriesFuncCall struct {
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

DBStoreGetAutoindexDisabledRepositoriesFuncCall is an object that describes an invocation of method GetAutoindexDisabledRepositories on an instance of MockDBStore. 

#### <a id="DBStoreGetAutoindexDisabledRepositoriesFuncCall.Args" href="#DBStoreGetAutoindexDisabledRepositoriesFuncCall.Args">func (c DBStoreGetAutoindexDisabledRepositoriesFuncCall) Args() []interface{}</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreGetAutoindexDisabledRepositoriesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetAutoindexDisabledRepositoriesFuncCall.Results" href="#DBStoreGetAutoindexDisabledRepositoriesFuncCall.Results">func (c DBStoreGetAutoindexDisabledRepositoriesFuncCall) Results() []interface{}</a>

```
searchKey: indexing.DBStoreGetAutoindexDisabledRepositoriesFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreGetAutoindexDisabledRepositoriesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc">type DBStoreGetRepositoriesWithIndexConfigurationFunc struct</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFunc
tags: [private]
```

```Go
type DBStoreGetRepositoriesWithIndexConfigurationFunc struct {
	defaultHook func(context.Context) ([]int, error)
	hooks       []func(context.Context) ([]int, error)
	history     []DBStoreGetRepositoriesWithIndexConfigurationFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetRepositoriesWithIndexConfigurationFunc describes the behavior when the GetRepositoriesWithIndexConfiguration method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultHook(hook func(context.Context) ([]int, error))</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultHook(hook func(context.Context) ([]int, error))
```

SetDefaultHook sets function that is called when the GetRepositoriesWithIndexConfiguration method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushHook(hook func(context.Context) ([]int, error))</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushHook(hook func(context.Context) ([]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetRepositoriesWithIndexConfiguration method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultReturn(r0 []int, r1 error)</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultReturn(r0 []int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushReturn(r0 []int, r1 error)</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushReturn(r0 []int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) nextHook() func(context.Context) ([]int, error)</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) nextHook() func(context.Context) ([]int, error)
```

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) appendCall(r0 DBStoreGetRepositoriesWithIndexConfigurationFuncCall)</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) appendCall(r0 DBStoreGetRepositoriesWithIndexConfigurationFuncCall)
```

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.History" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.History">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) History() []DBStoreGetRepositoriesWithIndexConfigurationFuncCall</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFunc.History
tags: [private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) History() []DBStoreGetRepositoriesWithIndexConfigurationFuncCall
```

History returns a sequence of DBStoreGetRepositoriesWithIndexConfigurationFuncCall objects describing the invocations of this function. 

### <a id="DBStoreGetRepositoriesWithIndexConfigurationFuncCall" href="#DBStoreGetRepositoriesWithIndexConfigurationFuncCall">type DBStoreGetRepositoriesWithIndexConfigurationFuncCall struct</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFuncCall
tags: [private]
```

```Go
type DBStoreGetRepositoriesWithIndexConfigurationFuncCall struct {
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

DBStoreGetRepositoriesWithIndexConfigurationFuncCall is an object that describes an invocation of method GetRepositoriesWithIndexConfiguration on an instance of MockDBStore. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args" href="#DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args">func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Args() []interface{}</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results" href="#DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results">func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Results() []interface{}</a>

```
searchKey: indexing.DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetUploadByIDFunc" href="#DBStoreGetUploadByIDFunc">type DBStoreGetUploadByIDFunc struct</a>

```
searchKey: indexing.DBStoreGetUploadByIDFunc
tags: [private]
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

#### <a id="DBStoreGetUploadByIDFunc.SetDefaultHook" href="#DBStoreGetUploadByIDFunc.SetDefaultHook">func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: indexing.DBStoreGetUploadByIDFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

SetDefaultHook sets function that is called when the GetUploadByID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetUploadByIDFunc.PushHook" href="#DBStoreGetUploadByIDFunc.PushHook">func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: indexing.DBStoreGetUploadByIDFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploadByID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetUploadByIDFunc.SetDefaultReturn" href="#DBStoreGetUploadByIDFunc.SetDefaultReturn">func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: indexing.DBStoreGetUploadByIDFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadByIDFunc.PushReturn" href="#DBStoreGetUploadByIDFunc.PushReturn">func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: indexing.DBStoreGetUploadByIDFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadByIDFunc.nextHook" href="#DBStoreGetUploadByIDFunc.nextHook">func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)</a>

```
searchKey: indexing.DBStoreGetUploadByIDFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)
```

#### <a id="DBStoreGetUploadByIDFunc.appendCall" href="#DBStoreGetUploadByIDFunc.appendCall">func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)</a>

```
searchKey: indexing.DBStoreGetUploadByIDFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)
```

#### <a id="DBStoreGetUploadByIDFunc.History" href="#DBStoreGetUploadByIDFunc.History">func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall</a>

```
searchKey: indexing.DBStoreGetUploadByIDFunc.History
tags: [private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall
```

History returns a sequence of DBStoreGetUploadByIDFuncCall objects describing the invocations of this function. 

### <a id="DBStoreGetUploadByIDFuncCall" href="#DBStoreGetUploadByIDFuncCall">type DBStoreGetUploadByIDFuncCall struct</a>

```
searchKey: indexing.DBStoreGetUploadByIDFuncCall
tags: [private]
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
searchKey: indexing.DBStoreGetUploadByIDFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetUploadByIDFuncCall.Results" href="#DBStoreGetUploadByIDFuncCall.Results">func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}</a>

```
searchKey: indexing.DBStoreGetUploadByIDFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetUploadsFunc" href="#DBStoreGetUploadsFunc">type DBStoreGetUploadsFunc struct</a>

```
searchKey: indexing.DBStoreGetUploadsFunc
tags: [private]
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

#### <a id="DBStoreGetUploadsFunc.SetDefaultHook" href="#DBStoreGetUploadsFunc.SetDefaultHook">func (f *DBStoreGetUploadsFunc) SetDefaultHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))</a>

```
searchKey: indexing.DBStoreGetUploadsFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreGetUploadsFunc) SetDefaultHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))
```

SetDefaultHook sets function that is called when the GetUploads method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetUploadsFunc.PushHook" href="#DBStoreGetUploadsFunc.PushHook">func (f *DBStoreGetUploadsFunc) PushHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))</a>

```
searchKey: indexing.DBStoreGetUploadsFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreGetUploadsFunc) PushHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploads method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetUploadsFunc.SetDefaultReturn" href="#DBStoreGetUploadsFunc.SetDefaultReturn">func (f *DBStoreGetUploadsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 int, r2 error)</a>

```
searchKey: indexing.DBStoreGetUploadsFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreGetUploadsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadsFunc.PushReturn" href="#DBStoreGetUploadsFunc.PushReturn">func (f *DBStoreGetUploadsFunc) PushReturn(r0 []dbstore.Upload, r1 int, r2 error)</a>

```
searchKey: indexing.DBStoreGetUploadsFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreGetUploadsFunc) PushReturn(r0 []dbstore.Upload, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadsFunc.nextHook" href="#DBStoreGetUploadsFunc.nextHook">func (f *DBStoreGetUploadsFunc) nextHook() func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)</a>

```
searchKey: indexing.DBStoreGetUploadsFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreGetUploadsFunc) nextHook() func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
```

#### <a id="DBStoreGetUploadsFunc.appendCall" href="#DBStoreGetUploadsFunc.appendCall">func (f *DBStoreGetUploadsFunc) appendCall(r0 DBStoreGetUploadsFuncCall)</a>

```
searchKey: indexing.DBStoreGetUploadsFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreGetUploadsFunc) appendCall(r0 DBStoreGetUploadsFuncCall)
```

#### <a id="DBStoreGetUploadsFunc.History" href="#DBStoreGetUploadsFunc.History">func (f *DBStoreGetUploadsFunc) History() []DBStoreGetUploadsFuncCall</a>

```
searchKey: indexing.DBStoreGetUploadsFunc.History
tags: [private]
```

```Go
func (f *DBStoreGetUploadsFunc) History() []DBStoreGetUploadsFuncCall
```

History returns a sequence of DBStoreGetUploadsFuncCall objects describing the invocations of this function. 

### <a id="DBStoreGetUploadsFuncCall" href="#DBStoreGetUploadsFuncCall">type DBStoreGetUploadsFuncCall struct</a>

```
searchKey: indexing.DBStoreGetUploadsFuncCall
tags: [private]
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
searchKey: indexing.DBStoreGetUploadsFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreGetUploadsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetUploadsFuncCall.Results" href="#DBStoreGetUploadsFuncCall.Results">func (c DBStoreGetUploadsFuncCall) Results() []interface{}</a>

```
searchKey: indexing.DBStoreGetUploadsFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreGetUploadsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreReferencesForUploadFunc" href="#DBStoreReferencesForUploadFunc">type DBStoreReferencesForUploadFunc struct</a>

```
searchKey: indexing.DBStoreReferencesForUploadFunc
tags: [private]
```

```Go
type DBStoreReferencesForUploadFunc struct {
	defaultHook func(context.Context, int) (dbstore.PackageReferenceScanner, error)
	hooks       []func(context.Context, int) (dbstore.PackageReferenceScanner, error)
	history     []DBStoreReferencesForUploadFuncCall
	mutex       sync.Mutex
}
```

DBStoreReferencesForUploadFunc describes the behavior when the ReferencesForUpload method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreReferencesForUploadFunc.SetDefaultHook" href="#DBStoreReferencesForUploadFunc.SetDefaultHook">func (f *DBStoreReferencesForUploadFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.PackageReferenceScanner, error))</a>

```
searchKey: indexing.DBStoreReferencesForUploadFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreReferencesForUploadFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.PackageReferenceScanner, error))
```

SetDefaultHook sets function that is called when the ReferencesForUpload method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreReferencesForUploadFunc.PushHook" href="#DBStoreReferencesForUploadFunc.PushHook">func (f *DBStoreReferencesForUploadFunc) PushHook(hook func(context.Context, int) (dbstore.PackageReferenceScanner, error))</a>

```
searchKey: indexing.DBStoreReferencesForUploadFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreReferencesForUploadFunc) PushHook(hook func(context.Context, int) (dbstore.PackageReferenceScanner, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ReferencesForUpload method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreReferencesForUploadFunc.SetDefaultReturn" href="#DBStoreReferencesForUploadFunc.SetDefaultReturn">func (f *DBStoreReferencesForUploadFunc) SetDefaultReturn(r0 dbstore.PackageReferenceScanner, r1 error)</a>

```
searchKey: indexing.DBStoreReferencesForUploadFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreReferencesForUploadFunc) SetDefaultReturn(r0 dbstore.PackageReferenceScanner, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreReferencesForUploadFunc.PushReturn" href="#DBStoreReferencesForUploadFunc.PushReturn">func (f *DBStoreReferencesForUploadFunc) PushReturn(r0 dbstore.PackageReferenceScanner, r1 error)</a>

```
searchKey: indexing.DBStoreReferencesForUploadFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreReferencesForUploadFunc) PushReturn(r0 dbstore.PackageReferenceScanner, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreReferencesForUploadFunc.nextHook" href="#DBStoreReferencesForUploadFunc.nextHook">func (f *DBStoreReferencesForUploadFunc) nextHook() func(context.Context, int) (dbstore.PackageReferenceScanner, error)</a>

```
searchKey: indexing.DBStoreReferencesForUploadFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreReferencesForUploadFunc) nextHook() func(context.Context, int) (dbstore.PackageReferenceScanner, error)
```

#### <a id="DBStoreReferencesForUploadFunc.appendCall" href="#DBStoreReferencesForUploadFunc.appendCall">func (f *DBStoreReferencesForUploadFunc) appendCall(r0 DBStoreReferencesForUploadFuncCall)</a>

```
searchKey: indexing.DBStoreReferencesForUploadFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreReferencesForUploadFunc) appendCall(r0 DBStoreReferencesForUploadFuncCall)
```

#### <a id="DBStoreReferencesForUploadFunc.History" href="#DBStoreReferencesForUploadFunc.History">func (f *DBStoreReferencesForUploadFunc) History() []DBStoreReferencesForUploadFuncCall</a>

```
searchKey: indexing.DBStoreReferencesForUploadFunc.History
tags: [private]
```

```Go
func (f *DBStoreReferencesForUploadFunc) History() []DBStoreReferencesForUploadFuncCall
```

History returns a sequence of DBStoreReferencesForUploadFuncCall objects describing the invocations of this function. 

### <a id="DBStoreReferencesForUploadFuncCall" href="#DBStoreReferencesForUploadFuncCall">type DBStoreReferencesForUploadFuncCall struct</a>

```
searchKey: indexing.DBStoreReferencesForUploadFuncCall
tags: [private]
```

```Go
type DBStoreReferencesForUploadFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 dbstore.PackageReferenceScanner
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreReferencesForUploadFuncCall is an object that describes an invocation of method ReferencesForUpload on an instance of MockDBStore. 

#### <a id="DBStoreReferencesForUploadFuncCall.Args" href="#DBStoreReferencesForUploadFuncCall.Args">func (c DBStoreReferencesForUploadFuncCall) Args() []interface{}</a>

```
searchKey: indexing.DBStoreReferencesForUploadFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreReferencesForUploadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreReferencesForUploadFuncCall.Results" href="#DBStoreReferencesForUploadFuncCall.Results">func (c DBStoreReferencesForUploadFuncCall) Results() []interface{}</a>

```
searchKey: indexing.DBStoreReferencesForUploadFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreReferencesForUploadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreWithFunc" href="#DBStoreWithFunc">type DBStoreWithFunc struct</a>

```
searchKey: indexing.DBStoreWithFunc
tags: [private]
```

```Go
type DBStoreWithFunc struct {
	defaultHook func(basestore.ShareableStore) DBStore
	hooks       []func(basestore.ShareableStore) DBStore
	history     []DBStoreWithFuncCall
	mutex       sync.Mutex
}
```

DBStoreWithFunc describes the behavior when the With method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreWithFunc.SetDefaultHook" href="#DBStoreWithFunc.SetDefaultHook">func (f *DBStoreWithFunc) SetDefaultHook(hook func(basestore.ShareableStore) DBStore)</a>

```
searchKey: indexing.DBStoreWithFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreWithFunc) SetDefaultHook(hook func(basestore.ShareableStore) DBStore)
```

SetDefaultHook sets function that is called when the With method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreWithFunc.PushHook" href="#DBStoreWithFunc.PushHook">func (f *DBStoreWithFunc) PushHook(hook func(basestore.ShareableStore) DBStore)</a>

```
searchKey: indexing.DBStoreWithFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreWithFunc) PushHook(hook func(basestore.ShareableStore) DBStore)
```

PushHook adds a function to the end of hook queue. Each invocation of the With method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreWithFunc.SetDefaultReturn" href="#DBStoreWithFunc.SetDefaultReturn">func (f *DBStoreWithFunc) SetDefaultReturn(r0 DBStore)</a>

```
searchKey: indexing.DBStoreWithFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreWithFunc) SetDefaultReturn(r0 DBStore)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreWithFunc.PushReturn" href="#DBStoreWithFunc.PushReturn">func (f *DBStoreWithFunc) PushReturn(r0 DBStore)</a>

```
searchKey: indexing.DBStoreWithFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreWithFunc) PushReturn(r0 DBStore)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreWithFunc.nextHook" href="#DBStoreWithFunc.nextHook">func (f *DBStoreWithFunc) nextHook() func(basestore.ShareableStore) DBStore</a>

```
searchKey: indexing.DBStoreWithFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreWithFunc) nextHook() func(basestore.ShareableStore) DBStore
```

#### <a id="DBStoreWithFunc.appendCall" href="#DBStoreWithFunc.appendCall">func (f *DBStoreWithFunc) appendCall(r0 DBStoreWithFuncCall)</a>

```
searchKey: indexing.DBStoreWithFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreWithFunc) appendCall(r0 DBStoreWithFuncCall)
```

#### <a id="DBStoreWithFunc.History" href="#DBStoreWithFunc.History">func (f *DBStoreWithFunc) History() []DBStoreWithFuncCall</a>

```
searchKey: indexing.DBStoreWithFunc.History
tags: [private]
```

```Go
func (f *DBStoreWithFunc) History() []DBStoreWithFuncCall
```

History returns a sequence of DBStoreWithFuncCall objects describing the invocations of this function. 

### <a id="DBStoreWithFuncCall" href="#DBStoreWithFuncCall">type DBStoreWithFuncCall struct</a>

```
searchKey: indexing.DBStoreWithFuncCall
tags: [private]
```

```Go
type DBStoreWithFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 basestore.ShareableStore
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 DBStore
}
```

DBStoreWithFuncCall is an object that describes an invocation of method With on an instance of MockDBStore. 

#### <a id="DBStoreWithFuncCall.Args" href="#DBStoreWithFuncCall.Args">func (c DBStoreWithFuncCall) Args() []interface{}</a>

```
searchKey: indexing.DBStoreWithFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreWithFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreWithFuncCall.Results" href="#DBStoreWithFuncCall.Results">func (c DBStoreWithFuncCall) Results() []interface{}</a>

```
searchKey: indexing.DBStoreWithFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreWithFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockGitserverClient" href="#MockGitserverClient">type MockGitserverClient struct</a>

```
searchKey: indexing.MockGitserverClient
tags: [private]
```

```Go
type MockGitserverClient struct {
	// FileExistsFunc is an instance of a mock function object controlling
	// the behavior of the method FileExists.
	FileExistsFunc *GitserverClientFileExistsFunc
	// HeadFunc is an instance of a mock function object controlling the
	// behavior of the method Head.
	HeadFunc *GitserverClientHeadFunc
	// ListFilesFunc is an instance of a mock function object controlling
	// the behavior of the method ListFiles.
	ListFilesFunc *GitserverClientListFilesFunc
	// RawContentsFunc is an instance of a mock function object controlling
	// the behavior of the method RawContents.
	RawContentsFunc *GitserverClientRawContentsFunc
	// ResolveRevisionFunc is an instance of a mock function object
	// controlling the behavior of the method ResolveRevision.
	ResolveRevisionFunc *GitserverClientResolveRevisionFunc
}
```

MockGitserverClient is a mock implementation of the GitserverClient interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/indexing) used for unit testing. 

#### <a id="NewMockGitserverClient" href="#NewMockGitserverClient">func NewMockGitserverClient() *MockGitserverClient</a>

```
searchKey: indexing.NewMockGitserverClient
tags: [private]
```

```Go
func NewMockGitserverClient() *MockGitserverClient
```

NewMockGitserverClient creates a new mock of the GitserverClient interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGitserverClientFrom" href="#NewMockGitserverClientFrom">func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient</a>

```
searchKey: indexing.NewMockGitserverClientFrom
tags: [private]
```

```Go
func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient
```

NewMockGitserverClientFrom creates a new mock of the MockGitserverClient interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGitserverClient.FileExists" href="#MockGitserverClient.FileExists">func (m *MockGitserverClient) FileExists(v0 context.Context, v1 int, v2 string, v3 string) (bool, error)</a>

```
searchKey: indexing.MockGitserverClient.FileExists
tags: [private]
```

```Go
func (m *MockGitserverClient) FileExists(v0 context.Context, v1 int, v2 string, v3 string) (bool, error)
```

FileExists delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.Head" href="#MockGitserverClient.Head">func (m *MockGitserverClient) Head(v0 context.Context, v1 int) (string, error)</a>

```
searchKey: indexing.MockGitserverClient.Head
tags: [private]
```

```Go
func (m *MockGitserverClient) Head(v0 context.Context, v1 int) (string, error)
```

Head delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.ListFiles" href="#MockGitserverClient.ListFiles">func (m *MockGitserverClient) ListFiles(v0 context.Context, v1 int, v2 string, v3 *regexp.Regexp) ([]string, error)</a>

```
searchKey: indexing.MockGitserverClient.ListFiles
tags: [private]
```

```Go
func (m *MockGitserverClient) ListFiles(v0 context.Context, v1 int, v2 string, v3 *regexp.Regexp) ([]string, error)
```

ListFiles delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.RawContents" href="#MockGitserverClient.RawContents">func (m *MockGitserverClient) RawContents(v0 context.Context, v1 int, v2 string, v3 string) ([]byte, error)</a>

```
searchKey: indexing.MockGitserverClient.RawContents
tags: [private]
```

```Go
func (m *MockGitserverClient) RawContents(v0 context.Context, v1 int, v2 string, v3 string) ([]byte, error)
```

RawContents delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.ResolveRevision" href="#MockGitserverClient.ResolveRevision">func (m *MockGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)</a>

```
searchKey: indexing.MockGitserverClient.ResolveRevision
tags: [private]
```

```Go
func (m *MockGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)
```

ResolveRevision delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="GitserverClientFileExistsFunc" href="#GitserverClientFileExistsFunc">type GitserverClientFileExistsFunc struct</a>

```
searchKey: indexing.GitserverClientFileExistsFunc
tags: [private]
```

```Go
type GitserverClientFileExistsFunc struct {
	defaultHook func(context.Context, int, string, string) (bool, error)
	hooks       []func(context.Context, int, string, string) (bool, error)
	history     []GitserverClientFileExistsFuncCall
	mutex       sync.Mutex
}
```

GitserverClientFileExistsFunc describes the behavior when the FileExists method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientFileExistsFunc.SetDefaultHook" href="#GitserverClientFileExistsFunc.SetDefaultHook">func (f *GitserverClientFileExistsFunc) SetDefaultHook(hook func(context.Context, int, string, string) (bool, error))</a>

```
searchKey: indexing.GitserverClientFileExistsFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GitserverClientFileExistsFunc) SetDefaultHook(hook func(context.Context, int, string, string) (bool, error))
```

SetDefaultHook sets function that is called when the FileExists method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientFileExistsFunc.PushHook" href="#GitserverClientFileExistsFunc.PushHook">func (f *GitserverClientFileExistsFunc) PushHook(hook func(context.Context, int, string, string) (bool, error))</a>

```
searchKey: indexing.GitserverClientFileExistsFunc.PushHook
tags: [private]
```

```Go
func (f *GitserverClientFileExistsFunc) PushHook(hook func(context.Context, int, string, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the FileExists method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientFileExistsFunc.SetDefaultReturn" href="#GitserverClientFileExistsFunc.SetDefaultReturn">func (f *GitserverClientFileExistsFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: indexing.GitserverClientFileExistsFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GitserverClientFileExistsFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientFileExistsFunc.PushReturn" href="#GitserverClientFileExistsFunc.PushReturn">func (f *GitserverClientFileExistsFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: indexing.GitserverClientFileExistsFunc.PushReturn
tags: [private]
```

```Go
func (f *GitserverClientFileExistsFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientFileExistsFunc.nextHook" href="#GitserverClientFileExistsFunc.nextHook">func (f *GitserverClientFileExistsFunc) nextHook() func(context.Context, int, string, string) (bool, error)</a>

```
searchKey: indexing.GitserverClientFileExistsFunc.nextHook
tags: [private]
```

```Go
func (f *GitserverClientFileExistsFunc) nextHook() func(context.Context, int, string, string) (bool, error)
```

#### <a id="GitserverClientFileExistsFunc.appendCall" href="#GitserverClientFileExistsFunc.appendCall">func (f *GitserverClientFileExistsFunc) appendCall(r0 GitserverClientFileExistsFuncCall)</a>

```
searchKey: indexing.GitserverClientFileExistsFunc.appendCall
tags: [private]
```

```Go
func (f *GitserverClientFileExistsFunc) appendCall(r0 GitserverClientFileExistsFuncCall)
```

#### <a id="GitserverClientFileExistsFunc.History" href="#GitserverClientFileExistsFunc.History">func (f *GitserverClientFileExistsFunc) History() []GitserverClientFileExistsFuncCall</a>

```
searchKey: indexing.GitserverClientFileExistsFunc.History
tags: [private]
```

```Go
func (f *GitserverClientFileExistsFunc) History() []GitserverClientFileExistsFuncCall
```

History returns a sequence of GitserverClientFileExistsFuncCall objects describing the invocations of this function. 

### <a id="GitserverClientFileExistsFuncCall" href="#GitserverClientFileExistsFuncCall">type GitserverClientFileExistsFuncCall struct</a>

```
searchKey: indexing.GitserverClientFileExistsFuncCall
tags: [private]
```

```Go
type GitserverClientFileExistsFuncCall struct {
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

GitserverClientFileExistsFuncCall is an object that describes an invocation of method FileExists on an instance of MockGitserverClient. 

#### <a id="GitserverClientFileExistsFuncCall.Args" href="#GitserverClientFileExistsFuncCall.Args">func (c GitserverClientFileExistsFuncCall) Args() []interface{}</a>

```
searchKey: indexing.GitserverClientFileExistsFuncCall.Args
tags: [private]
```

```Go
func (c GitserverClientFileExistsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientFileExistsFuncCall.Results" href="#GitserverClientFileExistsFuncCall.Results">func (c GitserverClientFileExistsFuncCall) Results() []interface{}</a>

```
searchKey: indexing.GitserverClientFileExistsFuncCall.Results
tags: [private]
```

```Go
func (c GitserverClientFileExistsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientHeadFunc" href="#GitserverClientHeadFunc">type GitserverClientHeadFunc struct</a>

```
searchKey: indexing.GitserverClientHeadFunc
tags: [private]
```

```Go
type GitserverClientHeadFunc struct {
	defaultHook func(context.Context, int) (string, error)
	hooks       []func(context.Context, int) (string, error)
	history     []GitserverClientHeadFuncCall
	mutex       sync.Mutex
}
```

GitserverClientHeadFunc describes the behavior when the Head method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientHeadFunc.SetDefaultHook" href="#GitserverClientHeadFunc.SetDefaultHook">func (f *GitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: indexing.GitserverClientHeadFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))
```

SetDefaultHook sets function that is called when the Head method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientHeadFunc.PushHook" href="#GitserverClientHeadFunc.PushHook">func (f *GitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: indexing.GitserverClientHeadFunc.PushHook
tags: [private]
```

```Go
func (f *GitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Head method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientHeadFunc.SetDefaultReturn" href="#GitserverClientHeadFunc.SetDefaultReturn">func (f *GitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)</a>

```
searchKey: indexing.GitserverClientHeadFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientHeadFunc.PushReturn" href="#GitserverClientHeadFunc.PushReturn">func (f *GitserverClientHeadFunc) PushReturn(r0 string, r1 error)</a>

```
searchKey: indexing.GitserverClientHeadFunc.PushReturn
tags: [private]
```

```Go
func (f *GitserverClientHeadFunc) PushReturn(r0 string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientHeadFunc.nextHook" href="#GitserverClientHeadFunc.nextHook">func (f *GitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)</a>

```
searchKey: indexing.GitserverClientHeadFunc.nextHook
tags: [private]
```

```Go
func (f *GitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)
```

#### <a id="GitserverClientHeadFunc.appendCall" href="#GitserverClientHeadFunc.appendCall">func (f *GitserverClientHeadFunc) appendCall(r0 GitserverClientHeadFuncCall)</a>

```
searchKey: indexing.GitserverClientHeadFunc.appendCall
tags: [private]
```

```Go
func (f *GitserverClientHeadFunc) appendCall(r0 GitserverClientHeadFuncCall)
```

#### <a id="GitserverClientHeadFunc.History" href="#GitserverClientHeadFunc.History">func (f *GitserverClientHeadFunc) History() []GitserverClientHeadFuncCall</a>

```
searchKey: indexing.GitserverClientHeadFunc.History
tags: [private]
```

```Go
func (f *GitserverClientHeadFunc) History() []GitserverClientHeadFuncCall
```

History returns a sequence of GitserverClientHeadFuncCall objects describing the invocations of this function. 

### <a id="GitserverClientHeadFuncCall" href="#GitserverClientHeadFuncCall">type GitserverClientHeadFuncCall struct</a>

```
searchKey: indexing.GitserverClientHeadFuncCall
tags: [private]
```

```Go
type GitserverClientHeadFuncCall struct {
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

GitserverClientHeadFuncCall is an object that describes an invocation of method Head on an instance of MockGitserverClient. 

#### <a id="GitserverClientHeadFuncCall.Args" href="#GitserverClientHeadFuncCall.Args">func (c GitserverClientHeadFuncCall) Args() []interface{}</a>

```
searchKey: indexing.GitserverClientHeadFuncCall.Args
tags: [private]
```

```Go
func (c GitserverClientHeadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientHeadFuncCall.Results" href="#GitserverClientHeadFuncCall.Results">func (c GitserverClientHeadFuncCall) Results() []interface{}</a>

```
searchKey: indexing.GitserverClientHeadFuncCall.Results
tags: [private]
```

```Go
func (c GitserverClientHeadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientListFilesFunc" href="#GitserverClientListFilesFunc">type GitserverClientListFilesFunc struct</a>

```
searchKey: indexing.GitserverClientListFilesFunc
tags: [private]
```

```Go
type GitserverClientListFilesFunc struct {
	defaultHook func(context.Context, int, string, *regexp.Regexp) ([]string, error)
	hooks       []func(context.Context, int, string, *regexp.Regexp) ([]string, error)
	history     []GitserverClientListFilesFuncCall
	mutex       sync.Mutex
}
```

GitserverClientListFilesFunc describes the behavior when the ListFiles method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientListFilesFunc.SetDefaultHook" href="#GitserverClientListFilesFunc.SetDefaultHook">func (f *GitserverClientListFilesFunc) SetDefaultHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))</a>

```
searchKey: indexing.GitserverClientListFilesFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GitserverClientListFilesFunc) SetDefaultHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))
```

SetDefaultHook sets function that is called when the ListFiles method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientListFilesFunc.PushHook" href="#GitserverClientListFilesFunc.PushHook">func (f *GitserverClientListFilesFunc) PushHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))</a>

```
searchKey: indexing.GitserverClientListFilesFunc.PushHook
tags: [private]
```

```Go
func (f *GitserverClientListFilesFunc) PushHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ListFiles method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientListFilesFunc.SetDefaultReturn" href="#GitserverClientListFilesFunc.SetDefaultReturn">func (f *GitserverClientListFilesFunc) SetDefaultReturn(r0 []string, r1 error)</a>

```
searchKey: indexing.GitserverClientListFilesFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GitserverClientListFilesFunc) SetDefaultReturn(r0 []string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientListFilesFunc.PushReturn" href="#GitserverClientListFilesFunc.PushReturn">func (f *GitserverClientListFilesFunc) PushReturn(r0 []string, r1 error)</a>

```
searchKey: indexing.GitserverClientListFilesFunc.PushReturn
tags: [private]
```

```Go
func (f *GitserverClientListFilesFunc) PushReturn(r0 []string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientListFilesFunc.nextHook" href="#GitserverClientListFilesFunc.nextHook">func (f *GitserverClientListFilesFunc) nextHook() func(context.Context, int, string, *regexp.Regexp) ([]string, error)</a>

```
searchKey: indexing.GitserverClientListFilesFunc.nextHook
tags: [private]
```

```Go
func (f *GitserverClientListFilesFunc) nextHook() func(context.Context, int, string, *regexp.Regexp) ([]string, error)
```

#### <a id="GitserverClientListFilesFunc.appendCall" href="#GitserverClientListFilesFunc.appendCall">func (f *GitserverClientListFilesFunc) appendCall(r0 GitserverClientListFilesFuncCall)</a>

```
searchKey: indexing.GitserverClientListFilesFunc.appendCall
tags: [private]
```

```Go
func (f *GitserverClientListFilesFunc) appendCall(r0 GitserverClientListFilesFuncCall)
```

#### <a id="GitserverClientListFilesFunc.History" href="#GitserverClientListFilesFunc.History">func (f *GitserverClientListFilesFunc) History() []GitserverClientListFilesFuncCall</a>

```
searchKey: indexing.GitserverClientListFilesFunc.History
tags: [private]
```

```Go
func (f *GitserverClientListFilesFunc) History() []GitserverClientListFilesFuncCall
```

History returns a sequence of GitserverClientListFilesFuncCall objects describing the invocations of this function. 

### <a id="GitserverClientListFilesFuncCall" href="#GitserverClientListFilesFuncCall">type GitserverClientListFilesFuncCall struct</a>

```
searchKey: indexing.GitserverClientListFilesFuncCall
tags: [private]
```

```Go
type GitserverClientListFilesFuncCall struct {
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

GitserverClientListFilesFuncCall is an object that describes an invocation of method ListFiles on an instance of MockGitserverClient. 

#### <a id="GitserverClientListFilesFuncCall.Args" href="#GitserverClientListFilesFuncCall.Args">func (c GitserverClientListFilesFuncCall) Args() []interface{}</a>

```
searchKey: indexing.GitserverClientListFilesFuncCall.Args
tags: [private]
```

```Go
func (c GitserverClientListFilesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientListFilesFuncCall.Results" href="#GitserverClientListFilesFuncCall.Results">func (c GitserverClientListFilesFuncCall) Results() []interface{}</a>

```
searchKey: indexing.GitserverClientListFilesFuncCall.Results
tags: [private]
```

```Go
func (c GitserverClientListFilesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientRawContentsFunc" href="#GitserverClientRawContentsFunc">type GitserverClientRawContentsFunc struct</a>

```
searchKey: indexing.GitserverClientRawContentsFunc
tags: [private]
```

```Go
type GitserverClientRawContentsFunc struct {
	defaultHook func(context.Context, int, string, string) ([]byte, error)
	hooks       []func(context.Context, int, string, string) ([]byte, error)
	history     []GitserverClientRawContentsFuncCall
	mutex       sync.Mutex
}
```

GitserverClientRawContentsFunc describes the behavior when the RawContents method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientRawContentsFunc.SetDefaultHook" href="#GitserverClientRawContentsFunc.SetDefaultHook">func (f *GitserverClientRawContentsFunc) SetDefaultHook(hook func(context.Context, int, string, string) ([]byte, error))</a>

```
searchKey: indexing.GitserverClientRawContentsFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GitserverClientRawContentsFunc) SetDefaultHook(hook func(context.Context, int, string, string) ([]byte, error))
```

SetDefaultHook sets function that is called when the RawContents method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientRawContentsFunc.PushHook" href="#GitserverClientRawContentsFunc.PushHook">func (f *GitserverClientRawContentsFunc) PushHook(hook func(context.Context, int, string, string) ([]byte, error))</a>

```
searchKey: indexing.GitserverClientRawContentsFunc.PushHook
tags: [private]
```

```Go
func (f *GitserverClientRawContentsFunc) PushHook(hook func(context.Context, int, string, string) ([]byte, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the RawContents method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientRawContentsFunc.SetDefaultReturn" href="#GitserverClientRawContentsFunc.SetDefaultReturn">func (f *GitserverClientRawContentsFunc) SetDefaultReturn(r0 []byte, r1 error)</a>

```
searchKey: indexing.GitserverClientRawContentsFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GitserverClientRawContentsFunc) SetDefaultReturn(r0 []byte, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientRawContentsFunc.PushReturn" href="#GitserverClientRawContentsFunc.PushReturn">func (f *GitserverClientRawContentsFunc) PushReturn(r0 []byte, r1 error)</a>

```
searchKey: indexing.GitserverClientRawContentsFunc.PushReturn
tags: [private]
```

```Go
func (f *GitserverClientRawContentsFunc) PushReturn(r0 []byte, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientRawContentsFunc.nextHook" href="#GitserverClientRawContentsFunc.nextHook">func (f *GitserverClientRawContentsFunc) nextHook() func(context.Context, int, string, string) ([]byte, error)</a>

```
searchKey: indexing.GitserverClientRawContentsFunc.nextHook
tags: [private]
```

```Go
func (f *GitserverClientRawContentsFunc) nextHook() func(context.Context, int, string, string) ([]byte, error)
```

#### <a id="GitserverClientRawContentsFunc.appendCall" href="#GitserverClientRawContentsFunc.appendCall">func (f *GitserverClientRawContentsFunc) appendCall(r0 GitserverClientRawContentsFuncCall)</a>

```
searchKey: indexing.GitserverClientRawContentsFunc.appendCall
tags: [private]
```

```Go
func (f *GitserverClientRawContentsFunc) appendCall(r0 GitserverClientRawContentsFuncCall)
```

#### <a id="GitserverClientRawContentsFunc.History" href="#GitserverClientRawContentsFunc.History">func (f *GitserverClientRawContentsFunc) History() []GitserverClientRawContentsFuncCall</a>

```
searchKey: indexing.GitserverClientRawContentsFunc.History
tags: [private]
```

```Go
func (f *GitserverClientRawContentsFunc) History() []GitserverClientRawContentsFuncCall
```

History returns a sequence of GitserverClientRawContentsFuncCall objects describing the invocations of this function. 

### <a id="GitserverClientRawContentsFuncCall" href="#GitserverClientRawContentsFuncCall">type GitserverClientRawContentsFuncCall struct</a>

```
searchKey: indexing.GitserverClientRawContentsFuncCall
tags: [private]
```

```Go
type GitserverClientRawContentsFuncCall struct {
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

GitserverClientRawContentsFuncCall is an object that describes an invocation of method RawContents on an instance of MockGitserverClient. 

#### <a id="GitserverClientRawContentsFuncCall.Args" href="#GitserverClientRawContentsFuncCall.Args">func (c GitserverClientRawContentsFuncCall) Args() []interface{}</a>

```
searchKey: indexing.GitserverClientRawContentsFuncCall.Args
tags: [private]
```

```Go
func (c GitserverClientRawContentsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientRawContentsFuncCall.Results" href="#GitserverClientRawContentsFuncCall.Results">func (c GitserverClientRawContentsFuncCall) Results() []interface{}</a>

```
searchKey: indexing.GitserverClientRawContentsFuncCall.Results
tags: [private]
```

```Go
func (c GitserverClientRawContentsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientResolveRevisionFunc" href="#GitserverClientResolveRevisionFunc">type GitserverClientResolveRevisionFunc struct</a>

```
searchKey: indexing.GitserverClientResolveRevisionFunc
tags: [private]
```

```Go
type GitserverClientResolveRevisionFunc struct {
	defaultHook func(context.Context, int, string) (api.CommitID, error)
	hooks       []func(context.Context, int, string) (api.CommitID, error)
	history     []GitserverClientResolveRevisionFuncCall
	mutex       sync.Mutex
}
```

GitserverClientResolveRevisionFunc describes the behavior when the ResolveRevision method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientResolveRevisionFunc.SetDefaultHook" href="#GitserverClientResolveRevisionFunc.SetDefaultHook">func (f *GitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))</a>

```
searchKey: indexing.GitserverClientResolveRevisionFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))
```

SetDefaultHook sets function that is called when the ResolveRevision method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientResolveRevisionFunc.PushHook" href="#GitserverClientResolveRevisionFunc.PushHook">func (f *GitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))</a>

```
searchKey: indexing.GitserverClientResolveRevisionFunc.PushHook
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ResolveRevision method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientResolveRevisionFunc.SetDefaultReturn" href="#GitserverClientResolveRevisionFunc.SetDefaultReturn">func (f *GitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)</a>

```
searchKey: indexing.GitserverClientResolveRevisionFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientResolveRevisionFunc.PushReturn" href="#GitserverClientResolveRevisionFunc.PushReturn">func (f *GitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)</a>

```
searchKey: indexing.GitserverClientResolveRevisionFunc.PushReturn
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientResolveRevisionFunc.nextHook" href="#GitserverClientResolveRevisionFunc.nextHook">func (f *GitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)</a>

```
searchKey: indexing.GitserverClientResolveRevisionFunc.nextHook
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)
```

#### <a id="GitserverClientResolveRevisionFunc.appendCall" href="#GitserverClientResolveRevisionFunc.appendCall">func (f *GitserverClientResolveRevisionFunc) appendCall(r0 GitserverClientResolveRevisionFuncCall)</a>

```
searchKey: indexing.GitserverClientResolveRevisionFunc.appendCall
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) appendCall(r0 GitserverClientResolveRevisionFuncCall)
```

#### <a id="GitserverClientResolveRevisionFunc.History" href="#GitserverClientResolveRevisionFunc.History">func (f *GitserverClientResolveRevisionFunc) History() []GitserverClientResolveRevisionFuncCall</a>

```
searchKey: indexing.GitserverClientResolveRevisionFunc.History
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) History() []GitserverClientResolveRevisionFuncCall
```

History returns a sequence of GitserverClientResolveRevisionFuncCall objects describing the invocations of this function. 

### <a id="GitserverClientResolveRevisionFuncCall" href="#GitserverClientResolveRevisionFuncCall">type GitserverClientResolveRevisionFuncCall struct</a>

```
searchKey: indexing.GitserverClientResolveRevisionFuncCall
tags: [private]
```

```Go
type GitserverClientResolveRevisionFuncCall struct {
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

GitserverClientResolveRevisionFuncCall is an object that describes an invocation of method ResolveRevision on an instance of MockGitserverClient. 

#### <a id="GitserverClientResolveRevisionFuncCall.Args" href="#GitserverClientResolveRevisionFuncCall.Args">func (c GitserverClientResolveRevisionFuncCall) Args() []interface{}</a>

```
searchKey: indexing.GitserverClientResolveRevisionFuncCall.Args
tags: [private]
```

```Go
func (c GitserverClientResolveRevisionFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientResolveRevisionFuncCall.Results" href="#GitserverClientResolveRevisionFuncCall.Results">func (c GitserverClientResolveRevisionFuncCall) Results() []interface{}</a>

```
searchKey: indexing.GitserverClientResolveRevisionFuncCall.Results
tags: [private]
```

```Go
func (c GitserverClientResolveRevisionFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockIndexEnqueuer" href="#MockIndexEnqueuer">type MockIndexEnqueuer struct</a>

```
searchKey: indexing.MockIndexEnqueuer
tags: [private]
```

```Go
type MockIndexEnqueuer struct {
	// QueueIndexesForPackageFunc is an instance of a mock function object
	// controlling the behavior of the method QueueIndexesForPackage.
	QueueIndexesForPackageFunc *IndexEnqueuerQueueIndexesForPackageFunc
	// QueueIndexesForRepositoryFunc is an instance of a mock function
	// object controlling the behavior of the method
	// QueueIndexesForRepository.
	QueueIndexesForRepositoryFunc *IndexEnqueuerQueueIndexesForRepositoryFunc
}
```

MockIndexEnqueuer is a mock implementation of the IndexEnqueuer interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/indexing) used for unit testing. 

#### <a id="NewMockIndexEnqueuer" href="#NewMockIndexEnqueuer">func NewMockIndexEnqueuer() *MockIndexEnqueuer</a>

```
searchKey: indexing.NewMockIndexEnqueuer
tags: [private]
```

```Go
func NewMockIndexEnqueuer() *MockIndexEnqueuer
```

NewMockIndexEnqueuer creates a new mock of the IndexEnqueuer interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockIndexEnqueuerFrom" href="#NewMockIndexEnqueuerFrom">func NewMockIndexEnqueuerFrom(i IndexEnqueuer) *MockIndexEnqueuer</a>

```
searchKey: indexing.NewMockIndexEnqueuerFrom
tags: [private]
```

```Go
func NewMockIndexEnqueuerFrom(i IndexEnqueuer) *MockIndexEnqueuer
```

NewMockIndexEnqueuerFrom creates a new mock of the MockIndexEnqueuer interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockIndexEnqueuer.QueueIndexesForPackage" href="#MockIndexEnqueuer.QueueIndexesForPackage">func (m *MockIndexEnqueuer) QueueIndexesForPackage(v0 context.Context, v1 semantic.Package) error</a>

```
searchKey: indexing.MockIndexEnqueuer.QueueIndexesForPackage
tags: [private]
```

```Go
func (m *MockIndexEnqueuer) QueueIndexesForPackage(v0 context.Context, v1 semantic.Package) error
```

QueueIndexesForPackage delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockIndexEnqueuer.QueueIndexesForRepository" href="#MockIndexEnqueuer.QueueIndexesForRepository">func (m *MockIndexEnqueuer) QueueIndexesForRepository(v0 context.Context, v1 int) error</a>

```
searchKey: indexing.MockIndexEnqueuer.QueueIndexesForRepository
tags: [private]
```

```Go
func (m *MockIndexEnqueuer) QueueIndexesForRepository(v0 context.Context, v1 int) error
```

QueueIndexesForRepository delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="IndexEnqueuerQueueIndexesForPackageFunc" href="#IndexEnqueuerQueueIndexesForPackageFunc">type IndexEnqueuerQueueIndexesForPackageFunc struct</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFunc
tags: [private]
```

```Go
type IndexEnqueuerQueueIndexesForPackageFunc struct {
	defaultHook func(context.Context, semantic.Package) error
	hooks       []func(context.Context, semantic.Package) error
	history     []IndexEnqueuerQueueIndexesForPackageFuncCall
	mutex       sync.Mutex
}
```

IndexEnqueuerQueueIndexesForPackageFunc describes the behavior when the QueueIndexesForPackage method of the parent MockIndexEnqueuer instance is invoked. 

#### <a id="IndexEnqueuerQueueIndexesForPackageFunc.SetDefaultHook" href="#IndexEnqueuerQueueIndexesForPackageFunc.SetDefaultHook">func (f *IndexEnqueuerQueueIndexesForPackageFunc) SetDefaultHook(hook func(context.Context, semantic.Package) error)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForPackageFunc) SetDefaultHook(hook func(context.Context, semantic.Package) error)
```

SetDefaultHook sets function that is called when the QueueIndexesForPackage method of the parent MockIndexEnqueuer instance is invoked and the hook queue is empty. 

#### <a id="IndexEnqueuerQueueIndexesForPackageFunc.PushHook" href="#IndexEnqueuerQueueIndexesForPackageFunc.PushHook">func (f *IndexEnqueuerQueueIndexesForPackageFunc) PushHook(hook func(context.Context, semantic.Package) error)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFunc.PushHook
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForPackageFunc) PushHook(hook func(context.Context, semantic.Package) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the QueueIndexesForPackage method of the parent MockIndexEnqueuer instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="IndexEnqueuerQueueIndexesForPackageFunc.SetDefaultReturn" href="#IndexEnqueuerQueueIndexesForPackageFunc.SetDefaultReturn">func (f *IndexEnqueuerQueueIndexesForPackageFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForPackageFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="IndexEnqueuerQueueIndexesForPackageFunc.PushReturn" href="#IndexEnqueuerQueueIndexesForPackageFunc.PushReturn">func (f *IndexEnqueuerQueueIndexesForPackageFunc) PushReturn(r0 error)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFunc.PushReturn
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForPackageFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="IndexEnqueuerQueueIndexesForPackageFunc.nextHook" href="#IndexEnqueuerQueueIndexesForPackageFunc.nextHook">func (f *IndexEnqueuerQueueIndexesForPackageFunc) nextHook() func(context.Context, semantic.Package) error</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFunc.nextHook
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForPackageFunc) nextHook() func(context.Context, semantic.Package) error
```

#### <a id="IndexEnqueuerQueueIndexesForPackageFunc.appendCall" href="#IndexEnqueuerQueueIndexesForPackageFunc.appendCall">func (f *IndexEnqueuerQueueIndexesForPackageFunc) appendCall(r0 IndexEnqueuerQueueIndexesForPackageFuncCall)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFunc.appendCall
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForPackageFunc) appendCall(r0 IndexEnqueuerQueueIndexesForPackageFuncCall)
```

#### <a id="IndexEnqueuerQueueIndexesForPackageFunc.History" href="#IndexEnqueuerQueueIndexesForPackageFunc.History">func (f *IndexEnqueuerQueueIndexesForPackageFunc) History() []IndexEnqueuerQueueIndexesForPackageFuncCall</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFunc.History
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForPackageFunc) History() []IndexEnqueuerQueueIndexesForPackageFuncCall
```

History returns a sequence of IndexEnqueuerQueueIndexesForPackageFuncCall objects describing the invocations of this function. 

### <a id="IndexEnqueuerQueueIndexesForPackageFuncCall" href="#IndexEnqueuerQueueIndexesForPackageFuncCall">type IndexEnqueuerQueueIndexesForPackageFuncCall struct</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFuncCall
tags: [private]
```

```Go
type IndexEnqueuerQueueIndexesForPackageFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 semantic.Package
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

IndexEnqueuerQueueIndexesForPackageFuncCall is an object that describes an invocation of method QueueIndexesForPackage on an instance of MockIndexEnqueuer. 

#### <a id="IndexEnqueuerQueueIndexesForPackageFuncCall.Args" href="#IndexEnqueuerQueueIndexesForPackageFuncCall.Args">func (c IndexEnqueuerQueueIndexesForPackageFuncCall) Args() []interface{}</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFuncCall.Args
tags: [private]
```

```Go
func (c IndexEnqueuerQueueIndexesForPackageFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="IndexEnqueuerQueueIndexesForPackageFuncCall.Results" href="#IndexEnqueuerQueueIndexesForPackageFuncCall.Results">func (c IndexEnqueuerQueueIndexesForPackageFuncCall) Results() []interface{}</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForPackageFuncCall.Results
tags: [private]
```

```Go
func (c IndexEnqueuerQueueIndexesForPackageFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="IndexEnqueuerQueueIndexesForRepositoryFunc" href="#IndexEnqueuerQueueIndexesForRepositoryFunc">type IndexEnqueuerQueueIndexesForRepositoryFunc struct</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFunc
tags: [private]
```

```Go
type IndexEnqueuerQueueIndexesForRepositoryFunc struct {
	defaultHook func(context.Context, int) error
	hooks       []func(context.Context, int) error
	history     []IndexEnqueuerQueueIndexesForRepositoryFuncCall
	mutex       sync.Mutex
}
```

IndexEnqueuerQueueIndexesForRepositoryFunc describes the behavior when the QueueIndexesForRepository method of the parent MockIndexEnqueuer instance is invoked. 

#### <a id="IndexEnqueuerQueueIndexesForRepositoryFunc.SetDefaultHook" href="#IndexEnqueuerQueueIndexesForRepositoryFunc.SetDefaultHook">func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) SetDefaultHook(hook func(context.Context, int) error)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) SetDefaultHook(hook func(context.Context, int) error)
```

SetDefaultHook sets function that is called when the QueueIndexesForRepository method of the parent MockIndexEnqueuer instance is invoked and the hook queue is empty. 

#### <a id="IndexEnqueuerQueueIndexesForRepositoryFunc.PushHook" href="#IndexEnqueuerQueueIndexesForRepositoryFunc.PushHook">func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) PushHook(hook func(context.Context, int) error)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFunc.PushHook
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) PushHook(hook func(context.Context, int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the QueueIndexesForRepository method of the parent MockIndexEnqueuer instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="IndexEnqueuerQueueIndexesForRepositoryFunc.SetDefaultReturn" href="#IndexEnqueuerQueueIndexesForRepositoryFunc.SetDefaultReturn">func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="IndexEnqueuerQueueIndexesForRepositoryFunc.PushReturn" href="#IndexEnqueuerQueueIndexesForRepositoryFunc.PushReturn">func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) PushReturn(r0 error)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFunc.PushReturn
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="IndexEnqueuerQueueIndexesForRepositoryFunc.nextHook" href="#IndexEnqueuerQueueIndexesForRepositoryFunc.nextHook">func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) nextHook() func(context.Context, int) error</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFunc.nextHook
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) nextHook() func(context.Context, int) error
```

#### <a id="IndexEnqueuerQueueIndexesForRepositoryFunc.appendCall" href="#IndexEnqueuerQueueIndexesForRepositoryFunc.appendCall">func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) appendCall(r0 IndexEnqueuerQueueIndexesForRepositoryFuncCall)</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFunc.appendCall
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) appendCall(r0 IndexEnqueuerQueueIndexesForRepositoryFuncCall)
```

#### <a id="IndexEnqueuerQueueIndexesForRepositoryFunc.History" href="#IndexEnqueuerQueueIndexesForRepositoryFunc.History">func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) History() []IndexEnqueuerQueueIndexesForRepositoryFuncCall</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFunc.History
tags: [private]
```

```Go
func (f *IndexEnqueuerQueueIndexesForRepositoryFunc) History() []IndexEnqueuerQueueIndexesForRepositoryFuncCall
```

History returns a sequence of IndexEnqueuerQueueIndexesForRepositoryFuncCall objects describing the invocations of this function. 

### <a id="IndexEnqueuerQueueIndexesForRepositoryFuncCall" href="#IndexEnqueuerQueueIndexesForRepositoryFuncCall">type IndexEnqueuerQueueIndexesForRepositoryFuncCall struct</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFuncCall
tags: [private]
```

```Go
type IndexEnqueuerQueueIndexesForRepositoryFuncCall struct {
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

IndexEnqueuerQueueIndexesForRepositoryFuncCall is an object that describes an invocation of method QueueIndexesForRepository on an instance of MockIndexEnqueuer. 

#### <a id="IndexEnqueuerQueueIndexesForRepositoryFuncCall.Args" href="#IndexEnqueuerQueueIndexesForRepositoryFuncCall.Args">func (c IndexEnqueuerQueueIndexesForRepositoryFuncCall) Args() []interface{}</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFuncCall.Args
tags: [private]
```

```Go
func (c IndexEnqueuerQueueIndexesForRepositoryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="IndexEnqueuerQueueIndexesForRepositoryFuncCall.Results" href="#IndexEnqueuerQueueIndexesForRepositoryFuncCall.Results">func (c IndexEnqueuerQueueIndexesForRepositoryFuncCall) Results() []interface{}</a>

```
searchKey: indexing.IndexEnqueuerQueueIndexesForRepositoryFuncCall.Results
tags: [private]
```

```Go
func (c IndexEnqueuerQueueIndexesForRepositoryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockIndexingRepoStore" href="#MockIndexingRepoStore">type MockIndexingRepoStore struct</a>

```
searchKey: indexing.MockIndexingRepoStore
tags: [private]
```

```Go
type MockIndexingRepoStore struct {
	// ListRepoNamesFunc is an instance of a mock function object
	// controlling the behavior of the method ListRepoNames.
	ListRepoNamesFunc *IndexingRepoStoreListRepoNamesFunc
}
```

MockIndexingRepoStore is a mock implementation of the IndexingRepoStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/indexing) used for unit testing. 

#### <a id="NewMockIndexingRepoStore" href="#NewMockIndexingRepoStore">func NewMockIndexingRepoStore() *MockIndexingRepoStore</a>

```
searchKey: indexing.NewMockIndexingRepoStore
tags: [private]
```

```Go
func NewMockIndexingRepoStore() *MockIndexingRepoStore
```

NewMockIndexingRepoStore creates a new mock of the IndexingRepoStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockIndexingRepoStoreFrom" href="#NewMockIndexingRepoStoreFrom">func NewMockIndexingRepoStoreFrom(i IndexingRepoStore) *MockIndexingRepoStore</a>

```
searchKey: indexing.NewMockIndexingRepoStoreFrom
tags: [private]
```

```Go
func NewMockIndexingRepoStoreFrom(i IndexingRepoStore) *MockIndexingRepoStore
```

NewMockIndexingRepoStoreFrom creates a new mock of the MockIndexingRepoStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockIndexingRepoStore.ListRepoNames" href="#MockIndexingRepoStore.ListRepoNames">func (m *MockIndexingRepoStore) ListRepoNames(v0 context.Context, v1 database.ReposListOptions) ([]types.RepoName, error)</a>

```
searchKey: indexing.MockIndexingRepoStore.ListRepoNames
tags: [private]
```

```Go
func (m *MockIndexingRepoStore) ListRepoNames(v0 context.Context, v1 database.ReposListOptions) ([]types.RepoName, error)
```

ListRepoNames delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="IndexingRepoStoreListRepoNamesFunc" href="#IndexingRepoStoreListRepoNamesFunc">type IndexingRepoStoreListRepoNamesFunc struct</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFunc
tags: [private]
```

```Go
type IndexingRepoStoreListRepoNamesFunc struct {
	defaultHook func(context.Context, database.ReposListOptions) ([]types.RepoName, error)
	hooks       []func(context.Context, database.ReposListOptions) ([]types.RepoName, error)
	history     []IndexingRepoStoreListRepoNamesFuncCall
	mutex       sync.Mutex
}
```

IndexingRepoStoreListRepoNamesFunc describes the behavior when the ListRepoNames method of the parent MockIndexingRepoStore instance is invoked. 

#### <a id="IndexingRepoStoreListRepoNamesFunc.SetDefaultHook" href="#IndexingRepoStoreListRepoNamesFunc.SetDefaultHook">func (f *IndexingRepoStoreListRepoNamesFunc) SetDefaultHook(hook func(context.Context, database.ReposListOptions) ([]types.RepoName, error))</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *IndexingRepoStoreListRepoNamesFunc) SetDefaultHook(hook func(context.Context, database.ReposListOptions) ([]types.RepoName, error))
```

SetDefaultHook sets function that is called when the ListRepoNames method of the parent MockIndexingRepoStore instance is invoked and the hook queue is empty. 

#### <a id="IndexingRepoStoreListRepoNamesFunc.PushHook" href="#IndexingRepoStoreListRepoNamesFunc.PushHook">func (f *IndexingRepoStoreListRepoNamesFunc) PushHook(hook func(context.Context, database.ReposListOptions) ([]types.RepoName, error))</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFunc.PushHook
tags: [private]
```

```Go
func (f *IndexingRepoStoreListRepoNamesFunc) PushHook(hook func(context.Context, database.ReposListOptions) ([]types.RepoName, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ListRepoNames method of the parent MockIndexingRepoStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="IndexingRepoStoreListRepoNamesFunc.SetDefaultReturn" href="#IndexingRepoStoreListRepoNamesFunc.SetDefaultReturn">func (f *IndexingRepoStoreListRepoNamesFunc) SetDefaultReturn(r0 []types.RepoName, r1 error)</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *IndexingRepoStoreListRepoNamesFunc) SetDefaultReturn(r0 []types.RepoName, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="IndexingRepoStoreListRepoNamesFunc.PushReturn" href="#IndexingRepoStoreListRepoNamesFunc.PushReturn">func (f *IndexingRepoStoreListRepoNamesFunc) PushReturn(r0 []types.RepoName, r1 error)</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFunc.PushReturn
tags: [private]
```

```Go
func (f *IndexingRepoStoreListRepoNamesFunc) PushReturn(r0 []types.RepoName, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="IndexingRepoStoreListRepoNamesFunc.nextHook" href="#IndexingRepoStoreListRepoNamesFunc.nextHook">func (f *IndexingRepoStoreListRepoNamesFunc) nextHook() func(context.Context, database.ReposListOptions) ([]types.RepoName, error)</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFunc.nextHook
tags: [private]
```

```Go
func (f *IndexingRepoStoreListRepoNamesFunc) nextHook() func(context.Context, database.ReposListOptions) ([]types.RepoName, error)
```

#### <a id="IndexingRepoStoreListRepoNamesFunc.appendCall" href="#IndexingRepoStoreListRepoNamesFunc.appendCall">func (f *IndexingRepoStoreListRepoNamesFunc) appendCall(r0 IndexingRepoStoreListRepoNamesFuncCall)</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFunc.appendCall
tags: [private]
```

```Go
func (f *IndexingRepoStoreListRepoNamesFunc) appendCall(r0 IndexingRepoStoreListRepoNamesFuncCall)
```

#### <a id="IndexingRepoStoreListRepoNamesFunc.History" href="#IndexingRepoStoreListRepoNamesFunc.History">func (f *IndexingRepoStoreListRepoNamesFunc) History() []IndexingRepoStoreListRepoNamesFuncCall</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFunc.History
tags: [private]
```

```Go
func (f *IndexingRepoStoreListRepoNamesFunc) History() []IndexingRepoStoreListRepoNamesFuncCall
```

History returns a sequence of IndexingRepoStoreListRepoNamesFuncCall objects describing the invocations of this function. 

### <a id="IndexingRepoStoreListRepoNamesFuncCall" href="#IndexingRepoStoreListRepoNamesFuncCall">type IndexingRepoStoreListRepoNamesFuncCall struct</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFuncCall
tags: [private]
```

```Go
type IndexingRepoStoreListRepoNamesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 database.ReposListOptions
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []types.RepoName
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

IndexingRepoStoreListRepoNamesFuncCall is an object that describes an invocation of method ListRepoNames on an instance of MockIndexingRepoStore. 

#### <a id="IndexingRepoStoreListRepoNamesFuncCall.Args" href="#IndexingRepoStoreListRepoNamesFuncCall.Args">func (c IndexingRepoStoreListRepoNamesFuncCall) Args() []interface{}</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFuncCall.Args
tags: [private]
```

```Go
func (c IndexingRepoStoreListRepoNamesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="IndexingRepoStoreListRepoNamesFuncCall.Results" href="#IndexingRepoStoreListRepoNamesFuncCall.Results">func (c IndexingRepoStoreListRepoNamesFuncCall) Results() []interface{}</a>

```
searchKey: indexing.IndexingRepoStoreListRepoNamesFuncCall.Results
tags: [private]
```

```Go
func (c IndexingRepoStoreListRepoNamesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockIndexingSettingStore" href="#MockIndexingSettingStore">type MockIndexingSettingStore struct</a>

```
searchKey: indexing.MockIndexingSettingStore
tags: [private]
```

```Go
type MockIndexingSettingStore struct {
	// GetLastestSchemaSettingsFunc is an instance of a mock function object
	// controlling the behavior of the method GetLastestSchemaSettings.
	GetLastestSchemaSettingsFunc *IndexingSettingStoreGetLastestSchemaSettingsFunc
}
```

MockIndexingSettingStore is a mock implementation of the IndexingSettingStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/indexing) used for unit testing. 

#### <a id="NewMockIndexingSettingStore" href="#NewMockIndexingSettingStore">func NewMockIndexingSettingStore() *MockIndexingSettingStore</a>

```
searchKey: indexing.NewMockIndexingSettingStore
tags: [private]
```

```Go
func NewMockIndexingSettingStore() *MockIndexingSettingStore
```

NewMockIndexingSettingStore creates a new mock of the IndexingSettingStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockIndexingSettingStoreFrom" href="#NewMockIndexingSettingStoreFrom">func NewMockIndexingSettingStoreFrom(i IndexingSettingStore) *MockIndexingSettingStore</a>

```
searchKey: indexing.NewMockIndexingSettingStoreFrom
tags: [private]
```

```Go
func NewMockIndexingSettingStoreFrom(i IndexingSettingStore) *MockIndexingSettingStore
```

NewMockIndexingSettingStoreFrom creates a new mock of the MockIndexingSettingStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockIndexingSettingStore.GetLastestSchemaSettings" href="#MockIndexingSettingStore.GetLastestSchemaSettings">func (m *MockIndexingSettingStore) GetLastestSchemaSettings(v0 context.Context, v1 api.SettingsSubject) (*schema.Settings, error)</a>

```
searchKey: indexing.MockIndexingSettingStore.GetLastestSchemaSettings
tags: [private]
```

```Go
func (m *MockIndexingSettingStore) GetLastestSchemaSettings(v0 context.Context, v1 api.SettingsSubject) (*schema.Settings, error)
```

GetLastestSchemaSettings delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="IndexingSettingStoreGetLastestSchemaSettingsFunc" href="#IndexingSettingStoreGetLastestSchemaSettingsFunc">type IndexingSettingStoreGetLastestSchemaSettingsFunc struct</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFunc
tags: [private]
```

```Go
type IndexingSettingStoreGetLastestSchemaSettingsFunc struct {
	defaultHook func(context.Context, api.SettingsSubject) (*schema.Settings, error)
	hooks       []func(context.Context, api.SettingsSubject) (*schema.Settings, error)
	history     []IndexingSettingStoreGetLastestSchemaSettingsFuncCall
	mutex       sync.Mutex
}
```

IndexingSettingStoreGetLastestSchemaSettingsFunc describes the behavior when the GetLastestSchemaSettings method of the parent MockIndexingSettingStore instance is invoked. 

#### <a id="IndexingSettingStoreGetLastestSchemaSettingsFunc.SetDefaultHook" href="#IndexingSettingStoreGetLastestSchemaSettingsFunc.SetDefaultHook">func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) SetDefaultHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) SetDefaultHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))
```

SetDefaultHook sets function that is called when the GetLastestSchemaSettings method of the parent MockIndexingSettingStore instance is invoked and the hook queue is empty. 

#### <a id="IndexingSettingStoreGetLastestSchemaSettingsFunc.PushHook" href="#IndexingSettingStoreGetLastestSchemaSettingsFunc.PushHook">func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) PushHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFunc.PushHook
tags: [private]
```

```Go
func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) PushHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetLastestSchemaSettings method of the parent MockIndexingSettingStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="IndexingSettingStoreGetLastestSchemaSettingsFunc.SetDefaultReturn" href="#IndexingSettingStoreGetLastestSchemaSettingsFunc.SetDefaultReturn">func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) SetDefaultReturn(r0 *schema.Settings, r1 error)</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) SetDefaultReturn(r0 *schema.Settings, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="IndexingSettingStoreGetLastestSchemaSettingsFunc.PushReturn" href="#IndexingSettingStoreGetLastestSchemaSettingsFunc.PushReturn">func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) PushReturn(r0 *schema.Settings, r1 error)</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFunc.PushReturn
tags: [private]
```

```Go
func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) PushReturn(r0 *schema.Settings, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="IndexingSettingStoreGetLastestSchemaSettingsFunc.nextHook" href="#IndexingSettingStoreGetLastestSchemaSettingsFunc.nextHook">func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) nextHook() func(context.Context, api.SettingsSubject) (*schema.Settings, error)</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFunc.nextHook
tags: [private]
```

```Go
func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) nextHook() func(context.Context, api.SettingsSubject) (*schema.Settings, error)
```

#### <a id="IndexingSettingStoreGetLastestSchemaSettingsFunc.appendCall" href="#IndexingSettingStoreGetLastestSchemaSettingsFunc.appendCall">func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) appendCall(r0 IndexingSettingStoreGetLastestSchemaSettingsFuncCall)</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFunc.appendCall
tags: [private]
```

```Go
func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) appendCall(r0 IndexingSettingStoreGetLastestSchemaSettingsFuncCall)
```

#### <a id="IndexingSettingStoreGetLastestSchemaSettingsFunc.History" href="#IndexingSettingStoreGetLastestSchemaSettingsFunc.History">func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) History() []IndexingSettingStoreGetLastestSchemaSettingsFuncCall</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFunc.History
tags: [private]
```

```Go
func (f *IndexingSettingStoreGetLastestSchemaSettingsFunc) History() []IndexingSettingStoreGetLastestSchemaSettingsFuncCall
```

History returns a sequence of IndexingSettingStoreGetLastestSchemaSettingsFuncCall objects describing the invocations of this function. 

### <a id="IndexingSettingStoreGetLastestSchemaSettingsFuncCall" href="#IndexingSettingStoreGetLastestSchemaSettingsFuncCall">type IndexingSettingStoreGetLastestSchemaSettingsFuncCall struct</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFuncCall
tags: [private]
```

```Go
type IndexingSettingStoreGetLastestSchemaSettingsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.SettingsSubject
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *schema.Settings
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

IndexingSettingStoreGetLastestSchemaSettingsFuncCall is an object that describes an invocation of method GetLastestSchemaSettings on an instance of MockIndexingSettingStore. 

#### <a id="IndexingSettingStoreGetLastestSchemaSettingsFuncCall.Args" href="#IndexingSettingStoreGetLastestSchemaSettingsFuncCall.Args">func (c IndexingSettingStoreGetLastestSchemaSettingsFuncCall) Args() []interface{}</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFuncCall.Args
tags: [private]
```

```Go
func (c IndexingSettingStoreGetLastestSchemaSettingsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="IndexingSettingStoreGetLastestSchemaSettingsFuncCall.Results" href="#IndexingSettingStoreGetLastestSchemaSettingsFuncCall.Results">func (c IndexingSettingStoreGetLastestSchemaSettingsFuncCall) Results() []interface{}</a>

```
searchKey: indexing.IndexingSettingStoreGetLastestSchemaSettingsFuncCall.Results
tags: [private]
```

```Go
func (c IndexingSettingStoreGetLastestSchemaSettingsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockPackageReferenceScanner" href="#MockPackageReferenceScanner">type MockPackageReferenceScanner struct</a>

```
searchKey: indexing.MockPackageReferenceScanner
tags: [private]
```

```Go
type MockPackageReferenceScanner struct {
	// CloseFunc is an instance of a mock function object controlling the
	// behavior of the method Close.
	CloseFunc *PackageReferenceScannerCloseFunc
	// NextFunc is an instance of a mock function object controlling the
	// behavior of the method Next.
	NextFunc *PackageReferenceScannerNextFunc
}
```

MockPackageReferenceScanner is a mock implementation of the PackageReferenceScanner interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/dbstore) used for unit testing. 

#### <a id="NewMockPackageReferenceScanner" href="#NewMockPackageReferenceScanner">func NewMockPackageReferenceScanner() *MockPackageReferenceScanner</a>

```
searchKey: indexing.NewMockPackageReferenceScanner
tags: [private]
```

```Go
func NewMockPackageReferenceScanner() *MockPackageReferenceScanner
```

NewMockPackageReferenceScanner creates a new mock of the PackageReferenceScanner interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockPackageReferenceScannerFrom" href="#NewMockPackageReferenceScannerFrom">func NewMockPackageReferenceScannerFrom(i dbstore.PackageReferenceScanner) *MockPackageReferenceScanner</a>

```
searchKey: indexing.NewMockPackageReferenceScannerFrom
tags: [private]
```

```Go
func NewMockPackageReferenceScannerFrom(i dbstore.PackageReferenceScanner) *MockPackageReferenceScanner
```

NewMockPackageReferenceScannerFrom creates a new mock of the MockPackageReferenceScanner interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockPackageReferenceScanner.Close" href="#MockPackageReferenceScanner.Close">func (m *MockPackageReferenceScanner) Close() error</a>

```
searchKey: indexing.MockPackageReferenceScanner.Close
tags: [private]
```

```Go
func (m *MockPackageReferenceScanner) Close() error
```

Close delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockPackageReferenceScanner.Next" href="#MockPackageReferenceScanner.Next">func (m *MockPackageReferenceScanner) Next() (lsifstore.PackageReference, bool, error)</a>

```
searchKey: indexing.MockPackageReferenceScanner.Next
tags: [private]
```

```Go
func (m *MockPackageReferenceScanner) Next() (lsifstore.PackageReference, bool, error)
```

Next delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="PackageReferenceScannerCloseFunc" href="#PackageReferenceScannerCloseFunc">type PackageReferenceScannerCloseFunc struct</a>

```
searchKey: indexing.PackageReferenceScannerCloseFunc
tags: [private]
```

```Go
type PackageReferenceScannerCloseFunc struct {
	defaultHook func() error
	hooks       []func() error
	history     []PackageReferenceScannerCloseFuncCall
	mutex       sync.Mutex
}
```

PackageReferenceScannerCloseFunc describes the behavior when the Close method of the parent MockPackageReferenceScanner instance is invoked. 

#### <a id="PackageReferenceScannerCloseFunc.SetDefaultHook" href="#PackageReferenceScannerCloseFunc.SetDefaultHook">func (f *PackageReferenceScannerCloseFunc) SetDefaultHook(hook func() error)</a>

```
searchKey: indexing.PackageReferenceScannerCloseFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *PackageReferenceScannerCloseFunc) SetDefaultHook(hook func() error)
```

SetDefaultHook sets function that is called when the Close method of the parent MockPackageReferenceScanner instance is invoked and the hook queue is empty. 

#### <a id="PackageReferenceScannerCloseFunc.PushHook" href="#PackageReferenceScannerCloseFunc.PushHook">func (f *PackageReferenceScannerCloseFunc) PushHook(hook func() error)</a>

```
searchKey: indexing.PackageReferenceScannerCloseFunc.PushHook
tags: [private]
```

```Go
func (f *PackageReferenceScannerCloseFunc) PushHook(hook func() error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Close method of the parent MockPackageReferenceScanner instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="PackageReferenceScannerCloseFunc.SetDefaultReturn" href="#PackageReferenceScannerCloseFunc.SetDefaultReturn">func (f *PackageReferenceScannerCloseFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: indexing.PackageReferenceScannerCloseFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *PackageReferenceScannerCloseFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="PackageReferenceScannerCloseFunc.PushReturn" href="#PackageReferenceScannerCloseFunc.PushReturn">func (f *PackageReferenceScannerCloseFunc) PushReturn(r0 error)</a>

```
searchKey: indexing.PackageReferenceScannerCloseFunc.PushReturn
tags: [private]
```

```Go
func (f *PackageReferenceScannerCloseFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="PackageReferenceScannerCloseFunc.nextHook" href="#PackageReferenceScannerCloseFunc.nextHook">func (f *PackageReferenceScannerCloseFunc) nextHook() func() error</a>

```
searchKey: indexing.PackageReferenceScannerCloseFunc.nextHook
tags: [private]
```

```Go
func (f *PackageReferenceScannerCloseFunc) nextHook() func() error
```

#### <a id="PackageReferenceScannerCloseFunc.appendCall" href="#PackageReferenceScannerCloseFunc.appendCall">func (f *PackageReferenceScannerCloseFunc) appendCall(r0 PackageReferenceScannerCloseFuncCall)</a>

```
searchKey: indexing.PackageReferenceScannerCloseFunc.appendCall
tags: [private]
```

```Go
func (f *PackageReferenceScannerCloseFunc) appendCall(r0 PackageReferenceScannerCloseFuncCall)
```

#### <a id="PackageReferenceScannerCloseFunc.History" href="#PackageReferenceScannerCloseFunc.History">func (f *PackageReferenceScannerCloseFunc) History() []PackageReferenceScannerCloseFuncCall</a>

```
searchKey: indexing.PackageReferenceScannerCloseFunc.History
tags: [private]
```

```Go
func (f *PackageReferenceScannerCloseFunc) History() []PackageReferenceScannerCloseFuncCall
```

History returns a sequence of PackageReferenceScannerCloseFuncCall objects describing the invocations of this function. 

### <a id="PackageReferenceScannerCloseFuncCall" href="#PackageReferenceScannerCloseFuncCall">type PackageReferenceScannerCloseFuncCall struct</a>

```
searchKey: indexing.PackageReferenceScannerCloseFuncCall
tags: [private]
```

```Go
type PackageReferenceScannerCloseFuncCall struct {
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

PackageReferenceScannerCloseFuncCall is an object that describes an invocation of method Close on an instance of MockPackageReferenceScanner. 

#### <a id="PackageReferenceScannerCloseFuncCall.Args" href="#PackageReferenceScannerCloseFuncCall.Args">func (c PackageReferenceScannerCloseFuncCall) Args() []interface{}</a>

```
searchKey: indexing.PackageReferenceScannerCloseFuncCall.Args
tags: [private]
```

```Go
func (c PackageReferenceScannerCloseFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="PackageReferenceScannerCloseFuncCall.Results" href="#PackageReferenceScannerCloseFuncCall.Results">func (c PackageReferenceScannerCloseFuncCall) Results() []interface{}</a>

```
searchKey: indexing.PackageReferenceScannerCloseFuncCall.Results
tags: [private]
```

```Go
func (c PackageReferenceScannerCloseFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="PackageReferenceScannerNextFunc" href="#PackageReferenceScannerNextFunc">type PackageReferenceScannerNextFunc struct</a>

```
searchKey: indexing.PackageReferenceScannerNextFunc
tags: [private]
```

```Go
type PackageReferenceScannerNextFunc struct {
	defaultHook func() (lsifstore.PackageReference, bool, error)
	hooks       []func() (lsifstore.PackageReference, bool, error)
	history     []PackageReferenceScannerNextFuncCall
	mutex       sync.Mutex
}
```

PackageReferenceScannerNextFunc describes the behavior when the Next method of the parent MockPackageReferenceScanner instance is invoked. 

#### <a id="PackageReferenceScannerNextFunc.SetDefaultHook" href="#PackageReferenceScannerNextFunc.SetDefaultHook">func (f *PackageReferenceScannerNextFunc) SetDefaultHook(hook func() (lsifstore.PackageReference, bool, error))</a>

```
searchKey: indexing.PackageReferenceScannerNextFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *PackageReferenceScannerNextFunc) SetDefaultHook(hook func() (lsifstore.PackageReference, bool, error))
```

SetDefaultHook sets function that is called when the Next method of the parent MockPackageReferenceScanner instance is invoked and the hook queue is empty. 

#### <a id="PackageReferenceScannerNextFunc.PushHook" href="#PackageReferenceScannerNextFunc.PushHook">func (f *PackageReferenceScannerNextFunc) PushHook(hook func() (lsifstore.PackageReference, bool, error))</a>

```
searchKey: indexing.PackageReferenceScannerNextFunc.PushHook
tags: [private]
```

```Go
func (f *PackageReferenceScannerNextFunc) PushHook(hook func() (lsifstore.PackageReference, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Next method of the parent MockPackageReferenceScanner instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="PackageReferenceScannerNextFunc.SetDefaultReturn" href="#PackageReferenceScannerNextFunc.SetDefaultReturn">func (f *PackageReferenceScannerNextFunc) SetDefaultReturn(r0 lsifstore.PackageReference, r1 bool, r2 error)</a>

```
searchKey: indexing.PackageReferenceScannerNextFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *PackageReferenceScannerNextFunc) SetDefaultReturn(r0 lsifstore.PackageReference, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="PackageReferenceScannerNextFunc.PushReturn" href="#PackageReferenceScannerNextFunc.PushReturn">func (f *PackageReferenceScannerNextFunc) PushReturn(r0 lsifstore.PackageReference, r1 bool, r2 error)</a>

```
searchKey: indexing.PackageReferenceScannerNextFunc.PushReturn
tags: [private]
```

```Go
func (f *PackageReferenceScannerNextFunc) PushReturn(r0 lsifstore.PackageReference, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="PackageReferenceScannerNextFunc.nextHook" href="#PackageReferenceScannerNextFunc.nextHook">func (f *PackageReferenceScannerNextFunc) nextHook() func() (lsifstore.PackageReference, bool, error)</a>

```
searchKey: indexing.PackageReferenceScannerNextFunc.nextHook
tags: [private]
```

```Go
func (f *PackageReferenceScannerNextFunc) nextHook() func() (lsifstore.PackageReference, bool, error)
```

#### <a id="PackageReferenceScannerNextFunc.appendCall" href="#PackageReferenceScannerNextFunc.appendCall">func (f *PackageReferenceScannerNextFunc) appendCall(r0 PackageReferenceScannerNextFuncCall)</a>

```
searchKey: indexing.PackageReferenceScannerNextFunc.appendCall
tags: [private]
```

```Go
func (f *PackageReferenceScannerNextFunc) appendCall(r0 PackageReferenceScannerNextFuncCall)
```

#### <a id="PackageReferenceScannerNextFunc.History" href="#PackageReferenceScannerNextFunc.History">func (f *PackageReferenceScannerNextFunc) History() []PackageReferenceScannerNextFuncCall</a>

```
searchKey: indexing.PackageReferenceScannerNextFunc.History
tags: [private]
```

```Go
func (f *PackageReferenceScannerNextFunc) History() []PackageReferenceScannerNextFuncCall
```

History returns a sequence of PackageReferenceScannerNextFuncCall objects describing the invocations of this function. 

### <a id="PackageReferenceScannerNextFuncCall" href="#PackageReferenceScannerNextFuncCall">type PackageReferenceScannerNextFuncCall struct</a>

```
searchKey: indexing.PackageReferenceScannerNextFuncCall
tags: [private]
```

```Go
type PackageReferenceScannerNextFuncCall struct {
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 lsifstore.PackageReference
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 bool
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

PackageReferenceScannerNextFuncCall is an object that describes an invocation of method Next on an instance of MockPackageReferenceScanner. 

#### <a id="PackageReferenceScannerNextFuncCall.Args" href="#PackageReferenceScannerNextFuncCall.Args">func (c PackageReferenceScannerNextFuncCall) Args() []interface{}</a>

```
searchKey: indexing.PackageReferenceScannerNextFuncCall.Args
tags: [private]
```

```Go
func (c PackageReferenceScannerNextFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="PackageReferenceScannerNextFuncCall.Results" href="#PackageReferenceScannerNextFuncCall.Results">func (c PackageReferenceScannerNextFuncCall) Results() []interface{}</a>

```
searchKey: indexing.PackageReferenceScannerNextFuncCall.Results
tags: [private]
```

```Go
func (c PackageReferenceScannerNextFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewDependencyIndexingScheduler" href="#NewDependencyIndexingScheduler">func NewDependencyIndexingScheduler(dbStore DBStore,...</a>

```
searchKey: indexing.NewDependencyIndexingScheduler
```

```Go
func NewDependencyIndexingScheduler(
	dbStore DBStore,
	workerStore dbworkerstore.Store,
	enqueuer IndexEnqueuer,
	pollInterval time.Duration,
	numProcessorRoutines int,
	workerMetrics workerutil.WorkerMetrics,
) *workerutil.Worker
```

NewDependencyIndexingScheduler returns a new worker instance that processes records from lsif_dependency_indexing_jobs. 

### <a id="NewIndexScheduler" href="#NewIndexScheduler">func NewIndexScheduler(dbStore DBStore,...</a>

```
searchKey: indexing.NewIndexScheduler
```

```Go
func NewIndexScheduler(
	dbStore DBStore,
	settingStore IndexingSettingStore,
	repoStore IndexingRepoStore,
	indexEnqueuer IndexEnqueuer,
	interval time.Duration,
	observationContext *observation.Context,
) goroutine.BackgroundRoutine
```

### <a id="deduplicateRepositoryIDs" href="#deduplicateRepositoryIDs">func deduplicateRepositoryIDs(ids ...[]int) (repositoryIDs []int)</a>

```
searchKey: indexing.deduplicateRepositoryIDs
tags: [private]
```

```Go
func deduplicateRepositoryIDs(ids ...[]int) (repositoryIDs []int)
```

### <a id="isRepoNotExist" href="#isRepoNotExist">func isRepoNotExist(err error) bool</a>

```
searchKey: indexing.isRepoNotExist
tags: [private]
```

```Go
func isRepoNotExist(err error) bool
```

### <a id="TestDependencyIndexingSchedulerHandler" href="#TestDependencyIndexingSchedulerHandler">func TestDependencyIndexingSchedulerHandler(t *testing.T)</a>

```
searchKey: indexing.TestDependencyIndexingSchedulerHandler
tags: [private]
```

```Go
func TestDependencyIndexingSchedulerHandler(t *testing.T)
```

### <a id="TestDependencyIndexingSchedulerHandlerShouldSkipRepository" href="#TestDependencyIndexingSchedulerHandlerShouldSkipRepository">func TestDependencyIndexingSchedulerHandlerShouldSkipRepository(t *testing.T)</a>

```
searchKey: indexing.TestDependencyIndexingSchedulerHandlerShouldSkipRepository
tags: [private]
```

```Go
func TestDependencyIndexingSchedulerHandlerShouldSkipRepository(t *testing.T)
```

### <a id="init.index_scheduler_test.go" href="#init.index_scheduler_test.go">func init()</a>

```
searchKey: indexing.init
tags: [private]
```

```Go
func init()
```

### <a id="TestIndexSchedulerUpdate" href="#TestIndexSchedulerUpdate">func TestIndexSchedulerUpdate(t *testing.T)</a>

```
searchKey: indexing.TestIndexSchedulerUpdate
tags: [private]
```

```Go
func TestIndexSchedulerUpdate(t *testing.T)
```

### <a id="TestDisabledAutoindexConfiguration" href="#TestDisabledAutoindexConfiguration">func TestDisabledAutoindexConfiguration(t *testing.T)</a>

```
searchKey: indexing.TestDisabledAutoindexConfiguration
tags: [private]
```

```Go
func TestDisabledAutoindexConfiguration(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: indexing.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

