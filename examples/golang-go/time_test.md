# Package time_test

## Index

* [Constants](#const)
    * [const maxDuration](#maxDuration)
    * [const minDuration](#minDuration)
    * [const unixToZero](#unixToZero)
    * [const windowsInaccuracy](#windowsInaccuracy)
* [Variables](#var)
    * [var addDateTests](#addDateTests)
    * [var c](#c)
    * [var dateTests](#dateTests)
    * [var dayOutOfRangeTests](#dayOutOfRangeTests)
    * [var daysInTests](#daysInTests)
    * [var defaultLocTests](#defaultLocTests)
    * [var durationRoundTests](#durationRoundTests)
    * [var durationTests](#durationTests)
    * [var durationTruncateTests](#durationTruncateTests)
    * [var formatTests](#formatTests)
    * [var goStringTests](#goStringTests)
    * [var gobTests](#gobTests)
    * [var hourDurationTests](#hourDurationTests)
    * [var invalidEncodingTests](#invalidEncodingTests)
    * [var isoWeekTests](#isoWeekTests)
    * [var jsonTests](#jsonTests)
    * [var localtests](#localtests)
    * [var mallocTest](#mallocTest)
    * [var minDurationTests](#minDurationTests)
    * [var monotonicStringTests](#monotonicStringTests)
    * [var monthOutOfRangeTests](#monthOutOfRangeTests)
    * [var msDurationTests](#msDurationTests)
    * [var nanolocaltests](#nanolocaltests)
    * [var nanoutctests](#nanoutctests)
    * [var nextStdChunkTests](#nextStdChunkTests)
    * [var notEncodableTimes](#notEncodableTimes)
    * [var notJSONEncodableTimes](#notJSONEncodableTimes)
    * [var nsDurationTests](#nsDurationTests)
    * [var parseDurationErrorTests](#parseDurationErrorTests)
    * [var parseDurationTests](#parseDurationTests)
    * [var parseErrorTests](#parseErrorTests)
    * [var parseTests](#parseTests)
    * [var parseTimeZoneTests](#parseTimeZoneTests)
    * [var rfc3339Formats](#rfc3339Formats)
    * [var rubyTests](#rubyTests)
    * [var secDurationTests](#secDurationTests)
    * [var secondsTimeZoneOffsetTests](#secondsTimeZoneOffsetTests)
    * [var slimTests](#slimTests)
    * [var slots](#slots)
    * [var subTests](#subTests)
    * [var t](#t)
    * [var truncateRoundTests](#truncateRoundTests)
    * [var u](#u)
    * [var usDurationTests](#usDurationTests)
    * [var utctests](#utctests)
    * [var yearDayLocations](#yearDayLocations)
    * [var yearDayTests](#yearDayTests)
    * [var zones](#zones)
* [Types](#type)
    * [type FormatTest struct](#FormatTest)
    * [type ISOWeekTest struct](#ISOWeekTest)
    * [type ParseErrorTest struct](#ParseErrorTest)
    * [type ParseTest struct](#ParseTest)
    * [type ParseTimeZoneTest struct](#ParseTimeZoneTest)
    * [type SecondsTimeZoneOffsetTest struct](#SecondsTimeZoneOffsetTest)
    * [type TimeFormatTest struct](#TimeFormatTest)
    * [type TimeTest struct](#TimeTest)
    * [type YearDayTest struct](#YearDayTest)
    * [type afterResult struct](#afterResult)
    * [type parsedTime struct](#parsedTime)
* [Functions](#func)
    * [func BenchmarkAfter(b *testing.B)](#BenchmarkAfter)
    * [func BenchmarkAfterFunc(b *testing.B)](#BenchmarkAfterFunc)
    * [func BenchmarkDay(b *testing.B)](#BenchmarkDay)
    * [func BenchmarkFormat(b *testing.B)](#BenchmarkFormat)
    * [func BenchmarkFormatNow(b *testing.B)](#BenchmarkFormatNow)
    * [func BenchmarkHour(b *testing.B)](#BenchmarkHour)
    * [func BenchmarkISOWeek(b *testing.B)](#BenchmarkISOWeek)
    * [func BenchmarkMarshalJSON(b *testing.B)](#BenchmarkMarshalJSON)
    * [func BenchmarkMarshalText(b *testing.B)](#BenchmarkMarshalText)
    * [func BenchmarkNow(b *testing.B)](#BenchmarkNow)
    * [func BenchmarkNowUnixMicro(b *testing.B)](#BenchmarkNowUnixMicro)
    * [func BenchmarkNowUnixMilli(b *testing.B)](#BenchmarkNowUnixMilli)
    * [func BenchmarkNowUnixNano(b *testing.B)](#BenchmarkNowUnixNano)
    * [func BenchmarkParallelTimerLatency(b *testing.B)](#BenchmarkParallelTimerLatency)
    * [func BenchmarkParse(b *testing.B)](#BenchmarkParse)
    * [func BenchmarkParseDuration(b *testing.B)](#BenchmarkParseDuration)
    * [func BenchmarkReset(b *testing.B)](#BenchmarkReset)
    * [func BenchmarkSecond(b *testing.B)](#BenchmarkSecond)
    * [func BenchmarkSimultaneousAfterFunc(b *testing.B)](#BenchmarkSimultaneousAfterFunc)
    * [func BenchmarkSleep(b *testing.B)](#BenchmarkSleep)
    * [func BenchmarkStaggeredTickerLatency(b *testing.B)](#BenchmarkStaggeredTickerLatency)
    * [func BenchmarkStartStop(b *testing.B)](#BenchmarkStartStop)
    * [func BenchmarkStop(b *testing.B)](#BenchmarkStop)
    * [func BenchmarkTicker(b *testing.B)](#BenchmarkTicker)
    * [func BenchmarkTickerReset(b *testing.B)](#BenchmarkTickerReset)
    * [func BenchmarkTickerResetNaive(b *testing.B)](#BenchmarkTickerResetNaive)
    * [func BenchmarkYear(b *testing.B)](#BenchmarkYear)
    * [func ExampleAfter()](#ExampleAfter)
    * [func ExampleDate()](#ExampleDate)
    * [func ExampleDuration()](#ExampleDuration)
    * [func ExampleDuration_Hours()](#ExampleDuration_Hours)
    * [func ExampleDuration_Microseconds()](#ExampleDuration_Microseconds)
    * [func ExampleDuration_Milliseconds()](#ExampleDuration_Milliseconds)
    * [func ExampleDuration_Minutes()](#ExampleDuration_Minutes)
    * [func ExampleDuration_Nanoseconds()](#ExampleDuration_Nanoseconds)
    * [func ExampleDuration_Round()](#ExampleDuration_Round)
    * [func ExampleDuration_Seconds()](#ExampleDuration_Seconds)
    * [func ExampleDuration_String()](#ExampleDuration_String)
    * [func ExampleDuration_Truncate()](#ExampleDuration_Truncate)
    * [func ExampleFixedZone()](#ExampleFixedZone)
    * [func ExampleLoadLocation()](#ExampleLoadLocation)
    * [func ExampleLocation()](#ExampleLocation)
    * [func ExampleMonth()](#ExampleMonth)
    * [func ExampleNewTicker()](#ExampleNewTicker)
    * [func ExampleParse()](#ExampleParse)
    * [func ExampleParseDuration()](#ExampleParseDuration)
    * [func ExampleParseInLocation()](#ExampleParseInLocation)
    * [func ExampleSleep()](#ExampleSleep)
    * [func ExampleTick()](#ExampleTick)
    * [func ExampleTime_Add()](#ExampleTime_Add)
    * [func ExampleTime_AddDate()](#ExampleTime_AddDate)
    * [func ExampleTime_After()](#ExampleTime_After)
    * [func ExampleTime_AppendFormat()](#ExampleTime_AppendFormat)
    * [func ExampleTime_Before()](#ExampleTime_Before)
    * [func ExampleTime_Date()](#ExampleTime_Date)
    * [func ExampleTime_Day()](#ExampleTime_Day)
    * [func ExampleTime_Equal()](#ExampleTime_Equal)
    * [func ExampleTime_Format()](#ExampleTime_Format)
    * [func ExampleTime_Format_pad()](#ExampleTime_Format_pad)
    * [func ExampleTime_Round()](#ExampleTime_Round)
    * [func ExampleTime_String()](#ExampleTime_String)
    * [func ExampleTime_Sub()](#ExampleTime_Sub)
    * [func ExampleTime_Truncate()](#ExampleTime_Truncate)
    * [func ExampleTime_Unix()](#ExampleTime_Unix)
    * [func Test12AMIsMidnight(t *testing.T)](#Test12AMIsMidnight)
    * [func Test12PMIsNoon(t *testing.T)](#Test12PMIsNoon)
    * [func TestAddDate(t *testing.T)](#TestAddDate)
    * [func TestAddToExactSecond(t *testing.T)](#TestAddToExactSecond)
    * [func TestAfter(t *testing.T)](#TestAfter)
    * [func TestAfterFunc(t *testing.T)](#TestAfterFunc)
    * [func TestAfterQueuing(t *testing.T)](#TestAfterQueuing)
    * [func TestAfterStop(t *testing.T)](#TestAfterStop)
    * [func TestAfterStress(t *testing.T)](#TestAfterStress)
    * [func TestAfterTick(t *testing.T)](#TestAfterTick)
    * [func TestBadLocationErrMsg(t *testing.T)](#TestBadLocationErrMsg)
    * [func TestConcurrentTimerReset(t *testing.T)](#TestConcurrentTimerReset)
    * [func TestConcurrentTimerResetStop(t *testing.T)](#TestConcurrentTimerResetStop)
    * [func TestCountMallocs(t *testing.T)](#TestCountMallocs)
    * [func TestDate(t *testing.T)](#TestDate)
    * [func TestDaysIn(t *testing.T)](#TestDaysIn)
    * [func TestDefaultLoc(t *testing.T)](#TestDefaultLoc)
    * [func TestDurationHours(t *testing.T)](#TestDurationHours)
    * [func TestDurationMicroseconds(t *testing.T)](#TestDurationMicroseconds)
    * [func TestDurationMilliseconds(t *testing.T)](#TestDurationMilliseconds)
    * [func TestDurationMinutes(t *testing.T)](#TestDurationMinutes)
    * [func TestDurationNanoseconds(t *testing.T)](#TestDurationNanoseconds)
    * [func TestDurationRound(t *testing.T)](#TestDurationRound)
    * [func TestDurationSeconds(t *testing.T)](#TestDurationSeconds)
    * [func TestDurationString(t *testing.T)](#TestDurationString)
    * [func TestDurationTruncate(t *testing.T)](#TestDurationTruncate)
    * [func TestEarlyLocation(t *testing.T)](#TestEarlyLocation)
    * [func TestEmbeddedTZData(t *testing.T)](#TestEmbeddedTZData)
    * [func TestEnvTZUsage(t *testing.T)](#TestEnvTZUsage)
    * [func TestEnvVarUsage(t *testing.T)](#TestEnvVarUsage)
    * [func TestFirstZone(t *testing.T)](#TestFirstZone)
    * [func TestFormat(t *testing.T)](#TestFormat)
    * [func TestFormatAndParse(t *testing.T)](#TestFormatAndParse)
    * [func TestFormatSecondsInTimeZone(t *testing.T)](#TestFormatSecondsInTimeZone)
    * [func TestFormatShortYear(t *testing.T)](#TestFormatShortYear)
    * [func TestFormatSingleDigits(t *testing.T)](#TestFormatSingleDigits)
    * [func TestGoString(t *testing.T)](#TestGoString)
    * [func TestHasMonotonicClock(t *testing.T)](#TestHasMonotonicClock)
    * [func TestISOWeek(t *testing.T)](#TestISOWeek)
    * [func TestInvalidTimeGob(t *testing.T)](#TestInvalidTimeGob)
    * [func TestInvalidTimeJSON(t *testing.T)](#TestInvalidTimeJSON)
    * [func TestIssue5745(t *testing.T)](#TestIssue5745)
    * [func TestLoadFixed(t *testing.T)](#TestLoadFixed)
    * [func TestLoadLocationFromTZData(t *testing.T)](#TestLoadLocationFromTZData)
    * [func TestLoadLocationFromTZDataSlim(t *testing.T)](#TestLoadLocationFromTZDataSlim)
    * [func TestLoadLocationValidatesNames(t *testing.T)](#TestLoadLocationValidatesNames)
    * [func TestLoadLocationZipFile(t *testing.T)](#TestLoadLocationZipFile)
    * [func TestLocationNames(t *testing.T)](#TestLocationNames)
    * [func TestLocationRace(t *testing.T)](#TestLocationRace)
    * [func TestMalformedTZData(t *testing.T)](#TestMalformedTZData)
    * [func TestMarshalBinaryZeroTime(t *testing.T)](#TestMarshalBinaryZeroTime)
    * [func TestMidnightIs12AM(t *testing.T)](#TestMidnightIs12AM)
    * [func TestMinutesInTimeZone(t *testing.T)](#TestMinutesInTimeZone)
    * [func TestMissingZone(t *testing.T)](#TestMissingZone)
    * [func TestMonotonicAdd(t *testing.T)](#TestMonotonicAdd)
    * [func TestMonotonicOverflow(t *testing.T)](#TestMonotonicOverflow)
    * [func TestMonotonicString(t *testing.T)](#TestMonotonicString)
    * [func TestMonotonicSub(t *testing.T)](#TestMonotonicSub)
    * [func TestNanosecondsToLocalTime(t *testing.T)](#TestNanosecondsToLocalTime)
    * [func TestNanosecondsToUTC(t *testing.T)](#TestNanosecondsToUTC)
    * [func TestNanosecondsToUTCAndBack(t *testing.T)](#TestNanosecondsToUTCAndBack)
    * [func TestNewTickerLtZeroDuration(t *testing.T)](#TestNewTickerLtZeroDuration)
    * [func TestNextStdChunk(t *testing.T)](#TestNextStdChunk)
    * [func TestNoonIs12PM(t *testing.T)](#TestNoonIs12PM)
    * [func TestNotGobEncodableTime(t *testing.T)](#TestNotGobEncodableTime)
    * [func TestNotJSONEncodableTime(t *testing.T)](#TestNotJSONEncodableTime)
    * [func TestOverflowPeriodRuntimeTimer(t *testing.T)](#TestOverflowPeriodRuntimeTimer)
    * [func TestOverflowSleep(t *testing.T)](#TestOverflowSleep)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestParseDayOutOfRange(t *testing.T)](#TestParseDayOutOfRange)
    * [func TestParseDuration(t *testing.T)](#TestParseDuration)
    * [func TestParseDurationErrors(t *testing.T)](#TestParseDurationErrors)
    * [func TestParseDurationRoundTrip(t *testing.T)](#TestParseDurationRoundTrip)
    * [func TestParseErrors(t *testing.T)](#TestParseErrors)
    * [func TestParseInLocation(t *testing.T)](#TestParseInLocation)
    * [func TestParseMonthOutOfRange(t *testing.T)](#TestParseMonthOutOfRange)
    * [func TestParseSecondsInTimeZone(t *testing.T)](#TestParseSecondsInTimeZone)
    * [func TestParseTimeZone(t *testing.T)](#TestParseTimeZone)
    * [func TestParseYday(t *testing.T)](#TestParseYday)
    * [func TestQuote(t *testing.T)](#TestQuote)
    * [func TestRFC3339Conversion(t *testing.T)](#TestRFC3339Conversion)
    * [func TestReadFileLimit(t *testing.T)](#TestReadFileLimit)
    * [func TestReset(t *testing.T)](#TestReset)
    * [func TestRubyParse(t *testing.T)](#TestRubyParse)
    * [func TestSecondsToLocalTime(t *testing.T)](#TestSecondsToLocalTime)
    * [func TestSecondsToUTC(t *testing.T)](#TestSecondsToUTC)
    * [func TestSecondsToUTCAndBack(t *testing.T)](#TestSecondsToUTCAndBack)
    * [func TestSleep(t *testing.T)](#TestSleep)
    * [func TestSleepZeroDeadlock(t *testing.T)](#TestSleepZeroDeadlock)
    * [func TestStd0xParseError(t *testing.T)](#TestStd0xParseError)
    * [func TestSub(t *testing.T)](#TestSub)
    * [func TestTeardown(t *testing.T)](#TestTeardown)
    * [func TestTick(t *testing.T)](#TestTick)
    * [func TestTicker(t *testing.T)](#TestTicker)
    * [func TestTickerStopWithDirectInitialization(t *testing.T)](#TestTickerStopWithDirectInitialization)
    * [func TestTimeAddSecOverflow(t *testing.T)](#TestTimeAddSecOverflow)
    * [func TestTimeGob(t *testing.T)](#TestTimeGob)
    * [func TestTimeIsDST(t *testing.T)](#TestTimeIsDST)
    * [func TestTimeJSON(t *testing.T)](#TestTimeJSON)
    * [func TestTimerStopStress(t *testing.T)](#TestTimerStopStress)
    * [func TestTruncateRound(t *testing.T)](#TestTruncateRound)
    * [func TestTzset(t *testing.T)](#TestTzset)
    * [func TestTzsetName(t *testing.T)](#TestTzsetName)
    * [func TestTzsetOffset(t *testing.T)](#TestTzsetOffset)
    * [func TestTzsetRule(t *testing.T)](#TestTzsetRule)
    * [func TestUnderscoreTwoThousand(t *testing.T)](#TestUnderscoreTwoThousand)
    * [func TestUnixMicro(t *testing.T)](#TestUnixMicro)
    * [func TestUnixMilli(t *testing.T)](#TestUnixMilli)
    * [func TestVersion3(t *testing.T)](#TestVersion3)
    * [func TestWeekdayString(t *testing.T)](#TestWeekdayString)
    * [func TestYearDay(t *testing.T)](#TestYearDay)
    * [func TestZeroMonthString(t *testing.T)](#TestZeroMonthString)
    * [func TestZeroTimer(t *testing.T)](#TestZeroTimer)
    * [func TestZeroTimerResetPanics(t *testing.T)](#TestZeroTimerResetPanics)
    * [func TestZeroTimerStopPanics(t *testing.T)](#TestZeroTimerStopPanics)
    * [func TestZoneData(t *testing.T)](#TestZoneData)
    * [func abs(t Time) (sec, nsec int64)](#abs)
    * [func absString(t Time) string](#absString)
    * [func await(slot int, result chan<- afterResult, ac <-chan Time)](#await)
    * [func benchmark(b *testing.B, bench func(n int))](#benchmark)
    * [func checkTime(time Time, test *ParseTest, t *testing.T)](#checkTime)
    * [func checkZeroPanicString(t *testing.T)](#checkZeroPanicString)
    * [func doWork(dur Duration)](#doWork)
    * [func equal(t *testing.T, f1, f2 reflect.Value) bool](#equal)
    * [func equalTimeAndZone(a, b Time) bool](#equalTimeAndZone)
    * [func expensiveCall()](#expensiveCall)
    * [func handle(int)](#handle)
    * [func init()](#init.zoneinfo_test.go)
    * [func same(t Time, u *parsedTime) bool](#same)
    * [func statusUpdate() string](#statusUpdate)
    * [func testAfterQueuing(delta Duration) error](#testAfterQueuing)
    * [func testReset(d Duration) error](#testReset)
    * [func warmupScheduler(targetThreadCount int)](#warmupScheduler)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="maxDuration" href="#maxDuration">const maxDuration</a>

```
searchKey: time_test.maxDuration
tags: [constant number private]
```

```Go
const maxDuration Duration = 1<<63 - 1
```

### <a id="minDuration" href="#minDuration">const minDuration</a>

```
searchKey: time_test.minDuration
tags: [constant number private]
```

```Go
const minDuration Duration = -1 << 63
```

### <a id="unixToZero" href="#unixToZero">const unixToZero</a>

```
searchKey: time_test.unixToZero
tags: [constant number private]
```

```Go
const unixToZero = -978307200 + 63113904000
```

The time routines provide no way to get absolute time (seconds since zero), but we need it to compute the right answer for bizarre roundings like "to the nearest 3 ns". Compute as t - year1 = (t - 1970) + (1970 - 2001) + (2001 - 1). t - 1970 is returned by Unix and Nanosecond. 1970 - 2001 is -(31*365+8)*86400 = -978307200 seconds. 2001 - 1 is 2000*365.2425*86400 = 63113904000 seconds. 

### <a id="windowsInaccuracy" href="#windowsInaccuracy">const windowsInaccuracy</a>

```
searchKey: time_test.windowsInaccuracy
tags: [constant number private]
```

```Go
const windowsInaccuracy = 17 * Millisecond
```

Go runtime uses different Windows timers for time.Now and sleeping. These can tick at different frequencies and can arrive out of sync. The effect can be seen, for example, as time.Sleep(100ms) is actually shorter then 100ms when measured as difference between time.Now before and after time.Sleep call. This was observed on Windows XP SP3 (windows/386). windowsInaccuracy is to ignore such errors. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="addDateTests" href="#addDateTests">var addDateTests</a>

```
searchKey: time_test.addDateTests
tags: [variable array struct private]
```

```Go
var addDateTests = ...
```

Several ways of getting from Fri Nov 18 7:56:35 PST 2011 to Thu Mar 19 7:56:35 PST 2016 

### <a id="c" href="#c">var c</a>

```
searchKey: time_test.c
tags: [variable private]
```

```Go
var c chan int
```

### <a id="dateTests" href="#dateTests">var dateTests</a>

```
searchKey: time_test.dateTests
tags: [variable array struct private]
```

```Go
var dateTests = ...
```

### <a id="dayOutOfRangeTests" href="#dayOutOfRangeTests">var dayOutOfRangeTests</a>

```
searchKey: time_test.dayOutOfRangeTests
tags: [variable array struct private]
```

```Go
var dayOutOfRangeTests = ...
```

All parsed with ANSIC. 

### <a id="daysInTests" href="#daysInTests">var daysInTests</a>

```
searchKey: time_test.daysInTests
tags: [variable array struct private]
```

```Go
var daysInTests = ...
```

### <a id="defaultLocTests" href="#defaultLocTests">var defaultLocTests</a>

```
searchKey: time_test.defaultLocTests
tags: [variable array struct private]
```

```Go
var defaultLocTests = ...
```

### <a id="durationRoundTests" href="#durationRoundTests">var durationRoundTests</a>

```
searchKey: time_test.durationRoundTests
tags: [variable array struct private]
```

```Go
var durationRoundTests = ...
```

### <a id="durationTests" href="#durationTests">var durationTests</a>

```
searchKey: time_test.durationTests
tags: [variable array struct private]
```

```Go
var durationTests = ...
```

### <a id="durationTruncateTests" href="#durationTruncateTests">var durationTruncateTests</a>

```
searchKey: time_test.durationTruncateTests
tags: [variable array struct private]
```

```Go
var durationTruncateTests = ...
```

### <a id="formatTests" href="#formatTests">var formatTests</a>

```
searchKey: time_test.formatTests
tags: [variable array struct private]
```

```Go
var formatTests = ...
```

### <a id="goStringTests" href="#goStringTests">var goStringTests</a>

```
searchKey: time_test.goStringTests
tags: [variable array struct private]
```

```Go
var goStringTests = ...
```

### <a id="gobTests" href="#gobTests">var gobTests</a>

```
searchKey: time_test.gobTests
tags: [variable array struct private]
```

```Go
var gobTests = ...
```

### <a id="hourDurationTests" href="#hourDurationTests">var hourDurationTests</a>

```
searchKey: time_test.hourDurationTests
tags: [variable array struct private]
```

```Go
var hourDurationTests = ...
```

### <a id="invalidEncodingTests" href="#invalidEncodingTests">var invalidEncodingTests</a>

```
searchKey: time_test.invalidEncodingTests
tags: [variable array struct private]
```

```Go
var invalidEncodingTests = ...
```

### <a id="isoWeekTests" href="#isoWeekTests">var isoWeekTests</a>

```
searchKey: time_test.isoWeekTests
tags: [variable array struct private]
```

```Go
var isoWeekTests = ...
```

### <a id="jsonTests" href="#jsonTests">var jsonTests</a>

```
searchKey: time_test.jsonTests
tags: [variable array struct private]
```

```Go
var jsonTests = ...
```

### <a id="localtests" href="#localtests">var localtests</a>

```
searchKey: time_test.localtests
tags: [variable array struct private]
```

```Go
var localtests = ...
```

### <a id="mallocTest" href="#mallocTest">var mallocTest</a>

```
searchKey: time_test.mallocTest
tags: [variable array struct private]
```

```Go
var mallocTest = ...
```

### <a id="minDurationTests" href="#minDurationTests">var minDurationTests</a>

```
searchKey: time_test.minDurationTests
tags: [variable array struct private]
```

```Go
var minDurationTests = ...
```

### <a id="monotonicStringTests" href="#monotonicStringTests">var monotonicStringTests</a>

```
searchKey: time_test.monotonicStringTests
tags: [variable array struct private]
```

```Go
var monotonicStringTests = ...
```

### <a id="monthOutOfRangeTests" href="#monthOutOfRangeTests">var monthOutOfRangeTests</a>

```
searchKey: time_test.monthOutOfRangeTests
tags: [variable array struct private]
```

```Go
var monthOutOfRangeTests = ...
```

### <a id="msDurationTests" href="#msDurationTests">var msDurationTests</a>

```
searchKey: time_test.msDurationTests
tags: [variable array struct private]
```

```Go
var msDurationTests = ...
```

### <a id="nanolocaltests" href="#nanolocaltests">var nanolocaltests</a>

```
searchKey: time_test.nanolocaltests
tags: [variable array struct private]
```

```Go
var nanolocaltests = ...
```

### <a id="nanoutctests" href="#nanoutctests">var nanoutctests</a>

```
searchKey: time_test.nanoutctests
tags: [variable array struct private]
```

```Go
var nanoutctests = ...
```

### <a id="nextStdChunkTests" href="#nextStdChunkTests">var nextStdChunkTests</a>

```
searchKey: time_test.nextStdChunkTests
tags: [variable array string private]
```

```Go
var nextStdChunkTests = ...
```

### <a id="notEncodableTimes" href="#notEncodableTimes">var notEncodableTimes</a>

```
searchKey: time_test.notEncodableTimes
tags: [variable array struct private]
```

```Go
var notEncodableTimes = ...
```

### <a id="notJSONEncodableTimes" href="#notJSONEncodableTimes">var notJSONEncodableTimes</a>

```
searchKey: time_test.notJSONEncodableTimes
tags: [variable array struct private]
```

```Go
var notJSONEncodableTimes = ...
```

### <a id="nsDurationTests" href="#nsDurationTests">var nsDurationTests</a>

```
searchKey: time_test.nsDurationTests
tags: [variable array struct private]
```

```Go
var nsDurationTests = ...
```

### <a id="parseDurationErrorTests" href="#parseDurationErrorTests">var parseDurationErrorTests</a>

```
searchKey: time_test.parseDurationErrorTests
tags: [variable array struct private]
```

```Go
var parseDurationErrorTests = ...
```

### <a id="parseDurationTests" href="#parseDurationTests">var parseDurationTests</a>

```
searchKey: time_test.parseDurationTests
tags: [variable array struct private]
```

```Go
var parseDurationTests = ...
```

### <a id="parseErrorTests" href="#parseErrorTests">var parseErrorTests</a>

```
searchKey: time_test.parseErrorTests
tags: [variable array struct private]
```

```Go
var parseErrorTests = ...
```

### <a id="parseTests" href="#parseTests">var parseTests</a>

```
searchKey: time_test.parseTests
tags: [variable array struct private]
```

```Go
var parseTests = ...
```

### <a id="parseTimeZoneTests" href="#parseTimeZoneTests">var parseTimeZoneTests</a>

```
searchKey: time_test.parseTimeZoneTests
tags: [variable array struct private]
```

```Go
var parseTimeZoneTests = ...
```

### <a id="rfc3339Formats" href="#rfc3339Formats">var rfc3339Formats</a>

```
searchKey: time_test.rfc3339Formats
tags: [variable array struct private]
```

```Go
var rfc3339Formats = ...
```

### <a id="rubyTests" href="#rubyTests">var rubyTests</a>

```
searchKey: time_test.rubyTests
tags: [variable array struct private]
```

```Go
var rubyTests = ...
```

### <a id="secDurationTests" href="#secDurationTests">var secDurationTests</a>

```
searchKey: time_test.secDurationTests
tags: [variable array struct private]
```

```Go
var secDurationTests = []struct {
	d    Duration
	want float64
}{
	{Duration(300000000), 0.3},
}
```

### <a id="secondsTimeZoneOffsetTests" href="#secondsTimeZoneOffsetTests">var secondsTimeZoneOffsetTests</a>

```
searchKey: time_test.secondsTimeZoneOffsetTests
tags: [variable array struct private]
```

```Go
var secondsTimeZoneOffsetTests = ...
```

### <a id="slimTests" href="#slimTests">var slimTests</a>

```
searchKey: time_test.slimTests
tags: [variable array struct private]
```

```Go
var slimTests = ...
```

### <a id="slots" href="#slots">var slots</a>

```
searchKey: time_test.slots
tags: [variable array number private]
```

```Go
var slots = []int{5, 3, 6, 6, 6, 1, 1, 2, 7, 9, 4, 8, 0}
```

### <a id="subTests" href="#subTests">var subTests</a>

```
searchKey: time_test.subTests
tags: [variable array struct private]
```

```Go
var subTests = ...
```

### <a id="t" href="#t">var t</a>

```
searchKey: time_test.t
tags: [variable struct private]
```

```Go
var t Time
```

### <a id="truncateRoundTests" href="#truncateRoundTests">var truncateRoundTests</a>

```
searchKey: time_test.truncateRoundTests
tags: [variable array struct private]
```

```Go
var truncateRoundTests = ...
```

### <a id="u" href="#u">var u</a>

```
searchKey: time_test.u
tags: [variable number private]
```

```Go
var u int64
```

### <a id="usDurationTests" href="#usDurationTests">var usDurationTests</a>

```
searchKey: time_test.usDurationTests
tags: [variable array struct private]
```

```Go
var usDurationTests = ...
```

### <a id="utctests" href="#utctests">var utctests</a>

```
searchKey: time_test.utctests
tags: [variable array struct private]
```

```Go
var utctests = ...
```

### <a id="yearDayLocations" href="#yearDayLocations">var yearDayLocations</a>

```
searchKey: time_test.yearDayLocations
tags: [variable array struct private]
```

```Go
var yearDayLocations = ...
```

Check to see if YearDay is location sensitive 

### <a id="yearDayTests" href="#yearDayTests">var yearDayTests</a>

```
searchKey: time_test.yearDayTests
tags: [variable array struct private]
```

```Go
var yearDayTests = ...
```

Test YearDay in several different scenarios and corner cases 

### <a id="zones" href="#zones">var zones</a>

```
searchKey: time_test.zones
tags: [variable array string private]
```

```Go
var zones = []string{
	"Asia/Jerusalem",
	"America/Los_Angeles",
}
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="FormatTest" href="#FormatTest">type FormatTest struct</a>

```
searchKey: time_test.FormatTest
tags: [struct private]
```

```Go
type FormatTest struct {
	name   string
	format string
	result string
}
```

### <a id="ISOWeekTest" href="#ISOWeekTest">type ISOWeekTest struct</a>

```
searchKey: time_test.ISOWeekTest
tags: [struct private]
```

```Go
type ISOWeekTest struct {
	year       int // year
	month, day int // month and day
	yex        int // expected year
	wex        int // expected week
}
```

### <a id="ParseErrorTest" href="#ParseErrorTest">type ParseErrorTest struct</a>

```
searchKey: time_test.ParseErrorTest
tags: [struct private]
```

```Go
type ParseErrorTest struct {
	format string
	value  string
	expect string // must appear within the error
}
```

### <a id="ParseTest" href="#ParseTest">type ParseTest struct</a>

```
searchKey: time_test.ParseTest
tags: [struct private]
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
tags: [struct private]
```

```Go
type ParseTimeZoneTest struct {
	value  string
	length int
	ok     bool
}
```

### <a id="SecondsTimeZoneOffsetTest" href="#SecondsTimeZoneOffsetTest">type SecondsTimeZoneOffsetTest struct</a>

```
searchKey: time_test.SecondsTimeZoneOffsetTest
tags: [struct private]
```

```Go
type SecondsTimeZoneOffsetTest struct {
	format         string
	value          string
	expectedoffset int
}
```

### <a id="TimeFormatTest" href="#TimeFormatTest">type TimeFormatTest struct</a>

```
searchKey: time_test.TimeFormatTest
tags: [struct private]
```

```Go
type TimeFormatTest struct {
	time           Time
	formattedValue string
}
```

### <a id="TimeTest" href="#TimeTest">type TimeTest struct</a>

```
searchKey: time_test.TimeTest
tags: [struct private]
```

```Go
type TimeTest struct {
	seconds int64
	golden  parsedTime
}
```

### <a id="YearDayTest" href="#YearDayTest">type YearDayTest struct</a>

```
searchKey: time_test.YearDayTest
tags: [struct private]
```

```Go
type YearDayTest struct {
	year, month, day int
	yday             int
}
```

### <a id="afterResult" href="#afterResult">type afterResult struct</a>

```
searchKey: time_test.afterResult
tags: [struct private]
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
tags: [struct private]
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

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkAfter" href="#BenchmarkAfter">func BenchmarkAfter(b *testing.B)</a>

```
searchKey: time_test.BenchmarkAfter
tags: [function private benchmark]
```

```Go
func BenchmarkAfter(b *testing.B)
```

### <a id="BenchmarkAfterFunc" href="#BenchmarkAfterFunc">func BenchmarkAfterFunc(b *testing.B)</a>

```
searchKey: time_test.BenchmarkAfterFunc
tags: [function private benchmark]
```

```Go
func BenchmarkAfterFunc(b *testing.B)
```

### <a id="BenchmarkDay" href="#BenchmarkDay">func BenchmarkDay(b *testing.B)</a>

```
searchKey: time_test.BenchmarkDay
tags: [function private benchmark]
```

```Go
func BenchmarkDay(b *testing.B)
```

### <a id="BenchmarkFormat" href="#BenchmarkFormat">func BenchmarkFormat(b *testing.B)</a>

```
searchKey: time_test.BenchmarkFormat
tags: [function private benchmark]
```

```Go
func BenchmarkFormat(b *testing.B)
```

### <a id="BenchmarkFormatNow" href="#BenchmarkFormatNow">func BenchmarkFormatNow(b *testing.B)</a>

```
searchKey: time_test.BenchmarkFormatNow
tags: [function private benchmark]
```

```Go
func BenchmarkFormatNow(b *testing.B)
```

### <a id="BenchmarkHour" href="#BenchmarkHour">func BenchmarkHour(b *testing.B)</a>

```
searchKey: time_test.BenchmarkHour
tags: [function private benchmark]
```

```Go
func BenchmarkHour(b *testing.B)
```

### <a id="BenchmarkISOWeek" href="#BenchmarkISOWeek">func BenchmarkISOWeek(b *testing.B)</a>

```
searchKey: time_test.BenchmarkISOWeek
tags: [function private benchmark]
```

```Go
func BenchmarkISOWeek(b *testing.B)
```

### <a id="BenchmarkMarshalJSON" href="#BenchmarkMarshalJSON">func BenchmarkMarshalJSON(b *testing.B)</a>

```
searchKey: time_test.BenchmarkMarshalJSON
tags: [function private benchmark]
```

```Go
func BenchmarkMarshalJSON(b *testing.B)
```

### <a id="BenchmarkMarshalText" href="#BenchmarkMarshalText">func BenchmarkMarshalText(b *testing.B)</a>

```
searchKey: time_test.BenchmarkMarshalText
tags: [function private benchmark]
```

```Go
func BenchmarkMarshalText(b *testing.B)
```

### <a id="BenchmarkNow" href="#BenchmarkNow">func BenchmarkNow(b *testing.B)</a>

```
searchKey: time_test.BenchmarkNow
tags: [function private benchmark]
```

```Go
func BenchmarkNow(b *testing.B)
```

### <a id="BenchmarkNowUnixMicro" href="#BenchmarkNowUnixMicro">func BenchmarkNowUnixMicro(b *testing.B)</a>

```
searchKey: time_test.BenchmarkNowUnixMicro
tags: [function private benchmark]
```

```Go
func BenchmarkNowUnixMicro(b *testing.B)
```

### <a id="BenchmarkNowUnixMilli" href="#BenchmarkNowUnixMilli">func BenchmarkNowUnixMilli(b *testing.B)</a>

```
searchKey: time_test.BenchmarkNowUnixMilli
tags: [function private benchmark]
```

```Go
func BenchmarkNowUnixMilli(b *testing.B)
```

### <a id="BenchmarkNowUnixNano" href="#BenchmarkNowUnixNano">func BenchmarkNowUnixNano(b *testing.B)</a>

```
searchKey: time_test.BenchmarkNowUnixNano
tags: [function private benchmark]
```

```Go
func BenchmarkNowUnixNano(b *testing.B)
```

### <a id="BenchmarkParallelTimerLatency" href="#BenchmarkParallelTimerLatency">func BenchmarkParallelTimerLatency(b *testing.B)</a>

```
searchKey: time_test.BenchmarkParallelTimerLatency
tags: [function private benchmark]
```

```Go
func BenchmarkParallelTimerLatency(b *testing.B)
```

Benchmark timer latency when the thread that creates the timer is busy with other work and the timers must be serviced by other threads. [https://golang.org/issue/38860](https://golang.org/issue/38860) 

### <a id="BenchmarkParse" href="#BenchmarkParse">func BenchmarkParse(b *testing.B)</a>

```
searchKey: time_test.BenchmarkParse
tags: [function private benchmark]
```

```Go
func BenchmarkParse(b *testing.B)
```

### <a id="BenchmarkParseDuration" href="#BenchmarkParseDuration">func BenchmarkParseDuration(b *testing.B)</a>

```
searchKey: time_test.BenchmarkParseDuration
tags: [function private benchmark]
```

```Go
func BenchmarkParseDuration(b *testing.B)
```

### <a id="BenchmarkReset" href="#BenchmarkReset">func BenchmarkReset(b *testing.B)</a>

```
searchKey: time_test.BenchmarkReset
tags: [function private benchmark]
```

```Go
func BenchmarkReset(b *testing.B)
```

### <a id="BenchmarkSecond" href="#BenchmarkSecond">func BenchmarkSecond(b *testing.B)</a>

```
searchKey: time_test.BenchmarkSecond
tags: [function private benchmark]
```

```Go
func BenchmarkSecond(b *testing.B)
```

### <a id="BenchmarkSimultaneousAfterFunc" href="#BenchmarkSimultaneousAfterFunc">func BenchmarkSimultaneousAfterFunc(b *testing.B)</a>

```
searchKey: time_test.BenchmarkSimultaneousAfterFunc
tags: [function private benchmark]
```

```Go
func BenchmarkSimultaneousAfterFunc(b *testing.B)
```

### <a id="BenchmarkSleep" href="#BenchmarkSleep">func BenchmarkSleep(b *testing.B)</a>

```
searchKey: time_test.BenchmarkSleep
tags: [function private benchmark]
```

```Go
func BenchmarkSleep(b *testing.B)
```

### <a id="BenchmarkStaggeredTickerLatency" href="#BenchmarkStaggeredTickerLatency">func BenchmarkStaggeredTickerLatency(b *testing.B)</a>

```
searchKey: time_test.BenchmarkStaggeredTickerLatency
tags: [function private benchmark]
```

```Go
func BenchmarkStaggeredTickerLatency(b *testing.B)
```

Benchmark timer latency with staggered wakeup times and varying CPU bound workloads. [https://golang.org/issue/38860](https://golang.org/issue/38860) 

### <a id="BenchmarkStartStop" href="#BenchmarkStartStop">func BenchmarkStartStop(b *testing.B)</a>

```
searchKey: time_test.BenchmarkStartStop
tags: [function private benchmark]
```

```Go
func BenchmarkStartStop(b *testing.B)
```

### <a id="BenchmarkStop" href="#BenchmarkStop">func BenchmarkStop(b *testing.B)</a>

```
searchKey: time_test.BenchmarkStop
tags: [function private benchmark]
```

```Go
func BenchmarkStop(b *testing.B)
```

### <a id="BenchmarkTicker" href="#BenchmarkTicker">func BenchmarkTicker(b *testing.B)</a>

```
searchKey: time_test.BenchmarkTicker
tags: [function private benchmark]
```

```Go
func BenchmarkTicker(b *testing.B)
```

### <a id="BenchmarkTickerReset" href="#BenchmarkTickerReset">func BenchmarkTickerReset(b *testing.B)</a>

```
searchKey: time_test.BenchmarkTickerReset
tags: [function private benchmark]
```

```Go
func BenchmarkTickerReset(b *testing.B)
```

### <a id="BenchmarkTickerResetNaive" href="#BenchmarkTickerResetNaive">func BenchmarkTickerResetNaive(b *testing.B)</a>

```
searchKey: time_test.BenchmarkTickerResetNaive
tags: [function private benchmark]
```

```Go
func BenchmarkTickerResetNaive(b *testing.B)
```

### <a id="BenchmarkYear" href="#BenchmarkYear">func BenchmarkYear(b *testing.B)</a>

```
searchKey: time_test.BenchmarkYear
tags: [function private benchmark]
```

```Go
func BenchmarkYear(b *testing.B)
```

### <a id="ExampleAfter" href="#ExampleAfter">func ExampleAfter()</a>

```
searchKey: time_test.ExampleAfter
tags: [function private]
```

```Go
func ExampleAfter()
```

### <a id="ExampleDate" href="#ExampleDate">func ExampleDate()</a>

```
searchKey: time_test.ExampleDate
tags: [function private]
```

```Go
func ExampleDate()
```

### <a id="ExampleDuration" href="#ExampleDuration">func ExampleDuration()</a>

```
searchKey: time_test.ExampleDuration
tags: [function private]
```

```Go
func ExampleDuration()
```

### <a id="ExampleDuration_Hours" href="#ExampleDuration_Hours">func ExampleDuration_Hours()</a>

```
searchKey: time_test.ExampleDuration_Hours
tags: [function private]
```

```Go
func ExampleDuration_Hours()
```

### <a id="ExampleDuration_Microseconds" href="#ExampleDuration_Microseconds">func ExampleDuration_Microseconds()</a>

```
searchKey: time_test.ExampleDuration_Microseconds
tags: [function private]
```

```Go
func ExampleDuration_Microseconds()
```

### <a id="ExampleDuration_Milliseconds" href="#ExampleDuration_Milliseconds">func ExampleDuration_Milliseconds()</a>

```
searchKey: time_test.ExampleDuration_Milliseconds
tags: [function private]
```

```Go
func ExampleDuration_Milliseconds()
```

### <a id="ExampleDuration_Minutes" href="#ExampleDuration_Minutes">func ExampleDuration_Minutes()</a>

```
searchKey: time_test.ExampleDuration_Minutes
tags: [function private]
```

```Go
func ExampleDuration_Minutes()
```

### <a id="ExampleDuration_Nanoseconds" href="#ExampleDuration_Nanoseconds">func ExampleDuration_Nanoseconds()</a>

```
searchKey: time_test.ExampleDuration_Nanoseconds
tags: [function private]
```

```Go
func ExampleDuration_Nanoseconds()
```

### <a id="ExampleDuration_Round" href="#ExampleDuration_Round">func ExampleDuration_Round()</a>

```
searchKey: time_test.ExampleDuration_Round
tags: [function private]
```

```Go
func ExampleDuration_Round()
```

### <a id="ExampleDuration_Seconds" href="#ExampleDuration_Seconds">func ExampleDuration_Seconds()</a>

```
searchKey: time_test.ExampleDuration_Seconds
tags: [function private]
```

```Go
func ExampleDuration_Seconds()
```

### <a id="ExampleDuration_String" href="#ExampleDuration_String">func ExampleDuration_String()</a>

```
searchKey: time_test.ExampleDuration_String
tags: [function private]
```

```Go
func ExampleDuration_String()
```

### <a id="ExampleDuration_Truncate" href="#ExampleDuration_Truncate">func ExampleDuration_Truncate()</a>

```
searchKey: time_test.ExampleDuration_Truncate
tags: [function private]
```

```Go
func ExampleDuration_Truncate()
```

### <a id="ExampleFixedZone" href="#ExampleFixedZone">func ExampleFixedZone()</a>

```
searchKey: time_test.ExampleFixedZone
tags: [function private]
```

```Go
func ExampleFixedZone()
```

### <a id="ExampleLoadLocation" href="#ExampleLoadLocation">func ExampleLoadLocation()</a>

```
searchKey: time_test.ExampleLoadLocation
tags: [function private]
```

```Go
func ExampleLoadLocation()
```

### <a id="ExampleLocation" href="#ExampleLocation">func ExampleLocation()</a>

```
searchKey: time_test.ExampleLocation
tags: [function private]
```

```Go
func ExampleLocation()
```

### <a id="ExampleMonth" href="#ExampleMonth">func ExampleMonth()</a>

```
searchKey: time_test.ExampleMonth
tags: [function private]
```

```Go
func ExampleMonth()
```

### <a id="ExampleNewTicker" href="#ExampleNewTicker">func ExampleNewTicker()</a>

```
searchKey: time_test.ExampleNewTicker
tags: [function private]
```

```Go
func ExampleNewTicker()
```

### <a id="ExampleParse" href="#ExampleParse">func ExampleParse()</a>

```
searchKey: time_test.ExampleParse
tags: [function private]
```

```Go
func ExampleParse()
```

### <a id="ExampleParseDuration" href="#ExampleParseDuration">func ExampleParseDuration()</a>

```
searchKey: time_test.ExampleParseDuration
tags: [function private]
```

```Go
func ExampleParseDuration()
```

### <a id="ExampleParseInLocation" href="#ExampleParseInLocation">func ExampleParseInLocation()</a>

```
searchKey: time_test.ExampleParseInLocation
tags: [function private]
```

```Go
func ExampleParseInLocation()
```

### <a id="ExampleSleep" href="#ExampleSleep">func ExampleSleep()</a>

```
searchKey: time_test.ExampleSleep
tags: [function private]
```

```Go
func ExampleSleep()
```

### <a id="ExampleTick" href="#ExampleTick">func ExampleTick()</a>

```
searchKey: time_test.ExampleTick
tags: [function private]
```

```Go
func ExampleTick()
```

### <a id="ExampleTime_Add" href="#ExampleTime_Add">func ExampleTime_Add()</a>

```
searchKey: time_test.ExampleTime_Add
tags: [function private]
```

```Go
func ExampleTime_Add()
```

### <a id="ExampleTime_AddDate" href="#ExampleTime_AddDate">func ExampleTime_AddDate()</a>

```
searchKey: time_test.ExampleTime_AddDate
tags: [function private]
```

```Go
func ExampleTime_AddDate()
```

### <a id="ExampleTime_After" href="#ExampleTime_After">func ExampleTime_After()</a>

```
searchKey: time_test.ExampleTime_After
tags: [function private]
```

```Go
func ExampleTime_After()
```

### <a id="ExampleTime_AppendFormat" href="#ExampleTime_AppendFormat">func ExampleTime_AppendFormat()</a>

```
searchKey: time_test.ExampleTime_AppendFormat
tags: [function private]
```

```Go
func ExampleTime_AppendFormat()
```

### <a id="ExampleTime_Before" href="#ExampleTime_Before">func ExampleTime_Before()</a>

```
searchKey: time_test.ExampleTime_Before
tags: [function private]
```

```Go
func ExampleTime_Before()
```

### <a id="ExampleTime_Date" href="#ExampleTime_Date">func ExampleTime_Date()</a>

```
searchKey: time_test.ExampleTime_Date
tags: [function private]
```

```Go
func ExampleTime_Date()
```

### <a id="ExampleTime_Day" href="#ExampleTime_Day">func ExampleTime_Day()</a>

```
searchKey: time_test.ExampleTime_Day
tags: [function private]
```

```Go
func ExampleTime_Day()
```

### <a id="ExampleTime_Equal" href="#ExampleTime_Equal">func ExampleTime_Equal()</a>

```
searchKey: time_test.ExampleTime_Equal
tags: [function private]
```

```Go
func ExampleTime_Equal()
```

### <a id="ExampleTime_Format" href="#ExampleTime_Format">func ExampleTime_Format()</a>

```
searchKey: time_test.ExampleTime_Format
tags: [function private]
```

```Go
func ExampleTime_Format()
```

### <a id="ExampleTime_Format_pad" href="#ExampleTime_Format_pad">func ExampleTime_Format_pad()</a>

```
searchKey: time_test.ExampleTime_Format_pad
tags: [function private]
```

```Go
func ExampleTime_Format_pad()
```

### <a id="ExampleTime_Round" href="#ExampleTime_Round">func ExampleTime_Round()</a>

```
searchKey: time_test.ExampleTime_Round
tags: [function private]
```

```Go
func ExampleTime_Round()
```

### <a id="ExampleTime_String" href="#ExampleTime_String">func ExampleTime_String()</a>

```
searchKey: time_test.ExampleTime_String
tags: [function private]
```

```Go
func ExampleTime_String()
```

### <a id="ExampleTime_Sub" href="#ExampleTime_Sub">func ExampleTime_Sub()</a>

```
searchKey: time_test.ExampleTime_Sub
tags: [function private]
```

```Go
func ExampleTime_Sub()
```

### <a id="ExampleTime_Truncate" href="#ExampleTime_Truncate">func ExampleTime_Truncate()</a>

```
searchKey: time_test.ExampleTime_Truncate
tags: [function private]
```

```Go
func ExampleTime_Truncate()
```

### <a id="ExampleTime_Unix" href="#ExampleTime_Unix">func ExampleTime_Unix()</a>

```
searchKey: time_test.ExampleTime_Unix
tags: [function private]
```

```Go
func ExampleTime_Unix()
```

### <a id="Test12AMIsMidnight" href="#Test12AMIsMidnight">func Test12AMIsMidnight(t *testing.T)</a>

```
searchKey: time_test.Test12AMIsMidnight
tags: [function private test]
```

```Go
func Test12AMIsMidnight(t *testing.T)
```

### <a id="Test12PMIsNoon" href="#Test12PMIsNoon">func Test12PMIsNoon(t *testing.T)</a>

```
searchKey: time_test.Test12PMIsNoon
tags: [function private test]
```

```Go
func Test12PMIsNoon(t *testing.T)
```

### <a id="TestAddDate" href="#TestAddDate">func TestAddDate(t *testing.T)</a>

```
searchKey: time_test.TestAddDate
tags: [function private test]
```

```Go
func TestAddDate(t *testing.T)
```

### <a id="TestAddToExactSecond" href="#TestAddToExactSecond">func TestAddToExactSecond(t *testing.T)</a>

```
searchKey: time_test.TestAddToExactSecond
tags: [function private test]
```

```Go
func TestAddToExactSecond(t *testing.T)
```

### <a id="TestAfter" href="#TestAfter">func TestAfter(t *testing.T)</a>

```
searchKey: time_test.TestAfter
tags: [function private test]
```

```Go
func TestAfter(t *testing.T)
```

### <a id="TestAfterFunc" href="#TestAfterFunc">func TestAfterFunc(t *testing.T)</a>

```
searchKey: time_test.TestAfterFunc
tags: [function private test]
```

```Go
func TestAfterFunc(t *testing.T)
```

Test the basic function calling behavior. Correct queueing behavior is tested elsewhere, since After and AfterFunc share the same code. 

### <a id="TestAfterQueuing" href="#TestAfterQueuing">func TestAfterQueuing(t *testing.T)</a>

```
searchKey: time_test.TestAfterQueuing
tags: [function private test]
```

```Go
func TestAfterQueuing(t *testing.T)
```

### <a id="TestAfterStop" href="#TestAfterStop">func TestAfterStop(t *testing.T)</a>

```
searchKey: time_test.TestAfterStop
tags: [function private test]
```

```Go
func TestAfterStop(t *testing.T)
```

### <a id="TestAfterStress" href="#TestAfterStress">func TestAfterStress(t *testing.T)</a>

```
searchKey: time_test.TestAfterStress
tags: [function private test]
```

```Go
func TestAfterStress(t *testing.T)
```

### <a id="TestAfterTick" href="#TestAfterTick">func TestAfterTick(t *testing.T)</a>

```
searchKey: time_test.TestAfterTick
tags: [function private test]
```

```Go
func TestAfterTick(t *testing.T)
```

### <a id="TestBadLocationErrMsg" href="#TestBadLocationErrMsg">func TestBadLocationErrMsg(t *testing.T)</a>

```
searchKey: time_test.TestBadLocationErrMsg
tags: [function private test]
```

```Go
func TestBadLocationErrMsg(t *testing.T)
```

### <a id="TestConcurrentTimerReset" href="#TestConcurrentTimerReset">func TestConcurrentTimerReset(t *testing.T)</a>

```
searchKey: time_test.TestConcurrentTimerReset
tags: [function private test]
```

```Go
func TestConcurrentTimerReset(t *testing.T)
```

Issue 25686: hard crash on concurrent timer access. Issue 37400: panic with "racy use of timers" This test deliberately invokes a race condition. We are testing that we don't crash with "fatal error: panic holding locks", and that we also don't panic. 

### <a id="TestConcurrentTimerResetStop" href="#TestConcurrentTimerResetStop">func TestConcurrentTimerResetStop(t *testing.T)</a>

```
searchKey: time_test.TestConcurrentTimerResetStop
tags: [function private test]
```

```Go
func TestConcurrentTimerResetStop(t *testing.T)
```

Issue 37400: panic with "racy use of timers". 

### <a id="TestCountMallocs" href="#TestCountMallocs">func TestCountMallocs(t *testing.T)</a>

```
searchKey: time_test.TestCountMallocs
tags: [function private test]
```

```Go
func TestCountMallocs(t *testing.T)
```

### <a id="TestDate" href="#TestDate">func TestDate(t *testing.T)</a>

```
searchKey: time_test.TestDate
tags: [function private test]
```

```Go
func TestDate(t *testing.T)
```

### <a id="TestDaysIn" href="#TestDaysIn">func TestDaysIn(t *testing.T)</a>

```
searchKey: time_test.TestDaysIn
tags: [function private test]
```

```Go
func TestDaysIn(t *testing.T)
```

### <a id="TestDefaultLoc" href="#TestDefaultLoc">func TestDefaultLoc(t *testing.T)</a>

```
searchKey: time_test.TestDefaultLoc
tags: [function private test]
```

```Go
func TestDefaultLoc(t *testing.T)
```

### <a id="TestDurationHours" href="#TestDurationHours">func TestDurationHours(t *testing.T)</a>

```
searchKey: time_test.TestDurationHours
tags: [function private test]
```

```Go
func TestDurationHours(t *testing.T)
```

### <a id="TestDurationMicroseconds" href="#TestDurationMicroseconds">func TestDurationMicroseconds(t *testing.T)</a>

```
searchKey: time_test.TestDurationMicroseconds
tags: [function private test]
```

```Go
func TestDurationMicroseconds(t *testing.T)
```

### <a id="TestDurationMilliseconds" href="#TestDurationMilliseconds">func TestDurationMilliseconds(t *testing.T)</a>

```
searchKey: time_test.TestDurationMilliseconds
tags: [function private test]
```

```Go
func TestDurationMilliseconds(t *testing.T)
```

### <a id="TestDurationMinutes" href="#TestDurationMinutes">func TestDurationMinutes(t *testing.T)</a>

```
searchKey: time_test.TestDurationMinutes
tags: [function private test]
```

```Go
func TestDurationMinutes(t *testing.T)
```

### <a id="TestDurationNanoseconds" href="#TestDurationNanoseconds">func TestDurationNanoseconds(t *testing.T)</a>

```
searchKey: time_test.TestDurationNanoseconds
tags: [function private test]
```

```Go
func TestDurationNanoseconds(t *testing.T)
```

### <a id="TestDurationRound" href="#TestDurationRound">func TestDurationRound(t *testing.T)</a>

```
searchKey: time_test.TestDurationRound
tags: [function private test]
```

```Go
func TestDurationRound(t *testing.T)
```

### <a id="TestDurationSeconds" href="#TestDurationSeconds">func TestDurationSeconds(t *testing.T)</a>

```
searchKey: time_test.TestDurationSeconds
tags: [function private test]
```

```Go
func TestDurationSeconds(t *testing.T)
```

### <a id="TestDurationString" href="#TestDurationString">func TestDurationString(t *testing.T)</a>

```
searchKey: time_test.TestDurationString
tags: [function private test]
```

```Go
func TestDurationString(t *testing.T)
```

### <a id="TestDurationTruncate" href="#TestDurationTruncate">func TestDurationTruncate(t *testing.T)</a>

```
searchKey: time_test.TestDurationTruncate
tags: [function private test]
```

```Go
func TestDurationTruncate(t *testing.T)
```

### <a id="TestEarlyLocation" href="#TestEarlyLocation">func TestEarlyLocation(t *testing.T)</a>

```
searchKey: time_test.TestEarlyLocation
tags: [function private test]
```

```Go
func TestEarlyLocation(t *testing.T)
```

Issue 30099. 

### <a id="TestEmbeddedTZData" href="#TestEmbeddedTZData">func TestEmbeddedTZData(t *testing.T)</a>

```
searchKey: time_test.TestEmbeddedTZData
tags: [function private test]
```

```Go
func TestEmbeddedTZData(t *testing.T)
```

### <a id="TestEnvTZUsage" href="#TestEnvTZUsage">func TestEnvTZUsage(t *testing.T)</a>

```
searchKey: time_test.TestEnvTZUsage
tags: [function private test]
```

```Go
func TestEnvTZUsage(t *testing.T)
```

### <a id="TestEnvVarUsage" href="#TestEnvVarUsage">func TestEnvVarUsage(t *testing.T)</a>

```
searchKey: time_test.TestEnvVarUsage
tags: [function private test]
```

```Go
func TestEnvVarUsage(t *testing.T)
```

### <a id="TestFirstZone" href="#TestFirstZone">func TestFirstZone(t *testing.T)</a>

```
searchKey: time_test.TestFirstZone
tags: [function private test]
```

```Go
func TestFirstZone(t *testing.T)
```

Test that we get the correct results for times before the first transition time. To do this we explicitly check early dates in a couple of specific timezones. 

### <a id="TestFormat" href="#TestFormat">func TestFormat(t *testing.T)</a>

```
searchKey: time_test.TestFormat
tags: [function private test]
```

```Go
func TestFormat(t *testing.T)
```

### <a id="TestFormatAndParse" href="#TestFormatAndParse">func TestFormatAndParse(t *testing.T)</a>

```
searchKey: time_test.TestFormatAndParse
tags: [function private test]
```

```Go
func TestFormatAndParse(t *testing.T)
```

### <a id="TestFormatSecondsInTimeZone" href="#TestFormatSecondsInTimeZone">func TestFormatSecondsInTimeZone(t *testing.T)</a>

```
searchKey: time_test.TestFormatSecondsInTimeZone
tags: [function private test]
```

```Go
func TestFormatSecondsInTimeZone(t *testing.T)
```

### <a id="TestFormatShortYear" href="#TestFormatShortYear">func TestFormatShortYear(t *testing.T)</a>

```
searchKey: time_test.TestFormatShortYear
tags: [function private test]
```

```Go
func TestFormatShortYear(t *testing.T)
```

### <a id="TestFormatSingleDigits" href="#TestFormatSingleDigits">func TestFormatSingleDigits(t *testing.T)</a>

```
searchKey: time_test.TestFormatSingleDigits
tags: [function private test]
```

```Go
func TestFormatSingleDigits(t *testing.T)
```

issue 12440. 

### <a id="TestGoString" href="#TestGoString">func TestGoString(t *testing.T)</a>

```
searchKey: time_test.TestGoString
tags: [function private test]
```

```Go
func TestGoString(t *testing.T)
```

### <a id="TestHasMonotonicClock" href="#TestHasMonotonicClock">func TestHasMonotonicClock(t *testing.T)</a>

```
searchKey: time_test.TestHasMonotonicClock
tags: [function private test]
```

```Go
func TestHasMonotonicClock(t *testing.T)
```

### <a id="TestISOWeek" href="#TestISOWeek">func TestISOWeek(t *testing.T)</a>

```
searchKey: time_test.TestISOWeek
tags: [function private test]
```

```Go
func TestISOWeek(t *testing.T)
```

### <a id="TestInvalidTimeGob" href="#TestInvalidTimeGob">func TestInvalidTimeGob(t *testing.T)</a>

```
searchKey: time_test.TestInvalidTimeGob
tags: [function private test]
```

```Go
func TestInvalidTimeGob(t *testing.T)
```

### <a id="TestInvalidTimeJSON" href="#TestInvalidTimeJSON">func TestInvalidTimeJSON(t *testing.T)</a>

```
searchKey: time_test.TestInvalidTimeJSON
tags: [function private test]
```

```Go
func TestInvalidTimeJSON(t *testing.T)
```

### <a id="TestIssue5745" href="#TestIssue5745">func TestIssue5745(t *testing.T)</a>

```
searchKey: time_test.TestIssue5745
tags: [function private test]
```

```Go
func TestIssue5745(t *testing.T)
```

Test that a panic while deleting a timer does not leave the timers mutex held, deadlocking a ticker.Stop in a defer. 

### <a id="TestLoadFixed" href="#TestLoadFixed">func TestLoadFixed(t *testing.T)</a>

```
searchKey: time_test.TestLoadFixed
tags: [function private test]
```

```Go
func TestLoadFixed(t *testing.T)
```

### <a id="TestLoadLocationFromTZData" href="#TestLoadLocationFromTZData">func TestLoadLocationFromTZData(t *testing.T)</a>

```
searchKey: time_test.TestLoadLocationFromTZData
tags: [function private test]
```

```Go
func TestLoadLocationFromTZData(t *testing.T)
```

### <a id="TestLoadLocationFromTZDataSlim" href="#TestLoadLocationFromTZDataSlim">func TestLoadLocationFromTZDataSlim(t *testing.T)</a>

```
searchKey: time_test.TestLoadLocationFromTZDataSlim
tags: [function private test]
```

```Go
func TestLoadLocationFromTZDataSlim(t *testing.T)
```

### <a id="TestLoadLocationValidatesNames" href="#TestLoadLocationValidatesNames">func TestLoadLocationValidatesNames(t *testing.T)</a>

```
searchKey: time_test.TestLoadLocationValidatesNames
tags: [function private test]
```

```Go
func TestLoadLocationValidatesNames(t *testing.T)
```

### <a id="TestLoadLocationZipFile" href="#TestLoadLocationZipFile">func TestLoadLocationZipFile(t *testing.T)</a>

```
searchKey: time_test.TestLoadLocationZipFile
tags: [function private test]
```

```Go
func TestLoadLocationZipFile(t *testing.T)
```

### <a id="TestLocationNames" href="#TestLocationNames">func TestLocationNames(t *testing.T)</a>

```
searchKey: time_test.TestLocationNames
tags: [function private test]
```

```Go
func TestLocationNames(t *testing.T)
```

### <a id="TestLocationRace" href="#TestLocationRace">func TestLocationRace(t *testing.T)</a>

```
searchKey: time_test.TestLocationRace
tags: [function private test]
```

```Go
func TestLocationRace(t *testing.T)
```

golang.org/issue/4622 

### <a id="TestMalformedTZData" href="#TestMalformedTZData">func TestMalformedTZData(t *testing.T)</a>

```
searchKey: time_test.TestMalformedTZData
tags: [function private test]
```

```Go
func TestMalformedTZData(t *testing.T)
```

### <a id="TestMarshalBinaryZeroTime" href="#TestMarshalBinaryZeroTime">func TestMarshalBinaryZeroTime(t *testing.T)</a>

```
searchKey: time_test.TestMarshalBinaryZeroTime
tags: [function private test]
```

```Go
func TestMarshalBinaryZeroTime(t *testing.T)
```

### <a id="TestMidnightIs12AM" href="#TestMidnightIs12AM">func TestMidnightIs12AM(t *testing.T)</a>

```
searchKey: time_test.TestMidnightIs12AM
tags: [function private test]
```

```Go
func TestMidnightIs12AM(t *testing.T)
```

### <a id="TestMinutesInTimeZone" href="#TestMinutesInTimeZone">func TestMinutesInTimeZone(t *testing.T)</a>

```
searchKey: time_test.TestMinutesInTimeZone
tags: [function private test]
```

```Go
func TestMinutesInTimeZone(t *testing.T)
```

### <a id="TestMissingZone" href="#TestMissingZone">func TestMissingZone(t *testing.T)</a>

```
searchKey: time_test.TestMissingZone
tags: [function private test]
```

```Go
func TestMissingZone(t *testing.T)
```

Check that a time without a Zone still produces a (numeric) time zone when formatted with MST as a requested zone. 

### <a id="TestMonotonicAdd" href="#TestMonotonicAdd">func TestMonotonicAdd(t *testing.T)</a>

```
searchKey: time_test.TestMonotonicAdd
tags: [function private test]
```

```Go
func TestMonotonicAdd(t *testing.T)
```

### <a id="TestMonotonicOverflow" href="#TestMonotonicOverflow">func TestMonotonicOverflow(t *testing.T)</a>

```
searchKey: time_test.TestMonotonicOverflow
tags: [function private test]
```

```Go
func TestMonotonicOverflow(t *testing.T)
```

### <a id="TestMonotonicString" href="#TestMonotonicString">func TestMonotonicString(t *testing.T)</a>

```
searchKey: time_test.TestMonotonicString
tags: [function private test]
```

```Go
func TestMonotonicString(t *testing.T)
```

### <a id="TestMonotonicSub" href="#TestMonotonicSub">func TestMonotonicSub(t *testing.T)</a>

```
searchKey: time_test.TestMonotonicSub
tags: [function private test]
```

```Go
func TestMonotonicSub(t *testing.T)
```

### <a id="TestNanosecondsToLocalTime" href="#TestNanosecondsToLocalTime">func TestNanosecondsToLocalTime(t *testing.T)</a>

```
searchKey: time_test.TestNanosecondsToLocalTime
tags: [function private test]
```

```Go
func TestNanosecondsToLocalTime(t *testing.T)
```

### <a id="TestNanosecondsToUTC" href="#TestNanosecondsToUTC">func TestNanosecondsToUTC(t *testing.T)</a>

```
searchKey: time_test.TestNanosecondsToUTC
tags: [function private test]
```

```Go
func TestNanosecondsToUTC(t *testing.T)
```

### <a id="TestNanosecondsToUTCAndBack" href="#TestNanosecondsToUTCAndBack">func TestNanosecondsToUTCAndBack(t *testing.T)</a>

```
searchKey: time_test.TestNanosecondsToUTCAndBack
tags: [function private test]
```

```Go
func TestNanosecondsToUTCAndBack(t *testing.T)
```

### <a id="TestNewTickerLtZeroDuration" href="#TestNewTickerLtZeroDuration">func TestNewTickerLtZeroDuration(t *testing.T)</a>

```
searchKey: time_test.TestNewTickerLtZeroDuration
tags: [function private test]
```

```Go
func TestNewTickerLtZeroDuration(t *testing.T)
```

Test that NewTicker panics when given a duration less than zero. 

### <a id="TestNextStdChunk" href="#TestNextStdChunk">func TestNextStdChunk(t *testing.T)</a>

```
searchKey: time_test.TestNextStdChunk
tags: [function private test]
```

```Go
func TestNextStdChunk(t *testing.T)
```

### <a id="TestNoonIs12PM" href="#TestNoonIs12PM">func TestNoonIs12PM(t *testing.T)</a>

```
searchKey: time_test.TestNoonIs12PM
tags: [function private test]
```

```Go
func TestNoonIs12PM(t *testing.T)
```

### <a id="TestNotGobEncodableTime" href="#TestNotGobEncodableTime">func TestNotGobEncodableTime(t *testing.T)</a>

```
searchKey: time_test.TestNotGobEncodableTime
tags: [function private test]
```

```Go
func TestNotGobEncodableTime(t *testing.T)
```

### <a id="TestNotJSONEncodableTime" href="#TestNotJSONEncodableTime">func TestNotJSONEncodableTime(t *testing.T)</a>

```
searchKey: time_test.TestNotJSONEncodableTime
tags: [function private test]
```

```Go
func TestNotJSONEncodableTime(t *testing.T)
```

### <a id="TestOverflowPeriodRuntimeTimer" href="#TestOverflowPeriodRuntimeTimer">func TestOverflowPeriodRuntimeTimer(t *testing.T)</a>

```
searchKey: time_test.TestOverflowPeriodRuntimeTimer
tags: [function private test]
```

```Go
func TestOverflowPeriodRuntimeTimer(t *testing.T)
```

### <a id="TestOverflowSleep" href="#TestOverflowSleep">func TestOverflowSleep(t *testing.T)</a>

```
searchKey: time_test.TestOverflowSleep
tags: [function private test]
```

```Go
func TestOverflowSleep(t *testing.T)
```

Test that sleeping (via Sleep or Timer) for an interval so large it overflows does not result in a short sleep duration. Nor does it interfere with execution of other timers. If it does, timers in this or subsequent tests may not fire. 

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: time_test.TestParse
tags: [function private test]
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestParseDayOutOfRange" href="#TestParseDayOutOfRange">func TestParseDayOutOfRange(t *testing.T)</a>

```
searchKey: time_test.TestParseDayOutOfRange
tags: [function private test]
```

```Go
func TestParseDayOutOfRange(t *testing.T)
```

### <a id="TestParseDuration" href="#TestParseDuration">func TestParseDuration(t *testing.T)</a>

```
searchKey: time_test.TestParseDuration
tags: [function private test]
```

```Go
func TestParseDuration(t *testing.T)
```

### <a id="TestParseDurationErrors" href="#TestParseDurationErrors">func TestParseDurationErrors(t *testing.T)</a>

```
searchKey: time_test.TestParseDurationErrors
tags: [function private test]
```

```Go
func TestParseDurationErrors(t *testing.T)
```

### <a id="TestParseDurationRoundTrip" href="#TestParseDurationRoundTrip">func TestParseDurationRoundTrip(t *testing.T)</a>

```
searchKey: time_test.TestParseDurationRoundTrip
tags: [function private test]
```

```Go
func TestParseDurationRoundTrip(t *testing.T)
```

### <a id="TestParseErrors" href="#TestParseErrors">func TestParseErrors(t *testing.T)</a>

```
searchKey: time_test.TestParseErrors
tags: [function private test]
```

```Go
func TestParseErrors(t *testing.T)
```

### <a id="TestParseInLocation" href="#TestParseInLocation">func TestParseInLocation(t *testing.T)</a>

```
searchKey: time_test.TestParseInLocation
tags: [function private test]
```

```Go
func TestParseInLocation(t *testing.T)
```

TestParseInLocation checks that the Parse and ParseInLocation functions do not get confused by the fact that AST (Arabia Standard Time) and AST (Atlantic Standard Time) are different time zones, even though they have the same abbreviation. 

ICANN has been slowly phasing out invented abbreviation in favor of numeric time zones (for example, the Asia/Baghdad time zone abbreviation got changed from AST to +03 in the 2017a tzdata release); but we still want to make sure that the time package does not get confused on systems with slightly older tzdata packages. 

### <a id="TestParseMonthOutOfRange" href="#TestParseMonthOutOfRange">func TestParseMonthOutOfRange(t *testing.T)</a>

```
searchKey: time_test.TestParseMonthOutOfRange
tags: [function private test]
```

```Go
func TestParseMonthOutOfRange(t *testing.T)
```

### <a id="TestParseSecondsInTimeZone" href="#TestParseSecondsInTimeZone">func TestParseSecondsInTimeZone(t *testing.T)</a>

```
searchKey: time_test.TestParseSecondsInTimeZone
tags: [function private test]
```

```Go
func TestParseSecondsInTimeZone(t *testing.T)
```

### <a id="TestParseTimeZone" href="#TestParseTimeZone">func TestParseTimeZone(t *testing.T)</a>

```
searchKey: time_test.TestParseTimeZone
tags: [function private test]
```

```Go
func TestParseTimeZone(t *testing.T)
```

### <a id="TestParseYday" href="#TestParseYday">func TestParseYday(t *testing.T)</a>

```
searchKey: time_test.TestParseYday
tags: [function private test]
```

```Go
func TestParseYday(t *testing.T)
```

Issue 37387. 

### <a id="TestQuote" href="#TestQuote">func TestQuote(t *testing.T)</a>

```
searchKey: time_test.TestQuote
tags: [function private test]
```

```Go
func TestQuote(t *testing.T)
```

Issue 45391. 

### <a id="TestRFC3339Conversion" href="#TestRFC3339Conversion">func TestRFC3339Conversion(t *testing.T)</a>

```
searchKey: time_test.TestRFC3339Conversion
tags: [function private test]
```

```Go
func TestRFC3339Conversion(t *testing.T)
```

### <a id="TestReadFileLimit" href="#TestReadFileLimit">func TestReadFileLimit(t *testing.T)</a>

```
searchKey: time_test.TestReadFileLimit
tags: [function private test]
```

```Go
func TestReadFileLimit(t *testing.T)
```

### <a id="TestReset" href="#TestReset">func TestReset(t *testing.T)</a>

```
searchKey: time_test.TestReset
tags: [function private test]
```

```Go
func TestReset(t *testing.T)
```

### <a id="TestRubyParse" href="#TestRubyParse">func TestRubyParse(t *testing.T)</a>

```
searchKey: time_test.TestRubyParse
tags: [function private test]
```

```Go
func TestRubyParse(t *testing.T)
```

Problematic time zone format needs special tests. 

### <a id="TestSecondsToLocalTime" href="#TestSecondsToLocalTime">func TestSecondsToLocalTime(t *testing.T)</a>

```
searchKey: time_test.TestSecondsToLocalTime
tags: [function private test]
```

```Go
func TestSecondsToLocalTime(t *testing.T)
```

### <a id="TestSecondsToUTC" href="#TestSecondsToUTC">func TestSecondsToUTC(t *testing.T)</a>

```
searchKey: time_test.TestSecondsToUTC
tags: [function private test]
```

```Go
func TestSecondsToUTC(t *testing.T)
```

### <a id="TestSecondsToUTCAndBack" href="#TestSecondsToUTCAndBack">func TestSecondsToUTCAndBack(t *testing.T)</a>

```
searchKey: time_test.TestSecondsToUTCAndBack
tags: [function private test]
```

```Go
func TestSecondsToUTCAndBack(t *testing.T)
```

### <a id="TestSleep" href="#TestSleep">func TestSleep(t *testing.T)</a>

```
searchKey: time_test.TestSleep
tags: [function private test]
```

```Go
func TestSleep(t *testing.T)
```

### <a id="TestSleepZeroDeadlock" href="#TestSleepZeroDeadlock">func TestSleepZeroDeadlock(t *testing.T)</a>

```
searchKey: time_test.TestSleepZeroDeadlock
tags: [function private test]
```

```Go
func TestSleepZeroDeadlock(t *testing.T)
```

### <a id="TestStd0xParseError" href="#TestStd0xParseError">func TestStd0xParseError(t *testing.T)</a>

```
searchKey: time_test.TestStd0xParseError
tags: [function private test]
```

```Go
func TestStd0xParseError(t *testing.T)
```

Issue 29918, 29916 

### <a id="TestSub" href="#TestSub">func TestSub(t *testing.T)</a>

```
searchKey: time_test.TestSub
tags: [function private test]
```

```Go
func TestSub(t *testing.T)
```

### <a id="TestTeardown" href="#TestTeardown">func TestTeardown(t *testing.T)</a>

```
searchKey: time_test.TestTeardown
tags: [function private test]
```

```Go
func TestTeardown(t *testing.T)
```

Test that a bug tearing down a ticker has been fixed. This routine should not deadlock. 

### <a id="TestTick" href="#TestTick">func TestTick(t *testing.T)</a>

```
searchKey: time_test.TestTick
tags: [function private test]
```

```Go
func TestTick(t *testing.T)
```

Test the Tick convenience wrapper. 

### <a id="TestTicker" href="#TestTicker">func TestTicker(t *testing.T)</a>

```
searchKey: time_test.TestTicker
tags: [function private test]
```

```Go
func TestTicker(t *testing.T)
```

### <a id="TestTickerStopWithDirectInitialization" href="#TestTickerStopWithDirectInitialization">func TestTickerStopWithDirectInitialization(t *testing.T)</a>

```
searchKey: time_test.TestTickerStopWithDirectInitialization
tags: [function private test]
```

```Go
func TestTickerStopWithDirectInitialization(t *testing.T)
```

Issue 21874 

### <a id="TestTimeAddSecOverflow" href="#TestTimeAddSecOverflow">func TestTimeAddSecOverflow(t *testing.T)</a>

```
searchKey: time_test.TestTimeAddSecOverflow
tags: [function private test]
```

```Go
func TestTimeAddSecOverflow(t *testing.T)
```

### <a id="TestTimeGob" href="#TestTimeGob">func TestTimeGob(t *testing.T)</a>

```
searchKey: time_test.TestTimeGob
tags: [function private test]
```

```Go
func TestTimeGob(t *testing.T)
```

### <a id="TestTimeIsDST" href="#TestTimeIsDST">func TestTimeIsDST(t *testing.T)</a>

```
searchKey: time_test.TestTimeIsDST
tags: [function private test]
```

```Go
func TestTimeIsDST(t *testing.T)
```

### <a id="TestTimeJSON" href="#TestTimeJSON">func TestTimeJSON(t *testing.T)</a>

```
searchKey: time_test.TestTimeJSON
tags: [function private test]
```

```Go
func TestTimeJSON(t *testing.T)
```

### <a id="TestTimerStopStress" href="#TestTimerStopStress">func TestTimerStopStress(t *testing.T)</a>

```
searchKey: time_test.TestTimerStopStress
tags: [function private test]
```

```Go
func TestTimerStopStress(t *testing.T)
```

### <a id="TestTruncateRound" href="#TestTruncateRound">func TestTruncateRound(t *testing.T)</a>

```
searchKey: time_test.TestTruncateRound
tags: [function private test]
```

```Go
func TestTruncateRound(t *testing.T)
```

### <a id="TestTzset" href="#TestTzset">func TestTzset(t *testing.T)</a>

```
searchKey: time_test.TestTzset
tags: [function private test]
```

```Go
func TestTzset(t *testing.T)
```

### <a id="TestTzsetName" href="#TestTzsetName">func TestTzsetName(t *testing.T)</a>

```
searchKey: time_test.TestTzsetName
tags: [function private test]
```

```Go
func TestTzsetName(t *testing.T)
```

### <a id="TestTzsetOffset" href="#TestTzsetOffset">func TestTzsetOffset(t *testing.T)</a>

```
searchKey: time_test.TestTzsetOffset
tags: [function private test]
```

```Go
func TestTzsetOffset(t *testing.T)
```

### <a id="TestTzsetRule" href="#TestTzsetRule">func TestTzsetRule(t *testing.T)</a>

```
searchKey: time_test.TestTzsetRule
tags: [function private test]
```

```Go
func TestTzsetRule(t *testing.T)
```

### <a id="TestUnderscoreTwoThousand" href="#TestUnderscoreTwoThousand">func TestUnderscoreTwoThousand(t *testing.T)</a>

```
searchKey: time_test.TestUnderscoreTwoThousand
tags: [function private test]
```

```Go
func TestUnderscoreTwoThousand(t *testing.T)
```

Issue 11334. 

### <a id="TestUnixMicro" href="#TestUnixMicro">func TestUnixMicro(t *testing.T)</a>

```
searchKey: time_test.TestUnixMicro
tags: [function private test]
```

```Go
func TestUnixMicro(t *testing.T)
```

### <a id="TestUnixMilli" href="#TestUnixMilli">func TestUnixMilli(t *testing.T)</a>

```
searchKey: time_test.TestUnixMilli
tags: [function private test]
```

```Go
func TestUnixMilli(t *testing.T)
```

### <a id="TestVersion3" href="#TestVersion3">func TestVersion3(t *testing.T)</a>

```
searchKey: time_test.TestVersion3
tags: [function private test]
```

```Go
func TestVersion3(t *testing.T)
```

### <a id="TestWeekdayString" href="#TestWeekdayString">func TestWeekdayString(t *testing.T)</a>

```
searchKey: time_test.TestWeekdayString
tags: [function private test]
```

```Go
func TestWeekdayString(t *testing.T)
```

Issue 24692: Out of range weekday panics 

### <a id="TestYearDay" href="#TestYearDay">func TestYearDay(t *testing.T)</a>

```
searchKey: time_test.TestYearDay
tags: [function private test]
```

```Go
func TestYearDay(t *testing.T)
```

### <a id="TestZeroMonthString" href="#TestZeroMonthString">func TestZeroMonthString(t *testing.T)</a>

```
searchKey: time_test.TestZeroMonthString
tags: [function private test]
```

```Go
func TestZeroMonthString(t *testing.T)
```

Issue 17720: Zero value of time.Month fails to print 

### <a id="TestZeroTimer" href="#TestZeroTimer">func TestZeroTimer(t *testing.T)</a>

```
searchKey: time_test.TestZeroTimer
tags: [function private test]
```

```Go
func TestZeroTimer(t *testing.T)
```

Test that zero duration timers aren't missed by the scheduler. Regression test for issue 44868. 

### <a id="TestZeroTimerResetPanics" href="#TestZeroTimerResetPanics">func TestZeroTimerResetPanics(t *testing.T)</a>

```
searchKey: time_test.TestZeroTimerResetPanics
tags: [function private test]
```

```Go
func TestZeroTimerResetPanics(t *testing.T)
```

### <a id="TestZeroTimerStopPanics" href="#TestZeroTimerStopPanics">func TestZeroTimerStopPanics(t *testing.T)</a>

```
searchKey: time_test.TestZeroTimerStopPanics
tags: [function private test]
```

```Go
func TestZeroTimerStopPanics(t *testing.T)
```

### <a id="TestZoneData" href="#TestZoneData">func TestZoneData(t *testing.T)</a>

```
searchKey: time_test.TestZoneData
tags: [function private test]
```

```Go
func TestZoneData(t *testing.T)
```

We should be in PST/PDT, but if the time zone files are missing we won't be. The purpose of this test is to at least explain why some of the subsequent tests fail. 

### <a id="abs" href="#abs">func abs(t Time) (sec, nsec int64)</a>

```
searchKey: time_test.abs
tags: [function private]
```

```Go
func abs(t Time) (sec, nsec int64)
```

abs returns the absolute time stored in t, as seconds and nanoseconds. 

### <a id="absString" href="#absString">func absString(t Time) string</a>

```
searchKey: time_test.absString
tags: [function private]
```

```Go
func absString(t Time) string
```

absString returns abs as a decimal string. 

### <a id="await" href="#await">func await(slot int, result chan<- afterResult, ac <-chan Time)</a>

```
searchKey: time_test.await
tags: [function private]
```

```Go
func await(slot int, result chan<- afterResult, ac <-chan Time)
```

### <a id="benchmark" href="#benchmark">func benchmark(b *testing.B, bench func(n int))</a>

```
searchKey: time_test.benchmark
tags: [function private]
```

```Go
func benchmark(b *testing.B, bench func(n int))
```

### <a id="checkTime" href="#checkTime">func checkTime(time Time, test *ParseTest, t *testing.T)</a>

```
searchKey: time_test.checkTime
tags: [function private]
```

```Go
func checkTime(time Time, test *ParseTest, t *testing.T)
```

### <a id="checkZeroPanicString" href="#checkZeroPanicString">func checkZeroPanicString(t *testing.T)</a>

```
searchKey: time_test.checkZeroPanicString
tags: [function private]
```

```Go
func checkZeroPanicString(t *testing.T)
```

### <a id="doWork" href="#doWork">func doWork(dur Duration)</a>

```
searchKey: time_test.doWork
tags: [function private]
```

```Go
func doWork(dur Duration)
```

### <a id="equal" href="#equal">func equal(t *testing.T, f1, f2 reflect.Value) bool</a>

```
searchKey: time_test.equal
tags: [function private]
```

```Go
func equal(t *testing.T, f1, f2 reflect.Value) bool
```

equal is a small version of reflect.DeepEqual that we use to compare the values of zoneinfo unexported fields. 

### <a id="equalTimeAndZone" href="#equalTimeAndZone">func equalTimeAndZone(a, b Time) bool</a>

```
searchKey: time_test.equalTimeAndZone
tags: [function private]
```

```Go
func equalTimeAndZone(a, b Time) bool
```

### <a id="expensiveCall" href="#expensiveCall">func expensiveCall()</a>

```
searchKey: time_test.expensiveCall
tags: [function private]
```

```Go
func expensiveCall()
```

### <a id="handle" href="#handle">func handle(int)</a>

```
searchKey: time_test.handle
tags: [function private]
```

```Go
func handle(int)
```

### <a id="init.zoneinfo_test.go" href="#init.zoneinfo_test.go">func init()</a>

```
searchKey: time_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="same" href="#same">func same(t Time, u *parsedTime) bool</a>

```
searchKey: time_test.same
tags: [function private]
```

```Go
func same(t Time, u *parsedTime) bool
```

### <a id="statusUpdate" href="#statusUpdate">func statusUpdate() string</a>

```
searchKey: time_test.statusUpdate
tags: [function private]
```

```Go
func statusUpdate() string
```

### <a id="testAfterQueuing" href="#testAfterQueuing">func testAfterQueuing(delta Duration) error</a>

```
searchKey: time_test.testAfterQueuing
tags: [function private]
```

```Go
func testAfterQueuing(delta Duration) error
```

### <a id="testReset" href="#testReset">func testReset(d Duration) error</a>

```
searchKey: time_test.testReset
tags: [function private]
```

```Go
func testReset(d Duration) error
```

### <a id="warmupScheduler" href="#warmupScheduler">func warmupScheduler(targetThreadCount int)</a>

```
searchKey: time_test.warmupScheduler
tags: [function private]
```

```Go
func warmupScheduler(targetThreadCount int)
```

warmupScheduler ensures the scheduler has at least targetThreadCount threads in its thread pool. 

