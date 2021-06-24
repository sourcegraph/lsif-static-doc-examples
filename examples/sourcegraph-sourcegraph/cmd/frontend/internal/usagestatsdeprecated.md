# Package usagestatsdeprecated

Package usagestatsdeprecated is deprecated in favor of package usagestats. 

Package usagestatsdeprecated provides an interface to update and access information about individual and aggregate Sourcegraph users' activity levels. 

Note that this package should not be used on sourcegraph.com, only on self-hosted deployments. 

nolint 

## Index

* [Constants](#const)
    * [const defaultDays](#defaultDays)
    * [const defaultMonths](#defaultMonths)
    * [const defaultWeeks](#defaultWeeks)
    * [const fCodeIntelActions](#fCodeIntelActions)
    * [const fFindRefsActions](#fFindRefsActions)
    * [const fFindRefsOccurred](#fFindRefsOccurred)
    * [const fLastActive](#fLastActive)
    * [const fLastActiveCodeHostIntegration](#fLastActiveCodeHostIntegration)
    * [const fPageViews](#fPageViews)
    * [const fSearchOccurred](#fSearchOccurred)
    * [const fSearchQueries](#fSearchQueries)
    * [const fUsersActive](#fUsersActive)
    * [const maxStorageDays](#maxStorageDays)
* [Variables](#var)
    * [var MockGetByUserID](#MockGetByUserID)
    * [var eventHandlers](#eventHandlers)
    * [var findRefsOccurred](#findRefsOccurred)
    * [var gcOnce](#gcOnce)
    * [var keyPrefix](#keyPrefix)
    * [var logCodeHostIntegrationUsage](#logCodeHostIntegrationUsage)
    * [var logCodeIntelAction](#logCodeIntelAction)
    * [var logCodeIntelRefsAction](#logCodeIntelRefsAction)
    * [var logPageView](#logPageView)
    * [var logSearchQuery](#logSearchQuery)
    * [var logSiteFindRefsOccurred](#logSiteFindRefsOccurred)
    * [var logSiteSearchOccurred](#logSiteSearchOccurred)
    * [var logStageEvent](#logStageEvent)
    * [var pool](#pool)
    * [var searchOccurred](#searchOccurred)
    * [var timeNow](#timeNow)
* [Types](#type)
    * [type ActiveUsers struct](#ActiveUsers)
        * [func uniques(dayStart time.Time, period *UsageDuration) (*ActiveUsers, error)](#uniques)
    * [type SiteUsageStatisticsOptions struct](#SiteUsageStatisticsOptions)
    * [type UsageDuration struct](#UsageDuration)
    * [type eventHandler func(userID int32, event string, isAuthenticated bool) error](#eventHandler)
* [Functions](#func)
    * [func GetByUserID(userID int32) (*types.UserUsageStatistics, error)](#GetByUserID)
    * [func GetSiteUsageStatistics(opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)](#GetSiteUsageStatistics)
    * [func GetUsersActiveTodayCount(ctx context.Context) (int, error)](#GetUsersActiveTodayCount)
    * [func LogActivity(isAuthenticated bool, userID int32, userCookieID, event string) error](#LogActivity)
    * [func LogEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet) error](#LogEvent)
    * [func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)](#TestUserUsageStatistics_DAUs_WAUs_MAUs)
    * [func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)](#TestUserUsageStatistics_LogCodeHostIntegrationUsage)
    * [func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)](#TestUserUsageStatistics_LogCodeIntelAction)
    * [func TestUserUsageStatistics_LogPageView(t *testing.T)](#TestUserUsageStatistics_LogPageView)
    * [func TestUserUsageStatistics_LogSearchQuery(t *testing.T)](#TestUserUsageStatistics_LogSearchQuery)
    * [func TestUserUsageStatistics_None(t *testing.T)](#TestUserUsageStatistics_None)
    * [func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)](#TestUserUsageStatistics_getUsersActiveToday)
    * [func daus(dayPeriods int) ([]*types.SiteActivityPeriod, error)](#daus)
    * [func gc()](#gc)
    * [func incrementUserCounter(userID int32, isAuthenticated bool, counterKey string) error](#incrementUserCounter)
    * [func init()](#init.usage_stats_test.go)
    * [func keyFromDate(activity string, date time.Time) string](#keyFromDate)
    * [func keyFromStage(stage string) string](#keyFromStage)
    * [func keys(m map[string]bool) []string](#keys)
    * [func maus(monthPeriods int) ([]*types.SiteActivityPeriod, error)](#maus)
    * [func minIntOrZero(a, b int) int](#minIntOrZero)
    * [func mockTimeNow(t time.Time)](#mockTimeNow)
    * [func setupForTest(t *testing.T)](#setupForTest)
    * [func siteActivityCompare(a, b *types.SiteUsageStatistics) error](#siteActivityCompare)
    * [func siteActivityPeriodCompare(label string, a, b *types.SiteActivityPeriod) error](#siteActivityPeriodCompare)
    * [func siteActivityPeriodSliceCompare(label string, a, b []*types.SiteActivityPeriod) error](#siteActivityPeriodSliceCompare)
    * [func startOfMonth(monthsAgo int) time.Time](#startOfMonth)
    * [func startOfWeek(weeksAgo int) time.Time](#startOfWeek)
    * [func uniquesCount(dayStart time.Time, period *UsageDuration) (*types.SiteActivityPeriod, error)](#uniquesCount)
    * [func usersActiveKeyFromDate(date time.Time) string](#usersActiveKeyFromDate)
    * [func usersActiveKeyFromDaysAgo(daysAgo int) string](#usersActiveKeyFromDaysAgo)
    * [func waus(weekPeriods int) ([]*types.SiteActivityPeriod, error)](#waus)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="defaultDays" href="#defaultDays">const defaultDays</a>

```
searchKey: usagestatsdeprecated.defaultDays
tags: [constant number private]
```

```Go
const defaultDays = 14
```

### <a id="defaultMonths" href="#defaultMonths">const defaultMonths</a>

```
searchKey: usagestatsdeprecated.defaultMonths
tags: [constant number private]
```

```Go
const defaultMonths = 3
```

### <a id="defaultWeeks" href="#defaultWeeks">const defaultWeeks</a>

```
searchKey: usagestatsdeprecated.defaultWeeks
tags: [constant number private]
```

```Go
const defaultWeeks = 10
```

### <a id="fCodeIntelActions" href="#fCodeIntelActions">const fCodeIntelActions</a>

```
searchKey: usagestatsdeprecated.fCodeIntelActions
tags: [constant string private]
```

```Go
const fCodeIntelActions = "codeintelactions"
```

### <a id="fFindRefsActions" href="#fFindRefsActions">const fFindRefsActions</a>

```
searchKey: usagestatsdeprecated.fFindRefsActions
tags: [constant string private]
```

```Go
const fFindRefsActions = "codeintelactions:findrefs"
```

### <a id="fFindRefsOccurred" href="#fFindRefsOccurred">const fFindRefsOccurred</a>

```
searchKey: usagestatsdeprecated.fFindRefsOccurred
tags: [constant string private]
```

```Go
const fFindRefsOccurred = "findrefsoccurred"
```

### <a id="fLastActive" href="#fLastActive">const fLastActive</a>

```
searchKey: usagestatsdeprecated.fLastActive
tags: [constant string private]
```

```Go
const fLastActive = "lastactive"
```

### <a id="fLastActiveCodeHostIntegration" href="#fLastActiveCodeHostIntegration">const fLastActiveCodeHostIntegration</a>

```
searchKey: usagestatsdeprecated.fLastActiveCodeHostIntegration
tags: [constant string private]
```

```Go
const fLastActiveCodeHostIntegration = "lastactivecodehostintegration"
```

### <a id="fPageViews" href="#fPageViews">const fPageViews</a>

```
searchKey: usagestatsdeprecated.fPageViews
tags: [constant string private]
```

```Go
const fPageViews = "pageviews"
```

### <a id="fSearchOccurred" href="#fSearchOccurred">const fSearchOccurred</a>

```
searchKey: usagestatsdeprecated.fSearchOccurred
tags: [constant string private]
```

```Go
const fSearchOccurred = "searchoccurred"
```

### <a id="fSearchQueries" href="#fSearchQueries">const fSearchQueries</a>

```
searchKey: usagestatsdeprecated.fSearchQueries
tags: [constant string private]
```

```Go
const fSearchQueries = "searchqueries"
```

### <a id="fUsersActive" href="#fUsersActive">const fUsersActive</a>

```
searchKey: usagestatsdeprecated.fUsersActive
tags: [constant string private]
```

```Go
const fUsersActive = "usersactive"
```

### <a id="maxStorageDays" href="#maxStorageDays">const maxStorageDays</a>

```
searchKey: usagestatsdeprecated.maxStorageDays
tags: [constant number private]
```

```Go
const maxStorageDays = 93
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="MockGetByUserID" href="#MockGetByUserID">var MockGetByUserID</a>

```
searchKey: usagestatsdeprecated.MockGetByUserID
tags: [variable function]
```

```Go
var MockGetByUserID func(userID int32) (*types.UserUsageStatistics, error)
```

### <a id="eventHandlers" href="#eventHandlers">var eventHandlers</a>

```
searchKey: usagestatsdeprecated.eventHandlers
tags: [variable object private]
```

```Go
var eventHandlers = ...
```

### <a id="findRefsOccurred" href="#findRefsOccurred">var findRefsOccurred</a>

```
searchKey: usagestatsdeprecated.findRefsOccurred
tags: [variable boolean private]
```

```Go
var findRefsOccurred = false
```

### <a id="gcOnce" href="#gcOnce">var gcOnce</a>

```
searchKey: usagestatsdeprecated.gcOnce
tags: [variable struct private]
```

```Go
var gcOnce sync.Once // ensures we only have 1 redis gc goroutine

```

### <a id="keyPrefix" href="#keyPrefix">var keyPrefix</a>

```
searchKey: usagestatsdeprecated.keyPrefix
tags: [variable string private]
```

```Go
var keyPrefix = "user_activity:"
```

### <a id="logCodeHostIntegrationUsage" href="#logCodeHostIntegrationUsage">var logCodeHostIntegrationUsage</a>

```
searchKey: usagestatsdeprecated.logCodeHostIntegrationUsage
tags: [variable function private]
```

```Go
var logCodeHostIntegrationUsage = ...
```

logCodeHostIntegrationUsage logs the last time a user was active on a code host integration. 

### <a id="logCodeIntelAction" href="#logCodeIntelAction">var logCodeIntelAction</a>

```
searchKey: usagestatsdeprecated.logCodeIntelAction
tags: [variable function private]
```

```Go
var logCodeIntelAction = ...
```

logCodeIntelAction increments a user's code intelligence usage count. 

### <a id="logCodeIntelRefsAction" href="#logCodeIntelRefsAction">var logCodeIntelRefsAction</a>

```
searchKey: usagestatsdeprecated.logCodeIntelRefsAction
tags: [variable function private]
```

```Go
var logCodeIntelRefsAction = ...
```

logCodeIntelRefsAction increments a user's code intelligence usage count. and their find refs action count. 

### <a id="logPageView" href="#logPageView">var logPageView</a>

```
searchKey: usagestatsdeprecated.logPageView
tags: [variable function private]
```

```Go
var logPageView = ...
```

logPageView increments a user's pageview count. 

### <a id="logSearchQuery" href="#logSearchQuery">var logSearchQuery</a>

```
searchKey: usagestatsdeprecated.logSearchQuery
tags: [variable function private]
```

```Go
var logSearchQuery = ...
```

logSearchQuery increments a user's search query count. 

### <a id="logSiteFindRefsOccurred" href="#logSiteFindRefsOccurred">var logSiteFindRefsOccurred</a>

```
searchKey: usagestatsdeprecated.logSiteFindRefsOccurred
tags: [variable function private]
```

```Go
var logSiteFindRefsOccurred = ...
```

logSiteFindRefsOccurred records that a search has occurred on the Sourcegraph instance. 

### <a id="logSiteSearchOccurred" href="#logSiteSearchOccurred">var logSiteSearchOccurred</a>

```
searchKey: usagestatsdeprecated.logSiteSearchOccurred
tags: [variable function private]
```

```Go
var logSiteSearchOccurred = ...
```

logSiteSearchOccurred records that a search has occurred on the Sourcegraph instance. 

### <a id="logStageEvent" href="#logStageEvent">var logStageEvent</a>

```
searchKey: usagestatsdeprecated.logStageEvent
tags: [variable function private]
```

```Go
var logStageEvent = ...
```

logStageEvent logs the last time a user did an action from a specific stage. 

### <a id="pool" href="#pool">var pool</a>

```
searchKey: usagestatsdeprecated.pool
tags: [variable struct private]
```

```Go
var pool = redispool.Store
```

### <a id="searchOccurred" href="#searchOccurred">var searchOccurred</a>

```
searchKey: usagestatsdeprecated.searchOccurred
tags: [variable boolean private]
```

```Go
var searchOccurred = false
```

### <a id="timeNow" href="#timeNow">var timeNow</a>

```
searchKey: usagestatsdeprecated.timeNow
tags: [variable function private]
```

```Go
var timeNow = time.Now
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="ActiveUsers" href="#ActiveUsers">type ActiveUsers struct</a>

```
searchKey: usagestatsdeprecated.ActiveUsers
tags: [struct]
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
tags: [method private]
```

```Go
func uniques(dayStart time.Time, period *UsageDuration) (*ActiveUsers, error)
```

uniques calculates the list of unique users starting at 00:00:00 on a given UTC date over a period of time. 

### <a id="SiteUsageStatisticsOptions" href="#SiteUsageStatisticsOptions">type SiteUsageStatisticsOptions struct</a>

```
searchKey: usagestatsdeprecated.SiteUsageStatisticsOptions
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

### <a id="UsageDuration" href="#UsageDuration">type UsageDuration struct</a>

```
searchKey: usagestatsdeprecated.UsageDuration
tags: [struct]
```

```Go
type UsageDuration struct {
	Days   int
	Months int
}
```

UsageDuration in aggregate represents a duration of time over which to calculate a set of unique users. 

### <a id="eventHandler" href="#eventHandler">type eventHandler func(userID int32, event string, isAuthenticated bool) error</a>

```
searchKey: usagestatsdeprecated.eventHandler
tags: [function private]
```

```Go
type eventHandler = func(userID int32, event string, isAuthenticated bool) error
```

Custom event handlers 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="GetByUserID" href="#GetByUserID">func GetByUserID(userID int32) (*types.UserUsageStatistics, error)</a>

```
searchKey: usagestatsdeprecated.GetByUserID
tags: [method]
```

```Go
func GetByUserID(userID int32) (*types.UserUsageStatistics, error)
```

GetByUserID returns a single user's UserUsageStatistics. 

### <a id="GetSiteUsageStatistics" href="#GetSiteUsageStatistics">func GetSiteUsageStatistics(opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)</a>

```
searchKey: usagestatsdeprecated.GetSiteUsageStatistics
tags: [method]
```

```Go
func GetSiteUsageStatistics(opt *SiteUsageStatisticsOptions) (*types.SiteUsageStatistics, error)
```

GetSiteUsageStatistics returns the current site's SiteActivity. 

### <a id="GetUsersActiveTodayCount" href="#GetUsersActiveTodayCount">func GetUsersActiveTodayCount(ctx context.Context) (int, error)</a>

```
searchKey: usagestatsdeprecated.GetUsersActiveTodayCount
tags: [method]
```

```Go
func GetUsersActiveTodayCount(ctx context.Context) (int, error)
```

GetUsersActiveTodayCount returns a count of users that have been active today. 

### <a id="LogActivity" href="#LogActivity">func LogActivity(isAuthenticated bool, userID int32, userCookieID, event string) error</a>

```
searchKey: usagestatsdeprecated.LogActivity
tags: [method]
```

```Go
func LogActivity(isAuthenticated bool, userID int32, userCookieID, event string) error
```

LogActivity logs any user activity (page view, integration usage, etc) to their "last active" time, and adds their unique ID to the set of active users 

### <a id="LogEvent" href="#LogEvent">func LogEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet) error</a>

```
searchKey: usagestatsdeprecated.LogEvent
tags: [method]
```

```Go
func LogEvent(ctx context.Context, db dbutil.DB, name, url string, userID int32, userCookieID, source string, argument json.RawMessage, featureFlags featureflag.FlagSet) error
```

LogEvent logs users events. 

### <a id="TestUserUsageStatistics_DAUs_WAUs_MAUs" href="#TestUserUsageStatistics_DAUs_WAUs_MAUs">func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_DAUs_WAUs_MAUs
tags: [method private test]
```

```Go
func TestUserUsageStatistics_DAUs_WAUs_MAUs(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogCodeHostIntegrationUsage" href="#TestUserUsageStatistics_LogCodeHostIntegrationUsage">func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_LogCodeHostIntegrationUsage
tags: [method private test]
```

```Go
func TestUserUsageStatistics_LogCodeHostIntegrationUsage(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogCodeIntelAction" href="#TestUserUsageStatistics_LogCodeIntelAction">func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_LogCodeIntelAction
tags: [method private test]
```

```Go
func TestUserUsageStatistics_LogCodeIntelAction(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogPageView" href="#TestUserUsageStatistics_LogPageView">func TestUserUsageStatistics_LogPageView(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_LogPageView
tags: [method private test]
```

```Go
func TestUserUsageStatistics_LogPageView(t *testing.T)
```

### <a id="TestUserUsageStatistics_LogSearchQuery" href="#TestUserUsageStatistics_LogSearchQuery">func TestUserUsageStatistics_LogSearchQuery(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_LogSearchQuery
tags: [method private test]
```

```Go
func TestUserUsageStatistics_LogSearchQuery(t *testing.T)
```

### <a id="TestUserUsageStatistics_None" href="#TestUserUsageStatistics_None">func TestUserUsageStatistics_None(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_None
tags: [method private test]
```

```Go
func TestUserUsageStatistics_None(t *testing.T)
```

### <a id="TestUserUsageStatistics_getUsersActiveToday" href="#TestUserUsageStatistics_getUsersActiveToday">func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.TestUserUsageStatistics_getUsersActiveToday
tags: [method private test]
```

```Go
func TestUserUsageStatistics_getUsersActiveToday(t *testing.T)
```

### <a id="daus" href="#daus">func daus(dayPeriods int) ([]*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestatsdeprecated.daus
tags: [method private]
```

```Go
func daus(dayPeriods int) ([]*types.SiteActivityPeriod, error)
```

daus returns a count of daily active users for the last daysCount days (including the current, partial day). 

### <a id="gc" href="#gc">func gc()</a>

```
searchKey: usagestatsdeprecated.gc
tags: [function private]
```

```Go
func gc()
```

gc expires active user sets after the max of daysOfHistory, weeksOfHistory, and monthsOfHistory have passed. 

### <a id="incrementUserCounter" href="#incrementUserCounter">func incrementUserCounter(userID int32, isAuthenticated bool, counterKey string) error</a>

```
searchKey: usagestatsdeprecated.incrementUserCounter
tags: [method private]
```

```Go
func incrementUserCounter(userID int32, isAuthenticated bool, counterKey string) error
```

### <a id="init.usage_stats_test.go" href="#init.usage_stats_test.go">func init()</a>

```
searchKey: usagestatsdeprecated.init
tags: [function private]
```

```Go
func init()
```

### <a id="keyFromDate" href="#keyFromDate">func keyFromDate(activity string, date time.Time) string</a>

```
searchKey: usagestatsdeprecated.keyFromDate
tags: [method private]
```

```Go
func keyFromDate(activity string, date time.Time) string
```

### <a id="keyFromStage" href="#keyFromStage">func keyFromStage(stage string) string</a>

```
searchKey: usagestatsdeprecated.keyFromStage
tags: [method private]
```

```Go
func keyFromStage(stage string) string
```

### <a id="keys" href="#keys">func keys(m map[string]bool) []string</a>

```
searchKey: usagestatsdeprecated.keys
tags: [method private]
```

```Go
func keys(m map[string]bool) []string
```

### <a id="maus" href="#maus">func maus(monthPeriods int) ([]*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestatsdeprecated.maus
tags: [method private]
```

```Go
func maus(monthPeriods int) ([]*types.SiteActivityPeriod, error)
```

maus returns a count of daily active users for the last monthsCount calendar months (including the current, partial month). 

### <a id="minIntOrZero" href="#minIntOrZero">func minIntOrZero(a, b int) int</a>

```
searchKey: usagestatsdeprecated.minIntOrZero
tags: [method private]
```

```Go
func minIntOrZero(a, b int) int
```

### <a id="mockTimeNow" href="#mockTimeNow">func mockTimeNow(t time.Time)</a>

```
searchKey: usagestatsdeprecated.mockTimeNow
tags: [method private]
```

```Go
func mockTimeNow(t time.Time)
```

### <a id="setupForTest" href="#setupForTest">func setupForTest(t *testing.T)</a>

```
searchKey: usagestatsdeprecated.setupForTest
tags: [method private]
```

```Go
func setupForTest(t *testing.T)
```

### <a id="siteActivityCompare" href="#siteActivityCompare">func siteActivityCompare(a, b *types.SiteUsageStatistics) error</a>

```
searchKey: usagestatsdeprecated.siteActivityCompare
tags: [method private]
```

```Go
func siteActivityCompare(a, b *types.SiteUsageStatistics) error
```

### <a id="siteActivityPeriodCompare" href="#siteActivityPeriodCompare">func siteActivityPeriodCompare(label string, a, b *types.SiteActivityPeriod) error</a>

```
searchKey: usagestatsdeprecated.siteActivityPeriodCompare
tags: [method private]
```

```Go
func siteActivityPeriodCompare(label string, a, b *types.SiteActivityPeriod) error
```

### <a id="siteActivityPeriodSliceCompare" href="#siteActivityPeriodSliceCompare">func siteActivityPeriodSliceCompare(label string, a, b []*types.SiteActivityPeriod) error</a>

```
searchKey: usagestatsdeprecated.siteActivityPeriodSliceCompare
tags: [method private]
```

```Go
func siteActivityPeriodSliceCompare(label string, a, b []*types.SiteActivityPeriod) error
```

### <a id="startOfMonth" href="#startOfMonth">func startOfMonth(monthsAgo int) time.Time</a>

```
searchKey: usagestatsdeprecated.startOfMonth
tags: [method private]
```

```Go
func startOfMonth(monthsAgo int) time.Time
```

### <a id="startOfWeek" href="#startOfWeek">func startOfWeek(weeksAgo int) time.Time</a>

```
searchKey: usagestatsdeprecated.startOfWeek
tags: [method private]
```

```Go
func startOfWeek(weeksAgo int) time.Time
```

### <a id="uniquesCount" href="#uniquesCount">func uniquesCount(dayStart time.Time, period *UsageDuration) (*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestatsdeprecated.uniquesCount
tags: [method private]
```

```Go
func uniquesCount(dayStart time.Time, period *UsageDuration) (*types.SiteActivityPeriod, error)
```

uniquesCount calculates the number of unique users starting at 00:00:00 on a given UTC date over a period of time (years, months, and days). 

### <a id="usersActiveKeyFromDate" href="#usersActiveKeyFromDate">func usersActiveKeyFromDate(date time.Time) string</a>

```
searchKey: usagestatsdeprecated.usersActiveKeyFromDate
tags: [method private]
```

```Go
func usersActiveKeyFromDate(date time.Time) string
```

### <a id="usersActiveKeyFromDaysAgo" href="#usersActiveKeyFromDaysAgo">func usersActiveKeyFromDaysAgo(daysAgo int) string</a>

```
searchKey: usagestatsdeprecated.usersActiveKeyFromDaysAgo
tags: [method private]
```

```Go
func usersActiveKeyFromDaysAgo(daysAgo int) string
```

### <a id="waus" href="#waus">func waus(weekPeriods int) ([]*types.SiteActivityPeriod, error)</a>

```
searchKey: usagestatsdeprecated.waus
tags: [method private]
```

```Go
func waus(weekPeriods int) ([]*types.SiteActivityPeriod, error)
```

waus returns a count of daily active users for the last weeksCount calendar weeks (including the current, partial week). 

