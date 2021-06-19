# Package resolvers

## Index

* Subpages
  * [enterprise/internal/batches/resolvers/apitest](resolvers/apitest.md)
* [Constants](#const)
    * [const batchChangeIDKind](#batchChangeIDKind)
    * [const batchSpecIDKind](#batchSpecIDKind)
    * [const bulkOperationIDKind](#bulkOperationIDKind)
    * [const changesetIDKind](#changesetIDKind)
    * [const changesetEventIDKind](#changesetEventIDKind)
    * [const changesetSpecIDKind](#changesetSpecIDKind)
    * [const batchChangesCredentialIDKind](#batchChangesCredentialIDKind)
    * [const siteCredentialPrefix](#siteCredentialPrefix)
    * [const userCredentialPrefix](#userCredentialPrefix)
    * [const maxUnlicensedChangesets](#maxUnlicensedChangesets)
    * [const defaultMaxFirstParam](#defaultMaxFirstParam)
    * [const queryBatchChangesConnection](#queryBatchChangesConnection)
    * [const listNamespacesBatchChanges](#listNamespacesBatchChanges)
    * [const queryBatchChange](#queryBatchChange)
    * [const queryBatchChangeByName](#queryBatchChangeByName)
    * [const queryBatchSpecNode](#queryBatchSpecNode)
    * [const queryBulkOperationConnection](#queryBulkOperationConnection)
    * [const queryBulkOperation](#queryBulkOperation)
    * [const queryChangesetApplyPreviewConnection](#queryChangesetApplyPreviewConnection)
    * [const queryChangesetApplyPreview](#queryChangesetApplyPreview)
    * [const queryChangesetConnection](#queryChangesetConnection)
    * [const queryChangesetCountsConnection](#queryChangesetCountsConnection)
    * [const queryChangesetEventConnection](#queryChangesetEventConnection)
    * [const queryChangesetSpecConnection](#queryChangesetSpecConnection)
    * [const queryChangesetSpecNode](#queryChangesetSpecNode)
    * [const queryChangeset](#queryChangeset)
    * [const queryUserCodeHostConnection](#queryUserCodeHostConnection)
    * [const queryCodeHostConnection](#queryCodeHostConnection)
    * [const testDiff](#testDiff)
    * [const queryBatchChangePermLevels](#queryBatchChangePermLevels)
    * [const queryChangesetPermLevels](#queryChangesetPermLevels)
    * [const queryBatchSpecPermLevels](#queryBatchSpecPermLevels)
    * [const queryChangesetSpecPermLevels](#queryChangesetSpecPermLevels)
    * [const mutationCreateBatchSpec](#mutationCreateBatchSpec)
    * [const mutationCreateChangesetSpec](#mutationCreateChangesetSpec)
    * [const mutationApplyBatchChange](#mutationApplyBatchChange)
    * [const mutationCreateBatchChange](#mutationCreateBatchChange)
    * [const mutationMoveBatchChange](#mutationMoveBatchChange)
    * [const mutationCreateCredential](#mutationCreateCredential)
    * [const mutationDeleteCredential](#mutationDeleteCredential)
    * [const mutationCreateChangesetComments](#mutationCreateChangesetComments)
    * [const mutationReenqueueChangesets](#mutationReenqueueChangesets)
    * [const mutationMergeChangesets](#mutationMergeChangesets)
* [Variables](#var)
    * [var update](#update)
    * [var testDiffGraphQL](#testDiffGraphQL)
* [Types](#type)
    * [type batchChangeResolver struct](#batchChangeResolver)
        * [func (r *batchChangeResolver) ActAsCampaign() bool](#batchChangeResolver.ActAsCampaign)
        * [func (r *batchChangeResolver) ID() graphql.ID](#batchChangeResolver.ID)
        * [func (r *batchChangeResolver) Name() string](#batchChangeResolver.Name)
        * [func (r *batchChangeResolver) Description() *string](#batchChangeResolver.Description)
        * [func (r *batchChangeResolver) InitialApplier(ctx context.Context) (*graphqlbackend.UserResolver, error)](#batchChangeResolver.InitialApplier)
        * [func (r *batchChangeResolver) LastApplier(ctx context.Context) (*graphqlbackend.UserResolver, error)](#batchChangeResolver.LastApplier)
        * [func (r *batchChangeResolver) LastAppliedAt() graphqlbackend.DateTime](#batchChangeResolver.LastAppliedAt)
        * [func (r *batchChangeResolver) SpecCreator(ctx context.Context) (*graphqlbackend.UserResolver, error)](#batchChangeResolver.SpecCreator)
        * [func (r *batchChangeResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#batchChangeResolver.ViewerCanAdminister)
        * [func (r *batchChangeResolver) URL(ctx context.Context) (string, error)](#batchChangeResolver.URL)
        * [func (r *batchChangeResolver) Namespace(ctx context.Context) (graphqlbackend.NamespaceResolver, error)](#batchChangeResolver.Namespace)
        * [func (r *batchChangeResolver) computeNamespace(ctx context.Context) (graphqlbackend.NamespaceResolver, error)](#batchChangeResolver.computeNamespace)
        * [func (r *batchChangeResolver) CreatedAt() graphqlbackend.DateTime](#batchChangeResolver.CreatedAt)
        * [func (r *batchChangeResolver) UpdatedAt() graphqlbackend.DateTime](#batchChangeResolver.UpdatedAt)
        * [func (r *batchChangeResolver) ClosedAt() *graphqlbackend.DateTime](#batchChangeResolver.ClosedAt)
        * [func (r *batchChangeResolver) ChangesetsStats(ctx context.Context) (graphqlbackend.ChangesetsStatsResolver, error)](#batchChangeResolver.ChangesetsStats)
        * [func (r *batchChangeResolver) Changesets(ctx context.Context,...](#batchChangeResolver.Changesets)
        * [func (r *batchChangeResolver) ChangesetCountsOverTime(ctx context.Context,...](#batchChangeResolver.ChangesetCountsOverTime)
        * [func (r *batchChangeResolver) DiffStat(ctx context.Context) (*graphqlbackend.DiffStat, error)](#batchChangeResolver.DiffStat)
        * [func (r *batchChangeResolver) CurrentSpec(ctx context.Context) (graphqlbackend.BatchSpecResolver, error)](#batchChangeResolver.CurrentSpec)
        * [func (r *batchChangeResolver) BulkOperations(ctx context.Context,...](#batchChangeResolver.BulkOperations)
    * [type batchChangesConnectionResolver struct](#batchChangesConnectionResolver)
        * [func (r *batchChangesConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.BatchChangeResolver, error)](#batchChangesConnectionResolver.Nodes)
        * [func (r *batchChangesConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#batchChangesConnectionResolver.TotalCount)
        * [func (r *batchChangesConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#batchChangesConnectionResolver.PageInfo)
        * [func (r *batchChangesConnectionResolver) compute(ctx context.Context) ([]*btypes.BatchChange, int64, error)](#batchChangesConnectionResolver.compute)
    * [type batchSpecResolver struct](#batchSpecResolver)
        * [func (r *batchSpecResolver) ActAsCampaignSpec() bool](#batchSpecResolver.ActAsCampaignSpec)
        * [func (r *batchSpecResolver) ID() graphql.ID](#batchSpecResolver.ID)
        * [func (r *batchSpecResolver) OriginalInput() (string, error)](#batchSpecResolver.OriginalInput)
        * [func (r *batchSpecResolver) ParsedInput() (graphqlbackend.JSONValue, error)](#batchSpecResolver.ParsedInput)
        * [func (r *batchSpecResolver) ChangesetSpecs(ctx context.Context, args *graphqlbackend.ChangesetSpecsConnectionArgs) (graphqlbackend.ChangesetSpecConnectionResolver, error)](#batchSpecResolver.ChangesetSpecs)
        * [func (r *batchSpecResolver) ApplyPreview(ctx context.Context, args *graphqlbackend.ChangesetApplyPreviewConnectionArgs) (graphqlbackend.ChangesetApplyPreviewConnectionResolver, error)](#batchSpecResolver.ApplyPreview)
        * [func (r *batchSpecResolver) Description() graphqlbackend.BatchChangeDescriptionResolver](#batchSpecResolver.Description)
        * [func (r *batchSpecResolver) Creator(ctx context.Context) (*graphqlbackend.UserResolver, error)](#batchSpecResolver.Creator)
        * [func (r *batchSpecResolver) Namespace(ctx context.Context) (*graphqlbackend.NamespaceResolver, error)](#batchSpecResolver.Namespace)
        * [func (r *batchSpecResolver) computeNamespace(ctx context.Context) (*graphqlbackend.NamespaceResolver, error)](#batchSpecResolver.computeNamespace)
        * [func (r *batchSpecResolver) ApplyURL(ctx context.Context) (string, error)](#batchSpecResolver.ApplyURL)
        * [func (r *batchSpecResolver) CreatedAt() graphqlbackend.DateTime](#batchSpecResolver.CreatedAt)
        * [func (r *batchSpecResolver) ExpiresAt() *graphqlbackend.DateTime](#batchSpecResolver.ExpiresAt)
        * [func (r *batchSpecResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#batchSpecResolver.ViewerCanAdminister)
        * [func (r *batchSpecResolver) DiffStat(ctx context.Context) (*graphqlbackend.DiffStat, error)](#batchSpecResolver.DiffStat)
        * [func (r *batchSpecResolver) AppliesToCampaign(ctx context.Context) (graphqlbackend.BatchChangeResolver, error)](#batchSpecResolver.AppliesToCampaign)
        * [func (r *batchSpecResolver) AppliesToBatchChange(ctx context.Context) (graphqlbackend.BatchChangeResolver, error)](#batchSpecResolver.AppliesToBatchChange)
        * [func (r *batchSpecResolver) SupersedingCampaignSpec(ctx context.Context) (graphqlbackend.BatchSpecResolver, error)](#batchSpecResolver.SupersedingCampaignSpec)
        * [func (r *batchSpecResolver) SupersedingBatchSpec(ctx context.Context) (graphqlbackend.BatchSpecResolver, error)](#batchSpecResolver.SupersedingBatchSpec)
        * [func (r *batchSpecResolver) ViewerBatchChangesCodeHosts(ctx context.Context, args *graphqlbackend.ListViewerBatchChangesCodeHostsArgs) (graphqlbackend.BatchChangesCodeHostConnectionResolver, error)](#batchSpecResolver.ViewerBatchChangesCodeHosts)
        * [func (r *batchSpecResolver) ViewerCampaignsCodeHosts(ctx context.Context, args *graphqlbackend.ListViewerCampaignsCodeHostsArgs) (graphqlbackend.CampaignsCodeHostConnectionResolver, error)](#batchSpecResolver.ViewerCampaignsCodeHosts)
    * [type batchChangeDescriptionResolver struct](#batchChangeDescriptionResolver)
        * [func (r *batchChangeDescriptionResolver) Name() string](#batchChangeDescriptionResolver.Name)
        * [func (r *batchChangeDescriptionResolver) Description() string](#batchChangeDescriptionResolver.Description)
    * [type bulkOperationResolver struct](#bulkOperationResolver)
        * [func (r *bulkOperationResolver) ID() graphql.ID](#bulkOperationResolver.ID)
        * [func (r *bulkOperationResolver) Type() (string, error)](#bulkOperationResolver.Type)
        * [func (r *bulkOperationResolver) State() string](#bulkOperationResolver.State)
        * [func (r *bulkOperationResolver) Progress() float64](#bulkOperationResolver.Progress)
        * [func (r *bulkOperationResolver) Errors(ctx context.Context) ([]graphqlbackend.ChangesetJobErrorResolver, error)](#bulkOperationResolver.Errors)
        * [func (r *bulkOperationResolver) Initiator(ctx context.Context) (*graphqlbackend.UserResolver, error)](#bulkOperationResolver.Initiator)
        * [func (r *bulkOperationResolver) ChangesetCount() int32](#bulkOperationResolver.ChangesetCount)
        * [func (r *bulkOperationResolver) CreatedAt() graphqlbackend.DateTime](#bulkOperationResolver.CreatedAt)
        * [func (r *bulkOperationResolver) FinishedAt() *graphqlbackend.DateTime](#bulkOperationResolver.FinishedAt)
    * [type bulkOperationConnectionResolver struct](#bulkOperationConnectionResolver)
        * [func (r *bulkOperationConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#bulkOperationConnectionResolver.TotalCount)
        * [func (r *bulkOperationConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#bulkOperationConnectionResolver.PageInfo)
        * [func (r *bulkOperationConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.BulkOperationResolver, error)](#bulkOperationConnectionResolver.Nodes)
        * [func (r *bulkOperationConnectionResolver) compute(ctx context.Context) ([]*btypes.BulkOperation, int64, error)](#bulkOperationConnectionResolver.compute)
    * [type changesetResolver struct](#changesetResolver)
        * [func NewChangesetResolverWithNextSync(store *store.Store, changeset *btypes.Changeset, repo *types.Repo, nextSyncAt time.Time) *changesetResolver](#NewChangesetResolverWithNextSync)
        * [func NewChangesetResolver(store *store.Store, changeset *btypes.Changeset, repo *types.Repo) *changesetResolver](#NewChangesetResolver)
        * [func (r *changesetResolver) ToExternalChangeset() (graphqlbackend.ExternalChangesetResolver, bool)](#changesetResolver.ToExternalChangeset)
        * [func (r *changesetResolver) ToHiddenExternalChangeset() (graphqlbackend.HiddenExternalChangesetResolver, bool)](#changesetResolver.ToHiddenExternalChangeset)
        * [func (r *changesetResolver) repoAccessible() bool](#changesetResolver.repoAccessible)
        * [func (r *changesetResolver) computeSpec(ctx context.Context) (*btypes.ChangesetSpec, error)](#changesetResolver.computeSpec)
        * [func (r *changesetResolver) computeNextSyncAt(ctx context.Context) (time.Time, error)](#changesetResolver.computeNextSyncAt)
        * [func (r *changesetResolver) ID() graphql.ID](#changesetResolver.ID)
        * [func (r *changesetResolver) ExternalID() *string](#changesetResolver.ExternalID)
        * [func (r *changesetResolver) Repository(ctx context.Context) *graphqlbackend.RepositoryResolver](#changesetResolver.Repository)
        * [func (r *changesetResolver) Campaigns(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)](#changesetResolver.Campaigns)
        * [func (r *changesetResolver) BatchChanges(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)](#changesetResolver.BatchChanges)
        * [func (r *changesetResolver) CreatedAt() graphqlbackend.DateTime](#changesetResolver.CreatedAt)
        * [func (r *changesetResolver) UpdatedAt() graphqlbackend.DateTime](#changesetResolver.UpdatedAt)
        * [func (r *changesetResolver) NextSyncAt(ctx context.Context) (*graphqlbackend.DateTime, error)](#changesetResolver.NextSyncAt)
        * [func (r *changesetResolver) Title(ctx context.Context) (*string, error)](#changesetResolver.Title)
        * [func (r *changesetResolver) Author() (*graphqlbackend.PersonResolver, error)](#changesetResolver.Author)
        * [func (r *changesetResolver) Body(ctx context.Context) (*string, error)](#changesetResolver.Body)
        * [func (r *changesetResolver) getBranchSpecDescription(ctx context.Context) (*btypes.ChangesetSpecDescription, error)](#changesetResolver.getBranchSpecDescription)
        * [func (r *changesetResolver) PublicationState() string](#changesetResolver.PublicationState)
        * [func (r *changesetResolver) ReconcilerState() string](#changesetResolver.ReconcilerState)
        * [func (r *changesetResolver) ExternalState() *string](#changesetResolver.ExternalState)
        * [func (r *changesetResolver) State() (string, error)](#changesetResolver.State)
        * [func (r *changesetResolver) ExternalURL() (*externallink.Resolver, error)](#changesetResolver.ExternalURL)
        * [func (r *changesetResolver) ReviewState(ctx context.Context) *string](#changesetResolver.ReviewState)
        * [func (r *changesetResolver) CheckState() *string](#changesetResolver.CheckState)
        * [func (r *changesetResolver) Error() *string](#changesetResolver.Error)
        * [func (r *changesetResolver) SyncerError() *string](#changesetResolver.SyncerError)
        * [func (r *changesetResolver) ScheduleEstimateAt(ctx context.Context) (*graphqlbackend.DateTime, error)](#changesetResolver.ScheduleEstimateAt)
        * [func (r *changesetResolver) CurrentSpec(ctx context.Context) (graphqlbackend.VisibleChangesetSpecResolver, error)](#changesetResolver.CurrentSpec)
        * [func (r *changesetResolver) Labels(ctx context.Context) ([]graphqlbackend.ChangesetLabelResolver, error)](#changesetResolver.Labels)
        * [func (r *changesetResolver) Events(ctx context.Context, args *graphqlbackend.ChangesetEventsConnectionArgs) (graphqlbackend.ChangesetEventsConnectionResolver, error)](#changesetResolver.Events)
        * [func (r *changesetResolver) Diff(ctx context.Context) (graphqlbackend.RepositoryComparisonInterface, error)](#changesetResolver.Diff)
        * [func (r *changesetResolver) DiffStat(ctx context.Context) (*graphqlbackend.DiffStat, error)](#changesetResolver.DiffStat)
    * [type changesetLabelResolver struct](#changesetLabelResolver)
        * [func (r *changesetLabelResolver) Text() string](#changesetLabelResolver.Text)
        * [func (r *changesetLabelResolver) Color() string](#changesetLabelResolver.Color)
        * [func (r *changesetLabelResolver) Description() *string](#changesetLabelResolver.Description)
    * [type changesetApplyPreviewResolver struct](#changesetApplyPreviewResolver)
        * [func (r *changesetApplyPreviewResolver) repoAccessible() bool](#changesetApplyPreviewResolver.repoAccessible)
        * [func (r *changesetApplyPreviewResolver) ToVisibleChangesetApplyPreview() (graphqlbackend.VisibleChangesetApplyPreviewResolver, bool)](#changesetApplyPreviewResolver.ToVisibleChangesetApplyPreview)
        * [func (r *changesetApplyPreviewResolver) ToHiddenChangesetApplyPreview() (graphqlbackend.HiddenChangesetApplyPreviewResolver, bool)](#changesetApplyPreviewResolver.ToHiddenChangesetApplyPreview)
    * [type hiddenChangesetApplyPreviewResolver struct](#hiddenChangesetApplyPreviewResolver)
        * [func (r *hiddenChangesetApplyPreviewResolver) Operations(ctx context.Context) ([]string, error)](#hiddenChangesetApplyPreviewResolver.Operations)
        * [func (r *hiddenChangesetApplyPreviewResolver) Delta(ctx context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)](#hiddenChangesetApplyPreviewResolver.Delta)
        * [func (r *hiddenChangesetApplyPreviewResolver) Targets() graphqlbackend.HiddenApplyPreviewTargetsResolver](#hiddenChangesetApplyPreviewResolver.Targets)
    * [type hiddenApplyPreviewTargetsResolver struct](#hiddenApplyPreviewTargetsResolver)
        * [func (r *hiddenApplyPreviewTargetsResolver) ToHiddenApplyPreviewTargetsAttach() (graphqlbackend.HiddenApplyPreviewTargetsAttachResolver, bool)](#hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsAttach)
        * [func (r *hiddenApplyPreviewTargetsResolver) ToHiddenApplyPreviewTargetsUpdate() (graphqlbackend.HiddenApplyPreviewTargetsUpdateResolver, bool)](#hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsUpdate)
        * [func (r *hiddenApplyPreviewTargetsResolver) ToHiddenApplyPreviewTargetsDetach() (graphqlbackend.HiddenApplyPreviewTargetsDetachResolver, bool)](#hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsDetach)
        * [func (r *hiddenApplyPreviewTargetsResolver) ChangesetSpec(ctx context.Context) (graphqlbackend.HiddenChangesetSpecResolver, error)](#hiddenApplyPreviewTargetsResolver.ChangesetSpec)
        * [func (r *hiddenApplyPreviewTargetsResolver) Changeset(ctx context.Context) (graphqlbackend.HiddenExternalChangesetResolver, error)](#hiddenApplyPreviewTargetsResolver.Changeset)
    * [type visibleChangesetApplyPreviewResolver struct](#visibleChangesetApplyPreviewResolver)
        * [func (r *visibleChangesetApplyPreviewResolver) Operations(ctx context.Context) ([]string, error)](#visibleChangesetApplyPreviewResolver.Operations)
        * [func (r *visibleChangesetApplyPreviewResolver) Delta(ctx context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)](#visibleChangesetApplyPreviewResolver.Delta)
        * [func (r *visibleChangesetApplyPreviewResolver) Targets() graphqlbackend.VisibleApplyPreviewTargetsResolver](#visibleChangesetApplyPreviewResolver.Targets)
        * [func (r *visibleChangesetApplyPreviewResolver) computePlan(ctx context.Context) (*reconciler.Plan, error)](#visibleChangesetApplyPreviewResolver.computePlan)
        * [func (r *visibleChangesetApplyPreviewResolver) computeBatchChange(ctx context.Context) (*btypes.BatchChange, error)](#visibleChangesetApplyPreviewResolver.computeBatchChange)
    * [type visibleApplyPreviewTargetsResolver struct](#visibleApplyPreviewTargetsResolver)
        * [func (r *visibleApplyPreviewTargetsResolver) ToVisibleApplyPreviewTargetsAttach() (graphqlbackend.VisibleApplyPreviewTargetsAttachResolver, bool)](#visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsAttach)
        * [func (r *visibleApplyPreviewTargetsResolver) ToVisibleApplyPreviewTargetsUpdate() (graphqlbackend.VisibleApplyPreviewTargetsUpdateResolver, bool)](#visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsUpdate)
        * [func (r *visibleApplyPreviewTargetsResolver) ToVisibleApplyPreviewTargetsDetach() (graphqlbackend.VisibleApplyPreviewTargetsDetachResolver, bool)](#visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsDetach)
        * [func (r *visibleApplyPreviewTargetsResolver) ChangesetSpec(ctx context.Context) (graphqlbackend.VisibleChangesetSpecResolver, error)](#visibleApplyPreviewTargetsResolver.ChangesetSpec)
        * [func (r *visibleApplyPreviewTargetsResolver) Changeset(ctx context.Context) (graphqlbackend.ExternalChangesetResolver, error)](#visibleApplyPreviewTargetsResolver.Changeset)
    * [type changesetSpecDeltaResolver struct](#changesetSpecDeltaResolver)
        * [func (c *changesetSpecDeltaResolver) TitleChanged() bool](#changesetSpecDeltaResolver.TitleChanged)
        * [func (c *changesetSpecDeltaResolver) BodyChanged() bool](#changesetSpecDeltaResolver.BodyChanged)
        * [func (c *changesetSpecDeltaResolver) Undraft() bool](#changesetSpecDeltaResolver.Undraft)
        * [func (c *changesetSpecDeltaResolver) BaseRefChanged() bool](#changesetSpecDeltaResolver.BaseRefChanged)
        * [func (c *changesetSpecDeltaResolver) DiffChanged() bool](#changesetSpecDeltaResolver.DiffChanged)
        * [func (c *changesetSpecDeltaResolver) CommitMessageChanged() bool](#changesetSpecDeltaResolver.CommitMessageChanged)
        * [func (c *changesetSpecDeltaResolver) AuthorNameChanged() bool](#changesetSpecDeltaResolver.AuthorNameChanged)
        * [func (c *changesetSpecDeltaResolver) AuthorEmailChanged() bool](#changesetSpecDeltaResolver.AuthorEmailChanged)
    * [type changesetApplyPreviewConnectionResolver struct](#changesetApplyPreviewConnectionResolver)
        * [func (r *changesetApplyPreviewConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#changesetApplyPreviewConnectionResolver.TotalCount)
        * [func (r *changesetApplyPreviewConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#changesetApplyPreviewConnectionResolver.PageInfo)
        * [func (r *changesetApplyPreviewConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetApplyPreviewResolver, error)](#changesetApplyPreviewConnectionResolver.Nodes)
        * [func (r *changesetApplyPreviewConnectionResolver) Stats(ctx context.Context) (graphqlbackend.ChangesetApplyPreviewConnectionStatsResolver, error)](#changesetApplyPreviewConnectionResolver.Stats)
        * [func (r *changesetApplyPreviewConnectionResolver) compute(ctx context.Context) (*rewirerMappingsFacade, error)](#changesetApplyPreviewConnectionResolver.compute)
    * [type changesetApplyPreviewConnectionStatsResolver struct](#changesetApplyPreviewConnectionStatsResolver)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Push() int32](#changesetApplyPreviewConnectionStatsResolver.Push)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Update() int32](#changesetApplyPreviewConnectionStatsResolver.Update)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Undraft() int32](#changesetApplyPreviewConnectionStatsResolver.Undraft)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Publish() int32](#changesetApplyPreviewConnectionStatsResolver.Publish)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) PublishDraft() int32](#changesetApplyPreviewConnectionStatsResolver.PublishDraft)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Sync() int32](#changesetApplyPreviewConnectionStatsResolver.Sync)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Import() int32](#changesetApplyPreviewConnectionStatsResolver.Import)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Close() int32](#changesetApplyPreviewConnectionStatsResolver.Close)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Reopen() int32](#changesetApplyPreviewConnectionStatsResolver.Reopen)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Sleep() int32](#changesetApplyPreviewConnectionStatsResolver.Sleep)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Detach() int32](#changesetApplyPreviewConnectionStatsResolver.Detach)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Archive() int32](#changesetApplyPreviewConnectionStatsResolver.Archive)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Added() int32](#changesetApplyPreviewConnectionStatsResolver.Added)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Modified() int32](#changesetApplyPreviewConnectionStatsResolver.Modified)
        * [func (r *changesetApplyPreviewConnectionStatsResolver) Removed() int32](#changesetApplyPreviewConnectionStatsResolver.Removed)
    * [type rewirerMappingsFacade struct](#rewirerMappingsFacade)
        * [func newRewirerMappingsFacade(s *store.Store, batchSpecID int64) *rewirerMappingsFacade](#newRewirerMappingsFacade)
        * [func (rmf *rewirerMappingsFacade) compute(ctx context.Context, opts store.GetRewirerMappingsOpts) error](#rewirerMappingsFacade.compute)
        * [func (rmf *rewirerMappingsFacade) Page(ctx context.Context, opts rewirerMappingPageOpts) (*rewirerMappingPage, error)](#rewirerMappingsFacade.Page)
        * [func (rmf *rewirerMappingsFacade) Resolver(mapping *btypes.RewirerMapping) graphqlbackend.ChangesetApplyPreviewResolver](#rewirerMappingsFacade.Resolver)
        * [func (rmf *rewirerMappingsFacade) ResolverWithNextSync(mapping *btypes.RewirerMapping, nextSync time.Time) graphqlbackend.ChangesetApplyPreviewResolver](#rewirerMappingsFacade.ResolverWithNextSync)
    * [type rewirerMappingPageOpts struct](#rewirerMappingPageOpts)
    * [type rewirerMappingPage struct](#rewirerMappingPage)
    * [type changesetsConnectionResolver struct](#changesetsConnectionResolver)
        * [func (r *changesetsConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetResolver, error)](#changesetsConnectionResolver.Nodes)
        * [func (r *changesetsConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#changesetsConnectionResolver.TotalCount)
        * [func (r *changesetsConnectionResolver) compute(ctx context.Context) (cs btypes.Changesets, next int64, err error)](#changesetsConnectionResolver.compute)
        * [func (r *changesetsConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#changesetsConnectionResolver.PageInfo)
    * [type changesetCountsResolver struct](#changesetCountsResolver)
        * [func (r *changesetCountsResolver) Date() graphqlbackend.DateTime](#changesetCountsResolver.Date)
        * [func (r *changesetCountsResolver) Total() int32](#changesetCountsResolver.Total)
        * [func (r *changesetCountsResolver) Merged() int32](#changesetCountsResolver.Merged)
        * [func (r *changesetCountsResolver) Closed() int32](#changesetCountsResolver.Closed)
        * [func (r *changesetCountsResolver) Draft() int32](#changesetCountsResolver.Draft)
        * [func (r *changesetCountsResolver) Open() int32](#changesetCountsResolver.Open)
        * [func (r *changesetCountsResolver) OpenApproved() int32](#changesetCountsResolver.OpenApproved)
        * [func (r *changesetCountsResolver) OpenChangesRequested() int32](#changesetCountsResolver.OpenChangesRequested)
        * [func (r *changesetCountsResolver) OpenPending() int32](#changesetCountsResolver.OpenPending)
    * [type changesetEventResolver struct](#changesetEventResolver)
        * [func (r *changesetEventResolver) ID() graphql.ID](#changesetEventResolver.ID)
        * [func (r *changesetEventResolver) CreatedAt() graphqlbackend.DateTime](#changesetEventResolver.CreatedAt)
        * [func (r *changesetEventResolver) Changeset() graphqlbackend.ExternalChangesetResolver](#changesetEventResolver.Changeset)
    * [type changesetEventsConnectionResolver struct](#changesetEventsConnectionResolver)
        * [func (r *changesetEventsConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetEventResolver, error)](#changesetEventsConnectionResolver.Nodes)
        * [func (r *changesetEventsConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#changesetEventsConnectionResolver.TotalCount)
        * [func (r *changesetEventsConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#changesetEventsConnectionResolver.PageInfo)
        * [func (r *changesetEventsConnectionResolver) compute(ctx context.Context) ([]*btypes.ChangesetEvent, int64, error)](#changesetEventsConnectionResolver.compute)
    * [type changesetJobErrorResolver struct](#changesetJobErrorResolver)
        * [func (r *changesetJobErrorResolver) Changeset() graphqlbackend.ChangesetResolver](#changesetJobErrorResolver.Changeset)
        * [func (r *changesetJobErrorResolver) Error() *string](#changesetJobErrorResolver.Error)
    * [type changesetSpecResolver struct](#changesetSpecResolver)
        * [func NewChangesetSpecResolver(ctx context.Context, store *store.Store, changesetSpec *btypes.ChangesetSpec) (*changesetSpecResolver, error)](#NewChangesetSpecResolver)
        * [func NewChangesetSpecResolverWithRepo(store *store.Store, repo *types.Repo, changesetSpec *btypes.ChangesetSpec) *changesetSpecResolver](#NewChangesetSpecResolverWithRepo)
        * [func (r *changesetSpecResolver) ID() graphql.ID](#changesetSpecResolver.ID)
        * [func (r *changesetSpecResolver) Type() string](#changesetSpecResolver.Type)
        * [func (r *changesetSpecResolver) Description(ctx context.Context) (graphqlbackend.ChangesetDescription, error)](#changesetSpecResolver.Description)
        * [func (r *changesetSpecResolver) ExpiresAt() *graphqlbackend.DateTime](#changesetSpecResolver.ExpiresAt)
        * [func (r *changesetSpecResolver) repoAccessible() bool](#changesetSpecResolver.repoAccessible)
        * [func (r *changesetSpecResolver) ToHiddenChangesetSpec() (graphqlbackend.HiddenChangesetSpecResolver, bool)](#changesetSpecResolver.ToHiddenChangesetSpec)
        * [func (r *changesetSpecResolver) ToVisibleChangesetSpec() (graphqlbackend.VisibleChangesetSpecResolver, bool)](#changesetSpecResolver.ToVisibleChangesetSpec)
    * [type changesetDescriptionResolver struct](#changesetDescriptionResolver)
        * [func (r *changesetDescriptionResolver) ToExistingChangesetReference() (graphqlbackend.ExistingChangesetReferenceResolver, bool)](#changesetDescriptionResolver.ToExistingChangesetReference)
        * [func (r *changesetDescriptionResolver) ToGitBranchChangesetDescription() (graphqlbackend.GitBranchChangesetDescriptionResolver, bool)](#changesetDescriptionResolver.ToGitBranchChangesetDescription)
        * [func (r *changesetDescriptionResolver) BaseRepository() *graphqlbackend.RepositoryResolver](#changesetDescriptionResolver.BaseRepository)
        * [func (r *changesetDescriptionResolver) ExternalID() string](#changesetDescriptionResolver.ExternalID)
        * [func (r *changesetDescriptionResolver) BaseRef() string](#changesetDescriptionResolver.BaseRef)
        * [func (r *changesetDescriptionResolver) BaseRev() string](#changesetDescriptionResolver.BaseRev)
        * [func (r *changesetDescriptionResolver) HeadRepository() *graphqlbackend.RepositoryResolver](#changesetDescriptionResolver.HeadRepository)
        * [func (r *changesetDescriptionResolver) HeadRef() string](#changesetDescriptionResolver.HeadRef)
        * [func (r *changesetDescriptionResolver) Title() string](#changesetDescriptionResolver.Title)
        * [func (r *changesetDescriptionResolver) Body() string](#changesetDescriptionResolver.Body)
        * [func (r *changesetDescriptionResolver) Published() batches.PublishedValue](#changesetDescriptionResolver.Published)
        * [func (r *changesetDescriptionResolver) DiffStat() *graphqlbackend.DiffStat](#changesetDescriptionResolver.DiffStat)
        * [func (r *changesetDescriptionResolver) Diff(ctx context.Context) (graphqlbackend.PreviewRepositoryComparisonResolver, error)](#changesetDescriptionResolver.Diff)
        * [func (r *changesetDescriptionResolver) Commits() []graphqlbackend.GitCommitDescriptionResolver](#changesetDescriptionResolver.Commits)
    * [type gitCommitDescriptionResolver struct](#gitCommitDescriptionResolver)
        * [func (r *gitCommitDescriptionResolver) Author() *graphqlbackend.PersonResolver](#gitCommitDescriptionResolver.Author)
        * [func (r *gitCommitDescriptionResolver) Message() string](#gitCommitDescriptionResolver.Message)
        * [func (r *gitCommitDescriptionResolver) Subject() string](#gitCommitDescriptionResolver.Subject)
        * [func (r *gitCommitDescriptionResolver) Body() *string](#gitCommitDescriptionResolver.Body)
        * [func (r *gitCommitDescriptionResolver) Diff() string](#gitCommitDescriptionResolver.Diff)
    * [type changesetSpecConnectionResolver struct](#changesetSpecConnectionResolver)
        * [func (r *changesetSpecConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#changesetSpecConnectionResolver.TotalCount)
        * [func (r *changesetSpecConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#changesetSpecConnectionResolver.PageInfo)
        * [func (r *changesetSpecConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetSpecResolver, error)](#changesetSpecConnectionResolver.Nodes)
        * [func (r *changesetSpecConnectionResolver) compute(ctx context.Context) (btypes.ChangesetSpecs, map[api.RepoID]*types.Repo, int64, error)](#changesetSpecConnectionResolver.compute)
    * [type changesetsStatsResolver struct](#changesetsStatsResolver)
        * [func (r *changesetsStatsResolver) Retrying() int32](#changesetsStatsResolver.Retrying)
        * [func (r *changesetsStatsResolver) Failed() int32](#changesetsStatsResolver.Failed)
        * [func (r *changesetsStatsResolver) Scheduled() int32](#changesetsStatsResolver.Scheduled)
        * [func (r *changesetsStatsResolver) Processing() int32](#changesetsStatsResolver.Processing)
        * [func (r *changesetsStatsResolver) Unpublished() int32](#changesetsStatsResolver.Unpublished)
        * [func (r *changesetsStatsResolver) Draft() int32](#changesetsStatsResolver.Draft)
        * [func (r *changesetsStatsResolver) Open() int32](#changesetsStatsResolver.Open)
        * [func (r *changesetsStatsResolver) Merged() int32](#changesetsStatsResolver.Merged)
        * [func (r *changesetsStatsResolver) Closed() int32](#changesetsStatsResolver.Closed)
        * [func (r *changesetsStatsResolver) Deleted() int32](#changesetsStatsResolver.Deleted)
        * [func (r *changesetsStatsResolver) Archived() int32](#changesetsStatsResolver.Archived)
        * [func (r *changesetsStatsResolver) Total() int32](#changesetsStatsResolver.Total)
    * [type batchChangesCodeHostResolver struct](#batchChangesCodeHostResolver)
        * [func (c *batchChangesCodeHostResolver) ExternalServiceKind() string](#batchChangesCodeHostResolver.ExternalServiceKind)
        * [func (c *batchChangesCodeHostResolver) ExternalServiceURL() string](#batchChangesCodeHostResolver.ExternalServiceURL)
        * [func (c *batchChangesCodeHostResolver) Credential() graphqlbackend.BatchChangesCredentialResolver](#batchChangesCodeHostResolver.Credential)
        * [func (c *batchChangesCodeHostResolver) RequiresSSH() bool](#batchChangesCodeHostResolver.RequiresSSH)
    * [type batchChangesCodeHostConnectionResolver struct](#batchChangesCodeHostConnectionResolver)
        * [func (c *batchChangesCodeHostConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#batchChangesCodeHostConnectionResolver.TotalCount)
        * [func (c *batchChangesCodeHostConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#batchChangesCodeHostConnectionResolver.PageInfo)
        * [func (c *batchChangesCodeHostConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.BatchChangesCodeHostResolver, error)](#batchChangesCodeHostConnectionResolver.Nodes)
        * [func (c *batchChangesCodeHostConnectionResolver) compute(ctx context.Context) (all, page []*btypes.CodeHost, credsByIDType map[idType]graphqlbackend.BatchChangesCredentialResolver, err error)](#batchChangesCodeHostConnectionResolver.compute)
    * [type idType struct](#idType)
    * [type batchChangesUserCredentialResolver struct](#batchChangesUserCredentialResolver)
        * [func (c *batchChangesUserCredentialResolver) ID() graphql.ID](#batchChangesUserCredentialResolver.ID)
        * [func (c *batchChangesUserCredentialResolver) ExternalServiceKind() string](#batchChangesUserCredentialResolver.ExternalServiceKind)
        * [func (c *batchChangesUserCredentialResolver) ExternalServiceURL() string](#batchChangesUserCredentialResolver.ExternalServiceURL)
        * [func (c *batchChangesUserCredentialResolver) SSHPublicKey(ctx context.Context) (*string, error)](#batchChangesUserCredentialResolver.SSHPublicKey)
        * [func (c *batchChangesUserCredentialResolver) CreatedAt() graphqlbackend.DateTime](#batchChangesUserCredentialResolver.CreatedAt)
        * [func (c *batchChangesUserCredentialResolver) IsSiteCredential() bool](#batchChangesUserCredentialResolver.IsSiteCredential)
    * [type batchChangesSiteCredentialResolver struct](#batchChangesSiteCredentialResolver)
        * [func (c *batchChangesSiteCredentialResolver) ID() graphql.ID](#batchChangesSiteCredentialResolver.ID)
        * [func (c *batchChangesSiteCredentialResolver) ExternalServiceKind() string](#batchChangesSiteCredentialResolver.ExternalServiceKind)
        * [func (c *batchChangesSiteCredentialResolver) ExternalServiceURL() string](#batchChangesSiteCredentialResolver.ExternalServiceURL)
        * [func (c *batchChangesSiteCredentialResolver) SSHPublicKey(ctx context.Context) (*string, error)](#batchChangesSiteCredentialResolver.SSHPublicKey)
        * [func (c *batchChangesSiteCredentialResolver) CreatedAt() graphqlbackend.DateTime](#batchChangesSiteCredentialResolver.CreatedAt)
        * [func (c *batchChangesSiteCredentialResolver) IsSiteCredential() bool](#batchChangesSiteCredentialResolver.IsSiteCredential)
    * [type campaignsCodeHostResolver struct](#campaignsCodeHostResolver)
        * [func (c *campaignsCodeHostResolver) ExternalServiceKind() string](#campaignsCodeHostResolver.ExternalServiceKind)
        * [func (c *campaignsCodeHostResolver) ExternalServiceURL() string](#campaignsCodeHostResolver.ExternalServiceURL)
        * [func (c *campaignsCodeHostResolver) Credential() graphqlbackend.CampaignsCredentialResolver](#campaignsCodeHostResolver.Credential)
        * [func (c *campaignsCodeHostResolver) RequiresSSH() bool](#campaignsCodeHostResolver.RequiresSSH)
    * [type campaignsCodeHostConnectionResolver struct](#campaignsCodeHostConnectionResolver)
        * [func (c *campaignsCodeHostConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#campaignsCodeHostConnectionResolver.TotalCount)
        * [func (c *campaignsCodeHostConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#campaignsCodeHostConnectionResolver.PageInfo)
        * [func (c *campaignsCodeHostConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.CampaignsCodeHostResolver, error)](#campaignsCodeHostConnectionResolver.Nodes)
    * [type ErrInvalidFirstParameter struct](#ErrInvalidFirstParameter)
        * [func (e ErrInvalidFirstParameter) Error() string](#ErrInvalidFirstParameter.Error)
        * [func (e ErrInvalidFirstParameter) Extensions() map[string]interface{}](#ErrInvalidFirstParameter.Extensions)
    * [type ErrIDIsZero struct{}](#ErrIDIsZero)
        * [func (e ErrIDIsZero) Error() string](#ErrIDIsZero.Error)
        * [func (e ErrIDIsZero) Extensions() map[string]interface{}](#ErrIDIsZero.Extensions)
    * [type ErrBatchChangesDisabled struct{}](#ErrBatchChangesDisabled)
        * [func (e ErrBatchChangesDisabled) Error() string](#ErrBatchChangesDisabled.Error)
        * [func (e ErrBatchChangesDisabled) Extensions() map[string]interface{}](#ErrBatchChangesDisabled.Extensions)
    * [type ErrBatchChangesDisabledForUser struct{}](#ErrBatchChangesDisabledForUser)
        * [func (e ErrBatchChangesDisabledForUser) Error() string](#ErrBatchChangesDisabledForUser.Error)
        * [func (e ErrBatchChangesDisabledForUser) Extensions() map[string]interface{}](#ErrBatchChangesDisabledForUser.Extensions)
    * [type ErrBatchChangesUnlicensed struct](#ErrBatchChangesUnlicensed)
        * [func (e ErrBatchChangesUnlicensed) Extensions() map[string]interface{}](#ErrBatchChangesUnlicensed.Extensions)
    * [type ErrBatchChangesDotcom struct{}](#ErrBatchChangesDotcom)
        * [func (e ErrBatchChangesDotcom) Error() string](#ErrBatchChangesDotcom.Error)
        * [func (e ErrBatchChangesDotcom) Extensions() map[string]interface{}](#ErrBatchChangesDotcom.Extensions)
    * [type ErrEnsureBatchChangeFailed struct{}](#ErrEnsureBatchChangeFailed)
        * [func (e ErrEnsureBatchChangeFailed) Error() string](#ErrEnsureBatchChangeFailed.Error)
        * [func (e ErrEnsureBatchChangeFailed) Extensions() map[string]interface{}](#ErrEnsureBatchChangeFailed.Extensions)
    * [type ErrApplyClosedBatchChange struct{}](#ErrApplyClosedBatchChange)
        * [func (e ErrApplyClosedBatchChange) Error() string](#ErrApplyClosedBatchChange.Error)
        * [func (e ErrApplyClosedBatchChange) Extensions() map[string]interface{}](#ErrApplyClosedBatchChange.Extensions)
    * [type ErrMatchingBatchChangeExists struct{}](#ErrMatchingBatchChangeExists)
        * [func (e ErrMatchingBatchChangeExists) Error() string](#ErrMatchingBatchChangeExists.Error)
        * [func (e ErrMatchingBatchChangeExists) Extensions() map[string]interface{}](#ErrMatchingBatchChangeExists.Extensions)
    * [type ErrDuplicateCredential struct{}](#ErrDuplicateCredential)
        * [func (e ErrDuplicateCredential) Error() string](#ErrDuplicateCredential.Error)
        * [func (e ErrDuplicateCredential) Extensions() map[string]interface{}](#ErrDuplicateCredential.Extensions)
    * [type ErrVerifyCredentialFailed struct](#ErrVerifyCredentialFailed)
        * [func (e ErrVerifyCredentialFailed) Error() string](#ErrVerifyCredentialFailed.Error)
        * [func (e ErrVerifyCredentialFailed) Extensions() map[string]interface{}](#ErrVerifyCredentialFailed.Extensions)
    * [type Resolver struct](#Resolver)
        * [func (r *Resolver) campaignByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchChangeResolver, error)](#Resolver.campaignByID)
        * [func (r *Resolver) Campaign(ctx context.Context, args *graphqlbackend.BatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)](#Resolver.Campaign)
        * [func (r *Resolver) campaignSpecByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchSpecResolver, error)](#Resolver.campaignSpecByID)
        * [func (r *Resolver) CreateCampaignSpec(ctx context.Context, args *graphqlbackend.CreateCampaignSpecArgs) (graphqlbackend.BatchSpecResolver, error)](#Resolver.CreateCampaignSpec)
        * [func (r *Resolver) MoveCampaign(ctx context.Context, args *graphqlbackend.MoveCampaignArgs) (graphqlbackend.BatchChangeResolver, error)](#Resolver.MoveCampaign)
        * [func (r *Resolver) DeleteCampaign(ctx context.Context, args *graphqlbackend.DeleteCampaignArgs) (_ *graphqlbackend.EmptyResponse, err error)](#Resolver.DeleteCampaign)
        * [func (r *Resolver) Campaigns(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)](#Resolver.Campaigns)
        * [func (r *Resolver) CampaignsCodeHosts(ctx context.Context, args *graphqlbackend.ListCampaignsCodeHostsArgs) (graphqlbackend.CampaignsCodeHostConnectionResolver, error)](#Resolver.CampaignsCodeHosts)
        * [func (r *Resolver) CreateCampaignsCredential(ctx context.Context, args *graphqlbackend.CreateCampaignsCredentialArgs) (_ graphqlbackend.CampaignsCredentialResolver, err error)](#Resolver.CreateCampaignsCredential)
        * [func (r *Resolver) DeleteCampaignsCredential(ctx context.Context, args *graphqlbackend.DeleteCampaignsCredentialArgs) (_ *graphqlbackend.EmptyResponse, err error)](#Resolver.DeleteCampaignsCredential)
        * [func (r *Resolver) campaignsCredentialByID(ctx context.Context, id graphql.ID) (graphqlbackend.CampaignsCredentialResolver, error)](#Resolver.campaignsCredentialByID)
        * [func (r *Resolver) CreateCampaign(ctx context.Context, args *graphqlbackend.CreateCampaignArgs) (graphqlbackend.BatchChangeResolver, error)](#Resolver.CreateCampaign)
        * [func (r *Resolver) ApplyCampaign(ctx context.Context, args *graphqlbackend.ApplyCampaignArgs) (graphqlbackend.BatchChangeResolver, error)](#Resolver.ApplyCampaign)
        * [func (r *Resolver) CloseCampaign(ctx context.Context, args *graphqlbackend.CloseCampaignArgs) (_ graphqlbackend.BatchChangeResolver, err error)](#Resolver.CloseCampaign)
        * [func (r *Resolver) NodeResolvers() map[string]graphqlbackend.NodeByIDFunc](#Resolver.NodeResolvers)
        * [func (r *Resolver) changesetByID(ctx context.Context, id graphql.ID) (graphqlbackend.ChangesetResolver, error)](#Resolver.changesetByID)
        * [func (r *Resolver) batchChangeByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchChangeResolver, error)](#Resolver.batchChangeByID)
        * [func (r *Resolver) BatchChange(ctx context.Context, args *graphqlbackend.BatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)](#Resolver.BatchChange)
        * [func (r *Resolver) batchSpecByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchSpecResolver, error)](#Resolver.batchSpecByID)
        * [func (r *Resolver) changesetSpecByID(ctx context.Context, id graphql.ID) (graphqlbackend.ChangesetSpecResolver, error)](#Resolver.changesetSpecByID)
        * [func (r *Resolver) batchChangesCredentialByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchChangesCredentialResolver, error)](#Resolver.batchChangesCredentialByID)
        * [func (r *Resolver) batchChangesUserCredentialByID(ctx context.Context, id int64) (graphqlbackend.BatchChangesCredentialResolver, error)](#Resolver.batchChangesUserCredentialByID)
        * [func (r *Resolver) batchChangesSiteCredentialByID(ctx context.Context, id int64) (graphqlbackend.BatchChangesCredentialResolver, error)](#Resolver.batchChangesSiteCredentialByID)
        * [func (r *Resolver) bulkOperationByID(ctx context.Context, id graphql.ID) (graphqlbackend.BulkOperationResolver, error)](#Resolver.bulkOperationByID)
        * [func (r *Resolver) bulkOperationByIDString(ctx context.Context, id string) (graphqlbackend.BulkOperationResolver, error)](#Resolver.bulkOperationByIDString)
        * [func (r *Resolver) CreateBatchChange(ctx context.Context, args *graphqlbackend.CreateBatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)](#Resolver.CreateBatchChange)
        * [func (r *Resolver) ApplyBatchChange(ctx context.Context, args *graphqlbackend.ApplyBatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)](#Resolver.ApplyBatchChange)
        * [func (r *Resolver) CreateBatchSpec(ctx context.Context, args *graphqlbackend.CreateBatchSpecArgs) (graphqlbackend.BatchSpecResolver, error)](#Resolver.CreateBatchSpec)
        * [func (r *Resolver) CreateChangesetSpec(ctx context.Context, args *graphqlbackend.CreateChangesetSpecArgs) (graphqlbackend.ChangesetSpecResolver, error)](#Resolver.CreateChangesetSpec)
        * [func (r *Resolver) MoveBatchChange(ctx context.Context, args *graphqlbackend.MoveBatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)](#Resolver.MoveBatchChange)
        * [func (r *Resolver) DeleteBatchChange(ctx context.Context, args *graphqlbackend.DeleteBatchChangeArgs) (_ *graphqlbackend.EmptyResponse, err error)](#Resolver.DeleteBatchChange)
        * [func (r *Resolver) BatchChanges(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)](#Resolver.BatchChanges)
        * [func (r *Resolver) BatchChangesCodeHosts(ctx context.Context, args *graphqlbackend.ListBatchChangesCodeHostsArgs) (graphqlbackend.BatchChangesCodeHostConnectionResolver, error)](#Resolver.BatchChangesCodeHosts)
        * [func (r *Resolver) CloseBatchChange(ctx context.Context, args *graphqlbackend.CloseBatchChangeArgs) (_ graphqlbackend.BatchChangeResolver, err error)](#Resolver.CloseBatchChange)
        * [func (r *Resolver) SyncChangeset(ctx context.Context, args *graphqlbackend.SyncChangesetArgs) (_ *graphqlbackend.EmptyResponse, err error)](#Resolver.SyncChangeset)
        * [func (r *Resolver) ReenqueueChangeset(ctx context.Context, args *graphqlbackend.ReenqueueChangesetArgs) (_ graphqlbackend.ChangesetResolver, err error)](#Resolver.ReenqueueChangeset)
        * [func (r *Resolver) CreateBatchChangesCredential(ctx context.Context, args *graphqlbackend.CreateBatchChangesCredentialArgs) (_ graphqlbackend.BatchChangesCredentialResolver, err error)](#Resolver.CreateBatchChangesCredential)
        * [func (r *Resolver) createBatchChangesUserCredential(ctx context.Context, externalServiceURL, externalServiceType string, userID int32, credential string) (graphqlbackend.BatchChangesCredentialResolver, error)](#Resolver.createBatchChangesUserCredential)
        * [func (r *Resolver) createBatchChangesSiteCredential(ctx context.Context, externalServiceURL, externalServiceType string, credential string) (graphqlbackend.BatchChangesCredentialResolver, error)](#Resolver.createBatchChangesSiteCredential)
        * [func (r *Resolver) generateAuthenticatorForCredential(ctx context.Context, externalServiceType, externalServiceURL, credential string) (auth.Authenticator, error)](#Resolver.generateAuthenticatorForCredential)
        * [func (r *Resolver) DeleteBatchChangesCredential(ctx context.Context, args *graphqlbackend.DeleteBatchChangesCredentialArgs) (_ *graphqlbackend.EmptyResponse, err error)](#Resolver.DeleteBatchChangesCredential)
        * [func (r *Resolver) deleteBatchChangesUserCredential(ctx context.Context, credentialDBID int64) (*graphqlbackend.EmptyResponse, error)](#Resolver.deleteBatchChangesUserCredential)
        * [func (r *Resolver) deleteBatchChangesSiteCredential(ctx context.Context, credentialDBID int64) (*graphqlbackend.EmptyResponse, error)](#Resolver.deleteBatchChangesSiteCredential)
        * [func (r *Resolver) DetachChangesets(ctx context.Context, args *graphqlbackend.DetachChangesetsArgs) (_ graphqlbackend.BulkOperationResolver, err error)](#Resolver.DetachChangesets)
        * [func (r *Resolver) CreateChangesetComments(ctx context.Context, args *graphqlbackend.CreateChangesetCommentsArgs) (_ graphqlbackend.BulkOperationResolver, err error)](#Resolver.CreateChangesetComments)
        * [func (r *Resolver) ReenqueueChangesets(ctx context.Context, args *graphqlbackend.ReenqueueChangesetsArgs) (_ graphqlbackend.BulkOperationResolver, err error)](#Resolver.ReenqueueChangesets)
        * [func (r *Resolver) MergeChangesets(ctx context.Context, args *graphqlbackend.MergeChangesetsArgs) (_ graphqlbackend.BulkOperationResolver, err error)](#Resolver.MergeChangesets)
    * [type batchSpecCreatedArg struct](#batchSpecCreatedArg)
    * [type batchChangeEventArg struct](#batchChangeEventArg)
    * [type mockChangesetApplyPreviewResolver struct](#mockChangesetApplyPreviewResolver)
        * [func (r *mockChangesetApplyPreviewResolver) ToHiddenChangesetApplyPreview() (graphqlbackend.HiddenChangesetApplyPreviewResolver, bool)](#mockChangesetApplyPreviewResolver.ToHiddenChangesetApplyPreview)
        * [func (r *mockChangesetApplyPreviewResolver) ToVisibleChangesetApplyPreview() (graphqlbackend.VisibleChangesetApplyPreviewResolver, bool)](#mockChangesetApplyPreviewResolver.ToVisibleChangesetApplyPreview)
    * [type mockHiddenChangesetApplyPreviewResolver struct{}](#mockHiddenChangesetApplyPreviewResolver)
        * [func (*mockHiddenChangesetApplyPreviewResolver) Operations(context.Context) ([]string, error)](#mockHiddenChangesetApplyPreviewResolver.Operations)
        * [func (*mockHiddenChangesetApplyPreviewResolver) Delta(context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)](#mockHiddenChangesetApplyPreviewResolver.Delta)
        * [func (*mockHiddenChangesetApplyPreviewResolver) Targets() graphqlbackend.HiddenApplyPreviewTargetsResolver](#mockHiddenChangesetApplyPreviewResolver.Targets)
    * [type mockVisibleChangesetApplyPreviewResolver struct](#mockVisibleChangesetApplyPreviewResolver)
        * [func (r *mockVisibleChangesetApplyPreviewResolver) Operations(context.Context) ([]string, error)](#mockVisibleChangesetApplyPreviewResolver.Operations)
        * [func (r *mockVisibleChangesetApplyPreviewResolver) Delta(context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)](#mockVisibleChangesetApplyPreviewResolver.Delta)
        * [func (r *mockVisibleChangesetApplyPreviewResolver) Targets() graphqlbackend.VisibleApplyPreviewTargetsResolver](#mockVisibleChangesetApplyPreviewResolver.Targets)
    * [type wantBatchChangeResponse struct](#wantBatchChangeResponse)
    * [type wantBatchSpecResponse struct](#wantBatchSpecResponse)
* [Functions](#func)
    * [func marshalBatchChangeID(id int64) graphql.ID](#marshalBatchChangeID)
    * [func unmarshalBatchChangeID(id graphql.ID) (batchChangeID int64, err error)](#unmarshalBatchChangeID)
    * [func marshalBatchSpecRandID(id string) graphql.ID](#marshalBatchSpecRandID)
    * [func unmarshalBatchSpecID(id graphql.ID) (batchSpecRandID string, err error)](#unmarshalBatchSpecID)
    * [func marshalBulkOperationID(id string) graphql.ID](#marshalBulkOperationID)
    * [func unmarshalBulkOperationID(id graphql.ID) (bulkOperationID string, err error)](#unmarshalBulkOperationID)
    * [func changesetJobTypeToBulkOperationType(t btypes.ChangesetJobType) (string, error)](#changesetJobTypeToBulkOperationType)
    * [func uniqueChangesetIDsForBulkOperationErrors(errors []*btypes.BulkOperationError) []int64](#uniqueChangesetIDsForBulkOperationErrors)
    * [func marshalChangesetID(id int64) graphql.ID](#marshalChangesetID)
    * [func unmarshalChangesetID(id graphql.ID) (cid int64, err error)](#unmarshalChangesetID)
    * [func marshalChangesetEventID(id int64) graphql.ID](#marshalChangesetEventID)
    * [func marshalChangesetSpecRandID(id string) graphql.ID](#marshalChangesetSpecRandID)
    * [func unmarshalChangesetSpecID(id graphql.ID) (changesetSpecRandID string, err error)](#unmarshalChangesetSpecID)
    * [func marshalBatchChangesCredentialID(id int64, isSiteCredential bool) graphql.ID](#marshalBatchChangesCredentialID)
    * [func unmarshalBatchChangesCredentialID(id graphql.ID) (credentialID int64, isSiteCredential bool, err error)](#unmarshalBatchChangesCredentialID)
    * [func commentSSHKey(ssh auth.AuthenticatorWithSSH) string](#commentSSHKey)
    * [func New(store *store.Store) graphqlbackend.BatchChangesResolver](#New)
    * [func batchChangesEnabled(ctx context.Context, db dbutil.DB) error](#batchChangesEnabled)
    * [func batchChangesCreateAccess(ctx context.Context) error](#batchChangesCreateAccess)
    * [func checkLicense() error](#checkLicense)
    * [func logBackendEvent(ctx context.Context, db dbutil.DB, name string, args interface{}) error](#logBackendEvent)
    * [func listChangesetOptsFromArgs(args *graphqlbackend.ListChangesetsArgs, batchChangeID int64) (opts store.ListChangesetsOpts, optsSafe bool, err error)](#listChangesetOptsFromArgs)
    * [func parseBatchChangeState(s *string) (btypes.BatchChangeState, error)](#parseBatchChangeState)
    * [func checkSiteAdminOrSameUser(ctx context.Context, db dbutil.DB, userID int32) (bool, error)](#checkSiteAdminOrSameUser)
    * [func validateFirstParam(first int32, max int) error](#validateFirstParam)
    * [func validateFirstParamDefaults(first int32) error](#validateFirstParamDefaults)
    * [func unmarshalBulkOperationBaseArgs(args graphqlbackend.BulkOperationBaseArgs) (batchChangeID int64, changesetIDs []int64, err error)](#unmarshalBulkOperationBaseArgs)
    * [func batchChangesApplyURL(n graphqlbackend.Namespace, c graphqlbackend.BatchSpecResolver) string](#batchChangesApplyURL)
    * [func batchChangeURL(n graphqlbackend.Namespace, c graphqlbackend.BatchChangeResolver) string](#batchChangeURL)
    * [func TestBatchChangeConnectionResolver(t *testing.T)](#TestBatchChangeConnectionResolver)
    * [func TestBatchChangesListing(t *testing.T)](#TestBatchChangesListing)
    * [func TestBatchChangeResolver(t *testing.T)](#TestBatchChangeResolver)
    * [func TestBatchSpecResolver(t *testing.T)](#TestBatchSpecResolver)
    * [func TestBulkOperationConnectionResolver(t *testing.T)](#TestBulkOperationConnectionResolver)
    * [func TestBulkOperationResolver(t *testing.T)](#TestBulkOperationResolver)
    * [func TestChangesetApplyPreviewConnectionResolver(t *testing.T)](#TestChangesetApplyPreviewConnectionResolver)
    * [func TestRewirerMappings(t *testing.T)](#TestRewirerMappings)
    * [func TestChangesetApplyPreviewResolver(t *testing.T)](#TestChangesetApplyPreviewResolver)
    * [func TestChangesetConnectionResolver(t *testing.T)](#TestChangesetConnectionResolver)
    * [func TestChangesetCountsOverTimeResolver(t *testing.T)](#TestChangesetCountsOverTimeResolver)
    * [func TestChangesetCountsOverTimeIntegration(t *testing.T)](#TestChangesetCountsOverTimeIntegration)
    * [func TestChangesetEventConnectionResolver(t *testing.T)](#TestChangesetEventConnectionResolver)
    * [func TestChangesetSpecConnectionResolver(t *testing.T)](#TestChangesetSpecConnectionResolver)
    * [func TestChangesetSpecResolver(t *testing.T)](#TestChangesetSpecResolver)
    * [func TestChangesetResolver(t *testing.T)](#TestChangesetResolver)
    * [func TestCodeHostConnectionResolver(t *testing.T)](#TestCodeHostConnectionResolver)
    * [func TestUnmarshalBatchChangesCredentialID(t *testing.T)](#TestUnmarshalBatchChangesCredentialID)
    * [func TestCommentSSHKey(t *testing.T)](#TestCommentSSHKey)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func marshalDateTime(t testing.TB, ts time.Time) string](#marshalDateTime)
    * [func parseJSONTime(t testing.TB, ts string) time.Time](#parseJSONTime)
    * [func newGitHubExternalService(t *testing.T, store *database.ExternalServiceStore) *types.ExternalService](#newGitHubExternalService)
    * [func newGitHubTestRepo(name string, externalService *types.ExternalService) *types.Repo](#newGitHubTestRepo)
    * [func mockBackendCommits(t *testing.T, revs ...api.CommitID)](#mockBackendCommits)
    * [func mockRepoComparison(t *testing.T, baseRev, headRev, diff string)](#mockRepoComparison)
    * [func addChangeset(t *testing.T, ctx context.Context, s *store.Store, c *btypes.Changeset, batchChange int64)](#addChangeset)
    * [func pruneUserCredentials(t *testing.T, db dbutil.DB, key encryption.Key)](#pruneUserCredentials)
    * [func pruneSiteCredentials(t *testing.T, cstore *store.Store)](#pruneSiteCredentials)
    * [func strPtr(s string) *string](#strPtr)
    * [func TestPermissionLevels(t *testing.T)](#TestPermissionLevels)
    * [func TestRepositoryPermissions(t *testing.T)](#TestRepositoryPermissions)
    * [func testBatchChangeResponse(t *testing.T, s *graphql.Schema, ctx context.Context, in map[string]interface{}, w wantBatchChangeResponse)](#testBatchChangeResponse)
    * [func testChangesetResponse(t *testing.T, s *graphql.Schema, ctx context.Context, id int64, wantType string)](#testChangesetResponse)
    * [func testBatchSpecResponse(t *testing.T, s *graphql.Schema, ctx context.Context, batchSpecRandID string, w wantBatchSpecResponse)](#testBatchSpecResponse)
    * [func testChangesetSpecResponse(t *testing.T, s *graphql.Schema, ctx context.Context, randID, wantType string)](#testChangesetSpecResponse)
    * [func TestNullIDResilience(t *testing.T)](#TestNullIDResilience)
    * [func TestCreateBatchSpec(t *testing.T)](#TestCreateBatchSpec)
    * [func TestCreateChangesetSpec(t *testing.T)](#TestCreateChangesetSpec)
    * [func TestApplyBatchChange(t *testing.T)](#TestApplyBatchChange)
    * [func TestCreateBatchChange(t *testing.T)](#TestCreateBatchChange)
    * [func TestMoveBatchChange(t *testing.T)](#TestMoveBatchChange)
    * [func TestListChangesetOptsFromArgs(t *testing.T)](#TestListChangesetOptsFromArgs)
    * [func TestCreateBatchChangesCredential(t *testing.T)](#TestCreateBatchChangesCredential)
    * [func TestDeleteBatchChangesCredential(t *testing.T)](#TestDeleteBatchChangesCredential)
    * [func TestCreateChangesetComments(t *testing.T)](#TestCreateChangesetComments)
    * [func TestReenqueueChangesets(t *testing.T)](#TestReenqueueChangesets)
    * [func TestMergeChangesets(t *testing.T)](#TestMergeChangesets)
    * [func stringPtr(s string) *string](#stringPtr)


## <a id="const" href="#const">Constants</a>

### <a id="batchChangeIDKind" href="#batchChangeIDKind">const batchChangeIDKind</a>

```
searchKey: resolvers.batchChangeIDKind
```

```Go
const batchChangeIDKind = "BatchChange"
```

### <a id="batchSpecIDKind" href="#batchSpecIDKind">const batchSpecIDKind</a>

```
searchKey: resolvers.batchSpecIDKind
```

```Go
const batchSpecIDKind = "BatchSpec"
```

### <a id="bulkOperationIDKind" href="#bulkOperationIDKind">const bulkOperationIDKind</a>

```
searchKey: resolvers.bulkOperationIDKind
```

```Go
const bulkOperationIDKind = "BulkOperation"
```

### <a id="changesetIDKind" href="#changesetIDKind">const changesetIDKind</a>

```
searchKey: resolvers.changesetIDKind
```

```Go
const changesetIDKind = "Changeset"
```

### <a id="changesetEventIDKind" href="#changesetEventIDKind">const changesetEventIDKind</a>

```
searchKey: resolvers.changesetEventIDKind
```

```Go
const changesetEventIDKind = "ChangesetEvent"
```

### <a id="changesetSpecIDKind" href="#changesetSpecIDKind">const changesetSpecIDKind</a>

```
searchKey: resolvers.changesetSpecIDKind
```

```Go
const changesetSpecIDKind = "ChangesetSpec"
```

### <a id="batchChangesCredentialIDKind" href="#batchChangesCredentialIDKind">const batchChangesCredentialIDKind</a>

```
searchKey: resolvers.batchChangesCredentialIDKind
```

```Go
const batchChangesCredentialIDKind = "BatchChangesCredential"
```

### <a id="siteCredentialPrefix" href="#siteCredentialPrefix">const siteCredentialPrefix</a>

```
searchKey: resolvers.siteCredentialPrefix
```

```Go
const siteCredentialPrefix = "site"
```

### <a id="userCredentialPrefix" href="#userCredentialPrefix">const userCredentialPrefix</a>

```
searchKey: resolvers.userCredentialPrefix
```

```Go
const userCredentialPrefix = "user"
```

### <a id="maxUnlicensedChangesets" href="#maxUnlicensedChangesets">const maxUnlicensedChangesets</a>

```
searchKey: resolvers.maxUnlicensedChangesets
```

```Go
const maxUnlicensedChangesets = 5
```

maxUnlicensedChangesets is the maximum number of changesets that can be attached to a batch change when Sourcegraph is unlicensed or the Batch Changes feature is disabled. 

### <a id="defaultMaxFirstParam" href="#defaultMaxFirstParam">const defaultMaxFirstParam</a>

```
searchKey: resolvers.defaultMaxFirstParam
```

```Go
const defaultMaxFirstParam = 10000
```

### <a id="queryBatchChangesConnection" href="#queryBatchChangesConnection">const queryBatchChangesConnection</a>

```
searchKey: resolvers.queryBatchChangesConnection
```

```Go
const queryBatchChangesConnection = ...
```

### <a id="listNamespacesBatchChanges" href="#listNamespacesBatchChanges">const listNamespacesBatchChanges</a>

```
searchKey: resolvers.listNamespacesBatchChanges
```

```Go
const listNamespacesBatchChanges = ...
```

### <a id="queryBatchChange" href="#queryBatchChange">const queryBatchChange</a>

```
searchKey: resolvers.queryBatchChange
```

```Go
const queryBatchChange = ...
```

### <a id="queryBatchChangeByName" href="#queryBatchChangeByName">const queryBatchChangeByName</a>

```
searchKey: resolvers.queryBatchChangeByName
```

```Go
const queryBatchChangeByName = ...
```

### <a id="queryBatchSpecNode" href="#queryBatchSpecNode">const queryBatchSpecNode</a>

```
searchKey: resolvers.queryBatchSpecNode
```

```Go
const queryBatchSpecNode = ...
```

### <a id="queryBulkOperationConnection" href="#queryBulkOperationConnection">const queryBulkOperationConnection</a>

```
searchKey: resolvers.queryBulkOperationConnection
```

```Go
const queryBulkOperationConnection = ...
```

### <a id="queryBulkOperation" href="#queryBulkOperation">const queryBulkOperation</a>

```
searchKey: resolvers.queryBulkOperation
```

```Go
const queryBulkOperation = ...
```

### <a id="queryChangesetApplyPreviewConnection" href="#queryChangesetApplyPreviewConnection">const queryChangesetApplyPreviewConnection</a>

```
searchKey: resolvers.queryChangesetApplyPreviewConnection
```

```Go
const queryChangesetApplyPreviewConnection = ...
```

### <a id="queryChangesetApplyPreview" href="#queryChangesetApplyPreview">const queryChangesetApplyPreview</a>

```
searchKey: resolvers.queryChangesetApplyPreview
```

```Go
const queryChangesetApplyPreview = ...
```

### <a id="queryChangesetConnection" href="#queryChangesetConnection">const queryChangesetConnection</a>

```
searchKey: resolvers.queryChangesetConnection
```

```Go
const queryChangesetConnection = ...
```

### <a id="queryChangesetCountsConnection" href="#queryChangesetCountsConnection">const queryChangesetCountsConnection</a>

```
searchKey: resolvers.queryChangesetCountsConnection
```

```Go
const queryChangesetCountsConnection = ...
```

### <a id="queryChangesetEventConnection" href="#queryChangesetEventConnection">const queryChangesetEventConnection</a>

```
searchKey: resolvers.queryChangesetEventConnection
```

```Go
const queryChangesetEventConnection = ...
```

### <a id="queryChangesetSpecConnection" href="#queryChangesetSpecConnection">const queryChangesetSpecConnection</a>

```
searchKey: resolvers.queryChangesetSpecConnection
```

```Go
const queryChangesetSpecConnection = ...
```

### <a id="queryChangesetSpecNode" href="#queryChangesetSpecNode">const queryChangesetSpecNode</a>

```
searchKey: resolvers.queryChangesetSpecNode
```

```Go
const queryChangesetSpecNode = ...
```

### <a id="queryChangeset" href="#queryChangeset">const queryChangeset</a>

```
searchKey: resolvers.queryChangeset
```

```Go
const queryChangeset = ...
```

### <a id="queryUserCodeHostConnection" href="#queryUserCodeHostConnection">const queryUserCodeHostConnection</a>

```
searchKey: resolvers.queryUserCodeHostConnection
```

```Go
const queryUserCodeHostConnection = ...
```

### <a id="queryCodeHostConnection" href="#queryCodeHostConnection">const queryCodeHostConnection</a>

```
searchKey: resolvers.queryCodeHostConnection
```

```Go
const queryCodeHostConnection = ...
```

### <a id="testDiff" href="#testDiff">const testDiff</a>

```
searchKey: resolvers.testDiff
```

```Go
const testDiff = ...
```

### <a id="queryBatchChangePermLevels" href="#queryBatchChangePermLevels">const queryBatchChangePermLevels</a>

```
searchKey: resolvers.queryBatchChangePermLevels
```

```Go
const queryBatchChangePermLevels = ...
```

### <a id="queryChangesetPermLevels" href="#queryChangesetPermLevels">const queryChangesetPermLevels</a>

```
searchKey: resolvers.queryChangesetPermLevels
```

```Go
const queryChangesetPermLevels = ...
```

### <a id="queryBatchSpecPermLevels" href="#queryBatchSpecPermLevels">const queryBatchSpecPermLevels</a>

```
searchKey: resolvers.queryBatchSpecPermLevels
```

```Go
const queryBatchSpecPermLevels = ...
```

### <a id="queryChangesetSpecPermLevels" href="#queryChangesetSpecPermLevels">const queryChangesetSpecPermLevels</a>

```
searchKey: resolvers.queryChangesetSpecPermLevels
```

```Go
const queryChangesetSpecPermLevels = ...
```

### <a id="mutationCreateBatchSpec" href="#mutationCreateBatchSpec">const mutationCreateBatchSpec</a>

```
searchKey: resolvers.mutationCreateBatchSpec
```

```Go
const mutationCreateBatchSpec = ...
```

### <a id="mutationCreateChangesetSpec" href="#mutationCreateChangesetSpec">const mutationCreateChangesetSpec</a>

```
searchKey: resolvers.mutationCreateChangesetSpec
```

```Go
const mutationCreateChangesetSpec = ...
```

### <a id="mutationApplyBatchChange" href="#mutationApplyBatchChange">const mutationApplyBatchChange</a>

```
searchKey: resolvers.mutationApplyBatchChange
```

```Go
const mutationApplyBatchChange = ...
```

### <a id="mutationCreateBatchChange" href="#mutationCreateBatchChange">const mutationCreateBatchChange</a>

```
searchKey: resolvers.mutationCreateBatchChange
```

```Go
const mutationCreateBatchChange = ...
```

### <a id="mutationMoveBatchChange" href="#mutationMoveBatchChange">const mutationMoveBatchChange</a>

```
searchKey: resolvers.mutationMoveBatchChange
```

```Go
const mutationMoveBatchChange = ...
```

### <a id="mutationCreateCredential" href="#mutationCreateCredential">const mutationCreateCredential</a>

```
searchKey: resolvers.mutationCreateCredential
```

```Go
const mutationCreateCredential = ...
```

### <a id="mutationDeleteCredential" href="#mutationDeleteCredential">const mutationDeleteCredential</a>

```
searchKey: resolvers.mutationDeleteCredential
```

```Go
const mutationDeleteCredential = ...
```

### <a id="mutationCreateChangesetComments" href="#mutationCreateChangesetComments">const mutationCreateChangesetComments</a>

```
searchKey: resolvers.mutationCreateChangesetComments
```

```Go
const mutationCreateChangesetComments = ...
```

### <a id="mutationReenqueueChangesets" href="#mutationReenqueueChangesets">const mutationReenqueueChangesets</a>

```
searchKey: resolvers.mutationReenqueueChangesets
```

```Go
const mutationReenqueueChangesets = ...
```

### <a id="mutationMergeChangesets" href="#mutationMergeChangesets">const mutationMergeChangesets</a>

```
searchKey: resolvers.mutationMergeChangesets
```

```Go
const mutationMergeChangesets = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="update" href="#update">var update</a>

```
searchKey: resolvers.update
```

```Go
var update = flag.Bool("update", false, "update testdata")
```

### <a id="testDiffGraphQL" href="#testDiffGraphQL">var testDiffGraphQL</a>

```
searchKey: resolvers.testDiffGraphQL
```

```Go
var testDiffGraphQL = ...
```

testDiffGraphQL is the parsed representation of testDiff. 

## <a id="type" href="#type">Types</a>

### <a id="batchChangeResolver" href="#batchChangeResolver">type batchChangeResolver struct</a>

```
searchKey: resolvers.batchChangeResolver
```

```Go
type batchChangeResolver struct {
	store *store.Store

	batchChange *btypes.BatchChange

	// Cache the namespace on the resolver, since it's accessed more than once.
	namespaceOnce sync.Once
	namespace     graphqlbackend.NamespaceResolver
	namespaceErr  error

	// TODO(campaigns-deprecation): This should be removed once we remove campaigns completely
	shouldActAsCampaign bool
}
```

#### <a id="batchChangeResolver.ActAsCampaign" href="#batchChangeResolver.ActAsCampaign">func (r *batchChangeResolver) ActAsCampaign() bool</a>

```
searchKey: resolvers.batchChangeResolver.ActAsCampaign
```

```Go
func (r *batchChangeResolver) ActAsCampaign() bool
```

#### <a id="batchChangeResolver.ID" href="#batchChangeResolver.ID">func (r *batchChangeResolver) ID() graphql.ID</a>

```
searchKey: resolvers.batchChangeResolver.ID
```

```Go
func (r *batchChangeResolver) ID() graphql.ID
```

#### <a id="batchChangeResolver.Name" href="#batchChangeResolver.Name">func (r *batchChangeResolver) Name() string</a>

```
searchKey: resolvers.batchChangeResolver.Name
```

```Go
func (r *batchChangeResolver) Name() string
```

#### <a id="batchChangeResolver.Description" href="#batchChangeResolver.Description">func (r *batchChangeResolver) Description() *string</a>

```
searchKey: resolvers.batchChangeResolver.Description
```

```Go
func (r *batchChangeResolver) Description() *string
```

#### <a id="batchChangeResolver.InitialApplier" href="#batchChangeResolver.InitialApplier">func (r *batchChangeResolver) InitialApplier(ctx context.Context) (*graphqlbackend.UserResolver, error)</a>

```
searchKey: resolvers.batchChangeResolver.InitialApplier
```

```Go
func (r *batchChangeResolver) InitialApplier(ctx context.Context) (*graphqlbackend.UserResolver, error)
```

#### <a id="batchChangeResolver.LastApplier" href="#batchChangeResolver.LastApplier">func (r *batchChangeResolver) LastApplier(ctx context.Context) (*graphqlbackend.UserResolver, error)</a>

```
searchKey: resolvers.batchChangeResolver.LastApplier
```

```Go
func (r *batchChangeResolver) LastApplier(ctx context.Context) (*graphqlbackend.UserResolver, error)
```

#### <a id="batchChangeResolver.LastAppliedAt" href="#batchChangeResolver.LastAppliedAt">func (r *batchChangeResolver) LastAppliedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.batchChangeResolver.LastAppliedAt
```

```Go
func (r *batchChangeResolver) LastAppliedAt() graphqlbackend.DateTime
```

#### <a id="batchChangeResolver.SpecCreator" href="#batchChangeResolver.SpecCreator">func (r *batchChangeResolver) SpecCreator(ctx context.Context) (*graphqlbackend.UserResolver, error)</a>

```
searchKey: resolvers.batchChangeResolver.SpecCreator
```

```Go
func (r *batchChangeResolver) SpecCreator(ctx context.Context) (*graphqlbackend.UserResolver, error)
```

#### <a id="batchChangeResolver.ViewerCanAdminister" href="#batchChangeResolver.ViewerCanAdminister">func (r *batchChangeResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: resolvers.batchChangeResolver.ViewerCanAdminister
```

```Go
func (r *batchChangeResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

#### <a id="batchChangeResolver.URL" href="#batchChangeResolver.URL">func (r *batchChangeResolver) URL(ctx context.Context) (string, error)</a>

```
searchKey: resolvers.batchChangeResolver.URL
```

```Go
func (r *batchChangeResolver) URL(ctx context.Context) (string, error)
```

#### <a id="batchChangeResolver.Namespace" href="#batchChangeResolver.Namespace">func (r *batchChangeResolver) Namespace(ctx context.Context) (graphqlbackend.NamespaceResolver, error)</a>

```
searchKey: resolvers.batchChangeResolver.Namespace
```

```Go
func (r *batchChangeResolver) Namespace(ctx context.Context) (graphqlbackend.NamespaceResolver, error)
```

#### <a id="batchChangeResolver.computeNamespace" href="#batchChangeResolver.computeNamespace">func (r *batchChangeResolver) computeNamespace(ctx context.Context) (graphqlbackend.NamespaceResolver, error)</a>

```
searchKey: resolvers.batchChangeResolver.computeNamespace
```

```Go
func (r *batchChangeResolver) computeNamespace(ctx context.Context) (graphqlbackend.NamespaceResolver, error)
```

#### <a id="batchChangeResolver.CreatedAt" href="#batchChangeResolver.CreatedAt">func (r *batchChangeResolver) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.batchChangeResolver.CreatedAt
```

```Go
func (r *batchChangeResolver) CreatedAt() graphqlbackend.DateTime
```

#### <a id="batchChangeResolver.UpdatedAt" href="#batchChangeResolver.UpdatedAt">func (r *batchChangeResolver) UpdatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.batchChangeResolver.UpdatedAt
```

```Go
func (r *batchChangeResolver) UpdatedAt() graphqlbackend.DateTime
```

#### <a id="batchChangeResolver.ClosedAt" href="#batchChangeResolver.ClosedAt">func (r *batchChangeResolver) ClosedAt() *graphqlbackend.DateTime</a>

```
searchKey: resolvers.batchChangeResolver.ClosedAt
```

```Go
func (r *batchChangeResolver) ClosedAt() *graphqlbackend.DateTime
```

#### <a id="batchChangeResolver.ChangesetsStats" href="#batchChangeResolver.ChangesetsStats">func (r *batchChangeResolver) ChangesetsStats(ctx context.Context) (graphqlbackend.ChangesetsStatsResolver, error)</a>

```
searchKey: resolvers.batchChangeResolver.ChangesetsStats
```

```Go
func (r *batchChangeResolver) ChangesetsStats(ctx context.Context) (graphqlbackend.ChangesetsStatsResolver, error)
```

#### <a id="batchChangeResolver.Changesets" href="#batchChangeResolver.Changesets">func (r *batchChangeResolver) Changesets(ctx context.Context,...</a>

```
searchKey: resolvers.batchChangeResolver.Changesets
```

```Go
func (r *batchChangeResolver) Changesets(
	ctx context.Context,
	args *graphqlbackend.ListChangesetsArgs,
) (graphqlbackend.ChangesetsConnectionResolver, error)
```

#### <a id="batchChangeResolver.ChangesetCountsOverTime" href="#batchChangeResolver.ChangesetCountsOverTime">func (r *batchChangeResolver) ChangesetCountsOverTime(ctx context.Context,...</a>

```
searchKey: resolvers.batchChangeResolver.ChangesetCountsOverTime
```

```Go
func (r *batchChangeResolver) ChangesetCountsOverTime(
	ctx context.Context,
	args *graphqlbackend.ChangesetCountsArgs,
) ([]graphqlbackend.ChangesetCountsResolver, error)
```

#### <a id="batchChangeResolver.DiffStat" href="#batchChangeResolver.DiffStat">func (r *batchChangeResolver) DiffStat(ctx context.Context) (*graphqlbackend.DiffStat, error)</a>

```
searchKey: resolvers.batchChangeResolver.DiffStat
```

```Go
func (r *batchChangeResolver) DiffStat(ctx context.Context) (*graphqlbackend.DiffStat, error)
```

#### <a id="batchChangeResolver.CurrentSpec" href="#batchChangeResolver.CurrentSpec">func (r *batchChangeResolver) CurrentSpec(ctx context.Context) (graphqlbackend.BatchSpecResolver, error)</a>

```
searchKey: resolvers.batchChangeResolver.CurrentSpec
```

```Go
func (r *batchChangeResolver) CurrentSpec(ctx context.Context) (graphqlbackend.BatchSpecResolver, error)
```

#### <a id="batchChangeResolver.BulkOperations" href="#batchChangeResolver.BulkOperations">func (r *batchChangeResolver) BulkOperations(ctx context.Context,...</a>

```
searchKey: resolvers.batchChangeResolver.BulkOperations
```

```Go
func (r *batchChangeResolver) BulkOperations(
	ctx context.Context,
	args *graphqlbackend.ListBatchChangeBulkOperationArgs,
) (graphqlbackend.BulkOperationConnectionResolver, error)
```

### <a id="batchChangesConnectionResolver" href="#batchChangesConnectionResolver">type batchChangesConnectionResolver struct</a>

```
searchKey: resolvers.batchChangesConnectionResolver
```

```Go
type batchChangesConnectionResolver struct {
	store *store.Store
	opts  store.ListBatchChangesOpts

	// cache results because they are used by multiple fields
	once         sync.Once
	batchChanges []*btypes.BatchChange
	next         int64
	err          error
}
```

#### <a id="batchChangesConnectionResolver.Nodes" href="#batchChangesConnectionResolver.Nodes">func (r *batchChangesConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.batchChangesConnectionResolver.Nodes
```

```Go
func (r *batchChangesConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.BatchChangeResolver, error)
```

#### <a id="batchChangesConnectionResolver.TotalCount" href="#batchChangesConnectionResolver.TotalCount">func (r *batchChangesConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.batchChangesConnectionResolver.TotalCount
```

```Go
func (r *batchChangesConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="batchChangesConnectionResolver.PageInfo" href="#batchChangesConnectionResolver.PageInfo">func (r *batchChangesConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.batchChangesConnectionResolver.PageInfo
```

```Go
func (r *batchChangesConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="batchChangesConnectionResolver.compute" href="#batchChangesConnectionResolver.compute">func (r *batchChangesConnectionResolver) compute(ctx context.Context) ([]*btypes.BatchChange, int64, error)</a>

```
searchKey: resolvers.batchChangesConnectionResolver.compute
```

```Go
func (r *batchChangesConnectionResolver) compute(ctx context.Context) ([]*btypes.BatchChange, int64, error)
```

### <a id="batchSpecResolver" href="#batchSpecResolver">type batchSpecResolver struct</a>

```
searchKey: resolvers.batchSpecResolver
```

```Go
type batchSpecResolver struct {
	store *store.Store

	batchSpec          *btypes.BatchSpec
	preloadedNamespace *graphqlbackend.NamespaceResolver

	// We cache the namespace on the resolver, since it's accessed more than once.
	namespaceOnce sync.Once
	namespace     *graphqlbackend.NamespaceResolver
	namespaceErr  error

	// TODO(campaigns-deprecation): This should be removed once we remove campaigns completely
	shouldActAsCampaignSpec bool
}
```

#### <a id="batchSpecResolver.ActAsCampaignSpec" href="#batchSpecResolver.ActAsCampaignSpec">func (r *batchSpecResolver) ActAsCampaignSpec() bool</a>

```
searchKey: resolvers.batchSpecResolver.ActAsCampaignSpec
```

```Go
func (r *batchSpecResolver) ActAsCampaignSpec() bool
```

#### <a id="batchSpecResolver.ID" href="#batchSpecResolver.ID">func (r *batchSpecResolver) ID() graphql.ID</a>

```
searchKey: resolvers.batchSpecResolver.ID
```

```Go
func (r *batchSpecResolver) ID() graphql.ID
```

#### <a id="batchSpecResolver.OriginalInput" href="#batchSpecResolver.OriginalInput">func (r *batchSpecResolver) OriginalInput() (string, error)</a>

```
searchKey: resolvers.batchSpecResolver.OriginalInput
```

```Go
func (r *batchSpecResolver) OriginalInput() (string, error)
```

#### <a id="batchSpecResolver.ParsedInput" href="#batchSpecResolver.ParsedInput">func (r *batchSpecResolver) ParsedInput() (graphqlbackend.JSONValue, error)</a>

```
searchKey: resolvers.batchSpecResolver.ParsedInput
```

```Go
func (r *batchSpecResolver) ParsedInput() (graphqlbackend.JSONValue, error)
```

#### <a id="batchSpecResolver.ChangesetSpecs" href="#batchSpecResolver.ChangesetSpecs">func (r *batchSpecResolver) ChangesetSpecs(ctx context.Context, args *graphqlbackend.ChangesetSpecsConnectionArgs) (graphqlbackend.ChangesetSpecConnectionResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.ChangesetSpecs
```

```Go
func (r *batchSpecResolver) ChangesetSpecs(ctx context.Context, args *graphqlbackend.ChangesetSpecsConnectionArgs) (graphqlbackend.ChangesetSpecConnectionResolver, error)
```

#### <a id="batchSpecResolver.ApplyPreview" href="#batchSpecResolver.ApplyPreview">func (r *batchSpecResolver) ApplyPreview(ctx context.Context, args *graphqlbackend.ChangesetApplyPreviewConnectionArgs) (graphqlbackend.ChangesetApplyPreviewConnectionResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.ApplyPreview
```

```Go
func (r *batchSpecResolver) ApplyPreview(ctx context.Context, args *graphqlbackend.ChangesetApplyPreviewConnectionArgs) (graphqlbackend.ChangesetApplyPreviewConnectionResolver, error)
```

#### <a id="batchSpecResolver.Description" href="#batchSpecResolver.Description">func (r *batchSpecResolver) Description() graphqlbackend.BatchChangeDescriptionResolver</a>

```
searchKey: resolvers.batchSpecResolver.Description
```

```Go
func (r *batchSpecResolver) Description() graphqlbackend.BatchChangeDescriptionResolver
```

#### <a id="batchSpecResolver.Creator" href="#batchSpecResolver.Creator">func (r *batchSpecResolver) Creator(ctx context.Context) (*graphqlbackend.UserResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.Creator
```

```Go
func (r *batchSpecResolver) Creator(ctx context.Context) (*graphqlbackend.UserResolver, error)
```

#### <a id="batchSpecResolver.Namespace" href="#batchSpecResolver.Namespace">func (r *batchSpecResolver) Namespace(ctx context.Context) (*graphqlbackend.NamespaceResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.Namespace
```

```Go
func (r *batchSpecResolver) Namespace(ctx context.Context) (*graphqlbackend.NamespaceResolver, error)
```

#### <a id="batchSpecResolver.computeNamespace" href="#batchSpecResolver.computeNamespace">func (r *batchSpecResolver) computeNamespace(ctx context.Context) (*graphqlbackend.NamespaceResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.computeNamespace
```

```Go
func (r *batchSpecResolver) computeNamespace(ctx context.Context) (*graphqlbackend.NamespaceResolver, error)
```

#### <a id="batchSpecResolver.ApplyURL" href="#batchSpecResolver.ApplyURL">func (r *batchSpecResolver) ApplyURL(ctx context.Context) (string, error)</a>

```
searchKey: resolvers.batchSpecResolver.ApplyURL
```

```Go
func (r *batchSpecResolver) ApplyURL(ctx context.Context) (string, error)
```

#### <a id="batchSpecResolver.CreatedAt" href="#batchSpecResolver.CreatedAt">func (r *batchSpecResolver) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.batchSpecResolver.CreatedAt
```

```Go
func (r *batchSpecResolver) CreatedAt() graphqlbackend.DateTime
```

#### <a id="batchSpecResolver.ExpiresAt" href="#batchSpecResolver.ExpiresAt">func (r *batchSpecResolver) ExpiresAt() *graphqlbackend.DateTime</a>

```
searchKey: resolvers.batchSpecResolver.ExpiresAt
```

```Go
func (r *batchSpecResolver) ExpiresAt() *graphqlbackend.DateTime
```

#### <a id="batchSpecResolver.ViewerCanAdminister" href="#batchSpecResolver.ViewerCanAdminister">func (r *batchSpecResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: resolvers.batchSpecResolver.ViewerCanAdminister
```

```Go
func (r *batchSpecResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

#### <a id="batchSpecResolver.DiffStat" href="#batchSpecResolver.DiffStat">func (r *batchSpecResolver) DiffStat(ctx context.Context) (*graphqlbackend.DiffStat, error)</a>

```
searchKey: resolvers.batchSpecResolver.DiffStat
```

```Go
func (r *batchSpecResolver) DiffStat(ctx context.Context) (*graphqlbackend.DiffStat, error)
```

#### <a id="batchSpecResolver.AppliesToCampaign" href="#batchSpecResolver.AppliesToCampaign">func (r *batchSpecResolver) AppliesToCampaign(ctx context.Context) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.AppliesToCampaign
```

```Go
func (r *batchSpecResolver) AppliesToCampaign(ctx context.Context) (graphqlbackend.BatchChangeResolver, error)
```

TODO(campaigns-deprecation): This should be removed once we remove campaigns completely. 

#### <a id="batchSpecResolver.AppliesToBatchChange" href="#batchSpecResolver.AppliesToBatchChange">func (r *batchSpecResolver) AppliesToBatchChange(ctx context.Context) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.AppliesToBatchChange
```

```Go
func (r *batchSpecResolver) AppliesToBatchChange(ctx context.Context) (graphqlbackend.BatchChangeResolver, error)
```

#### <a id="batchSpecResolver.SupersedingCampaignSpec" href="#batchSpecResolver.SupersedingCampaignSpec">func (r *batchSpecResolver) SupersedingCampaignSpec(ctx context.Context) (graphqlbackend.BatchSpecResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.SupersedingCampaignSpec
```

```Go
func (r *batchSpecResolver) SupersedingCampaignSpec(ctx context.Context) (graphqlbackend.BatchSpecResolver, error)
```

TODO(campaigns-deprecation): This should be removed once we remove campaigns completely. 

#### <a id="batchSpecResolver.SupersedingBatchSpec" href="#batchSpecResolver.SupersedingBatchSpec">func (r *batchSpecResolver) SupersedingBatchSpec(ctx context.Context) (graphqlbackend.BatchSpecResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.SupersedingBatchSpec
```

```Go
func (r *batchSpecResolver) SupersedingBatchSpec(ctx context.Context) (graphqlbackend.BatchSpecResolver, error)
```

#### <a id="batchSpecResolver.ViewerBatchChangesCodeHosts" href="#batchSpecResolver.ViewerBatchChangesCodeHosts">func (r *batchSpecResolver) ViewerBatchChangesCodeHosts(ctx context.Context, args *graphqlbackend.ListViewerBatchChangesCodeHostsArgs) (graphqlbackend.BatchChangesCodeHostConnectionResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.ViewerBatchChangesCodeHosts
```

```Go
func (r *batchSpecResolver) ViewerBatchChangesCodeHosts(ctx context.Context, args *graphqlbackend.ListViewerBatchChangesCodeHostsArgs) (graphqlbackend.BatchChangesCodeHostConnectionResolver, error)
```

#### <a id="batchSpecResolver.ViewerCampaignsCodeHosts" href="#batchSpecResolver.ViewerCampaignsCodeHosts">func (r *batchSpecResolver) ViewerCampaignsCodeHosts(ctx context.Context, args *graphqlbackend.ListViewerCampaignsCodeHostsArgs) (graphqlbackend.CampaignsCodeHostConnectionResolver, error)</a>

```
searchKey: resolvers.batchSpecResolver.ViewerCampaignsCodeHosts
```

```Go
func (r *batchSpecResolver) ViewerCampaignsCodeHosts(ctx context.Context, args *graphqlbackend.ListViewerCampaignsCodeHostsArgs) (graphqlbackend.CampaignsCodeHostConnectionResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

### <a id="batchChangeDescriptionResolver" href="#batchChangeDescriptionResolver">type batchChangeDescriptionResolver struct</a>

```
searchKey: resolvers.batchChangeDescriptionResolver
```

```Go
type batchChangeDescriptionResolver struct {
	name, description string
}
```

#### <a id="batchChangeDescriptionResolver.Name" href="#batchChangeDescriptionResolver.Name">func (r *batchChangeDescriptionResolver) Name() string</a>

```
searchKey: resolvers.batchChangeDescriptionResolver.Name
```

```Go
func (r *batchChangeDescriptionResolver) Name() string
```

#### <a id="batchChangeDescriptionResolver.Description" href="#batchChangeDescriptionResolver.Description">func (r *batchChangeDescriptionResolver) Description() string</a>

```
searchKey: resolvers.batchChangeDescriptionResolver.Description
```

```Go
func (r *batchChangeDescriptionResolver) Description() string
```

### <a id="bulkOperationResolver" href="#bulkOperationResolver">type bulkOperationResolver struct</a>

```
searchKey: resolvers.bulkOperationResolver
```

```Go
type bulkOperationResolver struct {
	store         *store.Store
	bulkOperation *btypes.BulkOperation
}
```

#### <a id="bulkOperationResolver.ID" href="#bulkOperationResolver.ID">func (r *bulkOperationResolver) ID() graphql.ID</a>

```
searchKey: resolvers.bulkOperationResolver.ID
```

```Go
func (r *bulkOperationResolver) ID() graphql.ID
```

#### <a id="bulkOperationResolver.Type" href="#bulkOperationResolver.Type">func (r *bulkOperationResolver) Type() (string, error)</a>

```
searchKey: resolvers.bulkOperationResolver.Type
```

```Go
func (r *bulkOperationResolver) Type() (string, error)
```

#### <a id="bulkOperationResolver.State" href="#bulkOperationResolver.State">func (r *bulkOperationResolver) State() string</a>

```
searchKey: resolvers.bulkOperationResolver.State
```

```Go
func (r *bulkOperationResolver) State() string
```

#### <a id="bulkOperationResolver.Progress" href="#bulkOperationResolver.Progress">func (r *bulkOperationResolver) Progress() float64</a>

```
searchKey: resolvers.bulkOperationResolver.Progress
```

```Go
func (r *bulkOperationResolver) Progress() float64
```

#### <a id="bulkOperationResolver.Errors" href="#bulkOperationResolver.Errors">func (r *bulkOperationResolver) Errors(ctx context.Context) ([]graphqlbackend.ChangesetJobErrorResolver, error)</a>

```
searchKey: resolvers.bulkOperationResolver.Errors
```

```Go
func (r *bulkOperationResolver) Errors(ctx context.Context) ([]graphqlbackend.ChangesetJobErrorResolver, error)
```

#### <a id="bulkOperationResolver.Initiator" href="#bulkOperationResolver.Initiator">func (r *bulkOperationResolver) Initiator(ctx context.Context) (*graphqlbackend.UserResolver, error)</a>

```
searchKey: resolvers.bulkOperationResolver.Initiator
```

```Go
func (r *bulkOperationResolver) Initiator(ctx context.Context) (*graphqlbackend.UserResolver, error)
```

#### <a id="bulkOperationResolver.ChangesetCount" href="#bulkOperationResolver.ChangesetCount">func (r *bulkOperationResolver) ChangesetCount() int32</a>

```
searchKey: resolvers.bulkOperationResolver.ChangesetCount
```

```Go
func (r *bulkOperationResolver) ChangesetCount() int32
```

#### <a id="bulkOperationResolver.CreatedAt" href="#bulkOperationResolver.CreatedAt">func (r *bulkOperationResolver) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.bulkOperationResolver.CreatedAt
```

```Go
func (r *bulkOperationResolver) CreatedAt() graphqlbackend.DateTime
```

#### <a id="bulkOperationResolver.FinishedAt" href="#bulkOperationResolver.FinishedAt">func (r *bulkOperationResolver) FinishedAt() *graphqlbackend.DateTime</a>

```
searchKey: resolvers.bulkOperationResolver.FinishedAt
```

```Go
func (r *bulkOperationResolver) FinishedAt() *graphqlbackend.DateTime
```

### <a id="bulkOperationConnectionResolver" href="#bulkOperationConnectionResolver">type bulkOperationConnectionResolver struct</a>

```
searchKey: resolvers.bulkOperationConnectionResolver
```

```Go
type bulkOperationConnectionResolver struct {
	store         *store.Store
	batchChangeID int64
	opts          store.ListBulkOperationsOpts

	// Cache results because they are used by multiple fields
	once           sync.Once
	bulkOperations []*btypes.BulkOperation
	next           int64
	err            error
}
```

#### <a id="bulkOperationConnectionResolver.TotalCount" href="#bulkOperationConnectionResolver.TotalCount">func (r *bulkOperationConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.bulkOperationConnectionResolver.TotalCount
```

```Go
func (r *bulkOperationConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="bulkOperationConnectionResolver.PageInfo" href="#bulkOperationConnectionResolver.PageInfo">func (r *bulkOperationConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.bulkOperationConnectionResolver.PageInfo
```

```Go
func (r *bulkOperationConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="bulkOperationConnectionResolver.Nodes" href="#bulkOperationConnectionResolver.Nodes">func (r *bulkOperationConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.BulkOperationResolver, error)</a>

```
searchKey: resolvers.bulkOperationConnectionResolver.Nodes
```

```Go
func (r *bulkOperationConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.BulkOperationResolver, error)
```

#### <a id="bulkOperationConnectionResolver.compute" href="#bulkOperationConnectionResolver.compute">func (r *bulkOperationConnectionResolver) compute(ctx context.Context) ([]*btypes.BulkOperation, int64, error)</a>

```
searchKey: resolvers.bulkOperationConnectionResolver.compute
```

```Go
func (r *bulkOperationConnectionResolver) compute(ctx context.Context) ([]*btypes.BulkOperation, int64, error)
```

### <a id="changesetResolver" href="#changesetResolver">type changesetResolver struct</a>

```
searchKey: resolvers.changesetResolver
```

```Go
type changesetResolver struct {
	store *store.Store

	changeset *btypes.Changeset

	// When repo is nil, this resolver resolves to a `HiddenExternalChangeset` in the API.
	repo         *types.Repo
	repoResolver *graphqlbackend.RepositoryResolver

	attemptedPreloadNextSyncAt bool
	// When the next sync is scheduled
	preloadedNextSyncAt time.Time
	nextSyncAtOnce      sync.Once
	nextSyncAt          time.Time
	nextSyncAtErr       error

	// cache the current ChangesetSpec as it's accessed by multiple methods
	specOnce sync.Once
	spec     *btypes.ChangesetSpec
	specErr  error
}
```

#### <a id="NewChangesetResolverWithNextSync" href="#NewChangesetResolverWithNextSync">func NewChangesetResolverWithNextSync(store *store.Store, changeset *btypes.Changeset, repo *types.Repo, nextSyncAt time.Time) *changesetResolver</a>

```
searchKey: resolvers.NewChangesetResolverWithNextSync
tags: [exported]
```

```Go
func NewChangesetResolverWithNextSync(store *store.Store, changeset *btypes.Changeset, repo *types.Repo, nextSyncAt time.Time) *changesetResolver
```

#### <a id="NewChangesetResolver" href="#NewChangesetResolver">func NewChangesetResolver(store *store.Store, changeset *btypes.Changeset, repo *types.Repo) *changesetResolver</a>

```
searchKey: resolvers.NewChangesetResolver
tags: [exported]
```

```Go
func NewChangesetResolver(store *store.Store, changeset *btypes.Changeset, repo *types.Repo) *changesetResolver
```

#### <a id="changesetResolver.ToExternalChangeset" href="#changesetResolver.ToExternalChangeset">func (r *changesetResolver) ToExternalChangeset() (graphqlbackend.ExternalChangesetResolver, bool)</a>

```
searchKey: resolvers.changesetResolver.ToExternalChangeset
```

```Go
func (r *changesetResolver) ToExternalChangeset() (graphqlbackend.ExternalChangesetResolver, bool)
```

#### <a id="changesetResolver.ToHiddenExternalChangeset" href="#changesetResolver.ToHiddenExternalChangeset">func (r *changesetResolver) ToHiddenExternalChangeset() (graphqlbackend.HiddenExternalChangesetResolver, bool)</a>

```
searchKey: resolvers.changesetResolver.ToHiddenExternalChangeset
```

```Go
func (r *changesetResolver) ToHiddenExternalChangeset() (graphqlbackend.HiddenExternalChangesetResolver, bool)
```

#### <a id="changesetResolver.repoAccessible" href="#changesetResolver.repoAccessible">func (r *changesetResolver) repoAccessible() bool</a>

```
searchKey: resolvers.changesetResolver.repoAccessible
```

```Go
func (r *changesetResolver) repoAccessible() bool
```

#### <a id="changesetResolver.computeSpec" href="#changesetResolver.computeSpec">func (r *changesetResolver) computeSpec(ctx context.Context) (*btypes.ChangesetSpec, error)</a>

```
searchKey: resolvers.changesetResolver.computeSpec
```

```Go
func (r *changesetResolver) computeSpec(ctx context.Context) (*btypes.ChangesetSpec, error)
```

#### <a id="changesetResolver.computeNextSyncAt" href="#changesetResolver.computeNextSyncAt">func (r *changesetResolver) computeNextSyncAt(ctx context.Context) (time.Time, error)</a>

```
searchKey: resolvers.changesetResolver.computeNextSyncAt
```

```Go
func (r *changesetResolver) computeNextSyncAt(ctx context.Context) (time.Time, error)
```

#### <a id="changesetResolver.ID" href="#changesetResolver.ID">func (r *changesetResolver) ID() graphql.ID</a>

```
searchKey: resolvers.changesetResolver.ID
```

```Go
func (r *changesetResolver) ID() graphql.ID
```

#### <a id="changesetResolver.ExternalID" href="#changesetResolver.ExternalID">func (r *changesetResolver) ExternalID() *string</a>

```
searchKey: resolvers.changesetResolver.ExternalID
```

```Go
func (r *changesetResolver) ExternalID() *string
```

#### <a id="changesetResolver.Repository" href="#changesetResolver.Repository">func (r *changesetResolver) Repository(ctx context.Context) *graphqlbackend.RepositoryResolver</a>

```
searchKey: resolvers.changesetResolver.Repository
```

```Go
func (r *changesetResolver) Repository(ctx context.Context) *graphqlbackend.RepositoryResolver
```

#### <a id="changesetResolver.Campaigns" href="#changesetResolver.Campaigns">func (r *changesetResolver) Campaigns(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)</a>

```
searchKey: resolvers.changesetResolver.Campaigns
```

```Go
func (r *changesetResolver) Campaigns(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)
```

TODO(campaigns-deprecation): This should be removed once we remove campaigns completely. 

#### <a id="changesetResolver.BatchChanges" href="#changesetResolver.BatchChanges">func (r *changesetResolver) BatchChanges(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)</a>

```
searchKey: resolvers.changesetResolver.BatchChanges
```

```Go
func (r *changesetResolver) BatchChanges(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)
```

#### <a id="changesetResolver.CreatedAt" href="#changesetResolver.CreatedAt">func (r *changesetResolver) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.changesetResolver.CreatedAt
```

```Go
func (r *changesetResolver) CreatedAt() graphqlbackend.DateTime
```

#### <a id="changesetResolver.UpdatedAt" href="#changesetResolver.UpdatedAt">func (r *changesetResolver) UpdatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.changesetResolver.UpdatedAt
```

```Go
func (r *changesetResolver) UpdatedAt() graphqlbackend.DateTime
```

#### <a id="changesetResolver.NextSyncAt" href="#changesetResolver.NextSyncAt">func (r *changesetResolver) NextSyncAt(ctx context.Context) (*graphqlbackend.DateTime, error)</a>

```
searchKey: resolvers.changesetResolver.NextSyncAt
```

```Go
func (r *changesetResolver) NextSyncAt(ctx context.Context) (*graphqlbackend.DateTime, error)
```

#### <a id="changesetResolver.Title" href="#changesetResolver.Title">func (r *changesetResolver) Title(ctx context.Context) (*string, error)</a>

```
searchKey: resolvers.changesetResolver.Title
```

```Go
func (r *changesetResolver) Title(ctx context.Context) (*string, error)
```

#### <a id="changesetResolver.Author" href="#changesetResolver.Author">func (r *changesetResolver) Author() (*graphqlbackend.PersonResolver, error)</a>

```
searchKey: resolvers.changesetResolver.Author
```

```Go
func (r *changesetResolver) Author() (*graphqlbackend.PersonResolver, error)
```

#### <a id="changesetResolver.Body" href="#changesetResolver.Body">func (r *changesetResolver) Body(ctx context.Context) (*string, error)</a>

```
searchKey: resolvers.changesetResolver.Body
```

```Go
func (r *changesetResolver) Body(ctx context.Context) (*string, error)
```

#### <a id="changesetResolver.getBranchSpecDescription" href="#changesetResolver.getBranchSpecDescription">func (r *changesetResolver) getBranchSpecDescription(ctx context.Context) (*btypes.ChangesetSpecDescription, error)</a>

```
searchKey: resolvers.changesetResolver.getBranchSpecDescription
```

```Go
func (r *changesetResolver) getBranchSpecDescription(ctx context.Context) (*btypes.ChangesetSpecDescription, error)
```

#### <a id="changesetResolver.PublicationState" href="#changesetResolver.PublicationState">func (r *changesetResolver) PublicationState() string</a>

```
searchKey: resolvers.changesetResolver.PublicationState
```

```Go
func (r *changesetResolver) PublicationState() string
```

#### <a id="changesetResolver.ReconcilerState" href="#changesetResolver.ReconcilerState">func (r *changesetResolver) ReconcilerState() string</a>

```
searchKey: resolvers.changesetResolver.ReconcilerState
```

```Go
func (r *changesetResolver) ReconcilerState() string
```

#### <a id="changesetResolver.ExternalState" href="#changesetResolver.ExternalState">func (r *changesetResolver) ExternalState() *string</a>

```
searchKey: resolvers.changesetResolver.ExternalState
```

```Go
func (r *changesetResolver) ExternalState() *string
```

#### <a id="changesetResolver.State" href="#changesetResolver.State">func (r *changesetResolver) State() (string, error)</a>

```
searchKey: resolvers.changesetResolver.State
```

```Go
func (r *changesetResolver) State() (string, error)
```

#### <a id="changesetResolver.ExternalURL" href="#changesetResolver.ExternalURL">func (r *changesetResolver) ExternalURL() (*externallink.Resolver, error)</a>

```
searchKey: resolvers.changesetResolver.ExternalURL
```

```Go
func (r *changesetResolver) ExternalURL() (*externallink.Resolver, error)
```

#### <a id="changesetResolver.ReviewState" href="#changesetResolver.ReviewState">func (r *changesetResolver) ReviewState(ctx context.Context) *string</a>

```
searchKey: resolvers.changesetResolver.ReviewState
```

```Go
func (r *changesetResolver) ReviewState(ctx context.Context) *string
```

#### <a id="changesetResolver.CheckState" href="#changesetResolver.CheckState">func (r *changesetResolver) CheckState() *string</a>

```
searchKey: resolvers.changesetResolver.CheckState
```

```Go
func (r *changesetResolver) CheckState() *string
```

#### <a id="changesetResolver.Error" href="#changesetResolver.Error">func (r *changesetResolver) Error() *string</a>

```
searchKey: resolvers.changesetResolver.Error
```

```Go
func (r *changesetResolver) Error() *string
```

#### <a id="changesetResolver.SyncerError" href="#changesetResolver.SyncerError">func (r *changesetResolver) SyncerError() *string</a>

```
searchKey: resolvers.changesetResolver.SyncerError
```

```Go
func (r *changesetResolver) SyncerError() *string
```

#### <a id="changesetResolver.ScheduleEstimateAt" href="#changesetResolver.ScheduleEstimateAt">func (r *changesetResolver) ScheduleEstimateAt(ctx context.Context) (*graphqlbackend.DateTime, error)</a>

```
searchKey: resolvers.changesetResolver.ScheduleEstimateAt
```

```Go
func (r *changesetResolver) ScheduleEstimateAt(ctx context.Context) (*graphqlbackend.DateTime, error)
```

#### <a id="changesetResolver.CurrentSpec" href="#changesetResolver.CurrentSpec">func (r *changesetResolver) CurrentSpec(ctx context.Context) (graphqlbackend.VisibleChangesetSpecResolver, error)</a>

```
searchKey: resolvers.changesetResolver.CurrentSpec
```

```Go
func (r *changesetResolver) CurrentSpec(ctx context.Context) (graphqlbackend.VisibleChangesetSpecResolver, error)
```

#### <a id="changesetResolver.Labels" href="#changesetResolver.Labels">func (r *changesetResolver) Labels(ctx context.Context) ([]graphqlbackend.ChangesetLabelResolver, error)</a>

```
searchKey: resolvers.changesetResolver.Labels
```

```Go
func (r *changesetResolver) Labels(ctx context.Context) ([]graphqlbackend.ChangesetLabelResolver, error)
```

#### <a id="changesetResolver.Events" href="#changesetResolver.Events">func (r *changesetResolver) Events(ctx context.Context, args *graphqlbackend.ChangesetEventsConnectionArgs) (graphqlbackend.ChangesetEventsConnectionResolver, error)</a>

```
searchKey: resolvers.changesetResolver.Events
```

```Go
func (r *changesetResolver) Events(ctx context.Context, args *graphqlbackend.ChangesetEventsConnectionArgs) (graphqlbackend.ChangesetEventsConnectionResolver, error)
```

#### <a id="changesetResolver.Diff" href="#changesetResolver.Diff">func (r *changesetResolver) Diff(ctx context.Context) (graphqlbackend.RepositoryComparisonInterface, error)</a>

```
searchKey: resolvers.changesetResolver.Diff
```

```Go
func (r *changesetResolver) Diff(ctx context.Context) (graphqlbackend.RepositoryComparisonInterface, error)
```

#### <a id="changesetResolver.DiffStat" href="#changesetResolver.DiffStat">func (r *changesetResolver) DiffStat(ctx context.Context) (*graphqlbackend.DiffStat, error)</a>

```
searchKey: resolvers.changesetResolver.DiffStat
```

```Go
func (r *changesetResolver) DiffStat(ctx context.Context) (*graphqlbackend.DiffStat, error)
```

### <a id="changesetLabelResolver" href="#changesetLabelResolver">type changesetLabelResolver struct</a>

```
searchKey: resolvers.changesetLabelResolver
```

```Go
type changesetLabelResolver struct {
	label btypes.ChangesetLabel
}
```

#### <a id="changesetLabelResolver.Text" href="#changesetLabelResolver.Text">func (r *changesetLabelResolver) Text() string</a>

```
searchKey: resolvers.changesetLabelResolver.Text
```

```Go
func (r *changesetLabelResolver) Text() string
```

#### <a id="changesetLabelResolver.Color" href="#changesetLabelResolver.Color">func (r *changesetLabelResolver) Color() string</a>

```
searchKey: resolvers.changesetLabelResolver.Color
```

```Go
func (r *changesetLabelResolver) Color() string
```

#### <a id="changesetLabelResolver.Description" href="#changesetLabelResolver.Description">func (r *changesetLabelResolver) Description() *string</a>

```
searchKey: resolvers.changesetLabelResolver.Description
```

```Go
func (r *changesetLabelResolver) Description() *string
```

### <a id="changesetApplyPreviewResolver" href="#changesetApplyPreviewResolver">type changesetApplyPreviewResolver struct</a>

```
searchKey: resolvers.changesetApplyPreviewResolver
```

```Go
type changesetApplyPreviewResolver struct {
	store *store.Store

	mapping              *btypes.RewirerMapping
	preloadedNextSync    time.Time
	preloadedBatchChange *btypes.BatchChange
	batchSpecID          int64
}
```

#### <a id="changesetApplyPreviewResolver.repoAccessible" href="#changesetApplyPreviewResolver.repoAccessible">func (r *changesetApplyPreviewResolver) repoAccessible() bool</a>

```
searchKey: resolvers.changesetApplyPreviewResolver.repoAccessible
```

```Go
func (r *changesetApplyPreviewResolver) repoAccessible() bool
```

#### <a id="changesetApplyPreviewResolver.ToVisibleChangesetApplyPreview" href="#changesetApplyPreviewResolver.ToVisibleChangesetApplyPreview">func (r *changesetApplyPreviewResolver) ToVisibleChangesetApplyPreview() (graphqlbackend.VisibleChangesetApplyPreviewResolver, bool)</a>

```
searchKey: resolvers.changesetApplyPreviewResolver.ToVisibleChangesetApplyPreview
```

```Go
func (r *changesetApplyPreviewResolver) ToVisibleChangesetApplyPreview() (graphqlbackend.VisibleChangesetApplyPreviewResolver, bool)
```

#### <a id="changesetApplyPreviewResolver.ToHiddenChangesetApplyPreview" href="#changesetApplyPreviewResolver.ToHiddenChangesetApplyPreview">func (r *changesetApplyPreviewResolver) ToHiddenChangesetApplyPreview() (graphqlbackend.HiddenChangesetApplyPreviewResolver, bool)</a>

```
searchKey: resolvers.changesetApplyPreviewResolver.ToHiddenChangesetApplyPreview
```

```Go
func (r *changesetApplyPreviewResolver) ToHiddenChangesetApplyPreview() (graphqlbackend.HiddenChangesetApplyPreviewResolver, bool)
```

### <a id="hiddenChangesetApplyPreviewResolver" href="#hiddenChangesetApplyPreviewResolver">type hiddenChangesetApplyPreviewResolver struct</a>

```
searchKey: resolvers.hiddenChangesetApplyPreviewResolver
```

```Go
type hiddenChangesetApplyPreviewResolver struct {
	store *store.Store

	mapping           *btypes.RewirerMapping
	preloadedNextSync time.Time
}
```

#### <a id="hiddenChangesetApplyPreviewResolver.Operations" href="#hiddenChangesetApplyPreviewResolver.Operations">func (r *hiddenChangesetApplyPreviewResolver) Operations(ctx context.Context) ([]string, error)</a>

```
searchKey: resolvers.hiddenChangesetApplyPreviewResolver.Operations
```

```Go
func (r *hiddenChangesetApplyPreviewResolver) Operations(ctx context.Context) ([]string, error)
```

#### <a id="hiddenChangesetApplyPreviewResolver.Delta" href="#hiddenChangesetApplyPreviewResolver.Delta">func (r *hiddenChangesetApplyPreviewResolver) Delta(ctx context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)</a>

```
searchKey: resolvers.hiddenChangesetApplyPreviewResolver.Delta
```

```Go
func (r *hiddenChangesetApplyPreviewResolver) Delta(ctx context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)
```

#### <a id="hiddenChangesetApplyPreviewResolver.Targets" href="#hiddenChangesetApplyPreviewResolver.Targets">func (r *hiddenChangesetApplyPreviewResolver) Targets() graphqlbackend.HiddenApplyPreviewTargetsResolver</a>

```
searchKey: resolvers.hiddenChangesetApplyPreviewResolver.Targets
```

```Go
func (r *hiddenChangesetApplyPreviewResolver) Targets() graphqlbackend.HiddenApplyPreviewTargetsResolver
```

### <a id="hiddenApplyPreviewTargetsResolver" href="#hiddenApplyPreviewTargetsResolver">type hiddenApplyPreviewTargetsResolver struct</a>

```
searchKey: resolvers.hiddenApplyPreviewTargetsResolver
```

```Go
type hiddenApplyPreviewTargetsResolver struct {
	store *store.Store

	mapping           *btypes.RewirerMapping
	preloadedNextSync time.Time
}
```

#### <a id="hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsAttach" href="#hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsAttach">func (r *hiddenApplyPreviewTargetsResolver) ToHiddenApplyPreviewTargetsAttach() (graphqlbackend.HiddenApplyPreviewTargetsAttachResolver, bool)</a>

```
searchKey: resolvers.hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsAttach
```

```Go
func (r *hiddenApplyPreviewTargetsResolver) ToHiddenApplyPreviewTargetsAttach() (graphqlbackend.HiddenApplyPreviewTargetsAttachResolver, bool)
```

#### <a id="hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsUpdate" href="#hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsUpdate">func (r *hiddenApplyPreviewTargetsResolver) ToHiddenApplyPreviewTargetsUpdate() (graphqlbackend.HiddenApplyPreviewTargetsUpdateResolver, bool)</a>

```
searchKey: resolvers.hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsUpdate
```

```Go
func (r *hiddenApplyPreviewTargetsResolver) ToHiddenApplyPreviewTargetsUpdate() (graphqlbackend.HiddenApplyPreviewTargetsUpdateResolver, bool)
```

#### <a id="hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsDetach" href="#hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsDetach">func (r *hiddenApplyPreviewTargetsResolver) ToHiddenApplyPreviewTargetsDetach() (graphqlbackend.HiddenApplyPreviewTargetsDetachResolver, bool)</a>

```
searchKey: resolvers.hiddenApplyPreviewTargetsResolver.ToHiddenApplyPreviewTargetsDetach
```

```Go
func (r *hiddenApplyPreviewTargetsResolver) ToHiddenApplyPreviewTargetsDetach() (graphqlbackend.HiddenApplyPreviewTargetsDetachResolver, bool)
```

#### <a id="hiddenApplyPreviewTargetsResolver.ChangesetSpec" href="#hiddenApplyPreviewTargetsResolver.ChangesetSpec">func (r *hiddenApplyPreviewTargetsResolver) ChangesetSpec(ctx context.Context) (graphqlbackend.HiddenChangesetSpecResolver, error)</a>

```
searchKey: resolvers.hiddenApplyPreviewTargetsResolver.ChangesetSpec
```

```Go
func (r *hiddenApplyPreviewTargetsResolver) ChangesetSpec(ctx context.Context) (graphqlbackend.HiddenChangesetSpecResolver, error)
```

#### <a id="hiddenApplyPreviewTargetsResolver.Changeset" href="#hiddenApplyPreviewTargetsResolver.Changeset">func (r *hiddenApplyPreviewTargetsResolver) Changeset(ctx context.Context) (graphqlbackend.HiddenExternalChangesetResolver, error)</a>

```
searchKey: resolvers.hiddenApplyPreviewTargetsResolver.Changeset
```

```Go
func (r *hiddenApplyPreviewTargetsResolver) Changeset(ctx context.Context) (graphqlbackend.HiddenExternalChangesetResolver, error)
```

### <a id="visibleChangesetApplyPreviewResolver" href="#visibleChangesetApplyPreviewResolver">type visibleChangesetApplyPreviewResolver struct</a>

```
searchKey: resolvers.visibleChangesetApplyPreviewResolver
```

```Go
type visibleChangesetApplyPreviewResolver struct {
	store *store.Store

	mapping              *btypes.RewirerMapping
	preloadedNextSync    time.Time
	preloadedBatchChange *btypes.BatchChange
	batchSpecID          int64

	planOnce sync.Once
	plan     *reconciler.Plan
	planErr  error

	batchChangeOnce sync.Once
	batchChange     *btypes.BatchChange
	batchChangeErr  error
}
```

#### <a id="visibleChangesetApplyPreviewResolver.Operations" href="#visibleChangesetApplyPreviewResolver.Operations">func (r *visibleChangesetApplyPreviewResolver) Operations(ctx context.Context) ([]string, error)</a>

```
searchKey: resolvers.visibleChangesetApplyPreviewResolver.Operations
```

```Go
func (r *visibleChangesetApplyPreviewResolver) Operations(ctx context.Context) ([]string, error)
```

#### <a id="visibleChangesetApplyPreviewResolver.Delta" href="#visibleChangesetApplyPreviewResolver.Delta">func (r *visibleChangesetApplyPreviewResolver) Delta(ctx context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)</a>

```
searchKey: resolvers.visibleChangesetApplyPreviewResolver.Delta
```

```Go
func (r *visibleChangesetApplyPreviewResolver) Delta(ctx context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)
```

#### <a id="visibleChangesetApplyPreviewResolver.Targets" href="#visibleChangesetApplyPreviewResolver.Targets">func (r *visibleChangesetApplyPreviewResolver) Targets() graphqlbackend.VisibleApplyPreviewTargetsResolver</a>

```
searchKey: resolvers.visibleChangesetApplyPreviewResolver.Targets
```

```Go
func (r *visibleChangesetApplyPreviewResolver) Targets() graphqlbackend.VisibleApplyPreviewTargetsResolver
```

#### <a id="visibleChangesetApplyPreviewResolver.computePlan" href="#visibleChangesetApplyPreviewResolver.computePlan">func (r *visibleChangesetApplyPreviewResolver) computePlan(ctx context.Context) (*reconciler.Plan, error)</a>

```
searchKey: resolvers.visibleChangesetApplyPreviewResolver.computePlan
```

```Go
func (r *visibleChangesetApplyPreviewResolver) computePlan(ctx context.Context) (*reconciler.Plan, error)
```

#### <a id="visibleChangesetApplyPreviewResolver.computeBatchChange" href="#visibleChangesetApplyPreviewResolver.computeBatchChange">func (r *visibleChangesetApplyPreviewResolver) computeBatchChange(ctx context.Context) (*btypes.BatchChange, error)</a>

```
searchKey: resolvers.visibleChangesetApplyPreviewResolver.computeBatchChange
```

```Go
func (r *visibleChangesetApplyPreviewResolver) computeBatchChange(ctx context.Context) (*btypes.BatchChange, error)
```

### <a id="visibleApplyPreviewTargetsResolver" href="#visibleApplyPreviewTargetsResolver">type visibleApplyPreviewTargetsResolver struct</a>

```
searchKey: resolvers.visibleApplyPreviewTargetsResolver
```

```Go
type visibleApplyPreviewTargetsResolver struct {
	store *store.Store

	mapping           *btypes.RewirerMapping
	preloadedNextSync time.Time
}
```

#### <a id="visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsAttach" href="#visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsAttach">func (r *visibleApplyPreviewTargetsResolver) ToVisibleApplyPreviewTargetsAttach() (graphqlbackend.VisibleApplyPreviewTargetsAttachResolver, bool)</a>

```
searchKey: resolvers.visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsAttach
```

```Go
func (r *visibleApplyPreviewTargetsResolver) ToVisibleApplyPreviewTargetsAttach() (graphqlbackend.VisibleApplyPreviewTargetsAttachResolver, bool)
```

#### <a id="visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsUpdate" href="#visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsUpdate">func (r *visibleApplyPreviewTargetsResolver) ToVisibleApplyPreviewTargetsUpdate() (graphqlbackend.VisibleApplyPreviewTargetsUpdateResolver, bool)</a>

```
searchKey: resolvers.visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsUpdate
```

```Go
func (r *visibleApplyPreviewTargetsResolver) ToVisibleApplyPreviewTargetsUpdate() (graphqlbackend.VisibleApplyPreviewTargetsUpdateResolver, bool)
```

#### <a id="visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsDetach" href="#visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsDetach">func (r *visibleApplyPreviewTargetsResolver) ToVisibleApplyPreviewTargetsDetach() (graphqlbackend.VisibleApplyPreviewTargetsDetachResolver, bool)</a>

```
searchKey: resolvers.visibleApplyPreviewTargetsResolver.ToVisibleApplyPreviewTargetsDetach
```

```Go
func (r *visibleApplyPreviewTargetsResolver) ToVisibleApplyPreviewTargetsDetach() (graphqlbackend.VisibleApplyPreviewTargetsDetachResolver, bool)
```

#### <a id="visibleApplyPreviewTargetsResolver.ChangesetSpec" href="#visibleApplyPreviewTargetsResolver.ChangesetSpec">func (r *visibleApplyPreviewTargetsResolver) ChangesetSpec(ctx context.Context) (graphqlbackend.VisibleChangesetSpecResolver, error)</a>

```
searchKey: resolvers.visibleApplyPreviewTargetsResolver.ChangesetSpec
```

```Go
func (r *visibleApplyPreviewTargetsResolver) ChangesetSpec(ctx context.Context) (graphqlbackend.VisibleChangesetSpecResolver, error)
```

#### <a id="visibleApplyPreviewTargetsResolver.Changeset" href="#visibleApplyPreviewTargetsResolver.Changeset">func (r *visibleApplyPreviewTargetsResolver) Changeset(ctx context.Context) (graphqlbackend.ExternalChangesetResolver, error)</a>

```
searchKey: resolvers.visibleApplyPreviewTargetsResolver.Changeset
```

```Go
func (r *visibleApplyPreviewTargetsResolver) Changeset(ctx context.Context) (graphqlbackend.ExternalChangesetResolver, error)
```

### <a id="changesetSpecDeltaResolver" href="#changesetSpecDeltaResolver">type changesetSpecDeltaResolver struct</a>

```
searchKey: resolvers.changesetSpecDeltaResolver
```

```Go
type changesetSpecDeltaResolver struct {
	delta reconciler.ChangesetSpecDelta
}
```

#### <a id="changesetSpecDeltaResolver.TitleChanged" href="#changesetSpecDeltaResolver.TitleChanged">func (c *changesetSpecDeltaResolver) TitleChanged() bool</a>

```
searchKey: resolvers.changesetSpecDeltaResolver.TitleChanged
```

```Go
func (c *changesetSpecDeltaResolver) TitleChanged() bool
```

#### <a id="changesetSpecDeltaResolver.BodyChanged" href="#changesetSpecDeltaResolver.BodyChanged">func (c *changesetSpecDeltaResolver) BodyChanged() bool</a>

```
searchKey: resolvers.changesetSpecDeltaResolver.BodyChanged
```

```Go
func (c *changesetSpecDeltaResolver) BodyChanged() bool
```

#### <a id="changesetSpecDeltaResolver.Undraft" href="#changesetSpecDeltaResolver.Undraft">func (c *changesetSpecDeltaResolver) Undraft() bool</a>

```
searchKey: resolvers.changesetSpecDeltaResolver.Undraft
```

```Go
func (c *changesetSpecDeltaResolver) Undraft() bool
```

#### <a id="changesetSpecDeltaResolver.BaseRefChanged" href="#changesetSpecDeltaResolver.BaseRefChanged">func (c *changesetSpecDeltaResolver) BaseRefChanged() bool</a>

```
searchKey: resolvers.changesetSpecDeltaResolver.BaseRefChanged
```

```Go
func (c *changesetSpecDeltaResolver) BaseRefChanged() bool
```

#### <a id="changesetSpecDeltaResolver.DiffChanged" href="#changesetSpecDeltaResolver.DiffChanged">func (c *changesetSpecDeltaResolver) DiffChanged() bool</a>

```
searchKey: resolvers.changesetSpecDeltaResolver.DiffChanged
```

```Go
func (c *changesetSpecDeltaResolver) DiffChanged() bool
```

#### <a id="changesetSpecDeltaResolver.CommitMessageChanged" href="#changesetSpecDeltaResolver.CommitMessageChanged">func (c *changesetSpecDeltaResolver) CommitMessageChanged() bool</a>

```
searchKey: resolvers.changesetSpecDeltaResolver.CommitMessageChanged
```

```Go
func (c *changesetSpecDeltaResolver) CommitMessageChanged() bool
```

#### <a id="changesetSpecDeltaResolver.AuthorNameChanged" href="#changesetSpecDeltaResolver.AuthorNameChanged">func (c *changesetSpecDeltaResolver) AuthorNameChanged() bool</a>

```
searchKey: resolvers.changesetSpecDeltaResolver.AuthorNameChanged
```

```Go
func (c *changesetSpecDeltaResolver) AuthorNameChanged() bool
```

#### <a id="changesetSpecDeltaResolver.AuthorEmailChanged" href="#changesetSpecDeltaResolver.AuthorEmailChanged">func (c *changesetSpecDeltaResolver) AuthorEmailChanged() bool</a>

```
searchKey: resolvers.changesetSpecDeltaResolver.AuthorEmailChanged
```

```Go
func (c *changesetSpecDeltaResolver) AuthorEmailChanged() bool
```

### <a id="changesetApplyPreviewConnectionResolver" href="#changesetApplyPreviewConnectionResolver">type changesetApplyPreviewConnectionResolver struct</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionResolver
```

```Go
type changesetApplyPreviewConnectionResolver struct {
	store *store.Store

	opts        store.GetRewirerMappingsOpts
	action      *btypes.ReconcilerOperation
	batchSpecID int64

	once     sync.Once
	mappings *rewirerMappingsFacade
	err      error
}
```

#### <a id="changesetApplyPreviewConnectionResolver.TotalCount" href="#changesetApplyPreviewConnectionResolver.TotalCount">func (r *changesetApplyPreviewConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionResolver.TotalCount
```

```Go
func (r *changesetApplyPreviewConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="changesetApplyPreviewConnectionResolver.PageInfo" href="#changesetApplyPreviewConnectionResolver.PageInfo">func (r *changesetApplyPreviewConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionResolver.PageInfo
```

```Go
func (r *changesetApplyPreviewConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="changesetApplyPreviewConnectionResolver.Nodes" href="#changesetApplyPreviewConnectionResolver.Nodes">func (r *changesetApplyPreviewConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetApplyPreviewResolver, error)</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionResolver.Nodes
```

```Go
func (r *changesetApplyPreviewConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetApplyPreviewResolver, error)
```

#### <a id="changesetApplyPreviewConnectionResolver.Stats" href="#changesetApplyPreviewConnectionResolver.Stats">func (r *changesetApplyPreviewConnectionResolver) Stats(ctx context.Context) (graphqlbackend.ChangesetApplyPreviewConnectionStatsResolver, error)</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionResolver.Stats
```

```Go
func (r *changesetApplyPreviewConnectionResolver) Stats(ctx context.Context) (graphqlbackend.ChangesetApplyPreviewConnectionStatsResolver, error)
```

#### <a id="changesetApplyPreviewConnectionResolver.compute" href="#changesetApplyPreviewConnectionResolver.compute">func (r *changesetApplyPreviewConnectionResolver) compute(ctx context.Context) (*rewirerMappingsFacade, error)</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionResolver.compute
```

```Go
func (r *changesetApplyPreviewConnectionResolver) compute(ctx context.Context) (*rewirerMappingsFacade, error)
```

### <a id="changesetApplyPreviewConnectionStatsResolver" href="#changesetApplyPreviewConnectionStatsResolver">type changesetApplyPreviewConnectionStatsResolver struct</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver
```

```Go
type changesetApplyPreviewConnectionStatsResolver struct {
	push         int32
	update       int32
	undraft      int32
	publish      int32
	publishDraft int32
	sync         int32
	_import      int32
	close        int32
	reopen       int32
	sleep        int32
	detach       int32
	archive      int32

	added    int32
	modified int32
	removed  int32
}
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Push" href="#changesetApplyPreviewConnectionStatsResolver.Push">func (r *changesetApplyPreviewConnectionStatsResolver) Push() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Push
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Push() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Update" href="#changesetApplyPreviewConnectionStatsResolver.Update">func (r *changesetApplyPreviewConnectionStatsResolver) Update() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Update
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Update() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Undraft" href="#changesetApplyPreviewConnectionStatsResolver.Undraft">func (r *changesetApplyPreviewConnectionStatsResolver) Undraft() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Undraft
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Undraft() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Publish" href="#changesetApplyPreviewConnectionStatsResolver.Publish">func (r *changesetApplyPreviewConnectionStatsResolver) Publish() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Publish
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Publish() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.PublishDraft" href="#changesetApplyPreviewConnectionStatsResolver.PublishDraft">func (r *changesetApplyPreviewConnectionStatsResolver) PublishDraft() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.PublishDraft
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) PublishDraft() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Sync" href="#changesetApplyPreviewConnectionStatsResolver.Sync">func (r *changesetApplyPreviewConnectionStatsResolver) Sync() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Sync
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Sync() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Import" href="#changesetApplyPreviewConnectionStatsResolver.Import">func (r *changesetApplyPreviewConnectionStatsResolver) Import() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Import
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Import() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Close" href="#changesetApplyPreviewConnectionStatsResolver.Close">func (r *changesetApplyPreviewConnectionStatsResolver) Close() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Close
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Close() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Reopen" href="#changesetApplyPreviewConnectionStatsResolver.Reopen">func (r *changesetApplyPreviewConnectionStatsResolver) Reopen() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Reopen
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Reopen() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Sleep" href="#changesetApplyPreviewConnectionStatsResolver.Sleep">func (r *changesetApplyPreviewConnectionStatsResolver) Sleep() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Sleep
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Sleep() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Detach" href="#changesetApplyPreviewConnectionStatsResolver.Detach">func (r *changesetApplyPreviewConnectionStatsResolver) Detach() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Detach
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Detach() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Archive" href="#changesetApplyPreviewConnectionStatsResolver.Archive">func (r *changesetApplyPreviewConnectionStatsResolver) Archive() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Archive
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Archive() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Added" href="#changesetApplyPreviewConnectionStatsResolver.Added">func (r *changesetApplyPreviewConnectionStatsResolver) Added() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Added
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Added() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Modified" href="#changesetApplyPreviewConnectionStatsResolver.Modified">func (r *changesetApplyPreviewConnectionStatsResolver) Modified() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Modified
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Modified() int32
```

#### <a id="changesetApplyPreviewConnectionStatsResolver.Removed" href="#changesetApplyPreviewConnectionStatsResolver.Removed">func (r *changesetApplyPreviewConnectionStatsResolver) Removed() int32</a>

```
searchKey: resolvers.changesetApplyPreviewConnectionStatsResolver.Removed
```

```Go
func (r *changesetApplyPreviewConnectionStatsResolver) Removed() int32
```

### <a id="rewirerMappingsFacade" href="#rewirerMappingsFacade">type rewirerMappingsFacade struct</a>

```
searchKey: resolvers.rewirerMappingsFacade
```

```Go
type rewirerMappingsFacade struct {
	All btypes.RewirerMappings

	// Inputs from outside the resolver that we need to build other resolvers.
	batchSpecID int64
	store       *store.Store

	// This field is set when ReconcileBatchChange is called.
	batchChange *btypes.BatchChange

	// Cache of filtered pages.
	pagesMu sync.Mutex
	pages   map[rewirerMappingPageOpts]*rewirerMappingPage

	// Cache of rewirer mapping resolvers.
	resolversMu sync.Mutex
	resolvers   map[*btypes.RewirerMapping]graphqlbackend.ChangesetApplyPreviewResolver
}
```

rewirerMappingsFacade wraps btypes.RewirerMappings to provide memoised pagination and filtering functionality. 

#### <a id="newRewirerMappingsFacade" href="#newRewirerMappingsFacade">func newRewirerMappingsFacade(s *store.Store, batchSpecID int64) *rewirerMappingsFacade</a>

```
searchKey: resolvers.newRewirerMappingsFacade
```

```Go
func newRewirerMappingsFacade(s *store.Store, batchSpecID int64) *rewirerMappingsFacade
```

newRewirerMappingsFacade creates a new rewirer mappings object, which includes dry running the batch change reconciliation. 

#### <a id="rewirerMappingsFacade.compute" href="#rewirerMappingsFacade.compute">func (rmf *rewirerMappingsFacade) compute(ctx context.Context, opts store.GetRewirerMappingsOpts) error</a>

```
searchKey: resolvers.rewirerMappingsFacade.compute
```

```Go
func (rmf *rewirerMappingsFacade) compute(ctx context.Context, opts store.GetRewirerMappingsOpts) error
```

#### <a id="rewirerMappingsFacade.Page" href="#rewirerMappingsFacade.Page">func (rmf *rewirerMappingsFacade) Page(ctx context.Context, opts rewirerMappingPageOpts) (*rewirerMappingPage, error)</a>

```
searchKey: resolvers.rewirerMappingsFacade.Page
```

```Go
func (rmf *rewirerMappingsFacade) Page(ctx context.Context, opts rewirerMappingPageOpts) (*rewirerMappingPage, error)
```

Page applies the given filter, and paginates the results. 

#### <a id="rewirerMappingsFacade.Resolver" href="#rewirerMappingsFacade.Resolver">func (rmf *rewirerMappingsFacade) Resolver(mapping *btypes.RewirerMapping) graphqlbackend.ChangesetApplyPreviewResolver</a>

```
searchKey: resolvers.rewirerMappingsFacade.Resolver
```

```Go
func (rmf *rewirerMappingsFacade) Resolver(mapping *btypes.RewirerMapping) graphqlbackend.ChangesetApplyPreviewResolver
```

#### <a id="rewirerMappingsFacade.ResolverWithNextSync" href="#rewirerMappingsFacade.ResolverWithNextSync">func (rmf *rewirerMappingsFacade) ResolverWithNextSync(mapping *btypes.RewirerMapping, nextSync time.Time) graphqlbackend.ChangesetApplyPreviewResolver</a>

```
searchKey: resolvers.rewirerMappingsFacade.ResolverWithNextSync
```

```Go
func (rmf *rewirerMappingsFacade) ResolverWithNextSync(mapping *btypes.RewirerMapping, nextSync time.Time) graphqlbackend.ChangesetApplyPreviewResolver
```

### <a id="rewirerMappingPageOpts" href="#rewirerMappingPageOpts">type rewirerMappingPageOpts struct</a>

```
searchKey: resolvers.rewirerMappingPageOpts
```

```Go
type rewirerMappingPageOpts struct {
	*database.LimitOffset
	Op *btypes.ReconcilerOperation
}
```

### <a id="rewirerMappingPage" href="#rewirerMappingPage">type rewirerMappingPage struct</a>

```
searchKey: resolvers.rewirerMappingPage
```

```Go
type rewirerMappingPage struct {
	Mappings btypes.RewirerMappings

	// TotalCount represents the total count of filtered results, but not
	// necessarily the full set of results.
	TotalCount int
}
```

### <a id="changesetsConnectionResolver" href="#changesetsConnectionResolver">type changesetsConnectionResolver struct</a>

```
searchKey: resolvers.changesetsConnectionResolver
```

```Go
type changesetsConnectionResolver struct {
	store *store.Store

	opts store.ListChangesetsOpts
	// 🚨 SECURITY: If the given opts do not reveal hidden information about a
	// changeset by including the changeset in the result set, this should be
	// set to true.
	optsSafe bool

	once sync.Once
	// changesets contains all changesets in this connection.
	changesets btypes.Changesets
	next       int64
	err        error
}
```

#### <a id="changesetsConnectionResolver.Nodes" href="#changesetsConnectionResolver.Nodes">func (r *changesetsConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetResolver, error)</a>

```
searchKey: resolvers.changesetsConnectionResolver.Nodes
```

```Go
func (r *changesetsConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetResolver, error)
```

#### <a id="changesetsConnectionResolver.TotalCount" href="#changesetsConnectionResolver.TotalCount">func (r *changesetsConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.changesetsConnectionResolver.TotalCount
```

```Go
func (r *changesetsConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="changesetsConnectionResolver.compute" href="#changesetsConnectionResolver.compute">func (r *changesetsConnectionResolver) compute(ctx context.Context) (cs btypes.Changesets, next int64, err error)</a>

```
searchKey: resolvers.changesetsConnectionResolver.compute
```

```Go
func (r *changesetsConnectionResolver) compute(ctx context.Context) (cs btypes.Changesets, next int64, err error)
```

compute loads all changesets matched by r.opts. If r.optsSafe is true, it returns all of them. If not, it filters out the ones to which the user doesn't have access by using the authz filter. 

#### <a id="changesetsConnectionResolver.PageInfo" href="#changesetsConnectionResolver.PageInfo">func (r *changesetsConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.changesetsConnectionResolver.PageInfo
```

```Go
func (r *changesetsConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="changesetCountsResolver" href="#changesetCountsResolver">type changesetCountsResolver struct</a>

```
searchKey: resolvers.changesetCountsResolver
```

```Go
type changesetCountsResolver struct {
	counts *state.ChangesetCounts
}
```

#### <a id="changesetCountsResolver.Date" href="#changesetCountsResolver.Date">func (r *changesetCountsResolver) Date() graphqlbackend.DateTime</a>

```
searchKey: resolvers.changesetCountsResolver.Date
```

```Go
func (r *changesetCountsResolver) Date() graphqlbackend.DateTime
```

#### <a id="changesetCountsResolver.Total" href="#changesetCountsResolver.Total">func (r *changesetCountsResolver) Total() int32</a>

```
searchKey: resolvers.changesetCountsResolver.Total
```

```Go
func (r *changesetCountsResolver) Total() int32
```

#### <a id="changesetCountsResolver.Merged" href="#changesetCountsResolver.Merged">func (r *changesetCountsResolver) Merged() int32</a>

```
searchKey: resolvers.changesetCountsResolver.Merged
```

```Go
func (r *changesetCountsResolver) Merged() int32
```

#### <a id="changesetCountsResolver.Closed" href="#changesetCountsResolver.Closed">func (r *changesetCountsResolver) Closed() int32</a>

```
searchKey: resolvers.changesetCountsResolver.Closed
```

```Go
func (r *changesetCountsResolver) Closed() int32
```

#### <a id="changesetCountsResolver.Draft" href="#changesetCountsResolver.Draft">func (r *changesetCountsResolver) Draft() int32</a>

```
searchKey: resolvers.changesetCountsResolver.Draft
```

```Go
func (r *changesetCountsResolver) Draft() int32
```

#### <a id="changesetCountsResolver.Open" href="#changesetCountsResolver.Open">func (r *changesetCountsResolver) Open() int32</a>

```
searchKey: resolvers.changesetCountsResolver.Open
```

```Go
func (r *changesetCountsResolver) Open() int32
```

#### <a id="changesetCountsResolver.OpenApproved" href="#changesetCountsResolver.OpenApproved">func (r *changesetCountsResolver) OpenApproved() int32</a>

```
searchKey: resolvers.changesetCountsResolver.OpenApproved
```

```Go
func (r *changesetCountsResolver) OpenApproved() int32
```

#### <a id="changesetCountsResolver.OpenChangesRequested" href="#changesetCountsResolver.OpenChangesRequested">func (r *changesetCountsResolver) OpenChangesRequested() int32</a>

```
searchKey: resolvers.changesetCountsResolver.OpenChangesRequested
```

```Go
func (r *changesetCountsResolver) OpenChangesRequested() int32
```

#### <a id="changesetCountsResolver.OpenPending" href="#changesetCountsResolver.OpenPending">func (r *changesetCountsResolver) OpenPending() int32</a>

```
searchKey: resolvers.changesetCountsResolver.OpenPending
```

```Go
func (r *changesetCountsResolver) OpenPending() int32
```

### <a id="changesetEventResolver" href="#changesetEventResolver">type changesetEventResolver struct</a>

```
searchKey: resolvers.changesetEventResolver
```

```Go
type changesetEventResolver struct {
	store             *store.Store
	changesetResolver *changesetResolver
	*btypes.ChangesetEvent
}
```

#### <a id="changesetEventResolver.ID" href="#changesetEventResolver.ID">func (r *changesetEventResolver) ID() graphql.ID</a>

```
searchKey: resolvers.changesetEventResolver.ID
```

```Go
func (r *changesetEventResolver) ID() graphql.ID
```

#### <a id="changesetEventResolver.CreatedAt" href="#changesetEventResolver.CreatedAt">func (r *changesetEventResolver) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.changesetEventResolver.CreatedAt
```

```Go
func (r *changesetEventResolver) CreatedAt() graphqlbackend.DateTime
```

#### <a id="changesetEventResolver.Changeset" href="#changesetEventResolver.Changeset">func (r *changesetEventResolver) Changeset() graphqlbackend.ExternalChangesetResolver</a>

```
searchKey: resolvers.changesetEventResolver.Changeset
```

```Go
func (r *changesetEventResolver) Changeset() graphqlbackend.ExternalChangesetResolver
```

### <a id="changesetEventsConnectionResolver" href="#changesetEventsConnectionResolver">type changesetEventsConnectionResolver struct</a>

```
searchKey: resolvers.changesetEventsConnectionResolver
```

```Go
type changesetEventsConnectionResolver struct {
	store             *store.Store
	changesetResolver *changesetResolver
	first             int
	cursor            int64

	// cache results because they are used by multiple fields
	once            sync.Once
	changesetEvents []*btypes.ChangesetEvent
	next            int64
	err             error
}
```

#### <a id="changesetEventsConnectionResolver.Nodes" href="#changesetEventsConnectionResolver.Nodes">func (r *changesetEventsConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetEventResolver, error)</a>

```
searchKey: resolvers.changesetEventsConnectionResolver.Nodes
```

```Go
func (r *changesetEventsConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetEventResolver, error)
```

#### <a id="changesetEventsConnectionResolver.TotalCount" href="#changesetEventsConnectionResolver.TotalCount">func (r *changesetEventsConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.changesetEventsConnectionResolver.TotalCount
```

```Go
func (r *changesetEventsConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="changesetEventsConnectionResolver.PageInfo" href="#changesetEventsConnectionResolver.PageInfo">func (r *changesetEventsConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.changesetEventsConnectionResolver.PageInfo
```

```Go
func (r *changesetEventsConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="changesetEventsConnectionResolver.compute" href="#changesetEventsConnectionResolver.compute">func (r *changesetEventsConnectionResolver) compute(ctx context.Context) ([]*btypes.ChangesetEvent, int64, error)</a>

```
searchKey: resolvers.changesetEventsConnectionResolver.compute
```

```Go
func (r *changesetEventsConnectionResolver) compute(ctx context.Context) ([]*btypes.ChangesetEvent, int64, error)
```

### <a id="changesetJobErrorResolver" href="#changesetJobErrorResolver">type changesetJobErrorResolver struct</a>

```
searchKey: resolvers.changesetJobErrorResolver
```

```Go
type changesetJobErrorResolver struct {
	store     *store.Store
	changeset *btypes.Changeset
	repo      *types.Repo
	error     string
}
```

#### <a id="changesetJobErrorResolver.Changeset" href="#changesetJobErrorResolver.Changeset">func (r *changesetJobErrorResolver) Changeset() graphqlbackend.ChangesetResolver</a>

```
searchKey: resolvers.changesetJobErrorResolver.Changeset
```

```Go
func (r *changesetJobErrorResolver) Changeset() graphqlbackend.ChangesetResolver
```

#### <a id="changesetJobErrorResolver.Error" href="#changesetJobErrorResolver.Error">func (r *changesetJobErrorResolver) Error() *string</a>

```
searchKey: resolvers.changesetJobErrorResolver.Error
```

```Go
func (r *changesetJobErrorResolver) Error() *string
```

### <a id="changesetSpecResolver" href="#changesetSpecResolver">type changesetSpecResolver struct</a>

```
searchKey: resolvers.changesetSpecResolver
```

```Go
type changesetSpecResolver struct {
	store *store.Store

	changesetSpec *btypes.ChangesetSpec

	repo *types.Repo
}
```

#### <a id="NewChangesetSpecResolver" href="#NewChangesetSpecResolver">func NewChangesetSpecResolver(ctx context.Context, store *store.Store, changesetSpec *btypes.ChangesetSpec) (*changesetSpecResolver, error)</a>

```
searchKey: resolvers.NewChangesetSpecResolver
tags: [exported]
```

```Go
func NewChangesetSpecResolver(ctx context.Context, store *store.Store, changesetSpec *btypes.ChangesetSpec) (*changesetSpecResolver, error)
```

#### <a id="NewChangesetSpecResolverWithRepo" href="#NewChangesetSpecResolverWithRepo">func NewChangesetSpecResolverWithRepo(store *store.Store, repo *types.Repo, changesetSpec *btypes.ChangesetSpec) *changesetSpecResolver</a>

```
searchKey: resolvers.NewChangesetSpecResolverWithRepo
tags: [exported]
```

```Go
func NewChangesetSpecResolverWithRepo(store *store.Store, repo *types.Repo, changesetSpec *btypes.ChangesetSpec) *changesetSpecResolver
```

#### <a id="changesetSpecResolver.ID" href="#changesetSpecResolver.ID">func (r *changesetSpecResolver) ID() graphql.ID</a>

```
searchKey: resolvers.changesetSpecResolver.ID
```

```Go
func (r *changesetSpecResolver) ID() graphql.ID
```

#### <a id="changesetSpecResolver.Type" href="#changesetSpecResolver.Type">func (r *changesetSpecResolver) Type() string</a>

```
searchKey: resolvers.changesetSpecResolver.Type
```

```Go
func (r *changesetSpecResolver) Type() string
```

#### <a id="changesetSpecResolver.Description" href="#changesetSpecResolver.Description">func (r *changesetSpecResolver) Description(ctx context.Context) (graphqlbackend.ChangesetDescription, error)</a>

```
searchKey: resolvers.changesetSpecResolver.Description
```

```Go
func (r *changesetSpecResolver) Description(ctx context.Context) (graphqlbackend.ChangesetDescription, error)
```

#### <a id="changesetSpecResolver.ExpiresAt" href="#changesetSpecResolver.ExpiresAt">func (r *changesetSpecResolver) ExpiresAt() *graphqlbackend.DateTime</a>

```
searchKey: resolvers.changesetSpecResolver.ExpiresAt
```

```Go
func (r *changesetSpecResolver) ExpiresAt() *graphqlbackend.DateTime
```

#### <a id="changesetSpecResolver.repoAccessible" href="#changesetSpecResolver.repoAccessible">func (r *changesetSpecResolver) repoAccessible() bool</a>

```
searchKey: resolvers.changesetSpecResolver.repoAccessible
```

```Go
func (r *changesetSpecResolver) repoAccessible() bool
```

#### <a id="changesetSpecResolver.ToHiddenChangesetSpec" href="#changesetSpecResolver.ToHiddenChangesetSpec">func (r *changesetSpecResolver) ToHiddenChangesetSpec() (graphqlbackend.HiddenChangesetSpecResolver, bool)</a>

```
searchKey: resolvers.changesetSpecResolver.ToHiddenChangesetSpec
```

```Go
func (r *changesetSpecResolver) ToHiddenChangesetSpec() (graphqlbackend.HiddenChangesetSpecResolver, bool)
```

#### <a id="changesetSpecResolver.ToVisibleChangesetSpec" href="#changesetSpecResolver.ToVisibleChangesetSpec">func (r *changesetSpecResolver) ToVisibleChangesetSpec() (graphqlbackend.VisibleChangesetSpecResolver, bool)</a>

```
searchKey: resolvers.changesetSpecResolver.ToVisibleChangesetSpec
```

```Go
func (r *changesetSpecResolver) ToVisibleChangesetSpec() (graphqlbackend.VisibleChangesetSpecResolver, bool)
```

### <a id="changesetDescriptionResolver" href="#changesetDescriptionResolver">type changesetDescriptionResolver struct</a>

```
searchKey: resolvers.changesetDescriptionResolver
```

```Go
type changesetDescriptionResolver struct {
	store        *store.Store
	repoResolver *graphqlbackend.RepositoryResolver
	desc         *btypes.ChangesetSpecDescription
	diffStat     diff.Stat
}
```

changesetDescriptionResolver implements both ChangesetDescription interfaces: ExistingChangesetReferenceResolver and GitBranchChangesetDescriptionResolver. 

#### <a id="changesetDescriptionResolver.ToExistingChangesetReference" href="#changesetDescriptionResolver.ToExistingChangesetReference">func (r *changesetDescriptionResolver) ToExistingChangesetReference() (graphqlbackend.ExistingChangesetReferenceResolver, bool)</a>

```
searchKey: resolvers.changesetDescriptionResolver.ToExistingChangesetReference
```

```Go
func (r *changesetDescriptionResolver) ToExistingChangesetReference() (graphqlbackend.ExistingChangesetReferenceResolver, bool)
```

#### <a id="changesetDescriptionResolver.ToGitBranchChangesetDescription" href="#changesetDescriptionResolver.ToGitBranchChangesetDescription">func (r *changesetDescriptionResolver) ToGitBranchChangesetDescription() (graphqlbackend.GitBranchChangesetDescriptionResolver, bool)</a>

```
searchKey: resolvers.changesetDescriptionResolver.ToGitBranchChangesetDescription
```

```Go
func (r *changesetDescriptionResolver) ToGitBranchChangesetDescription() (graphqlbackend.GitBranchChangesetDescriptionResolver, bool)
```

#### <a id="changesetDescriptionResolver.BaseRepository" href="#changesetDescriptionResolver.BaseRepository">func (r *changesetDescriptionResolver) BaseRepository() *graphqlbackend.RepositoryResolver</a>

```
searchKey: resolvers.changesetDescriptionResolver.BaseRepository
```

```Go
func (r *changesetDescriptionResolver) BaseRepository() *graphqlbackend.RepositoryResolver
```

#### <a id="changesetDescriptionResolver.ExternalID" href="#changesetDescriptionResolver.ExternalID">func (r *changesetDescriptionResolver) ExternalID() string</a>

```
searchKey: resolvers.changesetDescriptionResolver.ExternalID
```

```Go
func (r *changesetDescriptionResolver) ExternalID() string
```

#### <a id="changesetDescriptionResolver.BaseRef" href="#changesetDescriptionResolver.BaseRef">func (r *changesetDescriptionResolver) BaseRef() string</a>

```
searchKey: resolvers.changesetDescriptionResolver.BaseRef
```

```Go
func (r *changesetDescriptionResolver) BaseRef() string
```

#### <a id="changesetDescriptionResolver.BaseRev" href="#changesetDescriptionResolver.BaseRev">func (r *changesetDescriptionResolver) BaseRev() string</a>

```
searchKey: resolvers.changesetDescriptionResolver.BaseRev
```

```Go
func (r *changesetDescriptionResolver) BaseRev() string
```

#### <a id="changesetDescriptionResolver.HeadRepository" href="#changesetDescriptionResolver.HeadRepository">func (r *changesetDescriptionResolver) HeadRepository() *graphqlbackend.RepositoryResolver</a>

```
searchKey: resolvers.changesetDescriptionResolver.HeadRepository
```

```Go
func (r *changesetDescriptionResolver) HeadRepository() *graphqlbackend.RepositoryResolver
```

#### <a id="changesetDescriptionResolver.HeadRef" href="#changesetDescriptionResolver.HeadRef">func (r *changesetDescriptionResolver) HeadRef() string</a>

```
searchKey: resolvers.changesetDescriptionResolver.HeadRef
```

```Go
func (r *changesetDescriptionResolver) HeadRef() string
```

#### <a id="changesetDescriptionResolver.Title" href="#changesetDescriptionResolver.Title">func (r *changesetDescriptionResolver) Title() string</a>

```
searchKey: resolvers.changesetDescriptionResolver.Title
```

```Go
func (r *changesetDescriptionResolver) Title() string
```

#### <a id="changesetDescriptionResolver.Body" href="#changesetDescriptionResolver.Body">func (r *changesetDescriptionResolver) Body() string</a>

```
searchKey: resolvers.changesetDescriptionResolver.Body
```

```Go
func (r *changesetDescriptionResolver) Body() string
```

#### <a id="changesetDescriptionResolver.Published" href="#changesetDescriptionResolver.Published">func (r *changesetDescriptionResolver) Published() batches.PublishedValue</a>

```
searchKey: resolvers.changesetDescriptionResolver.Published
```

```Go
func (r *changesetDescriptionResolver) Published() batches.PublishedValue
```

#### <a id="changesetDescriptionResolver.DiffStat" href="#changesetDescriptionResolver.DiffStat">func (r *changesetDescriptionResolver) DiffStat() *graphqlbackend.DiffStat</a>

```
searchKey: resolvers.changesetDescriptionResolver.DiffStat
```

```Go
func (r *changesetDescriptionResolver) DiffStat() *graphqlbackend.DiffStat
```

#### <a id="changesetDescriptionResolver.Diff" href="#changesetDescriptionResolver.Diff">func (r *changesetDescriptionResolver) Diff(ctx context.Context) (graphqlbackend.PreviewRepositoryComparisonResolver, error)</a>

```
searchKey: resolvers.changesetDescriptionResolver.Diff
```

```Go
func (r *changesetDescriptionResolver) Diff(ctx context.Context) (graphqlbackend.PreviewRepositoryComparisonResolver, error)
```

#### <a id="changesetDescriptionResolver.Commits" href="#changesetDescriptionResolver.Commits">func (r *changesetDescriptionResolver) Commits() []graphqlbackend.GitCommitDescriptionResolver</a>

```
searchKey: resolvers.changesetDescriptionResolver.Commits
```

```Go
func (r *changesetDescriptionResolver) Commits() []graphqlbackend.GitCommitDescriptionResolver
```

### <a id="gitCommitDescriptionResolver" href="#gitCommitDescriptionResolver">type gitCommitDescriptionResolver struct</a>

```
searchKey: resolvers.gitCommitDescriptionResolver
```

```Go
type gitCommitDescriptionResolver struct {
	store       *store.Store
	message     string
	diff        string
	authorName  string
	authorEmail string
}
```

#### <a id="gitCommitDescriptionResolver.Author" href="#gitCommitDescriptionResolver.Author">func (r *gitCommitDescriptionResolver) Author() *graphqlbackend.PersonResolver</a>

```
searchKey: resolvers.gitCommitDescriptionResolver.Author
```

```Go
func (r *gitCommitDescriptionResolver) Author() *graphqlbackend.PersonResolver
```

#### <a id="gitCommitDescriptionResolver.Message" href="#gitCommitDescriptionResolver.Message">func (r *gitCommitDescriptionResolver) Message() string</a>

```
searchKey: resolvers.gitCommitDescriptionResolver.Message
```

```Go
func (r *gitCommitDescriptionResolver) Message() string
```

#### <a id="gitCommitDescriptionResolver.Subject" href="#gitCommitDescriptionResolver.Subject">func (r *gitCommitDescriptionResolver) Subject() string</a>

```
searchKey: resolvers.gitCommitDescriptionResolver.Subject
```

```Go
func (r *gitCommitDescriptionResolver) Subject() string
```

#### <a id="gitCommitDescriptionResolver.Body" href="#gitCommitDescriptionResolver.Body">func (r *gitCommitDescriptionResolver) Body() *string</a>

```
searchKey: resolvers.gitCommitDescriptionResolver.Body
```

```Go
func (r *gitCommitDescriptionResolver) Body() *string
```

#### <a id="gitCommitDescriptionResolver.Diff" href="#gitCommitDescriptionResolver.Diff">func (r *gitCommitDescriptionResolver) Diff() string</a>

```
searchKey: resolvers.gitCommitDescriptionResolver.Diff
```

```Go
func (r *gitCommitDescriptionResolver) Diff() string
```

### <a id="changesetSpecConnectionResolver" href="#changesetSpecConnectionResolver">type changesetSpecConnectionResolver struct</a>

```
searchKey: resolvers.changesetSpecConnectionResolver
```

```Go
type changesetSpecConnectionResolver struct {
	store *store.Store

	opts        store.ListChangesetSpecsOpts
	batchSpecID int64

	// Cache results because they are used by multiple fields
	once           sync.Once
	changesetSpecs btypes.ChangesetSpecs
	reposByID      map[api.RepoID]*types.Repo
	next           int64
	err            error
}
```

#### <a id="changesetSpecConnectionResolver.TotalCount" href="#changesetSpecConnectionResolver.TotalCount">func (r *changesetSpecConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.changesetSpecConnectionResolver.TotalCount
```

```Go
func (r *changesetSpecConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="changesetSpecConnectionResolver.PageInfo" href="#changesetSpecConnectionResolver.PageInfo">func (r *changesetSpecConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.changesetSpecConnectionResolver.PageInfo
```

```Go
func (r *changesetSpecConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="changesetSpecConnectionResolver.Nodes" href="#changesetSpecConnectionResolver.Nodes">func (r *changesetSpecConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetSpecResolver, error)</a>

```
searchKey: resolvers.changesetSpecConnectionResolver.Nodes
```

```Go
func (r *changesetSpecConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.ChangesetSpecResolver, error)
```

#### <a id="changesetSpecConnectionResolver.compute" href="#changesetSpecConnectionResolver.compute">func (r *changesetSpecConnectionResolver) compute(ctx context.Context) (btypes.ChangesetSpecs, map[api.RepoID]*types.Repo, int64, error)</a>

```
searchKey: resolvers.changesetSpecConnectionResolver.compute
```

```Go
func (r *changesetSpecConnectionResolver) compute(ctx context.Context) (btypes.ChangesetSpecs, map[api.RepoID]*types.Repo, int64, error)
```

### <a id="changesetsStatsResolver" href="#changesetsStatsResolver">type changesetsStatsResolver struct</a>

```
searchKey: resolvers.changesetsStatsResolver
```

```Go
type changesetsStatsResolver struct {
	stats btypes.ChangesetsStats
}
```

#### <a id="changesetsStatsResolver.Retrying" href="#changesetsStatsResolver.Retrying">func (r *changesetsStatsResolver) Retrying() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Retrying
```

```Go
func (r *changesetsStatsResolver) Retrying() int32
```

#### <a id="changesetsStatsResolver.Failed" href="#changesetsStatsResolver.Failed">func (r *changesetsStatsResolver) Failed() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Failed
```

```Go
func (r *changesetsStatsResolver) Failed() int32
```

#### <a id="changesetsStatsResolver.Scheduled" href="#changesetsStatsResolver.Scheduled">func (r *changesetsStatsResolver) Scheduled() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Scheduled
```

```Go
func (r *changesetsStatsResolver) Scheduled() int32
```

#### <a id="changesetsStatsResolver.Processing" href="#changesetsStatsResolver.Processing">func (r *changesetsStatsResolver) Processing() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Processing
```

```Go
func (r *changesetsStatsResolver) Processing() int32
```

#### <a id="changesetsStatsResolver.Unpublished" href="#changesetsStatsResolver.Unpublished">func (r *changesetsStatsResolver) Unpublished() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Unpublished
```

```Go
func (r *changesetsStatsResolver) Unpublished() int32
```

#### <a id="changesetsStatsResolver.Draft" href="#changesetsStatsResolver.Draft">func (r *changesetsStatsResolver) Draft() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Draft
```

```Go
func (r *changesetsStatsResolver) Draft() int32
```

#### <a id="changesetsStatsResolver.Open" href="#changesetsStatsResolver.Open">func (r *changesetsStatsResolver) Open() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Open
```

```Go
func (r *changesetsStatsResolver) Open() int32
```

#### <a id="changesetsStatsResolver.Merged" href="#changesetsStatsResolver.Merged">func (r *changesetsStatsResolver) Merged() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Merged
```

```Go
func (r *changesetsStatsResolver) Merged() int32
```

#### <a id="changesetsStatsResolver.Closed" href="#changesetsStatsResolver.Closed">func (r *changesetsStatsResolver) Closed() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Closed
```

```Go
func (r *changesetsStatsResolver) Closed() int32
```

#### <a id="changesetsStatsResolver.Deleted" href="#changesetsStatsResolver.Deleted">func (r *changesetsStatsResolver) Deleted() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Deleted
```

```Go
func (r *changesetsStatsResolver) Deleted() int32
```

#### <a id="changesetsStatsResolver.Archived" href="#changesetsStatsResolver.Archived">func (r *changesetsStatsResolver) Archived() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Archived
```

```Go
func (r *changesetsStatsResolver) Archived() int32
```

#### <a id="changesetsStatsResolver.Total" href="#changesetsStatsResolver.Total">func (r *changesetsStatsResolver) Total() int32</a>

```
searchKey: resolvers.changesetsStatsResolver.Total
```

```Go
func (r *changesetsStatsResolver) Total() int32
```

### <a id="batchChangesCodeHostResolver" href="#batchChangesCodeHostResolver">type batchChangesCodeHostResolver struct</a>

```
searchKey: resolvers.batchChangesCodeHostResolver
```

```Go
type batchChangesCodeHostResolver struct {
	codeHost   *btypes.CodeHost
	credential graphqlbackend.BatchChangesCredentialResolver
}
```

#### <a id="batchChangesCodeHostResolver.ExternalServiceKind" href="#batchChangesCodeHostResolver.ExternalServiceKind">func (c *batchChangesCodeHostResolver) ExternalServiceKind() string</a>

```
searchKey: resolvers.batchChangesCodeHostResolver.ExternalServiceKind
```

```Go
func (c *batchChangesCodeHostResolver) ExternalServiceKind() string
```

#### <a id="batchChangesCodeHostResolver.ExternalServiceURL" href="#batchChangesCodeHostResolver.ExternalServiceURL">func (c *batchChangesCodeHostResolver) ExternalServiceURL() string</a>

```
searchKey: resolvers.batchChangesCodeHostResolver.ExternalServiceURL
```

```Go
func (c *batchChangesCodeHostResolver) ExternalServiceURL() string
```

#### <a id="batchChangesCodeHostResolver.Credential" href="#batchChangesCodeHostResolver.Credential">func (c *batchChangesCodeHostResolver) Credential() graphqlbackend.BatchChangesCredentialResolver</a>

```
searchKey: resolvers.batchChangesCodeHostResolver.Credential
```

```Go
func (c *batchChangesCodeHostResolver) Credential() graphqlbackend.BatchChangesCredentialResolver
```

#### <a id="batchChangesCodeHostResolver.RequiresSSH" href="#batchChangesCodeHostResolver.RequiresSSH">func (c *batchChangesCodeHostResolver) RequiresSSH() bool</a>

```
searchKey: resolvers.batchChangesCodeHostResolver.RequiresSSH
```

```Go
func (c *batchChangesCodeHostResolver) RequiresSSH() bool
```

### <a id="batchChangesCodeHostConnectionResolver" href="#batchChangesCodeHostConnectionResolver">type batchChangesCodeHostConnectionResolver struct</a>

```
searchKey: resolvers.batchChangesCodeHostConnectionResolver
```

```Go
type batchChangesCodeHostConnectionResolver struct {
	userID                *int32
	onlyWithoutCredential bool
	opts                  store.ListCodeHostsOpts
	limitOffset           database.LimitOffset
	store                 *store.Store

	once          sync.Once
	chs           []*btypes.CodeHost
	chsPage       []*btypes.CodeHost
	credsByIDType map[idType]graphqlbackend.BatchChangesCredentialResolver
	chsErr        error
}
```

#### <a id="batchChangesCodeHostConnectionResolver.TotalCount" href="#batchChangesCodeHostConnectionResolver.TotalCount">func (c *batchChangesCodeHostConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.batchChangesCodeHostConnectionResolver.TotalCount
```

```Go
func (c *batchChangesCodeHostConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="batchChangesCodeHostConnectionResolver.PageInfo" href="#batchChangesCodeHostConnectionResolver.PageInfo">func (c *batchChangesCodeHostConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.batchChangesCodeHostConnectionResolver.PageInfo
```

```Go
func (c *batchChangesCodeHostConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="batchChangesCodeHostConnectionResolver.Nodes" href="#batchChangesCodeHostConnectionResolver.Nodes">func (c *batchChangesCodeHostConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.BatchChangesCodeHostResolver, error)</a>

```
searchKey: resolvers.batchChangesCodeHostConnectionResolver.Nodes
```

```Go
func (c *batchChangesCodeHostConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.BatchChangesCodeHostResolver, error)
```

#### <a id="batchChangesCodeHostConnectionResolver.compute" href="#batchChangesCodeHostConnectionResolver.compute">func (c *batchChangesCodeHostConnectionResolver) compute(ctx context.Context) (all, page []*btypes.CodeHost, credsByIDType map[idType]graphqlbackend.BatchChangesCredentialResolver, err error)</a>

```
searchKey: resolvers.batchChangesCodeHostConnectionResolver.compute
```

```Go
func (c *batchChangesCodeHostConnectionResolver) compute(ctx context.Context) (all, page []*btypes.CodeHost, credsByIDType map[idType]graphqlbackend.BatchChangesCredentialResolver, err error)
```

### <a id="idType" href="#idType">type idType struct</a>

```
searchKey: resolvers.idType
```

```Go
type idType struct {
	externalServiceID   string
	externalServiceType string
}
```

### <a id="batchChangesUserCredentialResolver" href="#batchChangesUserCredentialResolver">type batchChangesUserCredentialResolver struct</a>

```
searchKey: resolvers.batchChangesUserCredentialResolver
```

```Go
type batchChangesUserCredentialResolver struct {
	credential *database.UserCredential
}
```

#### <a id="batchChangesUserCredentialResolver.ID" href="#batchChangesUserCredentialResolver.ID">func (c *batchChangesUserCredentialResolver) ID() graphql.ID</a>

```
searchKey: resolvers.batchChangesUserCredentialResolver.ID
```

```Go
func (c *batchChangesUserCredentialResolver) ID() graphql.ID
```

#### <a id="batchChangesUserCredentialResolver.ExternalServiceKind" href="#batchChangesUserCredentialResolver.ExternalServiceKind">func (c *batchChangesUserCredentialResolver) ExternalServiceKind() string</a>

```
searchKey: resolvers.batchChangesUserCredentialResolver.ExternalServiceKind
```

```Go
func (c *batchChangesUserCredentialResolver) ExternalServiceKind() string
```

#### <a id="batchChangesUserCredentialResolver.ExternalServiceURL" href="#batchChangesUserCredentialResolver.ExternalServiceURL">func (c *batchChangesUserCredentialResolver) ExternalServiceURL() string</a>

```
searchKey: resolvers.batchChangesUserCredentialResolver.ExternalServiceURL
```

```Go
func (c *batchChangesUserCredentialResolver) ExternalServiceURL() string
```

#### <a id="batchChangesUserCredentialResolver.SSHPublicKey" href="#batchChangesUserCredentialResolver.SSHPublicKey">func (c *batchChangesUserCredentialResolver) SSHPublicKey(ctx context.Context) (*string, error)</a>

```
searchKey: resolvers.batchChangesUserCredentialResolver.SSHPublicKey
```

```Go
func (c *batchChangesUserCredentialResolver) SSHPublicKey(ctx context.Context) (*string, error)
```

#### <a id="batchChangesUserCredentialResolver.CreatedAt" href="#batchChangesUserCredentialResolver.CreatedAt">func (c *batchChangesUserCredentialResolver) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.batchChangesUserCredentialResolver.CreatedAt
```

```Go
func (c *batchChangesUserCredentialResolver) CreatedAt() graphqlbackend.DateTime
```

#### <a id="batchChangesUserCredentialResolver.IsSiteCredential" href="#batchChangesUserCredentialResolver.IsSiteCredential">func (c *batchChangesUserCredentialResolver) IsSiteCredential() bool</a>

```
searchKey: resolvers.batchChangesUserCredentialResolver.IsSiteCredential
```

```Go
func (c *batchChangesUserCredentialResolver) IsSiteCredential() bool
```

### <a id="batchChangesSiteCredentialResolver" href="#batchChangesSiteCredentialResolver">type batchChangesSiteCredentialResolver struct</a>

```
searchKey: resolvers.batchChangesSiteCredentialResolver
```

```Go
type batchChangesSiteCredentialResolver struct {
	credential *btypes.SiteCredential
}
```

#### <a id="batchChangesSiteCredentialResolver.ID" href="#batchChangesSiteCredentialResolver.ID">func (c *batchChangesSiteCredentialResolver) ID() graphql.ID</a>

```
searchKey: resolvers.batchChangesSiteCredentialResolver.ID
```

```Go
func (c *batchChangesSiteCredentialResolver) ID() graphql.ID
```

#### <a id="batchChangesSiteCredentialResolver.ExternalServiceKind" href="#batchChangesSiteCredentialResolver.ExternalServiceKind">func (c *batchChangesSiteCredentialResolver) ExternalServiceKind() string</a>

```
searchKey: resolvers.batchChangesSiteCredentialResolver.ExternalServiceKind
```

```Go
func (c *batchChangesSiteCredentialResolver) ExternalServiceKind() string
```

#### <a id="batchChangesSiteCredentialResolver.ExternalServiceURL" href="#batchChangesSiteCredentialResolver.ExternalServiceURL">func (c *batchChangesSiteCredentialResolver) ExternalServiceURL() string</a>

```
searchKey: resolvers.batchChangesSiteCredentialResolver.ExternalServiceURL
```

```Go
func (c *batchChangesSiteCredentialResolver) ExternalServiceURL() string
```

#### <a id="batchChangesSiteCredentialResolver.SSHPublicKey" href="#batchChangesSiteCredentialResolver.SSHPublicKey">func (c *batchChangesSiteCredentialResolver) SSHPublicKey(ctx context.Context) (*string, error)</a>

```
searchKey: resolvers.batchChangesSiteCredentialResolver.SSHPublicKey
```

```Go
func (c *batchChangesSiteCredentialResolver) SSHPublicKey(ctx context.Context) (*string, error)
```

#### <a id="batchChangesSiteCredentialResolver.CreatedAt" href="#batchChangesSiteCredentialResolver.CreatedAt">func (c *batchChangesSiteCredentialResolver) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.batchChangesSiteCredentialResolver.CreatedAt
```

```Go
func (c *batchChangesSiteCredentialResolver) CreatedAt() graphqlbackend.DateTime
```

#### <a id="batchChangesSiteCredentialResolver.IsSiteCredential" href="#batchChangesSiteCredentialResolver.IsSiteCredential">func (c *batchChangesSiteCredentialResolver) IsSiteCredential() bool</a>

```
searchKey: resolvers.batchChangesSiteCredentialResolver.IsSiteCredential
```

```Go
func (c *batchChangesSiteCredentialResolver) IsSiteCredential() bool
```

### <a id="campaignsCodeHostResolver" href="#campaignsCodeHostResolver">type campaignsCodeHostResolver struct</a>

```
searchKey: resolvers.campaignsCodeHostResolver
```

```Go
type campaignsCodeHostResolver struct {
	graphqlbackend.BatchChangesCodeHostResolver
}
```

TODO(campaigns-deprecation): Remove this wrapper type. It just exists to fulfil the interface of graphqlbackend.CampaignsCodeHostConnectionResolver. 

#### <a id="campaignsCodeHostResolver.ExternalServiceKind" href="#campaignsCodeHostResolver.ExternalServiceKind">func (c *campaignsCodeHostResolver) ExternalServiceKind() string</a>

```
searchKey: resolvers.campaignsCodeHostResolver.ExternalServiceKind
```

```Go
func (c *campaignsCodeHostResolver) ExternalServiceKind() string
```

#### <a id="campaignsCodeHostResolver.ExternalServiceURL" href="#campaignsCodeHostResolver.ExternalServiceURL">func (c *campaignsCodeHostResolver) ExternalServiceURL() string</a>

```
searchKey: resolvers.campaignsCodeHostResolver.ExternalServiceURL
```

```Go
func (c *campaignsCodeHostResolver) ExternalServiceURL() string
```

#### <a id="campaignsCodeHostResolver.Credential" href="#campaignsCodeHostResolver.Credential">func (c *campaignsCodeHostResolver) Credential() graphqlbackend.CampaignsCredentialResolver</a>

```
searchKey: resolvers.campaignsCodeHostResolver.Credential
```

```Go
func (c *campaignsCodeHostResolver) Credential() graphqlbackend.CampaignsCredentialResolver
```

#### <a id="campaignsCodeHostResolver.RequiresSSH" href="#campaignsCodeHostResolver.RequiresSSH">func (c *campaignsCodeHostResolver) RequiresSSH() bool</a>

```
searchKey: resolvers.campaignsCodeHostResolver.RequiresSSH
```

```Go
func (c *campaignsCodeHostResolver) RequiresSSH() bool
```

### <a id="campaignsCodeHostConnectionResolver" href="#campaignsCodeHostConnectionResolver">type campaignsCodeHostConnectionResolver struct</a>

```
searchKey: resolvers.campaignsCodeHostConnectionResolver
```

```Go
type campaignsCodeHostConnectionResolver struct {
	graphqlbackend.BatchChangesCodeHostConnectionResolver
}
```

#### <a id="campaignsCodeHostConnectionResolver.TotalCount" href="#campaignsCodeHostConnectionResolver.TotalCount">func (c *campaignsCodeHostConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.campaignsCodeHostConnectionResolver.TotalCount
```

```Go
func (c *campaignsCodeHostConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="campaignsCodeHostConnectionResolver.PageInfo" href="#campaignsCodeHostConnectionResolver.PageInfo">func (c *campaignsCodeHostConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.campaignsCodeHostConnectionResolver.PageInfo
```

```Go
func (c *campaignsCodeHostConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="campaignsCodeHostConnectionResolver.Nodes" href="#campaignsCodeHostConnectionResolver.Nodes">func (c *campaignsCodeHostConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.CampaignsCodeHostResolver, error)</a>

```
searchKey: resolvers.campaignsCodeHostConnectionResolver.Nodes
```

```Go
func (c *campaignsCodeHostConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.CampaignsCodeHostResolver, error)
```

### <a id="ErrInvalidFirstParameter" href="#ErrInvalidFirstParameter">type ErrInvalidFirstParameter struct</a>

```
searchKey: resolvers.ErrInvalidFirstParameter
tags: [exported]
```

```Go
type ErrInvalidFirstParameter struct {
	Min, Max, First int
}
```

#### <a id="ErrInvalidFirstParameter.Error" href="#ErrInvalidFirstParameter.Error">func (e ErrInvalidFirstParameter) Error() string</a>

```
searchKey: resolvers.ErrInvalidFirstParameter.Error
tags: [exported]
```

```Go
func (e ErrInvalidFirstParameter) Error() string
```

#### <a id="ErrInvalidFirstParameter.Extensions" href="#ErrInvalidFirstParameter.Extensions">func (e ErrInvalidFirstParameter) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrInvalidFirstParameter.Extensions
tags: [exported]
```

```Go
func (e ErrInvalidFirstParameter) Extensions() map[string]interface{}
```

### <a id="ErrIDIsZero" href="#ErrIDIsZero">type ErrIDIsZero struct{}</a>

```
searchKey: resolvers.ErrIDIsZero
tags: [exported]
```

```Go
type ErrIDIsZero struct{}
```

#### <a id="ErrIDIsZero.Error" href="#ErrIDIsZero.Error">func (e ErrIDIsZero) Error() string</a>

```
searchKey: resolvers.ErrIDIsZero.Error
tags: [exported]
```

```Go
func (e ErrIDIsZero) Error() string
```

#### <a id="ErrIDIsZero.Extensions" href="#ErrIDIsZero.Extensions">func (e ErrIDIsZero) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrIDIsZero.Extensions
tags: [exported]
```

```Go
func (e ErrIDIsZero) Extensions() map[string]interface{}
```

### <a id="ErrBatchChangesDisabled" href="#ErrBatchChangesDisabled">type ErrBatchChangesDisabled struct{}</a>

```
searchKey: resolvers.ErrBatchChangesDisabled
tags: [exported]
```

```Go
type ErrBatchChangesDisabled struct{}
```

#### <a id="ErrBatchChangesDisabled.Error" href="#ErrBatchChangesDisabled.Error">func (e ErrBatchChangesDisabled) Error() string</a>

```
searchKey: resolvers.ErrBatchChangesDisabled.Error
tags: [exported]
```

```Go
func (e ErrBatchChangesDisabled) Error() string
```

#### <a id="ErrBatchChangesDisabled.Extensions" href="#ErrBatchChangesDisabled.Extensions">func (e ErrBatchChangesDisabled) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrBatchChangesDisabled.Extensions
tags: [exported]
```

```Go
func (e ErrBatchChangesDisabled) Extensions() map[string]interface{}
```

### <a id="ErrBatchChangesDisabledForUser" href="#ErrBatchChangesDisabledForUser">type ErrBatchChangesDisabledForUser struct{}</a>

```
searchKey: resolvers.ErrBatchChangesDisabledForUser
tags: [exported]
```

```Go
type ErrBatchChangesDisabledForUser struct{}
```

#### <a id="ErrBatchChangesDisabledForUser.Error" href="#ErrBatchChangesDisabledForUser.Error">func (e ErrBatchChangesDisabledForUser) Error() string</a>

```
searchKey: resolvers.ErrBatchChangesDisabledForUser.Error
tags: [exported]
```

```Go
func (e ErrBatchChangesDisabledForUser) Error() string
```

#### <a id="ErrBatchChangesDisabledForUser.Extensions" href="#ErrBatchChangesDisabledForUser.Extensions">func (e ErrBatchChangesDisabledForUser) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrBatchChangesDisabledForUser.Extensions
tags: [exported]
```

```Go
func (e ErrBatchChangesDisabledForUser) Extensions() map[string]interface{}
```

### <a id="ErrBatchChangesUnlicensed" href="#ErrBatchChangesUnlicensed">type ErrBatchChangesUnlicensed struct</a>

```
searchKey: resolvers.ErrBatchChangesUnlicensed
tags: [exported]
```

```Go
type ErrBatchChangesUnlicensed struct{ error }
```

ErrBatchChangesUnlicensed wraps an underlying licensing.featureNotActivatedError to add an error code. 

#### <a id="ErrBatchChangesUnlicensed.Extensions" href="#ErrBatchChangesUnlicensed.Extensions">func (e ErrBatchChangesUnlicensed) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrBatchChangesUnlicensed.Extensions
tags: [exported]
```

```Go
func (e ErrBatchChangesUnlicensed) Extensions() map[string]interface{}
```

### <a id="ErrBatchChangesDotcom" href="#ErrBatchChangesDotcom">type ErrBatchChangesDotcom struct{}</a>

```
searchKey: resolvers.ErrBatchChangesDotcom
tags: [exported]
```

```Go
type ErrBatchChangesDotcom struct{}
```

#### <a id="ErrBatchChangesDotcom.Error" href="#ErrBatchChangesDotcom.Error">func (e ErrBatchChangesDotcom) Error() string</a>

```
searchKey: resolvers.ErrBatchChangesDotcom.Error
tags: [exported]
```

```Go
func (e ErrBatchChangesDotcom) Error() string
```

#### <a id="ErrBatchChangesDotcom.Extensions" href="#ErrBatchChangesDotcom.Extensions">func (e ErrBatchChangesDotcom) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrBatchChangesDotcom.Extensions
tags: [exported]
```

```Go
func (e ErrBatchChangesDotcom) Extensions() map[string]interface{}
```

### <a id="ErrEnsureBatchChangeFailed" href="#ErrEnsureBatchChangeFailed">type ErrEnsureBatchChangeFailed struct{}</a>

```
searchKey: resolvers.ErrEnsureBatchChangeFailed
tags: [exported]
```

```Go
type ErrEnsureBatchChangeFailed struct{}
```

#### <a id="ErrEnsureBatchChangeFailed.Error" href="#ErrEnsureBatchChangeFailed.Error">func (e ErrEnsureBatchChangeFailed) Error() string</a>

```
searchKey: resolvers.ErrEnsureBatchChangeFailed.Error
tags: [exported]
```

```Go
func (e ErrEnsureBatchChangeFailed) Error() string
```

#### <a id="ErrEnsureBatchChangeFailed.Extensions" href="#ErrEnsureBatchChangeFailed.Extensions">func (e ErrEnsureBatchChangeFailed) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrEnsureBatchChangeFailed.Extensions
tags: [exported]
```

```Go
func (e ErrEnsureBatchChangeFailed) Extensions() map[string]interface{}
```

### <a id="ErrApplyClosedBatchChange" href="#ErrApplyClosedBatchChange">type ErrApplyClosedBatchChange struct{}</a>

```
searchKey: resolvers.ErrApplyClosedBatchChange
tags: [exported]
```

```Go
type ErrApplyClosedBatchChange struct{}
```

#### <a id="ErrApplyClosedBatchChange.Error" href="#ErrApplyClosedBatchChange.Error">func (e ErrApplyClosedBatchChange) Error() string</a>

```
searchKey: resolvers.ErrApplyClosedBatchChange.Error
tags: [exported]
```

```Go
func (e ErrApplyClosedBatchChange) Error() string
```

#### <a id="ErrApplyClosedBatchChange.Extensions" href="#ErrApplyClosedBatchChange.Extensions">func (e ErrApplyClosedBatchChange) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrApplyClosedBatchChange.Extensions
tags: [exported]
```

```Go
func (e ErrApplyClosedBatchChange) Extensions() map[string]interface{}
```

### <a id="ErrMatchingBatchChangeExists" href="#ErrMatchingBatchChangeExists">type ErrMatchingBatchChangeExists struct{}</a>

```
searchKey: resolvers.ErrMatchingBatchChangeExists
tags: [exported]
```

```Go
type ErrMatchingBatchChangeExists struct{}
```

#### <a id="ErrMatchingBatchChangeExists.Error" href="#ErrMatchingBatchChangeExists.Error">func (e ErrMatchingBatchChangeExists) Error() string</a>

```
searchKey: resolvers.ErrMatchingBatchChangeExists.Error
tags: [exported]
```

```Go
func (e ErrMatchingBatchChangeExists) Error() string
```

#### <a id="ErrMatchingBatchChangeExists.Extensions" href="#ErrMatchingBatchChangeExists.Extensions">func (e ErrMatchingBatchChangeExists) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrMatchingBatchChangeExists.Extensions
tags: [exported]
```

```Go
func (e ErrMatchingBatchChangeExists) Extensions() map[string]interface{}
```

### <a id="ErrDuplicateCredential" href="#ErrDuplicateCredential">type ErrDuplicateCredential struct{}</a>

```
searchKey: resolvers.ErrDuplicateCredential
tags: [exported]
```

```Go
type ErrDuplicateCredential struct{}
```

#### <a id="ErrDuplicateCredential.Error" href="#ErrDuplicateCredential.Error">func (e ErrDuplicateCredential) Error() string</a>

```
searchKey: resolvers.ErrDuplicateCredential.Error
tags: [exported]
```

```Go
func (e ErrDuplicateCredential) Error() string
```

#### <a id="ErrDuplicateCredential.Extensions" href="#ErrDuplicateCredential.Extensions">func (e ErrDuplicateCredential) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrDuplicateCredential.Extensions
tags: [exported]
```

```Go
func (e ErrDuplicateCredential) Extensions() map[string]interface{}
```

### <a id="ErrVerifyCredentialFailed" href="#ErrVerifyCredentialFailed">type ErrVerifyCredentialFailed struct</a>

```
searchKey: resolvers.ErrVerifyCredentialFailed
tags: [exported]
```

```Go
type ErrVerifyCredentialFailed struct {
	SourceErr error
}
```

#### <a id="ErrVerifyCredentialFailed.Error" href="#ErrVerifyCredentialFailed.Error">func (e ErrVerifyCredentialFailed) Error() string</a>

```
searchKey: resolvers.ErrVerifyCredentialFailed.Error
tags: [exported]
```

```Go
func (e ErrVerifyCredentialFailed) Error() string
```

#### <a id="ErrVerifyCredentialFailed.Extensions" href="#ErrVerifyCredentialFailed.Extensions">func (e ErrVerifyCredentialFailed) Extensions() map[string]interface{}</a>

```
searchKey: resolvers.ErrVerifyCredentialFailed.Extensions
tags: [exported]
```

```Go
func (e ErrVerifyCredentialFailed) Extensions() map[string]interface{}
```

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: resolvers.Resolver
tags: [exported]
```

```Go
type Resolver struct {
	store *store.Store
}
```

Resolver is the GraphQL resolver of all things related to batch changes. 

#### <a id="Resolver.campaignByID" href="#Resolver.campaignByID">func (r *Resolver) campaignByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.campaignByID
```

```Go
func (r *Resolver) campaignByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchChangeResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.Campaign" href="#Resolver.Campaign">func (r *Resolver) Campaign(ctx context.Context, args *graphqlbackend.BatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.Campaign
tags: [exported]
```

```Go
func (r *Resolver) Campaign(ctx context.Context, args *graphqlbackend.BatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.campaignSpecByID" href="#Resolver.campaignSpecByID">func (r *Resolver) campaignSpecByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchSpecResolver, error)</a>

```
searchKey: resolvers.Resolver.campaignSpecByID
```

```Go
func (r *Resolver) campaignSpecByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchSpecResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.CreateCampaignSpec" href="#Resolver.CreateCampaignSpec">func (r *Resolver) CreateCampaignSpec(ctx context.Context, args *graphqlbackend.CreateCampaignSpecArgs) (graphqlbackend.BatchSpecResolver, error)</a>

```
searchKey: resolvers.Resolver.CreateCampaignSpec
tags: [exported]
```

```Go
func (r *Resolver) CreateCampaignSpec(ctx context.Context, args *graphqlbackend.CreateCampaignSpecArgs) (graphqlbackend.BatchSpecResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.MoveCampaign" href="#Resolver.MoveCampaign">func (r *Resolver) MoveCampaign(ctx context.Context, args *graphqlbackend.MoveCampaignArgs) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.MoveCampaign
tags: [exported]
```

```Go
func (r *Resolver) MoveCampaign(ctx context.Context, args *graphqlbackend.MoveCampaignArgs) (graphqlbackend.BatchChangeResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.DeleteCampaign" href="#Resolver.DeleteCampaign">func (r *Resolver) DeleteCampaign(ctx context.Context, args *graphqlbackend.DeleteCampaignArgs) (_ *graphqlbackend.EmptyResponse, err error)</a>

```
searchKey: resolvers.Resolver.DeleteCampaign
tags: [exported]
```

```Go
func (r *Resolver) DeleteCampaign(ctx context.Context, args *graphqlbackend.DeleteCampaignArgs) (_ *graphqlbackend.EmptyResponse, err error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.Campaigns" href="#Resolver.Campaigns">func (r *Resolver) Campaigns(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)</a>

```
searchKey: resolvers.Resolver.Campaigns
tags: [exported]
```

```Go
func (r *Resolver) Campaigns(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.CampaignsCodeHosts" href="#Resolver.CampaignsCodeHosts">func (r *Resolver) CampaignsCodeHosts(ctx context.Context, args *graphqlbackend.ListCampaignsCodeHostsArgs) (graphqlbackend.CampaignsCodeHostConnectionResolver, error)</a>

```
searchKey: resolvers.Resolver.CampaignsCodeHosts
tags: [exported]
```

```Go
func (r *Resolver) CampaignsCodeHosts(ctx context.Context, args *graphqlbackend.ListCampaignsCodeHostsArgs) (graphqlbackend.CampaignsCodeHostConnectionResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.CreateCampaignsCredential" href="#Resolver.CreateCampaignsCredential">func (r *Resolver) CreateCampaignsCredential(ctx context.Context, args *graphqlbackend.CreateCampaignsCredentialArgs) (_ graphqlbackend.CampaignsCredentialResolver, err error)</a>

```
searchKey: resolvers.Resolver.CreateCampaignsCredential
tags: [exported]
```

```Go
func (r *Resolver) CreateCampaignsCredential(ctx context.Context, args *graphqlbackend.CreateCampaignsCredentialArgs) (_ graphqlbackend.CampaignsCredentialResolver, err error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.DeleteCampaignsCredential" href="#Resolver.DeleteCampaignsCredential">func (r *Resolver) DeleteCampaignsCredential(ctx context.Context, args *graphqlbackend.DeleteCampaignsCredentialArgs) (_ *graphqlbackend.EmptyResponse, err error)</a>

```
searchKey: resolvers.Resolver.DeleteCampaignsCredential
tags: [exported]
```

```Go
func (r *Resolver) DeleteCampaignsCredential(ctx context.Context, args *graphqlbackend.DeleteCampaignsCredentialArgs) (_ *graphqlbackend.EmptyResponse, err error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.campaignsCredentialByID" href="#Resolver.campaignsCredentialByID">func (r *Resolver) campaignsCredentialByID(ctx context.Context, id graphql.ID) (graphqlbackend.CampaignsCredentialResolver, error)</a>

```
searchKey: resolvers.Resolver.campaignsCredentialByID
```

```Go
func (r *Resolver) campaignsCredentialByID(ctx context.Context, id graphql.ID) (graphqlbackend.CampaignsCredentialResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.CreateCampaign" href="#Resolver.CreateCampaign">func (r *Resolver) CreateCampaign(ctx context.Context, args *graphqlbackend.CreateCampaignArgs) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.CreateCampaign
tags: [exported]
```

```Go
func (r *Resolver) CreateCampaign(ctx context.Context, args *graphqlbackend.CreateCampaignArgs) (graphqlbackend.BatchChangeResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.ApplyCampaign" href="#Resolver.ApplyCampaign">func (r *Resolver) ApplyCampaign(ctx context.Context, args *graphqlbackend.ApplyCampaignArgs) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.ApplyCampaign
tags: [exported]
```

```Go
func (r *Resolver) ApplyCampaign(ctx context.Context, args *graphqlbackend.ApplyCampaignArgs) (graphqlbackend.BatchChangeResolver, error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.CloseCampaign" href="#Resolver.CloseCampaign">func (r *Resolver) CloseCampaign(ctx context.Context, args *graphqlbackend.CloseCampaignArgs) (_ graphqlbackend.BatchChangeResolver, err error)</a>

```
searchKey: resolvers.Resolver.CloseCampaign
tags: [exported]
```

```Go
func (r *Resolver) CloseCampaign(ctx context.Context, args *graphqlbackend.CloseCampaignArgs) (_ graphqlbackend.BatchChangeResolver, err error)
```

TODO(campaigns-deprecation): Remove when campaigns are fully removed 

#### <a id="Resolver.NodeResolvers" href="#Resolver.NodeResolvers">func (r *Resolver) NodeResolvers() map[string]graphqlbackend.NodeByIDFunc</a>

```
searchKey: resolvers.Resolver.NodeResolvers
tags: [exported]
```

```Go
func (r *Resolver) NodeResolvers() map[string]graphqlbackend.NodeByIDFunc
```

#### <a id="Resolver.changesetByID" href="#Resolver.changesetByID">func (r *Resolver) changesetByID(ctx context.Context, id graphql.ID) (graphqlbackend.ChangesetResolver, error)</a>

```
searchKey: resolvers.Resolver.changesetByID
```

```Go
func (r *Resolver) changesetByID(ctx context.Context, id graphql.ID) (graphqlbackend.ChangesetResolver, error)
```

#### <a id="Resolver.batchChangeByID" href="#Resolver.batchChangeByID">func (r *Resolver) batchChangeByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.batchChangeByID
```

```Go
func (r *Resolver) batchChangeByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchChangeResolver, error)
```

#### <a id="Resolver.BatchChange" href="#Resolver.BatchChange">func (r *Resolver) BatchChange(ctx context.Context, args *graphqlbackend.BatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.BatchChange
tags: [exported]
```

```Go
func (r *Resolver) BatchChange(ctx context.Context, args *graphqlbackend.BatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)
```

#### <a id="Resolver.batchSpecByID" href="#Resolver.batchSpecByID">func (r *Resolver) batchSpecByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchSpecResolver, error)</a>

```
searchKey: resolvers.Resolver.batchSpecByID
```

```Go
func (r *Resolver) batchSpecByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchSpecResolver, error)
```

#### <a id="Resolver.changesetSpecByID" href="#Resolver.changesetSpecByID">func (r *Resolver) changesetSpecByID(ctx context.Context, id graphql.ID) (graphqlbackend.ChangesetSpecResolver, error)</a>

```
searchKey: resolvers.Resolver.changesetSpecByID
```

```Go
func (r *Resolver) changesetSpecByID(ctx context.Context, id graphql.ID) (graphqlbackend.ChangesetSpecResolver, error)
```

#### <a id="Resolver.batchChangesCredentialByID" href="#Resolver.batchChangesCredentialByID">func (r *Resolver) batchChangesCredentialByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchChangesCredentialResolver, error)</a>

```
searchKey: resolvers.Resolver.batchChangesCredentialByID
```

```Go
func (r *Resolver) batchChangesCredentialByID(ctx context.Context, id graphql.ID) (graphqlbackend.BatchChangesCredentialResolver, error)
```

#### <a id="Resolver.batchChangesUserCredentialByID" href="#Resolver.batchChangesUserCredentialByID">func (r *Resolver) batchChangesUserCredentialByID(ctx context.Context, id int64) (graphqlbackend.BatchChangesCredentialResolver, error)</a>

```
searchKey: resolvers.Resolver.batchChangesUserCredentialByID
```

```Go
func (r *Resolver) batchChangesUserCredentialByID(ctx context.Context, id int64) (graphqlbackend.BatchChangesCredentialResolver, error)
```

#### <a id="Resolver.batchChangesSiteCredentialByID" href="#Resolver.batchChangesSiteCredentialByID">func (r *Resolver) batchChangesSiteCredentialByID(ctx context.Context, id int64) (graphqlbackend.BatchChangesCredentialResolver, error)</a>

```
searchKey: resolvers.Resolver.batchChangesSiteCredentialByID
```

```Go
func (r *Resolver) batchChangesSiteCredentialByID(ctx context.Context, id int64) (graphqlbackend.BatchChangesCredentialResolver, error)
```

#### <a id="Resolver.bulkOperationByID" href="#Resolver.bulkOperationByID">func (r *Resolver) bulkOperationByID(ctx context.Context, id graphql.ID) (graphqlbackend.BulkOperationResolver, error)</a>

```
searchKey: resolvers.Resolver.bulkOperationByID
```

```Go
func (r *Resolver) bulkOperationByID(ctx context.Context, id graphql.ID) (graphqlbackend.BulkOperationResolver, error)
```

#### <a id="Resolver.bulkOperationByIDString" href="#Resolver.bulkOperationByIDString">func (r *Resolver) bulkOperationByIDString(ctx context.Context, id string) (graphqlbackend.BulkOperationResolver, error)</a>

```
searchKey: resolvers.Resolver.bulkOperationByIDString
```

```Go
func (r *Resolver) bulkOperationByIDString(ctx context.Context, id string) (graphqlbackend.BulkOperationResolver, error)
```

#### <a id="Resolver.CreateBatchChange" href="#Resolver.CreateBatchChange">func (r *Resolver) CreateBatchChange(ctx context.Context, args *graphqlbackend.CreateBatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.CreateBatchChange
tags: [exported]
```

```Go
func (r *Resolver) CreateBatchChange(ctx context.Context, args *graphqlbackend.CreateBatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)
```

#### <a id="Resolver.ApplyBatchChange" href="#Resolver.ApplyBatchChange">func (r *Resolver) ApplyBatchChange(ctx context.Context, args *graphqlbackend.ApplyBatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.ApplyBatchChange
tags: [exported]
```

```Go
func (r *Resolver) ApplyBatchChange(ctx context.Context, args *graphqlbackend.ApplyBatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)
```

#### <a id="Resolver.CreateBatchSpec" href="#Resolver.CreateBatchSpec">func (r *Resolver) CreateBatchSpec(ctx context.Context, args *graphqlbackend.CreateBatchSpecArgs) (graphqlbackend.BatchSpecResolver, error)</a>

```
searchKey: resolvers.Resolver.CreateBatchSpec
tags: [exported]
```

```Go
func (r *Resolver) CreateBatchSpec(ctx context.Context, args *graphqlbackend.CreateBatchSpecArgs) (graphqlbackend.BatchSpecResolver, error)
```

#### <a id="Resolver.CreateChangesetSpec" href="#Resolver.CreateChangesetSpec">func (r *Resolver) CreateChangesetSpec(ctx context.Context, args *graphqlbackend.CreateChangesetSpecArgs) (graphqlbackend.ChangesetSpecResolver, error)</a>

```
searchKey: resolvers.Resolver.CreateChangesetSpec
tags: [exported]
```

```Go
func (r *Resolver) CreateChangesetSpec(ctx context.Context, args *graphqlbackend.CreateChangesetSpecArgs) (graphqlbackend.ChangesetSpecResolver, error)
```

#### <a id="Resolver.MoveBatchChange" href="#Resolver.MoveBatchChange">func (r *Resolver) MoveBatchChange(ctx context.Context, args *graphqlbackend.MoveBatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)</a>

```
searchKey: resolvers.Resolver.MoveBatchChange
tags: [exported]
```

```Go
func (r *Resolver) MoveBatchChange(ctx context.Context, args *graphqlbackend.MoveBatchChangeArgs) (graphqlbackend.BatchChangeResolver, error)
```

#### <a id="Resolver.DeleteBatchChange" href="#Resolver.DeleteBatchChange">func (r *Resolver) DeleteBatchChange(ctx context.Context, args *graphqlbackend.DeleteBatchChangeArgs) (_ *graphqlbackend.EmptyResponse, err error)</a>

```
searchKey: resolvers.Resolver.DeleteBatchChange
tags: [exported]
```

```Go
func (r *Resolver) DeleteBatchChange(ctx context.Context, args *graphqlbackend.DeleteBatchChangeArgs) (_ *graphqlbackend.EmptyResponse, err error)
```

#### <a id="Resolver.BatchChanges" href="#Resolver.BatchChanges">func (r *Resolver) BatchChanges(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)</a>

```
searchKey: resolvers.Resolver.BatchChanges
tags: [exported]
```

```Go
func (r *Resolver) BatchChanges(ctx context.Context, args *graphqlbackend.ListBatchChangesArgs) (graphqlbackend.BatchChangesConnectionResolver, error)
```

#### <a id="Resolver.BatchChangesCodeHosts" href="#Resolver.BatchChangesCodeHosts">func (r *Resolver) BatchChangesCodeHosts(ctx context.Context, args *graphqlbackend.ListBatchChangesCodeHostsArgs) (graphqlbackend.BatchChangesCodeHostConnectionResolver, error)</a>

```
searchKey: resolvers.Resolver.BatchChangesCodeHosts
tags: [exported]
```

```Go
func (r *Resolver) BatchChangesCodeHosts(ctx context.Context, args *graphqlbackend.ListBatchChangesCodeHostsArgs) (graphqlbackend.BatchChangesCodeHostConnectionResolver, error)
```

#### <a id="Resolver.CloseBatchChange" href="#Resolver.CloseBatchChange">func (r *Resolver) CloseBatchChange(ctx context.Context, args *graphqlbackend.CloseBatchChangeArgs) (_ graphqlbackend.BatchChangeResolver, err error)</a>

```
searchKey: resolvers.Resolver.CloseBatchChange
tags: [exported]
```

```Go
func (r *Resolver) CloseBatchChange(ctx context.Context, args *graphqlbackend.CloseBatchChangeArgs) (_ graphqlbackend.BatchChangeResolver, err error)
```

#### <a id="Resolver.SyncChangeset" href="#Resolver.SyncChangeset">func (r *Resolver) SyncChangeset(ctx context.Context, args *graphqlbackend.SyncChangesetArgs) (_ *graphqlbackend.EmptyResponse, err error)</a>

```
searchKey: resolvers.Resolver.SyncChangeset
tags: [exported]
```

```Go
func (r *Resolver) SyncChangeset(ctx context.Context, args *graphqlbackend.SyncChangesetArgs) (_ *graphqlbackend.EmptyResponse, err error)
```

#### <a id="Resolver.ReenqueueChangeset" href="#Resolver.ReenqueueChangeset">func (r *Resolver) ReenqueueChangeset(ctx context.Context, args *graphqlbackend.ReenqueueChangesetArgs) (_ graphqlbackend.ChangesetResolver, err error)</a>

```
searchKey: resolvers.Resolver.ReenqueueChangeset
tags: [exported]
```

```Go
func (r *Resolver) ReenqueueChangeset(ctx context.Context, args *graphqlbackend.ReenqueueChangesetArgs) (_ graphqlbackend.ChangesetResolver, err error)
```

#### <a id="Resolver.CreateBatchChangesCredential" href="#Resolver.CreateBatchChangesCredential">func (r *Resolver) CreateBatchChangesCredential(ctx context.Context, args *graphqlbackend.CreateBatchChangesCredentialArgs) (_ graphqlbackend.BatchChangesCredentialResolver, err error)</a>

```
searchKey: resolvers.Resolver.CreateBatchChangesCredential
tags: [exported]
```

```Go
func (r *Resolver) CreateBatchChangesCredential(ctx context.Context, args *graphqlbackend.CreateBatchChangesCredentialArgs) (_ graphqlbackend.BatchChangesCredentialResolver, err error)
```

#### <a id="Resolver.createBatchChangesUserCredential" href="#Resolver.createBatchChangesUserCredential">func (r *Resolver) createBatchChangesUserCredential(ctx context.Context, externalServiceURL, externalServiceType string, userID int32, credential string) (graphqlbackend.BatchChangesCredentialResolver, error)</a>

```
searchKey: resolvers.Resolver.createBatchChangesUserCredential
```

```Go
func (r *Resolver) createBatchChangesUserCredential(ctx context.Context, externalServiceURL, externalServiceType string, userID int32, credential string) (graphqlbackend.BatchChangesCredentialResolver, error)
```

#### <a id="Resolver.createBatchChangesSiteCredential" href="#Resolver.createBatchChangesSiteCredential">func (r *Resolver) createBatchChangesSiteCredential(ctx context.Context, externalServiceURL, externalServiceType string, credential string) (graphqlbackend.BatchChangesCredentialResolver, error)</a>

```
searchKey: resolvers.Resolver.createBatchChangesSiteCredential
```

```Go
func (r *Resolver) createBatchChangesSiteCredential(ctx context.Context, externalServiceURL, externalServiceType string, credential string) (graphqlbackend.BatchChangesCredentialResolver, error)
```

#### <a id="Resolver.generateAuthenticatorForCredential" href="#Resolver.generateAuthenticatorForCredential">func (r *Resolver) generateAuthenticatorForCredential(ctx context.Context, externalServiceType, externalServiceURL, credential string) (auth.Authenticator, error)</a>

```
searchKey: resolvers.Resolver.generateAuthenticatorForCredential
```

```Go
func (r *Resolver) generateAuthenticatorForCredential(ctx context.Context, externalServiceType, externalServiceURL, credential string) (auth.Authenticator, error)
```

#### <a id="Resolver.DeleteBatchChangesCredential" href="#Resolver.DeleteBatchChangesCredential">func (r *Resolver) DeleteBatchChangesCredential(ctx context.Context, args *graphqlbackend.DeleteBatchChangesCredentialArgs) (_ *graphqlbackend.EmptyResponse, err error)</a>

```
searchKey: resolvers.Resolver.DeleteBatchChangesCredential
tags: [exported]
```

```Go
func (r *Resolver) DeleteBatchChangesCredential(ctx context.Context, args *graphqlbackend.DeleteBatchChangesCredentialArgs) (_ *graphqlbackend.EmptyResponse, err error)
```

#### <a id="Resolver.deleteBatchChangesUserCredential" href="#Resolver.deleteBatchChangesUserCredential">func (r *Resolver) deleteBatchChangesUserCredential(ctx context.Context, credentialDBID int64) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: resolvers.Resolver.deleteBatchChangesUserCredential
```

```Go
func (r *Resolver) deleteBatchChangesUserCredential(ctx context.Context, credentialDBID int64) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="Resolver.deleteBatchChangesSiteCredential" href="#Resolver.deleteBatchChangesSiteCredential">func (r *Resolver) deleteBatchChangesSiteCredential(ctx context.Context, credentialDBID int64) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: resolvers.Resolver.deleteBatchChangesSiteCredential
```

```Go
func (r *Resolver) deleteBatchChangesSiteCredential(ctx context.Context, credentialDBID int64) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="Resolver.DetachChangesets" href="#Resolver.DetachChangesets">func (r *Resolver) DetachChangesets(ctx context.Context, args *graphqlbackend.DetachChangesetsArgs) (_ graphqlbackend.BulkOperationResolver, err error)</a>

```
searchKey: resolvers.Resolver.DetachChangesets
tags: [exported]
```

```Go
func (r *Resolver) DetachChangesets(ctx context.Context, args *graphqlbackend.DetachChangesetsArgs) (_ graphqlbackend.BulkOperationResolver, err error)
```

#### <a id="Resolver.CreateChangesetComments" href="#Resolver.CreateChangesetComments">func (r *Resolver) CreateChangesetComments(ctx context.Context, args *graphqlbackend.CreateChangesetCommentsArgs) (_ graphqlbackend.BulkOperationResolver, err error)</a>

```
searchKey: resolvers.Resolver.CreateChangesetComments
tags: [exported]
```

```Go
func (r *Resolver) CreateChangesetComments(ctx context.Context, args *graphqlbackend.CreateChangesetCommentsArgs) (_ graphqlbackend.BulkOperationResolver, err error)
```

#### <a id="Resolver.ReenqueueChangesets" href="#Resolver.ReenqueueChangesets">func (r *Resolver) ReenqueueChangesets(ctx context.Context, args *graphqlbackend.ReenqueueChangesetsArgs) (_ graphqlbackend.BulkOperationResolver, err error)</a>

```
searchKey: resolvers.Resolver.ReenqueueChangesets
tags: [exported]
```

```Go
func (r *Resolver) ReenqueueChangesets(ctx context.Context, args *graphqlbackend.ReenqueueChangesetsArgs) (_ graphqlbackend.BulkOperationResolver, err error)
```

#### <a id="Resolver.MergeChangesets" href="#Resolver.MergeChangesets">func (r *Resolver) MergeChangesets(ctx context.Context, args *graphqlbackend.MergeChangesetsArgs) (_ graphqlbackend.BulkOperationResolver, err error)</a>

```
searchKey: resolvers.Resolver.MergeChangesets
tags: [exported]
```

```Go
func (r *Resolver) MergeChangesets(ctx context.Context, args *graphqlbackend.MergeChangesetsArgs) (_ graphqlbackend.BulkOperationResolver, err error)
```

### <a id="batchSpecCreatedArg" href="#batchSpecCreatedArg">type batchSpecCreatedArg struct</a>

```
searchKey: resolvers.batchSpecCreatedArg
```

```Go
type batchSpecCreatedArg struct {
	ChangesetSpecsCount int `json:"changeset_specs_count"`
}
```

### <a id="batchChangeEventArg" href="#batchChangeEventArg">type batchChangeEventArg struct</a>

```
searchKey: resolvers.batchChangeEventArg
```

```Go
type batchChangeEventArg struct {
	BatchChangeID int64 `json:"batch_change_id"`
}
```

### <a id="mockChangesetApplyPreviewResolver" href="#mockChangesetApplyPreviewResolver">type mockChangesetApplyPreviewResolver struct</a>

```
searchKey: resolvers.mockChangesetApplyPreviewResolver
```

```Go
type mockChangesetApplyPreviewResolver struct {
	hidden  graphqlbackend.HiddenChangesetApplyPreviewResolver
	visible graphqlbackend.VisibleChangesetApplyPreviewResolver
}
```

#### <a id="mockChangesetApplyPreviewResolver.ToHiddenChangesetApplyPreview" href="#mockChangesetApplyPreviewResolver.ToHiddenChangesetApplyPreview">func (r *mockChangesetApplyPreviewResolver) ToHiddenChangesetApplyPreview() (graphqlbackend.HiddenChangesetApplyPreviewResolver, bool)</a>

```
searchKey: resolvers.mockChangesetApplyPreviewResolver.ToHiddenChangesetApplyPreview
```

```Go
func (r *mockChangesetApplyPreviewResolver) ToHiddenChangesetApplyPreview() (graphqlbackend.HiddenChangesetApplyPreviewResolver, bool)
```

#### <a id="mockChangesetApplyPreviewResolver.ToVisibleChangesetApplyPreview" href="#mockChangesetApplyPreviewResolver.ToVisibleChangesetApplyPreview">func (r *mockChangesetApplyPreviewResolver) ToVisibleChangesetApplyPreview() (graphqlbackend.VisibleChangesetApplyPreviewResolver, bool)</a>

```
searchKey: resolvers.mockChangesetApplyPreviewResolver.ToVisibleChangesetApplyPreview
```

```Go
func (r *mockChangesetApplyPreviewResolver) ToVisibleChangesetApplyPreview() (graphqlbackend.VisibleChangesetApplyPreviewResolver, bool)
```

### <a id="mockHiddenChangesetApplyPreviewResolver" href="#mockHiddenChangesetApplyPreviewResolver">type mockHiddenChangesetApplyPreviewResolver struct{}</a>

```
searchKey: resolvers.mockHiddenChangesetApplyPreviewResolver
```

```Go
type mockHiddenChangesetApplyPreviewResolver struct{}
```

#### <a id="mockHiddenChangesetApplyPreviewResolver.Operations" href="#mockHiddenChangesetApplyPreviewResolver.Operations">func (*mockHiddenChangesetApplyPreviewResolver) Operations(context.Context) ([]string, error)</a>

```
searchKey: resolvers.mockHiddenChangesetApplyPreviewResolver.Operations
```

```Go
func (*mockHiddenChangesetApplyPreviewResolver) Operations(context.Context) ([]string, error)
```

#### <a id="mockHiddenChangesetApplyPreviewResolver.Delta" href="#mockHiddenChangesetApplyPreviewResolver.Delta">func (*mockHiddenChangesetApplyPreviewResolver) Delta(context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)</a>

```
searchKey: resolvers.mockHiddenChangesetApplyPreviewResolver.Delta
```

```Go
func (*mockHiddenChangesetApplyPreviewResolver) Delta(context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)
```

#### <a id="mockHiddenChangesetApplyPreviewResolver.Targets" href="#mockHiddenChangesetApplyPreviewResolver.Targets">func (*mockHiddenChangesetApplyPreviewResolver) Targets() graphqlbackend.HiddenApplyPreviewTargetsResolver</a>

```
searchKey: resolvers.mockHiddenChangesetApplyPreviewResolver.Targets
```

```Go
func (*mockHiddenChangesetApplyPreviewResolver) Targets() graphqlbackend.HiddenApplyPreviewTargetsResolver
```

### <a id="mockVisibleChangesetApplyPreviewResolver" href="#mockVisibleChangesetApplyPreviewResolver">type mockVisibleChangesetApplyPreviewResolver struct</a>

```
searchKey: resolvers.mockVisibleChangesetApplyPreviewResolver
```

```Go
type mockVisibleChangesetApplyPreviewResolver struct {
	operations    []btypes.ReconcilerOperation
	operationsErr error
	delta         graphqlbackend.ChangesetSpecDeltaResolver
	deltaErr      error
	targets       graphqlbackend.VisibleApplyPreviewTargetsResolver
}
```

#### <a id="mockVisibleChangesetApplyPreviewResolver.Operations" href="#mockVisibleChangesetApplyPreviewResolver.Operations">func (r *mockVisibleChangesetApplyPreviewResolver) Operations(context.Context) ([]string, error)</a>

```
searchKey: resolvers.mockVisibleChangesetApplyPreviewResolver.Operations
```

```Go
func (r *mockVisibleChangesetApplyPreviewResolver) Operations(context.Context) ([]string, error)
```

#### <a id="mockVisibleChangesetApplyPreviewResolver.Delta" href="#mockVisibleChangesetApplyPreviewResolver.Delta">func (r *mockVisibleChangesetApplyPreviewResolver) Delta(context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)</a>

```
searchKey: resolvers.mockVisibleChangesetApplyPreviewResolver.Delta
```

```Go
func (r *mockVisibleChangesetApplyPreviewResolver) Delta(context.Context) (graphqlbackend.ChangesetSpecDeltaResolver, error)
```

#### <a id="mockVisibleChangesetApplyPreviewResolver.Targets" href="#mockVisibleChangesetApplyPreviewResolver.Targets">func (r *mockVisibleChangesetApplyPreviewResolver) Targets() graphqlbackend.VisibleApplyPreviewTargetsResolver</a>

```
searchKey: resolvers.mockVisibleChangesetApplyPreviewResolver.Targets
```

```Go
func (r *mockVisibleChangesetApplyPreviewResolver) Targets() graphqlbackend.VisibleApplyPreviewTargetsResolver
```

### <a id="wantBatchChangeResponse" href="#wantBatchChangeResponse">type wantBatchChangeResponse struct</a>

```
searchKey: resolvers.wantBatchChangeResponse
```

```Go
type wantBatchChangeResponse struct {
	changesetTypes      map[string]int
	changesetsCount     int
	changesetStats      apitest.ChangesetsStats
	batchChangeDiffStat apitest.DiffStat
}
```

### <a id="wantBatchSpecResponse" href="#wantBatchSpecResponse">type wantBatchSpecResponse struct</a>

```
searchKey: resolvers.wantBatchSpecResponse
```

```Go
type wantBatchSpecResponse struct {
	changesetPreviewTypes map[string]int
	changesetPreviewCount int
	changesetSpecTypes    map[string]int
	changesetSpecsCount   int
	batchSpecDiffStat     apitest.DiffStat
}
```

## <a id="func" href="#func">Functions</a>

### <a id="marshalBatchChangeID" href="#marshalBatchChangeID">func marshalBatchChangeID(id int64) graphql.ID</a>

```
searchKey: resolvers.marshalBatchChangeID
```

```Go
func marshalBatchChangeID(id int64) graphql.ID
```

### <a id="unmarshalBatchChangeID" href="#unmarshalBatchChangeID">func unmarshalBatchChangeID(id graphql.ID) (batchChangeID int64, err error)</a>

```
searchKey: resolvers.unmarshalBatchChangeID
```

```Go
func unmarshalBatchChangeID(id graphql.ID) (batchChangeID int64, err error)
```

### <a id="marshalBatchSpecRandID" href="#marshalBatchSpecRandID">func marshalBatchSpecRandID(id string) graphql.ID</a>

```
searchKey: resolvers.marshalBatchSpecRandID
```

```Go
func marshalBatchSpecRandID(id string) graphql.ID
```

### <a id="unmarshalBatchSpecID" href="#unmarshalBatchSpecID">func unmarshalBatchSpecID(id graphql.ID) (batchSpecRandID string, err error)</a>

```
searchKey: resolvers.unmarshalBatchSpecID
```

```Go
func unmarshalBatchSpecID(id graphql.ID) (batchSpecRandID string, err error)
```

### <a id="marshalBulkOperationID" href="#marshalBulkOperationID">func marshalBulkOperationID(id string) graphql.ID</a>

```
searchKey: resolvers.marshalBulkOperationID
```

```Go
func marshalBulkOperationID(id string) graphql.ID
```

### <a id="unmarshalBulkOperationID" href="#unmarshalBulkOperationID">func unmarshalBulkOperationID(id graphql.ID) (bulkOperationID string, err error)</a>

```
searchKey: resolvers.unmarshalBulkOperationID
```

```Go
func unmarshalBulkOperationID(id graphql.ID) (bulkOperationID string, err error)
```

### <a id="changesetJobTypeToBulkOperationType" href="#changesetJobTypeToBulkOperationType">func changesetJobTypeToBulkOperationType(t btypes.ChangesetJobType) (string, error)</a>

```
searchKey: resolvers.changesetJobTypeToBulkOperationType
```

```Go
func changesetJobTypeToBulkOperationType(t btypes.ChangesetJobType) (string, error)
```

### <a id="uniqueChangesetIDsForBulkOperationErrors" href="#uniqueChangesetIDsForBulkOperationErrors">func uniqueChangesetIDsForBulkOperationErrors(errors []*btypes.BulkOperationError) []int64</a>

```
searchKey: resolvers.uniqueChangesetIDsForBulkOperationErrors
```

```Go
func uniqueChangesetIDsForBulkOperationErrors(errors []*btypes.BulkOperationError) []int64
```

### <a id="marshalChangesetID" href="#marshalChangesetID">func marshalChangesetID(id int64) graphql.ID</a>

```
searchKey: resolvers.marshalChangesetID
```

```Go
func marshalChangesetID(id int64) graphql.ID
```

### <a id="unmarshalChangesetID" href="#unmarshalChangesetID">func unmarshalChangesetID(id graphql.ID) (cid int64, err error)</a>

```
searchKey: resolvers.unmarshalChangesetID
```

```Go
func unmarshalChangesetID(id graphql.ID) (cid int64, err error)
```

### <a id="marshalChangesetEventID" href="#marshalChangesetEventID">func marshalChangesetEventID(id int64) graphql.ID</a>

```
searchKey: resolvers.marshalChangesetEventID
```

```Go
func marshalChangesetEventID(id int64) graphql.ID
```

### <a id="marshalChangesetSpecRandID" href="#marshalChangesetSpecRandID">func marshalChangesetSpecRandID(id string) graphql.ID</a>

```
searchKey: resolvers.marshalChangesetSpecRandID
```

```Go
func marshalChangesetSpecRandID(id string) graphql.ID
```

### <a id="unmarshalChangesetSpecID" href="#unmarshalChangesetSpecID">func unmarshalChangesetSpecID(id graphql.ID) (changesetSpecRandID string, err error)</a>

```
searchKey: resolvers.unmarshalChangesetSpecID
```

```Go
func unmarshalChangesetSpecID(id graphql.ID) (changesetSpecRandID string, err error)
```

### <a id="marshalBatchChangesCredentialID" href="#marshalBatchChangesCredentialID">func marshalBatchChangesCredentialID(id int64, isSiteCredential bool) graphql.ID</a>

```
searchKey: resolvers.marshalBatchChangesCredentialID
```

```Go
func marshalBatchChangesCredentialID(id int64, isSiteCredential bool) graphql.ID
```

### <a id="unmarshalBatchChangesCredentialID" href="#unmarshalBatchChangesCredentialID">func unmarshalBatchChangesCredentialID(id graphql.ID) (credentialID int64, isSiteCredential bool, err error)</a>

```
searchKey: resolvers.unmarshalBatchChangesCredentialID
```

```Go
func unmarshalBatchChangesCredentialID(id graphql.ID) (credentialID int64, isSiteCredential bool, err error)
```

### <a id="commentSSHKey" href="#commentSSHKey">func commentSSHKey(ssh auth.AuthenticatorWithSSH) string</a>

```
searchKey: resolvers.commentSSHKey
```

```Go
func commentSSHKey(ssh auth.AuthenticatorWithSSH) string
```

### <a id="New" href="#New">func New(store *store.Store) graphqlbackend.BatchChangesResolver</a>

```
searchKey: resolvers.New
tags: [exported]
```

```Go
func New(store *store.Store) graphqlbackend.BatchChangesResolver
```

New returns a new Resolver whose store uses the given database 

### <a id="batchChangesEnabled" href="#batchChangesEnabled">func batchChangesEnabled(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: resolvers.batchChangesEnabled
```

```Go
func batchChangesEnabled(ctx context.Context, db dbutil.DB) error
```

### <a id="batchChangesCreateAccess" href="#batchChangesCreateAccess">func batchChangesCreateAccess(ctx context.Context) error</a>

```
searchKey: resolvers.batchChangesCreateAccess
```

```Go
func batchChangesCreateAccess(ctx context.Context) error
```

batchChangesCreateAccess returns true if the current user can create batchChanges/changesetSpecs/batchSpecs. 

### <a id="checkLicense" href="#checkLicense">func checkLicense() error</a>

```
searchKey: resolvers.checkLicense
```

```Go
func checkLicense() error
```

checkLicense returns a user-facing error if the batchChanges feature is not purchased with the current license or any error occurred while validating the license. 

### <a id="logBackendEvent" href="#logBackendEvent">func logBackendEvent(ctx context.Context, db dbutil.DB, name string, args interface{}) error</a>

```
searchKey: resolvers.logBackendEvent
```

```Go
func logBackendEvent(ctx context.Context, db dbutil.DB, name string, args interface{}) error
```

### <a id="listChangesetOptsFromArgs" href="#listChangesetOptsFromArgs">func listChangesetOptsFromArgs(args *graphqlbackend.ListChangesetsArgs, batchChangeID int64) (opts store.ListChangesetsOpts, optsSafe bool, err error)</a>

```
searchKey: resolvers.listChangesetOptsFromArgs
```

```Go
func listChangesetOptsFromArgs(args *graphqlbackend.ListChangesetsArgs, batchChangeID int64) (opts store.ListChangesetsOpts, optsSafe bool, err error)
```

listChangesetOptsFromArgs turns the graphqlbackend.ListChangesetsArgs into ListChangesetsOpts. If the args do not include a filter that would reveal sensitive information about a changeset the user doesn't have access to, the second return value is false. 

### <a id="parseBatchChangeState" href="#parseBatchChangeState">func parseBatchChangeState(s *string) (btypes.BatchChangeState, error)</a>

```
searchKey: resolvers.parseBatchChangeState
```

```Go
func parseBatchChangeState(s *string) (btypes.BatchChangeState, error)
```

### <a id="checkSiteAdminOrSameUser" href="#checkSiteAdminOrSameUser">func checkSiteAdminOrSameUser(ctx context.Context, db dbutil.DB, userID int32) (bool, error)</a>

```
searchKey: resolvers.checkSiteAdminOrSameUser
```

```Go
func checkSiteAdminOrSameUser(ctx context.Context, db dbutil.DB, userID int32) (bool, error)
```

### <a id="validateFirstParam" href="#validateFirstParam">func validateFirstParam(first int32, max int) error</a>

```
searchKey: resolvers.validateFirstParam
```

```Go
func validateFirstParam(first int32, max int) error
```

### <a id="validateFirstParamDefaults" href="#validateFirstParamDefaults">func validateFirstParamDefaults(first int32) error</a>

```
searchKey: resolvers.validateFirstParamDefaults
```

```Go
func validateFirstParamDefaults(first int32) error
```

### <a id="unmarshalBulkOperationBaseArgs" href="#unmarshalBulkOperationBaseArgs">func unmarshalBulkOperationBaseArgs(args graphqlbackend.BulkOperationBaseArgs) (batchChangeID int64, changesetIDs []int64, err error)</a>

```
searchKey: resolvers.unmarshalBulkOperationBaseArgs
```

```Go
func unmarshalBulkOperationBaseArgs(args graphqlbackend.BulkOperationBaseArgs) (batchChangeID int64, changesetIDs []int64, err error)
```

### <a id="batchChangesApplyURL" href="#batchChangesApplyURL">func batchChangesApplyURL(n graphqlbackend.Namespace, c graphqlbackend.BatchSpecResolver) string</a>

```
searchKey: resolvers.batchChangesApplyURL
```

```Go
func batchChangesApplyURL(n graphqlbackend.Namespace, c graphqlbackend.BatchSpecResolver) string
```

### <a id="batchChangeURL" href="#batchChangeURL">func batchChangeURL(n graphqlbackend.Namespace, c graphqlbackend.BatchChangeResolver) string</a>

```
searchKey: resolvers.batchChangeURL
```

```Go
func batchChangeURL(n graphqlbackend.Namespace, c graphqlbackend.BatchChangeResolver) string
```

### <a id="TestBatchChangeConnectionResolver" href="#TestBatchChangeConnectionResolver">func TestBatchChangeConnectionResolver(t *testing.T)</a>

```
searchKey: resolvers.TestBatchChangeConnectionResolver
```

```Go
func TestBatchChangeConnectionResolver(t *testing.T)
```

### <a id="TestBatchChangesListing" href="#TestBatchChangesListing">func TestBatchChangesListing(t *testing.T)</a>

```
searchKey: resolvers.TestBatchChangesListing
```

```Go
func TestBatchChangesListing(t *testing.T)
```

### <a id="TestBatchChangeResolver" href="#TestBatchChangeResolver">func TestBatchChangeResolver(t *testing.T)</a>

```
searchKey: resolvers.TestBatchChangeResolver
```

```Go
func TestBatchChangeResolver(t *testing.T)
```

### <a id="TestBatchSpecResolver" href="#TestBatchSpecResolver">func TestBatchSpecResolver(t *testing.T)</a>

```
searchKey: resolvers.TestBatchSpecResolver
```

```Go
func TestBatchSpecResolver(t *testing.T)
```

### <a id="TestBulkOperationConnectionResolver" href="#TestBulkOperationConnectionResolver">func TestBulkOperationConnectionResolver(t *testing.T)</a>

```
searchKey: resolvers.TestBulkOperationConnectionResolver
```

```Go
func TestBulkOperationConnectionResolver(t *testing.T)
```

### <a id="TestBulkOperationResolver" href="#TestBulkOperationResolver">func TestBulkOperationResolver(t *testing.T)</a>

```
searchKey: resolvers.TestBulkOperationResolver
```

```Go
func TestBulkOperationResolver(t *testing.T)
```

### <a id="TestChangesetApplyPreviewConnectionResolver" href="#TestChangesetApplyPreviewConnectionResolver">func TestChangesetApplyPreviewConnectionResolver(t *testing.T)</a>

```
searchKey: resolvers.TestChangesetApplyPreviewConnectionResolver
```

```Go
func TestChangesetApplyPreviewConnectionResolver(t *testing.T)
```

### <a id="TestRewirerMappings" href="#TestRewirerMappings">func TestRewirerMappings(t *testing.T)</a>

```
searchKey: resolvers.TestRewirerMappings
```

```Go
func TestRewirerMappings(t *testing.T)
```

### <a id="TestChangesetApplyPreviewResolver" href="#TestChangesetApplyPreviewResolver">func TestChangesetApplyPreviewResolver(t *testing.T)</a>

```
searchKey: resolvers.TestChangesetApplyPreviewResolver
```

```Go
func TestChangesetApplyPreviewResolver(t *testing.T)
```

### <a id="TestChangesetConnectionResolver" href="#TestChangesetConnectionResolver">func TestChangesetConnectionResolver(t *testing.T)</a>

```
searchKey: resolvers.TestChangesetConnectionResolver
```

```Go
func TestChangesetConnectionResolver(t *testing.T)
```

### <a id="TestChangesetCountsOverTimeResolver" href="#TestChangesetCountsOverTimeResolver">func TestChangesetCountsOverTimeResolver(t *testing.T)</a>

```
searchKey: resolvers.TestChangesetCountsOverTimeResolver
```

```Go
func TestChangesetCountsOverTimeResolver(t *testing.T)
```

### <a id="TestChangesetCountsOverTimeIntegration" href="#TestChangesetCountsOverTimeIntegration">func TestChangesetCountsOverTimeIntegration(t *testing.T)</a>

```
searchKey: resolvers.TestChangesetCountsOverTimeIntegration
```

```Go
func TestChangesetCountsOverTimeIntegration(t *testing.T)
```

### <a id="TestChangesetEventConnectionResolver" href="#TestChangesetEventConnectionResolver">func TestChangesetEventConnectionResolver(t *testing.T)</a>

```
searchKey: resolvers.TestChangesetEventConnectionResolver
```

```Go
func TestChangesetEventConnectionResolver(t *testing.T)
```

### <a id="TestChangesetSpecConnectionResolver" href="#TestChangesetSpecConnectionResolver">func TestChangesetSpecConnectionResolver(t *testing.T)</a>

```
searchKey: resolvers.TestChangesetSpecConnectionResolver
```

```Go
func TestChangesetSpecConnectionResolver(t *testing.T)
```

### <a id="TestChangesetSpecResolver" href="#TestChangesetSpecResolver">func TestChangesetSpecResolver(t *testing.T)</a>

```
searchKey: resolvers.TestChangesetSpecResolver
```

```Go
func TestChangesetSpecResolver(t *testing.T)
```

### <a id="TestChangesetResolver" href="#TestChangesetResolver">func TestChangesetResolver(t *testing.T)</a>

```
searchKey: resolvers.TestChangesetResolver
```

```Go
func TestChangesetResolver(t *testing.T)
```

### <a id="TestCodeHostConnectionResolver" href="#TestCodeHostConnectionResolver">func TestCodeHostConnectionResolver(t *testing.T)</a>

```
searchKey: resolvers.TestCodeHostConnectionResolver
```

```Go
func TestCodeHostConnectionResolver(t *testing.T)
```

### <a id="TestUnmarshalBatchChangesCredentialID" href="#TestUnmarshalBatchChangesCredentialID">func TestUnmarshalBatchChangesCredentialID(t *testing.T)</a>

```
searchKey: resolvers.TestUnmarshalBatchChangesCredentialID
```

```Go
func TestUnmarshalBatchChangesCredentialID(t *testing.T)
```

### <a id="TestCommentSSHKey" href="#TestCommentSSHKey">func TestCommentSSHKey(t *testing.T)</a>

```
searchKey: resolvers.TestCommentSSHKey
```

```Go
func TestCommentSSHKey(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: resolvers.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="marshalDateTime" href="#marshalDateTime">func marshalDateTime(t testing.TB, ts time.Time) string</a>

```
searchKey: resolvers.marshalDateTime
```

```Go
func marshalDateTime(t testing.TB, ts time.Time) string
```

### <a id="parseJSONTime" href="#parseJSONTime">func parseJSONTime(t testing.TB, ts string) time.Time</a>

```
searchKey: resolvers.parseJSONTime
```

```Go
func parseJSONTime(t testing.TB, ts string) time.Time
```

### <a id="newGitHubExternalService" href="#newGitHubExternalService">func newGitHubExternalService(t *testing.T, store *database.ExternalServiceStore) *types.ExternalService</a>

```
searchKey: resolvers.newGitHubExternalService
```

```Go
func newGitHubExternalService(t *testing.T, store *database.ExternalServiceStore) *types.ExternalService
```

### <a id="newGitHubTestRepo" href="#newGitHubTestRepo">func newGitHubTestRepo(name string, externalService *types.ExternalService) *types.Repo</a>

```
searchKey: resolvers.newGitHubTestRepo
```

```Go
func newGitHubTestRepo(name string, externalService *types.ExternalService) *types.Repo
```

### <a id="mockBackendCommits" href="#mockBackendCommits">func mockBackendCommits(t *testing.T, revs ...api.CommitID)</a>

```
searchKey: resolvers.mockBackendCommits
```

```Go
func mockBackendCommits(t *testing.T, revs ...api.CommitID)
```

### <a id="mockRepoComparison" href="#mockRepoComparison">func mockRepoComparison(t *testing.T, baseRev, headRev, diff string)</a>

```
searchKey: resolvers.mockRepoComparison
```

```Go
func mockRepoComparison(t *testing.T, baseRev, headRev, diff string)
```

### <a id="addChangeset" href="#addChangeset">func addChangeset(t *testing.T, ctx context.Context, s *store.Store, c *btypes.Changeset, batchChange int64)</a>

```
searchKey: resolvers.addChangeset
```

```Go
func addChangeset(t *testing.T, ctx context.Context, s *store.Store, c *btypes.Changeset, batchChange int64)
```

### <a id="pruneUserCredentials" href="#pruneUserCredentials">func pruneUserCredentials(t *testing.T, db dbutil.DB, key encryption.Key)</a>

```
searchKey: resolvers.pruneUserCredentials
```

```Go
func pruneUserCredentials(t *testing.T, db dbutil.DB, key encryption.Key)
```

### <a id="pruneSiteCredentials" href="#pruneSiteCredentials">func pruneSiteCredentials(t *testing.T, cstore *store.Store)</a>

```
searchKey: resolvers.pruneSiteCredentials
```

```Go
func pruneSiteCredentials(t *testing.T, cstore *store.Store)
```

### <a id="strPtr" href="#strPtr">func strPtr(s string) *string</a>

```
searchKey: resolvers.strPtr
```

```Go
func strPtr(s string) *string
```

### <a id="TestPermissionLevels" href="#TestPermissionLevels">func TestPermissionLevels(t *testing.T)</a>

```
searchKey: resolvers.TestPermissionLevels
```

```Go
func TestPermissionLevels(t *testing.T)
```

### <a id="TestRepositoryPermissions" href="#TestRepositoryPermissions">func TestRepositoryPermissions(t *testing.T)</a>

```
searchKey: resolvers.TestRepositoryPermissions
```

```Go
func TestRepositoryPermissions(t *testing.T)
```

### <a id="testBatchChangeResponse" href="#testBatchChangeResponse">func testBatchChangeResponse(t *testing.T, s *graphql.Schema, ctx context.Context, in map[string]interface{}, w wantBatchChangeResponse)</a>

```
searchKey: resolvers.testBatchChangeResponse
```

```Go
func testBatchChangeResponse(t *testing.T, s *graphql.Schema, ctx context.Context, in map[string]interface{}, w wantBatchChangeResponse)
```

### <a id="testChangesetResponse" href="#testChangesetResponse">func testChangesetResponse(t *testing.T, s *graphql.Schema, ctx context.Context, id int64, wantType string)</a>

```
searchKey: resolvers.testChangesetResponse
```

```Go
func testChangesetResponse(t *testing.T, s *graphql.Schema, ctx context.Context, id int64, wantType string)
```

### <a id="testBatchSpecResponse" href="#testBatchSpecResponse">func testBatchSpecResponse(t *testing.T, s *graphql.Schema, ctx context.Context, batchSpecRandID string, w wantBatchSpecResponse)</a>

```
searchKey: resolvers.testBatchSpecResponse
```

```Go
func testBatchSpecResponse(t *testing.T, s *graphql.Schema, ctx context.Context, batchSpecRandID string, w wantBatchSpecResponse)
```

### <a id="testChangesetSpecResponse" href="#testChangesetSpecResponse">func testChangesetSpecResponse(t *testing.T, s *graphql.Schema, ctx context.Context, randID, wantType string)</a>

```
searchKey: resolvers.testChangesetSpecResponse
```

```Go
func testChangesetSpecResponse(t *testing.T, s *graphql.Schema, ctx context.Context, randID, wantType string)
```

### <a id="TestNullIDResilience" href="#TestNullIDResilience">func TestNullIDResilience(t *testing.T)</a>

```
searchKey: resolvers.TestNullIDResilience
```

```Go
func TestNullIDResilience(t *testing.T)
```

### <a id="TestCreateBatchSpec" href="#TestCreateBatchSpec">func TestCreateBatchSpec(t *testing.T)</a>

```
searchKey: resolvers.TestCreateBatchSpec
```

```Go
func TestCreateBatchSpec(t *testing.T)
```

### <a id="TestCreateChangesetSpec" href="#TestCreateChangesetSpec">func TestCreateChangesetSpec(t *testing.T)</a>

```
searchKey: resolvers.TestCreateChangesetSpec
```

```Go
func TestCreateChangesetSpec(t *testing.T)
```

### <a id="TestApplyBatchChange" href="#TestApplyBatchChange">func TestApplyBatchChange(t *testing.T)</a>

```
searchKey: resolvers.TestApplyBatchChange
```

```Go
func TestApplyBatchChange(t *testing.T)
```

### <a id="TestCreateBatchChange" href="#TestCreateBatchChange">func TestCreateBatchChange(t *testing.T)</a>

```
searchKey: resolvers.TestCreateBatchChange
```

```Go
func TestCreateBatchChange(t *testing.T)
```

### <a id="TestMoveBatchChange" href="#TestMoveBatchChange">func TestMoveBatchChange(t *testing.T)</a>

```
searchKey: resolvers.TestMoveBatchChange
```

```Go
func TestMoveBatchChange(t *testing.T)
```

### <a id="TestListChangesetOptsFromArgs" href="#TestListChangesetOptsFromArgs">func TestListChangesetOptsFromArgs(t *testing.T)</a>

```
searchKey: resolvers.TestListChangesetOptsFromArgs
```

```Go
func TestListChangesetOptsFromArgs(t *testing.T)
```

### <a id="TestCreateBatchChangesCredential" href="#TestCreateBatchChangesCredential">func TestCreateBatchChangesCredential(t *testing.T)</a>

```
searchKey: resolvers.TestCreateBatchChangesCredential
```

```Go
func TestCreateBatchChangesCredential(t *testing.T)
```

### <a id="TestDeleteBatchChangesCredential" href="#TestDeleteBatchChangesCredential">func TestDeleteBatchChangesCredential(t *testing.T)</a>

```
searchKey: resolvers.TestDeleteBatchChangesCredential
```

```Go
func TestDeleteBatchChangesCredential(t *testing.T)
```

### <a id="TestCreateChangesetComments" href="#TestCreateChangesetComments">func TestCreateChangesetComments(t *testing.T)</a>

```
searchKey: resolvers.TestCreateChangesetComments
```

```Go
func TestCreateChangesetComments(t *testing.T)
```

### <a id="TestReenqueueChangesets" href="#TestReenqueueChangesets">func TestReenqueueChangesets(t *testing.T)</a>

```
searchKey: resolvers.TestReenqueueChangesets
```

```Go
func TestReenqueueChangesets(t *testing.T)
```

### <a id="TestMergeChangesets" href="#TestMergeChangesets">func TestMergeChangesets(t *testing.T)</a>

```
searchKey: resolvers.TestMergeChangesets
```

```Go
func TestMergeChangesets(t *testing.T)
```

### <a id="stringPtr" href="#stringPtr">func stringPtr(s string) *string</a>

```
searchKey: resolvers.stringPtr
```

```Go
func stringPtr(s string) *string
```

