# Package database

Package database contains PostgreSQL DB-backed stores. 

## Index

* Subpages
  * [internal/database/basestore](database/basestore.md)
  * [internal/database/batch](database/batch.md)
  * [internal/database/dbcache](database/dbcache.md)
  * [internal/database/dbconn](database/dbconn.md)
  * [internal/database/dbtest](database/dbtest.md)
  * [internal/database/dbtesting](database/dbtesting.md)
  * [internal/database/dbutil](database/dbutil.md)
  * [internal/database/globalstatedb](database/globalstatedb.md)
  * [internal/database/locker](database/locker.md)
  * [internal/database/query](database/query.md)
  * [internal/database/query_test](database/query_test.md)
  * [internal/database/schemadoc](database/schemadoc.md)
* [Constants](#const)
    * [const AuthenticatorTypeOAuthClient](#AuthenticatorTypeOAuthClient)
    * [const AuthenticatorTypeBasicAuth](#AuthenticatorTypeBasicAuth)
    * [const AuthenticatorTypeBasicAuthWithSSH](#AuthenticatorTypeBasicAuthWithSSH)
    * [const AuthenticatorTypeOAuthBearerToken](#AuthenticatorTypeOAuthBearerToken)
    * [const AuthenticatorTypeOAuthBearerTokenWithSSH](#AuthenticatorTypeOAuthBearerTokenWithSSH)
    * [const AuthenticatorTypeBitbucketServerSudoableOAuthClient](#AuthenticatorTypeBitbucketServerSudoableOAuthClient)
    * [const AuthenticatorTypeGitLabSudoableToken](#AuthenticatorTypeGitLabSudoableToken)
    * [const integrationSource](#integrationSource)
    * [const Daily](#Daily)
    * [const Weekly](#Weekly)
    * [const Monthly](#Monthly)
    * [const usersUsageCountsQuery](#usersUsageCountsQuery)
    * [const userIDQueryFragment](#userIDQueryFragment)
    * [const aggregatedUserIDQueryFragment](#aggregatedUserIDQueryFragment)
    * [const upsertExternalServicesQueryValueFmtstr](#upsertExternalServicesQueryValueFmtstr)
    * [const upsertExternalServicesQueryFmtstr](#upsertExternalServicesQueryFmtstr)
    * [const listReposQueryFmtstr](#listReposQueryFmtstr)
    * [const getSourcesByRepoQueryStr](#getSourcesByRepoQueryStr)
    * [const RepoListCreatedAt](#RepoListCreatedAt)
    * [const RepoListName](#RepoListName)
    * [const RepoListID](#RepoListID)
    * [const RepoListStars](#RepoListStars)
    * [const userReposQuery](#userReposQuery)
    * [const userPublicReposQuery](#userPublicReposQuery)
    * [const listDefaultReposQuery](#listDefaultReposQuery)
    * [const deleteReposQuery](#deleteReposQuery)
    * [const searchContextsPermissionsConditionFmtStr](#searchContextsPermissionsConditionFmtStr)
    * [const listSearchContextsFmtStr](#listSearchContextsFmtStr)
    * [const countSearchContextsFmtStr](#countSearchContextsFmtStr)
    * [const SearchContextsOrderByID](#SearchContextsOrderByID)
    * [const SearchContextsOrderBySpec](#SearchContextsOrderBySpec)
    * [const SearchContextsOrderByUpdatedAt](#SearchContextsOrderByUpdatedAt)
    * [const deleteSearchContextFmtStr](#deleteSearchContextFmtStr)
    * [const insertSearchContextFmtStr](#insertSearchContextFmtStr)
    * [const updateSearchContextFmtStr](#updateSearchContextFmtStr)
    * [const UserCredentialDomainBatches](#UserCredentialDomainBatches)
    * [const UserCredentialPlaceholderEncryptionKeyID](#UserCredentialPlaceholderEncryptionKeyID)
    * [const userCredentialsGetByScopeQueryFmtstr](#userCredentialsGetByScopeQueryFmtstr)
    * [const userCredentialsListQueryFmtstr](#userCredentialsListQueryFmtstr)
    * [const userCredentialsCreateQueryFmtstr](#userCredentialsCreateQueryFmtstr)
    * [const userCredentialsUpdateQueryFmtstr](#userCredentialsUpdateQueryFmtstr)
    * [const errorCodeUsernameExists](#errorCodeUsernameExists)
    * [const errorCodeEmailExists](#errorCodeEmailExists)
    * [const maxPasswordRunes](#maxPasswordRunes)
    * [const listDatesQuery](#listDatesQuery)
    * [const TagAllowUserExternalServicePrivate](#TagAllowUserExternalServicePrivate)
    * [const TagAllowUserExternalServicePublic](#TagAllowUserExternalServicePublic)
    * [const upsertSQL](#upsertSQL)
* [Variables](#var)
    * [var ErrAccessTokenNotFound](#ErrAccessTokenNotFound)
    * [var intervalByPeriodType](#intervalByPeriodType)
    * [var periodByPeriodType](#periodByPeriodType)
    * [var siteUsageQuery](#siteUsageQuery)
    * [var codeIntelWeeklyUsersQuery](#codeIntelWeeklyUsersQuery)
    * [var codeIntelligenceRepositoryCountsQuery](#codeIntelligenceRepositoryCountsQuery)
    * [var aggregatedCodeIntelEventsQuery](#aggregatedCodeIntelEventsQuery)
    * [var searchLatencyEventNames](#searchLatencyEventNames)
    * [var aggregatedSearchLatencyEventsQuery](#aggregatedSearchLatencyEventsQuery)
    * [var aggregatedSearchUsageEventsQuery](#aggregatedSearchUsageEventsQuery)
    * [var BeforeCreateExternalService](#BeforeCreateExternalService)
    * [var ExternalServiceKinds](#ExternalServiceKinds)
    * [var ErrInvalidColumnState](#ErrInvalidColumnState)
    * [var MockCannotCreateUserUsernameExistsErr](#MockCannotCreateUserUsernameExistsErr)
    * [var MockCannotCreateUserEmailExistsErr](#MockCannotCreateUserEmailExistsErr)
    * [var MockUserNotFoundErr](#MockUserNotFoundErr)
    * [var MockUserEmailNotFoundErr](#MockUserEmailNotFoundErr)
    * [var Mocks](#Mocks)
    * [var ErrNamespaceMultipleIDs](#ErrNamespaceMultipleIDs)
    * [var ErrNamespaceNoID](#ErrNamespaceNoID)
    * [var ErrNamespaceNotFound](#ErrNamespaceNotFound)
    * [var namespaceQueryFmtstr](#namespaceQueryFmtstr)
    * [var errOrgNameAlreadyExists](#errOrgNameAlreadyExists)
    * [var repoColumns](#repoColumns)
    * [var insertReposQuery](#insertReposQuery)
    * [var errPermissionsUserMappingConflict](#errPermissionsUserMappingConflict)
    * [var ErrSearchContextNotFound](#ErrSearchContextNotFound)
    * [var getSearchContextRepositoryRevisionsFmtStr](#getSearchContextRepositoryRevisionsFmtStr)
    * [var getAllRevisionsForRepoFmtStr](#getAllRevisionsForRepoFmtStr)
    * [var GlobalExternalServices](#GlobalExternalServices)
    * [var GlobalRepos](#GlobalRepos)
    * [var GlobalUsers](#GlobalUsers)
    * [var GlobalUserEmails](#GlobalUserEmails)
    * [var GlobalExternalAccounts](#GlobalExternalAccounts)
    * [var GlobalAuthz](#GlobalAuthz)
    * [var userCredentialsColumns](#userCredentialsColumns)
    * [var BeforeCreateUser](#BeforeCreateUser)
    * [var AfterCreateUser](#AfterCreateUser)
    * [var BeforeSetUserIsSiteAdmin](#BeforeSetUserIsSiteAdmin)
    * [var ErrNoCurrentUser](#ErrNoCurrentUser)
    * [var passwordResetRateLimit](#passwordResetRateLimit)
    * [var ErrPasswordResetRateLimit](#ErrPasswordResetRateLimit)
    * [var usernamesForTests](#usernamesForTests)
* [Types](#type)
    * [type AccessToken struct](#AccessToken)
    * [type AccessTokenStore struct](#AccessTokenStore)
        * [func AccessTokens(db dbutil.DB) *AccessTokenStore](#AccessTokens)
        * [func AccessTokensWith(other basestore.ShareableStore) *AccessTokenStore](#AccessTokensWith)
        * [func (s *AccessTokenStore) With(other basestore.ShareableStore) *AccessTokenStore](#AccessTokenStore.With)
        * [func (s *AccessTokenStore) Transact(ctx context.Context) (*AccessTokenStore, error)](#AccessTokenStore.Transact)
        * [func (s *AccessTokenStore) Create(ctx context.Context, subjectUserID int32, scopes []string, note string, creatorUserID int32) (id int64, token string, err error)](#AccessTokenStore.Create)
        * [func (s *AccessTokenStore) Lookup(ctx context.Context, tokenHexEncoded, requiredScope string) (subjectUserID int32, err error)](#AccessTokenStore.Lookup)
        * [func (s *AccessTokenStore) GetByID(ctx context.Context, id int64) (*AccessToken, error)](#AccessTokenStore.GetByID)
        * [func (s *AccessTokenStore) GetByToken(ctx context.Context, tokenHexEncoded string) (*AccessToken, error)](#AccessTokenStore.GetByToken)
        * [func (s *AccessTokenStore) get(ctx context.Context, conds []*sqlf.Query) (*AccessToken, error)](#AccessTokenStore.get)
        * [func (s *AccessTokenStore) List(ctx context.Context, opt AccessTokensListOptions) ([]*AccessToken, error)](#AccessTokenStore.List)
        * [func (s *AccessTokenStore) list(ctx context.Context, conds []*sqlf.Query, limitOffset *LimitOffset) ([]*AccessToken, error)](#AccessTokenStore.list)
        * [func (s *AccessTokenStore) Count(ctx context.Context, opt AccessTokensListOptions) (int, error)](#AccessTokenStore.Count)
        * [func (s *AccessTokenStore) DeleteByID(ctx context.Context, id int64, subjectUserID int32) error](#AccessTokenStore.DeleteByID)
        * [func (s *AccessTokenStore) DeleteByToken(ctx context.Context, tokenHexEncoded string) error](#AccessTokenStore.DeleteByToken)
        * [func (s *AccessTokenStore) delete(ctx context.Context, cond *sqlf.Query) error](#AccessTokenStore.delete)
    * [type AccessTokensListOptions struct](#AccessTokensListOptions)
        * [func (o AccessTokensListOptions) sqlConditions() []*sqlf.Query](#AccessTokensListOptions.sqlConditions)
    * [type MockAccessTokens struct](#MockAccessTokens)
    * [type AuthenticatorType string](#AuthenticatorType)
    * [type NullAuthenticator struct](#NullAuthenticator)
        * [func (n *NullAuthenticator) Scan(value interface{}) (err error)](#NullAuthenticator.Scan)
        * [func (n NullAuthenticator) Value() (driver.Value, error)](#NullAuthenticator.Value)
    * [type GrantPendingPermissionsArgs struct](#GrantPendingPermissionsArgs)
    * [type AuthorizedReposArgs struct](#AuthorizedReposArgs)
    * [type RevokeUserPermissionsArgs struct](#RevokeUserPermissionsArgs)
    * [type AuthzStore interface](#AuthzStore)
    * [type authzStore struct{}](#authzStore)
        * [func (*authzStore) GrantPendingPermissions(ctx context.Context, args *GrantPendingPermissionsArgs) error](#authzStore.GrantPendingPermissions)
        * [func (*authzStore) AuthorizedRepos(ctx context.Context, args *AuthorizedReposArgs) ([]*types.Repo, error)](#authzStore.AuthorizedRepos)
        * [func (*authzStore) RevokeUserPermissions(ctx context.Context, args *RevokeUserPermissionsArgs) error](#authzStore.RevokeUserPermissions)
    * [type MockAuthz struct](#MockAuthz)
    * [type EventLogStore struct](#EventLogStore)
        * [func EventLogs(db dbutil.DB) *EventLogStore](#EventLogs)
        * [func EventLogsWith(other basestore.ShareableStore) *EventLogStore](#EventLogsWith)
        * [func (l *EventLogStore) With(other basestore.ShareableStore) *EventLogStore](#EventLogStore.With)
        * [func (l *EventLogStore) Transact(ctx context.Context) (*EventLogStore, error)](#EventLogStore.Transact)
        * [func (l *EventLogStore) Insert(ctx context.Context, e *Event) error](#EventLogStore.Insert)
        * [func (l *EventLogStore) getBySQL(ctx context.Context, querySuffix *sqlf.Query) ([]*types.Event, error)](#EventLogStore.getBySQL)
        * [func (l *EventLogStore) ListAll(ctx context.Context, opt EventLogsListOptions) ([]*types.Event, error)](#EventLogStore.ListAll)
        * [func (l *EventLogStore) LatestPing(ctx context.Context) (*types.Event, error)](#EventLogStore.LatestPing)
        * [func (l *EventLogStore) CountByUserID(ctx context.Context, userID int32) (int, error)](#EventLogStore.CountByUserID)
        * [func (l *EventLogStore) CountByUserIDAndEventName(ctx context.Context, userID int32, name string) (int, error)](#EventLogStore.CountByUserIDAndEventName)
        * [func (l *EventLogStore) CountByUserIDAndEventNamePrefix(ctx context.Context, userID int32, namePrefix string) (int, error)](#EventLogStore.CountByUserIDAndEventNamePrefix)
        * [func (l *EventLogStore) CountByUserIDAndEventNames(ctx context.Context, userID int32, names []string) (int, error)](#EventLogStore.CountByUserIDAndEventNames)
        * [func (l *EventLogStore) countBySQL(ctx context.Context, querySuffix *sqlf.Query) (int, error)](#EventLogStore.countBySQL)
        * [func (l *EventLogStore) MaxTimestampByUserID(ctx context.Context, userID int32) (*time.Time, error)](#EventLogStore.MaxTimestampByUserID)
        * [func (l *EventLogStore) MaxTimestampByUserIDAndSource(ctx context.Context, userID int32, source string) (*time.Time, error)](#EventLogStore.MaxTimestampByUserIDAndSource)
        * [func (l *EventLogStore) maxTimestampBySQL(ctx context.Context, querySuffix *sqlf.Query) (*time.Time, error)](#EventLogStore.maxTimestampBySQL)
        * [func (l *EventLogStore) CountUniqueUsersPerPeriod(ctx context.Context, periodType PeriodType, now time.Time, periods int, opt *CountUniqueUsersOptions) ([]UsageValue, error)](#EventLogStore.CountUniqueUsersPerPeriod)
        * [func (l *EventLogStore) countUniqueUsersPerPeriodBySQL(ctx context.Context, interval, period *sqlf.Query, startDate, endDate time.Time, conds []*sqlf.Query) ([]UsageValue, error)](#EventLogStore.countUniqueUsersPerPeriodBySQL)
        * [func (l *EventLogStore) countPerPeriodBySQL(ctx context.Context, countExpr, interval, period *sqlf.Query, startDate, endDate time.Time, conds []*sqlf.Query) ([]UsageValue, error)](#EventLogStore.countPerPeriodBySQL)
        * [func (l *EventLogStore) CountUniqueUsersAll(ctx context.Context, startDate, endDate time.Time) (int, error)](#EventLogStore.CountUniqueUsersAll)
        * [func (l *EventLogStore) CountUniqueUsersByEventNamePrefix(ctx context.Context, startDate, endDate time.Time, namePrefix string) (int, error)](#EventLogStore.CountUniqueUsersByEventNamePrefix)
        * [func (l *EventLogStore) CountUniqueUsersByEventName(ctx context.Context, startDate, endDate time.Time, name string) (int, error)](#EventLogStore.CountUniqueUsersByEventName)
        * [func (l *EventLogStore) CountUniqueUsersByEventNames(ctx context.Context, startDate, endDate time.Time, names []string) (int, error)](#EventLogStore.CountUniqueUsersByEventNames)
        * [func (l *EventLogStore) countUniqueUsersBySQL(ctx context.Context, startDate, endDate time.Time, querySuffix *sqlf.Query) (int, error)](#EventLogStore.countUniqueUsersBySQL)
        * [func (l *EventLogStore) ListUniqueUsersAll(ctx context.Context, startDate, endDate time.Time) ([]int32, error)](#EventLogStore.ListUniqueUsersAll)
        * [func (l *EventLogStore) UsersUsageCounts(ctx context.Context) (counts []types.UserUsageCounts, err error)](#EventLogStore.UsersUsageCounts)
        * [func (l *EventLogStore) SiteUsage(ctx context.Context) (types.SiteUsageSummary, error)](#EventLogStore.SiteUsage)
        * [func (l *EventLogStore) siteUsage(ctx context.Context, now time.Time) (summary types.SiteUsageSummary, err error)](#EventLogStore.siteUsage)
        * [func (l *EventLogStore) CodeIntelligencePreciseWAUs(ctx context.Context) (int, error)](#EventLogStore.CodeIntelligencePreciseWAUs)
        * [func (l *EventLogStore) CodeIntelligenceSearchBasedWAUs(ctx context.Context) (int, error)](#EventLogStore.CodeIntelligenceSearchBasedWAUs)
        * [func (l *EventLogStore) CodeIntelligenceWAUs(ctx context.Context) (int, error)](#EventLogStore.CodeIntelligenceWAUs)
        * [func (l *EventLogStore) CodeIntelligenceCrossRepositoryWAUs(ctx context.Context) (int, error)](#EventLogStore.CodeIntelligenceCrossRepositoryWAUs)
        * [func (l *EventLogStore) CodeIntelligencePreciseCrossRepositoryWAUs(ctx context.Context) (int, error)](#EventLogStore.CodeIntelligencePreciseCrossRepositoryWAUs)
        * [func (l *EventLogStore) CodeIntelligenceSearchBasedCrossRepositoryWAUs(ctx context.Context) (int, error)](#EventLogStore.CodeIntelligenceSearchBasedCrossRepositoryWAUs)
        * [func (l *EventLogStore) codeIntelligenceWeeklyUsersCount(ctx context.Context, eventNames []string, now time.Time) (wau int, _ error)](#EventLogStore.codeIntelligenceWeeklyUsersCount)
        * [func (l *EventLogStore) CodeIntelligenceRepositoryCounts(ctx context.Context) (withUploads int, withoutUploads int, err error)](#EventLogStore.CodeIntelligenceRepositoryCounts)
        * [func (l *EventLogStore) AggregatedCodeIntelEvents(ctx context.Context) ([]types.CodeIntelAggregatedEvent, error)](#EventLogStore.AggregatedCodeIntelEvents)
        * [func (l *EventLogStore) aggregatedCodeIntelEvents(ctx context.Context, now time.Time) (events []types.CodeIntelAggregatedEvent, err error)](#EventLogStore.aggregatedCodeIntelEvents)
        * [func (l *EventLogStore) AggregatedSearchEvents(ctx context.Context, now time.Time) ([]types.SearchAggregatedEvent, error)](#EventLogStore.AggregatedSearchEvents)
        * [func (l *EventLogStore) aggregatedSearchEvents(ctx context.Context, queryString string, now time.Time) (events []types.SearchAggregatedEvent, err error)](#EventLogStore.aggregatedSearchEvents)
    * [type Event struct](#Event)
        * [func makeTestEvent(e *Event) *Event](#makeTestEvent)
    * [type EventLogsListOptions struct](#EventLogsListOptions)
    * [type UsageValue struct](#UsageValue)
    * [type PeriodType string](#PeriodType)
    * [type CountUniqueUsersOptions struct](#CountUniqueUsersOptions)
    * [type EventFilterOptions struct](#EventFilterOptions)
    * [type EventArgumentMatch struct](#EventArgumentMatch)
    * [type PercentileValue struct](#PercentileValue)
    * [type MockEventLogs struct](#MockEventLogs)
    * [type userExternalAccountNotFoundError struct](#userExternalAccountNotFoundError)
        * [func (err userExternalAccountNotFoundError) Error() string](#userExternalAccountNotFoundError.Error)
        * [func (err userExternalAccountNotFoundError) NotFound() bool](#userExternalAccountNotFoundError.NotFound)
    * [type UserExternalAccountsStore struct](#UserExternalAccountsStore)
        * [func ExternalAccounts(db dbutil.DB) *UserExternalAccountsStore](#ExternalAccounts)
        * [func ExternalAccountsWith(other basestore.ShareableStore) *UserExternalAccountsStore](#ExternalAccountsWith)
        * [func (s *UserExternalAccountsStore) With(other basestore.ShareableStore) *UserExternalAccountsStore](#UserExternalAccountsStore.With)
        * [func (s *UserExternalAccountsStore) WithEncryptionKey(key encryption.Key) *UserExternalAccountsStore](#UserExternalAccountsStore.WithEncryptionKey)
        * [func (s *UserExternalAccountsStore) Transact(ctx context.Context) (*UserExternalAccountsStore, error)](#UserExternalAccountsStore.Transact)
        * [func (s *UserExternalAccountsStore) ensureStore()](#UserExternalAccountsStore.ensureStore)
        * [func (s *UserExternalAccountsStore) getEncryptionKey() encryption.Key](#UserExternalAccountsStore.getEncryptionKey)
        * [func (s *UserExternalAccountsStore) Get(ctx context.Context, id int32) (*extsvc.Account, error)](#UserExternalAccountsStore.Get)
        * [func (s *UserExternalAccountsStore) LookupUserAndSave(ctx context.Context, spec extsvc.AccountSpec, data extsvc.AccountData) (userID int32, err error)](#UserExternalAccountsStore.LookupUserAndSave)
        * [func (s *UserExternalAccountsStore) AssociateUserAndSave(ctx context.Context, userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) (err error)](#UserExternalAccountsStore.AssociateUserAndSave)
        * [func (s *UserExternalAccountsStore) CreateUserAndSave(ctx context.Context, newUser NewUser, spec extsvc.AccountSpec, data extsvc.AccountData) (createdUserID int32, err error)](#UserExternalAccountsStore.CreateUserAndSave)
        * [func (s *UserExternalAccountsStore) insert(ctx context.Context, userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) error](#UserExternalAccountsStore.insert)
        * [func (s *UserExternalAccountsStore) TouchExpired(ctx context.Context, id int32) error](#UserExternalAccountsStore.TouchExpired)
        * [func (s *UserExternalAccountsStore) TouchLastValid(ctx context.Context, id int32) error](#UserExternalAccountsStore.TouchLastValid)
        * [func (s *UserExternalAccountsStore) Delete(ctx context.Context, id int32) error](#UserExternalAccountsStore.Delete)
        * [func (s *UserExternalAccountsStore) List(ctx context.Context, opt ExternalAccountsListOptions) (acct []*extsvc.Account, err error)](#UserExternalAccountsStore.List)
        * [func (s *UserExternalAccountsStore) Count(ctx context.Context, opt ExternalAccountsListOptions) (int, error)](#UserExternalAccountsStore.Count)
        * [func (s *UserExternalAccountsStore) getBySQL(ctx context.Context, querySuffix *sqlf.Query) (*extsvc.Account, error)](#UserExternalAccountsStore.getBySQL)
        * [func (s *UserExternalAccountsStore) listBySQL(ctx context.Context, querySuffix *sqlf.Query) ([]*extsvc.Account, error)](#UserExternalAccountsStore.listBySQL)
        * [func (s *UserExternalAccountsStore) listSQL(opt ExternalAccountsListOptions) (conds []*sqlf.Query)](#UserExternalAccountsStore.listSQL)
    * [type ExternalAccountsListOptions struct](#ExternalAccountsListOptions)
    * [type MockExternalAccounts struct](#MockExternalAccounts)
    * [type ExternalServiceStore struct](#ExternalServiceStore)
        * [func ExternalServices(db dbutil.DB) *ExternalServiceStore](#ExternalServices)
        * [func ExternalServicesWith(other basestore.ShareableStore) *ExternalServiceStore](#ExternalServicesWith)
        * [func (e *ExternalServiceStore) copy() *ExternalServiceStore](#ExternalServiceStore.copy)
        * [func (e *ExternalServiceStore) With(other basestore.ShareableStore) *ExternalServiceStore](#ExternalServiceStore.With)
        * [func (e *ExternalServiceStore) WithEncryptionKey(key encryption.Key) *ExternalServiceStore](#ExternalServiceStore.WithEncryptionKey)
        * [func (e *ExternalServiceStore) Transact(ctx context.Context) (*ExternalServiceStore, error)](#ExternalServiceStore.Transact)
        * [func (e *ExternalServiceStore) Done(err error) error](#ExternalServiceStore.Done)
        * [func (e *ExternalServiceStore) ensureStore()](#ExternalServiceStore.ensureStore)
        * [func (e *ExternalServiceStore) ValidateConfig(ctx context.Context, opt ValidateExternalServiceConfigOptions) (normalized []byte, err error)](#ExternalServiceStore.ValidateConfig)
        * [func (e *ExternalServiceStore) validateGitHubConnection(ctx context.Context, id int64, c *schema.GitHubConnection) error](#ExternalServiceStore.validateGitHubConnection)
        * [func (e *ExternalServiceStore) validateGitLabConnection(ctx context.Context, id int64, c *schema.GitLabConnection, ps []schema.AuthProviders) error](#ExternalServiceStore.validateGitLabConnection)
        * [func (e *ExternalServiceStore) validateBitbucketServerConnection(ctx context.Context, id int64, c *schema.BitbucketServerConnection) error](#ExternalServiceStore.validateBitbucketServerConnection)
        * [func (e *ExternalServiceStore) validateBitbucketCloudConnection(ctx context.Context, id int64, c *schema.BitbucketCloudConnection) error](#ExternalServiceStore.validateBitbucketCloudConnection)
        * [func (e *ExternalServiceStore) validatePerforceConnection(ctx context.Context, id int64, c *schema.PerforceConnection) error](#ExternalServiceStore.validatePerforceConnection)
        * [func (e *ExternalServiceStore) validateDuplicateRateLimits(ctx context.Context, id int64, kind string, parsedConfig interface{}) error](#ExternalServiceStore.validateDuplicateRateLimits)
        * [func (e *ExternalServiceStore) validateSingleKindPerUser(ctx context.Context, id int64, kind string, userID int32) error](#ExternalServiceStore.validateSingleKindPerUser)
        * [func (e *ExternalServiceStore) Create(ctx context.Context, confGet func() *conf.Unified, es *types.ExternalService) error](#ExternalServiceStore.Create)
        * [func (e *ExternalServiceStore) maybeEncryptConfig(ctx context.Context, config string) (string, string, error)](#ExternalServiceStore.maybeEncryptConfig)
        * [func (e *ExternalServiceStore) maybeDecryptConfig(ctx context.Context, config string, keyID string) (string, error)](#ExternalServiceStore.maybeDecryptConfig)
        * [func (e *ExternalServiceStore) Upsert(ctx context.Context, svcs ...*types.ExternalService) (err error)](#ExternalServiceStore.Upsert)
        * [func (e *ExternalServiceStore) upsertExternalServicesQuery(ctx context.Context, svcs []*types.ExternalService) (*sqlf.Query, error)](#ExternalServiceStore.upsertExternalServicesQuery)
        * [func (e *ExternalServiceStore) Update(ctx context.Context, ps []schema.AuthProviders, id int64, update *ExternalServiceUpdate) (err error)](#ExternalServiceStore.Update)
        * [func (e *ExternalServiceStore) Delete(ctx context.Context, id int64) (err error)](#ExternalServiceStore.Delete)
        * [func (e *ExternalServiceStore) GetByID(ctx context.Context, id int64) (*types.ExternalService, error)](#ExternalServiceStore.GetByID)
        * [func (e *ExternalServiceStore) GetSyncJobs(ctx context.Context) ([]*types.ExternalServiceSyncJob, error)](#ExternalServiceStore.GetSyncJobs)
        * [func (e *ExternalServiceStore) GetLastSyncError(ctx context.Context, id int64) (string, error)](#ExternalServiceStore.GetLastSyncError)
        * [func (e *ExternalServiceStore) GetAffiliatedSyncErrors(ctx context.Context, u *types.User) (map[int64]string, error)](#ExternalServiceStore.GetAffiliatedSyncErrors)
        * [func (e *ExternalServiceStore) List(ctx context.Context, opt ExternalServicesListOptions) ([]*types.ExternalService, error)](#ExternalServiceStore.List)
        * [func (e *ExternalServiceStore) DistinctKinds(ctx context.Context) ([]string, error)](#ExternalServiceStore.DistinctKinds)
        * [func (e *ExternalServiceStore) list(ctx context.Context, opt ExternalServicesListOptions) ([]*types.ExternalService, error)](#ExternalServiceStore.list)
        * [func (e *ExternalServiceStore) Count(ctx context.Context, opt ExternalServicesListOptions) (int, error)](#ExternalServiceStore.Count)
        * [func (e *ExternalServiceStore) RepoCount(ctx context.Context, id int64) (int32, error)](#ExternalServiceStore.RepoCount)
        * [func (e *ExternalServiceStore) SyncDue(ctx context.Context, intIDs []int64, d time.Duration) (bool, error)](#ExternalServiceStore.SyncDue)
    * [type ExternalServiceKind struct](#ExternalServiceKind)
    * [type ExternalServicesListOptions struct](#ExternalServicesListOptions)
        * [func (o ExternalServicesListOptions) sqlConditions() []*sqlf.Query](#ExternalServicesListOptions.sqlConditions)
    * [type ValidateExternalServiceConfigOptions struct](#ValidateExternalServiceConfigOptions)
    * [type ExternalServiceUpdate struct](#ExternalServiceUpdate)
    * [type externalServiceNotFoundError struct](#externalServiceNotFoundError)
        * [func (e externalServiceNotFoundError) Error() string](#externalServiceNotFoundError.Error)
        * [func (e externalServiceNotFoundError) NotFound() bool](#externalServiceNotFoundError.NotFound)
    * [type MockExternalServices struct](#MockExternalServices)
    * [type FeatureFlagStore struct](#FeatureFlagStore)
        * [func FeatureFlags(db dbutil.DB) *FeatureFlagStore](#FeatureFlags)
        * [func FeatureFlagsWith(other basestore.ShareableStore) *FeatureFlagStore](#FeatureFlagsWith)
        * [func (f *FeatureFlagStore) With(other basestore.ShareableStore) *FeatureFlagStore](#FeatureFlagStore.With)
        * [func (f *FeatureFlagStore) Transact(ctx context.Context) (*FeatureFlagStore, error)](#FeatureFlagStore.Transact)
        * [func (f *FeatureFlagStore) CreateFeatureFlag(ctx context.Context, flag *ff.FeatureFlag) (*ff.FeatureFlag, error)](#FeatureFlagStore.CreateFeatureFlag)
        * [func (f *FeatureFlagStore) UpdateFeatureFlag(ctx context.Context, flag *ff.FeatureFlag) (*ff.FeatureFlag, error)](#FeatureFlagStore.UpdateFeatureFlag)
        * [func (f *FeatureFlagStore) DeleteFeatureFlag(ctx context.Context, name string) error](#FeatureFlagStore.DeleteFeatureFlag)
        * [func (f *FeatureFlagStore) CreateRollout(ctx context.Context, name string, rollout int32) (*ff.FeatureFlag, error)](#FeatureFlagStore.CreateRollout)
        * [func (f *FeatureFlagStore) CreateBool(ctx context.Context, name string, value bool) (*ff.FeatureFlag, error)](#FeatureFlagStore.CreateBool)
        * [func (f *FeatureFlagStore) GetFeatureFlag(ctx context.Context, flagName string) (*ff.FeatureFlag, error)](#FeatureFlagStore.GetFeatureFlag)
        * [func (f *FeatureFlagStore) GetFeatureFlags(ctx context.Context) ([]*ff.FeatureFlag, error)](#FeatureFlagStore.GetFeatureFlags)
        * [func (f *FeatureFlagStore) CreateOverride(ctx context.Context, override *ff.Override) (*ff.Override, error)](#FeatureFlagStore.CreateOverride)
        * [func (f *FeatureFlagStore) DeleteOverride(ctx context.Context, orgID, userID *int32, flagName string) error](#FeatureFlagStore.DeleteOverride)
        * [func (f *FeatureFlagStore) UpdateOverride(ctx context.Context, orgID, userID *int32, flagName string, newValue bool) (*ff.Override, error)](#FeatureFlagStore.UpdateOverride)
        * [func (f *FeatureFlagStore) GetOverridesForFlag(ctx context.Context, flagName string) ([]*ff.Override, error)](#FeatureFlagStore.GetOverridesForFlag)
        * [func (f *FeatureFlagStore) GetUserOverrides(ctx context.Context, userID int32) ([]*ff.Override, error)](#FeatureFlagStore.GetUserOverrides)
        * [func (f *FeatureFlagStore) GetOrgOverridesForUser(ctx context.Context, userID int32) ([]*ff.Override, error)](#FeatureFlagStore.GetOrgOverridesForUser)
        * [func (f *FeatureFlagStore) GetUserFlags(ctx context.Context, userID int32) (map[string]bool, error)](#FeatureFlagStore.GetUserFlags)
        * [func (f *FeatureFlagStore) GetAnonymousUserFlags(ctx context.Context, anonymousUID string) (map[string]bool, error)](#FeatureFlagStore.GetAnonymousUserFlags)
        * [func (f *FeatureFlagStore) GetGlobalFeatureFlags(ctx context.Context) (map[string]bool, error)](#FeatureFlagStore.GetGlobalFeatureFlags)
    * [type rowScanner interface](#rowScanner)
    * [type GitserverRepoStore struct](#GitserverRepoStore)
        * [func GitserverRepos(db dbutil.DB) *GitserverRepoStore](#GitserverRepos)
        * [func NewGitserverReposWith(other basestore.ShareableStore) *GitserverRepoStore](#NewGitserverReposWith)
        * [func (s *GitserverRepoStore) With(other basestore.ShareableStore) *GitserverRepoStore](#GitserverRepoStore.With)
        * [func (s *GitserverRepoStore) Transact(ctx context.Context) (*GitserverRepoStore, error)](#GitserverRepoStore.Transact)
        * [func (s *GitserverRepoStore) Upsert(ctx context.Context, repos ...*types.GitserverRepo) error](#GitserverRepoStore.Upsert)
        * [func (s *GitserverRepoStore) IterateRepoGitserverStatus(ctx context.Context, repoFn func(repo types.RepoGitserverStatus) error) error](#GitserverRepoStore.IterateRepoGitserverStatus)
        * [func (s *GitserverRepoStore) GetByID(ctx context.Context, id api.RepoID) (*types.GitserverRepo, error)](#GitserverRepoStore.GetByID)
        * [func (s *GitserverRepoStore) SetCloneStatus(ctx context.Context, id api.RepoID, status types.CloneStatus, shardID string) error](#GitserverRepoStore.SetCloneStatus)
        * [func (s *GitserverRepoStore) SetLastError(ctx context.Context, id api.RepoID, error, shardID string) error](#GitserverRepoStore.SetLastError)
    * [type LimitOffset struct](#LimitOffset)
        * [func (o *LimitOffset) SQL() *sqlf.Query](#LimitOffset.SQL)
    * [type MockStores struct](#MockStores)
    * [type Namespace struct](#Namespace)
    * [type NamespaceStore struct](#NamespaceStore)
        * [func Namespaces(db dbutil.DB) *NamespaceStore](#Namespaces)
        * [func NamespacesWith(other basestore.ShareableStore) *NamespaceStore](#NamespacesWith)
        * [func (s *NamespaceStore) With(other basestore.ShareableStore) *NamespaceStore](#NamespaceStore.With)
        * [func (s *NamespaceStore) Transact(ctx context.Context) (*NamespaceStore, error)](#NamespaceStore.Transact)
        * [func (s *NamespaceStore) GetByID(ctx context.Context,...](#NamespaceStore.GetByID)
        * [func (s *NamespaceStore) GetByName(ctx context.Context,...](#NamespaceStore.GetByName)
        * [func (s *NamespaceStore) getNamespace(ctx context.Context, n *Namespace, preds []*sqlf.Query) error](#NamespaceStore.getNamespace)
    * [type MockNamespaces struct](#MockNamespaces)
    * [type ExternalServiceConfigMigrator struct](#ExternalServiceConfigMigrator)
        * [func NewExternalServiceConfigMigrator(store *basestore.Store) *ExternalServiceConfigMigrator](#NewExternalServiceConfigMigrator)
        * [func NewExternalServiceConfigMigratorWithDB(db dbutil.DB) *ExternalServiceConfigMigrator](#NewExternalServiceConfigMigratorWithDB)
        * [func (m *ExternalServiceConfigMigrator) ID() int](#ExternalServiceConfigMigrator.ID)
        * [func (m *ExternalServiceConfigMigrator) Progress(ctx context.Context) (float64, error)](#ExternalServiceConfigMigrator.Progress)
        * [func (m *ExternalServiceConfigMigrator) Up(ctx context.Context) (err error)](#ExternalServiceConfigMigrator.Up)
        * [func (m *ExternalServiceConfigMigrator) Down(ctx context.Context) (err error)](#ExternalServiceConfigMigrator.Down)
        * [func (m *ExternalServiceConfigMigrator) listConfigsForUpdate(ctx context.Context, tx *basestore.Store, encrypted bool) ([]*types.ExternalService, error)](#ExternalServiceConfigMigrator.listConfigsForUpdate)
    * [type ExternalAccountsMigrator struct](#ExternalAccountsMigrator)
        * [func NewExternalAccountsMigrator(store *basestore.Store) *ExternalAccountsMigrator](#NewExternalAccountsMigrator)
        * [func NewExternalAccountsMigratorWithDB(db dbutil.DB) *ExternalAccountsMigrator](#NewExternalAccountsMigratorWithDB)
        * [func (m *ExternalAccountsMigrator) ID() int](#ExternalAccountsMigrator.ID)
        * [func (m *ExternalAccountsMigrator) Progress(ctx context.Context) (float64, error)](#ExternalAccountsMigrator.Progress)
        * [func (m *ExternalAccountsMigrator) Up(ctx context.Context) (err error)](#ExternalAccountsMigrator.Up)
        * [func (m *ExternalAccountsMigrator) Down(ctx context.Context) (err error)](#ExternalAccountsMigrator.Down)
    * [type OrgInvitation struct](#OrgInvitation)
        * [func (oi *OrgInvitation) Pending() bool](#OrgInvitation.Pending)
    * [type OrgInvitationStore struct](#OrgInvitationStore)
        * [func OrgInvitations(db dbutil.DB) *OrgInvitationStore](#OrgInvitations)
        * [func OrgInvitationsWith(other basestore.ShareableStore) *OrgInvitationStore](#OrgInvitationsWith)
        * [func (s *OrgInvitationStore) With(other basestore.ShareableStore) *OrgInvitationStore](#OrgInvitationStore.With)
        * [func (s *OrgInvitationStore) Transact(ctx context.Context) (*OrgInvitationStore, error)](#OrgInvitationStore.Transact)
        * [func (s *OrgInvitationStore) Create(ctx context.Context, orgID, senderUserID, recipientUserID int32) (*OrgInvitation, error)](#OrgInvitationStore.Create)
        * [func (s *OrgInvitationStore) GetByID(ctx context.Context, id int64) (*OrgInvitation, error)](#OrgInvitationStore.GetByID)
        * [func (s *OrgInvitationStore) GetPending(ctx context.Context, orgID, recipientUserID int32) (*OrgInvitation, error)](#OrgInvitationStore.GetPending)
        * [func (s *OrgInvitationStore) List(ctx context.Context, opt OrgInvitationsListOptions) ([]*OrgInvitation, error)](#OrgInvitationStore.List)
        * [func (s *OrgInvitationStore) list(ctx context.Context, conds []*sqlf.Query, limitOffset *LimitOffset) ([]*OrgInvitation, error)](#OrgInvitationStore.list)
        * [func (s *OrgInvitationStore) Count(ctx context.Context, opt OrgInvitationsListOptions) (int, error)](#OrgInvitationStore.Count)
        * [func (s *OrgInvitationStore) UpdateEmailSentTimestamp(ctx context.Context, id int64) error](#OrgInvitationStore.UpdateEmailSentTimestamp)
        * [func (s *OrgInvitationStore) Respond(ctx context.Context, id int64, recipientUserID int32, accept bool) (orgID int32, err error)](#OrgInvitationStore.Respond)
        * [func (s *OrgInvitationStore) Revoke(ctx context.Context, id int64) error](#OrgInvitationStore.Revoke)
    * [type OrgInvitationNotFoundError struct](#OrgInvitationNotFoundError)
        * [func (err OrgInvitationNotFoundError) NotFound() bool](#OrgInvitationNotFoundError.NotFound)
        * [func (err OrgInvitationNotFoundError) Error() string](#OrgInvitationNotFoundError.Error)
    * [type OrgInvitationsListOptions struct](#OrgInvitationsListOptions)
        * [func (o OrgInvitationsListOptions) sqlConditions() []*sqlf.Query](#OrgInvitationsListOptions.sqlConditions)
    * [type MockOrgInvitations struct](#MockOrgInvitations)
    * [type OrgMemberStore struct](#OrgMemberStore)
        * [func OrgMembers(db dbutil.DB) *OrgMemberStore](#OrgMembers)
        * [func OrgMembersWith(other basestore.ShareableStore) *OrgMemberStore](#OrgMembersWith)
        * [func (s *OrgMemberStore) With(other basestore.ShareableStore) *OrgMemberStore](#OrgMemberStore.With)
        * [func (m *OrgMemberStore) Transact(ctx context.Context) (*OrgMemberStore, error)](#OrgMemberStore.Transact)
        * [func (m *OrgMemberStore) Create(ctx context.Context, orgID, userID int32) (*types.OrgMembership, error)](#OrgMemberStore.Create)
        * [func (m *OrgMemberStore) GetByUserID(ctx context.Context, userID int32) ([]*types.OrgMembership, error)](#OrgMemberStore.GetByUserID)
        * [func (m *OrgMemberStore) GetByOrgIDAndUserID(ctx context.Context, orgID, userID int32) (*types.OrgMembership, error)](#OrgMemberStore.GetByOrgIDAndUserID)
        * [func (m *OrgMemberStore) Remove(ctx context.Context, orgID, userID int32) error](#OrgMemberStore.Remove)
        * [func (m *OrgMemberStore) GetByOrgID(ctx context.Context, orgID int32) ([]*types.OrgMembership, error)](#OrgMemberStore.GetByOrgID)
        * [func (m *OrgMemberStore) getOneBySQL(ctx context.Context, query string, args ...interface{}) (*types.OrgMembership, error)](#OrgMemberStore.getOneBySQL)
        * [func (m *OrgMemberStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.OrgMembership, error)](#OrgMemberStore.getBySQL)
        * [func (m *OrgMemberStore) CreateMembershipInOrgsForAllUsers(ctx context.Context, orgNames []string) error](#OrgMemberStore.CreateMembershipInOrgsForAllUsers)
    * [type ErrOrgMemberNotFound struct](#ErrOrgMemberNotFound)
        * [func (err *ErrOrgMemberNotFound) Error() string](#ErrOrgMemberNotFound.Error)
        * [func (ErrOrgMemberNotFound) NotFound() bool](#ErrOrgMemberNotFound.NotFound)
    * [type MockOrgMembers struct](#MockOrgMembers)
        * [func (s *MockOrgMembers) MockGetByOrgIDAndUserID_Return(t *testing.T, returns *types.OrgMembership, returnsErr error) (called *bool)](#MockOrgMembers.MockGetByOrgIDAndUserID_Return)
    * [type OrgNotFoundError struct](#OrgNotFoundError)
        * [func (e *OrgNotFoundError) Error() string](#OrgNotFoundError.Error)
        * [func (e *OrgNotFoundError) NotFound() bool](#OrgNotFoundError.NotFound)
    * [type OrgStore struct](#OrgStore)
        * [func Orgs(db dbutil.DB) *OrgStore](#Orgs)
        * [func OrgsWith(other basestore.ShareableStore) *OrgStore](#OrgsWith)
        * [func (o *OrgStore) With(other basestore.ShareableStore) *OrgStore](#OrgStore.With)
        * [func (o *OrgStore) Transact(ctx context.Context) (*OrgStore, error)](#OrgStore.Transact)
        * [func (o *OrgStore) GetByUserID(ctx context.Context, userID int32) ([]*types.Org, error)](#OrgStore.GetByUserID)
        * [func (o *OrgStore) GetByID(ctx context.Context, orgID int32) (*types.Org, error)](#OrgStore.GetByID)
        * [func (o *OrgStore) GetByName(ctx context.Context, name string) (*types.Org, error)](#OrgStore.GetByName)
        * [func (o *OrgStore) Count(ctx context.Context, opt OrgsListOptions) (int, error)](#OrgStore.Count)
        * [func (o *OrgStore) List(ctx context.Context, opt *OrgsListOptions) ([]*types.Org, error)](#OrgStore.List)
        * [func (*OrgStore) listSQL(opt OrgsListOptions) *sqlf.Query](#OrgStore.listSQL)
        * [func (o *OrgStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.Org, error)](#OrgStore.getBySQL)
        * [func (o *OrgStore) Create(ctx context.Context, name string, displayName *string) (newOrg *types.Org, err error)](#OrgStore.Create)
        * [func (o *OrgStore) Update(ctx context.Context, id int32, displayName *string) (*types.Org, error)](#OrgStore.Update)
        * [func (o *OrgStore) Delete(ctx context.Context, id int32) (err error)](#OrgStore.Delete)
    * [type OrgsListOptions struct](#OrgsListOptions)
    * [type MockOrgs struct](#MockOrgs)
        * [func (s *MockOrgs) MockGetByID_Return(t *testing.T, returns *types.Org, returnsErr error) (called *bool)](#MockOrgs.MockGetByID_Return)
    * [type PhabricatorStore struct](#PhabricatorStore)
        * [func Phabricator(db dbutil.DB) *PhabricatorStore](#Phabricator)
        * [func PhabricatorWith(other basestore.ShareableStore) *PhabricatorStore](#PhabricatorWith)
        * [func (s *PhabricatorStore) With(other basestore.ShareableStore) *PhabricatorStore](#PhabricatorStore.With)
        * [func (s *PhabricatorStore) Transact(ctx context.Context) (*PhabricatorStore, error)](#PhabricatorStore.Transact)
        * [func (p *PhabricatorStore) Create(ctx context.Context, callsign string, name api.RepoName, phabURL string) (*types.PhabricatorRepo, error)](#PhabricatorStore.Create)
        * [func (p *PhabricatorStore) CreateOrUpdate(ctx context.Context, callsign string, name api.RepoName, phabURL string) (*types.PhabricatorRepo, error)](#PhabricatorStore.CreateOrUpdate)
        * [func (p *PhabricatorStore) CreateIfNotExists(ctx context.Context, callsign string, name api.RepoName, phabURL string) (*types.PhabricatorRepo, error)](#PhabricatorStore.CreateIfNotExists)
        * [func (p *PhabricatorStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.PhabricatorRepo, error)](#PhabricatorStore.getBySQL)
        * [func (p *PhabricatorStore) getOneBySQL(ctx context.Context, query string, args ...interface{}) (*types.PhabricatorRepo, error)](#PhabricatorStore.getOneBySQL)
        * [func (p *PhabricatorStore) GetByName(ctx context.Context, name api.RepoName) (*types.PhabricatorRepo, error)](#PhabricatorStore.GetByName)
    * [type errPhabricatorRepoNotFound struct](#errPhabricatorRepoNotFound)
        * [func (err errPhabricatorRepoNotFound) Error() string](#errPhabricatorRepoNotFound.Error)
        * [func (err errPhabricatorRepoNotFound) NotFound() bool](#errPhabricatorRepoNotFound.NotFound)
    * [type MockPhabricator struct](#MockPhabricator)
    * [type RepoNotFoundErr struct](#RepoNotFoundErr)
        * [func (e *RepoNotFoundErr) Error() string](#RepoNotFoundErr.Error)
        * [func (e *RepoNotFoundErr) NotFound() bool](#RepoNotFoundErr.NotFound)
    * [type RepoStore struct](#RepoStore)
        * [func Repos(db dbutil.DB) *RepoStore](#Repos)
        * [func ReposWith(other basestore.ShareableStore) *RepoStore](#ReposWith)
        * [func (s *RepoStore) With(other basestore.ShareableStore) *RepoStore](#RepoStore.With)
        * [func (s *RepoStore) Transact(ctx context.Context) (*RepoStore, error)](#RepoStore.Transact)
        * [func (s *RepoStore) ensureStore()](#RepoStore.ensureStore)
        * [func (s *RepoStore) Get(ctx context.Context, id api.RepoID) (_ *types.Repo, err error)](#RepoStore.Get)
        * [func (s *RepoStore) GetByName(ctx context.Context, nameOrURI api.RepoName) (_ *types.Repo, err error)](#RepoStore.GetByName)
        * [func (s *RepoStore) GetByIDs(ctx context.Context, ids ...api.RepoID) (_ []*types.Repo, err error)](#RepoStore.GetByIDs)
        * [func (s *RepoStore) GetReposSetByIDs(ctx context.Context, ids ...api.RepoID) (map[api.RepoID]*types.Repo, error)](#RepoStore.GetReposSetByIDs)
        * [func (s *RepoStore) Count(ctx context.Context, opt ReposListOptions) (ct int, err error)](#RepoStore.Count)
        * [func (s *RepoStore) List(ctx context.Context, opt ReposListOptions) (results []*types.Repo, err error)](#RepoStore.List)
        * [func (s *RepoStore) ListRepoNames(ctx context.Context, opt ReposListOptions) (results []types.RepoName, err error)](#RepoStore.ListRepoNames)
        * [func (s *RepoStore) listRepos(ctx context.Context, tr *trace.Trace, opt ReposListOptions) (rs []*types.Repo, err error)](#RepoStore.listRepos)
        * [func (s *RepoStore) list(ctx context.Context, tr *trace.Trace, opt ReposListOptions, scanRepo func(rows *sql.Rows) error) error](#RepoStore.list)
        * [func (s *RepoStore) listSQL(ctx context.Context, opt ReposListOptions) (*sqlf.Query, error)](#RepoStore.listSQL)
        * [func (s *RepoStore) ListDefaultRepos(ctx context.Context, opts ListDefaultReposOptions) (results []types.RepoName, err error)](#RepoStore.ListDefaultRepos)
        * [func (s *RepoStore) Create(ctx context.Context, repos ...*types.Repo) (err error)](#RepoStore.Create)
        * [func (s *RepoStore) Delete(ctx context.Context, ids ...api.RepoID) error](#RepoStore.Delete)
        * [func (s *RepoStore) ListEnabledNames(ctx context.Context) ([]string, error)](#RepoStore.ListEnabledNames)
        * [func (s *RepoStore) ExternalServices(ctx context.Context, repoID api.RepoID) ([]*types.ExternalService, error)](#RepoStore.ExternalServices)
        * [func (s *RepoStore) Upsert(ctx context.Context, op InsertRepoOp) error](#RepoStore.Upsert)
    * [type ReposListOptions struct](#ReposListOptions)
    * [type RepoListOrderBy []database.RepoListSort](#RepoListOrderBy)
        * [func (r RepoListOrderBy) SQL() *sqlf.Query](#RepoListOrderBy.SQL)
    * [type RepoListSort struct](#RepoListSort)
        * [func (r RepoListSort) SQL() *sqlf.Query](#RepoListSort.SQL)
    * [type RepoListColumn string](#RepoListColumn)
    * [type ListDefaultReposOptions struct](#ListDefaultReposOptions)
    * [type repoRecord struct](#repoRecord)
        * [func newRepoRecord(r *types.Repo) (*repoRecord, error)](#newRepoRecord)
    * [type externalServiceRepo struct](#externalServiceRepo)
    * [type MockRepos struct](#MockRepos)
        * [func (s *MockRepos) MockGet(t *testing.T, wantRepo api.RepoID) (called *bool)](#MockRepos.MockGet)
        * [func (s *MockRepos) MockGet_Return(t *testing.T, returns *types.Repo) (called *bool)](#MockRepos.MockGet_Return)
        * [func (s *MockRepos) MockGetByName(t testing.TB, want api.RepoName, repo api.RepoID) (called *bool)](#MockRepos.MockGetByName)
        * [func (s *MockRepos) MockList(t testing.TB, wantRepos ...api.RepoName) (called *bool)](#MockRepos.MockList)
        * [func (s *MockRepos) MockListRepoNames(t testing.TB, wantRepos ...api.RepoName) (called *bool)](#MockRepos.MockListRepoNames)
    * [type QueryRunnerStateStore struct](#QueryRunnerStateStore)
        * [func QueryRunnerState(db dbutil.DB) *QueryRunnerStateStore](#QueryRunnerState)
        * [func QueryRunnerStateWith(other basestore.ShareableStore) *QueryRunnerStateStore](#QueryRunnerStateWith)
        * [func (s *QueryRunnerStateStore) With(other basestore.ShareableStore) *QueryRunnerStateStore](#QueryRunnerStateStore.With)
        * [func (s *QueryRunnerStateStore) Transact(ctx context.Context) (*QueryRunnerStateStore, error)](#QueryRunnerStateStore.Transact)
        * [func (s *QueryRunnerStateStore) Get(ctx context.Context, query string) (*SavedQueryInfo, error)](#QueryRunnerStateStore.Get)
        * [func (s *QueryRunnerStateStore) Set(ctx context.Context, info *SavedQueryInfo) error](#QueryRunnerStateStore.Set)
        * [func (s *QueryRunnerStateStore) Delete(ctx context.Context, query string) error](#QueryRunnerStateStore.Delete)
    * [type SavedQueryInfo struct](#SavedQueryInfo)
    * [type SavedSearchStore struct](#SavedSearchStore)
        * [func SavedSearches(db dbutil.DB) *SavedSearchStore](#SavedSearches)
        * [func SavedSearchesWith(other basestore.ShareableStore) *SavedSearchStore](#SavedSearchesWith)
        * [func (s *SavedSearchStore) With(other basestore.ShareableStore) *SavedSearchStore](#SavedSearchStore.With)
        * [func (s *SavedSearchStore) Transact(ctx context.Context) (*SavedSearchStore, error)](#SavedSearchStore.Transact)
        * [func (s *SavedSearchStore) IsEmpty(ctx context.Context) (bool, error)](#SavedSearchStore.IsEmpty)
        * [func (s *SavedSearchStore) ListAll(ctx context.Context) (savedSearches []api.SavedQuerySpecAndConfig, err error)](#SavedSearchStore.ListAll)
        * [func (s *SavedSearchStore) GetByID(ctx context.Context, id int32) (*api.SavedQuerySpecAndConfig, error)](#SavedSearchStore.GetByID)
        * [func (s *SavedSearchStore) ListSavedSearchesByUserID(ctx context.Context, userID int32) ([]*types.SavedSearch, error)](#SavedSearchStore.ListSavedSearchesByUserID)
        * [func (s *SavedSearchStore) ListSavedSearchesByOrgID(ctx context.Context, orgID int32) ([]*types.SavedSearch, error)](#SavedSearchStore.ListSavedSearchesByOrgID)
        * [func (s *SavedSearchStore) Create(ctx context.Context, newSavedSearch *types.SavedSearch) (savedQuery *types.SavedSearch, err error)](#SavedSearchStore.Create)
        * [func (s *SavedSearchStore) Update(ctx context.Context, savedSearch *types.SavedSearch) (savedQuery *types.SavedSearch, err error)](#SavedSearchStore.Update)
        * [func (s *SavedSearchStore) Delete(ctx context.Context, id int32) (err error)](#SavedSearchStore.Delete)
    * [type MockSavedSearches struct](#MockSavedSearches)
    * [type SearchContextsStore struct](#SearchContextsStore)
        * [func SearchContexts(db dbutil.DB) *SearchContextsStore](#SearchContexts)
        * [func (s *SearchContextsStore) Transact(ctx context.Context) (*SearchContextsStore, error)](#SearchContextsStore.Transact)
        * [func (s *SearchContextsStore) listSearchContexts(ctx context.Context, cond *sqlf.Query, orderBy *sqlf.Query, limit int32, offset int32) ([]*types.SearchContext, error)](#SearchContextsStore.listSearchContexts)
        * [func (s *SearchContextsStore) ListSearchContexts(ctx context.Context, pageOpts ListSearchContextsPageOptions, opts ListSearchContextsOptions) ([]*types.SearchContext, error)](#SearchContextsStore.ListSearchContexts)
        * [func (s *SearchContextsStore) CountSearchContexts(ctx context.Context, opts ListSearchContextsOptions) (int32, error)](#SearchContextsStore.CountSearchContexts)
        * [func (s *SearchContextsStore) GetSearchContext(ctx context.Context, opts GetSearchContextOptions) (*types.SearchContext, error)](#SearchContextsStore.GetSearchContext)
        * [func (s *SearchContextsStore) DeleteSearchContext(ctx context.Context, searchContextID int64) error](#SearchContextsStore.DeleteSearchContext)
        * [func (s *SearchContextsStore) CreateSearchContextWithRepositoryRevisions(ctx context.Context, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (createdSearchContext *types.SearchContext, err error)](#SearchContextsStore.CreateSearchContextWithRepositoryRevisions)
        * [func (s *SearchContextsStore) UpdateSearchContextWithRepositoryRevisions(ctx context.Context, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (_ *types.SearchContext, err error)](#SearchContextsStore.UpdateSearchContextWithRepositoryRevisions)
        * [func (s *SearchContextsStore) SetSearchContextRepositoryRevisions(ctx context.Context, searchContextID int64, repositoryRevisions []*types.SearchContextRepositoryRevisions) (err error)](#SearchContextsStore.SetSearchContextRepositoryRevisions)
        * [func (s *SearchContextsStore) createSearchContext(ctx context.Context, searchContext *types.SearchContext) (*types.SearchContext, error)](#SearchContextsStore.createSearchContext)
        * [func (s *SearchContextsStore) updateSearchContext(ctx context.Context, searchContext *types.SearchContext) (*types.SearchContext, error)](#SearchContextsStore.updateSearchContext)
        * [func (s *SearchContextsStore) GetSearchContextRepositoryRevisions(ctx context.Context, searchContextID int64) ([]*types.SearchContextRepositoryRevisions, error)](#SearchContextsStore.GetSearchContextRepositoryRevisions)
        * [func (s *SearchContextsStore) GetAllRevisionsForRepo(ctx context.Context, repoID int32) ([]string, error)](#SearchContextsStore.GetAllRevisionsForRepo)
    * [type SearchContextsOrderByOption uint8](#SearchContextsOrderByOption)
    * [type ListSearchContextsPageOptions struct](#ListSearchContextsPageOptions)
    * [type ListSearchContextsOptions struct](#ListSearchContextsOptions)
    * [type GetSearchContextOptions struct](#GetSearchContextOptions)
    * [type MockSearchContexts struct](#MockSearchContexts)
    * [type SecurityEvent struct](#SecurityEvent)
    * [type SecurityEventLogStore struct](#SecurityEventLogStore)
        * [func SecurityEventLogs(db dbutil.DB) *SecurityEventLogStore](#SecurityEventLogs)
        * [func (s *SecurityEventLogStore) Insert(ctx context.Context, e *SecurityEvent) error](#SecurityEventLogStore.Insert)
    * [type SettingStore struct](#SettingStore)
        * [func Settings(db dbutil.DB) *SettingStore](#Settings)
        * [func SettingsWith(other basestore.ShareableStore) *SettingStore](#SettingsWith)
        * [func (s *SettingStore) With(other basestore.ShareableStore) *SettingStore](#SettingStore.With)
        * [func (s *SettingStore) Transact(ctx context.Context) (*SettingStore, error)](#SettingStore.Transact)
        * [func (o *SettingStore) CreateIfUpToDate(ctx context.Context, subject api.SettingsSubject, lastID *int32, authorUserID *int32, contents string) (latestSetting *api.Settings, err error)](#SettingStore.CreateIfUpToDate)
        * [func (o *SettingStore) GetLatest(ctx context.Context, subject api.SettingsSubject) (*api.Settings, error)](#SettingStore.GetLatest)
        * [func (o *SettingStore) GetLastestSchemaSettings(ctx context.Context, subject api.SettingsSubject) (*schema.Settings, error)](#SettingStore.GetLastestSchemaSettings)
        * [func (o *SettingStore) ListAll(ctx context.Context, impreciseSubstring string) (_ []*api.Settings, err error)](#SettingStore.ListAll)
        * [func (o *SettingStore) getLatest(ctx context.Context, subject api.SettingsSubject) (*api.Settings, error)](#SettingStore.getLatest)
        * [func (o *SettingStore) parseQueryRows(ctx context.Context, rows *sql.Rows) ([]*api.Settings, error)](#SettingStore.parseQueryRows)
    * [type MockSettings struct](#MockSettings)
    * [type SurveyResponseListOptions struct](#SurveyResponseListOptions)
    * [type SurveyResponseStore struct](#SurveyResponseStore)
        * [func SurveyResponses(db dbutil.DB) *SurveyResponseStore](#SurveyResponses)
        * [func SurveyResponsesWith(other basestore.ShareableStore) *SurveyResponseStore](#SurveyResponsesWith)
        * [func (s *SurveyResponseStore) With(other basestore.ShareableStore) *SurveyResponseStore](#SurveyResponseStore.With)
        * [func (s *SurveyResponseStore) Transact(ctx context.Context) (*SurveyResponseStore, error)](#SurveyResponseStore.Transact)
        * [func (s *SurveyResponseStore) Create(ctx context.Context, userID *int32, email *string, score int, reason *string, better *string) (id int64, err error)](#SurveyResponseStore.Create)
        * [func (s *SurveyResponseStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.SurveyResponse, error)](#SurveyResponseStore.getBySQL)
        * [func (s *SurveyResponseStore) GetAll(ctx context.Context) ([]*types.SurveyResponse, error)](#SurveyResponseStore.GetAll)
        * [func (s *SurveyResponseStore) GetByUserID(ctx context.Context, userID int32) ([]*types.SurveyResponse, error)](#SurveyResponseStore.GetByUserID)
        * [func (s *SurveyResponseStore) Count(ctx context.Context) (int, error)](#SurveyResponseStore.Count)
        * [func (s *SurveyResponseStore) Last30DaysAverageScore(ctx context.Context) (float64, error)](#SurveyResponseStore.Last30DaysAverageScore)
        * [func (s *SurveyResponseStore) Last30DaysNetPromoterScore(ctx context.Context) (int, error)](#SurveyResponseStore.Last30DaysNetPromoterScore)
        * [func (s *SurveyResponseStore) Last30DaysCount(ctx context.Context) (int, error)](#SurveyResponseStore.Last30DaysCount)
    * [type UserCredential struct](#UserCredential)
        * [func (uc *UserCredential) Authenticator(ctx context.Context) (auth.Authenticator, error)](#UserCredential.Authenticator)
        * [func (uc *UserCredential) SetAuthenticator(ctx context.Context, a auth.Authenticator) error](#UserCredential.SetAuthenticator)
    * [type UserCredentialNotFoundErr struct](#UserCredentialNotFoundErr)
        * [func (err UserCredentialNotFoundErr) Error() string](#UserCredentialNotFoundErr.Error)
        * [func (UserCredentialNotFoundErr) NotFound() bool](#UserCredentialNotFoundErr.NotFound)
    * [type UserCredentialsStore struct](#UserCredentialsStore)
        * [func UserCredentials(db dbutil.DB, key encryption.Key) *UserCredentialsStore](#UserCredentials)
        * [func UserCredentialsWith(other basestore.ShareableStore, key encryption.Key) *UserCredentialsStore](#UserCredentialsWith)
        * [func (s *UserCredentialsStore) With(other basestore.ShareableStore) *UserCredentialsStore](#UserCredentialsStore.With)
        * [func (s *UserCredentialsStore) Transact(ctx context.Context) (*UserCredentialsStore, error)](#UserCredentialsStore.Transact)
        * [func (s *UserCredentialsStore) Create(ctx context.Context, scope UserCredentialScope, credential auth.Authenticator) (*UserCredential, error)](#UserCredentialsStore.Create)
        * [func (s *UserCredentialsStore) Update(ctx context.Context, credential *UserCredential) error](#UserCredentialsStore.Update)
        * [func (s *UserCredentialsStore) Delete(ctx context.Context, id int64) error](#UserCredentialsStore.Delete)
        * [func (s *UserCredentialsStore) GetByID(ctx context.Context, id int64) (*UserCredential, error)](#UserCredentialsStore.GetByID)
        * [func (s *UserCredentialsStore) GetByScope(ctx context.Context, scope UserCredentialScope) (*UserCredential, error)](#UserCredentialsStore.GetByScope)
        * [func (s *UserCredentialsStore) List(ctx context.Context, opts UserCredentialsListOpts) ([]*UserCredential, int, error)](#UserCredentialsStore.List)
    * [type UserCredentialScope struct](#UserCredentialScope)
    * [type UserCredentialsListOpts struct](#UserCredentialsListOpts)
        * [func (opts *UserCredentialsListOpts) sql() *sqlf.Query](#UserCredentialsListOpts.sql)
    * [type MockUserCredentials struct](#MockUserCredentials)
    * [type UserEmail struct](#UserEmail)
        * [func (email *UserEmail) NeedsVerificationCoolDown() bool](#UserEmail.NeedsVerificationCoolDown)
    * [type userEmailNotFoundError struct](#userEmailNotFoundError)
        * [func (err userEmailNotFoundError) Error() string](#userEmailNotFoundError.Error)
        * [func (err userEmailNotFoundError) NotFound() bool](#userEmailNotFoundError.NotFound)
    * [type UserEmailsStore struct](#UserEmailsStore)
        * [func UserEmails(db dbutil.DB) *UserEmailsStore](#UserEmails)
        * [func UserEmailsWith(other basestore.ShareableStore) *UserEmailsStore](#UserEmailsWith)
        * [func (s *UserEmailsStore) With(other basestore.ShareableStore) *UserEmailsStore](#UserEmailsStore.With)
        * [func (s *UserEmailsStore) Transact(ctx context.Context) (*UserEmailsStore, error)](#UserEmailsStore.Transact)
        * [func (s *UserEmailsStore) ensureStore()](#UserEmailsStore.ensureStore)
        * [func (s *UserEmailsStore) GetInitialSiteAdminEmail(ctx context.Context) (email string, err error)](#UserEmailsStore.GetInitialSiteAdminEmail)
        * [func (s *UserEmailsStore) GetPrimaryEmail(ctx context.Context, id int32) (email string, verified bool, err error)](#UserEmailsStore.GetPrimaryEmail)
        * [func (s *UserEmailsStore) SetPrimaryEmail(ctx context.Context, userID int32, email string) error](#UserEmailsStore.SetPrimaryEmail)
        * [func (s *UserEmailsStore) Get(ctx context.Context, userID int32, email string) (emailCanonicalCase string, verified bool, err error)](#UserEmailsStore.Get)
        * [func (s *UserEmailsStore) Add(ctx context.Context, userID int32, email string, verificationCode *string) error](#UserEmailsStore.Add)
        * [func (s *UserEmailsStore) Remove(ctx context.Context, userID int32, email string) error](#UserEmailsStore.Remove)
        * [func (s *UserEmailsStore) Verify(ctx context.Context, userID int32, email, code string) (bool, error)](#UserEmailsStore.Verify)
        * [func (s *UserEmailsStore) SetVerified(ctx context.Context, userID int32, email string, verified bool) error](#UserEmailsStore.SetVerified)
        * [func (s *UserEmailsStore) SetLastVerification(ctx context.Context, userID int32, email, code string) error](#UserEmailsStore.SetLastVerification)
        * [func (s *UserEmailsStore) GetLatestVerificationSentEmail(ctx context.Context, email string) (*UserEmail, error)](#UserEmailsStore.GetLatestVerificationSentEmail)
        * [func (s *UserEmailsStore) GetVerifiedEmails(ctx context.Context, emails ...string) ([]*UserEmail, error)](#UserEmailsStore.GetVerifiedEmails)
        * [func (s *UserEmailsStore) ListByUser(ctx context.Context, opt UserEmailsListOptions) ([]*UserEmail, error)](#UserEmailsStore.ListByUser)
        * [func (s *UserEmailsStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*UserEmail, error)](#UserEmailsStore.getBySQL)
    * [type UserEmailsListOptions struct](#UserEmailsListOptions)
    * [type MockUserEmails struct](#MockUserEmails)
    * [type UserPublicRepoStore struct](#UserPublicRepoStore)
        * [func UserPublicRepos(db dbutil.DB) *UserPublicRepoStore](#UserPublicRepos)
        * [func UserPublicReposWithStore(store *basestore.Store) *UserPublicRepoStore](#UserPublicReposWithStore)
        * [func (s *UserPublicRepoStore) SetUserRepos(ctx context.Context, userID int32, repos []UserPublicRepo) (err error)](#UserPublicRepoStore.SetUserRepos)
        * [func (s *UserPublicRepoStore) SetUserRepo(ctx context.Context, upr UserPublicRepo) error](#UserPublicRepoStore.SetUserRepo)
        * [func (s *UserPublicRepoStore) ListByUser(ctx context.Context, userID int32) ([]UserPublicRepo, error)](#UserPublicRepoStore.ListByUser)
    * [type UserPublicRepo struct](#UserPublicRepo)
    * [type MockUserPublicRepos struct](#MockUserPublicRepos)
    * [type UserStore struct](#UserStore)
        * [func Users(db dbutil.DB) *UserStore](#Users)
        * [func UsersWith(other basestore.ShareableStore) *UserStore](#UsersWith)
        * [func (u *UserStore) With(other basestore.ShareableStore) *UserStore](#UserStore.With)
        * [func (u *UserStore) Transact(ctx context.Context) (*UserStore, error)](#UserStore.Transact)
        * [func (u *UserStore) ensureStore()](#UserStore.ensureStore)
        * [func (u *UserStore) Create(ctx context.Context, info NewUser) (newUser *types.User, err error)](#UserStore.Create)
        * [func (u *UserStore) create(ctx context.Context, info NewUser) (newUser *types.User, err error)](#UserStore.create)
        * [func (u *UserStore) Update(ctx context.Context, id int32, update UserUpdate) (err error)](#UserStore.Update)
        * [func (u *UserStore) Delete(ctx context.Context, id int32) (err error)](#UserStore.Delete)
        * [func (u *UserStore) HardDelete(ctx context.Context, id int32) (err error)](#UserStore.HardDelete)
        * [func (u *UserStore) SetIsSiteAdmin(ctx context.Context, id int32, isSiteAdmin bool) error](#UserStore.SetIsSiteAdmin)
        * [func (u *UserStore) CheckAndDecrementInviteQuota(ctx context.Context, userID int32) (ok bool, err error)](#UserStore.CheckAndDecrementInviteQuota)
        * [func (u *UserStore) GetByID(ctx context.Context, id int32) (*types.User, error)](#UserStore.GetByID)
        * [func (u *UserStore) GetByVerifiedEmail(ctx context.Context, email string) (*types.User, error)](#UserStore.GetByVerifiedEmail)
        * [func (u *UserStore) GetByUsername(ctx context.Context, username string) (*types.User, error)](#UserStore.GetByUsername)
        * [func (u *UserStore) GetByUsernames(ctx context.Context, usernames ...string) ([]*types.User, error)](#UserStore.GetByUsernames)
        * [func (u *UserStore) GetByCurrentAuthUser(ctx context.Context) (*types.User, error)](#UserStore.GetByCurrentAuthUser)
        * [func (u *UserStore) InvalidateSessionsByID(ctx context.Context, id int32) (err error)](#UserStore.InvalidateSessionsByID)
        * [func (u *UserStore) Count(ctx context.Context, opt *UsersListOptions) (int, error)](#UserStore.Count)
        * [func (u *UserStore) List(ctx context.Context, opt *UsersListOptions) (_ []*types.User, err error)](#UserStore.List)
        * [func (u *UserStore) ListDates(ctx context.Context) (dates []types.UserDates, _ error)](#UserStore.ListDates)
        * [func (*UserStore) listSQL(opt UsersListOptions) (conds []*sqlf.Query)](#UserStore.listSQL)
        * [func (u *UserStore) getOneBySQL(ctx context.Context, q *sqlf.Query) (*types.User, error)](#UserStore.getOneBySQL)
        * [func (u *UserStore) getBySQL(ctx context.Context, query *sqlf.Query) ([]*types.User, error)](#UserStore.getBySQL)
        * [func (u *UserStore) IsPassword(ctx context.Context, id int32, password string) (bool, error)](#UserStore.IsPassword)
        * [func (u *UserStore) RenewPasswordResetCode(ctx context.Context, id int32) (string, error)](#UserStore.RenewPasswordResetCode)
        * [func (u *UserStore) SetPassword(ctx context.Context, id int32, resetCode, newPassword string) (bool, error)](#UserStore.SetPassword)
        * [func (u *UserStore) DeletePasswordResetCode(ctx context.Context, id int32) error](#UserStore.DeletePasswordResetCode)
        * [func (u *UserStore) UpdatePassword(ctx context.Context, id int32, oldPassword, newPassword string) error](#UserStore.UpdatePassword)
        * [func (u *UserStore) CreatePassword(ctx context.Context, id int32, password string) error](#UserStore.CreatePassword)
        * [func (u *UserStore) RandomizePasswordAndClearPasswordResetRateLimit(ctx context.Context, id int32) error](#UserStore.RandomizePasswordAndClearPasswordResetRateLimit)
        * [func (u *UserStore) SetTag(ctx context.Context, userID int32, tag string, present bool) error](#UserStore.SetTag)
        * [func (u *UserStore) HasTag(ctx context.Context, userID int32, tag string) (bool, error)](#UserStore.HasTag)
        * [func (u *UserStore) Tags(ctx context.Context, userID int32) (map[string]bool, error)](#UserStore.Tags)
        * [func (u *UserStore) UserAllowedExternalServices(ctx context.Context, userID int32) (conf.ExternalServiceMode, error)](#UserStore.UserAllowedExternalServices)
        * [func (u *UserStore) CurrentUserAllowedExternalServices(ctx context.Context) (conf.ExternalServiceMode, error)](#UserStore.CurrentUserAllowedExternalServices)
    * [type userNotFoundErr struct](#userNotFoundErr)
        * [func (err userNotFoundErr) Error() string](#userNotFoundErr.Error)
        * [func (err userNotFoundErr) NotFound() bool](#userNotFoundErr.NotFound)
    * [type errCannotCreateUser struct](#errCannotCreateUser)
        * [func (err errCannotCreateUser) Error() string](#errCannotCreateUser.Error)
        * [func (err errCannotCreateUser) Code() string](#errCannotCreateUser.Code)
    * [type NewUser struct](#NewUser)
    * [type UserUpdate struct](#UserUpdate)
    * [type UsersListOptions struct](#UsersListOptions)
    * [type MockUsers struct](#MockUsers)
        * [func (s *MockUsers) MockGetByID_Return(t *testing.T, returns *types.User, returnsErr error) (called *bool)](#MockUsers.MockGetByID_Return)
    * [type mockEncrypter struct](#mockEncrypter)
        * [func (me *mockEncrypter) Encrypt(ctx context.Context, value []byte) ([]byte, error)](#mockEncrypter.Encrypt)
    * [type badAuthenticator struct{}](#badAuthenticator)
        * [func (*badAuthenticator) Authenticate(*http.Request) error](#badAuthenticator.Authenticate)
        * [func (*badAuthenticator) Hash() string](#badAuthenticator.Hash)
    * [type invalidKey struct{}](#invalidKey)
        * [func (k invalidKey) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)](#invalidKey.Encrypt)
        * [func (k invalidKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)](#invalidKey.Decrypt)
        * [func (k invalidKey) Version(ctx context.Context) (encryption.KeyVersion, error)](#invalidKey.Version)
    * [type InsertRepoOp struct](#InsertRepoOp)
    * [type fakeProvider struct](#fakeProvider)
        * [func (p *fakeProvider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (mine *extsvc.Account, err error)](#fakeProvider.FetchAccount)
        * [func (p *fakeProvider) ServiceType() string](#fakeProvider.ServiceType)
        * [func (p *fakeProvider) ServiceID() string](#fakeProvider.ServiceID)
        * [func (p *fakeProvider) URN() string](#fakeProvider.URN)
        * [func (p *fakeProvider) Validate() (problems []string)](#fakeProvider.Validate)
        * [func (p *fakeProvider) FetchUserPerms(context.Context, *extsvc.Account) (*authz.ExternalUserPermissions, error)](#fakeProvider.FetchUserPerms)
        * [func (p *fakeProvider) FetchRepoPerms(context.Context, *extsvc.Repository) ([]extsvc.AccountID, error)](#fakeProvider.FetchRepoPerms)
    * [type invalidAuth struct{}](#invalidAuth)
        * [func (*invalidAuth) Authenticate(_ *http.Request) error](#invalidAuth.Authenticate)
        * [func (*invalidAuth) Hash() string](#invalidAuth.Hash)
* [Functions](#func)
    * [func toSHA256Bytes(input []byte) []byte](#toSHA256Bytes)
    * [func EncryptAuthenticator(ctx context.Context, enc encryption.Encrypter, a auth.Authenticator) ([]byte, error)](#EncryptAuthenticator)
    * [func marshalAuthenticator(a auth.Authenticator) (string, error)](#marshalAuthenticator)
    * [func UnmarshalAuthenticator(raw string) (auth.Authenticator, error)](#UnmarshalAuthenticator)
    * [func calcStartDate(now time.Time, periodType PeriodType, periods int) (time.Time, bool)](#calcStartDate)
    * [func calcEndDate(startDate time.Time, periodType PeriodType, periods int) (time.Time, bool)](#calcEndDate)
    * [func makeDateTruncExpression(unit, expr string) string](#makeDateTruncExpression)
    * [func MaybeEncrypt(ctx context.Context, key encryption.Key, data string) (maybeEncryptedData, keyID string, err error)](#MaybeEncrypt)
    * [func MaybeDecrypt(ctx context.Context, key encryption.Key, data, keyIdent string) (string, error)](#MaybeDecrypt)
    * [func rawMessagePtr(s string) *json.RawMessage](#rawMessagePtr)
    * [func validateOtherExternalServiceConnection(c *schema.OtherExternalServiceConnection) error](#validateOtherExternalServiceConnection)
    * [func upsertAuthorizationToExternalService(kind, config string) (string, error)](#upsertAuthorizationToExternalService)
    * [func scanFeatureFlag(scanner rowScanner) (*ff.FeatureFlag, error)](#scanFeatureFlag)
    * [func scanFeatureFlagOverrides(rows *sql.Rows) ([]*ff.Override, error)](#scanFeatureFlagOverrides)
    * [func scanFeatureFlagOverride(scanner rowScanner) (*ff.Override, error)](#scanFeatureFlagOverride)
    * [func sanitizeToUTF8(s string) string](#sanitizeToUTF8)
    * [func getNamespaceQuery(preds []*sqlf.Query) *sqlf.Query](#getNamespaceQuery)
    * [func IsRepoNotFoundErr(err error) bool](#IsRepoNotFoundErr)
    * [func minimalColumns(columns []string) []string](#minimalColumns)
    * [func scanRepo(rows *sql.Rows, r *types.Repo) (err error)](#scanRepo)
    * [func nullTimeColumn(t time.Time) *time.Time](#nullTimeColumn)
    * [func nullInt32Column(n int32) *int32](#nullInt32Column)
    * [func nullStringColumn(s string) *string](#nullStringColumn)
    * [func metadataColumn(metadata interface{}) (msg json.RawMessage, err error)](#metadataColumn)
    * [func sourcesColumn(repoID api.RepoID, sources map[string]*types.SourceInfo) (json.RawMessage, error)](#sourcesColumn)
    * [func parsePattern(p string) ([]*sqlf.Query, error)](#parsePattern)
    * [func parseCursorConds(opt ReposListOptions) (conds []*sqlf.Query, err error)](#parseCursorConds)
    * [func parseIncludePattern(pattern string) (exact, like []string, regexp string, err error)](#parseIncludePattern)
    * [func allMatchingStrings(re *regexpsyntax.Regexp, last bool) (exact, contains, prefix, suffix []string, err error)](#allMatchingStrings)
    * [func AuthzQueryConds(ctx context.Context, db dbutil.DB) (*sqlf.Query, error)](#AuthzQueryConds)
    * [func authzQuery(bypassAuthz, usePermissionsUserMapping bool, authenticatedUserID int32, perms authz.Perms) *sqlf.Query](#authzQuery)
    * [func isInternalActor(ctx context.Context) bool](#isInternalActor)
    * [func searchContextsPermissionsCondition(ctx context.Context, db dbutil.DB) (*sqlf.Query, error)](#searchContextsPermissionsCondition)
    * [func getSearchContextOrderByClause(orderBy SearchContextsOrderByOption, descending bool) *sqlf.Query](#getSearchContextOrderByClause)
    * [func getSearchContextNamespaceQueryConditions(namespaceUserID, namespaceOrgID int32) ([]*sqlf.Query, error)](#getSearchContextNamespaceQueryConditions)
    * [func idsToQueries(ids []int32) []*sqlf.Query](#idsToQueries)
    * [func getSearchContextsQueryConditions(opts ListSearchContextsOptions) ([]*sqlf.Query, error)](#getSearchContextsQueryConditions)
    * [func scanSingleSearchContext(rows *sql.Rows) (*types.SearchContext, error)](#scanSingleSearchContext)
    * [func scanSearchContexts(rows *sql.Rows) ([]*types.SearchContext, error)](#scanSearchContexts)
    * [func thirtyDaysAgo() string](#thirtyDaysAgo)
    * [func MockEmailExistsErr() error](#MockEmailExistsErr)
    * [func MockUsernameExistsErr() error](#MockUsernameExistsErr)
    * [func strptr(s string) *string](#strptr)
    * [func boolptr(b bool) *bool](#boolptr)
    * [func assertJSONEqual(t *testing.T, want, got interface{})](#assertJSONEqual)
    * [func jsonEqual(t *testing.T, a, b interface{}) bool](#jsonEqual)
    * [func asJSON(t *testing.T, v interface{}) string](#asJSON)
    * [func scanUserCredential(cred *UserCredential, s interface {...](#scanUserCredential)
    * [func keyID(ctx context.Context, key encryption.Key) (string, error)](#keyID)
    * [func NewUserNotFoundError(userID int32) error](#NewUserNotFoundError)
    * [func IsUsernameExists(err error) bool](#IsUsernameExists)
    * [func IsEmailExists(err error) bool](#IsEmailExists)
    * [func CheckPasswordLength(pw string) error](#CheckPasswordLength)
    * [func orgsForAllUsersToJoin(userOrgMap map[string][]string) ([]string, []error)](#orgsForAllUsersToJoin)
    * [func hashPassword(password string) (sql.NullString, error)](#hashPassword)
    * [func validPassword(hash, password string) bool](#validPassword)
    * [func TestAccessTokens_Create(t *testing.T)](#TestAccessTokens_Create)
    * [func TestAccessTokens_List(t *testing.T)](#TestAccessTokens_List)
    * [func TestAccessTokens_Lookup(t *testing.T)](#TestAccessTokens_Lookup)
    * [func TestAccessTokens_Lookup_deletedUser(t *testing.T)](#TestAccessTokens_Lookup_deletedUser)
    * [func TestEncryptAuthenticator(t *testing.T)](#TestEncryptAuthenticator)
    * [func init()](#init.db_test.go)
    * [func TestPassword(t *testing.T)](#TestPassword)
    * [func TestErrorsInterface(t *testing.T)](#TestErrorsInterface)
    * [func functionName(i interface{}) string](#functionName)
    * [func TestEventLogs_ValidInfo(t *testing.T)](#TestEventLogs_ValidInfo)
    * [func TestEventLogs_CountUniqueUsersPerPeriod(t *testing.T)](#TestEventLogs_CountUniqueUsersPerPeriod)
    * [func TestEventLogs_UsersUsageCounts(t *testing.T)](#TestEventLogs_UsersUsageCounts)
    * [func TestEventLogs_SiteUsage(t *testing.T)](#TestEventLogs_SiteUsage)
    * [func TestEventLogs_codeIntelligenceWeeklyUsersCount(t *testing.T)](#TestEventLogs_codeIntelligenceWeeklyUsersCount)
    * [func TestEventLogs_TestCodeIntelligenceRepositoryCounts(t *testing.T)](#TestEventLogs_TestCodeIntelligenceRepositoryCounts)
    * [func TestEventLogs_AggregatedCodeIntelEvents(t *testing.T)](#TestEventLogs_AggregatedCodeIntelEvents)
    * [func TestEventLogs_AggregatedSparseCodeIntelEvents(t *testing.T)](#TestEventLogs_AggregatedSparseCodeIntelEvents)
    * [func TestEventLogs_AggregatedSparseSearchEvents(t *testing.T)](#TestEventLogs_AggregatedSparseSearchEvents)
    * [func TestEventLogs_AggregatedSearchEvents(t *testing.T)](#TestEventLogs_AggregatedSearchEvents)
    * [func TestEventLogs_ListAll(t *testing.T)](#TestEventLogs_ListAll)
    * [func TestEventLogs_LatestPing(t *testing.T)](#TestEventLogs_LatestPing)
    * [func assertUsageValue(t *testing.T, v UsageValue, start time.Time, count int)](#assertUsageValue)
    * [func TestExternalAccounts_LookupUserAndSave(t *testing.T)](#TestExternalAccounts_LookupUserAndSave)
    * [func TestExternalAccounts_AssociateUserAndSave(t *testing.T)](#TestExternalAccounts_AssociateUserAndSave)
    * [func TestExternalAccounts_CreateUserAndSave(t *testing.T)](#TestExternalAccounts_CreateUserAndSave)
    * [func TestExternalAccounts_CreateUserAndSave_NilData(t *testing.T)](#TestExternalAccounts_CreateUserAndSave_NilData)
    * [func TestExternalAccounts_List(t *testing.T)](#TestExternalAccounts_List)
    * [func TestExternalAccounts_Encryption(t *testing.T)](#TestExternalAccounts_Encryption)
    * [func simplifyExternalAccount(account *extsvc.Account)](#simplifyExternalAccount)
    * [func TestExternalAccounts_expiredAt(t *testing.T)](#TestExternalAccounts_expiredAt)
    * [func TestExternalServicesListOptions_sqlConditions(t *testing.T)](#TestExternalServicesListOptions_sqlConditions)
    * [func TestExternalServicesStore_ValidateConfig(t *testing.T)](#TestExternalServicesStore_ValidateConfig)
    * [func TestExternalServicesStore_Create(t *testing.T)](#TestExternalServicesStore_Create)
    * [func TestExternalServicesStore_CreateWithTierEnforcement(t *testing.T)](#TestExternalServicesStore_CreateWithTierEnforcement)
    * [func TestExternalServicesStore_Update(t *testing.T)](#TestExternalServicesStore_Update)
    * [func TestUpsertAuthorizationToExternalService(t *testing.T)](#TestUpsertAuthorizationToExternalService)
    * [func TestCountRepoCount(t *testing.T)](#TestCountRepoCount)
    * [func TestExternalServicesStore_Delete(t *testing.T)](#TestExternalServicesStore_Delete)
    * [func TestExternalServicesStore_GetByID(t *testing.T)](#TestExternalServicesStore_GetByID)
    * [func TestExternalServicesStore_GetByID_Encrypted(t *testing.T)](#TestExternalServicesStore_GetByID_Encrypted)
    * [func TestGetAffiliatedSyncErrors(t *testing.T)](#TestGetAffiliatedSyncErrors)
    * [func TestGetLastSyncError(t *testing.T)](#TestGetLastSyncError)
    * [func TestExternalServicesStore_List(t *testing.T)](#TestExternalServicesStore_List)
    * [func TestExternalServicesStore_DistinctKinds(t *testing.T)](#TestExternalServicesStore_DistinctKinds)
    * [func TestExternalServicesStore_Count(t *testing.T)](#TestExternalServicesStore_Count)
    * [func TestExternalServicesStore_Upsert(t *testing.T)](#TestExternalServicesStore_Upsert)
    * [func TestExternalServiceStore_GetExternalServiceSyncJobs(t *testing.T)](#TestExternalServiceStore_GetExternalServiceSyncJobs)
    * [func TestExternalServicesStore_OneCloudDefaultPerKind(t *testing.T)](#TestExternalServicesStore_OneCloudDefaultPerKind)
    * [func TestExternalServiceStore_SyncDue(t *testing.T)](#TestExternalServiceStore_SyncDue)
    * [func TestFeatureFlagStore(t *testing.T)](#TestFeatureFlagStore)
    * [func errorContains(s string) require.ErrorAssertionFunc](#errorContains)
    * [func cleanup(t *testing.T, db *sql.DB) func()](#cleanup)
    * [func testNewFeatureFlagRoundtrip(t *testing.T)](#testNewFeatureFlagRoundtrip)
    * [func testListFeatureFlags(t *testing.T)](#testListFeatureFlags)
    * [func testNewOverrideRoundtrip(t *testing.T)](#testNewOverrideRoundtrip)
    * [func testListUserOverrides(t *testing.T)](#testListUserOverrides)
    * [func testListOrgOverrides(t *testing.T)](#testListOrgOverrides)
    * [func testUserFlags(t *testing.T)](#testUserFlags)
    * [func testAnonymousUserFlags(t *testing.T)](#testAnonymousUserFlags)
    * [func testUserlessFeatureFlags(t *testing.T)](#testUserlessFeatureFlags)
    * [func TestIterateRepoGitserverStatus(t *testing.T)](#TestIterateRepoGitserverStatus)
    * [func TestGitserverReposGetByID(t *testing.T)](#TestGitserverReposGetByID)
    * [func TestSetCloneStatus(t *testing.T)](#TestSetCloneStatus)
    * [func TestSetLastError(t *testing.T)](#TestSetLastError)
    * [func TestGitserverRepoUpsertNullShard(t *testing.T)](#TestGitserverRepoUpsertNullShard)
    * [func TestGitserverRepoUpsert(t *testing.T)](#TestGitserverRepoUpsert)
    * [func TestSanitizeToUTF8(t *testing.T)](#TestSanitizeToUTF8)
    * [func init()](#init.main_test.go)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestNamespaces(t *testing.T)](#TestNamespaces)
    * [func TestExternalServiceConfigMigrator(t *testing.T)](#TestExternalServiceConfigMigrator)
    * [func TestExternalAccountsMigrator(t *testing.T)](#TestExternalAccountsMigrator)
    * [func TestOrgInvitations(t *testing.T)](#TestOrgInvitations)
    * [func TestOrgMembers_CreateMembershipInOrgsForAllUsers(t *testing.T)](#TestOrgMembers_CreateMembershipInOrgsForAllUsers)
    * [func TestOrgs_ValidNames(t *testing.T)](#TestOrgs_ValidNames)
    * [func TestOrgs_Count(t *testing.T)](#TestOrgs_Count)
    * [func TestOrgs_Delete(t *testing.T)](#TestOrgs_Delete)
    * [func sortedRepoNames(repos []*types.Repo) []api.RepoName](#sortedRepoNames)
    * [func repoNames(repos []*types.Repo) []api.RepoName](#repoNames)
    * [func createRepo(ctx context.Context, t *testing.T, db *sql.DB, repo *types.Repo)](#createRepo)
    * [func mustCreate(ctx context.Context, t *testing.T, db *sql.DB, repo *types.Repo, cloneStatus types.CloneStatus) []*types.Repo](#mustCreate)
    * [func repoNamesFromRepos(repos []*types.Repo) []types.RepoName](#repoNamesFromRepos)
    * [func reposFromRepoNames(names []types.RepoName) []*types.Repo](#reposFromRepoNames)
    * [func TestRepos_Get(t *testing.T)](#TestRepos_Get)
    * [func TestRepos_GetByIDs(t *testing.T)](#TestRepos_GetByIDs)
    * [func TestRepos_List(t *testing.T)](#TestRepos_List)
    * [func TestRepos_ListRepoNames_userID(t *testing.T)](#TestRepos_ListRepoNames_userID)
    * [func TestRepos_List_fork(t *testing.T)](#TestRepos_List_fork)
    * [func TestRepos_List_FailedSync(t *testing.T)](#TestRepos_List_FailedSync)
    * [func TestRepos_List_cloned(t *testing.T)](#TestRepos_List_cloned)
    * [func TestRepos_List_ids(t *testing.T)](#TestRepos_List_ids)
    * [func TestRepos_List_serviceTypes(t *testing.T)](#TestRepos_List_serviceTypes)
    * [func TestRepos_List_pagination(t *testing.T)](#TestRepos_List_pagination)
    * [func TestRepos_List_query1(t *testing.T)](#TestRepos_List_query1)
    * [func TestRepos_List_correct_ranking(t *testing.T)](#TestRepos_List_correct_ranking)
    * [func TestRepos_List_sort(t *testing.T)](#TestRepos_List_sort)
    * [func TestRepos_List_patterns(t *testing.T)](#TestRepos_List_patterns)
    * [func TestRepos_List_queryPattern(t *testing.T)](#TestRepos_List_queryPattern)
    * [func TestRepos_List_queryAndPatternsMutuallyExclusive(t *testing.T)](#TestRepos_List_queryAndPatternsMutuallyExclusive)
    * [func TestRepos_createRepo(t *testing.T)](#TestRepos_createRepo)
    * [func TestRepos_List_useOr(t *testing.T)](#TestRepos_List_useOr)
    * [func TestRepos_List_externalServiceID(t *testing.T)](#TestRepos_List_externalServiceID)
    * [func TestRepos_ListRepoNames(t *testing.T)](#TestRepos_ListRepoNames)
    * [func TestRepos_ListRepoNames_fork(t *testing.T)](#TestRepos_ListRepoNames_fork)
    * [func TestRepos_ListRepoNames_cloned(t *testing.T)](#TestRepos_ListRepoNames_cloned)
    * [func TestRepos_ListRepoNames_ids(t *testing.T)](#TestRepos_ListRepoNames_ids)
    * [func TestRepos_ListRepoNames_serviceTypes(t *testing.T)](#TestRepos_ListRepoNames_serviceTypes)
    * [func TestRepos_ListRepoNames_pagination(t *testing.T)](#TestRepos_ListRepoNames_pagination)
    * [func TestRepos_ListRepoNames_correctFiltering(t *testing.T)](#TestRepos_ListRepoNames_correctFiltering)
    * [func TestRepos_ListRepoNames_query2(t *testing.T)](#TestRepos_ListRepoNames_query2)
    * [func TestRepos_ListRepoNames_sort(t *testing.T)](#TestRepos_ListRepoNames_sort)
    * [func TestRepos_ListRepoNames_patterns(t *testing.T)](#TestRepos_ListRepoNames_patterns)
    * [func TestRepos_ListRepoNames_queryPattern(t *testing.T)](#TestRepos_ListRepoNames_queryPattern)
    * [func TestRepos_ListRepoNames_queryAndPatternsMutuallyExclusive(t *testing.T)](#TestRepos_ListRepoNames_queryAndPatternsMutuallyExclusive)
    * [func TestRepos_ListRepoNames_UserIDAndExternalServiceIDsMutuallyExclusive(t *testing.T)](#TestRepos_ListRepoNames_UserIDAndExternalServiceIDsMutuallyExclusive)
    * [func TestRepos_ListRepoNames_useOr(t *testing.T)](#TestRepos_ListRepoNames_useOr)
    * [func TestRepos_ListRepoNames_externalServiceID(t *testing.T)](#TestRepos_ListRepoNames_externalServiceID)
    * [func TestRepos_ListRepoNames_externalRepoPrefixes(t *testing.T)](#TestRepos_ListRepoNames_externalRepoPrefixes)
    * [func TestRepos_createRepo_dupe(t *testing.T)](#TestRepos_createRepo_dupe)
    * [func TestRepos_ListRepos_UserPublicRepos(t *testing.T)](#TestRepos_ListRepos_UserPublicRepos)
    * [func TestRepos_RepoExternalServices(t *testing.T)](#TestRepos_RepoExternalServices)
    * [func initUserAndRepo(t *testing.T, ctx context.Context, db dbutil.DB) (*types.User, *types.Repo)](#initUserAndRepo)
    * [func TestAuthzQueryConds(t *testing.T)](#TestAuthzQueryConds)
    * [func TestRepos_nonSiteAdminCanViewOwnPrivateCode(t *testing.T)](#TestRepos_nonSiteAdminCanViewOwnPrivateCode)
    * [func TestRepos_getReposBySQL_checkPermissions(t *testing.T)](#TestRepos_getReposBySQL_checkPermissions)
    * [func TestRepos_getReposBySQL_permissionsUserMapping(t *testing.T)](#TestRepos_getReposBySQL_permissionsUserMapping)
    * [func TestParseIncludePattern(t *testing.T)](#TestParseIncludePattern)
    * [func queriesToString(qs []*sqlf.Query) string](#queriesToString)
    * [func TestRepos_Count(t *testing.T)](#TestRepos_Count)
    * [func TestRepos_Delete(t *testing.T)](#TestRepos_Delete)
    * [func TestRepos_Upsert(t *testing.T)](#TestRepos_Upsert)
    * [func TestRepos_UpsertForkAndArchivedFields(t *testing.T)](#TestRepos_UpsertForkAndArchivedFields)
    * [func hasNoID(r *types.Repo) bool](#hasNoID)
    * [func TestRepos_Create(t *testing.T)](#TestRepos_Create)
    * [func TestListDefaultReposUncloned(t *testing.T)](#TestListDefaultReposUncloned)
    * [func TestSavedSearchesIsEmpty(t *testing.T)](#TestSavedSearchesIsEmpty)
    * [func TestSavedSearchesCreate(t *testing.T)](#TestSavedSearchesCreate)
    * [func TestSavedSearchesUpdate(t *testing.T)](#TestSavedSearchesUpdate)
    * [func TestSavedSearchesDelete(t *testing.T)](#TestSavedSearchesDelete)
    * [func TestSavedSearchesGetByUserID(t *testing.T)](#TestSavedSearchesGetByUserID)
    * [func TestSavedSearchesGetByID(t *testing.T)](#TestSavedSearchesGetByID)
    * [func TestListSavedSearchesByUserID(t *testing.T)](#TestListSavedSearchesByUserID)
    * [func createSearchContexts(ctx context.Context, store *SearchContextsStore, searchContexts []*types.SearchContext) ([]*types.SearchContext, error)](#createSearchContexts)
    * [func TestSearchContexts_Get(t *testing.T)](#TestSearchContexts_Get)
    * [func TestSearchContexts_Update(t *testing.T)](#TestSearchContexts_Update)
    * [func TestSearchContexts_List(t *testing.T)](#TestSearchContexts_List)
    * [func TestSearchContexts_PaginationAndCount(t *testing.T)](#TestSearchContexts_PaginationAndCount)
    * [func TestSearchContexts_CaseInsensitiveNames(t *testing.T)](#TestSearchContexts_CaseInsensitiveNames)
    * [func TestSearchContexts_CreateAndSetRepositoryRevisions(t *testing.T)](#TestSearchContexts_CreateAndSetRepositoryRevisions)
    * [func TestSearchContexts_Permissions(t *testing.T)](#TestSearchContexts_Permissions)
    * [func TestSearchContexts_Delete(t *testing.T)](#TestSearchContexts_Delete)
    * [func reverseSearchContextsSlice(s []*types.SearchContext) []*types.SearchContext](#reverseSearchContextsSlice)
    * [func getSearchContextNames(s []*types.SearchContext) []string](#getSearchContextNames)
    * [func TestSearchContexts_OrderBy(t *testing.T)](#TestSearchContexts_OrderBy)
    * [func TestSecurityEventLogs_ValidInfo(t *testing.T)](#TestSecurityEventLogs_ValidInfo)
    * [func TestSettings_ListAll(t *testing.T)](#TestSettings_ListAll)
    * [func TestCreateIfUpToDate(t *testing.T)](#TestCreateIfUpToDate)
    * [func TestGetLatestSchemaSettings(t *testing.T)](#TestGetLatestSchemaSettings)
    * [func TestSurveyResponses_Create_Count(t *testing.T)](#TestSurveyResponses_Create_Count)
    * [func TestUserCredential_Authenticator(t *testing.T)](#TestUserCredential_Authenticator)
    * [func TestUserCredential_SetAuthenticator(t *testing.T)](#TestUserCredential_SetAuthenticator)
    * [func TestUserCredentials_CreateUpdate(t *testing.T)](#TestUserCredentials_CreateUpdate)
    * [func TestUserCredentials_Delete(t *testing.T)](#TestUserCredentials_Delete)
    * [func TestUserCredentials_GetByID(t *testing.T)](#TestUserCredentials_GetByID)
    * [func TestUserCredentials_GetByScope(t *testing.T)](#TestUserCredentials_GetByScope)
    * [func TestUserCredentials_List(t *testing.T)](#TestUserCredentials_List)
    * [func TestUserCredentials_Invalid(t *testing.T)](#TestUserCredentials_Invalid)
    * [func TestUserCredentialNotFoundErr(t *testing.T)](#TestUserCredentialNotFoundErr)
    * [func createUserCredentialAuths(t *testing.T) map[string]auth.Authenticator](#createUserCredentialAuths)
    * [func setUpUserCredentialTest(t *testing.T, db *sql.DB) (context.Context, encryption.Key, *types.User)](#setUpUserCredentialTest)
    * [func TestUserEmail_NeedsVerificationCoolDown(t *testing.T)](#TestUserEmail_NeedsVerificationCoolDown)
    * [func TestUserEmails_Get(t *testing.T)](#TestUserEmails_Get)
    * [func TestUserEmails_GetPrimary(t *testing.T)](#TestUserEmails_GetPrimary)
    * [func TestUserEmails_SetPrimary(t *testing.T)](#TestUserEmails_SetPrimary)
    * [func TestUserEmails_ListByUser(t *testing.T)](#TestUserEmails_ListByUser)
    * [func normalizeUserEmails(userEmails []*UserEmail)](#normalizeUserEmails)
    * [func TestUserEmails_Add_Remove(t *testing.T)](#TestUserEmails_Add_Remove)
    * [func TestUserEmails_SetVerified(t *testing.T)](#TestUserEmails_SetVerified)
    * [func isUserEmailVerified(ctx context.Context, db dbutil.DB, userID int32, email string) (bool, error)](#isUserEmailVerified)
    * [func isUserEmailPrimary(ctx context.Context, db dbutil.DB, userID int32, email string) (bool, error)](#isUserEmailPrimary)
    * [func TestUserEmails_SetLastVerificationSentAt(t *testing.T)](#TestUserEmails_SetLastVerificationSentAt)
    * [func TestUserEmails_GetLatestVerificationSentEmail(t *testing.T)](#TestUserEmails_GetLatestVerificationSentEmail)
    * [func TestUserEmails_GetVerifiedEmails(t *testing.T)](#TestUserEmails_GetVerifiedEmails)
    * [func TestUserPublicRepos_Set(t *testing.T)](#TestUserPublicRepos_Set)
    * [func TestUserPublicRepos_SetUserRepos(t *testing.T)](#TestUserPublicRepos_SetUserRepos)
    * [func TestUsers_BuiltinAuth(t *testing.T)](#TestUsers_BuiltinAuth)
    * [func TestUsers_BuiltinAuth_VerifiedEmail(t *testing.T)](#TestUsers_BuiltinAuth_VerifiedEmail)
    * [func TestUsers_BuiltinAuthPasswordResetRateLimit(t *testing.T)](#TestUsers_BuiltinAuthPasswordResetRateLimit)
    * [func TestUsers_UpdatePassword(t *testing.T)](#TestUsers_UpdatePassword)
    * [func TestUsers_CreatePassword(t *testing.T)](#TestUsers_CreatePassword)
    * [func TestUsers_PasswordResetExpiry(t *testing.T)](#TestUsers_PasswordResetExpiry)
    * [func TestUsers_ValidUsernames(t *testing.T)](#TestUsers_ValidUsernames)
    * [func TestUsers_Create_checkPasswordLength(t *testing.T)](#TestUsers_Create_checkPasswordLength)
    * [func TestUsers_Create_SiteAdmin(t *testing.T)](#TestUsers_Create_SiteAdmin)
    * [func TestUsers_CheckAndDecrementInviteQuota(t *testing.T)](#TestUsers_CheckAndDecrementInviteQuota)
    * [func TestUsers_ListCount(t *testing.T)](#TestUsers_ListCount)
    * [func TestUsers_Update(t *testing.T)](#TestUsers_Update)
    * [func TestUsers_GetByVerifiedEmail(t *testing.T)](#TestUsers_GetByVerifiedEmail)
    * [func TestUsers_GetByUsernames(t *testing.T)](#TestUsers_GetByUsernames)
    * [func TestUsers_Delete(t *testing.T)](#TestUsers_Delete)
    * [func TestUsers_HasTag(t *testing.T)](#TestUsers_HasTag)
    * [func TestUsers_InvalidateSessions(t *testing.T)](#TestUsers_InvalidateSessions)
    * [func TestUsers_SetTag(t *testing.T)](#TestUsers_SetTag)
    * [func normalizeUsers(users []*types.User) []*types.User](#normalizeUsers)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="AuthenticatorTypeOAuthClient" href="#AuthenticatorTypeOAuthClient">const AuthenticatorTypeOAuthClient</a>

```
searchKey: database.AuthenticatorTypeOAuthClient
```

```Go
const AuthenticatorTypeOAuthClient AuthenticatorType = "OAuthClient"
```

Define credential type strings that we'll use when encoding credentials. 

### <a id="AuthenticatorTypeBasicAuth" href="#AuthenticatorTypeBasicAuth">const AuthenticatorTypeBasicAuth</a>

```
searchKey: database.AuthenticatorTypeBasicAuth
```

```Go
const AuthenticatorTypeBasicAuth AuthenticatorType = "BasicAuth"
```

Define credential type strings that we'll use when encoding credentials. 

### <a id="AuthenticatorTypeBasicAuthWithSSH" href="#AuthenticatorTypeBasicAuthWithSSH">const AuthenticatorTypeBasicAuthWithSSH</a>

```
searchKey: database.AuthenticatorTypeBasicAuthWithSSH
```

```Go
const AuthenticatorTypeBasicAuthWithSSH AuthenticatorType = "BasicAuthWithSSH"
```

Define credential type strings that we'll use when encoding credentials. 

### <a id="AuthenticatorTypeOAuthBearerToken" href="#AuthenticatorTypeOAuthBearerToken">const AuthenticatorTypeOAuthBearerToken</a>

```
searchKey: database.AuthenticatorTypeOAuthBearerToken
```

```Go
const AuthenticatorTypeOAuthBearerToken AuthenticatorType = "OAuthBearerToken"
```

Define credential type strings that we'll use when encoding credentials. 

### <a id="AuthenticatorTypeOAuthBearerTokenWithSSH" href="#AuthenticatorTypeOAuthBearerTokenWithSSH">const AuthenticatorTypeOAuthBearerTokenWithSSH</a>

```
searchKey: database.AuthenticatorTypeOAuthBearerTokenWithSSH
```

```Go
const AuthenticatorTypeOAuthBearerTokenWithSSH AuthenticatorType = "OAuthBearerTokenWithSSH"
```

Define credential type strings that we'll use when encoding credentials. 

### <a id="AuthenticatorTypeBitbucketServerSudoableOAuthClient" href="#AuthenticatorTypeBitbucketServerSudoableOAuthClient">const AuthenticatorTypeBitbucketServerSudoableOAuthClient</a>

```
searchKey: database.AuthenticatorTypeBitbucketServerSudoableOAuthClient
```

```Go
const AuthenticatorTypeBitbucketServerSudoableOAuthClient AuthenticatorType = ...
```

Define credential type strings that we'll use when encoding credentials. 

### <a id="AuthenticatorTypeGitLabSudoableToken" href="#AuthenticatorTypeGitLabSudoableToken">const AuthenticatorTypeGitLabSudoableToken</a>

```
searchKey: database.AuthenticatorTypeGitLabSudoableToken
```

```Go
const AuthenticatorTypeGitLabSudoableToken AuthenticatorType = "GitLabSudoableToken"
```

Define credential type strings that we'll use when encoding credentials. 

### <a id="integrationSource" href="#integrationSource">const integrationSource</a>

```
searchKey: database.integrationSource
tags: [private]
```

```Go
const integrationSource = "CODEHOSTINTEGRATION"
```

### <a id="Daily" href="#Daily">const Daily</a>

```
searchKey: database.Daily
```

```Go
const Daily PeriodType = "daily"
```

Daily is used to get a count of events or unique users within a day. 

### <a id="Weekly" href="#Weekly">const Weekly</a>

```
searchKey: database.Weekly
```

```Go
const Weekly PeriodType = "weekly"
```

Weekly is used to get a count of events or unique users within a week. 

### <a id="Monthly" href="#Monthly">const Monthly</a>

```
searchKey: database.Monthly
```

```Go
const Monthly PeriodType = "monthly"
```

Monthly is used to get a count of events or unique users within a month. 

### <a id="usersUsageCountsQuery" href="#usersUsageCountsQuery">const usersUsageCountsQuery</a>

```
searchKey: database.usersUsageCountsQuery
tags: [private]
```

```Go
const usersUsageCountsQuery = ...
```

### <a id="userIDQueryFragment" href="#userIDQueryFragment">const userIDQueryFragment</a>

```
searchKey: database.userIDQueryFragment
tags: [private]
```

```Go
const userIDQueryFragment = ...
```

userIDQueryFragment is a query fragment that can be used to return the anonymous user ID when the user ID is not set (i.e. 0). 

### <a id="aggregatedUserIDQueryFragment" href="#aggregatedUserIDQueryFragment">const aggregatedUserIDQueryFragment</a>

```
searchKey: database.aggregatedUserIDQueryFragment
tags: [private]
```

```Go
const aggregatedUserIDQueryFragment = ...
```

aggregatedUserIDQueryFragment is a query fragment that can be used to canonicalize the values of the user_id and anonymous_user_id fields (assumed in scope) int a unified value. 

### <a id="upsertExternalServicesQueryValueFmtstr" href="#upsertExternalServicesQueryValueFmtstr">const upsertExternalServicesQueryValueFmtstr</a>

```
searchKey: database.upsertExternalServicesQueryValueFmtstr
tags: [private]
```

```Go
const upsertExternalServicesQueryValueFmtstr = ...
```

### <a id="upsertExternalServicesQueryFmtstr" href="#upsertExternalServicesQueryFmtstr">const upsertExternalServicesQueryFmtstr</a>

```
searchKey: database.upsertExternalServicesQueryFmtstr
tags: [private]
```

```Go
const upsertExternalServicesQueryFmtstr = ...
```

### <a id="listReposQueryFmtstr" href="#listReposQueryFmtstr">const listReposQueryFmtstr</a>

```
searchKey: database.listReposQueryFmtstr
tags: [private]
```

```Go
const listReposQueryFmtstr = ...
```

### <a id="getSourcesByRepoQueryStr" href="#getSourcesByRepoQueryStr">const getSourcesByRepoQueryStr</a>

```
searchKey: database.getSourcesByRepoQueryStr
tags: [private]
```

```Go
const getSourcesByRepoQueryStr = ...
```

### <a id="RepoListCreatedAt" href="#RepoListCreatedAt">const RepoListCreatedAt</a>

```
searchKey: database.RepoListCreatedAt
```

```Go
const RepoListCreatedAt RepoListColumn = "created_at"
```

### <a id="RepoListName" href="#RepoListName">const RepoListName</a>

```
searchKey: database.RepoListName
```

```Go
const RepoListName RepoListColumn = "name"
```

### <a id="RepoListID" href="#RepoListID">const RepoListID</a>

```
searchKey: database.RepoListID
```

```Go
const RepoListID RepoListColumn = "id"
```

### <a id="RepoListStars" href="#RepoListStars">const RepoListStars</a>

```
searchKey: database.RepoListStars
```

```Go
const RepoListStars RepoListColumn = "stars"
```

### <a id="userReposQuery" href="#userReposQuery">const userReposQuery</a>

```
searchKey: database.userReposQuery
tags: [private]
```

```Go
const userReposQuery = `
SELECT repo_id as id FROM external_service_repos WHERE user_id = %d
`
```

### <a id="userPublicReposQuery" href="#userPublicReposQuery">const userPublicReposQuery</a>

```
searchKey: database.userPublicReposQuery
tags: [private]
```

```Go
const userPublicReposQuery = `
SELECT repo_id as id FROM user_public_repos WHERE user_id = %d
`
```

### <a id="listDefaultReposQuery" href="#listDefaultReposQuery">const listDefaultReposQuery</a>

```
searchKey: database.listDefaultReposQuery
tags: [private]
```

```Go
const listDefaultReposQuery = ...
```

### <a id="deleteReposQuery" href="#deleteReposQuery">const deleteReposQuery</a>

```
searchKey: database.deleteReposQuery
tags: [private]
```

```Go
const deleteReposQuery = ...
```

### <a id="searchContextsPermissionsConditionFmtStr" href="#searchContextsPermissionsConditionFmtStr">const searchContextsPermissionsConditionFmtStr</a>

```
searchKey: database.searchContextsPermissionsConditionFmtStr
tags: [private]
```

```Go
const searchContextsPermissionsConditionFmtStr = ...
```

### <a id="listSearchContextsFmtStr" href="#listSearchContextsFmtStr">const listSearchContextsFmtStr</a>

```
searchKey: database.listSearchContextsFmtStr
tags: [private]
```

```Go
const listSearchContextsFmtStr = ...
```

### <a id="countSearchContextsFmtStr" href="#countSearchContextsFmtStr">const countSearchContextsFmtStr</a>

```
searchKey: database.countSearchContextsFmtStr
tags: [private]
```

```Go
const countSearchContextsFmtStr = ...
```

### <a id="SearchContextsOrderByID" href="#SearchContextsOrderByID">const SearchContextsOrderByID</a>

```
searchKey: database.SearchContextsOrderByID
```

```Go
const SearchContextsOrderByID SearchContextsOrderByOption = iota
```

### <a id="SearchContextsOrderBySpec" href="#SearchContextsOrderBySpec">const SearchContextsOrderBySpec</a>

```
searchKey: database.SearchContextsOrderBySpec
```

```Go
const SearchContextsOrderBySpec
```

### <a id="SearchContextsOrderByUpdatedAt" href="#SearchContextsOrderByUpdatedAt">const SearchContextsOrderByUpdatedAt</a>

```
searchKey: database.SearchContextsOrderByUpdatedAt
```

```Go
const SearchContextsOrderByUpdatedAt
```

### <a id="deleteSearchContextFmtStr" href="#deleteSearchContextFmtStr">const deleteSearchContextFmtStr</a>

```
searchKey: database.deleteSearchContextFmtStr
tags: [private]
```

```Go
const deleteSearchContextFmtStr = ...
```

### <a id="insertSearchContextFmtStr" href="#insertSearchContextFmtStr">const insertSearchContextFmtStr</a>

```
searchKey: database.insertSearchContextFmtStr
tags: [private]
```

```Go
const insertSearchContextFmtStr = ...
```

### <a id="updateSearchContextFmtStr" href="#updateSearchContextFmtStr">const updateSearchContextFmtStr</a>

```
searchKey: database.updateSearchContextFmtStr
tags: [private]
```

```Go
const updateSearchContextFmtStr = ...
```

### <a id="UserCredentialDomainBatches" href="#UserCredentialDomainBatches">const UserCredentialDomainBatches</a>

```
searchKey: database.UserCredentialDomainBatches
```

```Go
const UserCredentialDomainBatches = "batches"
```

Valid domain values for user credentials. 

### <a id="UserCredentialPlaceholderEncryptionKeyID" href="#UserCredentialPlaceholderEncryptionKeyID">const UserCredentialPlaceholderEncryptionKeyID</a>

```
searchKey: database.UserCredentialPlaceholderEncryptionKeyID
```

```Go
const UserCredentialPlaceholderEncryptionKeyID = "previously-migrated"
```

### <a id="userCredentialsGetByScopeQueryFmtstr" href="#userCredentialsGetByScopeQueryFmtstr">const userCredentialsGetByScopeQueryFmtstr</a>

```
searchKey: database.userCredentialsGetByScopeQueryFmtstr
tags: [private]
```

```Go
const userCredentialsGetByScopeQueryFmtstr = ...
```

### <a id="userCredentialsListQueryFmtstr" href="#userCredentialsListQueryFmtstr">const userCredentialsListQueryFmtstr</a>

```
searchKey: database.userCredentialsListQueryFmtstr
tags: [private]
```

```Go
const userCredentialsListQueryFmtstr = ...
```

### <a id="userCredentialsCreateQueryFmtstr" href="#userCredentialsCreateQueryFmtstr">const userCredentialsCreateQueryFmtstr</a>

```
searchKey: database.userCredentialsCreateQueryFmtstr
tags: [private]
```

```Go
const userCredentialsCreateQueryFmtstr = ...
```

### <a id="userCredentialsUpdateQueryFmtstr" href="#userCredentialsUpdateQueryFmtstr">const userCredentialsUpdateQueryFmtstr</a>

```
searchKey: database.userCredentialsUpdateQueryFmtstr
tags: [private]
```

```Go
const userCredentialsUpdateQueryFmtstr = ...
```

### <a id="errorCodeUsernameExists" href="#errorCodeUsernameExists">const errorCodeUsernameExists</a>

```
searchKey: database.errorCodeUsernameExists
tags: [private]
```

```Go
const errorCodeUsernameExists = "err_username_exists"
```

### <a id="errorCodeEmailExists" href="#errorCodeEmailExists">const errorCodeEmailExists</a>

```
searchKey: database.errorCodeEmailExists
tags: [private]
```

```Go
const errorCodeEmailExists = "err_email_exists"
```

### <a id="maxPasswordRunes" href="#maxPasswordRunes">const maxPasswordRunes</a>

```
searchKey: database.maxPasswordRunes
tags: [private]
```

```Go
const maxPasswordRunes = 256
```

maxPasswordRunes is the maximum number of UTF-8 runes that a password can contain. This safety limit is to protect us from a DDOS attack caused by hashing very large passwords on Sourcegraph.com. 

### <a id="listDatesQuery" href="#listDatesQuery">const listDatesQuery</a>

```
searchKey: database.listDatesQuery
tags: [private]
```

```Go
const listDatesQuery = ...
```

### <a id="TagAllowUserExternalServicePrivate" href="#TagAllowUserExternalServicePrivate">const TagAllowUserExternalServicePrivate</a>

```
searchKey: database.TagAllowUserExternalServicePrivate
```

```Go
const TagAllowUserExternalServicePrivate = "AllowUserExternalServicePrivate"
```

TagAllowUserExternalServicePrivate if set on a user, allows them to add private code through external services they own. 

### <a id="TagAllowUserExternalServicePublic" href="#TagAllowUserExternalServicePublic">const TagAllowUserExternalServicePublic</a>

```
searchKey: database.TagAllowUserExternalServicePublic
```

```Go
const TagAllowUserExternalServicePublic = "AllowUserExternalServicePublic"
```

TagAllowUserExternalServicePublic if set on a user, allows them to add public code through external services they own. 

### <a id="upsertSQL" href="#upsertSQL">const upsertSQL</a>

```
searchKey: database.upsertSQL
tags: [private]
```

```Go
const upsertSQL = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrAccessTokenNotFound" href="#ErrAccessTokenNotFound">var ErrAccessTokenNotFound</a>

```
searchKey: database.ErrAccessTokenNotFound
```

```Go
var ErrAccessTokenNotFound = errors.New("access token not found")
```

ErrAccessTokenNotFound occurs when a database operation expects a specific access token to exist but it does not exist. 

### <a id="intervalByPeriodType" href="#intervalByPeriodType">var intervalByPeriodType</a>

```
searchKey: database.intervalByPeriodType
tags: [private]
```

```Go
var intervalByPeriodType = ...
```

intervalByPeriodType is a map of generate_series step values by period type. 

### <a id="periodByPeriodType" href="#periodByPeriodType">var periodByPeriodType</a>

```
searchKey: database.periodByPeriodType
tags: [private]
```

```Go
var periodByPeriodType = ...
```

periodByPeriodType is a map of SQL fragments that produce a timestamp bucket by period type. This assumes the existence of a  field named `timestamp` in the enclosing query. 

### <a id="siteUsageQuery" href="#siteUsageQuery">var siteUsageQuery</a>

```
searchKey: database.siteUsageQuery
tags: [private]
```

```Go
var siteUsageQuery = ...
```

### <a id="codeIntelWeeklyUsersQuery" href="#codeIntelWeeklyUsersQuery">var codeIntelWeeklyUsersQuery</a>

```
searchKey: database.codeIntelWeeklyUsersQuery
tags: [private]
```

```Go
var codeIntelWeeklyUsersQuery = ...
```

### <a id="codeIntelligenceRepositoryCountsQuery" href="#codeIntelligenceRepositoryCountsQuery">var codeIntelligenceRepositoryCountsQuery</a>

```
searchKey: database.codeIntelligenceRepositoryCountsQuery
tags: [private]
```

```Go
var codeIntelligenceRepositoryCountsQuery = ...
```

### <a id="aggregatedCodeIntelEventsQuery" href="#aggregatedCodeIntelEventsQuery">var aggregatedCodeIntelEventsQuery</a>

```
searchKey: database.aggregatedCodeIntelEventsQuery
tags: [private]
```

```Go
var aggregatedCodeIntelEventsQuery = ...
```

### <a id="searchLatencyEventNames" href="#searchLatencyEventNames">var searchLatencyEventNames</a>

```
searchKey: database.searchLatencyEventNames
tags: [private]
```

```Go
var searchLatencyEventNames = ...
```

### <a id="aggregatedSearchLatencyEventsQuery" href="#aggregatedSearchLatencyEventsQuery">var aggregatedSearchLatencyEventsQuery</a>

```
searchKey: database.aggregatedSearchLatencyEventsQuery
tags: [private]
```

```Go
var aggregatedSearchLatencyEventsQuery = ...
```

### <a id="aggregatedSearchUsageEventsQuery" href="#aggregatedSearchUsageEventsQuery">var aggregatedSearchUsageEventsQuery</a>

```
searchKey: database.aggregatedSearchUsageEventsQuery
tags: [private]
```

```Go
var aggregatedSearchUsageEventsQuery = ...
```

### <a id="BeforeCreateExternalService" href="#BeforeCreateExternalService">var BeforeCreateExternalService</a>

```
searchKey: database.BeforeCreateExternalService
```

```Go
var BeforeCreateExternalService func(context.Context, dbutil.DB) error
```

BeforeCreateExternalService (if set) is invoked as a hook prior to creating a new external service in the database. 

### <a id="ExternalServiceKinds" href="#ExternalServiceKinds">var ExternalServiceKinds</a>

```
searchKey: database.ExternalServiceKinds
```

```Go
var ExternalServiceKinds = ...
```

ExternalServiceKinds contains a map of all supported kinds of external services. 

### <a id="ErrInvalidColumnState" href="#ErrInvalidColumnState">var ErrInvalidColumnState</a>

```
searchKey: database.ErrInvalidColumnState
```

```Go
var ErrInvalidColumnState = ...
```

### <a id="MockCannotCreateUserUsernameExistsErr" href="#MockCannotCreateUserUsernameExistsErr">var MockCannotCreateUserUsernameExistsErr</a>

```
searchKey: database.MockCannotCreateUserUsernameExistsErr
```

```Go
var MockCannotCreateUserUsernameExistsErr = errCannotCreateUser{errorCodeUsernameExists}
```

### <a id="MockCannotCreateUserEmailExistsErr" href="#MockCannotCreateUserEmailExistsErr">var MockCannotCreateUserEmailExistsErr</a>

```
searchKey: database.MockCannotCreateUserEmailExistsErr
```

```Go
var MockCannotCreateUserEmailExistsErr = errCannotCreateUser{errorCodeEmailExists}
```

### <a id="MockUserNotFoundErr" href="#MockUserNotFoundErr">var MockUserNotFoundErr</a>

```
searchKey: database.MockUserNotFoundErr
```

```Go
var MockUserNotFoundErr = userNotFoundErr{}
```

### <a id="MockUserEmailNotFoundErr" href="#MockUserEmailNotFoundErr">var MockUserEmailNotFoundErr</a>

```
searchKey: database.MockUserEmailNotFoundErr
```

```Go
var MockUserEmailNotFoundErr = userEmailNotFoundError{}
```

### <a id="Mocks" href="#Mocks">var Mocks</a>

```
searchKey: database.Mocks
```

```Go
var Mocks MockStores
```

### <a id="ErrNamespaceMultipleIDs" href="#ErrNamespaceMultipleIDs">var ErrNamespaceMultipleIDs</a>

```
searchKey: database.ErrNamespaceMultipleIDs
```

```Go
var ErrNamespaceMultipleIDs = errors.New("multiple namespace IDs provided")
```

### <a id="ErrNamespaceNoID" href="#ErrNamespaceNoID">var ErrNamespaceNoID</a>

```
searchKey: database.ErrNamespaceNoID
```

```Go
var ErrNamespaceNoID = errors.New("no namespace ID provided")
```

### <a id="ErrNamespaceNotFound" href="#ErrNamespaceNotFound">var ErrNamespaceNotFound</a>

```
searchKey: database.ErrNamespaceNotFound
```

```Go
var ErrNamespaceNotFound = errors.New("namespace not found")
```

### <a id="namespaceQueryFmtstr" href="#namespaceQueryFmtstr">var namespaceQueryFmtstr</a>

```
searchKey: database.namespaceQueryFmtstr
tags: [private]
```

```Go
var namespaceQueryFmtstr = ...
```

### <a id="errOrgNameAlreadyExists" href="#errOrgNameAlreadyExists">var errOrgNameAlreadyExists</a>

```
searchKey: database.errOrgNameAlreadyExists
tags: [private]
```

```Go
var errOrgNameAlreadyExists = ...
```

### <a id="repoColumns" href="#repoColumns">var repoColumns</a>

```
searchKey: database.repoColumns
tags: [private]
```

```Go
var repoColumns = ...
```

### <a id="insertReposQuery" href="#insertReposQuery">var insertReposQuery</a>

```
searchKey: database.insertReposQuery
tags: [private]
```

```Go
var insertReposQuery = ...
```

### <a id="errPermissionsUserMappingConflict" href="#errPermissionsUserMappingConflict">var errPermissionsUserMappingConflict</a>

```
searchKey: database.errPermissionsUserMappingConflict
tags: [private]
```

```Go
var errPermissionsUserMappingConflict = ...
```

### <a id="ErrSearchContextNotFound" href="#ErrSearchContextNotFound">var ErrSearchContextNotFound</a>

```
searchKey: database.ErrSearchContextNotFound
```

```Go
var ErrSearchContextNotFound = errors.New("search context not found")
```

### <a id="getSearchContextRepositoryRevisionsFmtStr" href="#getSearchContextRepositoryRevisionsFmtStr">var getSearchContextRepositoryRevisionsFmtStr</a>

```
searchKey: database.getSearchContextRepositoryRevisionsFmtStr
tags: [private]
```

```Go
var getSearchContextRepositoryRevisionsFmtStr = ...
```

### <a id="getAllRevisionsForRepoFmtStr" href="#getAllRevisionsForRepoFmtStr">var getAllRevisionsForRepoFmtStr</a>

```
searchKey: database.getAllRevisionsForRepoFmtStr
tags: [private]
```

```Go
var getAllRevisionsForRepoFmtStr = ...
```

### <a id="GlobalExternalServices" href="#GlobalExternalServices">var GlobalExternalServices</a>

```
searchKey: database.GlobalExternalServices
```

```Go
var GlobalExternalServices = &ExternalServiceStore{}
```

Global reference to database stores using the global dbconn.Global connection handle. Deprecated: Use store constructors instead. 

### <a id="GlobalRepos" href="#GlobalRepos">var GlobalRepos</a>

```
searchKey: database.GlobalRepos
```

```Go
var GlobalRepos = &RepoStore{}
```

Global reference to database stores using the global dbconn.Global connection handle. Deprecated: Use store constructors instead. 

### <a id="GlobalUsers" href="#GlobalUsers">var GlobalUsers</a>

```
searchKey: database.GlobalUsers
```

```Go
var GlobalUsers = &UserStore{}
```

Global reference to database stores using the global dbconn.Global connection handle. Deprecated: Use store constructors instead. 

### <a id="GlobalUserEmails" href="#GlobalUserEmails">var GlobalUserEmails</a>

```
searchKey: database.GlobalUserEmails
```

```Go
var GlobalUserEmails = &UserEmailsStore{}
```

Global reference to database stores using the global dbconn.Global connection handle. Deprecated: Use store constructors instead. 

### <a id="GlobalExternalAccounts" href="#GlobalExternalAccounts">var GlobalExternalAccounts</a>

```
searchKey: database.GlobalExternalAccounts
```

```Go
var GlobalExternalAccounts = &UserExternalAccountsStore{}
```

Global reference to database stores using the global dbconn.Global connection handle. Deprecated: Use store constructors instead. 

### <a id="GlobalAuthz" href="#GlobalAuthz">var GlobalAuthz</a>

```
searchKey: database.GlobalAuthz
```

```Go
var GlobalAuthz AuthzStore = &authzStore{}
```

Global reference to database stores using the global dbconn.Global connection handle. Deprecated: Use store constructors instead. 

### <a id="userCredentialsColumns" href="#userCredentialsColumns">var userCredentialsColumns</a>

```
searchKey: database.userCredentialsColumns
tags: [private]
```

```Go
var userCredentialsColumns = ...
```

userCredentialsColumns are the columns that must be selected by user_credentials queries in order to use scanUserCredential(). 

### <a id="BeforeCreateUser" href="#BeforeCreateUser">var BeforeCreateUser</a>

```
searchKey: database.BeforeCreateUser
```

```Go
var BeforeCreateUser func(ctx context.Context, db dbutil.DB) error
```

User hooks 

BeforeCreateUser (if set) is a hook called before creating a new user in the DB by any means (e.g., both directly via Users.Create or via ExternalAccounts.CreateUserAndSave). 

### <a id="AfterCreateUser" href="#AfterCreateUser">var AfterCreateUser</a>

```
searchKey: database.AfterCreateUser
```

```Go
var AfterCreateUser func(ctx context.Context, db dbutil.DB, user *types.User) error
```

User hooks 

AfterCreateUser (if set) is a hook called after creating a new user in the DB by any means (e.g., both directly via Users.Create or via ExternalAccounts.CreateUserAndSave). Whatever this hook mutates in database should be reflected on the `user` argument as well. 

### <a id="BeforeSetUserIsSiteAdmin" href="#BeforeSetUserIsSiteAdmin">var BeforeSetUserIsSiteAdmin</a>

```
searchKey: database.BeforeSetUserIsSiteAdmin
```

```Go
var BeforeSetUserIsSiteAdmin func(isSiteAdmin bool) error
```

User hooks 

BeforeSetUserIsSiteAdmin (if set) is a hook called before promoting/revoking a user to be a site admin. 

### <a id="ErrNoCurrentUser" href="#ErrNoCurrentUser">var ErrNoCurrentUser</a>

```
searchKey: database.ErrNoCurrentUser
```

```Go
var ErrNoCurrentUser = errors.New("no current user")
```

### <a id="passwordResetRateLimit" href="#passwordResetRateLimit">var passwordResetRateLimit</a>

```
searchKey: database.passwordResetRateLimit
tags: [private]
```

```Go
var passwordResetRateLimit = "1 minute"
```

### <a id="ErrPasswordResetRateLimit" href="#ErrPasswordResetRateLimit">var ErrPasswordResetRateLimit</a>

```
searchKey: database.ErrPasswordResetRateLimit
```

```Go
var ErrPasswordResetRateLimit = errors.New("password reset rate limit reached")
```

### <a id="usernamesForTests" href="#usernamesForTests">var usernamesForTests</a>

```
searchKey: database.usernamesForTests
tags: [private]
```

```Go
var usernamesForTests = ...
```

usernamesForTests is a list of test cases containing valid and invalid usernames and org names. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="AccessToken" href="#AccessToken">type AccessToken struct</a>

```
searchKey: database.AccessToken
```

```Go
type AccessToken struct {
	ID            int64
	SubjectUserID int32 // the user whose privileges the access token grants
	Scopes        []string
	Note          string
	CreatorUserID int32
	CreatedAt     time.Time
	LastUsedAt    *time.Time
}
```

AccessToken describes an access token. The actual token (that a caller must supply to authenticate) is not stored and is not present in this struct. 

### <a id="AccessTokenStore" href="#AccessTokenStore">type AccessTokenStore struct</a>

```
searchKey: database.AccessTokenStore
```

```Go
type AccessTokenStore struct {
	*basestore.Store
}
```

AccessTokenStore implements autocert.Cache 

#### <a id="AccessTokens" href="#AccessTokens">func AccessTokens(db dbutil.DB) *AccessTokenStore</a>

```
searchKey: database.AccessTokens
```

```Go
func AccessTokens(db dbutil.DB) *AccessTokenStore
```

AccessTokens instantiates and returns a new AccessTokenStore with prepared statements. 

#### <a id="AccessTokensWith" href="#AccessTokensWith">func AccessTokensWith(other basestore.ShareableStore) *AccessTokenStore</a>

```
searchKey: database.AccessTokensWith
```

```Go
func AccessTokensWith(other basestore.ShareableStore) *AccessTokenStore
```

AccessTokensWith instantiates and returns a new AccessTokenStore using the other store handle. 

#### <a id="AccessTokenStore.With" href="#AccessTokenStore.With">func (s *AccessTokenStore) With(other basestore.ShareableStore) *AccessTokenStore</a>

```
searchKey: database.AccessTokenStore.With
```

```Go
func (s *AccessTokenStore) With(other basestore.ShareableStore) *AccessTokenStore
```

#### <a id="AccessTokenStore.Transact" href="#AccessTokenStore.Transact">func (s *AccessTokenStore) Transact(ctx context.Context) (*AccessTokenStore, error)</a>

```
searchKey: database.AccessTokenStore.Transact
```

```Go
func (s *AccessTokenStore) Transact(ctx context.Context) (*AccessTokenStore, error)
```

#### <a id="AccessTokenStore.Create" href="#AccessTokenStore.Create">func (s *AccessTokenStore) Create(ctx context.Context, subjectUserID int32, scopes []string, note string, creatorUserID int32) (id int64, token string, err error)</a>

```
searchKey: database.AccessTokenStore.Create
```

```Go
func (s *AccessTokenStore) Create(ctx context.Context, subjectUserID int32, scopes []string, note string, creatorUserID int32) (id int64, token string, err error)
```

Create creates an access token for the specified user. The secret token value itself is returned. The caller is responsible for presenting this value to the end user; Sourcegraph does not retain it (only a hash of it). 

The secret token value is a long random string; it is what API clients must provide to authenticate their requests. We store the SHA-256 hash of the secret token value in the database. This lets us verify a token's validity (in the (*accessTokens).Lookup method) quickly, while still ensuring that an attacker who obtains the access_tokens DB table would not be able to impersonate a token holder. We don't use bcrypt because the original secret is a randomly generated string (not a password), so it's implausible for an attacker to brute-force the input space; also bcrypt is slow and would add noticeable latency to each request that supplied a token. 

🚨 SECURITY: The caller must ensure that the actor is permitted to create tokens for the specified user (i.e., that the actor is either the user or a site admin). 

#### <a id="AccessTokenStore.Lookup" href="#AccessTokenStore.Lookup">func (s *AccessTokenStore) Lookup(ctx context.Context, tokenHexEncoded, requiredScope string) (subjectUserID int32, err error)</a>

```
searchKey: database.AccessTokenStore.Lookup
```

```Go
func (s *AccessTokenStore) Lookup(ctx context.Context, tokenHexEncoded, requiredScope string) (subjectUserID int32, err error)
```

Lookup looks up the access token. If it's valid and contains the required scope, it returns the subject's user ID. Otherwise ErrAccessTokenNotFound is returned. 

Calling Lookup also updates the access token's last-used-at date. 

🚨 SECURITY: This returns a user ID if and only if the tokenHexEncoded corresponds to a valid, non-deleted access token. 

#### <a id="AccessTokenStore.GetByID" href="#AccessTokenStore.GetByID">func (s *AccessTokenStore) GetByID(ctx context.Context, id int64) (*AccessToken, error)</a>

```
searchKey: database.AccessTokenStore.GetByID
```

```Go
func (s *AccessTokenStore) GetByID(ctx context.Context, id int64) (*AccessToken, error)
```

GetByID retrieves the access token (if any) given its ID. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this access token. 

#### <a id="AccessTokenStore.GetByToken" href="#AccessTokenStore.GetByToken">func (s *AccessTokenStore) GetByToken(ctx context.Context, tokenHexEncoded string) (*AccessToken, error)</a>

```
searchKey: database.AccessTokenStore.GetByToken
```

```Go
func (s *AccessTokenStore) GetByToken(ctx context.Context, tokenHexEncoded string) (*AccessToken, error)
```

GetByToken retrieves the access token (if any) given its hex encoded string. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this access token. 

#### <a id="AccessTokenStore.get" href="#AccessTokenStore.get">func (s *AccessTokenStore) get(ctx context.Context, conds []*sqlf.Query) (*AccessToken, error)</a>

```
searchKey: database.AccessTokenStore.get
tags: [private]
```

```Go
func (s *AccessTokenStore) get(ctx context.Context, conds []*sqlf.Query) (*AccessToken, error)
```

#### <a id="AccessTokenStore.List" href="#AccessTokenStore.List">func (s *AccessTokenStore) List(ctx context.Context, opt AccessTokensListOptions) ([]*AccessToken, error)</a>

```
searchKey: database.AccessTokenStore.List
```

```Go
func (s *AccessTokenStore) List(ctx context.Context, opt AccessTokensListOptions) ([]*AccessToken, error)
```

List lists all access tokens that satisfy the options. 

🚨 SECURITY: The caller must ensure that the actor is permitted to list with the specified options. 

#### <a id="AccessTokenStore.list" href="#AccessTokenStore.list">func (s *AccessTokenStore) list(ctx context.Context, conds []*sqlf.Query, limitOffset *LimitOffset) ([]*AccessToken, error)</a>

```
searchKey: database.AccessTokenStore.list
tags: [private]
```

```Go
func (s *AccessTokenStore) list(ctx context.Context, conds []*sqlf.Query, limitOffset *LimitOffset) ([]*AccessToken, error)
```

#### <a id="AccessTokenStore.Count" href="#AccessTokenStore.Count">func (s *AccessTokenStore) Count(ctx context.Context, opt AccessTokensListOptions) (int, error)</a>

```
searchKey: database.AccessTokenStore.Count
```

```Go
func (s *AccessTokenStore) Count(ctx context.Context, opt AccessTokensListOptions) (int, error)
```

Count counts all access tokens that satisfy the options (ignoring limit and offset). 

🚨 SECURITY: The caller must ensure that the actor is permitted to count the tokens. 

#### <a id="AccessTokenStore.DeleteByID" href="#AccessTokenStore.DeleteByID">func (s *AccessTokenStore) DeleteByID(ctx context.Context, id int64, subjectUserID int32) error</a>

```
searchKey: database.AccessTokenStore.DeleteByID
```

```Go
func (s *AccessTokenStore) DeleteByID(ctx context.Context, id int64, subjectUserID int32) error
```

DeleteByID deletes an access token given its ID and associated subject user. 

🚨 SECURITY: The caller must ensure that the actor is permitted to delete the token. 

#### <a id="AccessTokenStore.DeleteByToken" href="#AccessTokenStore.DeleteByToken">func (s *AccessTokenStore) DeleteByToken(ctx context.Context, tokenHexEncoded string) error</a>

```
searchKey: database.AccessTokenStore.DeleteByToken
```

```Go
func (s *AccessTokenStore) DeleteByToken(ctx context.Context, tokenHexEncoded string) error
```

DeleteByToken deletes an access token given the secret token value itself (i.e., the same value that an API client would use to authenticate). 

#### <a id="AccessTokenStore.delete" href="#AccessTokenStore.delete">func (s *AccessTokenStore) delete(ctx context.Context, cond *sqlf.Query) error</a>

```
searchKey: database.AccessTokenStore.delete
tags: [private]
```

```Go
func (s *AccessTokenStore) delete(ctx context.Context, cond *sqlf.Query) error
```

### <a id="AccessTokensListOptions" href="#AccessTokensListOptions">type AccessTokensListOptions struct</a>

```
searchKey: database.AccessTokensListOptions
```

```Go
type AccessTokensListOptions struct {
	SubjectUserID  int32 // only list access tokens with this user as the subject
	LastUsedAfter  *time.Time
	LastUsedBefore *time.Time
	*LimitOffset
}
```

AccessTokensListOptions contains options for listing access tokens. 

#### <a id="AccessTokensListOptions.sqlConditions" href="#AccessTokensListOptions.sqlConditions">func (o AccessTokensListOptions) sqlConditions() []*sqlf.Query</a>

```
searchKey: database.AccessTokensListOptions.sqlConditions
tags: [private]
```

```Go
func (o AccessTokensListOptions) sqlConditions() []*sqlf.Query
```

### <a id="MockAccessTokens" href="#MockAccessTokens">type MockAccessTokens struct</a>

```
searchKey: database.MockAccessTokens
```

```Go
type MockAccessTokens struct {
	Create     func(subjectUserID int32, scopes []string, note string, creatorUserID int32) (id int64, token string, err error)
	DeleteByID func(id int64, subjectUserID int32) error
	Lookup     func(tokenHexEncoded, requiredScope string) (subjectUserID int32, err error)
	GetByID    func(id int64) (*AccessToken, error)
}
```

### <a id="AuthenticatorType" href="#AuthenticatorType">type AuthenticatorType string</a>

```
searchKey: database.AuthenticatorType
```

```Go
type AuthenticatorType string
```

AuthenticatorType defines all possible types of authenticators stored in the database. 

### <a id="NullAuthenticator" href="#NullAuthenticator">type NullAuthenticator struct</a>

```
searchKey: database.NullAuthenticator
```

```Go
type NullAuthenticator struct{ A *auth.Authenticator }
```

NullAuthenticator represents an authenticator that may be null. It implements the sql.Scanner interface so it can be used as a scan destination, similar to sql.NullString. When the scanned value is null, the authenticator will be nil. It handles marshalling and unmarshalling the authenticator from and to JSON. 

#### <a id="NullAuthenticator.Scan" href="#NullAuthenticator.Scan">func (n *NullAuthenticator) Scan(value interface{}) (err error)</a>

```
searchKey: database.NullAuthenticator.Scan
```

```Go
func (n *NullAuthenticator) Scan(value interface{}) (err error)
```

Scan implements the Scanner interface. 

#### <a id="NullAuthenticator.Value" href="#NullAuthenticator.Value">func (n NullAuthenticator) Value() (driver.Value, error)</a>

```
searchKey: database.NullAuthenticator.Value
```

```Go
func (n NullAuthenticator) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="GrantPendingPermissionsArgs" href="#GrantPendingPermissionsArgs">type GrantPendingPermissionsArgs struct</a>

```
searchKey: database.GrantPendingPermissionsArgs
```

```Go
type GrantPendingPermissionsArgs struct {
	// The user ID that will be used to bind pending permissions.
	UserID int32
	// The permission level to be granted.
	Perm authz.Perms
	// The type of permissions to be granted.
	Type authz.PermType
}
```

GrantPendingPermissionsArgs contains required arguments to grant pending permissions for a user by username or verified email address(es) according to the site configuration. 

### <a id="AuthorizedReposArgs" href="#AuthorizedReposArgs">type AuthorizedReposArgs struct</a>

```
searchKey: database.AuthorizedReposArgs
```

```Go
type AuthorizedReposArgs struct {
	// The candidate list of repositories to be verified.
	Repos []*types.Repo
	// The user whose authorization to access the repos is being checked.
	UserID int32
	// The permission level to be verified.
	Perm authz.Perms
	// The type of permissions to be verified.
	Type authz.PermType
}
```

AuthorizedReposArgs contains required arguments to verify if a user is authorized to access some or all of the repositories from the candidate list with the given level and type of permissions. 

### <a id="RevokeUserPermissionsArgs" href="#RevokeUserPermissionsArgs">type RevokeUserPermissionsArgs struct</a>

```
searchKey: database.RevokeUserPermissionsArgs
```

```Go
type RevokeUserPermissionsArgs struct {
	// The user ID that will be used to revoke effective permissions.
	UserID int32
	// The list of external accounts related to the user. This is list because a user could have
	// multiple external accounts, including ones from code hosts and/or Sourcegraph authz provider.
	Accounts []*extsvc.Accounts
}
```

RevokeUserPermissionsArgs contains required arguments to revoke user permissions, it includes all possible leads to grant or authorize access for a user. 

### <a id="AuthzStore" href="#AuthzStore">type AuthzStore interface</a>

```
searchKey: database.AuthzStore
```

```Go
type AuthzStore interface {
	// GrantPendingPermissions grants pending permissions for a user. It is a no-op in the OSS version.
	GrantPendingPermissions(ctx context.Context, args *GrantPendingPermissionsArgs) error
	// AuthorizedRepos checks if a user is authorized to access repositories in the candidate list.
	// The returned list must be a list of repositories that are authorized to the given user.
	// It is a no-op in the OSS version.
	AuthorizedRepos(ctx context.Context, args *AuthorizedReposArgs) ([]*types.Repo, error)
	// RevokeUserPermissions deletes both effective and pending permissions that could be related to a user.
	// It is a no-op in the OSS version.
	RevokeUserPermissions(ctx context.Context, args *RevokeUserPermissionsArgs) error
}
```

AuthzStore contains methods for manipulating user permissions. 

### <a id="authzStore" href="#authzStore">type authzStore struct{}</a>

```
searchKey: database.authzStore
tags: [private]
```

```Go
type authzStore struct{}
```

authzStore is a no-op placeholder for the OSS version. 

#### <a id="authzStore.GrantPendingPermissions" href="#authzStore.GrantPendingPermissions">func (*authzStore) GrantPendingPermissions(ctx context.Context, args *GrantPendingPermissionsArgs) error</a>

```
searchKey: database.authzStore.GrantPendingPermissions
tags: [private]
```

```Go
func (*authzStore) GrantPendingPermissions(ctx context.Context, args *GrantPendingPermissionsArgs) error
```

#### <a id="authzStore.AuthorizedRepos" href="#authzStore.AuthorizedRepos">func (*authzStore) AuthorizedRepos(ctx context.Context, args *AuthorizedReposArgs) ([]*types.Repo, error)</a>

```
searchKey: database.authzStore.AuthorizedRepos
tags: [private]
```

```Go
func (*authzStore) AuthorizedRepos(ctx context.Context, args *AuthorizedReposArgs) ([]*types.Repo, error)
```

#### <a id="authzStore.RevokeUserPermissions" href="#authzStore.RevokeUserPermissions">func (*authzStore) RevokeUserPermissions(ctx context.Context, args *RevokeUserPermissionsArgs) error</a>

```
searchKey: database.authzStore.RevokeUserPermissions
tags: [private]
```

```Go
func (*authzStore) RevokeUserPermissions(ctx context.Context, args *RevokeUserPermissionsArgs) error
```

### <a id="MockAuthz" href="#MockAuthz">type MockAuthz struct</a>

```
searchKey: database.MockAuthz
```

```Go
type MockAuthz struct {
	GrantPendingPermissions func(ctx context.Context, args *GrantPendingPermissionsArgs) error
	AuthorizedRepos         func(ctx context.Context, args *AuthorizedReposArgs) ([]*types.Repo, error)
	RevokeUserPermissions   func(ctx context.Context, args *RevokeUserPermissionsArgs) error
}
```

### <a id="EventLogStore" href="#EventLogStore">type EventLogStore struct</a>

```
searchKey: database.EventLogStore
```

```Go
type EventLogStore struct {
	*basestore.Store
}
```

#### <a id="EventLogs" href="#EventLogs">func EventLogs(db dbutil.DB) *EventLogStore</a>

```
searchKey: database.EventLogs
```

```Go
func EventLogs(db dbutil.DB) *EventLogStore
```

EventLogs instantiates and returns a new EventLogStore with prepared statements. 

#### <a id="EventLogsWith" href="#EventLogsWith">func EventLogsWith(other basestore.ShareableStore) *EventLogStore</a>

```
searchKey: database.EventLogsWith
```

```Go
func EventLogsWith(other basestore.ShareableStore) *EventLogStore
```

NewEventLogStoreWithDB instantiates and returns a new EventLogStore using the other store handle. 

#### <a id="EventLogStore.With" href="#EventLogStore.With">func (l *EventLogStore) With(other basestore.ShareableStore) *EventLogStore</a>

```
searchKey: database.EventLogStore.With
```

```Go
func (l *EventLogStore) With(other basestore.ShareableStore) *EventLogStore
```

#### <a id="EventLogStore.Transact" href="#EventLogStore.Transact">func (l *EventLogStore) Transact(ctx context.Context) (*EventLogStore, error)</a>

```
searchKey: database.EventLogStore.Transact
```

```Go
func (l *EventLogStore) Transact(ctx context.Context) (*EventLogStore, error)
```

#### <a id="EventLogStore.Insert" href="#EventLogStore.Insert">func (l *EventLogStore) Insert(ctx context.Context, e *Event) error</a>

```
searchKey: database.EventLogStore.Insert
```

```Go
func (l *EventLogStore) Insert(ctx context.Context, e *Event) error
```

#### <a id="EventLogStore.getBySQL" href="#EventLogStore.getBySQL">func (l *EventLogStore) getBySQL(ctx context.Context, querySuffix *sqlf.Query) ([]*types.Event, error)</a>

```
searchKey: database.EventLogStore.getBySQL
tags: [private]
```

```Go
func (l *EventLogStore) getBySQL(ctx context.Context, querySuffix *sqlf.Query) ([]*types.Event, error)
```

#### <a id="EventLogStore.ListAll" href="#EventLogStore.ListAll">func (l *EventLogStore) ListAll(ctx context.Context, opt EventLogsListOptions) ([]*types.Event, error)</a>

```
searchKey: database.EventLogStore.ListAll
```

```Go
func (l *EventLogStore) ListAll(ctx context.Context, opt EventLogsListOptions) ([]*types.Event, error)
```

ListAll gets all event logs in descending order of timestamp. 

#### <a id="EventLogStore.LatestPing" href="#EventLogStore.LatestPing">func (l *EventLogStore) LatestPing(ctx context.Context) (*types.Event, error)</a>

```
searchKey: database.EventLogStore.LatestPing
```

```Go
func (l *EventLogStore) LatestPing(ctx context.Context) (*types.Event, error)
```

LatestPing returns the most recently recorded ping event. 

#### <a id="EventLogStore.CountByUserID" href="#EventLogStore.CountByUserID">func (l *EventLogStore) CountByUserID(ctx context.Context, userID int32) (int, error)</a>

```
searchKey: database.EventLogStore.CountByUserID
```

```Go
func (l *EventLogStore) CountByUserID(ctx context.Context, userID int32) (int, error)
```

CountByUserID gets a count of events logged by a given user. 

#### <a id="EventLogStore.CountByUserIDAndEventName" href="#EventLogStore.CountByUserIDAndEventName">func (l *EventLogStore) CountByUserIDAndEventName(ctx context.Context, userID int32, name string) (int, error)</a>

```
searchKey: database.EventLogStore.CountByUserIDAndEventName
```

```Go
func (l *EventLogStore) CountByUserIDAndEventName(ctx context.Context, userID int32, name string) (int, error)
```

CountByUserIDAndEventName gets a count of events logged by a given user and with a given event name. 

#### <a id="EventLogStore.CountByUserIDAndEventNamePrefix" href="#EventLogStore.CountByUserIDAndEventNamePrefix">func (l *EventLogStore) CountByUserIDAndEventNamePrefix(ctx context.Context, userID int32, namePrefix string) (int, error)</a>

```
searchKey: database.EventLogStore.CountByUserIDAndEventNamePrefix
```

```Go
func (l *EventLogStore) CountByUserIDAndEventNamePrefix(ctx context.Context, userID int32, namePrefix string) (int, error)
```

CountByUserIDAndEventNamePrefix gets a count of events logged by a given user and with a given event name prefix. 

#### <a id="EventLogStore.CountByUserIDAndEventNames" href="#EventLogStore.CountByUserIDAndEventNames">func (l *EventLogStore) CountByUserIDAndEventNames(ctx context.Context, userID int32, names []string) (int, error)</a>

```
searchKey: database.EventLogStore.CountByUserIDAndEventNames
```

```Go
func (l *EventLogStore) CountByUserIDAndEventNames(ctx context.Context, userID int32, names []string) (int, error)
```

CountByUserIDAndEventNames gets a count of events logged by a given user that match a list of given event names. 

#### <a id="EventLogStore.countBySQL" href="#EventLogStore.countBySQL">func (l *EventLogStore) countBySQL(ctx context.Context, querySuffix *sqlf.Query) (int, error)</a>

```
searchKey: database.EventLogStore.countBySQL
tags: [private]
```

```Go
func (l *EventLogStore) countBySQL(ctx context.Context, querySuffix *sqlf.Query) (int, error)
```

countBySQL gets a count of event logs. 

#### <a id="EventLogStore.MaxTimestampByUserID" href="#EventLogStore.MaxTimestampByUserID">func (l *EventLogStore) MaxTimestampByUserID(ctx context.Context, userID int32) (*time.Time, error)</a>

```
searchKey: database.EventLogStore.MaxTimestampByUserID
```

```Go
func (l *EventLogStore) MaxTimestampByUserID(ctx context.Context, userID int32) (*time.Time, error)
```

MaxTimestampByUserID gets the max timestamp among event logs for a given user. 

#### <a id="EventLogStore.MaxTimestampByUserIDAndSource" href="#EventLogStore.MaxTimestampByUserIDAndSource">func (l *EventLogStore) MaxTimestampByUserIDAndSource(ctx context.Context, userID int32, source string) (*time.Time, error)</a>

```
searchKey: database.EventLogStore.MaxTimestampByUserIDAndSource
```

```Go
func (l *EventLogStore) MaxTimestampByUserIDAndSource(ctx context.Context, userID int32, source string) (*time.Time, error)
```

MaxTimestampByUserIDAndSource gets the max timestamp among event logs for a given user and event source. 

#### <a id="EventLogStore.maxTimestampBySQL" href="#EventLogStore.maxTimestampBySQL">func (l *EventLogStore) maxTimestampBySQL(ctx context.Context, querySuffix *sqlf.Query) (*time.Time, error)</a>

```
searchKey: database.EventLogStore.maxTimestampBySQL
tags: [private]
```

```Go
func (l *EventLogStore) maxTimestampBySQL(ctx context.Context, querySuffix *sqlf.Query) (*time.Time, error)
```

maxTimestampBySQL gets the max timestamp among event logs. 

#### <a id="EventLogStore.CountUniqueUsersPerPeriod" href="#EventLogStore.CountUniqueUsersPerPeriod">func (l *EventLogStore) CountUniqueUsersPerPeriod(ctx context.Context, periodType PeriodType, now time.Time, periods int, opt *CountUniqueUsersOptions) ([]UsageValue, error)</a>

```
searchKey: database.EventLogStore.CountUniqueUsersPerPeriod
```

```Go
func (l *EventLogStore) CountUniqueUsersPerPeriod(ctx context.Context, periodType PeriodType, now time.Time, periods int, opt *CountUniqueUsersOptions) ([]UsageValue, error)
```

CountUniqueUsersPerPeriod provides a count of unique active users in a given time span, broken up into periods of a given type. The value of `now` should be the current time in UTC. Returns an array of length `periods`, with one entry for each period in the time span. 

#### <a id="EventLogStore.countUniqueUsersPerPeriodBySQL" href="#EventLogStore.countUniqueUsersPerPeriodBySQL">func (l *EventLogStore) countUniqueUsersPerPeriodBySQL(ctx context.Context, interval, period *sqlf.Query, startDate, endDate time.Time, conds []*sqlf.Query) ([]UsageValue, error)</a>

```
searchKey: database.EventLogStore.countUniqueUsersPerPeriodBySQL
tags: [private]
```

```Go
func (l *EventLogStore) countUniqueUsersPerPeriodBySQL(ctx context.Context, interval, period *sqlf.Query, startDate, endDate time.Time, conds []*sqlf.Query) ([]UsageValue, error)
```

#### <a id="EventLogStore.countPerPeriodBySQL" href="#EventLogStore.countPerPeriodBySQL">func (l *EventLogStore) countPerPeriodBySQL(ctx context.Context, countExpr, interval, period *sqlf.Query, startDate, endDate time.Time, conds []*sqlf.Query) ([]UsageValue, error)</a>

```
searchKey: database.EventLogStore.countPerPeriodBySQL
tags: [private]
```

```Go
func (l *EventLogStore) countPerPeriodBySQL(ctx context.Context, countExpr, interval, period *sqlf.Query, startDate, endDate time.Time, conds []*sqlf.Query) ([]UsageValue, error)
```

#### <a id="EventLogStore.CountUniqueUsersAll" href="#EventLogStore.CountUniqueUsersAll">func (l *EventLogStore) CountUniqueUsersAll(ctx context.Context, startDate, endDate time.Time) (int, error)</a>

```
searchKey: database.EventLogStore.CountUniqueUsersAll
```

```Go
func (l *EventLogStore) CountUniqueUsersAll(ctx context.Context, startDate, endDate time.Time) (int, error)
```

CountUniqueUsersAll provides a count of unique active users in a given time span. 

#### <a id="EventLogStore.CountUniqueUsersByEventNamePrefix" href="#EventLogStore.CountUniqueUsersByEventNamePrefix">func (l *EventLogStore) CountUniqueUsersByEventNamePrefix(ctx context.Context, startDate, endDate time.Time, namePrefix string) (int, error)</a>

```
searchKey: database.EventLogStore.CountUniqueUsersByEventNamePrefix
```

```Go
func (l *EventLogStore) CountUniqueUsersByEventNamePrefix(ctx context.Context, startDate, endDate time.Time, namePrefix string) (int, error)
```

CountUniqueUsersByEventNamePrefix provides a count of unique active users in a given time span that logged an event with a given prefix. 

#### <a id="EventLogStore.CountUniqueUsersByEventName" href="#EventLogStore.CountUniqueUsersByEventName">func (l *EventLogStore) CountUniqueUsersByEventName(ctx context.Context, startDate, endDate time.Time, name string) (int, error)</a>

```
searchKey: database.EventLogStore.CountUniqueUsersByEventName
```

```Go
func (l *EventLogStore) CountUniqueUsersByEventName(ctx context.Context, startDate, endDate time.Time, name string) (int, error)
```

CountUniqueUsersByEventName provides a count of unique active users in a given time span that logged a given event. 

#### <a id="EventLogStore.CountUniqueUsersByEventNames" href="#EventLogStore.CountUniqueUsersByEventNames">func (l *EventLogStore) CountUniqueUsersByEventNames(ctx context.Context, startDate, endDate time.Time, names []string) (int, error)</a>

```
searchKey: database.EventLogStore.CountUniqueUsersByEventNames
```

```Go
func (l *EventLogStore) CountUniqueUsersByEventNames(ctx context.Context, startDate, endDate time.Time, names []string) (int, error)
```

CountUniqueUsersByEventNames provides a count of unique active users in a given time span that logged any event that matches a list of given event names 

#### <a id="EventLogStore.countUniqueUsersBySQL" href="#EventLogStore.countUniqueUsersBySQL">func (l *EventLogStore) countUniqueUsersBySQL(ctx context.Context, startDate, endDate time.Time, querySuffix *sqlf.Query) (int, error)</a>

```
searchKey: database.EventLogStore.countUniqueUsersBySQL
tags: [private]
```

```Go
func (l *EventLogStore) countUniqueUsersBySQL(ctx context.Context, startDate, endDate time.Time, querySuffix *sqlf.Query) (int, error)
```

#### <a id="EventLogStore.ListUniqueUsersAll" href="#EventLogStore.ListUniqueUsersAll">func (l *EventLogStore) ListUniqueUsersAll(ctx context.Context, startDate, endDate time.Time) ([]int32, error)</a>

```
searchKey: database.EventLogStore.ListUniqueUsersAll
```

```Go
func (l *EventLogStore) ListUniqueUsersAll(ctx context.Context, startDate, endDate time.Time) ([]int32, error)
```

#### <a id="EventLogStore.UsersUsageCounts" href="#EventLogStore.UsersUsageCounts">func (l *EventLogStore) UsersUsageCounts(ctx context.Context) (counts []types.UserUsageCounts, err error)</a>

```
searchKey: database.EventLogStore.UsersUsageCounts
```

```Go
func (l *EventLogStore) UsersUsageCounts(ctx context.Context) (counts []types.UserUsageCounts, err error)
```

UsersUsageCounts returns a list of UserUsageCounts for all active users that produced 'SearchResultsQueried' and any '%codeintel%' events in the event_logs table. 

#### <a id="EventLogStore.SiteUsage" href="#EventLogStore.SiteUsage">func (l *EventLogStore) SiteUsage(ctx context.Context) (types.SiteUsageSummary, error)</a>

```
searchKey: database.EventLogStore.SiteUsage
```

```Go
func (l *EventLogStore) SiteUsage(ctx context.Context) (types.SiteUsageSummary, error)
```

#### <a id="EventLogStore.siteUsage" href="#EventLogStore.siteUsage">func (l *EventLogStore) siteUsage(ctx context.Context, now time.Time) (summary types.SiteUsageSummary, err error)</a>

```
searchKey: database.EventLogStore.siteUsage
tags: [private]
```

```Go
func (l *EventLogStore) siteUsage(ctx context.Context, now time.Time) (summary types.SiteUsageSummary, err error)
```

#### <a id="EventLogStore.CodeIntelligencePreciseWAUs" href="#EventLogStore.CodeIntelligencePreciseWAUs">func (l *EventLogStore) CodeIntelligencePreciseWAUs(ctx context.Context) (int, error)</a>

```
searchKey: database.EventLogStore.CodeIntelligencePreciseWAUs
```

```Go
func (l *EventLogStore) CodeIntelligencePreciseWAUs(ctx context.Context) (int, error)
```

CodeIntelligencePreciseWAUs returns the WAU (current week) with precise-based code intelligence events. 

#### <a id="EventLogStore.CodeIntelligenceSearchBasedWAUs" href="#EventLogStore.CodeIntelligenceSearchBasedWAUs">func (l *EventLogStore) CodeIntelligenceSearchBasedWAUs(ctx context.Context) (int, error)</a>

```
searchKey: database.EventLogStore.CodeIntelligenceSearchBasedWAUs
```

```Go
func (l *EventLogStore) CodeIntelligenceSearchBasedWAUs(ctx context.Context) (int, error)
```

CodeIntelligenceSearchBasedWAUs returns the WAU (current week) with searched-base code intelligence events. 

#### <a id="EventLogStore.CodeIntelligenceWAUs" href="#EventLogStore.CodeIntelligenceWAUs">func (l *EventLogStore) CodeIntelligenceWAUs(ctx context.Context) (int, error)</a>

```
searchKey: database.EventLogStore.CodeIntelligenceWAUs
```

```Go
func (l *EventLogStore) CodeIntelligenceWAUs(ctx context.Context) (int, error)
```

CodeIntelligenceWAUs returns the WAU (current week) with any (precise or search-based) code intelligence event. 

#### <a id="EventLogStore.CodeIntelligenceCrossRepositoryWAUs" href="#EventLogStore.CodeIntelligenceCrossRepositoryWAUs">func (l *EventLogStore) CodeIntelligenceCrossRepositoryWAUs(ctx context.Context) (int, error)</a>

```
searchKey: database.EventLogStore.CodeIntelligenceCrossRepositoryWAUs
```

```Go
func (l *EventLogStore) CodeIntelligenceCrossRepositoryWAUs(ctx context.Context) (int, error)
```

CodeIntelligenceCrossRepositoryWAUs returns the WAU (current week) with any (precise or search-based) cross-repository code intelligence event. 

#### <a id="EventLogStore.CodeIntelligencePreciseCrossRepositoryWAUs" href="#EventLogStore.CodeIntelligencePreciseCrossRepositoryWAUs">func (l *EventLogStore) CodeIntelligencePreciseCrossRepositoryWAUs(ctx context.Context) (int, error)</a>

```
searchKey: database.EventLogStore.CodeIntelligencePreciseCrossRepositoryWAUs
```

```Go
func (l *EventLogStore) CodeIntelligencePreciseCrossRepositoryWAUs(ctx context.Context) (int, error)
```

CodeIntelligencePreciseCrossRepositoryWAUs returns the WAU (current week) with precise-based cross-repository code intelligence events. 

#### <a id="EventLogStore.CodeIntelligenceSearchBasedCrossRepositoryWAUs" href="#EventLogStore.CodeIntelligenceSearchBasedCrossRepositoryWAUs">func (l *EventLogStore) CodeIntelligenceSearchBasedCrossRepositoryWAUs(ctx context.Context) (int, error)</a>

```
searchKey: database.EventLogStore.CodeIntelligenceSearchBasedCrossRepositoryWAUs
```

```Go
func (l *EventLogStore) CodeIntelligenceSearchBasedCrossRepositoryWAUs(ctx context.Context) (int, error)
```

CodeIntelligenceSearchBasedCrossRepositoryWAUs returns the WAU (current week) with searched-base cross-repository code intelligence events. 

#### <a id="EventLogStore.codeIntelligenceWeeklyUsersCount" href="#EventLogStore.codeIntelligenceWeeklyUsersCount">func (l *EventLogStore) codeIntelligenceWeeklyUsersCount(ctx context.Context, eventNames []string, now time.Time) (wau int, _ error)</a>

```
searchKey: database.EventLogStore.codeIntelligenceWeeklyUsersCount
tags: [private]
```

```Go
func (l *EventLogStore) codeIntelligenceWeeklyUsersCount(ctx context.Context, eventNames []string, now time.Time) (wau int, _ error)
```

#### <a id="EventLogStore.CodeIntelligenceRepositoryCounts" href="#EventLogStore.CodeIntelligenceRepositoryCounts">func (l *EventLogStore) CodeIntelligenceRepositoryCounts(ctx context.Context) (withUploads int, withoutUploads int, err error)</a>

```
searchKey: database.EventLogStore.CodeIntelligenceRepositoryCounts
```

```Go
func (l *EventLogStore) CodeIntelligenceRepositoryCounts(ctx context.Context) (withUploads int, withoutUploads int, err error)
```

CodeIntelligenceRepositoryCounts returns the number of repositories with and without an associated and up-to-date code intelligence upload. 

#### <a id="EventLogStore.AggregatedCodeIntelEvents" href="#EventLogStore.AggregatedCodeIntelEvents">func (l *EventLogStore) AggregatedCodeIntelEvents(ctx context.Context) ([]types.CodeIntelAggregatedEvent, error)</a>

```
searchKey: database.EventLogStore.AggregatedCodeIntelEvents
```

```Go
func (l *EventLogStore) AggregatedCodeIntelEvents(ctx context.Context) ([]types.CodeIntelAggregatedEvent, error)
```

AggregatedCodeIntelEvents calculates CodeIntelAggregatedEvent for each every unique event type related to code intel. 

#### <a id="EventLogStore.aggregatedCodeIntelEvents" href="#EventLogStore.aggregatedCodeIntelEvents">func (l *EventLogStore) aggregatedCodeIntelEvents(ctx context.Context, now time.Time) (events []types.CodeIntelAggregatedEvent, err error)</a>

```
searchKey: database.EventLogStore.aggregatedCodeIntelEvents
tags: [private]
```

```Go
func (l *EventLogStore) aggregatedCodeIntelEvents(ctx context.Context, now time.Time) (events []types.CodeIntelAggregatedEvent, err error)
```

#### <a id="EventLogStore.AggregatedSearchEvents" href="#EventLogStore.AggregatedSearchEvents">func (l *EventLogStore) AggregatedSearchEvents(ctx context.Context, now time.Time) ([]types.SearchAggregatedEvent, error)</a>

```
searchKey: database.EventLogStore.AggregatedSearchEvents
```

```Go
func (l *EventLogStore) AggregatedSearchEvents(ctx context.Context, now time.Time) ([]types.SearchAggregatedEvent, error)
```

AggregatedSearchEvents calculates SearchAggregatedEvent for each every unique event type related to search. 

#### <a id="EventLogStore.aggregatedSearchEvents" href="#EventLogStore.aggregatedSearchEvents">func (l *EventLogStore) aggregatedSearchEvents(ctx context.Context, queryString string, now time.Time) (events []types.SearchAggregatedEvent, err error)</a>

```
searchKey: database.EventLogStore.aggregatedSearchEvents
tags: [private]
```

```Go
func (l *EventLogStore) aggregatedSearchEvents(ctx context.Context, queryString string, now time.Time) (events []types.SearchAggregatedEvent, err error)
```

### <a id="Event" href="#Event">type Event struct</a>

```
searchKey: database.Event
```

```Go
type Event struct {
	Name            string
	URL             string
	UserID          uint32
	AnonymousUserID string
	Argument        json.RawMessage
	Source          string
	Timestamp       time.Time
	FeatureFlags    featureflag.FlagSet
	CohortID        *string // date in YYYY-MM-DD format
}
```

Event contains information needed for logging an event. 

#### <a id="makeTestEvent" href="#makeTestEvent">func makeTestEvent(e *Event) *Event</a>

```
searchKey: database.makeTestEvent
tags: [private]
```

```Go
func makeTestEvent(e *Event) *Event
```

makeTestEvent sets the required (uninteresting) fields that are required on insertion due to database constraints. This method will also add some sub-day jitter to the timestamp. 

### <a id="EventLogsListOptions" href="#EventLogsListOptions">type EventLogsListOptions struct</a>

```
searchKey: database.EventLogsListOptions
```

```Go
type EventLogsListOptions struct {
	// UserID specifies the user whose events should be included.
	UserID int32

	*LimitOffset

	EventName *string
}
```

EventLogsListOptions specifies the options for listing event logs. 

### <a id="UsageValue" href="#UsageValue">type UsageValue struct</a>

```
searchKey: database.UsageValue
```

```Go
type UsageValue struct {
	Start time.Time
	Count int
}
```

UsageValue is a single count of usage for a time period starting on a given date. 

### <a id="PeriodType" href="#PeriodType">type PeriodType string</a>

```
searchKey: database.PeriodType
```

```Go
type PeriodType string
```

PeriodType is the type of period in which to count events and unique users. 

### <a id="CountUniqueUsersOptions" href="#CountUniqueUsersOptions">type CountUniqueUsersOptions struct</a>

```
searchKey: database.CountUniqueUsersOptions
```

```Go
type CountUniqueUsersOptions struct {
	// If true, only include registered users. Otherwise, include all users.
	RegisteredOnly bool
	// If true, only include code host integration users. Otherwise, include all users.
	IntegrationOnly bool
	// If set, adds additional restrictions on the event types.
	EventFilters *EventFilterOptions
}
```

CountUniqueUsersOptions provides options for counting unique users. 

### <a id="EventFilterOptions" href="#EventFilterOptions">type EventFilterOptions struct</a>

```
searchKey: database.EventFilterOptions
```

```Go
type EventFilterOptions struct {
	// If set, only include events with a given prefix.
	ByEventNamePrefix string
	// If set, only include events with the given name.
	ByEventName string
	// If not empty, only include events that matche a list of given event names
	ByEventNames []string
	// Must be used with ByEventName
	//
	// If set, only include events that match a specified condition.
	ByEventNameWithCondition *sqlf.Query
}
```

EventFilterOptions provides options for filtering events. 

### <a id="EventArgumentMatch" href="#EventArgumentMatch">type EventArgumentMatch struct</a>

```
searchKey: database.EventArgumentMatch
```

```Go
type EventArgumentMatch struct {
	// The name of the JSON key to match against.
	ArgumentName string
	// The actual value passed to the JSON key to match.
	ArgumentValue string
}
```

EventArgumentMatch provides the options for matching an event with a specific JSON value passed as an argument. 

### <a id="PercentileValue" href="#PercentileValue">type PercentileValue struct</a>

```
searchKey: database.PercentileValue
```

```Go
type PercentileValue struct {
	Start  time.Time
	Values []float64
}
```

PercentileValue is a slice of Nth percentile values calculated from a field of events in a time period starting on a given date. 

### <a id="MockEventLogs" href="#MockEventLogs">type MockEventLogs struct</a>

```
searchKey: database.MockEventLogs
```

```Go
type MockEventLogs struct {
	LatestPing func(ctx context.Context) (*types.Event, error)
}
```

### <a id="userExternalAccountNotFoundError" href="#userExternalAccountNotFoundError">type userExternalAccountNotFoundError struct</a>

```
searchKey: database.userExternalAccountNotFoundError
tags: [private]
```

```Go
type userExternalAccountNotFoundError struct {
	args []interface{}
}
```

userExternalAccountNotFoundError is the error that is returned when a user external account is not found. 

#### <a id="userExternalAccountNotFoundError.Error" href="#userExternalAccountNotFoundError.Error">func (err userExternalAccountNotFoundError) Error() string</a>

```
searchKey: database.userExternalAccountNotFoundError.Error
tags: [private]
```

```Go
func (err userExternalAccountNotFoundError) Error() string
```

#### <a id="userExternalAccountNotFoundError.NotFound" href="#userExternalAccountNotFoundError.NotFound">func (err userExternalAccountNotFoundError) NotFound() bool</a>

```
searchKey: database.userExternalAccountNotFoundError.NotFound
tags: [private]
```

```Go
func (err userExternalAccountNotFoundError) NotFound() bool
```

### <a id="UserExternalAccountsStore" href="#UserExternalAccountsStore">type UserExternalAccountsStore struct</a>

```
searchKey: database.UserExternalAccountsStore
```

```Go
type UserExternalAccountsStore struct {
	*basestore.Store
	once sync.Once

	key encryption.Key
}
```

UserExternalAccountsStore provides access to the `user_external_accounts` table. 

#### <a id="ExternalAccounts" href="#ExternalAccounts">func ExternalAccounts(db dbutil.DB) *UserExternalAccountsStore</a>

```
searchKey: database.ExternalAccounts
```

```Go
func ExternalAccounts(db dbutil.DB) *UserExternalAccountsStore
```

ExternalAccounts instantiates and returns a new UserExternalAccountsStore with prepared statements. 

#### <a id="ExternalAccountsWith" href="#ExternalAccountsWith">func ExternalAccountsWith(other basestore.ShareableStore) *UserExternalAccountsStore</a>

```
searchKey: database.ExternalAccountsWith
```

```Go
func ExternalAccountsWith(other basestore.ShareableStore) *UserExternalAccountsStore
```

ExternalAccountsWith instantiates and returns a new UserExternalAccountsStore using the other store handle. 

#### <a id="UserExternalAccountsStore.With" href="#UserExternalAccountsStore.With">func (s *UserExternalAccountsStore) With(other basestore.ShareableStore) *UserExternalAccountsStore</a>

```
searchKey: database.UserExternalAccountsStore.With
```

```Go
func (s *UserExternalAccountsStore) With(other basestore.ShareableStore) *UserExternalAccountsStore
```

#### <a id="UserExternalAccountsStore.WithEncryptionKey" href="#UserExternalAccountsStore.WithEncryptionKey">func (s *UserExternalAccountsStore) WithEncryptionKey(key encryption.Key) *UserExternalAccountsStore</a>

```
searchKey: database.UserExternalAccountsStore.WithEncryptionKey
```

```Go
func (s *UserExternalAccountsStore) WithEncryptionKey(key encryption.Key) *UserExternalAccountsStore
```

#### <a id="UserExternalAccountsStore.Transact" href="#UserExternalAccountsStore.Transact">func (s *UserExternalAccountsStore) Transact(ctx context.Context) (*UserExternalAccountsStore, error)</a>

```
searchKey: database.UserExternalAccountsStore.Transact
```

```Go
func (s *UserExternalAccountsStore) Transact(ctx context.Context) (*UserExternalAccountsStore, error)
```

#### <a id="UserExternalAccountsStore.ensureStore" href="#UserExternalAccountsStore.ensureStore">func (s *UserExternalAccountsStore) ensureStore()</a>

```
searchKey: database.UserExternalAccountsStore.ensureStore
tags: [private]
```

```Go
func (s *UserExternalAccountsStore) ensureStore()
```

ensureStore instantiates a basestore.Store if necessary, using the dbconn.Global handle. This function ensures access to dbconn happens after the rest of the code or tests have initialized it. 

#### <a id="UserExternalAccountsStore.getEncryptionKey" href="#UserExternalAccountsStore.getEncryptionKey">func (s *UserExternalAccountsStore) getEncryptionKey() encryption.Key</a>

```
searchKey: database.UserExternalAccountsStore.getEncryptionKey
tags: [private]
```

```Go
func (s *UserExternalAccountsStore) getEncryptionKey() encryption.Key
```

#### <a id="UserExternalAccountsStore.Get" href="#UserExternalAccountsStore.Get">func (s *UserExternalAccountsStore) Get(ctx context.Context, id int32) (*extsvc.Account, error)</a>

```
searchKey: database.UserExternalAccountsStore.Get
```

```Go
func (s *UserExternalAccountsStore) Get(ctx context.Context, id int32) (*extsvc.Account, error)
```

Get gets information about the user external account. 

#### <a id="UserExternalAccountsStore.LookupUserAndSave" href="#UserExternalAccountsStore.LookupUserAndSave">func (s *UserExternalAccountsStore) LookupUserAndSave(ctx context.Context, spec extsvc.AccountSpec, data extsvc.AccountData) (userID int32, err error)</a>

```
searchKey: database.UserExternalAccountsStore.LookupUserAndSave
```

```Go
func (s *UserExternalAccountsStore) LookupUserAndSave(ctx context.Context, spec extsvc.AccountSpec, data extsvc.AccountData) (userID int32, err error)
```

LookupUserAndSave is used for authenticating a user (when both their Sourcegraph account and the association with the external account already exist). 

It looks up the existing user associated with the external account's extsvc.AccountSpec. If found, it updates the account's data and returns the user. It NEVER creates a user; you must call CreateUserAndSave for that. 

#### <a id="UserExternalAccountsStore.AssociateUserAndSave" href="#UserExternalAccountsStore.AssociateUserAndSave">func (s *UserExternalAccountsStore) AssociateUserAndSave(ctx context.Context, userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) (err error)</a>

```
searchKey: database.UserExternalAccountsStore.AssociateUserAndSave
```

```Go
func (s *UserExternalAccountsStore) AssociateUserAndSave(ctx context.Context, userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) (err error)
```

AssociateUserAndSave is used for linking a new, additional external account with an existing Sourcegraph account. 

It creates a user external account and associates it with the specified user. If the external account already exists and is associated with: 

- the same user: it updates the data and returns a nil error; or - a different user: it performs no update and returns a non-nil error 

#### <a id="UserExternalAccountsStore.CreateUserAndSave" href="#UserExternalAccountsStore.CreateUserAndSave">func (s *UserExternalAccountsStore) CreateUserAndSave(ctx context.Context, newUser NewUser, spec extsvc.AccountSpec, data extsvc.AccountData) (createdUserID int32, err error)</a>

```
searchKey: database.UserExternalAccountsStore.CreateUserAndSave
```

```Go
func (s *UserExternalAccountsStore) CreateUserAndSave(ctx context.Context, newUser NewUser, spec extsvc.AccountSpec, data extsvc.AccountData) (createdUserID int32, err error)
```

CreateUserAndSave is used to create a new Sourcegraph user account from an external account (e.g., "signup from SAML"). 

It creates a new user and associates it with the specified external account. If the user to create already exists, it returns an error. 

#### <a id="UserExternalAccountsStore.insert" href="#UserExternalAccountsStore.insert">func (s *UserExternalAccountsStore) insert(ctx context.Context, userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) error</a>

```
searchKey: database.UserExternalAccountsStore.insert
tags: [private]
```

```Go
func (s *UserExternalAccountsStore) insert(ctx context.Context, userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) error
```

#### <a id="UserExternalAccountsStore.TouchExpired" href="#UserExternalAccountsStore.TouchExpired">func (s *UserExternalAccountsStore) TouchExpired(ctx context.Context, id int32) error</a>

```
searchKey: database.UserExternalAccountsStore.TouchExpired
```

```Go
func (s *UserExternalAccountsStore) TouchExpired(ctx context.Context, id int32) error
```

TouchExpired sets the given user external account to be expired now. 

#### <a id="UserExternalAccountsStore.TouchLastValid" href="#UserExternalAccountsStore.TouchLastValid">func (s *UserExternalAccountsStore) TouchLastValid(ctx context.Context, id int32) error</a>

```
searchKey: database.UserExternalAccountsStore.TouchLastValid
```

```Go
func (s *UserExternalAccountsStore) TouchLastValid(ctx context.Context, id int32) error
```

TouchLastValid sets last valid time of the given user external account to be now. 

#### <a id="UserExternalAccountsStore.Delete" href="#UserExternalAccountsStore.Delete">func (s *UserExternalAccountsStore) Delete(ctx context.Context, id int32) error</a>

```
searchKey: database.UserExternalAccountsStore.Delete
```

```Go
func (s *UserExternalAccountsStore) Delete(ctx context.Context, id int32) error
```

Delete deletes a user external account. 

#### <a id="UserExternalAccountsStore.List" href="#UserExternalAccountsStore.List">func (s *UserExternalAccountsStore) List(ctx context.Context, opt ExternalAccountsListOptions) (acct []*extsvc.Account, err error)</a>

```
searchKey: database.UserExternalAccountsStore.List
```

```Go
func (s *UserExternalAccountsStore) List(ctx context.Context, opt ExternalAccountsListOptions) (acct []*extsvc.Account, err error)
```

#### <a id="UserExternalAccountsStore.Count" href="#UserExternalAccountsStore.Count">func (s *UserExternalAccountsStore) Count(ctx context.Context, opt ExternalAccountsListOptions) (int, error)</a>

```
searchKey: database.UserExternalAccountsStore.Count
```

```Go
func (s *UserExternalAccountsStore) Count(ctx context.Context, opt ExternalAccountsListOptions) (int, error)
```

#### <a id="UserExternalAccountsStore.getBySQL" href="#UserExternalAccountsStore.getBySQL">func (s *UserExternalAccountsStore) getBySQL(ctx context.Context, querySuffix *sqlf.Query) (*extsvc.Account, error)</a>

```
searchKey: database.UserExternalAccountsStore.getBySQL
tags: [private]
```

```Go
func (s *UserExternalAccountsStore) getBySQL(ctx context.Context, querySuffix *sqlf.Query) (*extsvc.Account, error)
```

#### <a id="UserExternalAccountsStore.listBySQL" href="#UserExternalAccountsStore.listBySQL">func (s *UserExternalAccountsStore) listBySQL(ctx context.Context, querySuffix *sqlf.Query) ([]*extsvc.Account, error)</a>

```
searchKey: database.UserExternalAccountsStore.listBySQL
tags: [private]
```

```Go
func (s *UserExternalAccountsStore) listBySQL(ctx context.Context, querySuffix *sqlf.Query) ([]*extsvc.Account, error)
```

#### <a id="UserExternalAccountsStore.listSQL" href="#UserExternalAccountsStore.listSQL">func (s *UserExternalAccountsStore) listSQL(opt ExternalAccountsListOptions) (conds []*sqlf.Query)</a>

```
searchKey: database.UserExternalAccountsStore.listSQL
tags: [private]
```

```Go
func (s *UserExternalAccountsStore) listSQL(opt ExternalAccountsListOptions) (conds []*sqlf.Query)
```

### <a id="ExternalAccountsListOptions" href="#ExternalAccountsListOptions">type ExternalAccountsListOptions struct</a>

```
searchKey: database.ExternalAccountsListOptions
```

```Go
type ExternalAccountsListOptions struct {
	UserID                           int32
	ServiceType, ServiceID, ClientID string
	AccountID                        int64
	ExcludeExpired                   bool
	*LimitOffset
}
```

ExternalAccountsListOptions specifies the options for listing user external accounts. 

### <a id="MockExternalAccounts" href="#MockExternalAccounts">type MockExternalAccounts struct</a>

```
searchKey: database.MockExternalAccounts
```

```Go
type MockExternalAccounts struct {
	Get                  func(id int32) (*extsvc.Account, error)
	LookupUserAndSave    func(extsvc.AccountSpec, extsvc.AccountData) (userID int32, err error)
	AssociateUserAndSave func(userID int32, spec extsvc.AccountSpec, data extsvc.AccountData) error
	CreateUserAndSave    func(NewUser, extsvc.AccountSpec, extsvc.AccountData) (createdUserID int32, err error)
	Delete               func(id int32) error
	List                 func(ExternalAccountsListOptions) ([]*extsvc.Account, error)
	Count                func(ExternalAccountsListOptions) (int, error)
	TouchExpired         func(ctx context.Context, id int32) error
	TouchLastValid       func(ctx context.Context, id int32) error
}
```

MockExternalAccounts mocks the Stores.ExternalAccounts DB store. 

### <a id="ExternalServiceStore" href="#ExternalServiceStore">type ExternalServiceStore struct</a>

```
searchKey: database.ExternalServiceStore
```

```Go
type ExternalServiceStore struct {
	*basestore.Store

	GitHubValidators          []func(*schema.GitHubConnection) error
	GitLabValidators          []func(*schema.GitLabConnection, []schema.AuthProviders) error
	BitbucketServerValidators []func(*schema.BitbucketServerConnection) error
	PerforceValidators        []func(*schema.PerforceConnection) error

	key encryption.Key

	mu sync.Mutex
}
```

An ExternalServiceStore stores external services and their configuration. Before updating or creating a new external service, validation is performed. The enterprise code registers additional validators at run-time and sets the global instance in stores.go 

#### <a id="ExternalServices" href="#ExternalServices">func ExternalServices(db dbutil.DB) *ExternalServiceStore</a>

```
searchKey: database.ExternalServices
```

```Go
func ExternalServices(db dbutil.DB) *ExternalServiceStore
```

ExternalServices instantiates and returns a new ExternalServicesStore with prepared statements. 

#### <a id="ExternalServicesWith" href="#ExternalServicesWith">func ExternalServicesWith(other basestore.ShareableStore) *ExternalServiceStore</a>

```
searchKey: database.ExternalServicesWith
```

```Go
func ExternalServicesWith(other basestore.ShareableStore) *ExternalServiceStore
```

ExternalServicesWith instantiates and returns a new ExternalServicesStore with prepared statements. 

#### <a id="ExternalServiceStore.copy" href="#ExternalServiceStore.copy">func (e *ExternalServiceStore) copy() *ExternalServiceStore</a>

```
searchKey: database.ExternalServiceStore.copy
tags: [private]
```

```Go
func (e *ExternalServiceStore) copy() *ExternalServiceStore
```

#### <a id="ExternalServiceStore.With" href="#ExternalServiceStore.With">func (e *ExternalServiceStore) With(other basestore.ShareableStore) *ExternalServiceStore</a>

```
searchKey: database.ExternalServiceStore.With
```

```Go
func (e *ExternalServiceStore) With(other basestore.ShareableStore) *ExternalServiceStore
```

#### <a id="ExternalServiceStore.WithEncryptionKey" href="#ExternalServiceStore.WithEncryptionKey">func (e *ExternalServiceStore) WithEncryptionKey(key encryption.Key) *ExternalServiceStore</a>

```
searchKey: database.ExternalServiceStore.WithEncryptionKey
```

```Go
func (e *ExternalServiceStore) WithEncryptionKey(key encryption.Key) *ExternalServiceStore
```

#### <a id="ExternalServiceStore.Transact" href="#ExternalServiceStore.Transact">func (e *ExternalServiceStore) Transact(ctx context.Context) (*ExternalServiceStore, error)</a>

```
searchKey: database.ExternalServiceStore.Transact
```

```Go
func (e *ExternalServiceStore) Transact(ctx context.Context) (*ExternalServiceStore, error)
```

#### <a id="ExternalServiceStore.Done" href="#ExternalServiceStore.Done">func (e *ExternalServiceStore) Done(err error) error</a>

```
searchKey: database.ExternalServiceStore.Done
```

```Go
func (e *ExternalServiceStore) Done(err error) error
```

#### <a id="ExternalServiceStore.ensureStore" href="#ExternalServiceStore.ensureStore">func (e *ExternalServiceStore) ensureStore()</a>

```
searchKey: database.ExternalServiceStore.ensureStore
tags: [private]
```

```Go
func (e *ExternalServiceStore) ensureStore()
```

ensureStore instantiates a basestore.Store if necessary, using the dbconn.Global handle. This function ensures access to dbconn happens after the rest of the code or tests have initialized it. 

#### <a id="ExternalServiceStore.ValidateConfig" href="#ExternalServiceStore.ValidateConfig">func (e *ExternalServiceStore) ValidateConfig(ctx context.Context, opt ValidateExternalServiceConfigOptions) (normalized []byte, err error)</a>

```
searchKey: database.ExternalServiceStore.ValidateConfig
```

```Go
func (e *ExternalServiceStore) ValidateConfig(ctx context.Context, opt ValidateExternalServiceConfigOptions) (normalized []byte, err error)
```

ValidateConfig validates the given external service configuration, and returns a normalized version of the configuration (i.e. valid JSON without comments). A positive opt.ID indicates we are updating an existing service, adding a new one otherwise. 

#### <a id="ExternalServiceStore.validateGitHubConnection" href="#ExternalServiceStore.validateGitHubConnection">func (e *ExternalServiceStore) validateGitHubConnection(ctx context.Context, id int64, c *schema.GitHubConnection) error</a>

```
searchKey: database.ExternalServiceStore.validateGitHubConnection
tags: [private]
```

```Go
func (e *ExternalServiceStore) validateGitHubConnection(ctx context.Context, id int64, c *schema.GitHubConnection) error
```

#### <a id="ExternalServiceStore.validateGitLabConnection" href="#ExternalServiceStore.validateGitLabConnection">func (e *ExternalServiceStore) validateGitLabConnection(ctx context.Context, id int64, c *schema.GitLabConnection, ps []schema.AuthProviders) error</a>

```
searchKey: database.ExternalServiceStore.validateGitLabConnection
tags: [private]
```

```Go
func (e *ExternalServiceStore) validateGitLabConnection(ctx context.Context, id int64, c *schema.GitLabConnection, ps []schema.AuthProviders) error
```

#### <a id="ExternalServiceStore.validateBitbucketServerConnection" href="#ExternalServiceStore.validateBitbucketServerConnection">func (e *ExternalServiceStore) validateBitbucketServerConnection(ctx context.Context, id int64, c *schema.BitbucketServerConnection) error</a>

```
searchKey: database.ExternalServiceStore.validateBitbucketServerConnection
tags: [private]
```

```Go
func (e *ExternalServiceStore) validateBitbucketServerConnection(ctx context.Context, id int64, c *schema.BitbucketServerConnection) error
```

#### <a id="ExternalServiceStore.validateBitbucketCloudConnection" href="#ExternalServiceStore.validateBitbucketCloudConnection">func (e *ExternalServiceStore) validateBitbucketCloudConnection(ctx context.Context, id int64, c *schema.BitbucketCloudConnection) error</a>

```
searchKey: database.ExternalServiceStore.validateBitbucketCloudConnection
tags: [private]
```

```Go
func (e *ExternalServiceStore) validateBitbucketCloudConnection(ctx context.Context, id int64, c *schema.BitbucketCloudConnection) error
```

#### <a id="ExternalServiceStore.validatePerforceConnection" href="#ExternalServiceStore.validatePerforceConnection">func (e *ExternalServiceStore) validatePerforceConnection(ctx context.Context, id int64, c *schema.PerforceConnection) error</a>

```
searchKey: database.ExternalServiceStore.validatePerforceConnection
tags: [private]
```

```Go
func (e *ExternalServiceStore) validatePerforceConnection(ctx context.Context, id int64, c *schema.PerforceConnection) error
```

#### <a id="ExternalServiceStore.validateDuplicateRateLimits" href="#ExternalServiceStore.validateDuplicateRateLimits">func (e *ExternalServiceStore) validateDuplicateRateLimits(ctx context.Context, id int64, kind string, parsedConfig interface{}) error</a>

```
searchKey: database.ExternalServiceStore.validateDuplicateRateLimits
tags: [private]
```

```Go
func (e *ExternalServiceStore) validateDuplicateRateLimits(ctx context.Context, id int64, kind string, parsedConfig interface{}) error
```

validateDuplicateRateLimits returns an error if given config has duplicated non-default rate limit with another external service for the same code host. 

#### <a id="ExternalServiceStore.validateSingleKindPerUser" href="#ExternalServiceStore.validateSingleKindPerUser">func (e *ExternalServiceStore) validateSingleKindPerUser(ctx context.Context, id int64, kind string, userID int32) error</a>

```
searchKey: database.ExternalServiceStore.validateSingleKindPerUser
tags: [private]
```

```Go
func (e *ExternalServiceStore) validateSingleKindPerUser(ctx context.Context, id int64, kind string, userID int32) error
```

validateSingleKindPerUser returns an error if the user attempts to add more than one external service of the same kind. 

#### <a id="ExternalServiceStore.Create" href="#ExternalServiceStore.Create">func (e *ExternalServiceStore) Create(ctx context.Context, confGet func() *conf.Unified, es *types.ExternalService) error</a>

```
searchKey: database.ExternalServiceStore.Create
```

```Go
func (e *ExternalServiceStore) Create(ctx context.Context, confGet func() *conf.Unified, es *types.ExternalService) error
```

Create creates an external service. 

Since this method is used before the configuration server has started (search for "EXTSVC_CONFIG_FILE") you must pass the conf.Get function in so that an alternative can be used when the configuration server has not started, otherwise a panic would occur once pkg/conf's deadlock detector determines a deadlock occurred. 

🚨 SECURITY: The caller must ensure that the actor is a site admin or owner of the external service. Otherwise, `es.NamespaceUserID` must be specified (i.e. non-nil) for a user-added external service. 

🚨 SECURITY: The value of `es.Unrestricted` is disregarded and will always be recalculated based on whether "authorization" field is presented in `es.Config`. For Sourcegraph Cloud, the `es.Unrestricted` will always be false (i.e. enforce permissions). 

#### <a id="ExternalServiceStore.maybeEncryptConfig" href="#ExternalServiceStore.maybeEncryptConfig">func (e *ExternalServiceStore) maybeEncryptConfig(ctx context.Context, config string) (string, string, error)</a>

```
searchKey: database.ExternalServiceStore.maybeEncryptConfig
tags: [private]
```

```Go
func (e *ExternalServiceStore) maybeEncryptConfig(ctx context.Context, config string) (string, string, error)
```

maybeEncryptConfig encrypts and returns externals service config if an encryption.Key is configured 

#### <a id="ExternalServiceStore.maybeDecryptConfig" href="#ExternalServiceStore.maybeDecryptConfig">func (e *ExternalServiceStore) maybeDecryptConfig(ctx context.Context, config string, keyID string) (string, error)</a>

```
searchKey: database.ExternalServiceStore.maybeDecryptConfig
tags: [private]
```

```Go
func (e *ExternalServiceStore) maybeDecryptConfig(ctx context.Context, config string, keyID string) (string, error)
```

#### <a id="ExternalServiceStore.Upsert" href="#ExternalServiceStore.Upsert">func (e *ExternalServiceStore) Upsert(ctx context.Context, svcs ...*types.ExternalService) (err error)</a>

```
searchKey: database.ExternalServiceStore.Upsert
```

```Go
func (e *ExternalServiceStore) Upsert(ctx context.Context, svcs ...*types.ExternalService) (err error)
```

Upsert updates or inserts the given ExternalServices. 

NOTE: Deletion of an external service via Upsert is not allowed. Use Delete() instead. 

🚨 SECURITY: The value of `es.Unrestricted` is disregarded and will always be recalculated based on whether "authorization" field is presented in `es.Config`. For Sourcegraph Cloud, the `es.Unrestricted` will always be false (i.e. enforce permissions). 

#### <a id="ExternalServiceStore.upsertExternalServicesQuery" href="#ExternalServiceStore.upsertExternalServicesQuery">func (e *ExternalServiceStore) upsertExternalServicesQuery(ctx context.Context, svcs []*types.ExternalService) (*sqlf.Query, error)</a>

```
searchKey: database.ExternalServiceStore.upsertExternalServicesQuery
tags: [private]
```

```Go
func (e *ExternalServiceStore) upsertExternalServicesQuery(ctx context.Context, svcs []*types.ExternalService) (*sqlf.Query, error)
```

#### <a id="ExternalServiceStore.Update" href="#ExternalServiceStore.Update">func (e *ExternalServiceStore) Update(ctx context.Context, ps []schema.AuthProviders, id int64, update *ExternalServiceUpdate) (err error)</a>

```
searchKey: database.ExternalServiceStore.Update
```

```Go
func (e *ExternalServiceStore) Update(ctx context.Context, ps []schema.AuthProviders, id int64, update *ExternalServiceUpdate) (err error)
```

Update updates an external service. 

🚨 SECURITY: The caller must ensure that the actor is a site admin, or has the legitimate access to the external service (i.e. the owner). 

#### <a id="ExternalServiceStore.Delete" href="#ExternalServiceStore.Delete">func (e *ExternalServiceStore) Delete(ctx context.Context, id int64) (err error)</a>

```
searchKey: database.ExternalServiceStore.Delete
```

```Go
func (e *ExternalServiceStore) Delete(ctx context.Context, id int64) (err error)
```

Delete deletes an external service. 

🚨 SECURITY: The caller must ensure that the actor is a site admin or owner of the external service. 

#### <a id="ExternalServiceStore.GetByID" href="#ExternalServiceStore.GetByID">func (e *ExternalServiceStore) GetByID(ctx context.Context, id int64) (*types.ExternalService, error)</a>

```
searchKey: database.ExternalServiceStore.GetByID
```

```Go
func (e *ExternalServiceStore) GetByID(ctx context.Context, id int64) (*types.ExternalService, error)
```

GetByID returns the external service for id. 

🚨 SECURITY: The caller must ensure that the actor is a site admin or owner of the external service. 

#### <a id="ExternalServiceStore.GetSyncJobs" href="#ExternalServiceStore.GetSyncJobs">func (e *ExternalServiceStore) GetSyncJobs(ctx context.Context) ([]*types.ExternalServiceSyncJob, error)</a>

```
searchKey: database.ExternalServiceStore.GetSyncJobs
```

```Go
func (e *ExternalServiceStore) GetSyncJobs(ctx context.Context) ([]*types.ExternalServiceSyncJob, error)
```

GetSyncJobs gets all sync jobs 

#### <a id="ExternalServiceStore.GetLastSyncError" href="#ExternalServiceStore.GetLastSyncError">func (e *ExternalServiceStore) GetLastSyncError(ctx context.Context, id int64) (string, error)</a>

```
searchKey: database.ExternalServiceStore.GetLastSyncError
```

```Go
func (e *ExternalServiceStore) GetLastSyncError(ctx context.Context, id int64) (string, error)
```

GetLastSyncError returns the error associated with the latest sync of the supplied external service. 

🚨 SECURITY: The caller must ensure that the actor is a site admin or owner of the external service 

#### <a id="ExternalServiceStore.GetAffiliatedSyncErrors" href="#ExternalServiceStore.GetAffiliatedSyncErrors">func (e *ExternalServiceStore) GetAffiliatedSyncErrors(ctx context.Context, u *types.User) (map[int64]string, error)</a>

```
searchKey: database.ExternalServiceStore.GetAffiliatedSyncErrors
```

```Go
func (e *ExternalServiceStore) GetAffiliatedSyncErrors(ctx context.Context, u *types.User) (map[int64]string, error)
```

GetAffiliatedSyncErrors returns the most recent sync failure message for each external service affiliated with the supplied user. If the latest run did not have an error, the string will be empty. We fetch external services owned by the supplied user and if they are a site admin we additionally return site level external services. We exclude cloud_default repos as they are never synced. 

#### <a id="ExternalServiceStore.List" href="#ExternalServiceStore.List">func (e *ExternalServiceStore) List(ctx context.Context, opt ExternalServicesListOptions) ([]*types.ExternalService, error)</a>

```
searchKey: database.ExternalServiceStore.List
```

```Go
func (e *ExternalServiceStore) List(ctx context.Context, opt ExternalServicesListOptions) ([]*types.ExternalService, error)
```

List returns external services under given namespace. If no namespace is given, it returns all external services. 

🚨 SECURITY: The caller must ensure one of the following: 

```
- The actor is a site admin
- The opt.NamespaceUserID is same as authenticated user ID (i.e. actor.UID)

```
#### <a id="ExternalServiceStore.DistinctKinds" href="#ExternalServiceStore.DistinctKinds">func (e *ExternalServiceStore) DistinctKinds(ctx context.Context) ([]string, error)</a>

```
searchKey: database.ExternalServiceStore.DistinctKinds
```

```Go
func (e *ExternalServiceStore) DistinctKinds(ctx context.Context) ([]string, error)
```

DistinctKinds returns the distinct list of external services kinds that are stored in the database. 

#### <a id="ExternalServiceStore.list" href="#ExternalServiceStore.list">func (e *ExternalServiceStore) list(ctx context.Context, opt ExternalServicesListOptions) ([]*types.ExternalService, error)</a>

```
searchKey: database.ExternalServiceStore.list
tags: [private]
```

```Go
func (e *ExternalServiceStore) list(ctx context.Context, opt ExternalServicesListOptions) ([]*types.ExternalService, error)
```

#### <a id="ExternalServiceStore.Count" href="#ExternalServiceStore.Count">func (e *ExternalServiceStore) Count(ctx context.Context, opt ExternalServicesListOptions) (int, error)</a>

```
searchKey: database.ExternalServiceStore.Count
```

```Go
func (e *ExternalServiceStore) Count(ctx context.Context, opt ExternalServicesListOptions) (int, error)
```

Count counts all external services that satisfy the options (ignoring limit and offset). 

🚨 SECURITY: The caller must ensure that the actor is a site admin or owner of the external service. 

#### <a id="ExternalServiceStore.RepoCount" href="#ExternalServiceStore.RepoCount">func (e *ExternalServiceStore) RepoCount(ctx context.Context, id int64) (int32, error)</a>

```
searchKey: database.ExternalServiceStore.RepoCount
```

```Go
func (e *ExternalServiceStore) RepoCount(ctx context.Context, id int64) (int32, error)
```

RepoCount returns the number of repos synced by the external service with the given id. 

🚨 SECURITY: The caller must ensure that the actor is a site admin or owner of the external service. 

#### <a id="ExternalServiceStore.SyncDue" href="#ExternalServiceStore.SyncDue">func (e *ExternalServiceStore) SyncDue(ctx context.Context, intIDs []int64, d time.Duration) (bool, error)</a>

```
searchKey: database.ExternalServiceStore.SyncDue
```

```Go
func (e *ExternalServiceStore) SyncDue(ctx context.Context, intIDs []int64, d time.Duration) (bool, error)
```

SyncDue returns true if any of the supplied external services are due to sync now or within given duration from now. 

### <a id="ExternalServiceKind" href="#ExternalServiceKind">type ExternalServiceKind struct</a>

```
searchKey: database.ExternalServiceKind
```

```Go
type ExternalServiceKind struct {
	// True if the external service can host repositories.
	CodeHost bool

	JSONSchema string // JSON Schema for the external service's configuration
}
```

ExternalServiceKind describes a kind of external service. 

### <a id="ExternalServicesListOptions" href="#ExternalServicesListOptions">type ExternalServicesListOptions struct</a>

```
searchKey: database.ExternalServicesListOptions
```

```Go
type ExternalServicesListOptions struct {
	// When specified, only include external services with the given IDs.
	IDs []int64
	// When true, only include external services not under any namespace (i.e. owned
	// by all site admins), and value of NamespaceUserID is ignored.
	NoNamespace bool
	// When specified, only include external services under given user namespace.
	NamespaceUserID int32
	// When specified, only include external services with given list of kinds.
	Kinds []string
	// When specified, only include external services with ID below this number
	// (because we're sorting results by ID in descending order).
	AfterID int64
	// Possible values are ASC or DESC. Defaults to DESC.
	OrderByDirection string
	// When true, will only return services that have the cloud_default flag set to
	// true.
	OnlyCloudDefault bool

	*LimitOffset
}
```

ExternalServicesListOptions contains options for listing external services. 

#### <a id="ExternalServicesListOptions.sqlConditions" href="#ExternalServicesListOptions.sqlConditions">func (o ExternalServicesListOptions) sqlConditions() []*sqlf.Query</a>

```
searchKey: database.ExternalServicesListOptions.sqlConditions
tags: [private]
```

```Go
func (o ExternalServicesListOptions) sqlConditions() []*sqlf.Query
```

### <a id="ValidateExternalServiceConfigOptions" href="#ValidateExternalServiceConfigOptions">type ValidateExternalServiceConfigOptions struct</a>

```
searchKey: database.ValidateExternalServiceConfigOptions
```

```Go
type ValidateExternalServiceConfigOptions struct {
	// The ID of the external service, 0 is a valid value for not-yet-created external service.
	ExternalServiceID int64
	// The kind of external service.
	Kind string
	// The actual config of the external service.
	Config string
	// The list of authN providers configured on the instance.
	AuthProviders []schema.AuthProviders
	// If non zero, indicates the user that owns the external service.
	NamespaceUserID int32
}
```

### <a id="ExternalServiceUpdate" href="#ExternalServiceUpdate">type ExternalServiceUpdate struct</a>

```
searchKey: database.ExternalServiceUpdate
```

```Go
type ExternalServiceUpdate struct {
	DisplayName  *string
	Config       *string
	CloudDefault *bool
}
```

ExternalServiceUpdate contains optional fields to update. 

### <a id="externalServiceNotFoundError" href="#externalServiceNotFoundError">type externalServiceNotFoundError struct</a>

```
searchKey: database.externalServiceNotFoundError
tags: [private]
```

```Go
type externalServiceNotFoundError struct {
	id int64
}
```

#### <a id="externalServiceNotFoundError.Error" href="#externalServiceNotFoundError.Error">func (e externalServiceNotFoundError) Error() string</a>

```
searchKey: database.externalServiceNotFoundError.Error
tags: [private]
```

```Go
func (e externalServiceNotFoundError) Error() string
```

#### <a id="externalServiceNotFoundError.NotFound" href="#externalServiceNotFoundError.NotFound">func (e externalServiceNotFoundError) NotFound() bool</a>

```
searchKey: database.externalServiceNotFoundError.NotFound
tags: [private]
```

```Go
func (e externalServiceNotFoundError) NotFound() bool
```

### <a id="MockExternalServices" href="#MockExternalServices">type MockExternalServices struct</a>

```
searchKey: database.MockExternalServices
```

```Go
type MockExternalServices struct {
	Create           func(ctx context.Context, confGet func() *conf.Unified, externalService *types.ExternalService) error
	Delete           func(ctx context.Context, id int64) error
	GetByID          func(id int64) (*types.ExternalService, error)
	GetLastSyncError func(id int64) (string, error)
	ListSyncErrors   func(ctx context.Context) (map[int64]string, error)
	List             func(opt ExternalServicesListOptions) ([]*types.ExternalService, error)
	Update           func(ctx context.Context, ps []schema.AuthProviders, id int64, update *ExternalServiceUpdate) error
	Count            func(ctx context.Context, opt ExternalServicesListOptions) (int, error)
	Upsert           func(ctx context.Context, services ...*types.ExternalService) error
	Transact         func(ctx context.Context) (*ExternalServiceStore, error)
	Done             func(error) error
}
```

MockExternalServices mocks the external services store. 

### <a id="FeatureFlagStore" href="#FeatureFlagStore">type FeatureFlagStore struct</a>

```
searchKey: database.FeatureFlagStore
```

```Go
type FeatureFlagStore struct {
	*basestore.Store
}
```

#### <a id="FeatureFlags" href="#FeatureFlags">func FeatureFlags(db dbutil.DB) *FeatureFlagStore</a>

```
searchKey: database.FeatureFlags
```

```Go
func FeatureFlags(db dbutil.DB) *FeatureFlagStore
```

#### <a id="FeatureFlagsWith" href="#FeatureFlagsWith">func FeatureFlagsWith(other basestore.ShareableStore) *FeatureFlagStore</a>

```
searchKey: database.FeatureFlagsWith
```

```Go
func FeatureFlagsWith(other basestore.ShareableStore) *FeatureFlagStore
```

#### <a id="FeatureFlagStore.With" href="#FeatureFlagStore.With">func (f *FeatureFlagStore) With(other basestore.ShareableStore) *FeatureFlagStore</a>

```
searchKey: database.FeatureFlagStore.With
```

```Go
func (f *FeatureFlagStore) With(other basestore.ShareableStore) *FeatureFlagStore
```

#### <a id="FeatureFlagStore.Transact" href="#FeatureFlagStore.Transact">func (f *FeatureFlagStore) Transact(ctx context.Context) (*FeatureFlagStore, error)</a>

```
searchKey: database.FeatureFlagStore.Transact
```

```Go
func (f *FeatureFlagStore) Transact(ctx context.Context) (*FeatureFlagStore, error)
```

#### <a id="FeatureFlagStore.CreateFeatureFlag" href="#FeatureFlagStore.CreateFeatureFlag">func (f *FeatureFlagStore) CreateFeatureFlag(ctx context.Context, flag *ff.FeatureFlag) (*ff.FeatureFlag, error)</a>

```
searchKey: database.FeatureFlagStore.CreateFeatureFlag
```

```Go
func (f *FeatureFlagStore) CreateFeatureFlag(ctx context.Context, flag *ff.FeatureFlag) (*ff.FeatureFlag, error)
```

#### <a id="FeatureFlagStore.UpdateFeatureFlag" href="#FeatureFlagStore.UpdateFeatureFlag">func (f *FeatureFlagStore) UpdateFeatureFlag(ctx context.Context, flag *ff.FeatureFlag) (*ff.FeatureFlag, error)</a>

```
searchKey: database.FeatureFlagStore.UpdateFeatureFlag
```

```Go
func (f *FeatureFlagStore) UpdateFeatureFlag(ctx context.Context, flag *ff.FeatureFlag) (*ff.FeatureFlag, error)
```

#### <a id="FeatureFlagStore.DeleteFeatureFlag" href="#FeatureFlagStore.DeleteFeatureFlag">func (f *FeatureFlagStore) DeleteFeatureFlag(ctx context.Context, name string) error</a>

```
searchKey: database.FeatureFlagStore.DeleteFeatureFlag
```

```Go
func (f *FeatureFlagStore) DeleteFeatureFlag(ctx context.Context, name string) error
```

#### <a id="FeatureFlagStore.CreateRollout" href="#FeatureFlagStore.CreateRollout">func (f *FeatureFlagStore) CreateRollout(ctx context.Context, name string, rollout int32) (*ff.FeatureFlag, error)</a>

```
searchKey: database.FeatureFlagStore.CreateRollout
```

```Go
func (f *FeatureFlagStore) CreateRollout(ctx context.Context, name string, rollout int32) (*ff.FeatureFlag, error)
```

#### <a id="FeatureFlagStore.CreateBool" href="#FeatureFlagStore.CreateBool">func (f *FeatureFlagStore) CreateBool(ctx context.Context, name string, value bool) (*ff.FeatureFlag, error)</a>

```
searchKey: database.FeatureFlagStore.CreateBool
```

```Go
func (f *FeatureFlagStore) CreateBool(ctx context.Context, name string, value bool) (*ff.FeatureFlag, error)
```

#### <a id="FeatureFlagStore.GetFeatureFlag" href="#FeatureFlagStore.GetFeatureFlag">func (f *FeatureFlagStore) GetFeatureFlag(ctx context.Context, flagName string) (*ff.FeatureFlag, error)</a>

```
searchKey: database.FeatureFlagStore.GetFeatureFlag
```

```Go
func (f *FeatureFlagStore) GetFeatureFlag(ctx context.Context, flagName string) (*ff.FeatureFlag, error)
```

#### <a id="FeatureFlagStore.GetFeatureFlags" href="#FeatureFlagStore.GetFeatureFlags">func (f *FeatureFlagStore) GetFeatureFlags(ctx context.Context) ([]*ff.FeatureFlag, error)</a>

```
searchKey: database.FeatureFlagStore.GetFeatureFlags
```

```Go
func (f *FeatureFlagStore) GetFeatureFlags(ctx context.Context) ([]*ff.FeatureFlag, error)
```

#### <a id="FeatureFlagStore.CreateOverride" href="#FeatureFlagStore.CreateOverride">func (f *FeatureFlagStore) CreateOverride(ctx context.Context, override *ff.Override) (*ff.Override, error)</a>

```
searchKey: database.FeatureFlagStore.CreateOverride
```

```Go
func (f *FeatureFlagStore) CreateOverride(ctx context.Context, override *ff.Override) (*ff.Override, error)
```

#### <a id="FeatureFlagStore.DeleteOverride" href="#FeatureFlagStore.DeleteOverride">func (f *FeatureFlagStore) DeleteOverride(ctx context.Context, orgID, userID *int32, flagName string) error</a>

```
searchKey: database.FeatureFlagStore.DeleteOverride
```

```Go
func (f *FeatureFlagStore) DeleteOverride(ctx context.Context, orgID, userID *int32, flagName string) error
```

#### <a id="FeatureFlagStore.UpdateOverride" href="#FeatureFlagStore.UpdateOverride">func (f *FeatureFlagStore) UpdateOverride(ctx context.Context, orgID, userID *int32, flagName string, newValue bool) (*ff.Override, error)</a>

```
searchKey: database.FeatureFlagStore.UpdateOverride
```

```Go
func (f *FeatureFlagStore) UpdateOverride(ctx context.Context, orgID, userID *int32, flagName string, newValue bool) (*ff.Override, error)
```

#### <a id="FeatureFlagStore.GetOverridesForFlag" href="#FeatureFlagStore.GetOverridesForFlag">func (f *FeatureFlagStore) GetOverridesForFlag(ctx context.Context, flagName string) ([]*ff.Override, error)</a>

```
searchKey: database.FeatureFlagStore.GetOverridesForFlag
```

```Go
func (f *FeatureFlagStore) GetOverridesForFlag(ctx context.Context, flagName string) ([]*ff.Override, error)
```

#### <a id="FeatureFlagStore.GetUserOverrides" href="#FeatureFlagStore.GetUserOverrides">func (f *FeatureFlagStore) GetUserOverrides(ctx context.Context, userID int32) ([]*ff.Override, error)</a>

```
searchKey: database.FeatureFlagStore.GetUserOverrides
```

```Go
func (f *FeatureFlagStore) GetUserOverrides(ctx context.Context, userID int32) ([]*ff.Override, error)
```

GetUserOverrides lists the overrides that have been specifically set for the given userID. NOTE: this does not return any overrides for the user orgs. Those are returned separately by ListOrgOverridesForUser so they can be mered in proper priority order. 

#### <a id="FeatureFlagStore.GetOrgOverridesForUser" href="#FeatureFlagStore.GetOrgOverridesForUser">func (f *FeatureFlagStore) GetOrgOverridesForUser(ctx context.Context, userID int32) ([]*ff.Override, error)</a>

```
searchKey: database.FeatureFlagStore.GetOrgOverridesForUser
```

```Go
func (f *FeatureFlagStore) GetOrgOverridesForUser(ctx context.Context, userID int32) ([]*ff.Override, error)
```

GetOrgOverridesForUser lists the feature flag overrides for all orgs the given user belongs to. 

#### <a id="FeatureFlagStore.GetUserFlags" href="#FeatureFlagStore.GetUserFlags">func (f *FeatureFlagStore) GetUserFlags(ctx context.Context, userID int32) (map[string]bool, error)</a>

```
searchKey: database.FeatureFlagStore.GetUserFlags
```

```Go
func (f *FeatureFlagStore) GetUserFlags(ctx context.Context, userID int32) (map[string]bool, error)
```

GetUserFlags returns the calculated values for feature flags for the given userID. This should be the primary entrypoint for getting the user flags since it handles retrieving all the flags, the org overrides, and the user overrides, and merges them in priority order. 

#### <a id="FeatureFlagStore.GetAnonymousUserFlags" href="#FeatureFlagStore.GetAnonymousUserFlags">func (f *FeatureFlagStore) GetAnonymousUserFlags(ctx context.Context, anonymousUID string) (map[string]bool, error)</a>

```
searchKey: database.FeatureFlagStore.GetAnonymousUserFlags
```

```Go
func (f *FeatureFlagStore) GetAnonymousUserFlags(ctx context.Context, anonymousUID string) (map[string]bool, error)
```

GetAnonymousUserFlags returns the calculated values for feature flags for the given anonymousUID 

#### <a id="FeatureFlagStore.GetGlobalFeatureFlags" href="#FeatureFlagStore.GetGlobalFeatureFlags">func (f *FeatureFlagStore) GetGlobalFeatureFlags(ctx context.Context) (map[string]bool, error)</a>

```
searchKey: database.FeatureFlagStore.GetGlobalFeatureFlags
```

```Go
func (f *FeatureFlagStore) GetGlobalFeatureFlags(ctx context.Context) (map[string]bool, error)
```

### <a id="rowScanner" href="#rowScanner">type rowScanner interface</a>

```
searchKey: database.rowScanner
tags: [private]
```

```Go
type rowScanner interface {
	Scan(...interface{}) error
}
```

rowScanner is an interface that can scan from either a sql.Row or sql.Rows 

### <a id="GitserverRepoStore" href="#GitserverRepoStore">type GitserverRepoStore struct</a>

```
searchKey: database.GitserverRepoStore
```

```Go
type GitserverRepoStore struct {
	*basestore.Store
}
```

GitserverReposStore is responsible for data stored in the gitserver_repos table. 

#### <a id="GitserverRepos" href="#GitserverRepos">func GitserverRepos(db dbutil.DB) *GitserverRepoStore</a>

```
searchKey: database.GitserverRepos
```

```Go
func GitserverRepos(db dbutil.DB) *GitserverRepoStore
```

GitserverRepos instantiates and returns a new GitserverRepoStore. 

#### <a id="NewGitserverReposWith" href="#NewGitserverReposWith">func NewGitserverReposWith(other basestore.ShareableStore) *GitserverRepoStore</a>

```
searchKey: database.NewGitserverReposWith
```

```Go
func NewGitserverReposWith(other basestore.ShareableStore) *GitserverRepoStore
```

NewGitserverReposWith instantiates and returns a new GitserverRepoStore using the other store handle. 

#### <a id="GitserverRepoStore.With" href="#GitserverRepoStore.With">func (s *GitserverRepoStore) With(other basestore.ShareableStore) *GitserverRepoStore</a>

```
searchKey: database.GitserverRepoStore.With
```

```Go
func (s *GitserverRepoStore) With(other basestore.ShareableStore) *GitserverRepoStore
```

#### <a id="GitserverRepoStore.Transact" href="#GitserverRepoStore.Transact">func (s *GitserverRepoStore) Transact(ctx context.Context) (*GitserverRepoStore, error)</a>

```
searchKey: database.GitserverRepoStore.Transact
```

```Go
func (s *GitserverRepoStore) Transact(ctx context.Context) (*GitserverRepoStore, error)
```

#### <a id="GitserverRepoStore.Upsert" href="#GitserverRepoStore.Upsert">func (s *GitserverRepoStore) Upsert(ctx context.Context, repos ...*types.GitserverRepo) error</a>

```
searchKey: database.GitserverRepoStore.Upsert
```

```Go
func (s *GitserverRepoStore) Upsert(ctx context.Context, repos ...*types.GitserverRepo) error
```

Upsert adds a row representing the GitServer status of a repo 

#### <a id="GitserverRepoStore.IterateRepoGitserverStatus" href="#GitserverRepoStore.IterateRepoGitserverStatus">func (s *GitserverRepoStore) IterateRepoGitserverStatus(ctx context.Context, repoFn func(repo types.RepoGitserverStatus) error) error</a>

```
searchKey: database.GitserverRepoStore.IterateRepoGitserverStatus
```

```Go
func (s *GitserverRepoStore) IterateRepoGitserverStatus(ctx context.Context, repoFn func(repo types.RepoGitserverStatus) error) error
```

IterateRepoGitserverStatus iterates over the status of all repos by joining our repo and gitserver_repos table. It is possible for us not to have a corresponding row in gitserver_repos yet. repoFn will be called once for each row. If it returns an error we'll abort iteration. 

#### <a id="GitserverRepoStore.GetByID" href="#GitserverRepoStore.GetByID">func (s *GitserverRepoStore) GetByID(ctx context.Context, id api.RepoID) (*types.GitserverRepo, error)</a>

```
searchKey: database.GitserverRepoStore.GetByID
```

```Go
func (s *GitserverRepoStore) GetByID(ctx context.Context, id api.RepoID) (*types.GitserverRepo, error)
```

#### <a id="GitserverRepoStore.SetCloneStatus" href="#GitserverRepoStore.SetCloneStatus">func (s *GitserverRepoStore) SetCloneStatus(ctx context.Context, id api.RepoID, status types.CloneStatus, shardID string) error</a>

```
searchKey: database.GitserverRepoStore.SetCloneStatus
```

```Go
func (s *GitserverRepoStore) SetCloneStatus(ctx context.Context, id api.RepoID, status types.CloneStatus, shardID string) error
```

SetCloneStatus will attempt to update ONLY the clone status of a GitServerRepo. If a matching row does not yet exist a new one will be created. If the status value hasn't changed, the row will not be updated. 

#### <a id="GitserverRepoStore.SetLastError" href="#GitserverRepoStore.SetLastError">func (s *GitserverRepoStore) SetLastError(ctx context.Context, id api.RepoID, error, shardID string) error</a>

```
searchKey: database.GitserverRepoStore.SetLastError
```

```Go
func (s *GitserverRepoStore) SetLastError(ctx context.Context, id api.RepoID, error, shardID string) error
```

SetLastError will attempt to update ONLY the last error of a GitServerRepo. If a matching row does not yet exist a new one will be created. If the error value hasn't changed, the row will not be updated. 

### <a id="LimitOffset" href="#LimitOffset">type LimitOffset struct</a>

```
searchKey: database.LimitOffset
```

```Go
type LimitOffset struct {
	Limit  int // SQL LIMIT count
	Offset int // SQL OFFSET count
}
```

LimitOffset specifies SQL LIMIT and OFFSET counts. A pointer to it is typically embedded in other options structs that need to perform SQL queries with LIMIT and OFFSET. 

#### <a id="LimitOffset.SQL" href="#LimitOffset.SQL">func (o *LimitOffset) SQL() *sqlf.Query</a>

```
searchKey: database.LimitOffset.SQL
```

```Go
func (o *LimitOffset) SQL() *sqlf.Query
```

SQL returns the SQL query fragment ("LIMIT %d OFFSET %d") for use in SQL queries. 

### <a id="MockStores" href="#MockStores">type MockStores struct</a>

```
searchKey: database.MockStores
```

```Go
type MockStores struct {
	AccessTokens MockAccessTokens

	Repos           MockRepos
	Namespaces      MockNamespaces
	Orgs            MockOrgs
	OrgMembers      MockOrgMembers
	SavedSearches   MockSavedSearches
	Settings        MockSettings
	Users           MockUsers
	UserCredentials MockUserCredentials
	UserEmails      MockUserEmails
	UserPublicRepos MockUserPublicRepos
	SearchContexts  MockSearchContexts

	Phabricator MockPhabricator

	ExternalAccounts MockExternalAccounts

	OrgInvitations MockOrgInvitations

	ExternalServices MockExternalServices

	Authz MockAuthz

	EventLogs MockEventLogs
}
```

MockStores has a field for each store interface with the concrete mock type (to obviate the need for tedious type assertions in test code). 

### <a id="Namespace" href="#Namespace">type Namespace struct</a>

```
searchKey: database.Namespace
```

```Go
type Namespace struct {
	// Name is the canonical-case name of the namespace (which is unique among all namespace
	// types). For a user, this is the username. For an organization, this is the organization name.
	Name string

	User, Organization int32 // exactly 1 is non-zero
}
```

A Namespace is a username or an organization name. No user may have a username that is equal to an organization name, and vice versa. This property means that a username or organization name serves as a namespace for other objects that are owned by the user or organization, such as batch changes and extensions. 

### <a id="NamespaceStore" href="#NamespaceStore">type NamespaceStore struct</a>

```
searchKey: database.NamespaceStore
```

```Go
type NamespaceStore struct {
	*basestore.Store
}
```

#### <a id="Namespaces" href="#Namespaces">func Namespaces(db dbutil.DB) *NamespaceStore</a>

```
searchKey: database.Namespaces
```

```Go
func Namespaces(db dbutil.DB) *NamespaceStore
```

Namespaces instantiates and returns a new NamespaceStore with prepared statements. 

#### <a id="NamespacesWith" href="#NamespacesWith">func NamespacesWith(other basestore.ShareableStore) *NamespaceStore</a>

```
searchKey: database.NamespacesWith
```

```Go
func NamespacesWith(other basestore.ShareableStore) *NamespaceStore
```

NewNamespaceStoreWithDB instantiates and returns a new NamespaceStore using the other store handle. 

#### <a id="NamespaceStore.With" href="#NamespaceStore.With">func (s *NamespaceStore) With(other basestore.ShareableStore) *NamespaceStore</a>

```
searchKey: database.NamespaceStore.With
```

```Go
func (s *NamespaceStore) With(other basestore.ShareableStore) *NamespaceStore
```

#### <a id="NamespaceStore.Transact" href="#NamespaceStore.Transact">func (s *NamespaceStore) Transact(ctx context.Context) (*NamespaceStore, error)</a>

```
searchKey: database.NamespaceStore.Transact
```

```Go
func (s *NamespaceStore) Transact(ctx context.Context) (*NamespaceStore, error)
```

#### <a id="NamespaceStore.GetByID" href="#NamespaceStore.GetByID">func (s *NamespaceStore) GetByID(ctx context.Context,...</a>

```
searchKey: database.NamespaceStore.GetByID
```

```Go
func (s *NamespaceStore) GetByID(
	ctx context.Context,
	orgID, userID int32,
) (*Namespace, error)
```

GetByID looks up the namespace by an ID. 

One of orgID and userID must be 0: whichever ID is non-zero will be used to look up the namespace. If both are given, ErrNamespaceMultipleIDs is returned; if neither are given, ErrNamespaceNoID is returned. 

If no namespace is found, ErrNamespaceNotFound is returned. 

#### <a id="NamespaceStore.GetByName" href="#NamespaceStore.GetByName">func (s *NamespaceStore) GetByName(ctx context.Context,...</a>

```
searchKey: database.NamespaceStore.GetByName
```

```Go
func (s *NamespaceStore) GetByName(
	ctx context.Context,
	name string,
) (*Namespace, error)
```

GetByName looks up the namespace by a name. The name is matched case-insensitively against all namespaces, which is the set of usernames and organization names. 

If no namespace is found, ErrNamespaceNotFound is returned. 

#### <a id="NamespaceStore.getNamespace" href="#NamespaceStore.getNamespace">func (s *NamespaceStore) getNamespace(ctx context.Context, n *Namespace, preds []*sqlf.Query) error</a>

```
searchKey: database.NamespaceStore.getNamespace
tags: [private]
```

```Go
func (s *NamespaceStore) getNamespace(ctx context.Context, n *Namespace, preds []*sqlf.Query) error
```

### <a id="MockNamespaces" href="#MockNamespaces">type MockNamespaces struct</a>

```
searchKey: database.MockNamespaces
```

```Go
type MockNamespaces struct {
	GetByID   func(ctx context.Context, orgID, userID int32) (*Namespace, error)
	GetByName func(ctx context.Context, name string) (*Namespace, error)
}
```

### <a id="ExternalServiceConfigMigrator" href="#ExternalServiceConfigMigrator">type ExternalServiceConfigMigrator struct</a>

```
searchKey: database.ExternalServiceConfigMigrator
```

```Go
type ExternalServiceConfigMigrator struct {
	store        *basestore.Store
	BatchSize    int
	AllowDecrypt bool
}
```

ExternalServiceConfigMigrator is a background job that encrypts external services config on startup. It periodically waits until a keyring is configured to determine how many services it must migrate. Scheduling and progress report is deleguated to the out of band migration package. The migration is non destructive and can be reverted. 

#### <a id="NewExternalServiceConfigMigrator" href="#NewExternalServiceConfigMigrator">func NewExternalServiceConfigMigrator(store *basestore.Store) *ExternalServiceConfigMigrator</a>

```
searchKey: database.NewExternalServiceConfigMigrator
```

```Go
func NewExternalServiceConfigMigrator(store *basestore.Store) *ExternalServiceConfigMigrator
```

#### <a id="NewExternalServiceConfigMigratorWithDB" href="#NewExternalServiceConfigMigratorWithDB">func NewExternalServiceConfigMigratorWithDB(db dbutil.DB) *ExternalServiceConfigMigrator</a>

```
searchKey: database.NewExternalServiceConfigMigratorWithDB
```

```Go
func NewExternalServiceConfigMigratorWithDB(db dbutil.DB) *ExternalServiceConfigMigrator
```

#### <a id="ExternalServiceConfigMigrator.ID" href="#ExternalServiceConfigMigrator.ID">func (m *ExternalServiceConfigMigrator) ID() int</a>

```
searchKey: database.ExternalServiceConfigMigrator.ID
```

```Go
func (m *ExternalServiceConfigMigrator) ID() int
```

ID of the migration row in in the out_of_band_migrations table. This ID was defined arbitrarily in this migration file: frontend/1528395802_external_service_config_migration.up.sql. 

#### <a id="ExternalServiceConfigMigrator.Progress" href="#ExternalServiceConfigMigrator.Progress">func (m *ExternalServiceConfigMigrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: database.ExternalServiceConfigMigrator.Progress
```

```Go
func (m *ExternalServiceConfigMigrator) Progress(ctx context.Context) (float64, error)
```

Progress returns a value from 0 to 1 representing the percentage of configuration already migrated. 

#### <a id="ExternalServiceConfigMigrator.Up" href="#ExternalServiceConfigMigrator.Up">func (m *ExternalServiceConfigMigrator) Up(ctx context.Context) (err error)</a>

```
searchKey: database.ExternalServiceConfigMigrator.Up
```

```Go
func (m *ExternalServiceConfigMigrator) Up(ctx context.Context) (err error)
```

Up loads BatchSize external services, locks them, and encrypts their config using the key returned by keyring.Default(). If there is no ring, it will periodically try again until the key is setup in the config. Up ensures the configuration can be decrypted with the same key before overwitting it. The key id is stored alongside the encrypted configuration. 

#### <a id="ExternalServiceConfigMigrator.Down" href="#ExternalServiceConfigMigrator.Down">func (m *ExternalServiceConfigMigrator) Down(ctx context.Context) (err error)</a>

```
searchKey: database.ExternalServiceConfigMigrator.Down
```

```Go
func (m *ExternalServiceConfigMigrator) Down(ctx context.Context) (err error)
```

#### <a id="ExternalServiceConfigMigrator.listConfigsForUpdate" href="#ExternalServiceConfigMigrator.listConfigsForUpdate">func (m *ExternalServiceConfigMigrator) listConfigsForUpdate(ctx context.Context, tx *basestore.Store, encrypted bool) ([]*types.ExternalService, error)</a>

```
searchKey: database.ExternalServiceConfigMigrator.listConfigsForUpdate
tags: [private]
```

```Go
func (m *ExternalServiceConfigMigrator) listConfigsForUpdate(ctx context.Context, tx *basestore.Store, encrypted bool) ([]*types.ExternalService, error)
```

### <a id="ExternalAccountsMigrator" href="#ExternalAccountsMigrator">type ExternalAccountsMigrator struct</a>

```
searchKey: database.ExternalAccountsMigrator
```

```Go
type ExternalAccountsMigrator struct {
	store        *basestore.Store
	BatchSize    int
	AllowDecrypt bool
}
```

ExternalAccountsMigrator is a background job that encrypts external accounts data on startup. It periodically waits until a keyring is configured to determine how many services it must migrate. Scheduling and progress report is delegated to the out of band migration package. The migration is non destructive and can be reverted. 

#### <a id="NewExternalAccountsMigrator" href="#NewExternalAccountsMigrator">func NewExternalAccountsMigrator(store *basestore.Store) *ExternalAccountsMigrator</a>

```
searchKey: database.NewExternalAccountsMigrator
```

```Go
func NewExternalAccountsMigrator(store *basestore.Store) *ExternalAccountsMigrator
```

#### <a id="NewExternalAccountsMigratorWithDB" href="#NewExternalAccountsMigratorWithDB">func NewExternalAccountsMigratorWithDB(db dbutil.DB) *ExternalAccountsMigrator</a>

```
searchKey: database.NewExternalAccountsMigratorWithDB
```

```Go
func NewExternalAccountsMigratorWithDB(db dbutil.DB) *ExternalAccountsMigrator
```

#### <a id="ExternalAccountsMigrator.ID" href="#ExternalAccountsMigrator.ID">func (m *ExternalAccountsMigrator) ID() int</a>

```
searchKey: database.ExternalAccountsMigrator.ID
```

```Go
func (m *ExternalAccountsMigrator) ID() int
```

ID of the migration row in the out_of_band_migrations table. This ID was defined arbitrarily in this migration file: frontend/1528395809_external_account_migration.up.sql 

#### <a id="ExternalAccountsMigrator.Progress" href="#ExternalAccountsMigrator.Progress">func (m *ExternalAccountsMigrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: database.ExternalAccountsMigrator.Progress
```

```Go
func (m *ExternalAccountsMigrator) Progress(ctx context.Context) (float64, error)
```

Progress returns a value from 0 to 1 representing the percentage of configuration already migrated. 

#### <a id="ExternalAccountsMigrator.Up" href="#ExternalAccountsMigrator.Up">func (m *ExternalAccountsMigrator) Up(ctx context.Context) (err error)</a>

```
searchKey: database.ExternalAccountsMigrator.Up
```

```Go
func (m *ExternalAccountsMigrator) Up(ctx context.Context) (err error)
```

Up loads BatchSize external accounts, locks them, and encrypts their config using the key returned by keyring.Default(). If there is no ring, it will periodically try again until the key is setup in the config. Up ensures the configuration can be decrypted with the same key before overwitting it. The key id is stored alongside the encrypted configuration. 

#### <a id="ExternalAccountsMigrator.Down" href="#ExternalAccountsMigrator.Down">func (m *ExternalAccountsMigrator) Down(ctx context.Context) (err error)</a>

```
searchKey: database.ExternalAccountsMigrator.Down
```

```Go
func (m *ExternalAccountsMigrator) Down(ctx context.Context) (err error)
```

### <a id="OrgInvitation" href="#OrgInvitation">type OrgInvitation struct</a>

```
searchKey: database.OrgInvitation
```

```Go
type OrgInvitation struct {
	ID              int64
	OrgID           int32
	SenderUserID    int32 // the sender of the invitation
	RecipientUserID int32 // the recipient of the invitation
	CreatedAt       time.Time
	NotifiedAt      *time.Time
	RespondedAt     *time.Time
	ResponseType    *bool // accepted (true), rejected (false), no response (nil)
	RevokedAt       *time.Time
}
```

An OrgInvitation is an invitation for a user to join an organization as a member. 

#### <a id="OrgInvitation.Pending" href="#OrgInvitation.Pending">func (oi *OrgInvitation) Pending() bool</a>

```
searchKey: database.OrgInvitation.Pending
```

```Go
func (oi *OrgInvitation) Pending() bool
```

Pending reports whether the invitation is pending (i.e., can be responded to by the recipient because it has not been revoked or responded to yet). 

### <a id="OrgInvitationStore" href="#OrgInvitationStore">type OrgInvitationStore struct</a>

```
searchKey: database.OrgInvitationStore
```

```Go
type OrgInvitationStore struct {
	*basestore.Store
}
```

#### <a id="OrgInvitations" href="#OrgInvitations">func OrgInvitations(db dbutil.DB) *OrgInvitationStore</a>

```
searchKey: database.OrgInvitations
```

```Go
func OrgInvitations(db dbutil.DB) *OrgInvitationStore
```

OrgInvitations instantiates and returns a new OrgInvitationStore with prepared statements. 

#### <a id="OrgInvitationsWith" href="#OrgInvitationsWith">func OrgInvitationsWith(other basestore.ShareableStore) *OrgInvitationStore</a>

```
searchKey: database.OrgInvitationsWith
```

```Go
func OrgInvitationsWith(other basestore.ShareableStore) *OrgInvitationStore
```

NewOrgInvitationStoreWithDB instantiates and returns a new OrgInvitationStore using the other store handle. 

#### <a id="OrgInvitationStore.With" href="#OrgInvitationStore.With">func (s *OrgInvitationStore) With(other basestore.ShareableStore) *OrgInvitationStore</a>

```
searchKey: database.OrgInvitationStore.With
```

```Go
func (s *OrgInvitationStore) With(other basestore.ShareableStore) *OrgInvitationStore
```

#### <a id="OrgInvitationStore.Transact" href="#OrgInvitationStore.Transact">func (s *OrgInvitationStore) Transact(ctx context.Context) (*OrgInvitationStore, error)</a>

```
searchKey: database.OrgInvitationStore.Transact
```

```Go
func (s *OrgInvitationStore) Transact(ctx context.Context) (*OrgInvitationStore, error)
```

#### <a id="OrgInvitationStore.Create" href="#OrgInvitationStore.Create">func (s *OrgInvitationStore) Create(ctx context.Context, orgID, senderUserID, recipientUserID int32) (*OrgInvitation, error)</a>

```
searchKey: database.OrgInvitationStore.Create
```

```Go
func (s *OrgInvitationStore) Create(ctx context.Context, orgID, senderUserID, recipientUserID int32) (*OrgInvitation, error)
```

#### <a id="OrgInvitationStore.GetByID" href="#OrgInvitationStore.GetByID">func (s *OrgInvitationStore) GetByID(ctx context.Context, id int64) (*OrgInvitation, error)</a>

```
searchKey: database.OrgInvitationStore.GetByID
```

```Go
func (s *OrgInvitationStore) GetByID(ctx context.Context, id int64) (*OrgInvitation, error)
```

GetByID retrieves the org invitation (if any) given its ID. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this org invitation. 

#### <a id="OrgInvitationStore.GetPending" href="#OrgInvitationStore.GetPending">func (s *OrgInvitationStore) GetPending(ctx context.Context, orgID, recipientUserID int32) (*OrgInvitation, error)</a>

```
searchKey: database.OrgInvitationStore.GetPending
```

```Go
func (s *OrgInvitationStore) GetPending(ctx context.Context, orgID, recipientUserID int32) (*OrgInvitation, error)
```

GetPending retrieves the pending invitation (if any) for the recipient to join the org. At most one invitation may be pending for an (org,recipient). 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this org invitation. 

#### <a id="OrgInvitationStore.List" href="#OrgInvitationStore.List">func (s *OrgInvitationStore) List(ctx context.Context, opt OrgInvitationsListOptions) ([]*OrgInvitation, error)</a>

```
searchKey: database.OrgInvitationStore.List
```

```Go
func (s *OrgInvitationStore) List(ctx context.Context, opt OrgInvitationsListOptions) ([]*OrgInvitation, error)
```

List lists all access tokens that satisfy the options. 

🚨 SECURITY: The caller must ensure that the actor is permitted to list with the specified options. 

#### <a id="OrgInvitationStore.list" href="#OrgInvitationStore.list">func (s *OrgInvitationStore) list(ctx context.Context, conds []*sqlf.Query, limitOffset *LimitOffset) ([]*OrgInvitation, error)</a>

```
searchKey: database.OrgInvitationStore.list
tags: [private]
```

```Go
func (s *OrgInvitationStore) list(ctx context.Context, conds []*sqlf.Query, limitOffset *LimitOffset) ([]*OrgInvitation, error)
```

#### <a id="OrgInvitationStore.Count" href="#OrgInvitationStore.Count">func (s *OrgInvitationStore) Count(ctx context.Context, opt OrgInvitationsListOptions) (int, error)</a>

```
searchKey: database.OrgInvitationStore.Count
```

```Go
func (s *OrgInvitationStore) Count(ctx context.Context, opt OrgInvitationsListOptions) (int, error)
```

Count counts all org invitations that satisfy the options (ignoring limit and offset). 

🚨 SECURITY: The caller must ensure that the actor is permitted to count the invitations. 

#### <a id="OrgInvitationStore.UpdateEmailSentTimestamp" href="#OrgInvitationStore.UpdateEmailSentTimestamp">func (s *OrgInvitationStore) UpdateEmailSentTimestamp(ctx context.Context, id int64) error</a>

```
searchKey: database.OrgInvitationStore.UpdateEmailSentTimestamp
```

```Go
func (s *OrgInvitationStore) UpdateEmailSentTimestamp(ctx context.Context, id int64) error
```

UpdateEmailSentTimestamp updates the email-sent timestam[ for the org invitation to the current time. 

#### <a id="OrgInvitationStore.Respond" href="#OrgInvitationStore.Respond">func (s *OrgInvitationStore) Respond(ctx context.Context, id int64, recipientUserID int32, accept bool) (orgID int32, err error)</a>

```
searchKey: database.OrgInvitationStore.Respond
```

```Go
func (s *OrgInvitationStore) Respond(ctx context.Context, id int64, recipientUserID int32, accept bool) (orgID int32, err error)
```

Respond sets the recipient's response to the org invitation and returns the organization's ID to which the recipient was invited. If the recipient user ID given is incorrect, an OrgInvitationNotFoundError error is returned. 

#### <a id="OrgInvitationStore.Revoke" href="#OrgInvitationStore.Revoke">func (s *OrgInvitationStore) Revoke(ctx context.Context, id int64) error</a>

```
searchKey: database.OrgInvitationStore.Revoke
```

```Go
func (s *OrgInvitationStore) Revoke(ctx context.Context, id int64) error
```

Revoke marks an org invitation as revoked. The recipient is forbidden from responding to it after it has been revoked. 

### <a id="OrgInvitationNotFoundError" href="#OrgInvitationNotFoundError">type OrgInvitationNotFoundError struct</a>

```
searchKey: database.OrgInvitationNotFoundError
```

```Go
type OrgInvitationNotFoundError struct {
	args []interface{}
}
```

OrgInvitationNotFoundError occurs when an org invitation is not found. 

#### <a id="OrgInvitationNotFoundError.NotFound" href="#OrgInvitationNotFoundError.NotFound">func (err OrgInvitationNotFoundError) NotFound() bool</a>

```
searchKey: database.OrgInvitationNotFoundError.NotFound
```

```Go
func (err OrgInvitationNotFoundError) NotFound() bool
```

NotFound implements errcode.NotFounder. 

#### <a id="OrgInvitationNotFoundError.Error" href="#OrgInvitationNotFoundError.Error">func (err OrgInvitationNotFoundError) Error() string</a>

```
searchKey: database.OrgInvitationNotFoundError.Error
```

```Go
func (err OrgInvitationNotFoundError) Error() string
```

### <a id="OrgInvitationsListOptions" href="#OrgInvitationsListOptions">type OrgInvitationsListOptions struct</a>

```
searchKey: database.OrgInvitationsListOptions
```

```Go
type OrgInvitationsListOptions struct {
	OrgID           int32 // only list org invitations for this org
	RecipientUserID int32 // only list org invitations with this user as the recipient
	*LimitOffset
}
```

OrgInvitationsListOptions contains options for listing org invitations. 

#### <a id="OrgInvitationsListOptions.sqlConditions" href="#OrgInvitationsListOptions.sqlConditions">func (o OrgInvitationsListOptions) sqlConditions() []*sqlf.Query</a>

```
searchKey: database.OrgInvitationsListOptions.sqlConditions
tags: [private]
```

```Go
func (o OrgInvitationsListOptions) sqlConditions() []*sqlf.Query
```

### <a id="MockOrgInvitations" href="#MockOrgInvitations">type MockOrgInvitations struct</a>

```
searchKey: database.MockOrgInvitations
```

```Go
type MockOrgInvitations struct {
	Create  func(orgID, senderUserID, recipientUserID int32) (*OrgInvitation, error)
	GetByID func(id int64) (*OrgInvitation, error)
	Revoke  func(id int64) error
}
```

MockOrgInvitations mocks the org invitations store. 

### <a id="OrgMemberStore" href="#OrgMemberStore">type OrgMemberStore struct</a>

```
searchKey: database.OrgMemberStore
```

```Go
type OrgMemberStore struct {
	*basestore.Store
}
```

#### <a id="OrgMembers" href="#OrgMembers">func OrgMembers(db dbutil.DB) *OrgMemberStore</a>

```
searchKey: database.OrgMembers
```

```Go
func OrgMembers(db dbutil.DB) *OrgMemberStore
```

OrgMembers instantiates and returns a new OrgMemberStore with prepared statements. 

#### <a id="OrgMembersWith" href="#OrgMembersWith">func OrgMembersWith(other basestore.ShareableStore) *OrgMemberStore</a>

```
searchKey: database.OrgMembersWith
```

```Go
func OrgMembersWith(other basestore.ShareableStore) *OrgMemberStore
```

NewOrgMemberStoreWithDB instantiates and returns a new OrgMemberStore using the other store handle. 

#### <a id="OrgMemberStore.With" href="#OrgMemberStore.With">func (s *OrgMemberStore) With(other basestore.ShareableStore) *OrgMemberStore</a>

```
searchKey: database.OrgMemberStore.With
```

```Go
func (s *OrgMemberStore) With(other basestore.ShareableStore) *OrgMemberStore
```

#### <a id="OrgMemberStore.Transact" href="#OrgMemberStore.Transact">func (m *OrgMemberStore) Transact(ctx context.Context) (*OrgMemberStore, error)</a>

```
searchKey: database.OrgMemberStore.Transact
```

```Go
func (m *OrgMemberStore) Transact(ctx context.Context) (*OrgMemberStore, error)
```

#### <a id="OrgMemberStore.Create" href="#OrgMemberStore.Create">func (m *OrgMemberStore) Create(ctx context.Context, orgID, userID int32) (*types.OrgMembership, error)</a>

```
searchKey: database.OrgMemberStore.Create
```

```Go
func (m *OrgMemberStore) Create(ctx context.Context, orgID, userID int32) (*types.OrgMembership, error)
```

#### <a id="OrgMemberStore.GetByUserID" href="#OrgMemberStore.GetByUserID">func (m *OrgMemberStore) GetByUserID(ctx context.Context, userID int32) ([]*types.OrgMembership, error)</a>

```
searchKey: database.OrgMemberStore.GetByUserID
```

```Go
func (m *OrgMemberStore) GetByUserID(ctx context.Context, userID int32) ([]*types.OrgMembership, error)
```

#### <a id="OrgMemberStore.GetByOrgIDAndUserID" href="#OrgMemberStore.GetByOrgIDAndUserID">func (m *OrgMemberStore) GetByOrgIDAndUserID(ctx context.Context, orgID, userID int32) (*types.OrgMembership, error)</a>

```
searchKey: database.OrgMemberStore.GetByOrgIDAndUserID
```

```Go
func (m *OrgMemberStore) GetByOrgIDAndUserID(ctx context.Context, orgID, userID int32) (*types.OrgMembership, error)
```

#### <a id="OrgMemberStore.Remove" href="#OrgMemberStore.Remove">func (m *OrgMemberStore) Remove(ctx context.Context, orgID, userID int32) error</a>

```
searchKey: database.OrgMemberStore.Remove
```

```Go
func (m *OrgMemberStore) Remove(ctx context.Context, orgID, userID int32) error
```

#### <a id="OrgMemberStore.GetByOrgID" href="#OrgMemberStore.GetByOrgID">func (m *OrgMemberStore) GetByOrgID(ctx context.Context, orgID int32) ([]*types.OrgMembership, error)</a>

```
searchKey: database.OrgMemberStore.GetByOrgID
```

```Go
func (m *OrgMemberStore) GetByOrgID(ctx context.Context, orgID int32) ([]*types.OrgMembership, error)
```

GetByOrgID returns a list of all members of a given organization. 

#### <a id="OrgMemberStore.getOneBySQL" href="#OrgMemberStore.getOneBySQL">func (m *OrgMemberStore) getOneBySQL(ctx context.Context, query string, args ...interface{}) (*types.OrgMembership, error)</a>

```
searchKey: database.OrgMemberStore.getOneBySQL
tags: [private]
```

```Go
func (m *OrgMemberStore) getOneBySQL(ctx context.Context, query string, args ...interface{}) (*types.OrgMembership, error)
```

#### <a id="OrgMemberStore.getBySQL" href="#OrgMemberStore.getBySQL">func (m *OrgMemberStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.OrgMembership, error)</a>

```
searchKey: database.OrgMemberStore.getBySQL
tags: [private]
```

```Go
func (m *OrgMemberStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.OrgMembership, error)
```

#### <a id="OrgMemberStore.CreateMembershipInOrgsForAllUsers" href="#OrgMemberStore.CreateMembershipInOrgsForAllUsers">func (m *OrgMemberStore) CreateMembershipInOrgsForAllUsers(ctx context.Context, orgNames []string) error</a>

```
searchKey: database.OrgMemberStore.CreateMembershipInOrgsForAllUsers
```

```Go
func (m *OrgMemberStore) CreateMembershipInOrgsForAllUsers(ctx context.Context, orgNames []string) error
```

CreateMembershipInOrgsForAllUsers causes *ALL* users to become members of every org in the orgNames list. 

### <a id="ErrOrgMemberNotFound" href="#ErrOrgMemberNotFound">type ErrOrgMemberNotFound struct</a>

```
searchKey: database.ErrOrgMemberNotFound
```

```Go
type ErrOrgMemberNotFound struct {
	args []interface{}
}
```

ErrOrgMemberNotFound is the error that is returned when a user is not in an org. 

#### <a id="ErrOrgMemberNotFound.Error" href="#ErrOrgMemberNotFound.Error">func (err *ErrOrgMemberNotFound) Error() string</a>

```
searchKey: database.ErrOrgMemberNotFound.Error
```

```Go
func (err *ErrOrgMemberNotFound) Error() string
```

#### <a id="ErrOrgMemberNotFound.NotFound" href="#ErrOrgMemberNotFound.NotFound">func (ErrOrgMemberNotFound) NotFound() bool</a>

```
searchKey: database.ErrOrgMemberNotFound.NotFound
```

```Go
func (ErrOrgMemberNotFound) NotFound() bool
```

### <a id="MockOrgMembers" href="#MockOrgMembers">type MockOrgMembers struct</a>

```
searchKey: database.MockOrgMembers
```

```Go
type MockOrgMembers struct {
	GetByOrgIDAndUserID func(ctx context.Context, orgID, userID int32) (*types.OrgMembership, error)
}
```

#### <a id="MockOrgMembers.MockGetByOrgIDAndUserID_Return" href="#MockOrgMembers.MockGetByOrgIDAndUserID_Return">func (s *MockOrgMembers) MockGetByOrgIDAndUserID_Return(t *testing.T, returns *types.OrgMembership, returnsErr error) (called *bool)</a>

```
searchKey: database.MockOrgMembers.MockGetByOrgIDAndUserID_Return
```

```Go
func (s *MockOrgMembers) MockGetByOrgIDAndUserID_Return(t *testing.T, returns *types.OrgMembership, returnsErr error) (called *bool)
```

### <a id="OrgNotFoundError" href="#OrgNotFoundError">type OrgNotFoundError struct</a>

```
searchKey: database.OrgNotFoundError
```

```Go
type OrgNotFoundError struct {
	Message string
}
```

OrgNotFoundError occurs when an organization is not found. 

#### <a id="OrgNotFoundError.Error" href="#OrgNotFoundError.Error">func (e *OrgNotFoundError) Error() string</a>

```
searchKey: database.OrgNotFoundError.Error
```

```Go
func (e *OrgNotFoundError) Error() string
```

#### <a id="OrgNotFoundError.NotFound" href="#OrgNotFoundError.NotFound">func (e *OrgNotFoundError) NotFound() bool</a>

```
searchKey: database.OrgNotFoundError.NotFound
```

```Go
func (e *OrgNotFoundError) NotFound() bool
```

### <a id="OrgStore" href="#OrgStore">type OrgStore struct</a>

```
searchKey: database.OrgStore
```

```Go
type OrgStore struct {
	*basestore.Store
}
```

#### <a id="Orgs" href="#Orgs">func Orgs(db dbutil.DB) *OrgStore</a>

```
searchKey: database.Orgs
```

```Go
func Orgs(db dbutil.DB) *OrgStore
```

Orgs instantiates and returns a new OrgStore with prepared statements. 

#### <a id="OrgsWith" href="#OrgsWith">func OrgsWith(other basestore.ShareableStore) *OrgStore</a>

```
searchKey: database.OrgsWith
```

```Go
func OrgsWith(other basestore.ShareableStore) *OrgStore
```

NewOrgStoreWithDB instantiates and returns a new OrgStore using the other store handle. 

#### <a id="OrgStore.With" href="#OrgStore.With">func (o *OrgStore) With(other basestore.ShareableStore) *OrgStore</a>

```
searchKey: database.OrgStore.With
```

```Go
func (o *OrgStore) With(other basestore.ShareableStore) *OrgStore
```

#### <a id="OrgStore.Transact" href="#OrgStore.Transact">func (o *OrgStore) Transact(ctx context.Context) (*OrgStore, error)</a>

```
searchKey: database.OrgStore.Transact
```

```Go
func (o *OrgStore) Transact(ctx context.Context) (*OrgStore, error)
```

#### <a id="OrgStore.GetByUserID" href="#OrgStore.GetByUserID">func (o *OrgStore) GetByUserID(ctx context.Context, userID int32) ([]*types.Org, error)</a>

```
searchKey: database.OrgStore.GetByUserID
```

```Go
func (o *OrgStore) GetByUserID(ctx context.Context, userID int32) ([]*types.Org, error)
```

GetByUserID returns a list of all organizations for the user. An empty slice is returned if the user is not authenticated or is not a member of any org. 

#### <a id="OrgStore.GetByID" href="#OrgStore.GetByID">func (o *OrgStore) GetByID(ctx context.Context, orgID int32) (*types.Org, error)</a>

```
searchKey: database.OrgStore.GetByID
```

```Go
func (o *OrgStore) GetByID(ctx context.Context, orgID int32) (*types.Org, error)
```

#### <a id="OrgStore.GetByName" href="#OrgStore.GetByName">func (o *OrgStore) GetByName(ctx context.Context, name string) (*types.Org, error)</a>

```
searchKey: database.OrgStore.GetByName
```

```Go
func (o *OrgStore) GetByName(ctx context.Context, name string) (*types.Org, error)
```

#### <a id="OrgStore.Count" href="#OrgStore.Count">func (o *OrgStore) Count(ctx context.Context, opt OrgsListOptions) (int, error)</a>

```
searchKey: database.OrgStore.Count
```

```Go
func (o *OrgStore) Count(ctx context.Context, opt OrgsListOptions) (int, error)
```

#### <a id="OrgStore.List" href="#OrgStore.List">func (o *OrgStore) List(ctx context.Context, opt *OrgsListOptions) ([]*types.Org, error)</a>

```
searchKey: database.OrgStore.List
```

```Go
func (o *OrgStore) List(ctx context.Context, opt *OrgsListOptions) ([]*types.Org, error)
```

#### <a id="OrgStore.listSQL" href="#OrgStore.listSQL">func (*OrgStore) listSQL(opt OrgsListOptions) *sqlf.Query</a>

```
searchKey: database.OrgStore.listSQL
tags: [private]
```

```Go
func (*OrgStore) listSQL(opt OrgsListOptions) *sqlf.Query
```

#### <a id="OrgStore.getBySQL" href="#OrgStore.getBySQL">func (o *OrgStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.Org, error)</a>

```
searchKey: database.OrgStore.getBySQL
tags: [private]
```

```Go
func (o *OrgStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.Org, error)
```

#### <a id="OrgStore.Create" href="#OrgStore.Create">func (o *OrgStore) Create(ctx context.Context, name string, displayName *string) (newOrg *types.Org, err error)</a>

```
searchKey: database.OrgStore.Create
```

```Go
func (o *OrgStore) Create(ctx context.Context, name string, displayName *string) (newOrg *types.Org, err error)
```

#### <a id="OrgStore.Update" href="#OrgStore.Update">func (o *OrgStore) Update(ctx context.Context, id int32, displayName *string) (*types.Org, error)</a>

```
searchKey: database.OrgStore.Update
```

```Go
func (o *OrgStore) Update(ctx context.Context, id int32, displayName *string) (*types.Org, error)
```

#### <a id="OrgStore.Delete" href="#OrgStore.Delete">func (o *OrgStore) Delete(ctx context.Context, id int32) (err error)</a>

```
searchKey: database.OrgStore.Delete
```

```Go
func (o *OrgStore) Delete(ctx context.Context, id int32) (err error)
```

### <a id="OrgsListOptions" href="#OrgsListOptions">type OrgsListOptions struct</a>

```
searchKey: database.OrgsListOptions
```

```Go
type OrgsListOptions struct {
	// Query specifies a search query for organizations.
	Query string

	*LimitOffset
}
```

OrgsListOptions specifies the options for listing organizations. 

### <a id="MockOrgs" href="#MockOrgs">type MockOrgs struct</a>

```
searchKey: database.MockOrgs
```

```Go
type MockOrgs struct {
	GetByID   func(ctx context.Context, id int32) (*types.Org, error)
	GetByName func(ctx context.Context, name string) (*types.Org, error)
	Count     func(ctx context.Context, opt OrgsListOptions) (int, error)
	List      func(ctx context.Context, opt *OrgsListOptions) ([]*types.Org, error)
}
```

#### <a id="MockOrgs.MockGetByID_Return" href="#MockOrgs.MockGetByID_Return">func (s *MockOrgs) MockGetByID_Return(t *testing.T, returns *types.Org, returnsErr error) (called *bool)</a>

```
searchKey: database.MockOrgs.MockGetByID_Return
```

```Go
func (s *MockOrgs) MockGetByID_Return(t *testing.T, returns *types.Org, returnsErr error) (called *bool)
```

### <a id="PhabricatorStore" href="#PhabricatorStore">type PhabricatorStore struct</a>

```
searchKey: database.PhabricatorStore
```

```Go
type PhabricatorStore struct {
	*basestore.Store
}
```

#### <a id="Phabricator" href="#Phabricator">func Phabricator(db dbutil.DB) *PhabricatorStore</a>

```
searchKey: database.Phabricator
```

```Go
func Phabricator(db dbutil.DB) *PhabricatorStore
```

Phabricator instantiates and returns a new PhabricatorStore with prepared statements. 

#### <a id="PhabricatorWith" href="#PhabricatorWith">func PhabricatorWith(other basestore.ShareableStore) *PhabricatorStore</a>

```
searchKey: database.PhabricatorWith
```

```Go
func PhabricatorWith(other basestore.ShareableStore) *PhabricatorStore
```

NewPhabricatorStoreWithDB instantiates and returns a new PhabricatorStore using the other store handle. 

#### <a id="PhabricatorStore.With" href="#PhabricatorStore.With">func (s *PhabricatorStore) With(other basestore.ShareableStore) *PhabricatorStore</a>

```
searchKey: database.PhabricatorStore.With
```

```Go
func (s *PhabricatorStore) With(other basestore.ShareableStore) *PhabricatorStore
```

#### <a id="PhabricatorStore.Transact" href="#PhabricatorStore.Transact">func (s *PhabricatorStore) Transact(ctx context.Context) (*PhabricatorStore, error)</a>

```
searchKey: database.PhabricatorStore.Transact
```

```Go
func (s *PhabricatorStore) Transact(ctx context.Context) (*PhabricatorStore, error)
```

#### <a id="PhabricatorStore.Create" href="#PhabricatorStore.Create">func (p *PhabricatorStore) Create(ctx context.Context, callsign string, name api.RepoName, phabURL string) (*types.PhabricatorRepo, error)</a>

```
searchKey: database.PhabricatorStore.Create
```

```Go
func (p *PhabricatorStore) Create(ctx context.Context, callsign string, name api.RepoName, phabURL string) (*types.PhabricatorRepo, error)
```

#### <a id="PhabricatorStore.CreateOrUpdate" href="#PhabricatorStore.CreateOrUpdate">func (p *PhabricatorStore) CreateOrUpdate(ctx context.Context, callsign string, name api.RepoName, phabURL string) (*types.PhabricatorRepo, error)</a>

```
searchKey: database.PhabricatorStore.CreateOrUpdate
```

```Go
func (p *PhabricatorStore) CreateOrUpdate(ctx context.Context, callsign string, name api.RepoName, phabURL string) (*types.PhabricatorRepo, error)
```

#### <a id="PhabricatorStore.CreateIfNotExists" href="#PhabricatorStore.CreateIfNotExists">func (p *PhabricatorStore) CreateIfNotExists(ctx context.Context, callsign string, name api.RepoName, phabURL string) (*types.PhabricatorRepo, error)</a>

```
searchKey: database.PhabricatorStore.CreateIfNotExists
```

```Go
func (p *PhabricatorStore) CreateIfNotExists(ctx context.Context, callsign string, name api.RepoName, phabURL string) (*types.PhabricatorRepo, error)
```

#### <a id="PhabricatorStore.getBySQL" href="#PhabricatorStore.getBySQL">func (p *PhabricatorStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.PhabricatorRepo, error)</a>

```
searchKey: database.PhabricatorStore.getBySQL
tags: [private]
```

```Go
func (p *PhabricatorStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.PhabricatorRepo, error)
```

#### <a id="PhabricatorStore.getOneBySQL" href="#PhabricatorStore.getOneBySQL">func (p *PhabricatorStore) getOneBySQL(ctx context.Context, query string, args ...interface{}) (*types.PhabricatorRepo, error)</a>

```
searchKey: database.PhabricatorStore.getOneBySQL
tags: [private]
```

```Go
func (p *PhabricatorStore) getOneBySQL(ctx context.Context, query string, args ...interface{}) (*types.PhabricatorRepo, error)
```

#### <a id="PhabricatorStore.GetByName" href="#PhabricatorStore.GetByName">func (p *PhabricatorStore) GetByName(ctx context.Context, name api.RepoName) (*types.PhabricatorRepo, error)</a>

```
searchKey: database.PhabricatorStore.GetByName
```

```Go
func (p *PhabricatorStore) GetByName(ctx context.Context, name api.RepoName) (*types.PhabricatorRepo, error)
```

### <a id="errPhabricatorRepoNotFound" href="#errPhabricatorRepoNotFound">type errPhabricatorRepoNotFound struct</a>

```
searchKey: database.errPhabricatorRepoNotFound
tags: [private]
```

```Go
type errPhabricatorRepoNotFound struct {
	args []interface{}
}
```

#### <a id="errPhabricatorRepoNotFound.Error" href="#errPhabricatorRepoNotFound.Error">func (err errPhabricatorRepoNotFound) Error() string</a>

```
searchKey: database.errPhabricatorRepoNotFound.Error
tags: [private]
```

```Go
func (err errPhabricatorRepoNotFound) Error() string
```

#### <a id="errPhabricatorRepoNotFound.NotFound" href="#errPhabricatorRepoNotFound.NotFound">func (err errPhabricatorRepoNotFound) NotFound() bool</a>

```
searchKey: database.errPhabricatorRepoNotFound.NotFound
tags: [private]
```

```Go
func (err errPhabricatorRepoNotFound) NotFound() bool
```

### <a id="MockPhabricator" href="#MockPhabricator">type MockPhabricator struct</a>

```
searchKey: database.MockPhabricator
```

```Go
type MockPhabricator struct {
	GetByName func(repo api.RepoName) (*types.PhabricatorRepo, error)
}
```

### <a id="RepoNotFoundErr" href="#RepoNotFoundErr">type RepoNotFoundErr struct</a>

```
searchKey: database.RepoNotFoundErr
```

```Go
type RepoNotFoundErr struct {
	ID   api.RepoID
	Name api.RepoName
}
```

#### <a id="RepoNotFoundErr.Error" href="#RepoNotFoundErr.Error">func (e *RepoNotFoundErr) Error() string</a>

```
searchKey: database.RepoNotFoundErr.Error
```

```Go
func (e *RepoNotFoundErr) Error() string
```

#### <a id="RepoNotFoundErr.NotFound" href="#RepoNotFoundErr.NotFound">func (e *RepoNotFoundErr) NotFound() bool</a>

```
searchKey: database.RepoNotFoundErr.NotFound
```

```Go
func (e *RepoNotFoundErr) NotFound() bool
```

### <a id="RepoStore" href="#RepoStore">type RepoStore struct</a>

```
searchKey: database.RepoStore
```

```Go
type RepoStore struct {
	*basestore.Store

	once sync.Once
}
```

RepoStore handles access to the repo table 

#### <a id="Repos" href="#Repos">func Repos(db dbutil.DB) *RepoStore</a>

```
searchKey: database.Repos
```

```Go
func Repos(db dbutil.DB) *RepoStore
```

Repos instantiates and returns a new RepoStore with prepared statements. 

#### <a id="ReposWith" href="#ReposWith">func ReposWith(other basestore.ShareableStore) *RepoStore</a>

```
searchKey: database.ReposWith
```

```Go
func ReposWith(other basestore.ShareableStore) *RepoStore
```

ReposWith instantiates and returns a new RepoStore using the other store handle. 

#### <a id="RepoStore.With" href="#RepoStore.With">func (s *RepoStore) With(other basestore.ShareableStore) *RepoStore</a>

```
searchKey: database.RepoStore.With
```

```Go
func (s *RepoStore) With(other basestore.ShareableStore) *RepoStore
```

#### <a id="RepoStore.Transact" href="#RepoStore.Transact">func (s *RepoStore) Transact(ctx context.Context) (*RepoStore, error)</a>

```
searchKey: database.RepoStore.Transact
```

```Go
func (s *RepoStore) Transact(ctx context.Context) (*RepoStore, error)
```

#### <a id="RepoStore.ensureStore" href="#RepoStore.ensureStore">func (s *RepoStore) ensureStore()</a>

```
searchKey: database.RepoStore.ensureStore
tags: [private]
```

```Go
func (s *RepoStore) ensureStore()
```

ensureStore instantiates a basestore.Store if necessary, using the dbconn.Global handle. This function ensures access to dbconn happens after the rest of the code or tests have initialized it. 

#### <a id="RepoStore.Get" href="#RepoStore.Get">func (s *RepoStore) Get(ctx context.Context, id api.RepoID) (_ *types.Repo, err error)</a>

```
searchKey: database.RepoStore.Get
```

```Go
func (s *RepoStore) Get(ctx context.Context, id api.RepoID) (_ *types.Repo, err error)
```

Get returns metadata for the request repository ID. It fetches data only from the database and NOT from any external sources. If the caller is concerned the copy of the data in the database might be stale, the caller is responsible for fetching data from any external services. 

#### <a id="RepoStore.GetByName" href="#RepoStore.GetByName">func (s *RepoStore) GetByName(ctx context.Context, nameOrURI api.RepoName) (_ *types.Repo, err error)</a>

```
searchKey: database.RepoStore.GetByName
```

```Go
func (s *RepoStore) GetByName(ctx context.Context, nameOrURI api.RepoName) (_ *types.Repo, err error)
```

GetByName returns the repository with the given nameOrUri from the database, or an error. If we have a match on name and uri, we prefer the match on name. 

Name is the name for this repository (e.g., "github.com/user/repo"). It is the same as URI, unless the user configures a non-default repositoryPathPattern. 

#### <a id="RepoStore.GetByIDs" href="#RepoStore.GetByIDs">func (s *RepoStore) GetByIDs(ctx context.Context, ids ...api.RepoID) (_ []*types.Repo, err error)</a>

```
searchKey: database.RepoStore.GetByIDs
```

```Go
func (s *RepoStore) GetByIDs(ctx context.Context, ids ...api.RepoID) (_ []*types.Repo, err error)
```

GetByIDs returns a list of repositories by given IDs. The number of results list could be less than the candidate list due to no repository is associated with some IDs. 

#### <a id="RepoStore.GetReposSetByIDs" href="#RepoStore.GetReposSetByIDs">func (s *RepoStore) GetReposSetByIDs(ctx context.Context, ids ...api.RepoID) (map[api.RepoID]*types.Repo, error)</a>

```
searchKey: database.RepoStore.GetReposSetByIDs
```

```Go
func (s *RepoStore) GetReposSetByIDs(ctx context.Context, ids ...api.RepoID) (map[api.RepoID]*types.Repo, error)
```

GetReposSetByIDs returns a map of repositories with the given IDs, indexed by their IDs. The number of results entries could be less than the candidate list due to no repository is associated with some IDs. 

#### <a id="RepoStore.Count" href="#RepoStore.Count">func (s *RepoStore) Count(ctx context.Context, opt ReposListOptions) (ct int, err error)</a>

```
searchKey: database.RepoStore.Count
```

```Go
func (s *RepoStore) Count(ctx context.Context, opt ReposListOptions) (ct int, err error)
```

#### <a id="RepoStore.List" href="#RepoStore.List">func (s *RepoStore) List(ctx context.Context, opt ReposListOptions) (results []*types.Repo, err error)</a>

```
searchKey: database.RepoStore.List
```

```Go
func (s *RepoStore) List(ctx context.Context, opt ReposListOptions) (results []*types.Repo, err error)
```

List lists repositories in the Sourcegraph repository 

This will not return any repositories from external services that are not present in the Sourcegraph repository. The result list is unsorted and has a fixed maximum limit of 1000 items. Matching is done with fuzzy matching, i.e. "query" will match any repo name that matches the regexp `q.*u.*e.*r.*y` 

#### <a id="RepoStore.ListRepoNames" href="#RepoStore.ListRepoNames">func (s *RepoStore) ListRepoNames(ctx context.Context, opt ReposListOptions) (results []types.RepoName, err error)</a>

```
searchKey: database.RepoStore.ListRepoNames
```

```Go
func (s *RepoStore) ListRepoNames(ctx context.Context, opt ReposListOptions) (results []types.RepoName, err error)
```

ListRepoNames returns a list of repositories names and ids. 

#### <a id="RepoStore.listRepos" href="#RepoStore.listRepos">func (s *RepoStore) listRepos(ctx context.Context, tr *trace.Trace, opt ReposListOptions) (rs []*types.Repo, err error)</a>

```
searchKey: database.RepoStore.listRepos
tags: [private]
```

```Go
func (s *RepoStore) listRepos(ctx context.Context, tr *trace.Trace, opt ReposListOptions) (rs []*types.Repo, err error)
```

#### <a id="RepoStore.list" href="#RepoStore.list">func (s *RepoStore) list(ctx context.Context, tr *trace.Trace, opt ReposListOptions, scanRepo func(rows *sql.Rows) error) error</a>

```
searchKey: database.RepoStore.list
tags: [private]
```

```Go
func (s *RepoStore) list(ctx context.Context, tr *trace.Trace, opt ReposListOptions, scanRepo func(rows *sql.Rows) error) error
```

#### <a id="RepoStore.listSQL" href="#RepoStore.listSQL">func (s *RepoStore) listSQL(ctx context.Context, opt ReposListOptions) (*sqlf.Query, error)</a>

```
searchKey: database.RepoStore.listSQL
tags: [private]
```

```Go
func (s *RepoStore) listSQL(ctx context.Context, opt ReposListOptions) (*sqlf.Query, error)
```

#### <a id="RepoStore.ListDefaultRepos" href="#RepoStore.ListDefaultRepos">func (s *RepoStore) ListDefaultRepos(ctx context.Context, opts ListDefaultReposOptions) (results []types.RepoName, err error)</a>

```
searchKey: database.RepoStore.ListDefaultRepos
```

```Go
func (s *RepoStore) ListDefaultRepos(ctx context.Context, opts ListDefaultReposOptions) (results []types.RepoName, err error)
```

ListDefaultRepos returns a list of default repos. Default repos are a union of repos in our default_repos table and repos owned by users. 

#### <a id="RepoStore.Create" href="#RepoStore.Create">func (s *RepoStore) Create(ctx context.Context, repos ...*types.Repo) (err error)</a>

```
searchKey: database.RepoStore.Create
```

```Go
func (s *RepoStore) Create(ctx context.Context, repos ...*types.Repo) (err error)
```

Create inserts repos and their sources, respectively in the repo and external_service_repos table. Associated external services must already exist. 

#### <a id="RepoStore.Delete" href="#RepoStore.Delete">func (s *RepoStore) Delete(ctx context.Context, ids ...api.RepoID) error</a>

```
searchKey: database.RepoStore.Delete
```

```Go
func (s *RepoStore) Delete(ctx context.Context, ids ...api.RepoID) error
```

Delete deletes repos associated with the given ids and their associated sources. 

#### <a id="RepoStore.ListEnabledNames" href="#RepoStore.ListEnabledNames">func (s *RepoStore) ListEnabledNames(ctx context.Context) ([]string, error)</a>

```
searchKey: database.RepoStore.ListEnabledNames
```

```Go
func (s *RepoStore) ListEnabledNames(ctx context.Context) ([]string, error)
```

ListEnabledNames returns a list of all enabled repo names. This is commonly requested information by other services (repo-updater and indexed-search). We special case just returning enabled names so that we read much less data into memory. 

#### <a id="RepoStore.ExternalServices" href="#RepoStore.ExternalServices">func (s *RepoStore) ExternalServices(ctx context.Context, repoID api.RepoID) ([]*types.ExternalService, error)</a>

```
searchKey: database.RepoStore.ExternalServices
```

```Go
func (s *RepoStore) ExternalServices(ctx context.Context, repoID api.RepoID) ([]*types.ExternalService, error)
```

ExternalServices lists the external services which include references to the given repo. 

#### <a id="RepoStore.Upsert" href="#RepoStore.Upsert">func (s *RepoStore) Upsert(ctx context.Context, op InsertRepoOp) error</a>

```
searchKey: database.RepoStore.Upsert
tags: [private]
```

```Go
func (s *RepoStore) Upsert(ctx context.Context, op InsertRepoOp) error
```

Upsert updates the repository if it already exists (keyed on name) and inserts it if it does not. 

Upsert exists for testing purposes only. Repository mutations are managed by repo-updater. 

### <a id="ReposListOptions" href="#ReposListOptions">type ReposListOptions struct</a>

```
searchKey: database.ReposListOptions
```

```Go
type ReposListOptions struct {
	// What to select of each row.
	Select []string

	// Query specifies a search query for repositories. If specified, then the Sort and
	// Direction options are ignored
	Query string

	// IncludePatterns is a list of regular expressions, all of which must match all
	// repositories returned in the list.
	IncludePatterns []string

	// ExcludePattern is a regular expression that must not match any repository
	// returned in the list.
	ExcludePattern string

	// Names is a list of repository names used to limit the results to that
	// set of repositories.
	// Note: This is currently used for version contexts. In future iterations,
	// version contexts may have their own table
	// and this may be replaced by the version context name.
	Names []string

	// URIs selects any repos in the given set of URIs (i.e. uri column)
	URIs []string

	// IDs of repos to list. When zero-valued, this is omitted from the predicate set.
	IDs []api.RepoID

	// UserID, if non zero, will limit the set of results to repositories added by the user
	// through external services. Mutually exclusive with the ExternalServiceIDs option.
	UserID int32

	// SearchContextID, if non zero, will limit the set of results to repositories listed in
	// the search context.
	SearchContextID int64

	// ServiceTypes of repos to list. When zero-valued, this is omitted from the predicate set.
	ServiceTypes []string

	// ExternalServiceIDs, if non empty, will only return repos added by the given external services.
	// The id is that of the external_services table NOT the external_service_id in the repo table
	// Mutually exclusive with the UserID option.
	ExternalServiceIDs []int64

	// ExternalRepos of repos to list. When zero-valued, this is omitted from the predicate set.
	ExternalRepos []api.ExternalRepoSpec

	// ExternalRepoIncludePrefixes is the list of specs to include repos using
	// prefix matching. When zero-valued, this is omitted from the predicate set.
	ExternalRepoIncludePrefixes []api.ExternalRepoSpec

	// ExternalRepoExcludePrefixes is the list of specs to exclude repos using
	// prefix matching. When zero-valued, this is omitted from the predicate set.
	ExternalRepoExcludePrefixes []api.ExternalRepoSpec

	// PatternQuery is an expression tree of patterns to query. The atoms of
	// the query are strings which are regular expression patterns.
	PatternQuery query.Q

	// NoForks excludes forks from the list.
	NoForks bool

	// OnlyForks excludes non-forks from the lhist.
	OnlyForks bool

	// NoArchived excludes archived repositories from the list.
	NoArchived bool

	// OnlyArchived excludes non-archived repositories from the list.
	OnlyArchived bool

	// NoCloned excludes cloned repositories from the list.
	NoCloned bool

	// OnlyCloned excludes non-cloned repositories from the list.
	OnlyCloned bool

	// NoPrivate excludes private repositories from the list.
	NoPrivate bool

	// OnlyPrivate excludes non-private repositories from the list.
	OnlyPrivate bool

	// Index when set will only include repositories which should be indexed
	// if true. If false it will exclude repositories which should be
	// indexed. An example use case of this is for indexed search only
	// indexing a subset of repositories.
	Index *bool

	// List of fields by which to order the return repositories.
	OrderBy RepoListOrderBy

	// CursorColumn contains the relevant column for cursor-based pagination (e.g. "name")
	CursorColumn string

	// CursorValue contains the relevant value for cursor-based pagination (e.g. "Zaphod").
	CursorValue string

	// CursorDirection contains the comparison for cursor-based pagination, all possible values are: next, prev.
	CursorDirection string

	// UseOr decides between ANDing or ORing the predicates together.
	UseOr bool

	// IncludeUserPublicRepos will include repos from the user_public_repos table if this field is true, and the user_id
	// is non-zero. Note that these are not repos owned by this user, just ones they are interested in.
	IncludeUserPublicRepos bool

	// FailedFetch, if true, will filter to only repos that failed to clone or fetch
	// when last attempted. Specifically, this means that they have a non-null
	// last_error value in the gitserver_repos table.
	FailedFetch bool

	*LimitOffset
}
```

ReposListOptions specifies the options for listing repositories. 

Query and IncludePatterns/ExcludePatterns may not be used together. 

### <a id="RepoListOrderBy" href="#RepoListOrderBy">type RepoListOrderBy []database.RepoListSort</a>

```
searchKey: database.RepoListOrderBy
```

```Go
type RepoListOrderBy []RepoListSort
```

#### <a id="RepoListOrderBy.SQL" href="#RepoListOrderBy.SQL">func (r RepoListOrderBy) SQL() *sqlf.Query</a>

```
searchKey: database.RepoListOrderBy.SQL
```

```Go
func (r RepoListOrderBy) SQL() *sqlf.Query
```

### <a id="RepoListSort" href="#RepoListSort">type RepoListSort struct</a>

```
searchKey: database.RepoListSort
```

```Go
type RepoListSort struct {
	Field      RepoListColumn
	Descending bool
	Nulls      string
}
```

RepoListSort is a field by which to sort and the direction of the sorting. 

#### <a id="RepoListSort.SQL" href="#RepoListSort.SQL">func (r RepoListSort) SQL() *sqlf.Query</a>

```
searchKey: database.RepoListSort.SQL
```

```Go
func (r RepoListSort) SQL() *sqlf.Query
```

### <a id="RepoListColumn" href="#RepoListColumn">type RepoListColumn string</a>

```
searchKey: database.RepoListColumn
```

```Go
type RepoListColumn string
```

RepoListColumn is a column by which repositories can be sorted. These correspond to columns in the database. 

### <a id="ListDefaultReposOptions" href="#ListDefaultReposOptions">type ListDefaultReposOptions struct</a>

```
searchKey: database.ListDefaultReposOptions
```

```Go
type ListDefaultReposOptions struct {
	// If true, will only include uncloned default repos
	OnlyUncloned bool
	// If true, we include user added private repos
	IncludePrivate bool
}
```

### <a id="repoRecord" href="#repoRecord">type repoRecord struct</a>

```
searchKey: database.repoRecord
tags: [private]
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
searchKey: database.newRepoRecord
tags: [private]
```

```Go
func newRepoRecord(r *types.Repo) (*repoRecord, error)
```

### <a id="externalServiceRepo" href="#externalServiceRepo">type externalServiceRepo struct</a>

```
searchKey: database.externalServiceRepo
tags: [private]
```

```Go
type externalServiceRepo struct {
	ExternalServiceID int64  `json:"external_service_id"`
	RepoID            int64  `json:"repo_id"`
	CloneURL          string `json:"clone_url"`
}
```

### <a id="MockRepos" href="#MockRepos">type MockRepos struct</a>

```
searchKey: database.MockRepos
```

```Go
type MockRepos struct {
	Get           func(ctx context.Context, repo api.RepoID) (*types.Repo, error)
	GetByName     func(ctx context.Context, repo api.RepoName) (*types.Repo, error)
	GetByIDs      func(ctx context.Context, ids ...api.RepoID) ([]*types.Repo, error)
	List          func(v0 context.Context, v1 ReposListOptions) ([]*types.Repo, error)
	ListRepoNames func(v0 context.Context, v1 ReposListOptions) ([]types.RepoName, error)
	Create        func(ctx context.Context, repos ...*types.Repo) (err error)
	Count         func(ctx context.Context, opt ReposListOptions) (int, error)
}
```

#### <a id="MockRepos.MockGet" href="#MockRepos.MockGet">func (s *MockRepos) MockGet(t *testing.T, wantRepo api.RepoID) (called *bool)</a>

```
searchKey: database.MockRepos.MockGet
```

```Go
func (s *MockRepos) MockGet(t *testing.T, wantRepo api.RepoID) (called *bool)
```

#### <a id="MockRepos.MockGet_Return" href="#MockRepos.MockGet_Return">func (s *MockRepos) MockGet_Return(t *testing.T, returns *types.Repo) (called *bool)</a>

```
searchKey: database.MockRepos.MockGet_Return
```

```Go
func (s *MockRepos) MockGet_Return(t *testing.T, returns *types.Repo) (called *bool)
```

#### <a id="MockRepos.MockGetByName" href="#MockRepos.MockGetByName">func (s *MockRepos) MockGetByName(t testing.TB, want api.RepoName, repo api.RepoID) (called *bool)</a>

```
searchKey: database.MockRepos.MockGetByName
```

```Go
func (s *MockRepos) MockGetByName(t testing.TB, want api.RepoName, repo api.RepoID) (called *bool)
```

#### <a id="MockRepos.MockList" href="#MockRepos.MockList">func (s *MockRepos) MockList(t testing.TB, wantRepos ...api.RepoName) (called *bool)</a>

```
searchKey: database.MockRepos.MockList
```

```Go
func (s *MockRepos) MockList(t testing.TB, wantRepos ...api.RepoName) (called *bool)
```

#### <a id="MockRepos.MockListRepoNames" href="#MockRepos.MockListRepoNames">func (s *MockRepos) MockListRepoNames(t testing.TB, wantRepos ...api.RepoName) (called *bool)</a>

```
searchKey: database.MockRepos.MockListRepoNames
```

```Go
func (s *MockRepos) MockListRepoNames(t testing.TB, wantRepos ...api.RepoName) (called *bool)
```

### <a id="QueryRunnerStateStore" href="#QueryRunnerStateStore">type QueryRunnerStateStore struct</a>

```
searchKey: database.QueryRunnerStateStore
```

```Go
type QueryRunnerStateStore struct {
	*basestore.Store
}
```

#### <a id="QueryRunnerState" href="#QueryRunnerState">func QueryRunnerState(db dbutil.DB) *QueryRunnerStateStore</a>

```
searchKey: database.QueryRunnerState
```

```Go
func QueryRunnerState(db dbutil.DB) *QueryRunnerStateStore
```

QueryRunnerState instantiates and returns a new QueryRunnerStateStore with prepared statements. 

#### <a id="QueryRunnerStateWith" href="#QueryRunnerStateWith">func QueryRunnerStateWith(other basestore.ShareableStore) *QueryRunnerStateStore</a>

```
searchKey: database.QueryRunnerStateWith
```

```Go
func QueryRunnerStateWith(other basestore.ShareableStore) *QueryRunnerStateStore
```

NewQueryRunnerStateStoreWithDB instantiates and returns a new QueryRunnerStateStore using the other store handle. 

#### <a id="QueryRunnerStateStore.With" href="#QueryRunnerStateStore.With">func (s *QueryRunnerStateStore) With(other basestore.ShareableStore) *QueryRunnerStateStore</a>

```
searchKey: database.QueryRunnerStateStore.With
```

```Go
func (s *QueryRunnerStateStore) With(other basestore.ShareableStore) *QueryRunnerStateStore
```

#### <a id="QueryRunnerStateStore.Transact" href="#QueryRunnerStateStore.Transact">func (s *QueryRunnerStateStore) Transact(ctx context.Context) (*QueryRunnerStateStore, error)</a>

```
searchKey: database.QueryRunnerStateStore.Transact
```

```Go
func (s *QueryRunnerStateStore) Transact(ctx context.Context) (*QueryRunnerStateStore, error)
```

#### <a id="QueryRunnerStateStore.Get" href="#QueryRunnerStateStore.Get">func (s *QueryRunnerStateStore) Get(ctx context.Context, query string) (*SavedQueryInfo, error)</a>

```
searchKey: database.QueryRunnerStateStore.Get
```

```Go
func (s *QueryRunnerStateStore) Get(ctx context.Context, query string) (*SavedQueryInfo, error)
```

Get gets the saved query information for the given query. nil is returned if there is no existing saved query info. 

#### <a id="QueryRunnerStateStore.Set" href="#QueryRunnerStateStore.Set">func (s *QueryRunnerStateStore) Set(ctx context.Context, info *SavedQueryInfo) error</a>

```
searchKey: database.QueryRunnerStateStore.Set
```

```Go
func (s *QueryRunnerStateStore) Set(ctx context.Context, info *SavedQueryInfo) error
```

Set sets the saved query information for the given info.Query. 

It is not safe to call concurrently for the same info.Query, as it uses a poor man's upsert implementation. 

#### <a id="QueryRunnerStateStore.Delete" href="#QueryRunnerStateStore.Delete">func (s *QueryRunnerStateStore) Delete(ctx context.Context, query string) error</a>

```
searchKey: database.QueryRunnerStateStore.Delete
```

```Go
func (s *QueryRunnerStateStore) Delete(ctx context.Context, query string) error
```

### <a id="SavedQueryInfo" href="#SavedQueryInfo">type SavedQueryInfo struct</a>

```
searchKey: database.SavedQueryInfo
```

```Go
type SavedQueryInfo struct {
	Query        string
	LastExecuted time.Time
	LatestResult time.Time
	ExecDuration time.Duration
}
```

### <a id="SavedSearchStore" href="#SavedSearchStore">type SavedSearchStore struct</a>

```
searchKey: database.SavedSearchStore
```

```Go
type SavedSearchStore struct {
	*basestore.Store
}
```

#### <a id="SavedSearches" href="#SavedSearches">func SavedSearches(db dbutil.DB) *SavedSearchStore</a>

```
searchKey: database.SavedSearches
```

```Go
func SavedSearches(db dbutil.DB) *SavedSearchStore
```

SavedSearches instantiates and returns a new SavedSearchStore with prepared statements. 

#### <a id="SavedSearchesWith" href="#SavedSearchesWith">func SavedSearchesWith(other basestore.ShareableStore) *SavedSearchStore</a>

```
searchKey: database.SavedSearchesWith
```

```Go
func SavedSearchesWith(other basestore.ShareableStore) *SavedSearchStore
```

NewSavedSearchStoreWithDB instantiates and returns a new SavedSearchStore using the other store handle. 

#### <a id="SavedSearchStore.With" href="#SavedSearchStore.With">func (s *SavedSearchStore) With(other basestore.ShareableStore) *SavedSearchStore</a>

```
searchKey: database.SavedSearchStore.With
```

```Go
func (s *SavedSearchStore) With(other basestore.ShareableStore) *SavedSearchStore
```

#### <a id="SavedSearchStore.Transact" href="#SavedSearchStore.Transact">func (s *SavedSearchStore) Transact(ctx context.Context) (*SavedSearchStore, error)</a>

```
searchKey: database.SavedSearchStore.Transact
```

```Go
func (s *SavedSearchStore) Transact(ctx context.Context) (*SavedSearchStore, error)
```

#### <a id="SavedSearchStore.IsEmpty" href="#SavedSearchStore.IsEmpty">func (s *SavedSearchStore) IsEmpty(ctx context.Context) (bool, error)</a>

```
searchKey: database.SavedSearchStore.IsEmpty
```

```Go
func (s *SavedSearchStore) IsEmpty(ctx context.Context) (bool, error)
```

IsEmpty tells if there are no saved searches (at all) on this Sourcegraph instance. 

#### <a id="SavedSearchStore.ListAll" href="#SavedSearchStore.ListAll">func (s *SavedSearchStore) ListAll(ctx context.Context) (savedSearches []api.SavedQuerySpecAndConfig, err error)</a>

```
searchKey: database.SavedSearchStore.ListAll
```

```Go
func (s *SavedSearchStore) ListAll(ctx context.Context) (savedSearches []api.SavedQuerySpecAndConfig, err error)
```

ListAll lists all the saved searches on an instance. 

🚨 SECURITY: This method does NOT verify the user's identity or that the user is an admin. It is the callers responsibility to ensure that only users with the proper permissions can access the returned saved searches. 

#### <a id="SavedSearchStore.GetByID" href="#SavedSearchStore.GetByID">func (s *SavedSearchStore) GetByID(ctx context.Context, id int32) (*api.SavedQuerySpecAndConfig, error)</a>

```
searchKey: database.SavedSearchStore.GetByID
```

```Go
func (s *SavedSearchStore) GetByID(ctx context.Context, id int32) (*api.SavedQuerySpecAndConfig, error)
```

GetByID returns the saved search with the given ID. 

🚨 SECURITY: This method does NOT verify the user's identity or that the user is an admin. It is the callers responsibility to ensure this response only makes it to users with proper permissions to access the saved search. 

#### <a id="SavedSearchStore.ListSavedSearchesByUserID" href="#SavedSearchStore.ListSavedSearchesByUserID">func (s *SavedSearchStore) ListSavedSearchesByUserID(ctx context.Context, userID int32) ([]*types.SavedSearch, error)</a>

```
searchKey: database.SavedSearchStore.ListSavedSearchesByUserID
```

```Go
func (s *SavedSearchStore) ListSavedSearchesByUserID(ctx context.Context, userID int32) ([]*types.SavedSearch, error)
```

ListSavedSearchesByUserID lists all the saved searches associated with a user, including saved searches in organizations the user is a member of. 

🚨 SECURITY: This method does NOT verify the user's identity or that the user is an admin. It is the callers responsibility to ensure that only the specified user or users with proper permissions can access the returned saved searches. 

#### <a id="SavedSearchStore.ListSavedSearchesByOrgID" href="#SavedSearchStore.ListSavedSearchesByOrgID">func (s *SavedSearchStore) ListSavedSearchesByOrgID(ctx context.Context, orgID int32) ([]*types.SavedSearch, error)</a>

```
searchKey: database.SavedSearchStore.ListSavedSearchesByOrgID
```

```Go
func (s *SavedSearchStore) ListSavedSearchesByOrgID(ctx context.Context, orgID int32) ([]*types.SavedSearch, error)
```

ListSavedSearchesByUserID lists all the saved searches associated with an organization. 

🚨 SECURITY: This method does NOT verify the user's identity or that the user is an admin. It is the callers responsibility to ensure only admins or members of the specified organization can access the returned saved searches. 

#### <a id="SavedSearchStore.Create" href="#SavedSearchStore.Create">func (s *SavedSearchStore) Create(ctx context.Context, newSavedSearch *types.SavedSearch) (savedQuery *types.SavedSearch, err error)</a>

```
searchKey: database.SavedSearchStore.Create
```

```Go
func (s *SavedSearchStore) Create(ctx context.Context, newSavedSearch *types.SavedSearch) (savedQuery *types.SavedSearch, err error)
```

Create creates a new saved search with the specified parameters. The ID field must be zero, or an error will be returned. 

🚨 SECURITY: This method does NOT verify the user's identity or that the user is an admin. It is the callers responsibility to ensure the user has proper permissions to create the saved search. 

#### <a id="SavedSearchStore.Update" href="#SavedSearchStore.Update">func (s *SavedSearchStore) Update(ctx context.Context, savedSearch *types.SavedSearch) (savedQuery *types.SavedSearch, err error)</a>

```
searchKey: database.SavedSearchStore.Update
```

```Go
func (s *SavedSearchStore) Update(ctx context.Context, savedSearch *types.SavedSearch) (savedQuery *types.SavedSearch, err error)
```

Update updates an existing saved search. 

🚨 SECURITY: This method does NOT verify the user's identity or that the user is an admin. It is the callers responsibility to ensure the user has proper permissions to perform the update. 

#### <a id="SavedSearchStore.Delete" href="#SavedSearchStore.Delete">func (s *SavedSearchStore) Delete(ctx context.Context, id int32) (err error)</a>

```
searchKey: database.SavedSearchStore.Delete
```

```Go
func (s *SavedSearchStore) Delete(ctx context.Context, id int32) (err error)
```

Delete hard-deletes an existing saved search. 

🚨 SECURITY: This method does NOT verify the user's identity or that the user is an admin. It is the callers responsibility to ensure the user has proper permissions to perform the delete. 

### <a id="MockSavedSearches" href="#MockSavedSearches">type MockSavedSearches struct</a>

```
searchKey: database.MockSavedSearches
```

```Go
type MockSavedSearches struct {
	ListAll                   func(ctx context.Context) ([]api.SavedQuerySpecAndConfig, error)
	ListSavedSearchesByUserID func(ctx context.Context, userID int32) ([]*types.SavedSearch, error)
	Create                    func(ctx context.Context, newSavedSearch *types.SavedSearch) (*types.SavedSearch, error)
	Update                    func(ctx context.Context, savedSearch *types.SavedSearch) (*types.SavedSearch, error)
	Delete                    func(ctx context.Context, id int32) error
	GetByID                   func(ctx context.Context, id int32) (*api.SavedQuerySpecAndConfig, error)
}
```

### <a id="SearchContextsStore" href="#SearchContextsStore">type SearchContextsStore struct</a>

```
searchKey: database.SearchContextsStore
```

```Go
type SearchContextsStore struct {
	*basestore.Store
}
```

#### <a id="SearchContexts" href="#SearchContexts">func SearchContexts(db dbutil.DB) *SearchContextsStore</a>

```
searchKey: database.SearchContexts
```

```Go
func SearchContexts(db dbutil.DB) *SearchContextsStore
```

#### <a id="SearchContextsStore.Transact" href="#SearchContextsStore.Transact">func (s *SearchContextsStore) Transact(ctx context.Context) (*SearchContextsStore, error)</a>

```
searchKey: database.SearchContextsStore.Transact
```

```Go
func (s *SearchContextsStore) Transact(ctx context.Context) (*SearchContextsStore, error)
```

#### <a id="SearchContextsStore.listSearchContexts" href="#SearchContextsStore.listSearchContexts">func (s *SearchContextsStore) listSearchContexts(ctx context.Context, cond *sqlf.Query, orderBy *sqlf.Query, limit int32, offset int32) ([]*types.SearchContext, error)</a>

```
searchKey: database.SearchContextsStore.listSearchContexts
tags: [private]
```

```Go
func (s *SearchContextsStore) listSearchContexts(ctx context.Context, cond *sqlf.Query, orderBy *sqlf.Query, limit int32, offset int32) ([]*types.SearchContext, error)
```

#### <a id="SearchContextsStore.ListSearchContexts" href="#SearchContextsStore.ListSearchContexts">func (s *SearchContextsStore) ListSearchContexts(ctx context.Context, pageOpts ListSearchContextsPageOptions, opts ListSearchContextsOptions) ([]*types.SearchContext, error)</a>

```
searchKey: database.SearchContextsStore.ListSearchContexts
```

```Go
func (s *SearchContextsStore) ListSearchContexts(ctx context.Context, pageOpts ListSearchContextsPageOptions, opts ListSearchContextsOptions) ([]*types.SearchContext, error)
```

#### <a id="SearchContextsStore.CountSearchContexts" href="#SearchContextsStore.CountSearchContexts">func (s *SearchContextsStore) CountSearchContexts(ctx context.Context, opts ListSearchContextsOptions) (int32, error)</a>

```
searchKey: database.SearchContextsStore.CountSearchContexts
```

```Go
func (s *SearchContextsStore) CountSearchContexts(ctx context.Context, opts ListSearchContextsOptions) (int32, error)
```

#### <a id="SearchContextsStore.GetSearchContext" href="#SearchContextsStore.GetSearchContext">func (s *SearchContextsStore) GetSearchContext(ctx context.Context, opts GetSearchContextOptions) (*types.SearchContext, error)</a>

```
searchKey: database.SearchContextsStore.GetSearchContext
```

```Go
func (s *SearchContextsStore) GetSearchContext(ctx context.Context, opts GetSearchContextOptions) (*types.SearchContext, error)
```

#### <a id="SearchContextsStore.DeleteSearchContext" href="#SearchContextsStore.DeleteSearchContext">func (s *SearchContextsStore) DeleteSearchContext(ctx context.Context, searchContextID int64) error</a>

```
searchKey: database.SearchContextsStore.DeleteSearchContext
```

```Go
func (s *SearchContextsStore) DeleteSearchContext(ctx context.Context, searchContextID int64) error
```

🚨 SECURITY: The caller must ensure that the actor is a site admin or has permission to delete the search context. 

#### <a id="SearchContextsStore.CreateSearchContextWithRepositoryRevisions" href="#SearchContextsStore.CreateSearchContextWithRepositoryRevisions">func (s *SearchContextsStore) CreateSearchContextWithRepositoryRevisions(ctx context.Context, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (createdSearchContext *types.SearchContext, err error)</a>

```
searchKey: database.SearchContextsStore.CreateSearchContextWithRepositoryRevisions
```

```Go
func (s *SearchContextsStore) CreateSearchContextWithRepositoryRevisions(ctx context.Context, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (createdSearchContext *types.SearchContext, err error)
```

🚨 SECURITY: The caller must ensure that the actor is a site admin or has permission to create the search context. 

#### <a id="SearchContextsStore.UpdateSearchContextWithRepositoryRevisions" href="#SearchContextsStore.UpdateSearchContextWithRepositoryRevisions">func (s *SearchContextsStore) UpdateSearchContextWithRepositoryRevisions(ctx context.Context, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (_ *types.SearchContext, err error)</a>

```
searchKey: database.SearchContextsStore.UpdateSearchContextWithRepositoryRevisions
```

```Go
func (s *SearchContextsStore) UpdateSearchContextWithRepositoryRevisions(ctx context.Context, searchContext *types.SearchContext, repositoryRevisions []*types.SearchContextRepositoryRevisions) (_ *types.SearchContext, err error)
```

🚨 SECURITY: The caller must ensure that the actor is a site admin or has permission to update the search context. 

#### <a id="SearchContextsStore.SetSearchContextRepositoryRevisions" href="#SearchContextsStore.SetSearchContextRepositoryRevisions">func (s *SearchContextsStore) SetSearchContextRepositoryRevisions(ctx context.Context, searchContextID int64, repositoryRevisions []*types.SearchContextRepositoryRevisions) (err error)</a>

```
searchKey: database.SearchContextsStore.SetSearchContextRepositoryRevisions
```

```Go
func (s *SearchContextsStore) SetSearchContextRepositoryRevisions(ctx context.Context, searchContextID int64, repositoryRevisions []*types.SearchContextRepositoryRevisions) (err error)
```

#### <a id="SearchContextsStore.createSearchContext" href="#SearchContextsStore.createSearchContext">func (s *SearchContextsStore) createSearchContext(ctx context.Context, searchContext *types.SearchContext) (*types.SearchContext, error)</a>

```
searchKey: database.SearchContextsStore.createSearchContext
tags: [private]
```

```Go
func (s *SearchContextsStore) createSearchContext(ctx context.Context, searchContext *types.SearchContext) (*types.SearchContext, error)
```

#### <a id="SearchContextsStore.updateSearchContext" href="#SearchContextsStore.updateSearchContext">func (s *SearchContextsStore) updateSearchContext(ctx context.Context, searchContext *types.SearchContext) (*types.SearchContext, error)</a>

```
searchKey: database.SearchContextsStore.updateSearchContext
tags: [private]
```

```Go
func (s *SearchContextsStore) updateSearchContext(ctx context.Context, searchContext *types.SearchContext) (*types.SearchContext, error)
```

#### <a id="SearchContextsStore.GetSearchContextRepositoryRevisions" href="#SearchContextsStore.GetSearchContextRepositoryRevisions">func (s *SearchContextsStore) GetSearchContextRepositoryRevisions(ctx context.Context, searchContextID int64) ([]*types.SearchContextRepositoryRevisions, error)</a>

```
searchKey: database.SearchContextsStore.GetSearchContextRepositoryRevisions
```

```Go
func (s *SearchContextsStore) GetSearchContextRepositoryRevisions(ctx context.Context, searchContextID int64) ([]*types.SearchContextRepositoryRevisions, error)
```

#### <a id="SearchContextsStore.GetAllRevisionsForRepo" href="#SearchContextsStore.GetAllRevisionsForRepo">func (s *SearchContextsStore) GetAllRevisionsForRepo(ctx context.Context, repoID int32) ([]string, error)</a>

```
searchKey: database.SearchContextsStore.GetAllRevisionsForRepo
```

```Go
func (s *SearchContextsStore) GetAllRevisionsForRepo(ctx context.Context, repoID int32) ([]string, error)
```

GetAllRevisionsForRepo returns the list of revisions that are used in search contexts for a given repo ID. 

### <a id="SearchContextsOrderByOption" href="#SearchContextsOrderByOption">type SearchContextsOrderByOption uint8</a>

```
searchKey: database.SearchContextsOrderByOption
```

```Go
type SearchContextsOrderByOption uint8
```

### <a id="ListSearchContextsPageOptions" href="#ListSearchContextsPageOptions">type ListSearchContextsPageOptions struct</a>

```
searchKey: database.ListSearchContextsPageOptions
```

```Go
type ListSearchContextsPageOptions struct {
	First int32
	After int32
}
```

### <a id="ListSearchContextsOptions" href="#ListSearchContextsOptions">type ListSearchContextsOptions struct</a>

```
searchKey: database.ListSearchContextsOptions
```

```Go
type ListSearchContextsOptions struct {
	// Name is used for partial matching of search contexts by name (case-insensitvely).
	Name string
	// NamespaceName is used for partial matching of search context namespaces (user or org) by name (case-insensitvely).
	NamespaceName string
	// NamespaceUserIDs matches search contexts by user namespace. If multiple IDs are specified, then a union of all matching results is returned.
	NamespaceUserIDs []int32
	// NamespaceOrgIDs matches search contexts by org. If multiple IDs are specified, then a union of all matching results is returned.
	NamespaceOrgIDs []int32
	// NoNamespace matches search contexts without a namespace ("instance-level contexts").
	NoNamespace bool
	// OrderBy specifies the ordering option for search contexts. Search contexts are ordered using SearchContextsOrderByID by default.
	// SearchContextsOrderBySpec option sorts contexts by coallesced namespace names first
	// (user name and org name) and then by context name. SearchContextsOrderByUpdatedAt option sorts
	// search contexts by their last update time (updated_at).
	OrderBy SearchContextsOrderByOption
	// OrderByDescending specifies the sort direction for the OrderBy option.
	OrderByDescending bool
}
```

ListSearchContextsOptions specifies the options for listing search contexts. It produces a union of all search contexts that match NamespaceUserIDs, or NamespaceOrgIDs, or NoNamespace. If none of those are specified, it produces all available search contexts. 

### <a id="GetSearchContextOptions" href="#GetSearchContextOptions">type GetSearchContextOptions struct</a>

```
searchKey: database.GetSearchContextOptions
```

```Go
type GetSearchContextOptions struct {
	Name            string
	NamespaceUserID int32
	NamespaceOrgID  int32
}
```

### <a id="MockSearchContexts" href="#MockSearchContexts">type MockSearchContexts struct</a>

```
searchKey: database.MockSearchContexts
```

```Go
type MockSearchContexts struct {
	GetSearchContext                    func(ctx context.Context, opts GetSearchContextOptions) (*types.SearchContext, error)
	GetSearchContextRepositoryRevisions func(ctx context.Context, searchContextID int64) ([]*types.SearchContextRepositoryRevisions, error)
	ListSearchContexts                  func(ctx context.Context, pageOpts ListSearchContextsPageOptions, opts ListSearchContextsOptions) ([]*types.SearchContext, error)
	CountSearchContexts                 func(ctx context.Context, opts ListSearchContextsOptions) (int32, error)
}
```

### <a id="SecurityEvent" href="#SecurityEvent">type SecurityEvent struct</a>

```
searchKey: database.SecurityEvent
```

```Go
type SecurityEvent struct {
	Name            string
	URL             string
	UserID          uint32
	AnonymousUserID string
	Argument        json.RawMessage
	Source          string
	Timestamp       time.Time
}
```

SecurityEvent contains information needed for logging a security-relevant event. 

### <a id="SecurityEventLogStore" href="#SecurityEventLogStore">type SecurityEventLogStore struct</a>

```
searchKey: database.SecurityEventLogStore
```

```Go
type SecurityEventLogStore struct {
	*basestore.Store
}
```

A SecurityEventLogStore provides persistence for security events. 

#### <a id="SecurityEventLogs" href="#SecurityEventLogs">func SecurityEventLogs(db dbutil.DB) *SecurityEventLogStore</a>

```
searchKey: database.SecurityEventLogs
```

```Go
func SecurityEventLogs(db dbutil.DB) *SecurityEventLogStore
```

SecurityEventLogs instantiates and returns a new SecurityEventLogStore with prepared statements. 

#### <a id="SecurityEventLogStore.Insert" href="#SecurityEventLogStore.Insert">func (s *SecurityEventLogStore) Insert(ctx context.Context, e *SecurityEvent) error</a>

```
searchKey: database.SecurityEventLogStore.Insert
```

```Go
func (s *SecurityEventLogStore) Insert(ctx context.Context, e *SecurityEvent) error
```

Insert adds a new security event to the store. 

### <a id="SettingStore" href="#SettingStore">type SettingStore struct</a>

```
searchKey: database.SettingStore
```

```Go
type SettingStore struct {
	*basestore.Store
}
```

#### <a id="Settings" href="#Settings">func Settings(db dbutil.DB) *SettingStore</a>

```
searchKey: database.Settings
```

```Go
func Settings(db dbutil.DB) *SettingStore
```

Settings instantiates and returns a new SettingStore with prepared statements. 

#### <a id="SettingsWith" href="#SettingsWith">func SettingsWith(other basestore.ShareableStore) *SettingStore</a>

```
searchKey: database.SettingsWith
```

```Go
func SettingsWith(other basestore.ShareableStore) *SettingStore
```

NewSettingStoreWithDB instantiates and returns a new SettingStore using the other store handle. 

#### <a id="SettingStore.With" href="#SettingStore.With">func (s *SettingStore) With(other basestore.ShareableStore) *SettingStore</a>

```
searchKey: database.SettingStore.With
```

```Go
func (s *SettingStore) With(other basestore.ShareableStore) *SettingStore
```

#### <a id="SettingStore.Transact" href="#SettingStore.Transact">func (s *SettingStore) Transact(ctx context.Context) (*SettingStore, error)</a>

```
searchKey: database.SettingStore.Transact
```

```Go
func (s *SettingStore) Transact(ctx context.Context) (*SettingStore, error)
```

#### <a id="SettingStore.CreateIfUpToDate" href="#SettingStore.CreateIfUpToDate">func (o *SettingStore) CreateIfUpToDate(ctx context.Context, subject api.SettingsSubject, lastID *int32, authorUserID *int32, contents string) (latestSetting *api.Settings, err error)</a>

```
searchKey: database.SettingStore.CreateIfUpToDate
```

```Go
func (o *SettingStore) CreateIfUpToDate(ctx context.Context, subject api.SettingsSubject, lastID *int32, authorUserID *int32, contents string) (latestSetting *api.Settings, err error)
```

#### <a id="SettingStore.GetLatest" href="#SettingStore.GetLatest">func (o *SettingStore) GetLatest(ctx context.Context, subject api.SettingsSubject) (*api.Settings, error)</a>

```
searchKey: database.SettingStore.GetLatest
```

```Go
func (o *SettingStore) GetLatest(ctx context.Context, subject api.SettingsSubject) (*api.Settings, error)
```

#### <a id="SettingStore.GetLastestSchemaSettings" href="#SettingStore.GetLastestSchemaSettings">func (o *SettingStore) GetLastestSchemaSettings(ctx context.Context, subject api.SettingsSubject) (*schema.Settings, error)</a>

```
searchKey: database.SettingStore.GetLastestSchemaSettings
```

```Go
func (o *SettingStore) GetLastestSchemaSettings(ctx context.Context, subject api.SettingsSubject) (*schema.Settings, error)
```

#### <a id="SettingStore.ListAll" href="#SettingStore.ListAll">func (o *SettingStore) ListAll(ctx context.Context, impreciseSubstring string) (_ []*api.Settings, err error)</a>

```
searchKey: database.SettingStore.ListAll
```

```Go
func (o *SettingStore) ListAll(ctx context.Context, impreciseSubstring string) (_ []*api.Settings, err error)
```

ListAll lists ALL settings (across all users, orgs, etc). 

If impreciseSubstring is given, only settings whose raw JSONC string contains the substring are returned. This is only intended for use by migration code that needs to update settings, where limiting to matching settings can significantly narrow the amount of work necessary. For example, a migration to rename a settings property `foo` to `bar` would narrow the search space by only processing settings that contain the string `foo` (which will yield false positives, but that's acceptable because the migration shouldn't modify those results anyway). 

🚨 SECURITY: This method does NOT verify the user is an admin. The caller is responsible for ensuring this or that the response never makes it to a user. 

#### <a id="SettingStore.getLatest" href="#SettingStore.getLatest">func (o *SettingStore) getLatest(ctx context.Context, subject api.SettingsSubject) (*api.Settings, error)</a>

```
searchKey: database.SettingStore.getLatest
tags: [private]
```

```Go
func (o *SettingStore) getLatest(ctx context.Context, subject api.SettingsSubject) (*api.Settings, error)
```

#### <a id="SettingStore.parseQueryRows" href="#SettingStore.parseQueryRows">func (o *SettingStore) parseQueryRows(ctx context.Context, rows *sql.Rows) ([]*api.Settings, error)</a>

```
searchKey: database.SettingStore.parseQueryRows
tags: [private]
```

```Go
func (o *SettingStore) parseQueryRows(ctx context.Context, rows *sql.Rows) ([]*api.Settings, error)
```

### <a id="MockSettings" href="#MockSettings">type MockSettings struct</a>

```
searchKey: database.MockSettings
```

```Go
type MockSettings struct {
	GetLatest        func(ctx context.Context, subject api.SettingsSubject) (*api.Settings, error)
	CreateIfUpToDate func(ctx context.Context, subject api.SettingsSubject, lastID, authorUserID *int32, contents string) (latestSetting *api.Settings, err error)
}
```

### <a id="SurveyResponseListOptions" href="#SurveyResponseListOptions">type SurveyResponseListOptions struct</a>

```
searchKey: database.SurveyResponseListOptions
```

```Go
type SurveyResponseListOptions struct {
	*LimitOffset
}
```

SurveyResponseListOptions specifies the options for listing survey responses. 

### <a id="SurveyResponseStore" href="#SurveyResponseStore">type SurveyResponseStore struct</a>

```
searchKey: database.SurveyResponseStore
```

```Go
type SurveyResponseStore struct {
	*basestore.Store
}
```

#### <a id="SurveyResponses" href="#SurveyResponses">func SurveyResponses(db dbutil.DB) *SurveyResponseStore</a>

```
searchKey: database.SurveyResponses
```

```Go
func SurveyResponses(db dbutil.DB) *SurveyResponseStore
```

SurveyResponses instantiates and returns a new SurveyResponseStore with prepared statements. 

#### <a id="SurveyResponsesWith" href="#SurveyResponsesWith">func SurveyResponsesWith(other basestore.ShareableStore) *SurveyResponseStore</a>

```
searchKey: database.SurveyResponsesWith
```

```Go
func SurveyResponsesWith(other basestore.ShareableStore) *SurveyResponseStore
```

NewSurveyResponseStoreWithDB instantiates and returns a new SurveyResponseStore using the other store handle. 

#### <a id="SurveyResponseStore.With" href="#SurveyResponseStore.With">func (s *SurveyResponseStore) With(other basestore.ShareableStore) *SurveyResponseStore</a>

```
searchKey: database.SurveyResponseStore.With
```

```Go
func (s *SurveyResponseStore) With(other basestore.ShareableStore) *SurveyResponseStore
```

#### <a id="SurveyResponseStore.Transact" href="#SurveyResponseStore.Transact">func (s *SurveyResponseStore) Transact(ctx context.Context) (*SurveyResponseStore, error)</a>

```
searchKey: database.SurveyResponseStore.Transact
```

```Go
func (s *SurveyResponseStore) Transact(ctx context.Context) (*SurveyResponseStore, error)
```

#### <a id="SurveyResponseStore.Create" href="#SurveyResponseStore.Create">func (s *SurveyResponseStore) Create(ctx context.Context, userID *int32, email *string, score int, reason *string, better *string) (id int64, err error)</a>

```
searchKey: database.SurveyResponseStore.Create
```

```Go
func (s *SurveyResponseStore) Create(ctx context.Context, userID *int32, email *string, score int, reason *string, better *string) (id int64, err error)
```

Create creates a survey response. 

#### <a id="SurveyResponseStore.getBySQL" href="#SurveyResponseStore.getBySQL">func (s *SurveyResponseStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.SurveyResponse, error)</a>

```
searchKey: database.SurveyResponseStore.getBySQL
tags: [private]
```

```Go
func (s *SurveyResponseStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*types.SurveyResponse, error)
```

#### <a id="SurveyResponseStore.GetAll" href="#SurveyResponseStore.GetAll">func (s *SurveyResponseStore) GetAll(ctx context.Context) ([]*types.SurveyResponse, error)</a>

```
searchKey: database.SurveyResponseStore.GetAll
```

```Go
func (s *SurveyResponseStore) GetAll(ctx context.Context) ([]*types.SurveyResponse, error)
```

GetAll gets all survey responses. 

#### <a id="SurveyResponseStore.GetByUserID" href="#SurveyResponseStore.GetByUserID">func (s *SurveyResponseStore) GetByUserID(ctx context.Context, userID int32) ([]*types.SurveyResponse, error)</a>

```
searchKey: database.SurveyResponseStore.GetByUserID
```

```Go
func (s *SurveyResponseStore) GetByUserID(ctx context.Context, userID int32) ([]*types.SurveyResponse, error)
```

GetByUserID gets all survey responses by a given user. 

#### <a id="SurveyResponseStore.Count" href="#SurveyResponseStore.Count">func (s *SurveyResponseStore) Count(ctx context.Context) (int, error)</a>

```
searchKey: database.SurveyResponseStore.Count
```

```Go
func (s *SurveyResponseStore) Count(ctx context.Context) (int, error)
```

Count returns the count of all survey responses. 

#### <a id="SurveyResponseStore.Last30DaysAverageScore" href="#SurveyResponseStore.Last30DaysAverageScore">func (s *SurveyResponseStore) Last30DaysAverageScore(ctx context.Context) (float64, error)</a>

```
searchKey: database.SurveyResponseStore.Last30DaysAverageScore
```

```Go
func (s *SurveyResponseStore) Last30DaysAverageScore(ctx context.Context) (float64, error)
```

Last30DaysAverageScore returns the average score for all surveys submitted in the last 30 days. 

#### <a id="SurveyResponseStore.Last30DaysNetPromoterScore" href="#SurveyResponseStore.Last30DaysNetPromoterScore">func (s *SurveyResponseStore) Last30DaysNetPromoterScore(ctx context.Context) (int, error)</a>

```
searchKey: database.SurveyResponseStore.Last30DaysNetPromoterScore
```

```Go
func (s *SurveyResponseStore) Last30DaysNetPromoterScore(ctx context.Context) (int, error)
```

Last30DaysNPS returns the net promoter score for all surveys submitted in the last 30 days. This is calculated as 100*((% of responses that are >= 9) - (% of responses that are <= 6)) 

#### <a id="SurveyResponseStore.Last30DaysCount" href="#SurveyResponseStore.Last30DaysCount">func (s *SurveyResponseStore) Last30DaysCount(ctx context.Context) (int, error)</a>

```
searchKey: database.SurveyResponseStore.Last30DaysCount
```

```Go
func (s *SurveyResponseStore) Last30DaysCount(ctx context.Context) (int, error)
```

Last30Count returns the count of surveys submitted in the last 30 days. 

### <a id="UserCredential" href="#UserCredential">type UserCredential struct</a>

```
searchKey: database.UserCredential
```

```Go
type UserCredential struct {
	ID                  int64
	Domain              string
	UserID              int32
	ExternalServiceType string
	ExternalServiceID   string
	EncryptedCredential []byte
	EncryptionKeyID     string
	CreatedAt           time.Time
	UpdatedAt           time.Time

	// TODO(batch-change-credential-encryption): On or after Sourcegraph 3.30,
	// we should remove the credential and SSHMigrationApplied fields.
	SSHMigrationApplied bool

	key encryption.Key
}
```

UserCredential represents a row in the `user_credentials` table. 

#### <a id="UserCredential.Authenticator" href="#UserCredential.Authenticator">func (uc *UserCredential) Authenticator(ctx context.Context) (auth.Authenticator, error)</a>

```
searchKey: database.UserCredential.Authenticator
```

```Go
func (uc *UserCredential) Authenticator(ctx context.Context) (auth.Authenticator, error)
```

Authenticator decrypts and creates the authenticator associated with the user credential. 

#### <a id="UserCredential.SetAuthenticator" href="#UserCredential.SetAuthenticator">func (uc *UserCredential) SetAuthenticator(ctx context.Context, a auth.Authenticator) error</a>

```
searchKey: database.UserCredential.SetAuthenticator
```

```Go
func (uc *UserCredential) SetAuthenticator(ctx context.Context, a auth.Authenticator) error
```

SetAuthenticator encrypts and sets the authenticator within the user credential. 

### <a id="UserCredentialNotFoundErr" href="#UserCredentialNotFoundErr">type UserCredentialNotFoundErr struct</a>

```
searchKey: database.UserCredentialNotFoundErr
```

```Go
type UserCredentialNotFoundErr struct{ args []interface{} }
```

UserCredentialNotFoundErr is returned when a credential cannot be found from its ID or scope. 

#### <a id="UserCredentialNotFoundErr.Error" href="#UserCredentialNotFoundErr.Error">func (err UserCredentialNotFoundErr) Error() string</a>

```
searchKey: database.UserCredentialNotFoundErr.Error
```

```Go
func (err UserCredentialNotFoundErr) Error() string
```

#### <a id="UserCredentialNotFoundErr.NotFound" href="#UserCredentialNotFoundErr.NotFound">func (UserCredentialNotFoundErr) NotFound() bool</a>

```
searchKey: database.UserCredentialNotFoundErr.NotFound
```

```Go
func (UserCredentialNotFoundErr) NotFound() bool
```

### <a id="UserCredentialsStore" href="#UserCredentialsStore">type UserCredentialsStore struct</a>

```
searchKey: database.UserCredentialsStore
```

```Go
type UserCredentialsStore struct {
	*basestore.Store
	key encryption.Key
}
```

UserCredentialsStore provides access to the `user_credentials` table. 

#### <a id="UserCredentials" href="#UserCredentials">func UserCredentials(db dbutil.DB, key encryption.Key) *UserCredentialsStore</a>

```
searchKey: database.UserCredentials
```

```Go
func UserCredentials(db dbutil.DB, key encryption.Key) *UserCredentialsStore
```

UserCredentials instantiates and returns a new UserCredentialsStore with prepared statements. 

#### <a id="UserCredentialsWith" href="#UserCredentialsWith">func UserCredentialsWith(other basestore.ShareableStore, key encryption.Key) *UserCredentialsStore</a>

```
searchKey: database.UserCredentialsWith
```

```Go
func UserCredentialsWith(other basestore.ShareableStore, key encryption.Key) *UserCredentialsStore
```

UserCredentialsWith instantiates and returns a new UserCredentialsStore using the other store handle. 

#### <a id="UserCredentialsStore.With" href="#UserCredentialsStore.With">func (s *UserCredentialsStore) With(other basestore.ShareableStore) *UserCredentialsStore</a>

```
searchKey: database.UserCredentialsStore.With
```

```Go
func (s *UserCredentialsStore) With(other basestore.ShareableStore) *UserCredentialsStore
```

#### <a id="UserCredentialsStore.Transact" href="#UserCredentialsStore.Transact">func (s *UserCredentialsStore) Transact(ctx context.Context) (*UserCredentialsStore, error)</a>

```
searchKey: database.UserCredentialsStore.Transact
```

```Go
func (s *UserCredentialsStore) Transact(ctx context.Context) (*UserCredentialsStore, error)
```

#### <a id="UserCredentialsStore.Create" href="#UserCredentialsStore.Create">func (s *UserCredentialsStore) Create(ctx context.Context, scope UserCredentialScope, credential auth.Authenticator) (*UserCredential, error)</a>

```
searchKey: database.UserCredentialsStore.Create
```

```Go
func (s *UserCredentialsStore) Create(ctx context.Context, scope UserCredentialScope, credential auth.Authenticator) (*UserCredential, error)
```

Create creates a new user credential based on the given scope and authenticator. If the scope already has a credential, an error will be returned. 

#### <a id="UserCredentialsStore.Update" href="#UserCredentialsStore.Update">func (s *UserCredentialsStore) Update(ctx context.Context, credential *UserCredential) error</a>

```
searchKey: database.UserCredentialsStore.Update
```

```Go
func (s *UserCredentialsStore) Update(ctx context.Context, credential *UserCredential) error
```

Update updates a user credential in the database. If the credential cannot be found, an error is returned. 

#### <a id="UserCredentialsStore.Delete" href="#UserCredentialsStore.Delete">func (s *UserCredentialsStore) Delete(ctx context.Context, id int64) error</a>

```
searchKey: database.UserCredentialsStore.Delete
```

```Go
func (s *UserCredentialsStore) Delete(ctx context.Context, id int64) error
```

Delete deletes the given user credential. Note that there is no concept of a soft delete with user credentials: once deleted, the relevant records are _gone_, so that we don't hold any sensitive data unexpectedly. 💀 

#### <a id="UserCredentialsStore.GetByID" href="#UserCredentialsStore.GetByID">func (s *UserCredentialsStore) GetByID(ctx context.Context, id int64) (*UserCredential, error)</a>

```
searchKey: database.UserCredentialsStore.GetByID
```

```Go
func (s *UserCredentialsStore) GetByID(ctx context.Context, id int64) (*UserCredential, error)
```

GetByID returns the user credential matching the given ID, or UserCredentialNotFoundErr if no such credential exists. 

#### <a id="UserCredentialsStore.GetByScope" href="#UserCredentialsStore.GetByScope">func (s *UserCredentialsStore) GetByScope(ctx context.Context, scope UserCredentialScope) (*UserCredential, error)</a>

```
searchKey: database.UserCredentialsStore.GetByScope
```

```Go
func (s *UserCredentialsStore) GetByScope(ctx context.Context, scope UserCredentialScope) (*UserCredential, error)
```

GetByScope returns the user credential matching the given scope, or UserCredentialNotFoundErr if no such credential exists. 

#### <a id="UserCredentialsStore.List" href="#UserCredentialsStore.List">func (s *UserCredentialsStore) List(ctx context.Context, opts UserCredentialsListOpts) ([]*UserCredential, int, error)</a>

```
searchKey: database.UserCredentialsStore.List
```

```Go
func (s *UserCredentialsStore) List(ctx context.Context, opts UserCredentialsListOpts) ([]*UserCredential, int, error)
```

List returns all user credentials matching the given options. 

### <a id="UserCredentialScope" href="#UserCredentialScope">type UserCredentialScope struct</a>

```
searchKey: database.UserCredentialScope
```

```Go
type UserCredentialScope struct {
	Domain              string
	UserID              int32
	ExternalServiceType string
	ExternalServiceID   string
}
```

UserCredentialScope represents the unique scope for a credential. Only one credential may exist within a scope. 

### <a id="UserCredentialsListOpts" href="#UserCredentialsListOpts">type UserCredentialsListOpts struct</a>

```
searchKey: database.UserCredentialsListOpts
```

```Go
type UserCredentialsListOpts struct {
	*LimitOffset
	Scope     UserCredentialScope
	ForUpdate bool

	// TODO(batch-change-credential-encryption): this should be removed once the
	// OOB SSH migration is removed.
	SSHMigrationApplied *bool

	// TODO(batch-change-credential-encryption): this should be removed once the
	// OOB user credential migration is removed.
	RequiresMigration bool

	// TODO(batch-change-credential-encryption): this should be removed once the
	// OOB user credential migration is removed.
	OnlyEncrypted bool
}
```

UserCredentialsListOpts provide the options when listing credentials. At least one field in Scope must be set. 

#### <a id="UserCredentialsListOpts.sql" href="#UserCredentialsListOpts.sql">func (opts *UserCredentialsListOpts) sql() *sqlf.Query</a>

```
searchKey: database.UserCredentialsListOpts.sql
tags: [private]
```

```Go
func (opts *UserCredentialsListOpts) sql() *sqlf.Query
```

sql overrides LimitOffset.SQL() to give a LIMIT clause with one extra value so we can populate the next cursor. 

### <a id="MockUserCredentials" href="#MockUserCredentials">type MockUserCredentials struct</a>

```
searchKey: database.MockUserCredentials
```

```Go
type MockUserCredentials struct {
	Create     func(context.Context, UserCredentialScope, auth.Authenticator) (*UserCredential, error)
	Update     func(ctx context.Context, credential *UserCredential) error
	Delete     func(context.Context, int64) error
	GetByID    func(context.Context, int64) (*UserCredential, error)
	GetByScope func(context.Context, UserCredentialScope) (*UserCredential, error)
	List       func(context.Context, UserCredentialsListOpts) ([]*UserCredential, int, error)
}
```

### <a id="UserEmail" href="#UserEmail">type UserEmail struct</a>

```
searchKey: database.UserEmail
```

```Go
type UserEmail struct {
	UserID                 int32
	Email                  string
	CreatedAt              time.Time
	VerificationCode       *string
	VerifiedAt             *time.Time
	LastVerificationSentAt *time.Time
	Primary                bool
}
```

UserEmail represents a row in the `user_emails` table. 

#### <a id="UserEmail.NeedsVerificationCoolDown" href="#UserEmail.NeedsVerificationCoolDown">func (email *UserEmail) NeedsVerificationCoolDown() bool</a>

```
searchKey: database.UserEmail.NeedsVerificationCoolDown
```

```Go
func (email *UserEmail) NeedsVerificationCoolDown() bool
```

NeedsVerificationCoolDown returns true if the verification cooled down time is behind current time. 

### <a id="userEmailNotFoundError" href="#userEmailNotFoundError">type userEmailNotFoundError struct</a>

```
searchKey: database.userEmailNotFoundError
tags: [private]
```

```Go
type userEmailNotFoundError struct {
	args []interface{}
}
```

userEmailNotFoundError is the error that is returned when a user email is not found. 

#### <a id="userEmailNotFoundError.Error" href="#userEmailNotFoundError.Error">func (err userEmailNotFoundError) Error() string</a>

```
searchKey: database.userEmailNotFoundError.Error
tags: [private]
```

```Go
func (err userEmailNotFoundError) Error() string
```

#### <a id="userEmailNotFoundError.NotFound" href="#userEmailNotFoundError.NotFound">func (err userEmailNotFoundError) NotFound() bool</a>

```
searchKey: database.userEmailNotFoundError.NotFound
tags: [private]
```

```Go
func (err userEmailNotFoundError) NotFound() bool
```

### <a id="UserEmailsStore" href="#UserEmailsStore">type UserEmailsStore struct</a>

```
searchKey: database.UserEmailsStore
```

```Go
type UserEmailsStore struct {
	*basestore.Store

	once sync.Once
}
```

UserEmailsStore provides access to the `user_emails` table. 

#### <a id="UserEmails" href="#UserEmails">func UserEmails(db dbutil.DB) *UserEmailsStore</a>

```
searchKey: database.UserEmails
```

```Go
func UserEmails(db dbutil.DB) *UserEmailsStore
```

UserEmails instantiates and returns a new UserEmailsStore with prepared statements. 

#### <a id="UserEmailsWith" href="#UserEmailsWith">func UserEmailsWith(other basestore.ShareableStore) *UserEmailsStore</a>

```
searchKey: database.UserEmailsWith
```

```Go
func UserEmailsWith(other basestore.ShareableStore) *UserEmailsStore
```

UserEmailsWith instantiates and returns a new UserEmailsStore using the other store handle. 

#### <a id="UserEmailsStore.With" href="#UserEmailsStore.With">func (s *UserEmailsStore) With(other basestore.ShareableStore) *UserEmailsStore</a>

```
searchKey: database.UserEmailsStore.With
```

```Go
func (s *UserEmailsStore) With(other basestore.ShareableStore) *UserEmailsStore
```

#### <a id="UserEmailsStore.Transact" href="#UserEmailsStore.Transact">func (s *UserEmailsStore) Transact(ctx context.Context) (*UserEmailsStore, error)</a>

```
searchKey: database.UserEmailsStore.Transact
```

```Go
func (s *UserEmailsStore) Transact(ctx context.Context) (*UserEmailsStore, error)
```

#### <a id="UserEmailsStore.ensureStore" href="#UserEmailsStore.ensureStore">func (s *UserEmailsStore) ensureStore()</a>

```
searchKey: database.UserEmailsStore.ensureStore
tags: [private]
```

```Go
func (s *UserEmailsStore) ensureStore()
```

ensureStore instantiates a basestore.Store if necessary, using the dbconn.Global handle. This function ensures access to dbconn happens after the rest of the code or tests have initialized it. 

#### <a id="UserEmailsStore.GetInitialSiteAdminEmail" href="#UserEmailsStore.GetInitialSiteAdminEmail">func (s *UserEmailsStore) GetInitialSiteAdminEmail(ctx context.Context) (email string, err error)</a>

```
searchKey: database.UserEmailsStore.GetInitialSiteAdminEmail
```

```Go
func (s *UserEmailsStore) GetInitialSiteAdminEmail(ctx context.Context) (email string, err error)
```

GetInitialSiteAdminEmail returns a best guess of the email of the initial Sourcegraph installer/site admin. Because the initial site admin's email isn't marked, this returns the email of the active site admin with the lowest user ID. 

If the site has not yet been initialized, returns an empty string. 

#### <a id="UserEmailsStore.GetPrimaryEmail" href="#UserEmailsStore.GetPrimaryEmail">func (s *UserEmailsStore) GetPrimaryEmail(ctx context.Context, id int32) (email string, verified bool, err error)</a>

```
searchKey: database.UserEmailsStore.GetPrimaryEmail
```

```Go
func (s *UserEmailsStore) GetPrimaryEmail(ctx context.Context, id int32) (email string, verified bool, err error)
```

GetPrimaryEmail gets the oldest email associated with the user, preferring a verified email to an unverified email. 

#### <a id="UserEmailsStore.SetPrimaryEmail" href="#UserEmailsStore.SetPrimaryEmail">func (s *UserEmailsStore) SetPrimaryEmail(ctx context.Context, userID int32, email string) error</a>

```
searchKey: database.UserEmailsStore.SetPrimaryEmail
```

```Go
func (s *UserEmailsStore) SetPrimaryEmail(ctx context.Context, userID int32, email string) error
```

SetPrimaryEmail sets the primary email for a user. The address must be verified. All other addresses for the user will be set as not primary. 

#### <a id="UserEmailsStore.Get" href="#UserEmailsStore.Get">func (s *UserEmailsStore) Get(ctx context.Context, userID int32, email string) (emailCanonicalCase string, verified bool, err error)</a>

```
searchKey: database.UserEmailsStore.Get
```

```Go
func (s *UserEmailsStore) Get(ctx context.Context, userID int32, email string) (emailCanonicalCase string, verified bool, err error)
```

Get gets information about the user's associated email address. 

#### <a id="UserEmailsStore.Add" href="#UserEmailsStore.Add">func (s *UserEmailsStore) Add(ctx context.Context, userID int32, email string, verificationCode *string) error</a>

```
searchKey: database.UserEmailsStore.Add
```

```Go
func (s *UserEmailsStore) Add(ctx context.Context, userID int32, email string, verificationCode *string) error
```

Add adds new user email. When added, it is always unverified. 

#### <a id="UserEmailsStore.Remove" href="#UserEmailsStore.Remove">func (s *UserEmailsStore) Remove(ctx context.Context, userID int32, email string) error</a>

```
searchKey: database.UserEmailsStore.Remove
```

```Go
func (s *UserEmailsStore) Remove(ctx context.Context, userID int32, email string) error
```

Remove removes a user email. It returns an error if there is no such email associated with the user or the email is the user's primary address 

#### <a id="UserEmailsStore.Verify" href="#UserEmailsStore.Verify">func (s *UserEmailsStore) Verify(ctx context.Context, userID int32, email, code string) (bool, error)</a>

```
searchKey: database.UserEmailsStore.Verify
```

```Go
func (s *UserEmailsStore) Verify(ctx context.Context, userID int32, email, code string) (bool, error)
```

Verify verifies the user's email address given the email verification code. If the code is not correct (not the one originally used when creating the user or adding the user email), then it returns false. 

#### <a id="UserEmailsStore.SetVerified" href="#UserEmailsStore.SetVerified">func (s *UserEmailsStore) SetVerified(ctx context.Context, userID int32, email string, verified bool) error</a>

```
searchKey: database.UserEmailsStore.SetVerified
```

```Go
func (s *UserEmailsStore) SetVerified(ctx context.Context, userID int32, email string, verified bool) error
```

SetVerified bypasses the normal email verification code process and manually sets the verified status for an email. 

#### <a id="UserEmailsStore.SetLastVerification" href="#UserEmailsStore.SetLastVerification">func (s *UserEmailsStore) SetLastVerification(ctx context.Context, userID int32, email, code string) error</a>

```
searchKey: database.UserEmailsStore.SetLastVerification
```

```Go
func (s *UserEmailsStore) SetLastVerification(ctx context.Context, userID int32, email, code string) error
```

SetLastVerification sets the "last_verification_sent_at" column to now() and updates the verification code for given email of the user. 

#### <a id="UserEmailsStore.GetLatestVerificationSentEmail" href="#UserEmailsStore.GetLatestVerificationSentEmail">func (s *UserEmailsStore) GetLatestVerificationSentEmail(ctx context.Context, email string) (*UserEmail, error)</a>

```
searchKey: database.UserEmailsStore.GetLatestVerificationSentEmail
```

```Go
func (s *UserEmailsStore) GetLatestVerificationSentEmail(ctx context.Context, email string) (*UserEmail, error)
```

GetLatestVerificationSentEmail returns the email with the lastest time of "last_verification_sent_at" column, it excludes rows with "last_verification_sent_at IS NULL". 

#### <a id="UserEmailsStore.GetVerifiedEmails" href="#UserEmailsStore.GetVerifiedEmails">func (s *UserEmailsStore) GetVerifiedEmails(ctx context.Context, emails ...string) ([]*UserEmail, error)</a>

```
searchKey: database.UserEmailsStore.GetVerifiedEmails
```

```Go
func (s *UserEmailsStore) GetVerifiedEmails(ctx context.Context, emails ...string) ([]*UserEmail, error)
```

GetVerifiedEmails returns a list of verified emails from the candidate list. Some emails are excluded from the results list because of unverified or simply don't exist. 

#### <a id="UserEmailsStore.ListByUser" href="#UserEmailsStore.ListByUser">func (s *UserEmailsStore) ListByUser(ctx context.Context, opt UserEmailsListOptions) ([]*UserEmail, error)</a>

```
searchKey: database.UserEmailsStore.ListByUser
```

```Go
func (s *UserEmailsStore) ListByUser(ctx context.Context, opt UserEmailsListOptions) ([]*UserEmail, error)
```

ListByUser returns a list of emails that are associated to the given user. 

#### <a id="UserEmailsStore.getBySQL" href="#UserEmailsStore.getBySQL">func (s *UserEmailsStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*UserEmail, error)</a>

```
searchKey: database.UserEmailsStore.getBySQL
tags: [private]
```

```Go
func (s *UserEmailsStore) getBySQL(ctx context.Context, query string, args ...interface{}) ([]*UserEmail, error)
```

getBySQL returns user emails matching the SQL query, if any exist. 

### <a id="UserEmailsListOptions" href="#UserEmailsListOptions">type UserEmailsListOptions struct</a>

```
searchKey: database.UserEmailsListOptions
```

```Go
type UserEmailsListOptions struct {
	// UserID specifies the id of the user for listing emails.
	UserID int32
	// OnlyVerified excludes unverified emails from the list.
	OnlyVerified bool
}
```

UserEmailsListOptions specifies the options for listing user emails. 

### <a id="MockUserEmails" href="#MockUserEmails">type MockUserEmails struct</a>

```
searchKey: database.MockUserEmails
```

```Go
type MockUserEmails struct {
	GetPrimaryEmail                func(ctx context.Context, id int32) (email string, verified bool, err error)
	Get                            func(userID int32, email string) (emailCanonicalCase string, verified bool, err error)
	SetVerified                    func(ctx context.Context, userID int32, email string, verified bool) error
	SetLastVerification            func(ctx context.Context, userID int32, email, code string) error
	GetLatestVerificationSentEmail func(ctx context.Context, email string) (*UserEmail, error)
	GetVerifiedEmails              func(ctx context.Context, emails ...string) ([]*UserEmail, error)
	ListByUser                     func(ctx context.Context, opt UserEmailsListOptions) ([]*UserEmail, error)
}
```

### <a id="UserPublicRepoStore" href="#UserPublicRepoStore">type UserPublicRepoStore struct</a>

```
searchKey: database.UserPublicRepoStore
```

```Go
type UserPublicRepoStore struct {
	store *basestore.Store
}
```

#### <a id="UserPublicRepos" href="#UserPublicRepos">func UserPublicRepos(db dbutil.DB) *UserPublicRepoStore</a>

```
searchKey: database.UserPublicRepos
```

```Go
func UserPublicRepos(db dbutil.DB) *UserPublicRepoStore
```

#### <a id="UserPublicReposWithStore" href="#UserPublicReposWithStore">func UserPublicReposWithStore(store *basestore.Store) *UserPublicRepoStore</a>

```
searchKey: database.UserPublicReposWithStore
```

```Go
func UserPublicReposWithStore(store *basestore.Store) *UserPublicRepoStore
```

#### <a id="UserPublicRepoStore.SetUserRepos" href="#UserPublicRepoStore.SetUserRepos">func (s *UserPublicRepoStore) SetUserRepos(ctx context.Context, userID int32, repos []UserPublicRepo) (err error)</a>

```
searchKey: database.UserPublicRepoStore.SetUserRepos
```

```Go
func (s *UserPublicRepoStore) SetUserRepos(ctx context.Context, userID int32, repos []UserPublicRepo) (err error)
```

SetUserRepos replaces all the repos in user_public_repos for the passed user ID 

#### <a id="UserPublicRepoStore.SetUserRepo" href="#UserPublicRepoStore.SetUserRepo">func (s *UserPublicRepoStore) SetUserRepo(ctx context.Context, upr UserPublicRepo) error</a>

```
searchKey: database.UserPublicRepoStore.SetUserRepo
```

```Go
func (s *UserPublicRepoStore) SetUserRepo(ctx context.Context, upr UserPublicRepo) error
```

SetUserRepo stores a UserPublicRepo record, if a record already exists for the same user_id & repo_id combo, the repo_uri is updated 

#### <a id="UserPublicRepoStore.ListByUser" href="#UserPublicRepoStore.ListByUser">func (s *UserPublicRepoStore) ListByUser(ctx context.Context, userID int32) ([]UserPublicRepo, error)</a>

```
searchKey: database.UserPublicRepoStore.ListByUser
```

```Go
func (s *UserPublicRepoStore) ListByUser(ctx context.Context, userID int32) ([]UserPublicRepo, error)
```

### <a id="UserPublicRepo" href="#UserPublicRepo">type UserPublicRepo struct</a>

```
searchKey: database.UserPublicRepo
```

```Go
type UserPublicRepo struct {
	UserID  int32
	RepoURI string
	RepoID  api.RepoID
}
```

### <a id="MockUserPublicRepos" href="#MockUserPublicRepos">type MockUserPublicRepos struct</a>

```
searchKey: database.MockUserPublicRepos
```

```Go
type MockUserPublicRepos struct {
	ListByUser func(ctx context.Context, userID int32) ([]UserPublicRepo, error)
}
```

### <a id="UserStore" href="#UserStore">type UserStore struct</a>

```
searchKey: database.UserStore
```

```Go
type UserStore struct {
	*basestore.Store

	once sync.Once
}
```

UserStore provides access to the `users` table. 

For a detailed overview of the schema, see schema.md. 

#### <a id="Users" href="#Users">func Users(db dbutil.DB) *UserStore</a>

```
searchKey: database.Users
```

```Go
func Users(db dbutil.DB) *UserStore
```

Users instantiates and returns a new RepoStore with prepared statements. 

#### <a id="UsersWith" href="#UsersWith">func UsersWith(other basestore.ShareableStore) *UserStore</a>

```
searchKey: database.UsersWith
```

```Go
func UsersWith(other basestore.ShareableStore) *UserStore
```

UsersWith instantiates and returns a new RepoStore using the other store handle. 

#### <a id="UserStore.With" href="#UserStore.With">func (u *UserStore) With(other basestore.ShareableStore) *UserStore</a>

```
searchKey: database.UserStore.With
```

```Go
func (u *UserStore) With(other basestore.ShareableStore) *UserStore
```

#### <a id="UserStore.Transact" href="#UserStore.Transact">func (u *UserStore) Transact(ctx context.Context) (*UserStore, error)</a>

```
searchKey: database.UserStore.Transact
```

```Go
func (u *UserStore) Transact(ctx context.Context) (*UserStore, error)
```

#### <a id="UserStore.ensureStore" href="#UserStore.ensureStore">func (u *UserStore) ensureStore()</a>

```
searchKey: database.UserStore.ensureStore
tags: [private]
```

```Go
func (u *UserStore) ensureStore()
```

ensureStore instantiates a basestore.Store if necessary, using the dbconn.Global handle. This function ensures access to dbconn happens after the rest of the code or tests have initialized it. 

#### <a id="UserStore.Create" href="#UserStore.Create">func (u *UserStore) Create(ctx context.Context, info NewUser) (newUser *types.User, err error)</a>

```
searchKey: database.UserStore.Create
```

```Go
func (u *UserStore) Create(ctx context.Context, info NewUser) (newUser *types.User, err error)
```

Create creates a new user in the database. 

If a password is given, then unauthenticated users can sign into the account using the username/email and password. If no password is given, a non-builtin auth provider must be used to sign into the account. 

### hdr-CREATION_OF_SITE_ADMINSCREATION OF SITE ADMINS
The new user is made to be a site admin if the following are both true: (1) this user would be the first and only user on the server, and (2) the site has not yet been initialized. Otherwise, the user is created as a normal (non-site-admin) user. After the call, the site is marked as having been initialized (so that no subsequent (users).Create calls will yield a site admin). This is used to create the initial site admin user during site initialization. 

It's implemented as part of the (users).Create call instead of relying on the caller to do it in order to avoid a race condition where multiple initial site admins could be created or zero site admins could be created. 

#### <a id="UserStore.create" href="#UserStore.create">func (u *UserStore) create(ctx context.Context, info NewUser) (newUser *types.User, err error)</a>

```
searchKey: database.UserStore.create
tags: [private]
```

```Go
func (u *UserStore) create(ctx context.Context, info NewUser) (newUser *types.User, err error)
```

create is like Create, except it is expected to be run from within a transaction. It must execute in a transaction because the post-user-creation hooks must run atomically with the user creation. 

#### <a id="UserStore.Update" href="#UserStore.Update">func (u *UserStore) Update(ctx context.Context, id int32, update UserUpdate) (err error)</a>

```
searchKey: database.UserStore.Update
```

```Go
func (u *UserStore) Update(ctx context.Context, id int32, update UserUpdate) (err error)
```

Update updates a user's profile information. 

#### <a id="UserStore.Delete" href="#UserStore.Delete">func (u *UserStore) Delete(ctx context.Context, id int32) (err error)</a>

```
searchKey: database.UserStore.Delete
```

```Go
func (u *UserStore) Delete(ctx context.Context, id int32) (err error)
```

Delete performs a soft-delete of the user and all resources associated with this user. 

#### <a id="UserStore.HardDelete" href="#UserStore.HardDelete">func (u *UserStore) HardDelete(ctx context.Context, id int32) (err error)</a>

```
searchKey: database.UserStore.HardDelete
```

```Go
func (u *UserStore) HardDelete(ctx context.Context, id int32) (err error)
```

HardDelete removes the user and all resources associated with this user. 

#### <a id="UserStore.SetIsSiteAdmin" href="#UserStore.SetIsSiteAdmin">func (u *UserStore) SetIsSiteAdmin(ctx context.Context, id int32, isSiteAdmin bool) error</a>

```
searchKey: database.UserStore.SetIsSiteAdmin
```

```Go
func (u *UserStore) SetIsSiteAdmin(ctx context.Context, id int32, isSiteAdmin bool) error
```

SetIsSiteAdmin sets the the user with given ID to be or not to be the site admin. 

#### <a id="UserStore.CheckAndDecrementInviteQuota" href="#UserStore.CheckAndDecrementInviteQuota">func (u *UserStore) CheckAndDecrementInviteQuota(ctx context.Context, userID int32) (ok bool, err error)</a>

```
searchKey: database.UserStore.CheckAndDecrementInviteQuota
```

```Go
func (u *UserStore) CheckAndDecrementInviteQuota(ctx context.Context, userID int32) (ok bool, err error)
```

CheckAndDecrementInviteQuota should be called before the user (identified by userID) is allowed to invite any other user. If ok is false, then the user is not allowed to invite any other user (either because they've invited too many users, or some other error occurred). If the user has quota remaining, their quota is decremented and ok is true. 

#### <a id="UserStore.GetByID" href="#UserStore.GetByID">func (u *UserStore) GetByID(ctx context.Context, id int32) (*types.User, error)</a>

```
searchKey: database.UserStore.GetByID
```

```Go
func (u *UserStore) GetByID(ctx context.Context, id int32) (*types.User, error)
```

#### <a id="UserStore.GetByVerifiedEmail" href="#UserStore.GetByVerifiedEmail">func (u *UserStore) GetByVerifiedEmail(ctx context.Context, email string) (*types.User, error)</a>

```
searchKey: database.UserStore.GetByVerifiedEmail
```

```Go
func (u *UserStore) GetByVerifiedEmail(ctx context.Context, email string) (*types.User, error)
```

GetByVerifiedEmail returns the user (if any) with the specified verified email address. If a user has a matching *unverified* email address, they will not be returned by this method. At most one user may have any given verified email address. 

#### <a id="UserStore.GetByUsername" href="#UserStore.GetByUsername">func (u *UserStore) GetByUsername(ctx context.Context, username string) (*types.User, error)</a>

```
searchKey: database.UserStore.GetByUsername
```

```Go
func (u *UserStore) GetByUsername(ctx context.Context, username string) (*types.User, error)
```

#### <a id="UserStore.GetByUsernames" href="#UserStore.GetByUsernames">func (u *UserStore) GetByUsernames(ctx context.Context, usernames ...string) ([]*types.User, error)</a>

```
searchKey: database.UserStore.GetByUsernames
```

```Go
func (u *UserStore) GetByUsernames(ctx context.Context, usernames ...string) ([]*types.User, error)
```

GetByUsernames returns a list of users by given usernames. The number of results list could be less than the candidate list due to no user is associated with some usernames. 

#### <a id="UserStore.GetByCurrentAuthUser" href="#UserStore.GetByCurrentAuthUser">func (u *UserStore) GetByCurrentAuthUser(ctx context.Context) (*types.User, error)</a>

```
searchKey: database.UserStore.GetByCurrentAuthUser
```

```Go
func (u *UserStore) GetByCurrentAuthUser(ctx context.Context) (*types.User, error)
```

#### <a id="UserStore.InvalidateSessionsByID" href="#UserStore.InvalidateSessionsByID">func (u *UserStore) InvalidateSessionsByID(ctx context.Context, id int32) (err error)</a>

```
searchKey: database.UserStore.InvalidateSessionsByID
```

```Go
func (u *UserStore) InvalidateSessionsByID(ctx context.Context, id int32) (err error)
```

#### <a id="UserStore.Count" href="#UserStore.Count">func (u *UserStore) Count(ctx context.Context, opt *UsersListOptions) (int, error)</a>

```
searchKey: database.UserStore.Count
```

```Go
func (u *UserStore) Count(ctx context.Context, opt *UsersListOptions) (int, error)
```

#### <a id="UserStore.List" href="#UserStore.List">func (u *UserStore) List(ctx context.Context, opt *UsersListOptions) (_ []*types.User, err error)</a>

```
searchKey: database.UserStore.List
```

```Go
func (u *UserStore) List(ctx context.Context, opt *UsersListOptions) (_ []*types.User, err error)
```

#### <a id="UserStore.ListDates" href="#UserStore.ListDates">func (u *UserStore) ListDates(ctx context.Context) (dates []types.UserDates, _ error)</a>

```
searchKey: database.UserStore.ListDates
```

```Go
func (u *UserStore) ListDates(ctx context.Context) (dates []types.UserDates, _ error)
```

ListDates lists all user's created and deleted dates, used by usage stats. 

#### <a id="UserStore.listSQL" href="#UserStore.listSQL">func (*UserStore) listSQL(opt UsersListOptions) (conds []*sqlf.Query)</a>

```
searchKey: database.UserStore.listSQL
tags: [private]
```

```Go
func (*UserStore) listSQL(opt UsersListOptions) (conds []*sqlf.Query)
```

#### <a id="UserStore.getOneBySQL" href="#UserStore.getOneBySQL">func (u *UserStore) getOneBySQL(ctx context.Context, q *sqlf.Query) (*types.User, error)</a>

```
searchKey: database.UserStore.getOneBySQL
tags: [private]
```

```Go
func (u *UserStore) getOneBySQL(ctx context.Context, q *sqlf.Query) (*types.User, error)
```

#### <a id="UserStore.getBySQL" href="#UserStore.getBySQL">func (u *UserStore) getBySQL(ctx context.Context, query *sqlf.Query) ([]*types.User, error)</a>

```
searchKey: database.UserStore.getBySQL
tags: [private]
```

```Go
func (u *UserStore) getBySQL(ctx context.Context, query *sqlf.Query) ([]*types.User, error)
```

getBySQL returns users matching the SQL query, if any exist. 

#### <a id="UserStore.IsPassword" href="#UserStore.IsPassword">func (u *UserStore) IsPassword(ctx context.Context, id int32, password string) (bool, error)</a>

```
searchKey: database.UserStore.IsPassword
```

```Go
func (u *UserStore) IsPassword(ctx context.Context, id int32, password string) (bool, error)
```

#### <a id="UserStore.RenewPasswordResetCode" href="#UserStore.RenewPasswordResetCode">func (u *UserStore) RenewPasswordResetCode(ctx context.Context, id int32) (string, error)</a>

```
searchKey: database.UserStore.RenewPasswordResetCode
```

```Go
func (u *UserStore) RenewPasswordResetCode(ctx context.Context, id int32) (string, error)
```

#### <a id="UserStore.SetPassword" href="#UserStore.SetPassword">func (u *UserStore) SetPassword(ctx context.Context, id int32, resetCode, newPassword string) (bool, error)</a>

```
searchKey: database.UserStore.SetPassword
```

```Go
func (u *UserStore) SetPassword(ctx context.Context, id int32, resetCode, newPassword string) (bool, error)
```

SetPassword sets the user's password given a new password and a password reset code 

#### <a id="UserStore.DeletePasswordResetCode" href="#UserStore.DeletePasswordResetCode">func (u *UserStore) DeletePasswordResetCode(ctx context.Context, id int32) error</a>

```
searchKey: database.UserStore.DeletePasswordResetCode
```

```Go
func (u *UserStore) DeletePasswordResetCode(ctx context.Context, id int32) error
```

#### <a id="UserStore.UpdatePassword" href="#UserStore.UpdatePassword">func (u *UserStore) UpdatePassword(ctx context.Context, id int32, oldPassword, newPassword string) error</a>

```
searchKey: database.UserStore.UpdatePassword
```

```Go
func (u *UserStore) UpdatePassword(ctx context.Context, id int32, oldPassword, newPassword string) error
```

UpdatePassword updates a user's password given the current password. 

#### <a id="UserStore.CreatePassword" href="#UserStore.CreatePassword">func (u *UserStore) CreatePassword(ctx context.Context, id int32, password string) error</a>

```
searchKey: database.UserStore.CreatePassword
```

```Go
func (u *UserStore) CreatePassword(ctx context.Context, id int32, password string) error
```

CreatePassword creates a user's password iff don't have a password and they don't have any valid login connections. 

#### <a id="UserStore.RandomizePasswordAndClearPasswordResetRateLimit" href="#UserStore.RandomizePasswordAndClearPasswordResetRateLimit">func (u *UserStore) RandomizePasswordAndClearPasswordResetRateLimit(ctx context.Context, id int32) error</a>

```
searchKey: database.UserStore.RandomizePasswordAndClearPasswordResetRateLimit
```

```Go
func (u *UserStore) RandomizePasswordAndClearPasswordResetRateLimit(ctx context.Context, id int32) error
```

RandomizePasswordAndClearPasswordResetRateLimit overwrites a user's password with a hard-to-guess random password and clears the password reset rate limit. It is intended to be used by site admins, who can subsequently generate a new password reset code for the user (in case the user has locked themselves out, or in case the site admin wants to initiate a password reset). 

A randomized password is used (instead of an empty password) to avoid bugs where an empty password is considered to be no password. The random password is expected to be irretrievable. 

#### <a id="UserStore.SetTag" href="#UserStore.SetTag">func (u *UserStore) SetTag(ctx context.Context, userID int32, tag string, present bool) error</a>

```
searchKey: database.UserStore.SetTag
```

```Go
func (u *UserStore) SetTag(ctx context.Context, userID int32, tag string, present bool) error
```

SetTag adds (present=true) or removes (present=false) a tag from the given user's set of tags. An error occurs if the user does not exist. Adding a duplicate tag or removing a nonexistent tag is not an error. 

#### <a id="UserStore.HasTag" href="#UserStore.HasTag">func (u *UserStore) HasTag(ctx context.Context, userID int32, tag string) (bool, error)</a>

```
searchKey: database.UserStore.HasTag
```

```Go
func (u *UserStore) HasTag(ctx context.Context, userID int32, tag string) (bool, error)
```

HasTag reports whether the context actor has the given tag. If not, it returns false and a nil error. 

#### <a id="UserStore.Tags" href="#UserStore.Tags">func (u *UserStore) Tags(ctx context.Context, userID int32) (map[string]bool, error)</a>

```
searchKey: database.UserStore.Tags
```

```Go
func (u *UserStore) Tags(ctx context.Context, userID int32) (map[string]bool, error)
```

Tags returns a map with all the tags currently belonging to the user. 

#### <a id="UserStore.UserAllowedExternalServices" href="#UserStore.UserAllowedExternalServices">func (u *UserStore) UserAllowedExternalServices(ctx context.Context, userID int32) (conf.ExternalServiceMode, error)</a>

```
searchKey: database.UserStore.UserAllowedExternalServices
```

```Go
func (u *UserStore) UserAllowedExternalServices(ctx context.Context, userID int32) (conf.ExternalServiceMode, error)
```

UserAllowedExternalServices returns whether the supplied user is allowed to add public or private code. This may override the site level value read by conf.ExternalServiceUserMode. 

It is added in the database package as putting it in the conf package led to many cyclic imports. 

#### <a id="UserStore.CurrentUserAllowedExternalServices" href="#UserStore.CurrentUserAllowedExternalServices">func (u *UserStore) CurrentUserAllowedExternalServices(ctx context.Context) (conf.ExternalServiceMode, error)</a>

```
searchKey: database.UserStore.CurrentUserAllowedExternalServices
```

```Go
func (u *UserStore) CurrentUserAllowedExternalServices(ctx context.Context) (conf.ExternalServiceMode, error)
```

CurrentUserAllowedExternalServices returns whether the current user is allowed to add public or private code. This may override the site level value read by conf.ExternalServiceUserMode. 

It is added in the database package as putting it in the conf package led to many cyclic imports. 

### <a id="userNotFoundErr" href="#userNotFoundErr">type userNotFoundErr struct</a>

```
searchKey: database.userNotFoundErr
tags: [private]
```

```Go
type userNotFoundErr struct {
	args []interface{}
}
```

userNotFoundErr is the error that is returned when a user is not found. 

#### <a id="userNotFoundErr.Error" href="#userNotFoundErr.Error">func (err userNotFoundErr) Error() string</a>

```
searchKey: database.userNotFoundErr.Error
tags: [private]
```

```Go
func (err userNotFoundErr) Error() string
```

#### <a id="userNotFoundErr.NotFound" href="#userNotFoundErr.NotFound">func (err userNotFoundErr) NotFound() bool</a>

```
searchKey: database.userNotFoundErr.NotFound
tags: [private]
```

```Go
func (err userNotFoundErr) NotFound() bool
```

### <a id="errCannotCreateUser" href="#errCannotCreateUser">type errCannotCreateUser struct</a>

```
searchKey: database.errCannotCreateUser
tags: [private]
```

```Go
type errCannotCreateUser struct {
	code string
}
```

errCannotCreateUser is the error that is returned when a user cannot be added to the DB due to a constraint. 

#### <a id="errCannotCreateUser.Error" href="#errCannotCreateUser.Error">func (err errCannotCreateUser) Error() string</a>

```
searchKey: database.errCannotCreateUser.Error
tags: [private]
```

```Go
func (err errCannotCreateUser) Error() string
```

#### <a id="errCannotCreateUser.Code" href="#errCannotCreateUser.Code">func (err errCannotCreateUser) Code() string</a>

```
searchKey: database.errCannotCreateUser.Code
tags: [private]
```

```Go
func (err errCannotCreateUser) Code() string
```

### <a id="NewUser" href="#NewUser">type NewUser struct</a>

```
searchKey: database.NewUser
```

```Go
type NewUser struct {
	Email       string
	Username    string
	DisplayName string
	Password    string
	AvatarURL   string // the new user's avatar URL, if known

	// EmailVerificationCode, if given, causes the new user's email address to be unverified until
	// they perform the email verification process and provied this code.
	EmailVerificationCode string `json:"-"` // forbid this field being set by JSON, just in case

	// EmailIsVerified is whether the email address should be considered already verified.
	//
	// 🚨 SECURITY: Only site admins are allowed to create users whose email addresses are initially
	// verified (i.e., with EmailVerificationCode == "").
	EmailIsVerified bool `json:"-"` // forbid this field being set by JSON, just in case

	// FailIfNotInitialUser causes the (users).Create call to return an error and not create the
	// user if at least one of the following is true: (1) the site has already been initialized or
	// (2) any other user account already exists.
	FailIfNotInitialUser bool `json:"-"` // forbid this field being set by JSON, just in case

	// EnforcePasswordLength is whether should enforce minimum and maximum password length requirement.
	// Users created by non-builtin auth providers do not have a password thus no need to check.
	EnforcePasswordLength bool `json:"-"` // forbid this field being set by JSON, just in case
}
```

NewUser describes a new to-be-created user. 

### <a id="UserUpdate" href="#UserUpdate">type UserUpdate struct</a>

```
searchKey: database.UserUpdate
```

```Go
type UserUpdate struct {
	Username string // update the Username to this value (if non-zero)

	// For the following fields:
	//
	// - If nil, the value in the DB is unchanged.
	// - If pointer to "" (empty string), the value in the DB is set to null.
	// - If pointer to a non-empty string, the value in the DB is set to the string.
	DisplayName, AvatarURL *string
}
```

UserUpdate describes user fields to update. 

### <a id="UsersListOptions" href="#UsersListOptions">type UsersListOptions struct</a>

```
searchKey: database.UsersListOptions
```

```Go
type UsersListOptions struct {
	// Query specifies a search query for users.
	Query string
	// UserIDs specifies a list of user IDs to include.
	UserIDs []int32

	Tag string // only include users with this tag

	*LimitOffset
}
```

UsersListOptions specifies the options for listing users. 

### <a id="MockUsers" href="#MockUsers">type MockUsers struct</a>

```
searchKey: database.MockUsers
```

```Go
type MockUsers struct {
	Create                       func(ctx context.Context, info NewUser) (newUser *types.User, err error)
	Update                       func(userID int32, update UserUpdate) error
	Delete                       func(ctx context.Context, id int32) error
	HardDelete                   func(ctx context.Context, id int32) error
	SetIsSiteAdmin               func(id int32, isSiteAdmin bool) error
	CheckAndDecrementInviteQuota func(ctx context.Context, userID int32) (bool, error)
	GetByID                      func(ctx context.Context, id int32) (*types.User, error)
	GetByUsername                func(ctx context.Context, username string) (*types.User, error)
	GetByUsernames               func(ctx context.Context, usernames ...string) ([]*types.User, error)
	GetByCurrentAuthUser         func(ctx context.Context) (*types.User, error)
	GetByVerifiedEmail           func(ctx context.Context, email string) (*types.User, error)
	Count                        func(ctx context.Context, opt *UsersListOptions) (int, error)
	List                         func(ctx context.Context, opt *UsersListOptions) ([]*types.User, error)
	InvalidateSessionsByID       func(ctx context.Context, id int32) error
	HasTag                       func(ctx context.Context, userID int32, tag string) (bool, error)
	Tags                         func(ctx context.Context, userID int32) (map[string]bool, error)
}
```

#### <a id="MockUsers.MockGetByID_Return" href="#MockUsers.MockGetByID_Return">func (s *MockUsers) MockGetByID_Return(t *testing.T, returns *types.User, returnsErr error) (called *bool)</a>

```
searchKey: database.MockUsers.MockGetByID_Return
```

```Go
func (s *MockUsers) MockGetByID_Return(t *testing.T, returns *types.User, returnsErr error) (called *bool)
```

### <a id="mockEncrypter" href="#mockEncrypter">type mockEncrypter struct</a>

```
searchKey: database.mockEncrypter
tags: [private]
```

```Go
type mockEncrypter struct {
	called int
}
```

#### <a id="mockEncrypter.Encrypt" href="#mockEncrypter.Encrypt">func (me *mockEncrypter) Encrypt(ctx context.Context, value []byte) ([]byte, error)</a>

```
searchKey: database.mockEncrypter.Encrypt
tags: [private]
```

```Go
func (me *mockEncrypter) Encrypt(ctx context.Context, value []byte) ([]byte, error)
```

### <a id="badAuthenticator" href="#badAuthenticator">type badAuthenticator struct{}</a>

```
searchKey: database.badAuthenticator
tags: [private]
```

```Go
type badAuthenticator struct{}
```

#### <a id="badAuthenticator.Authenticate" href="#badAuthenticator.Authenticate">func (*badAuthenticator) Authenticate(*http.Request) error</a>

```
searchKey: database.badAuthenticator.Authenticate
tags: [private]
```

```Go
func (*badAuthenticator) Authenticate(*http.Request) error
```

#### <a id="badAuthenticator.Hash" href="#badAuthenticator.Hash">func (*badAuthenticator) Hash() string</a>

```
searchKey: database.badAuthenticator.Hash
tags: [private]
```

```Go
func (*badAuthenticator) Hash() string
```

### <a id="invalidKey" href="#invalidKey">type invalidKey struct{}</a>

```
searchKey: database.invalidKey
tags: [private]
```

```Go
type invalidKey struct{}
```

invalidKey is an encryption.Key that just base64 encodes the plaintext, but silently fails to decrypt the secret. 

#### <a id="invalidKey.Encrypt" href="#invalidKey.Encrypt">func (k invalidKey) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)</a>

```
searchKey: database.invalidKey.Encrypt
tags: [private]
```

```Go
func (k invalidKey) Encrypt(ctx context.Context, plaintext []byte) ([]byte, error)
```

#### <a id="invalidKey.Decrypt" href="#invalidKey.Decrypt">func (k invalidKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)</a>

```
searchKey: database.invalidKey.Decrypt
tags: [private]
```

```Go
func (k invalidKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)
```

#### <a id="invalidKey.Version" href="#invalidKey.Version">func (k invalidKey) Version(ctx context.Context) (encryption.KeyVersion, error)</a>

```
searchKey: database.invalidKey.Version
tags: [private]
```

```Go
func (k invalidKey) Version(ctx context.Context) (encryption.KeyVersion, error)
```

### <a id="InsertRepoOp" href="#InsertRepoOp">type InsertRepoOp struct</a>

```
searchKey: database.InsertRepoOp
tags: [private]
```

```Go
type InsertRepoOp struct {
	Name         api.RepoName
	Description  string
	Fork         bool
	Archived     bool
	Cloned       bool
	Private      bool
	ExternalRepo api.ExternalRepoSpec
}
```

InsertRepoOp represents an operation to insert a repository. 

### <a id="fakeProvider" href="#fakeProvider">type fakeProvider struct</a>

```
searchKey: database.fakeProvider
tags: [private]
```

```Go
type fakeProvider struct {
	codeHost *extsvc.CodeHost
	extAcct  *extsvc.Account
}
```

#### <a id="fakeProvider.FetchAccount" href="#fakeProvider.FetchAccount">func (p *fakeProvider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (mine *extsvc.Account, err error)</a>

```
searchKey: database.fakeProvider.FetchAccount
tags: [private]
```

```Go
func (p *fakeProvider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (mine *extsvc.Account, err error)
```

#### <a id="fakeProvider.ServiceType" href="#fakeProvider.ServiceType">func (p *fakeProvider) ServiceType() string</a>

```
searchKey: database.fakeProvider.ServiceType
tags: [private]
```

```Go
func (p *fakeProvider) ServiceType() string
```

#### <a id="fakeProvider.ServiceID" href="#fakeProvider.ServiceID">func (p *fakeProvider) ServiceID() string</a>

```
searchKey: database.fakeProvider.ServiceID
tags: [private]
```

```Go
func (p *fakeProvider) ServiceID() string
```

#### <a id="fakeProvider.URN" href="#fakeProvider.URN">func (p *fakeProvider) URN() string</a>

```
searchKey: database.fakeProvider.URN
tags: [private]
```

```Go
func (p *fakeProvider) URN() string
```

#### <a id="fakeProvider.Validate" href="#fakeProvider.Validate">func (p *fakeProvider) Validate() (problems []string)</a>

```
searchKey: database.fakeProvider.Validate
tags: [private]
```

```Go
func (p *fakeProvider) Validate() (problems []string)
```

#### <a id="fakeProvider.FetchUserPerms" href="#fakeProvider.FetchUserPerms">func (p *fakeProvider) FetchUserPerms(context.Context, *extsvc.Account) (*authz.ExternalUserPermissions, error)</a>

```
searchKey: database.fakeProvider.FetchUserPerms
tags: [private]
```

```Go
func (p *fakeProvider) FetchUserPerms(context.Context, *extsvc.Account) (*authz.ExternalUserPermissions, error)
```

#### <a id="fakeProvider.FetchRepoPerms" href="#fakeProvider.FetchRepoPerms">func (p *fakeProvider) FetchRepoPerms(context.Context, *extsvc.Repository) ([]extsvc.AccountID, error)</a>

```
searchKey: database.fakeProvider.FetchRepoPerms
tags: [private]
```

```Go
func (p *fakeProvider) FetchRepoPerms(context.Context, *extsvc.Repository) ([]extsvc.AccountID, error)
```

### <a id="invalidAuth" href="#invalidAuth">type invalidAuth struct{}</a>

```
searchKey: database.invalidAuth
tags: [private]
```

```Go
type invalidAuth struct{}
```

#### <a id="invalidAuth.Authenticate" href="#invalidAuth.Authenticate">func (*invalidAuth) Authenticate(_ *http.Request) error</a>

```
searchKey: database.invalidAuth.Authenticate
tags: [private]
```

```Go
func (*invalidAuth) Authenticate(_ *http.Request) error
```

#### <a id="invalidAuth.Hash" href="#invalidAuth.Hash">func (*invalidAuth) Hash() string</a>

```
searchKey: database.invalidAuth.Hash
tags: [private]
```

```Go
func (*invalidAuth) Hash() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="toSHA256Bytes" href="#toSHA256Bytes">func toSHA256Bytes(input []byte) []byte</a>

```
searchKey: database.toSHA256Bytes
tags: [private]
```

```Go
func toSHA256Bytes(input []byte) []byte
```

### <a id="EncryptAuthenticator" href="#EncryptAuthenticator">func EncryptAuthenticator(ctx context.Context, enc encryption.Encrypter, a auth.Authenticator) ([]byte, error)</a>

```
searchKey: database.EncryptAuthenticator
```

```Go
func EncryptAuthenticator(ctx context.Context, enc encryption.Encrypter, a auth.Authenticator) ([]byte, error)
```

EncryptAuthenticator encodes _and_ encrypts an Authenticator into a byte slice. 

### <a id="marshalAuthenticator" href="#marshalAuthenticator">func marshalAuthenticator(a auth.Authenticator) (string, error)</a>

```
searchKey: database.marshalAuthenticator
tags: [private]
```

```Go
func marshalAuthenticator(a auth.Authenticator) (string, error)
```

marshalAuthenticator encodes an Authenticator into a JSON string. 

### <a id="UnmarshalAuthenticator" href="#UnmarshalAuthenticator">func UnmarshalAuthenticator(raw string) (auth.Authenticator, error)</a>

```
searchKey: database.UnmarshalAuthenticator
```

```Go
func UnmarshalAuthenticator(raw string) (auth.Authenticator, error)
```

UnmarshalAuthenticator decodes a JSON string into an Authenticator. 

### <a id="calcStartDate" href="#calcStartDate">func calcStartDate(now time.Time, periodType PeriodType, periods int) (time.Time, bool)</a>

```
searchKey: database.calcStartDate
tags: [private]
```

```Go
func calcStartDate(now time.Time, periodType PeriodType, periods int) (time.Time, bool)
```

calcStartDate calculates the the starting date of a number of periods given the period type. from the current time supplied as `now`. Returns a second false value if the period type is illegal. 

### <a id="calcEndDate" href="#calcEndDate">func calcEndDate(startDate time.Time, periodType PeriodType, periods int) (time.Time, bool)</a>

```
searchKey: database.calcEndDate
tags: [private]
```

```Go
func calcEndDate(startDate time.Time, periodType PeriodType, periods int) (time.Time, bool)
```

calcEndDate calculates the the ending date of a number of periods given the period type. Returns a second false value if the period type is illegal. 

### <a id="makeDateTruncExpression" href="#makeDateTruncExpression">func makeDateTruncExpression(unit, expr string) string</a>

```
searchKey: database.makeDateTruncExpression
tags: [private]
```

```Go
func makeDateTruncExpression(unit, expr string) string
```

makeDateTruncExpression returns an expresson that converts the given SQL expression into the start of the containing date container specified by the unit parameter (e.g. day, week, month, or). 

### <a id="MaybeEncrypt" href="#MaybeEncrypt">func MaybeEncrypt(ctx context.Context, key encryption.Key, data string) (maybeEncryptedData, keyID string, err error)</a>

```
searchKey: database.MaybeEncrypt
```

```Go
func MaybeEncrypt(ctx context.Context, key encryption.Key, data string) (maybeEncryptedData, keyID string, err error)
```

MaybeEncrypt encrypts data with the given key returns the id of the key. If the key is nil, it returns the data unchanged. 

### <a id="MaybeDecrypt" href="#MaybeDecrypt">func MaybeDecrypt(ctx context.Context, key encryption.Key, data, keyIdent string) (string, error)</a>

```
searchKey: database.MaybeDecrypt
```

```Go
func MaybeDecrypt(ctx context.Context, key encryption.Key, data, keyIdent string) (string, error)
```

MaybeDecrypt decrypts data with the given key if keyIdent is not empty. 

### <a id="rawMessagePtr" href="#rawMessagePtr">func rawMessagePtr(s string) *json.RawMessage</a>

```
searchKey: database.rawMessagePtr
tags: [private]
```

```Go
func rawMessagePtr(s string) *json.RawMessage
```

### <a id="validateOtherExternalServiceConnection" href="#validateOtherExternalServiceConnection">func validateOtherExternalServiceConnection(c *schema.OtherExternalServiceConnection) error</a>

```
searchKey: database.validateOtherExternalServiceConnection
tags: [private]
```

```Go
func validateOtherExternalServiceConnection(c *schema.OtherExternalServiceConnection) error
```

Neither our JSON schema library nor the Monaco editor we use supports object dependencies well, so we must validate here that repo items match the uri-reference format when url is set, instead of uri when it isn't. 

### <a id="upsertAuthorizationToExternalService" href="#upsertAuthorizationToExternalService">func upsertAuthorizationToExternalService(kind, config string) (string, error)</a>

```
searchKey: database.upsertAuthorizationToExternalService
tags: [private]
```

```Go
func upsertAuthorizationToExternalService(kind, config string) (string, error)
```

upsertAuthorizationToExternalService adds "authorization" field to the external service config when not yet present for GitHub and GitLab. 

### <a id="scanFeatureFlag" href="#scanFeatureFlag">func scanFeatureFlag(scanner rowScanner) (*ff.FeatureFlag, error)</a>

```
searchKey: database.scanFeatureFlag
tags: [private]
```

```Go
func scanFeatureFlag(scanner rowScanner) (*ff.FeatureFlag, error)
```

### <a id="scanFeatureFlagOverrides" href="#scanFeatureFlagOverrides">func scanFeatureFlagOverrides(rows *sql.Rows) ([]*ff.Override, error)</a>

```
searchKey: database.scanFeatureFlagOverrides
tags: [private]
```

```Go
func scanFeatureFlagOverrides(rows *sql.Rows) ([]*ff.Override, error)
```

### <a id="scanFeatureFlagOverride" href="#scanFeatureFlagOverride">func scanFeatureFlagOverride(scanner rowScanner) (*ff.Override, error)</a>

```
searchKey: database.scanFeatureFlagOverride
tags: [private]
```

```Go
func scanFeatureFlagOverride(scanner rowScanner) (*ff.Override, error)
```

### <a id="sanitizeToUTF8" href="#sanitizeToUTF8">func sanitizeToUTF8(s string) string</a>

```
searchKey: database.sanitizeToUTF8
tags: [private]
```

```Go
func sanitizeToUTF8(s string) string
```

sanitizeToUTF8 will remove any null character terminated string. The null character can be represented in one of the following ways in Go: 

Hex: \x00 Unicode: \u0000 Octal digits: \000 

Using any of them to replace the null character has the same effect. See this playground example: [https://play.golang.org/p/8SKPmalJRRW](https://play.golang.org/p/8SKPmalJRRW) 

See this for a detailed answer: [https://stackoverflow.com/a/38008565/1773961](https://stackoverflow.com/a/38008565/1773961) 

### <a id="getNamespaceQuery" href="#getNamespaceQuery">func getNamespaceQuery(preds []*sqlf.Query) *sqlf.Query</a>

```
searchKey: database.getNamespaceQuery
tags: [private]
```

```Go
func getNamespaceQuery(preds []*sqlf.Query) *sqlf.Query
```

### <a id="IsRepoNotFoundErr" href="#IsRepoNotFoundErr">func IsRepoNotFoundErr(err error) bool</a>

```
searchKey: database.IsRepoNotFoundErr
```

```Go
func IsRepoNotFoundErr(err error) bool
```

### <a id="minimalColumns" href="#minimalColumns">func minimalColumns(columns []string) []string</a>

```
searchKey: database.minimalColumns
tags: [private]
```

```Go
func minimalColumns(columns []string) []string
```

### <a id="scanRepo" href="#scanRepo">func scanRepo(rows *sql.Rows, r *types.Repo) (err error)</a>

```
searchKey: database.scanRepo
tags: [private]
```

```Go
func scanRepo(rows *sql.Rows, r *types.Repo) (err error)
```

### <a id="nullTimeColumn" href="#nullTimeColumn">func nullTimeColumn(t time.Time) *time.Time</a>

```
searchKey: database.nullTimeColumn
tags: [private]
```

```Go
func nullTimeColumn(t time.Time) *time.Time
```

### <a id="nullInt32Column" href="#nullInt32Column">func nullInt32Column(n int32) *int32</a>

```
searchKey: database.nullInt32Column
tags: [private]
```

```Go
func nullInt32Column(n int32) *int32
```

### <a id="nullStringColumn" href="#nullStringColumn">func nullStringColumn(s string) *string</a>

```
searchKey: database.nullStringColumn
tags: [private]
```

```Go
func nullStringColumn(s string) *string
```

### <a id="metadataColumn" href="#metadataColumn">func metadataColumn(metadata interface{}) (msg json.RawMessage, err error)</a>

```
searchKey: database.metadataColumn
tags: [private]
```

```Go
func metadataColumn(metadata interface{}) (msg json.RawMessage, err error)
```

### <a id="sourcesColumn" href="#sourcesColumn">func sourcesColumn(repoID api.RepoID, sources map[string]*types.SourceInfo) (json.RawMessage, error)</a>

```
searchKey: database.sourcesColumn
tags: [private]
```

```Go
func sourcesColumn(repoID api.RepoID, sources map[string]*types.SourceInfo) (json.RawMessage, error)
```

### <a id="parsePattern" href="#parsePattern">func parsePattern(p string) ([]*sqlf.Query, error)</a>

```
searchKey: database.parsePattern
tags: [private]
```

```Go
func parsePattern(p string) ([]*sqlf.Query, error)
```

### <a id="parseCursorConds" href="#parseCursorConds">func parseCursorConds(opt ReposListOptions) (conds []*sqlf.Query, err error)</a>

```
searchKey: database.parseCursorConds
tags: [private]
```

```Go
func parseCursorConds(opt ReposListOptions) (conds []*sqlf.Query, err error)
```

parseCursorConds checks whether the query is using cursor-based pagination, and if so performs the necessary transformations for it to be successful. 

### <a id="parseIncludePattern" href="#parseIncludePattern">func parseIncludePattern(pattern string) (exact, like []string, regexp string, err error)</a>

```
searchKey: database.parseIncludePattern
tags: [private]
```

```Go
func parseIncludePattern(pattern string) (exact, like []string, regexp string, err error)
```

parseIncludePattern either (1) parses the pattern into a list of exact possible string values and LIKE patterns if such a list can be determined from the pattern, and (2) returns the original regexp if those patterns are not equivalent to the regexp. 

It allows Repos.List to optimize for the common case where a pattern like `(^github.com/foo/bar$)|(^github.com/baz/qux$)` is provided. In that case, it's faster to query for "WHERE name IN (...)" the two possible exact values (because it can use an index) instead of using a "WHERE name ~*" regexp condition (which generally can't use an index). 

This optimization is necessary for good performance when there are many repos in the database. With this optimization, specifying a "repogroup:" in the query will be fast (even if there are many repos) because the query can be constrained efficiently to only the repos in the group. 

### <a id="allMatchingStrings" href="#allMatchingStrings">func allMatchingStrings(re *regexpsyntax.Regexp, last bool) (exact, contains, prefix, suffix []string, err error)</a>

```
searchKey: database.allMatchingStrings
tags: [private]
```

```Go
func allMatchingStrings(re *regexpsyntax.Regexp, last bool) (exact, contains, prefix, suffix []string, err error)
```

allMatchingStrings returns a complete list of the strings that re matches, if it's possible to determine the list. The "last" argument indicates if this is the last part of the original regexp. 

### <a id="AuthzQueryConds" href="#AuthzQueryConds">func AuthzQueryConds(ctx context.Context, db dbutil.DB) (*sqlf.Query, error)</a>

```
searchKey: database.AuthzQueryConds
```

```Go
func AuthzQueryConds(ctx context.Context, db dbutil.DB) (*sqlf.Query, error)
```

AuthzQueryConds returns a query clause for enforcing repository permissions. It uses `repo` as the table name to filter out repository IDs and should be used as an AND condition in a complete SQL query. 

### <a id="authzQuery" href="#authzQuery">func authzQuery(bypassAuthz, usePermissionsUserMapping bool, authenticatedUserID int32, perms authz.Perms) *sqlf.Query</a>

```
searchKey: database.authzQuery
tags: [private]
```

```Go
func authzQuery(bypassAuthz, usePermissionsUserMapping bool, authenticatedUserID int32, perms authz.Perms) *sqlf.Query
```

### <a id="isInternalActor" href="#isInternalActor">func isInternalActor(ctx context.Context) bool</a>

```
searchKey: database.isInternalActor
tags: [private]
```

```Go
func isInternalActor(ctx context.Context) bool
```

isInternalActor returns true if the actor represents an internal agent (i.e., non-user-bound request that originates from within Sourcegraph itself). 

🚨 SECURITY: internal requests bypass authz provider permissions checks, so correctness is important here. 

### <a id="searchContextsPermissionsCondition" href="#searchContextsPermissionsCondition">func searchContextsPermissionsCondition(ctx context.Context, db dbutil.DB) (*sqlf.Query, error)</a>

```
searchKey: database.searchContextsPermissionsCondition
tags: [private]
```

```Go
func searchContextsPermissionsCondition(ctx context.Context, db dbutil.DB) (*sqlf.Query, error)
```

### <a id="getSearchContextOrderByClause" href="#getSearchContextOrderByClause">func getSearchContextOrderByClause(orderBy SearchContextsOrderByOption, descending bool) *sqlf.Query</a>

```
searchKey: database.getSearchContextOrderByClause
tags: [private]
```

```Go
func getSearchContextOrderByClause(orderBy SearchContextsOrderByOption, descending bool) *sqlf.Query
```

### <a id="getSearchContextNamespaceQueryConditions" href="#getSearchContextNamespaceQueryConditions">func getSearchContextNamespaceQueryConditions(namespaceUserID, namespaceOrgID int32) ([]*sqlf.Query, error)</a>

```
searchKey: database.getSearchContextNamespaceQueryConditions
tags: [private]
```

```Go
func getSearchContextNamespaceQueryConditions(namespaceUserID, namespaceOrgID int32) ([]*sqlf.Query, error)
```

### <a id="idsToQueries" href="#idsToQueries">func idsToQueries(ids []int32) []*sqlf.Query</a>

```
searchKey: database.idsToQueries
tags: [private]
```

```Go
func idsToQueries(ids []int32) []*sqlf.Query
```

### <a id="getSearchContextsQueryConditions" href="#getSearchContextsQueryConditions">func getSearchContextsQueryConditions(opts ListSearchContextsOptions) ([]*sqlf.Query, error)</a>

```
searchKey: database.getSearchContextsQueryConditions
tags: [private]
```

```Go
func getSearchContextsQueryConditions(opts ListSearchContextsOptions) ([]*sqlf.Query, error)
```

### <a id="scanSingleSearchContext" href="#scanSingleSearchContext">func scanSingleSearchContext(rows *sql.Rows) (*types.SearchContext, error)</a>

```
searchKey: database.scanSingleSearchContext
tags: [private]
```

```Go
func scanSingleSearchContext(rows *sql.Rows) (*types.SearchContext, error)
```

### <a id="scanSearchContexts" href="#scanSearchContexts">func scanSearchContexts(rows *sql.Rows) ([]*types.SearchContext, error)</a>

```
searchKey: database.scanSearchContexts
tags: [private]
```

```Go
func scanSearchContexts(rows *sql.Rows) ([]*types.SearchContext, error)
```

### <a id="thirtyDaysAgo" href="#thirtyDaysAgo">func thirtyDaysAgo() string</a>

```
searchKey: database.thirtyDaysAgo
tags: [private]
```

```Go
func thirtyDaysAgo() string
```

### <a id="MockEmailExistsErr" href="#MockEmailExistsErr">func MockEmailExistsErr() error</a>

```
searchKey: database.MockEmailExistsErr
```

```Go
func MockEmailExistsErr() error
```

### <a id="MockUsernameExistsErr" href="#MockUsernameExistsErr">func MockUsernameExistsErr() error</a>

```
searchKey: database.MockUsernameExistsErr
```

```Go
func MockUsernameExistsErr() error
```

### <a id="strptr" href="#strptr">func strptr(s string) *string</a>

```
searchKey: database.strptr
tags: [private]
```

```Go
func strptr(s string) *string
```

### <a id="boolptr" href="#boolptr">func boolptr(b bool) *bool</a>

```
searchKey: database.boolptr
tags: [private]
```

```Go
func boolptr(b bool) *bool
```

### <a id="assertJSONEqual" href="#assertJSONEqual">func assertJSONEqual(t *testing.T, want, got interface{})</a>

```
searchKey: database.assertJSONEqual
tags: [private]
```

```Go
func assertJSONEqual(t *testing.T, want, got interface{})
```

### <a id="jsonEqual" href="#jsonEqual">func jsonEqual(t *testing.T, a, b interface{}) bool</a>

```
searchKey: database.jsonEqual
tags: [private]
```

```Go
func jsonEqual(t *testing.T, a, b interface{}) bool
```

### <a id="asJSON" href="#asJSON">func asJSON(t *testing.T, v interface{}) string</a>

```
searchKey: database.asJSON
tags: [private]
```

```Go
func asJSON(t *testing.T, v interface{}) string
```

### <a id="scanUserCredential" href="#scanUserCredential">func scanUserCredential(cred *UserCredential, s interface {...</a>

```
searchKey: database.scanUserCredential
tags: [private]
```

```Go
func scanUserCredential(cred *UserCredential, s interface {
	Scan(...interface{}) error
}) error
```

scanUserCredential scans a credential from the given scanner into the given credential. 

s is inspired by the BatchChange scanner type, but also matches sql.Row, which is generally used directly in this module. 

### <a id="keyID" href="#keyID">func keyID(ctx context.Context, key encryption.Key) (string, error)</a>

```
searchKey: database.keyID
tags: [private]
```

```Go
func keyID(ctx context.Context, key encryption.Key) (string, error)
```

### <a id="NewUserNotFoundError" href="#NewUserNotFoundError">func NewUserNotFoundError(userID int32) error</a>

```
searchKey: database.NewUserNotFoundError
```

```Go
func NewUserNotFoundError(userID int32) error
```

NewUserNotFoundError returns a new error indicating that the user with the given user ID was not found. 

### <a id="IsUsernameExists" href="#IsUsernameExists">func IsUsernameExists(err error) bool</a>

```
searchKey: database.IsUsernameExists
```

```Go
func IsUsernameExists(err error) bool
```

IsUsernameExists reports whether err is an error indicating that the intended username exists. 

### <a id="IsEmailExists" href="#IsEmailExists">func IsEmailExists(err error) bool</a>

```
searchKey: database.IsEmailExists
```

```Go
func IsEmailExists(err error) bool
```

IsEmailExists reports whether err is an error indicating that the intended email exists. 

### <a id="CheckPasswordLength" href="#CheckPasswordLength">func CheckPasswordLength(pw string) error</a>

```
searchKey: database.CheckPasswordLength
```

```Go
func CheckPasswordLength(pw string) error
```

CheckPasswordLength returns an error if the length of the password is not in the required range. 

### <a id="orgsForAllUsersToJoin" href="#orgsForAllUsersToJoin">func orgsForAllUsersToJoin(userOrgMap map[string][]string) ([]string, []error)</a>

```
searchKey: database.orgsForAllUsersToJoin
tags: [private]
```

```Go
func orgsForAllUsersToJoin(userOrgMap map[string][]string) ([]string, []error)
```

orgsForAllUsersToJoin returns the list of org names that all users should be joined to. The second return value is a list of errors encountered while generating this list. Note that even if errors are returned, the first return value is still valid. 

### <a id="hashPassword" href="#hashPassword">func hashPassword(password string) (sql.NullString, error)</a>

```
searchKey: database.hashPassword
tags: [private]
```

```Go
func hashPassword(password string) (sql.NullString, error)
```

### <a id="validPassword" href="#validPassword">func validPassword(hash, password string) bool</a>

```
searchKey: database.validPassword
tags: [private]
```

```Go
func validPassword(hash, password string) bool
```

### <a id="TestAccessTokens_Create" href="#TestAccessTokens_Create">func TestAccessTokens_Create(t *testing.T)</a>

```
searchKey: database.TestAccessTokens_Create
tags: [private]
```

```Go
func TestAccessTokens_Create(t *testing.T)
```

🚨 SECURITY: This tests the routine that creates access tokens and returns the token secret value to the user. 

### <a id="TestAccessTokens_List" href="#TestAccessTokens_List">func TestAccessTokens_List(t *testing.T)</a>

```
searchKey: database.TestAccessTokens_List
tags: [private]
```

```Go
func TestAccessTokens_List(t *testing.T)
```

### <a id="TestAccessTokens_Lookup" href="#TestAccessTokens_Lookup">func TestAccessTokens_Lookup(t *testing.T)</a>

```
searchKey: database.TestAccessTokens_Lookup
tags: [private]
```

```Go
func TestAccessTokens_Lookup(t *testing.T)
```

🚨 SECURITY: This tests the routine that verifies access tokens, which the security of the entire system depends on. 

### <a id="TestAccessTokens_Lookup_deletedUser" href="#TestAccessTokens_Lookup_deletedUser">func TestAccessTokens_Lookup_deletedUser(t *testing.T)</a>

```
searchKey: database.TestAccessTokens_Lookup_deletedUser
tags: [private]
```

```Go
func TestAccessTokens_Lookup_deletedUser(t *testing.T)
```

🚨 SECURITY: This tests that deleting the subject or creator user of an access token invalidates the token, and that no new access tokens may be created for deleted users. 

### <a id="TestEncryptAuthenticator" href="#TestEncryptAuthenticator">func TestEncryptAuthenticator(t *testing.T)</a>

```
searchKey: database.TestEncryptAuthenticator
tags: [private]
```

```Go
func TestEncryptAuthenticator(t *testing.T)
```

### <a id="init.db_test.go" href="#init.db_test.go">func init()</a>

```
searchKey: database.init
tags: [private]
```

```Go
func init()
```

### <a id="TestPassword" href="#TestPassword">func TestPassword(t *testing.T)</a>

```
searchKey: database.TestPassword
tags: [private]
```

```Go
func TestPassword(t *testing.T)
```

### <a id="TestErrorsInterface" href="#TestErrorsInterface">func TestErrorsInterface(t *testing.T)</a>

```
searchKey: database.TestErrorsInterface
tags: [private]
```

```Go
func TestErrorsInterface(t *testing.T)
```

### <a id="functionName" href="#functionName">func functionName(i interface{}) string</a>

```
searchKey: database.functionName
tags: [private]
```

```Go
func functionName(i interface{}) string
```

### <a id="TestEventLogs_ValidInfo" href="#TestEventLogs_ValidInfo">func TestEventLogs_ValidInfo(t *testing.T)</a>

```
searchKey: database.TestEventLogs_ValidInfo
tags: [private]
```

```Go
func TestEventLogs_ValidInfo(t *testing.T)
```

### <a id="TestEventLogs_CountUniqueUsersPerPeriod" href="#TestEventLogs_CountUniqueUsersPerPeriod">func TestEventLogs_CountUniqueUsersPerPeriod(t *testing.T)</a>

```
searchKey: database.TestEventLogs_CountUniqueUsersPerPeriod
tags: [private]
```

```Go
func TestEventLogs_CountUniqueUsersPerPeriod(t *testing.T)
```

### <a id="TestEventLogs_UsersUsageCounts" href="#TestEventLogs_UsersUsageCounts">func TestEventLogs_UsersUsageCounts(t *testing.T)</a>

```
searchKey: database.TestEventLogs_UsersUsageCounts
tags: [private]
```

```Go
func TestEventLogs_UsersUsageCounts(t *testing.T)
```

### <a id="TestEventLogs_SiteUsage" href="#TestEventLogs_SiteUsage">func TestEventLogs_SiteUsage(t *testing.T)</a>

```
searchKey: database.TestEventLogs_SiteUsage
tags: [private]
```

```Go
func TestEventLogs_SiteUsage(t *testing.T)
```

### <a id="TestEventLogs_codeIntelligenceWeeklyUsersCount" href="#TestEventLogs_codeIntelligenceWeeklyUsersCount">func TestEventLogs_codeIntelligenceWeeklyUsersCount(t *testing.T)</a>

```
searchKey: database.TestEventLogs_codeIntelligenceWeeklyUsersCount
tags: [private]
```

```Go
func TestEventLogs_codeIntelligenceWeeklyUsersCount(t *testing.T)
```

### <a id="TestEventLogs_TestCodeIntelligenceRepositoryCounts" href="#TestEventLogs_TestCodeIntelligenceRepositoryCounts">func TestEventLogs_TestCodeIntelligenceRepositoryCounts(t *testing.T)</a>

```
searchKey: database.TestEventLogs_TestCodeIntelligenceRepositoryCounts
tags: [private]
```

```Go
func TestEventLogs_TestCodeIntelligenceRepositoryCounts(t *testing.T)
```

### <a id="TestEventLogs_AggregatedCodeIntelEvents" href="#TestEventLogs_AggregatedCodeIntelEvents">func TestEventLogs_AggregatedCodeIntelEvents(t *testing.T)</a>

```
searchKey: database.TestEventLogs_AggregatedCodeIntelEvents
tags: [private]
```

```Go
func TestEventLogs_AggregatedCodeIntelEvents(t *testing.T)
```

### <a id="TestEventLogs_AggregatedSparseCodeIntelEvents" href="#TestEventLogs_AggregatedSparseCodeIntelEvents">func TestEventLogs_AggregatedSparseCodeIntelEvents(t *testing.T)</a>

```
searchKey: database.TestEventLogs_AggregatedSparseCodeIntelEvents
tags: [private]
```

```Go
func TestEventLogs_AggregatedSparseCodeIntelEvents(t *testing.T)
```

### <a id="TestEventLogs_AggregatedSparseSearchEvents" href="#TestEventLogs_AggregatedSparseSearchEvents">func TestEventLogs_AggregatedSparseSearchEvents(t *testing.T)</a>

```
searchKey: database.TestEventLogs_AggregatedSparseSearchEvents
tags: [private]
```

```Go
func TestEventLogs_AggregatedSparseSearchEvents(t *testing.T)
```

### <a id="TestEventLogs_AggregatedSearchEvents" href="#TestEventLogs_AggregatedSearchEvents">func TestEventLogs_AggregatedSearchEvents(t *testing.T)</a>

```
searchKey: database.TestEventLogs_AggregatedSearchEvents
tags: [private]
```

```Go
func TestEventLogs_AggregatedSearchEvents(t *testing.T)
```

### <a id="TestEventLogs_ListAll" href="#TestEventLogs_ListAll">func TestEventLogs_ListAll(t *testing.T)</a>

```
searchKey: database.TestEventLogs_ListAll
tags: [private]
```

```Go
func TestEventLogs_ListAll(t *testing.T)
```

### <a id="TestEventLogs_LatestPing" href="#TestEventLogs_LatestPing">func TestEventLogs_LatestPing(t *testing.T)</a>

```
searchKey: database.TestEventLogs_LatestPing
tags: [private]
```

```Go
func TestEventLogs_LatestPing(t *testing.T)
```

### <a id="assertUsageValue" href="#assertUsageValue">func assertUsageValue(t *testing.T, v UsageValue, start time.Time, count int)</a>

```
searchKey: database.assertUsageValue
tags: [private]
```

```Go
func assertUsageValue(t *testing.T, v UsageValue, start time.Time, count int)
```

### <a id="TestExternalAccounts_LookupUserAndSave" href="#TestExternalAccounts_LookupUserAndSave">func TestExternalAccounts_LookupUserAndSave(t *testing.T)</a>

```
searchKey: database.TestExternalAccounts_LookupUserAndSave
tags: [private]
```

```Go
func TestExternalAccounts_LookupUserAndSave(t *testing.T)
```

### <a id="TestExternalAccounts_AssociateUserAndSave" href="#TestExternalAccounts_AssociateUserAndSave">func TestExternalAccounts_AssociateUserAndSave(t *testing.T)</a>

```
searchKey: database.TestExternalAccounts_AssociateUserAndSave
tags: [private]
```

```Go
func TestExternalAccounts_AssociateUserAndSave(t *testing.T)
```

### <a id="TestExternalAccounts_CreateUserAndSave" href="#TestExternalAccounts_CreateUserAndSave">func TestExternalAccounts_CreateUserAndSave(t *testing.T)</a>

```
searchKey: database.TestExternalAccounts_CreateUserAndSave
tags: [private]
```

```Go
func TestExternalAccounts_CreateUserAndSave(t *testing.T)
```

### <a id="TestExternalAccounts_CreateUserAndSave_NilData" href="#TestExternalAccounts_CreateUserAndSave_NilData">func TestExternalAccounts_CreateUserAndSave_NilData(t *testing.T)</a>

```
searchKey: database.TestExternalAccounts_CreateUserAndSave_NilData
tags: [private]
```

```Go
func TestExternalAccounts_CreateUserAndSave_NilData(t *testing.T)
```

### <a id="TestExternalAccounts_List" href="#TestExternalAccounts_List">func TestExternalAccounts_List(t *testing.T)</a>

```
searchKey: database.TestExternalAccounts_List
tags: [private]
```

```Go
func TestExternalAccounts_List(t *testing.T)
```

### <a id="TestExternalAccounts_Encryption" href="#TestExternalAccounts_Encryption">func TestExternalAccounts_Encryption(t *testing.T)</a>

```
searchKey: database.TestExternalAccounts_Encryption
tags: [private]
```

```Go
func TestExternalAccounts_Encryption(t *testing.T)
```

### <a id="simplifyExternalAccount" href="#simplifyExternalAccount">func simplifyExternalAccount(account *extsvc.Account)</a>

```
searchKey: database.simplifyExternalAccount
tags: [private]
```

```Go
func simplifyExternalAccount(account *extsvc.Account)
```

### <a id="TestExternalAccounts_expiredAt" href="#TestExternalAccounts_expiredAt">func TestExternalAccounts_expiredAt(t *testing.T)</a>

```
searchKey: database.TestExternalAccounts_expiredAt
tags: [private]
```

```Go
func TestExternalAccounts_expiredAt(t *testing.T)
```

### <a id="TestExternalServicesListOptions_sqlConditions" href="#TestExternalServicesListOptions_sqlConditions">func TestExternalServicesListOptions_sqlConditions(t *testing.T)</a>

```
searchKey: database.TestExternalServicesListOptions_sqlConditions
tags: [private]
```

```Go
func TestExternalServicesListOptions_sqlConditions(t *testing.T)
```

### <a id="TestExternalServicesStore_ValidateConfig" href="#TestExternalServicesStore_ValidateConfig">func TestExternalServicesStore_ValidateConfig(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_ValidateConfig
tags: [private]
```

```Go
func TestExternalServicesStore_ValidateConfig(t *testing.T)
```

### <a id="TestExternalServicesStore_Create" href="#TestExternalServicesStore_Create">func TestExternalServicesStore_Create(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_Create
tags: [private]
```

```Go
func TestExternalServicesStore_Create(t *testing.T)
```

### <a id="TestExternalServicesStore_CreateWithTierEnforcement" href="#TestExternalServicesStore_CreateWithTierEnforcement">func TestExternalServicesStore_CreateWithTierEnforcement(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_CreateWithTierEnforcement
tags: [private]
```

```Go
func TestExternalServicesStore_CreateWithTierEnforcement(t *testing.T)
```

### <a id="TestExternalServicesStore_Update" href="#TestExternalServicesStore_Update">func TestExternalServicesStore_Update(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_Update
tags: [private]
```

```Go
func TestExternalServicesStore_Update(t *testing.T)
```

### <a id="TestUpsertAuthorizationToExternalService" href="#TestUpsertAuthorizationToExternalService">func TestUpsertAuthorizationToExternalService(t *testing.T)</a>

```
searchKey: database.TestUpsertAuthorizationToExternalService
tags: [private]
```

```Go
func TestUpsertAuthorizationToExternalService(t *testing.T)
```

### <a id="TestCountRepoCount" href="#TestCountRepoCount">func TestCountRepoCount(t *testing.T)</a>

```
searchKey: database.TestCountRepoCount
tags: [private]
```

```Go
func TestCountRepoCount(t *testing.T)
```

### <a id="TestExternalServicesStore_Delete" href="#TestExternalServicesStore_Delete">func TestExternalServicesStore_Delete(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_Delete
tags: [private]
```

```Go
func TestExternalServicesStore_Delete(t *testing.T)
```

### <a id="TestExternalServicesStore_GetByID" href="#TestExternalServicesStore_GetByID">func TestExternalServicesStore_GetByID(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_GetByID
tags: [private]
```

```Go
func TestExternalServicesStore_GetByID(t *testing.T)
```

### <a id="TestExternalServicesStore_GetByID_Encrypted" href="#TestExternalServicesStore_GetByID_Encrypted">func TestExternalServicesStore_GetByID_Encrypted(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_GetByID_Encrypted
tags: [private]
```

```Go
func TestExternalServicesStore_GetByID_Encrypted(t *testing.T)
```

### <a id="TestGetAffiliatedSyncErrors" href="#TestGetAffiliatedSyncErrors">func TestGetAffiliatedSyncErrors(t *testing.T)</a>

```
searchKey: database.TestGetAffiliatedSyncErrors
tags: [private]
```

```Go
func TestGetAffiliatedSyncErrors(t *testing.T)
```

### <a id="TestGetLastSyncError" href="#TestGetLastSyncError">func TestGetLastSyncError(t *testing.T)</a>

```
searchKey: database.TestGetLastSyncError
tags: [private]
```

```Go
func TestGetLastSyncError(t *testing.T)
```

### <a id="TestExternalServicesStore_List" href="#TestExternalServicesStore_List">func TestExternalServicesStore_List(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_List
tags: [private]
```

```Go
func TestExternalServicesStore_List(t *testing.T)
```

### <a id="TestExternalServicesStore_DistinctKinds" href="#TestExternalServicesStore_DistinctKinds">func TestExternalServicesStore_DistinctKinds(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_DistinctKinds
tags: [private]
```

```Go
func TestExternalServicesStore_DistinctKinds(t *testing.T)
```

### <a id="TestExternalServicesStore_Count" href="#TestExternalServicesStore_Count">func TestExternalServicesStore_Count(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_Count
tags: [private]
```

```Go
func TestExternalServicesStore_Count(t *testing.T)
```

### <a id="TestExternalServicesStore_Upsert" href="#TestExternalServicesStore_Upsert">func TestExternalServicesStore_Upsert(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_Upsert
tags: [private]
```

```Go
func TestExternalServicesStore_Upsert(t *testing.T)
```

### <a id="TestExternalServiceStore_GetExternalServiceSyncJobs" href="#TestExternalServiceStore_GetExternalServiceSyncJobs">func TestExternalServiceStore_GetExternalServiceSyncJobs(t *testing.T)</a>

```
searchKey: database.TestExternalServiceStore_GetExternalServiceSyncJobs
tags: [private]
```

```Go
func TestExternalServiceStore_GetExternalServiceSyncJobs(t *testing.T)
```

### <a id="TestExternalServicesStore_OneCloudDefaultPerKind" href="#TestExternalServicesStore_OneCloudDefaultPerKind">func TestExternalServicesStore_OneCloudDefaultPerKind(t *testing.T)</a>

```
searchKey: database.TestExternalServicesStore_OneCloudDefaultPerKind
tags: [private]
```

```Go
func TestExternalServicesStore_OneCloudDefaultPerKind(t *testing.T)
```

### <a id="TestExternalServiceStore_SyncDue" href="#TestExternalServiceStore_SyncDue">func TestExternalServiceStore_SyncDue(t *testing.T)</a>

```
searchKey: database.TestExternalServiceStore_SyncDue
tags: [private]
```

```Go
func TestExternalServiceStore_SyncDue(t *testing.T)
```

### <a id="TestFeatureFlagStore" href="#TestFeatureFlagStore">func TestFeatureFlagStore(t *testing.T)</a>

```
searchKey: database.TestFeatureFlagStore
tags: [private]
```

```Go
func TestFeatureFlagStore(t *testing.T)
```

### <a id="errorContains" href="#errorContains">func errorContains(s string) require.ErrorAssertionFunc</a>

```
searchKey: database.errorContains
tags: [private]
```

```Go
func errorContains(s string) require.ErrorAssertionFunc
```

### <a id="cleanup" href="#cleanup">func cleanup(t *testing.T, db *sql.DB) func()</a>

```
searchKey: database.cleanup
tags: [private]
```

```Go
func cleanup(t *testing.T, db *sql.DB) func()
```

### <a id="testNewFeatureFlagRoundtrip" href="#testNewFeatureFlagRoundtrip">func testNewFeatureFlagRoundtrip(t *testing.T)</a>

```
searchKey: database.testNewFeatureFlagRoundtrip
tags: [private]
```

```Go
func testNewFeatureFlagRoundtrip(t *testing.T)
```

### <a id="testListFeatureFlags" href="#testListFeatureFlags">func testListFeatureFlags(t *testing.T)</a>

```
searchKey: database.testListFeatureFlags
tags: [private]
```

```Go
func testListFeatureFlags(t *testing.T)
```

### <a id="testNewOverrideRoundtrip" href="#testNewOverrideRoundtrip">func testNewOverrideRoundtrip(t *testing.T)</a>

```
searchKey: database.testNewOverrideRoundtrip
tags: [private]
```

```Go
func testNewOverrideRoundtrip(t *testing.T)
```

### <a id="testListUserOverrides" href="#testListUserOverrides">func testListUserOverrides(t *testing.T)</a>

```
searchKey: database.testListUserOverrides
tags: [private]
```

```Go
func testListUserOverrides(t *testing.T)
```

### <a id="testListOrgOverrides" href="#testListOrgOverrides">func testListOrgOverrides(t *testing.T)</a>

```
searchKey: database.testListOrgOverrides
tags: [private]
```

```Go
func testListOrgOverrides(t *testing.T)
```

### <a id="testUserFlags" href="#testUserFlags">func testUserFlags(t *testing.T)</a>

```
searchKey: database.testUserFlags
tags: [private]
```

```Go
func testUserFlags(t *testing.T)
```

### <a id="testAnonymousUserFlags" href="#testAnonymousUserFlags">func testAnonymousUserFlags(t *testing.T)</a>

```
searchKey: database.testAnonymousUserFlags
tags: [private]
```

```Go
func testAnonymousUserFlags(t *testing.T)
```

### <a id="testUserlessFeatureFlags" href="#testUserlessFeatureFlags">func testUserlessFeatureFlags(t *testing.T)</a>

```
searchKey: database.testUserlessFeatureFlags
tags: [private]
```

```Go
func testUserlessFeatureFlags(t *testing.T)
```

### <a id="TestIterateRepoGitserverStatus" href="#TestIterateRepoGitserverStatus">func TestIterateRepoGitserverStatus(t *testing.T)</a>

```
searchKey: database.TestIterateRepoGitserverStatus
tags: [private]
```

```Go
func TestIterateRepoGitserverStatus(t *testing.T)
```

### <a id="TestGitserverReposGetByID" href="#TestGitserverReposGetByID">func TestGitserverReposGetByID(t *testing.T)</a>

```
searchKey: database.TestGitserverReposGetByID
tags: [private]
```

```Go
func TestGitserverReposGetByID(t *testing.T)
```

### <a id="TestSetCloneStatus" href="#TestSetCloneStatus">func TestSetCloneStatus(t *testing.T)</a>

```
searchKey: database.TestSetCloneStatus
tags: [private]
```

```Go
func TestSetCloneStatus(t *testing.T)
```

### <a id="TestSetLastError" href="#TestSetLastError">func TestSetLastError(t *testing.T)</a>

```
searchKey: database.TestSetLastError
tags: [private]
```

```Go
func TestSetLastError(t *testing.T)
```

### <a id="TestGitserverRepoUpsertNullShard" href="#TestGitserverRepoUpsertNullShard">func TestGitserverRepoUpsertNullShard(t *testing.T)</a>

```
searchKey: database.TestGitserverRepoUpsertNullShard
tags: [private]
```

```Go
func TestGitserverRepoUpsertNullShard(t *testing.T)
```

### <a id="TestGitserverRepoUpsert" href="#TestGitserverRepoUpsert">func TestGitserverRepoUpsert(t *testing.T)</a>

```
searchKey: database.TestGitserverRepoUpsert
tags: [private]
```

```Go
func TestGitserverRepoUpsert(t *testing.T)
```

### <a id="TestSanitizeToUTF8" href="#TestSanitizeToUTF8">func TestSanitizeToUTF8(t *testing.T)</a>

```
searchKey: database.TestSanitizeToUTF8
tags: [private]
```

```Go
func TestSanitizeToUTF8(t *testing.T)
```

### <a id="init.main_test.go" href="#init.main_test.go">func init()</a>

```
searchKey: database.init
tags: [private]
```

```Go
func init()
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: database.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestNamespaces" href="#TestNamespaces">func TestNamespaces(t *testing.T)</a>

```
searchKey: database.TestNamespaces
tags: [private]
```

```Go
func TestNamespaces(t *testing.T)
```

### <a id="TestExternalServiceConfigMigrator" href="#TestExternalServiceConfigMigrator">func TestExternalServiceConfigMigrator(t *testing.T)</a>

```
searchKey: database.TestExternalServiceConfigMigrator
tags: [private]
```

```Go
func TestExternalServiceConfigMigrator(t *testing.T)
```

### <a id="TestExternalAccountsMigrator" href="#TestExternalAccountsMigrator">func TestExternalAccountsMigrator(t *testing.T)</a>

```
searchKey: database.TestExternalAccountsMigrator
tags: [private]
```

```Go
func TestExternalAccountsMigrator(t *testing.T)
```

### <a id="TestOrgInvitations" href="#TestOrgInvitations">func TestOrgInvitations(t *testing.T)</a>

```
searchKey: database.TestOrgInvitations
tags: [private]
```

```Go
func TestOrgInvitations(t *testing.T)
```

🚨 SECURITY: This tests the routine that creates org invitations and returns the invitation secret value to the user. 

### <a id="TestOrgMembers_CreateMembershipInOrgsForAllUsers" href="#TestOrgMembers_CreateMembershipInOrgsForAllUsers">func TestOrgMembers_CreateMembershipInOrgsForAllUsers(t *testing.T)</a>

```
searchKey: database.TestOrgMembers_CreateMembershipInOrgsForAllUsers
tags: [private]
```

```Go
func TestOrgMembers_CreateMembershipInOrgsForAllUsers(t *testing.T)
```

### <a id="TestOrgs_ValidNames" href="#TestOrgs_ValidNames">func TestOrgs_ValidNames(t *testing.T)</a>

```
searchKey: database.TestOrgs_ValidNames
tags: [private]
```

```Go
func TestOrgs_ValidNames(t *testing.T)
```

### <a id="TestOrgs_Count" href="#TestOrgs_Count">func TestOrgs_Count(t *testing.T)</a>

```
searchKey: database.TestOrgs_Count
tags: [private]
```

```Go
func TestOrgs_Count(t *testing.T)
```

### <a id="TestOrgs_Delete" href="#TestOrgs_Delete">func TestOrgs_Delete(t *testing.T)</a>

```
searchKey: database.TestOrgs_Delete
tags: [private]
```

```Go
func TestOrgs_Delete(t *testing.T)
```

### <a id="sortedRepoNames" href="#sortedRepoNames">func sortedRepoNames(repos []*types.Repo) []api.RepoName</a>

```
searchKey: database.sortedRepoNames
tags: [private]
```

```Go
func sortedRepoNames(repos []*types.Repo) []api.RepoName
```

### <a id="repoNames" href="#repoNames">func repoNames(repos []*types.Repo) []api.RepoName</a>

```
searchKey: database.repoNames
tags: [private]
```

```Go
func repoNames(repos []*types.Repo) []api.RepoName
```

### <a id="createRepo" href="#createRepo">func createRepo(ctx context.Context, t *testing.T, db *sql.DB, repo *types.Repo)</a>

```
searchKey: database.createRepo
tags: [private]
```

```Go
func createRepo(ctx context.Context, t *testing.T, db *sql.DB, repo *types.Repo)
```

### <a id="mustCreate" href="#mustCreate">func mustCreate(ctx context.Context, t *testing.T, db *sql.DB, repo *types.Repo, cloneStatus types.CloneStatus) []*types.Repo</a>

```
searchKey: database.mustCreate
tags: [private]
```

```Go
func mustCreate(ctx context.Context, t *testing.T, db *sql.DB, repo *types.Repo, cloneStatus types.CloneStatus) []*types.Repo
```

### <a id="repoNamesFromRepos" href="#repoNamesFromRepos">func repoNamesFromRepos(repos []*types.Repo) []types.RepoName</a>

```
searchKey: database.repoNamesFromRepos
tags: [private]
```

```Go
func repoNamesFromRepos(repos []*types.Repo) []types.RepoName
```

### <a id="reposFromRepoNames" href="#reposFromRepoNames">func reposFromRepoNames(names []types.RepoName) []*types.Repo</a>

```
searchKey: database.reposFromRepoNames
tags: [private]
```

```Go
func reposFromRepoNames(names []types.RepoName) []*types.Repo
```

### <a id="TestRepos_Get" href="#TestRepos_Get">func TestRepos_Get(t *testing.T)</a>

```
searchKey: database.TestRepos_Get
tags: [private]
```

```Go
func TestRepos_Get(t *testing.T)
```

### <a id="TestRepos_GetByIDs" href="#TestRepos_GetByIDs">func TestRepos_GetByIDs(t *testing.T)</a>

```
searchKey: database.TestRepos_GetByIDs
tags: [private]
```

```Go
func TestRepos_GetByIDs(t *testing.T)
```

### <a id="TestRepos_List" href="#TestRepos_List">func TestRepos_List(t *testing.T)</a>

```
searchKey: database.TestRepos_List
tags: [private]
```

```Go
func TestRepos_List(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_userID" href="#TestRepos_ListRepoNames_userID">func TestRepos_ListRepoNames_userID(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_userID
tags: [private]
```

```Go
func TestRepos_ListRepoNames_userID(t *testing.T)
```

### <a id="TestRepos_List_fork" href="#TestRepos_List_fork">func TestRepos_List_fork(t *testing.T)</a>

```
searchKey: database.TestRepos_List_fork
tags: [private]
```

```Go
func TestRepos_List_fork(t *testing.T)
```

### <a id="TestRepos_List_FailedSync" href="#TestRepos_List_FailedSync">func TestRepos_List_FailedSync(t *testing.T)</a>

```
searchKey: database.TestRepos_List_FailedSync
tags: [private]
```

```Go
func TestRepos_List_FailedSync(t *testing.T)
```

### <a id="TestRepos_List_cloned" href="#TestRepos_List_cloned">func TestRepos_List_cloned(t *testing.T)</a>

```
searchKey: database.TestRepos_List_cloned
tags: [private]
```

```Go
func TestRepos_List_cloned(t *testing.T)
```

### <a id="TestRepos_List_ids" href="#TestRepos_List_ids">func TestRepos_List_ids(t *testing.T)</a>

```
searchKey: database.TestRepos_List_ids
tags: [private]
```

```Go
func TestRepos_List_ids(t *testing.T)
```

### <a id="TestRepos_List_serviceTypes" href="#TestRepos_List_serviceTypes">func TestRepos_List_serviceTypes(t *testing.T)</a>

```
searchKey: database.TestRepos_List_serviceTypes
tags: [private]
```

```Go
func TestRepos_List_serviceTypes(t *testing.T)
```

### <a id="TestRepos_List_pagination" href="#TestRepos_List_pagination">func TestRepos_List_pagination(t *testing.T)</a>

```
searchKey: database.TestRepos_List_pagination
tags: [private]
```

```Go
func TestRepos_List_pagination(t *testing.T)
```

### <a id="TestRepos_List_query1" href="#TestRepos_List_query1">func TestRepos_List_query1(t *testing.T)</a>

```
searchKey: database.TestRepos_List_query1
tags: [private]
```

```Go
func TestRepos_List_query1(t *testing.T)
```

TestRepos_List_query tests the behavior of Repos.List when called with a query. Test batch 1 (correct filtering) 

### <a id="TestRepos_List_correct_ranking" href="#TestRepos_List_correct_ranking">func TestRepos_List_correct_ranking(t *testing.T)</a>

```
searchKey: database.TestRepos_List_correct_ranking
tags: [private]
```

```Go
func TestRepos_List_correct_ranking(t *testing.T)
```

Test batch 2 (correct ranking) 

### <a id="TestRepos_List_sort" href="#TestRepos_List_sort">func TestRepos_List_sort(t *testing.T)</a>

```
searchKey: database.TestRepos_List_sort
tags: [private]
```

```Go
func TestRepos_List_sort(t *testing.T)
```

Test sort 

### <a id="TestRepos_List_patterns" href="#TestRepos_List_patterns">func TestRepos_List_patterns(t *testing.T)</a>

```
searchKey: database.TestRepos_List_patterns
tags: [private]
```

```Go
func TestRepos_List_patterns(t *testing.T)
```

TestRepos_List_patterns tests the behavior of Repos.List when called with IncludePatterns and ExcludePattern. 

### <a id="TestRepos_List_queryPattern" href="#TestRepos_List_queryPattern">func TestRepos_List_queryPattern(t *testing.T)</a>

```
searchKey: database.TestRepos_List_queryPattern
tags: [private]
```

```Go
func TestRepos_List_queryPattern(t *testing.T)
```

TestRepos_List_patterns tests the behavior of Repos.List when called with a QueryPattern. 

### <a id="TestRepos_List_queryAndPatternsMutuallyExclusive" href="#TestRepos_List_queryAndPatternsMutuallyExclusive">func TestRepos_List_queryAndPatternsMutuallyExclusive(t *testing.T)</a>

```
searchKey: database.TestRepos_List_queryAndPatternsMutuallyExclusive
tags: [private]
```

```Go
func TestRepos_List_queryAndPatternsMutuallyExclusive(t *testing.T)
```

### <a id="TestRepos_createRepo" href="#TestRepos_createRepo">func TestRepos_createRepo(t *testing.T)</a>

```
searchKey: database.TestRepos_createRepo
tags: [private]
```

```Go
func TestRepos_createRepo(t *testing.T)
```

### <a id="TestRepos_List_useOr" href="#TestRepos_List_useOr">func TestRepos_List_useOr(t *testing.T)</a>

```
searchKey: database.TestRepos_List_useOr
tags: [private]
```

```Go
func TestRepos_List_useOr(t *testing.T)
```

### <a id="TestRepos_List_externalServiceID" href="#TestRepos_List_externalServiceID">func TestRepos_List_externalServiceID(t *testing.T)</a>

```
searchKey: database.TestRepos_List_externalServiceID
tags: [private]
```

```Go
func TestRepos_List_externalServiceID(t *testing.T)
```

### <a id="TestRepos_ListRepoNames" href="#TestRepos_ListRepoNames">func TestRepos_ListRepoNames(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames
tags: [private]
```

```Go
func TestRepos_ListRepoNames(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_fork" href="#TestRepos_ListRepoNames_fork">func TestRepos_ListRepoNames_fork(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_fork
tags: [private]
```

```Go
func TestRepos_ListRepoNames_fork(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_cloned" href="#TestRepos_ListRepoNames_cloned">func TestRepos_ListRepoNames_cloned(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_cloned
tags: [private]
```

```Go
func TestRepos_ListRepoNames_cloned(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_ids" href="#TestRepos_ListRepoNames_ids">func TestRepos_ListRepoNames_ids(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_ids
tags: [private]
```

```Go
func TestRepos_ListRepoNames_ids(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_serviceTypes" href="#TestRepos_ListRepoNames_serviceTypes">func TestRepos_ListRepoNames_serviceTypes(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_serviceTypes
tags: [private]
```

```Go
func TestRepos_ListRepoNames_serviceTypes(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_pagination" href="#TestRepos_ListRepoNames_pagination">func TestRepos_ListRepoNames_pagination(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_pagination
tags: [private]
```

```Go
func TestRepos_ListRepoNames_pagination(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_correctFiltering" href="#TestRepos_ListRepoNames_correctFiltering">func TestRepos_ListRepoNames_correctFiltering(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_correctFiltering
tags: [private]
```

```Go
func TestRepos_ListRepoNames_correctFiltering(t *testing.T)
```

TestRepos_ListRepoNames_query tests the behavior of Repos.ListRepoNames when called with a query. Test batch 1 (correct filtering) 

### <a id="TestRepos_ListRepoNames_query2" href="#TestRepos_ListRepoNames_query2">func TestRepos_ListRepoNames_query2(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_query2
tags: [private]
```

```Go
func TestRepos_ListRepoNames_query2(t *testing.T)
```

Test batch 2 (correct ranking) 

### <a id="TestRepos_ListRepoNames_sort" href="#TestRepos_ListRepoNames_sort">func TestRepos_ListRepoNames_sort(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_sort
tags: [private]
```

```Go
func TestRepos_ListRepoNames_sort(t *testing.T)
```

Test sort 

### <a id="TestRepos_ListRepoNames_patterns" href="#TestRepos_ListRepoNames_patterns">func TestRepos_ListRepoNames_patterns(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_patterns
tags: [private]
```

```Go
func TestRepos_ListRepoNames_patterns(t *testing.T)
```

TestRepos_ListRepoNames_patterns tests the behavior of Repos.List when called with IncludePatterns and ExcludePattern. 

### <a id="TestRepos_ListRepoNames_queryPattern" href="#TestRepos_ListRepoNames_queryPattern">func TestRepos_ListRepoNames_queryPattern(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_queryPattern
tags: [private]
```

```Go
func TestRepos_ListRepoNames_queryPattern(t *testing.T)
```

TestRepos_ListRepoNames_patterns tests the behavior of Repos.List when called with a QueryPattern. 

### <a id="TestRepos_ListRepoNames_queryAndPatternsMutuallyExclusive" href="#TestRepos_ListRepoNames_queryAndPatternsMutuallyExclusive">func TestRepos_ListRepoNames_queryAndPatternsMutuallyExclusive(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_queryAndPatternsMutuallyExclusive
tags: [private]
```

```Go
func TestRepos_ListRepoNames_queryAndPatternsMutuallyExclusive(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_UserIDAndExternalServiceIDsMutuallyExclusive" href="#TestRepos_ListRepoNames_UserIDAndExternalServiceIDsMutuallyExclusive">func TestRepos_ListRepoNames_UserIDAndExternalServiceIDsMutuallyExclusive(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_UserIDAndExternalServiceIDsMutuallyExclusive
tags: [private]
```

```Go
func TestRepos_ListRepoNames_UserIDAndExternalServiceIDsMutuallyExclusive(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_useOr" href="#TestRepos_ListRepoNames_useOr">func TestRepos_ListRepoNames_useOr(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_useOr
tags: [private]
```

```Go
func TestRepos_ListRepoNames_useOr(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_externalServiceID" href="#TestRepos_ListRepoNames_externalServiceID">func TestRepos_ListRepoNames_externalServiceID(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_externalServiceID
tags: [private]
```

```Go
func TestRepos_ListRepoNames_externalServiceID(t *testing.T)
```

### <a id="TestRepos_ListRepoNames_externalRepoPrefixes" href="#TestRepos_ListRepoNames_externalRepoPrefixes">func TestRepos_ListRepoNames_externalRepoPrefixes(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepoNames_externalRepoPrefixes
tags: [private]
```

```Go
func TestRepos_ListRepoNames_externalRepoPrefixes(t *testing.T)
```

This function tests for both individual uses of ExternalRepoIncludePrefixes, ExternalRepoExcludePrefixes as well as combination of these two options. 

### <a id="TestRepos_createRepo_dupe" href="#TestRepos_createRepo_dupe">func TestRepos_createRepo_dupe(t *testing.T)</a>

```
searchKey: database.TestRepos_createRepo_dupe
tags: [private]
```

```Go
func TestRepos_createRepo_dupe(t *testing.T)
```

### <a id="TestRepos_ListRepos_UserPublicRepos" href="#TestRepos_ListRepos_UserPublicRepos">func TestRepos_ListRepos_UserPublicRepos(t *testing.T)</a>

```
searchKey: database.TestRepos_ListRepos_UserPublicRepos
tags: [private]
```

```Go
func TestRepos_ListRepos_UserPublicRepos(t *testing.T)
```

### <a id="TestRepos_RepoExternalServices" href="#TestRepos_RepoExternalServices">func TestRepos_RepoExternalServices(t *testing.T)</a>

```
searchKey: database.TestRepos_RepoExternalServices
tags: [private]
```

```Go
func TestRepos_RepoExternalServices(t *testing.T)
```

### <a id="initUserAndRepo" href="#initUserAndRepo">func initUserAndRepo(t *testing.T, ctx context.Context, db dbutil.DB) (*types.User, *types.Repo)</a>

```
searchKey: database.initUserAndRepo
tags: [private]
```

```Go
func initUserAndRepo(t *testing.T, ctx context.Context, db dbutil.DB) (*types.User, *types.Repo)
```

### <a id="TestAuthzQueryConds" href="#TestAuthzQueryConds">func TestAuthzQueryConds(t *testing.T)</a>

```
searchKey: database.TestAuthzQueryConds
tags: [private]
```

```Go
func TestAuthzQueryConds(t *testing.T)
```

🚨 SECURITY: Tests are necessary to ensure security. 

### <a id="TestRepos_nonSiteAdminCanViewOwnPrivateCode" href="#TestRepos_nonSiteAdminCanViewOwnPrivateCode">func TestRepos_nonSiteAdminCanViewOwnPrivateCode(t *testing.T)</a>

```
searchKey: database.TestRepos_nonSiteAdminCanViewOwnPrivateCode
tags: [private]
```

```Go
func TestRepos_nonSiteAdminCanViewOwnPrivateCode(t *testing.T)
```

### <a id="TestRepos_getReposBySQL_checkPermissions" href="#TestRepos_getReposBySQL_checkPermissions">func TestRepos_getReposBySQL_checkPermissions(t *testing.T)</a>

```
searchKey: database.TestRepos_getReposBySQL_checkPermissions
tags: [private]
```

```Go
func TestRepos_getReposBySQL_checkPermissions(t *testing.T)
```

🚨 SECURITY: Tests are necessary to ensure security. 

### <a id="TestRepos_getReposBySQL_permissionsUserMapping" href="#TestRepos_getReposBySQL_permissionsUserMapping">func TestRepos_getReposBySQL_permissionsUserMapping(t *testing.T)</a>

```
searchKey: database.TestRepos_getReposBySQL_permissionsUserMapping
tags: [private]
```

```Go
func TestRepos_getReposBySQL_permissionsUserMapping(t *testing.T)
```

🚨 SECURITY: Tests are necessary to ensure security. 

### <a id="TestParseIncludePattern" href="#TestParseIncludePattern">func TestParseIncludePattern(t *testing.T)</a>

```
searchKey: database.TestParseIncludePattern
tags: [private]
```

```Go
func TestParseIncludePattern(t *testing.T)
```

### <a id="queriesToString" href="#queriesToString">func queriesToString(qs []*sqlf.Query) string</a>

```
searchKey: database.queriesToString
tags: [private]
```

```Go
func queriesToString(qs []*sqlf.Query) string
```

### <a id="TestRepos_Count" href="#TestRepos_Count">func TestRepos_Count(t *testing.T)</a>

```
searchKey: database.TestRepos_Count
tags: [private]
```

```Go
func TestRepos_Count(t *testing.T)
```

### <a id="TestRepos_Delete" href="#TestRepos_Delete">func TestRepos_Delete(t *testing.T)</a>

```
searchKey: database.TestRepos_Delete
tags: [private]
```

```Go
func TestRepos_Delete(t *testing.T)
```

### <a id="TestRepos_Upsert" href="#TestRepos_Upsert">func TestRepos_Upsert(t *testing.T)</a>

```
searchKey: database.TestRepos_Upsert
tags: [private]
```

```Go
func TestRepos_Upsert(t *testing.T)
```

### <a id="TestRepos_UpsertForkAndArchivedFields" href="#TestRepos_UpsertForkAndArchivedFields">func TestRepos_UpsertForkAndArchivedFields(t *testing.T)</a>

```
searchKey: database.TestRepos_UpsertForkAndArchivedFields
tags: [private]
```

```Go
func TestRepos_UpsertForkAndArchivedFields(t *testing.T)
```

### <a id="hasNoID" href="#hasNoID">func hasNoID(r *types.Repo) bool</a>

```
searchKey: database.hasNoID
tags: [private]
```

```Go
func hasNoID(r *types.Repo) bool
```

### <a id="TestRepos_Create" href="#TestRepos_Create">func TestRepos_Create(t *testing.T)</a>

```
searchKey: database.TestRepos_Create
tags: [private]
```

```Go
func TestRepos_Create(t *testing.T)
```

### <a id="TestListDefaultReposUncloned" href="#TestListDefaultReposUncloned">func TestListDefaultReposUncloned(t *testing.T)</a>

```
searchKey: database.TestListDefaultReposUncloned
tags: [private]
```

```Go
func TestListDefaultReposUncloned(t *testing.T)
```

### <a id="TestSavedSearchesIsEmpty" href="#TestSavedSearchesIsEmpty">func TestSavedSearchesIsEmpty(t *testing.T)</a>

```
searchKey: database.TestSavedSearchesIsEmpty
tags: [private]
```

```Go
func TestSavedSearchesIsEmpty(t *testing.T)
```

### <a id="TestSavedSearchesCreate" href="#TestSavedSearchesCreate">func TestSavedSearchesCreate(t *testing.T)</a>

```
searchKey: database.TestSavedSearchesCreate
tags: [private]
```

```Go
func TestSavedSearchesCreate(t *testing.T)
```

### <a id="TestSavedSearchesUpdate" href="#TestSavedSearchesUpdate">func TestSavedSearchesUpdate(t *testing.T)</a>

```
searchKey: database.TestSavedSearchesUpdate
tags: [private]
```

```Go
func TestSavedSearchesUpdate(t *testing.T)
```

### <a id="TestSavedSearchesDelete" href="#TestSavedSearchesDelete">func TestSavedSearchesDelete(t *testing.T)</a>

```
searchKey: database.TestSavedSearchesDelete
tags: [private]
```

```Go
func TestSavedSearchesDelete(t *testing.T)
```

### <a id="TestSavedSearchesGetByUserID" href="#TestSavedSearchesGetByUserID">func TestSavedSearchesGetByUserID(t *testing.T)</a>

```
searchKey: database.TestSavedSearchesGetByUserID
tags: [private]
```

```Go
func TestSavedSearchesGetByUserID(t *testing.T)
```

### <a id="TestSavedSearchesGetByID" href="#TestSavedSearchesGetByID">func TestSavedSearchesGetByID(t *testing.T)</a>

```
searchKey: database.TestSavedSearchesGetByID
tags: [private]
```

```Go
func TestSavedSearchesGetByID(t *testing.T)
```

### <a id="TestListSavedSearchesByUserID" href="#TestListSavedSearchesByUserID">func TestListSavedSearchesByUserID(t *testing.T)</a>

```
searchKey: database.TestListSavedSearchesByUserID
tags: [private]
```

```Go
func TestListSavedSearchesByUserID(t *testing.T)
```

### <a id="createSearchContexts" href="#createSearchContexts">func createSearchContexts(ctx context.Context, store *SearchContextsStore, searchContexts []*types.SearchContext) ([]*types.SearchContext, error)</a>

```
searchKey: database.createSearchContexts
tags: [private]
```

```Go
func createSearchContexts(ctx context.Context, store *SearchContextsStore, searchContexts []*types.SearchContext) ([]*types.SearchContext, error)
```

### <a id="TestSearchContexts_Get" href="#TestSearchContexts_Get">func TestSearchContexts_Get(t *testing.T)</a>

```
searchKey: database.TestSearchContexts_Get
tags: [private]
```

```Go
func TestSearchContexts_Get(t *testing.T)
```

### <a id="TestSearchContexts_Update" href="#TestSearchContexts_Update">func TestSearchContexts_Update(t *testing.T)</a>

```
searchKey: database.TestSearchContexts_Update
tags: [private]
```

```Go
func TestSearchContexts_Update(t *testing.T)
```

### <a id="TestSearchContexts_List" href="#TestSearchContexts_List">func TestSearchContexts_List(t *testing.T)</a>

```
searchKey: database.TestSearchContexts_List
tags: [private]
```

```Go
func TestSearchContexts_List(t *testing.T)
```

### <a id="TestSearchContexts_PaginationAndCount" href="#TestSearchContexts_PaginationAndCount">func TestSearchContexts_PaginationAndCount(t *testing.T)</a>

```
searchKey: database.TestSearchContexts_PaginationAndCount
tags: [private]
```

```Go
func TestSearchContexts_PaginationAndCount(t *testing.T)
```

### <a id="TestSearchContexts_CaseInsensitiveNames" href="#TestSearchContexts_CaseInsensitiveNames">func TestSearchContexts_CaseInsensitiveNames(t *testing.T)</a>

```
searchKey: database.TestSearchContexts_CaseInsensitiveNames
tags: [private]
```

```Go
func TestSearchContexts_CaseInsensitiveNames(t *testing.T)
```

### <a id="TestSearchContexts_CreateAndSetRepositoryRevisions" href="#TestSearchContexts_CreateAndSetRepositoryRevisions">func TestSearchContexts_CreateAndSetRepositoryRevisions(t *testing.T)</a>

```
searchKey: database.TestSearchContexts_CreateAndSetRepositoryRevisions
tags: [private]
```

```Go
func TestSearchContexts_CreateAndSetRepositoryRevisions(t *testing.T)
```

### <a id="TestSearchContexts_Permissions" href="#TestSearchContexts_Permissions">func TestSearchContexts_Permissions(t *testing.T)</a>

```
searchKey: database.TestSearchContexts_Permissions
tags: [private]
```

```Go
func TestSearchContexts_Permissions(t *testing.T)
```

### <a id="TestSearchContexts_Delete" href="#TestSearchContexts_Delete">func TestSearchContexts_Delete(t *testing.T)</a>

```
searchKey: database.TestSearchContexts_Delete
tags: [private]
```

```Go
func TestSearchContexts_Delete(t *testing.T)
```

### <a id="reverseSearchContextsSlice" href="#reverseSearchContextsSlice">func reverseSearchContextsSlice(s []*types.SearchContext) []*types.SearchContext</a>

```
searchKey: database.reverseSearchContextsSlice
tags: [private]
```

```Go
func reverseSearchContextsSlice(s []*types.SearchContext) []*types.SearchContext
```

### <a id="getSearchContextNames" href="#getSearchContextNames">func getSearchContextNames(s []*types.SearchContext) []string</a>

```
searchKey: database.getSearchContextNames
tags: [private]
```

```Go
func getSearchContextNames(s []*types.SearchContext) []string
```

### <a id="TestSearchContexts_OrderBy" href="#TestSearchContexts_OrderBy">func TestSearchContexts_OrderBy(t *testing.T)</a>

```
searchKey: database.TestSearchContexts_OrderBy
tags: [private]
```

```Go
func TestSearchContexts_OrderBy(t *testing.T)
```

### <a id="TestSecurityEventLogs_ValidInfo" href="#TestSecurityEventLogs_ValidInfo">func TestSecurityEventLogs_ValidInfo(t *testing.T)</a>

```
searchKey: database.TestSecurityEventLogs_ValidInfo
tags: [private]
```

```Go
func TestSecurityEventLogs_ValidInfo(t *testing.T)
```

### <a id="TestSettings_ListAll" href="#TestSettings_ListAll">func TestSettings_ListAll(t *testing.T)</a>

```
searchKey: database.TestSettings_ListAll
tags: [private]
```

```Go
func TestSettings_ListAll(t *testing.T)
```

### <a id="TestCreateIfUpToDate" href="#TestCreateIfUpToDate">func TestCreateIfUpToDate(t *testing.T)</a>

```
searchKey: database.TestCreateIfUpToDate
tags: [private]
```

```Go
func TestCreateIfUpToDate(t *testing.T)
```

### <a id="TestGetLatestSchemaSettings" href="#TestGetLatestSchemaSettings">func TestGetLatestSchemaSettings(t *testing.T)</a>

```
searchKey: database.TestGetLatestSchemaSettings
tags: [private]
```

```Go
func TestGetLatestSchemaSettings(t *testing.T)
```

### <a id="TestSurveyResponses_Create_Count" href="#TestSurveyResponses_Create_Count">func TestSurveyResponses_Create_Count(t *testing.T)</a>

```
searchKey: database.TestSurveyResponses_Create_Count
tags: [private]
```

```Go
func TestSurveyResponses_Create_Count(t *testing.T)
```

TestSurveyResponses_Create_Count tests creation and counting of database survey responses 

### <a id="TestUserCredential_Authenticator" href="#TestUserCredential_Authenticator">func TestUserCredential_Authenticator(t *testing.T)</a>

```
searchKey: database.TestUserCredential_Authenticator
tags: [private]
```

```Go
func TestUserCredential_Authenticator(t *testing.T)
```

### <a id="TestUserCredential_SetAuthenticator" href="#TestUserCredential_SetAuthenticator">func TestUserCredential_SetAuthenticator(t *testing.T)</a>

```
searchKey: database.TestUserCredential_SetAuthenticator
tags: [private]
```

```Go
func TestUserCredential_SetAuthenticator(t *testing.T)
```

### <a id="TestUserCredentials_CreateUpdate" href="#TestUserCredentials_CreateUpdate">func TestUserCredentials_CreateUpdate(t *testing.T)</a>

```
searchKey: database.TestUserCredentials_CreateUpdate
tags: [private]
```

```Go
func TestUserCredentials_CreateUpdate(t *testing.T)
```

### <a id="TestUserCredentials_Delete" href="#TestUserCredentials_Delete">func TestUserCredentials_Delete(t *testing.T)</a>

```
searchKey: database.TestUserCredentials_Delete
tags: [private]
```

```Go
func TestUserCredentials_Delete(t *testing.T)
```

### <a id="TestUserCredentials_GetByID" href="#TestUserCredentials_GetByID">func TestUserCredentials_GetByID(t *testing.T)</a>

```
searchKey: database.TestUserCredentials_GetByID
tags: [private]
```

```Go
func TestUserCredentials_GetByID(t *testing.T)
```

### <a id="TestUserCredentials_GetByScope" href="#TestUserCredentials_GetByScope">func TestUserCredentials_GetByScope(t *testing.T)</a>

```
searchKey: database.TestUserCredentials_GetByScope
tags: [private]
```

```Go
func TestUserCredentials_GetByScope(t *testing.T)
```

### <a id="TestUserCredentials_List" href="#TestUserCredentials_List">func TestUserCredentials_List(t *testing.T)</a>

```
searchKey: database.TestUserCredentials_List
tags: [private]
```

```Go
func TestUserCredentials_List(t *testing.T)
```

### <a id="TestUserCredentials_Invalid" href="#TestUserCredentials_Invalid">func TestUserCredentials_Invalid(t *testing.T)</a>

```
searchKey: database.TestUserCredentials_Invalid
tags: [private]
```

```Go
func TestUserCredentials_Invalid(t *testing.T)
```

### <a id="TestUserCredentialNotFoundErr" href="#TestUserCredentialNotFoundErr">func TestUserCredentialNotFoundErr(t *testing.T)</a>

```
searchKey: database.TestUserCredentialNotFoundErr
tags: [private]
```

```Go
func TestUserCredentialNotFoundErr(t *testing.T)
```

### <a id="createUserCredentialAuths" href="#createUserCredentialAuths">func createUserCredentialAuths(t *testing.T) map[string]auth.Authenticator</a>

```
searchKey: database.createUserCredentialAuths
tags: [private]
```

```Go
func createUserCredentialAuths(t *testing.T) map[string]auth.Authenticator
```

### <a id="setUpUserCredentialTest" href="#setUpUserCredentialTest">func setUpUserCredentialTest(t *testing.T, db *sql.DB) (context.Context, encryption.Key, *types.User)</a>

```
searchKey: database.setUpUserCredentialTest
tags: [private]
```

```Go
func setUpUserCredentialTest(t *testing.T, db *sql.DB) (context.Context, encryption.Key, *types.User)
```

### <a id="TestUserEmail_NeedsVerificationCoolDown" href="#TestUserEmail_NeedsVerificationCoolDown">func TestUserEmail_NeedsVerificationCoolDown(t *testing.T)</a>

```
searchKey: database.TestUserEmail_NeedsVerificationCoolDown
tags: [private]
```

```Go
func TestUserEmail_NeedsVerificationCoolDown(t *testing.T)
```

### <a id="TestUserEmails_Get" href="#TestUserEmails_Get">func TestUserEmails_Get(t *testing.T)</a>

```
searchKey: database.TestUserEmails_Get
tags: [private]
```

```Go
func TestUserEmails_Get(t *testing.T)
```

### <a id="TestUserEmails_GetPrimary" href="#TestUserEmails_GetPrimary">func TestUserEmails_GetPrimary(t *testing.T)</a>

```
searchKey: database.TestUserEmails_GetPrimary
tags: [private]
```

```Go
func TestUserEmails_GetPrimary(t *testing.T)
```

### <a id="TestUserEmails_SetPrimary" href="#TestUserEmails_SetPrimary">func TestUserEmails_SetPrimary(t *testing.T)</a>

```
searchKey: database.TestUserEmails_SetPrimary
tags: [private]
```

```Go
func TestUserEmails_SetPrimary(t *testing.T)
```

### <a id="TestUserEmails_ListByUser" href="#TestUserEmails_ListByUser">func TestUserEmails_ListByUser(t *testing.T)</a>

```
searchKey: database.TestUserEmails_ListByUser
tags: [private]
```

```Go
func TestUserEmails_ListByUser(t *testing.T)
```

### <a id="normalizeUserEmails" href="#normalizeUserEmails">func normalizeUserEmails(userEmails []*UserEmail)</a>

```
searchKey: database.normalizeUserEmails
tags: [private]
```

```Go
func normalizeUserEmails(userEmails []*UserEmail)
```

### <a id="TestUserEmails_Add_Remove" href="#TestUserEmails_Add_Remove">func TestUserEmails_Add_Remove(t *testing.T)</a>

```
searchKey: database.TestUserEmails_Add_Remove
tags: [private]
```

```Go
func TestUserEmails_Add_Remove(t *testing.T)
```

### <a id="TestUserEmails_SetVerified" href="#TestUserEmails_SetVerified">func TestUserEmails_SetVerified(t *testing.T)</a>

```
searchKey: database.TestUserEmails_SetVerified
tags: [private]
```

```Go
func TestUserEmails_SetVerified(t *testing.T)
```

### <a id="isUserEmailVerified" href="#isUserEmailVerified">func isUserEmailVerified(ctx context.Context, db dbutil.DB, userID int32, email string) (bool, error)</a>

```
searchKey: database.isUserEmailVerified
tags: [private]
```

```Go
func isUserEmailVerified(ctx context.Context, db dbutil.DB, userID int32, email string) (bool, error)
```

### <a id="isUserEmailPrimary" href="#isUserEmailPrimary">func isUserEmailPrimary(ctx context.Context, db dbutil.DB, userID int32, email string) (bool, error)</a>

```
searchKey: database.isUserEmailPrimary
tags: [private]
```

```Go
func isUserEmailPrimary(ctx context.Context, db dbutil.DB, userID int32, email string) (bool, error)
```

### <a id="TestUserEmails_SetLastVerificationSentAt" href="#TestUserEmails_SetLastVerificationSentAt">func TestUserEmails_SetLastVerificationSentAt(t *testing.T)</a>

```
searchKey: database.TestUserEmails_SetLastVerificationSentAt
tags: [private]
```

```Go
func TestUserEmails_SetLastVerificationSentAt(t *testing.T)
```

### <a id="TestUserEmails_GetLatestVerificationSentEmail" href="#TestUserEmails_GetLatestVerificationSentEmail">func TestUserEmails_GetLatestVerificationSentEmail(t *testing.T)</a>

```
searchKey: database.TestUserEmails_GetLatestVerificationSentEmail
tags: [private]
```

```Go
func TestUserEmails_GetLatestVerificationSentEmail(t *testing.T)
```

### <a id="TestUserEmails_GetVerifiedEmails" href="#TestUserEmails_GetVerifiedEmails">func TestUserEmails_GetVerifiedEmails(t *testing.T)</a>

```
searchKey: database.TestUserEmails_GetVerifiedEmails
tags: [private]
```

```Go
func TestUserEmails_GetVerifiedEmails(t *testing.T)
```

### <a id="TestUserPublicRepos_Set" href="#TestUserPublicRepos_Set">func TestUserPublicRepos_Set(t *testing.T)</a>

```
searchKey: database.TestUserPublicRepos_Set
tags: [private]
```

```Go
func TestUserPublicRepos_Set(t *testing.T)
```

### <a id="TestUserPublicRepos_SetUserRepos" href="#TestUserPublicRepos_SetUserRepos">func TestUserPublicRepos_SetUserRepos(t *testing.T)</a>

```
searchKey: database.TestUserPublicRepos_SetUserRepos
tags: [private]
```

```Go
func TestUserPublicRepos_SetUserRepos(t *testing.T)
```

### <a id="TestUsers_BuiltinAuth" href="#TestUsers_BuiltinAuth">func TestUsers_BuiltinAuth(t *testing.T)</a>

```
searchKey: database.TestUsers_BuiltinAuth
tags: [private]
```

```Go
func TestUsers_BuiltinAuth(t *testing.T)
```

### <a id="TestUsers_BuiltinAuth_VerifiedEmail" href="#TestUsers_BuiltinAuth_VerifiedEmail">func TestUsers_BuiltinAuth_VerifiedEmail(t *testing.T)</a>

```
searchKey: database.TestUsers_BuiltinAuth_VerifiedEmail
tags: [private]
```

```Go
func TestUsers_BuiltinAuth_VerifiedEmail(t *testing.T)
```

### <a id="TestUsers_BuiltinAuthPasswordResetRateLimit" href="#TestUsers_BuiltinAuthPasswordResetRateLimit">func TestUsers_BuiltinAuthPasswordResetRateLimit(t *testing.T)</a>

```
searchKey: database.TestUsers_BuiltinAuthPasswordResetRateLimit
tags: [private]
```

```Go
func TestUsers_BuiltinAuthPasswordResetRateLimit(t *testing.T)
```

### <a id="TestUsers_UpdatePassword" href="#TestUsers_UpdatePassword">func TestUsers_UpdatePassword(t *testing.T)</a>

```
searchKey: database.TestUsers_UpdatePassword
tags: [private]
```

```Go
func TestUsers_UpdatePassword(t *testing.T)
```

### <a id="TestUsers_CreatePassword" href="#TestUsers_CreatePassword">func TestUsers_CreatePassword(t *testing.T)</a>

```
searchKey: database.TestUsers_CreatePassword
tags: [private]
```

```Go
func TestUsers_CreatePassword(t *testing.T)
```

### <a id="TestUsers_PasswordResetExpiry" href="#TestUsers_PasswordResetExpiry">func TestUsers_PasswordResetExpiry(t *testing.T)</a>

```
searchKey: database.TestUsers_PasswordResetExpiry
tags: [private]
```

```Go
func TestUsers_PasswordResetExpiry(t *testing.T)
```

### <a id="TestUsers_ValidUsernames" href="#TestUsers_ValidUsernames">func TestUsers_ValidUsernames(t *testing.T)</a>

```
searchKey: database.TestUsers_ValidUsernames
tags: [private]
```

```Go
func TestUsers_ValidUsernames(t *testing.T)
```

### <a id="TestUsers_Create_checkPasswordLength" href="#TestUsers_Create_checkPasswordLength">func TestUsers_Create_checkPasswordLength(t *testing.T)</a>

```
searchKey: database.TestUsers_Create_checkPasswordLength
tags: [private]
```

```Go
func TestUsers_Create_checkPasswordLength(t *testing.T)
```

### <a id="TestUsers_Create_SiteAdmin" href="#TestUsers_Create_SiteAdmin">func TestUsers_Create_SiteAdmin(t *testing.T)</a>

```
searchKey: database.TestUsers_Create_SiteAdmin
tags: [private]
```

```Go
func TestUsers_Create_SiteAdmin(t *testing.T)
```

### <a id="TestUsers_CheckAndDecrementInviteQuota" href="#TestUsers_CheckAndDecrementInviteQuota">func TestUsers_CheckAndDecrementInviteQuota(t *testing.T)</a>

```
searchKey: database.TestUsers_CheckAndDecrementInviteQuota
tags: [private]
```

```Go
func TestUsers_CheckAndDecrementInviteQuota(t *testing.T)
```

### <a id="TestUsers_ListCount" href="#TestUsers_ListCount">func TestUsers_ListCount(t *testing.T)</a>

```
searchKey: database.TestUsers_ListCount
tags: [private]
```

```Go
func TestUsers_ListCount(t *testing.T)
```

### <a id="TestUsers_Update" href="#TestUsers_Update">func TestUsers_Update(t *testing.T)</a>

```
searchKey: database.TestUsers_Update
tags: [private]
```

```Go
func TestUsers_Update(t *testing.T)
```

### <a id="TestUsers_GetByVerifiedEmail" href="#TestUsers_GetByVerifiedEmail">func TestUsers_GetByVerifiedEmail(t *testing.T)</a>

```
searchKey: database.TestUsers_GetByVerifiedEmail
tags: [private]
```

```Go
func TestUsers_GetByVerifiedEmail(t *testing.T)
```

### <a id="TestUsers_GetByUsernames" href="#TestUsers_GetByUsernames">func TestUsers_GetByUsernames(t *testing.T)</a>

```
searchKey: database.TestUsers_GetByUsernames
tags: [private]
```

```Go
func TestUsers_GetByUsernames(t *testing.T)
```

### <a id="TestUsers_Delete" href="#TestUsers_Delete">func TestUsers_Delete(t *testing.T)</a>

```
searchKey: database.TestUsers_Delete
tags: [private]
```

```Go
func TestUsers_Delete(t *testing.T)
```

### <a id="TestUsers_HasTag" href="#TestUsers_HasTag">func TestUsers_HasTag(t *testing.T)</a>

```
searchKey: database.TestUsers_HasTag
tags: [private]
```

```Go
func TestUsers_HasTag(t *testing.T)
```

### <a id="TestUsers_InvalidateSessions" href="#TestUsers_InvalidateSessions">func TestUsers_InvalidateSessions(t *testing.T)</a>

```
searchKey: database.TestUsers_InvalidateSessions
tags: [private]
```

```Go
func TestUsers_InvalidateSessions(t *testing.T)
```

### <a id="TestUsers_SetTag" href="#TestUsers_SetTag">func TestUsers_SetTag(t *testing.T)</a>

```
searchKey: database.TestUsers_SetTag
tags: [private]
```

```Go
func TestUsers_SetTag(t *testing.T)
```

### <a id="normalizeUsers" href="#normalizeUsers">func normalizeUsers(users []*types.User) []*types.User</a>

```
searchKey: database.normalizeUsers
tags: [private]
```

```Go
func normalizeUsers(users []*types.User) []*types.User
```

