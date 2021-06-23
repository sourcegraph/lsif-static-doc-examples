# Package worker

## Index

* [Constants](#const)
    * [const CloneInProgressDelay](#CloneInProgressDelay)
* [Types](#type)
    * [type handler struct](#handler)
        * [func (h *handler) Handle(ctx context.Context, tx dbworkerstore.Store, record workerutil.Record) error](#handler.Handle)
        * [func (h *handler) PreDequeue(ctx context.Context) (bool, interface{}, error)](#handler.PreDequeue)
        * [func (h *handler) PreHandle(ctx context.Context, record workerutil.Record)](#handler.PreHandle)
        * [func (h *handler) PostHandle(ctx context.Context, record workerutil.Record)](#handler.PostHandle)
        * [func (h *handler) getSize(record workerutil.Record) int64](#handler.getSize)
        * [func (h *handler) handle(ctx context.Context, workerStore dbworkerstore.Store, dbStore DBStore, upload store.Upload) (requeued bool, err error)](#handler.handle)
    * [type DBStore interface](#DBStore)
    * [type DBStoreShim struct](#DBStoreShim)
        * [func (s *DBStoreShim) With(other basestore.ShareableStore) DBStore](#DBStoreShim.With)
        * [func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)](#DBStoreShim.Transact)
    * [type LSIFStore interface](#LSIFStore)
    * [type LSIFStoreShim struct](#LSIFStoreShim)
        * [func (s *LSIFStoreShim) Transact(ctx context.Context) (LSIFStore, error)](#LSIFStoreShim.Transact)
    * [type GitserverClient interface](#GitserverClient)
    * [type MockDBStore struct](#MockDBStore)
        * [func NewMockDBStore() *MockDBStore](#NewMockDBStore)
        * [func NewMockDBStoreFrom(i DBStore) *MockDBStore](#NewMockDBStoreFrom)
        * [func (m *MockDBStore) DeleteOverlappingDumps(v0 context.Context, v1 int, v2 string, v3 string, v4 string) error](#MockDBStore.DeleteOverlappingDumps)
        * [func (m *MockDBStore) Done(v0 error) error](#MockDBStore.Done)
        * [func (m *MockDBStore) Handle() *basestore.TransactableHandle](#MockDBStore.Handle)
        * [func (m *MockDBStore) InsertDependencyIndexingJob(v0 context.Context, v1 int) (int, error)](#MockDBStore.InsertDependencyIndexingJob)
        * [func (m *MockDBStore) MarkRepositoryAsDirty(v0 context.Context, v1 int) error](#MockDBStore.MarkRepositoryAsDirty)
        * [func (m *MockDBStore) RepoName(v0 context.Context, v1 int) (string, error)](#MockDBStore.RepoName)
        * [func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)](#MockDBStore.Transact)
        * [func (m *MockDBStore) UpdateCommitedAt(v0 context.Context, v1 int, v2 time.Time) error](#MockDBStore.UpdateCommitedAt)
        * [func (m *MockDBStore) UpdatePackageReferences(v0 context.Context, v1 int, v2 []semantic.PackageReference) error](#MockDBStore.UpdatePackageReferences)
        * [func (m *MockDBStore) UpdatePackages(v0 context.Context, v1 int, v2 []semantic.Package) error](#MockDBStore.UpdatePackages)
        * [func (m *MockDBStore) With(v0 basestore.ShareableStore) DBStore](#MockDBStore.With)
    * [type DBStoreDeleteOverlappingDumpsFunc struct](#DBStoreDeleteOverlappingDumpsFunc)
        * [func (f *DBStoreDeleteOverlappingDumpsFunc) SetDefaultHook(hook func(context.Context, int, string, string, string) error)](#DBStoreDeleteOverlappingDumpsFunc.SetDefaultHook)
        * [func (f *DBStoreDeleteOverlappingDumpsFunc) PushHook(hook func(context.Context, int, string, string, string) error)](#DBStoreDeleteOverlappingDumpsFunc.PushHook)
        * [func (f *DBStoreDeleteOverlappingDumpsFunc) SetDefaultReturn(r0 error)](#DBStoreDeleteOverlappingDumpsFunc.SetDefaultReturn)
        * [func (f *DBStoreDeleteOverlappingDumpsFunc) PushReturn(r0 error)](#DBStoreDeleteOverlappingDumpsFunc.PushReturn)
        * [func (f *DBStoreDeleteOverlappingDumpsFunc) nextHook() func(context.Context, int, string, string, string) error](#DBStoreDeleteOverlappingDumpsFunc.nextHook)
        * [func (f *DBStoreDeleteOverlappingDumpsFunc) appendCall(r0 DBStoreDeleteOverlappingDumpsFuncCall)](#DBStoreDeleteOverlappingDumpsFunc.appendCall)
        * [func (f *DBStoreDeleteOverlappingDumpsFunc) History() []DBStoreDeleteOverlappingDumpsFuncCall](#DBStoreDeleteOverlappingDumpsFunc.History)
    * [type DBStoreDeleteOverlappingDumpsFuncCall struct](#DBStoreDeleteOverlappingDumpsFuncCall)
        * [func (c DBStoreDeleteOverlappingDumpsFuncCall) Args() []interface{}](#DBStoreDeleteOverlappingDumpsFuncCall.Args)
        * [func (c DBStoreDeleteOverlappingDumpsFuncCall) Results() []interface{}](#DBStoreDeleteOverlappingDumpsFuncCall.Results)
    * [type DBStoreDoneFunc struct](#DBStoreDoneFunc)
        * [func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)](#DBStoreDoneFunc.SetDefaultHook)
        * [func (f *DBStoreDoneFunc) PushHook(hook func(error) error)](#DBStoreDoneFunc.PushHook)
        * [func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)](#DBStoreDoneFunc.SetDefaultReturn)
        * [func (f *DBStoreDoneFunc) PushReturn(r0 error)](#DBStoreDoneFunc.PushReturn)
        * [func (f *DBStoreDoneFunc) nextHook() func(error) error](#DBStoreDoneFunc.nextHook)
        * [func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)](#DBStoreDoneFunc.appendCall)
        * [func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall](#DBStoreDoneFunc.History)
    * [type DBStoreDoneFuncCall struct](#DBStoreDoneFuncCall)
        * [func (c DBStoreDoneFuncCall) Args() []interface{}](#DBStoreDoneFuncCall.Args)
        * [func (c DBStoreDoneFuncCall) Results() []interface{}](#DBStoreDoneFuncCall.Results)
    * [type DBStoreHandleFunc struct](#DBStoreHandleFunc)
        * [func (f *DBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)](#DBStoreHandleFunc.SetDefaultHook)
        * [func (f *DBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)](#DBStoreHandleFunc.PushHook)
        * [func (f *DBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)](#DBStoreHandleFunc.SetDefaultReturn)
        * [func (f *DBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)](#DBStoreHandleFunc.PushReturn)
        * [func (f *DBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle](#DBStoreHandleFunc.nextHook)
        * [func (f *DBStoreHandleFunc) appendCall(r0 DBStoreHandleFuncCall)](#DBStoreHandleFunc.appendCall)
        * [func (f *DBStoreHandleFunc) History() []DBStoreHandleFuncCall](#DBStoreHandleFunc.History)
    * [type DBStoreHandleFuncCall struct](#DBStoreHandleFuncCall)
        * [func (c DBStoreHandleFuncCall) Args() []interface{}](#DBStoreHandleFuncCall.Args)
        * [func (c DBStoreHandleFuncCall) Results() []interface{}](#DBStoreHandleFuncCall.Results)
    * [type DBStoreInsertDependencyIndexingJobFunc struct](#DBStoreInsertDependencyIndexingJobFunc)
        * [func (f *DBStoreInsertDependencyIndexingJobFunc) SetDefaultHook(hook func(context.Context, int) (int, error))](#DBStoreInsertDependencyIndexingJobFunc.SetDefaultHook)
        * [func (f *DBStoreInsertDependencyIndexingJobFunc) PushHook(hook func(context.Context, int) (int, error))](#DBStoreInsertDependencyIndexingJobFunc.PushHook)
        * [func (f *DBStoreInsertDependencyIndexingJobFunc) SetDefaultReturn(r0 int, r1 error)](#DBStoreInsertDependencyIndexingJobFunc.SetDefaultReturn)
        * [func (f *DBStoreInsertDependencyIndexingJobFunc) PushReturn(r0 int, r1 error)](#DBStoreInsertDependencyIndexingJobFunc.PushReturn)
        * [func (f *DBStoreInsertDependencyIndexingJobFunc) nextHook() func(context.Context, int) (int, error)](#DBStoreInsertDependencyIndexingJobFunc.nextHook)
        * [func (f *DBStoreInsertDependencyIndexingJobFunc) appendCall(r0 DBStoreInsertDependencyIndexingJobFuncCall)](#DBStoreInsertDependencyIndexingJobFunc.appendCall)
        * [func (f *DBStoreInsertDependencyIndexingJobFunc) History() []DBStoreInsertDependencyIndexingJobFuncCall](#DBStoreInsertDependencyIndexingJobFunc.History)
    * [type DBStoreInsertDependencyIndexingJobFuncCall struct](#DBStoreInsertDependencyIndexingJobFuncCall)
        * [func (c DBStoreInsertDependencyIndexingJobFuncCall) Args() []interface{}](#DBStoreInsertDependencyIndexingJobFuncCall.Args)
        * [func (c DBStoreInsertDependencyIndexingJobFuncCall) Results() []interface{}](#DBStoreInsertDependencyIndexingJobFuncCall.Results)
    * [type DBStoreMarkRepositoryAsDirtyFunc struct](#DBStoreMarkRepositoryAsDirtyFunc)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultHook(hook func(context.Context, int) error)](#DBStoreMarkRepositoryAsDirtyFunc.SetDefaultHook)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) PushHook(hook func(context.Context, int) error)](#DBStoreMarkRepositoryAsDirtyFunc.PushHook)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultReturn(r0 error)](#DBStoreMarkRepositoryAsDirtyFunc.SetDefaultReturn)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) PushReturn(r0 error)](#DBStoreMarkRepositoryAsDirtyFunc.PushReturn)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) nextHook() func(context.Context, int) error](#DBStoreMarkRepositoryAsDirtyFunc.nextHook)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) appendCall(r0 DBStoreMarkRepositoryAsDirtyFuncCall)](#DBStoreMarkRepositoryAsDirtyFunc.appendCall)
        * [func (f *DBStoreMarkRepositoryAsDirtyFunc) History() []DBStoreMarkRepositoryAsDirtyFuncCall](#DBStoreMarkRepositoryAsDirtyFunc.History)
    * [type DBStoreMarkRepositoryAsDirtyFuncCall struct](#DBStoreMarkRepositoryAsDirtyFuncCall)
        * [func (c DBStoreMarkRepositoryAsDirtyFuncCall) Args() []interface{}](#DBStoreMarkRepositoryAsDirtyFuncCall.Args)
        * [func (c DBStoreMarkRepositoryAsDirtyFuncCall) Results() []interface{}](#DBStoreMarkRepositoryAsDirtyFuncCall.Results)
    * [type DBStoreRepoNameFunc struct](#DBStoreRepoNameFunc)
        * [func (f *DBStoreRepoNameFunc) SetDefaultHook(hook func(context.Context, int) (string, error))](#DBStoreRepoNameFunc.SetDefaultHook)
        * [func (f *DBStoreRepoNameFunc) PushHook(hook func(context.Context, int) (string, error))](#DBStoreRepoNameFunc.PushHook)
        * [func (f *DBStoreRepoNameFunc) SetDefaultReturn(r0 string, r1 error)](#DBStoreRepoNameFunc.SetDefaultReturn)
        * [func (f *DBStoreRepoNameFunc) PushReturn(r0 string, r1 error)](#DBStoreRepoNameFunc.PushReturn)
        * [func (f *DBStoreRepoNameFunc) nextHook() func(context.Context, int) (string, error)](#DBStoreRepoNameFunc.nextHook)
        * [func (f *DBStoreRepoNameFunc) appendCall(r0 DBStoreRepoNameFuncCall)](#DBStoreRepoNameFunc.appendCall)
        * [func (f *DBStoreRepoNameFunc) History() []DBStoreRepoNameFuncCall](#DBStoreRepoNameFunc.History)
    * [type DBStoreRepoNameFuncCall struct](#DBStoreRepoNameFuncCall)
        * [func (c DBStoreRepoNameFuncCall) Args() []interface{}](#DBStoreRepoNameFuncCall.Args)
        * [func (c DBStoreRepoNameFuncCall) Results() []interface{}](#DBStoreRepoNameFuncCall.Results)
    * [type DBStoreTransactFunc struct](#DBStoreTransactFunc)
        * [func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))](#DBStoreTransactFunc.SetDefaultHook)
        * [func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))](#DBStoreTransactFunc.PushHook)
        * [func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)](#DBStoreTransactFunc.SetDefaultReturn)
        * [func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)](#DBStoreTransactFunc.PushReturn)
        * [func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)](#DBStoreTransactFunc.nextHook)
        * [func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)](#DBStoreTransactFunc.appendCall)
        * [func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall](#DBStoreTransactFunc.History)
    * [type DBStoreTransactFuncCall struct](#DBStoreTransactFuncCall)
        * [func (c DBStoreTransactFuncCall) Args() []interface{}](#DBStoreTransactFuncCall.Args)
        * [func (c DBStoreTransactFuncCall) Results() []interface{}](#DBStoreTransactFuncCall.Results)
    * [type DBStoreUpdateCommitedAtFunc struct](#DBStoreUpdateCommitedAtFunc)
        * [func (f *DBStoreUpdateCommitedAtFunc) SetDefaultHook(hook func(context.Context, int, time.Time) error)](#DBStoreUpdateCommitedAtFunc.SetDefaultHook)
        * [func (f *DBStoreUpdateCommitedAtFunc) PushHook(hook func(context.Context, int, time.Time) error)](#DBStoreUpdateCommitedAtFunc.PushHook)
        * [func (f *DBStoreUpdateCommitedAtFunc) SetDefaultReturn(r0 error)](#DBStoreUpdateCommitedAtFunc.SetDefaultReturn)
        * [func (f *DBStoreUpdateCommitedAtFunc) PushReturn(r0 error)](#DBStoreUpdateCommitedAtFunc.PushReturn)
        * [func (f *DBStoreUpdateCommitedAtFunc) nextHook() func(context.Context, int, time.Time) error](#DBStoreUpdateCommitedAtFunc.nextHook)
        * [func (f *DBStoreUpdateCommitedAtFunc) appendCall(r0 DBStoreUpdateCommitedAtFuncCall)](#DBStoreUpdateCommitedAtFunc.appendCall)
        * [func (f *DBStoreUpdateCommitedAtFunc) History() []DBStoreUpdateCommitedAtFuncCall](#DBStoreUpdateCommitedAtFunc.History)
    * [type DBStoreUpdateCommitedAtFuncCall struct](#DBStoreUpdateCommitedAtFuncCall)
        * [func (c DBStoreUpdateCommitedAtFuncCall) Args() []interface{}](#DBStoreUpdateCommitedAtFuncCall.Args)
        * [func (c DBStoreUpdateCommitedAtFuncCall) Results() []interface{}](#DBStoreUpdateCommitedAtFuncCall.Results)
    * [type DBStoreUpdatePackageReferencesFunc struct](#DBStoreUpdatePackageReferencesFunc)
        * [func (f *DBStoreUpdatePackageReferencesFunc) SetDefaultHook(hook func(context.Context, int, []semantic.PackageReference) error)](#DBStoreUpdatePackageReferencesFunc.SetDefaultHook)
        * [func (f *DBStoreUpdatePackageReferencesFunc) PushHook(hook func(context.Context, int, []semantic.PackageReference) error)](#DBStoreUpdatePackageReferencesFunc.PushHook)
        * [func (f *DBStoreUpdatePackageReferencesFunc) SetDefaultReturn(r0 error)](#DBStoreUpdatePackageReferencesFunc.SetDefaultReturn)
        * [func (f *DBStoreUpdatePackageReferencesFunc) PushReturn(r0 error)](#DBStoreUpdatePackageReferencesFunc.PushReturn)
        * [func (f *DBStoreUpdatePackageReferencesFunc) nextHook() func(context.Context, int, []semantic.PackageReference) error](#DBStoreUpdatePackageReferencesFunc.nextHook)
        * [func (f *DBStoreUpdatePackageReferencesFunc) appendCall(r0 DBStoreUpdatePackageReferencesFuncCall)](#DBStoreUpdatePackageReferencesFunc.appendCall)
        * [func (f *DBStoreUpdatePackageReferencesFunc) History() []DBStoreUpdatePackageReferencesFuncCall](#DBStoreUpdatePackageReferencesFunc.History)
    * [type DBStoreUpdatePackageReferencesFuncCall struct](#DBStoreUpdatePackageReferencesFuncCall)
        * [func (c DBStoreUpdatePackageReferencesFuncCall) Args() []interface{}](#DBStoreUpdatePackageReferencesFuncCall.Args)
        * [func (c DBStoreUpdatePackageReferencesFuncCall) Results() []interface{}](#DBStoreUpdatePackageReferencesFuncCall.Results)
    * [type DBStoreUpdatePackagesFunc struct](#DBStoreUpdatePackagesFunc)
        * [func (f *DBStoreUpdatePackagesFunc) SetDefaultHook(hook func(context.Context, int, []semantic.Package) error)](#DBStoreUpdatePackagesFunc.SetDefaultHook)
        * [func (f *DBStoreUpdatePackagesFunc) PushHook(hook func(context.Context, int, []semantic.Package) error)](#DBStoreUpdatePackagesFunc.PushHook)
        * [func (f *DBStoreUpdatePackagesFunc) SetDefaultReturn(r0 error)](#DBStoreUpdatePackagesFunc.SetDefaultReturn)
        * [func (f *DBStoreUpdatePackagesFunc) PushReturn(r0 error)](#DBStoreUpdatePackagesFunc.PushReturn)
        * [func (f *DBStoreUpdatePackagesFunc) nextHook() func(context.Context, int, []semantic.Package) error](#DBStoreUpdatePackagesFunc.nextHook)
        * [func (f *DBStoreUpdatePackagesFunc) appendCall(r0 DBStoreUpdatePackagesFuncCall)](#DBStoreUpdatePackagesFunc.appendCall)
        * [func (f *DBStoreUpdatePackagesFunc) History() []DBStoreUpdatePackagesFuncCall](#DBStoreUpdatePackagesFunc.History)
    * [type DBStoreUpdatePackagesFuncCall struct](#DBStoreUpdatePackagesFuncCall)
        * [func (c DBStoreUpdatePackagesFuncCall) Args() []interface{}](#DBStoreUpdatePackagesFuncCall.Args)
        * [func (c DBStoreUpdatePackagesFuncCall) Results() []interface{}](#DBStoreUpdatePackagesFuncCall.Results)
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
        * [func (m *MockGitserverClient) CommitDate(v0 context.Context, v1 int, v2 string) (time.Time, error)](#MockGitserverClient.CommitDate)
        * [func (m *MockGitserverClient) DirectoryChildren(v0 context.Context, v1 int, v2 string, v3 []string) (map[string][]string, error)](#MockGitserverClient.DirectoryChildren)
        * [func (m *MockGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)](#MockGitserverClient.ResolveRevision)
    * [type GitserverClientCommitDateFunc struct](#GitserverClientCommitDateFunc)
        * [func (f *GitserverClientCommitDateFunc) SetDefaultHook(hook func(context.Context, int, string) (time.Time, error))](#GitserverClientCommitDateFunc.SetDefaultHook)
        * [func (f *GitserverClientCommitDateFunc) PushHook(hook func(context.Context, int, string) (time.Time, error))](#GitserverClientCommitDateFunc.PushHook)
        * [func (f *GitserverClientCommitDateFunc) SetDefaultReturn(r0 time.Time, r1 error)](#GitserverClientCommitDateFunc.SetDefaultReturn)
        * [func (f *GitserverClientCommitDateFunc) PushReturn(r0 time.Time, r1 error)](#GitserverClientCommitDateFunc.PushReturn)
        * [func (f *GitserverClientCommitDateFunc) nextHook() func(context.Context, int, string) (time.Time, error)](#GitserverClientCommitDateFunc.nextHook)
        * [func (f *GitserverClientCommitDateFunc) appendCall(r0 GitserverClientCommitDateFuncCall)](#GitserverClientCommitDateFunc.appendCall)
        * [func (f *GitserverClientCommitDateFunc) History() []GitserverClientCommitDateFuncCall](#GitserverClientCommitDateFunc.History)
    * [type GitserverClientCommitDateFuncCall struct](#GitserverClientCommitDateFuncCall)
        * [func (c GitserverClientCommitDateFuncCall) Args() []interface{}](#GitserverClientCommitDateFuncCall.Args)
        * [func (c GitserverClientCommitDateFuncCall) Results() []interface{}](#GitserverClientCommitDateFuncCall.Results)
    * [type GitserverClientDirectoryChildrenFunc struct](#GitserverClientDirectoryChildrenFunc)
        * [func (f *GitserverClientDirectoryChildrenFunc) SetDefaultHook(hook func(context.Context, int, string, []string) (map[string][]string, error))](#GitserverClientDirectoryChildrenFunc.SetDefaultHook)
        * [func (f *GitserverClientDirectoryChildrenFunc) PushHook(hook func(context.Context, int, string, []string) (map[string][]string, error))](#GitserverClientDirectoryChildrenFunc.PushHook)
        * [func (f *GitserverClientDirectoryChildrenFunc) SetDefaultReturn(r0 map[string][]string, r1 error)](#GitserverClientDirectoryChildrenFunc.SetDefaultReturn)
        * [func (f *GitserverClientDirectoryChildrenFunc) PushReturn(r0 map[string][]string, r1 error)](#GitserverClientDirectoryChildrenFunc.PushReturn)
        * [func (f *GitserverClientDirectoryChildrenFunc) nextHook() func(context.Context, int, string, []string) (map[string][]string, error)](#GitserverClientDirectoryChildrenFunc.nextHook)
        * [func (f *GitserverClientDirectoryChildrenFunc) appendCall(r0 GitserverClientDirectoryChildrenFuncCall)](#GitserverClientDirectoryChildrenFunc.appendCall)
        * [func (f *GitserverClientDirectoryChildrenFunc) History() []GitserverClientDirectoryChildrenFuncCall](#GitserverClientDirectoryChildrenFunc.History)
    * [type GitserverClientDirectoryChildrenFuncCall struct](#GitserverClientDirectoryChildrenFuncCall)
        * [func (c GitserverClientDirectoryChildrenFuncCall) Args() []interface{}](#GitserverClientDirectoryChildrenFuncCall.Args)
        * [func (c GitserverClientDirectoryChildrenFuncCall) Results() []interface{}](#GitserverClientDirectoryChildrenFuncCall.Results)
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
    * [type MockLSIFStore struct](#MockLSIFStore)
        * [func NewMockLSIFStore() *MockLSIFStore](#NewMockLSIFStore)
        * [func NewMockLSIFStoreFrom(i LSIFStore) *MockLSIFStore](#NewMockLSIFStoreFrom)
        * [func (m *MockLSIFStore) Done(v0 error) error](#MockLSIFStore.Done)
        * [func (m *MockLSIFStore) Transact(v0 context.Context) (LSIFStore, error)](#MockLSIFStore.Transact)
        * [func (m *MockLSIFStore) WriteDefinitions(v0 context.Context, v1 int, v2 chan semantic.MonikerLocations) error](#MockLSIFStore.WriteDefinitions)
        * [func (m *MockLSIFStore) WriteDocumentationPages(v0 context.Context, v1 int, v2 chan *semantic.DocumentationPageData) error](#MockLSIFStore.WriteDocumentationPages)
        * [func (m *MockLSIFStore) WriteDocuments(v0 context.Context, v1 int, v2 chan semantic.KeyedDocumentData) error](#MockLSIFStore.WriteDocuments)
        * [func (m *MockLSIFStore) WriteMeta(v0 context.Context, v1 int, v2 semantic.MetaData) error](#MockLSIFStore.WriteMeta)
        * [func (m *MockLSIFStore) WriteReferences(v0 context.Context, v1 int, v2 chan semantic.MonikerLocations) error](#MockLSIFStore.WriteReferences)
        * [func (m *MockLSIFStore) WriteResultChunks(v0 context.Context, v1 int, v2 chan semantic.IndexedResultChunkData) error](#MockLSIFStore.WriteResultChunks)
    * [type LSIFStoreDoneFunc struct](#LSIFStoreDoneFunc)
        * [func (f *LSIFStoreDoneFunc) SetDefaultHook(hook func(error) error)](#LSIFStoreDoneFunc.SetDefaultHook)
        * [func (f *LSIFStoreDoneFunc) PushHook(hook func(error) error)](#LSIFStoreDoneFunc.PushHook)
        * [func (f *LSIFStoreDoneFunc) SetDefaultReturn(r0 error)](#LSIFStoreDoneFunc.SetDefaultReturn)
        * [func (f *LSIFStoreDoneFunc) PushReturn(r0 error)](#LSIFStoreDoneFunc.PushReturn)
        * [func (f *LSIFStoreDoneFunc) nextHook() func(error) error](#LSIFStoreDoneFunc.nextHook)
        * [func (f *LSIFStoreDoneFunc) appendCall(r0 LSIFStoreDoneFuncCall)](#LSIFStoreDoneFunc.appendCall)
        * [func (f *LSIFStoreDoneFunc) History() []LSIFStoreDoneFuncCall](#LSIFStoreDoneFunc.History)
    * [type LSIFStoreDoneFuncCall struct](#LSIFStoreDoneFuncCall)
        * [func (c LSIFStoreDoneFuncCall) Args() []interface{}](#LSIFStoreDoneFuncCall.Args)
        * [func (c LSIFStoreDoneFuncCall) Results() []interface{}](#LSIFStoreDoneFuncCall.Results)
    * [type LSIFStoreTransactFunc struct](#LSIFStoreTransactFunc)
        * [func (f *LSIFStoreTransactFunc) SetDefaultHook(hook func(context.Context) (LSIFStore, error))](#LSIFStoreTransactFunc.SetDefaultHook)
        * [func (f *LSIFStoreTransactFunc) PushHook(hook func(context.Context) (LSIFStore, error))](#LSIFStoreTransactFunc.PushHook)
        * [func (f *LSIFStoreTransactFunc) SetDefaultReturn(r0 LSIFStore, r1 error)](#LSIFStoreTransactFunc.SetDefaultReturn)
        * [func (f *LSIFStoreTransactFunc) PushReturn(r0 LSIFStore, r1 error)](#LSIFStoreTransactFunc.PushReturn)
        * [func (f *LSIFStoreTransactFunc) nextHook() func(context.Context) (LSIFStore, error)](#LSIFStoreTransactFunc.nextHook)
        * [func (f *LSIFStoreTransactFunc) appendCall(r0 LSIFStoreTransactFuncCall)](#LSIFStoreTransactFunc.appendCall)
        * [func (f *LSIFStoreTransactFunc) History() []LSIFStoreTransactFuncCall](#LSIFStoreTransactFunc.History)
    * [type LSIFStoreTransactFuncCall struct](#LSIFStoreTransactFuncCall)
        * [func (c LSIFStoreTransactFuncCall) Args() []interface{}](#LSIFStoreTransactFuncCall.Args)
        * [func (c LSIFStoreTransactFuncCall) Results() []interface{}](#LSIFStoreTransactFuncCall.Results)
    * [type LSIFStoreWriteDefinitionsFunc struct](#LSIFStoreWriteDefinitionsFunc)
        * [func (f *LSIFStoreWriteDefinitionsFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)](#LSIFStoreWriteDefinitionsFunc.SetDefaultHook)
        * [func (f *LSIFStoreWriteDefinitionsFunc) PushHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)](#LSIFStoreWriteDefinitionsFunc.PushHook)
        * [func (f *LSIFStoreWriteDefinitionsFunc) SetDefaultReturn(r0 error)](#LSIFStoreWriteDefinitionsFunc.SetDefaultReturn)
        * [func (f *LSIFStoreWriteDefinitionsFunc) PushReturn(r0 error)](#LSIFStoreWriteDefinitionsFunc.PushReturn)
        * [func (f *LSIFStoreWriteDefinitionsFunc) nextHook() func(context.Context, int, chan semantic.MonikerLocations) error](#LSIFStoreWriteDefinitionsFunc.nextHook)
        * [func (f *LSIFStoreWriteDefinitionsFunc) appendCall(r0 LSIFStoreWriteDefinitionsFuncCall)](#LSIFStoreWriteDefinitionsFunc.appendCall)
        * [func (f *LSIFStoreWriteDefinitionsFunc) History() []LSIFStoreWriteDefinitionsFuncCall](#LSIFStoreWriteDefinitionsFunc.History)
    * [type LSIFStoreWriteDefinitionsFuncCall struct](#LSIFStoreWriteDefinitionsFuncCall)
        * [func (c LSIFStoreWriteDefinitionsFuncCall) Args() []interface{}](#LSIFStoreWriteDefinitionsFuncCall.Args)
        * [func (c LSIFStoreWriteDefinitionsFuncCall) Results() []interface{}](#LSIFStoreWriteDefinitionsFuncCall.Results)
    * [type LSIFStoreWriteDocumentationPagesFunc struct](#LSIFStoreWriteDocumentationPagesFunc)
        * [func (f *LSIFStoreWriteDocumentationPagesFunc) SetDefaultHook(hook func(context.Context, int, chan *semantic.DocumentationPageData) error)](#LSIFStoreWriteDocumentationPagesFunc.SetDefaultHook)
        * [func (f *LSIFStoreWriteDocumentationPagesFunc) PushHook(hook func(context.Context, int, chan *semantic.DocumentationPageData) error)](#LSIFStoreWriteDocumentationPagesFunc.PushHook)
        * [func (f *LSIFStoreWriteDocumentationPagesFunc) SetDefaultReturn(r0 error)](#LSIFStoreWriteDocumentationPagesFunc.SetDefaultReturn)
        * [func (f *LSIFStoreWriteDocumentationPagesFunc) PushReturn(r0 error)](#LSIFStoreWriteDocumentationPagesFunc.PushReturn)
        * [func (f *LSIFStoreWriteDocumentationPagesFunc) nextHook() func(context.Context, int, chan *semantic.DocumentationPageData) error](#LSIFStoreWriteDocumentationPagesFunc.nextHook)
        * [func (f *LSIFStoreWriteDocumentationPagesFunc) appendCall(r0 LSIFStoreWriteDocumentationPagesFuncCall)](#LSIFStoreWriteDocumentationPagesFunc.appendCall)
        * [func (f *LSIFStoreWriteDocumentationPagesFunc) History() []LSIFStoreWriteDocumentationPagesFuncCall](#LSIFStoreWriteDocumentationPagesFunc.History)
    * [type LSIFStoreWriteDocumentationPagesFuncCall struct](#LSIFStoreWriteDocumentationPagesFuncCall)
        * [func (c LSIFStoreWriteDocumentationPagesFuncCall) Args() []interface{}](#LSIFStoreWriteDocumentationPagesFuncCall.Args)
        * [func (c LSIFStoreWriteDocumentationPagesFuncCall) Results() []interface{}](#LSIFStoreWriteDocumentationPagesFuncCall.Results)
    * [type LSIFStoreWriteDocumentsFunc struct](#LSIFStoreWriteDocumentsFunc)
        * [func (f *LSIFStoreWriteDocumentsFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.KeyedDocumentData) error)](#LSIFStoreWriteDocumentsFunc.SetDefaultHook)
        * [func (f *LSIFStoreWriteDocumentsFunc) PushHook(hook func(context.Context, int, chan semantic.KeyedDocumentData) error)](#LSIFStoreWriteDocumentsFunc.PushHook)
        * [func (f *LSIFStoreWriteDocumentsFunc) SetDefaultReturn(r0 error)](#LSIFStoreWriteDocumentsFunc.SetDefaultReturn)
        * [func (f *LSIFStoreWriteDocumentsFunc) PushReturn(r0 error)](#LSIFStoreWriteDocumentsFunc.PushReturn)
        * [func (f *LSIFStoreWriteDocumentsFunc) nextHook() func(context.Context, int, chan semantic.KeyedDocumentData) error](#LSIFStoreWriteDocumentsFunc.nextHook)
        * [func (f *LSIFStoreWriteDocumentsFunc) appendCall(r0 LSIFStoreWriteDocumentsFuncCall)](#LSIFStoreWriteDocumentsFunc.appendCall)
        * [func (f *LSIFStoreWriteDocumentsFunc) History() []LSIFStoreWriteDocumentsFuncCall](#LSIFStoreWriteDocumentsFunc.History)
    * [type LSIFStoreWriteDocumentsFuncCall struct](#LSIFStoreWriteDocumentsFuncCall)
        * [func (c LSIFStoreWriteDocumentsFuncCall) Args() []interface{}](#LSIFStoreWriteDocumentsFuncCall.Args)
        * [func (c LSIFStoreWriteDocumentsFuncCall) Results() []interface{}](#LSIFStoreWriteDocumentsFuncCall.Results)
    * [type LSIFStoreWriteMetaFunc struct](#LSIFStoreWriteMetaFunc)
        * [func (f *LSIFStoreWriteMetaFunc) SetDefaultHook(hook func(context.Context, int, semantic.MetaData) error)](#LSIFStoreWriteMetaFunc.SetDefaultHook)
        * [func (f *LSIFStoreWriteMetaFunc) PushHook(hook func(context.Context, int, semantic.MetaData) error)](#LSIFStoreWriteMetaFunc.PushHook)
        * [func (f *LSIFStoreWriteMetaFunc) SetDefaultReturn(r0 error)](#LSIFStoreWriteMetaFunc.SetDefaultReturn)
        * [func (f *LSIFStoreWriteMetaFunc) PushReturn(r0 error)](#LSIFStoreWriteMetaFunc.PushReturn)
        * [func (f *LSIFStoreWriteMetaFunc) nextHook() func(context.Context, int, semantic.MetaData) error](#LSIFStoreWriteMetaFunc.nextHook)
        * [func (f *LSIFStoreWriteMetaFunc) appendCall(r0 LSIFStoreWriteMetaFuncCall)](#LSIFStoreWriteMetaFunc.appendCall)
        * [func (f *LSIFStoreWriteMetaFunc) History() []LSIFStoreWriteMetaFuncCall](#LSIFStoreWriteMetaFunc.History)
    * [type LSIFStoreWriteMetaFuncCall struct](#LSIFStoreWriteMetaFuncCall)
        * [func (c LSIFStoreWriteMetaFuncCall) Args() []interface{}](#LSIFStoreWriteMetaFuncCall.Args)
        * [func (c LSIFStoreWriteMetaFuncCall) Results() []interface{}](#LSIFStoreWriteMetaFuncCall.Results)
    * [type LSIFStoreWriteReferencesFunc struct](#LSIFStoreWriteReferencesFunc)
        * [func (f *LSIFStoreWriteReferencesFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)](#LSIFStoreWriteReferencesFunc.SetDefaultHook)
        * [func (f *LSIFStoreWriteReferencesFunc) PushHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)](#LSIFStoreWriteReferencesFunc.PushHook)
        * [func (f *LSIFStoreWriteReferencesFunc) SetDefaultReturn(r0 error)](#LSIFStoreWriteReferencesFunc.SetDefaultReturn)
        * [func (f *LSIFStoreWriteReferencesFunc) PushReturn(r0 error)](#LSIFStoreWriteReferencesFunc.PushReturn)
        * [func (f *LSIFStoreWriteReferencesFunc) nextHook() func(context.Context, int, chan semantic.MonikerLocations) error](#LSIFStoreWriteReferencesFunc.nextHook)
        * [func (f *LSIFStoreWriteReferencesFunc) appendCall(r0 LSIFStoreWriteReferencesFuncCall)](#LSIFStoreWriteReferencesFunc.appendCall)
        * [func (f *LSIFStoreWriteReferencesFunc) History() []LSIFStoreWriteReferencesFuncCall](#LSIFStoreWriteReferencesFunc.History)
    * [type LSIFStoreWriteReferencesFuncCall struct](#LSIFStoreWriteReferencesFuncCall)
        * [func (c LSIFStoreWriteReferencesFuncCall) Args() []interface{}](#LSIFStoreWriteReferencesFuncCall.Args)
        * [func (c LSIFStoreWriteReferencesFuncCall) Results() []interface{}](#LSIFStoreWriteReferencesFuncCall.Results)
    * [type LSIFStoreWriteResultChunksFunc struct](#LSIFStoreWriteResultChunksFunc)
        * [func (f *LSIFStoreWriteResultChunksFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.IndexedResultChunkData) error)](#LSIFStoreWriteResultChunksFunc.SetDefaultHook)
        * [func (f *LSIFStoreWriteResultChunksFunc) PushHook(hook func(context.Context, int, chan semantic.IndexedResultChunkData) error)](#LSIFStoreWriteResultChunksFunc.PushHook)
        * [func (f *LSIFStoreWriteResultChunksFunc) SetDefaultReturn(r0 error)](#LSIFStoreWriteResultChunksFunc.SetDefaultReturn)
        * [func (f *LSIFStoreWriteResultChunksFunc) PushReturn(r0 error)](#LSIFStoreWriteResultChunksFunc.PushReturn)
        * [func (f *LSIFStoreWriteResultChunksFunc) nextHook() func(context.Context, int, chan semantic.IndexedResultChunkData) error](#LSIFStoreWriteResultChunksFunc.nextHook)
        * [func (f *LSIFStoreWriteResultChunksFunc) appendCall(r0 LSIFStoreWriteResultChunksFuncCall)](#LSIFStoreWriteResultChunksFunc.appendCall)
        * [func (f *LSIFStoreWriteResultChunksFunc) History() []LSIFStoreWriteResultChunksFuncCall](#LSIFStoreWriteResultChunksFunc.History)
    * [type LSIFStoreWriteResultChunksFuncCall struct](#LSIFStoreWriteResultChunksFuncCall)
        * [func (c LSIFStoreWriteResultChunksFuncCall) Args() []interface{}](#LSIFStoreWriteResultChunksFuncCall.Args)
        * [func (c LSIFStoreWriteResultChunksFuncCall) Results() []interface{}](#LSIFStoreWriteResultChunksFuncCall.Results)
    * [type MockWorkerStore struct](#MockWorkerStore)
        * [func NewMockWorkerStore() *MockWorkerStore](#NewMockWorkerStore)
        * [func NewMockWorkerStoreFrom(i store.Store) *MockWorkerStore](#NewMockWorkerStoreFrom)
        * [func (m *MockWorkerStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 workerutil.ExecutionLogEntry) error](#MockWorkerStore.AddExecutionLogEntry)
        * [func (m *MockWorkerStore) Dequeue(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)](#MockWorkerStore.Dequeue)
        * [func (m *MockWorkerStore) DequeueWithIndependentTransactionContext(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)](#MockWorkerStore.DequeueWithIndependentTransactionContext)
        * [func (m *MockWorkerStore) Done(v0 error) error](#MockWorkerStore.Done)
        * [func (m *MockWorkerStore) Handle() *basestore.TransactableHandle](#MockWorkerStore.Handle)
        * [func (m *MockWorkerStore) MarkComplete(v0 context.Context, v1 int) (bool, error)](#MockWorkerStore.MarkComplete)
        * [func (m *MockWorkerStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)](#MockWorkerStore.MarkErrored)
        * [func (m *MockWorkerStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)](#MockWorkerStore.MarkFailed)
        * [func (m *MockWorkerStore) QueuedCount(v0 context.Context, v1 []*sqlf.Query) (int, error)](#MockWorkerStore.QueuedCount)
        * [func (m *MockWorkerStore) Requeue(v0 context.Context, v1 int, v2 time.Time) error](#MockWorkerStore.Requeue)
        * [func (m *MockWorkerStore) ResetStalled(v0 context.Context) ([]int, []int, error)](#MockWorkerStore.ResetStalled)
    * [type WorkerStoreAddExecutionLogEntryFunc struct](#WorkerStoreAddExecutionLogEntryFunc)
        * [func (f *WorkerStoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)](#WorkerStoreAddExecutionLogEntryFunc.SetDefaultHook)
        * [func (f *WorkerStoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)](#WorkerStoreAddExecutionLogEntryFunc.PushHook)
        * [func (f *WorkerStoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)](#WorkerStoreAddExecutionLogEntryFunc.SetDefaultReturn)
        * [func (f *WorkerStoreAddExecutionLogEntryFunc) PushReturn(r0 error)](#WorkerStoreAddExecutionLogEntryFunc.PushReturn)
        * [func (f *WorkerStoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, workerutil.ExecutionLogEntry) error](#WorkerStoreAddExecutionLogEntryFunc.nextHook)
        * [func (f *WorkerStoreAddExecutionLogEntryFunc) appendCall(r0 WorkerStoreAddExecutionLogEntryFuncCall)](#WorkerStoreAddExecutionLogEntryFunc.appendCall)
        * [func (f *WorkerStoreAddExecutionLogEntryFunc) History() []WorkerStoreAddExecutionLogEntryFuncCall](#WorkerStoreAddExecutionLogEntryFunc.History)
    * [type WorkerStoreAddExecutionLogEntryFuncCall struct](#WorkerStoreAddExecutionLogEntryFuncCall)
        * [func (c WorkerStoreAddExecutionLogEntryFuncCall) Args() []interface{}](#WorkerStoreAddExecutionLogEntryFuncCall.Args)
        * [func (c WorkerStoreAddExecutionLogEntryFuncCall) Results() []interface{}](#WorkerStoreAddExecutionLogEntryFuncCall.Results)
    * [type WorkerStoreDequeueFunc struct](#WorkerStoreDequeueFunc)
        * [func (f *WorkerStoreDequeueFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))](#WorkerStoreDequeueFunc.SetDefaultHook)
        * [func (f *WorkerStoreDequeueFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))](#WorkerStoreDequeueFunc.PushHook)
        * [func (f *WorkerStoreDequeueFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)](#WorkerStoreDequeueFunc.SetDefaultReturn)
        * [func (f *WorkerStoreDequeueFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)](#WorkerStoreDequeueFunc.PushReturn)
        * [func (f *WorkerStoreDequeueFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)](#WorkerStoreDequeueFunc.nextHook)
        * [func (f *WorkerStoreDequeueFunc) appendCall(r0 WorkerStoreDequeueFuncCall)](#WorkerStoreDequeueFunc.appendCall)
        * [func (f *WorkerStoreDequeueFunc) History() []WorkerStoreDequeueFuncCall](#WorkerStoreDequeueFunc.History)
    * [type WorkerStoreDequeueFuncCall struct](#WorkerStoreDequeueFuncCall)
        * [func (c WorkerStoreDequeueFuncCall) Args() []interface{}](#WorkerStoreDequeueFuncCall.Args)
        * [func (c WorkerStoreDequeueFuncCall) Results() []interface{}](#WorkerStoreDequeueFuncCall.Results)
    * [type WorkerStoreDequeueWithIndependentTransactionContextFunc struct](#WorkerStoreDequeueWithIndependentTransactionContextFunc)
        * [func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))](#WorkerStoreDequeueWithIndependentTransactionContextFunc.SetDefaultHook)
        * [func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))](#WorkerStoreDequeueWithIndependentTransactionContextFunc.PushHook)
        * [func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)](#WorkerStoreDequeueWithIndependentTransactionContextFunc.SetDefaultReturn)
        * [func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)](#WorkerStoreDequeueWithIndependentTransactionContextFunc.PushReturn)
        * [func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)](#WorkerStoreDequeueWithIndependentTransactionContextFunc.nextHook)
        * [func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) appendCall(r0 WorkerStoreDequeueWithIndependentTransactionContextFuncCall)](#WorkerStoreDequeueWithIndependentTransactionContextFunc.appendCall)
        * [func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) History() []WorkerStoreDequeueWithIndependentTransactionContextFuncCall](#WorkerStoreDequeueWithIndependentTransactionContextFunc.History)
    * [type WorkerStoreDequeueWithIndependentTransactionContextFuncCall struct](#WorkerStoreDequeueWithIndependentTransactionContextFuncCall)
        * [func (c WorkerStoreDequeueWithIndependentTransactionContextFuncCall) Args() []interface{}](#WorkerStoreDequeueWithIndependentTransactionContextFuncCall.Args)
        * [func (c WorkerStoreDequeueWithIndependentTransactionContextFuncCall) Results() []interface{}](#WorkerStoreDequeueWithIndependentTransactionContextFuncCall.Results)
    * [type WorkerStoreDoneFunc struct](#WorkerStoreDoneFunc)
        * [func (f *WorkerStoreDoneFunc) SetDefaultHook(hook func(error) error)](#WorkerStoreDoneFunc.SetDefaultHook)
        * [func (f *WorkerStoreDoneFunc) PushHook(hook func(error) error)](#WorkerStoreDoneFunc.PushHook)
        * [func (f *WorkerStoreDoneFunc) SetDefaultReturn(r0 error)](#WorkerStoreDoneFunc.SetDefaultReturn)
        * [func (f *WorkerStoreDoneFunc) PushReturn(r0 error)](#WorkerStoreDoneFunc.PushReturn)
        * [func (f *WorkerStoreDoneFunc) nextHook() func(error) error](#WorkerStoreDoneFunc.nextHook)
        * [func (f *WorkerStoreDoneFunc) appendCall(r0 WorkerStoreDoneFuncCall)](#WorkerStoreDoneFunc.appendCall)
        * [func (f *WorkerStoreDoneFunc) History() []WorkerStoreDoneFuncCall](#WorkerStoreDoneFunc.History)
    * [type WorkerStoreDoneFuncCall struct](#WorkerStoreDoneFuncCall)
        * [func (c WorkerStoreDoneFuncCall) Args() []interface{}](#WorkerStoreDoneFuncCall.Args)
        * [func (c WorkerStoreDoneFuncCall) Results() []interface{}](#WorkerStoreDoneFuncCall.Results)
    * [type WorkerStoreHandleFunc struct](#WorkerStoreHandleFunc)
        * [func (f *WorkerStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)](#WorkerStoreHandleFunc.SetDefaultHook)
        * [func (f *WorkerStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)](#WorkerStoreHandleFunc.PushHook)
        * [func (f *WorkerStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)](#WorkerStoreHandleFunc.SetDefaultReturn)
        * [func (f *WorkerStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)](#WorkerStoreHandleFunc.PushReturn)
        * [func (f *WorkerStoreHandleFunc) nextHook() func() *basestore.TransactableHandle](#WorkerStoreHandleFunc.nextHook)
        * [func (f *WorkerStoreHandleFunc) appendCall(r0 WorkerStoreHandleFuncCall)](#WorkerStoreHandleFunc.appendCall)
        * [func (f *WorkerStoreHandleFunc) History() []WorkerStoreHandleFuncCall](#WorkerStoreHandleFunc.History)
    * [type WorkerStoreHandleFuncCall struct](#WorkerStoreHandleFuncCall)
        * [func (c WorkerStoreHandleFuncCall) Args() []interface{}](#WorkerStoreHandleFuncCall.Args)
        * [func (c WorkerStoreHandleFuncCall) Results() []interface{}](#WorkerStoreHandleFuncCall.Results)
    * [type WorkerStoreMarkCompleteFunc struct](#WorkerStoreMarkCompleteFunc)
        * [func (f *WorkerStoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))](#WorkerStoreMarkCompleteFunc.SetDefaultHook)
        * [func (f *WorkerStoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))](#WorkerStoreMarkCompleteFunc.PushHook)
        * [func (f *WorkerStoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)](#WorkerStoreMarkCompleteFunc.SetDefaultReturn)
        * [func (f *WorkerStoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)](#WorkerStoreMarkCompleteFunc.PushReturn)
        * [func (f *WorkerStoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)](#WorkerStoreMarkCompleteFunc.nextHook)
        * [func (f *WorkerStoreMarkCompleteFunc) appendCall(r0 WorkerStoreMarkCompleteFuncCall)](#WorkerStoreMarkCompleteFunc.appendCall)
        * [func (f *WorkerStoreMarkCompleteFunc) History() []WorkerStoreMarkCompleteFuncCall](#WorkerStoreMarkCompleteFunc.History)
    * [type WorkerStoreMarkCompleteFuncCall struct](#WorkerStoreMarkCompleteFuncCall)
        * [func (c WorkerStoreMarkCompleteFuncCall) Args() []interface{}](#WorkerStoreMarkCompleteFuncCall.Args)
        * [func (c WorkerStoreMarkCompleteFuncCall) Results() []interface{}](#WorkerStoreMarkCompleteFuncCall.Results)
    * [type WorkerStoreMarkErroredFunc struct](#WorkerStoreMarkErroredFunc)
        * [func (f *WorkerStoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))](#WorkerStoreMarkErroredFunc.SetDefaultHook)
        * [func (f *WorkerStoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))](#WorkerStoreMarkErroredFunc.PushHook)
        * [func (f *WorkerStoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)](#WorkerStoreMarkErroredFunc.SetDefaultReturn)
        * [func (f *WorkerStoreMarkErroredFunc) PushReturn(r0 bool, r1 error)](#WorkerStoreMarkErroredFunc.PushReturn)
        * [func (f *WorkerStoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)](#WorkerStoreMarkErroredFunc.nextHook)
        * [func (f *WorkerStoreMarkErroredFunc) appendCall(r0 WorkerStoreMarkErroredFuncCall)](#WorkerStoreMarkErroredFunc.appendCall)
        * [func (f *WorkerStoreMarkErroredFunc) History() []WorkerStoreMarkErroredFuncCall](#WorkerStoreMarkErroredFunc.History)
    * [type WorkerStoreMarkErroredFuncCall struct](#WorkerStoreMarkErroredFuncCall)
        * [func (c WorkerStoreMarkErroredFuncCall) Args() []interface{}](#WorkerStoreMarkErroredFuncCall.Args)
        * [func (c WorkerStoreMarkErroredFuncCall) Results() []interface{}](#WorkerStoreMarkErroredFuncCall.Results)
    * [type WorkerStoreMarkFailedFunc struct](#WorkerStoreMarkFailedFunc)
        * [func (f *WorkerStoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))](#WorkerStoreMarkFailedFunc.SetDefaultHook)
        * [func (f *WorkerStoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))](#WorkerStoreMarkFailedFunc.PushHook)
        * [func (f *WorkerStoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)](#WorkerStoreMarkFailedFunc.SetDefaultReturn)
        * [func (f *WorkerStoreMarkFailedFunc) PushReturn(r0 bool, r1 error)](#WorkerStoreMarkFailedFunc.PushReturn)
        * [func (f *WorkerStoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)](#WorkerStoreMarkFailedFunc.nextHook)
        * [func (f *WorkerStoreMarkFailedFunc) appendCall(r0 WorkerStoreMarkFailedFuncCall)](#WorkerStoreMarkFailedFunc.appendCall)
        * [func (f *WorkerStoreMarkFailedFunc) History() []WorkerStoreMarkFailedFuncCall](#WorkerStoreMarkFailedFunc.History)
    * [type WorkerStoreMarkFailedFuncCall struct](#WorkerStoreMarkFailedFuncCall)
        * [func (c WorkerStoreMarkFailedFuncCall) Args() []interface{}](#WorkerStoreMarkFailedFuncCall.Args)
        * [func (c WorkerStoreMarkFailedFuncCall) Results() []interface{}](#WorkerStoreMarkFailedFuncCall.Results)
    * [type WorkerStoreQueuedCountFunc struct](#WorkerStoreQueuedCountFunc)
        * [func (f *WorkerStoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (int, error))](#WorkerStoreQueuedCountFunc.SetDefaultHook)
        * [func (f *WorkerStoreQueuedCountFunc) PushHook(hook func(context.Context, []*sqlf.Query) (int, error))](#WorkerStoreQueuedCountFunc.PushHook)
        * [func (f *WorkerStoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)](#WorkerStoreQueuedCountFunc.SetDefaultReturn)
        * [func (f *WorkerStoreQueuedCountFunc) PushReturn(r0 int, r1 error)](#WorkerStoreQueuedCountFunc.PushReturn)
        * [func (f *WorkerStoreQueuedCountFunc) nextHook() func(context.Context, []*sqlf.Query) (int, error)](#WorkerStoreQueuedCountFunc.nextHook)
        * [func (f *WorkerStoreQueuedCountFunc) appendCall(r0 WorkerStoreQueuedCountFuncCall)](#WorkerStoreQueuedCountFunc.appendCall)
        * [func (f *WorkerStoreQueuedCountFunc) History() []WorkerStoreQueuedCountFuncCall](#WorkerStoreQueuedCountFunc.History)
    * [type WorkerStoreQueuedCountFuncCall struct](#WorkerStoreQueuedCountFuncCall)
        * [func (c WorkerStoreQueuedCountFuncCall) Args() []interface{}](#WorkerStoreQueuedCountFuncCall.Args)
        * [func (c WorkerStoreQueuedCountFuncCall) Results() []interface{}](#WorkerStoreQueuedCountFuncCall.Results)
    * [type WorkerStoreRequeueFunc struct](#WorkerStoreRequeueFunc)
        * [func (f *WorkerStoreRequeueFunc) SetDefaultHook(hook func(context.Context, int, time.Time) error)](#WorkerStoreRequeueFunc.SetDefaultHook)
        * [func (f *WorkerStoreRequeueFunc) PushHook(hook func(context.Context, int, time.Time) error)](#WorkerStoreRequeueFunc.PushHook)
        * [func (f *WorkerStoreRequeueFunc) SetDefaultReturn(r0 error)](#WorkerStoreRequeueFunc.SetDefaultReturn)
        * [func (f *WorkerStoreRequeueFunc) PushReturn(r0 error)](#WorkerStoreRequeueFunc.PushReturn)
        * [func (f *WorkerStoreRequeueFunc) nextHook() func(context.Context, int, time.Time) error](#WorkerStoreRequeueFunc.nextHook)
        * [func (f *WorkerStoreRequeueFunc) appendCall(r0 WorkerStoreRequeueFuncCall)](#WorkerStoreRequeueFunc.appendCall)
        * [func (f *WorkerStoreRequeueFunc) History() []WorkerStoreRequeueFuncCall](#WorkerStoreRequeueFunc.History)
    * [type WorkerStoreRequeueFuncCall struct](#WorkerStoreRequeueFuncCall)
        * [func (c WorkerStoreRequeueFuncCall) Args() []interface{}](#WorkerStoreRequeueFuncCall.Args)
        * [func (c WorkerStoreRequeueFuncCall) Results() []interface{}](#WorkerStoreRequeueFuncCall.Results)
    * [type WorkerStoreResetStalledFunc struct](#WorkerStoreResetStalledFunc)
        * [func (f *WorkerStoreResetStalledFunc) SetDefaultHook(hook func(context.Context) ([]int, []int, error))](#WorkerStoreResetStalledFunc.SetDefaultHook)
        * [func (f *WorkerStoreResetStalledFunc) PushHook(hook func(context.Context) ([]int, []int, error))](#WorkerStoreResetStalledFunc.PushHook)
        * [func (f *WorkerStoreResetStalledFunc) SetDefaultReturn(r0 []int, r1 []int, r2 error)](#WorkerStoreResetStalledFunc.SetDefaultReturn)
        * [func (f *WorkerStoreResetStalledFunc) PushReturn(r0 []int, r1 []int, r2 error)](#WorkerStoreResetStalledFunc.PushReturn)
        * [func (f *WorkerStoreResetStalledFunc) nextHook() func(context.Context) ([]int, []int, error)](#WorkerStoreResetStalledFunc.nextHook)
        * [func (f *WorkerStoreResetStalledFunc) appendCall(r0 WorkerStoreResetStalledFuncCall)](#WorkerStoreResetStalledFunc.appendCall)
        * [func (f *WorkerStoreResetStalledFunc) History() []WorkerStoreResetStalledFuncCall](#WorkerStoreResetStalledFunc.History)
    * [type WorkerStoreResetStalledFuncCall struct](#WorkerStoreResetStalledFuncCall)
        * [func (c WorkerStoreResetStalledFuncCall) Args() []interface{}](#WorkerStoreResetStalledFuncCall.Args)
        * [func (c WorkerStoreResetStalledFuncCall) Results() []interface{}](#WorkerStoreResetStalledFuncCall.Results)
* [Functions](#func)
    * [func inTransaction(ctx context.Context, dbStore DBStore, fn func(tx DBStore) error) (err error)](#inTransaction)
    * [func requeueIfCloning(ctx context.Context, workerStore dbworkerstore.Store, upload store.Upload) (requeued bool, _ error)](#requeueIfCloning)
    * [func withUploadData(ctx context.Context, uploadStore uploadstore.Store, id int, fn func(r io.Reader) error) error](#withUploadData)
    * [func writeData(ctx context.Context, lsifStore LSIFStore, id int, groupedBundleData *semantic.GroupedBundleDataChans) (err error)](#writeData)
    * [func isUniqueConstraintViolation(err error) bool](#isUniqueConstraintViolation)
    * [func createHoneyEvent(ctx context.Context, upload store.Upload, err error, duration time.Duration) *libhoney.Event](#createHoneyEvent)
    * [func NewWorker(dbStore DBStore,...](#NewWorker)
    * [func TestHandle(t *testing.T)](#TestHandle)
    * [func TestHandleError(t *testing.T)](#TestHandleError)
    * [func TestHandleCloneInProgress(t *testing.T)](#TestHandleCloneInProgress)
    * [func copyTestDump(ctx context.Context, key string) (io.ReadCloser, error)](#copyTestDump)
    * [func setupRepoMocks(t *testing.T)](#setupRepoMocks)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="CloneInProgressDelay" href="#CloneInProgressDelay">const CloneInProgressDelay</a>

```
searchKey: worker.CloneInProgressDelay
```

```Go
const CloneInProgressDelay = time.Minute
```

CloneInProgressDelay is the delay between processing attempts when a repo is currently being cloned. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="handler" href="#handler">type handler struct</a>

```
searchKey: worker.handler
tags: [private]
```

```Go
type handler struct {
	dbStore         DBStore
	lsifStore       LSIFStore
	uploadStore     uploadstore.Store
	gitserverClient GitserverClient
	enableBudget    bool
	budgetRemaining int64
}
```

#### <a id="handler.Handle" href="#handler.Handle">func (h *handler) Handle(ctx context.Context, tx dbworkerstore.Store, record workerutil.Record) error</a>

```
searchKey: worker.handler.Handle
tags: [private]
```

```Go
func (h *handler) Handle(ctx context.Context, tx dbworkerstore.Store, record workerutil.Record) error
```

#### <a id="handler.PreDequeue" href="#handler.PreDequeue">func (h *handler) PreDequeue(ctx context.Context) (bool, interface{}, error)</a>

```
searchKey: worker.handler.PreDequeue
tags: [private]
```

```Go
func (h *handler) PreDequeue(ctx context.Context) (bool, interface{}, error)
```

#### <a id="handler.PreHandle" href="#handler.PreHandle">func (h *handler) PreHandle(ctx context.Context, record workerutil.Record)</a>

```
searchKey: worker.handler.PreHandle
tags: [private]
```

```Go
func (h *handler) PreHandle(ctx context.Context, record workerutil.Record)
```

#### <a id="handler.PostHandle" href="#handler.PostHandle">func (h *handler) PostHandle(ctx context.Context, record workerutil.Record)</a>

```
searchKey: worker.handler.PostHandle
tags: [private]
```

```Go
func (h *handler) PostHandle(ctx context.Context, record workerutil.Record)
```

#### <a id="handler.getSize" href="#handler.getSize">func (h *handler) getSize(record workerutil.Record) int64</a>

```
searchKey: worker.handler.getSize
tags: [private]
```

```Go
func (h *handler) getSize(record workerutil.Record) int64
```

#### <a id="handler.handle" href="#handler.handle">func (h *handler) handle(ctx context.Context, workerStore dbworkerstore.Store, dbStore DBStore, upload store.Upload) (requeued bool, err error)</a>

```
searchKey: worker.handler.handle
tags: [private]
```

```Go
func (h *handler) handle(ctx context.Context, workerStore dbworkerstore.Store, dbStore DBStore, upload store.Upload) (requeued bool, err error)
```

handle converts a raw upload into a dump within the given transaction context. Returns true if the upload record was requeued and false otherwise. 

### <a id="DBStore" href="#DBStore">type DBStore interface</a>

```
searchKey: worker.DBStore
```

```Go
type DBStore interface {
	basestore.ShareableStore
	gitserver.DBStore

	With(other basestore.ShareableStore) DBStore
	Transact(ctx context.Context) (DBStore, error)
	Done(err error) error

	UpdatePackages(ctx context.Context, dumpID int, packages []semantic.Package) error
	UpdatePackageReferences(ctx context.Context, dumpID int, packageReferences []semantic.PackageReference) error
	MarkRepositoryAsDirty(ctx context.Context, repositoryID int) error
	DeleteOverlappingDumps(ctx context.Context, repositoryID int, commit, root, indexer string) error
	InsertDependencyIndexingJob(ctx context.Context, uploadID int) (int, error)
	UpdateCommitedAt(ctx context.Context, dumpID int, committedAt time.Time) error
}
```

### <a id="DBStoreShim" href="#DBStoreShim">type DBStoreShim struct</a>

```
searchKey: worker.DBStoreShim
```

```Go
type DBStoreShim struct {
	*dbstore.Store
}
```

#### <a id="DBStoreShim.With" href="#DBStoreShim.With">func (s *DBStoreShim) With(other basestore.ShareableStore) DBStore</a>

```
searchKey: worker.DBStoreShim.With
```

```Go
func (s *DBStoreShim) With(other basestore.ShareableStore) DBStore
```

#### <a id="DBStoreShim.Transact" href="#DBStoreShim.Transact">func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)</a>

```
searchKey: worker.DBStoreShim.Transact
```

```Go
func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)
```

### <a id="LSIFStore" href="#LSIFStore">type LSIFStore interface</a>

```
searchKey: worker.LSIFStore
```

```Go
type LSIFStore interface {
	Transact(ctx context.Context) (LSIFStore, error)
	Done(err error) error

	WriteMeta(ctx context.Context, bundleID int, meta semantic.MetaData) error
	WriteDocuments(ctx context.Context, bundleID int, documents chan semantic.KeyedDocumentData) error
	WriteResultChunks(ctx context.Context, bundleID int, resultChunks chan semantic.IndexedResultChunkData) error
	WriteDefinitions(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) error
	WriteReferences(ctx context.Context, bundleID int, monikerLocations chan semantic.MonikerLocations) error
	WriteDocumentationPages(ctx context.Context, bundleID int, documentation chan *semantic.DocumentationPageData) error
}
```

### <a id="LSIFStoreShim" href="#LSIFStoreShim">type LSIFStoreShim struct</a>

```
searchKey: worker.LSIFStoreShim
```

```Go
type LSIFStoreShim struct {
	*lsifstore.Store
}
```

#### <a id="LSIFStoreShim.Transact" href="#LSIFStoreShim.Transact">func (s *LSIFStoreShim) Transact(ctx context.Context) (LSIFStore, error)</a>

```
searchKey: worker.LSIFStoreShim.Transact
```

```Go
func (s *LSIFStoreShim) Transact(ctx context.Context) (LSIFStore, error)
```

### <a id="GitserverClient" href="#GitserverClient">type GitserverClient interface</a>

```
searchKey: worker.GitserverClient
```

```Go
type GitserverClient interface {
	DirectoryChildren(ctx context.Context, repositoryID int, commit string, dirnames []string) (map[string][]string, error)
	CommitDate(ctx context.Context, repositoryID int, commit string) (time.Time, error)
	ResolveRevision(ctx context.Context, repositoryID int, versionString string) (api.CommitID, error)
}
```

### <a id="MockDBStore" href="#MockDBStore">type MockDBStore struct</a>

```
searchKey: worker.MockDBStore
tags: [private]
```

```Go
type MockDBStore struct {
	// DeleteOverlappingDumpsFunc is an instance of a mock function object
	// controlling the behavior of the method DeleteOverlappingDumps.
	DeleteOverlappingDumpsFunc *DBStoreDeleteOverlappingDumpsFunc
	// DoneFunc is an instance of a mock function object controlling the
	// behavior of the method Done.
	DoneFunc *DBStoreDoneFunc
	// HandleFunc is an instance of a mock function object controlling the
	// behavior of the method Handle.
	HandleFunc *DBStoreHandleFunc
	// InsertDependencyIndexingJobFunc is an instance of a mock function
	// object controlling the behavior of the method
	// InsertDependencyIndexingJob.
	InsertDependencyIndexingJobFunc *DBStoreInsertDependencyIndexingJobFunc
	// MarkRepositoryAsDirtyFunc is an instance of a mock function object
	// controlling the behavior of the method MarkRepositoryAsDirty.
	MarkRepositoryAsDirtyFunc *DBStoreMarkRepositoryAsDirtyFunc
	// RepoNameFunc is an instance of a mock function object controlling the
	// behavior of the method RepoName.
	RepoNameFunc *DBStoreRepoNameFunc
	// TransactFunc is an instance of a mock function object controlling the
	// behavior of the method Transact.
	TransactFunc *DBStoreTransactFunc
	// UpdateCommitedAtFunc is an instance of a mock function object
	// controlling the behavior of the method UpdateCommitedAt.
	UpdateCommitedAtFunc *DBStoreUpdateCommitedAtFunc
	// UpdatePackageReferencesFunc is an instance of a mock function object
	// controlling the behavior of the method UpdatePackageReferences.
	UpdatePackageReferencesFunc *DBStoreUpdatePackageReferencesFunc
	// UpdatePackagesFunc is an instance of a mock function object
	// controlling the behavior of the method UpdatePackages.
	UpdatePackagesFunc *DBStoreUpdatePackagesFunc
	// WithFunc is an instance of a mock function object controlling the
	// behavior of the method With.
	WithFunc *DBStoreWithFunc
}
```

MockDBStore is a mock implementation of the DBStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/precise-code-intel-worker/internal/worker) used for unit testing. 

#### <a id="NewMockDBStore" href="#NewMockDBStore">func NewMockDBStore() *MockDBStore</a>

```
searchKey: worker.NewMockDBStore
tags: [private]
```

```Go
func NewMockDBStore() *MockDBStore
```

NewMockDBStore creates a new mock of the DBStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockDBStoreFrom" href="#NewMockDBStoreFrom">func NewMockDBStoreFrom(i DBStore) *MockDBStore</a>

```
searchKey: worker.NewMockDBStoreFrom
tags: [private]
```

```Go
func NewMockDBStoreFrom(i DBStore) *MockDBStore
```

NewMockDBStoreFrom creates a new mock of the MockDBStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockDBStore.DeleteOverlappingDumps" href="#MockDBStore.DeleteOverlappingDumps">func (m *MockDBStore) DeleteOverlappingDumps(v0 context.Context, v1 int, v2 string, v3 string, v4 string) error</a>

```
searchKey: worker.MockDBStore.DeleteOverlappingDumps
tags: [private]
```

```Go
func (m *MockDBStore) DeleteOverlappingDumps(v0 context.Context, v1 int, v2 string, v3 string, v4 string) error
```

DeleteOverlappingDumps delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Done" href="#MockDBStore.Done">func (m *MockDBStore) Done(v0 error) error</a>

```
searchKey: worker.MockDBStore.Done
tags: [private]
```

```Go
func (m *MockDBStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Handle" href="#MockDBStore.Handle">func (m *MockDBStore) Handle() *basestore.TransactableHandle</a>

```
searchKey: worker.MockDBStore.Handle
tags: [private]
```

```Go
func (m *MockDBStore) Handle() *basestore.TransactableHandle
```

Handle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.InsertDependencyIndexingJob" href="#MockDBStore.InsertDependencyIndexingJob">func (m *MockDBStore) InsertDependencyIndexingJob(v0 context.Context, v1 int) (int, error)</a>

```
searchKey: worker.MockDBStore.InsertDependencyIndexingJob
tags: [private]
```

```Go
func (m *MockDBStore) InsertDependencyIndexingJob(v0 context.Context, v1 int) (int, error)
```

InsertDependencyIndexingJob delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.MarkRepositoryAsDirty" href="#MockDBStore.MarkRepositoryAsDirty">func (m *MockDBStore) MarkRepositoryAsDirty(v0 context.Context, v1 int) error</a>

```
searchKey: worker.MockDBStore.MarkRepositoryAsDirty
tags: [private]
```

```Go
func (m *MockDBStore) MarkRepositoryAsDirty(v0 context.Context, v1 int) error
```

MarkRepositoryAsDirty delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.RepoName" href="#MockDBStore.RepoName">func (m *MockDBStore) RepoName(v0 context.Context, v1 int) (string, error)</a>

```
searchKey: worker.MockDBStore.RepoName
tags: [private]
```

```Go
func (m *MockDBStore) RepoName(v0 context.Context, v1 int) (string, error)
```

RepoName delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Transact" href="#MockDBStore.Transact">func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)</a>

```
searchKey: worker.MockDBStore.Transact
tags: [private]
```

```Go
func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)
```

Transact delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.UpdateCommitedAt" href="#MockDBStore.UpdateCommitedAt">func (m *MockDBStore) UpdateCommitedAt(v0 context.Context, v1 int, v2 time.Time) error</a>

```
searchKey: worker.MockDBStore.UpdateCommitedAt
tags: [private]
```

```Go
func (m *MockDBStore) UpdateCommitedAt(v0 context.Context, v1 int, v2 time.Time) error
```

UpdateCommitedAt delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.UpdatePackageReferences" href="#MockDBStore.UpdatePackageReferences">func (m *MockDBStore) UpdatePackageReferences(v0 context.Context, v1 int, v2 []semantic.PackageReference) error</a>

```
searchKey: worker.MockDBStore.UpdatePackageReferences
tags: [private]
```

```Go
func (m *MockDBStore) UpdatePackageReferences(v0 context.Context, v1 int, v2 []semantic.PackageReference) error
```

UpdatePackageReferences delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.UpdatePackages" href="#MockDBStore.UpdatePackages">func (m *MockDBStore) UpdatePackages(v0 context.Context, v1 int, v2 []semantic.Package) error</a>

```
searchKey: worker.MockDBStore.UpdatePackages
tags: [private]
```

```Go
func (m *MockDBStore) UpdatePackages(v0 context.Context, v1 int, v2 []semantic.Package) error
```

UpdatePackages delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.With" href="#MockDBStore.With">func (m *MockDBStore) With(v0 basestore.ShareableStore) DBStore</a>

```
searchKey: worker.MockDBStore.With
tags: [private]
```

```Go
func (m *MockDBStore) With(v0 basestore.ShareableStore) DBStore
```

With delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="DBStoreDeleteOverlappingDumpsFunc" href="#DBStoreDeleteOverlappingDumpsFunc">type DBStoreDeleteOverlappingDumpsFunc struct</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFunc
tags: [private]
```

```Go
type DBStoreDeleteOverlappingDumpsFunc struct {
	defaultHook func(context.Context, int, string, string, string) error
	hooks       []func(context.Context, int, string, string, string) error
	history     []DBStoreDeleteOverlappingDumpsFuncCall
	mutex       sync.Mutex
}
```

DBStoreDeleteOverlappingDumpsFunc describes the behavior when the DeleteOverlappingDumps method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDeleteOverlappingDumpsFunc.SetDefaultHook" href="#DBStoreDeleteOverlappingDumpsFunc.SetDefaultHook">func (f *DBStoreDeleteOverlappingDumpsFunc) SetDefaultHook(hook func(context.Context, int, string, string, string) error)</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreDeleteOverlappingDumpsFunc) SetDefaultHook(hook func(context.Context, int, string, string, string) error)
```

SetDefaultHook sets function that is called when the DeleteOverlappingDumps method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDeleteOverlappingDumpsFunc.PushHook" href="#DBStoreDeleteOverlappingDumpsFunc.PushHook">func (f *DBStoreDeleteOverlappingDumpsFunc) PushHook(hook func(context.Context, int, string, string, string) error)</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreDeleteOverlappingDumpsFunc) PushHook(hook func(context.Context, int, string, string, string) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteOverlappingDumps method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDeleteOverlappingDumpsFunc.SetDefaultReturn" href="#DBStoreDeleteOverlappingDumpsFunc.SetDefaultReturn">func (f *DBStoreDeleteOverlappingDumpsFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreDeleteOverlappingDumpsFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteOverlappingDumpsFunc.PushReturn" href="#DBStoreDeleteOverlappingDumpsFunc.PushReturn">func (f *DBStoreDeleteOverlappingDumpsFunc) PushReturn(r0 error)</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreDeleteOverlappingDumpsFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteOverlappingDumpsFunc.nextHook" href="#DBStoreDeleteOverlappingDumpsFunc.nextHook">func (f *DBStoreDeleteOverlappingDumpsFunc) nextHook() func(context.Context, int, string, string, string) error</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreDeleteOverlappingDumpsFunc) nextHook() func(context.Context, int, string, string, string) error
```

#### <a id="DBStoreDeleteOverlappingDumpsFunc.appendCall" href="#DBStoreDeleteOverlappingDumpsFunc.appendCall">func (f *DBStoreDeleteOverlappingDumpsFunc) appendCall(r0 DBStoreDeleteOverlappingDumpsFuncCall)</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreDeleteOverlappingDumpsFunc) appendCall(r0 DBStoreDeleteOverlappingDumpsFuncCall)
```

#### <a id="DBStoreDeleteOverlappingDumpsFunc.History" href="#DBStoreDeleteOverlappingDumpsFunc.History">func (f *DBStoreDeleteOverlappingDumpsFunc) History() []DBStoreDeleteOverlappingDumpsFuncCall</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFunc.History
tags: [private]
```

```Go
func (f *DBStoreDeleteOverlappingDumpsFunc) History() []DBStoreDeleteOverlappingDumpsFuncCall
```

History returns a sequence of DBStoreDeleteOverlappingDumpsFuncCall objects describing the invocations of this function. 

### <a id="DBStoreDeleteOverlappingDumpsFuncCall" href="#DBStoreDeleteOverlappingDumpsFuncCall">type DBStoreDeleteOverlappingDumpsFuncCall struct</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFuncCall
tags: [private]
```

```Go
type DBStoreDeleteOverlappingDumpsFuncCall struct {
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
	Arg4 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreDeleteOverlappingDumpsFuncCall is an object that describes an invocation of method DeleteOverlappingDumps on an instance of MockDBStore. 

#### <a id="DBStoreDeleteOverlappingDumpsFuncCall.Args" href="#DBStoreDeleteOverlappingDumpsFuncCall.Args">func (c DBStoreDeleteOverlappingDumpsFuncCall) Args() []interface{}</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreDeleteOverlappingDumpsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDeleteOverlappingDumpsFuncCall.Results" href="#DBStoreDeleteOverlappingDumpsFuncCall.Results">func (c DBStoreDeleteOverlappingDumpsFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreDeleteOverlappingDumpsFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreDeleteOverlappingDumpsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDoneFunc" href="#DBStoreDoneFunc">type DBStoreDoneFunc struct</a>

```
searchKey: worker.DBStoreDoneFunc
tags: [private]
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

#### <a id="DBStoreDoneFunc.SetDefaultHook" href="#DBStoreDoneFunc.SetDefaultHook">func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: worker.DBStoreDoneFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDoneFunc.PushHook" href="#DBStoreDoneFunc.PushHook">func (f *DBStoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: worker.DBStoreDoneFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDoneFunc.SetDefaultReturn" href="#DBStoreDoneFunc.SetDefaultReturn">func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.DBStoreDoneFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.PushReturn" href="#DBStoreDoneFunc.PushReturn">func (f *DBStoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: worker.DBStoreDoneFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.nextHook" href="#DBStoreDoneFunc.nextHook">func (f *DBStoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: worker.DBStoreDoneFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreDoneFunc) nextHook() func(error) error
```

#### <a id="DBStoreDoneFunc.appendCall" href="#DBStoreDoneFunc.appendCall">func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)</a>

```
searchKey: worker.DBStoreDoneFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)
```

#### <a id="DBStoreDoneFunc.History" href="#DBStoreDoneFunc.History">func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall</a>

```
searchKey: worker.DBStoreDoneFunc.History
tags: [private]
```

```Go
func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall
```

History returns a sequence of DBStoreDoneFuncCall objects describing the invocations of this function. 

### <a id="DBStoreDoneFuncCall" href="#DBStoreDoneFuncCall">type DBStoreDoneFuncCall struct</a>

```
searchKey: worker.DBStoreDoneFuncCall
tags: [private]
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
searchKey: worker.DBStoreDoneFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDoneFuncCall.Results" href="#DBStoreDoneFuncCall.Results">func (c DBStoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreDoneFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreHandleFunc" href="#DBStoreHandleFunc">type DBStoreHandleFunc struct</a>

```
searchKey: worker.DBStoreHandleFunc
tags: [private]
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

#### <a id="DBStoreHandleFunc.SetDefaultHook" href="#DBStoreHandleFunc.SetDefaultHook">func (f *DBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: worker.DBStoreHandleFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)
```

SetDefaultHook sets function that is called when the Handle method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreHandleFunc.PushHook" href="#DBStoreHandleFunc.PushHook">func (f *DBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: worker.DBStoreHandleFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)
```

PushHook adds a function to the end of hook queue. Each invocation of the Handle method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreHandleFunc.SetDefaultReturn" href="#DBStoreHandleFunc.SetDefaultReturn">func (f *DBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: worker.DBStoreHandleFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHandleFunc.PushReturn" href="#DBStoreHandleFunc.PushReturn">func (f *DBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: worker.DBStoreHandleFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHandleFunc.nextHook" href="#DBStoreHandleFunc.nextHook">func (f *DBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle</a>

```
searchKey: worker.DBStoreHandleFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle
```

#### <a id="DBStoreHandleFunc.appendCall" href="#DBStoreHandleFunc.appendCall">func (f *DBStoreHandleFunc) appendCall(r0 DBStoreHandleFuncCall)</a>

```
searchKey: worker.DBStoreHandleFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreHandleFunc) appendCall(r0 DBStoreHandleFuncCall)
```

#### <a id="DBStoreHandleFunc.History" href="#DBStoreHandleFunc.History">func (f *DBStoreHandleFunc) History() []DBStoreHandleFuncCall</a>

```
searchKey: worker.DBStoreHandleFunc.History
tags: [private]
```

```Go
func (f *DBStoreHandleFunc) History() []DBStoreHandleFuncCall
```

History returns a sequence of DBStoreHandleFuncCall objects describing the invocations of this function. 

### <a id="DBStoreHandleFuncCall" href="#DBStoreHandleFuncCall">type DBStoreHandleFuncCall struct</a>

```
searchKey: worker.DBStoreHandleFuncCall
tags: [private]
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
searchKey: worker.DBStoreHandleFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreHandleFuncCall.Results" href="#DBStoreHandleFuncCall.Results">func (c DBStoreHandleFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreHandleFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreInsertDependencyIndexingJobFunc" href="#DBStoreInsertDependencyIndexingJobFunc">type DBStoreInsertDependencyIndexingJobFunc struct</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFunc
tags: [private]
```

```Go
type DBStoreInsertDependencyIndexingJobFunc struct {
	defaultHook func(context.Context, int) (int, error)
	hooks       []func(context.Context, int) (int, error)
	history     []DBStoreInsertDependencyIndexingJobFuncCall
	mutex       sync.Mutex
}
```

DBStoreInsertDependencyIndexingJobFunc describes the behavior when the InsertDependencyIndexingJob method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreInsertDependencyIndexingJobFunc.SetDefaultHook" href="#DBStoreInsertDependencyIndexingJobFunc.SetDefaultHook">func (f *DBStoreInsertDependencyIndexingJobFunc) SetDefaultHook(hook func(context.Context, int) (int, error))</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreInsertDependencyIndexingJobFunc) SetDefaultHook(hook func(context.Context, int) (int, error))
```

SetDefaultHook sets function that is called when the InsertDependencyIndexingJob method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreInsertDependencyIndexingJobFunc.PushHook" href="#DBStoreInsertDependencyIndexingJobFunc.PushHook">func (f *DBStoreInsertDependencyIndexingJobFunc) PushHook(hook func(context.Context, int) (int, error))</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreInsertDependencyIndexingJobFunc) PushHook(hook func(context.Context, int) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the InsertDependencyIndexingJob method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreInsertDependencyIndexingJobFunc.SetDefaultReturn" href="#DBStoreInsertDependencyIndexingJobFunc.SetDefaultReturn">func (f *DBStoreInsertDependencyIndexingJobFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreInsertDependencyIndexingJobFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreInsertDependencyIndexingJobFunc.PushReturn" href="#DBStoreInsertDependencyIndexingJobFunc.PushReturn">func (f *DBStoreInsertDependencyIndexingJobFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreInsertDependencyIndexingJobFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreInsertDependencyIndexingJobFunc.nextHook" href="#DBStoreInsertDependencyIndexingJobFunc.nextHook">func (f *DBStoreInsertDependencyIndexingJobFunc) nextHook() func(context.Context, int) (int, error)</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreInsertDependencyIndexingJobFunc) nextHook() func(context.Context, int) (int, error)
```

#### <a id="DBStoreInsertDependencyIndexingJobFunc.appendCall" href="#DBStoreInsertDependencyIndexingJobFunc.appendCall">func (f *DBStoreInsertDependencyIndexingJobFunc) appendCall(r0 DBStoreInsertDependencyIndexingJobFuncCall)</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreInsertDependencyIndexingJobFunc) appendCall(r0 DBStoreInsertDependencyIndexingJobFuncCall)
```

#### <a id="DBStoreInsertDependencyIndexingJobFunc.History" href="#DBStoreInsertDependencyIndexingJobFunc.History">func (f *DBStoreInsertDependencyIndexingJobFunc) History() []DBStoreInsertDependencyIndexingJobFuncCall</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFunc.History
tags: [private]
```

```Go
func (f *DBStoreInsertDependencyIndexingJobFunc) History() []DBStoreInsertDependencyIndexingJobFuncCall
```

History returns a sequence of DBStoreInsertDependencyIndexingJobFuncCall objects describing the invocations of this function. 

### <a id="DBStoreInsertDependencyIndexingJobFuncCall" href="#DBStoreInsertDependencyIndexingJobFuncCall">type DBStoreInsertDependencyIndexingJobFuncCall struct</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFuncCall
tags: [private]
```

```Go
type DBStoreInsertDependencyIndexingJobFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreInsertDependencyIndexingJobFuncCall is an object that describes an invocation of method InsertDependencyIndexingJob on an instance of MockDBStore. 

#### <a id="DBStoreInsertDependencyIndexingJobFuncCall.Args" href="#DBStoreInsertDependencyIndexingJobFuncCall.Args">func (c DBStoreInsertDependencyIndexingJobFuncCall) Args() []interface{}</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreInsertDependencyIndexingJobFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreInsertDependencyIndexingJobFuncCall.Results" href="#DBStoreInsertDependencyIndexingJobFuncCall.Results">func (c DBStoreInsertDependencyIndexingJobFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreInsertDependencyIndexingJobFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreInsertDependencyIndexingJobFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreMarkRepositoryAsDirtyFunc" href="#DBStoreMarkRepositoryAsDirtyFunc">type DBStoreMarkRepositoryAsDirtyFunc struct</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFunc
tags: [private]
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

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.SetDefaultHook" href="#DBStoreMarkRepositoryAsDirtyFunc.SetDefaultHook">func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultHook(hook func(context.Context, int) error)</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultHook(hook func(context.Context, int) error)
```

SetDefaultHook sets function that is called when the MarkRepositoryAsDirty method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.PushHook" href="#DBStoreMarkRepositoryAsDirtyFunc.PushHook">func (f *DBStoreMarkRepositoryAsDirtyFunc) PushHook(hook func(context.Context, int) error)</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) PushHook(hook func(context.Context, int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkRepositoryAsDirty method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.SetDefaultReturn" href="#DBStoreMarkRepositoryAsDirtyFunc.SetDefaultReturn">func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.PushReturn" href="#DBStoreMarkRepositoryAsDirtyFunc.PushReturn">func (f *DBStoreMarkRepositoryAsDirtyFunc) PushReturn(r0 error)</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.nextHook" href="#DBStoreMarkRepositoryAsDirtyFunc.nextHook">func (f *DBStoreMarkRepositoryAsDirtyFunc) nextHook() func(context.Context, int) error</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) nextHook() func(context.Context, int) error
```

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.appendCall" href="#DBStoreMarkRepositoryAsDirtyFunc.appendCall">func (f *DBStoreMarkRepositoryAsDirtyFunc) appendCall(r0 DBStoreMarkRepositoryAsDirtyFuncCall)</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) appendCall(r0 DBStoreMarkRepositoryAsDirtyFuncCall)
```

#### <a id="DBStoreMarkRepositoryAsDirtyFunc.History" href="#DBStoreMarkRepositoryAsDirtyFunc.History">func (f *DBStoreMarkRepositoryAsDirtyFunc) History() []DBStoreMarkRepositoryAsDirtyFuncCall</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFunc.History
tags: [private]
```

```Go
func (f *DBStoreMarkRepositoryAsDirtyFunc) History() []DBStoreMarkRepositoryAsDirtyFuncCall
```

History returns a sequence of DBStoreMarkRepositoryAsDirtyFuncCall objects describing the invocations of this function. 

### <a id="DBStoreMarkRepositoryAsDirtyFuncCall" href="#DBStoreMarkRepositoryAsDirtyFuncCall">type DBStoreMarkRepositoryAsDirtyFuncCall struct</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFuncCall
tags: [private]
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
searchKey: worker.DBStoreMarkRepositoryAsDirtyFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreMarkRepositoryAsDirtyFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreMarkRepositoryAsDirtyFuncCall.Results" href="#DBStoreMarkRepositoryAsDirtyFuncCall.Results">func (c DBStoreMarkRepositoryAsDirtyFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreMarkRepositoryAsDirtyFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreMarkRepositoryAsDirtyFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreRepoNameFunc" href="#DBStoreRepoNameFunc">type DBStoreRepoNameFunc struct</a>

```
searchKey: worker.DBStoreRepoNameFunc
tags: [private]
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

#### <a id="DBStoreRepoNameFunc.SetDefaultHook" href="#DBStoreRepoNameFunc.SetDefaultHook">func (f *DBStoreRepoNameFunc) SetDefaultHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: worker.DBStoreRepoNameFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreRepoNameFunc) SetDefaultHook(hook func(context.Context, int) (string, error))
```

SetDefaultHook sets function that is called when the RepoName method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreRepoNameFunc.PushHook" href="#DBStoreRepoNameFunc.PushHook">func (f *DBStoreRepoNameFunc) PushHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: worker.DBStoreRepoNameFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreRepoNameFunc) PushHook(hook func(context.Context, int) (string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the RepoName method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreRepoNameFunc.SetDefaultReturn" href="#DBStoreRepoNameFunc.SetDefaultReturn">func (f *DBStoreRepoNameFunc) SetDefaultReturn(r0 string, r1 error)</a>

```
searchKey: worker.DBStoreRepoNameFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreRepoNameFunc) SetDefaultReturn(r0 string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreRepoNameFunc.PushReturn" href="#DBStoreRepoNameFunc.PushReturn">func (f *DBStoreRepoNameFunc) PushReturn(r0 string, r1 error)</a>

```
searchKey: worker.DBStoreRepoNameFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreRepoNameFunc) PushReturn(r0 string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreRepoNameFunc.nextHook" href="#DBStoreRepoNameFunc.nextHook">func (f *DBStoreRepoNameFunc) nextHook() func(context.Context, int) (string, error)</a>

```
searchKey: worker.DBStoreRepoNameFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreRepoNameFunc) nextHook() func(context.Context, int) (string, error)
```

#### <a id="DBStoreRepoNameFunc.appendCall" href="#DBStoreRepoNameFunc.appendCall">func (f *DBStoreRepoNameFunc) appendCall(r0 DBStoreRepoNameFuncCall)</a>

```
searchKey: worker.DBStoreRepoNameFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreRepoNameFunc) appendCall(r0 DBStoreRepoNameFuncCall)
```

#### <a id="DBStoreRepoNameFunc.History" href="#DBStoreRepoNameFunc.History">func (f *DBStoreRepoNameFunc) History() []DBStoreRepoNameFuncCall</a>

```
searchKey: worker.DBStoreRepoNameFunc.History
tags: [private]
```

```Go
func (f *DBStoreRepoNameFunc) History() []DBStoreRepoNameFuncCall
```

History returns a sequence of DBStoreRepoNameFuncCall objects describing the invocations of this function. 

### <a id="DBStoreRepoNameFuncCall" href="#DBStoreRepoNameFuncCall">type DBStoreRepoNameFuncCall struct</a>

```
searchKey: worker.DBStoreRepoNameFuncCall
tags: [private]
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
searchKey: worker.DBStoreRepoNameFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreRepoNameFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreRepoNameFuncCall.Results" href="#DBStoreRepoNameFuncCall.Results">func (c DBStoreRepoNameFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreRepoNameFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreRepoNameFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreTransactFunc" href="#DBStoreTransactFunc">type DBStoreTransactFunc struct</a>

```
searchKey: worker.DBStoreTransactFunc
tags: [private]
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

#### <a id="DBStoreTransactFunc.SetDefaultHook" href="#DBStoreTransactFunc.SetDefaultHook">func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))</a>

```
searchKey: worker.DBStoreTransactFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))
```

SetDefaultHook sets function that is called when the Transact method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreTransactFunc.PushHook" href="#DBStoreTransactFunc.PushHook">func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))</a>

```
searchKey: worker.DBStoreTransactFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Transact method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreTransactFunc.SetDefaultReturn" href="#DBStoreTransactFunc.SetDefaultReturn">func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)</a>

```
searchKey: worker.DBStoreTransactFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.PushReturn" href="#DBStoreTransactFunc.PushReturn">func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)</a>

```
searchKey: worker.DBStoreTransactFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.nextHook" href="#DBStoreTransactFunc.nextHook">func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)</a>

```
searchKey: worker.DBStoreTransactFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)
```

#### <a id="DBStoreTransactFunc.appendCall" href="#DBStoreTransactFunc.appendCall">func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)</a>

```
searchKey: worker.DBStoreTransactFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)
```

#### <a id="DBStoreTransactFunc.History" href="#DBStoreTransactFunc.History">func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall</a>

```
searchKey: worker.DBStoreTransactFunc.History
tags: [private]
```

```Go
func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall
```

History returns a sequence of DBStoreTransactFuncCall objects describing the invocations of this function. 

### <a id="DBStoreTransactFuncCall" href="#DBStoreTransactFuncCall">type DBStoreTransactFuncCall struct</a>

```
searchKey: worker.DBStoreTransactFuncCall
tags: [private]
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
searchKey: worker.DBStoreTransactFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreTransactFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreTransactFuncCall.Results" href="#DBStoreTransactFuncCall.Results">func (c DBStoreTransactFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreTransactFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreTransactFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreUpdateCommitedAtFunc" href="#DBStoreUpdateCommitedAtFunc">type DBStoreUpdateCommitedAtFunc struct</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFunc
tags: [private]
```

```Go
type DBStoreUpdateCommitedAtFunc struct {
	defaultHook func(context.Context, int, time.Time) error
	hooks       []func(context.Context, int, time.Time) error
	history     []DBStoreUpdateCommitedAtFuncCall
	mutex       sync.Mutex
}
```

DBStoreUpdateCommitedAtFunc describes the behavior when the UpdateCommitedAt method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreUpdateCommitedAtFunc.SetDefaultHook" href="#DBStoreUpdateCommitedAtFunc.SetDefaultHook">func (f *DBStoreUpdateCommitedAtFunc) SetDefaultHook(hook func(context.Context, int, time.Time) error)</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreUpdateCommitedAtFunc) SetDefaultHook(hook func(context.Context, int, time.Time) error)
```

SetDefaultHook sets function that is called when the UpdateCommitedAt method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreUpdateCommitedAtFunc.PushHook" href="#DBStoreUpdateCommitedAtFunc.PushHook">func (f *DBStoreUpdateCommitedAtFunc) PushHook(hook func(context.Context, int, time.Time) error)</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreUpdateCommitedAtFunc) PushHook(hook func(context.Context, int, time.Time) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the UpdateCommitedAt method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreUpdateCommitedAtFunc.SetDefaultReturn" href="#DBStoreUpdateCommitedAtFunc.SetDefaultReturn">func (f *DBStoreUpdateCommitedAtFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreUpdateCommitedAtFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreUpdateCommitedAtFunc.PushReturn" href="#DBStoreUpdateCommitedAtFunc.PushReturn">func (f *DBStoreUpdateCommitedAtFunc) PushReturn(r0 error)</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreUpdateCommitedAtFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreUpdateCommitedAtFunc.nextHook" href="#DBStoreUpdateCommitedAtFunc.nextHook">func (f *DBStoreUpdateCommitedAtFunc) nextHook() func(context.Context, int, time.Time) error</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreUpdateCommitedAtFunc) nextHook() func(context.Context, int, time.Time) error
```

#### <a id="DBStoreUpdateCommitedAtFunc.appendCall" href="#DBStoreUpdateCommitedAtFunc.appendCall">func (f *DBStoreUpdateCommitedAtFunc) appendCall(r0 DBStoreUpdateCommitedAtFuncCall)</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreUpdateCommitedAtFunc) appendCall(r0 DBStoreUpdateCommitedAtFuncCall)
```

#### <a id="DBStoreUpdateCommitedAtFunc.History" href="#DBStoreUpdateCommitedAtFunc.History">func (f *DBStoreUpdateCommitedAtFunc) History() []DBStoreUpdateCommitedAtFuncCall</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFunc.History
tags: [private]
```

```Go
func (f *DBStoreUpdateCommitedAtFunc) History() []DBStoreUpdateCommitedAtFuncCall
```

History returns a sequence of DBStoreUpdateCommitedAtFuncCall objects describing the invocations of this function. 

### <a id="DBStoreUpdateCommitedAtFuncCall" href="#DBStoreUpdateCommitedAtFuncCall">type DBStoreUpdateCommitedAtFuncCall struct</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFuncCall
tags: [private]
```

```Go
type DBStoreUpdateCommitedAtFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreUpdateCommitedAtFuncCall is an object that describes an invocation of method UpdateCommitedAt on an instance of MockDBStore. 

#### <a id="DBStoreUpdateCommitedAtFuncCall.Args" href="#DBStoreUpdateCommitedAtFuncCall.Args">func (c DBStoreUpdateCommitedAtFuncCall) Args() []interface{}</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreUpdateCommitedAtFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreUpdateCommitedAtFuncCall.Results" href="#DBStoreUpdateCommitedAtFuncCall.Results">func (c DBStoreUpdateCommitedAtFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreUpdateCommitedAtFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreUpdateCommitedAtFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreUpdatePackageReferencesFunc" href="#DBStoreUpdatePackageReferencesFunc">type DBStoreUpdatePackageReferencesFunc struct</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFunc
tags: [private]
```

```Go
type DBStoreUpdatePackageReferencesFunc struct {
	defaultHook func(context.Context, int, []semantic.PackageReference) error
	hooks       []func(context.Context, int, []semantic.PackageReference) error
	history     []DBStoreUpdatePackageReferencesFuncCall
	mutex       sync.Mutex
}
```

DBStoreUpdatePackageReferencesFunc describes the behavior when the UpdatePackageReferences method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreUpdatePackageReferencesFunc.SetDefaultHook" href="#DBStoreUpdatePackageReferencesFunc.SetDefaultHook">func (f *DBStoreUpdatePackageReferencesFunc) SetDefaultHook(hook func(context.Context, int, []semantic.PackageReference) error)</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreUpdatePackageReferencesFunc) SetDefaultHook(hook func(context.Context, int, []semantic.PackageReference) error)
```

SetDefaultHook sets function that is called when the UpdatePackageReferences method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreUpdatePackageReferencesFunc.PushHook" href="#DBStoreUpdatePackageReferencesFunc.PushHook">func (f *DBStoreUpdatePackageReferencesFunc) PushHook(hook func(context.Context, int, []semantic.PackageReference) error)</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreUpdatePackageReferencesFunc) PushHook(hook func(context.Context, int, []semantic.PackageReference) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the UpdatePackageReferences method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreUpdatePackageReferencesFunc.SetDefaultReturn" href="#DBStoreUpdatePackageReferencesFunc.SetDefaultReturn">func (f *DBStoreUpdatePackageReferencesFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreUpdatePackageReferencesFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreUpdatePackageReferencesFunc.PushReturn" href="#DBStoreUpdatePackageReferencesFunc.PushReturn">func (f *DBStoreUpdatePackageReferencesFunc) PushReturn(r0 error)</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreUpdatePackageReferencesFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreUpdatePackageReferencesFunc.nextHook" href="#DBStoreUpdatePackageReferencesFunc.nextHook">func (f *DBStoreUpdatePackageReferencesFunc) nextHook() func(context.Context, int, []semantic.PackageReference) error</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreUpdatePackageReferencesFunc) nextHook() func(context.Context, int, []semantic.PackageReference) error
```

#### <a id="DBStoreUpdatePackageReferencesFunc.appendCall" href="#DBStoreUpdatePackageReferencesFunc.appendCall">func (f *DBStoreUpdatePackageReferencesFunc) appendCall(r0 DBStoreUpdatePackageReferencesFuncCall)</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreUpdatePackageReferencesFunc) appendCall(r0 DBStoreUpdatePackageReferencesFuncCall)
```

#### <a id="DBStoreUpdatePackageReferencesFunc.History" href="#DBStoreUpdatePackageReferencesFunc.History">func (f *DBStoreUpdatePackageReferencesFunc) History() []DBStoreUpdatePackageReferencesFuncCall</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFunc.History
tags: [private]
```

```Go
func (f *DBStoreUpdatePackageReferencesFunc) History() []DBStoreUpdatePackageReferencesFuncCall
```

History returns a sequence of DBStoreUpdatePackageReferencesFuncCall objects describing the invocations of this function. 

### <a id="DBStoreUpdatePackageReferencesFuncCall" href="#DBStoreUpdatePackageReferencesFuncCall">type DBStoreUpdatePackageReferencesFuncCall struct</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFuncCall
tags: [private]
```

```Go
type DBStoreUpdatePackageReferencesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 []semantic.PackageReference
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreUpdatePackageReferencesFuncCall is an object that describes an invocation of method UpdatePackageReferences on an instance of MockDBStore. 

#### <a id="DBStoreUpdatePackageReferencesFuncCall.Args" href="#DBStoreUpdatePackageReferencesFuncCall.Args">func (c DBStoreUpdatePackageReferencesFuncCall) Args() []interface{}</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreUpdatePackageReferencesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreUpdatePackageReferencesFuncCall.Results" href="#DBStoreUpdatePackageReferencesFuncCall.Results">func (c DBStoreUpdatePackageReferencesFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreUpdatePackageReferencesFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreUpdatePackageReferencesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreUpdatePackagesFunc" href="#DBStoreUpdatePackagesFunc">type DBStoreUpdatePackagesFunc struct</a>

```
searchKey: worker.DBStoreUpdatePackagesFunc
tags: [private]
```

```Go
type DBStoreUpdatePackagesFunc struct {
	defaultHook func(context.Context, int, []semantic.Package) error
	hooks       []func(context.Context, int, []semantic.Package) error
	history     []DBStoreUpdatePackagesFuncCall
	mutex       sync.Mutex
}
```

DBStoreUpdatePackagesFunc describes the behavior when the UpdatePackages method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreUpdatePackagesFunc.SetDefaultHook" href="#DBStoreUpdatePackagesFunc.SetDefaultHook">func (f *DBStoreUpdatePackagesFunc) SetDefaultHook(hook func(context.Context, int, []semantic.Package) error)</a>

```
searchKey: worker.DBStoreUpdatePackagesFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreUpdatePackagesFunc) SetDefaultHook(hook func(context.Context, int, []semantic.Package) error)
```

SetDefaultHook sets function that is called when the UpdatePackages method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreUpdatePackagesFunc.PushHook" href="#DBStoreUpdatePackagesFunc.PushHook">func (f *DBStoreUpdatePackagesFunc) PushHook(hook func(context.Context, int, []semantic.Package) error)</a>

```
searchKey: worker.DBStoreUpdatePackagesFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreUpdatePackagesFunc) PushHook(hook func(context.Context, int, []semantic.Package) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the UpdatePackages method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreUpdatePackagesFunc.SetDefaultReturn" href="#DBStoreUpdatePackagesFunc.SetDefaultReturn">func (f *DBStoreUpdatePackagesFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.DBStoreUpdatePackagesFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreUpdatePackagesFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreUpdatePackagesFunc.PushReturn" href="#DBStoreUpdatePackagesFunc.PushReturn">func (f *DBStoreUpdatePackagesFunc) PushReturn(r0 error)</a>

```
searchKey: worker.DBStoreUpdatePackagesFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreUpdatePackagesFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreUpdatePackagesFunc.nextHook" href="#DBStoreUpdatePackagesFunc.nextHook">func (f *DBStoreUpdatePackagesFunc) nextHook() func(context.Context, int, []semantic.Package) error</a>

```
searchKey: worker.DBStoreUpdatePackagesFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreUpdatePackagesFunc) nextHook() func(context.Context, int, []semantic.Package) error
```

#### <a id="DBStoreUpdatePackagesFunc.appendCall" href="#DBStoreUpdatePackagesFunc.appendCall">func (f *DBStoreUpdatePackagesFunc) appendCall(r0 DBStoreUpdatePackagesFuncCall)</a>

```
searchKey: worker.DBStoreUpdatePackagesFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreUpdatePackagesFunc) appendCall(r0 DBStoreUpdatePackagesFuncCall)
```

#### <a id="DBStoreUpdatePackagesFunc.History" href="#DBStoreUpdatePackagesFunc.History">func (f *DBStoreUpdatePackagesFunc) History() []DBStoreUpdatePackagesFuncCall</a>

```
searchKey: worker.DBStoreUpdatePackagesFunc.History
tags: [private]
```

```Go
func (f *DBStoreUpdatePackagesFunc) History() []DBStoreUpdatePackagesFuncCall
```

History returns a sequence of DBStoreUpdatePackagesFuncCall objects describing the invocations of this function. 

### <a id="DBStoreUpdatePackagesFuncCall" href="#DBStoreUpdatePackagesFuncCall">type DBStoreUpdatePackagesFuncCall struct</a>

```
searchKey: worker.DBStoreUpdatePackagesFuncCall
tags: [private]
```

```Go
type DBStoreUpdatePackagesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 []semantic.Package
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreUpdatePackagesFuncCall is an object that describes an invocation of method UpdatePackages on an instance of MockDBStore. 

#### <a id="DBStoreUpdatePackagesFuncCall.Args" href="#DBStoreUpdatePackagesFuncCall.Args">func (c DBStoreUpdatePackagesFuncCall) Args() []interface{}</a>

```
searchKey: worker.DBStoreUpdatePackagesFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreUpdatePackagesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreUpdatePackagesFuncCall.Results" href="#DBStoreUpdatePackagesFuncCall.Results">func (c DBStoreUpdatePackagesFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreUpdatePackagesFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreUpdatePackagesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreWithFunc" href="#DBStoreWithFunc">type DBStoreWithFunc struct</a>

```
searchKey: worker.DBStoreWithFunc
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
searchKey: worker.DBStoreWithFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *DBStoreWithFunc) SetDefaultHook(hook func(basestore.ShareableStore) DBStore)
```

SetDefaultHook sets function that is called when the With method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreWithFunc.PushHook" href="#DBStoreWithFunc.PushHook">func (f *DBStoreWithFunc) PushHook(hook func(basestore.ShareableStore) DBStore)</a>

```
searchKey: worker.DBStoreWithFunc.PushHook
tags: [private]
```

```Go
func (f *DBStoreWithFunc) PushHook(hook func(basestore.ShareableStore) DBStore)
```

PushHook adds a function to the end of hook queue. Each invocation of the With method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreWithFunc.SetDefaultReturn" href="#DBStoreWithFunc.SetDefaultReturn">func (f *DBStoreWithFunc) SetDefaultReturn(r0 DBStore)</a>

```
searchKey: worker.DBStoreWithFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *DBStoreWithFunc) SetDefaultReturn(r0 DBStore)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreWithFunc.PushReturn" href="#DBStoreWithFunc.PushReturn">func (f *DBStoreWithFunc) PushReturn(r0 DBStore)</a>

```
searchKey: worker.DBStoreWithFunc.PushReturn
tags: [private]
```

```Go
func (f *DBStoreWithFunc) PushReturn(r0 DBStore)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreWithFunc.nextHook" href="#DBStoreWithFunc.nextHook">func (f *DBStoreWithFunc) nextHook() func(basestore.ShareableStore) DBStore</a>

```
searchKey: worker.DBStoreWithFunc.nextHook
tags: [private]
```

```Go
func (f *DBStoreWithFunc) nextHook() func(basestore.ShareableStore) DBStore
```

#### <a id="DBStoreWithFunc.appendCall" href="#DBStoreWithFunc.appendCall">func (f *DBStoreWithFunc) appendCall(r0 DBStoreWithFuncCall)</a>

```
searchKey: worker.DBStoreWithFunc.appendCall
tags: [private]
```

```Go
func (f *DBStoreWithFunc) appendCall(r0 DBStoreWithFuncCall)
```

#### <a id="DBStoreWithFunc.History" href="#DBStoreWithFunc.History">func (f *DBStoreWithFunc) History() []DBStoreWithFuncCall</a>

```
searchKey: worker.DBStoreWithFunc.History
tags: [private]
```

```Go
func (f *DBStoreWithFunc) History() []DBStoreWithFuncCall
```

History returns a sequence of DBStoreWithFuncCall objects describing the invocations of this function. 

### <a id="DBStoreWithFuncCall" href="#DBStoreWithFuncCall">type DBStoreWithFuncCall struct</a>

```
searchKey: worker.DBStoreWithFuncCall
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
searchKey: worker.DBStoreWithFuncCall.Args
tags: [private]
```

```Go
func (c DBStoreWithFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreWithFuncCall.Results" href="#DBStoreWithFuncCall.Results">func (c DBStoreWithFuncCall) Results() []interface{}</a>

```
searchKey: worker.DBStoreWithFuncCall.Results
tags: [private]
```

```Go
func (c DBStoreWithFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockGitserverClient" href="#MockGitserverClient">type MockGitserverClient struct</a>

```
searchKey: worker.MockGitserverClient
tags: [private]
```

```Go
type MockGitserverClient struct {
	// CommitDateFunc is an instance of a mock function object controlling
	// the behavior of the method CommitDate.
	CommitDateFunc *GitserverClientCommitDateFunc
	// DirectoryChildrenFunc is an instance of a mock function object
	// controlling the behavior of the method DirectoryChildren.
	DirectoryChildrenFunc *GitserverClientDirectoryChildrenFunc
	// ResolveRevisionFunc is an instance of a mock function object
	// controlling the behavior of the method ResolveRevision.
	ResolveRevisionFunc *GitserverClientResolveRevisionFunc
}
```

MockGitserverClient is a mock implementation of the GitserverClient interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/precise-code-intel-worker/internal/worker) used for unit testing. 

#### <a id="NewMockGitserverClient" href="#NewMockGitserverClient">func NewMockGitserverClient() *MockGitserverClient</a>

```
searchKey: worker.NewMockGitserverClient
tags: [private]
```

```Go
func NewMockGitserverClient() *MockGitserverClient
```

NewMockGitserverClient creates a new mock of the GitserverClient interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGitserverClientFrom" href="#NewMockGitserverClientFrom">func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient</a>

```
searchKey: worker.NewMockGitserverClientFrom
tags: [private]
```

```Go
func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient
```

NewMockGitserverClientFrom creates a new mock of the MockGitserverClient interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGitserverClient.CommitDate" href="#MockGitserverClient.CommitDate">func (m *MockGitserverClient) CommitDate(v0 context.Context, v1 int, v2 string) (time.Time, error)</a>

```
searchKey: worker.MockGitserverClient.CommitDate
tags: [private]
```

```Go
func (m *MockGitserverClient) CommitDate(v0 context.Context, v1 int, v2 string) (time.Time, error)
```

CommitDate delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.DirectoryChildren" href="#MockGitserverClient.DirectoryChildren">func (m *MockGitserverClient) DirectoryChildren(v0 context.Context, v1 int, v2 string, v3 []string) (map[string][]string, error)</a>

```
searchKey: worker.MockGitserverClient.DirectoryChildren
tags: [private]
```

```Go
func (m *MockGitserverClient) DirectoryChildren(v0 context.Context, v1 int, v2 string, v3 []string) (map[string][]string, error)
```

DirectoryChildren delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.ResolveRevision" href="#MockGitserverClient.ResolveRevision">func (m *MockGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)</a>

```
searchKey: worker.MockGitserverClient.ResolveRevision
tags: [private]
```

```Go
func (m *MockGitserverClient) ResolveRevision(v0 context.Context, v1 int, v2 string) (api.CommitID, error)
```

ResolveRevision delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="GitserverClientCommitDateFunc" href="#GitserverClientCommitDateFunc">type GitserverClientCommitDateFunc struct</a>

```
searchKey: worker.GitserverClientCommitDateFunc
tags: [private]
```

```Go
type GitserverClientCommitDateFunc struct {
	defaultHook func(context.Context, int, string) (time.Time, error)
	hooks       []func(context.Context, int, string) (time.Time, error)
	history     []GitserverClientCommitDateFuncCall
	mutex       sync.Mutex
}
```

GitserverClientCommitDateFunc describes the behavior when the CommitDate method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientCommitDateFunc.SetDefaultHook" href="#GitserverClientCommitDateFunc.SetDefaultHook">func (f *GitserverClientCommitDateFunc) SetDefaultHook(hook func(context.Context, int, string) (time.Time, error))</a>

```
searchKey: worker.GitserverClientCommitDateFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GitserverClientCommitDateFunc) SetDefaultHook(hook func(context.Context, int, string) (time.Time, error))
```

SetDefaultHook sets function that is called when the CommitDate method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientCommitDateFunc.PushHook" href="#GitserverClientCommitDateFunc.PushHook">func (f *GitserverClientCommitDateFunc) PushHook(hook func(context.Context, int, string) (time.Time, error))</a>

```
searchKey: worker.GitserverClientCommitDateFunc.PushHook
tags: [private]
```

```Go
func (f *GitserverClientCommitDateFunc) PushHook(hook func(context.Context, int, string) (time.Time, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CommitDate method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientCommitDateFunc.SetDefaultReturn" href="#GitserverClientCommitDateFunc.SetDefaultReturn">func (f *GitserverClientCommitDateFunc) SetDefaultReturn(r0 time.Time, r1 error)</a>

```
searchKey: worker.GitserverClientCommitDateFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GitserverClientCommitDateFunc) SetDefaultReturn(r0 time.Time, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitDateFunc.PushReturn" href="#GitserverClientCommitDateFunc.PushReturn">func (f *GitserverClientCommitDateFunc) PushReturn(r0 time.Time, r1 error)</a>

```
searchKey: worker.GitserverClientCommitDateFunc.PushReturn
tags: [private]
```

```Go
func (f *GitserverClientCommitDateFunc) PushReturn(r0 time.Time, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitDateFunc.nextHook" href="#GitserverClientCommitDateFunc.nextHook">func (f *GitserverClientCommitDateFunc) nextHook() func(context.Context, int, string) (time.Time, error)</a>

```
searchKey: worker.GitserverClientCommitDateFunc.nextHook
tags: [private]
```

```Go
func (f *GitserverClientCommitDateFunc) nextHook() func(context.Context, int, string) (time.Time, error)
```

#### <a id="GitserverClientCommitDateFunc.appendCall" href="#GitserverClientCommitDateFunc.appendCall">func (f *GitserverClientCommitDateFunc) appendCall(r0 GitserverClientCommitDateFuncCall)</a>

```
searchKey: worker.GitserverClientCommitDateFunc.appendCall
tags: [private]
```

```Go
func (f *GitserverClientCommitDateFunc) appendCall(r0 GitserverClientCommitDateFuncCall)
```

#### <a id="GitserverClientCommitDateFunc.History" href="#GitserverClientCommitDateFunc.History">func (f *GitserverClientCommitDateFunc) History() []GitserverClientCommitDateFuncCall</a>

```
searchKey: worker.GitserverClientCommitDateFunc.History
tags: [private]
```

```Go
func (f *GitserverClientCommitDateFunc) History() []GitserverClientCommitDateFuncCall
```

History returns a sequence of GitserverClientCommitDateFuncCall objects describing the invocations of this function. 

### <a id="GitserverClientCommitDateFuncCall" href="#GitserverClientCommitDateFuncCall">type GitserverClientCommitDateFuncCall struct</a>

```
searchKey: worker.GitserverClientCommitDateFuncCall
tags: [private]
```

```Go
type GitserverClientCommitDateFuncCall struct {
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
	Result0 time.Time
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GitserverClientCommitDateFuncCall is an object that describes an invocation of method CommitDate on an instance of MockGitserverClient. 

#### <a id="GitserverClientCommitDateFuncCall.Args" href="#GitserverClientCommitDateFuncCall.Args">func (c GitserverClientCommitDateFuncCall) Args() []interface{}</a>

```
searchKey: worker.GitserverClientCommitDateFuncCall.Args
tags: [private]
```

```Go
func (c GitserverClientCommitDateFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientCommitDateFuncCall.Results" href="#GitserverClientCommitDateFuncCall.Results">func (c GitserverClientCommitDateFuncCall) Results() []interface{}</a>

```
searchKey: worker.GitserverClientCommitDateFuncCall.Results
tags: [private]
```

```Go
func (c GitserverClientCommitDateFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientDirectoryChildrenFunc" href="#GitserverClientDirectoryChildrenFunc">type GitserverClientDirectoryChildrenFunc struct</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFunc
tags: [private]
```

```Go
type GitserverClientDirectoryChildrenFunc struct {
	defaultHook func(context.Context, int, string, []string) (map[string][]string, error)
	hooks       []func(context.Context, int, string, []string) (map[string][]string, error)
	history     []GitserverClientDirectoryChildrenFuncCall
	mutex       sync.Mutex
}
```

GitserverClientDirectoryChildrenFunc describes the behavior when the DirectoryChildren method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientDirectoryChildrenFunc.SetDefaultHook" href="#GitserverClientDirectoryChildrenFunc.SetDefaultHook">func (f *GitserverClientDirectoryChildrenFunc) SetDefaultHook(hook func(context.Context, int, string, []string) (map[string][]string, error))</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GitserverClientDirectoryChildrenFunc) SetDefaultHook(hook func(context.Context, int, string, []string) (map[string][]string, error))
```

SetDefaultHook sets function that is called when the DirectoryChildren method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientDirectoryChildrenFunc.PushHook" href="#GitserverClientDirectoryChildrenFunc.PushHook">func (f *GitserverClientDirectoryChildrenFunc) PushHook(hook func(context.Context, int, string, []string) (map[string][]string, error))</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFunc.PushHook
tags: [private]
```

```Go
func (f *GitserverClientDirectoryChildrenFunc) PushHook(hook func(context.Context, int, string, []string) (map[string][]string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DirectoryChildren method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientDirectoryChildrenFunc.SetDefaultReturn" href="#GitserverClientDirectoryChildrenFunc.SetDefaultReturn">func (f *GitserverClientDirectoryChildrenFunc) SetDefaultReturn(r0 map[string][]string, r1 error)</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GitserverClientDirectoryChildrenFunc) SetDefaultReturn(r0 map[string][]string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientDirectoryChildrenFunc.PushReturn" href="#GitserverClientDirectoryChildrenFunc.PushReturn">func (f *GitserverClientDirectoryChildrenFunc) PushReturn(r0 map[string][]string, r1 error)</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFunc.PushReturn
tags: [private]
```

```Go
func (f *GitserverClientDirectoryChildrenFunc) PushReturn(r0 map[string][]string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientDirectoryChildrenFunc.nextHook" href="#GitserverClientDirectoryChildrenFunc.nextHook">func (f *GitserverClientDirectoryChildrenFunc) nextHook() func(context.Context, int, string, []string) (map[string][]string, error)</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFunc.nextHook
tags: [private]
```

```Go
func (f *GitserverClientDirectoryChildrenFunc) nextHook() func(context.Context, int, string, []string) (map[string][]string, error)
```

#### <a id="GitserverClientDirectoryChildrenFunc.appendCall" href="#GitserverClientDirectoryChildrenFunc.appendCall">func (f *GitserverClientDirectoryChildrenFunc) appendCall(r0 GitserverClientDirectoryChildrenFuncCall)</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFunc.appendCall
tags: [private]
```

```Go
func (f *GitserverClientDirectoryChildrenFunc) appendCall(r0 GitserverClientDirectoryChildrenFuncCall)
```

#### <a id="GitserverClientDirectoryChildrenFunc.History" href="#GitserverClientDirectoryChildrenFunc.History">func (f *GitserverClientDirectoryChildrenFunc) History() []GitserverClientDirectoryChildrenFuncCall</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFunc.History
tags: [private]
```

```Go
func (f *GitserverClientDirectoryChildrenFunc) History() []GitserverClientDirectoryChildrenFuncCall
```

History returns a sequence of GitserverClientDirectoryChildrenFuncCall objects describing the invocations of this function. 

### <a id="GitserverClientDirectoryChildrenFuncCall" href="#GitserverClientDirectoryChildrenFuncCall">type GitserverClientDirectoryChildrenFuncCall struct</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFuncCall
tags: [private]
```

```Go
type GitserverClientDirectoryChildrenFuncCall struct {
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
	Arg3 []string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 map[string][]string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GitserverClientDirectoryChildrenFuncCall is an object that describes an invocation of method DirectoryChildren on an instance of MockGitserverClient. 

#### <a id="GitserverClientDirectoryChildrenFuncCall.Args" href="#GitserverClientDirectoryChildrenFuncCall.Args">func (c GitserverClientDirectoryChildrenFuncCall) Args() []interface{}</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFuncCall.Args
tags: [private]
```

```Go
func (c GitserverClientDirectoryChildrenFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientDirectoryChildrenFuncCall.Results" href="#GitserverClientDirectoryChildrenFuncCall.Results">func (c GitserverClientDirectoryChildrenFuncCall) Results() []interface{}</a>

```
searchKey: worker.GitserverClientDirectoryChildrenFuncCall.Results
tags: [private]
```

```Go
func (c GitserverClientDirectoryChildrenFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientResolveRevisionFunc" href="#GitserverClientResolveRevisionFunc">type GitserverClientResolveRevisionFunc struct</a>

```
searchKey: worker.GitserverClientResolveRevisionFunc
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
searchKey: worker.GitserverClientResolveRevisionFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) SetDefaultHook(hook func(context.Context, int, string) (api.CommitID, error))
```

SetDefaultHook sets function that is called when the ResolveRevision method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientResolveRevisionFunc.PushHook" href="#GitserverClientResolveRevisionFunc.PushHook">func (f *GitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))</a>

```
searchKey: worker.GitserverClientResolveRevisionFunc.PushHook
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) PushHook(hook func(context.Context, int, string) (api.CommitID, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ResolveRevision method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientResolveRevisionFunc.SetDefaultReturn" href="#GitserverClientResolveRevisionFunc.SetDefaultReturn">func (f *GitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)</a>

```
searchKey: worker.GitserverClientResolveRevisionFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) SetDefaultReturn(r0 api.CommitID, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientResolveRevisionFunc.PushReturn" href="#GitserverClientResolveRevisionFunc.PushReturn">func (f *GitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)</a>

```
searchKey: worker.GitserverClientResolveRevisionFunc.PushReturn
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) PushReturn(r0 api.CommitID, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientResolveRevisionFunc.nextHook" href="#GitserverClientResolveRevisionFunc.nextHook">func (f *GitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)</a>

```
searchKey: worker.GitserverClientResolveRevisionFunc.nextHook
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) nextHook() func(context.Context, int, string) (api.CommitID, error)
```

#### <a id="GitserverClientResolveRevisionFunc.appendCall" href="#GitserverClientResolveRevisionFunc.appendCall">func (f *GitserverClientResolveRevisionFunc) appendCall(r0 GitserverClientResolveRevisionFuncCall)</a>

```
searchKey: worker.GitserverClientResolveRevisionFunc.appendCall
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) appendCall(r0 GitserverClientResolveRevisionFuncCall)
```

#### <a id="GitserverClientResolveRevisionFunc.History" href="#GitserverClientResolveRevisionFunc.History">func (f *GitserverClientResolveRevisionFunc) History() []GitserverClientResolveRevisionFuncCall</a>

```
searchKey: worker.GitserverClientResolveRevisionFunc.History
tags: [private]
```

```Go
func (f *GitserverClientResolveRevisionFunc) History() []GitserverClientResolveRevisionFuncCall
```

History returns a sequence of GitserverClientResolveRevisionFuncCall objects describing the invocations of this function. 

### <a id="GitserverClientResolveRevisionFuncCall" href="#GitserverClientResolveRevisionFuncCall">type GitserverClientResolveRevisionFuncCall struct</a>

```
searchKey: worker.GitserverClientResolveRevisionFuncCall
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
searchKey: worker.GitserverClientResolveRevisionFuncCall.Args
tags: [private]
```

```Go
func (c GitserverClientResolveRevisionFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientResolveRevisionFuncCall.Results" href="#GitserverClientResolveRevisionFuncCall.Results">func (c GitserverClientResolveRevisionFuncCall) Results() []interface{}</a>

```
searchKey: worker.GitserverClientResolveRevisionFuncCall.Results
tags: [private]
```

```Go
func (c GitserverClientResolveRevisionFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockLSIFStore" href="#MockLSIFStore">type MockLSIFStore struct</a>

```
searchKey: worker.MockLSIFStore
tags: [private]
```

```Go
type MockLSIFStore struct {
	// DoneFunc is an instance of a mock function object controlling the
	// behavior of the method Done.
	DoneFunc *LSIFStoreDoneFunc
	// TransactFunc is an instance of a mock function object controlling the
	// behavior of the method Transact.
	TransactFunc *LSIFStoreTransactFunc
	// WriteDefinitionsFunc is an instance of a mock function object
	// controlling the behavior of the method WriteDefinitions.
	WriteDefinitionsFunc *LSIFStoreWriteDefinitionsFunc
	// WriteDocumentationPagesFunc is an instance of a mock function object
	// controlling the behavior of the method WriteDocumentationPages.
	WriteDocumentationPagesFunc *LSIFStoreWriteDocumentationPagesFunc
	// WriteDocumentsFunc is an instance of a mock function object
	// controlling the behavior of the method WriteDocuments.
	WriteDocumentsFunc *LSIFStoreWriteDocumentsFunc
	// WriteMetaFunc is an instance of a mock function object controlling
	// the behavior of the method WriteMeta.
	WriteMetaFunc *LSIFStoreWriteMetaFunc
	// WriteReferencesFunc is an instance of a mock function object
	// controlling the behavior of the method WriteReferences.
	WriteReferencesFunc *LSIFStoreWriteReferencesFunc
	// WriteResultChunksFunc is an instance of a mock function object
	// controlling the behavior of the method WriteResultChunks.
	WriteResultChunksFunc *LSIFStoreWriteResultChunksFunc
}
```

MockLSIFStore is a mock implementation of the LSIFStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/precise-code-intel-worker/internal/worker) used for unit testing. 

#### <a id="NewMockLSIFStore" href="#NewMockLSIFStore">func NewMockLSIFStore() *MockLSIFStore</a>

```
searchKey: worker.NewMockLSIFStore
tags: [private]
```

```Go
func NewMockLSIFStore() *MockLSIFStore
```

NewMockLSIFStore creates a new mock of the LSIFStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockLSIFStoreFrom" href="#NewMockLSIFStoreFrom">func NewMockLSIFStoreFrom(i LSIFStore) *MockLSIFStore</a>

```
searchKey: worker.NewMockLSIFStoreFrom
tags: [private]
```

```Go
func NewMockLSIFStoreFrom(i LSIFStore) *MockLSIFStore
```

NewMockLSIFStoreFrom creates a new mock of the MockLSIFStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockLSIFStore.Done" href="#MockLSIFStore.Done">func (m *MockLSIFStore) Done(v0 error) error</a>

```
searchKey: worker.MockLSIFStore.Done
tags: [private]
```

```Go
func (m *MockLSIFStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.Transact" href="#MockLSIFStore.Transact">func (m *MockLSIFStore) Transact(v0 context.Context) (LSIFStore, error)</a>

```
searchKey: worker.MockLSIFStore.Transact
tags: [private]
```

```Go
func (m *MockLSIFStore) Transact(v0 context.Context) (LSIFStore, error)
```

Transact delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.WriteDefinitions" href="#MockLSIFStore.WriteDefinitions">func (m *MockLSIFStore) WriteDefinitions(v0 context.Context, v1 int, v2 chan semantic.MonikerLocations) error</a>

```
searchKey: worker.MockLSIFStore.WriteDefinitions
tags: [private]
```

```Go
func (m *MockLSIFStore) WriteDefinitions(v0 context.Context, v1 int, v2 chan semantic.MonikerLocations) error
```

WriteDefinitions delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.WriteDocumentationPages" href="#MockLSIFStore.WriteDocumentationPages">func (m *MockLSIFStore) WriteDocumentationPages(v0 context.Context, v1 int, v2 chan *semantic.DocumentationPageData) error</a>

```
searchKey: worker.MockLSIFStore.WriteDocumentationPages
tags: [private]
```

```Go
func (m *MockLSIFStore) WriteDocumentationPages(v0 context.Context, v1 int, v2 chan *semantic.DocumentationPageData) error
```

WriteDocumentationPages delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.WriteDocuments" href="#MockLSIFStore.WriteDocuments">func (m *MockLSIFStore) WriteDocuments(v0 context.Context, v1 int, v2 chan semantic.KeyedDocumentData) error</a>

```
searchKey: worker.MockLSIFStore.WriteDocuments
tags: [private]
```

```Go
func (m *MockLSIFStore) WriteDocuments(v0 context.Context, v1 int, v2 chan semantic.KeyedDocumentData) error
```

WriteDocuments delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.WriteMeta" href="#MockLSIFStore.WriteMeta">func (m *MockLSIFStore) WriteMeta(v0 context.Context, v1 int, v2 semantic.MetaData) error</a>

```
searchKey: worker.MockLSIFStore.WriteMeta
tags: [private]
```

```Go
func (m *MockLSIFStore) WriteMeta(v0 context.Context, v1 int, v2 semantic.MetaData) error
```

WriteMeta delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.WriteReferences" href="#MockLSIFStore.WriteReferences">func (m *MockLSIFStore) WriteReferences(v0 context.Context, v1 int, v2 chan semantic.MonikerLocations) error</a>

```
searchKey: worker.MockLSIFStore.WriteReferences
tags: [private]
```

```Go
func (m *MockLSIFStore) WriteReferences(v0 context.Context, v1 int, v2 chan semantic.MonikerLocations) error
```

WriteReferences delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockLSIFStore.WriteResultChunks" href="#MockLSIFStore.WriteResultChunks">func (m *MockLSIFStore) WriteResultChunks(v0 context.Context, v1 int, v2 chan semantic.IndexedResultChunkData) error</a>

```
searchKey: worker.MockLSIFStore.WriteResultChunks
tags: [private]
```

```Go
func (m *MockLSIFStore) WriteResultChunks(v0 context.Context, v1 int, v2 chan semantic.IndexedResultChunkData) error
```

WriteResultChunks delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="LSIFStoreDoneFunc" href="#LSIFStoreDoneFunc">type LSIFStoreDoneFunc struct</a>

```
searchKey: worker.LSIFStoreDoneFunc
tags: [private]
```

```Go
type LSIFStoreDoneFunc struct {
	defaultHook func(error) error
	hooks       []func(error) error
	history     []LSIFStoreDoneFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreDoneFunc describes the behavior when the Done method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreDoneFunc.SetDefaultHook" href="#LSIFStoreDoneFunc.SetDefaultHook">func (f *LSIFStoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: worker.LSIFStoreDoneFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *LSIFStoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreDoneFunc.PushHook" href="#LSIFStoreDoneFunc.PushHook">func (f *LSIFStoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: worker.LSIFStoreDoneFunc.PushHook
tags: [private]
```

```Go
func (f *LSIFStoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreDoneFunc.SetDefaultReturn" href="#LSIFStoreDoneFunc.SetDefaultReturn">func (f *LSIFStoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreDoneFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *LSIFStoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreDoneFunc.PushReturn" href="#LSIFStoreDoneFunc.PushReturn">func (f *LSIFStoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreDoneFunc.PushReturn
tags: [private]
```

```Go
func (f *LSIFStoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreDoneFunc.nextHook" href="#LSIFStoreDoneFunc.nextHook">func (f *LSIFStoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: worker.LSIFStoreDoneFunc.nextHook
tags: [private]
```

```Go
func (f *LSIFStoreDoneFunc) nextHook() func(error) error
```

#### <a id="LSIFStoreDoneFunc.appendCall" href="#LSIFStoreDoneFunc.appendCall">func (f *LSIFStoreDoneFunc) appendCall(r0 LSIFStoreDoneFuncCall)</a>

```
searchKey: worker.LSIFStoreDoneFunc.appendCall
tags: [private]
```

```Go
func (f *LSIFStoreDoneFunc) appendCall(r0 LSIFStoreDoneFuncCall)
```

#### <a id="LSIFStoreDoneFunc.History" href="#LSIFStoreDoneFunc.History">func (f *LSIFStoreDoneFunc) History() []LSIFStoreDoneFuncCall</a>

```
searchKey: worker.LSIFStoreDoneFunc.History
tags: [private]
```

```Go
func (f *LSIFStoreDoneFunc) History() []LSIFStoreDoneFuncCall
```

History returns a sequence of LSIFStoreDoneFuncCall objects describing the invocations of this function. 

### <a id="LSIFStoreDoneFuncCall" href="#LSIFStoreDoneFuncCall">type LSIFStoreDoneFuncCall struct</a>

```
searchKey: worker.LSIFStoreDoneFuncCall
tags: [private]
```

```Go
type LSIFStoreDoneFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 error
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

LSIFStoreDoneFuncCall is an object that describes an invocation of method Done on an instance of MockLSIFStore. 

#### <a id="LSIFStoreDoneFuncCall.Args" href="#LSIFStoreDoneFuncCall.Args">func (c LSIFStoreDoneFuncCall) Args() []interface{}</a>

```
searchKey: worker.LSIFStoreDoneFuncCall.Args
tags: [private]
```

```Go
func (c LSIFStoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreDoneFuncCall.Results" href="#LSIFStoreDoneFuncCall.Results">func (c LSIFStoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: worker.LSIFStoreDoneFuncCall.Results
tags: [private]
```

```Go
func (c LSIFStoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreTransactFunc" href="#LSIFStoreTransactFunc">type LSIFStoreTransactFunc struct</a>

```
searchKey: worker.LSIFStoreTransactFunc
tags: [private]
```

```Go
type LSIFStoreTransactFunc struct {
	defaultHook func(context.Context) (LSIFStore, error)
	hooks       []func(context.Context) (LSIFStore, error)
	history     []LSIFStoreTransactFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreTransactFunc describes the behavior when the Transact method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreTransactFunc.SetDefaultHook" href="#LSIFStoreTransactFunc.SetDefaultHook">func (f *LSIFStoreTransactFunc) SetDefaultHook(hook func(context.Context) (LSIFStore, error))</a>

```
searchKey: worker.LSIFStoreTransactFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *LSIFStoreTransactFunc) SetDefaultHook(hook func(context.Context) (LSIFStore, error))
```

SetDefaultHook sets function that is called when the Transact method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreTransactFunc.PushHook" href="#LSIFStoreTransactFunc.PushHook">func (f *LSIFStoreTransactFunc) PushHook(hook func(context.Context) (LSIFStore, error))</a>

```
searchKey: worker.LSIFStoreTransactFunc.PushHook
tags: [private]
```

```Go
func (f *LSIFStoreTransactFunc) PushHook(hook func(context.Context) (LSIFStore, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Transact method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreTransactFunc.SetDefaultReturn" href="#LSIFStoreTransactFunc.SetDefaultReturn">func (f *LSIFStoreTransactFunc) SetDefaultReturn(r0 LSIFStore, r1 error)</a>

```
searchKey: worker.LSIFStoreTransactFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *LSIFStoreTransactFunc) SetDefaultReturn(r0 LSIFStore, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreTransactFunc.PushReturn" href="#LSIFStoreTransactFunc.PushReturn">func (f *LSIFStoreTransactFunc) PushReturn(r0 LSIFStore, r1 error)</a>

```
searchKey: worker.LSIFStoreTransactFunc.PushReturn
tags: [private]
```

```Go
func (f *LSIFStoreTransactFunc) PushReturn(r0 LSIFStore, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreTransactFunc.nextHook" href="#LSIFStoreTransactFunc.nextHook">func (f *LSIFStoreTransactFunc) nextHook() func(context.Context) (LSIFStore, error)</a>

```
searchKey: worker.LSIFStoreTransactFunc.nextHook
tags: [private]
```

```Go
func (f *LSIFStoreTransactFunc) nextHook() func(context.Context) (LSIFStore, error)
```

#### <a id="LSIFStoreTransactFunc.appendCall" href="#LSIFStoreTransactFunc.appendCall">func (f *LSIFStoreTransactFunc) appendCall(r0 LSIFStoreTransactFuncCall)</a>

```
searchKey: worker.LSIFStoreTransactFunc.appendCall
tags: [private]
```

```Go
func (f *LSIFStoreTransactFunc) appendCall(r0 LSIFStoreTransactFuncCall)
```

#### <a id="LSIFStoreTransactFunc.History" href="#LSIFStoreTransactFunc.History">func (f *LSIFStoreTransactFunc) History() []LSIFStoreTransactFuncCall</a>

```
searchKey: worker.LSIFStoreTransactFunc.History
tags: [private]
```

```Go
func (f *LSIFStoreTransactFunc) History() []LSIFStoreTransactFuncCall
```

History returns a sequence of LSIFStoreTransactFuncCall objects describing the invocations of this function. 

### <a id="LSIFStoreTransactFuncCall" href="#LSIFStoreTransactFuncCall">type LSIFStoreTransactFuncCall struct</a>

```
searchKey: worker.LSIFStoreTransactFuncCall
tags: [private]
```

```Go
type LSIFStoreTransactFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 LSIFStore
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

LSIFStoreTransactFuncCall is an object that describes an invocation of method Transact on an instance of MockLSIFStore. 

#### <a id="LSIFStoreTransactFuncCall.Args" href="#LSIFStoreTransactFuncCall.Args">func (c LSIFStoreTransactFuncCall) Args() []interface{}</a>

```
searchKey: worker.LSIFStoreTransactFuncCall.Args
tags: [private]
```

```Go
func (c LSIFStoreTransactFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreTransactFuncCall.Results" href="#LSIFStoreTransactFuncCall.Results">func (c LSIFStoreTransactFuncCall) Results() []interface{}</a>

```
searchKey: worker.LSIFStoreTransactFuncCall.Results
tags: [private]
```

```Go
func (c LSIFStoreTransactFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreWriteDefinitionsFunc" href="#LSIFStoreWriteDefinitionsFunc">type LSIFStoreWriteDefinitionsFunc struct</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFunc
tags: [private]
```

```Go
type LSIFStoreWriteDefinitionsFunc struct {
	defaultHook func(context.Context, int, chan semantic.MonikerLocations) error
	hooks       []func(context.Context, int, chan semantic.MonikerLocations) error
	history     []LSIFStoreWriteDefinitionsFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreWriteDefinitionsFunc describes the behavior when the WriteDefinitions method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreWriteDefinitionsFunc.SetDefaultHook" href="#LSIFStoreWriteDefinitionsFunc.SetDefaultHook">func (f *LSIFStoreWriteDefinitionsFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteDefinitionsFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)
```

SetDefaultHook sets function that is called when the WriteDefinitions method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreWriteDefinitionsFunc.PushHook" href="#LSIFStoreWriteDefinitionsFunc.PushHook">func (f *LSIFStoreWriteDefinitionsFunc) PushHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFunc.PushHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteDefinitionsFunc) PushHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the WriteDefinitions method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreWriteDefinitionsFunc.SetDefaultReturn" href="#LSIFStoreWriteDefinitionsFunc.SetDefaultReturn">func (f *LSIFStoreWriteDefinitionsFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteDefinitionsFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteDefinitionsFunc.PushReturn" href="#LSIFStoreWriteDefinitionsFunc.PushReturn">func (f *LSIFStoreWriteDefinitionsFunc) PushReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFunc.PushReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteDefinitionsFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteDefinitionsFunc.nextHook" href="#LSIFStoreWriteDefinitionsFunc.nextHook">func (f *LSIFStoreWriteDefinitionsFunc) nextHook() func(context.Context, int, chan semantic.MonikerLocations) error</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFunc.nextHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteDefinitionsFunc) nextHook() func(context.Context, int, chan semantic.MonikerLocations) error
```

#### <a id="LSIFStoreWriteDefinitionsFunc.appendCall" href="#LSIFStoreWriteDefinitionsFunc.appendCall">func (f *LSIFStoreWriteDefinitionsFunc) appendCall(r0 LSIFStoreWriteDefinitionsFuncCall)</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFunc.appendCall
tags: [private]
```

```Go
func (f *LSIFStoreWriteDefinitionsFunc) appendCall(r0 LSIFStoreWriteDefinitionsFuncCall)
```

#### <a id="LSIFStoreWriteDefinitionsFunc.History" href="#LSIFStoreWriteDefinitionsFunc.History">func (f *LSIFStoreWriteDefinitionsFunc) History() []LSIFStoreWriteDefinitionsFuncCall</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFunc.History
tags: [private]
```

```Go
func (f *LSIFStoreWriteDefinitionsFunc) History() []LSIFStoreWriteDefinitionsFuncCall
```

History returns a sequence of LSIFStoreWriteDefinitionsFuncCall objects describing the invocations of this function. 

### <a id="LSIFStoreWriteDefinitionsFuncCall" href="#LSIFStoreWriteDefinitionsFuncCall">type LSIFStoreWriteDefinitionsFuncCall struct</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFuncCall
tags: [private]
```

```Go
type LSIFStoreWriteDefinitionsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 chan semantic.MonikerLocations
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

LSIFStoreWriteDefinitionsFuncCall is an object that describes an invocation of method WriteDefinitions on an instance of MockLSIFStore. 

#### <a id="LSIFStoreWriteDefinitionsFuncCall.Args" href="#LSIFStoreWriteDefinitionsFuncCall.Args">func (c LSIFStoreWriteDefinitionsFuncCall) Args() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFuncCall.Args
tags: [private]
```

```Go
func (c LSIFStoreWriteDefinitionsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreWriteDefinitionsFuncCall.Results" href="#LSIFStoreWriteDefinitionsFuncCall.Results">func (c LSIFStoreWriteDefinitionsFuncCall) Results() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteDefinitionsFuncCall.Results
tags: [private]
```

```Go
func (c LSIFStoreWriteDefinitionsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreWriteDocumentationPagesFunc" href="#LSIFStoreWriteDocumentationPagesFunc">type LSIFStoreWriteDocumentationPagesFunc struct</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFunc
tags: [private]
```

```Go
type LSIFStoreWriteDocumentationPagesFunc struct {
	defaultHook func(context.Context, int, chan *semantic.DocumentationPageData) error
	hooks       []func(context.Context, int, chan *semantic.DocumentationPageData) error
	history     []LSIFStoreWriteDocumentationPagesFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreWriteDocumentationPagesFunc describes the behavior when the WriteDocumentationPages method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreWriteDocumentationPagesFunc.SetDefaultHook" href="#LSIFStoreWriteDocumentationPagesFunc.SetDefaultHook">func (f *LSIFStoreWriteDocumentationPagesFunc) SetDefaultHook(hook func(context.Context, int, chan *semantic.DocumentationPageData) error)</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentationPagesFunc) SetDefaultHook(hook func(context.Context, int, chan *semantic.DocumentationPageData) error)
```

SetDefaultHook sets function that is called when the WriteDocumentationPages method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreWriteDocumentationPagesFunc.PushHook" href="#LSIFStoreWriteDocumentationPagesFunc.PushHook">func (f *LSIFStoreWriteDocumentationPagesFunc) PushHook(hook func(context.Context, int, chan *semantic.DocumentationPageData) error)</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFunc.PushHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentationPagesFunc) PushHook(hook func(context.Context, int, chan *semantic.DocumentationPageData) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the WriteDocumentationPages method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreWriteDocumentationPagesFunc.SetDefaultReturn" href="#LSIFStoreWriteDocumentationPagesFunc.SetDefaultReturn">func (f *LSIFStoreWriteDocumentationPagesFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentationPagesFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteDocumentationPagesFunc.PushReturn" href="#LSIFStoreWriteDocumentationPagesFunc.PushReturn">func (f *LSIFStoreWriteDocumentationPagesFunc) PushReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFunc.PushReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentationPagesFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteDocumentationPagesFunc.nextHook" href="#LSIFStoreWriteDocumentationPagesFunc.nextHook">func (f *LSIFStoreWriteDocumentationPagesFunc) nextHook() func(context.Context, int, chan *semantic.DocumentationPageData) error</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFunc.nextHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentationPagesFunc) nextHook() func(context.Context, int, chan *semantic.DocumentationPageData) error
```

#### <a id="LSIFStoreWriteDocumentationPagesFunc.appendCall" href="#LSIFStoreWriteDocumentationPagesFunc.appendCall">func (f *LSIFStoreWriteDocumentationPagesFunc) appendCall(r0 LSIFStoreWriteDocumentationPagesFuncCall)</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFunc.appendCall
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentationPagesFunc) appendCall(r0 LSIFStoreWriteDocumentationPagesFuncCall)
```

#### <a id="LSIFStoreWriteDocumentationPagesFunc.History" href="#LSIFStoreWriteDocumentationPagesFunc.History">func (f *LSIFStoreWriteDocumentationPagesFunc) History() []LSIFStoreWriteDocumentationPagesFuncCall</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFunc.History
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentationPagesFunc) History() []LSIFStoreWriteDocumentationPagesFuncCall
```

History returns a sequence of LSIFStoreWriteDocumentationPagesFuncCall objects describing the invocations of this function. 

### <a id="LSIFStoreWriteDocumentationPagesFuncCall" href="#LSIFStoreWriteDocumentationPagesFuncCall">type LSIFStoreWriteDocumentationPagesFuncCall struct</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFuncCall
tags: [private]
```

```Go
type LSIFStoreWriteDocumentationPagesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 chan *semantic.DocumentationPageData
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

LSIFStoreWriteDocumentationPagesFuncCall is an object that describes an invocation of method WriteDocumentationPages on an instance of MockLSIFStore. 

#### <a id="LSIFStoreWriteDocumentationPagesFuncCall.Args" href="#LSIFStoreWriteDocumentationPagesFuncCall.Args">func (c LSIFStoreWriteDocumentationPagesFuncCall) Args() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFuncCall.Args
tags: [private]
```

```Go
func (c LSIFStoreWriteDocumentationPagesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreWriteDocumentationPagesFuncCall.Results" href="#LSIFStoreWriteDocumentationPagesFuncCall.Results">func (c LSIFStoreWriteDocumentationPagesFuncCall) Results() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteDocumentationPagesFuncCall.Results
tags: [private]
```

```Go
func (c LSIFStoreWriteDocumentationPagesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreWriteDocumentsFunc" href="#LSIFStoreWriteDocumentsFunc">type LSIFStoreWriteDocumentsFunc struct</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFunc
tags: [private]
```

```Go
type LSIFStoreWriteDocumentsFunc struct {
	defaultHook func(context.Context, int, chan semantic.KeyedDocumentData) error
	hooks       []func(context.Context, int, chan semantic.KeyedDocumentData) error
	history     []LSIFStoreWriteDocumentsFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreWriteDocumentsFunc describes the behavior when the WriteDocuments method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreWriteDocumentsFunc.SetDefaultHook" href="#LSIFStoreWriteDocumentsFunc.SetDefaultHook">func (f *LSIFStoreWriteDocumentsFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.KeyedDocumentData) error)</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentsFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.KeyedDocumentData) error)
```

SetDefaultHook sets function that is called when the WriteDocuments method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreWriteDocumentsFunc.PushHook" href="#LSIFStoreWriteDocumentsFunc.PushHook">func (f *LSIFStoreWriteDocumentsFunc) PushHook(hook func(context.Context, int, chan semantic.KeyedDocumentData) error)</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFunc.PushHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentsFunc) PushHook(hook func(context.Context, int, chan semantic.KeyedDocumentData) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the WriteDocuments method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreWriteDocumentsFunc.SetDefaultReturn" href="#LSIFStoreWriteDocumentsFunc.SetDefaultReturn">func (f *LSIFStoreWriteDocumentsFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentsFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteDocumentsFunc.PushReturn" href="#LSIFStoreWriteDocumentsFunc.PushReturn">func (f *LSIFStoreWriteDocumentsFunc) PushReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFunc.PushReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentsFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteDocumentsFunc.nextHook" href="#LSIFStoreWriteDocumentsFunc.nextHook">func (f *LSIFStoreWriteDocumentsFunc) nextHook() func(context.Context, int, chan semantic.KeyedDocumentData) error</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFunc.nextHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentsFunc) nextHook() func(context.Context, int, chan semantic.KeyedDocumentData) error
```

#### <a id="LSIFStoreWriteDocumentsFunc.appendCall" href="#LSIFStoreWriteDocumentsFunc.appendCall">func (f *LSIFStoreWriteDocumentsFunc) appendCall(r0 LSIFStoreWriteDocumentsFuncCall)</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFunc.appendCall
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentsFunc) appendCall(r0 LSIFStoreWriteDocumentsFuncCall)
```

#### <a id="LSIFStoreWriteDocumentsFunc.History" href="#LSIFStoreWriteDocumentsFunc.History">func (f *LSIFStoreWriteDocumentsFunc) History() []LSIFStoreWriteDocumentsFuncCall</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFunc.History
tags: [private]
```

```Go
func (f *LSIFStoreWriteDocumentsFunc) History() []LSIFStoreWriteDocumentsFuncCall
```

History returns a sequence of LSIFStoreWriteDocumentsFuncCall objects describing the invocations of this function. 

### <a id="LSIFStoreWriteDocumentsFuncCall" href="#LSIFStoreWriteDocumentsFuncCall">type LSIFStoreWriteDocumentsFuncCall struct</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFuncCall
tags: [private]
```

```Go
type LSIFStoreWriteDocumentsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 chan semantic.KeyedDocumentData
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

LSIFStoreWriteDocumentsFuncCall is an object that describes an invocation of method WriteDocuments on an instance of MockLSIFStore. 

#### <a id="LSIFStoreWriteDocumentsFuncCall.Args" href="#LSIFStoreWriteDocumentsFuncCall.Args">func (c LSIFStoreWriteDocumentsFuncCall) Args() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFuncCall.Args
tags: [private]
```

```Go
func (c LSIFStoreWriteDocumentsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreWriteDocumentsFuncCall.Results" href="#LSIFStoreWriteDocumentsFuncCall.Results">func (c LSIFStoreWriteDocumentsFuncCall) Results() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteDocumentsFuncCall.Results
tags: [private]
```

```Go
func (c LSIFStoreWriteDocumentsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreWriteMetaFunc" href="#LSIFStoreWriteMetaFunc">type LSIFStoreWriteMetaFunc struct</a>

```
searchKey: worker.LSIFStoreWriteMetaFunc
tags: [private]
```

```Go
type LSIFStoreWriteMetaFunc struct {
	defaultHook func(context.Context, int, semantic.MetaData) error
	hooks       []func(context.Context, int, semantic.MetaData) error
	history     []LSIFStoreWriteMetaFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreWriteMetaFunc describes the behavior when the WriteMeta method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreWriteMetaFunc.SetDefaultHook" href="#LSIFStoreWriteMetaFunc.SetDefaultHook">func (f *LSIFStoreWriteMetaFunc) SetDefaultHook(hook func(context.Context, int, semantic.MetaData) error)</a>

```
searchKey: worker.LSIFStoreWriteMetaFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteMetaFunc) SetDefaultHook(hook func(context.Context, int, semantic.MetaData) error)
```

SetDefaultHook sets function that is called when the WriteMeta method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreWriteMetaFunc.PushHook" href="#LSIFStoreWriteMetaFunc.PushHook">func (f *LSIFStoreWriteMetaFunc) PushHook(hook func(context.Context, int, semantic.MetaData) error)</a>

```
searchKey: worker.LSIFStoreWriteMetaFunc.PushHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteMetaFunc) PushHook(hook func(context.Context, int, semantic.MetaData) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the WriteMeta method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreWriteMetaFunc.SetDefaultReturn" href="#LSIFStoreWriteMetaFunc.SetDefaultReturn">func (f *LSIFStoreWriteMetaFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteMetaFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteMetaFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteMetaFunc.PushReturn" href="#LSIFStoreWriteMetaFunc.PushReturn">func (f *LSIFStoreWriteMetaFunc) PushReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteMetaFunc.PushReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteMetaFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteMetaFunc.nextHook" href="#LSIFStoreWriteMetaFunc.nextHook">func (f *LSIFStoreWriteMetaFunc) nextHook() func(context.Context, int, semantic.MetaData) error</a>

```
searchKey: worker.LSIFStoreWriteMetaFunc.nextHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteMetaFunc) nextHook() func(context.Context, int, semantic.MetaData) error
```

#### <a id="LSIFStoreWriteMetaFunc.appendCall" href="#LSIFStoreWriteMetaFunc.appendCall">func (f *LSIFStoreWriteMetaFunc) appendCall(r0 LSIFStoreWriteMetaFuncCall)</a>

```
searchKey: worker.LSIFStoreWriteMetaFunc.appendCall
tags: [private]
```

```Go
func (f *LSIFStoreWriteMetaFunc) appendCall(r0 LSIFStoreWriteMetaFuncCall)
```

#### <a id="LSIFStoreWriteMetaFunc.History" href="#LSIFStoreWriteMetaFunc.History">func (f *LSIFStoreWriteMetaFunc) History() []LSIFStoreWriteMetaFuncCall</a>

```
searchKey: worker.LSIFStoreWriteMetaFunc.History
tags: [private]
```

```Go
func (f *LSIFStoreWriteMetaFunc) History() []LSIFStoreWriteMetaFuncCall
```

History returns a sequence of LSIFStoreWriteMetaFuncCall objects describing the invocations of this function. 

### <a id="LSIFStoreWriteMetaFuncCall" href="#LSIFStoreWriteMetaFuncCall">type LSIFStoreWriteMetaFuncCall struct</a>

```
searchKey: worker.LSIFStoreWriteMetaFuncCall
tags: [private]
```

```Go
type LSIFStoreWriteMetaFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 semantic.MetaData
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

LSIFStoreWriteMetaFuncCall is an object that describes an invocation of method WriteMeta on an instance of MockLSIFStore. 

#### <a id="LSIFStoreWriteMetaFuncCall.Args" href="#LSIFStoreWriteMetaFuncCall.Args">func (c LSIFStoreWriteMetaFuncCall) Args() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteMetaFuncCall.Args
tags: [private]
```

```Go
func (c LSIFStoreWriteMetaFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreWriteMetaFuncCall.Results" href="#LSIFStoreWriteMetaFuncCall.Results">func (c LSIFStoreWriteMetaFuncCall) Results() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteMetaFuncCall.Results
tags: [private]
```

```Go
func (c LSIFStoreWriteMetaFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreWriteReferencesFunc" href="#LSIFStoreWriteReferencesFunc">type LSIFStoreWriteReferencesFunc struct</a>

```
searchKey: worker.LSIFStoreWriteReferencesFunc
tags: [private]
```

```Go
type LSIFStoreWriteReferencesFunc struct {
	defaultHook func(context.Context, int, chan semantic.MonikerLocations) error
	hooks       []func(context.Context, int, chan semantic.MonikerLocations) error
	history     []LSIFStoreWriteReferencesFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreWriteReferencesFunc describes the behavior when the WriteReferences method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreWriteReferencesFunc.SetDefaultHook" href="#LSIFStoreWriteReferencesFunc.SetDefaultHook">func (f *LSIFStoreWriteReferencesFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)</a>

```
searchKey: worker.LSIFStoreWriteReferencesFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteReferencesFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)
```

SetDefaultHook sets function that is called when the WriteReferences method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreWriteReferencesFunc.PushHook" href="#LSIFStoreWriteReferencesFunc.PushHook">func (f *LSIFStoreWriteReferencesFunc) PushHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)</a>

```
searchKey: worker.LSIFStoreWriteReferencesFunc.PushHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteReferencesFunc) PushHook(hook func(context.Context, int, chan semantic.MonikerLocations) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the WriteReferences method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreWriteReferencesFunc.SetDefaultReturn" href="#LSIFStoreWriteReferencesFunc.SetDefaultReturn">func (f *LSIFStoreWriteReferencesFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteReferencesFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteReferencesFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteReferencesFunc.PushReturn" href="#LSIFStoreWriteReferencesFunc.PushReturn">func (f *LSIFStoreWriteReferencesFunc) PushReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteReferencesFunc.PushReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteReferencesFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteReferencesFunc.nextHook" href="#LSIFStoreWriteReferencesFunc.nextHook">func (f *LSIFStoreWriteReferencesFunc) nextHook() func(context.Context, int, chan semantic.MonikerLocations) error</a>

```
searchKey: worker.LSIFStoreWriteReferencesFunc.nextHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteReferencesFunc) nextHook() func(context.Context, int, chan semantic.MonikerLocations) error
```

#### <a id="LSIFStoreWriteReferencesFunc.appendCall" href="#LSIFStoreWriteReferencesFunc.appendCall">func (f *LSIFStoreWriteReferencesFunc) appendCall(r0 LSIFStoreWriteReferencesFuncCall)</a>

```
searchKey: worker.LSIFStoreWriteReferencesFunc.appendCall
tags: [private]
```

```Go
func (f *LSIFStoreWriteReferencesFunc) appendCall(r0 LSIFStoreWriteReferencesFuncCall)
```

#### <a id="LSIFStoreWriteReferencesFunc.History" href="#LSIFStoreWriteReferencesFunc.History">func (f *LSIFStoreWriteReferencesFunc) History() []LSIFStoreWriteReferencesFuncCall</a>

```
searchKey: worker.LSIFStoreWriteReferencesFunc.History
tags: [private]
```

```Go
func (f *LSIFStoreWriteReferencesFunc) History() []LSIFStoreWriteReferencesFuncCall
```

History returns a sequence of LSIFStoreWriteReferencesFuncCall objects describing the invocations of this function. 

### <a id="LSIFStoreWriteReferencesFuncCall" href="#LSIFStoreWriteReferencesFuncCall">type LSIFStoreWriteReferencesFuncCall struct</a>

```
searchKey: worker.LSIFStoreWriteReferencesFuncCall
tags: [private]
```

```Go
type LSIFStoreWriteReferencesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 chan semantic.MonikerLocations
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

LSIFStoreWriteReferencesFuncCall is an object that describes an invocation of method WriteReferences on an instance of MockLSIFStore. 

#### <a id="LSIFStoreWriteReferencesFuncCall.Args" href="#LSIFStoreWriteReferencesFuncCall.Args">func (c LSIFStoreWriteReferencesFuncCall) Args() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteReferencesFuncCall.Args
tags: [private]
```

```Go
func (c LSIFStoreWriteReferencesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreWriteReferencesFuncCall.Results" href="#LSIFStoreWriteReferencesFuncCall.Results">func (c LSIFStoreWriteReferencesFuncCall) Results() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteReferencesFuncCall.Results
tags: [private]
```

```Go
func (c LSIFStoreWriteReferencesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="LSIFStoreWriteResultChunksFunc" href="#LSIFStoreWriteResultChunksFunc">type LSIFStoreWriteResultChunksFunc struct</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFunc
tags: [private]
```

```Go
type LSIFStoreWriteResultChunksFunc struct {
	defaultHook func(context.Context, int, chan semantic.IndexedResultChunkData) error
	hooks       []func(context.Context, int, chan semantic.IndexedResultChunkData) error
	history     []LSIFStoreWriteResultChunksFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreWriteResultChunksFunc describes the behavior when the WriteResultChunks method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreWriteResultChunksFunc.SetDefaultHook" href="#LSIFStoreWriteResultChunksFunc.SetDefaultHook">func (f *LSIFStoreWriteResultChunksFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.IndexedResultChunkData) error)</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteResultChunksFunc) SetDefaultHook(hook func(context.Context, int, chan semantic.IndexedResultChunkData) error)
```

SetDefaultHook sets function that is called when the WriteResultChunks method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreWriteResultChunksFunc.PushHook" href="#LSIFStoreWriteResultChunksFunc.PushHook">func (f *LSIFStoreWriteResultChunksFunc) PushHook(hook func(context.Context, int, chan semantic.IndexedResultChunkData) error)</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFunc.PushHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteResultChunksFunc) PushHook(hook func(context.Context, int, chan semantic.IndexedResultChunkData) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the WriteResultChunks method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreWriteResultChunksFunc.SetDefaultReturn" href="#LSIFStoreWriteResultChunksFunc.SetDefaultReturn">func (f *LSIFStoreWriteResultChunksFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteResultChunksFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteResultChunksFunc.PushReturn" href="#LSIFStoreWriteResultChunksFunc.PushReturn">func (f *LSIFStoreWriteResultChunksFunc) PushReturn(r0 error)</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFunc.PushReturn
tags: [private]
```

```Go
func (f *LSIFStoreWriteResultChunksFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreWriteResultChunksFunc.nextHook" href="#LSIFStoreWriteResultChunksFunc.nextHook">func (f *LSIFStoreWriteResultChunksFunc) nextHook() func(context.Context, int, chan semantic.IndexedResultChunkData) error</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFunc.nextHook
tags: [private]
```

```Go
func (f *LSIFStoreWriteResultChunksFunc) nextHook() func(context.Context, int, chan semantic.IndexedResultChunkData) error
```

#### <a id="LSIFStoreWriteResultChunksFunc.appendCall" href="#LSIFStoreWriteResultChunksFunc.appendCall">func (f *LSIFStoreWriteResultChunksFunc) appendCall(r0 LSIFStoreWriteResultChunksFuncCall)</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFunc.appendCall
tags: [private]
```

```Go
func (f *LSIFStoreWriteResultChunksFunc) appendCall(r0 LSIFStoreWriteResultChunksFuncCall)
```

#### <a id="LSIFStoreWriteResultChunksFunc.History" href="#LSIFStoreWriteResultChunksFunc.History">func (f *LSIFStoreWriteResultChunksFunc) History() []LSIFStoreWriteResultChunksFuncCall</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFunc.History
tags: [private]
```

```Go
func (f *LSIFStoreWriteResultChunksFunc) History() []LSIFStoreWriteResultChunksFuncCall
```

History returns a sequence of LSIFStoreWriteResultChunksFuncCall objects describing the invocations of this function. 

### <a id="LSIFStoreWriteResultChunksFuncCall" href="#LSIFStoreWriteResultChunksFuncCall">type LSIFStoreWriteResultChunksFuncCall struct</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFuncCall
tags: [private]
```

```Go
type LSIFStoreWriteResultChunksFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 chan semantic.IndexedResultChunkData
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

LSIFStoreWriteResultChunksFuncCall is an object that describes an invocation of method WriteResultChunks on an instance of MockLSIFStore. 

#### <a id="LSIFStoreWriteResultChunksFuncCall.Args" href="#LSIFStoreWriteResultChunksFuncCall.Args">func (c LSIFStoreWriteResultChunksFuncCall) Args() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFuncCall.Args
tags: [private]
```

```Go
func (c LSIFStoreWriteResultChunksFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LSIFStoreWriteResultChunksFuncCall.Results" href="#LSIFStoreWriteResultChunksFuncCall.Results">func (c LSIFStoreWriteResultChunksFuncCall) Results() []interface{}</a>

```
searchKey: worker.LSIFStoreWriteResultChunksFuncCall.Results
tags: [private]
```

```Go
func (c LSIFStoreWriteResultChunksFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockWorkerStore" href="#MockWorkerStore">type MockWorkerStore struct</a>

```
searchKey: worker.MockWorkerStore
tags: [private]
```

```Go
type MockWorkerStore struct {
	// AddExecutionLogEntryFunc is an instance of a mock function object
	// controlling the behavior of the method AddExecutionLogEntry.
	AddExecutionLogEntryFunc *WorkerStoreAddExecutionLogEntryFunc
	// DequeueFunc is an instance of a mock function object controlling the
	// behavior of the method Dequeue.
	DequeueFunc *WorkerStoreDequeueFunc
	// DequeueWithIndependentTransactionContextFunc is an instance of a mock
	// function object controlling the behavior of the method
	// DequeueWithIndependentTransactionContext.
	DequeueWithIndependentTransactionContextFunc *WorkerStoreDequeueWithIndependentTransactionContextFunc
	// DoneFunc is an instance of a mock function object controlling the
	// behavior of the method Done.
	DoneFunc *WorkerStoreDoneFunc
	// HandleFunc is an instance of a mock function object controlling the
	// behavior of the method Handle.
	HandleFunc *WorkerStoreHandleFunc
	// MarkCompleteFunc is an instance of a mock function object controlling
	// the behavior of the method MarkComplete.
	MarkCompleteFunc *WorkerStoreMarkCompleteFunc
	// MarkErroredFunc is an instance of a mock function object controlling
	// the behavior of the method MarkErrored.
	MarkErroredFunc *WorkerStoreMarkErroredFunc
	// MarkFailedFunc is an instance of a mock function object controlling
	// the behavior of the method MarkFailed.
	MarkFailedFunc *WorkerStoreMarkFailedFunc
	// QueuedCountFunc is an instance of a mock function object controlling
	// the behavior of the method QueuedCount.
	QueuedCountFunc *WorkerStoreQueuedCountFunc
	// RequeueFunc is an instance of a mock function object controlling the
	// behavior of the method Requeue.
	RequeueFunc *WorkerStoreRequeueFunc
	// ResetStalledFunc is an instance of a mock function object controlling
	// the behavior of the method ResetStalled.
	ResetStalledFunc *WorkerStoreResetStalledFunc
}
```

MockWorkerStore is a mock implementation of the Store interface (from the package github.com/sourcegraph/sourcegraph/internal/workerutil/dbworker/store) used for unit testing. 

#### <a id="NewMockWorkerStore" href="#NewMockWorkerStore">func NewMockWorkerStore() *MockWorkerStore</a>

```
searchKey: worker.NewMockWorkerStore
tags: [private]
```

```Go
func NewMockWorkerStore() *MockWorkerStore
```

NewMockWorkerStore creates a new mock of the Store interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockWorkerStoreFrom" href="#NewMockWorkerStoreFrom">func NewMockWorkerStoreFrom(i store.Store) *MockWorkerStore</a>

```
searchKey: worker.NewMockWorkerStoreFrom
tags: [private]
```

```Go
func NewMockWorkerStoreFrom(i store.Store) *MockWorkerStore
```

NewMockWorkerStoreFrom creates a new mock of the MockWorkerStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockWorkerStore.AddExecutionLogEntry" href="#MockWorkerStore.AddExecutionLogEntry">func (m *MockWorkerStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 workerutil.ExecutionLogEntry) error</a>

```
searchKey: worker.MockWorkerStore.AddExecutionLogEntry
tags: [private]
```

```Go
func (m *MockWorkerStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 workerutil.ExecutionLogEntry) error
```

AddExecutionLogEntry delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.Dequeue" href="#MockWorkerStore.Dequeue">func (m *MockWorkerStore) Dequeue(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)</a>

```
searchKey: worker.MockWorkerStore.Dequeue
tags: [private]
```

```Go
func (m *MockWorkerStore) Dequeue(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
```

Dequeue delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.DequeueWithIndependentTransactionContext" href="#MockWorkerStore.DequeueWithIndependentTransactionContext">func (m *MockWorkerStore) DequeueWithIndependentTransactionContext(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)</a>

```
searchKey: worker.MockWorkerStore.DequeueWithIndependentTransactionContext
tags: [private]
```

```Go
func (m *MockWorkerStore) DequeueWithIndependentTransactionContext(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
```

DequeueWithIndependentTransactionContext delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.Done" href="#MockWorkerStore.Done">func (m *MockWorkerStore) Done(v0 error) error</a>

```
searchKey: worker.MockWorkerStore.Done
tags: [private]
```

```Go
func (m *MockWorkerStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.Handle" href="#MockWorkerStore.Handle">func (m *MockWorkerStore) Handle() *basestore.TransactableHandle</a>

```
searchKey: worker.MockWorkerStore.Handle
tags: [private]
```

```Go
func (m *MockWorkerStore) Handle() *basestore.TransactableHandle
```

Handle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.MarkComplete" href="#MockWorkerStore.MarkComplete">func (m *MockWorkerStore) MarkComplete(v0 context.Context, v1 int) (bool, error)</a>

```
searchKey: worker.MockWorkerStore.MarkComplete
tags: [private]
```

```Go
func (m *MockWorkerStore) MarkComplete(v0 context.Context, v1 int) (bool, error)
```

MarkComplete delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.MarkErrored" href="#MockWorkerStore.MarkErrored">func (m *MockWorkerStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: worker.MockWorkerStore.MarkErrored
tags: [private]
```

```Go
func (m *MockWorkerStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)
```

MarkErrored delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.MarkFailed" href="#MockWorkerStore.MarkFailed">func (m *MockWorkerStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: worker.MockWorkerStore.MarkFailed
tags: [private]
```

```Go
func (m *MockWorkerStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)
```

MarkFailed delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.QueuedCount" href="#MockWorkerStore.QueuedCount">func (m *MockWorkerStore) QueuedCount(v0 context.Context, v1 []*sqlf.Query) (int, error)</a>

```
searchKey: worker.MockWorkerStore.QueuedCount
tags: [private]
```

```Go
func (m *MockWorkerStore) QueuedCount(v0 context.Context, v1 []*sqlf.Query) (int, error)
```

QueuedCount delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.Requeue" href="#MockWorkerStore.Requeue">func (m *MockWorkerStore) Requeue(v0 context.Context, v1 int, v2 time.Time) error</a>

```
searchKey: worker.MockWorkerStore.Requeue
tags: [private]
```

```Go
func (m *MockWorkerStore) Requeue(v0 context.Context, v1 int, v2 time.Time) error
```

Requeue delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWorkerStore.ResetStalled" href="#MockWorkerStore.ResetStalled">func (m *MockWorkerStore) ResetStalled(v0 context.Context) ([]int, []int, error)</a>

```
searchKey: worker.MockWorkerStore.ResetStalled
tags: [private]
```

```Go
func (m *MockWorkerStore) ResetStalled(v0 context.Context) ([]int, []int, error)
```

ResetStalled delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="WorkerStoreAddExecutionLogEntryFunc" href="#WorkerStoreAddExecutionLogEntryFunc">type WorkerStoreAddExecutionLogEntryFunc struct</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFunc
tags: [private]
```

```Go
type WorkerStoreAddExecutionLogEntryFunc struct {
	defaultHook func(context.Context, int, workerutil.ExecutionLogEntry) error
	hooks       []func(context.Context, int, workerutil.ExecutionLogEntry) error
	history     []WorkerStoreAddExecutionLogEntryFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreAddExecutionLogEntryFunc describes the behavior when the AddExecutionLogEntry method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreAddExecutionLogEntryFunc.SetDefaultHook" href="#WorkerStoreAddExecutionLogEntryFunc.SetDefaultHook">func (f *WorkerStoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)
```

SetDefaultHook sets function that is called when the AddExecutionLogEntry method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreAddExecutionLogEntryFunc.PushHook" href="#WorkerStoreAddExecutionLogEntryFunc.PushHook">func (f *WorkerStoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the AddExecutionLogEntry method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreAddExecutionLogEntryFunc.SetDefaultReturn" href="#WorkerStoreAddExecutionLogEntryFunc.SetDefaultReturn">func (f *WorkerStoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreAddExecutionLogEntryFunc.PushReturn" href="#WorkerStoreAddExecutionLogEntryFunc.PushReturn">func (f *WorkerStoreAddExecutionLogEntryFunc) PushReturn(r0 error)</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreAddExecutionLogEntryFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreAddExecutionLogEntryFunc.nextHook" href="#WorkerStoreAddExecutionLogEntryFunc.nextHook">func (f *WorkerStoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, workerutil.ExecutionLogEntry) error</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, workerutil.ExecutionLogEntry) error
```

#### <a id="WorkerStoreAddExecutionLogEntryFunc.appendCall" href="#WorkerStoreAddExecutionLogEntryFunc.appendCall">func (f *WorkerStoreAddExecutionLogEntryFunc) appendCall(r0 WorkerStoreAddExecutionLogEntryFuncCall)</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreAddExecutionLogEntryFunc) appendCall(r0 WorkerStoreAddExecutionLogEntryFuncCall)
```

#### <a id="WorkerStoreAddExecutionLogEntryFunc.History" href="#WorkerStoreAddExecutionLogEntryFunc.History">func (f *WorkerStoreAddExecutionLogEntryFunc) History() []WorkerStoreAddExecutionLogEntryFuncCall</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreAddExecutionLogEntryFunc) History() []WorkerStoreAddExecutionLogEntryFuncCall
```

History returns a sequence of WorkerStoreAddExecutionLogEntryFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreAddExecutionLogEntryFuncCall" href="#WorkerStoreAddExecutionLogEntryFuncCall">type WorkerStoreAddExecutionLogEntryFuncCall struct</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFuncCall
tags: [private]
```

```Go
type WorkerStoreAddExecutionLogEntryFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 workerutil.ExecutionLogEntry
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

WorkerStoreAddExecutionLogEntryFuncCall is an object that describes an invocation of method AddExecutionLogEntry on an instance of MockWorkerStore. 

#### <a id="WorkerStoreAddExecutionLogEntryFuncCall.Args" href="#WorkerStoreAddExecutionLogEntryFuncCall.Args">func (c WorkerStoreAddExecutionLogEntryFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreAddExecutionLogEntryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreAddExecutionLogEntryFuncCall.Results" href="#WorkerStoreAddExecutionLogEntryFuncCall.Results">func (c WorkerStoreAddExecutionLogEntryFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreAddExecutionLogEntryFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreAddExecutionLogEntryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreDequeueFunc" href="#WorkerStoreDequeueFunc">type WorkerStoreDequeueFunc struct</a>

```
searchKey: worker.WorkerStoreDequeueFunc
tags: [private]
```

```Go
type WorkerStoreDequeueFunc struct {
	defaultHook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
	hooks       []func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
	history     []WorkerStoreDequeueFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreDequeueFunc describes the behavior when the Dequeue method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreDequeueFunc.SetDefaultHook" href="#WorkerStoreDequeueFunc.SetDefaultHook">func (f *WorkerStoreDequeueFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))</a>

```
searchKey: worker.WorkerStoreDequeueFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreDequeueFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))
```

SetDefaultHook sets function that is called when the Dequeue method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreDequeueFunc.PushHook" href="#WorkerStoreDequeueFunc.PushHook">func (f *WorkerStoreDequeueFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))</a>

```
searchKey: worker.WorkerStoreDequeueFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreDequeueFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Dequeue method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreDequeueFunc.SetDefaultReturn" href="#WorkerStoreDequeueFunc.SetDefaultReturn">func (f *WorkerStoreDequeueFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)</a>

```
searchKey: worker.WorkerStoreDequeueFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreDequeueFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreDequeueFunc.PushReturn" href="#WorkerStoreDequeueFunc.PushReturn">func (f *WorkerStoreDequeueFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)</a>

```
searchKey: worker.WorkerStoreDequeueFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreDequeueFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreDequeueFunc.nextHook" href="#WorkerStoreDequeueFunc.nextHook">func (f *WorkerStoreDequeueFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)</a>

```
searchKey: worker.WorkerStoreDequeueFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreDequeueFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
```

#### <a id="WorkerStoreDequeueFunc.appendCall" href="#WorkerStoreDequeueFunc.appendCall">func (f *WorkerStoreDequeueFunc) appendCall(r0 WorkerStoreDequeueFuncCall)</a>

```
searchKey: worker.WorkerStoreDequeueFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreDequeueFunc) appendCall(r0 WorkerStoreDequeueFuncCall)
```

#### <a id="WorkerStoreDequeueFunc.History" href="#WorkerStoreDequeueFunc.History">func (f *WorkerStoreDequeueFunc) History() []WorkerStoreDequeueFuncCall</a>

```
searchKey: worker.WorkerStoreDequeueFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreDequeueFunc) History() []WorkerStoreDequeueFuncCall
```

History returns a sequence of WorkerStoreDequeueFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreDequeueFuncCall" href="#WorkerStoreDequeueFuncCall">type WorkerStoreDequeueFuncCall struct</a>

```
searchKey: worker.WorkerStoreDequeueFuncCall
tags: [private]
```

```Go
type WorkerStoreDequeueFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []*sqlf.Query
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 workerutil.Record
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 store.Store
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 bool
	// Result3 is the value of the 4th result returned from this method
	// invocation.
	Result3 error
}
```

WorkerStoreDequeueFuncCall is an object that describes an invocation of method Dequeue on an instance of MockWorkerStore. 

#### <a id="WorkerStoreDequeueFuncCall.Args" href="#WorkerStoreDequeueFuncCall.Args">func (c WorkerStoreDequeueFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreDequeueFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreDequeueFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreDequeueFuncCall.Results" href="#WorkerStoreDequeueFuncCall.Results">func (c WorkerStoreDequeueFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreDequeueFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreDequeueFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreDequeueWithIndependentTransactionContextFunc" href="#WorkerStoreDequeueWithIndependentTransactionContextFunc">type WorkerStoreDequeueWithIndependentTransactionContextFunc struct</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFunc
tags: [private]
```

```Go
type WorkerStoreDequeueWithIndependentTransactionContextFunc struct {
	defaultHook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
	hooks       []func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
	history     []WorkerStoreDequeueWithIndependentTransactionContextFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreDequeueWithIndependentTransactionContextFunc describes the behavior when the DequeueWithIndependentTransactionContext method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreDequeueWithIndependentTransactionContextFunc.SetDefaultHook" href="#WorkerStoreDequeueWithIndependentTransactionContextFunc.SetDefaultHook">func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))
```

SetDefaultHook sets function that is called when the DequeueWithIndependentTransactionContext method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreDequeueWithIndependentTransactionContextFunc.PushHook" href="#WorkerStoreDequeueWithIndependentTransactionContextFunc.PushHook">func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DequeueWithIndependentTransactionContext method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreDequeueWithIndependentTransactionContextFunc.SetDefaultReturn" href="#WorkerStoreDequeueWithIndependentTransactionContextFunc.SetDefaultReturn">func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreDequeueWithIndependentTransactionContextFunc.PushReturn" href="#WorkerStoreDequeueWithIndependentTransactionContextFunc.PushReturn">func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreDequeueWithIndependentTransactionContextFunc.nextHook" href="#WorkerStoreDequeueWithIndependentTransactionContextFunc.nextHook">func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
```

#### <a id="WorkerStoreDequeueWithIndependentTransactionContextFunc.appendCall" href="#WorkerStoreDequeueWithIndependentTransactionContextFunc.appendCall">func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) appendCall(r0 WorkerStoreDequeueWithIndependentTransactionContextFuncCall)</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) appendCall(r0 WorkerStoreDequeueWithIndependentTransactionContextFuncCall)
```

#### <a id="WorkerStoreDequeueWithIndependentTransactionContextFunc.History" href="#WorkerStoreDequeueWithIndependentTransactionContextFunc.History">func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) History() []WorkerStoreDequeueWithIndependentTransactionContextFuncCall</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreDequeueWithIndependentTransactionContextFunc) History() []WorkerStoreDequeueWithIndependentTransactionContextFuncCall
```

History returns a sequence of WorkerStoreDequeueWithIndependentTransactionContextFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreDequeueWithIndependentTransactionContextFuncCall" href="#WorkerStoreDequeueWithIndependentTransactionContextFuncCall">type WorkerStoreDequeueWithIndependentTransactionContextFuncCall struct</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFuncCall
tags: [private]
```

```Go
type WorkerStoreDequeueWithIndependentTransactionContextFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []*sqlf.Query
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 workerutil.Record
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 store.Store
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 bool
	// Result3 is the value of the 4th result returned from this method
	// invocation.
	Result3 error
}
```

WorkerStoreDequeueWithIndependentTransactionContextFuncCall is an object that describes an invocation of method DequeueWithIndependentTransactionContext on an instance of MockWorkerStore. 

#### <a id="WorkerStoreDequeueWithIndependentTransactionContextFuncCall.Args" href="#WorkerStoreDequeueWithIndependentTransactionContextFuncCall.Args">func (c WorkerStoreDequeueWithIndependentTransactionContextFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreDequeueWithIndependentTransactionContextFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreDequeueWithIndependentTransactionContextFuncCall.Results" href="#WorkerStoreDequeueWithIndependentTransactionContextFuncCall.Results">func (c WorkerStoreDequeueWithIndependentTransactionContextFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreDequeueWithIndependentTransactionContextFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreDequeueWithIndependentTransactionContextFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreDoneFunc" href="#WorkerStoreDoneFunc">type WorkerStoreDoneFunc struct</a>

```
searchKey: worker.WorkerStoreDoneFunc
tags: [private]
```

```Go
type WorkerStoreDoneFunc struct {
	defaultHook func(error) error
	hooks       []func(error) error
	history     []WorkerStoreDoneFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreDoneFunc describes the behavior when the Done method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreDoneFunc.SetDefaultHook" href="#WorkerStoreDoneFunc.SetDefaultHook">func (f *WorkerStoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: worker.WorkerStoreDoneFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreDoneFunc.PushHook" href="#WorkerStoreDoneFunc.PushHook">func (f *WorkerStoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: worker.WorkerStoreDoneFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreDoneFunc.SetDefaultReturn" href="#WorkerStoreDoneFunc.SetDefaultReturn">func (f *WorkerStoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.WorkerStoreDoneFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreDoneFunc.PushReturn" href="#WorkerStoreDoneFunc.PushReturn">func (f *WorkerStoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: worker.WorkerStoreDoneFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreDoneFunc.nextHook" href="#WorkerStoreDoneFunc.nextHook">func (f *WorkerStoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: worker.WorkerStoreDoneFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreDoneFunc) nextHook() func(error) error
```

#### <a id="WorkerStoreDoneFunc.appendCall" href="#WorkerStoreDoneFunc.appendCall">func (f *WorkerStoreDoneFunc) appendCall(r0 WorkerStoreDoneFuncCall)</a>

```
searchKey: worker.WorkerStoreDoneFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreDoneFunc) appendCall(r0 WorkerStoreDoneFuncCall)
```

#### <a id="WorkerStoreDoneFunc.History" href="#WorkerStoreDoneFunc.History">func (f *WorkerStoreDoneFunc) History() []WorkerStoreDoneFuncCall</a>

```
searchKey: worker.WorkerStoreDoneFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreDoneFunc) History() []WorkerStoreDoneFuncCall
```

History returns a sequence of WorkerStoreDoneFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreDoneFuncCall" href="#WorkerStoreDoneFuncCall">type WorkerStoreDoneFuncCall struct</a>

```
searchKey: worker.WorkerStoreDoneFuncCall
tags: [private]
```

```Go
type WorkerStoreDoneFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 error
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

WorkerStoreDoneFuncCall is an object that describes an invocation of method Done on an instance of MockWorkerStore. 

#### <a id="WorkerStoreDoneFuncCall.Args" href="#WorkerStoreDoneFuncCall.Args">func (c WorkerStoreDoneFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreDoneFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreDoneFuncCall.Results" href="#WorkerStoreDoneFuncCall.Results">func (c WorkerStoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreDoneFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreHandleFunc" href="#WorkerStoreHandleFunc">type WorkerStoreHandleFunc struct</a>

```
searchKey: worker.WorkerStoreHandleFunc
tags: [private]
```

```Go
type WorkerStoreHandleFunc struct {
	defaultHook func() *basestore.TransactableHandle
	hooks       []func() *basestore.TransactableHandle
	history     []WorkerStoreHandleFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreHandleFunc describes the behavior when the Handle method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreHandleFunc.SetDefaultHook" href="#WorkerStoreHandleFunc.SetDefaultHook">func (f *WorkerStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: worker.WorkerStoreHandleFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)
```

SetDefaultHook sets function that is called when the Handle method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreHandleFunc.PushHook" href="#WorkerStoreHandleFunc.PushHook">func (f *WorkerStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: worker.WorkerStoreHandleFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)
```

PushHook adds a function to the end of hook queue. Each invocation of the Handle method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreHandleFunc.SetDefaultReturn" href="#WorkerStoreHandleFunc.SetDefaultReturn">func (f *WorkerStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: worker.WorkerStoreHandleFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreHandleFunc.PushReturn" href="#WorkerStoreHandleFunc.PushReturn">func (f *WorkerStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: worker.WorkerStoreHandleFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreHandleFunc.nextHook" href="#WorkerStoreHandleFunc.nextHook">func (f *WorkerStoreHandleFunc) nextHook() func() *basestore.TransactableHandle</a>

```
searchKey: worker.WorkerStoreHandleFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreHandleFunc) nextHook() func() *basestore.TransactableHandle
```

#### <a id="WorkerStoreHandleFunc.appendCall" href="#WorkerStoreHandleFunc.appendCall">func (f *WorkerStoreHandleFunc) appendCall(r0 WorkerStoreHandleFuncCall)</a>

```
searchKey: worker.WorkerStoreHandleFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreHandleFunc) appendCall(r0 WorkerStoreHandleFuncCall)
```

#### <a id="WorkerStoreHandleFunc.History" href="#WorkerStoreHandleFunc.History">func (f *WorkerStoreHandleFunc) History() []WorkerStoreHandleFuncCall</a>

```
searchKey: worker.WorkerStoreHandleFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreHandleFunc) History() []WorkerStoreHandleFuncCall
```

History returns a sequence of WorkerStoreHandleFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreHandleFuncCall" href="#WorkerStoreHandleFuncCall">type WorkerStoreHandleFuncCall struct</a>

```
searchKey: worker.WorkerStoreHandleFuncCall
tags: [private]
```

```Go
type WorkerStoreHandleFuncCall struct {
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *basestore.TransactableHandle
}
```

WorkerStoreHandleFuncCall is an object that describes an invocation of method Handle on an instance of MockWorkerStore. 

#### <a id="WorkerStoreHandleFuncCall.Args" href="#WorkerStoreHandleFuncCall.Args">func (c WorkerStoreHandleFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreHandleFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreHandleFuncCall.Results" href="#WorkerStoreHandleFuncCall.Results">func (c WorkerStoreHandleFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreHandleFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreMarkCompleteFunc" href="#WorkerStoreMarkCompleteFunc">type WorkerStoreMarkCompleteFunc struct</a>

```
searchKey: worker.WorkerStoreMarkCompleteFunc
tags: [private]
```

```Go
type WorkerStoreMarkCompleteFunc struct {
	defaultHook func(context.Context, int) (bool, error)
	hooks       []func(context.Context, int) (bool, error)
	history     []WorkerStoreMarkCompleteFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreMarkCompleteFunc describes the behavior when the MarkComplete method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreMarkCompleteFunc.SetDefaultHook" href="#WorkerStoreMarkCompleteFunc.SetDefaultHook">func (f *WorkerStoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: worker.WorkerStoreMarkCompleteFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))
```

SetDefaultHook sets function that is called when the MarkComplete method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreMarkCompleteFunc.PushHook" href="#WorkerStoreMarkCompleteFunc.PushHook">func (f *WorkerStoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: worker.WorkerStoreMarkCompleteFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkComplete method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreMarkCompleteFunc.SetDefaultReturn" href="#WorkerStoreMarkCompleteFunc.SetDefaultReturn">func (f *WorkerStoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: worker.WorkerStoreMarkCompleteFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreMarkCompleteFunc.PushReturn" href="#WorkerStoreMarkCompleteFunc.PushReturn">func (f *WorkerStoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: worker.WorkerStoreMarkCompleteFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreMarkCompleteFunc.nextHook" href="#WorkerStoreMarkCompleteFunc.nextHook">func (f *WorkerStoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)</a>

```
searchKey: worker.WorkerStoreMarkCompleteFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)
```

#### <a id="WorkerStoreMarkCompleteFunc.appendCall" href="#WorkerStoreMarkCompleteFunc.appendCall">func (f *WorkerStoreMarkCompleteFunc) appendCall(r0 WorkerStoreMarkCompleteFuncCall)</a>

```
searchKey: worker.WorkerStoreMarkCompleteFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreMarkCompleteFunc) appendCall(r0 WorkerStoreMarkCompleteFuncCall)
```

#### <a id="WorkerStoreMarkCompleteFunc.History" href="#WorkerStoreMarkCompleteFunc.History">func (f *WorkerStoreMarkCompleteFunc) History() []WorkerStoreMarkCompleteFuncCall</a>

```
searchKey: worker.WorkerStoreMarkCompleteFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreMarkCompleteFunc) History() []WorkerStoreMarkCompleteFuncCall
```

History returns a sequence of WorkerStoreMarkCompleteFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreMarkCompleteFuncCall" href="#WorkerStoreMarkCompleteFuncCall">type WorkerStoreMarkCompleteFuncCall struct</a>

```
searchKey: worker.WorkerStoreMarkCompleteFuncCall
tags: [private]
```

```Go
type WorkerStoreMarkCompleteFuncCall struct {
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

WorkerStoreMarkCompleteFuncCall is an object that describes an invocation of method MarkComplete on an instance of MockWorkerStore. 

#### <a id="WorkerStoreMarkCompleteFuncCall.Args" href="#WorkerStoreMarkCompleteFuncCall.Args">func (c WorkerStoreMarkCompleteFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreMarkCompleteFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreMarkCompleteFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreMarkCompleteFuncCall.Results" href="#WorkerStoreMarkCompleteFuncCall.Results">func (c WorkerStoreMarkCompleteFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreMarkCompleteFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreMarkCompleteFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreMarkErroredFunc" href="#WorkerStoreMarkErroredFunc">type WorkerStoreMarkErroredFunc struct</a>

```
searchKey: worker.WorkerStoreMarkErroredFunc
tags: [private]
```

```Go
type WorkerStoreMarkErroredFunc struct {
	defaultHook func(context.Context, int, string) (bool, error)
	hooks       []func(context.Context, int, string) (bool, error)
	history     []WorkerStoreMarkErroredFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreMarkErroredFunc describes the behavior when the MarkErrored method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreMarkErroredFunc.SetDefaultHook" href="#WorkerStoreMarkErroredFunc.SetDefaultHook">func (f *WorkerStoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: worker.WorkerStoreMarkErroredFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the MarkErrored method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreMarkErroredFunc.PushHook" href="#WorkerStoreMarkErroredFunc.PushHook">func (f *WorkerStoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: worker.WorkerStoreMarkErroredFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkErrored method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreMarkErroredFunc.SetDefaultReturn" href="#WorkerStoreMarkErroredFunc.SetDefaultReturn">func (f *WorkerStoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: worker.WorkerStoreMarkErroredFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreMarkErroredFunc.PushReturn" href="#WorkerStoreMarkErroredFunc.PushReturn">func (f *WorkerStoreMarkErroredFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: worker.WorkerStoreMarkErroredFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreMarkErroredFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreMarkErroredFunc.nextHook" href="#WorkerStoreMarkErroredFunc.nextHook">func (f *WorkerStoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: worker.WorkerStoreMarkErroredFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)
```

#### <a id="WorkerStoreMarkErroredFunc.appendCall" href="#WorkerStoreMarkErroredFunc.appendCall">func (f *WorkerStoreMarkErroredFunc) appendCall(r0 WorkerStoreMarkErroredFuncCall)</a>

```
searchKey: worker.WorkerStoreMarkErroredFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreMarkErroredFunc) appendCall(r0 WorkerStoreMarkErroredFuncCall)
```

#### <a id="WorkerStoreMarkErroredFunc.History" href="#WorkerStoreMarkErroredFunc.History">func (f *WorkerStoreMarkErroredFunc) History() []WorkerStoreMarkErroredFuncCall</a>

```
searchKey: worker.WorkerStoreMarkErroredFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreMarkErroredFunc) History() []WorkerStoreMarkErroredFuncCall
```

History returns a sequence of WorkerStoreMarkErroredFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreMarkErroredFuncCall" href="#WorkerStoreMarkErroredFuncCall">type WorkerStoreMarkErroredFuncCall struct</a>

```
searchKey: worker.WorkerStoreMarkErroredFuncCall
tags: [private]
```

```Go
type WorkerStoreMarkErroredFuncCall struct {
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

WorkerStoreMarkErroredFuncCall is an object that describes an invocation of method MarkErrored on an instance of MockWorkerStore. 

#### <a id="WorkerStoreMarkErroredFuncCall.Args" href="#WorkerStoreMarkErroredFuncCall.Args">func (c WorkerStoreMarkErroredFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreMarkErroredFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreMarkErroredFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreMarkErroredFuncCall.Results" href="#WorkerStoreMarkErroredFuncCall.Results">func (c WorkerStoreMarkErroredFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreMarkErroredFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreMarkErroredFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreMarkFailedFunc" href="#WorkerStoreMarkFailedFunc">type WorkerStoreMarkFailedFunc struct</a>

```
searchKey: worker.WorkerStoreMarkFailedFunc
tags: [private]
```

```Go
type WorkerStoreMarkFailedFunc struct {
	defaultHook func(context.Context, int, string) (bool, error)
	hooks       []func(context.Context, int, string) (bool, error)
	history     []WorkerStoreMarkFailedFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreMarkFailedFunc describes the behavior when the MarkFailed method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreMarkFailedFunc.SetDefaultHook" href="#WorkerStoreMarkFailedFunc.SetDefaultHook">func (f *WorkerStoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: worker.WorkerStoreMarkFailedFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the MarkFailed method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreMarkFailedFunc.PushHook" href="#WorkerStoreMarkFailedFunc.PushHook">func (f *WorkerStoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: worker.WorkerStoreMarkFailedFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkFailed method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreMarkFailedFunc.SetDefaultReturn" href="#WorkerStoreMarkFailedFunc.SetDefaultReturn">func (f *WorkerStoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: worker.WorkerStoreMarkFailedFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreMarkFailedFunc.PushReturn" href="#WorkerStoreMarkFailedFunc.PushReturn">func (f *WorkerStoreMarkFailedFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: worker.WorkerStoreMarkFailedFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreMarkFailedFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreMarkFailedFunc.nextHook" href="#WorkerStoreMarkFailedFunc.nextHook">func (f *WorkerStoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: worker.WorkerStoreMarkFailedFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)
```

#### <a id="WorkerStoreMarkFailedFunc.appendCall" href="#WorkerStoreMarkFailedFunc.appendCall">func (f *WorkerStoreMarkFailedFunc) appendCall(r0 WorkerStoreMarkFailedFuncCall)</a>

```
searchKey: worker.WorkerStoreMarkFailedFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreMarkFailedFunc) appendCall(r0 WorkerStoreMarkFailedFuncCall)
```

#### <a id="WorkerStoreMarkFailedFunc.History" href="#WorkerStoreMarkFailedFunc.History">func (f *WorkerStoreMarkFailedFunc) History() []WorkerStoreMarkFailedFuncCall</a>

```
searchKey: worker.WorkerStoreMarkFailedFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreMarkFailedFunc) History() []WorkerStoreMarkFailedFuncCall
```

History returns a sequence of WorkerStoreMarkFailedFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreMarkFailedFuncCall" href="#WorkerStoreMarkFailedFuncCall">type WorkerStoreMarkFailedFuncCall struct</a>

```
searchKey: worker.WorkerStoreMarkFailedFuncCall
tags: [private]
```

```Go
type WorkerStoreMarkFailedFuncCall struct {
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

WorkerStoreMarkFailedFuncCall is an object that describes an invocation of method MarkFailed on an instance of MockWorkerStore. 

#### <a id="WorkerStoreMarkFailedFuncCall.Args" href="#WorkerStoreMarkFailedFuncCall.Args">func (c WorkerStoreMarkFailedFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreMarkFailedFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreMarkFailedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreMarkFailedFuncCall.Results" href="#WorkerStoreMarkFailedFuncCall.Results">func (c WorkerStoreMarkFailedFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreMarkFailedFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreMarkFailedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreQueuedCountFunc" href="#WorkerStoreQueuedCountFunc">type WorkerStoreQueuedCountFunc struct</a>

```
searchKey: worker.WorkerStoreQueuedCountFunc
tags: [private]
```

```Go
type WorkerStoreQueuedCountFunc struct {
	defaultHook func(context.Context, []*sqlf.Query) (int, error)
	hooks       []func(context.Context, []*sqlf.Query) (int, error)
	history     []WorkerStoreQueuedCountFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreQueuedCountFunc describes the behavior when the QueuedCount method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreQueuedCountFunc.SetDefaultHook" href="#WorkerStoreQueuedCountFunc.SetDefaultHook">func (f *WorkerStoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (int, error))</a>

```
searchKey: worker.WorkerStoreQueuedCountFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (int, error))
```

SetDefaultHook sets function that is called when the QueuedCount method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreQueuedCountFunc.PushHook" href="#WorkerStoreQueuedCountFunc.PushHook">func (f *WorkerStoreQueuedCountFunc) PushHook(hook func(context.Context, []*sqlf.Query) (int, error))</a>

```
searchKey: worker.WorkerStoreQueuedCountFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreQueuedCountFunc) PushHook(hook func(context.Context, []*sqlf.Query) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the QueuedCount method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreQueuedCountFunc.SetDefaultReturn" href="#WorkerStoreQueuedCountFunc.SetDefaultReturn">func (f *WorkerStoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: worker.WorkerStoreQueuedCountFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreQueuedCountFunc.PushReturn" href="#WorkerStoreQueuedCountFunc.PushReturn">func (f *WorkerStoreQueuedCountFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: worker.WorkerStoreQueuedCountFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreQueuedCountFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreQueuedCountFunc.nextHook" href="#WorkerStoreQueuedCountFunc.nextHook">func (f *WorkerStoreQueuedCountFunc) nextHook() func(context.Context, []*sqlf.Query) (int, error)</a>

```
searchKey: worker.WorkerStoreQueuedCountFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreQueuedCountFunc) nextHook() func(context.Context, []*sqlf.Query) (int, error)
```

#### <a id="WorkerStoreQueuedCountFunc.appendCall" href="#WorkerStoreQueuedCountFunc.appendCall">func (f *WorkerStoreQueuedCountFunc) appendCall(r0 WorkerStoreQueuedCountFuncCall)</a>

```
searchKey: worker.WorkerStoreQueuedCountFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreQueuedCountFunc) appendCall(r0 WorkerStoreQueuedCountFuncCall)
```

#### <a id="WorkerStoreQueuedCountFunc.History" href="#WorkerStoreQueuedCountFunc.History">func (f *WorkerStoreQueuedCountFunc) History() []WorkerStoreQueuedCountFuncCall</a>

```
searchKey: worker.WorkerStoreQueuedCountFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreQueuedCountFunc) History() []WorkerStoreQueuedCountFuncCall
```

History returns a sequence of WorkerStoreQueuedCountFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreQueuedCountFuncCall" href="#WorkerStoreQueuedCountFuncCall">type WorkerStoreQueuedCountFuncCall struct</a>

```
searchKey: worker.WorkerStoreQueuedCountFuncCall
tags: [private]
```

```Go
type WorkerStoreQueuedCountFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []*sqlf.Query
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

WorkerStoreQueuedCountFuncCall is an object that describes an invocation of method QueuedCount on an instance of MockWorkerStore. 

#### <a id="WorkerStoreQueuedCountFuncCall.Args" href="#WorkerStoreQueuedCountFuncCall.Args">func (c WorkerStoreQueuedCountFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreQueuedCountFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreQueuedCountFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreQueuedCountFuncCall.Results" href="#WorkerStoreQueuedCountFuncCall.Results">func (c WorkerStoreQueuedCountFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreQueuedCountFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreQueuedCountFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreRequeueFunc" href="#WorkerStoreRequeueFunc">type WorkerStoreRequeueFunc struct</a>

```
searchKey: worker.WorkerStoreRequeueFunc
tags: [private]
```

```Go
type WorkerStoreRequeueFunc struct {
	defaultHook func(context.Context, int, time.Time) error
	hooks       []func(context.Context, int, time.Time) error
	history     []WorkerStoreRequeueFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreRequeueFunc describes the behavior when the Requeue method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreRequeueFunc.SetDefaultHook" href="#WorkerStoreRequeueFunc.SetDefaultHook">func (f *WorkerStoreRequeueFunc) SetDefaultHook(hook func(context.Context, int, time.Time) error)</a>

```
searchKey: worker.WorkerStoreRequeueFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreRequeueFunc) SetDefaultHook(hook func(context.Context, int, time.Time) error)
```

SetDefaultHook sets function that is called when the Requeue method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreRequeueFunc.PushHook" href="#WorkerStoreRequeueFunc.PushHook">func (f *WorkerStoreRequeueFunc) PushHook(hook func(context.Context, int, time.Time) error)</a>

```
searchKey: worker.WorkerStoreRequeueFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreRequeueFunc) PushHook(hook func(context.Context, int, time.Time) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Requeue method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreRequeueFunc.SetDefaultReturn" href="#WorkerStoreRequeueFunc.SetDefaultReturn">func (f *WorkerStoreRequeueFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.WorkerStoreRequeueFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreRequeueFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreRequeueFunc.PushReturn" href="#WorkerStoreRequeueFunc.PushReturn">func (f *WorkerStoreRequeueFunc) PushReturn(r0 error)</a>

```
searchKey: worker.WorkerStoreRequeueFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreRequeueFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreRequeueFunc.nextHook" href="#WorkerStoreRequeueFunc.nextHook">func (f *WorkerStoreRequeueFunc) nextHook() func(context.Context, int, time.Time) error</a>

```
searchKey: worker.WorkerStoreRequeueFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreRequeueFunc) nextHook() func(context.Context, int, time.Time) error
```

#### <a id="WorkerStoreRequeueFunc.appendCall" href="#WorkerStoreRequeueFunc.appendCall">func (f *WorkerStoreRequeueFunc) appendCall(r0 WorkerStoreRequeueFuncCall)</a>

```
searchKey: worker.WorkerStoreRequeueFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreRequeueFunc) appendCall(r0 WorkerStoreRequeueFuncCall)
```

#### <a id="WorkerStoreRequeueFunc.History" href="#WorkerStoreRequeueFunc.History">func (f *WorkerStoreRequeueFunc) History() []WorkerStoreRequeueFuncCall</a>

```
searchKey: worker.WorkerStoreRequeueFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreRequeueFunc) History() []WorkerStoreRequeueFuncCall
```

History returns a sequence of WorkerStoreRequeueFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreRequeueFuncCall" href="#WorkerStoreRequeueFuncCall">type WorkerStoreRequeueFuncCall struct</a>

```
searchKey: worker.WorkerStoreRequeueFuncCall
tags: [private]
```

```Go
type WorkerStoreRequeueFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

WorkerStoreRequeueFuncCall is an object that describes an invocation of method Requeue on an instance of MockWorkerStore. 

#### <a id="WorkerStoreRequeueFuncCall.Args" href="#WorkerStoreRequeueFuncCall.Args">func (c WorkerStoreRequeueFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreRequeueFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreRequeueFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreRequeueFuncCall.Results" href="#WorkerStoreRequeueFuncCall.Results">func (c WorkerStoreRequeueFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreRequeueFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreRequeueFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WorkerStoreResetStalledFunc" href="#WorkerStoreResetStalledFunc">type WorkerStoreResetStalledFunc struct</a>

```
searchKey: worker.WorkerStoreResetStalledFunc
tags: [private]
```

```Go
type WorkerStoreResetStalledFunc struct {
	defaultHook func(context.Context) ([]int, []int, error)
	hooks       []func(context.Context) ([]int, []int, error)
	history     []WorkerStoreResetStalledFuncCall
	mutex       sync.Mutex
}
```

WorkerStoreResetStalledFunc describes the behavior when the ResetStalled method of the parent MockWorkerStore instance is invoked. 

#### <a id="WorkerStoreResetStalledFunc.SetDefaultHook" href="#WorkerStoreResetStalledFunc.SetDefaultHook">func (f *WorkerStoreResetStalledFunc) SetDefaultHook(hook func(context.Context) ([]int, []int, error))</a>

```
searchKey: worker.WorkerStoreResetStalledFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *WorkerStoreResetStalledFunc) SetDefaultHook(hook func(context.Context) ([]int, []int, error))
```

SetDefaultHook sets function that is called when the ResetStalled method of the parent MockWorkerStore instance is invoked and the hook queue is empty. 

#### <a id="WorkerStoreResetStalledFunc.PushHook" href="#WorkerStoreResetStalledFunc.PushHook">func (f *WorkerStoreResetStalledFunc) PushHook(hook func(context.Context) ([]int, []int, error))</a>

```
searchKey: worker.WorkerStoreResetStalledFunc.PushHook
tags: [private]
```

```Go
func (f *WorkerStoreResetStalledFunc) PushHook(hook func(context.Context) ([]int, []int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ResetStalled method of the parent MockWorkerStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WorkerStoreResetStalledFunc.SetDefaultReturn" href="#WorkerStoreResetStalledFunc.SetDefaultReturn">func (f *WorkerStoreResetStalledFunc) SetDefaultReturn(r0 []int, r1 []int, r2 error)</a>

```
searchKey: worker.WorkerStoreResetStalledFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *WorkerStoreResetStalledFunc) SetDefaultReturn(r0 []int, r1 []int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreResetStalledFunc.PushReturn" href="#WorkerStoreResetStalledFunc.PushReturn">func (f *WorkerStoreResetStalledFunc) PushReturn(r0 []int, r1 []int, r2 error)</a>

```
searchKey: worker.WorkerStoreResetStalledFunc.PushReturn
tags: [private]
```

```Go
func (f *WorkerStoreResetStalledFunc) PushReturn(r0 []int, r1 []int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WorkerStoreResetStalledFunc.nextHook" href="#WorkerStoreResetStalledFunc.nextHook">func (f *WorkerStoreResetStalledFunc) nextHook() func(context.Context) ([]int, []int, error)</a>

```
searchKey: worker.WorkerStoreResetStalledFunc.nextHook
tags: [private]
```

```Go
func (f *WorkerStoreResetStalledFunc) nextHook() func(context.Context) ([]int, []int, error)
```

#### <a id="WorkerStoreResetStalledFunc.appendCall" href="#WorkerStoreResetStalledFunc.appendCall">func (f *WorkerStoreResetStalledFunc) appendCall(r0 WorkerStoreResetStalledFuncCall)</a>

```
searchKey: worker.WorkerStoreResetStalledFunc.appendCall
tags: [private]
```

```Go
func (f *WorkerStoreResetStalledFunc) appendCall(r0 WorkerStoreResetStalledFuncCall)
```

#### <a id="WorkerStoreResetStalledFunc.History" href="#WorkerStoreResetStalledFunc.History">func (f *WorkerStoreResetStalledFunc) History() []WorkerStoreResetStalledFuncCall</a>

```
searchKey: worker.WorkerStoreResetStalledFunc.History
tags: [private]
```

```Go
func (f *WorkerStoreResetStalledFunc) History() []WorkerStoreResetStalledFuncCall
```

History returns a sequence of WorkerStoreResetStalledFuncCall objects describing the invocations of this function. 

### <a id="WorkerStoreResetStalledFuncCall" href="#WorkerStoreResetStalledFuncCall">type WorkerStoreResetStalledFuncCall struct</a>

```
searchKey: worker.WorkerStoreResetStalledFuncCall
tags: [private]
```

```Go
type WorkerStoreResetStalledFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 []int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

WorkerStoreResetStalledFuncCall is an object that describes an invocation of method ResetStalled on an instance of MockWorkerStore. 

#### <a id="WorkerStoreResetStalledFuncCall.Args" href="#WorkerStoreResetStalledFuncCall.Args">func (c WorkerStoreResetStalledFuncCall) Args() []interface{}</a>

```
searchKey: worker.WorkerStoreResetStalledFuncCall.Args
tags: [private]
```

```Go
func (c WorkerStoreResetStalledFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WorkerStoreResetStalledFuncCall.Results" href="#WorkerStoreResetStalledFuncCall.Results">func (c WorkerStoreResetStalledFuncCall) Results() []interface{}</a>

```
searchKey: worker.WorkerStoreResetStalledFuncCall.Results
tags: [private]
```

```Go
func (c WorkerStoreResetStalledFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="inTransaction" href="#inTransaction">func inTransaction(ctx context.Context, dbStore DBStore, fn func(tx DBStore) error) (err error)</a>

```
searchKey: worker.inTransaction
tags: [private]
```

```Go
func inTransaction(ctx context.Context, dbStore DBStore, fn func(tx DBStore) error) (err error)
```

### <a id="requeueIfCloning" href="#requeueIfCloning">func requeueIfCloning(ctx context.Context, workerStore dbworkerstore.Store, upload store.Upload) (requeued bool, _ error)</a>

```
searchKey: worker.requeueIfCloning
tags: [private]
```

```Go
func requeueIfCloning(ctx context.Context, workerStore dbworkerstore.Store, upload store.Upload) (requeued bool, _ error)
```

requeueIfCloning ensures that the repo and revision are resolvable. If the repo does not exist, or if the repo has finished cloning and the revision does not exist, then the upload will fail to process. If the repo is currently cloning, then we'll requeue the upload to be tried again later. This will not increase the reset count of the record (so this doesn't count against the upload as a legitimate attempt). 

### <a id="withUploadData" href="#withUploadData">func withUploadData(ctx context.Context, uploadStore uploadstore.Store, id int, fn func(r io.Reader) error) error</a>

```
searchKey: worker.withUploadData
tags: [private]
```

```Go
func withUploadData(ctx context.Context, uploadStore uploadstore.Store, id int, fn func(r io.Reader) error) error
```

withUploadData will invoke the given function with a reader of the upload's raw data. The consumer should expect raw newline-delimited JSON content. If the function returns without an error, the upload file will be deleted. 

### <a id="writeData" href="#writeData">func writeData(ctx context.Context, lsifStore LSIFStore, id int, groupedBundleData *semantic.GroupedBundleDataChans) (err error)</a>

```
searchKey: worker.writeData
tags: [private]
```

```Go
func writeData(ctx context.Context, lsifStore LSIFStore, id int, groupedBundleData *semantic.GroupedBundleDataChans) (err error)
```

writeData transactionally writes the given grouped bundle data into the given LSIF store. 

### <a id="isUniqueConstraintViolation" href="#isUniqueConstraintViolation">func isUniqueConstraintViolation(err error) bool</a>

```
searchKey: worker.isUniqueConstraintViolation
tags: [private]
```

```Go
func isUniqueConstraintViolation(err error) bool
```

### <a id="createHoneyEvent" href="#createHoneyEvent">func createHoneyEvent(ctx context.Context, upload store.Upload, err error, duration time.Duration) *libhoney.Event</a>

```
searchKey: worker.createHoneyEvent
tags: [private]
```

```Go
func createHoneyEvent(ctx context.Context, upload store.Upload, err error, duration time.Duration) *libhoney.Event
```

### <a id="NewWorker" href="#NewWorker">func NewWorker(dbStore DBStore,...</a>

```
searchKey: worker.NewWorker
```

```Go
func NewWorker(
	dbStore DBStore,
	workerStore dbworkerstore.Store,
	lsifStore LSIFStore,
	uploadStore uploadstore.Store,
	gitserverClient GitserverClient,
	pollInterval time.Duration,
	numProcessorRoutines int,
	budgetMax int64,
	workerMetrics workerutil.WorkerMetrics,
) *workerutil.Worker
```

### <a id="TestHandle" href="#TestHandle">func TestHandle(t *testing.T)</a>

```
searchKey: worker.TestHandle
tags: [private]
```

```Go
func TestHandle(t *testing.T)
```

### <a id="TestHandleError" href="#TestHandleError">func TestHandleError(t *testing.T)</a>

```
searchKey: worker.TestHandleError
tags: [private]
```

```Go
func TestHandleError(t *testing.T)
```

### <a id="TestHandleCloneInProgress" href="#TestHandleCloneInProgress">func TestHandleCloneInProgress(t *testing.T)</a>

```
searchKey: worker.TestHandleCloneInProgress
tags: [private]
```

```Go
func TestHandleCloneInProgress(t *testing.T)
```

### <a id="copyTestDump" href="#copyTestDump">func copyTestDump(ctx context.Context, key string) (io.ReadCloser, error)</a>

```
searchKey: worker.copyTestDump
tags: [private]
```

```Go
func copyTestDump(ctx context.Context, key string) (io.ReadCloser, error)
```

### <a id="setupRepoMocks" href="#setupRepoMocks">func setupRepoMocks(t *testing.T)</a>

```
searchKey: worker.setupRepoMocks
tags: [private]
```

```Go
func setupRepoMocks(t *testing.T)
```

