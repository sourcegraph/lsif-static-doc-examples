# Package dbstore

## Index

* Subpages
  * [enterprise/internal/codeintel/stores/dbstore/migration](dbstore/migration.md)
* [Constants](#const)
    * [const hasRepositoryQuery](#hasRepositoryQuery)
    * [const hasCommitQuery](#hasCommitQuery)
    * [const markRepositoryAsDirtyQuery](#markRepositoryAsDirtyQuery)
    * [const dirtyRepositoriesQuery](#dirtyRepositoriesQuery)
    * [const commitGraphQuery](#commitGraphQuery)
    * [const calculateVisibleUploadsCommitGraphQuery](#calculateVisibleUploadsCommitGraphQuery)
    * [const calculateVisibleUploadsDirtyRepositoryQuery](#calculateVisibleUploadsDirtyRepositoryQuery)
    * [const temporaryNearestUploadsTableQuery](#temporaryNearestUploadsTableQuery)
    * [const temporaryNearestUploadsLinksTableQuery](#temporaryNearestUploadsLinksTableQuery)
    * [const temporaryUploadsVisibleAtTipTableQuery](#temporaryUploadsVisibleAtTipTableQuery)
    * [const nearestUploadsInsertQuery](#nearestUploadsInsertQuery)
    * [const nearestUploadsUpdateQuery](#nearestUploadsUpdateQuery)
    * [const nearestUploadsDeleteQuery](#nearestUploadsDeleteQuery)
    * [const nearestUploadsLinksInsertQuery](#nearestUploadsLinksInsertQuery)
    * [const nearestUploadsLinksUpdateQuery](#nearestUploadsLinksUpdateQuery)
    * [const nearestUploadsLinksDeleteQuery](#nearestUploadsLinksDeleteQuery)
    * [const uploadsVisibleAtTipInsertQuery](#uploadsVisibleAtTipInsertQuery)
    * [const uploadsVisibleAtTipDeleteQuery](#uploadsVisibleAtTipDeleteQuery)
    * [const bulkTransferQuery](#bulkTransferQuery)
    * [const insertDependencyIndexingJobQuery](#insertDependencyIndexingJobQuery)
    * [const getDumpsByIDsQuery](#getDumpsByIDsQuery)
    * [const findClosestDumpsQuery](#findClosestDumpsQuery)
    * [const findClosestDumpsFromGraphFragmentCommitGraphQuery](#findClosestDumpsFromGraphFragmentCommitGraphQuery)
    * [const findClosestDumpsFromGraphFragmentQuery](#findClosestDumpsFromGraphFragmentQuery)
    * [const visibleUploadCandidatesQuery](#visibleUploadCandidatesQuery)
    * [const visibleUploadsQuery](#visibleUploadsQuery)
    * [const deleteOverlappingDumpsQuery](#deleteOverlappingDumpsQuery)
    * [const getRepositoriesWithIndexConfigurationQuery](#getRepositoriesWithIndexConfigurationQuery)
    * [const getAutoIndexDisabledRepositoriesQuery](#getAutoIndexDisabledRepositoriesQuery)
    * [const getIndexConfigurationByRepositoryIDQuery](#getIndexConfigurationByRepositoryIDQuery)
    * [const updateIndexConfigurationByRepositoryIDQuery](#updateIndexConfigurationByRepositoryIDQuery)
    * [const indexAssociatedUploadIDQueryFragment](#indexAssociatedUploadIDQueryFragment)
    * [const indexRankQueryFragment](#indexRankQueryFragment)
    * [const getIndexByIDQuery](#getIndexByIDQuery)
    * [const getIndexesByIDsQuery](#getIndexesByIDsQuery)
    * [const getIndexesCountQuery](#getIndexesCountQuery)
    * [const getIndexesQuery](#getIndexesQuery)
    * [const isQueuedQuery](#isQueuedQuery)
    * [const insertIndexQuery](#insertIndexQuery)
    * [const deleteIndexByIDQuery](#deleteIndexByIDQuery)
    * [const deleteIndexesWithoutRepositoryQuery](#deleteIndexesWithoutRepositoryQuery)
    * [const deleteOldIndexesQuery](#deleteOldIndexesQuery)
    * [const staleSourcedCommitsQuery](#staleSourcedCommitsQuery)
    * [const staleSourcedCommitsSubquery](#staleSourcedCommitsSubquery)
    * [const refreshCommitResolvabilityQuery](#refreshCommitResolvabilityQuery)
    * [const updatePackagesTemporaryTableQuery](#updatePackagesTemporaryTableQuery)
    * [const updatePackagesInsertQuery](#updatePackagesInsertQuery)
    * [const updateReferencesTemporaryTableQuery](#updateReferencesTemporaryTableQuery)
    * [const updateReferencesInsertQuery](#updateReferencesInsertQuery)
    * [const repoNameQuery](#repoNameQuery)
    * [const uploadRankQueryFragment](#uploadRankQueryFragment)
    * [const getUploadByIDQuery](#getUploadByIDQuery)
    * [const visibleAtTipSubselectQuery](#visibleAtTipSubselectQuery)
    * [const getUploadsByIDsQuery](#getUploadsByIDsQuery)
    * [const deleteUploadsStuckUploadingQuery](#deleteUploadsStuckUploadingQuery)
    * [const getUploadsCountQuery](#getUploadsCountQuery)
    * [const getUploadsQuery](#getUploadsQuery)
    * [const insertUploadQuery](#insertUploadQuery)
    * [const addUploadPartQuery](#addUploadPartQuery)
    * [const markQueuedQuery](#markQueuedQuery)
    * [const markFailedQuery](#markFailedQuery)
    * [const deleteUploadByIDQuery](#deleteUploadByIDQuery)
    * [const DeletedRepositoryGracePeriod](#DeletedRepositoryGracePeriod)
    * [const deleteUploadsWithoutRepositoryQuery](#deleteUploadsWithoutRepositoryQuery)
    * [const hardDeleteUploadByIDQuery](#hardDeleteUploadByIDQuery)
    * [const softDeleteOldUploadsQuery](#softDeleteOldUploadsQuery)
    * [const getOldestCommitDateQuery](#getOldestCommitDateQuery)
    * [const updateCommitedAtQuery](#updateCommitedAtQuery)
    * [const StalledUploadMaxAge](#StalledUploadMaxAge)
    * [const UploadMaxNumResets](#UploadMaxNumResets)
    * [const StalledIndexMaxAge](#StalledIndexMaxAge)
    * [const IndexMaxNumResets](#IndexMaxNumResets)
    * [const StalledDependencyIndexingJobMaxAge](#StalledDependencyIndexingJobMaxAge)
    * [const DependencyIndexingJobMaxNumResets](#DependencyIndexingJobMaxNumResets)
    * [const DefinitionDumpsLimit](#DefinitionDumpsLimit)
    * [const definitionDumpsQuery](#definitionDumpsQuery)
    * [const referenceIDsAndFiltersCTEDefinitions](#referenceIDsAndFiltersCTEDefinitions)
    * [const referenceIDsAndFiltersBaseQuery](#referenceIDsAndFiltersBaseQuery)
    * [const referenceIDsAndFiltersQuery](#referenceIDsAndFiltersQuery)
    * [const referenceIDsAndFiltersCountQuery](#referenceIDsAndFiltersCountQuery)
    * [const referencesForUploadQuery](#referencesForUploadQuery)
* [Variables](#var)
    * [var dependencyIndexingJobColumns](#dependencyIndexingJobColumns)
    * [var ErrNotTransactable](#ErrNotTransactable)
    * [var ErrNoTransaction](#ErrNoTransaction)
    * [var ErrDequeueTransaction](#ErrDequeueTransaction)
    * [var ErrDequeueRace](#ErrDequeueRace)
    * [var ErrNoSavepoint](#ErrNoSavepoint)
    * [var ErrUnknownRepository](#ErrUnknownRepository)
    * [var ErrIllegalLimit](#ErrIllegalLimit)
    * [var ScanFirstIndexRecord](#ScanFirstIndexRecord)
    * [var indexColumnsWithNullRank](#indexColumnsWithNullRank)
    * [var IndexColumnsWithNullRank](#IndexColumnsWithNullRank)
    * [var uploadColumnsWithNullRank](#uploadColumnsWithNullRank)
    * [var uploadWorkerStoreOptions](#uploadWorkerStoreOptions)
    * [var indexWorkerStoreOptions](#indexWorkerStoreOptions)
    * [var dependencyIndexingJobWorkerStoreOptions](#dependencyIndexingJobWorkerStoreOptions)
* [Types](#type)
    * [type uploadMetaListSerializer struct](#uploadMetaListSerializer)
        * [func NewUploadMetaListSerializer() *uploadMetaListSerializer](#NewUploadMetaListSerializer)
        * [func (s *uploadMetaListSerializer) Serialize(uploadMetas []commitgraph.UploadMeta) []byte](#uploadMetaListSerializer.Serialize)
        * [func (s *uploadMetaListSerializer) write(uploadMetas []commitgraph.UploadMeta)](#uploadMetaListSerializer.write)
        * [func (s *uploadMetaListSerializer) writeUploadMeta(uploadMeta commitgraph.UploadMeta)](#uploadMetaListSerializer.writeUploadMeta)
        * [func (s *uploadMetaListSerializer) writeInteger(value int)](#uploadMetaListSerializer.writeInteger)
        * [func (s *uploadMetaListSerializer) take() []byte](#uploadMetaListSerializer.take)
    * [type sanitizedCommitInput struct](#sanitizedCommitInput)
        * [func sanitizeCommitInput(ctx context.Context, graph *commitgraph.Graph, tipCommit string) *sanitizedCommitInput](#sanitizeCommitInput)
    * [type DependencyIndexingJob struct](#DependencyIndexingJob)
        * [func scanFirstDependencyIndexingJob(rows *sql.Rows, err error) (DependencyIndexingJob, bool, error)](#scanFirstDependencyIndexingJob)
        * [func (u DependencyIndexingJob) RecordID() int](#DependencyIndexingJob.RecordID)
    * [type DockerStep struct](#DockerStep)
        * [func (s *DockerStep) Scan(value interface{}) error](#DockerStep.Scan)
        * [func (s DockerStep) Value() (driver.Value, error)](#DockerStep.Value)
    * [type Dump struct](#Dump)
    * [type IndexConfiguration struct](#IndexConfiguration)
        * [func scanFirstIndexConfiguration(rows *sql.Rows, err error) (IndexConfiguration, bool, error)](#scanFirstIndexConfiguration)
    * [type Index struct](#Index)
        * [func scanFirstIndex(rows *sql.Rows, err error) (Index, bool, error)](#scanFirstIndex)
        * [func (i Index) RecordID() int](#Index.RecordID)
    * [type GetIndexesOptions struct](#GetIndexesOptions)
    * [type SourcedCommits struct](#SourcedCommits)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
    * [type Store struct](#Store)
        * [func NewWithDB(db dbutil.DB, observationContext *observation.Context) *Store](#NewWithDB)
        * [func testStore(db dbutil.DB) *Store](#testStore)
        * [func (s *Store) HasRepository(ctx context.Context, repositoryID int) (_ bool, err error)](#Store.HasRepository)
        * [func (s *Store) HasCommit(ctx context.Context, repositoryID int, commit string) (_ bool, err error)](#Store.HasCommit)
        * [func (s *Store) MarkRepositoryAsDirty(ctx context.Context, repositoryID int) (err error)](#Store.MarkRepositoryAsDirty)
        * [func (s *Store) DirtyRepositories(ctx context.Context) (_ map[int]int, err error)](#Store.DirtyRepositories)
        * [func (s *Store) CommitGraphMetadata(ctx context.Context, repositoryID int) (stale bool, updatedAt *time.Time, err error)](#Store.CommitGraphMetadata)
        * [func (s *Store) CalculateVisibleUploads(ctx context.Context, repositoryID int, commitGraph *gitserver.CommitGraph, tipCommit string, dirtyToken int, now time.Time) (err error)](#Store.CalculateVisibleUploads)
        * [func (s *Store) writeVisibleUploads(ctx context.Context, sanitizedInput *sanitizedCommitInput) (err error)](#Store.writeVisibleUploads)
        * [func (s *Store) createTemporaryNearestUploadsTables(ctx context.Context) error](#Store.createTemporaryNearestUploadsTables)
        * [func (s *Store) persistNearestUploads(ctx context.Context, repositoryID int) (err error)](#Store.persistNearestUploads)
        * [func (s *Store) persistNearestUploadsLinks(ctx context.Context, repositoryID int) (err error)](#Store.persistNearestUploadsLinks)
        * [func (s *Store) persistUploadsVisibleAtTip(ctx context.Context, repositoryID int) (err error)](#Store.persistUploadsVisibleAtTip)
        * [func (s *Store) bulkTransfer(ctx context.Context, insertQuery, updateQuery, deleteQuery *sqlf.Query) (rowsInserted int, rowsUpdated int, rowsDeleted int, err error)](#Store.bulkTransfer)
        * [func (s *Store) InsertDependencyIndexingJob(ctx context.Context, uploadID int) (id int, err error)](#Store.InsertDependencyIndexingJob)
        * [func (s *Store) GetDumpsByIDs(ctx context.Context, ids []int) (_ []Dump, err error)](#Store.GetDumpsByIDs)
        * [func (s *Store) FindClosestDumps(ctx context.Context, repositoryID int, commit, path string, rootMustEnclosePath bool, indexer string) (_ []Dump, err error)](#Store.FindClosestDumps)
        * [func (s *Store) FindClosestDumpsFromGraphFragment(ctx context.Context, repositoryID int, commit, path string, rootMustEnclosePath bool, indexer string, commitGraph *gitserver.CommitGraph) (_ []Dump, err error)](#Store.FindClosestDumpsFromGraphFragment)
        * [func (s *Store) DeleteOverlappingDumps(ctx context.Context, repositoryID int, commit, root, indexer string) (err error)](#Store.DeleteOverlappingDumps)
        * [func (s *Store) GetRepositoriesWithIndexConfiguration(ctx context.Context) (_ []int, err error)](#Store.GetRepositoriesWithIndexConfiguration)
        * [func (s *Store) GetAutoindexDisabledRepositories(ctx context.Context) (_ []int, err error)](#Store.GetAutoindexDisabledRepositories)
        * [func (s *Store) GetIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int) (_ IndexConfiguration, _ bool, err error)](#Store.GetIndexConfigurationByRepositoryID)
        * [func (s *Store) UpdateIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int, data []byte) (err error)](#Store.UpdateIndexConfigurationByRepositoryID)
        * [func (s *Store) GetIndexByID(ctx context.Context, id int) (_ Index, _ bool, err error)](#Store.GetIndexByID)
        * [func (s *Store) GetIndexesByIDs(ctx context.Context, ids ...int) (_ []Index, err error)](#Store.GetIndexesByIDs)
        * [func (s *Store) GetIndexes(ctx context.Context, opts GetIndexesOptions) (_ []Index, _ int, err error)](#Store.GetIndexes)
        * [func (s *Store) IsQueued(ctx context.Context, repositoryID int, commit string) (_ bool, err error)](#Store.IsQueued)
        * [func (s *Store) InsertIndex(ctx context.Context, index Index) (id int, err error)](#Store.InsertIndex)
        * [func (s *Store) DeleteIndexByID(ctx context.Context, id int) (_ bool, err error)](#Store.DeleteIndexByID)
        * [func (s *Store) DeleteIndexesWithoutRepository(ctx context.Context, now time.Time) (_ map[int]int, err error)](#Store.DeleteIndexesWithoutRepository)
        * [func (s *Store) DeleteOldIndexes(ctx context.Context, maxAge time.Duration, now time.Time) (count int, err error)](#Store.DeleteOldIndexes)
        * [func (s *Store) StaleSourcedCommits(ctx context.Context, minimumTimeSinceLastCheck time.Duration, limit int, now time.Time) (_ []SourcedCommits, err error)](#Store.StaleSourcedCommits)
        * [func (s *Store) RefreshCommitResolvability(ctx context.Context, repositoryID int, commit string, delete bool, now time.Time) (uploadsUpdated int, indexesUpdated int, err error)](#Store.RefreshCommitResolvability)
        * [func (s *Store) UpdatePackages(ctx context.Context, dumpID int, packages []semantic.Package) (err error)](#Store.UpdatePackages)
        * [func (s *Store) UpdatePackageReferences(ctx context.Context, dumpID int, references []semantic.PackageReference) (err error)](#Store.UpdatePackageReferences)
        * [func (s *Store) RepoName(ctx context.Context, repositoryID int) (_ string, err error)](#Store.RepoName)
        * [func (s *Store) With(other basestore.ShareableStore) *Store](#Store.With)
        * [func (s *Store) Transact(ctx context.Context) (*Store, error)](#Store.Transact)
        * [func (s *Store) transact(ctx context.Context) (*Store, error)](#Store.transact)
        * [func (s *Store) GetUploadByID(ctx context.Context, id int) (_ Upload, _ bool, err error)](#Store.GetUploadByID)
        * [func (s *Store) GetUploadsByIDs(ctx context.Context, ids ...int) (_ []Upload, err error)](#Store.GetUploadsByIDs)
        * [func (s *Store) DeleteUploadsStuckUploading(ctx context.Context, uploadedBefore time.Time) (_ int, err error)](#Store.DeleteUploadsStuckUploading)
        * [func (s *Store) GetUploads(ctx context.Context, opts GetUploadsOptions) (_ []Upload, _ int, err error)](#Store.GetUploads)
        * [func (s *Store) InsertUpload(ctx context.Context, upload Upload) (id int, err error)](#Store.InsertUpload)
        * [func (s *Store) AddUploadPart(ctx context.Context, uploadID, partIndex int) (err error)](#Store.AddUploadPart)
        * [func (s *Store) MarkQueued(ctx context.Context, id int, uploadSize *int64) (err error)](#Store.MarkQueued)
        * [func (s *Store) MarkFailed(ctx context.Context, id int, reason string) (err error)](#Store.MarkFailed)
        * [func (s *Store) DeleteUploadByID(ctx context.Context, id int) (_ bool, err error)](#Store.DeleteUploadByID)
        * [func (s *Store) DeleteUploadsWithoutRepository(ctx context.Context, now time.Time) (_ map[int]int, err error)](#Store.DeleteUploadsWithoutRepository)
        * [func (s *Store) HardDeleteUploadByID(ctx context.Context, ids ...int) (err error)](#Store.HardDeleteUploadByID)
        * [func (s *Store) SoftDeleteOldUploads(ctx context.Context, maxAge time.Duration, now time.Time) (count int, err error)](#Store.SoftDeleteOldUploads)
        * [func (s *Store) GetOldestCommitDate(ctx context.Context, repositoryID int) (_ time.Time, _ bool, err error)](#Store.GetOldestCommitDate)
        * [func (s *Store) UpdateCommitedAt(ctx context.Context, uploadID int, committedAt time.Time) (err error)](#Store.UpdateCommitedAt)
        * [func (s *Store) DefinitionDumps(ctx context.Context, monikers []semantic.QualifiedMonikerData) (_ []Dump, err error)](#Store.DefinitionDumps)
        * [func (s *Store) ReferenceIDsAndFilters(ctx context.Context, repositoryID int, commit string, monikers []semantic.QualifiedMonikerData, limit, offset int) (_ PackageReferenceScanner, _ int, err error)](#Store.ReferenceIDsAndFilters)
        * [func (s *Store) ReferencesForUpload(ctx context.Context, uploadID int) (_ PackageReferenceScanner, err error)](#Store.ReferencesForUpload)
    * [type Upload struct](#Upload)
        * [func scanFirstUpload(rows *sql.Rows, err error) (Upload, bool, error)](#scanFirstUpload)
        * [func dumpToUpload(expected Dump) Upload](#dumpToUpload)
        * [func (u Upload) RecordID() int](#Upload.RecordID)
    * [type GetUploadsOptions struct](#GetUploadsOptions)
    * [type PackageReferenceScanner interface](#PackageReferenceScanner)
        * [func packageReferenceScannerFromRows(rows *sql.Rows) PackageReferenceScanner](#packageReferenceScannerFromRows)
        * [func PackageReferenceScannerFromSlice(references ...lsifstore.PackageReference) PackageReferenceScanner](#PackageReferenceScannerFromSlice)
    * [type rowScanner struct](#rowScanner)
        * [func (s *rowScanner) Next() (reference lsifstore.PackageReference, _ bool, _ error)](#rowScanner.Next)
        * [func (s *rowScanner) Close() error](#rowScanner.Close)
    * [type sliceScanner struct](#sliceScanner)
        * [func (s *sliceScanner) Next() (lsifstore.PackageReference, bool, error)](#sliceScanner.Next)
        * [func (s *sliceScanner) Close() error](#sliceScanner.Close)
    * [type FindClosestDumpsTestCase struct](#FindClosestDumpsTestCase)
    * [type printableRank struct](#printableRank)
        * [func (r printableRank) String() string](#printableRank.String)
* [Functions](#func)
    * [func scanCommitGraphView(rows *sql.Rows, queryErr error) (_ *commitgraph.CommitGraphView, err error)](#scanCommitGraphView)
    * [func scanIntPairs(rows *sql.Rows, queryErr error) (_ map[int]int, err error)](#scanIntPairs)
    * [func scanCommitGraphMetadata(rows *sql.Rows, queryErr error) (updateToken, dirtyToken int, updatedAt *time.Time, _ bool, err error)](#scanCommitGraphMetadata)
    * [func countingWrite(ctx context.Context, ch chan<- []interface{}, counter *uint32, values ...interface{}) bool](#countingWrite)
    * [func scanDependencyIndexingJobs(rows *sql.Rows, queryErr error) (_ []DependencyIndexingJob, err error)](#scanDependencyIndexingJobs)
    * [func scanFirstDependencyIndexingJobRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#scanFirstDependencyIndexingJobRecord)
    * [func scanDumps(rows *sql.Rows, queryErr error) (_ []Dump, err error)](#scanDumps)
    * [func makeVisibleUploadCandidatesQuery(repositoryID int, commits ...string) *sqlf.Query](#makeVisibleUploadCandidatesQuery)
    * [func makeVisibleUploadsQuery(repositoryID int, commit string) *sqlf.Query](#makeVisibleUploadsQuery)
    * [func makeFindClosestDumpConditions(path string, rootMustEnclosePath bool, indexer string) (conds []*sqlf.Query)](#makeFindClosestDumpConditions)
    * [func scanIndexConfigurations(rows *sql.Rows, queryErr error) (_ []IndexConfiguration, err error)](#scanIndexConfigurations)
    * [func scanIndexes(rows *sql.Rows, queryErr error) (_ []Index, err error)](#scanIndexes)
    * [func scanFirstIndexRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#scanFirstIndexRecord)
    * [func makeIndexSearchCondition(term string) *sqlf.Query](#makeIndexSearchCondition)
    * [func ScanSourcedCommits(rows *sql.Rows, queryErr error) (_ []SourcedCommits, err error)](#ScanSourcedCommits)
    * [func loadPackagesChannel(packages []semantic.Package) <-chan []interface{}](#loadPackagesChannel)
    * [func loadReferencesChannel(references []semantic.PackageReference) <-chan []interface{}](#loadReferencesChannel)
    * [func intsToQueries(values []int) []*sqlf.Query](#intsToQueries)
    * [func scanUploads(rows *sql.Rows, queryErr error) (_ []Upload, err error)](#scanUploads)
    * [func scanFirstUploadRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#scanFirstUploadRecord)
    * [func scanCounts(rows *sql.Rows, queryErr error) (_ map[int]int, err error)](#scanCounts)
    * [func makeSearchCondition(term string) *sqlf.Query](#makeSearchCondition)
    * [func intsToString(vs []int) string](#intsToString)
    * [func nilTimeToString(t *time.Time) string](#nilTimeToString)
    * [func WorkerutilUploadStore(s basestore.ShareableStore, observationContext *observation.Context) dbworkerstore.Store](#WorkerutilUploadStore)
    * [func WorkerutilIndexStore(s basestore.ShareableStore, observationContext *observation.Context) dbworkerstore.Store](#WorkerutilIndexStore)
    * [func WorkerutilDependencyIndexingJobStore(s basestore.ShareableStore, observationContext *observation.Context) dbworkerstore.Store](#WorkerutilDependencyIndexingJobStore)
    * [func monikersToString(vs []semantic.QualifiedMonikerData) string](#monikersToString)
    * [func TestHasRepository(t *testing.T)](#TestHasRepository)
    * [func TestHasCommit(t *testing.T)](#TestHasCommit)
    * [func TestMarkRepositoryAsDirty(t *testing.T)](#TestMarkRepositoryAsDirty)
    * [func TestSkipsDeletedRepositories(t *testing.T)](#TestSkipsDeletedRepositories)
    * [func TestCommitGraphMetadata(t *testing.T)](#TestCommitGraphMetadata)
    * [func TestCalculateVisibleUploads(t *testing.T)](#TestCalculateVisibleUploads)
    * [func TestCalculateVisibleUploadsAlternateCommitGraph(t *testing.T)](#TestCalculateVisibleUploadsAlternateCommitGraph)
    * [func TestCalculateVisibleUploadsDistinctRoots(t *testing.T)](#TestCalculateVisibleUploadsDistinctRoots)
    * [func TestCalculateVisibleUploadsOverlappingRoots(t *testing.T)](#TestCalculateVisibleUploadsOverlappingRoots)
    * [func TestCalculateVisibleUploadsIndexerName(t *testing.T)](#TestCalculateVisibleUploadsIndexerName)
    * [func TestCalculateVisibleUploadsResetsDirtyFlag(t *testing.T)](#TestCalculateVisibleUploadsResetsDirtyFlag)
    * [func keysOf(m map[string][]int) (keys []string)](#keysOf)
    * [func BenchmarkCalculateVisibleUploads(b *testing.B)](#BenchmarkCalculateVisibleUploads)
    * [func readBenchmarkCommitGraph() (*gitserver.CommitGraph, error)](#readBenchmarkCommitGraph)
    * [func readBenchmarkCommitGraphView() ([]Upload, error)](#readBenchmarkCommitGraphView)
    * [func readBenchmarkFile(path string) ([]byte, error)](#readBenchmarkFile)
    * [func TestInsertDependencyIndexingJob(t *testing.T)](#TestInsertDependencyIndexingJob)
    * [func TestGetDumpsByIDs(t *testing.T)](#TestGetDumpsByIDs)
    * [func TestFindClosestDumps(t *testing.T)](#TestFindClosestDumps)
    * [func TestFindClosestDumpsAlternateCommitGraph(t *testing.T)](#TestFindClosestDumpsAlternateCommitGraph)
    * [func TestFindClosestDumpsAlternateCommitGraphWithOverwrittenVisibleUploads(t *testing.T)](#TestFindClosestDumpsAlternateCommitGraphWithOverwrittenVisibleUploads)
    * [func TestFindClosestDumpsDistinctRoots(t *testing.T)](#TestFindClosestDumpsDistinctRoots)
    * [func TestFindClosestDumpsOverlappingRoots(t *testing.T)](#TestFindClosestDumpsOverlappingRoots)
    * [func TestFindClosestDumpsIndexerName(t *testing.T)](#TestFindClosestDumpsIndexerName)
    * [func TestFindClosestDumpsIntersectingPath(t *testing.T)](#TestFindClosestDumpsIntersectingPath)
    * [func TestFindClosestDumpsFromGraphFragment(t *testing.T)](#TestFindClosestDumpsFromGraphFragment)
    * [func testFindClosestDumps(t *testing.T, store *Store, testCases []FindClosestDumpsTestCase)](#testFindClosestDumps)
    * [func testAnyOf(t *testing.T, dumps []Dump, expectedIDs []int)](#testAnyOf)
    * [func testAllOf(t *testing.T, dumps []Dump, expectedIDs []int)](#testAllOf)
    * [func testPresence(needle int, haystack []int) bool](#testPresence)
    * [func TestDeleteOverlappingDumps(t *testing.T)](#TestDeleteOverlappingDumps)
    * [func TestDeleteOverlappingDumpsNoMatches(t *testing.T)](#TestDeleteOverlappingDumpsNoMatches)
    * [func TestDeleteOverlappingDumpsIgnoresIncompleteUploads(t *testing.T)](#TestDeleteOverlappingDumpsIgnoresIncompleteUploads)
    * [func makeCommit(i int) string](#makeCommit)
    * [func insertUploads(t testing.TB, db *sql.DB, uploads ...Upload)](#insertUploads)
    * [func insertIndexes(t testing.TB, db *sql.DB, indexes ...Index)](#insertIndexes)
    * [func insertRepo(t testing.TB, db *sql.DB, id int, name string)](#insertRepo)
    * [func deleteRepo(t testing.TB, db *sql.DB, id int, deleted_at time.Time)](#deleteRepo)
    * [func insertPackageReferences(t testing.TB, store *Store, packageReferences []lsifstore.PackageReference)](#insertPackageReferences)
    * [func insertVisibleAtTip(t testing.TB, db *sql.DB, repositoryID int, uploadIDs ...int)](#insertVisibleAtTip)
    * [func insertNearestUploads(t testing.TB, db *sql.DB, repositoryID int, uploads map[string][]commitgraph.UploadMeta)](#insertNearestUploads)
    * [func insertLinks(t testing.TB, db *sql.DB, repositoryID int, links map[string]commitgraph.LinkRelationship)](#insertLinks)
    * [func toCommitGraphView(uploads []Upload) *commitgraph.CommitGraphView](#toCommitGraphView)
    * [func getVisibleUploads(t testing.TB, db *sql.DB, repositoryID int, commits []string) map[string][]int](#getVisibleUploads)
    * [func getUploadsVisibleAtTip(t testing.TB, db *sql.DB, repositoryID int) []int](#getUploadsVisibleAtTip)
    * [func normalizeVisibleUploads(uploadMetas map[string][]commitgraph.UploadMeta) map[string][]commitgraph.UploadMeta](#normalizeVisibleUploads)
    * [func getUploadStates(db dbutil.DB, ids ...int) (map[int]string, error)](#getUploadStates)
    * [func getIndexStates(db dbutil.DB, ids ...int) (map[int]string, error)](#getIndexStates)
    * [func scanStates(rows *sql.Rows, queryErr error) (_ map[int]string, err error)](#scanStates)
    * [func TestGetRepositoriesWithIndexConfiguration(t *testing.T)](#TestGetRepositoriesWithIndexConfiguration)
    * [func TestGetIndexConfigurationByRepositoryID(t *testing.T)](#TestGetIndexConfigurationByRepositoryID)
    * [func TestGetRepositoriesWithIndexConfigurationIgnoresDisabledRepos(t *testing.T)](#TestGetRepositoriesWithIndexConfigurationIgnoresDisabledRepos)
    * [func TestGetIndexByID(t *testing.T)](#TestGetIndexByID)
    * [func TestGetQueuedIndexRank(t *testing.T)](#TestGetQueuedIndexRank)
    * [func TestGetIndexesByIDs(t *testing.T)](#TestGetIndexesByIDs)
    * [func TestGetIndexes(t *testing.T)](#TestGetIndexes)
    * [func TestIsQueued(t *testing.T)](#TestIsQueued)
    * [func TestInsertIndex(t *testing.T)](#TestInsertIndex)
    * [func TestDeleteIndexByID(t *testing.T)](#TestDeleteIndexByID)
    * [func TestDeleteIndexByIDMissingRow(t *testing.T)](#TestDeleteIndexByIDMissingRow)
    * [func TestDeleteIndexesWithoutRepository(t *testing.T)](#TestDeleteIndexesWithoutRepository)
    * [func TestDeleteOldIndexes(t *testing.T)](#TestDeleteOldIndexes)
    * [func TestStaleSourcedCommits(t *testing.T)](#TestStaleSourcedCommits)
    * [func TestRefreshCommitResolvability(t *testing.T)](#TestRefreshCommitResolvability)
    * [func TestUpdatePackages(t *testing.T)](#TestUpdatePackages)
    * [func TestUpdatePackagesEmpty(t *testing.T)](#TestUpdatePackagesEmpty)
    * [func TestUpdatePackageReferences(t *testing.T)](#TestUpdatePackageReferences)
    * [func TestUpdatePackageReferencesEmpty(t *testing.T)](#TestUpdatePackageReferencesEmpty)
    * [func TestUpdatePackageReferencesWithDuplicates(t *testing.T)](#TestUpdatePackageReferencesWithDuplicates)
    * [func TestRepoName(t *testing.T)](#TestRepoName)
    * [func init()](#init)
    * [func TestGetUploadByID(t *testing.T)](#TestGetUploadByID)
    * [func TestGetUploadByIDDeleted(t *testing.T)](#TestGetUploadByIDDeleted)
    * [func TestGetQueuedUploadRank(t *testing.T)](#TestGetQueuedUploadRank)
    * [func TestGetUploadsByIDs(t *testing.T)](#TestGetUploadsByIDs)
    * [func TestDeleteUploadsStuckUploading(t *testing.T)](#TestDeleteUploadsStuckUploading)
    * [func TestGetUploads(t *testing.T)](#TestGetUploads)
    * [func TestInsertUploadUploading(t *testing.T)](#TestInsertUploadUploading)
    * [func TestInsertUploadQueued(t *testing.T)](#TestInsertUploadQueued)
    * [func TestInsertUploadWithAssociatedIndexID(t *testing.T)](#TestInsertUploadWithAssociatedIndexID)
    * [func TestMarkQueued(t *testing.T)](#TestMarkQueued)
    * [func TestMarkFailed(t *testing.T)](#TestMarkFailed)
    * [func TestAddUploadPart(t *testing.T)](#TestAddUploadPart)
    * [func TestDeleteUploadByID(t *testing.T)](#TestDeleteUploadByID)
    * [func TestDeleteUploadByIDMissingRow(t *testing.T)](#TestDeleteUploadByIDMissingRow)
    * [func TestDeleteUploadsWithoutRepository(t *testing.T)](#TestDeleteUploadsWithoutRepository)
    * [func TestHardDeleteUploadByID(t *testing.T)](#TestHardDeleteUploadByID)
    * [func TestSoftDeleteOldUploads(t *testing.T)](#TestSoftDeleteOldUploads)
    * [func TestGetOldestCommitDate(t *testing.T)](#TestGetOldestCommitDate)
    * [func TestUpdateCommitedAt(t *testing.T)](#TestUpdateCommitedAt)
    * [func TestDefinitionDumps(t *testing.T)](#TestDefinitionDumps)
    * [func TestReferenceIDsAndFilters(t *testing.T)](#TestReferenceIDsAndFilters)
    * [func TestReferenceIDsAndFiltersVisibility(t *testing.T)](#TestReferenceIDsAndFiltersVisibility)
    * [func TestReferenceIDsAndFiltersRemoteVisibility(t *testing.T)](#TestReferenceIDsAndFiltersRemoteVisibility)
    * [func TestReferencesForUpload(t *testing.T)](#TestReferencesForUpload)
    * [func consumeScanner(scanner PackageReferenceScanner) (references []lsifstore.PackageReference, _ error)](#consumeScanner)


## <a id="const" href="#const">Constants</a>

### <a id="hasRepositoryQuery" href="#hasRepositoryQuery">const hasRepositoryQuery</a>

```
searchKey: dbstore.hasRepositoryQuery
```

```Go
const hasRepositoryQuery = ...
```

### <a id="hasCommitQuery" href="#hasCommitQuery">const hasCommitQuery</a>

```
searchKey: dbstore.hasCommitQuery
```

```Go
const hasCommitQuery = ...
```

### <a id="markRepositoryAsDirtyQuery" href="#markRepositoryAsDirtyQuery">const markRepositoryAsDirtyQuery</a>

```
searchKey: dbstore.markRepositoryAsDirtyQuery
```

```Go
const markRepositoryAsDirtyQuery = ...
```

### <a id="dirtyRepositoriesQuery" href="#dirtyRepositoriesQuery">const dirtyRepositoriesQuery</a>

```
searchKey: dbstore.dirtyRepositoriesQuery
```

```Go
const dirtyRepositoriesQuery = ...
```

### <a id="commitGraphQuery" href="#commitGraphQuery">const commitGraphQuery</a>

```
searchKey: dbstore.commitGraphQuery
```

```Go
const commitGraphQuery = ...
```

### <a id="calculateVisibleUploadsCommitGraphQuery" href="#calculateVisibleUploadsCommitGraphQuery">const calculateVisibleUploadsCommitGraphQuery</a>

```
searchKey: dbstore.calculateVisibleUploadsCommitGraphQuery
```

```Go
const calculateVisibleUploadsCommitGraphQuery = ...
```

### <a id="calculateVisibleUploadsDirtyRepositoryQuery" href="#calculateVisibleUploadsDirtyRepositoryQuery">const calculateVisibleUploadsDirtyRepositoryQuery</a>

```
searchKey: dbstore.calculateVisibleUploadsDirtyRepositoryQuery
```

```Go
const calculateVisibleUploadsDirtyRepositoryQuery = ...
```

### <a id="temporaryNearestUploadsTableQuery" href="#temporaryNearestUploadsTableQuery">const temporaryNearestUploadsTableQuery</a>

```
searchKey: dbstore.temporaryNearestUploadsTableQuery
```

```Go
const temporaryNearestUploadsTableQuery = ...
```

### <a id="temporaryNearestUploadsLinksTableQuery" href="#temporaryNearestUploadsLinksTableQuery">const temporaryNearestUploadsLinksTableQuery</a>

```
searchKey: dbstore.temporaryNearestUploadsLinksTableQuery
```

```Go
const temporaryNearestUploadsLinksTableQuery = ...
```

### <a id="temporaryUploadsVisibleAtTipTableQuery" href="#temporaryUploadsVisibleAtTipTableQuery">const temporaryUploadsVisibleAtTipTableQuery</a>

```
searchKey: dbstore.temporaryUploadsVisibleAtTipTableQuery
```

```Go
const temporaryUploadsVisibleAtTipTableQuery = ...
```

### <a id="nearestUploadsInsertQuery" href="#nearestUploadsInsertQuery">const nearestUploadsInsertQuery</a>

```
searchKey: dbstore.nearestUploadsInsertQuery
```

```Go
const nearestUploadsInsertQuery = ...
```

### <a id="nearestUploadsUpdateQuery" href="#nearestUploadsUpdateQuery">const nearestUploadsUpdateQuery</a>

```
searchKey: dbstore.nearestUploadsUpdateQuery
```

```Go
const nearestUploadsUpdateQuery = ...
```

### <a id="nearestUploadsDeleteQuery" href="#nearestUploadsDeleteQuery">const nearestUploadsDeleteQuery</a>

```
searchKey: dbstore.nearestUploadsDeleteQuery
```

```Go
const nearestUploadsDeleteQuery = ...
```

### <a id="nearestUploadsLinksInsertQuery" href="#nearestUploadsLinksInsertQuery">const nearestUploadsLinksInsertQuery</a>

```
searchKey: dbstore.nearestUploadsLinksInsertQuery
```

```Go
const nearestUploadsLinksInsertQuery = ...
```

### <a id="nearestUploadsLinksUpdateQuery" href="#nearestUploadsLinksUpdateQuery">const nearestUploadsLinksUpdateQuery</a>

```
searchKey: dbstore.nearestUploadsLinksUpdateQuery
```

```Go
const nearestUploadsLinksUpdateQuery = ...
```

### <a id="nearestUploadsLinksDeleteQuery" href="#nearestUploadsLinksDeleteQuery">const nearestUploadsLinksDeleteQuery</a>

```
searchKey: dbstore.nearestUploadsLinksDeleteQuery
```

```Go
const nearestUploadsLinksDeleteQuery = ...
```

### <a id="uploadsVisibleAtTipInsertQuery" href="#uploadsVisibleAtTipInsertQuery">const uploadsVisibleAtTipInsertQuery</a>

```
searchKey: dbstore.uploadsVisibleAtTipInsertQuery
```

```Go
const uploadsVisibleAtTipInsertQuery = ...
```

### <a id="uploadsVisibleAtTipDeleteQuery" href="#uploadsVisibleAtTipDeleteQuery">const uploadsVisibleAtTipDeleteQuery</a>

```
searchKey: dbstore.uploadsVisibleAtTipDeleteQuery
```

```Go
const uploadsVisibleAtTipDeleteQuery = ...
```

### <a id="bulkTransferQuery" href="#bulkTransferQuery">const bulkTransferQuery</a>

```
searchKey: dbstore.bulkTransferQuery
```

```Go
const bulkTransferQuery = ...
```

### <a id="insertDependencyIndexingJobQuery" href="#insertDependencyIndexingJobQuery">const insertDependencyIndexingJobQuery</a>

```
searchKey: dbstore.insertDependencyIndexingJobQuery
```

```Go
const insertDependencyIndexingJobQuery = ...
```

### <a id="getDumpsByIDsQuery" href="#getDumpsByIDsQuery">const getDumpsByIDsQuery</a>

```
searchKey: dbstore.getDumpsByIDsQuery
```

```Go
const getDumpsByIDsQuery = ...
```

### <a id="findClosestDumpsQuery" href="#findClosestDumpsQuery">const findClosestDumpsQuery</a>

```
searchKey: dbstore.findClosestDumpsQuery
```

```Go
const findClosestDumpsQuery = ...
```

### <a id="findClosestDumpsFromGraphFragmentCommitGraphQuery" href="#findClosestDumpsFromGraphFragmentCommitGraphQuery">const findClosestDumpsFromGraphFragmentCommitGraphQuery</a>

```
searchKey: dbstore.findClosestDumpsFromGraphFragmentCommitGraphQuery
```

```Go
const findClosestDumpsFromGraphFragmentCommitGraphQuery = ...
```

### <a id="findClosestDumpsFromGraphFragmentQuery" href="#findClosestDumpsFromGraphFragmentQuery">const findClosestDumpsFromGraphFragmentQuery</a>

```
searchKey: dbstore.findClosestDumpsFromGraphFragmentQuery
```

```Go
const findClosestDumpsFromGraphFragmentQuery = ...
```

### <a id="visibleUploadCandidatesQuery" href="#visibleUploadCandidatesQuery">const visibleUploadCandidatesQuery</a>

```
searchKey: dbstore.visibleUploadCandidatesQuery
```

```Go
const visibleUploadCandidatesQuery = ...
```

### <a id="visibleUploadsQuery" href="#visibleUploadsQuery">const visibleUploadsQuery</a>

```
searchKey: dbstore.visibleUploadsQuery
```

```Go
const visibleUploadsQuery = ...
```

### <a id="deleteOverlappingDumpsQuery" href="#deleteOverlappingDumpsQuery">const deleteOverlappingDumpsQuery</a>

```
searchKey: dbstore.deleteOverlappingDumpsQuery
```

```Go
const deleteOverlappingDumpsQuery = ...
```

### <a id="getRepositoriesWithIndexConfigurationQuery" href="#getRepositoriesWithIndexConfigurationQuery">const getRepositoriesWithIndexConfigurationQuery</a>

```
searchKey: dbstore.getRepositoriesWithIndexConfigurationQuery
```

```Go
const getRepositoriesWithIndexConfigurationQuery = ...
```

### <a id="getAutoIndexDisabledRepositoriesQuery" href="#getAutoIndexDisabledRepositoriesQuery">const getAutoIndexDisabledRepositoriesQuery</a>

```
searchKey: dbstore.getAutoIndexDisabledRepositoriesQuery
```

```Go
const getAutoIndexDisabledRepositoriesQuery = ...
```

### <a id="getIndexConfigurationByRepositoryIDQuery" href="#getIndexConfigurationByRepositoryIDQuery">const getIndexConfigurationByRepositoryIDQuery</a>

```
searchKey: dbstore.getIndexConfigurationByRepositoryIDQuery
```

```Go
const getIndexConfigurationByRepositoryIDQuery = ...
```

### <a id="updateIndexConfigurationByRepositoryIDQuery" href="#updateIndexConfigurationByRepositoryIDQuery">const updateIndexConfigurationByRepositoryIDQuery</a>

```
searchKey: dbstore.updateIndexConfigurationByRepositoryIDQuery
```

```Go
const updateIndexConfigurationByRepositoryIDQuery = ...
```

### <a id="indexAssociatedUploadIDQueryFragment" href="#indexAssociatedUploadIDQueryFragment">const indexAssociatedUploadIDQueryFragment</a>

```
searchKey: dbstore.indexAssociatedUploadIDQueryFragment
```

```Go
const indexAssociatedUploadIDQueryFragment = ...
```

### <a id="indexRankQueryFragment" href="#indexRankQueryFragment">const indexRankQueryFragment</a>

```
searchKey: dbstore.indexRankQueryFragment
```

```Go
const indexRankQueryFragment = ...
```

### <a id="getIndexByIDQuery" href="#getIndexByIDQuery">const getIndexByIDQuery</a>

```
searchKey: dbstore.getIndexByIDQuery
```

```Go
const getIndexByIDQuery = ...
```

### <a id="getIndexesByIDsQuery" href="#getIndexesByIDsQuery">const getIndexesByIDsQuery</a>

```
searchKey: dbstore.getIndexesByIDsQuery
```

```Go
const getIndexesByIDsQuery = ...
```

### <a id="getIndexesCountQuery" href="#getIndexesCountQuery">const getIndexesCountQuery</a>

```
searchKey: dbstore.getIndexesCountQuery
```

```Go
const getIndexesCountQuery = ...
```

### <a id="getIndexesQuery" href="#getIndexesQuery">const getIndexesQuery</a>

```
searchKey: dbstore.getIndexesQuery
```

```Go
const getIndexesQuery = ...
```

### <a id="isQueuedQuery" href="#isQueuedQuery">const isQueuedQuery</a>

```
searchKey: dbstore.isQueuedQuery
```

```Go
const isQueuedQuery = ...
```

### <a id="insertIndexQuery" href="#insertIndexQuery">const insertIndexQuery</a>

```
searchKey: dbstore.insertIndexQuery
```

```Go
const insertIndexQuery = ...
```

### <a id="deleteIndexByIDQuery" href="#deleteIndexByIDQuery">const deleteIndexByIDQuery</a>

```
searchKey: dbstore.deleteIndexByIDQuery
```

```Go
const deleteIndexByIDQuery = ...
```

### <a id="deleteIndexesWithoutRepositoryQuery" href="#deleteIndexesWithoutRepositoryQuery">const deleteIndexesWithoutRepositoryQuery</a>

```
searchKey: dbstore.deleteIndexesWithoutRepositoryQuery
```

```Go
const deleteIndexesWithoutRepositoryQuery = ...
```

### <a id="deleteOldIndexesQuery" href="#deleteOldIndexesQuery">const deleteOldIndexesQuery</a>

```
searchKey: dbstore.deleteOldIndexesQuery
```

```Go
const deleteOldIndexesQuery = ...
```

### <a id="staleSourcedCommitsQuery" href="#staleSourcedCommitsQuery">const staleSourcedCommitsQuery</a>

```
searchKey: dbstore.staleSourcedCommitsQuery
```

```Go
const staleSourcedCommitsQuery = ...
```

### <a id="staleSourcedCommitsSubquery" href="#staleSourcedCommitsSubquery">const staleSourcedCommitsSubquery</a>

```
searchKey: dbstore.staleSourcedCommitsSubquery
```

```Go
const staleSourcedCommitsSubquery = ...
```

### <a id="refreshCommitResolvabilityQuery" href="#refreshCommitResolvabilityQuery">const refreshCommitResolvabilityQuery</a>

```
searchKey: dbstore.refreshCommitResolvabilityQuery
```

```Go
const refreshCommitResolvabilityQuery = ...
```

### <a id="updatePackagesTemporaryTableQuery" href="#updatePackagesTemporaryTableQuery">const updatePackagesTemporaryTableQuery</a>

```
searchKey: dbstore.updatePackagesTemporaryTableQuery
```

```Go
const updatePackagesTemporaryTableQuery = ...
```

### <a id="updatePackagesInsertQuery" href="#updatePackagesInsertQuery">const updatePackagesInsertQuery</a>

```
searchKey: dbstore.updatePackagesInsertQuery
```

```Go
const updatePackagesInsertQuery = ...
```

### <a id="updateReferencesTemporaryTableQuery" href="#updateReferencesTemporaryTableQuery">const updateReferencesTemporaryTableQuery</a>

```
searchKey: dbstore.updateReferencesTemporaryTableQuery
```

```Go
const updateReferencesTemporaryTableQuery = ...
```

### <a id="updateReferencesInsertQuery" href="#updateReferencesInsertQuery">const updateReferencesInsertQuery</a>

```
searchKey: dbstore.updateReferencesInsertQuery
```

```Go
const updateReferencesInsertQuery = ...
```

### <a id="repoNameQuery" href="#repoNameQuery">const repoNameQuery</a>

```
searchKey: dbstore.repoNameQuery
```

```Go
const repoNameQuery = ...
```

### <a id="uploadRankQueryFragment" href="#uploadRankQueryFragment">const uploadRankQueryFragment</a>

```
searchKey: dbstore.uploadRankQueryFragment
```

```Go
const uploadRankQueryFragment = ...
```

### <a id="getUploadByIDQuery" href="#getUploadByIDQuery">const getUploadByIDQuery</a>

```
searchKey: dbstore.getUploadByIDQuery
```

```Go
const getUploadByIDQuery = ...
```

### <a id="visibleAtTipSubselectQuery" href="#visibleAtTipSubselectQuery">const visibleAtTipSubselectQuery</a>

```
searchKey: dbstore.visibleAtTipSubselectQuery
```

```Go
const visibleAtTipSubselectQuery = ...
```

### <a id="getUploadsByIDsQuery" href="#getUploadsByIDsQuery">const getUploadsByIDsQuery</a>

```
searchKey: dbstore.getUploadsByIDsQuery
```

```Go
const getUploadsByIDsQuery = ...
```

### <a id="deleteUploadsStuckUploadingQuery" href="#deleteUploadsStuckUploadingQuery">const deleteUploadsStuckUploadingQuery</a>

```
searchKey: dbstore.deleteUploadsStuckUploadingQuery
```

```Go
const deleteUploadsStuckUploadingQuery = ...
```

### <a id="getUploadsCountQuery" href="#getUploadsCountQuery">const getUploadsCountQuery</a>

```
searchKey: dbstore.getUploadsCountQuery
```

```Go
const getUploadsCountQuery = ...
```

### <a id="getUploadsQuery" href="#getUploadsQuery">const getUploadsQuery</a>

```
searchKey: dbstore.getUploadsQuery
```

```Go
const getUploadsQuery = ...
```

### <a id="insertUploadQuery" href="#insertUploadQuery">const insertUploadQuery</a>

```
searchKey: dbstore.insertUploadQuery
```

```Go
const insertUploadQuery = ...
```

### <a id="addUploadPartQuery" href="#addUploadPartQuery">const addUploadPartQuery</a>

```
searchKey: dbstore.addUploadPartQuery
```

```Go
const addUploadPartQuery = ...
```

### <a id="markQueuedQuery" href="#markQueuedQuery">const markQueuedQuery</a>

```
searchKey: dbstore.markQueuedQuery
```

```Go
const markQueuedQuery = ...
```

### <a id="markFailedQuery" href="#markFailedQuery">const markFailedQuery</a>

```
searchKey: dbstore.markFailedQuery
```

```Go
const markFailedQuery = ...
```

### <a id="deleteUploadByIDQuery" href="#deleteUploadByIDQuery">const deleteUploadByIDQuery</a>

```
searchKey: dbstore.deleteUploadByIDQuery
```

```Go
const deleteUploadByIDQuery = ...
```

### <a id="DeletedRepositoryGracePeriod" href="#DeletedRepositoryGracePeriod">const DeletedRepositoryGracePeriod</a>

```
searchKey: dbstore.DeletedRepositoryGracePeriod
tags: [exported]
```

```Go
const DeletedRepositoryGracePeriod = time.Minute * 30
```

DeletedRepositoryGracePeriod is the minimum allowable duration between a repo deletion and the upload and index records for that repository being deleted. 

### <a id="deleteUploadsWithoutRepositoryQuery" href="#deleteUploadsWithoutRepositoryQuery">const deleteUploadsWithoutRepositoryQuery</a>

```
searchKey: dbstore.deleteUploadsWithoutRepositoryQuery
```

```Go
const deleteUploadsWithoutRepositoryQuery = ...
```

### <a id="hardDeleteUploadByIDQuery" href="#hardDeleteUploadByIDQuery">const hardDeleteUploadByIDQuery</a>

```
searchKey: dbstore.hardDeleteUploadByIDQuery
```

```Go
const hardDeleteUploadByIDQuery = ...
```

### <a id="softDeleteOldUploadsQuery" href="#softDeleteOldUploadsQuery">const softDeleteOldUploadsQuery</a>

```
searchKey: dbstore.softDeleteOldUploadsQuery
```

```Go
const softDeleteOldUploadsQuery = ...
```

### <a id="getOldestCommitDateQuery" href="#getOldestCommitDateQuery">const getOldestCommitDateQuery</a>

```
searchKey: dbstore.getOldestCommitDateQuery
```

```Go
const getOldestCommitDateQuery = ...
```

Note: we check against '-infinity' here, as the backfill operation will use this sentinel value in the case that the commit is no longer know by gitserver. This allows the backfill migration to make progress without having pristine database. 

### <a id="updateCommitedAtQuery" href="#updateCommitedAtQuery">const updateCommitedAtQuery</a>

```
searchKey: dbstore.updateCommitedAtQuery
```

```Go
const updateCommitedAtQuery = ...
```

### <a id="StalledUploadMaxAge" href="#StalledUploadMaxAge">const StalledUploadMaxAge</a>

```
searchKey: dbstore.StalledUploadMaxAge
tags: [exported]
```

```Go
const StalledUploadMaxAge = time.Second * 5
```

StalledUploadMaxAge is the maximum allowable duration between updating the state of an upload as "processing" and locking the upload row during processing. An unlocked row that is marked as processing likely indicates that the worker that dequeued the upload has died. There should be a nearly-zero delay between these states during normal operation. 

### <a id="UploadMaxNumResets" href="#UploadMaxNumResets">const UploadMaxNumResets</a>

```
searchKey: dbstore.UploadMaxNumResets
tags: [exported]
```

```Go
const UploadMaxNumResets = 3
```

UploadMaxNumResets is the maximum number of times an upload can be reset. If an upload's failed attempts counter reaches this threshold, it will be moved into "errored" rather than "queued" on its next reset. 

### <a id="StalledIndexMaxAge" href="#StalledIndexMaxAge">const StalledIndexMaxAge</a>

```
searchKey: dbstore.StalledIndexMaxAge
tags: [exported]
```

```Go
const StalledIndexMaxAge = time.Second * 5
```

StalledIndexMaxAge is the maximum allowable duration between updating the state of an index as "processing" and locking the index row during processing. An unlocked row that is marked as processing likely indicates that the indexer that dequeued the index has died. There should be a nearly-zero delay between these states during normal operation. 

### <a id="IndexMaxNumResets" href="#IndexMaxNumResets">const IndexMaxNumResets</a>

```
searchKey: dbstore.IndexMaxNumResets
tags: [exported]
```

```Go
const IndexMaxNumResets = 3
```

IndexMaxNumResets is the maximum number of times an index can be reset. If an index's failed attempts counter reaches this threshold, it will be moved into "errored" rather than "queued" on its next reset. 

### <a id="StalledDependencyIndexingJobMaxAge" href="#StalledDependencyIndexingJobMaxAge">const StalledDependencyIndexingJobMaxAge</a>

```
searchKey: dbstore.StalledDependencyIndexingJobMaxAge
tags: [exported]
```

```Go
const StalledDependencyIndexingJobMaxAge = time.Second * 5
```

StalledDependencyIndexingJobMaxAge is the maximum allowable duration between updating the state of a dependency indexing job as "processing" and locking the job row during processing. An unlocked row that is marked as processing likely indicates that the worker that dequeued the job has died. There should be a nearly-zero delay between these states during normal operation. 

### <a id="DependencyIndexingJobMaxNumResets" href="#DependencyIndexingJobMaxNumResets">const DependencyIndexingJobMaxNumResets</a>

```
searchKey: dbstore.DependencyIndexingJobMaxNumResets
tags: [exported]
```

```Go
const DependencyIndexingJobMaxNumResets = 3
```

DependencyIndexingJobMaxNumResets is the maximum number of times a dependency indexing job can be reset. If an job's failed attempts counter reaches this threshold, it will be moved into "errored" rather than "queued" on its next reset. 

### <a id="DefinitionDumpsLimit" href="#DefinitionDumpsLimit">const DefinitionDumpsLimit</a>

```
searchKey: dbstore.DefinitionDumpsLimit
tags: [exported]
```

```Go
const DefinitionDumpsLimit = 10
```

DefinitionDumpsLimit is the maximum number of records that can be returned from DefinitionDumps. 

### <a id="definitionDumpsQuery" href="#definitionDumpsQuery">const definitionDumpsQuery</a>

```
searchKey: dbstore.definitionDumpsQuery
```

```Go
const definitionDumpsQuery = ...
```

### <a id="referenceIDsAndFiltersCTEDefinitions" href="#referenceIDsAndFiltersCTEDefinitions">const referenceIDsAndFiltersCTEDefinitions</a>

```
searchKey: dbstore.referenceIDsAndFiltersCTEDefinitions
```

```Go
const referenceIDsAndFiltersCTEDefinitions = ...
```

### <a id="referenceIDsAndFiltersBaseQuery" href="#referenceIDsAndFiltersBaseQuery">const referenceIDsAndFiltersBaseQuery</a>

```
searchKey: dbstore.referenceIDsAndFiltersBaseQuery
```

```Go
const referenceIDsAndFiltersBaseQuery = ...
```

### <a id="referenceIDsAndFiltersQuery" href="#referenceIDsAndFiltersQuery">const referenceIDsAndFiltersQuery</a>

```
searchKey: dbstore.referenceIDsAndFiltersQuery
```

```Go
const referenceIDsAndFiltersQuery = ...
```

### <a id="referenceIDsAndFiltersCountQuery" href="#referenceIDsAndFiltersCountQuery">const referenceIDsAndFiltersCountQuery</a>

```
searchKey: dbstore.referenceIDsAndFiltersCountQuery
```

```Go
const referenceIDsAndFiltersCountQuery = ...
```

### <a id="referencesForUploadQuery" href="#referencesForUploadQuery">const referencesForUploadQuery</a>

```
searchKey: dbstore.referencesForUploadQuery
```

```Go
const referencesForUploadQuery = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="dependencyIndexingJobColumns" href="#dependencyIndexingJobColumns">var dependencyIndexingJobColumns</a>

```
searchKey: dbstore.dependencyIndexingJobColumns
```

```Go
var dependencyIndexingJobColumns = ...
```

### <a id="ErrNotTransactable" href="#ErrNotTransactable">var ErrNotTransactable</a>

```
searchKey: dbstore.ErrNotTransactable
tags: [exported]
```

```Go
var ErrNotTransactable = errors.New("store: not transactable")
```

ErrNotTransactable occurs when Transact is called on a store whose underlying store handle does not support beginning a transaction. 

### <a id="ErrNoTransaction" href="#ErrNoTransaction">var ErrNoTransaction</a>

```
searchKey: dbstore.ErrNoTransaction
tags: [exported]
```

```Go
var ErrNoTransaction = errors.New("store: not in a transaction")
```

ErrNoTransaction occurs when Savepoint or RollbackToSavepoint is called outside of a transaction. 

### <a id="ErrDequeueTransaction" href="#ErrDequeueTransaction">var ErrDequeueTransaction</a>

```
searchKey: dbstore.ErrDequeueTransaction
tags: [exported]
```

```Go
var ErrDequeueTransaction = errors.New("unexpected transaction")
```

ErrDequeueTransaction occurs when Dequeue is called from inside a transaction. 

### <a id="ErrDequeueRace" href="#ErrDequeueRace">var ErrDequeueRace</a>

```
searchKey: dbstore.ErrDequeueRace
tags: [exported]
```

```Go
var ErrDequeueRace = errors.New("dequeue race")
```

ErrDequeueRace occurs when an upload selected for dequeue has been locked by another worker. 

### <a id="ErrNoSavepoint" href="#ErrNoSavepoint">var ErrNoSavepoint</a>

```
searchKey: dbstore.ErrNoSavepoint
tags: [exported]
```

```Go
var ErrNoSavepoint = errors.New("no savepoint defined")
```

ErrNoSavepoint occurs when there is no savepont to rollback to. 

### <a id="ErrUnknownRepository" href="#ErrUnknownRepository">var ErrUnknownRepository</a>

```
searchKey: dbstore.ErrUnknownRepository
tags: [exported]
```

```Go
var ErrUnknownRepository = errors.New("unknown repository")
```

ErrUnknownRepository occurs when a repository does not exist. 

### <a id="ErrIllegalLimit" href="#ErrIllegalLimit">var ErrIllegalLimit</a>

```
searchKey: dbstore.ErrIllegalLimit
tags: [exported]
```

```Go
var ErrIllegalLimit = errors.New("illegal limit")
```

ErrIllegalLimit occurs when a limit is not strictly positive. 

### <a id="ScanFirstIndexRecord" href="#ScanFirstIndexRecord">var ScanFirstIndexRecord</a>

```
searchKey: dbstore.ScanFirstIndexRecord
tags: [exported]
```

```Go
var ScanFirstIndexRecord = scanFirstIndexRecord
```

### <a id="indexColumnsWithNullRank" href="#indexColumnsWithNullRank">var indexColumnsWithNullRank</a>

```
searchKey: dbstore.indexColumnsWithNullRank
```

```Go
var indexColumnsWithNullRank = ...
```

### <a id="IndexColumnsWithNullRank" href="#IndexColumnsWithNullRank">var IndexColumnsWithNullRank</a>

```
searchKey: dbstore.IndexColumnsWithNullRank
tags: [exported]
```

```Go
var IndexColumnsWithNullRank = indexColumnsWithNullRank
```

### <a id="uploadColumnsWithNullRank" href="#uploadColumnsWithNullRank">var uploadColumnsWithNullRank</a>

```
searchKey: dbstore.uploadColumnsWithNullRank
```

```Go
var uploadColumnsWithNullRank = ...
```

### <a id="uploadWorkerStoreOptions" href="#uploadWorkerStoreOptions">var uploadWorkerStoreOptions</a>

```
searchKey: dbstore.uploadWorkerStoreOptions
```

```Go
var uploadWorkerStoreOptions = ...
```

### <a id="indexWorkerStoreOptions" href="#indexWorkerStoreOptions">var indexWorkerStoreOptions</a>

```
searchKey: dbstore.indexWorkerStoreOptions
```

```Go
var indexWorkerStoreOptions = ...
```

### <a id="dependencyIndexingJobWorkerStoreOptions" href="#dependencyIndexingJobWorkerStoreOptions">var dependencyIndexingJobWorkerStoreOptions</a>

```
searchKey: dbstore.dependencyIndexingJobWorkerStoreOptions
```

```Go
var dependencyIndexingJobWorkerStoreOptions = ...
```

## <a id="type" href="#type">Types</a>

### <a id="uploadMetaListSerializer" href="#uploadMetaListSerializer">type uploadMetaListSerializer struct</a>

```
searchKey: dbstore.uploadMetaListSerializer
```

```Go
type uploadMetaListSerializer struct {
	buf     bytes.Buffer
	scratch []byte
}
```

#### <a id="NewUploadMetaListSerializer" href="#NewUploadMetaListSerializer">func NewUploadMetaListSerializer() *uploadMetaListSerializer</a>

```
searchKey: dbstore.NewUploadMetaListSerializer
tags: [exported]
```

```Go
func NewUploadMetaListSerializer() *uploadMetaListSerializer
```

#### <a id="uploadMetaListSerializer.Serialize" href="#uploadMetaListSerializer.Serialize">func (s *uploadMetaListSerializer) Serialize(uploadMetas []commitgraph.UploadMeta) []byte</a>

```
searchKey: dbstore.uploadMetaListSerializer.Serialize
```

```Go
func (s *uploadMetaListSerializer) Serialize(uploadMetas []commitgraph.UploadMeta) []byte
```

Serialize returns a new byte slice with the given upload metadata values encoded as a JSON object (keys being the upload_id and values being the distance field). 

Our original attempt just built a map[int]int and passed it to the JSON package to be marshalled into a byte array. Unfortunately that puts reflection over the map value in the hot path for commit graph processing. We also can't avoid the reflection by passing a struct without changing the shape of the data persisted in the database. 

By serializing this value ourselves we minimize allocations. This change resulted in a 50% reduction of the memory required by BenchmarkCalculateVisibleUploads. 

This method is not safe for concurrent use. 

#### <a id="uploadMetaListSerializer.write" href="#uploadMetaListSerializer.write">func (s *uploadMetaListSerializer) write(uploadMetas []commitgraph.UploadMeta)</a>

```
searchKey: dbstore.uploadMetaListSerializer.write
```

```Go
func (s *uploadMetaListSerializer) write(uploadMetas []commitgraph.UploadMeta)
```

#### <a id="uploadMetaListSerializer.writeUploadMeta" href="#uploadMetaListSerializer.writeUploadMeta">func (s *uploadMetaListSerializer) writeUploadMeta(uploadMeta commitgraph.UploadMeta)</a>

```
searchKey: dbstore.uploadMetaListSerializer.writeUploadMeta
```

```Go
func (s *uploadMetaListSerializer) writeUploadMeta(uploadMeta commitgraph.UploadMeta)
```

#### <a id="uploadMetaListSerializer.writeInteger" href="#uploadMetaListSerializer.writeInteger">func (s *uploadMetaListSerializer) writeInteger(value int)</a>

```
searchKey: dbstore.uploadMetaListSerializer.writeInteger
```

```Go
func (s *uploadMetaListSerializer) writeInteger(value int)
```

#### <a id="uploadMetaListSerializer.take" href="#uploadMetaListSerializer.take">func (s *uploadMetaListSerializer) take() []byte</a>

```
searchKey: dbstore.uploadMetaListSerializer.take
```

```Go
func (s *uploadMetaListSerializer) take() []byte
```

### <a id="sanitizedCommitInput" href="#sanitizedCommitInput">type sanitizedCommitInput struct</a>

```
searchKey: dbstore.sanitizedCommitInput
```

```Go
type sanitizedCommitInput struct {
	nearestUploadsRowValues       <-chan []interface{}
	nearestUploadsLinksRowValues  <-chan []interface{}
	uploadsVisibleAtTipRowValues  <-chan []interface{}
	numNearestUploadsRecords      uint32 // populated once nearestUploadsRowValues is exhausted
	numNearestUploadsLinksRecords uint32 // populated once nearestUploadsLinksRowValues is exhausted
	numUploadsVisibleAtTipRecords uint32 // populated once uploadsVisibleAtTipRowValues is exhausted
}
```

#### <a id="sanitizeCommitInput" href="#sanitizeCommitInput">func sanitizeCommitInput(ctx context.Context, graph *commitgraph.Graph, tipCommit string) *sanitizedCommitInput</a>

```
searchKey: dbstore.sanitizeCommitInput
```

```Go
func sanitizeCommitInput(ctx context.Context, graph *commitgraph.Graph, tipCommit string) *sanitizedCommitInput
```

sanitizeCommitInput reads the data that needs to be persisted from the given graph and writes the sanitized values (ensures values match the column types) into channels for insertion into a particular table. 

### <a id="DependencyIndexingJob" href="#DependencyIndexingJob">type DependencyIndexingJob struct</a>

```
searchKey: dbstore.DependencyIndexingJob
tags: [exported]
```

```Go
type DependencyIndexingJob struct {
	ID             int        `json:"id"`
	State          string     `json:"state"`
	FailureMessage *string    `json:"failureMessage"`
	StartedAt      *time.Time `json:"startedAt"`
	FinishedAt     *time.Time `json:"finishedAt"`
	ProcessAfter   *time.Time `json:"processAfter"`
	NumResets      int        `json:"numResets"`
	NumFailures    int        `json:"numFailures"`
	UploadID       int        `json:"uploadId"`
}
```

DependencyIndexingJob is a subset of the lsif_dependency_indexing_jobs table and acts as the queue and execution record for indexing the dependencies of a particular completed upload. 

#### <a id="scanFirstDependencyIndexingJob" href="#scanFirstDependencyIndexingJob">func scanFirstDependencyIndexingJob(rows *sql.Rows, err error) (DependencyIndexingJob, bool, error)</a>

```
searchKey: dbstore.scanFirstDependencyIndexingJob
```

```Go
func scanFirstDependencyIndexingJob(rows *sql.Rows, err error) (DependencyIndexingJob, bool, error)
```

scanFirstDependencyIndexingJob scans a slice of dependency indexing jobs from the return value of `*Store.query` and returns the first. 

#### <a id="DependencyIndexingJob.RecordID" href="#DependencyIndexingJob.RecordID">func (u DependencyIndexingJob) RecordID() int</a>

```
searchKey: dbstore.DependencyIndexingJob.RecordID
tags: [exported]
```

```Go
func (u DependencyIndexingJob) RecordID() int
```

### <a id="DockerStep" href="#DockerStep">type DockerStep struct</a>

```
searchKey: dbstore.DockerStep
tags: [exported]
```

```Go
type DockerStep struct {
	Root     string   `json:"root"`
	Image    string   `json:"image"`
	Commands []string `json:"commands"`
}
```

#### <a id="DockerStep.Scan" href="#DockerStep.Scan">func (s *DockerStep) Scan(value interface{}) error</a>

```
searchKey: dbstore.DockerStep.Scan
tags: [exported]
```

```Go
func (s *DockerStep) Scan(value interface{}) error
```

#### <a id="DockerStep.Value" href="#DockerStep.Value">func (s DockerStep) Value() (driver.Value, error)</a>

```
searchKey: dbstore.DockerStep.Value
tags: [exported]
```

```Go
func (s DockerStep) Value() (driver.Value, error)
```

### <a id="Dump" href="#Dump">type Dump struct</a>

```
searchKey: dbstore.Dump
tags: [exported]
```

```Go
type Dump struct {
	ID                int        `json:"id"`
	Commit            string     `json:"commit"`
	Root              string     `json:"root"`
	VisibleAtTip      bool       `json:"visibleAtTip"`
	UploadedAt        time.Time  `json:"uploadedAt"`
	State             string     `json:"state"`
	FailureMessage    *string    `json:"failureMessage"`
	StartedAt         *time.Time `json:"startedAt"`
	FinishedAt        *time.Time `json:"finishedAt"`
	ProcessAfter      *time.Time `json:"processAfter"`
	NumResets         int        `json:"numResets"`
	NumFailures       int        `json:"numFailures"`
	RepositoryID      int        `json:"repositoryId"`
	RepositoryName    string     `json:"repositoryName"`
	Indexer           string     `json:"indexer"`
	AssociatedIndexID *int       `json:"associatedIndex"`
}
```

Dump is a subset of the lsif_uploads table (queried via the lsif_dumps_with_repository_name view) and stores only processed records. 

### <a id="IndexConfiguration" href="#IndexConfiguration">type IndexConfiguration struct</a>

```
searchKey: dbstore.IndexConfiguration
tags: [exported]
```

```Go
type IndexConfiguration struct {
	ID           int    `json:"id"`
	RepositoryID int    `json:"repository_id"`
	Data         []byte `json:"data"`
}
```

IndexConfiguration stores the index configuration for a repository. 

#### <a id="scanFirstIndexConfiguration" href="#scanFirstIndexConfiguration">func scanFirstIndexConfiguration(rows *sql.Rows, err error) (IndexConfiguration, bool, error)</a>

```
searchKey: dbstore.scanFirstIndexConfiguration
```

```Go
func scanFirstIndexConfiguration(rows *sql.Rows, err error) (IndexConfiguration, bool, error)
```

scanFirstIndexConfiguration scans a slice of index configurations from the return value of `*Store.query` and returns the first. 

### <a id="Index" href="#Index">type Index struct</a>

```
searchKey: dbstore.Index
tags: [exported]
```

```Go
type Index struct {
	ID                 int                            `json:"id"`
	Commit             string                         `json:"commit"`
	QueuedAt           time.Time                      `json:"queuedAt"`
	State              string                         `json:"state"`
	FailureMessage     *string                        `json:"failureMessage"`
	StartedAt          *time.Time                     `json:"startedAt"`
	FinishedAt         *time.Time                     `json:"finishedAt"`
	ProcessAfter       *time.Time                     `json:"processAfter"`
	NumResets          int                            `json:"numResets"`
	NumFailures        int                            `json:"numFailures"`
	RepositoryID       int                            `json:"repositoryId"`
	LocalSteps         []string                       `json:"local_steps"`
	RepositoryName     string                         `json:"repositoryName"`
	DockerSteps        []DockerStep                   `json:"docker_steps"`
	Root               string                         `json:"root"`
	Indexer            string                         `json:"indexer"`
	IndexerArgs        []string                       `json:"indexer_args"` // TODO - convert this to `IndexCommand string`
	Outfile            string                         `json:"outfile"`
	ExecutionLogs      []workerutil.ExecutionLogEntry `json:"execution_logs"`
	Rank               *int                           `json:"placeInQueue"`
	AssociatedUploadID *int                           `json:"associatedUpload"`
}
```

Index is a subset of the lsif_indexes table and stores both processed and unprocessed records. 

#### <a id="scanFirstIndex" href="#scanFirstIndex">func scanFirstIndex(rows *sql.Rows, err error) (Index, bool, error)</a>

```
searchKey: dbstore.scanFirstIndex
```

```Go
func scanFirstIndex(rows *sql.Rows, err error) (Index, bool, error)
```

scanFirstIndex scans a slice of indexes from the return value of `*Store.query` and returns the first. 

#### <a id="Index.RecordID" href="#Index.RecordID">func (i Index) RecordID() int</a>

```
searchKey: dbstore.Index.RecordID
tags: [exported]
```

```Go
func (i Index) RecordID() int
```

### <a id="GetIndexesOptions" href="#GetIndexesOptions">type GetIndexesOptions struct</a>

```
searchKey: dbstore.GetIndexesOptions
tags: [exported]
```

```Go
type GetIndexesOptions struct {
	RepositoryID int
	State        string
	Term         string
	Limit        int
	Offset       int
}
```

### <a id="SourcedCommits" href="#SourcedCommits">type SourcedCommits struct</a>

```
searchKey: dbstore.SourcedCommits
tags: [exported]
```

```Go
type SourcedCommits struct {
	RepositoryID   int
	RepositoryName string
	Commits        []string
}
```

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: dbstore.operations
```

```Go
type operations struct {
	addUploadPart                          *observation.Operation
	calculateVisibleUploads                *observation.Operation
	commitGraphMetadata                    *observation.Operation
	definitionDumps                        *observation.Operation
	deleteIndexByID                        *observation.Operation
	deleteIndexesWithoutRepository         *observation.Operation
	deleteOldIndexes                       *observation.Operation
	deleteOverlappingDumps                 *observation.Operation
	deleteUploadByID                       *observation.Operation
	deleteUploadsStuckUploading            *observation.Operation
	deleteUploadsWithoutRepository         *observation.Operation
	dequeue                                *observation.Operation
	dequeueIndex                           *observation.Operation
	dirtyRepositories                      *observation.Operation
	findClosestDumps                       *observation.Operation
	findClosestDumpsFromGraphFragment      *observation.Operation
	getDumpsByIDs                          *observation.Operation
	getIndexByID                           *observation.Operation
	getIndexConfigurationByRepositoryID    *observation.Operation
	getIndexes                             *observation.Operation
	getIndexesByIDs                        *observation.Operation
	getOldestCommitDate                    *observation.Operation
	getRepositoriesWithIndexConfiguration  *observation.Operation
	getAutoindexDisabledRepositories       *observation.Operation
	getUploadByID                          *observation.Operation
	getUploads                             *observation.Operation
	getUploadsByIDs                        *observation.Operation
	hardDeleteUploadByID                   *observation.Operation
	hasCommit                              *observation.Operation
	hasRepository                          *observation.Operation
	indexQueueSize                         *observation.Operation
	insertDependencyIndexingJob            *observation.Operation
	insertIndex                            *observation.Operation
	insertUpload                           *observation.Operation
	isQueued                               *observation.Operation
	markComplete                           *observation.Operation
	markErrored                            *observation.Operation
	markFailed                             *observation.Operation
	markIndexComplete                      *observation.Operation
	markIndexErrored                       *observation.Operation
	markQueued                             *observation.Operation
	markRepositoryAsDirty                  *observation.Operation
	queueSize                              *observation.Operation
	referenceIDsAndFilters                 *observation.Operation
	referencesForUpload                    *observation.Operation
	refreshCommitResolvability             *observation.Operation
	repoName                               *observation.Operation
	requeue                                *observation.Operation
	requeueIndex                           *observation.Operation
	softDeleteOldUploads                   *observation.Operation
	staleSourcedCommits                    *observation.Operation
	updateCommitedAt                       *observation.Operation
	updateIndexConfigurationByRepositoryID *observation.Operation
	updatePackageReferences                *observation.Operation
	updatePackages                         *observation.Operation

	writeVisibleUploads        *observation.Operation
	persistNearestUploads      *observation.Operation
	persistNearestUploadsLinks *observation.Operation
	persistUploadsVisibleAtTip *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context) *operations</a>

```
searchKey: dbstore.newOperations
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: dbstore.Store
tags: [exported]
```

```Go
type Store struct {
	*basestore.Store
	operations *operations
}
```

#### <a id="NewWithDB" href="#NewWithDB">func NewWithDB(db dbutil.DB, observationContext *observation.Context) *Store</a>

```
searchKey: dbstore.NewWithDB
tags: [exported]
```

```Go
func NewWithDB(db dbutil.DB, observationContext *observation.Context) *Store
```

#### <a id="testStore" href="#testStore">func testStore(db dbutil.DB) *Store</a>

```
searchKey: dbstore.testStore
```

```Go
func testStore(db dbutil.DB) *Store
```

#### <a id="Store.HasRepository" href="#Store.HasRepository">func (s *Store) HasRepository(ctx context.Context, repositoryID int) (_ bool, err error)</a>

```
searchKey: dbstore.Store.HasRepository
tags: [exported]
```

```Go
func (s *Store) HasRepository(ctx context.Context, repositoryID int) (_ bool, err error)
```

HasRepository determines if there is LSIF data for the given repository. 

#### <a id="Store.HasCommit" href="#Store.HasCommit">func (s *Store) HasCommit(ctx context.Context, repositoryID int, commit string) (_ bool, err error)</a>

```
searchKey: dbstore.Store.HasCommit
tags: [exported]
```

```Go
func (s *Store) HasCommit(ctx context.Context, repositoryID int, commit string) (_ bool, err error)
```

HasCommit determines if the given commit is known for the given repository. 

#### <a id="Store.MarkRepositoryAsDirty" href="#Store.MarkRepositoryAsDirty">func (s *Store) MarkRepositoryAsDirty(ctx context.Context, repositoryID int) (err error)</a>

```
searchKey: dbstore.Store.MarkRepositoryAsDirty
tags: [exported]
```

```Go
func (s *Store) MarkRepositoryAsDirty(ctx context.Context, repositoryID int) (err error)
```

MarkRepositoryAsDirty marks the given repository's commit graph as out of date. 

#### <a id="Store.DirtyRepositories" href="#Store.DirtyRepositories">func (s *Store) DirtyRepositories(ctx context.Context) (_ map[int]int, err error)</a>

```
searchKey: dbstore.Store.DirtyRepositories
tags: [exported]
```

```Go
func (s *Store) DirtyRepositories(ctx context.Context) (_ map[int]int, err error)
```

DirtyRepositories returns a map from repository identifiers to a dirty token for each repository whose commit graph is out of date. This token should be passed to CalculateVisibleUploads in order to unmark the repository. 

#### <a id="Store.CommitGraphMetadata" href="#Store.CommitGraphMetadata">func (s *Store) CommitGraphMetadata(ctx context.Context, repositoryID int) (stale bool, updatedAt *time.Time, err error)</a>

```
searchKey: dbstore.Store.CommitGraphMetadata
tags: [exported]
```

```Go
func (s *Store) CommitGraphMetadata(ctx context.Context, repositoryID int) (stale bool, updatedAt *time.Time, err error)
```

CommitGraphMetadata returns whether or not the commit graph for the given repository is stale, along with the date of the most recent commit graph refresh for the given repository. 

#### <a id="Store.CalculateVisibleUploads" href="#Store.CalculateVisibleUploads">func (s *Store) CalculateVisibleUploads(ctx context.Context, repositoryID int, commitGraph *gitserver.CommitGraph, tipCommit string, dirtyToken int, now time.Time) (err error)</a>

```
searchKey: dbstore.Store.CalculateVisibleUploads
tags: [exported]
```

```Go
func (s *Store) CalculateVisibleUploads(ctx context.Context, repositoryID int, commitGraph *gitserver.CommitGraph, tipCommit string, dirtyToken int, now time.Time) (err error)
```

CalculateVisibleUploads uses the given commit graph and the tip commit of the default branch to determine the set of LSIF uploads that are visible for each commit, and the set of uploads which are visible at the tip. The decorated commit graph is serialized to Postgres for use by find closest dumps queries. 

If dirtyToken is supplied, the repository will be unmarked when the supplied token does matches the most recent token stored in the database, the flag will not be cleared as another request for update has come in since this token has been read. 

#### <a id="Store.writeVisibleUploads" href="#Store.writeVisibleUploads">func (s *Store) writeVisibleUploads(ctx context.Context, sanitizedInput *sanitizedCommitInput) (err error)</a>

```
searchKey: dbstore.Store.writeVisibleUploads
```

```Go
func (s *Store) writeVisibleUploads(ctx context.Context, sanitizedInput *sanitizedCommitInput) (err error)
```

writeVisibleUploads serializes the given input into a the following set of temporary tables in the database. 

```
- t_lsif_nearest_uploads        (mirroring lsif_nearest_uploads)
- t_lsif_nearest_uploads_links  (mirroring lsif_nearest_uploads_links)
- t_lsif_uploads_visible_at_tip (mirroring lsif_uploads_visible_at_tip)

```
The data in these temporary tables can then be moved into a persisted/permanent table. We previously would perform a bulk delete of the records associated with a repository, then reinsert all of the data needed to be persisted. This caused massive table bloat on some instances. Storing into a temporary table and then inserting/updating/deleting records into the persisted table minimizes the number of tuples we need to touch and drastically reduces table bloat. 

#### <a id="Store.createTemporaryNearestUploadsTables" href="#Store.createTemporaryNearestUploadsTables">func (s *Store) createTemporaryNearestUploadsTables(ctx context.Context) error</a>

```
searchKey: dbstore.Store.createTemporaryNearestUploadsTables
```

```Go
func (s *Store) createTemporaryNearestUploadsTables(ctx context.Context) error
```

#### <a id="Store.persistNearestUploads" href="#Store.persistNearestUploads">func (s *Store) persistNearestUploads(ctx context.Context, repositoryID int) (err error)</a>

```
searchKey: dbstore.Store.persistNearestUploads
```

```Go
func (s *Store) persistNearestUploads(ctx context.Context, repositoryID int) (err error)
```

persistNearestUploads modifies the lsif_nearest_uploads table so that it has same data as t_lsif_nearest_uploads for the given repository. 

#### <a id="Store.persistNearestUploadsLinks" href="#Store.persistNearestUploadsLinks">func (s *Store) persistNearestUploadsLinks(ctx context.Context, repositoryID int) (err error)</a>

```
searchKey: dbstore.Store.persistNearestUploadsLinks
```

```Go
func (s *Store) persistNearestUploadsLinks(ctx context.Context, repositoryID int) (err error)
```

persistNearestUploadsLinks modifies the lsif_nearest_uploads_links table so that it has same data as t_lsif_nearest_uploads_links for the given repository. 

#### <a id="Store.persistUploadsVisibleAtTip" href="#Store.persistUploadsVisibleAtTip">func (s *Store) persistUploadsVisibleAtTip(ctx context.Context, repositoryID int) (err error)</a>

```
searchKey: dbstore.Store.persistUploadsVisibleAtTip
```

```Go
func (s *Store) persistUploadsVisibleAtTip(ctx context.Context, repositoryID int) (err error)
```

persistUploadsVisibleAtTip modifies the lsif_uploads_visible_at_tip table so that it has same data as t_lsif_uploads_visible_at_tip for the given repository. 

#### <a id="Store.bulkTransfer" href="#Store.bulkTransfer">func (s *Store) bulkTransfer(ctx context.Context, insertQuery, updateQuery, deleteQuery *sqlf.Query) (rowsInserted int, rowsUpdated int, rowsDeleted int, err error)</a>

```
searchKey: dbstore.Store.bulkTransfer
```

```Go
func (s *Store) bulkTransfer(ctx context.Context, insertQuery, updateQuery, deleteQuery *sqlf.Query) (rowsInserted int, rowsUpdated int, rowsDeleted int, err error)
```

bulkTransfer performs the given insert, update, and delete queries and returns the number of records touched by each. If any query is nil, the returned count will be zero. 

#### <a id="Store.InsertDependencyIndexingJob" href="#Store.InsertDependencyIndexingJob">func (s *Store) InsertDependencyIndexingJob(ctx context.Context, uploadID int) (id int, err error)</a>

```
searchKey: dbstore.Store.InsertDependencyIndexingJob
tags: [exported]
```

```Go
func (s *Store) InsertDependencyIndexingJob(ctx context.Context, uploadID int) (id int, err error)
```

InsertDependencyIndexingJob inserts a new dependency indexing job and returns its identifier. 

#### <a id="Store.GetDumpsByIDs" href="#Store.GetDumpsByIDs">func (s *Store) GetDumpsByIDs(ctx context.Context, ids []int) (_ []Dump, err error)</a>

```
searchKey: dbstore.Store.GetDumpsByIDs
tags: [exported]
```

```Go
func (s *Store) GetDumpsByIDs(ctx context.Context, ids []int) (_ []Dump, err error)
```

GetDumpsByIDs returns a set of dumps by identifiers. 

#### <a id="Store.FindClosestDumps" href="#Store.FindClosestDumps">func (s *Store) FindClosestDumps(ctx context.Context, repositoryID int, commit, path string, rootMustEnclosePath bool, indexer string) (_ []Dump, err error)</a>

```
searchKey: dbstore.Store.FindClosestDumps
tags: [exported]
```

```Go
func (s *Store) FindClosestDumps(ctx context.Context, repositoryID int, commit, path string, rootMustEnclosePath bool, indexer string) (_ []Dump, err error)
```

FindClosestDumps returns the set of dumps that can most accurately answer queries for the given repository, commit, path, and optional indexer. If rootMustEnclosePath is true, then only dumps with a root which is a prefix of path are returned. Otherwise, any dump with a root intersecting the given path is returned. 

This method should be used when the commit is known to exist in the lsif_nearest_uploads table. If it doesn't, then this method will return no dumps (as the input commit is not reachable from anything with an upload). The nearest uploads table must be refreshed before calling this method when the commit is unknown. 

Because refreshing the commit graph can be very expensive, we also provide FindClosestDumpsFromGraphFragment. That method should be used instead in low-latency paths. It should be supplied a small fragment of the commit graph that contains the input commit as well as a commit that is likely to exist in the lsif_nearest_uploads table. This is enough to propagate the correct upload visibility data down the graph fragment. 

The graph supplied to FindClosestDumpsFromGraphFragment will also determine whether or not it is possible to produce a partial set of visible uploads (ideally, we'd like to return the complete set of visible uploads, or fail). If the graph fragment is complete by depth (e.g. if the graph contains an ancestor at depth d, then the graph also contains all other ancestors up to depth d), then we get the ideal behavior. Only if we contain a partial row of ancestors will we return partial results. 

#### <a id="Store.FindClosestDumpsFromGraphFragment" href="#Store.FindClosestDumpsFromGraphFragment">func (s *Store) FindClosestDumpsFromGraphFragment(ctx context.Context, repositoryID int, commit, path string, rootMustEnclosePath bool, indexer string, commitGraph *gitserver.CommitGraph) (_ []Dump, err error)</a>

```
searchKey: dbstore.Store.FindClosestDumpsFromGraphFragment
tags: [exported]
```

```Go
func (s *Store) FindClosestDumpsFromGraphFragment(ctx context.Context, repositoryID int, commit, path string, rootMustEnclosePath bool, indexer string, commitGraph *gitserver.CommitGraph) (_ []Dump, err error)
```

FindClosestDumpsFromGraphFragment returns the set of dumps that can most accurately answer queries for the given repository, commit, path, and optional indexer by only considering the given fragment of the full git graph. See FindClosestDumps for additional details. 

#### <a id="Store.DeleteOverlappingDumps" href="#Store.DeleteOverlappingDumps">func (s *Store) DeleteOverlappingDumps(ctx context.Context, repositoryID int, commit, root, indexer string) (err error)</a>

```
searchKey: dbstore.Store.DeleteOverlappingDumps
tags: [exported]
```

```Go
func (s *Store) DeleteOverlappingDumps(ctx context.Context, repositoryID int, commit, root, indexer string) (err error)
```

DeleteOverlapapingDumps deletes all completed uploads for the given repository with the same commit, root, and indexer. This is necessary to perform during conversions before changing the state of a processing upload to completed as there is a unique index on these four columns. 

#### <a id="Store.GetRepositoriesWithIndexConfiguration" href="#Store.GetRepositoriesWithIndexConfiguration">func (s *Store) GetRepositoriesWithIndexConfiguration(ctx context.Context) (_ []int, err error)</a>

```
searchKey: dbstore.Store.GetRepositoriesWithIndexConfiguration
tags: [exported]
```

```Go
func (s *Store) GetRepositoriesWithIndexConfiguration(ctx context.Context) (_ []int, err error)
```

GetRepositoriesWithIndexConfiguration returns the ids of repositories explicit index configuration. This does NOT return repositories that are disabled for autoindexing 

#### <a id="Store.GetAutoindexDisabledRepositories" href="#Store.GetAutoindexDisabledRepositories">func (s *Store) GetAutoindexDisabledRepositories(ctx context.Context) (_ []int, err error)</a>

```
searchKey: dbstore.Store.GetAutoindexDisabledRepositories
tags: [exported]
```

```Go
func (s *Store) GetAutoindexDisabledRepositories(ctx context.Context) (_ []int, err error)
```

#### <a id="Store.GetIndexConfigurationByRepositoryID" href="#Store.GetIndexConfigurationByRepositoryID">func (s *Store) GetIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int) (_ IndexConfiguration, _ bool, err error)</a>

```
searchKey: dbstore.Store.GetIndexConfigurationByRepositoryID
tags: [exported]
```

```Go
func (s *Store) GetIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int) (_ IndexConfiguration, _ bool, err error)
```

GetIndexConfigurationByRepositoryID returns the index configuration for a repository. 

#### <a id="Store.UpdateIndexConfigurationByRepositoryID" href="#Store.UpdateIndexConfigurationByRepositoryID">func (s *Store) UpdateIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int, data []byte) (err error)</a>

```
searchKey: dbstore.Store.UpdateIndexConfigurationByRepositoryID
tags: [exported]
```

```Go
func (s *Store) UpdateIndexConfigurationByRepositoryID(ctx context.Context, repositoryID int, data []byte) (err error)
```

UpdateIndexConfigurationByRepositoryID updates the index configuration for a repository. 

#### <a id="Store.GetIndexByID" href="#Store.GetIndexByID">func (s *Store) GetIndexByID(ctx context.Context, id int) (_ Index, _ bool, err error)</a>

```
searchKey: dbstore.Store.GetIndexByID
tags: [exported]
```

```Go
func (s *Store) GetIndexByID(ctx context.Context, id int) (_ Index, _ bool, err error)
```

GetIndexByID returns an index by its identifier and boolean flag indicating its existence. 

#### <a id="Store.GetIndexesByIDs" href="#Store.GetIndexesByIDs">func (s *Store) GetIndexesByIDs(ctx context.Context, ids ...int) (_ []Index, err error)</a>

```
searchKey: dbstore.Store.GetIndexesByIDs
tags: [exported]
```

```Go
func (s *Store) GetIndexesByIDs(ctx context.Context, ids ...int) (_ []Index, err error)
```

GetIndexesByIDs returns an index for each of the given identifiers. Not all given ids will necessarily have a corresponding element in the returned list. 

#### <a id="Store.GetIndexes" href="#Store.GetIndexes">func (s *Store) GetIndexes(ctx context.Context, opts GetIndexesOptions) (_ []Index, _ int, err error)</a>

```
searchKey: dbstore.Store.GetIndexes
tags: [exported]
```

```Go
func (s *Store) GetIndexes(ctx context.Context, opts GetIndexesOptions) (_ []Index, _ int, err error)
```

GetIndexes returns a list of indexes and the total count of records matching the given conditions. 

#### <a id="Store.IsQueued" href="#Store.IsQueued">func (s *Store) IsQueued(ctx context.Context, repositoryID int, commit string) (_ bool, err error)</a>

```
searchKey: dbstore.Store.IsQueued
tags: [exported]
```

```Go
func (s *Store) IsQueued(ctx context.Context, repositoryID int, commit string) (_ bool, err error)
```

IsQueued returns true if there is an index or an upload for the repository and commit. 

#### <a id="Store.InsertIndex" href="#Store.InsertIndex">func (s *Store) InsertIndex(ctx context.Context, index Index) (id int, err error)</a>

```
searchKey: dbstore.Store.InsertIndex
tags: [exported]
```

```Go
func (s *Store) InsertIndex(ctx context.Context, index Index) (id int, err error)
```

InsertIndex inserts a new index and returns its identifier. 

#### <a id="Store.DeleteIndexByID" href="#Store.DeleteIndexByID">func (s *Store) DeleteIndexByID(ctx context.Context, id int) (_ bool, err error)</a>

```
searchKey: dbstore.Store.DeleteIndexByID
tags: [exported]
```

```Go
func (s *Store) DeleteIndexByID(ctx context.Context, id int) (_ bool, err error)
```

DeleteIndexByID deletes an index by its identifier. 

#### <a id="Store.DeleteIndexesWithoutRepository" href="#Store.DeleteIndexesWithoutRepository">func (s *Store) DeleteIndexesWithoutRepository(ctx context.Context, now time.Time) (_ map[int]int, err error)</a>

```
searchKey: dbstore.Store.DeleteIndexesWithoutRepository
tags: [exported]
```

```Go
func (s *Store) DeleteIndexesWithoutRepository(ctx context.Context, now time.Time) (_ map[int]int, err error)
```

DeleteIndexesWithoutRepository deletes indexes associated with repositories that were deleted at least DeletedRepositoryGracePeriod ago. This returns the repository identifier mapped to the number of indexes that were removed for that repository. 

#### <a id="Store.DeleteOldIndexes" href="#Store.DeleteOldIndexes">func (s *Store) DeleteOldIndexes(ctx context.Context, maxAge time.Duration, now time.Time) (count int, err error)</a>

```
searchKey: dbstore.Store.DeleteOldIndexes
tags: [exported]
```

```Go
func (s *Store) DeleteOldIndexes(ctx context.Context, maxAge time.Duration, now time.Time) (count int, err error)
```

DeleteOldIndexes deletes indexes older than the given age. 

#### <a id="Store.StaleSourcedCommits" href="#Store.StaleSourcedCommits">func (s *Store) StaleSourcedCommits(ctx context.Context, minimumTimeSinceLastCheck time.Duration, limit int, now time.Time) (_ []SourcedCommits, err error)</a>

```
searchKey: dbstore.Store.StaleSourcedCommits
tags: [exported]
```

```Go
func (s *Store) StaleSourcedCommits(ctx context.Context, minimumTimeSinceLastCheck time.Duration, limit int, now time.Time) (_ []SourcedCommits, err error)
```

StaleSourcedCommits returns a set of commits attached to repositories that have been least recently checked for resolvability via gitserver. We do this periodically in order to determine which records in the database are unreachable by normal query paths and clean up that occupied (but useless) space. The output is of this method is ordered by repository ID then by commit. 

#### <a id="Store.RefreshCommitResolvability" href="#Store.RefreshCommitResolvability">func (s *Store) RefreshCommitResolvability(ctx context.Context, repositoryID int, commit string, delete bool, now time.Time) (uploadsUpdated int, indexesUpdated int, err error)</a>

```
searchKey: dbstore.Store.RefreshCommitResolvability
tags: [exported]
```

```Go
func (s *Store) RefreshCommitResolvability(ctx context.Context, repositoryID int, commit string, delete bool, now time.Time) (uploadsUpdated int, indexesUpdated int, err error)
```

RefreshCommitResolvability will update each upload and index record belonging to the given repository identifier and commit. If the delete flag is true, then the state of each matching record will be soft-deleted. Regardless, the commit_last_checked_at value will be bumped to the current (given) time. This method returns the count of upload and index records modified, respectively. 

#### <a id="Store.UpdatePackages" href="#Store.UpdatePackages">func (s *Store) UpdatePackages(ctx context.Context, dumpID int, packages []semantic.Package) (err error)</a>

```
searchKey: dbstore.Store.UpdatePackages
tags: [exported]
```

```Go
func (s *Store) UpdatePackages(ctx context.Context, dumpID int, packages []semantic.Package) (err error)
```

UpdatePackages upserts package data tied to the given upload. 

#### <a id="Store.UpdatePackageReferences" href="#Store.UpdatePackageReferences">func (s *Store) UpdatePackageReferences(ctx context.Context, dumpID int, references []semantic.PackageReference) (err error)</a>

```
searchKey: dbstore.Store.UpdatePackageReferences
tags: [exported]
```

```Go
func (s *Store) UpdatePackageReferences(ctx context.Context, dumpID int, references []semantic.PackageReference) (err error)
```

UpdatePackageReferences inserts reference data tied to the given upload. 

#### <a id="Store.RepoName" href="#Store.RepoName">func (s *Store) RepoName(ctx context.Context, repositoryID int) (_ string, err error)</a>

```
searchKey: dbstore.Store.RepoName
tags: [exported]
```

```Go
func (s *Store) RepoName(ctx context.Context, repositoryID int) (_ string, err error)
```

RepoName returns the name for the repo with the given identifier. 

#### <a id="Store.With" href="#Store.With">func (s *Store) With(other basestore.ShareableStore) *Store</a>

```
searchKey: dbstore.Store.With
tags: [exported]
```

```Go
func (s *Store) With(other basestore.ShareableStore) *Store
```

#### <a id="Store.Transact" href="#Store.Transact">func (s *Store) Transact(ctx context.Context) (*Store, error)</a>

```
searchKey: dbstore.Store.Transact
tags: [exported]
```

```Go
func (s *Store) Transact(ctx context.Context) (*Store, error)
```

#### <a id="Store.transact" href="#Store.transact">func (s *Store) transact(ctx context.Context) (*Store, error)</a>

```
searchKey: dbstore.Store.transact
```

```Go
func (s *Store) transact(ctx context.Context) (*Store, error)
```

#### <a id="Store.GetUploadByID" href="#Store.GetUploadByID">func (s *Store) GetUploadByID(ctx context.Context, id int) (_ Upload, _ bool, err error)</a>

```
searchKey: dbstore.Store.GetUploadByID
tags: [exported]
```

```Go
func (s *Store) GetUploadByID(ctx context.Context, id int) (_ Upload, _ bool, err error)
```

GetUploadByID returns an upload by its identifier and boolean flag indicating its existence. 

#### <a id="Store.GetUploadsByIDs" href="#Store.GetUploadsByIDs">func (s *Store) GetUploadsByIDs(ctx context.Context, ids ...int) (_ []Upload, err error)</a>

```
searchKey: dbstore.Store.GetUploadsByIDs
tags: [exported]
```

```Go
func (s *Store) GetUploadsByIDs(ctx context.Context, ids ...int) (_ []Upload, err error)
```

GetUploadsByIDs returns an upload for each of the given identifiers. Not all given ids will necessarily have a corresponding element in the returned list. 

#### <a id="Store.DeleteUploadsStuckUploading" href="#Store.DeleteUploadsStuckUploading">func (s *Store) DeleteUploadsStuckUploading(ctx context.Context, uploadedBefore time.Time) (_ int, err error)</a>

```
searchKey: dbstore.Store.DeleteUploadsStuckUploading
tags: [exported]
```

```Go
func (s *Store) DeleteUploadsStuckUploading(ctx context.Context, uploadedBefore time.Time) (_ int, err error)
```

DeleteUploadsStuckUploading soft deletes any upload record that has been uploading since the given time. 

#### <a id="Store.GetUploads" href="#Store.GetUploads">func (s *Store) GetUploads(ctx context.Context, opts GetUploadsOptions) (_ []Upload, _ int, err error)</a>

```
searchKey: dbstore.Store.GetUploads
tags: [exported]
```

```Go
func (s *Store) GetUploads(ctx context.Context, opts GetUploadsOptions) (_ []Upload, _ int, err error)
```

GetUploads returns a list of uploads and the total count of records matching the given conditions. 

#### <a id="Store.InsertUpload" href="#Store.InsertUpload">func (s *Store) InsertUpload(ctx context.Context, upload Upload) (id int, err error)</a>

```
searchKey: dbstore.Store.InsertUpload
tags: [exported]
```

```Go
func (s *Store) InsertUpload(ctx context.Context, upload Upload) (id int, err error)
```

InsertUpload inserts a new upload and returns its identifier. 

#### <a id="Store.AddUploadPart" href="#Store.AddUploadPart">func (s *Store) AddUploadPart(ctx context.Context, uploadID, partIndex int) (err error)</a>

```
searchKey: dbstore.Store.AddUploadPart
tags: [exported]
```

```Go
func (s *Store) AddUploadPart(ctx context.Context, uploadID, partIndex int) (err error)
```

AddUploadPart adds the part index to the given upload's uploaded parts array. This method is idempotent (the resulting array is deduplicated on update). 

#### <a id="Store.MarkQueued" href="#Store.MarkQueued">func (s *Store) MarkQueued(ctx context.Context, id int, uploadSize *int64) (err error)</a>

```
searchKey: dbstore.Store.MarkQueued
tags: [exported]
```

```Go
func (s *Store) MarkQueued(ctx context.Context, id int, uploadSize *int64) (err error)
```

MarkQueued updates the state of the upload to queued and updates the upload size. 

#### <a id="Store.MarkFailed" href="#Store.MarkFailed">func (s *Store) MarkFailed(ctx context.Context, id int, reason string) (err error)</a>

```
searchKey: dbstore.Store.MarkFailed
tags: [exported]
```

```Go
func (s *Store) MarkFailed(ctx context.Context, id int, reason string) (err error)
```

MarkFailed updates the state of the upload to failed, increments the num_failures column and sets the finished_at time 

#### <a id="Store.DeleteUploadByID" href="#Store.DeleteUploadByID">func (s *Store) DeleteUploadByID(ctx context.Context, id int) (_ bool, err error)</a>

```
searchKey: dbstore.Store.DeleteUploadByID
tags: [exported]
```

```Go
func (s *Store) DeleteUploadByID(ctx context.Context, id int) (_ bool, err error)
```

DeleteUploadByID deletes an upload by its identifier. This method returns a true-valued flag if a record was deleted. The associated repository will be marked as dirty so that its commit graph will be updated in the background. 

#### <a id="Store.DeleteUploadsWithoutRepository" href="#Store.DeleteUploadsWithoutRepository">func (s *Store) DeleteUploadsWithoutRepository(ctx context.Context, now time.Time) (_ map[int]int, err error)</a>

```
searchKey: dbstore.Store.DeleteUploadsWithoutRepository
tags: [exported]
```

```Go
func (s *Store) DeleteUploadsWithoutRepository(ctx context.Context, now time.Time) (_ map[int]int, err error)
```

DeleteUploadsWithoutRepository deletes uploads associated with repositories that were deleted at least DeletedRepositoryGracePeriod ago. This returns the repository identifier mapped to the number of uploads that were removed for that repository. 

#### <a id="Store.HardDeleteUploadByID" href="#Store.HardDeleteUploadByID">func (s *Store) HardDeleteUploadByID(ctx context.Context, ids ...int) (err error)</a>

```
searchKey: dbstore.Store.HardDeleteUploadByID
tags: [exported]
```

```Go
func (s *Store) HardDeleteUploadByID(ctx context.Context, ids ...int) (err error)
```

HardDeleteUploadByID deletes the upload record with the given identifier. 

#### <a id="Store.SoftDeleteOldUploads" href="#Store.SoftDeleteOldUploads">func (s *Store) SoftDeleteOldUploads(ctx context.Context, maxAge time.Duration, now time.Time) (count int, err error)</a>

```
searchKey: dbstore.Store.SoftDeleteOldUploads
tags: [exported]
```

```Go
func (s *Store) SoftDeleteOldUploads(ctx context.Context, maxAge time.Duration, now time.Time) (count int, err error)
```

SoftDeleteOldUploads marks uploads older than the given age that are not visible at the tip of the default branch as deleted. The associated repositories will be marked as dirty so that their commit graphs are updated in the background. 

#### <a id="Store.GetOldestCommitDate" href="#Store.GetOldestCommitDate">func (s *Store) GetOldestCommitDate(ctx context.Context, repositoryID int) (_ time.Time, _ bool, err error)</a>

```
searchKey: dbstore.Store.GetOldestCommitDate
tags: [exported]
```

```Go
func (s *Store) GetOldestCommitDate(ctx context.Context, repositoryID int) (_ time.Time, _ bool, err error)
```

GetOldestCommitDate returns the oldest commit date for all uploads for the given repository. If there are no non-nil values, a false-valued flag is returned. 

#### <a id="Store.UpdateCommitedAt" href="#Store.UpdateCommitedAt">func (s *Store) UpdateCommitedAt(ctx context.Context, uploadID int, committedAt time.Time) (err error)</a>

```
searchKey: dbstore.Store.UpdateCommitedAt
tags: [exported]
```

```Go
func (s *Store) UpdateCommitedAt(ctx context.Context, uploadID int, committedAt time.Time) (err error)
```

UpdateCommitedAt updates the commit date for the given repository. 

#### <a id="Store.DefinitionDumps" href="#Store.DefinitionDumps">func (s *Store) DefinitionDumps(ctx context.Context, monikers []semantic.QualifiedMonikerData) (_ []Dump, err error)</a>

```
searchKey: dbstore.Store.DefinitionDumps
tags: [exported]
```

```Go
func (s *Store) DefinitionDumps(ctx context.Context, monikers []semantic.QualifiedMonikerData) (_ []Dump, err error)
```

DefinitionDumps returns the set of dumps that define at least one of the given monikers. 

#### <a id="Store.ReferenceIDsAndFilters" href="#Store.ReferenceIDsAndFilters">func (s *Store) ReferenceIDsAndFilters(ctx context.Context, repositoryID int, commit string, monikers []semantic.QualifiedMonikerData, limit, offset int) (_ PackageReferenceScanner, _ int, err error)</a>

```
searchKey: dbstore.Store.ReferenceIDsAndFilters
tags: [exported]
```

```Go
func (s *Store) ReferenceIDsAndFilters(ctx context.Context, repositoryID int, commit string, monikers []semantic.QualifiedMonikerData, limit, offset int) (_ PackageReferenceScanner, _ int, err error)
```

ReferenceIDsAndFilters returns the total count of visible uploads that may refer to one of the given monikers. Each upload identifier in the result set is paired with one or more compressed bloom filters that encode more precisely the set of identifiers imported from dependent packages. 

Visibility is determined in two parts: if the index belongs to the given repository, it is visible if it can be seen from the given index; otherwise, an index is visible if it can be seen from the tip of the default branch of its own repository. 

#### <a id="Store.ReferencesForUpload" href="#Store.ReferencesForUpload">func (s *Store) ReferencesForUpload(ctx context.Context, uploadID int) (_ PackageReferenceScanner, err error)</a>

```
searchKey: dbstore.Store.ReferencesForUpload
tags: [exported]
```

```Go
func (s *Store) ReferencesForUpload(ctx context.Context, uploadID int) (_ PackageReferenceScanner, err error)
```

ReferencesForUpload returns the set of import monikers attached to the given upload identifier. The scanner will return nulls for the Filter field as it's expected to be unused (and rather heavy) by callers. 

### <a id="Upload" href="#Upload">type Upload struct</a>

```
searchKey: dbstore.Upload
tags: [exported]
```

```Go
type Upload struct {
	ID                int        `json:"id"`
	Commit            string     `json:"commit"`
	Root              string     `json:"root"`
	VisibleAtTip      bool       `json:"visibleAtTip"`
	UploadedAt        time.Time  `json:"uploadedAt"`
	State             string     `json:"state"`
	FailureMessage    *string    `json:"failureMessage"`
	StartedAt         *time.Time `json:"startedAt"`
	FinishedAt        *time.Time `json:"finishedAt"`
	ProcessAfter      *time.Time `json:"processAfter"`
	NumResets         int        `json:"numResets"`
	NumFailures       int        `json:"numFailures"`
	RepositoryID      int        `json:"repositoryId"`
	RepositoryName    string     `json:"repositoryName"`
	Indexer           string     `json:"indexer"`
	NumParts          int        `json:"numParts"`
	UploadedParts     []int      `json:"uploadedParts"`
	UploadSize        *int64     `json:"uploadSize"`
	Rank              *int       `json:"placeInQueue"`
	AssociatedIndexID *int       `json:"associatedIndex"`
}
```

Upload is a subset of the lsif_uploads table and stores both processed and unprocessed records. 

#### <a id="scanFirstUpload" href="#scanFirstUpload">func scanFirstUpload(rows *sql.Rows, err error) (Upload, bool, error)</a>

```
searchKey: dbstore.scanFirstUpload
```

```Go
func scanFirstUpload(rows *sql.Rows, err error) (Upload, bool, error)
```

scanFirstUpload scans a slice of uploads from the return value of `*Store.query` and returns the first. 

#### <a id="dumpToUpload" href="#dumpToUpload">func dumpToUpload(expected Dump) Upload</a>

```
searchKey: dbstore.dumpToUpload
```

```Go
func dumpToUpload(expected Dump) Upload
```

#### <a id="Upload.RecordID" href="#Upload.RecordID">func (u Upload) RecordID() int</a>

```
searchKey: dbstore.Upload.RecordID
tags: [exported]
```

```Go
func (u Upload) RecordID() int
```

### <a id="GetUploadsOptions" href="#GetUploadsOptions">type GetUploadsOptions struct</a>

```
searchKey: dbstore.GetUploadsOptions
tags: [exported]
```

```Go
type GetUploadsOptions struct {
	RepositoryID   int
	State          string
	Term           string
	VisibleAtTip   bool
	UploadedBefore *time.Time
	UploadedAfter  *time.Time
	OldestFirst    bool
	Limit          int
	Offset         int
}
```

### <a id="PackageReferenceScanner" href="#PackageReferenceScanner">type PackageReferenceScanner interface</a>

```
searchKey: dbstore.PackageReferenceScanner
tags: [exported]
```

```Go
type PackageReferenceScanner interface {
	// Next reads the next package reference value from the database cursor.
	Next() (lsifstore.PackageReference, bool, error)

	// Close the underlying row object.
	Close() error
}
```

PackageReferenceScanner allows for on-demand scanning of PackageReference values. 

A scanner for this type was introduced as a memory optimization. Instead of reading a large number of large byte arrays into memory at once, we allow the user to request the next filter value when they are ready to process it. This allows us to hold only a single bloom filter in memory at any give time during reference requests. 

#### <a id="packageReferenceScannerFromRows" href="#packageReferenceScannerFromRows">func packageReferenceScannerFromRows(rows *sql.Rows) PackageReferenceScanner</a>

```
searchKey: dbstore.packageReferenceScannerFromRows
```

```Go
func packageReferenceScannerFromRows(rows *sql.Rows) PackageReferenceScanner
```

packageReferenceScannerFromRows creates a PackageReferenceScanner that feeds the given values. 

#### <a id="PackageReferenceScannerFromSlice" href="#PackageReferenceScannerFromSlice">func PackageReferenceScannerFromSlice(references ...lsifstore.PackageReference) PackageReferenceScanner</a>

```
searchKey: dbstore.PackageReferenceScannerFromSlice
tags: [exported]
```

```Go
func PackageReferenceScannerFromSlice(references ...lsifstore.PackageReference) PackageReferenceScanner
```

PackageReferenceScannerFromSlice creates a PackageReferenceScanner that feeds the given values. 

### <a id="rowScanner" href="#rowScanner">type rowScanner struct</a>

```
searchKey: dbstore.rowScanner
```

```Go
type rowScanner struct {
	rows *sql.Rows
}
```

#### <a id="rowScanner.Next" href="#rowScanner.Next">func (s *rowScanner) Next() (reference lsifstore.PackageReference, _ bool, _ error)</a>

```
searchKey: dbstore.rowScanner.Next
```

```Go
func (s *rowScanner) Next() (reference lsifstore.PackageReference, _ bool, _ error)
```

Next reads the next package reference value from the database cursor. 

#### <a id="rowScanner.Close" href="#rowScanner.Close">func (s *rowScanner) Close() error</a>

```
searchKey: dbstore.rowScanner.Close
```

```Go
func (s *rowScanner) Close() error
```

Close the underlying row object. 

### <a id="sliceScanner" href="#sliceScanner">type sliceScanner struct</a>

```
searchKey: dbstore.sliceScanner
```

```Go
type sliceScanner struct {
	references []lsifstore.PackageReference
}
```

#### <a id="sliceScanner.Next" href="#sliceScanner.Next">func (s *sliceScanner) Next() (lsifstore.PackageReference, bool, error)</a>

```
searchKey: dbstore.sliceScanner.Next
```

```Go
func (s *sliceScanner) Next() (lsifstore.PackageReference, bool, error)
```

#### <a id="sliceScanner.Close" href="#sliceScanner.Close">func (s *sliceScanner) Close() error</a>

```
searchKey: dbstore.sliceScanner.Close
```

```Go
func (s *sliceScanner) Close() error
```

### <a id="FindClosestDumpsTestCase" href="#FindClosestDumpsTestCase">type FindClosestDumpsTestCase struct</a>

```
searchKey: dbstore.FindClosestDumpsTestCase
```

```Go
type FindClosestDumpsTestCase struct {
	commit              string
	file                string
	rootMustEnclosePath bool
	indexer             string
	graph               *gitserver.CommitGraph
	graphFragmentOnly   bool
	anyOfIDs            []int
	allOfIDs            []int
}
```

### <a id="printableRank" href="#printableRank">type printableRank struct</a>

```
searchKey: dbstore.printableRank
```

```Go
type printableRank struct{ value *int }
```

#### <a id="printableRank.String" href="#printableRank.String">func (r printableRank) String() string</a>

```
searchKey: dbstore.printableRank.String
```

```Go
func (r printableRank) String() string
```

## <a id="func" href="#func">Functions</a>

### <a id="scanCommitGraphView" href="#scanCommitGraphView">func scanCommitGraphView(rows *sql.Rows, queryErr error) (_ *commitgraph.CommitGraphView, err error)</a>

```
searchKey: dbstore.scanCommitGraphView
```

```Go
func scanCommitGraphView(rows *sql.Rows, queryErr error) (_ *commitgraph.CommitGraphView, err error)
```

scanCommitGraphView scans a commit graph view from the return value of `*Store.query`. 

### <a id="scanIntPairs" href="#scanIntPairs">func scanIntPairs(rows *sql.Rows, queryErr error) (_ map[int]int, err error)</a>

```
searchKey: dbstore.scanIntPairs
```

```Go
func scanIntPairs(rows *sql.Rows, queryErr error) (_ map[int]int, err error)
```

### <a id="scanCommitGraphMetadata" href="#scanCommitGraphMetadata">func scanCommitGraphMetadata(rows *sql.Rows, queryErr error) (updateToken, dirtyToken int, updatedAt *time.Time, _ bool, err error)</a>

```
searchKey: dbstore.scanCommitGraphMetadata
```

```Go
func scanCommitGraphMetadata(rows *sql.Rows, queryErr error) (updateToken, dirtyToken int, updatedAt *time.Time, _ bool, err error)
```

scanCommitGraphMetadata scans a a commit graph metadata row from the return value of `*Store.query`. 

### <a id="countingWrite" href="#countingWrite">func countingWrite(ctx context.Context, ch chan<- []interface{}, counter *uint32, values ...interface{}) bool</a>

```
searchKey: dbstore.countingWrite
```

```Go
func countingWrite(ctx context.Context, ch chan<- []interface{}, counter *uint32, values ...interface{}) bool
```

countingWrite writes the given slice of interfaces to the given channel. This function returns true if the write succeeded and false if the context was canceled. On success, the counter's underlying value will be incremented (non-atomically). 

### <a id="scanDependencyIndexingJobs" href="#scanDependencyIndexingJobs">func scanDependencyIndexingJobs(rows *sql.Rows, queryErr error) (_ []DependencyIndexingJob, err error)</a>

```
searchKey: dbstore.scanDependencyIndexingJobs
```

```Go
func scanDependencyIndexingJobs(rows *sql.Rows, queryErr error) (_ []DependencyIndexingJob, err error)
```

scanDependencyIndexingJob scans a slice of dependency indexing jobs from the return value of `*Store.query`. 

### <a id="scanFirstDependencyIndexingJobRecord" href="#scanFirstDependencyIndexingJobRecord">func scanFirstDependencyIndexingJobRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: dbstore.scanFirstDependencyIndexingJobRecord
```

```Go
func scanFirstDependencyIndexingJobRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

scanFirstDependencyIndexingJobRecord scans a slice of dependency indexing jobs from the return value of `*Store.query` and returns the first. 

### <a id="scanDumps" href="#scanDumps">func scanDumps(rows *sql.Rows, queryErr error) (_ []Dump, err error)</a>

```
searchKey: dbstore.scanDumps
```

```Go
func scanDumps(rows *sql.Rows, queryErr error) (_ []Dump, err error)
```

scanDumps scans a slice of dumps from the return value of `*Store.query`. 

### <a id="makeVisibleUploadCandidatesQuery" href="#makeVisibleUploadCandidatesQuery">func makeVisibleUploadCandidatesQuery(repositoryID int, commits ...string) *sqlf.Query</a>

```
searchKey: dbstore.makeVisibleUploadCandidatesQuery
```

```Go
func makeVisibleUploadCandidatesQuery(repositoryID int, commits ...string) *sqlf.Query
```

makeVisibleUploadCandidatesQuery returns a SQL query returning the set of uploads visible from the given commits. This is done by looking at each commit's row in the lsif_nearest_uploads, and the (adjusted) set of uploads visible from each commit's nearest ancestor according to data compressed in the links table. 

NB: A commit should be present in at most one of these tables. 

### <a id="makeVisibleUploadsQuery" href="#makeVisibleUploadsQuery">func makeVisibleUploadsQuery(repositoryID int, commit string) *sqlf.Query</a>

```
searchKey: dbstore.makeVisibleUploadsQuery
```

```Go
func makeVisibleUploadsQuery(repositoryID int, commit string) *sqlf.Query
```

makeVisibleUploadsQuery returns a SQL query returning the set of identifiers of uploads visible from the given commit. This is done by removing the "shadowed" values created by looking at a commit and it's ancestors visible commits. 

### <a id="makeFindClosestDumpConditions" href="#makeFindClosestDumpConditions">func makeFindClosestDumpConditions(path string, rootMustEnclosePath bool, indexer string) (conds []*sqlf.Query)</a>

```
searchKey: dbstore.makeFindClosestDumpConditions
```

```Go
func makeFindClosestDumpConditions(path string, rootMustEnclosePath bool, indexer string) (conds []*sqlf.Query)
```

### <a id="scanIndexConfigurations" href="#scanIndexConfigurations">func scanIndexConfigurations(rows *sql.Rows, queryErr error) (_ []IndexConfiguration, err error)</a>

```
searchKey: dbstore.scanIndexConfigurations
```

```Go
func scanIndexConfigurations(rows *sql.Rows, queryErr error) (_ []IndexConfiguration, err error)
```

scanIndexConfigurations scans a slice of index configurations from the return value of `*Store.query`. 

### <a id="scanIndexes" href="#scanIndexes">func scanIndexes(rows *sql.Rows, queryErr error) (_ []Index, err error)</a>

```
searchKey: dbstore.scanIndexes
```

```Go
func scanIndexes(rows *sql.Rows, queryErr error) (_ []Index, err error)
```

scanIndexes scans a slice of indexes from the return value of `*Store.query`. 

### <a id="scanFirstIndexRecord" href="#scanFirstIndexRecord">func scanFirstIndexRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: dbstore.scanFirstIndexRecord
```

```Go
func scanFirstIndexRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

scanFirstIndexInterface scans a slice of indexes from the return value of `*Store.query` and returns the first. 

### <a id="makeIndexSearchCondition" href="#makeIndexSearchCondition">func makeIndexSearchCondition(term string) *sqlf.Query</a>

```
searchKey: dbstore.makeIndexSearchCondition
```

```Go
func makeIndexSearchCondition(term string) *sqlf.Query
```

makeIndexSearchCondition returns a disjunction of LIKE clauses against all searchable columns of an index. 

### <a id="ScanSourcedCommits" href="#ScanSourcedCommits">func ScanSourcedCommits(rows *sql.Rows, queryErr error) (_ []SourcedCommits, err error)</a>

```
searchKey: dbstore.ScanSourcedCommits
tags: [exported]
```

```Go
func ScanSourcedCommits(rows *sql.Rows, queryErr error) (_ []SourcedCommits, err error)
```

ScanSourcedCommits scans triples of repository ids/repository names/commits from the return value of `*Store.query`. The output of this function is ordered by repository identifier, then by commit. 

### <a id="loadPackagesChannel" href="#loadPackagesChannel">func loadPackagesChannel(packages []semantic.Package) <-chan []interface{}</a>

```
searchKey: dbstore.loadPackagesChannel
```

```Go
func loadPackagesChannel(packages []semantic.Package) <-chan []interface{}
```

### <a id="loadReferencesChannel" href="#loadReferencesChannel">func loadReferencesChannel(references []semantic.PackageReference) <-chan []interface{}</a>

```
searchKey: dbstore.loadReferencesChannel
```

```Go
func loadReferencesChannel(references []semantic.PackageReference) <-chan []interface{}
```

### <a id="intsToQueries" href="#intsToQueries">func intsToQueries(values []int) []*sqlf.Query</a>

```
searchKey: dbstore.intsToQueries
```

```Go
func intsToQueries(values []int) []*sqlf.Query
```

intsToQueries converts a slice of ints into a slice of queries. 

### <a id="scanUploads" href="#scanUploads">func scanUploads(rows *sql.Rows, queryErr error) (_ []Upload, err error)</a>

```
searchKey: dbstore.scanUploads
```

```Go
func scanUploads(rows *sql.Rows, queryErr error) (_ []Upload, err error)
```

scanUploads scans a slice of uploads from the return value of `*Store.query`. 

### <a id="scanFirstUploadRecord" href="#scanFirstUploadRecord">func scanFirstUploadRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: dbstore.scanFirstUploadRecord
```

```Go
func scanFirstUploadRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

scanFirstUploadRecord scans a slice of uploads from the return value of `*Store.query` and returns the first. 

### <a id="scanCounts" href="#scanCounts">func scanCounts(rows *sql.Rows, queryErr error) (_ map[int]int, err error)</a>

```
searchKey: dbstore.scanCounts
```

```Go
func scanCounts(rows *sql.Rows, queryErr error) (_ map[int]int, err error)
```

scanCounts scans pairs of id/counts from the return value of `*Store.query`. 

### <a id="makeSearchCondition" href="#makeSearchCondition">func makeSearchCondition(term string) *sqlf.Query</a>

```
searchKey: dbstore.makeSearchCondition
```

```Go
func makeSearchCondition(term string) *sqlf.Query
```

makeSearchCondition returns a disjunction of LIKE clauses against all searchable columns of an upload. 

### <a id="intsToString" href="#intsToString">func intsToString(vs []int) string</a>

```
searchKey: dbstore.intsToString
```

```Go
func intsToString(vs []int) string
```

### <a id="nilTimeToString" href="#nilTimeToString">func nilTimeToString(t *time.Time) string</a>

```
searchKey: dbstore.nilTimeToString
```

```Go
func nilTimeToString(t *time.Time) string
```

### <a id="WorkerutilUploadStore" href="#WorkerutilUploadStore">func WorkerutilUploadStore(s basestore.ShareableStore, observationContext *observation.Context) dbworkerstore.Store</a>

```
searchKey: dbstore.WorkerutilUploadStore
tags: [exported]
```

```Go
func WorkerutilUploadStore(s basestore.ShareableStore, observationContext *observation.Context) dbworkerstore.Store
```

### <a id="WorkerutilIndexStore" href="#WorkerutilIndexStore">func WorkerutilIndexStore(s basestore.ShareableStore, observationContext *observation.Context) dbworkerstore.Store</a>

```
searchKey: dbstore.WorkerutilIndexStore
tags: [exported]
```

```Go
func WorkerutilIndexStore(s basestore.ShareableStore, observationContext *observation.Context) dbworkerstore.Store
```

### <a id="WorkerutilDependencyIndexingJobStore" href="#WorkerutilDependencyIndexingJobStore">func WorkerutilDependencyIndexingJobStore(s basestore.ShareableStore, observationContext *observation.Context) dbworkerstore.Store</a>

```
searchKey: dbstore.WorkerutilDependencyIndexingJobStore
tags: [exported]
```

```Go
func WorkerutilDependencyIndexingJobStore(s basestore.ShareableStore, observationContext *observation.Context) dbworkerstore.Store
```

### <a id="monikersToString" href="#monikersToString">func monikersToString(vs []semantic.QualifiedMonikerData) string</a>

```
searchKey: dbstore.monikersToString
```

```Go
func monikersToString(vs []semantic.QualifiedMonikerData) string
```

### <a id="TestHasRepository" href="#TestHasRepository">func TestHasRepository(t *testing.T)</a>

```
searchKey: dbstore.TestHasRepository
```

```Go
func TestHasRepository(t *testing.T)
```

### <a id="TestHasCommit" href="#TestHasCommit">func TestHasCommit(t *testing.T)</a>

```
searchKey: dbstore.TestHasCommit
```

```Go
func TestHasCommit(t *testing.T)
```

### <a id="TestMarkRepositoryAsDirty" href="#TestMarkRepositoryAsDirty">func TestMarkRepositoryAsDirty(t *testing.T)</a>

```
searchKey: dbstore.TestMarkRepositoryAsDirty
```

```Go
func TestMarkRepositoryAsDirty(t *testing.T)
```

### <a id="TestSkipsDeletedRepositories" href="#TestSkipsDeletedRepositories">func TestSkipsDeletedRepositories(t *testing.T)</a>

```
searchKey: dbstore.TestSkipsDeletedRepositories
```

```Go
func TestSkipsDeletedRepositories(t *testing.T)
```

### <a id="TestCommitGraphMetadata" href="#TestCommitGraphMetadata">func TestCommitGraphMetadata(t *testing.T)</a>

```
searchKey: dbstore.TestCommitGraphMetadata
```

```Go
func TestCommitGraphMetadata(t *testing.T)
```

### <a id="TestCalculateVisibleUploads" href="#TestCalculateVisibleUploads">func TestCalculateVisibleUploads(t *testing.T)</a>

```
searchKey: dbstore.TestCalculateVisibleUploads
```

```Go
func TestCalculateVisibleUploads(t *testing.T)
```

### <a id="TestCalculateVisibleUploadsAlternateCommitGraph" href="#TestCalculateVisibleUploadsAlternateCommitGraph">func TestCalculateVisibleUploadsAlternateCommitGraph(t *testing.T)</a>

```
searchKey: dbstore.TestCalculateVisibleUploadsAlternateCommitGraph
```

```Go
func TestCalculateVisibleUploadsAlternateCommitGraph(t *testing.T)
```

### <a id="TestCalculateVisibleUploadsDistinctRoots" href="#TestCalculateVisibleUploadsDistinctRoots">func TestCalculateVisibleUploadsDistinctRoots(t *testing.T)</a>

```
searchKey: dbstore.TestCalculateVisibleUploadsDistinctRoots
```

```Go
func TestCalculateVisibleUploadsDistinctRoots(t *testing.T)
```

### <a id="TestCalculateVisibleUploadsOverlappingRoots" href="#TestCalculateVisibleUploadsOverlappingRoots">func TestCalculateVisibleUploadsOverlappingRoots(t *testing.T)</a>

```
searchKey: dbstore.TestCalculateVisibleUploadsOverlappingRoots
```

```Go
func TestCalculateVisibleUploadsOverlappingRoots(t *testing.T)
```

### <a id="TestCalculateVisibleUploadsIndexerName" href="#TestCalculateVisibleUploadsIndexerName">func TestCalculateVisibleUploadsIndexerName(t *testing.T)</a>

```
searchKey: dbstore.TestCalculateVisibleUploadsIndexerName
```

```Go
func TestCalculateVisibleUploadsIndexerName(t *testing.T)
```

### <a id="TestCalculateVisibleUploadsResetsDirtyFlag" href="#TestCalculateVisibleUploadsResetsDirtyFlag">func TestCalculateVisibleUploadsResetsDirtyFlag(t *testing.T)</a>

```
searchKey: dbstore.TestCalculateVisibleUploadsResetsDirtyFlag
```

```Go
func TestCalculateVisibleUploadsResetsDirtyFlag(t *testing.T)
```

### <a id="keysOf" href="#keysOf">func keysOf(m map[string][]int) (keys []string)</a>

```
searchKey: dbstore.keysOf
```

```Go
func keysOf(m map[string][]int) (keys []string)
```

### <a id="BenchmarkCalculateVisibleUploads" href="#BenchmarkCalculateVisibleUploads">func BenchmarkCalculateVisibleUploads(b *testing.B)</a>

```
searchKey: dbstore.BenchmarkCalculateVisibleUploads
```

```Go
func BenchmarkCalculateVisibleUploads(b *testing.B)
```

### <a id="readBenchmarkCommitGraph" href="#readBenchmarkCommitGraph">func readBenchmarkCommitGraph() (*gitserver.CommitGraph, error)</a>

```
searchKey: dbstore.readBenchmarkCommitGraph
```

```Go
func readBenchmarkCommitGraph() (*gitserver.CommitGraph, error)
```

### <a id="readBenchmarkCommitGraphView" href="#readBenchmarkCommitGraphView">func readBenchmarkCommitGraphView() ([]Upload, error)</a>

```
searchKey: dbstore.readBenchmarkCommitGraphView
```

```Go
func readBenchmarkCommitGraphView() ([]Upload, error)
```

### <a id="readBenchmarkFile" href="#readBenchmarkFile">func readBenchmarkFile(path string) ([]byte, error)</a>

```
searchKey: dbstore.readBenchmarkFile
```

```Go
func readBenchmarkFile(path string) ([]byte, error)
```

### <a id="TestInsertDependencyIndexingJob" href="#TestInsertDependencyIndexingJob">func TestInsertDependencyIndexingJob(t *testing.T)</a>

```
searchKey: dbstore.TestInsertDependencyIndexingJob
```

```Go
func TestInsertDependencyIndexingJob(t *testing.T)
```

### <a id="TestGetDumpsByIDs" href="#TestGetDumpsByIDs">func TestGetDumpsByIDs(t *testing.T)</a>

```
searchKey: dbstore.TestGetDumpsByIDs
```

```Go
func TestGetDumpsByIDs(t *testing.T)
```

### <a id="TestFindClosestDumps" href="#TestFindClosestDumps">func TestFindClosestDumps(t *testing.T)</a>

```
searchKey: dbstore.TestFindClosestDumps
```

```Go
func TestFindClosestDumps(t *testing.T)
```

### <a id="TestFindClosestDumpsAlternateCommitGraph" href="#TestFindClosestDumpsAlternateCommitGraph">func TestFindClosestDumpsAlternateCommitGraph(t *testing.T)</a>

```
searchKey: dbstore.TestFindClosestDumpsAlternateCommitGraph
```

```Go
func TestFindClosestDumpsAlternateCommitGraph(t *testing.T)
```

### <a id="TestFindClosestDumpsAlternateCommitGraphWithOverwrittenVisibleUploads" href="#TestFindClosestDumpsAlternateCommitGraphWithOverwrittenVisibleUploads">func TestFindClosestDumpsAlternateCommitGraphWithOverwrittenVisibleUploads(t *testing.T)</a>

```
searchKey: dbstore.TestFindClosestDumpsAlternateCommitGraphWithOverwrittenVisibleUploads
```

```Go
func TestFindClosestDumpsAlternateCommitGraphWithOverwrittenVisibleUploads(t *testing.T)
```

### <a id="TestFindClosestDumpsDistinctRoots" href="#TestFindClosestDumpsDistinctRoots">func TestFindClosestDumpsDistinctRoots(t *testing.T)</a>

```
searchKey: dbstore.TestFindClosestDumpsDistinctRoots
```

```Go
func TestFindClosestDumpsDistinctRoots(t *testing.T)
```

### <a id="TestFindClosestDumpsOverlappingRoots" href="#TestFindClosestDumpsOverlappingRoots">func TestFindClosestDumpsOverlappingRoots(t *testing.T)</a>

```
searchKey: dbstore.TestFindClosestDumpsOverlappingRoots
```

```Go
func TestFindClosestDumpsOverlappingRoots(t *testing.T)
```

### <a id="TestFindClosestDumpsIndexerName" href="#TestFindClosestDumpsIndexerName">func TestFindClosestDumpsIndexerName(t *testing.T)</a>

```
searchKey: dbstore.TestFindClosestDumpsIndexerName
```

```Go
func TestFindClosestDumpsIndexerName(t *testing.T)
```

### <a id="TestFindClosestDumpsIntersectingPath" href="#TestFindClosestDumpsIntersectingPath">func TestFindClosestDumpsIntersectingPath(t *testing.T)</a>

```
searchKey: dbstore.TestFindClosestDumpsIntersectingPath
```

```Go
func TestFindClosestDumpsIntersectingPath(t *testing.T)
```

### <a id="TestFindClosestDumpsFromGraphFragment" href="#TestFindClosestDumpsFromGraphFragment">func TestFindClosestDumpsFromGraphFragment(t *testing.T)</a>

```
searchKey: dbstore.TestFindClosestDumpsFromGraphFragment
```

```Go
func TestFindClosestDumpsFromGraphFragment(t *testing.T)
```

### <a id="testFindClosestDumps" href="#testFindClosestDumps">func testFindClosestDumps(t *testing.T, store *Store, testCases []FindClosestDumpsTestCase)</a>

```
searchKey: dbstore.testFindClosestDumps
```

```Go
func testFindClosestDumps(t *testing.T, store *Store, testCases []FindClosestDumpsTestCase)
```

### <a id="testAnyOf" href="#testAnyOf">func testAnyOf(t *testing.T, dumps []Dump, expectedIDs []int)</a>

```
searchKey: dbstore.testAnyOf
```

```Go
func testAnyOf(t *testing.T, dumps []Dump, expectedIDs []int)
```

### <a id="testAllOf" href="#testAllOf">func testAllOf(t *testing.T, dumps []Dump, expectedIDs []int)</a>

```
searchKey: dbstore.testAllOf
```

```Go
func testAllOf(t *testing.T, dumps []Dump, expectedIDs []int)
```

### <a id="testPresence" href="#testPresence">func testPresence(needle int, haystack []int) bool</a>

```
searchKey: dbstore.testPresence
```

```Go
func testPresence(needle int, haystack []int) bool
```

### <a id="TestDeleteOverlappingDumps" href="#TestDeleteOverlappingDumps">func TestDeleteOverlappingDumps(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteOverlappingDumps
```

```Go
func TestDeleteOverlappingDumps(t *testing.T)
```

### <a id="TestDeleteOverlappingDumpsNoMatches" href="#TestDeleteOverlappingDumpsNoMatches">func TestDeleteOverlappingDumpsNoMatches(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteOverlappingDumpsNoMatches
```

```Go
func TestDeleteOverlappingDumpsNoMatches(t *testing.T)
```

### <a id="TestDeleteOverlappingDumpsIgnoresIncompleteUploads" href="#TestDeleteOverlappingDumpsIgnoresIncompleteUploads">func TestDeleteOverlappingDumpsIgnoresIncompleteUploads(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteOverlappingDumpsIgnoresIncompleteUploads
```

```Go
func TestDeleteOverlappingDumpsIgnoresIncompleteUploads(t *testing.T)
```

### <a id="makeCommit" href="#makeCommit">func makeCommit(i int) string</a>

```
searchKey: dbstore.makeCommit
```

```Go
func makeCommit(i int) string
```

makeCommit formats an integer as a 40-character git commit hash. 

### <a id="insertUploads" href="#insertUploads">func insertUploads(t testing.TB, db *sql.DB, uploads ...Upload)</a>

```
searchKey: dbstore.insertUploads
```

```Go
func insertUploads(t testing.TB, db *sql.DB, uploads ...Upload)
```

insertUploads populates the lsif_uploads table with the given upload models. 

### <a id="insertIndexes" href="#insertIndexes">func insertIndexes(t testing.TB, db *sql.DB, indexes ...Index)</a>

```
searchKey: dbstore.insertIndexes
```

```Go
func insertIndexes(t testing.TB, db *sql.DB, indexes ...Index)
```

insertIndexes populates the lsif_indexes table with the given index models. 

### <a id="insertRepo" href="#insertRepo">func insertRepo(t testing.TB, db *sql.DB, id int, name string)</a>

```
searchKey: dbstore.insertRepo
```

```Go
func insertRepo(t testing.TB, db *sql.DB, id int, name string)
```

insertRepo creates a repository record with the given id and name. If there is already a repository with the given identifier, nothing happens 

### <a id="deleteRepo" href="#deleteRepo">func deleteRepo(t testing.TB, db *sql.DB, id int, deleted_at time.Time)</a>

```
searchKey: dbstore.deleteRepo
```

```Go
func deleteRepo(t testing.TB, db *sql.DB, id int, deleted_at time.Time)
```

Marks a repo as deleted 

### <a id="insertPackageReferences" href="#insertPackageReferences">func insertPackageReferences(t testing.TB, store *Store, packageReferences []lsifstore.PackageReference)</a>

```
searchKey: dbstore.insertPackageReferences
```

```Go
func insertPackageReferences(t testing.TB, store *Store, packageReferences []lsifstore.PackageReference)
```

insertPackageReferences populates the lsif_references table with the given package references. 

### <a id="insertVisibleAtTip" href="#insertVisibleAtTip">func insertVisibleAtTip(t testing.TB, db *sql.DB, repositoryID int, uploadIDs ...int)</a>

```
searchKey: dbstore.insertVisibleAtTip
```

```Go
func insertVisibleAtTip(t testing.TB, db *sql.DB, repositoryID int, uploadIDs ...int)
```

insertVisibleAtTip populates rows of the lsif_uploads_visible_at_tip table for the given repository with the given identifiers. 

### <a id="insertNearestUploads" href="#insertNearestUploads">func insertNearestUploads(t testing.TB, db *sql.DB, repositoryID int, uploads map[string][]commitgraph.UploadMeta)</a>

```
searchKey: dbstore.insertNearestUploads
```

```Go
func insertNearestUploads(t testing.TB, db *sql.DB, repositoryID int, uploads map[string][]commitgraph.UploadMeta)
```

insertNearestUploads populates the lsif_nearest_uploads table with the given upload metadata. 

### <a id="insertLinks" href="#insertLinks">func insertLinks(t testing.TB, db *sql.DB, repositoryID int, links map[string]commitgraph.LinkRelationship)</a>

```
searchKey: dbstore.insertLinks
```

```Go
func insertLinks(t testing.TB, db *sql.DB, repositoryID int, links map[string]commitgraph.LinkRelationship)
```

### <a id="toCommitGraphView" href="#toCommitGraphView">func toCommitGraphView(uploads []Upload) *commitgraph.CommitGraphView</a>

```
searchKey: dbstore.toCommitGraphView
```

```Go
func toCommitGraphView(uploads []Upload) *commitgraph.CommitGraphView
```

### <a id="getVisibleUploads" href="#getVisibleUploads">func getVisibleUploads(t testing.TB, db *sql.DB, repositoryID int, commits []string) map[string][]int</a>

```
searchKey: dbstore.getVisibleUploads
```

```Go
func getVisibleUploads(t testing.TB, db *sql.DB, repositoryID int, commits []string) map[string][]int
```

### <a id="getUploadsVisibleAtTip" href="#getUploadsVisibleAtTip">func getUploadsVisibleAtTip(t testing.TB, db *sql.DB, repositoryID int) []int</a>

```
searchKey: dbstore.getUploadsVisibleAtTip
```

```Go
func getUploadsVisibleAtTip(t testing.TB, db *sql.DB, repositoryID int) []int
```

### <a id="normalizeVisibleUploads" href="#normalizeVisibleUploads">func normalizeVisibleUploads(uploadMetas map[string][]commitgraph.UploadMeta) map[string][]commitgraph.UploadMeta</a>

```
searchKey: dbstore.normalizeVisibleUploads
```

```Go
func normalizeVisibleUploads(uploadMetas map[string][]commitgraph.UploadMeta) map[string][]commitgraph.UploadMeta
```

### <a id="getUploadStates" href="#getUploadStates">func getUploadStates(db dbutil.DB, ids ...int) (map[int]string, error)</a>

```
searchKey: dbstore.getUploadStates
```

```Go
func getUploadStates(db dbutil.DB, ids ...int) (map[int]string, error)
```

### <a id="getIndexStates" href="#getIndexStates">func getIndexStates(db dbutil.DB, ids ...int) (map[int]string, error)</a>

```
searchKey: dbstore.getIndexStates
```

```Go
func getIndexStates(db dbutil.DB, ids ...int) (map[int]string, error)
```

### <a id="scanStates" href="#scanStates">func scanStates(rows *sql.Rows, queryErr error) (_ map[int]string, err error)</a>

```
searchKey: dbstore.scanStates
```

```Go
func scanStates(rows *sql.Rows, queryErr error) (_ map[int]string, err error)
```

scanStates scans pairs of id/states from the return value of `*Store.query`. 

### <a id="TestGetRepositoriesWithIndexConfiguration" href="#TestGetRepositoriesWithIndexConfiguration">func TestGetRepositoriesWithIndexConfiguration(t *testing.T)</a>

```
searchKey: dbstore.TestGetRepositoriesWithIndexConfiguration
```

```Go
func TestGetRepositoriesWithIndexConfiguration(t *testing.T)
```

### <a id="TestGetIndexConfigurationByRepositoryID" href="#TestGetIndexConfigurationByRepositoryID">func TestGetIndexConfigurationByRepositoryID(t *testing.T)</a>

```
searchKey: dbstore.TestGetIndexConfigurationByRepositoryID
```

```Go
func TestGetIndexConfigurationByRepositoryID(t *testing.T)
```

### <a id="TestGetRepositoriesWithIndexConfigurationIgnoresDisabledRepos" href="#TestGetRepositoriesWithIndexConfigurationIgnoresDisabledRepos">func TestGetRepositoriesWithIndexConfigurationIgnoresDisabledRepos(t *testing.T)</a>

```
searchKey: dbstore.TestGetRepositoriesWithIndexConfigurationIgnoresDisabledRepos
```

```Go
func TestGetRepositoriesWithIndexConfigurationIgnoresDisabledRepos(t *testing.T)
```

### <a id="TestGetIndexByID" href="#TestGetIndexByID">func TestGetIndexByID(t *testing.T)</a>

```
searchKey: dbstore.TestGetIndexByID
```

```Go
func TestGetIndexByID(t *testing.T)
```

### <a id="TestGetQueuedIndexRank" href="#TestGetQueuedIndexRank">func TestGetQueuedIndexRank(t *testing.T)</a>

```
searchKey: dbstore.TestGetQueuedIndexRank
```

```Go
func TestGetQueuedIndexRank(t *testing.T)
```

### <a id="TestGetIndexesByIDs" href="#TestGetIndexesByIDs">func TestGetIndexesByIDs(t *testing.T)</a>

```
searchKey: dbstore.TestGetIndexesByIDs
```

```Go
func TestGetIndexesByIDs(t *testing.T)
```

### <a id="TestGetIndexes" href="#TestGetIndexes">func TestGetIndexes(t *testing.T)</a>

```
searchKey: dbstore.TestGetIndexes
```

```Go
func TestGetIndexes(t *testing.T)
```

### <a id="TestIsQueued" href="#TestIsQueued">func TestIsQueued(t *testing.T)</a>

```
searchKey: dbstore.TestIsQueued
```

```Go
func TestIsQueued(t *testing.T)
```

### <a id="TestInsertIndex" href="#TestInsertIndex">func TestInsertIndex(t *testing.T)</a>

```
searchKey: dbstore.TestInsertIndex
```

```Go
func TestInsertIndex(t *testing.T)
```

### <a id="TestDeleteIndexByID" href="#TestDeleteIndexByID">func TestDeleteIndexByID(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteIndexByID
```

```Go
func TestDeleteIndexByID(t *testing.T)
```

### <a id="TestDeleteIndexByIDMissingRow" href="#TestDeleteIndexByIDMissingRow">func TestDeleteIndexByIDMissingRow(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteIndexByIDMissingRow
```

```Go
func TestDeleteIndexByIDMissingRow(t *testing.T)
```

### <a id="TestDeleteIndexesWithoutRepository" href="#TestDeleteIndexesWithoutRepository">func TestDeleteIndexesWithoutRepository(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteIndexesWithoutRepository
```

```Go
func TestDeleteIndexesWithoutRepository(t *testing.T)
```

### <a id="TestDeleteOldIndexes" href="#TestDeleteOldIndexes">func TestDeleteOldIndexes(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteOldIndexes
```

```Go
func TestDeleteOldIndexes(t *testing.T)
```

### <a id="TestStaleSourcedCommits" href="#TestStaleSourcedCommits">func TestStaleSourcedCommits(t *testing.T)</a>

```
searchKey: dbstore.TestStaleSourcedCommits
```

```Go
func TestStaleSourcedCommits(t *testing.T)
```

### <a id="TestRefreshCommitResolvability" href="#TestRefreshCommitResolvability">func TestRefreshCommitResolvability(t *testing.T)</a>

```
searchKey: dbstore.TestRefreshCommitResolvability
```

```Go
func TestRefreshCommitResolvability(t *testing.T)
```

### <a id="TestUpdatePackages" href="#TestUpdatePackages">func TestUpdatePackages(t *testing.T)</a>

```
searchKey: dbstore.TestUpdatePackages
```

```Go
func TestUpdatePackages(t *testing.T)
```

### <a id="TestUpdatePackagesEmpty" href="#TestUpdatePackagesEmpty">func TestUpdatePackagesEmpty(t *testing.T)</a>

```
searchKey: dbstore.TestUpdatePackagesEmpty
```

```Go
func TestUpdatePackagesEmpty(t *testing.T)
```

### <a id="TestUpdatePackageReferences" href="#TestUpdatePackageReferences">func TestUpdatePackageReferences(t *testing.T)</a>

```
searchKey: dbstore.TestUpdatePackageReferences
```

```Go
func TestUpdatePackageReferences(t *testing.T)
```

### <a id="TestUpdatePackageReferencesEmpty" href="#TestUpdatePackageReferencesEmpty">func TestUpdatePackageReferencesEmpty(t *testing.T)</a>

```
searchKey: dbstore.TestUpdatePackageReferencesEmpty
```

```Go
func TestUpdatePackageReferencesEmpty(t *testing.T)
```

### <a id="TestUpdatePackageReferencesWithDuplicates" href="#TestUpdatePackageReferencesWithDuplicates">func TestUpdatePackageReferencesWithDuplicates(t *testing.T)</a>

```
searchKey: dbstore.TestUpdatePackageReferencesWithDuplicates
```

```Go
func TestUpdatePackageReferencesWithDuplicates(t *testing.T)
```

### <a id="TestRepoName" href="#TestRepoName">func TestRepoName(t *testing.T)</a>

```
searchKey: dbstore.TestRepoName
```

```Go
func TestRepoName(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: dbstore.init
```

```Go
func init()
```

### <a id="TestGetUploadByID" href="#TestGetUploadByID">func TestGetUploadByID(t *testing.T)</a>

```
searchKey: dbstore.TestGetUploadByID
```

```Go
func TestGetUploadByID(t *testing.T)
```

### <a id="TestGetUploadByIDDeleted" href="#TestGetUploadByIDDeleted">func TestGetUploadByIDDeleted(t *testing.T)</a>

```
searchKey: dbstore.TestGetUploadByIDDeleted
```

```Go
func TestGetUploadByIDDeleted(t *testing.T)
```

### <a id="TestGetQueuedUploadRank" href="#TestGetQueuedUploadRank">func TestGetQueuedUploadRank(t *testing.T)</a>

```
searchKey: dbstore.TestGetQueuedUploadRank
```

```Go
func TestGetQueuedUploadRank(t *testing.T)
```

### <a id="TestGetUploadsByIDs" href="#TestGetUploadsByIDs">func TestGetUploadsByIDs(t *testing.T)</a>

```
searchKey: dbstore.TestGetUploadsByIDs
```

```Go
func TestGetUploadsByIDs(t *testing.T)
```

### <a id="TestDeleteUploadsStuckUploading" href="#TestDeleteUploadsStuckUploading">func TestDeleteUploadsStuckUploading(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteUploadsStuckUploading
```

```Go
func TestDeleteUploadsStuckUploading(t *testing.T)
```

### <a id="TestGetUploads" href="#TestGetUploads">func TestGetUploads(t *testing.T)</a>

```
searchKey: dbstore.TestGetUploads
```

```Go
func TestGetUploads(t *testing.T)
```

### <a id="TestInsertUploadUploading" href="#TestInsertUploadUploading">func TestInsertUploadUploading(t *testing.T)</a>

```
searchKey: dbstore.TestInsertUploadUploading
```

```Go
func TestInsertUploadUploading(t *testing.T)
```

### <a id="TestInsertUploadQueued" href="#TestInsertUploadQueued">func TestInsertUploadQueued(t *testing.T)</a>

```
searchKey: dbstore.TestInsertUploadQueued
```

```Go
func TestInsertUploadQueued(t *testing.T)
```

### <a id="TestInsertUploadWithAssociatedIndexID" href="#TestInsertUploadWithAssociatedIndexID">func TestInsertUploadWithAssociatedIndexID(t *testing.T)</a>

```
searchKey: dbstore.TestInsertUploadWithAssociatedIndexID
```

```Go
func TestInsertUploadWithAssociatedIndexID(t *testing.T)
```

### <a id="TestMarkQueued" href="#TestMarkQueued">func TestMarkQueued(t *testing.T)</a>

```
searchKey: dbstore.TestMarkQueued
```

```Go
func TestMarkQueued(t *testing.T)
```

### <a id="TestMarkFailed" href="#TestMarkFailed">func TestMarkFailed(t *testing.T)</a>

```
searchKey: dbstore.TestMarkFailed
```

```Go
func TestMarkFailed(t *testing.T)
```

### <a id="TestAddUploadPart" href="#TestAddUploadPart">func TestAddUploadPart(t *testing.T)</a>

```
searchKey: dbstore.TestAddUploadPart
```

```Go
func TestAddUploadPart(t *testing.T)
```

### <a id="TestDeleteUploadByID" href="#TestDeleteUploadByID">func TestDeleteUploadByID(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteUploadByID
```

```Go
func TestDeleteUploadByID(t *testing.T)
```

### <a id="TestDeleteUploadByIDMissingRow" href="#TestDeleteUploadByIDMissingRow">func TestDeleteUploadByIDMissingRow(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteUploadByIDMissingRow
```

```Go
func TestDeleteUploadByIDMissingRow(t *testing.T)
```

### <a id="TestDeleteUploadsWithoutRepository" href="#TestDeleteUploadsWithoutRepository">func TestDeleteUploadsWithoutRepository(t *testing.T)</a>

```
searchKey: dbstore.TestDeleteUploadsWithoutRepository
```

```Go
func TestDeleteUploadsWithoutRepository(t *testing.T)
```

### <a id="TestHardDeleteUploadByID" href="#TestHardDeleteUploadByID">func TestHardDeleteUploadByID(t *testing.T)</a>

```
searchKey: dbstore.TestHardDeleteUploadByID
```

```Go
func TestHardDeleteUploadByID(t *testing.T)
```

### <a id="TestSoftDeleteOldUploads" href="#TestSoftDeleteOldUploads">func TestSoftDeleteOldUploads(t *testing.T)</a>

```
searchKey: dbstore.TestSoftDeleteOldUploads
```

```Go
func TestSoftDeleteOldUploads(t *testing.T)
```

### <a id="TestGetOldestCommitDate" href="#TestGetOldestCommitDate">func TestGetOldestCommitDate(t *testing.T)</a>

```
searchKey: dbstore.TestGetOldestCommitDate
```

```Go
func TestGetOldestCommitDate(t *testing.T)
```

### <a id="TestUpdateCommitedAt" href="#TestUpdateCommitedAt">func TestUpdateCommitedAt(t *testing.T)</a>

```
searchKey: dbstore.TestUpdateCommitedAt
```

```Go
func TestUpdateCommitedAt(t *testing.T)
```

### <a id="TestDefinitionDumps" href="#TestDefinitionDumps">func TestDefinitionDumps(t *testing.T)</a>

```
searchKey: dbstore.TestDefinitionDumps
```

```Go
func TestDefinitionDumps(t *testing.T)
```

### <a id="TestReferenceIDsAndFilters" href="#TestReferenceIDsAndFilters">func TestReferenceIDsAndFilters(t *testing.T)</a>

```
searchKey: dbstore.TestReferenceIDsAndFilters
```

```Go
func TestReferenceIDsAndFilters(t *testing.T)
```

### <a id="TestReferenceIDsAndFiltersVisibility" href="#TestReferenceIDsAndFiltersVisibility">func TestReferenceIDsAndFiltersVisibility(t *testing.T)</a>

```
searchKey: dbstore.TestReferenceIDsAndFiltersVisibility
```

```Go
func TestReferenceIDsAndFiltersVisibility(t *testing.T)
```

### <a id="TestReferenceIDsAndFiltersRemoteVisibility" href="#TestReferenceIDsAndFiltersRemoteVisibility">func TestReferenceIDsAndFiltersRemoteVisibility(t *testing.T)</a>

```
searchKey: dbstore.TestReferenceIDsAndFiltersRemoteVisibility
```

```Go
func TestReferenceIDsAndFiltersRemoteVisibility(t *testing.T)
```

### <a id="TestReferencesForUpload" href="#TestReferencesForUpload">func TestReferencesForUpload(t *testing.T)</a>

```
searchKey: dbstore.TestReferencesForUpload
```

```Go
func TestReferencesForUpload(t *testing.T)
```

### <a id="consumeScanner" href="#consumeScanner">func consumeScanner(scanner PackageReferenceScanner) (references []lsifstore.PackageReference, _ error)</a>

```
searchKey: dbstore.consumeScanner
```

```Go
func consumeScanner(scanner PackageReferenceScanner) (references []lsifstore.PackageReference, _ error)
```

consumeScanner reads all values from the scanner into memory. 

