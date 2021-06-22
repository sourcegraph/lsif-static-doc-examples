# Package testing_test

## Index

* [Variables](#var)
    * [var global](#global)
    * [var allocsPerRunTests](#allocsPerRunTests)
    * [var prettyPrintTests](#prettyPrintTests)
    * [var testPanicTest](#testPanicTest)
    * [var testPanicParallel](#testPanicParallel)
    * [var testPanicCleanup](#testPanicCleanup)
    * [var testPanicCleanupPanic](#testPanicCleanupPanic)
* [Functions](#func)
    * [func TestAllocsPerRun(t *testing.T)](#TestAllocsPerRun)
    * [func TestPrettyPrint(t *testing.T)](#TestPrettyPrint)
    * [func TestResultString(t *testing.T)](#TestResultString)
    * [func TestRunParallel(t *testing.T)](#TestRunParallel)
    * [func TestRunParallelFail(t *testing.T)](#TestRunParallelFail)
    * [func TestRunParallelFatal(t *testing.T)](#TestRunParallelFatal)
    * [func TestRunParallelSkipNow(t *testing.T)](#TestRunParallelSkipNow)
    * [func ExampleB_RunParallel()](#ExampleB_RunParallel)
    * [func TestReportMetric(t *testing.T)](#TestReportMetric)
    * [func ExampleB_ReportMetric()](#ExampleB_ReportMetric)
    * [func TestPanic(t *testing.T)](#TestPanic)
    * [func makeRegexp(s string) string](#makeRegexp)
    * [func TestPanicHelper(t *testing.T)](#TestPanicHelper)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestTempDirInCleanup(t *testing.T)](#TestTempDirInCleanup)
    * [func TestTempDirInBenchmark(t *testing.T)](#TestTempDirInBenchmark)
    * [func TestTempDir(t *testing.T)](#TestTempDir)
    * [func testTempDir(t *testing.T)](#testTempDir)
    * [func TestSetenv(t *testing.T)](#TestSetenv)
    * [func TestSetenvWithParallelAfterSetenv(t *testing.T)](#TestSetenvWithParallelAfterSetenv)
    * [func TestSetenvWithParallelBeforeSetenv(t *testing.T)](#TestSetenvWithParallelBeforeSetenv)


## <a id="var" href="#var">Variables</a>

### <a id="global" href="#global">var global</a>

```
searchKey: testing_test.global
```

```Go
var global interface{}
```

### <a id="allocsPerRunTests" href="#allocsPerRunTests">var allocsPerRunTests</a>

```
searchKey: testing_test.allocsPerRunTests
```

```Go
var allocsPerRunTests = ...
```

### <a id="prettyPrintTests" href="#prettyPrintTests">var prettyPrintTests</a>

```
searchKey: testing_test.prettyPrintTests
```

```Go
var prettyPrintTests = ...
```

### <a id="testPanicTest" href="#testPanicTest">var testPanicTest</a>

```
searchKey: testing_test.testPanicTest
```

```Go
var testPanicTest = ...
```

### <a id="testPanicParallel" href="#testPanicParallel">var testPanicParallel</a>

```
searchKey: testing_test.testPanicParallel
```

```Go
var testPanicParallel = ...
```

### <a id="testPanicCleanup" href="#testPanicCleanup">var testPanicCleanup</a>

```
searchKey: testing_test.testPanicCleanup
```

```Go
var testPanicCleanup = ...
```

### <a id="testPanicCleanupPanic" href="#testPanicCleanupPanic">var testPanicCleanupPanic</a>

```
searchKey: testing_test.testPanicCleanupPanic
```

```Go
var testPanicCleanupPanic = ...
```

## <a id="func" href="#func">Functions</a>

### <a id="TestAllocsPerRun" href="#TestAllocsPerRun">func TestAllocsPerRun(t *testing.T)</a>

```
searchKey: testing_test.TestAllocsPerRun
```

```Go
func TestAllocsPerRun(t *testing.T)
```

### <a id="TestPrettyPrint" href="#TestPrettyPrint">func TestPrettyPrint(t *testing.T)</a>

```
searchKey: testing_test.TestPrettyPrint
```

```Go
func TestPrettyPrint(t *testing.T)
```

### <a id="TestResultString" href="#TestResultString">func TestResultString(t *testing.T)</a>

```
searchKey: testing_test.TestResultString
```

```Go
func TestResultString(t *testing.T)
```

### <a id="TestRunParallel" href="#TestRunParallel">func TestRunParallel(t *testing.T)</a>

```
searchKey: testing_test.TestRunParallel
```

```Go
func TestRunParallel(t *testing.T)
```

### <a id="TestRunParallelFail" href="#TestRunParallelFail">func TestRunParallelFail(t *testing.T)</a>

```
searchKey: testing_test.TestRunParallelFail
```

```Go
func TestRunParallelFail(t *testing.T)
```

### <a id="TestRunParallelFatal" href="#TestRunParallelFatal">func TestRunParallelFatal(t *testing.T)</a>

```
searchKey: testing_test.TestRunParallelFatal
```

```Go
func TestRunParallelFatal(t *testing.T)
```

### <a id="TestRunParallelSkipNow" href="#TestRunParallelSkipNow">func TestRunParallelSkipNow(t *testing.T)</a>

```
searchKey: testing_test.TestRunParallelSkipNow
```

```Go
func TestRunParallelSkipNow(t *testing.T)
```

### <a id="ExampleB_RunParallel" href="#ExampleB_RunParallel">func ExampleB_RunParallel()</a>

```
searchKey: testing_test.ExampleB_RunParallel
```

```Go
func ExampleB_RunParallel()
```

### <a id="TestReportMetric" href="#TestReportMetric">func TestReportMetric(t *testing.T)</a>

```
searchKey: testing_test.TestReportMetric
```

```Go
func TestReportMetric(t *testing.T)
```

### <a id="ExampleB_ReportMetric" href="#ExampleB_ReportMetric">func ExampleB_ReportMetric()</a>

```
searchKey: testing_test.ExampleB_ReportMetric
```

```Go
func ExampleB_ReportMetric()
```

### <a id="TestPanic" href="#TestPanic">func TestPanic(t *testing.T)</a>

```
searchKey: testing_test.TestPanic
```

```Go
func TestPanic(t *testing.T)
```

### <a id="makeRegexp" href="#makeRegexp">func makeRegexp(s string) string</a>

```
searchKey: testing_test.makeRegexp
```

```Go
func makeRegexp(s string) string
```

### <a id="TestPanicHelper" href="#TestPanicHelper">func TestPanicHelper(t *testing.T)</a>

```
searchKey: testing_test.TestPanicHelper
```

```Go
func TestPanicHelper(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: testing_test.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestTempDirInCleanup" href="#TestTempDirInCleanup">func TestTempDirInCleanup(t *testing.T)</a>

```
searchKey: testing_test.TestTempDirInCleanup
```

```Go
func TestTempDirInCleanup(t *testing.T)
```

### <a id="TestTempDirInBenchmark" href="#TestTempDirInBenchmark">func TestTempDirInBenchmark(t *testing.T)</a>

```
searchKey: testing_test.TestTempDirInBenchmark
```

```Go
func TestTempDirInBenchmark(t *testing.T)
```

### <a id="TestTempDir" href="#TestTempDir">func TestTempDir(t *testing.T)</a>

```
searchKey: testing_test.TestTempDir
```

```Go
func TestTempDir(t *testing.T)
```

### <a id="testTempDir" href="#testTempDir">func testTempDir(t *testing.T)</a>

```
searchKey: testing_test.testTempDir
```

```Go
func testTempDir(t *testing.T)
```

### <a id="TestSetenv" href="#TestSetenv">func TestSetenv(t *testing.T)</a>

```
searchKey: testing_test.TestSetenv
```

```Go
func TestSetenv(t *testing.T)
```

### <a id="TestSetenvWithParallelAfterSetenv" href="#TestSetenvWithParallelAfterSetenv">func TestSetenvWithParallelAfterSetenv(t *testing.T)</a>

```
searchKey: testing_test.TestSetenvWithParallelAfterSetenv
```

```Go
func TestSetenvWithParallelAfterSetenv(t *testing.T)
```

### <a id="TestSetenvWithParallelBeforeSetenv" href="#TestSetenvWithParallelBeforeSetenv">func TestSetenvWithParallelBeforeSetenv(t *testing.T)</a>

```
searchKey: testing_test.TestSetenvWithParallelBeforeSetenv
```

```Go
func TestSetenvWithParallelBeforeSetenv(t *testing.T)
```

