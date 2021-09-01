# Package graphqlbackend

Package graphqlbackend implements the GraphQL API. 

## Index

* Subpages
  * [cmd/frontend/graphqlbackend/externallink](graphqlbackend/externallink.md)
  * [cmd/frontend/graphqlbackend/graphqlutil](graphqlbackend/graphqlutil.md)
* [Constants](#const)
    * [const AlertTypeError](#AlertTypeError)
    * [const AlertTypeInfo](#AlertTypeInfo)
    * [const AlertTypeWarning](#AlertTypeWarning)
    * [const costEstimateVersion](#costEstimateVersion)
    * [const defaultMaxSearchResults](#defaultMaxSearchResults)
    * [const defaultMaxSearchResultsStreaming](#defaultMaxSearchResultsStreaming)
    * [const exampleCommitSHA1](#exampleCommitSHA1)
    * [const externalServiceIDKind](#externalServiceIDKind)
    * [const gitObjectTypeBlob](#gitObjectTypeBlob)
    * [const gitObjectTypeCommit](#gitObjectTypeCommit)
    * [const gitObjectTypeTag](#gitObjectTypeTag)
    * [const gitObjectTypeTree](#gitObjectTypeTree)
    * [const gitObjectTypeUnknown](#gitObjectTypeUnknown)
    * [const gitRefOrderAuthoredOrCommittedAt](#gitRefOrderAuthoredOrCommittedAt)
    * [const gitRefTypeBranch](#gitRefTypeBranch)
    * [const gitRefTypeOther](#gitRefTypeOther)
    * [const gitRefTypeTag](#gitRefTypeTag)
    * [const maxSearchResultsPerPaginatedRequest](#maxSearchResultsPerPaginatedRequest)
    * [const maxSearchSuggestions](#maxSearchSuggestions)
    * [const maxUserPublicRepos](#maxUserPublicRepos)
    * [const repositoryCursorKind](#repositoryCursorKind)
    * [const searchContextCursorKind](#searchContextCursorKind)
    * [const searchContextsOrderBySpec](#searchContextsOrderBySpec)
    * [const searchContextsOrderByUpdatedAt](#searchContextsOrderByUpdatedAt)
    * [const searchCursorKind](#searchCursorKind)
    * [const singletonDefaultSettingsGQLID](#singletonDefaultSettingsGQLID)
    * [const singletonSiteGQLID](#singletonSiteGQLID)
    * [const testCopyDiff](#testCopyDiff)
    * [const testDiff](#testDiff)
    * [const testDiffFiles](#testDiffFiles)
    * [const testDiffFirstHunk](#testDiffFirstHunk)
* [Variables](#var)
    * [var ActualUserCount](#ActualUserCount)
    * [var ActualUserCountDate](#ActualUserCountDate)
    * [var AlertFuncs](#AlertFuncs)
    * [var EnterpriseResolvers](#EnterpriseResolvers)
    * [var ErrExtensionsDisabled](#ErrExtensionsDisabled)
    * [var ErrPredicateNoResults](#ErrPredicateNoResults)
    * [var ExtensionRegistry](#ExtensionRegistry)
    * [var GetConfiguredProductLicenseInfo](#GetConfiguredProductLicenseInfo)
    * [var GetProductNameWithBrand](#GetProductNameWithBrand)
    * [var NoLicenseMaximumAllowedUserCount](#NoLicenseMaximumAllowedUserCount)
    * [var NoLicenseWarningUserCount](#NoLicenseWarningUserCount)
    * [var NodeToRegistryExtension](#NodeToRegistryExtension)
    * [var RegistryExtensionByID](#RegistryExtensionByID)
    * [var allowedPrometheusFieldNames](#allowedPrometheusFieldNames)
    * [var authzSchema](#authzSchema)
    * [var batchesSchema](#batchesSchema)
    * [var blocklistedPrometheusTypeNames](#blocklistedPrometheusTypeNames)
    * [var builtinExtensions](#builtinExtensions)
    * [var canReloadSite](#canReloadSite)
    * [var cf](#cf)
    * [var codeIntelRequests](#codeIntelRequests)
    * [var codeIntelSchema](#codeIntelSchema)
    * [var codeIntelSearchHistogram](#codeIntelSearchHistogram)
    * [var codeMonitorsSchema](#codeMonitorsSchema)
    * [var deeplyMergedSettingsFields](#deeplyMergedSettingsFields)
    * [var defaultTimeout](#defaultTimeout)
    * [var disableSecurity](#disableSecurity)
    * [var dotcomSchema](#dotcomSchema)
    * [var emailTemplates](#emailTemplates)
    * [var errMissingPatternType](#errMissingPatternType)
    * [var errNoAccessExternalService](#errNoAccessExternalService)
    * [var errUnknownSettingsSubject](#errUnknownSettingsSubject)
    * [var extsvcConfigAllowEdits](#extsvcConfigAllowEdits)
    * [var globalSettingsAllowEdits](#globalSettingsAllowEdits)
    * [var graphqlFieldHistogram](#graphqlFieldHistogram)
    * [var highlightHistogram](#highlightHistogram)
    * [var insightsSchema](#insightsSchema)
    * [var licenseSchema](#licenseSchema)
    * [var mainSchema](#mainSchema)
    * [var metricLabels](#metricLabels)
    * [var mockCount](#mockCount)
    * [var mockDecodedViewerFinalSettings](#mockDecodedViewerFinalSettings)
    * [var mockResolveRepositories](#mockResolveRepositories)
    * [var mockSettingsCascadeSubjects](#mockSettingsCascadeSubjects)
    * [var mockShowFileSuggestions](#mockShowFileSuggestions)
    * [var mockShowLangSuggestions](#mockShowLangSuggestions)
    * [var mockShowRepoSuggestions](#mockShowRepoSuggestions)
    * [var mockShowSymbolMatches](#mockShowSymbolMatches)
    * [var nonSCPURLRegex](#nonSCPURLRegex)
    * [var numTotalRepos](#numTotalRepos)
    * [var opaqueCursor](#opaqueCursor)
    * [var parseSchemaErr](#parseSchemaErr)
    * [var parseSchemaOnce](#parseSchemaOnce)
    * [var parsedSchema](#parsedSchema)
    * [var patternType](#patternType)
    * [var quantityParams](#quantityParams)
    * [var rawCursor](#rawCursor)
    * [var scopeCache](#scopeCache)
    * [var searchLatenciesFrontendCodeLoad](#searchLatenciesFrontendCodeLoad)
    * [var searchLatenciesFrontendFirstResult](#searchLatenciesFrontendFirstResult)
    * [var searchLatencyHistogram](#searchLatencyHistogram)
    * [var searchResponseCounter](#searchResponseCounter)
    * [var searchResultsStatsCache](#searchResultsStatsCache)
    * [var searchResultsStatsCounter](#searchResultsStatsCounter)
    * [var siteConfigAllowEdits](#siteConfigAllowEdits)
    * [var testMetricCritical](#testMetricCritical)
    * [var testMetricWarning](#testMetricWarning)
    * [var testSearchGQLQuery](#testSearchGQLQuery)
    * [var timeNow](#timeNow)
* [Types](#type)
    * [type Alert struct](#Alert)
        * [func determineOutOfDateAlert(isAdmin bool, months int, offline bool) *Alert](#determineOutOfDateAlert)
        * [func (r *Alert) IsDismissibleWithKey() *string](#Alert.IsDismissibleWithKey)
        * [func (r *Alert) Message() string](#Alert.Message)
        * [func (r *Alert) Type() string](#Alert.Type)
    * [type AlertFuncArgs struct](#AlertFuncArgs)
    * [type ApplyBatchChangeArgs struct](#ApplyBatchChangeArgs)
    * [type ApplyCampaignArgs struct](#ApplyCampaignArgs)
    * [type ArchiveProductSubscriptionArgs struct](#ArchiveProductSubscriptionArgs)
    * [type AuthorizedRepoArgs struct](#AuthorizedRepoArgs)
    * [type AuthorizedUserArgs struct](#AuthorizedUserArgs)
    * [type AuthzResolver interface](#AuthzResolver)
    * [type BasicLimitWatcher graphqlbackend.RateLimitWatcher](#BasicLimitWatcher)
        * [func NewBasicLimitWatcher(store throttled.GCRAStore) *BasicLimitWatcher](#NewBasicLimitWatcher)
        * [func (bl *BasicLimitWatcher) Get() (Limiter, bool)](#BasicLimitWatcher.Get)
        * [func (bl *BasicLimitWatcher) updateFromConfig(limit int)](#BasicLimitWatcher.updateFromConfig)
    * [type BasicLimiter struct](#BasicLimiter)
        * [func (bl *BasicLimiter) RateLimit(_ string, _ int, args LimiterArgs) (bool, throttled.RateLimitResult, error)](#BasicLimiter.RateLimit)
    * [type BatchChangeArgs struct](#BatchChangeArgs)
    * [type BatchChangeDescriptionResolver interface](#BatchChangeDescriptionResolver)
    * [type BatchChangeResolver interface](#BatchChangeResolver)
    * [type BatchChangesCodeHostConnectionResolver interface](#BatchChangesCodeHostConnectionResolver)
    * [type BatchChangesCodeHostResolver interface](#BatchChangesCodeHostResolver)
    * [type BatchChangesConnectionResolver interface](#BatchChangesConnectionResolver)
    * [type BatchChangesCredentialResolver interface](#BatchChangesCredentialResolver)
    * [type BatchChangesResolver interface](#BatchChangesResolver)
    * [type BatchSpecResolver interface](#BatchSpecResolver)
    * [type BigInt struct](#BigInt)
        * [func BigIntOrNil(int *int64) *BigInt](#BigIntOrNil)
        * [func (BigInt) ImplementsGraphQLType(name string) bool](#BigInt.ImplementsGraphQLType)
        * [func (v BigInt) MarshalJSON() ([]byte, error)](#BigInt.MarshalJSON)
        * [func (v *BigInt) UnmarshalGraphQL(input interface{}) error](#BigInt.UnmarshalGraphQL)
    * [type BulkOperationBaseArgs struct](#BulkOperationBaseArgs)
    * [type BulkOperationConnectionResolver interface](#BulkOperationConnectionResolver)
    * [type BulkOperationResolver interface](#BulkOperationResolver)
    * [type CampaignsCodeHostConnectionResolver interface](#CampaignsCodeHostConnectionResolver)
    * [type CampaignsCodeHostResolver interface](#CampaignsCodeHostResolver)
    * [type CampaignsCredentialResolver interface](#CampaignsCredentialResolver)
    * [type ChangesetApplyPreviewConnectionArgs struct](#ChangesetApplyPreviewConnectionArgs)
    * [type ChangesetApplyPreviewConnectionResolver interface](#ChangesetApplyPreviewConnectionResolver)
    * [type ChangesetApplyPreviewConnectionStatsResolver interface](#ChangesetApplyPreviewConnectionStatsResolver)
    * [type ChangesetApplyPreviewResolver interface](#ChangesetApplyPreviewResolver)
    * [type ChangesetCountsArgs struct](#ChangesetCountsArgs)
    * [type ChangesetCountsResolver interface](#ChangesetCountsResolver)
    * [type ChangesetDescription interface](#ChangesetDescription)
    * [type ChangesetEventResolver interface](#ChangesetEventResolver)
    * [type ChangesetEventsConnectionArgs struct](#ChangesetEventsConnectionArgs)
    * [type ChangesetEventsConnectionResolver interface](#ChangesetEventsConnectionResolver)
    * [type ChangesetJobErrorResolver interface](#ChangesetJobErrorResolver)
    * [type ChangesetLabelResolver interface](#ChangesetLabelResolver)
    * [type ChangesetResolver interface](#ChangesetResolver)
    * [type ChangesetSpecConnectionResolver interface](#ChangesetSpecConnectionResolver)
    * [type ChangesetSpecDeltaResolver interface](#ChangesetSpecDeltaResolver)
    * [type ChangesetSpecResolver interface](#ChangesetSpecResolver)
    * [type ChangesetSpecsConnectionArgs struct](#ChangesetSpecsConnectionArgs)
    * [type ChangesetsConnectionResolver interface](#ChangesetsConnectionResolver)
    * [type ChangesetsStatsResolver interface](#ChangesetsStatsResolver)
    * [type CloseBatchChangeArgs struct](#CloseBatchChangeArgs)
    * [type CloseCampaignArgs struct](#CloseCampaignArgs)
    * [type CodeIntelResolver interface](#CodeIntelResolver)
    * [type CodeIntelligenceCommitGraphResolver interface](#CodeIntelligenceCommitGraphResolver)
    * [type CodeIntelligenceRangeConnectionResolver interface](#CodeIntelligenceRangeConnectionResolver)
    * [type CodeIntelligenceRangeResolver interface](#CodeIntelligenceRangeResolver)
    * [type CodeMonitorsResolver interface](#CodeMonitorsResolver)
    * [type CommitSearchResultResolver struct](#CommitSearchResultResolver)
        * [func (r *CommitSearchResultResolver) Commit() *GitCommitResolver](#CommitSearchResultResolver.Commit)
        * [func (r *CommitSearchResultResolver) Detail() Markdown](#CommitSearchResultResolver.Detail)
        * [func (r *CommitSearchResultResolver) DiffPreview() *highlightedStringResolver](#CommitSearchResultResolver.DiffPreview)
        * [func (r *CommitSearchResultResolver) Label() Markdown](#CommitSearchResultResolver.Label)
        * [func (r *CommitSearchResultResolver) Matches() []*searchResultMatchResolver](#CommitSearchResultResolver.Matches)
        * [func (r *CommitSearchResultResolver) MessagePreview() *highlightedStringResolver](#CommitSearchResultResolver.MessagePreview)
        * [func (r *CommitSearchResultResolver) Refs() []*GitRefResolver](#CommitSearchResultResolver.Refs)
        * [func (r *CommitSearchResultResolver) ResultCount() int32](#CommitSearchResultResolver.ResultCount)
        * [func (r *CommitSearchResultResolver) SourceRefs() []*GitRefResolver](#CommitSearchResultResolver.SourceRefs)
        * [func (r *CommitSearchResultResolver) ToCommitSearchResult() (*CommitSearchResultResolver, bool)](#CommitSearchResultResolver.ToCommitSearchResult)
        * [func (r *CommitSearchResultResolver) ToFileMatch() (*FileMatchResolver, bool)](#CommitSearchResultResolver.ToFileMatch)
        * [func (r *CommitSearchResultResolver) ToRepository() (*RepositoryResolver, bool)](#CommitSearchResultResolver.ToRepository)
        * [func (r *CommitSearchResultResolver) URL() string](#CommitSearchResultResolver.URL)
    * [type ComputeDiffFunc func(ctx context.Context, args *github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.FileDiffsConnectionArgs) ([]*github.com/sourcegraph/go-diff/diff.FileDiff, int32, bool, error)](#ComputeDiffFunc)
        * [func computeRepositoryComparisonDiff(cmp *RepositoryComparisonResolver) ComputeDiffFunc](#computeRepositoryComparisonDiff)
    * [type CreateActionArgs struct](#CreateActionArgs)
    * [type CreateActionEmailArgs struct](#CreateActionEmailArgs)
    * [type CreateBatchChangeArgs struct](#CreateBatchChangeArgs)
    * [type CreateBatchChangesCredentialArgs struct](#CreateBatchChangesCredentialArgs)
    * [type CreateBatchSpecArgs struct](#CreateBatchSpecArgs)
    * [type CreateCampaignArgs struct](#CreateCampaignArgs)
    * [type CreateCampaignSpecArgs struct](#CreateCampaignSpecArgs)
    * [type CreateCampaignsCredentialArgs struct](#CreateCampaignsCredentialArgs)
    * [type CreateChangesetCommentsArgs struct](#CreateChangesetCommentsArgs)
    * [type CreateChangesetSpecArgs struct](#CreateChangesetSpecArgs)
    * [type CreateCodeMonitorArgs struct](#CreateCodeMonitorArgs)
    * [type CreateMonitorArgs struct](#CreateMonitorArgs)
    * [type CreatePaidProductSubscriptionArgs struct](#CreatePaidProductSubscriptionArgs)
    * [type CreatePaidProductSubscriptionResult struct](#CreatePaidProductSubscriptionResult)
        * [func (r *CreatePaidProductSubscriptionResult) ProductSubscription() ProductSubscription](#CreatePaidProductSubscriptionResult.ProductSubscription)
    * [type CreateProductSubscriptionArgs struct](#CreateProductSubscriptionArgs)
    * [type CreateTriggerArgs struct](#CreateTriggerArgs)
    * [type DateTime struct](#DateTime)
        * [func DateTimeOrNil(time *time.Time) *DateTime](#DateTimeOrNil)
        * [func (DateTime) ImplementsGraphQLType(name string) bool](#DateTime.ImplementsGraphQLType)
        * [func (v DateTime) MarshalJSON() ([]byte, error)](#DateTime.MarshalJSON)
        * [func (v *DateTime) UnmarshalGraphQL(input interface{}) error](#DateTime.UnmarshalGraphQL)
    * [type DeleteBatchChangeArgs struct](#DeleteBatchChangeArgs)
    * [type DeleteBatchChangesCredentialArgs struct](#DeleteBatchChangesCredentialArgs)
    * [type DeleteCampaignArgs struct](#DeleteCampaignArgs)
    * [type DeleteCampaignsCredentialArgs struct](#DeleteCampaignsCredentialArgs)
    * [type DeleteCodeMonitorArgs struct](#DeleteCodeMonitorArgs)
    * [type DetachChangesetsArgs struct](#DetachChangesetsArgs)
    * [type DiagnosticConnectionResolver interface](#DiagnosticConnectionResolver)
    * [type DiagnosticResolver interface](#DiagnosticResolver)
    * [type DiffHunk struct](#DiffHunk)
        * [func NewDiffHunk(hunk *diff.Hunk, highlighter FileDiffHighlighter) *DiffHunk](#NewDiffHunk)
        * [func (r *DiffHunk) Body() string](#DiffHunk.Body)
        * [func (r *DiffHunk) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedDiffHunkBodyResolver, error)](#DiffHunk.Highlight)
        * [func (r *DiffHunk) NewRange() *DiffHunkRange](#DiffHunk.NewRange)
        * [func (r *DiffHunk) OldNoNewlineAt() bool](#DiffHunk.OldNoNewlineAt)
        * [func (r *DiffHunk) OldRange() *DiffHunkRange](#DiffHunk.OldRange)
        * [func (r *DiffHunk) Section() *string](#DiffHunk.Section)
    * [type DiffHunkRange struct](#DiffHunkRange)
        * [func NewDiffHunkRange(startLine, lines int32) *DiffHunkRange](#NewDiffHunkRange)
        * [func (r *DiffHunkRange) Lines() int32](#DiffHunkRange.Lines)
        * [func (r *DiffHunkRange) StartLine() int32](#DiffHunkRange.StartLine)
    * [type DiffStat struct](#DiffStat)
        * [func NewDiffStat(s diff.Stat) *DiffStat](#NewDiffStat)
        * [func (r *DiffStat) AddDiffStat(s *DiffStat)](#DiffStat.AddDiffStat)
        * [func (r *DiffStat) AddStat(s diff.Stat)](#DiffStat.AddStat)
        * [func (r *DiffStat) Added() int32](#DiffStat.Added)
        * [func (r *DiffStat) Changed() int32](#DiffStat.Changed)
        * [func (r *DiffStat) Deleted() int32](#DiffStat.Deleted)
    * [type DocumentationPageResolver interface](#DocumentationPageResolver)
    * [type DotcomResolver interface](#DotcomResolver)
    * [type DotcomRootResolver interface](#DotcomRootResolver)
    * [type EditActionArgs struct](#EditActionArgs)
    * [type EditActionEmailArgs struct](#EditActionEmailArgs)
    * [type EditMonitorArgs struct](#EditMonitorArgs)
    * [type EditTriggerArgs struct](#EditTriggerArgs)
    * [type EmptyResponse struct{}](#EmptyResponse)
        * [func (er *EmptyResponse) AlwaysNil() *string](#EmptyResponse.AlwaysNil)
    * [type EnterpriseLicenseHasFeatureArgs struct](#EnterpriseLicenseHasFeatureArgs)
    * [type EvaluatedFeatureFlagResolver struct](#EvaluatedFeatureFlagResolver)
        * [func (e *EvaluatedFeatureFlagResolver) Name() string](#EvaluatedFeatureFlagResolver.Name)
        * [func (e *EvaluatedFeatureFlagResolver) Value() bool](#EvaluatedFeatureFlagResolver.Value)
    * [type ExecutionLogEntryResolver interface](#ExecutionLogEntryResolver)
    * [type ExistingChangesetReferenceResolver interface](#ExistingChangesetReferenceResolver)
    * [type ExtensionManifest interface](#ExtensionManifest)
    * [type ExtensionRegistryCreateExtensionArgs struct](#ExtensionRegistryCreateExtensionArgs)
    * [type ExtensionRegistryDeleteExtensionArgs struct](#ExtensionRegistryDeleteExtensionArgs)
    * [type ExtensionRegistryExtensionArgs struct](#ExtensionRegistryExtensionArgs)
    * [type ExtensionRegistryMutationResult interface](#ExtensionRegistryMutationResult)
    * [type ExtensionRegistryPublishExtensionArgs struct](#ExtensionRegistryPublishExtensionArgs)
    * [type ExtensionRegistryResolver interface](#ExtensionRegistryResolver)
    * [type ExtensionRegistryUpdateExtensionArgs struct](#ExtensionRegistryUpdateExtensionArgs)
    * [type ExternalChangesetResolver interface](#ExternalChangesetResolver)
    * [type ExternalServicesArgs struct](#ExternalServicesArgs)
    * [type FeatureFlagBooleanResolver struct](#FeatureFlagBooleanResolver)
        * [func (f *FeatureFlagBooleanResolver) Name() string](#FeatureFlagBooleanResolver.Name)
        * [func (f *FeatureFlagBooleanResolver) Overrides(ctx context.Context) ([]*FeatureFlagOverrideResolver, error)](#FeatureFlagBooleanResolver.Overrides)
        * [func (f *FeatureFlagBooleanResolver) Value() bool](#FeatureFlagBooleanResolver.Value)
    * [type FeatureFlagOverrideResolver struct](#FeatureFlagOverrideResolver)
        * [func (f *FeatureFlagOverrideResolver) ID() graphql.ID](#FeatureFlagOverrideResolver.ID)
        * [func (f *FeatureFlagOverrideResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)](#FeatureFlagOverrideResolver.Namespace)
        * [func (f *FeatureFlagOverrideResolver) TargetFlag(ctx context.Context) (*FeatureFlagResolver, error)](#FeatureFlagOverrideResolver.TargetFlag)
        * [func (f *FeatureFlagOverrideResolver) Value() bool](#FeatureFlagOverrideResolver.Value)
    * [type FeatureFlagResolver struct](#FeatureFlagResolver)
        * [func (f *FeatureFlagResolver) ToFeatureFlagBoolean() (*FeatureFlagBooleanResolver, bool)](#FeatureFlagResolver.ToFeatureFlagBoolean)
        * [func (f *FeatureFlagResolver) ToFeatureFlagRollout() (*FeatureFlagRolloutResolver, bool)](#FeatureFlagResolver.ToFeatureFlagRollout)
    * [type FeatureFlagRolloutResolver struct](#FeatureFlagRolloutResolver)
        * [func (f *FeatureFlagRolloutResolver) Name() string](#FeatureFlagRolloutResolver.Name)
        * [func (f *FeatureFlagRolloutResolver) Overrides(ctx context.Context) ([]*FeatureFlagOverrideResolver, error)](#FeatureFlagRolloutResolver.Overrides)
        * [func (f *FeatureFlagRolloutResolver) RolloutBasisPoints() int32](#FeatureFlagRolloutResolver.RolloutBasisPoints)
    * [type FeaturedExtensionsConnection interface](#FeaturedExtensionsConnection)
    * [type FileContentFunc func(ctx context.Context) (string, error)](#FileContentFunc)
        * [func fileDiffVirtualFileContent(r *FileDiffResolver) FileContentFunc](#fileDiffVirtualFileContent)
    * [type FileDiff interface](#FileDiff)
    * [type FileDiffConnection interface](#FileDiffConnection)
    * [type FileDiffHighlighter interface](#FileDiffHighlighter)
    * [type FileDiffResolver struct](#FileDiffResolver)
        * [func (r *FileDiffResolver) Hunks() []*DiffHunk](#FileDiffResolver.Hunks)
        * [func (r *FileDiffResolver) InternalID() string](#FileDiffResolver.InternalID)
        * [func (r *FileDiffResolver) MostRelevantFile() FileResolver](#FileDiffResolver.MostRelevantFile)
        * [func (r *FileDiffResolver) NewFile() FileResolver](#FileDiffResolver.NewFile)
        * [func (r *FileDiffResolver) NewPath() *string](#FileDiffResolver.NewPath)
        * [func (r *FileDiffResolver) OldFile() FileResolver](#FileDiffResolver.OldFile)
        * [func (r *FileDiffResolver) OldPath() *string](#FileDiffResolver.OldPath)
        * [func (r *FileDiffResolver) Stat() *DiffStat](#FileDiffResolver.Stat)
    * [type FileDiffsConnectionArgs struct](#FileDiffsConnectionArgs)
    * [type FileMatchResolver struct](#FileMatchResolver)
        * [func (fm *FileMatchResolver) Commit() *GitCommitResolver](#FileMatchResolver.Commit)
        * [func (fm *FileMatchResolver) Equal(other *FileMatchResolver) bool](#FileMatchResolver.Equal)
        * [func (fm *FileMatchResolver) File() *GitTreeEntryResolver](#FileMatchResolver.File)
        * [func (fm *FileMatchResolver) Key() string](#FileMatchResolver.Key)
        * [func (fm *FileMatchResolver) LimitHit() bool](#FileMatchResolver.LimitHit)
        * [func (fm *FileMatchResolver) LineMatches() []lineMatchResolver](#FileMatchResolver.LineMatches)
        * [func (fm *FileMatchResolver) Repository() *RepositoryResolver](#FileMatchResolver.Repository)
        * [func (fm *FileMatchResolver) ResultCount() int32](#FileMatchResolver.ResultCount)
        * [func (fm *FileMatchResolver) RevSpec() *gitRevSpec](#FileMatchResolver.RevSpec)
        * [func (fm *FileMatchResolver) Symbols() []symbolResolver](#FileMatchResolver.Symbols)
        * [func (fm *FileMatchResolver) ToCommitSearchResult() (*CommitSearchResultResolver, bool)](#FileMatchResolver.ToCommitSearchResult)
        * [func (fm *FileMatchResolver) ToFileMatch() (*FileMatchResolver, bool)](#FileMatchResolver.ToFileMatch)
        * [func (fm *FileMatchResolver) ToRepository() (*RepositoryResolver, bool)](#FileMatchResolver.ToRepository)
    * [type FileResolver interface](#FileResolver)
        * [func previewNewFile(db dbutil.DB, r *FileDiffResolver) FileResolver](#previewNewFile)
        * [func repositoryComparisonNewFile(db dbutil.DB, r *FileDiffResolver) FileResolver](#repositoryComparisonNewFile)
    * [type GenerateProductLicenseForSubscriptionArgs struct](#GenerateProductLicenseForSubscriptionArgs)
    * [type GitBlobLSIFDataArgs struct](#GitBlobLSIFDataArgs)
    * [type GitBlobLSIFDataResolver interface](#GitBlobLSIFDataResolver)
    * [type GitBranchChangesetDescriptionResolver interface](#GitBranchChangesetDescriptionResolver)
    * [type GitCommitDescriptionResolver interface](#GitCommitDescriptionResolver)
    * [type GitCommitResolver struct](#GitCommitResolver)
        * [func toGitCommitResolver(repo *RepositoryResolver, db dbutil.DB, id api.CommitID, commit *git.Commit) *GitCommitResolver](#toGitCommitResolver)
        * [func (r *GitCommitResolver) AbbreviatedOID() string](#GitCommitResolver.AbbreviatedOID)
        * [func (r *GitCommitResolver) Ancestors(ctx context.Context, args *struct {...](#GitCommitResolver.Ancestors)
        * [func (r *GitCommitResolver) Author(ctx context.Context) (*signatureResolver, error)](#GitCommitResolver.Author)
        * [func (r *GitCommitResolver) BehindAhead(ctx context.Context, args *struct {...](#GitCommitResolver.BehindAhead)
        * [func (r *GitCommitResolver) Blob(ctx context.Context, args *struct {...](#GitCommitResolver.Blob)
        * [func (r *GitCommitResolver) Body(ctx context.Context) (*string, error)](#GitCommitResolver.Body)
        * [func (r *GitCommitResolver) CanonicalURL() string](#GitCommitResolver.CanonicalURL)
        * [func (r *GitCommitResolver) Committer(ctx context.Context) (*signatureResolver, error)](#GitCommitResolver.Committer)
        * [func (r *GitCommitResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)](#GitCommitResolver.ExternalURLs)
        * [func (r *GitCommitResolver) File(ctx context.Context, args *struct {...](#GitCommitResolver.File)
        * [func (r *GitCommitResolver) FileNames(ctx context.Context) ([]string, error)](#GitCommitResolver.FileNames)
        * [func (r *GitCommitResolver) ID() graphql.ID](#GitCommitResolver.ID)
        * [func (r *GitCommitResolver) InputRev() *string](#GitCommitResolver.InputRev)
        * [func (r *GitCommitResolver) LanguageStatistics(ctx context.Context) ([]*languageStatisticsResolver, error)](#GitCommitResolver.LanguageStatistics)
        * [func (r *GitCommitResolver) Languages(ctx context.Context) ([]string, error)](#GitCommitResolver.Languages)
        * [func (r *GitCommitResolver) Message(ctx context.Context) (string, error)](#GitCommitResolver.Message)
        * [func (r *GitCommitResolver) OID() GitObjectID](#GitCommitResolver.OID)
        * [func (r *GitCommitResolver) Parents(ctx context.Context) ([]*GitCommitResolver, error)](#GitCommitResolver.Parents)
        * [func (r *GitCommitResolver) Repository() *RepositoryResolver](#GitCommitResolver.Repository)
        * [func (r *GitCommitResolver) Subject(ctx context.Context) (string, error)](#GitCommitResolver.Subject)
        * [func (r *GitCommitResolver) Symbols(ctx context.Context, args *symbolsArgs) (*symbolConnectionResolver, error)](#GitCommitResolver.Symbols)
        * [func (r *GitCommitResolver) Tree(ctx context.Context, args *struct {...](#GitCommitResolver.Tree)
        * [func (r *GitCommitResolver) URL() string](#GitCommitResolver.URL)
        * [func (r *GitCommitResolver) canonicalRepoRevURL() *url.URL](#GitCommitResolver.canonicalRepoRevURL)
        * [func (r *GitCommitResolver) inputRevOrImmutableRev() string](#GitCommitResolver.inputRevOrImmutableRev)
        * [func (r *GitCommitResolver) repoRevURL() *url.URL](#GitCommitResolver.repoRevURL)
        * [func (r *GitCommitResolver) resolveCommit(ctx context.Context) (*git.Commit, error)](#GitCommitResolver.resolveCommit)
    * [type GitObjectID string](#GitObjectID)
        * [func unmarshalGitCommitID(id graphql.ID) (repoID graphql.ID, commitID GitObjectID, err error)](#unmarshalGitCommitID)
        * [func (GitObjectID) ImplementsGraphQLType(name string) bool](#GitObjectID.ImplementsGraphQLType)
        * [func (id *GitObjectID) UnmarshalGraphQL(input interface{}) error](#GitObjectID.UnmarshalGraphQL)
    * [type GitRefResolver struct](#GitRefResolver)
        * [func NewGitRefResolver(repo *RepositoryResolver, name string, target GitObjectID) *GitRefResolver](#NewGitRefResolver)
        * [func (r *GitRefResolver) AbbrevName() string](#GitRefResolver.AbbrevName)
        * [func (r *GitRefResolver) DisplayName() string](#GitRefResolver.DisplayName)
        * [func (r *GitRefResolver) ID() graphql.ID](#GitRefResolver.ID)
        * [func (r *GitRefResolver) Name() string](#GitRefResolver.Name)
        * [func (r *GitRefResolver) Prefix() string](#GitRefResolver.Prefix)
        * [func (r *GitRefResolver) Repository() *RepositoryResolver](#GitRefResolver.Repository)
        * [func (r *GitRefResolver) Target() interface {...](#GitRefResolver.Target)
        * [func (r *GitRefResolver) Type() string](#GitRefResolver.Type)
        * [func (r *GitRefResolver) URL() string](#GitRefResolver.URL)
    * [type GitTreeEntryResolver struct](#GitTreeEntryResolver)
        * [func NewGitTreeEntryResolver(commit *GitCommitResolver, db dbutil.DB, stat fs.FileInfo) *GitTreeEntryResolver](#NewGitTreeEntryResolver)
        * [func (r *GitTreeEntryResolver) Binary(ctx context.Context) (bool, error)](#GitTreeEntryResolver.Binary)
        * [func (r *GitTreeEntryResolver) Blame(ctx context.Context,...](#GitTreeEntryResolver.Blame)
        * [func (r *GitTreeEntryResolver) ByteSize(ctx context.Context) (int32, error)](#GitTreeEntryResolver.ByteSize)
        * [func (r *GitTreeEntryResolver) CanonicalURL() string](#GitTreeEntryResolver.CanonicalURL)
        * [func (r *GitTreeEntryResolver) Commit() *GitCommitResolver](#GitTreeEntryResolver.Commit)
        * [func (r *GitTreeEntryResolver) Content(ctx context.Context) (string, error)](#GitTreeEntryResolver.Content)
        * [func (r *GitTreeEntryResolver) Directories(ctx context.Context, args *gitTreeEntryConnectionArgs) ([]*GitTreeEntryResolver, error)](#GitTreeEntryResolver.Directories)
        * [func (r *GitTreeEntryResolver) Entries(ctx context.Context, args *gitTreeEntryConnectionArgs) ([]*GitTreeEntryResolver, error)](#GitTreeEntryResolver.Entries)
        * [func (r *GitTreeEntryResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)](#GitTreeEntryResolver.ExternalURLs)
        * [func (r *GitTreeEntryResolver) Files(ctx context.Context, args *gitTreeEntryConnectionArgs) ([]*GitTreeEntryResolver, error)](#GitTreeEntryResolver.Files)
        * [func (r *GitTreeEntryResolver) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)](#GitTreeEntryResolver.Highlight)
        * [func (r *GitTreeEntryResolver) IsDirectory() bool](#GitTreeEntryResolver.IsDirectory)
        * [func (r *GitTreeEntryResolver) IsRecursive() bool](#GitTreeEntryResolver.IsRecursive)
        * [func (r *GitTreeEntryResolver) IsRoot() bool](#GitTreeEntryResolver.IsRoot)
        * [func (r *GitTreeEntryResolver) IsSingleChild(ctx context.Context, args *gitTreeEntryConnectionArgs) (bool, error)](#GitTreeEntryResolver.IsSingleChild)
        * [func (r *GitTreeEntryResolver) LSIF(ctx context.Context, args *struct{ ToolName *string }) (GitBlobLSIFDataResolver, error)](#GitTreeEntryResolver.LSIF)
        * [func (r *GitTreeEntryResolver) Name() string](#GitTreeEntryResolver.Name)
        * [func (r *GitTreeEntryResolver) Path() string](#GitTreeEntryResolver.Path)
        * [func (r *GitTreeEntryResolver) RawZipArchiveURL() string](#GitTreeEntryResolver.RawZipArchiveURL)
        * [func (r *GitTreeEntryResolver) Repository() *RepositoryResolver](#GitTreeEntryResolver.Repository)
        * [func (r *GitTreeEntryResolver) RichHTML(ctx context.Context) (string, error)](#GitTreeEntryResolver.RichHTML)
        * [func (r *GitTreeEntryResolver) Submodule() *gitSubmoduleResolver](#GitTreeEntryResolver.Submodule)
        * [func (r *GitTreeEntryResolver) Symbols(ctx context.Context, args *symbolsArgs) (*symbolConnectionResolver, error)](#GitTreeEntryResolver.Symbols)
        * [func (r *GitTreeEntryResolver) ToGitBlob() (*GitTreeEntryResolver, bool)](#GitTreeEntryResolver.ToGitBlob)
        * [func (r *GitTreeEntryResolver) ToGitTree() (*GitTreeEntryResolver, bool)](#GitTreeEntryResolver.ToGitTree)
        * [func (r *GitTreeEntryResolver) ToVirtualFile() (*virtualFileResolver, bool)](#GitTreeEntryResolver.ToVirtualFile)
        * [func (r *GitTreeEntryResolver) URL(ctx context.Context) (string, error)](#GitTreeEntryResolver.URL)
        * [func (r *GitTreeEntryResolver) entries(ctx context.Context, args *gitTreeEntryConnectionArgs, filter func(fi fs.FileInfo) bool) ([]*GitTreeEntryResolver, error)](#GitTreeEntryResolver.entries)
        * [func (r *GitTreeEntryResolver) urlPath(prefix *url.URL) *url.URL](#GitTreeEntryResolver.urlPath)
    * [type GitTreeLSIFDataResolver interface](#GitTreeLSIFDataResolver)
    * [type HappinessFeedbackSubmissionInput struct](#HappinessFeedbackSubmissionInput)
    * [type HiddenApplyPreviewTargetsAttachResolver interface](#HiddenApplyPreviewTargetsAttachResolver)
    * [type HiddenApplyPreviewTargetsDetachResolver interface](#HiddenApplyPreviewTargetsDetachResolver)
    * [type HiddenApplyPreviewTargetsResolver interface](#HiddenApplyPreviewTargetsResolver)
    * [type HiddenApplyPreviewTargetsUpdateResolver interface](#HiddenApplyPreviewTargetsUpdateResolver)
    * [type HiddenChangesetApplyPreviewResolver interface](#HiddenChangesetApplyPreviewResolver)
    * [type HiddenChangesetSpecResolver interface](#HiddenChangesetSpecResolver)
    * [type HiddenExternalChangesetResolver interface](#HiddenExternalChangesetResolver)
    * [type HighlightArgs struct](#HighlightArgs)
    * [type HoverResolver interface](#HoverResolver)
    * [type IndexConfigurationResolver interface](#IndexConfigurationResolver)
    * [type IndexStepResolver interface](#IndexStepResolver)
    * [type IndexStepsResolver interface](#IndexStepsResolver)
    * [type InsightConnectionResolver interface](#InsightConnectionResolver)
    * [type InsightResolver interface](#InsightResolver)
    * [type InsightSeriesResolver interface](#InsightSeriesResolver)
    * [type InsightStatusResolver interface](#InsightStatusResolver)
    * [type InsightsDataPointResolver interface](#InsightsDataPointResolver)
    * [type InsightsPointsArgs struct](#InsightsPointsArgs)
    * [type InsightsResolver interface](#InsightsResolver)
    * [type InvalidNamespaceIDErr struct](#InvalidNamespaceIDErr)
        * [func (e InvalidNamespaceIDErr) Error() string](#InvalidNamespaceIDErr.Error)
    * [type JSONCString string](#JSONCString)
        * [func (JSONCString) ImplementsGraphQLType(name string) bool](#JSONCString.ImplementsGraphQLType)
        * [func (j JSONCString) MarshalJSON() ([]byte, error)](#JSONCString.MarshalJSON)
        * [func (j *JSONCString) UnmarshalGraphQL(input interface{}) error](#JSONCString.UnmarshalGraphQL)
    * [type JSONValue struct](#JSONValue)
        * [func (JSONValue) ImplementsGraphQLType(name string) bool](#JSONValue.ImplementsGraphQLType)
        * [func (v JSONValue) MarshalJSON() ([]byte, error)](#JSONValue.MarshalJSON)
        * [func (v *JSONValue) UnmarshalGraphQL(input interface{}) error](#JSONValue.UnmarshalGraphQL)
        * [func (v *JSONValue) UnmarshalJSON(data []byte) error](#JSONValue.UnmarshalJSON)
    * [type LSIFDiagnosticsArgs struct](#LSIFDiagnosticsArgs)
    * [type LSIFDocumentationPageArgs struct](#LSIFDocumentationPageArgs)
    * [type LSIFIndexConnectionResolver interface](#LSIFIndexConnectionResolver)
    * [type LSIFIndexResolver interface](#LSIFIndexResolver)
    * [type LSIFIndexesQueryArgs struct](#LSIFIndexesQueryArgs)
    * [type LSIFPagedQueryPositionArgs struct](#LSIFPagedQueryPositionArgs)
    * [type LSIFQueryPositionArgs struct](#LSIFQueryPositionArgs)
    * [type LSIFRangesArgs struct](#LSIFRangesArgs)
    * [type LSIFRepositoryIndexesQueryArgs struct](#LSIFRepositoryIndexesQueryArgs)
    * [type LSIFRepositoryUploadsQueryArgs struct](#LSIFRepositoryUploadsQueryArgs)
    * [type LSIFUploadConnectionResolver interface](#LSIFUploadConnectionResolver)
    * [type LSIFUploadResolver interface](#LSIFUploadResolver)
    * [type LSIFUploadsQueryArgs struct](#LSIFUploadsQueryArgs)
    * [type LicenseResolver interface](#LicenseResolver)
    * [type LimitWatcher interface](#LimitWatcher)
    * [type Limiter interface](#Limiter)
    * [type LimiterArgs struct](#LimiterArgs)
    * [type ListActionArgs struct](#ListActionArgs)
    * [type ListBatchChangeBulkOperationArgs struct](#ListBatchChangeBulkOperationArgs)
    * [type ListBatchChangesArgs struct](#ListBatchChangesArgs)
    * [type ListBatchChangesCodeHostsArgs struct](#ListBatchChangesCodeHostsArgs)
    * [type ListCampaignsCodeHostsArgs struct](#ListCampaignsCodeHostsArgs)
    * [type ListChangesetsArgs struct](#ListChangesetsArgs)
    * [type ListEventsArgs struct](#ListEventsArgs)
    * [type ListMonitorsArgs struct](#ListMonitorsArgs)
    * [type ListRecipientsArgs struct](#ListRecipientsArgs)
    * [type ListUserRepositoriesArgs struct](#ListUserRepositoriesArgs)
    * [type ListViewerBatchChangesCodeHostsArgs struct](#ListViewerBatchChangesCodeHostsArgs)
    * [type ListViewerCampaignsCodeHostsArgs struct](#ListViewerCampaignsCodeHostsArgs)
    * [type LocationConnectionResolver interface](#LocationConnectionResolver)
    * [type LocationResolver interface](#LocationResolver)
        * [func NewLocationResolver(resource *GitTreeEntryResolver, lspRange *lsp.Range) LocationResolver](#NewLocationResolver)
    * [type Markdown string](#Markdown)
        * [func (m Markdown) HTML() string](#Markdown.HTML)
        * [func (m Markdown) Text() string](#Markdown.Text)
    * [type MergeChangesetsArgs struct](#MergeChangesetsArgs)
    * [type MonitorAction interface](#MonitorAction)
    * [type MonitorActionConnectionResolver interface](#MonitorActionConnectionResolver)
    * [type MonitorActionEmailRecipientsConnectionResolver interface](#MonitorActionEmailRecipientsConnectionResolver)
    * [type MonitorActionEventConnectionResolver interface](#MonitorActionEventConnectionResolver)
    * [type MonitorActionEventResolver interface](#MonitorActionEventResolver)
    * [type MonitorConnectionResolver interface](#MonitorConnectionResolver)
    * [type MonitorEmailRecipient interface](#MonitorEmailRecipient)
    * [type MonitorEmailResolver interface](#MonitorEmailResolver)
    * [type MonitorQueryResolver interface](#MonitorQueryResolver)
    * [type MonitorResolver interface](#MonitorResolver)
    * [type MonitorTrigger interface](#MonitorTrigger)
    * [type MonitorTriggerEventConnectionResolver interface](#MonitorTriggerEventConnectionResolver)
    * [type MonitorTriggerEventResolver interface](#MonitorTriggerEventResolver)
    * [type MonitoringAlert srcprometheus.MonitoringAlert](#MonitoringAlert)
        * [func (r *MonitoringAlert) Average() float64](#MonitoringAlert.Average)
        * [func (r *MonitoringAlert) Name() string](#MonitoringAlert.Name)
        * [func (r *MonitoringAlert) Owner() string](#MonitoringAlert.Owner)
        * [func (r *MonitoringAlert) ServiceName() string](#MonitoringAlert.ServiceName)
        * [func (r *MonitoringAlert) Timestamp() DateTime](#MonitoringAlert.Timestamp)
    * [type MoveBatchChangeArgs struct](#MoveBatchChangeArgs)
    * [type MoveCampaignArgs struct](#MoveCampaignArgs)
    * [type Namespace interface](#Namespace)
        * [func NamespaceByID(ctx context.Context, db dbutil.DB, id graphql.ID) (Namespace, error)](#NamespaceByID)
    * [type NamespaceResolver struct](#NamespaceResolver)
        * [func (r NamespaceResolver) ToOrg() (*OrgResolver, bool)](#NamespaceResolver.ToOrg)
        * [func (r NamespaceResolver) ToUser() (*UserResolver, bool)](#NamespaceResolver.ToUser)
    * [type NewFileFunc func(db github.com/sourcegraph/sourcegraph/internal/database/dbutil.DB, r *github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.FileDiffResolver) github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.FileResolver](#NewFileFunc)
    * [type Node interface](#Node)
    * [type NodeByIDFunc func(ctx context.Context, id github.com/graph-gophers/graphql-go.ID) (github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.Node, error)](#NodeByIDFunc)
    * [type NodeResolver struct](#NodeResolver)
        * [func (r *NodeResolver) ToAccessToken() (*accessTokenResolver, bool)](#NodeResolver.ToAccessToken)
        * [func (r *NodeResolver) ToBatchChange() (BatchChangeResolver, bool)](#NodeResolver.ToBatchChange)
        * [func (r *NodeResolver) ToBatchChangesCredential() (BatchChangesCredentialResolver, bool)](#NodeResolver.ToBatchChangesCredential)
        * [func (r *NodeResolver) ToBatchSpec() (BatchSpecResolver, bool)](#NodeResolver.ToBatchSpec)
        * [func (r *NodeResolver) ToBulkOperation() (BulkOperationResolver, bool)](#NodeResolver.ToBulkOperation)
        * [func (r *NodeResolver) ToCampaign() (BatchChangeResolver, bool)](#NodeResolver.ToCampaign)
        * [func (r *NodeResolver) ToCampaignSpec() (BatchSpecResolver, bool)](#NodeResolver.ToCampaignSpec)
        * [func (r *NodeResolver) ToCampaignsCredential() (CampaignsCredentialResolver, bool)](#NodeResolver.ToCampaignsCredential)
        * [func (r *NodeResolver) ToChangesetEvent() (ChangesetEventResolver, bool)](#NodeResolver.ToChangesetEvent)
        * [func (r *NodeResolver) ToExternalAccount() (*externalAccountResolver, bool)](#NodeResolver.ToExternalAccount)
        * [func (r *NodeResolver) ToExternalChangeset() (ExternalChangesetResolver, bool)](#NodeResolver.ToExternalChangeset)
        * [func (r *NodeResolver) ToExternalService() (*externalServiceResolver, bool)](#NodeResolver.ToExternalService)
        * [func (r *NodeResolver) ToGitCommit() (*GitCommitResolver, bool)](#NodeResolver.ToGitCommit)
        * [func (r *NodeResolver) ToGitRef() (*GitRefResolver, bool)](#NodeResolver.ToGitRef)
        * [func (r *NodeResolver) ToHiddenChangesetSpec() (HiddenChangesetSpecResolver, bool)](#NodeResolver.ToHiddenChangesetSpec)
        * [func (r *NodeResolver) ToHiddenExternalChangeset() (HiddenExternalChangesetResolver, bool)](#NodeResolver.ToHiddenExternalChangeset)
        * [func (r *NodeResolver) ToLSIFIndex() (LSIFIndexResolver, bool)](#NodeResolver.ToLSIFIndex)
        * [func (r *NodeResolver) ToLSIFUpload() (LSIFUploadResolver, bool)](#NodeResolver.ToLSIFUpload)
        * [func (r *NodeResolver) ToMonitor() (MonitorResolver, bool)](#NodeResolver.ToMonitor)
        * [func (r *NodeResolver) ToMonitorActionEvent() (MonitorActionEventResolver, bool)](#NodeResolver.ToMonitorActionEvent)
        * [func (r *NodeResolver) ToMonitorEmail() (MonitorEmailResolver, bool)](#NodeResolver.ToMonitorEmail)
        * [func (r *NodeResolver) ToMonitorQuery() (MonitorQueryResolver, bool)](#NodeResolver.ToMonitorQuery)
        * [func (r *NodeResolver) ToMonitorTriggerEvent() (MonitorTriggerEventResolver, bool)](#NodeResolver.ToMonitorTriggerEvent)
        * [func (r *NodeResolver) ToOrg() (*OrgResolver, bool)](#NodeResolver.ToOrg)
        * [func (r *NodeResolver) ToOrganizationInvitation() (*organizationInvitationResolver, bool)](#NodeResolver.ToOrganizationInvitation)
        * [func (r *NodeResolver) ToOutOfBandMigration() (*outOfBandMigrationResolver, bool)](#NodeResolver.ToOutOfBandMigration)
        * [func (r *NodeResolver) ToProductLicense() (ProductLicense, bool)](#NodeResolver.ToProductLicense)
        * [func (r *NodeResolver) ToProductSubscription() (ProductSubscription, bool)](#NodeResolver.ToProductSubscription)
        * [func (r *NodeResolver) ToRegistryExtension() (RegistryExtension, bool)](#NodeResolver.ToRegistryExtension)
        * [func (r *NodeResolver) ToRepository() (*RepositoryResolver, bool)](#NodeResolver.ToRepository)
        * [func (r *NodeResolver) ToSavedSearch() (*savedSearchResolver, bool)](#NodeResolver.ToSavedSearch)
        * [func (r *NodeResolver) ToSearchContext() (*searchContextResolver, bool)](#NodeResolver.ToSearchContext)
        * [func (r *NodeResolver) ToSite() (*siteResolver, bool)](#NodeResolver.ToSite)
        * [func (r *NodeResolver) ToUser() (*UserResolver, bool)](#NodeResolver.ToUser)
        * [func (r *NodeResolver) ToVisibleChangesetSpec() (VisibleChangesetSpecResolver, bool)](#NodeResolver.ToVisibleChangesetSpec)
    * [type OrgResolver struct](#OrgResolver)
        * [func NewOrg(db dbutil.DB, org *types.Org) *OrgResolver](#NewOrg)
        * [func OrgByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*OrgResolver, error)](#OrgByID)
        * [func OrgByIDInt32(ctx context.Context, db dbutil.DB, orgID int32) (*OrgResolver, error)](#OrgByIDInt32)
        * [func (o *OrgResolver) BatchChanges(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)](#OrgResolver.BatchChanges)
        * [func (o *OrgResolver) Campaigns(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)](#OrgResolver.Campaigns)
        * [func (o *OrgResolver) ConfigurationCascade() *settingsCascade](#OrgResolver.ConfigurationCascade)
        * [func (o *OrgResolver) CreatedAt() DateTime](#OrgResolver.CreatedAt)
        * [func (o *OrgResolver) DisplayName() *string](#OrgResolver.DisplayName)
        * [func (o *OrgResolver) ID() graphql.ID](#OrgResolver.ID)
        * [func (o *OrgResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)](#OrgResolver.LatestSettings)
        * [func (o *OrgResolver) Members(ctx context.Context) (*staticUserConnectionResolver, error)](#OrgResolver.Members)
        * [func (o *OrgResolver) Name() string](#OrgResolver.Name)
        * [func (o *OrgResolver) NamespaceName() string](#OrgResolver.NamespaceName)
        * [func (o *OrgResolver) OrgID() int32](#OrgResolver.OrgID)
        * [func (o *OrgResolver) SettingsCascade() *settingsCascade](#OrgResolver.SettingsCascade)
        * [func (o *OrgResolver) SettingsURL() *string](#OrgResolver.SettingsURL)
        * [func (o *OrgResolver) URL() string](#OrgResolver.URL)
        * [func (o *OrgResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#OrgResolver.ViewerCanAdminister)
        * [func (o *OrgResolver) ViewerIsMember(ctx context.Context) (bool, error)](#OrgResolver.ViewerIsMember)
        * [func (o *OrgResolver) ViewerPendingInvitation(ctx context.Context) (*organizationInvitationResolver, error)](#OrgResolver.ViewerPendingInvitation)
        * [func (o *OrgResolver) settingsSubject() api.SettingsSubject](#OrgResolver.settingsSubject)
    * [type PermissionsInfoResolver interface](#PermissionsInfoResolver)
    * [type PersonResolver struct](#PersonResolver)
        * [func NewPersonResolver(db dbutil.DB, name, email string, includeUserInfo bool) *PersonResolver](#NewPersonResolver)
        * [func (r *PersonResolver) AvatarURL(ctx context.Context) (*string, error)](#PersonResolver.AvatarURL)
        * [func (r *PersonResolver) DisplayName(ctx context.Context) (string, error)](#PersonResolver.DisplayName)
        * [func (r *PersonResolver) Email() string](#PersonResolver.Email)
        * [func (r *PersonResolver) Name(ctx context.Context) (string, error)](#PersonResolver.Name)
        * [func (r *PersonResolver) User(ctx context.Context) (*UserResolver, error)](#PersonResolver.User)
        * [func (r *PersonResolver) resolveUser(ctx context.Context) (*types.User, error)](#PersonResolver.resolveUser)
    * [type PlanTier interface](#PlanTier)
    * [type PositionResolver interface](#PositionResolver)
    * [type PreIndexStepResolver interface](#PreIndexStepResolver)
    * [type PreviewProductSubscriptionInvoiceArgs struct](#PreviewProductSubscriptionInvoiceArgs)
    * [type PreviewRepositoryComparisonResolver interface](#PreviewRepositoryComparisonResolver)
    * [type ProductLicense interface](#ProductLicense)
    * [type ProductLicenseConnection interface](#ProductLicenseConnection)
    * [type ProductLicenseInfo struct](#ProductLicenseInfo)
        * [func (r ProductLicenseInfo) ExpiresAt() DateTime](#ProductLicenseInfo.ExpiresAt)
        * [func (r ProductLicenseInfo) ProductNameWithBrand() string](#ProductLicenseInfo.ProductNameWithBrand)
        * [func (r ProductLicenseInfo) Tags() []string](#ProductLicenseInfo.Tags)
        * [func (r ProductLicenseInfo) UserCount() int32](#ProductLicenseInfo.UserCount)
    * [type ProductLicenseInput struct](#ProductLicenseInput)
    * [type ProductLicensesArgs struct](#ProductLicensesArgs)
    * [type ProductPlan interface](#ProductPlan)
    * [type ProductSubscription interface](#ProductSubscription)
    * [type ProductSubscriptionArgs struct](#ProductSubscriptionArgs)
    * [type ProductSubscriptionConnection interface](#ProductSubscriptionConnection)
    * [type ProductSubscriptionEvent interface](#ProductSubscriptionEvent)
    * [type ProductSubscriptionInput struct](#ProductSubscriptionInput)
    * [type ProductSubscriptionInvoiceItem interface](#ProductSubscriptionInvoiceItem)
    * [type ProductSubscriptionPreviewInvoice interface](#ProductSubscriptionPreviewInvoice)
    * [type ProductSubscriptionsArgs struct](#ProductSubscriptionsArgs)
    * [type QueryCost struct](#QueryCost)
        * [func EstimateQueryCost(query string, variables map[string]interface{}) (totalCost *QueryCost, err error)](#EstimateQueryCost)
        * [func calcNodeCost(def ast.Node, fragmentCosts map[string]int, variables map[string]interface{}) (*QueryCost, error)](#calcNodeCost)
    * [type QueueAutoIndexJobArgs struct](#QueueAutoIndexJobArgs)
    * [type RangeResolver interface](#RangeResolver)
        * [func NewRangeResolver(lspRange lsp.Range) RangeResolver](#NewRangeResolver)
    * [type RateLimitWatcher struct](#RateLimitWatcher)
        * [func NewRateLimiteWatcher(store throttled.GCRAStore) *RateLimitWatcher](#NewRateLimiteWatcher)
        * [func (w *RateLimitWatcher) Get() (Limiter, bool)](#RateLimitWatcher.Get)
        * [func (w *RateLimitWatcher) updateFromConfig(rlc *schema.ApiRatelimit)](#RateLimitWatcher.updateFromConfig)
    * [type RateLimiter struct](#RateLimiter)
        * [func (rl *RateLimiter) RateLimit(uid string, cost int, args LimiterArgs) (bool, throttled.RateLimitResult, error)](#RateLimiter.RateLimit)
    * [type RedirectResolver struct](#RedirectResolver)
        * [func (r *RedirectResolver) URL() string](#RedirectResolver.URL)
    * [type ReenqueueChangesetArgs struct](#ReenqueueChangesetArgs)
    * [type ReenqueueChangesetsArgs struct](#ReenqueueChangesetsArgs)
    * [type RegistryExtension interface](#RegistryExtension)
    * [type RegistryExtensionConnection interface](#RegistryExtensionConnection)
    * [type RegistryExtensionConnectionArgs struct](#RegistryExtensionConnectionArgs)
    * [type RegistryPublisher interface](#RegistryPublisher)
    * [type RegistryPublisherConnection interface](#RegistryPublisherConnection)
    * [type RepoAuthorizedUserArgs struct](#RepoAuthorizedUserArgs)
    * [type RepoPermsArgs struct](#RepoPermsArgs)
    * [type RepositoryCommitArgs struct](#RepositoryCommitArgs)
    * [type RepositoryComparisonInput struct](#RepositoryComparisonInput)
    * [type RepositoryComparisonInterface interface](#RepositoryComparisonInterface)
    * [type RepositoryComparisonResolver struct](#RepositoryComparisonResolver)
        * [func NewRepositoryComparison(ctx context.Context, db dbutil.DB, r *RepositoryResolver, args *RepositoryComparisonInput) (*RepositoryComparisonResolver, error)](#NewRepositoryComparison)
        * [func (r *RepositoryComparisonResolver) BaseRepository() *RepositoryResolver](#RepositoryComparisonResolver.BaseRepository)
        * [func (r *RepositoryComparisonResolver) Commits(args *graphqlutil.ConnectionArgs) *gitCommitConnectionResolver](#RepositoryComparisonResolver.Commits)
        * [func (r *RepositoryComparisonResolver) FileDiffs(ctx context.Context, args *FileDiffsConnectionArgs) (FileDiffConnection, error)](#RepositoryComparisonResolver.FileDiffs)
        * [func (r *RepositoryComparisonResolver) HeadRepository() *RepositoryResolver](#RepositoryComparisonResolver.HeadRepository)
        * [func (r *RepositoryComparisonResolver) Range() *gitRevisionRange](#RepositoryComparisonResolver.Range)
        * [func (r *RepositoryComparisonResolver) ToPreviewRepositoryComparison() (PreviewRepositoryComparisonResolver, bool)](#RepositoryComparisonResolver.ToPreviewRepositoryComparison)
        * [func (r *RepositoryComparisonResolver) ToRepositoryComparison() (*RepositoryComparisonResolver, bool)](#RepositoryComparisonResolver.ToRepositoryComparison)
    * [type RepositoryConnectionResolver interface](#RepositoryConnectionResolver)
    * [type RepositoryIDArgs struct](#RepositoryIDArgs)
    * [type RepositoryResolver struct](#RepositoryResolver)
        * [func NewRepositoryResolver(db dbutil.DB, repo *types.Repo) *RepositoryResolver](#NewRepositoryResolver)
        * [func (r *RepositoryResolver) AuthorizedUsers(ctx context.Context, args *AuthorizedUserArgs) (UserConnectionResolver, error)](#RepositoryResolver.AuthorizedUsers)
        * [func (r *RepositoryResolver) Branches(ctx context.Context, args *refsArgs) (*gitRefConnectionResolver, error)](#RepositoryResolver.Branches)
        * [func (r *RepositoryResolver) CloneInProgress(ctx context.Context) (bool, error)](#RepositoryResolver.CloneInProgress)
        * [func (r *RepositoryResolver) CodeIntelligenceCommitGraph(ctx context.Context) (CodeIntelligenceCommitGraphResolver, error)](#RepositoryResolver.CodeIntelligenceCommitGraph)
        * [func (r *RepositoryResolver) Commit(ctx context.Context, args *RepositoryCommitArgs) (*GitCommitResolver, error)](#RepositoryResolver.Commit)
        * [func (r *RepositoryResolver) CommitFromID(ctx context.Context, args *RepositoryCommitArgs, commitID api.CommitID) (*GitCommitResolver, error)](#RepositoryResolver.CommitFromID)
        * [func (r *RepositoryResolver) Comparison(ctx context.Context, args *RepositoryComparisonInput) (*RepositoryComparisonResolver, error)](#RepositoryResolver.Comparison)
        * [func (r *RepositoryResolver) Contributors(args *struct {...](#RepositoryResolver.Contributors)
        * [func (r *RepositoryResolver) CreatedAt() DateTime](#RepositoryResolver.CreatedAt)
        * [func (r *RepositoryResolver) DefaultBranch(ctx context.Context) (*GitRefResolver, error)](#RepositoryResolver.DefaultBranch)
        * [func (r *RepositoryResolver) Description(ctx context.Context) (string, error)](#RepositoryResolver.Description)
        * [func (r *RepositoryResolver) Detail() Markdown](#RepositoryResolver.Detail)
        * [func (r *RepositoryResolver) Enabled() bool](#RepositoryResolver.Enabled)
        * [func (r *RepositoryResolver) ExternalRepo(ctx context.Context) (*api.ExternalRepoSpec, error)](#RepositoryResolver.ExternalRepo)
        * [func (r *RepositoryResolver) ExternalRepository() *externalRepositoryResolver](#RepositoryResolver.ExternalRepository)
        * [func (r *RepositoryResolver) ExternalServices(ctx context.Context, args *struct {...](#RepositoryResolver.ExternalServices)
        * [func (r *RepositoryResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)](#RepositoryResolver.ExternalURLs)
        * [func (r *RepositoryResolver) GitRefs(ctx context.Context, args *refsArgs) (*gitRefConnectionResolver, error)](#RepositoryResolver.GitRefs)
        * [func (r *RepositoryResolver) ID() graphql.ID](#RepositoryResolver.ID)
        * [func (r *RepositoryResolver) IDInt32() api.RepoID](#RepositoryResolver.IDInt32)
        * [func (r *RepositoryResolver) IndexConfiguration(ctx context.Context) (IndexConfigurationResolver, error)](#RepositoryResolver.IndexConfiguration)
        * [func (r *RepositoryResolver) IsArchived(ctx context.Context) (bool, error)](#RepositoryResolver.IsArchived)
        * [func (r *RepositoryResolver) IsFork(ctx context.Context) (bool, error)](#RepositoryResolver.IsFork)
        * [func (r *RepositoryResolver) IsPrivate(ctx context.Context) (bool, error)](#RepositoryResolver.IsPrivate)
        * [func (r *RepositoryResolver) LSIFIndexes(ctx context.Context, args *LSIFIndexesQueryArgs) (LSIFIndexConnectionResolver, error)](#RepositoryResolver.LSIFIndexes)
        * [func (r *RepositoryResolver) LSIFUploads(ctx context.Context, args *LSIFUploadsQueryArgs) (LSIFUploadConnectionResolver, error)](#RepositoryResolver.LSIFUploads)
        * [func (r *RepositoryResolver) Label() (Markdown, error)](#RepositoryResolver.Label)
        * [func (r *RepositoryResolver) Language(ctx context.Context) (string, error)](#RepositoryResolver.Language)
        * [func (r *RepositoryResolver) Matches() []*searchResultMatchResolver](#RepositoryResolver.Matches)
        * [func (r *RepositoryResolver) MirrorInfo() *repositoryMirrorInfoResolver](#RepositoryResolver.MirrorInfo)
        * [func (r *RepositoryResolver) Name() string](#RepositoryResolver.Name)
        * [func (r *RepositoryResolver) PermissionsInfo(ctx context.Context) (PermissionsInfoResolver, error)](#RepositoryResolver.PermissionsInfo)
        * [func (r *RepositoryResolver) RepoName() api.RepoName](#RepositoryResolver.RepoName)
        * [func (r *RepositoryResolver) ResultCount() int32](#RepositoryResolver.ResultCount)
        * [func (r *RepositoryResolver) Rev() string](#RepositoryResolver.Rev)
        * [func (r *RepositoryResolver) Stars(ctx context.Context) (int32, error)](#RepositoryResolver.Stars)
        * [func (r *RepositoryResolver) Tags(ctx context.Context, args *refsArgs) (*gitRefConnectionResolver, error)](#RepositoryResolver.Tags)
        * [func (r *RepositoryResolver) TextSearchIndex() *repositoryTextSearchIndexResolver](#RepositoryResolver.TextSearchIndex)
        * [func (r *RepositoryResolver) ToCommitSearchResult() (*CommitSearchResultResolver, bool)](#RepositoryResolver.ToCommitSearchResult)
        * [func (r *RepositoryResolver) ToFileMatch() (*FileMatchResolver, bool)](#RepositoryResolver.ToFileMatch)
        * [func (r *RepositoryResolver) ToRepository() (*RepositoryResolver, bool)](#RepositoryResolver.ToRepository)
        * [func (r *RepositoryResolver) Type(ctx context.Context) (*types.Repo, error)](#RepositoryResolver.Type)
        * [func (r *RepositoryResolver) URI(ctx context.Context) (string, error)](#RepositoryResolver.URI)
        * [func (r *RepositoryResolver) URL() string](#RepositoryResolver.URL)
        * [func (r *RepositoryResolver) UpdatedAt() *DateTime](#RepositoryResolver.UpdatedAt)
        * [func (r *RepositoryResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#RepositoryResolver.ViewerCanAdminister)
        * [func (r *RepositoryResolver) hydrate(ctx context.Context) error](#RepositoryResolver.hydrate)
        * [func (r *RepositoryResolver) repo(ctx context.Context) (*types.Repo, error)](#RepositoryResolver.repo)
    * [type ResetTriggerQueryTimestampsArgs struct](#ResetTriggerQueryTimestampsArgs)
    * [type SearchArgs struct](#SearchArgs)
    * [type SearchImplementer interface](#SearchImplementer)
        * [func NewSearchImplementer(ctx context.Context, db dbutil.DB, args *SearchArgs) (_ SearchImplementer, err error)](#NewSearchImplementer)
    * [type SearchResultResolver interface](#SearchResultResolver)
    * [type SearchResults struct](#SearchResults)
        * [func intersect(left, right *SearchResults) *SearchResults](#intersect)
        * [func intersectMerge(left, right *SearchResults) *SearchResults](#intersectMerge)
        * [func union(left, right *SearchResults) *SearchResults](#union)
        * [func unionMerge(left, right *SearchResults) *SearchResults](#unionMerge)
    * [type SearchResultsResolver struct](#SearchResultsResolver)
        * [func (sr *SearchResultsResolver) Alert() *searchAlert](#SearchResultsResolver.Alert)
        * [func (sr *SearchResultsResolver) ApproximateResultCount() string](#SearchResultsResolver.ApproximateResultCount)
        * [func (c *SearchResultsResolver) Cloning() []*RepositoryResolver](#SearchResultsResolver.Cloning)
        * [func (sr *SearchResultsResolver) DynamicFilters(ctx context.Context) []*searchFilterResolver](#SearchResultsResolver.DynamicFilters)
        * [func (sr *SearchResultsResolver) ElapsedMilliseconds() int32](#SearchResultsResolver.ElapsedMilliseconds)
        * [func (c *SearchResultsResolver) IndexUnavailable() bool](#SearchResultsResolver.IndexUnavailable)
        * [func (c *SearchResultsResolver) LimitHit() bool](#SearchResultsResolver.LimitHit)
        * [func (sr *SearchResultsResolver) MatchCount() int32](#SearchResultsResolver.MatchCount)
        * [func (c *SearchResultsResolver) Missing() []*RepositoryResolver](#SearchResultsResolver.Missing)
        * [func (r *SearchResultsResolver) PageInfo() *graphqlutil.PageInfo](#SearchResultsResolver.PageInfo)
        * [func (c *SearchResultsResolver) Repositories() []*RepositoryResolver](#SearchResultsResolver.Repositories)
        * [func (c *SearchResultsResolver) RepositoriesCount() int32](#SearchResultsResolver.RepositoriesCount)
        * [func (sr *SearchResultsResolver) ResultCount() int32](#SearchResultsResolver.ResultCount)
        * [func (sr *SearchResultsResolver) Results() []SearchResultResolver](#SearchResultsResolver.Results)
        * [func (sr *SearchResultsResolver) Sparkline(ctx context.Context) (sparkline []int32, err error)](#SearchResultsResolver.Sparkline)
        * [func (c *SearchResultsResolver) Timedout() []*RepositoryResolver](#SearchResultsResolver.Timedout)
        * [func (sr *SearchResultsResolver) blameFileMatch(ctx context.Context, fm *result.FileMatch) (t time.Time, err error)](#SearchResultsResolver.blameFileMatch)
        * [func (c *SearchResultsResolver) repositoryResolvers(mask search.RepoStatus) []*RepositoryResolver](#SearchResultsResolver.repositoryResolvers)
    * [type SearchSuggestionResolver interface](#SearchSuggestionResolver)
    * [type SetProductSubscriptionBillingArgs struct](#SetProductSubscriptionBillingArgs)
    * [type SetUserBillingArgs struct](#SetUserBillingArgs)
    * [type SurveySubmissionInput struct](#SurveySubmissionInput)
    * [type SyncChangesetArgs struct](#SyncChangesetArgs)
    * [type Test struct](#Test)
    * [type ToggleCodeMonitorArgs struct](#ToggleCodeMonitorArgs)
    * [type TotalCountArgs struct](#TotalCountArgs)
    * [type TriggerTestEmailActionArgs struct](#TriggerTestEmailActionArgs)
    * [type UpdateCodeMonitorArgs struct](#UpdateCodeMonitorArgs)
    * [type UpdatePaidProductSubscriptionArgs struct](#UpdatePaidProductSubscriptionArgs)
    * [type UpdatePaidProductSubscriptionResult struct](#UpdatePaidProductSubscriptionResult)
        * [func (r *UpdatePaidProductSubscriptionResult) ProductSubscription() ProductSubscription](#UpdatePaidProductSubscriptionResult.ProductSubscription)
    * [type UpdateRepositoryIndexConfigurationArgs struct](#UpdateRepositoryIndexConfigurationArgs)
    * [type UserConnectionResolver interface](#UserConnectionResolver)
    * [type UserIDArgs struct](#UserIDArgs)
    * [type UserResolver struct](#UserResolver)
        * [func CurrentUser(ctx context.Context, db dbutil.DB) (*UserResolver, error)](#CurrentUser)
        * [func NewUserResolver(db dbutil.DB, user *types.User) *UserResolver](#NewUserResolver)
        * [func UserByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*UserResolver, error)](#UserByID)
        * [func UserByIDInt32(ctx context.Context, db dbutil.DB, id int32) (*UserResolver, error)](#UserByIDInt32)
        * [func (r *UserResolver) AccessTokens(ctx context.Context, args *struct {...](#UserResolver.AccessTokens)
        * [func (r *UserResolver) AvatarURL() *string](#UserResolver.AvatarURL)
        * [func (r *UserResolver) BatchChanges(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)](#UserResolver.BatchChanges)
        * [func (r *UserResolver) BatchChangesCodeHosts(ctx context.Context, args *ListBatchChangesCodeHostsArgs) (BatchChangesCodeHostConnectionResolver, error)](#UserResolver.BatchChangesCodeHosts)
        * [func (r *UserResolver) BuiltinAuth() bool](#UserResolver.BuiltinAuth)
        * [func (r *UserResolver) Campaigns(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)](#UserResolver.Campaigns)
        * [func (r *UserResolver) CampaignsCodeHosts(ctx context.Context, args *ListCampaignsCodeHostsArgs) (CampaignsCodeHostConnectionResolver, error)](#UserResolver.CampaignsCodeHosts)
        * [func (r *UserResolver) ConfigurationCascade() *settingsCascade](#UserResolver.ConfigurationCascade)
        * [func (r *UserResolver) CreatedAt() DateTime](#UserResolver.CreatedAt)
        * [func (r *UserResolver) DatabaseID() int32](#UserResolver.DatabaseID)
        * [func (r *UserResolver) DisplayName() *string](#UserResolver.DisplayName)
        * [func (r *UserResolver) Email(ctx context.Context) (string, error)](#UserResolver.Email)
        * [func (r *UserResolver) Emails(ctx context.Context) ([]*userEmailResolver, error)](#UserResolver.Emails)
        * [func (r *UserResolver) EventLogs(ctx context.Context, args *struct {...](#UserResolver.EventLogs)
        * [func (r *UserResolver) ExternalAccounts(ctx context.Context, args *struct {...](#UserResolver.ExternalAccounts)
        * [func (r *UserResolver) ID() graphql.ID](#UserResolver.ID)
        * [func (r *UserResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)](#UserResolver.LatestSettings)
        * [func (r *UserResolver) Monitors(ctx context.Context, args *ListMonitorsArgs) (MonitorConnectionResolver, error)](#UserResolver.Monitors)
        * [func (r *UserResolver) NamespaceName() string](#UserResolver.NamespaceName)
        * [func (r *UserResolver) OrganizationMemberships(ctx context.Context) (*organizationMembershipConnectionResolver, error)](#UserResolver.OrganizationMemberships)
        * [func (r *UserResolver) Organizations(ctx context.Context) (*orgConnectionStaticResolver, error)](#UserResolver.Organizations)
        * [func (r *UserResolver) PermissionsInfo(ctx context.Context) (PermissionsInfoResolver, error)](#UserResolver.PermissionsInfo)
        * [func (r *UserResolver) PublicRepositories(ctx context.Context) ([]*RepositoryResolver, error)](#UserResolver.PublicRepositories)
        * [func (r *UserResolver) Repositories(ctx context.Context, args *ListUserRepositoriesArgs) (RepositoryConnectionResolver, error)](#UserResolver.Repositories)
        * [func (r *UserResolver) Session(ctx context.Context) (*sessionResolver, error)](#UserResolver.Session)
        * [func (r *UserResolver) SettingsCascade() *settingsCascade](#UserResolver.SettingsCascade)
        * [func (r *UserResolver) SettingsURL() *string](#UserResolver.SettingsURL)
        * [func (r *UserResolver) SiteAdmin(ctx context.Context) (bool, error)](#UserResolver.SiteAdmin)
        * [func (r *UserResolver) SurveyResponses(ctx context.Context) ([]*surveyResponseResolver, error)](#UserResolver.SurveyResponses)
        * [func (r *UserResolver) Tags(ctx context.Context) ([]string, error)](#UserResolver.Tags)
        * [func (r *UserResolver) URL() string](#UserResolver.URL)
        * [func (r *UserResolver) URLForSiteAdminBilling(ctx context.Context) (*string, error)](#UserResolver.URLForSiteAdminBilling)
        * [func (r *UserResolver) UpdatedAt() *DateTime](#UserResolver.UpdatedAt)
        * [func (r *UserResolver) UsageStatistics(ctx context.Context) (*userUsageStatisticsResolver, error)](#UserResolver.UsageStatistics)
        * [func (r *UserResolver) Username() string](#UserResolver.Username)
        * [func (r *UserResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#UserResolver.ViewerCanAdminister)
        * [func (r *UserResolver) ViewerCanChangeUsername(ctx context.Context) bool](#UserResolver.ViewerCanChangeUsername)
        * [func (r *UserResolver) settingsSubject() api.SettingsSubject](#UserResolver.settingsSubject)
    * [type VisibleApplyPreviewTargetsAttachResolver interface](#VisibleApplyPreviewTargetsAttachResolver)
    * [type VisibleApplyPreviewTargetsDetachResolver interface](#VisibleApplyPreviewTargetsDetachResolver)
    * [type VisibleApplyPreviewTargetsResolver interface](#VisibleApplyPreviewTargetsResolver)
    * [type VisibleApplyPreviewTargetsUpdateResolver interface](#VisibleApplyPreviewTargetsUpdateResolver)
    * [type VisibleChangesetApplyPreviewResolver interface](#VisibleChangesetApplyPreviewResolver)
    * [type VisibleChangesetSpecResolver interface](#VisibleChangesetSpecResolver)
    * [type accessTokenConnectionResolver struct](#accessTokenConnectionResolver)
        * [func (r *accessTokenConnectionResolver) Nodes(ctx context.Context) ([]*accessTokenResolver, error)](#accessTokenConnectionResolver.Nodes)
        * [func (r *accessTokenConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#accessTokenConnectionResolver.PageInfo)
        * [func (r *accessTokenConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#accessTokenConnectionResolver.TotalCount)
        * [func (r *accessTokenConnectionResolver) compute(ctx context.Context) ([]*database.AccessToken, error)](#accessTokenConnectionResolver.compute)
    * [type accessTokenResolver struct](#accessTokenResolver)
        * [func accessTokenByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*accessTokenResolver, error)](#accessTokenByID)
        * [func (r *accessTokenResolver) CreatedAt() DateTime](#accessTokenResolver.CreatedAt)
        * [func (r *accessTokenResolver) Creator(ctx context.Context) (*UserResolver, error)](#accessTokenResolver.Creator)
        * [func (r *accessTokenResolver) ID() graphql.ID](#accessTokenResolver.ID)
        * [func (r *accessTokenResolver) LastUsedAt() *DateTime](#accessTokenResolver.LastUsedAt)
        * [func (r *accessTokenResolver) Note() string](#accessTokenResolver.Note)
        * [func (r *accessTokenResolver) Scopes() []string](#accessTokenResolver.Scopes)
        * [func (r *accessTokenResolver) Subject(ctx context.Context) (*UserResolver, error)](#accessTokenResolver.Subject)
    * [type addExternalServiceArgs struct](#addExternalServiceArgs)
    * [type addExternalServiceInput struct](#addExternalServiceInput)
    * [type affiliatedRepositoriesConnection struct](#affiliatedRepositoriesConnection)
        * [func (a *affiliatedRepositoriesConnection) Nodes(ctx context.Context) ([]*codeHostRepositoryResolver, error)](#affiliatedRepositoriesConnection.Nodes)
    * [type alertObserver struct](#alertObserver)
        * [func (o *alertObserver) Done(stats *streaming.Stats) (*searchAlert, error)](#alertObserver.Done)
        * [func (o *alertObserver) Error(ctx context.Context, err error)](#alertObserver.Error)
        * [func (o *alertObserver) update(alert *searchAlert)](#alertObserver.update)
    * [type alertSearchImplementer struct](#alertSearchImplementer)
        * [func (alertSearchImplementer) Inputs() run.SearchInputs](#alertSearchImplementer.Inputs)
        * [func (a alertSearchImplementer) Results(context.Context) (*SearchResultsResolver, error)](#alertSearchImplementer.Results)
        * [func (alertSearchImplementer) Stats(context.Context) (*searchResultsStats, error)](#alertSearchImplementer.Stats)
        * [func (alertSearchImplementer) Suggestions(context.Context, *searchSuggestionsArgs) ([]SearchSuggestionResolver, error)](#alertSearchImplementer.Suggestions)
    * [type authProviderConnectionResolver struct](#authProviderConnectionResolver)
        * [func (r *authProviderConnectionResolver) Nodes(ctx context.Context) ([]*authProviderResolver, error)](#authProviderConnectionResolver.Nodes)
        * [func (r *authProviderConnectionResolver) PageInfo() *graphqlutil.PageInfo](#authProviderConnectionResolver.PageInfo)
        * [func (r *authProviderConnectionResolver) TotalCount() int32](#authProviderConnectionResolver.TotalCount)
    * [type authProviderResolver struct](#authProviderResolver)
        * [func (r *authProviderResolver) AuthenticationURL() *string](#authProviderResolver.AuthenticationURL)
        * [func (r *authProviderResolver) ClientID() string](#authProviderResolver.ClientID)
        * [func (r *authProviderResolver) DisplayName() string](#authProviderResolver.DisplayName)
        * [func (r *authProviderResolver) IsBuiltin() bool](#authProviderResolver.IsBuiltin)
        * [func (r *authProviderResolver) ServiceID() string](#authProviderResolver.ServiceID)
        * [func (r *authProviderResolver) ServiceType() string](#authProviderResolver.ServiceType)
    * [type badRequestError struct](#badRequestError)
        * [func (e *badRequestError) BadRequest() bool](#badRequestError.BadRequest)
        * [func (e *badRequestError) Cause() error](#badRequestError.Cause)
        * [func (e *badRequestError) Error() string](#badRequestError.Error)
    * [type baseSuggestionResolver struct{}](#baseSuggestionResolver)
        * [func (baseSuggestionResolver) ToFile() (*GitTreeEntryResolver, bool)](#baseSuggestionResolver.ToFile)
        * [func (baseSuggestionResolver) ToGitBlob() (*GitTreeEntryResolver, bool)](#baseSuggestionResolver.ToGitBlob)
        * [func (baseSuggestionResolver) ToGitTree() (*GitTreeEntryResolver, bool)](#baseSuggestionResolver.ToGitTree)
        * [func (baseSuggestionResolver) ToLanguage() (*languageResolver, bool)](#baseSuggestionResolver.ToLanguage)
        * [func (baseSuggestionResolver) ToRepository() (*RepositoryResolver, bool)](#baseSuggestionResolver.ToRepository)
        * [func (baseSuggestionResolver) ToSearchContext() (*searchContextResolver, bool)](#baseSuggestionResolver.ToSearchContext)
        * [func (baseSuggestionResolver) ToSymbol() (*symbolResolver, bool)](#baseSuggestionResolver.ToSymbol)
    * [type behindAheadCountsResolver struct](#behindAheadCountsResolver)
        * [func (r *behindAheadCountsResolver) Ahead() int32](#behindAheadCountsResolver.Ahead)
        * [func (r *behindAheadCountsResolver) Behind() int32](#behindAheadCountsResolver.Behind)
    * [type byDirectory []fs.FileInfo](#byDirectory)
        * [func (s byDirectory) Len() int](#byDirectory.Len)
        * [func (s byDirectory) Less(i, j int) bool](#byDirectory.Less)
        * [func (s byDirectory) Swap(i, j int)](#byDirectory.Swap)
    * [type checkMirrorRepositoryConnectionResult struct](#checkMirrorRepositoryConnectionResult)
        * [func (r *checkMirrorRepositoryConnectionResult) Error() *string](#checkMirrorRepositoryConnectionResult.Error)
    * [type clientConfigurationResolver struct](#clientConfigurationResolver)
        * [func (r *clientConfigurationResolver) ContentScriptURLs() []string](#clientConfigurationResolver.ContentScriptURLs)
        * [func (r *clientConfigurationResolver) ParentSourcegraph() *parentSourcegraphResolver](#clientConfigurationResolver.ParentSourcegraph)
    * [type codeHostRepositoryResolver struct](#codeHostRepositoryResolver)
        * [func (r *codeHostRepositoryResolver) CodeHost(ctx context.Context) *externalServiceResolver](#codeHostRepositoryResolver.CodeHost)
        * [func (r *codeHostRepositoryResolver) Name() string](#codeHostRepositoryResolver.Name)
        * [func (r *codeHostRepositoryResolver) Private() bool](#codeHostRepositoryResolver.Private)
    * [type computedExternalServiceConnectionResolver struct](#computedExternalServiceConnectionResolver)
        * [func (r *computedExternalServiceConnectionResolver) Nodes(ctx context.Context) []*externalServiceResolver](#computedExternalServiceConnectionResolver.Nodes)
        * [func (r *computedExternalServiceConnectionResolver) PageInfo(ctx context.Context) *graphqlutil.PageInfo](#computedExternalServiceConnectionResolver.PageInfo)
        * [func (r *computedExternalServiceConnectionResolver) TotalCount(ctx context.Context) int32](#computedExternalServiceConnectionResolver.TotalCount)
    * [type configurationResolver struct](#configurationResolver)
        * [func viewerFinalSettings(ctx context.Context, db dbutil.DB) (*configurationResolver, error)](#viewerFinalSettings)
        * [func (r *configurationResolver) Contents() JSONCString](#configurationResolver.Contents)
        * [func (r *configurationResolver) Messages() []string](#configurationResolver.Messages)
    * [type createAccessTokenInput struct](#createAccessTokenInput)
    * [type createAccessTokenResult struct](#createAccessTokenResult)
        * [func (r *createAccessTokenResult) ID() graphql.ID](#createAccessTokenResult.ID)
        * [func (r *createAccessTokenResult) Token() string](#createAccessTokenResult.Token)
    * [type createSearchContextArgs struct](#createSearchContextArgs)
    * [type createUserResult struct](#createUserResult)
        * [func (r *createUserResult) ResetPasswordURL(ctx context.Context) (*string, error)](#createUserResult.ResetPasswordURL)
        * [func (r *createUserResult) User() *UserResolver](#createUserResult.User)
    * [type defaultSettingsResolver struct](#defaultSettingsResolver)
        * [func (r *defaultSettingsResolver) ConfigurationCascade() *settingsCascade](#defaultSettingsResolver.ConfigurationCascade)
        * [func (r *defaultSettingsResolver) ID() graphql.ID](#defaultSettingsResolver.ID)
        * [func (r *defaultSettingsResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)](#defaultSettingsResolver.LatestSettings)
        * [func (r *defaultSettingsResolver) SettingsCascade() *settingsCascade](#defaultSettingsResolver.SettingsCascade)
        * [func (r *defaultSettingsResolver) SettingsURL() *string](#defaultSettingsResolver.SettingsURL)
        * [func (r *defaultSettingsResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#defaultSettingsResolver.ViewerCanAdminister)
    * [type deleteAccessTokenInput struct](#deleteAccessTokenInput)
    * [type deleteExternalServiceArgs struct](#deleteExternalServiceArgs)
    * [type dummyFileHighlighter struct](#dummyFileHighlighter)
        * [func (r *dummyFileHighlighter) Highlight(ctx context.Context, args *HighlightArgs) ([]template.HTML, []template.HTML, bool, error)](#dummyFileHighlighter.Highlight)
    * [type dummyFileResolver struct](#dummyFileResolver)
        * [func (d *dummyFileResolver) Binary(ctx context.Context) (bool, error)](#dummyFileResolver.Binary)
        * [func (d *dummyFileResolver) ByteSize(ctx context.Context) (int32, error)](#dummyFileResolver.ByteSize)
        * [func (d *dummyFileResolver) CanonicalURL() string](#dummyFileResolver.CanonicalURL)
        * [func (d *dummyFileResolver) Content(ctx context.Context) (string, error)](#dummyFileResolver.Content)
        * [func (d *dummyFileResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)](#dummyFileResolver.ExternalURLs)
        * [func (d *dummyFileResolver) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)](#dummyFileResolver.Highlight)
        * [func (d *dummyFileResolver) IsDirectory() bool](#dummyFileResolver.IsDirectory)
        * [func (d *dummyFileResolver) Name() string](#dummyFileResolver.Name)
        * [func (d *dummyFileResolver) Path() string](#dummyFileResolver.Path)
        * [func (d *dummyFileResolver) RichHTML(ctx context.Context) (string, error)](#dummyFileResolver.RichHTML)
        * [func (d *dummyFileResolver) ToGitBlob() (*GitTreeEntryResolver, bool)](#dummyFileResolver.ToGitBlob)
        * [func (d *dummyFileResolver) ToVirtualFile() (*virtualFileResolver, bool)](#dummyFileResolver.ToVirtualFile)
        * [func (d *dummyFileResolver) URL(ctx context.Context) (string, error)](#dummyFileResolver.URL)
    * [type errNoResolvedRepos struct](#errNoResolvedRepos)
        * [func (e *errNoResolvedRepos) Error() string](#errNoResolvedRepos.Error)
    * [type errOverRepoLimit struct](#errOverRepoLimit)
        * [func (e *errOverRepoLimit) Error() string](#errOverRepoLimit.Error)
    * [type executor func(batch []*github.com/sourcegraph/sourcegraph/internal/search.RepositoryRevisions) ([]github.com/sourcegraph/sourcegraph/internal/search/result.Match, *github.com/sourcegraph/sourcegraph/internal/search/streaming.Stats, error)](#executor)
    * [type externalAccountConnectionResolver struct](#externalAccountConnectionResolver)
        * [func (r *externalAccountConnectionResolver) Nodes(ctx context.Context) ([]*externalAccountResolver, error)](#externalAccountConnectionResolver.Nodes)
        * [func (r *externalAccountConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#externalAccountConnectionResolver.PageInfo)
        * [func (r *externalAccountConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#externalAccountConnectionResolver.TotalCount)
        * [func (r *externalAccountConnectionResolver) compute(ctx context.Context) ([]*extsvc.Account, error)](#externalAccountConnectionResolver.compute)
    * [type externalAccountResolver struct](#externalAccountResolver)
        * [func externalAccountByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*externalAccountResolver, error)](#externalAccountByID)
        * [func (r *externalAccountResolver) AccountData(ctx context.Context) (*JSONValue, error)](#externalAccountResolver.AccountData)
        * [func (r *externalAccountResolver) AccountID() string](#externalAccountResolver.AccountID)
        * [func (r *externalAccountResolver) ClientID() string](#externalAccountResolver.ClientID)
        * [func (r *externalAccountResolver) CreatedAt() DateTime](#externalAccountResolver.CreatedAt)
        * [func (r *externalAccountResolver) ID() graphql.ID](#externalAccountResolver.ID)
        * [func (r *externalAccountResolver) RefreshURL() *string](#externalAccountResolver.RefreshURL)
        * [func (r *externalAccountResolver) ServiceID() string](#externalAccountResolver.ServiceID)
        * [func (r *externalAccountResolver) ServiceType() string](#externalAccountResolver.ServiceType)
        * [func (r *externalAccountResolver) UpdatedAt() DateTime](#externalAccountResolver.UpdatedAt)
        * [func (r *externalAccountResolver) User(ctx context.Context) (*UserResolver, error)](#externalAccountResolver.User)
    * [type externalRepositoryResolver struct](#externalRepositoryResolver)
        * [func (r *externalRepositoryResolver) ID(ctx context.Context) (string, error)](#externalRepositoryResolver.ID)
        * [func (r *externalRepositoryResolver) ServiceID(ctx context.Context) (string, error)](#externalRepositoryResolver.ServiceID)
        * [func (r *externalRepositoryResolver) ServiceType(ctx context.Context) (string, error)](#externalRepositoryResolver.ServiceType)
    * [type externalServiceConnectionResolver struct](#externalServiceConnectionResolver)
        * [func (r *externalServiceConnectionResolver) Nodes(ctx context.Context) ([]*externalServiceResolver, error)](#externalServiceConnectionResolver.Nodes)
        * [func (r *externalServiceConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#externalServiceConnectionResolver.PageInfo)
        * [func (r *externalServiceConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#externalServiceConnectionResolver.TotalCount)
        * [func (r *externalServiceConnectionResolver) compute(ctx context.Context) ([]*types.ExternalService, error)](#externalServiceConnectionResolver.compute)
    * [type externalServiceResolver struct](#externalServiceResolver)
        * [func externalServiceByID(ctx context.Context, db dbutil.DB, gqlID graphql.ID) (*externalServiceResolver, error)](#externalServiceByID)
        * [func (r *externalServiceResolver) Config() (JSONCString, error)](#externalServiceResolver.Config)
        * [func (r *externalServiceResolver) CreatedAt() DateTime](#externalServiceResolver.CreatedAt)
        * [func (r *externalServiceResolver) DisplayName() string](#externalServiceResolver.DisplayName)
        * [func (r *externalServiceResolver) GrantedScopes(ctx context.Context) (*[]string, error)](#externalServiceResolver.GrantedScopes)
        * [func (r *externalServiceResolver) ID() graphql.ID](#externalServiceResolver.ID)
        * [func (r *externalServiceResolver) Kind() string](#externalServiceResolver.Kind)
        * [func (r *externalServiceResolver) LastSyncAt() *DateTime](#externalServiceResolver.LastSyncAt)
        * [func (r *externalServiceResolver) LastSyncError(ctx context.Context) (*string, error)](#externalServiceResolver.LastSyncError)
        * [func (r *externalServiceResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)](#externalServiceResolver.Namespace)
        * [func (r *externalServiceResolver) NextSyncAt() *DateTime](#externalServiceResolver.NextSyncAt)
        * [func (r *externalServiceResolver) RepoCount(ctx context.Context) (int32, error)](#externalServiceResolver.RepoCount)
        * [func (r *externalServiceResolver) UpdatedAt() DateTime](#externalServiceResolver.UpdatedAt)
        * [func (r *externalServiceResolver) Warning() *string](#externalServiceResolver.Warning)
        * [func (r *externalServiceResolver) WebhookURL() (*string, error)](#externalServiceResolver.WebhookURL)
    * [type fileDiffConnectionResolver struct](#fileDiffConnectionResolver)
        * [func NewFileDiffConnectionResolver(db dbutil.DB,...](#NewFileDiffConnectionResolver)
        * [func (r *fileDiffConnectionResolver) DiffStat(ctx context.Context) (*DiffStat, error)](#fileDiffConnectionResolver.DiffStat)
        * [func (r *fileDiffConnectionResolver) Nodes(ctx context.Context) ([]FileDiff, error)](#fileDiffConnectionResolver.Nodes)
        * [func (r *fileDiffConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#fileDiffConnectionResolver.PageInfo)
        * [func (r *fileDiffConnectionResolver) RawDiff(ctx context.Context) (string, error)](#fileDiffConnectionResolver.RawDiff)
        * [func (r *fileDiffConnectionResolver) TotalCount(ctx context.Context) (*int32, error)](#fileDiffConnectionResolver.TotalCount)
    * [type fileDiffHighlighter struct](#fileDiffHighlighter)
        * [func (r *fileDiffHighlighter) Highlight(ctx context.Context, args *HighlightArgs) ([]template.HTML, []template.HTML, bool, error)](#fileDiffHighlighter.Highlight)
    * [type fileInfo struct](#fileInfo)
        * [func (f fileInfo) IsDir() bool](#fileInfo.IsDir)
        * [func (f fileInfo) ModTime() time.Time](#fileInfo.ModTime)
        * [func (f fileInfo) Mode() os.FileMode](#fileInfo.Mode)
        * [func (f fileInfo) Name() string](#fileInfo.Name)
        * [func (f fileInfo) Size() int64](#fileInfo.Size)
        * [func (f fileInfo) Sys() interface{}](#fileInfo.Sys)
    * [type fixedLimiter struct](#fixedLimiter)
        * [func (f *fixedLimiter) RateLimit(string, int) (bool, throttled.RateLimitResult, error)](#fixedLimiter.RateLimit)
    * [type gitCommitConnectionResolver struct](#gitCommitConnectionResolver)
        * [func (r *gitCommitConnectionResolver) Nodes(ctx context.Context) ([]*GitCommitResolver, error)](#gitCommitConnectionResolver.Nodes)
        * [func (r *gitCommitConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#gitCommitConnectionResolver.PageInfo)
        * [func (r *gitCommitConnectionResolver) TotalCount(ctx context.Context) (*int32, error)](#gitCommitConnectionResolver.TotalCount)
        * [func (r *gitCommitConnectionResolver) compute(ctx context.Context) ([]*git.Commit, error)](#gitCommitConnectionResolver.compute)
    * [type gitCommitGQLID struct](#gitCommitGQLID)
    * [type gitObject struct](#gitObject)
        * [func (o *gitObject) AbbreviatedOID(ctx context.Context) (string, error)](#gitObject.AbbreviatedOID)
        * [func (o *gitObject) Commit(ctx context.Context) (*GitCommitResolver, error)](#gitObject.Commit)
        * [func (o *gitObject) OID(ctx context.Context) (GitObjectID, error)](#gitObject.OID)
        * [func (o *gitObject) Type(context.Context) (gitObjectType, error)](#gitObject.Type)
    * [type gitObjectResolver struct](#gitObjectResolver)
        * [func (o *gitObjectResolver) AbbreviatedOID(ctx context.Context) (string, error)](#gitObjectResolver.AbbreviatedOID)
        * [func (o *gitObjectResolver) Commit(ctx context.Context) (*GitCommitResolver, error)](#gitObjectResolver.Commit)
        * [func (o *gitObjectResolver) OID(ctx context.Context) (GitObjectID, error)](#gitObjectResolver.OID)
        * [func (o *gitObjectResolver) Type(ctx context.Context) (gitObjectType, error)](#gitObjectResolver.Type)
        * [func (o *gitObjectResolver) resolve(ctx context.Context) (GitObjectID, gitObjectType, error)](#gitObjectResolver.resolve)
    * [type gitObjectType string](#gitObjectType)
        * [func toGitObjectType(t git.ObjectType) gitObjectType](#toGitObjectType)
        * [func (gitObjectType) ImplementsGraphQLType(name string) bool](#gitObjectType.ImplementsGraphQLType)
    * [type gitRefConnectionResolver struct](#gitRefConnectionResolver)
        * [func (r *gitRefConnectionResolver) Nodes() []*GitRefResolver](#gitRefConnectionResolver.Nodes)
        * [func (r *gitRefConnectionResolver) PageInfo() *graphqlutil.PageInfo](#gitRefConnectionResolver.PageInfo)
        * [func (r *gitRefConnectionResolver) TotalCount() int32](#gitRefConnectionResolver.TotalCount)
    * [type gitRefGQLID struct](#gitRefGQLID)
    * [type gitRevSpec struct](#gitRevSpec)
        * [func (r *gitRevSpec) ToGitObject() (*gitObject, bool)](#gitRevSpec.ToGitObject)
        * [func (r *gitRevSpec) ToGitRef() (*GitRefResolver, bool)](#gitRevSpec.ToGitRef)
        * [func (r *gitRevSpec) ToGitRevSpecExpr() (*gitRevSpecExpr, bool)](#gitRevSpec.ToGitRevSpecExpr)
    * [type gitRevSpecExpr struct](#gitRevSpecExpr)
        * [func (r *gitRevSpecExpr) Expr() string](#gitRevSpecExpr.Expr)
        * [func (r *gitRevSpecExpr) Object(ctx context.Context) (*gitObject, error)](#gitRevSpecExpr.Object)
    * [type gitRevisionRange struct](#gitRevisionRange)
        * [func (r *gitRevisionRange) Base() *gitRevSpec](#gitRevisionRange.Base)
        * [func (r *gitRevisionRange) BaseRevSpec() *gitRevSpecExpr](#gitRevisionRange.BaseRevSpec)
        * [func (r *gitRevisionRange) Expr() string](#gitRevisionRange.Expr)
        * [func (r *gitRevisionRange) Head() *gitRevSpec](#gitRevisionRange.Head)
        * [func (r *gitRevisionRange) HeadRevSpec() *gitRevSpecExpr](#gitRevisionRange.HeadRevSpec)
        * [func (r *gitRevisionRange) MergeBase() *gitObject](#gitRevisionRange.MergeBase)
    * [type gitSubmoduleResolver struct](#gitSubmoduleResolver)
        * [func (r *gitSubmoduleResolver) Commit() string](#gitSubmoduleResolver.Commit)
        * [func (r *gitSubmoduleResolver) Path() string](#gitSubmoduleResolver.Path)
        * [func (r *gitSubmoduleResolver) URL() string](#gitSubmoduleResolver.URL)
    * [type gitTreeEntryConnectionArgs struct](#gitTreeEntryConnectionArgs)
    * [type gitTreeSuggestionResolver struct](#gitTreeSuggestionResolver)
        * [func (g gitTreeSuggestionResolver) Key() suggestionKey](#gitTreeSuggestionResolver.Key)
        * [func (g gitTreeSuggestionResolver) Label() string](#gitTreeSuggestionResolver.Label)
        * [func (g gitTreeSuggestionResolver) Length() int](#gitTreeSuggestionResolver.Length)
        * [func (g gitTreeSuggestionResolver) Score() int](#gitTreeSuggestionResolver.Score)
        * [func (g gitTreeSuggestionResolver) ToFile() (*GitTreeEntryResolver, bool)](#gitTreeSuggestionResolver.ToFile)
        * [func (g gitTreeSuggestionResolver) ToGitBlob() (*GitTreeEntryResolver, bool)](#gitTreeSuggestionResolver.ToGitBlob)
        * [func (g gitTreeSuggestionResolver) ToGitTree() (*GitTreeEntryResolver, bool)](#gitTreeSuggestionResolver.ToGitTree)
    * [type githubRepository struct](#githubRepository)
    * [type gitlabRepository struct](#gitlabRepository)
    * [type happinessFeedbackSubmissionForHubSpot struct](#happinessFeedbackSubmissionForHubSpot)
    * [type highlightedDiffHunkBodyResolver struct](#highlightedDiffHunkBodyResolver)
        * [func (r *highlightedDiffHunkBodyResolver) Aborted() bool](#highlightedDiffHunkBodyResolver.Aborted)
        * [func (r *highlightedDiffHunkBodyResolver) Lines() []*highlightedDiffHunkLineResolver](#highlightedDiffHunkBodyResolver.Lines)
    * [type highlightedDiffHunkLineResolver struct](#highlightedDiffHunkLineResolver)
        * [func (r *highlightedDiffHunkLineResolver) HTML() string](#highlightedDiffHunkLineResolver.HTML)
        * [func (r *highlightedDiffHunkLineResolver) Kind() string](#highlightedDiffHunkLineResolver.Kind)
    * [type highlightedFileResolver struct](#highlightedFileResolver)
        * [func highlightContent(ctx context.Context, args *HighlightArgs, content, path string, metadata highlight.Metadata) (*highlightedFileResolver, error)](#highlightContent)
        * [func (h *highlightedFileResolver) Aborted() bool](#highlightedFileResolver.Aborted)
        * [func (h *highlightedFileResolver) HTML() string](#highlightedFileResolver.HTML)
        * [func (h *highlightedFileResolver) LineRanges(args *struct{ Ranges []highlight.LineRange }) ([][]string, error)](#highlightedFileResolver.LineRanges)
    * [type highlightedRangeResolver struct](#highlightedRangeResolver)
        * [func (h highlightedRangeResolver) Character() int32](#highlightedRangeResolver.Character)
        * [func (h highlightedRangeResolver) Length() int32](#highlightedRangeResolver.Length)
        * [func (h highlightedRangeResolver) Line() int32](#highlightedRangeResolver.Line)
    * [type highlightedStringResolver struct](#highlightedStringResolver)
        * [func (s *highlightedStringResolver) Highlights() []highlightedRangeResolver](#highlightedStringResolver.Highlights)
        * [func (s *highlightedStringResolver) Value() string](#highlightedStringResolver.Value)
    * [type hunkResolver struct](#hunkResolver)
        * [func (r *hunkResolver) Author() signatureResolver](#hunkResolver.Author)
        * [func (r *hunkResolver) Commit(ctx context.Context) (*GitCommitResolver, error)](#hunkResolver.Commit)
        * [func (r *hunkResolver) EndByte() int32](#hunkResolver.EndByte)
        * [func (r *hunkResolver) EndLine() int32](#hunkResolver.EndLine)
        * [func (r *hunkResolver) Message() string](#hunkResolver.Message)
        * [func (r *hunkResolver) Rev() string](#hunkResolver.Rev)
        * [func (r *hunkResolver) StartByte() int32](#hunkResolver.StartByte)
        * [func (r *hunkResolver) StartLine() int32](#hunkResolver.StartLine)
    * [type inviteUserToOrganizationResult struct](#inviteUserToOrganizationResult)
        * [func (r *inviteUserToOrganizationResult) InvitationURL() string](#inviteUserToOrganizationResult.InvitationURL)
        * [func (r *inviteUserToOrganizationResult) SentInvitationEmail() bool](#inviteUserToOrganizationResult.SentInvitationEmail)
    * [type keyPathSegment struct](#keyPathSegment)
    * [type languageResolver struct](#languageResolver)
        * [func (r *languageResolver) Name() string](#languageResolver.Name)
    * [type languageStatisticsResolver struct](#languageStatisticsResolver)
        * [func (l *languageStatisticsResolver) Name() string](#languageStatisticsResolver.Name)
        * [func (l *languageStatisticsResolver) TotalBytes() float64](#languageStatisticsResolver.TotalBytes)
        * [func (l *languageStatisticsResolver) TotalLines() int32](#languageStatisticsResolver.TotalLines)
    * [type languageSuggestionResolver struct](#languageSuggestionResolver)
        * [func (l languageSuggestionResolver) Key() suggestionKey](#languageSuggestionResolver.Key)
        * [func (l languageSuggestionResolver) Label() string](#languageSuggestionResolver.Label)
        * [func (l languageSuggestionResolver) Length() int](#languageSuggestionResolver.Length)
        * [func (l languageSuggestionResolver) Score() int](#languageSuggestionResolver.Score)
        * [func (l languageSuggestionResolver) ToLanguage() (*languageResolver, bool)](#languageSuggestionResolver.ToLanguage)
    * [type limiter interface](#limiter)
    * [type lineMatchResolver struct](#lineMatchResolver)
        * [func (lm lineMatchResolver) LimitHit() bool](#lineMatchResolver.LimitHit)
        * [func (lm lineMatchResolver) LineNumber() int32](#lineMatchResolver.LineNumber)
        * [func (lm lineMatchResolver) OffsetAndLengths() [][]int32](#lineMatchResolver.OffsetAndLengths)
        * [func (lm lineMatchResolver) Preview() string](#lineMatchResolver.Preview)
    * [type listSearchContextsArgs struct](#listSearchContextsArgs)
    * [type locationResolver struct](#locationResolver)
        * [func (r *locationResolver) CanonicalURL() string](#locationResolver.CanonicalURL)
        * [func (r *locationResolver) Range() *rangeResolver](#locationResolver.Range)
        * [func (r *locationResolver) Resource() *GitTreeEntryResolver](#locationResolver.Resource)
        * [func (r *locationResolver) URL(ctx context.Context) (string, error)](#locationResolver.URL)
        * [func (r *locationResolver) urlPath(prefix string) string](#locationResolver.urlPath)
    * [type markdownOptions struct](#markdownOptions)
    * [type missingRepoRevsError struct](#missingRepoRevsError)
        * [func (*missingRepoRevsError) Error() string](#missingRepoRevsError.Error)
    * [type numTotalReposCache struct](#numTotalReposCache)
        * [func (n *numTotalReposCache) get(ctx context.Context, repoStore *database.RepoStore) int](#numTotalReposCache.get)
    * [type orgConnectionResolver struct](#orgConnectionResolver)
        * [func (r *orgConnectionResolver) Nodes(ctx context.Context) ([]*OrgResolver, error)](#orgConnectionResolver.Nodes)
        * [func (r *orgConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#orgConnectionResolver.TotalCount)
    * [type orgConnectionStaticResolver struct](#orgConnectionStaticResolver)
        * [func (r *orgConnectionStaticResolver) Nodes() []*OrgResolver](#orgConnectionStaticResolver.Nodes)
        * [func (r *orgConnectionStaticResolver) PageInfo() *graphqlutil.PageInfo](#orgConnectionStaticResolver.PageInfo)
        * [func (r *orgConnectionStaticResolver) TotalCount() int32](#orgConnectionStaticResolver.TotalCount)
    * [type organizationInvitationResolver struct](#organizationInvitationResolver)
        * [func orgInvitationByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*organizationInvitationResolver, error)](#orgInvitationByID)
        * [func orgInvitationByIDInt64(ctx context.Context, db dbutil.DB, id int64) (*organizationInvitationResolver, error)](#orgInvitationByIDInt64)
        * [func (r *organizationInvitationResolver) CreatedAt() DateTime](#organizationInvitationResolver.CreatedAt)
        * [func (r *organizationInvitationResolver) ID() graphql.ID](#organizationInvitationResolver.ID)
        * [func (r *organizationInvitationResolver) NotifiedAt() *DateTime](#organizationInvitationResolver.NotifiedAt)
        * [func (r *organizationInvitationResolver) Organization(ctx context.Context) (*OrgResolver, error)](#organizationInvitationResolver.Organization)
        * [func (r *organizationInvitationResolver) Recipient(ctx context.Context) (*UserResolver, error)](#organizationInvitationResolver.Recipient)
        * [func (r *organizationInvitationResolver) RespondURL(ctx context.Context) (*string, error)](#organizationInvitationResolver.RespondURL)
        * [func (r *organizationInvitationResolver) RespondedAt() *DateTime](#organizationInvitationResolver.RespondedAt)
        * [func (r *organizationInvitationResolver) ResponseType() *string](#organizationInvitationResolver.ResponseType)
        * [func (r *organizationInvitationResolver) RevokedAt() *DateTime](#organizationInvitationResolver.RevokedAt)
        * [func (r *organizationInvitationResolver) Sender(ctx context.Context) (*UserResolver, error)](#organizationInvitationResolver.Sender)
    * [type organizationMembershipConnectionResolver struct](#organizationMembershipConnectionResolver)
        * [func (r *organizationMembershipConnectionResolver) Nodes() []*organizationMembershipResolver](#organizationMembershipConnectionResolver.Nodes)
        * [func (r *organizationMembershipConnectionResolver) PageInfo() *graphqlutil.PageInfo](#organizationMembershipConnectionResolver.PageInfo)
        * [func (r *organizationMembershipConnectionResolver) TotalCount() int32](#organizationMembershipConnectionResolver.TotalCount)
    * [type organizationMembershipResolver struct](#organizationMembershipResolver)
        * [func (r *organizationMembershipResolver) CreatedAt() DateTime](#organizationMembershipResolver.CreatedAt)
        * [func (r *organizationMembershipResolver) Organization(ctx context.Context) (*OrgResolver, error)](#organizationMembershipResolver.Organization)
        * [func (r *organizationMembershipResolver) UpdatedAt() DateTime](#organizationMembershipResolver.UpdatedAt)
        * [func (r *organizationMembershipResolver) User(ctx context.Context) (*UserResolver, error)](#organizationMembershipResolver.User)
    * [type outOfBandMigrationErrorResolver struct](#outOfBandMigrationErrorResolver)
        * [func (r *outOfBandMigrationErrorResolver) Created() DateTime](#outOfBandMigrationErrorResolver.Created)
        * [func (r *outOfBandMigrationErrorResolver) Message() string](#outOfBandMigrationErrorResolver.Message)
    * [type outOfBandMigrationResolver struct](#outOfBandMigrationResolver)
        * [func (r *outOfBandMigrationResolver) ApplyReverse() bool](#outOfBandMigrationResolver.ApplyReverse)
        * [func (r *outOfBandMigrationResolver) Component() string](#outOfBandMigrationResolver.Component)
        * [func (r *outOfBandMigrationResolver) Created() DateTime](#outOfBandMigrationResolver.Created)
        * [func (r *outOfBandMigrationResolver) Deprecated() *string](#outOfBandMigrationResolver.Deprecated)
        * [func (r *outOfBandMigrationResolver) Description() string](#outOfBandMigrationResolver.Description)
        * [func (r *outOfBandMigrationResolver) Errors() []*outOfBandMigrationErrorResolver](#outOfBandMigrationResolver.Errors)
        * [func (r *outOfBandMigrationResolver) ID() graphql.ID](#outOfBandMigrationResolver.ID)
        * [func (r *outOfBandMigrationResolver) Introduced() string](#outOfBandMigrationResolver.Introduced)
        * [func (r *outOfBandMigrationResolver) LastUpdated() *DateTime](#outOfBandMigrationResolver.LastUpdated)
        * [func (r *outOfBandMigrationResolver) NonDestructive() bool](#outOfBandMigrationResolver.NonDestructive)
        * [func (r *outOfBandMigrationResolver) Progress() float64](#outOfBandMigrationResolver.Progress)
        * [func (r *outOfBandMigrationResolver) Team() string](#outOfBandMigrationResolver.Team)
    * [type overrideSpec struct](#overrideSpec)
        * [func unmarshalOverrideID(id graphql.ID) (spec overrideSpec, err error)](#unmarshalOverrideID)
    * [type parentSourcegraphResolver struct](#parentSourcegraphResolver)
        * [func (r *parentSourcegraphResolver) URL() string](#parentSourcegraphResolver.URL)
    * [type phabricatorRepoResolver struct](#phabricatorRepoResolver)
        * [func (p *phabricatorRepoResolver) Callsign() string](#phabricatorRepoResolver.Callsign)
        * [func (p *phabricatorRepoResolver) Name() string](#phabricatorRepoResolver.Name)
        * [func (p *phabricatorRepoResolver) URI() string](#phabricatorRepoResolver.URI)
        * [func (p *phabricatorRepoResolver) URL() string](#phabricatorRepoResolver.URL)
    * [type positionResolver struct](#positionResolver)
        * [func (r *positionResolver) Character() int32](#positionResolver.Character)
        * [func (r *positionResolver) Line() int32](#positionResolver.Line)
        * [func (r *positionResolver) urlFragment(forceIncludeCharacter bool) string](#positionResolver.urlFragment)
    * [type previewRepositoryComparisonResolver struct](#previewRepositoryComparisonResolver)
        * [func NewPreviewRepositoryComparisonResolver(ctx context.Context, db dbutil.DB, repo *RepositoryResolver, baseRev, patch string) (*previewRepositoryComparisonResolver, error)](#NewPreviewRepositoryComparisonResolver)
        * [func (r *previewRepositoryComparisonResolver) BaseRepository() *RepositoryResolver](#previewRepositoryComparisonResolver.BaseRepository)
        * [func (r *previewRepositoryComparisonResolver) FileDiffs(ctx context.Context, args *FileDiffsConnectionArgs) (FileDiffConnection, error)](#previewRepositoryComparisonResolver.FileDiffs)
        * [func (r *previewRepositoryComparisonResolver) ToPreviewRepositoryComparison() (PreviewRepositoryComparisonResolver, bool)](#previewRepositoryComparisonResolver.ToPreviewRepositoryComparison)
        * [func (r *previewRepositoryComparisonResolver) ToRepositoryComparison() (*RepositoryComparisonResolver, bool)](#previewRepositoryComparisonResolver.ToRepositoryComparison)
    * [type productSubscriptionStatus struct{}](#productSubscriptionStatus)
        * [func (productSubscriptionStatus) ActualUserCount(ctx context.Context) (int32, error)](#productSubscriptionStatus.ActualUserCount)
        * [func (productSubscriptionStatus) ActualUserCountDate(ctx context.Context) (string, error)](#productSubscriptionStatus.ActualUserCountDate)
        * [func (r productSubscriptionStatus) License() (*ProductLicenseInfo, error)](#productSubscriptionStatus.License)
        * [func (productSubscriptionStatus) MaximumAllowedUserCount(ctx context.Context) (*int32, error)](#productSubscriptionStatus.MaximumAllowedUserCount)
        * [func (productSubscriptionStatus) NoLicenseWarningUserCount(ctx context.Context) (*int32, error)](#productSubscriptionStatus.NoLicenseWarningUserCount)
        * [func (productSubscriptionStatus) ProductNameWithBrand() (string, error)](#productSubscriptionStatus.ProductNameWithBrand)
    * [type prometheusTracer struct](#prometheusTracer)
        * [func (prometheusTracer) TraceField(ctx context.Context, label, typeName, fieldName string, trivial bool, args map[string]interface{}) (context.Context, trace.TraceFieldFinishFunc)](#prometheusTracer.TraceField)
        * [func (t *prometheusTracer) TraceQuery(ctx context.Context, queryString string, operationName string, variables map[string]interface{}, varTypes map[string]*introspection.Type) (context.Context, trace.TraceQueryFinishFunc)](#prometheusTracer.TraceQuery)
    * [type randomizeUserPasswordResult struct](#randomizeUserPasswordResult)
        * [func (r *randomizeUserPasswordResult) ResetPasswordURL(ctx context.Context) (*string, error)](#randomizeUserPasswordResult.ResetPasswordURL)
    * [type rangeResolver struct](#rangeResolver)
        * [func (r *rangeResolver) End() PositionResolver](#rangeResolver.End)
        * [func (r *rangeResolver) Start() PositionResolver](#rangeResolver.Start)
        * [func (r *rangeResolver) end() *positionResolver](#rangeResolver.end)
        * [func (r *rangeResolver) start() *positionResolver](#rangeResolver.start)
        * [func (r *rangeResolver) urlFragment() string](#rangeResolver.urlFragment)
    * [type refsArgs struct](#refsArgs)
    * [type repoGroup struct](#repoGroup)
        * [func (g repoGroup) Name() string](#repoGroup.Name)
        * [func (g repoGroup) Repositories() []string](#repoGroup.Repositories)
    * [type repoLister interface](#repoLister)
    * [type repoListerMock struct{}](#repoListerMock)
        * [func (r repoListerMock) List(ctx context.Context, q zoektquery.Q) (*zoekt.RepoList, error)](#repoListerMock.List)
    * [type repoPaginationPlan struct](#repoPaginationPlan)
        * [func (p *repoPaginationPlan) execute(ctx context.Context, repoStore *database.RepoStore, exec executor) (c *run.SearchCursor, results []result.Match, common *streaming.Stats, err error)](#repoPaginationPlan.execute)
    * [type repoSetter interface](#repoSetter)
    * [type repositoryArgs struct](#repositoryArgs)
    * [type repositoryConnectionResolver struct](#repositoryConnectionResolver)
        * [func (r *repositoryConnectionResolver) Nodes(ctx context.Context) ([]*RepositoryResolver, error)](#repositoryConnectionResolver.Nodes)
        * [func (r *repositoryConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#repositoryConnectionResolver.PageInfo)
        * [func (r *repositoryConnectionResolver) TotalCount(ctx context.Context, args *TotalCountArgs) (countptr *int32, err error)](#repositoryConnectionResolver.TotalCount)
        * [func (r *repositoryConnectionResolver) compute(ctx context.Context) ([]*types.Repo, error)](#repositoryConnectionResolver.compute)
    * [type repositoryContributorConnectionResolver struct](#repositoryContributorConnectionResolver)
        * [func (r *repositoryContributorConnectionResolver) Nodes(ctx context.Context) ([]*repositoryContributorResolver, error)](#repositoryContributorConnectionResolver.Nodes)
        * [func (r *repositoryContributorConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#repositoryContributorConnectionResolver.PageInfo)
        * [func (r *repositoryContributorConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#repositoryContributorConnectionResolver.TotalCount)
        * [func (r *repositoryContributorConnectionResolver) compute(ctx context.Context) ([]*git.PersonCount, error)](#repositoryContributorConnectionResolver.compute)
    * [type repositoryContributorResolver struct](#repositoryContributorResolver)
        * [func (r *repositoryContributorResolver) Commits(args *struct {...](#repositoryContributorResolver.Commits)
        * [func (r *repositoryContributorResolver) Count() int32](#repositoryContributorResolver.Count)
        * [func (r *repositoryContributorResolver) Person() *PersonResolver](#repositoryContributorResolver.Person)
        * [func (r *repositoryContributorResolver) Repository() *RepositoryResolver](#repositoryContributorResolver.Repository)
    * [type repositoryContributorsArgs struct](#repositoryContributorsArgs)
    * [type repositoryCursor struct](#repositoryCursor)
        * [func unmarshalRepositoryCursor(cursor *string) (*repositoryCursor, error)](#unmarshalRepositoryCursor)
    * [type repositoryMirrorInfoResolver struct](#repositoryMirrorInfoResolver)
        * [func (r *repositoryMirrorInfoResolver) CloneInProgress(ctx context.Context) (bool, error)](#repositoryMirrorInfoResolver.CloneInProgress)
        * [func (r *repositoryMirrorInfoResolver) CloneProgress(ctx context.Context) (*string, error)](#repositoryMirrorInfoResolver.CloneProgress)
        * [func (r *repositoryMirrorInfoResolver) Cloned(ctx context.Context) (bool, error)](#repositoryMirrorInfoResolver.Cloned)
        * [func (r *repositoryMirrorInfoResolver) RemoteURL(ctx context.Context) (string, error)](#repositoryMirrorInfoResolver.RemoteURL)
        * [func (r *repositoryMirrorInfoResolver) UpdateQueue(ctx context.Context) (*updateQueueResolver, error)](#repositoryMirrorInfoResolver.UpdateQueue)
        * [func (r *repositoryMirrorInfoResolver) UpdateSchedule(ctx context.Context) (*updateScheduleResolver, error)](#repositoryMirrorInfoResolver.UpdateSchedule)
        * [func (r *repositoryMirrorInfoResolver) UpdatedAt(ctx context.Context) (*DateTime, error)](#repositoryMirrorInfoResolver.UpdatedAt)
        * [func (r *repositoryMirrorInfoResolver) gitserverRepoInfo(ctx context.Context) (*protocol.RepoInfo, error)](#repositoryMirrorInfoResolver.gitserverRepoInfo)
        * [func (r *repositoryMirrorInfoResolver) repoUpdateSchedulerInfo(ctx context.Context) (*repoupdaterprotocol.RepoUpdateSchedulerInfoResult, error)](#repositoryMirrorInfoResolver.repoUpdateSchedulerInfo)
    * [type repositoryRedirect struct](#repositoryRedirect)
        * [func (r *repositoryRedirect) ToRedirect() (*RedirectResolver, bool)](#repositoryRedirect.ToRedirect)
        * [func (r *repositoryRedirect) ToRepository() (*RepositoryResolver, bool)](#repositoryRedirect.ToRepository)
    * [type repositoryStatsResolver struct](#repositoryStatsResolver)
        * [func (r *repositoryStatsResolver) GitDirBytes() BigInt](#repositoryStatsResolver.GitDirBytes)
        * [func (r *repositoryStatsResolver) IndexedLinesCount() BigInt](#repositoryStatsResolver.IndexedLinesCount)
    * [type repositorySuggestionResolver struct](#repositorySuggestionResolver)
        * [func (r repositorySuggestionResolver) Key() suggestionKey](#repositorySuggestionResolver.Key)
        * [func (r repositorySuggestionResolver) Label() string](#repositorySuggestionResolver.Label)
        * [func (r repositorySuggestionResolver) Length() int](#repositorySuggestionResolver.Length)
        * [func (r repositorySuggestionResolver) Score() int](#repositorySuggestionResolver.Score)
        * [func (r repositorySuggestionResolver) ToRepository() (*RepositoryResolver, bool)](#repositorySuggestionResolver.ToRepository)
    * [type repositoryTextSearchIndexResolver struct](#repositoryTextSearchIndexResolver)
        * [func (r *repositoryTextSearchIndexResolver) Refs(ctx context.Context) ([]*repositoryTextSearchIndexedRef, error)](#repositoryTextSearchIndexResolver.Refs)
        * [func (r *repositoryTextSearchIndexResolver) Repository() *RepositoryResolver](#repositoryTextSearchIndexResolver.Repository)
        * [func (r *repositoryTextSearchIndexResolver) Status(ctx context.Context) (*repositoryTextSearchIndexStatus, error)](#repositoryTextSearchIndexResolver.Status)
        * [func (r *repositoryTextSearchIndexResolver) resolve(ctx context.Context) (*zoekt.RepoListEntry, error)](#repositoryTextSearchIndexResolver.resolve)
    * [type repositoryTextSearchIndexStatus struct](#repositoryTextSearchIndexStatus)
        * [func (r *repositoryTextSearchIndexStatus) ContentByteSize() int32](#repositoryTextSearchIndexStatus.ContentByteSize)
        * [func (r *repositoryTextSearchIndexStatus) ContentFilesCount() int32](#repositoryTextSearchIndexStatus.ContentFilesCount)
        * [func (r *repositoryTextSearchIndexStatus) DefaultBranchNewLinesCount() int32](#repositoryTextSearchIndexStatus.DefaultBranchNewLinesCount)
        * [func (r *repositoryTextSearchIndexStatus) IndexByteSize() int32](#repositoryTextSearchIndexStatus.IndexByteSize)
        * [func (r *repositoryTextSearchIndexStatus) IndexShardsCount() int32](#repositoryTextSearchIndexStatus.IndexShardsCount)
        * [func (r *repositoryTextSearchIndexStatus) NewLinesCount() int32](#repositoryTextSearchIndexStatus.NewLinesCount)
        * [func (r *repositoryTextSearchIndexStatus) OtherBranchesNewLinesCount() int32](#repositoryTextSearchIndexStatus.OtherBranchesNewLinesCount)
        * [func (r *repositoryTextSearchIndexStatus) UpdatedAt() DateTime](#repositoryTextSearchIndexStatus.UpdatedAt)
    * [type repositoryTextSearchIndexedRef struct](#repositoryTextSearchIndexedRef)
        * [func (r *repositoryTextSearchIndexedRef) Current(ctx context.Context) (bool, error)](#repositoryTextSearchIndexedRef.Current)
        * [func (r *repositoryTextSearchIndexedRef) Indexed() bool](#repositoryTextSearchIndexedRef.Indexed)
        * [func (r *repositoryTextSearchIndexedRef) IndexedCommit() *gitObject](#repositoryTextSearchIndexedRef.IndexedCommit)
        * [func (r *repositoryTextSearchIndexedRef) Ref() *GitRefResolver](#repositoryTextSearchIndexedRef.Ref)
    * [type repoupdaterClient interface](#repoupdaterClient)
    * [type resolveRepositoriesOpts struct](#resolveRepositoriesOpts)
    * [type roundTripFunc func(*net/http.Request) (*net/http.Response, error)](#roundTripFunc)
        * [func (f roundTripFunc) RoundTrip(r *http.Request) (*http.Response, error)](#roundTripFunc.RoundTrip)
    * [type savedSearchResolver struct](#savedSearchResolver)
        * [func (r savedSearchResolver) Description() string](#savedSearchResolver.Description)
        * [func (r savedSearchResolver) ID() graphql.ID](#savedSearchResolver.ID)
        * [func (r savedSearchResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)](#savedSearchResolver.Namespace)
        * [func (r savedSearchResolver) Notify() bool](#savedSearchResolver.Notify)
        * [func (r savedSearchResolver) NotifySlack() bool](#savedSearchResolver.NotifySlack)
        * [func (r savedSearchResolver) Query() string](#savedSearchResolver.Query)
        * [func (r savedSearchResolver) SlackWebhookURL() *string](#savedSearchResolver.SlackWebhookURL)
    * [type schemaResolver struct](#schemaResolver)
        * [func newSchemaResolver(db dbutil.DB) *schemaResolver](#newSchemaResolver)
        * [func (r *schemaResolver) AddExternalService(ctx context.Context, args *addExternalServiceArgs) (*externalServiceResolver, error)](#schemaResolver.AddExternalService)
        * [func (r *schemaResolver) AddPhabricatorRepo(ctx context.Context, args *struct {...](#schemaResolver.AddPhabricatorRepo)
        * [func (r *schemaResolver) AddUserEmail(ctx context.Context, args *struct {...](#schemaResolver.AddUserEmail)
        * [func (r *schemaResolver) AddUserToOrganization(ctx context.Context, args *struct {...](#schemaResolver.AddUserToOrganization)
        * [func (r *schemaResolver) AffiliatedRepositories(ctx context.Context, args *struct {...](#schemaResolver.AffiliatedRepositories)
        * [func (r *schemaResolver) AutoDefinedSearchContexts(ctx context.Context) ([]*searchContextResolver, error)](#schemaResolver.AutoDefinedSearchContexts)
        * [func (r *schemaResolver) CheckMirrorRepositoryConnection(ctx context.Context, args *struct {...](#schemaResolver.CheckMirrorRepositoryConnection)
        * [func (r *schemaResolver) ClientConfiguration(ctx context.Context) (*clientConfigurationResolver, error)](#schemaResolver.ClientConfiguration)
        * [func (r *schemaResolver) CodeHostSyncDue(ctx context.Context, args *struct {...](#schemaResolver.CodeHostSyncDue)
        * [func (r *schemaResolver) ConfigurationMutation(ctx context.Context, args *struct {...](#schemaResolver.ConfigurationMutation)
        * [func (r *schemaResolver) ConvertVersionContextToSearchContext(ctx context.Context, args *struct {...](#schemaResolver.ConvertVersionContextToSearchContext)
        * [func (r *schemaResolver) CreateAccessToken(ctx context.Context, args *createAccessTokenInput) (*createAccessTokenResult, error)](#schemaResolver.CreateAccessToken)
        * [func (r *schemaResolver) CreateFeatureFlag(ctx context.Context, args struct {...](#schemaResolver.CreateFeatureFlag)
        * [func (r *schemaResolver) CreateFeatureFlagOverride(ctx context.Context, args struct {...](#schemaResolver.CreateFeatureFlagOverride)
        * [func (r *schemaResolver) CreateOrganization(ctx context.Context, args *struct {...](#schemaResolver.CreateOrganization)
        * [func (r *schemaResolver) CreatePassword(ctx context.Context, args *struct {...](#schemaResolver.CreatePassword)
        * [func (r *schemaResolver) CreateSavedSearch(ctx context.Context, args *struct {...](#schemaResolver.CreateSavedSearch)
        * [func (r *schemaResolver) CreateSearchContext(ctx context.Context, args createSearchContextArgs) (*searchContextResolver, error)](#schemaResolver.CreateSearchContext)
        * [func (r *schemaResolver) CreateUser(ctx context.Context, args *struct {...](#schemaResolver.CreateUser)
        * [func (r *schemaResolver) CurrentUser(ctx context.Context) (*UserResolver, error)](#schemaResolver.CurrentUser)
        * [func (r *schemaResolver) DeleteAccessToken(ctx context.Context, args *deleteAccessTokenInput) (*EmptyResponse, error)](#schemaResolver.DeleteAccessToken)
        * [func (r *schemaResolver) DeleteExternalAccount(ctx context.Context, args *struct {...](#schemaResolver.DeleteExternalAccount)
        * [func (r *schemaResolver) DeleteExternalService(ctx context.Context, args *deleteExternalServiceArgs) (*EmptyResponse, error)](#schemaResolver.DeleteExternalService)
        * [func (r *schemaResolver) DeleteFeatureFlag(ctx context.Context, args struct {...](#schemaResolver.DeleteFeatureFlag)
        * [func (r *schemaResolver) DeleteFeatureFlagOverride(ctx context.Context, args struct {...](#schemaResolver.DeleteFeatureFlagOverride)
        * [func (r *schemaResolver) DeleteOrganization(ctx context.Context, args *struct {...](#schemaResolver.DeleteOrganization)
        * [func (r *schemaResolver) DeleteSavedSearch(ctx context.Context, args *struct {...](#schemaResolver.DeleteSavedSearch)
        * [func (r *schemaResolver) DeleteSearchContext(ctx context.Context, args struct {...](#schemaResolver.DeleteSearchContext)
        * [func (r *schemaResolver) DeleteUser(ctx context.Context, args *struct {...](#schemaResolver.DeleteUser)
        * [func (r *schemaResolver) ExtensionRegistry(ctx context.Context) (ExtensionRegistryResolver, error)](#schemaResolver.ExtensionRegistry)
        * [func (r *schemaResolver) ExternalServices(ctx context.Context, args *ExternalServicesArgs) (*externalServiceConnectionResolver, error)](#schemaResolver.ExternalServices)
        * [func (r *schemaResolver) FeatureFlags(ctx context.Context) ([]*FeatureFlagResolver, error)](#schemaResolver.FeatureFlags)
        * [func (*schemaResolver) HighlightCode(ctx context.Context, args *struct {...](#schemaResolver.HighlightCode)
        * [func (r *schemaResolver) InvalidateSessionsByID(ctx context.Context, args *struct {...](#schemaResolver.InvalidateSessionsByID)
        * [func (r *schemaResolver) InviteUserToOrganization(ctx context.Context, args *struct {...](#schemaResolver.InviteUserToOrganization)
        * [func (r *schemaResolver) IsSearchContextAvailable(ctx context.Context, args struct {...](#schemaResolver.IsSearchContextAvailable)
        * [func (r *schemaResolver) LogEvent(ctx context.Context, args *struct {...](#schemaResolver.LogEvent)
        * [func (*schemaResolver) LogUserEvent(ctx context.Context, args *struct {...](#schemaResolver.LogUserEvent)
        * [func (r *schemaResolver) Namespace(ctx context.Context, args *struct{ ID graphql.ID }) (*NamespaceResolver, error)](#schemaResolver.Namespace)
        * [func (r *schemaResolver) NamespaceByName(ctx context.Context, args *struct{ Name string }) (*NamespaceResolver, error)](#schemaResolver.NamespaceByName)
        * [func (r *schemaResolver) Node(ctx context.Context, args *struct{ ID graphql.ID }) (*NodeResolver, error)](#schemaResolver.Node)
        * [func (r *schemaResolver) Org(ctx context.Context, args *struct {...](#schemaResolver.Org)
        * [func (r *schemaResolver) Organization(ctx context.Context, args struct{ Name string }) (*OrgResolver, error)](#schemaResolver.Organization)
        * [func (r *schemaResolver) Organizations(args *struct {...](#schemaResolver.Organizations)
        * [func (r *schemaResolver) OutOfBandMigrationByID(ctx context.Context, id graphql.ID) (*outOfBandMigrationResolver, error)](#schemaResolver.OutOfBandMigrationByID)
        * [func (r *schemaResolver) OutOfBandMigrations(ctx context.Context) ([]*outOfBandMigrationResolver, error)](#schemaResolver.OutOfBandMigrations)
        * [func (r *schemaResolver) ParseSearchQuery(ctx context.Context, args *struct {...](#schemaResolver.ParseSearchQuery)
        * [func (r *schemaResolver) PhabricatorRepo(ctx context.Context, args *struct {...](#schemaResolver.PhabricatorRepo)
        * [func (r *schemaResolver) RandomizeUserPassword(ctx context.Context, args *struct {...](#schemaResolver.RandomizeUserPassword)
        * [func (r *schemaResolver) ReloadSite(ctx context.Context) (*EmptyResponse, error)](#schemaResolver.ReloadSite)
        * [func (r *schemaResolver) RemoveUserEmail(ctx context.Context, args *struct {...](#schemaResolver.RemoveUserEmail)
        * [func (r *schemaResolver) RemoveUserFromOrganization(ctx context.Context, args *struct {...](#schemaResolver.RemoveUserFromOrganization)
        * [func (*schemaResolver) RenderMarkdown(args *struct {...](#schemaResolver.RenderMarkdown)
        * [func (r *schemaResolver) RepoGroups(ctx context.Context) ([]*repoGroup, error)](#schemaResolver.RepoGroups)
        * [func (r *schemaResolver) Repositories(args *repositoryArgs) (*repositoryConnectionResolver, error)](#schemaResolver.Repositories)
        * [func (r *schemaResolver) Repository(ctx context.Context, args *struct {...](#schemaResolver.Repository)
        * [func (r *schemaResolver) RepositoryRedirect(ctx context.Context, args *struct {...](#schemaResolver.RepositoryRedirect)
        * [func (r *schemaResolver) RepositoryStats(ctx context.Context) (*repositoryStatsResolver, error)](#schemaResolver.RepositoryStats)
        * [func (r *schemaResolver) RequestTrial(ctx context.Context, args *struct {...](#schemaResolver.RequestTrial)
        * [func (r *schemaResolver) ResendOrganizationInvitationNotification(ctx context.Context, args *struct {...](#schemaResolver.ResendOrganizationInvitationNotification)
        * [func (r *schemaResolver) ResendVerificationEmail(ctx context.Context, args *struct {...](#schemaResolver.ResendVerificationEmail)
        * [func (r *schemaResolver) ResolvePhabricatorDiff(ctx context.Context, args *struct {...](#schemaResolver.ResolvePhabricatorDiff)
        * [func (r *schemaResolver) RespondToOrganizationInvitation(ctx context.Context, args *struct {...](#schemaResolver.RespondToOrganizationInvitation)
        * [func (r *schemaResolver) RevokeOrganizationInvitation(ctx context.Context, args *struct {...](#schemaResolver.RevokeOrganizationInvitation)
        * [func (r *schemaResolver) Root() *schemaResolver](#schemaResolver.Root)
        * [func (r *schemaResolver) SavedSearches(ctx context.Context) ([]*savedSearchResolver, error)](#schemaResolver.SavedSearches)
        * [func (r *schemaResolver) Search(ctx context.Context, args *SearchArgs) (SearchImplementer, error)](#schemaResolver.Search)
        * [func (r *schemaResolver) SearchContextByID(ctx context.Context, id graphql.ID) (*searchContextResolver, error)](#schemaResolver.SearchContextByID)
        * [func (r *schemaResolver) SearchContexts(ctx context.Context, args *listSearchContextsArgs) (*searchContextConnection, error)](#schemaResolver.SearchContexts)
        * [func (r *schemaResolver) SearchFilterSuggestions(ctx context.Context) (*searchFilterSuggestions, error)](#schemaResolver.SearchFilterSuggestions)
        * [func (r *schemaResolver) SendSavedSearchTestNotification(ctx context.Context, args *struct {...](#schemaResolver.SendSavedSearchTestNotification)
        * [func (r *schemaResolver) SetExternalServiceRepos(ctx context.Context, args struct {...](#schemaResolver.SetExternalServiceRepos)
        * [func (r *schemaResolver) SetMigrationDirection(ctx context.Context, args *struct {...](#schemaResolver.SetMigrationDirection)
        * [func (r *schemaResolver) SetTag(ctx context.Context, args *struct {...](#schemaResolver.SetTag)
        * [func (r *schemaResolver) SetUserEmailPrimary(ctx context.Context, args *struct {...](#schemaResolver.SetUserEmailPrimary)
        * [func (r *schemaResolver) SetUserEmailVerified(ctx context.Context, args *struct {...](#schemaResolver.SetUserEmailVerified)
        * [func (r *schemaResolver) SetUserIsSiteAdmin(ctx context.Context, args *struct {...](#schemaResolver.SetUserIsSiteAdmin)
        * [func (r *schemaResolver) SetUserPublicRepos(ctx context.Context, args struct {...](#schemaResolver.SetUserPublicRepos)
        * [func (r *schemaResolver) SettingsMutation(ctx context.Context, args *struct {...](#schemaResolver.SettingsMutation)
        * [func (r *schemaResolver) SettingsSubject(ctx context.Context, args *struct{ ID graphql.ID }) (*settingsSubject, error)](#schemaResolver.SettingsSubject)
        * [func (r *schemaResolver) Site() *siteResolver](#schemaResolver.Site)
        * [func (r *schemaResolver) StatusMessages(ctx context.Context) ([]*statusMessageResolver, error)](#schemaResolver.StatusMessages)
        * [func (r *schemaResolver) SubmitHappinessFeedback(ctx context.Context, args *struct {...](#schemaResolver.SubmitHappinessFeedback)
        * [func (r *schemaResolver) SubmitSurvey(ctx context.Context, args *struct {...](#schemaResolver.SubmitSurvey)
        * [func (r *schemaResolver) SurveyResponses(args *struct {...](#schemaResolver.SurveyResponses)
        * [func (r *schemaResolver) TriggerObservabilityTestAlert(ctx context.Context, args *struct {...](#schemaResolver.TriggerObservabilityTestAlert)
        * [func (r *schemaResolver) UpdateExternalService(ctx context.Context, args *updateExternalServiceArgs) (*externalServiceResolver, error)](#schemaResolver.UpdateExternalService)
        * [func (r *schemaResolver) UpdateFeatureFlag(ctx context.Context, args struct {...](#schemaResolver.UpdateFeatureFlag)
        * [func (r *schemaResolver) UpdateFeatureFlagOverride(ctx context.Context, args struct {...](#schemaResolver.UpdateFeatureFlagOverride)
        * [func (r *schemaResolver) UpdateMirrorRepository(ctx context.Context, args *struct {...](#schemaResolver.UpdateMirrorRepository)
        * [func (r *schemaResolver) UpdateOrganization(ctx context.Context, args *struct {...](#schemaResolver.UpdateOrganization)
        * [func (r *schemaResolver) UpdatePassword(ctx context.Context, args *struct {...](#schemaResolver.UpdatePassword)
        * [func (r *schemaResolver) UpdateSavedSearch(ctx context.Context, args *struct {...](#schemaResolver.UpdateSavedSearch)
        * [func (r *schemaResolver) UpdateSearchContext(ctx context.Context, args updateSearchContextArgs) (*searchContextResolver, error)](#schemaResolver.UpdateSearchContext)
        * [func (r *schemaResolver) UpdateSiteConfiguration(ctx context.Context, args *struct {...](#schemaResolver.UpdateSiteConfiguration)
        * [func (r *schemaResolver) UpdateUser(ctx context.Context, args *updateUserArgs) (*UserResolver, error)](#schemaResolver.UpdateUser)
        * [func (r *schemaResolver) User(ctx context.Context, args struct {...](#schemaResolver.User)
        * [func (r *schemaResolver) Users(args *struct {...](#schemaResolver.Users)
        * [func (r *schemaResolver) VersionContexts(ctx context.Context) ([]*versionContextResolver, error)](#schemaResolver.VersionContexts)
        * [func (r *schemaResolver) ViewerConfiguration(ctx context.Context) (*settingsCascade, error)](#schemaResolver.ViewerConfiguration)
        * [func (r *schemaResolver) ViewerFeatureFlags(ctx context.Context) []*EvaluatedFeatureFlagResolver](#schemaResolver.ViewerFeatureFlags)
        * [func (r schemaResolver) ViewerSettings(ctx context.Context) (*settingsCascade, error)](#schemaResolver.ViewerSettings)
        * [func (r *schemaResolver) gitCommitByID(ctx context.Context, id graphql.ID) (*GitCommitResolver, error)](#schemaResolver.gitCommitByID)
        * [func (r *schemaResolver) gitRefByID(ctx context.Context, id graphql.ID) (*GitRefResolver, error)](#schemaResolver.gitRefByID)
        * [func (r *schemaResolver) nodeByID(ctx context.Context, id graphql.ID) (Node, error)](#schemaResolver.nodeByID)
        * [func (r *schemaResolver) repositoryByID(ctx context.Context, id graphql.ID) (*RepositoryResolver, error)](#schemaResolver.repositoryByID)
        * [func (r *schemaResolver) repositoryRevisionsFromInputArgs(ctx context.Context, args []searchContextRepositoryRevisionsInputArgs) ([]*types.SearchContextRepositoryRevisions, error)](#schemaResolver.repositoryRevisionsFromInputArgs)
        * [func (r *schemaResolver) savedSearchByID(ctx context.Context, id graphql.ID) (*savedSearchResolver, error)](#schemaResolver.savedSearchByID)
        * [func (r *schemaResolver) siteByGQLID(ctx context.Context, id graphql.ID) (Node, error)](#schemaResolver.siteByGQLID)
        * [func (r *schemaResolver) toSavedSearchResolver(entry types.SavedSearch) *savedSearchResolver](#schemaResolver.toSavedSearchResolver)
    * [type searchAlert struct](#searchAlert)
        * [func alertForCappedAndExpression() *searchAlert](#alertForCappedAndExpression)
        * [func alertForError(err error) *searchAlert](#alertForError)
        * [func alertForInvalidRevision(revision string) *searchAlert](#alertForInvalidRevision)
        * [func alertForMissingRepoRevs(missingRepoRevs []*search.RepositoryRevisions) *searchAlert](#alertForMissingRepoRevs)
        * [func alertForQuery(queryString string, err error) *searchAlert](#alertForQuery)
        * [func alertForStalePermissions() *searchAlert](#alertForStalePermissions)
        * [func alertForStructuralSearchNotSet(queryString string) *searchAlert](#alertForStructuralSearchNotSet)
        * [func alertForTimeout(usedTime time.Duration, suggestTime time.Duration, r *searchResolver) *searchAlert](#alertForTimeout)
        * [func errorToAlert(err error) (*searchAlert, error)](#errorToAlert)
        * [func maxAlertByPriority(a, b *searchAlert) *searchAlert](#maxAlertByPriority)
        * [func multierrorToAlert(me *multierror.Error) (resAlert *searchAlert, resErr error)](#multierrorToAlert)
        * [func (a searchAlert) Description() *string](#searchAlert.Description)
        * [func (a searchAlert) PrometheusType() string](#searchAlert.PrometheusType)
        * [func (a searchAlert) ProposedQueries() *[]*searchQueryDescription](#searchAlert.ProposedQueries)
        * [func (a searchAlert) Title() string](#searchAlert.Title)
        * [func (a searchAlert) wrapResults() *SearchResults](#searchAlert.wrapResults)
        * [func (a searchAlert) wrapSearchImplementer(db dbutil.DB) *alertSearchImplementer](#searchAlert.wrapSearchImplementer)
    * [type searchContextConnection struct](#searchContextConnection)
        * [func (s *searchContextConnection) Nodes(ctx context.Context) ([]*searchContextResolver, error)](#searchContextConnection.Nodes)
        * [func (s *searchContextConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#searchContextConnection.PageInfo)
        * [func (s *searchContextConnection) TotalCount(ctx context.Context) (int32, error)](#searchContextConnection.TotalCount)
    * [type searchContextEditInputArgs struct](#searchContextEditInputArgs)
    * [type searchContextInputArgs struct](#searchContextInputArgs)
    * [type searchContextRepositoryRevisionsInputArgs struct](#searchContextRepositoryRevisionsInputArgs)
    * [type searchContextRepositoryRevisionsResolver struct](#searchContextRepositoryRevisionsResolver)
        * [func (r *searchContextRepositoryRevisionsResolver) Repository(ctx context.Context) *RepositoryResolver](#searchContextRepositoryRevisionsResolver.Repository)
        * [func (r *searchContextRepositoryRevisionsResolver) Revisions(ctx context.Context) []string](#searchContextRepositoryRevisionsResolver.Revisions)
    * [type searchContextResolver struct](#searchContextResolver)
        * [func (r *searchContextResolver) AutoDefined(ctx context.Context) bool](#searchContextResolver.AutoDefined)
        * [func (r *searchContextResolver) Description(ctx context.Context) string](#searchContextResolver.Description)
        * [func (r *searchContextResolver) ID() graphql.ID](#searchContextResolver.ID)
        * [func (r *searchContextResolver) Name(ctx context.Context) string](#searchContextResolver.Name)
        * [func (r *searchContextResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)](#searchContextResolver.Namespace)
        * [func (r *searchContextResolver) Public(ctx context.Context) bool](#searchContextResolver.Public)
        * [func (r *searchContextResolver) Repositories(ctx context.Context) ([]*searchContextRepositoryRevisionsResolver, error)](#searchContextResolver.Repositories)
        * [func (r *searchContextResolver) Spec() string](#searchContextResolver.Spec)
        * [func (r *searchContextResolver) UpdatedAt(ctx context.Context) DateTime](#searchContextResolver.UpdatedAt)
        * [func (r *searchContextResolver) ViewerCanManage(ctx context.Context) bool](#searchContextResolver.ViewerCanManage)
    * [type searchContextSuggestionResolver struct](#searchContextSuggestionResolver)
        * [func (s searchContextSuggestionResolver) Key() suggestionKey](#searchContextSuggestionResolver.Key)
        * [func (s searchContextSuggestionResolver) Label() string](#searchContextSuggestionResolver.Label)
        * [func (s searchContextSuggestionResolver) Length() int](#searchContextSuggestionResolver.Length)
        * [func (s searchContextSuggestionResolver) Score() int](#searchContextSuggestionResolver.Score)
        * [func (s searchContextSuggestionResolver) ToSearchContext() (*searchContextResolver, bool)](#searchContextSuggestionResolver.ToSearchContext)
    * [type searchContextsOrderBy string](#searchContextsOrderBy)
    * [type searchFilterResolver struct](#searchFilterResolver)
        * [func (sf *searchFilterResolver) Count() int32](#searchFilterResolver.Count)
        * [func (sf *searchFilterResolver) Kind() string](#searchFilterResolver.Kind)
        * [func (sf *searchFilterResolver) Label() string](#searchFilterResolver.Label)
        * [func (sf *searchFilterResolver) LimitHit() bool](#searchFilterResolver.LimitHit)
        * [func (sf *searchFilterResolver) Value() string](#searchFilterResolver.Value)
    * [type searchFilterSuggestions struct](#searchFilterSuggestions)
        * [func (s *searchFilterSuggestions) Repo() []string](#searchFilterSuggestions.Repo)
        * [func (s *searchFilterSuggestions) Repogroup() []string](#searchFilterSuggestions.Repogroup)
    * [type searchQueryDescription struct](#searchQueryDescription)
        * [func (q searchQueryDescription) Description() *string](#searchQueryDescription.Description)
        * [func (q searchQueryDescription) Query() string](#searchQueryDescription.Query)
    * [type searchResolver struct](#searchResolver)
        * [func (r *searchResolver) Inputs() run.SearchInputs](#searchResolver.Inputs)
        * [func (r *searchResolver) Results(ctx context.Context) (*SearchResultsResolver, error)](#searchResolver.Results)
        * [func (r *searchResolver) Stats(ctx context.Context) (stats *searchResultsStats, err error)](#searchResolver.Stats)
        * [func (r *searchResolver) Suggestions(ctx context.Context, args *searchSuggestionsArgs) ([]SearchSuggestionResolver, error)](#searchResolver.Suggestions)
        * [func (r *searchResolver) countIsSet() bool](#searchResolver.countIsSet)
        * [func (r *searchResolver) determineRepos(ctx context.Context, tr *trace.Trace, start time.Time) (*searchrepos.Resolved, error)](#searchResolver.determineRepos)
        * [func (r *searchResolver) determineResultTypes(args search.TextParameters, forceTypes result.Types) result.Types](#searchResolver.determineResultTypes)
        * [func (r *searchResolver) doResults(ctx context.Context, forceResultTypes result.Types) (_ *SearchResults, err error)](#searchResolver.doResults)
        * [func (r *searchResolver) errorForNoResolvedRepos(ctx context.Context) *errNoResolvedRepos](#searchResolver.errorForNoResolvedRepos)
        * [func (r *searchResolver) errorForOverRepoLimit(ctx context.Context) *errOverRepoLimit](#searchResolver.errorForOverRepoLimit)
        * [func (r *searchResolver) evaluate(ctx context.Context, q query.Basic) (*SearchResults, error)](#searchResolver.evaluate)
        * [func (r *searchResolver) evaluateAnd(ctx context.Context, q query.Basic) (*SearchResults, error)](#searchResolver.evaluateAnd)
        * [func (r *searchResolver) evaluateLeaf(ctx context.Context) (_ *SearchResults, err error)](#searchResolver.evaluateLeaf)
        * [func (r *searchResolver) evaluateOr(ctx context.Context, q query.Basic) (*SearchResults, error)](#searchResolver.evaluateOr)
        * [func (r *searchResolver) evaluatePatternExpression(ctx context.Context, q query.Basic) (*SearchResults, error)](#searchResolver.evaluatePatternExpression)
        * [func (r *searchResolver) getExactFilePatterns() map[string]struct{}](#searchResolver.getExactFilePatterns)
        * [func (r *searchResolver) isGlobalSearch() bool](#searchResolver.isGlobalSearch)
        * [func (r *searchResolver) logBatch(ctx context.Context, srr *SearchResultsResolver, start time.Time, err error)](#searchResolver.logBatch)
        * [func (r *searchResolver) paginatedResults(ctx context.Context) (result *SearchResults, err error)](#searchResolver.paginatedResults)
        * [func (r *searchResolver) protocol() search.Protocol](#searchResolver.protocol)
        * [func (r *searchResolver) rawQuery() string](#searchResolver.rawQuery)
        * [func (r *searchResolver) reposExist(ctx context.Context, options searchrepos.Options) bool](#searchResolver.reposExist)
        * [func (r *searchResolver) resolveRepositories(ctx context.Context, opts resolveRepositoriesOpts) (resolved searchrepos.Resolved, err error)](#searchResolver.resolveRepositories)
        * [func (r *searchResolver) resultsBatch(ctx context.Context) (*SearchResultsResolver, error)](#searchResolver.resultsBatch)
        * [func (r *searchResolver) resultsRecursive(ctx context.Context, plan query.Plan) (sr *SearchResults, err error)](#searchResolver.resultsRecursive)
        * [func (r *searchResolver) resultsStreaming(ctx context.Context) (*SearchResultsResolver, error)](#searchResolver.resultsStreaming)
        * [func (r *searchResolver) resultsToResolver(results *SearchResults) *SearchResultsResolver](#searchResolver.resultsToResolver)
        * [func (r *searchResolver) resultsWithTimeoutSuggestion(ctx context.Context) (*SearchResults, error)](#searchResolver.resultsWithTimeoutSuggestion)
        * [func (r *searchResolver) searchTimeoutFieldSet() bool](#searchResolver.searchTimeoutFieldSet)
        * [func (r *searchResolver) setQuery(q []query.Node)](#searchResolver.setQuery)
        * [func (r *searchResolver) sortResults(results []result.Match)](#searchResolver.sortResults)
        * [func (r *searchResolver) suggestFilePaths(ctx context.Context, limit int) ([]SearchSuggestionResolver, error)](#searchResolver.suggestFilePaths)
        * [func (r *searchResolver) withTimeout(ctx context.Context) (context.Context, context.CancelFunc, error)](#searchResolver.withTimeout)
    * [type searchResultMatchResolver struct](#searchResultMatchResolver)
        * [func (m *searchResultMatchResolver) Body() Markdown](#searchResultMatchResolver.Body)
        * [func (m *searchResultMatchResolver) Highlights() []highlightedRangeResolver](#searchResultMatchResolver.Highlights)
        * [func (m *searchResultMatchResolver) URL() string](#searchResultMatchResolver.URL)
    * [type searchResultsStats struct](#searchResultsStats)
        * [func (srs *searchResultsStats) ApproximateResultCount() string](#searchResultsStats.ApproximateResultCount)
        * [func (srs *searchResultsStats) Languages(ctx context.Context) ([]*languageStatisticsResolver, error)](#searchResultsStats.Languages)
        * [func (srs *searchResultsStats) Sparkline() []int32](#searchResultsStats.Sparkline)
        * [func (srs *searchResultsStats) getResults(ctx context.Context) (*SearchResultsResolver, error)](#searchResultsStats.getResults)
    * [type searchSuggestionsArgs struct](#searchSuggestionsArgs)
        * [func (a *searchSuggestionsArgs) applyDefaultsAndConstraints()](#searchSuggestionsArgs.applyDefaultsAndConstraints)
    * [type sessionResolver struct](#sessionResolver)
        * [func (r *sessionResolver) CanSignOut() bool](#sessionResolver.CanSignOut)
    * [type settingsCascade struct](#settingsCascade)
        * [func (r *settingsCascade) Final(ctx context.Context) (string, error)](#settingsCascade.Final)
        * [func (r *settingsCascade) Merged(ctx context.Context) (_ *configurationResolver, err error)](#settingsCascade.Merged)
        * [func (r *settingsCascade) Subjects(ctx context.Context) ([]*settingsSubject, error)](#settingsCascade.Subjects)
    * [type settingsEdit struct](#settingsEdit)
    * [type settingsMutation struct](#settingsMutation)
        * [func (r *settingsMutation) EditConfiguration(ctx context.Context, args *struct {...](#settingsMutation.EditConfiguration)
        * [func (r *settingsMutation) EditSettings(ctx context.Context, args *struct {...](#settingsMutation.EditSettings)
        * [func (r *settingsMutation) OverwriteSettings(ctx context.Context, args *struct {...](#settingsMutation.OverwriteSettings)
        * [func (r *settingsMutation) doUpdateSettings(ctx context.Context, computeEdits func(oldSettings string) ([]jsonx.Edit, error)) (idAfterUpdate int32, err error)](#settingsMutation.doUpdateSettings)
        * [func (r *settingsMutation) editSettings(ctx context.Context, keyPath jsonx.Path, value interface{}, remove bool) (*updateSettingsPayload, error)](#settingsMutation.editSettings)
        * [func (r *settingsMutation) getCurrentSettings(ctx context.Context) (string, error)](#settingsMutation.getCurrentSettings)
    * [type settingsMutationGroupInput struct](#settingsMutationGroupInput)
    * [type settingsResolver struct](#settingsResolver)
        * [func (o *settingsResolver) Author(ctx context.Context) (*UserResolver, error)](#settingsResolver.Author)
        * [func (o *settingsResolver) Configuration() *configurationResolver](#settingsResolver.Configuration)
        * [func (o *settingsResolver) Contents() JSONCString](#settingsResolver.Contents)
        * [func (o *settingsResolver) CreatedAt() DateTime](#settingsResolver.CreatedAt)
        * [func (o *settingsResolver) ID() int32](#settingsResolver.ID)
        * [func (o *settingsResolver) Subject() *settingsSubject](#settingsResolver.Subject)
    * [type settingsSubject struct](#settingsSubject)
        * [func settingsSubjectForNode(ctx context.Context, n Node) (*settingsSubject, error)](#settingsSubjectForNode)
        * [func (s *settingsSubject) ConfigurationCascade() (*settingsCascade, error)](#settingsSubject.ConfigurationCascade)
        * [func (s *settingsSubject) ID() (graphql.ID, error)](#settingsSubject.ID)
        * [func (s *settingsSubject) LatestSettings(ctx context.Context) (*settingsResolver, error)](#settingsSubject.LatestSettings)
        * [func (s *settingsSubject) SettingsCascade() (*settingsCascade, error)](#settingsSubject.SettingsCascade)
        * [func (s *settingsSubject) SettingsURL() (*string, error)](#settingsSubject.SettingsURL)
        * [func (s *settingsSubject) ToDefaultSettings() (*defaultSettingsResolver, bool)](#settingsSubject.ToDefaultSettings)
        * [func (s *settingsSubject) ToOrg() (*OrgResolver, bool)](#settingsSubject.ToOrg)
        * [func (s *settingsSubject) ToSite() (*siteResolver, bool)](#settingsSubject.ToSite)
        * [func (s *settingsSubject) ToUser() (*UserResolver, bool)](#settingsSubject.ToUser)
        * [func (s *settingsSubject) ViewerCanAdminister(ctx context.Context) (bool, error)](#settingsSubject.ViewerCanAdminister)
        * [func (s *settingsSubject) readSettings(ctx context.Context, v interface{}) error](#settingsSubject.readSettings)
        * [func (s *settingsSubject) toSubject() api.SettingsSubject](#settingsSubject.toSubject)
    * [type showSearchSuggestionResolvers func() ([]github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.SearchSuggestionResolver, error)](#showSearchSuggestionResolvers)
    * [type signatureResolver struct](#signatureResolver)
        * [func toSignatureResolver(db dbutil.DB, sig *git.Signature, includeUserInfo bool) *signatureResolver](#toSignatureResolver)
        * [func (r signatureResolver) Date() string](#signatureResolver.Date)
        * [func (r signatureResolver) Person() *PersonResolver](#signatureResolver.Person)
    * [type siteConfigurationResolver struct](#siteConfigurationResolver)
        * [func (r *siteConfigurationResolver) EffectiveContents(ctx context.Context) (JSONCString, error)](#siteConfigurationResolver.EffectiveContents)
        * [func (r *siteConfigurationResolver) ID(ctx context.Context) (int32, error)](#siteConfigurationResolver.ID)
        * [func (r *siteConfigurationResolver) ValidationMessages(ctx context.Context) ([]string, error)](#siteConfigurationResolver.ValidationMessages)
    * [type siteMonitoringStatisticsResolver struct](#siteMonitoringStatisticsResolver)
        * [func (r *siteMonitoringStatisticsResolver) Alerts(ctx context.Context) ([]*MonitoringAlert, error)](#siteMonitoringStatisticsResolver.Alerts)
    * [type siteResolver struct](#siteResolver)
        * [func (r *siteResolver) AccessTokens(ctx context.Context, args *struct {...](#siteResolver.AccessTokens)
        * [func (r *siteResolver) Alerts(ctx context.Context) ([]*Alert, error)](#siteResolver.Alerts)
        * [func (r *siteResolver) AllowSiteSettingsEdits() bool](#siteResolver.AllowSiteSettingsEdits)
        * [func (r *siteResolver) AuthProviders(ctx context.Context) (*authProviderConnectionResolver, error)](#siteResolver.AuthProviders)
        * [func (r *siteResolver) BuildVersion() string](#siteResolver.BuildVersion)
        * [func (r *siteResolver) CanReloadSite(ctx context.Context) bool](#siteResolver.CanReloadSite)
        * [func (r *siteResolver) Configuration(ctx context.Context) (*siteConfigurationResolver, error)](#siteResolver.Configuration)
        * [func (r *siteResolver) ConfigurationCascade() *settingsCascade](#siteResolver.ConfigurationCascade)
        * [func (*siteResolver) DisableBuiltInSearches() bool](#siteResolver.DisableBuiltInSearches)
        * [func (r *siteResolver) ExternalAccounts(ctx context.Context, args *struct {...](#siteResolver.ExternalAccounts)
        * [func (r *siteResolver) FreeUsersExceeded(ctx context.Context) (bool, error)](#siteResolver.FreeUsersExceeded)
        * [func (r *siteResolver) HasCodeIntelligence() bool](#siteResolver.HasCodeIntelligence)
        * [func (r *siteResolver) ID() graphql.ID](#siteResolver.ID)
        * [func (r *siteResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)](#siteResolver.LatestSettings)
        * [func (r *siteResolver) MonitoringStatistics(ctx context.Context, args *struct {...](#siteResolver.MonitoringStatistics)
        * [func (r *siteResolver) NeedsRepositoryConfiguration(ctx context.Context) (bool, error)](#siteResolver.NeedsRepositoryConfiguration)
        * [func (r *siteResolver) ProductSubscription() *productSubscriptionStatus](#siteResolver.ProductSubscription)
        * [func (r *siteResolver) ProductVersion() string](#siteResolver.ProductVersion)
        * [func (*siteResolver) SendsEmailVerificationEmails() bool](#siteResolver.SendsEmailVerificationEmails)
        * [func (r *siteResolver) SettingsCascade() *settingsCascade](#siteResolver.SettingsCascade)
        * [func (r *siteResolver) SettingsURL() *string](#siteResolver.SettingsURL)
        * [func (r *siteResolver) SiteID() string](#siteResolver.SiteID)
        * [func (r *siteResolver) UpdateCheck(ctx context.Context) (*updateCheckResolver, error)](#siteResolver.UpdateCheck)
        * [func (r *siteResolver) UsageStatistics(ctx context.Context, args *struct {...](#siteResolver.UsageStatistics)
        * [func (r *siteResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#siteResolver.ViewerCanAdminister)
        * [func (r *siteResolver) settingsSubject() api.SettingsSubject](#siteResolver.settingsSubject)
    * [type siteUsagePeriodResolver struct](#siteUsagePeriodResolver)
        * [func (s *siteUsagePeriodResolver) AnonymousUserCount() int32](#siteUsagePeriodResolver.AnonymousUserCount)
        * [func (s *siteUsagePeriodResolver) IntegrationUserCount() int32](#siteUsagePeriodResolver.IntegrationUserCount)
        * [func (s *siteUsagePeriodResolver) RegisteredUserCount() int32](#siteUsagePeriodResolver.RegisteredUserCount)
        * [func (s *siteUsagePeriodResolver) StartTime() string](#siteUsagePeriodResolver.StartTime)
        * [func (s *siteUsagePeriodResolver) UserCount() int32](#siteUsagePeriodResolver.UserCount)
    * [type siteUsageStatisticsResolver struct](#siteUsageStatisticsResolver)
        * [func (s *siteUsageStatisticsResolver) DAUs() []*siteUsagePeriodResolver](#siteUsageStatisticsResolver.DAUs)
        * [func (s *siteUsageStatisticsResolver) MAUs() []*siteUsagePeriodResolver](#siteUsageStatisticsResolver.MAUs)
        * [func (s *siteUsageStatisticsResolver) WAUs() []*siteUsagePeriodResolver](#siteUsageStatisticsResolver.WAUs)
        * [func (s *siteUsageStatisticsResolver) activities(periods []*types.SiteActivityPeriod) []*siteUsagePeriodResolver](#siteUsageStatisticsResolver.activities)
    * [type slicedSearchResults struct](#slicedSearchResults)
        * [func sliceSearchResults(results []result.Match, common *streaming.Stats, offset, limit int) (final slicedSearchResults)](#sliceSearchResults)
    * [type staticUserConnectionResolver struct](#staticUserConnectionResolver)
        * [func (r *staticUserConnectionResolver) Nodes() []*UserResolver](#staticUserConnectionResolver.Nodes)
        * [func (r *staticUserConnectionResolver) PageInfo() *graphqlutil.PageInfo](#staticUserConnectionResolver.PageInfo)
        * [func (r *staticUserConnectionResolver) TotalCount() int32](#staticUserConnectionResolver.TotalCount)
    * [type statusMessageResolver struct](#statusMessageResolver)
        * [func (r *statusMessageResolver) ExternalService(ctx context.Context) (*externalServiceResolver, error)](#statusMessageResolver.ExternalService)
        * [func (r *statusMessageResolver) Message() (string, error)](#statusMessageResolver.Message)
        * [func (r *statusMessageResolver) ToCloningProgress() (*statusMessageResolver, bool)](#statusMessageResolver.ToCloningProgress)
        * [func (r *statusMessageResolver) ToExternalServiceSyncError() (*statusMessageResolver, bool)](#statusMessageResolver.ToExternalServiceSyncError)
        * [func (r *statusMessageResolver) ToIndexingProgress() (*statusMessageResolver, bool)](#statusMessageResolver.ToIndexingProgress)
        * [func (r *statusMessageResolver) ToSyncError() (*statusMessageResolver, bool)](#statusMessageResolver.ToSyncError)
    * [type suggestionKey struct](#suggestionKey)
    * [type surveyResponseConnectionResolver struct](#surveyResponseConnectionResolver)
        * [func (r *surveyResponseConnectionResolver) AverageScore(ctx context.Context) (float64, error)](#surveyResponseConnectionResolver.AverageScore)
        * [func (r *surveyResponseConnectionResolver) Last30DaysCount(ctx context.Context) (int32, error)](#surveyResponseConnectionResolver.Last30DaysCount)
        * [func (r *surveyResponseConnectionResolver) NetPromoterScore(ctx context.Context) (int32, error)](#surveyResponseConnectionResolver.NetPromoterScore)
        * [func (r *surveyResponseConnectionResolver) Nodes(ctx context.Context) ([]*surveyResponseResolver, error)](#surveyResponseConnectionResolver.Nodes)
        * [func (r *surveyResponseConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#surveyResponseConnectionResolver.TotalCount)
    * [type surveyResponseResolver struct](#surveyResponseResolver)
        * [func (s *surveyResponseResolver) Better() *string](#surveyResponseResolver.Better)
        * [func (s *surveyResponseResolver) CreatedAt() DateTime](#surveyResponseResolver.CreatedAt)
        * [func (s *surveyResponseResolver) Email() *string](#surveyResponseResolver.Email)
        * [func (s *surveyResponseResolver) ID() graphql.ID](#surveyResponseResolver.ID)
        * [func (s *surveyResponseResolver) Reason() *string](#surveyResponseResolver.Reason)
        * [func (s *surveyResponseResolver) Score() int32](#surveyResponseResolver.Score)
        * [func (s *surveyResponseResolver) User(ctx context.Context) (*UserResolver, error)](#surveyResponseResolver.User)
    * [type surveySubmissionForHubSpot struct](#surveySubmissionForHubSpot)
    * [type symbolConnectionResolver struct](#symbolConnectionResolver)
        * [func (r *symbolConnectionResolver) Nodes(ctx context.Context) ([]symbolResolver, error)](#symbolConnectionResolver.Nodes)
        * [func (r *symbolConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#symbolConnectionResolver.PageInfo)
    * [type symbolResolver struct](#symbolResolver)
        * [func toSymbolResolver(db dbutil.DB, commit *GitCommitResolver, sr *result.SymbolMatch) symbolResolver](#toSymbolResolver)
        * [func (r symbolResolver) CanonicalURL() string](#symbolResolver.CanonicalURL)
        * [func (r symbolResolver) ContainerName() *string](#symbolResolver.ContainerName)
        * [func (r symbolResolver) FileLocal() bool](#symbolResolver.FileLocal)
        * [func (r symbolResolver) Kind() string](#symbolResolver.Kind)
        * [func (r symbolResolver) Language() string](#symbolResolver.Language)
        * [func (r symbolResolver) Location() *locationResolver](#symbolResolver.Location)
        * [func (r symbolResolver) Name() string](#symbolResolver.Name)
        * [func (r symbolResolver) URL(ctx context.Context) (string, error)](#symbolResolver.URL)
    * [type symbolSuggestionResolver struct](#symbolSuggestionResolver)
        * [func (s symbolSuggestionResolver) Key() suggestionKey](#symbolSuggestionResolver.Key)
        * [func (s symbolSuggestionResolver) Label() string](#symbolSuggestionResolver.Label)
        * [func (s symbolSuggestionResolver) Length() int](#symbolSuggestionResolver.Length)
        * [func (s symbolSuggestionResolver) Score() int](#symbolSuggestionResolver.Score)
        * [func (s symbolSuggestionResolver) ToSymbol() (*symbolResolver, bool)](#symbolSuggestionResolver.ToSymbol)
    * [type symbolsArgs struct](#symbolsArgs)
    * [type trialRequestForHubSpot struct](#trialRequestForHubSpot)
    * [type updateCheckResolver struct](#updateCheckResolver)
        * [func (r *updateCheckResolver) CheckedAt() *DateTime](#updateCheckResolver.CheckedAt)
        * [func (r *updateCheckResolver) ErrorMessage() *string](#updateCheckResolver.ErrorMessage)
        * [func (r *updateCheckResolver) Pending() bool](#updateCheckResolver.Pending)
        * [func (r *updateCheckResolver) UpdateVersionAvailable() *string](#updateCheckResolver.UpdateVersionAvailable)
    * [type updateExternalServiceArgs struct](#updateExternalServiceArgs)
    * [type updateExternalServiceInput struct](#updateExternalServiceInput)
    * [type updateQueueResolver struct](#updateQueueResolver)
        * [func (r *updateQueueResolver) Index() int32](#updateQueueResolver.Index)
        * [func (r *updateQueueResolver) Total() int32](#updateQueueResolver.Total)
        * [func (r *updateQueueResolver) Updating() bool](#updateQueueResolver.Updating)
    * [type updateScheduleResolver struct](#updateScheduleResolver)
        * [func (r *updateScheduleResolver) Due() DateTime](#updateScheduleResolver.Due)
        * [func (r *updateScheduleResolver) Index() int32](#updateScheduleResolver.Index)
        * [func (r *updateScheduleResolver) IntervalSeconds() int32](#updateScheduleResolver.IntervalSeconds)
        * [func (r *updateScheduleResolver) Total() int32](#updateScheduleResolver.Total)
    * [type updateSearchContextArgs struct](#updateSearchContextArgs)
    * [type updateSettingsPayload struct{}](#updateSettingsPayload)
        * [func (updateSettingsPayload) Empty() *EmptyResponse](#updateSettingsPayload.Empty)
    * [type updateUserArgs struct](#updateUserArgs)
    * [type userConnectionResolver struct](#userConnectionResolver)
        * [func (r *userConnectionResolver) Nodes(ctx context.Context) ([]*UserResolver, error)](#userConnectionResolver.Nodes)
        * [func (r *userConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#userConnectionResolver.PageInfo)
        * [func (r *userConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#userConnectionResolver.TotalCount)
        * [func (r *userConnectionResolver) compute(ctx context.Context) ([]*types.User, int, error)](#userConnectionResolver.compute)
        * [func (r *userConnectionResolver) useCache() bool](#userConnectionResolver.useCache)
    * [type userEmailResolver struct](#userEmailResolver)
        * [func (r *userEmailResolver) Email() string](#userEmailResolver.Email)
        * [func (r *userEmailResolver) IsPrimary(ctx context.Context) (bool, error)](#userEmailResolver.IsPrimary)
        * [func (r *userEmailResolver) User() *UserResolver](#userEmailResolver.User)
        * [func (r *userEmailResolver) VerificationPending() bool](#userEmailResolver.VerificationPending)
        * [func (r *userEmailResolver) Verified() bool](#userEmailResolver.Verified)
        * [func (r *userEmailResolver) ViewerCanManuallyVerify(ctx context.Context) (bool, error)](#userEmailResolver.ViewerCanManuallyVerify)
    * [type userEventLogResolver struct](#userEventLogResolver)
        * [func (s *userEventLogResolver) AnonymousUserID() string](#userEventLogResolver.AnonymousUserID)
        * [func (s *userEventLogResolver) Argument() *string](#userEventLogResolver.Argument)
        * [func (s *userEventLogResolver) Name() string](#userEventLogResolver.Name)
        * [func (s *userEventLogResolver) Source() string](#userEventLogResolver.Source)
        * [func (s *userEventLogResolver) Timestamp() DateTime](#userEventLogResolver.Timestamp)
        * [func (s *userEventLogResolver) URL() string](#userEventLogResolver.URL)
        * [func (s *userEventLogResolver) User(ctx context.Context) (*UserResolver, error)](#userEventLogResolver.User)
        * [func (s *userEventLogResolver) Version() string](#userEventLogResolver.Version)
    * [type userEventLogsConnectionResolver struct](#userEventLogsConnectionResolver)
        * [func (r *userEventLogsConnectionResolver) Nodes(ctx context.Context) ([]*userEventLogResolver, error)](#userEventLogsConnectionResolver.Nodes)
        * [func (r *userEventLogsConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#userEventLogsConnectionResolver.PageInfo)
        * [func (r *userEventLogsConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#userEventLogsConnectionResolver.TotalCount)
    * [type userUsageStatisticsResolver struct](#userUsageStatisticsResolver)
        * [func (s *userUsageStatisticsResolver) CodeIntelligenceActions() int32](#userUsageStatisticsResolver.CodeIntelligenceActions)
        * [func (s *userUsageStatisticsResolver) FindReferencesActions() int32](#userUsageStatisticsResolver.FindReferencesActions)
        * [func (s *userUsageStatisticsResolver) LastActiveCodeHostIntegrationTime() *string](#userUsageStatisticsResolver.LastActiveCodeHostIntegrationTime)
        * [func (s *userUsageStatisticsResolver) LastActiveTime() *string](#userUsageStatisticsResolver.LastActiveTime)
        * [func (s *userUsageStatisticsResolver) PageViews() int32](#userUsageStatisticsResolver.PageViews)
        * [func (s *userUsageStatisticsResolver) SearchQueries() int32](#userUsageStatisticsResolver.SearchQueries)
    * [type versionContextResolver struct](#versionContextResolver)
        * [func NewVersionContextResolver(vc *schema.VersionContext) *versionContextResolver](#NewVersionContextResolver)
        * [func (v *versionContextResolver) Description() string](#versionContextResolver.Description)
        * [func (v *versionContextResolver) Name() string](#versionContextResolver.Name)
    * [type virtualFileResolver struct](#virtualFileResolver)
        * [func NewVirtualFileResolver(stat fs.FileInfo, fileContent FileContentFunc) *virtualFileResolver](#NewVirtualFileResolver)
        * [func (r *virtualFileResolver) Binary(ctx context.Context) (bool, error)](#virtualFileResolver.Binary)
        * [func (r *virtualFileResolver) ByteSize(ctx context.Context) (int32, error)](#virtualFileResolver.ByteSize)
        * [func (r *virtualFileResolver) CanonicalURL() string](#virtualFileResolver.CanonicalURL)
        * [func (r *virtualFileResolver) Content(ctx context.Context) (string, error)](#virtualFileResolver.Content)
        * [func (r *virtualFileResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)](#virtualFileResolver.ExternalURLs)
        * [func (r *virtualFileResolver) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)](#virtualFileResolver.Highlight)
        * [func (r *virtualFileResolver) IsDirectory() bool](#virtualFileResolver.IsDirectory)
        * [func (r *virtualFileResolver) Name() string](#virtualFileResolver.Name)
        * [func (r *virtualFileResolver) Path() string](#virtualFileResolver.Path)
        * [func (r *virtualFileResolver) RichHTML(ctx context.Context) (string, error)](#virtualFileResolver.RichHTML)
        * [func (r *virtualFileResolver) ToGitBlob() (*GitTreeEntryResolver, bool)](#virtualFileResolver.ToGitBlob)
        * [func (r *virtualFileResolver) ToVirtualFile() (*virtualFileResolver, bool)](#virtualFileResolver.ToVirtualFile)
        * [func (r *virtualFileResolver) URL(ctx context.Context) (string, error)](#virtualFileResolver.URL)
* [Functions](#func)
    * [func BenchmarkIntegrationSearchResults(b *testing.B)](#BenchmarkIntegrationSearchResults)
    * [func BenchmarkPrometheusFieldName(b *testing.B)](#BenchmarkPrometheusFieldName)
    * [func BenchmarkSearchResults(b *testing.B)](#BenchmarkSearchResults)
    * [func CreateFileInfo(path string, isDir bool) fs.FileInfo](#CreateFileInfo)
    * [func DetermineStatusForLogs(srr *SearchResultsResolver, err error) string](#DetermineStatusForLogs)
    * [func LogSearchLatency(ctx context.Context, db dbutil.DB, si *run.SearchInputs, durationMs int32)](#LogSearchLatency)
    * [func MarshalOrgID(id int32) graphql.ID](#MarshalOrgID)
    * [func MarshalOutOfBandMigrationID(id int32) graphql.ID](#MarshalOutOfBandMigrationID)
    * [func MarshalRepositoryID(repo api.RepoID) graphql.ID](#MarshalRepositoryID)
    * [func MarshalUserID(id int32) graphql.ID](#MarshalUserID)
    * [func NewSchema(db dbutil.DB, batchChanges BatchChangesResolver, codeIntel CodeIntelResolver, insights InsightsResolver, authz AuthzResolver, codeMonitors CodeMonitorsResolver, license LicenseResolver, dotcom DotcomRootResolver) (*graphql.Schema, error)](#NewSchema)
    * [func RunTest(t *testing.T, test *Test)](#RunTest)
    * [func RunTests(t *testing.T, tests []*Test)](#RunTests)
    * [func SiteGQLID() graphql.ID](#SiteGQLID)
    * [func TestAddExternalService(t *testing.T)](#TestAddExternalService)
    * [func TestAddQueryRegexpField(t *testing.T)](#TestAddQueryRegexpField)
    * [func TestAffiliatedRepositories(t *testing.T)](#TestAffiliatedRepositories)
    * [func TestAlertForDiffCommitSearchLimits(t *testing.T)](#TestAlertForDiffCommitSearchLimits)
    * [func TestAlertForNoResolvedReposWithNonGlobalSearchContext(t *testing.T)](#TestAlertForNoResolvedReposWithNonGlobalSearchContext)
    * [func TestAlertForOverRepoLimit(t *testing.T)](#TestAlertForOverRepoLimit)
    * [func TestApplyPatch(t *testing.T)](#TestApplyPatch)
    * [func TestAutoDefinedSearchContexts(t *testing.T)](#TestAutoDefinedSearchContexts)
    * [func TestBasicLimiter(t *testing.T)](#TestBasicLimiter)
    * [func TestBasicLimiterEnabled(t *testing.T)](#TestBasicLimiterEnabled)
    * [func TestCapFirst(t *testing.T)](#TestCapFirst)
    * [func TestCheckMirrorRepositoryConnection(t *testing.T)](#TestCheckMirrorRepositoryConnection)
    * [func TestCheckMirrorRepositoryRemoteURL(t *testing.T)](#TestCheckMirrorRepositoryRemoteURL)
    * [func TestCompareSearchResults(t *testing.T)](#TestCompareSearchResults)
    * [func TestCreateSavedSearch(t *testing.T)](#TestCreateSavedSearch)
    * [func TestCreateUser(t *testing.T)](#TestCreateUser)
    * [func TestDateTime(t *testing.T)](#TestDateTime)
    * [func TestDeleteExternalService(t *testing.T)](#TestDeleteExternalService)
    * [func TestDeleteSavedSearch(t *testing.T)](#TestDeleteSavedSearch)
    * [func TestDeleteUser(t *testing.T)](#TestDeleteUser)
    * [func TestDetectSearchType(t *testing.T)](#TestDetectSearchType)
    * [func TestDiffHunk(t *testing.T)](#TestDiffHunk)
    * [func TestDiffHunk2(t *testing.T)](#TestDiffHunk2)
    * [func TestErrorToAlertStructuralSearch(t *testing.T)](#TestErrorToAlertStructuralSearch)
    * [func TestEscapePathForURL(t *testing.T)](#TestEscapePathForURL)
    * [func TestEstimateQueryCost(t *testing.T)](#TestEstimateQueryCost)
    * [func TestEvaluateAnd(t *testing.T)](#TestEvaluateAnd)
    * [func TestExactlyOneRepo(t *testing.T)](#TestExactlyOneRepo)
    * [func TestExternalAccountResolver_AccountData(t *testing.T)](#TestExternalAccountResolver_AccountData)
    * [func TestExternalServices(t *testing.T)](#TestExternalServices)
    * [func TestExternalServices_PageInfo(t *testing.T)](#TestExternalServices_PageInfo)
    * [func TestFileDiffHighlighter(t *testing.T)](#TestFileDiffHighlighter)
    * [func TestGetExactFilePatterns(t *testing.T)](#TestGetExactFilePatterns)
    * [func TestGetRepos(t *testing.T)](#TestGetRepos)
    * [func TestGetReposWrongUnderlyingType(t *testing.T)](#TestGetReposWrongUnderlyingType)
    * [func TestGitCommitFileNames(t *testing.T)](#TestGitCommitFileNames)
    * [func TestGitCommitResolver(t *testing.T)](#TestGitCommitResolver)
    * [func TestGitTree(t *testing.T)](#TestGitTree)
    * [func TestGitTreeEntry_Content(t *testing.T)](#TestGitTreeEntry_Content)
    * [func TestGitTreeEntry_RawZipArchiveURL(t *testing.T)](#TestGitTreeEntry_RawZipArchiveURL)
    * [func TestIsBinary(t *testing.T)](#TestIsBinary)
    * [func TestIsGlobalSearch(t *testing.T)](#TestIsGlobalSearch)
    * [func TestLonger(t *testing.T)](#TestLonger)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestMarshalRepositoryCursor(t *testing.T)](#TestMarshalRepositoryCursor)
    * [func TestMergeSettings(t *testing.T)](#TestMergeSettings)
    * [func TestMutation_CreateAccessToken(t *testing.T)](#TestMutation_CreateAccessToken)
    * [func TestMutation_DeleteAccessToken(t *testing.T)](#TestMutation_DeleteAccessToken)
    * [func TestNamespace(t *testing.T)](#TestNamespace)
    * [func TestNamespaceByName(t *testing.T)](#TestNamespaceByName)
    * [func TestNode_Org(t *testing.T)](#TestNode_Org)
    * [func TestNode_User(t *testing.T)](#TestNode_User)
    * [func TestObservabilityActiveAlertsAlert(t *testing.T)](#TestObservabilityActiveAlertsAlert)
    * [func TestOrganization(t *testing.T)](#TestOrganization)
    * [func TestOrgs(t *testing.T)](#TestOrgs)
    * [func TestPreviewRepositoryComparisonResolver(t *testing.T)](#TestPreviewRepositoryComparisonResolver)
    * [func TestQuoteSuggestions(t *testing.T)](#TestQuoteSuggestions)
    * [func TestRatelimitFromConfig(t *testing.T)](#TestRatelimitFromConfig)
    * [func TestRepositories(t *testing.T)](#TestRepositories)
    * [func TestRepositories_CursorPagination(t *testing.T)](#TestRepositories_CursorPagination)
    * [func TestRepository(t *testing.T)](#TestRepository)
    * [func TestRepositoryComparison(t *testing.T)](#TestRepositoryComparison)
    * [func TestRepositoryHydration(t *testing.T)](#TestRepositoryHydration)
    * [func TestRepositoryLabel(t *testing.T)](#TestRepositoryLabel)
    * [func TestRepository_Commit(t *testing.T)](#TestRepository_Commit)
    * [func TestRepository_DefaultBranch(t *testing.T)](#TestRepository_DefaultBranch)
    * [func TestResendUserEmailVerification(t *testing.T)](#TestResendUserEmailVerification)
    * [func TestResolverTo(t *testing.T)](#TestResolverTo)
    * [func TestRetrievingAndDeduplicatingIndexedRefs(t *testing.T)](#TestRetrievingAndDeduplicatingIndexedRefs)
    * [func TestSavedSearchByIDNonOwner(t *testing.T)](#TestSavedSearchByIDNonOwner)
    * [func TestSavedSearchByIDOwner(t *testing.T)](#TestSavedSearchByIDOwner)
    * [func TestSavedSearches(t *testing.T)](#TestSavedSearches)
    * [func TestSearch(t *testing.T)](#TestSearch)
    * [func TestSearchContext(t *testing.T)](#TestSearchContext)
    * [func TestSearchContexts(t *testing.T)](#TestSearchContexts)
    * [func TestSearchFilterSuggestions(t *testing.T)](#TestSearchFilterSuggestions)
    * [func TestSearchPagination_cloning_missing(t *testing.T)](#TestSearchPagination_cloning_missing)
    * [func TestSearchPagination_issue_6287(t *testing.T)](#TestSearchPagination_issue_6287)
    * [func TestSearchPagination_repoPaginationPlan(t *testing.T)](#TestSearchPagination_repoPaginationPlan)
    * [func TestSearchPagination_sliceSearchResults(t *testing.T)](#TestSearchPagination_sliceSearchResults)
    * [func TestSearchPagination_unmarshalSearchCursor(t *testing.T)](#TestSearchPagination_unmarshalSearchCursor)
    * [func TestSearchPatternForSuggestion(t *testing.T)](#TestSearchPatternForSuggestion)
    * [func TestSearchResolver_DynamicFilters(t *testing.T)](#TestSearchResolver_DynamicFilters)
    * [func TestSearchResults(t *testing.T)](#TestSearchResults)
    * [func TestSearchResultsHydration(t *testing.T)](#TestSearchResultsHydration)
    * [func TestSearchResultsStatsLanguages(t *testing.T)](#TestSearchResultsStatsLanguages)
    * [func TestSearchSuggestions(t *testing.T)](#TestSearchSuggestions)
    * [func TestSetExternalServiceRepos(t *testing.T)](#TestSetExternalServiceRepos)
    * [func TestSetUserEmailVerified(t *testing.T)](#TestSetUserEmailVerified)
    * [func TestSettingsMutation_EditSettings(t *testing.T)](#TestSettingsMutation_EditSettings)
    * [func TestSettingsMutation_OverwriteSettings(t *testing.T)](#TestSettingsMutation_OverwriteSettings)
    * [func TestStatusMessages(t *testing.T)](#TestStatusMessages)
    * [func TestStripPassword(t *testing.T)](#TestStripPassword)
    * [func TestSubjects(t *testing.T)](#TestSubjects)
    * [func TestSyncExternalService_ContextTimeout(t *testing.T)](#TestSyncExternalService_ContextTimeout)
    * [func TestUnionMerge(t *testing.T)](#TestUnionMerge)
    * [func TestUnmarshalRepositoryCursor(t *testing.T)](#TestUnmarshalRepositoryCursor)
    * [func TestUpdateExternalService(t *testing.T)](#TestUpdateExternalService)
    * [func TestUpdateSavedSearch(t *testing.T)](#TestUpdateSavedSearch)
    * [func TestUpdateUser(t *testing.T)](#TestUpdateUser)
    * [func TestUser(t *testing.T)](#TestUser)
    * [func TestUser_UsageStatistics(t *testing.T)](#TestUser_UsageStatistics)
    * [func TestUsers(t *testing.T)](#TestUsers)
    * [func TestVersionContext(t *testing.T)](#TestVersionContext)
    * [func TestVirtualFile(t *testing.T)](#TestVirtualFile)
    * [func TestZeroElapsedMilliseconds(t *testing.T)](#TestZeroElapsedMilliseconds)
    * [func Test_SearchResultsResolver_ApproximateResultCount(t *testing.T)](#Test_SearchResultsResolver_ApproximateResultCount)
    * [func Test_determineOutOfDateAlert(t *testing.T)](#Test_determineOutOfDateAlert)
    * [func UnmarshalNamespaceID(id graphql.ID, userID *int32, orgID *int32) (err error)](#UnmarshalNamespaceID)
    * [func UnmarshalOrgID(id graphql.ID) (orgID int32, err error)](#UnmarshalOrgID)
    * [func UnmarshalOutOfBandMigrationID(id graphql.ID) (migrationID int32, err error)](#UnmarshalOutOfBandMigrationID)
    * [func UnmarshalRepositoryID(id graphql.ID) (repo api.RepoID, err error)](#UnmarshalRepositoryID)
    * [func UnmarshalUserID(id graphql.ID) (userID int32, err error)](#UnmarshalUserID)
    * [func allEmptyStrings(ss1, ss2 []string) bool](#allEmptyStrings)
    * [func allowPrivate(ctx context.Context, db dbutil.DB, userID int32) (bool, error)](#allowPrivate)
    * [func applyPatch(fileContent string, fileDiff *diff.FileDiff) string](#applyPatch)
    * [func assertEqual(t *testing.T, got, want interface{})](#assertEqual)
    * [func assertRepoResolverHydrated(ctx context.Context, t *testing.T, r *RepositoryResolver, hydrated *types.Repo)](#assertRepoResolverHydrated)
    * [func canUpdateSiteConfiguration() bool](#canUpdateSiteConfiguration)
    * [func capFirst(s string) string](#capFirst)
    * [func checkErrors(t *testing.T, want, got []*errors.QueryError)](#checkErrors)
    * [func checkExternalServiceAccess(ctx context.Context, db dbutil.DB, namespaceUserID int32) error](#checkExternalServiceAccess)
    * [func clamp(x, min, max int) int](#clamp)
    * [func cloneURLToRepoName(ctx context.Context, cloneURL string) (string, error)](#cloneURLToRepoName)
    * [func commitResult(repo, commit string) *result.CommitMatch](#commitResult)
    * [func compareDates(left, right *time.Time) bool](#compareDates)
    * [func compareFileLengths(left, right string, exactFilePatterns map[string]struct{}) bool](#compareFileLengths)
    * [func compareSearchResults(left, right result.Match, exactFilePatterns map[string]struct{}) bool](#compareSearchResults)
    * [func decodedViewerFinalSettings(ctx context.Context, db dbutil.DB) (_ *schema.Settings, err error)](#decodedViewerFinalSettings)
    * [func defaultSettings(db dbutil.DB) map[string]interface{}](#defaultSettings)
    * [func deprecationAlert(args AlertFuncArgs) []*Alert](#deprecationAlert)
    * [func detectSearchType(version string, patternType *string) (query.SearchType, error)](#detectSearchType)
    * [func diffPathOrNull(path string) *string](#diffPathOrNull)
    * [func diffResult(repo, commit string) *result.CommitMatch](#diffResult)
    * [func escapePathForURL(path string) string](#escapePathForURL)
    * [func evaluatedFlagsToResolvers(input map[string]bool) []*EvaluatedFeatureFlagResolver](#evaluatedFlagsToResolvers)
    * [func exportPrometheusSearchLatencies(event string, payload json.RawMessage) error](#exportPrometheusSearchLatencies)
    * [func extractInt(i interface{}) (int, error)](#extractInt)
    * [func fileDiffConnectionCompute(patch string) func(ctx context.Context, args *FileDiffsConnectionArgs) ([]*diff.FileDiff, int32, bool, error)](#fileDiffConnectionCompute)
    * [func fileMatchesToMatches(fms []*result.FileMatch) []result.Match](#fileMatchesToMatches)
    * [func fileResult(repo string, lineMatches []*result.LineMatch, symbolMatches []*result.SymbolMatch) *result.FileMatch](#fileResult)
    * [func flagsToResolvers(db dbutil.DB, flags []*featureflag.FeatureFlag) []*FeatureFlagResolver](#flagsToResolvers)
    * [func formatJSON(data []byte) ([]byte, error)](#formatJSON)
    * [func generateRepos(count int) ([]*types.Repo, []*types.Repo, []*zoekt.RepoListEntry)](#generateRepos)
    * [func generateZoektMatches(count int) []zoekt.FileMatch](#generateZoektMatches)
    * [func getBoolPtr(b *bool, def bool) bool](#getBoolPtr)
    * [func getDefaultBranchForRepo(ctx context.Context, repoName api.RepoName) (string, error)](#getDefaultBranchForRepo)
    * [func getFragmentDependencies(node ast.Node) map[string]struct{}](#getFragmentDependencies)
    * [func getRepo(ctx context.Context, repoStore *database.RepoStore, repoURI string) (repo *types.Repo, err error)](#getRepo)
    * [func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)](#getRepos)
    * [func getUserToInviteToOrganization(ctx context.Context, db dbutil.DB, username string, orgID int32) (userToInvite *types.User, userEmailAddress string, err error)](#getUserToInviteToOrganization)
    * [func gitRefDisplayName(ref string) string](#gitRefDisplayName)
    * [func gitRefPrefix(ref string) string](#gitRefPrefix)
    * [func gitRefType(ref string) string](#gitRefType)
    * [func hydrateBranchCommits(ctx context.Context, repo api.RepoName, interactive bool, branches []*git.Branch) (ok bool, err error)](#hydrateBranchCommits)
    * [func init()](#init.db_test.go)
    * [func init()](#init.site_alerts.go)
    * [func invalidateRepoCache(plan query.Plan) bool](#invalidateRepoCache)
    * [func isContextError(ctx context.Context, err error) bool](#isContextError)
    * [func isMinorUpdateAvailable(currentVersion, updateVersion string) bool](#isMinorUpdateAvailable)
    * [func jsonDeepEqual(a, b string) bool](#jsonDeepEqual)
    * [func limitOrDefault(first *int32) int](#limitOrDefault)
    * [func logHoneyBatch(ctx context.Context, status, alertType, requestSource, requestName string, elapsed time.Duration, query string, start time.Time, srr *SearchResultsResolver)](#logHoneyBatch)
    * [func logPrometheusBatch(status, alertType, requestSource, requestName string, elapsed time.Duration)](#logPrometheusBatch)
    * [func longer(n int, dt time.Duration) time.Duration](#longer)
    * [func makePhabClientForOrigin(ctx context.Context, db dbutil.DB, origin string) (*phabricator.Client, error)](#makePhabClientForOrigin)
    * [func marshalAccessTokenID(id int64) graphql.ID](#marshalAccessTokenID)
    * [func marshalDefaultSettingsGQLID(defaultSettingsID string) graphql.ID](#marshalDefaultSettingsGQLID)
    * [func marshalExternalAccountID(repo int32) graphql.ID](#marshalExternalAccountID)
    * [func marshalExternalServiceID(id int64) graphql.ID](#marshalExternalServiceID)
    * [func marshalGitCommitID(repo graphql.ID, commitID GitObjectID) graphql.ID](#marshalGitCommitID)
    * [func marshalGitRefID(repo graphql.ID, rev string) graphql.ID](#marshalGitRefID)
    * [func marshalOrgInvitationID(id int64) graphql.ID](#marshalOrgInvitationID)
    * [func marshalOverrideID(spec overrideSpec) graphql.ID](#marshalOverrideID)
    * [func marshalRepositoryCursor(cursor *repositoryCursor) string](#marshalRepositoryCursor)
    * [func marshalSavedSearchID(savedSearchID int32) graphql.ID](#marshalSavedSearchID)
    * [func marshalSearchContextCursor(cursor int32) string](#marshalSearchContextCursor)
    * [func marshalSearchContextID(searchContextSpec string) graphql.ID](#marshalSearchContextID)
    * [func marshalSearchCursor(c *run.SearchCursor) string](#marshalSearchCursor)
    * [func marshalSiteGQLID(siteID string) graphql.ID](#marshalSiteGQLID)
    * [func marshalSurveyResponseID(id int32) graphql.ID](#marshalSurveyResponseID)
    * [func matchesToResolvers(db dbutil.DB, matches []result.Match) []SearchResultResolver](#matchesToResolvers)
    * [func mergeSettings(jsonSettingsStrings []string) ([]byte, error)](#mergeSettings)
    * [func mergeSettingsValues(dst map[string]interface{}, field string, value interface{}, depth int)](#mergeSettingsValues)
    * [func mkFileMatch(repo types.RepoName, path string, lineNumbers ...int32) *result.FileMatch](#mkFileMatch)
    * [func mockBackendCommits(t *testing.T, revs ...api.CommitID)](#mockBackendCommits)
    * [func mustParseGraphQLSchema(t *testing.T) *graphql.Schema](#mustParseGraphQLSchema)
    * [func needsRepositoryConfiguration(ctx context.Context, db dbutil.DB) (bool, error)](#needsRepositoryConfiguration)
    * [func newHoneyEvent(ctx context.Context, status, alertType, requestSource, requestName, query string, elapsed time.Duration, srr *SearchResultsResolver) *libhoney.Event](#newHoneyEvent)
    * [func observabilityActiveAlertsAlert(prom srcprometheus.Client) func(AlertFuncArgs) []*Alert](#observabilityActiveAlertsAlert)
    * [func orgInvitationURL(org *types.Org) *url.URL](#orgInvitationURL)
    * [func outOfDateAlert(args AlertFuncArgs) []*Alert](#outOfDateAlert)
    * [func overrideSearchType(input string, searchType query.SearchType) query.SearchType](#overrideSearchType)
    * [func overridesToResolvers(db dbutil.DB, input []*featureflag.Override) []*FeatureFlagOverrideResolver](#overridesToResolvers)
    * [func paginatedSearchFilesInRepos(ctx context.Context, db dbutil.DB, args *search.TextParameters, pagination *run.SearchPaginationInfo) (*run.SearchCursor, []result.Match, *streaming.Stats, error)](#paginatedSearchFilesInRepos)
    * [func pathParentsByFrequency(paths []string) []string](#pathParentsByFrequency)
    * [func pluralize(v int, singular, plural string) string](#pluralize)
    * [func processPaginationRequest(args *SearchArgs, q query.Q) (*run.SearchPaginationInfo, error)](#processPaginationRequest)
    * [func prometheusFieldName(typeName, fieldName string) string](#prometheusFieldName)
    * [func prometheusGraphQLRequestName(requestName string) string](#prometheusGraphQLRequestName)
    * [func prometheusTypeName(typeName string) string](#prometheusTypeName)
    * [func queryHasPatternType(query string) bool](#queryHasPatternType)
    * [func repoIsLess(i, j types.RepoName) bool](#repoIsLess)
    * [func repoNamesToStrings(repoNames []api.RepoName) []string](#repoNamesToStrings)
    * [func repoOfMatch(match result.Match) string](#repoOfMatch)
    * [func repoResult(name string) *result.RepoMatch](#repoResult)
    * [func repoRev(revSpec string) *search.RepositoryRevisions](#repoRev)
    * [func reposMap(repos ...types.RepoName) map[api.RepoID]types.RepoName](#reposMap)
    * [func resetMocks()](#resetMocks)
    * [func resolveVersionContext(versionContext string) (*schema.VersionContext, error)](#resolveVersionContext)
    * [func richHTML(content, ext string) (string, error)](#richHTML)
    * [func searchContextsToResolvers(searchContexts []*types.SearchContext, db dbutil.DB) []*searchContextResolver](#searchContextsToResolvers)
    * [func searchResultResolversToString(matches []result.Match) string](#searchResultResolversToString)
    * [func searchResultsStatsLanguages(ctx context.Context, matches []result.Match) ([]inventory.Lang, error)](#searchResultsStatsLanguages)
    * [func searchResultsToRepoNodes(matches []result.Match) ([]query.Node, error)](#searchResultsToRepoNodes)
    * [func selectResults(results []result.Match, q query.Basic) []result.Match](#selectResults)
    * [func sendOrgInvitationNotification(ctx context.Context, db dbutil.DB, org *types.Org, sender *types.User, recipientEmail string) error](#sendOrgInvitationNotification)
    * [func settingsCreateIfUpToDate(ctx context.Context, db dbutil.DB, subject *settingsSubject, lastID *int32, authorUserID int32, contents string) (latestSetting *api.Settings, err error)](#settingsCreateIfUpToDate)
    * [func shouldCheckParam(p visitor.VisitFuncParams) bool](#shouldCheckParam)
    * [func sliceSearchResultsCommon(common *streaming.Stats, firstResultRepo, lastResultRepo string) *streaming.Stats](#sliceSearchResultsCommon)
    * [func sortErrors(errors []*errors.QueryError)](#sortErrors)
    * [func sortSearchSuggestions(s []SearchSuggestionResolver)](#sortSearchSuggestions)
    * [func stripPassword(s string) string](#stripPassword)
    * [func strptr(s string) *string](#strptr)
    * [func substitutePredicates(q query.Basic, evaluate func(query.Predicate) (*SearchResults, error)) (query.Plan, error)](#substitutePredicates)
    * [func symbolResultsToResolvers(db dbutil.DB, commit *GitCommitResolver, symbols []*result.SymbolMatch) []symbolResolver](#symbolResultsToResolvers)
    * [func syncExternalService(ctx context.Context, svc *types.ExternalService, timeout time.Duration, client repoupdaterClient) error](#syncExternalService)
    * [func testStringResult(result SearchSuggestionResolver) string](#testStringResult)
    * [func toDBRepoListColumn(ob string) database.RepoListColumn](#toDBRepoListColumn)
    * [func toJSON(node query.Node) interface{}](#toJSON)
    * [func toKeyPath(gqlKeyPath []*keyPathSegment) (jsonx.Path, error)](#toKeyPath)
    * [func unmarshalAccessTokenID(id graphql.ID) (accessTokenID int64, err error)](#unmarshalAccessTokenID)
    * [func unmarshalExternalAccountID(id graphql.ID) (externalAccountID int32, err error)](#unmarshalExternalAccountID)
    * [func unmarshalExternalServiceID(id graphql.ID) (externalServiceID int64, err error)](#unmarshalExternalServiceID)
    * [func unmarshalGitRefID(id graphql.ID) (repoID graphql.ID, rev string, err error)](#unmarshalGitRefID)
    * [func unmarshalOrgInvitationID(id graphql.ID) (orgInvitationID int64, err error)](#unmarshalOrgInvitationID)
    * [func unmarshalSavedSearchID(id graphql.ID) (savedSearchID int32, err error)](#unmarshalSavedSearchID)
    * [func unmarshalSearchContextCursor(cursor *string) (int32, error)](#unmarshalSearchContextCursor)
    * [func unmarshalSearchContextID(id graphql.ID) (spec string, err error)](#unmarshalSearchContextID)
    * [func unmarshalSearchCursor(cursor *string) (*run.SearchCursor, error)](#unmarshalSearchCursor)
    * [func unmarshalSiteGQLID(id graphql.ID) (siteID string, err error)](#unmarshalSiteGQLID)
    * [func updateAvailableAlert(args AlertFuncArgs) []*Alert](#updateAvailableAlert)
    * [func viewerCanChangeUsername(ctx context.Context, db dbutil.DB, userID int32) bool](#viewerCanChangeUsername)
    * [func viewerIsChangingUsername(ctx context.Context, db dbutil.DB, subjectUserID int32, proposedUsername string) bool](#viewerIsChangingUsername)
    * [func zoektRPC(s zoekt.Searcher) (zoekt.Searcher, func())](#zoektRPC)


## <a id="const" href="#const">Constants</a>

### <a id="AlertTypeError" href="#AlertTypeError">const AlertTypeError</a>

```
searchKey: graphqlbackend.AlertTypeError
tags: [constant string]
```

```Go
const AlertTypeError = "ERROR"
```

Constants for the GraphQL enum AlertType. 

### <a id="AlertTypeInfo" href="#AlertTypeInfo">const AlertTypeInfo</a>

```
searchKey: graphqlbackend.AlertTypeInfo
tags: [constant string]
```

```Go
const AlertTypeInfo = "INFO"
```

Constants for the GraphQL enum AlertType. 

### <a id="AlertTypeWarning" href="#AlertTypeWarning">const AlertTypeWarning</a>

```
searchKey: graphqlbackend.AlertTypeWarning
tags: [constant string]
```

```Go
const AlertTypeWarning = "WARNING"
```

Constants for the GraphQL enum AlertType. 

### <a id="costEstimateVersion" href="#costEstimateVersion">const costEstimateVersion</a>

```
searchKey: graphqlbackend.costEstimateVersion
tags: [constant number private]
```

```Go
const costEstimateVersion = 2
```

Included in tracing so that we can differentiate different costs as we tweak the algorithm 

### <a id="defaultMaxSearchResults" href="#defaultMaxSearchResults">const defaultMaxSearchResults</a>

```
searchKey: graphqlbackend.defaultMaxSearchResults
tags: [constant number private]
```

```Go
const defaultMaxSearchResults = 30
```

### <a id="defaultMaxSearchResultsStreaming" href="#defaultMaxSearchResultsStreaming">const defaultMaxSearchResultsStreaming</a>

```
searchKey: graphqlbackend.defaultMaxSearchResultsStreaming
tags: [constant number private]
```

```Go
const defaultMaxSearchResultsStreaming = 500
```

### <a id="exampleCommitSHA1" href="#exampleCommitSHA1">const exampleCommitSHA1</a>

```
searchKey: graphqlbackend.exampleCommitSHA1
tags: [constant string private]
```

```Go
const exampleCommitSHA1 = "1234567890123456789012345678901234567890"
```

### <a id="externalServiceIDKind" href="#externalServiceIDKind">const externalServiceIDKind</a>

```
searchKey: graphqlbackend.externalServiceIDKind
tags: [constant string private]
```

```Go
const externalServiceIDKind = "ExternalService"
```

### <a id="gitObjectTypeBlob" href="#gitObjectTypeBlob">const gitObjectTypeBlob</a>

```
searchKey: graphqlbackend.gitObjectTypeBlob
tags: [constant string private]
```

```Go
const gitObjectTypeBlob gitObjectType = "GIT_BLOB"
```

### <a id="gitObjectTypeCommit" href="#gitObjectTypeCommit">const gitObjectTypeCommit</a>

```
searchKey: graphqlbackend.gitObjectTypeCommit
tags: [constant string private]
```

```Go
const gitObjectTypeCommit gitObjectType = "GIT_COMMIT"
```

### <a id="gitObjectTypeTag" href="#gitObjectTypeTag">const gitObjectTypeTag</a>

```
searchKey: graphqlbackend.gitObjectTypeTag
tags: [constant string private]
```

```Go
const gitObjectTypeTag gitObjectType = "GIT_TAG"
```

### <a id="gitObjectTypeTree" href="#gitObjectTypeTree">const gitObjectTypeTree</a>

```
searchKey: graphqlbackend.gitObjectTypeTree
tags: [constant string private]
```

```Go
const gitObjectTypeTree gitObjectType = "GIT_TREE"
```

### <a id="gitObjectTypeUnknown" href="#gitObjectTypeUnknown">const gitObjectTypeUnknown</a>

```
searchKey: graphqlbackend.gitObjectTypeUnknown
tags: [constant string private]
```

```Go
const gitObjectTypeUnknown gitObjectType = "GIT_UNKNOWN"
```

### <a id="gitRefOrderAuthoredOrCommittedAt" href="#gitRefOrderAuthoredOrCommittedAt">const gitRefOrderAuthoredOrCommittedAt</a>

```
searchKey: graphqlbackend.gitRefOrderAuthoredOrCommittedAt
tags: [constant string private]
```

```Go
const gitRefOrderAuthoredOrCommittedAt = "AUTHORED_OR_COMMITTED_AT"
```

### <a id="gitRefTypeBranch" href="#gitRefTypeBranch">const gitRefTypeBranch</a>

```
searchKey: graphqlbackend.gitRefTypeBranch
tags: [constant string private]
```

```Go
const gitRefTypeBranch = "GIT_BRANCH"
```

### <a id="gitRefTypeOther" href="#gitRefTypeOther">const gitRefTypeOther</a>

```
searchKey: graphqlbackend.gitRefTypeOther
tags: [constant string private]
```

```Go
const gitRefTypeOther = "GIT_REF_OTHER"
```

### <a id="gitRefTypeTag" href="#gitRefTypeTag">const gitRefTypeTag</a>

```
searchKey: graphqlbackend.gitRefTypeTag
tags: [constant string private]
```

```Go
const gitRefTypeTag = "GIT_TAG"
```

### <a id="maxSearchResultsPerPaginatedRequest" href="#maxSearchResultsPerPaginatedRequest">const maxSearchResultsPerPaginatedRequest</a>

```
searchKey: graphqlbackend.maxSearchResultsPerPaginatedRequest
tags: [constant number private]
```

```Go
const maxSearchResultsPerPaginatedRequest = 5000
```

### <a id="maxSearchSuggestions" href="#maxSearchSuggestions">const maxSearchSuggestions</a>

```
searchKey: graphqlbackend.maxSearchSuggestions
tags: [constant number private]
```

```Go
const maxSearchSuggestions = 100
```

### <a id="maxUserPublicRepos" href="#maxUserPublicRepos">const maxUserPublicRepos</a>

```
searchKey: graphqlbackend.maxUserPublicRepos
tags: [constant number private]
```

```Go
const maxUserPublicRepos = 100
```

### <a id="repositoryCursorKind" href="#repositoryCursorKind">const repositoryCursorKind</a>

```
searchKey: graphqlbackend.repositoryCursorKind
tags: [constant string private]
```

```Go
const repositoryCursorKind = "RepositoryCursor"
```

This constant defines the cursor prefix, which disambiguates a repository cursor from other types of cursors in the system. 

### <a id="searchContextCursorKind" href="#searchContextCursorKind">const searchContextCursorKind</a>

```
searchKey: graphqlbackend.searchContextCursorKind
tags: [constant string private]
```

```Go
const searchContextCursorKind = "SearchContextCursor"
```

### <a id="searchContextsOrderBySpec" href="#searchContextsOrderBySpec">const searchContextsOrderBySpec</a>

```
searchKey: graphqlbackend.searchContextsOrderBySpec
tags: [constant string private]
```

```Go
const searchContextsOrderBySpec searchContextsOrderBy = "SEARCH_CONTEXT_SPEC"
```

### <a id="searchContextsOrderByUpdatedAt" href="#searchContextsOrderByUpdatedAt">const searchContextsOrderByUpdatedAt</a>

```
searchKey: graphqlbackend.searchContextsOrderByUpdatedAt
tags: [constant string private]
```

```Go
const searchContextsOrderByUpdatedAt searchContextsOrderBy = "SEARCH_CONTEXT_UPDATED_AT"
```

### <a id="searchCursorKind" href="#searchCursorKind">const searchCursorKind</a>

```
searchKey: graphqlbackend.searchCursorKind
tags: [constant string private]
```

```Go
const searchCursorKind = "SearchCursor"
```

### <a id="singletonDefaultSettingsGQLID" href="#singletonDefaultSettingsGQLID">const singletonDefaultSettingsGQLID</a>

```
searchKey: graphqlbackend.singletonDefaultSettingsGQLID
tags: [constant string private]
```

```Go
const singletonDefaultSettingsGQLID = "DefaultSettings"
```

### <a id="singletonSiteGQLID" href="#singletonSiteGQLID">const singletonSiteGQLID</a>

```
searchKey: graphqlbackend.singletonSiteGQLID
tags: [constant string private]
```

```Go
const singletonSiteGQLID = "site"
```

### <a id="testCopyDiff" href="#testCopyDiff">const testCopyDiff</a>

```
searchKey: graphqlbackend.testCopyDiff
tags: [constant string private]
```

```Go
const testCopyDiff = ...
```

This is unparseable by go-diff. Once it isn't anymore, the test should fail, reminding us of the TODO comment in repository_comparison to reenable it. 

### <a id="testDiff" href="#testDiff">const testDiff</a>

```
searchKey: graphqlbackend.testDiff
tags: [constant string private]
```

```Go
const testDiff = ...
```

### <a id="testDiffFiles" href="#testDiffFiles">const testDiffFiles</a>

```
searchKey: graphqlbackend.testDiffFiles
tags: [constant number private]
```

```Go
const testDiffFiles = 3
```

### <a id="testDiffFirstHunk" href="#testDiffFirstHunk">const testDiffFirstHunk</a>

```
searchKey: graphqlbackend.testDiffFirstHunk
tags: [constant string private]
```

```Go
const testDiffFirstHunk = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="ActualUserCount" href="#ActualUserCount">var ActualUserCount</a>

```
searchKey: graphqlbackend.ActualUserCount
tags: [variable function]
```

```Go
var ActualUserCount = func(ctx context.Context) (int32, error) {
	return 0, nil
}
```

ActualUserCount is called to obtain the actual maximum number of user accounts that have been active on this Sourcegraph instance for the current license. 

### <a id="ActualUserCountDate" href="#ActualUserCountDate">var ActualUserCountDate</a>

```
searchKey: graphqlbackend.ActualUserCountDate
tags: [variable function]
```

```Go
var ActualUserCountDate = func(ctx context.Context) (string, error) {
	return "", nil
}
```

ActualUserCountDate is called to obtain the timestamp when the actual maximum number of user accounts that have been active on this Sourcegraph instance for the current license was reached. 

### <a id="AlertFuncs" href="#AlertFuncs">var AlertFuncs</a>

```
searchKey: graphqlbackend.AlertFuncs
tags: [variable array function]
```

```Go
var AlertFuncs []func(AlertFuncArgs) []*Alert
```

AlertFuncs is a list of functions called to populate the GraphQL Site.alerts value. It may be appended to at init time. 

The functions are called each time the Site.alerts value is queried, so they must not block. 

### <a id="EnterpriseResolvers" href="#EnterpriseResolvers">var EnterpriseResolvers</a>

```
searchKey: graphqlbackend.EnterpriseResolvers
tags: [variable struct]
```

```Go
var EnterpriseResolvers = ...
```

EnterpriseResolvers holds the instances of resolvers which are enabled only in enterprise mode. These resolver instances are nil when running as OSS. 

### <a id="ErrExtensionsDisabled" href="#ErrExtensionsDisabled">var ErrExtensionsDisabled</a>

```
searchKey: graphqlbackend.ErrExtensionsDisabled
tags: [variable interface]
```

```Go
var ErrExtensionsDisabled = ...
```

### <a id="ErrPredicateNoResults" href="#ErrPredicateNoResults">var ErrPredicateNoResults</a>

```
searchKey: graphqlbackend.ErrPredicateNoResults
tags: [variable interface]
```

```Go
var ErrPredicateNoResults = errors.New("no results returned for predicate")
```

### <a id="ExtensionRegistry" href="#ExtensionRegistry">var ExtensionRegistry</a>

```
searchKey: graphqlbackend.ExtensionRegistry
tags: [variable function]
```

```Go
var ExtensionRegistry func(db dbutil.DB) ExtensionRegistryResolver
```

ExtensionRegistry is the implementation of the GraphQL types ExtensionRegistry and ExtensionRegistryMutation. 

### <a id="GetConfiguredProductLicenseInfo" href="#GetConfiguredProductLicenseInfo">var GetConfiguredProductLicenseInfo</a>

```
searchKey: graphqlbackend.GetConfiguredProductLicenseInfo
tags: [variable function]
```

```Go
var GetConfiguredProductLicenseInfo = func() (*ProductLicenseInfo, error) {
	return nil, nil
}
```

GetConfiguredProductLicenseInfo is called to obtain the product subscription info when creating the GraphQL resolver for the GraphQL type ProductLicenseInfo. 

Exactly 1 of its return values must be non-nil. 

It is overridden in non-OSS builds to return information about the actual product subscription in use. 

### <a id="GetProductNameWithBrand" href="#GetProductNameWithBrand">var GetProductNameWithBrand</a>

```
searchKey: graphqlbackend.GetProductNameWithBrand
tags: [variable function]
```

```Go
var GetProductNameWithBrand = ...
```

GetProductNameWithBrand is called to obtain the full product name (e.g., "Sourcegraph OSS") from a product license. 

### <a id="NoLicenseMaximumAllowedUserCount" href="#NoLicenseMaximumAllowedUserCount">var NoLicenseMaximumAllowedUserCount</a>

```
searchKey: graphqlbackend.NoLicenseMaximumAllowedUserCount
tags: [variable number]
```

```Go
var NoLicenseMaximumAllowedUserCount *int32
```

NoLicenseMaximumAllowedUserCount is the maximum allowed user count when there is no license, or nil if there is no limit. 

### <a id="NoLicenseWarningUserCount" href="#NoLicenseWarningUserCount">var NoLicenseWarningUserCount</a>

```
searchKey: graphqlbackend.NoLicenseWarningUserCount
tags: [variable number]
```

```Go
var NoLicenseWarningUserCount *int32
```

NoLicenseWarningUserCount is the user count at which point a warning is shown to all users when there is no license, or nil if there is no limit. 

### <a id="NodeToRegistryExtension" href="#NodeToRegistryExtension">var NodeToRegistryExtension</a>

```
searchKey: graphqlbackend.NodeToRegistryExtension
tags: [variable function]
```

```Go
var NodeToRegistryExtension func(interface{}) (RegistryExtension, bool)
```

NodeToRegistryExtension is called to convert GraphQL node values to values of type RegistryExtension. It is assigned at init time. 

### <a id="RegistryExtensionByID" href="#RegistryExtensionByID">var RegistryExtensionByID</a>

```
searchKey: graphqlbackend.RegistryExtensionByID
tags: [variable function]
```

```Go
var RegistryExtensionByID func(context.Context, dbutil.DB, graphql.ID) (RegistryExtension, error)
```

RegistryExtensionByID is called to look up values of GraphQL type RegistryExtension. It is assigned at init time. 

### <a id="allowedPrometheusFieldNames" href="#allowedPrometheusFieldNames">var allowedPrometheusFieldNames</a>

```
searchKey: graphqlbackend.allowedPrometheusFieldNames
tags: [variable object private]
```

```Go
var allowedPrometheusFieldNames = ...
```

### <a id="authzSchema" href="#authzSchema">var authzSchema</a>

```
searchKey: graphqlbackend.authzSchema
tags: [variable string private]
```

```Go
var authzSchema string
```

authzSchema is the Authz raw graqhql schema. 

### <a id="batchesSchema" href="#batchesSchema">var batchesSchema</a>

```
searchKey: graphqlbackend.batchesSchema
tags: [variable string private]
```

```Go
var batchesSchema string
```

batchesSchema is the Batch Changes raw graqhql schema. 

### <a id="blocklistedPrometheusTypeNames" href="#blocklistedPrometheusTypeNames">var blocklistedPrometheusTypeNames</a>

```
searchKey: graphqlbackend.blocklistedPrometheusTypeNames
tags: [variable object private]
```

```Go
var blocklistedPrometheusTypeNames = ...
```

### <a id="builtinExtensions" href="#builtinExtensions">var builtinExtensions</a>

```
searchKey: graphqlbackend.builtinExtensions
tags: [variable object private]
```

```Go
var builtinExtensions = ...
```

### <a id="canReloadSite" href="#canReloadSite">var canReloadSite</a>

```
searchKey: graphqlbackend.canReloadSite
tags: [variable boolean private]
```

```Go
var canReloadSite = processrestart.CanRestart()
```

canReloadSite is whether the current site can be reloaded via the API. Currently only goreman-managed sites can be reloaded. Callers must also check if the actor is an admin before actually reloading the site. 

### <a id="cf" href="#cf">var cf</a>

```
searchKey: graphqlbackend.cf
tags: [variable struct private]
```

```Go
var cf = httpcli.NewExternalHTTPClientFactory()
```

### <a id="codeIntelRequests" href="#codeIntelRequests">var codeIntelRequests</a>

```
searchKey: graphqlbackend.codeIntelRequests
tags: [variable struct private]
```

```Go
var codeIntelRequests = ...
```

### <a id="codeIntelSchema" href="#codeIntelSchema">var codeIntelSchema</a>

```
searchKey: graphqlbackend.codeIntelSchema
tags: [variable string private]
```

```Go
var codeIntelSchema string
```

codeIntelSchema is the Code Intel raw graqhql schema. 

### <a id="codeIntelSearchHistogram" href="#codeIntelSearchHistogram">var codeIntelSearchHistogram</a>

```
searchKey: graphqlbackend.codeIntelSearchHistogram
tags: [variable struct private]
```

```Go
var codeIntelSearchHistogram = ...
```

### <a id="codeMonitorsSchema" href="#codeMonitorsSchema">var codeMonitorsSchema</a>

```
searchKey: graphqlbackend.codeMonitorsSchema
tags: [variable string private]
```

```Go
var codeMonitorsSchema string
```

codeMonitorsSchema is the Code Monitoring raw graqhql schema. 

### <a id="deeplyMergedSettingsFields" href="#deeplyMergedSettingsFields">var deeplyMergedSettingsFields</a>

```
searchKey: graphqlbackend.deeplyMergedSettingsFields
tags: [variable object private]
```

```Go
var deeplyMergedSettingsFields = ...
```

deeplyMergedSettingsFields contains the names of top-level settings fields whose values should be merged if they appear in multiple cascading settings. The value is the merge depth (how many levels into the object should the merging occur). 

For example, suppose org settings is {"a":[1]} and user settings is {"a":[2]}. If "a" is NOT a deeply merged field, the merged settings would be {"a":[2]}. If "a" IS a deeply merged field with depth >= 1, then the merged settings would be {"a":[1,2].} 

### <a id="defaultTimeout" href="#defaultTimeout">var defaultTimeout</a>

```
searchKey: graphqlbackend.defaultTimeout
tags: [variable number private]
```

```Go
var defaultTimeout = 20 * time.Second
```

The default timeout to use for queries. 

### <a id="disableSecurity" href="#disableSecurity">var disableSecurity</a>

```
searchKey: graphqlbackend.disableSecurity
tags: [variable boolean private]
```

```Go
var disableSecurity, _ = ...
```

Intentionally named "DISABLE_SECURITY" and not something else, so that anyone considering disabling this thinks twice about the risks associated with disabling these and considers keeping up-to-date more frequently instead. 

### <a id="dotcomSchema" href="#dotcomSchema">var dotcomSchema</a>

```
searchKey: graphqlbackend.dotcomSchema
tags: [variable string private]
```

```Go
var dotcomSchema string
```

dotcomSchema is the Dotcom schema extension raw graqhql schema. 

### <a id="emailTemplates" href="#emailTemplates">var emailTemplates</a>

```
searchKey: graphqlbackend.emailTemplates
tags: [variable struct private]
```

```Go
var emailTemplates = ...
```

### <a id="errMissingPatternType" href="#errMissingPatternType">var errMissingPatternType</a>

```
searchKey: graphqlbackend.errMissingPatternType
tags: [variable interface private]
```

```Go
var errMissingPatternType = ...
```

### <a id="errNoAccessExternalService" href="#errNoAccessExternalService">var errNoAccessExternalService</a>

```
searchKey: graphqlbackend.errNoAccessExternalService
tags: [variable interface private]
```

```Go
var errNoAccessExternalService = ...
```

### <a id="errUnknownSettingsSubject" href="#errUnknownSettingsSubject">var errUnknownSettingsSubject</a>

```
searchKey: graphqlbackend.errUnknownSettingsSubject
tags: [variable interface private]
```

```Go
var errUnknownSettingsSubject = errors.New("unknown settings subject")
```

### <a id="extsvcConfigAllowEdits" href="#extsvcConfigAllowEdits">var extsvcConfigAllowEdits</a>

```
searchKey: graphqlbackend.extsvcConfigAllowEdits
tags: [variable boolean private]
```

```Go
var extsvcConfigAllowEdits, _ = ...
```

### <a id="globalSettingsAllowEdits" href="#globalSettingsAllowEdits">var globalSettingsAllowEdits</a>

```
searchKey: graphqlbackend.globalSettingsAllowEdits
tags: [variable boolean private]
```

```Go
var globalSettingsAllowEdits, _ = ...
```

### <a id="graphqlFieldHistogram" href="#graphqlFieldHistogram">var graphqlFieldHistogram</a>

```
searchKey: graphqlbackend.graphqlFieldHistogram
tags: [variable struct private]
```

```Go
var graphqlFieldHistogram = ...
```

### <a id="highlightHistogram" href="#highlightHistogram">var highlightHistogram</a>

```
searchKey: graphqlbackend.highlightHistogram
tags: [variable interface private]
```

```Go
var highlightHistogram = ...
```

### <a id="insightsSchema" href="#insightsSchema">var insightsSchema</a>

```
searchKey: graphqlbackend.insightsSchema
tags: [variable string private]
```

```Go
var insightsSchema string
```

insightsSchema is the Code Insights raw graqhql schema. 

### <a id="licenseSchema" href="#licenseSchema">var licenseSchema</a>

```
searchKey: graphqlbackend.licenseSchema
tags: [variable string private]
```

```Go
var licenseSchema string
```

licenseSchema is the Licensing raw graqhql schema. 

### <a id="mainSchema" href="#mainSchema">var mainSchema</a>

```
searchKey: graphqlbackend.mainSchema
tags: [variable string private]
```

```Go
var mainSchema string
```

mainSchema is the main raw graqhql schema. 

### <a id="metricLabels" href="#metricLabels">var metricLabels</a>

```
searchKey: graphqlbackend.metricLabels
tags: [variable array string private]
```

```Go
var metricLabels = []string{"origin"}
```

### <a id="mockCount" href="#mockCount">var mockCount</a>

```
searchKey: graphqlbackend.mockCount
tags: [variable function private]
```

```Go
var mockCount = ...
```

### <a id="mockDecodedViewerFinalSettings" href="#mockDecodedViewerFinalSettings">var mockDecodedViewerFinalSettings</a>

```
searchKey: graphqlbackend.mockDecodedViewerFinalSettings
tags: [variable struct private]
```

```Go
var mockDecodedViewerFinalSettings *schema.Settings
```

### <a id="mockResolveRepositories" href="#mockResolveRepositories">var mockResolveRepositories</a>

```
searchKey: graphqlbackend.mockResolveRepositories
tags: [variable function private]
```

```Go
var mockResolveRepositories func(effectiveRepoFieldValues []string) (resolved searchrepos.Resolved, err error) = ...
```

This file contains the root resolver for search. It currently has a lot of logic that spans out into all the other search_* files. 

### <a id="mockSettingsCascadeSubjects" href="#mockSettingsCascadeSubjects">var mockSettingsCascadeSubjects</a>

```
searchKey: graphqlbackend.mockSettingsCascadeSubjects
tags: [variable function private]
```

```Go
var mockSettingsCascadeSubjects func() ([]*settingsSubject, error)
```

### <a id="mockShowFileSuggestions" href="#mockShowFileSuggestions">var mockShowFileSuggestions</a>

```
searchKey: graphqlbackend.mockShowFileSuggestions
tags: [variable function private]
```

```Go
var mockShowFileSuggestions showSearchSuggestionResolvers
```

### <a id="mockShowLangSuggestions" href="#mockShowLangSuggestions">var mockShowLangSuggestions</a>

```
searchKey: graphqlbackend.mockShowLangSuggestions
tags: [variable function private]
```

```Go
var mockShowLangSuggestions showSearchSuggestionResolvers
```

### <a id="mockShowRepoSuggestions" href="#mockShowRepoSuggestions">var mockShowRepoSuggestions</a>

```
searchKey: graphqlbackend.mockShowRepoSuggestions
tags: [variable function private]
```

```Go
var mockShowRepoSuggestions showSearchSuggestionResolvers
```

### <a id="mockShowSymbolMatches" href="#mockShowSymbolMatches">var mockShowSymbolMatches</a>

```
searchKey: graphqlbackend.mockShowSymbolMatches
tags: [variable function private]
```

```Go
var mockShowSymbolMatches showSearchSuggestionResolvers
```

### <a id="nonSCPURLRegex" href="#nonSCPURLRegex">var nonSCPURLRegex</a>

```
searchKey: graphqlbackend.nonSCPURLRegex
tags: [variable struct private]
```

```Go
var nonSCPURLRegex = lazyregexp.New(`^(git\+)?(https?|ssh|rsync|file|git|perforce)://`)
```

TODO(flying-robot): this regex and the majority of the removeUserInfo function can be extracted to a common location in a subsequent change. 

### <a id="numTotalRepos" href="#numTotalRepos">var numTotalRepos</a>

```
searchKey: graphqlbackend.numTotalRepos
tags: [variable struct private]
```

```Go
var numTotalRepos = &numTotalReposCache{}
```

### <a id="opaqueCursor" href="#opaqueCursor">var opaqueCursor</a>

```
searchKey: graphqlbackend.opaqueCursor
tags: [variable string private]
```

```Go
var opaqueCursor = ...
```

### <a id="parseSchemaErr" href="#parseSchemaErr">var parseSchemaErr</a>

```
searchKey: graphqlbackend.parseSchemaErr
tags: [variable interface private]
```

```Go
var parseSchemaErr error
```

### <a id="parseSchemaOnce" href="#parseSchemaOnce">var parseSchemaOnce</a>

```
searchKey: graphqlbackend.parseSchemaOnce
tags: [variable struct private]
```

```Go
var parseSchemaOnce sync.Once
```

### <a id="parsedSchema" href="#parsedSchema">var parsedSchema</a>

```
searchKey: graphqlbackend.parsedSchema
tags: [variable struct private]
```

```Go
var parsedSchema *graphql.Schema
```

### <a id="patternType" href="#patternType">var patternType</a>

```
searchKey: graphqlbackend.patternType
tags: [variable struct private]
```

```Go
var patternType = lazyregexp.New(`(?i)\bpatternType:(literal|regexp|structural)\b`)
```

### <a id="quantityParams" href="#quantityParams">var quantityParams</a>

```
searchKey: graphqlbackend.quantityParams
tags: [variable object private]
```

```Go
var quantityParams = map[string]struct{}{
	"first": {},
	"last":  {},
}
```

### <a id="rawCursor" href="#rawCursor">var rawCursor</a>

```
searchKey: graphqlbackend.rawCursor
tags: [variable struct private]
```

```Go
var rawCursor = repositoryCursor{Column: "foo", Value: "bar", Direction: "next"}
```

### <a id="scopeCache" href="#scopeCache">var scopeCache</a>

```
searchKey: graphqlbackend.scopeCache
tags: [variable struct private]
```

```Go
var scopeCache = rcache.New("extsvc_token_scope")
```

### <a id="searchLatenciesFrontendCodeLoad" href="#searchLatenciesFrontendCodeLoad">var searchLatenciesFrontendCodeLoad</a>

```
searchKey: graphqlbackend.searchLatenciesFrontendCodeLoad
tags: [variable struct private]
```

```Go
var searchLatenciesFrontendCodeLoad = ...
```

### <a id="searchLatenciesFrontendFirstResult" href="#searchLatenciesFrontendFirstResult">var searchLatenciesFrontendFirstResult</a>

```
searchKey: graphqlbackend.searchLatenciesFrontendFirstResult
tags: [variable struct private]
```

```Go
var searchLatenciesFrontendFirstResult = ...
```

### <a id="searchLatencyHistogram" href="#searchLatencyHistogram">var searchLatencyHistogram</a>

```
searchKey: graphqlbackend.searchLatencyHistogram
tags: [variable struct private]
```

```Go
var searchLatencyHistogram = ...
```

### <a id="searchResponseCounter" href="#searchResponseCounter">var searchResponseCounter</a>

```
searchKey: graphqlbackend.searchResponseCounter
tags: [variable struct private]
```

```Go
var searchResponseCounter = ...
```

### <a id="searchResultsStatsCache" href="#searchResultsStatsCache">var searchResultsStatsCache</a>

```
searchKey: graphqlbackend.searchResultsStatsCache
tags: [variable struct private]
```

```Go
var searchResultsStatsCache = rcache.NewWithTTL("search_results_stats", 3600) // 1h

```

### <a id="searchResultsStatsCounter" href="#searchResultsStatsCounter">var searchResultsStatsCounter</a>

```
searchKey: graphqlbackend.searchResultsStatsCounter
tags: [variable struct private]
```

```Go
var searchResultsStatsCounter = ...
```

### <a id="siteConfigAllowEdits" href="#siteConfigAllowEdits">var siteConfigAllowEdits</a>

```
searchKey: graphqlbackend.siteConfigAllowEdits
tags: [variable boolean private]
```

```Go
var siteConfigAllowEdits, _ = ...
```

### <a id="testMetricCritical" href="#testMetricCritical">var testMetricCritical</a>

```
searchKey: graphqlbackend.testMetricCritical
tags: [variable struct private]
```

```Go
var testMetricCritical = ...
```

### <a id="testMetricWarning" href="#testMetricWarning">var testMetricWarning</a>

```
searchKey: graphqlbackend.testMetricWarning
tags: [variable struct private]
```

```Go
var testMetricWarning = ...
```

### <a id="testSearchGQLQuery" href="#testSearchGQLQuery">var testSearchGQLQuery</a>

```
searchKey: graphqlbackend.testSearchGQLQuery
tags: [variable string private]
```

```Go
var testSearchGQLQuery = ...
```

### <a id="timeNow" href="#timeNow">var timeNow</a>

```
searchKey: graphqlbackend.timeNow
tags: [variable function private]
```

```Go
var timeNow = time.Now
```

## <a id="type" href="#type">Types</a>

### <a id="Alert" href="#Alert">type Alert struct</a>

```
searchKey: graphqlbackend.Alert
tags: [struct]
```

```Go
type Alert struct {
	TypeValue                 string
	MessageValue              string
	IsDismissibleWithKeyValue string
}
```

Alert implements the GraphQL type Alert. 

#### <a id="determineOutOfDateAlert" href="#determineOutOfDateAlert">func determineOutOfDateAlert(isAdmin bool, months int, offline bool) *Alert</a>

```
searchKey: graphqlbackend.determineOutOfDateAlert
tags: [function private]
```

```Go
func determineOutOfDateAlert(isAdmin bool, months int, offline bool) *Alert
```

#### <a id="Alert.IsDismissibleWithKey" href="#Alert.IsDismissibleWithKey">func (r *Alert) IsDismissibleWithKey() *string</a>

```
searchKey: graphqlbackend.Alert.IsDismissibleWithKey
tags: [method]
```

```Go
func (r *Alert) IsDismissibleWithKey() *string
```

#### <a id="Alert.Message" href="#Alert.Message">func (r *Alert) Message() string</a>

```
searchKey: graphqlbackend.Alert.Message
tags: [method]
```

```Go
func (r *Alert) Message() string
```

#### <a id="Alert.Type" href="#Alert.Type">func (r *Alert) Type() string</a>

```
searchKey: graphqlbackend.Alert.Type
tags: [method]
```

```Go
func (r *Alert) Type() string
```

### <a id="AlertFuncArgs" href="#AlertFuncArgs">type AlertFuncArgs struct</a>

```
searchKey: graphqlbackend.AlertFuncArgs
tags: [struct]
```

```Go
type AlertFuncArgs struct {
	IsAuthenticated     bool             // whether the viewer is authenticated
	IsSiteAdmin         bool             // whether the viewer is a site admin
	ViewerFinalSettings *schema.Settings // the viewer's final user/org/global settings
}
```

AlertFuncArgs are the arguments provided to functions in AlertFuncs used to populate the GraphQL Site.alerts value. They allow the functions to customize the returned alerts based on the identity of the viewer (without needing to query for that on their own, which would be slow). 

### <a id="ApplyBatchChangeArgs" href="#ApplyBatchChangeArgs">type ApplyBatchChangeArgs struct</a>

```
searchKey: graphqlbackend.ApplyBatchChangeArgs
tags: [struct]
```

```Go
type ApplyBatchChangeArgs struct {
	BatchSpec         graphql.ID
	EnsureBatchChange *graphql.ID
}
```

### <a id="ApplyCampaignArgs" href="#ApplyCampaignArgs">type ApplyCampaignArgs struct</a>

```
searchKey: graphqlbackend.ApplyCampaignArgs
tags: [struct]
```

```Go
type ApplyCampaignArgs struct {
	CampaignSpec   graphql.ID
	EnsureCampaign *graphql.ID
}
```

TODO(campaigns-deprecation) 

### <a id="ArchiveProductSubscriptionArgs" href="#ArchiveProductSubscriptionArgs">type ArchiveProductSubscriptionArgs struct</a>

```
searchKey: graphqlbackend.ArchiveProductSubscriptionArgs
tags: [struct]
```

```Go
type ArchiveProductSubscriptionArgs struct{ ID graphql.ID }
```

### <a id="AuthorizedRepoArgs" href="#AuthorizedRepoArgs">type AuthorizedRepoArgs struct</a>

```
searchKey: graphqlbackend.AuthorizedRepoArgs
tags: [struct]
```

```Go
type AuthorizedRepoArgs struct {
	Username *string
	Email    *string
	Perm     string
	First    int32
	After    *string
}
```

### <a id="AuthorizedUserArgs" href="#AuthorizedUserArgs">type AuthorizedUserArgs struct</a>

```
searchKey: graphqlbackend.AuthorizedUserArgs
tags: [struct]
```

```Go
type AuthorizedUserArgs struct {
	RepositoryID graphql.ID
	Permission   string
	First        int32
	After        *string
}
```

### <a id="AuthzResolver" href="#AuthzResolver">type AuthzResolver interface</a>

```
searchKey: graphqlbackend.AuthzResolver
tags: [interface]
```

```Go
type AuthzResolver interface {
	// Mutations
	SetRepositoryPermissionsForUsers(ctx context.Context, args *RepoPermsArgs) (*EmptyResponse, error)
	ScheduleRepositoryPermissionsSync(ctx context.Context, args *RepositoryIDArgs) (*EmptyResponse, error)
	ScheduleUserPermissionsSync(ctx context.Context, args *UserIDArgs) (*EmptyResponse, error)

	// Queries
	AuthorizedUserRepositories(ctx context.Context, args *AuthorizedRepoArgs) (RepositoryConnectionResolver, error)
	UsersWithPendingPermissions(ctx context.Context) ([]string, error)
	AuthorizedUsers(ctx context.Context, args *RepoAuthorizedUserArgs) (UserConnectionResolver, error)

	// Helpers
	RepositoryPermissionsInfo(ctx context.Context, repoID graphql.ID) (PermissionsInfoResolver, error)
	UserPermissionsInfo(ctx context.Context, userID graphql.ID) (PermissionsInfoResolver, error)
}
```

### <a id="BasicLimitWatcher" href="#BasicLimitWatcher">type BasicLimitWatcher graphqlbackend.RateLimitWatcher</a>

```
searchKey: graphqlbackend.BasicLimitWatcher
tags: [struct]
```

```Go
type BasicLimitWatcher RateLimitWatcher
```

#### <a id="NewBasicLimitWatcher" href="#NewBasicLimitWatcher">func NewBasicLimitWatcher(store throttled.GCRAStore) *BasicLimitWatcher</a>

```
searchKey: graphqlbackend.NewBasicLimitWatcher
tags: [function]
```

```Go
func NewBasicLimitWatcher(store throttled.GCRAStore) *BasicLimitWatcher
```

#### <a id="BasicLimitWatcher.Get" href="#BasicLimitWatcher.Get">func (bl *BasicLimitWatcher) Get() (Limiter, bool)</a>

```
searchKey: graphqlbackend.BasicLimitWatcher.Get
tags: [method]
```

```Go
func (bl *BasicLimitWatcher) Get() (Limiter, bool)
```

Get returns the latest Limiter. 

#### <a id="BasicLimitWatcher.updateFromConfig" href="#BasicLimitWatcher.updateFromConfig">func (bl *BasicLimitWatcher) updateFromConfig(limit int)</a>

```
searchKey: graphqlbackend.BasicLimitWatcher.updateFromConfig
tags: [method private]
```

```Go
func (bl *BasicLimitWatcher) updateFromConfig(limit int)
```

### <a id="BasicLimiter" href="#BasicLimiter">type BasicLimiter struct</a>

```
searchKey: graphqlbackend.BasicLimiter
tags: [struct]
```

```Go
type BasicLimiter struct {
	*throttled.GCRARateLimiter
	enabled bool
}
```

#### <a id="BasicLimiter.RateLimit" href="#BasicLimiter.RateLimit">func (bl *BasicLimiter) RateLimit(_ string, _ int, args LimiterArgs) (bool, throttled.RateLimitResult, error)</a>

```
searchKey: graphqlbackend.BasicLimiter.RateLimit
tags: [method]
```

```Go
func (bl *BasicLimiter) RateLimit(_ string, _ int, args LimiterArgs) (bool, throttled.RateLimitResult, error)
```

RateLimit limits unauthenticated requests to the GraphQL API with an equal quantity of 1. 

### <a id="BatchChangeArgs" href="#BatchChangeArgs">type BatchChangeArgs struct</a>

```
searchKey: graphqlbackend.BatchChangeArgs
tags: [struct]
```

```Go
type BatchChangeArgs struct {
	Namespace string
	Name      string
}
```

### <a id="BatchChangeDescriptionResolver" href="#BatchChangeDescriptionResolver">type BatchChangeDescriptionResolver interface</a>

```
searchKey: graphqlbackend.BatchChangeDescriptionResolver
tags: [interface]
```

```Go
type BatchChangeDescriptionResolver interface {
	Name() string
	Description() string
}
```

### <a id="BatchChangeResolver" href="#BatchChangeResolver">type BatchChangeResolver interface</a>

```
searchKey: graphqlbackend.BatchChangeResolver
tags: [interface]
```

```Go
type BatchChangeResolver interface {
	ID() graphql.ID
	Name() string
	Description() *string
	InitialApplier(ctx context.Context) (*UserResolver, error)
	LastApplier(ctx context.Context) (*UserResolver, error)
	LastAppliedAt() DateTime
	SpecCreator(ctx context.Context) (*UserResolver, error)
	ViewerCanAdminister(ctx context.Context) (bool, error)
	URL(ctx context.Context) (string, error)
	Namespace(ctx context.Context) (n NamespaceResolver, err error)
	CreatedAt() DateTime
	UpdatedAt() DateTime
	ChangesetsStats(ctx context.Context) (ChangesetsStatsResolver, error)
	Changesets(ctx context.Context, args *ListChangesetsArgs) (ChangesetsConnectionResolver, error)
	ChangesetCountsOverTime(ctx context.Context, args *ChangesetCountsArgs) ([]ChangesetCountsResolver, error)
	ClosedAt() *DateTime
	DiffStat(ctx context.Context) (*DiffStat, error)
	CurrentSpec(ctx context.Context) (BatchSpecResolver, error)
	BulkOperations(ctx context.Context, args *ListBatchChangeBulkOperationArgs) (BulkOperationConnectionResolver, error)

	// TODO(campaigns-deprecation): This should be removed once we remove batches.
	// It's here so that in the NodeResolver we can have the same resolver,
	// BatchChangeResolver, act as a Campaign and a BatchChange.
	ActAsCampaign() bool
}
```

### <a id="BatchChangesCodeHostConnectionResolver" href="#BatchChangesCodeHostConnectionResolver">type BatchChangesCodeHostConnectionResolver interface</a>

```
searchKey: graphqlbackend.BatchChangesCodeHostConnectionResolver
tags: [interface]
```

```Go
type BatchChangesCodeHostConnectionResolver interface {
	Nodes(ctx context.Context) ([]BatchChangesCodeHostResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="BatchChangesCodeHostResolver" href="#BatchChangesCodeHostResolver">type BatchChangesCodeHostResolver interface</a>

```
searchKey: graphqlbackend.BatchChangesCodeHostResolver
tags: [interface]
```

```Go
type BatchChangesCodeHostResolver interface {
	ExternalServiceKind() string
	ExternalServiceURL() string
	RequiresSSH() bool
	Credential() BatchChangesCredentialResolver
}
```

### <a id="BatchChangesConnectionResolver" href="#BatchChangesConnectionResolver">type BatchChangesConnectionResolver interface</a>

```
searchKey: graphqlbackend.BatchChangesConnectionResolver
tags: [interface]
```

```Go
type BatchChangesConnectionResolver interface {
	Nodes(ctx context.Context) ([]BatchChangeResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="BatchChangesCredentialResolver" href="#BatchChangesCredentialResolver">type BatchChangesCredentialResolver interface</a>

```
searchKey: graphqlbackend.BatchChangesCredentialResolver
tags: [interface]
```

```Go
type BatchChangesCredentialResolver interface {
	ID() graphql.ID
	ExternalServiceKind() string
	ExternalServiceURL() string
	SSHPublicKey(ctx context.Context) (*string, error)
	CreatedAt() DateTime
	IsSiteCredential() bool
}
```

### <a id="BatchChangesResolver" href="#BatchChangesResolver">type BatchChangesResolver interface</a>

```
searchKey: graphqlbackend.BatchChangesResolver
tags: [interface]
```

```Go
type BatchChangesResolver interface {
	//
	// MUTATIONS
	//
	// TODO(campaigns-deprecation)
	CreateCampaign(ctx context.Context, args *CreateCampaignArgs) (BatchChangeResolver, error)
	CreateCampaignSpec(ctx context.Context, args *CreateCampaignSpecArgs) (BatchSpecResolver, error)
	ApplyCampaign(ctx context.Context, args *ApplyCampaignArgs) (BatchChangeResolver, error)
	CloseCampaign(ctx context.Context, args *CloseCampaignArgs) (BatchChangeResolver, error)
	MoveCampaign(ctx context.Context, args *MoveCampaignArgs) (BatchChangeResolver, error)
	DeleteCampaign(ctx context.Context, args *DeleteCampaignArgs) (*EmptyResponse, error)
	CreateCampaignsCredential(ctx context.Context, args *CreateCampaignsCredentialArgs) (CampaignsCredentialResolver, error)
	DeleteCampaignsCredential(ctx context.Context, args *DeleteCampaignsCredentialArgs) (*EmptyResponse, error)
	// New:
	CreateBatchChange(ctx context.Context, args *CreateBatchChangeArgs) (BatchChangeResolver, error)
	CreateBatchSpec(ctx context.Context, args *CreateBatchSpecArgs) (BatchSpecResolver, error)
	ApplyBatchChange(ctx context.Context, args *ApplyBatchChangeArgs) (BatchChangeResolver, error)
	CloseBatchChange(ctx context.Context, args *CloseBatchChangeArgs) (BatchChangeResolver, error)
	MoveBatchChange(ctx context.Context, args *MoveBatchChangeArgs) (BatchChangeResolver, error)
	DeleteBatchChange(ctx context.Context, args *DeleteBatchChangeArgs) (*EmptyResponse, error)
	CreateBatchChangesCredential(ctx context.Context, args *CreateBatchChangesCredentialArgs) (BatchChangesCredentialResolver, error)
	DeleteBatchChangesCredential(ctx context.Context, args *DeleteBatchChangesCredentialArgs) (*EmptyResponse, error)

	CreateChangesetSpec(ctx context.Context, args *CreateChangesetSpecArgs) (ChangesetSpecResolver, error)
	SyncChangeset(ctx context.Context, args *SyncChangesetArgs) (*EmptyResponse, error)
	ReenqueueChangeset(ctx context.Context, args *ReenqueueChangesetArgs) (ChangesetResolver, error)
	DetachChangesets(ctx context.Context, args *DetachChangesetsArgs) (BulkOperationResolver, error)
	CreateChangesetComments(ctx context.Context, args *CreateChangesetCommentsArgs) (BulkOperationResolver, error)
	ReenqueueChangesets(ctx context.Context, args *ReenqueueChangesetsArgs) (BulkOperationResolver, error)
	MergeChangesets(ctx context.Context, args *MergeChangesetsArgs) (BulkOperationResolver, error)

	// TODO(campaigns-deprecation)
	Campaign(ctx context.Context, args *BatchChangeArgs) (BatchChangeResolver, error)
	Campaigns(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)
	CampaignsCodeHosts(ctx context.Context, args *ListCampaignsCodeHostsArgs) (CampaignsCodeHostConnectionResolver, error)
	// New:
	BatchChange(ctx context.Context, args *BatchChangeArgs) (BatchChangeResolver, error)
	BatchChanges(cx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)

	BatchChangesCodeHosts(ctx context.Context, args *ListBatchChangesCodeHostsArgs) (BatchChangesCodeHostConnectionResolver, error)

	NodeResolvers() map[string]NodeByIDFunc
}
```

### <a id="BatchSpecResolver" href="#BatchSpecResolver">type BatchSpecResolver interface</a>

```
searchKey: graphqlbackend.BatchSpecResolver
tags: [interface]
```

```Go
type BatchSpecResolver interface {
	ID() graphql.ID

	OriginalInput() (string, error)
	ParsedInput() (JSONValue, error)
	ChangesetSpecs(ctx context.Context, args *ChangesetSpecsConnectionArgs) (ChangesetSpecConnectionResolver, error)
	ApplyPreview(ctx context.Context, args *ChangesetApplyPreviewConnectionArgs) (ChangesetApplyPreviewConnectionResolver, error)

	Description() BatchChangeDescriptionResolver

	Creator(context.Context) (*UserResolver, error)
	CreatedAt() DateTime
	Namespace(context.Context) (*NamespaceResolver, error)

	ExpiresAt() *DateTime

	ApplyURL(ctx context.Context) (string, error)

	ViewerCanAdminister(context.Context) (bool, error)

	DiffStat(ctx context.Context) (*DiffStat, error)

	AppliesToBatchChange(ctx context.Context) (BatchChangeResolver, error)

	SupersedingBatchSpec(context.Context) (BatchSpecResolver, error)

	ViewerBatchChangesCodeHosts(ctx context.Context, args *ListViewerBatchChangesCodeHostsArgs) (BatchChangesCodeHostConnectionResolver, error)

	// TODO(campaigns-deprecation)
	// Defined so that BatchSpecResolver can act as a CampaignSpec:
	AppliesToCampaign(ctx context.Context) (BatchChangeResolver, error)
	SupersedingCampaignSpec(context.Context) (BatchSpecResolver, error)
	ViewerCampaignsCodeHosts(ctx context.Context, args *ListViewerCampaignsCodeHostsArgs) (CampaignsCodeHostConnectionResolver, error)
	// This should be removed once we remove batches. It's here so that in
	// the NodeResolver we can have the same resolver, BatchChangeResolver, act
	// as a Campaign and a BatchChange.
	ActAsCampaignSpec() bool
}
```

### <a id="BigInt" href="#BigInt">type BigInt struct</a>

```
searchKey: graphqlbackend.BigInt
tags: [struct]
```

```Go
type BigInt struct{ Int int64 }
```

BigInt implements the BigInt GraphQL scalar type. 

#### <a id="BigIntOrNil" href="#BigIntOrNil">func BigIntOrNil(int *int64) *BigInt</a>

```
searchKey: graphqlbackend.BigIntOrNil
tags: [function]
```

```Go
func BigIntOrNil(int *int64) *BigInt
```

BigIntOrNil is a helper function that returns nil for int == nil and otherwise wraps int in BigInt. 

#### <a id="BigInt.ImplementsGraphQLType" href="#BigInt.ImplementsGraphQLType">func (BigInt) ImplementsGraphQLType(name string) bool</a>

```
searchKey: graphqlbackend.BigInt.ImplementsGraphQLType
tags: [method]
```

```Go
func (BigInt) ImplementsGraphQLType(name string) bool
```

#### <a id="BigInt.MarshalJSON" href="#BigInt.MarshalJSON">func (v BigInt) MarshalJSON() ([]byte, error)</a>

```
searchKey: graphqlbackend.BigInt.MarshalJSON
tags: [method]
```

```Go
func (v BigInt) MarshalJSON() ([]byte, error)
```

#### <a id="BigInt.UnmarshalGraphQL" href="#BigInt.UnmarshalGraphQL">func (v *BigInt) UnmarshalGraphQL(input interface{}) error</a>

```
searchKey: graphqlbackend.BigInt.UnmarshalGraphQL
tags: [method]
```

```Go
func (v *BigInt) UnmarshalGraphQL(input interface{}) error
```

### <a id="BulkOperationBaseArgs" href="#BulkOperationBaseArgs">type BulkOperationBaseArgs struct</a>

```
searchKey: graphqlbackend.BulkOperationBaseArgs
tags: [struct]
```

```Go
type BulkOperationBaseArgs struct {
	BatchChange graphql.ID
	Changesets  []graphql.ID
}
```

### <a id="BulkOperationConnectionResolver" href="#BulkOperationConnectionResolver">type BulkOperationConnectionResolver interface</a>

```
searchKey: graphqlbackend.BulkOperationConnectionResolver
tags: [interface]
```

```Go
type BulkOperationConnectionResolver interface {
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
	Nodes(ctx context.Context) ([]BulkOperationResolver, error)
}
```

### <a id="BulkOperationResolver" href="#BulkOperationResolver">type BulkOperationResolver interface</a>

```
searchKey: graphqlbackend.BulkOperationResolver
tags: [interface]
```

```Go
type BulkOperationResolver interface {
	ID() graphql.ID
	Type() (string, error)
	State() string
	Progress() float64
	Errors(ctx context.Context) ([]ChangesetJobErrorResolver, error)
	Initiator(ctx context.Context) (*UserResolver, error)
	ChangesetCount() int32
	CreatedAt() DateTime
	FinishedAt() *DateTime
}
```

### <a id="CampaignsCodeHostConnectionResolver" href="#CampaignsCodeHostConnectionResolver">type CampaignsCodeHostConnectionResolver interface</a>

```
searchKey: graphqlbackend.CampaignsCodeHostConnectionResolver
tags: [interface]
```

```Go
type CampaignsCodeHostConnectionResolver interface {
	Nodes(ctx context.Context) ([]CampaignsCodeHostResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

TODO(campaigns-deprecation) 

### <a id="CampaignsCodeHostResolver" href="#CampaignsCodeHostResolver">type CampaignsCodeHostResolver interface</a>

```
searchKey: graphqlbackend.CampaignsCodeHostResolver
tags: [interface]
```

```Go
type CampaignsCodeHostResolver interface {
	ExternalServiceKind() string
	ExternalServiceURL() string
	RequiresSSH() bool
	Credential() CampaignsCredentialResolver
}
```

TODO(campaigns-deprecation) 

### <a id="CampaignsCredentialResolver" href="#CampaignsCredentialResolver">type CampaignsCredentialResolver interface</a>

```
searchKey: graphqlbackend.CampaignsCredentialResolver
tags: [interface]
```

```Go
type CampaignsCredentialResolver interface {
	ID() graphql.ID
	ExternalServiceKind() string
	ExternalServiceURL() string
	SSHPublicKey(ctx context.Context) (*string, error)
	CreatedAt() DateTime
}
```

TODO(campaigns-deprecation) 

### <a id="ChangesetApplyPreviewConnectionArgs" href="#ChangesetApplyPreviewConnectionArgs">type ChangesetApplyPreviewConnectionArgs struct</a>

```
searchKey: graphqlbackend.ChangesetApplyPreviewConnectionArgs
tags: [struct]
```

```Go
type ChangesetApplyPreviewConnectionArgs struct {
	First  int32
	After  *string
	Search *string
	// CurrentState is a value of type btypes.ChangesetState.
	CurrentState *string
	// Action is a value of type btypes.ReconcilerOperation.
	Action *string
}
```

### <a id="ChangesetApplyPreviewConnectionResolver" href="#ChangesetApplyPreviewConnectionResolver">type ChangesetApplyPreviewConnectionResolver interface</a>

```
searchKey: graphqlbackend.ChangesetApplyPreviewConnectionResolver
tags: [interface]
```

```Go
type ChangesetApplyPreviewConnectionResolver interface {
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
	Nodes(ctx context.Context) ([]ChangesetApplyPreviewResolver, error)
	Stats(ctx context.Context) (ChangesetApplyPreviewConnectionStatsResolver, error)
}
```

### <a id="ChangesetApplyPreviewConnectionStatsResolver" href="#ChangesetApplyPreviewConnectionStatsResolver">type ChangesetApplyPreviewConnectionStatsResolver interface</a>

```
searchKey: graphqlbackend.ChangesetApplyPreviewConnectionStatsResolver
tags: [interface]
```

```Go
type ChangesetApplyPreviewConnectionStatsResolver interface {
	Push() int32
	Update() int32
	Undraft() int32
	Publish() int32
	PublishDraft() int32
	Sync() int32
	Import() int32
	Close() int32
	Reopen() int32
	Sleep() int32
	Detach() int32
	Archive() int32

	Added() int32
	Modified() int32
	Removed() int32
}
```

### <a id="ChangesetApplyPreviewResolver" href="#ChangesetApplyPreviewResolver">type ChangesetApplyPreviewResolver interface</a>

```
searchKey: graphqlbackend.ChangesetApplyPreviewResolver
tags: [interface]
```

```Go
type ChangesetApplyPreviewResolver interface {
	ToVisibleChangesetApplyPreview() (VisibleChangesetApplyPreviewResolver, bool)
	ToHiddenChangesetApplyPreview() (HiddenChangesetApplyPreviewResolver, bool)
}
```

### <a id="ChangesetCountsArgs" href="#ChangesetCountsArgs">type ChangesetCountsArgs struct</a>

```
searchKey: graphqlbackend.ChangesetCountsArgs
tags: [struct]
```

```Go
type ChangesetCountsArgs struct {
	From            *DateTime
	To              *DateTime
	IncludeArchived bool
}
```

### <a id="ChangesetCountsResolver" href="#ChangesetCountsResolver">type ChangesetCountsResolver interface</a>

```
searchKey: graphqlbackend.ChangesetCountsResolver
tags: [interface]
```

```Go
type ChangesetCountsResolver interface {
	Date() DateTime
	Total() int32
	Merged() int32
	Closed() int32
	Draft() int32
	Open() int32
	OpenApproved() int32
	OpenChangesRequested() int32
	OpenPending() int32
}
```

### <a id="ChangesetDescription" href="#ChangesetDescription">type ChangesetDescription interface</a>

```
searchKey: graphqlbackend.ChangesetDescription
tags: [interface]
```

```Go
type ChangesetDescription interface {
	ToExistingChangesetReference() (ExistingChangesetReferenceResolver, bool)
	ToGitBranchChangesetDescription() (GitBranchChangesetDescriptionResolver, bool)
}
```

### <a id="ChangesetEventResolver" href="#ChangesetEventResolver">type ChangesetEventResolver interface</a>

```
searchKey: graphqlbackend.ChangesetEventResolver
tags: [interface]
```

```Go
type ChangesetEventResolver interface {
	ID() graphql.ID
	Changeset() ExternalChangesetResolver
	CreatedAt() DateTime
}
```

### <a id="ChangesetEventsConnectionArgs" href="#ChangesetEventsConnectionArgs">type ChangesetEventsConnectionArgs struct</a>

```
searchKey: graphqlbackend.ChangesetEventsConnectionArgs
tags: [struct]
```

```Go
type ChangesetEventsConnectionArgs struct {
	First int32
	After *string
}
```

### <a id="ChangesetEventsConnectionResolver" href="#ChangesetEventsConnectionResolver">type ChangesetEventsConnectionResolver interface</a>

```
searchKey: graphqlbackend.ChangesetEventsConnectionResolver
tags: [interface]
```

```Go
type ChangesetEventsConnectionResolver interface {
	Nodes(ctx context.Context) ([]ChangesetEventResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="ChangesetJobErrorResolver" href="#ChangesetJobErrorResolver">type ChangesetJobErrorResolver interface</a>

```
searchKey: graphqlbackend.ChangesetJobErrorResolver
tags: [interface]
```

```Go
type ChangesetJobErrorResolver interface {
	Changeset() ChangesetResolver
	Error() *string
}
```

### <a id="ChangesetLabelResolver" href="#ChangesetLabelResolver">type ChangesetLabelResolver interface</a>

```
searchKey: graphqlbackend.ChangesetLabelResolver
tags: [interface]
```

```Go
type ChangesetLabelResolver interface {
	Text() string
	Color() string
	Description() *string
}
```

### <a id="ChangesetResolver" href="#ChangesetResolver">type ChangesetResolver interface</a>

```
searchKey: graphqlbackend.ChangesetResolver
tags: [interface]
```

```Go
type ChangesetResolver interface {
	ID() graphql.ID

	CreatedAt() DateTime
	UpdatedAt() DateTime
	NextSyncAt(ctx context.Context) (*DateTime, error)
	// PublicationState returns a value of type btypes.ChangesetPublicationState.
	PublicationState() string
	// ReconcilerState returns a value of type btypes.ReconcilerState.
	ReconcilerState() string
	// ExternalState returns a value of type *btypes.ChangesetExternalState.
	ExternalState() *string
	// State returns a value of type *btypes.ChangesetState.
	State() (string, error)
	BatchChanges(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)

	ToExternalChangeset() (ExternalChangesetResolver, bool)
	ToHiddenExternalChangeset() (HiddenExternalChangesetResolver, bool)

	// TODO(campaigns-deprecation):
	Campaigns(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)
}
```

ChangesetResolver is the "interface Changeset" in the GraphQL schema and is implemented by ExternalChangesetResolver and HiddenExternalChangesetResolver. 

### <a id="ChangesetSpecConnectionResolver" href="#ChangesetSpecConnectionResolver">type ChangesetSpecConnectionResolver interface</a>

```
searchKey: graphqlbackend.ChangesetSpecConnectionResolver
tags: [interface]
```

```Go
type ChangesetSpecConnectionResolver interface {
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
	Nodes(ctx context.Context) ([]ChangesetSpecResolver, error)
}
```

### <a id="ChangesetSpecDeltaResolver" href="#ChangesetSpecDeltaResolver">type ChangesetSpecDeltaResolver interface</a>

```
searchKey: graphqlbackend.ChangesetSpecDeltaResolver
tags: [interface]
```

```Go
type ChangesetSpecDeltaResolver interface {
	TitleChanged() bool
	BodyChanged() bool
	Undraft() bool
	BaseRefChanged() bool
	DiffChanged() bool
	CommitMessageChanged() bool
	AuthorNameChanged() bool
	AuthorEmailChanged() bool
}
```

### <a id="ChangesetSpecResolver" href="#ChangesetSpecResolver">type ChangesetSpecResolver interface</a>

```
searchKey: graphqlbackend.ChangesetSpecResolver
tags: [interface]
```

```Go
type ChangesetSpecResolver interface {
	ID() graphql.ID
	// Type returns a value of type btypes.ChangesetSpecDescriptionType.
	Type() string
	ExpiresAt() *DateTime

	ToHiddenChangesetSpec() (HiddenChangesetSpecResolver, bool)
	ToVisibleChangesetSpec() (VisibleChangesetSpecResolver, bool)
}
```

### <a id="ChangesetSpecsConnectionArgs" href="#ChangesetSpecsConnectionArgs">type ChangesetSpecsConnectionArgs struct</a>

```
searchKey: graphqlbackend.ChangesetSpecsConnectionArgs
tags: [struct]
```

```Go
type ChangesetSpecsConnectionArgs struct {
	First int32
	After *string
}
```

### <a id="ChangesetsConnectionResolver" href="#ChangesetsConnectionResolver">type ChangesetsConnectionResolver interface</a>

```
searchKey: graphqlbackend.ChangesetsConnectionResolver
tags: [interface]
```

```Go
type ChangesetsConnectionResolver interface {
	Nodes(ctx context.Context) ([]ChangesetResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="ChangesetsStatsResolver" href="#ChangesetsStatsResolver">type ChangesetsStatsResolver interface</a>

```
searchKey: graphqlbackend.ChangesetsStatsResolver
tags: [interface]
```

```Go
type ChangesetsStatsResolver interface {
	Retrying() int32
	Failed() int32
	Scheduled() int32
	Processing() int32
	Unpublished() int32
	Draft() int32
	Open() int32
	Merged() int32
	Closed() int32
	Deleted() int32
	Archived() int32
	Total() int32
}
```

### <a id="CloseBatchChangeArgs" href="#CloseBatchChangeArgs">type CloseBatchChangeArgs struct</a>

```
searchKey: graphqlbackend.CloseBatchChangeArgs
tags: [struct]
```

```Go
type CloseBatchChangeArgs struct {
	BatchChange     graphql.ID
	CloseChangesets bool
}
```

### <a id="CloseCampaignArgs" href="#CloseCampaignArgs">type CloseCampaignArgs struct</a>

```
searchKey: graphqlbackend.CloseCampaignArgs
tags: [struct]
```

```Go
type CloseCampaignArgs struct {
	Campaign        graphql.ID
	CloseChangesets bool
}
```

TODO(campaigns-deprecation) 

### <a id="CodeIntelResolver" href="#CodeIntelResolver">type CodeIntelResolver interface</a>

```
searchKey: graphqlbackend.CodeIntelResolver
tags: [interface]
```

```Go
type CodeIntelResolver interface {
	LSIFUploadByID(ctx context.Context, id graphql.ID) (LSIFUploadResolver, error)
	LSIFUploads(ctx context.Context, args *LSIFUploadsQueryArgs) (LSIFUploadConnectionResolver, error)
	LSIFUploadsByRepo(ctx context.Context, args *LSIFRepositoryUploadsQueryArgs) (LSIFUploadConnectionResolver, error)
	DeleteLSIFUpload(ctx context.Context, args *struct{ ID graphql.ID }) (*EmptyResponse, error)
	LSIFIndexByID(ctx context.Context, id graphql.ID) (LSIFIndexResolver, error)
	LSIFIndexes(ctx context.Context, args *LSIFIndexesQueryArgs) (LSIFIndexConnectionResolver, error)
	LSIFIndexesByRepo(ctx context.Context, args *LSIFRepositoryIndexesQueryArgs) (LSIFIndexConnectionResolver, error)
	DeleteLSIFIndex(ctx context.Context, args *struct{ ID graphql.ID }) (*EmptyResponse, error)
	IndexConfiguration(ctx context.Context, id graphql.ID) (IndexConfigurationResolver, error) // TODO - rename ...ForRepo
	UpdateRepositoryIndexConfiguration(ctx context.Context, args *UpdateRepositoryIndexConfigurationArgs) (*EmptyResponse, error)
	CommitGraph(ctx context.Context, id graphql.ID) (CodeIntelligenceCommitGraphResolver, error)
	QueueAutoIndexJobForRepo(ctx context.Context, args *struct{ Repository graphql.ID }) (*EmptyResponse, error)
	GitBlobLSIFData(ctx context.Context, args *GitBlobLSIFDataArgs) (GitBlobLSIFDataResolver, error)

	NodeResolvers() map[string]NodeByIDFunc
}
```

### <a id="CodeIntelligenceCommitGraphResolver" href="#CodeIntelligenceCommitGraphResolver">type CodeIntelligenceCommitGraphResolver interface</a>

```
searchKey: graphqlbackend.CodeIntelligenceCommitGraphResolver
tags: [interface]
```

```Go
type CodeIntelligenceCommitGraphResolver interface {
	Stale(ctx context.Context) (bool, error)
	UpdatedAt(ctx context.Context) (*DateTime, error)
}
```

### <a id="CodeIntelligenceRangeConnectionResolver" href="#CodeIntelligenceRangeConnectionResolver">type CodeIntelligenceRangeConnectionResolver interface</a>

```
searchKey: graphqlbackend.CodeIntelligenceRangeConnectionResolver
tags: [interface]
```

```Go
type CodeIntelligenceRangeConnectionResolver interface {
	Nodes(ctx context.Context) ([]CodeIntelligenceRangeResolver, error)
}
```

### <a id="CodeIntelligenceRangeResolver" href="#CodeIntelligenceRangeResolver">type CodeIntelligenceRangeResolver interface</a>

```
searchKey: graphqlbackend.CodeIntelligenceRangeResolver
tags: [interface]
```

```Go
type CodeIntelligenceRangeResolver interface {
	Range(ctx context.Context) (RangeResolver, error)
	Definitions(ctx context.Context) (LocationConnectionResolver, error)
	References(ctx context.Context) (LocationConnectionResolver, error)
	Hover(ctx context.Context) (HoverResolver, error)
}
```

### <a id="CodeMonitorsResolver" href="#CodeMonitorsResolver">type CodeMonitorsResolver interface</a>

```
searchKey: graphqlbackend.CodeMonitorsResolver
tags: [interface]
```

```Go
type CodeMonitorsResolver interface {
	// Query
	Monitors(ctx context.Context, userID int32, args *ListMonitorsArgs) (MonitorConnectionResolver, error)
	MonitorByID(ctx context.Context, id graphql.ID) (MonitorResolver, error)

	// Mutations
	CreateCodeMonitor(ctx context.Context, args *CreateCodeMonitorArgs) (MonitorResolver, error)
	ToggleCodeMonitor(ctx context.Context, args *ToggleCodeMonitorArgs) (MonitorResolver, error)
	DeleteCodeMonitor(ctx context.Context, args *DeleteCodeMonitorArgs) (*EmptyResponse, error)
	UpdateCodeMonitor(ctx context.Context, args *UpdateCodeMonitorArgs) (MonitorResolver, error)
	ResetTriggerQueryTimestamps(ctx context.Context, args *ResetTriggerQueryTimestampsArgs) (*EmptyResponse, error)
	TriggerTestEmailAction(ctx context.Context, args *TriggerTestEmailActionArgs) (*EmptyResponse, error)

	NodeResolvers() map[string]NodeByIDFunc
}
```

### <a id="CommitSearchResultResolver" href="#CommitSearchResultResolver">type CommitSearchResultResolver struct</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver
tags: [struct]
```

```Go
type CommitSearchResultResolver struct {
	result.CommitMatch

	db dbutil.DB

	// gitCommitResolver should not be used directly since it may be uninitialized.
	// Use Commit() instead.
	gitCommitResolver *GitCommitResolver
	gitCommitOnce     sync.Once
}
```

CommitSearchResultResolver is a resolver for the GraphQL type `CommitSearchResult` 

#### <a id="CommitSearchResultResolver.Commit" href="#CommitSearchResultResolver.Commit">func (r *CommitSearchResultResolver) Commit() *GitCommitResolver</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.Commit
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) Commit() *GitCommitResolver
```

#### <a id="CommitSearchResultResolver.Detail" href="#CommitSearchResultResolver.Detail">func (r *CommitSearchResultResolver) Detail() Markdown</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.Detail
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) Detail() Markdown
```

#### <a id="CommitSearchResultResolver.DiffPreview" href="#CommitSearchResultResolver.DiffPreview">func (r *CommitSearchResultResolver) DiffPreview() *highlightedStringResolver</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.DiffPreview
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) DiffPreview() *highlightedStringResolver
```

#### <a id="CommitSearchResultResolver.Label" href="#CommitSearchResultResolver.Label">func (r *CommitSearchResultResolver) Label() Markdown</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.Label
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) Label() Markdown
```

#### <a id="CommitSearchResultResolver.Matches" href="#CommitSearchResultResolver.Matches">func (r *CommitSearchResultResolver) Matches() []*searchResultMatchResolver</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.Matches
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) Matches() []*searchResultMatchResolver
```

#### <a id="CommitSearchResultResolver.MessagePreview" href="#CommitSearchResultResolver.MessagePreview">func (r *CommitSearchResultResolver) MessagePreview() *highlightedStringResolver</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.MessagePreview
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) MessagePreview() *highlightedStringResolver
```

#### <a id="CommitSearchResultResolver.Refs" href="#CommitSearchResultResolver.Refs">func (r *CommitSearchResultResolver) Refs() []*GitRefResolver</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.Refs
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) Refs() []*GitRefResolver
```

#### <a id="CommitSearchResultResolver.ResultCount" href="#CommitSearchResultResolver.ResultCount">func (r *CommitSearchResultResolver) ResultCount() int32</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.ResultCount
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) ResultCount() int32
```

#### <a id="CommitSearchResultResolver.SourceRefs" href="#CommitSearchResultResolver.SourceRefs">func (r *CommitSearchResultResolver) SourceRefs() []*GitRefResolver</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.SourceRefs
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) SourceRefs() []*GitRefResolver
```

#### <a id="CommitSearchResultResolver.ToCommitSearchResult" href="#CommitSearchResultResolver.ToCommitSearchResult">func (r *CommitSearchResultResolver) ToCommitSearchResult() (*CommitSearchResultResolver, bool)</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.ToCommitSearchResult
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) ToCommitSearchResult() (*CommitSearchResultResolver, bool)
```

#### <a id="CommitSearchResultResolver.ToFileMatch" href="#CommitSearchResultResolver.ToFileMatch">func (r *CommitSearchResultResolver) ToFileMatch() (*FileMatchResolver, bool)</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.ToFileMatch
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) ToFileMatch() (*FileMatchResolver, bool)
```

#### <a id="CommitSearchResultResolver.ToRepository" href="#CommitSearchResultResolver.ToRepository">func (r *CommitSearchResultResolver) ToRepository() (*RepositoryResolver, bool)</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.ToRepository
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) ToRepository() (*RepositoryResolver, bool)
```

#### <a id="CommitSearchResultResolver.URL" href="#CommitSearchResultResolver.URL">func (r *CommitSearchResultResolver) URL() string</a>

```
searchKey: graphqlbackend.CommitSearchResultResolver.URL
tags: [method]
```

```Go
func (r *CommitSearchResultResolver) URL() string
```

### <a id="ComputeDiffFunc" href="#ComputeDiffFunc">type ComputeDiffFunc func(ctx context.Context, args *github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.FileDiffsConnectionArgs) ([]*github.com/sourcegraph/go-diff/diff.FileDiff, int32, bool, error)</a>

```
searchKey: graphqlbackend.ComputeDiffFunc
tags: [function]
```

```Go
type ComputeDiffFunc func(ctx context.Context, args *FileDiffsConnectionArgs) ([]*diff.FileDiff, int32, bool, error)
```

ComputeDiffFunc is a function that computes FileDiffs for the given args. It returns the diffs, the starting index from which to return entries (`after` param), whether there's a next page, and an optional error. 

#### <a id="computeRepositoryComparisonDiff" href="#computeRepositoryComparisonDiff">func computeRepositoryComparisonDiff(cmp *RepositoryComparisonResolver) ComputeDiffFunc</a>

```
searchKey: graphqlbackend.computeRepositoryComparisonDiff
tags: [function private]
```

```Go
func computeRepositoryComparisonDiff(cmp *RepositoryComparisonResolver) ComputeDiffFunc
```

computeRepositoryComparisonDiff returns a ComputeDiffFunc for the given RepositoryComparisonResolver. 

### <a id="CreateActionArgs" href="#CreateActionArgs">type CreateActionArgs struct</a>

```
searchKey: graphqlbackend.CreateActionArgs
tags: [struct]
```

```Go
type CreateActionArgs struct {
	Email *CreateActionEmailArgs
}
```

### <a id="CreateActionEmailArgs" href="#CreateActionEmailArgs">type CreateActionEmailArgs struct</a>

```
searchKey: graphqlbackend.CreateActionEmailArgs
tags: [struct]
```

```Go
type CreateActionEmailArgs struct {
	Enabled    bool
	Priority   string
	Recipients []graphql.ID
	Header     string
}
```

### <a id="CreateBatchChangeArgs" href="#CreateBatchChangeArgs">type CreateBatchChangeArgs struct</a>

```
searchKey: graphqlbackend.CreateBatchChangeArgs
tags: [struct]
```

```Go
type CreateBatchChangeArgs struct {
	BatchSpec graphql.ID
}
```

### <a id="CreateBatchChangesCredentialArgs" href="#CreateBatchChangesCredentialArgs">type CreateBatchChangesCredentialArgs struct</a>

```
searchKey: graphqlbackend.CreateBatchChangesCredentialArgs
tags: [struct]
```

```Go
type CreateBatchChangesCredentialArgs struct {
	ExternalServiceKind string
	ExternalServiceURL  string
	User                *graphql.ID
	Credential          string
}
```

### <a id="CreateBatchSpecArgs" href="#CreateBatchSpecArgs">type CreateBatchSpecArgs struct</a>

```
searchKey: graphqlbackend.CreateBatchSpecArgs
tags: [struct]
```

```Go
type CreateBatchSpecArgs struct {
	Namespace graphql.ID

	BatchSpec      string
	ChangesetSpecs []graphql.ID
}
```

### <a id="CreateCampaignArgs" href="#CreateCampaignArgs">type CreateCampaignArgs struct</a>

```
searchKey: graphqlbackend.CreateCampaignArgs
tags: [struct]
```

```Go
type CreateCampaignArgs struct {
	CampaignSpec graphql.ID
}
```

TODO(campaigns-deprecation) 

### <a id="CreateCampaignSpecArgs" href="#CreateCampaignSpecArgs">type CreateCampaignSpecArgs struct</a>

```
searchKey: graphqlbackend.CreateCampaignSpecArgs
tags: [struct]
```

```Go
type CreateCampaignSpecArgs struct {
	Namespace graphql.ID

	CampaignSpec   string
	ChangesetSpecs []graphql.ID
}
```

TODO(campaigns-deprecation) 

### <a id="CreateCampaignsCredentialArgs" href="#CreateCampaignsCredentialArgs">type CreateCampaignsCredentialArgs struct</a>

```
searchKey: graphqlbackend.CreateCampaignsCredentialArgs
tags: [struct]
```

```Go
type CreateCampaignsCredentialArgs struct {
	ExternalServiceKind string
	ExternalServiceURL  string
	User                graphql.ID
	Credential          string
}
```

TODO(campaigns-deprecation) 

### <a id="CreateChangesetCommentsArgs" href="#CreateChangesetCommentsArgs">type CreateChangesetCommentsArgs struct</a>

```
searchKey: graphqlbackend.CreateChangesetCommentsArgs
tags: [struct]
```

```Go
type CreateChangesetCommentsArgs struct {
	BulkOperationBaseArgs
	Body string
}
```

### <a id="CreateChangesetSpecArgs" href="#CreateChangesetSpecArgs">type CreateChangesetSpecArgs struct</a>

```
searchKey: graphqlbackend.CreateChangesetSpecArgs
tags: [struct]
```

```Go
type CreateChangesetSpecArgs struct {
	ChangesetSpec string
}
```

### <a id="CreateCodeMonitorArgs" href="#CreateCodeMonitorArgs">type CreateCodeMonitorArgs struct</a>

```
searchKey: graphqlbackend.CreateCodeMonitorArgs
tags: [struct]
```

```Go
type CreateCodeMonitorArgs struct {
	Monitor *CreateMonitorArgs
	Trigger *CreateTriggerArgs
	Actions []*CreateActionArgs
}
```

### <a id="CreateMonitorArgs" href="#CreateMonitorArgs">type CreateMonitorArgs struct</a>

```
searchKey: graphqlbackend.CreateMonitorArgs
tags: [struct]
```

```Go
type CreateMonitorArgs struct {
	Namespace   graphql.ID
	Description string
	Enabled     bool
}
```

### <a id="CreatePaidProductSubscriptionArgs" href="#CreatePaidProductSubscriptionArgs">type CreatePaidProductSubscriptionArgs struct</a>

```
searchKey: graphqlbackend.CreatePaidProductSubscriptionArgs
tags: [struct]
```

```Go
type CreatePaidProductSubscriptionArgs struct {
	AccountID           graphql.ID
	ProductSubscription ProductSubscriptionInput
	PaymentToken        *string
}
```

### <a id="CreatePaidProductSubscriptionResult" href="#CreatePaidProductSubscriptionResult">type CreatePaidProductSubscriptionResult struct</a>

```
searchKey: graphqlbackend.CreatePaidProductSubscriptionResult
tags: [struct]
```

```Go
type CreatePaidProductSubscriptionResult struct {
	ProductSubscriptionValue ProductSubscription
}
```

CreatePaidProductSubscriptionResult implements the GraphQL type CreatePaidProductSubscriptionResult. 

#### <a id="CreatePaidProductSubscriptionResult.ProductSubscription" href="#CreatePaidProductSubscriptionResult.ProductSubscription">func (r *CreatePaidProductSubscriptionResult) ProductSubscription() ProductSubscription</a>

```
searchKey: graphqlbackend.CreatePaidProductSubscriptionResult.ProductSubscription
tags: [method]
```

```Go
func (r *CreatePaidProductSubscriptionResult) ProductSubscription() ProductSubscription
```

### <a id="CreateProductSubscriptionArgs" href="#CreateProductSubscriptionArgs">type CreateProductSubscriptionArgs struct</a>

```
searchKey: graphqlbackend.CreateProductSubscriptionArgs
tags: [struct]
```

```Go
type CreateProductSubscriptionArgs struct {
	AccountID graphql.ID
}
```

### <a id="CreateTriggerArgs" href="#CreateTriggerArgs">type CreateTriggerArgs struct</a>

```
searchKey: graphqlbackend.CreateTriggerArgs
tags: [struct]
```

```Go
type CreateTriggerArgs struct {
	Query string
}
```

### <a id="DateTime" href="#DateTime">type DateTime struct</a>

```
searchKey: graphqlbackend.DateTime
tags: [struct]
```

```Go
type DateTime struct{ time.Time }
```

DateTime implements the DateTime GraphQL scalar type. 

#### <a id="DateTimeOrNil" href="#DateTimeOrNil">func DateTimeOrNil(time *time.Time) *DateTime</a>

```
searchKey: graphqlbackend.DateTimeOrNil
tags: [function]
```

```Go
func DateTimeOrNil(time *time.Time) *DateTime
```

DateTimeOrNil is a helper function that returns nil for time == nil and otherwise wraps time in DateTime. 

#### <a id="DateTime.ImplementsGraphQLType" href="#DateTime.ImplementsGraphQLType">func (DateTime) ImplementsGraphQLType(name string) bool</a>

```
searchKey: graphqlbackend.DateTime.ImplementsGraphQLType
tags: [method]
```

```Go
func (DateTime) ImplementsGraphQLType(name string) bool
```

#### <a id="DateTime.MarshalJSON" href="#DateTime.MarshalJSON">func (v DateTime) MarshalJSON() ([]byte, error)</a>

```
searchKey: graphqlbackend.DateTime.MarshalJSON
tags: [method]
```

```Go
func (v DateTime) MarshalJSON() ([]byte, error)
```

#### <a id="DateTime.UnmarshalGraphQL" href="#DateTime.UnmarshalGraphQL">func (v *DateTime) UnmarshalGraphQL(input interface{}) error</a>

```
searchKey: graphqlbackend.DateTime.UnmarshalGraphQL
tags: [method]
```

```Go
func (v *DateTime) UnmarshalGraphQL(input interface{}) error
```

### <a id="DeleteBatchChangeArgs" href="#DeleteBatchChangeArgs">type DeleteBatchChangeArgs struct</a>

```
searchKey: graphqlbackend.DeleteBatchChangeArgs
tags: [struct]
```

```Go
type DeleteBatchChangeArgs struct {
	BatchChange graphql.ID
}
```

### <a id="DeleteBatchChangesCredentialArgs" href="#DeleteBatchChangesCredentialArgs">type DeleteBatchChangesCredentialArgs struct</a>

```
searchKey: graphqlbackend.DeleteBatchChangesCredentialArgs
tags: [struct]
```

```Go
type DeleteBatchChangesCredentialArgs struct {
	BatchChangesCredential graphql.ID
}
```

### <a id="DeleteCampaignArgs" href="#DeleteCampaignArgs">type DeleteCampaignArgs struct</a>

```
searchKey: graphqlbackend.DeleteCampaignArgs
tags: [struct]
```

```Go
type DeleteCampaignArgs struct {
	Campaign graphql.ID
}
```

TODO(campaigns-deprecation) 

### <a id="DeleteCampaignsCredentialArgs" href="#DeleteCampaignsCredentialArgs">type DeleteCampaignsCredentialArgs struct</a>

```
searchKey: graphqlbackend.DeleteCampaignsCredentialArgs
tags: [struct]
```

```Go
type DeleteCampaignsCredentialArgs struct {
	CampaignsCredential graphql.ID
}
```

TODO(campaigns-deprecation) 

### <a id="DeleteCodeMonitorArgs" href="#DeleteCodeMonitorArgs">type DeleteCodeMonitorArgs struct</a>

```
searchKey: graphqlbackend.DeleteCodeMonitorArgs
tags: [struct]
```

```Go
type DeleteCodeMonitorArgs struct {
	Id graphql.ID
}
```

### <a id="DetachChangesetsArgs" href="#DetachChangesetsArgs">type DetachChangesetsArgs struct</a>

```
searchKey: graphqlbackend.DetachChangesetsArgs
tags: [struct]
```

```Go
type DetachChangesetsArgs struct {
	BulkOperationBaseArgs
}
```

### <a id="DiagnosticConnectionResolver" href="#DiagnosticConnectionResolver">type DiagnosticConnectionResolver interface</a>

```
searchKey: graphqlbackend.DiagnosticConnectionResolver
tags: [interface]
```

```Go
type DiagnosticConnectionResolver interface {
	Nodes(ctx context.Context) ([]DiagnosticResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="DiagnosticResolver" href="#DiagnosticResolver">type DiagnosticResolver interface</a>

```
searchKey: graphqlbackend.DiagnosticResolver
tags: [interface]
```

```Go
type DiagnosticResolver interface {
	Severity() (*string, error)
	Code() (*string, error)
	Source() (*string, error)
	Message() (*string, error)
	Location(ctx context.Context) (LocationResolver, error)
}
```

### <a id="DiffHunk" href="#DiffHunk">type DiffHunk struct</a>

```
searchKey: graphqlbackend.DiffHunk
tags: [struct]
```

```Go
type DiffHunk struct {
	hunk        *diff.Hunk
	highlighter FileDiffHighlighter
}
```

#### <a id="NewDiffHunk" href="#NewDiffHunk">func NewDiffHunk(hunk *diff.Hunk, highlighter FileDiffHighlighter) *DiffHunk</a>

```
searchKey: graphqlbackend.NewDiffHunk
tags: [function]
```

```Go
func NewDiffHunk(hunk *diff.Hunk, highlighter FileDiffHighlighter) *DiffHunk
```

#### <a id="DiffHunk.Body" href="#DiffHunk.Body">func (r *DiffHunk) Body() string</a>

```
searchKey: graphqlbackend.DiffHunk.Body
tags: [method]
```

```Go
func (r *DiffHunk) Body() string
```

#### <a id="DiffHunk.Highlight" href="#DiffHunk.Highlight">func (r *DiffHunk) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedDiffHunkBodyResolver, error)</a>

```
searchKey: graphqlbackend.DiffHunk.Highlight
tags: [method]
```

```Go
func (r *DiffHunk) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedDiffHunkBodyResolver, error)
```

#### <a id="DiffHunk.NewRange" href="#DiffHunk.NewRange">func (r *DiffHunk) NewRange() *DiffHunkRange</a>

```
searchKey: graphqlbackend.DiffHunk.NewRange
tags: [method]
```

```Go
func (r *DiffHunk) NewRange() *DiffHunkRange
```

#### <a id="DiffHunk.OldNoNewlineAt" href="#DiffHunk.OldNoNewlineAt">func (r *DiffHunk) OldNoNewlineAt() bool</a>

```
searchKey: graphqlbackend.DiffHunk.OldNoNewlineAt
tags: [method]
```

```Go
func (r *DiffHunk) OldNoNewlineAt() bool
```

#### <a id="DiffHunk.OldRange" href="#DiffHunk.OldRange">func (r *DiffHunk) OldRange() *DiffHunkRange</a>

```
searchKey: graphqlbackend.DiffHunk.OldRange
tags: [method]
```

```Go
func (r *DiffHunk) OldRange() *DiffHunkRange
```

#### <a id="DiffHunk.Section" href="#DiffHunk.Section">func (r *DiffHunk) Section() *string</a>

```
searchKey: graphqlbackend.DiffHunk.Section
tags: [method]
```

```Go
func (r *DiffHunk) Section() *string
```

### <a id="DiffHunkRange" href="#DiffHunkRange">type DiffHunkRange struct</a>

```
searchKey: graphqlbackend.DiffHunkRange
tags: [struct]
```

```Go
type DiffHunkRange struct {
	startLine int32
	lines     int32
}
```

#### <a id="NewDiffHunkRange" href="#NewDiffHunkRange">func NewDiffHunkRange(startLine, lines int32) *DiffHunkRange</a>

```
searchKey: graphqlbackend.NewDiffHunkRange
tags: [function]
```

```Go
func NewDiffHunkRange(startLine, lines int32) *DiffHunkRange
```

#### <a id="DiffHunkRange.Lines" href="#DiffHunkRange.Lines">func (r *DiffHunkRange) Lines() int32</a>

```
searchKey: graphqlbackend.DiffHunkRange.Lines
tags: [method]
```

```Go
func (r *DiffHunkRange) Lines() int32
```

#### <a id="DiffHunkRange.StartLine" href="#DiffHunkRange.StartLine">func (r *DiffHunkRange) StartLine() int32</a>

```
searchKey: graphqlbackend.DiffHunkRange.StartLine
tags: [method]
```

```Go
func (r *DiffHunkRange) StartLine() int32
```

### <a id="DiffStat" href="#DiffStat">type DiffStat struct</a>

```
searchKey: graphqlbackend.DiffStat
tags: [struct]
```

```Go
type DiffStat struct{ added, changed, deleted int32 }
```

#### <a id="NewDiffStat" href="#NewDiffStat">func NewDiffStat(s diff.Stat) *DiffStat</a>

```
searchKey: graphqlbackend.NewDiffStat
tags: [function]
```

```Go
func NewDiffStat(s diff.Stat) *DiffStat
```

#### <a id="DiffStat.AddDiffStat" href="#DiffStat.AddDiffStat">func (r *DiffStat) AddDiffStat(s *DiffStat)</a>

```
searchKey: graphqlbackend.DiffStat.AddDiffStat
tags: [method]
```

```Go
func (r *DiffStat) AddDiffStat(s *DiffStat)
```

#### <a id="DiffStat.AddStat" href="#DiffStat.AddStat">func (r *DiffStat) AddStat(s diff.Stat)</a>

```
searchKey: graphqlbackend.DiffStat.AddStat
tags: [method]
```

```Go
func (r *DiffStat) AddStat(s diff.Stat)
```

#### <a id="DiffStat.Added" href="#DiffStat.Added">func (r *DiffStat) Added() int32</a>

```
searchKey: graphqlbackend.DiffStat.Added
tags: [method]
```

```Go
func (r *DiffStat) Added() int32
```

#### <a id="DiffStat.Changed" href="#DiffStat.Changed">func (r *DiffStat) Changed() int32</a>

```
searchKey: graphqlbackend.DiffStat.Changed
tags: [method]
```

```Go
func (r *DiffStat) Changed() int32
```

#### <a id="DiffStat.Deleted" href="#DiffStat.Deleted">func (r *DiffStat) Deleted() int32</a>

```
searchKey: graphqlbackend.DiffStat.Deleted
tags: [method]
```

```Go
func (r *DiffStat) Deleted() int32
```

### <a id="DocumentationPageResolver" href="#DocumentationPageResolver">type DocumentationPageResolver interface</a>

```
searchKey: graphqlbackend.DocumentationPageResolver
tags: [interface]
```

```Go
type DocumentationPageResolver interface {
	Tree() JSONValue
}
```

### <a id="DotcomResolver" href="#DotcomResolver">type DotcomResolver interface</a>

```
searchKey: graphqlbackend.DotcomResolver
tags: [interface]
```

```Go
type DotcomResolver interface {
	// DotcomMutation
	SetUserBilling(context.Context, *SetUserBillingArgs) (*EmptyResponse, error)
	CreateProductSubscription(context.Context, *CreateProductSubscriptionArgs) (ProductSubscription, error)
	SetProductSubscriptionBilling(context.Context, *SetProductSubscriptionBillingArgs) (*EmptyResponse, error)
	GenerateProductLicenseForSubscription(context.Context, *GenerateProductLicenseForSubscriptionArgs) (ProductLicense, error)
	CreatePaidProductSubscription(context.Context, *CreatePaidProductSubscriptionArgs) (*CreatePaidProductSubscriptionResult, error)
	UpdatePaidProductSubscription(context.Context, *UpdatePaidProductSubscriptionArgs) (*UpdatePaidProductSubscriptionResult, error)
	ArchiveProductSubscription(context.Context, *ArchiveProductSubscriptionArgs) (*EmptyResponse, error)

	// DotcomQuery
	ProductSubscription(context.Context, *ProductSubscriptionArgs) (ProductSubscription, error)
	ProductSubscriptions(context.Context, *ProductSubscriptionsArgs) (ProductSubscriptionConnection, error)
	PreviewProductSubscriptionInvoice(context.Context, *PreviewProductSubscriptionInvoiceArgs) (ProductSubscriptionPreviewInvoice, error)
	ProductLicenses(context.Context, *ProductLicensesArgs) (ProductLicenseConnection, error)
	ProductPlans(context.Context) ([]ProductPlan, error)
	ProductLicenseByID(ctx context.Context, id graphql.ID) (ProductLicense, error)
	ProductSubscriptionByID(ctx context.Context, id graphql.ID) (ProductSubscription, error)
	UserURLForSiteAdminBilling(ctx context.Context, userID int32) (*string, error)
}
```

DotcomResolver is the interface for the GraphQL types DotcomMutation and DotcomQuery. 

### <a id="DotcomRootResolver" href="#DotcomRootResolver">type DotcomRootResolver interface</a>

```
searchKey: graphqlbackend.DotcomRootResolver
tags: [interface]
```

```Go
type DotcomRootResolver interface {
	DotcomResolver
	Dotcom() DotcomResolver
	NodeResolvers() map[string]NodeByIDFunc
}
```

### <a id="EditActionArgs" href="#EditActionArgs">type EditActionArgs struct</a>

```
searchKey: graphqlbackend.EditActionArgs
tags: [struct]
```

```Go
type EditActionArgs struct {
	Email *EditActionEmailArgs
}
```

### <a id="EditActionEmailArgs" href="#EditActionEmailArgs">type EditActionEmailArgs struct</a>

```
searchKey: graphqlbackend.EditActionEmailArgs
tags: [struct]
```

```Go
type EditActionEmailArgs struct {
	Id     *graphql.ID
	Update *CreateActionEmailArgs
}
```

### <a id="EditMonitorArgs" href="#EditMonitorArgs">type EditMonitorArgs struct</a>

```
searchKey: graphqlbackend.EditMonitorArgs
tags: [struct]
```

```Go
type EditMonitorArgs struct {
	Id     graphql.ID
	Update *CreateMonitorArgs
}
```

### <a id="EditTriggerArgs" href="#EditTriggerArgs">type EditTriggerArgs struct</a>

```
searchKey: graphqlbackend.EditTriggerArgs
tags: [struct]
```

```Go
type EditTriggerArgs struct {
	Id     graphql.ID
	Update *CreateTriggerArgs
}
```

### <a id="EmptyResponse" href="#EmptyResponse">type EmptyResponse struct{}</a>

```
searchKey: graphqlbackend.EmptyResponse
tags: [struct]
```

```Go
type EmptyResponse struct{}
```

EmptyResponse is a type that can be used in the return signature for graphql queries that don't require a return value. 

#### <a id="EmptyResponse.AlwaysNil" href="#EmptyResponse.AlwaysNil">func (er *EmptyResponse) AlwaysNil() *string</a>

```
searchKey: graphqlbackend.EmptyResponse.AlwaysNil
tags: [method]
```

```Go
func (er *EmptyResponse) AlwaysNil() *string
```

AlwaysNil exists since various graphql tools expect at least one field to be present in the schema so we provide a dummy one here that is always nil. 

### <a id="EnterpriseLicenseHasFeatureArgs" href="#EnterpriseLicenseHasFeatureArgs">type EnterpriseLicenseHasFeatureArgs struct</a>

```
searchKey: graphqlbackend.EnterpriseLicenseHasFeatureArgs
tags: [struct]
```

```Go
type EnterpriseLicenseHasFeatureArgs struct {
	Feature string
}
```

### <a id="EvaluatedFeatureFlagResolver" href="#EvaluatedFeatureFlagResolver">type EvaluatedFeatureFlagResolver struct</a>

```
searchKey: graphqlbackend.EvaluatedFeatureFlagResolver
tags: [struct]
```

```Go
type EvaluatedFeatureFlagResolver struct {
	name  string
	value bool
}
```

#### <a id="EvaluatedFeatureFlagResolver.Name" href="#EvaluatedFeatureFlagResolver.Name">func (e *EvaluatedFeatureFlagResolver) Name() string</a>

```
searchKey: graphqlbackend.EvaluatedFeatureFlagResolver.Name
tags: [method]
```

```Go
func (e *EvaluatedFeatureFlagResolver) Name() string
```

#### <a id="EvaluatedFeatureFlagResolver.Value" href="#EvaluatedFeatureFlagResolver.Value">func (e *EvaluatedFeatureFlagResolver) Value() bool</a>

```
searchKey: graphqlbackend.EvaluatedFeatureFlagResolver.Value
tags: [method]
```

```Go
func (e *EvaluatedFeatureFlagResolver) Value() bool
```

### <a id="ExecutionLogEntryResolver" href="#ExecutionLogEntryResolver">type ExecutionLogEntryResolver interface</a>

```
searchKey: graphqlbackend.ExecutionLogEntryResolver
tags: [interface]
```

```Go
type ExecutionLogEntryResolver interface {
	Key() string
	Command() []string
	StartTime() DateTime
	ExitCode() int32
	Out(ctx context.Context) (string, error)
	DurationMilliseconds() int32
}
```

### <a id="ExistingChangesetReferenceResolver" href="#ExistingChangesetReferenceResolver">type ExistingChangesetReferenceResolver interface</a>

```
searchKey: graphqlbackend.ExistingChangesetReferenceResolver
tags: [interface]
```

```Go
type ExistingChangesetReferenceResolver interface {
	BaseRepository() *RepositoryResolver
	ExternalID() string
}
```

### <a id="ExtensionManifest" href="#ExtensionManifest">type ExtensionManifest interface</a>

```
searchKey: graphqlbackend.ExtensionManifest
tags: [interface]
```

```Go
type ExtensionManifest interface {
	Raw() string
	Description() (*string, error)
	BundleURL() (*string, error)
}
```

ExtensionManifest is the interface for the GraphQL type ExtensionManifest. 

### <a id="ExtensionRegistryCreateExtensionArgs" href="#ExtensionRegistryCreateExtensionArgs">type ExtensionRegistryCreateExtensionArgs struct</a>

```
searchKey: graphqlbackend.ExtensionRegistryCreateExtensionArgs
tags: [struct]
```

```Go
type ExtensionRegistryCreateExtensionArgs struct {
	Publisher graphql.ID
	Name      string
}
```

### <a id="ExtensionRegistryDeleteExtensionArgs" href="#ExtensionRegistryDeleteExtensionArgs">type ExtensionRegistryDeleteExtensionArgs struct</a>

```
searchKey: graphqlbackend.ExtensionRegistryDeleteExtensionArgs
tags: [struct]
```

```Go
type ExtensionRegistryDeleteExtensionArgs struct {
	Extension graphql.ID
}
```

### <a id="ExtensionRegistryExtensionArgs" href="#ExtensionRegistryExtensionArgs">type ExtensionRegistryExtensionArgs struct</a>

```
searchKey: graphqlbackend.ExtensionRegistryExtensionArgs
tags: [struct]
```

```Go
type ExtensionRegistryExtensionArgs struct {
	ExtensionID string
}
```

### <a id="ExtensionRegistryMutationResult" href="#ExtensionRegistryMutationResult">type ExtensionRegistryMutationResult interface</a>

```
searchKey: graphqlbackend.ExtensionRegistryMutationResult
tags: [interface]
```

```Go
type ExtensionRegistryMutationResult interface {
	Extension(context.Context) (RegistryExtension, error)
}
```

ExtensionRegistryMutationResult is the interface for the GraphQL type ExtensionRegistryMutationResult. 

### <a id="ExtensionRegistryPublishExtensionArgs" href="#ExtensionRegistryPublishExtensionArgs">type ExtensionRegistryPublishExtensionArgs struct</a>

```
searchKey: graphqlbackend.ExtensionRegistryPublishExtensionArgs
tags: [struct]
```

```Go
type ExtensionRegistryPublishExtensionArgs struct {
	ExtensionID string
	Manifest    string
	Bundle      *string
	SourceMap   *string
	Force       bool
}
```

### <a id="ExtensionRegistryResolver" href="#ExtensionRegistryResolver">type ExtensionRegistryResolver interface</a>

```
searchKey: graphqlbackend.ExtensionRegistryResolver
tags: [interface]
```

```Go
type ExtensionRegistryResolver interface {
	Extensions(context.Context, *RegistryExtensionConnectionArgs) (RegistryExtensionConnection, error)
	Extension(context.Context, *ExtensionRegistryExtensionArgs) (RegistryExtension, error)
	ViewerPublishers(context.Context) ([]RegistryPublisher, error)
	Publishers(context.Context, *graphqlutil.ConnectionArgs) (RegistryPublisherConnection, error)
	CreateExtension(context.Context, *ExtensionRegistryCreateExtensionArgs) (ExtensionRegistryMutationResult, error)
	UpdateExtension(context.Context, *ExtensionRegistryUpdateExtensionArgs) (ExtensionRegistryMutationResult, error)
	PublishExtension(context.Context, *ExtensionRegistryPublishExtensionArgs) (ExtensionRegistryMutationResult, error)
	DeleteExtension(context.Context, *ExtensionRegistryDeleteExtensionArgs) (*EmptyResponse, error)
	LocalExtensionIDPrefix() *string
	FeaturedExtensions(context.Context) (FeaturedExtensionsConnection, error)

	ImplementsLocalExtensionRegistry() bool // not exposed via GraphQL
	// FilterRemoteExtensions enforces `allowRemoteExtensions` by returning a
	// new slice with extension IDs that were present in
	// `allowRemoteExtensions`. It returns the original extension IDs if
	// `allowRemoteExtensions` is not set.
	FilterRemoteExtensions([]string) []string // not exposed via GraphQL
}
```

ExtensionRegistryResolver is the interface for the GraphQL types ExtensionRegistry and ExtensionRegistryMutation. 

Some methods are only implemented if there is a local extension registry. For these methods, the implementation (if one exists) is set on the XyzFunc struct field. 

### <a id="ExtensionRegistryUpdateExtensionArgs" href="#ExtensionRegistryUpdateExtensionArgs">type ExtensionRegistryUpdateExtensionArgs struct</a>

```
searchKey: graphqlbackend.ExtensionRegistryUpdateExtensionArgs
tags: [struct]
```

```Go
type ExtensionRegistryUpdateExtensionArgs struct {
	Extension graphql.ID
	Name      *string
}
```

### <a id="ExternalChangesetResolver" href="#ExternalChangesetResolver">type ExternalChangesetResolver interface</a>

```
searchKey: graphqlbackend.ExternalChangesetResolver
tags: [interface]
```

```Go
type ExternalChangesetResolver interface {
	ChangesetResolver

	ExternalID() *string
	Title(context.Context) (*string, error)
	Body(context.Context) (*string, error)
	Author() (*PersonResolver, error)
	ExternalURL() (*externallink.Resolver, error)
	// ReviewState returns a value of type *btypes.ChangesetReviewState.
	ReviewState(context.Context) *string
	// CheckState returns a value of type *btypes.ChangesetCheckState.
	CheckState() *string
	Repository(ctx context.Context) *RepositoryResolver

	Events(ctx context.Context, args *ChangesetEventsConnectionArgs) (ChangesetEventsConnectionResolver, error)
	Diff(ctx context.Context) (RepositoryComparisonInterface, error)
	DiffStat(ctx context.Context) (*DiffStat, error)
	Labels(ctx context.Context) ([]ChangesetLabelResolver, error)

	Error() *string
	SyncerError() *string
	ScheduleEstimateAt(ctx context.Context) (*DateTime, error)

	CurrentSpec(ctx context.Context) (VisibleChangesetSpecResolver, error)
}
```

ExternalChangesetResolver implements the ChangesetResolver interface and additional data. 

### <a id="ExternalServicesArgs" href="#ExternalServicesArgs">type ExternalServicesArgs struct</a>

```
searchKey: graphqlbackend.ExternalServicesArgs
tags: [struct]
```

```Go
type ExternalServicesArgs struct {
	Namespace *graphql.ID
	graphqlutil.ConnectionArgs
	After *string
}
```

### <a id="FeatureFlagBooleanResolver" href="#FeatureFlagBooleanResolver">type FeatureFlagBooleanResolver struct</a>

```
searchKey: graphqlbackend.FeatureFlagBooleanResolver
tags: [struct]
```

```Go
type FeatureFlagBooleanResolver struct {
	db dbutil.DB
	// Invariant: inner.Bool is non-nil
	inner *featureflag.FeatureFlag
}
```

#### <a id="FeatureFlagBooleanResolver.Name" href="#FeatureFlagBooleanResolver.Name">func (f *FeatureFlagBooleanResolver) Name() string</a>

```
searchKey: graphqlbackend.FeatureFlagBooleanResolver.Name
tags: [method]
```

```Go
func (f *FeatureFlagBooleanResolver) Name() string
```

#### <a id="FeatureFlagBooleanResolver.Overrides" href="#FeatureFlagBooleanResolver.Overrides">func (f *FeatureFlagBooleanResolver) Overrides(ctx context.Context) ([]*FeatureFlagOverrideResolver, error)</a>

```
searchKey: graphqlbackend.FeatureFlagBooleanResolver.Overrides
tags: [method]
```

```Go
func (f *FeatureFlagBooleanResolver) Overrides(ctx context.Context) ([]*FeatureFlagOverrideResolver, error)
```

#### <a id="FeatureFlagBooleanResolver.Value" href="#FeatureFlagBooleanResolver.Value">func (f *FeatureFlagBooleanResolver) Value() bool</a>

```
searchKey: graphqlbackend.FeatureFlagBooleanResolver.Value
tags: [method]
```

```Go
func (f *FeatureFlagBooleanResolver) Value() bool
```

### <a id="FeatureFlagOverrideResolver" href="#FeatureFlagOverrideResolver">type FeatureFlagOverrideResolver struct</a>

```
searchKey: graphqlbackend.FeatureFlagOverrideResolver
tags: [struct]
```

```Go
type FeatureFlagOverrideResolver struct {
	db    dbutil.DB
	inner *featureflag.Override
}
```

#### <a id="FeatureFlagOverrideResolver.ID" href="#FeatureFlagOverrideResolver.ID">func (f *FeatureFlagOverrideResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.FeatureFlagOverrideResolver.ID
tags: [method]
```

```Go
func (f *FeatureFlagOverrideResolver) ID() graphql.ID
```

#### <a id="FeatureFlagOverrideResolver.Namespace" href="#FeatureFlagOverrideResolver.Namespace">func (f *FeatureFlagOverrideResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)</a>

```
searchKey: graphqlbackend.FeatureFlagOverrideResolver.Namespace
tags: [method]
```

```Go
func (f *FeatureFlagOverrideResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)
```

#### <a id="FeatureFlagOverrideResolver.TargetFlag" href="#FeatureFlagOverrideResolver.TargetFlag">func (f *FeatureFlagOverrideResolver) TargetFlag(ctx context.Context) (*FeatureFlagResolver, error)</a>

```
searchKey: graphqlbackend.FeatureFlagOverrideResolver.TargetFlag
tags: [method]
```

```Go
func (f *FeatureFlagOverrideResolver) TargetFlag(ctx context.Context) (*FeatureFlagResolver, error)
```

#### <a id="FeatureFlagOverrideResolver.Value" href="#FeatureFlagOverrideResolver.Value">func (f *FeatureFlagOverrideResolver) Value() bool</a>

```
searchKey: graphqlbackend.FeatureFlagOverrideResolver.Value
tags: [method]
```

```Go
func (f *FeatureFlagOverrideResolver) Value() bool
```

### <a id="FeatureFlagResolver" href="#FeatureFlagResolver">type FeatureFlagResolver struct</a>

```
searchKey: graphqlbackend.FeatureFlagResolver
tags: [struct]
```

```Go
type FeatureFlagResolver struct {
	db    dbutil.DB
	inner *featureflag.FeatureFlag
}
```

#### <a id="FeatureFlagResolver.ToFeatureFlagBoolean" href="#FeatureFlagResolver.ToFeatureFlagBoolean">func (f *FeatureFlagResolver) ToFeatureFlagBoolean() (*FeatureFlagBooleanResolver, bool)</a>

```
searchKey: graphqlbackend.FeatureFlagResolver.ToFeatureFlagBoolean
tags: [method]
```

```Go
func (f *FeatureFlagResolver) ToFeatureFlagBoolean() (*FeatureFlagBooleanResolver, bool)
```

#### <a id="FeatureFlagResolver.ToFeatureFlagRollout" href="#FeatureFlagResolver.ToFeatureFlagRollout">func (f *FeatureFlagResolver) ToFeatureFlagRollout() (*FeatureFlagRolloutResolver, bool)</a>

```
searchKey: graphqlbackend.FeatureFlagResolver.ToFeatureFlagRollout
tags: [method]
```

```Go
func (f *FeatureFlagResolver) ToFeatureFlagRollout() (*FeatureFlagRolloutResolver, bool)
```

### <a id="FeatureFlagRolloutResolver" href="#FeatureFlagRolloutResolver">type FeatureFlagRolloutResolver struct</a>

```
searchKey: graphqlbackend.FeatureFlagRolloutResolver
tags: [struct]
```

```Go
type FeatureFlagRolloutResolver struct {
	db dbutil.DB
	// Invariant: inner.Rollout is non-nil
	inner *featureflag.FeatureFlag
}
```

#### <a id="FeatureFlagRolloutResolver.Name" href="#FeatureFlagRolloutResolver.Name">func (f *FeatureFlagRolloutResolver) Name() string</a>

```
searchKey: graphqlbackend.FeatureFlagRolloutResolver.Name
tags: [method]
```

```Go
func (f *FeatureFlagRolloutResolver) Name() string
```

#### <a id="FeatureFlagRolloutResolver.Overrides" href="#FeatureFlagRolloutResolver.Overrides">func (f *FeatureFlagRolloutResolver) Overrides(ctx context.Context) ([]*FeatureFlagOverrideResolver, error)</a>

```
searchKey: graphqlbackend.FeatureFlagRolloutResolver.Overrides
tags: [method]
```

```Go
func (f *FeatureFlagRolloutResolver) Overrides(ctx context.Context) ([]*FeatureFlagOverrideResolver, error)
```

#### <a id="FeatureFlagRolloutResolver.RolloutBasisPoints" href="#FeatureFlagRolloutResolver.RolloutBasisPoints">func (f *FeatureFlagRolloutResolver) RolloutBasisPoints() int32</a>

```
searchKey: graphqlbackend.FeatureFlagRolloutResolver.RolloutBasisPoints
tags: [method]
```

```Go
func (f *FeatureFlagRolloutResolver) RolloutBasisPoints() int32
```

### <a id="FeaturedExtensionsConnection" href="#FeaturedExtensionsConnection">type FeaturedExtensionsConnection interface</a>

```
searchKey: graphqlbackend.FeaturedExtensionsConnection
tags: [interface]
```

```Go
type FeaturedExtensionsConnection interface {
	Nodes(context.Context) ([]RegistryExtension, error)
	Error(context.Context) *string
}
```

FeaturedExtensions is the interface for the GraphQL type FeaturedExtensionsConnection. 

### <a id="FileContentFunc" href="#FileContentFunc">type FileContentFunc func(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.FileContentFunc
tags: [function]
```

```Go
type FileContentFunc func(ctx context.Context) (string, error)
```

FileContentFunc is a closure that returns the contents of a file and is used by the VirtualFileResolver. 

#### <a id="fileDiffVirtualFileContent" href="#fileDiffVirtualFileContent">func fileDiffVirtualFileContent(r *FileDiffResolver) FileContentFunc</a>

```
searchKey: graphqlbackend.fileDiffVirtualFileContent
tags: [function private]
```

```Go
func fileDiffVirtualFileContent(r *FileDiffResolver) FileContentFunc
```

### <a id="FileDiff" href="#FileDiff">type FileDiff interface</a>

```
searchKey: graphqlbackend.FileDiff
tags: [interface]
```

```Go
type FileDiff interface {
	OldPath() *string
	NewPath() *string
	Hunks() []*DiffHunk
	Stat() *DiffStat
	OldFile() FileResolver
	NewFile() FileResolver
	MostRelevantFile() FileResolver
	InternalID() string
}
```

### <a id="FileDiffConnection" href="#FileDiffConnection">type FileDiffConnection interface</a>

```
searchKey: graphqlbackend.FileDiffConnection
tags: [interface]
```

```Go
type FileDiffConnection interface {
	Nodes(ctx context.Context) ([]FileDiff, error)
	TotalCount(ctx context.Context) (*int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
	DiffStat(ctx context.Context) (*DiffStat, error)
	RawDiff(ctx context.Context) (string, error)
}
```

### <a id="FileDiffHighlighter" href="#FileDiffHighlighter">type FileDiffHighlighter interface</a>

```
searchKey: graphqlbackend.FileDiffHighlighter
tags: [interface]
```

```Go
type FileDiffHighlighter interface {
	Highlight(ctx context.Context, args *HighlightArgs) ([]template.HTML, []template.HTML, bool, error)
}
```

### <a id="FileDiffResolver" href="#FileDiffResolver">type FileDiffResolver struct</a>

```
searchKey: graphqlbackend.FileDiffResolver
tags: [struct]
```

```Go
type FileDiffResolver struct {
	FileDiff *diff.FileDiff
	Base     *GitCommitResolver
	Head     *GitCommitResolver

	db      dbutil.DB
	newFile NewFileFunc
}
```

#### <a id="FileDiffResolver.Hunks" href="#FileDiffResolver.Hunks">func (r *FileDiffResolver) Hunks() []*DiffHunk</a>

```
searchKey: graphqlbackend.FileDiffResolver.Hunks
tags: [method]
```

```Go
func (r *FileDiffResolver) Hunks() []*DiffHunk
```

#### <a id="FileDiffResolver.InternalID" href="#FileDiffResolver.InternalID">func (r *FileDiffResolver) InternalID() string</a>

```
searchKey: graphqlbackend.FileDiffResolver.InternalID
tags: [method]
```

```Go
func (r *FileDiffResolver) InternalID() string
```

#### <a id="FileDiffResolver.MostRelevantFile" href="#FileDiffResolver.MostRelevantFile">func (r *FileDiffResolver) MostRelevantFile() FileResolver</a>

```
searchKey: graphqlbackend.FileDiffResolver.MostRelevantFile
tags: [method]
```

```Go
func (r *FileDiffResolver) MostRelevantFile() FileResolver
```

#### <a id="FileDiffResolver.NewFile" href="#FileDiffResolver.NewFile">func (r *FileDiffResolver) NewFile() FileResolver</a>

```
searchKey: graphqlbackend.FileDiffResolver.NewFile
tags: [method]
```

```Go
func (r *FileDiffResolver) NewFile() FileResolver
```

#### <a id="FileDiffResolver.NewPath" href="#FileDiffResolver.NewPath">func (r *FileDiffResolver) NewPath() *string</a>

```
searchKey: graphqlbackend.FileDiffResolver.NewPath
tags: [method]
```

```Go
func (r *FileDiffResolver) NewPath() *string
```

#### <a id="FileDiffResolver.OldFile" href="#FileDiffResolver.OldFile">func (r *FileDiffResolver) OldFile() FileResolver</a>

```
searchKey: graphqlbackend.FileDiffResolver.OldFile
tags: [method]
```

```Go
func (r *FileDiffResolver) OldFile() FileResolver
```

#### <a id="FileDiffResolver.OldPath" href="#FileDiffResolver.OldPath">func (r *FileDiffResolver) OldPath() *string</a>

```
searchKey: graphqlbackend.FileDiffResolver.OldPath
tags: [method]
```

```Go
func (r *FileDiffResolver) OldPath() *string
```

#### <a id="FileDiffResolver.Stat" href="#FileDiffResolver.Stat">func (r *FileDiffResolver) Stat() *DiffStat</a>

```
searchKey: graphqlbackend.FileDiffResolver.Stat
tags: [method]
```

```Go
func (r *FileDiffResolver) Stat() *DiffStat
```

### <a id="FileDiffsConnectionArgs" href="#FileDiffsConnectionArgs">type FileDiffsConnectionArgs struct</a>

```
searchKey: graphqlbackend.FileDiffsConnectionArgs
tags: [struct]
```

```Go
type FileDiffsConnectionArgs struct {
	First *int32
	After *string
}
```

### <a id="FileMatchResolver" href="#FileMatchResolver">type FileMatchResolver struct</a>

```
searchKey: graphqlbackend.FileMatchResolver
tags: [struct]
```

```Go
type FileMatchResolver struct {
	result.FileMatch

	RepoResolver *RepositoryResolver
	db           dbutil.DB
}
```

FileMatchResolver is a resolver for the GraphQL type `FileMatch` 

#### <a id="FileMatchResolver.Commit" href="#FileMatchResolver.Commit">func (fm *FileMatchResolver) Commit() *GitCommitResolver</a>

```
searchKey: graphqlbackend.FileMatchResolver.Commit
tags: [method]
```

```Go
func (fm *FileMatchResolver) Commit() *GitCommitResolver
```

#### <a id="FileMatchResolver.Equal" href="#FileMatchResolver.Equal">func (fm *FileMatchResolver) Equal(other *FileMatchResolver) bool</a>

```
searchKey: graphqlbackend.FileMatchResolver.Equal
tags: [method]
```

```Go
func (fm *FileMatchResolver) Equal(other *FileMatchResolver) bool
```

Equal provides custom comparison which is used by go-cmp 

#### <a id="FileMatchResolver.File" href="#FileMatchResolver.File">func (fm *FileMatchResolver) File() *GitTreeEntryResolver</a>

```
searchKey: graphqlbackend.FileMatchResolver.File
tags: [method]
```

```Go
func (fm *FileMatchResolver) File() *GitTreeEntryResolver
```

#### <a id="FileMatchResolver.Key" href="#FileMatchResolver.Key">func (fm *FileMatchResolver) Key() string</a>

```
searchKey: graphqlbackend.FileMatchResolver.Key
tags: [method]
```

```Go
func (fm *FileMatchResolver) Key() string
```

#### <a id="FileMatchResolver.LimitHit" href="#FileMatchResolver.LimitHit">func (fm *FileMatchResolver) LimitHit() bool</a>

```
searchKey: graphqlbackend.FileMatchResolver.LimitHit
tags: [method]
```

```Go
func (fm *FileMatchResolver) LimitHit() bool
```

#### <a id="FileMatchResolver.LineMatches" href="#FileMatchResolver.LineMatches">func (fm *FileMatchResolver) LineMatches() []lineMatchResolver</a>

```
searchKey: graphqlbackend.FileMatchResolver.LineMatches
tags: [method]
```

```Go
func (fm *FileMatchResolver) LineMatches() []lineMatchResolver
```

#### <a id="FileMatchResolver.Repository" href="#FileMatchResolver.Repository">func (fm *FileMatchResolver) Repository() *RepositoryResolver</a>

```
searchKey: graphqlbackend.FileMatchResolver.Repository
tags: [method]
```

```Go
func (fm *FileMatchResolver) Repository() *RepositoryResolver
```

#### <a id="FileMatchResolver.ResultCount" href="#FileMatchResolver.ResultCount">func (fm *FileMatchResolver) ResultCount() int32</a>

```
searchKey: graphqlbackend.FileMatchResolver.ResultCount
tags: [method]
```

```Go
func (fm *FileMatchResolver) ResultCount() int32
```

#### <a id="FileMatchResolver.RevSpec" href="#FileMatchResolver.RevSpec">func (fm *FileMatchResolver) RevSpec() *gitRevSpec</a>

```
searchKey: graphqlbackend.FileMatchResolver.RevSpec
tags: [method]
```

```Go
func (fm *FileMatchResolver) RevSpec() *gitRevSpec
```

#### <a id="FileMatchResolver.Symbols" href="#FileMatchResolver.Symbols">func (fm *FileMatchResolver) Symbols() []symbolResolver</a>

```
searchKey: graphqlbackend.FileMatchResolver.Symbols
tags: [method]
```

```Go
func (fm *FileMatchResolver) Symbols() []symbolResolver
```

#### <a id="FileMatchResolver.ToCommitSearchResult" href="#FileMatchResolver.ToCommitSearchResult">func (fm *FileMatchResolver) ToCommitSearchResult() (*CommitSearchResultResolver, bool)</a>

```
searchKey: graphqlbackend.FileMatchResolver.ToCommitSearchResult
tags: [method]
```

```Go
func (fm *FileMatchResolver) ToCommitSearchResult() (*CommitSearchResultResolver, bool)
```

#### <a id="FileMatchResolver.ToFileMatch" href="#FileMatchResolver.ToFileMatch">func (fm *FileMatchResolver) ToFileMatch() (*FileMatchResolver, bool)</a>

```
searchKey: graphqlbackend.FileMatchResolver.ToFileMatch
tags: [method]
```

```Go
func (fm *FileMatchResolver) ToFileMatch() (*FileMatchResolver, bool)
```

#### <a id="FileMatchResolver.ToRepository" href="#FileMatchResolver.ToRepository">func (fm *FileMatchResolver) ToRepository() (*RepositoryResolver, bool)</a>

```
searchKey: graphqlbackend.FileMatchResolver.ToRepository
tags: [method]
```

```Go
func (fm *FileMatchResolver) ToRepository() (*RepositoryResolver, bool)
```

### <a id="FileResolver" href="#FileResolver">type FileResolver interface</a>

```
searchKey: graphqlbackend.FileResolver
tags: [interface]
```

```Go
type FileResolver interface {
	Path() string
	Name() string
	IsDirectory() bool
	Content(ctx context.Context) (string, error)
	ByteSize(ctx context.Context) (int32, error)
	Binary(ctx context.Context) (bool, error)
	RichHTML(ctx context.Context) (string, error)
	URL(ctx context.Context) (string, error)
	CanonicalURL() string
	ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)
	Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)

	ToGitBlob() (*GitTreeEntryResolver, bool)
	ToVirtualFile() (*virtualFileResolver, bool)
}
```

#### <a id="previewNewFile" href="#previewNewFile">func previewNewFile(db dbutil.DB, r *FileDiffResolver) FileResolver</a>

```
searchKey: graphqlbackend.previewNewFile
tags: [function private]
```

```Go
func previewNewFile(db dbutil.DB, r *FileDiffResolver) FileResolver
```

#### <a id="repositoryComparisonNewFile" href="#repositoryComparisonNewFile">func repositoryComparisonNewFile(db dbutil.DB, r *FileDiffResolver) FileResolver</a>

```
searchKey: graphqlbackend.repositoryComparisonNewFile
tags: [function private]
```

```Go
func repositoryComparisonNewFile(db dbutil.DB, r *FileDiffResolver) FileResolver
```

repositoryComparisonNewFile is the default NewFileFunc used by RepositoryComparisonResolver to produce the new file in a FileDiffResolver. 

### <a id="GenerateProductLicenseForSubscriptionArgs" href="#GenerateProductLicenseForSubscriptionArgs">type GenerateProductLicenseForSubscriptionArgs struct</a>

```
searchKey: graphqlbackend.GenerateProductLicenseForSubscriptionArgs
tags: [struct]
```

```Go
type GenerateProductLicenseForSubscriptionArgs struct {
	ProductSubscriptionID graphql.ID
	License               *ProductLicenseInput
}
```

### <a id="GitBlobLSIFDataArgs" href="#GitBlobLSIFDataArgs">type GitBlobLSIFDataArgs struct</a>

```
searchKey: graphqlbackend.GitBlobLSIFDataArgs
tags: [struct]
```

```Go
type GitBlobLSIFDataArgs struct {
	Repo      *types.Repo
	Commit    api.CommitID
	Path      string
	ExactPath bool
	ToolName  string
}
```

### <a id="GitBlobLSIFDataResolver" href="#GitBlobLSIFDataResolver">type GitBlobLSIFDataResolver interface</a>

```
searchKey: graphqlbackend.GitBlobLSIFDataResolver
tags: [interface]
```

```Go
type GitBlobLSIFDataResolver interface {
	GitTreeLSIFDataResolver
	ToGitTreeLSIFData() (GitTreeLSIFDataResolver, bool)
	ToGitBlobLSIFData() (GitBlobLSIFDataResolver, bool)

	Ranges(ctx context.Context, args *LSIFRangesArgs) (CodeIntelligenceRangeConnectionResolver, error)
	Definitions(ctx context.Context, args *LSIFQueryPositionArgs) (LocationConnectionResolver, error)
	References(ctx context.Context, args *LSIFPagedQueryPositionArgs) (LocationConnectionResolver, error)
	Hover(ctx context.Context, args *LSIFQueryPositionArgs) (HoverResolver, error)
}
```

### <a id="GitBranchChangesetDescriptionResolver" href="#GitBranchChangesetDescriptionResolver">type GitBranchChangesetDescriptionResolver interface</a>

```
searchKey: graphqlbackend.GitBranchChangesetDescriptionResolver
tags: [interface]
```

```Go
type GitBranchChangesetDescriptionResolver interface {
	BaseRepository() *RepositoryResolver
	BaseRef() string
	BaseRev() string

	HeadRepository() *RepositoryResolver
	HeadRef() string

	Title() string
	Body() string

	Diff(ctx context.Context) (PreviewRepositoryComparisonResolver, error)
	DiffStat() *DiffStat

	Commits() []GitCommitDescriptionResolver

	Published() batches.PublishedValue
}
```

### <a id="GitCommitDescriptionResolver" href="#GitCommitDescriptionResolver">type GitCommitDescriptionResolver interface</a>

```
searchKey: graphqlbackend.GitCommitDescriptionResolver
tags: [interface]
```

```Go
type GitCommitDescriptionResolver interface {
	Message() string
	Subject() string
	Body() *string
	Author() *PersonResolver
	Diff() string
}
```

### <a id="GitCommitResolver" href="#GitCommitResolver">type GitCommitResolver struct</a>

```
searchKey: graphqlbackend.GitCommitResolver
tags: [struct]
```

```Go
type GitCommitResolver struct {
	db           dbutil.DB
	repoResolver *RepositoryResolver

	// inputRev is the Git revspec that the user originally requested that resolved to this Git commit. It is used
	// to avoid redirecting a user browsing a revision "mybranch" to the absolute commit ID as they follow links in the UI.
	inputRev *string

	// fetch + serve sourcegraph stored user information
	includeUserInfo bool

	// oid MUST be specified and a 40-character Git SHA.
	oid GitObjectID

	gitRepo api.RepoName

	// commit should not be accessed directly since it might not be initialized.
	// Use the resolver methods instead.
	commit     *git.Commit
	commitOnce sync.Once
	commitErr  error
}
```

#### <a id="toGitCommitResolver" href="#toGitCommitResolver">func toGitCommitResolver(repo *RepositoryResolver, db dbutil.DB, id api.CommitID, commit *git.Commit) *GitCommitResolver</a>

```
searchKey: graphqlbackend.toGitCommitResolver
tags: [function private]
```

```Go
func toGitCommitResolver(repo *RepositoryResolver, db dbutil.DB, id api.CommitID, commit *git.Commit) *GitCommitResolver
```

When set to nil, commit will be loaded lazily as needed by the resolver. Pass in a commit when you have batch loaded a bunch of them and already have them at hand. 

#### <a id="GitCommitResolver.AbbreviatedOID" href="#GitCommitResolver.AbbreviatedOID">func (r *GitCommitResolver) AbbreviatedOID() string</a>

```
searchKey: graphqlbackend.GitCommitResolver.AbbreviatedOID
tags: [method]
```

```Go
func (r *GitCommitResolver) AbbreviatedOID() string
```

#### <a id="GitCommitResolver.Ancestors" href="#GitCommitResolver.Ancestors">func (r *GitCommitResolver) Ancestors(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.GitCommitResolver.Ancestors
tags: [method]
```

```Go
func (r *GitCommitResolver) Ancestors(ctx context.Context, args *struct {
	graphqlutil.ConnectionArgs
	Query *string
	Path  *string
	After *string
}) (*gitCommitConnectionResolver, error)
```

#### <a id="GitCommitResolver.Author" href="#GitCommitResolver.Author">func (r *GitCommitResolver) Author(ctx context.Context) (*signatureResolver, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.Author
tags: [method]
```

```Go
func (r *GitCommitResolver) Author(ctx context.Context) (*signatureResolver, error)
```

#### <a id="GitCommitResolver.BehindAhead" href="#GitCommitResolver.BehindAhead">func (r *GitCommitResolver) BehindAhead(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.GitCommitResolver.BehindAhead
tags: [method]
```

```Go
func (r *GitCommitResolver) BehindAhead(ctx context.Context, args *struct {
	Revspec string
}) (*behindAheadCountsResolver, error)
```

#### <a id="GitCommitResolver.Blob" href="#GitCommitResolver.Blob">func (r *GitCommitResolver) Blob(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.GitCommitResolver.Blob
tags: [method]
```

```Go
func (r *GitCommitResolver) Blob(ctx context.Context, args *struct {
	Path string
}) (*GitTreeEntryResolver, error)
```

#### <a id="GitCommitResolver.Body" href="#GitCommitResolver.Body">func (r *GitCommitResolver) Body(ctx context.Context) (*string, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.Body
tags: [method]
```

```Go
func (r *GitCommitResolver) Body(ctx context.Context) (*string, error)
```

#### <a id="GitCommitResolver.CanonicalURL" href="#GitCommitResolver.CanonicalURL">func (r *GitCommitResolver) CanonicalURL() string</a>

```
searchKey: graphqlbackend.GitCommitResolver.CanonicalURL
tags: [method]
```

```Go
func (r *GitCommitResolver) CanonicalURL() string
```

#### <a id="GitCommitResolver.Committer" href="#GitCommitResolver.Committer">func (r *GitCommitResolver) Committer(ctx context.Context) (*signatureResolver, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.Committer
tags: [method]
```

```Go
func (r *GitCommitResolver) Committer(ctx context.Context) (*signatureResolver, error)
```

#### <a id="GitCommitResolver.ExternalURLs" href="#GitCommitResolver.ExternalURLs">func (r *GitCommitResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.ExternalURLs
tags: [method]
```

```Go
func (r *GitCommitResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)
```

#### <a id="GitCommitResolver.File" href="#GitCommitResolver.File">func (r *GitCommitResolver) File(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.GitCommitResolver.File
tags: [method]
```

```Go
func (r *GitCommitResolver) File(ctx context.Context, args *struct {
	Path string
}) (*GitTreeEntryResolver, error)
```

#### <a id="GitCommitResolver.FileNames" href="#GitCommitResolver.FileNames">func (r *GitCommitResolver) FileNames(ctx context.Context) ([]string, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.FileNames
tags: [method]
```

```Go
func (r *GitCommitResolver) FileNames(ctx context.Context) ([]string, error)
```

#### <a id="GitCommitResolver.ID" href="#GitCommitResolver.ID">func (r *GitCommitResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.GitCommitResolver.ID
tags: [method]
```

```Go
func (r *GitCommitResolver) ID() graphql.ID
```

#### <a id="GitCommitResolver.InputRev" href="#GitCommitResolver.InputRev">func (r *GitCommitResolver) InputRev() *string</a>

```
searchKey: graphqlbackend.GitCommitResolver.InputRev
tags: [method]
```

```Go
func (r *GitCommitResolver) InputRev() *string
```

#### <a id="GitCommitResolver.LanguageStatistics" href="#GitCommitResolver.LanguageStatistics">func (r *GitCommitResolver) LanguageStatistics(ctx context.Context) ([]*languageStatisticsResolver, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.LanguageStatistics
tags: [method]
```

```Go
func (r *GitCommitResolver) LanguageStatistics(ctx context.Context) ([]*languageStatisticsResolver, error)
```

#### <a id="GitCommitResolver.Languages" href="#GitCommitResolver.Languages">func (r *GitCommitResolver) Languages(ctx context.Context) ([]string, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.Languages
tags: [method]
```

```Go
func (r *GitCommitResolver) Languages(ctx context.Context) ([]string, error)
```

#### <a id="GitCommitResolver.Message" href="#GitCommitResolver.Message">func (r *GitCommitResolver) Message(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.Message
tags: [method]
```

```Go
func (r *GitCommitResolver) Message(ctx context.Context) (string, error)
```

#### <a id="GitCommitResolver.OID" href="#GitCommitResolver.OID">func (r *GitCommitResolver) OID() GitObjectID</a>

```
searchKey: graphqlbackend.GitCommitResolver.OID
tags: [method]
```

```Go
func (r *GitCommitResolver) OID() GitObjectID
```

#### <a id="GitCommitResolver.Parents" href="#GitCommitResolver.Parents">func (r *GitCommitResolver) Parents(ctx context.Context) ([]*GitCommitResolver, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.Parents
tags: [method]
```

```Go
func (r *GitCommitResolver) Parents(ctx context.Context) ([]*GitCommitResolver, error)
```

#### <a id="GitCommitResolver.Repository" href="#GitCommitResolver.Repository">func (r *GitCommitResolver) Repository() *RepositoryResolver</a>

```
searchKey: graphqlbackend.GitCommitResolver.Repository
tags: [method]
```

```Go
func (r *GitCommitResolver) Repository() *RepositoryResolver
```

#### <a id="GitCommitResolver.Subject" href="#GitCommitResolver.Subject">func (r *GitCommitResolver) Subject(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.Subject
tags: [method]
```

```Go
func (r *GitCommitResolver) Subject(ctx context.Context) (string, error)
```

#### <a id="GitCommitResolver.Symbols" href="#GitCommitResolver.Symbols">func (r *GitCommitResolver) Symbols(ctx context.Context, args *symbolsArgs) (*symbolConnectionResolver, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.Symbols
tags: [method]
```

```Go
func (r *GitCommitResolver) Symbols(ctx context.Context, args *symbolsArgs) (*symbolConnectionResolver, error)
```

#### <a id="GitCommitResolver.Tree" href="#GitCommitResolver.Tree">func (r *GitCommitResolver) Tree(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.GitCommitResolver.Tree
tags: [method]
```

```Go
func (r *GitCommitResolver) Tree(ctx context.Context, args *struct {
	Path      string
	Recursive bool
}) (*GitTreeEntryResolver, error)
```

#### <a id="GitCommitResolver.URL" href="#GitCommitResolver.URL">func (r *GitCommitResolver) URL() string</a>

```
searchKey: graphqlbackend.GitCommitResolver.URL
tags: [method]
```

```Go
func (r *GitCommitResolver) URL() string
```

#### <a id="GitCommitResolver.canonicalRepoRevURL" href="#GitCommitResolver.canonicalRepoRevURL">func (r *GitCommitResolver) canonicalRepoRevURL() *url.URL</a>

```
searchKey: graphqlbackend.GitCommitResolver.canonicalRepoRevURL
tags: [method private]
```

```Go
func (r *GitCommitResolver) canonicalRepoRevURL() *url.URL
```

#### <a id="GitCommitResolver.inputRevOrImmutableRev" href="#GitCommitResolver.inputRevOrImmutableRev">func (r *GitCommitResolver) inputRevOrImmutableRev() string</a>

```
searchKey: graphqlbackend.GitCommitResolver.inputRevOrImmutableRev
tags: [method private]
```

```Go
func (r *GitCommitResolver) inputRevOrImmutableRev() string
```

inputRevOrImmutableRev returns the input revspec, if it is provided and nonempty. Otherwise it returns the canonical OID for the revision. 

#### <a id="GitCommitResolver.repoRevURL" href="#GitCommitResolver.repoRevURL">func (r *GitCommitResolver) repoRevURL() *url.URL</a>

```
searchKey: graphqlbackend.GitCommitResolver.repoRevURL
tags: [method private]
```

```Go
func (r *GitCommitResolver) repoRevURL() *url.URL
```

repoRevURL returns the URL path prefix to use when constructing URLs to resources at this revision. Unlike inputRevOrImmutableRev, it does NOT use the OID if no input revspec is given. This is because the convention in the frontend is for repo-rev URLs to omit the "@rev" portion (unlike for commit page URLs, which must include some revspec in "/REPO/-/commit/REVSPEC"). 

#### <a id="GitCommitResolver.resolveCommit" href="#GitCommitResolver.resolveCommit">func (r *GitCommitResolver) resolveCommit(ctx context.Context) (*git.Commit, error)</a>

```
searchKey: graphqlbackend.GitCommitResolver.resolveCommit
tags: [method private]
```

```Go
func (r *GitCommitResolver) resolveCommit(ctx context.Context) (*git.Commit, error)
```

### <a id="GitObjectID" href="#GitObjectID">type GitObjectID string</a>

```
searchKey: graphqlbackend.GitObjectID
tags: [string]
```

```Go
type GitObjectID string
```

#### <a id="unmarshalGitCommitID" href="#unmarshalGitCommitID">func unmarshalGitCommitID(id graphql.ID) (repoID graphql.ID, commitID GitObjectID, err error)</a>

```
searchKey: graphqlbackend.unmarshalGitCommitID
tags: [function private]
```

```Go
func unmarshalGitCommitID(id graphql.ID) (repoID graphql.ID, commitID GitObjectID, err error)
```

#### <a id="GitObjectID.ImplementsGraphQLType" href="#GitObjectID.ImplementsGraphQLType">func (GitObjectID) ImplementsGraphQLType(name string) bool</a>

```
searchKey: graphqlbackend.GitObjectID.ImplementsGraphQLType
tags: [method]
```

```Go
func (GitObjectID) ImplementsGraphQLType(name string) bool
```

#### <a id="GitObjectID.UnmarshalGraphQL" href="#GitObjectID.UnmarshalGraphQL">func (id *GitObjectID) UnmarshalGraphQL(input interface{}) error</a>

```
searchKey: graphqlbackend.GitObjectID.UnmarshalGraphQL
tags: [method]
```

```Go
func (id *GitObjectID) UnmarshalGraphQL(input interface{}) error
```

### <a id="GitRefResolver" href="#GitRefResolver">type GitRefResolver struct</a>

```
searchKey: graphqlbackend.GitRefResolver
tags: [struct]
```

```Go
type GitRefResolver struct {
	repo *RepositoryResolver
	name string

	target GitObjectID // the target's OID, if known (otherwise computed on demand)

	gitObjectResolverOnce sync.Once
	gitObjectResolver     *gitObjectResolver
}
```

#### <a id="NewGitRefResolver" href="#NewGitRefResolver">func NewGitRefResolver(repo *RepositoryResolver, name string, target GitObjectID) *GitRefResolver</a>

```
searchKey: graphqlbackend.NewGitRefResolver
tags: [function]
```

```Go
func NewGitRefResolver(repo *RepositoryResolver, name string, target GitObjectID) *GitRefResolver
```

#### <a id="GitRefResolver.AbbrevName" href="#GitRefResolver.AbbrevName">func (r *GitRefResolver) AbbrevName() string</a>

```
searchKey: graphqlbackend.GitRefResolver.AbbrevName
tags: [method]
```

```Go
func (r *GitRefResolver) AbbrevName() string
```

#### <a id="GitRefResolver.DisplayName" href="#GitRefResolver.DisplayName">func (r *GitRefResolver) DisplayName() string</a>

```
searchKey: graphqlbackend.GitRefResolver.DisplayName
tags: [method]
```

```Go
func (r *GitRefResolver) DisplayName() string
```

#### <a id="GitRefResolver.ID" href="#GitRefResolver.ID">func (r *GitRefResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.GitRefResolver.ID
tags: [method]
```

```Go
func (r *GitRefResolver) ID() graphql.ID
```

#### <a id="GitRefResolver.Name" href="#GitRefResolver.Name">func (r *GitRefResolver) Name() string</a>

```
searchKey: graphqlbackend.GitRefResolver.Name
tags: [method]
```

```Go
func (r *GitRefResolver) Name() string
```

#### <a id="GitRefResolver.Prefix" href="#GitRefResolver.Prefix">func (r *GitRefResolver) Prefix() string</a>

```
searchKey: graphqlbackend.GitRefResolver.Prefix
tags: [method]
```

```Go
func (r *GitRefResolver) Prefix() string
```

#### <a id="GitRefResolver.Repository" href="#GitRefResolver.Repository">func (r *GitRefResolver) Repository() *RepositoryResolver</a>

```
searchKey: graphqlbackend.GitRefResolver.Repository
tags: [method]
```

```Go
func (r *GitRefResolver) Repository() *RepositoryResolver
```

#### <a id="GitRefResolver.Target" href="#GitRefResolver.Target">func (r *GitRefResolver) Target() interface {...</a>

```
searchKey: graphqlbackend.GitRefResolver.Target
tags: [method]
```

```Go
func (r *GitRefResolver) Target() interface {
	OID(context.Context) (GitObjectID, error)
	//lint:ignore U1000 is used by graphql via reflection
	AbbreviatedOID(context.Context) (string, error)
	//lint:ignore U1000 is used by graphql via reflection
	Commit(context.Context) (*GitCommitResolver, error)
	//lint:ignore U1000 is used by graphql via reflection
	Type(context.Context) (gitObjectType, error)
}
```

#### <a id="GitRefResolver.Type" href="#GitRefResolver.Type">func (r *GitRefResolver) Type() string</a>

```
searchKey: graphqlbackend.GitRefResolver.Type
tags: [method]
```

```Go
func (r *GitRefResolver) Type() string
```

#### <a id="GitRefResolver.URL" href="#GitRefResolver.URL">func (r *GitRefResolver) URL() string</a>

```
searchKey: graphqlbackend.GitRefResolver.URL
tags: [method]
```

```Go
func (r *GitRefResolver) URL() string
```

### <a id="GitTreeEntryResolver" href="#GitTreeEntryResolver">type GitTreeEntryResolver struct</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver
tags: [struct]
```

```Go
type GitTreeEntryResolver struct {
	db     dbutil.DB
	commit *GitCommitResolver

	contentOnce sync.Once
	content     []byte
	contentErr  error

	// stat is this tree entry's file info. Its Name method must return the full path relative to
	// the root, not the basename.
	stat fs.FileInfo

	isRecursive   bool  // whether entries is populated recursively (otherwise just current level of hierarchy)
	isSingleChild *bool // whether this is the single entry in its parent. Only set by the (&GitTreeEntryResolver) entries.
}
```

GitTreeEntryResolver resolves an entry in a Git tree in a repository. The entry can be any Git object type that is valid in a tree. 

#### <a id="NewGitTreeEntryResolver" href="#NewGitTreeEntryResolver">func NewGitTreeEntryResolver(commit *GitCommitResolver, db dbutil.DB, stat fs.FileInfo) *GitTreeEntryResolver</a>

```
searchKey: graphqlbackend.NewGitTreeEntryResolver
tags: [function]
```

```Go
func NewGitTreeEntryResolver(commit *GitCommitResolver, db dbutil.DB, stat fs.FileInfo) *GitTreeEntryResolver
```

#### <a id="GitTreeEntryResolver.Binary" href="#GitTreeEntryResolver.Binary">func (r *GitTreeEntryResolver) Binary(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Binary
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Binary(ctx context.Context) (bool, error)
```

#### <a id="GitTreeEntryResolver.Blame" href="#GitTreeEntryResolver.Blame">func (r *GitTreeEntryResolver) Blame(ctx context.Context,...</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Blame
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Blame(ctx context.Context,
	args *struct {
		StartLine int32
		EndLine   int32
	}) ([]*hunkResolver, error)
```

#### <a id="GitTreeEntryResolver.ByteSize" href="#GitTreeEntryResolver.ByteSize">func (r *GitTreeEntryResolver) ByteSize(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.ByteSize
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) ByteSize(ctx context.Context) (int32, error)
```

#### <a id="GitTreeEntryResolver.CanonicalURL" href="#GitTreeEntryResolver.CanonicalURL">func (r *GitTreeEntryResolver) CanonicalURL() string</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.CanonicalURL
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) CanonicalURL() string
```

#### <a id="GitTreeEntryResolver.Commit" href="#GitTreeEntryResolver.Commit">func (r *GitTreeEntryResolver) Commit() *GitCommitResolver</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Commit
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Commit() *GitCommitResolver
```

#### <a id="GitTreeEntryResolver.Content" href="#GitTreeEntryResolver.Content">func (r *GitTreeEntryResolver) Content(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Content
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Content(ctx context.Context) (string, error)
```

#### <a id="GitTreeEntryResolver.Directories" href="#GitTreeEntryResolver.Directories">func (r *GitTreeEntryResolver) Directories(ctx context.Context, args *gitTreeEntryConnectionArgs) ([]*GitTreeEntryResolver, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Directories
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Directories(ctx context.Context, args *gitTreeEntryConnectionArgs) ([]*GitTreeEntryResolver, error)
```

#### <a id="GitTreeEntryResolver.Entries" href="#GitTreeEntryResolver.Entries">func (r *GitTreeEntryResolver) Entries(ctx context.Context, args *gitTreeEntryConnectionArgs) ([]*GitTreeEntryResolver, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Entries
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Entries(ctx context.Context, args *gitTreeEntryConnectionArgs) ([]*GitTreeEntryResolver, error)
```

#### <a id="GitTreeEntryResolver.ExternalURLs" href="#GitTreeEntryResolver.ExternalURLs">func (r *GitTreeEntryResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.ExternalURLs
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)
```

#### <a id="GitTreeEntryResolver.Files" href="#GitTreeEntryResolver.Files">func (r *GitTreeEntryResolver) Files(ctx context.Context, args *gitTreeEntryConnectionArgs) ([]*GitTreeEntryResolver, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Files
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Files(ctx context.Context, args *gitTreeEntryConnectionArgs) ([]*GitTreeEntryResolver, error)
```

#### <a id="GitTreeEntryResolver.Highlight" href="#GitTreeEntryResolver.Highlight">func (r *GitTreeEntryResolver) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Highlight
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)
```

#### <a id="GitTreeEntryResolver.IsDirectory" href="#GitTreeEntryResolver.IsDirectory">func (r *GitTreeEntryResolver) IsDirectory() bool</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.IsDirectory
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) IsDirectory() bool
```

#### <a id="GitTreeEntryResolver.IsRecursive" href="#GitTreeEntryResolver.IsRecursive">func (r *GitTreeEntryResolver) IsRecursive() bool</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.IsRecursive
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) IsRecursive() bool
```

#### <a id="GitTreeEntryResolver.IsRoot" href="#GitTreeEntryResolver.IsRoot">func (r *GitTreeEntryResolver) IsRoot() bool</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.IsRoot
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) IsRoot() bool
```

#### <a id="GitTreeEntryResolver.IsSingleChild" href="#GitTreeEntryResolver.IsSingleChild">func (r *GitTreeEntryResolver) IsSingleChild(ctx context.Context, args *gitTreeEntryConnectionArgs) (bool, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.IsSingleChild
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) IsSingleChild(ctx context.Context, args *gitTreeEntryConnectionArgs) (bool, error)
```

#### <a id="GitTreeEntryResolver.LSIF" href="#GitTreeEntryResolver.LSIF">func (r *GitTreeEntryResolver) LSIF(ctx context.Context, args *struct{ ToolName *string }) (GitBlobLSIFDataResolver, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.LSIF
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) LSIF(ctx context.Context, args *struct{ ToolName *string }) (GitBlobLSIFDataResolver, error)
```

#### <a id="GitTreeEntryResolver.Name" href="#GitTreeEntryResolver.Name">func (r *GitTreeEntryResolver) Name() string</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Name
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Name() string
```

#### <a id="GitTreeEntryResolver.Path" href="#GitTreeEntryResolver.Path">func (r *GitTreeEntryResolver) Path() string</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Path
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Path() string
```

#### <a id="GitTreeEntryResolver.RawZipArchiveURL" href="#GitTreeEntryResolver.RawZipArchiveURL">func (r *GitTreeEntryResolver) RawZipArchiveURL() string</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.RawZipArchiveURL
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) RawZipArchiveURL() string
```

#### <a id="GitTreeEntryResolver.Repository" href="#GitTreeEntryResolver.Repository">func (r *GitTreeEntryResolver) Repository() *RepositoryResolver</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Repository
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Repository() *RepositoryResolver
```

#### <a id="GitTreeEntryResolver.RichHTML" href="#GitTreeEntryResolver.RichHTML">func (r *GitTreeEntryResolver) RichHTML(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.RichHTML
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) RichHTML(ctx context.Context) (string, error)
```

#### <a id="GitTreeEntryResolver.Submodule" href="#GitTreeEntryResolver.Submodule">func (r *GitTreeEntryResolver) Submodule() *gitSubmoduleResolver</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Submodule
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Submodule() *gitSubmoduleResolver
```

#### <a id="GitTreeEntryResolver.Symbols" href="#GitTreeEntryResolver.Symbols">func (r *GitTreeEntryResolver) Symbols(ctx context.Context, args *symbolsArgs) (*symbolConnectionResolver, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.Symbols
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) Symbols(ctx context.Context, args *symbolsArgs) (*symbolConnectionResolver, error)
```

#### <a id="GitTreeEntryResolver.ToGitBlob" href="#GitTreeEntryResolver.ToGitBlob">func (r *GitTreeEntryResolver) ToGitBlob() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.ToGitBlob
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) ToGitBlob() (*GitTreeEntryResolver, bool)
```

#### <a id="GitTreeEntryResolver.ToGitTree" href="#GitTreeEntryResolver.ToGitTree">func (r *GitTreeEntryResolver) ToGitTree() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.ToGitTree
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) ToGitTree() (*GitTreeEntryResolver, bool)
```

#### <a id="GitTreeEntryResolver.ToVirtualFile" href="#GitTreeEntryResolver.ToVirtualFile">func (r *GitTreeEntryResolver) ToVirtualFile() (*virtualFileResolver, bool)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.ToVirtualFile
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) ToVirtualFile() (*virtualFileResolver, bool)
```

#### <a id="GitTreeEntryResolver.URL" href="#GitTreeEntryResolver.URL">func (r *GitTreeEntryResolver) URL(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.URL
tags: [method]
```

```Go
func (r *GitTreeEntryResolver) URL(ctx context.Context) (string, error)
```

#### <a id="GitTreeEntryResolver.entries" href="#GitTreeEntryResolver.entries">func (r *GitTreeEntryResolver) entries(ctx context.Context, args *gitTreeEntryConnectionArgs, filter func(fi fs.FileInfo) bool) ([]*GitTreeEntryResolver, error)</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.entries
tags: [method private]
```

```Go
func (r *GitTreeEntryResolver) entries(ctx context.Context, args *gitTreeEntryConnectionArgs, filter func(fi fs.FileInfo) bool) ([]*GitTreeEntryResolver, error)
```

#### <a id="GitTreeEntryResolver.urlPath" href="#GitTreeEntryResolver.urlPath">func (r *GitTreeEntryResolver) urlPath(prefix *url.URL) *url.URL</a>

```
searchKey: graphqlbackend.GitTreeEntryResolver.urlPath
tags: [method private]
```

```Go
func (r *GitTreeEntryResolver) urlPath(prefix *url.URL) *url.URL
```

### <a id="GitTreeLSIFDataResolver" href="#GitTreeLSIFDataResolver">type GitTreeLSIFDataResolver interface</a>

```
searchKey: graphqlbackend.GitTreeLSIFDataResolver
tags: [interface]
```

```Go
type GitTreeLSIFDataResolver interface {
	Diagnostics(ctx context.Context, args *LSIFDiagnosticsArgs) (DiagnosticConnectionResolver, error)
	DocumentationPage(ctx context.Context, args *LSIFDocumentationPageArgs) (DocumentationPageResolver, error)
}
```

### <a id="HappinessFeedbackSubmissionInput" href="#HappinessFeedbackSubmissionInput">type HappinessFeedbackSubmissionInput struct</a>

```
searchKey: graphqlbackend.HappinessFeedbackSubmissionInput
tags: [struct]
```

```Go
type HappinessFeedbackSubmissionInput struct {
	// Score is the user's happiness rating, from 1-4.
	Score int32
	// Feedback is the answer to "What's going well? What could be better?".
	Feedback *string
	// The path that the happiness feedback was submitted from
	CurrentPath *string
}
```

FeedbackSubmissionInput contains a happiness feedback response. 

### <a id="HiddenApplyPreviewTargetsAttachResolver" href="#HiddenApplyPreviewTargetsAttachResolver">type HiddenApplyPreviewTargetsAttachResolver interface</a>

```
searchKey: graphqlbackend.HiddenApplyPreviewTargetsAttachResolver
tags: [interface]
```

```Go
type HiddenApplyPreviewTargetsAttachResolver interface {
	ChangesetSpec(ctx context.Context) (HiddenChangesetSpecResolver, error)
}
```

### <a id="HiddenApplyPreviewTargetsDetachResolver" href="#HiddenApplyPreviewTargetsDetachResolver">type HiddenApplyPreviewTargetsDetachResolver interface</a>

```
searchKey: graphqlbackend.HiddenApplyPreviewTargetsDetachResolver
tags: [interface]
```

```Go
type HiddenApplyPreviewTargetsDetachResolver interface {
	Changeset(ctx context.Context) (HiddenExternalChangesetResolver, error)
}
```

### <a id="HiddenApplyPreviewTargetsResolver" href="#HiddenApplyPreviewTargetsResolver">type HiddenApplyPreviewTargetsResolver interface</a>

```
searchKey: graphqlbackend.HiddenApplyPreviewTargetsResolver
tags: [interface]
```

```Go
type HiddenApplyPreviewTargetsResolver interface {
	ToHiddenApplyPreviewTargetsAttach() (HiddenApplyPreviewTargetsAttachResolver, bool)
	ToHiddenApplyPreviewTargetsUpdate() (HiddenApplyPreviewTargetsUpdateResolver, bool)
	ToHiddenApplyPreviewTargetsDetach() (HiddenApplyPreviewTargetsDetachResolver, bool)
}
```

### <a id="HiddenApplyPreviewTargetsUpdateResolver" href="#HiddenApplyPreviewTargetsUpdateResolver">type HiddenApplyPreviewTargetsUpdateResolver interface</a>

```
searchKey: graphqlbackend.HiddenApplyPreviewTargetsUpdateResolver
tags: [interface]
```

```Go
type HiddenApplyPreviewTargetsUpdateResolver interface {
	ChangesetSpec(ctx context.Context) (HiddenChangesetSpecResolver, error)
	Changeset(ctx context.Context) (HiddenExternalChangesetResolver, error)
}
```

### <a id="HiddenChangesetApplyPreviewResolver" href="#HiddenChangesetApplyPreviewResolver">type HiddenChangesetApplyPreviewResolver interface</a>

```
searchKey: graphqlbackend.HiddenChangesetApplyPreviewResolver
tags: [interface]
```

```Go
type HiddenChangesetApplyPreviewResolver interface {
	// Operations returns a slice of btypes.ReconcilerOperation.
	Operations(ctx context.Context) ([]string, error)
	Delta(ctx context.Context) (ChangesetSpecDeltaResolver, error)
	Targets() HiddenApplyPreviewTargetsResolver
}
```

### <a id="HiddenChangesetSpecResolver" href="#HiddenChangesetSpecResolver">type HiddenChangesetSpecResolver interface</a>

```
searchKey: graphqlbackend.HiddenChangesetSpecResolver
tags: [interface]
```

```Go
type HiddenChangesetSpecResolver interface {
	ChangesetSpecResolver
}
```

### <a id="HiddenExternalChangesetResolver" href="#HiddenExternalChangesetResolver">type HiddenExternalChangesetResolver interface</a>

```
searchKey: graphqlbackend.HiddenExternalChangesetResolver
tags: [interface]
```

```Go
type HiddenExternalChangesetResolver interface {
	ChangesetResolver
}
```

HiddenExternalChangesetResolver implements only the common interface, ChangesetResolver, to not reveal information to unauthorized users. 

Theoretically this type is not necessary, but it's easier to understand the implementation of the GraphQL schema if we have a mapping between GraphQL types and Go types. 

### <a id="HighlightArgs" href="#HighlightArgs">type HighlightArgs struct</a>

```
searchKey: graphqlbackend.HighlightArgs
tags: [struct]
```

```Go
type HighlightArgs struct {
	DisableTimeout     bool
	IsLightTheme       bool
	HighlightLongLines bool
}
```

### <a id="HoverResolver" href="#HoverResolver">type HoverResolver interface</a>

```
searchKey: graphqlbackend.HoverResolver
tags: [interface]
```

```Go
type HoverResolver interface {
	Markdown() Markdown
	Range() RangeResolver
}
```

### <a id="IndexConfigurationResolver" href="#IndexConfigurationResolver">type IndexConfigurationResolver interface</a>

```
searchKey: graphqlbackend.IndexConfigurationResolver
tags: [interface]
```

```Go
type IndexConfigurationResolver interface {
	Configuration() *string
}
```

### <a id="IndexStepResolver" href="#IndexStepResolver">type IndexStepResolver interface</a>

```
searchKey: graphqlbackend.IndexStepResolver
tags: [interface]
```

```Go
type IndexStepResolver interface {
	IndexerArgs() []string
	Outfile() *string
	LogEntry() ExecutionLogEntryResolver
}
```

### <a id="IndexStepsResolver" href="#IndexStepsResolver">type IndexStepsResolver interface</a>

```
searchKey: graphqlbackend.IndexStepsResolver
tags: [interface]
```

```Go
type IndexStepsResolver interface {
	Setup() []ExecutionLogEntryResolver
	PreIndex() []PreIndexStepResolver
	Index() IndexStepResolver
	Upload() ExecutionLogEntryResolver
	Teardown() []ExecutionLogEntryResolver
}
```

### <a id="InsightConnectionResolver" href="#InsightConnectionResolver">type InsightConnectionResolver interface</a>

```
searchKey: graphqlbackend.InsightConnectionResolver
tags: [interface]
```

```Go
type InsightConnectionResolver interface {
	Nodes(ctx context.Context) ([]InsightResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="InsightResolver" href="#InsightResolver">type InsightResolver interface</a>

```
searchKey: graphqlbackend.InsightResolver
tags: [interface]
```

```Go
type InsightResolver interface {
	Title() string
	Description() string
	Series() []InsightSeriesResolver
}
```

### <a id="InsightSeriesResolver" href="#InsightSeriesResolver">type InsightSeriesResolver interface</a>

```
searchKey: graphqlbackend.InsightSeriesResolver
tags: [interface]
```

```Go
type InsightSeriesResolver interface {
	Label() string
	Points(ctx context.Context, args *InsightsPointsArgs) ([]InsightsDataPointResolver, error)
	Status(ctx context.Context) (InsightStatusResolver, error)
}
```

### <a id="InsightStatusResolver" href="#InsightStatusResolver">type InsightStatusResolver interface</a>

```
searchKey: graphqlbackend.InsightStatusResolver
tags: [interface]
```

```Go
type InsightStatusResolver interface {
	TotalPoints() int32
	PendingJobs() int32
	CompletedJobs() int32
	FailedJobs() int32
}
```

### <a id="InsightsDataPointResolver" href="#InsightsDataPointResolver">type InsightsDataPointResolver interface</a>

```
searchKey: graphqlbackend.InsightsDataPointResolver
tags: [interface]
```

```Go
type InsightsDataPointResolver interface {
	DateTime() DateTime
	Value() float64
}
```

### <a id="InsightsPointsArgs" href="#InsightsPointsArgs">type InsightsPointsArgs struct</a>

```
searchKey: graphqlbackend.InsightsPointsArgs
tags: [struct]
```

```Go
type InsightsPointsArgs struct {
	From *DateTime
	To   *DateTime
}
```

### <a id="InsightsResolver" href="#InsightsResolver">type InsightsResolver interface</a>

```
searchKey: graphqlbackend.InsightsResolver
tags: [interface]
```

```Go
type InsightsResolver interface {
	Insights(ctx context.Context) (InsightConnectionResolver, error)
}
```

InsightsResolver is the root resolver. 

### <a id="InvalidNamespaceIDErr" href="#InvalidNamespaceIDErr">type InvalidNamespaceIDErr struct</a>

```
searchKey: graphqlbackend.InvalidNamespaceIDErr
tags: [struct]
```

```Go
type InvalidNamespaceIDErr struct {
	id graphql.ID
}
```

#### <a id="InvalidNamespaceIDErr.Error" href="#InvalidNamespaceIDErr.Error">func (e InvalidNamespaceIDErr) Error() string</a>

```
searchKey: graphqlbackend.InvalidNamespaceIDErr.Error
tags: [method]
```

```Go
func (e InvalidNamespaceIDErr) Error() string
```

### <a id="JSONCString" href="#JSONCString">type JSONCString string</a>

```
searchKey: graphqlbackend.JSONCString
tags: [string]
```

```Go
type JSONCString string
```

JSONCString implements the JSONCString scalar type. 

#### <a id="JSONCString.ImplementsGraphQLType" href="#JSONCString.ImplementsGraphQLType">func (JSONCString) ImplementsGraphQLType(name string) bool</a>

```
searchKey: graphqlbackend.JSONCString.ImplementsGraphQLType
tags: [method]
```

```Go
func (JSONCString) ImplementsGraphQLType(name string) bool
```

#### <a id="JSONCString.MarshalJSON" href="#JSONCString.MarshalJSON">func (j JSONCString) MarshalJSON() ([]byte, error)</a>

```
searchKey: graphqlbackend.JSONCString.MarshalJSON
tags: [method]
```

```Go
func (j JSONCString) MarshalJSON() ([]byte, error)
```

#### <a id="JSONCString.UnmarshalGraphQL" href="#JSONCString.UnmarshalGraphQL">func (j *JSONCString) UnmarshalGraphQL(input interface{}) error</a>

```
searchKey: graphqlbackend.JSONCString.UnmarshalGraphQL
tags: [method]
```

```Go
func (j *JSONCString) UnmarshalGraphQL(input interface{}) error
```

### <a id="JSONValue" href="#JSONValue">type JSONValue struct</a>

```
searchKey: graphqlbackend.JSONValue
tags: [struct]
```

```Go
type JSONValue struct{ Value interface{} }
```

JSONValue implements the JSONValue scalar type. In GraphQL queries, it is represented the JSON representation of its Go value. 

#### <a id="JSONValue.ImplementsGraphQLType" href="#JSONValue.ImplementsGraphQLType">func (JSONValue) ImplementsGraphQLType(name string) bool</a>

```
searchKey: graphqlbackend.JSONValue.ImplementsGraphQLType
tags: [method]
```

```Go
func (JSONValue) ImplementsGraphQLType(name string) bool
```

#### <a id="JSONValue.MarshalJSON" href="#JSONValue.MarshalJSON">func (v JSONValue) MarshalJSON() ([]byte, error)</a>

```
searchKey: graphqlbackend.JSONValue.MarshalJSON
tags: [method]
```

```Go
func (v JSONValue) MarshalJSON() ([]byte, error)
```

#### <a id="JSONValue.UnmarshalGraphQL" href="#JSONValue.UnmarshalGraphQL">func (v *JSONValue) UnmarshalGraphQL(input interface{}) error</a>

```
searchKey: graphqlbackend.JSONValue.UnmarshalGraphQL
tags: [method]
```

```Go
func (v *JSONValue) UnmarshalGraphQL(input interface{}) error
```

#### <a id="JSONValue.UnmarshalJSON" href="#JSONValue.UnmarshalJSON">func (v *JSONValue) UnmarshalJSON(data []byte) error</a>

```
searchKey: graphqlbackend.JSONValue.UnmarshalJSON
tags: [method]
```

```Go
func (v *JSONValue) UnmarshalJSON(data []byte) error
```

### <a id="LSIFDiagnosticsArgs" href="#LSIFDiagnosticsArgs">type LSIFDiagnosticsArgs struct</a>

```
searchKey: graphqlbackend.LSIFDiagnosticsArgs
tags: [struct]
```

```Go
type LSIFDiagnosticsArgs struct {
	graphqlutil.ConnectionArgs
}
```

### <a id="LSIFDocumentationPageArgs" href="#LSIFDocumentationPageArgs">type LSIFDocumentationPageArgs struct</a>

```
searchKey: graphqlbackend.LSIFDocumentationPageArgs
tags: [struct]
```

```Go
type LSIFDocumentationPageArgs struct {
	PathID string
}
```

### <a id="LSIFIndexConnectionResolver" href="#LSIFIndexConnectionResolver">type LSIFIndexConnectionResolver interface</a>

```
searchKey: graphqlbackend.LSIFIndexConnectionResolver
tags: [interface]
```

```Go
type LSIFIndexConnectionResolver interface {
	Nodes(ctx context.Context) ([]LSIFIndexResolver, error)
	TotalCount(ctx context.Context) (*int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="LSIFIndexResolver" href="#LSIFIndexResolver">type LSIFIndexResolver interface</a>

```
searchKey: graphqlbackend.LSIFIndexResolver
tags: [interface]
```

```Go
type LSIFIndexResolver interface {
	ID() graphql.ID
	InputCommit() string
	InputRoot() string
	InputIndexer() string
	QueuedAt() DateTime
	State() string
	Failure() *string
	StartedAt() *DateTime
	FinishedAt() *DateTime
	Steps() IndexStepsResolver
	PlaceInQueue() *int32
	AssociatedUpload(ctx context.Context) (LSIFUploadResolver, error)
	ProjectRoot(ctx context.Context) (*GitTreeEntryResolver, error)
}
```

### <a id="LSIFIndexesQueryArgs" href="#LSIFIndexesQueryArgs">type LSIFIndexesQueryArgs struct</a>

```
searchKey: graphqlbackend.LSIFIndexesQueryArgs
tags: [struct]
```

```Go
type LSIFIndexesQueryArgs struct {
	graphqlutil.ConnectionArgs
	Query *string
	State *string
	After *string
}
```

### <a id="LSIFPagedQueryPositionArgs" href="#LSIFPagedQueryPositionArgs">type LSIFPagedQueryPositionArgs struct</a>

```
searchKey: graphqlbackend.LSIFPagedQueryPositionArgs
tags: [struct]
```

```Go
type LSIFPagedQueryPositionArgs struct {
	LSIFQueryPositionArgs
	graphqlutil.ConnectionArgs
	After *string
}
```

### <a id="LSIFQueryPositionArgs" href="#LSIFQueryPositionArgs">type LSIFQueryPositionArgs struct</a>

```
searchKey: graphqlbackend.LSIFQueryPositionArgs
tags: [struct]
```

```Go
type LSIFQueryPositionArgs struct {
	Line      int32
	Character int32
}
```

### <a id="LSIFRangesArgs" href="#LSIFRangesArgs">type LSIFRangesArgs struct</a>

```
searchKey: graphqlbackend.LSIFRangesArgs
tags: [struct]
```

```Go
type LSIFRangesArgs struct {
	StartLine int32
	EndLine   int32
}
```

### <a id="LSIFRepositoryIndexesQueryArgs" href="#LSIFRepositoryIndexesQueryArgs">type LSIFRepositoryIndexesQueryArgs struct</a>

```
searchKey: graphqlbackend.LSIFRepositoryIndexesQueryArgs
tags: [struct]
```

```Go
type LSIFRepositoryIndexesQueryArgs struct {
	*LSIFIndexesQueryArgs
	RepositoryID graphql.ID
}
```

### <a id="LSIFRepositoryUploadsQueryArgs" href="#LSIFRepositoryUploadsQueryArgs">type LSIFRepositoryUploadsQueryArgs struct</a>

```
searchKey: graphqlbackend.LSIFRepositoryUploadsQueryArgs
tags: [struct]
```

```Go
type LSIFRepositoryUploadsQueryArgs struct {
	*LSIFUploadsQueryArgs
	RepositoryID graphql.ID
}
```

### <a id="LSIFUploadConnectionResolver" href="#LSIFUploadConnectionResolver">type LSIFUploadConnectionResolver interface</a>

```
searchKey: graphqlbackend.LSIFUploadConnectionResolver
tags: [interface]
```

```Go
type LSIFUploadConnectionResolver interface {
	Nodes(ctx context.Context) ([]LSIFUploadResolver, error)
	TotalCount(ctx context.Context) (*int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="LSIFUploadResolver" href="#LSIFUploadResolver">type LSIFUploadResolver interface</a>

```
searchKey: graphqlbackend.LSIFUploadResolver
tags: [interface]
```

```Go
type LSIFUploadResolver interface {
	ID() graphql.ID
	InputCommit() string
	InputRoot() string
	IsLatestForRepo() bool
	UploadedAt() DateTime
	State() string
	Failure() *string
	StartedAt() *DateTime
	FinishedAt() *DateTime
	InputIndexer() string
	PlaceInQueue() *int32
	AssociatedIndex(ctx context.Context) (LSIFIndexResolver, error)
	ProjectRoot(ctx context.Context) (*GitTreeEntryResolver, error)
}
```

### <a id="LSIFUploadsQueryArgs" href="#LSIFUploadsQueryArgs">type LSIFUploadsQueryArgs struct</a>

```
searchKey: graphqlbackend.LSIFUploadsQueryArgs
tags: [struct]
```

```Go
type LSIFUploadsQueryArgs struct {
	graphqlutil.ConnectionArgs
	Query           *string
	State           *string
	IsLatestForRepo *bool
	After           *string
}
```

### <a id="LicenseResolver" href="#LicenseResolver">type LicenseResolver interface</a>

```
searchKey: graphqlbackend.LicenseResolver
tags: [interface]
```

```Go
type LicenseResolver interface {
	EnterpriseLicenseHasFeature(ctx context.Context, args *EnterpriseLicenseHasFeatureArgs) (bool, error)
}
```

### <a id="LimitWatcher" href="#LimitWatcher">type LimitWatcher interface</a>

```
searchKey: graphqlbackend.LimitWatcher
tags: [interface]
```

```Go
type LimitWatcher interface {
	Get() (Limiter, bool)
}
```

### <a id="Limiter" href="#Limiter">type Limiter interface</a>

```
searchKey: graphqlbackend.Limiter
tags: [interface]
```

```Go
type Limiter interface {
	RateLimit(key string, quantity int, args LimiterArgs) (bool, throttled.RateLimitResult, error)
}
```

### <a id="LimiterArgs" href="#LimiterArgs">type LimiterArgs struct</a>

```
searchKey: graphqlbackend.LimiterArgs
tags: [struct]
```

```Go
type LimiterArgs struct {
	IsIP          bool
	Anonymous     bool
	RequestName   string
	RequestSource trace.SourceType
}
```

### <a id="ListActionArgs" href="#ListActionArgs">type ListActionArgs struct</a>

```
searchKey: graphqlbackend.ListActionArgs
tags: [struct]
```

```Go
type ListActionArgs struct {
	First int32
	After *string
}
```

### <a id="ListBatchChangeBulkOperationArgs" href="#ListBatchChangeBulkOperationArgs">type ListBatchChangeBulkOperationArgs struct</a>

```
searchKey: graphqlbackend.ListBatchChangeBulkOperationArgs
tags: [struct]
```

```Go
type ListBatchChangeBulkOperationArgs struct {
	First        int32
	After        *string
	CreatedAfter *DateTime
}
```

### <a id="ListBatchChangesArgs" href="#ListBatchChangesArgs">type ListBatchChangesArgs struct</a>

```
searchKey: graphqlbackend.ListBatchChangesArgs
tags: [struct]
```

```Go
type ListBatchChangesArgs struct {
	First               int32
	After               *string
	State               *string
	ViewerCanAdminister *bool

	Namespace *graphql.ID
}
```

### <a id="ListBatchChangesCodeHostsArgs" href="#ListBatchChangesCodeHostsArgs">type ListBatchChangesCodeHostsArgs struct</a>

```
searchKey: graphqlbackend.ListBatchChangesCodeHostsArgs
tags: [struct]
```

```Go
type ListBatchChangesCodeHostsArgs struct {
	First  int32
	After  *string
	UserID *int32
}
```

### <a id="ListCampaignsCodeHostsArgs" href="#ListCampaignsCodeHostsArgs">type ListCampaignsCodeHostsArgs struct</a>

```
searchKey: graphqlbackend.ListCampaignsCodeHostsArgs
tags: [struct]
```

```Go
type ListCampaignsCodeHostsArgs struct {
	First  int32
	After  *string
	UserID int32
}
```

TODO(campaigns-deprecation) 

### <a id="ListChangesetsArgs" href="#ListChangesetsArgs">type ListChangesetsArgs struct</a>

```
searchKey: graphqlbackend.ListChangesetsArgs
tags: [struct]
```

```Go
type ListChangesetsArgs struct {
	First int32
	After *string
	// PublicationState is a value of type *btypes.ChangesetPublicationState.
	PublicationState *string
	// ReconcilerState is a slice of *btypes.ReconcilerState.
	ReconcilerState *[]string
	// ExternalState is a value of type *btypes.ChangesetExternalState.
	ExternalState *string
	// State is a value of type *btypes.ChangesetState.
	State *string
	// ReviewState is a value of type *btypes.ChangesetReviewState.
	ReviewState *string
	// CheckState is a value of type *btypes.ChangesetCheckState.
	CheckState *string
	// old
	OnlyPublishedByThisCampaign *bool
	//new
	OnlyPublishedByThisBatchChange *bool
	Search                         *string

	OnlyArchived bool
}
```

### <a id="ListEventsArgs" href="#ListEventsArgs">type ListEventsArgs struct</a>

```
searchKey: graphqlbackend.ListEventsArgs
tags: [struct]
```

```Go
type ListEventsArgs struct {
	First int32
	After *string
}
```

### <a id="ListMonitorsArgs" href="#ListMonitorsArgs">type ListMonitorsArgs struct</a>

```
searchKey: graphqlbackend.ListMonitorsArgs
tags: [struct]
```

```Go
type ListMonitorsArgs struct {
	First int32
	After *string
}
```

### <a id="ListRecipientsArgs" href="#ListRecipientsArgs">type ListRecipientsArgs struct</a>

```
searchKey: graphqlbackend.ListRecipientsArgs
tags: [struct]
```

```Go
type ListRecipientsArgs struct {
	First int32
	After *string
}
```

### <a id="ListUserRepositoriesArgs" href="#ListUserRepositoriesArgs">type ListUserRepositoriesArgs struct</a>

```
searchKey: graphqlbackend.ListUserRepositoriesArgs
tags: [struct]
```

```Go
type ListUserRepositoriesArgs struct {
	First             *int32
	Query             *string
	After             *string
	Cloned            bool
	NotCloned         bool
	Indexed           bool
	NotIndexed        bool
	ExternalServiceID *graphql.ID
	OrderBy           *string
	Descending        bool
}
```

### <a id="ListViewerBatchChangesCodeHostsArgs" href="#ListViewerBatchChangesCodeHostsArgs">type ListViewerBatchChangesCodeHostsArgs struct</a>

```
searchKey: graphqlbackend.ListViewerBatchChangesCodeHostsArgs
tags: [struct]
```

```Go
type ListViewerBatchChangesCodeHostsArgs struct {
	First                 int32
	After                 *string
	OnlyWithoutCredential bool
}
```

### <a id="ListViewerCampaignsCodeHostsArgs" href="#ListViewerCampaignsCodeHostsArgs">type ListViewerCampaignsCodeHostsArgs struct</a>

```
searchKey: graphqlbackend.ListViewerCampaignsCodeHostsArgs
tags: [struct]
```

```Go
type ListViewerCampaignsCodeHostsArgs struct {
	First                 int32
	After                 *string
	OnlyWithoutCredential bool
}
```

TODO(campaigns-deprecation) 

### <a id="LocationConnectionResolver" href="#LocationConnectionResolver">type LocationConnectionResolver interface</a>

```
searchKey: graphqlbackend.LocationConnectionResolver
tags: [interface]
```

```Go
type LocationConnectionResolver interface {
	Nodes(ctx context.Context) ([]LocationResolver, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="LocationResolver" href="#LocationResolver">type LocationResolver interface</a>

```
searchKey: graphqlbackend.LocationResolver
tags: [interface]
```

```Go
type LocationResolver interface {
	Resource() *GitTreeEntryResolver
	Range() *rangeResolver
	URL(ctx context.Context) (string, error)
	CanonicalURL() string
}
```

#### <a id="NewLocationResolver" href="#NewLocationResolver">func NewLocationResolver(resource *GitTreeEntryResolver, lspRange *lsp.Range) LocationResolver</a>

```
searchKey: graphqlbackend.NewLocationResolver
tags: [function]
```

```Go
func NewLocationResolver(resource *GitTreeEntryResolver, lspRange *lsp.Range) LocationResolver
```

### <a id="Markdown" href="#Markdown">type Markdown string</a>

```
searchKey: graphqlbackend.Markdown
tags: [string]
```

```Go
type Markdown string
```

#### <a id="Markdown.HTML" href="#Markdown.HTML">func (m Markdown) HTML() string</a>

```
searchKey: graphqlbackend.Markdown.HTML
tags: [method]
```

```Go
func (m Markdown) HTML() string
```

#### <a id="Markdown.Text" href="#Markdown.Text">func (m Markdown) Text() string</a>

```
searchKey: graphqlbackend.Markdown.Text
tags: [method]
```

```Go
func (m Markdown) Text() string
```

### <a id="MergeChangesetsArgs" href="#MergeChangesetsArgs">type MergeChangesetsArgs struct</a>

```
searchKey: graphqlbackend.MergeChangesetsArgs
tags: [struct]
```

```Go
type MergeChangesetsArgs struct {
	BulkOperationBaseArgs
	Squash bool
}
```

### <a id="MonitorAction" href="#MonitorAction">type MonitorAction interface</a>

```
searchKey: graphqlbackend.MonitorAction
tags: [interface]
```

```Go
type MonitorAction interface {
	ToMonitorEmail() (MonitorEmailResolver, bool)
}
```

### <a id="MonitorActionConnectionResolver" href="#MonitorActionConnectionResolver">type MonitorActionConnectionResolver interface</a>

```
searchKey: graphqlbackend.MonitorActionConnectionResolver
tags: [interface]
```

```Go
type MonitorActionConnectionResolver interface {
	Nodes(ctx context.Context) ([]MonitorAction, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="MonitorActionEmailRecipientsConnectionResolver" href="#MonitorActionEmailRecipientsConnectionResolver">type MonitorActionEmailRecipientsConnectionResolver interface</a>

```
searchKey: graphqlbackend.MonitorActionEmailRecipientsConnectionResolver
tags: [interface]
```

```Go
type MonitorActionEmailRecipientsConnectionResolver interface {
	Nodes(ctx context.Context) ([]NamespaceResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="MonitorActionEventConnectionResolver" href="#MonitorActionEventConnectionResolver">type MonitorActionEventConnectionResolver interface</a>

```
searchKey: graphqlbackend.MonitorActionEventConnectionResolver
tags: [interface]
```

```Go
type MonitorActionEventConnectionResolver interface {
	Nodes(ctx context.Context) ([]MonitorActionEventResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="MonitorActionEventResolver" href="#MonitorActionEventResolver">type MonitorActionEventResolver interface</a>

```
searchKey: graphqlbackend.MonitorActionEventResolver
tags: [interface]
```

```Go
type MonitorActionEventResolver interface {
	ID() graphql.ID
	Status() (string, error)
	Message() *string
	Timestamp() DateTime
}
```

### <a id="MonitorConnectionResolver" href="#MonitorConnectionResolver">type MonitorConnectionResolver interface</a>

```
searchKey: graphqlbackend.MonitorConnectionResolver
tags: [interface]
```

```Go
type MonitorConnectionResolver interface {
	Nodes(ctx context.Context) ([]MonitorResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="MonitorEmailRecipient" href="#MonitorEmailRecipient">type MonitorEmailRecipient interface</a>

```
searchKey: graphqlbackend.MonitorEmailRecipient
tags: [interface]
```

```Go
type MonitorEmailRecipient interface {
	ToUser() (*UserResolver, bool)
}
```

### <a id="MonitorEmailResolver" href="#MonitorEmailResolver">type MonitorEmailResolver interface</a>

```
searchKey: graphqlbackend.MonitorEmailResolver
tags: [interface]
```

```Go
type MonitorEmailResolver interface {
	ID() graphql.ID
	Enabled() bool
	Priority() string
	Header() string
	Recipients(ctx context.Context, args *ListRecipientsArgs) (MonitorActionEmailRecipientsConnectionResolver, error)
	Events(ctx context.Context, args *ListEventsArgs) (MonitorActionEventConnectionResolver, error)
}
```

### <a id="MonitorQueryResolver" href="#MonitorQueryResolver">type MonitorQueryResolver interface</a>

```
searchKey: graphqlbackend.MonitorQueryResolver
tags: [interface]
```

```Go
type MonitorQueryResolver interface {
	ID() graphql.ID
	Query() string
	Events(ctx context.Context, args *ListEventsArgs) (MonitorTriggerEventConnectionResolver, error)
}
```

### <a id="MonitorResolver" href="#MonitorResolver">type MonitorResolver interface</a>

```
searchKey: graphqlbackend.MonitorResolver
tags: [interface]
```

```Go
type MonitorResolver interface {
	ID() graphql.ID
	CreatedBy(ctx context.Context) (*UserResolver, error)
	CreatedAt() DateTime
	Description() string
	Owner(ctx context.Context) (NamespaceResolver, error)
	Enabled() bool
	Trigger(ctx context.Context) (MonitorTrigger, error)
	Actions(ctx context.Context, args *ListActionArgs) (MonitorActionConnectionResolver, error)
}
```

### <a id="MonitorTrigger" href="#MonitorTrigger">type MonitorTrigger interface</a>

```
searchKey: graphqlbackend.MonitorTrigger
tags: [interface]
```

```Go
type MonitorTrigger interface {
	ToMonitorQuery() (MonitorQueryResolver, bool)
}
```

### <a id="MonitorTriggerEventConnectionResolver" href="#MonitorTriggerEventConnectionResolver">type MonitorTriggerEventConnectionResolver interface</a>

```
searchKey: graphqlbackend.MonitorTriggerEventConnectionResolver
tags: [interface]
```

```Go
type MonitorTriggerEventConnectionResolver interface {
	Nodes(ctx context.Context) ([]MonitorTriggerEventResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="MonitorTriggerEventResolver" href="#MonitorTriggerEventResolver">type MonitorTriggerEventResolver interface</a>

```
searchKey: graphqlbackend.MonitorTriggerEventResolver
tags: [interface]
```

```Go
type MonitorTriggerEventResolver interface {
	ID() graphql.ID
	Status() (string, error)
	Message() *string
	Timestamp() (DateTime, error)
	Actions(ctx context.Context, args *ListActionArgs) (MonitorActionConnectionResolver, error)
}
```

### <a id="MonitoringAlert" href="#MonitoringAlert">type MonitoringAlert srcprometheus.MonitoringAlert</a>

```
searchKey: graphqlbackend.MonitoringAlert
tags: [struct]
```

```Go
type MonitoringAlert srcprometheus.MonitoringAlert
```

MonitoringAlert implements GraphQL getters on top of srcprometheus.MonitoringAlert 

#### <a id="MonitoringAlert.Average" href="#MonitoringAlert.Average">func (r *MonitoringAlert) Average() float64</a>

```
searchKey: graphqlbackend.MonitoringAlert.Average
tags: [method]
```

```Go
func (r *MonitoringAlert) Average() float64
```

#### <a id="MonitoringAlert.Name" href="#MonitoringAlert.Name">func (r *MonitoringAlert) Name() string</a>

```
searchKey: graphqlbackend.MonitoringAlert.Name
tags: [method]
```

```Go
func (r *MonitoringAlert) Name() string
```

#### <a id="MonitoringAlert.Owner" href="#MonitoringAlert.Owner">func (r *MonitoringAlert) Owner() string</a>

```
searchKey: graphqlbackend.MonitoringAlert.Owner
tags: [method]
```

```Go
func (r *MonitoringAlert) Owner() string
```

#### <a id="MonitoringAlert.ServiceName" href="#MonitoringAlert.ServiceName">func (r *MonitoringAlert) ServiceName() string</a>

```
searchKey: graphqlbackend.MonitoringAlert.ServiceName
tags: [method]
```

```Go
func (r *MonitoringAlert) ServiceName() string
```

#### <a id="MonitoringAlert.Timestamp" href="#MonitoringAlert.Timestamp">func (r *MonitoringAlert) Timestamp() DateTime</a>

```
searchKey: graphqlbackend.MonitoringAlert.Timestamp
tags: [method]
```

```Go
func (r *MonitoringAlert) Timestamp() DateTime
```

### <a id="MoveBatchChangeArgs" href="#MoveBatchChangeArgs">type MoveBatchChangeArgs struct</a>

```
searchKey: graphqlbackend.MoveBatchChangeArgs
tags: [struct]
```

```Go
type MoveBatchChangeArgs struct {
	BatchChange  graphql.ID
	NewName      *string
	NewNamespace *graphql.ID
}
```

### <a id="MoveCampaignArgs" href="#MoveCampaignArgs">type MoveCampaignArgs struct</a>

```
searchKey: graphqlbackend.MoveCampaignArgs
tags: [struct]
```

```Go
type MoveCampaignArgs struct {
	Campaign     graphql.ID
	NewName      *string
	NewNamespace *graphql.ID
}
```

TODO(campaigns-deprecation) 

### <a id="Namespace" href="#Namespace">type Namespace interface</a>

```
searchKey: graphqlbackend.Namespace
tags: [interface]
```

```Go
type Namespace interface {
	ID() graphql.ID
	URL() string
	NamespaceName() string
}
```

Namespace is the interface for the GraphQL Namespace interface. 

#### <a id="NamespaceByID" href="#NamespaceByID">func NamespaceByID(ctx context.Context, db dbutil.DB, id graphql.ID) (Namespace, error)</a>

```
searchKey: graphqlbackend.NamespaceByID
tags: [function]
```

```Go
func NamespaceByID(ctx context.Context, db dbutil.DB, id graphql.ID) (Namespace, error)
```

NamespaceByID looks up a GraphQL value of type Namespace by ID. 

### <a id="NamespaceResolver" href="#NamespaceResolver">type NamespaceResolver struct</a>

```
searchKey: graphqlbackend.NamespaceResolver
tags: [struct]
```

```Go
type NamespaceResolver struct {
	Namespace
}
```

NamespaceResolver resolves the GraphQL Namespace interface to a type. 

#### <a id="NamespaceResolver.ToOrg" href="#NamespaceResolver.ToOrg">func (r NamespaceResolver) ToOrg() (*OrgResolver, bool)</a>

```
searchKey: graphqlbackend.NamespaceResolver.ToOrg
tags: [method]
```

```Go
func (r NamespaceResolver) ToOrg() (*OrgResolver, bool)
```

#### <a id="NamespaceResolver.ToUser" href="#NamespaceResolver.ToUser">func (r NamespaceResolver) ToUser() (*UserResolver, bool)</a>

```
searchKey: graphqlbackend.NamespaceResolver.ToUser
tags: [method]
```

```Go
func (r NamespaceResolver) ToUser() (*UserResolver, bool)
```

### <a id="NewFileFunc" href="#NewFileFunc">type NewFileFunc func(db github.com/sourcegraph/sourcegraph/internal/database/dbutil.DB, r *github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.FileDiffResolver) github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.FileResolver</a>

```
searchKey: graphqlbackend.NewFileFunc
tags: [function]
```

```Go
type NewFileFunc func(db dbutil.DB, r *FileDiffResolver) FileResolver
```

NewFileFunc is a function that returns the "new" file in a FileDiff as a FileResolver. 

### <a id="Node" href="#Node">type Node interface</a>

```
searchKey: graphqlbackend.Node
tags: [interface]
```

```Go
type Node interface {
	ID() graphql.ID
}
```

Node must be implemented by any resolver that implements the Node interface in GraphQL. When defining a new type implementing Node, the NodeResolver below needs a ToXX type assertion method, and the node resolver needs to be registered in the nodeByIDFns on the schemaResolver. 

### <a id="NodeByIDFunc" href="#NodeByIDFunc">type NodeByIDFunc func(ctx context.Context, id github.com/graph-gophers/graphql-go.ID) (github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.Node, error)</a>

```
searchKey: graphqlbackend.NodeByIDFunc
tags: [function]
```

```Go
type NodeByIDFunc = func(ctx context.Context, id graphql.ID) (Node, error)
```

### <a id="NodeResolver" href="#NodeResolver">type NodeResolver struct</a>

```
searchKey: graphqlbackend.NodeResolver
tags: [struct]
```

```Go
type NodeResolver struct {
	Node
}
```

#### <a id="NodeResolver.ToAccessToken" href="#NodeResolver.ToAccessToken">func (r *NodeResolver) ToAccessToken() (*accessTokenResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToAccessToken
tags: [method]
```

```Go
func (r *NodeResolver) ToAccessToken() (*accessTokenResolver, bool)
```

#### <a id="NodeResolver.ToBatchChange" href="#NodeResolver.ToBatchChange">func (r *NodeResolver) ToBatchChange() (BatchChangeResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToBatchChange
tags: [method]
```

```Go
func (r *NodeResolver) ToBatchChange() (BatchChangeResolver, bool)
```

#### <a id="NodeResolver.ToBatchChangesCredential" href="#NodeResolver.ToBatchChangesCredential">func (r *NodeResolver) ToBatchChangesCredential() (BatchChangesCredentialResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToBatchChangesCredential
tags: [method]
```

```Go
func (r *NodeResolver) ToBatchChangesCredential() (BatchChangesCredentialResolver, bool)
```

#### <a id="NodeResolver.ToBatchSpec" href="#NodeResolver.ToBatchSpec">func (r *NodeResolver) ToBatchSpec() (BatchSpecResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToBatchSpec
tags: [method]
```

```Go
func (r *NodeResolver) ToBatchSpec() (BatchSpecResolver, bool)
```

#### <a id="NodeResolver.ToBulkOperation" href="#NodeResolver.ToBulkOperation">func (r *NodeResolver) ToBulkOperation() (BulkOperationResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToBulkOperation
tags: [method]
```

```Go
func (r *NodeResolver) ToBulkOperation() (BulkOperationResolver, bool)
```

#### <a id="NodeResolver.ToCampaign" href="#NodeResolver.ToCampaign">func (r *NodeResolver) ToCampaign() (BatchChangeResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToCampaign
tags: [method]
```

```Go
func (r *NodeResolver) ToCampaign() (BatchChangeResolver, bool)
```

TODO(campaigns-deprecation): This should be removed once we remove campaigns completely 

#### <a id="NodeResolver.ToCampaignSpec" href="#NodeResolver.ToCampaignSpec">func (r *NodeResolver) ToCampaignSpec() (BatchSpecResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToCampaignSpec
tags: [method]
```

```Go
func (r *NodeResolver) ToCampaignSpec() (BatchSpecResolver, bool)
```

TODO(campaigns-deprecation): This should be removed once we remove campaigns completely 

#### <a id="NodeResolver.ToCampaignsCredential" href="#NodeResolver.ToCampaignsCredential">func (r *NodeResolver) ToCampaignsCredential() (CampaignsCredentialResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToCampaignsCredential
tags: [method]
```

```Go
func (r *NodeResolver) ToCampaignsCredential() (CampaignsCredentialResolver, bool)
```

TODO(campaigns-deprecation): This should be removed once we remove campaigns completely 

#### <a id="NodeResolver.ToChangesetEvent" href="#NodeResolver.ToChangesetEvent">func (r *NodeResolver) ToChangesetEvent() (ChangesetEventResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToChangesetEvent
tags: [method]
```

```Go
func (r *NodeResolver) ToChangesetEvent() (ChangesetEventResolver, bool)
```

#### <a id="NodeResolver.ToExternalAccount" href="#NodeResolver.ToExternalAccount">func (r *NodeResolver) ToExternalAccount() (*externalAccountResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToExternalAccount
tags: [method]
```

```Go
func (r *NodeResolver) ToExternalAccount() (*externalAccountResolver, bool)
```

#### <a id="NodeResolver.ToExternalChangeset" href="#NodeResolver.ToExternalChangeset">func (r *NodeResolver) ToExternalChangeset() (ExternalChangesetResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToExternalChangeset
tags: [method]
```

```Go
func (r *NodeResolver) ToExternalChangeset() (ExternalChangesetResolver, bool)
```

#### <a id="NodeResolver.ToExternalService" href="#NodeResolver.ToExternalService">func (r *NodeResolver) ToExternalService() (*externalServiceResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToExternalService
tags: [method]
```

```Go
func (r *NodeResolver) ToExternalService() (*externalServiceResolver, bool)
```

#### <a id="NodeResolver.ToGitCommit" href="#NodeResolver.ToGitCommit">func (r *NodeResolver) ToGitCommit() (*GitCommitResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToGitCommit
tags: [method]
```

```Go
func (r *NodeResolver) ToGitCommit() (*GitCommitResolver, bool)
```

#### <a id="NodeResolver.ToGitRef" href="#NodeResolver.ToGitRef">func (r *NodeResolver) ToGitRef() (*GitRefResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToGitRef
tags: [method]
```

```Go
func (r *NodeResolver) ToGitRef() (*GitRefResolver, bool)
```

#### <a id="NodeResolver.ToHiddenChangesetSpec" href="#NodeResolver.ToHiddenChangesetSpec">func (r *NodeResolver) ToHiddenChangesetSpec() (HiddenChangesetSpecResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToHiddenChangesetSpec
tags: [method]
```

```Go
func (r *NodeResolver) ToHiddenChangesetSpec() (HiddenChangesetSpecResolver, bool)
```

#### <a id="NodeResolver.ToHiddenExternalChangeset" href="#NodeResolver.ToHiddenExternalChangeset">func (r *NodeResolver) ToHiddenExternalChangeset() (HiddenExternalChangesetResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToHiddenExternalChangeset
tags: [method]
```

```Go
func (r *NodeResolver) ToHiddenExternalChangeset() (HiddenExternalChangesetResolver, bool)
```

#### <a id="NodeResolver.ToLSIFIndex" href="#NodeResolver.ToLSIFIndex">func (r *NodeResolver) ToLSIFIndex() (LSIFIndexResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToLSIFIndex
tags: [method]
```

```Go
func (r *NodeResolver) ToLSIFIndex() (LSIFIndexResolver, bool)
```

#### <a id="NodeResolver.ToLSIFUpload" href="#NodeResolver.ToLSIFUpload">func (r *NodeResolver) ToLSIFUpload() (LSIFUploadResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToLSIFUpload
tags: [method]
```

```Go
func (r *NodeResolver) ToLSIFUpload() (LSIFUploadResolver, bool)
```

#### <a id="NodeResolver.ToMonitor" href="#NodeResolver.ToMonitor">func (r *NodeResolver) ToMonitor() (MonitorResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToMonitor
tags: [method]
```

```Go
func (r *NodeResolver) ToMonitor() (MonitorResolver, bool)
```

#### <a id="NodeResolver.ToMonitorActionEvent" href="#NodeResolver.ToMonitorActionEvent">func (r *NodeResolver) ToMonitorActionEvent() (MonitorActionEventResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToMonitorActionEvent
tags: [method]
```

```Go
func (r *NodeResolver) ToMonitorActionEvent() (MonitorActionEventResolver, bool)
```

#### <a id="NodeResolver.ToMonitorEmail" href="#NodeResolver.ToMonitorEmail">func (r *NodeResolver) ToMonitorEmail() (MonitorEmailResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToMonitorEmail
tags: [method]
```

```Go
func (r *NodeResolver) ToMonitorEmail() (MonitorEmailResolver, bool)
```

#### <a id="NodeResolver.ToMonitorQuery" href="#NodeResolver.ToMonitorQuery">func (r *NodeResolver) ToMonitorQuery() (MonitorQueryResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToMonitorQuery
tags: [method]
```

```Go
func (r *NodeResolver) ToMonitorQuery() (MonitorQueryResolver, bool)
```

#### <a id="NodeResolver.ToMonitorTriggerEvent" href="#NodeResolver.ToMonitorTriggerEvent">func (r *NodeResolver) ToMonitorTriggerEvent() (MonitorTriggerEventResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToMonitorTriggerEvent
tags: [method]
```

```Go
func (r *NodeResolver) ToMonitorTriggerEvent() (MonitorTriggerEventResolver, bool)
```

#### <a id="NodeResolver.ToOrg" href="#NodeResolver.ToOrg">func (r *NodeResolver) ToOrg() (*OrgResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToOrg
tags: [method]
```

```Go
func (r *NodeResolver) ToOrg() (*OrgResolver, bool)
```

#### <a id="NodeResolver.ToOrganizationInvitation" href="#NodeResolver.ToOrganizationInvitation">func (r *NodeResolver) ToOrganizationInvitation() (*organizationInvitationResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToOrganizationInvitation
tags: [method]
```

```Go
func (r *NodeResolver) ToOrganizationInvitation() (*organizationInvitationResolver, bool)
```

#### <a id="NodeResolver.ToOutOfBandMigration" href="#NodeResolver.ToOutOfBandMigration">func (r *NodeResolver) ToOutOfBandMigration() (*outOfBandMigrationResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToOutOfBandMigration
tags: [method]
```

```Go
func (r *NodeResolver) ToOutOfBandMigration() (*outOfBandMigrationResolver, bool)
```

#### <a id="NodeResolver.ToProductLicense" href="#NodeResolver.ToProductLicense">func (r *NodeResolver) ToProductLicense() (ProductLicense, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToProductLicense
tags: [method]
```

```Go
func (r *NodeResolver) ToProductLicense() (ProductLicense, bool)
```

#### <a id="NodeResolver.ToProductSubscription" href="#NodeResolver.ToProductSubscription">func (r *NodeResolver) ToProductSubscription() (ProductSubscription, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToProductSubscription
tags: [method]
```

```Go
func (r *NodeResolver) ToProductSubscription() (ProductSubscription, bool)
```

#### <a id="NodeResolver.ToRegistryExtension" href="#NodeResolver.ToRegistryExtension">func (r *NodeResolver) ToRegistryExtension() (RegistryExtension, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToRegistryExtension
tags: [method]
```

```Go
func (r *NodeResolver) ToRegistryExtension() (RegistryExtension, bool)
```

#### <a id="NodeResolver.ToRepository" href="#NodeResolver.ToRepository">func (r *NodeResolver) ToRepository() (*RepositoryResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToRepository
tags: [method]
```

```Go
func (r *NodeResolver) ToRepository() (*RepositoryResolver, bool)
```

#### <a id="NodeResolver.ToSavedSearch" href="#NodeResolver.ToSavedSearch">func (r *NodeResolver) ToSavedSearch() (*savedSearchResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToSavedSearch
tags: [method]
```

```Go
func (r *NodeResolver) ToSavedSearch() (*savedSearchResolver, bool)
```

#### <a id="NodeResolver.ToSearchContext" href="#NodeResolver.ToSearchContext">func (r *NodeResolver) ToSearchContext() (*searchContextResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToSearchContext
tags: [method]
```

```Go
func (r *NodeResolver) ToSearchContext() (*searchContextResolver, bool)
```

#### <a id="NodeResolver.ToSite" href="#NodeResolver.ToSite">func (r *NodeResolver) ToSite() (*siteResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToSite
tags: [method]
```

```Go
func (r *NodeResolver) ToSite() (*siteResolver, bool)
```

#### <a id="NodeResolver.ToUser" href="#NodeResolver.ToUser">func (r *NodeResolver) ToUser() (*UserResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToUser
tags: [method]
```

```Go
func (r *NodeResolver) ToUser() (*UserResolver, bool)
```

#### <a id="NodeResolver.ToVisibleChangesetSpec" href="#NodeResolver.ToVisibleChangesetSpec">func (r *NodeResolver) ToVisibleChangesetSpec() (VisibleChangesetSpecResolver, bool)</a>

```
searchKey: graphqlbackend.NodeResolver.ToVisibleChangesetSpec
tags: [method]
```

```Go
func (r *NodeResolver) ToVisibleChangesetSpec() (VisibleChangesetSpecResolver, bool)
```

### <a id="OrgResolver" href="#OrgResolver">type OrgResolver struct</a>

```
searchKey: graphqlbackend.OrgResolver
tags: [struct]
```

```Go
type OrgResolver struct {
	db  dbutil.DB
	org *types.Org
}
```

#### <a id="NewOrg" href="#NewOrg">func NewOrg(db dbutil.DB, org *types.Org) *OrgResolver</a>

```
searchKey: graphqlbackend.NewOrg
tags: [function]
```

```Go
func NewOrg(db dbutil.DB, org *types.Org) *OrgResolver
```

#### <a id="OrgByID" href="#OrgByID">func OrgByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*OrgResolver, error)</a>

```
searchKey: graphqlbackend.OrgByID
tags: [function]
```

```Go
func OrgByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*OrgResolver, error)
```

#### <a id="OrgByIDInt32" href="#OrgByIDInt32">func OrgByIDInt32(ctx context.Context, db dbutil.DB, orgID int32) (*OrgResolver, error)</a>

```
searchKey: graphqlbackend.OrgByIDInt32
tags: [function]
```

```Go
func OrgByIDInt32(ctx context.Context, db dbutil.DB, orgID int32) (*OrgResolver, error)
```

#### <a id="OrgResolver.BatchChanges" href="#OrgResolver.BatchChanges">func (o *OrgResolver) BatchChanges(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)</a>

```
searchKey: graphqlbackend.OrgResolver.BatchChanges
tags: [method]
```

```Go
func (o *OrgResolver) BatchChanges(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)
```

#### <a id="OrgResolver.Campaigns" href="#OrgResolver.Campaigns">func (o *OrgResolver) Campaigns(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)</a>

```
searchKey: graphqlbackend.OrgResolver.Campaigns
tags: [method]
```

```Go
func (o *OrgResolver) Campaigns(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)
```

TODO(campaigns-deprecation): 

#### <a id="OrgResolver.ConfigurationCascade" href="#OrgResolver.ConfigurationCascade">func (o *OrgResolver) ConfigurationCascade() *settingsCascade</a>

```
searchKey: graphqlbackend.OrgResolver.ConfigurationCascade
tags: [method]
```

```Go
func (o *OrgResolver) ConfigurationCascade() *settingsCascade
```

#### <a id="OrgResolver.CreatedAt" href="#OrgResolver.CreatedAt">func (o *OrgResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.OrgResolver.CreatedAt
tags: [method]
```

```Go
func (o *OrgResolver) CreatedAt() DateTime
```

#### <a id="OrgResolver.DisplayName" href="#OrgResolver.DisplayName">func (o *OrgResolver) DisplayName() *string</a>

```
searchKey: graphqlbackend.OrgResolver.DisplayName
tags: [method]
```

```Go
func (o *OrgResolver) DisplayName() *string
```

#### <a id="OrgResolver.ID" href="#OrgResolver.ID">func (o *OrgResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.OrgResolver.ID
tags: [method]
```

```Go
func (o *OrgResolver) ID() graphql.ID
```

#### <a id="OrgResolver.LatestSettings" href="#OrgResolver.LatestSettings">func (o *OrgResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)</a>

```
searchKey: graphqlbackend.OrgResolver.LatestSettings
tags: [method]
```

```Go
func (o *OrgResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)
```

#### <a id="OrgResolver.Members" href="#OrgResolver.Members">func (o *OrgResolver) Members(ctx context.Context) (*staticUserConnectionResolver, error)</a>

```
searchKey: graphqlbackend.OrgResolver.Members
tags: [method]
```

```Go
func (o *OrgResolver) Members(ctx context.Context) (*staticUserConnectionResolver, error)
```

#### <a id="OrgResolver.Name" href="#OrgResolver.Name">func (o *OrgResolver) Name() string</a>

```
searchKey: graphqlbackend.OrgResolver.Name
tags: [method]
```

```Go
func (o *OrgResolver) Name() string
```

#### <a id="OrgResolver.NamespaceName" href="#OrgResolver.NamespaceName">func (o *OrgResolver) NamespaceName() string</a>

```
searchKey: graphqlbackend.OrgResolver.NamespaceName
tags: [method]
```

```Go
func (o *OrgResolver) NamespaceName() string
```

#### <a id="OrgResolver.OrgID" href="#OrgResolver.OrgID">func (o *OrgResolver) OrgID() int32</a>

```
searchKey: graphqlbackend.OrgResolver.OrgID
tags: [method]
```

```Go
func (o *OrgResolver) OrgID() int32
```

#### <a id="OrgResolver.SettingsCascade" href="#OrgResolver.SettingsCascade">func (o *OrgResolver) SettingsCascade() *settingsCascade</a>

```
searchKey: graphqlbackend.OrgResolver.SettingsCascade
tags: [method]
```

```Go
func (o *OrgResolver) SettingsCascade() *settingsCascade
```

#### <a id="OrgResolver.SettingsURL" href="#OrgResolver.SettingsURL">func (o *OrgResolver) SettingsURL() *string</a>

```
searchKey: graphqlbackend.OrgResolver.SettingsURL
tags: [method]
```

```Go
func (o *OrgResolver) SettingsURL() *string
```

#### <a id="OrgResolver.URL" href="#OrgResolver.URL">func (o *OrgResolver) URL() string</a>

```
searchKey: graphqlbackend.OrgResolver.URL
tags: [method]
```

```Go
func (o *OrgResolver) URL() string
```

#### <a id="OrgResolver.ViewerCanAdminister" href="#OrgResolver.ViewerCanAdminister">func (o *OrgResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.OrgResolver.ViewerCanAdminister
tags: [method]
```

```Go
func (o *OrgResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

#### <a id="OrgResolver.ViewerIsMember" href="#OrgResolver.ViewerIsMember">func (o *OrgResolver) ViewerIsMember(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.OrgResolver.ViewerIsMember
tags: [method]
```

```Go
func (o *OrgResolver) ViewerIsMember(ctx context.Context) (bool, error)
```

#### <a id="OrgResolver.ViewerPendingInvitation" href="#OrgResolver.ViewerPendingInvitation">func (o *OrgResolver) ViewerPendingInvitation(ctx context.Context) (*organizationInvitationResolver, error)</a>

```
searchKey: graphqlbackend.OrgResolver.ViewerPendingInvitation
tags: [method]
```

```Go
func (o *OrgResolver) ViewerPendingInvitation(ctx context.Context) (*organizationInvitationResolver, error)
```

#### <a id="OrgResolver.settingsSubject" href="#OrgResolver.settingsSubject">func (o *OrgResolver) settingsSubject() api.SettingsSubject</a>

```
searchKey: graphqlbackend.OrgResolver.settingsSubject
tags: [method private]
```

```Go
func (o *OrgResolver) settingsSubject() api.SettingsSubject
```

### <a id="PermissionsInfoResolver" href="#PermissionsInfoResolver">type PermissionsInfoResolver interface</a>

```
searchKey: graphqlbackend.PermissionsInfoResolver
tags: [interface]
```

```Go
type PermissionsInfoResolver interface {
	Permissions() []string
	SyncedAt() *DateTime
	UpdatedAt() DateTime
}
```

### <a id="PersonResolver" href="#PersonResolver">type PersonResolver struct</a>

```
searchKey: graphqlbackend.PersonResolver
tags: [struct]
```

```Go
type PersonResolver struct {
	db    dbutil.DB
	name  string
	email string

	// fetch + serve sourcegraph stored user information
	includeUserInfo bool

	// cache result because it is used by multiple fields
	once sync.Once
	user *types.User
	err  error
}
```

#### <a id="NewPersonResolver" href="#NewPersonResolver">func NewPersonResolver(db dbutil.DB, name, email string, includeUserInfo bool) *PersonResolver</a>

```
searchKey: graphqlbackend.NewPersonResolver
tags: [function]
```

```Go
func NewPersonResolver(db dbutil.DB, name, email string, includeUserInfo bool) *PersonResolver
```

#### <a id="PersonResolver.AvatarURL" href="#PersonResolver.AvatarURL">func (r *PersonResolver) AvatarURL(ctx context.Context) (*string, error)</a>

```
searchKey: graphqlbackend.PersonResolver.AvatarURL
tags: [method]
```

```Go
func (r *PersonResolver) AvatarURL(ctx context.Context) (*string, error)
```

#### <a id="PersonResolver.DisplayName" href="#PersonResolver.DisplayName">func (r *PersonResolver) DisplayName(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.PersonResolver.DisplayName
tags: [method]
```

```Go
func (r *PersonResolver) DisplayName(ctx context.Context) (string, error)
```

#### <a id="PersonResolver.Email" href="#PersonResolver.Email">func (r *PersonResolver) Email() string</a>

```
searchKey: graphqlbackend.PersonResolver.Email
tags: [method]
```

```Go
func (r *PersonResolver) Email() string
```

#### <a id="PersonResolver.Name" href="#PersonResolver.Name">func (r *PersonResolver) Name(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.PersonResolver.Name
tags: [method]
```

```Go
func (r *PersonResolver) Name(ctx context.Context) (string, error)
```

#### <a id="PersonResolver.User" href="#PersonResolver.User">func (r *PersonResolver) User(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.PersonResolver.User
tags: [method]
```

```Go
func (r *PersonResolver) User(ctx context.Context) (*UserResolver, error)
```

#### <a id="PersonResolver.resolveUser" href="#PersonResolver.resolveUser">func (r *PersonResolver) resolveUser(ctx context.Context) (*types.User, error)</a>

```
searchKey: graphqlbackend.PersonResolver.resolveUser
tags: [method private]
```

```Go
func (r *PersonResolver) resolveUser(ctx context.Context) (*types.User, error)
```

resolveUser resolves the person to a user (using the email address). Not all persons can be resolved to a user. 

### <a id="PlanTier" href="#PlanTier">type PlanTier interface</a>

```
searchKey: graphqlbackend.PlanTier
tags: [interface]
```

```Go
type PlanTier interface {
	UnitAmount() int32
	UpTo() int32
	FlatAmount() int32
}
```

PlanTier is the interface for the GraphQL type PlanTier. 

### <a id="PositionResolver" href="#PositionResolver">type PositionResolver interface</a>

```
searchKey: graphqlbackend.PositionResolver
tags: [interface]
```

```Go
type PositionResolver interface {
	Line() int32
	Character() int32
}
```

### <a id="PreIndexStepResolver" href="#PreIndexStepResolver">type PreIndexStepResolver interface</a>

```
searchKey: graphqlbackend.PreIndexStepResolver
tags: [interface]
```

```Go
type PreIndexStepResolver interface {
	Root() string
	Image() string
	Commands() []string
	LogEntry() ExecutionLogEntryResolver
}
```

### <a id="PreviewProductSubscriptionInvoiceArgs" href="#PreviewProductSubscriptionInvoiceArgs">type PreviewProductSubscriptionInvoiceArgs struct</a>

```
searchKey: graphqlbackend.PreviewProductSubscriptionInvoiceArgs
tags: [struct]
```

```Go
type PreviewProductSubscriptionInvoiceArgs struct {
	Account              *graphql.ID
	SubscriptionToUpdate *graphql.ID
	ProductSubscription  ProductSubscriptionInput
}
```

### <a id="PreviewRepositoryComparisonResolver" href="#PreviewRepositoryComparisonResolver">type PreviewRepositoryComparisonResolver interface</a>

```
searchKey: graphqlbackend.PreviewRepositoryComparisonResolver
tags: [interface]
```

```Go
type PreviewRepositoryComparisonResolver interface {
	RepositoryComparisonInterface
}
```

### <a id="ProductLicense" href="#ProductLicense">type ProductLicense interface</a>

```
searchKey: graphqlbackend.ProductLicense
tags: [interface]
```

```Go
type ProductLicense interface {
	ID() graphql.ID
	Subscription(context.Context) (ProductSubscription, error)
	Info() (*ProductLicenseInfo, error)
	LicenseKey() string
	CreatedAt() DateTime
}
```

ProductLicense is the interface for the GraphQL type ProductLicense. 

### <a id="ProductLicenseConnection" href="#ProductLicenseConnection">type ProductLicenseConnection interface</a>

```
searchKey: graphqlbackend.ProductLicenseConnection
tags: [interface]
```

```Go
type ProductLicenseConnection interface {
	Nodes(context.Context) ([]ProductLicense, error)
	TotalCount(context.Context) (int32, error)
	PageInfo(context.Context) (*graphqlutil.PageInfo, error)
}
```

ProductLicenseConnection is the interface for the GraphQL type ProductLicenseConnection. 

### <a id="ProductLicenseInfo" href="#ProductLicenseInfo">type ProductLicenseInfo struct</a>

```
searchKey: graphqlbackend.ProductLicenseInfo
tags: [struct]
```

```Go
type ProductLicenseInfo struct {
	TagsValue      []string
	UserCountValue uint
	ExpiresAtValue time.Time
}
```

ProductLicenseInfo implements the GraphQL type ProductLicenseInfo. 

#### <a id="ProductLicenseInfo.ExpiresAt" href="#ProductLicenseInfo.ExpiresAt">func (r ProductLicenseInfo) ExpiresAt() DateTime</a>

```
searchKey: graphqlbackend.ProductLicenseInfo.ExpiresAt
tags: [method]
```

```Go
func (r ProductLicenseInfo) ExpiresAt() DateTime
```

#### <a id="ProductLicenseInfo.ProductNameWithBrand" href="#ProductLicenseInfo.ProductNameWithBrand">func (r ProductLicenseInfo) ProductNameWithBrand() string</a>

```
searchKey: graphqlbackend.ProductLicenseInfo.ProductNameWithBrand
tags: [method]
```

```Go
func (r ProductLicenseInfo) ProductNameWithBrand() string
```

#### <a id="ProductLicenseInfo.Tags" href="#ProductLicenseInfo.Tags">func (r ProductLicenseInfo) Tags() []string</a>

```
searchKey: graphqlbackend.ProductLicenseInfo.Tags
tags: [method]
```

```Go
func (r ProductLicenseInfo) Tags() []string
```

#### <a id="ProductLicenseInfo.UserCount" href="#ProductLicenseInfo.UserCount">func (r ProductLicenseInfo) UserCount() int32</a>

```
searchKey: graphqlbackend.ProductLicenseInfo.UserCount
tags: [method]
```

```Go
func (r ProductLicenseInfo) UserCount() int32
```

### <a id="ProductLicenseInput" href="#ProductLicenseInput">type ProductLicenseInput struct</a>

```
searchKey: graphqlbackend.ProductLicenseInput
tags: [struct]
```

```Go
type ProductLicenseInput struct {
	Tags      []string
	UserCount int32
	ExpiresAt int32
}
```

ProductLicenseInput implements the GraphQL type ProductLicenseInput. 

### <a id="ProductLicensesArgs" href="#ProductLicensesArgs">type ProductLicensesArgs struct</a>

```
searchKey: graphqlbackend.ProductLicensesArgs
tags: [struct]
```

```Go
type ProductLicensesArgs struct {
	graphqlutil.ConnectionArgs
	LicenseKeySubstring   *string
	ProductSubscriptionID *graphql.ID
}
```

### <a id="ProductPlan" href="#ProductPlan">type ProductPlan interface</a>

```
searchKey: graphqlbackend.ProductPlan
tags: [interface]
```

```Go
type ProductPlan interface {
	ProductPlanID() string
	BillingPlanID() string
	Name() string
	NameWithBrand() string
	PricePerUserPerYear() int32
	MinQuantity() *int32
	MaxQuantity() *int32
	TiersMode() string
	PlanTiers() []PlanTier
}
```

ProductPlan is the interface for the GraphQL type ProductPlan. 

### <a id="ProductSubscription" href="#ProductSubscription">type ProductSubscription interface</a>

```
searchKey: graphqlbackend.ProductSubscription
tags: [interface]
```

```Go
type ProductSubscription interface {
	ID() graphql.ID
	UUID() string
	Name() string
	Account(context.Context) (*UserResolver, error)
	InvoiceItem(context.Context) (ProductSubscriptionInvoiceItem, error)
	Events(context.Context) ([]ProductSubscriptionEvent, error)
	ActiveLicense(context.Context) (ProductLicense, error)
	ProductLicenses(context.Context, *graphqlutil.ConnectionArgs) (ProductLicenseConnection, error)
	CreatedAt() DateTime
	IsArchived() bool
	URL(context.Context) (string, error)
	URLForSiteAdmin(context.Context) *string
	URLForSiteAdminBilling(context.Context) (*string, error)
}
```

ProductSubscription is the interface for the GraphQL type ProductSubscription. 

### <a id="ProductSubscriptionArgs" href="#ProductSubscriptionArgs">type ProductSubscriptionArgs struct</a>

```
searchKey: graphqlbackend.ProductSubscriptionArgs
tags: [struct]
```

```Go
type ProductSubscriptionArgs struct {
	UUID string
}
```

### <a id="ProductSubscriptionConnection" href="#ProductSubscriptionConnection">type ProductSubscriptionConnection interface</a>

```
searchKey: graphqlbackend.ProductSubscriptionConnection
tags: [interface]
```

```Go
type ProductSubscriptionConnection interface {
	Nodes(context.Context) ([]ProductSubscription, error)
	TotalCount(context.Context) (int32, error)
	PageInfo(context.Context) (*graphqlutil.PageInfo, error)
}
```

ProductSubscriptionConnection is the interface for the GraphQL type ProductSubscriptionConnection. 

### <a id="ProductSubscriptionEvent" href="#ProductSubscriptionEvent">type ProductSubscriptionEvent interface</a>

```
searchKey: graphqlbackend.ProductSubscriptionEvent
tags: [interface]
```

```Go
type ProductSubscriptionEvent interface {
	ID() string
	Date() string
	Title() string
	Description() *string
	URL() *string
}
```

ProductSubscriptionEvent is the interface for the GraphQL type ProductSubscriptionEvent. 

### <a id="ProductSubscriptionInput" href="#ProductSubscriptionInput">type ProductSubscriptionInput struct</a>

```
searchKey: graphqlbackend.ProductSubscriptionInput
tags: [struct]
```

```Go
type ProductSubscriptionInput struct {
	BillingPlanID string
	UserCount     int32
}
```

ProductSubscriptionInput implements the GraphQL type ProductSubscriptionInput. 

### <a id="ProductSubscriptionInvoiceItem" href="#ProductSubscriptionInvoiceItem">type ProductSubscriptionInvoiceItem interface</a>

```
searchKey: graphqlbackend.ProductSubscriptionInvoiceItem
tags: [interface]
```

```Go
type ProductSubscriptionInvoiceItem interface {
	Plan() (ProductPlan, error)
	UserCount() int32
	ExpiresAt() DateTime
}
```

ProductSubscriptionInvoiceItem is the interface for the GraphQL type ProductSubscriptionInvoiceItem. 

### <a id="ProductSubscriptionPreviewInvoice" href="#ProductSubscriptionPreviewInvoice">type ProductSubscriptionPreviewInvoice interface</a>

```
searchKey: graphqlbackend.ProductSubscriptionPreviewInvoice
tags: [interface]
```

```Go
type ProductSubscriptionPreviewInvoice interface {
	Price() int32
	ProrationDate() *string
	IsDowngradeRequiringManualIntervention() bool
	BeforeInvoiceItem() ProductSubscriptionInvoiceItem
	AfterInvoiceItem() ProductSubscriptionInvoiceItem
}
```

ProductSubscriptionPreviewInvoice is the interface for the GraphQL type ProductSubscriptionPreviewInvoice. 

### <a id="ProductSubscriptionsArgs" href="#ProductSubscriptionsArgs">type ProductSubscriptionsArgs struct</a>

```
searchKey: graphqlbackend.ProductSubscriptionsArgs
tags: [struct]
```

```Go
type ProductSubscriptionsArgs struct {
	graphqlutil.ConnectionArgs
	Account *graphql.ID
	Query   *string
}
```

### <a id="QueryCost" href="#QueryCost">type QueryCost struct</a>

```
searchKey: graphqlbackend.QueryCost
tags: [struct]
```

```Go
type QueryCost struct {
	FieldCount int
	MaxDepth   int
	Version    int
}
```

#### <a id="EstimateQueryCost" href="#EstimateQueryCost">func EstimateQueryCost(query string, variables map[string]interface{}) (totalCost *QueryCost, err error)</a>

```
searchKey: graphqlbackend.EstimateQueryCost
tags: [function]
```

```Go
func EstimateQueryCost(query string, variables map[string]interface{}) (totalCost *QueryCost, err error)
```

EstimateQueryCost estimates the cost of the query before it is actually executed. It is a worst cast estimate of the number of fields expected to be returned by the query and handles nested queries a well as fragments. 

#### <a id="calcNodeCost" href="#calcNodeCost">func calcNodeCost(def ast.Node, fragmentCosts map[string]int, variables map[string]interface{}) (*QueryCost, error)</a>

```
searchKey: graphqlbackend.calcNodeCost
tags: [function private]
```

```Go
func calcNodeCost(def ast.Node, fragmentCosts map[string]int, variables map[string]interface{}) (*QueryCost, error)
```

### <a id="QueueAutoIndexJobArgs" href="#QueueAutoIndexJobArgs">type QueueAutoIndexJobArgs struct</a>

```
searchKey: graphqlbackend.QueueAutoIndexJobArgs
tags: [struct]
```

```Go
type QueueAutoIndexJobArgs struct {
	Repository graphql.ID
}
```

### <a id="RangeResolver" href="#RangeResolver">type RangeResolver interface</a>

```
searchKey: graphqlbackend.RangeResolver
tags: [interface]
```

```Go
type RangeResolver interface {
	Start() PositionResolver
	End() PositionResolver
}
```

#### <a id="NewRangeResolver" href="#NewRangeResolver">func NewRangeResolver(lspRange lsp.Range) RangeResolver</a>

```
searchKey: graphqlbackend.NewRangeResolver
tags: [function]
```

```Go
func NewRangeResolver(lspRange lsp.Range) RangeResolver
```

### <a id="RateLimitWatcher" href="#RateLimitWatcher">type RateLimitWatcher struct</a>

```
searchKey: graphqlbackend.RateLimitWatcher
tags: [struct]
```

```Go
type RateLimitWatcher struct {
	store throttled.GCRAStore
	rl    atomic.Value // *RateLimiter
}
```

RateLimitWatcher stores the currently configured rate limiter and whether or not rate limiting is enabled. 

#### <a id="NewRateLimiteWatcher" href="#NewRateLimiteWatcher">func NewRateLimiteWatcher(store throttled.GCRAStore) *RateLimitWatcher</a>

```
searchKey: graphqlbackend.NewRateLimiteWatcher
tags: [function]
```

```Go
func NewRateLimiteWatcher(store throttled.GCRAStore) *RateLimitWatcher
```

NewRateLimiteWatcher creates a new limiter with the provided store and starts watching for config changes. 

#### <a id="RateLimitWatcher.Get" href="#RateLimitWatcher.Get">func (w *RateLimitWatcher) Get() (Limiter, bool)</a>

```
searchKey: graphqlbackend.RateLimitWatcher.Get
tags: [method]
```

```Go
func (w *RateLimitWatcher) Get() (Limiter, bool)
```

Get returns the current rate limiter. If rate limiting is currently disabled (nil, false) is returned. 

#### <a id="RateLimitWatcher.updateFromConfig" href="#RateLimitWatcher.updateFromConfig">func (w *RateLimitWatcher) updateFromConfig(rlc *schema.ApiRatelimit)</a>

```
searchKey: graphqlbackend.RateLimitWatcher.updateFromConfig
tags: [method private]
```

```Go
func (w *RateLimitWatcher) updateFromConfig(rlc *schema.ApiRatelimit)
```

### <a id="RateLimiter" href="#RateLimiter">type RateLimiter struct</a>

```
searchKey: graphqlbackend.RateLimiter
tags: [struct]
```

```Go
type RateLimiter struct {
	enabled     bool
	ipLimiter   *throttled.GCRARateLimiter
	userLimiter *throttled.GCRARateLimiter
	overrides   map[string]limiter
}
```

#### <a id="RateLimiter.RateLimit" href="#RateLimiter.RateLimit">func (rl *RateLimiter) RateLimit(uid string, cost int, args LimiterArgs) (bool, throttled.RateLimitResult, error)</a>

```
searchKey: graphqlbackend.RateLimiter.RateLimit
tags: [method]
```

```Go
func (rl *RateLimiter) RateLimit(uid string, cost int, args LimiterArgs) (bool, throttled.RateLimitResult, error)
```

### <a id="RedirectResolver" href="#RedirectResolver">type RedirectResolver struct</a>

```
searchKey: graphqlbackend.RedirectResolver
tags: [struct]
```

```Go
type RedirectResolver struct {
	url string
}
```

#### <a id="RedirectResolver.URL" href="#RedirectResolver.URL">func (r *RedirectResolver) URL() string</a>

```
searchKey: graphqlbackend.RedirectResolver.URL
tags: [method]
```

```Go
func (r *RedirectResolver) URL() string
```

### <a id="ReenqueueChangesetArgs" href="#ReenqueueChangesetArgs">type ReenqueueChangesetArgs struct</a>

```
searchKey: graphqlbackend.ReenqueueChangesetArgs
tags: [struct]
```

```Go
type ReenqueueChangesetArgs struct {
	Changeset graphql.ID
}
```

### <a id="ReenqueueChangesetsArgs" href="#ReenqueueChangesetsArgs">type ReenqueueChangesetsArgs struct</a>

```
searchKey: graphqlbackend.ReenqueueChangesetsArgs
tags: [struct]
```

```Go
type ReenqueueChangesetsArgs struct {
	BulkOperationBaseArgs
}
```

### <a id="RegistryExtension" href="#RegistryExtension">type RegistryExtension interface</a>

```
searchKey: graphqlbackend.RegistryExtension
tags: [interface]
```

```Go
type RegistryExtension interface {
	ID() graphql.ID
	UUID() string
	ExtensionID() string
	ExtensionIDWithoutRegistry() string
	Publisher(ctx context.Context) (RegistryPublisher, error)
	Name() string
	Manifest(ctx context.Context) (ExtensionManifest, error)
	CreatedAt() *DateTime
	UpdatedAt() *DateTime
	PublishedAt(context.Context) (*DateTime, error)
	URL() string
	RemoteURL() *string
	RegistryName() (string, error)
	IsLocal() bool
	IsWorkInProgress() bool
	ViewerCanAdminister(ctx context.Context) (bool, error)
}
```

RegistryExtension is the interface for the GraphQL type RegistryExtension. 

### <a id="RegistryExtensionConnection" href="#RegistryExtensionConnection">type RegistryExtensionConnection interface</a>

```
searchKey: graphqlbackend.RegistryExtensionConnection
tags: [interface]
```

```Go
type RegistryExtensionConnection interface {
	Nodes(context.Context) ([]RegistryExtension, error)
	TotalCount(context.Context) (int32, error)
	PageInfo(context.Context) (*graphqlutil.PageInfo, error)
	URL(context.Context) (*string, error)
	Error(context.Context) *string
}
```

RegistryExtensionConnection is the interface for the GraphQL type RegistryExtensionConnection. 

### <a id="RegistryExtensionConnectionArgs" href="#RegistryExtensionConnectionArgs">type RegistryExtensionConnectionArgs struct</a>

```
searchKey: graphqlbackend.RegistryExtensionConnectionArgs
tags: [struct]
```

```Go
type RegistryExtensionConnectionArgs struct {
	graphqlutil.ConnectionArgs
	Query                  *string
	Publisher              *graphql.ID
	Local                  bool
	Remote                 bool
	PrioritizeExtensionIDs *[]string
}
```

### <a id="RegistryPublisher" href="#RegistryPublisher">type RegistryPublisher interface</a>

```
searchKey: graphqlbackend.RegistryPublisher
tags: [interface]
```

```Go
type RegistryPublisher interface {
	ToUser() (*UserResolver, bool)
	ToOrg() (*OrgResolver, bool)

	// Helpers that are not GraphQL fields.
	RegistryExtensionConnectionURL() (*string, error)
}
```

RegistryPublisher is the interface for the GraphQL type RegistryPublisher. 

### <a id="RegistryPublisherConnection" href="#RegistryPublisherConnection">type RegistryPublisherConnection interface</a>

```
searchKey: graphqlbackend.RegistryPublisherConnection
tags: [interface]
```

```Go
type RegistryPublisherConnection interface {
	Nodes(context.Context) ([]RegistryPublisher, error)
	TotalCount(context.Context) (int32, error)
	PageInfo(context.Context) (*graphqlutil.PageInfo, error)
}
```

RegistryPublisherConnection is the interface for the GraphQL type RegistryPublisherConnection. 

### <a id="RepoAuthorizedUserArgs" href="#RepoAuthorizedUserArgs">type RepoAuthorizedUserArgs struct</a>

```
searchKey: graphqlbackend.RepoAuthorizedUserArgs
tags: [struct]
```

```Go
type RepoAuthorizedUserArgs struct {
	RepositoryID graphql.ID
	*AuthorizedUserArgs
}
```

### <a id="RepoPermsArgs" href="#RepoPermsArgs">type RepoPermsArgs struct</a>

```
searchKey: graphqlbackend.RepoPermsArgs
tags: [struct]
```

```Go
type RepoPermsArgs struct {
	Repository      graphql.ID
	UserPermissions []struct {
		BindID     string
		Permission string
	}
}
```

### <a id="RepositoryCommitArgs" href="#RepositoryCommitArgs">type RepositoryCommitArgs struct</a>

```
searchKey: graphqlbackend.RepositoryCommitArgs
tags: [struct]
```

```Go
type RepositoryCommitArgs struct {
	Rev          string
	InputRevspec *string
}
```

### <a id="RepositoryComparisonInput" href="#RepositoryComparisonInput">type RepositoryComparisonInput struct</a>

```
searchKey: graphqlbackend.RepositoryComparisonInput
tags: [struct]
```

```Go
type RepositoryComparisonInput struct {
	Base         *string
	Head         *string
	FetchMissing bool
}
```

### <a id="RepositoryComparisonInterface" href="#RepositoryComparisonInterface">type RepositoryComparisonInterface interface</a>

```
searchKey: graphqlbackend.RepositoryComparisonInterface
tags: [interface]
```

```Go
type RepositoryComparisonInterface interface {
	BaseRepository() *RepositoryResolver
	FileDiffs(ctx context.Context, args *FileDiffsConnectionArgs) (FileDiffConnection, error)

	ToRepositoryComparison() (*RepositoryComparisonResolver, bool)
	ToPreviewRepositoryComparison() (PreviewRepositoryComparisonResolver, bool)
}
```

### <a id="RepositoryComparisonResolver" href="#RepositoryComparisonResolver">type RepositoryComparisonResolver struct</a>

```
searchKey: graphqlbackend.RepositoryComparisonResolver
tags: [struct]
```

```Go
type RepositoryComparisonResolver struct {
	db                       dbutil.DB
	baseRevspec, headRevspec string
	base, head               *GitCommitResolver
	repo                     *RepositoryResolver
}
```

#### <a id="NewRepositoryComparison" href="#NewRepositoryComparison">func NewRepositoryComparison(ctx context.Context, db dbutil.DB, r *RepositoryResolver, args *RepositoryComparisonInput) (*RepositoryComparisonResolver, error)</a>

```
searchKey: graphqlbackend.NewRepositoryComparison
tags: [function]
```

```Go
func NewRepositoryComparison(ctx context.Context, db dbutil.DB, r *RepositoryResolver, args *RepositoryComparisonInput) (*RepositoryComparisonResolver, error)
```

#### <a id="RepositoryComparisonResolver.BaseRepository" href="#RepositoryComparisonResolver.BaseRepository">func (r *RepositoryComparisonResolver) BaseRepository() *RepositoryResolver</a>

```
searchKey: graphqlbackend.RepositoryComparisonResolver.BaseRepository
tags: [method]
```

```Go
func (r *RepositoryComparisonResolver) BaseRepository() *RepositoryResolver
```

#### <a id="RepositoryComparisonResolver.Commits" href="#RepositoryComparisonResolver.Commits">func (r *RepositoryComparisonResolver) Commits(args *graphqlutil.ConnectionArgs) *gitCommitConnectionResolver</a>

```
searchKey: graphqlbackend.RepositoryComparisonResolver.Commits
tags: [method]
```

```Go
func (r *RepositoryComparisonResolver) Commits(
	args *graphqlutil.ConnectionArgs,
) *gitCommitConnectionResolver
```

#### <a id="RepositoryComparisonResolver.FileDiffs" href="#RepositoryComparisonResolver.FileDiffs">func (r *RepositoryComparisonResolver) FileDiffs(ctx context.Context, args *FileDiffsConnectionArgs) (FileDiffConnection, error)</a>

```
searchKey: graphqlbackend.RepositoryComparisonResolver.FileDiffs
tags: [method]
```

```Go
func (r *RepositoryComparisonResolver) FileDiffs(ctx context.Context, args *FileDiffsConnectionArgs) (FileDiffConnection, error)
```

#### <a id="RepositoryComparisonResolver.HeadRepository" href="#RepositoryComparisonResolver.HeadRepository">func (r *RepositoryComparisonResolver) HeadRepository() *RepositoryResolver</a>

```
searchKey: graphqlbackend.RepositoryComparisonResolver.HeadRepository
tags: [method]
```

```Go
func (r *RepositoryComparisonResolver) HeadRepository() *RepositoryResolver
```

#### <a id="RepositoryComparisonResolver.Range" href="#RepositoryComparisonResolver.Range">func (r *RepositoryComparisonResolver) Range() *gitRevisionRange</a>

```
searchKey: graphqlbackend.RepositoryComparisonResolver.Range
tags: [method]
```

```Go
func (r *RepositoryComparisonResolver) Range() *gitRevisionRange
```

#### <a id="RepositoryComparisonResolver.ToPreviewRepositoryComparison" href="#RepositoryComparisonResolver.ToPreviewRepositoryComparison">func (r *RepositoryComparisonResolver) ToPreviewRepositoryComparison() (PreviewRepositoryComparisonResolver, bool)</a>

```
searchKey: graphqlbackend.RepositoryComparisonResolver.ToPreviewRepositoryComparison
tags: [method]
```

```Go
func (r *RepositoryComparisonResolver) ToPreviewRepositoryComparison() (PreviewRepositoryComparisonResolver, bool)
```

#### <a id="RepositoryComparisonResolver.ToRepositoryComparison" href="#RepositoryComparisonResolver.ToRepositoryComparison">func (r *RepositoryComparisonResolver) ToRepositoryComparison() (*RepositoryComparisonResolver, bool)</a>

```
searchKey: graphqlbackend.RepositoryComparisonResolver.ToRepositoryComparison
tags: [method]
```

```Go
func (r *RepositoryComparisonResolver) ToRepositoryComparison() (*RepositoryComparisonResolver, bool)
```

### <a id="RepositoryConnectionResolver" href="#RepositoryConnectionResolver">type RepositoryConnectionResolver interface</a>

```
searchKey: graphqlbackend.RepositoryConnectionResolver
tags: [interface]
```

```Go
type RepositoryConnectionResolver interface {
	Nodes(ctx context.Context) ([]*RepositoryResolver, error)
	TotalCount(ctx context.Context, args *TotalCountArgs) (*int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="RepositoryIDArgs" href="#RepositoryIDArgs">type RepositoryIDArgs struct</a>

```
searchKey: graphqlbackend.RepositoryIDArgs
tags: [struct]
```

```Go
type RepositoryIDArgs struct {
	Repository graphql.ID
}
```

### <a id="RepositoryResolver" href="#RepositoryResolver">type RepositoryResolver struct</a>

```
searchKey: graphqlbackend.RepositoryResolver
tags: [struct]
```

```Go
type RepositoryResolver struct {
	hydration sync.Once
	err       error

	// Invariant: Name and ID of RepoMatch are always set and safe to use. They are
	// used to hydrate the inner repo, and should always be the same as the name and
	// id of the inner repo, but referring to the inner repo directly is unsafe
	// because it may cause a race during hydration.
	result.RepoMatch

	db dbutil.DB

	// innerRepo may only contain ID and Name information.
	// To access any other repo information, use repo() instead.
	innerRepo *types.Repo

	defaultBranchOnce sync.Once
	defaultBranch     *GitRefResolver
	defaultBranchErr  error
}
```

#### <a id="NewRepositoryResolver" href="#NewRepositoryResolver">func NewRepositoryResolver(db dbutil.DB, repo *types.Repo) *RepositoryResolver</a>

```
searchKey: graphqlbackend.NewRepositoryResolver
tags: [function]
```

```Go
func NewRepositoryResolver(db dbutil.DB, repo *types.Repo) *RepositoryResolver
```

#### <a id="RepositoryResolver.AuthorizedUsers" href="#RepositoryResolver.AuthorizedUsers">func (r *RepositoryResolver) AuthorizedUsers(ctx context.Context, args *AuthorizedUserArgs) (UserConnectionResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.AuthorizedUsers
tags: [method]
```

```Go
func (r *RepositoryResolver) AuthorizedUsers(ctx context.Context, args *AuthorizedUserArgs) (UserConnectionResolver, error)
```

#### <a id="RepositoryResolver.Branches" href="#RepositoryResolver.Branches">func (r *RepositoryResolver) Branches(ctx context.Context, args *refsArgs) (*gitRefConnectionResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.Branches
tags: [method]
```

```Go
func (r *RepositoryResolver) Branches(ctx context.Context, args *refsArgs) (*gitRefConnectionResolver, error)
```

#### <a id="RepositoryResolver.CloneInProgress" href="#RepositoryResolver.CloneInProgress">func (r *RepositoryResolver) CloneInProgress(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.CloneInProgress
tags: [method]
```

```Go
func (r *RepositoryResolver) CloneInProgress(ctx context.Context) (bool, error)
```

#### <a id="RepositoryResolver.CodeIntelligenceCommitGraph" href="#RepositoryResolver.CodeIntelligenceCommitGraph">func (r *RepositoryResolver) CodeIntelligenceCommitGraph(ctx context.Context) (CodeIntelligenceCommitGraphResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.CodeIntelligenceCommitGraph
tags: [method]
```

```Go
func (r *RepositoryResolver) CodeIntelligenceCommitGraph(ctx context.Context) (CodeIntelligenceCommitGraphResolver, error)
```

#### <a id="RepositoryResolver.Commit" href="#RepositoryResolver.Commit">func (r *RepositoryResolver) Commit(ctx context.Context, args *RepositoryCommitArgs) (*GitCommitResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.Commit
tags: [method]
```

```Go
func (r *RepositoryResolver) Commit(ctx context.Context, args *RepositoryCommitArgs) (*GitCommitResolver, error)
```

#### <a id="RepositoryResolver.CommitFromID" href="#RepositoryResolver.CommitFromID">func (r *RepositoryResolver) CommitFromID(ctx context.Context, args *RepositoryCommitArgs, commitID api.CommitID) (*GitCommitResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.CommitFromID
tags: [method]
```

```Go
func (r *RepositoryResolver) CommitFromID(ctx context.Context, args *RepositoryCommitArgs, commitID api.CommitID) (*GitCommitResolver, error)
```

#### <a id="RepositoryResolver.Comparison" href="#RepositoryResolver.Comparison">func (r *RepositoryResolver) Comparison(ctx context.Context, args *RepositoryComparisonInput) (*RepositoryComparisonResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.Comparison
tags: [method]
```

```Go
func (r *RepositoryResolver) Comparison(ctx context.Context, args *RepositoryComparisonInput) (*RepositoryComparisonResolver, error)
```

#### <a id="RepositoryResolver.Contributors" href="#RepositoryResolver.Contributors">func (r *RepositoryResolver) Contributors(args *struct {...</a>

```
searchKey: graphqlbackend.RepositoryResolver.Contributors
tags: [method]
```

```Go
func (r *RepositoryResolver) Contributors(args *struct {
	repositoryContributorsArgs
	First *int32
}) *repositoryContributorConnectionResolver
```

#### <a id="RepositoryResolver.CreatedAt" href="#RepositoryResolver.CreatedAt">func (r *RepositoryResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.RepositoryResolver.CreatedAt
tags: [method]
```

```Go
func (r *RepositoryResolver) CreatedAt() DateTime
```

No clients that we know of read this field. Additionally on performance profiles the marshalling of timestamps is significant in our postgres client. So we deprecate the fields and return fake data for created_at. [https://github.com/sourcegraph/sourcegraph/pull/4668](https://github.com/sourcegraph/sourcegraph/pull/4668) 

#### <a id="RepositoryResolver.DefaultBranch" href="#RepositoryResolver.DefaultBranch">func (r *RepositoryResolver) DefaultBranch(ctx context.Context) (*GitRefResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.DefaultBranch
tags: [method]
```

```Go
func (r *RepositoryResolver) DefaultBranch(ctx context.Context) (*GitRefResolver, error)
```

#### <a id="RepositoryResolver.Description" href="#RepositoryResolver.Description">func (r *RepositoryResolver) Description(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.Description
tags: [method]
```

```Go
func (r *RepositoryResolver) Description(ctx context.Context) (string, error)
```

#### <a id="RepositoryResolver.Detail" href="#RepositoryResolver.Detail">func (r *RepositoryResolver) Detail() Markdown</a>

```
searchKey: graphqlbackend.RepositoryResolver.Detail
tags: [method]
```

```Go
func (r *RepositoryResolver) Detail() Markdown
```

#### <a id="RepositoryResolver.Enabled" href="#RepositoryResolver.Enabled">func (r *RepositoryResolver) Enabled() bool</a>

```
searchKey: graphqlbackend.RepositoryResolver.Enabled
tags: [method]
```

```Go
func (r *RepositoryResolver) Enabled() bool
```

#### <a id="RepositoryResolver.ExternalRepo" href="#RepositoryResolver.ExternalRepo">func (r *RepositoryResolver) ExternalRepo(ctx context.Context) (*api.ExternalRepoSpec, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.ExternalRepo
tags: [method]
```

```Go
func (r *RepositoryResolver) ExternalRepo(ctx context.Context) (*api.ExternalRepoSpec, error)
```

#### <a id="RepositoryResolver.ExternalRepository" href="#RepositoryResolver.ExternalRepository">func (r *RepositoryResolver) ExternalRepository() *externalRepositoryResolver</a>

```
searchKey: graphqlbackend.RepositoryResolver.ExternalRepository
tags: [method]
```

```Go
func (r *RepositoryResolver) ExternalRepository() *externalRepositoryResolver
```

#### <a id="RepositoryResolver.ExternalServices" href="#RepositoryResolver.ExternalServices">func (r *RepositoryResolver) ExternalServices(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.RepositoryResolver.ExternalServices
tags: [method]
```

```Go
func (r *RepositoryResolver) ExternalServices(ctx context.Context, args *struct {
	graphqlutil.ConnectionArgs
}) (*computedExternalServiceConnectionResolver, error)
```

#### <a id="RepositoryResolver.ExternalURLs" href="#RepositoryResolver.ExternalURLs">func (r *RepositoryResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.ExternalURLs
tags: [method]
```

```Go
func (r *RepositoryResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)
```

#### <a id="RepositoryResolver.GitRefs" href="#RepositoryResolver.GitRefs">func (r *RepositoryResolver) GitRefs(ctx context.Context, args *refsArgs) (*gitRefConnectionResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.GitRefs
tags: [method]
```

```Go
func (r *RepositoryResolver) GitRefs(ctx context.Context, args *refsArgs) (*gitRefConnectionResolver, error)
```

#### <a id="RepositoryResolver.ID" href="#RepositoryResolver.ID">func (r *RepositoryResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.RepositoryResolver.ID
tags: [method]
```

```Go
func (r *RepositoryResolver) ID() graphql.ID
```

#### <a id="RepositoryResolver.IDInt32" href="#RepositoryResolver.IDInt32">func (r *RepositoryResolver) IDInt32() api.RepoID</a>

```
searchKey: graphqlbackend.RepositoryResolver.IDInt32
tags: [method]
```

```Go
func (r *RepositoryResolver) IDInt32() api.RepoID
```

#### <a id="RepositoryResolver.IndexConfiguration" href="#RepositoryResolver.IndexConfiguration">func (r *RepositoryResolver) IndexConfiguration(ctx context.Context) (IndexConfigurationResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.IndexConfiguration
tags: [method]
```

```Go
func (r *RepositoryResolver) IndexConfiguration(ctx context.Context) (IndexConfigurationResolver, error)
```

#### <a id="RepositoryResolver.IsArchived" href="#RepositoryResolver.IsArchived">func (r *RepositoryResolver) IsArchived(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.IsArchived
tags: [method]
```

```Go
func (r *RepositoryResolver) IsArchived(ctx context.Context) (bool, error)
```

#### <a id="RepositoryResolver.IsFork" href="#RepositoryResolver.IsFork">func (r *RepositoryResolver) IsFork(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.IsFork
tags: [method]
```

```Go
func (r *RepositoryResolver) IsFork(ctx context.Context) (bool, error)
```

#### <a id="RepositoryResolver.IsPrivate" href="#RepositoryResolver.IsPrivate">func (r *RepositoryResolver) IsPrivate(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.IsPrivate
tags: [method]
```

```Go
func (r *RepositoryResolver) IsPrivate(ctx context.Context) (bool, error)
```

#### <a id="RepositoryResolver.LSIFIndexes" href="#RepositoryResolver.LSIFIndexes">func (r *RepositoryResolver) LSIFIndexes(ctx context.Context, args *LSIFIndexesQueryArgs) (LSIFIndexConnectionResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.LSIFIndexes
tags: [method]
```

```Go
func (r *RepositoryResolver) LSIFIndexes(ctx context.Context, args *LSIFIndexesQueryArgs) (LSIFIndexConnectionResolver, error)
```

#### <a id="RepositoryResolver.LSIFUploads" href="#RepositoryResolver.LSIFUploads">func (r *RepositoryResolver) LSIFUploads(ctx context.Context, args *LSIFUploadsQueryArgs) (LSIFUploadConnectionResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.LSIFUploads
tags: [method]
```

```Go
func (r *RepositoryResolver) LSIFUploads(ctx context.Context, args *LSIFUploadsQueryArgs) (LSIFUploadConnectionResolver, error)
```

#### <a id="RepositoryResolver.Label" href="#RepositoryResolver.Label">func (r *RepositoryResolver) Label() (Markdown, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.Label
tags: [method]
```

```Go
func (r *RepositoryResolver) Label() (Markdown, error)
```

#### <a id="RepositoryResolver.Language" href="#RepositoryResolver.Language">func (r *RepositoryResolver) Language(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.Language
tags: [method]
```

```Go
func (r *RepositoryResolver) Language(ctx context.Context) (string, error)
```

#### <a id="RepositoryResolver.Matches" href="#RepositoryResolver.Matches">func (r *RepositoryResolver) Matches() []*searchResultMatchResolver</a>

```
searchKey: graphqlbackend.RepositoryResolver.Matches
tags: [method]
```

```Go
func (r *RepositoryResolver) Matches() []*searchResultMatchResolver
```

#### <a id="RepositoryResolver.MirrorInfo" href="#RepositoryResolver.MirrorInfo">func (r *RepositoryResolver) MirrorInfo() *repositoryMirrorInfoResolver</a>

```
searchKey: graphqlbackend.RepositoryResolver.MirrorInfo
tags: [method]
```

```Go
func (r *RepositoryResolver) MirrorInfo() *repositoryMirrorInfoResolver
```

#### <a id="RepositoryResolver.Name" href="#RepositoryResolver.Name">func (r *RepositoryResolver) Name() string</a>

```
searchKey: graphqlbackend.RepositoryResolver.Name
tags: [method]
```

```Go
func (r *RepositoryResolver) Name() string
```

#### <a id="RepositoryResolver.PermissionsInfo" href="#RepositoryResolver.PermissionsInfo">func (r *RepositoryResolver) PermissionsInfo(ctx context.Context) (PermissionsInfoResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.PermissionsInfo
tags: [method]
```

```Go
func (r *RepositoryResolver) PermissionsInfo(ctx context.Context) (PermissionsInfoResolver, error)
```

#### <a id="RepositoryResolver.RepoName" href="#RepositoryResolver.RepoName">func (r *RepositoryResolver) RepoName() api.RepoName</a>

```
searchKey: graphqlbackend.RepositoryResolver.RepoName
tags: [method]
```

```Go
func (r *RepositoryResolver) RepoName() api.RepoName
```

#### <a id="RepositoryResolver.ResultCount" href="#RepositoryResolver.ResultCount">func (r *RepositoryResolver) ResultCount() int32</a>

```
searchKey: graphqlbackend.RepositoryResolver.ResultCount
tags: [method]
```

```Go
func (r *RepositoryResolver) ResultCount() int32
```

#### <a id="RepositoryResolver.Rev" href="#RepositoryResolver.Rev">func (r *RepositoryResolver) Rev() string</a>

```
searchKey: graphqlbackend.RepositoryResolver.Rev
tags: [method]
```

```Go
func (r *RepositoryResolver) Rev() string
```

#### <a id="RepositoryResolver.Stars" href="#RepositoryResolver.Stars">func (r *RepositoryResolver) Stars(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.Stars
tags: [method]
```

```Go
func (r *RepositoryResolver) Stars(ctx context.Context) (int32, error)
```

#### <a id="RepositoryResolver.Tags" href="#RepositoryResolver.Tags">func (r *RepositoryResolver) Tags(ctx context.Context, args *refsArgs) (*gitRefConnectionResolver, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.Tags
tags: [method]
```

```Go
func (r *RepositoryResolver) Tags(ctx context.Context, args *refsArgs) (*gitRefConnectionResolver, error)
```

#### <a id="RepositoryResolver.TextSearchIndex" href="#RepositoryResolver.TextSearchIndex">func (r *RepositoryResolver) TextSearchIndex() *repositoryTextSearchIndexResolver</a>

```
searchKey: graphqlbackend.RepositoryResolver.TextSearchIndex
tags: [method]
```

```Go
func (r *RepositoryResolver) TextSearchIndex() *repositoryTextSearchIndexResolver
```

#### <a id="RepositoryResolver.ToCommitSearchResult" href="#RepositoryResolver.ToCommitSearchResult">func (r *RepositoryResolver) ToCommitSearchResult() (*CommitSearchResultResolver, bool)</a>

```
searchKey: graphqlbackend.RepositoryResolver.ToCommitSearchResult
tags: [method]
```

```Go
func (r *RepositoryResolver) ToCommitSearchResult() (*CommitSearchResultResolver, bool)
```

#### <a id="RepositoryResolver.ToFileMatch" href="#RepositoryResolver.ToFileMatch">func (r *RepositoryResolver) ToFileMatch() (*FileMatchResolver, bool)</a>

```
searchKey: graphqlbackend.RepositoryResolver.ToFileMatch
tags: [method]
```

```Go
func (r *RepositoryResolver) ToFileMatch() (*FileMatchResolver, bool)
```

#### <a id="RepositoryResolver.ToRepository" href="#RepositoryResolver.ToRepository">func (r *RepositoryResolver) ToRepository() (*RepositoryResolver, bool)</a>

```
searchKey: graphqlbackend.RepositoryResolver.ToRepository
tags: [method]
```

```Go
func (r *RepositoryResolver) ToRepository() (*RepositoryResolver, bool)
```

#### <a id="RepositoryResolver.Type" href="#RepositoryResolver.Type">func (r *RepositoryResolver) Type(ctx context.Context) (*types.Repo, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.Type
tags: [method]
```

```Go
func (r *RepositoryResolver) Type(ctx context.Context) (*types.Repo, error)
```

#### <a id="RepositoryResolver.URI" href="#RepositoryResolver.URI">func (r *RepositoryResolver) URI(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.URI
tags: [method]
```

```Go
func (r *RepositoryResolver) URI(ctx context.Context) (string, error)
```

#### <a id="RepositoryResolver.URL" href="#RepositoryResolver.URL">func (r *RepositoryResolver) URL() string</a>

```
searchKey: graphqlbackend.RepositoryResolver.URL
tags: [method]
```

```Go
func (r *RepositoryResolver) URL() string
```

#### <a id="RepositoryResolver.UpdatedAt" href="#RepositoryResolver.UpdatedAt">func (r *RepositoryResolver) UpdatedAt() *DateTime</a>

```
searchKey: graphqlbackend.RepositoryResolver.UpdatedAt
tags: [method]
```

```Go
func (r *RepositoryResolver) UpdatedAt() *DateTime
```

#### <a id="RepositoryResolver.ViewerCanAdminister" href="#RepositoryResolver.ViewerCanAdminister">func (r *RepositoryResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.ViewerCanAdminister
tags: [method]
```

```Go
func (r *RepositoryResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

#### <a id="RepositoryResolver.hydrate" href="#RepositoryResolver.hydrate">func (r *RepositoryResolver) hydrate(ctx context.Context) error</a>

```
searchKey: graphqlbackend.RepositoryResolver.hydrate
tags: [method private]
```

```Go
func (r *RepositoryResolver) hydrate(ctx context.Context) error
```

#### <a id="RepositoryResolver.repo" href="#RepositoryResolver.repo">func (r *RepositoryResolver) repo(ctx context.Context) (*types.Repo, error)</a>

```
searchKey: graphqlbackend.RepositoryResolver.repo
tags: [method private]
```

```Go
func (r *RepositoryResolver) repo(ctx context.Context) (*types.Repo, error)
```

repo makes sure the repo is hydrated before returning it. 

### <a id="ResetTriggerQueryTimestampsArgs" href="#ResetTriggerQueryTimestampsArgs">type ResetTriggerQueryTimestampsArgs struct</a>

```
searchKey: graphqlbackend.ResetTriggerQueryTimestampsArgs
tags: [struct]
```

```Go
type ResetTriggerQueryTimestampsArgs struct {
	Id graphql.ID
}
```

### <a id="SearchArgs" href="#SearchArgs">type SearchArgs struct</a>

```
searchKey: graphqlbackend.SearchArgs
tags: [struct]
```

```Go
type SearchArgs struct {
	Version        string
	PatternType    *string
	Query          string
	After          *string
	First          *int32
	VersionContext *string

	// Stream if non-nil will stream all SearchEvents.
	//
	// This is how our streaming and our batch interface co-exist. When this
	// is set, it exposes a way to stream out results as we collect them.
	//
	// TODO(keegan) This is not our final design. For example this doesn't
	// allow us to stream out things like dynamic filters or take into account
	// AND/OR. However, streaming is behind a feature flag for now, so this is
	// to make it visible in the browser.
	Stream streaming.Sender

	// For tests
	Settings *schema.Settings
}
```

### <a id="SearchImplementer" href="#SearchImplementer">type SearchImplementer interface</a>

```
searchKey: graphqlbackend.SearchImplementer
tags: [interface]
```

```Go
type SearchImplementer interface {
	Results(context.Context) (*SearchResultsResolver, error)
	Suggestions(context.Context, *searchSuggestionsArgs) ([]SearchSuggestionResolver, error)
	//lint:ignore U1000 is used by graphql via reflection
	Stats(context.Context) (*searchResultsStats, error)

	Inputs() run.SearchInputs
}
```

#### <a id="NewSearchImplementer" href="#NewSearchImplementer">func NewSearchImplementer(ctx context.Context, db dbutil.DB, args *SearchArgs) (_ SearchImplementer, err error)</a>

```
searchKey: graphqlbackend.NewSearchImplementer
tags: [function]
```

```Go
func NewSearchImplementer(ctx context.Context, db dbutil.DB, args *SearchArgs) (_ SearchImplementer, err error)
```

NewSearchImplementer returns a SearchImplementer that provides search results and suggestions. 

### <a id="SearchResultResolver" href="#SearchResultResolver">type SearchResultResolver interface</a>

```
searchKey: graphqlbackend.SearchResultResolver
tags: [interface]
```

```Go
type SearchResultResolver interface {
	ToRepository() (*RepositoryResolver, bool)
	ToFileMatch() (*FileMatchResolver, bool)
	ToCommitSearchResult() (*CommitSearchResultResolver, bool)

	ResultCount() int32
}
```

SearchResultResolver is a resolver for the GraphQL union type `SearchResult`. 

Supported types: 

```
- *RepositoryResolver         // repo name match
- *fileMatchResolver          // text match
- *commitSearchResultResolver // diff or commit match

```
Note: Any new result types added here also need to be handled properly in search_results.go:301 (sparklines) 

### <a id="SearchResults" href="#SearchResults">type SearchResults struct</a>

```
searchKey: graphqlbackend.SearchResults
tags: [struct]
```

```Go
type SearchResults struct {
	Matches []result.Match
	Stats   streaming.Stats
	Cursor  *run.SearchCursor
	Alert   *searchAlert
}
```

#### <a id="intersect" href="#intersect">func intersect(left, right *SearchResults) *SearchResults</a>

```
searchKey: graphqlbackend.intersect
tags: [function private]
```

```Go
func intersect(left, right *SearchResults) *SearchResults
```

intersect returns the intersection of two sets of search result content matches, based on whether a single file path contains content matches in both sets. 

#### <a id="intersectMerge" href="#intersectMerge">func intersectMerge(left, right *SearchResults) *SearchResults</a>

```
searchKey: graphqlbackend.intersectMerge
tags: [function private]
```

```Go
func intersectMerge(left, right *SearchResults) *SearchResults
```

intersectMerge performs a merge of file match results, merging line matches for files contained in both result sets, and updating counts. 

#### <a id="union" href="#union">func union(left, right *SearchResults) *SearchResults</a>

```
searchKey: graphqlbackend.union
tags: [function private]
```

```Go
func union(left, right *SearchResults) *SearchResults
```

union returns the union of two sets of search results and merges common search data. 

#### <a id="unionMerge" href="#unionMerge">func unionMerge(left, right *SearchResults) *SearchResults</a>

```
searchKey: graphqlbackend.unionMerge
tags: [function private]
```

```Go
func unionMerge(left, right *SearchResults) *SearchResults
```

unionMerge performs a merge of file match results, merging line matches when they occur in the same file. 

### <a id="SearchResultsResolver" href="#SearchResultsResolver">type SearchResultsResolver struct</a>

```
searchKey: graphqlbackend.SearchResultsResolver
tags: [struct]
```

```Go
type SearchResultsResolver struct {
	db dbutil.DB
	*SearchResults

	// limit is the maximum number of SearchResults to send back to the user.
	limit int

	// The time it took to compute all results.
	elapsed time.Duration

	// cache for user settings. Ideally this should be set just once in the code path
	// by an upstream resolver
	UserSettings *schema.Settings
}
```

SearchResultsResolver is a resolver for the GraphQL type `SearchResults` 

#### <a id="SearchResultsResolver.Alert" href="#SearchResultsResolver.Alert">func (sr *SearchResultsResolver) Alert() *searchAlert</a>

```
searchKey: graphqlbackend.SearchResultsResolver.Alert
tags: [method]
```

```Go
func (sr *SearchResultsResolver) Alert() *searchAlert
```

#### <a id="SearchResultsResolver.ApproximateResultCount" href="#SearchResultsResolver.ApproximateResultCount">func (sr *SearchResultsResolver) ApproximateResultCount() string</a>

```
searchKey: graphqlbackend.SearchResultsResolver.ApproximateResultCount
tags: [method]
```

```Go
func (sr *SearchResultsResolver) ApproximateResultCount() string
```

#### <a id="SearchResultsResolver.Cloning" href="#SearchResultsResolver.Cloning">func (c *SearchResultsResolver) Cloning() []*RepositoryResolver</a>

```
searchKey: graphqlbackend.SearchResultsResolver.Cloning
tags: [method]
```

```Go
func (c *SearchResultsResolver) Cloning() []*RepositoryResolver
```

#### <a id="SearchResultsResolver.DynamicFilters" href="#SearchResultsResolver.DynamicFilters">func (sr *SearchResultsResolver) DynamicFilters(ctx context.Context) []*searchFilterResolver</a>

```
searchKey: graphqlbackend.SearchResultsResolver.DynamicFilters
tags: [method]
```

```Go
func (sr *SearchResultsResolver) DynamicFilters(ctx context.Context) []*searchFilterResolver
```

#### <a id="SearchResultsResolver.ElapsedMilliseconds" href="#SearchResultsResolver.ElapsedMilliseconds">func (sr *SearchResultsResolver) ElapsedMilliseconds() int32</a>

```
searchKey: graphqlbackend.SearchResultsResolver.ElapsedMilliseconds
tags: [method]
```

```Go
func (sr *SearchResultsResolver) ElapsedMilliseconds() int32
```

#### <a id="SearchResultsResolver.IndexUnavailable" href="#SearchResultsResolver.IndexUnavailable">func (c *SearchResultsResolver) IndexUnavailable() bool</a>

```
searchKey: graphqlbackend.SearchResultsResolver.IndexUnavailable
tags: [method]
```

```Go
func (c *SearchResultsResolver) IndexUnavailable() bool
```

#### <a id="SearchResultsResolver.LimitHit" href="#SearchResultsResolver.LimitHit">func (c *SearchResultsResolver) LimitHit() bool</a>

```
searchKey: graphqlbackend.SearchResultsResolver.LimitHit
tags: [method]
```

```Go
func (c *SearchResultsResolver) LimitHit() bool
```

#### <a id="SearchResultsResolver.MatchCount" href="#SearchResultsResolver.MatchCount">func (sr *SearchResultsResolver) MatchCount() int32</a>

```
searchKey: graphqlbackend.SearchResultsResolver.MatchCount
tags: [method]
```

```Go
func (sr *SearchResultsResolver) MatchCount() int32
```

#### <a id="SearchResultsResolver.Missing" href="#SearchResultsResolver.Missing">func (c *SearchResultsResolver) Missing() []*RepositoryResolver</a>

```
searchKey: graphqlbackend.SearchResultsResolver.Missing
tags: [method]
```

```Go
func (c *SearchResultsResolver) Missing() []*RepositoryResolver
```

#### <a id="SearchResultsResolver.PageInfo" href="#SearchResultsResolver.PageInfo">func (r *SearchResultsResolver) PageInfo() *graphqlutil.PageInfo</a>

```
searchKey: graphqlbackend.SearchResultsResolver.PageInfo
tags: [method]
```

```Go
func (r *SearchResultsResolver) PageInfo() *graphqlutil.PageInfo
```

#### <a id="SearchResultsResolver.Repositories" href="#SearchResultsResolver.Repositories">func (c *SearchResultsResolver) Repositories() []*RepositoryResolver</a>

```
searchKey: graphqlbackend.SearchResultsResolver.Repositories
tags: [method]
```

```Go
func (c *SearchResultsResolver) Repositories() []*RepositoryResolver
```

#### <a id="SearchResultsResolver.RepositoriesCount" href="#SearchResultsResolver.RepositoriesCount">func (c *SearchResultsResolver) RepositoriesCount() int32</a>

```
searchKey: graphqlbackend.SearchResultsResolver.RepositoriesCount
tags: [method]
```

```Go
func (c *SearchResultsResolver) RepositoriesCount() int32
```

#### <a id="SearchResultsResolver.ResultCount" href="#SearchResultsResolver.ResultCount">func (sr *SearchResultsResolver) ResultCount() int32</a>

```
searchKey: graphqlbackend.SearchResultsResolver.ResultCount
tags: [method deprecated]
```

```Go
func (sr *SearchResultsResolver) ResultCount() int32
```

Deprecated. Prefer MatchCount. 

#### <a id="SearchResultsResolver.Results" href="#SearchResultsResolver.Results">func (sr *SearchResultsResolver) Results() []SearchResultResolver</a>

```
searchKey: graphqlbackend.SearchResultsResolver.Results
tags: [method]
```

```Go
func (sr *SearchResultsResolver) Results() []SearchResultResolver
```

Results are the results found by the search. It respects the limits set. To access all results directly access the SearchResults field. 

#### <a id="SearchResultsResolver.Sparkline" href="#SearchResultsResolver.Sparkline">func (sr *SearchResultsResolver) Sparkline(ctx context.Context) (sparkline []int32, err error)</a>

```
searchKey: graphqlbackend.SearchResultsResolver.Sparkline
tags: [method]
```

```Go
func (sr *SearchResultsResolver) Sparkline(ctx context.Context) (sparkline []int32, err error)
```

#### <a id="SearchResultsResolver.Timedout" href="#SearchResultsResolver.Timedout">func (c *SearchResultsResolver) Timedout() []*RepositoryResolver</a>

```
searchKey: graphqlbackend.SearchResultsResolver.Timedout
tags: [method]
```

```Go
func (c *SearchResultsResolver) Timedout() []*RepositoryResolver
```

#### <a id="SearchResultsResolver.blameFileMatch" href="#SearchResultsResolver.blameFileMatch">func (sr *SearchResultsResolver) blameFileMatch(ctx context.Context, fm *result.FileMatch) (t time.Time, err error)</a>

```
searchKey: graphqlbackend.SearchResultsResolver.blameFileMatch
tags: [method private]
```

```Go
func (sr *SearchResultsResolver) blameFileMatch(ctx context.Context, fm *result.FileMatch) (t time.Time, err error)
```

blameFileMatch blames the specified file match to produce the time at which the first line match inside of it was authored. 

#### <a id="SearchResultsResolver.repositoryResolvers" href="#SearchResultsResolver.repositoryResolvers">func (c *SearchResultsResolver) repositoryResolvers(mask search.RepoStatus) []*RepositoryResolver</a>

```
searchKey: graphqlbackend.SearchResultsResolver.repositoryResolvers
tags: [method private]
```

```Go
func (c *SearchResultsResolver) repositoryResolvers(mask search.RepoStatus) []*RepositoryResolver
```

### <a id="SearchSuggestionResolver" href="#SearchSuggestionResolver">type SearchSuggestionResolver interface</a>

```
searchKey: graphqlbackend.SearchSuggestionResolver
tags: [interface]
```

```Go
type SearchSuggestionResolver interface {
	// Score defines how well this item matches the query for sorting purposes
	Score() int

	// Length holds the length of the item name as a second sorting criterium
	Length() int

	// Label to sort alphabetically by when all else is equal.
	Label() string

	// Key is a key used to deduplicate suggestion results
	Key() suggestionKey

	ToRepository() (*RepositoryResolver, bool)
	ToFile() (*GitTreeEntryResolver, bool)
	ToGitBlob() (*GitTreeEntryResolver, bool)
	ToGitTree() (*GitTreeEntryResolver, bool)
	ToSymbol() (*symbolResolver, bool)
	ToLanguage() (*languageResolver, bool)
	ToSearchContext() (*searchContextResolver, bool)
}
```

SearchSuggestionResolver is a resolver for the GraphQL union type `SearchSuggestion` 

### <a id="SetProductSubscriptionBillingArgs" href="#SetProductSubscriptionBillingArgs">type SetProductSubscriptionBillingArgs struct</a>

```
searchKey: graphqlbackend.SetProductSubscriptionBillingArgs
tags: [struct]
```

```Go
type SetProductSubscriptionBillingArgs struct {
	ID                    graphql.ID
	BillingSubscriptionID *string
}
```

### <a id="SetUserBillingArgs" href="#SetUserBillingArgs">type SetUserBillingArgs struct</a>

```
searchKey: graphqlbackend.SetUserBillingArgs
tags: [struct]
```

```Go
type SetUserBillingArgs struct {
	User              graphql.ID
	BillingCustomerID *string
}
```

### <a id="SurveySubmissionInput" href="#SurveySubmissionInput">type SurveySubmissionInput struct</a>

```
searchKey: graphqlbackend.SurveySubmissionInput
tags: [struct]
```

```Go
type SurveySubmissionInput struct {
	// Emails is an optional, user-provided email address, if there is no
	// currently authenticated user. If there is, this value will not be used.
	Email *string
	// Score is the user's likelihood of recommending Sourcegraph to a friend, from 0-10.
	Score int32
	// Reason is the answer to "What is the most important reason for the score you gave".
	Reason *string
	// Better is the answer to "What can Sourcegraph do to provide a better product"
	Better *string
}
```

SurveySubmissionInput contains a satisfaction (NPS) survey response. 

### <a id="SyncChangesetArgs" href="#SyncChangesetArgs">type SyncChangesetArgs struct</a>

```
searchKey: graphqlbackend.SyncChangesetArgs
tags: [struct]
```

```Go
type SyncChangesetArgs struct {
	Changeset graphql.ID
}
```

### <a id="Test" href="#Test">type Test struct</a>

```
searchKey: graphqlbackend.Test
tags: [struct]
```

```Go
type Test struct {
	Context        context.Context
	Schema         *graphql.Schema
	Query          string
	OperationName  string
	Variables      map[string]interface{}
	ExpectedResult string
	ExpectedErrors []*errors.QueryError
}
```

Test is a GraphQL test case to be used with RunTest(s). 

### <a id="ToggleCodeMonitorArgs" href="#ToggleCodeMonitorArgs">type ToggleCodeMonitorArgs struct</a>

```
searchKey: graphqlbackend.ToggleCodeMonitorArgs
tags: [struct]
```

```Go
type ToggleCodeMonitorArgs struct {
	Id      graphql.ID
	Enabled bool
}
```

### <a id="TotalCountArgs" href="#TotalCountArgs">type TotalCountArgs struct</a>

```
searchKey: graphqlbackend.TotalCountArgs
tags: [struct]
```

```Go
type TotalCountArgs struct {
	Precise bool
}
```

### <a id="TriggerTestEmailActionArgs" href="#TriggerTestEmailActionArgs">type TriggerTestEmailActionArgs struct</a>

```
searchKey: graphqlbackend.TriggerTestEmailActionArgs
tags: [struct]
```

```Go
type TriggerTestEmailActionArgs struct {
	Namespace   graphql.ID
	Description string
	Email       *CreateActionEmailArgs
}
```

### <a id="UpdateCodeMonitorArgs" href="#UpdateCodeMonitorArgs">type UpdateCodeMonitorArgs struct</a>

```
searchKey: graphqlbackend.UpdateCodeMonitorArgs
tags: [struct]
```

```Go
type UpdateCodeMonitorArgs struct {
	Monitor *EditMonitorArgs
	Trigger *EditTriggerArgs
	Actions []*EditActionArgs
}
```

### <a id="UpdatePaidProductSubscriptionArgs" href="#UpdatePaidProductSubscriptionArgs">type UpdatePaidProductSubscriptionArgs struct</a>

```
searchKey: graphqlbackend.UpdatePaidProductSubscriptionArgs
tags: [struct]
```

```Go
type UpdatePaidProductSubscriptionArgs struct {
	SubscriptionID graphql.ID
	Update         ProductSubscriptionInput
	PaymentToken   *string
}
```

### <a id="UpdatePaidProductSubscriptionResult" href="#UpdatePaidProductSubscriptionResult">type UpdatePaidProductSubscriptionResult struct</a>

```
searchKey: graphqlbackend.UpdatePaidProductSubscriptionResult
tags: [struct]
```

```Go
type UpdatePaidProductSubscriptionResult struct {
	ProductSubscriptionValue ProductSubscription
}
```

UpdatePaidProductSubscriptionResult implements the GraphQL type UpdatePaidProductSubscriptionResult. 

#### <a id="UpdatePaidProductSubscriptionResult.ProductSubscription" href="#UpdatePaidProductSubscriptionResult.ProductSubscription">func (r *UpdatePaidProductSubscriptionResult) ProductSubscription() ProductSubscription</a>

```
searchKey: graphqlbackend.UpdatePaidProductSubscriptionResult.ProductSubscription
tags: [method]
```

```Go
func (r *UpdatePaidProductSubscriptionResult) ProductSubscription() ProductSubscription
```

### <a id="UpdateRepositoryIndexConfigurationArgs" href="#UpdateRepositoryIndexConfigurationArgs">type UpdateRepositoryIndexConfigurationArgs struct</a>

```
searchKey: graphqlbackend.UpdateRepositoryIndexConfigurationArgs
tags: [struct]
```

```Go
type UpdateRepositoryIndexConfigurationArgs struct {
	Repository    graphql.ID
	Configuration string
}
```

### <a id="UserConnectionResolver" href="#UserConnectionResolver">type UserConnectionResolver interface</a>

```
searchKey: graphqlbackend.UserConnectionResolver
tags: [interface]
```

```Go
type UserConnectionResolver interface {
	Nodes(ctx context.Context) ([]*UserResolver, error)
	TotalCount(ctx context.Context) (int32, error)
	PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
}
```

### <a id="UserIDArgs" href="#UserIDArgs">type UserIDArgs struct</a>

```
searchKey: graphqlbackend.UserIDArgs
tags: [struct]
```

```Go
type UserIDArgs struct {
	User graphql.ID
}
```

### <a id="UserResolver" href="#UserResolver">type UserResolver struct</a>

```
searchKey: graphqlbackend.UserResolver
tags: [struct]
```

```Go
type UserResolver struct {
	db   dbutil.DB
	user *types.User
}
```

UserResolver implements the GraphQL User type. 

#### <a id="CurrentUser" href="#CurrentUser">func CurrentUser(ctx context.Context, db dbutil.DB) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.CurrentUser
tags: [function]
```

```Go
func CurrentUser(ctx context.Context, db dbutil.DB) (*UserResolver, error)
```

CurrentUser returns the authenticated user if any. If there is no authenticated user, it returns (nil, nil). If some other error occurs, then the error is returned. 

#### <a id="NewUserResolver" href="#NewUserResolver">func NewUserResolver(db dbutil.DB, user *types.User) *UserResolver</a>

```
searchKey: graphqlbackend.NewUserResolver
tags: [function]
```

```Go
func NewUserResolver(db dbutil.DB, user *types.User) *UserResolver
```

NewUserResolver returns a new UserResolver with given user object. 

#### <a id="UserByID" href="#UserByID">func UserByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.UserByID
tags: [function]
```

```Go
func UserByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*UserResolver, error)
```

UserByID looks up and returns the user with the given GraphQL ID. If no such user exists, it returns a non-nil error. 

#### <a id="UserByIDInt32" href="#UserByIDInt32">func UserByIDInt32(ctx context.Context, db dbutil.DB, id int32) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.UserByIDInt32
tags: [function]
```

```Go
func UserByIDInt32(ctx context.Context, db dbutil.DB, id int32) (*UserResolver, error)
```

UserByIDInt32 looks up and returns the user with the given database ID. If no such user exists, it returns a non-nil error. 

#### <a id="UserResolver.AccessTokens" href="#UserResolver.AccessTokens">func (r *UserResolver) AccessTokens(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.UserResolver.AccessTokens
tags: [method]
```

```Go
func (r *UserResolver) AccessTokens(ctx context.Context, args *struct {
	graphqlutil.ConnectionArgs
}) (*accessTokenConnectionResolver, error)
```

#### <a id="UserResolver.AvatarURL" href="#UserResolver.AvatarURL">func (r *UserResolver) AvatarURL() *string</a>

```
searchKey: graphqlbackend.UserResolver.AvatarURL
tags: [method]
```

```Go
func (r *UserResolver) AvatarURL() *string
```

#### <a id="UserResolver.BatchChanges" href="#UserResolver.BatchChanges">func (r *UserResolver) BatchChanges(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.BatchChanges
tags: [method]
```

```Go
func (r *UserResolver) BatchChanges(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)
```

#### <a id="UserResolver.BatchChangesCodeHosts" href="#UserResolver.BatchChangesCodeHosts">func (r *UserResolver) BatchChangesCodeHosts(ctx context.Context, args *ListBatchChangesCodeHostsArgs) (BatchChangesCodeHostConnectionResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.BatchChangesCodeHosts
tags: [method]
```

```Go
func (r *UserResolver) BatchChangesCodeHosts(ctx context.Context, args *ListBatchChangesCodeHostsArgs) (BatchChangesCodeHostConnectionResolver, error)
```

#### <a id="UserResolver.BuiltinAuth" href="#UserResolver.BuiltinAuth">func (r *UserResolver) BuiltinAuth() bool</a>

```
searchKey: graphqlbackend.UserResolver.BuiltinAuth
tags: [method]
```

```Go
func (r *UserResolver) BuiltinAuth() bool
```

#### <a id="UserResolver.Campaigns" href="#UserResolver.Campaigns">func (r *UserResolver) Campaigns(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.Campaigns
tags: [method]
```

```Go
func (r *UserResolver) Campaigns(ctx context.Context, args *ListBatchChangesArgs) (BatchChangesConnectionResolver, error)
```

TODO(campaigns-deprecation): 

#### <a id="UserResolver.CampaignsCodeHosts" href="#UserResolver.CampaignsCodeHosts">func (r *UserResolver) CampaignsCodeHosts(ctx context.Context, args *ListCampaignsCodeHostsArgs) (CampaignsCodeHostConnectionResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.CampaignsCodeHosts
tags: [method]
```

```Go
func (r *UserResolver) CampaignsCodeHosts(ctx context.Context, args *ListCampaignsCodeHostsArgs) (CampaignsCodeHostConnectionResolver, error)
```

#### <a id="UserResolver.ConfigurationCascade" href="#UserResolver.ConfigurationCascade">func (r *UserResolver) ConfigurationCascade() *settingsCascade</a>

```
searchKey: graphqlbackend.UserResolver.ConfigurationCascade
tags: [method]
```

```Go
func (r *UserResolver) ConfigurationCascade() *settingsCascade
```

#### <a id="UserResolver.CreatedAt" href="#UserResolver.CreatedAt">func (r *UserResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.UserResolver.CreatedAt
tags: [method]
```

```Go
func (r *UserResolver) CreatedAt() DateTime
```

#### <a id="UserResolver.DatabaseID" href="#UserResolver.DatabaseID">func (r *UserResolver) DatabaseID() int32</a>

```
searchKey: graphqlbackend.UserResolver.DatabaseID
tags: [method]
```

```Go
func (r *UserResolver) DatabaseID() int32
```

DatabaseID returns the numeric ID for the user in the database. 

#### <a id="UserResolver.DisplayName" href="#UserResolver.DisplayName">func (r *UserResolver) DisplayName() *string</a>

```
searchKey: graphqlbackend.UserResolver.DisplayName
tags: [method]
```

```Go
func (r *UserResolver) DisplayName() *string
```

#### <a id="UserResolver.Email" href="#UserResolver.Email">func (r *UserResolver) Email(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.UserResolver.Email
tags: [method deprecated]
```

```Go
func (r *UserResolver) Email(ctx context.Context) (string, error)
```

Email returns the user's oldest email, if one exists. Deprecated: use Emails instead. 

#### <a id="UserResolver.Emails" href="#UserResolver.Emails">func (r *UserResolver) Emails(ctx context.Context) ([]*userEmailResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.Emails
tags: [method]
```

```Go
func (r *UserResolver) Emails(ctx context.Context) ([]*userEmailResolver, error)
```

#### <a id="UserResolver.EventLogs" href="#UserResolver.EventLogs">func (r *UserResolver) EventLogs(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.UserResolver.EventLogs
tags: [method]
```

```Go
func (r *UserResolver) EventLogs(ctx context.Context, args *struct {
	graphqlutil.ConnectionArgs
	EventName *string // return only event logs matching the event name
}) (*userEventLogsConnectionResolver, error)
```

#### <a id="UserResolver.ExternalAccounts" href="#UserResolver.ExternalAccounts">func (r *UserResolver) ExternalAccounts(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.UserResolver.ExternalAccounts
tags: [method]
```

```Go
func (r *UserResolver) ExternalAccounts(ctx context.Context, args *struct {
	graphqlutil.ConnectionArgs
}) (*externalAccountConnectionResolver, error)
```

#### <a id="UserResolver.ID" href="#UserResolver.ID">func (r *UserResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.UserResolver.ID
tags: [method]
```

```Go
func (r *UserResolver) ID() graphql.ID
```

#### <a id="UserResolver.LatestSettings" href="#UserResolver.LatestSettings">func (r *UserResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.LatestSettings
tags: [method]
```

```Go
func (r *UserResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)
```

#### <a id="UserResolver.Monitors" href="#UserResolver.Monitors">func (r *UserResolver) Monitors(ctx context.Context, args *ListMonitorsArgs) (MonitorConnectionResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.Monitors
tags: [method]
```

```Go
func (r *UserResolver) Monitors(ctx context.Context, args *ListMonitorsArgs) (MonitorConnectionResolver, error)
```

#### <a id="UserResolver.NamespaceName" href="#UserResolver.NamespaceName">func (r *UserResolver) NamespaceName() string</a>

```
searchKey: graphqlbackend.UserResolver.NamespaceName
tags: [method]
```

```Go
func (r *UserResolver) NamespaceName() string
```

#### <a id="UserResolver.OrganizationMemberships" href="#UserResolver.OrganizationMemberships">func (r *UserResolver) OrganizationMemberships(ctx context.Context) (*organizationMembershipConnectionResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.OrganizationMemberships
tags: [method]
```

```Go
func (r *UserResolver) OrganizationMemberships(ctx context.Context) (*organizationMembershipConnectionResolver, error)
```

#### <a id="UserResolver.Organizations" href="#UserResolver.Organizations">func (r *UserResolver) Organizations(ctx context.Context) (*orgConnectionStaticResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.Organizations
tags: [method]
```

```Go
func (r *UserResolver) Organizations(ctx context.Context) (*orgConnectionStaticResolver, error)
```

#### <a id="UserResolver.PermissionsInfo" href="#UserResolver.PermissionsInfo">func (r *UserResolver) PermissionsInfo(ctx context.Context) (PermissionsInfoResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.PermissionsInfo
tags: [method]
```

```Go
func (r *UserResolver) PermissionsInfo(ctx context.Context) (PermissionsInfoResolver, error)
```

#### <a id="UserResolver.PublicRepositories" href="#UserResolver.PublicRepositories">func (r *UserResolver) PublicRepositories(ctx context.Context) ([]*RepositoryResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.PublicRepositories
tags: [method]
```

```Go
func (r *UserResolver) PublicRepositories(ctx context.Context) ([]*RepositoryResolver, error)
```

#### <a id="UserResolver.Repositories" href="#UserResolver.Repositories">func (r *UserResolver) Repositories(ctx context.Context, args *ListUserRepositoriesArgs) (RepositoryConnectionResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.Repositories
tags: [method]
```

```Go
func (r *UserResolver) Repositories(ctx context.Context, args *ListUserRepositoriesArgs) (RepositoryConnectionResolver, error)
```

#### <a id="UserResolver.Session" href="#UserResolver.Session">func (r *UserResolver) Session(ctx context.Context) (*sessionResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.Session
tags: [method]
```

```Go
func (r *UserResolver) Session(ctx context.Context) (*sessionResolver, error)
```

#### <a id="UserResolver.SettingsCascade" href="#UserResolver.SettingsCascade">func (r *UserResolver) SettingsCascade() *settingsCascade</a>

```
searchKey: graphqlbackend.UserResolver.SettingsCascade
tags: [method]
```

```Go
func (r *UserResolver) SettingsCascade() *settingsCascade
```

#### <a id="UserResolver.SettingsURL" href="#UserResolver.SettingsURL">func (r *UserResolver) SettingsURL() *string</a>

```
searchKey: graphqlbackend.UserResolver.SettingsURL
tags: [method]
```

```Go
func (r *UserResolver) SettingsURL() *string
```

#### <a id="UserResolver.SiteAdmin" href="#UserResolver.SiteAdmin">func (r *UserResolver) SiteAdmin(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.UserResolver.SiteAdmin
tags: [method]
```

```Go
func (r *UserResolver) SiteAdmin(ctx context.Context) (bool, error)
```

#### <a id="UserResolver.SurveyResponses" href="#UserResolver.SurveyResponses">func (r *UserResolver) SurveyResponses(ctx context.Context) ([]*surveyResponseResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.SurveyResponses
tags: [method]
```

```Go
func (r *UserResolver) SurveyResponses(ctx context.Context) ([]*surveyResponseResolver, error)
```

#### <a id="UserResolver.Tags" href="#UserResolver.Tags">func (r *UserResolver) Tags(ctx context.Context) ([]string, error)</a>

```
searchKey: graphqlbackend.UserResolver.Tags
tags: [method]
```

```Go
func (r *UserResolver) Tags(ctx context.Context) ([]string, error)
```

#### <a id="UserResolver.URL" href="#UserResolver.URL">func (r *UserResolver) URL() string</a>

```
searchKey: graphqlbackend.UserResolver.URL
tags: [method]
```

```Go
func (r *UserResolver) URL() string
```

#### <a id="UserResolver.URLForSiteAdminBilling" href="#UserResolver.URLForSiteAdminBilling">func (r *UserResolver) URLForSiteAdminBilling(ctx context.Context) (*string, error)</a>

```
searchKey: graphqlbackend.UserResolver.URLForSiteAdminBilling
tags: [method]
```

```Go
func (r *UserResolver) URLForSiteAdminBilling(ctx context.Context) (*string, error)
```

#### <a id="UserResolver.UpdatedAt" href="#UserResolver.UpdatedAt">func (r *UserResolver) UpdatedAt() *DateTime</a>

```
searchKey: graphqlbackend.UserResolver.UpdatedAt
tags: [method]
```

```Go
func (r *UserResolver) UpdatedAt() *DateTime
```

#### <a id="UserResolver.UsageStatistics" href="#UserResolver.UsageStatistics">func (r *UserResolver) UsageStatistics(ctx context.Context) (*userUsageStatisticsResolver, error)</a>

```
searchKey: graphqlbackend.UserResolver.UsageStatistics
tags: [method]
```

```Go
func (r *UserResolver) UsageStatistics(ctx context.Context) (*userUsageStatisticsResolver, error)
```

#### <a id="UserResolver.Username" href="#UserResolver.Username">func (r *UserResolver) Username() string</a>

```
searchKey: graphqlbackend.UserResolver.Username
tags: [method]
```

```Go
func (r *UserResolver) Username() string
```

#### <a id="UserResolver.ViewerCanAdminister" href="#UserResolver.ViewerCanAdminister">func (r *UserResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.UserResolver.ViewerCanAdminister
tags: [method]
```

```Go
func (r *UserResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

#### <a id="UserResolver.ViewerCanChangeUsername" href="#UserResolver.ViewerCanChangeUsername">func (r *UserResolver) ViewerCanChangeUsername(ctx context.Context) bool</a>

```
searchKey: graphqlbackend.UserResolver.ViewerCanChangeUsername
tags: [method]
```

```Go
func (r *UserResolver) ViewerCanChangeUsername(ctx context.Context) bool
```

ViewerCanChangeUsername returns if the current user can change the username of the user. 

#### <a id="UserResolver.settingsSubject" href="#UserResolver.settingsSubject">func (r *UserResolver) settingsSubject() api.SettingsSubject</a>

```
searchKey: graphqlbackend.UserResolver.settingsSubject
tags: [method private]
```

```Go
func (r *UserResolver) settingsSubject() api.SettingsSubject
```

### <a id="VisibleApplyPreviewTargetsAttachResolver" href="#VisibleApplyPreviewTargetsAttachResolver">type VisibleApplyPreviewTargetsAttachResolver interface</a>

```
searchKey: graphqlbackend.VisibleApplyPreviewTargetsAttachResolver
tags: [interface]
```

```Go
type VisibleApplyPreviewTargetsAttachResolver interface {
	ChangesetSpec(ctx context.Context) (VisibleChangesetSpecResolver, error)
}
```

### <a id="VisibleApplyPreviewTargetsDetachResolver" href="#VisibleApplyPreviewTargetsDetachResolver">type VisibleApplyPreviewTargetsDetachResolver interface</a>

```
searchKey: graphqlbackend.VisibleApplyPreviewTargetsDetachResolver
tags: [interface]
```

```Go
type VisibleApplyPreviewTargetsDetachResolver interface {
	Changeset(ctx context.Context) (ExternalChangesetResolver, error)
}
```

### <a id="VisibleApplyPreviewTargetsResolver" href="#VisibleApplyPreviewTargetsResolver">type VisibleApplyPreviewTargetsResolver interface</a>

```
searchKey: graphqlbackend.VisibleApplyPreviewTargetsResolver
tags: [interface]
```

```Go
type VisibleApplyPreviewTargetsResolver interface {
	ToVisibleApplyPreviewTargetsAttach() (VisibleApplyPreviewTargetsAttachResolver, bool)
	ToVisibleApplyPreviewTargetsUpdate() (VisibleApplyPreviewTargetsUpdateResolver, bool)
	ToVisibleApplyPreviewTargetsDetach() (VisibleApplyPreviewTargetsDetachResolver, bool)
}
```

### <a id="VisibleApplyPreviewTargetsUpdateResolver" href="#VisibleApplyPreviewTargetsUpdateResolver">type VisibleApplyPreviewTargetsUpdateResolver interface</a>

```
searchKey: graphqlbackend.VisibleApplyPreviewTargetsUpdateResolver
tags: [interface]
```

```Go
type VisibleApplyPreviewTargetsUpdateResolver interface {
	ChangesetSpec(ctx context.Context) (VisibleChangesetSpecResolver, error)
	Changeset(ctx context.Context) (ExternalChangesetResolver, error)
}
```

### <a id="VisibleChangesetApplyPreviewResolver" href="#VisibleChangesetApplyPreviewResolver">type VisibleChangesetApplyPreviewResolver interface</a>

```
searchKey: graphqlbackend.VisibleChangesetApplyPreviewResolver
tags: [interface]
```

```Go
type VisibleChangesetApplyPreviewResolver interface {
	// Operations returns a slice of btypes.ReconcilerOperation.
	Operations(ctx context.Context) ([]string, error)
	Delta(ctx context.Context) (ChangesetSpecDeltaResolver, error)
	Targets() VisibleApplyPreviewTargetsResolver
}
```

### <a id="VisibleChangesetSpecResolver" href="#VisibleChangesetSpecResolver">type VisibleChangesetSpecResolver interface</a>

```
searchKey: graphqlbackend.VisibleChangesetSpecResolver
tags: [interface]
```

```Go
type VisibleChangesetSpecResolver interface {
	ChangesetSpecResolver

	Description(ctx context.Context) (ChangesetDescription, error)
}
```

### <a id="accessTokenConnectionResolver" href="#accessTokenConnectionResolver">type accessTokenConnectionResolver struct</a>

```
searchKey: graphqlbackend.accessTokenConnectionResolver
tags: [struct private]
```

```Go
type accessTokenConnectionResolver struct {
	opt database.AccessTokensListOptions

	// cache results because they are used by multiple fields
	once         sync.Once
	accessTokens []*database.AccessToken
	err          error
	db           dbutil.DB
}
```

accessTokenConnectionResolver resolves a list of access tokens. 

🚨 SECURITY: When instantiating an accessTokenConnectionResolver value, the caller MUST check permissions. 

#### <a id="accessTokenConnectionResolver.Nodes" href="#accessTokenConnectionResolver.Nodes">func (r *accessTokenConnectionResolver) Nodes(ctx context.Context) ([]*accessTokenResolver, error)</a>

```
searchKey: graphqlbackend.accessTokenConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *accessTokenConnectionResolver) Nodes(ctx context.Context) ([]*accessTokenResolver, error)
```

#### <a id="accessTokenConnectionResolver.PageInfo" href="#accessTokenConnectionResolver.PageInfo">func (r *accessTokenConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.accessTokenConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *accessTokenConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="accessTokenConnectionResolver.TotalCount" href="#accessTokenConnectionResolver.TotalCount">func (r *accessTokenConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.accessTokenConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *accessTokenConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="accessTokenConnectionResolver.compute" href="#accessTokenConnectionResolver.compute">func (r *accessTokenConnectionResolver) compute(ctx context.Context) ([]*database.AccessToken, error)</a>

```
searchKey: graphqlbackend.accessTokenConnectionResolver.compute
tags: [method private]
```

```Go
func (r *accessTokenConnectionResolver) compute(ctx context.Context) ([]*database.AccessToken, error)
```

### <a id="accessTokenResolver" href="#accessTokenResolver">type accessTokenResolver struct</a>

```
searchKey: graphqlbackend.accessTokenResolver
tags: [struct private]
```

```Go
type accessTokenResolver struct {
	db          dbutil.DB
	accessToken database.AccessToken
}
```

accessTokenResolver resolves an access token. 

Access tokens provide scoped access to a user account (not just the API). This is different than other services such as GitHub, where access tokens only provide access to the API. This is OK for us because our general UI is completely implemented via our API, so access token authentication with our UI does not provide any additional functionality. In contrast, GitHub and other services likely allow user accounts to do more than what access tokens alone can via the API. 

#### <a id="accessTokenByID" href="#accessTokenByID">func accessTokenByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*accessTokenResolver, error)</a>

```
searchKey: graphqlbackend.accessTokenByID
tags: [function private]
```

```Go
func accessTokenByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*accessTokenResolver, error)
```

#### <a id="accessTokenResolver.CreatedAt" href="#accessTokenResolver.CreatedAt">func (r *accessTokenResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.accessTokenResolver.CreatedAt
tags: [method private]
```

```Go
func (r *accessTokenResolver) CreatedAt() DateTime
```

#### <a id="accessTokenResolver.Creator" href="#accessTokenResolver.Creator">func (r *accessTokenResolver) Creator(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.accessTokenResolver.Creator
tags: [method private]
```

```Go
func (r *accessTokenResolver) Creator(ctx context.Context) (*UserResolver, error)
```

#### <a id="accessTokenResolver.ID" href="#accessTokenResolver.ID">func (r *accessTokenResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.accessTokenResolver.ID
tags: [method private]
```

```Go
func (r *accessTokenResolver) ID() graphql.ID
```

#### <a id="accessTokenResolver.LastUsedAt" href="#accessTokenResolver.LastUsedAt">func (r *accessTokenResolver) LastUsedAt() *DateTime</a>

```
searchKey: graphqlbackend.accessTokenResolver.LastUsedAt
tags: [method private]
```

```Go
func (r *accessTokenResolver) LastUsedAt() *DateTime
```

#### <a id="accessTokenResolver.Note" href="#accessTokenResolver.Note">func (r *accessTokenResolver) Note() string</a>

```
searchKey: graphqlbackend.accessTokenResolver.Note
tags: [method private]
```

```Go
func (r *accessTokenResolver) Note() string
```

#### <a id="accessTokenResolver.Scopes" href="#accessTokenResolver.Scopes">func (r *accessTokenResolver) Scopes() []string</a>

```
searchKey: graphqlbackend.accessTokenResolver.Scopes
tags: [method private]
```

```Go
func (r *accessTokenResolver) Scopes() []string
```

#### <a id="accessTokenResolver.Subject" href="#accessTokenResolver.Subject">func (r *accessTokenResolver) Subject(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.accessTokenResolver.Subject
tags: [method private]
```

```Go
func (r *accessTokenResolver) Subject(ctx context.Context) (*UserResolver, error)
```

### <a id="addExternalServiceArgs" href="#addExternalServiceArgs">type addExternalServiceArgs struct</a>

```
searchKey: graphqlbackend.addExternalServiceArgs
tags: [struct private]
```

```Go
type addExternalServiceArgs struct {
	Input addExternalServiceInput
}
```

### <a id="addExternalServiceInput" href="#addExternalServiceInput">type addExternalServiceInput struct</a>

```
searchKey: graphqlbackend.addExternalServiceInput
tags: [struct private]
```

```Go
type addExternalServiceInput struct {
	Kind        string
	DisplayName string
	Config      string
	Namespace   *graphql.ID
}
```

### <a id="affiliatedRepositoriesConnection" href="#affiliatedRepositoriesConnection">type affiliatedRepositoriesConnection struct</a>

```
searchKey: graphqlbackend.affiliatedRepositoriesConnection
tags: [struct private]
```

```Go
type affiliatedRepositoriesConnection struct {
	userID   int32
	codeHost int64
	query    string

	once  sync.Once
	nodes []*codeHostRepositoryResolver
	err   error
	db    dbutil.DB
}
```

#### <a id="affiliatedRepositoriesConnection.Nodes" href="#affiliatedRepositoriesConnection.Nodes">func (a *affiliatedRepositoriesConnection) Nodes(ctx context.Context) ([]*codeHostRepositoryResolver, error)</a>

```
searchKey: graphqlbackend.affiliatedRepositoriesConnection.Nodes
tags: [method private]
```

```Go
func (a *affiliatedRepositoriesConnection) Nodes(ctx context.Context) ([]*codeHostRepositoryResolver, error)
```

### <a id="alertObserver" href="#alertObserver">type alertObserver struct</a>

```
searchKey: graphqlbackend.alertObserver
tags: [struct private]
```

```Go
type alertObserver struct {
	// Inputs are used to generate alert messages based on the query.
	Inputs *run.SearchInputs

	// Update state.
	hasResults bool

	// Error state. Can be called concurrently.
	mu    sync.Mutex
	alert *searchAlert
	err   error
}
```

#### <a id="alertObserver.Done" href="#alertObserver.Done">func (o *alertObserver) Done(stats *streaming.Stats) (*searchAlert, error)</a>

```
searchKey: graphqlbackend.alertObserver.Done
tags: [method private]
```

```Go
func (o *alertObserver) Done(stats *streaming.Stats) (*searchAlert, error)
```

Done returns the highest priority alert and a multierror.Error containing all errors that could not be converted to alerts. 

#### <a id="alertObserver.Error" href="#alertObserver.Error">func (o *alertObserver) Error(ctx context.Context, err error)</a>

```
searchKey: graphqlbackend.alertObserver.Error
tags: [method private]
```

```Go
func (o *alertObserver) Error(ctx context.Context, err error)
```

#### <a id="alertObserver.update" href="#alertObserver.update">func (o *alertObserver) update(alert *searchAlert)</a>

```
searchKey: graphqlbackend.alertObserver.update
tags: [method private]
```

```Go
func (o *alertObserver) update(alert *searchAlert)
```

update to alert if it is more important than our current alert. 

### <a id="alertSearchImplementer" href="#alertSearchImplementer">type alertSearchImplementer struct</a>

```
searchKey: graphqlbackend.alertSearchImplementer
tags: [struct private]
```

```Go
type alertSearchImplementer struct {
	db    dbutil.DB
	alert searchAlert
}
```

alertSearchImplementer is a light wrapper type around an alert that implements SearchImplementer. This helps avoid needing to have a db on the searchAlert type 

#### <a id="alertSearchImplementer.Inputs" href="#alertSearchImplementer.Inputs">func (alertSearchImplementer) Inputs() run.SearchInputs</a>

```
searchKey: graphqlbackend.alertSearchImplementer.Inputs
tags: [method private]
```

```Go
func (alertSearchImplementer) Inputs() run.SearchInputs
```

#### <a id="alertSearchImplementer.Results" href="#alertSearchImplementer.Results">func (a alertSearchImplementer) Results(context.Context) (*SearchResultsResolver, error)</a>

```
searchKey: graphqlbackend.alertSearchImplementer.Results
tags: [method private]
```

```Go
func (a alertSearchImplementer) Results(context.Context) (*SearchResultsResolver, error)
```

#### <a id="alertSearchImplementer.Stats" href="#alertSearchImplementer.Stats">func (alertSearchImplementer) Stats(context.Context) (*searchResultsStats, error)</a>

```
searchKey: graphqlbackend.alertSearchImplementer.Stats
tags: [method private]
```

```Go
func (alertSearchImplementer) Stats(context.Context) (*searchResultsStats, error)
```

#### <a id="alertSearchImplementer.Suggestions" href="#alertSearchImplementer.Suggestions">func (alertSearchImplementer) Suggestions(context.Context, *searchSuggestionsArgs) ([]SearchSuggestionResolver, error)</a>

```
searchKey: graphqlbackend.alertSearchImplementer.Suggestions
tags: [method private]
```

```Go
func (alertSearchImplementer) Suggestions(context.Context, *searchSuggestionsArgs) ([]SearchSuggestionResolver, error)
```

### <a id="authProviderConnectionResolver" href="#authProviderConnectionResolver">type authProviderConnectionResolver struct</a>

```
searchKey: graphqlbackend.authProviderConnectionResolver
tags: [struct private]
```

```Go
type authProviderConnectionResolver struct {
	authProviders []providers.Provider
}
```

authProviderConnectionResolver resolves a list of auth providers. 

#### <a id="authProviderConnectionResolver.Nodes" href="#authProviderConnectionResolver.Nodes">func (r *authProviderConnectionResolver) Nodes(ctx context.Context) ([]*authProviderResolver, error)</a>

```
searchKey: graphqlbackend.authProviderConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *authProviderConnectionResolver) Nodes(ctx context.Context) ([]*authProviderResolver, error)
```

#### <a id="authProviderConnectionResolver.PageInfo" href="#authProviderConnectionResolver.PageInfo">func (r *authProviderConnectionResolver) PageInfo() *graphqlutil.PageInfo</a>

```
searchKey: graphqlbackend.authProviderConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *authProviderConnectionResolver) PageInfo() *graphqlutil.PageInfo
```

#### <a id="authProviderConnectionResolver.TotalCount" href="#authProviderConnectionResolver.TotalCount">func (r *authProviderConnectionResolver) TotalCount() int32</a>

```
searchKey: graphqlbackend.authProviderConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *authProviderConnectionResolver) TotalCount() int32
```

### <a id="authProviderResolver" href="#authProviderResolver">type authProviderResolver struct</a>

```
searchKey: graphqlbackend.authProviderResolver
tags: [struct private]
```

```Go
type authProviderResolver struct {
	authProvider providers.Provider

	info *providers.Info // == authProvider.CachedInfo()
}
```

authProviderResolver resolves an auth provider. 

#### <a id="authProviderResolver.AuthenticationURL" href="#authProviderResolver.AuthenticationURL">func (r *authProviderResolver) AuthenticationURL() *string</a>

```
searchKey: graphqlbackend.authProviderResolver.AuthenticationURL
tags: [method private]
```

```Go
func (r *authProviderResolver) AuthenticationURL() *string
```

#### <a id="authProviderResolver.ClientID" href="#authProviderResolver.ClientID">func (r *authProviderResolver) ClientID() string</a>

```
searchKey: graphqlbackend.authProviderResolver.ClientID
tags: [method private]
```

```Go
func (r *authProviderResolver) ClientID() string
```

#### <a id="authProviderResolver.DisplayName" href="#authProviderResolver.DisplayName">func (r *authProviderResolver) DisplayName() string</a>

```
searchKey: graphqlbackend.authProviderResolver.DisplayName
tags: [method private]
```

```Go
func (r *authProviderResolver) DisplayName() string
```

#### <a id="authProviderResolver.IsBuiltin" href="#authProviderResolver.IsBuiltin">func (r *authProviderResolver) IsBuiltin() bool</a>

```
searchKey: graphqlbackend.authProviderResolver.IsBuiltin
tags: [method private]
```

```Go
func (r *authProviderResolver) IsBuiltin() bool
```

#### <a id="authProviderResolver.ServiceID" href="#authProviderResolver.ServiceID">func (r *authProviderResolver) ServiceID() string</a>

```
searchKey: graphqlbackend.authProviderResolver.ServiceID
tags: [method private]
```

```Go
func (r *authProviderResolver) ServiceID() string
```

#### <a id="authProviderResolver.ServiceType" href="#authProviderResolver.ServiceType">func (r *authProviderResolver) ServiceType() string</a>

```
searchKey: graphqlbackend.authProviderResolver.ServiceType
tags: [method private]
```

```Go
func (r *authProviderResolver) ServiceType() string
```

### <a id="badRequestError" href="#badRequestError">type badRequestError struct</a>

```
searchKey: graphqlbackend.badRequestError
tags: [struct private]
```

```Go
type badRequestError struct {
	err error
}
```

#### <a id="badRequestError.BadRequest" href="#badRequestError.BadRequest">func (e *badRequestError) BadRequest() bool</a>

```
searchKey: graphqlbackend.badRequestError.BadRequest
tags: [method private]
```

```Go
func (e *badRequestError) BadRequest() bool
```

#### <a id="badRequestError.Cause" href="#badRequestError.Cause">func (e *badRequestError) Cause() error</a>

```
searchKey: graphqlbackend.badRequestError.Cause
tags: [method private]
```

```Go
func (e *badRequestError) Cause() error
```

#### <a id="badRequestError.Error" href="#badRequestError.Error">func (e *badRequestError) Error() string</a>

```
searchKey: graphqlbackend.badRequestError.Error
tags: [method private]
```

```Go
func (e *badRequestError) Error() string
```

### <a id="baseSuggestionResolver" href="#baseSuggestionResolver">type baseSuggestionResolver struct{}</a>

```
searchKey: graphqlbackend.baseSuggestionResolver
tags: [struct private]
```

```Go
type baseSuggestionResolver struct{}
```

baseSuggestionResolver implements all the To* methods, returning false for all of them. Its intent is to be embedded into other suggestion resolvers to simplify implementing searchSuggestionResolver. 

#### <a id="baseSuggestionResolver.ToFile" href="#baseSuggestionResolver.ToFile">func (baseSuggestionResolver) ToFile() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.baseSuggestionResolver.ToFile
tags: [method private]
```

```Go
func (baseSuggestionResolver) ToFile() (*GitTreeEntryResolver, bool)
```

#### <a id="baseSuggestionResolver.ToGitBlob" href="#baseSuggestionResolver.ToGitBlob">func (baseSuggestionResolver) ToGitBlob() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.baseSuggestionResolver.ToGitBlob
tags: [method private]
```

```Go
func (baseSuggestionResolver) ToGitBlob() (*GitTreeEntryResolver, bool)
```

#### <a id="baseSuggestionResolver.ToGitTree" href="#baseSuggestionResolver.ToGitTree">func (baseSuggestionResolver) ToGitTree() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.baseSuggestionResolver.ToGitTree
tags: [method private]
```

```Go
func (baseSuggestionResolver) ToGitTree() (*GitTreeEntryResolver, bool)
```

#### <a id="baseSuggestionResolver.ToLanguage" href="#baseSuggestionResolver.ToLanguage">func (baseSuggestionResolver) ToLanguage() (*languageResolver, bool)</a>

```
searchKey: graphqlbackend.baseSuggestionResolver.ToLanguage
tags: [method private]
```

```Go
func (baseSuggestionResolver) ToLanguage() (*languageResolver, bool)
```

#### <a id="baseSuggestionResolver.ToRepository" href="#baseSuggestionResolver.ToRepository">func (baseSuggestionResolver) ToRepository() (*RepositoryResolver, bool)</a>

```
searchKey: graphqlbackend.baseSuggestionResolver.ToRepository
tags: [method private]
```

```Go
func (baseSuggestionResolver) ToRepository() (*RepositoryResolver, bool)
```

#### <a id="baseSuggestionResolver.ToSearchContext" href="#baseSuggestionResolver.ToSearchContext">func (baseSuggestionResolver) ToSearchContext() (*searchContextResolver, bool)</a>

```
searchKey: graphqlbackend.baseSuggestionResolver.ToSearchContext
tags: [method private]
```

```Go
func (baseSuggestionResolver) ToSearchContext() (*searchContextResolver, bool)
```

#### <a id="baseSuggestionResolver.ToSymbol" href="#baseSuggestionResolver.ToSymbol">func (baseSuggestionResolver) ToSymbol() (*symbolResolver, bool)</a>

```
searchKey: graphqlbackend.baseSuggestionResolver.ToSymbol
tags: [method private]
```

```Go
func (baseSuggestionResolver) ToSymbol() (*symbolResolver, bool)
```

### <a id="behindAheadCountsResolver" href="#behindAheadCountsResolver">type behindAheadCountsResolver struct</a>

```
searchKey: graphqlbackend.behindAheadCountsResolver
tags: [struct private]
```

```Go
type behindAheadCountsResolver struct{ behind, ahead int32 }
```

#### <a id="behindAheadCountsResolver.Ahead" href="#behindAheadCountsResolver.Ahead">func (r *behindAheadCountsResolver) Ahead() int32</a>

```
searchKey: graphqlbackend.behindAheadCountsResolver.Ahead
tags: [method private]
```

```Go
func (r *behindAheadCountsResolver) Ahead() int32
```

#### <a id="behindAheadCountsResolver.Behind" href="#behindAheadCountsResolver.Behind">func (r *behindAheadCountsResolver) Behind() int32</a>

```
searchKey: graphqlbackend.behindAheadCountsResolver.Behind
tags: [method private]
```

```Go
func (r *behindAheadCountsResolver) Behind() int32
```

### <a id="byDirectory" href="#byDirectory">type byDirectory []fs.FileInfo</a>

```
searchKey: graphqlbackend.byDirectory
tags: [array interface private]
```

```Go
type byDirectory []fs.FileInfo
```

#### <a id="byDirectory.Len" href="#byDirectory.Len">func (s byDirectory) Len() int</a>

```
searchKey: graphqlbackend.byDirectory.Len
tags: [method private]
```

```Go
func (s byDirectory) Len() int
```

#### <a id="byDirectory.Less" href="#byDirectory.Less">func (s byDirectory) Less(i, j int) bool</a>

```
searchKey: graphqlbackend.byDirectory.Less
tags: [method private]
```

```Go
func (s byDirectory) Less(i, j int) bool
```

#### <a id="byDirectory.Swap" href="#byDirectory.Swap">func (s byDirectory) Swap(i, j int)</a>

```
searchKey: graphqlbackend.byDirectory.Swap
tags: [method private]
```

```Go
func (s byDirectory) Swap(i, j int)
```

### <a id="checkMirrorRepositoryConnectionResult" href="#checkMirrorRepositoryConnectionResult">type checkMirrorRepositoryConnectionResult struct</a>

```
searchKey: graphqlbackend.checkMirrorRepositoryConnectionResult
tags: [struct private]
```

```Go
type checkMirrorRepositoryConnectionResult struct {
	errorMessage string
}
```

#### <a id="checkMirrorRepositoryConnectionResult.Error" href="#checkMirrorRepositoryConnectionResult.Error">func (r *checkMirrorRepositoryConnectionResult) Error() *string</a>

```
searchKey: graphqlbackend.checkMirrorRepositoryConnectionResult.Error
tags: [method private]
```

```Go
func (r *checkMirrorRepositoryConnectionResult) Error() *string
```

### <a id="clientConfigurationResolver" href="#clientConfigurationResolver">type clientConfigurationResolver struct</a>

```
searchKey: graphqlbackend.clientConfigurationResolver
tags: [struct private]
```

```Go
type clientConfigurationResolver struct {
	contentScriptUrls []string
	parentSourcegraph *parentSourcegraphResolver
}
```

#### <a id="clientConfigurationResolver.ContentScriptURLs" href="#clientConfigurationResolver.ContentScriptURLs">func (r *clientConfigurationResolver) ContentScriptURLs() []string</a>

```
searchKey: graphqlbackend.clientConfigurationResolver.ContentScriptURLs
tags: [method private]
```

```Go
func (r *clientConfigurationResolver) ContentScriptURLs() []string
```

#### <a id="clientConfigurationResolver.ParentSourcegraph" href="#clientConfigurationResolver.ParentSourcegraph">func (r *clientConfigurationResolver) ParentSourcegraph() *parentSourcegraphResolver</a>

```
searchKey: graphqlbackend.clientConfigurationResolver.ParentSourcegraph
tags: [method private]
```

```Go
func (r *clientConfigurationResolver) ParentSourcegraph() *parentSourcegraphResolver
```

### <a id="codeHostRepositoryResolver" href="#codeHostRepositoryResolver">type codeHostRepositoryResolver struct</a>

```
searchKey: graphqlbackend.codeHostRepositoryResolver
tags: [struct private]
```

```Go
type codeHostRepositoryResolver struct {
	repo     *types.CodeHostRepository
	codeHost *types.ExternalService
	db       dbutil.DB
}
```

#### <a id="codeHostRepositoryResolver.CodeHost" href="#codeHostRepositoryResolver.CodeHost">func (r *codeHostRepositoryResolver) CodeHost(ctx context.Context) *externalServiceResolver</a>

```
searchKey: graphqlbackend.codeHostRepositoryResolver.CodeHost
tags: [method private]
```

```Go
func (r *codeHostRepositoryResolver) CodeHost(ctx context.Context) *externalServiceResolver
```

#### <a id="codeHostRepositoryResolver.Name" href="#codeHostRepositoryResolver.Name">func (r *codeHostRepositoryResolver) Name() string</a>

```
searchKey: graphqlbackend.codeHostRepositoryResolver.Name
tags: [method private]
```

```Go
func (r *codeHostRepositoryResolver) Name() string
```

#### <a id="codeHostRepositoryResolver.Private" href="#codeHostRepositoryResolver.Private">func (r *codeHostRepositoryResolver) Private() bool</a>

```
searchKey: graphqlbackend.codeHostRepositoryResolver.Private
tags: [method private]
```

```Go
func (r *codeHostRepositoryResolver) Private() bool
```

### <a id="computedExternalServiceConnectionResolver" href="#computedExternalServiceConnectionResolver">type computedExternalServiceConnectionResolver struct</a>

```
searchKey: graphqlbackend.computedExternalServiceConnectionResolver
tags: [struct private]
```

```Go
type computedExternalServiceConnectionResolver struct {
	args             graphqlutil.ConnectionArgs
	externalServices []*types.ExternalService
	db               dbutil.DB
}
```

#### <a id="computedExternalServiceConnectionResolver.Nodes" href="#computedExternalServiceConnectionResolver.Nodes">func (r *computedExternalServiceConnectionResolver) Nodes(ctx context.Context) []*externalServiceResolver</a>

```
searchKey: graphqlbackend.computedExternalServiceConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *computedExternalServiceConnectionResolver) Nodes(ctx context.Context) []*externalServiceResolver
```

#### <a id="computedExternalServiceConnectionResolver.PageInfo" href="#computedExternalServiceConnectionResolver.PageInfo">func (r *computedExternalServiceConnectionResolver) PageInfo(ctx context.Context) *graphqlutil.PageInfo</a>

```
searchKey: graphqlbackend.computedExternalServiceConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *computedExternalServiceConnectionResolver) PageInfo(ctx context.Context) *graphqlutil.PageInfo
```

#### <a id="computedExternalServiceConnectionResolver.TotalCount" href="#computedExternalServiceConnectionResolver.TotalCount">func (r *computedExternalServiceConnectionResolver) TotalCount(ctx context.Context) int32</a>

```
searchKey: graphqlbackend.computedExternalServiceConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *computedExternalServiceConnectionResolver) TotalCount(ctx context.Context) int32
```

### <a id="configurationResolver" href="#configurationResolver">type configurationResolver struct</a>

```
searchKey: graphqlbackend.configurationResolver
tags: [struct private]
```

```Go
type configurationResolver struct {
	contents string
	messages []string // error and warning messages
}
```

Deprecated: The GraphQL type Configuration is deprecated. 

#### <a id="viewerFinalSettings" href="#viewerFinalSettings">func viewerFinalSettings(ctx context.Context, db dbutil.DB) (*configurationResolver, error)</a>

```
searchKey: graphqlbackend.viewerFinalSettings
tags: [function private]
```

```Go
func viewerFinalSettings(ctx context.Context, db dbutil.DB) (*configurationResolver, error)
```

viewerFinalSettings returns the final (merged) settings for the viewer. 

#### <a id="configurationResolver.Contents" href="#configurationResolver.Contents">func (r *configurationResolver) Contents() JSONCString</a>

```
searchKey: graphqlbackend.configurationResolver.Contents
tags: [method private]
```

```Go
func (r *configurationResolver) Contents() JSONCString
```

#### <a id="configurationResolver.Messages" href="#configurationResolver.Messages">func (r *configurationResolver) Messages() []string</a>

```
searchKey: graphqlbackend.configurationResolver.Messages
tags: [method private]
```

```Go
func (r *configurationResolver) Messages() []string
```

### <a id="createAccessTokenInput" href="#createAccessTokenInput">type createAccessTokenInput struct</a>

```
searchKey: graphqlbackend.createAccessTokenInput
tags: [struct private]
```

```Go
type createAccessTokenInput struct {
	User   graphql.ID
	Scopes []string
	Note   string
}
```

### <a id="createAccessTokenResult" href="#createAccessTokenResult">type createAccessTokenResult struct</a>

```
searchKey: graphqlbackend.createAccessTokenResult
tags: [struct private]
```

```Go
type createAccessTokenResult struct {
	id    graphql.ID
	token string
}
```

#### <a id="createAccessTokenResult.ID" href="#createAccessTokenResult.ID">func (r *createAccessTokenResult) ID() graphql.ID</a>

```
searchKey: graphqlbackend.createAccessTokenResult.ID
tags: [method private]
```

```Go
func (r *createAccessTokenResult) ID() graphql.ID
```

#### <a id="createAccessTokenResult.Token" href="#createAccessTokenResult.Token">func (r *createAccessTokenResult) Token() string</a>

```
searchKey: graphqlbackend.createAccessTokenResult.Token
tags: [method private]
```

```Go
func (r *createAccessTokenResult) Token() string
```

### <a id="createSearchContextArgs" href="#createSearchContextArgs">type createSearchContextArgs struct</a>

```
searchKey: graphqlbackend.createSearchContextArgs
tags: [struct private]
```

```Go
type createSearchContextArgs struct {
	SearchContext searchContextInputArgs
	Repositories  []searchContextRepositoryRevisionsInputArgs
}
```

### <a id="createUserResult" href="#createUserResult">type createUserResult struct</a>

```
searchKey: graphqlbackend.createUserResult
tags: [struct private]
```

```Go
type createUserResult struct {
	db   dbutil.DB
	user *types.User
}
```

createUserResult is the result of Mutation.createUser. 

🚨 SECURITY: Only site admins should be able to instantiate this value. 

#### <a id="createUserResult.ResetPasswordURL" href="#createUserResult.ResetPasswordURL">func (r *createUserResult) ResetPasswordURL(ctx context.Context) (*string, error)</a>

```
searchKey: graphqlbackend.createUserResult.ResetPasswordURL
tags: [method private]
```

```Go
func (r *createUserResult) ResetPasswordURL(ctx context.Context) (*string, error)
```

#### <a id="createUserResult.User" href="#createUserResult.User">func (r *createUserResult) User() *UserResolver</a>

```
searchKey: graphqlbackend.createUserResult.User
tags: [method private]
```

```Go
func (r *createUserResult) User() *UserResolver
```

### <a id="defaultSettingsResolver" href="#defaultSettingsResolver">type defaultSettingsResolver struct</a>

```
searchKey: graphqlbackend.defaultSettingsResolver
tags: [struct private]
```

```Go
type defaultSettingsResolver struct {
	db    dbutil.DB
	gqlID string
}
```

#### <a id="defaultSettingsResolver.ConfigurationCascade" href="#defaultSettingsResolver.ConfigurationCascade">func (r *defaultSettingsResolver) ConfigurationCascade() *settingsCascade</a>

```
searchKey: graphqlbackend.defaultSettingsResolver.ConfigurationCascade
tags: [method private]
```

```Go
func (r *defaultSettingsResolver) ConfigurationCascade() *settingsCascade
```

#### <a id="defaultSettingsResolver.ID" href="#defaultSettingsResolver.ID">func (r *defaultSettingsResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.defaultSettingsResolver.ID
tags: [method private]
```

```Go
func (r *defaultSettingsResolver) ID() graphql.ID
```

#### <a id="defaultSettingsResolver.LatestSettings" href="#defaultSettingsResolver.LatestSettings">func (r *defaultSettingsResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)</a>

```
searchKey: graphqlbackend.defaultSettingsResolver.LatestSettings
tags: [method private]
```

```Go
func (r *defaultSettingsResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)
```

#### <a id="defaultSettingsResolver.SettingsCascade" href="#defaultSettingsResolver.SettingsCascade">func (r *defaultSettingsResolver) SettingsCascade() *settingsCascade</a>

```
searchKey: graphqlbackend.defaultSettingsResolver.SettingsCascade
tags: [method private]
```

```Go
func (r *defaultSettingsResolver) SettingsCascade() *settingsCascade
```

#### <a id="defaultSettingsResolver.SettingsURL" href="#defaultSettingsResolver.SettingsURL">func (r *defaultSettingsResolver) SettingsURL() *string</a>

```
searchKey: graphqlbackend.defaultSettingsResolver.SettingsURL
tags: [method private]
```

```Go
func (r *defaultSettingsResolver) SettingsURL() *string
```

#### <a id="defaultSettingsResolver.ViewerCanAdminister" href="#defaultSettingsResolver.ViewerCanAdminister">func (r *defaultSettingsResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.defaultSettingsResolver.ViewerCanAdminister
tags: [method private]
```

```Go
func (r *defaultSettingsResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

### <a id="deleteAccessTokenInput" href="#deleteAccessTokenInput">type deleteAccessTokenInput struct</a>

```
searchKey: graphqlbackend.deleteAccessTokenInput
tags: [struct private]
```

```Go
type deleteAccessTokenInput struct {
	ByID    *graphql.ID
	ByToken *string
}
```

### <a id="deleteExternalServiceArgs" href="#deleteExternalServiceArgs">type deleteExternalServiceArgs struct</a>

```
searchKey: graphqlbackend.deleteExternalServiceArgs
tags: [struct private]
```

```Go
type deleteExternalServiceArgs struct {
	ExternalService graphql.ID
}
```

### <a id="dummyFileHighlighter" href="#dummyFileHighlighter">type dummyFileHighlighter struct</a>

```
searchKey: graphqlbackend.dummyFileHighlighter
tags: [struct private]
```

```Go
type dummyFileHighlighter struct {
	highlightedBase, highlightedHead []template.HTML
}
```

#### <a id="dummyFileHighlighter.Highlight" href="#dummyFileHighlighter.Highlight">func (r *dummyFileHighlighter) Highlight(ctx context.Context, args *HighlightArgs) ([]template.HTML, []template.HTML, bool, error)</a>

```
searchKey: graphqlbackend.dummyFileHighlighter.Highlight
tags: [method private]
```

```Go
func (r *dummyFileHighlighter) Highlight(ctx context.Context, args *HighlightArgs) ([]template.HTML, []template.HTML, bool, error)
```

### <a id="dummyFileResolver" href="#dummyFileResolver">type dummyFileResolver struct</a>

```
searchKey: graphqlbackend.dummyFileResolver
tags: [struct private]
```

```Go
type dummyFileResolver struct {
	path, name string

	richHTML     string
	url          string
	canonicalURL string

	content func(context.Context) (string, error)
}
```

#### <a id="dummyFileResolver.Binary" href="#dummyFileResolver.Binary">func (d *dummyFileResolver) Binary(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.dummyFileResolver.Binary
tags: [method private]
```

```Go
func (d *dummyFileResolver) Binary(ctx context.Context) (bool, error)
```

#### <a id="dummyFileResolver.ByteSize" href="#dummyFileResolver.ByteSize">func (d *dummyFileResolver) ByteSize(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.dummyFileResolver.ByteSize
tags: [method private]
```

```Go
func (d *dummyFileResolver) ByteSize(ctx context.Context) (int32, error)
```

#### <a id="dummyFileResolver.CanonicalURL" href="#dummyFileResolver.CanonicalURL">func (d *dummyFileResolver) CanonicalURL() string</a>

```
searchKey: graphqlbackend.dummyFileResolver.CanonicalURL
tags: [method private]
```

```Go
func (d *dummyFileResolver) CanonicalURL() string
```

#### <a id="dummyFileResolver.Content" href="#dummyFileResolver.Content">func (d *dummyFileResolver) Content(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.dummyFileResolver.Content
tags: [method private]
```

```Go
func (d *dummyFileResolver) Content(ctx context.Context) (string, error)
```

#### <a id="dummyFileResolver.ExternalURLs" href="#dummyFileResolver.ExternalURLs">func (d *dummyFileResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)</a>

```
searchKey: graphqlbackend.dummyFileResolver.ExternalURLs
tags: [method private]
```

```Go
func (d *dummyFileResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)
```

#### <a id="dummyFileResolver.Highlight" href="#dummyFileResolver.Highlight">func (d *dummyFileResolver) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)</a>

```
searchKey: graphqlbackend.dummyFileResolver.Highlight
tags: [method private]
```

```Go
func (d *dummyFileResolver) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)
```

#### <a id="dummyFileResolver.IsDirectory" href="#dummyFileResolver.IsDirectory">func (d *dummyFileResolver) IsDirectory() bool</a>

```
searchKey: graphqlbackend.dummyFileResolver.IsDirectory
tags: [method private]
```

```Go
func (d *dummyFileResolver) IsDirectory() bool
```

#### <a id="dummyFileResolver.Name" href="#dummyFileResolver.Name">func (d *dummyFileResolver) Name() string</a>

```
searchKey: graphqlbackend.dummyFileResolver.Name
tags: [method private]
```

```Go
func (d *dummyFileResolver) Name() string
```

#### <a id="dummyFileResolver.Path" href="#dummyFileResolver.Path">func (d *dummyFileResolver) Path() string</a>

```
searchKey: graphqlbackend.dummyFileResolver.Path
tags: [method private]
```

```Go
func (d *dummyFileResolver) Path() string
```

#### <a id="dummyFileResolver.RichHTML" href="#dummyFileResolver.RichHTML">func (d *dummyFileResolver) RichHTML(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.dummyFileResolver.RichHTML
tags: [method private]
```

```Go
func (d *dummyFileResolver) RichHTML(ctx context.Context) (string, error)
```

#### <a id="dummyFileResolver.ToGitBlob" href="#dummyFileResolver.ToGitBlob">func (d *dummyFileResolver) ToGitBlob() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.dummyFileResolver.ToGitBlob
tags: [method private]
```

```Go
func (d *dummyFileResolver) ToGitBlob() (*GitTreeEntryResolver, bool)
```

#### <a id="dummyFileResolver.ToVirtualFile" href="#dummyFileResolver.ToVirtualFile">func (d *dummyFileResolver) ToVirtualFile() (*virtualFileResolver, bool)</a>

```
searchKey: graphqlbackend.dummyFileResolver.ToVirtualFile
tags: [method private]
```

```Go
func (d *dummyFileResolver) ToVirtualFile() (*virtualFileResolver, bool)
```

#### <a id="dummyFileResolver.URL" href="#dummyFileResolver.URL">func (d *dummyFileResolver) URL(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.dummyFileResolver.URL
tags: [method private]
```

```Go
func (d *dummyFileResolver) URL(ctx context.Context) (string, error)
```

### <a id="errNoResolvedRepos" href="#errNoResolvedRepos">type errNoResolvedRepos struct</a>

```
searchKey: graphqlbackend.errNoResolvedRepos
tags: [struct private]
```

```Go
type errNoResolvedRepos struct {
	PrometheusType  string
	Title           string
	Description     string
	ProposedQueries []*searchQueryDescription
}
```

#### <a id="errNoResolvedRepos.Error" href="#errNoResolvedRepos.Error">func (e *errNoResolvedRepos) Error() string</a>

```
searchKey: graphqlbackend.errNoResolvedRepos.Error
tags: [method private]
```

```Go
func (e *errNoResolvedRepos) Error() string
```

### <a id="errOverRepoLimit" href="#errOverRepoLimit">type errOverRepoLimit struct</a>

```
searchKey: graphqlbackend.errOverRepoLimit
tags: [struct private]
```

```Go
type errOverRepoLimit struct {
	ProposedQueries []*searchQueryDescription
	Description     string
}
```

#### <a id="errOverRepoLimit.Error" href="#errOverRepoLimit.Error">func (e *errOverRepoLimit) Error() string</a>

```
searchKey: graphqlbackend.errOverRepoLimit.Error
tags: [method private]
```

```Go
func (e *errOverRepoLimit) Error() string
```

### <a id="executor" href="#executor">type executor func(batch []*github.com/sourcegraph/sourcegraph/internal/search.RepositoryRevisions) ([]github.com/sourcegraph/sourcegraph/internal/search/result.Match, *github.com/sourcegraph/sourcegraph/internal/search/streaming.Stats, error)</a>

```
searchKey: graphqlbackend.executor
tags: [function private]
```

```Go
type executor func(batch []*search.RepositoryRevisions) ([]result.Match, *streaming.Stats, error)
```

executor is a function which searches a batch of repositories. 

A non-nil Stats must always be returned, even if an error is returned. 

### <a id="externalAccountConnectionResolver" href="#externalAccountConnectionResolver">type externalAccountConnectionResolver struct</a>

```
searchKey: graphqlbackend.externalAccountConnectionResolver
tags: [struct private]
```

```Go
type externalAccountConnectionResolver struct {
	db  dbutil.DB
	opt database.ExternalAccountsListOptions

	// cache results because they are used by multiple fields
	once             sync.Once
	externalAccounts []*extsvc.Account
	err              error
}
```

externalAccountConnectionResolver resolves a list of external accounts. 

🚨 SECURITY: When instantiating an externalAccountConnectionResolver value, the caller MUST check permissions. 

#### <a id="externalAccountConnectionResolver.Nodes" href="#externalAccountConnectionResolver.Nodes">func (r *externalAccountConnectionResolver) Nodes(ctx context.Context) ([]*externalAccountResolver, error)</a>

```
searchKey: graphqlbackend.externalAccountConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *externalAccountConnectionResolver) Nodes(ctx context.Context) ([]*externalAccountResolver, error)
```

#### <a id="externalAccountConnectionResolver.PageInfo" href="#externalAccountConnectionResolver.PageInfo">func (r *externalAccountConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.externalAccountConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *externalAccountConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="externalAccountConnectionResolver.TotalCount" href="#externalAccountConnectionResolver.TotalCount">func (r *externalAccountConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.externalAccountConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *externalAccountConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="externalAccountConnectionResolver.compute" href="#externalAccountConnectionResolver.compute">func (r *externalAccountConnectionResolver) compute(ctx context.Context) ([]*extsvc.Account, error)</a>

```
searchKey: graphqlbackend.externalAccountConnectionResolver.compute
tags: [method private]
```

```Go
func (r *externalAccountConnectionResolver) compute(ctx context.Context) ([]*extsvc.Account, error)
```

### <a id="externalAccountResolver" href="#externalAccountResolver">type externalAccountResolver struct</a>

```
searchKey: graphqlbackend.externalAccountResolver
tags: [struct private]
```

```Go
type externalAccountResolver struct {
	db      dbutil.DB
	account extsvc.Account
}
```

#### <a id="externalAccountByID" href="#externalAccountByID">func externalAccountByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*externalAccountResolver, error)</a>

```
searchKey: graphqlbackend.externalAccountByID
tags: [function private]
```

```Go
func externalAccountByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*externalAccountResolver, error)
```

#### <a id="externalAccountResolver.AccountData" href="#externalAccountResolver.AccountData">func (r *externalAccountResolver) AccountData(ctx context.Context) (*JSONValue, error)</a>

```
searchKey: graphqlbackend.externalAccountResolver.AccountData
tags: [method private]
```

```Go
func (r *externalAccountResolver) AccountData(ctx context.Context) (*JSONValue, error)
```

#### <a id="externalAccountResolver.AccountID" href="#externalAccountResolver.AccountID">func (r *externalAccountResolver) AccountID() string</a>

```
searchKey: graphqlbackend.externalAccountResolver.AccountID
tags: [method private]
```

```Go
func (r *externalAccountResolver) AccountID() string
```

#### <a id="externalAccountResolver.ClientID" href="#externalAccountResolver.ClientID">func (r *externalAccountResolver) ClientID() string</a>

```
searchKey: graphqlbackend.externalAccountResolver.ClientID
tags: [method private]
```

```Go
func (r *externalAccountResolver) ClientID() string
```

#### <a id="externalAccountResolver.CreatedAt" href="#externalAccountResolver.CreatedAt">func (r *externalAccountResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.externalAccountResolver.CreatedAt
tags: [method private]
```

```Go
func (r *externalAccountResolver) CreatedAt() DateTime
```

#### <a id="externalAccountResolver.ID" href="#externalAccountResolver.ID">func (r *externalAccountResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.externalAccountResolver.ID
tags: [method private]
```

```Go
func (r *externalAccountResolver) ID() graphql.ID
```

#### <a id="externalAccountResolver.RefreshURL" href="#externalAccountResolver.RefreshURL">func (r *externalAccountResolver) RefreshURL() *string</a>

```
searchKey: graphqlbackend.externalAccountResolver.RefreshURL
tags: [method private]
```

```Go
func (r *externalAccountResolver) RefreshURL() *string
```

#### <a id="externalAccountResolver.ServiceID" href="#externalAccountResolver.ServiceID">func (r *externalAccountResolver) ServiceID() string</a>

```
searchKey: graphqlbackend.externalAccountResolver.ServiceID
tags: [method private]
```

```Go
func (r *externalAccountResolver) ServiceID() string
```

#### <a id="externalAccountResolver.ServiceType" href="#externalAccountResolver.ServiceType">func (r *externalAccountResolver) ServiceType() string</a>

```
searchKey: graphqlbackend.externalAccountResolver.ServiceType
tags: [method private]
```

```Go
func (r *externalAccountResolver) ServiceType() string
```

#### <a id="externalAccountResolver.UpdatedAt" href="#externalAccountResolver.UpdatedAt">func (r *externalAccountResolver) UpdatedAt() DateTime</a>

```
searchKey: graphqlbackend.externalAccountResolver.UpdatedAt
tags: [method private]
```

```Go
func (r *externalAccountResolver) UpdatedAt() DateTime
```

#### <a id="externalAccountResolver.User" href="#externalAccountResolver.User">func (r *externalAccountResolver) User(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.externalAccountResolver.User
tags: [method private]
```

```Go
func (r *externalAccountResolver) User(ctx context.Context) (*UserResolver, error)
```

### <a id="externalRepositoryResolver" href="#externalRepositoryResolver">type externalRepositoryResolver struct</a>

```
searchKey: graphqlbackend.externalRepositoryResolver
tags: [struct private]
```

```Go
type externalRepositoryResolver struct {
	repository *RepositoryResolver
}
```

#### <a id="externalRepositoryResolver.ID" href="#externalRepositoryResolver.ID">func (r *externalRepositoryResolver) ID(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.externalRepositoryResolver.ID
tags: [method private]
```

```Go
func (r *externalRepositoryResolver) ID(ctx context.Context) (string, error)
```

#### <a id="externalRepositoryResolver.ServiceID" href="#externalRepositoryResolver.ServiceID">func (r *externalRepositoryResolver) ServiceID(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.externalRepositoryResolver.ServiceID
tags: [method private]
```

```Go
func (r *externalRepositoryResolver) ServiceID(ctx context.Context) (string, error)
```

#### <a id="externalRepositoryResolver.ServiceType" href="#externalRepositoryResolver.ServiceType">func (r *externalRepositoryResolver) ServiceType(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.externalRepositoryResolver.ServiceType
tags: [method private]
```

```Go
func (r *externalRepositoryResolver) ServiceType(ctx context.Context) (string, error)
```

### <a id="externalServiceConnectionResolver" href="#externalServiceConnectionResolver">type externalServiceConnectionResolver struct</a>

```
searchKey: graphqlbackend.externalServiceConnectionResolver
tags: [struct private]
```

```Go
type externalServiceConnectionResolver struct {
	opt database.ExternalServicesListOptions

	// cache results because they are used by multiple fields
	once             sync.Once
	externalServices []*types.ExternalService
	err              error
	db               dbutil.DB
}
```

#### <a id="externalServiceConnectionResolver.Nodes" href="#externalServiceConnectionResolver.Nodes">func (r *externalServiceConnectionResolver) Nodes(ctx context.Context) ([]*externalServiceResolver, error)</a>

```
searchKey: graphqlbackend.externalServiceConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *externalServiceConnectionResolver) Nodes(ctx context.Context) ([]*externalServiceResolver, error)
```

#### <a id="externalServiceConnectionResolver.PageInfo" href="#externalServiceConnectionResolver.PageInfo">func (r *externalServiceConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.externalServiceConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *externalServiceConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="externalServiceConnectionResolver.TotalCount" href="#externalServiceConnectionResolver.TotalCount">func (r *externalServiceConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.externalServiceConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *externalServiceConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="externalServiceConnectionResolver.compute" href="#externalServiceConnectionResolver.compute">func (r *externalServiceConnectionResolver) compute(ctx context.Context) ([]*types.ExternalService, error)</a>

```
searchKey: graphqlbackend.externalServiceConnectionResolver.compute
tags: [method private]
```

```Go
func (r *externalServiceConnectionResolver) compute(ctx context.Context) ([]*types.ExternalService, error)
```

### <a id="externalServiceResolver" href="#externalServiceResolver">type externalServiceResolver struct</a>

```
searchKey: graphqlbackend.externalServiceResolver
tags: [struct private]
```

```Go
type externalServiceResolver struct {
	db              dbutil.DB
	externalService *types.ExternalService
	warning         string

	webhookURLOnce sync.Once
	webhookURL     string
	webhookErr     error
}
```

#### <a id="externalServiceByID" href="#externalServiceByID">func externalServiceByID(ctx context.Context, db dbutil.DB, gqlID graphql.ID) (*externalServiceResolver, error)</a>

```
searchKey: graphqlbackend.externalServiceByID
tags: [function private]
```

```Go
func externalServiceByID(ctx context.Context, db dbutil.DB, gqlID graphql.ID) (*externalServiceResolver, error)
```

#### <a id="externalServiceResolver.Config" href="#externalServiceResolver.Config">func (r *externalServiceResolver) Config() (JSONCString, error)</a>

```
searchKey: graphqlbackend.externalServiceResolver.Config
tags: [method private]
```

```Go
func (r *externalServiceResolver) Config() (JSONCString, error)
```

#### <a id="externalServiceResolver.CreatedAt" href="#externalServiceResolver.CreatedAt">func (r *externalServiceResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.externalServiceResolver.CreatedAt
tags: [method private]
```

```Go
func (r *externalServiceResolver) CreatedAt() DateTime
```

#### <a id="externalServiceResolver.DisplayName" href="#externalServiceResolver.DisplayName">func (r *externalServiceResolver) DisplayName() string</a>

```
searchKey: graphqlbackend.externalServiceResolver.DisplayName
tags: [method private]
```

```Go
func (r *externalServiceResolver) DisplayName() string
```

#### <a id="externalServiceResolver.GrantedScopes" href="#externalServiceResolver.GrantedScopes">func (r *externalServiceResolver) GrantedScopes(ctx context.Context) (*[]string, error)</a>

```
searchKey: graphqlbackend.externalServiceResolver.GrantedScopes
tags: [method private]
```

```Go
func (r *externalServiceResolver) GrantedScopes(ctx context.Context) (*[]string, error)
```

#### <a id="externalServiceResolver.ID" href="#externalServiceResolver.ID">func (r *externalServiceResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.externalServiceResolver.ID
tags: [method private]
```

```Go
func (r *externalServiceResolver) ID() graphql.ID
```

#### <a id="externalServiceResolver.Kind" href="#externalServiceResolver.Kind">func (r *externalServiceResolver) Kind() string</a>

```
searchKey: graphqlbackend.externalServiceResolver.Kind
tags: [method private]
```

```Go
func (r *externalServiceResolver) Kind() string
```

#### <a id="externalServiceResolver.LastSyncAt" href="#externalServiceResolver.LastSyncAt">func (r *externalServiceResolver) LastSyncAt() *DateTime</a>

```
searchKey: graphqlbackend.externalServiceResolver.LastSyncAt
tags: [method private]
```

```Go
func (r *externalServiceResolver) LastSyncAt() *DateTime
```

#### <a id="externalServiceResolver.LastSyncError" href="#externalServiceResolver.LastSyncError">func (r *externalServiceResolver) LastSyncError(ctx context.Context) (*string, error)</a>

```
searchKey: graphqlbackend.externalServiceResolver.LastSyncError
tags: [method private]
```

```Go
func (r *externalServiceResolver) LastSyncError(ctx context.Context) (*string, error)
```

#### <a id="externalServiceResolver.Namespace" href="#externalServiceResolver.Namespace">func (r *externalServiceResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)</a>

```
searchKey: graphqlbackend.externalServiceResolver.Namespace
tags: [method private]
```

```Go
func (r *externalServiceResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)
```

#### <a id="externalServiceResolver.NextSyncAt" href="#externalServiceResolver.NextSyncAt">func (r *externalServiceResolver) NextSyncAt() *DateTime</a>

```
searchKey: graphqlbackend.externalServiceResolver.NextSyncAt
tags: [method private]
```

```Go
func (r *externalServiceResolver) NextSyncAt() *DateTime
```

#### <a id="externalServiceResolver.RepoCount" href="#externalServiceResolver.RepoCount">func (r *externalServiceResolver) RepoCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.externalServiceResolver.RepoCount
tags: [method private]
```

```Go
func (r *externalServiceResolver) RepoCount(ctx context.Context) (int32, error)
```

#### <a id="externalServiceResolver.UpdatedAt" href="#externalServiceResolver.UpdatedAt">func (r *externalServiceResolver) UpdatedAt() DateTime</a>

```
searchKey: graphqlbackend.externalServiceResolver.UpdatedAt
tags: [method private]
```

```Go
func (r *externalServiceResolver) UpdatedAt() DateTime
```

#### <a id="externalServiceResolver.Warning" href="#externalServiceResolver.Warning">func (r *externalServiceResolver) Warning() *string</a>

```
searchKey: graphqlbackend.externalServiceResolver.Warning
tags: [method private]
```

```Go
func (r *externalServiceResolver) Warning() *string
```

#### <a id="externalServiceResolver.WebhookURL" href="#externalServiceResolver.WebhookURL">func (r *externalServiceResolver) WebhookURL() (*string, error)</a>

```
searchKey: graphqlbackend.externalServiceResolver.WebhookURL
tags: [method private]
```

```Go
func (r *externalServiceResolver) WebhookURL() (*string, error)
```

### <a id="fileDiffConnectionResolver" href="#fileDiffConnectionResolver">type fileDiffConnectionResolver struct</a>

```
searchKey: graphqlbackend.fileDiffConnectionResolver
tags: [struct private]
```

```Go
type fileDiffConnectionResolver struct {
	db      dbutil.DB
	base    *GitCommitResolver
	head    *GitCommitResolver
	first   *int32
	after   *string
	compute ComputeDiffFunc
	newFile NewFileFunc
}
```

#### <a id="NewFileDiffConnectionResolver" href="#NewFileDiffConnectionResolver">func NewFileDiffConnectionResolver(db dbutil.DB,...</a>

```
searchKey: graphqlbackend.NewFileDiffConnectionResolver
tags: [function]
```

```Go
func NewFileDiffConnectionResolver(
	db dbutil.DB,
	base, head *GitCommitResolver,
	args *FileDiffsConnectionArgs,
	compute ComputeDiffFunc,
	newFileFunc NewFileFunc,
) *fileDiffConnectionResolver
```

#### <a id="fileDiffConnectionResolver.DiffStat" href="#fileDiffConnectionResolver.DiffStat">func (r *fileDiffConnectionResolver) DiffStat(ctx context.Context) (*DiffStat, error)</a>

```
searchKey: graphqlbackend.fileDiffConnectionResolver.DiffStat
tags: [method private]
```

```Go
func (r *fileDiffConnectionResolver) DiffStat(ctx context.Context) (*DiffStat, error)
```

#### <a id="fileDiffConnectionResolver.Nodes" href="#fileDiffConnectionResolver.Nodes">func (r *fileDiffConnectionResolver) Nodes(ctx context.Context) ([]FileDiff, error)</a>

```
searchKey: graphqlbackend.fileDiffConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *fileDiffConnectionResolver) Nodes(ctx context.Context) ([]FileDiff, error)
```

#### <a id="fileDiffConnectionResolver.PageInfo" href="#fileDiffConnectionResolver.PageInfo">func (r *fileDiffConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.fileDiffConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *fileDiffConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="fileDiffConnectionResolver.RawDiff" href="#fileDiffConnectionResolver.RawDiff">func (r *fileDiffConnectionResolver) RawDiff(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.fileDiffConnectionResolver.RawDiff
tags: [method private]
```

```Go
func (r *fileDiffConnectionResolver) RawDiff(ctx context.Context) (string, error)
```

#### <a id="fileDiffConnectionResolver.TotalCount" href="#fileDiffConnectionResolver.TotalCount">func (r *fileDiffConnectionResolver) TotalCount(ctx context.Context) (*int32, error)</a>

```
searchKey: graphqlbackend.fileDiffConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *fileDiffConnectionResolver) TotalCount(ctx context.Context) (*int32, error)
```

### <a id="fileDiffHighlighter" href="#fileDiffHighlighter">type fileDiffHighlighter struct</a>

```
searchKey: graphqlbackend.fileDiffHighlighter
tags: [struct private]
```

```Go
type fileDiffHighlighter struct {
	oldFile          FileResolver
	newFile          FileResolver
	highlightedBase  []template.HTML
	highlightedHead  []template.HTML
	highlightOnce    sync.Once
	highlightErr     error
	highlightAborted bool
}
```

#### <a id="fileDiffHighlighter.Highlight" href="#fileDiffHighlighter.Highlight">func (r *fileDiffHighlighter) Highlight(ctx context.Context, args *HighlightArgs) ([]template.HTML, []template.HTML, bool, error)</a>

```
searchKey: graphqlbackend.fileDiffHighlighter.Highlight
tags: [method private]
```

```Go
func (r *fileDiffHighlighter) Highlight(ctx context.Context, args *HighlightArgs) ([]template.HTML, []template.HTML, bool, error)
```

### <a id="fileInfo" href="#fileInfo">type fileInfo struct</a>

```
searchKey: graphqlbackend.fileInfo
tags: [struct private]
```

```Go
type fileInfo struct {
	path  string
	size  int64
	isDir bool
}
```

#### <a id="fileInfo.IsDir" href="#fileInfo.IsDir">func (f fileInfo) IsDir() bool</a>

```
searchKey: graphqlbackend.fileInfo.IsDir
tags: [method private]
```

```Go
func (f fileInfo) IsDir() bool
```

#### <a id="fileInfo.ModTime" href="#fileInfo.ModTime">func (f fileInfo) ModTime() time.Time</a>

```
searchKey: graphqlbackend.fileInfo.ModTime
tags: [method private]
```

```Go
func (f fileInfo) ModTime() time.Time
```

#### <a id="fileInfo.Mode" href="#fileInfo.Mode">func (f fileInfo) Mode() os.FileMode</a>

```
searchKey: graphqlbackend.fileInfo.Mode
tags: [method private]
```

```Go
func (f fileInfo) Mode() os.FileMode
```

#### <a id="fileInfo.Name" href="#fileInfo.Name">func (f fileInfo) Name() string</a>

```
searchKey: graphqlbackend.fileInfo.Name
tags: [method private]
```

```Go
func (f fileInfo) Name() string
```

#### <a id="fileInfo.Size" href="#fileInfo.Size">func (f fileInfo) Size() int64</a>

```
searchKey: graphqlbackend.fileInfo.Size
tags: [method private]
```

```Go
func (f fileInfo) Size() int64
```

#### <a id="fileInfo.Sys" href="#fileInfo.Sys">func (f fileInfo) Sys() interface{}</a>

```
searchKey: graphqlbackend.fileInfo.Sys
tags: [method private]
```

```Go
func (f fileInfo) Sys() interface{}
```

### <a id="fixedLimiter" href="#fixedLimiter">type fixedLimiter struct</a>

```
searchKey: graphqlbackend.fixedLimiter
tags: [struct private]
```

```Go
type fixedLimiter struct {
	limited bool
	result  throttled.RateLimitResult
}
```

fixedLimiter is a rate limiter that always returns the same result 

#### <a id="fixedLimiter.RateLimit" href="#fixedLimiter.RateLimit">func (f *fixedLimiter) RateLimit(string, int) (bool, throttled.RateLimitResult, error)</a>

```
searchKey: graphqlbackend.fixedLimiter.RateLimit
tags: [method private]
```

```Go
func (f *fixedLimiter) RateLimit(string, int) (bool, throttled.RateLimitResult, error)
```

### <a id="gitCommitConnectionResolver" href="#gitCommitConnectionResolver">type gitCommitConnectionResolver struct</a>

```
searchKey: graphqlbackend.gitCommitConnectionResolver
tags: [struct private]
```

```Go
type gitCommitConnectionResolver struct {
	db            dbutil.DB
	revisionRange string

	first  *int32
	query  *string
	path   *string
	author *string
	after  *string

	repo *RepositoryResolver

	// cache results because it is used by multiple fields
	once    sync.Once
	commits []*git.Commit
	err     error
}
```

#### <a id="gitCommitConnectionResolver.Nodes" href="#gitCommitConnectionResolver.Nodes">func (r *gitCommitConnectionResolver) Nodes(ctx context.Context) ([]*GitCommitResolver, error)</a>

```
searchKey: graphqlbackend.gitCommitConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *gitCommitConnectionResolver) Nodes(ctx context.Context) ([]*GitCommitResolver, error)
```

#### <a id="gitCommitConnectionResolver.PageInfo" href="#gitCommitConnectionResolver.PageInfo">func (r *gitCommitConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.gitCommitConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *gitCommitConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="gitCommitConnectionResolver.TotalCount" href="#gitCommitConnectionResolver.TotalCount">func (r *gitCommitConnectionResolver) TotalCount(ctx context.Context) (*int32, error)</a>

```
searchKey: graphqlbackend.gitCommitConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *gitCommitConnectionResolver) TotalCount(ctx context.Context) (*int32, error)
```

#### <a id="gitCommitConnectionResolver.compute" href="#gitCommitConnectionResolver.compute">func (r *gitCommitConnectionResolver) compute(ctx context.Context) ([]*git.Commit, error)</a>

```
searchKey: graphqlbackend.gitCommitConnectionResolver.compute
tags: [method private]
```

```Go
func (r *gitCommitConnectionResolver) compute(ctx context.Context) ([]*git.Commit, error)
```

### <a id="gitCommitGQLID" href="#gitCommitGQLID">type gitCommitGQLID struct</a>

```
searchKey: graphqlbackend.gitCommitGQLID
tags: [struct private]
```

```Go
type gitCommitGQLID struct {
	Repository graphql.ID  `json:"r"`
	CommitID   GitObjectID `json:"c"`
}
```

gitCommitGQLID is a type used for marshaling and unmarshaling a Git commit's GraphQL ID. 

### <a id="gitObject" href="#gitObject">type gitObject struct</a>

```
searchKey: graphqlbackend.gitObject
tags: [struct private]
```

```Go
type gitObject struct {
	repo *RepositoryResolver
	oid  GitObjectID
	typ  gitObjectType
}
```

#### <a id="gitObject.AbbreviatedOID" href="#gitObject.AbbreviatedOID">func (o *gitObject) AbbreviatedOID(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.gitObject.AbbreviatedOID
tags: [method private]
```

```Go
func (o *gitObject) AbbreviatedOID(ctx context.Context) (string, error)
```

#### <a id="gitObject.Commit" href="#gitObject.Commit">func (o *gitObject) Commit(ctx context.Context) (*GitCommitResolver, error)</a>

```
searchKey: graphqlbackend.gitObject.Commit
tags: [method private]
```

```Go
func (o *gitObject) Commit(ctx context.Context) (*GitCommitResolver, error)
```

#### <a id="gitObject.OID" href="#gitObject.OID">func (o *gitObject) OID(ctx context.Context) (GitObjectID, error)</a>

```
searchKey: graphqlbackend.gitObject.OID
tags: [method private]
```

```Go
func (o *gitObject) OID(ctx context.Context) (GitObjectID, error)
```

#### <a id="gitObject.Type" href="#gitObject.Type">func (o *gitObject) Type(context.Context) (gitObjectType, error)</a>

```
searchKey: graphqlbackend.gitObject.Type
tags: [method private]
```

```Go
func (o *gitObject) Type(context.Context) (gitObjectType, error)
```

### <a id="gitObjectResolver" href="#gitObjectResolver">type gitObjectResolver struct</a>

```
searchKey: graphqlbackend.gitObjectResolver
tags: [struct private]
```

```Go
type gitObjectResolver struct {
	repo    *RepositoryResolver
	revspec string

	once sync.Once
	oid  GitObjectID
	typ  gitObjectType
	err  error
}
```

#### <a id="gitObjectResolver.AbbreviatedOID" href="#gitObjectResolver.AbbreviatedOID">func (o *gitObjectResolver) AbbreviatedOID(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.gitObjectResolver.AbbreviatedOID
tags: [method private]
```

```Go
func (o *gitObjectResolver) AbbreviatedOID(ctx context.Context) (string, error)
```

#### <a id="gitObjectResolver.Commit" href="#gitObjectResolver.Commit">func (o *gitObjectResolver) Commit(ctx context.Context) (*GitCommitResolver, error)</a>

```
searchKey: graphqlbackend.gitObjectResolver.Commit
tags: [method private]
```

```Go
func (o *gitObjectResolver) Commit(ctx context.Context) (*GitCommitResolver, error)
```

#### <a id="gitObjectResolver.OID" href="#gitObjectResolver.OID">func (o *gitObjectResolver) OID(ctx context.Context) (GitObjectID, error)</a>

```
searchKey: graphqlbackend.gitObjectResolver.OID
tags: [method private]
```

```Go
func (o *gitObjectResolver) OID(ctx context.Context) (GitObjectID, error)
```

#### <a id="gitObjectResolver.Type" href="#gitObjectResolver.Type">func (o *gitObjectResolver) Type(ctx context.Context) (gitObjectType, error)</a>

```
searchKey: graphqlbackend.gitObjectResolver.Type
tags: [method private]
```

```Go
func (o *gitObjectResolver) Type(ctx context.Context) (gitObjectType, error)
```

#### <a id="gitObjectResolver.resolve" href="#gitObjectResolver.resolve">func (o *gitObjectResolver) resolve(ctx context.Context) (GitObjectID, gitObjectType, error)</a>

```
searchKey: graphqlbackend.gitObjectResolver.resolve
tags: [method private]
```

```Go
func (o *gitObjectResolver) resolve(ctx context.Context) (GitObjectID, gitObjectType, error)
```

### <a id="gitObjectType" href="#gitObjectType">type gitObjectType string</a>

```
searchKey: graphqlbackend.gitObjectType
tags: [string private]
```

```Go
type gitObjectType string
```

#### <a id="toGitObjectType" href="#toGitObjectType">func toGitObjectType(t git.ObjectType) gitObjectType</a>

```
searchKey: graphqlbackend.toGitObjectType
tags: [function private]
```

```Go
func toGitObjectType(t git.ObjectType) gitObjectType
```

#### <a id="gitObjectType.ImplementsGraphQLType" href="#gitObjectType.ImplementsGraphQLType">func (gitObjectType) ImplementsGraphQLType(name string) bool</a>

```
searchKey: graphqlbackend.gitObjectType.ImplementsGraphQLType
tags: [method private]
```

```Go
func (gitObjectType) ImplementsGraphQLType(name string) bool
```

### <a id="gitRefConnectionResolver" href="#gitRefConnectionResolver">type gitRefConnectionResolver struct</a>

```
searchKey: graphqlbackend.gitRefConnectionResolver
tags: [struct private]
```

```Go
type gitRefConnectionResolver struct {
	first *int32
	refs  []*GitRefResolver

	repo *RepositoryResolver
}
```

#### <a id="gitRefConnectionResolver.Nodes" href="#gitRefConnectionResolver.Nodes">func (r *gitRefConnectionResolver) Nodes() []*GitRefResolver</a>

```
searchKey: graphqlbackend.gitRefConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *gitRefConnectionResolver) Nodes() []*GitRefResolver
```

#### <a id="gitRefConnectionResolver.PageInfo" href="#gitRefConnectionResolver.PageInfo">func (r *gitRefConnectionResolver) PageInfo() *graphqlutil.PageInfo</a>

```
searchKey: graphqlbackend.gitRefConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *gitRefConnectionResolver) PageInfo() *graphqlutil.PageInfo
```

#### <a id="gitRefConnectionResolver.TotalCount" href="#gitRefConnectionResolver.TotalCount">func (r *gitRefConnectionResolver) TotalCount() int32</a>

```
searchKey: graphqlbackend.gitRefConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *gitRefConnectionResolver) TotalCount() int32
```

### <a id="gitRefGQLID" href="#gitRefGQLID">type gitRefGQLID struct</a>

```
searchKey: graphqlbackend.gitRefGQLID
tags: [struct private]
```

```Go
type gitRefGQLID struct {
	Repository graphql.ID `json:"r"`
	Rev        string     `json:"v"`
}
```

gitRefGQLID is a type used for marshaling and unmarshaling a Git ref's GraphQL ID. 

### <a id="gitRevSpec" href="#gitRevSpec">type gitRevSpec struct</a>

```
searchKey: graphqlbackend.gitRevSpec
tags: [struct private]
```

```Go
type gitRevSpec struct {
	ref    *GitRefResolver
	expr   *gitRevSpecExpr
	object *gitObject
}
```

#### <a id="gitRevSpec.ToGitObject" href="#gitRevSpec.ToGitObject">func (r *gitRevSpec) ToGitObject() (*gitObject, bool)</a>

```
searchKey: graphqlbackend.gitRevSpec.ToGitObject
tags: [method private]
```

```Go
func (r *gitRevSpec) ToGitObject() (*gitObject, bool)
```

#### <a id="gitRevSpec.ToGitRef" href="#gitRevSpec.ToGitRef">func (r *gitRevSpec) ToGitRef() (*GitRefResolver, bool)</a>

```
searchKey: graphqlbackend.gitRevSpec.ToGitRef
tags: [method private]
```

```Go
func (r *gitRevSpec) ToGitRef() (*GitRefResolver, bool)
```

#### <a id="gitRevSpec.ToGitRevSpecExpr" href="#gitRevSpec.ToGitRevSpecExpr">func (r *gitRevSpec) ToGitRevSpecExpr() (*gitRevSpecExpr, bool)</a>

```
searchKey: graphqlbackend.gitRevSpec.ToGitRevSpecExpr
tags: [method private]
```

```Go
func (r *gitRevSpec) ToGitRevSpecExpr() (*gitRevSpecExpr, bool)
```

### <a id="gitRevSpecExpr" href="#gitRevSpecExpr">type gitRevSpecExpr struct</a>

```
searchKey: graphqlbackend.gitRevSpecExpr
tags: [struct private]
```

```Go
type gitRevSpecExpr struct {
	expr string
	repo *RepositoryResolver
}
```

#### <a id="gitRevSpecExpr.Expr" href="#gitRevSpecExpr.Expr">func (r *gitRevSpecExpr) Expr() string</a>

```
searchKey: graphqlbackend.gitRevSpecExpr.Expr
tags: [method private]
```

```Go
func (r *gitRevSpecExpr) Expr() string
```

#### <a id="gitRevSpecExpr.Object" href="#gitRevSpecExpr.Object">func (r *gitRevSpecExpr) Object(ctx context.Context) (*gitObject, error)</a>

```
searchKey: graphqlbackend.gitRevSpecExpr.Object
tags: [method private]
```

```Go
func (r *gitRevSpecExpr) Object(ctx context.Context) (*gitObject, error)
```

### <a id="gitRevisionRange" href="#gitRevisionRange">type gitRevisionRange struct</a>

```
searchKey: graphqlbackend.gitRevisionRange
tags: [struct private]
```

```Go
type gitRevisionRange struct {
	expr       string
	base, head *gitRevSpec
	mergeBase  *gitObject
}
```

#### <a id="gitRevisionRange.Base" href="#gitRevisionRange.Base">func (r *gitRevisionRange) Base() *gitRevSpec</a>

```
searchKey: graphqlbackend.gitRevisionRange.Base
tags: [method private]
```

```Go
func (r *gitRevisionRange) Base() *gitRevSpec
```

#### <a id="gitRevisionRange.BaseRevSpec" href="#gitRevisionRange.BaseRevSpec">func (r *gitRevisionRange) BaseRevSpec() *gitRevSpecExpr</a>

```
searchKey: graphqlbackend.gitRevisionRange.BaseRevSpec
tags: [method private]
```

```Go
func (r *gitRevisionRange) BaseRevSpec() *gitRevSpecExpr
```

#### <a id="gitRevisionRange.Expr" href="#gitRevisionRange.Expr">func (r *gitRevisionRange) Expr() string</a>

```
searchKey: graphqlbackend.gitRevisionRange.Expr
tags: [method private]
```

```Go
func (r *gitRevisionRange) Expr() string
```

#### <a id="gitRevisionRange.Head" href="#gitRevisionRange.Head">func (r *gitRevisionRange) Head() *gitRevSpec</a>

```
searchKey: graphqlbackend.gitRevisionRange.Head
tags: [method private]
```

```Go
func (r *gitRevisionRange) Head() *gitRevSpec
```

#### <a id="gitRevisionRange.HeadRevSpec" href="#gitRevisionRange.HeadRevSpec">func (r *gitRevisionRange) HeadRevSpec() *gitRevSpecExpr</a>

```
searchKey: graphqlbackend.gitRevisionRange.HeadRevSpec
tags: [method private]
```

```Go
func (r *gitRevisionRange) HeadRevSpec() *gitRevSpecExpr
```

#### <a id="gitRevisionRange.MergeBase" href="#gitRevisionRange.MergeBase">func (r *gitRevisionRange) MergeBase() *gitObject</a>

```
searchKey: graphqlbackend.gitRevisionRange.MergeBase
tags: [method private]
```

```Go
func (r *gitRevisionRange) MergeBase() *gitObject
```

### <a id="gitSubmoduleResolver" href="#gitSubmoduleResolver">type gitSubmoduleResolver struct</a>

```
searchKey: graphqlbackend.gitSubmoduleResolver
tags: [struct private]
```

```Go
type gitSubmoduleResolver struct {
	submodule git.Submodule
}
```

#### <a id="gitSubmoduleResolver.Commit" href="#gitSubmoduleResolver.Commit">func (r *gitSubmoduleResolver) Commit() string</a>

```
searchKey: graphqlbackend.gitSubmoduleResolver.Commit
tags: [method private]
```

```Go
func (r *gitSubmoduleResolver) Commit() string
```

#### <a id="gitSubmoduleResolver.Path" href="#gitSubmoduleResolver.Path">func (r *gitSubmoduleResolver) Path() string</a>

```
searchKey: graphqlbackend.gitSubmoduleResolver.Path
tags: [method private]
```

```Go
func (r *gitSubmoduleResolver) Path() string
```

#### <a id="gitSubmoduleResolver.URL" href="#gitSubmoduleResolver.URL">func (r *gitSubmoduleResolver) URL() string</a>

```
searchKey: graphqlbackend.gitSubmoduleResolver.URL
tags: [method private]
```

```Go
func (r *gitSubmoduleResolver) URL() string
```

### <a id="gitTreeEntryConnectionArgs" href="#gitTreeEntryConnectionArgs">type gitTreeEntryConnectionArgs struct</a>

```
searchKey: graphqlbackend.gitTreeEntryConnectionArgs
tags: [struct private]
```

```Go
type gitTreeEntryConnectionArgs struct {
	graphqlutil.ConnectionArgs
	Recursive bool
	// If recurseSingleChild is true, we will return a flat list of every
	// directory and file in a single-child nest.
	RecursiveSingleChild bool
}
```

### <a id="gitTreeSuggestionResolver" href="#gitTreeSuggestionResolver">type gitTreeSuggestionResolver struct</a>

```
searchKey: graphqlbackend.gitTreeSuggestionResolver
tags: [struct private]
```

```Go
type gitTreeSuggestionResolver struct {
	baseSuggestionResolver
	gitTreeEntry *GitTreeEntryResolver
	score        int
}
```

gitTreeSuggestionResolver implements searchSuggestionResolver for GitTreeEntryResolver 

#### <a id="gitTreeSuggestionResolver.Key" href="#gitTreeSuggestionResolver.Key">func (g gitTreeSuggestionResolver) Key() suggestionKey</a>

```
searchKey: graphqlbackend.gitTreeSuggestionResolver.Key
tags: [method private]
```

```Go
func (g gitTreeSuggestionResolver) Key() suggestionKey
```

#### <a id="gitTreeSuggestionResolver.Label" href="#gitTreeSuggestionResolver.Label">func (g gitTreeSuggestionResolver) Label() string</a>

```
searchKey: graphqlbackend.gitTreeSuggestionResolver.Label
tags: [method private]
```

```Go
func (g gitTreeSuggestionResolver) Label() string
```

#### <a id="gitTreeSuggestionResolver.Length" href="#gitTreeSuggestionResolver.Length">func (g gitTreeSuggestionResolver) Length() int</a>

```
searchKey: graphqlbackend.gitTreeSuggestionResolver.Length
tags: [method private]
```

```Go
func (g gitTreeSuggestionResolver) Length() int
```

#### <a id="gitTreeSuggestionResolver.Score" href="#gitTreeSuggestionResolver.Score">func (g gitTreeSuggestionResolver) Score() int</a>

```
searchKey: graphqlbackend.gitTreeSuggestionResolver.Score
tags: [method private]
```

```Go
func (g gitTreeSuggestionResolver) Score() int
```

#### <a id="gitTreeSuggestionResolver.ToFile" href="#gitTreeSuggestionResolver.ToFile">func (g gitTreeSuggestionResolver) ToFile() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.gitTreeSuggestionResolver.ToFile
tags: [method private]
```

```Go
func (g gitTreeSuggestionResolver) ToFile() (*GitTreeEntryResolver, bool)
```

#### <a id="gitTreeSuggestionResolver.ToGitBlob" href="#gitTreeSuggestionResolver.ToGitBlob">func (g gitTreeSuggestionResolver) ToGitBlob() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.gitTreeSuggestionResolver.ToGitBlob
tags: [method private]
```

```Go
func (g gitTreeSuggestionResolver) ToGitBlob() (*GitTreeEntryResolver, bool)
```

#### <a id="gitTreeSuggestionResolver.ToGitTree" href="#gitTreeSuggestionResolver.ToGitTree">func (g gitTreeSuggestionResolver) ToGitTree() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.gitTreeSuggestionResolver.ToGitTree
tags: [method private]
```

```Go
func (g gitTreeSuggestionResolver) ToGitTree() (*GitTreeEntryResolver, bool)
```

### <a id="githubRepository" href="#githubRepository">type githubRepository struct</a>

```
searchKey: graphqlbackend.githubRepository
tags: [struct private]
```

```Go
type githubRepository struct {
	FullName string `json:"full_name"`
	Private  bool   `json:"private"`
}
```

copied from the github client, just the fields we need 

### <a id="gitlabRepository" href="#gitlabRepository">type gitlabRepository struct</a>

```
searchKey: graphqlbackend.gitlabRepository
tags: [struct private]
```

```Go
type gitlabRepository struct {
	Visibility        string `json:"visibility"`
	ID                int    `json:"id"`
	PathWithNamespace string `json:"path_with_namespace"`
}
```

### <a id="happinessFeedbackSubmissionForHubSpot" href="#happinessFeedbackSubmissionForHubSpot">type happinessFeedbackSubmissionForHubSpot struct</a>

```
searchKey: graphqlbackend.happinessFeedbackSubmissionForHubSpot
tags: [struct private]
```

```Go
type happinessFeedbackSubmissionForHubSpot struct {
	Email       *string `url:"email"`
	Score       int32   `url:"happiness_score"`
	Feedback    *string `url:"happiness_feedback"`
	CurrentPath *string `url:"happiness_current_url"`
	IsTest      bool    `url:"happiness_is_test"`
	SiteID      string  `url:"site_id"`
}
```

### <a id="highlightedDiffHunkBodyResolver" href="#highlightedDiffHunkBodyResolver">type highlightedDiffHunkBodyResolver struct</a>

```
searchKey: graphqlbackend.highlightedDiffHunkBodyResolver
tags: [struct private]
```

```Go
type highlightedDiffHunkBodyResolver struct {
	highlightedDiffHunkLineResolvers []*highlightedDiffHunkLineResolver
	aborted                          bool
}
```

#### <a id="highlightedDiffHunkBodyResolver.Aborted" href="#highlightedDiffHunkBodyResolver.Aborted">func (r *highlightedDiffHunkBodyResolver) Aborted() bool</a>

```
searchKey: graphqlbackend.highlightedDiffHunkBodyResolver.Aborted
tags: [method private]
```

```Go
func (r *highlightedDiffHunkBodyResolver) Aborted() bool
```

#### <a id="highlightedDiffHunkBodyResolver.Lines" href="#highlightedDiffHunkBodyResolver.Lines">func (r *highlightedDiffHunkBodyResolver) Lines() []*highlightedDiffHunkLineResolver</a>

```
searchKey: graphqlbackend.highlightedDiffHunkBodyResolver.Lines
tags: [method private]
```

```Go
func (r *highlightedDiffHunkBodyResolver) Lines() []*highlightedDiffHunkLineResolver
```

### <a id="highlightedDiffHunkLineResolver" href="#highlightedDiffHunkLineResolver">type highlightedDiffHunkLineResolver struct</a>

```
searchKey: graphqlbackend.highlightedDiffHunkLineResolver
tags: [struct private]
```

```Go
type highlightedDiffHunkLineResolver struct {
	html string
	kind string
}
```

#### <a id="highlightedDiffHunkLineResolver.HTML" href="#highlightedDiffHunkLineResolver.HTML">func (r *highlightedDiffHunkLineResolver) HTML() string</a>

```
searchKey: graphqlbackend.highlightedDiffHunkLineResolver.HTML
tags: [method private]
```

```Go
func (r *highlightedDiffHunkLineResolver) HTML() string
```

#### <a id="highlightedDiffHunkLineResolver.Kind" href="#highlightedDiffHunkLineResolver.Kind">func (r *highlightedDiffHunkLineResolver) Kind() string</a>

```
searchKey: graphqlbackend.highlightedDiffHunkLineResolver.Kind
tags: [method private]
```

```Go
func (r *highlightedDiffHunkLineResolver) Kind() string
```

### <a id="highlightedFileResolver" href="#highlightedFileResolver">type highlightedFileResolver struct</a>

```
searchKey: graphqlbackend.highlightedFileResolver
tags: [struct private]
```

```Go
type highlightedFileResolver struct {
	aborted bool
	html    template.HTML
}
```

#### <a id="highlightContent" href="#highlightContent">func highlightContent(ctx context.Context, args *HighlightArgs, content, path string, metadata highlight.Metadata) (*highlightedFileResolver, error)</a>

```
searchKey: graphqlbackend.highlightContent
tags: [function private]
```

```Go
func highlightContent(ctx context.Context, args *HighlightArgs, content, path string, metadata highlight.Metadata) (*highlightedFileResolver, error)
```

#### <a id="highlightedFileResolver.Aborted" href="#highlightedFileResolver.Aborted">func (h *highlightedFileResolver) Aborted() bool</a>

```
searchKey: graphqlbackend.highlightedFileResolver.Aborted
tags: [method private]
```

```Go
func (h *highlightedFileResolver) Aborted() bool
```

#### <a id="highlightedFileResolver.HTML" href="#highlightedFileResolver.HTML">func (h *highlightedFileResolver) HTML() string</a>

```
searchKey: graphqlbackend.highlightedFileResolver.HTML
tags: [method private]
```

```Go
func (h *highlightedFileResolver) HTML() string
```

#### <a id="highlightedFileResolver.LineRanges" href="#highlightedFileResolver.LineRanges">func (h *highlightedFileResolver) LineRanges(args *struct{ Ranges []highlight.LineRange }) ([][]string, error)</a>

```
searchKey: graphqlbackend.highlightedFileResolver.LineRanges
tags: [method private]
```

```Go
func (h *highlightedFileResolver) LineRanges(args *struct{ Ranges []highlight.LineRange }) ([][]string, error)
```

### <a id="highlightedRangeResolver" href="#highlightedRangeResolver">type highlightedRangeResolver struct</a>

```
searchKey: graphqlbackend.highlightedRangeResolver
tags: [struct private]
```

```Go
type highlightedRangeResolver struct {
	inner result.HighlightedRange
}
```

#### <a id="highlightedRangeResolver.Character" href="#highlightedRangeResolver.Character">func (h highlightedRangeResolver) Character() int32</a>

```
searchKey: graphqlbackend.highlightedRangeResolver.Character
tags: [method private]
```

```Go
func (h highlightedRangeResolver) Character() int32
```

#### <a id="highlightedRangeResolver.Length" href="#highlightedRangeResolver.Length">func (h highlightedRangeResolver) Length() int32</a>

```
searchKey: graphqlbackend.highlightedRangeResolver.Length
tags: [method private]
```

```Go
func (h highlightedRangeResolver) Length() int32
```

#### <a id="highlightedRangeResolver.Line" href="#highlightedRangeResolver.Line">func (h highlightedRangeResolver) Line() int32</a>

```
searchKey: graphqlbackend.highlightedRangeResolver.Line
tags: [method private]
```

```Go
func (h highlightedRangeResolver) Line() int32
```

### <a id="highlightedStringResolver" href="#highlightedStringResolver">type highlightedStringResolver struct</a>

```
searchKey: graphqlbackend.highlightedStringResolver
tags: [struct private]
```

```Go
type highlightedStringResolver struct {
	inner result.HighlightedString
}
```

#### <a id="highlightedStringResolver.Highlights" href="#highlightedStringResolver.Highlights">func (s *highlightedStringResolver) Highlights() []highlightedRangeResolver</a>

```
searchKey: graphqlbackend.highlightedStringResolver.Highlights
tags: [method private]
```

```Go
func (s *highlightedStringResolver) Highlights() []highlightedRangeResolver
```

#### <a id="highlightedStringResolver.Value" href="#highlightedStringResolver.Value">func (s *highlightedStringResolver) Value() string</a>

```
searchKey: graphqlbackend.highlightedStringResolver.Value
tags: [method private]
```

```Go
func (s *highlightedStringResolver) Value() string
```

### <a id="hunkResolver" href="#hunkResolver">type hunkResolver struct</a>

```
searchKey: graphqlbackend.hunkResolver
tags: [struct private]
```

```Go
type hunkResolver struct {
	db   dbutil.DB
	repo *RepositoryResolver
	hunk *git.Hunk
}
```

#### <a id="hunkResolver.Author" href="#hunkResolver.Author">func (r *hunkResolver) Author() signatureResolver</a>

```
searchKey: graphqlbackend.hunkResolver.Author
tags: [method private]
```

```Go
func (r *hunkResolver) Author() signatureResolver
```

#### <a id="hunkResolver.Commit" href="#hunkResolver.Commit">func (r *hunkResolver) Commit(ctx context.Context) (*GitCommitResolver, error)</a>

```
searchKey: graphqlbackend.hunkResolver.Commit
tags: [method private]
```

```Go
func (r *hunkResolver) Commit(ctx context.Context) (*GitCommitResolver, error)
```

#### <a id="hunkResolver.EndByte" href="#hunkResolver.EndByte">func (r *hunkResolver) EndByte() int32</a>

```
searchKey: graphqlbackend.hunkResolver.EndByte
tags: [method private]
```

```Go
func (r *hunkResolver) EndByte() int32
```

#### <a id="hunkResolver.EndLine" href="#hunkResolver.EndLine">func (r *hunkResolver) EndLine() int32</a>

```
searchKey: graphqlbackend.hunkResolver.EndLine
tags: [method private]
```

```Go
func (r *hunkResolver) EndLine() int32
```

#### <a id="hunkResolver.Message" href="#hunkResolver.Message">func (r *hunkResolver) Message() string</a>

```
searchKey: graphqlbackend.hunkResolver.Message
tags: [method private]
```

```Go
func (r *hunkResolver) Message() string
```

#### <a id="hunkResolver.Rev" href="#hunkResolver.Rev">func (r *hunkResolver) Rev() string</a>

```
searchKey: graphqlbackend.hunkResolver.Rev
tags: [method private]
```

```Go
func (r *hunkResolver) Rev() string
```

#### <a id="hunkResolver.StartByte" href="#hunkResolver.StartByte">func (r *hunkResolver) StartByte() int32</a>

```
searchKey: graphqlbackend.hunkResolver.StartByte
tags: [method private]
```

```Go
func (r *hunkResolver) StartByte() int32
```

#### <a id="hunkResolver.StartLine" href="#hunkResolver.StartLine">func (r *hunkResolver) StartLine() int32</a>

```
searchKey: graphqlbackend.hunkResolver.StartLine
tags: [method private]
```

```Go
func (r *hunkResolver) StartLine() int32
```

### <a id="inviteUserToOrganizationResult" href="#inviteUserToOrganizationResult">type inviteUserToOrganizationResult struct</a>

```
searchKey: graphqlbackend.inviteUserToOrganizationResult
tags: [struct private]
```

```Go
type inviteUserToOrganizationResult struct {
	sentInvitationEmail bool
	invitationURL       string
}
```

#### <a id="inviteUserToOrganizationResult.InvitationURL" href="#inviteUserToOrganizationResult.InvitationURL">func (r *inviteUserToOrganizationResult) InvitationURL() string</a>

```
searchKey: graphqlbackend.inviteUserToOrganizationResult.InvitationURL
tags: [method private]
```

```Go
func (r *inviteUserToOrganizationResult) InvitationURL() string
```

#### <a id="inviteUserToOrganizationResult.SentInvitationEmail" href="#inviteUserToOrganizationResult.SentInvitationEmail">func (r *inviteUserToOrganizationResult) SentInvitationEmail() bool</a>

```
searchKey: graphqlbackend.inviteUserToOrganizationResult.SentInvitationEmail
tags: [method private]
```

```Go
func (r *inviteUserToOrganizationResult) SentInvitationEmail() bool
```

### <a id="keyPathSegment" href="#keyPathSegment">type keyPathSegment struct</a>

```
searchKey: graphqlbackend.keyPathSegment
tags: [struct private]
```

```Go
type keyPathSegment struct {
	Property *string
	Index    *int32
}
```

### <a id="languageResolver" href="#languageResolver">type languageResolver struct</a>

```
searchKey: graphqlbackend.languageResolver
tags: [struct private]
```

```Go
type languageResolver struct {
	name string
}
```

#### <a id="languageResolver.Name" href="#languageResolver.Name">func (r *languageResolver) Name() string</a>

```
searchKey: graphqlbackend.languageResolver.Name
tags: [method private]
```

```Go
func (r *languageResolver) Name() string
```

### <a id="languageStatisticsResolver" href="#languageStatisticsResolver">type languageStatisticsResolver struct</a>

```
searchKey: graphqlbackend.languageStatisticsResolver
tags: [struct private]
```

```Go
type languageStatisticsResolver struct {
	l inventory.Lang
}
```

#### <a id="languageStatisticsResolver.Name" href="#languageStatisticsResolver.Name">func (l *languageStatisticsResolver) Name() string</a>

```
searchKey: graphqlbackend.languageStatisticsResolver.Name
tags: [method private]
```

```Go
func (l *languageStatisticsResolver) Name() string
```

#### <a id="languageStatisticsResolver.TotalBytes" href="#languageStatisticsResolver.TotalBytes">func (l *languageStatisticsResolver) TotalBytes() float64</a>

```
searchKey: graphqlbackend.languageStatisticsResolver.TotalBytes
tags: [method private]
```

```Go
func (l *languageStatisticsResolver) TotalBytes() float64
```

#### <a id="languageStatisticsResolver.TotalLines" href="#languageStatisticsResolver.TotalLines">func (l *languageStatisticsResolver) TotalLines() int32</a>

```
searchKey: graphqlbackend.languageStatisticsResolver.TotalLines
tags: [method private]
```

```Go
func (l *languageStatisticsResolver) TotalLines() int32
```

### <a id="languageSuggestionResolver" href="#languageSuggestionResolver">type languageSuggestionResolver struct</a>

```
searchKey: graphqlbackend.languageSuggestionResolver
tags: [struct private]
```

```Go
type languageSuggestionResolver struct {
	baseSuggestionResolver
	lang  *languageResolver
	score int
}
```

languageSuggestionResolver implements searchSuggestionResolver for languageResolver 

#### <a id="languageSuggestionResolver.Key" href="#languageSuggestionResolver.Key">func (l languageSuggestionResolver) Key() suggestionKey</a>

```
searchKey: graphqlbackend.languageSuggestionResolver.Key
tags: [method private]
```

```Go
func (l languageSuggestionResolver) Key() suggestionKey
```

#### <a id="languageSuggestionResolver.Label" href="#languageSuggestionResolver.Label">func (l languageSuggestionResolver) Label() string</a>

```
searchKey: graphqlbackend.languageSuggestionResolver.Label
tags: [method private]
```

```Go
func (l languageSuggestionResolver) Label() string
```

#### <a id="languageSuggestionResolver.Length" href="#languageSuggestionResolver.Length">func (l languageSuggestionResolver) Length() int</a>

```
searchKey: graphqlbackend.languageSuggestionResolver.Length
tags: [method private]
```

```Go
func (l languageSuggestionResolver) Length() int
```

#### <a id="languageSuggestionResolver.Score" href="#languageSuggestionResolver.Score">func (l languageSuggestionResolver) Score() int</a>

```
searchKey: graphqlbackend.languageSuggestionResolver.Score
tags: [method private]
```

```Go
func (l languageSuggestionResolver) Score() int
```

#### <a id="languageSuggestionResolver.ToLanguage" href="#languageSuggestionResolver.ToLanguage">func (l languageSuggestionResolver) ToLanguage() (*languageResolver, bool)</a>

```
searchKey: graphqlbackend.languageSuggestionResolver.ToLanguage
tags: [method private]
```

```Go
func (l languageSuggestionResolver) ToLanguage() (*languageResolver, bool)
```

### <a id="limiter" href="#limiter">type limiter interface</a>

```
searchKey: graphqlbackend.limiter
tags: [interface private]
```

```Go
type limiter interface {
	RateLimit(string, int) (bool, throttled.RateLimitResult, error)
}
```

### <a id="lineMatchResolver" href="#lineMatchResolver">type lineMatchResolver struct</a>

```
searchKey: graphqlbackend.lineMatchResolver
tags: [struct private]
```

```Go
type lineMatchResolver struct {
	*result.LineMatch
}
```

#### <a id="lineMatchResolver.LimitHit" href="#lineMatchResolver.LimitHit">func (lm lineMatchResolver) LimitHit() bool</a>

```
searchKey: graphqlbackend.lineMatchResolver.LimitHit
tags: [method private]
```

```Go
func (lm lineMatchResolver) LimitHit() bool
```

#### <a id="lineMatchResolver.LineNumber" href="#lineMatchResolver.LineNumber">func (lm lineMatchResolver) LineNumber() int32</a>

```
searchKey: graphqlbackend.lineMatchResolver.LineNumber
tags: [method private]
```

```Go
func (lm lineMatchResolver) LineNumber() int32
```

#### <a id="lineMatchResolver.OffsetAndLengths" href="#lineMatchResolver.OffsetAndLengths">func (lm lineMatchResolver) OffsetAndLengths() [][]int32</a>

```
searchKey: graphqlbackend.lineMatchResolver.OffsetAndLengths
tags: [method private]
```

```Go
func (lm lineMatchResolver) OffsetAndLengths() [][]int32
```

#### <a id="lineMatchResolver.Preview" href="#lineMatchResolver.Preview">func (lm lineMatchResolver) Preview() string</a>

```
searchKey: graphqlbackend.lineMatchResolver.Preview
tags: [method private]
```

```Go
func (lm lineMatchResolver) Preview() string
```

### <a id="listSearchContextsArgs" href="#listSearchContextsArgs">type listSearchContextsArgs struct</a>

```
searchKey: graphqlbackend.listSearchContextsArgs
tags: [struct private]
```

```Go
type listSearchContextsArgs struct {
	First      int32
	After      *string
	Query      *string
	Namespaces []*graphql.ID
	OrderBy    searchContextsOrderBy
	Descending bool
}
```

### <a id="locationResolver" href="#locationResolver">type locationResolver struct</a>

```
searchKey: graphqlbackend.locationResolver
tags: [struct private]
```

```Go
type locationResolver struct {
	resource *GitTreeEntryResolver
	lspRange *lsp.Range
}
```

#### <a id="locationResolver.CanonicalURL" href="#locationResolver.CanonicalURL">func (r *locationResolver) CanonicalURL() string</a>

```
searchKey: graphqlbackend.locationResolver.CanonicalURL
tags: [method private]
```

```Go
func (r *locationResolver) CanonicalURL() string
```

#### <a id="locationResolver.Range" href="#locationResolver.Range">func (r *locationResolver) Range() *rangeResolver</a>

```
searchKey: graphqlbackend.locationResolver.Range
tags: [method private]
```

```Go
func (r *locationResolver) Range() *rangeResolver
```

#### <a id="locationResolver.Resource" href="#locationResolver.Resource">func (r *locationResolver) Resource() *GitTreeEntryResolver</a>

```
searchKey: graphqlbackend.locationResolver.Resource
tags: [method private]
```

```Go
func (r *locationResolver) Resource() *GitTreeEntryResolver
```

#### <a id="locationResolver.URL" href="#locationResolver.URL">func (r *locationResolver) URL(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.locationResolver.URL
tags: [method private]
```

```Go
func (r *locationResolver) URL(ctx context.Context) (string, error)
```

#### <a id="locationResolver.urlPath" href="#locationResolver.urlPath">func (r *locationResolver) urlPath(prefix string) string</a>

```
searchKey: graphqlbackend.locationResolver.urlPath
tags: [method private]
```

```Go
func (r *locationResolver) urlPath(prefix string) string
```

### <a id="markdownOptions" href="#markdownOptions">type markdownOptions struct</a>

```
searchKey: graphqlbackend.markdownOptions
tags: [struct private]
```

```Go
type markdownOptions struct {
	AlwaysNil *string
}
```

### <a id="missingRepoRevsError" href="#missingRepoRevsError">type missingRepoRevsError struct</a>

```
searchKey: graphqlbackend.missingRepoRevsError
tags: [struct private]
```

```Go
type missingRepoRevsError struct {
	Missing []*search.RepositoryRevisions
}
```

#### <a id="missingRepoRevsError.Error" href="#missingRepoRevsError.Error">func (*missingRepoRevsError) Error() string</a>

```
searchKey: graphqlbackend.missingRepoRevsError.Error
tags: [method private]
```

```Go
func (*missingRepoRevsError) Error() string
```

### <a id="numTotalReposCache" href="#numTotalReposCache">type numTotalReposCache struct</a>

```
searchKey: graphqlbackend.numTotalReposCache
tags: [struct private]
```

```Go
type numTotalReposCache struct {
	sync.RWMutex
	lastUpdate time.Time
	count      int
}
```

Since we will need to know the number of total repos on Sourcegraph for every paginated search request, but the exact number doesn't matter, we cache the result for a minute to avoid executing many DB count operations. 

#### <a id="numTotalReposCache.get" href="#numTotalReposCache.get">func (n *numTotalReposCache) get(ctx context.Context, repoStore *database.RepoStore) int</a>

```
searchKey: graphqlbackend.numTotalReposCache.get
tags: [method private]
```

```Go
func (n *numTotalReposCache) get(ctx context.Context, repoStore *database.RepoStore) int
```

### <a id="orgConnectionResolver" href="#orgConnectionResolver">type orgConnectionResolver struct</a>

```
searchKey: graphqlbackend.orgConnectionResolver
tags: [struct private]
```

```Go
type orgConnectionResolver struct {
	db  dbutil.DB
	opt database.OrgsListOptions
}
```

#### <a id="orgConnectionResolver.Nodes" href="#orgConnectionResolver.Nodes">func (r *orgConnectionResolver) Nodes(ctx context.Context) ([]*OrgResolver, error)</a>

```
searchKey: graphqlbackend.orgConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *orgConnectionResolver) Nodes(ctx context.Context) ([]*OrgResolver, error)
```

#### <a id="orgConnectionResolver.TotalCount" href="#orgConnectionResolver.TotalCount">func (r *orgConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.orgConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *orgConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

### <a id="orgConnectionStaticResolver" href="#orgConnectionStaticResolver">type orgConnectionStaticResolver struct</a>

```
searchKey: graphqlbackend.orgConnectionStaticResolver
tags: [struct private]
```

```Go
type orgConnectionStaticResolver struct {
	nodes []*OrgResolver
}
```

#### <a id="orgConnectionStaticResolver.Nodes" href="#orgConnectionStaticResolver.Nodes">func (r *orgConnectionStaticResolver) Nodes() []*OrgResolver</a>

```
searchKey: graphqlbackend.orgConnectionStaticResolver.Nodes
tags: [method private]
```

```Go
func (r *orgConnectionStaticResolver) Nodes() []*OrgResolver
```

#### <a id="orgConnectionStaticResolver.PageInfo" href="#orgConnectionStaticResolver.PageInfo">func (r *orgConnectionStaticResolver) PageInfo() *graphqlutil.PageInfo</a>

```
searchKey: graphqlbackend.orgConnectionStaticResolver.PageInfo
tags: [method private]
```

```Go
func (r *orgConnectionStaticResolver) PageInfo() *graphqlutil.PageInfo
```

#### <a id="orgConnectionStaticResolver.TotalCount" href="#orgConnectionStaticResolver.TotalCount">func (r *orgConnectionStaticResolver) TotalCount() int32</a>

```
searchKey: graphqlbackend.orgConnectionStaticResolver.TotalCount
tags: [method private]
```

```Go
func (r *orgConnectionStaticResolver) TotalCount() int32
```

### <a id="organizationInvitationResolver" href="#organizationInvitationResolver">type organizationInvitationResolver struct</a>

```
searchKey: graphqlbackend.organizationInvitationResolver
tags: [struct private]
```

```Go
type organizationInvitationResolver struct {
	db dbutil.DB
	v  *database.OrgInvitation
}
```

organizationInvitationResolver implements the GraphQL type OrganizationInvitation. 

#### <a id="orgInvitationByID" href="#orgInvitationByID">func orgInvitationByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*organizationInvitationResolver, error)</a>

```
searchKey: graphqlbackend.orgInvitationByID
tags: [function private]
```

```Go
func orgInvitationByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*organizationInvitationResolver, error)
```

#### <a id="orgInvitationByIDInt64" href="#orgInvitationByIDInt64">func orgInvitationByIDInt64(ctx context.Context, db dbutil.DB, id int64) (*organizationInvitationResolver, error)</a>

```
searchKey: graphqlbackend.orgInvitationByIDInt64
tags: [function private]
```

```Go
func orgInvitationByIDInt64(ctx context.Context, db dbutil.DB, id int64) (*organizationInvitationResolver, error)
```

#### <a id="organizationInvitationResolver.CreatedAt" href="#organizationInvitationResolver.CreatedAt">func (r *organizationInvitationResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.CreatedAt
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) CreatedAt() DateTime
```

#### <a id="organizationInvitationResolver.ID" href="#organizationInvitationResolver.ID">func (r *organizationInvitationResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.ID
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) ID() graphql.ID
```

#### <a id="organizationInvitationResolver.NotifiedAt" href="#organizationInvitationResolver.NotifiedAt">func (r *organizationInvitationResolver) NotifiedAt() *DateTime</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.NotifiedAt
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) NotifiedAt() *DateTime
```

#### <a id="organizationInvitationResolver.Organization" href="#organizationInvitationResolver.Organization">func (r *organizationInvitationResolver) Organization(ctx context.Context) (*OrgResolver, error)</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.Organization
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) Organization(ctx context.Context) (*OrgResolver, error)
```

#### <a id="organizationInvitationResolver.Recipient" href="#organizationInvitationResolver.Recipient">func (r *organizationInvitationResolver) Recipient(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.Recipient
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) Recipient(ctx context.Context) (*UserResolver, error)
```

#### <a id="organizationInvitationResolver.RespondURL" href="#organizationInvitationResolver.RespondURL">func (r *organizationInvitationResolver) RespondURL(ctx context.Context) (*string, error)</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.RespondURL
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) RespondURL(ctx context.Context) (*string, error)
```

#### <a id="organizationInvitationResolver.RespondedAt" href="#organizationInvitationResolver.RespondedAt">func (r *organizationInvitationResolver) RespondedAt() *DateTime</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.RespondedAt
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) RespondedAt() *DateTime
```

#### <a id="organizationInvitationResolver.ResponseType" href="#organizationInvitationResolver.ResponseType">func (r *organizationInvitationResolver) ResponseType() *string</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.ResponseType
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) ResponseType() *string
```

#### <a id="organizationInvitationResolver.RevokedAt" href="#organizationInvitationResolver.RevokedAt">func (r *organizationInvitationResolver) RevokedAt() *DateTime</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.RevokedAt
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) RevokedAt() *DateTime
```

#### <a id="organizationInvitationResolver.Sender" href="#organizationInvitationResolver.Sender">func (r *organizationInvitationResolver) Sender(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.organizationInvitationResolver.Sender
tags: [method private]
```

```Go
func (r *organizationInvitationResolver) Sender(ctx context.Context) (*UserResolver, error)
```

### <a id="organizationMembershipConnectionResolver" href="#organizationMembershipConnectionResolver">type organizationMembershipConnectionResolver struct</a>

```
searchKey: graphqlbackend.organizationMembershipConnectionResolver
tags: [struct private]
```

```Go
type organizationMembershipConnectionResolver struct {
	nodes []*organizationMembershipResolver
}
```

#### <a id="organizationMembershipConnectionResolver.Nodes" href="#organizationMembershipConnectionResolver.Nodes">func (r *organizationMembershipConnectionResolver) Nodes() []*organizationMembershipResolver</a>

```
searchKey: graphqlbackend.organizationMembershipConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *organizationMembershipConnectionResolver) Nodes() []*organizationMembershipResolver
```

#### <a id="organizationMembershipConnectionResolver.PageInfo" href="#organizationMembershipConnectionResolver.PageInfo">func (r *organizationMembershipConnectionResolver) PageInfo() *graphqlutil.PageInfo</a>

```
searchKey: graphqlbackend.organizationMembershipConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *organizationMembershipConnectionResolver) PageInfo() *graphqlutil.PageInfo
```

#### <a id="organizationMembershipConnectionResolver.TotalCount" href="#organizationMembershipConnectionResolver.TotalCount">func (r *organizationMembershipConnectionResolver) TotalCount() int32</a>

```
searchKey: graphqlbackend.organizationMembershipConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *organizationMembershipConnectionResolver) TotalCount() int32
```

### <a id="organizationMembershipResolver" href="#organizationMembershipResolver">type organizationMembershipResolver struct</a>

```
searchKey: graphqlbackend.organizationMembershipResolver
tags: [struct private]
```

```Go
type organizationMembershipResolver struct {
	db         dbutil.DB
	membership *types.OrgMembership
}
```

#### <a id="organizationMembershipResolver.CreatedAt" href="#organizationMembershipResolver.CreatedAt">func (r *organizationMembershipResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.organizationMembershipResolver.CreatedAt
tags: [method private]
```

```Go
func (r *organizationMembershipResolver) CreatedAt() DateTime
```

#### <a id="organizationMembershipResolver.Organization" href="#organizationMembershipResolver.Organization">func (r *organizationMembershipResolver) Organization(ctx context.Context) (*OrgResolver, error)</a>

```
searchKey: graphqlbackend.organizationMembershipResolver.Organization
tags: [method private]
```

```Go
func (r *organizationMembershipResolver) Organization(ctx context.Context) (*OrgResolver, error)
```

#### <a id="organizationMembershipResolver.UpdatedAt" href="#organizationMembershipResolver.UpdatedAt">func (r *organizationMembershipResolver) UpdatedAt() DateTime</a>

```
searchKey: graphqlbackend.organizationMembershipResolver.UpdatedAt
tags: [method private]
```

```Go
func (r *organizationMembershipResolver) UpdatedAt() DateTime
```

#### <a id="organizationMembershipResolver.User" href="#organizationMembershipResolver.User">func (r *organizationMembershipResolver) User(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.organizationMembershipResolver.User
tags: [method private]
```

```Go
func (r *organizationMembershipResolver) User(ctx context.Context) (*UserResolver, error)
```

### <a id="outOfBandMigrationErrorResolver" href="#outOfBandMigrationErrorResolver">type outOfBandMigrationErrorResolver struct</a>

```
searchKey: graphqlbackend.outOfBandMigrationErrorResolver
tags: [struct private]
```

```Go
type outOfBandMigrationErrorResolver struct {
	e oobmigration.MigrationError
}
```

outOfBandMigrationErrorResolver implements the GraphQL type OutOfBandMigrationError. 

#### <a id="outOfBandMigrationErrorResolver.Created" href="#outOfBandMigrationErrorResolver.Created">func (r *outOfBandMigrationErrorResolver) Created() DateTime</a>

```
searchKey: graphqlbackend.outOfBandMigrationErrorResolver.Created
tags: [method private]
```

```Go
func (r *outOfBandMigrationErrorResolver) Created() DateTime
```

#### <a id="outOfBandMigrationErrorResolver.Message" href="#outOfBandMigrationErrorResolver.Message">func (r *outOfBandMigrationErrorResolver) Message() string</a>

```
searchKey: graphqlbackend.outOfBandMigrationErrorResolver.Message
tags: [method private]
```

```Go
func (r *outOfBandMigrationErrorResolver) Message() string
```

### <a id="outOfBandMigrationResolver" href="#outOfBandMigrationResolver">type outOfBandMigrationResolver struct</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver
tags: [struct private]
```

```Go
type outOfBandMigrationResolver struct {
	m oobmigration.Migration
}
```

outOfBandMigrationResolver implements the GraphQL type OutOfBandMigration. 

#### <a id="outOfBandMigrationResolver.ApplyReverse" href="#outOfBandMigrationResolver.ApplyReverse">func (r *outOfBandMigrationResolver) ApplyReverse() bool</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.ApplyReverse
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) ApplyReverse() bool
```

#### <a id="outOfBandMigrationResolver.Component" href="#outOfBandMigrationResolver.Component">func (r *outOfBandMigrationResolver) Component() string</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.Component
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) Component() string
```

#### <a id="outOfBandMigrationResolver.Created" href="#outOfBandMigrationResolver.Created">func (r *outOfBandMigrationResolver) Created() DateTime</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.Created
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) Created() DateTime
```

#### <a id="outOfBandMigrationResolver.Deprecated" href="#outOfBandMigrationResolver.Deprecated">func (r *outOfBandMigrationResolver) Deprecated() *string</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.Deprecated
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) Deprecated() *string
```

#### <a id="outOfBandMigrationResolver.Description" href="#outOfBandMigrationResolver.Description">func (r *outOfBandMigrationResolver) Description() string</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.Description
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) Description() string
```

#### <a id="outOfBandMigrationResolver.Errors" href="#outOfBandMigrationResolver.Errors">func (r *outOfBandMigrationResolver) Errors() []*outOfBandMigrationErrorResolver</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.Errors
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) Errors() []*outOfBandMigrationErrorResolver
```

#### <a id="outOfBandMigrationResolver.ID" href="#outOfBandMigrationResolver.ID">func (r *outOfBandMigrationResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.ID
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) ID() graphql.ID
```

#### <a id="outOfBandMigrationResolver.Introduced" href="#outOfBandMigrationResolver.Introduced">func (r *outOfBandMigrationResolver) Introduced() string</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.Introduced
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) Introduced() string
```

#### <a id="outOfBandMigrationResolver.LastUpdated" href="#outOfBandMigrationResolver.LastUpdated">func (r *outOfBandMigrationResolver) LastUpdated() *DateTime</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.LastUpdated
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) LastUpdated() *DateTime
```

#### <a id="outOfBandMigrationResolver.NonDestructive" href="#outOfBandMigrationResolver.NonDestructive">func (r *outOfBandMigrationResolver) NonDestructive() bool</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.NonDestructive
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) NonDestructive() bool
```

#### <a id="outOfBandMigrationResolver.Progress" href="#outOfBandMigrationResolver.Progress">func (r *outOfBandMigrationResolver) Progress() float64</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.Progress
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) Progress() float64
```

#### <a id="outOfBandMigrationResolver.Team" href="#outOfBandMigrationResolver.Team">func (r *outOfBandMigrationResolver) Team() string</a>

```
searchKey: graphqlbackend.outOfBandMigrationResolver.Team
tags: [method private]
```

```Go
func (r *outOfBandMigrationResolver) Team() string
```

### <a id="overrideSpec" href="#overrideSpec">type overrideSpec struct</a>

```
searchKey: graphqlbackend.overrideSpec
tags: [struct private]
```

```Go
type overrideSpec struct {
	UserID, OrgID *int32
	FlagName      string
}
```

#### <a id="unmarshalOverrideID" href="#unmarshalOverrideID">func unmarshalOverrideID(id graphql.ID) (spec overrideSpec, err error)</a>

```
searchKey: graphqlbackend.unmarshalOverrideID
tags: [function private]
```

```Go
func unmarshalOverrideID(id graphql.ID) (spec overrideSpec, err error)
```

### <a id="parentSourcegraphResolver" href="#parentSourcegraphResolver">type parentSourcegraphResolver struct</a>

```
searchKey: graphqlbackend.parentSourcegraphResolver
tags: [struct private]
```

```Go
type parentSourcegraphResolver struct {
	url string
}
```

#### <a id="parentSourcegraphResolver.URL" href="#parentSourcegraphResolver.URL">func (r *parentSourcegraphResolver) URL() string</a>

```
searchKey: graphqlbackend.parentSourcegraphResolver.URL
tags: [method private]
```

```Go
func (r *parentSourcegraphResolver) URL() string
```

### <a id="phabricatorRepoResolver" href="#phabricatorRepoResolver">type phabricatorRepoResolver struct</a>

```
searchKey: graphqlbackend.phabricatorRepoResolver
tags: [struct private]
```

```Go
type phabricatorRepoResolver struct {
	*types.PhabricatorRepo
}
```

#### <a id="phabricatorRepoResolver.Callsign" href="#phabricatorRepoResolver.Callsign">func (p *phabricatorRepoResolver) Callsign() string</a>

```
searchKey: graphqlbackend.phabricatorRepoResolver.Callsign
tags: [method private]
```

```Go
func (p *phabricatorRepoResolver) Callsign() string
```

#### <a id="phabricatorRepoResolver.Name" href="#phabricatorRepoResolver.Name">func (p *phabricatorRepoResolver) Name() string</a>

```
searchKey: graphqlbackend.phabricatorRepoResolver.Name
tags: [method private]
```

```Go
func (p *phabricatorRepoResolver) Name() string
```

#### <a id="phabricatorRepoResolver.URI" href="#phabricatorRepoResolver.URI">func (p *phabricatorRepoResolver) URI() string</a>

```
searchKey: graphqlbackend.phabricatorRepoResolver.URI
tags: [method private]
```

```Go
func (p *phabricatorRepoResolver) URI() string
```

TODO(chris): Remove URI in favor of Name. 

#### <a id="phabricatorRepoResolver.URL" href="#phabricatorRepoResolver.URL">func (p *phabricatorRepoResolver) URL() string</a>

```
searchKey: graphqlbackend.phabricatorRepoResolver.URL
tags: [method private]
```

```Go
func (p *phabricatorRepoResolver) URL() string
```

### <a id="positionResolver" href="#positionResolver">type positionResolver struct</a>

```
searchKey: graphqlbackend.positionResolver
tags: [struct private]
```

```Go
type positionResolver struct{ pos lsp.Position }
```

#### <a id="positionResolver.Character" href="#positionResolver.Character">func (r *positionResolver) Character() int32</a>

```
searchKey: graphqlbackend.positionResolver.Character
tags: [method private]
```

```Go
func (r *positionResolver) Character() int32
```

#### <a id="positionResolver.Line" href="#positionResolver.Line">func (r *positionResolver) Line() int32</a>

```
searchKey: graphqlbackend.positionResolver.Line
tags: [method private]
```

```Go
func (r *positionResolver) Line() int32
```

#### <a id="positionResolver.urlFragment" href="#positionResolver.urlFragment">func (r *positionResolver) urlFragment(forceIncludeCharacter bool) string</a>

```
searchKey: graphqlbackend.positionResolver.urlFragment
tags: [method private]
```

```Go
func (r *positionResolver) urlFragment(forceIncludeCharacter bool) string
```

### <a id="previewRepositoryComparisonResolver" href="#previewRepositoryComparisonResolver">type previewRepositoryComparisonResolver struct</a>

```
searchKey: graphqlbackend.previewRepositoryComparisonResolver
tags: [struct private]
```

```Go
type previewRepositoryComparisonResolver struct {
	db     dbutil.DB
	repo   *RepositoryResolver
	commit *GitCommitResolver
	patch  string
}
```

#### <a id="NewPreviewRepositoryComparisonResolver" href="#NewPreviewRepositoryComparisonResolver">func NewPreviewRepositoryComparisonResolver(ctx context.Context, db dbutil.DB, repo *RepositoryResolver, baseRev, patch string) (*previewRepositoryComparisonResolver, error)</a>

```
searchKey: graphqlbackend.NewPreviewRepositoryComparisonResolver
tags: [function]
```

```Go
func NewPreviewRepositoryComparisonResolver(ctx context.Context, db dbutil.DB, repo *RepositoryResolver, baseRev, patch string) (*previewRepositoryComparisonResolver, error)
```

NewPreviewRepositoryComparisonResolver is a convenience function to get a preview diff from a repo, given a base rev and the git patch. 

#### <a id="previewRepositoryComparisonResolver.BaseRepository" href="#previewRepositoryComparisonResolver.BaseRepository">func (r *previewRepositoryComparisonResolver) BaseRepository() *RepositoryResolver</a>

```
searchKey: graphqlbackend.previewRepositoryComparisonResolver.BaseRepository
tags: [method private]
```

```Go
func (r *previewRepositoryComparisonResolver) BaseRepository() *RepositoryResolver
```

#### <a id="previewRepositoryComparisonResolver.FileDiffs" href="#previewRepositoryComparisonResolver.FileDiffs">func (r *previewRepositoryComparisonResolver) FileDiffs(ctx context.Context, args *FileDiffsConnectionArgs) (FileDiffConnection, error)</a>

```
searchKey: graphqlbackend.previewRepositoryComparisonResolver.FileDiffs
tags: [method private]
```

```Go
func (r *previewRepositoryComparisonResolver) FileDiffs(ctx context.Context, args *FileDiffsConnectionArgs) (FileDiffConnection, error)
```

#### <a id="previewRepositoryComparisonResolver.ToPreviewRepositoryComparison" href="#previewRepositoryComparisonResolver.ToPreviewRepositoryComparison">func (r *previewRepositoryComparisonResolver) ToPreviewRepositoryComparison() (PreviewRepositoryComparisonResolver, bool)</a>

```
searchKey: graphqlbackend.previewRepositoryComparisonResolver.ToPreviewRepositoryComparison
tags: [method private]
```

```Go
func (r *previewRepositoryComparisonResolver) ToPreviewRepositoryComparison() (PreviewRepositoryComparisonResolver, bool)
```

#### <a id="previewRepositoryComparisonResolver.ToRepositoryComparison" href="#previewRepositoryComparisonResolver.ToRepositoryComparison">func (r *previewRepositoryComparisonResolver) ToRepositoryComparison() (*RepositoryComparisonResolver, bool)</a>

```
searchKey: graphqlbackend.previewRepositoryComparisonResolver.ToRepositoryComparison
tags: [method private]
```

```Go
func (r *previewRepositoryComparisonResolver) ToRepositoryComparison() (*RepositoryComparisonResolver, bool)
```

### <a id="productSubscriptionStatus" href="#productSubscriptionStatus">type productSubscriptionStatus struct{}</a>

```
searchKey: graphqlbackend.productSubscriptionStatus
tags: [struct private]
```

```Go
type productSubscriptionStatus struct{}
```

productSubscriptionStatus implements the GraphQL type ProductSubscriptionStatus. 

#### <a id="productSubscriptionStatus.ActualUserCount" href="#productSubscriptionStatus.ActualUserCount">func (productSubscriptionStatus) ActualUserCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.productSubscriptionStatus.ActualUserCount
tags: [method private]
```

```Go
func (productSubscriptionStatus) ActualUserCount(ctx context.Context) (int32, error)
```

#### <a id="productSubscriptionStatus.ActualUserCountDate" href="#productSubscriptionStatus.ActualUserCountDate">func (productSubscriptionStatus) ActualUserCountDate(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.productSubscriptionStatus.ActualUserCountDate
tags: [method private]
```

```Go
func (productSubscriptionStatus) ActualUserCountDate(ctx context.Context) (string, error)
```

#### <a id="productSubscriptionStatus.License" href="#productSubscriptionStatus.License">func (r productSubscriptionStatus) License() (*ProductLicenseInfo, error)</a>

```
searchKey: graphqlbackend.productSubscriptionStatus.License
tags: [method private]
```

```Go
func (r productSubscriptionStatus) License() (*ProductLicenseInfo, error)
```

#### <a id="productSubscriptionStatus.MaximumAllowedUserCount" href="#productSubscriptionStatus.MaximumAllowedUserCount">func (productSubscriptionStatus) MaximumAllowedUserCount(ctx context.Context) (*int32, error)</a>

```
searchKey: graphqlbackend.productSubscriptionStatus.MaximumAllowedUserCount
tags: [method private]
```

```Go
func (productSubscriptionStatus) MaximumAllowedUserCount(ctx context.Context) (*int32, error)
```

#### <a id="productSubscriptionStatus.NoLicenseWarningUserCount" href="#productSubscriptionStatus.NoLicenseWarningUserCount">func (productSubscriptionStatus) NoLicenseWarningUserCount(ctx context.Context) (*int32, error)</a>

```
searchKey: graphqlbackend.productSubscriptionStatus.NoLicenseWarningUserCount
tags: [method private]
```

```Go
func (productSubscriptionStatus) NoLicenseWarningUserCount(ctx context.Context) (*int32, error)
```

#### <a id="productSubscriptionStatus.ProductNameWithBrand" href="#productSubscriptionStatus.ProductNameWithBrand">func (productSubscriptionStatus) ProductNameWithBrand() (string, error)</a>

```
searchKey: graphqlbackend.productSubscriptionStatus.ProductNameWithBrand
tags: [method private]
```

```Go
func (productSubscriptionStatus) ProductNameWithBrand() (string, error)
```

### <a id="prometheusTracer" href="#prometheusTracer">type prometheusTracer struct</a>

```
searchKey: graphqlbackend.prometheusTracer
tags: [struct private]
```

```Go
type prometheusTracer struct {
	db dbutil.DB
	trace.OpenTracingTracer
}
```

#### <a id="prometheusTracer.TraceField" href="#prometheusTracer.TraceField">func (prometheusTracer) TraceField(ctx context.Context, label, typeName, fieldName string, trivial bool, args map[string]interface{}) (context.Context, trace.TraceFieldFinishFunc)</a>

```
searchKey: graphqlbackend.prometheusTracer.TraceField
tags: [method private]
```

```Go
func (prometheusTracer) TraceField(ctx context.Context, label, typeName, fieldName string, trivial bool, args map[string]interface{}) (context.Context, trace.TraceFieldFinishFunc)
```

#### <a id="prometheusTracer.TraceQuery" href="#prometheusTracer.TraceQuery">func (t *prometheusTracer) TraceQuery(ctx context.Context, queryString string, operationName string, variables map[string]interface{}, varTypes map[string]*introspection.Type) (context.Context, trace.TraceQueryFinishFunc)</a>

```
searchKey: graphqlbackend.prometheusTracer.TraceQuery
tags: [method private]
```

```Go
func (t *prometheusTracer) TraceQuery(ctx context.Context, queryString string, operationName string, variables map[string]interface{}, varTypes map[string]*introspection.Type) (context.Context, trace.TraceQueryFinishFunc)
```

### <a id="randomizeUserPasswordResult" href="#randomizeUserPasswordResult">type randomizeUserPasswordResult struct</a>

```
searchKey: graphqlbackend.randomizeUserPasswordResult
tags: [struct private]
```

```Go
type randomizeUserPasswordResult struct {
	userID int32
}
```

#### <a id="randomizeUserPasswordResult.ResetPasswordURL" href="#randomizeUserPasswordResult.ResetPasswordURL">func (r *randomizeUserPasswordResult) ResetPasswordURL(ctx context.Context) (*string, error)</a>

```
searchKey: graphqlbackend.randomizeUserPasswordResult.ResetPasswordURL
tags: [method private]
```

```Go
func (r *randomizeUserPasswordResult) ResetPasswordURL(ctx context.Context) (*string, error)
```

### <a id="rangeResolver" href="#rangeResolver">type rangeResolver struct</a>

```
searchKey: graphqlbackend.rangeResolver
tags: [struct private]
```

```Go
type rangeResolver struct{ lspRange lsp.Range }
```

#### <a id="rangeResolver.End" href="#rangeResolver.End">func (r *rangeResolver) End() PositionResolver</a>

```
searchKey: graphqlbackend.rangeResolver.End
tags: [method private]
```

```Go
func (r *rangeResolver) End() PositionResolver
```

#### <a id="rangeResolver.Start" href="#rangeResolver.Start">func (r *rangeResolver) Start() PositionResolver</a>

```
searchKey: graphqlbackend.rangeResolver.Start
tags: [method private]
```

```Go
func (r *rangeResolver) Start() PositionResolver
```

#### <a id="rangeResolver.end" href="#rangeResolver.end">func (r *rangeResolver) end() *positionResolver</a>

```
searchKey: graphqlbackend.rangeResolver.end
tags: [method private]
```

```Go
func (r *rangeResolver) end() *positionResolver
```

#### <a id="rangeResolver.start" href="#rangeResolver.start">func (r *rangeResolver) start() *positionResolver</a>

```
searchKey: graphqlbackend.rangeResolver.start
tags: [method private]
```

```Go
func (r *rangeResolver) start() *positionResolver
```

#### <a id="rangeResolver.urlFragment" href="#rangeResolver.urlFragment">func (r *rangeResolver) urlFragment() string</a>

```
searchKey: graphqlbackend.rangeResolver.urlFragment
tags: [method private]
```

```Go
func (r *rangeResolver) urlFragment() string
```

### <a id="refsArgs" href="#refsArgs">type refsArgs struct</a>

```
searchKey: graphqlbackend.refsArgs
tags: [struct private]
```

```Go
type refsArgs struct {
	graphqlutil.ConnectionArgs
	Query       *string
	Type        *string
	OrderBy     *string
	Interactive bool
}
```

### <a id="repoGroup" href="#repoGroup">type repoGroup struct</a>

```
searchKey: graphqlbackend.repoGroup
tags: [struct private]
```

```Go
type repoGroup struct {
	name         string
	repositories []api.RepoName
}
```

#### <a id="repoGroup.Name" href="#repoGroup.Name">func (g repoGroup) Name() string</a>

```
searchKey: graphqlbackend.repoGroup.Name
tags: [method private]
```

```Go
func (g repoGroup) Name() string
```

#### <a id="repoGroup.Repositories" href="#repoGroup.Repositories">func (g repoGroup) Repositories() []string</a>

```
searchKey: graphqlbackend.repoGroup.Repositories
tags: [method private]
```

```Go
func (g repoGroup) Repositories() []string
```

### <a id="repoLister" href="#repoLister">type repoLister interface</a>

```
searchKey: graphqlbackend.repoLister
tags: [interface private]
```

```Go
type repoLister interface {
	List(ctx context.Context, q zoektquery.Q) (*zoekt.RepoList, error)
}
```

### <a id="repoListerMock" href="#repoListerMock">type repoListerMock struct{}</a>

```
searchKey: graphqlbackend.repoListerMock
tags: [struct private]
```

```Go
type repoListerMock struct{}
```

#### <a id="repoListerMock.List" href="#repoListerMock.List">func (r repoListerMock) List(ctx context.Context, q zoektquery.Q) (*zoekt.RepoList, error)</a>

```
searchKey: graphqlbackend.repoListerMock.List
tags: [method private]
```

```Go
func (r repoListerMock) List(ctx context.Context, q zoektquery.Q) (*zoekt.RepoList, error)
```

### <a id="repoPaginationPlan" href="#repoPaginationPlan">type repoPaginationPlan struct</a>

```
searchKey: graphqlbackend.repoPaginationPlan
tags: [struct private]
```

```Go
type repoPaginationPlan struct {
	// pagination is the pagination request we're trying to fulfill.
	pagination *run.SearchPaginationInfo

	// repositories is the exhaustive and complete list of sorted repositories
	// to be searched over multiple requests.
	repositories []*search.RepositoryRevisions

	// parameters for controlling the size of batches that the executor is
	// called to search. The final batch size is calculated as:
	//
	// 	batchSize = numTotalReposOnSourcegraph() / searchBucketDivisor
	//
	// With the additional constraint that it must be at least min and no
	// larger than max.
	searchBucketDivisor              int
	searchBucketMin, searchBucketMax int

	mockNumTotalRepos func() int
}
```

repoPaginationPlan describes a plan for executing a search function that searches only over a set of repositories (i.e. the search function offers no pagination or result-level pagination capabilities) to provide result-level pagination. That is, if you have a function which can provide a complete list of results for a given repository, this planner can be used to implement result-level pagination on top of that function. 

It does this by searching over a globally-sorted list of repositories in batches. 

#### <a id="repoPaginationPlan.execute" href="#repoPaginationPlan.execute">func (p *repoPaginationPlan) execute(ctx context.Context, repoStore *database.RepoStore, exec executor) (c *run.SearchCursor, results []result.Match, common *streaming.Stats, err error)</a>

```
searchKey: graphqlbackend.repoPaginationPlan.execute
tags: [method private]
```

```Go
func (p *repoPaginationPlan) execute(ctx context.Context, repoStore *database.RepoStore, exec executor) (c *run.SearchCursor, results []result.Match, common *streaming.Stats, err error)
```

execute executes the repository pagination plan by invoking the executor to search batches of repositories. 

If the executor returns any error, the search will be cancelled and the error returned. 

### <a id="repoSetter" href="#repoSetter">type repoSetter interface</a>

```
searchKey: graphqlbackend.repoSetter
tags: [interface private]
```

```Go
type repoSetter interface {
	SetRepos(all bool, repos []string) error
}
```

### <a id="repositoryArgs" href="#repositoryArgs">type repositoryArgs struct</a>

```
searchKey: graphqlbackend.repositoryArgs
tags: [struct private]
```

```Go
type repositoryArgs struct {
	graphqlutil.ConnectionArgs
	Query       *string
	Names       *[]string
	Cloned      bool
	NotCloned   bool
	Indexed     bool
	NotIndexed  bool
	FailedFetch bool
	OrderBy     string
	Descending  bool
	After       *string
}
```

### <a id="repositoryConnectionResolver" href="#repositoryConnectionResolver">type repositoryConnectionResolver struct</a>

```
searchKey: graphqlbackend.repositoryConnectionResolver
tags: [struct private]
```

```Go
type repositoryConnectionResolver struct {
	db          dbutil.DB
	opt         database.ReposListOptions
	cloned      bool
	notCloned   bool
	indexed     bool
	notIndexed  bool
	failedFetch bool

	// cache results because they are used by multiple fields
	once  sync.Once
	repos []*types.Repo
	err   error
}
```

#### <a id="repositoryConnectionResolver.Nodes" href="#repositoryConnectionResolver.Nodes">func (r *repositoryConnectionResolver) Nodes(ctx context.Context) ([]*RepositoryResolver, error)</a>

```
searchKey: graphqlbackend.repositoryConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *repositoryConnectionResolver) Nodes(ctx context.Context) ([]*RepositoryResolver, error)
```

#### <a id="repositoryConnectionResolver.PageInfo" href="#repositoryConnectionResolver.PageInfo">func (r *repositoryConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.repositoryConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *repositoryConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="repositoryConnectionResolver.TotalCount" href="#repositoryConnectionResolver.TotalCount">func (r *repositoryConnectionResolver) TotalCount(ctx context.Context, args *TotalCountArgs) (countptr *int32, err error)</a>

```
searchKey: graphqlbackend.repositoryConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *repositoryConnectionResolver) TotalCount(ctx context.Context, args *TotalCountArgs) (countptr *int32, err error)
```

#### <a id="repositoryConnectionResolver.compute" href="#repositoryConnectionResolver.compute">func (r *repositoryConnectionResolver) compute(ctx context.Context) ([]*types.Repo, error)</a>

```
searchKey: graphqlbackend.repositoryConnectionResolver.compute
tags: [method private]
```

```Go
func (r *repositoryConnectionResolver) compute(ctx context.Context) ([]*types.Repo, error)
```

### <a id="repositoryContributorConnectionResolver" href="#repositoryContributorConnectionResolver">type repositoryContributorConnectionResolver struct</a>

```
searchKey: graphqlbackend.repositoryContributorConnectionResolver
tags: [struct private]
```

```Go
type repositoryContributorConnectionResolver struct {
	db    dbutil.DB
	args  repositoryContributorsArgs
	first *int32

	repo *RepositoryResolver

	// cache result because it is used by multiple fields
	once    sync.Once
	results []*git.PersonCount
	err     error
}
```

#### <a id="repositoryContributorConnectionResolver.Nodes" href="#repositoryContributorConnectionResolver.Nodes">func (r *repositoryContributorConnectionResolver) Nodes(ctx context.Context) ([]*repositoryContributorResolver, error)</a>

```
searchKey: graphqlbackend.repositoryContributorConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *repositoryContributorConnectionResolver) Nodes(ctx context.Context) ([]*repositoryContributorResolver, error)
```

#### <a id="repositoryContributorConnectionResolver.PageInfo" href="#repositoryContributorConnectionResolver.PageInfo">func (r *repositoryContributorConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.repositoryContributorConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *repositoryContributorConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="repositoryContributorConnectionResolver.TotalCount" href="#repositoryContributorConnectionResolver.TotalCount">func (r *repositoryContributorConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.repositoryContributorConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *repositoryContributorConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="repositoryContributorConnectionResolver.compute" href="#repositoryContributorConnectionResolver.compute">func (r *repositoryContributorConnectionResolver) compute(ctx context.Context) ([]*git.PersonCount, error)</a>

```
searchKey: graphqlbackend.repositoryContributorConnectionResolver.compute
tags: [method private]
```

```Go
func (r *repositoryContributorConnectionResolver) compute(ctx context.Context) ([]*git.PersonCount, error)
```

### <a id="repositoryContributorResolver" href="#repositoryContributorResolver">type repositoryContributorResolver struct</a>

```
searchKey: graphqlbackend.repositoryContributorResolver
tags: [struct private]
```

```Go
type repositoryContributorResolver struct {
	db    dbutil.DB
	name  string
	email string
	count int32

	repo *RepositoryResolver
	args repositoryContributorsArgs
}
```

#### <a id="repositoryContributorResolver.Commits" href="#repositoryContributorResolver.Commits">func (r *repositoryContributorResolver) Commits(args *struct {...</a>

```
searchKey: graphqlbackend.repositoryContributorResolver.Commits
tags: [method private]
```

```Go
func (r *repositoryContributorResolver) Commits(args *struct {
	First *int32
}) *gitCommitConnectionResolver
```

#### <a id="repositoryContributorResolver.Count" href="#repositoryContributorResolver.Count">func (r *repositoryContributorResolver) Count() int32</a>

```
searchKey: graphqlbackend.repositoryContributorResolver.Count
tags: [method private]
```

```Go
func (r *repositoryContributorResolver) Count() int32
```

#### <a id="repositoryContributorResolver.Person" href="#repositoryContributorResolver.Person">func (r *repositoryContributorResolver) Person() *PersonResolver</a>

```
searchKey: graphqlbackend.repositoryContributorResolver.Person
tags: [method private]
```

```Go
func (r *repositoryContributorResolver) Person() *PersonResolver
```

#### <a id="repositoryContributorResolver.Repository" href="#repositoryContributorResolver.Repository">func (r *repositoryContributorResolver) Repository() *RepositoryResolver</a>

```
searchKey: graphqlbackend.repositoryContributorResolver.Repository
tags: [method private]
```

```Go
func (r *repositoryContributorResolver) Repository() *RepositoryResolver
```

### <a id="repositoryContributorsArgs" href="#repositoryContributorsArgs">type repositoryContributorsArgs struct</a>

```
searchKey: graphqlbackend.repositoryContributorsArgs
tags: [struct private]
```

```Go
type repositoryContributorsArgs struct {
	RevisionRange *string
	After         *string
	Path          *string
}
```

### <a id="repositoryCursor" href="#repositoryCursor">type repositoryCursor struct</a>

```
searchKey: graphqlbackend.repositoryCursor
tags: [struct private]
```

```Go
type repositoryCursor struct {
	Column    string
	Value     string
	Direction string
}
```

A repositoryCursor can be provided to a `repositories` query for efficient cursor-based pagination (vs. LIMIT/OFFSET). 

#### <a id="unmarshalRepositoryCursor" href="#unmarshalRepositoryCursor">func unmarshalRepositoryCursor(cursor *string) (*repositoryCursor, error)</a>

```
searchKey: graphqlbackend.unmarshalRepositoryCursor
tags: [function private]
```

```Go
func unmarshalRepositoryCursor(cursor *string) (*repositoryCursor, error)
```

unmarshalRepositoryCursor unmarshals a repository pagination cursor. 

### <a id="repositoryMirrorInfoResolver" href="#repositoryMirrorInfoResolver">type repositoryMirrorInfoResolver struct</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver
tags: [struct private]
```

```Go
type repositoryMirrorInfoResolver struct {
	repository *RepositoryResolver
	db         dbutil.DB

	// memoize the repo-updater RepoUpdateSchedulerInfo call
	repoUpdateSchedulerInfoOnce   sync.Once
	repoUpdateSchedulerInfoResult *repoupdaterprotocol.RepoUpdateSchedulerInfoResult
	repoUpdateSchedulerInfoErr    error

	// memoize the gitserver RepoInfo call
	repoInfoOnce     sync.Once
	repoInfoResponse *protocol.RepoInfo
	repoInfoErr      error
}
```

#### <a id="repositoryMirrorInfoResolver.CloneInProgress" href="#repositoryMirrorInfoResolver.CloneInProgress">func (r *repositoryMirrorInfoResolver) CloneInProgress(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver.CloneInProgress
tags: [method private]
```

```Go
func (r *repositoryMirrorInfoResolver) CloneInProgress(ctx context.Context) (bool, error)
```

#### <a id="repositoryMirrorInfoResolver.CloneProgress" href="#repositoryMirrorInfoResolver.CloneProgress">func (r *repositoryMirrorInfoResolver) CloneProgress(ctx context.Context) (*string, error)</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver.CloneProgress
tags: [method private]
```

```Go
func (r *repositoryMirrorInfoResolver) CloneProgress(ctx context.Context) (*string, error)
```

#### <a id="repositoryMirrorInfoResolver.Cloned" href="#repositoryMirrorInfoResolver.Cloned">func (r *repositoryMirrorInfoResolver) Cloned(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver.Cloned
tags: [method private]
```

```Go
func (r *repositoryMirrorInfoResolver) Cloned(ctx context.Context) (bool, error)
```

#### <a id="repositoryMirrorInfoResolver.RemoteURL" href="#repositoryMirrorInfoResolver.RemoteURL">func (r *repositoryMirrorInfoResolver) RemoteURL(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver.RemoteURL
tags: [method private]
```

```Go
func (r *repositoryMirrorInfoResolver) RemoteURL(ctx context.Context) (string, error)
```

#### <a id="repositoryMirrorInfoResolver.UpdateQueue" href="#repositoryMirrorInfoResolver.UpdateQueue">func (r *repositoryMirrorInfoResolver) UpdateQueue(ctx context.Context) (*updateQueueResolver, error)</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver.UpdateQueue
tags: [method private]
```

```Go
func (r *repositoryMirrorInfoResolver) UpdateQueue(ctx context.Context) (*updateQueueResolver, error)
```

#### <a id="repositoryMirrorInfoResolver.UpdateSchedule" href="#repositoryMirrorInfoResolver.UpdateSchedule">func (r *repositoryMirrorInfoResolver) UpdateSchedule(ctx context.Context) (*updateScheduleResolver, error)</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver.UpdateSchedule
tags: [method private]
```

```Go
func (r *repositoryMirrorInfoResolver) UpdateSchedule(ctx context.Context) (*updateScheduleResolver, error)
```

#### <a id="repositoryMirrorInfoResolver.UpdatedAt" href="#repositoryMirrorInfoResolver.UpdatedAt">func (r *repositoryMirrorInfoResolver) UpdatedAt(ctx context.Context) (*DateTime, error)</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver.UpdatedAt
tags: [method private]
```

```Go
func (r *repositoryMirrorInfoResolver) UpdatedAt(ctx context.Context) (*DateTime, error)
```

#### <a id="repositoryMirrorInfoResolver.gitserverRepoInfo" href="#repositoryMirrorInfoResolver.gitserverRepoInfo">func (r *repositoryMirrorInfoResolver) gitserverRepoInfo(ctx context.Context) (*protocol.RepoInfo, error)</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver.gitserverRepoInfo
tags: [method private]
```

```Go
func (r *repositoryMirrorInfoResolver) gitserverRepoInfo(ctx context.Context) (*protocol.RepoInfo, error)
```

#### <a id="repositoryMirrorInfoResolver.repoUpdateSchedulerInfo" href="#repositoryMirrorInfoResolver.repoUpdateSchedulerInfo">func (r *repositoryMirrorInfoResolver) repoUpdateSchedulerInfo(ctx context.Context) (*repoupdaterprotocol.RepoUpdateSchedulerInfoResult, error)</a>

```
searchKey: graphqlbackend.repositoryMirrorInfoResolver.repoUpdateSchedulerInfo
tags: [method private]
```

```Go
func (r *repositoryMirrorInfoResolver) repoUpdateSchedulerInfo(ctx context.Context) (*repoupdaterprotocol.RepoUpdateSchedulerInfoResult, error)
```

### <a id="repositoryRedirect" href="#repositoryRedirect">type repositoryRedirect struct</a>

```
searchKey: graphqlbackend.repositoryRedirect
tags: [struct private]
```

```Go
type repositoryRedirect struct {
	repo     *RepositoryResolver
	redirect *RedirectResolver
}
```

#### <a id="repositoryRedirect.ToRedirect" href="#repositoryRedirect.ToRedirect">func (r *repositoryRedirect) ToRedirect() (*RedirectResolver, bool)</a>

```
searchKey: graphqlbackend.repositoryRedirect.ToRedirect
tags: [method private]
```

```Go
func (r *repositoryRedirect) ToRedirect() (*RedirectResolver, bool)
```

#### <a id="repositoryRedirect.ToRepository" href="#repositoryRedirect.ToRepository">func (r *repositoryRedirect) ToRepository() (*RepositoryResolver, bool)</a>

```
searchKey: graphqlbackend.repositoryRedirect.ToRepository
tags: [method private]
```

```Go
func (r *repositoryRedirect) ToRepository() (*RepositoryResolver, bool)
```

### <a id="repositoryStatsResolver" href="#repositoryStatsResolver">type repositoryStatsResolver struct</a>

```
searchKey: graphqlbackend.repositoryStatsResolver
tags: [struct private]
```

```Go
type repositoryStatsResolver struct {
	gitDirBytes       uint64
	indexedLinesCount uint64
}
```

#### <a id="repositoryStatsResolver.GitDirBytes" href="#repositoryStatsResolver.GitDirBytes">func (r *repositoryStatsResolver) GitDirBytes() BigInt</a>

```
searchKey: graphqlbackend.repositoryStatsResolver.GitDirBytes
tags: [method private]
```

```Go
func (r *repositoryStatsResolver) GitDirBytes() BigInt
```

#### <a id="repositoryStatsResolver.IndexedLinesCount" href="#repositoryStatsResolver.IndexedLinesCount">func (r *repositoryStatsResolver) IndexedLinesCount() BigInt</a>

```
searchKey: graphqlbackend.repositoryStatsResolver.IndexedLinesCount
tags: [method private]
```

```Go
func (r *repositoryStatsResolver) IndexedLinesCount() BigInt
```

### <a id="repositorySuggestionResolver" href="#repositorySuggestionResolver">type repositorySuggestionResolver struct</a>

```
searchKey: graphqlbackend.repositorySuggestionResolver
tags: [struct private]
```

```Go
type repositorySuggestionResolver struct {
	baseSuggestionResolver
	repo  *RepositoryResolver
	score int
}
```

repositorySuggestionResolver implements searchSuggestionResolver for RepositoryResolver 

#### <a id="repositorySuggestionResolver.Key" href="#repositorySuggestionResolver.Key">func (r repositorySuggestionResolver) Key() suggestionKey</a>

```
searchKey: graphqlbackend.repositorySuggestionResolver.Key
tags: [method private]
```

```Go
func (r repositorySuggestionResolver) Key() suggestionKey
```

#### <a id="repositorySuggestionResolver.Label" href="#repositorySuggestionResolver.Label">func (r repositorySuggestionResolver) Label() string</a>

```
searchKey: graphqlbackend.repositorySuggestionResolver.Label
tags: [method private]
```

```Go
func (r repositorySuggestionResolver) Label() string
```

#### <a id="repositorySuggestionResolver.Length" href="#repositorySuggestionResolver.Length">func (r repositorySuggestionResolver) Length() int</a>

```
searchKey: graphqlbackend.repositorySuggestionResolver.Length
tags: [method private]
```

```Go
func (r repositorySuggestionResolver) Length() int
```

#### <a id="repositorySuggestionResolver.Score" href="#repositorySuggestionResolver.Score">func (r repositorySuggestionResolver) Score() int</a>

```
searchKey: graphqlbackend.repositorySuggestionResolver.Score
tags: [method private]
```

```Go
func (r repositorySuggestionResolver) Score() int
```

#### <a id="repositorySuggestionResolver.ToRepository" href="#repositorySuggestionResolver.ToRepository">func (r repositorySuggestionResolver) ToRepository() (*RepositoryResolver, bool)</a>

```
searchKey: graphqlbackend.repositorySuggestionResolver.ToRepository
tags: [method private]
```

```Go
func (r repositorySuggestionResolver) ToRepository() (*RepositoryResolver, bool)
```

### <a id="repositoryTextSearchIndexResolver" href="#repositoryTextSearchIndexResolver">type repositoryTextSearchIndexResolver struct</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexResolver
tags: [struct private]
```

```Go
type repositoryTextSearchIndexResolver struct {
	repo   *RepositoryResolver
	client repoLister

	once  sync.Once
	entry *zoekt.RepoListEntry
	err   error
}
```

#### <a id="repositoryTextSearchIndexResolver.Refs" href="#repositoryTextSearchIndexResolver.Refs">func (r *repositoryTextSearchIndexResolver) Refs(ctx context.Context) ([]*repositoryTextSearchIndexedRef, error)</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexResolver.Refs
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexResolver) Refs(ctx context.Context) ([]*repositoryTextSearchIndexedRef, error)
```

#### <a id="repositoryTextSearchIndexResolver.Repository" href="#repositoryTextSearchIndexResolver.Repository">func (r *repositoryTextSearchIndexResolver) Repository() *RepositoryResolver</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexResolver.Repository
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexResolver) Repository() *RepositoryResolver
```

#### <a id="repositoryTextSearchIndexResolver.Status" href="#repositoryTextSearchIndexResolver.Status">func (r *repositoryTextSearchIndexResolver) Status(ctx context.Context) (*repositoryTextSearchIndexStatus, error)</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexResolver.Status
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexResolver) Status(ctx context.Context) (*repositoryTextSearchIndexStatus, error)
```

#### <a id="repositoryTextSearchIndexResolver.resolve" href="#repositoryTextSearchIndexResolver.resolve">func (r *repositoryTextSearchIndexResolver) resolve(ctx context.Context) (*zoekt.RepoListEntry, error)</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexResolver.resolve
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexResolver) resolve(ctx context.Context) (*zoekt.RepoListEntry, error)
```

### <a id="repositoryTextSearchIndexStatus" href="#repositoryTextSearchIndexStatus">type repositoryTextSearchIndexStatus struct</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexStatus
tags: [struct private]
```

```Go
type repositoryTextSearchIndexStatus struct {
	entry zoekt.RepoListEntry
}
```

#### <a id="repositoryTextSearchIndexStatus.ContentByteSize" href="#repositoryTextSearchIndexStatus.ContentByteSize">func (r *repositoryTextSearchIndexStatus) ContentByteSize() int32</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexStatus.ContentByteSize
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexStatus) ContentByteSize() int32
```

#### <a id="repositoryTextSearchIndexStatus.ContentFilesCount" href="#repositoryTextSearchIndexStatus.ContentFilesCount">func (r *repositoryTextSearchIndexStatus) ContentFilesCount() int32</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexStatus.ContentFilesCount
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexStatus) ContentFilesCount() int32
```

#### <a id="repositoryTextSearchIndexStatus.DefaultBranchNewLinesCount" href="#repositoryTextSearchIndexStatus.DefaultBranchNewLinesCount">func (r *repositoryTextSearchIndexStatus) DefaultBranchNewLinesCount() int32</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexStatus.DefaultBranchNewLinesCount
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexStatus) DefaultBranchNewLinesCount() int32
```

#### <a id="repositoryTextSearchIndexStatus.IndexByteSize" href="#repositoryTextSearchIndexStatus.IndexByteSize">func (r *repositoryTextSearchIndexStatus) IndexByteSize() int32</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexStatus.IndexByteSize
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexStatus) IndexByteSize() int32
```

#### <a id="repositoryTextSearchIndexStatus.IndexShardsCount" href="#repositoryTextSearchIndexStatus.IndexShardsCount">func (r *repositoryTextSearchIndexStatus) IndexShardsCount() int32</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexStatus.IndexShardsCount
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexStatus) IndexShardsCount() int32
```

#### <a id="repositoryTextSearchIndexStatus.NewLinesCount" href="#repositoryTextSearchIndexStatus.NewLinesCount">func (r *repositoryTextSearchIndexStatus) NewLinesCount() int32</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexStatus.NewLinesCount
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexStatus) NewLinesCount() int32
```

#### <a id="repositoryTextSearchIndexStatus.OtherBranchesNewLinesCount" href="#repositoryTextSearchIndexStatus.OtherBranchesNewLinesCount">func (r *repositoryTextSearchIndexStatus) OtherBranchesNewLinesCount() int32</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexStatus.OtherBranchesNewLinesCount
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexStatus) OtherBranchesNewLinesCount() int32
```

#### <a id="repositoryTextSearchIndexStatus.UpdatedAt" href="#repositoryTextSearchIndexStatus.UpdatedAt">func (r *repositoryTextSearchIndexStatus) UpdatedAt() DateTime</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexStatus.UpdatedAt
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexStatus) UpdatedAt() DateTime
```

### <a id="repositoryTextSearchIndexedRef" href="#repositoryTextSearchIndexedRef">type repositoryTextSearchIndexedRef struct</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexedRef
tags: [struct private]
```

```Go
type repositoryTextSearchIndexedRef struct {
	ref           *GitRefResolver
	indexedCommit GitObjectID
}
```

#### <a id="repositoryTextSearchIndexedRef.Current" href="#repositoryTextSearchIndexedRef.Current">func (r *repositoryTextSearchIndexedRef) Current(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexedRef.Current
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexedRef) Current(ctx context.Context) (bool, error)
```

#### <a id="repositoryTextSearchIndexedRef.Indexed" href="#repositoryTextSearchIndexedRef.Indexed">func (r *repositoryTextSearchIndexedRef) Indexed() bool</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexedRef.Indexed
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexedRef) Indexed() bool
```

#### <a id="repositoryTextSearchIndexedRef.IndexedCommit" href="#repositoryTextSearchIndexedRef.IndexedCommit">func (r *repositoryTextSearchIndexedRef) IndexedCommit() *gitObject</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexedRef.IndexedCommit
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexedRef) IndexedCommit() *gitObject
```

#### <a id="repositoryTextSearchIndexedRef.Ref" href="#repositoryTextSearchIndexedRef.Ref">func (r *repositoryTextSearchIndexedRef) Ref() *GitRefResolver</a>

```
searchKey: graphqlbackend.repositoryTextSearchIndexedRef.Ref
tags: [method private]
```

```Go
func (r *repositoryTextSearchIndexedRef) Ref() *GitRefResolver
```

### <a id="repoupdaterClient" href="#repoupdaterClient">type repoupdaterClient interface</a>

```
searchKey: graphqlbackend.repoupdaterClient
tags: [interface private]
```

```Go
type repoupdaterClient interface {
	SyncExternalService(ctx context.Context, svc api.ExternalService) (*protocol.ExternalServiceSyncResult, error)
}
```

repoupdaterClient is an interface with only the methods required in syncExternalService. As a result instead of using the entire repoupdater client implementation, we use a thinner API which only needs the SyncExternalService method to be defined on the object. 

### <a id="resolveRepositoriesOpts" href="#resolveRepositoriesOpts">type resolveRepositoriesOpts struct</a>

```
searchKey: graphqlbackend.resolveRepositoriesOpts
tags: [struct private]
```

```Go
type resolveRepositoriesOpts struct {
	effectiveRepoFieldValues []string

	limit int // Maximum repositories to return
}
```

### <a id="roundTripFunc" href="#roundTripFunc">type roundTripFunc func(*net/http.Request) (*net/http.Response, error)</a>

```
searchKey: graphqlbackend.roundTripFunc
tags: [function private]
```

```Go
type roundTripFunc func(*http.Request) (*http.Response, error)
```

#### <a id="roundTripFunc.RoundTrip" href="#roundTripFunc.RoundTrip">func (f roundTripFunc) RoundTrip(r *http.Request) (*http.Response, error)</a>

```
searchKey: graphqlbackend.roundTripFunc.RoundTrip
tags: [method private]
```

```Go
func (f roundTripFunc) RoundTrip(r *http.Request) (*http.Response, error)
```

### <a id="savedSearchResolver" href="#savedSearchResolver">type savedSearchResolver struct</a>

```
searchKey: graphqlbackend.savedSearchResolver
tags: [struct private]
```

```Go
type savedSearchResolver struct {
	db dbutil.DB
	s  types.SavedSearch
}
```

#### <a id="savedSearchResolver.Description" href="#savedSearchResolver.Description">func (r savedSearchResolver) Description() string</a>

```
searchKey: graphqlbackend.savedSearchResolver.Description
tags: [method private]
```

```Go
func (r savedSearchResolver) Description() string
```

#### <a id="savedSearchResolver.ID" href="#savedSearchResolver.ID">func (r savedSearchResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.savedSearchResolver.ID
tags: [method private]
```

```Go
func (r savedSearchResolver) ID() graphql.ID
```

#### <a id="savedSearchResolver.Namespace" href="#savedSearchResolver.Namespace">func (r savedSearchResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)</a>

```
searchKey: graphqlbackend.savedSearchResolver.Namespace
tags: [method private]
```

```Go
func (r savedSearchResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)
```

#### <a id="savedSearchResolver.Notify" href="#savedSearchResolver.Notify">func (r savedSearchResolver) Notify() bool</a>

```
searchKey: graphqlbackend.savedSearchResolver.Notify
tags: [method private]
```

```Go
func (r savedSearchResolver) Notify() bool
```

#### <a id="savedSearchResolver.NotifySlack" href="#savedSearchResolver.NotifySlack">func (r savedSearchResolver) NotifySlack() bool</a>

```
searchKey: graphqlbackend.savedSearchResolver.NotifySlack
tags: [method private]
```

```Go
func (r savedSearchResolver) NotifySlack() bool
```

#### <a id="savedSearchResolver.Query" href="#savedSearchResolver.Query">func (r savedSearchResolver) Query() string</a>

```
searchKey: graphqlbackend.savedSearchResolver.Query
tags: [method private]
```

```Go
func (r savedSearchResolver) Query() string
```

#### <a id="savedSearchResolver.SlackWebhookURL" href="#savedSearchResolver.SlackWebhookURL">func (r savedSearchResolver) SlackWebhookURL() *string</a>

```
searchKey: graphqlbackend.savedSearchResolver.SlackWebhookURL
tags: [method private]
```

```Go
func (r savedSearchResolver) SlackWebhookURL() *string
```

### <a id="schemaResolver" href="#schemaResolver">type schemaResolver struct</a>

```
searchKey: graphqlbackend.schemaResolver
tags: [struct private]
```

```Go
type schemaResolver struct {
	BatchChangesResolver
	AuthzResolver
	CodeIntelResolver
	InsightsResolver
	CodeMonitorsResolver
	LicenseResolver
	DotcomRootResolver

	db                dbutil.DB
	repoupdaterClient *repoupdater.Client
	nodeByIDFns       map[string]NodeByIDFunc
}
```

schemaResolver handles all GraphQL queries for Sourcegraph. To do this, it uses subresolvers which are globals. Enterprise-only resolvers are assigned to a field of EnterpriseResolvers. 

#### <a id="newSchemaResolver" href="#newSchemaResolver">func newSchemaResolver(db dbutil.DB) *schemaResolver</a>

```
searchKey: graphqlbackend.newSchemaResolver
tags: [function private]
```

```Go
func newSchemaResolver(db dbutil.DB) *schemaResolver
```

newSchemaResolver will return a new schemaResolver using repoupdater.DefaultClient. 

#### <a id="schemaResolver.AddExternalService" href="#schemaResolver.AddExternalService">func (r *schemaResolver) AddExternalService(ctx context.Context, args *addExternalServiceArgs) (*externalServiceResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.AddExternalService
tags: [method private]
```

```Go
func (r *schemaResolver) AddExternalService(ctx context.Context, args *addExternalServiceArgs) (*externalServiceResolver, error)
```

#### <a id="schemaResolver.AddPhabricatorRepo" href="#schemaResolver.AddPhabricatorRepo">func (r *schemaResolver) AddPhabricatorRepo(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.AddPhabricatorRepo
tags: [method private]
```

```Go
func (r *schemaResolver) AddPhabricatorRepo(ctx context.Context, args *struct {
	Callsign string
	Name     *string
	// TODO(chris): Remove URI in favor of Name.
	URI *string
	URL string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.AddUserEmail" href="#schemaResolver.AddUserEmail">func (r *schemaResolver) AddUserEmail(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.AddUserEmail
tags: [method private]
```

```Go
func (r *schemaResolver) AddUserEmail(ctx context.Context, args *struct {
	User  graphql.ID
	Email string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.AddUserToOrganization" href="#schemaResolver.AddUserToOrganization">func (r *schemaResolver) AddUserToOrganization(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.AddUserToOrganization
tags: [method private]
```

```Go
func (r *schemaResolver) AddUserToOrganization(ctx context.Context, args *struct {
	Organization graphql.ID
	Username     string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.AffiliatedRepositories" href="#schemaResolver.AffiliatedRepositories">func (r *schemaResolver) AffiliatedRepositories(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.AffiliatedRepositories
tags: [method private]
```

```Go
func (r *schemaResolver) AffiliatedRepositories(ctx context.Context, args *struct {
	User     graphql.ID
	CodeHost *graphql.ID
	Query    *string
}) (*affiliatedRepositoriesConnection, error)
```

#### <a id="schemaResolver.AutoDefinedSearchContexts" href="#schemaResolver.AutoDefinedSearchContexts">func (r *schemaResolver) AutoDefinedSearchContexts(ctx context.Context) ([]*searchContextResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.AutoDefinedSearchContexts
tags: [method private]
```

```Go
func (r *schemaResolver) AutoDefinedSearchContexts(ctx context.Context) ([]*searchContextResolver, error)
```

#### <a id="schemaResolver.CheckMirrorRepositoryConnection" href="#schemaResolver.CheckMirrorRepositoryConnection">func (r *schemaResolver) CheckMirrorRepositoryConnection(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.CheckMirrorRepositoryConnection
tags: [method private]
```

```Go
func (r *schemaResolver) CheckMirrorRepositoryConnection(ctx context.Context, args *struct {
	Repository *graphql.ID
	Name       *string
}) (*checkMirrorRepositoryConnectionResult, error)
```

#### <a id="schemaResolver.ClientConfiguration" href="#schemaResolver.ClientConfiguration">func (r *schemaResolver) ClientConfiguration(ctx context.Context) (*clientConfigurationResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.ClientConfiguration
tags: [method private]
```

```Go
func (r *schemaResolver) ClientConfiguration(ctx context.Context) (*clientConfigurationResolver, error)
```

#### <a id="schemaResolver.CodeHostSyncDue" href="#schemaResolver.CodeHostSyncDue">func (r *schemaResolver) CodeHostSyncDue(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.CodeHostSyncDue
tags: [method private]
```

```Go
func (r *schemaResolver) CodeHostSyncDue(ctx context.Context, args *struct {
	IDs     []graphql.ID
	Seconds int32
}) (bool, error)
```

CodeHostSyncDue returns true if any of the supplied code hosts are due to sync now or within "seconds" from now. 

#### <a id="schemaResolver.ConfigurationMutation" href="#schemaResolver.ConfigurationMutation">func (r *schemaResolver) ConfigurationMutation(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.ConfigurationMutation
tags: [method private deprecated]
```

```Go
func (r *schemaResolver) ConfigurationMutation(ctx context.Context, args *struct {
	Input *settingsMutationGroupInput
}) (*settingsMutation, error)
```

Deprecated: in the GraphQL API 

#### <a id="schemaResolver.ConvertVersionContextToSearchContext" href="#schemaResolver.ConvertVersionContextToSearchContext">func (r *schemaResolver) ConvertVersionContextToSearchContext(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.ConvertVersionContextToSearchContext
tags: [method private]
```

```Go
func (r *schemaResolver) ConvertVersionContextToSearchContext(ctx context.Context, args *struct {
	Name string
}) (*searchContextResolver, error)
```

#### <a id="schemaResolver.CreateAccessToken" href="#schemaResolver.CreateAccessToken">func (r *schemaResolver) CreateAccessToken(ctx context.Context, args *createAccessTokenInput) (*createAccessTokenResult, error)</a>

```
searchKey: graphqlbackend.schemaResolver.CreateAccessToken
tags: [method private]
```

```Go
func (r *schemaResolver) CreateAccessToken(ctx context.Context, args *createAccessTokenInput) (*createAccessTokenResult, error)
```

#### <a id="schemaResolver.CreateFeatureFlag" href="#schemaResolver.CreateFeatureFlag">func (r *schemaResolver) CreateFeatureFlag(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.CreateFeatureFlag
tags: [method private]
```

```Go
func (r *schemaResolver) CreateFeatureFlag(ctx context.Context, args struct {
	Name               string
	Value              *bool
	RolloutBasisPoints *int32
}) (*FeatureFlagResolver, error)
```

#### <a id="schemaResolver.CreateFeatureFlagOverride" href="#schemaResolver.CreateFeatureFlagOverride">func (r *schemaResolver) CreateFeatureFlagOverride(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.CreateFeatureFlagOverride
tags: [method private]
```

```Go
func (r *schemaResolver) CreateFeatureFlagOverride(ctx context.Context, args struct {
	Namespace graphql.ID
	FlagName  string
	Value     bool
}) (*FeatureFlagOverrideResolver, error)
```

#### <a id="schemaResolver.CreateOrganization" href="#schemaResolver.CreateOrganization">func (r *schemaResolver) CreateOrganization(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.CreateOrganization
tags: [method private]
```

```Go
func (r *schemaResolver) CreateOrganization(ctx context.Context, args *struct {
	Name        string
	DisplayName *string
}) (*OrgResolver, error)
```

#### <a id="schemaResolver.CreatePassword" href="#schemaResolver.CreatePassword">func (r *schemaResolver) CreatePassword(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.CreatePassword
tags: [method private]
```

```Go
func (r *schemaResolver) CreatePassword(ctx context.Context, args *struct {
	NewPassword string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.CreateSavedSearch" href="#schemaResolver.CreateSavedSearch">func (r *schemaResolver) CreateSavedSearch(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.CreateSavedSearch
tags: [method private]
```

```Go
func (r *schemaResolver) CreateSavedSearch(ctx context.Context, args *struct {
	Description string
	Query       string
	NotifyOwner bool
	NotifySlack bool
	OrgID       *graphql.ID
	UserID      *graphql.ID
}) (*savedSearchResolver, error)
```

#### <a id="schemaResolver.CreateSearchContext" href="#schemaResolver.CreateSearchContext">func (r *schemaResolver) CreateSearchContext(ctx context.Context, args createSearchContextArgs) (*searchContextResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.CreateSearchContext
tags: [method private]
```

```Go
func (r *schemaResolver) CreateSearchContext(ctx context.Context, args createSearchContextArgs) (*searchContextResolver, error)
```

#### <a id="schemaResolver.CreateUser" href="#schemaResolver.CreateUser">func (r *schemaResolver) CreateUser(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.CreateUser
tags: [method private]
```

```Go
func (r *schemaResolver) CreateUser(ctx context.Context, args *struct {
	Username string
	Email    *string
}) (*createUserResult, error)
```

#### <a id="schemaResolver.CurrentUser" href="#schemaResolver.CurrentUser">func (r *schemaResolver) CurrentUser(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.CurrentUser
tags: [method private]
```

```Go
func (r *schemaResolver) CurrentUser(ctx context.Context) (*UserResolver, error)
```

#### <a id="schemaResolver.DeleteAccessToken" href="#schemaResolver.DeleteAccessToken">func (r *schemaResolver) DeleteAccessToken(ctx context.Context, args *deleteAccessTokenInput) (*EmptyResponse, error)</a>

```
searchKey: graphqlbackend.schemaResolver.DeleteAccessToken
tags: [method private]
```

```Go
func (r *schemaResolver) DeleteAccessToken(ctx context.Context, args *deleteAccessTokenInput) (*EmptyResponse, error)
```

#### <a id="schemaResolver.DeleteExternalAccount" href="#schemaResolver.DeleteExternalAccount">func (r *schemaResolver) DeleteExternalAccount(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.DeleteExternalAccount
tags: [method private]
```

```Go
func (r *schemaResolver) DeleteExternalAccount(ctx context.Context, args *struct {
	ExternalAccount graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.DeleteExternalService" href="#schemaResolver.DeleteExternalService">func (r *schemaResolver) DeleteExternalService(ctx context.Context, args *deleteExternalServiceArgs) (*EmptyResponse, error)</a>

```
searchKey: graphqlbackend.schemaResolver.DeleteExternalService
tags: [method private]
```

```Go
func (r *schemaResolver) DeleteExternalService(ctx context.Context, args *deleteExternalServiceArgs) (*EmptyResponse, error)
```

#### <a id="schemaResolver.DeleteFeatureFlag" href="#schemaResolver.DeleteFeatureFlag">func (r *schemaResolver) DeleteFeatureFlag(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.DeleteFeatureFlag
tags: [method private]
```

```Go
func (r *schemaResolver) DeleteFeatureFlag(ctx context.Context, args struct {
	Name string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.DeleteFeatureFlagOverride" href="#schemaResolver.DeleteFeatureFlagOverride">func (r *schemaResolver) DeleteFeatureFlagOverride(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.DeleteFeatureFlagOverride
tags: [method private]
```

```Go
func (r *schemaResolver) DeleteFeatureFlagOverride(ctx context.Context, args struct {
	ID graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.DeleteOrganization" href="#schemaResolver.DeleteOrganization">func (r *schemaResolver) DeleteOrganization(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.DeleteOrganization
tags: [method private]
```

```Go
func (r *schemaResolver) DeleteOrganization(ctx context.Context, args *struct {
	Organization graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.DeleteSavedSearch" href="#schemaResolver.DeleteSavedSearch">func (r *schemaResolver) DeleteSavedSearch(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.DeleteSavedSearch
tags: [method private]
```

```Go
func (r *schemaResolver) DeleteSavedSearch(ctx context.Context, args *struct {
	ID graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.DeleteSearchContext" href="#schemaResolver.DeleteSearchContext">func (r *schemaResolver) DeleteSearchContext(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.DeleteSearchContext
tags: [method private]
```

```Go
func (r *schemaResolver) DeleteSearchContext(ctx context.Context, args struct {
	ID graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.DeleteUser" href="#schemaResolver.DeleteUser">func (r *schemaResolver) DeleteUser(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.DeleteUser
tags: [method private]
```

```Go
func (r *schemaResolver) DeleteUser(ctx context.Context, args *struct {
	User graphql.ID
	Hard *bool
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.ExtensionRegistry" href="#schemaResolver.ExtensionRegistry">func (r *schemaResolver) ExtensionRegistry(ctx context.Context) (ExtensionRegistryResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.ExtensionRegistry
tags: [method private]
```

```Go
func (r *schemaResolver) ExtensionRegistry(ctx context.Context) (ExtensionRegistryResolver, error)
```

#### <a id="schemaResolver.ExternalServices" href="#schemaResolver.ExternalServices">func (r *schemaResolver) ExternalServices(ctx context.Context, args *ExternalServicesArgs) (*externalServiceConnectionResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.ExternalServices
tags: [method private]
```

```Go
func (r *schemaResolver) ExternalServices(ctx context.Context, args *ExternalServicesArgs) (*externalServiceConnectionResolver, error)
```

#### <a id="schemaResolver.FeatureFlags" href="#schemaResolver.FeatureFlags">func (r *schemaResolver) FeatureFlags(ctx context.Context) ([]*FeatureFlagResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.FeatureFlags
tags: [method private]
```

```Go
func (r *schemaResolver) FeatureFlags(ctx context.Context) ([]*FeatureFlagResolver, error)
```

#### <a id="schemaResolver.HighlightCode" href="#schemaResolver.HighlightCode">func (*schemaResolver) HighlightCode(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.HighlightCode
tags: [method private]
```

```Go
func (*schemaResolver) HighlightCode(ctx context.Context, args *struct {
	Code           string
	FuzzyLanguage  string
	DisableTimeout bool
	IsLightTheme   bool
}) (string, error)
```

#### <a id="schemaResolver.InvalidateSessionsByID" href="#schemaResolver.InvalidateSessionsByID">func (r *schemaResolver) InvalidateSessionsByID(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.InvalidateSessionsByID
tags: [method private]
```

```Go
func (r *schemaResolver) InvalidateSessionsByID(ctx context.Context, args *struct {
	UserID graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.InviteUserToOrganization" href="#schemaResolver.InviteUserToOrganization">func (r *schemaResolver) InviteUserToOrganization(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.InviteUserToOrganization
tags: [method private]
```

```Go
func (r *schemaResolver) InviteUserToOrganization(ctx context.Context, args *struct {
	Organization graphql.ID
	Username     string
}) (*inviteUserToOrganizationResult, error)
```

#### <a id="schemaResolver.IsSearchContextAvailable" href="#schemaResolver.IsSearchContextAvailable">func (r *schemaResolver) IsSearchContextAvailable(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.IsSearchContextAvailable
tags: [method private]
```

```Go
func (r *schemaResolver) IsSearchContextAvailable(ctx context.Context, args struct {
	Spec string
}) (bool, error)
```

#### <a id="schemaResolver.LogEvent" href="#schemaResolver.LogEvent">func (r *schemaResolver) LogEvent(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.LogEvent
tags: [method private]
```

```Go
func (r *schemaResolver) LogEvent(ctx context.Context, args *struct {
	Event          string
	UserCookieID   string
	FirstSourceURL *string
	URL            string
	Source         string
	Argument       *string
	CohortID       *string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.LogUserEvent" href="#schemaResolver.LogUserEvent">func (*schemaResolver) LogUserEvent(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.LogUserEvent
tags: [method private]
```

```Go
func (*schemaResolver) LogUserEvent(ctx context.Context, args *struct {
	Event        string
	UserCookieID string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.Namespace" href="#schemaResolver.Namespace">func (r *schemaResolver) Namespace(ctx context.Context, args *struct{ ID graphql.ID }) (*NamespaceResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.Namespace
tags: [method private]
```

```Go
func (r *schemaResolver) Namespace(ctx context.Context, args *struct{ ID graphql.ID }) (*NamespaceResolver, error)
```

#### <a id="schemaResolver.NamespaceByName" href="#schemaResolver.NamespaceByName">func (r *schemaResolver) NamespaceByName(ctx context.Context, args *struct{ Name string }) (*NamespaceResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.NamespaceByName
tags: [method private]
```

```Go
func (r *schemaResolver) NamespaceByName(ctx context.Context, args *struct{ Name string }) (*NamespaceResolver, error)
```

#### <a id="schemaResolver.Node" href="#schemaResolver.Node">func (r *schemaResolver) Node(ctx context.Context, args *struct{ ID graphql.ID }) (*NodeResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.Node
tags: [method private]
```

```Go
func (r *schemaResolver) Node(ctx context.Context, args *struct{ ID graphql.ID }) (*NodeResolver, error)
```

#### <a id="schemaResolver.Org" href="#schemaResolver.Org">func (r *schemaResolver) Org(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.Org
tags: [method private deprecated]
```

```Go
func (r *schemaResolver) Org(ctx context.Context, args *struct {
	ID graphql.ID
}) (*OrgResolver, error)
```

Deprecated: Org is only in use by sourcegraph/src. Use Node to look up an org by its graphql.ID instead. 

#### <a id="schemaResolver.Organization" href="#schemaResolver.Organization">func (r *schemaResolver) Organization(ctx context.Context, args struct{ Name string }) (*OrgResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.Organization
tags: [method private]
```

```Go
func (r *schemaResolver) Organization(ctx context.Context, args struct{ Name string }) (*OrgResolver, error)
```

#### <a id="schemaResolver.Organizations" href="#schemaResolver.Organizations">func (r *schemaResolver) Organizations(args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.Organizations
tags: [method private]
```

```Go
func (r *schemaResolver) Organizations(args *struct {
	graphqlutil.ConnectionArgs
	Query *string
}) *orgConnectionResolver
```

#### <a id="schemaResolver.OutOfBandMigrationByID" href="#schemaResolver.OutOfBandMigrationByID">func (r *schemaResolver) OutOfBandMigrationByID(ctx context.Context, id graphql.ID) (*outOfBandMigrationResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.OutOfBandMigrationByID
tags: [method private]
```

```Go
func (r *schemaResolver) OutOfBandMigrationByID(ctx context.Context, id graphql.ID) (*outOfBandMigrationResolver, error)
```

OutOfBandMigrationByID resolves a single out-of-band migration by its identifier. 

#### <a id="schemaResolver.OutOfBandMigrations" href="#schemaResolver.OutOfBandMigrations">func (r *schemaResolver) OutOfBandMigrations(ctx context.Context) ([]*outOfBandMigrationResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.OutOfBandMigrations
tags: [method private]
```

```Go
func (r *schemaResolver) OutOfBandMigrations(ctx context.Context) ([]*outOfBandMigrationResolver, error)
```

OutOfBandMigrations resolves all registered single out-of-band migrations. 

#### <a id="schemaResolver.ParseSearchQuery" href="#schemaResolver.ParseSearchQuery">func (r *schemaResolver) ParseSearchQuery(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.ParseSearchQuery
tags: [method private]
```

```Go
func (r *schemaResolver) ParseSearchQuery(ctx context.Context, args *struct {
	Query       string
	PatternType string
}) (*JSONValue, error)
```

#### <a id="schemaResolver.PhabricatorRepo" href="#schemaResolver.PhabricatorRepo">func (r *schemaResolver) PhabricatorRepo(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.PhabricatorRepo
tags: [method private]
```

```Go
func (r *schemaResolver) PhabricatorRepo(ctx context.Context, args *struct {
	Name *string
	// TODO(chris): Remove URI in favor of Name.
	URI *string
}) (*phabricatorRepoResolver, error)
```

#### <a id="schemaResolver.RandomizeUserPassword" href="#schemaResolver.RandomizeUserPassword">func (r *schemaResolver) RandomizeUserPassword(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.RandomizeUserPassword
tags: [method private]
```

```Go
func (r *schemaResolver) RandomizeUserPassword(ctx context.Context, args *struct {
	User graphql.ID
}) (*randomizeUserPasswordResult, error)
```

#### <a id="schemaResolver.ReloadSite" href="#schemaResolver.ReloadSite">func (r *schemaResolver) ReloadSite(ctx context.Context) (*EmptyResponse, error)</a>

```
searchKey: graphqlbackend.schemaResolver.ReloadSite
tags: [method private]
```

```Go
func (r *schemaResolver) ReloadSite(ctx context.Context) (*EmptyResponse, error)
```

#### <a id="schemaResolver.RemoveUserEmail" href="#schemaResolver.RemoveUserEmail">func (r *schemaResolver) RemoveUserEmail(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.RemoveUserEmail
tags: [method private]
```

```Go
func (r *schemaResolver) RemoveUserEmail(ctx context.Context, args *struct {
	User  graphql.ID
	Email string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.RemoveUserFromOrganization" href="#schemaResolver.RemoveUserFromOrganization">func (r *schemaResolver) RemoveUserFromOrganization(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.RemoveUserFromOrganization
tags: [method private]
```

```Go
func (r *schemaResolver) RemoveUserFromOrganization(ctx context.Context, args *struct {
	User         graphql.ID
	Organization graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.RenderMarkdown" href="#schemaResolver.RenderMarkdown">func (*schemaResolver) RenderMarkdown(args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.RenderMarkdown
tags: [method private]
```

```Go
func (*schemaResolver) RenderMarkdown(args *struct {
	Markdown string
	Options  *markdownOptions
}) string
```

#### <a id="schemaResolver.RepoGroups" href="#schemaResolver.RepoGroups">func (r *schemaResolver) RepoGroups(ctx context.Context) ([]*repoGroup, error)</a>

```
searchKey: graphqlbackend.schemaResolver.RepoGroups
tags: [method private]
```

```Go
func (r *schemaResolver) RepoGroups(ctx context.Context) ([]*repoGroup, error)
```

#### <a id="schemaResolver.Repositories" href="#schemaResolver.Repositories">func (r *schemaResolver) Repositories(args *repositoryArgs) (*repositoryConnectionResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.Repositories
tags: [method private]
```

```Go
func (r *schemaResolver) Repositories(args *repositoryArgs) (*repositoryConnectionResolver, error)
```

#### <a id="schemaResolver.Repository" href="#schemaResolver.Repository">func (r *schemaResolver) Repository(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.Repository
tags: [method private]
```

```Go
func (r *schemaResolver) Repository(ctx context.Context, args *struct {
	Name     *string
	CloneURL *string
	// TODO(chris): Remove URI in favor of Name.
	URI *string
}) (*RepositoryResolver, error)
```

#### <a id="schemaResolver.RepositoryRedirect" href="#schemaResolver.RepositoryRedirect">func (r *schemaResolver) RepositoryRedirect(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.RepositoryRedirect
tags: [method private]
```

```Go
func (r *schemaResolver) RepositoryRedirect(ctx context.Context, args *struct {
	Name     *string
	CloneURL *string
}) (*repositoryRedirect, error)
```

#### <a id="schemaResolver.RepositoryStats" href="#schemaResolver.RepositoryStats">func (r *schemaResolver) RepositoryStats(ctx context.Context) (*repositoryStatsResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.RepositoryStats
tags: [method private]
```

```Go
func (r *schemaResolver) RepositoryStats(ctx context.Context) (*repositoryStatsResolver, error)
```

#### <a id="schemaResolver.RequestTrial" href="#schemaResolver.RequestTrial">func (r *schemaResolver) RequestTrial(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.RequestTrial
tags: [method private]
```

```Go
func (r *schemaResolver) RequestTrial(ctx context.Context, args *struct {
	Email string
}) (*EmptyResponse, error)
```

RequestTrial makes a submission to the request trial form. 

#### <a id="schemaResolver.ResendOrganizationInvitationNotification" href="#schemaResolver.ResendOrganizationInvitationNotification">func (r *schemaResolver) ResendOrganizationInvitationNotification(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.ResendOrganizationInvitationNotification
tags: [method private]
```

```Go
func (r *schemaResolver) ResendOrganizationInvitationNotification(ctx context.Context, args *struct {
	OrganizationInvitation graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.ResendVerificationEmail" href="#schemaResolver.ResendVerificationEmail">func (r *schemaResolver) ResendVerificationEmail(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.ResendVerificationEmail
tags: [method private]
```

```Go
func (r *schemaResolver) ResendVerificationEmail(ctx context.Context, args *struct {
	User  graphql.ID
	Email string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.ResolvePhabricatorDiff" href="#schemaResolver.ResolvePhabricatorDiff">func (r *schemaResolver) ResolvePhabricatorDiff(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.ResolvePhabricatorDiff
tags: [method private]
```

```Go
func (r *schemaResolver) ResolvePhabricatorDiff(ctx context.Context, args *struct {
	RepoName    string
	DiffID      int32
	BaseRev     string
	Patch       *string
	AuthorName  *string
	AuthorEmail *string
	Description *string
	Date        *string
}) (*GitCommitResolver, error)
```

#### <a id="schemaResolver.RespondToOrganizationInvitation" href="#schemaResolver.RespondToOrganizationInvitation">func (r *schemaResolver) RespondToOrganizationInvitation(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.RespondToOrganizationInvitation
tags: [method private]
```

```Go
func (r *schemaResolver) RespondToOrganizationInvitation(ctx context.Context, args *struct {
	OrganizationInvitation graphql.ID
	ResponseType           string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.RevokeOrganizationInvitation" href="#schemaResolver.RevokeOrganizationInvitation">func (r *schemaResolver) RevokeOrganizationInvitation(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.RevokeOrganizationInvitation
tags: [method private]
```

```Go
func (r *schemaResolver) RevokeOrganizationInvitation(ctx context.Context, args *struct {
	OrganizationInvitation graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.Root" href="#schemaResolver.Root">func (r *schemaResolver) Root() *schemaResolver</a>

```
searchKey: graphqlbackend.schemaResolver.Root
tags: [method private deprecated]
```

```Go
func (r *schemaResolver) Root() *schemaResolver
```

DEPRECATED 

#### <a id="schemaResolver.SavedSearches" href="#schemaResolver.SavedSearches">func (r *schemaResolver) SavedSearches(ctx context.Context) ([]*savedSearchResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.SavedSearches
tags: [method private]
```

```Go
func (r *schemaResolver) SavedSearches(ctx context.Context) ([]*savedSearchResolver, error)
```

#### <a id="schemaResolver.Search" href="#schemaResolver.Search">func (r *schemaResolver) Search(ctx context.Context, args *SearchArgs) (SearchImplementer, error)</a>

```
searchKey: graphqlbackend.schemaResolver.Search
tags: [method private]
```

```Go
func (r *schemaResolver) Search(ctx context.Context, args *SearchArgs) (SearchImplementer, error)
```

#### <a id="schemaResolver.SearchContextByID" href="#schemaResolver.SearchContextByID">func (r *schemaResolver) SearchContextByID(ctx context.Context, id graphql.ID) (*searchContextResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.SearchContextByID
tags: [method private]
```

```Go
func (r *schemaResolver) SearchContextByID(ctx context.Context, id graphql.ID) (*searchContextResolver, error)
```

#### <a id="schemaResolver.SearchContexts" href="#schemaResolver.SearchContexts">func (r *schemaResolver) SearchContexts(ctx context.Context, args *listSearchContextsArgs) (*searchContextConnection, error)</a>

```
searchKey: graphqlbackend.schemaResolver.SearchContexts
tags: [method private]
```

```Go
func (r *schemaResolver) SearchContexts(ctx context.Context, args *listSearchContextsArgs) (*searchContextConnection, error)
```

#### <a id="schemaResolver.SearchFilterSuggestions" href="#schemaResolver.SearchFilterSuggestions">func (r *schemaResolver) SearchFilterSuggestions(ctx context.Context) (*searchFilterSuggestions, error)</a>

```
searchKey: graphqlbackend.schemaResolver.SearchFilterSuggestions
tags: [method private]
```

```Go
func (r *schemaResolver) SearchFilterSuggestions(ctx context.Context) (*searchFilterSuggestions, error)
```

SearchFilterSuggestions provides search filter and default value suggestions. 

#### <a id="schemaResolver.SendSavedSearchTestNotification" href="#schemaResolver.SendSavedSearchTestNotification">func (r *schemaResolver) SendSavedSearchTestNotification(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SendSavedSearchTestNotification
tags: [method private]
```

```Go
func (r *schemaResolver) SendSavedSearchTestNotification(ctx context.Context, args *struct {
	ID graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.SetExternalServiceRepos" href="#schemaResolver.SetExternalServiceRepos">func (r *schemaResolver) SetExternalServiceRepos(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SetExternalServiceRepos
tags: [method private]
```

```Go
func (r *schemaResolver) SetExternalServiceRepos(ctx context.Context, args struct {
	ID       graphql.ID
	Repos    *[]string
	AllRepos bool
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.SetMigrationDirection" href="#schemaResolver.SetMigrationDirection">func (r *schemaResolver) SetMigrationDirection(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SetMigrationDirection
tags: [method private]
```

```Go
func (r *schemaResolver) SetMigrationDirection(ctx context.Context, args *struct {
	ID           graphql.ID
	ApplyReverse bool
}) (*EmptyResponse, error)
```

SetMigrationDirection updates the ApplyReverse flag for an out-of-band migration by identifier. 

#### <a id="schemaResolver.SetTag" href="#schemaResolver.SetTag">func (r *schemaResolver) SetTag(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SetTag
tags: [method private]
```

```Go
func (r *schemaResolver) SetTag(ctx context.Context, args *struct {
	Node    graphql.ID
	Tag     string
	Present bool
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.SetUserEmailPrimary" href="#schemaResolver.SetUserEmailPrimary">func (r *schemaResolver) SetUserEmailPrimary(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SetUserEmailPrimary
tags: [method private]
```

```Go
func (r *schemaResolver) SetUserEmailPrimary(ctx context.Context, args *struct {
	User  graphql.ID
	Email string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.SetUserEmailVerified" href="#schemaResolver.SetUserEmailVerified">func (r *schemaResolver) SetUserEmailVerified(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SetUserEmailVerified
tags: [method private]
```

```Go
func (r *schemaResolver) SetUserEmailVerified(ctx context.Context, args *struct {
	User     graphql.ID
	Email    string
	Verified bool
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.SetUserIsSiteAdmin" href="#schemaResolver.SetUserIsSiteAdmin">func (r *schemaResolver) SetUserIsSiteAdmin(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SetUserIsSiteAdmin
tags: [method private]
```

```Go
func (r *schemaResolver) SetUserIsSiteAdmin(ctx context.Context, args *struct {
	UserID    graphql.ID
	SiteAdmin bool
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.SetUserPublicRepos" href="#schemaResolver.SetUserPublicRepos">func (r *schemaResolver) SetUserPublicRepos(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SetUserPublicRepos
tags: [method private]
```

```Go
func (r *schemaResolver) SetUserPublicRepos(ctx context.Context, args struct {
	UserID   graphql.ID
	RepoURIs []string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.SettingsMutation" href="#schemaResolver.SettingsMutation">func (r *schemaResolver) SettingsMutation(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SettingsMutation
tags: [method private]
```

```Go
func (r *schemaResolver) SettingsMutation(ctx context.Context, args *struct {
	Input *settingsMutationGroupInput
}) (*settingsMutation, error)
```

SettingsMutation defines the Mutation.settingsMutation field. 

#### <a id="schemaResolver.SettingsSubject" href="#schemaResolver.SettingsSubject">func (r *schemaResolver) SettingsSubject(ctx context.Context, args *struct{ ID graphql.ID }) (*settingsSubject, error)</a>

```
searchKey: graphqlbackend.schemaResolver.SettingsSubject
tags: [method private]
```

```Go
func (r *schemaResolver) SettingsSubject(ctx context.Context, args *struct{ ID graphql.ID }) (*settingsSubject, error)
```

#### <a id="schemaResolver.Site" href="#schemaResolver.Site">func (r *schemaResolver) Site() *siteResolver</a>

```
searchKey: graphqlbackend.schemaResolver.Site
tags: [method private]
```

```Go
func (r *schemaResolver) Site() *siteResolver
```

#### <a id="schemaResolver.StatusMessages" href="#schemaResolver.StatusMessages">func (r *schemaResolver) StatusMessages(ctx context.Context) ([]*statusMessageResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.StatusMessages
tags: [method private]
```

```Go
func (r *schemaResolver) StatusMessages(ctx context.Context) ([]*statusMessageResolver, error)
```

#### <a id="schemaResolver.SubmitHappinessFeedback" href="#schemaResolver.SubmitHappinessFeedback">func (r *schemaResolver) SubmitHappinessFeedback(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SubmitHappinessFeedback
tags: [method private]
```

```Go
func (r *schemaResolver) SubmitHappinessFeedback(ctx context.Context, args *struct {
	Input *HappinessFeedbackSubmissionInput
}) (*EmptyResponse, error)
```

SubmitHappinessFeedback records a new happiness feedback response by the current user. 

#### <a id="schemaResolver.SubmitSurvey" href="#schemaResolver.SubmitSurvey">func (r *schemaResolver) SubmitSurvey(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SubmitSurvey
tags: [method private]
```

```Go
func (r *schemaResolver) SubmitSurvey(ctx context.Context, args *struct {
	Input *SurveySubmissionInput
}) (*EmptyResponse, error)
```

SubmitSurvey records a new satisfaction (NPS) survey response by the current user. 

#### <a id="schemaResolver.SurveyResponses" href="#schemaResolver.SurveyResponses">func (r *schemaResolver) SurveyResponses(args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.SurveyResponses
tags: [method private]
```

```Go
func (r *schemaResolver) SurveyResponses(args *struct {
	graphqlutil.ConnectionArgs
}) *surveyResponseConnectionResolver
```

#### <a id="schemaResolver.TriggerObservabilityTestAlert" href="#schemaResolver.TriggerObservabilityTestAlert">func (r *schemaResolver) TriggerObservabilityTestAlert(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.TriggerObservabilityTestAlert
tags: [method private]
```

```Go
func (r *schemaResolver) TriggerObservabilityTestAlert(ctx context.Context, args *struct {
	Level string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.UpdateExternalService" href="#schemaResolver.UpdateExternalService">func (r *schemaResolver) UpdateExternalService(ctx context.Context, args *updateExternalServiceArgs) (*externalServiceResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.UpdateExternalService
tags: [method private]
```

```Go
func (r *schemaResolver) UpdateExternalService(ctx context.Context, args *updateExternalServiceArgs) (*externalServiceResolver, error)
```

#### <a id="schemaResolver.UpdateFeatureFlag" href="#schemaResolver.UpdateFeatureFlag">func (r *schemaResolver) UpdateFeatureFlag(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.UpdateFeatureFlag
tags: [method private]
```

```Go
func (r *schemaResolver) UpdateFeatureFlag(ctx context.Context, args struct {
	Name               string
	Value              *bool
	RolloutBasisPoints *int32
}) (*FeatureFlagResolver, error)
```

#### <a id="schemaResolver.UpdateFeatureFlagOverride" href="#schemaResolver.UpdateFeatureFlagOverride">func (r *schemaResolver) UpdateFeatureFlagOverride(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.UpdateFeatureFlagOverride
tags: [method private]
```

```Go
func (r *schemaResolver) UpdateFeatureFlagOverride(ctx context.Context, args struct {
	ID    graphql.ID
	Value bool
}) (*FeatureFlagOverrideResolver, error)
```

#### <a id="schemaResolver.UpdateMirrorRepository" href="#schemaResolver.UpdateMirrorRepository">func (r *schemaResolver) UpdateMirrorRepository(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.UpdateMirrorRepository
tags: [method private]
```

```Go
func (r *schemaResolver) UpdateMirrorRepository(ctx context.Context, args *struct {
	Repository graphql.ID
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.UpdateOrganization" href="#schemaResolver.UpdateOrganization">func (r *schemaResolver) UpdateOrganization(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.UpdateOrganization
tags: [method private]
```

```Go
func (r *schemaResolver) UpdateOrganization(ctx context.Context, args *struct {
	ID          graphql.ID
	DisplayName *string
}) (*OrgResolver, error)
```

#### <a id="schemaResolver.UpdatePassword" href="#schemaResolver.UpdatePassword">func (r *schemaResolver) UpdatePassword(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.UpdatePassword
tags: [method private]
```

```Go
func (r *schemaResolver) UpdatePassword(ctx context.Context, args *struct {
	OldPassword string
	NewPassword string
}) (*EmptyResponse, error)
```

#### <a id="schemaResolver.UpdateSavedSearch" href="#schemaResolver.UpdateSavedSearch">func (r *schemaResolver) UpdateSavedSearch(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.UpdateSavedSearch
tags: [method private]
```

```Go
func (r *schemaResolver) UpdateSavedSearch(ctx context.Context, args *struct {
	ID          graphql.ID
	Description string
	Query       string
	NotifyOwner bool
	NotifySlack bool
	OrgID       *graphql.ID
	UserID      *graphql.ID
}) (*savedSearchResolver, error)
```

#### <a id="schemaResolver.UpdateSearchContext" href="#schemaResolver.UpdateSearchContext">func (r *schemaResolver) UpdateSearchContext(ctx context.Context, args updateSearchContextArgs) (*searchContextResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.UpdateSearchContext
tags: [method private]
```

```Go
func (r *schemaResolver) UpdateSearchContext(ctx context.Context, args updateSearchContextArgs) (*searchContextResolver, error)
```

#### <a id="schemaResolver.UpdateSiteConfiguration" href="#schemaResolver.UpdateSiteConfiguration">func (r *schemaResolver) UpdateSiteConfiguration(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.UpdateSiteConfiguration
tags: [method private]
```

```Go
func (r *schemaResolver) UpdateSiteConfiguration(ctx context.Context, args *struct {
	LastID int32
	Input  string
}) (bool, error)
```

#### <a id="schemaResolver.UpdateUser" href="#schemaResolver.UpdateUser">func (r *schemaResolver) UpdateUser(ctx context.Context, args *updateUserArgs) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.UpdateUser
tags: [method private]
```

```Go
func (r *schemaResolver) UpdateUser(ctx context.Context, args *updateUserArgs) (*UserResolver, error)
```

#### <a id="schemaResolver.User" href="#schemaResolver.User">func (r *schemaResolver) User(ctx context.Context, args struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.User
tags: [method private]
```

```Go
func (r *schemaResolver) User(ctx context.Context, args struct {
	Username *string
	Email    *string
}) (*UserResolver, error)
```

#### <a id="schemaResolver.Users" href="#schemaResolver.Users">func (r *schemaResolver) Users(args *struct {...</a>

```
searchKey: graphqlbackend.schemaResolver.Users
tags: [method private]
```

```Go
func (r *schemaResolver) Users(args *struct {
	graphqlutil.ConnectionArgs
	Query        *string
	Tag          *string
	ActivePeriod *string
}) *userConnectionResolver
```

#### <a id="schemaResolver.VersionContexts" href="#schemaResolver.VersionContexts">func (r *schemaResolver) VersionContexts(ctx context.Context) ([]*versionContextResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.VersionContexts
tags: [method private]
```

```Go
func (r *schemaResolver) VersionContexts(ctx context.Context) ([]*versionContextResolver, error)
```

#### <a id="schemaResolver.ViewerConfiguration" href="#schemaResolver.ViewerConfiguration">func (r *schemaResolver) ViewerConfiguration(ctx context.Context) (*settingsCascade, error)</a>

```
searchKey: graphqlbackend.schemaResolver.ViewerConfiguration
tags: [method private deprecated]
```

```Go
func (r *schemaResolver) ViewerConfiguration(ctx context.Context) (*settingsCascade, error)
```

Deprecated: in the GraphQL API 

#### <a id="schemaResolver.ViewerFeatureFlags" href="#schemaResolver.ViewerFeatureFlags">func (r *schemaResolver) ViewerFeatureFlags(ctx context.Context) []*EvaluatedFeatureFlagResolver</a>

```
searchKey: graphqlbackend.schemaResolver.ViewerFeatureFlags
tags: [method private]
```

```Go
func (r *schemaResolver) ViewerFeatureFlags(ctx context.Context) []*EvaluatedFeatureFlagResolver
```

#### <a id="schemaResolver.ViewerSettings" href="#schemaResolver.ViewerSettings">func (r schemaResolver) ViewerSettings(ctx context.Context) (*settingsCascade, error)</a>

```
searchKey: graphqlbackend.schemaResolver.ViewerSettings
tags: [method private]
```

```Go
func (r schemaResolver) ViewerSettings(ctx context.Context) (*settingsCascade, error)
```

#### <a id="schemaResolver.gitCommitByID" href="#schemaResolver.gitCommitByID">func (r *schemaResolver) gitCommitByID(ctx context.Context, id graphql.ID) (*GitCommitResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.gitCommitByID
tags: [method private]
```

```Go
func (r *schemaResolver) gitCommitByID(ctx context.Context, id graphql.ID) (*GitCommitResolver, error)
```

#### <a id="schemaResolver.gitRefByID" href="#schemaResolver.gitRefByID">func (r *schemaResolver) gitRefByID(ctx context.Context, id graphql.ID) (*GitRefResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.gitRefByID
tags: [method private]
```

```Go
func (r *schemaResolver) gitRefByID(ctx context.Context, id graphql.ID) (*GitRefResolver, error)
```

#### <a id="schemaResolver.nodeByID" href="#schemaResolver.nodeByID">func (r *schemaResolver) nodeByID(ctx context.Context, id graphql.ID) (Node, error)</a>

```
searchKey: graphqlbackend.schemaResolver.nodeByID
tags: [method private]
```

```Go
func (r *schemaResolver) nodeByID(ctx context.Context, id graphql.ID) (Node, error)
```

#### <a id="schemaResolver.repositoryByID" href="#schemaResolver.repositoryByID">func (r *schemaResolver) repositoryByID(ctx context.Context, id graphql.ID) (*RepositoryResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.repositoryByID
tags: [method private]
```

```Go
func (r *schemaResolver) repositoryByID(ctx context.Context, id graphql.ID) (*RepositoryResolver, error)
```

#### <a id="schemaResolver.repositoryRevisionsFromInputArgs" href="#schemaResolver.repositoryRevisionsFromInputArgs">func (r *schemaResolver) repositoryRevisionsFromInputArgs(ctx context.Context, args []searchContextRepositoryRevisionsInputArgs) ([]*types.SearchContextRepositoryRevisions, error)</a>

```
searchKey: graphqlbackend.schemaResolver.repositoryRevisionsFromInputArgs
tags: [method private]
```

```Go
func (r *schemaResolver) repositoryRevisionsFromInputArgs(ctx context.Context, args []searchContextRepositoryRevisionsInputArgs) ([]*types.SearchContextRepositoryRevisions, error)
```

#### <a id="schemaResolver.savedSearchByID" href="#schemaResolver.savedSearchByID">func (r *schemaResolver) savedSearchByID(ctx context.Context, id graphql.ID) (*savedSearchResolver, error)</a>

```
searchKey: graphqlbackend.schemaResolver.savedSearchByID
tags: [method private]
```

```Go
func (r *schemaResolver) savedSearchByID(ctx context.Context, id graphql.ID) (*savedSearchResolver, error)
```

#### <a id="schemaResolver.siteByGQLID" href="#schemaResolver.siteByGQLID">func (r *schemaResolver) siteByGQLID(ctx context.Context, id graphql.ID) (Node, error)</a>

```
searchKey: graphqlbackend.schemaResolver.siteByGQLID
tags: [method private]
```

```Go
func (r *schemaResolver) siteByGQLID(ctx context.Context, id graphql.ID) (Node, error)
```

#### <a id="schemaResolver.toSavedSearchResolver" href="#schemaResolver.toSavedSearchResolver">func (r *schemaResolver) toSavedSearchResolver(entry types.SavedSearch) *savedSearchResolver</a>

```
searchKey: graphqlbackend.schemaResolver.toSavedSearchResolver
tags: [method private]
```

```Go
func (r *schemaResolver) toSavedSearchResolver(entry types.SavedSearch) *savedSearchResolver
```

### <a id="searchAlert" href="#searchAlert">type searchAlert struct</a>

```
searchKey: graphqlbackend.searchAlert
tags: [struct private]
```

```Go
type searchAlert struct {
	prometheusType  string
	title           string
	description     string
	proposedQueries []*searchQueryDescription
	// The higher the priority the more important is the alert.
	priority int
}
```

#### <a id="alertForCappedAndExpression" href="#alertForCappedAndExpression">func alertForCappedAndExpression() *searchAlert</a>

```
searchKey: graphqlbackend.alertForCappedAndExpression
tags: [function private]
```

```Go
func alertForCappedAndExpression() *searchAlert
```

#### <a id="alertForError" href="#alertForError">func alertForError(err error) *searchAlert</a>

```
searchKey: graphqlbackend.alertForError
tags: [function private]
```

```Go
func alertForError(err error) *searchAlert
```

#### <a id="alertForInvalidRevision" href="#alertForInvalidRevision">func alertForInvalidRevision(revision string) *searchAlert</a>

```
searchKey: graphqlbackend.alertForInvalidRevision
tags: [function private]
```

```Go
func alertForInvalidRevision(revision string) *searchAlert
```

#### <a id="alertForMissingRepoRevs" href="#alertForMissingRepoRevs">func alertForMissingRepoRevs(missingRepoRevs []*search.RepositoryRevisions) *searchAlert</a>

```
searchKey: graphqlbackend.alertForMissingRepoRevs
tags: [function private]
```

```Go
func alertForMissingRepoRevs(missingRepoRevs []*search.RepositoryRevisions) *searchAlert
```

#### <a id="alertForQuery" href="#alertForQuery">func alertForQuery(queryString string, err error) *searchAlert</a>

```
searchKey: graphqlbackend.alertForQuery
tags: [function private]
```

```Go
func alertForQuery(queryString string, err error) *searchAlert
```

alertForQuery converts errors in the query to search alerts. 

#### <a id="alertForStalePermissions" href="#alertForStalePermissions">func alertForStalePermissions() *searchAlert</a>

```
searchKey: graphqlbackend.alertForStalePermissions
tags: [function private]
```

```Go
func alertForStalePermissions() *searchAlert
```

#### <a id="alertForStructuralSearchNotSet" href="#alertForStructuralSearchNotSet">func alertForStructuralSearchNotSet(queryString string) *searchAlert</a>

```
searchKey: graphqlbackend.alertForStructuralSearchNotSet
tags: [function private]
```

```Go
func alertForStructuralSearchNotSet(queryString string) *searchAlert
```

#### <a id="alertForTimeout" href="#alertForTimeout">func alertForTimeout(usedTime time.Duration, suggestTime time.Duration, r *searchResolver) *searchAlert</a>

```
searchKey: graphqlbackend.alertForTimeout
tags: [function private]
```

```Go
func alertForTimeout(usedTime time.Duration, suggestTime time.Duration, r *searchResolver) *searchAlert
```

#### <a id="errorToAlert" href="#errorToAlert">func errorToAlert(err error) (*searchAlert, error)</a>

```
searchKey: graphqlbackend.errorToAlert
tags: [function private]
```

```Go
func errorToAlert(err error) (*searchAlert, error)
```

errorToAlert is intended to be a catch-all function for converting all errors into alerts. The intent here is to create alerts as close to the API boundary as possible, so this should be called immediately before creating the SearchResultsResolver. 

#### <a id="maxAlertByPriority" href="#maxAlertByPriority">func maxAlertByPriority(a, b *searchAlert) *searchAlert</a>

```
searchKey: graphqlbackend.maxAlertByPriority
tags: [function private]
```

```Go
func maxAlertByPriority(a, b *searchAlert) *searchAlert
```

#### <a id="multierrorToAlert" href="#multierrorToAlert">func multierrorToAlert(me *multierror.Error) (resAlert *searchAlert, resErr error)</a>

```
searchKey: graphqlbackend.multierrorToAlert
tags: [function private]
```

```Go
func multierrorToAlert(me *multierror.Error) (resAlert *searchAlert, resErr error)
```

multierrorToAlert converts a multierror.Error into the highest priority alert for the errors contained in it, and a new error with all the errors that could not be converted to alerts. 

#### <a id="searchAlert.Description" href="#searchAlert.Description">func (a searchAlert) Description() *string</a>

```
searchKey: graphqlbackend.searchAlert.Description
tags: [method private]
```

```Go
func (a searchAlert) Description() *string
```

#### <a id="searchAlert.PrometheusType" href="#searchAlert.PrometheusType">func (a searchAlert) PrometheusType() string</a>

```
searchKey: graphqlbackend.searchAlert.PrometheusType
tags: [method private]
```

```Go
func (a searchAlert) PrometheusType() string
```

#### <a id="searchAlert.ProposedQueries" href="#searchAlert.ProposedQueries">func (a searchAlert) ProposedQueries() *[]*searchQueryDescription</a>

```
searchKey: graphqlbackend.searchAlert.ProposedQueries
tags: [method private]
```

```Go
func (a searchAlert) ProposedQueries() *[]*searchQueryDescription
```

#### <a id="searchAlert.Title" href="#searchAlert.Title">func (a searchAlert) Title() string</a>

```
searchKey: graphqlbackend.searchAlert.Title
tags: [method private]
```

```Go
func (a searchAlert) Title() string
```

#### <a id="searchAlert.wrapResults" href="#searchAlert.wrapResults">func (a searchAlert) wrapResults() *SearchResults</a>

```
searchKey: graphqlbackend.searchAlert.wrapResults
tags: [method private]
```

```Go
func (a searchAlert) wrapResults() *SearchResults
```

#### <a id="searchAlert.wrapSearchImplementer" href="#searchAlert.wrapSearchImplementer">func (a searchAlert) wrapSearchImplementer(db dbutil.DB) *alertSearchImplementer</a>

```
searchKey: graphqlbackend.searchAlert.wrapSearchImplementer
tags: [method private]
```

```Go
func (a searchAlert) wrapSearchImplementer(db dbutil.DB) *alertSearchImplementer
```

### <a id="searchContextConnection" href="#searchContextConnection">type searchContextConnection struct</a>

```
searchKey: graphqlbackend.searchContextConnection
tags: [struct private]
```

```Go
type searchContextConnection struct {
	afterCursor    int32
	searchContexts []*searchContextResolver
	totalCount     int32
	hasNextPage    bool
}
```

#### <a id="searchContextConnection.Nodes" href="#searchContextConnection.Nodes">func (s *searchContextConnection) Nodes(ctx context.Context) ([]*searchContextResolver, error)</a>

```
searchKey: graphqlbackend.searchContextConnection.Nodes
tags: [method private]
```

```Go
func (s *searchContextConnection) Nodes(ctx context.Context) ([]*searchContextResolver, error)
```

#### <a id="searchContextConnection.PageInfo" href="#searchContextConnection.PageInfo">func (s *searchContextConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.searchContextConnection.PageInfo
tags: [method private]
```

```Go
func (s *searchContextConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="searchContextConnection.TotalCount" href="#searchContextConnection.TotalCount">func (s *searchContextConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.searchContextConnection.TotalCount
tags: [method private]
```

```Go
func (s *searchContextConnection) TotalCount(ctx context.Context) (int32, error)
```

### <a id="searchContextEditInputArgs" href="#searchContextEditInputArgs">type searchContextEditInputArgs struct</a>

```
searchKey: graphqlbackend.searchContextEditInputArgs
tags: [struct private]
```

```Go
type searchContextEditInputArgs struct {
	Name        string
	Description string
	Public      bool
}
```

### <a id="searchContextInputArgs" href="#searchContextInputArgs">type searchContextInputArgs struct</a>

```
searchKey: graphqlbackend.searchContextInputArgs
tags: [struct private]
```

```Go
type searchContextInputArgs struct {
	Name        string
	Description string
	Public      bool
	Namespace   *graphql.ID
}
```

### <a id="searchContextRepositoryRevisionsInputArgs" href="#searchContextRepositoryRevisionsInputArgs">type searchContextRepositoryRevisionsInputArgs struct</a>

```
searchKey: graphqlbackend.searchContextRepositoryRevisionsInputArgs
tags: [struct private]
```

```Go
type searchContextRepositoryRevisionsInputArgs struct {
	RepositoryID graphql.ID
	Revisions    []string
}
```

### <a id="searchContextRepositoryRevisionsResolver" href="#searchContextRepositoryRevisionsResolver">type searchContextRepositoryRevisionsResolver struct</a>

```
searchKey: graphqlbackend.searchContextRepositoryRevisionsResolver
tags: [struct private]
```

```Go
type searchContextRepositoryRevisionsResolver struct {
	repository *RepositoryResolver
	revisions  []string
}
```

#### <a id="searchContextRepositoryRevisionsResolver.Repository" href="#searchContextRepositoryRevisionsResolver.Repository">func (r *searchContextRepositoryRevisionsResolver) Repository(ctx context.Context) *RepositoryResolver</a>

```
searchKey: graphqlbackend.searchContextRepositoryRevisionsResolver.Repository
tags: [method private]
```

```Go
func (r *searchContextRepositoryRevisionsResolver) Repository(ctx context.Context) *RepositoryResolver
```

#### <a id="searchContextRepositoryRevisionsResolver.Revisions" href="#searchContextRepositoryRevisionsResolver.Revisions">func (r *searchContextRepositoryRevisionsResolver) Revisions(ctx context.Context) []string</a>

```
searchKey: graphqlbackend.searchContextRepositoryRevisionsResolver.Revisions
tags: [method private]
```

```Go
func (r *searchContextRepositoryRevisionsResolver) Revisions(ctx context.Context) []string
```

### <a id="searchContextResolver" href="#searchContextResolver">type searchContextResolver struct</a>

```
searchKey: graphqlbackend.searchContextResolver
tags: [struct private]
```

```Go
type searchContextResolver struct {
	sc *types.SearchContext
	db dbutil.DB
}
```

#### <a id="searchContextResolver.AutoDefined" href="#searchContextResolver.AutoDefined">func (r *searchContextResolver) AutoDefined(ctx context.Context) bool</a>

```
searchKey: graphqlbackend.searchContextResolver.AutoDefined
tags: [method private]
```

```Go
func (r *searchContextResolver) AutoDefined(ctx context.Context) bool
```

#### <a id="searchContextResolver.Description" href="#searchContextResolver.Description">func (r *searchContextResolver) Description(ctx context.Context) string</a>

```
searchKey: graphqlbackend.searchContextResolver.Description
tags: [method private]
```

```Go
func (r *searchContextResolver) Description(ctx context.Context) string
```

#### <a id="searchContextResolver.ID" href="#searchContextResolver.ID">func (r *searchContextResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.searchContextResolver.ID
tags: [method private]
```

```Go
func (r *searchContextResolver) ID() graphql.ID
```

#### <a id="searchContextResolver.Name" href="#searchContextResolver.Name">func (r *searchContextResolver) Name(ctx context.Context) string</a>

```
searchKey: graphqlbackend.searchContextResolver.Name
tags: [method private]
```

```Go
func (r *searchContextResolver) Name(ctx context.Context) string
```

#### <a id="searchContextResolver.Namespace" href="#searchContextResolver.Namespace">func (r *searchContextResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)</a>

```
searchKey: graphqlbackend.searchContextResolver.Namespace
tags: [method private]
```

```Go
func (r *searchContextResolver) Namespace(ctx context.Context) (*NamespaceResolver, error)
```

#### <a id="searchContextResolver.Public" href="#searchContextResolver.Public">func (r *searchContextResolver) Public(ctx context.Context) bool</a>

```
searchKey: graphqlbackend.searchContextResolver.Public
tags: [method private]
```

```Go
func (r *searchContextResolver) Public(ctx context.Context) bool
```

#### <a id="searchContextResolver.Repositories" href="#searchContextResolver.Repositories">func (r *searchContextResolver) Repositories(ctx context.Context) ([]*searchContextRepositoryRevisionsResolver, error)</a>

```
searchKey: graphqlbackend.searchContextResolver.Repositories
tags: [method private]
```

```Go
func (r *searchContextResolver) Repositories(ctx context.Context) ([]*searchContextRepositoryRevisionsResolver, error)
```

#### <a id="searchContextResolver.Spec" href="#searchContextResolver.Spec">func (r *searchContextResolver) Spec() string</a>

```
searchKey: graphqlbackend.searchContextResolver.Spec
tags: [method private]
```

```Go
func (r *searchContextResolver) Spec() string
```

#### <a id="searchContextResolver.UpdatedAt" href="#searchContextResolver.UpdatedAt">func (r *searchContextResolver) UpdatedAt(ctx context.Context) DateTime</a>

```
searchKey: graphqlbackend.searchContextResolver.UpdatedAt
tags: [method private]
```

```Go
func (r *searchContextResolver) UpdatedAt(ctx context.Context) DateTime
```

#### <a id="searchContextResolver.ViewerCanManage" href="#searchContextResolver.ViewerCanManage">func (r *searchContextResolver) ViewerCanManage(ctx context.Context) bool</a>

```
searchKey: graphqlbackend.searchContextResolver.ViewerCanManage
tags: [method private]
```

```Go
func (r *searchContextResolver) ViewerCanManage(ctx context.Context) bool
```

### <a id="searchContextSuggestionResolver" href="#searchContextSuggestionResolver">type searchContextSuggestionResolver struct</a>

```
searchKey: graphqlbackend.searchContextSuggestionResolver
tags: [struct private]
```

```Go
type searchContextSuggestionResolver struct {
	baseSuggestionResolver
	searchContext *searchContextResolver
	score         int
}
```

#### <a id="searchContextSuggestionResolver.Key" href="#searchContextSuggestionResolver.Key">func (s searchContextSuggestionResolver) Key() suggestionKey</a>

```
searchKey: graphqlbackend.searchContextSuggestionResolver.Key
tags: [method private]
```

```Go
func (s searchContextSuggestionResolver) Key() suggestionKey
```

#### <a id="searchContextSuggestionResolver.Label" href="#searchContextSuggestionResolver.Label">func (s searchContextSuggestionResolver) Label() string</a>

```
searchKey: graphqlbackend.searchContextSuggestionResolver.Label
tags: [method private]
```

```Go
func (s searchContextSuggestionResolver) Label() string
```

#### <a id="searchContextSuggestionResolver.Length" href="#searchContextSuggestionResolver.Length">func (s searchContextSuggestionResolver) Length() int</a>

```
searchKey: graphqlbackend.searchContextSuggestionResolver.Length
tags: [method private]
```

```Go
func (s searchContextSuggestionResolver) Length() int
```

#### <a id="searchContextSuggestionResolver.Score" href="#searchContextSuggestionResolver.Score">func (s searchContextSuggestionResolver) Score() int</a>

```
searchKey: graphqlbackend.searchContextSuggestionResolver.Score
tags: [method private]
```

```Go
func (s searchContextSuggestionResolver) Score() int
```

#### <a id="searchContextSuggestionResolver.ToSearchContext" href="#searchContextSuggestionResolver.ToSearchContext">func (s searchContextSuggestionResolver) ToSearchContext() (*searchContextResolver, bool)</a>

```
searchKey: graphqlbackend.searchContextSuggestionResolver.ToSearchContext
tags: [method private]
```

```Go
func (s searchContextSuggestionResolver) ToSearchContext() (*searchContextResolver, bool)
```

### <a id="searchContextsOrderBy" href="#searchContextsOrderBy">type searchContextsOrderBy string</a>

```
searchKey: graphqlbackend.searchContextsOrderBy
tags: [string private]
```

```Go
type searchContextsOrderBy string
```

### <a id="searchFilterResolver" href="#searchFilterResolver">type searchFilterResolver struct</a>

```
searchKey: graphqlbackend.searchFilterResolver
tags: [struct private]
```

```Go
type searchFilterResolver struct {
	filter streaming.Filter
}
```

#### <a id="searchFilterResolver.Count" href="#searchFilterResolver.Count">func (sf *searchFilterResolver) Count() int32</a>

```
searchKey: graphqlbackend.searchFilterResolver.Count
tags: [method private]
```

```Go
func (sf *searchFilterResolver) Count() int32
```

#### <a id="searchFilterResolver.Kind" href="#searchFilterResolver.Kind">func (sf *searchFilterResolver) Kind() string</a>

```
searchKey: graphqlbackend.searchFilterResolver.Kind
tags: [method private]
```

```Go
func (sf *searchFilterResolver) Kind() string
```

#### <a id="searchFilterResolver.Label" href="#searchFilterResolver.Label">func (sf *searchFilterResolver) Label() string</a>

```
searchKey: graphqlbackend.searchFilterResolver.Label
tags: [method private]
```

```Go
func (sf *searchFilterResolver) Label() string
```

#### <a id="searchFilterResolver.LimitHit" href="#searchFilterResolver.LimitHit">func (sf *searchFilterResolver) LimitHit() bool</a>

```
searchKey: graphqlbackend.searchFilterResolver.LimitHit
tags: [method private]
```

```Go
func (sf *searchFilterResolver) LimitHit() bool
```

#### <a id="searchFilterResolver.Value" href="#searchFilterResolver.Value">func (sf *searchFilterResolver) Value() string</a>

```
searchKey: graphqlbackend.searchFilterResolver.Value
tags: [method private]
```

```Go
func (sf *searchFilterResolver) Value() string
```

### <a id="searchFilterSuggestions" href="#searchFilterSuggestions">type searchFilterSuggestions struct</a>

```
searchKey: graphqlbackend.searchFilterSuggestions
tags: [struct private]
```

```Go
type searchFilterSuggestions struct {
	repogroups []string
	repos      []string
}
```

searchFilterSuggestions holds suggestions of search filters and their default values. 

#### <a id="searchFilterSuggestions.Repo" href="#searchFilterSuggestions.Repo">func (s *searchFilterSuggestions) Repo() []string</a>

```
searchKey: graphqlbackend.searchFilterSuggestions.Repo
tags: [method private]
```

```Go
func (s *searchFilterSuggestions) Repo() []string
```

Repo returns a list of repositories as the default value for suggestion. 

#### <a id="searchFilterSuggestions.Repogroup" href="#searchFilterSuggestions.Repogroup">func (s *searchFilterSuggestions) Repogroup() []string</a>

```
searchKey: graphqlbackend.searchFilterSuggestions.Repogroup
tags: [method private]
```

```Go
func (s *searchFilterSuggestions) Repogroup() []string
```

Repogroup returns all repository groups defined in the settings. 

### <a id="searchQueryDescription" href="#searchQueryDescription">type searchQueryDescription struct</a>

```
searchKey: graphqlbackend.searchQueryDescription
tags: [struct private]
```

```Go
type searchQueryDescription struct {
	description string
	query       string
	patternType query.SearchType
}
```

searchQueryDescription is a type for the SearchQueryDescription resolver used by SearchAlert. 

#### <a id="searchQueryDescription.Description" href="#searchQueryDescription.Description">func (q searchQueryDescription) Description() *string</a>

```
searchKey: graphqlbackend.searchQueryDescription.Description
tags: [method private]
```

```Go
func (q searchQueryDescription) Description() *string
```

#### <a id="searchQueryDescription.Query" href="#searchQueryDescription.Query">func (q searchQueryDescription) Query() string</a>

```
searchKey: graphqlbackend.searchQueryDescription.Query
tags: [method private]
```

```Go
func (q searchQueryDescription) Query() string
```

### <a id="searchResolver" href="#searchResolver">type searchResolver struct</a>

```
searchKey: graphqlbackend.searchResolver
tags: [struct private]
```

```Go
type searchResolver struct {
	*run.SearchInputs
	db                  dbutil.DB
	invalidateRepoCache bool // if true, invalidates the repo cache when evaluating search subexpressions.

	// stream if non-nil will send all search events we receive down it.
	stream streaming.Sender

	// Cached resolveRepositories results. We use a pointer to the mutex so that we
	// can copy the resolver, while sharing the mutex. If we didn't use a pointer,
	// the mutex would lead to unexpected behaviour.
	reposMu  *sync.Mutex
	resolved *searchrepos.Resolved
	repoErr  error

	zoekt        *searchbackend.Zoekt
	searcherURLs *endpoint.Map
}
```

searchResolver is a resolver for the GraphQL type `Search` 

#### <a id="searchResolver.Inputs" href="#searchResolver.Inputs">func (r *searchResolver) Inputs() run.SearchInputs</a>

```
searchKey: graphqlbackend.searchResolver.Inputs
tags: [method private]
```

```Go
func (r *searchResolver) Inputs() run.SearchInputs
```

#### <a id="searchResolver.Results" href="#searchResolver.Results">func (r *searchResolver) Results(ctx context.Context) (*SearchResultsResolver, error)</a>

```
searchKey: graphqlbackend.searchResolver.Results
tags: [method private]
```

```Go
func (r *searchResolver) Results(ctx context.Context) (*SearchResultsResolver, error)
```

#### <a id="searchResolver.Stats" href="#searchResolver.Stats">func (r *searchResolver) Stats(ctx context.Context) (stats *searchResultsStats, err error)</a>

```
searchKey: graphqlbackend.searchResolver.Stats
tags: [method private]
```

```Go
func (r *searchResolver) Stats(ctx context.Context) (stats *searchResultsStats, err error)
```

#### <a id="searchResolver.Suggestions" href="#searchResolver.Suggestions">func (r *searchResolver) Suggestions(ctx context.Context, args *searchSuggestionsArgs) ([]SearchSuggestionResolver, error)</a>

```
searchKey: graphqlbackend.searchResolver.Suggestions
tags: [method private]
```

```Go
func (r *searchResolver) Suggestions(ctx context.Context, args *searchSuggestionsArgs) ([]SearchSuggestionResolver, error)
```

#### <a id="searchResolver.countIsSet" href="#searchResolver.countIsSet">func (r *searchResolver) countIsSet() bool</a>

```
searchKey: graphqlbackend.searchResolver.countIsSet
tags: [method private]
```

```Go
func (r *searchResolver) countIsSet() bool
```

#### <a id="searchResolver.determineRepos" href="#searchResolver.determineRepos">func (r *searchResolver) determineRepos(ctx context.Context, tr *trace.Trace, start time.Time) (*searchrepos.Resolved, error)</a>

```
searchKey: graphqlbackend.searchResolver.determineRepos
tags: [method private]
```

```Go
func (r *searchResolver) determineRepos(ctx context.Context, tr *trace.Trace, start time.Time) (*searchrepos.Resolved, error)
```

determineRepos wraps resolveRepositories. It interprets the response and error to see if an alert needs to be returned. Only one of the return values will be non-nil. 

#### <a id="searchResolver.determineResultTypes" href="#searchResolver.determineResultTypes">func (r *searchResolver) determineResultTypes(args search.TextParameters, forceTypes result.Types) result.Types</a>

```
searchKey: graphqlbackend.searchResolver.determineResultTypes
tags: [method private]
```

```Go
func (r *searchResolver) determineResultTypes(args search.TextParameters, forceTypes result.Types) result.Types
```

#### <a id="searchResolver.doResults" href="#searchResolver.doResults">func (r *searchResolver) doResults(ctx context.Context, forceResultTypes result.Types) (_ *SearchResults, err error)</a>

```
searchKey: graphqlbackend.searchResolver.doResults
tags: [method private]
```

```Go
func (r *searchResolver) doResults(ctx context.Context, forceResultTypes result.Types) (_ *SearchResults, err error)
```

doResults is one of the highest level search functions that handles finding results. 

If forceOnlyResultType is specified, only results of the given type are returned, regardless of what `type:` is specified in the query string. 

Partial results AND an error may be returned. 

#### <a id="searchResolver.errorForNoResolvedRepos" href="#searchResolver.errorForNoResolvedRepos">func (r *searchResolver) errorForNoResolvedRepos(ctx context.Context) *errNoResolvedRepos</a>

```
searchKey: graphqlbackend.searchResolver.errorForNoResolvedRepos
tags: [method private]
```

```Go
func (r *searchResolver) errorForNoResolvedRepos(ctx context.Context) *errNoResolvedRepos
```

#### <a id="searchResolver.errorForOverRepoLimit" href="#searchResolver.errorForOverRepoLimit">func (r *searchResolver) errorForOverRepoLimit(ctx context.Context) *errOverRepoLimit</a>

```
searchKey: graphqlbackend.searchResolver.errorForOverRepoLimit
tags: [method private]
```

```Go
func (r *searchResolver) errorForOverRepoLimit(ctx context.Context) *errOverRepoLimit
```

#### <a id="searchResolver.evaluate" href="#searchResolver.evaluate">func (r *searchResolver) evaluate(ctx context.Context, q query.Basic) (*SearchResults, error)</a>

```
searchKey: graphqlbackend.searchResolver.evaluate
tags: [method private]
```

```Go
func (r *searchResolver) evaluate(ctx context.Context, q query.Basic) (*SearchResults, error)
```

evaluate evaluates all expressions of a search query. 

#### <a id="searchResolver.evaluateAnd" href="#searchResolver.evaluateAnd">func (r *searchResolver) evaluateAnd(ctx context.Context, q query.Basic) (*SearchResults, error)</a>

```
searchKey: graphqlbackend.searchResolver.evaluateAnd
tags: [method private]
```

```Go
func (r *searchResolver) evaluateAnd(ctx context.Context, q query.Basic) (*SearchResults, error)
```

evaluateAnd performs set intersection on result sets. It collects results for all expressions that are ANDed together by searching for each subexpression and then intersects those results that are in the same repo/file path. To collect N results for count:N, we need to opportunistically ask for more than N results for each subexpression (since intersect can never yield more than N, and likely yields fewer than N results). If the intersection does not yield N results, and is not exhaustive for every expression, we rerun the search by doubling count again. 

#### <a id="searchResolver.evaluateLeaf" href="#searchResolver.evaluateLeaf">func (r *searchResolver) evaluateLeaf(ctx context.Context) (_ *SearchResults, err error)</a>

```
searchKey: graphqlbackend.searchResolver.evaluateLeaf
tags: [method private]
```

```Go
func (r *searchResolver) evaluateLeaf(ctx context.Context) (_ *SearchResults, err error)
```

evaluateLeaf performs a single search operation and corresponds to the evaluation of leaf expression in a query. 

#### <a id="searchResolver.evaluateOr" href="#searchResolver.evaluateOr">func (r *searchResolver) evaluateOr(ctx context.Context, q query.Basic) (*SearchResults, error)</a>

```
searchKey: graphqlbackend.searchResolver.evaluateOr
tags: [method private]
```

```Go
func (r *searchResolver) evaluateOr(ctx context.Context, q query.Basic) (*SearchResults, error)
```

evaluateOr performs set union on result sets. It collects results for all expressions that are ORed together by searching for each subexpression. If the maximum number of results are reached after evaluating a subexpression, we shortcircuit and return results immediately. 

#### <a id="searchResolver.evaluatePatternExpression" href="#searchResolver.evaluatePatternExpression">func (r *searchResolver) evaluatePatternExpression(ctx context.Context, q query.Basic) (*SearchResults, error)</a>

```
searchKey: graphqlbackend.searchResolver.evaluatePatternExpression
tags: [method private]
```

```Go
func (r *searchResolver) evaluatePatternExpression(ctx context.Context, q query.Basic) (*SearchResults, error)
```

evaluatePatternExpression evaluates a search pattern containing and/or expressions. 

#### <a id="searchResolver.getExactFilePatterns" href="#searchResolver.getExactFilePatterns">func (r *searchResolver) getExactFilePatterns() map[string]struct{}</a>

```
searchKey: graphqlbackend.searchResolver.getExactFilePatterns
tags: [method private]
```

```Go
func (r *searchResolver) getExactFilePatterns() map[string]struct{}
```

getExactFilePatterns returns the set of file patterns without glob syntax. 

#### <a id="searchResolver.isGlobalSearch" href="#searchResolver.isGlobalSearch">func (r *searchResolver) isGlobalSearch() bool</a>

```
searchKey: graphqlbackend.searchResolver.isGlobalSearch
tags: [method private]
```

```Go
func (r *searchResolver) isGlobalSearch() bool
```

isGlobalSearch returns true if the query does not contain repo, repogroup, or repohasfile filters. For structural queries, queries with version context, and queries with non-global search context, isGlobalSearch always return false. 

#### <a id="searchResolver.logBatch" href="#searchResolver.logBatch">func (r *searchResolver) logBatch(ctx context.Context, srr *SearchResultsResolver, start time.Time, err error)</a>

```
searchKey: graphqlbackend.searchResolver.logBatch
tags: [method private]
```

```Go
func (r *searchResolver) logBatch(ctx context.Context, srr *SearchResultsResolver, start time.Time, err error)
```

#### <a id="searchResolver.paginatedResults" href="#searchResolver.paginatedResults">func (r *searchResolver) paginatedResults(ctx context.Context) (result *SearchResults, err error)</a>

```
searchKey: graphqlbackend.searchResolver.paginatedResults
tags: [method private]
```

```Go
func (r *searchResolver) paginatedResults(ctx context.Context) (result *SearchResults, err error)
```

paginatedResults handles serving paginated search queries. It's logic does not live alongside the non-paginated doResults because: 

1. It would introduce many `if r.pagination != nil` conditionals which would 

```
make that code harder to reason about.

```
2. That method is already very large and brittle, common logic can be 

```
refactored out instead.

```
3. The way that method operates (mixing in search result types depending on 

```
a timeout, searcing result types in parallel) is fundamentally incompatible
with the absolute ordering we do here for pagination.

```
#### <a id="searchResolver.protocol" href="#searchResolver.protocol">func (r *searchResolver) protocol() search.Protocol</a>

```
searchKey: graphqlbackend.searchResolver.protocol
tags: [method private]
```

```Go
func (r *searchResolver) protocol() search.Protocol
```

protocol returns what type of search we are doing (batch, stream, paginated). 

#### <a id="searchResolver.rawQuery" href="#searchResolver.rawQuery">func (r *searchResolver) rawQuery() string</a>

```
searchKey: graphqlbackend.searchResolver.rawQuery
tags: [method private]
```

```Go
func (r *searchResolver) rawQuery() string
```

rawQuery returns the original query string input. 

#### <a id="searchResolver.reposExist" href="#searchResolver.reposExist">func (r *searchResolver) reposExist(ctx context.Context, options searchrepos.Options) bool</a>

```
searchKey: graphqlbackend.searchResolver.reposExist
tags: [method private]
```

```Go
func (r *searchResolver) reposExist(ctx context.Context, options searchrepos.Options) bool
```

reposExist returns true if one or more repos resolve. If the attempt returns 0 repos or fails, it returns false. It is a helper function for raising NoResolvedRepos alerts with suggestions when we know the original query does not contain any repos to search. 

#### <a id="searchResolver.resolveRepositories" href="#searchResolver.resolveRepositories">func (r *searchResolver) resolveRepositories(ctx context.Context, opts resolveRepositoriesOpts) (resolved searchrepos.Resolved, err error)</a>

```
searchKey: graphqlbackend.searchResolver.resolveRepositories
tags: [method private]
```

```Go
func (r *searchResolver) resolveRepositories(ctx context.Context, opts resolveRepositoriesOpts) (resolved searchrepos.Resolved, err error)
```

resolveRepositories calls ResolveRepositories, caching the result for the common case where opts.effectiveRepoFieldValues == nil. 

#### <a id="searchResolver.resultsBatch" href="#searchResolver.resultsBatch">func (r *searchResolver) resultsBatch(ctx context.Context) (*SearchResultsResolver, error)</a>

```
searchKey: graphqlbackend.searchResolver.resultsBatch
tags: [method private]
```

```Go
func (r *searchResolver) resultsBatch(ctx context.Context) (*SearchResultsResolver, error)
```

#### <a id="searchResolver.resultsRecursive" href="#searchResolver.resultsRecursive">func (r *searchResolver) resultsRecursive(ctx context.Context, plan query.Plan) (sr *SearchResults, err error)</a>

```
searchKey: graphqlbackend.searchResolver.resultsRecursive
tags: [method private]
```

```Go
func (r *searchResolver) resultsRecursive(ctx context.Context, plan query.Plan) (sr *SearchResults, err error)
```

#### <a id="searchResolver.resultsStreaming" href="#searchResolver.resultsStreaming">func (r *searchResolver) resultsStreaming(ctx context.Context) (*SearchResultsResolver, error)</a>

```
searchKey: graphqlbackend.searchResolver.resultsStreaming
tags: [method private]
```

```Go
func (r *searchResolver) resultsStreaming(ctx context.Context) (*SearchResultsResolver, error)
```

#### <a id="searchResolver.resultsToResolver" href="#searchResolver.resultsToResolver">func (r *searchResolver) resultsToResolver(results *SearchResults) *SearchResultsResolver</a>

```
searchKey: graphqlbackend.searchResolver.resultsToResolver
tags: [method private]
```

```Go
func (r *searchResolver) resultsToResolver(results *SearchResults) *SearchResultsResolver
```

#### <a id="searchResolver.resultsWithTimeoutSuggestion" href="#searchResolver.resultsWithTimeoutSuggestion">func (r *searchResolver) resultsWithTimeoutSuggestion(ctx context.Context) (*SearchResults, error)</a>

```
searchKey: graphqlbackend.searchResolver.resultsWithTimeoutSuggestion
tags: [method private]
```

```Go
func (r *searchResolver) resultsWithTimeoutSuggestion(ctx context.Context) (*SearchResults, error)
```

resultsWithTimeoutSuggestion calls doResults, and in case of deadline exceeded returns a search alert with a did-you-mean link for the same query with a longer timeout. 

#### <a id="searchResolver.searchTimeoutFieldSet" href="#searchResolver.searchTimeoutFieldSet">func (r *searchResolver) searchTimeoutFieldSet() bool</a>

```
searchKey: graphqlbackend.searchResolver.searchTimeoutFieldSet
tags: [method private]
```

```Go
func (r *searchResolver) searchTimeoutFieldSet() bool
```

#### <a id="searchResolver.setQuery" href="#searchResolver.setQuery">func (r *searchResolver) setQuery(q []query.Node)</a>

```
searchKey: graphqlbackend.searchResolver.setQuery
tags: [method private]
```

```Go
func (r *searchResolver) setQuery(q []query.Node)
```

setQuery sets a new query in the search resolver, for potentially repeated calls in the search pipeline. The important part is it takes care of invalidating cached repo info. 

#### <a id="searchResolver.sortResults" href="#searchResolver.sortResults">func (r *searchResolver) sortResults(results []result.Match)</a>

```
searchKey: graphqlbackend.searchResolver.sortResults
tags: [method private]
```

```Go
func (r *searchResolver) sortResults(results []result.Match)
```

#### <a id="searchResolver.suggestFilePaths" href="#searchResolver.suggestFilePaths">func (r *searchResolver) suggestFilePaths(ctx context.Context, limit int) ([]SearchSuggestionResolver, error)</a>

```
searchKey: graphqlbackend.searchResolver.suggestFilePaths
tags: [method private]
```

```Go
func (r *searchResolver) suggestFilePaths(ctx context.Context, limit int) ([]SearchSuggestionResolver, error)
```

#### <a id="searchResolver.withTimeout" href="#searchResolver.withTimeout">func (r *searchResolver) withTimeout(ctx context.Context) (context.Context, context.CancelFunc, error)</a>

```
searchKey: graphqlbackend.searchResolver.withTimeout
tags: [method private]
```

```Go
func (r *searchResolver) withTimeout(ctx context.Context) (context.Context, context.CancelFunc, error)
```

### <a id="searchResultMatchResolver" href="#searchResultMatchResolver">type searchResultMatchResolver struct</a>

```
searchKey: graphqlbackend.searchResultMatchResolver
tags: [struct private]
```

```Go
type searchResultMatchResolver struct {
	url        string
	body       string
	highlights []result.HighlightedRange
}
```

A resolver for the GraphQL type GenericSearchMatch 

#### <a id="searchResultMatchResolver.Body" href="#searchResultMatchResolver.Body">func (m *searchResultMatchResolver) Body() Markdown</a>

```
searchKey: graphqlbackend.searchResultMatchResolver.Body
tags: [method private]
```

```Go
func (m *searchResultMatchResolver) Body() Markdown
```

#### <a id="searchResultMatchResolver.Highlights" href="#searchResultMatchResolver.Highlights">func (m *searchResultMatchResolver) Highlights() []highlightedRangeResolver</a>

```
searchKey: graphqlbackend.searchResultMatchResolver.Highlights
tags: [method private]
```

```Go
func (m *searchResultMatchResolver) Highlights() []highlightedRangeResolver
```

#### <a id="searchResultMatchResolver.URL" href="#searchResultMatchResolver.URL">func (m *searchResultMatchResolver) URL() string</a>

```
searchKey: graphqlbackend.searchResultMatchResolver.URL
tags: [method private]
```

```Go
func (m *searchResultMatchResolver) URL() string
```

### <a id="searchResultsStats" href="#searchResultsStats">type searchResultsStats struct</a>

```
searchKey: graphqlbackend.searchResultsStats
tags: [struct private]
```

```Go
type searchResultsStats struct {
	JApproximateResultCount string
	JSparkline              []int32

	sr *searchResolver

	once   sync.Once
	srs    *SearchResultsResolver
	srsErr error
}
```

#### <a id="searchResultsStats.ApproximateResultCount" href="#searchResultsStats.ApproximateResultCount">func (srs *searchResultsStats) ApproximateResultCount() string</a>

```
searchKey: graphqlbackend.searchResultsStats.ApproximateResultCount
tags: [method private]
```

```Go
func (srs *searchResultsStats) ApproximateResultCount() string
```

#### <a id="searchResultsStats.Languages" href="#searchResultsStats.Languages">func (srs *searchResultsStats) Languages(ctx context.Context) ([]*languageStatisticsResolver, error)</a>

```
searchKey: graphqlbackend.searchResultsStats.Languages
tags: [method private]
```

```Go
func (srs *searchResultsStats) Languages(ctx context.Context) ([]*languageStatisticsResolver, error)
```

#### <a id="searchResultsStats.Sparkline" href="#searchResultsStats.Sparkline">func (srs *searchResultsStats) Sparkline() []int32</a>

```
searchKey: graphqlbackend.searchResultsStats.Sparkline
tags: [method private]
```

```Go
func (srs *searchResultsStats) Sparkline() []int32
```

#### <a id="searchResultsStats.getResults" href="#searchResultsStats.getResults">func (srs *searchResultsStats) getResults(ctx context.Context) (*SearchResultsResolver, error)</a>

```
searchKey: graphqlbackend.searchResultsStats.getResults
tags: [method private]
```

```Go
func (srs *searchResultsStats) getResults(ctx context.Context) (*SearchResultsResolver, error)
```

### <a id="searchSuggestionsArgs" href="#searchSuggestionsArgs">type searchSuggestionsArgs struct</a>

```
searchKey: graphqlbackend.searchSuggestionsArgs
tags: [struct private]
```

```Go
type searchSuggestionsArgs struct {
	First *int32
}
```

#### <a id="searchSuggestionsArgs.applyDefaultsAndConstraints" href="#searchSuggestionsArgs.applyDefaultsAndConstraints">func (a *searchSuggestionsArgs) applyDefaultsAndConstraints()</a>

```
searchKey: graphqlbackend.searchSuggestionsArgs.applyDefaultsAndConstraints
tags: [method private]
```

```Go
func (a *searchSuggestionsArgs) applyDefaultsAndConstraints()
```

### <a id="sessionResolver" href="#sessionResolver">type sessionResolver struct</a>

```
searchKey: graphqlbackend.sessionResolver
tags: [struct private]
```

```Go
type sessionResolver struct {
	canSignOut bool
}
```

#### <a id="sessionResolver.CanSignOut" href="#sessionResolver.CanSignOut">func (r *sessionResolver) CanSignOut() bool</a>

```
searchKey: graphqlbackend.sessionResolver.CanSignOut
tags: [method private]
```

```Go
func (r *sessionResolver) CanSignOut() bool
```

### <a id="settingsCascade" href="#settingsCascade">type settingsCascade struct</a>

```
searchKey: graphqlbackend.settingsCascade
tags: [struct private]
```

```Go
type settingsCascade struct {
	db dbutil.DB
	// At most 1 of these fields is set.
	unauthenticatedActor bool
	subject              *settingsSubject
}
```

settingsCascade implements the GraphQL type SettingsCascade (and the deprecated type ConfigurationCascade). 

It resolves settings from multiple sources.  When there is overlap between values, they will be merged in the following cascading order (first is lowest precedence): 

- Global site settings - Organization settings - Current user settings 

#### <a id="settingsCascade.Final" href="#settingsCascade.Final">func (r *settingsCascade) Final(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.settingsCascade.Final
tags: [method private]
```

```Go
func (r *settingsCascade) Final(ctx context.Context) (string, error)
```

#### <a id="settingsCascade.Merged" href="#settingsCascade.Merged">func (r *settingsCascade) Merged(ctx context.Context) (_ *configurationResolver, err error)</a>

```
searchKey: graphqlbackend.settingsCascade.Merged
tags: [method private deprecated]
```

```Go
func (r *settingsCascade) Merged(ctx context.Context) (_ *configurationResolver, err error)
```

Deprecated: in the GraphQL API 

#### <a id="settingsCascade.Subjects" href="#settingsCascade.Subjects">func (r *settingsCascade) Subjects(ctx context.Context) ([]*settingsSubject, error)</a>

```
searchKey: graphqlbackend.settingsCascade.Subjects
tags: [method private]
```

```Go
func (r *settingsCascade) Subjects(ctx context.Context) ([]*settingsSubject, error)
```

### <a id="settingsEdit" href="#settingsEdit">type settingsEdit struct</a>

```
searchKey: graphqlbackend.settingsEdit
tags: [struct private]
```

```Go
type settingsEdit struct {
	KeyPath                   []*keyPathSegment
	Value                     *JSONValue
	ValueIsJSONCEncodedString bool
}
```

### <a id="settingsMutation" href="#settingsMutation">type settingsMutation struct</a>

```
searchKey: graphqlbackend.settingsMutation
tags: [struct private]
```

```Go
type settingsMutation struct {
	db      dbutil.DB
	input   *settingsMutationGroupInput
	subject *settingsSubject
}
```

#### <a id="settingsMutation.EditConfiguration" href="#settingsMutation.EditConfiguration">func (r *settingsMutation) EditConfiguration(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.settingsMutation.EditConfiguration
tags: [method private]
```

```Go
func (r *settingsMutation) EditConfiguration(ctx context.Context, args *struct {
	Edit *settingsEdit
}) (*updateSettingsPayload, error)
```

#### <a id="settingsMutation.EditSettings" href="#settingsMutation.EditSettings">func (r *settingsMutation) EditSettings(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.settingsMutation.EditSettings
tags: [method private]
```

```Go
func (r *settingsMutation) EditSettings(ctx context.Context, args *struct {
	Edit *settingsEdit
}) (*updateSettingsPayload, error)
```

#### <a id="settingsMutation.OverwriteSettings" href="#settingsMutation.OverwriteSettings">func (r *settingsMutation) OverwriteSettings(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.settingsMutation.OverwriteSettings
tags: [method private]
```

```Go
func (r *settingsMutation) OverwriteSettings(ctx context.Context, args *struct {
	Contents string
}) (*updateSettingsPayload, error)
```

#### <a id="settingsMutation.doUpdateSettings" href="#settingsMutation.doUpdateSettings">func (r *settingsMutation) doUpdateSettings(ctx context.Context, computeEdits func(oldSettings string) ([]jsonx.Edit, error)) (idAfterUpdate int32, err error)</a>

```
searchKey: graphqlbackend.settingsMutation.doUpdateSettings
tags: [method private]
```

```Go
func (r *settingsMutation) doUpdateSettings(ctx context.Context, computeEdits func(oldSettings string) ([]jsonx.Edit, error)) (idAfterUpdate int32, err error)
```

doUpdateSettings is a helper for updating settings. 

#### <a id="settingsMutation.editSettings" href="#settingsMutation.editSettings">func (r *settingsMutation) editSettings(ctx context.Context, keyPath jsonx.Path, value interface{}, remove bool) (*updateSettingsPayload, error)</a>

```
searchKey: graphqlbackend.settingsMutation.editSettings
tags: [method private]
```

```Go
func (r *settingsMutation) editSettings(ctx context.Context, keyPath jsonx.Path, value interface{}, remove bool) (*updateSettingsPayload, error)
```

#### <a id="settingsMutation.getCurrentSettings" href="#settingsMutation.getCurrentSettings">func (r *settingsMutation) getCurrentSettings(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.settingsMutation.getCurrentSettings
tags: [method private]
```

```Go
func (r *settingsMutation) getCurrentSettings(ctx context.Context) (string, error)
```

### <a id="settingsMutationGroupInput" href="#settingsMutationGroupInput">type settingsMutationGroupInput struct</a>

```
searchKey: graphqlbackend.settingsMutationGroupInput
tags: [struct private]
```

```Go
type settingsMutationGroupInput struct {
	Subject graphql.ID
	LastID  *int32
}
```

### <a id="settingsResolver" href="#settingsResolver">type settingsResolver struct</a>

```
searchKey: graphqlbackend.settingsResolver
tags: [struct private]
```

```Go
type settingsResolver struct {
	db       dbutil.DB
	subject  *settingsSubject
	settings *api.Settings
	user     *types.User
}
```

#### <a id="settingsResolver.Author" href="#settingsResolver.Author">func (o *settingsResolver) Author(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.settingsResolver.Author
tags: [method private]
```

```Go
func (o *settingsResolver) Author(ctx context.Context) (*UserResolver, error)
```

#### <a id="settingsResolver.Configuration" href="#settingsResolver.Configuration">func (o *settingsResolver) Configuration() *configurationResolver</a>

```
searchKey: graphqlbackend.settingsResolver.Configuration
tags: [method private deprecated]
```

```Go
func (o *settingsResolver) Configuration() *configurationResolver
```

Deprecated: Use the Contents field instead. 

#### <a id="settingsResolver.Contents" href="#settingsResolver.Contents">func (o *settingsResolver) Contents() JSONCString</a>

```
searchKey: graphqlbackend.settingsResolver.Contents
tags: [method private]
```

```Go
func (o *settingsResolver) Contents() JSONCString
```

#### <a id="settingsResolver.CreatedAt" href="#settingsResolver.CreatedAt">func (o *settingsResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.settingsResolver.CreatedAt
tags: [method private]
```

```Go
func (o *settingsResolver) CreatedAt() DateTime
```

#### <a id="settingsResolver.ID" href="#settingsResolver.ID">func (o *settingsResolver) ID() int32</a>

```
searchKey: graphqlbackend.settingsResolver.ID
tags: [method private]
```

```Go
func (o *settingsResolver) ID() int32
```

#### <a id="settingsResolver.Subject" href="#settingsResolver.Subject">func (o *settingsResolver) Subject() *settingsSubject</a>

```
searchKey: graphqlbackend.settingsResolver.Subject
tags: [method private]
```

```Go
func (o *settingsResolver) Subject() *settingsSubject
```

### <a id="settingsSubject" href="#settingsSubject">type settingsSubject struct</a>

```
searchKey: graphqlbackend.settingsSubject
tags: [struct private]
```

```Go
type settingsSubject struct {
	// Exactly 1 of these fields must be set.
	defaultSettings *defaultSettingsResolver
	site            *siteResolver
	org             *OrgResolver
	user            *UserResolver
}
```

#### <a id="settingsSubjectForNode" href="#settingsSubjectForNode">func settingsSubjectForNode(ctx context.Context, n Node) (*settingsSubject, error)</a>

```
searchKey: graphqlbackend.settingsSubjectForNode
tags: [function private]
```

```Go
func settingsSubjectForNode(ctx context.Context, n Node) (*settingsSubject, error)
```

settingsSubjectForNode fetches the settings subject for the given Node. If the node is not a valid settings subject, an error is returned. 

#### <a id="settingsSubject.ConfigurationCascade" href="#settingsSubject.ConfigurationCascade">func (s *settingsSubject) ConfigurationCascade() (*settingsCascade, error)</a>

```
searchKey: graphqlbackend.settingsSubject.ConfigurationCascade
tags: [method private]
```

```Go
func (s *settingsSubject) ConfigurationCascade() (*settingsCascade, error)
```

#### <a id="settingsSubject.ID" href="#settingsSubject.ID">func (s *settingsSubject) ID() (graphql.ID, error)</a>

```
searchKey: graphqlbackend.settingsSubject.ID
tags: [method private]
```

```Go
func (s *settingsSubject) ID() (graphql.ID, error)
```

#### <a id="settingsSubject.LatestSettings" href="#settingsSubject.LatestSettings">func (s *settingsSubject) LatestSettings(ctx context.Context) (*settingsResolver, error)</a>

```
searchKey: graphqlbackend.settingsSubject.LatestSettings
tags: [method private]
```

```Go
func (s *settingsSubject) LatestSettings(ctx context.Context) (*settingsResolver, error)
```

#### <a id="settingsSubject.SettingsCascade" href="#settingsSubject.SettingsCascade">func (s *settingsSubject) SettingsCascade() (*settingsCascade, error)</a>

```
searchKey: graphqlbackend.settingsSubject.SettingsCascade
tags: [method private]
```

```Go
func (s *settingsSubject) SettingsCascade() (*settingsCascade, error)
```

#### <a id="settingsSubject.SettingsURL" href="#settingsSubject.SettingsURL">func (s *settingsSubject) SettingsURL() (*string, error)</a>

```
searchKey: graphqlbackend.settingsSubject.SettingsURL
tags: [method private]
```

```Go
func (s *settingsSubject) SettingsURL() (*string, error)
```

#### <a id="settingsSubject.ToDefaultSettings" href="#settingsSubject.ToDefaultSettings">func (s *settingsSubject) ToDefaultSettings() (*defaultSettingsResolver, bool)</a>

```
searchKey: graphqlbackend.settingsSubject.ToDefaultSettings
tags: [method private]
```

```Go
func (s *settingsSubject) ToDefaultSettings() (*defaultSettingsResolver, bool)
```

#### <a id="settingsSubject.ToOrg" href="#settingsSubject.ToOrg">func (s *settingsSubject) ToOrg() (*OrgResolver, bool)</a>

```
searchKey: graphqlbackend.settingsSubject.ToOrg
tags: [method private]
```

```Go
func (s *settingsSubject) ToOrg() (*OrgResolver, bool)
```

#### <a id="settingsSubject.ToSite" href="#settingsSubject.ToSite">func (s *settingsSubject) ToSite() (*siteResolver, bool)</a>

```
searchKey: graphqlbackend.settingsSubject.ToSite
tags: [method private]
```

```Go
func (s *settingsSubject) ToSite() (*siteResolver, bool)
```

#### <a id="settingsSubject.ToUser" href="#settingsSubject.ToUser">func (s *settingsSubject) ToUser() (*UserResolver, bool)</a>

```
searchKey: graphqlbackend.settingsSubject.ToUser
tags: [method private]
```

```Go
func (s *settingsSubject) ToUser() (*UserResolver, bool)
```

#### <a id="settingsSubject.ViewerCanAdminister" href="#settingsSubject.ViewerCanAdminister">func (s *settingsSubject) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.settingsSubject.ViewerCanAdminister
tags: [method private]
```

```Go
func (s *settingsSubject) ViewerCanAdminister(ctx context.Context) (bool, error)
```

#### <a id="settingsSubject.readSettings" href="#settingsSubject.readSettings">func (s *settingsSubject) readSettings(ctx context.Context, v interface{}) error</a>

```
searchKey: graphqlbackend.settingsSubject.readSettings
tags: [method private]
```

```Go
func (s *settingsSubject) readSettings(ctx context.Context, v interface{}) error
```

readSettings unmarshals s's latest settings into v. 

#### <a id="settingsSubject.toSubject" href="#settingsSubject.toSubject">func (s *settingsSubject) toSubject() api.SettingsSubject</a>

```
searchKey: graphqlbackend.settingsSubject.toSubject
tags: [method private]
```

```Go
func (s *settingsSubject) toSubject() api.SettingsSubject
```

### <a id="showSearchSuggestionResolvers" href="#showSearchSuggestionResolvers">type showSearchSuggestionResolvers func() ([]github.com/sourcegraph/sourcegraph/cmd/frontend/graphqlbackend.SearchSuggestionResolver, error)</a>

```
searchKey: graphqlbackend.showSearchSuggestionResolvers
tags: [function private]
```

```Go
type showSearchSuggestionResolvers func() ([]SearchSuggestionResolver, error)
```

### <a id="signatureResolver" href="#signatureResolver">type signatureResolver struct</a>

```
searchKey: graphqlbackend.signatureResolver
tags: [struct private]
```

```Go
type signatureResolver struct {
	person *PersonResolver
	date   time.Time
}
```

#### <a id="toSignatureResolver" href="#toSignatureResolver">func toSignatureResolver(db dbutil.DB, sig *git.Signature, includeUserInfo bool) *signatureResolver</a>

```
searchKey: graphqlbackend.toSignatureResolver
tags: [function private]
```

```Go
func toSignatureResolver(db dbutil.DB, sig *git.Signature, includeUserInfo bool) *signatureResolver
```

#### <a id="signatureResolver.Date" href="#signatureResolver.Date">func (r signatureResolver) Date() string</a>

```
searchKey: graphqlbackend.signatureResolver.Date
tags: [method private]
```

```Go
func (r signatureResolver) Date() string
```

#### <a id="signatureResolver.Person" href="#signatureResolver.Person">func (r signatureResolver) Person() *PersonResolver</a>

```
searchKey: graphqlbackend.signatureResolver.Person
tags: [method private]
```

```Go
func (r signatureResolver) Person() *PersonResolver
```

### <a id="siteConfigurationResolver" href="#siteConfigurationResolver">type siteConfigurationResolver struct</a>

```
searchKey: graphqlbackend.siteConfigurationResolver
tags: [struct private]
```

```Go
type siteConfigurationResolver struct {
	db dbutil.DB
}
```

#### <a id="siteConfigurationResolver.EffectiveContents" href="#siteConfigurationResolver.EffectiveContents">func (r *siteConfigurationResolver) EffectiveContents(ctx context.Context) (JSONCString, error)</a>

```
searchKey: graphqlbackend.siteConfigurationResolver.EffectiveContents
tags: [method private]
```

```Go
func (r *siteConfigurationResolver) EffectiveContents(ctx context.Context) (JSONCString, error)
```

#### <a id="siteConfigurationResolver.ID" href="#siteConfigurationResolver.ID">func (r *siteConfigurationResolver) ID(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.siteConfigurationResolver.ID
tags: [method private]
```

```Go
func (r *siteConfigurationResolver) ID(ctx context.Context) (int32, error)
```

#### <a id="siteConfigurationResolver.ValidationMessages" href="#siteConfigurationResolver.ValidationMessages">func (r *siteConfigurationResolver) ValidationMessages(ctx context.Context) ([]string, error)</a>

```
searchKey: graphqlbackend.siteConfigurationResolver.ValidationMessages
tags: [method private]
```

```Go
func (r *siteConfigurationResolver) ValidationMessages(ctx context.Context) ([]string, error)
```

### <a id="siteMonitoringStatisticsResolver" href="#siteMonitoringStatisticsResolver">type siteMonitoringStatisticsResolver struct</a>

```
searchKey: graphqlbackend.siteMonitoringStatisticsResolver
tags: [struct private]
```

```Go
type siteMonitoringStatisticsResolver struct {
	prom     srcprometheus.Client
	timespan time.Duration
}
```

#### <a id="siteMonitoringStatisticsResolver.Alerts" href="#siteMonitoringStatisticsResolver.Alerts">func (r *siteMonitoringStatisticsResolver) Alerts(ctx context.Context) ([]*MonitoringAlert, error)</a>

```
searchKey: graphqlbackend.siteMonitoringStatisticsResolver.Alerts
tags: [method private]
```

```Go
func (r *siteMonitoringStatisticsResolver) Alerts(ctx context.Context) ([]*MonitoringAlert, error)
```

### <a id="siteResolver" href="#siteResolver">type siteResolver struct</a>

```
searchKey: graphqlbackend.siteResolver
tags: [struct private]
```

```Go
type siteResolver struct {
	db    dbutil.DB
	gqlID string // == singletonSiteGQLID, not the site ID
}
```

#### <a id="siteResolver.AccessTokens" href="#siteResolver.AccessTokens">func (r *siteResolver) AccessTokens(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.siteResolver.AccessTokens
tags: [method private]
```

```Go
func (r *siteResolver) AccessTokens(ctx context.Context, args *struct {
	graphqlutil.ConnectionArgs
}) (*accessTokenConnectionResolver, error)
```

#### <a id="siteResolver.Alerts" href="#siteResolver.Alerts">func (r *siteResolver) Alerts(ctx context.Context) ([]*Alert, error)</a>

```
searchKey: graphqlbackend.siteResolver.Alerts
tags: [method private]
```

```Go
func (r *siteResolver) Alerts(ctx context.Context) ([]*Alert, error)
```

#### <a id="siteResolver.AllowSiteSettingsEdits" href="#siteResolver.AllowSiteSettingsEdits">func (r *siteResolver) AllowSiteSettingsEdits() bool</a>

```
searchKey: graphqlbackend.siteResolver.AllowSiteSettingsEdits
tags: [method private]
```

```Go
func (r *siteResolver) AllowSiteSettingsEdits() bool
```

#### <a id="siteResolver.AuthProviders" href="#siteResolver.AuthProviders">func (r *siteResolver) AuthProviders(ctx context.Context) (*authProviderConnectionResolver, error)</a>

```
searchKey: graphqlbackend.siteResolver.AuthProviders
tags: [method private]
```

```Go
func (r *siteResolver) AuthProviders(ctx context.Context) (*authProviderConnectionResolver, error)
```

#### <a id="siteResolver.BuildVersion" href="#siteResolver.BuildVersion">func (r *siteResolver) BuildVersion() string</a>

```
searchKey: graphqlbackend.siteResolver.BuildVersion
tags: [method private]
```

```Go
func (r *siteResolver) BuildVersion() string
```

#### <a id="siteResolver.CanReloadSite" href="#siteResolver.CanReloadSite">func (r *siteResolver) CanReloadSite(ctx context.Context) bool</a>

```
searchKey: graphqlbackend.siteResolver.CanReloadSite
tags: [method private]
```

```Go
func (r *siteResolver) CanReloadSite(ctx context.Context) bool
```

#### <a id="siteResolver.Configuration" href="#siteResolver.Configuration">func (r *siteResolver) Configuration(ctx context.Context) (*siteConfigurationResolver, error)</a>

```
searchKey: graphqlbackend.siteResolver.Configuration
tags: [method private]
```

```Go
func (r *siteResolver) Configuration(ctx context.Context) (*siteConfigurationResolver, error)
```

#### <a id="siteResolver.ConfigurationCascade" href="#siteResolver.ConfigurationCascade">func (r *siteResolver) ConfigurationCascade() *settingsCascade</a>

```
searchKey: graphqlbackend.siteResolver.ConfigurationCascade
tags: [method private]
```

```Go
func (r *siteResolver) ConfigurationCascade() *settingsCascade
```

#### <a id="siteResolver.DisableBuiltInSearches" href="#siteResolver.DisableBuiltInSearches">func (*siteResolver) DisableBuiltInSearches() bool</a>

```
searchKey: graphqlbackend.siteResolver.DisableBuiltInSearches
tags: [method private]
```

```Go
func (*siteResolver) DisableBuiltInSearches() bool
```

#### <a id="siteResolver.ExternalAccounts" href="#siteResolver.ExternalAccounts">func (r *siteResolver) ExternalAccounts(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.siteResolver.ExternalAccounts
tags: [method private]
```

```Go
func (r *siteResolver) ExternalAccounts(ctx context.Context, args *struct {
	graphqlutil.ConnectionArgs
	User        *graphql.ID
	ServiceType *string
	ServiceID   *string
	ClientID    *string
}) (*externalAccountConnectionResolver, error)
```

#### <a id="siteResolver.FreeUsersExceeded" href="#siteResolver.FreeUsersExceeded">func (r *siteResolver) FreeUsersExceeded(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.siteResolver.FreeUsersExceeded
tags: [method private]
```

```Go
func (r *siteResolver) FreeUsersExceeded(ctx context.Context) (bool, error)
```

#### <a id="siteResolver.HasCodeIntelligence" href="#siteResolver.HasCodeIntelligence">func (r *siteResolver) HasCodeIntelligence() bool</a>

```
searchKey: graphqlbackend.siteResolver.HasCodeIntelligence
tags: [method private]
```

```Go
func (r *siteResolver) HasCodeIntelligence() bool
```

#### <a id="siteResolver.ID" href="#siteResolver.ID">func (r *siteResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.siteResolver.ID
tags: [method private]
```

```Go
func (r *siteResolver) ID() graphql.ID
```

#### <a id="siteResolver.LatestSettings" href="#siteResolver.LatestSettings">func (r *siteResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)</a>

```
searchKey: graphqlbackend.siteResolver.LatestSettings
tags: [method private]
```

```Go
func (r *siteResolver) LatestSettings(ctx context.Context) (*settingsResolver, error)
```

#### <a id="siteResolver.MonitoringStatistics" href="#siteResolver.MonitoringStatistics">func (r *siteResolver) MonitoringStatistics(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.siteResolver.MonitoringStatistics
tags: [method private]
```

```Go
func (r *siteResolver) MonitoringStatistics(ctx context.Context, args *struct {
	Days *int32
}) (*siteMonitoringStatisticsResolver, error)
```

#### <a id="siteResolver.NeedsRepositoryConfiguration" href="#siteResolver.NeedsRepositoryConfiguration">func (r *siteResolver) NeedsRepositoryConfiguration(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.siteResolver.NeedsRepositoryConfiguration
tags: [method private]
```

```Go
func (r *siteResolver) NeedsRepositoryConfiguration(ctx context.Context) (bool, error)
```

#### <a id="siteResolver.ProductSubscription" href="#siteResolver.ProductSubscription">func (r *siteResolver) ProductSubscription() *productSubscriptionStatus</a>

```
searchKey: graphqlbackend.siteResolver.ProductSubscription
tags: [method private]
```

```Go
func (r *siteResolver) ProductSubscription() *productSubscriptionStatus
```

#### <a id="siteResolver.ProductVersion" href="#siteResolver.ProductVersion">func (r *siteResolver) ProductVersion() string</a>

```
searchKey: graphqlbackend.siteResolver.ProductVersion
tags: [method private]
```

```Go
func (r *siteResolver) ProductVersion() string
```

#### <a id="siteResolver.SendsEmailVerificationEmails" href="#siteResolver.SendsEmailVerificationEmails">func (*siteResolver) SendsEmailVerificationEmails() bool</a>

```
searchKey: graphqlbackend.siteResolver.SendsEmailVerificationEmails
tags: [method private]
```

```Go
func (*siteResolver) SendsEmailVerificationEmails() bool
```

#### <a id="siteResolver.SettingsCascade" href="#siteResolver.SettingsCascade">func (r *siteResolver) SettingsCascade() *settingsCascade</a>

```
searchKey: graphqlbackend.siteResolver.SettingsCascade
tags: [method private]
```

```Go
func (r *siteResolver) SettingsCascade() *settingsCascade
```

#### <a id="siteResolver.SettingsURL" href="#siteResolver.SettingsURL">func (r *siteResolver) SettingsURL() *string</a>

```
searchKey: graphqlbackend.siteResolver.SettingsURL
tags: [method private]
```

```Go
func (r *siteResolver) SettingsURL() *string
```

#### <a id="siteResolver.SiteID" href="#siteResolver.SiteID">func (r *siteResolver) SiteID() string</a>

```
searchKey: graphqlbackend.siteResolver.SiteID
tags: [method private]
```

```Go
func (r *siteResolver) SiteID() string
```

#### <a id="siteResolver.UpdateCheck" href="#siteResolver.UpdateCheck">func (r *siteResolver) UpdateCheck(ctx context.Context) (*updateCheckResolver, error)</a>

```
searchKey: graphqlbackend.siteResolver.UpdateCheck
tags: [method private]
```

```Go
func (r *siteResolver) UpdateCheck(ctx context.Context) (*updateCheckResolver, error)
```

#### <a id="siteResolver.UsageStatistics" href="#siteResolver.UsageStatistics">func (r *siteResolver) UsageStatistics(ctx context.Context, args *struct {...</a>

```
searchKey: graphqlbackend.siteResolver.UsageStatistics
tags: [method private]
```

```Go
func (r *siteResolver) UsageStatistics(ctx context.Context, args *struct {
	Days   *int32
	Weeks  *int32
	Months *int32
}) (*siteUsageStatisticsResolver, error)
```

#### <a id="siteResolver.ViewerCanAdminister" href="#siteResolver.ViewerCanAdminister">func (r *siteResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.siteResolver.ViewerCanAdminister
tags: [method private]
```

```Go
func (r *siteResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

#### <a id="siteResolver.settingsSubject" href="#siteResolver.settingsSubject">func (r *siteResolver) settingsSubject() api.SettingsSubject</a>

```
searchKey: graphqlbackend.siteResolver.settingsSubject
tags: [method private]
```

```Go
func (r *siteResolver) settingsSubject() api.SettingsSubject
```

### <a id="siteUsagePeriodResolver" href="#siteUsagePeriodResolver">type siteUsagePeriodResolver struct</a>

```
searchKey: graphqlbackend.siteUsagePeriodResolver
tags: [struct private]
```

```Go
type siteUsagePeriodResolver struct {
	siteUsagePeriod *types.SiteActivityPeriod
}
```

#### <a id="siteUsagePeriodResolver.AnonymousUserCount" href="#siteUsagePeriodResolver.AnonymousUserCount">func (s *siteUsagePeriodResolver) AnonymousUserCount() int32</a>

```
searchKey: graphqlbackend.siteUsagePeriodResolver.AnonymousUserCount
tags: [method private]
```

```Go
func (s *siteUsagePeriodResolver) AnonymousUserCount() int32
```

#### <a id="siteUsagePeriodResolver.IntegrationUserCount" href="#siteUsagePeriodResolver.IntegrationUserCount">func (s *siteUsagePeriodResolver) IntegrationUserCount() int32</a>

```
searchKey: graphqlbackend.siteUsagePeriodResolver.IntegrationUserCount
tags: [method private]
```

```Go
func (s *siteUsagePeriodResolver) IntegrationUserCount() int32
```

#### <a id="siteUsagePeriodResolver.RegisteredUserCount" href="#siteUsagePeriodResolver.RegisteredUserCount">func (s *siteUsagePeriodResolver) RegisteredUserCount() int32</a>

```
searchKey: graphqlbackend.siteUsagePeriodResolver.RegisteredUserCount
tags: [method private]
```

```Go
func (s *siteUsagePeriodResolver) RegisteredUserCount() int32
```

#### <a id="siteUsagePeriodResolver.StartTime" href="#siteUsagePeriodResolver.StartTime">func (s *siteUsagePeriodResolver) StartTime() string</a>

```
searchKey: graphqlbackend.siteUsagePeriodResolver.StartTime
tags: [method private]
```

```Go
func (s *siteUsagePeriodResolver) StartTime() string
```

#### <a id="siteUsagePeriodResolver.UserCount" href="#siteUsagePeriodResolver.UserCount">func (s *siteUsagePeriodResolver) UserCount() int32</a>

```
searchKey: graphqlbackend.siteUsagePeriodResolver.UserCount
tags: [method private]
```

```Go
func (s *siteUsagePeriodResolver) UserCount() int32
```

### <a id="siteUsageStatisticsResolver" href="#siteUsageStatisticsResolver">type siteUsageStatisticsResolver struct</a>

```
searchKey: graphqlbackend.siteUsageStatisticsResolver
tags: [struct private]
```

```Go
type siteUsageStatisticsResolver struct {
	siteUsageStatistics *types.SiteUsageStatistics
}
```

#### <a id="siteUsageStatisticsResolver.DAUs" href="#siteUsageStatisticsResolver.DAUs">func (s *siteUsageStatisticsResolver) DAUs() []*siteUsagePeriodResolver</a>

```
searchKey: graphqlbackend.siteUsageStatisticsResolver.DAUs
tags: [method private]
```

```Go
func (s *siteUsageStatisticsResolver) DAUs() []*siteUsagePeriodResolver
```

#### <a id="siteUsageStatisticsResolver.MAUs" href="#siteUsageStatisticsResolver.MAUs">func (s *siteUsageStatisticsResolver) MAUs() []*siteUsagePeriodResolver</a>

```
searchKey: graphqlbackend.siteUsageStatisticsResolver.MAUs
tags: [method private]
```

```Go
func (s *siteUsageStatisticsResolver) MAUs() []*siteUsagePeriodResolver
```

#### <a id="siteUsageStatisticsResolver.WAUs" href="#siteUsageStatisticsResolver.WAUs">func (s *siteUsageStatisticsResolver) WAUs() []*siteUsagePeriodResolver</a>

```
searchKey: graphqlbackend.siteUsageStatisticsResolver.WAUs
tags: [method private]
```

```Go
func (s *siteUsageStatisticsResolver) WAUs() []*siteUsagePeriodResolver
```

#### <a id="siteUsageStatisticsResolver.activities" href="#siteUsageStatisticsResolver.activities">func (s *siteUsageStatisticsResolver) activities(periods []*types.SiteActivityPeriod) []*siteUsagePeriodResolver</a>

```
searchKey: graphqlbackend.siteUsageStatisticsResolver.activities
tags: [method private]
```

```Go
func (s *siteUsageStatisticsResolver) activities(periods []*types.SiteActivityPeriod) []*siteUsagePeriodResolver
```

### <a id="slicedSearchResults" href="#slicedSearchResults">type slicedSearchResults struct</a>

```
searchKey: graphqlbackend.slicedSearchResults
tags: [struct private]
```

```Go
type slicedSearchResults struct {
	// results is the new results, sliced.
	results []result.Match

	// common is the new common results structure, updated to reflect the sliced results only.
	common *streaming.Stats

	// resultOffset indicates where the search would continue within the last
	// repository whose results were consumed. For example:
	//
	// 	limit := 5
	// 	results := [a1, a2, a3, b1, b2, b3, c1, c2, c3]
	// 	sliceSearchResults(results, ..., limit).resultOffset = 2 // in repository B, resume at result offset 2 (b3)
	//
	resultOffset int32

	// limitHit indicates if the limit was hit and results were truncated.
	limitHit bool
}
```

#### <a id="sliceSearchResults" href="#sliceSearchResults">func sliceSearchResults(results []result.Match, common *streaming.Stats, offset, limit int) (final slicedSearchResults)</a>

```
searchKey: graphqlbackend.sliceSearchResults
tags: [function private]
```

```Go
func sliceSearchResults(results []result.Match, common *streaming.Stats, offset, limit int) (final slicedSearchResults)
```

sliceSearchResults effectively slices results[offset:offset+limit] and returns an updated Stats structure to reflect that, as well as information about the slicing that was performed. 

### <a id="staticUserConnectionResolver" href="#staticUserConnectionResolver">type staticUserConnectionResolver struct</a>

```
searchKey: graphqlbackend.staticUserConnectionResolver
tags: [struct private]
```

```Go
type staticUserConnectionResolver struct {
	db    dbutil.DB
	users []*types.User
}
```

staticUserConnectionResolver implements the GraphQL type UserConnection based on an underlying list of users that is computed statically. 

#### <a id="staticUserConnectionResolver.Nodes" href="#staticUserConnectionResolver.Nodes">func (r *staticUserConnectionResolver) Nodes() []*UserResolver</a>

```
searchKey: graphqlbackend.staticUserConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *staticUserConnectionResolver) Nodes() []*UserResolver
```

#### <a id="staticUserConnectionResolver.PageInfo" href="#staticUserConnectionResolver.PageInfo">func (r *staticUserConnectionResolver) PageInfo() *graphqlutil.PageInfo</a>

```
searchKey: graphqlbackend.staticUserConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *staticUserConnectionResolver) PageInfo() *graphqlutil.PageInfo
```

#### <a id="staticUserConnectionResolver.TotalCount" href="#staticUserConnectionResolver.TotalCount">func (r *staticUserConnectionResolver) TotalCount() int32</a>

```
searchKey: graphqlbackend.staticUserConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *staticUserConnectionResolver) TotalCount() int32
```

### <a id="statusMessageResolver" href="#statusMessageResolver">type statusMessageResolver struct</a>

```
searchKey: graphqlbackend.statusMessageResolver
tags: [struct private]
```

```Go
type statusMessageResolver struct {
	message repos.StatusMessage
	db      dbutil.DB
}
```

#### <a id="statusMessageResolver.ExternalService" href="#statusMessageResolver.ExternalService">func (r *statusMessageResolver) ExternalService(ctx context.Context) (*externalServiceResolver, error)</a>

```
searchKey: graphqlbackend.statusMessageResolver.ExternalService
tags: [method private]
```

```Go
func (r *statusMessageResolver) ExternalService(ctx context.Context) (*externalServiceResolver, error)
```

#### <a id="statusMessageResolver.Message" href="#statusMessageResolver.Message">func (r *statusMessageResolver) Message() (string, error)</a>

```
searchKey: graphqlbackend.statusMessageResolver.Message
tags: [method private]
```

```Go
func (r *statusMessageResolver) Message() (string, error)
```

#### <a id="statusMessageResolver.ToCloningProgress" href="#statusMessageResolver.ToCloningProgress">func (r *statusMessageResolver) ToCloningProgress() (*statusMessageResolver, bool)</a>

```
searchKey: graphqlbackend.statusMessageResolver.ToCloningProgress
tags: [method private]
```

```Go
func (r *statusMessageResolver) ToCloningProgress() (*statusMessageResolver, bool)
```

#### <a id="statusMessageResolver.ToExternalServiceSyncError" href="#statusMessageResolver.ToExternalServiceSyncError">func (r *statusMessageResolver) ToExternalServiceSyncError() (*statusMessageResolver, bool)</a>

```
searchKey: graphqlbackend.statusMessageResolver.ToExternalServiceSyncError
tags: [method private]
```

```Go
func (r *statusMessageResolver) ToExternalServiceSyncError() (*statusMessageResolver, bool)
```

#### <a id="statusMessageResolver.ToIndexingProgress" href="#statusMessageResolver.ToIndexingProgress">func (r *statusMessageResolver) ToIndexingProgress() (*statusMessageResolver, bool)</a>

```
searchKey: graphqlbackend.statusMessageResolver.ToIndexingProgress
tags: [method private]
```

```Go
func (r *statusMessageResolver) ToIndexingProgress() (*statusMessageResolver, bool)
```

#### <a id="statusMessageResolver.ToSyncError" href="#statusMessageResolver.ToSyncError">func (r *statusMessageResolver) ToSyncError() (*statusMessageResolver, bool)</a>

```
searchKey: graphqlbackend.statusMessageResolver.ToSyncError
tags: [method private]
```

```Go
func (r *statusMessageResolver) ToSyncError() (*statusMessageResolver, bool)
```

### <a id="suggestionKey" href="#suggestionKey">type suggestionKey struct</a>

```
searchKey: graphqlbackend.suggestionKey
tags: [struct private]
```

```Go
type suggestionKey struct {
	repoName          string
	repoRev           string
	file              string
	symbol            string
	lang              string
	url               string
	searchContextSpec string
}
```

### <a id="surveyResponseConnectionResolver" href="#surveyResponseConnectionResolver">type surveyResponseConnectionResolver struct</a>

```
searchKey: graphqlbackend.surveyResponseConnectionResolver
tags: [struct private]
```

```Go
type surveyResponseConnectionResolver struct {
	db  dbutil.DB
	opt database.SurveyResponseListOptions
}
```

#### <a id="surveyResponseConnectionResolver.AverageScore" href="#surveyResponseConnectionResolver.AverageScore">func (r *surveyResponseConnectionResolver) AverageScore(ctx context.Context) (float64, error)</a>

```
searchKey: graphqlbackend.surveyResponseConnectionResolver.AverageScore
tags: [method private]
```

```Go
func (r *surveyResponseConnectionResolver) AverageScore(ctx context.Context) (float64, error)
```

#### <a id="surveyResponseConnectionResolver.Last30DaysCount" href="#surveyResponseConnectionResolver.Last30DaysCount">func (r *surveyResponseConnectionResolver) Last30DaysCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.surveyResponseConnectionResolver.Last30DaysCount
tags: [method private]
```

```Go
func (r *surveyResponseConnectionResolver) Last30DaysCount(ctx context.Context) (int32, error)
```

#### <a id="surveyResponseConnectionResolver.NetPromoterScore" href="#surveyResponseConnectionResolver.NetPromoterScore">func (r *surveyResponseConnectionResolver) NetPromoterScore(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.surveyResponseConnectionResolver.NetPromoterScore
tags: [method private]
```

```Go
func (r *surveyResponseConnectionResolver) NetPromoterScore(ctx context.Context) (int32, error)
```

#### <a id="surveyResponseConnectionResolver.Nodes" href="#surveyResponseConnectionResolver.Nodes">func (r *surveyResponseConnectionResolver) Nodes(ctx context.Context) ([]*surveyResponseResolver, error)</a>

```
searchKey: graphqlbackend.surveyResponseConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *surveyResponseConnectionResolver) Nodes(ctx context.Context) ([]*surveyResponseResolver, error)
```

#### <a id="surveyResponseConnectionResolver.TotalCount" href="#surveyResponseConnectionResolver.TotalCount">func (r *surveyResponseConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.surveyResponseConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *surveyResponseConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

### <a id="surveyResponseResolver" href="#surveyResponseResolver">type surveyResponseResolver struct</a>

```
searchKey: graphqlbackend.surveyResponseResolver
tags: [struct private]
```

```Go
type surveyResponseResolver struct {
	db             dbutil.DB
	surveyResponse *types.SurveyResponse
}
```

#### <a id="surveyResponseResolver.Better" href="#surveyResponseResolver.Better">func (s *surveyResponseResolver) Better() *string</a>

```
searchKey: graphqlbackend.surveyResponseResolver.Better
tags: [method private]
```

```Go
func (s *surveyResponseResolver) Better() *string
```

#### <a id="surveyResponseResolver.CreatedAt" href="#surveyResponseResolver.CreatedAt">func (s *surveyResponseResolver) CreatedAt() DateTime</a>

```
searchKey: graphqlbackend.surveyResponseResolver.CreatedAt
tags: [method private]
```

```Go
func (s *surveyResponseResolver) CreatedAt() DateTime
```

#### <a id="surveyResponseResolver.Email" href="#surveyResponseResolver.Email">func (s *surveyResponseResolver) Email() *string</a>

```
searchKey: graphqlbackend.surveyResponseResolver.Email
tags: [method private]
```

```Go
func (s *surveyResponseResolver) Email() *string
```

#### <a id="surveyResponseResolver.ID" href="#surveyResponseResolver.ID">func (s *surveyResponseResolver) ID() graphql.ID</a>

```
searchKey: graphqlbackend.surveyResponseResolver.ID
tags: [method private]
```

```Go
func (s *surveyResponseResolver) ID() graphql.ID
```

#### <a id="surveyResponseResolver.Reason" href="#surveyResponseResolver.Reason">func (s *surveyResponseResolver) Reason() *string</a>

```
searchKey: graphqlbackend.surveyResponseResolver.Reason
tags: [method private]
```

```Go
func (s *surveyResponseResolver) Reason() *string
```

#### <a id="surveyResponseResolver.Score" href="#surveyResponseResolver.Score">func (s *surveyResponseResolver) Score() int32</a>

```
searchKey: graphqlbackend.surveyResponseResolver.Score
tags: [method private]
```

```Go
func (s *surveyResponseResolver) Score() int32
```

#### <a id="surveyResponseResolver.User" href="#surveyResponseResolver.User">func (s *surveyResponseResolver) User(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.surveyResponseResolver.User
tags: [method private]
```

```Go
func (s *surveyResponseResolver) User(ctx context.Context) (*UserResolver, error)
```

### <a id="surveySubmissionForHubSpot" href="#surveySubmissionForHubSpot">type surveySubmissionForHubSpot struct</a>

```
searchKey: graphqlbackend.surveySubmissionForHubSpot
tags: [struct private]
```

```Go
type surveySubmissionForHubSpot struct {
	Email           *string `url:"email"`
	Score           int32   `url:"nps_score"`
	Reason          *string `url:"nps_reason"`
	Better          *string `url:"nps_improvement"`
	IsAuthenticated bool    `url:"user_is_authenticated"`
	SiteID          string  `url:"site_id"`
}
```

### <a id="symbolConnectionResolver" href="#symbolConnectionResolver">type symbolConnectionResolver struct</a>

```
searchKey: graphqlbackend.symbolConnectionResolver
tags: [struct private]
```

```Go
type symbolConnectionResolver struct {
	first   *int32
	symbols []symbolResolver
}
```

#### <a id="symbolConnectionResolver.Nodes" href="#symbolConnectionResolver.Nodes">func (r *symbolConnectionResolver) Nodes(ctx context.Context) ([]symbolResolver, error)</a>

```
searchKey: graphqlbackend.symbolConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *symbolConnectionResolver) Nodes(ctx context.Context) ([]symbolResolver, error)
```

#### <a id="symbolConnectionResolver.PageInfo" href="#symbolConnectionResolver.PageInfo">func (r *symbolConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.symbolConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *symbolConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="symbolResolver" href="#symbolResolver">type symbolResolver struct</a>

```
searchKey: graphqlbackend.symbolResolver
tags: [struct private]
```

```Go
type symbolResolver struct {
	db     dbutil.DB
	commit *GitCommitResolver
	*result.SymbolMatch
}
```

#### <a id="toSymbolResolver" href="#toSymbolResolver">func toSymbolResolver(db dbutil.DB, commit *GitCommitResolver, sr *result.SymbolMatch) symbolResolver</a>

```
searchKey: graphqlbackend.toSymbolResolver
tags: [function private]
```

```Go
func toSymbolResolver(db dbutil.DB, commit *GitCommitResolver, sr *result.SymbolMatch) symbolResolver
```

#### <a id="symbolResolver.CanonicalURL" href="#symbolResolver.CanonicalURL">func (r symbolResolver) CanonicalURL() string</a>

```
searchKey: graphqlbackend.symbolResolver.CanonicalURL
tags: [method private]
```

```Go
func (r symbolResolver) CanonicalURL() string
```

#### <a id="symbolResolver.ContainerName" href="#symbolResolver.ContainerName">func (r symbolResolver) ContainerName() *string</a>

```
searchKey: graphqlbackend.symbolResolver.ContainerName
tags: [method private]
```

```Go
func (r symbolResolver) ContainerName() *string
```

#### <a id="symbolResolver.FileLocal" href="#symbolResolver.FileLocal">func (r symbolResolver) FileLocal() bool</a>

```
searchKey: graphqlbackend.symbolResolver.FileLocal
tags: [method private]
```

```Go
func (r symbolResolver) FileLocal() bool
```

#### <a id="symbolResolver.Kind" href="#symbolResolver.Kind">func (r symbolResolver) Kind() string</a>

```
searchKey: graphqlbackend.symbolResolver.Kind
tags: [method private]
```

```Go
func (r symbolResolver) Kind() string
```

#### <a id="symbolResolver.Language" href="#symbolResolver.Language">func (r symbolResolver) Language() string</a>

```
searchKey: graphqlbackend.symbolResolver.Language
tags: [method private]
```

```Go
func (r symbolResolver) Language() string
```

#### <a id="symbolResolver.Location" href="#symbolResolver.Location">func (r symbolResolver) Location() *locationResolver</a>

```
searchKey: graphqlbackend.symbolResolver.Location
tags: [method private]
```

```Go
func (r symbolResolver) Location() *locationResolver
```

#### <a id="symbolResolver.Name" href="#symbolResolver.Name">func (r symbolResolver) Name() string</a>

```
searchKey: graphqlbackend.symbolResolver.Name
tags: [method private]
```

```Go
func (r symbolResolver) Name() string
```

#### <a id="symbolResolver.URL" href="#symbolResolver.URL">func (r symbolResolver) URL(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.symbolResolver.URL
tags: [method private]
```

```Go
func (r symbolResolver) URL(ctx context.Context) (string, error)
```

### <a id="symbolSuggestionResolver" href="#symbolSuggestionResolver">type symbolSuggestionResolver struct</a>

```
searchKey: graphqlbackend.symbolSuggestionResolver
tags: [struct private]
```

```Go
type symbolSuggestionResolver struct {
	baseSuggestionResolver
	symbol symbolResolver
	score  int
}
```

symbolSuggestionResolver implements searchSuggestionResolver for symbolResolver 

#### <a id="symbolSuggestionResolver.Key" href="#symbolSuggestionResolver.Key">func (s symbolSuggestionResolver) Key() suggestionKey</a>

```
searchKey: graphqlbackend.symbolSuggestionResolver.Key
tags: [method private]
```

```Go
func (s symbolSuggestionResolver) Key() suggestionKey
```

#### <a id="symbolSuggestionResolver.Label" href="#symbolSuggestionResolver.Label">func (s symbolSuggestionResolver) Label() string</a>

```
searchKey: graphqlbackend.symbolSuggestionResolver.Label
tags: [method private]
```

```Go
func (s symbolSuggestionResolver) Label() string
```

#### <a id="symbolSuggestionResolver.Length" href="#symbolSuggestionResolver.Length">func (s symbolSuggestionResolver) Length() int</a>

```
searchKey: graphqlbackend.symbolSuggestionResolver.Length
tags: [method private]
```

```Go
func (s symbolSuggestionResolver) Length() int
```

#### <a id="symbolSuggestionResolver.Score" href="#symbolSuggestionResolver.Score">func (s symbolSuggestionResolver) Score() int</a>

```
searchKey: graphqlbackend.symbolSuggestionResolver.Score
tags: [method private]
```

```Go
func (s symbolSuggestionResolver) Score() int
```

#### <a id="symbolSuggestionResolver.ToSymbol" href="#symbolSuggestionResolver.ToSymbol">func (s symbolSuggestionResolver) ToSymbol() (*symbolResolver, bool)</a>

```
searchKey: graphqlbackend.symbolSuggestionResolver.ToSymbol
tags: [method private]
```

```Go
func (s symbolSuggestionResolver) ToSymbol() (*symbolResolver, bool)
```

### <a id="symbolsArgs" href="#symbolsArgs">type symbolsArgs struct</a>

```
searchKey: graphqlbackend.symbolsArgs
tags: [struct private]
```

```Go
type symbolsArgs struct {
	graphqlutil.ConnectionArgs
	Query           *string
	IncludePatterns *[]string
}
```

### <a id="trialRequestForHubSpot" href="#trialRequestForHubSpot">type trialRequestForHubSpot struct</a>

```
searchKey: graphqlbackend.trialRequestForHubSpot
tags: [struct private]
```

```Go
type trialRequestForHubSpot struct {
	Email  *string `url:"email"`
	SiteID string  `url:"site_id"`
}
```

### <a id="updateCheckResolver" href="#updateCheckResolver">type updateCheckResolver struct</a>

```
searchKey: graphqlbackend.updateCheckResolver
tags: [struct private]
```

```Go
type updateCheckResolver struct {
	last    *updatecheck.Status
	pending bool
}
```

#### <a id="updateCheckResolver.CheckedAt" href="#updateCheckResolver.CheckedAt">func (r *updateCheckResolver) CheckedAt() *DateTime</a>

```
searchKey: graphqlbackend.updateCheckResolver.CheckedAt
tags: [method private]
```

```Go
func (r *updateCheckResolver) CheckedAt() *DateTime
```

#### <a id="updateCheckResolver.ErrorMessage" href="#updateCheckResolver.ErrorMessage">func (r *updateCheckResolver) ErrorMessage() *string</a>

```
searchKey: graphqlbackend.updateCheckResolver.ErrorMessage
tags: [method private]
```

```Go
func (r *updateCheckResolver) ErrorMessage() *string
```

#### <a id="updateCheckResolver.Pending" href="#updateCheckResolver.Pending">func (r *updateCheckResolver) Pending() bool</a>

```
searchKey: graphqlbackend.updateCheckResolver.Pending
tags: [method private]
```

```Go
func (r *updateCheckResolver) Pending() bool
```

#### <a id="updateCheckResolver.UpdateVersionAvailable" href="#updateCheckResolver.UpdateVersionAvailable">func (r *updateCheckResolver) UpdateVersionAvailable() *string</a>

```
searchKey: graphqlbackend.updateCheckResolver.UpdateVersionAvailable
tags: [method private]
```

```Go
func (r *updateCheckResolver) UpdateVersionAvailable() *string
```

### <a id="updateExternalServiceArgs" href="#updateExternalServiceArgs">type updateExternalServiceArgs struct</a>

```
searchKey: graphqlbackend.updateExternalServiceArgs
tags: [struct private]
```

```Go
type updateExternalServiceArgs struct {
	Input updateExternalServiceInput
}
```

### <a id="updateExternalServiceInput" href="#updateExternalServiceInput">type updateExternalServiceInput struct</a>

```
searchKey: graphqlbackend.updateExternalServiceInput
tags: [struct private]
```

```Go
type updateExternalServiceInput struct {
	ID          graphql.ID
	DisplayName *string
	Config      *string
}
```

### <a id="updateQueueResolver" href="#updateQueueResolver">type updateQueueResolver struct</a>

```
searchKey: graphqlbackend.updateQueueResolver
tags: [struct private]
```

```Go
type updateQueueResolver struct {
	queue *repoupdaterprotocol.RepoQueueState
}
```

#### <a id="updateQueueResolver.Index" href="#updateQueueResolver.Index">func (r *updateQueueResolver) Index() int32</a>

```
searchKey: graphqlbackend.updateQueueResolver.Index
tags: [method private]
```

```Go
func (r *updateQueueResolver) Index() int32
```

#### <a id="updateQueueResolver.Total" href="#updateQueueResolver.Total">func (r *updateQueueResolver) Total() int32</a>

```
searchKey: graphqlbackend.updateQueueResolver.Total
tags: [method private]
```

```Go
func (r *updateQueueResolver) Total() int32
```

#### <a id="updateQueueResolver.Updating" href="#updateQueueResolver.Updating">func (r *updateQueueResolver) Updating() bool</a>

```
searchKey: graphqlbackend.updateQueueResolver.Updating
tags: [method private]
```

```Go
func (r *updateQueueResolver) Updating() bool
```

### <a id="updateScheduleResolver" href="#updateScheduleResolver">type updateScheduleResolver struct</a>

```
searchKey: graphqlbackend.updateScheduleResolver
tags: [struct private]
```

```Go
type updateScheduleResolver struct {
	schedule *repoupdaterprotocol.RepoScheduleState
}
```

#### <a id="updateScheduleResolver.Due" href="#updateScheduleResolver.Due">func (r *updateScheduleResolver) Due() DateTime</a>

```
searchKey: graphqlbackend.updateScheduleResolver.Due
tags: [method private]
```

```Go
func (r *updateScheduleResolver) Due() DateTime
```

#### <a id="updateScheduleResolver.Index" href="#updateScheduleResolver.Index">func (r *updateScheduleResolver) Index() int32</a>

```
searchKey: graphqlbackend.updateScheduleResolver.Index
tags: [method private]
```

```Go
func (r *updateScheduleResolver) Index() int32
```

#### <a id="updateScheduleResolver.IntervalSeconds" href="#updateScheduleResolver.IntervalSeconds">func (r *updateScheduleResolver) IntervalSeconds() int32</a>

```
searchKey: graphqlbackend.updateScheduleResolver.IntervalSeconds
tags: [method private]
```

```Go
func (r *updateScheduleResolver) IntervalSeconds() int32
```

#### <a id="updateScheduleResolver.Total" href="#updateScheduleResolver.Total">func (r *updateScheduleResolver) Total() int32</a>

```
searchKey: graphqlbackend.updateScheduleResolver.Total
tags: [method private]
```

```Go
func (r *updateScheduleResolver) Total() int32
```

### <a id="updateSearchContextArgs" href="#updateSearchContextArgs">type updateSearchContextArgs struct</a>

```
searchKey: graphqlbackend.updateSearchContextArgs
tags: [struct private]
```

```Go
type updateSearchContextArgs struct {
	ID            graphql.ID
	SearchContext searchContextEditInputArgs
	Repositories  []searchContextRepositoryRevisionsInputArgs
}
```

### <a id="updateSettingsPayload" href="#updateSettingsPayload">type updateSettingsPayload struct{}</a>

```
searchKey: graphqlbackend.updateSettingsPayload
tags: [struct private]
```

```Go
type updateSettingsPayload struct{}
```

#### <a id="updateSettingsPayload.Empty" href="#updateSettingsPayload.Empty">func (updateSettingsPayload) Empty() *EmptyResponse</a>

```
searchKey: graphqlbackend.updateSettingsPayload.Empty
tags: [method private]
```

```Go
func (updateSettingsPayload) Empty() *EmptyResponse
```

### <a id="updateUserArgs" href="#updateUserArgs">type updateUserArgs struct</a>

```
searchKey: graphqlbackend.updateUserArgs
tags: [struct private]
```

```Go
type updateUserArgs struct {
	User        graphql.ID
	Username    *string
	DisplayName *string
	AvatarURL   *string
}
```

### <a id="userConnectionResolver" href="#userConnectionResolver">type userConnectionResolver struct</a>

```
searchKey: graphqlbackend.userConnectionResolver
tags: [struct private]
```

```Go
type userConnectionResolver struct {
	db           dbutil.DB
	opt          database.UsersListOptions
	activePeriod *string

	// cache results because they are used by multiple fields
	once       sync.Once
	users      []*types.User
	totalCount int
	err        error
}
```

#### <a id="userConnectionResolver.Nodes" href="#userConnectionResolver.Nodes">func (r *userConnectionResolver) Nodes(ctx context.Context) ([]*UserResolver, error)</a>

```
searchKey: graphqlbackend.userConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *userConnectionResolver) Nodes(ctx context.Context) ([]*UserResolver, error)
```

#### <a id="userConnectionResolver.PageInfo" href="#userConnectionResolver.PageInfo">func (r *userConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.userConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *userConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="userConnectionResolver.TotalCount" href="#userConnectionResolver.TotalCount">func (r *userConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.userConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *userConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="userConnectionResolver.compute" href="#userConnectionResolver.compute">func (r *userConnectionResolver) compute(ctx context.Context) ([]*types.User, int, error)</a>

```
searchKey: graphqlbackend.userConnectionResolver.compute
tags: [method private]
```

```Go
func (r *userConnectionResolver) compute(ctx context.Context) ([]*types.User, int, error)
```

compute caches results from the more expensive user list creation that occurs when activePeriod is set to a specific length of time. 

#### <a id="userConnectionResolver.useCache" href="#userConnectionResolver.useCache">func (r *userConnectionResolver) useCache() bool</a>

```
searchKey: graphqlbackend.userConnectionResolver.useCache
tags: [method private]
```

```Go
func (r *userConnectionResolver) useCache() bool
```

### <a id="userEmailResolver" href="#userEmailResolver">type userEmailResolver struct</a>

```
searchKey: graphqlbackend.userEmailResolver
tags: [struct private]
```

```Go
type userEmailResolver struct {
	db        dbutil.DB
	userEmail database.UserEmail
	user      *UserResolver
}
```

#### <a id="userEmailResolver.Email" href="#userEmailResolver.Email">func (r *userEmailResolver) Email() string</a>

```
searchKey: graphqlbackend.userEmailResolver.Email
tags: [method private]
```

```Go
func (r *userEmailResolver) Email() string
```

#### <a id="userEmailResolver.IsPrimary" href="#userEmailResolver.IsPrimary">func (r *userEmailResolver) IsPrimary(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.userEmailResolver.IsPrimary
tags: [method private]
```

```Go
func (r *userEmailResolver) IsPrimary(ctx context.Context) (bool, error)
```

#### <a id="userEmailResolver.User" href="#userEmailResolver.User">func (r *userEmailResolver) User() *UserResolver</a>

```
searchKey: graphqlbackend.userEmailResolver.User
tags: [method private]
```

```Go
func (r *userEmailResolver) User() *UserResolver
```

#### <a id="userEmailResolver.VerificationPending" href="#userEmailResolver.VerificationPending">func (r *userEmailResolver) VerificationPending() bool</a>

```
searchKey: graphqlbackend.userEmailResolver.VerificationPending
tags: [method private]
```

```Go
func (r *userEmailResolver) VerificationPending() bool
```

#### <a id="userEmailResolver.Verified" href="#userEmailResolver.Verified">func (r *userEmailResolver) Verified() bool</a>

```
searchKey: graphqlbackend.userEmailResolver.Verified
tags: [method private]
```

```Go
func (r *userEmailResolver) Verified() bool
```

#### <a id="userEmailResolver.ViewerCanManuallyVerify" href="#userEmailResolver.ViewerCanManuallyVerify">func (r *userEmailResolver) ViewerCanManuallyVerify(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.userEmailResolver.ViewerCanManuallyVerify
tags: [method private]
```

```Go
func (r *userEmailResolver) ViewerCanManuallyVerify(ctx context.Context) (bool, error)
```

### <a id="userEventLogResolver" href="#userEventLogResolver">type userEventLogResolver struct</a>

```
searchKey: graphqlbackend.userEventLogResolver
tags: [struct private]
```

```Go
type userEventLogResolver struct {
	db    dbutil.DB
	event *types.Event
}
```

#### <a id="userEventLogResolver.AnonymousUserID" href="#userEventLogResolver.AnonymousUserID">func (s *userEventLogResolver) AnonymousUserID() string</a>

```
searchKey: graphqlbackend.userEventLogResolver.AnonymousUserID
tags: [method private]
```

```Go
func (s *userEventLogResolver) AnonymousUserID() string
```

#### <a id="userEventLogResolver.Argument" href="#userEventLogResolver.Argument">func (s *userEventLogResolver) Argument() *string</a>

```
searchKey: graphqlbackend.userEventLogResolver.Argument
tags: [method private]
```

```Go
func (s *userEventLogResolver) Argument() *string
```

#### <a id="userEventLogResolver.Name" href="#userEventLogResolver.Name">func (s *userEventLogResolver) Name() string</a>

```
searchKey: graphqlbackend.userEventLogResolver.Name
tags: [method private]
```

```Go
func (s *userEventLogResolver) Name() string
```

#### <a id="userEventLogResolver.Source" href="#userEventLogResolver.Source">func (s *userEventLogResolver) Source() string</a>

```
searchKey: graphqlbackend.userEventLogResolver.Source
tags: [method private]
```

```Go
func (s *userEventLogResolver) Source() string
```

#### <a id="userEventLogResolver.Timestamp" href="#userEventLogResolver.Timestamp">func (s *userEventLogResolver) Timestamp() DateTime</a>

```
searchKey: graphqlbackend.userEventLogResolver.Timestamp
tags: [method private]
```

```Go
func (s *userEventLogResolver) Timestamp() DateTime
```

#### <a id="userEventLogResolver.URL" href="#userEventLogResolver.URL">func (s *userEventLogResolver) URL() string</a>

```
searchKey: graphqlbackend.userEventLogResolver.URL
tags: [method private]
```

```Go
func (s *userEventLogResolver) URL() string
```

#### <a id="userEventLogResolver.User" href="#userEventLogResolver.User">func (s *userEventLogResolver) User(ctx context.Context) (*UserResolver, error)</a>

```
searchKey: graphqlbackend.userEventLogResolver.User
tags: [method private]
```

```Go
func (s *userEventLogResolver) User(ctx context.Context) (*UserResolver, error)
```

#### <a id="userEventLogResolver.Version" href="#userEventLogResolver.Version">func (s *userEventLogResolver) Version() string</a>

```
searchKey: graphqlbackend.userEventLogResolver.Version
tags: [method private]
```

```Go
func (s *userEventLogResolver) Version() string
```

### <a id="userEventLogsConnectionResolver" href="#userEventLogsConnectionResolver">type userEventLogsConnectionResolver struct</a>

```
searchKey: graphqlbackend.userEventLogsConnectionResolver
tags: [struct private]
```

```Go
type userEventLogsConnectionResolver struct {
	db  dbutil.DB
	opt database.EventLogsListOptions
}
```

#### <a id="userEventLogsConnectionResolver.Nodes" href="#userEventLogsConnectionResolver.Nodes">func (r *userEventLogsConnectionResolver) Nodes(ctx context.Context) ([]*userEventLogResolver, error)</a>

```
searchKey: graphqlbackend.userEventLogsConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *userEventLogsConnectionResolver) Nodes(ctx context.Context) ([]*userEventLogResolver, error)
```

#### <a id="userEventLogsConnectionResolver.PageInfo" href="#userEventLogsConnectionResolver.PageInfo">func (r *userEventLogsConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: graphqlbackend.userEventLogsConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *userEventLogsConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="userEventLogsConnectionResolver.TotalCount" href="#userEventLogsConnectionResolver.TotalCount">func (r *userEventLogsConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.userEventLogsConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *userEventLogsConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

### <a id="userUsageStatisticsResolver" href="#userUsageStatisticsResolver">type userUsageStatisticsResolver struct</a>

```
searchKey: graphqlbackend.userUsageStatisticsResolver
tags: [struct private]
```

```Go
type userUsageStatisticsResolver struct {
	userUsageStatistics *types.UserUsageStatistics
}
```

#### <a id="userUsageStatisticsResolver.CodeIntelligenceActions" href="#userUsageStatisticsResolver.CodeIntelligenceActions">func (s *userUsageStatisticsResolver) CodeIntelligenceActions() int32</a>

```
searchKey: graphqlbackend.userUsageStatisticsResolver.CodeIntelligenceActions
tags: [method private]
```

```Go
func (s *userUsageStatisticsResolver) CodeIntelligenceActions() int32
```

#### <a id="userUsageStatisticsResolver.FindReferencesActions" href="#userUsageStatisticsResolver.FindReferencesActions">func (s *userUsageStatisticsResolver) FindReferencesActions() int32</a>

```
searchKey: graphqlbackend.userUsageStatisticsResolver.FindReferencesActions
tags: [method private]
```

```Go
func (s *userUsageStatisticsResolver) FindReferencesActions() int32
```

#### <a id="userUsageStatisticsResolver.LastActiveCodeHostIntegrationTime" href="#userUsageStatisticsResolver.LastActiveCodeHostIntegrationTime">func (s *userUsageStatisticsResolver) LastActiveCodeHostIntegrationTime() *string</a>

```
searchKey: graphqlbackend.userUsageStatisticsResolver.LastActiveCodeHostIntegrationTime
tags: [method private]
```

```Go
func (s *userUsageStatisticsResolver) LastActiveCodeHostIntegrationTime() *string
```

#### <a id="userUsageStatisticsResolver.LastActiveTime" href="#userUsageStatisticsResolver.LastActiveTime">func (s *userUsageStatisticsResolver) LastActiveTime() *string</a>

```
searchKey: graphqlbackend.userUsageStatisticsResolver.LastActiveTime
tags: [method private]
```

```Go
func (s *userUsageStatisticsResolver) LastActiveTime() *string
```

#### <a id="userUsageStatisticsResolver.PageViews" href="#userUsageStatisticsResolver.PageViews">func (s *userUsageStatisticsResolver) PageViews() int32</a>

```
searchKey: graphqlbackend.userUsageStatisticsResolver.PageViews
tags: [method private]
```

```Go
func (s *userUsageStatisticsResolver) PageViews() int32
```

#### <a id="userUsageStatisticsResolver.SearchQueries" href="#userUsageStatisticsResolver.SearchQueries">func (s *userUsageStatisticsResolver) SearchQueries() int32</a>

```
searchKey: graphqlbackend.userUsageStatisticsResolver.SearchQueries
tags: [method private]
```

```Go
func (s *userUsageStatisticsResolver) SearchQueries() int32
```

### <a id="versionContextResolver" href="#versionContextResolver">type versionContextResolver struct</a>

```
searchKey: graphqlbackend.versionContextResolver
tags: [struct private]
```

```Go
type versionContextResolver struct {
	vc *schema.VersionContext
}
```

#### <a id="NewVersionContextResolver" href="#NewVersionContextResolver">func NewVersionContextResolver(vc *schema.VersionContext) *versionContextResolver</a>

```
searchKey: graphqlbackend.NewVersionContextResolver
tags: [function]
```

```Go
func NewVersionContextResolver(vc *schema.VersionContext) *versionContextResolver
```

#### <a id="versionContextResolver.Description" href="#versionContextResolver.Description">func (v *versionContextResolver) Description() string</a>

```
searchKey: graphqlbackend.versionContextResolver.Description
tags: [method private]
```

```Go
func (v *versionContextResolver) Description() string
```

#### <a id="versionContextResolver.Name" href="#versionContextResolver.Name">func (v *versionContextResolver) Name() string</a>

```
searchKey: graphqlbackend.versionContextResolver.Name
tags: [method private]
```

```Go
func (v *versionContextResolver) Name() string
```

### <a id="virtualFileResolver" href="#virtualFileResolver">type virtualFileResolver struct</a>

```
searchKey: graphqlbackend.virtualFileResolver
tags: [struct private]
```

```Go
type virtualFileResolver struct {
	fileContent FileContentFunc
	// stat is this tree entry's file info. Its Name method must return the full path relative to
	// the root, not the basename.
	stat fs.FileInfo
}
```

#### <a id="NewVirtualFileResolver" href="#NewVirtualFileResolver">func NewVirtualFileResolver(stat fs.FileInfo, fileContent FileContentFunc) *virtualFileResolver</a>

```
searchKey: graphqlbackend.NewVirtualFileResolver
tags: [function]
```

```Go
func NewVirtualFileResolver(stat fs.FileInfo, fileContent FileContentFunc) *virtualFileResolver
```

#### <a id="virtualFileResolver.Binary" href="#virtualFileResolver.Binary">func (r *virtualFileResolver) Binary(ctx context.Context) (bool, error)</a>

```
searchKey: graphqlbackend.virtualFileResolver.Binary
tags: [method private]
```

```Go
func (r *virtualFileResolver) Binary(ctx context.Context) (bool, error)
```

#### <a id="virtualFileResolver.ByteSize" href="#virtualFileResolver.ByteSize">func (r *virtualFileResolver) ByteSize(ctx context.Context) (int32, error)</a>

```
searchKey: graphqlbackend.virtualFileResolver.ByteSize
tags: [method private]
```

```Go
func (r *virtualFileResolver) ByteSize(ctx context.Context) (int32, error)
```

#### <a id="virtualFileResolver.CanonicalURL" href="#virtualFileResolver.CanonicalURL">func (r *virtualFileResolver) CanonicalURL() string</a>

```
searchKey: graphqlbackend.virtualFileResolver.CanonicalURL
tags: [method private]
```

```Go
func (r *virtualFileResolver) CanonicalURL() string
```

#### <a id="virtualFileResolver.Content" href="#virtualFileResolver.Content">func (r *virtualFileResolver) Content(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.virtualFileResolver.Content
tags: [method private]
```

```Go
func (r *virtualFileResolver) Content(ctx context.Context) (string, error)
```

#### <a id="virtualFileResolver.ExternalURLs" href="#virtualFileResolver.ExternalURLs">func (r *virtualFileResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)</a>

```
searchKey: graphqlbackend.virtualFileResolver.ExternalURLs
tags: [method private]
```

```Go
func (r *virtualFileResolver) ExternalURLs(ctx context.Context) ([]*externallink.Resolver, error)
```

#### <a id="virtualFileResolver.Highlight" href="#virtualFileResolver.Highlight">func (r *virtualFileResolver) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)</a>

```
searchKey: graphqlbackend.virtualFileResolver.Highlight
tags: [method private]
```

```Go
func (r *virtualFileResolver) Highlight(ctx context.Context, args *HighlightArgs) (*highlightedFileResolver, error)
```

#### <a id="virtualFileResolver.IsDirectory" href="#virtualFileResolver.IsDirectory">func (r *virtualFileResolver) IsDirectory() bool</a>

```
searchKey: graphqlbackend.virtualFileResolver.IsDirectory
tags: [method private]
```

```Go
func (r *virtualFileResolver) IsDirectory() bool
```

#### <a id="virtualFileResolver.Name" href="#virtualFileResolver.Name">func (r *virtualFileResolver) Name() string</a>

```
searchKey: graphqlbackend.virtualFileResolver.Name
tags: [method private]
```

```Go
func (r *virtualFileResolver) Name() string
```

#### <a id="virtualFileResolver.Path" href="#virtualFileResolver.Path">func (r *virtualFileResolver) Path() string</a>

```
searchKey: graphqlbackend.virtualFileResolver.Path
tags: [method private]
```

```Go
func (r *virtualFileResolver) Path() string
```

#### <a id="virtualFileResolver.RichHTML" href="#virtualFileResolver.RichHTML">func (r *virtualFileResolver) RichHTML(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.virtualFileResolver.RichHTML
tags: [method private]
```

```Go
func (r *virtualFileResolver) RichHTML(ctx context.Context) (string, error)
```

#### <a id="virtualFileResolver.ToGitBlob" href="#virtualFileResolver.ToGitBlob">func (r *virtualFileResolver) ToGitBlob() (*GitTreeEntryResolver, bool)</a>

```
searchKey: graphqlbackend.virtualFileResolver.ToGitBlob
tags: [method private]
```

```Go
func (r *virtualFileResolver) ToGitBlob() (*GitTreeEntryResolver, bool)
```

#### <a id="virtualFileResolver.ToVirtualFile" href="#virtualFileResolver.ToVirtualFile">func (r *virtualFileResolver) ToVirtualFile() (*virtualFileResolver, bool)</a>

```
searchKey: graphqlbackend.virtualFileResolver.ToVirtualFile
tags: [method private]
```

```Go
func (r *virtualFileResolver) ToVirtualFile() (*virtualFileResolver, bool)
```

#### <a id="virtualFileResolver.URL" href="#virtualFileResolver.URL">func (r *virtualFileResolver) URL(ctx context.Context) (string, error)</a>

```
searchKey: graphqlbackend.virtualFileResolver.URL
tags: [method private]
```

```Go
func (r *virtualFileResolver) URL(ctx context.Context) (string, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkIntegrationSearchResults" href="#BenchmarkIntegrationSearchResults">func BenchmarkIntegrationSearchResults(b *testing.B)</a>

```
searchKey: graphqlbackend.BenchmarkIntegrationSearchResults
tags: [function private benchmark]
```

```Go
func BenchmarkIntegrationSearchResults(b *testing.B)
```

### <a id="BenchmarkPrometheusFieldName" href="#BenchmarkPrometheusFieldName">func BenchmarkPrometheusFieldName(b *testing.B)</a>

```
searchKey: graphqlbackend.BenchmarkPrometheusFieldName
tags: [function private benchmark]
```

```Go
func BenchmarkPrometheusFieldName(b *testing.B)
```

### <a id="BenchmarkSearchResults" href="#BenchmarkSearchResults">func BenchmarkSearchResults(b *testing.B)</a>

```
searchKey: graphqlbackend.BenchmarkSearchResults
tags: [function private benchmark]
```

```Go
func BenchmarkSearchResults(b *testing.B)
```

### <a id="CreateFileInfo" href="#CreateFileInfo">func CreateFileInfo(path string, isDir bool) fs.FileInfo</a>

```
searchKey: graphqlbackend.CreateFileInfo
tags: [function]
```

```Go
func CreateFileInfo(path string, isDir bool) fs.FileInfo
```

### <a id="DetermineStatusForLogs" href="#DetermineStatusForLogs">func DetermineStatusForLogs(srr *SearchResultsResolver, err error) string</a>

```
searchKey: graphqlbackend.DetermineStatusForLogs
tags: [function]
```

```Go
func DetermineStatusForLogs(srr *SearchResultsResolver, err error) string
```

DetermineStatusForLogs determines the final status of a search for logging purposes. 

### <a id="LogSearchLatency" href="#LogSearchLatency">func LogSearchLatency(ctx context.Context, db dbutil.DB, si *run.SearchInputs, durationMs int32)</a>

```
searchKey: graphqlbackend.LogSearchLatency
tags: [function]
```

```Go
func LogSearchLatency(ctx context.Context, db dbutil.DB, si *run.SearchInputs, durationMs int32)
```

LogSearchLatency records search durations in the event database. This function may only be called after a search result is performed, because it relies on the invariant that query and pattern error checking has already been performed. 

### <a id="MarshalOrgID" href="#MarshalOrgID">func MarshalOrgID(id int32) graphql.ID</a>

```
searchKey: graphqlbackend.MarshalOrgID
tags: [function]
```

```Go
func MarshalOrgID(id int32) graphql.ID
```

### <a id="MarshalOutOfBandMigrationID" href="#MarshalOutOfBandMigrationID">func MarshalOutOfBandMigrationID(id int32) graphql.ID</a>

```
searchKey: graphqlbackend.MarshalOutOfBandMigrationID
tags: [function]
```

```Go
func MarshalOutOfBandMigrationID(id int32) graphql.ID
```

MarshalOutOfBandMigrationID converts an internal out of band migration id into a GraphQL id. 

### <a id="MarshalRepositoryID" href="#MarshalRepositoryID">func MarshalRepositoryID(repo api.RepoID) graphql.ID</a>

```
searchKey: graphqlbackend.MarshalRepositoryID
tags: [function]
```

```Go
func MarshalRepositoryID(repo api.RepoID) graphql.ID
```

### <a id="MarshalUserID" href="#MarshalUserID">func MarshalUserID(id int32) graphql.ID</a>

```
searchKey: graphqlbackend.MarshalUserID
tags: [function]
```

```Go
func MarshalUserID(id int32) graphql.ID
```

### <a id="NewSchema" href="#NewSchema">func NewSchema(db dbutil.DB, batchChanges BatchChangesResolver, codeIntel CodeIntelResolver, insights InsightsResolver, authz AuthzResolver, codeMonitors CodeMonitorsResolver, license LicenseResolver, dotcom DotcomRootResolver) (*graphql.Schema, error)</a>

```
searchKey: graphqlbackend.NewSchema
tags: [function]
```

```Go
func NewSchema(db dbutil.DB, batchChanges BatchChangesResolver, codeIntel CodeIntelResolver, insights InsightsResolver, authz AuthzResolver, codeMonitors CodeMonitorsResolver, license LicenseResolver, dotcom DotcomRootResolver) (*graphql.Schema, error)
```

### <a id="RunTest" href="#RunTest">func RunTest(t *testing.T, test *Test)</a>

```
searchKey: graphqlbackend.RunTest
tags: [function]
```

```Go
func RunTest(t *testing.T, test *Test)
```

RunTest runs a single GraphQL test case. 

### <a id="RunTests" href="#RunTests">func RunTests(t *testing.T, tests []*Test)</a>

```
searchKey: graphqlbackend.RunTests
tags: [function]
```

```Go
func RunTests(t *testing.T, tests []*Test)
```

RunTests runs the given GraphQL test cases as subtests. 

### <a id="SiteGQLID" href="#SiteGQLID">func SiteGQLID() graphql.ID</a>

```
searchKey: graphqlbackend.SiteGQLID
tags: [function]
```

```Go
func SiteGQLID() graphql.ID
```

SiteGQLID is the GraphQL ID of the Sourcegraph site. It is a constant across all Sourcegraph instances. 

### <a id="TestAddExternalService" href="#TestAddExternalService">func TestAddExternalService(t *testing.T)</a>

```
searchKey: graphqlbackend.TestAddExternalService
tags: [function private test]
```

```Go
func TestAddExternalService(t *testing.T)
```

### <a id="TestAddQueryRegexpField" href="#TestAddQueryRegexpField">func TestAddQueryRegexpField(t *testing.T)</a>

```
searchKey: graphqlbackend.TestAddQueryRegexpField
tags: [function private test]
```

```Go
func TestAddQueryRegexpField(t *testing.T)
```

### <a id="TestAffiliatedRepositories" href="#TestAffiliatedRepositories">func TestAffiliatedRepositories(t *testing.T)</a>

```
searchKey: graphqlbackend.TestAffiliatedRepositories
tags: [function private test]
```

```Go
func TestAffiliatedRepositories(t *testing.T)
```

### <a id="TestAlertForDiffCommitSearchLimits" href="#TestAlertForDiffCommitSearchLimits">func TestAlertForDiffCommitSearchLimits(t *testing.T)</a>

```
searchKey: graphqlbackend.TestAlertForDiffCommitSearchLimits
tags: [function private test]
```

```Go
func TestAlertForDiffCommitSearchLimits(t *testing.T)
```

### <a id="TestAlertForNoResolvedReposWithNonGlobalSearchContext" href="#TestAlertForNoResolvedReposWithNonGlobalSearchContext">func TestAlertForNoResolvedReposWithNonGlobalSearchContext(t *testing.T)</a>

```
searchKey: graphqlbackend.TestAlertForNoResolvedReposWithNonGlobalSearchContext
tags: [function private test]
```

```Go
func TestAlertForNoResolvedReposWithNonGlobalSearchContext(t *testing.T)
```

### <a id="TestAlertForOverRepoLimit" href="#TestAlertForOverRepoLimit">func TestAlertForOverRepoLimit(t *testing.T)</a>

```
searchKey: graphqlbackend.TestAlertForOverRepoLimit
tags: [function private test]
```

```Go
func TestAlertForOverRepoLimit(t *testing.T)
```

### <a id="TestApplyPatch" href="#TestApplyPatch">func TestApplyPatch(t *testing.T)</a>

```
searchKey: graphqlbackend.TestApplyPatch
tags: [function private test]
```

```Go
func TestApplyPatch(t *testing.T)
```

### <a id="TestAutoDefinedSearchContexts" href="#TestAutoDefinedSearchContexts">func TestAutoDefinedSearchContexts(t *testing.T)</a>

```
searchKey: graphqlbackend.TestAutoDefinedSearchContexts
tags: [function private test]
```

```Go
func TestAutoDefinedSearchContexts(t *testing.T)
```

### <a id="TestBasicLimiter" href="#TestBasicLimiter">func TestBasicLimiter(t *testing.T)</a>

```
searchKey: graphqlbackend.TestBasicLimiter
tags: [function private test]
```

```Go
func TestBasicLimiter(t *testing.T)
```

### <a id="TestBasicLimiterEnabled" href="#TestBasicLimiterEnabled">func TestBasicLimiterEnabled(t *testing.T)</a>

```
searchKey: graphqlbackend.TestBasicLimiterEnabled
tags: [function private test]
```

```Go
func TestBasicLimiterEnabled(t *testing.T)
```

### <a id="TestCapFirst" href="#TestCapFirst">func TestCapFirst(t *testing.T)</a>

```
searchKey: graphqlbackend.TestCapFirst
tags: [function private test]
```

```Go
func TestCapFirst(t *testing.T)
```

### <a id="TestCheckMirrorRepositoryConnection" href="#TestCheckMirrorRepositoryConnection">func TestCheckMirrorRepositoryConnection(t *testing.T)</a>

```
searchKey: graphqlbackend.TestCheckMirrorRepositoryConnection
tags: [function private test]
```

```Go
func TestCheckMirrorRepositoryConnection(t *testing.T)
```

### <a id="TestCheckMirrorRepositoryRemoteURL" href="#TestCheckMirrorRepositoryRemoteURL">func TestCheckMirrorRepositoryRemoteURL(t *testing.T)</a>

```
searchKey: graphqlbackend.TestCheckMirrorRepositoryRemoteURL
tags: [function private test]
```

```Go
func TestCheckMirrorRepositoryRemoteURL(t *testing.T)
```

### <a id="TestCompareSearchResults" href="#TestCompareSearchResults">func TestCompareSearchResults(t *testing.T)</a>

```
searchKey: graphqlbackend.TestCompareSearchResults
tags: [function private test]
```

```Go
func TestCompareSearchResults(t *testing.T)
```

### <a id="TestCreateSavedSearch" href="#TestCreateSavedSearch">func TestCreateSavedSearch(t *testing.T)</a>

```
searchKey: graphqlbackend.TestCreateSavedSearch
tags: [function private test]
```

```Go
func TestCreateSavedSearch(t *testing.T)
```

### <a id="TestCreateUser" href="#TestCreateUser">func TestCreateUser(t *testing.T)</a>

```
searchKey: graphqlbackend.TestCreateUser
tags: [function private test]
```

```Go
func TestCreateUser(t *testing.T)
```

### <a id="TestDateTime" href="#TestDateTime">func TestDateTime(t *testing.T)</a>

```
searchKey: graphqlbackend.TestDateTime
tags: [function private test]
```

```Go
func TestDateTime(t *testing.T)
```

### <a id="TestDeleteExternalService" href="#TestDeleteExternalService">func TestDeleteExternalService(t *testing.T)</a>

```
searchKey: graphqlbackend.TestDeleteExternalService
tags: [function private test]
```

```Go
func TestDeleteExternalService(t *testing.T)
```

### <a id="TestDeleteSavedSearch" href="#TestDeleteSavedSearch">func TestDeleteSavedSearch(t *testing.T)</a>

```
searchKey: graphqlbackend.TestDeleteSavedSearch
tags: [function private test]
```

```Go
func TestDeleteSavedSearch(t *testing.T)
```

### <a id="TestDeleteUser" href="#TestDeleteUser">func TestDeleteUser(t *testing.T)</a>

```
searchKey: graphqlbackend.TestDeleteUser
tags: [function private test]
```

```Go
func TestDeleteUser(t *testing.T)
```

### <a id="TestDetectSearchType" href="#TestDetectSearchType">func TestDetectSearchType(t *testing.T)</a>

```
searchKey: graphqlbackend.TestDetectSearchType
tags: [function private test]
```

```Go
func TestDetectSearchType(t *testing.T)
```

### <a id="TestDiffHunk" href="#TestDiffHunk">func TestDiffHunk(t *testing.T)</a>

```
searchKey: graphqlbackend.TestDiffHunk
tags: [function private test]
```

```Go
func TestDiffHunk(t *testing.T)
```

### <a id="TestDiffHunk2" href="#TestDiffHunk2">func TestDiffHunk2(t *testing.T)</a>

```
searchKey: graphqlbackend.TestDiffHunk2
tags: [function private test]
```

```Go
func TestDiffHunk2(t *testing.T)
```

### <a id="TestErrorToAlertStructuralSearch" href="#TestErrorToAlertStructuralSearch">func TestErrorToAlertStructuralSearch(t *testing.T)</a>

```
searchKey: graphqlbackend.TestErrorToAlertStructuralSearch
tags: [function private test]
```

```Go
func TestErrorToAlertStructuralSearch(t *testing.T)
```

### <a id="TestEscapePathForURL" href="#TestEscapePathForURL">func TestEscapePathForURL(t *testing.T)</a>

```
searchKey: graphqlbackend.TestEscapePathForURL
tags: [function private test]
```

```Go
func TestEscapePathForURL(t *testing.T)
```

### <a id="TestEstimateQueryCost" href="#TestEstimateQueryCost">func TestEstimateQueryCost(t *testing.T)</a>

```
searchKey: graphqlbackend.TestEstimateQueryCost
tags: [function private test]
```

```Go
func TestEstimateQueryCost(t *testing.T)
```

### <a id="TestEvaluateAnd" href="#TestEvaluateAnd">func TestEvaluateAnd(t *testing.T)</a>

```
searchKey: graphqlbackend.TestEvaluateAnd
tags: [function private test]
```

```Go
func TestEvaluateAnd(t *testing.T)
```

### <a id="TestExactlyOneRepo" href="#TestExactlyOneRepo">func TestExactlyOneRepo(t *testing.T)</a>

```
searchKey: graphqlbackend.TestExactlyOneRepo
tags: [function private test]
```

```Go
func TestExactlyOneRepo(t *testing.T)
```

### <a id="TestExternalAccountResolver_AccountData" href="#TestExternalAccountResolver_AccountData">func TestExternalAccountResolver_AccountData(t *testing.T)</a>

```
searchKey: graphqlbackend.TestExternalAccountResolver_AccountData
tags: [function private test]
```

```Go
func TestExternalAccountResolver_AccountData(t *testing.T)
```

### <a id="TestExternalServices" href="#TestExternalServices">func TestExternalServices(t *testing.T)</a>

```
searchKey: graphqlbackend.TestExternalServices
tags: [function private test]
```

```Go
func TestExternalServices(t *testing.T)
```

### <a id="TestExternalServices_PageInfo" href="#TestExternalServices_PageInfo">func TestExternalServices_PageInfo(t *testing.T)</a>

```
searchKey: graphqlbackend.TestExternalServices_PageInfo
tags: [function private test]
```

```Go
func TestExternalServices_PageInfo(t *testing.T)
```

### <a id="TestFileDiffHighlighter" href="#TestFileDiffHighlighter">func TestFileDiffHighlighter(t *testing.T)</a>

```
searchKey: graphqlbackend.TestFileDiffHighlighter
tags: [function private test]
```

```Go
func TestFileDiffHighlighter(t *testing.T)
```

### <a id="TestGetExactFilePatterns" href="#TestGetExactFilePatterns">func TestGetExactFilePatterns(t *testing.T)</a>

```
searchKey: graphqlbackend.TestGetExactFilePatterns
tags: [function private test]
```

```Go
func TestGetExactFilePatterns(t *testing.T)
```

### <a id="TestGetRepos" href="#TestGetRepos">func TestGetRepos(t *testing.T)</a>

```
searchKey: graphqlbackend.TestGetRepos
tags: [function private test]
```

```Go
func TestGetRepos(t *testing.T)
```

### <a id="TestGetReposWrongUnderlyingType" href="#TestGetReposWrongUnderlyingType">func TestGetReposWrongUnderlyingType(t *testing.T)</a>

```
searchKey: graphqlbackend.TestGetReposWrongUnderlyingType
tags: [function private test]
```

```Go
func TestGetReposWrongUnderlyingType(t *testing.T)
```

### <a id="TestGitCommitFileNames" href="#TestGitCommitFileNames">func TestGitCommitFileNames(t *testing.T)</a>

```
searchKey: graphqlbackend.TestGitCommitFileNames
tags: [function private test]
```

```Go
func TestGitCommitFileNames(t *testing.T)
```

### <a id="TestGitCommitResolver" href="#TestGitCommitResolver">func TestGitCommitResolver(t *testing.T)</a>

```
searchKey: graphqlbackend.TestGitCommitResolver
tags: [function private test]
```

```Go
func TestGitCommitResolver(t *testing.T)
```

### <a id="TestGitTree" href="#TestGitTree">func TestGitTree(t *testing.T)</a>

```
searchKey: graphqlbackend.TestGitTree
tags: [function private test]
```

```Go
func TestGitTree(t *testing.T)
```

### <a id="TestGitTreeEntry_Content" href="#TestGitTreeEntry_Content">func TestGitTreeEntry_Content(t *testing.T)</a>

```
searchKey: graphqlbackend.TestGitTreeEntry_Content
tags: [function private test]
```

```Go
func TestGitTreeEntry_Content(t *testing.T)
```

### <a id="TestGitTreeEntry_RawZipArchiveURL" href="#TestGitTreeEntry_RawZipArchiveURL">func TestGitTreeEntry_RawZipArchiveURL(t *testing.T)</a>

```
searchKey: graphqlbackend.TestGitTreeEntry_RawZipArchiveURL
tags: [function private test]
```

```Go
func TestGitTreeEntry_RawZipArchiveURL(t *testing.T)
```

### <a id="TestIsBinary" href="#TestIsBinary">func TestIsBinary(t *testing.T)</a>

```
searchKey: graphqlbackend.TestIsBinary
tags: [function private test]
```

```Go
func TestIsBinary(t *testing.T)
```

### <a id="TestIsGlobalSearch" href="#TestIsGlobalSearch">func TestIsGlobalSearch(t *testing.T)</a>

```
searchKey: graphqlbackend.TestIsGlobalSearch
tags: [function private test]
```

```Go
func TestIsGlobalSearch(t *testing.T)
```

### <a id="TestLonger" href="#TestLonger">func TestLonger(t *testing.T)</a>

```
searchKey: graphqlbackend.TestLonger
tags: [function private test]
```

```Go
func TestLonger(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: graphqlbackend.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestMarshalRepositoryCursor" href="#TestMarshalRepositoryCursor">func TestMarshalRepositoryCursor(t *testing.T)</a>

```
searchKey: graphqlbackend.TestMarshalRepositoryCursor
tags: [function private test]
```

```Go
func TestMarshalRepositoryCursor(t *testing.T)
```

### <a id="TestMergeSettings" href="#TestMergeSettings">func TestMergeSettings(t *testing.T)</a>

```
searchKey: graphqlbackend.TestMergeSettings
tags: [function private test]
```

```Go
func TestMergeSettings(t *testing.T)
```

### <a id="TestMutation_CreateAccessToken" href="#TestMutation_CreateAccessToken">func TestMutation_CreateAccessToken(t *testing.T)</a>

```
searchKey: graphqlbackend.TestMutation_CreateAccessToken
tags: [function private test]
```

```Go
func TestMutation_CreateAccessToken(t *testing.T)
```

🚨 SECURITY: This tests that users can't create tokens for users they aren't allowed to do so for. 

### <a id="TestMutation_DeleteAccessToken" href="#TestMutation_DeleteAccessToken">func TestMutation_DeleteAccessToken(t *testing.T)</a>

```
searchKey: graphqlbackend.TestMutation_DeleteAccessToken
tags: [function private test]
```

```Go
func TestMutation_DeleteAccessToken(t *testing.T)
```

🚨 SECURITY: This tests that users can't delete tokens they shouldn't be allowed to delete. 

### <a id="TestNamespace" href="#TestNamespace">func TestNamespace(t *testing.T)</a>

```
searchKey: graphqlbackend.TestNamespace
tags: [function private test]
```

```Go
func TestNamespace(t *testing.T)
```

### <a id="TestNamespaceByName" href="#TestNamespaceByName">func TestNamespaceByName(t *testing.T)</a>

```
searchKey: graphqlbackend.TestNamespaceByName
tags: [function private test]
```

```Go
func TestNamespaceByName(t *testing.T)
```

### <a id="TestNode_Org" href="#TestNode_Org">func TestNode_Org(t *testing.T)</a>

```
searchKey: graphqlbackend.TestNode_Org
tags: [function private test]
```

```Go
func TestNode_Org(t *testing.T)
```

### <a id="TestNode_User" href="#TestNode_User">func TestNode_User(t *testing.T)</a>

```
searchKey: graphqlbackend.TestNode_User
tags: [function private test]
```

```Go
func TestNode_User(t *testing.T)
```

### <a id="TestObservabilityActiveAlertsAlert" href="#TestObservabilityActiveAlertsAlert">func TestObservabilityActiveAlertsAlert(t *testing.T)</a>

```
searchKey: graphqlbackend.TestObservabilityActiveAlertsAlert
tags: [function private test]
```

```Go
func TestObservabilityActiveAlertsAlert(t *testing.T)
```

### <a id="TestOrganization" href="#TestOrganization">func TestOrganization(t *testing.T)</a>

```
searchKey: graphqlbackend.TestOrganization
tags: [function private test]
```

```Go
func TestOrganization(t *testing.T)
```

### <a id="TestOrgs" href="#TestOrgs">func TestOrgs(t *testing.T)</a>

```
searchKey: graphqlbackend.TestOrgs
tags: [function private test]
```

```Go
func TestOrgs(t *testing.T)
```

### <a id="TestPreviewRepositoryComparisonResolver" href="#TestPreviewRepositoryComparisonResolver">func TestPreviewRepositoryComparisonResolver(t *testing.T)</a>

```
searchKey: graphqlbackend.TestPreviewRepositoryComparisonResolver
tags: [function private test]
```

```Go
func TestPreviewRepositoryComparisonResolver(t *testing.T)
```

### <a id="TestQuoteSuggestions" href="#TestQuoteSuggestions">func TestQuoteSuggestions(t *testing.T)</a>

```
searchKey: graphqlbackend.TestQuoteSuggestions
tags: [function private test]
```

```Go
func TestQuoteSuggestions(t *testing.T)
```

### <a id="TestRatelimitFromConfig" href="#TestRatelimitFromConfig">func TestRatelimitFromConfig(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRatelimitFromConfig
tags: [function private test]
```

```Go
func TestRatelimitFromConfig(t *testing.T)
```

### <a id="TestRepositories" href="#TestRepositories">func TestRepositories(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRepositories
tags: [function private test]
```

```Go
func TestRepositories(t *testing.T)
```

### <a id="TestRepositories_CursorPagination" href="#TestRepositories_CursorPagination">func TestRepositories_CursorPagination(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRepositories_CursorPagination
tags: [function private test]
```

```Go
func TestRepositories_CursorPagination(t *testing.T)
```

### <a id="TestRepository" href="#TestRepository">func TestRepository(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRepository
tags: [function private test]
```

```Go
func TestRepository(t *testing.T)
```

### <a id="TestRepositoryComparison" href="#TestRepositoryComparison">func TestRepositoryComparison(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRepositoryComparison
tags: [function private test]
```

```Go
func TestRepositoryComparison(t *testing.T)
```

### <a id="TestRepositoryHydration" href="#TestRepositoryHydration">func TestRepositoryHydration(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRepositoryHydration
tags: [function private test]
```

```Go
func TestRepositoryHydration(t *testing.T)
```

### <a id="TestRepositoryLabel" href="#TestRepositoryLabel">func TestRepositoryLabel(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRepositoryLabel
tags: [function private test]
```

```Go
func TestRepositoryLabel(t *testing.T)
```

### <a id="TestRepository_Commit" href="#TestRepository_Commit">func TestRepository_Commit(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRepository_Commit
tags: [function private test]
```

```Go
func TestRepository_Commit(t *testing.T)
```

### <a id="TestRepository_DefaultBranch" href="#TestRepository_DefaultBranch">func TestRepository_DefaultBranch(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRepository_DefaultBranch
tags: [function private test]
```

```Go
func TestRepository_DefaultBranch(t *testing.T)
```

### <a id="TestResendUserEmailVerification" href="#TestResendUserEmailVerification">func TestResendUserEmailVerification(t *testing.T)</a>

```
searchKey: graphqlbackend.TestResendUserEmailVerification
tags: [function private test]
```

```Go
func TestResendUserEmailVerification(t *testing.T)
```

### <a id="TestResolverTo" href="#TestResolverTo">func TestResolverTo(t *testing.T)</a>

```
searchKey: graphqlbackend.TestResolverTo
tags: [function private test]
```

```Go
func TestResolverTo(t *testing.T)
```

### <a id="TestRetrievingAndDeduplicatingIndexedRefs" href="#TestRetrievingAndDeduplicatingIndexedRefs">func TestRetrievingAndDeduplicatingIndexedRefs(t *testing.T)</a>

```
searchKey: graphqlbackend.TestRetrievingAndDeduplicatingIndexedRefs
tags: [function private test]
```

```Go
func TestRetrievingAndDeduplicatingIndexedRefs(t *testing.T)
```

### <a id="TestSavedSearchByIDNonOwner" href="#TestSavedSearchByIDNonOwner">func TestSavedSearchByIDNonOwner(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSavedSearchByIDNonOwner
tags: [function private test]
```

```Go
func TestSavedSearchByIDNonOwner(t *testing.T)
```

### <a id="TestSavedSearchByIDOwner" href="#TestSavedSearchByIDOwner">func TestSavedSearchByIDOwner(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSavedSearchByIDOwner
tags: [function private test]
```

```Go
func TestSavedSearchByIDOwner(t *testing.T)
```

### <a id="TestSavedSearches" href="#TestSavedSearches">func TestSavedSearches(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSavedSearches
tags: [function private test]
```

```Go
func TestSavedSearches(t *testing.T)
```

### <a id="TestSearch" href="#TestSearch">func TestSearch(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearch
tags: [function private test]
```

```Go
func TestSearch(t *testing.T)
```

### <a id="TestSearchContext" href="#TestSearchContext">func TestSearchContext(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchContext
tags: [function private test]
```

```Go
func TestSearchContext(t *testing.T)
```

### <a id="TestSearchContexts" href="#TestSearchContexts">func TestSearchContexts(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchContexts
tags: [function private test]
```

```Go
func TestSearchContexts(t *testing.T)
```

### <a id="TestSearchFilterSuggestions" href="#TestSearchFilterSuggestions">func TestSearchFilterSuggestions(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchFilterSuggestions
tags: [function private test]
```

```Go
func TestSearchFilterSuggestions(t *testing.T)
```

### <a id="TestSearchPagination_cloning_missing" href="#TestSearchPagination_cloning_missing">func TestSearchPagination_cloning_missing(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchPagination_cloning_missing
tags: [function private test]
```

```Go
func TestSearchPagination_cloning_missing(t *testing.T)
```

TestSearchPagination_cloning_missing is a joint test for both repoPaginationPlan and sliceSearchResults's handling of cloning and missing repositories. 

### <a id="TestSearchPagination_issue_6287" href="#TestSearchPagination_issue_6287">func TestSearchPagination_issue_6287(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchPagination_issue_6287
tags: [function private test]
```

```Go
func TestSearchPagination_issue_6287(t *testing.T)
```

### <a id="TestSearchPagination_repoPaginationPlan" href="#TestSearchPagination_repoPaginationPlan">func TestSearchPagination_repoPaginationPlan(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchPagination_repoPaginationPlan
tags: [function private test]
```

```Go
func TestSearchPagination_repoPaginationPlan(t *testing.T)
```

### <a id="TestSearchPagination_sliceSearchResults" href="#TestSearchPagination_sliceSearchResults">func TestSearchPagination_sliceSearchResults(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchPagination_sliceSearchResults
tags: [function private test]
```

```Go
func TestSearchPagination_sliceSearchResults(t *testing.T)
```

### <a id="TestSearchPagination_unmarshalSearchCursor" href="#TestSearchPagination_unmarshalSearchCursor">func TestSearchPagination_unmarshalSearchCursor(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchPagination_unmarshalSearchCursor
tags: [function private test]
```

```Go
func TestSearchPagination_unmarshalSearchCursor(t *testing.T)
```

### <a id="TestSearchPatternForSuggestion" href="#TestSearchPatternForSuggestion">func TestSearchPatternForSuggestion(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchPatternForSuggestion
tags: [function private test]
```

```Go
func TestSearchPatternForSuggestion(t *testing.T)
```

### <a id="TestSearchResolver_DynamicFilters" href="#TestSearchResolver_DynamicFilters">func TestSearchResolver_DynamicFilters(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchResolver_DynamicFilters
tags: [function private test]
```

```Go
func TestSearchResolver_DynamicFilters(t *testing.T)
```

### <a id="TestSearchResults" href="#TestSearchResults">func TestSearchResults(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchResults
tags: [function private test]
```

```Go
func TestSearchResults(t *testing.T)
```

### <a id="TestSearchResultsHydration" href="#TestSearchResultsHydration">func TestSearchResultsHydration(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchResultsHydration
tags: [function private test]
```

```Go
func TestSearchResultsHydration(t *testing.T)
```

### <a id="TestSearchResultsStatsLanguages" href="#TestSearchResultsStatsLanguages">func TestSearchResultsStatsLanguages(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchResultsStatsLanguages
tags: [function private test]
```

```Go
func TestSearchResultsStatsLanguages(t *testing.T)
```

### <a id="TestSearchSuggestions" href="#TestSearchSuggestions">func TestSearchSuggestions(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSearchSuggestions
tags: [function private test]
```

```Go
func TestSearchSuggestions(t *testing.T)
```

### <a id="TestSetExternalServiceRepos" href="#TestSetExternalServiceRepos">func TestSetExternalServiceRepos(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSetExternalServiceRepos
tags: [function private test]
```

```Go
func TestSetExternalServiceRepos(t *testing.T)
```

### <a id="TestSetUserEmailVerified" href="#TestSetUserEmailVerified">func TestSetUserEmailVerified(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSetUserEmailVerified
tags: [function private test]
```

```Go
func TestSetUserEmailVerified(t *testing.T)
```

### <a id="TestSettingsMutation_EditSettings" href="#TestSettingsMutation_EditSettings">func TestSettingsMutation_EditSettings(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSettingsMutation_EditSettings
tags: [function private test]
```

```Go
func TestSettingsMutation_EditSettings(t *testing.T)
```

### <a id="TestSettingsMutation_OverwriteSettings" href="#TestSettingsMutation_OverwriteSettings">func TestSettingsMutation_OverwriteSettings(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSettingsMutation_OverwriteSettings
tags: [function private test]
```

```Go
func TestSettingsMutation_OverwriteSettings(t *testing.T)
```

### <a id="TestStatusMessages" href="#TestStatusMessages">func TestStatusMessages(t *testing.T)</a>

```
searchKey: graphqlbackend.TestStatusMessages
tags: [function private test]
```

```Go
func TestStatusMessages(t *testing.T)
```

### <a id="TestStripPassword" href="#TestStripPassword">func TestStripPassword(t *testing.T)</a>

```
searchKey: graphqlbackend.TestStripPassword
tags: [function private test]
```

```Go
func TestStripPassword(t *testing.T)
```

### <a id="TestSubjects" href="#TestSubjects">func TestSubjects(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSubjects
tags: [function private test]
```

```Go
func TestSubjects(t *testing.T)
```

### <a id="TestSyncExternalService_ContextTimeout" href="#TestSyncExternalService_ContextTimeout">func TestSyncExternalService_ContextTimeout(t *testing.T)</a>

```
searchKey: graphqlbackend.TestSyncExternalService_ContextTimeout
tags: [function private test]
```

```Go
func TestSyncExternalService_ContextTimeout(t *testing.T)
```

### <a id="TestUnionMerge" href="#TestUnionMerge">func TestUnionMerge(t *testing.T)</a>

```
searchKey: graphqlbackend.TestUnionMerge
tags: [function private test]
```

```Go
func TestUnionMerge(t *testing.T)
```

### <a id="TestUnmarshalRepositoryCursor" href="#TestUnmarshalRepositoryCursor">func TestUnmarshalRepositoryCursor(t *testing.T)</a>

```
searchKey: graphqlbackend.TestUnmarshalRepositoryCursor
tags: [function private test]
```

```Go
func TestUnmarshalRepositoryCursor(t *testing.T)
```

### <a id="TestUpdateExternalService" href="#TestUpdateExternalService">func TestUpdateExternalService(t *testing.T)</a>

```
searchKey: graphqlbackend.TestUpdateExternalService
tags: [function private test]
```

```Go
func TestUpdateExternalService(t *testing.T)
```

### <a id="TestUpdateSavedSearch" href="#TestUpdateSavedSearch">func TestUpdateSavedSearch(t *testing.T)</a>

```
searchKey: graphqlbackend.TestUpdateSavedSearch
tags: [function private test]
```

```Go
func TestUpdateSavedSearch(t *testing.T)
```

### <a id="TestUpdateUser" href="#TestUpdateUser">func TestUpdateUser(t *testing.T)</a>

```
searchKey: graphqlbackend.TestUpdateUser
tags: [function private test]
```

```Go
func TestUpdateUser(t *testing.T)
```

### <a id="TestUser" href="#TestUser">func TestUser(t *testing.T)</a>

```
searchKey: graphqlbackend.TestUser
tags: [function private test]
```

```Go
func TestUser(t *testing.T)
```

### <a id="TestUser_UsageStatistics" href="#TestUser_UsageStatistics">func TestUser_UsageStatistics(t *testing.T)</a>

```
searchKey: graphqlbackend.TestUser_UsageStatistics
tags: [function private test]
```

```Go
func TestUser_UsageStatistics(t *testing.T)
```

### <a id="TestUsers" href="#TestUsers">func TestUsers(t *testing.T)</a>

```
searchKey: graphqlbackend.TestUsers
tags: [function private test]
```

```Go
func TestUsers(t *testing.T)
```

### <a id="TestVersionContext" href="#TestVersionContext">func TestVersionContext(t *testing.T)</a>

```
searchKey: graphqlbackend.TestVersionContext
tags: [function private test]
```

```Go
func TestVersionContext(t *testing.T)
```

### <a id="TestVirtualFile" href="#TestVirtualFile">func TestVirtualFile(t *testing.T)</a>

```
searchKey: graphqlbackend.TestVirtualFile
tags: [function private test]
```

```Go
func TestVirtualFile(t *testing.T)
```

### <a id="TestZeroElapsedMilliseconds" href="#TestZeroElapsedMilliseconds">func TestZeroElapsedMilliseconds(t *testing.T)</a>

```
searchKey: graphqlbackend.TestZeroElapsedMilliseconds
tags: [function private test]
```

```Go
func TestZeroElapsedMilliseconds(t *testing.T)
```

### <a id="Test_SearchResultsResolver_ApproximateResultCount" href="#Test_SearchResultsResolver_ApproximateResultCount">func Test_SearchResultsResolver_ApproximateResultCount(t *testing.T)</a>

```
searchKey: graphqlbackend.Test_SearchResultsResolver_ApproximateResultCount
tags: [function private test]
```

```Go
func Test_SearchResultsResolver_ApproximateResultCount(t *testing.T)
```

### <a id="Test_determineOutOfDateAlert" href="#Test_determineOutOfDateAlert">func Test_determineOutOfDateAlert(t *testing.T)</a>

```
searchKey: graphqlbackend.Test_determineOutOfDateAlert
tags: [function private test]
```

```Go
func Test_determineOutOfDateAlert(t *testing.T)
```

### <a id="UnmarshalNamespaceID" href="#UnmarshalNamespaceID">func UnmarshalNamespaceID(id graphql.ID, userID *int32, orgID *int32) (err error)</a>

```
searchKey: graphqlbackend.UnmarshalNamespaceID
tags: [function]
```

```Go
func UnmarshalNamespaceID(id graphql.ID, userID *int32, orgID *int32) (err error)
```

### <a id="UnmarshalOrgID" href="#UnmarshalOrgID">func UnmarshalOrgID(id graphql.ID) (orgID int32, err error)</a>

```
searchKey: graphqlbackend.UnmarshalOrgID
tags: [function]
```

```Go
func UnmarshalOrgID(id graphql.ID) (orgID int32, err error)
```

### <a id="UnmarshalOutOfBandMigrationID" href="#UnmarshalOutOfBandMigrationID">func UnmarshalOutOfBandMigrationID(id graphql.ID) (migrationID int32, err error)</a>

```
searchKey: graphqlbackend.UnmarshalOutOfBandMigrationID
tags: [function]
```

```Go
func UnmarshalOutOfBandMigrationID(id graphql.ID) (migrationID int32, err error)
```

UnmarshalOutOfBandMigrationID converts a GraphQL id into an internal out of band migration id. 

### <a id="UnmarshalRepositoryID" href="#UnmarshalRepositoryID">func UnmarshalRepositoryID(id graphql.ID) (repo api.RepoID, err error)</a>

```
searchKey: graphqlbackend.UnmarshalRepositoryID
tags: [function]
```

```Go
func UnmarshalRepositoryID(id graphql.ID) (repo api.RepoID, err error)
```

### <a id="UnmarshalUserID" href="#UnmarshalUserID">func UnmarshalUserID(id graphql.ID) (userID int32, err error)</a>

```
searchKey: graphqlbackend.UnmarshalUserID
tags: [function]
```

```Go
func UnmarshalUserID(id graphql.ID) (userID int32, err error)
```

### <a id="allEmptyStrings" href="#allEmptyStrings">func allEmptyStrings(ss1, ss2 []string) bool</a>

```
searchKey: graphqlbackend.allEmptyStrings
tags: [function private]
```

```Go
func allEmptyStrings(ss1, ss2 []string) bool
```

### <a id="allowPrivate" href="#allowPrivate">func allowPrivate(ctx context.Context, db dbutil.DB, userID int32) (bool, error)</a>

```
searchKey: graphqlbackend.allowPrivate
tags: [function private]
```

```Go
func allowPrivate(ctx context.Context, db dbutil.DB, userID int32) (bool, error)
```

### <a id="applyPatch" href="#applyPatch">func applyPatch(fileContent string, fileDiff *diff.FileDiff) string</a>

```
searchKey: graphqlbackend.applyPatch
tags: [function private]
```

```Go
func applyPatch(fileContent string, fileDiff *diff.FileDiff) string
```

### <a id="assertEqual" href="#assertEqual">func assertEqual(t *testing.T, got, want interface{})</a>

```
searchKey: graphqlbackend.assertEqual
tags: [function private]
```

```Go
func assertEqual(t *testing.T, got, want interface{})
```

### <a id="assertRepoResolverHydrated" href="#assertRepoResolverHydrated">func assertRepoResolverHydrated(ctx context.Context, t *testing.T, r *RepositoryResolver, hydrated *types.Repo)</a>

```
searchKey: graphqlbackend.assertRepoResolverHydrated
tags: [function private]
```

```Go
func assertRepoResolverHydrated(ctx context.Context, t *testing.T, r *RepositoryResolver, hydrated *types.Repo)
```

### <a id="canUpdateSiteConfiguration" href="#canUpdateSiteConfiguration">func canUpdateSiteConfiguration() bool</a>

```
searchKey: graphqlbackend.canUpdateSiteConfiguration
tags: [function private]
```

```Go
func canUpdateSiteConfiguration() bool
```

### <a id="capFirst" href="#capFirst">func capFirst(s string) string</a>

```
searchKey: graphqlbackend.capFirst
tags: [function private]
```

```Go
func capFirst(s string) string
```

capFirst capitalizes the first rune in the given string. It can be safely used with UTF-8 strings. 

### <a id="checkErrors" href="#checkErrors">func checkErrors(t *testing.T, want, got []*errors.QueryError)</a>

```
searchKey: graphqlbackend.checkErrors
tags: [function private]
```

```Go
func checkErrors(t *testing.T, want, got []*errors.QueryError)
```

### <a id="checkExternalServiceAccess" href="#checkExternalServiceAccess">func checkExternalServiceAccess(ctx context.Context, db dbutil.DB, namespaceUserID int32) error</a>

```
searchKey: graphqlbackend.checkExternalServiceAccess
tags: [function private]
```

```Go
func checkExternalServiceAccess(ctx context.Context, db dbutil.DB, namespaceUserID int32) error
```

checkExternalServiceAccess checks whether the current user is allowed to access the supplied external service. 

🚨 SECURITY: Site admins can view external services with no owner, otherwise only the owner of the external service is allowed to access it. 

### <a id="clamp" href="#clamp">func clamp(x, min, max int) int</a>

```
searchKey: graphqlbackend.clamp
tags: [function private]
```

```Go
func clamp(x, min, max int) int
```

clamp clamps x into the range of [min, max]. 

### <a id="cloneURLToRepoName" href="#cloneURLToRepoName">func cloneURLToRepoName(ctx context.Context, cloneURL string) (string, error)</a>

```
searchKey: graphqlbackend.cloneURLToRepoName
tags: [function private]
```

```Go
func cloneURLToRepoName(ctx context.Context, cloneURL string) (string, error)
```

### <a id="commitResult" href="#commitResult">func commitResult(repo, commit string) *result.CommitMatch</a>

```
searchKey: graphqlbackend.commitResult
tags: [function private]
```

```Go
func commitResult(repo, commit string) *result.CommitMatch
```

### <a id="compareDates" href="#compareDates">func compareDates(left, right *time.Time) bool</a>

```
searchKey: graphqlbackend.compareDates
tags: [function private]
```

```Go
func compareDates(left, right *time.Time) bool
```

### <a id="compareFileLengths" href="#compareFileLengths">func compareFileLengths(left, right string, exactFilePatterns map[string]struct{}) bool</a>

```
searchKey: graphqlbackend.compareFileLengths
tags: [function private]
```

```Go
func compareFileLengths(left, right string, exactFilePatterns map[string]struct{}) bool
```

compareFileLengths sorts file paths such that they appear earlier if they match file: patterns in the query exactly. 

### <a id="compareSearchResults" href="#compareSearchResults">func compareSearchResults(left, right result.Match, exactFilePatterns map[string]struct{}) bool</a>

```
searchKey: graphqlbackend.compareSearchResults
tags: [function private]
```

```Go
func compareSearchResults(left, right result.Match, exactFilePatterns map[string]struct{}) bool
```

compareSearchResults sorts repository matches, file matches, and commits. Repositories and filenames are sorted alphabetically. As a refinement, if any filename matches a value in a non-empty set exactFilePatterns, then such filenames are listed earlier. 

Commits are sorted by date. Commits are not associated with searchrepos, and will always list after repository or file match results, if any. 

### <a id="decodedViewerFinalSettings" href="#decodedViewerFinalSettings">func decodedViewerFinalSettings(ctx context.Context, db dbutil.DB) (_ *schema.Settings, err error)</a>

```
searchKey: graphqlbackend.decodedViewerFinalSettings
tags: [function private]
```

```Go
func decodedViewerFinalSettings(ctx context.Context, db dbutil.DB) (_ *schema.Settings, err error)
```

### <a id="defaultSettings" href="#defaultSettings">func defaultSettings(db dbutil.DB) map[string]interface{}</a>

```
searchKey: graphqlbackend.defaultSettings
tags: [function private]
```

```Go
func defaultSettings(db dbutil.DB) map[string]interface{}
```

### <a id="deprecationAlert" href="#deprecationAlert">func deprecationAlert(args AlertFuncArgs) []*Alert</a>

```
searchKey: graphqlbackend.deprecationAlert
tags: [function private]
```

```Go
func deprecationAlert(args AlertFuncArgs) []*Alert
```

This should be removed from 3.27 

### <a id="detectSearchType" href="#detectSearchType">func detectSearchType(version string, patternType *string) (query.SearchType, error)</a>

```
searchKey: graphqlbackend.detectSearchType
tags: [function private]
```

```Go
func detectSearchType(version string, patternType *string) (query.SearchType, error)
```

detectSearchType returns the search type to perfrom ("regexp", or "literal"). The search type derives from three sources: the version and patternType parameters passed to the search endpoint (literal search is the default in V2), and the `patternType:` filter in the input query string which overrides the searchType, if present. 

### <a id="diffPathOrNull" href="#diffPathOrNull">func diffPathOrNull(path string) *string</a>

```
searchKey: graphqlbackend.diffPathOrNull
tags: [function private]
```

```Go
func diffPathOrNull(path string) *string
```

### <a id="diffResult" href="#diffResult">func diffResult(repo, commit string) *result.CommitMatch</a>

```
searchKey: graphqlbackend.diffResult
tags: [function private]
```

```Go
func diffResult(repo, commit string) *result.CommitMatch
```

### <a id="escapePathForURL" href="#escapePathForURL">func escapePathForURL(path string) string</a>

```
searchKey: graphqlbackend.escapePathForURL
tags: [function private]
```

```Go
func escapePathForURL(path string) string
```

escapePathForURL escapes path (e.g. repository name, revspec) for use in a Sourcegraph URL. For niceness/readability, we do NOT escape slashes but we do escape other characters like '#' that are necessary for correctness. 

### <a id="evaluatedFlagsToResolvers" href="#evaluatedFlagsToResolvers">func evaluatedFlagsToResolvers(input map[string]bool) []*EvaluatedFeatureFlagResolver</a>

```
searchKey: graphqlbackend.evaluatedFlagsToResolvers
tags: [function private]
```

```Go
func evaluatedFlagsToResolvers(input map[string]bool) []*EvaluatedFeatureFlagResolver
```

### <a id="exportPrometheusSearchLatencies" href="#exportPrometheusSearchLatencies">func exportPrometheusSearchLatencies(event string, payload json.RawMessage) error</a>

```
searchKey: graphqlbackend.exportPrometheusSearchLatencies
tags: [function private]
```

```Go
func exportPrometheusSearchLatencies(event string, payload json.RawMessage) error
```

exportPrometheusSearchLatencies exports Prometheus search latency metrics given a GraphQL LogEvent payload. 

### <a id="extractInt" href="#extractInt">func extractInt(i interface{}) (int, error)</a>

```
searchKey: graphqlbackend.extractInt
tags: [function private]
```

```Go
func extractInt(i interface{}) (int, error)
```

### <a id="fileDiffConnectionCompute" href="#fileDiffConnectionCompute">func fileDiffConnectionCompute(patch string) func(ctx context.Context, args *FileDiffsConnectionArgs) ([]*diff.FileDiff, int32, bool, error)</a>

```
searchKey: graphqlbackend.fileDiffConnectionCompute
tags: [function private]
```

```Go
func fileDiffConnectionCompute(patch string) func(ctx context.Context, args *FileDiffsConnectionArgs) ([]*diff.FileDiff, int32, bool, error)
```

### <a id="fileMatchesToMatches" href="#fileMatchesToMatches">func fileMatchesToMatches(fms []*result.FileMatch) []result.Match</a>

```
searchKey: graphqlbackend.fileMatchesToMatches
tags: [function private]
```

```Go
func fileMatchesToMatches(fms []*result.FileMatch) []result.Match
```

### <a id="fileResult" href="#fileResult">func fileResult(repo string, lineMatches []*result.LineMatch, symbolMatches []*result.SymbolMatch) *result.FileMatch</a>

```
searchKey: graphqlbackend.fileResult
tags: [function private]
```

```Go
func fileResult(repo string, lineMatches []*result.LineMatch, symbolMatches []*result.SymbolMatch) *result.FileMatch
```

### <a id="flagsToResolvers" href="#flagsToResolvers">func flagsToResolvers(db dbutil.DB, flags []*featureflag.FeatureFlag) []*FeatureFlagResolver</a>

```
searchKey: graphqlbackend.flagsToResolvers
tags: [function private]
```

```Go
func flagsToResolvers(db dbutil.DB, flags []*featureflag.FeatureFlag) []*FeatureFlagResolver
```

### <a id="formatJSON" href="#formatJSON">func formatJSON(data []byte) ([]byte, error)</a>

```
searchKey: graphqlbackend.formatJSON
tags: [function private]
```

```Go
func formatJSON(data []byte) ([]byte, error)
```

### <a id="generateRepos" href="#generateRepos">func generateRepos(count int) ([]*types.Repo, []*types.Repo, []*zoekt.RepoListEntry)</a>

```
searchKey: graphqlbackend.generateRepos
tags: [function private]
```

```Go
func generateRepos(count int) ([]*types.Repo, []*types.Repo, []*zoekt.RepoListEntry)
```

### <a id="generateZoektMatches" href="#generateZoektMatches">func generateZoektMatches(count int) []zoekt.FileMatch</a>

```
searchKey: graphqlbackend.generateZoektMatches
tags: [function private]
```

```Go
func generateZoektMatches(count int) []zoekt.FileMatch
```

### <a id="getBoolPtr" href="#getBoolPtr">func getBoolPtr(b *bool, def bool) bool</a>

```
searchKey: graphqlbackend.getBoolPtr
tags: [function private]
```

```Go
func getBoolPtr(b *bool, def bool) bool
```

### <a id="getDefaultBranchForRepo" href="#getDefaultBranchForRepo">func getDefaultBranchForRepo(ctx context.Context, repoName api.RepoName) (string, error)</a>

```
searchKey: graphqlbackend.getDefaultBranchForRepo
tags: [function private]
```

```Go
func getDefaultBranchForRepo(ctx context.Context, repoName api.RepoName) (string, error)
```

### <a id="getFragmentDependencies" href="#getFragmentDependencies">func getFragmentDependencies(node ast.Node) map[string]struct{}</a>

```
searchKey: graphqlbackend.getFragmentDependencies
tags: [function private]
```

```Go
func getFragmentDependencies(node ast.Node) map[string]struct{}
```

getFragmentDependencies returns all the fragments this node depend on. 

### <a id="getRepo" href="#getRepo">func getRepo(ctx context.Context, repoStore *database.RepoStore, repoURI string) (repo *types.Repo, err error)</a>

```
searchKey: graphqlbackend.getRepo
tags: [function private]
```

```Go
func getRepo(ctx context.Context, repoStore *database.RepoStore, repoURI string) (repo *types.Repo, err error)
```

getRepo attempts to find a repo in the database by URI, returning the ID if it's found. If it's not found it will use RepoLookup on repo-updater to fetch the repo info from a code host, store it in the repos table, enqueue a clone for that repo, and return the repo ID 

### <a id="getRepos" href="#getRepos">func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)</a>

```
searchKey: graphqlbackend.getRepos
tags: [function private]
```

```Go
func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)
```

getRepos is a wrapper around p.Get. It returns an error if the promise contains an underlying type other than []*search.RepositoryRevisions. 

### <a id="getUserToInviteToOrganization" href="#getUserToInviteToOrganization">func getUserToInviteToOrganization(ctx context.Context, db dbutil.DB, username string, orgID int32) (userToInvite *types.User, userEmailAddress string, err error)</a>

```
searchKey: graphqlbackend.getUserToInviteToOrganization
tags: [function private]
```

```Go
func getUserToInviteToOrganization(ctx context.Context, db dbutil.DB, username string, orgID int32) (userToInvite *types.User, userEmailAddress string, err error)
```

### <a id="gitRefDisplayName" href="#gitRefDisplayName">func gitRefDisplayName(ref string) string</a>

```
searchKey: graphqlbackend.gitRefDisplayName
tags: [function private]
```

```Go
func gitRefDisplayName(ref string) string
```

### <a id="gitRefPrefix" href="#gitRefPrefix">func gitRefPrefix(ref string) string</a>

```
searchKey: graphqlbackend.gitRefPrefix
tags: [function private]
```

```Go
func gitRefPrefix(ref string) string
```

### <a id="gitRefType" href="#gitRefType">func gitRefType(ref string) string</a>

```
searchKey: graphqlbackend.gitRefType
tags: [function private]
```

```Go
func gitRefType(ref string) string
```

### <a id="hydrateBranchCommits" href="#hydrateBranchCommits">func hydrateBranchCommits(ctx context.Context, repo api.RepoName, interactive bool, branches []*git.Branch) (ok bool, err error)</a>

```
searchKey: graphqlbackend.hydrateBranchCommits
tags: [function private]
```

```Go
func hydrateBranchCommits(ctx context.Context, repo api.RepoName, interactive bool, branches []*git.Branch) (ok bool, err error)
```

### <a id="init.db_test.go" href="#init.db_test.go">func init()</a>

```
searchKey: graphqlbackend.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.site_alerts.go" href="#init.site_alerts.go">func init()</a>

```
searchKey: graphqlbackend.init
tags: [function private]
```

```Go
func init()
```

### <a id="invalidateRepoCache" href="#invalidateRepoCache">func invalidateRepoCache(plan query.Plan) bool</a>

```
searchKey: graphqlbackend.invalidateRepoCache
tags: [function private]
```

```Go
func invalidateRepoCache(plan query.Plan) bool
```

invalidateRepoCache returns whether resolved repos should be invalidated when evaluating subexpressions. If a query contains more than one repo, revision, or repogroup field, we should invalidate resolved repos, since multiple repos, revisions, or repogroups imply that different repos may need to be resolved. 

### <a id="isContextError" href="#isContextError">func isContextError(ctx context.Context, err error) bool</a>

```
searchKey: graphqlbackend.isContextError
tags: [function private]
```

```Go
func isContextError(ctx context.Context, err error) bool
```

isContextError returns true if ctx.Err() is not nil or if err is an error caused by context cancelation or timeout. 

### <a id="isMinorUpdateAvailable" href="#isMinorUpdateAvailable">func isMinorUpdateAvailable(currentVersion, updateVersion string) bool</a>

```
searchKey: graphqlbackend.isMinorUpdateAvailable
tags: [function private]
```

```Go
func isMinorUpdateAvailable(currentVersion, updateVersion string) bool
```

isMinorUpdateAvailable tells if upgrading from the current version to the specified upgrade candidate would be a major/minor update and NOT a patch update. 

### <a id="jsonDeepEqual" href="#jsonDeepEqual">func jsonDeepEqual(a, b string) bool</a>

```
searchKey: graphqlbackend.jsonDeepEqual
tags: [function private]
```

```Go
func jsonDeepEqual(a, b string) bool
```

### <a id="limitOrDefault" href="#limitOrDefault">func limitOrDefault(first *int32) int</a>

```
searchKey: graphqlbackend.limitOrDefault
tags: [function private]
```

```Go
func limitOrDefault(first *int32) int
```

### <a id="logHoneyBatch" href="#logHoneyBatch">func logHoneyBatch(ctx context.Context, status, alertType, requestSource, requestName string, elapsed time.Duration, query string, start time.Time, srr *SearchResultsResolver)</a>

```
searchKey: graphqlbackend.logHoneyBatch
tags: [function private]
```

```Go
func logHoneyBatch(ctx context.Context, status, alertType, requestSource, requestName string, elapsed time.Duration, query string, start time.Time, srr *SearchResultsResolver)
```

### <a id="logPrometheusBatch" href="#logPrometheusBatch">func logPrometheusBatch(status, alertType, requestSource, requestName string, elapsed time.Duration)</a>

```
searchKey: graphqlbackend.logPrometheusBatch
tags: [function private]
```

```Go
func logPrometheusBatch(status, alertType, requestSource, requestName string, elapsed time.Duration)
```

### <a id="longer" href="#longer">func longer(n int, dt time.Duration) time.Duration</a>

```
searchKey: graphqlbackend.longer
tags: [function private]
```

```Go
func longer(n int, dt time.Duration) time.Duration
```

longer returns a suggested longer time to wait if the given duration wasn't long enough. 

### <a id="makePhabClientForOrigin" href="#makePhabClientForOrigin">func makePhabClientForOrigin(ctx context.Context, db dbutil.DB, origin string) (*phabricator.Client, error)</a>

```
searchKey: graphqlbackend.makePhabClientForOrigin
tags: [function private]
```

```Go
func makePhabClientForOrigin(ctx context.Context, db dbutil.DB, origin string) (*phabricator.Client, error)
```

### <a id="marshalAccessTokenID" href="#marshalAccessTokenID">func marshalAccessTokenID(id int64) graphql.ID</a>

```
searchKey: graphqlbackend.marshalAccessTokenID
tags: [function private]
```

```Go
func marshalAccessTokenID(id int64) graphql.ID
```

### <a id="marshalDefaultSettingsGQLID" href="#marshalDefaultSettingsGQLID">func marshalDefaultSettingsGQLID(defaultSettingsID string) graphql.ID</a>

```
searchKey: graphqlbackend.marshalDefaultSettingsGQLID
tags: [function private]
```

```Go
func marshalDefaultSettingsGQLID(defaultSettingsID string) graphql.ID
```

### <a id="marshalExternalAccountID" href="#marshalExternalAccountID">func marshalExternalAccountID(repo int32) graphql.ID</a>

```
searchKey: graphqlbackend.marshalExternalAccountID
tags: [function private]
```

```Go
func marshalExternalAccountID(repo int32) graphql.ID
```

### <a id="marshalExternalServiceID" href="#marshalExternalServiceID">func marshalExternalServiceID(id int64) graphql.ID</a>

```
searchKey: graphqlbackend.marshalExternalServiceID
tags: [function private]
```

```Go
func marshalExternalServiceID(id int64) graphql.ID
```

### <a id="marshalGitCommitID" href="#marshalGitCommitID">func marshalGitCommitID(repo graphql.ID, commitID GitObjectID) graphql.ID</a>

```
searchKey: graphqlbackend.marshalGitCommitID
tags: [function private]
```

```Go
func marshalGitCommitID(repo graphql.ID, commitID GitObjectID) graphql.ID
```

### <a id="marshalGitRefID" href="#marshalGitRefID">func marshalGitRefID(repo graphql.ID, rev string) graphql.ID</a>

```
searchKey: graphqlbackend.marshalGitRefID
tags: [function private]
```

```Go
func marshalGitRefID(repo graphql.ID, rev string) graphql.ID
```

### <a id="marshalOrgInvitationID" href="#marshalOrgInvitationID">func marshalOrgInvitationID(id int64) graphql.ID</a>

```
searchKey: graphqlbackend.marshalOrgInvitationID
tags: [function private]
```

```Go
func marshalOrgInvitationID(id int64) graphql.ID
```

### <a id="marshalOverrideID" href="#marshalOverrideID">func marshalOverrideID(spec overrideSpec) graphql.ID</a>

```
searchKey: graphqlbackend.marshalOverrideID
tags: [function private]
```

```Go
func marshalOverrideID(spec overrideSpec) graphql.ID
```

### <a id="marshalRepositoryCursor" href="#marshalRepositoryCursor">func marshalRepositoryCursor(cursor *repositoryCursor) string</a>

```
searchKey: graphqlbackend.marshalRepositoryCursor
tags: [function private]
```

```Go
func marshalRepositoryCursor(cursor *repositoryCursor) string
```

marshalRepositoryCursor marshals a repository pagination cursor. 

### <a id="marshalSavedSearchID" href="#marshalSavedSearchID">func marshalSavedSearchID(savedSearchID int32) graphql.ID</a>

```
searchKey: graphqlbackend.marshalSavedSearchID
tags: [function private]
```

```Go
func marshalSavedSearchID(savedSearchID int32) graphql.ID
```

### <a id="marshalSearchContextCursor" href="#marshalSearchContextCursor">func marshalSearchContextCursor(cursor int32) string</a>

```
searchKey: graphqlbackend.marshalSearchContextCursor
tags: [function private]
```

```Go
func marshalSearchContextCursor(cursor int32) string
```

### <a id="marshalSearchContextID" href="#marshalSearchContextID">func marshalSearchContextID(searchContextSpec string) graphql.ID</a>

```
searchKey: graphqlbackend.marshalSearchContextID
tags: [function private]
```

```Go
func marshalSearchContextID(searchContextSpec string) graphql.ID
```

### <a id="marshalSearchCursor" href="#marshalSearchCursor">func marshalSearchCursor(c *run.SearchCursor) string</a>

```
searchKey: graphqlbackend.marshalSearchCursor
tags: [function private]
```

```Go
func marshalSearchCursor(c *run.SearchCursor) string
```

marshalSearchCursor marshals a search pagination cursor. 

### <a id="marshalSiteGQLID" href="#marshalSiteGQLID">func marshalSiteGQLID(siteID string) graphql.ID</a>

```
searchKey: graphqlbackend.marshalSiteGQLID
tags: [function private]
```

```Go
func marshalSiteGQLID(siteID string) graphql.ID
```

### <a id="marshalSurveyResponseID" href="#marshalSurveyResponseID">func marshalSurveyResponseID(id int32) graphql.ID</a>

```
searchKey: graphqlbackend.marshalSurveyResponseID
tags: [function private]
```

```Go
func marshalSurveyResponseID(id int32) graphql.ID
```

### <a id="matchesToResolvers" href="#matchesToResolvers">func matchesToResolvers(db dbutil.DB, matches []result.Match) []SearchResultResolver</a>

```
searchKey: graphqlbackend.matchesToResolvers
tags: [function private]
```

```Go
func matchesToResolvers(db dbutil.DB, matches []result.Match) []SearchResultResolver
```

### <a id="mergeSettings" href="#mergeSettings">func mergeSettings(jsonSettingsStrings []string) ([]byte, error)</a>

```
searchKey: graphqlbackend.mergeSettings
tags: [function private]
```

```Go
func mergeSettings(jsonSettingsStrings []string) ([]byte, error)
```

mergeSettings merges the specified JSON settings documents together to produce a single JSON settings document. The deep merging behavior is described in the documentation for deeplyMergedSettingsFields. 

### <a id="mergeSettingsValues" href="#mergeSettingsValues">func mergeSettingsValues(dst map[string]interface{}, field string, value interface{}, depth int)</a>

```
searchKey: graphqlbackend.mergeSettingsValues
tags: [function private]
```

```Go
func mergeSettingsValues(dst map[string]interface{}, field string, value interface{}, depth int)
```

### <a id="mkFileMatch" href="#mkFileMatch">func mkFileMatch(repo types.RepoName, path string, lineNumbers ...int32) *result.FileMatch</a>

```
searchKey: graphqlbackend.mkFileMatch
tags: [function private]
```

```Go
func mkFileMatch(repo types.RepoName, path string, lineNumbers ...int32) *result.FileMatch
```

### <a id="mockBackendCommits" href="#mockBackendCommits">func mockBackendCommits(t *testing.T, revs ...api.CommitID)</a>

```
searchKey: graphqlbackend.mockBackendCommits
tags: [function private]
```

```Go
func mockBackendCommits(t *testing.T, revs ...api.CommitID)
```

### <a id="mustParseGraphQLSchema" href="#mustParseGraphQLSchema">func mustParseGraphQLSchema(t *testing.T) *graphql.Schema</a>

```
searchKey: graphqlbackend.mustParseGraphQLSchema
tags: [function private]
```

```Go
func mustParseGraphQLSchema(t *testing.T) *graphql.Schema
```

### <a id="needsRepositoryConfiguration" href="#needsRepositoryConfiguration">func needsRepositoryConfiguration(ctx context.Context, db dbutil.DB) (bool, error)</a>

```
searchKey: graphqlbackend.needsRepositoryConfiguration
tags: [function private]
```

```Go
func needsRepositoryConfiguration(ctx context.Context, db dbutil.DB) (bool, error)
```

### <a id="newHoneyEvent" href="#newHoneyEvent">func newHoneyEvent(ctx context.Context, status, alertType, requestSource, requestName, query string, elapsed time.Duration, srr *SearchResultsResolver) *libhoney.Event</a>

```
searchKey: graphqlbackend.newHoneyEvent
tags: [function private]
```

```Go
func newHoneyEvent(ctx context.Context, status, alertType, requestSource, requestName, query string, elapsed time.Duration, srr *SearchResultsResolver) *libhoney.Event
```

### <a id="observabilityActiveAlertsAlert" href="#observabilityActiveAlertsAlert">func observabilityActiveAlertsAlert(prom srcprometheus.Client) func(AlertFuncArgs) []*Alert</a>

```
searchKey: graphqlbackend.observabilityActiveAlertsAlert
tags: [function private]
```

```Go
func observabilityActiveAlertsAlert(prom srcprometheus.Client) func(AlertFuncArgs) []*Alert
```

observabilityActiveAlertsAlert directs admins to check Grafana if critical alerts are firing 

### <a id="orgInvitationURL" href="#orgInvitationURL">func orgInvitationURL(org *types.Org) *url.URL</a>

```
searchKey: graphqlbackend.orgInvitationURL
tags: [function private]
```

```Go
func orgInvitationURL(org *types.Org) *url.URL
```

### <a id="outOfDateAlert" href="#outOfDateAlert">func outOfDateAlert(args AlertFuncArgs) []*Alert</a>

```
searchKey: graphqlbackend.outOfDateAlert
tags: [function private]
```

```Go
func outOfDateAlert(args AlertFuncArgs) []*Alert
```

### <a id="overrideSearchType" href="#overrideSearchType">func overrideSearchType(input string, searchType query.SearchType) query.SearchType</a>

```
searchKey: graphqlbackend.overrideSearchType
tags: [function private]
```

```Go
func overrideSearchType(input string, searchType query.SearchType) query.SearchType
```

### <a id="overridesToResolvers" href="#overridesToResolvers">func overridesToResolvers(db dbutil.DB, input []*featureflag.Override) []*FeatureFlagOverrideResolver</a>

```
searchKey: graphqlbackend.overridesToResolvers
tags: [function private]
```

```Go
func overridesToResolvers(db dbutil.DB, input []*featureflag.Override) []*FeatureFlagOverrideResolver
```

### <a id="paginatedSearchFilesInRepos" href="#paginatedSearchFilesInRepos">func paginatedSearchFilesInRepos(ctx context.Context, db dbutil.DB, args *search.TextParameters, pagination *run.SearchPaginationInfo) (*run.SearchCursor, []result.Match, *streaming.Stats, error)</a>

```
searchKey: graphqlbackend.paginatedSearchFilesInRepos
tags: [function private]
```

```Go
func paginatedSearchFilesInRepos(ctx context.Context, db dbutil.DB, args *search.TextParameters, pagination *run.SearchPaginationInfo) (*run.SearchCursor, []result.Match, *streaming.Stats, error)
```

paginatedSearchFilesInRepos implements result-level pagination by calling searchFilesInRepos to search over subsets (batches) of the total list of repositories that may have results for this request (args.Repos). It does this by picking some tradeoffs to balance some conflicting facts: 

1. Paginated text searches must currently ask Zoekt AND non-indexed search 

```
to produce the entire result set for a repository. This is like querying
for `repo:^exact-repo$ count:1000000` in a non-paginated query, and is
more costly and slower than the default `count:30` used in non-paginated
requests (search for FileMatchLimit) which allows Zoekt/non-indexed
search to stop searching after finding enough results. Another reason for
needing to produce the entire result set for a repository is because
Zoekt does not today produce a stable order of results.

```
2. With NITH (needle-in-the-haystack) queries, if we don't search enough 

```
repositories in parallel we would substantially harm the performance of
these queries. For example, if we were to search 100 repositories at a
time and there were 1000 repositories to search and only the last 100
repositories had results for you, you need to wait for the first 9
batched searches to complete making your results 10x slower to fetch on
top of the penalty we incur from the larger `count:` mentioned in point
2 above (in the worst case scenario).

```
### <a id="pathParentsByFrequency" href="#pathParentsByFrequency">func pathParentsByFrequency(paths []string) []string</a>

```
searchKey: graphqlbackend.pathParentsByFrequency
tags: [function private]
```

```Go
func pathParentsByFrequency(paths []string) []string
```

pathParentsByFrequency returns the most common path parents of the given paths. For example, given paths [a/b a/c x/y], it would return [a x] because "a" is a parent to 2 paths and "x" is a parent to 1 path. 

### <a id="pluralize" href="#pluralize">func pluralize(v int, singular, plural string) string</a>

```
searchKey: graphqlbackend.pluralize
tags: [function private]
```

```Go
func pluralize(v int, singular, plural string) string
```

### <a id="processPaginationRequest" href="#processPaginationRequest">func processPaginationRequest(args *SearchArgs, q query.Q) (*run.SearchPaginationInfo, error)</a>

```
searchKey: graphqlbackend.processPaginationRequest
tags: [function private]
```

```Go
func processPaginationRequest(args *SearchArgs, q query.Q) (*run.SearchPaginationInfo, error)
```

### <a id="prometheusFieldName" href="#prometheusFieldName">func prometheusFieldName(typeName, fieldName string) string</a>

```
searchKey: graphqlbackend.prometheusFieldName
tags: [function private]
```

```Go
func prometheusFieldName(typeName, fieldName string) string
```

prometheusFieldName reduces the cardinality of GraphQL field names to make it suitable for use in a Prometheus metric. We only track the ones most valuable to us. 

See [https://github.com/sourcegraph/sourcegraph/issues/9895](https://github.com/sourcegraph/sourcegraph/issues/9895) 

### <a id="prometheusGraphQLRequestName" href="#prometheusGraphQLRequestName">func prometheusGraphQLRequestName(requestName string) string</a>

```
searchKey: graphqlbackend.prometheusGraphQLRequestName
tags: [function private]
```

```Go
func prometheusGraphQLRequestName(requestName string) string
```

prometheusGraphQLRequestName is a allowlist of GraphQL request names (e.g. /.api/graphql?Foobar) to include in a Prometheus metric. Be extremely careful 

### <a id="prometheusTypeName" href="#prometheusTypeName">func prometheusTypeName(typeName string) string</a>

```
searchKey: graphqlbackend.prometheusTypeName
tags: [function private]
```

```Go
func prometheusTypeName(typeName string) string
```

prometheusTypeName reduces the cardinality of GraphQL type names to make it suitable for use in a Prometheus metric. This is a blocklist of type names which involve non-complex calculations in the GraphQL backend and thus are not worth tracking. You can find a complete list of the ones Prometheus is currently tracking via: 

```
sum by (type)(src_graphql_field_seconds_count)

```
### <a id="queryHasPatternType" href="#queryHasPatternType">func queryHasPatternType(query string) bool</a>

```
searchKey: graphqlbackend.queryHasPatternType
tags: [function private]
```

```Go
func queryHasPatternType(query string) bool
```

### <a id="repoIsLess" href="#repoIsLess">func repoIsLess(i, j types.RepoName) bool</a>

```
searchKey: graphqlbackend.repoIsLess
tags: [function private]
```

```Go
func repoIsLess(i, j types.RepoName) bool
```

repoIsLess sorts repositories first by name then by ID, suitable for use with sort.Slice. 

### <a id="repoNamesToStrings" href="#repoNamesToStrings">func repoNamesToStrings(repoNames []api.RepoName) []string</a>

```
searchKey: graphqlbackend.repoNamesToStrings
tags: [function private]
```

```Go
func repoNamesToStrings(repoNames []api.RepoName) []string
```

### <a id="repoOfMatch" href="#repoOfMatch">func repoOfMatch(match result.Match) string</a>

```
searchKey: graphqlbackend.repoOfMatch
tags: [function private]
```

```Go
func repoOfMatch(match result.Match) string
```

repoOfMatch is a helper function to resolve the repo associated with a result type. 

### <a id="repoResult" href="#repoResult">func repoResult(name string) *result.RepoMatch</a>

```
searchKey: graphqlbackend.repoResult
tags: [function private]
```

```Go
func repoResult(name string) *result.RepoMatch
```

### <a id="repoRev" href="#repoRev">func repoRev(revSpec string) *search.RepositoryRevisions</a>

```
searchKey: graphqlbackend.repoRev
tags: [function private]
```

```Go
func repoRev(revSpec string) *search.RepositoryRevisions
```

### <a id="reposMap" href="#reposMap">func reposMap(repos ...types.RepoName) map[api.RepoID]types.RepoName</a>

```
searchKey: graphqlbackend.reposMap
tags: [function private]
```

```Go
func reposMap(repos ...types.RepoName) map[api.RepoID]types.RepoName
```

### <a id="resetMocks" href="#resetMocks">func resetMocks()</a>

```
searchKey: graphqlbackend.resetMocks
tags: [function private]
```

```Go
func resetMocks()
```

### <a id="resolveVersionContext" href="#resolveVersionContext">func resolveVersionContext(versionContext string) (*schema.VersionContext, error)</a>

```
searchKey: graphqlbackend.resolveVersionContext
tags: [function private]
```

```Go
func resolveVersionContext(versionContext string) (*schema.VersionContext, error)
```

### <a id="richHTML" href="#richHTML">func richHTML(content, ext string) (string, error)</a>

```
searchKey: graphqlbackend.richHTML
tags: [function private]
```

```Go
func richHTML(content, ext string) (string, error)
```

### <a id="searchContextsToResolvers" href="#searchContextsToResolvers">func searchContextsToResolvers(searchContexts []*types.SearchContext, db dbutil.DB) []*searchContextResolver</a>

```
searchKey: graphqlbackend.searchContextsToResolvers
tags: [function private]
```

```Go
func searchContextsToResolvers(searchContexts []*types.SearchContext, db dbutil.DB) []*searchContextResolver
```

### <a id="searchResultResolversToString" href="#searchResultResolversToString">func searchResultResolversToString(matches []result.Match) string</a>

```
searchKey: graphqlbackend.searchResultResolversToString
tags: [function private]
```

```Go
func searchResultResolversToString(matches []result.Match) string
```

### <a id="searchResultsStatsLanguages" href="#searchResultsStatsLanguages">func searchResultsStatsLanguages(ctx context.Context, matches []result.Match) ([]inventory.Lang, error)</a>

```
searchKey: graphqlbackend.searchResultsStatsLanguages
tags: [function private]
```

```Go
func searchResultsStatsLanguages(ctx context.Context, matches []result.Match) ([]inventory.Lang, error)
```

### <a id="searchResultsToRepoNodes" href="#searchResultsToRepoNodes">func searchResultsToRepoNodes(matches []result.Match) ([]query.Node, error)</a>

```
searchKey: graphqlbackend.searchResultsToRepoNodes
tags: [function private]
```

```Go
func searchResultsToRepoNodes(matches []result.Match) ([]query.Node, error)
```

searchResultsToRepoNodes converts a set of search results into repository nodes such that they can be used to replace a repository predicate 

### <a id="selectResults" href="#selectResults">func selectResults(results []result.Match, q query.Basic) []result.Match</a>

```
searchKey: graphqlbackend.selectResults
tags: [function private]
```

```Go
func selectResults(results []result.Match, q query.Basic) []result.Match
```

### <a id="sendOrgInvitationNotification" href="#sendOrgInvitationNotification">func sendOrgInvitationNotification(ctx context.Context, db dbutil.DB, org *types.Org, sender *types.User, recipientEmail string) error</a>

```
searchKey: graphqlbackend.sendOrgInvitationNotification
tags: [function private]
```

```Go
func sendOrgInvitationNotification(ctx context.Context, db dbutil.DB, org *types.Org, sender *types.User, recipientEmail string) error
```

sendOrgInvitationNotification sends an email to the recipient of an org invitation with a link to respond to the invitation. Callers should check conf.CanSendEmail() if they want to return a nice error if sending email is not enabled. 

### <a id="settingsCreateIfUpToDate" href="#settingsCreateIfUpToDate">func settingsCreateIfUpToDate(ctx context.Context, db dbutil.DB, subject *settingsSubject, lastID *int32, authorUserID int32, contents string) (latestSetting *api.Settings, err error)</a>

```
searchKey: graphqlbackend.settingsCreateIfUpToDate
tags: [function private]
```

```Go
func settingsCreateIfUpToDate(ctx context.Context, db dbutil.DB, subject *settingsSubject, lastID *int32, authorUserID int32, contents string) (latestSetting *api.Settings, err error)
```

like database.Settings.CreateIfUpToDate, except it handles notifying the query-runner if any saved queries have changed. 

### <a id="shouldCheckParam" href="#shouldCheckParam">func shouldCheckParam(p visitor.VisitFuncParams) bool</a>

```
searchKey: graphqlbackend.shouldCheckParam
tags: [function private]
```

```Go
func shouldCheckParam(p visitor.VisitFuncParams) bool
```

### <a id="sliceSearchResultsCommon" href="#sliceSearchResultsCommon">func sliceSearchResultsCommon(common *streaming.Stats, firstResultRepo, lastResultRepo string) *streaming.Stats</a>

```
searchKey: graphqlbackend.sliceSearchResultsCommon
tags: [function private]
```

```Go
func sliceSearchResultsCommon(common *streaming.Stats, firstResultRepo, lastResultRepo string) *streaming.Stats
```

### <a id="sortErrors" href="#sortErrors">func sortErrors(errors []*errors.QueryError)</a>

```
searchKey: graphqlbackend.sortErrors
tags: [function private]
```

```Go
func sortErrors(errors []*errors.QueryError)
```

### <a id="sortSearchSuggestions" href="#sortSearchSuggestions">func sortSearchSuggestions(s []SearchSuggestionResolver)</a>

```
searchKey: graphqlbackend.sortSearchSuggestions
tags: [function private]
```

```Go
func sortSearchSuggestions(s []SearchSuggestionResolver)
```

### <a id="stripPassword" href="#stripPassword">func stripPassword(s string) string</a>

```
searchKey: graphqlbackend.stripPassword
tags: [function private]
```

```Go
func stripPassword(s string) string
```

stripPassword strips the password from u if it can be parsed as a URL. If not, it is left unchanged This is a modified version of stringPassword from the standard lib in net/http/client.go 

### <a id="strptr" href="#strptr">func strptr(s string) *string</a>

```
searchKey: graphqlbackend.strptr
tags: [function private]
```

```Go
func strptr(s string) *string
```

### <a id="substitutePredicates" href="#substitutePredicates">func substitutePredicates(q query.Basic, evaluate func(query.Predicate) (*SearchResults, error)) (query.Plan, error)</a>

```
searchKey: graphqlbackend.substitutePredicates
tags: [function private]
```

```Go
func substitutePredicates(q query.Basic, evaluate func(query.Predicate) (*SearchResults, error)) (query.Plan, error)
```

substitutePredicates replaces all the predicates in a query with their expanded form. The predicates are expanded using the doExpand function. 

### <a id="symbolResultsToResolvers" href="#symbolResultsToResolvers">func symbolResultsToResolvers(db dbutil.DB, commit *GitCommitResolver, symbols []*result.SymbolMatch) []symbolResolver</a>

```
searchKey: graphqlbackend.symbolResultsToResolvers
tags: [function private]
```

```Go
func symbolResultsToResolvers(db dbutil.DB, commit *GitCommitResolver, symbols []*result.SymbolMatch) []symbolResolver
```

### <a id="syncExternalService" href="#syncExternalService">func syncExternalService(ctx context.Context, svc *types.ExternalService, timeout time.Duration, client repoupdaterClient) error</a>

```
searchKey: graphqlbackend.syncExternalService
tags: [function private]
```

```Go
func syncExternalService(ctx context.Context, svc *types.ExternalService, timeout time.Duration, client repoupdaterClient) error
```

syncExternalService will eagerly trigger a repo-updater sync. It accepts a timeout as an argument which is recommended to be 5 seconds unless the caller has special requirements for it to be larger or smaller. 

### <a id="testStringResult" href="#testStringResult">func testStringResult(result SearchSuggestionResolver) string</a>

```
searchKey: graphqlbackend.testStringResult
tags: [function private]
```

```Go
func testStringResult(result SearchSuggestionResolver) string
```

### <a id="toDBRepoListColumn" href="#toDBRepoListColumn">func toDBRepoListColumn(ob string) database.RepoListColumn</a>

```
searchKey: graphqlbackend.toDBRepoListColumn
tags: [function private]
```

```Go
func toDBRepoListColumn(ob string) database.RepoListColumn
```

### <a id="toJSON" href="#toJSON">func toJSON(node query.Node) interface{}</a>

```
searchKey: graphqlbackend.toJSON
tags: [function private]
```

```Go
func toJSON(node query.Node) interface{}
```

### <a id="toKeyPath" href="#toKeyPath">func toKeyPath(gqlKeyPath []*keyPathSegment) (jsonx.Path, error)</a>

```
searchKey: graphqlbackend.toKeyPath
tags: [function private]
```

```Go
func toKeyPath(gqlKeyPath []*keyPathSegment) (jsonx.Path, error)
```

### <a id="unmarshalAccessTokenID" href="#unmarshalAccessTokenID">func unmarshalAccessTokenID(id graphql.ID) (accessTokenID int64, err error)</a>

```
searchKey: graphqlbackend.unmarshalAccessTokenID
tags: [function private]
```

```Go
func unmarshalAccessTokenID(id graphql.ID) (accessTokenID int64, err error)
```

### <a id="unmarshalExternalAccountID" href="#unmarshalExternalAccountID">func unmarshalExternalAccountID(id graphql.ID) (externalAccountID int32, err error)</a>

```
searchKey: graphqlbackend.unmarshalExternalAccountID
tags: [function private]
```

```Go
func unmarshalExternalAccountID(id graphql.ID) (externalAccountID int32, err error)
```

### <a id="unmarshalExternalServiceID" href="#unmarshalExternalServiceID">func unmarshalExternalServiceID(id graphql.ID) (externalServiceID int64, err error)</a>

```
searchKey: graphqlbackend.unmarshalExternalServiceID
tags: [function private]
```

```Go
func unmarshalExternalServiceID(id graphql.ID) (externalServiceID int64, err error)
```

### <a id="unmarshalGitRefID" href="#unmarshalGitRefID">func unmarshalGitRefID(id graphql.ID) (repoID graphql.ID, rev string, err error)</a>

```
searchKey: graphqlbackend.unmarshalGitRefID
tags: [function private]
```

```Go
func unmarshalGitRefID(id graphql.ID) (repoID graphql.ID, rev string, err error)
```

### <a id="unmarshalOrgInvitationID" href="#unmarshalOrgInvitationID">func unmarshalOrgInvitationID(id graphql.ID) (orgInvitationID int64, err error)</a>

```
searchKey: graphqlbackend.unmarshalOrgInvitationID
tags: [function private]
```

```Go
func unmarshalOrgInvitationID(id graphql.ID) (orgInvitationID int64, err error)
```

### <a id="unmarshalSavedSearchID" href="#unmarshalSavedSearchID">func unmarshalSavedSearchID(id graphql.ID) (savedSearchID int32, err error)</a>

```
searchKey: graphqlbackend.unmarshalSavedSearchID
tags: [function private]
```

```Go
func unmarshalSavedSearchID(id graphql.ID) (savedSearchID int32, err error)
```

### <a id="unmarshalSearchContextCursor" href="#unmarshalSearchContextCursor">func unmarshalSearchContextCursor(cursor *string) (int32, error)</a>

```
searchKey: graphqlbackend.unmarshalSearchContextCursor
tags: [function private]
```

```Go
func unmarshalSearchContextCursor(cursor *string) (int32, error)
```

### <a id="unmarshalSearchContextID" href="#unmarshalSearchContextID">func unmarshalSearchContextID(id graphql.ID) (spec string, err error)</a>

```
searchKey: graphqlbackend.unmarshalSearchContextID
tags: [function private]
```

```Go
func unmarshalSearchContextID(id graphql.ID) (spec string, err error)
```

### <a id="unmarshalSearchCursor" href="#unmarshalSearchCursor">func unmarshalSearchCursor(cursor *string) (*run.SearchCursor, error)</a>

```
searchKey: graphqlbackend.unmarshalSearchCursor
tags: [function private]
```

```Go
func unmarshalSearchCursor(cursor *string) (*run.SearchCursor, error)
```

unmarshalSearchCursor unmarshals a search pagination cursor. 

### <a id="unmarshalSiteGQLID" href="#unmarshalSiteGQLID">func unmarshalSiteGQLID(id graphql.ID) (siteID string, err error)</a>

```
searchKey: graphqlbackend.unmarshalSiteGQLID
tags: [function private]
```

```Go
func unmarshalSiteGQLID(id graphql.ID) (siteID string, err error)
```

### <a id="updateAvailableAlert" href="#updateAvailableAlert">func updateAvailableAlert(args AlertFuncArgs) []*Alert</a>

```
searchKey: graphqlbackend.updateAvailableAlert
tags: [function private]
```

```Go
func updateAvailableAlert(args AlertFuncArgs) []*Alert
```

### <a id="viewerCanChangeUsername" href="#viewerCanChangeUsername">func viewerCanChangeUsername(ctx context.Context, db dbutil.DB, userID int32) bool</a>

```
searchKey: graphqlbackend.viewerCanChangeUsername
tags: [function private]
```

```Go
func viewerCanChangeUsername(ctx context.Context, db dbutil.DB, userID int32) bool
```

### <a id="viewerIsChangingUsername" href="#viewerIsChangingUsername">func viewerIsChangingUsername(ctx context.Context, db dbutil.DB, subjectUserID int32, proposedUsername string) bool</a>

```
searchKey: graphqlbackend.viewerIsChangingUsername
tags: [function private]
```

```Go
func viewerIsChangingUsername(ctx context.Context, db dbutil.DB, subjectUserID int32, proposedUsername string) bool
```

Users may be trying to change their own username, or someone else's. 

The subjectUserID value represents the decoded user ID from the incoming update request, and the proposedUsername is the value that would be applied to that subject's record if all security checks pass. 

If that subject's username is different from the proposed one, then a change is being attempted and may be rejected by viewerCanChangeUsername. 

### <a id="zoektRPC" href="#zoektRPC">func zoektRPC(s zoekt.Searcher) (zoekt.Searcher, func())</a>

```
searchKey: graphqlbackend.zoektRPC
tags: [function private]
```

```Go
func zoektRPC(s zoekt.Searcher) (zoekt.Searcher, func())
```

zoektRPC starts zoekts rpc interface and returns a client to searcher. Useful for capturing CPU/memory usage when benchmarking the zoekt client. 

