# Package window

## Index

* [Constants](#const)
    * [const ratePerSecond](#ratePerSecond)
    * [const ratePerMinute](#ratePerMinute)
    * [const ratePerHour](#ratePerHour)
* [Variables](#var)
    * [var ErrZeroSchedule](#ErrZeroSchedule)
    * [var cmpAllowUnexported](#cmpAllowUnexported)
    * [var cmpOptions](#cmpOptions)
    * [var allWeekdays](#allWeekdays)
* [Types](#type)
    * [type Configuration struct](#Configuration)
        * [func NewConfiguration(raw *[]*schema.BatchChangeRolloutWindow) (*Configuration, error)](#NewConfiguration)
        * [func (cfg *Configuration) Estimate(now time.Time, n int) *time.Time](#Configuration.Estimate)
        * [func (cfg *Configuration) HasRolloutWindows() bool](#Configuration.HasRolloutWindows)
        * [func (cfg *Configuration) Schedule() *Schedule](#Configuration.Schedule)
        * [func (cfg *Configuration) windowFor(now time.Time) (*Window, *time.Duration)](#Configuration.windowFor)
        * [func (cfg *Configuration) scheduleAt(at time.Time) *Schedule](#Configuration.scheduleAt)
    * [type rate struct](#rate)
        * [func makeUnlimitedRate() rate](#makeUnlimitedRate)
        * [func parseRate(raw interface{}) (rate, error)](#parseRate)
        * [func (r rate) IsUnlimited() bool](#rate.IsUnlimited)
    * [type rateUnit int](#rateUnit)
        * [func parseRateUnit(raw string) (rateUnit, error)](#parseRateUnit)
        * [func (ru rateUnit) AsDuration() time.Duration](#rateUnit.AsDuration)
    * [type Schedule struct](#Schedule)
        * [func newSchedule(base time.Time, d time.Duration, rate rate) *Schedule](#newSchedule)
        * [func (s *Schedule) Take() (time.Time, error)](#Schedule.Take)
        * [func (s *Schedule) ValidUntil() time.Time](#Schedule.ValidUntil)
        * [func (s *Schedule) total() int](#Schedule.total)
    * [type timeOfDay struct](#timeOfDay)
        * [func timeOfDayFromParts(hour, minute int8) timeOfDay](#timeOfDayFromParts)
        * [func timeOfDayFromTime(t time.Time) timeOfDay](#timeOfDayFromTime)
        * [func parseWindowTime(raw string) (*timeOfDay, error)](#parseWindowTime)
        * [func timeOfDayPtr(hour, minute int8) *timeOfDay](#timeOfDayPtr)
        * [func (t timeOfDay) after(other timeOfDay) bool](#timeOfDay.after)
        * [func (t timeOfDay) before(other timeOfDay) bool](#timeOfDay.before)
        * [func (t timeOfDay) Equal(other timeOfDay) bool](#timeOfDay.Equal)
    * [type weekdaySet int8](#weekdaySet)
        * [func newWeekdaySet(days ...time.Weekday) weekdaySet](#newWeekdaySet)
        * [func weekdayToBit(day time.Weekday) weekdaySet](#weekdayToBit)
        * [func (ws *weekdaySet) add(day time.Weekday)](#weekdaySet.add)
        * [func (ws weekdaySet) all() bool](#weekdaySet.all)
        * [func (ws weekdaySet) includes(day time.Weekday) bool](#weekdaySet.includes)
        * [func (ws *weekdaySet) Equal(other *weekdaySet) bool](#weekdaySet.Equal)
    * [type Window struct](#Window)
        * [func parseWindow(raw *schema.BatchChangeRolloutWindow) (Window, error)](#parseWindow)
        * [func (w *Window) covers(when timeOfDay) bool](#Window.covers)
        * [func (w *Window) IsOpen(at time.Time) bool](#Window.IsOpen)
        * [func (w *Window) NextOpenAfter(after time.Time) time.Time](#Window.NextOpenAfter)
* [Functions](#func)
    * [func parseConfiguration(raw *[]*schema.BatchChangeRolloutWindow) ([]Window, error)](#parseConfiguration)
    * [func parseTimePart(s string) (int8, error)](#parseTimePart)
    * [func parseWeekday(raw string) (time.Weekday, error)](#parseWeekday)
    * [func TestConfiguration_Estimate(t *testing.T)](#TestConfiguration_Estimate)
    * [func TestConfiguration_Schedule(t *testing.T)](#TestConfiguration_Schedule)
    * [func TestConfiguration_currentFor(t *testing.T)](#TestConfiguration_currentFor)
    * [func TestParseConfiguration(t *testing.T)](#TestParseConfiguration)
    * [func TestParseRateUnit(t *testing.T)](#TestParseRateUnit)
    * [func TestParseRate(t *testing.T)](#TestParseRate)
    * [func TestRateUnit_AsDuration(t *testing.T)](#TestRateUnit_AsDuration)
    * [func TestScheduleLimited(t *testing.T)](#TestScheduleLimited)
    * [func TestScheduleUnlimited(t *testing.T)](#TestScheduleUnlimited)
    * [func TestScheduleZero(t *testing.T)](#TestScheduleZero)
    * [func TestTimeOfDay(t *testing.T)](#TestTimeOfDay)
    * [func TestWeekday_All(t *testing.T)](#TestWeekday_All)
    * [func TestWeekday_Includes(t *testing.T)](#TestWeekday_Includes)
    * [func TestWeekdayBitSanity(t *testing.T)](#TestWeekdayBitSanity)
    * [func TestWindow_IsOpen(t *testing.T)](#TestWindow_IsOpen)
    * [func TestWindow_NextOpenAfter(t *testing.T)](#TestWindow_NextOpenAfter)
    * [func TestParseWindowTime(t *testing.T)](#TestParseWindowTime)
    * [func TestParseWeekday(t *testing.T)](#TestParseWeekday)
    * [func TestParseWindow(t *testing.T)](#TestParseWindow)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="ratePerSecond" href="#ratePerSecond">const ratePerSecond</a>

```
searchKey: window.ratePerSecond
tags: [private]
```

```Go
const ratePerSecond = iota
```

### <a id="ratePerMinute" href="#ratePerMinute">const ratePerMinute</a>

```
searchKey: window.ratePerMinute
tags: [private]
```

```Go
const ratePerMinute
```

### <a id="ratePerHour" href="#ratePerHour">const ratePerHour</a>

```
searchKey: window.ratePerHour
tags: [private]
```

```Go
const ratePerHour
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrZeroSchedule" href="#ErrZeroSchedule">var ErrZeroSchedule</a>

```
searchKey: window.ErrZeroSchedule
```

```Go
var ErrZeroSchedule = errors.New("schedule will never yield")
```

ErrZeroSchedule indicates a Schedule that has a zero rate limit, and for which Take() will never succeed. 

### <a id="cmpAllowUnexported" href="#cmpAllowUnexported">var cmpAllowUnexported</a>

```
searchKey: window.cmpAllowUnexported
tags: [private]
```

```Go
var cmpAllowUnexported = cmp.AllowUnexported(Window{}, rate{})
```

We have a bunch of tests in here that rely on unexported fields in the window structs. Since we control all of this, we're going to provide a common set of options that will allow that. 

### <a id="cmpOptions" href="#cmpOptions">var cmpOptions</a>

```
searchKey: window.cmpOptions
tags: [private]
```

```Go
var cmpOptions = cmp.Options{cmpAllowUnexported}
```

We have a bunch of tests in here that rely on unexported fields in the window structs. Since we control all of this, we're going to provide a common set of options that will allow that. 

### <a id="allWeekdays" href="#allWeekdays">var allWeekdays</a>

```
searchKey: window.allWeekdays
tags: [private]
```

```Go
var allWeekdays = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Configuration" href="#Configuration">type Configuration struct</a>

```
searchKey: window.Configuration
```

```Go
type Configuration struct {
	windows []Window
}
```

Configuration represents the rollout windows configured on the site. 

#### <a id="NewConfiguration" href="#NewConfiguration">func NewConfiguration(raw *[]*schema.BatchChangeRolloutWindow) (*Configuration, error)</a>

```
searchKey: window.NewConfiguration
```

```Go
func NewConfiguration(raw *[]*schema.BatchChangeRolloutWindow) (*Configuration, error)
```

NewConfiguration constructs a Configuration based on the given site configuration. 

#### <a id="Configuration.Estimate" href="#Configuration.Estimate">func (cfg *Configuration) Estimate(now time.Time, n int) *time.Time</a>

```
searchKey: window.Configuration.Estimate
```

```Go
func (cfg *Configuration) Estimate(now time.Time, n int) *time.Time
```

Estimate attempts to estimate when the given entry in a queue of changesets to be reconciled would be reconciled. nil indicates that there is no reasonable estimate, either because all windows are zero or the estimate is too far in the future to be reliable. 

#### <a id="Configuration.HasRolloutWindows" href="#Configuration.HasRolloutWindows">func (cfg *Configuration) HasRolloutWindows() bool</a>

```
searchKey: window.Configuration.HasRolloutWindows
```

```Go
func (cfg *Configuration) HasRolloutWindows() bool
```

HasRolloutWindows returns true if one or more windows have been defined. 

#### <a id="Configuration.Schedule" href="#Configuration.Schedule">func (cfg *Configuration) Schedule() *Schedule</a>

```
searchKey: window.Configuration.Schedule
```

```Go
func (cfg *Configuration) Schedule() *Schedule
```

Schedule returns the currently active schedule. 

#### <a id="Configuration.windowFor" href="#Configuration.windowFor">func (cfg *Configuration) windowFor(now time.Time) (*Window, *time.Duration)</a>

```
searchKey: window.Configuration.windowFor
tags: [private]
```

```Go
func (cfg *Configuration) windowFor(now time.Time) (*Window, *time.Duration)
```

windowFor returns the rollout window for the given time, if any, and the duration for which that window applies. The duration will be nil if the current window applies indefinitely. 

#### <a id="Configuration.scheduleAt" href="#Configuration.scheduleAt">func (cfg *Configuration) scheduleAt(at time.Time) *Schedule</a>

```
searchKey: window.Configuration.scheduleAt
tags: [private]
```

```Go
func (cfg *Configuration) scheduleAt(at time.Time) *Schedule
```

scheduleAt constructs a schedule that is valid at the given time. Note that scheduleAt does _not_ check if there are rollout windows configured at all: the caller must do this. 

### <a id="rate" href="#rate">type rate struct</a>

```
searchKey: window.rate
tags: [private]
```

```Go
type rate struct {
	n    int
	unit rateUnit
}
```

#### <a id="makeUnlimitedRate" href="#makeUnlimitedRate">func makeUnlimitedRate() rate</a>

```
searchKey: window.makeUnlimitedRate
tags: [private]
```

```Go
func makeUnlimitedRate() rate
```

#### <a id="parseRate" href="#parseRate">func parseRate(raw interface{}) (rate, error)</a>

```
searchKey: window.parseRate
tags: [private]
```

```Go
func parseRate(raw interface{}) (rate, error)
```

parseRate parses a rate given either as a raw integer (which will be interpreted as a rate per second), a string "unlimited" (which will be interpreted, surprisingly, as unlimited), or a string in the form "N/UNIT". 

#### <a id="rate.IsUnlimited" href="#rate.IsUnlimited">func (r rate) IsUnlimited() bool</a>

```
searchKey: window.rate.IsUnlimited
tags: [private]
```

```Go
func (r rate) IsUnlimited() bool
```

### <a id="rateUnit" href="#rateUnit">type rateUnit int</a>

```
searchKey: window.rateUnit
tags: [private]
```

```Go
type rateUnit int
```

#### <a id="parseRateUnit" href="#parseRateUnit">func parseRateUnit(raw string) (rateUnit, error)</a>

```
searchKey: window.parseRateUnit
tags: [private]
```

```Go
func parseRateUnit(raw string) (rateUnit, error)
```

#### <a id="rateUnit.AsDuration" href="#rateUnit.AsDuration">func (ru rateUnit) AsDuration() time.Duration</a>

```
searchKey: window.rateUnit.AsDuration
tags: [private]
```

```Go
func (ru rateUnit) AsDuration() time.Duration
```

### <a id="Schedule" href="#Schedule">type Schedule struct</a>

```
searchKey: window.Schedule
```

```Go
type Schedule struct {
	limiter ratelimit.Limiter

	// until really needs to contain a monotonic time, which means that care
	// must be taken to construct the schedule without a time zone in production
	// use. (Testing doesn't really matter.) time.Now() is OK.
	until time.Time

	// Fields we need to keep around for total calculation.
	duration time.Duration
	rate     rate
}
```

Schedule represents a single Schedule in time: for a certain amount of time, this particular rate limit will be in enforced. 

#### <a id="newSchedule" href="#newSchedule">func newSchedule(base time.Time, d time.Duration, rate rate) *Schedule</a>

```
searchKey: window.newSchedule
tags: [private]
```

```Go
func newSchedule(base time.Time, d time.Duration, rate rate) *Schedule
```

#### <a id="Schedule.Take" href="#Schedule.Take">func (s *Schedule) Take() (time.Time, error)</a>

```
searchKey: window.Schedule.Take
```

```Go
func (s *Schedule) Take() (time.Time, error)
```

Take blocks until a scheduling event can occur, and returns the time the event occurred. 

#### <a id="Schedule.ValidUntil" href="#Schedule.ValidUntil">func (s *Schedule) ValidUntil() time.Time</a>

```
searchKey: window.Schedule.ValidUntil
```

```Go
func (s *Schedule) ValidUntil() time.Time
```

ValidUntil returns the time the schedule is valid until. After that time, a new Schedule must be created and used. 

#### <a id="Schedule.total" href="#Schedule.total">func (s *Schedule) total() int</a>

```
searchKey: window.Schedule.total
tags: [private]
```

```Go
func (s *Schedule) total() int
```

total returns the total number of events the schedule expects to be able to handle while valid. If the schedule does not apply any rate limiting, then this will be -1. 

### <a id="timeOfDay" href="#timeOfDay">type timeOfDay struct</a>

```
searchKey: window.timeOfDay
tags: [private]
```

```Go
type timeOfDay struct {
	hour   int8
	minute int8

	cmp int
}
```

#### <a id="timeOfDayFromParts" href="#timeOfDayFromParts">func timeOfDayFromParts(hour, minute int8) timeOfDay</a>

```
searchKey: window.timeOfDayFromParts
tags: [private]
```

```Go
func timeOfDayFromParts(hour, minute int8) timeOfDay
```

#### <a id="timeOfDayFromTime" href="#timeOfDayFromTime">func timeOfDayFromTime(t time.Time) timeOfDay</a>

```
searchKey: window.timeOfDayFromTime
tags: [private]
```

```Go
func timeOfDayFromTime(t time.Time) timeOfDay
```

#### <a id="parseWindowTime" href="#parseWindowTime">func parseWindowTime(raw string) (*timeOfDay, error)</a>

```
searchKey: window.parseWindowTime
tags: [private]
```

```Go
func parseWindowTime(raw string) (*timeOfDay, error)
```

#### <a id="timeOfDayPtr" href="#timeOfDayPtr">func timeOfDayPtr(hour, minute int8) *timeOfDay</a>

```
searchKey: window.timeOfDayPtr
tags: [private]
```

```Go
func timeOfDayPtr(hour, minute int8) *timeOfDay
```

#### <a id="timeOfDay.after" href="#timeOfDay.after">func (t timeOfDay) after(other timeOfDay) bool</a>

```
searchKey: window.timeOfDay.after
tags: [private]
```

```Go
func (t timeOfDay) after(other timeOfDay) bool
```

#### <a id="timeOfDay.before" href="#timeOfDay.before">func (t timeOfDay) before(other timeOfDay) bool</a>

```
searchKey: window.timeOfDay.before
tags: [private]
```

```Go
func (t timeOfDay) before(other timeOfDay) bool
```

#### <a id="timeOfDay.Equal" href="#timeOfDay.Equal">func (t timeOfDay) Equal(other timeOfDay) bool</a>

```
searchKey: window.timeOfDay.Equal
tags: [private]
```

```Go
func (t timeOfDay) Equal(other timeOfDay) bool
```

### <a id="weekdaySet" href="#weekdaySet">type weekdaySet int8</a>

```
searchKey: window.weekdaySet
tags: [private]
```

```Go
type weekdaySet int8
```

weekdaySet represents a set of weekdays. As a special case, if no weekdays are set (ie the default value), then _all_ weekdays are considered to be set; there's no concept of a zero weekdaySet, since a rollout window must always be valid for at least one weekday. 

In terms of the implementation, since there are only seven possible weekdays, we can store them as bits in an int8. 

#### <a id="newWeekdaySet" href="#newWeekdaySet">func newWeekdaySet(days ...time.Weekday) weekdaySet</a>

```
searchKey: window.newWeekdaySet
tags: [private]
```

```Go
func newWeekdaySet(days ...time.Weekday) weekdaySet
```

newWeekdaySet instantiates a new weekdaySet and returns it. If one or more days are provided, they will be added to the initial state of the set. 

#### <a id="weekdayToBit" href="#weekdayToBit">func weekdayToBit(day time.Weekday) weekdaySet</a>

```
searchKey: window.weekdayToBit
tags: [private]
```

```Go
func weekdayToBit(day time.Weekday) weekdaySet
```

#### <a id="weekdaySet.add" href="#weekdaySet.add">func (ws *weekdaySet) add(day time.Weekday)</a>

```
searchKey: window.weekdaySet.add
tags: [private]
```

```Go
func (ws *weekdaySet) add(day time.Weekday)
```

add adds a day to the weekdaySet. 

#### <a id="weekdaySet.all" href="#weekdaySet.all">func (ws weekdaySet) all() bool</a>

```
searchKey: window.weekdaySet.all
tags: [private]
```

```Go
func (ws weekdaySet) all() bool
```

all returns true if the weekdaySet matches all days. 

#### <a id="weekdaySet.includes" href="#weekdaySet.includes">func (ws weekdaySet) includes(day time.Weekday) bool</a>

```
searchKey: window.weekdaySet.includes
tags: [private]
```

```Go
func (ws weekdaySet) includes(day time.Weekday) bool
```

includes returns true if the given day is included in the weekdaySet. 

#### <a id="weekdaySet.Equal" href="#weekdaySet.Equal">func (ws *weekdaySet) Equal(other *weekdaySet) bool</a>

```
searchKey: window.weekdaySet.Equal
tags: [private]
```

```Go
func (ws *weekdaySet) Equal(other *weekdaySet) bool
```

Equal is needed for test purposes, but not in normal use. 

### <a id="Window" href="#Window">type Window struct</a>

```
searchKey: window.Window
```

```Go
type Window struct {
	days  weekdaySet
	start *timeOfDay
	end   *timeOfDay
	rate  rate
}
```

Window represents a single rollout window configured on a site. 

#### <a id="parseWindow" href="#parseWindow">func parseWindow(raw *schema.BatchChangeRolloutWindow) (Window, error)</a>

```
searchKey: window.parseWindow
tags: [private]
```

```Go
func parseWindow(raw *schema.BatchChangeRolloutWindow) (Window, error)
```

#### <a id="Window.covers" href="#Window.covers">func (w *Window) covers(when timeOfDay) bool</a>

```
searchKey: window.Window.covers
tags: [private]
```

```Go
func (w *Window) covers(when timeOfDay) bool
```

#### <a id="Window.IsOpen" href="#Window.IsOpen">func (w *Window) IsOpen(at time.Time) bool</a>

```
searchKey: window.Window.IsOpen
```

```Go
func (w *Window) IsOpen(at time.Time) bool
```

IsOpen checks if this window is currently open. 

#### <a id="Window.NextOpenAfter" href="#Window.NextOpenAfter">func (w *Window) NextOpenAfter(after time.Time) time.Time</a>

```
searchKey: window.Window.NextOpenAfter
```

```Go
func (w *Window) NextOpenAfter(after time.Time) time.Time
```

NextOpenAfter returns the time that this window will next be open. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="parseConfiguration" href="#parseConfiguration">func parseConfiguration(raw *[]*schema.BatchChangeRolloutWindow) ([]Window, error)</a>

```
searchKey: window.parseConfiguration
tags: [private]
```

```Go
func parseConfiguration(raw *[]*schema.BatchChangeRolloutWindow) ([]Window, error)
```

### <a id="parseTimePart" href="#parseTimePart">func parseTimePart(s string) (int8, error)</a>

```
searchKey: window.parseTimePart
tags: [private]
```

```Go
func parseTimePart(s string) (int8, error)
```

### <a id="parseWeekday" href="#parseWeekday">func parseWeekday(raw string) (time.Weekday, error)</a>

```
searchKey: window.parseWeekday
tags: [private]
```

```Go
func parseWeekday(raw string) (time.Weekday, error)
```

### <a id="TestConfiguration_Estimate" href="#TestConfiguration_Estimate">func TestConfiguration_Estimate(t *testing.T)</a>

```
searchKey: window.TestConfiguration_Estimate
tags: [private]
```

```Go
func TestConfiguration_Estimate(t *testing.T)
```

### <a id="TestConfiguration_Schedule" href="#TestConfiguration_Schedule">func TestConfiguration_Schedule(t *testing.T)</a>

```
searchKey: window.TestConfiguration_Schedule
tags: [private]
```

```Go
func TestConfiguration_Schedule(t *testing.T)
```

### <a id="TestConfiguration_currentFor" href="#TestConfiguration_currentFor">func TestConfiguration_currentFor(t *testing.T)</a>

```
searchKey: window.TestConfiguration_currentFor
tags: [private]
```

```Go
func TestConfiguration_currentFor(t *testing.T)
```

### <a id="TestParseConfiguration" href="#TestParseConfiguration">func TestParseConfiguration(t *testing.T)</a>

```
searchKey: window.TestParseConfiguration
tags: [private]
```

```Go
func TestParseConfiguration(t *testing.T)
```

### <a id="TestParseRateUnit" href="#TestParseRateUnit">func TestParseRateUnit(t *testing.T)</a>

```
searchKey: window.TestParseRateUnit
tags: [private]
```

```Go
func TestParseRateUnit(t *testing.T)
```

### <a id="TestParseRate" href="#TestParseRate">func TestParseRate(t *testing.T)</a>

```
searchKey: window.TestParseRate
tags: [private]
```

```Go
func TestParseRate(t *testing.T)
```

### <a id="TestRateUnit_AsDuration" href="#TestRateUnit_AsDuration">func TestRateUnit_AsDuration(t *testing.T)</a>

```
searchKey: window.TestRateUnit_AsDuration
tags: [private]
```

```Go
func TestRateUnit_AsDuration(t *testing.T)
```

### <a id="TestScheduleLimited" href="#TestScheduleLimited">func TestScheduleLimited(t *testing.T)</a>

```
searchKey: window.TestScheduleLimited
tags: [private]
```

```Go
func TestScheduleLimited(t *testing.T)
```

### <a id="TestScheduleUnlimited" href="#TestScheduleUnlimited">func TestScheduleUnlimited(t *testing.T)</a>

```
searchKey: window.TestScheduleUnlimited
tags: [private]
```

```Go
func TestScheduleUnlimited(t *testing.T)
```

### <a id="TestScheduleZero" href="#TestScheduleZero">func TestScheduleZero(t *testing.T)</a>

```
searchKey: window.TestScheduleZero
tags: [private]
```

```Go
func TestScheduleZero(t *testing.T)
```

### <a id="TestTimeOfDay" href="#TestTimeOfDay">func TestTimeOfDay(t *testing.T)</a>

```
searchKey: window.TestTimeOfDay
tags: [private]
```

```Go
func TestTimeOfDay(t *testing.T)
```

### <a id="TestWeekday_All" href="#TestWeekday_All">func TestWeekday_All(t *testing.T)</a>

```
searchKey: window.TestWeekday_All
tags: [private]
```

```Go
func TestWeekday_All(t *testing.T)
```

### <a id="TestWeekday_Includes" href="#TestWeekday_Includes">func TestWeekday_Includes(t *testing.T)</a>

```
searchKey: window.TestWeekday_Includes
tags: [private]
```

```Go
func TestWeekday_Includes(t *testing.T)
```

### <a id="TestWeekdayBitSanity" href="#TestWeekdayBitSanity">func TestWeekdayBitSanity(t *testing.T)</a>

```
searchKey: window.TestWeekdayBitSanity
tags: [private]
```

```Go
func TestWeekdayBitSanity(t *testing.T)
```

### <a id="TestWindow_IsOpen" href="#TestWindow_IsOpen">func TestWindow_IsOpen(t *testing.T)</a>

```
searchKey: window.TestWindow_IsOpen
tags: [private]
```

```Go
func TestWindow_IsOpen(t *testing.T)
```

### <a id="TestWindow_NextOpenAfter" href="#TestWindow_NextOpenAfter">func TestWindow_NextOpenAfter(t *testing.T)</a>

```
searchKey: window.TestWindow_NextOpenAfter
tags: [private]
```

```Go
func TestWindow_NextOpenAfter(t *testing.T)
```

### <a id="TestParseWindowTime" href="#TestParseWindowTime">func TestParseWindowTime(t *testing.T)</a>

```
searchKey: window.TestParseWindowTime
tags: [private]
```

```Go
func TestParseWindowTime(t *testing.T)
```

### <a id="TestParseWeekday" href="#TestParseWeekday">func TestParseWeekday(t *testing.T)</a>

```
searchKey: window.TestParseWeekday
tags: [private]
```

```Go
func TestParseWeekday(t *testing.T)
```

### <a id="TestParseWindow" href="#TestParseWindow">func TestParseWindow(t *testing.T)</a>

```
searchKey: window.TestParseWindow
tags: [private]
```

```Go
func TestParseWindow(t *testing.T)
```

