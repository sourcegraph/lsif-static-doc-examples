# Package usagestats

Package usagestats provides an interface to update and access information about individual and aggregate Sourcegraph users' activity levels. 

Package usagestats provides an interface to update and access information about individual and aggregate Sourcegraph users' activity levels. 

## Index

* [Constants](#const)
    * [const keyPrefix](#keyPrefix)
    * [const fSearchOccurred](#fSearchOccurred)
    * [const fFindRefsOccurred](#fFindRefsOccurred)
    * [const Hour](#Hour)
    * [const Day](#Day)
    * [const Week](#Week)
    * [const Month](#Month)
    * [const Year](#Year)
    * [const templatePingQueryStr](#templatePingQueryStr)
    * [const Org](#Org)
    * [const User](#User)
    * [const All](#All)
    * [const defaultDays](#defaultDays)
    * [const defaultWeeks](#defaultWeeks)
    * [const defaultMonths](#defaultMonths)
    * [const maxStorageDays](#maxStorageDays)
    * [const getHomepagePanelsQuery](#getHomepagePanelsQuery)
    * [const insightSettingSimple](#insightSettingSimple)
    * [const insightSettingMulti](#insightSettingMulti)
    * [const insightAloneSettingStr](#insightAloneSettingStr)
    * [const insightInlineSettingStr](#insightInlineSettingStr)
    * [const langStatsInsightSettingStr](#langStatsInsightSettingStr)
* [Variables](#var)
    * [var actionMap](#actionMap)
    * [var sourceMap](#sourceMap)
    * [var searchLatencyExtractors](#searchLatencyExtractors)
    * [var searchFilterCountExtractors](#searchFilterCountExtractors)
    * [var pool](#pool)
    * [var searchOccurred](#searchOccurred)
    * [var findRefsOccurred](#findRefsOccurred)
    * [var pubSubDotComEventsTopicID](#pubSubDotComEventsTopicID)
    * [var timeNow](#timeNow)
    * [var MockGetByUserID](#MockGetByUserID)
* [Types](#type)
    * [type PingQueryBuilder struct](#PingQueryBuilder)
        * [func creationPagesPingBuilder(timeSupplier func() time.Time) PingQueryBuilder](#creationPagesPingBuilder)
        * [func NewPingBuilder(timeWindow TimeWindow, timeSupplier func() time.Time) PingQueryBuilder](#NewPingBuilder)
        * [func (b *PingQueryBuilder) WithAll(pings []types.PingName) *PingQueryBuilder](#PingQueryBuilder.WithAll)
        * [func (b *PingQueryBuilder) With(name types.PingName) *PingQueryBuilder](#PingQueryBuilder.With)
        * [func (b *PingQueryBuilder) Sample(ctx context.Context, db dbutil.DB) ([]types.AggregatedPingStats, error)](#PingQueryBuilder.Sample)
    * [type TimeWindow string](#TimeWindow)
    * [type TimeSeries struct](#TimeSeries)
    * [type Interval struct](#Interval)
    * [type SearchInsight struct](#SearchInsight)
    * [type LangStatsInsight struct](#LangStatsInsight)
    * [type SettingFilter string](#SettingFilter)
    * [type Event struct](#Event)
    * [type bigQueryEvent struct](#bigQueryEvent)
    * [type Repositories struct](#Repositories)
        * [func GetRepositories(ctx context.Context) (*Repositories, error)](#GetRepositories)
    * [type SiteUsageStatisticsOptions struct](#SiteUsageStatisticsOptions)
* [Functions](#func)
    * [func GetSiteUsageStats(ctx context.Context, db dbutil.DB, monthsOnly bool) (*types.SiteUsageStatistics, error)](#GetSiteUsageStats)
    * [func groupSiteUsageStats(summary types.SiteUsageSummary, monthsOnly bool) *types.SiteUsageStatistics](#groupSiteUsageStats)
    * [func GetAggregatedCodeIntelStats(ctx context.Context, db dbutil.DB) (*types.NewCodeIntelUsageStatistics, error)](#GetAggregatedCodeIntelStats)
    * [func groupAggregatedCodeIntelStats(rawEvents []types.CodeIntelAggregatedEvent) *types.NewCodeIntelUsageStatistics](#groupAggregatedCodeIntelStats)
    * [func GetAggregatedSearchStats(ctx context.Context, db dbutil.DB) (*types.SearchUsageStatistics, error)](#GetAggregatedSearchStats)
    * [func groupAggregatedSearchStats(events []types.SearchAggregatedEvent) *types.SearchUsageStatistics](#groupAggregatedSearchStats)
    * [func populateSearchEventStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)](#populateSearchEventStatistics)
    * [func populateSearchFilterCountStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)](#populateSearchFilterCountStatistics)
    * [func newSearchEventPeriod() *types.SearchUsagePeriod](#newSearchEventPeriod)
    * [func newSearchEventStatistics() *types.SearchEventStatistics](#newSearchEventStatistics)
    * [func newSearchCountStatistics() *types.SearchCountStatistics](#newSearchCountStatistics)
    * [func newSearchModeUsageStatistics() *types.SearchModeUsageStatistics](#newSearchModeUsageStatistics)
    * [func int32Ptr(v int) *int32](#int32Ptr)
    * [func logSiteSearchOccurred() error](#logSiteSearchOccurred)
    * [func logSiteFindRefsOccurred() error](#logSiteFindRefsOccurred)
    * [func HasSearchOccurred(ctx context.Context) (bool, error)](#HasSearchOccurred)
    * [func HasFindRefsOccurred(ctx context.Context) (bool, error)](#HasFindRefsOccurred)
    * [func GetBatchChangesUsageStatistics(ctx context.Context, db dbutil.DB) (*types.BatchChangesUsageStatistics, error)](#GetBatchChangesUsageStatistics)
    * [func GetCodeInsightsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeInsightsUsageStatistics, error)](#GetCodeInsightsUsageStatistics)
    * [func GetTimeStepCounts(ctx context.Context, db dbutil.DB) ([]types.InsightTimeIntervalPing, error)](#GetTimeStepCounts)
    * [func convertStepToDays(insight SearchInsight) int](#convertStepToDays)
    * [func GetOrgInsightCounts(ctx context.Context, db dbutil.DB) ([]types.OrgVisibleInsightPing, error)](#GetOrgInsightCounts)
    * [func GetCreationViewUsage(ctx context.Context, db dbutil.DB, timeSupplier func() time.Time) ([]types.AggregatedPingStats, error)](#GetCreationViewUsage)
    * [func GetSettings(ctx context.Context, db dbutil.DB, filter SettingFilter, prefix string) ([]*api.Settings, error)](#GetSettings)
    * [func FilterSettingJson(settingJson string, prefix string) (map[string]json.RawMessage, error)](#FilterSettingJson)
    * [func GetSearchInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]SearchInsight, error)](#GetSearchInsights)
    * [func GetLangStatsInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]LangStatsInsight, error)](#GetLangStatsInsights)
    * [func GetCodeMonitoringUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeMonitoringUsageStatistics, error)](#GetCodeMonitoringUsageStatistics)
    * [func LogBackendEvent(db dbutil.DB, userID int32, eventName string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error](#LogBackendEvent)
    * [func LogEvent(ctx context.Context, db dbutil.DB, args Event) error](#LogEvent)
    * [func publishSourcegraphDotComEvent(args Event) error](#publishSourcegraphDotComEvent)
    * [func logLocalEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error](#logLocalEvent)
    * [func GetExtensionsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.ExtensionsUsageStatistics, error)](#GetExtensionsUsageStatistics)
    * [func GetGrowthStatistics(ctx context.Context, db dbutil.DB) (*types.GrowthStatistics, error)](#GetGrowthStatistics)
    * [func GetHomepagePanels(ctx context.Context, db dbutil.DB) (*types.HomepagePanels, error)](#GetHomepagePanels)
    * [func GetRetentionStatistics(ctx context.Context, db dbutil.DB) (*types.RetentionStats, error)](#GetRetentionStatistics)
    * [func GetSavedSearches(ctx context.Context, db dbutil.DB) (*types.SavedSearches, error)](#GetSavedSearches)
    * [func GetSearchOnboarding(ctx context.Context, db dbutil.DB) (*types.SearchOnboarding, error)](#GetSearchOnboarding)
    * [func GetArchive(ctx context.Context, db dbutil.DB) ([]byte, error)](#GetArchive)
    * [func GetByUserID(ctx context.Context, db dbutil.DB, userID int32) (*types.UserUsageStatistics, error)](#GetByUserID)
    * [func GetUsersActiveTodayCount(ctx context.Context, db dbutil.DB) (int, error)](#GetUsersActiveTodayCount)
    * [func ListRegisteredUsersToday(ctx context.Context, db dbutil.DB) ([]int32, error)](#ListRegisteredUsersToday)
    * [func ListRegisteredUsersThisWeek(ctx context.Context, db dbutil.DB) ([]int32, error)](#ListRegisteredUsersThisWeek)
    * [func ListRegisteredUsersThisMonth(ctx context.Context, db dbutil.DB) ([]int32, error)](#ListRegisteredUsersThisMonth)
    * [func GetSiteUsageStatistics(ctx context.Context, db dbutil.DB, opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)](#GetSiteUsageStatistics)
    * [func activeUsers(ctx context.Context, db dbutil.DB, periodType database.PeriodType, periods int) ([]*types.SiteActivityPeriod, error)](#activeUsers)
    * [func minIntOrZero(a, b int) int](#minIntOrZero)
    * [func TestGroupSiteUsageStats(t *testing.T)](#TestGroupSiteUsageStats)
    * [func TestGroupSiteUsageStatsMonthsOnly(t *testing.T)](#TestGroupSiteUsageStatsMonthsOnly)
    * [func newSearchUsagePeriod(t time.Time, structuralEvent, commitEvent *types.SearchEventStatistics) []*types.SearchUsagePeriod](#newSearchUsagePeriod)
    * [func newSearchTestEvent(eventCount, userCount int32, p50, p90, p99 float64) *types.SearchEventStatistics](#newSearchTestEvent)
    * [func TestGroupAggregateSearchStats(t *testing.T)](#TestGroupAggregateSearchStats)
    * [func TestGroupAggregatedCodeIntelStats(t *testing.T)](#TestGroupAggregatedCodeIntelStats)
    * [func TestGetBatchChangesUsageStatistics(t *testing.T)](#TestGetBatchChangesUsageStatistics)
    * [func TestCodeInsightsUsageStatistics(t *testing.T)](#TestCodeInsightsUsageStatistics)
    * [func TestWithCreationPings(t *testing.T)](#TestWithCreationPings)
    * [func TestFilterSettingJson(t *testing.T)](#TestFilterSettingJson)
    * [func TestGetSearchInsights(t *testing.T)](#TestGetSearchInsights)
    * [func TestGetLangStatsInsights(t *testing.T)](#TestGetLangStatsInsights)
    * [func TestCodeMonitoringUsageStatistics(t *testing.T)](#TestCodeMonitoringUsageStatistics)
    * [func TestExtensionsUsageStatistics(t *testing.T)](#TestExtensionsUsageStatistics)
    * [func init()](#init)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestRetentionUsageStatistics(t *testing.T)](#TestRetentionUsageStatistics)
    * [func TestGetArchive(t *testing.T)](#TestGetArchive)
    * [func TestUserUsageStatistics_None(t *testing.T)](#TestUserUsageStatistics_None)
    * [func TestUserUsageStatistics_LogPageView(t *testing.T)](#TestUserUsageStatistics_LogPageView)
    * [func TestUserUsageStatistics_LogSearchQuery(t *testing.T)](#TestUserUsageStatistics_LogSearchQuery)
    * [func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)](#TestUserUsageStatistics_LogCodeIntelAction)
    * [func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)](#TestUserUsageStatistics_LogCodeHostIntegrationUsage)
    * [func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)](#TestUserUsageStatistics_getUsersActiveToday)
    * [func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)](#TestUserUsageStatistics_DAUs_WAUs_MAUs)
    * [func setupForTest(t *testing.T) dbutil.DB](#setupForTest)
    * [func mockTimeNow(t time.Time)](#mockTimeNow)
    * [func siteActivityCompare(got, want *types.SiteUsageStatistics) error](#siteActivityCompare)
    * [func siteActivityPeriodSliceCompare(label string, got, want []*types.SiteActivityPeriod) error](#siteActivityPeriodSliceCompare)
    * [func siteActivityPeriodCompare(label string, got, want *types.SiteActivityPeriod) error](#siteActivityPeriodCompare)


## <a id="const" href="#const">Constants</a>

### <a id="keyPrefix" href="#keyPrefix">const keyPrefix</a>

```
searchKey: usagestats.keyPrefix
```

```Go
const keyPrefix = "user_activity:"
```

### <a id="fSearchOccurred" href="#fSearchOccurred">const fSearchOccurred</a>

```
searchKey: usagestats.fSearchOccurred
```

```Go
const fSearchOccurred = "searchoccurred"
```

### <a id="fFindRefsOccurred" href="#fFindRefsOccurred">const fFindRefsOccurred</a>

```
searchKey: usagestats.fFindRefsOccurred
```

```Go
const fFindRefsOccurred = "findrefsoccurred"
```

### <a id="Hour" href="#Hour">const Hour</a>

```
searchKey: usagestats.Hour
tags: [exported]
```

```Go
const Hour TimeWindow = "hour"
```

### <a id="Day" href="#Day">const Day</a>

```
searchKey: usagestats.Day
tags: [exported]
```

```Go
const Day TimeWindow = "day"
```

### <a id="Week" href="#Week">const Week</a>

```
searchKey: usagestats.Week
tags: [exported]
```

```Go
const Week TimeWindow = "week"
```

### <a id="Month" href="#Month">const Month</a>

```
searchKey: usagestats.Month
tags: [exported]
```

```Go
const Month TimeWindow = "month"
```

### <a id="Year" href="#Year">const Year</a>

```
searchKey: usagestats.Year
tags: [exported]
```

```Go
const Year TimeWindow = "year"
```

### <a id="templatePingQueryStr" href="#templatePingQueryStr">const templatePingQueryStr</a>

```
searchKey: usagestats.templatePingQueryStr
```

```Go
const templatePingQueryStr = ...
```

### <a id="Org" href="#Org">const Org</a>

```
searchKey: usagestats.Org
tags: [exported]
```

```Go
const Org SettingFilter = "org"
```

### <a id="User" href="#User">const User</a>

```
searchKey: usagestats.User
tags: [exported]
```

```Go
const User SettingFilter = "user"
```

### <a id="All" href="#All">const All</a>

```
searchKey: usagestats.All
tags: [exported]
```

```Go
const All SettingFilter = "all"
```

### <a id="defaultDays" href="#defaultDays">const defaultDays</a>

```
searchKey: usagestats.defaultDays
```

```Go
const defaultDays = 14
```

### <a id="defaultWeeks" href="#defaultWeeks">const defaultWeeks</a>

```
searchKey: usagestats.defaultWeeks
```

```Go
const defaultWeeks = 10
```

### <a id="defaultMonths" href="#defaultMonths">const defaultMonths</a>

```
searchKey: usagestats.defaultMonths
```

```Go
const defaultMonths = 3
```

### <a id="maxStorageDays" href="#maxStorageDays">const maxStorageDays</a>

```
searchKey: usagestats.maxStorageDays
```

```Go
const maxStorageDays = 93
```

### <a id="getHomepagePanelsQuery" href="#getHomepagePanelsQuery">const getHomepagePanelsQuery</a>

```
searchKey: usagestats.getHomepagePanelsQuery
```

```Go
const getHomepagePanelsQuery = ...
```

### <a id="insightSettingSimple" href="#insightSettingSimple">const insightSettingSimple</a>

```
searchKey: usagestats.insightSettingSimple
```

```Go
const insightSettingSimple = ...
```

### <a id="insightSettingMulti" href="#insightSettingMulti">const insightSettingMulti</a>

```
searchKey: usagestats.insightSettingMulti
```

```Go
const insightSettingMulti = ...
```

### <a id="insightAloneSettingStr" href="#insightAloneSettingStr">const insightAloneSettingStr</a>

```
searchKey: usagestats.insightAloneSettingStr
```

```Go
const insightAloneSettingStr = ...
```

### <a id="insightInlineSettingStr" href="#insightInlineSettingStr">const insightInlineSettingStr</a>

```
searchKey: usagestats.insightInlineSettingStr
```

```Go
const insightInlineSettingStr = ...
```

### <a id="langStatsInsightSettingStr" href="#langStatsInsightSettingStr">const langStatsInsightSettingStr</a>

```
searchKey: usagestats.langStatsInsightSettingStr
```

```Go
const langStatsInsightSettingStr = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="actionMap" href="#actionMap">var actionMap</a>

```
searchKey: usagestats.actionMap
```

```Go
var actionMap = ...
```

### <a id="sourceMap" href="#sourceMap">var sourceMap</a>

```
searchKey: usagestats.sourceMap
```

```Go
var sourceMap = ...
```

### <a id="searchLatencyExtractors" href="#searchLatencyExtractors">var searchLatencyExtractors</a>

```
searchKey: usagestats.searchLatencyExtractors
```

```Go
var searchLatencyExtractors = ...
```

utility functions that resolve a SearchEventStatistics value for a given event name for some SearchUsagePeriod. 

### <a id="searchFilterCountExtractors" href="#searchFilterCountExtractors">var searchFilterCountExtractors</a>

```
searchKey: usagestats.searchFilterCountExtractors
```

```Go
var searchFilterCountExtractors = ...
```

### <a id="pool" href="#pool">var pool</a>

```
searchKey: usagestats.pool
```

```Go
var pool = redispool.Store
```

### <a id="searchOccurred" href="#searchOccurred">var searchOccurred</a>

```
searchKey: usagestats.searchOccurred
```

```Go
var searchOccurred int32
```

### <a id="findRefsOccurred" href="#findRefsOccurred">var findRefsOccurred</a>

```
searchKey: usagestats.findRefsOccurred
```

```Go
var findRefsOccurred int32
```

### <a id="pubSubDotComEventsTopicID" href="#pubSubDotComEventsTopicID">var pubSubDotComEventsTopicID</a>

```
searchKey: usagestats.pubSubDotComEventsTopicID
```

```Go
var pubSubDotComEventsTopicID = ...
```

pubSubDotComEventsTopicID is the topic ID of the topic that forwards messages to Sourcegraph.com events' pub/sub subscribers. 

### <a id="timeNow" href="#timeNow">var timeNow</a>

```
searchKey: usagestats.timeNow
```

```Go
var timeNow = time.Now
```

### <a id="MockGetByUserID" href="#MockGetByUserID">var MockGetByUserID</a>

```
searchKey: usagestats.MockGetByUserID
tags: [exported]
```

```Go
var MockGetByUserID func(userID int32) (*types.UserUsageStatistics, error)
```

## <a id="type" href="#type">Types</a>

### <a id="PingQueryBuilder" href="#PingQueryBuilder">type PingQueryBuilder struct</a>

```
searchKey: usagestats.PingQueryBuilder
tags: [exported]
```

```Go
type PingQueryBuilder struct {
	pings      []string
	timeWindow TimeWindow
	getTime    func() time.Time
}
```

#### <a id="creationPagesPingBuilder" href="#creationPagesPingBuilder">func creationPagesPingBuilder(timeSupplier func() time.Time) PingQueryBuilder</a>

```
searchKey: usagestats.creationPagesPingBuilder
```

```Go
func creationPagesPingBuilder(timeSupplier func() time.Time) PingQueryBuilder
```

#### <a id="NewPingBuilder" href="#NewPingBuilder">func NewPingBuilder(timeWindow TimeWindow, timeSupplier func() time.Time) PingQueryBuilder</a>

```
searchKey: usagestats.NewPingBuilder
tags: [exported]
```

```Go
func NewPingBuilder(timeWindow TimeWindow, timeSupplier func() time.Time) PingQueryBuilder
```

#### <a id="PingQueryBuilder.WithAll" href="#PingQueryBuilder.WithAll">func (b *PingQueryBuilder) WithAll(pings []types.PingName) *PingQueryBuilder</a>

```
searchKey: usagestats.PingQueryBuilder.WithAll
tags: [exported]
```

```Go
func (b *PingQueryBuilder) WithAll(pings []types.PingName) *PingQueryBuilder
```

WithAll adds multiple pings by name to this builder 

#### <a id="PingQueryBuilder.With" href="#PingQueryBuilder.With">func (b *PingQueryBuilder) With(name types.PingName) *PingQueryBuilder</a>

```
searchKey: usagestats.PingQueryBuilder.With
tags: [exported]
```

```Go
func (b *PingQueryBuilder) With(name types.PingName) *PingQueryBuilder
```

With add a single ping by name to this builder 

#### <a id="PingQueryBuilder.Sample" href="#PingQueryBuilder.Sample">func (b *PingQueryBuilder) Sample(ctx context.Context, db dbutil.DB) ([]types.AggregatedPingStats, error)</a>

```
searchKey: usagestats.PingQueryBuilder.Sample
tags: [exported]
```

```Go
func (b *PingQueryBuilder) Sample(ctx context.Context, db dbutil.DB) ([]types.AggregatedPingStats, error)
```

Sample executes the derived query generated by this builder and returns a sample at the current time 

### <a id="TimeWindow" href="#TimeWindow">type TimeWindow string</a>

```
searchKey: usagestats.TimeWindow
tags: [exported]
```

```Go
type TimeWindow string
```

### <a id="TimeSeries" href="#TimeSeries">type TimeSeries struct</a>

```
searchKey: usagestats.TimeSeries
tags: [exported]
```

```Go
type TimeSeries struct {
	Name   string
	Stroke string
	Query  string
}
```

### <a id="Interval" href="#Interval">type Interval struct</a>

```
searchKey: usagestats.Interval
tags: [exported]
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

### <a id="SearchInsight" href="#SearchInsight">type SearchInsight struct</a>

```
searchKey: usagestats.SearchInsight
tags: [exported]
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

### <a id="LangStatsInsight" href="#LangStatsInsight">type LangStatsInsight struct</a>

```
searchKey: usagestats.LangStatsInsight
tags: [exported]
```

```Go
type LangStatsInsight struct {
	ID             string
	Title          string
	Repository     string
	OtherThreshold float32
}
```

### <a id="SettingFilter" href="#SettingFilter">type SettingFilter string</a>

```
searchKey: usagestats.SettingFilter
tags: [exported]
```

```Go
type SettingFilter string
```

### <a id="Event" href="#Event">type Event struct</a>

```
searchKey: usagestats.Event
tags: [exported]
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

### <a id="bigQueryEvent" href="#bigQueryEvent">type bigQueryEvent struct</a>

```
searchKey: usagestats.bigQueryEvent
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

### <a id="Repositories" href="#Repositories">type Repositories struct</a>

```
searchKey: usagestats.Repositories
tags: [exported]
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
tags: [exported]
```

```Go
func GetRepositories(ctx context.Context) (*Repositories, error)
```

### <a id="SiteUsageStatisticsOptions" href="#SiteUsageStatisticsOptions">type SiteUsageStatisticsOptions struct</a>

```
searchKey: usagestats.SiteUsageStatisticsOptions
tags: [exported]
```

```Go
type SiteUsageStatisticsOptions struct {
	DayPeriods   *int
	WeekPeriods  *int
	MonthPeriods *int
}
```

SiteUsageStatisticsOptions contains options for the number of daily, weekly, and monthly periods in which to calculate the number of unique users (i.e., how many days of Daily Active Users, or DAUs, how many weeks of Weekly Active Users, or WAUs, and how many months of Monthly Active Users, or MAUs). 

## <a id="func" href="#func">Functions</a>

### <a id="GetSiteUsageStats" href="#GetSiteUsageStats">func GetSiteUsageStats(ctx context.Context, db dbutil.DB, monthsOnly bool) (*types.SiteUsageStatistics, error)</a>

```
searchKey: usagestats.GetSiteUsageStats
tags: [exported]
```

```Go
func GetSiteUsageStats(ctx context.Context, db dbutil.DB, monthsOnly bool) (*types.SiteUsageStatistics, error)
```

### <a id="groupSiteUsageStats" href="#groupSiteUsageStats">func groupSiteUsageStats(summary types.SiteUsageSummary, monthsOnly bool) *types.SiteUsageStatistics</a>

```
searchKey: usagestats.groupSiteUsageStats
```

```Go
func groupSiteUsageStats(summary types.SiteUsageSummary, monthsOnly bool) *types.SiteUsageStatistics
```

### <a id="GetAggregatedCodeIntelStats" href="#GetAggregatedCodeIntelStats">func GetAggregatedCodeIntelStats(ctx context.Context, db dbutil.DB) (*types.NewCodeIntelUsageStatistics, error)</a>

```
searchKey: usagestats.GetAggregatedCodeIntelStats
tags: [exported]
```

```Go
func GetAggregatedCodeIntelStats(ctx context.Context, db dbutil.DB) (*types.NewCodeIntelUsageStatistics, error)
```

GetAggregatedCodeIntelStats returns aggregated statistics for code intelligence usage. 

### <a id="groupAggregatedCodeIntelStats" href="#groupAggregatedCodeIntelStats">func groupAggregatedCodeIntelStats(rawEvents []types.CodeIntelAggregatedEvent) *types.NewCodeIntelUsageStatistics</a>

```
searchKey: usagestats.groupAggregatedCodeIntelStats
```

```Go
func groupAggregatedCodeIntelStats(rawEvents []types.CodeIntelAggregatedEvent) *types.NewCodeIntelUsageStatistics
```

### <a id="GetAggregatedSearchStats" href="#GetAggregatedSearchStats">func GetAggregatedSearchStats(ctx context.Context, db dbutil.DB) (*types.SearchUsageStatistics, error)</a>

```
searchKey: usagestats.GetAggregatedSearchStats
tags: [exported]
```

```Go
func GetAggregatedSearchStats(ctx context.Context, db dbutil.DB) (*types.SearchUsageStatistics, error)
```

GetAggregatedSearchStats queries the database for search usage and returns the aggregates statistics in the format of our BigQuery schema. 

### <a id="groupAggregatedSearchStats" href="#groupAggregatedSearchStats">func groupAggregatedSearchStats(events []types.SearchAggregatedEvent) *types.SearchUsageStatistics</a>

```
searchKey: usagestats.groupAggregatedSearchStats
```

```Go
func groupAggregatedSearchStats(events []types.SearchAggregatedEvent) *types.SearchUsageStatistics
```

groupAggregatedSearchStats takes a set of input events (originating from Sourcegraph's Postgres table) and returns a SearchUsageStatistics data type that ends up being stored in BigQuery. SearchUsageStatistics corresponds to the target DB schema. 

### <a id="populateSearchEventStatistics" href="#populateSearchEventStatistics">func populateSearchEventStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)</a>

```
searchKey: usagestats.populateSearchEventStatistics
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
```

```Go
func populateSearchFilterCountStatistics(event types.SearchAggregatedEvent, statistics *types.SearchUsageStatistics)
```

### <a id="newSearchEventPeriod" href="#newSearchEventPeriod">func newSearchEventPeriod() *types.SearchUsagePeriod</a>

```
searchKey: usagestats.newSearchEventPeriod
```

```Go
func newSearchEventPeriod() *types.SearchUsagePeriod
```

### <a id="newSearchEventStatistics" href="#newSearchEventStatistics">func newSearchEventStatistics() *types.SearchEventStatistics</a>

```
searchKey: usagestats.newSearchEventStatistics
```

```Go
func newSearchEventStatistics() *types.SearchEventStatistics
```

### <a id="newSearchCountStatistics" href="#newSearchCountStatistics">func newSearchCountStatistics() *types.SearchCountStatistics</a>

```
searchKey: usagestats.newSearchCountStatistics
```

```Go
func newSearchCountStatistics() *types.SearchCountStatistics
```

### <a id="newSearchModeUsageStatistics" href="#newSearchModeUsageStatistics">func newSearchModeUsageStatistics() *types.SearchModeUsageStatistics</a>

```
searchKey: usagestats.newSearchModeUsageStatistics
```

```Go
func newSearchModeUsageStatistics() *types.SearchModeUsageStatistics
```

### <a id="int32Ptr" href="#int32Ptr">func int32Ptr(v int) *int32</a>

```
searchKey: usagestats.int32Ptr
```

```Go
func int32Ptr(v int) *int32
```

### <a id="logSiteSearchOccurred" href="#logSiteSearchOccurred">func logSiteSearchOccurred() error</a>

```
searchKey: usagestats.logSiteSearchOccurred
```

```Go
func logSiteSearchOccurred() error
```

logSiteSearchOccurred records that a search has occurred on the Sourcegraph instance. 

### <a id="logSiteFindRefsOccurred" href="#logSiteFindRefsOccurred">func logSiteFindRefsOccurred() error</a>

```
searchKey: usagestats.logSiteFindRefsOccurred
```

```Go
func logSiteFindRefsOccurred() error
```

logSiteFindRefsOccurred records that a search has occurred on the Sourcegraph instance. 

### <a id="HasSearchOccurred" href="#HasSearchOccurred">func HasSearchOccurred(ctx context.Context) (bool, error)</a>

```
searchKey: usagestats.HasSearchOccurred
tags: [exported]
```

```Go
func HasSearchOccurred(ctx context.Context) (bool, error)
```

HasSearchOccurred indicates whether a search has ever occurred on this instance. 

### <a id="HasFindRefsOccurred" href="#HasFindRefsOccurred">func HasFindRefsOccurred(ctx context.Context) (bool, error)</a>

```
searchKey: usagestats.HasFindRefsOccurred
tags: [exported]
```

```Go
func HasFindRefsOccurred(ctx context.Context) (bool, error)
```

HasFindRefsOccurred indicates whether a find-refs has ever occurred on this instance. 

### <a id="GetBatchChangesUsageStatistics" href="#GetBatchChangesUsageStatistics">func GetBatchChangesUsageStatistics(ctx context.Context, db dbutil.DB) (*types.BatchChangesUsageStatistics, error)</a>

```
searchKey: usagestats.GetBatchChangesUsageStatistics
tags: [exported]
```

```Go
func GetBatchChangesUsageStatistics(ctx context.Context, db dbutil.DB) (*types.BatchChangesUsageStatistics, error)
```

GetBatchChangesUsageStatistics returns the current site's batch changes usage. 

### <a id="GetCodeInsightsUsageStatistics" href="#GetCodeInsightsUsageStatistics">func GetCodeInsightsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeInsightsUsageStatistics, error)</a>

```
searchKey: usagestats.GetCodeInsightsUsageStatistics
tags: [exported]
```

```Go
func GetCodeInsightsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeInsightsUsageStatistics, error)
```

### <a id="GetTimeStepCounts" href="#GetTimeStepCounts">func GetTimeStepCounts(ctx context.Context, db dbutil.DB) ([]types.InsightTimeIntervalPing, error)</a>

```
searchKey: usagestats.GetTimeStepCounts
tags: [exported]
```

```Go
func GetTimeStepCounts(ctx context.Context, db dbutil.DB) ([]types.InsightTimeIntervalPing, error)
```

### <a id="convertStepToDays" href="#convertStepToDays">func convertStepToDays(insight SearchInsight) int</a>

```
searchKey: usagestats.convertStepToDays
```

```Go
func convertStepToDays(insight SearchInsight) int
```

convertStepToDays converts the step interval defined in the insight settings to days, rounded down 

### <a id="GetOrgInsightCounts" href="#GetOrgInsightCounts">func GetOrgInsightCounts(ctx context.Context, db dbutil.DB) ([]types.OrgVisibleInsightPing, error)</a>

```
searchKey: usagestats.GetOrgInsightCounts
tags: [exported]
```

```Go
func GetOrgInsightCounts(ctx context.Context, db dbutil.DB) ([]types.OrgVisibleInsightPing, error)
```

### <a id="GetCreationViewUsage" href="#GetCreationViewUsage">func GetCreationViewUsage(ctx context.Context, db dbutil.DB, timeSupplier func() time.Time) ([]types.AggregatedPingStats, error)</a>

```
searchKey: usagestats.GetCreationViewUsage
tags: [exported]
```

```Go
func GetCreationViewUsage(ctx context.Context, db dbutil.DB, timeSupplier func() time.Time) ([]types.AggregatedPingStats, error)
```

### <a id="GetSettings" href="#GetSettings">func GetSettings(ctx context.Context, db dbutil.DB, filter SettingFilter, prefix string) ([]*api.Settings, error)</a>

```
searchKey: usagestats.GetSettings
tags: [exported]
```

```Go
func GetSettings(ctx context.Context, db dbutil.DB, filter SettingFilter, prefix string) ([]*api.Settings, error)
```

GetSettings returns all settings on the Sourcegraph installation that can be filtered by a type. This is useful for generating aggregates for code insights which are currently stored in the settings. 🚨 SECURITY: This method bypasses any user permissions to fetch a list of all settings on the Sourcegraph installation. It is used for generating aggregated analytics that require an accurate view across all settings, such as for code insights🚨 

### <a id="FilterSettingJson" href="#FilterSettingJson">func FilterSettingJson(settingJson string, prefix string) (map[string]json.RawMessage, error)</a>

```
searchKey: usagestats.FilterSettingJson
tags: [exported]
```

```Go
func FilterSettingJson(settingJson string, prefix string) (map[string]json.RawMessage, error)
```

FilterSettingJson will return a json map that only contains keys that match a prefix string, mapped to the keyed contents. 

### <a id="GetSearchInsights" href="#GetSearchInsights">func GetSearchInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]SearchInsight, error)</a>

```
searchKey: usagestats.GetSearchInsights
tags: [exported]
```

```Go
func GetSearchInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]SearchInsight, error)
```

### <a id="GetLangStatsInsights" href="#GetLangStatsInsights">func GetLangStatsInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]LangStatsInsight, error)</a>

```
searchKey: usagestats.GetLangStatsInsights
tags: [exported]
```

```Go
func GetLangStatsInsights(ctx context.Context, db dbutil.DB, filter SettingFilter) ([]LangStatsInsight, error)
```

### <a id="GetCodeMonitoringUsageStatistics" href="#GetCodeMonitoringUsageStatistics">func GetCodeMonitoringUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeMonitoringUsageStatistics, error)</a>

```
searchKey: usagestats.GetCodeMonitoringUsageStatistics
tags: [exported]
```

```Go
func GetCodeMonitoringUsageStatistics(ctx context.Context, db dbutil.DB) (*types.CodeMonitoringUsageStatistics, error)
```

### <a id="LogBackendEvent" href="#LogBackendEvent">func LogBackendEvent(db dbutil.DB, userID int32, eventName string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error</a>

```
searchKey: usagestats.LogBackendEvent
tags: [exported]
```

```Go
func LogBackendEvent(db dbutil.DB, userID int32, eventName string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error
```

LogBackendEvent is a convenience function for logging backend events. 

### <a id="LogEvent" href="#LogEvent">func LogEvent(ctx context.Context, db dbutil.DB, args Event) error</a>

```
searchKey: usagestats.LogEvent
tags: [exported]
```

```Go
func LogEvent(ctx context.Context, db dbutil.DB, args Event) error
```

LogEvent logs an event. 

### <a id="publishSourcegraphDotComEvent" href="#publishSourcegraphDotComEvent">func publishSourcegraphDotComEvent(args Event) error</a>

```
searchKey: usagestats.publishSourcegraphDotComEvent
```

```Go
func publishSourcegraphDotComEvent(args Event) error
```

publishSourcegraphDotComEvent publishes Sourcegraph.com events to BigQuery. 

### <a id="logLocalEvent" href="#logLocalEvent">func logLocalEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error</a>

```
searchKey: usagestats.logLocalEvent
```

```Go
func logLocalEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet, cohortID *string) error
```

logLocalEvent logs users events. 

### <a id="GetExtensionsUsageStatistics" href="#GetExtensionsUsageStatistics">func GetExtensionsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.ExtensionsUsageStatistics, error)</a>

```
searchKey: usagestats.GetExtensionsUsageStatistics
tags: [exported]
```

```Go
func GetExtensionsUsageStatistics(ctx context.Context, db dbutil.DB) (*types.ExtensionsUsageStatistics, error)
```

### <a id="GetGrowthStatistics" href="#GetGrowthStatistics">func GetGrowthStatistics(ctx context.Context, db dbutil.DB) (*types.GrowthStatistics, error)</a>

```
searchKey: usagestats.GetGrowthStatistics
tags: [exported]
```

```Go
func GetGrowthStatistics(ctx context.Context, db dbutil.DB) (*types.GrowthStatistics, error)
```

### <a id="GetHomepagePanels" href="#GetHomepagePanels">func GetHomepagePanels(ctx context.Context, db dbutil.DB) (*types.HomepagePanels, error)</a>

```
searchKey: usagestats.GetHomepagePanels
tags: [exported]
```

```Go
func GetHomepagePanels(ctx context.Context, db dbutil.DB) (*types.HomepagePanels, error)
```

### <a id="GetRetentionStatistics" href="#GetRetentionStatistics">func GetRetentionStatistics(ctx context.Context, db dbutil.DB) (*types.RetentionStats, error)</a>

```
searchKey: usagestats.GetRetentionStatistics
tags: [exported]
```

```Go
func GetRetentionStatistics(ctx context.Context, db dbutil.DB) (*types.RetentionStats, error)
```

### <a id="GetSavedSearches" href="#GetSavedSearches">func GetSavedSearches(ctx context.Context, db dbutil.DB) (*types.SavedSearches, error)</a>

```
searchKey: usagestats.GetSavedSearches
tags: [exported]
```

```Go
func GetSavedSearches(ctx context.Context, db dbutil.DB) (*types.SavedSearches, error)
```

### <a id="GetSearchOnboarding" href="#GetSearchOnboarding">func GetSearchOnboarding(ctx context.Context, db dbutil.DB) (*types.SearchOnboarding, error)</a>

```
searchKey: usagestats.GetSearchOnboarding
tags: [exported]
```

```Go
func GetSearchOnboarding(ctx context.Context, db dbutil.DB) (*types.SearchOnboarding, error)
```

### <a id="GetArchive" href="#GetArchive">func GetArchive(ctx context.Context, db dbutil.DB) ([]byte, error)</a>

```
searchKey: usagestats.GetArchive
tags: [exported]
```

```Go
func GetArchive(ctx context.Context, db dbutil.DB) ([]byte, error)
```

GetArchive generates and returns a usage statistics ZIP archive containing the CSV files defined in RFC 145, or an error in case of failure. 

### <a id="GetByUserID" href="#GetByUserID">func GetByUserID(ctx context.Context, db dbutil.DB, userID int32) (*types.UserUsageStatistics, error)</a>

```
searchKey: usagestats.GetByUserID
tags: [exported]
```

```Go
func GetByUserID(ctx context.Context, db dbutil.DB, userID int32) (*types.UserUsageStatistics, error)
```

GetByUserID returns a single user's UserUsageStatistics. 

### <a id="GetUsersActiveTodayCount" href="#GetUsersActiveTodayCount">func GetUsersActiveTodayCount(ctx context.Context, db dbutil.DB) (int, error)</a>

```
searchKey: usagestats.GetUsersActiveTodayCount
tags: [exported]
```

```Go
func GetUsersActiveTodayCount(ctx context.Context, db dbutil.DB) (int, error)
```

GetUsersActiveTodayCount returns a count of users that have been active today. 

### <a id="ListRegisteredUsersToday" href="#ListRegisteredUsersToday">func ListRegisteredUsersToday(ctx context.Context, db dbutil.DB) ([]int32, error)</a>

```
searchKey: usagestats.ListRegisteredUsersToday
tags: [exported]
```

```Go
func ListRegisteredUsersToday(ctx context.Context, db dbutil.DB) ([]int32, error)
```

ListRegisteredUsersToday returns a list of the registered users that were active today. 

### <a id="ListRegisteredUsersThisWeek" href="#ListRegisteredUsersThisWeek">func ListRegisteredUsersThisWeek(ctx context.Context, db dbutil.DB) ([]int32, error)</a>

```
searchKey: usagestats.ListRegisteredUsersThisWeek
tags: [exported]
```

```Go
func ListRegisteredUsersThisWeek(ctx context.Context, db dbutil.DB) ([]int32, error)
```

ListRegisteredUsersThisWeek returns a list of the registered users that were active this week. 

### <a id="ListRegisteredUsersThisMonth" href="#ListRegisteredUsersThisMonth">func ListRegisteredUsersThisMonth(ctx context.Context, db dbutil.DB) ([]int32, error)</a>

```
searchKey: usagestats.ListRegisteredUsersThisMonth
tags: [exported]
```

```Go
func ListRegisteredUsersThisMonth(ctx context.Context, db dbutil.DB) ([]int32, error)
```

ListRegisteredUsersThisMonth returns a list of the registered users that were active this month. 

### <a id="GetSiteUsageStatistics" href="#GetSiteUsageStatistics">func GetSiteUsageStatistics(ctx context.Context, db dbutil.DB, opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)</a>

```
searchKey: usagestats.GetSiteUsageStatistics
tags: [exported]
```

```Go
func GetSiteUsageStatistics(ctx context.Context, db dbutil.DB, opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)
```

GetSiteUsageStatistics returns the current site's SiteActivity. 

### <a id="activeUsers" href="#activeUsers">func activeUsers(ctx context.Context, db dbutil.DB, periodType database.PeriodType, periods int) ([]*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestats.activeUsers
```

```Go
func activeUsers(ctx context.Context, db dbutil.DB, periodType database.PeriodType, periods int) ([]*types.SiteActivityPeriod, error)
```

activeUsers returns counts of active users in the given number of days, weeks, or months, as selected (including the current, partially completed period). 

### <a id="minIntOrZero" href="#minIntOrZero">func minIntOrZero(a, b int) int</a>

```
searchKey: usagestats.minIntOrZero
```

```Go
func minIntOrZero(a, b int) int
```

### <a id="TestGroupSiteUsageStats" href="#TestGroupSiteUsageStats">func TestGroupSiteUsageStats(t *testing.T)</a>

```
searchKey: usagestats.TestGroupSiteUsageStats
```

```Go
func TestGroupSiteUsageStats(t *testing.T)
```

### <a id="TestGroupSiteUsageStatsMonthsOnly" href="#TestGroupSiteUsageStatsMonthsOnly">func TestGroupSiteUsageStatsMonthsOnly(t *testing.T)</a>

```
searchKey: usagestats.TestGroupSiteUsageStatsMonthsOnly
```

```Go
func TestGroupSiteUsageStatsMonthsOnly(t *testing.T)
```

### <a id="newSearchUsagePeriod" href="#newSearchUsagePeriod">func newSearchUsagePeriod(t time.Time, structuralEvent, commitEvent *types.SearchEventStatistics) []*types.SearchUsagePeriod</a>

```
searchKey: usagestats.newSearchUsagePeriod
```

```Go
func newSearchUsagePeriod(t time.Time, structuralEvent, commitEvent *types.SearchEventStatistics) []*types.SearchUsagePeriod
```

### <a id="newSearchTestEvent" href="#newSearchTestEvent">func newSearchTestEvent(eventCount, userCount int32, p50, p90, p99 float64) *types.SearchEventStatistics</a>

```
searchKey: usagestats.newSearchTestEvent
```

```Go
func newSearchTestEvent(eventCount, userCount int32, p50, p90, p99 float64) *types.SearchEventStatistics
```

### <a id="TestGroupAggregateSearchStats" href="#TestGroupAggregateSearchStats">func TestGroupAggregateSearchStats(t *testing.T)</a>

```
searchKey: usagestats.TestGroupAggregateSearchStats
```

```Go
func TestGroupAggregateSearchStats(t *testing.T)
```

### <a id="TestGroupAggregatedCodeIntelStats" href="#TestGroupAggregatedCodeIntelStats">func TestGroupAggregatedCodeIntelStats(t *testing.T)</a>

```
searchKey: usagestats.TestGroupAggregatedCodeIntelStats
```

```Go
func TestGroupAggregatedCodeIntelStats(t *testing.T)
```

### <a id="TestGetBatchChangesUsageStatistics" href="#TestGetBatchChangesUsageStatistics">func TestGetBatchChangesUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestGetBatchChangesUsageStatistics
```

```Go
func TestGetBatchChangesUsageStatistics(t *testing.T)
```

### <a id="TestCodeInsightsUsageStatistics" href="#TestCodeInsightsUsageStatistics">func TestCodeInsightsUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestCodeInsightsUsageStatistics
```

```Go
func TestCodeInsightsUsageStatistics(t *testing.T)
```

### <a id="TestWithCreationPings" href="#TestWithCreationPings">func TestWithCreationPings(t *testing.T)</a>

```
searchKey: usagestats.TestWithCreationPings
```

```Go
func TestWithCreationPings(t *testing.T)
```

### <a id="TestFilterSettingJson" href="#TestFilterSettingJson">func TestFilterSettingJson(t *testing.T)</a>

```
searchKey: usagestats.TestFilterSettingJson
```

```Go
func TestFilterSettingJson(t *testing.T)
```

### <a id="TestGetSearchInsights" href="#TestGetSearchInsights">func TestGetSearchInsights(t *testing.T)</a>

```
searchKey: usagestats.TestGetSearchInsights
```

```Go
func TestGetSearchInsights(t *testing.T)
```

### <a id="TestGetLangStatsInsights" href="#TestGetLangStatsInsights">func TestGetLangStatsInsights(t *testing.T)</a>

```
searchKey: usagestats.TestGetLangStatsInsights
```

```Go
func TestGetLangStatsInsights(t *testing.T)
```

### <a id="TestCodeMonitoringUsageStatistics" href="#TestCodeMonitoringUsageStatistics">func TestCodeMonitoringUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestCodeMonitoringUsageStatistics
```

```Go
func TestCodeMonitoringUsageStatistics(t *testing.T)
```

### <a id="TestExtensionsUsageStatistics" href="#TestExtensionsUsageStatistics">func TestExtensionsUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestExtensionsUsageStatistics
```

```Go
func TestExtensionsUsageStatistics(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: usagestats.init
```

```Go
func init()
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: usagestats.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestRetentionUsageStatistics" href="#TestRetentionUsageStatistics">func TestRetentionUsageStatistics(t *testing.T)</a>

```
searchKey: usagestats.TestRetentionUsageStatistics
```

```Go
func TestRetentionUsageStatistics(t *testing.T)
```

### <a id="TestGetArchive" href="#TestGetArchive">func TestGetArchive(t *testing.T)</a>

```
searchKey: usagestats.TestGetArchive
```

```Go
func TestGetArchive(t *testing.T)
```

### <a id="TestUserUsageStatistics_None" href="#TestUserUsageStatistics_None">func TestUserUsageStatistics_None(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_None
```

```Go
func TestUserUsageStatistics_None(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogPageView" href="#TestUserUsageStatistics_LogPageView">func TestUserUsageStatistics_LogPageView(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_LogPageView
```

```Go
func TestUserUsageStatistics_LogPageView(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogSearchQuery" href="#TestUserUsageStatistics_LogSearchQuery">func TestUserUsageStatistics_LogSearchQuery(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_LogSearchQuery
```

```Go
func TestUserUsageStatistics_LogSearchQuery(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogCodeIntelAction" href="#TestUserUsageStatistics_LogCodeIntelAction">func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_LogCodeIntelAction
```

```Go
func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogCodeHostIntegrationUsage" href="#TestUserUsageStatistics_LogCodeHostIntegrationUsage">func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_LogCodeHostIntegrationUsage
```

```Go
func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)
```

### <a id="TestUserUsageStatistics_getUsersActiveToday" href="#TestUserUsageStatistics_getUsersActiveToday">func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_getUsersActiveToday
```

```Go
func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)
```

### <a id="TestUserUsageStatistics_DAUs_WAUs_MAUs" href="#TestUserUsageStatistics_DAUs_WAUs_MAUs">func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)</a>

```
searchKey: usagestats.TestUserUsageStatistics_DAUs_WAUs_MAUs
```

```Go
func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)
```

### <a id="setupForTest" href="#setupForTest">func setupForTest(t *testing.T) dbutil.DB</a>

```
searchKey: usagestats.setupForTest
```

```Go
func setupForTest(t *testing.T) dbutil.DB
```

### <a id="mockTimeNow" href="#mockTimeNow">func mockTimeNow(t time.Time)</a>

```
searchKey: usagestats.mockTimeNow
```

```Go
func mockTimeNow(t time.Time)
```

### <a id="siteActivityCompare" href="#siteActivityCompare">func siteActivityCompare(got, want *types.SiteUsageStatistics) error</a>

```
searchKey: usagestats.siteActivityCompare
```

```Go
func siteActivityCompare(got, want *types.SiteUsageStatistics) error
```

### <a id="siteActivityPeriodSliceCompare" href="#siteActivityPeriodSliceCompare">func siteActivityPeriodSliceCompare(label string, got, want []*types.SiteActivityPeriod) error</a>

```
searchKey: usagestats.siteActivityPeriodSliceCompare
```

```Go
func siteActivityPeriodSliceCompare(label string, got, want []*types.SiteActivityPeriod) error
```

### <a id="siteActivityPeriodCompare" href="#siteActivityPeriodCompare">func siteActivityPeriodCompare(label string, got, want *types.SiteActivityPeriod) error</a>

```
searchKey: usagestats.siteActivityPeriodCompare
```

```Go
func siteActivityPeriodCompare(label string, got, want *types.SiteActivityPeriod) error
```

