# Package janitor

## Index

* [Constants](#const)
    * [const uploadsBatchSize](#uploadsBatchSize)
* [Variables](#var)
    * [var NewMetrics](#NewMetrics)
    * [var testSourcedCommits](#testSourcedCommits)
* [Types](#type)
    * [type abandonedUploadJanitor struct](#abandonedUploadJanitor)
        * [func (h *abandonedUploadJanitor) Handle(ctx context.Context) error](#abandonedUploadJanitor.Handle)
        * [func (h *abandonedUploadJanitor) HandleError(err error)](#abandonedUploadJanitor.HandleError)
    * [type deletedRepositoryJanitor struct](#deletedRepositoryJanitor)
        * [func (j *deletedRepositoryJanitor) Handle(ctx context.Context) (err error)](#deletedRepositoryJanitor.Handle)
        * [func (j *deletedRepositoryJanitor) HandleError(err error)](#deletedRepositoryJanitor.HandleError)
    * [type recordCount struct](#recordCount)
    * [type hardDeleter struct](#hardDeleter)
        * [func (d *hardDeleter) Handle(ctx context.Context) error](#hardDeleter.Handle)
        * [func (d *hardDeleter) HandleError(err error)](#hardDeleter.HandleError)
        * [func (d *hardDeleter) deleteBatch(ctx context.Context, ids []int) (err error)](#hardDeleter.deleteBatch)
    * [type DBStore interface](#DBStore)
    * [type DBStoreShim struct](#DBStoreShim)
        * [func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)](#DBStoreShim.Transact)
    * [type LSIFStore interface](#LSIFStore)
    * [type MockDBStore struct](#MockDBStore)
        * [func NewMockDBStore() *MockDBStore](#NewMockDBStore)
        * [func NewMockDBStoreFrom(i DBStore) *MockDBStore](#NewMockDBStoreFrom)
        * [func (m *MockDBStore) DeleteIndexesWithoutRepository(v0 context.Context, v1 time.Time) (map[int]int, error)](#MockDBStore.DeleteIndexesWithoutRepository)
        * [func (m *MockDBStore) DeleteOldIndexes(v0 context.Context, v1 time.Duration, v2 time.Time) (int, error)](#MockDBStore.DeleteOldIndexes)
        * [func (m *MockDBStore) DeleteUploadsStuckUploading(v0 context.Context, v1 time.Time) (int, error)](#MockDBStore.DeleteUploadsStuckUploading)
        * [func (m *MockDBStore) DeleteUploadsWithoutRepository(v0 context.Context, v1 time.Time) (map[int]int, error)](#MockDBStore.DeleteUploadsWithoutRepository)
        * [func (m *MockDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)](#MockDBStore.DirtyRepositories)
        * [func (m *MockDBStore) Done(v0 error) error](#MockDBStore.Done)
        * [func (m *MockDBStore) GetUploads(v0 context.Context, v1 dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)](#MockDBStore.GetUploads)
        * [func (m *MockDBStore) Handle() *basestore.TransactableHandle](#MockDBStore.Handle)
        * [func (m *MockDBStore) HardDeleteUploadByID(v0 context.Context, v1 ...int) error](#MockDBStore.HardDeleteUploadByID)
        * [func (m *MockDBStore) RefreshCommitResolvability(v0 context.Context, v1 int, v2 string, v3 bool, v4 time.Time) (int, int, error)](#MockDBStore.RefreshCommitResolvability)
        * [func (m *MockDBStore) SoftDeleteOldUploads(v0 context.Context, v1 time.Duration, v2 time.Time) (int, error)](#MockDBStore.SoftDeleteOldUploads)
        * [func (m *MockDBStore) StaleSourcedCommits(v0 context.Context, v1 time.Duration, v2 int, v3 time.Time) ([]dbstore.SourcedCommits, error)](#MockDBStore.StaleSourcedCommits)
        * [func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)](#MockDBStore.Transact)
    * [type DBStoreDeleteIndexesWithoutRepositoryFunc struct](#DBStoreDeleteIndexesWithoutRepositoryFunc)
        * [func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) SetDefaultHook(hook func(context.Context, time.Time) (map[int]int, error))](#DBStoreDeleteIndexesWithoutRepositoryFunc.SetDefaultHook)
        * [func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) PushHook(hook func(context.Context, time.Time) (map[int]int, error))](#DBStoreDeleteIndexesWithoutRepositoryFunc.PushHook)
        * [func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) SetDefaultReturn(r0 map[int]int, r1 error)](#DBStoreDeleteIndexesWithoutRepositoryFunc.SetDefaultReturn)
        * [func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) PushReturn(r0 map[int]int, r1 error)](#DBStoreDeleteIndexesWithoutRepositoryFunc.PushReturn)
        * [func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) nextHook() func(context.Context, time.Time) (map[int]int, error)](#DBStoreDeleteIndexesWithoutRepositoryFunc.nextHook)
        * [func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) appendCall(r0 DBStoreDeleteIndexesWithoutRepositoryFuncCall)](#DBStoreDeleteIndexesWithoutRepositoryFunc.appendCall)
        * [func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) History() []DBStoreDeleteIndexesWithoutRepositoryFuncCall](#DBStoreDeleteIndexesWithoutRepositoryFunc.History)
    * [type DBStoreDeleteIndexesWithoutRepositoryFuncCall struct](#DBStoreDeleteIndexesWithoutRepositoryFuncCall)
        * [func (c DBStoreDeleteIndexesWithoutRepositoryFuncCall) Args() []interface{}](#DBStoreDeleteIndexesWithoutRepositoryFuncCall.Args)
        * [func (c DBStoreDeleteIndexesWithoutRepositoryFuncCall) Results() []interface{}](#DBStoreDeleteIndexesWithoutRepositoryFuncCall.Results)
    * [type DBStoreDeleteOldIndexesFunc struct](#DBStoreDeleteOldIndexesFunc)
        * [func (f *DBStoreDeleteOldIndexesFunc) SetDefaultHook(hook func(context.Context, time.Duration, time.Time) (int, error))](#DBStoreDeleteOldIndexesFunc.SetDefaultHook)
        * [func (f *DBStoreDeleteOldIndexesFunc) PushHook(hook func(context.Context, time.Duration, time.Time) (int, error))](#DBStoreDeleteOldIndexesFunc.PushHook)
        * [func (f *DBStoreDeleteOldIndexesFunc) SetDefaultReturn(r0 int, r1 error)](#DBStoreDeleteOldIndexesFunc.SetDefaultReturn)
        * [func (f *DBStoreDeleteOldIndexesFunc) PushReturn(r0 int, r1 error)](#DBStoreDeleteOldIndexesFunc.PushReturn)
        * [func (f *DBStoreDeleteOldIndexesFunc) nextHook() func(context.Context, time.Duration, time.Time) (int, error)](#DBStoreDeleteOldIndexesFunc.nextHook)
        * [func (f *DBStoreDeleteOldIndexesFunc) appendCall(r0 DBStoreDeleteOldIndexesFuncCall)](#DBStoreDeleteOldIndexesFunc.appendCall)
        * [func (f *DBStoreDeleteOldIndexesFunc) History() []DBStoreDeleteOldIndexesFuncCall](#DBStoreDeleteOldIndexesFunc.History)
    * [type DBStoreDeleteOldIndexesFuncCall struct](#DBStoreDeleteOldIndexesFuncCall)
        * [func (c DBStoreDeleteOldIndexesFuncCall) Args() []interface{}](#DBStoreDeleteOldIndexesFuncCall.Args)
        * [func (c DBStoreDeleteOldIndexesFuncCall) Results() []interface{}](#DBStoreDeleteOldIndexesFuncCall.Results)
    * [type DBStoreDeleteUploadsStuckUploadingFunc struct](#DBStoreDeleteUploadsStuckUploadingFunc)
        * [func (f *DBStoreDeleteUploadsStuckUploadingFunc) SetDefaultHook(hook func(context.Context, time.Time) (int, error))](#DBStoreDeleteUploadsStuckUploadingFunc.SetDefaultHook)
        * [func (f *DBStoreDeleteUploadsStuckUploadingFunc) PushHook(hook func(context.Context, time.Time) (int, error))](#DBStoreDeleteUploadsStuckUploadingFunc.PushHook)
        * [func (f *DBStoreDeleteUploadsStuckUploadingFunc) SetDefaultReturn(r0 int, r1 error)](#DBStoreDeleteUploadsStuckUploadingFunc.SetDefaultReturn)
        * [func (f *DBStoreDeleteUploadsStuckUploadingFunc) PushReturn(r0 int, r1 error)](#DBStoreDeleteUploadsStuckUploadingFunc.PushReturn)
        * [func (f *DBStoreDeleteUploadsStuckUploadingFunc) nextHook() func(context.Context, time.Time) (int, error)](#DBStoreDeleteUploadsStuckUploadingFunc.nextHook)
        * [func (f *DBStoreDeleteUploadsStuckUploadingFunc) appendCall(r0 DBStoreDeleteUploadsStuckUploadingFuncCall)](#DBStoreDeleteUploadsStuckUploadingFunc.appendCall)
        * [func (f *DBStoreDeleteUploadsStuckUploadingFunc) History() []DBStoreDeleteUploadsStuckUploadingFuncCall](#DBStoreDeleteUploadsStuckUploadingFunc.History)
    * [type DBStoreDeleteUploadsStuckUploadingFuncCall struct](#DBStoreDeleteUploadsStuckUploadingFuncCall)
        * [func (c DBStoreDeleteUploadsStuckUploadingFuncCall) Args() []interface{}](#DBStoreDeleteUploadsStuckUploadingFuncCall.Args)
        * [func (c DBStoreDeleteUploadsStuckUploadingFuncCall) Results() []interface{}](#DBStoreDeleteUploadsStuckUploadingFuncCall.Results)
    * [type DBStoreDeleteUploadsWithoutRepositoryFunc struct](#DBStoreDeleteUploadsWithoutRepositoryFunc)
        * [func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) SetDefaultHook(hook func(context.Context, time.Time) (map[int]int, error))](#DBStoreDeleteUploadsWithoutRepositoryFunc.SetDefaultHook)
        * [func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) PushHook(hook func(context.Context, time.Time) (map[int]int, error))](#DBStoreDeleteUploadsWithoutRepositoryFunc.PushHook)
        * [func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) SetDefaultReturn(r0 map[int]int, r1 error)](#DBStoreDeleteUploadsWithoutRepositoryFunc.SetDefaultReturn)
        * [func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) PushReturn(r0 map[int]int, r1 error)](#DBStoreDeleteUploadsWithoutRepositoryFunc.PushReturn)
        * [func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) nextHook() func(context.Context, time.Time) (map[int]int, error)](#DBStoreDeleteUploadsWithoutRepositoryFunc.nextHook)
        * [func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) appendCall(r0 DBStoreDeleteUploadsWithoutRepositoryFuncCall)](#DBStoreDeleteUploadsWithoutRepositoryFunc.appendCall)
        * [func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) History() []DBStoreDeleteUploadsWithoutRepositoryFuncCall](#DBStoreDeleteUploadsWithoutRepositoryFunc.History)
    * [type DBStoreDeleteUploadsWithoutRepositoryFuncCall struct](#DBStoreDeleteUploadsWithoutRepositoryFuncCall)
        * [func (c DBStoreDeleteUploadsWithoutRepositoryFuncCall) Args() []interface{}](#DBStoreDeleteUploadsWithoutRepositoryFuncCall.Args)
        * [func (c DBStoreDeleteUploadsWithoutRepositoryFuncCall) Results() []interface{}](#DBStoreDeleteUploadsWithoutRepositoryFuncCall.Results)
    * [type DBStoreDirtyRepositoriesFunc struct](#DBStoreDirtyRepositoriesFunc)
        * [func (f *DBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))](#DBStoreDirtyRepositoriesFunc.SetDefaultHook)
        * [func (f *DBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))](#DBStoreDirtyRepositoriesFunc.PushHook)
        * [func (f *DBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)](#DBStoreDirtyRepositoriesFunc.SetDefaultReturn)
        * [func (f *DBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)](#DBStoreDirtyRepositoriesFunc.PushReturn)
        * [func (f *DBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)](#DBStoreDirtyRepositoriesFunc.nextHook)
        * [func (f *DBStoreDirtyRepositoriesFunc) appendCall(r0 DBStoreDirtyRepositoriesFuncCall)](#DBStoreDirtyRepositoriesFunc.appendCall)
        * [func (f *DBStoreDirtyRepositoriesFunc) History() []DBStoreDirtyRepositoriesFuncCall](#DBStoreDirtyRepositoriesFunc.History)
    * [type DBStoreDirtyRepositoriesFuncCall struct](#DBStoreDirtyRepositoriesFuncCall)
        * [func (c DBStoreDirtyRepositoriesFuncCall) Args() []interface{}](#DBStoreDirtyRepositoriesFuncCall.Args)
        * [func (c DBStoreDirtyRepositoriesFuncCall) Results() []interface{}](#DBStoreDirtyRepositoriesFuncCall.Results)
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
    * [type DBStoreHardDeleteUploadByIDFunc struct](#DBStoreHardDeleteUploadByIDFunc)
        * [func (f *DBStoreHardDeleteUploadByIDFunc) SetDefaultHook(hook func(context.Context, ...int) error)](#DBStoreHardDeleteUploadByIDFunc.SetDefaultHook)
        * [func (f *DBStoreHardDeleteUploadByIDFunc) PushHook(hook func(context.Context, ...int) error)](#DBStoreHardDeleteUploadByIDFunc.PushHook)
        * [func (f *DBStoreHardDeleteUploadByIDFunc) SetDefaultReturn(r0 error)](#DBStoreHardDeleteUploadByIDFunc.SetDefaultReturn)
        * [func (f *DBStoreHardDeleteUploadByIDFunc) PushReturn(r0 error)](#DBStoreHardDeleteUploadByIDFunc.PushReturn)
        * [func (f *DBStoreHardDeleteUploadByIDFunc) nextHook() func(context.Context, ...int) error](#DBStoreHardDeleteUploadByIDFunc.nextHook)
        * [func (f *DBStoreHardDeleteUploadByIDFunc) appendCall(r0 DBStoreHardDeleteUploadByIDFuncCall)](#DBStoreHardDeleteUploadByIDFunc.appendCall)
        * [func (f *DBStoreHardDeleteUploadByIDFunc) History() []DBStoreHardDeleteUploadByIDFuncCall](#DBStoreHardDeleteUploadByIDFunc.History)
    * [type DBStoreHardDeleteUploadByIDFuncCall struct](#DBStoreHardDeleteUploadByIDFuncCall)
        * [func (c DBStoreHardDeleteUploadByIDFuncCall) Args() []interface{}](#DBStoreHardDeleteUploadByIDFuncCall.Args)
        * [func (c DBStoreHardDeleteUploadByIDFuncCall) Results() []interface{}](#DBStoreHardDeleteUploadByIDFuncCall.Results)
    * [type DBStoreRefreshCommitResolvabilityFunc struct](#DBStoreRefreshCommitResolvabilityFunc)
        * [func (f *DBStoreRefreshCommitResolvabilityFunc) SetDefaultHook(hook func(context.Context, int, string, bool, time.Time) (int, int, error))](#DBStoreRefreshCommitResolvabilityFunc.SetDefaultHook)
        * [func (f *DBStoreRefreshCommitResolvabilityFunc) PushHook(hook func(context.Context, int, string, bool, time.Time) (int, int, error))](#DBStoreRefreshCommitResolvabilityFunc.PushHook)
        * [func (f *DBStoreRefreshCommitResolvabilityFunc) SetDefaultReturn(r0 int, r1 int, r2 error)](#DBStoreRefreshCommitResolvabilityFunc.SetDefaultReturn)
        * [func (f *DBStoreRefreshCommitResolvabilityFunc) PushReturn(r0 int, r1 int, r2 error)](#DBStoreRefreshCommitResolvabilityFunc.PushReturn)
        * [func (f *DBStoreRefreshCommitResolvabilityFunc) nextHook() func(context.Context, int, string, bool, time.Time) (int, int, error)](#DBStoreRefreshCommitResolvabilityFunc.nextHook)
        * [func (f *DBStoreRefreshCommitResolvabilityFunc) appendCall(r0 DBStoreRefreshCommitResolvabilityFuncCall)](#DBStoreRefreshCommitResolvabilityFunc.appendCall)
        * [func (f *DBStoreRefreshCommitResolvabilityFunc) History() []DBStoreRefreshCommitResolvabilityFuncCall](#DBStoreRefreshCommitResolvabilityFunc.History)
    * [type DBStoreRefreshCommitResolvabilityFuncCall struct](#DBStoreRefreshCommitResolvabilityFuncCall)
        * [func (c DBStoreRefreshCommitResolvabilityFuncCall) Args() []interface{}](#DBStoreRefreshCommitResolvabilityFuncCall.Args)
        * [func (c DBStoreRefreshCommitResolvabilityFuncCall) Results() []interface{}](#DBStoreRefreshCommitResolvabilityFuncCall.Results)
    * [type DBStoreSoftDeleteOldUploadsFunc struct](#DBStoreSoftDeleteOldUploadsFunc)
        * [func (f *DBStoreSoftDeleteOldUploadsFunc) SetDefaultHook(hook func(context.Context, time.Duration, time.Time) (int, error))](#DBStoreSoftDeleteOldUploadsFunc.SetDefaultHook)
        * [func (f *DBStoreSoftDeleteOldUploadsFunc) PushHook(hook func(context.Context, time.Duration, time.Time) (int, error))](#DBStoreSoftDeleteOldUploadsFunc.PushHook)
        * [func (f *DBStoreSoftDeleteOldUploadsFunc) SetDefaultReturn(r0 int, r1 error)](#DBStoreSoftDeleteOldUploadsFunc.SetDefaultReturn)
        * [func (f *DBStoreSoftDeleteOldUploadsFunc) PushReturn(r0 int, r1 error)](#DBStoreSoftDeleteOldUploadsFunc.PushReturn)
        * [func (f *DBStoreSoftDeleteOldUploadsFunc) nextHook() func(context.Context, time.Duration, time.Time) (int, error)](#DBStoreSoftDeleteOldUploadsFunc.nextHook)
        * [func (f *DBStoreSoftDeleteOldUploadsFunc) appendCall(r0 DBStoreSoftDeleteOldUploadsFuncCall)](#DBStoreSoftDeleteOldUploadsFunc.appendCall)
        * [func (f *DBStoreSoftDeleteOldUploadsFunc) History() []DBStoreSoftDeleteOldUploadsFuncCall](#DBStoreSoftDeleteOldUploadsFunc.History)
    * [type DBStoreSoftDeleteOldUploadsFuncCall struct](#DBStoreSoftDeleteOldUploadsFuncCall)
        * [func (c DBStoreSoftDeleteOldUploadsFuncCall) Args() []interface{}](#DBStoreSoftDeleteOldUploadsFuncCall.Args)
        * [func (c DBStoreSoftDeleteOldUploadsFuncCall) Results() []interface{}](#DBStoreSoftDeleteOldUploadsFuncCall.Results)
    * [type DBStoreStaleSourcedCommitsFunc struct](#DBStoreStaleSourcedCommitsFunc)
        * [func (f *DBStoreStaleSourcedCommitsFunc) SetDefaultHook(hook func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error))](#DBStoreStaleSourcedCommitsFunc.SetDefaultHook)
        * [func (f *DBStoreStaleSourcedCommitsFunc) PushHook(hook func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error))](#DBStoreStaleSourcedCommitsFunc.PushHook)
        * [func (f *DBStoreStaleSourcedCommitsFunc) SetDefaultReturn(r0 []dbstore.SourcedCommits, r1 error)](#DBStoreStaleSourcedCommitsFunc.SetDefaultReturn)
        * [func (f *DBStoreStaleSourcedCommitsFunc) PushReturn(r0 []dbstore.SourcedCommits, r1 error)](#DBStoreStaleSourcedCommitsFunc.PushReturn)
        * [func (f *DBStoreStaleSourcedCommitsFunc) nextHook() func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error)](#DBStoreStaleSourcedCommitsFunc.nextHook)
        * [func (f *DBStoreStaleSourcedCommitsFunc) appendCall(r0 DBStoreStaleSourcedCommitsFuncCall)](#DBStoreStaleSourcedCommitsFunc.appendCall)
        * [func (f *DBStoreStaleSourcedCommitsFunc) History() []DBStoreStaleSourcedCommitsFuncCall](#DBStoreStaleSourcedCommitsFunc.History)
    * [type DBStoreStaleSourcedCommitsFuncCall struct](#DBStoreStaleSourcedCommitsFuncCall)
        * [func (c DBStoreStaleSourcedCommitsFuncCall) Args() []interface{}](#DBStoreStaleSourcedCommitsFuncCall.Args)
        * [func (c DBStoreStaleSourcedCommitsFuncCall) Results() []interface{}](#DBStoreStaleSourcedCommitsFuncCall.Results)
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
    * [type MockLSIFStore struct](#MockLSIFStore)
        * [func NewMockLSIFStore() *MockLSIFStore](#NewMockLSIFStore)
        * [func NewMockLSIFStoreFrom(i LSIFStore) *MockLSIFStore](#NewMockLSIFStoreFrom)
        * [func (m *MockLSIFStore) Clear(v0 context.Context, v1 ...int) error](#MockLSIFStore.Clear)
    * [type LSIFStoreClearFunc struct](#LSIFStoreClearFunc)
        * [func (f *LSIFStoreClearFunc) SetDefaultHook(hook func(context.Context, ...int) error)](#LSIFStoreClearFunc.SetDefaultHook)
        * [func (f *LSIFStoreClearFunc) PushHook(hook func(context.Context, ...int) error)](#LSIFStoreClearFunc.PushHook)
        * [func (f *LSIFStoreClearFunc) SetDefaultReturn(r0 error)](#LSIFStoreClearFunc.SetDefaultReturn)
        * [func (f *LSIFStoreClearFunc) PushReturn(r0 error)](#LSIFStoreClearFunc.PushReturn)
        * [func (f *LSIFStoreClearFunc) nextHook() func(context.Context, ...int) error](#LSIFStoreClearFunc.nextHook)
        * [func (f *LSIFStoreClearFunc) appendCall(r0 LSIFStoreClearFuncCall)](#LSIFStoreClearFunc.appendCall)
        * [func (f *LSIFStoreClearFunc) History() []LSIFStoreClearFuncCall](#LSIFStoreClearFunc.History)
    * [type LSIFStoreClearFuncCall struct](#LSIFStoreClearFuncCall)
        * [func (c LSIFStoreClearFuncCall) Args() []interface{}](#LSIFStoreClearFuncCall.Args)
        * [func (c LSIFStoreClearFuncCall) Results() []interface{}](#LSIFStoreClearFuncCall.Results)
    * [type metrics struct](#metrics)
        * [func newMetrics(observationContext *observation.Context) *metrics](#newMetrics)
    * [type recordExpirer struct](#recordExpirer)
        * [func (e *recordExpirer) Handle(ctx context.Context) error](#recordExpirer.Handle)
        * [func (e *recordExpirer) HandleError(err error)](#recordExpirer.HandleError)
    * [type unknownCommitJanitor struct](#unknownCommitJanitor)
        * [func newJanitor(dbStore DBStore,...](#newJanitor)
        * [func (j *unknownCommitJanitor) Handle(ctx context.Context) (err error)](#unknownCommitJanitor.Handle)
        * [func (j *unknownCommitJanitor) HandleError(err error)](#unknownCommitJanitor.HandleError)
        * [func (j *unknownCommitJanitor) handleSourcedCommits(ctx context.Context, tx DBStore, sourcedCommits dbstore.SourcedCommits) error](#unknownCommitJanitor.handleSourcedCommits)
        * [func (j *unknownCommitJanitor) handleCommit(ctx context.Context, tx DBStore, repositoryID int, repositoryName, commit string) error](#unknownCommitJanitor.handleCommit)
    * [type refreshCommitResolvabilityFuncInvocation struct](#refreshCommitResolvabilityFuncInvocation)
* [Functions](#func)
    * [func NewAbandonedUploadJanitor(dbStore DBStore, ttl, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine](#NewAbandonedUploadJanitor)
    * [func NewDeletedRepositoryJanitor(dbStore DBStore, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine](#NewDeletedRepositoryJanitor)
    * [func gatherCounts(uploadsCounts, indexesCounts map[int]int) []recordCount](#gatherCounts)
    * [func NewHardDeleter(dbStore DBStore, lsifStore LSIFStore, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine](#NewHardDeleter)
    * [func uploadIDs(uploads []store.Upload) []int](#uploadIDs)
    * [func NewRecordExpirer(dbStore DBStore, ttl, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine](#NewRecordExpirer)
    * [func NewUploadResetter(s dbworkerstore.Store, interval time.Duration, metrics *metrics, observationContext *observation.Context) *dbworker.Resetter](#NewUploadResetter)
    * [func NewIndexResetter(s dbworkerstore.Store, interval time.Duration, metrics *metrics, observationContext *observation.Context) *dbworker.Resetter](#NewIndexResetter)
    * [func NewUnknownCommitJanitor(dbStore DBStore,...](#NewUnknownCommitJanitor)
    * [func isRepositoryNotFound(err error) bool](#isRepositoryNotFound)
    * [func isRevisionNotFound(err error) bool](#isRevisionNotFound)
    * [func TestUnknownCommitsJanitor(t *testing.T)](#TestUnknownCommitsJanitor)
    * [func TestUnknownCommitsJanitorUnknownCommit(t *testing.T)](#TestUnknownCommitsJanitorUnknownCommit)
    * [func TestUnknownCommitsJanitorUnknownRepository(t *testing.T)](#TestUnknownCommitsJanitorUnknownRepository)
    * [func testUnknownCommitsJanitor(t *testing.T, resolveRevisionFunc func(commit string) error, expectedCalls []refreshCommitResolvabilityFuncInvocation)](#testUnknownCommitsJanitor)


## <a id="const" href="#const">Constants</a>

### <a id="uploadsBatchSize" href="#uploadsBatchSize">const uploadsBatchSize</a>

```
searchKey: janitor.uploadsBatchSize
```

```Go
const uploadsBatchSize = 100
```

## <a id="var" href="#var">Variables</a>

### <a id="NewMetrics" href="#NewMetrics">var NewMetrics</a>

```
searchKey: janitor.NewMetrics
tags: [exported]
```

```Go
var NewMetrics = newMetrics
```

### <a id="testSourcedCommits" href="#testSourcedCommits">var testSourcedCommits</a>

```
searchKey: janitor.testSourcedCommits
```

```Go
var testSourcedCommits = ...
```

## <a id="type" href="#type">Types</a>

### <a id="abandonedUploadJanitor" href="#abandonedUploadJanitor">type abandonedUploadJanitor struct</a>

```
searchKey: janitor.abandonedUploadJanitor
```

```Go
type abandonedUploadJanitor struct {
	dbStore DBStore
	ttl     time.Duration
	metrics *metrics
}
```

#### <a id="abandonedUploadJanitor.Handle" href="#abandonedUploadJanitor.Handle">func (h *abandonedUploadJanitor) Handle(ctx context.Context) error</a>

```
searchKey: janitor.abandonedUploadJanitor.Handle
```

```Go
func (h *abandonedUploadJanitor) Handle(ctx context.Context) error
```

#### <a id="abandonedUploadJanitor.HandleError" href="#abandonedUploadJanitor.HandleError">func (h *abandonedUploadJanitor) HandleError(err error)</a>

```
searchKey: janitor.abandonedUploadJanitor.HandleError
```

```Go
func (h *abandonedUploadJanitor) HandleError(err error)
```

### <a id="deletedRepositoryJanitor" href="#deletedRepositoryJanitor">type deletedRepositoryJanitor struct</a>

```
searchKey: janitor.deletedRepositoryJanitor
```

```Go
type deletedRepositoryJanitor struct {
	dbStore DBStore
	metrics *metrics
}
```

#### <a id="deletedRepositoryJanitor.Handle" href="#deletedRepositoryJanitor.Handle">func (j *deletedRepositoryJanitor) Handle(ctx context.Context) (err error)</a>

```
searchKey: janitor.deletedRepositoryJanitor.Handle
```

```Go
func (j *deletedRepositoryJanitor) Handle(ctx context.Context) (err error)
```

#### <a id="deletedRepositoryJanitor.HandleError" href="#deletedRepositoryJanitor.HandleError">func (j *deletedRepositoryJanitor) HandleError(err error)</a>

```
searchKey: janitor.deletedRepositoryJanitor.HandleError
```

```Go
func (j *deletedRepositoryJanitor) HandleError(err error)
```

### <a id="recordCount" href="#recordCount">type recordCount struct</a>

```
searchKey: janitor.recordCount
```

```Go
type recordCount struct {
	repoID       int
	uploadsCount int
	indexesCount int
}
```

### <a id="hardDeleter" href="#hardDeleter">type hardDeleter struct</a>

```
searchKey: janitor.hardDeleter
```

```Go
type hardDeleter struct {
	dbStore   DBStore
	lsifStore LSIFStore
	metrics   *metrics
}
```

#### <a id="hardDeleter.Handle" href="#hardDeleter.Handle">func (d *hardDeleter) Handle(ctx context.Context) error</a>

```
searchKey: janitor.hardDeleter.Handle
```

```Go
func (d *hardDeleter) Handle(ctx context.Context) error
```

#### <a id="hardDeleter.HandleError" href="#hardDeleter.HandleError">func (d *hardDeleter) HandleError(err error)</a>

```
searchKey: janitor.hardDeleter.HandleError
```

```Go
func (d *hardDeleter) HandleError(err error)
```

#### <a id="hardDeleter.deleteBatch" href="#hardDeleter.deleteBatch">func (d *hardDeleter) deleteBatch(ctx context.Context, ids []int) (err error)</a>

```
searchKey: janitor.hardDeleter.deleteBatch
```

```Go
func (d *hardDeleter) deleteBatch(ctx context.Context, ids []int) (err error)
```

### <a id="DBStore" href="#DBStore">type DBStore interface</a>

```
searchKey: janitor.DBStore
tags: [exported]
```

```Go
type DBStore interface {
	basestore.ShareableStore

	Handle() *basestore.TransactableHandle
	Transact(ctx context.Context) (DBStore, error)
	Done(err error) error

	GetUploads(ctx context.Context, opts dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
	DeleteUploadsWithoutRepository(ctx context.Context, now time.Time) (map[int]int, error)
	HardDeleteUploadByID(ctx context.Context, ids ...int) error
	SoftDeleteOldUploads(ctx context.Context, maxAge time.Duration, now time.Time) (int, error)
	DeleteOldIndexes(ctx context.Context, maxAge time.Duration, now time.Time) (int, error)
	DirtyRepositories(ctx context.Context) (map[int]int, error)
	DeleteIndexesWithoutRepository(ctx context.Context, now time.Time) (map[int]int, error)
	DeleteUploadsStuckUploading(ctx context.Context, uploadedBefore time.Time) (int, error)
	StaleSourcedCommits(ctx context.Context, threshold time.Duration, limit int, now time.Time) ([]dbstore.SourcedCommits, error)
	RefreshCommitResolvability(ctx context.Context, repositoryID int, commit string, delete bool, now time.Time) (int, int, error)
}
```

### <a id="DBStoreShim" href="#DBStoreShim">type DBStoreShim struct</a>

```
searchKey: janitor.DBStoreShim
tags: [exported]
```

```Go
type DBStoreShim struct {
	*dbstore.Store
}
```

#### <a id="DBStoreShim.Transact" href="#DBStoreShim.Transact">func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)</a>

```
searchKey: janitor.DBStoreShim.Transact
tags: [exported]
```

```Go
func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)
```

### <a id="LSIFStore" href="#LSIFStore">type LSIFStore interface</a>

```
searchKey: janitor.LSIFStore
tags: [exported]
```

```Go
type LSIFStore interface {
	Clear(ctx context.Context, bundleIDs ...int) error
}
```

### <a id="MockDBStore" href="#MockDBStore">type MockDBStore struct</a>

```
searchKey: janitor.MockDBStore
tags: [exported]
```

```Go
type MockDBStore struct {
	// DeleteIndexesWithoutRepositoryFunc is an instance of a mock function
	// object controlling the behavior of the method
	// DeleteIndexesWithoutRepository.
	DeleteIndexesWithoutRepositoryFunc *DBStoreDeleteIndexesWithoutRepositoryFunc
	// DeleteOldIndexesFunc is an instance of a mock function object
	// controlling the behavior of the method DeleteOldIndexes.
	DeleteOldIndexesFunc *DBStoreDeleteOldIndexesFunc
	// DeleteUploadsStuckUploadingFunc is an instance of a mock function
	// object controlling the behavior of the method
	// DeleteUploadsStuckUploading.
	DeleteUploadsStuckUploadingFunc *DBStoreDeleteUploadsStuckUploadingFunc
	// DeleteUploadsWithoutRepositoryFunc is an instance of a mock function
	// object controlling the behavior of the method
	// DeleteUploadsWithoutRepository.
	DeleteUploadsWithoutRepositoryFunc *DBStoreDeleteUploadsWithoutRepositoryFunc
	// DirtyRepositoriesFunc is an instance of a mock function object
	// controlling the behavior of the method DirtyRepositories.
	DirtyRepositoriesFunc *DBStoreDirtyRepositoriesFunc
	// DoneFunc is an instance of a mock function object controlling the
	// behavior of the method Done.
	DoneFunc *DBStoreDoneFunc
	// GetUploadsFunc is an instance of a mock function object controlling
	// the behavior of the method GetUploads.
	GetUploadsFunc *DBStoreGetUploadsFunc
	// HandleFunc is an instance of a mock function object controlling the
	// behavior of the method Handle.
	HandleFunc *DBStoreHandleFunc
	// HardDeleteUploadByIDFunc is an instance of a mock function object
	// controlling the behavior of the method HardDeleteUploadByID.
	HardDeleteUploadByIDFunc *DBStoreHardDeleteUploadByIDFunc
	// RefreshCommitResolvabilityFunc is an instance of a mock function
	// object controlling the behavior of the method
	// RefreshCommitResolvability.
	RefreshCommitResolvabilityFunc *DBStoreRefreshCommitResolvabilityFunc
	// SoftDeleteOldUploadsFunc is an instance of a mock function object
	// controlling the behavior of the method SoftDeleteOldUploads.
	SoftDeleteOldUploadsFunc *DBStoreSoftDeleteOldUploadsFunc
	// StaleSourcedCommitsFunc is an instance of a mock function object
	// controlling the behavior of the method StaleSourcedCommits.
	StaleSourcedCommitsFunc *DBStoreStaleSourcedCommitsFunc
	// TransactFunc is an instance of a mock function object controlling the
	// behavior of the method Transact.
	TransactFunc *DBStoreTransactFunc
}
```

MockDBStore is a mock implementation of the DBStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/janitor) used for unit testing. 

#### <a id="NewMockDBStore" href="#NewMockDBStore">func NewMockDBStore() *MockDBStore</a>

```
searchKey: janitor.NewMockDBStore
tags: [exported]
```

```Go
func NewMockDBStore() *MockDBStore
```

NewMockDBStore creates a new mock of the DBStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockDBStoreFrom" href="#NewMockDBStoreFrom">func NewMockDBStoreFrom(i DBStore) *MockDBStore</a>

```
searchKey: janitor.NewMockDBStoreFrom
tags: [exported]
```

```Go
func NewMockDBStoreFrom(i DBStore) *MockDBStore
```

NewMockDBStoreFrom creates a new mock of the MockDBStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockDBStore.DeleteIndexesWithoutRepository" href="#MockDBStore.DeleteIndexesWithoutRepository">func (m *MockDBStore) DeleteIndexesWithoutRepository(v0 context.Context, v1 time.Time) (map[int]int, error)</a>

```
searchKey: janitor.MockDBStore.DeleteIndexesWithoutRepository
tags: [exported]
```

```Go
func (m *MockDBStore) DeleteIndexesWithoutRepository(v0 context.Context, v1 time.Time) (map[int]int, error)
```

DeleteIndexesWithoutRepository delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.DeleteOldIndexes" href="#MockDBStore.DeleteOldIndexes">func (m *MockDBStore) DeleteOldIndexes(v0 context.Context, v1 time.Duration, v2 time.Time) (int, error)</a>

```
searchKey: janitor.MockDBStore.DeleteOldIndexes
tags: [exported]
```

```Go
func (m *MockDBStore) DeleteOldIndexes(v0 context.Context, v1 time.Duration, v2 time.Time) (int, error)
```

DeleteOldIndexes delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.DeleteUploadsStuckUploading" href="#MockDBStore.DeleteUploadsStuckUploading">func (m *MockDBStore) DeleteUploadsStuckUploading(v0 context.Context, v1 time.Time) (int, error)</a>

```
searchKey: janitor.MockDBStore.DeleteUploadsStuckUploading
tags: [exported]
```

```Go
func (m *MockDBStore) DeleteUploadsStuckUploading(v0 context.Context, v1 time.Time) (int, error)
```

DeleteUploadsStuckUploading delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.DeleteUploadsWithoutRepository" href="#MockDBStore.DeleteUploadsWithoutRepository">func (m *MockDBStore) DeleteUploadsWithoutRepository(v0 context.Context, v1 time.Time) (map[int]int, error)</a>

```
searchKey: janitor.MockDBStore.DeleteUploadsWithoutRepository
tags: [exported]
```

```Go
func (m *MockDBStore) DeleteUploadsWithoutRepository(v0 context.Context, v1 time.Time) (map[int]int, error)
```

DeleteUploadsWithoutRepository delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.DirtyRepositories" href="#MockDBStore.DirtyRepositories">func (m *MockDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)</a>

```
searchKey: janitor.MockDBStore.DirtyRepositories
tags: [exported]
```

```Go
func (m *MockDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)
```

DirtyRepositories delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Done" href="#MockDBStore.Done">func (m *MockDBStore) Done(v0 error) error</a>

```
searchKey: janitor.MockDBStore.Done
tags: [exported]
```

```Go
func (m *MockDBStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetUploads" href="#MockDBStore.GetUploads">func (m *MockDBStore) GetUploads(v0 context.Context, v1 dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)</a>

```
searchKey: janitor.MockDBStore.GetUploads
tags: [exported]
```

```Go
func (m *MockDBStore) GetUploads(v0 context.Context, v1 dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
```

GetUploads delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Handle" href="#MockDBStore.Handle">func (m *MockDBStore) Handle() *basestore.TransactableHandle</a>

```
searchKey: janitor.MockDBStore.Handle
tags: [exported]
```

```Go
func (m *MockDBStore) Handle() *basestore.TransactableHandle
```

Handle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.HardDeleteUploadByID" href="#MockDBStore.HardDeleteUploadByID">func (m *MockDBStore) HardDeleteUploadByID(v0 context.Context, v1 ...int) error</a>

```
searchKey: janitor.MockDBStore.HardDeleteUploadByID
tags: [exported]
```

```Go
func (m *MockDBStore) HardDeleteUploadByID(v0 context.Context, v1 ...int) error
```

HardDeleteUploadByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.RefreshCommitResolvability" href="#MockDBStore.RefreshCommitResolvability">func (m *MockDBStore) RefreshCommitResolvability(v0 context.Context, v1 int, v2 string, v3 bool, v4 time.Time) (int, int, error)</a>

```
searchKey: janitor.MockDBStore.RefreshCommitResolvability
tags: [exported]
```

```Go
func (m *MockDBStore) RefreshCommitResolvability(v0 context.Context, v1 int, v2 string, v3 bool, v4 time.Time) (int, int, error)
```

RefreshCommitResolvability delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.SoftDeleteOldUploads" href="#MockDBStore.SoftDeleteOldUploads">func (m *MockDBStore) SoftDeleteOldUploads(v0 context.Context, v1 time.Duration, v2 time.Time) (int, error)</a>

```
searchKey: janitor.MockDBStore.SoftDeleteOldUploads
tags: [exported]
```

```Go
func (m *MockDBStore) SoftDeleteOldUploads(v0 context.Context, v1 time.Duration, v2 time.Time) (int, error)
```

SoftDeleteOldUploads delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.StaleSourcedCommits" href="#MockDBStore.StaleSourcedCommits">func (m *MockDBStore) StaleSourcedCommits(v0 context.Context, v1 time.Duration, v2 int, v3 time.Time) ([]dbstore.SourcedCommits, error)</a>

```
searchKey: janitor.MockDBStore.StaleSourcedCommits
tags: [exported]
```

```Go
func (m *MockDBStore) StaleSourcedCommits(v0 context.Context, v1 time.Duration, v2 int, v3 time.Time) ([]dbstore.SourcedCommits, error)
```

StaleSourcedCommits delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Transact" href="#MockDBStore.Transact">func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)</a>

```
searchKey: janitor.MockDBStore.Transact
tags: [exported]
```

```Go
func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)
```

Transact delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="DBStoreDeleteIndexesWithoutRepositoryFunc" href="#DBStoreDeleteIndexesWithoutRepositoryFunc">type DBStoreDeleteIndexesWithoutRepositoryFunc struct</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFunc
tags: [exported]
```

```Go
type DBStoreDeleteIndexesWithoutRepositoryFunc struct {
	defaultHook func(context.Context, time.Time) (map[int]int, error)
	hooks       []func(context.Context, time.Time) (map[int]int, error)
	history     []DBStoreDeleteIndexesWithoutRepositoryFuncCall
	mutex       sync.Mutex
}
```

DBStoreDeleteIndexesWithoutRepositoryFunc describes the behavior when the DeleteIndexesWithoutRepository method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDeleteIndexesWithoutRepositoryFunc.SetDefaultHook" href="#DBStoreDeleteIndexesWithoutRepositoryFunc.SetDefaultHook">func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) SetDefaultHook(hook func(context.Context, time.Time) (map[int]int, error))</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) SetDefaultHook(hook func(context.Context, time.Time) (map[int]int, error))
```

SetDefaultHook sets function that is called when the DeleteIndexesWithoutRepository method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDeleteIndexesWithoutRepositoryFunc.PushHook" href="#DBStoreDeleteIndexesWithoutRepositoryFunc.PushHook">func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) PushHook(hook func(context.Context, time.Time) (map[int]int, error))</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) PushHook(hook func(context.Context, time.Time) (map[int]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteIndexesWithoutRepository method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDeleteIndexesWithoutRepositoryFunc.SetDefaultReturn" href="#DBStoreDeleteIndexesWithoutRepositoryFunc.SetDefaultReturn">func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) SetDefaultReturn(r0 map[int]int, r1 error)</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) SetDefaultReturn(r0 map[int]int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteIndexesWithoutRepositoryFunc.PushReturn" href="#DBStoreDeleteIndexesWithoutRepositoryFunc.PushReturn">func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) PushReturn(r0 map[int]int, r1 error)</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) PushReturn(r0 map[int]int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteIndexesWithoutRepositoryFunc.nextHook" href="#DBStoreDeleteIndexesWithoutRepositoryFunc.nextHook">func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) nextHook() func(context.Context, time.Time) (map[int]int, error)</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFunc.nextHook
```

```Go
func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) nextHook() func(context.Context, time.Time) (map[int]int, error)
```

#### <a id="DBStoreDeleteIndexesWithoutRepositoryFunc.appendCall" href="#DBStoreDeleteIndexesWithoutRepositoryFunc.appendCall">func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) appendCall(r0 DBStoreDeleteIndexesWithoutRepositoryFuncCall)</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFunc.appendCall
```

```Go
func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) appendCall(r0 DBStoreDeleteIndexesWithoutRepositoryFuncCall)
```

#### <a id="DBStoreDeleteIndexesWithoutRepositoryFunc.History" href="#DBStoreDeleteIndexesWithoutRepositoryFunc.History">func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) History() []DBStoreDeleteIndexesWithoutRepositoryFuncCall</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFunc.History
tags: [exported]
```

```Go
func (f *DBStoreDeleteIndexesWithoutRepositoryFunc) History() []DBStoreDeleteIndexesWithoutRepositoryFuncCall
```

History returns a sequence of DBStoreDeleteIndexesWithoutRepositoryFuncCall objects describing the invocations of this function. 

### <a id="DBStoreDeleteIndexesWithoutRepositoryFuncCall" href="#DBStoreDeleteIndexesWithoutRepositoryFuncCall">type DBStoreDeleteIndexesWithoutRepositoryFuncCall struct</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFuncCall
tags: [exported]
```

```Go
type DBStoreDeleteIndexesWithoutRepositoryFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 map[int]int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreDeleteIndexesWithoutRepositoryFuncCall is an object that describes an invocation of method DeleteIndexesWithoutRepository on an instance of MockDBStore. 

#### <a id="DBStoreDeleteIndexesWithoutRepositoryFuncCall.Args" href="#DBStoreDeleteIndexesWithoutRepositoryFuncCall.Args">func (c DBStoreDeleteIndexesWithoutRepositoryFuncCall) Args() []interface{}</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreDeleteIndexesWithoutRepositoryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDeleteIndexesWithoutRepositoryFuncCall.Results" href="#DBStoreDeleteIndexesWithoutRepositoryFuncCall.Results">func (c DBStoreDeleteIndexesWithoutRepositoryFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreDeleteIndexesWithoutRepositoryFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreDeleteIndexesWithoutRepositoryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDeleteOldIndexesFunc" href="#DBStoreDeleteOldIndexesFunc">type DBStoreDeleteOldIndexesFunc struct</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFunc
tags: [exported]
```

```Go
type DBStoreDeleteOldIndexesFunc struct {
	defaultHook func(context.Context, time.Duration, time.Time) (int, error)
	hooks       []func(context.Context, time.Duration, time.Time) (int, error)
	history     []DBStoreDeleteOldIndexesFuncCall
	mutex       sync.Mutex
}
```

DBStoreDeleteOldIndexesFunc describes the behavior when the DeleteOldIndexes method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDeleteOldIndexesFunc.SetDefaultHook" href="#DBStoreDeleteOldIndexesFunc.SetDefaultHook">func (f *DBStoreDeleteOldIndexesFunc) SetDefaultHook(hook func(context.Context, time.Duration, time.Time) (int, error))</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreDeleteOldIndexesFunc) SetDefaultHook(hook func(context.Context, time.Duration, time.Time) (int, error))
```

SetDefaultHook sets function that is called when the DeleteOldIndexes method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDeleteOldIndexesFunc.PushHook" href="#DBStoreDeleteOldIndexesFunc.PushHook">func (f *DBStoreDeleteOldIndexesFunc) PushHook(hook func(context.Context, time.Duration, time.Time) (int, error))</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreDeleteOldIndexesFunc) PushHook(hook func(context.Context, time.Duration, time.Time) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteOldIndexes method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDeleteOldIndexesFunc.SetDefaultReturn" href="#DBStoreDeleteOldIndexesFunc.SetDefaultReturn">func (f *DBStoreDeleteOldIndexesFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreDeleteOldIndexesFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteOldIndexesFunc.PushReturn" href="#DBStoreDeleteOldIndexesFunc.PushReturn">func (f *DBStoreDeleteOldIndexesFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreDeleteOldIndexesFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteOldIndexesFunc.nextHook" href="#DBStoreDeleteOldIndexesFunc.nextHook">func (f *DBStoreDeleteOldIndexesFunc) nextHook() func(context.Context, time.Duration, time.Time) (int, error)</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFunc.nextHook
```

```Go
func (f *DBStoreDeleteOldIndexesFunc) nextHook() func(context.Context, time.Duration, time.Time) (int, error)
```

#### <a id="DBStoreDeleteOldIndexesFunc.appendCall" href="#DBStoreDeleteOldIndexesFunc.appendCall">func (f *DBStoreDeleteOldIndexesFunc) appendCall(r0 DBStoreDeleteOldIndexesFuncCall)</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFunc.appendCall
```

```Go
func (f *DBStoreDeleteOldIndexesFunc) appendCall(r0 DBStoreDeleteOldIndexesFuncCall)
```

#### <a id="DBStoreDeleteOldIndexesFunc.History" href="#DBStoreDeleteOldIndexesFunc.History">func (f *DBStoreDeleteOldIndexesFunc) History() []DBStoreDeleteOldIndexesFuncCall</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFunc.History
tags: [exported]
```

```Go
func (f *DBStoreDeleteOldIndexesFunc) History() []DBStoreDeleteOldIndexesFuncCall
```

History returns a sequence of DBStoreDeleteOldIndexesFuncCall objects describing the invocations of this function. 

### <a id="DBStoreDeleteOldIndexesFuncCall" href="#DBStoreDeleteOldIndexesFuncCall">type DBStoreDeleteOldIndexesFuncCall struct</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFuncCall
tags: [exported]
```

```Go
type DBStoreDeleteOldIndexesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 time.Duration
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreDeleteOldIndexesFuncCall is an object that describes an invocation of method DeleteOldIndexes on an instance of MockDBStore. 

#### <a id="DBStoreDeleteOldIndexesFuncCall.Args" href="#DBStoreDeleteOldIndexesFuncCall.Args">func (c DBStoreDeleteOldIndexesFuncCall) Args() []interface{}</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreDeleteOldIndexesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDeleteOldIndexesFuncCall.Results" href="#DBStoreDeleteOldIndexesFuncCall.Results">func (c DBStoreDeleteOldIndexesFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreDeleteOldIndexesFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreDeleteOldIndexesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDeleteUploadsStuckUploadingFunc" href="#DBStoreDeleteUploadsStuckUploadingFunc">type DBStoreDeleteUploadsStuckUploadingFunc struct</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFunc
tags: [exported]
```

```Go
type DBStoreDeleteUploadsStuckUploadingFunc struct {
	defaultHook func(context.Context, time.Time) (int, error)
	hooks       []func(context.Context, time.Time) (int, error)
	history     []DBStoreDeleteUploadsStuckUploadingFuncCall
	mutex       sync.Mutex
}
```

DBStoreDeleteUploadsStuckUploadingFunc describes the behavior when the DeleteUploadsStuckUploading method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDeleteUploadsStuckUploadingFunc.SetDefaultHook" href="#DBStoreDeleteUploadsStuckUploadingFunc.SetDefaultHook">func (f *DBStoreDeleteUploadsStuckUploadingFunc) SetDefaultHook(hook func(context.Context, time.Time) (int, error))</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsStuckUploadingFunc) SetDefaultHook(hook func(context.Context, time.Time) (int, error))
```

SetDefaultHook sets function that is called when the DeleteUploadsStuckUploading method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDeleteUploadsStuckUploadingFunc.PushHook" href="#DBStoreDeleteUploadsStuckUploadingFunc.PushHook">func (f *DBStoreDeleteUploadsStuckUploadingFunc) PushHook(hook func(context.Context, time.Time) (int, error))</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsStuckUploadingFunc) PushHook(hook func(context.Context, time.Time) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteUploadsStuckUploading method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDeleteUploadsStuckUploadingFunc.SetDefaultReturn" href="#DBStoreDeleteUploadsStuckUploadingFunc.SetDefaultReturn">func (f *DBStoreDeleteUploadsStuckUploadingFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsStuckUploadingFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteUploadsStuckUploadingFunc.PushReturn" href="#DBStoreDeleteUploadsStuckUploadingFunc.PushReturn">func (f *DBStoreDeleteUploadsStuckUploadingFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsStuckUploadingFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteUploadsStuckUploadingFunc.nextHook" href="#DBStoreDeleteUploadsStuckUploadingFunc.nextHook">func (f *DBStoreDeleteUploadsStuckUploadingFunc) nextHook() func(context.Context, time.Time) (int, error)</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFunc.nextHook
```

```Go
func (f *DBStoreDeleteUploadsStuckUploadingFunc) nextHook() func(context.Context, time.Time) (int, error)
```

#### <a id="DBStoreDeleteUploadsStuckUploadingFunc.appendCall" href="#DBStoreDeleteUploadsStuckUploadingFunc.appendCall">func (f *DBStoreDeleteUploadsStuckUploadingFunc) appendCall(r0 DBStoreDeleteUploadsStuckUploadingFuncCall)</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFunc.appendCall
```

```Go
func (f *DBStoreDeleteUploadsStuckUploadingFunc) appendCall(r0 DBStoreDeleteUploadsStuckUploadingFuncCall)
```

#### <a id="DBStoreDeleteUploadsStuckUploadingFunc.History" href="#DBStoreDeleteUploadsStuckUploadingFunc.History">func (f *DBStoreDeleteUploadsStuckUploadingFunc) History() []DBStoreDeleteUploadsStuckUploadingFuncCall</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFunc.History
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsStuckUploadingFunc) History() []DBStoreDeleteUploadsStuckUploadingFuncCall
```

History returns a sequence of DBStoreDeleteUploadsStuckUploadingFuncCall objects describing the invocations of this function. 

### <a id="DBStoreDeleteUploadsStuckUploadingFuncCall" href="#DBStoreDeleteUploadsStuckUploadingFuncCall">type DBStoreDeleteUploadsStuckUploadingFuncCall struct</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFuncCall
tags: [exported]
```

```Go
type DBStoreDeleteUploadsStuckUploadingFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreDeleteUploadsStuckUploadingFuncCall is an object that describes an invocation of method DeleteUploadsStuckUploading on an instance of MockDBStore. 

#### <a id="DBStoreDeleteUploadsStuckUploadingFuncCall.Args" href="#DBStoreDeleteUploadsStuckUploadingFuncCall.Args">func (c DBStoreDeleteUploadsStuckUploadingFuncCall) Args() []interface{}</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreDeleteUploadsStuckUploadingFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDeleteUploadsStuckUploadingFuncCall.Results" href="#DBStoreDeleteUploadsStuckUploadingFuncCall.Results">func (c DBStoreDeleteUploadsStuckUploadingFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreDeleteUploadsStuckUploadingFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreDeleteUploadsStuckUploadingFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDeleteUploadsWithoutRepositoryFunc" href="#DBStoreDeleteUploadsWithoutRepositoryFunc">type DBStoreDeleteUploadsWithoutRepositoryFunc struct</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFunc
tags: [exported]
```

```Go
type DBStoreDeleteUploadsWithoutRepositoryFunc struct {
	defaultHook func(context.Context, time.Time) (map[int]int, error)
	hooks       []func(context.Context, time.Time) (map[int]int, error)
	history     []DBStoreDeleteUploadsWithoutRepositoryFuncCall
	mutex       sync.Mutex
}
```

DBStoreDeleteUploadsWithoutRepositoryFunc describes the behavior when the DeleteUploadsWithoutRepository method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDeleteUploadsWithoutRepositoryFunc.SetDefaultHook" href="#DBStoreDeleteUploadsWithoutRepositoryFunc.SetDefaultHook">func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) SetDefaultHook(hook func(context.Context, time.Time) (map[int]int, error))</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) SetDefaultHook(hook func(context.Context, time.Time) (map[int]int, error))
```

SetDefaultHook sets function that is called when the DeleteUploadsWithoutRepository method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDeleteUploadsWithoutRepositoryFunc.PushHook" href="#DBStoreDeleteUploadsWithoutRepositoryFunc.PushHook">func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) PushHook(hook func(context.Context, time.Time) (map[int]int, error))</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) PushHook(hook func(context.Context, time.Time) (map[int]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteUploadsWithoutRepository method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDeleteUploadsWithoutRepositoryFunc.SetDefaultReturn" href="#DBStoreDeleteUploadsWithoutRepositoryFunc.SetDefaultReturn">func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) SetDefaultReturn(r0 map[int]int, r1 error)</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) SetDefaultReturn(r0 map[int]int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteUploadsWithoutRepositoryFunc.PushReturn" href="#DBStoreDeleteUploadsWithoutRepositoryFunc.PushReturn">func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) PushReturn(r0 map[int]int, r1 error)</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) PushReturn(r0 map[int]int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDeleteUploadsWithoutRepositoryFunc.nextHook" href="#DBStoreDeleteUploadsWithoutRepositoryFunc.nextHook">func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) nextHook() func(context.Context, time.Time) (map[int]int, error)</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFunc.nextHook
```

```Go
func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) nextHook() func(context.Context, time.Time) (map[int]int, error)
```

#### <a id="DBStoreDeleteUploadsWithoutRepositoryFunc.appendCall" href="#DBStoreDeleteUploadsWithoutRepositoryFunc.appendCall">func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) appendCall(r0 DBStoreDeleteUploadsWithoutRepositoryFuncCall)</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFunc.appendCall
```

```Go
func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) appendCall(r0 DBStoreDeleteUploadsWithoutRepositoryFuncCall)
```

#### <a id="DBStoreDeleteUploadsWithoutRepositoryFunc.History" href="#DBStoreDeleteUploadsWithoutRepositoryFunc.History">func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) History() []DBStoreDeleteUploadsWithoutRepositoryFuncCall</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFunc.History
tags: [exported]
```

```Go
func (f *DBStoreDeleteUploadsWithoutRepositoryFunc) History() []DBStoreDeleteUploadsWithoutRepositoryFuncCall
```

History returns a sequence of DBStoreDeleteUploadsWithoutRepositoryFuncCall objects describing the invocations of this function. 

### <a id="DBStoreDeleteUploadsWithoutRepositoryFuncCall" href="#DBStoreDeleteUploadsWithoutRepositoryFuncCall">type DBStoreDeleteUploadsWithoutRepositoryFuncCall struct</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFuncCall
tags: [exported]
```

```Go
type DBStoreDeleteUploadsWithoutRepositoryFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 map[int]int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreDeleteUploadsWithoutRepositoryFuncCall is an object that describes an invocation of method DeleteUploadsWithoutRepository on an instance of MockDBStore. 

#### <a id="DBStoreDeleteUploadsWithoutRepositoryFuncCall.Args" href="#DBStoreDeleteUploadsWithoutRepositoryFuncCall.Args">func (c DBStoreDeleteUploadsWithoutRepositoryFuncCall) Args() []interface{}</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreDeleteUploadsWithoutRepositoryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDeleteUploadsWithoutRepositoryFuncCall.Results" href="#DBStoreDeleteUploadsWithoutRepositoryFuncCall.Results">func (c DBStoreDeleteUploadsWithoutRepositoryFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreDeleteUploadsWithoutRepositoryFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreDeleteUploadsWithoutRepositoryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDirtyRepositoriesFunc" href="#DBStoreDirtyRepositoriesFunc">type DBStoreDirtyRepositoriesFunc struct</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFunc
tags: [exported]
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

#### <a id="DBStoreDirtyRepositoriesFunc.SetDefaultHook" href="#DBStoreDirtyRepositoriesFunc.SetDefaultHook">func (f *DBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))
```

SetDefaultHook sets function that is called when the DirtyRepositories method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDirtyRepositoriesFunc.PushHook" href="#DBStoreDirtyRepositoriesFunc.PushHook">func (f *DBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DirtyRepositories method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDirtyRepositoriesFunc.SetDefaultReturn" href="#DBStoreDirtyRepositoriesFunc.SetDefaultReturn">func (f *DBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDirtyRepositoriesFunc.PushReturn" href="#DBStoreDirtyRepositoriesFunc.PushReturn">func (f *DBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDirtyRepositoriesFunc.nextHook" href="#DBStoreDirtyRepositoriesFunc.nextHook">func (f *DBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFunc.nextHook
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)
```

#### <a id="DBStoreDirtyRepositoriesFunc.appendCall" href="#DBStoreDirtyRepositoriesFunc.appendCall">func (f *DBStoreDirtyRepositoriesFunc) appendCall(r0 DBStoreDirtyRepositoriesFuncCall)</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFunc.appendCall
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) appendCall(r0 DBStoreDirtyRepositoriesFuncCall)
```

#### <a id="DBStoreDirtyRepositoriesFunc.History" href="#DBStoreDirtyRepositoriesFunc.History">func (f *DBStoreDirtyRepositoriesFunc) History() []DBStoreDirtyRepositoriesFuncCall</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFunc.History
tags: [exported]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) History() []DBStoreDirtyRepositoriesFuncCall
```

History returns a sequence of DBStoreDirtyRepositoriesFuncCall objects describing the invocations of this function. 

### <a id="DBStoreDirtyRepositoriesFuncCall" href="#DBStoreDirtyRepositoriesFuncCall">type DBStoreDirtyRepositoriesFuncCall struct</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFuncCall
tags: [exported]
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
searchKey: janitor.DBStoreDirtyRepositoriesFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreDirtyRepositoriesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDirtyRepositoriesFuncCall.Results" href="#DBStoreDirtyRepositoriesFuncCall.Results">func (c DBStoreDirtyRepositoriesFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreDirtyRepositoriesFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreDirtyRepositoriesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDoneFunc" href="#DBStoreDoneFunc">type DBStoreDoneFunc struct</a>

```
searchKey: janitor.DBStoreDoneFunc
tags: [exported]
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
searchKey: janitor.DBStoreDoneFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDoneFunc.PushHook" href="#DBStoreDoneFunc.PushHook">func (f *DBStoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: janitor.DBStoreDoneFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDoneFunc.SetDefaultReturn" href="#DBStoreDoneFunc.SetDefaultReturn">func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: janitor.DBStoreDoneFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.PushReturn" href="#DBStoreDoneFunc.PushReturn">func (f *DBStoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: janitor.DBStoreDoneFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.nextHook" href="#DBStoreDoneFunc.nextHook">func (f *DBStoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: janitor.DBStoreDoneFunc.nextHook
```

```Go
func (f *DBStoreDoneFunc) nextHook() func(error) error
```

#### <a id="DBStoreDoneFunc.appendCall" href="#DBStoreDoneFunc.appendCall">func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)</a>

```
searchKey: janitor.DBStoreDoneFunc.appendCall
```

```Go
func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)
```

#### <a id="DBStoreDoneFunc.History" href="#DBStoreDoneFunc.History">func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall</a>

```
searchKey: janitor.DBStoreDoneFunc.History
tags: [exported]
```

```Go
func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall
```

History returns a sequence of DBStoreDoneFuncCall objects describing the invocations of this function. 

### <a id="DBStoreDoneFuncCall" href="#DBStoreDoneFuncCall">type DBStoreDoneFuncCall struct</a>

```
searchKey: janitor.DBStoreDoneFuncCall
tags: [exported]
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
searchKey: janitor.DBStoreDoneFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDoneFuncCall.Results" href="#DBStoreDoneFuncCall.Results">func (c DBStoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreDoneFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetUploadsFunc" href="#DBStoreGetUploadsFunc">type DBStoreGetUploadsFunc struct</a>

```
searchKey: janitor.DBStoreGetUploadsFunc
tags: [exported]
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
searchKey: janitor.DBStoreGetUploadsFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreGetUploadsFunc) SetDefaultHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))
```

SetDefaultHook sets function that is called when the GetUploads method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetUploadsFunc.PushHook" href="#DBStoreGetUploadsFunc.PushHook">func (f *DBStoreGetUploadsFunc) PushHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))</a>

```
searchKey: janitor.DBStoreGetUploadsFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreGetUploadsFunc) PushHook(hook func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploads method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetUploadsFunc.SetDefaultReturn" href="#DBStoreGetUploadsFunc.SetDefaultReturn">func (f *DBStoreGetUploadsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 int, r2 error)</a>

```
searchKey: janitor.DBStoreGetUploadsFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreGetUploadsFunc) SetDefaultReturn(r0 []dbstore.Upload, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadsFunc.PushReturn" href="#DBStoreGetUploadsFunc.PushReturn">func (f *DBStoreGetUploadsFunc) PushReturn(r0 []dbstore.Upload, r1 int, r2 error)</a>

```
searchKey: janitor.DBStoreGetUploadsFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreGetUploadsFunc) PushReturn(r0 []dbstore.Upload, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadsFunc.nextHook" href="#DBStoreGetUploadsFunc.nextHook">func (f *DBStoreGetUploadsFunc) nextHook() func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)</a>

```
searchKey: janitor.DBStoreGetUploadsFunc.nextHook
```

```Go
func (f *DBStoreGetUploadsFunc) nextHook() func(context.Context, dbstore.GetUploadsOptions) ([]dbstore.Upload, int, error)
```

#### <a id="DBStoreGetUploadsFunc.appendCall" href="#DBStoreGetUploadsFunc.appendCall">func (f *DBStoreGetUploadsFunc) appendCall(r0 DBStoreGetUploadsFuncCall)</a>

```
searchKey: janitor.DBStoreGetUploadsFunc.appendCall
```

```Go
func (f *DBStoreGetUploadsFunc) appendCall(r0 DBStoreGetUploadsFuncCall)
```

#### <a id="DBStoreGetUploadsFunc.History" href="#DBStoreGetUploadsFunc.History">func (f *DBStoreGetUploadsFunc) History() []DBStoreGetUploadsFuncCall</a>

```
searchKey: janitor.DBStoreGetUploadsFunc.History
tags: [exported]
```

```Go
func (f *DBStoreGetUploadsFunc) History() []DBStoreGetUploadsFuncCall
```

History returns a sequence of DBStoreGetUploadsFuncCall objects describing the invocations of this function. 

### <a id="DBStoreGetUploadsFuncCall" href="#DBStoreGetUploadsFuncCall">type DBStoreGetUploadsFuncCall struct</a>

```
searchKey: janitor.DBStoreGetUploadsFuncCall
tags: [exported]
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
searchKey: janitor.DBStoreGetUploadsFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreGetUploadsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetUploadsFuncCall.Results" href="#DBStoreGetUploadsFuncCall.Results">func (c DBStoreGetUploadsFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreGetUploadsFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreGetUploadsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreHandleFunc" href="#DBStoreHandleFunc">type DBStoreHandleFunc struct</a>

```
searchKey: janitor.DBStoreHandleFunc
tags: [exported]
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
searchKey: janitor.DBStoreHandleFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)
```

SetDefaultHook sets function that is called when the Handle method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreHandleFunc.PushHook" href="#DBStoreHandleFunc.PushHook">func (f *DBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: janitor.DBStoreHandleFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)
```

PushHook adds a function to the end of hook queue. Each invocation of the Handle method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreHandleFunc.SetDefaultReturn" href="#DBStoreHandleFunc.SetDefaultReturn">func (f *DBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: janitor.DBStoreHandleFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHandleFunc.PushReturn" href="#DBStoreHandleFunc.PushReturn">func (f *DBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: janitor.DBStoreHandleFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHandleFunc.nextHook" href="#DBStoreHandleFunc.nextHook">func (f *DBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle</a>

```
searchKey: janitor.DBStoreHandleFunc.nextHook
```

```Go
func (f *DBStoreHandleFunc) nextHook() func() *basestore.TransactableHandle
```

#### <a id="DBStoreHandleFunc.appendCall" href="#DBStoreHandleFunc.appendCall">func (f *DBStoreHandleFunc) appendCall(r0 DBStoreHandleFuncCall)</a>

```
searchKey: janitor.DBStoreHandleFunc.appendCall
```

```Go
func (f *DBStoreHandleFunc) appendCall(r0 DBStoreHandleFuncCall)
```

#### <a id="DBStoreHandleFunc.History" href="#DBStoreHandleFunc.History">func (f *DBStoreHandleFunc) History() []DBStoreHandleFuncCall</a>

```
searchKey: janitor.DBStoreHandleFunc.History
tags: [exported]
```

```Go
func (f *DBStoreHandleFunc) History() []DBStoreHandleFuncCall
```

History returns a sequence of DBStoreHandleFuncCall objects describing the invocations of this function. 

### <a id="DBStoreHandleFuncCall" href="#DBStoreHandleFuncCall">type DBStoreHandleFuncCall struct</a>

```
searchKey: janitor.DBStoreHandleFuncCall
tags: [exported]
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
searchKey: janitor.DBStoreHandleFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreHandleFuncCall.Results" href="#DBStoreHandleFuncCall.Results">func (c DBStoreHandleFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreHandleFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreHardDeleteUploadByIDFunc" href="#DBStoreHardDeleteUploadByIDFunc">type DBStoreHardDeleteUploadByIDFunc struct</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFunc
tags: [exported]
```

```Go
type DBStoreHardDeleteUploadByIDFunc struct {
	defaultHook func(context.Context, ...int) error
	hooks       []func(context.Context, ...int) error
	history     []DBStoreHardDeleteUploadByIDFuncCall
	mutex       sync.Mutex
}
```

DBStoreHardDeleteUploadByIDFunc describes the behavior when the HardDeleteUploadByID method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreHardDeleteUploadByIDFunc.SetDefaultHook" href="#DBStoreHardDeleteUploadByIDFunc.SetDefaultHook">func (f *DBStoreHardDeleteUploadByIDFunc) SetDefaultHook(hook func(context.Context, ...int) error)</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreHardDeleteUploadByIDFunc) SetDefaultHook(hook func(context.Context, ...int) error)
```

SetDefaultHook sets function that is called when the HardDeleteUploadByID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreHardDeleteUploadByIDFunc.PushHook" href="#DBStoreHardDeleteUploadByIDFunc.PushHook">func (f *DBStoreHardDeleteUploadByIDFunc) PushHook(hook func(context.Context, ...int) error)</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreHardDeleteUploadByIDFunc) PushHook(hook func(context.Context, ...int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the HardDeleteUploadByID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreHardDeleteUploadByIDFunc.SetDefaultReturn" href="#DBStoreHardDeleteUploadByIDFunc.SetDefaultReturn">func (f *DBStoreHardDeleteUploadByIDFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreHardDeleteUploadByIDFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHardDeleteUploadByIDFunc.PushReturn" href="#DBStoreHardDeleteUploadByIDFunc.PushReturn">func (f *DBStoreHardDeleteUploadByIDFunc) PushReturn(r0 error)</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreHardDeleteUploadByIDFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreHardDeleteUploadByIDFunc.nextHook" href="#DBStoreHardDeleteUploadByIDFunc.nextHook">func (f *DBStoreHardDeleteUploadByIDFunc) nextHook() func(context.Context, ...int) error</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFunc.nextHook
```

```Go
func (f *DBStoreHardDeleteUploadByIDFunc) nextHook() func(context.Context, ...int) error
```

#### <a id="DBStoreHardDeleteUploadByIDFunc.appendCall" href="#DBStoreHardDeleteUploadByIDFunc.appendCall">func (f *DBStoreHardDeleteUploadByIDFunc) appendCall(r0 DBStoreHardDeleteUploadByIDFuncCall)</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFunc.appendCall
```

```Go
func (f *DBStoreHardDeleteUploadByIDFunc) appendCall(r0 DBStoreHardDeleteUploadByIDFuncCall)
```

#### <a id="DBStoreHardDeleteUploadByIDFunc.History" href="#DBStoreHardDeleteUploadByIDFunc.History">func (f *DBStoreHardDeleteUploadByIDFunc) History() []DBStoreHardDeleteUploadByIDFuncCall</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFunc.History
tags: [exported]
```

```Go
func (f *DBStoreHardDeleteUploadByIDFunc) History() []DBStoreHardDeleteUploadByIDFuncCall
```

History returns a sequence of DBStoreHardDeleteUploadByIDFuncCall objects describing the invocations of this function. 

### <a id="DBStoreHardDeleteUploadByIDFuncCall" href="#DBStoreHardDeleteUploadByIDFuncCall">type DBStoreHardDeleteUploadByIDFuncCall struct</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFuncCall
tags: [exported]
```

```Go
type DBStoreHardDeleteUploadByIDFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is a slice containing the values of the variadic arguments
	// passed to this method invocation.
	Arg1 []int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreHardDeleteUploadByIDFuncCall is an object that describes an invocation of method HardDeleteUploadByID on an instance of MockDBStore. 

#### <a id="DBStoreHardDeleteUploadByIDFuncCall.Args" href="#DBStoreHardDeleteUploadByIDFuncCall.Args">func (c DBStoreHardDeleteUploadByIDFuncCall) Args() []interface{}</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreHardDeleteUploadByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. The variadic slice argument is flattened in this array such that one positional argument and three variadic arguments would result in a slice of four, not two. 

#### <a id="DBStoreHardDeleteUploadByIDFuncCall.Results" href="#DBStoreHardDeleteUploadByIDFuncCall.Results">func (c DBStoreHardDeleteUploadByIDFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreHardDeleteUploadByIDFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreHardDeleteUploadByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreRefreshCommitResolvabilityFunc" href="#DBStoreRefreshCommitResolvabilityFunc">type DBStoreRefreshCommitResolvabilityFunc struct</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFunc
tags: [exported]
```

```Go
type DBStoreRefreshCommitResolvabilityFunc struct {
	defaultHook func(context.Context, int, string, bool, time.Time) (int, int, error)
	hooks       []func(context.Context, int, string, bool, time.Time) (int, int, error)
	history     []DBStoreRefreshCommitResolvabilityFuncCall
	mutex       sync.Mutex
}
```

DBStoreRefreshCommitResolvabilityFunc describes the behavior when the RefreshCommitResolvability method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreRefreshCommitResolvabilityFunc.SetDefaultHook" href="#DBStoreRefreshCommitResolvabilityFunc.SetDefaultHook">func (f *DBStoreRefreshCommitResolvabilityFunc) SetDefaultHook(hook func(context.Context, int, string, bool, time.Time) (int, int, error))</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreRefreshCommitResolvabilityFunc) SetDefaultHook(hook func(context.Context, int, string, bool, time.Time) (int, int, error))
```

SetDefaultHook sets function that is called when the RefreshCommitResolvability method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreRefreshCommitResolvabilityFunc.PushHook" href="#DBStoreRefreshCommitResolvabilityFunc.PushHook">func (f *DBStoreRefreshCommitResolvabilityFunc) PushHook(hook func(context.Context, int, string, bool, time.Time) (int, int, error))</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreRefreshCommitResolvabilityFunc) PushHook(hook func(context.Context, int, string, bool, time.Time) (int, int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the RefreshCommitResolvability method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreRefreshCommitResolvabilityFunc.SetDefaultReturn" href="#DBStoreRefreshCommitResolvabilityFunc.SetDefaultReturn">func (f *DBStoreRefreshCommitResolvabilityFunc) SetDefaultReturn(r0 int, r1 int, r2 error)</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreRefreshCommitResolvabilityFunc) SetDefaultReturn(r0 int, r1 int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreRefreshCommitResolvabilityFunc.PushReturn" href="#DBStoreRefreshCommitResolvabilityFunc.PushReturn">func (f *DBStoreRefreshCommitResolvabilityFunc) PushReturn(r0 int, r1 int, r2 error)</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreRefreshCommitResolvabilityFunc) PushReturn(r0 int, r1 int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreRefreshCommitResolvabilityFunc.nextHook" href="#DBStoreRefreshCommitResolvabilityFunc.nextHook">func (f *DBStoreRefreshCommitResolvabilityFunc) nextHook() func(context.Context, int, string, bool, time.Time) (int, int, error)</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFunc.nextHook
```

```Go
func (f *DBStoreRefreshCommitResolvabilityFunc) nextHook() func(context.Context, int, string, bool, time.Time) (int, int, error)
```

#### <a id="DBStoreRefreshCommitResolvabilityFunc.appendCall" href="#DBStoreRefreshCommitResolvabilityFunc.appendCall">func (f *DBStoreRefreshCommitResolvabilityFunc) appendCall(r0 DBStoreRefreshCommitResolvabilityFuncCall)</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFunc.appendCall
```

```Go
func (f *DBStoreRefreshCommitResolvabilityFunc) appendCall(r0 DBStoreRefreshCommitResolvabilityFuncCall)
```

#### <a id="DBStoreRefreshCommitResolvabilityFunc.History" href="#DBStoreRefreshCommitResolvabilityFunc.History">func (f *DBStoreRefreshCommitResolvabilityFunc) History() []DBStoreRefreshCommitResolvabilityFuncCall</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFunc.History
tags: [exported]
```

```Go
func (f *DBStoreRefreshCommitResolvabilityFunc) History() []DBStoreRefreshCommitResolvabilityFuncCall
```

History returns a sequence of DBStoreRefreshCommitResolvabilityFuncCall objects describing the invocations of this function. 

### <a id="DBStoreRefreshCommitResolvabilityFuncCall" href="#DBStoreRefreshCommitResolvabilityFuncCall">type DBStoreRefreshCommitResolvabilityFuncCall struct</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFuncCall
tags: [exported]
```

```Go
type DBStoreRefreshCommitResolvabilityFuncCall struct {
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
	Arg3 bool
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreRefreshCommitResolvabilityFuncCall is an object that describes an invocation of method RefreshCommitResolvability on an instance of MockDBStore. 

#### <a id="DBStoreRefreshCommitResolvabilityFuncCall.Args" href="#DBStoreRefreshCommitResolvabilityFuncCall.Args">func (c DBStoreRefreshCommitResolvabilityFuncCall) Args() []interface{}</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreRefreshCommitResolvabilityFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreRefreshCommitResolvabilityFuncCall.Results" href="#DBStoreRefreshCommitResolvabilityFuncCall.Results">func (c DBStoreRefreshCommitResolvabilityFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreRefreshCommitResolvabilityFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreRefreshCommitResolvabilityFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreSoftDeleteOldUploadsFunc" href="#DBStoreSoftDeleteOldUploadsFunc">type DBStoreSoftDeleteOldUploadsFunc struct</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFunc
tags: [exported]
```

```Go
type DBStoreSoftDeleteOldUploadsFunc struct {
	defaultHook func(context.Context, time.Duration, time.Time) (int, error)
	hooks       []func(context.Context, time.Duration, time.Time) (int, error)
	history     []DBStoreSoftDeleteOldUploadsFuncCall
	mutex       sync.Mutex
}
```

DBStoreSoftDeleteOldUploadsFunc describes the behavior when the SoftDeleteOldUploads method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreSoftDeleteOldUploadsFunc.SetDefaultHook" href="#DBStoreSoftDeleteOldUploadsFunc.SetDefaultHook">func (f *DBStoreSoftDeleteOldUploadsFunc) SetDefaultHook(hook func(context.Context, time.Duration, time.Time) (int, error))</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreSoftDeleteOldUploadsFunc) SetDefaultHook(hook func(context.Context, time.Duration, time.Time) (int, error))
```

SetDefaultHook sets function that is called when the SoftDeleteOldUploads method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreSoftDeleteOldUploadsFunc.PushHook" href="#DBStoreSoftDeleteOldUploadsFunc.PushHook">func (f *DBStoreSoftDeleteOldUploadsFunc) PushHook(hook func(context.Context, time.Duration, time.Time) (int, error))</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreSoftDeleteOldUploadsFunc) PushHook(hook func(context.Context, time.Duration, time.Time) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the SoftDeleteOldUploads method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreSoftDeleteOldUploadsFunc.SetDefaultReturn" href="#DBStoreSoftDeleteOldUploadsFunc.SetDefaultReturn">func (f *DBStoreSoftDeleteOldUploadsFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreSoftDeleteOldUploadsFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreSoftDeleteOldUploadsFunc.PushReturn" href="#DBStoreSoftDeleteOldUploadsFunc.PushReturn">func (f *DBStoreSoftDeleteOldUploadsFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreSoftDeleteOldUploadsFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreSoftDeleteOldUploadsFunc.nextHook" href="#DBStoreSoftDeleteOldUploadsFunc.nextHook">func (f *DBStoreSoftDeleteOldUploadsFunc) nextHook() func(context.Context, time.Duration, time.Time) (int, error)</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFunc.nextHook
```

```Go
func (f *DBStoreSoftDeleteOldUploadsFunc) nextHook() func(context.Context, time.Duration, time.Time) (int, error)
```

#### <a id="DBStoreSoftDeleteOldUploadsFunc.appendCall" href="#DBStoreSoftDeleteOldUploadsFunc.appendCall">func (f *DBStoreSoftDeleteOldUploadsFunc) appendCall(r0 DBStoreSoftDeleteOldUploadsFuncCall)</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFunc.appendCall
```

```Go
func (f *DBStoreSoftDeleteOldUploadsFunc) appendCall(r0 DBStoreSoftDeleteOldUploadsFuncCall)
```

#### <a id="DBStoreSoftDeleteOldUploadsFunc.History" href="#DBStoreSoftDeleteOldUploadsFunc.History">func (f *DBStoreSoftDeleteOldUploadsFunc) History() []DBStoreSoftDeleteOldUploadsFuncCall</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFunc.History
tags: [exported]
```

```Go
func (f *DBStoreSoftDeleteOldUploadsFunc) History() []DBStoreSoftDeleteOldUploadsFuncCall
```

History returns a sequence of DBStoreSoftDeleteOldUploadsFuncCall objects describing the invocations of this function. 

### <a id="DBStoreSoftDeleteOldUploadsFuncCall" href="#DBStoreSoftDeleteOldUploadsFuncCall">type DBStoreSoftDeleteOldUploadsFuncCall struct</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFuncCall
tags: [exported]
```

```Go
type DBStoreSoftDeleteOldUploadsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 time.Duration
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreSoftDeleteOldUploadsFuncCall is an object that describes an invocation of method SoftDeleteOldUploads on an instance of MockDBStore. 

#### <a id="DBStoreSoftDeleteOldUploadsFuncCall.Args" href="#DBStoreSoftDeleteOldUploadsFuncCall.Args">func (c DBStoreSoftDeleteOldUploadsFuncCall) Args() []interface{}</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreSoftDeleteOldUploadsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreSoftDeleteOldUploadsFuncCall.Results" href="#DBStoreSoftDeleteOldUploadsFuncCall.Results">func (c DBStoreSoftDeleteOldUploadsFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreSoftDeleteOldUploadsFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreSoftDeleteOldUploadsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreStaleSourcedCommitsFunc" href="#DBStoreStaleSourcedCommitsFunc">type DBStoreStaleSourcedCommitsFunc struct</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFunc
tags: [exported]
```

```Go
type DBStoreStaleSourcedCommitsFunc struct {
	defaultHook func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error)
	hooks       []func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error)
	history     []DBStoreStaleSourcedCommitsFuncCall
	mutex       sync.Mutex
}
```

DBStoreStaleSourcedCommitsFunc describes the behavior when the StaleSourcedCommits method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreStaleSourcedCommitsFunc.SetDefaultHook" href="#DBStoreStaleSourcedCommitsFunc.SetDefaultHook">func (f *DBStoreStaleSourcedCommitsFunc) SetDefaultHook(hook func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error))</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreStaleSourcedCommitsFunc) SetDefaultHook(hook func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error))
```

SetDefaultHook sets function that is called when the StaleSourcedCommits method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreStaleSourcedCommitsFunc.PushHook" href="#DBStoreStaleSourcedCommitsFunc.PushHook">func (f *DBStoreStaleSourcedCommitsFunc) PushHook(hook func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error))</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreStaleSourcedCommitsFunc) PushHook(hook func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the StaleSourcedCommits method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreStaleSourcedCommitsFunc.SetDefaultReturn" href="#DBStoreStaleSourcedCommitsFunc.SetDefaultReturn">func (f *DBStoreStaleSourcedCommitsFunc) SetDefaultReturn(r0 []dbstore.SourcedCommits, r1 error)</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreStaleSourcedCommitsFunc) SetDefaultReturn(r0 []dbstore.SourcedCommits, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreStaleSourcedCommitsFunc.PushReturn" href="#DBStoreStaleSourcedCommitsFunc.PushReturn">func (f *DBStoreStaleSourcedCommitsFunc) PushReturn(r0 []dbstore.SourcedCommits, r1 error)</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreStaleSourcedCommitsFunc) PushReturn(r0 []dbstore.SourcedCommits, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreStaleSourcedCommitsFunc.nextHook" href="#DBStoreStaleSourcedCommitsFunc.nextHook">func (f *DBStoreStaleSourcedCommitsFunc) nextHook() func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error)</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFunc.nextHook
```

```Go
func (f *DBStoreStaleSourcedCommitsFunc) nextHook() func(context.Context, time.Duration, int, time.Time) ([]dbstore.SourcedCommits, error)
```

#### <a id="DBStoreStaleSourcedCommitsFunc.appendCall" href="#DBStoreStaleSourcedCommitsFunc.appendCall">func (f *DBStoreStaleSourcedCommitsFunc) appendCall(r0 DBStoreStaleSourcedCommitsFuncCall)</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFunc.appendCall
```

```Go
func (f *DBStoreStaleSourcedCommitsFunc) appendCall(r0 DBStoreStaleSourcedCommitsFuncCall)
```

#### <a id="DBStoreStaleSourcedCommitsFunc.History" href="#DBStoreStaleSourcedCommitsFunc.History">func (f *DBStoreStaleSourcedCommitsFunc) History() []DBStoreStaleSourcedCommitsFuncCall</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFunc.History
tags: [exported]
```

```Go
func (f *DBStoreStaleSourcedCommitsFunc) History() []DBStoreStaleSourcedCommitsFuncCall
```

History returns a sequence of DBStoreStaleSourcedCommitsFuncCall objects describing the invocations of this function. 

### <a id="DBStoreStaleSourcedCommitsFuncCall" href="#DBStoreStaleSourcedCommitsFuncCall">type DBStoreStaleSourcedCommitsFuncCall struct</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFuncCall
tags: [exported]
```

```Go
type DBStoreStaleSourcedCommitsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 time.Duration
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 int
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []dbstore.SourcedCommits
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreStaleSourcedCommitsFuncCall is an object that describes an invocation of method StaleSourcedCommits on an instance of MockDBStore. 

#### <a id="DBStoreStaleSourcedCommitsFuncCall.Args" href="#DBStoreStaleSourcedCommitsFuncCall.Args">func (c DBStoreStaleSourcedCommitsFuncCall) Args() []interface{}</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreStaleSourcedCommitsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreStaleSourcedCommitsFuncCall.Results" href="#DBStoreStaleSourcedCommitsFuncCall.Results">func (c DBStoreStaleSourcedCommitsFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreStaleSourcedCommitsFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreStaleSourcedCommitsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreTransactFunc" href="#DBStoreTransactFunc">type DBStoreTransactFunc struct</a>

```
searchKey: janitor.DBStoreTransactFunc
tags: [exported]
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
searchKey: janitor.DBStoreTransactFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))
```

SetDefaultHook sets function that is called when the Transact method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreTransactFunc.PushHook" href="#DBStoreTransactFunc.PushHook">func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))</a>

```
searchKey: janitor.DBStoreTransactFunc.PushHook
tags: [exported]
```

```Go
func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Transact method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreTransactFunc.SetDefaultReturn" href="#DBStoreTransactFunc.SetDefaultReturn">func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)</a>

```
searchKey: janitor.DBStoreTransactFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.PushReturn" href="#DBStoreTransactFunc.PushReturn">func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)</a>

```
searchKey: janitor.DBStoreTransactFunc.PushReturn
tags: [exported]
```

```Go
func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.nextHook" href="#DBStoreTransactFunc.nextHook">func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)</a>

```
searchKey: janitor.DBStoreTransactFunc.nextHook
```

```Go
func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)
```

#### <a id="DBStoreTransactFunc.appendCall" href="#DBStoreTransactFunc.appendCall">func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)</a>

```
searchKey: janitor.DBStoreTransactFunc.appendCall
```

```Go
func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)
```

#### <a id="DBStoreTransactFunc.History" href="#DBStoreTransactFunc.History">func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall</a>

```
searchKey: janitor.DBStoreTransactFunc.History
tags: [exported]
```

```Go
func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall
```

History returns a sequence of DBStoreTransactFuncCall objects describing the invocations of this function. 

### <a id="DBStoreTransactFuncCall" href="#DBStoreTransactFuncCall">type DBStoreTransactFuncCall struct</a>

```
searchKey: janitor.DBStoreTransactFuncCall
tags: [exported]
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
searchKey: janitor.DBStoreTransactFuncCall.Args
tags: [exported]
```

```Go
func (c DBStoreTransactFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreTransactFuncCall.Results" href="#DBStoreTransactFuncCall.Results">func (c DBStoreTransactFuncCall) Results() []interface{}</a>

```
searchKey: janitor.DBStoreTransactFuncCall.Results
tags: [exported]
```

```Go
func (c DBStoreTransactFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockLSIFStore" href="#MockLSIFStore">type MockLSIFStore struct</a>

```
searchKey: janitor.MockLSIFStore
tags: [exported]
```

```Go
type MockLSIFStore struct {
	// ClearFunc is an instance of a mock function object controlling the
	// behavior of the method Clear.
	ClearFunc *LSIFStoreClearFunc
}
```

MockLSIFStore is a mock implementation of the LSIFStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/janitor) used for unit testing. 

#### <a id="NewMockLSIFStore" href="#NewMockLSIFStore">func NewMockLSIFStore() *MockLSIFStore</a>

```
searchKey: janitor.NewMockLSIFStore
tags: [exported]
```

```Go
func NewMockLSIFStore() *MockLSIFStore
```

NewMockLSIFStore creates a new mock of the LSIFStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockLSIFStoreFrom" href="#NewMockLSIFStoreFrom">func NewMockLSIFStoreFrom(i LSIFStore) *MockLSIFStore</a>

```
searchKey: janitor.NewMockLSIFStoreFrom
tags: [exported]
```

```Go
func NewMockLSIFStoreFrom(i LSIFStore) *MockLSIFStore
```

NewMockLSIFStoreFrom creates a new mock of the MockLSIFStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockLSIFStore.Clear" href="#MockLSIFStore.Clear">func (m *MockLSIFStore) Clear(v0 context.Context, v1 ...int) error</a>

```
searchKey: janitor.MockLSIFStore.Clear
tags: [exported]
```

```Go
func (m *MockLSIFStore) Clear(v0 context.Context, v1 ...int) error
```

Clear delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="LSIFStoreClearFunc" href="#LSIFStoreClearFunc">type LSIFStoreClearFunc struct</a>

```
searchKey: janitor.LSIFStoreClearFunc
tags: [exported]
```

```Go
type LSIFStoreClearFunc struct {
	defaultHook func(context.Context, ...int) error
	hooks       []func(context.Context, ...int) error
	history     []LSIFStoreClearFuncCall
	mutex       sync.Mutex
}
```

LSIFStoreClearFunc describes the behavior when the Clear method of the parent MockLSIFStore instance is invoked. 

#### <a id="LSIFStoreClearFunc.SetDefaultHook" href="#LSIFStoreClearFunc.SetDefaultHook">func (f *LSIFStoreClearFunc) SetDefaultHook(hook func(context.Context, ...int) error)</a>

```
searchKey: janitor.LSIFStoreClearFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *LSIFStoreClearFunc) SetDefaultHook(hook func(context.Context, ...int) error)
```

SetDefaultHook sets function that is called when the Clear method of the parent MockLSIFStore instance is invoked and the hook queue is empty. 

#### <a id="LSIFStoreClearFunc.PushHook" href="#LSIFStoreClearFunc.PushHook">func (f *LSIFStoreClearFunc) PushHook(hook func(context.Context, ...int) error)</a>

```
searchKey: janitor.LSIFStoreClearFunc.PushHook
tags: [exported]
```

```Go
func (f *LSIFStoreClearFunc) PushHook(hook func(context.Context, ...int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Clear method of the parent MockLSIFStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LSIFStoreClearFunc.SetDefaultReturn" href="#LSIFStoreClearFunc.SetDefaultReturn">func (f *LSIFStoreClearFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: janitor.LSIFStoreClearFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *LSIFStoreClearFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreClearFunc.PushReturn" href="#LSIFStoreClearFunc.PushReturn">func (f *LSIFStoreClearFunc) PushReturn(r0 error)</a>

```
searchKey: janitor.LSIFStoreClearFunc.PushReturn
tags: [exported]
```

```Go
func (f *LSIFStoreClearFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LSIFStoreClearFunc.nextHook" href="#LSIFStoreClearFunc.nextHook">func (f *LSIFStoreClearFunc) nextHook() func(context.Context, ...int) error</a>

```
searchKey: janitor.LSIFStoreClearFunc.nextHook
```

```Go
func (f *LSIFStoreClearFunc) nextHook() func(context.Context, ...int) error
```

#### <a id="LSIFStoreClearFunc.appendCall" href="#LSIFStoreClearFunc.appendCall">func (f *LSIFStoreClearFunc) appendCall(r0 LSIFStoreClearFuncCall)</a>

```
searchKey: janitor.LSIFStoreClearFunc.appendCall
```

```Go
func (f *LSIFStoreClearFunc) appendCall(r0 LSIFStoreClearFuncCall)
```

#### <a id="LSIFStoreClearFunc.History" href="#LSIFStoreClearFunc.History">func (f *LSIFStoreClearFunc) History() []LSIFStoreClearFuncCall</a>

```
searchKey: janitor.LSIFStoreClearFunc.History
tags: [exported]
```

```Go
func (f *LSIFStoreClearFunc) History() []LSIFStoreClearFuncCall
```

History returns a sequence of LSIFStoreClearFuncCall objects describing the invocations of this function. 

### <a id="LSIFStoreClearFuncCall" href="#LSIFStoreClearFuncCall">type LSIFStoreClearFuncCall struct</a>

```
searchKey: janitor.LSIFStoreClearFuncCall
tags: [exported]
```

```Go
type LSIFStoreClearFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is a slice containing the values of the variadic arguments
	// passed to this method invocation.
	Arg1 []int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

LSIFStoreClearFuncCall is an object that describes an invocation of method Clear on an instance of MockLSIFStore. 

#### <a id="LSIFStoreClearFuncCall.Args" href="#LSIFStoreClearFuncCall.Args">func (c LSIFStoreClearFuncCall) Args() []interface{}</a>

```
searchKey: janitor.LSIFStoreClearFuncCall.Args
tags: [exported]
```

```Go
func (c LSIFStoreClearFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. The variadic slice argument is flattened in this array such that one positional argument and three variadic arguments would result in a slice of four, not two. 

#### <a id="LSIFStoreClearFuncCall.Results" href="#LSIFStoreClearFuncCall.Results">func (c LSIFStoreClearFuncCall) Results() []interface{}</a>

```
searchKey: janitor.LSIFStoreClearFuncCall.Results
tags: [exported]
```

```Go
func (c LSIFStoreClearFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="metrics" href="#metrics">type metrics struct</a>

```
searchKey: janitor.metrics
```

```Go
type metrics struct {
	numUploadRecordsRemoved prometheus.Counter
	numIndexRecordsRemoved  prometheus.Counter
	numUploadsPurged        prometheus.Counter
	numUploadResets         prometheus.Counter
	numUploadResetFailures  prometheus.Counter
	numIndexResets          prometheus.Counter
	numIndexResetFailures   prometheus.Counter
	numErrors               prometheus.Counter
}
```

#### <a id="newMetrics" href="#newMetrics">func newMetrics(observationContext *observation.Context) *metrics</a>

```
searchKey: janitor.newMetrics
```

```Go
func newMetrics(observationContext *observation.Context) *metrics
```

### <a id="recordExpirer" href="#recordExpirer">type recordExpirer struct</a>

```
searchKey: janitor.recordExpirer
```

```Go
type recordExpirer struct {
	dbStore DBStore
	ttl     time.Duration
	metrics *metrics
}
```

#### <a id="recordExpirer.Handle" href="#recordExpirer.Handle">func (e *recordExpirer) Handle(ctx context.Context) error</a>

```
searchKey: janitor.recordExpirer.Handle
```

```Go
func (e *recordExpirer) Handle(ctx context.Context) error
```

#### <a id="recordExpirer.HandleError" href="#recordExpirer.HandleError">func (e *recordExpirer) HandleError(err error)</a>

```
searchKey: janitor.recordExpirer.HandleError
```

```Go
func (e *recordExpirer) HandleError(err error)
```

### <a id="unknownCommitJanitor" href="#unknownCommitJanitor">type unknownCommitJanitor struct</a>

```
searchKey: janitor.unknownCommitJanitor
```

```Go
type unknownCommitJanitor struct {
	dbStore                   DBStore
	metrics                   *metrics
	minimumTimeSinceLastCheck time.Duration
	batchSize                 int
	clock                     glock.Clock
}
```

#### <a id="newJanitor" href="#newJanitor">func newJanitor(dbStore DBStore,...</a>

```
searchKey: janitor.newJanitor
```

```Go
func newJanitor(
	dbStore DBStore,
	minimumTimeSinceLastCheck time.Duration,
	batchSize int,
	metrics *metrics,
	clock glock.Clock,
) *unknownCommitJanitor
```

#### <a id="unknownCommitJanitor.Handle" href="#unknownCommitJanitor.Handle">func (j *unknownCommitJanitor) Handle(ctx context.Context) (err error)</a>

```
searchKey: janitor.unknownCommitJanitor.Handle
```

```Go
func (j *unknownCommitJanitor) Handle(ctx context.Context) (err error)
```

#### <a id="unknownCommitJanitor.HandleError" href="#unknownCommitJanitor.HandleError">func (j *unknownCommitJanitor) HandleError(err error)</a>

```
searchKey: janitor.unknownCommitJanitor.HandleError
```

```Go
func (j *unknownCommitJanitor) HandleError(err error)
```

#### <a id="unknownCommitJanitor.handleSourcedCommits" href="#unknownCommitJanitor.handleSourcedCommits">func (j *unknownCommitJanitor) handleSourcedCommits(ctx context.Context, tx DBStore, sourcedCommits dbstore.SourcedCommits) error</a>

```
searchKey: janitor.unknownCommitJanitor.handleSourcedCommits
```

```Go
func (j *unknownCommitJanitor) handleSourcedCommits(ctx context.Context, tx DBStore, sourcedCommits dbstore.SourcedCommits) error
```

#### <a id="unknownCommitJanitor.handleCommit" href="#unknownCommitJanitor.handleCommit">func (j *unknownCommitJanitor) handleCommit(ctx context.Context, tx DBStore, repositoryID int, repositoryName, commit string) error</a>

```
searchKey: janitor.unknownCommitJanitor.handleCommit
```

```Go
func (j *unknownCommitJanitor) handleCommit(ctx context.Context, tx DBStore, repositoryID int, repositoryName, commit string) error
```

### <a id="refreshCommitResolvabilityFuncInvocation" href="#refreshCommitResolvabilityFuncInvocation">type refreshCommitResolvabilityFuncInvocation struct</a>

```
searchKey: janitor.refreshCommitResolvabilityFuncInvocation
```

```Go
type refreshCommitResolvabilityFuncInvocation struct {
	RepositoryID int
	Commit       string
	Delete       bool
}
```

## <a id="func" href="#func">Functions</a>

### <a id="NewAbandonedUploadJanitor" href="#NewAbandonedUploadJanitor">func NewAbandonedUploadJanitor(dbStore DBStore, ttl, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine</a>

```
searchKey: janitor.NewAbandonedUploadJanitor
tags: [exported]
```

```Go
func NewAbandonedUploadJanitor(dbStore DBStore, ttl, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine
```

NewAbandonedUploadJanitor returns a background routine that periodically removes upload records which have not left the uploading state within the given TTL. 

### <a id="NewDeletedRepositoryJanitor" href="#NewDeletedRepositoryJanitor">func NewDeletedRepositoryJanitor(dbStore DBStore, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine</a>

```
searchKey: janitor.NewDeletedRepositoryJanitor
tags: [exported]
```

```Go
func NewDeletedRepositoryJanitor(dbStore DBStore, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine
```

NewDeletedRepositoryJanitor returns a background routine that periodically deletes upload and index records for repositories that have been soft-deleted. 

### <a id="gatherCounts" href="#gatherCounts">func gatherCounts(uploadsCounts, indexesCounts map[int]int) []recordCount</a>

```
searchKey: janitor.gatherCounts
```

```Go
func gatherCounts(uploadsCounts, indexesCounts map[int]int) []recordCount
```

### <a id="NewHardDeleter" href="#NewHardDeleter">func NewHardDeleter(dbStore DBStore, lsifStore LSIFStore, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine</a>

```
searchKey: janitor.NewHardDeleter
tags: [exported]
```

```Go
func NewHardDeleter(dbStore DBStore, lsifStore LSIFStore, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine
```

NewHardDeleter returns a background routine that periodically hard-deletes all soft-deleted upload records. Each upload record marked as soft-deleted in the database will have its associated data in the code intel deleted, and the upload record hard-deleted. 

This cleanup routine subsumes an old routine that would remove any records which did not have an associated upload record. Doing a soft-delete and a transactional cleanup routine instead ensures we delete unreachable data as soon as it's no longer referenceable. 

### <a id="uploadIDs" href="#uploadIDs">func uploadIDs(uploads []store.Upload) []int</a>

```
searchKey: janitor.uploadIDs
```

```Go
func uploadIDs(uploads []store.Upload) []int
```

### <a id="NewRecordExpirer" href="#NewRecordExpirer">func NewRecordExpirer(dbStore DBStore, ttl, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine</a>

```
searchKey: janitor.NewRecordExpirer
tags: [exported]
```

```Go
func NewRecordExpirer(dbStore DBStore, ttl, interval time.Duration, metrics *metrics) goroutine.BackgroundRoutine
```

NewRecordExpirer returns a background routine that periodically removes upload and index records that are older than the given TTL. Upload records which have valid LSIF data (not just a historic upload failure record) will only be deleted if it is not visible at the tip of its repository's default branch. 

### <a id="NewUploadResetter" href="#NewUploadResetter">func NewUploadResetter(s dbworkerstore.Store, interval time.Duration, metrics *metrics, observationContext *observation.Context) *dbworker.Resetter</a>

```
searchKey: janitor.NewUploadResetter
tags: [exported]
```

```Go
func NewUploadResetter(s dbworkerstore.Store, interval time.Duration, metrics *metrics, observationContext *observation.Context) *dbworker.Resetter
```

NewUploadResetter returns a background routine that periodically resets upload records that are marked as being processed but are no longer held by any Postgres transaction. 

### <a id="NewIndexResetter" href="#NewIndexResetter">func NewIndexResetter(s dbworkerstore.Store, interval time.Duration, metrics *metrics, observationContext *observation.Context) *dbworker.Resetter</a>

```
searchKey: janitor.NewIndexResetter
tags: [exported]
```

```Go
func NewIndexResetter(s dbworkerstore.Store, interval time.Duration, metrics *metrics, observationContext *observation.Context) *dbworker.Resetter
```

NewIndexResetter returns a background routine that periodically resets index records that are marked as being processed but are no longer held by any Postgres transaction. 

### <a id="NewUnknownCommitJanitor" href="#NewUnknownCommitJanitor">func NewUnknownCommitJanitor(dbStore DBStore,...</a>

```
searchKey: janitor.NewUnknownCommitJanitor
tags: [exported]
```

```Go
func NewUnknownCommitJanitor(
	dbStore DBStore,
	minimumTimeSinceLastCheck time.Duration,
	batchSize int,
	interval time.Duration,
	metrics *metrics,
) goroutine.BackgroundRoutine
```

NewUnknownCommitJanitor returns a background routine that periodically resolves each commit known by code intelligence data via gitserver to ensure that it has not been force-pushed away or pruned from the gitserver clone. 

Note that we're rather cautious about the order that we process the batch. We do this so that two frontends performing the same migration will not try to update two of the same records in the opposite order. If we rely on map iteration order we tend to see a lot of Postgres deadlock conditions and very slow progress. 

### <a id="isRepositoryNotFound" href="#isRepositoryNotFound">func isRepositoryNotFound(err error) bool</a>

```
searchKey: janitor.isRepositoryNotFound
```

```Go
func isRepositoryNotFound(err error) bool
```

### <a id="isRevisionNotFound" href="#isRevisionNotFound">func isRevisionNotFound(err error) bool</a>

```
searchKey: janitor.isRevisionNotFound
```

```Go
func isRevisionNotFound(err error) bool
```

### <a id="TestUnknownCommitsJanitor" href="#TestUnknownCommitsJanitor">func TestUnknownCommitsJanitor(t *testing.T)</a>

```
searchKey: janitor.TestUnknownCommitsJanitor
```

```Go
func TestUnknownCommitsJanitor(t *testing.T)
```

### <a id="TestUnknownCommitsJanitorUnknownCommit" href="#TestUnknownCommitsJanitorUnknownCommit">func TestUnknownCommitsJanitorUnknownCommit(t *testing.T)</a>

```
searchKey: janitor.TestUnknownCommitsJanitorUnknownCommit
```

```Go
func TestUnknownCommitsJanitorUnknownCommit(t *testing.T)
```

### <a id="TestUnknownCommitsJanitorUnknownRepository" href="#TestUnknownCommitsJanitorUnknownRepository">func TestUnknownCommitsJanitorUnknownRepository(t *testing.T)</a>

```
searchKey: janitor.TestUnknownCommitsJanitorUnknownRepository
```

```Go
func TestUnknownCommitsJanitorUnknownRepository(t *testing.T)
```

### <a id="testUnknownCommitsJanitor" href="#testUnknownCommitsJanitor">func testUnknownCommitsJanitor(t *testing.T, resolveRevisionFunc func(commit string) error, expectedCalls []refreshCommitResolvabilityFuncInvocation)</a>

```
searchKey: janitor.testUnknownCommitsJanitor
```

```Go
func testUnknownCommitsJanitor(t *testing.T, resolveRevisionFunc func(commit string) error, expectedCalls []refreshCommitResolvabilityFuncInvocation)
```

