# Package repos

Package repos providers workers to monitor code host APIs. 

## Index

* [Constants](#const)
    * [const CountTotalUserAddedReposQueryFmtstr](#CountTotalUserAddedReposQueryFmtstr)
    * [const batchReposQueryFmtstr](#batchReposQueryFmtstr)
    * [const enqueueSyncJobsQueryFmtstr](#enqueueSyncJobsQueryFmtstr)
    * [const maxDelay](#maxDelay)
    * [const minDelay](#minDelay)
    * [const notifyChanBuffer](#notifyChanBuffer)
    * [const priorityHigh](#priorityHigh)
    * [const priorityLow](#priorityLow)
    * [const setClonedReposQueryFmtstr](#setClonedReposQueryFmtstr)
    * [const stubBadHTTPRedirectLocation](#stubBadHTTPRedirectLocation)
    * [const tagFamily](#tagFamily)
    * [const tagID](#tagID)
    * [const tagState](#tagState)
    * [const tagSuccess](#tagSuccess)
    * [const upsertSourcesFmtstrDeletes](#upsertSourcesFmtstrDeletes)
    * [const upsertSourcesFmtstrPrefix](#upsertSourcesFmtstrPrefix)
    * [const upsertSourcesFmtstrSuffix](#upsertSourcesFmtstrSuffix)
* [Variables](#var)
    * [var MockStatusMessages](#MockStatusMessages)
    * [var batchDeleteReposQuery](#batchDeleteReposQuery)
    * [var batchInsertReposQuery](#batchInsertReposQuery)
    * [var batchUpdateReposQuery](#batchUpdateReposQuery)
    * [var configuredLimiter](#configuredLimiter)
    * [var defaultTime](#defaultTime)
    * [var githubRatelimitWaitCounter](#githubRatelimitWaitCounter)
    * [var githubRemainingGauge](#githubRemainingGauge)
    * [var gitlabRatelimitWaitCounter](#gitlabRatelimitWaitCounter)
    * [var gitlabRemainingGauge](#gitlabRemainingGauge)
    * [var lastSync](#lastSync)
    * [var listRepoIDsQuery](#listRepoIDsQuery)
    * [var notify](#notify)
    * [var phabricatorUpdateTime](#phabricatorUpdateTime)
    * [var purgeFailed](#purgeFailed)
    * [var purgeSuccess](#purgeSuccess)
    * [var regOrg](#regOrg)
    * [var requestRepoUpdate](#requestRepoUpdate)
    * [var schedAutoFetch](#schedAutoFetch)
    * [var schedError](#schedError)
    * [var schedKnownRepos](#schedKnownRepos)
    * [var schedLoops](#schedLoops)
    * [var schedManualFetch](#schedManualFetch)
    * [var schedUpdateQueueLength](#schedUpdateQueueLength)
    * [var schemeOrHostNotEmptyErr](#schemeOrHostNotEmptyErr)
    * [var syncDuration](#syncDuration)
    * [var syncErrors](#syncErrors)
    * [var syncStarted](#syncStarted)
    * [var syncedTotal](#syncedTotal)
    * [var timeAfterFunc](#timeAfterFunc)
    * [var timeNow](#timeNow)
    * [var updateRegex](#updateRegex)
    * [var upsertSourcesQueryFmtstr](#upsertSourcesQueryFmtstr)
    * [var upsertSourcesWithDeletesQueryFmtstr](#upsertSourcesWithDeletesQueryFmtstr)
* [Types](#type)
    * [type AWSCodeCommitSource struct](#AWSCodeCommitSource)
        * [func NewAWSCodeCommitSource(svc *types.ExternalService, cf *httpcli.Factory) (*AWSCodeCommitSource, error)](#NewAWSCodeCommitSource)
        * [func newAWSCodeCommitSource(svc *types.ExternalService, c *schema.AWSCodeCommitConnection, cf *httpcli.Factory) (*AWSCodeCommitSource, error)](#newAWSCodeCommitSource)
        * [func (s *AWSCodeCommitSource) ExternalServices() types.ExternalServices](#AWSCodeCommitSource.ExternalServices)
        * [func (s *AWSCodeCommitSource) ListRepos(ctx context.Context, results chan SourceResult)](#AWSCodeCommitSource.ListRepos)
        * [func (s *AWSCodeCommitSource) excludes(r *awscodecommit.Repository) bool](#AWSCodeCommitSource.excludes)
        * [func (s *AWSCodeCommitSource) listAllRepositories(ctx context.Context, results chan SourceResult)](#AWSCodeCommitSource.listAllRepositories)
        * [func (s *AWSCodeCommitSource) makeRepo(r *awscodecommit.Repository) (*types.Repo, error)](#AWSCodeCommitSource.makeRepo)
    * [type AffiliatedRepositorySource interface](#AffiliatedRepositorySource)
    * [type BitbucketCloudSource struct](#BitbucketCloudSource)
        * [func NewBitbucketCloudSource(svc *types.ExternalService, cf *httpcli.Factory) (*BitbucketCloudSource, error)](#NewBitbucketCloudSource)
        * [func newBitbucketCloudSource(svc *types.ExternalService, c *schema.BitbucketCloudConnection, cf *httpcli.Factory) (*BitbucketCloudSource, error)](#newBitbucketCloudSource)
        * [func (s BitbucketCloudSource) ExternalServices() types.ExternalServices](#BitbucketCloudSource.ExternalServices)
        * [func (s BitbucketCloudSource) ListRepos(ctx context.Context, results chan SourceResult)](#BitbucketCloudSource.ListRepos)
        * [func (s *BitbucketCloudSource) excludes(r *bitbucketcloud.Repo) bool](#BitbucketCloudSource.excludes)
        * [func (s *BitbucketCloudSource) listAllRepos(ctx context.Context, results chan SourceResult)](#BitbucketCloudSource.listAllRepos)
        * [func (s BitbucketCloudSource) makeRepo(r *bitbucketcloud.Repo) *types.Repo](#BitbucketCloudSource.makeRepo)
        * [func (s *BitbucketCloudSource) remoteURL(repo *bitbucketcloud.Repo) string](#BitbucketCloudSource.remoteURL)
    * [type BitbucketServerSource struct](#BitbucketServerSource)
        * [func NewBitbucketServerSource(svc *types.ExternalService, cf *httpcli.Factory) (*BitbucketServerSource, error)](#NewBitbucketServerSource)
        * [func newBitbucketServerSource(svc *types.ExternalService, c *schema.BitbucketServerConnection, cf *httpcli.Factory) (*BitbucketServerSource, error)](#newBitbucketServerSource)
        * [func (s *BitbucketServerSource) AuthenticatedUsername(ctx context.Context) (string, error)](#BitbucketServerSource.AuthenticatedUsername)
        * [func (s BitbucketServerSource) ExternalServices() types.ExternalServices](#BitbucketServerSource.ExternalServices)
        * [func (s BitbucketServerSource) ListRepos(ctx context.Context, results chan SourceResult)](#BitbucketServerSource.ListRepos)
        * [func (s *BitbucketServerSource) ValidateAuthenticator(ctx context.Context) error](#BitbucketServerSource.ValidateAuthenticator)
        * [func (s BitbucketServerSource) WithAuthenticator(a auth.Authenticator) (Source, error)](#BitbucketServerSource.WithAuthenticator)
        * [func (s *BitbucketServerSource) excludes(r *bitbucketserver.Repo) bool](#BitbucketServerSource.excludes)
        * [func (s *BitbucketServerSource) listAllLabeledRepos(ctx context.Context, label string) (map[int]struct{}, error)](#BitbucketServerSource.listAllLabeledRepos)
        * [func (s *BitbucketServerSource) listAllRepos(ctx context.Context, results chan SourceResult)](#BitbucketServerSource.listAllRepos)
        * [func (s BitbucketServerSource) makeRepo(repo *bitbucketserver.Repo, isArchived bool) *types.Repo](#BitbucketServerSource.makeRepo)
    * [type CloningProgress struct](#CloningProgress)
    * [type Diff struct](#Diff)
        * [func NewDiff(sourced, stored []*types.Repo) (diff Diff)](#NewDiff)
        * [func newDiff(svc *types.ExternalService, sourced, stored []*types.Repo) (diff Diff)](#newDiff)
        * [func (d Diff) Repos() types.Repos](#Diff.Repos)
        * [func (d *Diff) Sort()](#Diff.Sort)
    * [type ErrAccountSuspended struct{}](#ErrAccountSuspended)
        * [func (e ErrAccountSuspended) AccountSuspended() bool](#ErrAccountSuspended.AccountSuspended)
        * [func (e ErrAccountSuspended) Error() string](#ErrAccountSuspended.Error)
    * [type ErrForbidden struct{}](#ErrForbidden)
        * [func (e ErrForbidden) Error() string](#ErrForbidden.Error)
        * [func (e ErrForbidden) Forbidden() bool](#ErrForbidden.Forbidden)
    * [type ErrUnauthorized struct{}](#ErrUnauthorized)
        * [func (e ErrUnauthorized) Error() string](#ErrUnauthorized.Error)
        * [func (e ErrUnauthorized) Unauthorized() bool](#ErrUnauthorized.Unauthorized)
    * [type ExternalServiceSyncError struct](#ExternalServiceSyncError)
    * [type FakeSource struct](#FakeSource)
        * [func NewFakeSource(svc *types.ExternalService, err error, rs ...*types.Repo) *FakeSource](#NewFakeSource)
        * [func (s FakeSource) ExternalServices() types.ExternalServices](#FakeSource.ExternalServices)
        * [func (s FakeSource) ListRepos(ctx context.Context, results chan SourceResult)](#FakeSource.ListRepos)
    * [type GitLabSource struct](#GitLabSource)
        * [func NewGitLabSource(svc *types.ExternalService, cf *httpcli.Factory) (*GitLabSource, error)](#NewGitLabSource)
        * [func newGitLabSource(svc *types.ExternalService, c *schema.GitLabConnection, cf *httpcli.Factory) (*GitLabSource, error)](#newGitLabSource)
        * [func (s *GitLabSource) AffiliatedRepositories(ctx context.Context) ([]types.CodeHostRepository, error)](#GitLabSource.AffiliatedRepositories)
        * [func (s GitLabSource) ExternalServices() types.ExternalServices](#GitLabSource.ExternalServices)
        * [func (s GitLabSource) GetRepo(ctx context.Context, pathWithNamespace string) (*types.Repo, error)](#GitLabSource.GetRepo)
        * [func (s GitLabSource) ListRepos(ctx context.Context, results chan SourceResult)](#GitLabSource.ListRepos)
        * [func (s GitLabSource) ValidateAuthenticator(ctx context.Context) error](#GitLabSource.ValidateAuthenticator)
        * [func (s GitLabSource) WithAuthenticator(a auth.Authenticator) (Source, error)](#GitLabSource.WithAuthenticator)
        * [func (s *GitLabSource) excludes(p *gitlab.Project) bool](#GitLabSource.excludes)
        * [func (s *GitLabSource) listAllProjects(ctx context.Context, results chan SourceResult)](#GitLabSource.listAllProjects)
        * [func (s GitLabSource) makeRepo(proj *gitlab.Project) *types.Repo](#GitLabSource.makeRepo)
        * [func (s *GitLabSource) remoteURL(proj *gitlab.Project) string](#GitLabSource.remoteURL)
    * [type GithubSource struct](#GithubSource)
        * [func NewGithubSource(svc *types.ExternalService, cf *httpcli.Factory) (*GithubSource, error)](#NewGithubSource)
        * [func newGithubSource(svc *types.ExternalService, c *schema.GitHubConnection, cf *httpcli.Factory) (*GithubSource, error)](#newGithubSource)
        * [func (s *GithubSource) AffiliatedRepositories(ctx context.Context) ([]types.CodeHostRepository, error)](#GithubSource.AffiliatedRepositories)
        * [func (s GithubSource) ExternalServices() types.ExternalServices](#GithubSource.ExternalServices)
        * [func (s GithubSource) GetRepo(ctx context.Context, nameWithOwner string) (*types.Repo, error)](#GithubSource.GetRepo)
        * [func (s GithubSource) ListRepos(ctx context.Context, results chan SourceResult)](#GithubSource.ListRepos)
        * [func (s GithubSource) ValidateAuthenticator(ctx context.Context) error](#GithubSource.ValidateAuthenticator)
        * [func (s GithubSource) WithAuthenticator(a auth.Authenticator) (Source, error)](#GithubSource.WithAuthenticator)
        * [func (s *GithubSource) excludes(r *github.Repository) bool](#GithubSource.excludes)
        * [func (s *GithubSource) fetchAllRepositoriesInBatches(ctx context.Context, results chan *githubResult) error](#GithubSource.fetchAllRepositoriesInBatches)
        * [func (s *GithubSource) getRepository(ctx context.Context, nameWithOwner string) (*github.Repository, error)](#GithubSource.getRepository)
        * [func (s *GithubSource) listAffiliated(ctx context.Context, results chan *githubResult)](#GithubSource.listAffiliated)
        * [func (s *GithubSource) listAllRepositories(ctx context.Context, results chan *githubResult)](#GithubSource.listAllRepositories)
        * [func (s *GithubSource) listOrg(ctx context.Context, org string, results chan *githubResult)](#GithubSource.listOrg)
        * [func (s *GithubSource) listPublic(ctx context.Context, results chan *githubResult)](#GithubSource.listPublic)
        * [func (s *GithubSource) listRepos(ctx context.Context, repos []string, results chan *githubResult)](#GithubSource.listRepos)
        * [func (s *GithubSource) listRepositoryQuery(ctx context.Context, query string, results chan *githubResult)](#GithubSource.listRepositoryQuery)
        * [func (s *GithubSource) listSearch(ctx context.Context, query string, results chan *githubResult)](#GithubSource.listSearch)
        * [func (s *GithubSource) listUser(ctx context.Context, user string, results chan *githubResult) (fail error)](#GithubSource.listUser)
        * [func (s GithubSource) makeRepo(r *github.Repository) *types.Repo](#GithubSource.makeRepo)
        * [func (s *GithubSource) paginate(ctx context.Context, results chan *githubResult, pager repositoryPager)](#GithubSource.paginate)
        * [func (s *GithubSource) remoteURL(repo *github.Repository) string](#GithubSource.remoteURL)
    * [type GitolitePhabricatorMetadataSyncer struct](#GitolitePhabricatorMetadataSyncer)
        * [func NewGitolitePhabricatorMetadataSyncer(s *Store) *GitolitePhabricatorMetadataSyncer](#NewGitolitePhabricatorMetadataSyncer)
        * [func (s *GitolitePhabricatorMetadataSyncer) Sync(ctx context.Context, repos []*types.Repo) error](#GitolitePhabricatorMetadataSyncer.Sync)
    * [type GitoliteSource struct](#GitoliteSource)
        * [func NewGitoliteSource(svc *types.ExternalService, cf *httpcli.Factory) (*GitoliteSource, error)](#NewGitoliteSource)
        * [func (s GitoliteSource) ExternalServices() types.ExternalServices](#GitoliteSource.ExternalServices)
        * [func (s *GitoliteSource) ListRepos(ctx context.Context, results chan SourceResult)](#GitoliteSource.ListRepos)
        * [func (s GitoliteSource) excludes(gr *gitolite.Repo, r *types.Repo) bool](#GitoliteSource.excludes)
        * [func (s GitoliteSource) makeRepo(repo *gitolite.Repo) *types.Repo](#GitoliteSource.makeRepo)
    * [type IndexingProgress struct](#IndexingProgress)
    * [type MockExternalServicesLister struct](#MockExternalServicesLister)
        * [func (m MockExternalServicesLister) List(ctx context.Context, args database.ExternalServicesListOptions) ([]*types.ExternalService, error)](#MockExternalServicesLister.List)
    * [type MockStore struct](#MockStore)
    * [type OtherSource struct](#OtherSource)
        * [func NewOtherSource(svc *types.ExternalService, cf *httpcli.Factory) (*OtherSource, error)](#NewOtherSource)
        * [func (s OtherSource) ExternalServices() types.ExternalServices](#OtherSource.ExternalServices)
        * [func (s OtherSource) ListRepos(ctx context.Context, results chan SourceResult)](#OtherSource.ListRepos)
        * [func (s OtherSource) cloneURLs() ([]*url.URL, error)](#OtherSource.cloneURLs)
        * [func (s OtherSource) otherRepoFromCloneURL(urn string, u *url.URL) (*types.Repo, error)](#OtherSource.otherRepoFromCloneURL)
        * [func (s OtherSource) srcExpose(ctx context.Context) ([]*types.Repo, error)](#OtherSource.srcExpose)
    * [type PerforceSource struct](#PerforceSource)
        * [func NewPerforceSource(svc *types.ExternalService) (*PerforceSource, error)](#NewPerforceSource)
        * [func newPerforceSource(svc *types.ExternalService, c *schema.PerforceConnection) (*PerforceSource, error)](#newPerforceSource)
        * [func (s PerforceSource) ExternalServices() types.ExternalServices](#PerforceSource.ExternalServices)
        * [func (s PerforceSource) ListRepos(ctx context.Context, results chan SourceResult)](#PerforceSource.ListRepos)
        * [func (s PerforceSource) makeRepo(depot string) *types.Repo](#PerforceSource.makeRepo)
    * [type PhabricatorSource struct](#PhabricatorSource)
        * [func NewPhabricatorSource(svc *types.ExternalService, cf *httpcli.Factory) (*PhabricatorSource, error)](#NewPhabricatorSource)
        * [func (s *PhabricatorSource) ExternalServices() types.ExternalServices](#PhabricatorSource.ExternalServices)
        * [func (s *PhabricatorSource) ListRepos(ctx context.Context, results chan SourceResult)](#PhabricatorSource.ListRepos)
        * [func (s *PhabricatorSource) client(ctx context.Context) (*phabricator.Client, error)](#PhabricatorSource.client)
        * [func (s *PhabricatorSource) makeRepo(repo *phabricator.Repo) (*types.Repo, error)](#PhabricatorSource.makeRepo)
    * [type RateLimitSyncer struct](#RateLimitSyncer)
        * [func NewRateLimitSyncer(registry *ratelimit.Registry, serviceLister externalServiceLister) *RateLimitSyncer](#NewRateLimitSyncer)
        * [func (r *RateLimitSyncer) SyncRateLimiters(ctx context.Context) error](#RateLimitSyncer.SyncRateLimiters)
    * [type RunOptions struct](#RunOptions)
    * [type ScopeCache interface](#ScopeCache)
    * [type Source interface](#Source)
        * [func NewSource(svc *types.ExternalService, cf *httpcli.Factory) (Source, error)](#NewSource)
    * [type SourceError struct](#SourceError)
        * [func (s *SourceError) Cause() error](#SourceError.Cause)
        * [func (s *SourceError) Error() string](#SourceError.Error)
    * [type SourceMetrics struct](#SourceMetrics)
        * [func NewSourceMetrics() SourceMetrics](#NewSourceMetrics)
        * [func (sm SourceMetrics) MustRegister(r prometheus.Registerer)](#SourceMetrics.MustRegister)
    * [type SourceResult struct](#SourceResult)
    * [type Sourcer func(...*github.com/sourcegraph/sourcegraph/internal/types.ExternalService) (github.com/sourcegraph/sourcegraph/internal/repos.Sources, error)](#Sourcer)
        * [func NewFakeSourcer(err error, srcs ...Source) Sourcer](#NewFakeSourcer)
        * [func NewSourcer(cf *httpcli.Factory, decs ...func(Source) Source) Sourcer](#NewSourcer)
    * [type Sources []repos.Source](#Sources)
        * [func (srcs Sources) ExternalServices() types.ExternalServices](#Sources.ExternalServices)
        * [func (srcs Sources) ListRepos(ctx context.Context, results chan SourceResult)](#Sources.ListRepos)
        * [func (srcs Sources) Sources() []Source](#Sources.Sources)
    * [type StatusMessage struct](#StatusMessage)
    * [type Store struct](#Store)
        * [func NewStore(db dbutil.DB, txOpts sql.TxOptions) *Store](#NewStore)
        * [func (s *Store) CountUserAddedRepos(ctx context.Context) (count uint64, err error)](#Store.CountUserAddedRepos)
        * [func (s *Store) Done(err error) error](#Store.Done)
        * [func (s *Store) EnqueueSingleSyncJob(ctx context.Context, id int64) (err error)](#Store.EnqueueSingleSyncJob)
        * [func (s *Store) EnqueueSyncJobs(ctx context.Context, isCloud bool) (err error)](#Store.EnqueueSyncJobs)
        * [func (s *Store) ListExternalRepoSpecs(ctx context.Context) (ids map[api.ExternalRepoSpec]struct{}, err error)](#Store.ListExternalRepoSpecs)
        * [func (s *Store) ListSyncJobs(ctx context.Context) ([]SyncJob, error)](#Store.ListSyncJobs)
        * [func (s *Store) SetClonedRepos(ctx context.Context, repoNames ...string) (err error)](#Store.SetClonedRepos)
        * [func (s *Store) Transact(ctx context.Context) (stx *Store, err error)](#Store.Transact)
        * [func (s *Store) UpsertRepos(ctx context.Context, repos ...*types.Repo) (err error)](#Store.UpsertRepos)
        * [func (s *Store) UpsertSources(ctx context.Context, inserts, updates, deletes map[api.RepoID][]types.SourceInfo) (err error)](#Store.UpsertSources)
        * [func (s *Store) With(other basestore.ShareableStore) *Store](#Store.With)
        * [func (s *Store) list(ctx context.Context, q *sqlf.Query, scan scanFunc) (last, count int64, err error)](#Store.list)
        * [func (s *Store) paginate(ctx context.Context, limit, perPage int64, cursor int64, q paginatedQuery, scan scanFunc) (err error)](#Store.paginate)
        * [func (s *Store) trace(ctx context.Context, family string) (*trace.Trace, context.Context)](#Store.trace)
    * [type StoreMetrics struct](#StoreMetrics)
        * [func NewStoreMetrics() StoreMetrics](#NewStoreMetrics)
        * [func (sm StoreMetrics) MustRegister(r prometheus.Registerer)](#StoreMetrics.MustRegister)
    * [type SyncError struct](#SyncError)
    * [type SyncJob struct](#SyncJob)
        * [func (s *SyncJob) RecordID() int](#SyncJob.RecordID)
    * [type SyncWorkerOptions struct](#SyncWorkerOptions)
    * [type Syncer struct](#Syncer)
        * [func (s *Syncer) Run(ctx context.Context, db *sql.DB, store *Store, opts RunOptions) error](#Syncer.Run)
        * [func (s *Syncer) SyncExternalService(ctx context.Context, tx *Store, externalServiceID int64, minSyncInterval time.Duration) (err error)](#Syncer.SyncExternalService)
        * [func (s *Syncer) SyncRepo(ctx context.Context, store *Store, sourcedRepo *types.Repo) (err error)](#Syncer.SyncRepo)
        * [func (s *Syncer) TriggerExternalServiceSync(ctx context.Context, id int64) error](#Syncer.TriggerExternalServiceSync)
        * [func (s *Syncer) initialUnmodifiedDiffFromStore(ctx context.Context, store *Store)](#Syncer.initialUnmodifiedDiffFromStore)
        * [func (s *Syncer) insertIfNew(ctx context.Context, store *Store, publicOnly bool, sourcedRepo *types.Repo) (err error)](#Syncer.insertIfNew)
        * [func (s *Syncer) makeNewRepoInserter(ctx context.Context, store *Store, publicOnly bool) (func(*types.Repo) error, error)](#Syncer.makeNewRepoInserter)
        * [func (s *Syncer) observe(ctx context.Context, family, title string) (context.Context, func(*Diff, *error))](#Syncer.observe)
        * [func (s *Syncer) sourceDiff(repoID api.RepoID, diff *sourceDiff, oldSources, newSources map[string]*types.SourceInfo)](#Syncer.sourceDiff)
        * [func (s *Syncer) sourced(ctx context.Context, svc *types.ExternalService, onSourced ...func(*types.Repo) error) ([]*types.Repo, error)](#Syncer.sourced)
        * [func (s *Syncer) sourcesUpserts(diff *Diff, stored []*types.Repo) *sourceDiff](#Syncer.sourcesUpserts)
        * [func (s *Syncer) syncRepo(ctx context.Context, store *Store, insertOnly bool, publicOnly bool, sourcedRepo *types.Repo) (diff Diff, err error)](#Syncer.syncRepo)
        * [func (s *Syncer) upserts(diff Diff) []*types.Repo](#Syncer.upserts)
    * [type UnsupportedAuthenticatorError struct](#UnsupportedAuthenticatorError)
        * [func newUnsupportedAuthenticatorError(source string, a auth.Authenticator) UnsupportedAuthenticatorError](#newUnsupportedAuthenticatorError)
        * [func (e UnsupportedAuthenticatorError) Error() string](#UnsupportedAuthenticatorError.Error)
    * [type UserSource interface](#UserSource)
    * [type configuredRepo struct](#configuredRepo)
        * [func configuredRepoFromRepo(r *types.Repo) configuredRepo](#configuredRepoFromRepo)
    * [type excludeBuilder struct](#excludeBuilder)
        * [func (e *excludeBuilder) Build() (excludeFunc, error)](#excludeBuilder.Build)
        * [func (e *excludeBuilder) Exact(name string)](#excludeBuilder.Exact)
        * [func (e *excludeBuilder) Pattern(pattern string)](#excludeBuilder.Pattern)
    * [type excludeFunc func(string) bool](#excludeFunc)
    * [type externalServiceLister interface](#externalServiceLister)
    * [type externalServiceRepo struct](#externalServiceRepo)
    * [type githubResult struct](#githubResult)
    * [type multiSource interface](#multiSource)
    * [type observedSource struct](#observedSource)
        * [func (o *observedSource) ListRepos(ctx context.Context, results chan SourceResult)](#observedSource.ListRepos)
    * [type paginatedQuery func(cursor int64, limit int64) *github.com/keegancsmith/sqlf.Query](#paginatedQuery)
    * [type priority int](#priority)
    * [type recording struct](#recording)
        * [func startRecording() (*recording, func())](#startRecording)
    * [type repoRecord struct](#repoRecord)
        * [func newRepoRecord(r *types.Repo) (*repoRecord, error)](#newRepoRecord)
    * [type repoUpdate struct](#repoUpdate)
    * [type repositoryPager func(page int) (repos []*github.com/sourcegraph/sourcegraph/internal/extsvc/github.Repository, hasNext bool, cost int, err error)](#repositoryPager)
    * [type scanFunc func(github.com/sourcegraph/sourcegraph/internal/repos.scanner) (last int64, count int64, err error)](#scanFunc)
    * [type scanner interface](#scanner)
    * [type schedule struct](#schedule)
        * [func (s *schedule) Len() int](#schedule.Len)
        * [func (s *schedule) Less(i, j int) bool](#schedule.Less)
        * [func (s *schedule) Pop() interface{}](#schedule.Pop)
        * [func (s *schedule) Push(x interface{})](#schedule.Push)
        * [func (s *schedule) Swap(i, j int)](#schedule.Swap)
        * [func (s *schedule) getCurrentInterval(repo configuredRepo) (time.Duration, bool)](#schedule.getCurrentInterval)
        * [func (s *schedule) insertNew(repos []types.RepoName)](#schedule.insertNew)
        * [func (s *schedule) remove(repo configuredRepo) (removed bool)](#schedule.remove)
        * [func (s *schedule) rescheduleTimer()](#schedule.rescheduleTimer)
        * [func (s *schedule) reset()](#schedule.reset)
        * [func (s *schedule) setCloned(names []string)](#schedule.setCloned)
        * [func (s *schedule) updateInterval(repo configuredRepo, interval time.Duration)](#schedule.updateInterval)
        * [func (s *schedule) upsert(repo configuredRepo) (updated bool)](#schedule.upsert)
    * [type scheduledRepoUpdate struct](#scheduledRepoUpdate)
    * [type schedulerConfig struct](#schedulerConfig)
    * [type sourceDiff struct](#sourceDiff)
    * [type stubBadHTTPRedirectTransport struct](#stubBadHTTPRedirectTransport)
        * [func (t stubBadHTTPRedirectTransport) RoundTrip(r *http.Request) (*http.Response, error)](#stubBadHTTPRedirectTransport.RoundTrip)
        * [func (stubBadHTTPRedirectTransport) UnwrappableTransport()](#stubBadHTTPRedirectTransport.UnwrappableTransport)
    * [type syncHandler struct](#syncHandler)
        * [func (s *syncHandler) Handle(ctx context.Context, tx dbworkerstore.Store, record workerutil.Record) (err error)](#syncHandler.Handle)
    * [type updateQueue struct](#updateQueue)
        * [func (q *updateQueue) Len() int](#updateQueue.Len)
        * [func (q *updateQueue) Less(i, j int) bool](#updateQueue.Less)
        * [func (q *updateQueue) Pop() interface{}](#updateQueue.Pop)
        * [func (q *updateQueue) Push(x interface{})](#updateQueue.Push)
        * [func (q *updateQueue) Swap(i, j int)](#updateQueue.Swap)
        * [func (q *updateQueue) acquireNext() (configuredRepo, bool)](#updateQueue.acquireNext)
        * [func (q *updateQueue) enqueue(repo configuredRepo, p priority) (updated bool)](#updateQueue.enqueue)
        * [func (q *updateQueue) nextSeq() uint64](#updateQueue.nextSeq)
        * [func (q *updateQueue) remove(repo configuredRepo, updating bool) (removed bool)](#updateQueue.remove)
        * [func (q *updateQueue) reset()](#updateQueue.reset)
    * [type updateScheduler struct](#updateScheduler)
        * [func NewUpdateScheduler() *updateScheduler](#NewUpdateScheduler)
        * [func (s *updateScheduler) DebugDump(ctx context.Context, db dbutil.DB) interface{}](#updateScheduler.DebugDump)
        * [func (s *updateScheduler) EnsureScheduled(repos []types.RepoName)](#updateScheduler.EnsureScheduled)
        * [func (s *updateScheduler) ScheduleInfo(id api.RepoID) *protocol.RepoUpdateSchedulerInfoResult](#updateScheduler.ScheduleInfo)
        * [func (s *updateScheduler) SetCloned(names []string)](#updateScheduler.SetCloned)
        * [func (s *updateScheduler) UpdateFromDiff(diff Diff)](#updateScheduler.UpdateFromDiff)
        * [func (s *updateScheduler) UpdateOnce(id api.RepoID, name api.RepoName)](#updateScheduler.UpdateOnce)
        * [func (s *updateScheduler) remove(r *types.Repo)](#updateScheduler.remove)
        * [func (s *updateScheduler) runSchedule()](#updateScheduler.runSchedule)
        * [func (s *updateScheduler) runScheduleLoop(ctx context.Context)](#updateScheduler.runScheduleLoop)
        * [func (s *updateScheduler) runUpdateLoop(ctx context.Context)](#updateScheduler.runUpdateLoop)
        * [func (s *updateScheduler) upsert(r *types.Repo, enqueue bool)](#updateScheduler.upsert)
* [Functions](#func)
    * [func CloneURL(kind, config string, repo *types.Repo) (string, error)](#CloneURL)
    * [func ConfRepoConcurrentExternalServiceSyncers() int](#ConfRepoConcurrentExternalServiceSyncers)
    * [func ConfRepoListUpdateInterval() time.Duration](#ConfRepoListUpdateInterval)
    * [func FetchStatusMessages(ctx context.Context, db dbutil.DB, u *types.User, cloud bool) ([]StatusMessage, error)](#FetchStatusMessages)
    * [func GrantedScopes(ctx context.Context, cache ScopeCache, svc *types.ExternalService) ([]string, error)](#GrantedScopes)
    * [func MustRegisterMetrics(db dbutil.DB, sourcegraphDotCom bool)](#MustRegisterMetrics)
    * [func NewSyncWorker(ctx context.Context, db dbutil.DB, handler dbworker.Handler, opts SyncWorkerOptions) (*workerutil.Worker, *dbworker.Resetter)](#NewSyncWorker)
    * [func ObservedSource(l logging.ErrorLogger, m SourceMetrics) func(Source) Source](#ObservedSource)
    * [func RunPhabricatorRepositorySyncWorker(ctx context.Context, s *Store)](#RunPhabricatorRepositorySyncWorker)
    * [func RunRepositoryPurgeWorker(ctx context.Context)](#RunRepositoryPurgeWorker)
    * [func RunScheduler(ctx context.Context, scheduler *updateScheduler)](#RunScheduler)
    * [func TestAWSCodeCloneURLs(t *testing.T)](#TestAWSCodeCloneURLs)
    * [func TestAWSCodeCommitSource_Exclude(t *testing.T)](#TestAWSCodeCommitSource_Exclude)
    * [func TestBitbucketCloudCloneURLs(t *testing.T)](#TestBitbucketCloudCloneURLs)
    * [func TestBitbucketCloudSource_Exclude(t *testing.T)](#TestBitbucketCloudSource_Exclude)
    * [func TestBitbucketCloudSource_ListRepos(t *testing.T)](#TestBitbucketCloudSource_ListRepos)
    * [func TestBitbucketCloudSource_makeRepo(t *testing.T)](#TestBitbucketCloudSource_makeRepo)
    * [func TestBitbucketServerCloneURLs(t *testing.T)](#TestBitbucketServerCloneURLs)
    * [func TestBitbucketServerSource_Exclude(t *testing.T)](#TestBitbucketServerSource_Exclude)
    * [func TestBitbucketServerSource_MakeRepo(t *testing.T)](#TestBitbucketServerSource_MakeRepo)
    * [func TestBitbucketServerSource_WithAuthenticator(t *testing.T)](#TestBitbucketServerSource_WithAuthenticator)
    * [func TestExampleRepositoryQuerySplit(t *testing.T)](#TestExampleRepositoryQuerySplit)
    * [func TestGetCustomInterval(t *testing.T)](#TestGetCustomInterval)
    * [func TestGitHubCloneURLs(t *testing.T)](#TestGitHubCloneURLs)
    * [func TestGitLabCloneURLs(t *testing.T)](#TestGitLabCloneURLs)
    * [func TestGitLabSource_GetRepo(t *testing.T)](#TestGitLabSource_GetRepo)
    * [func TestGitLabSource_WithAuthenticator(t *testing.T)](#TestGitLabSource_WithAuthenticator)
    * [func TestGitLabSource_makeRepo(t *testing.T)](#TestGitLabSource_makeRepo)
    * [func TestGithubSource_GetRepo(t *testing.T)](#TestGithubSource_GetRepo)
    * [func TestGithubSource_ListRepos(t *testing.T)](#TestGithubSource_ListRepos)
    * [func TestGithubSource_WithAuthenticator(t *testing.T)](#TestGithubSource_WithAuthenticator)
    * [func TestGithubSource_excludes_disabledAndLocked(t *testing.T)](#TestGithubSource_excludes_disabledAndLocked)
    * [func TestGithubSource_makeRepo(t *testing.T)](#TestGithubSource_makeRepo)
    * [func TestGrantedScopes(t *testing.T)](#TestGrantedScopes)
    * [func TestHashToken(t *testing.T)](#TestHashToken)
    * [func TestIsSaturdayNight(t *testing.T)](#TestIsSaturdayNight)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestMatchOrg(t *testing.T)](#TestMatchOrg)
    * [func TestNewSourcer(t *testing.T)](#TestNewSourcer)
    * [func TestPerforceCloneURL(t *testing.T)](#TestPerforceCloneURL)
    * [func TestPerforceSource_ListRepos(t *testing.T)](#TestPerforceSource_ListRepos)
    * [func TestPerforceSource_makeRepo(t *testing.T)](#TestPerforceSource_makeRepo)
    * [func TestPhabricatorCloneURL(t *testing.T)](#TestPhabricatorCloneURL)
    * [func TestPick(t *testing.T)](#TestPick)
    * [func TestProjectQueryToURL(t *testing.T)](#TestProjectQueryToURL)
    * [func TestReposNamesSummary(t *testing.T)](#TestReposNamesSummary)
    * [func TestScheduleInsertNew(t *testing.T)](#TestScheduleInsertNew)
    * [func TestSchedule_remove(t *testing.T)](#TestSchedule_remove)
    * [func TestSchedule_updateInterval(t *testing.T)](#TestSchedule_updateInterval)
    * [func TestSchedule_upsert(t *testing.T)](#TestSchedule_upsert)
    * [func TestSetUserinfoBestEffort(t *testing.T)](#TestSetUserinfoBestEffort)
    * [func TestSources_ListRepos(t *testing.T)](#TestSources_ListRepos)
    * [func TestSrcExpose(t *testing.T)](#TestSrcExpose)
    * [func TestStatusMessages(t *testing.T)](#TestStatusMessages)
    * [func TestSyncRateLimiters(t *testing.T)](#TestSyncRateLimiters)
    * [func TestUpdateQueue_acquireNext(t *testing.T)](#TestUpdateQueue_acquireNext)
    * [func TestUpdateQueue_enqueue(t *testing.T)](#TestUpdateQueue_enqueue)
    * [func TestUpdateQueue_remove(t *testing.T)](#TestUpdateQueue_remove)
    * [func TestUpdateQueue_setCloned(t *testing.T)](#TestUpdateQueue_setCloned)
    * [func TestUpdateScheduler_runSchedule(t *testing.T)](#TestUpdateScheduler_runSchedule)
    * [func TestUpdateScheduler_runUpdateLoop(t *testing.T)](#TestUpdateScheduler_runUpdateLoop)
    * [func Test_updateQueue_Less(t *testing.T)](#Test_updateQueue_Less)
    * [func Test_updateScheduler_UpdateFromDiff(t *testing.T)](#Test_updateScheduler_UpdateFromDiff)
    * [func awsCodeCloneURL(repo *awscodecommit.Repository, cfg *schema.AWSCodeCommitConnection) string](#awsCodeCloneURL)
    * [func batchReposQuery(fmtstr string, repos []*types.Repo) (_ *sqlf.Query, err error)](#batchReposQuery)
    * [func bitbucketCloudCloneURL(repo *bitbucketcloud.Repo, cfg *schema.BitbucketCloudConnection) string](#bitbucketCloudCloneURL)
    * [func bitbucketServerCloneURL(repo *bitbucketserver.Repo, cfg *schema.BitbucketServerConnection) string](#bitbucketServerCloneURL)
    * [func calcSyncInterval(now time.Time, lastSync time.Time, minSyncInterval time.Duration, diff Diff) time.Duration](#calcSyncInterval)
    * [func closeErr(c io.Closer, err *error)](#closeErr)
    * [func composePerforceCloneURL(host, depot string) string](#composePerforceCloneURL)
    * [func exampleRepositoryQuerySplit(q string) string](#exampleRepositoryQuerySplit)
    * [func getAWSEnv(envVar string) string](#getAWSEnv)
    * [func getCustomInterval(c *conf.Unified, repoName string) time.Duration](#getCustomInterval)
    * [func getRepoNoun(count int) string](#getRepoNoun)
    * [func githubCloneURL(repo *github.Repository, cfg *schema.GitHubConnection) (string, error)](#githubCloneURL)
    * [func githubGraphQLFailureMiddleware(cli httpcli.Doer) httpcli.Doer](#githubGraphQLFailureMiddleware)
    * [func gitlabCloneURL(repo *gitlab.Project, cfg *schema.GitLabConnection) string](#gitlabCloneURL)
    * [func gitserverRedirectMiddleware(cli httpcli.Doer) httpcli.Doer](#gitserverRedirectMiddleware)
    * [func group(srcs []Source) map[string]Sources](#group)
    * [func hashToken(token string) (string, error)](#hashToken)
    * [func init()](#init.scheduler_test.go)
    * [func isSaturdayNight(t time.Time) bool](#isSaturdayNight)
    * [func limitedRedirect(r *http.Request, via []*http.Request) error](#limitedRedirect)
    * [func listAll(ctx context.Context, src Source, onSourced ...func(*types.Repo) error) ([]*types.Repo, error)](#listAll)
    * [func marshalJSON(t testing.TB, v interface{}) string](#marshalJSON)
    * [func matchOrg(q string) string](#matchOrg)
    * [func merge(o, n *types.Repo)](#merge)
    * [func metadataColumn(metadata interface{}) (msg json.RawMessage, err error)](#metadataColumn)
    * [func mockTime(t time.Time)](#mockTime)
    * [func newClientFactory(t testing.TB, name string, mws ...httpcli.Middleware) (*httpcli.Factory, func(testing.TB))](#newClientFactory)
    * [func newRecorder(t testing.TB, file string, record bool) *recorder.Recorder](#newRecorder)
    * [func newResetterMetrics(r prometheus.Registerer) dbworker.ResetterMetrics](#newResetterMetrics)
    * [func newWorkerMetrics(r prometheus.Registerer) workerutil.WorkerMetrics](#newWorkerMetrics)
    * [func nullStringColumn(s string) *string](#nullStringColumn)
    * [func nullTimeColumn(t time.Time) *time.Time](#nullTimeColumn)
    * [func otherCloneURL(repo *types.Repo, m *extsvc.OtherRepoMetadata) string](#otherCloneURL)
    * [func otherRepoCloneURL(base *url.URL, repo string) (*url.URL, error)](#otherRepoCloneURL)
    * [func perforceCloneURL(depot *perforce.Depot, cfg *schema.PerforceConnection) string](#perforceCloneURL)
    * [func phabricatorCloneURL(repo *phabricator.Repo, _ *schema.PhabricatorConnection) string](#phabricatorCloneURL)
    * [func pick(a *types.Repo, b *types.Repo) (keep, discard *types.Repo)](#pick)
    * [func projectQueryToURL(projectQuery string, perPage int) (string, error)](#projectQueryToURL)
    * [func purge(ctx context.Context, log log15.Logger) error](#purge)
    * [func randSleep(d, jitter time.Duration)](#randSleep)
    * [func resolveNameConflicts(diff *Diff, conflicting types.Repos)](#resolveNameConflicts)
    * [func runJobCleaner(ctx context.Context, db dbutil.DB, interval time.Duration)](#runJobCleaner)
    * [func save(t testing.TB, rec *recorder.Recorder)](#save)
    * [func scanAll(rows *sql.Rows, scan scanFunc) (last, count int64, err error)](#scanAll)
    * [func scanJobs(rows *sql.Rows) ([]SyncJob, error)](#scanJobs)
    * [func scanSingleJob(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#scanSingleJob)
    * [func setUserinfoBestEffort(rawurl, username, password string) string](#setUserinfoBestEffort)
    * [func setupInitialQueue(s *updateScheduler, initialQueue []*repoUpdate)](#setupInitialQueue)
    * [func setupInitialSchedule(s *updateScheduler, initialSchedule []*scheduledRepoUpdate)](#setupInitialSchedule)
    * [func sleep(ctx context.Context, d time.Duration)](#sleep)
    * [func sourceErrorFormatFunc(es []error) string](#sourceErrorFormatFunc)
    * [func sourcesColumn(repoID api.RepoID, sources map[string]*types.SourceInfo) (json.RawMessage, error)](#sourcesColumn)
    * [func timePtr(t time.Time) *time.Time](#timePtr)
    * [func update(name string) bool](#update)
    * [func updatePhabRepos(ctx context.Context, repos []*types.Repo) error](#updatePhabRepos)
    * [func verifyQueue(t *testing.T, s *updateScheduler, expected []*repoUpdate)](#verifyQueue)
    * [func verifyRecording(t *testing.T, s *updateScheduler, timeAfterFuncDelays []time.Duration, expectedNotifications func(s *updateScheduler) []chan struct{}, r *recording)](#verifyRecording)
    * [func verifySchedule(t *testing.T, s *updateScheduler, expected []*scheduledRepoUpdate)](#verifySchedule)
    * [func verifyScheduleRecording(t *testing.T, s *updateScheduler, timeAfterFuncDelays []time.Duration, wakeupNotifications int, r *recording)](#verifyScheduleRecording)
    * [func wrapWithoutRedirect(c *http.Client)](#wrapWithoutRedirect)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="CountTotalUserAddedReposQueryFmtstr" href="#CountTotalUserAddedReposQueryFmtstr">const CountTotalUserAddedReposQueryFmtstr</a>

```
searchKey: repos.CountTotalUserAddedReposQueryFmtstr
tags: [constant string]
```

```Go
const CountTotalUserAddedReposQueryFmtstr = ...
```

### <a id="batchReposQueryFmtstr" href="#batchReposQueryFmtstr">const batchReposQueryFmtstr</a>

```
searchKey: repos.batchReposQueryFmtstr
tags: [constant string private]
```

```Go
const batchReposQueryFmtstr = ...
```

### <a id="enqueueSyncJobsQueryFmtstr" href="#enqueueSyncJobsQueryFmtstr">const enqueueSyncJobsQueryFmtstr</a>

```
searchKey: repos.enqueueSyncJobsQueryFmtstr
tags: [constant string private]
```

```Go
const enqueueSyncJobsQueryFmtstr = ...
```

We ignore Phabricator repos here as they are currently synced using RunPhabricatorRepositorySyncWorker 

### <a id="maxDelay" href="#maxDelay">const maxDelay</a>

```
searchKey: repos.maxDelay
tags: [constant number private]
```

```Go
const maxDelay = 8 * time.Hour
```

maxDelay is the maximum amount of time between scheduled updates for a single repository. 

### <a id="minDelay" href="#minDelay">const minDelay</a>

```
searchKey: repos.minDelay
tags: [constant number private]
```

```Go
const minDelay = 45 * time.Second
```

minDelay is the minimum amount of time between scheduled updates for a single repository. 

### <a id="notifyChanBuffer" href="#notifyChanBuffer">const notifyChanBuffer</a>

```
searchKey: repos.notifyChanBuffer
tags: [constant number private]
```

```Go
const notifyChanBuffer = 1
```

notifyChanBuffer controls the buffer size of notification channels. It is important that this value is 1 so that we can perform lossless non-blocking sends. 

### <a id="priorityHigh" href="#priorityHigh">const priorityHigh</a>

```
searchKey: repos.priorityHigh
tags: [constant number private]
```

```Go
const priorityHigh
```

### <a id="priorityLow" href="#priorityLow">const priorityLow</a>

```
searchKey: repos.priorityLow
tags: [constant number private]
```

```Go
const priorityLow priority = iota
```

### <a id="setClonedReposQueryFmtstr" href="#setClonedReposQueryFmtstr">const setClonedReposQueryFmtstr</a>

```
searchKey: repos.setClonedReposQueryFmtstr
tags: [constant string private]
```

```Go
const setClonedReposQueryFmtstr = ...
```

### <a id="stubBadHTTPRedirectLocation" href="#stubBadHTTPRedirectLocation">const stubBadHTTPRedirectLocation</a>

```
searchKey: repos.stubBadHTTPRedirectLocation
tags: [constant string private]
```

```Go
const stubBadHTTPRedirectLocation = `https://amazonaws.com/badhttpredirectlocation`
```

### <a id="tagFamily" href="#tagFamily">const tagFamily</a>

```
searchKey: repos.tagFamily
tags: [constant string private]
```

```Go
const tagFamily = "family"
```

### <a id="tagID" href="#tagID">const tagID</a>

```
searchKey: repos.tagID
tags: [constant string private]
```

```Go
const tagID = "id"
```

### <a id="tagState" href="#tagState">const tagState</a>

```
searchKey: repos.tagState
tags: [constant string private]
```

```Go
const tagState = "state"
```

### <a id="tagSuccess" href="#tagSuccess">const tagSuccess</a>

```
searchKey: repos.tagSuccess
tags: [constant string private]
```

```Go
const tagSuccess = "success"
```

### <a id="upsertSourcesFmtstrDeletes" href="#upsertSourcesFmtstrDeletes">const upsertSourcesFmtstrDeletes</a>

```
searchKey: repos.upsertSourcesFmtstrDeletes
tags: [constant string private]
```

```Go
const upsertSourcesFmtstrDeletes = ...
```

### <a id="upsertSourcesFmtstrPrefix" href="#upsertSourcesFmtstrPrefix">const upsertSourcesFmtstrPrefix</a>

```
searchKey: repos.upsertSourcesFmtstrPrefix
tags: [constant string private]
```

```Go
const upsertSourcesFmtstrPrefix = ...
```

### <a id="upsertSourcesFmtstrSuffix" href="#upsertSourcesFmtstrSuffix">const upsertSourcesFmtstrSuffix</a>

```
searchKey: repos.upsertSourcesFmtstrSuffix
tags: [constant string private]
```

```Go
const upsertSourcesFmtstrSuffix = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="MockStatusMessages" href="#MockStatusMessages">var MockStatusMessages</a>

```
searchKey: repos.MockStatusMessages
tags: [variable function]
```

```Go
var MockStatusMessages func(context.Context, *types.User) ([]StatusMessage, error)
```

### <a id="batchDeleteReposQuery" href="#batchDeleteReposQuery">var batchDeleteReposQuery</a>

```
searchKey: repos.batchDeleteReposQuery
tags: [variable string private]
```

```Go
var batchDeleteReposQuery = ...
```

delete is a soft-delete. name is unique and the syncer ensures we respect that constraint. However, the syncer is unaware of soft-deleted repositories. So we update the name to something unique to prevent violating this constraint between active and soft-deleted names. 

### <a id="batchInsertReposQuery" href="#batchInsertReposQuery">var batchInsertReposQuery</a>

```
searchKey: repos.batchInsertReposQuery
tags: [variable string private]
```

```Go
var batchInsertReposQuery = ...
```

### <a id="batchUpdateReposQuery" href="#batchUpdateReposQuery">var batchUpdateReposQuery</a>

```
searchKey: repos.batchUpdateReposQuery
tags: [variable string private]
```

```Go
var batchUpdateReposQuery = ...
```

### <a id="configuredLimiter" href="#configuredLimiter">var configuredLimiter</a>

```
searchKey: repos.configuredLimiter
tags: [variable function private]
```

```Go
var configuredLimiter = ...
```

configuredLimiter returns a mutable limiter that is configured with the maximum number of concurrent update requests that repo-updater should send to gitserver. 

### <a id="defaultTime" href="#defaultTime">var defaultTime</a>

```
searchKey: repos.defaultTime
tags: [variable struct private]
```

```Go
var defaultTime = time.Date(2000, 1, 1, 1, 1, 1, 1, time.UTC)
```

### <a id="githubRatelimitWaitCounter" href="#githubRatelimitWaitCounter">var githubRatelimitWaitCounter</a>

```
searchKey: repos.githubRatelimitWaitCounter
tags: [variable struct private]
```

```Go
var githubRatelimitWaitCounter = ...
```

### <a id="githubRemainingGauge" href="#githubRemainingGauge">var githubRemainingGauge</a>

```
searchKey: repos.githubRemainingGauge
tags: [variable struct private]
```

```Go
var githubRemainingGauge = ...
```

### <a id="gitlabRatelimitWaitCounter" href="#gitlabRatelimitWaitCounter">var gitlabRatelimitWaitCounter</a>

```
searchKey: repos.gitlabRatelimitWaitCounter
tags: [variable struct private]
```

```Go
var gitlabRatelimitWaitCounter = ...
```

### <a id="gitlabRemainingGauge" href="#gitlabRemainingGauge">var gitlabRemainingGauge</a>

```
searchKey: repos.gitlabRemainingGauge
tags: [variable struct private]
```

```Go
var gitlabRemainingGauge = ...
```

### <a id="lastSync" href="#lastSync">var lastSync</a>

```
searchKey: repos.lastSync
tags: [variable struct private]
```

```Go
var lastSync = ...
```

### <a id="listRepoIDsQuery" href="#listRepoIDsQuery">var listRepoIDsQuery</a>

```
searchKey: repos.listRepoIDsQuery
tags: [variable string private]
```

```Go
var listRepoIDsQuery = ...
```

### <a id="notify" href="#notify">var notify</a>

```
searchKey: repos.notify
tags: [variable function private]
```

```Go
var notify = func(ch chan struct{}) {
	select {
	case ch <- struct{}{}:
	default:
	}
}
```

notify performs a non-blocking send on the channel. The channel should be buffered. 

### <a id="phabricatorUpdateTime" href="#phabricatorUpdateTime">var phabricatorUpdateTime</a>

```
searchKey: repos.phabricatorUpdateTime
tags: [variable struct private]
```

```Go
var phabricatorUpdateTime = ...
```

### <a id="purgeFailed" href="#purgeFailed">var purgeFailed</a>

```
searchKey: repos.purgeFailed
tags: [variable interface private]
```

```Go
var purgeFailed = ...
```

### <a id="purgeSuccess" href="#purgeSuccess">var purgeSuccess</a>

```
searchKey: repos.purgeSuccess
tags: [variable interface private]
```

```Go
var purgeSuccess = ...
```

### <a id="regOrg" href="#regOrg">var regOrg</a>

```
searchKey: repos.regOrg
tags: [variable struct private]
```

```Go
var regOrg = lazyregexp.New(`^org:([a-zA-Z0-9](?:-?[a-zA-Z0-9]){0,38})$`)
```

regOrg is a regular expression that matches the pattern `org:<org-name>` `<org-name>` follows the GitHub username convention: - only single hyphens and alphanumeric characters allowed. - cannot begin/end with hyphen. - up to 38 characters. 

### <a id="requestRepoUpdate" href="#requestRepoUpdate">var requestRepoUpdate</a>

```
searchKey: repos.requestRepoUpdate
tags: [variable function private]
```

```Go
var requestRepoUpdate = ...
```

requestRepoUpdate sends a request to gitserver to request an update. 

### <a id="schedAutoFetch" href="#schedAutoFetch">var schedAutoFetch</a>

```
searchKey: repos.schedAutoFetch
tags: [variable interface private]
```

```Go
var schedAutoFetch = ...
```

### <a id="schedError" href="#schedError">var schedError</a>

```
searchKey: repos.schedError
tags: [variable interface private]
```

```Go
var schedError = ...
```

### <a id="schedKnownRepos" href="#schedKnownRepos">var schedKnownRepos</a>

```
searchKey: repos.schedKnownRepos
tags: [variable interface private]
```

```Go
var schedKnownRepos = ...
```

### <a id="schedLoops" href="#schedLoops">var schedLoops</a>

```
searchKey: repos.schedLoops
tags: [variable interface private]
```

```Go
var schedLoops = ...
```

### <a id="schedManualFetch" href="#schedManualFetch">var schedManualFetch</a>

```
searchKey: repos.schedManualFetch
tags: [variable interface private]
```

```Go
var schedManualFetch = ...
```

### <a id="schedUpdateQueueLength" href="#schedUpdateQueueLength">var schedUpdateQueueLength</a>

```
searchKey: repos.schedUpdateQueueLength
tags: [variable interface private]
```

```Go
var schedUpdateQueueLength = ...
```

### <a id="schemeOrHostNotEmptyErr" href="#schemeOrHostNotEmptyErr">var schemeOrHostNotEmptyErr</a>

```
searchKey: repos.schemeOrHostNotEmptyErr
tags: [variable interface private]
```

```Go
var schemeOrHostNotEmptyErr = errors.New("scheme and host should be empty")
```

### <a id="syncDuration" href="#syncDuration">var syncDuration</a>

```
searchKey: repos.syncDuration
tags: [variable struct private]
```

```Go
var syncDuration = ...
```

### <a id="syncErrors" href="#syncErrors">var syncErrors</a>

```
searchKey: repos.syncErrors
tags: [variable struct private]
```

```Go
var syncErrors = ...
```

### <a id="syncStarted" href="#syncStarted">var syncStarted</a>

```
searchKey: repos.syncStarted
tags: [variable struct private]
```

```Go
var syncStarted = ...
```

### <a id="syncedTotal" href="#syncedTotal">var syncedTotal</a>

```
searchKey: repos.syncedTotal
tags: [variable struct private]
```

```Go
var syncedTotal = ...
```

### <a id="timeAfterFunc" href="#timeAfterFunc">var timeAfterFunc</a>

```
searchKey: repos.timeAfterFunc
tags: [variable function private]
```

```Go
var timeAfterFunc = time.AfterFunc
```

Mockable time functions for testing. 

### <a id="timeNow" href="#timeNow">var timeNow</a>

```
searchKey: repos.timeNow
tags: [variable function private]
```

```Go
var timeNow = time.Now
```

Mockable time functions for testing. 

### <a id="updateRegex" href="#updateRegex">var updateRegex</a>

```
searchKey: repos.updateRegex
tags: [variable string private]
```

```Go
var updateRegex = flag.String("update", "", "Update testdata of tests matching the given regex")
```

### <a id="upsertSourcesQueryFmtstr" href="#upsertSourcesQueryFmtstr">var upsertSourcesQueryFmtstr</a>

```
searchKey: repos.upsertSourcesQueryFmtstr
tags: [variable string private]
```

```Go
var upsertSourcesQueryFmtstr = upsertSourcesFmtstrPrefix + upsertSourcesFmtstrSuffix
```

### <a id="upsertSourcesWithDeletesQueryFmtstr" href="#upsertSourcesWithDeletesQueryFmtstr">var upsertSourcesWithDeletesQueryFmtstr</a>

```
searchKey: repos.upsertSourcesWithDeletesQueryFmtstr
tags: [variable string private]
```

```Go
var upsertSourcesWithDeletesQueryFmtstr = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="AWSCodeCommitSource" href="#AWSCodeCommitSource">type AWSCodeCommitSource struct</a>

```
searchKey: repos.AWSCodeCommitSource
tags: [struct]
```

```Go
type AWSCodeCommitSource struct {
	svc    *types.ExternalService
	config *schema.AWSCodeCommitConnection

	awsPartition string // "aws", "aws-cn", "aws-us-gov"
	awsRegion    string
	client       *awscodecommit.Client

	exclude excludeFunc
}
```

An AWSCodeCommitSource yields repositories from a single AWS Code Commit connection configured in Sourcegraph via the external services configuration. 

#### <a id="NewAWSCodeCommitSource" href="#NewAWSCodeCommitSource">func NewAWSCodeCommitSource(svc *types.ExternalService, cf *httpcli.Factory) (*AWSCodeCommitSource, error)</a>

```
searchKey: repos.NewAWSCodeCommitSource
tags: [method]
```

```Go
func NewAWSCodeCommitSource(svc *types.ExternalService, cf *httpcli.Factory) (*AWSCodeCommitSource, error)
```

NewAWSCodeCommitSource returns a new AWSCodeCommitSource from the given external service. 

#### <a id="newAWSCodeCommitSource" href="#newAWSCodeCommitSource">func newAWSCodeCommitSource(svc *types.ExternalService, c *schema.AWSCodeCommitConnection, cf *httpcli.Factory) (*AWSCodeCommitSource, error)</a>

```
searchKey: repos.newAWSCodeCommitSource
tags: [method private]
```

```Go
func newAWSCodeCommitSource(svc *types.ExternalService, c *schema.AWSCodeCommitConnection, cf *httpcli.Factory) (*AWSCodeCommitSource, error)
```

#### <a id="AWSCodeCommitSource.ExternalServices" href="#AWSCodeCommitSource.ExternalServices">func (s *AWSCodeCommitSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.AWSCodeCommitSource.ExternalServices
tags: [function]
```

```Go
func (s *AWSCodeCommitSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="AWSCodeCommitSource.ListRepos" href="#AWSCodeCommitSource.ListRepos">func (s *AWSCodeCommitSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.AWSCodeCommitSource.ListRepos
tags: [method]
```

```Go
func (s *AWSCodeCommitSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns all AWS Code Commit repositories accessible to all connections configured in Sourcegraph via the external services configuration. 

#### <a id="AWSCodeCommitSource.excludes" href="#AWSCodeCommitSource.excludes">func (s *AWSCodeCommitSource) excludes(r *awscodecommit.Repository) bool</a>

```
searchKey: repos.AWSCodeCommitSource.excludes
tags: [method private]
```

```Go
func (s *AWSCodeCommitSource) excludes(r *awscodecommit.Repository) bool
```

#### <a id="AWSCodeCommitSource.listAllRepositories" href="#AWSCodeCommitSource.listAllRepositories">func (s *AWSCodeCommitSource) listAllRepositories(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.AWSCodeCommitSource.listAllRepositories
tags: [method private]
```

```Go
func (s *AWSCodeCommitSource) listAllRepositories(ctx context.Context, results chan SourceResult)
```

#### <a id="AWSCodeCommitSource.makeRepo" href="#AWSCodeCommitSource.makeRepo">func (s *AWSCodeCommitSource) makeRepo(r *awscodecommit.Repository) (*types.Repo, error)</a>

```
searchKey: repos.AWSCodeCommitSource.makeRepo
tags: [method private]
```

```Go
func (s *AWSCodeCommitSource) makeRepo(r *awscodecommit.Repository) (*types.Repo, error)
```

### <a id="AffiliatedRepositorySource" href="#AffiliatedRepositorySource">type AffiliatedRepositorySource interface</a>

```
searchKey: repos.AffiliatedRepositorySource
tags: [interface]
```

```Go
type AffiliatedRepositorySource interface {
	AffiliatedRepositories(ctx context.Context) ([]types.CodeHostRepository, error)
}
```

### <a id="BitbucketCloudSource" href="#BitbucketCloudSource">type BitbucketCloudSource struct</a>

```
searchKey: repos.BitbucketCloudSource
tags: [struct]
```

```Go
type BitbucketCloudSource struct {
	svc     *types.ExternalService
	config  *schema.BitbucketCloudConnection
	exclude excludeFunc
	client  *bitbucketcloud.Client
}
```

A BitbucketCloudSource yields repositories from a single BitbucketCloud connection configured in Sourcegraph via the external services configuration. 

#### <a id="NewBitbucketCloudSource" href="#NewBitbucketCloudSource">func NewBitbucketCloudSource(svc *types.ExternalService, cf *httpcli.Factory) (*BitbucketCloudSource, error)</a>

```
searchKey: repos.NewBitbucketCloudSource
tags: [method]
```

```Go
func NewBitbucketCloudSource(svc *types.ExternalService, cf *httpcli.Factory) (*BitbucketCloudSource, error)
```

NewBitbucketCloudSource returns a new BitbucketCloudSource from the given external service. 

#### <a id="newBitbucketCloudSource" href="#newBitbucketCloudSource">func newBitbucketCloudSource(svc *types.ExternalService, c *schema.BitbucketCloudConnection, cf *httpcli.Factory) (*BitbucketCloudSource, error)</a>

```
searchKey: repos.newBitbucketCloudSource
tags: [method private]
```

```Go
func newBitbucketCloudSource(svc *types.ExternalService, c *schema.BitbucketCloudConnection, cf *httpcli.Factory) (*BitbucketCloudSource, error)
```

#### <a id="BitbucketCloudSource.ExternalServices" href="#BitbucketCloudSource.ExternalServices">func (s BitbucketCloudSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.BitbucketCloudSource.ExternalServices
tags: [function]
```

```Go
func (s BitbucketCloudSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="BitbucketCloudSource.ListRepos" href="#BitbucketCloudSource.ListRepos">func (s BitbucketCloudSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.BitbucketCloudSource.ListRepos
tags: [method]
```

```Go
func (s BitbucketCloudSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns all Bitbucket Cloud repositories accessible to all connections configured in Sourcegraph via the external services configuration. 

#### <a id="BitbucketCloudSource.excludes" href="#BitbucketCloudSource.excludes">func (s *BitbucketCloudSource) excludes(r *bitbucketcloud.Repo) bool</a>

```
searchKey: repos.BitbucketCloudSource.excludes
tags: [method private]
```

```Go
func (s *BitbucketCloudSource) excludes(r *bitbucketcloud.Repo) bool
```

#### <a id="BitbucketCloudSource.listAllRepos" href="#BitbucketCloudSource.listAllRepos">func (s *BitbucketCloudSource) listAllRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.BitbucketCloudSource.listAllRepos
tags: [method private]
```

```Go
func (s *BitbucketCloudSource) listAllRepos(ctx context.Context, results chan SourceResult)
```

#### <a id="BitbucketCloudSource.makeRepo" href="#BitbucketCloudSource.makeRepo">func (s BitbucketCloudSource) makeRepo(r *bitbucketcloud.Repo) *types.Repo</a>

```
searchKey: repos.BitbucketCloudSource.makeRepo
tags: [method private]
```

```Go
func (s BitbucketCloudSource) makeRepo(r *bitbucketcloud.Repo) *types.Repo
```

#### <a id="BitbucketCloudSource.remoteURL" href="#BitbucketCloudSource.remoteURL">func (s *BitbucketCloudSource) remoteURL(repo *bitbucketcloud.Repo) string</a>

```
searchKey: repos.BitbucketCloudSource.remoteURL
tags: [method private]
```

```Go
func (s *BitbucketCloudSource) remoteURL(repo *bitbucketcloud.Repo) string
```

remoteURL returns the repository's Git remote URL 

note: this used to contain credentials but that is no longer the case if you need to get an authenticated clone url use repos.CloneURL 

### <a id="BitbucketServerSource" href="#BitbucketServerSource">type BitbucketServerSource struct</a>

```
searchKey: repos.BitbucketServerSource
tags: [struct]
```

```Go
type BitbucketServerSource struct {
	svc     *types.ExternalService
	config  *schema.BitbucketServerConnection
	exclude excludeFunc
	client  *bitbucketserver.Client
}
```

A BitbucketServerSource yields repositories from a single BitbucketServer connection configured in Sourcegraph via the external services configuration. 

#### <a id="NewBitbucketServerSource" href="#NewBitbucketServerSource">func NewBitbucketServerSource(svc *types.ExternalService, cf *httpcli.Factory) (*BitbucketServerSource, error)</a>

```
searchKey: repos.NewBitbucketServerSource
tags: [method]
```

```Go
func NewBitbucketServerSource(svc *types.ExternalService, cf *httpcli.Factory) (*BitbucketServerSource, error)
```

NewBitbucketServerSource returns a new BitbucketServerSource from the given external service. rl is optional 

#### <a id="newBitbucketServerSource" href="#newBitbucketServerSource">func newBitbucketServerSource(svc *types.ExternalService, c *schema.BitbucketServerConnection, cf *httpcli.Factory) (*BitbucketServerSource, error)</a>

```
searchKey: repos.newBitbucketServerSource
tags: [method private]
```

```Go
func newBitbucketServerSource(svc *types.ExternalService, c *schema.BitbucketServerConnection, cf *httpcli.Factory) (*BitbucketServerSource, error)
```

#### <a id="BitbucketServerSource.AuthenticatedUsername" href="#BitbucketServerSource.AuthenticatedUsername">func (s *BitbucketServerSource) AuthenticatedUsername(ctx context.Context) (string, error)</a>

```
searchKey: repos.BitbucketServerSource.AuthenticatedUsername
tags: [method]
```

```Go
func (s *BitbucketServerSource) AuthenticatedUsername(ctx context.Context) (string, error)
```

AuthenticatedUsername uses the underlying bitbucketserver.Client to get the username belonging to the credentials associated with the BitbucketServerSource. 

#### <a id="BitbucketServerSource.ExternalServices" href="#BitbucketServerSource.ExternalServices">func (s BitbucketServerSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.BitbucketServerSource.ExternalServices
tags: [function]
```

```Go
func (s BitbucketServerSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="BitbucketServerSource.ListRepos" href="#BitbucketServerSource.ListRepos">func (s BitbucketServerSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.BitbucketServerSource.ListRepos
tags: [method]
```

```Go
func (s BitbucketServerSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns all BitbucketServer repositories accessible to all connections configured in Sourcegraph via the external services configuration. 

#### <a id="BitbucketServerSource.ValidateAuthenticator" href="#BitbucketServerSource.ValidateAuthenticator">func (s *BitbucketServerSource) ValidateAuthenticator(ctx context.Context) error</a>

```
searchKey: repos.BitbucketServerSource.ValidateAuthenticator
tags: [method]
```

```Go
func (s *BitbucketServerSource) ValidateAuthenticator(ctx context.Context) error
```

#### <a id="BitbucketServerSource.WithAuthenticator" href="#BitbucketServerSource.WithAuthenticator">func (s BitbucketServerSource) WithAuthenticator(a auth.Authenticator) (Source, error)</a>

```
searchKey: repos.BitbucketServerSource.WithAuthenticator
tags: [method]
```

```Go
func (s BitbucketServerSource) WithAuthenticator(a auth.Authenticator) (Source, error)
```

#### <a id="BitbucketServerSource.excludes" href="#BitbucketServerSource.excludes">func (s *BitbucketServerSource) excludes(r *bitbucketserver.Repo) bool</a>

```
searchKey: repos.BitbucketServerSource.excludes
tags: [method private]
```

```Go
func (s *BitbucketServerSource) excludes(r *bitbucketserver.Repo) bool
```

#### <a id="BitbucketServerSource.listAllLabeledRepos" href="#BitbucketServerSource.listAllLabeledRepos">func (s *BitbucketServerSource) listAllLabeledRepos(ctx context.Context, label string) (map[int]struct{}, error)</a>

```
searchKey: repos.BitbucketServerSource.listAllLabeledRepos
tags: [method private]
```

```Go
func (s *BitbucketServerSource) listAllLabeledRepos(ctx context.Context, label string) (map[int]struct{}, error)
```

#### <a id="BitbucketServerSource.listAllRepos" href="#BitbucketServerSource.listAllRepos">func (s *BitbucketServerSource) listAllRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.BitbucketServerSource.listAllRepos
tags: [method private]
```

```Go
func (s *BitbucketServerSource) listAllRepos(ctx context.Context, results chan SourceResult)
```

#### <a id="BitbucketServerSource.makeRepo" href="#BitbucketServerSource.makeRepo">func (s BitbucketServerSource) makeRepo(repo *bitbucketserver.Repo, isArchived bool) *types.Repo</a>

```
searchKey: repos.BitbucketServerSource.makeRepo
tags: [method private]
```

```Go
func (s BitbucketServerSource) makeRepo(repo *bitbucketserver.Repo, isArchived bool) *types.Repo
```

### <a id="CloningProgress" href="#CloningProgress">type CloningProgress struct</a>

```
searchKey: repos.CloningProgress
tags: [struct]
```

```Go
type CloningProgress struct {
	Message string
}
```

### <a id="Diff" href="#Diff">type Diff struct</a>

```
searchKey: repos.Diff
tags: [struct]
```

```Go
type Diff struct {
	Added      types.Repos
	Deleted    types.Repos
	Modified   types.Repos
	Unmodified types.Repos
}
```

Diff is the difference found by a sync between what is in the store and what is returned from sources. 

#### <a id="NewDiff" href="#NewDiff">func NewDiff(sourced, stored []*types.Repo) (diff Diff)</a>

```
searchKey: repos.NewDiff
tags: [method]
```

```Go
func NewDiff(sourced, stored []*types.Repo) (diff Diff)
```

NewDiff returns a diff from the given sourced and stored repos. 

#### <a id="newDiff" href="#newDiff">func newDiff(svc *types.ExternalService, sourced, stored []*types.Repo) (diff Diff)</a>

```
searchKey: repos.newDiff
tags: [method private]
```

```Go
func newDiff(svc *types.ExternalService, sourced, stored []*types.Repo) (diff Diff)
```

#### <a id="Diff.Repos" href="#Diff.Repos">func (d Diff) Repos() types.Repos</a>

```
searchKey: repos.Diff.Repos
tags: [function]
```

```Go
func (d Diff) Repos() types.Repos
```

Repos returns all repos in the Diff. 

#### <a id="Diff.Sort" href="#Diff.Sort">func (d *Diff) Sort()</a>

```
searchKey: repos.Diff.Sort
tags: [function]
```

```Go
func (d *Diff) Sort()
```

Sort sorts all Diff elements by Repo.IDs. 

### <a id="ErrAccountSuspended" href="#ErrAccountSuspended">type ErrAccountSuspended struct{}</a>

```
searchKey: repos.ErrAccountSuspended
tags: [struct]
```

```Go
type ErrAccountSuspended struct{}
```

#### <a id="ErrAccountSuspended.AccountSuspended" href="#ErrAccountSuspended.AccountSuspended">func (e ErrAccountSuspended) AccountSuspended() bool</a>

```
searchKey: repos.ErrAccountSuspended.AccountSuspended
tags: [function]
```

```Go
func (e ErrAccountSuspended) AccountSuspended() bool
```

#### <a id="ErrAccountSuspended.Error" href="#ErrAccountSuspended.Error">func (e ErrAccountSuspended) Error() string</a>

```
searchKey: repos.ErrAccountSuspended.Error
tags: [function]
```

```Go
func (e ErrAccountSuspended) Error() string
```

### <a id="ErrForbidden" href="#ErrForbidden">type ErrForbidden struct{}</a>

```
searchKey: repos.ErrForbidden
tags: [struct]
```

```Go
type ErrForbidden struct{}
```

#### <a id="ErrForbidden.Error" href="#ErrForbidden.Error">func (e ErrForbidden) Error() string</a>

```
searchKey: repos.ErrForbidden.Error
tags: [function]
```

```Go
func (e ErrForbidden) Error() string
```

#### <a id="ErrForbidden.Forbidden" href="#ErrForbidden.Forbidden">func (e ErrForbidden) Forbidden() bool</a>

```
searchKey: repos.ErrForbidden.Forbidden
tags: [function]
```

```Go
func (e ErrForbidden) Forbidden() bool
```

### <a id="ErrUnauthorized" href="#ErrUnauthorized">type ErrUnauthorized struct{}</a>

```
searchKey: repos.ErrUnauthorized
tags: [struct]
```

```Go
type ErrUnauthorized struct{}
```

#### <a id="ErrUnauthorized.Error" href="#ErrUnauthorized.Error">func (e ErrUnauthorized) Error() string</a>

```
searchKey: repos.ErrUnauthorized.Error
tags: [function]
```

```Go
func (e ErrUnauthorized) Error() string
```

#### <a id="ErrUnauthorized.Unauthorized" href="#ErrUnauthorized.Unauthorized">func (e ErrUnauthorized) Unauthorized() bool</a>

```
searchKey: repos.ErrUnauthorized.Unauthorized
tags: [function]
```

```Go
func (e ErrUnauthorized) Unauthorized() bool
```

### <a id="ExternalServiceSyncError" href="#ExternalServiceSyncError">type ExternalServiceSyncError struct</a>

```
searchKey: repos.ExternalServiceSyncError
tags: [struct]
```

```Go
type ExternalServiceSyncError struct {
	Message           string
	ExternalServiceId int64
}
```

### <a id="FakeSource" href="#FakeSource">type FakeSource struct</a>

```
searchKey: repos.FakeSource
tags: [struct]
```

```Go
type FakeSource struct {
	svc   *types.ExternalService
	repos []*types.Repo
	err   error
}
```

FakeSource is a fake implementation of Source to be used in tests. 

#### <a id="NewFakeSource" href="#NewFakeSource">func NewFakeSource(svc *types.ExternalService, err error, rs ...*types.Repo) *FakeSource</a>

```
searchKey: repos.NewFakeSource
tags: [method]
```

```Go
func NewFakeSource(svc *types.ExternalService, err error, rs ...*types.Repo) *FakeSource
```

NewFakeSource returns an instance of FakeSource with the given urn, error and repos. 

#### <a id="FakeSource.ExternalServices" href="#FakeSource.ExternalServices">func (s FakeSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.FakeSource.ExternalServices
tags: [function]
```

```Go
func (s FakeSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="FakeSource.ListRepos" href="#FakeSource.ListRepos">func (s FakeSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.FakeSource.ListRepos
tags: [method]
```

```Go
func (s FakeSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns the Repos that FakeSource was instantiated with as well as the error, if any. 

### <a id="GitLabSource" href="#GitLabSource">type GitLabSource struct</a>

```
searchKey: repos.GitLabSource
tags: [struct]
```

```Go
type GitLabSource struct {
	svc                 *types.ExternalService
	config              *schema.GitLabConnection
	exclude             excludeFunc
	baseURL             *url.URL // URL with path /api/v4 (no trailing slash)
	nameTransformations reposource.NameTransformations
	provider            *gitlab.ClientProvider
	client              *gitlab.Client
}
```

A GitLabSource yields repositories from a single GitLab connection configured in Sourcegraph via the external services configuration. 

#### <a id="NewGitLabSource" href="#NewGitLabSource">func NewGitLabSource(svc *types.ExternalService, cf *httpcli.Factory) (*GitLabSource, error)</a>

```
searchKey: repos.NewGitLabSource
tags: [method]
```

```Go
func NewGitLabSource(svc *types.ExternalService, cf *httpcli.Factory) (*GitLabSource, error)
```

NewGitLabSource returns a new GitLabSource from the given external service. 

#### <a id="newGitLabSource" href="#newGitLabSource">func newGitLabSource(svc *types.ExternalService, c *schema.GitLabConnection, cf *httpcli.Factory) (*GitLabSource, error)</a>

```
searchKey: repos.newGitLabSource
tags: [method private]
```

```Go
func newGitLabSource(svc *types.ExternalService, c *schema.GitLabConnection, cf *httpcli.Factory) (*GitLabSource, error)
```

#### <a id="GitLabSource.AffiliatedRepositories" href="#GitLabSource.AffiliatedRepositories">func (s *GitLabSource) AffiliatedRepositories(ctx context.Context) ([]types.CodeHostRepository, error)</a>

```
searchKey: repos.GitLabSource.AffiliatedRepositories
tags: [method]
```

```Go
func (s *GitLabSource) AffiliatedRepositories(ctx context.Context) ([]types.CodeHostRepository, error)
```

#### <a id="GitLabSource.ExternalServices" href="#GitLabSource.ExternalServices">func (s GitLabSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.GitLabSource.ExternalServices
tags: [function]
```

```Go
func (s GitLabSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="GitLabSource.GetRepo" href="#GitLabSource.GetRepo">func (s GitLabSource) GetRepo(ctx context.Context, pathWithNamespace string) (*types.Repo, error)</a>

```
searchKey: repos.GitLabSource.GetRepo
tags: [method]
```

```Go
func (s GitLabSource) GetRepo(ctx context.Context, pathWithNamespace string) (*types.Repo, error)
```

GetRepo returns the GitLab repository with the given pathWithNamespace. 

#### <a id="GitLabSource.ListRepos" href="#GitLabSource.ListRepos">func (s GitLabSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.GitLabSource.ListRepos
tags: [method]
```

```Go
func (s GitLabSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns all GitLab repositories accessible to all connections configured in Sourcegraph via the external services configuration. 

#### <a id="GitLabSource.ValidateAuthenticator" href="#GitLabSource.ValidateAuthenticator">func (s GitLabSource) ValidateAuthenticator(ctx context.Context) error</a>

```
searchKey: repos.GitLabSource.ValidateAuthenticator
tags: [method]
```

```Go
func (s GitLabSource) ValidateAuthenticator(ctx context.Context) error
```

#### <a id="GitLabSource.WithAuthenticator" href="#GitLabSource.WithAuthenticator">func (s GitLabSource) WithAuthenticator(a auth.Authenticator) (Source, error)</a>

```
searchKey: repos.GitLabSource.WithAuthenticator
tags: [method]
```

```Go
func (s GitLabSource) WithAuthenticator(a auth.Authenticator) (Source, error)
```

#### <a id="GitLabSource.excludes" href="#GitLabSource.excludes">func (s *GitLabSource) excludes(p *gitlab.Project) bool</a>

```
searchKey: repos.GitLabSource.excludes
tags: [method private]
```

```Go
func (s *GitLabSource) excludes(p *gitlab.Project) bool
```

#### <a id="GitLabSource.listAllProjects" href="#GitLabSource.listAllProjects">func (s *GitLabSource) listAllProjects(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.GitLabSource.listAllProjects
tags: [method private]
```

```Go
func (s *GitLabSource) listAllProjects(ctx context.Context, results chan SourceResult)
```

#### <a id="GitLabSource.makeRepo" href="#GitLabSource.makeRepo">func (s GitLabSource) makeRepo(proj *gitlab.Project) *types.Repo</a>

```
searchKey: repos.GitLabSource.makeRepo
tags: [method private]
```

```Go
func (s GitLabSource) makeRepo(proj *gitlab.Project) *types.Repo
```

#### <a id="GitLabSource.remoteURL" href="#GitLabSource.remoteURL">func (s *GitLabSource) remoteURL(proj *gitlab.Project) string</a>

```
searchKey: repos.GitLabSource.remoteURL
tags: [method private]
```

```Go
func (s *GitLabSource) remoteURL(proj *gitlab.Project) string
```

remoteURL returns the GitLab projects's Git remote URL 

note: this used to contain credentials but that is no longer the case if you need to get an authenticated clone url use repos.CloneURL 

### <a id="GithubSource" href="#GithubSource">type GithubSource struct</a>

```
searchKey: repos.GithubSource
tags: [struct]
```

```Go
type GithubSource struct {
	svc             *types.ExternalService
	config          *schema.GitHubConnection
	exclude         excludeFunc
	excludeArchived bool
	excludeForks    bool
	githubDotCom    bool
	baseURL         *url.URL
	v3Client        *github.V3Client
	v4Client        *github.V4Client
	// searchClient is for using the GitHub search API, which has an independent
	// rate limit much lower than non-search API requests.
	searchClient *github.V3Client

	// originalHostname is the hostname of config.Url (differs from client APIURL, whose host is api.github.com
	// for an originalHostname of github.com).
	originalHostname string
}
```

A GithubSource yields repositories from a single Github connection configured in Sourcegraph via the external services configuration. 

#### <a id="NewGithubSource" href="#NewGithubSource">func NewGithubSource(svc *types.ExternalService, cf *httpcli.Factory) (*GithubSource, error)</a>

```
searchKey: repos.NewGithubSource
tags: [method]
```

```Go
func NewGithubSource(svc *types.ExternalService, cf *httpcli.Factory) (*GithubSource, error)
```

NewGithubSource returns a new GithubSource from the given external service. 

#### <a id="newGithubSource" href="#newGithubSource">func newGithubSource(svc *types.ExternalService, c *schema.GitHubConnection, cf *httpcli.Factory) (*GithubSource, error)</a>

```
searchKey: repos.newGithubSource
tags: [method private]
```

```Go
func newGithubSource(svc *types.ExternalService, c *schema.GitHubConnection, cf *httpcli.Factory) (*GithubSource, error)
```

#### <a id="GithubSource.AffiliatedRepositories" href="#GithubSource.AffiliatedRepositories">func (s *GithubSource) AffiliatedRepositories(ctx context.Context) ([]types.CodeHostRepository, error)</a>

```
searchKey: repos.GithubSource.AffiliatedRepositories
tags: [method]
```

```Go
func (s *GithubSource) AffiliatedRepositories(ctx context.Context) ([]types.CodeHostRepository, error)
```

#### <a id="GithubSource.ExternalServices" href="#GithubSource.ExternalServices">func (s GithubSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.GithubSource.ExternalServices
tags: [function]
```

```Go
func (s GithubSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="GithubSource.GetRepo" href="#GithubSource.GetRepo">func (s GithubSource) GetRepo(ctx context.Context, nameWithOwner string) (*types.Repo, error)</a>

```
searchKey: repos.GithubSource.GetRepo
tags: [method]
```

```Go
func (s GithubSource) GetRepo(ctx context.Context, nameWithOwner string) (*types.Repo, error)
```

GetRepo returns the Github repository with the given name and owner ("org/repo-name") 

#### <a id="GithubSource.ListRepos" href="#GithubSource.ListRepos">func (s GithubSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.GithubSource.ListRepos
tags: [method]
```

```Go
func (s GithubSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns all Github repositories accessible to all connections configured in Sourcegraph via the external services configuration. 

#### <a id="GithubSource.ValidateAuthenticator" href="#GithubSource.ValidateAuthenticator">func (s GithubSource) ValidateAuthenticator(ctx context.Context) error</a>

```
searchKey: repos.GithubSource.ValidateAuthenticator
tags: [method]
```

```Go
func (s GithubSource) ValidateAuthenticator(ctx context.Context) error
```

#### <a id="GithubSource.WithAuthenticator" href="#GithubSource.WithAuthenticator">func (s GithubSource) WithAuthenticator(a auth.Authenticator) (Source, error)</a>

```
searchKey: repos.GithubSource.WithAuthenticator
tags: [method]
```

```Go
func (s GithubSource) WithAuthenticator(a auth.Authenticator) (Source, error)
```

#### <a id="GithubSource.excludes" href="#GithubSource.excludes">func (s *GithubSource) excludes(r *github.Repository) bool</a>

```
searchKey: repos.GithubSource.excludes
tags: [method private]
```

```Go
func (s *GithubSource) excludes(r *github.Repository) bool
```

#### <a id="GithubSource.fetchAllRepositoriesInBatches" href="#GithubSource.fetchAllRepositoriesInBatches">func (s *GithubSource) fetchAllRepositoriesInBatches(ctx context.Context, results chan *githubResult) error</a>

```
searchKey: repos.GithubSource.fetchAllRepositoriesInBatches
tags: [method private]
```

```Go
func (s *GithubSource) fetchAllRepositoriesInBatches(ctx context.Context, results chan *githubResult) error
```

fetchAllRepositoriesInBatches fetches the repositories configured in config.Repos in batches and adds them to the supplied set 

#### <a id="GithubSource.getRepository" href="#GithubSource.getRepository">func (s *GithubSource) getRepository(ctx context.Context, nameWithOwner string) (*github.Repository, error)</a>

```
searchKey: repos.GithubSource.getRepository
tags: [method private]
```

```Go
func (s *GithubSource) getRepository(ctx context.Context, nameWithOwner string) (*github.Repository, error)
```

#### <a id="GithubSource.listAffiliated" href="#GithubSource.listAffiliated">func (s *GithubSource) listAffiliated(ctx context.Context, results chan *githubResult)</a>

```
searchKey: repos.GithubSource.listAffiliated
tags: [method private]
```

```Go
func (s *GithubSource) listAffiliated(ctx context.Context, results chan *githubResult)
```

listAffiliated handles the `affiliated` keyword of the `repositoryQuery` config option. It returns the repositories affiliated with the client token by hitting the /user/repos endpoint. 

Affiliation is present if the user: (1) owns the repo, (2) is apart of an org that the repo belongs to, or (3) is a collaborator. 

#### <a id="GithubSource.listAllRepositories" href="#GithubSource.listAllRepositories">func (s *GithubSource) listAllRepositories(ctx context.Context, results chan *githubResult)</a>

```
searchKey: repos.GithubSource.listAllRepositories
tags: [method private]
```

```Go
func (s *GithubSource) listAllRepositories(ctx context.Context, results chan *githubResult)
```

listAllRepositories returns the repositories from the given `orgs`, `repos`, and `repositoryQuery` config options excluding the ones specified by `exclude`. 

#### <a id="GithubSource.listOrg" href="#GithubSource.listOrg">func (s *GithubSource) listOrg(ctx context.Context, org string, results chan *githubResult)</a>

```
searchKey: repos.GithubSource.listOrg
tags: [method private]
```

```Go
func (s *GithubSource) listOrg(ctx context.Context, org string, results chan *githubResult)
```

listOrg handles the `org` config option. It returns all the repositories belonging to the given organization by hitting the /orgs/:org/repos endpoint. 

It returns an error if the request fails on the first page. 

#### <a id="GithubSource.listPublic" href="#GithubSource.listPublic">func (s *GithubSource) listPublic(ctx context.Context, results chan *githubResult)</a>

```
searchKey: repos.GithubSource.listPublic
tags: [method private]
```

```Go
func (s *GithubSource) listPublic(ctx context.Context, results chan *githubResult)
```

listPublic handles the `public` keyword of the `repositoryQuery` config option. It returns the public repositories listed on the /repositories endpoint. 

#### <a id="GithubSource.listRepos" href="#GithubSource.listRepos">func (s *GithubSource) listRepos(ctx context.Context, repos []string, results chan *githubResult)</a>

```
searchKey: repos.GithubSource.listRepos
tags: [method private]
```

```Go
func (s *GithubSource) listRepos(ctx context.Context, repos []string, results chan *githubResult)
```

listRepos returns the valid repositories from the given list of repository names. This is done by hitting the /repos/:owner/:name endpoint for each of the given repository names. 

#### <a id="GithubSource.listRepositoryQuery" href="#GithubSource.listRepositoryQuery">func (s *GithubSource) listRepositoryQuery(ctx context.Context, query string, results chan *githubResult)</a>

```
searchKey: repos.GithubSource.listRepositoryQuery
tags: [method private]
```

```Go
func (s *GithubSource) listRepositoryQuery(ctx context.Context, query string, results chan *githubResult)
```

listRepositoryQuery handles the `repositoryQuery` config option. The supported keywords to select repositories are: - `public`: public repositories (from endpoint: /repositories) - `affiliated`: repositories affiliated with client token (from endpoint: /user/repos) - `none`: disables `repositoryQuery` Inputs other than these three keywords will be queried using GitHub advanced repository search (endpoint: /search/repositories) 

#### <a id="GithubSource.listSearch" href="#GithubSource.listSearch">func (s *GithubSource) listSearch(ctx context.Context, query string, results chan *githubResult)</a>

```
searchKey: repos.GithubSource.listSearch
tags: [method private]
```

```Go
func (s *GithubSource) listSearch(ctx context.Context, query string, results chan *githubResult)
```

listSearch handles the `repositoryQuery` config option when a keyword is not present. It returns the repositories resulting from from GitHub's advanced repository search by hitting the /search/repositories endpoint. 

#### <a id="GithubSource.listUser" href="#GithubSource.listUser">func (s *GithubSource) listUser(ctx context.Context, user string, results chan *githubResult) (fail error)</a>

```
searchKey: repos.GithubSource.listUser
tags: [method private]
```

```Go
func (s *GithubSource) listUser(ctx context.Context, user string, results chan *githubResult) (fail error)
```

listUser returns all the repositories belonging to the given user by hitting the /users/:user/repos endpoint. 

It returns an error if the request fails on the first page. 

#### <a id="GithubSource.makeRepo" href="#GithubSource.makeRepo">func (s GithubSource) makeRepo(r *github.Repository) *types.Repo</a>

```
searchKey: repos.GithubSource.makeRepo
tags: [method private]
```

```Go
func (s GithubSource) makeRepo(r *github.Repository) *types.Repo
```

#### <a id="GithubSource.paginate" href="#GithubSource.paginate">func (s *GithubSource) paginate(ctx context.Context, results chan *githubResult, pager repositoryPager)</a>

```
searchKey: repos.GithubSource.paginate
tags: [method private]
```

```Go
func (s *GithubSource) paginate(ctx context.Context, results chan *githubResult, pager repositoryPager)
```

paginate returns all the repositories from the given repositoryPager. It repeatedly calls `pager` with incrementing page count until it returns false for hasNext. 

#### <a id="GithubSource.remoteURL" href="#GithubSource.remoteURL">func (s *GithubSource) remoteURL(repo *github.Repository) string</a>

```
searchKey: repos.GithubSource.remoteURL
tags: [method private]
```

```Go
func (s *GithubSource) remoteURL(repo *github.Repository) string
```

remoteURL returns the repository's Git remote URL 

note: this used to contain credentials but that is no longer the case if you need to get an authenticated clone url use repos.CloneURL 

### <a id="GitolitePhabricatorMetadataSyncer" href="#GitolitePhabricatorMetadataSyncer">type GitolitePhabricatorMetadataSyncer struct</a>

```
searchKey: repos.GitolitePhabricatorMetadataSyncer
tags: [struct]
```

```Go
type GitolitePhabricatorMetadataSyncer struct {
	sem     *semaphore.Weighted // Only one sync at a time, like it was done before.
	counter int64               // Only sync every 10th time, like it was done before.
	store   *Store              // Use to load the external services that yielded a given repo.
}
```

GitolitePhabricatorMetadataSyncer creates Phabricator repos (in the phabricator_repo table) for each Gitolite repo provided in it's Sync method. This is to satisfy the contract established by the "phabricator" setting in the Gitolite external service configuration. 

TODO(tsenart): This is a HUGE hack, but it lives to see another day. Erradicating this technical debt involves lifting the Phabricator integration to a first class citizen, so that it can be treated as source of truth for repos to be mirrored. This would allow using a Phabricator integration that observes another code host, like Gitolite, and provides URIs to those external code hosts that git-server can use as clone URLs, while repo links can still be the built-in Phabricator ones, as is usually expected by customers that rely on code intelligence. With a Phabricator integration similar to all other code hosts, we could remove all of the special code paths for Phabricator everywhere as well as the `phabricator_repo` table. 

#### <a id="NewGitolitePhabricatorMetadataSyncer" href="#NewGitolitePhabricatorMetadataSyncer">func NewGitolitePhabricatorMetadataSyncer(s *Store) *GitolitePhabricatorMetadataSyncer</a>

```
searchKey: repos.NewGitolitePhabricatorMetadataSyncer
tags: [method]
```

```Go
func NewGitolitePhabricatorMetadataSyncer(s *Store) *GitolitePhabricatorMetadataSyncer
```

NewGitolitePhabricatorMetadataSyncer returns a GitolitePhabricatorMetadataSyncer with the given parameters. 

#### <a id="GitolitePhabricatorMetadataSyncer.Sync" href="#GitolitePhabricatorMetadataSyncer.Sync">func (s *GitolitePhabricatorMetadataSyncer) Sync(ctx context.Context, repos []*types.Repo) error</a>

```
searchKey: repos.GitolitePhabricatorMetadataSyncer.Sync
tags: [method]
```

```Go
func (s *GitolitePhabricatorMetadataSyncer) Sync(ctx context.Context, repos []*types.Repo) error
```

Sync creates Phabricator repos for each of the given Gitolite repos. If this is confusing to you, that's because it is. Read the comment on the GitolitePhabricatorMetadataSyncer type. 

### <a id="GitoliteSource" href="#GitoliteSource">type GitoliteSource struct</a>

```
searchKey: repos.GitoliteSource
tags: [struct]
```

```Go
type GitoliteSource struct {
	svc  *types.ExternalService
	conn *schema.GitoliteConnection
	// We ask gitserver to talk to gitolite because it holds the ssh keys
	// required for authentication.
	cli     *gitserver.Client
	exclude excludeFunc
}
```

A GitoliteSource yields repositories from a single Gitolite connection configured in Sourcegraph via the external services configuration. 

#### <a id="NewGitoliteSource" href="#NewGitoliteSource">func NewGitoliteSource(svc *types.ExternalService, cf *httpcli.Factory) (*GitoliteSource, error)</a>

```
searchKey: repos.NewGitoliteSource
tags: [method]
```

```Go
func NewGitoliteSource(svc *types.ExternalService, cf *httpcli.Factory) (*GitoliteSource, error)
```

NewGitoliteSource returns a new GitoliteSource from the given external service. 

#### <a id="GitoliteSource.ExternalServices" href="#GitoliteSource.ExternalServices">func (s GitoliteSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.GitoliteSource.ExternalServices
tags: [function]
```

```Go
func (s GitoliteSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="GitoliteSource.ListRepos" href="#GitoliteSource.ListRepos">func (s *GitoliteSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.GitoliteSource.ListRepos
tags: [method]
```

```Go
func (s *GitoliteSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns all Gitolite repositories accessible to all connections configured in Sourcegraph via the external services configuration. 

#### <a id="GitoliteSource.excludes" href="#GitoliteSource.excludes">func (s GitoliteSource) excludes(gr *gitolite.Repo, r *types.Repo) bool</a>

```
searchKey: repos.GitoliteSource.excludes
tags: [method private]
```

```Go
func (s GitoliteSource) excludes(gr *gitolite.Repo, r *types.Repo) bool
```

#### <a id="GitoliteSource.makeRepo" href="#GitoliteSource.makeRepo">func (s GitoliteSource) makeRepo(repo *gitolite.Repo) *types.Repo</a>

```
searchKey: repos.GitoliteSource.makeRepo
tags: [method private]
```

```Go
func (s GitoliteSource) makeRepo(repo *gitolite.Repo) *types.Repo
```

### <a id="IndexingProgress" href="#IndexingProgress">type IndexingProgress struct</a>

```
searchKey: repos.IndexingProgress
tags: [struct]
```

```Go
type IndexingProgress struct {
	Message string
}
```

### <a id="MockExternalServicesLister" href="#MockExternalServicesLister">type MockExternalServicesLister struct</a>

```
searchKey: repos.MockExternalServicesLister
tags: [struct private]
```

```Go
type MockExternalServicesLister struct {
	list func(context.Context, database.ExternalServicesListOptions) ([]*types.ExternalService, error)
}
```

#### <a id="MockExternalServicesLister.List" href="#MockExternalServicesLister.List">func (m MockExternalServicesLister) List(ctx context.Context, args database.ExternalServicesListOptions) ([]*types.ExternalService, error)</a>

```
searchKey: repos.MockExternalServicesLister.List
tags: [method private]
```

```Go
func (m MockExternalServicesLister) List(ctx context.Context, args database.ExternalServicesListOptions) ([]*types.ExternalService, error)
```

### <a id="MockStore" href="#MockStore">type MockStore struct</a>

```
searchKey: repos.MockStore
tags: [struct]
```

```Go
type MockStore struct {
	UpsertRepos func(ctx context.Context, repos ...*types.Repo) (err error)
}
```

MockStore is used to mock calls to certain DBStore methods. 

### <a id="OtherSource" href="#OtherSource">type OtherSource struct</a>

```
searchKey: repos.OtherSource
tags: [struct]
```

```Go
type OtherSource struct {
	svc    *types.ExternalService
	conn   *schema.OtherExternalServiceConnection
	client httpcli.Doer
}
```

A OtherSource yields repositories from a single Other connection configured in Sourcegraph via the external services configuration. 

#### <a id="NewOtherSource" href="#NewOtherSource">func NewOtherSource(svc *types.ExternalService, cf *httpcli.Factory) (*OtherSource, error)</a>

```
searchKey: repos.NewOtherSource
tags: [method]
```

```Go
func NewOtherSource(svc *types.ExternalService, cf *httpcli.Factory) (*OtherSource, error)
```

NewOtherSource returns a new OtherSource from the given external service. 

#### <a id="OtherSource.ExternalServices" href="#OtherSource.ExternalServices">func (s OtherSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.OtherSource.ExternalServices
tags: [function]
```

```Go
func (s OtherSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="OtherSource.ListRepos" href="#OtherSource.ListRepos">func (s OtherSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.OtherSource.ListRepos
tags: [method]
```

```Go
func (s OtherSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns all Other repositories accessible to all connections configured in Sourcegraph via the external services configuration. 

#### <a id="OtherSource.cloneURLs" href="#OtherSource.cloneURLs">func (s OtherSource) cloneURLs() ([]*url.URL, error)</a>

```
searchKey: repos.OtherSource.cloneURLs
tags: [function private]
```

```Go
func (s OtherSource) cloneURLs() ([]*url.URL, error)
```

#### <a id="OtherSource.otherRepoFromCloneURL" href="#OtherSource.otherRepoFromCloneURL">func (s OtherSource) otherRepoFromCloneURL(urn string, u *url.URL) (*types.Repo, error)</a>

```
searchKey: repos.OtherSource.otherRepoFromCloneURL
tags: [method private]
```

```Go
func (s OtherSource) otherRepoFromCloneURL(urn string, u *url.URL) (*types.Repo, error)
```

#### <a id="OtherSource.srcExpose" href="#OtherSource.srcExpose">func (s OtherSource) srcExpose(ctx context.Context) ([]*types.Repo, error)</a>

```
searchKey: repos.OtherSource.srcExpose
tags: [method private]
```

```Go
func (s OtherSource) srcExpose(ctx context.Context) ([]*types.Repo, error)
```

### <a id="PerforceSource" href="#PerforceSource">type PerforceSource struct</a>

```
searchKey: repos.PerforceSource
tags: [struct]
```

```Go
type PerforceSource struct {
	svc    *types.ExternalService
	config *schema.PerforceConnection
}
```

A PerforceSource yields depots from a single Perforce connection configured in Sourcegraph via the external services configuration. 

#### <a id="NewPerforceSource" href="#NewPerforceSource">func NewPerforceSource(svc *types.ExternalService) (*PerforceSource, error)</a>

```
searchKey: repos.NewPerforceSource
tags: [method]
```

```Go
func NewPerforceSource(svc *types.ExternalService) (*PerforceSource, error)
```

NewPerforceSource returns a new PerforceSource from the given external service. 

#### <a id="newPerforceSource" href="#newPerforceSource">func newPerforceSource(svc *types.ExternalService, c *schema.PerforceConnection) (*PerforceSource, error)</a>

```
searchKey: repos.newPerforceSource
tags: [method private]
```

```Go
func newPerforceSource(svc *types.ExternalService, c *schema.PerforceConnection) (*PerforceSource, error)
```

#### <a id="PerforceSource.ExternalServices" href="#PerforceSource.ExternalServices">func (s PerforceSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.PerforceSource.ExternalServices
tags: [function]
```

```Go
func (s PerforceSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="PerforceSource.ListRepos" href="#PerforceSource.ListRepos">func (s PerforceSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.PerforceSource.ListRepos
tags: [method]
```

```Go
func (s PerforceSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns all Perforce depots accessible to all connections configured in Sourcegraph via the external services configuration. 

#### <a id="PerforceSource.makeRepo" href="#PerforceSource.makeRepo">func (s PerforceSource) makeRepo(depot string) *types.Repo</a>

```
searchKey: repos.PerforceSource.makeRepo
tags: [method private]
```

```Go
func (s PerforceSource) makeRepo(depot string) *types.Repo
```

### <a id="PhabricatorSource" href="#PhabricatorSource">type PhabricatorSource struct</a>

```
searchKey: repos.PhabricatorSource
tags: [struct]
```

```Go
type PhabricatorSource struct {
	svc  *types.ExternalService
	conn *schema.PhabricatorConnection
	cf   *httpcli.Factory

	mu  sync.Mutex
	cli *phabricator.Client
}
```

A PhabricatorSource yields repositories from a single Phabricator connection configured in Sourcegraph via the external services configuration. 

#### <a id="NewPhabricatorSource" href="#NewPhabricatorSource">func NewPhabricatorSource(svc *types.ExternalService, cf *httpcli.Factory) (*PhabricatorSource, error)</a>

```
searchKey: repos.NewPhabricatorSource
tags: [method]
```

```Go
func NewPhabricatorSource(svc *types.ExternalService, cf *httpcli.Factory) (*PhabricatorSource, error)
```

NewPhabricatorSource returns a new PhabricatorSource from the given external service. 

#### <a id="PhabricatorSource.ExternalServices" href="#PhabricatorSource.ExternalServices">func (s *PhabricatorSource) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.PhabricatorSource.ExternalServices
tags: [function]
```

```Go
func (s *PhabricatorSource) ExternalServices() types.ExternalServices
```

ExternalServices returns a singleton slice containing the external service. 

#### <a id="PhabricatorSource.ListRepos" href="#PhabricatorSource.ListRepos">func (s *PhabricatorSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.PhabricatorSource.ListRepos
tags: [method]
```

```Go
func (s *PhabricatorSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos returns all Phabricator repositories accessible to all connections configured in Sourcegraph via the external services configuration. 

#### <a id="PhabricatorSource.client" href="#PhabricatorSource.client">func (s *PhabricatorSource) client(ctx context.Context) (*phabricator.Client, error)</a>

```
searchKey: repos.PhabricatorSource.client
tags: [method private]
```

```Go
func (s *PhabricatorSource) client(ctx context.Context) (*phabricator.Client, error)
```

client initialises the phabricator.Client if it isn't initialised yet. This is done lazily instead of in NewPhabricatorSource so that we have access to the context.Context passed in via ListRepos. 

#### <a id="PhabricatorSource.makeRepo" href="#PhabricatorSource.makeRepo">func (s *PhabricatorSource) makeRepo(repo *phabricator.Repo) (*types.Repo, error)</a>

```
searchKey: repos.PhabricatorSource.makeRepo
tags: [method private]
```

```Go
func (s *PhabricatorSource) makeRepo(repo *phabricator.Repo) (*types.Repo, error)
```

### <a id="RateLimitSyncer" href="#RateLimitSyncer">type RateLimitSyncer struct</a>

```
searchKey: repos.RateLimitSyncer
tags: [struct]
```

```Go
type RateLimitSyncer struct {
	registry      *ratelimit.Registry
	serviceLister externalServiceLister
	// How many services to fetch in each DB call
	limit int64
}
```

RateLimitSyncer syncs rate limits based on external service configuration 

#### <a id="NewRateLimitSyncer" href="#NewRateLimitSyncer">func NewRateLimitSyncer(registry *ratelimit.Registry, serviceLister externalServiceLister) *RateLimitSyncer</a>

```
searchKey: repos.NewRateLimitSyncer
tags: [method]
```

```Go
func NewRateLimitSyncer(registry *ratelimit.Registry, serviceLister externalServiceLister) *RateLimitSyncer
```

NewRateLimitSyncer returns a new syncer 

#### <a id="RateLimitSyncer.SyncRateLimiters" href="#RateLimitSyncer.SyncRateLimiters">func (r *RateLimitSyncer) SyncRateLimiters(ctx context.Context) error</a>

```
searchKey: repos.RateLimitSyncer.SyncRateLimiters
tags: [method]
```

```Go
func (r *RateLimitSyncer) SyncRateLimiters(ctx context.Context) error
```

SyncRateLimiters syncs all rate limiters using current config. We sync them all as we need to pick the most restrictive configured limit per code host and rate limits can be defined in multiple external services for the same host. 

### <a id="RunOptions" href="#RunOptions">type RunOptions struct</a>

```
searchKey: repos.RunOptions
tags: [struct]
```

```Go
type RunOptions struct {
	EnqueueInterval func() time.Duration // Defaults to 1 minute
	IsCloud         bool                 // Defaults to false
	MinSyncInterval func() time.Duration // Defaults to 1 minute
	DequeueInterval time.Duration        // Default to 10 seconds
}
```

RunOptions contains options customizing Run behaviour. 

### <a id="ScopeCache" href="#ScopeCache">type ScopeCache interface</a>

```
searchKey: repos.ScopeCache
tags: [interface]
```

```Go
type ScopeCache interface {
	Get(string) ([]byte, bool)
	Set(string, []byte)
}
```

### <a id="Source" href="#Source">type Source interface</a>

```
searchKey: repos.Source
tags: [interface]
```

```Go
type Source interface {
	// ListRepos sends all the repos a source yields over the passed in channel
	// as SourceResults
	ListRepos(context.Context, chan SourceResult)
	// ExternalServices returns the ExternalServices for the Source.
	ExternalServices() types.ExternalServices
}
```

A Source yields repositories to be stored and analysed by Sourcegraph. Successive calls to its ListRepos method may yield different results. 

#### <a id="NewSource" href="#NewSource">func NewSource(svc *types.ExternalService, cf *httpcli.Factory) (Source, error)</a>

```
searchKey: repos.NewSource
tags: [method]
```

```Go
func NewSource(svc *types.ExternalService, cf *httpcli.Factory) (Source, error)
```

NewSource returns a repository yielding Source from the given ExternalService configuration. 

### <a id="SourceError" href="#SourceError">type SourceError struct</a>

```
searchKey: repos.SourceError
tags: [struct]
```

```Go
type SourceError struct {
	Err    error
	ExtSvc *types.ExternalService
}
```

#### <a id="SourceError.Cause" href="#SourceError.Cause">func (s *SourceError) Cause() error</a>

```
searchKey: repos.SourceError.Cause
tags: [function]
```

```Go
func (s *SourceError) Cause() error
```

#### <a id="SourceError.Error" href="#SourceError.Error">func (s *SourceError) Error() string</a>

```
searchKey: repos.SourceError.Error
tags: [function]
```

```Go
func (s *SourceError) Error() string
```

### <a id="SourceMetrics" href="#SourceMetrics">type SourceMetrics struct</a>

```
searchKey: repos.SourceMetrics
tags: [struct]
```

```Go
type SourceMetrics struct {
	ListRepos *metrics.OperationMetrics
}
```

SourceMetrics encapsulates the Prometheus metrics of a Source. 

#### <a id="NewSourceMetrics" href="#NewSourceMetrics">func NewSourceMetrics() SourceMetrics</a>

```
searchKey: repos.NewSourceMetrics
tags: [function]
```

```Go
func NewSourceMetrics() SourceMetrics
```

NewSourceMetrics returns SourceMetrics that need to be registered in a Prometheus registry. 

#### <a id="SourceMetrics.MustRegister" href="#SourceMetrics.MustRegister">func (sm SourceMetrics) MustRegister(r prometheus.Registerer)</a>

```
searchKey: repos.SourceMetrics.MustRegister
tags: [method]
```

```Go
func (sm SourceMetrics) MustRegister(r prometheus.Registerer)
```

MustRegister registers all metrics in SourceMetrics in the given prometheus.Registerer. It panics in case of failure. 

### <a id="SourceResult" href="#SourceResult">type SourceResult struct</a>

```
searchKey: repos.SourceResult
tags: [struct]
```

```Go
type SourceResult struct {
	// Source points to the Source that produced this result
	Source Source
	// Repo is the repository that was listed by the Source
	Repo *types.Repo
	// Err is only set in case the Source ran into an error when listing repositories
	Err error
}
```

A SourceResult is sent by a Source over a channel for each repository it yields when listing repositories 

### <a id="Sourcer" href="#Sourcer">type Sourcer func(...*github.com/sourcegraph/sourcegraph/internal/types.ExternalService) (github.com/sourcegraph/sourcegraph/internal/repos.Sources, error)</a>

```
searchKey: repos.Sourcer
tags: [function]
```

```Go
type Sourcer func(...*types.ExternalService) (Sources, error)
```

A Sourcer converts the given ExternalServices to Sources whose yielded Repos should be synced. 

#### <a id="NewFakeSourcer" href="#NewFakeSourcer">func NewFakeSourcer(err error, srcs ...Source) Sourcer</a>

```
searchKey: repos.NewFakeSourcer
tags: [method]
```

```Go
func NewFakeSourcer(err error, srcs ...Source) Sourcer
```

NewFakeSourcer returns a Sourcer which always returns the given error and sources, ignoring the given external services. 

#### <a id="NewSourcer" href="#NewSourcer">func NewSourcer(cf *httpcli.Factory, decs ...func(Source) Source) Sourcer</a>

```
searchKey: repos.NewSourcer
tags: [method]
```

```Go
func NewSourcer(cf *httpcli.Factory, decs ...func(Source) Source) Sourcer
```

NewSourcer returns a Sourcer that converts the given ExternalServices into Sources that use the provided httpcli.Factory to create the http.Clients needed to contact the respective upstream code host APIs. 

Deleted external services are ignored. 

The provided decorator functions will be applied to each Source. 

### <a id="Sources" href="#Sources">type Sources []repos.Source</a>

```
searchKey: repos.Sources
tags: [array interface]
```

```Go
type Sources []Source
```

Sources is a list of Sources that implements the Source interface. 

#### <a id="Sources.ExternalServices" href="#Sources.ExternalServices">func (srcs Sources) ExternalServices() types.ExternalServices</a>

```
searchKey: repos.Sources.ExternalServices
tags: [function]
```

```Go
func (srcs Sources) ExternalServices() types.ExternalServices
```

ExternalServices returns the ExternalServices from the given Sources. 

#### <a id="Sources.ListRepos" href="#Sources.ListRepos">func (srcs Sources) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.Sources.ListRepos
tags: [method]
```

```Go
func (srcs Sources) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos lists all the repos of all the sources and returns the aggregate result. 

#### <a id="Sources.Sources" href="#Sources.Sources">func (srcs Sources) Sources() []Source</a>

```
searchKey: repos.Sources.Sources
tags: [function]
```

```Go
func (srcs Sources) Sources() []Source
```

Sources returns the underlying Sources. 

### <a id="StatusMessage" href="#StatusMessage">type StatusMessage struct</a>

```
searchKey: repos.StatusMessage
tags: [struct]
```

```Go
type StatusMessage struct {
	Cloning                  *CloningProgress          `json:"cloning"`
	Indexing                 *IndexingProgress         `json:"indexing"`
	ExternalServiceSyncError *ExternalServiceSyncError `json:"external_service_sync_error"`
	SyncError                *SyncError                `json:"sync_error"`
}
```

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: repos.Store
tags: [struct]
```

```Go
type Store struct {
	*basestore.Store

	// Logger used by the store. Defaults to log15.Root().
	Log logging.ErrorLogger
	// Metrics are sent to Prometheus by default.
	Metrics StoreMetrics
	// Used for tracing calls to store methods. Uses opentracing.GlobalTracer() by default.
	Tracer trace.Tracer
	// RepoStore is a database.RepoStore using the same database handle.
	RepoStore *database.RepoStore
	// ExternalServiceStore is a database.ExternalServiceStore using the same database handle.
	ExternalServiceStore *database.ExternalServiceStore
	// Used to mock calls to certain methods.
	Mocks MockStore

	txtrace *trace.Trace
	txctx   context.Context
}
```

A Store exposes methods to read and write repos and external services. 

#### <a id="NewStore" href="#NewStore">func NewStore(db dbutil.DB, txOpts sql.TxOptions) *Store</a>

```
searchKey: repos.NewStore
tags: [method]
```

```Go
func NewStore(db dbutil.DB, txOpts sql.TxOptions) *Store
```

NewStore instantiates and returns a new DBStore with prepared statements. 

#### <a id="Store.CountUserAddedRepos" href="#Store.CountUserAddedRepos">func (s *Store) CountUserAddedRepos(ctx context.Context) (count uint64, err error)</a>

```
searchKey: repos.Store.CountUserAddedRepos
tags: [method]
```

```Go
func (s *Store) CountUserAddedRepos(ctx context.Context) (count uint64, err error)
```

CountUserAddedRepos counts the total number of repos that have been added by user owned external services. 

#### <a id="Store.Done" href="#Store.Done">func (s *Store) Done(err error) error</a>

```
searchKey: repos.Store.Done
tags: [method]
```

```Go
func (s *Store) Done(err error) error
```

Done calls into the inner Store Done method. 

#### <a id="Store.EnqueueSingleSyncJob" href="#Store.EnqueueSingleSyncJob">func (s *Store) EnqueueSingleSyncJob(ctx context.Context, id int64) (err error)</a>

```
searchKey: repos.Store.EnqueueSingleSyncJob
tags: [method]
```

```Go
func (s *Store) EnqueueSingleSyncJob(ctx context.Context, id int64) (err error)
```

EnqueueSingleSyncJob enqueues a single sync job for the given external service if it is not already queued or processing. 

#### <a id="Store.EnqueueSyncJobs" href="#Store.EnqueueSyncJobs">func (s *Store) EnqueueSyncJobs(ctx context.Context, isCloud bool) (err error)</a>

```
searchKey: repos.Store.EnqueueSyncJobs
tags: [method]
```

```Go
func (s *Store) EnqueueSyncJobs(ctx context.Context, isCloud bool) (err error)
```

EnqueueSyncJobs enqueues sync jobs for all external services that are due. 

#### <a id="Store.ListExternalRepoSpecs" href="#Store.ListExternalRepoSpecs">func (s *Store) ListExternalRepoSpecs(ctx context.Context) (ids map[api.ExternalRepoSpec]struct{}, err error)</a>

```
searchKey: repos.Store.ListExternalRepoSpecs
tags: [method]
```

```Go
func (s *Store) ListExternalRepoSpecs(ctx context.Context) (ids map[api.ExternalRepoSpec]struct{}, err error)
```

#### <a id="Store.ListSyncJobs" href="#Store.ListSyncJobs">func (s *Store) ListSyncJobs(ctx context.Context) ([]SyncJob, error)</a>

```
searchKey: repos.Store.ListSyncJobs
tags: [method]
```

```Go
func (s *Store) ListSyncJobs(ctx context.Context) ([]SyncJob, error)
```

ListSyncJobs returns all sync jobs. 

#### <a id="Store.SetClonedRepos" href="#Store.SetClonedRepos">func (s *Store) SetClonedRepos(ctx context.Context, repoNames ...string) (err error)</a>

```
searchKey: repos.Store.SetClonedRepos
tags: [method]
```

```Go
func (s *Store) SetClonedRepos(ctx context.Context, repoNames ...string) (err error)
```

SetClonedRepos updates cloned status for all repositories. All repositories whose name is in repoNames will have their cloned column set to true and every other repository will have it set to false. 

#### <a id="Store.Transact" href="#Store.Transact">func (s *Store) Transact(ctx context.Context) (stx *Store, err error)</a>

```
searchKey: repos.Store.Transact
tags: [method]
```

```Go
func (s *Store) Transact(ctx context.Context) (stx *Store, err error)
```

Transact returns a TxStore whose methods operate within the context of a transaction. 

#### <a id="Store.UpsertRepos" href="#Store.UpsertRepos">func (s *Store) UpsertRepos(ctx context.Context, repos ...*types.Repo) (err error)</a>

```
searchKey: repos.Store.UpsertRepos
tags: [method]
```

```Go
func (s *Store) UpsertRepos(ctx context.Context, repos ...*types.Repo) (err error)
```

UpsertRepos updates or inserts the given repos in the Sourcegraph repository store. The ID field is used to distinguish between Repos that need to be updated and types.Repos that need to be inserted. On inserts, the _ID field of each given Repo is set on inserts. The cloned column is not updated by this function. This method does NOT update sources in the external_services_repo table. Use UpsertSources for that purpose. 

#### <a id="Store.UpsertSources" href="#Store.UpsertSources">func (s *Store) UpsertSources(ctx context.Context, inserts, updates, deletes map[api.RepoID][]types.SourceInfo) (err error)</a>

```
searchKey: repos.Store.UpsertSources
tags: [method]
```

```Go
func (s *Store) UpsertSources(ctx context.Context, inserts, updates, deletes map[api.RepoID][]types.SourceInfo) (err error)
```

#### <a id="Store.With" href="#Store.With">func (s *Store) With(other basestore.ShareableStore) *Store</a>

```
searchKey: repos.Store.With
tags: [method]
```

```Go
func (s *Store) With(other basestore.ShareableStore) *Store
```

#### <a id="Store.list" href="#Store.list">func (s *Store) list(ctx context.Context, q *sqlf.Query, scan scanFunc) (last, count int64, err error)</a>

```
searchKey: repos.Store.list
tags: [method private]
```

```Go
func (s *Store) list(ctx context.Context, q *sqlf.Query, scan scanFunc) (last, count int64, err error)
```

#### <a id="Store.paginate" href="#Store.paginate">func (s *Store) paginate(ctx context.Context, limit, perPage int64, cursor int64, q paginatedQuery, scan scanFunc) (err error)</a>

```
searchKey: repos.Store.paginate
tags: [method private]
```

```Go
func (s *Store) paginate(ctx context.Context, limit, perPage int64, cursor int64, q paginatedQuery, scan scanFunc) (err error)
```

#### <a id="Store.trace" href="#Store.trace">func (s *Store) trace(ctx context.Context, family string) (*trace.Trace, context.Context)</a>

```
searchKey: repos.Store.trace
tags: [method private]
```

```Go
func (s *Store) trace(ctx context.Context, family string) (*trace.Trace, context.Context)
```

### <a id="StoreMetrics" href="#StoreMetrics">type StoreMetrics struct</a>

```
searchKey: repos.StoreMetrics
tags: [struct]
```

```Go
type StoreMetrics struct {
	Transact              *metrics.OperationMetrics
	Done                  *metrics.OperationMetrics
	UpsertRepos           *metrics.OperationMetrics
	UpsertSources         *metrics.OperationMetrics
	ListExternalRepoSpecs *metrics.OperationMetrics
	GetExternalService    *metrics.OperationMetrics
	SetClonedRepos        *metrics.OperationMetrics
	CountNotClonedRepos   *metrics.OperationMetrics
	CountUserAddedRepos   *metrics.OperationMetrics
	EnqueueSyncJobs       *metrics.OperationMetrics
}
```

StoreMetrics encapsulates the Prometheus metrics of a Store. 

#### <a id="NewStoreMetrics" href="#NewStoreMetrics">func NewStoreMetrics() StoreMetrics</a>

```
searchKey: repos.NewStoreMetrics
tags: [function]
```

```Go
func NewStoreMetrics() StoreMetrics
```

NewStoreMetrics returns StoreMetrics that need to be registered in a Prometheus registry. 

#### <a id="StoreMetrics.MustRegister" href="#StoreMetrics.MustRegister">func (sm StoreMetrics) MustRegister(r prometheus.Registerer)</a>

```
searchKey: repos.StoreMetrics.MustRegister
tags: [method]
```

```Go
func (sm StoreMetrics) MustRegister(r prometheus.Registerer)
```

MustRegister registers all metrics in StoreMetrics in the given prometheus.Registerer. It panics in case of failure. 

### <a id="SyncError" href="#SyncError">type SyncError struct</a>

```
searchKey: repos.SyncError
tags: [struct]
```

```Go
type SyncError struct {
	Message string
}
```

### <a id="SyncJob" href="#SyncJob">type SyncJob struct</a>

```
searchKey: repos.SyncJob
tags: [struct]
```

```Go
type SyncJob struct {
	ID                int
	State             string
	FailureMessage    sql.NullString
	StartedAt         sql.NullTime
	FinishedAt        sql.NullTime
	ProcessAfter      sql.NullTime
	NumResets         int
	NumFailures       int
	ExternalServiceID int64
	NextSyncAt        sql.NullTime
}
```

SyncJob represents an external service that needs to be synced 

#### <a id="SyncJob.RecordID" href="#SyncJob.RecordID">func (s *SyncJob) RecordID() int</a>

```
searchKey: repos.SyncJob.RecordID
tags: [function]
```

```Go
func (s *SyncJob) RecordID() int
```

RecordID implements workerutil.Record and indicates the queued item id 

### <a id="SyncWorkerOptions" href="#SyncWorkerOptions">type SyncWorkerOptions struct</a>

```
searchKey: repos.SyncWorkerOptions
tags: [struct]
```

```Go
type SyncWorkerOptions struct {
	NumHandlers            int                   // defaults to 3
	WorkerInterval         time.Duration         // defaults to 10s
	PrometheusRegisterer   prometheus.Registerer // if non-nil, metrics will be collected
	CleanupOldJobs         bool                  // run a background process to cleanup old jobs
	CleanupOldJobsInterval time.Duration         // defaults to 1h
}
```

### <a id="Syncer" href="#Syncer">type Syncer struct</a>

```
searchKey: repos.Syncer
tags: [struct]
```

```Go
type Syncer struct {
	Sourcer Sourcer
	Worker  *workerutil.Worker
	Store   *Store

	// Synced is sent a collection of Repos that were synced by Sync (only if Synced is non-nil)
	Synced chan Diff

	// SubsetSynced is sent the result of a single repo sync that were synced by SyncRepo (only if SubsetSynced is non-nil)
	SubsetSynced chan Diff

	// Logger if non-nil is logged to.
	Logger log15.Logger

	// Now is time.Now. Can be set by tests to get deterministic output.
	Now func() time.Time

	Registerer prometheus.Registerer

	// UserReposMaxPerUser can be used to override the value read from config.
	// If zero, we'll read from config instead.
	UserReposMaxPerUser int

	// UserReposMaxPerSite can be used to override the value read from config.
	// If zero, we'll read from config instead.
	UserReposMaxPerSite int
}
```

A Syncer periodically synchronizes available repositories from all its given Sources with the stored Repositories in Sourcegraph. 

#### <a id="Syncer.Run" href="#Syncer.Run">func (s *Syncer) Run(ctx context.Context, db *sql.DB, store *Store, opts RunOptions) error</a>

```
searchKey: repos.Syncer.Run
tags: [method]
```

```Go
func (s *Syncer) Run(ctx context.Context, db *sql.DB, store *Store, opts RunOptions) error
```

Run runs the Sync at the specified interval. 

#### <a id="Syncer.SyncExternalService" href="#Syncer.SyncExternalService">func (s *Syncer) SyncExternalService(ctx context.Context, tx *Store, externalServiceID int64, minSyncInterval time.Duration) (err error)</a>

```
searchKey: repos.Syncer.SyncExternalService
tags: [method]
```

```Go
func (s *Syncer) SyncExternalService(ctx context.Context, tx *Store, externalServiceID int64, minSyncInterval time.Duration) (err error)
```

SyncExternalService syncs repos using the supplied external service. 

#### <a id="Syncer.SyncRepo" href="#Syncer.SyncRepo">func (s *Syncer) SyncRepo(ctx context.Context, store *Store, sourcedRepo *types.Repo) (err error)</a>

```
searchKey: repos.Syncer.SyncRepo
tags: [method]
```

```Go
func (s *Syncer) SyncRepo(ctx context.Context, store *Store, sourcedRepo *types.Repo) (err error)
```

SyncRepo runs the syncer on a single repository. 

#### <a id="Syncer.TriggerExternalServiceSync" href="#Syncer.TriggerExternalServiceSync">func (s *Syncer) TriggerExternalServiceSync(ctx context.Context, id int64) error</a>

```
searchKey: repos.Syncer.TriggerExternalServiceSync
tags: [method]
```

```Go
func (s *Syncer) TriggerExternalServiceSync(ctx context.Context, id int64) error
```

TriggerExternalServiceSync will enqueue a sync job for the supplied external service 

#### <a id="Syncer.initialUnmodifiedDiffFromStore" href="#Syncer.initialUnmodifiedDiffFromStore">func (s *Syncer) initialUnmodifiedDiffFromStore(ctx context.Context, store *Store)</a>

```
searchKey: repos.Syncer.initialUnmodifiedDiffFromStore
tags: [method private]
```

```Go
func (s *Syncer) initialUnmodifiedDiffFromStore(ctx context.Context, store *Store)
```

initialUnmodifiedDiffFromStore creates a diff of all repos present in the store and sends it to s.Synced. This is used so that on startup the reader of s.Synced will receive a list of repos. In particular this is so that the git update scheduler can start working straight away on existing repositories. 

#### <a id="Syncer.insertIfNew" href="#Syncer.insertIfNew">func (s *Syncer) insertIfNew(ctx context.Context, store *Store, publicOnly bool, sourcedRepo *types.Repo) (err error)</a>

```
searchKey: repos.Syncer.insertIfNew
tags: [method private]
```

```Go
func (s *Syncer) insertIfNew(ctx context.Context, store *Store, publicOnly bool, sourcedRepo *types.Repo) (err error)
```

insertIfNew is a specialization of SyncRepo. It will insert sourcedRepo if there are no related repositories, otherwise does nothing. 

#### <a id="Syncer.makeNewRepoInserter" href="#Syncer.makeNewRepoInserter">func (s *Syncer) makeNewRepoInserter(ctx context.Context, store *Store, publicOnly bool) (func(*types.Repo) error, error)</a>

```
searchKey: repos.Syncer.makeNewRepoInserter
tags: [method private]
```

```Go
func (s *Syncer) makeNewRepoInserter(ctx context.Context, store *Store, publicOnly bool) (func(*types.Repo) error, error)
```

makeNewRepoInserter returns a function that will insert repos. If publicOnly is set it will never insert a private repo. 

#### <a id="Syncer.observe" href="#Syncer.observe">func (s *Syncer) observe(ctx context.Context, family, title string) (context.Context, func(*Diff, *error))</a>

```
searchKey: repos.Syncer.observe
tags: [method private]
```

```Go
func (s *Syncer) observe(ctx context.Context, family, title string) (context.Context, func(*Diff, *error))
```

#### <a id="Syncer.sourceDiff" href="#Syncer.sourceDiff">func (s *Syncer) sourceDiff(repoID api.RepoID, diff *sourceDiff, oldSources, newSources map[string]*types.SourceInfo)</a>

```
searchKey: repos.Syncer.sourceDiff
tags: [method private]
```

```Go
func (s *Syncer) sourceDiff(repoID api.RepoID, diff *sourceDiff, oldSources, newSources map[string]*types.SourceInfo)
```

sourceDiff computes the diff between the oldSources and the newSources, and updates the Added, Modified and Deleted in place of `diff`. 

#### <a id="Syncer.sourced" href="#Syncer.sourced">func (s *Syncer) sourced(ctx context.Context, svc *types.ExternalService, onSourced ...func(*types.Repo) error) ([]*types.Repo, error)</a>

```
searchKey: repos.Syncer.sourced
tags: [method private]
```

```Go
func (s *Syncer) sourced(ctx context.Context, svc *types.ExternalService, onSourced ...func(*types.Repo) error) ([]*types.Repo, error)
```

#### <a id="Syncer.sourcesUpserts" href="#Syncer.sourcesUpserts">func (s *Syncer) sourcesUpserts(diff *Diff, stored []*types.Repo) *sourceDiff</a>

```
searchKey: repos.Syncer.sourcesUpserts
tags: [method private]
```

```Go
func (s *Syncer) sourcesUpserts(diff *Diff, stored []*types.Repo) *sourceDiff
```

sourcesUpserts creates a diff for sources based on the repositoried diff. 

#### <a id="Syncer.syncRepo" href="#Syncer.syncRepo">func (s *Syncer) syncRepo(ctx context.Context, store *Store, insertOnly bool, publicOnly bool, sourcedRepo *types.Repo) (diff Diff, err error)</a>

```
searchKey: repos.Syncer.syncRepo
tags: [method private]
```

```Go
func (s *Syncer) syncRepo(ctx context.Context, store *Store, insertOnly bool, publicOnly bool, sourcedRepo *types.Repo) (diff Diff, err error)
```

syncRepo syncs a single repo that has been sourced from a single external service. 

#### <a id="Syncer.upserts" href="#Syncer.upserts">func (s *Syncer) upserts(diff Diff) []*types.Repo</a>

```
searchKey: repos.Syncer.upserts
tags: [method private]
```

```Go
func (s *Syncer) upserts(diff Diff) []*types.Repo
```

upserts returns a slice containing modified or added repos from a Diff. Deleted repos are ignored. 

### <a id="UnsupportedAuthenticatorError" href="#UnsupportedAuthenticatorError">type UnsupportedAuthenticatorError struct</a>

```
searchKey: repos.UnsupportedAuthenticatorError
tags: [struct]
```

```Go
type UnsupportedAuthenticatorError struct {
	have   string
	source string
}
```

UnsupportedAuthenticatorError is returned by WithAuthenticator if the authenticator isn't supported on that code host. 

#### <a id="newUnsupportedAuthenticatorError" href="#newUnsupportedAuthenticatorError">func newUnsupportedAuthenticatorError(source string, a auth.Authenticator) UnsupportedAuthenticatorError</a>

```
searchKey: repos.newUnsupportedAuthenticatorError
tags: [method private]
```

```Go
func newUnsupportedAuthenticatorError(source string, a auth.Authenticator) UnsupportedAuthenticatorError
```

#### <a id="UnsupportedAuthenticatorError.Error" href="#UnsupportedAuthenticatorError.Error">func (e UnsupportedAuthenticatorError) Error() string</a>

```
searchKey: repos.UnsupportedAuthenticatorError.Error
tags: [function]
```

```Go
func (e UnsupportedAuthenticatorError) Error() string
```

### <a id="UserSource" href="#UserSource">type UserSource interface</a>

```
searchKey: repos.UserSource
tags: [interface]
```

```Go
type UserSource interface {
	// WithAuthenticator returns a copy of the original Source configured to use
	// the given authenticator, provided that authenticator type is supported by
	// the code host.
	WithAuthenticator(auth.Authenticator) (Source, error)
	// ValidateAuthenticator validates the currently set authenticator is usable.
	// Returns an error, when validating the Authenticator yielded an error.
	ValidateAuthenticator(ctx context.Context) error
}
```

A UserSource is a source that can use a custom authenticator (such as one contained in a user credential) to interact with the code host, rather than global credentials. 

### <a id="configuredRepo" href="#configuredRepo">type configuredRepo struct</a>

```
searchKey: repos.configuredRepo
tags: [struct private]
```

```Go
type configuredRepo struct {
	ID   api.RepoID
	Name api.RepoName
}
```

A configuredRepo represents the configuration data for a given repo from a configuration source, such as information retrieved from GitHub for a given GitHubConnection. 

#### <a id="configuredRepoFromRepo" href="#configuredRepoFromRepo">func configuredRepoFromRepo(r *types.Repo) configuredRepo</a>

```
searchKey: repos.configuredRepoFromRepo
tags: [method private]
```

```Go
func configuredRepoFromRepo(r *types.Repo) configuredRepo
```

### <a id="excludeBuilder" href="#excludeBuilder">type excludeBuilder struct</a>

```
searchKey: repos.excludeBuilder
tags: [struct private]
```

```Go
type excludeBuilder struct {
	exact    map[string]struct{}
	patterns []*regexp.Regexp

	err error
}
```

excludeBuilder builds an excludeFunc. 

#### <a id="excludeBuilder.Build" href="#excludeBuilder.Build">func (e *excludeBuilder) Build() (excludeFunc, error)</a>

```
searchKey: repos.excludeBuilder.Build
tags: [function private]
```

```Go
func (e *excludeBuilder) Build() (excludeFunc, error)
```

Build will return an excludeFunc based on the previous calls to Exact and Pattern. 

#### <a id="excludeBuilder.Exact" href="#excludeBuilder.Exact">func (e *excludeBuilder) Exact(name string)</a>

```
searchKey: repos.excludeBuilder.Exact
tags: [method private]
```

```Go
func (e *excludeBuilder) Exact(name string)
```

Exact will case-insensitively exclude the string name. 

#### <a id="excludeBuilder.Pattern" href="#excludeBuilder.Pattern">func (e *excludeBuilder) Pattern(pattern string)</a>

```
searchKey: repos.excludeBuilder.Pattern
tags: [method private]
```

```Go
func (e *excludeBuilder) Pattern(pattern string)
```

Pattern will exclude strings matching the regex pattern. 

### <a id="excludeFunc" href="#excludeFunc">type excludeFunc func(string) bool</a>

```
searchKey: repos.excludeFunc
tags: [function private]
```

```Go
type excludeFunc func(string) bool
```

excludeFunc takes a string and returns true if it should be excluded. In the case of repo sourcing it will take a repository name or ID as input. 

### <a id="externalServiceLister" href="#externalServiceLister">type externalServiceLister interface</a>

```
searchKey: repos.externalServiceLister
tags: [interface private]
```

```Go
type externalServiceLister interface {
	List(context.Context, database.ExternalServicesListOptions) ([]*types.ExternalService, error)
}
```

### <a id="externalServiceRepo" href="#externalServiceRepo">type externalServiceRepo struct</a>

```
searchKey: repos.externalServiceRepo
tags: [struct private]
```

```Go
type externalServiceRepo struct {
	ExternalServiceID int64  `json:"external_service_id"`
	RepoID            int64  `json:"repo_id"`
	CloneURL          string `json:"clone_url"`
}
```

### <a id="githubResult" href="#githubResult">type githubResult struct</a>

```
searchKey: repos.githubResult
tags: [struct private]
```

```Go
type githubResult struct {
	err  error
	repo *github.Repository
}
```

### <a id="multiSource" href="#multiSource">type multiSource interface</a>

```
searchKey: repos.multiSource
tags: [interface private]
```

```Go
type multiSource interface {
	Sources() []Source
}
```

### <a id="observedSource" href="#observedSource">type observedSource struct</a>

```
searchKey: repos.observedSource
tags: [struct private]
```

```Go
type observedSource struct {
	Source
	metrics SourceMetrics
	log     logging.ErrorLogger
}
```

An observedSource wraps another Source with error logging, Prometheus metrics and tracing. 

#### <a id="observedSource.ListRepos" href="#observedSource.ListRepos">func (o *observedSource) ListRepos(ctx context.Context, results chan SourceResult)</a>

```
searchKey: repos.observedSource.ListRepos
tags: [method private]
```

```Go
func (o *observedSource) ListRepos(ctx context.Context, results chan SourceResult)
```

ListRepos calls into the inner Source registers the observed results. 

### <a id="paginatedQuery" href="#paginatedQuery">type paginatedQuery func(cursor int64, limit int64) *github.com/keegancsmith/sqlf.Query</a>

```
searchKey: repos.paginatedQuery
tags: [function private]
```

```Go
type paginatedQuery func(cursor, limit int64) *sqlf.Query
```

a paginatedQuery returns a query with the given pagination parameters 

### <a id="priority" href="#priority">type priority int</a>

```
searchKey: repos.priority
tags: [number private]
```

```Go
type priority int
```

### <a id="recording" href="#recording">type recording struct</a>

```
searchKey: repos.recording
tags: [struct private]
```

```Go
type recording struct {
	notifications       []chan struct{}
	timeAfterFuncDelays []time.Duration
}
```

#### <a id="startRecording" href="#startRecording">func startRecording() (*recording, func())</a>

```
searchKey: repos.startRecording
tags: [function private]
```

```Go
func startRecording() (*recording, func())
```

### <a id="repoRecord" href="#repoRecord">type repoRecord struct</a>

```
searchKey: repos.repoRecord
tags: [struct private]
```

```Go
type repoRecord struct {
	ID                  api.RepoID      `json:"id"`
	Name                string          `json:"name"`
	URI                 *string         `json:"uri,omitempty"`
	Description         string          `json:"description"`
	CreatedAt           time.Time       `json:"created_at"`
	UpdatedAt           *time.Time      `json:"updated_at,omitempty"`
	DeletedAt           *time.Time      `json:"deleted_at,omitempty"`
	ExternalServiceType *string         `json:"external_service_type,omitempty"`
	ExternalServiceID   *string         `json:"external_service_id,omitempty"`
	ExternalID          *string         `json:"external_id,omitempty"`
	Archived            bool            `json:"archived"`
	Fork                bool            `json:"fork"`
	Stars               int             `json:"stars"`
	Private             bool            `json:"private"`
	Metadata            json.RawMessage `json:"metadata"`
	Sources             json.RawMessage `json:"sources,omitempty"`
}
```

repoRecord is the json representation of a repository as used in this package Postgres CTEs. 

#### <a id="newRepoRecord" href="#newRepoRecord">func newRepoRecord(r *types.Repo) (*repoRecord, error)</a>

```
searchKey: repos.newRepoRecord
tags: [method private]
```

```Go
func newRepoRecord(r *types.Repo) (*repoRecord, error)
```

### <a id="repoUpdate" href="#repoUpdate">type repoUpdate struct</a>

```
searchKey: repos.repoUpdate
tags: [struct private]
```

```Go
type repoUpdate struct {
	Repo     configuredRepo
	Priority priority
	Seq      uint64 // the sequence number of the update
	Updating bool   // whether the repo has been acquired for update
	Index    int    `json:"-"` // the index in the heap
}
```

repoUpdate is a repository that has been queued for an update. 

### <a id="repositoryPager" href="#repositoryPager">type repositoryPager func(page int) (repos []*github.com/sourcegraph/sourcegraph/internal/extsvc/github.Repository, hasNext bool, cost int, err error)</a>

```
searchKey: repos.repositoryPager
tags: [function private]
```

```Go
type repositoryPager func(page int) (repos []*github.Repository, hasNext bool, cost int, err error)
```

repositoryPager is a function that returns repositories on a given `page`. It also returns: - `hasNext` bool: if there is a next page - `cost` int: rate limit cost used to determine recommended wait before next call - `err` error: if something goes wrong 

### <a id="scanFunc" href="#scanFunc">type scanFunc func(github.com/sourcegraph/sourcegraph/internal/repos.scanner) (last int64, count int64, err error)</a>

```
searchKey: repos.scanFunc
tags: [function private]
```

```Go
type scanFunc func(scanner) (last, count int64, err error)
```

a scanFunc scans one or more rows from a scanner, returning the last id column scanned and the count of scanned rows. 

### <a id="scanner" href="#scanner">type scanner interface</a>

```
searchKey: repos.scanner
tags: [interface private]
```

```Go
type scanner interface {
	Scan(dst ...interface{}) error
}
```

scanner captures the Scan method of sql.Rows and sql.Row 

### <a id="schedule" href="#schedule">type schedule struct</a>

```
searchKey: repos.schedule
tags: [struct private]
```

```Go
type schedule struct {
	mu sync.Mutex

	heap  []*scheduledRepoUpdate // min heap of scheduledRepoUpdates based on their due time.
	index map[api.RepoID]*scheduledRepoUpdate

	// timer sends a value on the wakeup channel when it is time
	timer  *time.Timer
	wakeup chan struct{}
}
```

schedule is the schedule of when repos get enqueued into the updateQueue. 

#### <a id="schedule.Len" href="#schedule.Len">func (s *schedule) Len() int</a>

```
searchKey: repos.schedule.Len
tags: [function private]
```

```Go
func (s *schedule) Len() int
```

#### <a id="schedule.Less" href="#schedule.Less">func (s *schedule) Less(i, j int) bool</a>

```
searchKey: repos.schedule.Less
tags: [method private]
```

```Go
func (s *schedule) Less(i, j int) bool
```

#### <a id="schedule.Pop" href="#schedule.Pop">func (s *schedule) Pop() interface{}</a>

```
searchKey: repos.schedule.Pop
tags: [function private]
```

```Go
func (s *schedule) Pop() interface{}
```

#### <a id="schedule.Push" href="#schedule.Push">func (s *schedule) Push(x interface{})</a>

```
searchKey: repos.schedule.Push
tags: [method private]
```

```Go
func (s *schedule) Push(x interface{})
```

#### <a id="schedule.Swap" href="#schedule.Swap">func (s *schedule) Swap(i, j int)</a>

```
searchKey: repos.schedule.Swap
tags: [method private]
```

```Go
func (s *schedule) Swap(i, j int)
```

#### <a id="schedule.getCurrentInterval" href="#schedule.getCurrentInterval">func (s *schedule) getCurrentInterval(repo configuredRepo) (time.Duration, bool)</a>

```
searchKey: repos.schedule.getCurrentInterval
tags: [method private]
```

```Go
func (s *schedule) getCurrentInterval(repo configuredRepo) (time.Duration, bool)
```

getCurrentInterval gets the current interval for the supplied repo and a bool indicating whether it was found. 

#### <a id="schedule.insertNew" href="#schedule.insertNew">func (s *schedule) insertNew(repos []types.RepoName)</a>

```
searchKey: repos.schedule.insertNew
tags: [method private]
```

```Go
func (s *schedule) insertNew(repos []types.RepoName)
```

insertNew will insert repos only if they are not known to the scheduler 

#### <a id="schedule.remove" href="#schedule.remove">func (s *schedule) remove(repo configuredRepo) (removed bool)</a>

```
searchKey: repos.schedule.remove
tags: [method private]
```

```Go
func (s *schedule) remove(repo configuredRepo) (removed bool)
```

remove removes a repo from the schedule. 

#### <a id="schedule.rescheduleTimer" href="#schedule.rescheduleTimer">func (s *schedule) rescheduleTimer()</a>

```
searchKey: repos.schedule.rescheduleTimer
tags: [function private]
```

```Go
func (s *schedule) rescheduleTimer()
```

rescheduleTimer schedules the scheduler to wakeup at the time that the next repo is due for an update. The caller must hold the lock on s.mu. 

#### <a id="schedule.reset" href="#schedule.reset">func (s *schedule) reset()</a>

```
searchKey: repos.schedule.reset
tags: [function private]
```

```Go
func (s *schedule) reset()
```

#### <a id="schedule.setCloned" href="#schedule.setCloned">func (s *schedule) setCloned(names []string)</a>

```
searchKey: repos.schedule.setCloned
tags: [method private]
```

```Go
func (s *schedule) setCloned(names []string)
```

#### <a id="schedule.updateInterval" href="#schedule.updateInterval">func (s *schedule) updateInterval(repo configuredRepo, interval time.Duration)</a>

```
searchKey: repos.schedule.updateInterval
tags: [method private]
```

```Go
func (s *schedule) updateInterval(repo configuredRepo, interval time.Duration)
```

updateInterval updates the update interval of a repo in the schedule. It does nothing if the repo is not in the schedule. 

#### <a id="schedule.upsert" href="#schedule.upsert">func (s *schedule) upsert(repo configuredRepo) (updated bool)</a>

```
searchKey: repos.schedule.upsert
tags: [method private]
```

```Go
func (s *schedule) upsert(repo configuredRepo) (updated bool)
```

upsert inserts or updates a repo in the schedule. 

### <a id="scheduledRepoUpdate" href="#scheduledRepoUpdate">type scheduledRepoUpdate struct</a>

```
searchKey: repos.scheduledRepoUpdate
tags: [struct private]
```

```Go
type scheduledRepoUpdate struct {
	Repo     configuredRepo // the repo to update
	Interval time.Duration  // how regularly the repo is updated
	Due      time.Time      // the next time that the repo will be enqueued for a update
	Index    int            `json:"-"` // the index in the heap
}
```

scheduledRepoUpdate is the update schedule for a single repo. 

### <a id="schedulerConfig" href="#schedulerConfig">type schedulerConfig struct</a>

```
searchKey: repos.schedulerConfig
tags: [struct private]
```

```Go
type schedulerConfig struct {
	running               bool
	autoGitUpdatesEnabled bool
}
```

schedulerConfig tracks the active scheduler configuration. 

### <a id="sourceDiff" href="#sourceDiff">type sourceDiff struct</a>

```
searchKey: repos.sourceDiff
tags: [struct private]
```

```Go
type sourceDiff struct {
	Added, Modified, Deleted map[api.RepoID][]types.SourceInfo
}
```

### <a id="stubBadHTTPRedirectTransport" href="#stubBadHTTPRedirectTransport">type stubBadHTTPRedirectTransport struct</a>

```
searchKey: repos.stubBadHTTPRedirectTransport
tags: [struct private]
```

```Go
type stubBadHTTPRedirectTransport struct {
	tr http.RoundTripper
}
```

#### <a id="stubBadHTTPRedirectTransport.RoundTrip" href="#stubBadHTTPRedirectTransport.RoundTrip">func (t stubBadHTTPRedirectTransport) RoundTrip(r *http.Request) (*http.Response, error)</a>

```
searchKey: repos.stubBadHTTPRedirectTransport.RoundTrip
tags: [method private]
```

```Go
func (t stubBadHTTPRedirectTransport) RoundTrip(r *http.Request) (*http.Response, error)
```

#### <a id="stubBadHTTPRedirectTransport.UnwrappableTransport" href="#stubBadHTTPRedirectTransport.UnwrappableTransport">func (stubBadHTTPRedirectTransport) UnwrappableTransport()</a>

```
searchKey: repos.stubBadHTTPRedirectTransport.UnwrappableTransport
tags: [function private]
```

```Go
func (stubBadHTTPRedirectTransport) UnwrappableTransport()
```

UnwrappableTransport signals that this transport can't be wrapped. In particular this means we won't respect global external settings. [https://github.com/sourcegraph/sourcegraph/issues/71](https://github.com/sourcegraph/sourcegraph/issues/71) and [https://github.com/sourcegraph/sourcegraph/issues/7738](https://github.com/sourcegraph/sourcegraph/issues/7738) 

### <a id="syncHandler" href="#syncHandler">type syncHandler struct</a>

```
searchKey: repos.syncHandler
tags: [struct private]
```

```Go
type syncHandler struct {
	db              *sql.DB
	syncer          *Syncer
	store           *Store
	minSyncInterval func() time.Duration
}
```

#### <a id="syncHandler.Handle" href="#syncHandler.Handle">func (s *syncHandler) Handle(ctx context.Context, tx dbworkerstore.Store, record workerutil.Record) (err error)</a>

```
searchKey: repos.syncHandler.Handle
tags: [method private]
```

```Go
func (s *syncHandler) Handle(ctx context.Context, tx dbworkerstore.Store, record workerutil.Record) (err error)
```

### <a id="updateQueue" href="#updateQueue">type updateQueue struct</a>

```
searchKey: repos.updateQueue
tags: [struct private]
```

```Go
type updateQueue struct {
	mu sync.Mutex

	heap  []*repoUpdate
	index map[api.RepoID]*repoUpdate

	seq uint64

	// The queue performs a non-blocking send on this channel
	// when a new value is enqueued so that the update loop
	// can wake up if it is idle.
	notifyEnqueue chan struct{}
}
```

updateQueue is a priority queue of repos to update. A repo can't have more than one location in the queue. 

#### <a id="updateQueue.Len" href="#updateQueue.Len">func (q *updateQueue) Len() int</a>

```
searchKey: repos.updateQueue.Len
tags: [function private]
```

```Go
func (q *updateQueue) Len() int
```

#### <a id="updateQueue.Less" href="#updateQueue.Less">func (q *updateQueue) Less(i, j int) bool</a>

```
searchKey: repos.updateQueue.Less
tags: [method private]
```

```Go
func (q *updateQueue) Less(i, j int) bool
```

#### <a id="updateQueue.Pop" href="#updateQueue.Pop">func (q *updateQueue) Pop() interface{}</a>

```
searchKey: repos.updateQueue.Pop
tags: [function private]
```

```Go
func (q *updateQueue) Pop() interface{}
```

#### <a id="updateQueue.Push" href="#updateQueue.Push">func (q *updateQueue) Push(x interface{})</a>

```
searchKey: repos.updateQueue.Push
tags: [method private]
```

```Go
func (q *updateQueue) Push(x interface{})
```

#### <a id="updateQueue.Swap" href="#updateQueue.Swap">func (q *updateQueue) Swap(i, j int)</a>

```
searchKey: repos.updateQueue.Swap
tags: [method private]
```

```Go
func (q *updateQueue) Swap(i, j int)
```

#### <a id="updateQueue.acquireNext" href="#updateQueue.acquireNext">func (q *updateQueue) acquireNext() (configuredRepo, bool)</a>

```
searchKey: repos.updateQueue.acquireNext
tags: [function private]
```

```Go
func (q *updateQueue) acquireNext() (configuredRepo, bool)
```

acquireNext acquires the next repo for update. The acquired repo must be removed from the queue when the update finishes (independent of success or failure). 

#### <a id="updateQueue.enqueue" href="#updateQueue.enqueue">func (q *updateQueue) enqueue(repo configuredRepo, p priority) (updated bool)</a>

```
searchKey: repos.updateQueue.enqueue
tags: [method private]
```

```Go
func (q *updateQueue) enqueue(repo configuredRepo, p priority) (updated bool)
```

enqueue adds the repo to the queue with the given priority. 

If the repo is already in the queue and it isn't yet updating, the repo is updated. 

If the given priority is higher than the one in the queue, the repo's position in the queue is updated accordingly. 

#### <a id="updateQueue.nextSeq" href="#updateQueue.nextSeq">func (q *updateQueue) nextSeq() uint64</a>

```
searchKey: repos.updateQueue.nextSeq
tags: [function private]
```

```Go
func (q *updateQueue) nextSeq() uint64
```

nextSeq increments and returns the next sequence number. The caller must hold the lock on q.mu. 

#### <a id="updateQueue.remove" href="#updateQueue.remove">func (q *updateQueue) remove(repo configuredRepo, updating bool) (removed bool)</a>

```
searchKey: repos.updateQueue.remove
tags: [method private]
```

```Go
func (q *updateQueue) remove(repo configuredRepo, updating bool) (removed bool)
```

remove removes the repo from the queue if the repo.Updating matches the updating argument. 

#### <a id="updateQueue.reset" href="#updateQueue.reset">func (q *updateQueue) reset()</a>

```
searchKey: repos.updateQueue.reset
tags: [function private]
```

```Go
func (q *updateQueue) reset()
```

### <a id="updateScheduler" href="#updateScheduler">type updateScheduler struct</a>

```
searchKey: repos.updateScheduler
tags: [struct private]
```

```Go
type updateScheduler struct {
	updateQueue *updateQueue
	schedule    *schedule
}
```

updateScheduler schedules repo update (or clone) requests to gitserver. 

Repository metadata is synced from configured code hosts and added to the scheduler. 

Updates are scheduled based on the time that has elapsed since the last commit divided by a constant factor of 2. For example, if a repo's last commit was 8 hours ago then the next update will be scheduled 4 hours from now. If there are still no new commits, then the next update will be scheduled 6 hours from then. This heuristic is simple to compute and has nice backoff properties. 

If an error occurs when attempting to fetch a repo we perform exponential backoff by doubling the current interval. This ensures that problematic repos don't stay in the front of the schedule clogging up the queue. 

When it is time for a repo to update, the scheduler inserts the repo into a queue. 

A worker continuously dequeues repos and sends updates to gitserver, but its concurrency is limited by the gitMaxConcurrentClones site configuration. 

#### <a id="NewUpdateScheduler" href="#NewUpdateScheduler">func NewUpdateScheduler() *updateScheduler</a>

```
searchKey: repos.NewUpdateScheduler
tags: [function]
```

```Go
func NewUpdateScheduler() *updateScheduler
```

NewUpdateScheduler returns a new scheduler. 

#### <a id="updateScheduler.DebugDump" href="#updateScheduler.DebugDump">func (s *updateScheduler) DebugDump(ctx context.Context, db dbutil.DB) interface{}</a>

```
searchKey: repos.updateScheduler.DebugDump
tags: [method private]
```

```Go
func (s *updateScheduler) DebugDump(ctx context.Context, db dbutil.DB) interface{}
```

DebugDump returns the state of the update scheduler for debugging. 

#### <a id="updateScheduler.EnsureScheduled" href="#updateScheduler.EnsureScheduled">func (s *updateScheduler) EnsureScheduled(repos []types.RepoName)</a>

```
searchKey: repos.updateScheduler.EnsureScheduled
tags: [method private]
```

```Go
func (s *updateScheduler) EnsureScheduled(repos []types.RepoName)
```

EnsureScheduled ensures that all repos in repos exist in the scheduler. 

#### <a id="updateScheduler.ScheduleInfo" href="#updateScheduler.ScheduleInfo">func (s *updateScheduler) ScheduleInfo(id api.RepoID) *protocol.RepoUpdateSchedulerInfoResult</a>

```
searchKey: repos.updateScheduler.ScheduleInfo
tags: [method private]
```

```Go
func (s *updateScheduler) ScheduleInfo(id api.RepoID) *protocol.RepoUpdateSchedulerInfoResult
```

ScheduleInfo returns the current schedule info for a repo. 

#### <a id="updateScheduler.SetCloned" href="#updateScheduler.SetCloned">func (s *updateScheduler) SetCloned(names []string)</a>

```
searchKey: repos.updateScheduler.SetCloned
tags: [method private]
```

```Go
func (s *updateScheduler) SetCloned(names []string)
```

SetCloned will ensure only repos in names are treated as cloned. All other repositories in the scheduler will be marked as uncloned. 

This method should be called periodically with the list of all repositories cloned on gitserver. This ensures the scheduler treats uncloned repositories with a higher priority. 

#### <a id="updateScheduler.UpdateFromDiff" href="#updateScheduler.UpdateFromDiff">func (s *updateScheduler) UpdateFromDiff(diff Diff)</a>

```
searchKey: repos.updateScheduler.UpdateFromDiff
tags: [method private]
```

```Go
func (s *updateScheduler) UpdateFromDiff(diff Diff)
```

UpdateFromDiff updates the scheduled and queued repos from the given sync diff. 

We upsert all repos that exist to the scheduler. This is so the scheduler can track the repositories and periodically update them. 

Items on the update queue will be cloned/fetched as soon as possible. We treat repos differently depending on which part of the diff they are: 

```
Deleted    - remove from scheduler and queue.
Added      - new repo, enqueue for asap clone.
Modified   - likely new url or name. May also be a sign of new
             commits. Enqueue for asap clone (or fetch).
Unmodified - we likely already have this cloned. Just rely on
             the scheduler and do not enqueue.

```
#### <a id="updateScheduler.UpdateOnce" href="#updateScheduler.UpdateOnce">func (s *updateScheduler) UpdateOnce(id api.RepoID, name api.RepoName)</a>

```
searchKey: repos.updateScheduler.UpdateOnce
tags: [method private]
```

```Go
func (s *updateScheduler) UpdateOnce(id api.RepoID, name api.RepoName)
```

UpdateOnce causes a single update of the given repository. It neither adds nor removes the repo from the schedule. 

#### <a id="updateScheduler.remove" href="#updateScheduler.remove">func (s *updateScheduler) remove(r *types.Repo)</a>

```
searchKey: repos.updateScheduler.remove
tags: [method private]
```

```Go
func (s *updateScheduler) remove(r *types.Repo)
```

#### <a id="updateScheduler.runSchedule" href="#updateScheduler.runSchedule">func (s *updateScheduler) runSchedule()</a>

```
searchKey: repos.updateScheduler.runSchedule
tags: [function private]
```

```Go
func (s *updateScheduler) runSchedule()
```

#### <a id="updateScheduler.runScheduleLoop" href="#updateScheduler.runScheduleLoop">func (s *updateScheduler) runScheduleLoop(ctx context.Context)</a>

```
searchKey: repos.updateScheduler.runScheduleLoop
tags: [method private]
```

```Go
func (s *updateScheduler) runScheduleLoop(ctx context.Context)
```

runScheduleLoop starts the loop that schedules updates by enqueuing them into the updateQueue. 

#### <a id="updateScheduler.runUpdateLoop" href="#updateScheduler.runUpdateLoop">func (s *updateScheduler) runUpdateLoop(ctx context.Context)</a>

```
searchKey: repos.updateScheduler.runUpdateLoop
tags: [method private]
```

```Go
func (s *updateScheduler) runUpdateLoop(ctx context.Context)
```

runUpdateLoop sends repo update requests to gitserver. 

#### <a id="updateScheduler.upsert" href="#updateScheduler.upsert">func (s *updateScheduler) upsert(r *types.Repo, enqueue bool)</a>

```
searchKey: repos.updateScheduler.upsert
tags: [method private]
```

```Go
func (s *updateScheduler) upsert(r *types.Repo, enqueue bool)
```

upsert adds r to the scheduler for periodic updates. If r.ID is already in the scheduler, then the fields are updated (upsert). 

If enqueue is true then r is also enqueued to the update queue for a git fetch/clone soon. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="CloneURL" href="#CloneURL">func CloneURL(kind, config string, repo *types.Repo) (string, error)</a>

```
searchKey: repos.CloneURL
tags: [method]
```

```Go
func CloneURL(kind, config string, repo *types.Repo) (string, error)
```

CloneURL builds a cloneURL for the given repo based on the external service configuration. If authentication information is found in the configuration, it returns an authenticated URL for the selected code host. 

### <a id="ConfRepoConcurrentExternalServiceSyncers" href="#ConfRepoConcurrentExternalServiceSyncers">func ConfRepoConcurrentExternalServiceSyncers() int</a>

```
searchKey: repos.ConfRepoConcurrentExternalServiceSyncers
tags: [function]
```

```Go
func ConfRepoConcurrentExternalServiceSyncers() int
```

### <a id="ConfRepoListUpdateInterval" href="#ConfRepoListUpdateInterval">func ConfRepoListUpdateInterval() time.Duration</a>

```
searchKey: repos.ConfRepoListUpdateInterval
tags: [function]
```

```Go
func ConfRepoListUpdateInterval() time.Duration
```

### <a id="FetchStatusMessages" href="#FetchStatusMessages">func FetchStatusMessages(ctx context.Context, db dbutil.DB, u *types.User, cloud bool) ([]StatusMessage, error)</a>

```
searchKey: repos.FetchStatusMessages
tags: [method]
```

```Go
func FetchStatusMessages(ctx context.Context, db dbutil.DB, u *types.User, cloud bool) ([]StatusMessage, error)
```

FetchStatusMessages fetches repo related status messages. When fetching external service sync errors we'll fetch any external services owned by the user. In addition, if the user is a site admin we'll also fetch site level external services. 

### <a id="GrantedScopes" href="#GrantedScopes">func GrantedScopes(ctx context.Context, cache ScopeCache, svc *types.ExternalService) ([]string, error)</a>

```
searchKey: repos.GrantedScopes
tags: [method]
```

```Go
func GrantedScopes(ctx context.Context, cache ScopeCache, svc *types.ExternalService) ([]string, error)
```

GrantedScopes returns a slice of scopes granted by the service based on the token provided in the config. It makes a request to the code host but responses are cached in Redis based on the token. 

Currently only GitHub and GitLab user added external services are supported, other code hosts will simply return an empty slice 

### <a id="MustRegisterMetrics" href="#MustRegisterMetrics">func MustRegisterMetrics(db dbutil.DB, sourcegraphDotCom bool)</a>

```
searchKey: repos.MustRegisterMetrics
tags: [method]
```

```Go
func MustRegisterMetrics(db dbutil.DB, sourcegraphDotCom bool)
```

### <a id="NewSyncWorker" href="#NewSyncWorker">func NewSyncWorker(ctx context.Context, db dbutil.DB, handler dbworker.Handler, opts SyncWorkerOptions) (*workerutil.Worker, *dbworker.Resetter)</a>

```
searchKey: repos.NewSyncWorker
tags: [method]
```

```Go
func NewSyncWorker(ctx context.Context, db dbutil.DB, handler dbworker.Handler, opts SyncWorkerOptions) (*workerutil.Worker, *dbworker.Resetter)
```

NewSyncWorker creates a new external service sync worker. 

### <a id="ObservedSource" href="#ObservedSource">func ObservedSource(l logging.ErrorLogger, m SourceMetrics) func(Source) Source</a>

```
searchKey: repos.ObservedSource
tags: [method]
```

```Go
func ObservedSource(l logging.ErrorLogger, m SourceMetrics) func(Source) Source
```

ObservedSource returns a decorator that wraps a Source with error logging, Prometheus metrics and tracing. 

### <a id="RunPhabricatorRepositorySyncWorker" href="#RunPhabricatorRepositorySyncWorker">func RunPhabricatorRepositorySyncWorker(ctx context.Context, s *Store)</a>

```
searchKey: repos.RunPhabricatorRepositorySyncWorker
tags: [method]
```

```Go
func RunPhabricatorRepositorySyncWorker(ctx context.Context, s *Store)
```

RunPhabricatorRepositorySyncWorker runs the worker that syncs repositories from Phabricator to Sourcegraph 

### <a id="RunRepositoryPurgeWorker" href="#RunRepositoryPurgeWorker">func RunRepositoryPurgeWorker(ctx context.Context)</a>

```
searchKey: repos.RunRepositoryPurgeWorker
tags: [method]
```

```Go
func RunRepositoryPurgeWorker(ctx context.Context)
```

RunRepositoryPurgeWorker is a worker which deletes repos which are present on gitserver, but not enabled/present in our repos table. 

### <a id="RunScheduler" href="#RunScheduler">func RunScheduler(ctx context.Context, scheduler *updateScheduler)</a>

```
searchKey: repos.RunScheduler
tags: [method]
```

```Go
func RunScheduler(ctx context.Context, scheduler *updateScheduler)
```

RunScheduler runs the worker that schedules git fetches of synced repositories in git-server. 

### <a id="TestAWSCodeCloneURLs" href="#TestAWSCodeCloneURLs">func TestAWSCodeCloneURLs(t *testing.T)</a>

```
searchKey: repos.TestAWSCodeCloneURLs
tags: [method private test]
```

```Go
func TestAWSCodeCloneURLs(t *testing.T)
```

### <a id="TestAWSCodeCommitSource_Exclude" href="#TestAWSCodeCommitSource_Exclude">func TestAWSCodeCommitSource_Exclude(t *testing.T)</a>

```
searchKey: repos.TestAWSCodeCommitSource_Exclude
tags: [method private test]
```

```Go
func TestAWSCodeCommitSource_Exclude(t *testing.T)
```

### <a id="TestBitbucketCloudCloneURLs" href="#TestBitbucketCloudCloneURLs">func TestBitbucketCloudCloneURLs(t *testing.T)</a>

```
searchKey: repos.TestBitbucketCloudCloneURLs
tags: [method private test]
```

```Go
func TestBitbucketCloudCloneURLs(t *testing.T)
```

### <a id="TestBitbucketCloudSource_Exclude" href="#TestBitbucketCloudSource_Exclude">func TestBitbucketCloudSource_Exclude(t *testing.T)</a>

```
searchKey: repos.TestBitbucketCloudSource_Exclude
tags: [method private test]
```

```Go
func TestBitbucketCloudSource_Exclude(t *testing.T)
```

### <a id="TestBitbucketCloudSource_ListRepos" href="#TestBitbucketCloudSource_ListRepos">func TestBitbucketCloudSource_ListRepos(t *testing.T)</a>

```
searchKey: repos.TestBitbucketCloudSource_ListRepos
tags: [method private test]
```

```Go
func TestBitbucketCloudSource_ListRepos(t *testing.T)
```

### <a id="TestBitbucketCloudSource_makeRepo" href="#TestBitbucketCloudSource_makeRepo">func TestBitbucketCloudSource_makeRepo(t *testing.T)</a>

```
searchKey: repos.TestBitbucketCloudSource_makeRepo
tags: [method private test]
```

```Go
func TestBitbucketCloudSource_makeRepo(t *testing.T)
```

### <a id="TestBitbucketServerCloneURLs" href="#TestBitbucketServerCloneURLs">func TestBitbucketServerCloneURLs(t *testing.T)</a>

```
searchKey: repos.TestBitbucketServerCloneURLs
tags: [method private test]
```

```Go
func TestBitbucketServerCloneURLs(t *testing.T)
```

### <a id="TestBitbucketServerSource_Exclude" href="#TestBitbucketServerSource_Exclude">func TestBitbucketServerSource_Exclude(t *testing.T)</a>

```
searchKey: repos.TestBitbucketServerSource_Exclude
tags: [method private test]
```

```Go
func TestBitbucketServerSource_Exclude(t *testing.T)
```

### <a id="TestBitbucketServerSource_MakeRepo" href="#TestBitbucketServerSource_MakeRepo">func TestBitbucketServerSource_MakeRepo(t *testing.T)</a>

```
searchKey: repos.TestBitbucketServerSource_MakeRepo
tags: [method private test]
```

```Go
func TestBitbucketServerSource_MakeRepo(t *testing.T)
```

### <a id="TestBitbucketServerSource_WithAuthenticator" href="#TestBitbucketServerSource_WithAuthenticator">func TestBitbucketServerSource_WithAuthenticator(t *testing.T)</a>

```
searchKey: repos.TestBitbucketServerSource_WithAuthenticator
tags: [method private test]
```

```Go
func TestBitbucketServerSource_WithAuthenticator(t *testing.T)
```

### <a id="TestExampleRepositoryQuerySplit" href="#TestExampleRepositoryQuerySplit">func TestExampleRepositoryQuerySplit(t *testing.T)</a>

```
searchKey: repos.TestExampleRepositoryQuerySplit
tags: [method private test]
```

```Go
func TestExampleRepositoryQuerySplit(t *testing.T)
```

### <a id="TestGetCustomInterval" href="#TestGetCustomInterval">func TestGetCustomInterval(t *testing.T)</a>

```
searchKey: repos.TestGetCustomInterval
tags: [method private test]
```

```Go
func TestGetCustomInterval(t *testing.T)
```

### <a id="TestGitHubCloneURLs" href="#TestGitHubCloneURLs">func TestGitHubCloneURLs(t *testing.T)</a>

```
searchKey: repos.TestGitHubCloneURLs
tags: [method private test]
```

```Go
func TestGitHubCloneURLs(t *testing.T)
```

### <a id="TestGitLabCloneURLs" href="#TestGitLabCloneURLs">func TestGitLabCloneURLs(t *testing.T)</a>

```
searchKey: repos.TestGitLabCloneURLs
tags: [method private test]
```

```Go
func TestGitLabCloneURLs(t *testing.T)
```

### <a id="TestGitLabSource_GetRepo" href="#TestGitLabSource_GetRepo">func TestGitLabSource_GetRepo(t *testing.T)</a>

```
searchKey: repos.TestGitLabSource_GetRepo
tags: [method private test]
```

```Go
func TestGitLabSource_GetRepo(t *testing.T)
```

### <a id="TestGitLabSource_WithAuthenticator" href="#TestGitLabSource_WithAuthenticator">func TestGitLabSource_WithAuthenticator(t *testing.T)</a>

```
searchKey: repos.TestGitLabSource_WithAuthenticator
tags: [method private test]
```

```Go
func TestGitLabSource_WithAuthenticator(t *testing.T)
```

### <a id="TestGitLabSource_makeRepo" href="#TestGitLabSource_makeRepo">func TestGitLabSource_makeRepo(t *testing.T)</a>

```
searchKey: repos.TestGitLabSource_makeRepo
tags: [method private test]
```

```Go
func TestGitLabSource_makeRepo(t *testing.T)
```

### <a id="TestGithubSource_GetRepo" href="#TestGithubSource_GetRepo">func TestGithubSource_GetRepo(t *testing.T)</a>

```
searchKey: repos.TestGithubSource_GetRepo
tags: [method private test]
```

```Go
func TestGithubSource_GetRepo(t *testing.T)
```

### <a id="TestGithubSource_ListRepos" href="#TestGithubSource_ListRepos">func TestGithubSource_ListRepos(t *testing.T)</a>

```
searchKey: repos.TestGithubSource_ListRepos
tags: [method private test]
```

```Go
func TestGithubSource_ListRepos(t *testing.T)
```

### <a id="TestGithubSource_WithAuthenticator" href="#TestGithubSource_WithAuthenticator">func TestGithubSource_WithAuthenticator(t *testing.T)</a>

```
searchKey: repos.TestGithubSource_WithAuthenticator
tags: [method private test]
```

```Go
func TestGithubSource_WithAuthenticator(t *testing.T)
```

### <a id="TestGithubSource_excludes_disabledAndLocked" href="#TestGithubSource_excludes_disabledAndLocked">func TestGithubSource_excludes_disabledAndLocked(t *testing.T)</a>

```
searchKey: repos.TestGithubSource_excludes_disabledAndLocked
tags: [method private test]
```

```Go
func TestGithubSource_excludes_disabledAndLocked(t *testing.T)
```

### <a id="TestGithubSource_makeRepo" href="#TestGithubSource_makeRepo">func TestGithubSource_makeRepo(t *testing.T)</a>

```
searchKey: repos.TestGithubSource_makeRepo
tags: [method private test]
```

```Go
func TestGithubSource_makeRepo(t *testing.T)
```

### <a id="TestGrantedScopes" href="#TestGrantedScopes">func TestGrantedScopes(t *testing.T)</a>

```
searchKey: repos.TestGrantedScopes
tags: [method private test]
```

```Go
func TestGrantedScopes(t *testing.T)
```

### <a id="TestHashToken" href="#TestHashToken">func TestHashToken(t *testing.T)</a>

```
searchKey: repos.TestHashToken
tags: [method private test]
```

```Go
func TestHashToken(t *testing.T)
```

### <a id="TestIsSaturdayNight" href="#TestIsSaturdayNight">func TestIsSaturdayNight(t *testing.T)</a>

```
searchKey: repos.TestIsSaturdayNight
tags: [method private test]
```

```Go
func TestIsSaturdayNight(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: repos.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestMatchOrg" href="#TestMatchOrg">func TestMatchOrg(t *testing.T)</a>

```
searchKey: repos.TestMatchOrg
tags: [method private test]
```

```Go
func TestMatchOrg(t *testing.T)
```

### <a id="TestNewSourcer" href="#TestNewSourcer">func TestNewSourcer(t *testing.T)</a>

```
searchKey: repos.TestNewSourcer
tags: [method private test]
```

```Go
func TestNewSourcer(t *testing.T)
```

### <a id="TestPerforceCloneURL" href="#TestPerforceCloneURL">func TestPerforceCloneURL(t *testing.T)</a>

```
searchKey: repos.TestPerforceCloneURL
tags: [method private test]
```

```Go
func TestPerforceCloneURL(t *testing.T)
```

### <a id="TestPerforceSource_ListRepos" href="#TestPerforceSource_ListRepos">func TestPerforceSource_ListRepos(t *testing.T)</a>

```
searchKey: repos.TestPerforceSource_ListRepos
tags: [method private test]
```

```Go
func TestPerforceSource_ListRepos(t *testing.T)
```

### <a id="TestPerforceSource_makeRepo" href="#TestPerforceSource_makeRepo">func TestPerforceSource_makeRepo(t *testing.T)</a>

```
searchKey: repos.TestPerforceSource_makeRepo
tags: [method private test]
```

```Go
func TestPerforceSource_makeRepo(t *testing.T)
```

### <a id="TestPhabricatorCloneURL" href="#TestPhabricatorCloneURL">func TestPhabricatorCloneURL(t *testing.T)</a>

```
searchKey: repos.TestPhabricatorCloneURL
tags: [method private test]
```

```Go
func TestPhabricatorCloneURL(t *testing.T)
```

### <a id="TestPick" href="#TestPick">func TestPick(t *testing.T)</a>

```
searchKey: repos.TestPick
tags: [method private test]
```

```Go
func TestPick(t *testing.T)
```

Our uses of pick happen from iterating through a map. So we can't guarantee that we test both pick(a, b) and pick(b, a) without writing this specific test. 

### <a id="TestProjectQueryToURL" href="#TestProjectQueryToURL">func TestProjectQueryToURL(t *testing.T)</a>

```
searchKey: repos.TestProjectQueryToURL
tags: [method private test]
```

```Go
func TestProjectQueryToURL(t *testing.T)
```

### <a id="TestReposNamesSummary" href="#TestReposNamesSummary">func TestReposNamesSummary(t *testing.T)</a>

```
searchKey: repos.TestReposNamesSummary
tags: [method private test]
```

```Go
func TestReposNamesSummary(t *testing.T)
```

### <a id="TestScheduleInsertNew" href="#TestScheduleInsertNew">func TestScheduleInsertNew(t *testing.T)</a>

```
searchKey: repos.TestScheduleInsertNew
tags: [method private test]
```

```Go
func TestScheduleInsertNew(t *testing.T)
```

### <a id="TestSchedule_remove" href="#TestSchedule_remove">func TestSchedule_remove(t *testing.T)</a>

```
searchKey: repos.TestSchedule_remove
tags: [method private test]
```

```Go
func TestSchedule_remove(t *testing.T)
```

### <a id="TestSchedule_updateInterval" href="#TestSchedule_updateInterval">func TestSchedule_updateInterval(t *testing.T)</a>

```
searchKey: repos.TestSchedule_updateInterval
tags: [method private test]
```

```Go
func TestSchedule_updateInterval(t *testing.T)
```

### <a id="TestSchedule_upsert" href="#TestSchedule_upsert">func TestSchedule_upsert(t *testing.T)</a>

```
searchKey: repos.TestSchedule_upsert
tags: [method private test]
```

```Go
func TestSchedule_upsert(t *testing.T)
```

### <a id="TestSetUserinfoBestEffort" href="#TestSetUserinfoBestEffort">func TestSetUserinfoBestEffort(t *testing.T)</a>

```
searchKey: repos.TestSetUserinfoBestEffort
tags: [method private test]
```

```Go
func TestSetUserinfoBestEffort(t *testing.T)
```

### <a id="TestSources_ListRepos" href="#TestSources_ListRepos">func TestSources_ListRepos(t *testing.T)</a>

```
searchKey: repos.TestSources_ListRepos
tags: [method private test]
```

```Go
func TestSources_ListRepos(t *testing.T)
```

### <a id="TestSrcExpose" href="#TestSrcExpose">func TestSrcExpose(t *testing.T)</a>

```
searchKey: repos.TestSrcExpose
tags: [method private test]
```

```Go
func TestSrcExpose(t *testing.T)
```

### <a id="TestStatusMessages" href="#TestStatusMessages">func TestStatusMessages(t *testing.T)</a>

```
searchKey: repos.TestStatusMessages
tags: [method private test]
```

```Go
func TestStatusMessages(t *testing.T)
```

### <a id="TestSyncRateLimiters" href="#TestSyncRateLimiters">func TestSyncRateLimiters(t *testing.T)</a>

```
searchKey: repos.TestSyncRateLimiters
tags: [method private test]
```

```Go
func TestSyncRateLimiters(t *testing.T)
```

### <a id="TestUpdateQueue_acquireNext" href="#TestUpdateQueue_acquireNext">func TestUpdateQueue_acquireNext(t *testing.T)</a>

```
searchKey: repos.TestUpdateQueue_acquireNext
tags: [method private test]
```

```Go
func TestUpdateQueue_acquireNext(t *testing.T)
```

### <a id="TestUpdateQueue_enqueue" href="#TestUpdateQueue_enqueue">func TestUpdateQueue_enqueue(t *testing.T)</a>

```
searchKey: repos.TestUpdateQueue_enqueue
tags: [method private test]
```

```Go
func TestUpdateQueue_enqueue(t *testing.T)
```

### <a id="TestUpdateQueue_remove" href="#TestUpdateQueue_remove">func TestUpdateQueue_remove(t *testing.T)</a>

```
searchKey: repos.TestUpdateQueue_remove
tags: [method private test]
```

```Go
func TestUpdateQueue_remove(t *testing.T)
```

### <a id="TestUpdateQueue_setCloned" href="#TestUpdateQueue_setCloned">func TestUpdateQueue_setCloned(t *testing.T)</a>

```
searchKey: repos.TestUpdateQueue_setCloned
tags: [method private test]
```

```Go
func TestUpdateQueue_setCloned(t *testing.T)
```

### <a id="TestUpdateScheduler_runSchedule" href="#TestUpdateScheduler_runSchedule">func TestUpdateScheduler_runSchedule(t *testing.T)</a>

```
searchKey: repos.TestUpdateScheduler_runSchedule
tags: [method private test]
```

```Go
func TestUpdateScheduler_runSchedule(t *testing.T)
```

### <a id="TestUpdateScheduler_runUpdateLoop" href="#TestUpdateScheduler_runUpdateLoop">func TestUpdateScheduler_runUpdateLoop(t *testing.T)</a>

```
searchKey: repos.TestUpdateScheduler_runUpdateLoop
tags: [method private test]
```

```Go
func TestUpdateScheduler_runUpdateLoop(t *testing.T)
```

### <a id="Test_updateQueue_Less" href="#Test_updateQueue_Less">func Test_updateQueue_Less(t *testing.T)</a>

```
searchKey: repos.Test_updateQueue_Less
tags: [method private test]
```

```Go
func Test_updateQueue_Less(t *testing.T)
```

### <a id="Test_updateScheduler_UpdateFromDiff" href="#Test_updateScheduler_UpdateFromDiff">func Test_updateScheduler_UpdateFromDiff(t *testing.T)</a>

```
searchKey: repos.Test_updateScheduler_UpdateFromDiff
tags: [method private test]
```

```Go
func Test_updateScheduler_UpdateFromDiff(t *testing.T)
```

### <a id="awsCodeCloneURL" href="#awsCodeCloneURL">func awsCodeCloneURL(repo *awscodecommit.Repository, cfg *schema.AWSCodeCommitConnection) string</a>

```
searchKey: repos.awsCodeCloneURL
tags: [method private]
```

```Go
func awsCodeCloneURL(repo *awscodecommit.Repository, cfg *schema.AWSCodeCommitConnection) string
```

### <a id="batchReposQuery" href="#batchReposQuery">func batchReposQuery(fmtstr string, repos []*types.Repo) (_ *sqlf.Query, err error)</a>

```
searchKey: repos.batchReposQuery
tags: [method private]
```

```Go
func batchReposQuery(fmtstr string, repos []*types.Repo) (_ *sqlf.Query, err error)
```

### <a id="bitbucketCloudCloneURL" href="#bitbucketCloudCloneURL">func bitbucketCloudCloneURL(repo *bitbucketcloud.Repo, cfg *schema.BitbucketCloudConnection) string</a>

```
searchKey: repos.bitbucketCloudCloneURL
tags: [method private]
```

```Go
func bitbucketCloudCloneURL(repo *bitbucketcloud.Repo, cfg *schema.BitbucketCloudConnection) string
```

bitbucketCloudCloneURL returns the repository's Git remote URL with the configured Bitbucket Cloud app password inserted in the URL userinfo. 

### <a id="bitbucketServerCloneURL" href="#bitbucketServerCloneURL">func bitbucketServerCloneURL(repo *bitbucketserver.Repo, cfg *schema.BitbucketServerConnection) string</a>

```
searchKey: repos.bitbucketServerCloneURL
tags: [method private]
```

```Go
func bitbucketServerCloneURL(repo *bitbucketserver.Repo, cfg *schema.BitbucketServerConnection) string
```

### <a id="calcSyncInterval" href="#calcSyncInterval">func calcSyncInterval(now time.Time, lastSync time.Time, minSyncInterval time.Duration, diff Diff) time.Duration</a>

```
searchKey: repos.calcSyncInterval
tags: [method private]
```

```Go
func calcSyncInterval(now time.Time, lastSync time.Time, minSyncInterval time.Duration, diff Diff) time.Duration
```

### <a id="closeErr" href="#closeErr">func closeErr(c io.Closer, err *error)</a>

```
searchKey: repos.closeErr
tags: [method private]
```

```Go
func closeErr(c io.Closer, err *error)
```

### <a id="composePerforceCloneURL" href="#composePerforceCloneURL">func composePerforceCloneURL(host, depot string) string</a>

```
searchKey: repos.composePerforceCloneURL
tags: [method private]
```

```Go
func composePerforceCloneURL(host, depot string) string
```

composePerforceCloneURL composes a clone URL for a Perforce depot based on given information. e.g. perforce://ssl:111.222.333.444:1666//Sourcegraph/ 

### <a id="exampleRepositoryQuerySplit" href="#exampleRepositoryQuerySplit">func exampleRepositoryQuerySplit(q string) string</a>

```
searchKey: repos.exampleRepositoryQuerySplit
tags: [method private]
```

```Go
func exampleRepositoryQuerySplit(q string) string
```

### <a id="getAWSEnv" href="#getAWSEnv">func getAWSEnv(envVar string) string</a>

```
searchKey: repos.getAWSEnv
tags: [method private]
```

```Go
func getAWSEnv(envVar string) string
```

### <a id="getCustomInterval" href="#getCustomInterval">func getCustomInterval(c *conf.Unified, repoName string) time.Duration</a>

```
searchKey: repos.getCustomInterval
tags: [method private]
```

```Go
func getCustomInterval(c *conf.Unified, repoName string) time.Duration
```

### <a id="getRepoNoun" href="#getRepoNoun">func getRepoNoun(count int) string</a>

```
searchKey: repos.getRepoNoun
tags: [method private]
```

```Go
func getRepoNoun(count int) string
```

### <a id="githubCloneURL" href="#githubCloneURL">func githubCloneURL(repo *github.Repository, cfg *schema.GitHubConnection) (string, error)</a>

```
searchKey: repos.githubCloneURL
tags: [method private]
```

```Go
func githubCloneURL(repo *github.Repository, cfg *schema.GitHubConnection) (string, error)
```

### <a id="githubGraphQLFailureMiddleware" href="#githubGraphQLFailureMiddleware">func githubGraphQLFailureMiddleware(cli httpcli.Doer) httpcli.Doer</a>

```
searchKey: repos.githubGraphQLFailureMiddleware
tags: [method private]
```

```Go
func githubGraphQLFailureMiddleware(cli httpcli.Doer) httpcli.Doer
```

### <a id="gitlabCloneURL" href="#gitlabCloneURL">func gitlabCloneURL(repo *gitlab.Project, cfg *schema.GitLabConnection) string</a>

```
searchKey: repos.gitlabCloneURL
tags: [method private]
```

```Go
func gitlabCloneURL(repo *gitlab.Project, cfg *schema.GitLabConnection) string
```

authenticatedRemoteURL returns the GitLab project's Git remote URL with the configured GitLab personal access token inserted in the URL userinfo. 

### <a id="gitserverRedirectMiddleware" href="#gitserverRedirectMiddleware">func gitserverRedirectMiddleware(cli httpcli.Doer) httpcli.Doer</a>

```
searchKey: repos.gitserverRedirectMiddleware
tags: [method private]
```

```Go
func gitserverRedirectMiddleware(cli httpcli.Doer) httpcli.Doer
```

### <a id="group" href="#group">func group(srcs []Source) map[string]Sources</a>

```
searchKey: repos.group
tags: [method private]
```

```Go
func group(srcs []Source) map[string]Sources
```

### <a id="hashToken" href="#hashToken">func hashToken(token string) (string, error)</a>

```
searchKey: repos.hashToken
tags: [method private]
```

```Go
func hashToken(token string) (string, error)
```

### <a id="init.scheduler_test.go" href="#init.scheduler_test.go">func init()</a>

```
searchKey: repos.init
tags: [function private]
```

```Go
func init()
```

### <a id="isSaturdayNight" href="#isSaturdayNight">func isSaturdayNight(t time.Time) bool</a>

```
searchKey: repos.isSaturdayNight
tags: [method private]
```

```Go
func isSaturdayNight(t time.Time) bool
```

### <a id="limitedRedirect" href="#limitedRedirect">func limitedRedirect(r *http.Request, via []*http.Request) error</a>

```
searchKey: repos.limitedRedirect
tags: [method private]
```

```Go
func limitedRedirect(r *http.Request, via []*http.Request) error
```

### <a id="listAll" href="#listAll">func listAll(ctx context.Context, src Source, onSourced ...func(*types.Repo) error) ([]*types.Repo, error)</a>

```
searchKey: repos.listAll
tags: [method private]
```

```Go
func listAll(ctx context.Context, src Source, onSourced ...func(*types.Repo) error) ([]*types.Repo, error)
```

listAll calls ListRepos on the given Source and collects the SourceResults the Source sends over a channel into a slice of *types.Repo and a single error 

### <a id="marshalJSON" href="#marshalJSON">func marshalJSON(t testing.TB, v interface{}) string</a>

```
searchKey: repos.marshalJSON
tags: [method private]
```

```Go
func marshalJSON(t testing.TB, v interface{}) string
```

### <a id="matchOrg" href="#matchOrg">func matchOrg(q string) string</a>

```
searchKey: repos.matchOrg
tags: [method private]
```

```Go
func matchOrg(q string) string
```

matchOrg extracts the org name from the pattern `org:<org-name>` if it exists. 

### <a id="merge" href="#merge">func merge(o, n *types.Repo)</a>

```
searchKey: repos.merge
tags: [method private]
```

```Go
func merge(o, n *types.Repo)
```

### <a id="metadataColumn" href="#metadataColumn">func metadataColumn(metadata interface{}) (msg json.RawMessage, err error)</a>

```
searchKey: repos.metadataColumn
tags: [method private]
```

```Go
func metadataColumn(metadata interface{}) (msg json.RawMessage, err error)
```

### <a id="mockTime" href="#mockTime">func mockTime(t time.Time)</a>

```
searchKey: repos.mockTime
tags: [method private]
```

```Go
func mockTime(t time.Time)
```

### <a id="newClientFactory" href="#newClientFactory">func newClientFactory(t testing.TB, name string, mws ...httpcli.Middleware) (*httpcli.Factory, func(testing.TB))</a>

```
searchKey: repos.newClientFactory
tags: [method private]
```

```Go
func newClientFactory(t testing.TB, name string, mws ...httpcli.Middleware) (*httpcli.Factory, func(testing.TB))
```

### <a id="newRecorder" href="#newRecorder">func newRecorder(t testing.TB, file string, record bool) *recorder.Recorder</a>

```
searchKey: repos.newRecorder
tags: [method private]
```

```Go
func newRecorder(t testing.TB, file string, record bool) *recorder.Recorder
```

### <a id="newResetterMetrics" href="#newResetterMetrics">func newResetterMetrics(r prometheus.Registerer) dbworker.ResetterMetrics</a>

```
searchKey: repos.newResetterMetrics
tags: [method private]
```

```Go
func newResetterMetrics(r prometheus.Registerer) dbworker.ResetterMetrics
```

### <a id="newWorkerMetrics" href="#newWorkerMetrics">func newWorkerMetrics(r prometheus.Registerer) workerutil.WorkerMetrics</a>

```
searchKey: repos.newWorkerMetrics
tags: [method private]
```

```Go
func newWorkerMetrics(r prometheus.Registerer) workerutil.WorkerMetrics
```

### <a id="nullStringColumn" href="#nullStringColumn">func nullStringColumn(s string) *string</a>

```
searchKey: repos.nullStringColumn
tags: [method private]
```

```Go
func nullStringColumn(s string) *string
```

### <a id="nullTimeColumn" href="#nullTimeColumn">func nullTimeColumn(t time.Time) *time.Time</a>

```
searchKey: repos.nullTimeColumn
tags: [method private]
```

```Go
func nullTimeColumn(t time.Time) *time.Time
```

### <a id="otherCloneURL" href="#otherCloneURL">func otherCloneURL(repo *types.Repo, m *extsvc.OtherRepoMetadata) string</a>

```
searchKey: repos.otherCloneURL
tags: [method private]
```

```Go
func otherCloneURL(repo *types.Repo, m *extsvc.OtherRepoMetadata) string
```

### <a id="otherRepoCloneURL" href="#otherRepoCloneURL">func otherRepoCloneURL(base *url.URL, repo string) (*url.URL, error)</a>

```
searchKey: repos.otherRepoCloneURL
tags: [method private]
```

```Go
func otherRepoCloneURL(base *url.URL, repo string) (*url.URL, error)
```

### <a id="perforceCloneURL" href="#perforceCloneURL">func perforceCloneURL(depot *perforce.Depot, cfg *schema.PerforceConnection) string</a>

```
searchKey: repos.perforceCloneURL
tags: [method private]
```

```Go
func perforceCloneURL(depot *perforce.Depot, cfg *schema.PerforceConnection) string
```

perforceCloneURL composes a clone URL for a Perforce depot based on given information. e.g. perforce://admin:password@ssl:111.222.333.444:1666//Sourcegraph/ 

### <a id="phabricatorCloneURL" href="#phabricatorCloneURL">func phabricatorCloneURL(repo *phabricator.Repo, _ *schema.PhabricatorConnection) string</a>

```
searchKey: repos.phabricatorCloneURL
tags: [method private]
```

```Go
func phabricatorCloneURL(repo *phabricator.Repo, _ *schema.PhabricatorConnection) string
```

### <a id="pick" href="#pick">func pick(a *types.Repo, b *types.Repo) (keep, discard *types.Repo)</a>

```
searchKey: repos.pick
tags: [method private]
```

```Go
func pick(a *types.Repo, b *types.Repo) (keep, discard *types.Repo)
```

pick deterministically chooses between a and b a repo to keep and discard. It is used when resolving conflicts on sourced repositories. 

### <a id="projectQueryToURL" href="#projectQueryToURL">func projectQueryToURL(projectQuery string, perPage int) (string, error)</a>

```
searchKey: repos.projectQueryToURL
tags: [method private]
```

```Go
func projectQueryToURL(projectQuery string, perPage int) (string, error)
```

### <a id="purge" href="#purge">func purge(ctx context.Context, log log15.Logger) error</a>

```
searchKey: repos.purge
tags: [method private]
```

```Go
func purge(ctx context.Context, log log15.Logger) error
```

### <a id="randSleep" href="#randSleep">func randSleep(d, jitter time.Duration)</a>

```
searchKey: repos.randSleep
tags: [method private]
```

```Go
func randSleep(d, jitter time.Duration)
```

randSleep will sleep for an expected d duration with a jitter in [-jitter / 2, jitter / 2]. 

### <a id="resolveNameConflicts" href="#resolveNameConflicts">func resolveNameConflicts(diff *Diff, conflicting types.Repos)</a>

```
searchKey: repos.resolveNameConflicts
tags: [method private]
```

```Go
func resolveNameConflicts(diff *Diff, conflicting types.Repos)
```

We need to resolve name conflicts by deciding whether to keep the newly added repo or the repo that already exists in the database. If the new repo wins, then the old repo is added to the diff.Deleted slice. If the old repo wins, then the new repo is no longer inserted and is filtered out from the diff.Added slice. 

### <a id="runJobCleaner" href="#runJobCleaner">func runJobCleaner(ctx context.Context, db dbutil.DB, interval time.Duration)</a>

```
searchKey: repos.runJobCleaner
tags: [method private]
```

```Go
func runJobCleaner(ctx context.Context, db dbutil.DB, interval time.Duration)
```

### <a id="save" href="#save">func save(t testing.TB, rec *recorder.Recorder)</a>

```
searchKey: repos.save
tags: [method private]
```

```Go
func save(t testing.TB, rec *recorder.Recorder)
```

### <a id="scanAll" href="#scanAll">func scanAll(rows *sql.Rows, scan scanFunc) (last, count int64, err error)</a>

```
searchKey: repos.scanAll
tags: [method private]
```

```Go
func scanAll(rows *sql.Rows, scan scanFunc) (last, count int64, err error)
```

### <a id="scanJobs" href="#scanJobs">func scanJobs(rows *sql.Rows) ([]SyncJob, error)</a>

```
searchKey: repos.scanJobs
tags: [method private]
```

```Go
func scanJobs(rows *sql.Rows) ([]SyncJob, error)
```

### <a id="scanSingleJob" href="#scanSingleJob">func scanSingleJob(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: repos.scanSingleJob
tags: [method private]
```

```Go
func scanSingleJob(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

### <a id="setUserinfoBestEffort" href="#setUserinfoBestEffort">func setUserinfoBestEffort(rawurl, username, password string) string</a>

```
searchKey: repos.setUserinfoBestEffort
tags: [method private]
```

```Go
func setUserinfoBestEffort(rawurl, username, password string) string
```

setUserinfoBestEffort adds the username and password to rawurl. If user is not set in rawurl, username is used. If password is not set and there is a user, password is used. If anything fails, the original rawurl is returned. 

### <a id="setupInitialQueue" href="#setupInitialQueue">func setupInitialQueue(s *updateScheduler, initialQueue []*repoUpdate)</a>

```
searchKey: repos.setupInitialQueue
tags: [method private]
```

```Go
func setupInitialQueue(s *updateScheduler, initialQueue []*repoUpdate)
```

### <a id="setupInitialSchedule" href="#setupInitialSchedule">func setupInitialSchedule(s *updateScheduler, initialSchedule []*scheduledRepoUpdate)</a>

```
searchKey: repos.setupInitialSchedule
tags: [method private]
```

```Go
func setupInitialSchedule(s *updateScheduler, initialSchedule []*scheduledRepoUpdate)
```

### <a id="sleep" href="#sleep">func sleep(ctx context.Context, d time.Duration)</a>

```
searchKey: repos.sleep
tags: [method private]
```

```Go
func sleep(ctx context.Context, d time.Duration)
```

sleep is a context aware time.Sleep 

### <a id="sourceErrorFormatFunc" href="#sourceErrorFormatFunc">func sourceErrorFormatFunc(es []error) string</a>

```
searchKey: repos.sourceErrorFormatFunc
tags: [method private]
```

```Go
func sourceErrorFormatFunc(es []error) string
```

### <a id="sourcesColumn" href="#sourcesColumn">func sourcesColumn(repoID api.RepoID, sources map[string]*types.SourceInfo) (json.RawMessage, error)</a>

```
searchKey: repos.sourcesColumn
tags: [method private]
```

```Go
func sourcesColumn(repoID api.RepoID, sources map[string]*types.SourceInfo) (json.RawMessage, error)
```

### <a id="timePtr" href="#timePtr">func timePtr(t time.Time) *time.Time</a>

```
searchKey: repos.timePtr
tags: [method private]
```

```Go
func timePtr(t time.Time) *time.Time
```

### <a id="update" href="#update">func update(name string) bool</a>

```
searchKey: repos.update
tags: [method private]
```

```Go
func update(name string) bool
```

### <a id="updatePhabRepos" href="#updatePhabRepos">func updatePhabRepos(ctx context.Context, repos []*types.Repo) error</a>

```
searchKey: repos.updatePhabRepos
tags: [method private]
```

```Go
func updatePhabRepos(ctx context.Context, repos []*types.Repo) error
```

updatePhabRepos ensures that all provided repositories exist in the phabricator_repos table. 

### <a id="verifyQueue" href="#verifyQueue">func verifyQueue(t *testing.T, s *updateScheduler, expected []*repoUpdate)</a>

```
searchKey: repos.verifyQueue
tags: [method private]
```

```Go
func verifyQueue(t *testing.T, s *updateScheduler, expected []*repoUpdate)
```

### <a id="verifyRecording" href="#verifyRecording">func verifyRecording(t *testing.T, s *updateScheduler, timeAfterFuncDelays []time.Duration, expectedNotifications func(s *updateScheduler) []chan struct{}, r *recording)</a>

```
searchKey: repos.verifyRecording
tags: [method private]
```

```Go
func verifyRecording(t *testing.T, s *updateScheduler, timeAfterFuncDelays []time.Duration, expectedNotifications func(s *updateScheduler) []chan struct{}, r *recording)
```

### <a id="verifySchedule" href="#verifySchedule">func verifySchedule(t *testing.T, s *updateScheduler, expected []*scheduledRepoUpdate)</a>

```
searchKey: repos.verifySchedule
tags: [method private]
```

```Go
func verifySchedule(t *testing.T, s *updateScheduler, expected []*scheduledRepoUpdate)
```

### <a id="verifyScheduleRecording" href="#verifyScheduleRecording">func verifyScheduleRecording(t *testing.T, s *updateScheduler, timeAfterFuncDelays []time.Duration, wakeupNotifications int, r *recording)</a>

```
searchKey: repos.verifyScheduleRecording
tags: [method private]
```

```Go
func verifyScheduleRecording(t *testing.T, s *updateScheduler, timeAfterFuncDelays []time.Duration, wakeupNotifications int, r *recording)
```

### <a id="wrapWithoutRedirect" href="#wrapWithoutRedirect">func wrapWithoutRedirect(c *http.Client)</a>

```
searchKey: repos.wrapWithoutRedirect
tags: [method private]
```

```Go
func wrapWithoutRedirect(c *http.Client)
```

The code below is copied from github.com/aws/aws-sdk-go-v2@v0.11.0/aws/client.go so we use the same HTTP client that AWS wants to use, but fits into our HTTP factory pattern. Additionally we change wrapWithoutRedirect to mutate c instead of returning a copy. 

