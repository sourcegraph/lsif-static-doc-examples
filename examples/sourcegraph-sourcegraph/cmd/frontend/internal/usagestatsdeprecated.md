# Package usagestatsdeprecated

Package usagestatsdeprecated is deprecated in favor of package usagestats. 

Package usagestatsdeprecated provides an interface to update and access information about individual and aggregate Sourcegraph users' activity levels. 

Note that this package should not be used on sourcegraph.com, only on self-hosted deployments. 

nolint 

## Index

* [Constants](#const)
    * [const fSearchOccurred](#fSearchOccurred)
    * [const fFindRefsOccurred](#fFindRefsOccurred)
    * [const fPageViews](#fPageViews)
    * [const fLastActive](#fLastActive)
    * [const fSearchQueries](#fSearchQueries)
    * [const fCodeIntelActions](#fCodeIntelActions)
    * [const fFindRefsActions](#fFindRefsActions)
    * [const fLastActiveCodeHostIntegration](#fLastActiveCodeHostIntegration)
    * [const fUsersActive](#fUsersActive)
    * [const defaultDays](#defaultDays)
    * [const defaultWeeks](#defaultWeeks)
    * [const defaultMonths](#defaultMonths)
    * [const maxStorageDays](#maxStorageDays)
* [Variables](#var)
    * [var searchOccurred](#searchOccurred)
    * [var findRefsOccurred](#findRefsOccurred)
    * [var eventHandlers](#eventHandlers)
    * [var logSiteSearchOccurred](#logSiteSearchOccurred)
    * [var logSiteFindRefsOccurred](#logSiteFindRefsOccurred)
    * [var logSearchQuery](#logSearchQuery)
    * [var logPageView](#logPageView)
    * [var logCodeIntelAction](#logCodeIntelAction)
    * [var logCodeIntelRefsAction](#logCodeIntelRefsAction)
    * [var logCodeHostIntegrationUsage](#logCodeHostIntegrationUsage)
    * [var logStageEvent](#logStageEvent)
    * [var keyPrefix](#keyPrefix)
    * [var gcOnce](#gcOnce)
    * [var pool](#pool)
    * [var timeNow](#timeNow)
    * [var MockGetByUserID](#MockGetByUserID)
* [Types](#type)
    * [type eventHandler func(userID int32, event string, isAuthenticated bool) error](#eventHandler)
    * [type SiteUsageStatisticsOptions struct](#SiteUsageStatisticsOptions)
    * [type UsageDuration struct](#UsageDuration)
    * [type ActiveUsers struct](#ActiveUsers)
        * [func uniques(dayStart time.Time, period *UsageDuration) (*ActiveUsers, error)](#uniques)
* [Functions](#func)
    * [func LogActivity(isAuthenticated bool, userID int32, userCookieID, event string) error](#LogActivity)
    * [func LogEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet) error](#LogEvent)
    * [func GetByUserID(userID int32) (*types.UserUsageStatistics, error)](#GetByUserID)
    * [func GetSiteUsageStatistics(opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)](#GetSiteUsageStatistics)
    * [func GetUsersActiveTodayCount(ctx context.Context) (int, error)](#GetUsersActiveTodayCount)
    * [func uniquesCount(dayStart time.Time, period *UsageDuration) (*types.SiteActivityPeriod, error)](#uniquesCount)
    * [func daus(dayPeriods int) ([]*types.SiteActivityPeriod, error)](#daus)
    * [func waus(weekPeriods int) ([]*types.SiteActivityPeriod, error)](#waus)
    * [func maus(monthPeriods int) ([]*types.SiteActivityPeriod, error)](#maus)
    * [func gc()](#gc)
    * [func keyFromDate(activity string, date time.Time) string](#keyFromDate)
    * [func usersActiveKeyFromDate(date time.Time) string](#usersActiveKeyFromDate)
    * [func usersActiveKeyFromDaysAgo(daysAgo int) string](#usersActiveKeyFromDaysAgo)
    * [func startOfWeek(weeksAgo int) time.Time](#startOfWeek)
    * [func startOfMonth(monthsAgo int) time.Time](#startOfMonth)
    * [func keys(m map[string]bool) []string](#keys)
    * [func minIntOrZero(a, b int) int](#minIntOrZero)
    * [func incrementUserCounter(userID int32, isAuthenticated bool, counterKey string) error](#incrementUserCounter)
    * [func keyFromStage(stage string) string](#keyFromStage)
    * [func init()](#init.usage_stats_test.go)
    * [func TestUserUsageStatistics_None(t *testing.T)](#TestUserUsageStatistics_None)
    * [func TestUserUsageStatistics_LogPageView(t *testing.T)](#TestUserUsageStatistics_LogPageView)
    * [func TestUserUsageStatistics_LogSearchQuery(t *testing.T)](#TestUserUsageStatistics_LogSearchQuery)
    * [func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)](#TestUserUsageStatistics_LogCodeIntelAction)
    * [func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)](#TestUserUsageStatistics_LogCodeHostIntegrationUsage)
    * [func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)](#TestUserUsageStatistics_getUsersActiveToday)
    * [func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)](#TestUserUsageStatistics_DAUs_WAUs_MAUs)
    * [func setupForTest(t *testing.T)](#setupForTest)
    * [func mockTimeNow(t time.Time)](#mockTimeNow)
    * [func siteActivityCompare(a, b *types.SiteUsageStatistics) error](#siteActivityCompare)
    * [func siteActivityPeriodSliceCompare(label string, a, b []*types.SiteActivityPeriod) error](#siteActivityPeriodSliceCompare)
    * [func siteActivityPeriodCompare(label string, a, b *types.SiteActivityPeriod) error](#siteActivityPeriodCompare)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="fSearchOccurred" href="#fSearchOccurred">const fSearchOccurred</a>

```
searchKey: usagestatsdeprecated.fSearchOccurred
tags: [private]
```

```Go
const fSearchOccurred = "searchoccurred"
```

### <a id="fFindRefsOccurred" href="#fFindRefsOccurred">const fFindRefsOccurred</a>

```
searchKey: usagestatsdeprecated.fFindRefsOccurred
tags: [private]
```

```Go
const fFindRefsOccurred = "findrefsoccurred"
```

### <a id="fPageViews" href="#fPageViews">const fPageViews</a>

```
searchKey: usagestatsdeprecated.fPageViews
tags: [private]
```

```Go
const fPageViews = "pageviews"
```

### <a id="fLastActive" href="#fLastActive">const fLastActive</a>

```
searchKey: usagestatsdeprecated.fLastActive
tags: [private]
```

```Go
const fLastActive = "lastactive"
```

### <a id="fSearchQueries" href="#fSearchQueries">const fSearchQueries</a>

```
searchKey: usagestatsdeprecated.fSearchQueries
tags: [private]
```

```Go
const fSearchQueries = "searchqueries"
```

### <a id="fCodeIntelActions" href="#fCodeIntelActions">const fCodeIntelActions</a>

```
searchKey: usagestatsdeprecated.fCodeIntelActions
tags: [private]
```

```Go
const fCodeIntelActions = "codeintelactions"
```

### <a id="fFindRefsActions" href="#fFindRefsActions">const fFindRefsActions</a>

```
searchKey: usagestatsdeprecated.fFindRefsActions
tags: [private]
```

```Go
const fFindRefsActions = "codeintelactions:findrefs"
```

### <a id="fLastActiveCodeHostIntegration" href="#fLastActiveCodeHostIntegration">const fLastActiveCodeHostIntegration</a>

```
searchKey: usagestatsdeprecated.fLastActiveCodeHostIntegration
tags: [private]
```

```Go
const fLastActiveCodeHostIntegration = "lastactivecodehostintegration"
```

### <a id="fUsersActive" href="#fUsersActive">const fUsersActive</a>

```
searchKey: usagestatsdeprecated.fUsersActive
tags: [private]
```

```Go
const fUsersActive = "usersactive"
```

### <a id="defaultDays" href="#defaultDays">const defaultDays</a>

```
searchKey: usagestatsdeprecated.defaultDays
tags: [private]
```

```Go
const defaultDays = 14
```

### <a id="defaultWeeks" href="#defaultWeeks">const defaultWeeks</a>

```
searchKey: usagestatsdeprecated.defaultWeeks
tags: [private]
```

```Go
const defaultWeeks = 10
```

### <a id="defaultMonths" href="#defaultMonths">const defaultMonths</a>

```
searchKey: usagestatsdeprecated.defaultMonths
tags: [private]
```

```Go
const defaultMonths = 3
```

### <a id="maxStorageDays" href="#maxStorageDays">const maxStorageDays</a>

```
searchKey: usagestatsdeprecated.maxStorageDays
tags: [private]
```

```Go
const maxStorageDays = 93
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="searchOccurred" href="#searchOccurred">var searchOccurred</a>

```
searchKey: usagestatsdeprecated.searchOccurred
tags: [private]
```

```Go
var searchOccurred = false
```

### <a id="findRefsOccurred" href="#findRefsOccurred">var findRefsOccurred</a>

```
searchKey: usagestatsdeprecated.findRefsOccurred
tags: [private]
```

```Go
var findRefsOccurred = false
```

### <a id="eventHandlers" href="#eventHandlers">var eventHandlers</a>

```
searchKey: usagestatsdeprecated.eventHandlers
tags: [private]
```

```Go
var eventHandlers = ...
```

### <a id="logSiteSearchOccurred" href="#logSiteSearchOccurred">var logSiteSearchOccurred</a>

```
searchKey: usagestatsdeprecated.logSiteSearchOccurred
tags: [private]
```

```Go
var logSiteSearchOccurred = ...
```

logSiteSearchOccurred records that a search has occurred on the Sourcegraph instance. 

### <a id="logSiteFindRefsOccurred" href="#logSiteFindRefsOccurred">var logSiteFindRefsOccurred</a>

```
searchKey: usagestatsdeprecated.logSiteFindRefsOccurred
tags: [private]
```

```Go
var logSiteFindRefsOccurred = ...
```

logSiteFindRefsOccurred records that a search has occurred on the Sourcegraph instance. 

### <a id="logSearchQuery" href="#logSearchQuery">var logSearchQuery</a>

```
searchKey: usagestatsdeprecated.logSearchQuery
tags: [private]
```

```Go
var logSearchQuery = ...
```

logSearchQuery increments a user's search query count. 

### <a id="logPageView" href="#logPageView">var logPageView</a>

```
searchKey: usagestatsdeprecated.logPageView
tags: [private]
```

```Go
var logPageView = ...
```

logPageView increments a user's pageview count. 

### <a id="logCodeIntelAction" href="#logCodeIntelAction">var logCodeIntelAction</a>

```
searchKey: usagestatsdeprecated.logCodeIntelAction
tags: [private]
```

```Go
var logCodeIntelAction = ...
```

logCodeIntelAction increments a user's code intelligence usage count. 

### <a id="logCodeIntelRefsAction" href="#logCodeIntelRefsAction">var logCodeIntelRefsAction</a>

```
searchKey: usagestatsdeprecated.logCodeIntelRefsAction
tags: [private]
```

```Go
var logCodeIntelRefsAction = ...
```

logCodeIntelRefsAction increments a user's code intelligence usage count. and their find refs action count. 

### <a id="logCodeHostIntegrationUsage" href="#logCodeHostIntegrationUsage">var logCodeHostIntegrationUsage</a>

```
searchKey: usagestatsdeprecated.logCodeHostIntegrationUsage
tags: [private]
```

```Go
var logCodeHostIntegrationUsage = ...
```

logCodeHostIntegrationUsage logs the last time a user was active on a code host integration. 

### <a id="logStageEvent" href="#logStageEvent">var logStageEvent</a>

```
searchKey: usagestatsdeprecated.logStageEvent
tags: [private]
```

```Go
var logStageEvent = ...
```

logStageEvent logs the last time a user did an action from a specific stage. 

### <a id="keyPrefix" href="#keyPrefix">var keyPrefix</a>

```
searchKey: usagestatsdeprecated.keyPrefix
tags: [private]
```

```Go
var keyPrefix = "user_activity:"
```

### <a id="gcOnce" href="#gcOnce">var gcOnce</a>

```
searchKey: usagestatsdeprecated.gcOnce
tags: [private]
```

```Go
var gcOnce sync.Once // ensures we only have 1 redis gc goroutine

```

### <a id="pool" href="#pool">var pool</a>

```
searchKey: usagestatsdeprecated.pool
tags: [private]
```

```Go
var pool = redispool.Store
```

### <a id="timeNow" href="#timeNow">var timeNow</a>

```
searchKey: usagestatsdeprecated.timeNow
tags: [private]
```

```Go
var timeNow = time.Now
```

### <a id="MockGetByUserID" href="#MockGetByUserID">var MockGetByUserID</a>

```
searchKey: usagestatsdeprecated.MockGetByUserID
```

```Go
var MockGetByUserID func(userID int32) (*types.UserUsageStatistics, error)
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="eventHandler" href="#eventHandler">type eventHandler func(userID int32, event string, isAuthenticated bool) error</a>

```
searchKey: usagestatsdeprecated.eventHandler
tags: [private]
```

```Go
type eventHandler = func(userID int32, event string, isAuthenticated bool) error
```

Custom event handlers 

### <a id="SiteUsageStatisticsOptions" href="#SiteUsageStatisticsOptions">type SiteUsageStatisticsOptions struct</a>

```
searchKey: usagestatsdeprecated.SiteUsageStatisticsOptions
```

```Go
type SiteUsageStatisticsOptions struct {
	DayPeriods   *int
	WeekPeriods  *int
	MonthPeriods *int
}
```

SiteUsageStatisticsOptions contains options for the number of daily, weekly, and monthly periods in which to calculate the number of unique users (i.e., how many days of Daily Active Users, or DAUs, how many weeks of Weekly Active Users, or WAUs, and how many months of Monthly Active Users, or MAUs). 

### <a id="UsageDuration" href="#UsageDuration">type UsageDuration struct</a>

```
searchKey: usagestatsdeprecated.UsageDuration
```

```Go
type UsageDuration struct {
	Days   int
	Months int
}
```

UsageDuration in aggregate represents a duration of time over which to calculate a set of unique users. 

### <a id="ActiveUsers" href="#ActiveUsers">type ActiveUsers struct</a>

```
searchKey: usagestatsdeprecated.ActiveUsers
```

```Go
type ActiveUsers struct {
	All              []string
	Registered       []string
	Anonymous        []string
	UsedIntegrations []string
}
```

ActiveUsers contains sets of unique user IDs. 

#### <a id="uniques" href="#uniques">func uniques(dayStart time.Time, period *UsageDuration) (*ActiveUsers, error)</a>

```
searchKey: usagestatsdeprecated.uniques
tags: [private]
```

```Go
func uniques(dayStart time.Time, period *UsageDuration) (*ActiveUsers, error)
```

uniques calculates the list of unique users starting at 00:00:00 on a given UTC date over a period of time. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="LogActivity" href="#LogActivity">func LogActivity(isAuthenticated bool, userID int32, userCookieID, event string) error</a>

```
searchKey: usagestatsdeprecated.LogActivity
```

```Go
func LogActivity(isAuthenticated bool, userID int32, userCookieID, event string) error
```

LogActivity logs any user activity (page view, integration usage, etc) to their "last active" time, and adds their unique ID to the set of active users 

### <a id="LogEvent" href="#LogEvent">func LogEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet) error</a>

```
searchKey: usagestatsdeprecated.LogEvent
```

```Go
func LogEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet) error
```

LogEvent logs users events. 

### <a id="GetByUserID" href="#GetByUserID">func GetByUserID(userID int32) (*types.UserUsageStatistics, error)</a>

```
searchKey: usagestatsdeprecated.GetByUserID
```

```Go
func GetByUserID(userID int32) (*types.UserUsageStatistics, error)
```

GetByUserID returns a single user's UserUsageStatistics. 

### <a id="GetSiteUsageStatistics" href="#GetSiteUsageStatistics">func GetSiteUsageStatistics(opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)</a>

```
searchKey: usagestatsdeprecated.GetSiteUsageStatistics
```

```Go
func GetSiteUsageStatistics(opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)
```

GetSiteUsageStatistics returns the current site's SiteActivity. 

### <a id="GetUsersActiveTodayCount" href="#GetUsersActiveTodayCount">func GetUsersActiveTodayCount(ctx context.Context) (int, error)</a>

```
searchKey: usagestatsdeprecated.GetUsersActiveTodayCount
```

```Go
func GetUsersActiveTodayCount(ctx context.Context) (int, error)
```

GetUsersActiveTodayCount returns a count of users that have been active today. 

### <a id="uniquesCount" href="#uniquesCount">func uniquesCount(dayStart time.Time, period *UsageDuration) (*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestatsdeprecated.uniquesCount
tags: [private]
```

```Go
func uniquesCount(dayStart time.Time, period *UsageDuration) (*types.SiteActivityPeriod, error)
```

uniquesCount calculates the number of unique users starting at 00:00:00 on a given UTC date over a period of time (years, months, and days). 

### <a id="daus" href="#daus">func daus(dayPeriods int) ([]*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestatsdeprecated.daus
tags: [private]
```

```Go
func daus(dayPeriods int) ([]*types.SiteActivityPeriod, error)
```

daus returns a count of daily active users for the last daysCount days (including the current, partial day). 

### <a id="waus" href="#waus">func waus(weekPeriods int) ([]*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestatsdeprecated.waus
tags: [private]
```

```Go
func waus(weekPeriods int) ([]*types.SiteActivityPeriod, error)
```

waus returns a count of daily active users for the last weeksCount calendar weeks (including the current, partial week). 

### <a id="maus" href="#maus">func maus(monthPeriods int) ([]*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestatsdeprecated.maus
tags: [private]
```

```Go
func maus(monthPeriods int) ([]*types.SiteActivityPeriod, error)
```

maus returns a count of daily active users for the last monthsCount calendar months (including the current, partial month). 

### <a id="gc" href="#gc">func gc()</a>

```
searchKey: usagestatsdeprecated.gc
tags: [private]
```

```Go
func gc()
```

gc expires active user sets after the max of daysOfHistory, weeksOfHistory, and monthsOfHistory have passed. 

### <a id="keyFromDate" href="#keyFromDate">func keyFromDate(activity string, date time.Time) string</a>

```
searchKey: usagestatsdeprecated.keyFromDate
tags: [private]
```

```Go
func keyFromDate(activity string, date time.Time) string
```

### <a id="usersActiveKeyFromDate" href="#usersActiveKeyFromDate">func usersActiveKeyFromDate(date time.Time) string</a>

```
searchKey: usagestatsdeprecated.usersActiveKeyFromDate
tags: [private]
```

```Go
func usersActiveKeyFromDate(date time.Time) string
```

### <a id="usersActiveKeyFromDaysAgo" href="#usersActiveKeyFromDaysAgo">func usersActiveKeyFromDaysAgo(daysAgo int) string</a>

```
searchKey: usagestatsdeprecated.usersActiveKeyFromDaysAgo
tags: [private]
```

```Go
func usersActiveKeyFromDaysAgo(daysAgo int) string
```

### <a id="startOfWeek" href="#startOfWeek">func startOfWeek(weeksAgo int) time.Time</a>

```
searchKey: usagestatsdeprecated.startOfWeek
tags: [private]
```

```Go
func startOfWeek(weeksAgo int) time.Time
```

### <a id="startOfMonth" href="#startOfMonth">func startOfMonth(monthsAgo int) time.Time</a>

```
searchKey: usagestatsdeprecated.startOfMonth
tags: [private]
```

```Go
func startOfMonth(monthsAgo int) time.Time
```

### <a id="keys" href="#keys">func keys(m map[string]bool) []string</a>

```
searchKey: usagestatsdeprecated.keys
tags: [private]
```

```Go
func keys(m map[string]bool) []string
```

### <a id="minIntOrZero" href="#minIntOrZero">func minIntOrZero(a, b int) int</a>

```
searchKey: usagestatsdeprecated.minIntOrZero
tags: [private]
```

```Go
func minIntOrZero(a, b int) int
```

### <a id="incrementUserCounter" href="#incrementUserCounter">func incrementUserCounter(userID int32, isAuthenticated bool, counterKey string) error</a>

```
searchKey: usagestatsdeprecated.incrementUserCounter
tags: [private]
```

```Go
func incrementUserCounter(userID int32, isAuthenticated bool, counterKey string) error
```

### <a id="keyFromStage" href="#keyFromStage">func keyFromStage(stage string) string</a>

```
searchKey: usagestatsdeprecated.keyFromStage
tags: [private]
```

```Go
func keyFromStage(stage string) string
```

### <a id="init.usage_stats_test.go" href="#init.usage_stats_test.go">func init()</a>

```
searchKey: usagestatsdeprecated.init
tags: [private]
```

```Go
func init()
```

### <a id="TestUserUsageStatistics_None" href="#TestUserUsageStatistics_None">func TestUserUsageStatistics_None(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_None
tags: [private]
```

```Go
func TestUserUsageStatistics_None(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogPageView" href="#TestUserUsageStatistics_LogPageView">func TestUserUsageStatistics_LogPageView(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_LogPageView
tags: [private]
```

```Go
func TestUserUsageStatistics_LogPageView(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogSearchQuery" href="#TestUserUsageStatistics_LogSearchQuery">func TestUserUsageStatistics_LogSearchQuery(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_LogSearchQuery
tags: [private]
```

```Go
func TestUserUsageStatistics_LogSearchQuery(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogCodeIntelAction" href="#TestUserUsageStatistics_LogCodeIntelAction">func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_LogCodeIntelAction
tags: [private]
```

```Go
func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogCodeHostIntegrationUsage" href="#TestUserUsageStatistics_LogCodeHostIntegrationUsage">func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_LogCodeHostIntegrationUsage
tags: [private]
```

```Go
func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)
```

### <a id="TestUserUsageStatistics_getUsersActiveToday" href="#TestUserUsageStatistics_getUsersActiveToday">func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_getUsersActiveToday
tags: [private]
```

```Go
func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)
```

### <a id="TestUserUsageStatistics_DAUs_WAUs_MAUs" href="#TestUserUsageStatistics_DAUs_WAUs_MAUs">func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_DAUs_WAUs_MAUs
tags: [private]
```

```Go
func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)
```

### <a id="setupForTest" href="#setupForTest">func setupForTest(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.setupForTest
tags: [private]
```

```Go
func setupForTest(t *testing.T)
```

### <a id="mockTimeNow" href="#mockTimeNow">func mockTimeNow(t time.Time)</a>

```
searchKey: usagestatsdeprecated.mockTimeNow
tags: [private]
```

```Go
func mockTimeNow(t time.Time)
```

### <a id="siteActivityCompare" href="#siteActivityCompare">func siteActivityCompare(a, b *types.SiteUsageStatistics) error</a>

```
searchKey: usagestatsdeprecated.siteActivityCompare
tags: [private]
```

```Go
func siteActivityCompare(a, b *types.SiteUsageStatistics) error
```

### <a id="siteActivityPeriodSliceCompare" href="#siteActivityPeriodSliceCompare">func siteActivityPeriodSliceCompare(label string, a, b []*types.SiteActivityPeriod) error</a>

```
searchKey: usagestatsdeprecated.siteActivityPeriodSliceCompare
tags: [private]
```

```Go
func siteActivityPeriodSliceCompare(label string, a, b []*types.SiteActivityPeriod) error
```

### <a id="siteActivityPeriodCompare" href="#siteActivityPeriodCompare">func siteActivityPeriodCompare(label string, a, b *types.SiteActivityPeriod) error</a>

```
searchKey: usagestatsdeprecated.siteActivityPeriodCompare
tags: [private]
```

```Go
func siteActivityPeriodCompare(label string, a, b *types.SiteActivityPeriod) error
```

