# Package time_test

## Index

* [Constants](#const)
    * [const windowsInaccuracy](#windowsInaccuracy)
    * [const unixToZero](#unixToZero)
    * [const minDuration](#minDuration)
    * [const maxDuration](#maxDuration)
* [Variables](#var)
    * [var c](#c)
    * [var nextStdChunkTests](#nextStdChunkTests)
    * [var rfc3339Formats](#rfc3339Formats)
    * [var formatTests](#formatTests)
    * [var goStringTests](#goStringTests)
    * [var parseTests](#parseTests)
    * [var dayOutOfRangeTests](#dayOutOfRangeTests)
    * [var rubyTests](#rubyTests)
    * [var parseTimeZoneTests](#parseTimeZoneTests)
    * [var parseErrorTests](#parseErrorTests)
    * [var secondsTimeZoneOffsetTests](#secondsTimeZoneOffsetTests)
    * [var monthOutOfRangeTests](#monthOutOfRangeTests)
    * [var monotonicStringTests](#monotonicStringTests)
    * [var slots](#slots)
    * [var utctests](#utctests)
    * [var nanoutctests](#nanoutctests)
    * [var localtests](#localtests)
    * [var nanolocaltests](#nanolocaltests)
    * [var truncateRoundTests](#truncateRoundTests)
    * [var isoWeekTests](#isoWeekTests)
    * [var yearDayTests](#yearDayTests)
    * [var yearDayLocations](#yearDayLocations)
    * [var durationTests](#durationTests)
    * [var dateTests](#dateTests)
    * [var addDateTests](#addDateTests)
    * [var daysInTests](#daysInTests)
    * [var gobTests](#gobTests)
    * [var invalidEncodingTests](#invalidEncodingTests)
    * [var notEncodableTimes](#notEncodableTimes)
    * [var jsonTests](#jsonTests)
    * [var notJSONEncodableTimes](#notJSONEncodableTimes)
    * [var parseDurationTests](#parseDurationTests)
    * [var parseDurationErrorTests](#parseDurationErrorTests)
    * [var t](#t)
    * [var u](#u)
    * [var mallocTest](#mallocTest)
    * [var subTests](#subTests)
    * [var nsDurationTests](#nsDurationTests)
    * [var usDurationTests](#usDurationTests)
    * [var msDurationTests](#msDurationTests)
    * [var secDurationTests](#secDurationTests)
    * [var minDurationTests](#minDurationTests)
    * [var hourDurationTests](#hourDurationTests)
    * [var durationTruncateTests](#durationTruncateTests)
    * [var durationRoundTests](#durationRoundTests)
    * [var defaultLocTests](#defaultLocTests)
    * [var zones](#zones)
    * [var slimTests](#slimTests)
* [Types](#type)
    * [type TimeFormatTest struct](#TimeFormatTest)
    * [type FormatTest struct](#FormatTest)
    * [type ParseTest struct](#ParseTest)
    * [type ParseTimeZoneTest struct](#ParseTimeZoneTest)
    * [type ParseErrorTest struct](#ParseErrorTest)
    * [type SecondsTimeZoneOffsetTest struct](#SecondsTimeZoneOffsetTest)
    * [type afterResult struct](#afterResult)
    * [type parsedTime struct](#parsedTime)
    * [type TimeTest struct](#TimeTest)
    * [type ISOWeekTest struct](#ISOWeekTest)
    * [type YearDayTest struct](#YearDayTest)
* [Functions](#func)
    * [func expensiveCall()](#expensiveCall)
    * [func ExampleDuration()](#ExampleDuration)
    * [func ExampleDuration_Round()](#ExampleDuration_Round)
    * [func ExampleDuration_String()](#ExampleDuration_String)
    * [func ExampleDuration_Truncate()](#ExampleDuration_Truncate)
    * [func ExampleParseDuration()](#ExampleParseDuration)
    * [func ExampleDuration_Hours()](#ExampleDuration_Hours)
    * [func ExampleDuration_Microseconds()](#ExampleDuration_Microseconds)
    * [func ExampleDuration_Milliseconds()](#ExampleDuration_Milliseconds)
    * [func ExampleDuration_Minutes()](#ExampleDuration_Minutes)
    * [func ExampleDuration_Nanoseconds()](#ExampleDuration_Nanoseconds)
    * [func ExampleDuration_Seconds()](#ExampleDuration_Seconds)
    * [func handle(int)](#handle)
    * [func ExampleAfter()](#ExampleAfter)
    * [func ExampleSleep()](#ExampleSleep)
    * [func statusUpdate() string](#statusUpdate)
    * [func ExampleTick()](#ExampleTick)
    * [func ExampleMonth()](#ExampleMonth)
    * [func ExampleDate()](#ExampleDate)
    * [func ExampleNewTicker()](#ExampleNewTicker)
    * [func ExampleTime_Format()](#ExampleTime_Format)
    * [func ExampleTime_Format_pad()](#ExampleTime_Format_pad)
    * [func ExampleParse()](#ExampleParse)
    * [func ExampleParseInLocation()](#ExampleParseInLocation)
    * [func ExampleTime_Unix()](#ExampleTime_Unix)
    * [func ExampleTime_Round()](#ExampleTime_Round)
    * [func ExampleTime_Truncate()](#ExampleTime_Truncate)
    * [func ExampleLoadLocation()](#ExampleLoadLocation)
    * [func ExampleLocation()](#ExampleLocation)
    * [func ExampleTime_Add()](#ExampleTime_Add)
    * [func ExampleTime_AddDate()](#ExampleTime_AddDate)
    * [func ExampleTime_After()](#ExampleTime_After)
    * [func ExampleTime_Before()](#ExampleTime_Before)
    * [func ExampleTime_Date()](#ExampleTime_Date)
    * [func ExampleTime_Day()](#ExampleTime_Day)
    * [func ExampleTime_Equal()](#ExampleTime_Equal)
    * [func ExampleTime_String()](#ExampleTime_String)
    * [func ExampleTime_Sub()](#ExampleTime_Sub)
    * [func ExampleTime_AppendFormat()](#ExampleTime_AppendFormat)
    * [func ExampleFixedZone()](#ExampleFixedZone)
    * [func TestNextStdChunk(t *testing.T)](#TestNextStdChunk)
    * [func TestRFC3339Conversion(t *testing.T)](#TestRFC3339Conversion)
    * [func TestFormat(t *testing.T)](#TestFormat)
    * [func TestGoString(t *testing.T)](#TestGoString)
    * [func TestFormatSingleDigits(t *testing.T)](#TestFormatSingleDigits)
    * [func TestFormatShortYear(t *testing.T)](#TestFormatShortYear)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestParseDayOutOfRange(t *testing.T)](#TestParseDayOutOfRange)
    * [func TestParseInLocation(t *testing.T)](#TestParseInLocation)
    * [func TestLoadLocationZipFile(t *testing.T)](#TestLoadLocationZipFile)
    * [func TestRubyParse(t *testing.T)](#TestRubyParse)
    * [func checkTime(time Time, test *ParseTest, t *testing.T)](#checkTime)
    * [func TestFormatAndParse(t *testing.T)](#TestFormatAndParse)
    * [func TestParseTimeZone(t *testing.T)](#TestParseTimeZone)
    * [func TestParseErrors(t *testing.T)](#TestParseErrors)
    * [func TestNoonIs12PM(t *testing.T)](#TestNoonIs12PM)
    * [func TestMidnightIs12AM(t *testing.T)](#TestMidnightIs12AM)
    * [func Test12PMIsNoon(t *testing.T)](#Test12PMIsNoon)
    * [func Test12AMIsMidnight(t *testing.T)](#Test12AMIsMidnight)
    * [func TestMissingZone(t *testing.T)](#TestMissingZone)
    * [func TestMinutesInTimeZone(t *testing.T)](#TestMinutesInTimeZone)
    * [func TestParseSecondsInTimeZone(t *testing.T)](#TestParseSecondsInTimeZone)
    * [func TestFormatSecondsInTimeZone(t *testing.T)](#TestFormatSecondsInTimeZone)
    * [func TestUnderscoreTwoThousand(t *testing.T)](#TestUnderscoreTwoThousand)
    * [func TestStd0xParseError(t *testing.T)](#TestStd0xParseError)
    * [func TestParseMonthOutOfRange(t *testing.T)](#TestParseMonthOutOfRange)
    * [func TestParseYday(t *testing.T)](#TestParseYday)
    * [func TestQuote(t *testing.T)](#TestQuote)
    * [func TestHasMonotonicClock(t *testing.T)](#TestHasMonotonicClock)
    * [func TestMonotonicAdd(t *testing.T)](#TestMonotonicAdd)
    * [func TestMonotonicSub(t *testing.T)](#TestMonotonicSub)
    * [func TestMonotonicOverflow(t *testing.T)](#TestMonotonicOverflow)
    * [func TestMonotonicString(t *testing.T)](#TestMonotonicString)
    * [func TestSleep(t *testing.T)](#TestSleep)
    * [func TestAfterFunc(t *testing.T)](#TestAfterFunc)
    * [func TestAfterStress(t *testing.T)](#TestAfterStress)
    * [func benchmark(b *testing.B, bench func(n int))](#benchmark)
    * [func BenchmarkAfterFunc(b *testing.B)](#BenchmarkAfterFunc)
    * [func BenchmarkAfter(b *testing.B)](#BenchmarkAfter)
    * [func BenchmarkStop(b *testing.B)](#BenchmarkStop)
    * [func BenchmarkSimultaneousAfterFunc(b *testing.B)](#BenchmarkSimultaneousAfterFunc)
    * [func BenchmarkStartStop(b *testing.B)](#BenchmarkStartStop)
    * [func BenchmarkReset(b *testing.B)](#BenchmarkReset)
    * [func BenchmarkSleep(b *testing.B)](#BenchmarkSleep)
    * [func TestAfter(t *testing.T)](#TestAfter)
    * [func TestAfterTick(t *testing.T)](#TestAfterTick)
    * [func TestAfterStop(t *testing.T)](#TestAfterStop)
    * [func TestAfterQueuing(t *testing.T)](#TestAfterQueuing)
    * [func await(slot int, result chan<- afterResult, ac <-chan Time)](#await)
    * [func testAfterQueuing(delta Duration) error](#testAfterQueuing)
    * [func TestTimerStopStress(t *testing.T)](#TestTimerStopStress)
    * [func TestSleepZeroDeadlock(t *testing.T)](#TestSleepZeroDeadlock)
    * [func testReset(d Duration) error](#testReset)
    * [func TestReset(t *testing.T)](#TestReset)
    * [func TestOverflowSleep(t *testing.T)](#TestOverflowSleep)
    * [func TestIssue5745(t *testing.T)](#TestIssue5745)
    * [func TestOverflowPeriodRuntimeTimer(t *testing.T)](#TestOverflowPeriodRuntimeTimer)
    * [func checkZeroPanicString(t *testing.T)](#checkZeroPanicString)
    * [func TestZeroTimerResetPanics(t *testing.T)](#TestZeroTimerResetPanics)
    * [func TestZeroTimerStopPanics(t *testing.T)](#TestZeroTimerStopPanics)
    * [func TestZeroTimer(t *testing.T)](#TestZeroTimer)
    * [func BenchmarkParallelTimerLatency(b *testing.B)](#BenchmarkParallelTimerLatency)
    * [func BenchmarkStaggeredTickerLatency(b *testing.B)](#BenchmarkStaggeredTickerLatency)
    * [func warmupScheduler(targetThreadCount int)](#warmupScheduler)
    * [func doWork(dur Duration)](#doWork)
    * [func TestTicker(t *testing.T)](#TestTicker)
    * [func TestTickerStopWithDirectInitialization(t *testing.T)](#TestTickerStopWithDirectInitialization)
    * [func TestTeardown(t *testing.T)](#TestTeardown)
    * [func TestTick(t *testing.T)](#TestTick)
    * [func TestNewTickerLtZeroDuration(t *testing.T)](#TestNewTickerLtZeroDuration)
    * [func BenchmarkTicker(b *testing.B)](#BenchmarkTicker)
    * [func BenchmarkTickerReset(b *testing.B)](#BenchmarkTickerReset)
    * [func BenchmarkTickerResetNaive(b *testing.B)](#BenchmarkTickerResetNaive)
    * [func TestZoneData(t *testing.T)](#TestZoneData)
    * [func same(t Time, u *parsedTime) bool](#same)
    * [func TestSecondsToUTC(t *testing.T)](#TestSecondsToUTC)
    * [func TestNanosecondsToUTC(t *testing.T)](#TestNanosecondsToUTC)
    * [func TestSecondsToLocalTime(t *testing.T)](#TestSecondsToLocalTime)
    * [func TestNanosecondsToLocalTime(t *testing.T)](#TestNanosecondsToLocalTime)
    * [func TestSecondsToUTCAndBack(t *testing.T)](#TestSecondsToUTCAndBack)
    * [func TestNanosecondsToUTCAndBack(t *testing.T)](#TestNanosecondsToUTCAndBack)
    * [func TestUnixMilli(t *testing.T)](#TestUnixMilli)
    * [func TestUnixMicro(t *testing.T)](#TestUnixMicro)
    * [func abs(t Time) (sec, nsec int64)](#abs)
    * [func absString(t Time) string](#absString)
    * [func TestTruncateRound(t *testing.T)](#TestTruncateRound)
    * [func TestISOWeek(t *testing.T)](#TestISOWeek)
    * [func TestYearDay(t *testing.T)](#TestYearDay)
    * [func TestDurationString(t *testing.T)](#TestDurationString)
    * [func TestDate(t *testing.T)](#TestDate)
    * [func TestAddDate(t *testing.T)](#TestAddDate)
    * [func TestDaysIn(t *testing.T)](#TestDaysIn)
    * [func TestAddToExactSecond(t *testing.T)](#TestAddToExactSecond)
    * [func equalTimeAndZone(a, b Time) bool](#equalTimeAndZone)
    * [func TestTimeGob(t *testing.T)](#TestTimeGob)
    * [func TestInvalidTimeGob(t *testing.T)](#TestInvalidTimeGob)
    * [func TestNotGobEncodableTime(t *testing.T)](#TestNotGobEncodableTime)
    * [func TestTimeJSON(t *testing.T)](#TestTimeJSON)
    * [func TestInvalidTimeJSON(t *testing.T)](#TestInvalidTimeJSON)
    * [func TestNotJSONEncodableTime(t *testing.T)](#TestNotJSONEncodableTime)
    * [func TestParseDuration(t *testing.T)](#TestParseDuration)
    * [func TestParseDurationErrors(t *testing.T)](#TestParseDurationErrors)
    * [func TestParseDurationRoundTrip(t *testing.T)](#TestParseDurationRoundTrip)
    * [func TestLocationRace(t *testing.T)](#TestLocationRace)
    * [func TestCountMallocs(t *testing.T)](#TestCountMallocs)
    * [func TestLoadFixed(t *testing.T)](#TestLoadFixed)
    * [func TestSub(t *testing.T)](#TestSub)
    * [func TestDurationNanoseconds(t *testing.T)](#TestDurationNanoseconds)
    * [func TestDurationMicroseconds(t *testing.T)](#TestDurationMicroseconds)
    * [func TestDurationMilliseconds(t *testing.T)](#TestDurationMilliseconds)
    * [func TestDurationSeconds(t *testing.T)](#TestDurationSeconds)
    * [func TestDurationMinutes(t *testing.T)](#TestDurationMinutes)
    * [func TestDurationHours(t *testing.T)](#TestDurationHours)
    * [func TestDurationTruncate(t *testing.T)](#TestDurationTruncate)
    * [func TestDurationRound(t *testing.T)](#TestDurationRound)
    * [func TestDefaultLoc(t *testing.T)](#TestDefaultLoc)
    * [func BenchmarkNow(b *testing.B)](#BenchmarkNow)
    * [func BenchmarkNowUnixNano(b *testing.B)](#BenchmarkNowUnixNano)
    * [func BenchmarkNowUnixMilli(b *testing.B)](#BenchmarkNowUnixMilli)
    * [func BenchmarkNowUnixMicro(b *testing.B)](#BenchmarkNowUnixMicro)
    * [func BenchmarkFormat(b *testing.B)](#BenchmarkFormat)
    * [func BenchmarkFormatNow(b *testing.B)](#BenchmarkFormatNow)
    * [func BenchmarkMarshalJSON(b *testing.B)](#BenchmarkMarshalJSON)
    * [func BenchmarkMarshalText(b *testing.B)](#BenchmarkMarshalText)
    * [func BenchmarkParse(b *testing.B)](#BenchmarkParse)
    * [func BenchmarkParseDuration(b *testing.B)](#BenchmarkParseDuration)
    * [func BenchmarkHour(b *testing.B)](#BenchmarkHour)
    * [func BenchmarkSecond(b *testing.B)](#BenchmarkSecond)
    * [func BenchmarkYear(b *testing.B)](#BenchmarkYear)
    * [func BenchmarkDay(b *testing.B)](#BenchmarkDay)
    * [func BenchmarkISOWeek(b *testing.B)](#BenchmarkISOWeek)
    * [func TestMarshalBinaryZeroTime(t *testing.T)](#TestMarshalBinaryZeroTime)
    * [func TestZeroMonthString(t *testing.T)](#TestZeroMonthString)
    * [func TestWeekdayString(t *testing.T)](#TestWeekdayString)
    * [func TestReadFileLimit(t *testing.T)](#TestReadFileLimit)
    * [func TestConcurrentTimerReset(t *testing.T)](#TestConcurrentTimerReset)
    * [func TestConcurrentTimerResetStop(t *testing.T)](#TestConcurrentTimerResetStop)
    * [func TestTimeIsDST(t *testing.T)](#TestTimeIsDST)
    * [func TestTimeAddSecOverflow(t *testing.T)](#TestTimeAddSecOverflow)
    * [func TestEmbeddedTZData(t *testing.T)](#TestEmbeddedTZData)
    * [func equal(t *testing.T, f1, f2 reflect.Value) bool](#equal)
    * [func init()](#init)
    * [func TestEnvVarUsage(t *testing.T)](#TestEnvVarUsage)
    * [func TestBadLocationErrMsg(t *testing.T)](#TestBadLocationErrMsg)
    * [func TestLoadLocationValidatesNames(t *testing.T)](#TestLoadLocationValidatesNames)
    * [func TestVersion3(t *testing.T)](#TestVersion3)
    * [func TestFirstZone(t *testing.T)](#TestFirstZone)
    * [func TestLocationNames(t *testing.T)](#TestLocationNames)
    * [func TestLoadLocationFromTZData(t *testing.T)](#TestLoadLocationFromTZData)
    * [func TestEarlyLocation(t *testing.T)](#TestEarlyLocation)
    * [func TestMalformedTZData(t *testing.T)](#TestMalformedTZData)
    * [func TestLoadLocationFromTZDataSlim(t *testing.T)](#TestLoadLocationFromTZDataSlim)
    * [func TestTzset(t *testing.T)](#TestTzset)
    * [func TestTzsetName(t *testing.T)](#TestTzsetName)
    * [func TestTzsetOffset(t *testing.T)](#TestTzsetOffset)
    * [func TestTzsetRule(t *testing.T)](#TestTzsetRule)
    * [func TestEnvTZUsage(t *testing.T)](#TestEnvTZUsage)


## <a id="const" href="#const">Constants</a>

### <a id="windowsInaccuracy" href="#windowsInaccuracy">const windowsInaccuracy</a>

```
searchKey: time_test.windowsInaccuracy
```

```Go
const windowsInaccuracy = 17 * Millisecond
```

Go runtime uses different Windows timers for time.Now and sleeping. These can tick at different frequencies and can arrive out of sync. The effect can be seen, for example, as time.Sleep(100ms) is actually shorter then 100ms when measured as difference between time.Now before and after time.Sleep call. This was observed on Windows XP SP3 (windows/386). windowsInaccuracy is to ignore such errors. 

### <a id="unixToZero" href="#unixToZero">const unixToZero</a>

```
searchKey: time_test.unixToZero
```

```Go
const unixToZero = -978307200 + 63113904000
```

The time routines provide no way to get absolute time (seconds since zero), but we need it to compute the right answer for bizarre roundings like "to the nearest 3 ns". Compute as t - year1 = (t - 1970) + (1970 - 2001) + (2001 - 1). t - 1970 is returned by Unix and Nanosecond. 1970 - 2001 is -(31*365+8)*86400 = -978307200 seconds. 2001 - 1 is 2000*365.2425*86400 = 63113904000 seconds. 

### <a id="minDuration" href="#minDuration">const minDuration</a>

```
searchKey: time_test.minDuration
```

```Go
const minDuration Duration = -1 << 63
```

### <a id="maxDuration" href="#maxDuration">const maxDuration</a>

```
searchKey: time_test.maxDuration
```

```Go
const maxDuration Duration = 1<<63 - 1
```

## <a id="var" href="#var">Variables</a>

### <a id="c" href="#c">var c</a>

```
searchKey: time_test.c
```

```Go
var c chan int
```

### <a id="nextStdChunkTests" href="#nextStdChunkTests">var nextStdChunkTests</a>

```
searchKey: time_test.nextStdChunkTests
```

```Go
var nextStdChunkTests = ...
```

### <a id="rfc3339Formats" href="#rfc3339Formats">var rfc3339Formats</a>

```
searchKey: time_test.rfc3339Formats
```

```Go
var rfc3339Formats = ...
```

### <a id="formatTests" href="#formatTests">var formatTests</a>

```
searchKey: time_test.formatTests
```

```Go
var formatTests = ...
```

### <a id="goStringTests" href="#goStringTests">var goStringTests</a>

```
searchKey: time_test.goStringTests
```

```Go
var goStringTests = ...
```

### <a id="parseTests" href="#parseTests">var parseTests</a>

```
searchKey: time_test.parseTests
```

```Go
var parseTests = ...
```

### <a id="dayOutOfRangeTests" href="#dayOutOfRangeTests">var dayOutOfRangeTests</a>

```
searchKey: time_test.dayOutOfRangeTests
```

```Go
var dayOutOfRangeTests = ...
```

All parsed with ANSIC. 

### <a id="rubyTests" href="#rubyTests">var rubyTests</a>

```
searchKey: time_test.rubyTests
```

```Go
var rubyTests = ...
```

### <a id="parseTimeZoneTests" href="#parseTimeZoneTests">var parseTimeZoneTests</a>

```
searchKey: time_test.parseTimeZoneTests
```

```Go
var parseTimeZoneTests = ...
```

### <a id="parseErrorTests" href="#parseErrorTests">var parseErrorTests</a>

```
searchKey: time_test.parseErrorTests
```

```Go
var parseErrorTests = ...
```

### <a id="secondsTimeZoneOffsetTests" href="#secondsTimeZoneOffsetTests">var secondsTimeZoneOffsetTests</a>

```
searchKey: time_test.secondsTimeZoneOffsetTests
```

```Go
var secondsTimeZoneOffsetTests = ...
```

### <a id="monthOutOfRangeTests" href="#monthOutOfRangeTests">var monthOutOfRangeTests</a>

```
searchKey: time_test.monthOutOfRangeTests
```

```Go
var monthOutOfRangeTests = ...
```

### <a id="monotonicStringTests" href="#monotonicStringTests">var monotonicStringTests</a>

```
searchKey: time_test.monotonicStringTests
```

```Go
var monotonicStringTests = ...
```

### <a id="slots" href="#slots">var slots</a>

```
searchKey: time_test.slots
```

```Go
var slots = []int{5, 3, 6, 6, 6, 1, 1, 2, 7, 9, 4, 8, 0}
```

### <a id="utctests" href="#utctests">var utctests</a>

```
searchKey: time_test.utctests
```

```Go
var utctests = ...
```

### <a id="nanoutctests" href="#nanoutctests">var nanoutctests</a>

```
searchKey: time_test.nanoutctests
```

```Go
var nanoutctests = ...
```

### <a id="localtests" href="#localtests">var localtests</a>

```
searchKey: time_test.localtests
```

```Go
var localtests = ...
```

### <a id="nanolocaltests" href="#nanolocaltests">var nanolocaltests</a>

```
searchKey: time_test.nanolocaltests
```

```Go
var nanolocaltests = ...
```

### <a id="truncateRoundTests" href="#truncateRoundTests">var truncateRoundTests</a>

```
searchKey: time_test.truncateRoundTests
```

```Go
var truncateRoundTests = ...
```

### <a id="isoWeekTests" href="#isoWeekTests">var isoWeekTests</a>

```
searchKey: time_test.isoWeekTests
```

```Go
var isoWeekTests = ...
```

### <a id="yearDayTests" href="#yearDayTests">var yearDayTests</a>

```
searchKey: time_test.yearDayTests
```

```Go
var yearDayTests = ...
```

Test YearDay in several different scenarios and corner cases 

### <a id="yearDayLocations" href="#yearDayLocations">var yearDayLocations</a>

```
searchKey: time_test.yearDayLocations
```

```Go
var yearDayLocations = ...
```

Check to see if YearDay is location sensitive 

### <a id="durationTests" href="#durationTests">var durationTests</a>

```
searchKey: time_test.durationTests
```

```Go
var durationTests = ...
```

### <a id="dateTests" href="#dateTests">var dateTests</a>

```
searchKey: time_test.dateTests
```

```Go
var dateTests = ...
```

### <a id="addDateTests" href="#addDateTests">var addDateTests</a>

```
searchKey: time_test.addDateTests
```

```Go
var addDateTests = ...
```

Several ways of getting from Fri Nov 18 7:56:35 PST 2011 to Thu Mar 19 7:56:35 PST 2016 

### <a id="daysInTests" href="#daysInTests">var daysInTests</a>

```
searchKey: time_test.daysInTests
```

```Go
var daysInTests = ...
```

### <a id="gobTests" href="#gobTests">var gobTests</a>

```
searchKey: time_test.gobTests
```

```Go
var gobTests = ...
```

### <a id="invalidEncodingTests" href="#invalidEncodingTests">var invalidEncodingTests</a>

```
searchKey: time_test.invalidEncodingTests
```

```Go
var invalidEncodingTests = ...
```

### <a id="notEncodableTimes" href="#notEncodableTimes">var notEncodableTimes</a>

```
searchKey: time_test.notEncodableTimes
```

```Go
var notEncodableTimes = ...
```

### <a id="jsonTests" href="#jsonTests">var jsonTests</a>

```
searchKey: time_test.jsonTests
```

```Go
var jsonTests = ...
```

### <a id="notJSONEncodableTimes" href="#notJSONEncodableTimes">var notJSONEncodableTimes</a>

```
searchKey: time_test.notJSONEncodableTimes
```

```Go
var notJSONEncodableTimes = ...
```

### <a id="parseDurationTests" href="#parseDurationTests">var parseDurationTests</a>

```
searchKey: time_test.parseDurationTests
```

```Go
var parseDurationTests = ...
```

### <a id="parseDurationErrorTests" href="#parseDurationErrorTests">var parseDurationErrorTests</a>

```
searchKey: time_test.parseDurationErrorTests
```

```Go
var parseDurationErrorTests = ...
```

### <a id="t" href="#t">var t</a>

```
searchKey: time_test.t
```

```Go
var t Time
```

### <a id="u" href="#u">var u</a>

```
searchKey: time_test.u
```

```Go
var u int64
```

### <a id="mallocTest" href="#mallocTest">var mallocTest</a>

```
searchKey: time_test.mallocTest
```

```Go
var mallocTest = ...
```

### <a id="subTests" href="#subTests">var subTests</a>

```
searchKey: time_test.subTests
```

```Go
var subTests = ...
```

### <a id="nsDurationTests" href="#nsDurationTests">var nsDurationTests</a>

```
searchKey: time_test.nsDurationTests
```

```Go
var nsDurationTests = ...
```

### <a id="usDurationTests" href="#usDurationTests">var usDurationTests</a>

```
searchKey: time_test.usDurationTests
```

```Go
var usDurationTests = ...
```

### <a id="msDurationTests" href="#msDurationTests">var msDurationTests</a>

```
searchKey: time_test.msDurationTests
```

```Go
var msDurationTests = ...
```

### <a id="secDurationTests" href="#secDurationTests">var secDurationTests</a>

```
searchKey: time_test.secDurationTests
```

```Go
var secDurationTests = []struct {
	d    Duration
	want float64
}{
	{Duration(300000000), 0.3},
}
```

### <a id="minDurationTests" href="#minDurationTests">var minDurationTests</a>

```
searchKey: time_test.minDurationTests
```

```Go
var minDurationTests = ...
```

### <a id="hourDurationTests" href="#hourDurationTests">var hourDurationTests</a>

```
searchKey: time_test.hourDurationTests
```

```Go
var hourDurationTests = ...
```

### <a id="durationTruncateTests" href="#durationTruncateTests">var durationTruncateTests</a>

```
searchKey: time_test.durationTruncateTests
```

```Go
var durationTruncateTests = ...
```

### <a id="durationRoundTests" href="#durationRoundTests">var durationRoundTests</a>

```
searchKey: time_test.durationRoundTests
```

```Go
var durationRoundTests = ...
```

### <a id="defaultLocTests" href="#defaultLocTests">var defaultLocTests</a>

```
searchKey: time_test.defaultLocTests
```

```Go
var defaultLocTests = ...
```

### <a id="zones" href="#zones">var zones</a>

```
searchKey: time_test.zones
```

```Go
var zones = []string{
	"Asia/Jerusalem",
	"America/Los_Angeles",
}
```

### <a id="slimTests" href="#slimTests">var slimTests</a>

```
searchKey: time_test.slimTests
```

```Go
var slimTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="TimeFormatTest" href="#TimeFormatTest">type TimeFormatTest struct</a>

```
searchKey: time_test.TimeFormatTest
```

```Go
type TimeFormatTest struct {
	time           Time
	formattedValue string
}
```

### <a id="FormatTest" href="#FormatTest">type FormatTest struct</a>

```
searchKey: time_test.FormatTest
```

```Go
type FormatTest struct {
	name   string
	format string
	result string
}
```

### <a id="ParseTest" href="#ParseTest">type ParseTest struct</a>

```
searchKey: time_test.ParseTest
```

```Go
type ParseTest struct {
	name       string
	format     string
	value      string
	hasTZ      bool // contains a time zone
	hasWD      bool // contains a weekday
	yearSign   int  // sign of year, -1 indicates the year is not present in the format
	fracDigits int  // number of digits of fractional second
}
```

### <a id="ParseTimeZoneTest" href="#ParseTimeZoneTest">type ParseTimeZoneTest struct</a>

```
searchKey: time_test.ParseTimeZoneTest
```

```Go
type ParseTimeZoneTest struct {
	value  string
	length int
	ok     bool
}
```

### <a id="ParseErrorTest" href="#ParseErrorTest">type ParseErrorTest struct</a>

```
searchKey: time_test.ParseErrorTest
```

```Go
type ParseErrorTest struct {
	format string
	value  string
	expect string // must appear within the error
}
```

### <a id="SecondsTimeZoneOffsetTest" href="#SecondsTimeZoneOffsetTest">type SecondsTimeZoneOffsetTest struct</a>

```
searchKey: time_test.SecondsTimeZoneOffsetTest
```

```Go
type SecondsTimeZoneOffsetTest struct {
	format         string
	value          string
	expectedoffset int
}
```

### <a id="afterResult" href="#afterResult">type afterResult struct</a>

```
searchKey: time_test.afterResult
```

```Go
type afterResult struct {
	slot int
	t    Time
}
```

### <a id="parsedTime" href="#parsedTime">type parsedTime struct</a>

```
searchKey: time_test.parsedTime
```

```Go
type parsedTime struct {
	Year                 int
	Month                Month
	Day                  int
	Hour, Minute, Second int // 15:04:05 is 15, 4, 5.
	Nanosecond           int // Fractional second.
	Weekday              Weekday
	ZoneOffset           int    // seconds east of UTC, e.g. -7*60*60 for -0700
	Zone                 string // e.g., "MST"
}
```

parsedTime is the struct representing a parsed time value. 

### <a id="TimeTest" href="#TimeTest">type TimeTest struct</a>

```
searchKey: time_test.TimeTest
```

```Go
type TimeTest struct {
	seconds int64
	golden  parsedTime
}
```

### <a id="ISOWeekTest" href="#ISOWeekTest">type ISOWeekTest struct</a>

```
searchKey: time_test.ISOWeekTest
```

```Go
type ISOWeekTest struct {
	year       int // year
	month, day int // month and day
	yex        int // expected year
	wex        int // expected week
}
```

### <a id="YearDayTest" href="#YearDayTest">type YearDayTest struct</a>

```
searchKey: time_test.YearDayTest
```

```Go
type YearDayTest struct {
	year, month, day int
	yday             int
}
```

## <a id="func" href="#func">Functions</a>

### <a id="expensiveCall" href="#expensiveCall">func expensiveCall()</a>

```
searchKey: time_test.expensiveCall
```

```Go
func expensiveCall()
```

### <a id="ExampleDuration" href="#ExampleDuration">func ExampleDuration()</a>

```
searchKey: time_test.ExampleDuration
```

```Go
func ExampleDuration()
```

### <a id="ExampleDuration_Round" href="#ExampleDuration_Round">func ExampleDuration_Round()</a>

```
searchKey: time_test.ExampleDuration_Round
```

```Go
func ExampleDuration_Round()
```

### <a id="ExampleDuration_String" href="#ExampleDuration_String">func ExampleDuration_String()</a>

```
searchKey: time_test.ExampleDuration_String
```

```Go
func ExampleDuration_String()
```

### <a id="ExampleDuration_Truncate" href="#ExampleDuration_Truncate">func ExampleDuration_Truncate()</a>

```
searchKey: time_test.ExampleDuration_Truncate
```

```Go
func ExampleDuration_Truncate()
```

### <a id="ExampleParseDuration" href="#ExampleParseDuration">func ExampleParseDuration()</a>

```
searchKey: time_test.ExampleParseDuration
```

```Go
func ExampleParseDuration()
```

### <a id="ExampleDuration_Hours" href="#ExampleDuration_Hours">func ExampleDuration_Hours()</a>

```
searchKey: time_test.ExampleDuration_Hours
```

```Go
func ExampleDuration_Hours()
```

### <a id="ExampleDuration_Microseconds" href="#ExampleDuration_Microseconds">func ExampleDuration_Microseconds()</a>

```
searchKey: time_test.ExampleDuration_Microseconds
```

```Go
func ExampleDuration_Microseconds()
```

### <a id="ExampleDuration_Milliseconds" href="#ExampleDuration_Milliseconds">func ExampleDuration_Milliseconds()</a>

```
searchKey: time_test.ExampleDuration_Milliseconds
```

```Go
func ExampleDuration_Milliseconds()
```

### <a id="ExampleDuration_Minutes" href="#ExampleDuration_Minutes">func ExampleDuration_Minutes()</a>

```
searchKey: time_test.ExampleDuration_Minutes
```

```Go
func ExampleDuration_Minutes()
```

### <a id="ExampleDuration_Nanoseconds" href="#ExampleDuration_Nanoseconds">func ExampleDuration_Nanoseconds()</a>

```
searchKey: time_test.ExampleDuration_Nanoseconds
```

```Go
func ExampleDuration_Nanoseconds()
```

### <a id="ExampleDuration_Seconds" href="#ExampleDuration_Seconds">func ExampleDuration_Seconds()</a>

```
searchKey: time_test.ExampleDuration_Seconds
```

```Go
func ExampleDuration_Seconds()
```

### <a id="handle" href="#handle">func handle(int)</a>

```
searchKey: time_test.handle
```

```Go
func handle(int)
```

### <a id="ExampleAfter" href="#ExampleAfter">func ExampleAfter()</a>

```
searchKey: time_test.ExampleAfter
```

```Go
func ExampleAfter()
```

### <a id="ExampleSleep" href="#ExampleSleep">func ExampleSleep()</a>

```
searchKey: time_test.ExampleSleep
```

```Go
func ExampleSleep()
```

### <a id="statusUpdate" href="#statusUpdate">func statusUpdate() string</a>

```
searchKey: time_test.statusUpdate
```

```Go
func statusUpdate() string
```

### <a id="ExampleTick" href="#ExampleTick">func ExampleTick()</a>

```
searchKey: time_test.ExampleTick
```

```Go
func ExampleTick()
```

### <a id="ExampleMonth" href="#ExampleMonth">func ExampleMonth()</a>

```
searchKey: time_test.ExampleMonth
```

```Go
func ExampleMonth()
```

### <a id="ExampleDate" href="#ExampleDate">func ExampleDate()</a>

```
searchKey: time_test.ExampleDate
```

```Go
func ExampleDate()
```

### <a id="ExampleNewTicker" href="#ExampleNewTicker">func ExampleNewTicker()</a>

```
searchKey: time_test.ExampleNewTicker
```

```Go
func ExampleNewTicker()
```

### <a id="ExampleTime_Format" href="#ExampleTime_Format">func ExampleTime_Format()</a>

```
searchKey: time_test.ExampleTime_Format
```

```Go
func ExampleTime_Format()
```

### <a id="ExampleTime_Format_pad" href="#ExampleTime_Format_pad">func ExampleTime_Format_pad()</a>

```
searchKey: time_test.ExampleTime_Format_pad
```

```Go
func ExampleTime_Format_pad()
```

### <a id="ExampleParse" href="#ExampleParse">func ExampleParse()</a>

```
searchKey: time_test.ExampleParse
```

```Go
func ExampleParse()
```

### <a id="ExampleParseInLocation" href="#ExampleParseInLocation">func ExampleParseInLocation()</a>

```
searchKey: time_test.ExampleParseInLocation
```

```Go
func ExampleParseInLocation()
```

### <a id="ExampleTime_Unix" href="#ExampleTime_Unix">func ExampleTime_Unix()</a>

```
searchKey: time_test.ExampleTime_Unix
```

```Go
func ExampleTime_Unix()
```

### <a id="ExampleTime_Round" href="#ExampleTime_Round">func ExampleTime_Round()</a>

```
searchKey: time_test.ExampleTime_Round
```

```Go
func ExampleTime_Round()
```

### <a id="ExampleTime_Truncate" href="#ExampleTime_Truncate">func ExampleTime_Truncate()</a>

```
searchKey: time_test.ExampleTime_Truncate
```

```Go
func ExampleTime_Truncate()
```

### <a id="ExampleLoadLocation" href="#ExampleLoadLocation">func ExampleLoadLocation()</a>

```
searchKey: time_test.ExampleLoadLocation
```

```Go
func ExampleLoadLocation()
```

### <a id="ExampleLocation" href="#ExampleLocation">func ExampleLocation()</a>

```
searchKey: time_test.ExampleLocation
```

```Go
func ExampleLocation()
```

### <a id="ExampleTime_Add" href="#ExampleTime_Add">func ExampleTime_Add()</a>

```
searchKey: time_test.ExampleTime_Add
```

```Go
func ExampleTime_Add()
```

### <a id="ExampleTime_AddDate" href="#ExampleTime_AddDate">func ExampleTime_AddDate()</a>

```
searchKey: time_test.ExampleTime_AddDate
```

```Go
func ExampleTime_AddDate()
```

### <a id="ExampleTime_After" href="#ExampleTime_After">func ExampleTime_After()</a>

```
searchKey: time_test.ExampleTime_After
```

```Go
func ExampleTime_After()
```

### <a id="ExampleTime_Before" href="#ExampleTime_Before">func ExampleTime_Before()</a>

```
searchKey: time_test.ExampleTime_Before
```

```Go
func ExampleTime_Before()
```

### <a id="ExampleTime_Date" href="#ExampleTime_Date">func ExampleTime_Date()</a>

```
searchKey: time_test.ExampleTime_Date
```

```Go
func ExampleTime_Date()
```

### <a id="ExampleTime_Day" href="#ExampleTime_Day">func ExampleTime_Day()</a>

```
searchKey: time_test.ExampleTime_Day
```

```Go
func ExampleTime_Day()
```

### <a id="ExampleTime_Equal" href="#ExampleTime_Equal">func ExampleTime_Equal()</a>

```
searchKey: time_test.ExampleTime_Equal
```

```Go
func ExampleTime_Equal()
```

### <a id="ExampleTime_String" href="#ExampleTime_String">func ExampleTime_String()</a>

```
searchKey: time_test.ExampleTime_String
```

```Go
func ExampleTime_String()
```

### <a id="ExampleTime_Sub" href="#ExampleTime_Sub">func ExampleTime_Sub()</a>

```
searchKey: time_test.ExampleTime_Sub
```

```Go
func ExampleTime_Sub()
```

### <a id="ExampleTime_AppendFormat" href="#ExampleTime_AppendFormat">func ExampleTime_AppendFormat()</a>

```
searchKey: time_test.ExampleTime_AppendFormat
```

```Go
func ExampleTime_AppendFormat()
```

### <a id="ExampleFixedZone" href="#ExampleFixedZone">func ExampleFixedZone()</a>

```
searchKey: time_test.ExampleFixedZone
```

```Go
func ExampleFixedZone()
```

### <a id="TestNextStdChunk" href="#TestNextStdChunk">func TestNextStdChunk(t *testing.T)</a>

```
searchKey: time_test.TestNextStdChunk
```

```Go
func TestNextStdChunk(t *testing.T)
```

### <a id="TestRFC3339Conversion" href="#TestRFC3339Conversion">func TestRFC3339Conversion(t *testing.T)</a>

```
searchKey: time_test.TestRFC3339Conversion
```

```Go
func TestRFC3339Conversion(t *testing.T)
```

### <a id="TestFormat" href="#TestFormat">func TestFormat(t *testing.T)</a>

```
searchKey: time_test.TestFormat
```

```Go
func TestFormat(t *testing.T)
```

### <a id="TestGoString" href="#TestGoString">func TestGoString(t *testing.T)</a>

```
searchKey: time_test.TestGoString
```

```Go
func TestGoString(t *testing.T)
```

### <a id="TestFormatSingleDigits" href="#TestFormatSingleDigits">func TestFormatSingleDigits(t *testing.T)</a>

```
searchKey: time_test.TestFormatSingleDigits
```

```Go
func TestFormatSingleDigits(t *testing.T)
```

issue 12440. 

### <a id="TestFormatShortYear" href="#TestFormatShortYear">func TestFormatShortYear(t *testing.T)</a>

```
searchKey: time_test.TestFormatShortYear
```

```Go
func TestFormatShortYear(t *testing.T)
```

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: time_test.TestParse
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestParseDayOutOfRange" href="#TestParseDayOutOfRange">func TestParseDayOutOfRange(t *testing.T)</a>

```
searchKey: time_test.TestParseDayOutOfRange
```

```Go
func TestParseDayOutOfRange(t *testing.T)
```

### <a id="TestParseInLocation" href="#TestParseInLocation">func TestParseInLocation(t *testing.T)</a>

```
searchKey: time_test.TestParseInLocation
```

```Go
func TestParseInLocation(t *testing.T)
```

TestParseInLocation checks that the Parse and ParseInLocation functions do not get confused by the fact that AST (Arabia Standard Time) and AST (Atlantic Standard Time) are different time zones, even though they have the same abbreviation. 

ICANN has been slowly phasing out invented abbreviation in favor of numeric time zones (for example, the Asia/Baghdad time zone abbreviation got changed from AST to +03 in the 2017a tzdata release); but we still want to make sure that the time package does not get confused on systems with slightly older tzdata packages. 

### <a id="TestLoadLocationZipFile" href="#TestLoadLocationZipFile">func TestLoadLocationZipFile(t *testing.T)</a>

```
searchKey: time_test.TestLoadLocationZipFile
```

```Go
func TestLoadLocationZipFile(t *testing.T)
```

### <a id="TestRubyParse" href="#TestRubyParse">func TestRubyParse(t *testing.T)</a>

```
searchKey: time_test.TestRubyParse
```

```Go
func TestRubyParse(t *testing.T)
```

Problematic time zone format needs special tests. 

### <a id="checkTime" href="#checkTime">func checkTime(time Time, test *ParseTest, t *testing.T)</a>

```
searchKey: time_test.checkTime
```

```Go
func checkTime(time Time, test *ParseTest, t *testing.T)
```

### <a id="TestFormatAndParse" href="#TestFormatAndParse">func TestFormatAndParse(t *testing.T)</a>

```
searchKey: time_test.TestFormatAndParse
```

```Go
func TestFormatAndParse(t *testing.T)
```

### <a id="TestParseTimeZone" href="#TestParseTimeZone">func TestParseTimeZone(t *testing.T)</a>

```
searchKey: time_test.TestParseTimeZone
```

```Go
func TestParseTimeZone(t *testing.T)
```

### <a id="TestParseErrors" href="#TestParseErrors">func TestParseErrors(t *testing.T)</a>

```
searchKey: time_test.TestParseErrors
```

```Go
func TestParseErrors(t *testing.T)
```

### <a id="TestNoonIs12PM" href="#TestNoonIs12PM">func TestNoonIs12PM(t *testing.T)</a>

```
searchKey: time_test.TestNoonIs12PM
```

```Go
func TestNoonIs12PM(t *testing.T)
```

### <a id="TestMidnightIs12AM" href="#TestMidnightIs12AM">func TestMidnightIs12AM(t *testing.T)</a>

```
searchKey: time_test.TestMidnightIs12AM
```

```Go
func TestMidnightIs12AM(t *testing.T)
```

### <a id="Test12PMIsNoon" href="#Test12PMIsNoon">func Test12PMIsNoon(t *testing.T)</a>

```
searchKey: time_test.Test12PMIsNoon
```

```Go
func Test12PMIsNoon(t *testing.T)
```

### <a id="Test12AMIsMidnight" href="#Test12AMIsMidnight">func Test12AMIsMidnight(t *testing.T)</a>

```
searchKey: time_test.Test12AMIsMidnight
```

```Go
func Test12AMIsMidnight(t *testing.T)
```

### <a id="TestMissingZone" href="#TestMissingZone">func TestMissingZone(t *testing.T)</a>

```
searchKey: time_test.TestMissingZone
```

```Go
func TestMissingZone(t *testing.T)
```

Check that a time without a Zone still produces a (numeric) time zone when formatted with MST as a requested zone. 

### <a id="TestMinutesInTimeZone" href="#TestMinutesInTimeZone">func TestMinutesInTimeZone(t *testing.T)</a>

```
searchKey: time_test.TestMinutesInTimeZone
```

```Go
func TestMinutesInTimeZone(t *testing.T)
```

### <a id="TestParseSecondsInTimeZone" href="#TestParseSecondsInTimeZone">func TestParseSecondsInTimeZone(t *testing.T)</a>

```
searchKey: time_test.TestParseSecondsInTimeZone
```

```Go
func TestParseSecondsInTimeZone(t *testing.T)
```

### <a id="TestFormatSecondsInTimeZone" href="#TestFormatSecondsInTimeZone">func TestFormatSecondsInTimeZone(t *testing.T)</a>

```
searchKey: time_test.TestFormatSecondsInTimeZone
```

```Go
func TestFormatSecondsInTimeZone(t *testing.T)
```

### <a id="TestUnderscoreTwoThousand" href="#TestUnderscoreTwoThousand">func TestUnderscoreTwoThousand(t *testing.T)</a>

```
searchKey: time_test.TestUnderscoreTwoThousand
```

```Go
func TestUnderscoreTwoThousand(t *testing.T)
```

Issue 11334. 

### <a id="TestStd0xParseError" href="#TestStd0xParseError">func TestStd0xParseError(t *testing.T)</a>

```
searchKey: time_test.TestStd0xParseError
```

```Go
func TestStd0xParseError(t *testing.T)
```

Issue 29918, 29916 

### <a id="TestParseMonthOutOfRange" href="#TestParseMonthOutOfRange">func TestParseMonthOutOfRange(t *testing.T)</a>

```
searchKey: time_test.TestParseMonthOutOfRange
```

```Go
func TestParseMonthOutOfRange(t *testing.T)
```

### <a id="TestParseYday" href="#TestParseYday">func TestParseYday(t *testing.T)</a>

```
searchKey: time_test.TestParseYday
```

```Go
func TestParseYday(t *testing.T)
```

Issue 37387. 

### <a id="TestQuote" href="#TestQuote">func TestQuote(t *testing.T)</a>

```
searchKey: time_test.TestQuote
```

```Go
func TestQuote(t *testing.T)
```

Issue 45391. 

### <a id="TestHasMonotonicClock" href="#TestHasMonotonicClock">func TestHasMonotonicClock(t *testing.T)</a>

```
searchKey: time_test.TestHasMonotonicClock
```

```Go
func TestHasMonotonicClock(t *testing.T)
```

### <a id="TestMonotonicAdd" href="#TestMonotonicAdd">func TestMonotonicAdd(t *testing.T)</a>

```
searchKey: time_test.TestMonotonicAdd
```

```Go
func TestMonotonicAdd(t *testing.T)
```

### <a id="TestMonotonicSub" href="#TestMonotonicSub">func TestMonotonicSub(t *testing.T)</a>

```
searchKey: time_test.TestMonotonicSub
```

```Go
func TestMonotonicSub(t *testing.T)
```

### <a id="TestMonotonicOverflow" href="#TestMonotonicOverflow">func TestMonotonicOverflow(t *testing.T)</a>

```
searchKey: time_test.TestMonotonicOverflow
```

```Go
func TestMonotonicOverflow(t *testing.T)
```

### <a id="TestMonotonicString" href="#TestMonotonicString">func TestMonotonicString(t *testing.T)</a>

```
searchKey: time_test.TestMonotonicString
```

```Go
func TestMonotonicString(t *testing.T)
```

### <a id="TestSleep" href="#TestSleep">func TestSleep(t *testing.T)</a>

```
searchKey: time_test.TestSleep
```

```Go
func TestSleep(t *testing.T)
```

### <a id="TestAfterFunc" href="#TestAfterFunc">func TestAfterFunc(t *testing.T)</a>

```
searchKey: time_test.TestAfterFunc
```

```Go
func TestAfterFunc(t *testing.T)
```

Test the basic function calling behavior. Correct queueing behavior is tested elsewhere, since After and AfterFunc share the same code. 

### <a id="TestAfterStress" href="#TestAfterStress">func TestAfterStress(t *testing.T)</a>

```
searchKey: time_test.TestAfterStress
```

```Go
func TestAfterStress(t *testing.T)
```

### <a id="benchmark" href="#benchmark">func benchmark(b *testing.B, bench func(n int))</a>

```
searchKey: time_test.benchmark
```

```Go
func benchmark(b *testing.B, bench func(n int))
```

### <a id="BenchmarkAfterFunc" href="#BenchmarkAfterFunc">func BenchmarkAfterFunc(b *testing.B)</a>

```
searchKey: time_test.BenchmarkAfterFunc
```

```Go
func BenchmarkAfterFunc(b *testing.B)
```

### <a id="BenchmarkAfter" href="#BenchmarkAfter">func BenchmarkAfter(b *testing.B)</a>

```
searchKey: time_test.BenchmarkAfter
```

```Go
func BenchmarkAfter(b *testing.B)
```

### <a id="BenchmarkStop" href="#BenchmarkStop">func BenchmarkStop(b *testing.B)</a>

```
searchKey: time_test.BenchmarkStop
```

```Go
func BenchmarkStop(b *testing.B)
```

### <a id="BenchmarkSimultaneousAfterFunc" href="#BenchmarkSimultaneousAfterFunc">func BenchmarkSimultaneousAfterFunc(b *testing.B)</a>

```
searchKey: time_test.BenchmarkSimultaneousAfterFunc
```

```Go
func BenchmarkSimultaneousAfterFunc(b *testing.B)
```

### <a id="BenchmarkStartStop" href="#BenchmarkStartStop">func BenchmarkStartStop(b *testing.B)</a>

```
searchKey: time_test.BenchmarkStartStop
```

```Go
func BenchmarkStartStop(b *testing.B)
```

### <a id="BenchmarkReset" href="#BenchmarkReset">func BenchmarkReset(b *testing.B)</a>

```
searchKey: time_test.BenchmarkReset
```

```Go
func BenchmarkReset(b *testing.B)
```

### <a id="BenchmarkSleep" href="#BenchmarkSleep">func BenchmarkSleep(b *testing.B)</a>

```
searchKey: time_test.BenchmarkSleep
```

```Go
func BenchmarkSleep(b *testing.B)
```

### <a id="TestAfter" href="#TestAfter">func TestAfter(t *testing.T)</a>

```
searchKey: time_test.TestAfter
```

```Go
func TestAfter(t *testing.T)
```

### <a id="TestAfterTick" href="#TestAfterTick">func TestAfterTick(t *testing.T)</a>

```
searchKey: time_test.TestAfterTick
```

```Go
func TestAfterTick(t *testing.T)
```

### <a id="TestAfterStop" href="#TestAfterStop">func TestAfterStop(t *testing.T)</a>

```
searchKey: time_test.TestAfterStop
```

```Go
func TestAfterStop(t *testing.T)
```

### <a id="TestAfterQueuing" href="#TestAfterQueuing">func TestAfterQueuing(t *testing.T)</a>

```
searchKey: time_test.TestAfterQueuing
```

```Go
func TestAfterQueuing(t *testing.T)
```

### <a id="await" href="#await">func await(slot int, result chan<- afterResult, ac <-chan Time)</a>

```
searchKey: time_test.await
```

```Go
func await(slot int, result chan<- afterResult, ac <-chan Time)
```

### <a id="testAfterQueuing" href="#testAfterQueuing">func testAfterQueuing(delta Duration) error</a>

```
searchKey: time_test.testAfterQueuing
```

```Go
func testAfterQueuing(delta Duration) error
```

### <a id="TestTimerStopStress" href="#TestTimerStopStress">func TestTimerStopStress(t *testing.T)</a>

```
searchKey: time_test.TestTimerStopStress
```

```Go
func TestTimerStopStress(t *testing.T)
```

### <a id="TestSleepZeroDeadlock" href="#TestSleepZeroDeadlock">func TestSleepZeroDeadlock(t *testing.T)</a>

```
searchKey: time_test.TestSleepZeroDeadlock
```

```Go
func TestSleepZeroDeadlock(t *testing.T)
```

### <a id="testReset" href="#testReset">func testReset(d Duration) error</a>

```
searchKey: time_test.testReset
```

```Go
func testReset(d Duration) error
```

### <a id="TestReset" href="#TestReset">func TestReset(t *testing.T)</a>

```
searchKey: time_test.TestReset
```

```Go
func TestReset(t *testing.T)
```

### <a id="TestOverflowSleep" href="#TestOverflowSleep">func TestOverflowSleep(t *testing.T)</a>

```
searchKey: time_test.TestOverflowSleep
```

```Go
func TestOverflowSleep(t *testing.T)
```

Test that sleeping (via Sleep or Timer) for an interval so large it overflows does not result in a short sleep duration. Nor does it interfere with execution of other timers. If it does, timers in this or subsequent tests may not fire. 

### <a id="TestIssue5745" href="#TestIssue5745">func TestIssue5745(t *testing.T)</a>

```
searchKey: time_test.TestIssue5745
```

```Go
func TestIssue5745(t *testing.T)
```

Test that a panic while deleting a timer does not leave the timers mutex held, deadlocking a ticker.Stop in a defer. 

### <a id="TestOverflowPeriodRuntimeTimer" href="#TestOverflowPeriodRuntimeTimer">func TestOverflowPeriodRuntimeTimer(t *testing.T)</a>

```
searchKey: time_test.TestOverflowPeriodRuntimeTimer
```

```Go
func TestOverflowPeriodRuntimeTimer(t *testing.T)
```

### <a id="checkZeroPanicString" href="#checkZeroPanicString">func checkZeroPanicString(t *testing.T)</a>

```
searchKey: time_test.checkZeroPanicString
```

```Go
func checkZeroPanicString(t *testing.T)
```

### <a id="TestZeroTimerResetPanics" href="#TestZeroTimerResetPanics">func TestZeroTimerResetPanics(t *testing.T)</a>

```
searchKey: time_test.TestZeroTimerResetPanics
```

```Go
func TestZeroTimerResetPanics(t *testing.T)
```

### <a id="TestZeroTimerStopPanics" href="#TestZeroTimerStopPanics">func TestZeroTimerStopPanics(t *testing.T)</a>

```
searchKey: time_test.TestZeroTimerStopPanics
```

```Go
func TestZeroTimerStopPanics(t *testing.T)
```

### <a id="TestZeroTimer" href="#TestZeroTimer">func TestZeroTimer(t *testing.T)</a>

```
searchKey: time_test.TestZeroTimer
```

```Go
func TestZeroTimer(t *testing.T)
```

Test that zero duration timers aren't missed by the scheduler. Regression test for issue 44868. 

### <a id="BenchmarkParallelTimerLatency" href="#BenchmarkParallelTimerLatency">func BenchmarkParallelTimerLatency(b *testing.B)</a>

```
searchKey: time_test.BenchmarkParallelTimerLatency
```

```Go
func BenchmarkParallelTimerLatency(b *testing.B)
```

Benchmark timer latency when the thread that creates the timer is busy with other work and the timers must be serviced by other threads. [https://golang.org/issue/38860](https://golang.org/issue/38860) 

### <a id="BenchmarkStaggeredTickerLatency" href="#BenchmarkStaggeredTickerLatency">func BenchmarkStaggeredTickerLatency(b *testing.B)</a>

```
searchKey: time_test.BenchmarkStaggeredTickerLatency
```

```Go
func BenchmarkStaggeredTickerLatency(b *testing.B)
```

Benchmark timer latency with staggered wakeup times and varying CPU bound workloads. [https://golang.org/issue/38860](https://golang.org/issue/38860) 

### <a id="warmupScheduler" href="#warmupScheduler">func warmupScheduler(targetThreadCount int)</a>

```
searchKey: time_test.warmupScheduler
```

```Go
func warmupScheduler(targetThreadCount int)
```

warmupScheduler ensures the scheduler has at least targetThreadCount threads in its thread pool. 

### <a id="doWork" href="#doWork">func doWork(dur Duration)</a>

```
searchKey: time_test.doWork
```

```Go
func doWork(dur Duration)
```

### <a id="TestTicker" href="#TestTicker">func TestTicker(t *testing.T)</a>

```
searchKey: time_test.TestTicker
```

```Go
func TestTicker(t *testing.T)
```

### <a id="TestTickerStopWithDirectInitialization" href="#TestTickerStopWithDirectInitialization">func TestTickerStopWithDirectInitialization(t *testing.T)</a>

```
searchKey: time_test.TestTickerStopWithDirectInitialization
```

```Go
func TestTickerStopWithDirectInitialization(t *testing.T)
```

Issue 21874 

### <a id="TestTeardown" href="#TestTeardown">func TestTeardown(t *testing.T)</a>

```
searchKey: time_test.TestTeardown
```

```Go
func TestTeardown(t *testing.T)
```

Test that a bug tearing down a ticker has been fixed. This routine should not deadlock. 

### <a id="TestTick" href="#TestTick">func TestTick(t *testing.T)</a>

```
searchKey: time_test.TestTick
```

```Go
func TestTick(t *testing.T)
```

Test the Tick convenience wrapper. 

### <a id="TestNewTickerLtZeroDuration" href="#TestNewTickerLtZeroDuration">func TestNewTickerLtZeroDuration(t *testing.T)</a>

```
searchKey: time_test.TestNewTickerLtZeroDuration
```

```Go
func TestNewTickerLtZeroDuration(t *testing.T)
```

Test that NewTicker panics when given a duration less than zero. 

### <a id="BenchmarkTicker" href="#BenchmarkTicker">func BenchmarkTicker(b *testing.B)</a>

```
searchKey: time_test.BenchmarkTicker
```

```Go
func BenchmarkTicker(b *testing.B)
```

### <a id="BenchmarkTickerReset" href="#BenchmarkTickerReset">func BenchmarkTickerReset(b *testing.B)</a>

```
searchKey: time_test.BenchmarkTickerReset
```

```Go
func BenchmarkTickerReset(b *testing.B)
```

### <a id="BenchmarkTickerResetNaive" href="#BenchmarkTickerResetNaive">func BenchmarkTickerResetNaive(b *testing.B)</a>

```
searchKey: time_test.BenchmarkTickerResetNaive
```

```Go
func BenchmarkTickerResetNaive(b *testing.B)
```

### <a id="TestZoneData" href="#TestZoneData">func TestZoneData(t *testing.T)</a>

```
searchKey: time_test.TestZoneData
```

```Go
func TestZoneData(t *testing.T)
```

We should be in PST/PDT, but if the time zone files are missing we won't be. The purpose of this test is to at least explain why some of the subsequent tests fail. 

### <a id="same" href="#same">func same(t Time, u *parsedTime) bool</a>

```
searchKey: time_test.same
```

```Go
func same(t Time, u *parsedTime) bool
```

### <a id="TestSecondsToUTC" href="#TestSecondsToUTC">func TestSecondsToUTC(t *testing.T)</a>

```
searchKey: time_test.TestSecondsToUTC
```

```Go
func TestSecondsToUTC(t *testing.T)
```

### <a id="TestNanosecondsToUTC" href="#TestNanosecondsToUTC">func TestNanosecondsToUTC(t *testing.T)</a>

```
searchKey: time_test.TestNanosecondsToUTC
```

```Go
func TestNanosecondsToUTC(t *testing.T)
```

### <a id="TestSecondsToLocalTime" href="#TestSecondsToLocalTime">func TestSecondsToLocalTime(t *testing.T)</a>

```
searchKey: time_test.TestSecondsToLocalTime
```

```Go
func TestSecondsToLocalTime(t *testing.T)
```

### <a id="TestNanosecondsToLocalTime" href="#TestNanosecondsToLocalTime">func TestNanosecondsToLocalTime(t *testing.T)</a>

```
searchKey: time_test.TestNanosecondsToLocalTime
```

```Go
func TestNanosecondsToLocalTime(t *testing.T)
```

### <a id="TestSecondsToUTCAndBack" href="#TestSecondsToUTCAndBack">func TestSecondsToUTCAndBack(t *testing.T)</a>

```
searchKey: time_test.TestSecondsToUTCAndBack
```

```Go
func TestSecondsToUTCAndBack(t *testing.T)
```

### <a id="TestNanosecondsToUTCAndBack" href="#TestNanosecondsToUTCAndBack">func TestNanosecondsToUTCAndBack(t *testing.T)</a>

```
searchKey: time_test.TestNanosecondsToUTCAndBack
```

```Go
func TestNanosecondsToUTCAndBack(t *testing.T)
```

### <a id="TestUnixMilli" href="#TestUnixMilli">func TestUnixMilli(t *testing.T)</a>

```
searchKey: time_test.TestUnixMilli
```

```Go
func TestUnixMilli(t *testing.T)
```

### <a id="TestUnixMicro" href="#TestUnixMicro">func TestUnixMicro(t *testing.T)</a>

```
searchKey: time_test.TestUnixMicro
```

```Go
func TestUnixMicro(t *testing.T)
```

### <a id="abs" href="#abs">func abs(t Time) (sec, nsec int64)</a>

```
searchKey: time_test.abs
```

```Go
func abs(t Time) (sec, nsec int64)
```

abs returns the absolute time stored in t, as seconds and nanoseconds. 

### <a id="absString" href="#absString">func absString(t Time) string</a>

```
searchKey: time_test.absString
```

```Go
func absString(t Time) string
```

absString returns abs as a decimal string. 

### <a id="TestTruncateRound" href="#TestTruncateRound">func TestTruncateRound(t *testing.T)</a>

```
searchKey: time_test.TestTruncateRound
```

```Go
func TestTruncateRound(t *testing.T)
```

### <a id="TestISOWeek" href="#TestISOWeek">func TestISOWeek(t *testing.T)</a>

```
searchKey: time_test.TestISOWeek
```

```Go
func TestISOWeek(t *testing.T)
```

### <a id="TestYearDay" href="#TestYearDay">func TestYearDay(t *testing.T)</a>

```
searchKey: time_test.TestYearDay
```

```Go
func TestYearDay(t *testing.T)
```

### <a id="TestDurationString" href="#TestDurationString">func TestDurationString(t *testing.T)</a>

```
searchKey: time_test.TestDurationString
```

```Go
func TestDurationString(t *testing.T)
```

### <a id="TestDate" href="#TestDate">func TestDate(t *testing.T)</a>

```
searchKey: time_test.TestDate
```

```Go
func TestDate(t *testing.T)
```

### <a id="TestAddDate" href="#TestAddDate">func TestAddDate(t *testing.T)</a>

```
searchKey: time_test.TestAddDate
```

```Go
func TestAddDate(t *testing.T)
```

### <a id="TestDaysIn" href="#TestDaysIn">func TestDaysIn(t *testing.T)</a>

```
searchKey: time_test.TestDaysIn
```

```Go
func TestDaysIn(t *testing.T)
```

### <a id="TestAddToExactSecond" href="#TestAddToExactSecond">func TestAddToExactSecond(t *testing.T)</a>

```
searchKey: time_test.TestAddToExactSecond
```

```Go
func TestAddToExactSecond(t *testing.T)
```

### <a id="equalTimeAndZone" href="#equalTimeAndZone">func equalTimeAndZone(a, b Time) bool</a>

```
searchKey: time_test.equalTimeAndZone
```

```Go
func equalTimeAndZone(a, b Time) bool
```

### <a id="TestTimeGob" href="#TestTimeGob">func TestTimeGob(t *testing.T)</a>

```
searchKey: time_test.TestTimeGob
```

```Go
func TestTimeGob(t *testing.T)
```

### <a id="TestInvalidTimeGob" href="#TestInvalidTimeGob">func TestInvalidTimeGob(t *testing.T)</a>

```
searchKey: time_test.TestInvalidTimeGob
```

```Go
func TestInvalidTimeGob(t *testing.T)
```

### <a id="TestNotGobEncodableTime" href="#TestNotGobEncodableTime">func TestNotGobEncodableTime(t *testing.T)</a>

```
searchKey: time_test.TestNotGobEncodableTime
```

```Go
func TestNotGobEncodableTime(t *testing.T)
```

### <a id="TestTimeJSON" href="#TestTimeJSON">func TestTimeJSON(t *testing.T)</a>

```
searchKey: time_test.TestTimeJSON
```

```Go
func TestTimeJSON(t *testing.T)
```

### <a id="TestInvalidTimeJSON" href="#TestInvalidTimeJSON">func TestInvalidTimeJSON(t *testing.T)</a>

```
searchKey: time_test.TestInvalidTimeJSON
```

```Go
func TestInvalidTimeJSON(t *testing.T)
```

### <a id="TestNotJSONEncodableTime" href="#TestNotJSONEncodableTime">func TestNotJSONEncodableTime(t *testing.T)</a>

```
searchKey: time_test.TestNotJSONEncodableTime
```

```Go
func TestNotJSONEncodableTime(t *testing.T)
```

### <a id="TestParseDuration" href="#TestParseDuration">func TestParseDuration(t *testing.T)</a>

```
searchKey: time_test.TestParseDuration
```

```Go
func TestParseDuration(t *testing.T)
```

### <a id="TestParseDurationErrors" href="#TestParseDurationErrors">func TestParseDurationErrors(t *testing.T)</a>

```
searchKey: time_test.TestParseDurationErrors
```

```Go
func TestParseDurationErrors(t *testing.T)
```

### <a id="TestParseDurationRoundTrip" href="#TestParseDurationRoundTrip">func TestParseDurationRoundTrip(t *testing.T)</a>

```
searchKey: time_test.TestParseDurationRoundTrip
```

```Go
func TestParseDurationRoundTrip(t *testing.T)
```

### <a id="TestLocationRace" href="#TestLocationRace">func TestLocationRace(t *testing.T)</a>

```
searchKey: time_test.TestLocationRace
```

```Go
func TestLocationRace(t *testing.T)
```

golang.org/issue/4622 

### <a id="TestCountMallocs" href="#TestCountMallocs">func TestCountMallocs(t *testing.T)</a>

```
searchKey: time_test.TestCountMallocs
```

```Go
func TestCountMallocs(t *testing.T)
```

### <a id="TestLoadFixed" href="#TestLoadFixed">func TestLoadFixed(t *testing.T)</a>

```
searchKey: time_test.TestLoadFixed
```

```Go
func TestLoadFixed(t *testing.T)
```

### <a id="TestSub" href="#TestSub">func TestSub(t *testing.T)</a>

```
searchKey: time_test.TestSub
```

```Go
func TestSub(t *testing.T)
```

### <a id="TestDurationNanoseconds" href="#TestDurationNanoseconds">func TestDurationNanoseconds(t *testing.T)</a>

```
searchKey: time_test.TestDurationNanoseconds
```

```Go
func TestDurationNanoseconds(t *testing.T)
```

### <a id="TestDurationMicroseconds" href="#TestDurationMicroseconds">func TestDurationMicroseconds(t *testing.T)</a>

```
searchKey: time_test.TestDurationMicroseconds
```

```Go
func TestDurationMicroseconds(t *testing.T)
```

### <a id="TestDurationMilliseconds" href="#TestDurationMilliseconds">func TestDurationMilliseconds(t *testing.T)</a>

```
searchKey: time_test.TestDurationMilliseconds
```

```Go
func TestDurationMilliseconds(t *testing.T)
```

### <a id="TestDurationSeconds" href="#TestDurationSeconds">func TestDurationSeconds(t *testing.T)</a>

```
searchKey: time_test.TestDurationSeconds
```

```Go
func TestDurationSeconds(t *testing.T)
```

### <a id="TestDurationMinutes" href="#TestDurationMinutes">func TestDurationMinutes(t *testing.T)</a>

```
searchKey: time_test.TestDurationMinutes
```

```Go
func TestDurationMinutes(t *testing.T)
```

### <a id="TestDurationHours" href="#TestDurationHours">func TestDurationHours(t *testing.T)</a>

```
searchKey: time_test.TestDurationHours
```

```Go
func TestDurationHours(t *testing.T)
```

### <a id="TestDurationTruncate" href="#TestDurationTruncate">func TestDurationTruncate(t *testing.T)</a>

```
searchKey: time_test.TestDurationTruncate
```

```Go
func TestDurationTruncate(t *testing.T)
```

### <a id="TestDurationRound" href="#TestDurationRound">func TestDurationRound(t *testing.T)</a>

```
searchKey: time_test.TestDurationRound
```

```Go
func TestDurationRound(t *testing.T)
```

### <a id="TestDefaultLoc" href="#TestDefaultLoc">func TestDefaultLoc(t *testing.T)</a>

```
searchKey: time_test.TestDefaultLoc
```

```Go
func TestDefaultLoc(t *testing.T)
```

### <a id="BenchmarkNow" href="#BenchmarkNow">func BenchmarkNow(b *testing.B)</a>

```
searchKey: time_test.BenchmarkNow
```

```Go
func BenchmarkNow(b *testing.B)
```

### <a id="BenchmarkNowUnixNano" href="#BenchmarkNowUnixNano">func BenchmarkNowUnixNano(b *testing.B)</a>

```
searchKey: time_test.BenchmarkNowUnixNano
```

```Go
func BenchmarkNowUnixNano(b *testing.B)
```

### <a id="BenchmarkNowUnixMilli" href="#BenchmarkNowUnixMilli">func BenchmarkNowUnixMilli(b *testing.B)</a>

```
searchKey: time_test.BenchmarkNowUnixMilli
```

```Go
func BenchmarkNowUnixMilli(b *testing.B)
```

### <a id="BenchmarkNowUnixMicro" href="#BenchmarkNowUnixMicro">func BenchmarkNowUnixMicro(b *testing.B)</a>

```
searchKey: time_test.BenchmarkNowUnixMicro
```

```Go
func BenchmarkNowUnixMicro(b *testing.B)
```

### <a id="BenchmarkFormat" href="#BenchmarkFormat">func BenchmarkFormat(b *testing.B)</a>

```
searchKey: time_test.BenchmarkFormat
```

```Go
func BenchmarkFormat(b *testing.B)
```

### <a id="BenchmarkFormatNow" href="#BenchmarkFormatNow">func BenchmarkFormatNow(b *testing.B)</a>

```
searchKey: time_test.BenchmarkFormatNow
```

```Go
func BenchmarkFormatNow(b *testing.B)
```

### <a id="BenchmarkMarshalJSON" href="#BenchmarkMarshalJSON">func BenchmarkMarshalJSON(b *testing.B)</a>

```
searchKey: time_test.BenchmarkMarshalJSON
```

```Go
func BenchmarkMarshalJSON(b *testing.B)
```

### <a id="BenchmarkMarshalText" href="#BenchmarkMarshalText">func BenchmarkMarshalText(b *testing.B)</a>

```
searchKey: time_test.BenchmarkMarshalText
```

```Go
func BenchmarkMarshalText(b *testing.B)
```

### <a id="BenchmarkParse" href="#BenchmarkParse">func BenchmarkParse(b *testing.B)</a>

```
searchKey: time_test.BenchmarkParse
```

```Go
func BenchmarkParse(b *testing.B)
```

### <a id="BenchmarkParseDuration" href="#BenchmarkParseDuration">func BenchmarkParseDuration(b *testing.B)</a>

```
searchKey: time_test.BenchmarkParseDuration
```

```Go
func BenchmarkParseDuration(b *testing.B)
```

### <a id="BenchmarkHour" href="#BenchmarkHour">func BenchmarkHour(b *testing.B)</a>

```
searchKey: time_test.BenchmarkHour
```

```Go
func BenchmarkHour(b *testing.B)
```

### <a id="BenchmarkSecond" href="#BenchmarkSecond">func BenchmarkSecond(b *testing.B)</a>

```
searchKey: time_test.BenchmarkSecond
```

```Go
func BenchmarkSecond(b *testing.B)
```

### <a id="BenchmarkYear" href="#BenchmarkYear">func BenchmarkYear(b *testing.B)</a>

```
searchKey: time_test.BenchmarkYear
```

```Go
func BenchmarkYear(b *testing.B)
```

### <a id="BenchmarkDay" href="#BenchmarkDay">func BenchmarkDay(b *testing.B)</a>

```
searchKey: time_test.BenchmarkDay
```

```Go
func BenchmarkDay(b *testing.B)
```

### <a id="BenchmarkISOWeek" href="#BenchmarkISOWeek">func BenchmarkISOWeek(b *testing.B)</a>

```
searchKey: time_test.BenchmarkISOWeek
```

```Go
func BenchmarkISOWeek(b *testing.B)
```

### <a id="TestMarshalBinaryZeroTime" href="#TestMarshalBinaryZeroTime">func TestMarshalBinaryZeroTime(t *testing.T)</a>

```
searchKey: time_test.TestMarshalBinaryZeroTime
```

```Go
func TestMarshalBinaryZeroTime(t *testing.T)
```

### <a id="TestZeroMonthString" href="#TestZeroMonthString">func TestZeroMonthString(t *testing.T)</a>

```
searchKey: time_test.TestZeroMonthString
```

```Go
func TestZeroMonthString(t *testing.T)
```

Issue 17720: Zero value of time.Month fails to print 

### <a id="TestWeekdayString" href="#TestWeekdayString">func TestWeekdayString(t *testing.T)</a>

```
searchKey: time_test.TestWeekdayString
```

```Go
func TestWeekdayString(t *testing.T)
```

Issue 24692: Out of range weekday panics 

### <a id="TestReadFileLimit" href="#TestReadFileLimit">func TestReadFileLimit(t *testing.T)</a>

```
searchKey: time_test.TestReadFileLimit
```

```Go
func TestReadFileLimit(t *testing.T)
```

### <a id="TestConcurrentTimerReset" href="#TestConcurrentTimerReset">func TestConcurrentTimerReset(t *testing.T)</a>

```
searchKey: time_test.TestConcurrentTimerReset
```

```Go
func TestConcurrentTimerReset(t *testing.T)
```

Issue 25686: hard crash on concurrent timer access. Issue 37400: panic with "racy use of timers" This test deliberately invokes a race condition. We are testing that we don't crash with "fatal error: panic holding locks", and that we also don't panic. 

### <a id="TestConcurrentTimerResetStop" href="#TestConcurrentTimerResetStop">func TestConcurrentTimerResetStop(t *testing.T)</a>

```
searchKey: time_test.TestConcurrentTimerResetStop
```

```Go
func TestConcurrentTimerResetStop(t *testing.T)
```

Issue 37400: panic with "racy use of timers". 

### <a id="TestTimeIsDST" href="#TestTimeIsDST">func TestTimeIsDST(t *testing.T)</a>

```
searchKey: time_test.TestTimeIsDST
```

```Go
func TestTimeIsDST(t *testing.T)
```

### <a id="TestTimeAddSecOverflow" href="#TestTimeAddSecOverflow">func TestTimeAddSecOverflow(t *testing.T)</a>

```
searchKey: time_test.TestTimeAddSecOverflow
```

```Go
func TestTimeAddSecOverflow(t *testing.T)
```

### <a id="TestEmbeddedTZData" href="#TestEmbeddedTZData">func TestEmbeddedTZData(t *testing.T)</a>

```
searchKey: time_test.TestEmbeddedTZData
```

```Go
func TestEmbeddedTZData(t *testing.T)
```

### <a id="equal" href="#equal">func equal(t *testing.T, f1, f2 reflect.Value) bool</a>

```
searchKey: time_test.equal
```

```Go
func equal(t *testing.T, f1, f2 reflect.Value) bool
```

equal is a small version of reflect.DeepEqual that we use to compare the values of zoneinfo unexported fields. 

### <a id="init" href="#init">func init()</a>

```
searchKey: time_test.init
```

```Go
func init()
```

### <a id="TestEnvVarUsage" href="#TestEnvVarUsage">func TestEnvVarUsage(t *testing.T)</a>

```
searchKey: time_test.TestEnvVarUsage
```

```Go
func TestEnvVarUsage(t *testing.T)
```

### <a id="TestBadLocationErrMsg" href="#TestBadLocationErrMsg">func TestBadLocationErrMsg(t *testing.T)</a>

```
searchKey: time_test.TestBadLocationErrMsg
```

```Go
func TestBadLocationErrMsg(t *testing.T)
```

### <a id="TestLoadLocationValidatesNames" href="#TestLoadLocationValidatesNames">func TestLoadLocationValidatesNames(t *testing.T)</a>

```
searchKey: time_test.TestLoadLocationValidatesNames
```

```Go
func TestLoadLocationValidatesNames(t *testing.T)
```

### <a id="TestVersion3" href="#TestVersion3">func TestVersion3(t *testing.T)</a>

```
searchKey: time_test.TestVersion3
```

```Go
func TestVersion3(t *testing.T)
```

### <a id="TestFirstZone" href="#TestFirstZone">func TestFirstZone(t *testing.T)</a>

```
searchKey: time_test.TestFirstZone
```

```Go
func TestFirstZone(t *testing.T)
```

Test that we get the correct results for times before the first transition time. To do this we explicitly check early dates in a couple of specific timezones. 

### <a id="TestLocationNames" href="#TestLocationNames">func TestLocationNames(t *testing.T)</a>

```
searchKey: time_test.TestLocationNames
```

```Go
func TestLocationNames(t *testing.T)
```

### <a id="TestLoadLocationFromTZData" href="#TestLoadLocationFromTZData">func TestLoadLocationFromTZData(t *testing.T)</a>

```
searchKey: time_test.TestLoadLocationFromTZData
```

```Go
func TestLoadLocationFromTZData(t *testing.T)
```

### <a id="TestEarlyLocation" href="#TestEarlyLocation">func TestEarlyLocation(t *testing.T)</a>

```
searchKey: time_test.TestEarlyLocation
```

```Go
func TestEarlyLocation(t *testing.T)
```

Issue 30099. 

### <a id="TestMalformedTZData" href="#TestMalformedTZData">func TestMalformedTZData(t *testing.T)</a>

```
searchKey: time_test.TestMalformedTZData
```

```Go
func TestMalformedTZData(t *testing.T)
```

### <a id="TestLoadLocationFromTZDataSlim" href="#TestLoadLocationFromTZDataSlim">func TestLoadLocationFromTZDataSlim(t *testing.T)</a>

```
searchKey: time_test.TestLoadLocationFromTZDataSlim
```

```Go
func TestLoadLocationFromTZDataSlim(t *testing.T)
```

### <a id="TestTzset" href="#TestTzset">func TestTzset(t *testing.T)</a>

```
searchKey: time_test.TestTzset
```

```Go
func TestTzset(t *testing.T)
```

### <a id="TestTzsetName" href="#TestTzsetName">func TestTzsetName(t *testing.T)</a>

```
searchKey: time_test.TestTzsetName
```

```Go
func TestTzsetName(t *testing.T)
```

### <a id="TestTzsetOffset" href="#TestTzsetOffset">func TestTzsetOffset(t *testing.T)</a>

```
searchKey: time_test.TestTzsetOffset
```

```Go
func TestTzsetOffset(t *testing.T)
```

### <a id="TestTzsetRule" href="#TestTzsetRule">func TestTzsetRule(t *testing.T)</a>

```
searchKey: time_test.TestTzsetRule
```

```Go
func TestTzsetRule(t *testing.T)
```

### <a id="TestEnvTZUsage" href="#TestEnvTZUsage">func TestEnvTZUsage(t *testing.T)</a>

```
searchKey: time_test.TestEnvTZUsage
```

```Go
func TestEnvTZUsage(t *testing.T)
```

