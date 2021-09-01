# Package usagestats

Package usagestats provides an interface to update and access information about individual and aggregate Sourcegraph users' activity levels. 

Package usagestats provides an interface to update and access information about individual and aggregate Sourcegraph users' activity levels. 

## Index

* [Constants](#const)
    * [const All](#All)
    * [const Day](#Day)
    * [const Hour](#Hour)
    * [const Month](#Month)
    * [const Org](#Org)
    * [const User](#User)
    * [const Week](#Week)
    * [const Year](#Year)
    * [const defaultDays](#defaultDays)
    * [const defaultMonths](#defaultMonths)
    * [const defaultWeeks](#defaultWeeks)
    * [const fFindRefsOccurred](#fFindRefsOccurred)
    * [const fSearchOccurred](#fSearchOccurred)
    * [const getHomepagePanelsQuery](#getHomepagePanelsQuery)
    * [const insightAloneSettingStr](#insightAloneSettingStr)
    * [const insightInlineSettingStr](#insightInlineSettingStr)
    * [const insightSettingMulti](#insightSettingMulti)
    * [const insightSettingSimple](#insightSettingSimple)
    * [const keyPrefix](#keyPrefix)
    * [const langStatsInsightSettingStr](#langStatsInsightSettingStr)
    * [const maxStorageDays](#maxStorageDays)
    * [const templatePingQueryStr](#templatePingQueryStr)
* [Variables](#var)
    * [var MockGetByUserID](#MockGetByUserID)
    * [var actionMap](#actionMap)
    * [var findRefsOccurred](#findRefsOccurred)
    * [var pool](#pool)
    * [var pubSubDotComEventsTopicID](#pubSubDotComEventsTopicID)
    * [var searchFilterCountExtractors](#searchFilterCountExtractors)
    * [var searchLatencyExtractors](#searchLatencyExtractors)
    * [var searchOccurred](#searchOccurred)
    * [var sourceMap](#sourceMap)
    * [var timeNow](#timeNow)
* [Types](#type)
    * [type Event struct](#Event)
    * [type Interval struct](#Interval)
    * [type LangStatsInsight struct](#LangStatsInsight)
    * [type PingQueryBuilder struct](#PingQueryBuilder)
        * [func NewPingBuilder(timeWindow TimeWindow, timeSupplier func() time.Time) PingQueryBuilder](#NewPingBuilder)
        * [func creationPagesPingBuilder(timeSupplier func() time.Time) PingQueryBuilder](#creationPagesPingBuilder)
        * [func (b *PingQueryBuilder) Sample(ctx context.Context, db dbutil.DB) ([]types.AggregatedPingStats, error)](#PingQueryBuilder.Sample)
        * [func (b *PingQueryBuilder) With(name types.PingName) *PingQueryBuilder](#PingQueryBuilder.With)
        * [func (b *PingQueryBuilder) WithAll(pings []types.PingName) *PingQueryBuilder](#PingQueryBuilder.WithAll)
    * [type Repositories struct](#Repositories)
        * [func GetRepositories(ctx context.Context) (*Repositories, error)](#GetRepositories)
    * [type SearchInsight struct](#SearchInsight)
    * [type SettingFilter string](#SettingFilter)
    * [type SiteUsageStatisticsOptions struct](#SiteUsageStatisticsOptions)
    * [type TimeSeries struct](#TimeSeries)
    * [type TimeWindow string](#TimeWindow)
    * [type bigQueryEvent struct](#bigQueryEvent)
* [Functions](#func)
    * [func FilterSettingJson(settingJson string, prefix string) (map[string]json.RawMessage, error)](#FilterSettingJson)
    * [func GetAggregatedCodeIntelStats(ctx context.Context, db dbutil.DB) (*types.NewCodeIntelUsageStatistics, error)](#GetAggregatedCodeIntelStats)
    * [func GetAggregatedSearchStats(ctx context.Context, db dbutil.DB) (*types.SearchUsageStatistics, error)](#GetAggregatedSearchStats)
    * [func GetArchive(ctx context.Context, db dbutil.DB) ([]byte, error)](#GetArchive)
    * [func GetBatchChangesUsageStatistics(ctx context.Context, db dbutil.DB) (*types.BatchChangesUsageStatistics, error)](#GetBatchChangesUsageStatistics)
    * [func GetByUserID(ctx context.Context, db dbutil.DB, userID int32) (*types.UserUsageStatistics, error)](#GetByUserID)
    * [func GetCodeInsightsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeInsightsUsageStatistics, error)](#GetCodeInsightsUsageStatistics)
    * [func GetCodeMonitoringUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeMonitoringUsageStatistics, error)](#GetCodeMonitoringUsageStatistics)
    * [func GetCreationViewUsage(ctx context.Context, db dbutil.DB, timeSupplier func() time.Time) ([]types.AggregatedPingStats, error)](#GetCreationViewUsage)
    * [func GetExtensionsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.ExtensionsUsageStatistics, error)](#GetExtensionsUsageStatistics)
    * [func GetGrowthStatistics(ctx context.Context, db dbutil.DB) (*types.GrowthStatistics, error)](#GetGrowthStatistics)
    * [func GetHomepagePanels(ctx context.Context, db dbutil.DB) (*types.HomepagePanels, error)](#GetHomepagePanels)
    * [func GetLangStatsInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]LangStatsInsight, error)](#GetLangStatsInsights)
    * [func GetOrgInsightCounts(ctx context.Context, db dbutil.DB) ([]types.OrgVisibleInsightPing, error)](#GetOrgInsightCounts)
    * [func GetRetentionStatistics(ctx context.Context, db dbutil.DB) (*types.RetentionStats, error)](#GetRetentionStatistics)
    * [func GetSavedSearches(ctx context.Context, db dbutil.DB) (*types.SavedSearches, error)](#GetSavedSearches)
    * [func GetSearchInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]SearchInsight, error)](#GetSearchInsights)
    * [func GetSearchOnboarding(ctx context.Context, db dbutil.DB) (*types.SearchOnboarding, error)](#GetSearchOnboarding)
    * [func GetSettings(ctx context.Context, db dbutil.DB, filter SettingFilter, prefix string) ([]*api.Settings, error)](#GetSettings)
    * [func GetSiteUsageStatistics(ctx context.Context, db dbutil.DB, opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)](#GetSiteUsageStatistics)
    * [func GetSiteUsageStats(ctx context.Context, db dbutil.DB, monthsOnly bool) (*types.SiteUsageStatistics, error)](#GetSiteUsageStats)
    * [func GetTimeStepCounts(ctx context.Context, db dbutil.DB) ([]types.InsightTimeIntervalPing, error)](#GetTimeStepCounts)
    * [func GetUsersActiveTodayCount(ctx context.Context, db dbutil.DB) (int, error)](#GetUsersActiveTodayCount)
    * [func HasFindRefsOccurred(ctx context.Context) (bool, error)](#HasFindRefsOccurred)
    * [func HasSearchOccurred(ctx context.Context) (bool, error)](#HasSearchOccurred)
    * [func ListRegisteredUsersThisMonth(ctx context.Context, db dbutil.DB) ([]int32, error)](#ListRegisteredUsersThisMonth)
    * [func ListRegisteredUsersThisWeek(ctx context.Context, db dbutil.DB) ([]int32, error)](#ListRegisteredUsersThisWeek)
    * [func ListRegisteredUsersToday(ctx context.Context, db dbutil.DB) ([]int32, error)](#ListRegisteredUsersToday)
    * [func LogBackendEvent(db dbutil.DB, userID int32, eventName string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error](#LogBackendEvent)
    * [func LogEvent(ctx context.Context, db dbutil.DB, args Event) error](#LogEvent)
    * [func TestCodeInsightsUsageStatistics(t *testing.T)](#TestCodeInsightsUsageStatistics)
    * [func TestCodeMonitoringUsageStatistics(t *testing.T)](#TestCodeMonitoringUsageStatistics)
    * [func TestExtensionsUsageStatistics(t *testing.T)](#TestExtensionsUsageStatistics)
    * [func TestFilterSettingJson(t *testing.T)](#TestFilterSettingJson)
    * [func TestGetArchive(t *testing.T)](#TestGetArchive)
    * [func TestGetBatchChangesUsageStatistics(t *testing.T)](#TestGetBatchChangesUsageStatistics)
    * [func TestGetLangStatsInsights(t *testing.T)](#TestGetLangStatsInsights)
    * [func TestGetSearchInsights(t *testing.T)](#TestGetSearchInsights)
    * [func TestGroupAggregateSearchStats(t *testing.T)](#TestGroupAggregateSearchStats)
    * [func TestGroupAggregatedCodeIntelStats(t *testing.T)](#TestGroupAggregatedCodeIntelStats)
    * [func TestGroupSiteUsageStats(t *testing.T)](#TestGroupSiteUsageStats)
    * [func TestGroupSiteUsageStatsMonthsOnly(t *testing.T)](#TestGroupSiteUsageStatsMonthsOnly)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestRetentionUsageStatistics(t *testing.T)](#TestRetentionUsageStatistics)
    * [func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)](#TestUserUsageStatistics_DAUs_WAUs_MAUs)
    * [func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)](#TestUserUsageStatistics_LogCodeHostIntegrationUsage)
    * [func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)](#TestUserUsageStatistics_LogCodeIntelAction)
    * [func TestUserUsageStatistics_LogPageView(t *testing.T)](#TestUserUsageStatistics_LogPageView)
    * [func TestUserUsageStatistics_LogSearchQuery(t *testing.T)](#TestUserUsageStatistics_LogSearchQuery)
    * [func TestUserUsageStatistics_None(t *testing.T)](#TestUserUsageStatistics_None)
    * [func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)](#TestUserUsageStatistics_getUsersActiveToday)
    * [func TestWithCreationPings(t *testing.T)](#TestWithCreationPings)
    * [func activeUsers(ctx context.Context, db dbutil.DB, periodType database.PeriodType, periods int) ([]*types.SiteActivityPeriod, error)](#activeUsers)
    * [func convertStepToDays(insight SearchInsight) int](#convertStepToDays)
    * [func groupAggregatedCodeIntelStats(rawEvents []types.CodeIntelAggregatedEvent) *types.NewCodeIntelUsageStatistics](#groupAggregatedCodeIntelStats)
    * [func groupAggregatedSearchStats(events []types.SearchAggregatedEvent) *types.SearchUsageStatistics](#groupAggregatedSearchStats)
    * [func groupSiteUsageStats(summary types.SiteUsageSummary, monthsOnly bool) *types.SiteUsageStatistics](#groupSiteUsageStats)
    * [func init()](#init.main_test.go)
    * [func int32Ptr(v int) *int32](#int32Ptr)
    * [func logLocalEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error](#logLocalEvent)
    * [func logSiteFindRefsOccurred() error](#logSiteFindRefsOccurred)
    * [func logSiteSearchOccurred() error](#logSiteSearchOccurred)
    * [func minIntOrZero(a, b int) int](#minIntOrZero)
    * [func mockTimeNow(t time.Time)](#mockTimeNow)
    * [func newSearchCountStatistics() *types.SearchCountStatistics](#newSearchCountStatistics)
    * [func newSearchEventPeriod() *types.SearchUsagePeriod](#newSearchEventPeriod)
    * [func newSearchEventStatistics() *types.SearchEventStatistics](#newSearchEventStatistics)
    * [func newSearchModeUsageStatistics() *types.SearchModeUsageStatistics](#newSearchModeUsageStatistics)
    * [func newSearchTestEvent(eventCount, userCount int32, p50, p90, p99 float64) *types.SearchEventStatistics](#newSearchTestEvent)
    * [func newSearchUsagePeriod(t time.Time, structuralEvent, commitEvent *types.SearchEventStatistics) []*types.SearchUsagePeriod](#newSearchUsagePeriod)
    * [func populateSearchEventStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)](#populateSearchEventStatistics)
    * [func populateSearchFilterCountStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)](#populateSearchFilterCountStatistics)
    * [func publishSourcegraphDotComEvent(args Event) error](#publishSourcegraphDotComEvent)
    * [func setupForTest(t *testing.T) dbutil.DB](#setupForTest)
    * [func siteActivityCompare(got, want *types.SiteUsageStatistics) error](#siteActivityCompare)
    * [func siteActivityPeriodCompare(label string, got, want *types.SiteActivityPeriod) error](#siteActivityPeriodCompare)
    * [func siteActivityPeriodSliceCompare(label string, got, want []*types.SiteActivityPeriod) error](#siteActivityPeriodSliceCompare)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="All" href="#All">const All</a>

```
searchKey: usagestats.All
tags: [constant string]
```

```Go
const All SettingFilter = "all"
```

### <a id="Day" href="#Day">const Day</a>

```
searchKey: usagestats.Day
tags: [constant string]
```

```Go
const Day TimeWindow = "day"
```

### <a id="Hour" href="#Hour">const Hour</a>

```
searchKey: usagestats.Hour
tags: [constant string]
```

```Go
const Hour TimeWindow = "hour"
```

### <a id="Month" href="#Month">const Month</a>

```
searchKey: usagestats.Month
tags: [constant string]
```

```Go
const Month TimeWindow = "month"
```

### <a id="Org" href="#Org">const Org</a>

```
searchKey: usagestats.Org
tags: [constant string]
```

```Go
const Org SettingFilter = "org"
```

### <a id="User" href="#User">const User</a>

```
searchKey: usagestats.User
tags: [constant string]
```

```Go
const User SettingFilter = "user"
```

### <a id="Week" href="#Week">const Week</a>

```
searchKey: usagestats.Week
tags: [constant string]
```

```Go
const Week TimeWindow = "week"
```

### <a id="Year" href="#Year">const Year</a>

```
searchKey: usagestats.Year
tags: [constant string]
```

```Go
const Year TimeWindow = "year"
```

### <a id="defaultDays" href="#defaultDays">const defaultDays</a>

```
searchKey: usagestats.defaultDays
tags: [constant number private]
```

```Go
const defaultDays = 14
```

### <a id="defaultMonths" href="#defaultMonths">const defaultMonths</a>

```
searchKey: usagestats.defaultMonths
tags: [constant number private]
```

```Go
const defaultMonths = 3
```

### <a id="defaultWeeks" href="#defaultWeeks">const defaultWeeks</a>

```
searchKey: usagestats.defaultWeeks
tags: [constant number private]
```

```Go
const defaultWeeks = 10
```

### <a id="fFindRefsOccurred" href="#fFindRefsOccurred">const fFindRefsOccurred</a>

```
searchKey: usagestats.fFindRefsOccurred
tags: [constant string private]
```

```Go
const fFindRefsOccurred = "findrefsoccurred"
```

### <a id="fSearchOccurred" href="#fSearchOccurred">const fSearchOccurred</a>

```
searchKey: usagestats.fSearchOccurred
tags: [constant string private]
```

```Go
const fSearchOccurred = "searchoccurred"
```

### <a id="getHomepagePanelsQuery" href="#getHomepagePanelsQuery">const getHomepagePanelsQuery</a>

```
searchKey: usagestats.getHomepagePanelsQuery
tags: [constant string private]
```

```Go
const getHomepagePanelsQuery = ...
```

### <a id="insightAloneSettingStr" href="#insightAloneSettingStr">const insightAloneSettingStr</a>

```
searchKey: usagestats.insightAloneSettingStr
tags: [constant string private]
```

```Go
const insightAloneSettingStr = ...
```

### <a id="insightInlineSettingStr" href="#insightInlineSettingStr">const insightInlineSettingStr</a>

```
searchKey: usagestats.insightInlineSettingStr
tags: [constant string private]
```

```Go
const insightInlineSettingStr = ...
```

### <a id="insightSettingMulti" href="#insightSettingMulti">const insightSettingMulti</a>

```
searchKey: usagestats.insightSettingMulti
tags: [constant string private]
```

```Go
const insightSettingMulti = ...
```

### <a id="insightSettingSimple" href="#insightSettingSimple">const insightSettingSimple</a>

```
searchKey: usagestats.insightSettingSimple
tags: [constant string private]
```

```Go
const insightSettingSimple = ...
```

### <a id="keyPrefix" href="#keyPrefix">const keyPrefix</a>

```
searchKey: usagestats.keyPrefix
tags: [constant string private]
```

```Go
const keyPrefix = "user_activity:"
```

### <a id="langStatsInsightSettingStr" href="#langStatsInsightSettingStr">const langStatsInsightSettingStr</a>

```
searchKey: usagestats.langStatsInsightSettingStr
tags: [constant string private]
```

```Go
const langStatsInsightSettingStr = ...
```

### <a id="maxStorageDays" href="#maxStorageDays">const maxStorageDays</a>

```
searchKey: usagestats.maxStorageDays
tags: [constant number private]
```

```Go
const maxStorageDays = 93
```

### <a id="templatePingQueryStr" href="#templatePingQueryStr">const templatePingQueryStr</a>

```
searchKey: usagestats.templatePingQueryStr
tags: [constant string private]
```

```Go
const templatePingQueryStr = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="MockGetByUserID" href="#MockGetByUserID">var MockGetByUserID</a>

```
searchKey: usagestats.MockGetByUserID
tags: [variable function]
```

```Go
var MockGetByUserID func(userID int32) (*types.UserUsageStatistics, error)
```

### <a id="actionMap" href="#actionMap">var actionMap</a>

```
searchKey: usagestats.actionMap
tags: [variable object private]
```

```Go
var actionMap = ...
```

### <a id="findRefsOccurred" href="#findRefsOccurred">var findRefsOccurred</a>

```
searchKey: usagestats.findRefsOccurred
tags: [variable number private]
```

```Go
var findRefsOccurred int32
```

### <a id="pool" href="#pool">var pool</a>

```
searchKey: usagestats.pool
tags: [variable struct private]
```

```Go
var pool = redispool.Store
```

### <a id="pubSubDotComEventsTopicID" href="#pubSubDotComEventsTopicID">var pubSubDotComEventsTopicID</a>

```
searchKey: usagestats.pubSubDotComEventsTopicID
tags: [variable string private]
```

```Go
var pubSubDotComEventsTopicID = ...
```

pubSubDotComEventsTopicID is the topic ID of the topic that forwards messages to Sourcegraph.com events' pub/sub subscribers. 

### <a id="searchFilterCountExtractors" href="#searchFilterCountExtractors">var searchFilterCountExtractors</a>

```
searchKey: usagestats.searchFilterCountExtractors
tags: [variable object private]
```

```Go
var searchFilterCountExtractors = ...
```

### <a id="searchLatencyExtractors" href="#searchLatencyExtractors">var searchLatencyExtractors</a>

```
searchKey: usagestats.searchLatencyExtractors
tags: [variable object private]
```

```Go
var searchLatencyExtractors = ...
```

utility functions that resolve a SearchEventStatistics value for a given event name for some SearchUsagePeriod. 

### <a id="searchOccurred" href="#searchOccurred">var searchOccurred</a>

```
searchKey: usagestats.searchOccurred
tags: [variable number private]
```

```Go
var searchOccurred int32
```

### <a id="sourceMap" href="#sourceMap">var sourceMap</a>

```
searchKey: usagestats.sourceMap
tags: [variable object private]
```

```Go
var sourceMap = ...
```

### <a id="timeNow" href="#timeNow">var timeNow</a>

```
searchKey: usagestats.timeNow
tags: [variable function private]
```

```Go
var timeNow = time.Now
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Event" href="#Event">type Event struct</a>

```
searchKey: usagestats.Event
tags: [struct]
```

```Go
type Event struct {
	EventName    string
	UserID       int32
	UserCookieID string
	// FirstSourceURL is only measured for Cloud events; therefore, this only goes to the BigQuery database
	// and does not go to the Postgres DB.
	FirstSourceURL *string
	URL            string
	Source         string
	FeatureFlags   featureflag.FlagSet
	CohortID       *string
	Argument       json.RawMessage
}
```

Event represents a request to log telemetry. 

### <a id="Interval" href="#Interval">type Interval struct</a>

```
searchKey: usagestats.Interval
tags: [struct]
```

```Go
type Interval struct {
	Years  *int
	Months *int
	Weeks  *int
	Days   *int
	Hours  *int
}
```

### <a id="LangStatsInsight" href="#LangStatsInsight">type LangStatsInsight struct</a>

```
searchKey: usagestats.LangStatsInsight
tags: [struct]
```

```Go
type LangStatsInsight struct {
	ID             string
	Title          string
	Repository     string
	OtherThreshold float32
}
```

### <a id="PingQueryBuilder" href="#PingQueryBuilder">type PingQueryBuilder struct</a>

```
searchKey: usagestats.PingQueryBuilder
tags: [struct]
```

```Go
type PingQueryBuilder struct {
	pings      []string
	timeWindow TimeWindow
	getTime    func() time.Time
}
```

#### <a id="NewPingBuilder" href="#NewPingBuilder">func NewPingBuilder(timeWindow TimeWindow, timeSupplier func() time.Time) PingQueryBuilder</a>

```
searchKey: usagestats.NewPingBuilder
tags: [function]
```

```Go
func NewPingBuilder(timeWindow TimeWindow, timeSupplier func() time.Time) PingQueryBuilder
```

#### <a id="creationPagesPingBuilder" href="#creationPagesPingBuilder">func creationPagesPingBuilder(timeSupplier func() time.Time) PingQueryBuilder</a>

```
searchKey: usagestats.creationPagesPingBuilder
tags: [function private]
```

```Go
func creationPagesPingBuilder(timeSupplier func() time.Time) PingQueryBuilder
```

#### <a id="PingQueryBuilder.Sample" href="#PingQueryBuilder.Sample">func (b *PingQueryBuilder) Sample(ctx context.Context, db dbutil.DB) ([]types.AggregatedPingStats, error)</a>

```
searchKey: usagestats.PingQueryBuilder.Sample
tags: [method]
```

```Go
func (b *PingQueryBuilder) Sample(ctx context.Context, db dbutil.DB) ([]types.AggregatedPingStats, error)
```

Sample executes the derived query generated by this builder and returns a sample at the current time 

#### <a id="PingQueryBuilder.With" href="#PingQueryBuilder.With">func (b *PingQueryBuilder) With(name types.PingName) *PingQueryBuilder</a>

```
searchKey: usagestats.PingQueryBuilder.With
tags: [method]
```

```Go
func (b *PingQueryBuilder) With(name types.PingName) *PingQueryBuilder
```

With add a single ping by name to this builder 

#### <a id="PingQueryBuilder.WithAll" href="#PingQueryBuilder.WithAll">func (b *PingQueryBuilder) WithAll(pings []types.PingName) *PingQueryBuilder</a>

```
searchKey: usagestats.PingQueryBuilder.WithAll
tags: [method]
```

```Go
func (b *PingQueryBuilder) WithAll(pings []types.PingName) *PingQueryBuilder
```

WithAll adds multiple pings by name to this builder 

### <a id="Repositories" href="#Repositories">type Repositories struct</a>

```
searchKey: usagestats.Repositories
tags: [struct]
```

```Go
type Repositories struct {
	// GitDirBytes is the amount of bytes stored in .git directories.
	GitDirBytes uint64

	// NewLinesCount is the number of newlines "\n" that appear in the zoekt
	// indexed documents. This is not exactly the same as line count, since it
	// will not include lines not terminated by "\n" (eg a file with no "\n",
	// or a final line without "\n").
	//
	// Note: Zoekt deduplicates documents across branches, so if a path has
	// the same contents on multiple branches, there is only one document for
	// it. As such that document's newlines is only counted once. See
	// DefaultBranchNewLinesCount and OtherBranchesNewLinesCount for counts
	// which do not deduplicate.
	NewLinesCount uint64

	// DefaultBranchNewLinesCount is the number of newlines "\n" in the default
	// branch.
	DefaultBranchNewLinesCount uint64

	// OtherBranchesNewLinesCount is the number of newlines "\n" in all
	// indexed branches except the default branch.
	OtherBranchesNewLinesCount uint64
}
```

#### <a id="GetRepositories" href="#GetRepositories">func GetRepositories(ctx context.Context) (*Repositories, error)</a>

```
searchKey: usagestats.GetRepositories
tags: [function]
```

```Go
func GetRepositories(ctx context.Context) (*Repositories, error)
```

### <a id="SearchInsight" href="#SearchInsight">type SearchInsight struct</a>

```
searchKey: usagestats.SearchInsight
tags: [struct]
```

```Go
type SearchInsight struct {
	ID           string
	Title        string
	Repositories []string
	Series       []TimeSeries
	Step         Interval
	Visibility   string
}
```

### <a id="SettingFilter" href="#SettingFilter">type SettingFilter string</a>

```
searchKey: usagestats.SettingFilter
tags: [string]
```

```Go
type SettingFilter string
```

### <a id="SiteUsageStatisticsOptions" href="#SiteUsageStatisticsOptions">type SiteUsageStatisticsOptions struct</a>

```
searchKey: usagestats.SiteUsageStatisticsOptions
tags: [struct]
```

```Go
type SiteUsageStatisticsOptions struct {
	DayPeriods   *int
	WeekPeriods  *int
	MonthPeriods *int
}
```

SiteUsageStatisticsOptions contains options for the number of daily, weekly, and monthly periods in which to calculate the number of unique users (i.e., how many days of Daily Active Users, or DAUs, how many weeks of Weekly Active Users, or WAUs, and how many months of Monthly Active Users, or MAUs). 

### <a id="TimeSeries" href="#TimeSeries">type TimeSeries struct</a>

```
searchKey: usagestats.TimeSeries
tags: [struct]
```

```Go
type TimeSeries struct {
	Name   string
	Stroke string
	Query  string
}
```

### <a id="TimeWindow" href="#TimeWindow">type TimeWindow string</a>

```
searchKey: usagestats.TimeWindow
tags: [string]
```

```Go
type TimeWindow string
```

### <a id="bigQueryEvent" href="#bigQueryEvent">type bigQueryEvent struct</a>

```
searchKey: usagestats.bigQueryEvent
tags: [struct private]
```

```Go
type bigQueryEvent struct {
	EventName       string  `json:"name"`
	AnonymousUserID string  `json:"anonymous_user_id"`
	FirstSourceURL  string  `json:"first_source_url"`
	UserID          int     `json:"user_id"`
	Source          string  `json:"source"`
	Timestamp       string  `json:"timestamp"`
	Version         string  `json:"version"`
	FeatureFlags    string  `json:"feature_flags"`
	CohortID        *string `json:"cohort_id,omitempty"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="FilterSettingJson" href="#FilterSettingJson">func FilterSettingJson(settingJson string, prefix string) (map[string]json.RawMessage, error)</a>

```
searchKey: usagestats.FilterSettingJson
tags: [function]
```

```Go
func FilterSettingJson(settingJson string, prefix string) (map[string]json.RawMessage, error)
```

FilterSettingJson will return a json map that only contains keys that match a prefix string, mapped to the keyed contents. 

### <a id="GetAggregatedCodeIntelStats" href="#GetAggregatedCodeIntelStats">func GetAggregatedCodeIntelStats(ctx context.Context, db dbutil.DB) (*types.NewCodeIntelUsageStatistics, error)</a>

```
searchKey: usagestats.GetAggregatedCodeIntelStats
tags: [function]
```

```Go
func GetAggregatedCodeIntelStats(ctx context.Context, db dbutil.DB) (*types.NewCodeIntelUsageStatistics, error)
```

GetAggregatedCodeIntelStats returns aggregated statistics for code intelligence usage. 

### <a id="GetAggregatedSearchStats" href="#GetAggregatedSearchStats">func GetAggregatedSearchStats(ctx context.Context, db dbutil.DB) (*types.SearchUsageStatistics, error)</a>

```
searchKey: usagestats.GetAggregatedSearchStats
tags: [function]
```

```Go
func GetAggregatedSearchStats(ctx context.Context, db dbutil.DB) (*types.SearchUsageStatistics, error)
```

GetAggregatedSearchStats queries the database for search usage and returns the aggregates statistics in the format of our BigQuery schema. 

### <a id="GetArchive" href="#GetArchive">func GetArchive(ctx context.Context, db dbutil.DB) ([]byte, error)</a>

```
searchKey: usagestats.GetArchive
tags: [function]
```

```Go
func GetArchive(ctx context.Context, db dbutil.DB) ([]byte, error)
```

GetArchive generates and returns a usage statistics ZIP archive containing the CSV files defined in RFC 145, or an error in case of failure. 

### <a id="GetBatchChangesUsageStatistics" href="#GetBatchChangesUsageStatistics">func GetBatchChangesUsageStatistics(ctx context.Context, db dbutil.DB) (*types.BatchChangesUsageStatistics, error)</a>

```
searchKey: usagestats.GetBatchChangesUsageStatistics
tags: [function]
```

```Go
func GetBatchChangesUsageStatistics(ctx context.Context, db dbutil.DB) (*types.BatchChangesUsageStatistics, error)
```

GetBatchChangesUsageStatistics returns the current site's batch changes usage. 

### <a id="GetByUserID" href="#GetByUserID">func GetByUserID(ctx context.Context, db dbutil.DB, userID int32) (*types.UserUsageStatistics, error)</a>

```
searchKey: usagestats.GetByUserID
tags: [function]
```

```Go
func GetByUserID(ctx context.Context, db dbutil.DB, userID int32) (*types.UserUsageStatistics, error)
```

GetByUserID returns a single user's UserUsageStatistics. 

### <a id="GetCodeInsightsUsageStatistics" href="#GetCodeInsightsUsageStatistics">func GetCodeInsightsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeInsightsUsageStatistics, error)</a>

```
searchKey: usagestats.GetCodeInsightsUsageStatistics
tags: [function]
```

```Go
func GetCodeInsightsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeInsightsUsageStatistics, error)
```

### <a id="GetCodeMonitoringUsageStatistics" href="#GetCodeMonitoringUsageStatistics">func GetCodeMonitoringUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeMonitoringUsageStatistics, error)</a>

```
searchKey: usagestats.GetCodeMonitoringUsageStatistics
tags: [function]
```

```Go
func GetCodeMonitoringUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeMonitoringUsageStatistics, error)
```

### <a id="GetCreationViewUsage" href="#GetCreationViewUsage">func GetCreationViewUsage(ctx context.Context, db dbutil.DB, timeSupplier func() time.Time) ([]types.AggregatedPingStats, error)</a>

```
searchKey: usagestats.GetCreationViewUsage
tags: [function]
```

```Go
func GetCreationViewUsage(ctx context.Context, db dbutil.DB, timeSupplier func() time.Time) ([]types.AggregatedPingStats, error)
```

### <a id="GetExtensionsUsageStatistics" href="#GetExtensionsUsageStatistics">func GetExtensionsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.ExtensionsUsageStatistics, error)</a>

```
searchKey: usagestats.GetExtensionsUsageStatistics
tags: [function]
```

```Go
func GetExtensionsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.ExtensionsUsageStatistics, error)
```

### <a id="GetGrowthStatistics" href="#GetGrowthStatistics">func GetGrowthStatistics(ctx context.Context, db dbutil.DB) (*types.GrowthStatistics, error)</a>

```
searchKey: usagestats.GetGrowthStatistics
tags: [function]
```

```Go
func GetGrowthStatistics(ctx context.Context, db dbutil.DB) (*types.GrowthStatistics, error)
```

### <a id="GetHomepagePanels" href="#GetHomepagePanels">func GetHomepagePanels(ctx context.Context, db dbutil.DB) (*types.HomepagePanels, error)</a>

```
searchKey: usagestats.GetHomepagePanels
tags: [function]
```

```Go
func GetHomepagePanels(ctx context.Context, db dbutil.DB) (*types.HomepagePanels, error)
```

### <a id="GetLangStatsInsights" href="#GetLangStatsInsights">func GetLangStatsInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]LangStatsInsight, error)</a>

```
searchKey: usagestats.GetLangStatsInsights
tags: [function]
```

```Go
func GetLangStatsInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]LangStatsInsight, error)
```

### <a id="GetOrgInsightCounts" href="#GetOrgInsightCounts">func GetOrgInsightCounts(ctx context.Context, db dbutil.DB) ([]types.OrgVisibleInsightPing, error)</a>

```
searchKey: usagestats.GetOrgInsightCounts
tags: [function]
```

```Go
func GetOrgInsightCounts(ctx context.Context, db dbutil.DB) ([]types.OrgVisibleInsightPing, error)
```

### <a id="GetRetentionStatistics" href="#GetRetentionStatistics">func GetRetentionStatistics(ctx context.Context, db dbutil.DB) (*types.RetentionStats, error)</a>

```
searchKey: usagestats.GetRetentionStatistics
tags: [function]
```

```Go
func GetRetentionStatistics(ctx context.Context, db dbutil.DB) (*types.RetentionStats, error)
```

### <a id="GetSavedSearches" href="#GetSavedSearches">func GetSavedSearches(ctx context.Context, db dbutil.DB) (*types.SavedSearches, error)</a>

```
searchKey: usagestats.GetSavedSearches
tags: [function]
```

```Go
func GetSavedSearches(ctx context.Context, db dbutil.DB) (*types.SavedSearches, error)
```

### <a id="GetSearchInsights" href="#GetSearchInsights">func GetSearchInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]SearchInsight, error)</a>

```
searchKey: usagestats.GetSearchInsights
tags: [function]
```

```Go
func GetSearchInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]SearchInsight, error)
```

### <a id="GetSearchOnboarding" href="#GetSearchOnboarding">func GetSearchOnboarding(ctx context.Context, db dbutil.DB) (*types.SearchOnboarding, error)</a>

```
searchKey: usagestats.GetSearchOnboarding
tags: [function]
```

```Go
func GetSearchOnboarding(ctx context.Context, db dbutil.DB) (*types.SearchOnboarding, error)
```

### <a id="GetSettings" href="#GetSettings">func GetSettings(ctx context.Context, db dbutil.DB, filter SettingFilter, prefix string) ([]*api.Settings, error)</a>

```
searchKey: usagestats.GetSettings
tags: [function]
```

```Go
func GetSettings(ctx context.Context, db dbutil.DB, filter SettingFilter, prefix string) ([]*api.Settings, error)
```

GetSettings returns all settings on the Sourcegraph installation that can be filtered by a type. This is useful for generating aggregates for code insights which are currently stored in the settings. 🚨 SECURITY: This method bypasses any user permissions to fetch a list of all settings on the Sourcegraph installation. It is used for generating aggregated analytics that require an accurate view across all settings, such as for code insights🚨 

### <a id="GetSiteUsageStatistics" href="#GetSiteUsageStatistics">func GetSiteUsageStatistics(ctx context.Context, db dbutil.DB, opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)</a>

```
searchKey: usagestats.GetSiteUsageStatistics
tags: [function]
```

```Go
func GetSiteUsageStatistics(ctx context.Context, db dbutil.DB, opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)
```

GetSiteUsageStatistics returns the current site's SiteActivity. 

### <a id="GetSiteUsageStats" href="#GetSiteUsageStats">func GetSiteUsageStats(ctx context.Context, db dbutil.DB, monthsOnly bool) (*types.SiteUsageStatistics, error)</a>

```
searchKey: usagestats.GetSiteUsageStats
tags: [function]
```

```Go
func GetSiteUsageStats(ctx context.Context, db dbutil.DB, monthsOnly bool) (*types.SiteUsageStatistics, error)
```

### <a id="GetTimeStepCounts" href="#GetTimeStepCounts">func GetTimeStepCounts(ctx context.Context, db dbutil.DB) ([]types.InsightTimeIntervalPing, error)</a>

```
searchKey: usagestats.GetTimeStepCounts
tags: [function]
```

```Go
func GetTimeStepCounts(ctx context.Context, db dbutil.DB) ([]types.InsightTimeIntervalPing, error)
```

### <a id="GetUsersActiveTodayCount" href="#GetUsersActiveTodayCount">func GetUsersActiveTodayCount(ctx context.Context, db dbutil.DB) (int, error)</a>

```
searchKey: usagestats.GetUsersActiveTodayCount
tags: [function]
```

```Go
func GetUsersActiveTodayCount(ctx context.Context, db dbutil.DB) (int, error)
```

GetUsersActiveTodayCount returns a count of users that have been active today. 

### <a id="HasFindRefsOccurred" href="#HasFindRefsOccurred">func HasFindRefsOccurred(ctx context.Context) (bool, error)</a>

```
searchKey: usagestats.HasFindRefsOccurred
tags: [function]
```

```Go
func HasFindRefsOccurred(ctx context.Context) (bool, error)
```

HasFindRefsOccurred indicates whether a find-refs has ever occurred on this instance. 

### <a id="HasSearchOccurred" href="#HasSearchOccurred">func HasSearchOccurred(ctx context.Context) (bool, error)</a>

```
searchKey: usagestats.HasSearchOccurred
tags: [function]
```

```Go
func HasSearchOccurred(ctx context.Context) (bool, error)
```

HasSearchOccurred indicates whether a search has ever occurred on this instance. 

### <a id="ListRegisteredUsersThisMonth" href="#ListRegisteredUsersThisMonth">func ListRegisteredUsersThisMonth(ctx context.Context, db dbutil.DB) ([]int32, error)</a>

```
searchKey: usagestats.ListRegisteredUsersThisMonth
tags: [function]
```

```Go
func ListRegisteredUsersThisMonth(ctx context.Context, db dbutil.DB) ([]int32, error)
```

ListRegisteredUsersThisMonth returns a list of the registered users that were active this month. 

### <a id="ListRegisteredUsersThisWeek" href="#ListRegisteredUsersThisWeek">func ListRegisteredUsersThisWeek(ctx context.Context, db dbutil.DB) ([]int32, error)</a>

```
searchKey: usagestats.ListRegisteredUsersThisWeek
tags: [function]
```

```Go
func ListRegisteredUsersThisWeek(ctx context.Context, db dbutil.DB) ([]int32, error)
```

ListRegisteredUsersThisWeek returns a list of the registered users that were active this week. 

### <a id="ListRegisteredUsersToday" href="#ListRegisteredUsersToday">func ListRegisteredUsersToday(ctx context.Context, db dbutil.DB) ([]int32, error)</a>

```
searchKey: usagestats.ListRegisteredUsersToday
tags: [function]
```

```Go
func ListRegisteredUsersToday(ctx context.Context, db dbutil.DB) ([]int32, error)
```

ListRegisteredUsersToday returns a list of the registered users that were active today. 

### <a id="LogBackendEvent" href="#LogBackendEvent">func LogBackendEvent(db dbutil.DB, userID int32, eventName string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error</a>

```
searchKey: usagestats.LogBackendEvent
tags: [function]
```

```Go
func LogBackendEvent(db dbutil.DB, userID int32, eventName string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error
```

LogBackendEvent is a convenience function for logging backend events. 

### <a id="LogEvent" href="#LogEvent">func LogEvent(ctx context.Context, db dbutil.DB, args Event) error</a>

```
searchKey: usagestats.LogEvent
tags: [function]
```

```Go
func LogEvent(ctx context.Context, db dbutil.DB, args Event) error
```

LogEvent logs an event. 

### <a id="TestCodeInsightsUsageStatistics" href="#TestCodeInsightsUsageStatistics">func TestCodeInsightsUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestCodeInsightsUsageStatistics
tags: [function private test]
```

```Go
func TestCodeInsightsUsageStatistics(t *testing.T)
```

### <a id="TestCodeMonitoringUsageStatistics" href="#TestCodeMonitoringUsageStatistics">func TestCodeMonitoringUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestCodeMonitoringUsageStatistics
tags: [function private test]
```

```Go
func TestCodeMonitoringUsageStatistics(t *testing.T)
```

### <a id="TestExtensionsUsageStatistics" href="#TestExtensionsUsageStatistics">func TestExtensionsUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestExtensionsUsageStatistics
tags: [function private test]
```

```Go
func TestExtensionsUsageStatistics(t *testing.T)
```

### <a id="TestFilterSettingJson" href="#TestFilterSettingJson">func TestFilterSettingJson(t *testing.T)</a>

```
searchKey: usagestats.TestFilterSettingJson
tags: [function private test]
```

```Go
func TestFilterSettingJson(t *testing.T)
```

### <a id="TestGetArchive" href="#TestGetArchive">func TestGetArchive(t *testing.T)</a>

```
searchKey: usagestats.TestGetArchive
tags: [function private test]
```

```Go
func TestGetArchive(t *testing.T)
```

### <a id="TestGetBatchChangesUsageStatistics" href="#TestGetBatchChangesUsageStatistics">func TestGetBatchChangesUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestGetBatchChangesUsageStatistics
tags: [function private test]
```

```Go
func TestGetBatchChangesUsageStatistics(t *testing.T)
```

### <a id="TestGetLangStatsInsights" href="#TestGetLangStatsInsights">func TestGetLangStatsInsights(t *testing.T)</a>

```
searchKey: usagestats.TestGetLangStatsInsights
tags: [function private test]
```

```Go
func TestGetLangStatsInsights(t *testing.T)
```

### <a id="TestGetSearchInsights" href="#TestGetSearchInsights">func TestGetSearchInsights(t *testing.T)</a>

```
searchKey: usagestats.TestGetSearchInsights
tags: [function private test]
```

```Go
func TestGetSearchInsights(t *testing.T)
```

### <a id="TestGroupAggregateSearchStats" href="#TestGroupAggregateSearchStats">func TestGroupAggregateSearchStats(t *testing.T)</a>

```
searchKey: usagestats.TestGroupAggregateSearchStats
tags: [function private test]
```

```Go
func TestGroupAggregateSearchStats(t *testing.T)
```

### <a id="TestGroupAggregatedCodeIntelStats" href="#TestGroupAggregatedCodeIntelStats">func TestGroupAggregatedCodeIntelStats(t *testing.T)</a>

```
searchKey: usagestats.TestGroupAggregatedCodeIntelStats
tags: [function private test]
```

```Go
func TestGroupAggregatedCodeIntelStats(t *testing.T)
```

### <a id="TestGroupSiteUsageStats" href="#TestGroupSiteUsageStats">func TestGroupSiteUsageStats(t *testing.T)</a>

```
searchKey: usagestats.TestGroupSiteUsageStats
tags: [function private test]
```

```Go
func TestGroupSiteUsageStats(t *testing.T)
```

### <a id="TestGroupSiteUsageStatsMonthsOnly" href="#TestGroupSiteUsageStatsMonthsOnly">func TestGroupSiteUsageStatsMonthsOnly(t *testing.T)</a>

```
searchKey: usagestats.TestGroupSiteUsageStatsMonthsOnly
tags: [function private test]
```

```Go
func TestGroupSiteUsageStatsMonthsOnly(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: usagestats.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestRetentionUsageStatistics" href="#TestRetentionUsageStatistics">func TestRetentionUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestRetentionUsageStatistics
tags: [function private test]
```

```Go
func TestRetentionUsageStatistics(t *testing.T)
```

### <a id="TestUserUsageStatistics_DAUs_WAUs_MAUs" href="#TestUserUsageStatistics_DAUs_WAUs_MAUs">func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_DAUs_WAUs_MAUs
tags: [function private test]
```

```Go
func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogCodeHostIntegrationUsage" href="#TestUserUsageStatistics_LogCodeHostIntegrationUsage">func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_LogCodeHostIntegrationUsage
tags: [function private test]
```

```Go
func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogCodeIntelAction" href="#TestUserUsageStatistics_LogCodeIntelAction">func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_LogCodeIntelAction
tags: [function private test]
```

```Go
func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogPageView" href="#TestUserUsageStatistics_LogPageView">func TestUserUsageStatistics_LogPageView(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_LogPageView
tags: [function private test]
```

```Go
func TestUserUsageStatistics_LogPageView(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogSearchQuery" href="#TestUserUsageStatistics_LogSearchQuery">func TestUserUsageStatistics_LogSearchQuery(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_LogSearchQuery
tags: [function private test]
```

```Go
func TestUserUsageStatistics_LogSearchQuery(t *testing.T)
```

### <a id="TestUserUsageStatistics_None" href="#TestUserUsageStatistics_None">func TestUserUsageStatistics_None(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_None
tags: [function private test]
```

```Go
func TestUserUsageStatistics_None(t *testing.T)
```

### <a id="TestUserUsageStatistics_getUsersActiveToday" href="#TestUserUsageStatistics_getUsersActiveToday">func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_getUsersActiveToday
tags: [function private test]
```

```Go
func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)
```

### <a id="TestWithCreationPings" href="#TestWithCreationPings">func TestWithCreationPings(t *testing.T)</a>

```
searchKey: usagestats.TestWithCreationPings
tags: [function private test]
```

```Go
func TestWithCreationPings(t *testing.T)
```

### <a id="activeUsers" href="#activeUsers">func activeUsers(ctx context.Context, db dbutil.DB, periodType database.PeriodType, periods int) ([]*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestats.activeUsers
tags: [function private]
```

```Go
func activeUsers(ctx context.Context, db dbutil.DB, periodType database.PeriodType, periods int) ([]*types.SiteActivityPeriod, error)
```

activeUsers returns counts of active users in the given number of days, weeks, or months, as selected (including the current, partially completed period). 

### <a id="convertStepToDays" href="#convertStepToDays">func convertStepToDays(insight SearchInsight) int</a>

```
searchKey: usagestats.convertStepToDays
tags: [function private]
```

```Go
func convertStepToDays(insight SearchInsight) int
```

convertStepToDays converts the step interval defined in the insight settings to days, rounded down 

### <a id="groupAggregatedCodeIntelStats" href="#groupAggregatedCodeIntelStats">func groupAggregatedCodeIntelStats(rawEvents []types.CodeIntelAggregatedEvent) *types.NewCodeIntelUsageStatistics</a>

```
searchKey: usagestats.groupAggregatedCodeIntelStats
tags: [function private]
```

```Go
func groupAggregatedCodeIntelStats(rawEvents []types.CodeIntelAggregatedEvent) *types.NewCodeIntelUsageStatistics
```

### <a id="groupAggregatedSearchStats" href="#groupAggregatedSearchStats">func groupAggregatedSearchStats(events []types.SearchAggregatedEvent) *types.SearchUsageStatistics</a>

```
searchKey: usagestats.groupAggregatedSearchStats
tags: [function private]
```

```Go
func groupAggregatedSearchStats(events []types.SearchAggregatedEvent) *types.SearchUsageStatistics
```

groupAggregatedSearchStats takes a set of input events (originating from Sourcegraph's Postgres table) and returns a SearchUsageStatistics data type that ends up being stored in BigQuery. SearchUsageStatistics corresponds to the target DB schema. 

### <a id="groupSiteUsageStats" href="#groupSiteUsageStats">func groupSiteUsageStats(summary types.SiteUsageSummary, monthsOnly bool) *types.SiteUsageStatistics</a>

```
searchKey: usagestats.groupSiteUsageStats
tags: [function private]
```

```Go
func groupSiteUsageStats(summary types.SiteUsageSummary, monthsOnly bool) *types.SiteUsageStatistics
```

### <a id="init.main_test.go" href="#init.main_test.go">func init()</a>

```
searchKey: usagestats.init
tags: [function private]
```

```Go
func init()
```

### <a id="int32Ptr" href="#int32Ptr">func int32Ptr(v int) *int32</a>

```
searchKey: usagestats.int32Ptr
tags: [function private]
```

```Go
func int32Ptr(v int) *int32
```

### <a id="logLocalEvent" href="#logLocalEvent">func logLocalEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error</a>

```
searchKey: usagestats.logLocalEvent
tags: [function private]
```

```Go
func logLocalEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error
```

logLocalEvent logs users events. 

### <a id="logSiteFindRefsOccurred" href="#logSiteFindRefsOccurred">func logSiteFindRefsOccurred() error</a>

```
searchKey: usagestats.logSiteFindRefsOccurred
tags: [function private]
```

```Go
func logSiteFindRefsOccurred() error
```

logSiteFindRefsOccurred records that a search has occurred on the Sourcegraph instance. 

### <a id="logSiteSearchOccurred" href="#logSiteSearchOccurred">func logSiteSearchOccurred() error</a>

```
searchKey: usagestats.logSiteSearchOccurred
tags: [function private]
```

```Go
func logSiteSearchOccurred() error
```

logSiteSearchOccurred records that a search has occurred on the Sourcegraph instance. 

### <a id="minIntOrZero" href="#minIntOrZero">func minIntOrZero(a, b int) int</a>

```
searchKey: usagestats.minIntOrZero
tags: [function private]
```

```Go
func minIntOrZero(a, b int) int
```

### <a id="mockTimeNow" href="#mockTimeNow">func mockTimeNow(t time.Time)</a>

```
searchKey: usagestats.mockTimeNow
tags: [function private]
```

```Go
func mockTimeNow(t time.Time)
```

### <a id="newSearchCountStatistics" href="#newSearchCountStatistics">func newSearchCountStatistics() *types.SearchCountStatistics</a>

```
searchKey: usagestats.newSearchCountStatistics
tags: [function private]
```

```Go
func newSearchCountStatistics() *types.SearchCountStatistics
```

### <a id="newSearchEventPeriod" href="#newSearchEventPeriod">func newSearchEventPeriod() *types.SearchUsagePeriod</a>

```
searchKey: usagestats.newSearchEventPeriod
tags: [function private]
```

```Go
func newSearchEventPeriod() *types.SearchUsagePeriod
```

### <a id="newSearchEventStatistics" href="#newSearchEventStatistics">func newSearchEventStatistics() *types.SearchEventStatistics</a>

```
searchKey: usagestats.newSearchEventStatistics
tags: [function private]
```

```Go
func newSearchEventStatistics() *types.SearchEventStatistics
```

### <a id="newSearchModeUsageStatistics" href="#newSearchModeUsageStatistics">func newSearchModeUsageStatistics() *types.SearchModeUsageStatistics</a>

```
searchKey: usagestats.newSearchModeUsageStatistics
tags: [function private]
```

```Go
func newSearchModeUsageStatistics() *types.SearchModeUsageStatistics
```

### <a id="newSearchTestEvent" href="#newSearchTestEvent">func newSearchTestEvent(eventCount, userCount int32, p50, p90, p99 float64) *types.SearchEventStatistics</a>

```
searchKey: usagestats.newSearchTestEvent
tags: [function private]
```

```Go
func newSearchTestEvent(eventCount, userCount int32, p50, p90, p99 float64) *types.SearchEventStatistics
```

### <a id="newSearchUsagePeriod" href="#newSearchUsagePeriod">func newSearchUsagePeriod(t time.Time, structuralEvent, commitEvent *types.SearchEventStatistics) []*types.SearchUsagePeriod</a>

```
searchKey: usagestats.newSearchUsagePeriod
tags: [function private]
```

```Go
func newSearchUsagePeriod(t time.Time, structuralEvent, commitEvent *types.SearchEventStatistics) []*types.SearchUsagePeriod
```

### <a id="populateSearchEventStatistics" href="#populateSearchEventStatistics">func populateSearchEventStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)</a>

```
searchKey: usagestats.populateSearchEventStatistics
tags: [function private]
```

```Go
func populateSearchEventStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)
```

populateSearchEventStatistics is a side-effecting function that populates the `statistics` object. The `statistics` event value is our target output type. 

Overview how it works: (1) To populate the `statistics` object, we expect an event to have a supported event.Name. 

(2) Create a SearchUsagePeriod target object based on the event's period (i.e., Month, Week, Day). 

(3) Use the SearchUsagePeriod object as an argument for the utility functions above, to get a handle on the (currently zero-valued) SearchEventStatistics value that it contains that corresponds to that event type. 

(4) Populate that SearchEventStatistics object in the SearchUsagePeriod object with usage stats (latencies, etc). 

### <a id="populateSearchFilterCountStatistics" href="#populateSearchFilterCountStatistics">func populateSearchFilterCountStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)</a>

```
searchKey: usagestats.populateSearchFilterCountStatistics
tags: [function private]
```

```Go
func populateSearchFilterCountStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)
```

### <a id="publishSourcegraphDotComEvent" href="#publishSourcegraphDotComEvent">func publishSourcegraphDotComEvent(args Event) error</a>

```
searchKey: usagestats.publishSourcegraphDotComEvent
tags: [function private]
```

```Go
func publishSourcegraphDotComEvent(args Event) error
```

publishSourcegraphDotComEvent publishes Sourcegraph.com events to BigQuery. 

### <a id="setupForTest" href="#setupForTest">func setupForTest(t *testing.T) dbutil.DB</a>

```
searchKey: usagestats.setupForTest
tags: [function private]
```

```Go
func setupForTest(t *testing.T) dbutil.DB
```

### <a id="siteActivityCompare" href="#siteActivityCompare">func siteActivityCompare(got, want *types.SiteUsageStatistics) error</a>

```
searchKey: usagestats.siteActivityCompare
tags: [function private]
```

```Go
func siteActivityCompare(got, want *types.SiteUsageStatistics) error
```

### <a id="siteActivityPeriodCompare" href="#siteActivityPeriodCompare">func siteActivityPeriodCompare(label string, got, want *types.SiteActivityPeriod) error</a>

```
searchKey: usagestats.siteActivityPeriodCompare
tags: [function private]
```

```Go
func siteActivityPeriodCompare(label string, got, want *types.SiteActivityPeriod) error
```

### <a id="siteActivityPeriodSliceCompare" href="#siteActivityPeriodSliceCompare">func siteActivityPeriodSliceCompare(label string, got, want []*types.SiteActivityPeriod) error</a>

```
searchKey: usagestats.siteActivityPeriodSliceCompare
tags: [function private]
```

```Go
func siteActivityPeriodSliceCompare(label string, got, want []*types.SiteActivityPeriod) error
```

