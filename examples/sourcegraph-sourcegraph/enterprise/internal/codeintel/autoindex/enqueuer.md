# Package enqueuer

## Index

* [Constants](#const)
    * [const GitHubScheme](#GitHubScheme)
    * [const defaultMaxJobsPerCommit](#defaultMaxJobsPerCommit)
* [Variables](#var)
    * [var goVersionPattern](#goVersionPattern)
    * [var yamlIndexConfiguration](#yamlIndexConfiguration)
* [Types](#type)
    * [type DBStore interface](#DBStore)
    * [type DBStoreDirtyRepositoriesFunc struct](#DBStoreDirtyRepositoriesFunc)
        * [func (f *DBStoreDirtyRepositoriesFunc) History() []DBStoreDirtyRepositoriesFuncCall](#DBStoreDirtyRepositoriesFunc.History)
        * [func (f *DBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))](#DBStoreDirtyRepositoriesFunc.PushHook)
        * [func (f *DBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)](#DBStoreDirtyRepositoriesFunc.PushReturn)
        * [func (f *DBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))](#DBStoreDirtyRepositoriesFunc.SetDefaultHook)
        * [func (f *DBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)](#DBStoreDirtyRepositoriesFunc.SetDefaultReturn)
        * [func (f *DBStoreDirtyRepositoriesFunc) appendCall(r0 DBStoreDirtyRepositoriesFuncCall)](#DBStoreDirtyRepositoriesFunc.appendCall)
        * [func (f *DBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)](#DBStoreDirtyRepositoriesFunc.nextHook)
    * [type DBStoreDirtyRepositoriesFuncCall struct](#DBStoreDirtyRepositoriesFuncCall)
        * [func (c DBStoreDirtyRepositoriesFuncCall) Args() []interface{}](#DBStoreDirtyRepositoriesFuncCall.Args)
        * [func (c DBStoreDirtyRepositoriesFuncCall) Results() []interface{}](#DBStoreDirtyRepositoriesFuncCall.Results)
    * [type DBStoreDoneFunc struct](#DBStoreDoneFunc)
        * [func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall](#DBStoreDoneFunc.History)
        * [func (f *DBStoreDoneFunc) PushHook(hook func(error) error)](#DBStoreDoneFunc.PushHook)
        * [func (f *DBStoreDoneFunc) PushReturn(r0 error)](#DBStoreDoneFunc.PushReturn)
        * [func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)](#DBStoreDoneFunc.SetDefaultHook)
        * [func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)](#DBStoreDoneFunc.SetDefaultReturn)
        * [func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)](#DBStoreDoneFunc.appendCall)
        * [func (f *DBStoreDoneFunc) nextHook() func(error) error](#DBStoreDoneFunc.nextHook)
    * [type DBStoreDoneFuncCall struct](#DBStoreDoneFuncCall)
        * [func (c DBStoreDoneFuncCall) Args() []interface{}](#DBStoreDoneFuncCall.Args)
        * [func (c DBStoreDoneFuncCall) Results() []interface{}](#DBStoreDoneFuncCall.Results)
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
    * [type DBStoreGetRepositoriesWithIndexConfigurationFunc struct](#DBStoreGetRepositoriesWithIndexConfigurationFunc)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) History() []DBStoreGetRepositoriesWithIndexConfigurationFuncCall](#DBStoreGetRepositoriesWithIndexConfigurationFunc.History)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushHook(hook func(context.Context) ([]int, error))](#DBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushReturn(r0 []int, r1 error)](#DBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultHook(hook func(context.Context) ([]int, error))](#DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultReturn(r0 []int, r1 error)](#DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) appendCall(r0 DBStoreGetRepositoriesWithIndexConfigurationFuncCall)](#DBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall)
        * [func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) nextHook() func(context.Context) ([]int, error)](#DBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook)
    * [type DBStoreGetRepositoriesWithIndexConfigurationFuncCall struct](#DBStoreGetRepositoriesWithIndexConfigurationFuncCall)
        * [func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Args() []interface{}](#DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args)
        * [func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Results() []interface{}](#DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results)
    * [type DBStoreHandleFunc struct](#DBStoreHandleFunc)
        * [func (f *DBStoreHandleFunc) History() []DBStoreHandleFuncCall](#DBStoreHandleFunc.History)
        * [func (f *DBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)](#DBStoreHandleFunc.PushHook)
        * [func (f *DBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)](#DBStoreHandleFunc.PushReturn)
        * [func (f *DBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)](#DBStoreHandleFunc.SetDefaultHook)
        * [func (f *DBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)](#DBStoreHandleFunc.SetDefaultReturn)
        * [func (f *DBStoreHandleFunc) appendCall(r0 DBStoreHandleFuncCall)](#DBStoreHandleFunc.appendCall)
        * [func (f *DBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle](#DBStoreHandleFunc.nextHook)
    * [type DBStoreHandleFuncCall struct](#DBStoreHandleFuncCall)
        * [func (c DBStoreHandleFuncCall) Args() []interface{}](#DBStoreHandleFuncCall.Args)
        * [func (c DBStoreHandleFuncCall) Results() []interface{}](#DBStoreHandleFuncCall.Results)
    * [type DBStoreInsertIndexFunc struct](#DBStoreInsertIndexFunc)
        * [func (f *DBStoreInsertIndexFunc) History() []DBStoreInsertIndexFuncCall](#DBStoreInsertIndexFunc.History)
        * [func (f *DBStoreInsertIndexFunc) PushHook(hook func(context.Context, dbstore.Index) (int, error))](#DBStoreInsertIndexFunc.PushHook)
        * [func (f *DBStoreInsertIndexFunc) PushReturn(r0 int, r1 error)](#DBStoreInsertIndexFunc.PushReturn)
        * [func (f *DBStoreInsertIndexFunc) SetDefaultHook(hook func(context.Context, dbstore.Index) (int, error))](#DBStoreInsertIndexFunc.SetDefaultHook)
        * [func (f *DBStoreInsertIndexFunc) SetDefaultReturn(r0 int, r1 error)](#DBStoreInsertIndexFunc.SetDefaultReturn)
        * [func (f *DBStoreInsertIndexFunc) appendCall(r0 DBStoreInsertIndexFuncCall)](#DBStoreInsertIndexFunc.appendCall)
        * [func (f *DBStoreInsertIndexFunc) nextHook() func(context.Context, dbstore.Index) (int, error)](#DBStoreInsertIndexFunc.nextHook)
    * [type DBStoreInsertIndexFuncCall struct](#DBStoreInsertIndexFuncCall)
        * [func (c DBStoreInsertIndexFuncCall) Args() []interface{}](#DBStoreInsertIndexFuncCall.Args)
        * [func (c DBStoreInsertIndexFuncCall) Results() []interface{}](#DBStoreInsertIndexFuncCall.Results)
    * [type DBStoreIsQueuedFunc struct](#DBStoreIsQueuedFunc)
        * [func (f *DBStoreIsQueuedFunc) History() []DBStoreIsQueuedFuncCall](#DBStoreIsQueuedFunc.History)
        * [func (f *DBStoreIsQueuedFunc) PushHook(hook func(context.Context, int, string) (bool, error))](#DBStoreIsQueuedFunc.PushHook)
        * [func (f *DBStoreIsQueuedFunc) PushReturn(r0 bool, r1 error)](#DBStoreIsQueuedFunc.PushReturn)
        * [func (f *DBStoreIsQueuedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))](#DBStoreIsQueuedFunc.SetDefaultHook)
        * [func (f *DBStoreIsQueuedFunc) SetDefaultReturn(r0 bool, r1 error)](#DBStoreIsQueuedFunc.SetDefaultReturn)
        * [func (f *DBStoreIsQueuedFunc) appendCall(r0 DBStoreIsQueuedFuncCall)](#DBStoreIsQueuedFunc.appendCall)
        * [func (f *DBStoreIsQueuedFunc) nextHook() func(context.Context, int, string) (bool, error)](#DBStoreIsQueuedFunc.nextHook)
    * [type DBStoreIsQueuedFuncCall struct](#DBStoreIsQueuedFuncCall)
        * [func (c DBStoreIsQueuedFuncCall) Args() []interface{}](#DBStoreIsQueuedFuncCall.Args)
        * [func (c DBStoreIsQueuedFuncCall) Results() []interface{}](#DBStoreIsQueuedFuncCall.Results)
    * [type DBStoreShim struct](#DBStoreShim)
        * [func (db *DBStoreShim) Transact(ctx context.Context) (DBStore, error)](#DBStoreShim.Transact)
    * [type DBStoreTransactFunc struct](#DBStoreTransactFunc)
        * [func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall](#DBStoreTransactFunc.History)
        * [func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))](#DBStoreTransactFunc.PushHook)
        * [func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)](#DBStoreTransactFunc.PushReturn)
        * [func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))](#DBStoreTransactFunc.SetDefaultHook)
        * [func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)](#DBStoreTransactFunc.SetDefaultReturn)
        * [func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)](#DBStoreTransactFunc.appendCall)
        * [func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)](#DBStoreTransactFunc.nextHook)
    * [type DBStoreTransactFuncCall struct](#DBStoreTransactFuncCall)
        * [func (c DBStoreTransactFuncCall) Args() []interface{}](#DBStoreTransactFuncCall.Args)
        * [func (c DBStoreTransactFuncCall) Results() []interface{}](#DBStoreTransactFuncCall.Results)
    * [type GitserverClient interface](#GitserverClient)
    * [type GitserverClientFileExistsFunc struct](#GitserverClientFileExistsFunc)
        * [func (f *GitserverClientFileExistsFunc) History() []GitserverClientFileExistsFuncCall](#GitserverClientFileExistsFunc.History)
        * [func (f *GitserverClientFileExistsFunc) PushHook(hook func(context.Context, int, string, string) (bool, error))](#GitserverClientFileExistsFunc.PushHook)
        * [func (f *GitserverClientFileExistsFunc) PushReturn(r0 bool, r1 error)](#GitserverClientFileExistsFunc.PushReturn)
        * [func (f *GitserverClientFileExistsFunc) SetDefaultHook(hook func(context.Context, int, string, string) (bool, error))](#GitserverClientFileExistsFunc.SetDefaultHook)
        * [func (f *GitserverClientFileExistsFunc) SetDefaultReturn(r0 bool, r1 error)](#GitserverClientFileExistsFunc.SetDefaultReturn)
        * [func (f *GitserverClientFileExistsFunc) appendCall(r0 GitserverClientFileExistsFuncCall)](#GitserverClientFileExistsFunc.appendCall)
        * [func (f *GitserverClientFileExistsFunc) nextHook() func(context.Context, int, string, string) (bool, error)](#GitserverClientFileExistsFunc.nextHook)
    * [type GitserverClientFileExistsFuncCall struct](#GitserverClientFileExistsFuncCall)
        * [func (c GitserverClientFileExistsFuncCall) Args() []interface{}](#GitserverClientFileExistsFuncCall.Args)
        * [func (c GitserverClientFileExistsFuncCall) Results() []interface{}](#GitserverClientFileExistsFuncCall.Results)
    * [type GitserverClientHeadFunc struct](#GitserverClientHeadFunc)
        * [func (f *GitserverClientHeadFunc) History() []GitserverClientHeadFuncCall](#GitserverClientHeadFunc.History)
        * [func (f *GitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))](#GitserverClientHeadFunc.PushHook)
        * [func (f *GitserverClientHeadFunc) PushReturn(r0 string, r1 error)](#GitserverClientHeadFunc.PushReturn)
        * [func (f *GitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))](#GitserverClientHeadFunc.SetDefaultHook)
        * [func (f *GitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)](#GitserverClientHeadFunc.SetDefaultReturn)
        * [func (f *GitserverClientHeadFunc) appendCall(r0 GitserverClientHeadFuncCall)](#GitserverClientHeadFunc.appendCall)
        * [func (f *GitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)](#GitserverClientHeadFunc.nextHook)
    * [type GitserverClientHeadFuncCall struct](#GitserverClientHeadFuncCall)
        * [func (c GitserverClientHeadFuncCall) Args() []interface{}](#GitserverClientHeadFuncCall.Args)
        * [func (c GitserverClientHeadFuncCall) Results() []interface{}](#GitserverClientHeadFuncCall.Results)
    * [type GitserverClientListFilesFunc struct](#GitserverClientListFilesFunc)
        * [func (f *GitserverClientListFilesFunc) History() []GitserverClientListFilesFuncCall](#GitserverClientListFilesFunc.History)
        * [func (f *GitserverClientListFilesFunc) PushHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))](#GitserverClientListFilesFunc.PushHook)
        * [func (f *GitserverClientListFilesFunc) PushReturn(r0 []string, r1 error)](#GitserverClientListFilesFunc.PushReturn)
        * [func (f *GitserverClientListFilesFunc) SetDefaultHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))](#GitserverClientListFilesFunc.SetDefaultHook)
        * [func (f *GitserverClientListFilesFunc) SetDefaultReturn(r0 []string, r1 error)](#GitserverClientListFilesFunc.SetDefaultReturn)
        * [func (f *GitserverClientListFilesFunc) appendCall(r0 GitserverClientListFilesFuncCall)](#GitserverClientListFilesFunc.appendCall)
        * [func (f *GitserverClientListFilesFunc) nextHook() func(context.Context, int, string, *regexp.Regexp) ([]string, error)](#GitserverClientListFilesFunc.nextHook)
    * [type GitserverClientListFilesFuncCall struct](#GitserverClientListFilesFuncCall)
        * [func (c GitserverClientListFilesFuncCall) Args() []interface{}](#GitserverClientListFilesFuncCall.Args)
        * [func (c GitserverClientListFilesFuncCall) Results() []interface{}](#GitserverClientListFilesFuncCall.Results)
    * [type GitserverClientRawContentsFunc struct](#GitserverClientRawContentsFunc)
        * [func (f *GitserverClientRawContentsFunc) History() []GitserverClientRawContentsFuncCall](#GitserverClientRawContentsFunc.History)
        * [func (f *GitserverClientRawContentsFunc) PushHook(hook func(context.Context, int, string, string) ([]byte, error))](#GitserverClientRawContentsFunc.PushHook)
        * [func (f *GitserverClientRawContentsFunc) PushReturn(r0 []byte, r1 error)](#GitserverClientRawContentsFunc.PushReturn)
        * [func (f *GitserverClientRawContentsFunc) SetDefaultHook(hook func(context.Context, int, string, string) ([]byte, error))](#GitserverClientRawContentsFunc.SetDefaultHook)
        * [func (f *GitserverClientRawContentsFunc) SetDefaultReturn(r0 []byte, r1 error)](#GitserverClientRawContentsFunc.SetDefaultReturn)
        * [func (f *GitserverClientRawContentsFunc) appendCall(r0 GitserverClientRawContentsFuncCall)](#GitserverClientRawContentsFunc.appendCall)
        * [func (f *GitserverClientRawContentsFunc) nextHook() func(context.Context, int, string, string) ([]byte, error)](#GitserverClientRawContentsFunc.nextHook)
    * [type GitserverClientRawContentsFuncCall struct](#GitserverClientRawContentsFuncCall)
        * [func (c GitserverClientRawContentsFuncCall) Args() []interface{}](#GitserverClientRawContentsFuncCall.Args)
        * [func (c GitserverClientRawContentsFuncCall) Results() []interface{}](#GitserverClientRawContentsFuncCall.Results)
    * [type GitserverClientResolveRevisionFunc struct](#GitserverClientResolveRevisionFunc)
        * [func (f *GitserverClientResolveRevisionFunc) History() []GitserverClientResolveRevisionFuncCall](#GitserverClientResolveRevisionFunc.History)
        * [func (f *GitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))](#GitserverClientResolveRevisionFunc.PushHook)
        * [func (f *GitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)](#GitserverClientResolveRevisionFunc.PushReturn)
        * [func (f *GitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))](#GitserverClientResolveRevisionFunc.SetDefaultHook)
        * [func (f *GitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)](#GitserverClientResolveRevisionFunc.SetDefaultReturn)
        * [func (f *GitserverClientResolveRevisionFunc) appendCall(r0 GitserverClientResolveRevisionFuncCall)](#GitserverClientResolveRevisionFunc.appendCall)
        * [func (f *GitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)](#GitserverClientResolveRevisionFunc.nextHook)
    * [type GitserverClientResolveRevisionFuncCall struct](#GitserverClientResolveRevisionFuncCall)
        * [func (c GitserverClientResolveRevisionFuncCall) Args() []interface{}](#GitserverClientResolveRevisionFuncCall.Args)
        * [func (c GitserverClientResolveRevisionFuncCall) Results() []interface{}](#GitserverClientResolveRevisionFuncCall.Results)
    * [type IndexEnqueuer struct](#IndexEnqueuer)
        * [func NewIndexEnqueuer(dbStore DBStore, gitClient GitserverClient, repoUpdater RepoUpdaterClient, observationContext *observation.Context) *IndexEnqueuer](#NewIndexEnqueuer)
        * [func (s *IndexEnqueuer) ForceQueueIndexesForRepository(ctx context.Context, repositoryID int) error](#IndexEnqueuer.ForceQueueIndexesForRepository)
        * [func (s *IndexEnqueuer) InferIndexConfiguration(ctx context.Context, repositoryID int) (_ *config.IndexConfiguration, err error)](#IndexEnqueuer.InferIndexConfiguration)
        * [func (s *IndexEnqueuer) QueueIndexesForPackage(ctx context.Context, pkg semantic.Package) (err error)](#IndexEnqueuer.QueueIndexesForPackage)
        * [func (s *IndexEnqueuer) QueueIndexesForRepository(ctx context.Context, repositoryID int) error](#IndexEnqueuer.QueueIndexesForRepository)
        * [func (s *IndexEnqueuer) getIndexRecords(ctx context.Context, repositoryID int, commit string) ([]store.Index, error)](#IndexEnqueuer.getIndexRecords)
        * [func (s *IndexEnqueuer) getIndexRecordsFromConfigurationInDatabase(ctx context.Context, repositoryID int, commit string) ([]store.Index, bool, error)](#IndexEnqueuer.getIndexRecordsFromConfigurationInDatabase)
        * [func (s *IndexEnqueuer) getIndexRecordsFromConfigurationInRepository(ctx context.Context, repositoryID int, commit string) ([]store.Index, bool, error)](#IndexEnqueuer.getIndexRecordsFromConfigurationInRepository)
        * [func (s *IndexEnqueuer) inferIndexJobsFromRepositoryStructure(ctx context.Context, repositoryID int, commit string) ([]config.IndexJob, error)](#IndexEnqueuer.inferIndexJobsFromRepositoryStructure)
        * [func (s *IndexEnqueuer) inferIndexRecordsFromRepositoryStructure(ctx context.Context, repositoryID int, commit string) ([]store.Index, bool, error)](#IndexEnqueuer.inferIndexRecordsFromRepositoryStructure)
        * [func (s *IndexEnqueuer) queueIndexForRepository(ctx context.Context, repositoryID int, force bool) (err error)](#IndexEnqueuer.queueIndexForRepository)
        * [func (s *IndexEnqueuer) queueIndexForRepositoryAndCommit(ctx context.Context, repositoryID int, commit string, force bool, traceLog observation.TraceLogger) error](#IndexEnqueuer.queueIndexForRepositoryAndCommit)
        * [func (s *IndexEnqueuer) queueIndexes(ctx context.Context, repositoryID int, commit string, indexes []store.Index) (err error)](#IndexEnqueuer.queueIndexes)
    * [type MockDBStore struct](#MockDBStore)
        * [func NewMockDBStore() *MockDBStore](#NewMockDBStore)
        * [func NewMockDBStoreFrom(i DBStore) *MockDBStore](#NewMockDBStoreFrom)
        * [func (m *MockDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)](#MockDBStore.DirtyRepositories)
        * [func (m *MockDBStore) Done(v0 error) error](#MockDBStore.Done)
        * [func (m *MockDBStore) GetIndexConfigurationByRepositoryID(v0 context.Context, v1 int) (dbstore.IndexConfiguration, bool, error)](#MockDBStore.GetIndexConfigurationByRepositoryID)
        * [func (m *MockDBStore) GetRepositoriesWithIndexConfiguration(v0 context.Context) ([]int, error)](#MockDBStore.GetRepositoriesWithIndexConfiguration)
        * [func (m *MockDBStore) Handle() *basestore.TransactableHandle](#MockDBStore.Handle)
        * [func (m *MockDBStore) InsertIndex(v0 context.Context, v1 dbstore.Index) (int, error)](#MockDBStore.InsertIndex)
        * [func (m *MockDBStore) IsQueued(v0 context.Context, v1 int, v2 string) (bool, error)](#MockDBStore.IsQueued)
        * [func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)](#MockDBStore.Transact)
    * [type MockGitserverClient struct](#MockGitserverClient)
        * [func NewMockGitserverClient() *MockGitserverClient](#NewMockGitserverClient)
        * [func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient](#NewMockGitserverClientFrom)
        * [func (m *MockGitserverClient) FileExists(v0 context.Context, v1 int, v2 string, v3 string) (bool, error)](#MockGitserverClient.FileExists)
        * [func (m *MockGitserverClient) Head(v0 context.Context, v1 int) (string, error)](#MockGitserverClient.Head)
        * [func (m *MockGitserverClient) ListFiles(v0 context.Context, v1 int, v2 string, v3 *regexp.Regexp) ([]string, error)](#MockGitserverClient.ListFiles)
        * [func (m *MockGitserverClient) RawContents(v0 context.Context, v1 int, v2 string, v3 string) ([]byte, error)](#MockGitserverClient.RawContents)
        * [func (m *MockGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)](#MockGitserverClient.ResolveRevision)
    * [type MockRepoUpdaterClient struct](#MockRepoUpdaterClient)
        * [func NewMockRepoUpdaterClient() *MockRepoUpdaterClient](#NewMockRepoUpdaterClient)
        * [func NewMockRepoUpdaterClientFrom(i RepoUpdaterClient) *MockRepoUpdaterClient](#NewMockRepoUpdaterClientFrom)
        * [func (m *MockRepoUpdaterClient) EnqueueRepoUpdate(v0 context.Context, v1 api.RepoName) (*protocol.RepoUpdateResponse, error)](#MockRepoUpdaterClient.EnqueueRepoUpdate)
    * [type RepoUpdaterClient interface](#RepoUpdaterClient)
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
    * [type gitClient struct](#gitClient)
        * [func newGitClient(client GitserverClient, repositoryID int, commit string) gitClient](#newGitClient)
        * [func (c gitClient) FileExists(ctx context.Context, file string) (bool, error)](#gitClient.FileExists)
        * [func (c gitClient) ListFiles(ctx context.Context, pattern *regexp.Regexp) ([]string, error)](#gitClient.ListFiles)
        * [func (c gitClient) RawContents(ctx context.Context, file string) ([]byte, error)](#gitClient.RawContents)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
* [Functions](#func)
    * [func InferGoRepositoryAndRevision(pkg semantic.Package) (repoName, gitTagOrCommit string, ok bool)](#InferGoRepositoryAndRevision)
    * [func TestInferGoRepositoryAndRevision(t *testing.T)](#TestInferGoRepositoryAndRevision)
    * [func TestQueueIndexesForPackage(t *testing.T)](#TestQueueIndexesForPackage)
    * [func TestQueueIndexesForRepositoryInDatabase(t *testing.T)](#TestQueueIndexesForRepositoryInDatabase)
    * [func TestQueueIndexesForRepositoryInRepository(t *testing.T)](#TestQueueIndexesForRepositoryInRepository)
    * [func TestQueueIndexesForRepositoryInferred(t *testing.T)](#TestQueueIndexesForRepositoryInferred)
    * [func TestQueueIndexesForRepositoryInferredTooLarge(t *testing.T)](#TestQueueIndexesForRepositoryInferredTooLarge)
    * [func convertIndexConfiguration(repositoryID int, commit string, indexConfiguration config.IndexConfiguration) (indexes []store.Index)](#convertIndexConfiguration)
    * [func convertInferredConfiguration(repositoryID int, commit string, indexJobs []config.IndexJob) (indexes []store.Index)](#convertInferredConfiguration)
    * [func isNotFoundError(err error) bool](#isNotFoundError)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="GitHubScheme" href="#GitHubScheme">const GitHubScheme</a>

```
searchKey: enqueuer.GitHubScheme
tags: [constant string]
```

```Go
const GitHubScheme = "https://"
```

### <a id="defaultMaxJobsPerCommit" href="#defaultMaxJobsPerCommit">const defaultMaxJobsPerCommit</a>

```
searchKey: enqueuer.defaultMaxJobsPerCommit
tags: [constant number private]
```

```Go
const defaultMaxJobsPerCommit = 25
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="goVersionPattern" href="#goVersionPattern">var goVersionPattern</a>

```
searchKey: enqueuer.goVersionPattern
tags: [variable struct private]
```

```Go
var goVersionPattern = lazyregexp.New(`^v?[\d\.]+-([a-f0-9]+)`)
```

### <a id="yamlIndexConfiguration" href="#yamlIndexConfiguration">var yamlIndexConfiguration</a>

```
searchKey: enqueuer.yamlIndexConfiguration
tags: [variable array number private]
```

```Go
var yamlIndexConfiguration = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="DBStore" href="#DBStore">type DBStore interface</a>

```
searchKey: enqueuer.DBStore
tags: [interface]
```

```Go
type DBStore interface {
	basestore.ShareableStore

	Handle() *basestore.TransactableHandle
	Transact(ctx context.Context) (DBStore, error)
	Done(err error) error

	DirtyRepositories(ctx context.Context) (map[int]int, error)
	IsQueued(ctx context.Context, repositoryID int, commit string) (bool, error)
	InsertIndex(ctx context.Context, index dbstore.Index) (int, error)
	GetRepositoriesWithIndexConfiguration(ctx context.Context) ([]int, error)
	GetIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int) (dbstore.IndexConfiguration, bool, error)
}
```

### <a id="DBStoreDirtyRepositoriesFunc" href="#DBStoreDirtyRepositoriesFunc">type DBStoreDirtyRepositoriesFunc struct</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFunc
tags: [struct private]
```

```Go
type DBStoreDirtyRepositoriesFunc struct {
	defaultHook func(context.Context) (map[int]int, error)
	hooks       []func(context.Context) (map[int]int, error)
	history     []DBStoreDirtyRepositoriesFuncCall
	mutex       sync.Mutex
}
```

DBStoreDirtyRepositoriesFunc describes the behavior when the DirtyRepositories method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDirtyRepositoriesFunc.History" href="#DBStoreDirtyRepositoriesFunc.History">func (f *DBStoreDirtyRepositoriesFunc) History() []DBStoreDirtyRepositoriesFuncCall</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFunc.History
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) History() []DBStoreDirtyRepositoriesFuncCall
```

History returns a sequence of DBStoreDirtyRepositoriesFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreDirtyRepositoriesFunc.PushHook" href="#DBStoreDirtyRepositoriesFunc.PushHook">func (f *DBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DirtyRepositories method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDirtyRepositoriesFunc.PushReturn" href="#DBStoreDirtyRepositoriesFunc.PushReturn">func (f *DBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDirtyRepositoriesFunc.SetDefaultHook" href="#DBStoreDirtyRepositoriesFunc.SetDefaultHook">func (f *DBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))
```

SetDefaultHook sets function that is called when the DirtyRepositories method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDirtyRepositoriesFunc.SetDefaultReturn" href="#DBStoreDirtyRepositoriesFunc.SetDefaultReturn">func (f *DBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDirtyRepositoriesFunc.appendCall" href="#DBStoreDirtyRepositoriesFunc.appendCall">func (f *DBStoreDirtyRepositoriesFunc) appendCall(r0 DBStoreDirtyRepositoriesFuncCall)</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) appendCall(r0 DBStoreDirtyRepositoriesFuncCall)
```

#### <a id="DBStoreDirtyRepositoriesFunc.nextHook" href="#DBStoreDirtyRepositoriesFunc.nextHook">func (f *DBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)
```

### <a id="DBStoreDirtyRepositoriesFuncCall" href="#DBStoreDirtyRepositoriesFuncCall">type DBStoreDirtyRepositoriesFuncCall struct</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFuncCall
tags: [struct private]
```

```Go
type DBStoreDirtyRepositoriesFuncCall struct {
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

DBStoreDirtyRepositoriesFuncCall is an object that describes an invocation of method DirtyRepositories on an instance of MockDBStore. 

#### <a id="DBStoreDirtyRepositoriesFuncCall.Args" href="#DBStoreDirtyRepositoriesFuncCall.Args">func (c DBStoreDirtyRepositoriesFuncCall) Args() []interface{}</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreDirtyRepositoriesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDirtyRepositoriesFuncCall.Results" href="#DBStoreDirtyRepositoriesFuncCall.Results">func (c DBStoreDirtyRepositoriesFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.DBStoreDirtyRepositoriesFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreDirtyRepositoriesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDoneFunc" href="#DBStoreDoneFunc">type DBStoreDoneFunc struct</a>

```
searchKey: enqueuer.DBStoreDoneFunc
tags: [struct private]
```

```Go
type DBStoreDoneFunc struct {
	defaultHook func(error) error
	hooks       []func(error) error
	history     []DBStoreDoneFuncCall
	mutex       sync.Mutex
}
```

DBStoreDoneFunc describes the behavior when the Done method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDoneFunc.History" href="#DBStoreDoneFunc.History">func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall</a>

```
searchKey: enqueuer.DBStoreDoneFunc.History
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall
```

History returns a sequence of DBStoreDoneFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreDoneFunc.PushHook" href="#DBStoreDoneFunc.PushHook">func (f *DBStoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: enqueuer.DBStoreDoneFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDoneFunc.PushReturn" href="#DBStoreDoneFunc.PushReturn">func (f *DBStoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: enqueuer.DBStoreDoneFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.SetDefaultHook" href="#DBStoreDoneFunc.SetDefaultHook">func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: enqueuer.DBStoreDoneFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDoneFunc.SetDefaultReturn" href="#DBStoreDoneFunc.SetDefaultReturn">func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: enqueuer.DBStoreDoneFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.appendCall" href="#DBStoreDoneFunc.appendCall">func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)</a>

```
searchKey: enqueuer.DBStoreDoneFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)
```

#### <a id="DBStoreDoneFunc.nextHook" href="#DBStoreDoneFunc.nextHook">func (f *DBStoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: enqueuer.DBStoreDoneFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) nextHook() func(error) error
```

### <a id="DBStoreDoneFuncCall" href="#DBStoreDoneFuncCall">type DBStoreDoneFuncCall struct</a>

```
searchKey: enqueuer.DBStoreDoneFuncCall
tags: [struct private]
```

```Go
type DBStoreDoneFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 error
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreDoneFuncCall is an object that describes an invocation of method Done on an instance of MockDBStore. 

#### <a id="DBStoreDoneFuncCall.Args" href="#DBStoreDoneFuncCall.Args">func (c DBStoreDoneFuncCall) Args() []interface{}</a>

```
searchKey: enqueuer.DBStoreDoneFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDoneFuncCall.Results" href="#DBStoreDoneFuncCall.Results">func (c DBStoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.DBStoreDoneFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc">type DBStoreGetIndexConfigurationByRepositoryIDFunc struct</a>

```
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFunc
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
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) History() []DBStoreGetIndexConfigurationByRepositoryIDFuncCall
```

History returns a sequence of DBStoreGetIndexConfigurationByRepositoryIDFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))</a>

```
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetIndexConfigurationByRepositoryID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)</a>

```
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) PushReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))</a>

```
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.IndexConfiguration, bool, error))
```

SetDefaultHook sets function that is called when the GetIndexConfigurationByRepositoryID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)</a>

```
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) SetDefaultReturn(r0 dbstore.IndexConfiguration, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) appendCall(r0 DBStoreGetIndexConfigurationByRepositoryIDFuncCall)</a>

```
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) appendCall(r0 DBStoreGetIndexConfigurationByRepositoryIDFuncCall)
```

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook" href="#DBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook">func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int) (dbstore.IndexConfiguration, bool, error)</a>

```
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetIndexConfigurationByRepositoryIDFunc) nextHook() func(context.Context, int) (dbstore.IndexConfiguration, bool, error)
```

### <a id="DBStoreGetIndexConfigurationByRepositoryIDFuncCall" href="#DBStoreGetIndexConfigurationByRepositoryIDFuncCall">type DBStoreGetIndexConfigurationByRepositoryIDFuncCall struct</a>

```
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFuncCall
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
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetIndexConfigurationByRepositoryIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results" href="#DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results">func (c DBStoreGetIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.DBStoreGetIndexConfigurationByRepositoryIDFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetIndexConfigurationByRepositoryIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc">type DBStoreGetRepositoriesWithIndexConfigurationFunc struct</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFunc
tags: [struct private]
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

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.History" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.History">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) History() []DBStoreGetRepositoriesWithIndexConfigurationFuncCall</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) History() []DBStoreGetRepositoriesWithIndexConfigurationFuncCall
```

History returns a sequence of DBStoreGetRepositoriesWithIndexConfigurationFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushHook(hook func(context.Context) ([]int, error))</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushHook(hook func(context.Context) ([]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetRepositoriesWithIndexConfiguration method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushReturn(r0 []int, r1 error)</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) PushReturn(r0 []int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultHook(hook func(context.Context) ([]int, error))</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultHook(hook func(context.Context) ([]int, error))
```

SetDefaultHook sets function that is called when the GetRepositoriesWithIndexConfiguration method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultReturn(r0 []int, r1 error)</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) SetDefaultReturn(r0 []int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) appendCall(r0 DBStoreGetRepositoriesWithIndexConfigurationFuncCall)</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) appendCall(r0 DBStoreGetRepositoriesWithIndexConfigurationFuncCall)
```

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook" href="#DBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook">func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) nextHook() func(context.Context) ([]int, error)</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetRepositoriesWithIndexConfigurationFunc) nextHook() func(context.Context) ([]int, error)
```

### <a id="DBStoreGetRepositoriesWithIndexConfigurationFuncCall" href="#DBStoreGetRepositoriesWithIndexConfigurationFuncCall">type DBStoreGetRepositoriesWithIndexConfigurationFuncCall struct</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFuncCall
tags: [struct private]
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
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results" href="#DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results">func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.DBStoreGetRepositoriesWithIndexConfigurationFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetRepositoriesWithIndexConfigurationFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreHandleFunc" href="#DBStoreHandleFunc">type DBStoreHandleFunc struct</a>

```
searchKey: enqueuer.DBStoreHandleFunc
tags: [struct private]
```

```Go
type DBStoreHandleFunc struct {
	defaultHook func() *basestore.TransactableHandle
	hooks       []func() *basestore.TransactableHandle
	history     []DBStoreHandleFuncCall
	mutex       sync.Mutex
}
```

DBStoreHandleFunc describes the behavior when the Handle method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreHandleFunc.History" href="#DBStoreHandleFunc.History">func (f *DBStoreHandleFunc) History() []DBStoreHandleFuncCall</a>

```
searchKey: enqueuer.DBStoreHandleFunc.History
tags: [method private]
```

```Go
func (f *DBStoreHandleFunc) History() []DBStoreHandleFuncCall
```

History returns a sequence of DBStoreHandleFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreHandleFunc.PushHook" href="#DBStoreHandleFunc.PushHook">func (f *DBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: enqueuer.DBStoreHandleFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)
```

PushHook adds a function to the end of hook queue. Each invocation of the Handle method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreHandleFunc.PushReturn" href="#DBStoreHandleFunc.PushReturn">func (f *DBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: enqueuer.DBStoreHandleFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHandleFunc.SetDefaultHook" href="#DBStoreHandleFunc.SetDefaultHook">func (f *DBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: enqueuer.DBStoreHandleFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)
```

SetDefaultHook sets function that is called when the Handle method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreHandleFunc.SetDefaultReturn" href="#DBStoreHandleFunc.SetDefaultReturn">func (f *DBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: enqueuer.DBStoreHandleFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHandleFunc.appendCall" href="#DBStoreHandleFunc.appendCall">func (f *DBStoreHandleFunc) appendCall(r0 DBStoreHandleFuncCall)</a>

```
searchKey: enqueuer.DBStoreHandleFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreHandleFunc) appendCall(r0 DBStoreHandleFuncCall)
```

#### <a id="DBStoreHandleFunc.nextHook" href="#DBStoreHandleFunc.nextHook">func (f *DBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle</a>

```
searchKey: enqueuer.DBStoreHandleFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle
```

### <a id="DBStoreHandleFuncCall" href="#DBStoreHandleFuncCall">type DBStoreHandleFuncCall struct</a>

```
searchKey: enqueuer.DBStoreHandleFuncCall
tags: [struct private]
```

```Go
type DBStoreHandleFuncCall struct {
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *basestore.TransactableHandle
}
```

DBStoreHandleFuncCall is an object that describes an invocation of method Handle on an instance of MockDBStore. 

#### <a id="DBStoreHandleFuncCall.Args" href="#DBStoreHandleFuncCall.Args">func (c DBStoreHandleFuncCall) Args() []interface{}</a>

```
searchKey: enqueuer.DBStoreHandleFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreHandleFuncCall.Results" href="#DBStoreHandleFuncCall.Results">func (c DBStoreHandleFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.DBStoreHandleFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreInsertIndexFunc" href="#DBStoreInsertIndexFunc">type DBStoreInsertIndexFunc struct</a>

```
searchKey: enqueuer.DBStoreInsertIndexFunc
tags: [struct private]
```

```Go
type DBStoreInsertIndexFunc struct {
	defaultHook func(context.Context, dbstore.Index) (int, error)
	hooks       []func(context.Context, dbstore.Index) (int, error)
	history     []DBStoreInsertIndexFuncCall
	mutex       sync.Mutex
}
```

DBStoreInsertIndexFunc describes the behavior when the InsertIndex method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreInsertIndexFunc.History" href="#DBStoreInsertIndexFunc.History">func (f *DBStoreInsertIndexFunc) History() []DBStoreInsertIndexFuncCall</a>

```
searchKey: enqueuer.DBStoreInsertIndexFunc.History
tags: [method private]
```

```Go
func (f *DBStoreInsertIndexFunc) History() []DBStoreInsertIndexFuncCall
```

History returns a sequence of DBStoreInsertIndexFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreInsertIndexFunc.PushHook" href="#DBStoreInsertIndexFunc.PushHook">func (f *DBStoreInsertIndexFunc) PushHook(hook func(context.Context, dbstore.Index) (int, error))</a>

```
searchKey: enqueuer.DBStoreInsertIndexFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreInsertIndexFunc) PushHook(hook func(context.Context, dbstore.Index) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the InsertIndex method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreInsertIndexFunc.PushReturn" href="#DBStoreInsertIndexFunc.PushReturn">func (f *DBStoreInsertIndexFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: enqueuer.DBStoreInsertIndexFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreInsertIndexFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreInsertIndexFunc.SetDefaultHook" href="#DBStoreInsertIndexFunc.SetDefaultHook">func (f *DBStoreInsertIndexFunc) SetDefaultHook(hook func(context.Context, dbstore.Index) (int, error))</a>

```
searchKey: enqueuer.DBStoreInsertIndexFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreInsertIndexFunc) SetDefaultHook(hook func(context.Context, dbstore.Index) (int, error))
```

SetDefaultHook sets function that is called when the InsertIndex method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreInsertIndexFunc.SetDefaultReturn" href="#DBStoreInsertIndexFunc.SetDefaultReturn">func (f *DBStoreInsertIndexFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: enqueuer.DBStoreInsertIndexFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreInsertIndexFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreInsertIndexFunc.appendCall" href="#DBStoreInsertIndexFunc.appendCall">func (f *DBStoreInsertIndexFunc) appendCall(r0 DBStoreInsertIndexFuncCall)</a>

```
searchKey: enqueuer.DBStoreInsertIndexFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreInsertIndexFunc) appendCall(r0 DBStoreInsertIndexFuncCall)
```

#### <a id="DBStoreInsertIndexFunc.nextHook" href="#DBStoreInsertIndexFunc.nextHook">func (f *DBStoreInsertIndexFunc) nextHook() func(context.Context, dbstore.Index) (int, error)</a>

```
searchKey: enqueuer.DBStoreInsertIndexFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreInsertIndexFunc) nextHook() func(context.Context, dbstore.Index) (int, error)
```

### <a id="DBStoreInsertIndexFuncCall" href="#DBStoreInsertIndexFuncCall">type DBStoreInsertIndexFuncCall struct</a>

```
searchKey: enqueuer.DBStoreInsertIndexFuncCall
tags: [struct private]
```

```Go
type DBStoreInsertIndexFuncCall struct {
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

DBStoreInsertIndexFuncCall is an object that describes an invocation of method InsertIndex on an instance of MockDBStore. 

#### <a id="DBStoreInsertIndexFuncCall.Args" href="#DBStoreInsertIndexFuncCall.Args">func (c DBStoreInsertIndexFuncCall) Args() []interface{}</a>

```
searchKey: enqueuer.DBStoreInsertIndexFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreInsertIndexFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreInsertIndexFuncCall.Results" href="#DBStoreInsertIndexFuncCall.Results">func (c DBStoreInsertIndexFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.DBStoreInsertIndexFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreInsertIndexFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreIsQueuedFunc" href="#DBStoreIsQueuedFunc">type DBStoreIsQueuedFunc struct</a>

```
searchKey: enqueuer.DBStoreIsQueuedFunc
tags: [struct private]
```

```Go
type DBStoreIsQueuedFunc struct {
	defaultHook func(context.Context, int, string) (bool, error)
	hooks       []func(context.Context, int, string) (bool, error)
	history     []DBStoreIsQueuedFuncCall
	mutex       sync.Mutex
}
```

DBStoreIsQueuedFunc describes the behavior when the IsQueued method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreIsQueuedFunc.History" href="#DBStoreIsQueuedFunc.History">func (f *DBStoreIsQueuedFunc) History() []DBStoreIsQueuedFuncCall</a>

```
searchKey: enqueuer.DBStoreIsQueuedFunc.History
tags: [method private]
```

```Go
func (f *DBStoreIsQueuedFunc) History() []DBStoreIsQueuedFuncCall
```

History returns a sequence of DBStoreIsQueuedFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreIsQueuedFunc.PushHook" href="#DBStoreIsQueuedFunc.PushHook">func (f *DBStoreIsQueuedFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: enqueuer.DBStoreIsQueuedFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreIsQueuedFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the IsQueued method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreIsQueuedFunc.PushReturn" href="#DBStoreIsQueuedFunc.PushReturn">func (f *DBStoreIsQueuedFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: enqueuer.DBStoreIsQueuedFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreIsQueuedFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreIsQueuedFunc.SetDefaultHook" href="#DBStoreIsQueuedFunc.SetDefaultHook">func (f *DBStoreIsQueuedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: enqueuer.DBStoreIsQueuedFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreIsQueuedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the IsQueued method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreIsQueuedFunc.SetDefaultReturn" href="#DBStoreIsQueuedFunc.SetDefaultReturn">func (f *DBStoreIsQueuedFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: enqueuer.DBStoreIsQueuedFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreIsQueuedFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreIsQueuedFunc.appendCall" href="#DBStoreIsQueuedFunc.appendCall">func (f *DBStoreIsQueuedFunc) appendCall(r0 DBStoreIsQueuedFuncCall)</a>

```
searchKey: enqueuer.DBStoreIsQueuedFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreIsQueuedFunc) appendCall(r0 DBStoreIsQueuedFuncCall)
```

#### <a id="DBStoreIsQueuedFunc.nextHook" href="#DBStoreIsQueuedFunc.nextHook">func (f *DBStoreIsQueuedFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: enqueuer.DBStoreIsQueuedFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreIsQueuedFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="DBStoreIsQueuedFuncCall" href="#DBStoreIsQueuedFuncCall">type DBStoreIsQueuedFuncCall struct</a>

```
searchKey: enqueuer.DBStoreIsQueuedFuncCall
tags: [struct private]
```

```Go
type DBStoreIsQueuedFuncCall struct {
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

DBStoreIsQueuedFuncCall is an object that describes an invocation of method IsQueued on an instance of MockDBStore. 

#### <a id="DBStoreIsQueuedFuncCall.Args" href="#DBStoreIsQueuedFuncCall.Args">func (c DBStoreIsQueuedFuncCall) Args() []interface{}</a>

```
searchKey: enqueuer.DBStoreIsQueuedFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreIsQueuedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreIsQueuedFuncCall.Results" href="#DBStoreIsQueuedFuncCall.Results">func (c DBStoreIsQueuedFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.DBStoreIsQueuedFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreIsQueuedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreShim" href="#DBStoreShim">type DBStoreShim struct</a>

```
searchKey: enqueuer.DBStoreShim
tags: [struct]
```

```Go
type DBStoreShim struct {
	*dbstore.Store
}
```

#### <a id="DBStoreShim.Transact" href="#DBStoreShim.Transact">func (db *DBStoreShim) Transact(ctx context.Context) (DBStore, error)</a>

```
searchKey: enqueuer.DBStoreShim.Transact
tags: [method]
```

```Go
func (db *DBStoreShim) Transact(ctx context.Context) (DBStore, error)
```

### <a id="DBStoreTransactFunc" href="#DBStoreTransactFunc">type DBStoreTransactFunc struct</a>

```
searchKey: enqueuer.DBStoreTransactFunc
tags: [struct private]
```

```Go
type DBStoreTransactFunc struct {
	defaultHook func(context.Context) (DBStore, error)
	hooks       []func(context.Context) (DBStore, error)
	history     []DBStoreTransactFuncCall
	mutex       sync.Mutex
}
```

DBStoreTransactFunc describes the behavior when the Transact method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreTransactFunc.History" href="#DBStoreTransactFunc.History">func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall</a>

```
searchKey: enqueuer.DBStoreTransactFunc.History
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall
```

History returns a sequence of DBStoreTransactFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreTransactFunc.PushHook" href="#DBStoreTransactFunc.PushHook">func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))</a>

```
searchKey: enqueuer.DBStoreTransactFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Transact method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreTransactFunc.PushReturn" href="#DBStoreTransactFunc.PushReturn">func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)</a>

```
searchKey: enqueuer.DBStoreTransactFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.SetDefaultHook" href="#DBStoreTransactFunc.SetDefaultHook">func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))</a>

```
searchKey: enqueuer.DBStoreTransactFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))
```

SetDefaultHook sets function that is called when the Transact method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreTransactFunc.SetDefaultReturn" href="#DBStoreTransactFunc.SetDefaultReturn">func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)</a>

```
searchKey: enqueuer.DBStoreTransactFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.appendCall" href="#DBStoreTransactFunc.appendCall">func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)</a>

```
searchKey: enqueuer.DBStoreTransactFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)
```

#### <a id="DBStoreTransactFunc.nextHook" href="#DBStoreTransactFunc.nextHook">func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)</a>

```
searchKey: enqueuer.DBStoreTransactFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)
```

### <a id="DBStoreTransactFuncCall" href="#DBStoreTransactFuncCall">type DBStoreTransactFuncCall struct</a>

```
searchKey: enqueuer.DBStoreTransactFuncCall
tags: [struct private]
```

```Go
type DBStoreTransactFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 DBStore
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreTransactFuncCall is an object that describes an invocation of method Transact on an instance of MockDBStore. 

#### <a id="DBStoreTransactFuncCall.Args" href="#DBStoreTransactFuncCall.Args">func (c DBStoreTransactFuncCall) Args() []interface{}</a>

```
searchKey: enqueuer.DBStoreTransactFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreTransactFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreTransactFuncCall.Results" href="#DBStoreTransactFuncCall.Results">func (c DBStoreTransactFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.DBStoreTransactFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreTransactFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClient" href="#GitserverClient">type GitserverClient interface</a>

```
searchKey: enqueuer.GitserverClient
tags: [interface]
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

### <a id="GitserverClientFileExistsFunc" href="#GitserverClientFileExistsFunc">type GitserverClientFileExistsFunc struct</a>

```
searchKey: enqueuer.GitserverClientFileExistsFunc
tags: [struct private]
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

#### <a id="GitserverClientFileExistsFunc.History" href="#GitserverClientFileExistsFunc.History">func (f *GitserverClientFileExistsFunc) History() []GitserverClientFileExistsFuncCall</a>

```
searchKey: enqueuer.GitserverClientFileExistsFunc.History
tags: [method private]
```

```Go
func (f *GitserverClientFileExistsFunc) History() []GitserverClientFileExistsFuncCall
```

History returns a sequence of GitserverClientFileExistsFuncCall objects describing the invocations of this function. 

#### <a id="GitserverClientFileExistsFunc.PushHook" href="#GitserverClientFileExistsFunc.PushHook">func (f *GitserverClientFileExistsFunc) PushHook(hook func(context.Context, int, string, string) (bool, error))</a>

```
searchKey: enqueuer.GitserverClientFileExistsFunc.PushHook
tags: [method private]
```

```Go
func (f *GitserverClientFileExistsFunc) PushHook(hook func(context.Context, int, string, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the FileExists method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientFileExistsFunc.PushReturn" href="#GitserverClientFileExistsFunc.PushReturn">func (f *GitserverClientFileExistsFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: enqueuer.GitserverClientFileExistsFunc.PushReturn
tags: [method private]
```

```Go
func (f *GitserverClientFileExistsFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientFileExistsFunc.SetDefaultHook" href="#GitserverClientFileExistsFunc.SetDefaultHook">func (f *GitserverClientFileExistsFunc) SetDefaultHook(hook func(context.Context, int, string, string) (bool, error))</a>

```
searchKey: enqueuer.GitserverClientFileExistsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *GitserverClientFileExistsFunc) SetDefaultHook(hook func(context.Context, int, string, string) (bool, error))
```

SetDefaultHook sets function that is called when the FileExists method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientFileExistsFunc.SetDefaultReturn" href="#GitserverClientFileExistsFunc.SetDefaultReturn">func (f *GitserverClientFileExistsFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: enqueuer.GitserverClientFileExistsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *GitserverClientFileExistsFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientFileExistsFunc.appendCall" href="#GitserverClientFileExistsFunc.appendCall">func (f *GitserverClientFileExistsFunc) appendCall(r0 GitserverClientFileExistsFuncCall)</a>

```
searchKey: enqueuer.GitserverClientFileExistsFunc.appendCall
tags: [method private]
```

```Go
func (f *GitserverClientFileExistsFunc) appendCall(r0 GitserverClientFileExistsFuncCall)
```

#### <a id="GitserverClientFileExistsFunc.nextHook" href="#GitserverClientFileExistsFunc.nextHook">func (f *GitserverClientFileExistsFunc) nextHook() func(context.Context, int, string, string) (bool, error)</a>

```
searchKey: enqueuer.GitserverClientFileExistsFunc.nextHook
tags: [method private]
```

```Go
func (f *GitserverClientFileExistsFunc) nextHook() func(context.Context, int, string, string) (bool, error)
```

### <a id="GitserverClientFileExistsFuncCall" href="#GitserverClientFileExistsFuncCall">type GitserverClientFileExistsFuncCall struct</a>

```
searchKey: enqueuer.GitserverClientFileExistsFuncCall
tags: [struct private]
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
searchKey: enqueuer.GitserverClientFileExistsFuncCall.Args
tags: [method private]
```

```Go
func (c GitserverClientFileExistsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientFileExistsFuncCall.Results" href="#GitserverClientFileExistsFuncCall.Results">func (c GitserverClientFileExistsFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.GitserverClientFileExistsFuncCall.Results
tags: [method private]
```

```Go
func (c GitserverClientFileExistsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientHeadFunc" href="#GitserverClientHeadFunc">type GitserverClientHeadFunc struct</a>

```
searchKey: enqueuer.GitserverClientHeadFunc
tags: [struct private]
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

#### <a id="GitserverClientHeadFunc.History" href="#GitserverClientHeadFunc.History">func (f *GitserverClientHeadFunc) History() []GitserverClientHeadFuncCall</a>

```
searchKey: enqueuer.GitserverClientHeadFunc.History
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) History() []GitserverClientHeadFuncCall
```

History returns a sequence of GitserverClientHeadFuncCall objects describing the invocations of this function. 

#### <a id="GitserverClientHeadFunc.PushHook" href="#GitserverClientHeadFunc.PushHook">func (f *GitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: enqueuer.GitserverClientHeadFunc.PushHook
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Head method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientHeadFunc.PushReturn" href="#GitserverClientHeadFunc.PushReturn">func (f *GitserverClientHeadFunc) PushReturn(r0 string, r1 error)</a>

```
searchKey: enqueuer.GitserverClientHeadFunc.PushReturn
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) PushReturn(r0 string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientHeadFunc.SetDefaultHook" href="#GitserverClientHeadFunc.SetDefaultHook">func (f *GitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: enqueuer.GitserverClientHeadFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))
```

SetDefaultHook sets function that is called when the Head method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientHeadFunc.SetDefaultReturn" href="#GitserverClientHeadFunc.SetDefaultReturn">func (f *GitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)</a>

```
searchKey: enqueuer.GitserverClientHeadFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientHeadFunc.appendCall" href="#GitserverClientHeadFunc.appendCall">func (f *GitserverClientHeadFunc) appendCall(r0 GitserverClientHeadFuncCall)</a>

```
searchKey: enqueuer.GitserverClientHeadFunc.appendCall
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) appendCall(r0 GitserverClientHeadFuncCall)
```

#### <a id="GitserverClientHeadFunc.nextHook" href="#GitserverClientHeadFunc.nextHook">func (f *GitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)</a>

```
searchKey: enqueuer.GitserverClientHeadFunc.nextHook
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)
```

### <a id="GitserverClientHeadFuncCall" href="#GitserverClientHeadFuncCall">type GitserverClientHeadFuncCall struct</a>

```
searchKey: enqueuer.GitserverClientHeadFuncCall
tags: [struct private]
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
searchKey: enqueuer.GitserverClientHeadFuncCall.Args
tags: [method private]
```

```Go
func (c GitserverClientHeadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientHeadFuncCall.Results" href="#GitserverClientHeadFuncCall.Results">func (c GitserverClientHeadFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.GitserverClientHeadFuncCall.Results
tags: [method private]
```

```Go
func (c GitserverClientHeadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientListFilesFunc" href="#GitserverClientListFilesFunc">type GitserverClientListFilesFunc struct</a>

```
searchKey: enqueuer.GitserverClientListFilesFunc
tags: [struct private]
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

#### <a id="GitserverClientListFilesFunc.History" href="#GitserverClientListFilesFunc.History">func (f *GitserverClientListFilesFunc) History() []GitserverClientListFilesFuncCall</a>

```
searchKey: enqueuer.GitserverClientListFilesFunc.History
tags: [method private]
```

```Go
func (f *GitserverClientListFilesFunc) History() []GitserverClientListFilesFuncCall
```

History returns a sequence of GitserverClientListFilesFuncCall objects describing the invocations of this function. 

#### <a id="GitserverClientListFilesFunc.PushHook" href="#GitserverClientListFilesFunc.PushHook">func (f *GitserverClientListFilesFunc) PushHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))</a>

```
searchKey: enqueuer.GitserverClientListFilesFunc.PushHook
tags: [method private]
```

```Go
func (f *GitserverClientListFilesFunc) PushHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ListFiles method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientListFilesFunc.PushReturn" href="#GitserverClientListFilesFunc.PushReturn">func (f *GitserverClientListFilesFunc) PushReturn(r0 []string, r1 error)</a>

```
searchKey: enqueuer.GitserverClientListFilesFunc.PushReturn
tags: [method private]
```

```Go
func (f *GitserverClientListFilesFunc) PushReturn(r0 []string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientListFilesFunc.SetDefaultHook" href="#GitserverClientListFilesFunc.SetDefaultHook">func (f *GitserverClientListFilesFunc) SetDefaultHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))</a>

```
searchKey: enqueuer.GitserverClientListFilesFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *GitserverClientListFilesFunc) SetDefaultHook(hook func(context.Context, int, string, *regexp.Regexp) ([]string, error))
```

SetDefaultHook sets function that is called when the ListFiles method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientListFilesFunc.SetDefaultReturn" href="#GitserverClientListFilesFunc.SetDefaultReturn">func (f *GitserverClientListFilesFunc) SetDefaultReturn(r0 []string, r1 error)</a>

```
searchKey: enqueuer.GitserverClientListFilesFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *GitserverClientListFilesFunc) SetDefaultReturn(r0 []string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientListFilesFunc.appendCall" href="#GitserverClientListFilesFunc.appendCall">func (f *GitserverClientListFilesFunc) appendCall(r0 GitserverClientListFilesFuncCall)</a>

```
searchKey: enqueuer.GitserverClientListFilesFunc.appendCall
tags: [method private]
```

```Go
func (f *GitserverClientListFilesFunc) appendCall(r0 GitserverClientListFilesFuncCall)
```

#### <a id="GitserverClientListFilesFunc.nextHook" href="#GitserverClientListFilesFunc.nextHook">func (f *GitserverClientListFilesFunc) nextHook() func(context.Context, int, string, *regexp.Regexp) ([]string, error)</a>

```
searchKey: enqueuer.GitserverClientListFilesFunc.nextHook
tags: [method private]
```

```Go
func (f *GitserverClientListFilesFunc) nextHook() func(context.Context, int, string, *regexp.Regexp) ([]string, error)
```

### <a id="GitserverClientListFilesFuncCall" href="#GitserverClientListFilesFuncCall">type GitserverClientListFilesFuncCall struct</a>

```
searchKey: enqueuer.GitserverClientListFilesFuncCall
tags: [struct private]
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
searchKey: enqueuer.GitserverClientListFilesFuncCall.Args
tags: [method private]
```

```Go
func (c GitserverClientListFilesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientListFilesFuncCall.Results" href="#GitserverClientListFilesFuncCall.Results">func (c GitserverClientListFilesFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.GitserverClientListFilesFuncCall.Results
tags: [method private]
```

```Go
func (c GitserverClientListFilesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientRawContentsFunc" href="#GitserverClientRawContentsFunc">type GitserverClientRawContentsFunc struct</a>

```
searchKey: enqueuer.GitserverClientRawContentsFunc
tags: [struct private]
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

#### <a id="GitserverClientRawContentsFunc.History" href="#GitserverClientRawContentsFunc.History">func (f *GitserverClientRawContentsFunc) History() []GitserverClientRawContentsFuncCall</a>

```
searchKey: enqueuer.GitserverClientRawContentsFunc.History
tags: [method private]
```

```Go
func (f *GitserverClientRawContentsFunc) History() []GitserverClientRawContentsFuncCall
```

History returns a sequence of GitserverClientRawContentsFuncCall objects describing the invocations of this function. 

#### <a id="GitserverClientRawContentsFunc.PushHook" href="#GitserverClientRawContentsFunc.PushHook">func (f *GitserverClientRawContentsFunc) PushHook(hook func(context.Context, int, string, string) ([]byte, error))</a>

```
searchKey: enqueuer.GitserverClientRawContentsFunc.PushHook
tags: [method private]
```

```Go
func (f *GitserverClientRawContentsFunc) PushHook(hook func(context.Context, int, string, string) ([]byte, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the RawContents method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientRawContentsFunc.PushReturn" href="#GitserverClientRawContentsFunc.PushReturn">func (f *GitserverClientRawContentsFunc) PushReturn(r0 []byte, r1 error)</a>

```
searchKey: enqueuer.GitserverClientRawContentsFunc.PushReturn
tags: [method private]
```

```Go
func (f *GitserverClientRawContentsFunc) PushReturn(r0 []byte, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientRawContentsFunc.SetDefaultHook" href="#GitserverClientRawContentsFunc.SetDefaultHook">func (f *GitserverClientRawContentsFunc) SetDefaultHook(hook func(context.Context, int, string, string) ([]byte, error))</a>

```
searchKey: enqueuer.GitserverClientRawContentsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *GitserverClientRawContentsFunc) SetDefaultHook(hook func(context.Context, int, string, string) ([]byte, error))
```

SetDefaultHook sets function that is called when the RawContents method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientRawContentsFunc.SetDefaultReturn" href="#GitserverClientRawContentsFunc.SetDefaultReturn">func (f *GitserverClientRawContentsFunc) SetDefaultReturn(r0 []byte, r1 error)</a>

```
searchKey: enqueuer.GitserverClientRawContentsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *GitserverClientRawContentsFunc) SetDefaultReturn(r0 []byte, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientRawContentsFunc.appendCall" href="#GitserverClientRawContentsFunc.appendCall">func (f *GitserverClientRawContentsFunc) appendCall(r0 GitserverClientRawContentsFuncCall)</a>

```
searchKey: enqueuer.GitserverClientRawContentsFunc.appendCall
tags: [method private]
```

```Go
func (f *GitserverClientRawContentsFunc) appendCall(r0 GitserverClientRawContentsFuncCall)
```

#### <a id="GitserverClientRawContentsFunc.nextHook" href="#GitserverClientRawContentsFunc.nextHook">func (f *GitserverClientRawContentsFunc) nextHook() func(context.Context, int, string, string) ([]byte, error)</a>

```
searchKey: enqueuer.GitserverClientRawContentsFunc.nextHook
tags: [method private]
```

```Go
func (f *GitserverClientRawContentsFunc) nextHook() func(context.Context, int, string, string) ([]byte, error)
```

### <a id="GitserverClientRawContentsFuncCall" href="#GitserverClientRawContentsFuncCall">type GitserverClientRawContentsFuncCall struct</a>

```
searchKey: enqueuer.GitserverClientRawContentsFuncCall
tags: [struct private]
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
searchKey: enqueuer.GitserverClientRawContentsFuncCall.Args
tags: [method private]
```

```Go
func (c GitserverClientRawContentsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientRawContentsFuncCall.Results" href="#GitserverClientRawContentsFuncCall.Results">func (c GitserverClientRawContentsFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.GitserverClientRawContentsFuncCall.Results
tags: [method private]
```

```Go
func (c GitserverClientRawContentsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientResolveRevisionFunc" href="#GitserverClientResolveRevisionFunc">type GitserverClientResolveRevisionFunc struct</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFunc
tags: [struct private]
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

#### <a id="GitserverClientResolveRevisionFunc.History" href="#GitserverClientResolveRevisionFunc.History">func (f *GitserverClientResolveRevisionFunc) History() []GitserverClientResolveRevisionFuncCall</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFunc.History
tags: [method private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) History() []GitserverClientResolveRevisionFuncCall
```

History returns a sequence of GitserverClientResolveRevisionFuncCall objects describing the invocations of this function. 

#### <a id="GitserverClientResolveRevisionFunc.PushHook" href="#GitserverClientResolveRevisionFunc.PushHook">func (f *GitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFunc.PushHook
tags: [method private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ResolveRevision method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientResolveRevisionFunc.PushReturn" href="#GitserverClientResolveRevisionFunc.PushReturn">func (f *GitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFunc.PushReturn
tags: [method private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientResolveRevisionFunc.SetDefaultHook" href="#GitserverClientResolveRevisionFunc.SetDefaultHook">func (f *GitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))
```

SetDefaultHook sets function that is called when the ResolveRevision method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientResolveRevisionFunc.SetDefaultReturn" href="#GitserverClientResolveRevisionFunc.SetDefaultReturn">func (f *GitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientResolveRevisionFunc.appendCall" href="#GitserverClientResolveRevisionFunc.appendCall">func (f *GitserverClientResolveRevisionFunc) appendCall(r0 GitserverClientResolveRevisionFuncCall)</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFunc.appendCall
tags: [method private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) appendCall(r0 GitserverClientResolveRevisionFuncCall)
```

#### <a id="GitserverClientResolveRevisionFunc.nextHook" href="#GitserverClientResolveRevisionFunc.nextHook">func (f *GitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFunc.nextHook
tags: [method private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)
```

### <a id="GitserverClientResolveRevisionFuncCall" href="#GitserverClientResolveRevisionFuncCall">type GitserverClientResolveRevisionFuncCall struct</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFuncCall
tags: [struct private]
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
searchKey: enqueuer.GitserverClientResolveRevisionFuncCall.Args
tags: [method private]
```

```Go
func (c GitserverClientResolveRevisionFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientResolveRevisionFuncCall.Results" href="#GitserverClientResolveRevisionFuncCall.Results">func (c GitserverClientResolveRevisionFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.GitserverClientResolveRevisionFuncCall.Results
tags: [method private]
```

```Go
func (c GitserverClientResolveRevisionFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="IndexEnqueuer" href="#IndexEnqueuer">type IndexEnqueuer struct</a>

```
searchKey: enqueuer.IndexEnqueuer
tags: [struct]
```

```Go
type IndexEnqueuer struct {
	dbStore          DBStore
	gitserverClient  GitserverClient
	repoUpdater      RepoUpdaterClient
	maxJobsPerCommit int
	operations       *operations
}
```

#### <a id="NewIndexEnqueuer" href="#NewIndexEnqueuer">func NewIndexEnqueuer(dbStore DBStore, gitClient GitserverClient, repoUpdater RepoUpdaterClient, observationContext *observation.Context) *IndexEnqueuer</a>

```
searchKey: enqueuer.NewIndexEnqueuer
tags: [function]
```

```Go
func NewIndexEnqueuer(dbStore DBStore, gitClient GitserverClient, repoUpdater RepoUpdaterClient, observationContext *observation.Context) *IndexEnqueuer
```

#### <a id="IndexEnqueuer.ForceQueueIndexesForRepository" href="#IndexEnqueuer.ForceQueueIndexesForRepository">func (s *IndexEnqueuer) ForceQueueIndexesForRepository(ctx context.Context, repositoryID int) error</a>

```
searchKey: enqueuer.IndexEnqueuer.ForceQueueIndexesForRepository
tags: [method]
```

```Go
func (s *IndexEnqueuer) ForceQueueIndexesForRepository(ctx context.Context, repositoryID int) error
```

ForceQueueIndexesForRepository attempts to queue an index for the lastest commit on the default branch of the given repository. If this repository and commit already has an index or upload record associated with it, a new index job record will still be enqueued. 

#### <a id="IndexEnqueuer.InferIndexConfiguration" href="#IndexEnqueuer.InferIndexConfiguration">func (s *IndexEnqueuer) InferIndexConfiguration(ctx context.Context, repositoryID int) (_ *config.IndexConfiguration, err error)</a>

```
searchKey: enqueuer.IndexEnqueuer.InferIndexConfiguration
tags: [method]
```

```Go
func (s *IndexEnqueuer) InferIndexConfiguration(ctx context.Context, repositoryID int) (_ *config.IndexConfiguration, err error)
```

InferIndexConfiguration looks at the repository contents at the lastest commit on the default branch of the given repository and determines an index configuration that is likely to succeed. 

#### <a id="IndexEnqueuer.QueueIndexesForPackage" href="#IndexEnqueuer.QueueIndexesForPackage">func (s *IndexEnqueuer) QueueIndexesForPackage(ctx context.Context, pkg semantic.Package) (err error)</a>

```
searchKey: enqueuer.IndexEnqueuer.QueueIndexesForPackage
tags: [method]
```

```Go
func (s *IndexEnqueuer) QueueIndexesForPackage(ctx context.Context, pkg semantic.Package) (err error)
```

QueueIndexesForPackage enqueues index jobs for a dependency of a recently-processed precise code intelligence index. Currently we only support recognition of "gomod" import monikers. 

#### <a id="IndexEnqueuer.QueueIndexesForRepository" href="#IndexEnqueuer.QueueIndexesForRepository">func (s *IndexEnqueuer) QueueIndexesForRepository(ctx context.Context, repositoryID int) error</a>

```
searchKey: enqueuer.IndexEnqueuer.QueueIndexesForRepository
tags: [method]
```

```Go
func (s *IndexEnqueuer) QueueIndexesForRepository(ctx context.Context, repositoryID int) error
```

QueueIndexesForRepository attempts to queue an index for the lastest commit on the default branch of the given repository. If this repository and commit already has an index or upload record associated with it, this method does nothing. 

#### <a id="IndexEnqueuer.getIndexRecords" href="#IndexEnqueuer.getIndexRecords">func (s *IndexEnqueuer) getIndexRecords(ctx context.Context, repositoryID int, commit string) ([]store.Index, error)</a>

```
searchKey: enqueuer.IndexEnqueuer.getIndexRecords
tags: [method private]
```

```Go
func (s *IndexEnqueuer) getIndexRecords(ctx context.Context, repositoryID int, commit string) ([]store.Index, error)
```

getIndexRecords determines the set of index records that should be enqueued for the given commit. For each repository, we look for index configuration in the following order: 

```
- in the database
- committed to `sourcegraph.yaml` in the repository
- inferred from the repository structure

```
#### <a id="IndexEnqueuer.getIndexRecordsFromConfigurationInDatabase" href="#IndexEnqueuer.getIndexRecordsFromConfigurationInDatabase">func (s *IndexEnqueuer) getIndexRecordsFromConfigurationInDatabase(ctx context.Context, repositoryID int, commit string) ([]store.Index, bool, error)</a>

```
searchKey: enqueuer.IndexEnqueuer.getIndexRecordsFromConfigurationInDatabase
tags: [method private]
```

```Go
func (s *IndexEnqueuer) getIndexRecordsFromConfigurationInDatabase(ctx context.Context, repositoryID int, commit string) ([]store.Index, bool, error)
```

getIndexRecordsFromConfigurationInDatabase returns a set of index jobs configured via the UI for the given repository. If no jobs are configured via the UI then a false valued flag is returned. 

#### <a id="IndexEnqueuer.getIndexRecordsFromConfigurationInRepository" href="#IndexEnqueuer.getIndexRecordsFromConfigurationInRepository">func (s *IndexEnqueuer) getIndexRecordsFromConfigurationInRepository(ctx context.Context, repositoryID int, commit string) ([]store.Index, bool, error)</a>

```
searchKey: enqueuer.IndexEnqueuer.getIndexRecordsFromConfigurationInRepository
tags: [method private]
```

```Go
func (s *IndexEnqueuer) getIndexRecordsFromConfigurationInRepository(ctx context.Context, repositoryID int, commit string) ([]store.Index, bool, error)
```

getIndexRecordsFromConfigurationInRepository returns a set of index jobs configured via a committed configuration file at the given commit. If no jobs are configured within the repository then a false valued flag is returned. 

#### <a id="IndexEnqueuer.inferIndexJobsFromRepositoryStructure" href="#IndexEnqueuer.inferIndexJobsFromRepositoryStructure">func (s *IndexEnqueuer) inferIndexJobsFromRepositoryStructure(ctx context.Context, repositoryID int, commit string) ([]config.IndexJob, error)</a>

```
searchKey: enqueuer.IndexEnqueuer.inferIndexJobsFromRepositoryStructure
tags: [method private]
```

```Go
func (s *IndexEnqueuer) inferIndexJobsFromRepositoryStructure(ctx context.Context, repositoryID int, commit string) ([]config.IndexJob, error)
```

inferIndexJobsFromRepositoryStructure collects the result of  InferIndexJobs over all registered recognizers. 

#### <a id="IndexEnqueuer.inferIndexRecordsFromRepositoryStructure" href="#IndexEnqueuer.inferIndexRecordsFromRepositoryStructure">func (s *IndexEnqueuer) inferIndexRecordsFromRepositoryStructure(ctx context.Context, repositoryID int, commit string) ([]store.Index, bool, error)</a>

```
searchKey: enqueuer.IndexEnqueuer.inferIndexRecordsFromRepositoryStructure
tags: [method private]
```

```Go
func (s *IndexEnqueuer) inferIndexRecordsFromRepositoryStructure(ctx context.Context, repositoryID int, commit string) ([]store.Index, bool, error)
```

inferIndexRecordsFromRepositoryStructure looks at the repository contents at the given commit and determines a set of index jobs that are likely to succeed. If no jobs could be inferred then a false valued flag is returned. 

#### <a id="IndexEnqueuer.queueIndexForRepository" href="#IndexEnqueuer.queueIndexForRepository">func (s *IndexEnqueuer) queueIndexForRepository(ctx context.Context, repositoryID int, force bool) (err error)</a>

```
searchKey: enqueuer.IndexEnqueuer.queueIndexForRepository
tags: [method private]
```

```Go
func (s *IndexEnqueuer) queueIndexForRepository(ctx context.Context, repositoryID int, force bool) (err error)
```

queueIndexForRepository determines the head of the default branch of the given repository and attempts to determine a set of index jobs to enqueue. 

If the force flag is false, then the presence of an upload or index record for this given repository and commit will cause this method to no-op. Note that this is NOT a guarantee that there will never be any duplicate records when the flag is false. 

#### <a id="IndexEnqueuer.queueIndexForRepositoryAndCommit" href="#IndexEnqueuer.queueIndexForRepositoryAndCommit">func (s *IndexEnqueuer) queueIndexForRepositoryAndCommit(ctx context.Context, repositoryID int, commit string, force bool, traceLog observation.TraceLogger) error</a>

```
searchKey: enqueuer.IndexEnqueuer.queueIndexForRepositoryAndCommit
tags: [method private]
```

```Go
func (s *IndexEnqueuer) queueIndexForRepositoryAndCommit(ctx context.Context, repositoryID int, commit string, force bool, traceLog observation.TraceLogger) error
```

queueIndexForRepositoryAndCommit determines a set of index jobs to enqueue for the given repository and commit. 

If the force flag is false, then the presence of an upload or index record for this given repository and commit will cause this method to no-op. Note that this is NOT a guarantee that there will never be any duplicate records when the flag is false. 

#### <a id="IndexEnqueuer.queueIndexes" href="#IndexEnqueuer.queueIndexes">func (s *IndexEnqueuer) queueIndexes(ctx context.Context, repositoryID int, commit string, indexes []store.Index) (err error)</a>

```
searchKey: enqueuer.IndexEnqueuer.queueIndexes
tags: [method private]
```

```Go
func (s *IndexEnqueuer) queueIndexes(ctx context.Context, repositoryID int, commit string, indexes []store.Index) (err error)
```

queueIndexes inserts a set of index records into the database. It is assumed that the given repository id an commit are the same for each given index record. In the same transaction as the insert, the repository's row is updated in the lsif_indexable_repositories table as a crude form of rate limiting. 

### <a id="MockDBStore" href="#MockDBStore">type MockDBStore struct</a>

```
searchKey: enqueuer.MockDBStore
tags: [struct private]
```

```Go
type MockDBStore struct {
	// DirtyRepositoriesFunc is an instance of a mock function object
	// controlling the behavior of the method DirtyRepositories.
	DirtyRepositoriesFunc *DBStoreDirtyRepositoriesFunc
	// DoneFunc is an instance of a mock function object controlling the
	// behavior of the method Done.
	DoneFunc *DBStoreDoneFunc
	// GetIndexConfigurationByRepositoryIDFunc is an instance of a mock
	// function object controlling the behavior of the method
	// GetIndexConfigurationByRepositoryID.
	GetIndexConfigurationByRepositoryIDFunc *DBStoreGetIndexConfigurationByRepositoryIDFunc
	// GetRepositoriesWithIndexConfigurationFunc is an instance of a mock
	// function object controlling the behavior of the method
	// GetRepositoriesWithIndexConfiguration.
	GetRepositoriesWithIndexConfigurationFunc *DBStoreGetRepositoriesWithIndexConfigurationFunc
	// HandleFunc is an instance of a mock function object controlling the
	// behavior of the method Handle.
	HandleFunc *DBStoreHandleFunc
	// InsertIndexFunc is an instance of a mock function object controlling
	// the behavior of the method InsertIndex.
	InsertIndexFunc *DBStoreInsertIndexFunc
	// IsQueuedFunc is an instance of a mock function object controlling the
	// behavior of the method IsQueued.
	IsQueuedFunc *DBStoreIsQueuedFunc
	// TransactFunc is an instance of a mock function object controlling the
	// behavior of the method Transact.
	TransactFunc *DBStoreTransactFunc
}
```

MockDBStore is a mock implementation of the DBStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/autoindex/enqueuer) used for unit testing. 

#### <a id="NewMockDBStore" href="#NewMockDBStore">func NewMockDBStore() *MockDBStore</a>

```
searchKey: enqueuer.NewMockDBStore
tags: [function private]
```

```Go
func NewMockDBStore() *MockDBStore
```

NewMockDBStore creates a new mock of the DBStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockDBStoreFrom" href="#NewMockDBStoreFrom">func NewMockDBStoreFrom(i DBStore) *MockDBStore</a>

```
searchKey: enqueuer.NewMockDBStoreFrom
tags: [function private]
```

```Go
func NewMockDBStoreFrom(i DBStore) *MockDBStore
```

NewMockDBStoreFrom creates a new mock of the MockDBStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockDBStore.DirtyRepositories" href="#MockDBStore.DirtyRepositories">func (m *MockDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)</a>

```
searchKey: enqueuer.MockDBStore.DirtyRepositories
tags: [method private]
```

```Go
func (m *MockDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)
```

DirtyRepositories delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Done" href="#MockDBStore.Done">func (m *MockDBStore) Done(v0 error) error</a>

```
searchKey: enqueuer.MockDBStore.Done
tags: [method private]
```

```Go
func (m *MockDBStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetIndexConfigurationByRepositoryID" href="#MockDBStore.GetIndexConfigurationByRepositoryID">func (m *MockDBStore) GetIndexConfigurationByRepositoryID(v0 context.Context, v1 int) (dbstore.IndexConfiguration, bool, error)</a>

```
searchKey: enqueuer.MockDBStore.GetIndexConfigurationByRepositoryID
tags: [method private]
```

```Go
func (m *MockDBStore) GetIndexConfigurationByRepositoryID(v0 context.Context, v1 int) (dbstore.IndexConfiguration, bool, error)
```

GetIndexConfigurationByRepositoryID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetRepositoriesWithIndexConfiguration" href="#MockDBStore.GetRepositoriesWithIndexConfiguration">func (m *MockDBStore) GetRepositoriesWithIndexConfiguration(v0 context.Context) ([]int, error)</a>

```
searchKey: enqueuer.MockDBStore.GetRepositoriesWithIndexConfiguration
tags: [method private]
```

```Go
func (m *MockDBStore) GetRepositoriesWithIndexConfiguration(v0 context.Context) ([]int, error)
```

GetRepositoriesWithIndexConfiguration delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Handle" href="#MockDBStore.Handle">func (m *MockDBStore) Handle() *basestore.TransactableHandle</a>

```
searchKey: enqueuer.MockDBStore.Handle
tags: [method private]
```

```Go
func (m *MockDBStore) Handle() *basestore.TransactableHandle
```

Handle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.InsertIndex" href="#MockDBStore.InsertIndex">func (m *MockDBStore) InsertIndex(v0 context.Context, v1 dbstore.Index) (int, error)</a>

```
searchKey: enqueuer.MockDBStore.InsertIndex
tags: [method private]
```

```Go
func (m *MockDBStore) InsertIndex(v0 context.Context, v1 dbstore.Index) (int, error)
```

InsertIndex delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.IsQueued" href="#MockDBStore.IsQueued">func (m *MockDBStore) IsQueued(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: enqueuer.MockDBStore.IsQueued
tags: [method private]
```

```Go
func (m *MockDBStore) IsQueued(v0 context.Context, v1 int, v2 string) (bool, error)
```

IsQueued delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Transact" href="#MockDBStore.Transact">func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)</a>

```
searchKey: enqueuer.MockDBStore.Transact
tags: [method private]
```

```Go
func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)
```

Transact delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockGitserverClient" href="#MockGitserverClient">type MockGitserverClient struct</a>

```
searchKey: enqueuer.MockGitserverClient
tags: [struct private]
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

MockGitserverClient is a mock implementation of the GitserverClient interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/autoindex/enqueuer) used for unit testing. 

#### <a id="NewMockGitserverClient" href="#NewMockGitserverClient">func NewMockGitserverClient() *MockGitserverClient</a>

```
searchKey: enqueuer.NewMockGitserverClient
tags: [function private]
```

```Go
func NewMockGitserverClient() *MockGitserverClient
```

NewMockGitserverClient creates a new mock of the GitserverClient interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGitserverClientFrom" href="#NewMockGitserverClientFrom">func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient</a>

```
searchKey: enqueuer.NewMockGitserverClientFrom
tags: [function private]
```

```Go
func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient
```

NewMockGitserverClientFrom creates a new mock of the MockGitserverClient interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGitserverClient.FileExists" href="#MockGitserverClient.FileExists">func (m *MockGitserverClient) FileExists(v0 context.Context, v1 int, v2 string, v3 string) (bool, error)</a>

```
searchKey: enqueuer.MockGitserverClient.FileExists
tags: [method private]
```

```Go
func (m *MockGitserverClient) FileExists(v0 context.Context, v1 int, v2 string, v3 string) (bool, error)
```

FileExists delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.Head" href="#MockGitserverClient.Head">func (m *MockGitserverClient) Head(v0 context.Context, v1 int) (string, error)</a>

```
searchKey: enqueuer.MockGitserverClient.Head
tags: [method private]
```

```Go
func (m *MockGitserverClient) Head(v0 context.Context, v1 int) (string, error)
```

Head delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.ListFiles" href="#MockGitserverClient.ListFiles">func (m *MockGitserverClient) ListFiles(v0 context.Context, v1 int, v2 string, v3 *regexp.Regexp) ([]string, error)</a>

```
searchKey: enqueuer.MockGitserverClient.ListFiles
tags: [method private]
```

```Go
func (m *MockGitserverClient) ListFiles(v0 context.Context, v1 int, v2 string, v3 *regexp.Regexp) ([]string, error)
```

ListFiles delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.RawContents" href="#MockGitserverClient.RawContents">func (m *MockGitserverClient) RawContents(v0 context.Context, v1 int, v2 string, v3 string) ([]byte, error)</a>

```
searchKey: enqueuer.MockGitserverClient.RawContents
tags: [method private]
```

```Go
func (m *MockGitserverClient) RawContents(v0 context.Context, v1 int, v2 string, v3 string) ([]byte, error)
```

RawContents delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.ResolveRevision" href="#MockGitserverClient.ResolveRevision">func (m *MockGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)</a>

```
searchKey: enqueuer.MockGitserverClient.ResolveRevision
tags: [method private]
```

```Go
func (m *MockGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)
```

ResolveRevision delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockRepoUpdaterClient" href="#MockRepoUpdaterClient">type MockRepoUpdaterClient struct</a>

```
searchKey: enqueuer.MockRepoUpdaterClient
tags: [struct private]
```

```Go
type MockRepoUpdaterClient struct {
	// EnqueueRepoUpdateFunc is an instance of a mock function object
	// controlling the behavior of the method EnqueueRepoUpdate.
	EnqueueRepoUpdateFunc *RepoUpdaterClientEnqueueRepoUpdateFunc
}
```

MockRepoUpdaterClient is a mock implementation of the RepoUpdaterClient interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/autoindex/enqueuer) used for unit testing. 

#### <a id="NewMockRepoUpdaterClient" href="#NewMockRepoUpdaterClient">func NewMockRepoUpdaterClient() *MockRepoUpdaterClient</a>

```
searchKey: enqueuer.NewMockRepoUpdaterClient
tags: [function private]
```

```Go
func NewMockRepoUpdaterClient() *MockRepoUpdaterClient
```

NewMockRepoUpdaterClient creates a new mock of the RepoUpdaterClient interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockRepoUpdaterClientFrom" href="#NewMockRepoUpdaterClientFrom">func NewMockRepoUpdaterClientFrom(i RepoUpdaterClient) *MockRepoUpdaterClient</a>

```
searchKey: enqueuer.NewMockRepoUpdaterClientFrom
tags: [function private]
```

```Go
func NewMockRepoUpdaterClientFrom(i RepoUpdaterClient) *MockRepoUpdaterClient
```

NewMockRepoUpdaterClientFrom creates a new mock of the MockRepoUpdaterClient interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockRepoUpdaterClient.EnqueueRepoUpdate" href="#MockRepoUpdaterClient.EnqueueRepoUpdate">func (m *MockRepoUpdaterClient) EnqueueRepoUpdate(v0 context.Context, v1 api.RepoName) (*protocol.RepoUpdateResponse, error)</a>

```
searchKey: enqueuer.MockRepoUpdaterClient.EnqueueRepoUpdate
tags: [method private]
```

```Go
func (m *MockRepoUpdaterClient) EnqueueRepoUpdate(v0 context.Context, v1 api.RepoName) (*protocol.RepoUpdateResponse, error)
```

EnqueueRepoUpdate delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="RepoUpdaterClient" href="#RepoUpdaterClient">type RepoUpdaterClient interface</a>

```
searchKey: enqueuer.RepoUpdaterClient
tags: [interface]
```

```Go
type RepoUpdaterClient interface {
	EnqueueRepoUpdate(ctx context.Context, repo api.RepoName) (*protocol.RepoUpdateResponse, error)
}
```

### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc" href="#RepoUpdaterClientEnqueueRepoUpdateFunc">type RepoUpdaterClientEnqueueRepoUpdateFunc struct</a>

```
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFunc
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
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFunc.History
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) History() []RepoUpdaterClientEnqueueRepoUpdateFuncCall
```

History returns a sequence of RepoUpdaterClientEnqueueRepoUpdateFuncCall objects describing the invocations of this function. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.PushHook" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.PushHook">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))</a>

```
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFunc.PushHook
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the EnqueueRepoUpdate method of the parent MockRepoUpdaterClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.PushReturn" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.PushReturn">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushReturn(r0 *protocol.RepoUpdateResponse, r1 error)</a>

```
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFunc.PushReturn
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) PushReturn(r0 *protocol.RepoUpdateResponse, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultHook" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultHook">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))</a>

```
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultHook(hook func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error))
```

SetDefaultHook sets function that is called when the EnqueueRepoUpdate method of the parent MockRepoUpdaterClient instance is invoked and the hook queue is empty. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultReturn" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultReturn">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultReturn(r0 *protocol.RepoUpdateResponse, r1 error)</a>

```
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) SetDefaultReturn(r0 *protocol.RepoUpdateResponse, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.appendCall" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.appendCall">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) appendCall(r0 RepoUpdaterClientEnqueueRepoUpdateFuncCall)</a>

```
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFunc.appendCall
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) appendCall(r0 RepoUpdaterClientEnqueueRepoUpdateFuncCall)
```

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFunc.nextHook" href="#RepoUpdaterClientEnqueueRepoUpdateFunc.nextHook">func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) nextHook() func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error)</a>

```
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFunc.nextHook
tags: [method private]
```

```Go
func (f *RepoUpdaterClientEnqueueRepoUpdateFunc) nextHook() func(context.Context, api.RepoName) (*protocol.RepoUpdateResponse, error)
```

### <a id="RepoUpdaterClientEnqueueRepoUpdateFuncCall" href="#RepoUpdaterClientEnqueueRepoUpdateFuncCall">type RepoUpdaterClientEnqueueRepoUpdateFuncCall struct</a>

```
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFuncCall
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
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFuncCall.Args
tags: [method private]
```

```Go
func (c RepoUpdaterClientEnqueueRepoUpdateFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="RepoUpdaterClientEnqueueRepoUpdateFuncCall.Results" href="#RepoUpdaterClientEnqueueRepoUpdateFuncCall.Results">func (c RepoUpdaterClientEnqueueRepoUpdateFuncCall) Results() []interface{}</a>

```
searchKey: enqueuer.RepoUpdaterClientEnqueueRepoUpdateFuncCall.Results
tags: [method private]
```

```Go
func (c RepoUpdaterClientEnqueueRepoUpdateFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="gitClient" href="#gitClient">type gitClient struct</a>

```
searchKey: enqueuer.gitClient
tags: [struct private]
```

```Go
type gitClient struct {
	client       GitserverClient
	repositoryID int
	commit       string
}
```

#### <a id="newGitClient" href="#newGitClient">func newGitClient(client GitserverClient, repositoryID int, commit string) gitClient</a>

```
searchKey: enqueuer.newGitClient
tags: [function private]
```

```Go
func newGitClient(client GitserverClient, repositoryID int, commit string) gitClient
```

#### <a id="gitClient.FileExists" href="#gitClient.FileExists">func (c gitClient) FileExists(ctx context.Context, file string) (bool, error)</a>

```
searchKey: enqueuer.gitClient.FileExists
tags: [method private]
```

```Go
func (c gitClient) FileExists(ctx context.Context, file string) (bool, error)
```

#### <a id="gitClient.ListFiles" href="#gitClient.ListFiles">func (c gitClient) ListFiles(ctx context.Context, pattern *regexp.Regexp) ([]string, error)</a>

```
searchKey: enqueuer.gitClient.ListFiles
tags: [method private]
```

```Go
func (c gitClient) ListFiles(ctx context.Context, pattern *regexp.Regexp) ([]string, error)
```

#### <a id="gitClient.RawContents" href="#gitClient.RawContents">func (c gitClient) RawContents(ctx context.Context, file string) ([]byte, error)</a>

```
searchKey: enqueuer.gitClient.RawContents
tags: [method private]
```

```Go
func (c gitClient) RawContents(ctx context.Context, file string) ([]byte, error)
```

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: enqueuer.operations
tags: [struct private]
```

```Go
type operations struct {
	QueueIndex              *observation.Operation
	InferIndexConfiguration *observation.Operation
	QueueIndexForPackage    *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context) *operations</a>

```
searchKey: enqueuer.newOperations
tags: [function private]
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="InferGoRepositoryAndRevision" href="#InferGoRepositoryAndRevision">func InferGoRepositoryAndRevision(pkg semantic.Package) (repoName, gitTagOrCommit string, ok bool)</a>

```
searchKey: enqueuer.InferGoRepositoryAndRevision
tags: [function]
```

```Go
func InferGoRepositoryAndRevision(pkg semantic.Package) (repoName, gitTagOrCommit string, ok bool)
```

### <a id="TestInferGoRepositoryAndRevision" href="#TestInferGoRepositoryAndRevision">func TestInferGoRepositoryAndRevision(t *testing.T)</a>

```
searchKey: enqueuer.TestInferGoRepositoryAndRevision
tags: [function private test]
```

```Go
func TestInferGoRepositoryAndRevision(t *testing.T)
```

### <a id="TestQueueIndexesForPackage" href="#TestQueueIndexesForPackage">func TestQueueIndexesForPackage(t *testing.T)</a>

```
searchKey: enqueuer.TestQueueIndexesForPackage
tags: [function private test]
```

```Go
func TestQueueIndexesForPackage(t *testing.T)
```

### <a id="TestQueueIndexesForRepositoryInDatabase" href="#TestQueueIndexesForRepositoryInDatabase">func TestQueueIndexesForRepositoryInDatabase(t *testing.T)</a>

```
searchKey: enqueuer.TestQueueIndexesForRepositoryInDatabase
tags: [function private test]
```

```Go
func TestQueueIndexesForRepositoryInDatabase(t *testing.T)
```

### <a id="TestQueueIndexesForRepositoryInRepository" href="#TestQueueIndexesForRepositoryInRepository">func TestQueueIndexesForRepositoryInRepository(t *testing.T)</a>

```
searchKey: enqueuer.TestQueueIndexesForRepositoryInRepository
tags: [function private test]
```

```Go
func TestQueueIndexesForRepositoryInRepository(t *testing.T)
```

### <a id="TestQueueIndexesForRepositoryInferred" href="#TestQueueIndexesForRepositoryInferred">func TestQueueIndexesForRepositoryInferred(t *testing.T)</a>

```
searchKey: enqueuer.TestQueueIndexesForRepositoryInferred
tags: [function private test]
```

```Go
func TestQueueIndexesForRepositoryInferred(t *testing.T)
```

### <a id="TestQueueIndexesForRepositoryInferredTooLarge" href="#TestQueueIndexesForRepositoryInferredTooLarge">func TestQueueIndexesForRepositoryInferredTooLarge(t *testing.T)</a>

```
searchKey: enqueuer.TestQueueIndexesForRepositoryInferredTooLarge
tags: [function private test]
```

```Go
func TestQueueIndexesForRepositoryInferredTooLarge(t *testing.T)
```

### <a id="convertIndexConfiguration" href="#convertIndexConfiguration">func convertIndexConfiguration(repositoryID int, commit string, indexConfiguration config.IndexConfiguration) (indexes []store.Index)</a>

```
searchKey: enqueuer.convertIndexConfiguration
tags: [function private]
```

```Go
func convertIndexConfiguration(repositoryID int, commit string, indexConfiguration config.IndexConfiguration) (indexes []store.Index)
```

convertIndexConfiguration converts an index configuration object into a set of index records to be inserted into the database. 

### <a id="convertInferredConfiguration" href="#convertInferredConfiguration">func convertInferredConfiguration(repositoryID int, commit string, indexJobs []config.IndexJob) (indexes []store.Index)</a>

```
searchKey: enqueuer.convertInferredConfiguration
tags: [function private]
```

```Go
func convertInferredConfiguration(repositoryID int, commit string, indexJobs []config.IndexJob) (indexes []store.Index)
```

convertInferredConfiguration converts a set of index jobs into a set of index records to be inserted into the database. 

### <a id="isNotFoundError" href="#isNotFoundError">func isNotFoundError(err error) bool</a>

```
searchKey: enqueuer.isNotFoundError
tags: [function private]
```

```Go
func isNotFoundError(err error) bool
```

