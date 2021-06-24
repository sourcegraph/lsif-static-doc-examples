# Package testing

Package testing provides support for automated testing of Go packages. It is intended to be used in concert with the "go test" command, which automates execution of any function of the form 

```
func TestXxx(*testing.T)

```
where Xxx does not start with a lowercase letter. The function name serves to identify the test routine. 

Within these functions, use the Error, Fail or related methods to signal failure. 

To write a new test suite, create a file whose name ends _test.go that contains the TestXxx functions as described here. Put the file in the same package as the one being tested. The file will be excluded from regular package builds but will be included when the "go test" command is run. For more detail, run "go help test" and "go help testflag". 

A simple test function looks like this: 

```
func TestAbs(t *testing.T) {
    got := Abs(-1)
    if got != 1 {
        t.Errorf("Abs(-1) = %d; want 1", got)
    }
}

```
### hdr-BenchmarksBenchmarks
Functions of the form 

```
func BenchmarkXxx(*testing.B)

```
are considered benchmarks, and are executed by the "go test" command when its -bench flag is provided. Benchmarks are run sequentially. 

For a description of the testing flags, see [https://golang.org/cmd/go/#hdr-Testing_flags](https://golang.org/cmd/go/#hdr-Testing_flags) 

A sample benchmark function looks like this: 

```
func BenchmarkRandInt(b *testing.B) {
    for i := 0; i < b.N; i++ {
        rand.Int()
    }
}

```
The benchmark function must run the target code b.N times. During benchmark execution, b.N is adjusted until the benchmark function lasts long enough to be timed reliably. The output 

```
BenchmarkRandInt-8   	68453040	        17.8 ns/op

```
means that the loop ran 68453040 times at a speed of 17.8 ns per loop. 

If a benchmark needs some expensive setup before running, the timer may be reset: 

```
func BenchmarkBigLen(b *testing.B) {
    big := NewBig()
    b.ResetTimer()
    for i := 0; i < b.N; i++ {
        big.Len()
    }
}

```
If a benchmark needs to test performance in a parallel setting, it may use the RunParallel helper function; such benchmarks are intended to be used with the go test -cpu flag: 

```
func BenchmarkTemplateParallel(b *testing.B) {
    templ := template.Must(template.New("test").Parse("Hello, {{.}}!"))
    b.RunParallel(func(pb *testing.PB) {
        var buf bytes.Buffer
        for pb.Next() {
            buf.Reset()
            templ.Execute(&buf, "World")
        }
    })
}

```
### hdr-ExamplesExamples
The package also runs and verifies example code. Example functions may include a concluding line comment that begins with "Output:" and is compared with the standard output of the function when the tests are run. (The comparison ignores leading and trailing space.) These are examples of an example: 

```
func ExampleHello() {
    fmt.Println("hello")
    // Output: hello
}

func ExampleSalutations() {
    fmt.Println("hello, and")
    fmt.Println("goodbye")
    // Output:
    // hello, and
    // goodbye
}

```
The comment prefix "Unordered output:" is like "Output:", but matches any line order: 

```
func ExamplePerm() {
    for _, value := range Perm(5) {
        fmt.Println(value)
    }
    // Unordered output: 4
    // 2
    // 1
    // 3
    // 0
}

```
Example functions without output comments are compiled but not executed. 

The naming convention to declare examples for the package, a function F, a type T and method M on type T are: 

```
func Example() { ... }
func ExampleF() { ... }
func ExampleT() { ... }
func ExampleT_M() { ... }

```
Multiple example functions for a package/type/function/method may be provided by appending a distinct suffix to the name. The suffix must start with a lower-case letter. 

```
func Example_suffix() { ... }
func ExampleF_suffix() { ... }
func ExampleT_suffix() { ... }
func ExampleT_M_suffix() { ... }

```
The entire test file is presented as the example when it contains a single example function, at least one other function, type, variable, or constant declaration, and no test or benchmark functions. 

### hdr-SkippingSkipping
Tests or benchmarks may be skipped at run time with a call to the Skip method of *T or *B: 

```
func TestTimeConsuming(t *testing.T) {
    if testing.Short() {
        t.Skip("skipping test in short mode.")
    }
    ...
}

```
### hdr-Subtests_and_Sub_benchmarksSubtests and Sub-benchmarks
The Run methods of T and B allow defining subtests and sub-benchmarks, without having to define separate functions for each. This enables uses like table-driven benchmarks and creating hierarchical tests. It also provides a way to share common setup and tear-down code: 

```
func TestFoo(t *testing.T) {
    // <setup code>
    t.Run("A=1", func(t *testing.T) { ... })
    t.Run("A=2", func(t *testing.T) { ... })
    t.Run("B=1", func(t *testing.T) { ... })
    // <tear-down code>
}

```
Each subtest and sub-benchmark has a unique name: the combination of the name of the top-level test and the sequence of names passed to Run, separated by slashes, with an optional trailing sequence number for disambiguation. 

The argument to the -run and -bench command-line flags is an unanchored regular expression that matches the test's name. For tests with multiple slash-separated elements, such as subtests, the argument is itself slash-separated, with expressions matching each name element in turn. Because it is unanchored, an empty expression matches any string. For example, using "matching" to mean "whose name contains": 

```
go test -run ''      # Run all tests.
go test -run Foo     # Run top-level tests matching "Foo", such as "TestFooBar".
go test -run Foo/A=  # For top-level tests matching "Foo", run subtests matching "A=".
go test -run /A=1    # For all top-level tests, run subtests matching "A=1".

```
Subtests can also be used to control parallelism. A parent test will only complete once all of its subtests complete. In this example, all tests are run in parallel with each other, and only with each other, regardless of other top-level tests that may be defined: 

```
func TestGroupedParallel(t *testing.T) {
    for _, tc := range tests {
        tc := tc // capture range variable
        t.Run(tc.Name, func(t *testing.T) {
            t.Parallel()
            ...
        })
    }
}

```
The race detector kills the program if it exceeds 8128 concurrent goroutines, so use care when running parallel tests with the -race flag set. 

Run does not return until parallel subtests have completed, providing a way to clean up after a group of parallel tests: 

```
func TestTeardownParallel(t *testing.T) {
    // This Run will not return until the parallel tests finish.
    t.Run("group", func(t *testing.T) {
        t.Run("Test1", parallelTest1)
        t.Run("Test2", parallelTest2)
        t.Run("Test3", parallelTest3)
    })
    // <tear-down code>
}

```
### hdr-MainMain
It is sometimes necessary for a test or benchmark program to do extra setup or teardown before or after it executes. It is also sometimes necessary to control which code runs on the main thread. To support these and other cases, if a test file contains a function: 

```
func TestMain(m *testing.M)

```
then the generated test will call TestMain(m) instead of running the tests or benchmarks directly. TestMain runs in the main goroutine and can do whatever setup and teardown is necessary around a call to m.Run. m.Run will return an exit code that may be passed to os.Exit. If TestMain returns, the test wrapper will pass the result of m.Run to os.Exit itself. 

When TestMain is called, flag.Parse has not been run. If TestMain depends on command-line flags, including those of the testing package, it should call flag.Parse explicitly. Command line flags are always parsed by the time test or benchmark functions run. 

A simple implementation of TestMain is: 

```
func TestMain(m *testing.M) {
	// call flag.Parse() here if TestMain uses flags
	os.Exit(m.Run())
}

```
## Index

* Subpages
  * [testing/internal](testing/internal.md)
  * [testing/fstest](testing/fstest.md)
  * [testing/iotest](testing/iotest.md)
  * [testing/iotest_test](testing/iotest_test.md)
  * [testing/quick](testing/quick.md)
* [Constants](#const)
    * [const maxStackLen](#maxStackLen)
    * [const normalPanic](#normalPanic)
    * [const recoverAndReturnPanic](#recoverAndReturnPanic)
* [Variables](#var)
    * [var PrettyPrint](#PrettyPrint)
    * [var benchTime](#benchTime)
    * [var benchmarkLock](#benchmarkLock)
    * [var benchmarkMemory](#benchmarkMemory)
    * [var blockProfile](#blockProfile)
    * [var blockProfileRate](#blockProfileRate)
    * [var chatty](#chatty)
    * [var count](#count)
    * [var cover](#cover)
    * [var coverProfile](#coverProfile)
    * [var cpuList](#cpuList)
    * [var cpuListStr](#cpuListStr)
    * [var cpuProfile](#cpuProfile)
    * [var errMain](#errMain)
    * [var errNilPanicOrGoexit](#errNilPanicOrGoexit)
    * [var failFast](#failFast)
    * [var haveExamples](#haveExamples)
    * [var initRan](#initRan)
    * [var labelsOnce](#labelsOnce)
    * [var match](#match)
    * [var matchBenchmarks](#matchBenchmarks)
    * [var matchList](#matchList)
    * [var matchMutex](#matchMutex)
    * [var memProfile](#memProfile)
    * [var memProfileRate](#memProfileRate)
    * [var memStats](#memStats)
    * [var mutexProfile](#mutexProfile)
    * [var mutexProfileFraction](#mutexProfileFraction)
    * [var numFailed](#numFailed)
    * [var outputDir](#outputDir)
    * [var panicOnExit0](#panicOnExit0)
    * [var parallel](#parallel)
    * [var short](#short)
    * [var shuffle](#shuffle)
    * [var testlog](#testlog)
    * [var testlogFile](#testlogFile)
    * [var timeout](#timeout)
    * [var traceFile](#traceFile)
* [Types](#type)
    * [type B struct](#B)
        * [func (b *B) ReportAllocs()](#B.ReportAllocs)
        * [func (b *B) ReportMetric(n float64, unit string)](#B.ReportMetric)
        * [func (b *B) ResetTimer()](#B.ResetTimer)
        * [func (b *B) Run(name string, f func(b *B)) bool](#B.Run)
        * [func (b *B) RunParallel(body func(*PB))](#B.RunParallel)
        * [func (b *B) SetBytes(n int64)](#B.SetBytes)
        * [func (b *B) SetParallelism(p int)](#B.SetParallelism)
        * [func (b *B) StartTimer()](#B.StartTimer)
        * [func (b *B) StopTimer()](#B.StopTimer)
        * [func (b *B) add(other BenchmarkResult)](#B.add)
        * [func (b *B) doBench() BenchmarkResult](#B.doBench)
        * [func (b *B) launch()](#B.launch)
        * [func (b *B) run()](#B.run)
        * [func (b *B) run1() bool](#B.run1)
        * [func (b *B) runN(n int)](#B.runN)
        * [func (b *B) trimOutput()](#B.trimOutput)
    * [type BenchmarkResult struct](#BenchmarkResult)
        * [func Benchmark(f func(b *B)) BenchmarkResult](#Benchmark)
        * [func (r BenchmarkResult) AllocedBytesPerOp() int64](#BenchmarkResult.AllocedBytesPerOp)
        * [func (r BenchmarkResult) AllocsPerOp() int64](#BenchmarkResult.AllocsPerOp)
        * [func (r BenchmarkResult) MemString() string](#BenchmarkResult.MemString)
        * [func (r BenchmarkResult) NsPerOp() int64](#BenchmarkResult.NsPerOp)
        * [func (r BenchmarkResult) String() string](#BenchmarkResult.String)
        * [func (r BenchmarkResult) mbPerSec() float64](#BenchmarkResult.mbPerSec)
    * [type Cover struct](#Cover)
    * [type CoverBlock struct](#CoverBlock)
    * [type InternalBenchmark struct](#InternalBenchmark)
    * [type InternalExample struct](#InternalExample)
        * [func (eg *InternalExample) processRunResult(stdout string, timeSpent time.Duration, finished bool, recovered interface{}) (passed bool)](#InternalExample.processRunResult)
    * [type InternalTest struct](#InternalTest)
    * [type M struct](#M)
        * [func MainStart(deps testDeps, tests []InternalTest, benchmarks []InternalBenchmark, examples []InternalExample) *M](#MainStart)
        * [func (m *M) Run() (code int)](#M.Run)
        * [func (m *M) after()](#M.after)
        * [func (m *M) before()](#M.before)
        * [func (m *M) startAlarm() time.Time](#M.startAlarm)
        * [func (m *M) stopAlarm()](#M.stopAlarm)
        * [func (m *M) writeProfiles()](#M.writeProfiles)
    * [type PB struct](#PB)
        * [func (pb *PB) Next() bool](#PB.Next)
    * [type T struct](#T)
        * [func (t *T) Deadline() (deadline time.Time, ok bool)](#T.Deadline)
        * [func (t *T) Parallel()](#T.Parallel)
        * [func (t *T) Run(name string, f func(t *T)) bool](#T.Run)
        * [func (t *T) Setenv(key, value string)](#T.Setenv)
        * [func (t *T) report()](#T.report)
    * [type TB interface](#TB)
    * [type benchContext struct](#benchContext)
        * [func (ctx *benchContext) processBench(b *B)](#benchContext.processBench)
    * [type benchTimeFlag struct](#benchTimeFlag)
        * [func (f *benchTimeFlag) Set(s string) error](#benchTimeFlag.Set)
        * [func (f *benchTimeFlag) String() string](#benchTimeFlag.String)
    * [type chattyPrinter struct](#chattyPrinter)
        * [func newChattyPrinter(w io.Writer) *chattyPrinter](#newChattyPrinter)
        * [func (p *chattyPrinter) Printf(testName, format string, args ...interface{})](#chattyPrinter.Printf)
        * [func (p *chattyPrinter) Updatef(testName, format string, args ...interface{})](#chattyPrinter.Updatef)
    * [type common struct](#common)
        * [func (c *common) Cleanup(f func())](#common.Cleanup)
        * [func (c *common) Error(args ...interface{})](#common.Error)
        * [func (c *common) Errorf(format string, args ...interface{})](#common.Errorf)
        * [func (c *common) Fail()](#common.Fail)
        * [func (c *common) FailNow()](#common.FailNow)
        * [func (c *common) Failed() bool](#common.Failed)
        * [func (c *common) Fatal(args ...interface{})](#common.Fatal)
        * [func (c *common) Fatalf(format string, args ...interface{})](#common.Fatalf)
        * [func (c *common) Helper()](#common.Helper)
        * [func (c *common) Log(args ...interface{})](#common.Log)
        * [func (c *common) Logf(format string, args ...interface{})](#common.Logf)
        * [func (c *common) Name() string](#common.Name)
        * [func (c *common) Setenv(key, value string)](#common.Setenv)
        * [func (c *common) Skip(args ...interface{})](#common.Skip)
        * [func (c *common) SkipNow()](#common.SkipNow)
        * [func (c *common) Skipf(format string, args ...interface{})](#common.Skipf)
        * [func (c *common) Skipped() bool](#common.Skipped)
        * [func (c *common) TempDir() string](#common.TempDir)
        * [func (c *common) decorate(s string, skip int) string](#common.decorate)
        * [func (c *common) flushToParent(testName, format string, args ...interface{})](#common.flushToParent)
        * [func (c *common) frameSkip(skip int) runtime.Frame](#common.frameSkip)
        * [func (c *common) log(s string)](#common.log)
        * [func (c *common) logDepth(s string, depth int)](#common.logDepth)
        * [func (c *common) private()](#common.private)
        * [func (c *common) runCleanup(ph panicHandling) (panicVal interface{})](#common.runCleanup)
        * [func (c *common) setRan()](#common.setRan)
    * [type discard struct{}](#discard)
        * [func (discard) Write(b []byte) (n int, err error)](#discard.Write)
    * [type funcWriter struct](#funcWriter)
        * [func (fw *funcWriter) Write(b []byte) (int, error)](#funcWriter.Write)
    * [type indenter struct](#indenter)
        * [func (w indenter) Write(b []byte) (n int, err error)](#indenter.Write)
    * [type matchStringOnly func(pat string, str string) (bool, error)](#matchStringOnly)
        * [func (f matchStringOnly) ImportPath() string](#matchStringOnly.ImportPath)
        * [func (f matchStringOnly) MatchString(pat, str string) (bool, error)](#matchStringOnly.MatchString)
        * [func (f matchStringOnly) SetPanicOnExit0(bool)](#matchStringOnly.SetPanicOnExit0)
        * [func (f matchStringOnly) StartCPUProfile(w io.Writer) error](#matchStringOnly.StartCPUProfile)
        * [func (f matchStringOnly) StartTestLog(io.Writer)](#matchStringOnly.StartTestLog)
        * [func (f matchStringOnly) StopCPUProfile()](#matchStringOnly.StopCPUProfile)
        * [func (f matchStringOnly) StopTestLog() error](#matchStringOnly.StopTestLog)
        * [func (f matchStringOnly) WriteProfileTo(string, io.Writer, int) error](#matchStringOnly.WriteProfileTo)
    * [type matcher struct](#matcher)
        * [func newMatcher(matchString func(pat, str string) (bool, error), patterns, name string) *matcher](#newMatcher)
        * [func (m *matcher) fullName(c *common, subname string) (name string, ok, partial bool)](#matcher.fullName)
        * [func (m *matcher) unique(parent, subname string) string](#matcher.unique)
    * [type noopWriter int](#noopWriter)
        * [func (nw *noopWriter) Write(b []byte) (int, error)](#noopWriter.Write)
    * [type panicHandling int](#panicHandling)
    * [type testContext struct](#testContext)
        * [func newTestContext(maxParallel int, m *matcher) *testContext](#newTestContext)
        * [func (c *testContext) release()](#testContext.release)
        * [func (c *testContext) waitParallel()](#testContext.waitParallel)
    * [type testDeps interface](#testDeps)
* [Functions](#func)
    * [func AllocsPerRun(runs int, f func()) (avg float64)](#AllocsPerRun)
    * [func BenchmarkTBHelper(b *B)](#BenchmarkTBHelper)
    * [func CoverMode() string](#CoverMode)
    * [func Coverage() float64](#Coverage)
    * [func Init()](#Init)
    * [func Main(matchString func(pat, str string) (bool, error), tests []InternalTest, benchmarks []InternalBenchmark, examples []InternalExample)](#Main)
    * [func RegisterCover(c Cover)](#RegisterCover)
    * [func RunBenchmarks(matchString func(pat, str string) (bool, error), benchmarks []InternalBenchmark)](#RunBenchmarks)
    * [func RunExamples(matchString func(pat, str string) (bool, error), examples []InternalExample) (ok bool)](#RunExamples)
    * [func RunTests(matchString func(pat, str string) (bool, error), tests []InternalTest) (ok bool)](#RunTests)
    * [func Short() bool](#Short)
    * [func TestBRun(t *T)](#TestBRun)
    * [func TestBenchmark(t *T)](#TestBenchmark)
    * [func TestBenchmarkOutput(t *T)](#TestBenchmarkOutput)
    * [func TestBenchmarkReadMemStatsBeforeFirstRun(t *T)](#TestBenchmarkReadMemStatsBeforeFirstRun)
    * [func TestBenchmarkStartsFrom1(t *T)](#TestBenchmarkStartsFrom1)
    * [func TestCleanup(t *T)](#TestCleanup)
    * [func TestCleanupCalledEvenAfterGoexit(t *T)](#TestCleanupCalledEvenAfterGoexit)
    * [func TestCleanupParallelSubtests(t *T)](#TestCleanupParallelSubtests)
    * [func TestConcurrentCleanup(t *T)](#TestConcurrentCleanup)
    * [func TestIsSpace(t *T)](#TestIsSpace)
    * [func TestLogAfterComplete(t *T)](#TestLogAfterComplete)
    * [func TestMatcher(t *T)](#TestMatcher)
    * [func TestNaming(t *T)](#TestNaming)
    * [func TestNestedCleanup(t *T)](#TestNestedCleanup)
    * [func TestParallelSub(t *T)](#TestParallelSub)
    * [func TestRacyOutput(t *T)](#TestRacyOutput)
    * [func TestRunCleanup(t *T)](#TestRunCleanup)
    * [func TestSplitRegexp(t *T)](#TestSplitRegexp)
    * [func TestTBHelper(t *T)](#TestTBHelper)
    * [func TestTBHelperLineNumer(t *T)](#TestTBHelperLineNumer)
    * [func TestTBHelperParallel(t *T)](#TestTBHelperParallel)
    * [func TestTRun(t *T)](#TestTRun)
    * [func TestTestContext(t *T)](#TestTestContext)
    * [func Verbose() bool](#Verbose)
    * [func benchmarkName(name string, n int) string](#benchmarkName)
    * [func callerName(skip int) string](#callerName)
    * [func coverReport()](#coverReport)
    * [func fmtDuration(d time.Duration) string](#fmtDuration)
    * [func helper(t *T, msg string)](#helper)
    * [func helperCallingHelper(t *T, msg string)](#helperCallingHelper)
    * [func init()](#init.sub_test.go)
    * [func initBenchmarkFlags()](#initBenchmarkFlags)
    * [func isSpace(r rune) bool](#isSpace)
    * [func listTests(matchString func(pat, str string) (bool, error), tests []InternalTest, benchmarks []InternalBenchmark, examples []InternalExample)](#listTests)
    * [func makeRegexp(s string) string](#makeRegexp)
    * [func max(x, y int64) int64](#max)
    * [func min(x, y int64) int64](#min)
    * [func mustBeNil(err error)](#mustBeNil)
    * [func notHelper(t *T, msg string)](#notHelper)
    * [func notHelperCallingHelper(t *T, msg string)](#notHelperCallingHelper)
    * [func parallelTestHelper(t *T)](#parallelTestHelper)
    * [func parseCpuList()](#parseCpuList)
    * [func pcToName(pc uintptr) string](#pcToName)
    * [func prettyPrint(w io.Writer, x float64, unit string)](#prettyPrint)
    * [func rewrite(s string) string](#rewrite)
    * [func runBenchmarks(importPath string, matchString func(pat, str string) (bool, error), benchmarks []InternalBenchmark) bool](#runBenchmarks)
    * [func runExample(eg InternalExample) (ok bool)](#runExample)
    * [func runExamples(matchString func(pat, str string) (bool, error), examples []InternalExample) (ran, ok bool)](#runExamples)
    * [func runTests(matchString func(pat, str string) (bool, error), tests []InternalTest, deadline time.Time) (ran, ok bool)](#runTests)
    * [func shouldFailFast() bool](#shouldFailFast)
    * [func sortLines(output string) string](#sortLines)
    * [func splitRegexp(s string) []string](#splitRegexp)
    * [func tRunner(t *T, fn func(t *T))](#tRunner)
    * [func testHelper(t *T)](#testHelper)
    * [func toOutputDir(path string) string](#toOutputDir)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="maxStackLen" href="#maxStackLen">const maxStackLen</a>

```
searchKey: testing.maxStackLen
tags: [constant number private]
```

```Go
const maxStackLen = 50
```

The maximum number of stack frames to go through when skipping helper functions for the purpose of decorating log messages. 

### <a id="normalPanic" href="#normalPanic">const normalPanic</a>

```
searchKey: testing.normalPanic
tags: [constant number private]
```

```Go
const normalPanic panicHandling = iota
```

### <a id="recoverAndReturnPanic" href="#recoverAndReturnPanic">const recoverAndReturnPanic</a>

```
searchKey: testing.recoverAndReturnPanic
tags: [constant number private]
```

```Go
const recoverAndReturnPanic
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="PrettyPrint" href="#PrettyPrint">var PrettyPrint</a>

```
searchKey: testing.PrettyPrint
tags: [variable function private]
```

```Go
var PrettyPrint = prettyPrint
```

### <a id="benchTime" href="#benchTime">var benchTime</a>

```
searchKey: testing.benchTime
tags: [variable struct private]
```

```Go
var benchTime = benchTimeFlag{d: 1 * time.Second} // changed during test of testing package

```

### <a id="benchmarkLock" href="#benchmarkLock">var benchmarkLock</a>

```
searchKey: testing.benchmarkLock
tags: [variable struct private]
```

```Go
var benchmarkLock sync.Mutex
```

Global lock to ensure only one benchmark runs at a time. 

### <a id="benchmarkMemory" href="#benchmarkMemory">var benchmarkMemory</a>

```
searchKey: testing.benchmarkMemory
tags: [variable boolean private]
```

```Go
var benchmarkMemory *bool
```

### <a id="blockProfile" href="#blockProfile">var blockProfile</a>

```
searchKey: testing.blockProfile
tags: [variable string private]
```

```Go
var blockProfile *string
```

### <a id="blockProfileRate" href="#blockProfileRate">var blockProfileRate</a>

```
searchKey: testing.blockProfileRate
tags: [variable number private]
```

```Go
var blockProfileRate *int
```

### <a id="chatty" href="#chatty">var chatty</a>

```
searchKey: testing.chatty
tags: [variable boolean private]
```

```Go
var chatty *bool
```

### <a id="count" href="#count">var count</a>

```
searchKey: testing.count
tags: [variable number private]
```

```Go
var count *uint
```

### <a id="cover" href="#cover">var cover</a>

```
searchKey: testing.cover
tags: [variable struct private]
```

```Go
var cover Cover
```

### <a id="coverProfile" href="#coverProfile">var coverProfile</a>

```
searchKey: testing.coverProfile
tags: [variable string private]
```

```Go
var coverProfile *string
```

### <a id="cpuList" href="#cpuList">var cpuList</a>

```
searchKey: testing.cpuList
tags: [variable array number private]
```

```Go
var cpuList []int
```

### <a id="cpuListStr" href="#cpuListStr">var cpuListStr</a>

```
searchKey: testing.cpuListStr
tags: [variable string private]
```

```Go
var cpuListStr *string
```

### <a id="cpuProfile" href="#cpuProfile">var cpuProfile</a>

```
searchKey: testing.cpuProfile
tags: [variable string private]
```

```Go
var cpuProfile *string
```

### <a id="errMain" href="#errMain">var errMain</a>

```
searchKey: testing.errMain
tags: [variable interface private]
```

```Go
var errMain = errors.New("testing: unexpected use of func Main")
```

No one should be using func Main anymore. See the doc comment on func Main and use MainStart instead. 

### <a id="errNilPanicOrGoexit" href="#errNilPanicOrGoexit">var errNilPanicOrGoexit</a>

```
searchKey: testing.errNilPanicOrGoexit
tags: [variable interface private]
```

```Go
var errNilPanicOrGoexit = errors.New("test executed panic(nil) or runtime.Goexit")
```

### <a id="failFast" href="#failFast">var failFast</a>

```
searchKey: testing.failFast
tags: [variable boolean private]
```

```Go
var failFast *bool
```

### <a id="haveExamples" href="#haveExamples">var haveExamples</a>

```
searchKey: testing.haveExamples
tags: [variable boolean private]
```

```Go
var haveExamples bool // are there examples?

```

### <a id="initRan" href="#initRan">var initRan</a>

```
searchKey: testing.initRan
tags: [variable boolean private]
```

```Go
var initRan bool
```

### <a id="labelsOnce" href="#labelsOnce">var labelsOnce</a>

```
searchKey: testing.labelsOnce
tags: [variable struct private]
```

```Go
var labelsOnce sync.Once
```

### <a id="match" href="#match">var match</a>

```
searchKey: testing.match
tags: [variable string private]
```

```Go
var match *string
```

### <a id="matchBenchmarks" href="#matchBenchmarks">var matchBenchmarks</a>

```
searchKey: testing.matchBenchmarks
tags: [variable string private]
```

```Go
var matchBenchmarks *string
```

### <a id="matchList" href="#matchList">var matchList</a>

```
searchKey: testing.matchList
tags: [variable string private]
```

```Go
var matchList *string
```

### <a id="matchMutex" href="#matchMutex">var matchMutex</a>

```
searchKey: testing.matchMutex
tags: [variable struct private]
```

```Go
var matchMutex sync.Mutex
```

TODO: fix test_main to avoid race and improve caching, also allowing to eliminate this Mutex. 

### <a id="memProfile" href="#memProfile">var memProfile</a>

```
searchKey: testing.memProfile
tags: [variable string private]
```

```Go
var memProfile *string
```

### <a id="memProfileRate" href="#memProfileRate">var memProfileRate</a>

```
searchKey: testing.memProfileRate
tags: [variable number private]
```

```Go
var memProfileRate *int
```

### <a id="memStats" href="#memStats">var memStats</a>

```
searchKey: testing.memStats
tags: [variable struct private]
```

```Go
var memStats runtime.MemStats
```

Used for every benchmark for measuring memory. 

### <a id="mutexProfile" href="#mutexProfile">var mutexProfile</a>

```
searchKey: testing.mutexProfile
tags: [variable string private]
```

```Go
var mutexProfile *string
```

### <a id="mutexProfileFraction" href="#mutexProfileFraction">var mutexProfileFraction</a>

```
searchKey: testing.mutexProfileFraction
tags: [variable number private]
```

```Go
var mutexProfileFraction *int
```

### <a id="numFailed" href="#numFailed">var numFailed</a>

```
searchKey: testing.numFailed
tags: [variable number private]
```

```Go
var numFailed uint32 // number of test failures

```

### <a id="outputDir" href="#outputDir">var outputDir</a>

```
searchKey: testing.outputDir
tags: [variable string private]
```

```Go
var outputDir *string
```

### <a id="panicOnExit0" href="#panicOnExit0">var panicOnExit0</a>

```
searchKey: testing.panicOnExit0
tags: [variable boolean private]
```

```Go
var panicOnExit0 *bool
```

### <a id="parallel" href="#parallel">var parallel</a>

```
searchKey: testing.parallel
tags: [variable number private]
```

```Go
var parallel *int
```

### <a id="short" href="#short">var short</a>

```
searchKey: testing.short
tags: [variable boolean private]
```

```Go
var short *bool
```

Flags, registered during Init. 

### <a id="shuffle" href="#shuffle">var shuffle</a>

```
searchKey: testing.shuffle
tags: [variable string private]
```

```Go
var shuffle *string
```

### <a id="testlog" href="#testlog">var testlog</a>

```
searchKey: testing.testlog
tags: [variable string private]
```

```Go
var testlog *string
```

### <a id="testlogFile" href="#testlogFile">var testlogFile</a>

```
searchKey: testing.testlogFile
tags: [variable struct private]
```

```Go
var testlogFile *os.File
```

### <a id="timeout" href="#timeout">var timeout</a>

```
searchKey: testing.timeout
tags: [variable number private]
```

```Go
var timeout *time.Duration
```

### <a id="traceFile" href="#traceFile">var traceFile</a>

```
searchKey: testing.traceFile
tags: [variable string private]
```

```Go
var traceFile *string
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="B" href="#B">type B struct</a>

```
searchKey: testing.B
tags: [struct]
```

```Go
type B struct {
	common
	importPath       string // import path of the package containing the benchmark
	context          *benchContext
	N                int
	previousN        int           // number of iterations in the previous run
	previousDuration time.Duration // total duration of the previous run
	benchFunc        func(b *B)
	benchTime        benchTimeFlag
	bytes            int64
	missingBytes     bool // one of the subbenchmarks does not have bytes set.
	timerOn          bool
	showAllocResult  bool
	result           BenchmarkResult
	parallelism      int // RunParallel creates parallelism*GOMAXPROCS goroutines
	// The initial states of memStats.Mallocs and memStats.TotalAlloc.
	startAllocs uint64
	startBytes  uint64
	// The net total of this test after being run.
	netAllocs uint64
	netBytes  uint64
	// Extra metrics collected by ReportMetric.
	extra map[string]float64
}
```

B is a type passed to Benchmark functions to manage benchmark timing and to specify the number of iterations to run. 

A benchmark ends when its Benchmark function returns or calls any of the methods FailNow, Fatal, Fatalf, SkipNow, Skip, or Skipf. Those methods must be called only from the goroutine running the Benchmark function. The other reporting methods, such as the variations of Log and Error, may be called simultaneously from multiple goroutines. 

Like in tests, benchmark logs are accumulated during execution and dumped to standard output when done. Unlike in tests, benchmark logs are always printed, so as not to hide output whose existence may be affecting benchmark results. 

#### <a id="B.ReportAllocs" href="#B.ReportAllocs">func (b *B) ReportAllocs()</a>

```
searchKey: testing.B.ReportAllocs
tags: [function]
```

```Go
func (b *B) ReportAllocs()
```

ReportAllocs enables malloc statistics for this benchmark. It is equivalent to setting -test.benchmem, but it only affects the benchmark function that calls ReportAllocs. 

#### <a id="B.ReportMetric" href="#B.ReportMetric">func (b *B) ReportMetric(n float64, unit string)</a>

```
searchKey: testing.B.ReportMetric
tags: [method]
```

```Go
func (b *B) ReportMetric(n float64, unit string)
```

ReportMetric adds "n unit" to the reported benchmark results. If the metric is per-iteration, the caller should divide by b.N, and by convention units should end in "/op". ReportMetric overrides any previously reported value for the same unit. ReportMetric panics if unit is the empty string or if unit contains any whitespace. If unit is a unit normally reported by the benchmark framework itself (such as "allocs/op"), ReportMetric will override that metric. Setting "ns/op" to 0 will suppress that built-in metric. 

#### <a id="B.ResetTimer" href="#B.ResetTimer">func (b *B) ResetTimer()</a>

```
searchKey: testing.B.ResetTimer
tags: [function]
```

```Go
func (b *B) ResetTimer()
```

ResetTimer zeroes the elapsed benchmark time and memory allocation counters and deletes user-reported metrics. It does not affect whether the timer is running. 

#### <a id="B.Run" href="#B.Run">func (b *B) Run(name string, f func(b *B)) bool</a>

```
searchKey: testing.B.Run
tags: [method]
```

```Go
func (b *B) Run(name string, f func(b *B)) bool
```

Run benchmarks f as a subbenchmark with the given name. It reports whether there were any failures. 

A subbenchmark is like any other benchmark. A benchmark that calls Run at least once will not be measured itself and will be called once with N=1. 

#### <a id="B.RunParallel" href="#B.RunParallel">func (b *B) RunParallel(body func(*PB))</a>

```
searchKey: testing.B.RunParallel
tags: [method]
```

```Go
func (b *B) RunParallel(body func(*PB))
```

RunParallel runs a benchmark in parallel. It creates multiple goroutines and distributes b.N iterations among them. The number of goroutines defaults to GOMAXPROCS. To increase parallelism for non-CPU-bound benchmarks, call SetParallelism before RunParallel. RunParallel is usually used with the go test -cpu flag. 

The body function will be run in each goroutine. It should set up any goroutine-local state and then iterate until pb.Next returns false. It should not use the StartTimer, StopTimer, or ResetTimer functions, because they have global effect. It should also not call Run. 

#### <a id="B.SetBytes" href="#B.SetBytes">func (b *B) SetBytes(n int64)</a>

```
searchKey: testing.B.SetBytes
tags: [method]
```

```Go
func (b *B) SetBytes(n int64)
```

SetBytes records the number of bytes processed in a single operation. If this is called, the benchmark will report ns/op and MB/s. 

#### <a id="B.SetParallelism" href="#B.SetParallelism">func (b *B) SetParallelism(p int)</a>

```
searchKey: testing.B.SetParallelism
tags: [method]
```

```Go
func (b *B) SetParallelism(p int)
```

SetParallelism sets the number of goroutines used by RunParallel to p*GOMAXPROCS. There is usually no need to call SetParallelism for CPU-bound benchmarks. If p is less than 1, this call will have no effect. 

#### <a id="B.StartTimer" href="#B.StartTimer">func (b *B) StartTimer()</a>

```
searchKey: testing.B.StartTimer
tags: [function]
```

```Go
func (b *B) StartTimer()
```

StartTimer starts timing a test. This function is called automatically before a benchmark starts, but it can also be used to resume timing after a call to StopTimer. 

#### <a id="B.StopTimer" href="#B.StopTimer">func (b *B) StopTimer()</a>

```
searchKey: testing.B.StopTimer
tags: [function]
```

```Go
func (b *B) StopTimer()
```

StopTimer stops timing a test. This can be used to pause the timer while performing complex initialization that you don't want to measure. 

#### <a id="B.add" href="#B.add">func (b *B) add(other BenchmarkResult)</a>

```
searchKey: testing.B.add
tags: [method private]
```

```Go
func (b *B) add(other BenchmarkResult)
```

add simulates running benchmarks in sequence in a single iteration. It is used to give some meaningful results in case func Benchmark is used in combination with Run. 

#### <a id="B.doBench" href="#B.doBench">func (b *B) doBench() BenchmarkResult</a>

```
searchKey: testing.B.doBench
tags: [function private]
```

```Go
func (b *B) doBench() BenchmarkResult
```

#### <a id="B.launch" href="#B.launch">func (b *B) launch()</a>

```
searchKey: testing.B.launch
tags: [function private]
```

```Go
func (b *B) launch()
```

launch launches the benchmark function. It gradually increases the number of benchmark iterations until the benchmark runs for the requested benchtime. launch is run by the doBench function as a separate goroutine. run1 must have been called on b. 

#### <a id="B.run" href="#B.run">func (b *B) run()</a>

```
searchKey: testing.B.run
tags: [function private]
```

```Go
func (b *B) run()
```

run executes the benchmark in a separate goroutine, including all of its subbenchmarks. b must not have subbenchmarks. 

#### <a id="B.run1" href="#B.run1">func (b *B) run1() bool</a>

```
searchKey: testing.B.run1
tags: [function private]
```

```Go
func (b *B) run1() bool
```

run1 runs the first iteration of benchFunc. It reports whether more iterations of this benchmarks should be run. 

#### <a id="B.runN" href="#B.runN">func (b *B) runN(n int)</a>

```
searchKey: testing.B.runN
tags: [method private]
```

```Go
func (b *B) runN(n int)
```

runN runs a single benchmark for the specified number of iterations. 

#### <a id="B.trimOutput" href="#B.trimOutput">func (b *B) trimOutput()</a>

```
searchKey: testing.B.trimOutput
tags: [function private]
```

```Go
func (b *B) trimOutput()
```

trimOutput shortens the output from a benchmark, which can be very long. 

### <a id="BenchmarkResult" href="#BenchmarkResult">type BenchmarkResult struct</a>

```
searchKey: testing.BenchmarkResult
tags: [struct]
```

```Go
type BenchmarkResult struct {
	N         int           // The number of iterations.
	T         time.Duration // The total time taken.
	Bytes     int64         // Bytes processed in one iteration.
	MemAllocs uint64        // The total number of memory allocations.
	MemBytes  uint64        // The total number of bytes allocated.

	// Extra records additional metrics reported by ReportMetric.
	Extra map[string]float64
}
```

BenchmarkResult contains the results of a benchmark run. 

#### <a id="Benchmark" href="#Benchmark">func Benchmark(f func(b *B)) BenchmarkResult</a>

```
searchKey: testing.Benchmark
tags: [method]
```

```Go
func Benchmark(f func(b *B)) BenchmarkResult
```

Benchmark benchmarks a single function. It is useful for creating custom benchmarks that do not use the "go test" command. 

If f depends on testing flags, then Init must be used to register those flags before calling Benchmark and before calling flag.Parse. 

If f calls Run, the result will be an estimate of running all its subbenchmarks that don't call Run in sequence in a single benchmark. 

#### <a id="BenchmarkResult.AllocedBytesPerOp" href="#BenchmarkResult.AllocedBytesPerOp">func (r BenchmarkResult) AllocedBytesPerOp() int64</a>

```
searchKey: testing.BenchmarkResult.AllocedBytesPerOp
tags: [function]
```

```Go
func (r BenchmarkResult) AllocedBytesPerOp() int64
```

AllocedBytesPerOp returns the "B/op" metric, which is calculated as r.MemBytes / r.N. 

#### <a id="BenchmarkResult.AllocsPerOp" href="#BenchmarkResult.AllocsPerOp">func (r BenchmarkResult) AllocsPerOp() int64</a>

```
searchKey: testing.BenchmarkResult.AllocsPerOp
tags: [function]
```

```Go
func (r BenchmarkResult) AllocsPerOp() int64
```

AllocsPerOp returns the "allocs/op" metric, which is calculated as r.MemAllocs / r.N. 

#### <a id="BenchmarkResult.MemString" href="#BenchmarkResult.MemString">func (r BenchmarkResult) MemString() string</a>

```
searchKey: testing.BenchmarkResult.MemString
tags: [function]
```

```Go
func (r BenchmarkResult) MemString() string
```

MemString returns r.AllocedBytesPerOp and r.AllocsPerOp in the same format as 'go test'. 

#### <a id="BenchmarkResult.NsPerOp" href="#BenchmarkResult.NsPerOp">func (r BenchmarkResult) NsPerOp() int64</a>

```
searchKey: testing.BenchmarkResult.NsPerOp
tags: [function]
```

```Go
func (r BenchmarkResult) NsPerOp() int64
```

NsPerOp returns the "ns/op" metric. 

#### <a id="BenchmarkResult.String" href="#BenchmarkResult.String">func (r BenchmarkResult) String() string</a>

```
searchKey: testing.BenchmarkResult.String
tags: [function]
```

```Go
func (r BenchmarkResult) String() string
```

String returns a summary of the benchmark results. It follows the benchmark result line format from [https://golang.org/design/14313-benchmark-format](https://golang.org/design/14313-benchmark-format), not including the benchmark name. Extra metrics override built-in metrics of the same name. String does not include allocs/op or B/op, since those are reported by MemString. 

#### <a id="BenchmarkResult.mbPerSec" href="#BenchmarkResult.mbPerSec">func (r BenchmarkResult) mbPerSec() float64</a>

```
searchKey: testing.BenchmarkResult.mbPerSec
tags: [function private]
```

```Go
func (r BenchmarkResult) mbPerSec() float64
```

mbPerSec returns the "MB/s" metric. 

### <a id="Cover" href="#Cover">type Cover struct</a>

```
searchKey: testing.Cover
tags: [struct]
```

```Go
type Cover struct {
	Mode            string
	Counters        map[string][]uint32
	Blocks          map[string][]CoverBlock
	CoveredPackages string
}
```

Cover records information about test coverage checking. NOTE: This struct is internal to the testing infrastructure and may change. It is not covered (yet) by the Go 1 compatibility guidelines. 

### <a id="CoverBlock" href="#CoverBlock">type CoverBlock struct</a>

```
searchKey: testing.CoverBlock
tags: [struct]
```

```Go
type CoverBlock struct {
	Line0 uint32 // Line number for block start.
	Col0  uint16 // Column number for block start.
	Line1 uint32 // Line number for block end.
	Col1  uint16 // Column number for block end.
	Stmts uint16 // Number of statements included in this block.
}
```

CoverBlock records the coverage data for a single basic block. The fields are 1-indexed, as in an editor: The opening line of the file is number 1, for example. Columns are measured in bytes. NOTE: This struct is internal to the testing infrastructure and may change. It is not covered (yet) by the Go 1 compatibility guidelines. 

### <a id="InternalBenchmark" href="#InternalBenchmark">type InternalBenchmark struct</a>

```
searchKey: testing.InternalBenchmark
tags: [struct]
```

```Go
type InternalBenchmark struct {
	Name string
	F    func(b *B)
}
```

InternalBenchmark is an internal type but exported because it is cross-package; it is part of the implementation of the "go test" command. 

### <a id="InternalExample" href="#InternalExample">type InternalExample struct</a>

```
searchKey: testing.InternalExample
tags: [struct]
```

```Go
type InternalExample struct {
	Name      string
	F         func()
	Output    string
	Unordered bool
}
```

#### <a id="InternalExample.processRunResult" href="#InternalExample.processRunResult">func (eg *InternalExample) processRunResult(stdout string, timeSpent time.Duration, finished bool, recovered interface{}) (passed bool)</a>

```
searchKey: testing.InternalExample.processRunResult
tags: [method private]
```

```Go
func (eg *InternalExample) processRunResult(stdout string, timeSpent time.Duration, finished bool, recovered interface{}) (passed bool)
```

processRunResult computes a summary and status of the result of running an example test. stdout is the captured output from stdout of the test. recovered is the result of invoking recover after running the test, in case it panicked. 

If stdout doesn't match the expected output or if recovered is non-nil, it'll print the cause of failure to stdout. If the test is chatty/verbose, it'll print a success message to stdout. If recovered is non-nil, it'll panic with that value. If the test panicked with nil, or invoked runtime.Goexit, it'll be made to fail and panic with errNilPanicOrGoexit 

### <a id="InternalTest" href="#InternalTest">type InternalTest struct</a>

```
searchKey: testing.InternalTest
tags: [struct]
```

```Go
type InternalTest struct {
	Name string
	F    func(*T)
}
```

InternalTest is an internal type but exported because it is cross-package; it is part of the implementation of the "go test" command. 

### <a id="M" href="#M">type M struct</a>

```
searchKey: testing.M
tags: [struct]
```

```Go
type M struct {
	deps       testDeps
	tests      []InternalTest
	benchmarks []InternalBenchmark
	examples   []InternalExample

	timer     *time.Timer
	afterOnce sync.Once

	numRun int

	// value to pass to os.Exit, the outer test func main
	// harness calls os.Exit with this code. See #34129.
	exitCode int
}
```

M is a type passed to a TestMain function to run the actual tests. 

#### <a id="MainStart" href="#MainStart">func MainStart(deps testDeps, tests []InternalTest, benchmarks []InternalBenchmark, examples []InternalExample) *M</a>

```
searchKey: testing.MainStart
tags: [method]
```

```Go
func MainStart(deps testDeps, tests []InternalTest, benchmarks []InternalBenchmark, examples []InternalExample) *M
```

MainStart is meant for use by tests generated by 'go test'. It is not meant to be called directly and is not subject to the Go 1 compatibility document. It may change signature from release to release. 

#### <a id="M.Run" href="#M.Run">func (m *M) Run() (code int)</a>

```
searchKey: testing.M.Run
tags: [function]
```

```Go
func (m *M) Run() (code int)
```

Run runs the tests. It returns an exit code to pass to os.Exit. 

#### <a id="M.after" href="#M.after">func (m *M) after()</a>

```
searchKey: testing.M.after
tags: [function private]
```

```Go
func (m *M) after()
```

after runs after all testing. 

#### <a id="M.before" href="#M.before">func (m *M) before()</a>

```
searchKey: testing.M.before
tags: [function private]
```

```Go
func (m *M) before()
```

before runs before all testing. 

#### <a id="M.startAlarm" href="#M.startAlarm">func (m *M) startAlarm() time.Time</a>

```
searchKey: testing.M.startAlarm
tags: [function private]
```

```Go
func (m *M) startAlarm() time.Time
```

startAlarm starts an alarm if requested. 

#### <a id="M.stopAlarm" href="#M.stopAlarm">func (m *M) stopAlarm()</a>

```
searchKey: testing.M.stopAlarm
tags: [function private]
```

```Go
func (m *M) stopAlarm()
```

stopAlarm turns off the alarm. 

#### <a id="M.writeProfiles" href="#M.writeProfiles">func (m *M) writeProfiles()</a>

```
searchKey: testing.M.writeProfiles
tags: [function private]
```

```Go
func (m *M) writeProfiles()
```

### <a id="PB" href="#PB">type PB struct</a>

```
searchKey: testing.PB
tags: [struct]
```

```Go
type PB struct {
	globalN *uint64 // shared between all worker goroutines iteration counter
	grain   uint64  // acquire that many iterations from globalN at once
	cache   uint64  // local cache of acquired iterations
	bN      uint64  // total number of iterations to execute (b.N)
}
```

A PB is used by RunParallel for running parallel benchmarks. 

#### <a id="PB.Next" href="#PB.Next">func (pb *PB) Next() bool</a>

```
searchKey: testing.PB.Next
tags: [function]
```

```Go
func (pb *PB) Next() bool
```

Next reports whether there are more iterations to execute. 

### <a id="T" href="#T">type T struct</a>

```
searchKey: testing.T
tags: [struct]
```

```Go
type T struct {
	common
	isParallel bool
	isEnvSet   bool
	context    *testContext // For running tests and subtests.
}
```

T is a type passed to Test functions to manage test state and support formatted test logs. 

A test ends when its Test function returns or calls any of the methods FailNow, Fatal, Fatalf, SkipNow, Skip, or Skipf. Those methods, as well as the Parallel method, must be called only from the goroutine running the Test function. 

The other reporting methods, such as the variations of Log and Error, may be called simultaneously from multiple goroutines. 

#### <a id="T.Deadline" href="#T.Deadline">func (t *T) Deadline() (deadline time.Time, ok bool)</a>

```
searchKey: testing.T.Deadline
tags: [function]
```

```Go
func (t *T) Deadline() (deadline time.Time, ok bool)
```

Deadline reports the time at which the test binary will have exceeded the timeout specified by the -timeout flag. 

The ok result is false if the -timeout flag indicates “no timeout” (0). 

#### <a id="T.Parallel" href="#T.Parallel">func (t *T) Parallel()</a>

```
searchKey: testing.T.Parallel
tags: [function]
```

```Go
func (t *T) Parallel()
```

Parallel signals that this test is to be run in parallel with (and only with) other parallel tests. When a test is run multiple times due to use of -test.count or -test.cpu, multiple instances of a single test never run in parallel with each other. 

#### <a id="T.Run" href="#T.Run">func (t *T) Run(name string, f func(t *T)) bool</a>

```
searchKey: testing.T.Run
tags: [method]
```

```Go
func (t *T) Run(name string, f func(t *T)) bool
```

Run runs f as a subtest of t called name. It runs f in a separate goroutine and blocks until f returns or calls t.Parallel to become a parallel test. Run reports whether f succeeded (or at least did not fail before calling t.Parallel). 

Run may be called simultaneously from multiple goroutines, but all such calls must return before the outer test function for t returns. 

#### <a id="T.Setenv" href="#T.Setenv">func (t *T) Setenv(key, value string)</a>

```
searchKey: testing.T.Setenv
tags: [method]
```

```Go
func (t *T) Setenv(key, value string)
```

Setenv calls os.Setenv(key, value) and uses Cleanup to restore the environment variable to its original value after the test. 

This cannot be used in parallel tests. 

#### <a id="T.report" href="#T.report">func (t *T) report()</a>

```
searchKey: testing.T.report
tags: [function private]
```

```Go
func (t *T) report()
```

### <a id="TB" href="#TB">type TB interface</a>

```
searchKey: testing.TB
tags: [interface]
```

```Go
type TB interface {
	Cleanup(func())
	Error(args ...interface{})
	Errorf(format string, args ...interface{})
	Fail()
	FailNow()
	Failed() bool
	Fatal(args ...interface{})
	Fatalf(format string, args ...interface{})
	Helper()
	Log(args ...interface{})
	Logf(format string, args ...interface{})
	Name() string
	Skip(args ...interface{})
	SkipNow()
	Skipf(format string, args ...interface{})
	Skipped() bool
	TempDir() string

	// A private method to prevent users implementing the
	// interface and so future additions to it will not
	// violate Go 1 compatibility.
	private()
}
```

TB is the interface common to T and B. 

### <a id="benchContext" href="#benchContext">type benchContext struct</a>

```
searchKey: testing.benchContext
tags: [struct private]
```

```Go
type benchContext struct {
	match *matcher

	maxLen int // The largest recorded benchmark name.
	extLen int // Maximum extension length.
}
```

#### <a id="benchContext.processBench" href="#benchContext.processBench">func (ctx *benchContext) processBench(b *B)</a>

```
searchKey: testing.benchContext.processBench
tags: [method private]
```

```Go
func (ctx *benchContext) processBench(b *B)
```

processBench runs bench b for the configured CPU counts and prints the results. 

### <a id="benchTimeFlag" href="#benchTimeFlag">type benchTimeFlag struct</a>

```
searchKey: testing.benchTimeFlag
tags: [struct private]
```

```Go
type benchTimeFlag struct {
	d time.Duration
	n int
}
```

#### <a id="benchTimeFlag.Set" href="#benchTimeFlag.Set">func (f *benchTimeFlag) Set(s string) error</a>

```
searchKey: testing.benchTimeFlag.Set
tags: [method private]
```

```Go
func (f *benchTimeFlag) Set(s string) error
```

#### <a id="benchTimeFlag.String" href="#benchTimeFlag.String">func (f *benchTimeFlag) String() string</a>

```
searchKey: testing.benchTimeFlag.String
tags: [function private]
```

```Go
func (f *benchTimeFlag) String() string
```

### <a id="chattyPrinter" href="#chattyPrinter">type chattyPrinter struct</a>

```
searchKey: testing.chattyPrinter
tags: [struct private]
```

```Go
type chattyPrinter struct {
	w          io.Writer
	lastNameMu sync.Mutex // guards lastName
	lastName   string     // last printed test name in chatty mode
}
```

#### <a id="newChattyPrinter" href="#newChattyPrinter">func newChattyPrinter(w io.Writer) *chattyPrinter</a>

```
searchKey: testing.newChattyPrinter
tags: [method private]
```

```Go
func newChattyPrinter(w io.Writer) *chattyPrinter
```

#### <a id="chattyPrinter.Printf" href="#chattyPrinter.Printf">func (p *chattyPrinter) Printf(testName, format string, args ...interface{})</a>

```
searchKey: testing.chattyPrinter.Printf
tags: [method private]
```

```Go
func (p *chattyPrinter) Printf(testName, format string, args ...interface{})
```

Printf prints a message, generated by the named test, that does not necessarily mention that tests's name itself. 

#### <a id="chattyPrinter.Updatef" href="#chattyPrinter.Updatef">func (p *chattyPrinter) Updatef(testName, format string, args ...interface{})</a>

```
searchKey: testing.chattyPrinter.Updatef
tags: [method private]
```

```Go
func (p *chattyPrinter) Updatef(testName, format string, args ...interface{})
```

Updatef prints a message about the status of the named test to w. 

The formatted message must include the test name itself. 

### <a id="common" href="#common">type common struct</a>

```
searchKey: testing.common
tags: [struct private]
```

```Go
type common struct {
	mu          sync.RWMutex         // guards this group of fields
	output      []byte               // Output generated by test or benchmark.
	w           io.Writer            // For flushToParent.
	ran         bool                 // Test or benchmark (or one of its subtests) was executed.
	failed      bool                 // Test or benchmark has failed.
	skipped     bool                 // Test or benchmark has been skipped.
	done        bool                 // Test is finished and all subtests have completed.
	helperPCs   map[uintptr]struct{} // functions to be skipped when writing file/line info
	helperNames map[string]struct{}  // helperPCs converted to function names
	cleanups    []func()             // optional functions to be called at the end of the test
	cleanupName string               // Name of the cleanup function.
	cleanupPc   []uintptr            // The stack trace at the point where Cleanup was called.
	finished    bool                 // Test function has completed.

	chatty     *chattyPrinter // A copy of chattyPrinter, if the chatty flag is set.
	bench      bool           // Whether the current test is a benchmark.
	hasSub     int32          // Written atomically.
	raceErrors int            // Number of races detected during test.
	runner     string         // Function name of tRunner running the test.

	parent   *common
	level    int       // Nesting depth of test or benchmark.
	creator  []uintptr // If level > 0, the stack trace at the point where the parent called t.Run.
	name     string    // Name of test or benchmark.
	start    time.Time // Time test or benchmark started
	duration time.Duration
	barrier  chan bool // To signal parallel subtests they may start.
	signal   chan bool // To signal a test is done.
	sub      []*T      // Queue of subtests to be run in parallel.

	tempDirMu  sync.Mutex
	tempDir    string
	tempDirErr error
	tempDirSeq int32
}
```

common holds the elements common between T and B and captures common methods such as Errorf. 

#### <a id="common.Cleanup" href="#common.Cleanup">func (c *common) Cleanup(f func())</a>

```
searchKey: testing.common.Cleanup
tags: [method private]
```

```Go
func (c *common) Cleanup(f func())
```

Cleanup registers a function to be called when the test (or subtest) and all its subtests complete. Cleanup functions will be called in last added, first called order. 

#### <a id="common.Error" href="#common.Error">func (c *common) Error(args ...interface{})</a>

```
searchKey: testing.common.Error
tags: [method private]
```

```Go
func (c *common) Error(args ...interface{})
```

Error is equivalent to Log followed by Fail. 

#### <a id="common.Errorf" href="#common.Errorf">func (c *common) Errorf(format string, args ...interface{})</a>

```
searchKey: testing.common.Errorf
tags: [method private]
```

```Go
func (c *common) Errorf(format string, args ...interface{})
```

Errorf is equivalent to Logf followed by Fail. 

#### <a id="common.Fail" href="#common.Fail">func (c *common) Fail()</a>

```
searchKey: testing.common.Fail
tags: [function private]
```

```Go
func (c *common) Fail()
```

Fail marks the function as having failed but continues execution. 

#### <a id="common.FailNow" href="#common.FailNow">func (c *common) FailNow()</a>

```
searchKey: testing.common.FailNow
tags: [function private]
```

```Go
func (c *common) FailNow()
```

FailNow marks the function as having failed and stops its execution by calling runtime.Goexit (which then runs all deferred calls in the current goroutine). Execution will continue at the next test or benchmark. FailNow must be called from the goroutine running the test or benchmark function, not from other goroutines created during the test. Calling FailNow does not stop those other goroutines. 

#### <a id="common.Failed" href="#common.Failed">func (c *common) Failed() bool</a>

```
searchKey: testing.common.Failed
tags: [function private]
```

```Go
func (c *common) Failed() bool
```

Failed reports whether the function has failed. 

#### <a id="common.Fatal" href="#common.Fatal">func (c *common) Fatal(args ...interface{})</a>

```
searchKey: testing.common.Fatal
tags: [method private]
```

```Go
func (c *common) Fatal(args ...interface{})
```

Fatal is equivalent to Log followed by FailNow. 

#### <a id="common.Fatalf" href="#common.Fatalf">func (c *common) Fatalf(format string, args ...interface{})</a>

```
searchKey: testing.common.Fatalf
tags: [method private]
```

```Go
func (c *common) Fatalf(format string, args ...interface{})
```

Fatalf is equivalent to Logf followed by FailNow. 

#### <a id="common.Helper" href="#common.Helper">func (c *common) Helper()</a>

```
searchKey: testing.common.Helper
tags: [function private]
```

```Go
func (c *common) Helper()
```

Helper marks the calling function as a test helper function. When printing file and line information, that function will be skipped. Helper may be called simultaneously from multiple goroutines. 

#### <a id="common.Log" href="#common.Log">func (c *common) Log(args ...interface{})</a>

```
searchKey: testing.common.Log
tags: [method private]
```

```Go
func (c *common) Log(args ...interface{})
```

Log formats its arguments using default formatting, analogous to Println, and records the text in the error log. For tests, the text will be printed only if the test fails or the -test.v flag is set. For benchmarks, the text is always printed to avoid having performance depend on the value of the -test.v flag. 

#### <a id="common.Logf" href="#common.Logf">func (c *common) Logf(format string, args ...interface{})</a>

```
searchKey: testing.common.Logf
tags: [method private]
```

```Go
func (c *common) Logf(format string, args ...interface{})
```

Logf formats its arguments according to the format, analogous to Printf, and records the text in the error log. A final newline is added if not provided. For tests, the text will be printed only if the test fails or the -test.v flag is set. For benchmarks, the text is always printed to avoid having performance depend on the value of the -test.v flag. 

#### <a id="common.Name" href="#common.Name">func (c *common) Name() string</a>

```
searchKey: testing.common.Name
tags: [function private]
```

```Go
func (c *common) Name() string
```

Name returns the name of the running test or benchmark. 

#### <a id="common.Setenv" href="#common.Setenv">func (c *common) Setenv(key, value string)</a>

```
searchKey: testing.common.Setenv
tags: [method private]
```

```Go
func (c *common) Setenv(key, value string)
```

Setenv calls os.Setenv(key, value) and uses Cleanup to restore the environment variable to its original value after the test. 

This cannot be used in parallel tests. 

#### <a id="common.Skip" href="#common.Skip">func (c *common) Skip(args ...interface{})</a>

```
searchKey: testing.common.Skip
tags: [method private]
```

```Go
func (c *common) Skip(args ...interface{})
```

Skip is equivalent to Log followed by SkipNow. 

#### <a id="common.SkipNow" href="#common.SkipNow">func (c *common) SkipNow()</a>

```
searchKey: testing.common.SkipNow
tags: [function private]
```

```Go
func (c *common) SkipNow()
```

SkipNow marks the test as having been skipped and stops its execution by calling runtime.Goexit. If a test fails (see Error, Errorf, Fail) and is then skipped, it is still considered to have failed. Execution will continue at the next test or benchmark. See also FailNow. SkipNow must be called from the goroutine running the test, not from other goroutines created during the test. Calling SkipNow does not stop those other goroutines. 

#### <a id="common.Skipf" href="#common.Skipf">func (c *common) Skipf(format string, args ...interface{})</a>

```
searchKey: testing.common.Skipf
tags: [method private]
```

```Go
func (c *common) Skipf(format string, args ...interface{})
```

Skipf is equivalent to Logf followed by SkipNow. 

#### <a id="common.Skipped" href="#common.Skipped">func (c *common) Skipped() bool</a>

```
searchKey: testing.common.Skipped
tags: [function private]
```

```Go
func (c *common) Skipped() bool
```

Skipped reports whether the test was skipped. 

#### <a id="common.TempDir" href="#common.TempDir">func (c *common) TempDir() string</a>

```
searchKey: testing.common.TempDir
tags: [function private]
```

```Go
func (c *common) TempDir() string
```

TempDir returns a temporary directory for the test to use. The directory is automatically removed by Cleanup when the test and all its subtests complete. Each subsequent call to t.TempDir returns a unique directory; if the directory creation fails, TempDir terminates the test by calling Fatal. 

#### <a id="common.decorate" href="#common.decorate">func (c *common) decorate(s string, skip int) string</a>

```
searchKey: testing.common.decorate
tags: [method private]
```

```Go
func (c *common) decorate(s string, skip int) string
```

decorate prefixes the string with the file and line of the call site and inserts the final newline if needed and indentation spaces for formatting. This function must be called with c.mu held. 

#### <a id="common.flushToParent" href="#common.flushToParent">func (c *common) flushToParent(testName, format string, args ...interface{})</a>

```
searchKey: testing.common.flushToParent
tags: [method private]
```

```Go
func (c *common) flushToParent(testName, format string, args ...interface{})
```

flushToParent writes c.output to the parent after first writing the header with the given format and arguments. 

#### <a id="common.frameSkip" href="#common.frameSkip">func (c *common) frameSkip(skip int) runtime.Frame</a>

```
searchKey: testing.common.frameSkip
tags: [method private]
```

```Go
func (c *common) frameSkip(skip int) runtime.Frame
```

frameSkip searches, starting after skip frames, for the first caller frame in a function not marked as a helper and returns that frame. The search stops if it finds a tRunner function that was the entry point into the test and the test is not a subtest. This function must be called with c.mu held. 

#### <a id="common.log" href="#common.log">func (c *common) log(s string)</a>

```
searchKey: testing.common.log
tags: [method private]
```

```Go
func (c *common) log(s string)
```

log generates the output. It's always at the same stack depth. 

#### <a id="common.logDepth" href="#common.logDepth">func (c *common) logDepth(s string, depth int)</a>

```
searchKey: testing.common.logDepth
tags: [method private]
```

```Go
func (c *common) logDepth(s string, depth int)
```

logDepth generates the output at an arbitrary stack depth. 

#### <a id="common.private" href="#common.private">func (c *common) private()</a>

```
searchKey: testing.common.private
tags: [function private]
```

```Go
func (c *common) private()
```

#### <a id="common.runCleanup" href="#common.runCleanup">func (c *common) runCleanup(ph panicHandling) (panicVal interface{})</a>

```
searchKey: testing.common.runCleanup
tags: [method private]
```

```Go
func (c *common) runCleanup(ph panicHandling) (panicVal interface{})
```

runCleanup is called at the end of the test. If catchPanic is true, this will catch panics, and return the recovered value if any. 

#### <a id="common.setRan" href="#common.setRan">func (c *common) setRan()</a>

```
searchKey: testing.common.setRan
tags: [function private]
```

```Go
func (c *common) setRan()
```

### <a id="discard" href="#discard">type discard struct{}</a>

```
searchKey: testing.discard
tags: [struct private]
```

```Go
type discard struct{}
```

#### <a id="discard.Write" href="#discard.Write">func (discard) Write(b []byte) (n int, err error)</a>

```
searchKey: testing.discard.Write
tags: [method private]
```

```Go
func (discard) Write(b []byte) (n int, err error)
```

### <a id="funcWriter" href="#funcWriter">type funcWriter struct</a>

```
searchKey: testing.funcWriter
tags: [struct private]
```

```Go
type funcWriter struct {
	write func([]byte) (int, error)
}
```

#### <a id="funcWriter.Write" href="#funcWriter.Write">func (fw *funcWriter) Write(b []byte) (int, error)</a>

```
searchKey: testing.funcWriter.Write
tags: [method private]
```

```Go
func (fw *funcWriter) Write(b []byte) (int, error)
```

### <a id="indenter" href="#indenter">type indenter struct</a>

```
searchKey: testing.indenter
tags: [struct private]
```

```Go
type indenter struct {
	c *common
}
```

#### <a id="indenter.Write" href="#indenter.Write">func (w indenter) Write(b []byte) (n int, err error)</a>

```
searchKey: testing.indenter.Write
tags: [method private]
```

```Go
func (w indenter) Write(b []byte) (n int, err error)
```

### <a id="matchStringOnly" href="#matchStringOnly">type matchStringOnly func(pat string, str string) (bool, error)</a>

```
searchKey: testing.matchStringOnly
tags: [function private]
```

```Go
type matchStringOnly func(pat, str string) (bool, error)
```

#### <a id="matchStringOnly.ImportPath" href="#matchStringOnly.ImportPath">func (f matchStringOnly) ImportPath() string</a>

```
searchKey: testing.matchStringOnly.ImportPath
tags: [function private]
```

```Go
func (f matchStringOnly) ImportPath() string
```

#### <a id="matchStringOnly.MatchString" href="#matchStringOnly.MatchString">func (f matchStringOnly) MatchString(pat, str string) (bool, error)</a>

```
searchKey: testing.matchStringOnly.MatchString
tags: [method private]
```

```Go
func (f matchStringOnly) MatchString(pat, str string) (bool, error)
```

#### <a id="matchStringOnly.SetPanicOnExit0" href="#matchStringOnly.SetPanicOnExit0">func (f matchStringOnly) SetPanicOnExit0(bool)</a>

```
searchKey: testing.matchStringOnly.SetPanicOnExit0
tags: [method private]
```

```Go
func (f matchStringOnly) SetPanicOnExit0(bool)
```

#### <a id="matchStringOnly.StartCPUProfile" href="#matchStringOnly.StartCPUProfile">func (f matchStringOnly) StartCPUProfile(w io.Writer) error</a>

```
searchKey: testing.matchStringOnly.StartCPUProfile
tags: [method private]
```

```Go
func (f matchStringOnly) StartCPUProfile(w io.Writer) error
```

#### <a id="matchStringOnly.StartTestLog" href="#matchStringOnly.StartTestLog">func (f matchStringOnly) StartTestLog(io.Writer)</a>

```
searchKey: testing.matchStringOnly.StartTestLog
tags: [method private]
```

```Go
func (f matchStringOnly) StartTestLog(io.Writer)
```

#### <a id="matchStringOnly.StopCPUProfile" href="#matchStringOnly.StopCPUProfile">func (f matchStringOnly) StopCPUProfile()</a>

```
searchKey: testing.matchStringOnly.StopCPUProfile
tags: [function private]
```

```Go
func (f matchStringOnly) StopCPUProfile()
```

#### <a id="matchStringOnly.StopTestLog" href="#matchStringOnly.StopTestLog">func (f matchStringOnly) StopTestLog() error</a>

```
searchKey: testing.matchStringOnly.StopTestLog
tags: [function private]
```

```Go
func (f matchStringOnly) StopTestLog() error
```

#### <a id="matchStringOnly.WriteProfileTo" href="#matchStringOnly.WriteProfileTo">func (f matchStringOnly) WriteProfileTo(string, io.Writer, int) error</a>

```
searchKey: testing.matchStringOnly.WriteProfileTo
tags: [method private]
```

```Go
func (f matchStringOnly) WriteProfileTo(string, io.Writer, int) error
```

### <a id="matcher" href="#matcher">type matcher struct</a>

```
searchKey: testing.matcher
tags: [struct private]
```

```Go
type matcher struct {
	filter    []string
	matchFunc func(pat, str string) (bool, error)

	mu       sync.Mutex
	subNames map[string]int64
}
```

matcher sanitizes, uniques, and filters names of subtests and subbenchmarks. 

#### <a id="newMatcher" href="#newMatcher">func newMatcher(matchString func(pat, str string) (bool, error), patterns, name string) *matcher</a>

```
searchKey: testing.newMatcher
tags: [method private]
```

```Go
func newMatcher(matchString func(pat, str string) (bool, error), patterns, name string) *matcher
```

#### <a id="matcher.fullName" href="#matcher.fullName">func (m *matcher) fullName(c *common, subname string) (name string, ok, partial bool)</a>

```
searchKey: testing.matcher.fullName
tags: [method private]
```

```Go
func (m *matcher) fullName(c *common, subname string) (name string, ok, partial bool)
```

#### <a id="matcher.unique" href="#matcher.unique">func (m *matcher) unique(parent, subname string) string</a>

```
searchKey: testing.matcher.unique
tags: [method private]
```

```Go
func (m *matcher) unique(parent, subname string) string
```

unique creates a unique name for the given parent and subname by affixing it with one or more counts, if necessary. 

### <a id="noopWriter" href="#noopWriter">type noopWriter int</a>

```
searchKey: testing.noopWriter
tags: [number private]
```

```Go
type noopWriter int
```

#### <a id="noopWriter.Write" href="#noopWriter.Write">func (nw *noopWriter) Write(b []byte) (int, error)</a>

```
searchKey: testing.noopWriter.Write
tags: [method private]
```

```Go
func (nw *noopWriter) Write(b []byte) (int, error)
```

### <a id="panicHandling" href="#panicHandling">type panicHandling int</a>

```
searchKey: testing.panicHandling
tags: [number private]
```

```Go
type panicHandling int
```

panicHanding is an argument to runCleanup. 

### <a id="testContext" href="#testContext">type testContext struct</a>

```
searchKey: testing.testContext
tags: [struct private]
```

```Go
type testContext struct {
	match    *matcher
	deadline time.Time

	mu sync.Mutex

	// Channel used to signal tests that are ready to be run in parallel.
	startParallel chan bool

	// running is the number of tests currently running in parallel.
	// This does not include tests that are waiting for subtests to complete.
	running int

	// numWaiting is the number tests waiting to be run in parallel.
	numWaiting int

	// maxParallel is a copy of the parallel flag.
	maxParallel int
}
```

testContext holds all fields that are common to all tests. This includes synchronization primitives to run at most *parallel tests. 

#### <a id="newTestContext" href="#newTestContext">func newTestContext(maxParallel int, m *matcher) *testContext</a>

```
searchKey: testing.newTestContext
tags: [method private]
```

```Go
func newTestContext(maxParallel int, m *matcher) *testContext
```

#### <a id="testContext.release" href="#testContext.release">func (c *testContext) release()</a>

```
searchKey: testing.testContext.release
tags: [function private]
```

```Go
func (c *testContext) release()
```

#### <a id="testContext.waitParallel" href="#testContext.waitParallel">func (c *testContext) waitParallel()</a>

```
searchKey: testing.testContext.waitParallel
tags: [function private]
```

```Go
func (c *testContext) waitParallel()
```

### <a id="testDeps" href="#testDeps">type testDeps interface</a>

```
searchKey: testing.testDeps
tags: [interface private]
```

```Go
type testDeps interface {
	ImportPath() string
	MatchString(pat, str string) (bool, error)
	SetPanicOnExit0(bool)
	StartCPUProfile(io.Writer) error
	StopCPUProfile()
	StartTestLog(io.Writer)
	StopTestLog() error
	WriteProfileTo(string, io.Writer, int) error
}
```

testDeps is an internal interface of functionality that is passed into this package by a test's generated main package. The canonical implementation of this interface is testing/internal/testdeps's TestDeps. 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="AllocsPerRun" href="#AllocsPerRun">func AllocsPerRun(runs int, f func()) (avg float64)</a>

```
searchKey: testing.AllocsPerRun
tags: [method]
```

```Go
func AllocsPerRun(runs int, f func()) (avg float64)
```

AllocsPerRun returns the average number of allocations during calls to f. Although the return value has type float64, it will always be an integral value. 

To compute the number of allocations, the function will first be run once as a warm-up. The average number of allocations over the specified number of runs will then be measured and returned. 

AllocsPerRun sets GOMAXPROCS to 1 during its measurement and will restore it before returning. 

### <a id="BenchmarkTBHelper" href="#BenchmarkTBHelper">func BenchmarkTBHelper(b *B)</a>

```
searchKey: testing.BenchmarkTBHelper
tags: [method private benchmark]
```

```Go
func BenchmarkTBHelper(b *B)
```

### <a id="CoverMode" href="#CoverMode">func CoverMode() string</a>

```
searchKey: testing.CoverMode
tags: [function]
```

```Go
func CoverMode() string
```

CoverMode reports what the test coverage mode is set to. The values are "set", "count", or "atomic". The return value will be empty if test coverage is not enabled. 

### <a id="Coverage" href="#Coverage">func Coverage() float64</a>

```
searchKey: testing.Coverage
tags: [function]
```

```Go
func Coverage() float64
```

Coverage reports the current code coverage as a fraction in the range [0, 1]. If coverage is not enabled, Coverage returns 0. 

When running a large set of sequential test cases, checking Coverage after each one can be useful for identifying which test cases exercise new code paths. It is not a replacement for the reports generated by 'go test -cover' and 'go tool cover'. 

### <a id="Init" href="#Init">func Init()</a>

```
searchKey: testing.Init
tags: [function]
```

```Go
func Init()
```

Init registers testing flags. These flags are automatically registered by the "go test" command before running test functions, so Init is only needed when calling functions such as Benchmark without using "go test". 

Init has no effect if it was already called. 

### <a id="Main" href="#Main">func Main(matchString func(pat, str string) (bool, error), tests []InternalTest, benchmarks []InternalBenchmark, examples []InternalExample)</a>

```
searchKey: testing.Main
tags: [method]
```

```Go
func Main(matchString func(pat, str string) (bool, error), tests []InternalTest, benchmarks []InternalBenchmark, examples []InternalExample)
```

Main is an internal function, part of the implementation of the "go test" command. It was exported because it is cross-package and predates "internal" packages. It is no longer used by "go test" but preserved, as much as possible, for other systems that simulate "go test" using Main, but Main sometimes cannot be updated as new functionality is added to the testing package. Systems simulating "go test" should be updated to use MainStart. 

### <a id="RegisterCover" href="#RegisterCover">func RegisterCover(c Cover)</a>

```
searchKey: testing.RegisterCover
tags: [method]
```

```Go
func RegisterCover(c Cover)
```

RegisterCover records the coverage data accumulators for the tests. NOTE: This function is internal to the testing infrastructure and may change. It is not covered (yet) by the Go 1 compatibility guidelines. 

### <a id="RunBenchmarks" href="#RunBenchmarks">func RunBenchmarks(matchString func(pat, str string) (bool, error), benchmarks []InternalBenchmark)</a>

```
searchKey: testing.RunBenchmarks
tags: [method]
```

```Go
func RunBenchmarks(matchString func(pat, str string) (bool, error), benchmarks []InternalBenchmark)
```

RunBenchmarks is an internal function but exported because it is cross-package; it is part of the implementation of the "go test" command. 

### <a id="RunExamples" href="#RunExamples">func RunExamples(matchString func(pat, str string) (bool, error), examples []InternalExample) (ok bool)</a>

```
searchKey: testing.RunExamples
tags: [method]
```

```Go
func RunExamples(matchString func(pat, str string) (bool, error), examples []InternalExample) (ok bool)
```

RunExamples is an internal function but exported because it is cross-package; it is part of the implementation of the "go test" command. 

### <a id="RunTests" href="#RunTests">func RunTests(matchString func(pat, str string) (bool, error), tests []InternalTest) (ok bool)</a>

```
searchKey: testing.RunTests
tags: [method]
```

```Go
func RunTests(matchString func(pat, str string) (bool, error), tests []InternalTest) (ok bool)
```

RunTests is an internal function but exported because it is cross-package; it is part of the implementation of the "go test" command. 

### <a id="Short" href="#Short">func Short() bool</a>

```
searchKey: testing.Short
tags: [function]
```

```Go
func Short() bool
```

Short reports whether the -test.short flag is set. 

### <a id="TestBRun" href="#TestBRun">func TestBRun(t *T)</a>

```
searchKey: testing.TestBRun
tags: [method private test]
```

```Go
func TestBRun(t *T)
```

### <a id="TestBenchmark" href="#TestBenchmark">func TestBenchmark(t *T)</a>

```
searchKey: testing.TestBenchmark
tags: [method private test]
```

```Go
func TestBenchmark(t *T)
```

### <a id="TestBenchmarkOutput" href="#TestBenchmarkOutput">func TestBenchmarkOutput(t *T)</a>

```
searchKey: testing.TestBenchmarkOutput
tags: [method private test]
```

```Go
func TestBenchmarkOutput(t *T)
```

### <a id="TestBenchmarkReadMemStatsBeforeFirstRun" href="#TestBenchmarkReadMemStatsBeforeFirstRun">func TestBenchmarkReadMemStatsBeforeFirstRun(t *T)</a>

```
searchKey: testing.TestBenchmarkReadMemStatsBeforeFirstRun
tags: [method private test]
```

```Go
func TestBenchmarkReadMemStatsBeforeFirstRun(t *T)
```

### <a id="TestBenchmarkStartsFrom1" href="#TestBenchmarkStartsFrom1">func TestBenchmarkStartsFrom1(t *T)</a>

```
searchKey: testing.TestBenchmarkStartsFrom1
tags: [method private test]
```

```Go
func TestBenchmarkStartsFrom1(t *T)
```

### <a id="TestCleanup" href="#TestCleanup">func TestCleanup(t *T)</a>

```
searchKey: testing.TestCleanup
tags: [method private test]
```

```Go
func TestCleanup(t *T)
```

### <a id="TestCleanupCalledEvenAfterGoexit" href="#TestCleanupCalledEvenAfterGoexit">func TestCleanupCalledEvenAfterGoexit(t *T)</a>

```
searchKey: testing.TestCleanupCalledEvenAfterGoexit
tags: [method private test]
```

```Go
func TestCleanupCalledEvenAfterGoexit(t *T)
```

### <a id="TestCleanupParallelSubtests" href="#TestCleanupParallelSubtests">func TestCleanupParallelSubtests(t *T)</a>

```
searchKey: testing.TestCleanupParallelSubtests
tags: [method private test]
```

```Go
func TestCleanupParallelSubtests(t *T)
```

### <a id="TestConcurrentCleanup" href="#TestConcurrentCleanup">func TestConcurrentCleanup(t *T)</a>

```
searchKey: testing.TestConcurrentCleanup
tags: [method private test]
```

```Go
func TestConcurrentCleanup(t *T)
```

### <a id="TestIsSpace" href="#TestIsSpace">func TestIsSpace(t *T)</a>

```
searchKey: testing.TestIsSpace
tags: [method private test]
```

```Go
func TestIsSpace(t *T)
```

Verify that our IsSpace agrees with unicode.IsSpace. 

### <a id="TestLogAfterComplete" href="#TestLogAfterComplete">func TestLogAfterComplete(t *T)</a>

```
searchKey: testing.TestLogAfterComplete
tags: [method private test]
```

```Go
func TestLogAfterComplete(t *T)
```

The late log message did not include the test name.  Issue 29388. 

### <a id="TestMatcher" href="#TestMatcher">func TestMatcher(t *T)</a>

```
searchKey: testing.TestMatcher
tags: [method private test]
```

```Go
func TestMatcher(t *T)
```

### <a id="TestNaming" href="#TestNaming">func TestNaming(t *T)</a>

```
searchKey: testing.TestNaming
tags: [method private test]
```

```Go
func TestNaming(t *T)
```

### <a id="TestNestedCleanup" href="#TestNestedCleanup">func TestNestedCleanup(t *T)</a>

```
searchKey: testing.TestNestedCleanup
tags: [method private test]
```

```Go
func TestNestedCleanup(t *T)
```

### <a id="TestParallelSub" href="#TestParallelSub">func TestParallelSub(t *T)</a>

```
searchKey: testing.TestParallelSub
tags: [method private test]
```

```Go
func TestParallelSub(t *T)
```

### <a id="TestRacyOutput" href="#TestRacyOutput">func TestRacyOutput(t *T)</a>

```
searchKey: testing.TestRacyOutput
tags: [method private test]
```

```Go
func TestRacyOutput(t *T)
```

### <a id="TestRunCleanup" href="#TestRunCleanup">func TestRunCleanup(t *T)</a>

```
searchKey: testing.TestRunCleanup
tags: [method private test]
```

```Go
func TestRunCleanup(t *T)
```

### <a id="TestSplitRegexp" href="#TestSplitRegexp">func TestSplitRegexp(t *T)</a>

```
searchKey: testing.TestSplitRegexp
tags: [method private test]
```

```Go
func TestSplitRegexp(t *T)
```

### <a id="TestTBHelper" href="#TestTBHelper">func TestTBHelper(t *T)</a>

```
searchKey: testing.TestTBHelper
tags: [method private test]
```

```Go
func TestTBHelper(t *T)
```

### <a id="TestTBHelperLineNumer" href="#TestTBHelperLineNumer">func TestTBHelperLineNumer(t *T)</a>

```
searchKey: testing.TestTBHelperLineNumer
tags: [method private test]
```

```Go
func TestTBHelperLineNumer(t *T)
```

### <a id="TestTBHelperParallel" href="#TestTBHelperParallel">func TestTBHelperParallel(t *T)</a>

```
searchKey: testing.TestTBHelperParallel
tags: [method private test]
```

```Go
func TestTBHelperParallel(t *T)
```

### <a id="TestTRun" href="#TestTRun">func TestTRun(t *T)</a>

```
searchKey: testing.TestTRun
tags: [method private test]
```

```Go
func TestTRun(t *T)
```

### <a id="TestTestContext" href="#TestTestContext">func TestTestContext(t *T)</a>

```
searchKey: testing.TestTestContext
tags: [method private test]
```

```Go
func TestTestContext(t *T)
```

### <a id="Verbose" href="#Verbose">func Verbose() bool</a>

```
searchKey: testing.Verbose
tags: [function]
```

```Go
func Verbose() bool
```

Verbose reports whether the -test.v flag is set. 

### <a id="benchmarkName" href="#benchmarkName">func benchmarkName(name string, n int) string</a>

```
searchKey: testing.benchmarkName
tags: [method private]
```

```Go
func benchmarkName(name string, n int) string
```

benchmarkName returns full name of benchmark including procs suffix. 

### <a id="callerName" href="#callerName">func callerName(skip int) string</a>

```
searchKey: testing.callerName
tags: [method private]
```

```Go
func callerName(skip int) string
```

callerName gives the function name (qualified with a package path) for the caller after skip frames (where 0 means the current function). 

### <a id="coverReport" href="#coverReport">func coverReport()</a>

```
searchKey: testing.coverReport
tags: [function private]
```

```Go
func coverReport()
```

coverReport reports the coverage percentage and writes a coverage profile if requested. 

### <a id="fmtDuration" href="#fmtDuration">func fmtDuration(d time.Duration) string</a>

```
searchKey: testing.fmtDuration
tags: [method private]
```

```Go
func fmtDuration(d time.Duration) string
```

fmtDuration returns a string representing d in the form "87.00s". 

### <a id="helper" href="#helper">func helper(t *T, msg string)</a>

```
searchKey: testing.helper
tags: [method private]
```

```Go
func helper(t *T, msg string)
```

### <a id="helperCallingHelper" href="#helperCallingHelper">func helperCallingHelper(t *T, msg string)</a>

```
searchKey: testing.helperCallingHelper
tags: [method private]
```

```Go
func helperCallingHelper(t *T, msg string)
```

### <a id="init.sub_test.go" href="#init.sub_test.go">func init()</a>

```
searchKey: testing.init
tags: [function private]
```

```Go
func init()
```

### <a id="initBenchmarkFlags" href="#initBenchmarkFlags">func initBenchmarkFlags()</a>

```
searchKey: testing.initBenchmarkFlags
tags: [function private]
```

```Go
func initBenchmarkFlags()
```

### <a id="isSpace" href="#isSpace">func isSpace(r rune) bool</a>

```
searchKey: testing.isSpace
tags: [method private]
```

```Go
func isSpace(r rune) bool
```

### <a id="listTests" href="#listTests">func listTests(matchString func(pat, str string) (bool, error), tests []InternalTest, benchmarks []InternalBenchmark, examples []InternalExample)</a>

```
searchKey: testing.listTests
tags: [method private]
```

```Go
func listTests(matchString func(pat, str string) (bool, error), tests []InternalTest, benchmarks []InternalBenchmark, examples []InternalExample)
```

### <a id="makeRegexp" href="#makeRegexp">func makeRegexp(s string) string</a>

```
searchKey: testing.makeRegexp
tags: [method private]
```

```Go
func makeRegexp(s string) string
```

### <a id="max" href="#max">func max(x, y int64) int64</a>

```
searchKey: testing.max
tags: [method private]
```

```Go
func max(x, y int64) int64
```

### <a id="min" href="#min">func min(x, y int64) int64</a>

```
searchKey: testing.min
tags: [method private]
```

```Go
func min(x, y int64) int64
```

### <a id="mustBeNil" href="#mustBeNil">func mustBeNil(err error)</a>

```
searchKey: testing.mustBeNil
tags: [method private]
```

```Go
func mustBeNil(err error)
```

mustBeNil checks the error and, if present, reports it and exits. 

### <a id="notHelper" href="#notHelper">func notHelper(t *T, msg string)</a>

```
searchKey: testing.notHelper
tags: [method private]
```

```Go
func notHelper(t *T, msg string)
```

### <a id="notHelperCallingHelper" href="#notHelperCallingHelper">func notHelperCallingHelper(t *T, msg string)</a>

```
searchKey: testing.notHelperCallingHelper
tags: [method private]
```

```Go
func notHelperCallingHelper(t *T, msg string)
```

### <a id="parallelTestHelper" href="#parallelTestHelper">func parallelTestHelper(t *T)</a>

```
searchKey: testing.parallelTestHelper
tags: [method private]
```

```Go
func parallelTestHelper(t *T)
```

### <a id="parseCpuList" href="#parseCpuList">func parseCpuList()</a>

```
searchKey: testing.parseCpuList
tags: [function private]
```

```Go
func parseCpuList()
```

### <a id="pcToName" href="#pcToName">func pcToName(pc uintptr) string</a>

```
searchKey: testing.pcToName
tags: [method private]
```

```Go
func pcToName(pc uintptr) string
```

### <a id="prettyPrint" href="#prettyPrint">func prettyPrint(w io.Writer, x float64, unit string)</a>

```
searchKey: testing.prettyPrint
tags: [method private]
```

```Go
func prettyPrint(w io.Writer, x float64, unit string)
```

### <a id="rewrite" href="#rewrite">func rewrite(s string) string</a>

```
searchKey: testing.rewrite
tags: [method private]
```

```Go
func rewrite(s string) string
```

rewrite rewrites a subname to having only printable characters and no white space. 

### <a id="runBenchmarks" href="#runBenchmarks">func runBenchmarks(importPath string, matchString func(pat, str string) (bool, error), benchmarks []InternalBenchmark) bool</a>

```
searchKey: testing.runBenchmarks
tags: [method private]
```

```Go
func runBenchmarks(importPath string, matchString func(pat, str string) (bool, error), benchmarks []InternalBenchmark) bool
```

### <a id="runExample" href="#runExample">func runExample(eg InternalExample) (ok bool)</a>

```
searchKey: testing.runExample
tags: [method private]
```

```Go
func runExample(eg InternalExample) (ok bool)
```

### <a id="runExamples" href="#runExamples">func runExamples(matchString func(pat, str string) (bool, error), examples []InternalExample) (ran, ok bool)</a>

```
searchKey: testing.runExamples
tags: [method private]
```

```Go
func runExamples(matchString func(pat, str string) (bool, error), examples []InternalExample) (ran, ok bool)
```

### <a id="runTests" href="#runTests">func runTests(matchString func(pat, str string) (bool, error), tests []InternalTest, deadline time.Time) (ran, ok bool)</a>

```
searchKey: testing.runTests
tags: [method private]
```

```Go
func runTests(matchString func(pat, str string) (bool, error), tests []InternalTest, deadline time.Time) (ran, ok bool)
```

### <a id="shouldFailFast" href="#shouldFailFast">func shouldFailFast() bool</a>

```
searchKey: testing.shouldFailFast
tags: [function private]
```

```Go
func shouldFailFast() bool
```

### <a id="sortLines" href="#sortLines">func sortLines(output string) string</a>

```
searchKey: testing.sortLines
tags: [method private]
```

```Go
func sortLines(output string) string
```

### <a id="splitRegexp" href="#splitRegexp">func splitRegexp(s string) []string</a>

```
searchKey: testing.splitRegexp
tags: [method private]
```

```Go
func splitRegexp(s string) []string
```

### <a id="tRunner" href="#tRunner">func tRunner(t *T, fn func(t *T))</a>

```
searchKey: testing.tRunner
tags: [method private]
```

```Go
func tRunner(t *T, fn func(t *T))
```

### <a id="testHelper" href="#testHelper">func testHelper(t *T)</a>

```
searchKey: testing.testHelper
tags: [method private]
```

```Go
func testHelper(t *T)
```

### <a id="toOutputDir" href="#toOutputDir">func toOutputDir(path string) string</a>

```
searchKey: testing.toOutputDir
tags: [method private]
```

```Go
func toOutputDir(path string) string
```

toOutputDir returns the file name relocated, if required, to outputDir. Simple implementation to avoid pulling in path/filepath. 

