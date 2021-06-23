# Package store

## Index

* [Constants](#const)
    * [const batchSpecInsertColsFmt](#batchSpecInsertColsFmt)
    * [const getNewestBatchSpecQueryFmtstr](#getNewestBatchSpecQueryFmtstr)
    * [const changesetEventsBatchQueryPrefix](#changesetEventsBatchQueryPrefix)
    * [const batchChangesetEventsQuerySuffix](#batchChangesetEventsQuerySuffix)
    * [const listChangesetSyncDataQueryFmtstr](#listChangesetSyncDataQueryFmtstr)
    * [const cancelQueuedBatchChangeChangesetsFmtstr](#cancelQueuedBatchChangeChangesetsFmtstr)
    * [const enqueueChangesetsToCloseFmtstr](#enqueueChangesetsToCloseFmtstr)
    * [const getChangesetStatsFmtstr](#getChangesetStatsFmtstr)
    * [const enqueueNextScheduledChangesetFmtstr](#enqueueNextScheduledChangesetFmtstr)
    * [const getChangesetPlaceInSchedulerQueueFmtstr](#getChangesetPlaceInSchedulerQueueFmtstr)
    * [const getExternalServiceIDsQueryFmtstr](#getExternalServiceIDsQueryFmtstr)
    * [const updateSiteCredentialQueryFmtstr](#updateSiteCredentialQueryFmtstr)
* [Variables](#var)
    * [var batchChangeColumns](#batchChangeColumns)
    * [var batchChangeInsertColumns](#batchChangeInsertColumns)
    * [var createBatchChangeQueryFmtstr](#createBatchChangeQueryFmtstr)
    * [var updateBatchChangeQueryFmtstr](#updateBatchChangeQueryFmtstr)
    * [var deleteBatchChangeQueryFmtstr](#deleteBatchChangeQueryFmtstr)
    * [var countBatchChangesQueryFmtstr](#countBatchChangesQueryFmtstr)
    * [var getBatchChangesQueryFmtstr](#getBatchChangesQueryFmtstr)
    * [var getBatchChangeDiffStatQueryFmtstr](#getBatchChangeDiffStatQueryFmtstr)
    * [var listBatchChangesQueryFmtstr](#listBatchChangesQueryFmtstr)
    * [var batchSpecColumns](#batchSpecColumns)
    * [var batchSpecInsertColumns](#batchSpecInsertColumns)
    * [var createBatchSpecQueryFmtstr](#createBatchSpecQueryFmtstr)
    * [var updateBatchSpecQueryFmtstr](#updateBatchSpecQueryFmtstr)
    * [var deleteBatchSpecQueryFmtstr](#deleteBatchSpecQueryFmtstr)
    * [var countBatchSpecsQueryFmtstr](#countBatchSpecsQueryFmtstr)
    * [var getBatchSpecsQueryFmtstr](#getBatchSpecsQueryFmtstr)
    * [var listBatchSpecsQueryFmtstr](#listBatchSpecsQueryFmtstr)
    * [var deleteExpiredBatchSpecsQueryFmtstr](#deleteExpiredBatchSpecsQueryFmtstr)
    * [var bulkOperationColumns](#bulkOperationColumns)
    * [var getBulkOperationQueryFmtstr](#getBulkOperationQueryFmtstr)
    * [var listBulkOperationsQueryFmtstr](#listBulkOperationsQueryFmtstr)
    * [var countBulkOperationsQueryFmtstr](#countBulkOperationsQueryFmtstr)
    * [var listBulkOperationErrorsQueryFmtstr](#listBulkOperationErrorsQueryFmtstr)
    * [var getChangesetEventsQueryFmtstr](#getChangesetEventsQueryFmtstr)
    * [var listChangesetEventsQueryFmtstr](#listChangesetEventsQueryFmtstr)
    * [var countChangesetEventsQueryFmtstr](#countChangesetEventsQueryFmtstr)
    * [var upsertChangesetEventsQueryFmtstr](#upsertChangesetEventsQueryFmtstr)
    * [var changesetJobInsertColumns](#changesetJobInsertColumns)
    * [var ChangesetJobColumns](#ChangesetJobColumns)
    * [var getChangesetJobsQueryFmtstr](#getChangesetJobsQueryFmtstr)
    * [var changesetSpecInsertColumns](#changesetSpecInsertColumns)
    * [var changesetSpecColumns](#changesetSpecColumns)
    * [var createChangesetSpecQueryFmtstr](#createChangesetSpecQueryFmtstr)
    * [var updateChangesetSpecQueryFmtstr](#updateChangesetSpecQueryFmtstr)
    * [var deleteChangesetSpecQueryFmtstr](#deleteChangesetSpecQueryFmtstr)
    * [var countChangesetSpecsQueryFmtstr](#countChangesetSpecsQueryFmtstr)
    * [var getChangesetSpecsQueryFmtstr](#getChangesetSpecsQueryFmtstr)
    * [var listChangesetSpecsQueryFmtstr](#listChangesetSpecsQueryFmtstr)
    * [var deleteExpiredChangesetSpecsQueryFmtstr](#deleteExpiredChangesetSpecsQueryFmtstr)
    * [var getRewirerMappingsQueryFmtstr](#getRewirerMappingsQueryFmtstr)
    * [var ChangesetColumns](#ChangesetColumns)
    * [var changesetInsertColumns](#changesetInsertColumns)
    * [var createChangesetQueryFmtstr](#createChangesetQueryFmtstr)
    * [var deleteChangesetQueryFmtstr](#deleteChangesetQueryFmtstr)
    * [var countChangesetsQueryFmtstr](#countChangesetsQueryFmtstr)
    * [var getChangesetsQueryFmtstr](#getChangesetsQueryFmtstr)
    * [var listChangesetsQueryFmtstr](#listChangesetsQueryFmtstr)
    * [var updateChangesetQueryFmtstr](#updateChangesetQueryFmtstr)
    * [var CanceledChangesetFailureMessage](#CanceledChangesetFailureMessage)
    * [var listCodeHostsQueryFmtstr](#listCodeHostsQueryFmtstr)
    * [var createSiteCredentialQueryFmtstr](#createSiteCredentialQueryFmtstr)
    * [var deleteSiteCredentialQueryFmtstr](#deleteSiteCredentialQueryFmtstr)
    * [var getSiteCredentialQueryFmtstr](#getSiteCredentialQueryFmtstr)
    * [var listSiteCredentialsQueryFmtstr](#listSiteCredentialsQueryFmtstr)
    * [var siteCredentialColumns](#siteCredentialColumns)
    * [var seededRand](#seededRand)
    * [var ErrNoResults](#ErrNoResults)
    * [var cmtRewirerMappingsOpts](#cmtRewirerMappingsOpts)
* [Types](#type)
    * [type CountBatchChangesOpts struct](#CountBatchChangesOpts)
    * [type GetBatchChangeOpts struct](#GetBatchChangeOpts)
    * [type GetBatchChangeDiffStatOpts struct](#GetBatchChangeDiffStatOpts)
    * [type ListBatchChangesOpts struct](#ListBatchChangesOpts)
    * [type GetBatchSpecOpts struct](#GetBatchSpecOpts)
    * [type GetNewestBatchSpecOpts struct](#GetNewestBatchSpecOpts)
    * [type ListBatchSpecsOpts struct](#ListBatchSpecsOpts)
    * [type GetBulkOperationOpts struct](#GetBulkOperationOpts)
    * [type ListBulkOperationsOpts struct](#ListBulkOperationsOpts)
    * [type CountBulkOperationsOpts struct](#CountBulkOperationsOpts)
    * [type ListBulkOperationErrorsOpts struct](#ListBulkOperationErrorsOpts)
    * [type GetChangesetEventOpts struct](#GetChangesetEventOpts)
    * [type ListChangesetEventsOpts struct](#ListChangesetEventsOpts)
    * [type CountChangesetEventsOpts struct](#CountChangesetEventsOpts)
    * [type GetChangesetJobOpts struct](#GetChangesetJobOpts)
    * [type CountChangesetSpecsOpts struct](#CountChangesetSpecsOpts)
    * [type GetChangesetSpecOpts struct](#GetChangesetSpecOpts)
    * [type ListChangesetSpecsOpts struct](#ListChangesetSpecsOpts)
    * [type GetRewirerMappingsOpts struct](#GetRewirerMappingsOpts)
    * [type CountChangesetsOpts struct](#CountChangesetsOpts)
    * [type GetChangesetOpts struct](#GetChangesetOpts)
    * [type ListChangesetSyncDataOpts struct](#ListChangesetSyncDataOpts)
    * [type ListChangesetsOpts struct](#ListChangesetsOpts)
    * [type jsonBatchChangeChangesetSet struct](#jsonBatchChangeChangesetSet)
        * [func (n *jsonBatchChangeChangesetSet) Scan(value interface{}) error](#jsonBatchChangeChangesetSet.Scan)
        * [func (n jsonBatchChangeChangesetSet) Value() (driver.Value, error)](#jsonBatchChangeChangesetSet.Value)
    * [type ListCodeHostsOpts struct](#ListCodeHostsOpts)
    * [type GetExternalServiceIDsOpts struct](#GetExternalServiceIDsOpts)
    * [type GetSiteCredentialOpts struct](#GetSiteCredentialOpts)
    * [type ListSiteCredentialsOpts struct](#ListSiteCredentialsOpts)
    * [type SQLColumns []string](#SQLColumns)
        * [func (s SQLColumns) ToSqlf() []*sqlf.Query](#SQLColumns.ToSqlf)
    * [type Store struct](#Store)
        * [func New(db dbutil.DB, key encryption.Key) *Store](#New)
        * [func NewWithClock(db dbutil.DB, key encryption.Key, clock func() time.Time) *Store](#NewWithClock)
        * [func (s *Store) CreateBatchChange(ctx context.Context, c *btypes.BatchChange) error](#Store.CreateBatchChange)
        * [func (s *Store) createBatchChangeQuery(c *btypes.BatchChange) *sqlf.Query](#Store.createBatchChangeQuery)
        * [func (s *Store) UpdateBatchChange(ctx context.Context, c *btypes.BatchChange) error](#Store.UpdateBatchChange)
        * [func (s *Store) updateBatchChangeQuery(c *btypes.BatchChange) *sqlf.Query](#Store.updateBatchChangeQuery)
        * [func (s *Store) DeleteBatchChange(ctx context.Context, id int64) error](#Store.DeleteBatchChange)
        * [func (s *Store) CountBatchChanges(ctx context.Context, opts CountBatchChangesOpts) (int, error)](#Store.CountBatchChanges)
        * [func (s *Store) GetBatchChange(ctx context.Context, opts GetBatchChangeOpts) (*btypes.BatchChange, error)](#Store.GetBatchChange)
        * [func (s *Store) GetBatchChangeDiffStat(ctx context.Context, opts GetBatchChangeDiffStatOpts) (*diff.Stat, error)](#Store.GetBatchChangeDiffStat)
        * [func (s *Store) ListBatchChanges(ctx context.Context, opts ListBatchChangesOpts) (cs []*btypes.BatchChange, next int64, err error)](#Store.ListBatchChanges)
        * [func (s *Store) CreateBatchSpec(ctx context.Context, c *btypes.BatchSpec) error](#Store.CreateBatchSpec)
        * [func (s *Store) createBatchSpecQuery(c *btypes.BatchSpec) (*sqlf.Query, error)](#Store.createBatchSpecQuery)
        * [func (s *Store) UpdateBatchSpec(ctx context.Context, c *btypes.BatchSpec) error](#Store.UpdateBatchSpec)
        * [func (s *Store) updateBatchSpecQuery(c *btypes.BatchSpec) (*sqlf.Query, error)](#Store.updateBatchSpecQuery)
        * [func (s *Store) DeleteBatchSpec(ctx context.Context, id int64) error](#Store.DeleteBatchSpec)
        * [func (s *Store) CountBatchSpecs(ctx context.Context) (int, error)](#Store.CountBatchSpecs)
        * [func (s *Store) GetBatchSpec(ctx context.Context, opts GetBatchSpecOpts) (*btypes.BatchSpec, error)](#Store.GetBatchSpec)
        * [func (s *Store) GetNewestBatchSpec(ctx context.Context, opts GetNewestBatchSpecOpts) (*btypes.BatchSpec, error)](#Store.GetNewestBatchSpec)
        * [func (s *Store) ListBatchSpecs(ctx context.Context, opts ListBatchSpecsOpts) (cs []*btypes.BatchSpec, next int64, err error)](#Store.ListBatchSpecs)
        * [func (s *Store) DeleteExpiredBatchSpecs(ctx context.Context) error](#Store.DeleteExpiredBatchSpecs)
        * [func (s *Store) GetBulkOperation(ctx context.Context, opts GetBulkOperationOpts) (*btypes.BulkOperation, error)](#Store.GetBulkOperation)
        * [func (s *Store) ListBulkOperations(ctx context.Context, opts ListBulkOperationsOpts) (bs []*btypes.BulkOperation, next int64, err error)](#Store.ListBulkOperations)
        * [func (s *Store) CountBulkOperations(ctx context.Context, opts CountBulkOperationsOpts) (int, error)](#Store.CountBulkOperations)
        * [func (s *Store) ListBulkOperationErrors(ctx context.Context, opts ListBulkOperationErrorsOpts) (es []*btypes.BulkOperationError, err error)](#Store.ListBulkOperationErrors)
        * [func (s *Store) GetChangesetEvent(ctx context.Context, opts GetChangesetEventOpts) (*btypes.ChangesetEvent, error)](#Store.GetChangesetEvent)
        * [func (s *Store) ListChangesetEvents(ctx context.Context, opts ListChangesetEventsOpts) (cs []*btypes.ChangesetEvent, next int64, err error)](#Store.ListChangesetEvents)
        * [func (s *Store) CountChangesetEvents(ctx context.Context, opts CountChangesetEventsOpts) (int, error)](#Store.CountChangesetEvents)
        * [func (s *Store) UpsertChangesetEvents(ctx context.Context, cs ...*btypes.ChangesetEvent) (err error)](#Store.UpsertChangesetEvents)
        * [func (s *Store) upsertChangesetEventsQuery(es []*btypes.ChangesetEvent) (*sqlf.Query, error)](#Store.upsertChangesetEventsQuery)
        * [func (s *Store) CreateChangesetJob(ctx context.Context, cs ...*btypes.ChangesetJob) error](#Store.CreateChangesetJob)
        * [func (s *Store) GetChangesetJob(ctx context.Context, opts GetChangesetJobOpts) (*btypes.ChangesetJob, error)](#Store.GetChangesetJob)
        * [func (s *Store) CreateChangesetSpec(ctx context.Context, c *btypes.ChangesetSpec) error](#Store.CreateChangesetSpec)
        * [func (s *Store) createChangesetSpecQuery(c *btypes.ChangesetSpec) (*sqlf.Query, error)](#Store.createChangesetSpecQuery)
        * [func (s *Store) UpdateChangesetSpec(ctx context.Context, c *btypes.ChangesetSpec) error](#Store.UpdateChangesetSpec)
        * [func (s *Store) updateChangesetSpecQuery(c *btypes.ChangesetSpec) (*sqlf.Query, error)](#Store.updateChangesetSpecQuery)
        * [func (s *Store) DeleteChangesetSpec(ctx context.Context, id int64) error](#Store.DeleteChangesetSpec)
        * [func (s *Store) CountChangesetSpecs(ctx context.Context, opts CountChangesetSpecsOpts) (int, error)](#Store.CountChangesetSpecs)
        * [func (s *Store) GetChangesetSpec(ctx context.Context, opts GetChangesetSpecOpts) (*btypes.ChangesetSpec, error)](#Store.GetChangesetSpec)
        * [func (s *Store) GetChangesetSpecByID(ctx context.Context, id int64) (*btypes.ChangesetSpec, error)](#Store.GetChangesetSpecByID)
        * [func (s *Store) ListChangesetSpecs(ctx context.Context, opts ListChangesetSpecsOpts) (cs btypes.ChangesetSpecs, next int64, err error)](#Store.ListChangesetSpecs)
        * [func (s *Store) DeleteExpiredChangesetSpecs(ctx context.Context) error](#Store.DeleteExpiredChangesetSpecs)
        * [func (s *Store) GetRewirerMappings(ctx context.Context, opts GetRewirerMappingsOpts) (mappings btypes.RewirerMappings, err error)](#Store.GetRewirerMappings)
        * [func (s *Store) changesetWriteQuery(q string, includeID bool, c *btypes.Changeset) (*sqlf.Query, error)](#Store.changesetWriteQuery)
        * [func (s *Store) UpsertChangeset(ctx context.Context, c *btypes.Changeset) error](#Store.UpsertChangeset)
        * [func (s *Store) CreateChangeset(ctx context.Context, c *btypes.Changeset) error](#Store.CreateChangeset)
        * [func (s *Store) DeleteChangeset(ctx context.Context, id int64) error](#Store.DeleteChangeset)
        * [func (s *Store) CountChangesets(ctx context.Context, opts CountChangesetsOpts) (int, error)](#Store.CountChangesets)
        * [func (s *Store) GetChangesetByID(ctx context.Context, id int64) (*btypes.Changeset, error)](#Store.GetChangesetByID)
        * [func (s *Store) GetChangeset(ctx context.Context, opts GetChangesetOpts) (*btypes.Changeset, error)](#Store.GetChangeset)
        * [func (s *Store) ListChangesetSyncData(ctx context.Context, opts ListChangesetSyncDataOpts) ([]*btypes.ChangesetSyncData, error)](#Store.ListChangesetSyncData)
        * [func (s *Store) ListChangesets(ctx context.Context, opts ListChangesetsOpts) (cs btypes.Changesets, next int64, err error)](#Store.ListChangesets)
        * [func (s *Store) UpdateChangeset(ctx context.Context, cs *btypes.Changeset) error](#Store.UpdateChangeset)
        * [func (s *Store) GetChangesetExternalIDs(ctx context.Context, spec api.ExternalRepoSpec, refs []string) ([]string, error)](#Store.GetChangesetExternalIDs)
        * [func (s *Store) CancelQueuedBatchChangeChangesets(ctx context.Context, batchChangeID int64) error](#Store.CancelQueuedBatchChangeChangesets)
        * [func (s *Store) EnqueueChangesetsToClose(ctx context.Context, batchChangeID int64) error](#Store.EnqueueChangesetsToClose)
        * [func (s *Store) GetChangesetsStats(ctx context.Context, batchChangeID int64) (stats btypes.ChangesetsStats, err error)](#Store.GetChangesetsStats)
        * [func (s *Store) EnqueueNextScheduledChangeset(ctx context.Context) (*btypes.Changeset, error)](#Store.EnqueueNextScheduledChangeset)
        * [func (s *Store) GetChangesetPlaceInSchedulerQueue(ctx context.Context, id int64) (int, error)](#Store.GetChangesetPlaceInSchedulerQueue)
        * [func (s *Store) ListCodeHosts(ctx context.Context, opts ListCodeHostsOpts) ([]*btypes.CodeHost, error)](#Store.ListCodeHosts)
        * [func (s *Store) GetExternalServiceIDs(ctx context.Context, opts GetExternalServiceIDsOpts) (ids []int64, err error)](#Store.GetExternalServiceIDs)
        * [func (s *Store) CreateSiteCredential(ctx context.Context, c *btypes.SiteCredential, credential auth.Authenticator) error](#Store.CreateSiteCredential)
        * [func (s *Store) DeleteSiteCredential(ctx context.Context, id int64) error](#Store.DeleteSiteCredential)
        * [func (s *Store) GetSiteCredential(ctx context.Context, opts GetSiteCredentialOpts) (*btypes.SiteCredential, error)](#Store.GetSiteCredential)
        * [func (s *Store) ListSiteCredentials(ctx context.Context, opts ListSiteCredentialsOpts) (cs []*btypes.SiteCredential, next int64, err error)](#Store.ListSiteCredentials)
        * [func (s *Store) UpdateSiteCredential(ctx context.Context, c *btypes.SiteCredential) error](#Store.UpdateSiteCredential)
        * [func (s *Store) updateSiteCredentialQuery(c *btypes.SiteCredential) *sqlf.Query](#Store.updateSiteCredentialQuery)
        * [func (s *Store) Clock() func() time.Time](#Store.Clock)
        * [func (s *Store) DB() dbutil.DB](#Store.DB)
        * [func (s *Store) Handle() *basestore.TransactableHandle](#Store.Handle)
        * [func (s *Store) With(other basestore.ShareableStore) *Store](#Store.With)
        * [func (s *Store) Transact(ctx context.Context) (*Store, error)](#Store.Transact)
        * [func (s *Store) Repos() *database.RepoStore](#Store.Repos)
        * [func (s *Store) ExternalServices() *database.ExternalServiceStore](#Store.ExternalServices)
        * [func (s *Store) UserCredentials() *database.UserCredentialsStore](#Store.UserCredentials)
        * [func (s *Store) query(ctx context.Context, q *sqlf.Query, sc scanFunc) error](#Store.query)
        * [func (s *Store) queryCount(ctx context.Context, q *sqlf.Query) (int, error)](#Store.queryCount)
    * [type scanner interface](#scanner)
    * [type scanFunc func(github.com/sourcegraph/sourcegraph/enterprise/internal/batches/store.scanner) (err error)](#scanFunc)
    * [type LimitOpts struct](#LimitOpts)
        * [func (o LimitOpts) DBLimit() int](#LimitOpts.DBLimit)
        * [func (o LimitOpts) ToDB() string](#LimitOpts.ToDB)
    * [type storeTestFunc func(*testing.T, context.Context, *github.com/sourcegraph/sourcegraph/enterprise/internal/batches/store.Store, github.com/sourcegraph/sourcegraph/enterprise/internal/batches/testing.Clock)](#storeTestFunc)
* [Functions](#func)
    * [func countBatchChangesQuery(opts *CountBatchChangesOpts) *sqlf.Query](#countBatchChangesQuery)
    * [func getBatchChangeQuery(opts *GetBatchChangeOpts) *sqlf.Query](#getBatchChangeQuery)
    * [func getBatchChangeDiffStatQuery(opts GetBatchChangeDiffStatOpts, authzConds *sqlf.Query) *sqlf.Query](#getBatchChangeDiffStatQuery)
    * [func listBatchChangesQuery(opts *ListBatchChangesOpts) *sqlf.Query](#listBatchChangesQuery)
    * [func scanBatchChange(c *btypes.BatchChange, s scanner) error](#scanBatchChange)
    * [func getBatchSpecQuery(opts *GetBatchSpecOpts) *sqlf.Query](#getBatchSpecQuery)
    * [func getNewestBatchSpecQuery(opts *GetNewestBatchSpecOpts) *sqlf.Query](#getNewestBatchSpecQuery)
    * [func listBatchSpecsQuery(opts *ListBatchSpecsOpts) *sqlf.Query](#listBatchSpecsQuery)
    * [func scanBatchSpec(c *btypes.BatchSpec, s scanner) error](#scanBatchSpec)
    * [func getBulkOperationQuery(opts *GetBulkOperationOpts) *sqlf.Query](#getBulkOperationQuery)
    * [func listBulkOperationsQuery(opts *ListBulkOperationsOpts) *sqlf.Query](#listBulkOperationsQuery)
    * [func countBulkOperationsQuery(opts *CountBulkOperationsOpts) *sqlf.Query](#countBulkOperationsQuery)
    * [func listBulkOperationErrorsQuery(opts *ListBulkOperationErrorsOpts) *sqlf.Query](#listBulkOperationErrorsQuery)
    * [func scanBulkOperation(b *btypes.BulkOperation, s scanner) error](#scanBulkOperation)
    * [func scanBulkOperationError(b *btypes.BulkOperationError, s scanner) error](#scanBulkOperationError)
    * [func getChangesetEventQuery(opts *GetChangesetEventOpts) *sqlf.Query](#getChangesetEventQuery)
    * [func listChangesetEventsQuery(opts *ListChangesetEventsOpts) *sqlf.Query](#listChangesetEventsQuery)
    * [func countChangesetEventsQuery(opts *CountChangesetEventsOpts) *sqlf.Query](#countChangesetEventsQuery)
    * [func batchChangesetEventsQuery(fmtstr string, es []*btypes.ChangesetEvent) (*sqlf.Query, error)](#batchChangesetEventsQuery)
    * [func scanChangesetEvent(e *btypes.ChangesetEvent, s scanner) error](#scanChangesetEvent)
    * [func getChangesetJobQuery(opts *GetChangesetJobOpts) *sqlf.Query](#getChangesetJobQuery)
    * [func scanChangesetJob(c *btypes.ChangesetJob, s scanner) error](#scanChangesetJob)
    * [func ScanFirstChangesetJob(rows *sql.Rows, err error) (*btypes.ChangesetJob, bool, error)](#ScanFirstChangesetJob)
    * [func scanChangesetJobs(rows *sql.Rows, queryErr error) ([]*btypes.ChangesetJob, error)](#scanChangesetJobs)
    * [func countChangesetSpecsQuery(opts *CountChangesetSpecsOpts) *sqlf.Query](#countChangesetSpecsQuery)
    * [func getChangesetSpecQuery(opts *GetChangesetSpecOpts) *sqlf.Query](#getChangesetSpecQuery)
    * [func listChangesetSpecsQuery(opts *ListChangesetSpecsOpts) *sqlf.Query](#listChangesetSpecsQuery)
    * [func scanChangesetSpec(c *btypes.ChangesetSpec, s scanner) error](#scanChangesetSpec)
    * [func getRewirerMappingsQuery(opts GetRewirerMappingsOpts) (*sqlf.Query, error)](#getRewirerMappingsQuery)
    * [func getRewirerMappingCurrentState(state *btypes.ChangesetState) (*sqlf.Query, error)](#getRewirerMappingCurrentState)
    * [func getRewirerMappingTextSearch(terms []search.TextSearchTerm) (detachTextSearch, viewTextSearch *sqlf.Query)](#getRewirerMappingTextSearch)
    * [func countChangesetsQuery(opts *CountChangesetsOpts, authzConds *sqlf.Query) *sqlf.Query](#countChangesetsQuery)
    * [func getChangesetQuery(opts *GetChangesetOpts) *sqlf.Query](#getChangesetQuery)
    * [func scanChangesetSyncData(h *btypes.ChangesetSyncData, s scanner) error](#scanChangesetSyncData)
    * [func listChangesetSyncDataQuery(opts ListChangesetSyncDataOpts) *sqlf.Query](#listChangesetSyncDataQuery)
    * [func listChangesetsQuery(opts *ListChangesetsOpts, authzConds *sqlf.Query) *sqlf.Query](#listChangesetsQuery)
    * [func ScanFirstChangeset(rows *sql.Rows, err error) (*btypes.Changeset, bool, error)](#ScanFirstChangeset)
    * [func scanChangesets(rows *sql.Rows, queryErr error) ([]*btypes.Changeset, error)](#scanChangesets)
    * [func scanChangeset(t *btypes.Changeset, s scanner) error](#scanChangeset)
    * [func archivedInBatchChange(batchChangeID string) *sqlf.Query](#archivedInBatchChange)
    * [func getChangesetsStatsQuery(batchChangeID int64) *sqlf.Query](#getChangesetsStatsQuery)
    * [func listCodeHostsQuery(opts ListCodeHostsOpts) *sqlf.Query](#listCodeHostsQuery)
    * [func scanCodeHost(c *btypes.CodeHost, sc scanner) error](#scanCodeHost)
    * [func getExternalServiceIDsQuery(opts GetExternalServiceIDsOpts) *sqlf.Query](#getExternalServiceIDsQuery)
    * [func createSiteCredentialQuery(c *btypes.SiteCredential) *sqlf.Query](#createSiteCredentialQuery)
    * [func deleteSiteCredentialQuery(id int64) *sqlf.Query](#deleteSiteCredentialQuery)
    * [func getSiteCredentialQuery(opts GetSiteCredentialOpts) *sqlf.Query](#getSiteCredentialQuery)
    * [func listSiteCredentialsQuery(opts ListSiteCredentialsOpts) *sqlf.Query](#listSiteCredentialsQuery)
    * [func scanSiteCredential(c *btypes.SiteCredential, sc scanner) error](#scanSiteCredential)
    * [func RandomID() (string, error)](#RandomID)
    * [func scanAll(rows *sql.Rows, scan scanFunc) (err error)](#scanAll)
    * [func jsonbColumn(metadata interface{}) (msg json.RawMessage, err error)](#jsonbColumn)
    * [func nullInt32Column(n int32) *int32](#nullInt32Column)
    * [func nullInt64Column(n int64) *int64](#nullInt64Column)
    * [func nullTimeColumn(t time.Time) *time.Time](#nullTimeColumn)
    * [func nullStringColumn(s string) *string](#nullStringColumn)
    * [func textSearchTermToClause(term search.TextSearchTerm, fields ...*sqlf.Query) *sqlf.Query](#textSearchTermToClause)
    * [func testStoreBatchChanges(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreBatchChanges)
    * [func testUserDeleteCascades(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testUserDeleteCascades)
    * [func testStoreBatchSpecs(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreBatchSpecs)
    * [func testStoreBulkOperations(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreBulkOperations)
    * [func testStoreChangesetEvents(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreChangesetEvents)
    * [func testStoreChangesetJobs(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreChangesetJobs)
    * [func testStoreChangesetSpecs(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreChangesetSpecs)
    * [func testStoreChangesetSpecsCurrentState(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreChangesetSpecsCurrentState)
    * [func testStoreChangesetSpecsCurrentStateAndTextSearch(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreChangesetSpecsCurrentStateAndTextSearch)
    * [func testStoreChangesetSpecsTextSearch(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreChangesetSpecsTextSearch)
    * [func testStoreChangesets(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreChangesets)
    * [func testStoreListChangesetSyncData(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreListChangesetSyncData)
    * [func testStoreListChangesetsTextSearch(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreListChangesetsTextSearch)
    * [func testStoreChangesetScheduling(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreChangesetScheduling)
    * [func testStoreCodeHost(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreCodeHost)
    * [func TestIntegration(t *testing.T)](#TestIntegration)
    * [func testStoreSiteCredentials(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)](#testStoreSiteCredentials)
    * [func storeTest(db *sql.DB, key encryption.Key, f storeTestFunc) func(*testing.T)](#storeTest)
    * [func TestTextSearchTermToClause(t *testing.T)](#TestTextSearchTermToClause)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="batchSpecInsertColsFmt" href="#batchSpecInsertColsFmt">const batchSpecInsertColsFmt</a>

```
searchKey: store.batchSpecInsertColsFmt
tags: [private]
```

```Go
const batchSpecInsertColsFmt = `(%s, %s, %s, %s, %s, %s, %s, %s)`
```

### <a id="getNewestBatchSpecQueryFmtstr" href="#getNewestBatchSpecQueryFmtstr">const getNewestBatchSpecQueryFmtstr</a>

```
searchKey: store.getNewestBatchSpecQueryFmtstr
tags: [private]
```

```Go
const getNewestBatchSpecQueryFmtstr = ...
```

### <a id="changesetEventsBatchQueryPrefix" href="#changesetEventsBatchQueryPrefix">const changesetEventsBatchQueryPrefix</a>

```
searchKey: store.changesetEventsBatchQueryPrefix
tags: [private]
```

```Go
const changesetEventsBatchQueryPrefix = ...
```

### <a id="batchChangesetEventsQuerySuffix" href="#batchChangesetEventsQuerySuffix">const batchChangesetEventsQuerySuffix</a>

```
searchKey: store.batchChangesetEventsQuerySuffix
tags: [private]
```

```Go
const batchChangesetEventsQuerySuffix = ...
```

### <a id="listChangesetSyncDataQueryFmtstr" href="#listChangesetSyncDataQueryFmtstr">const listChangesetSyncDataQueryFmtstr</a>

```
searchKey: store.listChangesetSyncDataQueryFmtstr
tags: [private]
```

```Go
const listChangesetSyncDataQueryFmtstr = ...
```

### <a id="cancelQueuedBatchChangeChangesetsFmtstr" href="#cancelQueuedBatchChangeChangesetsFmtstr">const cancelQueuedBatchChangeChangesetsFmtstr</a>

```
searchKey: store.cancelQueuedBatchChangeChangesetsFmtstr
tags: [private]
```

```Go
const cancelQueuedBatchChangeChangesetsFmtstr = ...
```

### <a id="enqueueChangesetsToCloseFmtstr" href="#enqueueChangesetsToCloseFmtstr">const enqueueChangesetsToCloseFmtstr</a>

```
searchKey: store.enqueueChangesetsToCloseFmtstr
tags: [private]
```

```Go
const enqueueChangesetsToCloseFmtstr = ...
```

### <a id="getChangesetStatsFmtstr" href="#getChangesetStatsFmtstr">const getChangesetStatsFmtstr</a>

```
searchKey: store.getChangesetStatsFmtstr
tags: [private]
```

```Go
const getChangesetStatsFmtstr = ...
```

### <a id="enqueueNextScheduledChangesetFmtstr" href="#enqueueNextScheduledChangesetFmtstr">const enqueueNextScheduledChangesetFmtstr</a>

```
searchKey: store.enqueueNextScheduledChangesetFmtstr
tags: [private]
```

```Go
const enqueueNextScheduledChangesetFmtstr = ...
```

### <a id="getChangesetPlaceInSchedulerQueueFmtstr" href="#getChangesetPlaceInSchedulerQueueFmtstr">const getChangesetPlaceInSchedulerQueueFmtstr</a>

```
searchKey: store.getChangesetPlaceInSchedulerQueueFmtstr
tags: [private]
```

```Go
const getChangesetPlaceInSchedulerQueueFmtstr = ...
```

### <a id="getExternalServiceIDsQueryFmtstr" href="#getExternalServiceIDsQueryFmtstr">const getExternalServiceIDsQueryFmtstr</a>

```
searchKey: store.getExternalServiceIDsQueryFmtstr
tags: [private]
```

```Go
const getExternalServiceIDsQueryFmtstr = ...
```

### <a id="updateSiteCredentialQueryFmtstr" href="#updateSiteCredentialQueryFmtstr">const updateSiteCredentialQueryFmtstr</a>

```
searchKey: store.updateSiteCredentialQueryFmtstr
tags: [private]
```

```Go
const updateSiteCredentialQueryFmtstr = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="batchChangeColumns" href="#batchChangeColumns">var batchChangeColumns</a>

```
searchKey: store.batchChangeColumns
tags: [private]
```

```Go
var batchChangeColumns = ...
```

batchChangeColumns are used by the batch change related Store methods to insert, update and query batches. 

### <a id="batchChangeInsertColumns" href="#batchChangeInsertColumns">var batchChangeInsertColumns</a>

```
searchKey: store.batchChangeInsertColumns
tags: [private]
```

```Go
var batchChangeInsertColumns = ...
```

batchChangeInsertColumns is the list of batch changes columns that are modified in CreateBatchChange and UpdateBatchChange. update and query batches. 

### <a id="createBatchChangeQueryFmtstr" href="#createBatchChangeQueryFmtstr">var createBatchChangeQueryFmtstr</a>

```
searchKey: store.createBatchChangeQueryFmtstr
tags: [private]
```

```Go
var createBatchChangeQueryFmtstr = ...
```

### <a id="updateBatchChangeQueryFmtstr" href="#updateBatchChangeQueryFmtstr">var updateBatchChangeQueryFmtstr</a>

```
searchKey: store.updateBatchChangeQueryFmtstr
tags: [private]
```

```Go
var updateBatchChangeQueryFmtstr = ...
```

### <a id="deleteBatchChangeQueryFmtstr" href="#deleteBatchChangeQueryFmtstr">var deleteBatchChangeQueryFmtstr</a>

```
searchKey: store.deleteBatchChangeQueryFmtstr
tags: [private]
```

```Go
var deleteBatchChangeQueryFmtstr = ...
```

### <a id="countBatchChangesQueryFmtstr" href="#countBatchChangesQueryFmtstr">var countBatchChangesQueryFmtstr</a>

```
searchKey: store.countBatchChangesQueryFmtstr
tags: [private]
```

```Go
var countBatchChangesQueryFmtstr = ...
```

### <a id="getBatchChangesQueryFmtstr" href="#getBatchChangesQueryFmtstr">var getBatchChangesQueryFmtstr</a>

```
searchKey: store.getBatchChangesQueryFmtstr
tags: [private]
```

```Go
var getBatchChangesQueryFmtstr = ...
```

### <a id="getBatchChangeDiffStatQueryFmtstr" href="#getBatchChangeDiffStatQueryFmtstr">var getBatchChangeDiffStatQueryFmtstr</a>

```
searchKey: store.getBatchChangeDiffStatQueryFmtstr
tags: [private]
```

```Go
var getBatchChangeDiffStatQueryFmtstr = ...
```

### <a id="listBatchChangesQueryFmtstr" href="#listBatchChangesQueryFmtstr">var listBatchChangesQueryFmtstr</a>

```
searchKey: store.listBatchChangesQueryFmtstr
tags: [private]
```

```Go
var listBatchChangesQueryFmtstr = ...
```

### <a id="batchSpecColumns" href="#batchSpecColumns">var batchSpecColumns</a>

```
searchKey: store.batchSpecColumns
tags: [private]
```

```Go
var batchSpecColumns = ...
```

batchSpecColumns are used by the batchSpec related Store methods to insert, update and query batch specs. 

### <a id="batchSpecInsertColumns" href="#batchSpecInsertColumns">var batchSpecInsertColumns</a>

```
searchKey: store.batchSpecInsertColumns
tags: [private]
```

```Go
var batchSpecInsertColumns = ...
```

batchSpecInsertColumns is the list of batch_specs columns that are modified when updating/inserting batch specs. 

### <a id="createBatchSpecQueryFmtstr" href="#createBatchSpecQueryFmtstr">var createBatchSpecQueryFmtstr</a>

```
searchKey: store.createBatchSpecQueryFmtstr
tags: [private]
```

```Go
var createBatchSpecQueryFmtstr = ...
```

### <a id="updateBatchSpecQueryFmtstr" href="#updateBatchSpecQueryFmtstr">var updateBatchSpecQueryFmtstr</a>

```
searchKey: store.updateBatchSpecQueryFmtstr
tags: [private]
```

```Go
var updateBatchSpecQueryFmtstr = ...
```

### <a id="deleteBatchSpecQueryFmtstr" href="#deleteBatchSpecQueryFmtstr">var deleteBatchSpecQueryFmtstr</a>

```
searchKey: store.deleteBatchSpecQueryFmtstr
tags: [private]
```

```Go
var deleteBatchSpecQueryFmtstr = ...
```

### <a id="countBatchSpecsQueryFmtstr" href="#countBatchSpecsQueryFmtstr">var countBatchSpecsQueryFmtstr</a>

```
searchKey: store.countBatchSpecsQueryFmtstr
tags: [private]
```

```Go
var countBatchSpecsQueryFmtstr = ...
```

### <a id="getBatchSpecsQueryFmtstr" href="#getBatchSpecsQueryFmtstr">var getBatchSpecsQueryFmtstr</a>

```
searchKey: store.getBatchSpecsQueryFmtstr
tags: [private]
```

```Go
var getBatchSpecsQueryFmtstr = ...
```

### <a id="listBatchSpecsQueryFmtstr" href="#listBatchSpecsQueryFmtstr">var listBatchSpecsQueryFmtstr</a>

```
searchKey: store.listBatchSpecsQueryFmtstr
tags: [private]
```

```Go
var listBatchSpecsQueryFmtstr = ...
```

### <a id="deleteExpiredBatchSpecsQueryFmtstr" href="#deleteExpiredBatchSpecsQueryFmtstr">var deleteExpiredBatchSpecsQueryFmtstr</a>

```
searchKey: store.deleteExpiredBatchSpecsQueryFmtstr
tags: [private]
```

```Go
var deleteExpiredBatchSpecsQueryFmtstr = ...
```

### <a id="bulkOperationColumns" href="#bulkOperationColumns">var bulkOperationColumns</a>

```
searchKey: store.bulkOperationColumns
tags: [private]
```

```Go
var bulkOperationColumns = ...
```

### <a id="getBulkOperationQueryFmtstr" href="#getBulkOperationQueryFmtstr">var getBulkOperationQueryFmtstr</a>

```
searchKey: store.getBulkOperationQueryFmtstr
tags: [private]
```

```Go
var getBulkOperationQueryFmtstr = ...
```

### <a id="listBulkOperationsQueryFmtstr" href="#listBulkOperationsQueryFmtstr">var listBulkOperationsQueryFmtstr</a>

```
searchKey: store.listBulkOperationsQueryFmtstr
tags: [private]
```

```Go
var listBulkOperationsQueryFmtstr = ...
```

### <a id="countBulkOperationsQueryFmtstr" href="#countBulkOperationsQueryFmtstr">var countBulkOperationsQueryFmtstr</a>

```
searchKey: store.countBulkOperationsQueryFmtstr
tags: [private]
```

```Go
var countBulkOperationsQueryFmtstr = ...
```

### <a id="listBulkOperationErrorsQueryFmtstr" href="#listBulkOperationErrorsQueryFmtstr">var listBulkOperationErrorsQueryFmtstr</a>

```
searchKey: store.listBulkOperationErrorsQueryFmtstr
tags: [private]
```

```Go
var listBulkOperationErrorsQueryFmtstr = ...
```

### <a id="getChangesetEventsQueryFmtstr" href="#getChangesetEventsQueryFmtstr">var getChangesetEventsQueryFmtstr</a>

```
searchKey: store.getChangesetEventsQueryFmtstr
tags: [private]
```

```Go
var getChangesetEventsQueryFmtstr = ...
```

### <a id="listChangesetEventsQueryFmtstr" href="#listChangesetEventsQueryFmtstr">var listChangesetEventsQueryFmtstr</a>

```
searchKey: store.listChangesetEventsQueryFmtstr
tags: [private]
```

```Go
var listChangesetEventsQueryFmtstr = ...
```

### <a id="countChangesetEventsQueryFmtstr" href="#countChangesetEventsQueryFmtstr">var countChangesetEventsQueryFmtstr</a>

```
searchKey: store.countChangesetEventsQueryFmtstr
tags: [private]
```

```Go
var countChangesetEventsQueryFmtstr = ...
```

### <a id="upsertChangesetEventsQueryFmtstr" href="#upsertChangesetEventsQueryFmtstr">var upsertChangesetEventsQueryFmtstr</a>

```
searchKey: store.upsertChangesetEventsQueryFmtstr
tags: [private]
```

```Go
var upsertChangesetEventsQueryFmtstr = ...
```

### <a id="changesetJobInsertColumns" href="#changesetJobInsertColumns">var changesetJobInsertColumns</a>

```
searchKey: store.changesetJobInsertColumns
tags: [private]
```

```Go
var changesetJobInsertColumns = ...
```

changesetJobInsertColumns is the list of changeset_jobs columns that are modified in CreateChangesetJob. 

### <a id="ChangesetJobColumns" href="#ChangesetJobColumns">var ChangesetJobColumns</a>

```
searchKey: store.ChangesetJobColumns
```

```Go
var ChangesetJobColumns = ...
```

ChangesetJobColumns are used by the changeset job related Store methods to query and create changeset jobs. 

### <a id="getChangesetJobsQueryFmtstr" href="#getChangesetJobsQueryFmtstr">var getChangesetJobsQueryFmtstr</a>

```
searchKey: store.getChangesetJobsQueryFmtstr
tags: [private]
```

```Go
var getChangesetJobsQueryFmtstr = ...
```

### <a id="changesetSpecInsertColumns" href="#changesetSpecInsertColumns">var changesetSpecInsertColumns</a>

```
searchKey: store.changesetSpecInsertColumns
tags: [private]
```

```Go
var changesetSpecInsertColumns = ...
```

changesetSpecInsertColumns is the list of changeset_specs columns that are modified when inserting or updating a changeset spec. 

### <a id="changesetSpecColumns" href="#changesetSpecColumns">var changesetSpecColumns</a>

```
searchKey: store.changesetSpecColumns
tags: [private]
```

```Go
var changesetSpecColumns = ...
```

changesetSpecColumns are used by the changeset spec related Store methods to insert, update and query changeset specs. 

### <a id="createChangesetSpecQueryFmtstr" href="#createChangesetSpecQueryFmtstr">var createChangesetSpecQueryFmtstr</a>

```
searchKey: store.createChangesetSpecQueryFmtstr
tags: [private]
```

```Go
var createChangesetSpecQueryFmtstr = ...
```

### <a id="updateChangesetSpecQueryFmtstr" href="#updateChangesetSpecQueryFmtstr">var updateChangesetSpecQueryFmtstr</a>

```
searchKey: store.updateChangesetSpecQueryFmtstr
tags: [private]
```

```Go
var updateChangesetSpecQueryFmtstr = ...
```

### <a id="deleteChangesetSpecQueryFmtstr" href="#deleteChangesetSpecQueryFmtstr">var deleteChangesetSpecQueryFmtstr</a>

```
searchKey: store.deleteChangesetSpecQueryFmtstr
tags: [private]
```

```Go
var deleteChangesetSpecQueryFmtstr = ...
```

### <a id="countChangesetSpecsQueryFmtstr" href="#countChangesetSpecsQueryFmtstr">var countChangesetSpecsQueryFmtstr</a>

```
searchKey: store.countChangesetSpecsQueryFmtstr
tags: [private]
```

```Go
var countChangesetSpecsQueryFmtstr = ...
```

### <a id="getChangesetSpecsQueryFmtstr" href="#getChangesetSpecsQueryFmtstr">var getChangesetSpecsQueryFmtstr</a>

```
searchKey: store.getChangesetSpecsQueryFmtstr
tags: [private]
```

```Go
var getChangesetSpecsQueryFmtstr = ...
```

### <a id="listChangesetSpecsQueryFmtstr" href="#listChangesetSpecsQueryFmtstr">var listChangesetSpecsQueryFmtstr</a>

```
searchKey: store.listChangesetSpecsQueryFmtstr
tags: [private]
```

```Go
var listChangesetSpecsQueryFmtstr = ...
```

### <a id="deleteExpiredChangesetSpecsQueryFmtstr" href="#deleteExpiredChangesetSpecsQueryFmtstr">var deleteExpiredChangesetSpecsQueryFmtstr</a>

```
searchKey: store.deleteExpiredChangesetSpecsQueryFmtstr
tags: [private]
```

```Go
var deleteExpiredChangesetSpecsQueryFmtstr = ...
```

### <a id="getRewirerMappingsQueryFmtstr" href="#getRewirerMappingsQueryFmtstr">var getRewirerMappingsQueryFmtstr</a>

```
searchKey: store.getRewirerMappingsQueryFmtstr
tags: [private]
```

```Go
var getRewirerMappingsQueryFmtstr = ...
```

### <a id="ChangesetColumns" href="#ChangesetColumns">var ChangesetColumns</a>

```
searchKey: store.ChangesetColumns
```

```Go
var ChangesetColumns = ...
```

ChangesetColumns are used by by the changeset related Store methods and by workerutil.Worker to load changesets from the database for processing by the reconciler. 

### <a id="changesetInsertColumns" href="#changesetInsertColumns">var changesetInsertColumns</a>

```
searchKey: store.changesetInsertColumns
tags: [private]
```

```Go
var changesetInsertColumns = ...
```

changesetInsertColumns is the list of changeset columns that are modified in CreateChangeset and UpdateChangeset. 

### <a id="createChangesetQueryFmtstr" href="#createChangesetQueryFmtstr">var createChangesetQueryFmtstr</a>

```
searchKey: store.createChangesetQueryFmtstr
tags: [private]
```

```Go
var createChangesetQueryFmtstr = ...
```

### <a id="deleteChangesetQueryFmtstr" href="#deleteChangesetQueryFmtstr">var deleteChangesetQueryFmtstr</a>

```
searchKey: store.deleteChangesetQueryFmtstr
tags: [private]
```

```Go
var deleteChangesetQueryFmtstr = `
DELETE FROM changesets WHERE id = %s
`
```

### <a id="countChangesetsQueryFmtstr" href="#countChangesetsQueryFmtstr">var countChangesetsQueryFmtstr</a>

```
searchKey: store.countChangesetsQueryFmtstr
tags: [private]
```

```Go
var countChangesetsQueryFmtstr = ...
```

### <a id="getChangesetsQueryFmtstr" href="#getChangesetsQueryFmtstr">var getChangesetsQueryFmtstr</a>

```
searchKey: store.getChangesetsQueryFmtstr
tags: [private]
```

```Go
var getChangesetsQueryFmtstr = ...
```

### <a id="listChangesetsQueryFmtstr" href="#listChangesetsQueryFmtstr">var listChangesetsQueryFmtstr</a>

```
searchKey: store.listChangesetsQueryFmtstr
tags: [private]
```

```Go
var listChangesetsQueryFmtstr = ...
```

### <a id="updateChangesetQueryFmtstr" href="#updateChangesetQueryFmtstr">var updateChangesetQueryFmtstr</a>

```
searchKey: store.updateChangesetQueryFmtstr
tags: [private]
```

```Go
var updateChangesetQueryFmtstr = ...
```

### <a id="CanceledChangesetFailureMessage" href="#CanceledChangesetFailureMessage">var CanceledChangesetFailureMessage</a>

```
searchKey: store.CanceledChangesetFailureMessage
```

```Go
var CanceledChangesetFailureMessage = "Canceled"
```

CanceledChangesetFailureMessage is set on changesets as the FailureMessage by CancelQueuedBatchChangeChangesets which is called at the beginning of ApplyBatchChange to stop enqueued changesets being processed while we're applying the new batch spec. 

### <a id="listCodeHostsQueryFmtstr" href="#listCodeHostsQueryFmtstr">var listCodeHostsQueryFmtstr</a>

```
searchKey: store.listCodeHostsQueryFmtstr
tags: [private]
```

```Go
var listCodeHostsQueryFmtstr = ...
```

### <a id="createSiteCredentialQueryFmtstr" href="#createSiteCredentialQueryFmtstr">var createSiteCredentialQueryFmtstr</a>

```
searchKey: store.createSiteCredentialQueryFmtstr
tags: [private]
```

```Go
var createSiteCredentialQueryFmtstr = ...
```

### <a id="deleteSiteCredentialQueryFmtstr" href="#deleteSiteCredentialQueryFmtstr">var deleteSiteCredentialQueryFmtstr</a>

```
searchKey: store.deleteSiteCredentialQueryFmtstr
tags: [private]
```

```Go
var deleteSiteCredentialQueryFmtstr = ...
```

### <a id="getSiteCredentialQueryFmtstr" href="#getSiteCredentialQueryFmtstr">var getSiteCredentialQueryFmtstr</a>

```
searchKey: store.getSiteCredentialQueryFmtstr
tags: [private]
```

```Go
var getSiteCredentialQueryFmtstr = ...
```

### <a id="listSiteCredentialsQueryFmtstr" href="#listSiteCredentialsQueryFmtstr">var listSiteCredentialsQueryFmtstr</a>

```
searchKey: store.listSiteCredentialsQueryFmtstr
tags: [private]
```

```Go
var listSiteCredentialsQueryFmtstr = ...
```

### <a id="siteCredentialColumns" href="#siteCredentialColumns">var siteCredentialColumns</a>

```
searchKey: store.siteCredentialColumns
tags: [private]
```

```Go
var siteCredentialColumns = ...
```

### <a id="seededRand" href="#seededRand">var seededRand</a>

```
searchKey: store.seededRand
tags: [private]
```

```Go
var seededRand = rand.New(rand.NewSource(timeutil.Now().UnixNano()))
```

seededRand is used in RandomID() to generate a "random" number. 

### <a id="ErrNoResults" href="#ErrNoResults">var ErrNoResults</a>

```
searchKey: store.ErrNoResults
```

```Go
var ErrNoResults = errors.New("no results")
```

ErrNoResults is returned by Store method calls that found no results. 

### <a id="cmtRewirerMappingsOpts" href="#cmtRewirerMappingsOpts">var cmtRewirerMappingsOpts</a>

```
searchKey: store.cmtRewirerMappingsOpts
tags: [private]
```

```Go
var cmtRewirerMappingsOpts = ...
```

Comparing the IDs is good enough, no need to bloat the tests here. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CountBatchChangesOpts" href="#CountBatchChangesOpts">type CountBatchChangesOpts struct</a>

```
searchKey: store.CountBatchChangesOpts
```

```Go
type CountBatchChangesOpts struct {
	ChangesetID int64
	State       btypes.BatchChangeState

	InitialApplierID int32

	NamespaceUserID int32
	NamespaceOrgID  int32
}
```

CountBatchChangesOpts captures the query options needed for counting batches. 

### <a id="GetBatchChangeOpts" href="#GetBatchChangeOpts">type GetBatchChangeOpts struct</a>

```
searchKey: store.GetBatchChangeOpts
```

```Go
type GetBatchChangeOpts struct {
	ID int64

	NamespaceUserID int32
	NamespaceOrgID  int32

	BatchSpecID int64
	Name        string
}
```

GetBatchChangeOpts captures the query options needed for getting a batch change 

### <a id="GetBatchChangeDiffStatOpts" href="#GetBatchChangeDiffStatOpts">type GetBatchChangeDiffStatOpts struct</a>

```
searchKey: store.GetBatchChangeDiffStatOpts
```

```Go
type GetBatchChangeDiffStatOpts struct {
	BatchChangeID int64
}
```

### <a id="ListBatchChangesOpts" href="#ListBatchChangesOpts">type ListBatchChangesOpts struct</a>

```
searchKey: store.ListBatchChangesOpts
```

```Go
type ListBatchChangesOpts struct {
	LimitOpts
	ChangesetID int64
	Cursor      int64
	State       btypes.BatchChangeState

	InitialApplierID int32

	NamespaceUserID int32
	NamespaceOrgID  int32
}
```

ListBatchChangesOpts captures the query options needed for listing batches. 

### <a id="GetBatchSpecOpts" href="#GetBatchSpecOpts">type GetBatchSpecOpts struct</a>

```
searchKey: store.GetBatchSpecOpts
```

```Go
type GetBatchSpecOpts struct {
	ID     int64
	RandID string
}
```

GetBatchSpecOpts captures the query options needed for getting a BatchSpec 

### <a id="GetNewestBatchSpecOpts" href="#GetNewestBatchSpecOpts">type GetNewestBatchSpecOpts struct</a>

```
searchKey: store.GetNewestBatchSpecOpts
```

```Go
type GetNewestBatchSpecOpts struct {
	NamespaceUserID int32
	NamespaceOrgID  int32
	UserID          int32
	Name            string
}
```

GetNewestBatchSpecOpts captures the query options needed to get the latest batch spec for the given parameters. One of the namespace fields and all the others must be defined. 

### <a id="ListBatchSpecsOpts" href="#ListBatchSpecsOpts">type ListBatchSpecsOpts struct</a>

```
searchKey: store.ListBatchSpecsOpts
```

```Go
type ListBatchSpecsOpts struct {
	LimitOpts
	Cursor int64
}
```

ListBatchSpecsOpts captures the query options needed for listing batch specs. 

### <a id="GetBulkOperationOpts" href="#GetBulkOperationOpts">type GetBulkOperationOpts struct</a>

```
searchKey: store.GetBulkOperationOpts
```

```Go
type GetBulkOperationOpts struct {
	ID string
}
```

GetBulkOperationOpts captures the query options needed for getting a BulkOperation. 

### <a id="ListBulkOperationsOpts" href="#ListBulkOperationsOpts">type ListBulkOperationsOpts struct</a>

```
searchKey: store.ListBulkOperationsOpts
```

```Go
type ListBulkOperationsOpts struct {
	LimitOpts
	Cursor       int64
	CreatedAfter time.Time

	BatchChangeID int64
}
```

ListBulkOperationsOpts captures the query options needed for getting a list of bulk operations. 

### <a id="CountBulkOperationsOpts" href="#CountBulkOperationsOpts">type CountBulkOperationsOpts struct</a>

```
searchKey: store.CountBulkOperationsOpts
```

```Go
type CountBulkOperationsOpts struct {
	CreatedAfter  time.Time
	BatchChangeID int64
}
```

CountBulkOperationsOpts captures the query options needed when counting BulkOperations. 

### <a id="ListBulkOperationErrorsOpts" href="#ListBulkOperationErrorsOpts">type ListBulkOperationErrorsOpts struct</a>

```
searchKey: store.ListBulkOperationErrorsOpts
```

```Go
type ListBulkOperationErrorsOpts struct {
	BulkOperationID string
}
```

ListBulkOperationErrorsOpts captures the query options needed for getting a list of BulkOperationErrors. 

### <a id="GetChangesetEventOpts" href="#GetChangesetEventOpts">type GetChangesetEventOpts struct</a>

```
searchKey: store.GetChangesetEventOpts
```

```Go
type GetChangesetEventOpts struct {
	ID          int64
	ChangesetID int64
	Kind        btypes.ChangesetEventKind
	Key         string
}
```

GetChangesetEventOpts captures the query options needed for getting a ChangesetEvent 

### <a id="ListChangesetEventsOpts" href="#ListChangesetEventsOpts">type ListChangesetEventsOpts struct</a>

```
searchKey: store.ListChangesetEventsOpts
```

```Go
type ListChangesetEventsOpts struct {
	LimitOpts
	ChangesetIDs []int64
	Kinds        []btypes.ChangesetEventKind
	Cursor       int64
}
```

ListChangesetEventsOpts captures the query options needed for listing changeset events. 

### <a id="CountChangesetEventsOpts" href="#CountChangesetEventsOpts">type CountChangesetEventsOpts struct</a>

```
searchKey: store.CountChangesetEventsOpts
```

```Go
type CountChangesetEventsOpts struct {
	ChangesetID int64
}
```

CountChangesetEventsOpts captures the query options needed for counting changeset events. 

### <a id="GetChangesetJobOpts" href="#GetChangesetJobOpts">type GetChangesetJobOpts struct</a>

```
searchKey: store.GetChangesetJobOpts
```

```Go
type GetChangesetJobOpts struct {
	ID int64
}
```

GetChangesetJobOpts captures the query options needed for getting a ChangesetJob 

### <a id="CountChangesetSpecsOpts" href="#CountChangesetSpecsOpts">type CountChangesetSpecsOpts struct</a>

```
searchKey: store.CountChangesetSpecsOpts
```

```Go
type CountChangesetSpecsOpts struct {
	BatchSpecID int64
}
```

CountChangesetSpecsOpts captures the query options needed for counting ChangesetSpecs. 

### <a id="GetChangesetSpecOpts" href="#GetChangesetSpecOpts">type GetChangesetSpecOpts struct</a>

```
searchKey: store.GetChangesetSpecOpts
```

```Go
type GetChangesetSpecOpts struct {
	ID     int64
	RandID string
}
```

GetChangesetSpecOpts captures the query options needed for getting a ChangesetSpec 

### <a id="ListChangesetSpecsOpts" href="#ListChangesetSpecsOpts">type ListChangesetSpecsOpts struct</a>

```
searchKey: store.ListChangesetSpecsOpts
```

```Go
type ListChangesetSpecsOpts struct {
	LimitOpts
	Cursor int64

	BatchSpecID int64
	RandIDs     []string
	IDs         []int64
}
```

ListChangesetSpecsOpts captures the query options needed for listing code mods. 

### <a id="GetRewirerMappingsOpts" href="#GetRewirerMappingsOpts">type GetRewirerMappingsOpts struct</a>

```
searchKey: store.GetRewirerMappingsOpts
```

```Go
type GetRewirerMappingsOpts struct {
	BatchSpecID   int64
	BatchChangeID int64

	LimitOffset  *database.LimitOffset
	TextSearch   []search.TextSearchTerm
	CurrentState *btypes.ChangesetState
}
```

### <a id="CountChangesetsOpts" href="#CountChangesetsOpts">type CountChangesetsOpts struct</a>

```
searchKey: store.CountChangesetsOpts
```

```Go
type CountChangesetsOpts struct {
	BatchChangeID        int64
	OnlyArchived         bool
	IncludeArchived      bool
	ExternalState        *btypes.ChangesetExternalState
	ExternalReviewState  *btypes.ChangesetReviewState
	ExternalCheckState   *btypes.ChangesetCheckState
	ReconcilerStates     []btypes.ReconcilerState
	OwnedByBatchChangeID int64
	PublicationState     *btypes.ChangesetPublicationState
	TextSearch           []search.TextSearchTerm
	EnforceAuthz         bool
}
```

CountChangesetsOpts captures the query options needed for counting changesets. 

### <a id="GetChangesetOpts" href="#GetChangesetOpts">type GetChangesetOpts struct</a>

```
searchKey: store.GetChangesetOpts
```

```Go
type GetChangesetOpts struct {
	ID                  int64
	RepoID              api.RepoID
	ExternalID          string
	ExternalServiceType string
	ExternalBranch      string
	ReconcilerState     btypes.ReconcilerState
	PublicationState    btypes.ChangesetPublicationState
}
```

GetChangesetOpts captures the query options needed for getting a Changeset 

### <a id="ListChangesetSyncDataOpts" href="#ListChangesetSyncDataOpts">type ListChangesetSyncDataOpts struct</a>

```
searchKey: store.ListChangesetSyncDataOpts
```

```Go
type ListChangesetSyncDataOpts struct {
	// Return only the supplied changesets. If empty, all changesets are returned
	ChangesetIDs []int64

	ExternalServiceID string
}
```

### <a id="ListChangesetsOpts" href="#ListChangesetsOpts">type ListChangesetsOpts struct</a>

```
searchKey: store.ListChangesetsOpts
```

```Go
type ListChangesetsOpts struct {
	LimitOpts
	Cursor               int64
	BatchChangeID        int64
	OnlyArchived         bool
	IncludeArchived      bool
	IDs                  []int64
	PublicationState     *btypes.ChangesetPublicationState
	ReconcilerStates     []btypes.ReconcilerState
	ExternalState        *btypes.ChangesetExternalState
	ExternalReviewState  *btypes.ChangesetReviewState
	ExternalCheckState   *btypes.ChangesetCheckState
	OwnedByBatchChangeID int64
	TextSearch           []search.TextSearchTerm
	EnforceAuthz         bool
}
```

ListChangesetsOpts captures the query options needed for listing changesets. 

Note that TextSearch is potentially expensive, and should only be specified in conjunction with at least one other option (most likely, BatchChangeID). 

### <a id="jsonBatchChangeChangesetSet" href="#jsonBatchChangeChangesetSet">type jsonBatchChangeChangesetSet struct</a>

```
searchKey: store.jsonBatchChangeChangesetSet
tags: [private]
```

```Go
type jsonBatchChangeChangesetSet struct {
	Assocs *[]btypes.BatchChangeAssoc
}
```

jsonBatchChangeChangesetSet represents a "join table" set as a JSONB object where the keys are the ids and the values are json objects holding the properties. It implements the sql.Scanner interface so it can be used as a scan destination, similar to sql.NullString. 

#### <a id="jsonBatchChangeChangesetSet.Scan" href="#jsonBatchChangeChangesetSet.Scan">func (n *jsonBatchChangeChangesetSet) Scan(value interface{}) error</a>

```
searchKey: store.jsonBatchChangeChangesetSet.Scan
tags: [private]
```

```Go
func (n *jsonBatchChangeChangesetSet) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="jsonBatchChangeChangesetSet.Value" href="#jsonBatchChangeChangesetSet.Value">func (n jsonBatchChangeChangesetSet) Value() (driver.Value, error)</a>

```
searchKey: store.jsonBatchChangeChangesetSet.Value
tags: [private]
```

```Go
func (n jsonBatchChangeChangesetSet) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="ListCodeHostsOpts" href="#ListCodeHostsOpts">type ListCodeHostsOpts struct</a>

```
searchKey: store.ListCodeHostsOpts
```

```Go
type ListCodeHostsOpts struct {
	RepoIDs []api.RepoID
}
```

### <a id="GetExternalServiceIDsOpts" href="#GetExternalServiceIDsOpts">type GetExternalServiceIDsOpts struct</a>

```
searchKey: store.GetExternalServiceIDsOpts
```

```Go
type GetExternalServiceIDsOpts struct {
	ExternalServiceType string
	ExternalServiceID   string
}
```

### <a id="GetSiteCredentialOpts" href="#GetSiteCredentialOpts">type GetSiteCredentialOpts struct</a>

```
searchKey: store.GetSiteCredentialOpts
```

```Go
type GetSiteCredentialOpts struct {
	ID                  int64
	ExternalServiceType string
	ExternalServiceID   string
}
```

### <a id="ListSiteCredentialsOpts" href="#ListSiteCredentialsOpts">type ListSiteCredentialsOpts struct</a>

```
searchKey: store.ListSiteCredentialsOpts
```

```Go
type ListSiteCredentialsOpts struct {
	LimitOpts
	ForUpdate bool

	// TODO(batch-changes-site-credential-encryption): remove when no longer
	// needed.
	RequiresMigration bool

	// TODO(batch-changes-site-credential-encryption): remove when no longer
	// needed.
	OnlyEncrypted bool
}
```

### <a id="SQLColumns" href="#SQLColumns">type SQLColumns []string</a>

```
searchKey: store.SQLColumns
```

```Go
type SQLColumns []string
```

SQLColumns is a slice of column names, that can be converted to a slice of *sqlf.Query. 

#### <a id="SQLColumns.ToSqlf" href="#SQLColumns.ToSqlf">func (s SQLColumns) ToSqlf() []*sqlf.Query</a>

```
searchKey: store.SQLColumns.ToSqlf
```

```Go
func (s SQLColumns) ToSqlf() []*sqlf.Query
```

ToSqlf returns all the columns wrapped in a *sqlf.Query. 

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: store.Store
```

```Go
type Store struct {
	*basestore.Store
	key encryption.Key
	now func() time.Time
}
```

Store exposes methods to read and write batches domain models from persistent storage. 

#### <a id="New" href="#New">func New(db dbutil.DB, key encryption.Key) *Store</a>

```
searchKey: store.New
```

```Go
func New(db dbutil.DB, key encryption.Key) *Store
```

New returns a new Store backed by the given database. 

#### <a id="NewWithClock" href="#NewWithClock">func NewWithClock(db dbutil.DB, key encryption.Key, clock func() time.Time) *Store</a>

```
searchKey: store.NewWithClock
```

```Go
func NewWithClock(db dbutil.DB, key encryption.Key, clock func() time.Time) *Store
```

NewWithClock returns a new Store backed by the given database and clock for timestamps. 

#### <a id="Store.CreateBatchChange" href="#Store.CreateBatchChange">func (s *Store) CreateBatchChange(ctx context.Context, c *btypes.BatchChange) error</a>

```
searchKey: store.Store.CreateBatchChange
```

```Go
func (s *Store) CreateBatchChange(ctx context.Context, c *btypes.BatchChange) error
```

CreateBatchChange creates the given batch change. 

#### <a id="Store.createBatchChangeQuery" href="#Store.createBatchChangeQuery">func (s *Store) createBatchChangeQuery(c *btypes.BatchChange) *sqlf.Query</a>

```
searchKey: store.Store.createBatchChangeQuery
tags: [private]
```

```Go
func (s *Store) createBatchChangeQuery(c *btypes.BatchChange) *sqlf.Query
```

#### <a id="Store.UpdateBatchChange" href="#Store.UpdateBatchChange">func (s *Store) UpdateBatchChange(ctx context.Context, c *btypes.BatchChange) error</a>

```
searchKey: store.Store.UpdateBatchChange
```

```Go
func (s *Store) UpdateBatchChange(ctx context.Context, c *btypes.BatchChange) error
```

UpdateBatchChange updates the given bach change. 

#### <a id="Store.updateBatchChangeQuery" href="#Store.updateBatchChangeQuery">func (s *Store) updateBatchChangeQuery(c *btypes.BatchChange) *sqlf.Query</a>

```
searchKey: store.Store.updateBatchChangeQuery
tags: [private]
```

```Go
func (s *Store) updateBatchChangeQuery(c *btypes.BatchChange) *sqlf.Query
```

#### <a id="Store.DeleteBatchChange" href="#Store.DeleteBatchChange">func (s *Store) DeleteBatchChange(ctx context.Context, id int64) error</a>

```
searchKey: store.Store.DeleteBatchChange
```

```Go
func (s *Store) DeleteBatchChange(ctx context.Context, id int64) error
```

DeleteBatchChange deletes the batch change with the given ID. 

#### <a id="Store.CountBatchChanges" href="#Store.CountBatchChanges">func (s *Store) CountBatchChanges(ctx context.Context, opts CountBatchChangesOpts) (int, error)</a>

```
searchKey: store.Store.CountBatchChanges
```

```Go
func (s *Store) CountBatchChanges(ctx context.Context, opts CountBatchChangesOpts) (int, error)
```

CountBatchChanges returns the number of batch changes in the database. 

#### <a id="Store.GetBatchChange" href="#Store.GetBatchChange">func (s *Store) GetBatchChange(ctx context.Context, opts GetBatchChangeOpts) (*btypes.BatchChange, error)</a>

```
searchKey: store.Store.GetBatchChange
```

```Go
func (s *Store) GetBatchChange(ctx context.Context, opts GetBatchChangeOpts) (*btypes.BatchChange, error)
```

GetBatchChange gets a batch change matching the given options. 

#### <a id="Store.GetBatchChangeDiffStat" href="#Store.GetBatchChangeDiffStat">func (s *Store) GetBatchChangeDiffStat(ctx context.Context, opts GetBatchChangeDiffStatOpts) (*diff.Stat, error)</a>

```
searchKey: store.Store.GetBatchChangeDiffStat
```

```Go
func (s *Store) GetBatchChangeDiffStat(ctx context.Context, opts GetBatchChangeDiffStatOpts) (*diff.Stat, error)
```

#### <a id="Store.ListBatchChanges" href="#Store.ListBatchChanges">func (s *Store) ListBatchChanges(ctx context.Context, opts ListBatchChangesOpts) (cs []*btypes.BatchChange, next int64, err error)</a>

```
searchKey: store.Store.ListBatchChanges
```

```Go
func (s *Store) ListBatchChanges(ctx context.Context, opts ListBatchChangesOpts) (cs []*btypes.BatchChange, next int64, err error)
```

ListBatchChanges lists batch changes with the given filters. 

#### <a id="Store.CreateBatchSpec" href="#Store.CreateBatchSpec">func (s *Store) CreateBatchSpec(ctx context.Context, c *btypes.BatchSpec) error</a>

```
searchKey: store.Store.CreateBatchSpec
```

```Go
func (s *Store) CreateBatchSpec(ctx context.Context, c *btypes.BatchSpec) error
```

CreateBatchSpec creates the given BatchSpec. 

#### <a id="Store.createBatchSpecQuery" href="#Store.createBatchSpecQuery">func (s *Store) createBatchSpecQuery(c *btypes.BatchSpec) (*sqlf.Query, error)</a>

```
searchKey: store.Store.createBatchSpecQuery
tags: [private]
```

```Go
func (s *Store) createBatchSpecQuery(c *btypes.BatchSpec) (*sqlf.Query, error)
```

#### <a id="Store.UpdateBatchSpec" href="#Store.UpdateBatchSpec">func (s *Store) UpdateBatchSpec(ctx context.Context, c *btypes.BatchSpec) error</a>

```
searchKey: store.Store.UpdateBatchSpec
```

```Go
func (s *Store) UpdateBatchSpec(ctx context.Context, c *btypes.BatchSpec) error
```

UpdateBatchSpec updates the given BatchSpec. 

#### <a id="Store.updateBatchSpecQuery" href="#Store.updateBatchSpecQuery">func (s *Store) updateBatchSpecQuery(c *btypes.BatchSpec) (*sqlf.Query, error)</a>

```
searchKey: store.Store.updateBatchSpecQuery
tags: [private]
```

```Go
func (s *Store) updateBatchSpecQuery(c *btypes.BatchSpec) (*sqlf.Query, error)
```

#### <a id="Store.DeleteBatchSpec" href="#Store.DeleteBatchSpec">func (s *Store) DeleteBatchSpec(ctx context.Context, id int64) error</a>

```
searchKey: store.Store.DeleteBatchSpec
```

```Go
func (s *Store) DeleteBatchSpec(ctx context.Context, id int64) error
```

DeleteBatchSpec deletes the BatchSpec with the given ID. 

#### <a id="Store.CountBatchSpecs" href="#Store.CountBatchSpecs">func (s *Store) CountBatchSpecs(ctx context.Context) (int, error)</a>

```
searchKey: store.Store.CountBatchSpecs
```

```Go
func (s *Store) CountBatchSpecs(ctx context.Context) (int, error)
```

CountBatchSpecs returns the number of code mods in the database. 

#### <a id="Store.GetBatchSpec" href="#Store.GetBatchSpec">func (s *Store) GetBatchSpec(ctx context.Context, opts GetBatchSpecOpts) (*btypes.BatchSpec, error)</a>

```
searchKey: store.Store.GetBatchSpec
```

```Go
func (s *Store) GetBatchSpec(ctx context.Context, opts GetBatchSpecOpts) (*btypes.BatchSpec, error)
```

GetBatchSpec gets a BatchSpec matching the given options. 

#### <a id="Store.GetNewestBatchSpec" href="#Store.GetNewestBatchSpec">func (s *Store) GetNewestBatchSpec(ctx context.Context, opts GetNewestBatchSpecOpts) (*btypes.BatchSpec, error)</a>

```
searchKey: store.Store.GetNewestBatchSpec
```

```Go
func (s *Store) GetNewestBatchSpec(ctx context.Context, opts GetNewestBatchSpecOpts) (*btypes.BatchSpec, error)
```

GetNewestBatchSpec returns the newest batch spec that matches the given options. 

#### <a id="Store.ListBatchSpecs" href="#Store.ListBatchSpecs">func (s *Store) ListBatchSpecs(ctx context.Context, opts ListBatchSpecsOpts) (cs []*btypes.BatchSpec, next int64, err error)</a>

```
searchKey: store.Store.ListBatchSpecs
```

```Go
func (s *Store) ListBatchSpecs(ctx context.Context, opts ListBatchSpecsOpts) (cs []*btypes.BatchSpec, next int64, err error)
```

ListBatchSpecs lists BatchSpecs with the given filters. 

#### <a id="Store.DeleteExpiredBatchSpecs" href="#Store.DeleteExpiredBatchSpecs">func (s *Store) DeleteExpiredBatchSpecs(ctx context.Context) error</a>

```
searchKey: store.Store.DeleteExpiredBatchSpecs
```

```Go
func (s *Store) DeleteExpiredBatchSpecs(ctx context.Context) error
```

DeleteExpiredBatchSpecs deletes BatchSpecs that have not been attached to a Batch change within BatchSpecTTL. 

#### <a id="Store.GetBulkOperation" href="#Store.GetBulkOperation">func (s *Store) GetBulkOperation(ctx context.Context, opts GetBulkOperationOpts) (*btypes.BulkOperation, error)</a>

```
searchKey: store.Store.GetBulkOperation
```

```Go
func (s *Store) GetBulkOperation(ctx context.Context, opts GetBulkOperationOpts) (*btypes.BulkOperation, error)
```

GetBulkOperation gets a BulkOperation matching the given options. 

#### <a id="Store.ListBulkOperations" href="#Store.ListBulkOperations">func (s *Store) ListBulkOperations(ctx context.Context, opts ListBulkOperationsOpts) (bs []*btypes.BulkOperation, next int64, err error)</a>

```
searchKey: store.Store.ListBulkOperations
```

```Go
func (s *Store) ListBulkOperations(ctx context.Context, opts ListBulkOperationsOpts) (bs []*btypes.BulkOperation, next int64, err error)
```

ListBulkOperations gets a list of BulkOperations matching the given options. 

#### <a id="Store.CountBulkOperations" href="#Store.CountBulkOperations">func (s *Store) CountBulkOperations(ctx context.Context, opts CountBulkOperationsOpts) (int, error)</a>

```
searchKey: store.Store.CountBulkOperations
```

```Go
func (s *Store) CountBulkOperations(ctx context.Context, opts CountBulkOperationsOpts) (int, error)
```

CountBulkOperations gets the count of BulkOperations in the given batch change. 

#### <a id="Store.ListBulkOperationErrors" href="#Store.ListBulkOperationErrors">func (s *Store) ListBulkOperationErrors(ctx context.Context, opts ListBulkOperationErrorsOpts) (es []*btypes.BulkOperationError, err error)</a>

```
searchKey: store.Store.ListBulkOperationErrors
```

```Go
func (s *Store) ListBulkOperationErrors(ctx context.Context, opts ListBulkOperationErrorsOpts) (es []*btypes.BulkOperationError, err error)
```

ListBulkOperationErrors gets a list of BulkOperationErrors in a given BulkOperation. 

#### <a id="Store.GetChangesetEvent" href="#Store.GetChangesetEvent">func (s *Store) GetChangesetEvent(ctx context.Context, opts GetChangesetEventOpts) (*btypes.ChangesetEvent, error)</a>

```
searchKey: store.Store.GetChangesetEvent
```

```Go
func (s *Store) GetChangesetEvent(ctx context.Context, opts GetChangesetEventOpts) (*btypes.ChangesetEvent, error)
```

GetChangesetEvent gets a changeset matching the given options. 

#### <a id="Store.ListChangesetEvents" href="#Store.ListChangesetEvents">func (s *Store) ListChangesetEvents(ctx context.Context, opts ListChangesetEventsOpts) (cs []*btypes.ChangesetEvent, next int64, err error)</a>

```
searchKey: store.Store.ListChangesetEvents
```

```Go
func (s *Store) ListChangesetEvents(ctx context.Context, opts ListChangesetEventsOpts) (cs []*btypes.ChangesetEvent, next int64, err error)
```

ListChangesetEvents lists ChangesetEvents with the given filters. 

#### <a id="Store.CountChangesetEvents" href="#Store.CountChangesetEvents">func (s *Store) CountChangesetEvents(ctx context.Context, opts CountChangesetEventsOpts) (int, error)</a>

```
searchKey: store.Store.CountChangesetEvents
```

```Go
func (s *Store) CountChangesetEvents(ctx context.Context, opts CountChangesetEventsOpts) (int, error)
```

CountChangesetEvents returns the number of changeset events in the database. 

#### <a id="Store.UpsertChangesetEvents" href="#Store.UpsertChangesetEvents">func (s *Store) UpsertChangesetEvents(ctx context.Context, cs ...*btypes.ChangesetEvent) (err error)</a>

```
searchKey: store.Store.UpsertChangesetEvents
```

```Go
func (s *Store) UpsertChangesetEvents(ctx context.Context, cs ...*btypes.ChangesetEvent) (err error)
```

UpsertChangesetEvents creates or updates the given ChangesetEvents. 

#### <a id="Store.upsertChangesetEventsQuery" href="#Store.upsertChangesetEventsQuery">func (s *Store) upsertChangesetEventsQuery(es []*btypes.ChangesetEvent) (*sqlf.Query, error)</a>

```
searchKey: store.Store.upsertChangesetEventsQuery
tags: [private]
```

```Go
func (s *Store) upsertChangesetEventsQuery(es []*btypes.ChangesetEvent) (*sqlf.Query, error)
```

#### <a id="Store.CreateChangesetJob" href="#Store.CreateChangesetJob">func (s *Store) CreateChangesetJob(ctx context.Context, cs ...*btypes.ChangesetJob) error</a>

```
searchKey: store.Store.CreateChangesetJob
```

```Go
func (s *Store) CreateChangesetJob(ctx context.Context, cs ...*btypes.ChangesetJob) error
```

CreateChangesetJob creates the given changeset jobs. 

#### <a id="Store.GetChangesetJob" href="#Store.GetChangesetJob">func (s *Store) GetChangesetJob(ctx context.Context, opts GetChangesetJobOpts) (*btypes.ChangesetJob, error)</a>

```
searchKey: store.Store.GetChangesetJob
```

```Go
func (s *Store) GetChangesetJob(ctx context.Context, opts GetChangesetJobOpts) (*btypes.ChangesetJob, error)
```

GetChangesetJob gets a ChangesetJob matching the given options. 

#### <a id="Store.CreateChangesetSpec" href="#Store.CreateChangesetSpec">func (s *Store) CreateChangesetSpec(ctx context.Context, c *btypes.ChangesetSpec) error</a>

```
searchKey: store.Store.CreateChangesetSpec
```

```Go
func (s *Store) CreateChangesetSpec(ctx context.Context, c *btypes.ChangesetSpec) error
```

CreateChangesetSpec creates the given ChangesetSpec. 

#### <a id="Store.createChangesetSpecQuery" href="#Store.createChangesetSpecQuery">func (s *Store) createChangesetSpecQuery(c *btypes.ChangesetSpec) (*sqlf.Query, error)</a>

```
searchKey: store.Store.createChangesetSpecQuery
tags: [private]
```

```Go
func (s *Store) createChangesetSpecQuery(c *btypes.ChangesetSpec) (*sqlf.Query, error)
```

#### <a id="Store.UpdateChangesetSpec" href="#Store.UpdateChangesetSpec">func (s *Store) UpdateChangesetSpec(ctx context.Context, c *btypes.ChangesetSpec) error</a>

```
searchKey: store.Store.UpdateChangesetSpec
```

```Go
func (s *Store) UpdateChangesetSpec(ctx context.Context, c *btypes.ChangesetSpec) error
```

UpdateChangesetSpec updates the given ChangesetSpec. 

#### <a id="Store.updateChangesetSpecQuery" href="#Store.updateChangesetSpecQuery">func (s *Store) updateChangesetSpecQuery(c *btypes.ChangesetSpec) (*sqlf.Query, error)</a>

```
searchKey: store.Store.updateChangesetSpecQuery
tags: [private]
```

```Go
func (s *Store) updateChangesetSpecQuery(c *btypes.ChangesetSpec) (*sqlf.Query, error)
```

#### <a id="Store.DeleteChangesetSpec" href="#Store.DeleteChangesetSpec">func (s *Store) DeleteChangesetSpec(ctx context.Context, id int64) error</a>

```
searchKey: store.Store.DeleteChangesetSpec
```

```Go
func (s *Store) DeleteChangesetSpec(ctx context.Context, id int64) error
```

DeleteChangesetSpec deletes the ChangesetSpec with the given ID. 

#### <a id="Store.CountChangesetSpecs" href="#Store.CountChangesetSpecs">func (s *Store) CountChangesetSpecs(ctx context.Context, opts CountChangesetSpecsOpts) (int, error)</a>

```
searchKey: store.Store.CountChangesetSpecs
```

```Go
func (s *Store) CountChangesetSpecs(ctx context.Context, opts CountChangesetSpecsOpts) (int, error)
```

CountChangesetSpecs returns the number of changeset specs in the database. 

#### <a id="Store.GetChangesetSpec" href="#Store.GetChangesetSpec">func (s *Store) GetChangesetSpec(ctx context.Context, opts GetChangesetSpecOpts) (*btypes.ChangesetSpec, error)</a>

```
searchKey: store.Store.GetChangesetSpec
```

```Go
func (s *Store) GetChangesetSpec(ctx context.Context, opts GetChangesetSpecOpts) (*btypes.ChangesetSpec, error)
```

GetChangesetSpec gets a changeset spec matching the given options. 

#### <a id="Store.GetChangesetSpecByID" href="#Store.GetChangesetSpecByID">func (s *Store) GetChangesetSpecByID(ctx context.Context, id int64) (*btypes.ChangesetSpec, error)</a>

```
searchKey: store.Store.GetChangesetSpecByID
```

```Go
func (s *Store) GetChangesetSpecByID(ctx context.Context, id int64) (*btypes.ChangesetSpec, error)
```

GetChangesetSpecByID gets a changeset spec with the given ID. 

#### <a id="Store.ListChangesetSpecs" href="#Store.ListChangesetSpecs">func (s *Store) ListChangesetSpecs(ctx context.Context, opts ListChangesetSpecsOpts) (cs btypes.ChangesetSpecs, next int64, err error)</a>

```
searchKey: store.Store.ListChangesetSpecs
```

```Go
func (s *Store) ListChangesetSpecs(ctx context.Context, opts ListChangesetSpecsOpts) (cs btypes.ChangesetSpecs, next int64, err error)
```

ListChangesetSpecs lists ChangesetSpecs with the given filters. 

#### <a id="Store.DeleteExpiredChangesetSpecs" href="#Store.DeleteExpiredChangesetSpecs">func (s *Store) DeleteExpiredChangesetSpecs(ctx context.Context) error</a>

```
searchKey: store.Store.DeleteExpiredChangesetSpecs
```

```Go
func (s *Store) DeleteExpiredChangesetSpecs(ctx context.Context) error
```

DeleteExpiredChangesetSpecs deletes each ChangesetSpec that has not been attached to a BatchSpec within ChangesetSpecTTL, OR that is attached to a BatchSpec that is not applied and is not attached to a Changeset within BatchSpecTTL 

#### <a id="Store.GetRewirerMappings" href="#Store.GetRewirerMappings">func (s *Store) GetRewirerMappings(ctx context.Context, opts GetRewirerMappingsOpts) (mappings btypes.RewirerMappings, err error)</a>

```
searchKey: store.Store.GetRewirerMappings
```

```Go
func (s *Store) GetRewirerMappings(ctx context.Context, opts GetRewirerMappingsOpts) (mappings btypes.RewirerMappings, err error)
```

GetRewirerMappings returns RewirerMappings between changeset specs and changesets. 

We have two imaginary lists, the current changesets in the batch change and the new changeset specs: 

┌───────────────────────────────────────┐   ┌───────────────────────────────┐ │Changeset 1 | Repo A | #111 | run-gofmt│   │  Spec 1 | Repo A | run-gofmt  │ └───────────────────────────────────────┘   └───────────────────────────────┘ ┌───────────────────────────────────────┐   ┌───────────────────────────────┐ │Changeset 2 | Repo B |      | run-gofmt│   │  Spec 2 | Repo B | run-gofmt  │ └───────────────────────────────────────┘   └───────────────────────────────┘ ┌───────────────────────────────────────┐   ┌───────────────────────────────────┐ │Changeset 3 | Repo C | #222 | run-gofmt│   │  Spec 3 | Repo C | run-goimports  │ └───────────────────────────────────────┘   └───────────────────────────────────┘ ┌───────────────────────────────────────┐   ┌───────────────────────────────┐ │Changeset 4 | Repo C | #333 | older-pr │   │    Spec 4 | Repo C | #333     │ └───────────────────────────────────────┘   └───────────────────────────────┘ 

We need to: 1. Find out whether our new specs should _update_ an existing 

```
changeset (ChangesetSpec != 0, Changeset != 0), or whether we need to create a new one.

```
2. Since we can have multiple changesets per repository, we need to match 

```
based on repo and external ID for imported changesets and on repo and head_ref for 'branch' changesets.

```
3. If a changeset wasn't published yet, it doesn't have an external ID nor does it have an external head_ref. 

```
In that case, we need to check whether the branch on which we _might_
push the commit (because the changeset might not be published
yet) is the same or compare the external IDs in the current and new specs.

```
What we want: 

┌───────────────────────────────────────┐    ┌───────────────────────────────┐ │Changeset 1 | Repo A | #111 | run-gofmt│───▶│  Spec 1 | Repo A | run-gofmt  │ └───────────────────────────────────────┘    └───────────────────────────────┘ ┌───────────────────────────────────────┐    ┌───────────────────────────────┐ │Changeset 2 | Repo B |      | run-gofmt│───▶│  Spec 2 | Repo B | run-gofmt  │ └───────────────────────────────────────┘    └───────────────────────────────┘ ┌───────────────────────────────────────┐ │Changeset 3 | Repo C | #222 | run-gofmt│ └───────────────────────────────────────┘ ┌───────────────────────────────────────┐    ┌───────────────────────────────┐ │Changeset 4 | Repo C | #333 | older-pr │───▶│    Spec 4 | Repo C | #333     │ └───────────────────────────────────────┘    └───────────────────────────────┘ ┌───────────────────────────────────────┐    ┌───────────────────────────────────┐ │Changeset 5 | Repo C | | run-goimports │───▶│  Spec 3 | Repo C | run-goimports  │ └───────────────────────────────────────┘    └───────────────────────────────────┘ 

Spec 1 should be attached to Changeset 1 and (possibly) update its title/body/diff. (ChangesetSpec = 1, Changeset = 1) Spec 2 should be attached to Changeset 2 and publish it on the code host. (ChangesetSpec = 2, Changeset = 2) Spec 3 should get a new Changeset, since its branch doesn't match Changeset 3's branch. (ChangesetSpec = 3, Changeset = 0) Spec 4 should be attached to Changeset 4, since it tracks PR #333 in Repo C. (ChangesetSpec = 4, Changeset = 4) Changeset 3 doesn't have a matching spec and should be detached from the batch change (and closed) (ChangesetSpec == 0, Changeset = 3). 

#### <a id="Store.changesetWriteQuery" href="#Store.changesetWriteQuery">func (s *Store) changesetWriteQuery(q string, includeID bool, c *btypes.Changeset) (*sqlf.Query, error)</a>

```
searchKey: store.Store.changesetWriteQuery
tags: [private]
```

```Go
func (s *Store) changesetWriteQuery(q string, includeID bool, c *btypes.Changeset) (*sqlf.Query, error)
```

#### <a id="Store.UpsertChangeset" href="#Store.UpsertChangeset">func (s *Store) UpsertChangeset(ctx context.Context, c *btypes.Changeset) error</a>

```
searchKey: store.Store.UpsertChangeset
```

```Go
func (s *Store) UpsertChangeset(ctx context.Context, c *btypes.Changeset) error
```

UpsertChangeset creates or updates the given Changeset. 

#### <a id="Store.CreateChangeset" href="#Store.CreateChangeset">func (s *Store) CreateChangeset(ctx context.Context, c *btypes.Changeset) error</a>

```
searchKey: store.Store.CreateChangeset
```

```Go
func (s *Store) CreateChangeset(ctx context.Context, c *btypes.Changeset) error
```

CreateChangeset creates the given Changeset. 

#### <a id="Store.DeleteChangeset" href="#Store.DeleteChangeset">func (s *Store) DeleteChangeset(ctx context.Context, id int64) error</a>

```
searchKey: store.Store.DeleteChangeset
```

```Go
func (s *Store) DeleteChangeset(ctx context.Context, id int64) error
```

DeleteChangeset deletes the Changeset with the given ID. 

#### <a id="Store.CountChangesets" href="#Store.CountChangesets">func (s *Store) CountChangesets(ctx context.Context, opts CountChangesetsOpts) (int, error)</a>

```
searchKey: store.Store.CountChangesets
```

```Go
func (s *Store) CountChangesets(ctx context.Context, opts CountChangesetsOpts) (int, error)
```

CountChangesets returns the number of changesets in the database. 

#### <a id="Store.GetChangesetByID" href="#Store.GetChangesetByID">func (s *Store) GetChangesetByID(ctx context.Context, id int64) (*btypes.Changeset, error)</a>

```
searchKey: store.Store.GetChangesetByID
```

```Go
func (s *Store) GetChangesetByID(ctx context.Context, id int64) (*btypes.Changeset, error)
```

GetChangesetByID is a convenience method if only the ID needs to be passed in. It's also used for abstraction in the testing package. 

#### <a id="Store.GetChangeset" href="#Store.GetChangeset">func (s *Store) GetChangeset(ctx context.Context, opts GetChangesetOpts) (*btypes.Changeset, error)</a>

```
searchKey: store.Store.GetChangeset
```

```Go
func (s *Store) GetChangeset(ctx context.Context, opts GetChangesetOpts) (*btypes.Changeset, error)
```

GetChangeset gets a changeset matching the given options. 

#### <a id="Store.ListChangesetSyncData" href="#Store.ListChangesetSyncData">func (s *Store) ListChangesetSyncData(ctx context.Context, opts ListChangesetSyncDataOpts) ([]*btypes.ChangesetSyncData, error)</a>

```
searchKey: store.Store.ListChangesetSyncData
```

```Go
func (s *Store) ListChangesetSyncData(ctx context.Context, opts ListChangesetSyncDataOpts) ([]*btypes.ChangesetSyncData, error)
```

ListChangesetSyncData returns sync data on all non-externally-deleted changesets that are part of at least one open batch change. 

#### <a id="Store.ListChangesets" href="#Store.ListChangesets">func (s *Store) ListChangesets(ctx context.Context, opts ListChangesetsOpts) (cs btypes.Changesets, next int64, err error)</a>

```
searchKey: store.Store.ListChangesets
```

```Go
func (s *Store) ListChangesets(ctx context.Context, opts ListChangesetsOpts) (cs btypes.Changesets, next int64, err error)
```

ListChangesets lists Changesets with the given filters. 

#### <a id="Store.UpdateChangeset" href="#Store.UpdateChangeset">func (s *Store) UpdateChangeset(ctx context.Context, cs *btypes.Changeset) error</a>

```
searchKey: store.Store.UpdateChangeset
```

```Go
func (s *Store) UpdateChangeset(ctx context.Context, cs *btypes.Changeset) error
```

UpdateChangeset updates the given Changeset. 

#### <a id="Store.GetChangesetExternalIDs" href="#Store.GetChangesetExternalIDs">func (s *Store) GetChangesetExternalIDs(ctx context.Context, spec api.ExternalRepoSpec, refs []string) ([]string, error)</a>

```
searchKey: store.Store.GetChangesetExternalIDs
```

```Go
func (s *Store) GetChangesetExternalIDs(ctx context.Context, spec api.ExternalRepoSpec, refs []string) ([]string, error)
```

GetChangesetExternalIDs allows us to find the external ids for pull requests based on a slice of head refs. We need this in order to match incoming webhooks to pull requests as the only information they provide is the remote branch 

#### <a id="Store.CancelQueuedBatchChangeChangesets" href="#Store.CancelQueuedBatchChangeChangesets">func (s *Store) CancelQueuedBatchChangeChangesets(ctx context.Context, batchChangeID int64) error</a>

```
searchKey: store.Store.CancelQueuedBatchChangeChangesets
```

```Go
func (s *Store) CancelQueuedBatchChangeChangesets(ctx context.Context, batchChangeID int64) error
```

#### <a id="Store.EnqueueChangesetsToClose" href="#Store.EnqueueChangesetsToClose">func (s *Store) EnqueueChangesetsToClose(ctx context.Context, batchChangeID int64) error</a>

```
searchKey: store.Store.EnqueueChangesetsToClose
```

```Go
func (s *Store) EnqueueChangesetsToClose(ctx context.Context, batchChangeID int64) error
```

EnqueueChangesetsToClose updates all changesets that are owned by the given batch change to set their reconciler status to 'queued' and the Closing boolean to true. 

It does not update the changesets that are fully processed and already closed/merged. 

This method will *block* if some of the changesets are currently being processed. 

#### <a id="Store.GetChangesetsStats" href="#Store.GetChangesetsStats">func (s *Store) GetChangesetsStats(ctx context.Context, batchChangeID int64) (stats btypes.ChangesetsStats, err error)</a>

```
searchKey: store.Store.GetChangesetsStats
```

```Go
func (s *Store) GetChangesetsStats(ctx context.Context, batchChangeID int64) (stats btypes.ChangesetsStats, err error)
```

GetChangesetsStats returns statistics on all the changesets associated to the given batch change, or all changesets across the instance. 

#### <a id="Store.EnqueueNextScheduledChangeset" href="#Store.EnqueueNextScheduledChangeset">func (s *Store) EnqueueNextScheduledChangeset(ctx context.Context) (*btypes.Changeset, error)</a>

```
searchKey: store.Store.EnqueueNextScheduledChangeset
```

```Go
func (s *Store) EnqueueNextScheduledChangeset(ctx context.Context) (*btypes.Changeset, error)
```

#### <a id="Store.GetChangesetPlaceInSchedulerQueue" href="#Store.GetChangesetPlaceInSchedulerQueue">func (s *Store) GetChangesetPlaceInSchedulerQueue(ctx context.Context, id int64) (int, error)</a>

```
searchKey: store.Store.GetChangesetPlaceInSchedulerQueue
```

```Go
func (s *Store) GetChangesetPlaceInSchedulerQueue(ctx context.Context, id int64) (int, error)
```

#### <a id="Store.ListCodeHosts" href="#Store.ListCodeHosts">func (s *Store) ListCodeHosts(ctx context.Context, opts ListCodeHostsOpts) ([]*btypes.CodeHost, error)</a>

```
searchKey: store.Store.ListCodeHosts
```

```Go
func (s *Store) ListCodeHosts(ctx context.Context, opts ListCodeHostsOpts) ([]*btypes.CodeHost, error)
```

#### <a id="Store.GetExternalServiceIDs" href="#Store.GetExternalServiceIDs">func (s *Store) GetExternalServiceIDs(ctx context.Context, opts GetExternalServiceIDsOpts) (ids []int64, err error)</a>

```
searchKey: store.Store.GetExternalServiceIDs
```

```Go
func (s *Store) GetExternalServiceIDs(ctx context.Context, opts GetExternalServiceIDsOpts) (ids []int64, err error)
```

#### <a id="Store.CreateSiteCredential" href="#Store.CreateSiteCredential">func (s *Store) CreateSiteCredential(ctx context.Context, c *btypes.SiteCredential, credential auth.Authenticator) error</a>

```
searchKey: store.Store.CreateSiteCredential
```

```Go
func (s *Store) CreateSiteCredential(ctx context.Context, c *btypes.SiteCredential, credential auth.Authenticator) error
```

#### <a id="Store.DeleteSiteCredential" href="#Store.DeleteSiteCredential">func (s *Store) DeleteSiteCredential(ctx context.Context, id int64) error</a>

```
searchKey: store.Store.DeleteSiteCredential
```

```Go
func (s *Store) DeleteSiteCredential(ctx context.Context, id int64) error
```

#### <a id="Store.GetSiteCredential" href="#Store.GetSiteCredential">func (s *Store) GetSiteCredential(ctx context.Context, opts GetSiteCredentialOpts) (*btypes.SiteCredential, error)</a>

```
searchKey: store.Store.GetSiteCredential
```

```Go
func (s *Store) GetSiteCredential(ctx context.Context, opts GetSiteCredentialOpts) (*btypes.SiteCredential, error)
```

#### <a id="Store.ListSiteCredentials" href="#Store.ListSiteCredentials">func (s *Store) ListSiteCredentials(ctx context.Context, opts ListSiteCredentialsOpts) (cs []*btypes.SiteCredential, next int64, err error)</a>

```
searchKey: store.Store.ListSiteCredentials
```

```Go
func (s *Store) ListSiteCredentials(ctx context.Context, opts ListSiteCredentialsOpts) (cs []*btypes.SiteCredential, next int64, err error)
```

#### <a id="Store.UpdateSiteCredential" href="#Store.UpdateSiteCredential">func (s *Store) UpdateSiteCredential(ctx context.Context, c *btypes.SiteCredential) error</a>

```
searchKey: store.Store.UpdateSiteCredential
```

```Go
func (s *Store) UpdateSiteCredential(ctx context.Context, c *btypes.SiteCredential) error
```

#### <a id="Store.updateSiteCredentialQuery" href="#Store.updateSiteCredentialQuery">func (s *Store) updateSiteCredentialQuery(c *btypes.SiteCredential) *sqlf.Query</a>

```
searchKey: store.Store.updateSiteCredentialQuery
tags: [private]
```

```Go
func (s *Store) updateSiteCredentialQuery(c *btypes.SiteCredential) *sqlf.Query
```

#### <a id="Store.Clock" href="#Store.Clock">func (s *Store) Clock() func() time.Time</a>

```
searchKey: store.Store.Clock
```

```Go
func (s *Store) Clock() func() time.Time
```

Clock returns the clock used by the Store. 

#### <a id="Store.DB" href="#Store.DB">func (s *Store) DB() dbutil.DB</a>

```
searchKey: store.Store.DB
```

```Go
func (s *Store) DB() dbutil.DB
```

DB returns the underlying dbutil.DB that this Store was instantiated with. It's here for legacy reason to pass the dbutil.DB to a repos.Store while repos.Store doesn't accept a basestore.TransactableHandle yet. 

#### <a id="Store.Handle" href="#Store.Handle">func (s *Store) Handle() *basestore.TransactableHandle</a>

```
searchKey: store.Store.Handle
```

```Go
func (s *Store) Handle() *basestore.TransactableHandle
```

Handle returns the underlying transactable database handle. Needed to implement the ShareableStore interface. 

#### <a id="Store.With" href="#Store.With">func (s *Store) With(other basestore.ShareableStore) *Store</a>

```
searchKey: store.Store.With
```

```Go
func (s *Store) With(other basestore.ShareableStore) *Store
```

With creates a new Store with the given basestore.Shareable store as the underlying basestore.Store. Needed to implement the basestore.Store interface 

#### <a id="Store.Transact" href="#Store.Transact">func (s *Store) Transact(ctx context.Context) (*Store, error)</a>

```
searchKey: store.Store.Transact
```

```Go
func (s *Store) Transact(ctx context.Context) (*Store, error)
```

Transact creates a new transaction. It's required to implement this method and wrap the Transact method of the underlying basestore.Store. 

#### <a id="Store.Repos" href="#Store.Repos">func (s *Store) Repos() *database.RepoStore</a>

```
searchKey: store.Store.Repos
```

```Go
func (s *Store) Repos() *database.RepoStore
```

Repos returns a database.RepoStore using the same connection as this store. 

#### <a id="Store.ExternalServices" href="#Store.ExternalServices">func (s *Store) ExternalServices() *database.ExternalServiceStore</a>

```
searchKey: store.Store.ExternalServices
```

```Go
func (s *Store) ExternalServices() *database.ExternalServiceStore
```

ExternalServices returns a database.ExternalServiceStore using the same connection as this store. 

#### <a id="Store.UserCredentials" href="#Store.UserCredentials">func (s *Store) UserCredentials() *database.UserCredentialsStore</a>

```
searchKey: store.Store.UserCredentials
```

```Go
func (s *Store) UserCredentials() *database.UserCredentialsStore
```

UserCredentials returns a database.UserCredentialsStore using the same connection as this store. 

#### <a id="Store.query" href="#Store.query">func (s *Store) query(ctx context.Context, q *sqlf.Query, sc scanFunc) error</a>

```
searchKey: store.Store.query
tags: [private]
```

```Go
func (s *Store) query(ctx context.Context, q *sqlf.Query, sc scanFunc) error
```

#### <a id="Store.queryCount" href="#Store.queryCount">func (s *Store) queryCount(ctx context.Context, q *sqlf.Query) (int, error)</a>

```
searchKey: store.Store.queryCount
tags: [private]
```

```Go
func (s *Store) queryCount(ctx context.Context, q *sqlf.Query) (int, error)
```

### <a id="scanner" href="#scanner">type scanner interface</a>

```
searchKey: store.scanner
tags: [private]
```

```Go
type scanner interface {
	Scan(dst ...interface{}) error
}
```

scanner captures the Scan method of sql.Rows and sql.Row 

### <a id="scanFunc" href="#scanFunc">type scanFunc func(github.com/sourcegraph/sourcegraph/enterprise/internal/batches/store.scanner) (err error)</a>

```
searchKey: store.scanFunc
tags: [private]
```

```Go
type scanFunc func(scanner) (err error)
```

a scanFunc scans one or more rows from a scanner, returning the last id column scanned and the count of scanned rows. 

### <a id="LimitOpts" href="#LimitOpts">type LimitOpts struct</a>

```
searchKey: store.LimitOpts
```

```Go
type LimitOpts struct {
	Limit int
}
```

#### <a id="LimitOpts.DBLimit" href="#LimitOpts.DBLimit">func (o LimitOpts) DBLimit() int</a>

```
searchKey: store.LimitOpts.DBLimit
```

```Go
func (o LimitOpts) DBLimit() int
```

#### <a id="LimitOpts.ToDB" href="#LimitOpts.ToDB">func (o LimitOpts) ToDB() string</a>

```
searchKey: store.LimitOpts.ToDB
```

```Go
func (o LimitOpts) ToDB() string
```

### <a id="storeTestFunc" href="#storeTestFunc">type storeTestFunc func(*testing.T, context.Context, *github.com/sourcegraph/sourcegraph/enterprise/internal/batches/store.Store, github.com/sourcegraph/sourcegraph/enterprise/internal/batches/testing.Clock)</a>

```
searchKey: store.storeTestFunc
tags: [private]
```

```Go
type storeTestFunc func(*testing.T, context.Context, *Store, ct.Clock)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="countBatchChangesQuery" href="#countBatchChangesQuery">func countBatchChangesQuery(opts *CountBatchChangesOpts) *sqlf.Query</a>

```
searchKey: store.countBatchChangesQuery
tags: [private]
```

```Go
func countBatchChangesQuery(opts *CountBatchChangesOpts) *sqlf.Query
```

### <a id="getBatchChangeQuery" href="#getBatchChangeQuery">func getBatchChangeQuery(opts *GetBatchChangeOpts) *sqlf.Query</a>

```
searchKey: store.getBatchChangeQuery
tags: [private]
```

```Go
func getBatchChangeQuery(opts *GetBatchChangeOpts) *sqlf.Query
```

### <a id="getBatchChangeDiffStatQuery" href="#getBatchChangeDiffStatQuery">func getBatchChangeDiffStatQuery(opts GetBatchChangeDiffStatOpts, authzConds *sqlf.Query) *sqlf.Query</a>

```
searchKey: store.getBatchChangeDiffStatQuery
tags: [private]
```

```Go
func getBatchChangeDiffStatQuery(opts GetBatchChangeDiffStatOpts, authzConds *sqlf.Query) *sqlf.Query
```

### <a id="listBatchChangesQuery" href="#listBatchChangesQuery">func listBatchChangesQuery(opts *ListBatchChangesOpts) *sqlf.Query</a>

```
searchKey: store.listBatchChangesQuery
tags: [private]
```

```Go
func listBatchChangesQuery(opts *ListBatchChangesOpts) *sqlf.Query
```

### <a id="scanBatchChange" href="#scanBatchChange">func scanBatchChange(c *btypes.BatchChange, s scanner) error</a>

```
searchKey: store.scanBatchChange
tags: [private]
```

```Go
func scanBatchChange(c *btypes.BatchChange, s scanner) error
```

### <a id="getBatchSpecQuery" href="#getBatchSpecQuery">func getBatchSpecQuery(opts *GetBatchSpecOpts) *sqlf.Query</a>

```
searchKey: store.getBatchSpecQuery
tags: [private]
```

```Go
func getBatchSpecQuery(opts *GetBatchSpecOpts) *sqlf.Query
```

### <a id="getNewestBatchSpecQuery" href="#getNewestBatchSpecQuery">func getNewestBatchSpecQuery(opts *GetNewestBatchSpecOpts) *sqlf.Query</a>

```
searchKey: store.getNewestBatchSpecQuery
tags: [private]
```

```Go
func getNewestBatchSpecQuery(opts *GetNewestBatchSpecOpts) *sqlf.Query
```

### <a id="listBatchSpecsQuery" href="#listBatchSpecsQuery">func listBatchSpecsQuery(opts *ListBatchSpecsOpts) *sqlf.Query</a>

```
searchKey: store.listBatchSpecsQuery
tags: [private]
```

```Go
func listBatchSpecsQuery(opts *ListBatchSpecsOpts) *sqlf.Query
```

### <a id="scanBatchSpec" href="#scanBatchSpec">func scanBatchSpec(c *btypes.BatchSpec, s scanner) error</a>

```
searchKey: store.scanBatchSpec
tags: [private]
```

```Go
func scanBatchSpec(c *btypes.BatchSpec, s scanner) error
```

### <a id="getBulkOperationQuery" href="#getBulkOperationQuery">func getBulkOperationQuery(opts *GetBulkOperationOpts) *sqlf.Query</a>

```
searchKey: store.getBulkOperationQuery
tags: [private]
```

```Go
func getBulkOperationQuery(opts *GetBulkOperationOpts) *sqlf.Query
```

### <a id="listBulkOperationsQuery" href="#listBulkOperationsQuery">func listBulkOperationsQuery(opts *ListBulkOperationsOpts) *sqlf.Query</a>

```
searchKey: store.listBulkOperationsQuery
tags: [private]
```

```Go
func listBulkOperationsQuery(opts *ListBulkOperationsOpts) *sqlf.Query
```

### <a id="countBulkOperationsQuery" href="#countBulkOperationsQuery">func countBulkOperationsQuery(opts *CountBulkOperationsOpts) *sqlf.Query</a>

```
searchKey: store.countBulkOperationsQuery
tags: [private]
```

```Go
func countBulkOperationsQuery(opts *CountBulkOperationsOpts) *sqlf.Query
```

### <a id="listBulkOperationErrorsQuery" href="#listBulkOperationErrorsQuery">func listBulkOperationErrorsQuery(opts *ListBulkOperationErrorsOpts) *sqlf.Query</a>

```
searchKey: store.listBulkOperationErrorsQuery
tags: [private]
```

```Go
func listBulkOperationErrorsQuery(opts *ListBulkOperationErrorsOpts) *sqlf.Query
```

### <a id="scanBulkOperation" href="#scanBulkOperation">func scanBulkOperation(b *btypes.BulkOperation, s scanner) error</a>

```
searchKey: store.scanBulkOperation
tags: [private]
```

```Go
func scanBulkOperation(b *btypes.BulkOperation, s scanner) error
```

### <a id="scanBulkOperationError" href="#scanBulkOperationError">func scanBulkOperationError(b *btypes.BulkOperationError, s scanner) error</a>

```
searchKey: store.scanBulkOperationError
tags: [private]
```

```Go
func scanBulkOperationError(b *btypes.BulkOperationError, s scanner) error
```

### <a id="getChangesetEventQuery" href="#getChangesetEventQuery">func getChangesetEventQuery(opts *GetChangesetEventOpts) *sqlf.Query</a>

```
searchKey: store.getChangesetEventQuery
tags: [private]
```

```Go
func getChangesetEventQuery(opts *GetChangesetEventOpts) *sqlf.Query
```

### <a id="listChangesetEventsQuery" href="#listChangesetEventsQuery">func listChangesetEventsQuery(opts *ListChangesetEventsOpts) *sqlf.Query</a>

```
searchKey: store.listChangesetEventsQuery
tags: [private]
```

```Go
func listChangesetEventsQuery(opts *ListChangesetEventsOpts) *sqlf.Query
```

### <a id="countChangesetEventsQuery" href="#countChangesetEventsQuery">func countChangesetEventsQuery(opts *CountChangesetEventsOpts) *sqlf.Query</a>

```
searchKey: store.countChangesetEventsQuery
tags: [private]
```

```Go
func countChangesetEventsQuery(opts *CountChangesetEventsOpts) *sqlf.Query
```

### <a id="batchChangesetEventsQuery" href="#batchChangesetEventsQuery">func batchChangesetEventsQuery(fmtstr string, es []*btypes.ChangesetEvent) (*sqlf.Query, error)</a>

```
searchKey: store.batchChangesetEventsQuery
tags: [private]
```

```Go
func batchChangesetEventsQuery(fmtstr string, es []*btypes.ChangesetEvent) (*sqlf.Query, error)
```

### <a id="scanChangesetEvent" href="#scanChangesetEvent">func scanChangesetEvent(e *btypes.ChangesetEvent, s scanner) error</a>

```
searchKey: store.scanChangesetEvent
tags: [private]
```

```Go
func scanChangesetEvent(e *btypes.ChangesetEvent, s scanner) error
```

### <a id="getChangesetJobQuery" href="#getChangesetJobQuery">func getChangesetJobQuery(opts *GetChangesetJobOpts) *sqlf.Query</a>

```
searchKey: store.getChangesetJobQuery
tags: [private]
```

```Go
func getChangesetJobQuery(opts *GetChangesetJobOpts) *sqlf.Query
```

### <a id="scanChangesetJob" href="#scanChangesetJob">func scanChangesetJob(c *btypes.ChangesetJob, s scanner) error</a>

```
searchKey: store.scanChangesetJob
tags: [private]
```

```Go
func scanChangesetJob(c *btypes.ChangesetJob, s scanner) error
```

### <a id="ScanFirstChangesetJob" href="#ScanFirstChangesetJob">func ScanFirstChangesetJob(rows *sql.Rows, err error) (*btypes.ChangesetJob, bool, error)</a>

```
searchKey: store.ScanFirstChangesetJob
```

```Go
func ScanFirstChangesetJob(rows *sql.Rows, err error) (*btypes.ChangesetJob, bool, error)
```

### <a id="scanChangesetJobs" href="#scanChangesetJobs">func scanChangesetJobs(rows *sql.Rows, queryErr error) ([]*btypes.ChangesetJob, error)</a>

```
searchKey: store.scanChangesetJobs
tags: [private]
```

```Go
func scanChangesetJobs(rows *sql.Rows, queryErr error) ([]*btypes.ChangesetJob, error)
```

### <a id="countChangesetSpecsQuery" href="#countChangesetSpecsQuery">func countChangesetSpecsQuery(opts *CountChangesetSpecsOpts) *sqlf.Query</a>

```
searchKey: store.countChangesetSpecsQuery
tags: [private]
```

```Go
func countChangesetSpecsQuery(opts *CountChangesetSpecsOpts) *sqlf.Query
```

### <a id="getChangesetSpecQuery" href="#getChangesetSpecQuery">func getChangesetSpecQuery(opts *GetChangesetSpecOpts) *sqlf.Query</a>

```
searchKey: store.getChangesetSpecQuery
tags: [private]
```

```Go
func getChangesetSpecQuery(opts *GetChangesetSpecOpts) *sqlf.Query
```

### <a id="listChangesetSpecsQuery" href="#listChangesetSpecsQuery">func listChangesetSpecsQuery(opts *ListChangesetSpecsOpts) *sqlf.Query</a>

```
searchKey: store.listChangesetSpecsQuery
tags: [private]
```

```Go
func listChangesetSpecsQuery(opts *ListChangesetSpecsOpts) *sqlf.Query
```

### <a id="scanChangesetSpec" href="#scanChangesetSpec">func scanChangesetSpec(c *btypes.ChangesetSpec, s scanner) error</a>

```
searchKey: store.scanChangesetSpec
tags: [private]
```

```Go
func scanChangesetSpec(c *btypes.ChangesetSpec, s scanner) error
```

### <a id="getRewirerMappingsQuery" href="#getRewirerMappingsQuery">func getRewirerMappingsQuery(opts GetRewirerMappingsOpts) (*sqlf.Query, error)</a>

```
searchKey: store.getRewirerMappingsQuery
tags: [private]
```

```Go
func getRewirerMappingsQuery(opts GetRewirerMappingsOpts) (*sqlf.Query, error)
```

### <a id="getRewirerMappingCurrentState" href="#getRewirerMappingCurrentState">func getRewirerMappingCurrentState(state *btypes.ChangesetState) (*sqlf.Query, error)</a>

```
searchKey: store.getRewirerMappingCurrentState
tags: [private]
```

```Go
func getRewirerMappingCurrentState(state *btypes.ChangesetState) (*sqlf.Query, error)
```

### <a id="getRewirerMappingTextSearch" href="#getRewirerMappingTextSearch">func getRewirerMappingTextSearch(terms []search.TextSearchTerm) (detachTextSearch, viewTextSearch *sqlf.Query)</a>

```
searchKey: store.getRewirerMappingTextSearch
tags: [private]
```

```Go
func getRewirerMappingTextSearch(terms []search.TextSearchTerm) (detachTextSearch, viewTextSearch *sqlf.Query)
```

### <a id="countChangesetsQuery" href="#countChangesetsQuery">func countChangesetsQuery(opts *CountChangesetsOpts, authzConds *sqlf.Query) *sqlf.Query</a>

```
searchKey: store.countChangesetsQuery
tags: [private]
```

```Go
func countChangesetsQuery(opts *CountChangesetsOpts, authzConds *sqlf.Query) *sqlf.Query
```

### <a id="getChangesetQuery" href="#getChangesetQuery">func getChangesetQuery(opts *GetChangesetOpts) *sqlf.Query</a>

```
searchKey: store.getChangesetQuery
tags: [private]
```

```Go
func getChangesetQuery(opts *GetChangesetOpts) *sqlf.Query
```

### <a id="scanChangesetSyncData" href="#scanChangesetSyncData">func scanChangesetSyncData(h *btypes.ChangesetSyncData, s scanner) error</a>

```
searchKey: store.scanChangesetSyncData
tags: [private]
```

```Go
func scanChangesetSyncData(h *btypes.ChangesetSyncData, s scanner) error
```

### <a id="listChangesetSyncDataQuery" href="#listChangesetSyncDataQuery">func listChangesetSyncDataQuery(opts ListChangesetSyncDataOpts) *sqlf.Query</a>

```
searchKey: store.listChangesetSyncDataQuery
tags: [private]
```

```Go
func listChangesetSyncDataQuery(opts ListChangesetSyncDataOpts) *sqlf.Query
```

### <a id="listChangesetsQuery" href="#listChangesetsQuery">func listChangesetsQuery(opts *ListChangesetsOpts, authzConds *sqlf.Query) *sqlf.Query</a>

```
searchKey: store.listChangesetsQuery
tags: [private]
```

```Go
func listChangesetsQuery(opts *ListChangesetsOpts, authzConds *sqlf.Query) *sqlf.Query
```

### <a id="ScanFirstChangeset" href="#ScanFirstChangeset">func ScanFirstChangeset(rows *sql.Rows, err error) (*btypes.Changeset, bool, error)</a>

```
searchKey: store.ScanFirstChangeset
```

```Go
func ScanFirstChangeset(rows *sql.Rows, err error) (*btypes.Changeset, bool, error)
```

### <a id="scanChangesets" href="#scanChangesets">func scanChangesets(rows *sql.Rows, queryErr error) ([]*btypes.Changeset, error)</a>

```
searchKey: store.scanChangesets
tags: [private]
```

```Go
func scanChangesets(rows *sql.Rows, queryErr error) ([]*btypes.Changeset, error)
```

### <a id="scanChangeset" href="#scanChangeset">func scanChangeset(t *btypes.Changeset, s scanner) error</a>

```
searchKey: store.scanChangeset
tags: [private]
```

```Go
func scanChangeset(t *btypes.Changeset, s scanner) error
```

### <a id="archivedInBatchChange" href="#archivedInBatchChange">func archivedInBatchChange(batchChangeID string) *sqlf.Query</a>

```
searchKey: store.archivedInBatchChange
tags: [private]
```

```Go
func archivedInBatchChange(batchChangeID string) *sqlf.Query
```

### <a id="getChangesetsStatsQuery" href="#getChangesetsStatsQuery">func getChangesetsStatsQuery(batchChangeID int64) *sqlf.Query</a>

```
searchKey: store.getChangesetsStatsQuery
tags: [private]
```

```Go
func getChangesetsStatsQuery(batchChangeID int64) *sqlf.Query
```

### <a id="listCodeHostsQuery" href="#listCodeHostsQuery">func listCodeHostsQuery(opts ListCodeHostsOpts) *sqlf.Query</a>

```
searchKey: store.listCodeHostsQuery
tags: [private]
```

```Go
func listCodeHostsQuery(opts ListCodeHostsOpts) *sqlf.Query
```

### <a id="scanCodeHost" href="#scanCodeHost">func scanCodeHost(c *btypes.CodeHost, sc scanner) error</a>

```
searchKey: store.scanCodeHost
tags: [private]
```

```Go
func scanCodeHost(c *btypes.CodeHost, sc scanner) error
```

### <a id="getExternalServiceIDsQuery" href="#getExternalServiceIDsQuery">func getExternalServiceIDsQuery(opts GetExternalServiceIDsOpts) *sqlf.Query</a>

```
searchKey: store.getExternalServiceIDsQuery
tags: [private]
```

```Go
func getExternalServiceIDsQuery(opts GetExternalServiceIDsOpts) *sqlf.Query
```

### <a id="createSiteCredentialQuery" href="#createSiteCredentialQuery">func createSiteCredentialQuery(c *btypes.SiteCredential) *sqlf.Query</a>

```
searchKey: store.createSiteCredentialQuery
tags: [private]
```

```Go
func createSiteCredentialQuery(c *btypes.SiteCredential) *sqlf.Query
```

### <a id="deleteSiteCredentialQuery" href="#deleteSiteCredentialQuery">func deleteSiteCredentialQuery(id int64) *sqlf.Query</a>

```
searchKey: store.deleteSiteCredentialQuery
tags: [private]
```

```Go
func deleteSiteCredentialQuery(id int64) *sqlf.Query
```

### <a id="getSiteCredentialQuery" href="#getSiteCredentialQuery">func getSiteCredentialQuery(opts GetSiteCredentialOpts) *sqlf.Query</a>

```
searchKey: store.getSiteCredentialQuery
tags: [private]
```

```Go
func getSiteCredentialQuery(opts GetSiteCredentialOpts) *sqlf.Query
```

### <a id="listSiteCredentialsQuery" href="#listSiteCredentialsQuery">func listSiteCredentialsQuery(opts ListSiteCredentialsOpts) *sqlf.Query</a>

```
searchKey: store.listSiteCredentialsQuery
tags: [private]
```

```Go
func listSiteCredentialsQuery(opts ListSiteCredentialsOpts) *sqlf.Query
```

### <a id="scanSiteCredential" href="#scanSiteCredential">func scanSiteCredential(c *btypes.SiteCredential, sc scanner) error</a>

```
searchKey: store.scanSiteCredential
tags: [private]
```

```Go
func scanSiteCredential(c *btypes.SiteCredential, sc scanner) error
```

### <a id="RandomID" href="#RandomID">func RandomID() (string, error)</a>

```
searchKey: store.RandomID
```

```Go
func RandomID() (string, error)
```

RandomID generates a random ID to be used for identifiers in the database. 

### <a id="scanAll" href="#scanAll">func scanAll(rows *sql.Rows, scan scanFunc) (err error)</a>

```
searchKey: store.scanAll
tags: [private]
```

```Go
func scanAll(rows *sql.Rows, scan scanFunc) (err error)
```

### <a id="jsonbColumn" href="#jsonbColumn">func jsonbColumn(metadata interface{}) (msg json.RawMessage, err error)</a>

```
searchKey: store.jsonbColumn
tags: [private]
```

```Go
func jsonbColumn(metadata interface{}) (msg json.RawMessage, err error)
```

### <a id="nullInt32Column" href="#nullInt32Column">func nullInt32Column(n int32) *int32</a>

```
searchKey: store.nullInt32Column
tags: [private]
```

```Go
func nullInt32Column(n int32) *int32
```

### <a id="nullInt64Column" href="#nullInt64Column">func nullInt64Column(n int64) *int64</a>

```
searchKey: store.nullInt64Column
tags: [private]
```

```Go
func nullInt64Column(n int64) *int64
```

### <a id="nullTimeColumn" href="#nullTimeColumn">func nullTimeColumn(t time.Time) *time.Time</a>

```
searchKey: store.nullTimeColumn
tags: [private]
```

```Go
func nullTimeColumn(t time.Time) *time.Time
```

### <a id="nullStringColumn" href="#nullStringColumn">func nullStringColumn(s string) *string</a>

```
searchKey: store.nullStringColumn
tags: [private]
```

```Go
func nullStringColumn(s string) *string
```

### <a id="textSearchTermToClause" href="#textSearchTermToClause">func textSearchTermToClause(term search.TextSearchTerm, fields ...*sqlf.Query) *sqlf.Query</a>

```
searchKey: store.textSearchTermToClause
tags: [private]
```

```Go
func textSearchTermToClause(term search.TextSearchTerm, fields ...*sqlf.Query) *sqlf.Query
```

textSearchTermToClause generates a WHERE clause that can be used in a query to represent searching for the given term over the given fields. 

Note that there must be at least one field: failing to include any fields will likely result in broken queries! 

### <a id="testStoreBatchChanges" href="#testStoreBatchChanges">func testStoreBatchChanges(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreBatchChanges
tags: [private]
```

```Go
func testStoreBatchChanges(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testUserDeleteCascades" href="#testUserDeleteCascades">func testUserDeleteCascades(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testUserDeleteCascades
tags: [private]
```

```Go
func testUserDeleteCascades(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreBatchSpecs" href="#testStoreBatchSpecs">func testStoreBatchSpecs(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreBatchSpecs
tags: [private]
```

```Go
func testStoreBatchSpecs(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreBulkOperations" href="#testStoreBulkOperations">func testStoreBulkOperations(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreBulkOperations
tags: [private]
```

```Go
func testStoreBulkOperations(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreChangesetEvents" href="#testStoreChangesetEvents">func testStoreChangesetEvents(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreChangesetEvents
tags: [private]
```

```Go
func testStoreChangesetEvents(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreChangesetJobs" href="#testStoreChangesetJobs">func testStoreChangesetJobs(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreChangesetJobs
tags: [private]
```

```Go
func testStoreChangesetJobs(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreChangesetSpecs" href="#testStoreChangesetSpecs">func testStoreChangesetSpecs(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreChangesetSpecs
tags: [private]
```

```Go
func testStoreChangesetSpecs(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreChangesetSpecsCurrentState" href="#testStoreChangesetSpecsCurrentState">func testStoreChangesetSpecsCurrentState(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreChangesetSpecsCurrentState
tags: [private]
```

```Go
func testStoreChangesetSpecsCurrentState(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreChangesetSpecsCurrentStateAndTextSearch" href="#testStoreChangesetSpecsCurrentStateAndTextSearch">func testStoreChangesetSpecsCurrentStateAndTextSearch(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreChangesetSpecsCurrentStateAndTextSearch
tags: [private]
```

```Go
func testStoreChangesetSpecsCurrentStateAndTextSearch(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreChangesetSpecsTextSearch" href="#testStoreChangesetSpecsTextSearch">func testStoreChangesetSpecsTextSearch(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreChangesetSpecsTextSearch
tags: [private]
```

```Go
func testStoreChangesetSpecsTextSearch(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreChangesets" href="#testStoreChangesets">func testStoreChangesets(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreChangesets
tags: [private]
```

```Go
func testStoreChangesets(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreListChangesetSyncData" href="#testStoreListChangesetSyncData">func testStoreListChangesetSyncData(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreListChangesetSyncData
tags: [private]
```

```Go
func testStoreListChangesetSyncData(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreListChangesetsTextSearch" href="#testStoreListChangesetsTextSearch">func testStoreListChangesetsTextSearch(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreListChangesetsTextSearch
tags: [private]
```

```Go
func testStoreListChangesetsTextSearch(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="testStoreChangesetScheduling" href="#testStoreChangesetScheduling">func testStoreChangesetScheduling(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreChangesetScheduling
tags: [private]
```

```Go
func testStoreChangesetScheduling(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

testStoreChangesetScheduling provides tests for schedule-related methods on the Store. 

### <a id="testStoreCodeHost" href="#testStoreCodeHost">func testStoreCodeHost(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreCodeHost
tags: [private]
```

```Go
func testStoreCodeHost(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="TestIntegration" href="#TestIntegration">func TestIntegration(t *testing.T)</a>

```
searchKey: store.TestIntegration
tags: [private]
```

```Go
func TestIntegration(t *testing.T)
```

### <a id="testStoreSiteCredentials" href="#testStoreSiteCredentials">func testStoreSiteCredentials(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)</a>

```
searchKey: store.testStoreSiteCredentials
tags: [private]
```

```Go
func testStoreSiteCredentials(t *testing.T, ctx context.Context, s *Store, clock ct.Clock)
```

### <a id="storeTest" href="#storeTest">func storeTest(db *sql.DB, key encryption.Key, f storeTestFunc) func(*testing.T)</a>

```
searchKey: store.storeTest
tags: [private]
```

```Go
func storeTest(db *sql.DB, key encryption.Key, f storeTestFunc) func(*testing.T)
```

storeTest converts a storeTestFunc into a func(*testing.T) in which all dependencies are set up and injected into the storeTestFunc. 

### <a id="TestTextSearchTermToClause" href="#TestTextSearchTermToClause">func TestTextSearchTermToClause(t *testing.T)</a>

```
searchKey: store.TestTextSearchTermToClause
tags: [private]
```

```Go
func TestTextSearchTermToClause(t *testing.T)
```

