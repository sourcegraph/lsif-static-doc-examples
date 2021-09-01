# Package testing_test

## Index

* [Variables](#var)
    * [var allocsPerRunTests](#allocsPerRunTests)
    * [var global](#global)
    * [var prettyPrintTests](#prettyPrintTests)
    * [var testPanicCleanup](#testPanicCleanup)
    * [var testPanicCleanupPanic](#testPanicCleanupPanic)
    * [var testPanicParallel](#testPanicParallel)
    * [var testPanicTest](#testPanicTest)
* [Functions](#func)
    * [func ExampleB_ReportMetric()](#ExampleB_ReportMetric)
    * [func ExampleB_RunParallel()](#ExampleB_RunParallel)
    * [func TestAllocsPerRun(t *testing.T)](#TestAllocsPerRun)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestPanic(t *testing.T)](#TestPanic)
    * [func TestPanicHelper(t *testing.T)](#TestPanicHelper)
    * [func TestPrettyPrint(t *testing.T)](#TestPrettyPrint)
    * [func TestReportMetric(t *testing.T)](#TestReportMetric)
    * [func TestResultString(t *testing.T)](#TestResultString)
    * [func TestRunParallel(t *testing.T)](#TestRunParallel)
    * [func TestRunParallelFail(t *testing.T)](#TestRunParallelFail)
    * [func TestRunParallelFatal(t *testing.T)](#TestRunParallelFatal)
    * [func TestRunParallelSkipNow(t *testing.T)](#TestRunParallelSkipNow)
    * [func TestSetenv(t *testing.T)](#TestSetenv)
    * [func TestSetenvWithParallelAfterSetenv(t *testing.T)](#TestSetenvWithParallelAfterSetenv)
    * [func TestSetenvWithParallelBeforeSetenv(t *testing.T)](#TestSetenvWithParallelBeforeSetenv)
    * [func TestTempDir(t *testing.T)](#TestTempDir)
    * [func TestTempDirInBenchmark(t *testing.T)](#TestTempDirInBenchmark)
    * [func TestTempDirInCleanup(t *testing.T)](#TestTempDirInCleanup)
    * [func makeRegexp(s string) string](#makeRegexp)
    * [func testTempDir(t *testing.T)](#testTempDir)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="allocsPerRunTests" href="#allocsPerRunTests">var allocsPerRunTests</a>

```
searchKey: testing_test.allocsPerRunTests
tags: [variable array struct private]
```

```Go
var allocsPerRunTests = ...
```

### <a id="global" href="#global">var global</a>

```
searchKey: testing_test.global
tags: [variable interface private]
```

```Go
var global interface{}
```

### <a id="prettyPrintTests" href="#prettyPrintTests">var prettyPrintTests</a>

```
searchKey: testing_test.prettyPrintTests
tags: [variable array struct private]
```

```Go
var prettyPrintTests = ...
```

### <a id="testPanicCleanup" href="#testPanicCleanup">var testPanicCleanup</a>

```
searchKey: testing_test.testPanicCleanup
tags: [variable boolean private]
```

```Go
var testPanicCleanup = ...
```

### <a id="testPanicCleanupPanic" href="#testPanicCleanupPanic">var testPanicCleanupPanic</a>

```
searchKey: testing_test.testPanicCleanupPanic
tags: [variable string private]
```

```Go
var testPanicCleanupPanic = ...
```

### <a id="testPanicParallel" href="#testPanicParallel">var testPanicParallel</a>

```
searchKey: testing_test.testPanicParallel
tags: [variable boolean private]
```

```Go
var testPanicParallel = ...
```

### <a id="testPanicTest" href="#testPanicTest">var testPanicTest</a>

```
searchKey: testing_test.testPanicTest
tags: [variable string private]
```

```Go
var testPanicTest = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleB_ReportMetric" href="#ExampleB_ReportMetric">func ExampleB_ReportMetric()</a>

```
searchKey: testing_test.ExampleB_ReportMetric
tags: [function private]
```

```Go
func ExampleB_ReportMetric()
```

### <a id="ExampleB_RunParallel" href="#ExampleB_RunParallel">func ExampleB_RunParallel()</a>

```
searchKey: testing_test.ExampleB_RunParallel
tags: [function private]
```

```Go
func ExampleB_RunParallel()
```

### <a id="TestAllocsPerRun" href="#TestAllocsPerRun">func TestAllocsPerRun(t *testing.T)</a>

```
searchKey: testing_test.TestAllocsPerRun
tags: [function private test]
```

```Go
func TestAllocsPerRun(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: testing_test.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestPanic" href="#TestPanic">func TestPanic(t *testing.T)</a>

```
searchKey: testing_test.TestPanic
tags: [function private test]
```

```Go
func TestPanic(t *testing.T)
```

### <a id="TestPanicHelper" href="#TestPanicHelper">func TestPanicHelper(t *testing.T)</a>

```
searchKey: testing_test.TestPanicHelper
tags: [function private test]
```

```Go
func TestPanicHelper(t *testing.T)
```

### <a id="TestPrettyPrint" href="#TestPrettyPrint">func TestPrettyPrint(t *testing.T)</a>

```
searchKey: testing_test.TestPrettyPrint
tags: [function private test]
```

```Go
func TestPrettyPrint(t *testing.T)
```

### <a id="TestReportMetric" href="#TestReportMetric">func TestReportMetric(t *testing.T)</a>

```
searchKey: testing_test.TestReportMetric
tags: [function private test]
```

```Go
func TestReportMetric(t *testing.T)
```

### <a id="TestResultString" href="#TestResultString">func TestResultString(t *testing.T)</a>

```
searchKey: testing_test.TestResultString
tags: [function private test]
```

```Go
func TestResultString(t *testing.T)
```

### <a id="TestRunParallel" href="#TestRunParallel">func TestRunParallel(t *testing.T)</a>

```
searchKey: testing_test.TestRunParallel
tags: [function private test]
```

```Go
func TestRunParallel(t *testing.T)
```

### <a id="TestRunParallelFail" href="#TestRunParallelFail">func TestRunParallelFail(t *testing.T)</a>

```
searchKey: testing_test.TestRunParallelFail
tags: [function private test]
```

```Go
func TestRunParallelFail(t *testing.T)
```

### <a id="TestRunParallelFatal" href="#TestRunParallelFatal">func TestRunParallelFatal(t *testing.T)</a>

```
searchKey: testing_test.TestRunParallelFatal
tags: [function private test]
```

```Go
func TestRunParallelFatal(t *testing.T)
```

### <a id="TestRunParallelSkipNow" href="#TestRunParallelSkipNow">func TestRunParallelSkipNow(t *testing.T)</a>

```
searchKey: testing_test.TestRunParallelSkipNow
tags: [function private test]
```

```Go
func TestRunParallelSkipNow(t *testing.T)
```

### <a id="TestSetenv" href="#TestSetenv">func TestSetenv(t *testing.T)</a>

```
searchKey: testing_test.TestSetenv
tags: [function private test]
```

```Go
func TestSetenv(t *testing.T)
```

### <a id="TestSetenvWithParallelAfterSetenv" href="#TestSetenvWithParallelAfterSetenv">func TestSetenvWithParallelAfterSetenv(t *testing.T)</a>

```
searchKey: testing_test.TestSetenvWithParallelAfterSetenv
tags: [function private test]
```

```Go
func TestSetenvWithParallelAfterSetenv(t *testing.T)
```

### <a id="TestSetenvWithParallelBeforeSetenv" href="#TestSetenvWithParallelBeforeSetenv">func TestSetenvWithParallelBeforeSetenv(t *testing.T)</a>

```
searchKey: testing_test.TestSetenvWithParallelBeforeSetenv
tags: [function private test]
```

```Go
func TestSetenvWithParallelBeforeSetenv(t *testing.T)
```

### <a id="TestTempDir" href="#TestTempDir">func TestTempDir(t *testing.T)</a>

```
searchKey: testing_test.TestTempDir
tags: [function private test]
```

```Go
func TestTempDir(t *testing.T)
```

### <a id="TestTempDirInBenchmark" href="#TestTempDirInBenchmark">func TestTempDirInBenchmark(t *testing.T)</a>

```
searchKey: testing_test.TestTempDirInBenchmark
tags: [function private test]
```

```Go
func TestTempDirInBenchmark(t *testing.T)
```

### <a id="TestTempDirInCleanup" href="#TestTempDirInCleanup">func TestTempDirInCleanup(t *testing.T)</a>

```
searchKey: testing_test.TestTempDirInCleanup
tags: [function private test]
```

```Go
func TestTempDirInCleanup(t *testing.T)
```

### <a id="makeRegexp" href="#makeRegexp">func makeRegexp(s string) string</a>

```
searchKey: testing_test.makeRegexp
tags: [function private]
```

```Go
func makeRegexp(s string) string
```

### <a id="testTempDir" href="#testTempDir">func testTempDir(t *testing.T)</a>

```
searchKey: testing_test.testTempDir
tags: [function private]
```

```Go
func testTempDir(t *testing.T)
```

