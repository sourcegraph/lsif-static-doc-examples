# Package types

Package types defines types used by the frontend. 

## Index

* [Constants](#const)
    * [const UnknownAction](#UnknownAction)
    * [const HoverAction](#HoverAction)
    * [const DefinitionsAction](#DefinitionsAction)
    * [const ReferencesAction](#ReferencesAction)
    * [const UnknownSource](#UnknownSource)
    * [const PreciseSource](#PreciseSource)
    * [const SearchSource](#SearchSource)
    * [const RedactedSecret](#RedactedSecret)
    * [const CloneStatusUnknown](#CloneStatusUnknown)
    * [const CloneStatusNotCloned](#CloneStatusNotCloned)
    * [const CloneStatusCloning](#CloneStatusCloning)
    * [const CloneStatusCloned](#CloneStatusCloned)
* [Variables](#var)
    * [var Opt](#Opt)
    * [var Assert](#Assert)
    * [var newValue](#newValue)
* [Types](#type)
    * [type CodeIntelAggregatedEvent struct](#CodeIntelAggregatedEvent)
    * [type NewCodeIntelUsageStatistics struct](#NewCodeIntelUsageStatistics)
    * [type CodeIntelEventSummary struct](#CodeIntelEventSummary)
    * [type CodeIntelAction int](#CodeIntelAction)
    * [type CodeIntelSource int](#CodeIntelSource)
    * [type OldCodeIntelUsageStatistics struct](#OldCodeIntelUsageStatistics)
    * [type OldCodeIntelUsagePeriod struct](#OldCodeIntelUsagePeriod)
    * [type OldCodeIntelEventCategoryStatistics struct](#OldCodeIntelEventCategoryStatistics)
    * [type OldCodeIntelEventStatistics struct](#OldCodeIntelEventStatistics)
    * [type BitbucketServerConnection struct](#BitbucketServerConnection)
    * [type GitHubConnection struct](#GitHubConnection)
    * [type GitLabConnection struct](#GitLabConnection)
    * [type PerforceConnection struct](#PerforceConnection)
    * [type SavedSearch struct](#SavedSearch)
    * [type jsonStringField struct](#jsonStringField)
    * [type ReposAssertion func(testing.TB, github.com/sourcegraph/sourcegraph/internal/types.Repos)](#ReposAssertion)
    * [type ExternalServicesAssertion func(testing.TB, github.com/sourcegraph/sourcegraph/internal/types.ExternalServices)](#ExternalServicesAssertion)
    * [type SourceInfo struct](#SourceInfo)
        * [func (i SourceInfo) ExternalServiceID() int64](#SourceInfo.ExternalServiceID)
    * [type Repo struct](#Repo)
        * [func MakeRepo(name, serviceID, serviceType string, services ...*ExternalService) *Repo](#MakeRepo)
        * [func MakeGithubRepo(services ...*ExternalService) *Repo](#MakeGithubRepo)
        * [func MakeGitlabRepo(services ...*ExternalService) *Repo](#MakeGitlabRepo)
        * [func MakeBitbucketServerRepo(services ...*ExternalService) *Repo](#MakeBitbucketServerRepo)
        * [func MakeAWSCodeCommitRepo(services ...*ExternalService) *Repo](#MakeAWSCodeCommitRepo)
        * [func MakeOtherRepo(services ...*ExternalService) *Repo](#MakeOtherRepo)
        * [func MakeGitoliteRepo(services ...*ExternalService) *Repo](#MakeGitoliteRepo)
        * [func (r *Repo) CloneURLs() []string](#Repo.CloneURLs)
        * [func (r *Repo) IsDeleted() bool](#Repo.IsDeleted)
        * [func (r *Repo) ExternalServiceIDs() []int64](#Repo.ExternalServiceIDs)
        * [func (r *Repo) Update(n *Repo) (modified bool)](#Repo.Update)
        * [func (r *Repo) Clone() *Repo](#Repo.Clone)
        * [func (r *Repo) Apply(opts ...func(*Repo))](#Repo.Apply)
        * [func (r *Repo) With(opts ...func(*Repo)) *Repo](#Repo.With)
        * [func (r *Repo) Less(s *Repo) bool](#Repo.Less)
        * [func (r *Repo) String() string](#Repo.String)
    * [type Repos []*types.Repo](#Repos)
        * [func GenerateRepos(n int, base ...*Repo) Repos](#GenerateRepos)
        * [func (rs Repos) Len() int](#Repos.Len)
        * [func (rs Repos) Less(i, j int) bool](#Repos.Less)
        * [func (rs Repos) Swap(i, j int)](#Repos.Swap)
        * [func (rs Repos) IDs() []api.RepoID](#Repos.IDs)
        * [func (rs Repos) Names() []string](#Repos.Names)
        * [func (rs Repos) NamesSummary() string](#Repos.NamesSummary)
        * [func (rs Repos) Kinds() (kinds []string)](#Repos.Kinds)
        * [func (rs Repos) ExternalRepos() []api.ExternalRepoSpec](#Repos.ExternalRepos)
        * [func (rs Repos) Sources() map[api.RepoID][]SourceInfo](#Repos.Sources)
        * [func (rs *Repos) Concat(others ...Repos)](#Repos.Concat)
        * [func (rs Repos) Clone() Repos](#Repos.Clone)
        * [func (rs Repos) Apply(opts ...func(*Repo))](#Repos.Apply)
        * [func (rs Repos) With(opts ...func(*Repo)) Repos](#Repos.With)
        * [func (rs Repos) Filter(pred func(*Repo) bool) (fs Repos)](#Repos.Filter)
    * [type RepoName struct](#RepoName)
        * [func (r *RepoName) ToRepo() *Repo](#RepoName.ToRepo)
    * [type RepoNames []types.RepoName](#RepoNames)
        * [func (rs RepoNames) Len() int](#RepoNames.Len)
        * [func (rs RepoNames) Less(i, j int) bool](#RepoNames.Less)
        * [func (rs RepoNames) Swap(i, j int)](#RepoNames.Swap)
    * [type CodeHostRepository struct](#CodeHostRepository)
    * [type RepoGitserverStatus struct](#RepoGitserverStatus)
    * [type CloneStatus string](#CloneStatus)
        * [func ParseCloneStatus(s string) CloneStatus](#ParseCloneStatus)
    * [type GitserverRepo struct](#GitserverRepo)
    * [type ExternalService struct](#ExternalService)
        * [func (e *ExternalService) RedactConfigSecrets() error](#ExternalService.RedactConfigSecrets)
        * [func (e *ExternalService) UnredactConfig(old *ExternalService) error](#ExternalService.UnredactConfig)
        * [func (e *ExternalService) URN() string](#ExternalService.URN)
        * [func (e *ExternalService) IsDeleted() bool](#ExternalService.IsDeleted)
        * [func (e *ExternalService) Update(n *ExternalService) (modified bool)](#ExternalService.Update)
        * [func (e *ExternalService) Configuration() (cfg interface{}, _ error)](#ExternalService.Configuration)
        * [func (e *ExternalService) Clone() *ExternalService](#ExternalService.Clone)
        * [func (e *ExternalService) Apply(opts ...func(*ExternalService))](#ExternalService.Apply)
        * [func (e *ExternalService) With(opts ...func(*ExternalService)) *ExternalService](#ExternalService.With)
    * [type ExternalServiceSyncJob struct](#ExternalServiceSyncJob)
    * [type ExternalServices []*types.ExternalService](#ExternalServices)
        * [func MakeExternalServices() ExternalServices](#MakeExternalServices)
        * [func GenerateExternalServices(n int, base ...*ExternalService) ExternalServices](#GenerateExternalServices)
        * [func (es ExternalServices) IDs() []int64](#ExternalServices.IDs)
        * [func (es ExternalServices) DisplayNames() []string](#ExternalServices.DisplayNames)
        * [func (es ExternalServices) Kinds() (kinds []string)](#ExternalServices.Kinds)
        * [func (es ExternalServices) URNs() []string](#ExternalServices.URNs)
        * [func (es ExternalServices) Len() int](#ExternalServices.Len)
        * [func (es ExternalServices) Swap(i, j int)](#ExternalServices.Swap)
        * [func (es ExternalServices) Less(i, j int) bool](#ExternalServices.Less)
        * [func (es ExternalServices) Clone() ExternalServices](#ExternalServices.Clone)
        * [func (es ExternalServices) Apply(opts ...func(*ExternalService))](#ExternalServices.Apply)
        * [func (es ExternalServices) With(opts ...func(*ExternalService)) ExternalServices](#ExternalServices.With)
    * [type GlobalState struct](#GlobalState)
    * [type User struct](#User)
    * [type Org struct](#Org)
    * [type OrgMembership struct](#OrgMembership)
    * [type PhabricatorRepo struct](#PhabricatorRepo)
    * [type UserUsageStatistics struct](#UserUsageStatistics)
    * [type UserUsageCounts struct](#UserUsageCounts)
    * [type UserDates struct](#UserDates)
    * [type SiteUsageStatistics struct](#SiteUsageStatistics)
    * [type SiteActivityPeriod struct](#SiteActivityPeriod)
    * [type BatchChangesUsageStatistics struct](#BatchChangesUsageStatistics)
    * [type BatchChangesCohort struct](#BatchChangesCohort)
    * [type SearchUsageStatistics struct](#SearchUsageStatistics)
    * [type SearchUsagePeriod struct](#SearchUsagePeriod)
    * [type SearchModeUsageStatistics struct](#SearchModeUsageStatistics)
    * [type SearchCountStatistics struct](#SearchCountStatistics)
    * [type SearchEventStatistics struct](#SearchEventStatistics)
    * [type SearchEventLatencies struct](#SearchEventLatencies)
    * [type SiteUsageSummary struct](#SiteUsageSummary)
    * [type SearchAggregatedEvent struct](#SearchAggregatedEvent)
    * [type SurveyResponse struct](#SurveyResponse)
    * [type Event struct](#Event)
    * [type GrowthStatistics struct](#GrowthStatistics)
    * [type SavedSearches struct](#SavedSearches)
    * [type HomepagePanels struct](#HomepagePanels)
    * [type WeeklyRetentionStats struct](#WeeklyRetentionStats)
    * [type RetentionStats struct](#RetentionStats)
    * [type SearchOnboarding struct](#SearchOnboarding)
    * [type ExtensionsUsageStatistics struct](#ExtensionsUsageStatistics)
    * [type ExtensionUsageStatistics struct](#ExtensionUsageStatistics)
    * [type CodeInsightsUsageStatistics struct](#CodeInsightsUsageStatistics)
    * [type InsightUsageStatistics struct](#InsightUsageStatistics)
    * [type PingName string](#PingName)
    * [type AggregatedPingStats struct](#AggregatedPingStats)
    * [type InsightTimeIntervalPing struct](#InsightTimeIntervalPing)
    * [type OrgVisibleInsightPing struct](#OrgVisibleInsightPing)
    * [type CodeMonitoringUsageStatistics struct](#CodeMonitoringUsageStatistics)
    * [type Secret struct](#Secret)
    * [type SearchContext struct](#SearchContext)
    * [type SearchContextRepositoryRevisions struct](#SearchContextRepositoryRevisions)
* [Functions](#func)
    * [func redactField(buf string, fields ...string) (string, error)](#redactField)
    * [func unredactField(old, new string, cfg interface{}, fields ...jsonStringField) (string, error)](#unredactField)
    * [func zeroFields(s interface{}) error](#zeroFields)
    * [func unmarshalConfig(buf string, v interface{}) error](#unmarshalConfig)
    * [func ExternalServicesToMap(es ExternalServices) map[string]*ExternalService](#ExternalServicesToMap)
    * [func sourcesKeys(m map[string]*SourceInfo) []string](#sourcesKeys)
    * [func sortedSliceLess(a, b []string) bool](#sortedSliceLess)
    * [func TestRoundTripRedactExternalServiceConfig(t *testing.T)](#TestRoundTripRedactExternalServiceConfig)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="UnknownAction" href="#UnknownAction">const UnknownAction</a>

```
searchKey: types.UnknownAction
```

```Go
const UnknownAction CodeIntelAction = iota
```

### <a id="HoverAction" href="#HoverAction">const HoverAction</a>

```
searchKey: types.HoverAction
```

```Go
const HoverAction
```

### <a id="DefinitionsAction" href="#DefinitionsAction">const DefinitionsAction</a>

```
searchKey: types.DefinitionsAction
```

```Go
const DefinitionsAction
```

### <a id="ReferencesAction" href="#ReferencesAction">const ReferencesAction</a>

```
searchKey: types.ReferencesAction
```

```Go
const ReferencesAction
```

### <a id="UnknownSource" href="#UnknownSource">const UnknownSource</a>

```
searchKey: types.UnknownSource
```

```Go
const UnknownSource CodeIntelSource = iota
```

### <a id="PreciseSource" href="#PreciseSource">const PreciseSource</a>

```
searchKey: types.PreciseSource
```

```Go
const PreciseSource
```

### <a id="SearchSource" href="#SearchSource">const SearchSource</a>

```
searchKey: types.SearchSource
```

```Go
const SearchSource
```

### <a id="RedactedSecret" href="#RedactedSecret">const RedactedSecret</a>

```
searchKey: types.RedactedSecret
```

```Go
const RedactedSecret = "REDACTED"
```

RedactedSecret is used as a placeholder for secret fields when reading external service config 

### <a id="CloneStatusUnknown" href="#CloneStatusUnknown">const CloneStatusUnknown</a>

```
searchKey: types.CloneStatusUnknown
```

```Go
const CloneStatusUnknown CloneStatus = ""
```

### <a id="CloneStatusNotCloned" href="#CloneStatusNotCloned">const CloneStatusNotCloned</a>

```
searchKey: types.CloneStatusNotCloned
```

```Go
const CloneStatusNotCloned CloneStatus = "not_cloned"
```

### <a id="CloneStatusCloning" href="#CloneStatusCloning">const CloneStatusCloning</a>

```
searchKey: types.CloneStatusCloning
```

```Go
const CloneStatusCloning CloneStatus = "cloning"
```

### <a id="CloneStatusCloned" href="#CloneStatusCloned">const CloneStatusCloned</a>

```
searchKey: types.CloneStatusCloned
```

```Go
const CloneStatusCloned CloneStatus = "cloned"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Opt" href="#Opt">var Opt</a>

```
searchKey: types.Opt
```

```Go
var Opt = ...
```

Opt contains functional options to be used in tests. 

### <a id="Assert" href="#Assert">var Assert</a>

```
searchKey: types.Assert
```

```Go
var Assert = ...
```

Assert contains assertion functions to be used in tests. 

### <a id="newValue" href="#newValue">var newValue</a>

```
searchKey: types.newValue
tags: [private]
```

```Go
var newValue = "a different value"
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CodeIntelAggregatedEvent" href="#CodeIntelAggregatedEvent">type CodeIntelAggregatedEvent struct</a>

```
searchKey: types.CodeIntelAggregatedEvent
```

```Go
type CodeIntelAggregatedEvent struct {
	Name        string
	LanguageID  *string
	Week        time.Time
	TotalWeek   int32
	UniquesWeek int32
}
```

CodeIntelAggregatedEvent represents the total events and unique users within the current week for a single event. The events are split again by language id code intel action (e.g. defintions, references, hovers), and the code intel data source (e.g. precise, search). 

### <a id="NewCodeIntelUsageStatistics" href="#NewCodeIntelUsageStatistics">type NewCodeIntelUsageStatistics struct</a>

```
searchKey: types.NewCodeIntelUsageStatistics
```

```Go
type NewCodeIntelUsageStatistics struct {
	StartOfWeek                         time.Time
	WAUs                                *int32
	PreciseWAUs                         *int32
	SearchBasedWAUs                     *int32
	CrossRepositoryWAUs                 *int32
	PreciseCrossRepositoryWAUs          *int32
	SearchBasedCrossRepositoryWAUs      *int32
	EventSummaries                      []CodeIntelEventSummary
	NumRepositoriesWithUploadRecords    *int32
	NumRepositoriesWithoutUploadRecords *int32
}
```

NewCodeIntelUsageStatistics is the type used within the updatecheck handler. This is sent from private instances to the cloud frontends, where it is further massaged and inserted into a BigQuery. 

### <a id="CodeIntelEventSummary" href="#CodeIntelEventSummary">type CodeIntelEventSummary struct</a>

```
searchKey: types.CodeIntelEventSummary
```

```Go
type CodeIntelEventSummary struct {
	Action          CodeIntelAction
	Source          CodeIntelSource
	LanguageID      string
	CrossRepository bool
	WAUs            int32
	TotalActions    int32
}
```

### <a id="CodeIntelAction" href="#CodeIntelAction">type CodeIntelAction int</a>

```
searchKey: types.CodeIntelAction
```

```Go
type CodeIntelAction int
```

### <a id="CodeIntelSource" href="#CodeIntelSource">type CodeIntelSource int</a>

```
searchKey: types.CodeIntelSource
```

```Go
type CodeIntelSource int
```

### <a id="OldCodeIntelUsageStatistics" href="#OldCodeIntelUsageStatistics">type OldCodeIntelUsageStatistics struct</a>

```
searchKey: types.OldCodeIntelUsageStatistics
```

```Go
type OldCodeIntelUsageStatistics struct {
	Weekly []*OldCodeIntelUsagePeriod
}
```

OldCodeIntelUsageStatistics is an old version the code intelligence usage statics we can receive from a pre-3.22 Sourcegraph instance. 

### <a id="OldCodeIntelUsagePeriod" href="#OldCodeIntelUsagePeriod">type OldCodeIntelUsagePeriod struct</a>

```
searchKey: types.OldCodeIntelUsagePeriod
```

```Go
type OldCodeIntelUsagePeriod struct {
	StartTime   time.Time
	Hover       *OldCodeIntelEventCategoryStatistics
	Definitions *OldCodeIntelEventCategoryStatistics
	References  *OldCodeIntelEventCategoryStatistics
}
```

### <a id="OldCodeIntelEventCategoryStatistics" href="#OldCodeIntelEventCategoryStatistics">type OldCodeIntelEventCategoryStatistics struct</a>

```
searchKey: types.OldCodeIntelEventCategoryStatistics
```

```Go
type OldCodeIntelEventCategoryStatistics struct {
	LSIF   *OldCodeIntelEventStatistics
	Search *OldCodeIntelEventStatistics
}
```

### <a id="OldCodeIntelEventStatistics" href="#OldCodeIntelEventStatistics">type OldCodeIntelEventStatistics struct</a>

```
searchKey: types.OldCodeIntelEventStatistics
```

```Go
type OldCodeIntelEventStatistics struct {
	UsersCount  int32
	EventsCount *int32
}
```

### <a id="BitbucketServerConnection" href="#BitbucketServerConnection">type BitbucketServerConnection struct</a>

```
searchKey: types.BitbucketServerConnection
```

```Go
type BitbucketServerConnection struct {
	// The unique resource identifier of the external service.
	URN string
	*schema.BitbucketServerConnection
}
```

### <a id="GitHubConnection" href="#GitHubConnection">type GitHubConnection struct</a>

```
searchKey: types.GitHubConnection
```

```Go
type GitHubConnection struct {
	// The unique resource identifier of the external service.
	URN string
	*schema.GitHubConnection
}
```

### <a id="GitLabConnection" href="#GitLabConnection">type GitLabConnection struct</a>

```
searchKey: types.GitLabConnection
```

```Go
type GitLabConnection struct {
	// The unique resource identifier of the external service.
	URN string
	*schema.GitLabConnection
}
```

### <a id="PerforceConnection" href="#PerforceConnection">type PerforceConnection struct</a>

```
searchKey: types.PerforceConnection
```

```Go
type PerforceConnection struct {
	// The unique resource identifier of the external service.
	URN string
	*schema.PerforceConnection
}
```

### <a id="SavedSearch" href="#SavedSearch">type SavedSearch struct</a>

```
searchKey: types.SavedSearch
```

```Go
type SavedSearch struct {
	ID              int32 // the globally unique DB ID
	Description     string
	Query           string  // the literal search query to be ran
	Notify          bool    // whether or not to notify the owner(s) of this saved search via email
	NotifySlack     bool    // whether or not to notify the owner(s) of this saved search via Slack
	UserID          *int32  // if non-nil, the owner is this user. UserID/OrgID are mutually exclusive.
	OrgID           *int32  // if non-nil, the owner is this organization. UserID/OrgID are mutually exclusive.
	SlackWebhookURL *string // if non-nil && NotifySlack == true, indicates that this Slack webhook URL should be used instead of the owners default Slack webhook.
}
```

SavedSearch represents a saved search 

### <a id="jsonStringField" href="#jsonStringField">type jsonStringField struct</a>

```
searchKey: types.jsonStringField
tags: [private]
```

```Go
type jsonStringField struct {
	path string
	ptr  *string
}
```

### <a id="ReposAssertion" href="#ReposAssertion">type ReposAssertion func(testing.TB, github.com/sourcegraph/sourcegraph/internal/types.Repos)</a>

```
searchKey: types.ReposAssertion
```

```Go
type ReposAssertion func(testing.TB, Repos)
```

A ReposAssertion performs an assertion on the given Repos. 

### <a id="ExternalServicesAssertion" href="#ExternalServicesAssertion">type ExternalServicesAssertion func(testing.TB, github.com/sourcegraph/sourcegraph/internal/types.ExternalServices)</a>

```
searchKey: types.ExternalServicesAssertion
```

```Go
type ExternalServicesAssertion func(testing.TB, ExternalServices)
```

An ExternalServicesAssertion performs an assertion on the given ExternalServices. 

### <a id="SourceInfo" href="#SourceInfo">type SourceInfo struct</a>

```
searchKey: types.SourceInfo
```

```Go
type SourceInfo struct {
	ID       string
	CloneURL string
}
```

A SourceInfo represents a source a Repo belongs to (such as an external service). 

#### <a id="SourceInfo.ExternalServiceID" href="#SourceInfo.ExternalServiceID">func (i SourceInfo) ExternalServiceID() int64</a>

```
searchKey: types.SourceInfo.ExternalServiceID
```

```Go
func (i SourceInfo) ExternalServiceID() int64
```

ExternalServiceID returns the ID of the external service this SourceInfo refers to. 

### <a id="Repo" href="#Repo">type Repo struct</a>

```
searchKey: types.Repo
```

```Go
type Repo struct {
	// ID is the unique numeric ID for this repository.
	ID api.RepoID
	// Name is the name for this repository (e.g., "github.com/user/repo"). It
	// is the same as URI, unless the user configures a non-default
	// repositoryPathPattern.
	//
	// Previously, this was called RepoURI.
	Name api.RepoName
	// URI is the full name for this repository (e.g.,
	// "github.com/user/repo"). See the documentation for the Name field.
	URI string
	// Description is a brief description of the repository.
	Description string
	// Fork is whether this repository is a fork of another repository.
	Fork bool
	// Archived is whether the repository has been archived.
	Archived bool
	// Stars is the star count the repository has in the code host.
	Stars int `json:",omitempty"`
	// Private is whether the repository is private.
	Private bool
	// CreatedAt is when this repository was created on Sourcegraph.
	CreatedAt time.Time
	// UpdatedAt is when this repository's metadata was last updated on Sourcegraph.
	UpdatedAt time.Time
	// DeletedAt is when this repository was soft-deleted from Sourcegraph.
	DeletedAt time.Time
	// ExternalRepo identifies this repository by its ID on the external service where it resides (and the external
	// service itself).
	ExternalRepo api.ExternalRepoSpec
	// Sources identifies all the repo sources this Repo belongs to.
	// The key is a URN created by extsvc.URN
	Sources map[string]*SourceInfo
	// Metadata contains the raw source code host JSON metadata.
	Metadata interface{}
}
```

Repo represents a source code repository. 

#### <a id="MakeRepo" href="#MakeRepo">func MakeRepo(name, serviceID, serviceType string, services ...*ExternalService) *Repo</a>

```
searchKey: types.MakeRepo
```

```Go
func MakeRepo(name, serviceID, serviceType string, services ...*ExternalService) *Repo
```

#### <a id="MakeGithubRepo" href="#MakeGithubRepo">func MakeGithubRepo(services ...*ExternalService) *Repo</a>

```
searchKey: types.MakeGithubRepo
```

```Go
func MakeGithubRepo(services ...*ExternalService) *Repo
```

MakeGithubRepo returns a configured Github repository. 

#### <a id="MakeGitlabRepo" href="#MakeGitlabRepo">func MakeGitlabRepo(services ...*ExternalService) *Repo</a>

```
searchKey: types.MakeGitlabRepo
```

```Go
func MakeGitlabRepo(services ...*ExternalService) *Repo
```

MakeGitlabRepo returns a configured Gitlab repository. 

#### <a id="MakeBitbucketServerRepo" href="#MakeBitbucketServerRepo">func MakeBitbucketServerRepo(services ...*ExternalService) *Repo</a>

```
searchKey: types.MakeBitbucketServerRepo
```

```Go
func MakeBitbucketServerRepo(services ...*ExternalService) *Repo
```

MakeBitbucketServerRepo returns a configured Bitbucket Server repository. 

#### <a id="MakeAWSCodeCommitRepo" href="#MakeAWSCodeCommitRepo">func MakeAWSCodeCommitRepo(services ...*ExternalService) *Repo</a>

```
searchKey: types.MakeAWSCodeCommitRepo
```

```Go
func MakeAWSCodeCommitRepo(services ...*ExternalService) *Repo
```

MakeAWSCodeCommitRepo returns a configured AWS Code Commit repository. 

#### <a id="MakeOtherRepo" href="#MakeOtherRepo">func MakeOtherRepo(services ...*ExternalService) *Repo</a>

```
searchKey: types.MakeOtherRepo
```

```Go
func MakeOtherRepo(services ...*ExternalService) *Repo
```

MakeOtherRepo returns a configured repository from a custom host. 

#### <a id="MakeGitoliteRepo" href="#MakeGitoliteRepo">func MakeGitoliteRepo(services ...*ExternalService) *Repo</a>

```
searchKey: types.MakeGitoliteRepo
```

```Go
func MakeGitoliteRepo(services ...*ExternalService) *Repo
```

MakeGitoliteRepo returns a configured Gitolite repository. 

#### <a id="Repo.CloneURLs" href="#Repo.CloneURLs">func (r *Repo) CloneURLs() []string</a>

```
searchKey: types.Repo.CloneURLs
```

```Go
func (r *Repo) CloneURLs() []string
```

CloneURLs returns all the clone URLs this repo is clonable from. 

#### <a id="Repo.IsDeleted" href="#Repo.IsDeleted">func (r *Repo) IsDeleted() bool</a>

```
searchKey: types.Repo.IsDeleted
```

```Go
func (r *Repo) IsDeleted() bool
```

IsDeleted returns true if the repo is deleted. 

#### <a id="Repo.ExternalServiceIDs" href="#Repo.ExternalServiceIDs">func (r *Repo) ExternalServiceIDs() []int64</a>

```
searchKey: types.Repo.ExternalServiceIDs
```

```Go
func (r *Repo) ExternalServiceIDs() []int64
```

ExternalServiceIDs returns the IDs of the external services this repo belongs to. 

#### <a id="Repo.Update" href="#Repo.Update">func (r *Repo) Update(n *Repo) (modified bool)</a>

```
searchKey: types.Repo.Update
```

```Go
func (r *Repo) Update(n *Repo) (modified bool)
```

Update updates Repo r with the fields from the given newer Repo n, returning true if modified. 

#### <a id="Repo.Clone" href="#Repo.Clone">func (r *Repo) Clone() *Repo</a>

```
searchKey: types.Repo.Clone
```

```Go
func (r *Repo) Clone() *Repo
```

Clone returns a clone of the given repo. 

#### <a id="Repo.Apply" href="#Repo.Apply">func (r *Repo) Apply(opts ...func(*Repo))</a>

```
searchKey: types.Repo.Apply
```

```Go
func (r *Repo) Apply(opts ...func(*Repo))
```

Apply applies the given functional options to the Repo. 

#### <a id="Repo.With" href="#Repo.With">func (r *Repo) With(opts ...func(*Repo)) *Repo</a>

```
searchKey: types.Repo.With
```

```Go
func (r *Repo) With(opts ...func(*Repo)) *Repo
```

With returns a clone of the given repo with the given functional options applied. 

#### <a id="Repo.Less" href="#Repo.Less">func (r *Repo) Less(s *Repo) bool</a>

```
searchKey: types.Repo.Less
```

```Go
func (r *Repo) Less(s *Repo) bool
```

Less compares Repos by the important fields (fields with constraints in our DB). Additionally it will compare on Sources to give a deterministic order on repos returned from a sourcer. 

NewDiff relies on Less to deterministically decide on the order to merge repositories, as well as which repository to keep on conflicts. 

Context on using other fields such as timestamps to order/resolve conflicts: We only want to rely on values that have constraints in our database. Timestamps have the following downsides: 

```
- We need to assume the upstream codehost has reasonable values for them
- Not all codehosts set them to relevant values (eg gitolite or other)
- They could change often for codehosts that do set them.

```
#### <a id="Repo.String" href="#Repo.String">func (r *Repo) String() string</a>

```
searchKey: types.Repo.String
```

```Go
func (r *Repo) String() string
```

### <a id="Repos" href="#Repos">type Repos []*types.Repo</a>

```
searchKey: types.Repos
```

```Go
type Repos []*Repo
```

Repos is an utility type with convenience methods for operating on lists of Repos. 

#### <a id="GenerateRepos" href="#GenerateRepos">func GenerateRepos(n int, base ...*Repo) Repos</a>

```
searchKey: types.GenerateRepos
```

```Go
func GenerateRepos(n int, base ...*Repo) Repos
```

GenerateRepos takes a list of base repos and generates n ones with different names. 

#### <a id="Repos.Len" href="#Repos.Len">func (rs Repos) Len() int</a>

```
searchKey: types.Repos.Len
```

```Go
func (rs Repos) Len() int
```

#### <a id="Repos.Less" href="#Repos.Less">func (rs Repos) Less(i, j int) bool</a>

```
searchKey: types.Repos.Less
```

```Go
func (rs Repos) Less(i, j int) bool
```

#### <a id="Repos.Swap" href="#Repos.Swap">func (rs Repos) Swap(i, j int)</a>

```
searchKey: types.Repos.Swap
```

```Go
func (rs Repos) Swap(i, j int)
```

#### <a id="Repos.IDs" href="#Repos.IDs">func (rs Repos) IDs() []api.RepoID</a>

```
searchKey: types.Repos.IDs
```

```Go
func (rs Repos) IDs() []api.RepoID
```

IDs returns the list of ids from all Repos. 

#### <a id="Repos.Names" href="#Repos.Names">func (rs Repos) Names() []string</a>

```
searchKey: types.Repos.Names
```

```Go
func (rs Repos) Names() []string
```

Names returns the list of names from all Repos. 

#### <a id="Repos.NamesSummary" href="#Repos.NamesSummary">func (rs Repos) NamesSummary() string</a>

```
searchKey: types.Repos.NamesSummary
```

```Go
func (rs Repos) NamesSummary() string
```

NamesSummary caps the number of repos to 20 when composing a space-separated list string. Used in logging statements. 

#### <a id="Repos.Kinds" href="#Repos.Kinds">func (rs Repos) Kinds() (kinds []string)</a>

```
searchKey: types.Repos.Kinds
```

```Go
func (rs Repos) Kinds() (kinds []string)
```

Kinds returns the unique set of kinds from all Repos. 

#### <a id="Repos.ExternalRepos" href="#Repos.ExternalRepos">func (rs Repos) ExternalRepos() []api.ExternalRepoSpec</a>

```
searchKey: types.Repos.ExternalRepos
```

```Go
func (rs Repos) ExternalRepos() []api.ExternalRepoSpec
```

ExternalRepos returns the list of set ExternalRepoSpecs from all Repos. 

#### <a id="Repos.Sources" href="#Repos.Sources">func (rs Repos) Sources() map[api.RepoID][]SourceInfo</a>

```
searchKey: types.Repos.Sources
```

```Go
func (rs Repos) Sources() map[api.RepoID][]SourceInfo
```

Sources returns a map of all the sources per repo id. 

#### <a id="Repos.Concat" href="#Repos.Concat">func (rs *Repos) Concat(others ...Repos)</a>

```
searchKey: types.Repos.Concat
```

```Go
func (rs *Repos) Concat(others ...Repos)
```

Concat adds the given Repos to the end of rs. 

#### <a id="Repos.Clone" href="#Repos.Clone">func (rs Repos) Clone() Repos</a>

```
searchKey: types.Repos.Clone
```

```Go
func (rs Repos) Clone() Repos
```

Clone returns a clone of Repos. 

#### <a id="Repos.Apply" href="#Repos.Apply">func (rs Repos) Apply(opts ...func(*Repo))</a>

```
searchKey: types.Repos.Apply
```

```Go
func (rs Repos) Apply(opts ...func(*Repo))
```

Apply applies the given functional options to the Repo. 

#### <a id="Repos.With" href="#Repos.With">func (rs Repos) With(opts ...func(*Repo)) Repos</a>

```
searchKey: types.Repos.With
```

```Go
func (rs Repos) With(opts ...func(*Repo)) Repos
```

With returns a clone of the given repos with the given functional options applied. 

#### <a id="Repos.Filter" href="#Repos.Filter">func (rs Repos) Filter(pred func(*Repo) bool) (fs Repos)</a>

```
searchKey: types.Repos.Filter
```

```Go
func (rs Repos) Filter(pred func(*Repo) bool) (fs Repos)
```

Filter returns all the Repos that match the given predicate. 

### <a id="RepoName" href="#RepoName">type RepoName struct</a>

```
searchKey: types.RepoName
```

```Go
type RepoName struct {
	ID   api.RepoID
	Name api.RepoName
}
```

RepoName represents a source code repository name and its ID. 

#### <a id="RepoName.ToRepo" href="#RepoName.ToRepo">func (r *RepoName) ToRepo() *Repo</a>

```
searchKey: types.RepoName.ToRepo
```

```Go
func (r *RepoName) ToRepo() *Repo
```

### <a id="RepoNames" href="#RepoNames">type RepoNames []types.RepoName</a>

```
searchKey: types.RepoNames
```

```Go
type RepoNames []RepoName
```

RepoNames is an utility type with convenience methods for operating on lists of repo names 

#### <a id="RepoNames.Len" href="#RepoNames.Len">func (rs RepoNames) Len() int</a>

```
searchKey: types.RepoNames.Len
```

```Go
func (rs RepoNames) Len() int
```

#### <a id="RepoNames.Less" href="#RepoNames.Less">func (rs RepoNames) Less(i, j int) bool</a>

```
searchKey: types.RepoNames.Less
```

```Go
func (rs RepoNames) Less(i, j int) bool
```

#### <a id="RepoNames.Swap" href="#RepoNames.Swap">func (rs RepoNames) Swap(i, j int)</a>

```
searchKey: types.RepoNames.Swap
```

```Go
func (rs RepoNames) Swap(i, j int)
```

### <a id="CodeHostRepository" href="#CodeHostRepository">type CodeHostRepository struct</a>

```
searchKey: types.CodeHostRepository
```

```Go
type CodeHostRepository struct {
	Name       string
	CodeHostID int64
	Private    bool
}
```

### <a id="RepoGitserverStatus" href="#RepoGitserverStatus">type RepoGitserverStatus struct</a>

```
searchKey: types.RepoGitserverStatus
```

```Go
type RepoGitserverStatus struct {
	// ID is the unique numeric ID for this repository.
	ID api.RepoID
	// Name is the name for this repository (e.g., "github.com/user/repo").
	Name api.RepoName

	// GitserverRepo data if it exists
	*GitserverRepo
}
```

RepoGitserverStatus includes basic repo data along with the current gitserver status for the repo, which may be unknown. 

### <a id="CloneStatus" href="#CloneStatus">type CloneStatus string</a>

```
searchKey: types.CloneStatus
```

```Go
type CloneStatus string
```

#### <a id="ParseCloneStatus" href="#ParseCloneStatus">func ParseCloneStatus(s string) CloneStatus</a>

```
searchKey: types.ParseCloneStatus
```

```Go
func ParseCloneStatus(s string) CloneStatus
```

### <a id="GitserverRepo" href="#GitserverRepo">type GitserverRepo struct</a>

```
searchKey: types.GitserverRepo
```

```Go
type GitserverRepo struct {
	RepoID api.RepoID
	// Usually represented by a gitserver hostname
	ShardID     string
	CloneStatus CloneStatus
	// The last external service used to sync or clone this repo
	LastExternalService int64
	// The last error that occurred or empty if the last action was successful
	LastError string
	UpdatedAt time.Time
}
```

GitserverRepo  represents the data gitserver knows about a repo 

### <a id="ExternalService" href="#ExternalService">type ExternalService struct</a>

```
searchKey: types.ExternalService
```

```Go
type ExternalService struct {
	ID              int64
	Kind            string
	DisplayName     string
	Config          string
	CreatedAt       time.Time
	UpdatedAt       time.Time
	DeletedAt       time.Time
	LastSyncAt      time.Time
	NextSyncAt      time.Time
	NamespaceUserID int32
	Unrestricted    bool // Whether access to repositories belong to this external service is unrestricted.
	CloudDefault    bool // Whether this external service is our default public service on Cloud
}
```

ExternalService is a connection to an external service. 

#### <a id="ExternalService.RedactConfigSecrets" href="#ExternalService.RedactConfigSecrets">func (e *ExternalService) RedactConfigSecrets() error</a>

```
searchKey: types.ExternalService.RedactConfigSecrets
```

```Go
func (e *ExternalService) RedactConfigSecrets() error
```

RedactConfigSecrets replaces any secret fields in the Config field with RedactedSecret, be sure to call UnRedactExternalServiceConfig before writing back to the database, otherwise validation will throw errors. 

#### <a id="ExternalService.UnredactConfig" href="#ExternalService.UnredactConfig">func (e *ExternalService) UnredactConfig(old *ExternalService) error</a>

```
searchKey: types.ExternalService.UnredactConfig
```

```Go
func (e *ExternalService) UnredactConfig(old *ExternalService) error
```

UnredactConfig will replace redacted fields with their undredacted form from the 'old' ExternalService. You should call this when accepting updated config from a user that may have been previously redacted, and pass in the unredacted form directly from the DB as the 'old' parameter 

#### <a id="ExternalService.URN" href="#ExternalService.URN">func (e *ExternalService) URN() string</a>

```
searchKey: types.ExternalService.URN
```

```Go
func (e *ExternalService) URN() string
```

URN returns a unique resource identifier of this external service, used as the key in a repo's Sources map as well as the SourceInfo ID. 

#### <a id="ExternalService.IsDeleted" href="#ExternalService.IsDeleted">func (e *ExternalService) IsDeleted() bool</a>

```
searchKey: types.ExternalService.IsDeleted
```

```Go
func (e *ExternalService) IsDeleted() bool
```

IsDeleted returns true if the external service is deleted. 

#### <a id="ExternalService.Update" href="#ExternalService.Update">func (e *ExternalService) Update(n *ExternalService) (modified bool)</a>

```
searchKey: types.ExternalService.Update
```

```Go
func (e *ExternalService) Update(n *ExternalService) (modified bool)
```

Update updates ExternalService e with the fields from the given newer ExternalService n, returning true if modified. 

#### <a id="ExternalService.Configuration" href="#ExternalService.Configuration">func (e *ExternalService) Configuration() (cfg interface{}, _ error)</a>

```
searchKey: types.ExternalService.Configuration
```

```Go
func (e *ExternalService) Configuration() (cfg interface{}, _ error)
```

Configuration returns the external service config. 

#### <a id="ExternalService.Clone" href="#ExternalService.Clone">func (e *ExternalService) Clone() *ExternalService</a>

```
searchKey: types.ExternalService.Clone
```

```Go
func (e *ExternalService) Clone() *ExternalService
```

Clone returns a clone of the given external service. 

#### <a id="ExternalService.Apply" href="#ExternalService.Apply">func (e *ExternalService) Apply(opts ...func(*ExternalService))</a>

```
searchKey: types.ExternalService.Apply
```

```Go
func (e *ExternalService) Apply(opts ...func(*ExternalService))
```

Apply applies the given functional options to the ExternalService. 

#### <a id="ExternalService.With" href="#ExternalService.With">func (e *ExternalService) With(opts ...func(*ExternalService)) *ExternalService</a>

```
searchKey: types.ExternalService.With
```

```Go
func (e *ExternalService) With(opts ...func(*ExternalService)) *ExternalService
```

With returns a clone of the given repo with the given functional options applied. 

### <a id="ExternalServiceSyncJob" href="#ExternalServiceSyncJob">type ExternalServiceSyncJob struct</a>

```
searchKey: types.ExternalServiceSyncJob
```

```Go
type ExternalServiceSyncJob struct {
	ID                int64
	State             string
	FailureMessage    string
	StartedAt         time.Time
	FinishedAt        time.Time
	ProcessAfter      time.Time
	NumResets         int
	ExternalServiceID int64
	NumFailures       int
}
```

ExternalServiceSyncJob represents an sync job for an external service 

### <a id="ExternalServices" href="#ExternalServices">type ExternalServices []*types.ExternalService</a>

```
searchKey: types.ExternalServices
```

```Go
type ExternalServices []*ExternalService
```

ExternalServices is an utility type with convenience methods for operating on lists of ExternalServices. 

#### <a id="MakeExternalServices" href="#MakeExternalServices">func MakeExternalServices() ExternalServices</a>

```
searchKey: types.MakeExternalServices
```

```Go
func MakeExternalServices() ExternalServices
```

MakeExternalServices creates one configured external service per kind and returns the list. 

#### <a id="GenerateExternalServices" href="#GenerateExternalServices">func GenerateExternalServices(n int, base ...*ExternalService) ExternalServices</a>

```
searchKey: types.GenerateExternalServices
```

```Go
func GenerateExternalServices(n int, base ...*ExternalService) ExternalServices
```

GenerateExternalServices takes a list of base external services and generates n ones with different names. 

#### <a id="ExternalServices.IDs" href="#ExternalServices.IDs">func (es ExternalServices) IDs() []int64</a>

```
searchKey: types.ExternalServices.IDs
```

```Go
func (es ExternalServices) IDs() []int64
```

IDs returns the list of ids from all ExternalServices. 

#### <a id="ExternalServices.DisplayNames" href="#ExternalServices.DisplayNames">func (es ExternalServices) DisplayNames() []string</a>

```
searchKey: types.ExternalServices.DisplayNames
```

```Go
func (es ExternalServices) DisplayNames() []string
```

DisplayNames returns the list of display names from all ExternalServices. 

#### <a id="ExternalServices.Kinds" href="#ExternalServices.Kinds">func (es ExternalServices) Kinds() (kinds []string)</a>

```
searchKey: types.ExternalServices.Kinds
```

```Go
func (es ExternalServices) Kinds() (kinds []string)
```

Kinds returns the unique set of Kinds in the given external services list. 

#### <a id="ExternalServices.URNs" href="#ExternalServices.URNs">func (es ExternalServices) URNs() []string</a>

```
searchKey: types.ExternalServices.URNs
```

```Go
func (es ExternalServices) URNs() []string
```

URNs returns the list of URNs from all ExternalServices. 

#### <a id="ExternalServices.Len" href="#ExternalServices.Len">func (es ExternalServices) Len() int</a>

```
searchKey: types.ExternalServices.Len
```

```Go
func (es ExternalServices) Len() int
```

#### <a id="ExternalServices.Swap" href="#ExternalServices.Swap">func (es ExternalServices) Swap(i, j int)</a>

```
searchKey: types.ExternalServices.Swap
```

```Go
func (es ExternalServices) Swap(i, j int)
```

#### <a id="ExternalServices.Less" href="#ExternalServices.Less">func (es ExternalServices) Less(i, j int) bool</a>

```
searchKey: types.ExternalServices.Less
```

```Go
func (es ExternalServices) Less(i, j int) bool
```

#### <a id="ExternalServices.Clone" href="#ExternalServices.Clone">func (es ExternalServices) Clone() ExternalServices</a>

```
searchKey: types.ExternalServices.Clone
```

```Go
func (es ExternalServices) Clone() ExternalServices
```

Clone returns a clone of the given external services. 

#### <a id="ExternalServices.Apply" href="#ExternalServices.Apply">func (es ExternalServices) Apply(opts ...func(*ExternalService))</a>

```
searchKey: types.ExternalServices.Apply
```

```Go
func (es ExternalServices) Apply(opts ...func(*ExternalService))
```

Apply applies the given functional options to the ExternalService. 

#### <a id="ExternalServices.With" href="#ExternalServices.With">func (es ExternalServices) With(opts ...func(*ExternalService)) ExternalServices</a>

```
searchKey: types.ExternalServices.With
```

```Go
func (es ExternalServices) With(opts ...func(*ExternalService)) ExternalServices
```

With returns a clone of the given external services with the given functional options applied. 

### <a id="GlobalState" href="#GlobalState">type GlobalState struct</a>

```
searchKey: types.GlobalState
```

```Go
type GlobalState struct {
	SiteID      string
	Initialized bool // whether the initial site admin account has been created
}
```

### <a id="User" href="#User">type User struct</a>

```
searchKey: types.User
```

```Go
type User struct {
	ID                    int32
	Username              string
	DisplayName           string
	AvatarURL             string
	CreatedAt             time.Time
	UpdatedAt             time.Time
	SiteAdmin             bool
	BuiltinAuth           bool
	Tags                  []string
	InvalidatedSessionsAt time.Time
}
```

User represents a registered user. 

### <a id="Org" href="#Org">type Org struct</a>

```
searchKey: types.Org
```

```Go
type Org struct {
	ID          int32
	Name        string
	DisplayName *string
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
```

### <a id="OrgMembership" href="#OrgMembership">type OrgMembership struct</a>

```
searchKey: types.OrgMembership
```

```Go
type OrgMembership struct {
	ID        int32
	OrgID     int32
	UserID    int32
	CreatedAt time.Time
	UpdatedAt time.Time
}
```

### <a id="PhabricatorRepo" href="#PhabricatorRepo">type PhabricatorRepo struct</a>

```
searchKey: types.PhabricatorRepo
```

```Go
type PhabricatorRepo struct {
	ID       int32
	Name     api.RepoName
	URL      string
	Callsign string
}
```

### <a id="UserUsageStatistics" href="#UserUsageStatistics">type UserUsageStatistics struct</a>

```
searchKey: types.UserUsageStatistics
```

```Go
type UserUsageStatistics struct {
	UserID                      int32
	PageViews                   int32
	SearchQueries               int32
	CodeIntelligenceActions     int32
	FindReferencesActions       int32
	LastActiveTime              *time.Time
	LastCodeHostIntegrationTime *time.Time
}
```

### <a id="UserUsageCounts" href="#UserUsageCounts">type UserUsageCounts struct</a>

```
searchKey: types.UserUsageCounts
```

```Go
type UserUsageCounts struct {
	Date           time.Time
	UserID         uint32
	SearchCount    int32
	CodeIntelCount int32
}
```

UserUsageCounts captures the usage numbers of a user in a single day. 

### <a id="UserDates" href="#UserDates">type UserDates struct</a>

```
searchKey: types.UserDates
```

```Go
type UserDates struct {
	UserID    int32
	CreatedAt time.Time
	DeletedAt time.Time
}
```

UserDates captures the created and deleted dates of a single user. 

### <a id="SiteUsageStatistics" href="#SiteUsageStatistics">type SiteUsageStatistics struct</a>

```
searchKey: types.SiteUsageStatistics
```

```Go
type SiteUsageStatistics struct {
	DAUs []*SiteActivityPeriod
	WAUs []*SiteActivityPeriod
	MAUs []*SiteActivityPeriod
}
```

NOTE: DO NOT alter this struct without making a symmetric change to the updatecheck handler. This struct is marshalled and sent to BigQuery, which requires the input match its schema exactly. 

### <a id="SiteActivityPeriod" href="#SiteActivityPeriod">type SiteActivityPeriod struct</a>

```
searchKey: types.SiteActivityPeriod
```

```Go
type SiteActivityPeriod struct {
	StartTime            time.Time
	UserCount            int32
	RegisteredUserCount  int32
	AnonymousUserCount   int32
	IntegrationUserCount int32
}
```

NOTE: DO NOT alter this struct without making a symmetric change to the updatecheck handler. This struct is marshalled and sent to BigQuery, which requires the input match its schema exactly. 

### <a id="BatchChangesUsageStatistics" href="#BatchChangesUsageStatistics">type BatchChangesUsageStatistics struct</a>

```
searchKey: types.BatchChangesUsageStatistics
```

```Go
type BatchChangesUsageStatistics struct {
	// ViewBatchChangeApplyPageCount is the number of page views on the apply page
	// ("preview" page).
	ViewBatchChangeApplyPageCount int32
	// ViewBatchChangeDetailsPageAfterCreateCount is the number of page views on
	// the batch changes details page *after creating* the batch change on the apply
	// page by clicking "Apply spec".
	ViewBatchChangeDetailsPageAfterCreateCount int32
	// ViewBatchChangeDetailsPageAfterUpdateCount is the number of page views on
	// the batch changes details page *after updating* a batch change on the apply page
	// by clicking "Apply spec".
	ViewBatchChangeDetailsPageAfterUpdateCount int32

	// BatchChangesCount is the number of batch changes on the instance. This can go
	// down when users delete a batch change.
	BatchChangesCount int32
	// BatchChangesClosedCount is the number of *closed* batch changes on the
	// instance. This can go down when users delete a batch change.
	BatchChangesClosedCount int32

	// BatchSpecsCreatedCount is the number of batch change specs that have been
	// created by running `src batch [preview|apply]`. This number never
	// goes down since it's based on event logs, even if the batch specs
	// were not used and cleaned up.
	BatchSpecsCreatedCount int32
	// ChangesetSpecsCreatedCount is the number of changeset specs that have
	// been created by running `src batch [preview|apply]`. This number
	// never goes down since it's based on event logs, even if the changeset
	// specs were not used and cleaned up.
	ChangesetSpecsCreatedCount int32

	// PublishedChangesetsUnpublishedCount is the number of changesets in the
	// database that have not been published but belong to a batch change.
	// This number *could* go down, since it's not
	// based on event logs, but so far (Mar 2021) we never cleaned up
	// changesets in the database.
	PublishedChangesetsUnpublishedCount int32

	// PublishedChangesetsCount is the number of changesets published on code hosts
	// by batch changes. This number *could* go down, since it's not based on
	// event logs, but so far (Mar 2021) we never cleaned up changesets in the
	// database.
	PublishedChangesetsCount int32
	// PublishedChangesetsDiffStatAddedSum is the total sum of lines added by
	// changesets published on the code host by batch changes.
	PublishedChangesetsDiffStatAddedSum int32
	// PublishedChangesetsDiffStatChangedSum is the total sum of lines changed by
	// changesets published on the code host by batch changes.
	PublishedChangesetsDiffStatChangedSum int32
	// PublishedChangesetsDiffStatDeletedSum is the total sum of lines deleted by
	// changesets published on the code host by batch changes.
	PublishedChangesetsDiffStatDeletedSum int32

	// PublishedChangesetsMergedCount is the number of changesets published on
	// code hosts by batch changes that have also been *merged*.
	// This number *could* go down, since it's not based on event logs, but
	// so far (Mar 2021) we never cleaned up changesets in the database.
	PublishedChangesetsMergedCount int32
	// PublishedChangesetsMergedDiffStatAddedSum is the total sum of lines added by
	// changesets published on the code host by batch changes and merged.
	PublishedChangesetsMergedDiffStatAddedSum int32
	// PublishedChangesetsMergedDiffStatChangedSum is the total sum of lines changed by
	// changesets published on the code host by batch changes and merged.
	PublishedChangesetsMergedDiffStatChangedSum int32
	// PublishedChangesetsMergedDiffStatDeletedSum is the total sum of lines deleted by
	// changesets published on the code host by batch changes and merged.
	PublishedChangesetsMergedDiffStatDeletedSum int32

	// ImportedChangesetsCount is the total number of changesets that have been
	// imported by a batch change to be tracked.
	// This number *could* go down, since it's not based on event logs, but
	// so far (Mar 2021) we never cleaned up changesets in the database.
	ImportedChangesetsCount int32
	// ManualChangesetsCount is the total number of *merged* changesets that
	// have been imported by a batch change to be tracked.
	// This number *could* go down, since it's not based on event logs, but
	// so far (Mar 2021) we never cleaned up changesets in the database.
	ImportedChangesetsMergedCount int32

	// CurrentMonthContributorsCount is the count of unique users that have logged a
	// "contributing" batch changes event, such as "BatchChangeCreated".
	//
	// See `contributorsEvents` in `GetBatchChangesUsageStatistics` for a full list
	// of events.
	CurrentMonthContributorsCount int64

	// CurrentMonthUsersCount is the count of unique users that have logged a
	// "using" batch changes event, such as "ViewBatchChangesListPage" and also "BatchChangeCreated".
	//
	// See `contributorsEvents` in `GetBatchChangesUsageStatistics` for a full
	// list of events.
	CurrentMonthUsersCount int64

	BatchChangesCohorts []*BatchChangesCohort
}
```

NOTE: DO NOT alter this struct without making a symmetric change to the updatecheck handler. This struct is marshalled and sent to BigQuery, which requires the input match its schema exactly. 

### <a id="BatchChangesCohort" href="#BatchChangesCohort">type BatchChangesCohort struct</a>

```
searchKey: types.BatchChangesCohort
```

```Go
type BatchChangesCohort struct {
	// Week is the week of this cohort and is used to group batch changes by
	// their creation date.
	Week string

	// BatchChangesClosed is the number of batch changes that were created in Week and
	// are currently closed.
	BatchChangesClosed int64

	// BatchChangesOpen is the number of batch changes that were created in Week and
	// are currently open.
	BatchChangesOpen int64

	ChangesetsImported        int64
	ChangesetsUnpublished     int64
	ChangesetsPublished       int64
	ChangesetsPublishedOpen   int64
	ChangesetsPublishedDraft  int64
	ChangesetsPublishedMerged int64
	ChangesetsPublishedClosed int64
}
```

NOTE: DO NOT alter this struct without making a symmetric change to the updatecheck handler. This struct is marshalled and sent to BigQuery, which requires the input match its schema exactly. 

### <a id="SearchUsageStatistics" href="#SearchUsageStatistics">type SearchUsageStatistics struct</a>

```
searchKey: types.SearchUsageStatistics
```

```Go
type SearchUsageStatistics struct {
	Daily   []*SearchUsagePeriod
	Weekly  []*SearchUsagePeriod
	Monthly []*SearchUsagePeriod
}
```

NOTE: DO NOT alter this struct without making a symmetric change to the updatecheck handler. This struct is marshalled and sent to BigQuery, which requires the input match its schema exactly. 

### <a id="SearchUsagePeriod" href="#SearchUsagePeriod">type SearchUsagePeriod struct</a>

```
searchKey: types.SearchUsagePeriod
```

```Go
type SearchUsagePeriod struct {
	StartTime  time.Time
	TotalUsers int32

	// Counts and latency statistics for different kinds of searches.
	Literal    *SearchEventStatistics
	Regexp     *SearchEventStatistics
	Commit     *SearchEventStatistics
	Diff       *SearchEventStatistics
	File       *SearchEventStatistics
	Structural *SearchEventStatistics
	Symbol     *SearchEventStatistics

	// Counts of search query attributes. Ref: RFC 384.
	OperatorOr              *SearchCountStatistics
	OperatorAnd             *SearchCountStatistics
	OperatorNot             *SearchCountStatistics
	SelectRepo              *SearchCountStatistics
	SelectFile              *SearchCountStatistics
	SelectContent           *SearchCountStatistics
	SelectSymbol            *SearchCountStatistics
	SelectCommitDiffAdded   *SearchCountStatistics
	SelectCommitDiffRemoved *SearchCountStatistics
	RepoContains            *SearchCountStatistics
	RepoContainsFile        *SearchCountStatistics
	RepoContainsContent     *SearchCountStatistics
	RepoContainsCommitAfter *SearchCountStatistics
	CountAll                *SearchCountStatistics
	NonGlobalContext        *SearchCountStatistics
	OnlyPatterns            *SearchCountStatistics
	OnlyPatternsThreeOrMore *SearchCountStatistics

	// DEPRECATED. Counts statistics for fields.
	After              *SearchCountStatistics
	Archived           *SearchCountStatistics
	Author             *SearchCountStatistics
	Before             *SearchCountStatistics
	Case               *SearchCountStatistics
	Committer          *SearchCountStatistics
	Content            *SearchCountStatistics
	Count              *SearchCountStatistics
	Fork               *SearchCountStatistics
	Index              *SearchCountStatistics
	Lang               *SearchCountStatistics
	Message            *SearchCountStatistics
	PatternType        *SearchCountStatistics
	Repo               *SearchEventStatistics
	Repohascommitafter *SearchCountStatistics
	Repohasfile        *SearchCountStatistics
	Repogroup          *SearchCountStatistics
	Timeout            *SearchCountStatistics
	Type               *SearchCountStatistics

	// DEPRECATED. Search modes statistics refers to removed functionality.
	SearchModes *SearchModeUsageStatistics
}
```

NOTE: DO NOT alter this struct without making a symmetric change to the updatecheck handler. This struct is marshalled and sent to BigQuery, which requires the input match its schema exactly. 

### <a id="SearchModeUsageStatistics" href="#SearchModeUsageStatistics">type SearchModeUsageStatistics struct</a>

```
searchKey: types.SearchModeUsageStatistics
```

```Go
type SearchModeUsageStatistics struct {
	Interactive *SearchCountStatistics
	PlainText   *SearchCountStatistics
}
```

### <a id="SearchCountStatistics" href="#SearchCountStatistics">type SearchCountStatistics struct</a>

```
searchKey: types.SearchCountStatistics
```

```Go
type SearchCountStatistics struct {
	UserCount   *int32
	EventsCount *int32
}
```

### <a id="SearchEventStatistics" href="#SearchEventStatistics">type SearchEventStatistics struct</a>

```
searchKey: types.SearchEventStatistics
```

```Go
type SearchEventStatistics struct {
	UserCount      *int32
	EventsCount    *int32
	EventLatencies *SearchEventLatencies
}
```

NOTE: DO NOT alter this struct without making a symmetric change to the updatecheck handler. This struct is marshalled and sent to BigQuery, which requires the input match its schema exactly. 

### <a id="SearchEventLatencies" href="#SearchEventLatencies">type SearchEventLatencies struct</a>

```
searchKey: types.SearchEventLatencies
```

```Go
type SearchEventLatencies struct {
	P50 float64
	P90 float64
	P99 float64
}
```

NOTE: DO NOT alter this struct without making a symmetric change to the updatecheck handler. This struct is marshalled and sent to BigQuery, which requires the input match its schema exactly. 

### <a id="SiteUsageSummary" href="#SiteUsageSummary">type SiteUsageSummary struct</a>

```
searchKey: types.SiteUsageSummary
```

```Go
type SiteUsageSummary struct {
	Month                   time.Time
	Week                    time.Time
	Day                     time.Time
	UniquesMonth            int32
	UniquesWeek             int32
	UniquesDay              int32
	RegisteredUniquesMonth  int32
	RegisteredUniquesWeek   int32
	RegisteredUniquesDay    int32
	IntegrationUniquesMonth int32
	IntegrationUniquesWeek  int32
	IntegrationUniquesDay   int32
	ManageUniquesMonth      int32
	CodeUniquesMonth        int32
	VerifyUniquesMonth      int32
	MonitorUniquesMonth     int32
	ManageUniquesWeek       int32
	CodeUniquesWeek         int32
	VerifyUniquesWeek       int32
	MonitorUniquesWeek      int32
}
```

SiteUsageSummary is an alternate view of SiteUsageStatistics which is calculated in the database layer. 

### <a id="SearchAggregatedEvent" href="#SearchAggregatedEvent">type SearchAggregatedEvent struct</a>

```
searchKey: types.SearchAggregatedEvent
```

```Go
type SearchAggregatedEvent struct {
	Name           string
	Month          time.Time
	Week           time.Time
	Day            time.Time
	TotalMonth     int32
	TotalWeek      int32
	TotalDay       int32
	UniquesMonth   int32
	UniquesWeek    int32
	UniquesDay     int32
	LatenciesMonth []float64
	LatenciesWeek  []float64
	LatenciesDay   []float64
}
```

SearchAggregatedEvent represents the total events, unique users, and latencies over the current month, week, and day for a single search event. 

### <a id="SurveyResponse" href="#SurveyResponse">type SurveyResponse struct</a>

```
searchKey: types.SurveyResponse
```

```Go
type SurveyResponse struct {
	ID        int32
	UserID    *int32
	Email     *string
	Score     int32
	Reason    *string
	Better    *string
	CreatedAt time.Time
}
```

### <a id="Event" href="#Event">type Event struct</a>

```
searchKey: types.Event
```

```Go
type Event struct {
	ID              int32
	Name            string
	URL             string
	UserID          *int32
	AnonymousUserID string
	Argument        string
	Source          string
	Version         string
	Timestamp       time.Time
}
```

### <a id="GrowthStatistics" href="#GrowthStatistics">type GrowthStatistics struct</a>

```
searchKey: types.GrowthStatistics
```

```Go
type GrowthStatistics struct {
	DeletedUsers     int32
	CreatedUsers     int32
	ResurrectedUsers int32
	ChurnedUsers     int32
	RetainedUsers    int32
}
```

GrowthStatistics represents the total users that were created, deleted, resurrected, churned and retained over the current month. 

### <a id="SavedSearches" href="#SavedSearches">type SavedSearches struct</a>

```
searchKey: types.SavedSearches
```

```Go
type SavedSearches struct {
	TotalSavedSearches   int32
	UniqueUsers          int32
	NotificationsSent    int32
	NotificationsClicked int32
	UniqueUserPageViews  int32
	OrgSavedSearches     int32
}
```

SavedSearches represents the total number of saved searches, users using saved searches, and usage of saved searches. 

### <a id="HomepagePanels" href="#HomepagePanels">type HomepagePanels struct</a>

```
searchKey: types.HomepagePanels
```

```Go
type HomepagePanels struct {
	RecentFilesClickedPercentage           *float64
	RecentSearchClickedPercentage          *float64
	RecentRepositoriesClickedPercentage    *float64
	SavedSearchesClickedPercentage         *float64
	NewSavedSearchesClickedPercentage      *float64
	TotalPanelViews                        *float64
	UsersFilesClickedPercentage            *float64
	UsersSearchClickedPercentage           *float64
	UsersRepositoriesClickedPercentage     *float64
	UsersSavedSearchesClickedPercentage    *float64
	UsersNewSavedSearchesClickedPercentage *float64
	PercentUsersShown                      *float64
}
```

Panel homepage represents interaction data on the enterprise homepage panels. 

### <a id="WeeklyRetentionStats" href="#WeeklyRetentionStats">type WeeklyRetentionStats struct</a>

```
searchKey: types.WeeklyRetentionStats
```

```Go
type WeeklyRetentionStats struct {
	WeekStart  time.Time
	CohortSize *int32
	Week0      *float64
	Week1      *float64
	Week2      *float64
	Week3      *float64
	Week4      *float64
	Week5      *float64
	Week6      *float64
	Week7      *float64
	Week8      *float64
	Week9      *float64
	Week10     *float64
	Week11     *float64
}
```

### <a id="RetentionStats" href="#RetentionStats">type RetentionStats struct</a>

```
searchKey: types.RetentionStats
```

```Go
type RetentionStats struct {
	Weekly []*WeeklyRetentionStats
}
```

### <a id="SearchOnboarding" href="#SearchOnboarding">type SearchOnboarding struct</a>

```
searchKey: types.SearchOnboarding
```

```Go
type SearchOnboarding struct {
	TotalOnboardingTourViews   *int32
	ViewedLangStep             *int32
	ViewedFilterRepoStep       *int32
	ViewedAddQueryTermStep     *int32
	ViewedSubmitSearchStep     *int32
	ViewedSearchReferenceStep  *int32
	CloseOnboardingTourClicked *int32
}
```

### <a id="ExtensionsUsageStatistics" href="#ExtensionsUsageStatistics">type ExtensionsUsageStatistics struct</a>

```
searchKey: types.ExtensionsUsageStatistics
```

```Go
type ExtensionsUsageStatistics struct {
	WeekStart                  time.Time
	UsageStatisticsByExtension []*ExtensionUsageStatistics
	// Average number of non-default extensions used by users
	// that have used at least one non-default extension
	AverageNonDefaultExtensions *float64
	// The count of users that have activated a non-default extension this week
	NonDefaultExtensionUsers *int32
}
```

Weekly usage statistics for the extensions platform 

### <a id="ExtensionUsageStatistics" href="#ExtensionUsageStatistics">type ExtensionUsageStatistics struct</a>

```
searchKey: types.ExtensionUsageStatistics
```

```Go
type ExtensionUsageStatistics struct {
	// The count of users that have activated this extension
	UserCount *int32
	// The average number of activations for users that have
	// used this extension at least once
	AverageActivations *float64
	ExtensionID        *string
}
```

Weekly statistics for an individual extension 

### <a id="CodeInsightsUsageStatistics" href="#CodeInsightsUsageStatistics">type CodeInsightsUsageStatistics struct</a>

```
searchKey: types.CodeInsightsUsageStatistics
```

```Go
type CodeInsightsUsageStatistics struct {
	WeeklyUsageStatisticsByInsight []*InsightUsageStatistics
	WeeklyInsightsPageViews        *int32
	WeeklyInsightsUniquePageViews  *int32
	WeeklyInsightConfigureClick    *int32
	WeeklyInsightAddMoreClick      *int32
	WeekStart                      time.Time
	WeeklyInsightCreators          *int32
	WeeklyFirstTimeInsightCreators *int32
	WeeklyAggregatedUsage          []AggregatedPingStats
	InsightTimeIntervals           []InsightTimeIntervalPing
	InsightOrgVisible              []OrgVisibleInsightPing
}
```

### <a id="InsightUsageStatistics" href="#InsightUsageStatistics">type InsightUsageStatistics struct</a>

```
searchKey: types.InsightUsageStatistics
```

```Go
type InsightUsageStatistics struct {
	InsightType      *string
	Additions        *int32
	Edits            *int32
	Removals         *int32
	Hovers           *int32
	UICustomizations *int32
	DataPointClicks  *int32
}
```

Usage statistics for a type of code insight 

### <a id="PingName" href="#PingName">type PingName string</a>

```
searchKey: types.PingName
```

```Go
type PingName string
```

### <a id="AggregatedPingStats" href="#AggregatedPingStats">type AggregatedPingStats struct</a>

```
searchKey: types.AggregatedPingStats
```

```Go
type AggregatedPingStats struct {
	Name        PingName
	TotalCount  int
	UniqueCount int
}
```

AggregatedPingStats is a generic representation of an aggregated ping statistic 

### <a id="InsightTimeIntervalPing" href="#InsightTimeIntervalPing">type InsightTimeIntervalPing struct</a>

```
searchKey: types.InsightTimeIntervalPing
```

```Go
type InsightTimeIntervalPing struct {
	IntervalDays int
	TotalCount   int
}
```

### <a id="OrgVisibleInsightPing" href="#OrgVisibleInsightPing">type OrgVisibleInsightPing struct</a>

```
searchKey: types.OrgVisibleInsightPing
```

```Go
type OrgVisibleInsightPing struct {
	Type       string
	TotalCount int
}
```

### <a id="CodeMonitoringUsageStatistics" href="#CodeMonitoringUsageStatistics">type CodeMonitoringUsageStatistics struct</a>

```
searchKey: types.CodeMonitoringUsageStatistics
```

```Go
type CodeMonitoringUsageStatistics struct {
	CodeMonitoringPageViews                       *int32
	CreateCodeMonitorPageViews                    *int32
	CreateCodeMonitorPageViewsWithTriggerQuery    *int32
	CreateCodeMonitorPageViewsWithoutTriggerQuery *int32
	ManageCodeMonitorPageViews                    *int32
	CodeMonitorEmailLinkClicks                    *int32
}
```

### <a id="Secret" href="#Secret">type Secret struct</a>

```
searchKey: types.Secret
```

```Go
type Secret struct {
	ID int32

	// The table containing an object whose token is being encrypted.
	SourceType sql.NullString

	// The ID of the object in the SourceType table.
	SourceID sql.NullInt32

	// KeyName represents a unique key for the case where we're storing key-value pairs.
	KeyName sql.NullString

	// Value contains the encrypted string
	Value string
}
```

Secret represents the secrets table 

### <a id="SearchContext" href="#SearchContext">type SearchContext struct</a>

```
searchKey: types.SearchContext
```

```Go
type SearchContext struct {
	ID int64
	// Name contains the non-prefixed part of the search context spec.
	// The name is a substring of the spec and it should NOT be used as the spec itself.
	// The spec contains additional information (such as the @ prefix and the context namespace)
	// that helps differentiate between different search contexts.
	// Example mappings from context spec to context name:
	// global -> global, @user -> user, @org -> org,
	// @user/ctx1 -> ctx1, @org/ctx2 -> ctx2.
	Name        string
	Description string
	// Public property controls the visibility of the search context. Public search context is available to
	// any user on the instance. If a public search context contains private repositories, those are filtered out
	// for unauthorized users. Private search contexts are only available to their owners. Private user search context
	// is available only to the user, private org search context is available only to the members of the org, and private
	// instance-level search contexts is available only to site-admins.
	Public          bool
	NamespaceUserID int32 // if non-zero, the owner is this user. NamespaceUserID/NamespaceOrgID are mutually exclusive.
	NamespaceOrgID  int32 // if non-zero, the owner is this organization. NamespaceUserID/NamespaceOrgID are mutually exclusive.
	UpdatedAt       time.Time

	// NamespaceUserName is the name of the user if NamespaceUserID is present.
	NamespaceUserName string
	// NamespaceUserName is the name of the org if NamespaceOrgID is present.
	NamespaceOrgName string
}
```

### <a id="SearchContextRepositoryRevisions" href="#SearchContextRepositoryRevisions">type SearchContextRepositoryRevisions struct</a>

```
searchKey: types.SearchContextRepositoryRevisions
```

```Go
type SearchContextRepositoryRevisions struct {
	Repo      RepoName
	Revisions []string
}
```

SearchContextRepositoryRevisions is a simple wrapper for a repository and its revisions contained in a search context. It is made compatible with search.RepositoryRevisions, so it can be easily converted when needed. We could use search.RepositoryRevisions directly instead, but it introduces an import cycle with `internal/vcs/git` package when used in `internal/database/search_contexts.go`. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="redactField" href="#redactField">func redactField(buf string, fields ...string) (string, error)</a>

```
searchKey: types.redactField
tags: [private]
```

```Go
func redactField(buf string, fields ...string) (string, error)
```

redactField will unmarshal the passed JSON string into the passed value, and then replace the pointer fields you pass with RedactedSecret, see RedactExternalServiceConfig for usage examples. who needs generics anyway? 

### <a id="unredactField" href="#unredactField">func unredactField(old, new string, cfg interface{}, fields ...jsonStringField) (string, error)</a>

```
searchKey: types.unredactField
tags: [private]
```

```Go
func unredactField(old, new string, cfg interface{}, fields ...jsonStringField) (string, error)
```

### <a id="zeroFields" href="#zeroFields">func zeroFields(s interface{}) error</a>

```
searchKey: types.zeroFields
tags: [private]
```

```Go
func zeroFields(s interface{}) error
```

zeroFields zeroes the fields of a struct 

### <a id="unmarshalConfig" href="#unmarshalConfig">func unmarshalConfig(buf string, v interface{}) error</a>

```
searchKey: types.unmarshalConfig
tags: [private]
```

```Go
func unmarshalConfig(buf string, v interface{}) error
```

config may contain comments, normalize with jsonc before unmarshaling with jsoniter 

### <a id="ExternalServicesToMap" href="#ExternalServicesToMap">func ExternalServicesToMap(es ExternalServices) map[string]*ExternalService</a>

```
searchKey: types.ExternalServicesToMap
```

```Go
func ExternalServicesToMap(es ExternalServices) map[string]*ExternalService
```

ExternalServicesToMap is a helper function that returns a map whose key is the external service kind. If two external services have the same kind, only the last one will be stored in the map. 

### <a id="sourcesKeys" href="#sourcesKeys">func sourcesKeys(m map[string]*SourceInfo) []string</a>

```
searchKey: types.sourcesKeys
tags: [private]
```

```Go
func sourcesKeys(m map[string]*SourceInfo) []string
```

### <a id="sortedSliceLess" href="#sortedSliceLess">func sortedSliceLess(a, b []string) bool</a>

```
searchKey: types.sortedSliceLess
tags: [private]
```

```Go
func sortedSliceLess(a, b []string) bool
```

sortedSliceLess returns true if a < b 

### <a id="TestRoundTripRedactExternalServiceConfig" href="#TestRoundTripRedactExternalServiceConfig">func TestRoundTripRedactExternalServiceConfig(t *testing.T)</a>

```
searchKey: types.TestRoundTripRedactExternalServiceConfig
tags: [private]
```

```Go
func TestRoundTripRedactExternalServiceConfig(t *testing.T)
```

