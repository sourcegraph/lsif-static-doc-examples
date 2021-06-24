# Package pprof

Package pprof writes runtime profiling data in the format expected by the pprof visualization tool. 

### hdr-Profiling_a_Go_programProfiling a Go program
The first step to profiling a Go program is to enable profiling. Support for profiling benchmarks built with the standard testing package is built into go test. For example, the following command runs benchmarks in the current directory and writes the CPU and memory profiles to cpu.prof and mem.prof: 

```
go test -cpuprofile cpu.prof -memprofile mem.prof -bench .

```
To add equivalent profiling support to a standalone program, add code like the following to your main function: 

```
var cpuprofile = flag.String("cpuprofile", "", "write cpu profile to `file`")
var memprofile = flag.String("memprofile", "", "write memory profile to `file`")

func main() {
    flag.Parse()
    if *cpuprofile != "" {
        f, err := os.Create(*cpuprofile)
        if err != nil {
            log.Fatal("could not create CPU profile: ", err)
        }
        defer f.Close() // error handling omitted for example
        if err := pprof.StartCPUProfile(f); err != nil {
            log.Fatal("could not start CPU profile: ", err)
        }
        defer pprof.StopCPUProfile()
    }

    // ... rest of the program ...

    if *memprofile != "" {
        f, err := os.Create(*memprofile)
        if err != nil {
            log.Fatal("could not create memory profile: ", err)
        }
        defer f.Close() // error handling omitted for example
        runtime.GC() // get up-to-date statistics
        if err := pprof.WriteHeapProfile(f); err != nil {
            log.Fatal("could not write memory profile: ", err)
        }
    }
}

```
There is also a standard HTTP interface to profiling data. Adding the following line will install handlers under the /debug/pprof/ URL to download live profiles: 

```
import _ "net/http/pprof"

```
See the net/http/pprof package for more details. 

Profiles can then be visualized with the pprof tool: 

```
go tool pprof cpu.prof

```
There are many commands available from the pprof command line. Commonly used commands include "top", which prints a summary of the top program hot-spots, and "web", which opens an interactive graph of hot-spots and their call graphs. Use "help" for information on all pprof commands. 

For more information about pprof, see [https://github.com/google/pprof/blob/master/doc/README.md](https://github.com/google/pprof/blob/master/doc/README.md). 

## Index

* [Constants](#const)
    * [const blockDelay](#blockDelay)
    * [const lookupFailed](#lookupFailed)
    * [const lookupTried](#lookupTried)
    * [const tagFunction_Filename](#tagFunction_Filename)
    * [const tagFunction_ID](#tagFunction_ID)
    * [const tagFunction_Name](#tagFunction_Name)
    * [const tagFunction_StartLine](#tagFunction_StartLine)
    * [const tagFunction_SystemName](#tagFunction_SystemName)
    * [const tagLabel_Key](#tagLabel_Key)
    * [const tagLabel_Num](#tagLabel_Num)
    * [const tagLabel_Str](#tagLabel_Str)
    * [const tagLine_FunctionID](#tagLine_FunctionID)
    * [const tagLine_Line](#tagLine_Line)
    * [const tagLocation_Address](#tagLocation_Address)
    * [const tagLocation_ID](#tagLocation_ID)
    * [const tagLocation_Line](#tagLocation_Line)
    * [const tagLocation_MappingID](#tagLocation_MappingID)
    * [const tagMapping_BuildID](#tagMapping_BuildID)
    * [const tagMapping_Filename](#tagMapping_Filename)
    * [const tagMapping_HasFilenames](#tagMapping_HasFilenames)
    * [const tagMapping_HasFunctions](#tagMapping_HasFunctions)
    * [const tagMapping_HasInlineFrames](#tagMapping_HasInlineFrames)
    * [const tagMapping_HasLineNumbers](#tagMapping_HasLineNumbers)
    * [const tagMapping_ID](#tagMapping_ID)
    * [const tagMapping_Limit](#tagMapping_Limit)
    * [const tagMapping_Offset](#tagMapping_Offset)
    * [const tagMapping_Start](#tagMapping_Start)
    * [const tagProfile_Comment](#tagProfile_Comment)
    * [const tagProfile_DefaultSampleType](#tagProfile_DefaultSampleType)
    * [const tagProfile_DropFrames](#tagProfile_DropFrames)
    * [const tagProfile_DurationNanos](#tagProfile_DurationNanos)
    * [const tagProfile_Function](#tagProfile_Function)
    * [const tagProfile_KeepFrames](#tagProfile_KeepFrames)
    * [const tagProfile_Location](#tagProfile_Location)
    * [const tagProfile_Mapping](#tagProfile_Mapping)
    * [const tagProfile_Period](#tagProfile_Period)
    * [const tagProfile_PeriodType](#tagProfile_PeriodType)
    * [const tagProfile_Sample](#tagProfile_Sample)
    * [const tagProfile_SampleType](#tagProfile_SampleType)
    * [const tagProfile_StringTable](#tagProfile_StringTable)
    * [const tagProfile_TimeNanos](#tagProfile_TimeNanos)
    * [const tagSample_Label](#tagSample_Label)
    * [const tagSample_Location](#tagSample_Location)
    * [const tagSample_Value](#tagSample_Value)
    * [const tagValueType_Type](#tagValueType_Type)
    * [const tagValueType_Unit](#tagValueType_Unit)
* [Variables](#var)
    * [var allocsProfile](#allocsProfile)
    * [var blockProfile](#blockProfile)
    * [var cpu](#cpu)
    * [var emptyCallStackTestRun](#emptyCallStackTestRun)
    * [var errBadELF](#errBadELF)
    * [var errNoBuildID](#errNoBuildID)
    * [var goroutineProfile](#goroutineProfile)
    * [var heapProfile](#heapProfile)
    * [var memSink](#memSink)
    * [var memoryProfilerRun](#memoryProfilerRun)
    * [var mutexProfile](#mutexProfile)
    * [var persistentMemSink](#persistentMemSink)
    * [var profSelfMapsTests](#profSelfMapsTests)
    * [var profSelfMapsTestsWithDeleted](#profSelfMapsTestsWithDeleted)
    * [var profiles](#profiles)
    * [var salt1](#salt1)
    * [var salt2](#salt2)
    * [var threadcreateProfile](#threadcreateProfile)
* [Types](#type)
    * [type LabelSet struct](#LabelSet)
        * [func Labels(args ...string) LabelSet](#Labels)
    * [type Obj32 struct](#Obj32)
    * [type Profile struct](#Profile)
        * [func Lookup(name string) *Profile](#Lookup)
        * [func NewProfile(name string) *Profile](#NewProfile)
        * [func (p *Profile) Add(value interface{}, skip int)](#Profile.Add)
        * [func (p *Profile) Count() int](#Profile.Count)
        * [func (p *Profile) Name() string](#Profile.Name)
        * [func (p *Profile) Remove(value interface{})](#Profile.Remove)
        * [func (p *Profile) WriteTo(w io.Writer, debug int) error](#Profile.WriteTo)
    * [type countProfile interface](#countProfile)
    * [type keysByCount struct](#keysByCount)
        * [func (x *keysByCount) Len() int](#keysByCount.Len)
        * [func (x *keysByCount) Less(i, j int) bool](#keysByCount.Less)
        * [func (x *keysByCount) Swap(i, j int)](#keysByCount.Swap)
    * [type label struct](#label)
    * [type labelContextKey struct{}](#labelContextKey)
    * [type labelMap map[string]string](#labelMap)
        * [func labelValue(ctx context.Context) labelMap](#labelValue)
        * [func (l *labelMap) String() string](#labelMap.String)
    * [type labelSorter []pprof.label](#labelSorter)
        * [func (s labelSorter) Len() int](#labelSorter.Len)
        * [func (s labelSorter) Less(i, j int) bool](#labelSorter.Less)
        * [func (s labelSorter) Swap(i, j int)](#labelSorter.Swap)
    * [type locInfo struct](#locInfo)
    * [type matchFunc func(spec string, count uintptr, stk []*internal/profile.Location, labels map[string][]string) bool](#matchFunc)
    * [type memMap struct](#memMap)
    * [type msgOffset int](#msgOffset)
    * [type pcDeck struct](#pcDeck)
        * [func (d *pcDeck) reset()](#pcDeck.reset)
        * [func (d *pcDeck) tryAdd(pc uintptr, frames []runtime.Frame, symbolizeResult symbolizeFlag) (success bool)](#pcDeck.tryAdd)
    * [type profMap struct](#profMap)
        * [func (m *profMap) lookup(stk []uint64, tag unsafe.Pointer) *profMapEntry](#profMap.lookup)
    * [type profMapEntry struct](#profMapEntry)
    * [type profileBuilder struct](#profileBuilder)
        * [func newProfileBuilder(w io.Writer) *profileBuilder](#newProfileBuilder)
        * [func (b *profileBuilder) addCPUData(data []uint64, tags []unsafe.Pointer) error](#profileBuilder.addCPUData)
        * [func (b *profileBuilder) addMapping(lo, hi, offset uint64, file, buildID string)](#profileBuilder.addMapping)
        * [func (b *profileBuilder) addMappingEntry(lo, hi, offset uint64, file, buildID string, fake bool)](#profileBuilder.addMappingEntry)
        * [func (b *profileBuilder) appendLocsForStack(locs []uint64, stk []uintptr) (newLocs []uint64)](#profileBuilder.appendLocsForStack)
        * [func (b *profileBuilder) build()](#profileBuilder.build)
        * [func (b *profileBuilder) emitLocation() uint64](#profileBuilder.emitLocation)
        * [func (b *profileBuilder) flush()](#profileBuilder.flush)
        * [func (b *profileBuilder) pbLabel(tag int, key, str string, num int64)](#profileBuilder.pbLabel)
        * [func (b *profileBuilder) pbLine(tag int, funcID uint64, line int64)](#profileBuilder.pbLine)
        * [func (b *profileBuilder) pbMapping(tag int, id, base, limit, offset uint64, file, buildID string, hasFuncs bool)](#profileBuilder.pbMapping)
        * [func (b *profileBuilder) pbSample(values []int64, locs []uint64, labels func())](#profileBuilder.pbSample)
        * [func (b *profileBuilder) pbValueType(tag int, typ, unit string)](#profileBuilder.pbValueType)
        * [func (b *profileBuilder) readMapping()](#profileBuilder.readMapping)
        * [func (b *profileBuilder) stringIndex(s string) int64](#profileBuilder.stringIndex)
    * [type protobuf struct](#protobuf)
        * [func (b *protobuf) bool(tag int, x bool)](#protobuf.bool)
        * [func (b *protobuf) boolOpt(tag int, x bool)](#protobuf.boolOpt)
        * [func (b *protobuf) endMessage(tag int, start msgOffset)](#protobuf.endMessage)
        * [func (b *protobuf) int64(tag int, x int64)](#protobuf.int64)
        * [func (b *protobuf) int64Opt(tag int, x int64)](#protobuf.int64Opt)
        * [func (b *protobuf) int64s(tag int, x []int64)](#protobuf.int64s)
        * [func (b *protobuf) length(tag int, len int)](#protobuf.length)
        * [func (b *protobuf) startMessage() msgOffset](#protobuf.startMessage)
        * [func (b *protobuf) string(tag int, x string)](#protobuf.string)
        * [func (b *protobuf) stringOpt(tag int, x string)](#protobuf.stringOpt)
        * [func (b *protobuf) strings(tag int, x []string)](#protobuf.strings)
        * [func (b *protobuf) uint64(tag int, x uint64)](#protobuf.uint64)
        * [func (b *protobuf) uint64Opt(tag int, x uint64)](#protobuf.uint64Opt)
        * [func (b *protobuf) uint64s(tag int, x []uint64)](#protobuf.uint64s)
        * [func (b *protobuf) varint(x uint64)](#protobuf.varint)
    * [type runtimeProfile struct](#runtimeProfile)
        * [func (p *runtimeProfile) Label(i int) *labelMap](#runtimeProfile.Label)
        * [func (p *runtimeProfile) Len() int](#runtimeProfile.Len)
        * [func (p *runtimeProfile) Stack(i int) []uintptr](#runtimeProfile.Stack)
    * [type stackProfile [][]uintptr](#stackProfile)
        * [func (x stackProfile) Label(i int) *labelMap](#stackProfile.Label)
        * [func (x stackProfile) Len() int](#stackProfile.Len)
        * [func (x stackProfile) Stack(i int) []uintptr](#stackProfile.Stack)
    * [type symbolizeFlag uint8](#symbolizeFlag)
        * [func allFrames(addr uintptr) ([]runtime.Frame, symbolizeFlag)](#allFrames)
* [Functions](#func)
    * [func Do(ctx context.Context, labels LabelSet, f func(context.Context))](#Do)
    * [func ForLabels(ctx context.Context, f func(key, value string) bool)](#ForLabels)
    * [func Label(ctx context.Context, key string) (string, bool)](#Label)
    * [func Profiles() []*Profile](#Profiles)
    * [func SetGoroutineLabels(ctx context.Context)](#SetGoroutineLabels)
    * [func StartCPUProfile(w io.Writer) error](#StartCPUProfile)
    * [func StopCPUProfile()](#StopCPUProfile)
    * [func TestAtomicLoadStore64(t *testing.T)](#TestAtomicLoadStore64)
    * [func TestBlockProfile(t *testing.T)](#TestBlockProfile)
    * [func TestBlockProfileBias(t *testing.T)](#TestBlockProfileBias)
    * [func TestCPUProfile(t *testing.T)](#TestCPUProfile)
    * [func TestCPUProfileInlining(t *testing.T)](#TestCPUProfileInlining)
    * [func TestCPUProfileLabel(t *testing.T)](#TestCPUProfileLabel)
    * [func TestCPUProfileMultithreaded(t *testing.T)](#TestCPUProfileMultithreaded)
    * [func TestCPUProfileRecursion(t *testing.T)](#TestCPUProfileRecursion)
    * [func TestCPUProfileWithFork(t *testing.T)](#TestCPUProfileWithFork)
    * [func TestContextLabels(t *testing.T)](#TestContextLabels)
    * [func TestConvertCPUProfile(t *testing.T)](#TestConvertCPUProfile)
    * [func TestConvertCPUProfileEmpty(t *testing.T)](#TestConvertCPUProfileEmpty)
    * [func TestConvertMemProfile(t *testing.T)](#TestConvertMemProfile)
    * [func TestDo(t *testing.T)](#TestDo)
    * [func TestEmptyCallStack(t *testing.T)](#TestEmptyCallStack)
    * [func TestEmptyStack(t *testing.T)](#TestEmptyStack)
    * [func TestFakeMapping(t *testing.T)](#TestFakeMapping)
    * [func TestGoroutineCounts(t *testing.T)](#TestGoroutineCounts)
    * [func TestGoroutineSwitch(t *testing.T)](#TestGoroutineSwitch)
    * [func TestLabelMapStringer(t *testing.T)](#TestLabelMapStringer)
    * [func TestLabelRace(t *testing.T)](#TestLabelRace)
    * [func TestMapping(t *testing.T)](#TestMapping)
    * [func TestMathBigDivide(t *testing.T)](#TestMathBigDivide)
    * [func TestMemoryProfiler(t *testing.T)](#TestMemoryProfiler)
    * [func TestMorestack(t *testing.T)](#TestMorestack)
    * [func TestMutexProfile(t *testing.T)](#TestMutexProfile)
    * [func TestProcSelfMaps(t *testing.T)](#TestProcSelfMaps)
    * [func TestSetGoroutineLabels(t *testing.T)](#TestSetGoroutineLabels)
    * [func TestTracebackAll(t *testing.T)](#TestTracebackAll)
    * [func TestTryAdd(t *testing.T)](#TestTryAdd)
    * [func WithLabels(ctx context.Context, labels LabelSet) context.Context](#WithLabels)
    * [func WriteHeapProfile(w io.Writer) error](#WriteHeapProfile)
    * [func addMaxRSS(w io.Writer)](#addMaxRSS)
    * [func allocatePersistent1K()](#allocatePersistent1K)
    * [func allocateReflect()](#allocateReflect)
    * [func allocateReflectTransient()](#allocateReflectTransient)
    * [func allocateTransient1M()](#allocateTransient1M)
    * [func allocateTransient2M()](#allocateTransient2M)
    * [func allocateTransient2MInline()](#allocateTransient2MInline)
    * [func avoidFunctions() []string](#avoidFunctions)
    * [func blockChanClose()](#blockChanClose)
    * [func blockChanRecv()](#blockChanRecv)
    * [func blockChanSend()](#blockChanSend)
    * [func blockCond()](#blockCond)
    * [func blockFrequentShort(rate int)](#blockFrequentShort)
    * [func blockInfrequentLong(rate int)](#blockInfrequentLong)
    * [func blockMutex()](#blockMutex)
    * [func blockSelectRecvAsync()](#blockSelectRecvAsync)
    * [func blockSelectSendSync()](#blockSelectSendSync)
    * [func blockevent(cycles int64, skip int)](#blockevent)
    * [func checkProfile(t *testing.T, p *profile.Profile, period int64, periodType *profile.ValueType, sampleType []*profile.ValueType, samples []*profile.Sample, defaultSampleType string)](#checkProfile)
    * [func contains(slice []string, s string) bool](#contains)
    * [func containsCountsLabels(prof *profile.Profile, countLabels map[int64]map[string]string) bool](#containsCountsLabels)
    * [func containsInOrder(s string, all ...string) bool](#containsInOrder)
    * [func containsInlinedCall(f interface{}, maxBytes int) bool](#containsInlinedCall)
    * [func containsStack(got [][]string, want []string) bool](#containsStack)
    * [func countBlock() int](#countBlock)
    * [func countGoroutine() int](#countGoroutine)
    * [func countHeap() int](#countHeap)
    * [func countMutex() int](#countMutex)
    * [func countThreadCreate() int](#countThreadCreate)
    * [func cpuHog0(x, n int) int](#cpuHog0)
    * [func cpuHog1(x int) int](#cpuHog1)
    * [func cpuHog2(x int) int](#cpuHog2)
    * [func cpuHogger(f func(x int) int, y *int, dur time.Duration)](#cpuHogger)
    * [func cpuProfilingBroken() bool](#cpuProfilingBroken)
    * [func dumpCallers(pcs []uintptr)](#dumpCallers)
    * [func elfBuildID(file string) (string, error)](#elfBuildID)
    * [func f1()](#f1)
    * [func f2()](#f2)
    * [func findInlinedCall(f interface{}, maxBytes int) (pc uint64, found bool)](#findInlinedCall)
    * [func fmtJSON(x interface{}) string](#fmtJSON)
    * [func fprintStack(w io.Writer, stk []*profile.Location)](#fprintStack)
    * [func func1(c chan int)](#func1)
    * [func func2(c chan int)](#func2)
    * [func func3(c chan int)](#func3)
    * [func func4(c chan int)](#func4)
    * [func funcPC(f interface{}) uintptr](#funcPC)
    * [func getProfLabel() map[string]string](#getProfLabel)
    * [func growstack(n int)](#growstack)
    * [func growstack1()](#growstack1)
    * [func inlinedCallee(x, n int) int](#inlinedCallee)
    * [func inlinedCalleeDump(pcs []uintptr)](#inlinedCalleeDump)
    * [func inlinedCaller(x int) int](#inlinedCaller)
    * [func inlinedCallerDump(pcs []uintptr)](#inlinedCallerDump)
    * [func labelsSorted(ctx context.Context) []label](#labelsSorted)
    * [func lockProfiles()](#lockProfiles)
    * [func lostProfileEvent()](#lostProfileEvent)
    * [func parseProcSelfMaps(data []byte, addMapping func(lo, hi, offset uint64, file, buildID string))](#parseProcSelfMaps)
    * [func parseProfile(t *testing.T, valBytes []byte, f func(uintptr, []*profile.Location, map[string][]string)) *profile.Profile](#parseProfile)
    * [func printCountCycleProfile(w io.Writer, countName, cycleName string, scaler func(int64, float64) (int64, float64), records []runtime.BlockProfileRecord) error](#printCountCycleProfile)
    * [func printCountProfile(w io.Writer, debug int, name string, p countProfile) error](#printCountProfile)
    * [func printStackRecord(w io.Writer, stk []uintptr, allFrames bool)](#printStackRecord)
    * [func profileOk(t *testing.T, matches matchFunc, need []string, avoid []string, prof bytes.Buffer, duration time.Duration) (_ *profile.Profile, ok bool)](#profileOk)
    * [func profileWriter(w io.Writer)](#profileWriter)
    * [func readProfile() (data []uint64, tags []unsafe.Pointer, eof bool)](#readProfile)
    * [func recursionCallee(n, x int) int](#recursionCallee)
    * [func recursionCaller(x int) int](#recursionCaller)
    * [func recursionChainBottom(x int, pcs []uintptr)](#recursionChainBottom)
    * [func recursionChainMiddle(x int, pcs []uintptr)](#recursionChainMiddle)
    * [func recursionChainTop(x int, pcs []uintptr)](#recursionChainTop)
    * [func runtime_cyclesPerSecond() int64](#runtime_cyclesPerSecond)
    * [func runtime_expandFinalInlineFrame(stk []uintptr) []uintptr](#runtime_expandFinalInlineFrame)
    * [func runtime_getProfLabel() unsafe.Pointer](#runtime_getProfLabel)
    * [func runtime_goroutineProfileWithLabels(p []runtime.StackRecord, labels []unsafe.Pointer) (n int, ok bool)](#runtime_goroutineProfileWithLabels)
    * [func runtime_setProfLabel(labels unsafe.Pointer)](#runtime_setProfLabel)
    * [func scaleBlockProfile(cnt int64, ns float64) (int64, float64)](#scaleBlockProfile)
    * [func scaleHeapSample(count, size, rate int64) (int64, int64)](#scaleHeapSample)
    * [func scaleMutexProfile(cnt int64, ns float64) (int64, float64)](#scaleMutexProfile)
    * [func stackContains(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool](#stackContains)
    * [func stackContainsAll(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool](#stackContainsAll)
    * [func stackContainsLabeled(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool](#stackContainsLabeled)
    * [func stacks(p *profile.Profile) (res [][]string)](#stacks)
    * [func symbolized(loc *profile.Location) bool](#symbolized)
    * [func testCPUProfile(t *testing.T, matches matchFunc, need []string, avoid []string, f func(dur time.Duration)) *profile.Profile](#testCPUProfile)
    * [func testPCs(t *testing.T) (addr1, addr2 uint64, map1, map2 *profile.Mapping)](#testPCs)
    * [func translateCPUProfile(data []uint64) (*profile.Profile, error)](#translateCPUProfile)
    * [func unlockProfiles()](#unlockProfiles)
    * [func use(x [8 << 16]byte)](#use)
    * [func writeAlloc(w io.Writer, debug int) error](#writeAlloc)
    * [func writeBlock(w io.Writer, debug int) error](#writeBlock)
    * [func writeGoroutine(w io.Writer, debug int) error](#writeGoroutine)
    * [func writeGoroutineStacks(w io.Writer) error](#writeGoroutineStacks)
    * [func writeHeap(w io.Writer, debug int) error](#writeHeap)
    * [func writeHeapInternal(w io.Writer, debug int, defaultSampleType string) error](#writeHeapInternal)
    * [func writeHeapProto(w io.Writer, p []runtime.MemProfileRecord, rate int64, defaultSampleType string) error](#writeHeapProto)
    * [func writeMutex(w io.Writer, debug int) error](#writeMutex)
    * [func writeProfileInternal(w io.Writer, debug int, name string, runtimeProfile func([]runtime.BlockProfileRecord) (int, bool), scaleProfile func(int64, float64) (int64, float64)) error](#writeProfileInternal)
    * [func writeRuntimeProfile(w io.Writer, debug int, name string, fetch func([]runtime.StackRecord, []unsafe.Pointer) (int, bool)) error](#writeRuntimeProfile)
    * [func writeThreadCreate(w io.Writer, debug int) error](#writeThreadCreate)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="blockDelay" href="#blockDelay">const blockDelay</a>

```
searchKey: pprof.blockDelay
tags: [constant number private]
```

```Go
const blockDelay = 10 * time.Millisecond
```

### <a id="lookupFailed" href="#lookupFailed">const lookupFailed</a>

```
searchKey: pprof.lookupFailed
tags: [constant number private]
```

```Go
const lookupFailed symbolizeFlag = 1 << iota
```

### <a id="lookupTried" href="#lookupTried">const lookupTried</a>

```
searchKey: pprof.lookupTried
tags: [constant number private]
```

```Go
const lookupTried symbolizeFlag = 1 << iota
```

### <a id="tagFunction_Filename" href="#tagFunction_Filename">const tagFunction_Filename</a>

```
searchKey: pprof.tagFunction_Filename
tags: [constant number private]
```

```Go
const tagFunction_Filename = 4 // int64 (string table index)

```

### <a id="tagFunction_ID" href="#tagFunction_ID">const tagFunction_ID</a>

```
searchKey: pprof.tagFunction_ID
tags: [constant number private]
```

```Go
const tagFunction_ID = 1 // uint64

```

message Function 

### <a id="tagFunction_Name" href="#tagFunction_Name">const tagFunction_Name</a>

```
searchKey: pprof.tagFunction_Name
tags: [constant number private]
```

```Go
const tagFunction_Name = 2 // int64 (string table index)

```

### <a id="tagFunction_StartLine" href="#tagFunction_StartLine">const tagFunction_StartLine</a>

```
searchKey: pprof.tagFunction_StartLine
tags: [constant number private]
```

```Go
const tagFunction_StartLine = 5 // int64

```

### <a id="tagFunction_SystemName" href="#tagFunction_SystemName">const tagFunction_SystemName</a>

```
searchKey: pprof.tagFunction_SystemName
tags: [constant number private]
```

```Go
const tagFunction_SystemName = 3 // int64 (string table index)

```

### <a id="tagLabel_Key" href="#tagLabel_Key">const tagLabel_Key</a>

```
searchKey: pprof.tagLabel_Key
tags: [constant number private]
```

```Go
const tagLabel_Key = 1 // int64 (string table index)

```

message Label 

### <a id="tagLabel_Num" href="#tagLabel_Num">const tagLabel_Num</a>

```
searchKey: pprof.tagLabel_Num
tags: [constant number private]
```

```Go
const tagLabel_Num = 3 // int64

```

### <a id="tagLabel_Str" href="#tagLabel_Str">const tagLabel_Str</a>

```
searchKey: pprof.tagLabel_Str
tags: [constant number private]
```

```Go
const tagLabel_Str = 2 // int64 (string table index)

```

### <a id="tagLine_FunctionID" href="#tagLine_FunctionID">const tagLine_FunctionID</a>

```
searchKey: pprof.tagLine_FunctionID
tags: [constant number private]
```

```Go
const tagLine_FunctionID = 1 // uint64

```

message Line 

### <a id="tagLine_Line" href="#tagLine_Line">const tagLine_Line</a>

```
searchKey: pprof.tagLine_Line
tags: [constant number private]
```

```Go
const tagLine_Line = 2 // int64

```

### <a id="tagLocation_Address" href="#tagLocation_Address">const tagLocation_Address</a>

```
searchKey: pprof.tagLocation_Address
tags: [constant number private]
```

```Go
const tagLocation_Address = 3 // uint64

```

### <a id="tagLocation_ID" href="#tagLocation_ID">const tagLocation_ID</a>

```
searchKey: pprof.tagLocation_ID
tags: [constant number private]
```

```Go
const tagLocation_ID = 1 // uint64

```

message Location 

### <a id="tagLocation_Line" href="#tagLocation_Line">const tagLocation_Line</a>

```
searchKey: pprof.tagLocation_Line
tags: [constant number private]
```

```Go
const tagLocation_Line = 4 // repeated Line

```

### <a id="tagLocation_MappingID" href="#tagLocation_MappingID">const tagLocation_MappingID</a>

```
searchKey: pprof.tagLocation_MappingID
tags: [constant number private]
```

```Go
const tagLocation_MappingID = 2 // uint64

```

### <a id="tagMapping_BuildID" href="#tagMapping_BuildID">const tagMapping_BuildID</a>

```
searchKey: pprof.tagMapping_BuildID
tags: [constant number private]
```

```Go
const tagMapping_BuildID = 6 // int64 (string table index)

```

### <a id="tagMapping_Filename" href="#tagMapping_Filename">const tagMapping_Filename</a>

```
searchKey: pprof.tagMapping_Filename
tags: [constant number private]
```

```Go
const tagMapping_Filename = 5 // int64 (string table index)

```

### <a id="tagMapping_HasFilenames" href="#tagMapping_HasFilenames">const tagMapping_HasFilenames</a>

```
searchKey: pprof.tagMapping_HasFilenames
tags: [constant number private]
```

```Go
const tagMapping_HasFilenames = 8 // bool

```

### <a id="tagMapping_HasFunctions" href="#tagMapping_HasFunctions">const tagMapping_HasFunctions</a>

```
searchKey: pprof.tagMapping_HasFunctions
tags: [constant number private]
```

```Go
const tagMapping_HasFunctions = 7 // bool

```

### <a id="tagMapping_HasInlineFrames" href="#tagMapping_HasInlineFrames">const tagMapping_HasInlineFrames</a>

```
searchKey: pprof.tagMapping_HasInlineFrames
tags: [constant number private]
```

```Go
const tagMapping_HasInlineFrames = 10 // bool

```

### <a id="tagMapping_HasLineNumbers" href="#tagMapping_HasLineNumbers">const tagMapping_HasLineNumbers</a>

```
searchKey: pprof.tagMapping_HasLineNumbers
tags: [constant number private]
```

```Go
const tagMapping_HasLineNumbers = 9 // bool

```

### <a id="tagMapping_ID" href="#tagMapping_ID">const tagMapping_ID</a>

```
searchKey: pprof.tagMapping_ID
tags: [constant number private]
```

```Go
const tagMapping_ID = 1 // uint64

```

message Mapping 

### <a id="tagMapping_Limit" href="#tagMapping_Limit">const tagMapping_Limit</a>

```
searchKey: pprof.tagMapping_Limit
tags: [constant number private]
```

```Go
const tagMapping_Limit = 3 // uint64

```

### <a id="tagMapping_Offset" href="#tagMapping_Offset">const tagMapping_Offset</a>

```
searchKey: pprof.tagMapping_Offset
tags: [constant number private]
```

```Go
const tagMapping_Offset = 4 // uint64

```

### <a id="tagMapping_Start" href="#tagMapping_Start">const tagMapping_Start</a>

```
searchKey: pprof.tagMapping_Start
tags: [constant number private]
```

```Go
const tagMapping_Start = 2 // uint64

```

### <a id="tagProfile_Comment" href="#tagProfile_Comment">const tagProfile_Comment</a>

```
searchKey: pprof.tagProfile_Comment
tags: [constant number private]
```

```Go
const tagProfile_Comment = 13 // repeated int64

```

### <a id="tagProfile_DefaultSampleType" href="#tagProfile_DefaultSampleType">const tagProfile_DefaultSampleType</a>

```
searchKey: pprof.tagProfile_DefaultSampleType
tags: [constant number private]
```

```Go
const tagProfile_DefaultSampleType = 14 // int64

```

### <a id="tagProfile_DropFrames" href="#tagProfile_DropFrames">const tagProfile_DropFrames</a>

```
searchKey: pprof.tagProfile_DropFrames
tags: [constant number private]
```

```Go
const tagProfile_DropFrames = 7 // int64 (string table index)

```

### <a id="tagProfile_DurationNanos" href="#tagProfile_DurationNanos">const tagProfile_DurationNanos</a>

```
searchKey: pprof.tagProfile_DurationNanos
tags: [constant number private]
```

```Go
const tagProfile_DurationNanos = 10 // int64

```

### <a id="tagProfile_Function" href="#tagProfile_Function">const tagProfile_Function</a>

```
searchKey: pprof.tagProfile_Function
tags: [constant number private]
```

```Go
const tagProfile_Function = 5 // repeated Function

```

### <a id="tagProfile_KeepFrames" href="#tagProfile_KeepFrames">const tagProfile_KeepFrames</a>

```
searchKey: pprof.tagProfile_KeepFrames
tags: [constant number private]
```

```Go
const tagProfile_KeepFrames = 8 // int64 (string table index)

```

### <a id="tagProfile_Location" href="#tagProfile_Location">const tagProfile_Location</a>

```
searchKey: pprof.tagProfile_Location
tags: [constant number private]
```

```Go
const tagProfile_Location = 4 // repeated Location

```

### <a id="tagProfile_Mapping" href="#tagProfile_Mapping">const tagProfile_Mapping</a>

```
searchKey: pprof.tagProfile_Mapping
tags: [constant number private]
```

```Go
const tagProfile_Mapping = 3 // repeated Mapping

```

### <a id="tagProfile_Period" href="#tagProfile_Period">const tagProfile_Period</a>

```
searchKey: pprof.tagProfile_Period
tags: [constant number private]
```

```Go
const tagProfile_Period = 12 // int64

```

### <a id="tagProfile_PeriodType" href="#tagProfile_PeriodType">const tagProfile_PeriodType</a>

```
searchKey: pprof.tagProfile_PeriodType
tags: [constant number private]
```

```Go
const tagProfile_PeriodType = 11 // ValueType (really optional string???)

```

### <a id="tagProfile_Sample" href="#tagProfile_Sample">const tagProfile_Sample</a>

```
searchKey: pprof.tagProfile_Sample
tags: [constant number private]
```

```Go
const tagProfile_Sample = 2 // repeated Sample

```

### <a id="tagProfile_SampleType" href="#tagProfile_SampleType">const tagProfile_SampleType</a>

```
searchKey: pprof.tagProfile_SampleType
tags: [constant number private]
```

```Go
const tagProfile_SampleType = 1 // repeated ValueType

```

message Profile 

### <a id="tagProfile_StringTable" href="#tagProfile_StringTable">const tagProfile_StringTable</a>

```
searchKey: pprof.tagProfile_StringTable
tags: [constant number private]
```

```Go
const tagProfile_StringTable = 6 // repeated string

```

### <a id="tagProfile_TimeNanos" href="#tagProfile_TimeNanos">const tagProfile_TimeNanos</a>

```
searchKey: pprof.tagProfile_TimeNanos
tags: [constant number private]
```

```Go
const tagProfile_TimeNanos = 9 // int64

```

### <a id="tagSample_Label" href="#tagSample_Label">const tagSample_Label</a>

```
searchKey: pprof.tagSample_Label
tags: [constant number private]
```

```Go
const tagSample_Label = 3 // repeated Label

```

### <a id="tagSample_Location" href="#tagSample_Location">const tagSample_Location</a>

```
searchKey: pprof.tagSample_Location
tags: [constant number private]
```

```Go
const tagSample_Location = 1 // repeated uint64

```

message Sample 

### <a id="tagSample_Value" href="#tagSample_Value">const tagSample_Value</a>

```
searchKey: pprof.tagSample_Value
tags: [constant number private]
```

```Go
const tagSample_Value = 2 // repeated int64

```

### <a id="tagValueType_Type" href="#tagValueType_Type">const tagValueType_Type</a>

```
searchKey: pprof.tagValueType_Type
tags: [constant number private]
```

```Go
const tagValueType_Type = 1 // int64 (string table index)

```

message ValueType 

### <a id="tagValueType_Unit" href="#tagValueType_Unit">const tagValueType_Unit</a>

```
searchKey: pprof.tagValueType_Unit
tags: [constant number private]
```

```Go
const tagValueType_Unit = 2 // int64 (string table index)

```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="allocsProfile" href="#allocsProfile">var allocsProfile</a>

```
searchKey: pprof.allocsProfile
tags: [variable struct private]
```

```Go
var allocsProfile = &Profile{
	name:  "allocs",
	count: countHeap,
	write: writeAlloc,
}
```

### <a id="blockProfile" href="#blockProfile">var blockProfile</a>

```
searchKey: pprof.blockProfile
tags: [variable struct private]
```

```Go
var blockProfile = &Profile{
	name:  "block",
	count: countBlock,
	write: writeBlock,
}
```

### <a id="cpu" href="#cpu">var cpu</a>

```
searchKey: pprof.cpu
tags: [variable struct private]
```

```Go
var cpu struct {
	sync.Mutex
	profiling bool
	done      chan bool
}
```

### <a id="emptyCallStackTestRun" href="#emptyCallStackTestRun">var emptyCallStackTestRun</a>

```
searchKey: pprof.emptyCallStackTestRun
tags: [variable number private]
```

```Go
var emptyCallStackTestRun int64
```

### <a id="errBadELF" href="#errBadELF">var errBadELF</a>

```
searchKey: pprof.errBadELF
tags: [variable interface private]
```

```Go
var errBadELF = errors.New("malformed ELF binary")
```

### <a id="errNoBuildID" href="#errNoBuildID">var errNoBuildID</a>

```
searchKey: pprof.errNoBuildID
tags: [variable interface private]
```

```Go
var errNoBuildID = errors.New("no NT_GNU_BUILD_ID found in ELF binary")
```

### <a id="goroutineProfile" href="#goroutineProfile">var goroutineProfile</a>

```
searchKey: pprof.goroutineProfile
tags: [variable struct private]
```

```Go
var goroutineProfile = ...
```

### <a id="heapProfile" href="#heapProfile">var heapProfile</a>

```
searchKey: pprof.heapProfile
tags: [variable struct private]
```

```Go
var heapProfile = &Profile{
	name:  "heap",
	count: countHeap,
	write: writeHeap,
}
```

### <a id="memSink" href="#memSink">var memSink</a>

```
searchKey: pprof.memSink
tags: [variable interface private]
```

```Go
var memSink interface{}
```

### <a id="memoryProfilerRun" href="#memoryProfilerRun">var memoryProfilerRun</a>

```
searchKey: pprof.memoryProfilerRun
tags: [variable number private]
```

```Go
var memoryProfilerRun = 0
```

### <a id="mutexProfile" href="#mutexProfile">var mutexProfile</a>

```
searchKey: pprof.mutexProfile
tags: [variable struct private]
```

```Go
var mutexProfile = &Profile{
	name:  "mutex",
	count: countMutex,
	write: writeMutex,
}
```

### <a id="persistentMemSink" href="#persistentMemSink">var persistentMemSink</a>

```
searchKey: pprof.persistentMemSink
tags: [variable struct private]
```

```Go
var persistentMemSink *Obj32
```

### <a id="profSelfMapsTests" href="#profSelfMapsTests">var profSelfMapsTests</a>

```
searchKey: pprof.profSelfMapsTests
tags: [variable string private]
```

```Go
var profSelfMapsTests = ...
```

### <a id="profSelfMapsTestsWithDeleted" href="#profSelfMapsTestsWithDeleted">var profSelfMapsTestsWithDeleted</a>

```
searchKey: pprof.profSelfMapsTestsWithDeleted
tags: [variable string private]
```

```Go
var profSelfMapsTestsWithDeleted = ...
```

### <a id="profiles" href="#profiles">var profiles</a>

```
searchKey: pprof.profiles
tags: [variable struct private]
```

```Go
var profiles struct {
	mu sync.Mutex
	m  map[string]*Profile
}
```

profiles records all registered profiles. 

### <a id="salt1" href="#salt1">var salt1</a>

```
searchKey: pprof.salt1
tags: [variable number private]
```

```Go
var salt1 = 0
```

### <a id="salt2" href="#salt2">var salt2</a>

```
searchKey: pprof.salt2
tags: [variable number private]
```

```Go
var salt2 = 0
```

### <a id="threadcreateProfile" href="#threadcreateProfile">var threadcreateProfile</a>

```
searchKey: pprof.threadcreateProfile
tags: [variable struct private]
```

```Go
var threadcreateProfile = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="LabelSet" href="#LabelSet">type LabelSet struct</a>

```
searchKey: pprof.LabelSet
tags: [struct]
```

```Go
type LabelSet struct {
	list []label
}
```

LabelSet is a set of labels. 

#### <a id="Labels" href="#Labels">func Labels(args ...string) LabelSet</a>

```
searchKey: pprof.Labels
tags: [method]
```

```Go
func Labels(args ...string) LabelSet
```

Labels takes an even number of strings representing key-value pairs and makes a LabelSet containing them. A label overwrites a prior label with the same key. Currently only the CPU and goroutine profiles utilize any labels information. See [https://golang.org/issue/23458](https://golang.org/issue/23458) for details. 

### <a id="Obj32" href="#Obj32">type Obj32 struct</a>

```
searchKey: pprof.Obj32
tags: [struct private]
```

```Go
type Obj32 struct {
	link *Obj32
	pad  [32 - unsafe.Sizeof(uintptr(0))]byte
}
```

### <a id="Profile" href="#Profile">type Profile struct</a>

```
searchKey: pprof.Profile
tags: [struct]
```

```Go
type Profile struct {
	name  string
	mu    sync.Mutex
	m     map[interface{}][]uintptr
	count func() int
	write func(io.Writer, int) error
}
```

A Profile is a collection of stack traces showing the call sequences that led to instances of a particular event, such as allocation. Packages can create and maintain their own profiles; the most common use is for tracking resources that must be explicitly closed, such as files or network connections. 

A Profile's methods can be called from multiple goroutines simultaneously. 

Each Profile has a unique name. A few profiles are predefined: 

```
goroutine    - stack traces of all current goroutines
heap         - a sampling of memory allocations of live objects
allocs       - a sampling of all past memory allocations
threadcreate - stack traces that led to the creation of new OS threads
block        - stack traces that led to blocking on synchronization primitives
mutex        - stack traces of holders of contended mutexes

```
These predefined profiles maintain themselves and panic on an explicit Add or Remove method call. 

The heap profile reports statistics as of the most recently completed garbage collection; it elides more recent allocation to avoid skewing the profile away from live data and toward garbage. If there has been no garbage collection at all, the heap profile reports all known allocations. This exception helps mainly in programs running without garbage collection enabled, usually for debugging purposes. 

The heap profile tracks both the allocation sites for all live objects in the application memory and for all objects allocated since the program start. Pprof's -inuse_space, -inuse_objects, -alloc_space, and -alloc_objects flags select which to display, defaulting to -inuse_space (live objects, scaled by size). 

The allocs profile is the same as the heap profile but changes the default pprof display to -alloc_space, the total number of bytes allocated since the program began (including garbage-collected bytes). 

The CPU profile is not available as a Profile. It has a special API, the StartCPUProfile and StopCPUProfile functions, because it streams output to a writer during profiling. 

#### <a id="Lookup" href="#Lookup">func Lookup(name string) *Profile</a>

```
searchKey: pprof.Lookup
tags: [method]
```

```Go
func Lookup(name string) *Profile
```

Lookup returns the profile with the given name, or nil if no such profile exists. 

#### <a id="NewProfile" href="#NewProfile">func NewProfile(name string) *Profile</a>

```
searchKey: pprof.NewProfile
tags: [method]
```

```Go
func NewProfile(name string) *Profile
```

NewProfile creates a new profile with the given name. If a profile with that name already exists, NewProfile panics. The convention is to use a 'import/path.' prefix to create separate name spaces for each package. For compatibility with various tools that read pprof data, profile names should not contain spaces. 

#### <a id="Profile.Add" href="#Profile.Add">func (p *Profile) Add(value interface{}, skip int)</a>

```
searchKey: pprof.Profile.Add
tags: [method]
```

```Go
func (p *Profile) Add(value interface{}, skip int)
```

Add adds the current execution stack to the profile, associated with value. Add stores value in an internal map, so value must be suitable for use as a map key and will not be garbage collected until the corresponding call to Remove. Add panics if the profile already contains a stack for value. 

The skip parameter has the same meaning as runtime.Caller's skip and controls where the stack trace begins. Passing skip=0 begins the trace in the function calling Add. For example, given this execution stack: 

```
Add
called from rpc.NewClient
called from mypkg.Run
called from main.main

```
Passing skip=0 begins the stack trace at the call to Add inside rpc.NewClient. Passing skip=1 begins the stack trace at the call to NewClient inside mypkg.Run. 

#### <a id="Profile.Count" href="#Profile.Count">func (p *Profile) Count() int</a>

```
searchKey: pprof.Profile.Count
tags: [function]
```

```Go
func (p *Profile) Count() int
```

Count returns the number of execution stacks currently in the profile. 

#### <a id="Profile.Name" href="#Profile.Name">func (p *Profile) Name() string</a>

```
searchKey: pprof.Profile.Name
tags: [function]
```

```Go
func (p *Profile) Name() string
```

Name returns this profile's name, which can be passed to Lookup to reobtain the profile. 

#### <a id="Profile.Remove" href="#Profile.Remove">func (p *Profile) Remove(value interface{})</a>

```
searchKey: pprof.Profile.Remove
tags: [method]
```

```Go
func (p *Profile) Remove(value interface{})
```

Remove removes the execution stack associated with value from the profile. It is a no-op if the value is not in the profile. 

#### <a id="Profile.WriteTo" href="#Profile.WriteTo">func (p *Profile) WriteTo(w io.Writer, debug int) error</a>

```
searchKey: pprof.Profile.WriteTo
tags: [method]
```

```Go
func (p *Profile) WriteTo(w io.Writer, debug int) error
```

WriteTo writes a pprof-formatted snapshot of the profile to w. If a write to w returns an error, WriteTo returns that error. Otherwise, WriteTo returns nil. 

The debug parameter enables additional output. Passing debug=0 writes the gzip-compressed protocol buffer described in [https://github.com/google/pprof/tree/master/proto#overview](https://github.com/google/pprof/tree/master/proto#overview). Passing debug=1 writes the legacy text format with comments translating addresses to function names and line numbers, so that a programmer can read the profile without tools. 

The predefined profiles may assign meaning to other debug values; for example, when printing the "goroutine" profile, debug=2 means to print the goroutine stacks in the same form that a Go program uses when dying due to an unrecovered panic. 

### <a id="countProfile" href="#countProfile">type countProfile interface</a>

```
searchKey: pprof.countProfile
tags: [interface private]
```

```Go
type countProfile interface {
	Len() int
	Stack(i int) []uintptr
	Label(i int) *labelMap
}
```

A countProfile is a set of stack traces to be printed as counts grouped by stack trace. There are multiple implementations: all that matters is that we can find out how many traces there are and obtain each trace in turn. 

### <a id="keysByCount" href="#keysByCount">type keysByCount struct</a>

```
searchKey: pprof.keysByCount
tags: [struct private]
```

```Go
type keysByCount struct {
	keys  []string
	count map[string]int
}
```

keysByCount sorts keys with higher counts first, breaking ties by key string order. 

#### <a id="keysByCount.Len" href="#keysByCount.Len">func (x *keysByCount) Len() int</a>

```
searchKey: pprof.keysByCount.Len
tags: [function private]
```

```Go
func (x *keysByCount) Len() int
```

#### <a id="keysByCount.Less" href="#keysByCount.Less">func (x *keysByCount) Less(i, j int) bool</a>

```
searchKey: pprof.keysByCount.Less
tags: [method private]
```

```Go
func (x *keysByCount) Less(i, j int) bool
```

#### <a id="keysByCount.Swap" href="#keysByCount.Swap">func (x *keysByCount) Swap(i, j int)</a>

```
searchKey: pprof.keysByCount.Swap
tags: [method private]
```

```Go
func (x *keysByCount) Swap(i, j int)
```

### <a id="label" href="#label">type label struct</a>

```
searchKey: pprof.label
tags: [struct private]
```

```Go
type label struct {
	key   string
	value string
}
```

### <a id="labelContextKey" href="#labelContextKey">type labelContextKey struct{}</a>

```
searchKey: pprof.labelContextKey
tags: [struct private]
```

```Go
type labelContextKey struct{}
```

labelContextKey is the type of contextKeys used for profiler labels. 

### <a id="labelMap" href="#labelMap">type labelMap map[string]string</a>

```
searchKey: pprof.labelMap
tags: [object private]
```

```Go
type labelMap map[string]string
```

labelMap is the representation of the label set held in the context type. This is an initial implementation, but it will be replaced with something that admits incremental immutable modification more efficiently. 

#### <a id="labelValue" href="#labelValue">func labelValue(ctx context.Context) labelMap</a>

```
searchKey: pprof.labelValue
tags: [method private]
```

```Go
func labelValue(ctx context.Context) labelMap
```

#### <a id="labelMap.String" href="#labelMap.String">func (l *labelMap) String() string</a>

```
searchKey: pprof.labelMap.String
tags: [function private]
```

```Go
func (l *labelMap) String() string
```

String statisfies Stringer and returns key, value pairs in a consistent order. 

### <a id="labelSorter" href="#labelSorter">type labelSorter []pprof.label</a>

```
searchKey: pprof.labelSorter
tags: [array struct private]
```

```Go
type labelSorter []label
```

#### <a id="labelSorter.Len" href="#labelSorter.Len">func (s labelSorter) Len() int</a>

```
searchKey: pprof.labelSorter.Len
tags: [function private]
```

```Go
func (s labelSorter) Len() int
```

#### <a id="labelSorter.Less" href="#labelSorter.Less">func (s labelSorter) Less(i, j int) bool</a>

```
searchKey: pprof.labelSorter.Less
tags: [method private]
```

```Go
func (s labelSorter) Less(i, j int) bool
```

#### <a id="labelSorter.Swap" href="#labelSorter.Swap">func (s labelSorter) Swap(i, j int)</a>

```
searchKey: pprof.labelSorter.Swap
tags: [method private]
```

```Go
func (s labelSorter) Swap(i, j int)
```

### <a id="locInfo" href="#locInfo">type locInfo struct</a>

```
searchKey: pprof.locInfo
tags: [struct private]
```

```Go
type locInfo struct {
	// location id assigned by the profileBuilder
	id uint64

	// sequence of PCs, including the fake PCs returned by the traceback
	// to represent inlined functions
	// https://github.com/golang/go/blob/d6f2f833c93a41ec1c68e49804b8387a06b131c5/src/runtime/traceback.go#L347-L368
	pcs []uintptr
}
```

### <a id="matchFunc" href="#matchFunc">type matchFunc func(spec string, count uintptr, stk []*internal/profile.Location, labels map[string][]string) bool</a>

```
searchKey: pprof.matchFunc
tags: [function private]
```

```Go
type matchFunc func(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool
```

### <a id="memMap" href="#memMap">type memMap struct</a>

```
searchKey: pprof.memMap
tags: [struct private]
```

```Go
type memMap struct {
	// initialized as reading mapping
	start         uintptr
	end           uintptr
	offset        uint64
	file, buildID string

	funcs symbolizeFlag
	fake  bool // map entry was faked; /proc/self/maps wasn't available
}
```

### <a id="msgOffset" href="#msgOffset">type msgOffset int</a>

```
searchKey: pprof.msgOffset
tags: [number private]
```

```Go
type msgOffset int
```

### <a id="pcDeck" href="#pcDeck">type pcDeck struct</a>

```
searchKey: pprof.pcDeck
tags: [struct private]
```

```Go
type pcDeck struct {
	pcs             []uintptr
	frames          []runtime.Frame
	symbolizeResult symbolizeFlag
}
```

pcDeck is a helper to detect a sequence of inlined functions from a stack trace returned by the runtime. 

The stack traces returned by runtime's trackback functions are fully expanded (at least for Go functions) and include the fake pcs representing inlined functions. The profile proto expects the inlined functions to be encoded in one Location message. [https://github.com/google/pprof/blob/5e965273ee43930341d897407202dd5e10e952cb/proto/profile.proto#L177-L184](https://github.com/google/pprof/blob/5e965273ee43930341d897407202dd5e10e952cb/proto/profile.proto#L177-L184) 

Runtime does not directly expose whether a frame is for an inlined function and looking up debug info is not ideal, so we use a heuristic to filter the fake pcs and restore the inlined and entry functions. Inlined functions have the following properties: 

```
Frame's Func is nil (note: also true for non-Go functions), and
Frame's Entry matches its entry function frame's Entry (note: could also be true for recursive calls and non-Go functions), and
Frame's Name does not match its entry function frame's name (note: inlined functions cannot be directly recursive).

```
As reading and processing the pcs in a stack trace one by one (from leaf to the root), we use pcDeck to temporarily hold the observed pcs and their expanded frames until we observe the entry function frame. 

#### <a id="pcDeck.reset" href="#pcDeck.reset">func (d *pcDeck) reset()</a>

```
searchKey: pprof.pcDeck.reset
tags: [function private]
```

```Go
func (d *pcDeck) reset()
```

#### <a id="pcDeck.tryAdd" href="#pcDeck.tryAdd">func (d *pcDeck) tryAdd(pc uintptr, frames []runtime.Frame, symbolizeResult symbolizeFlag) (success bool)</a>

```
searchKey: pprof.pcDeck.tryAdd
tags: [method private]
```

```Go
func (d *pcDeck) tryAdd(pc uintptr, frames []runtime.Frame, symbolizeResult symbolizeFlag) (success bool)
```

tryAdd tries to add the pc and Frames expanded from it (most likely one, since the stack trace is already fully expanded) and the symbolizeResult to the deck. If it fails the caller needs to flush the deck and retry. 

### <a id="profMap" href="#profMap">type profMap struct</a>

```
searchKey: pprof.profMap
tags: [struct private]
```

```Go
type profMap struct {
	hash    map[uintptr]*profMapEntry
	all     *profMapEntry
	last    *profMapEntry
	free    []profMapEntry
	freeStk []uintptr
}
```

A profMap is a map from (stack, tag) to mapEntry. It grows without bound, but that's assumed to be OK. 

#### <a id="profMap.lookup" href="#profMap.lookup">func (m *profMap) lookup(stk []uint64, tag unsafe.Pointer) *profMapEntry</a>

```
searchKey: pprof.profMap.lookup
tags: [method private]
```

```Go
func (m *profMap) lookup(stk []uint64, tag unsafe.Pointer) *profMapEntry
```

### <a id="profMapEntry" href="#profMapEntry">type profMapEntry struct</a>

```
searchKey: pprof.profMapEntry
tags: [struct private]
```

```Go
type profMapEntry struct {
	nextHash *profMapEntry // next in hash list
	nextAll  *profMapEntry // next in list of all entries
	stk      []uintptr
	tag      unsafe.Pointer
	count    int64
}
```

A profMapEntry is a single entry in the profMap. 

### <a id="profileBuilder" href="#profileBuilder">type profileBuilder struct</a>

```
searchKey: pprof.profileBuilder
tags: [struct private]
```

```Go
type profileBuilder struct {
	start      time.Time
	end        time.Time
	havePeriod bool
	period     int64
	m          profMap

	// encoding state
	w         io.Writer
	zw        *gzip.Writer
	pb        protobuf
	strings   []string
	stringMap map[string]int
	locs      map[uintptr]locInfo // list of locInfo starting with the given PC.
	funcs     map[string]int      // Package path-qualified function name to Function.ID
	mem       []memMap
	deck      pcDeck
}
```

A profileBuilder writes a profile incrementally from a stream of profile samples delivered by the runtime. 

#### <a id="newProfileBuilder" href="#newProfileBuilder">func newProfileBuilder(w io.Writer) *profileBuilder</a>

```
searchKey: pprof.newProfileBuilder
tags: [method private]
```

```Go
func newProfileBuilder(w io.Writer) *profileBuilder
```

newProfileBuilder returns a new profileBuilder. CPU profiling data obtained from the runtime can be added by calling b.addCPUData, and then the eventual profile can be obtained by calling b.finish. 

#### <a id="profileBuilder.addCPUData" href="#profileBuilder.addCPUData">func (b *profileBuilder) addCPUData(data []uint64, tags []unsafe.Pointer) error</a>

```
searchKey: pprof.profileBuilder.addCPUData
tags: [method private]
```

```Go
func (b *profileBuilder) addCPUData(data []uint64, tags []unsafe.Pointer) error
```

addCPUData adds the CPU profiling data to the profile. The data must be a whole number of records, as delivered by the runtime. 

#### <a id="profileBuilder.addMapping" href="#profileBuilder.addMapping">func (b *profileBuilder) addMapping(lo, hi, offset uint64, file, buildID string)</a>

```
searchKey: pprof.profileBuilder.addMapping
tags: [method private]
```

```Go
func (b *profileBuilder) addMapping(lo, hi, offset uint64, file, buildID string)
```

#### <a id="profileBuilder.addMappingEntry" href="#profileBuilder.addMappingEntry">func (b *profileBuilder) addMappingEntry(lo, hi, offset uint64, file, buildID string, fake bool)</a>

```
searchKey: pprof.profileBuilder.addMappingEntry
tags: [method private]
```

```Go
func (b *profileBuilder) addMappingEntry(lo, hi, offset uint64, file, buildID string, fake bool)
```

#### <a id="profileBuilder.appendLocsForStack" href="#profileBuilder.appendLocsForStack">func (b *profileBuilder) appendLocsForStack(locs []uint64, stk []uintptr) (newLocs []uint64)</a>

```
searchKey: pprof.profileBuilder.appendLocsForStack
tags: [method private]
```

```Go
func (b *profileBuilder) appendLocsForStack(locs []uint64, stk []uintptr) (newLocs []uint64)
```

appendLocsForStack appends the location IDs for the given stack trace to the given location ID slice, locs. The addresses in the stack are return PCs or 1 + the PC of an inline marker as the runtime traceback function returns. 

It may emit to b.pb, so there must be no message encoding in progress. 

#### <a id="profileBuilder.build" href="#profileBuilder.build">func (b *profileBuilder) build()</a>

```
searchKey: pprof.profileBuilder.build
tags: [function private]
```

```Go
func (b *profileBuilder) build()
```

build completes and returns the constructed profile. 

#### <a id="profileBuilder.emitLocation" href="#profileBuilder.emitLocation">func (b *profileBuilder) emitLocation() uint64</a>

```
searchKey: pprof.profileBuilder.emitLocation
tags: [function private]
```

```Go
func (b *profileBuilder) emitLocation() uint64
```

emitLocation emits the new location and function information recorded in the deck and returns the location ID encoded in the profile protobuf. It emits to b.pb, so there must be no message encoding in progress. It resets the deck. 

#### <a id="profileBuilder.flush" href="#profileBuilder.flush">func (b *profileBuilder) flush()</a>

```
searchKey: pprof.profileBuilder.flush
tags: [function private]
```

```Go
func (b *profileBuilder) flush()
```

#### <a id="profileBuilder.pbLabel" href="#profileBuilder.pbLabel">func (b *profileBuilder) pbLabel(tag int, key, str string, num int64)</a>

```
searchKey: pprof.profileBuilder.pbLabel
tags: [method private]
```

```Go
func (b *profileBuilder) pbLabel(tag int, key, str string, num int64)
```

pbLabel encodes a Label message to b.pb. 

#### <a id="profileBuilder.pbLine" href="#profileBuilder.pbLine">func (b *profileBuilder) pbLine(tag int, funcID uint64, line int64)</a>

```
searchKey: pprof.profileBuilder.pbLine
tags: [method private]
```

```Go
func (b *profileBuilder) pbLine(tag int, funcID uint64, line int64)
```

pbLine encodes a Line message to b.pb. 

#### <a id="profileBuilder.pbMapping" href="#profileBuilder.pbMapping">func (b *profileBuilder) pbMapping(tag int, id, base, limit, offset uint64, file, buildID string, hasFuncs bool)</a>

```
searchKey: pprof.profileBuilder.pbMapping
tags: [method private]
```

```Go
func (b *profileBuilder) pbMapping(tag int, id, base, limit, offset uint64, file, buildID string, hasFuncs bool)
```

pbMapping encodes a Mapping message to b.pb. 

#### <a id="profileBuilder.pbSample" href="#profileBuilder.pbSample">func (b *profileBuilder) pbSample(values []int64, locs []uint64, labels func())</a>

```
searchKey: pprof.profileBuilder.pbSample
tags: [method private]
```

```Go
func (b *profileBuilder) pbSample(values []int64, locs []uint64, labels func())
```

pbSample encodes a Sample message to b.pb. 

#### <a id="profileBuilder.pbValueType" href="#profileBuilder.pbValueType">func (b *profileBuilder) pbValueType(tag int, typ, unit string)</a>

```
searchKey: pprof.profileBuilder.pbValueType
tags: [method private]
```

```Go
func (b *profileBuilder) pbValueType(tag int, typ, unit string)
```

pbValueType encodes a ValueType message to b.pb. 

#### <a id="profileBuilder.readMapping" href="#profileBuilder.readMapping">func (b *profileBuilder) readMapping()</a>

```
searchKey: pprof.profileBuilder.readMapping
tags: [function private]
```

```Go
func (b *profileBuilder) readMapping()
```

readMapping reads /proc/self/maps and writes mappings to b.pb. It saves the address ranges of the mappings in b.mem for use when emitting locations. 

#### <a id="profileBuilder.stringIndex" href="#profileBuilder.stringIndex">func (b *profileBuilder) stringIndex(s string) int64</a>

```
searchKey: pprof.profileBuilder.stringIndex
tags: [method private]
```

```Go
func (b *profileBuilder) stringIndex(s string) int64
```

stringIndex adds s to the string table if not already present and returns the index of s in the string table. 

### <a id="protobuf" href="#protobuf">type protobuf struct</a>

```
searchKey: pprof.protobuf
tags: [struct private]
```

```Go
type protobuf struct {
	data []byte
	tmp  [16]byte
	nest int
}
```

A protobuf is a simple protocol buffer encoder. 

#### <a id="protobuf.bool" href="#protobuf.bool">func (b *protobuf) bool(tag int, x bool)</a>

```
searchKey: pprof.protobuf.bool
tags: [method private]
```

```Go
func (b *protobuf) bool(tag int, x bool)
```

#### <a id="protobuf.boolOpt" href="#protobuf.boolOpt">func (b *protobuf) boolOpt(tag int, x bool)</a>

```
searchKey: pprof.protobuf.boolOpt
tags: [method private]
```

```Go
func (b *protobuf) boolOpt(tag int, x bool)
```

#### <a id="protobuf.endMessage" href="#protobuf.endMessage">func (b *protobuf) endMessage(tag int, start msgOffset)</a>

```
searchKey: pprof.protobuf.endMessage
tags: [method private]
```

```Go
func (b *protobuf) endMessage(tag int, start msgOffset)
```

#### <a id="protobuf.int64" href="#protobuf.int64">func (b *protobuf) int64(tag int, x int64)</a>

```
searchKey: pprof.protobuf.int64
tags: [method private]
```

```Go
func (b *protobuf) int64(tag int, x int64)
```

#### <a id="protobuf.int64Opt" href="#protobuf.int64Opt">func (b *protobuf) int64Opt(tag int, x int64)</a>

```
searchKey: pprof.protobuf.int64Opt
tags: [method private]
```

```Go
func (b *protobuf) int64Opt(tag int, x int64)
```

#### <a id="protobuf.int64s" href="#protobuf.int64s">func (b *protobuf) int64s(tag int, x []int64)</a>

```
searchKey: pprof.protobuf.int64s
tags: [method private]
```

```Go
func (b *protobuf) int64s(tag int, x []int64)
```

#### <a id="protobuf.length" href="#protobuf.length">func (b *protobuf) length(tag int, len int)</a>

```
searchKey: pprof.protobuf.length
tags: [method private]
```

```Go
func (b *protobuf) length(tag int, len int)
```

#### <a id="protobuf.startMessage" href="#protobuf.startMessage">func (b *protobuf) startMessage() msgOffset</a>

```
searchKey: pprof.protobuf.startMessage
tags: [function private]
```

```Go
func (b *protobuf) startMessage() msgOffset
```

#### <a id="protobuf.string" href="#protobuf.string">func (b *protobuf) string(tag int, x string)</a>

```
searchKey: pprof.protobuf.string
tags: [method private]
```

```Go
func (b *protobuf) string(tag int, x string)
```

#### <a id="protobuf.stringOpt" href="#protobuf.stringOpt">func (b *protobuf) stringOpt(tag int, x string)</a>

```
searchKey: pprof.protobuf.stringOpt
tags: [method private]
```

```Go
func (b *protobuf) stringOpt(tag int, x string)
```

#### <a id="protobuf.strings" href="#protobuf.strings">func (b *protobuf) strings(tag int, x []string)</a>

```
searchKey: pprof.protobuf.strings
tags: [method private]
```

```Go
func (b *protobuf) strings(tag int, x []string)
```

#### <a id="protobuf.uint64" href="#protobuf.uint64">func (b *protobuf) uint64(tag int, x uint64)</a>

```
searchKey: pprof.protobuf.uint64
tags: [method private]
```

```Go
func (b *protobuf) uint64(tag int, x uint64)
```

#### <a id="protobuf.uint64Opt" href="#protobuf.uint64Opt">func (b *protobuf) uint64Opt(tag int, x uint64)</a>

```
searchKey: pprof.protobuf.uint64Opt
tags: [method private]
```

```Go
func (b *protobuf) uint64Opt(tag int, x uint64)
```

#### <a id="protobuf.uint64s" href="#protobuf.uint64s">func (b *protobuf) uint64s(tag int, x []uint64)</a>

```
searchKey: pprof.protobuf.uint64s
tags: [method private]
```

```Go
func (b *protobuf) uint64s(tag int, x []uint64)
```

#### <a id="protobuf.varint" href="#protobuf.varint">func (b *protobuf) varint(x uint64)</a>

```
searchKey: pprof.protobuf.varint
tags: [method private]
```

```Go
func (b *protobuf) varint(x uint64)
```

### <a id="runtimeProfile" href="#runtimeProfile">type runtimeProfile struct</a>

```
searchKey: pprof.runtimeProfile
tags: [struct private]
```

```Go
type runtimeProfile struct {
	stk    []runtime.StackRecord
	labels []unsafe.Pointer
}
```

#### <a id="runtimeProfile.Label" href="#runtimeProfile.Label">func (p *runtimeProfile) Label(i int) *labelMap</a>

```
searchKey: pprof.runtimeProfile.Label
tags: [method private]
```

```Go
func (p *runtimeProfile) Label(i int) *labelMap
```

#### <a id="runtimeProfile.Len" href="#runtimeProfile.Len">func (p *runtimeProfile) Len() int</a>

```
searchKey: pprof.runtimeProfile.Len
tags: [function private]
```

```Go
func (p *runtimeProfile) Len() int
```

#### <a id="runtimeProfile.Stack" href="#runtimeProfile.Stack">func (p *runtimeProfile) Stack(i int) []uintptr</a>

```
searchKey: pprof.runtimeProfile.Stack
tags: [method private]
```

```Go
func (p *runtimeProfile) Stack(i int) []uintptr
```

### <a id="stackProfile" href="#stackProfile">type stackProfile [][]uintptr</a>

```
searchKey: pprof.stackProfile
tags: [array array number private]
```

```Go
type stackProfile [][]uintptr
```

#### <a id="stackProfile.Label" href="#stackProfile.Label">func (x stackProfile) Label(i int) *labelMap</a>

```
searchKey: pprof.stackProfile.Label
tags: [method private]
```

```Go
func (x stackProfile) Label(i int) *labelMap
```

#### <a id="stackProfile.Len" href="#stackProfile.Len">func (x stackProfile) Len() int</a>

```
searchKey: pprof.stackProfile.Len
tags: [function private]
```

```Go
func (x stackProfile) Len() int
```

#### <a id="stackProfile.Stack" href="#stackProfile.Stack">func (x stackProfile) Stack(i int) []uintptr</a>

```
searchKey: pprof.stackProfile.Stack
tags: [method private]
```

```Go
func (x stackProfile) Stack(i int) []uintptr
```

### <a id="symbolizeFlag" href="#symbolizeFlag">type symbolizeFlag uint8</a>

```
searchKey: pprof.symbolizeFlag
tags: [number private]
```

```Go
type symbolizeFlag uint8
```

symbolizeFlag keeps track of symbolization result. 

```
0                  : no symbol lookup was performed
1<<0 (lookupTried) : symbol lookup was performed
1<<1 (lookupFailed): symbol lookup was performed but failed

```
#### <a id="allFrames" href="#allFrames">func allFrames(addr uintptr) ([]runtime.Frame, symbolizeFlag)</a>

```
searchKey: pprof.allFrames
tags: [method private]
```

```Go
func allFrames(addr uintptr) ([]runtime.Frame, symbolizeFlag)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="Do" href="#Do">func Do(ctx context.Context, labels LabelSet, f func(context.Context))</a>

```
searchKey: pprof.Do
tags: [method]
```

```Go
func Do(ctx context.Context, labels LabelSet, f func(context.Context))
```

Do calls f with a copy of the parent context with the given labels added to the parent's label map. Goroutines spawned while executing f will inherit the augmented label-set. Each key/value pair in labels is inserted into the label map in the order provided, overriding any previous value for the same key. The augmented label map will be set for the duration of the call to f and restored once f returns. 

### <a id="ForLabels" href="#ForLabels">func ForLabels(ctx context.Context, f func(key, value string) bool)</a>

```
searchKey: pprof.ForLabels
tags: [method]
```

```Go
func ForLabels(ctx context.Context, f func(key, value string) bool)
```

ForLabels invokes f with each label set on the context. The function f should return true to continue iteration or false to stop iteration early. 

### <a id="Label" href="#Label">func Label(ctx context.Context, key string) (string, bool)</a>

```
searchKey: pprof.Label
tags: [method]
```

```Go
func Label(ctx context.Context, key string) (string, bool)
```

Label returns the value of the label with the given key on ctx, and a boolean indicating whether that label exists. 

### <a id="Profiles" href="#Profiles">func Profiles() []*Profile</a>

```
searchKey: pprof.Profiles
tags: [function]
```

```Go
func Profiles() []*Profile
```

Profiles returns a slice of all the known profiles, sorted by name. 

### <a id="SetGoroutineLabels" href="#SetGoroutineLabels">func SetGoroutineLabels(ctx context.Context)</a>

```
searchKey: pprof.SetGoroutineLabels
tags: [method]
```

```Go
func SetGoroutineLabels(ctx context.Context)
```

SetGoroutineLabels sets the current goroutine's labels to match ctx. A new goroutine inherits the labels of the goroutine that created it. This is a lower-level API than Do, which should be used instead when possible. 

### <a id="StartCPUProfile" href="#StartCPUProfile">func StartCPUProfile(w io.Writer) error</a>

```
searchKey: pprof.StartCPUProfile
tags: [method]
```

```Go
func StartCPUProfile(w io.Writer) error
```

StartCPUProfile enables CPU profiling for the current process. While profiling, the profile will be buffered and written to w. StartCPUProfile returns an error if profiling is already enabled. 

On Unix-like systems, StartCPUProfile does not work by default for Go code built with -buildmode=c-archive or -buildmode=c-shared. StartCPUProfile relies on the SIGPROF signal, but that signal will be delivered to the main program's SIGPROF signal handler (if any) not to the one used by Go. To make it work, call os/signal.Notify for syscall.SIGPROF, but note that doing so may break any profiling being done by the main program. 

### <a id="StopCPUProfile" href="#StopCPUProfile">func StopCPUProfile()</a>

```
searchKey: pprof.StopCPUProfile
tags: [function]
```

```Go
func StopCPUProfile()
```

StopCPUProfile stops the current CPU profile, if any. StopCPUProfile only returns after all the writes for the profile have completed. 

### <a id="TestAtomicLoadStore64" href="#TestAtomicLoadStore64">func TestAtomicLoadStore64(t *testing.T)</a>

```
searchKey: pprof.TestAtomicLoadStore64
tags: [method private test]
```

```Go
func TestAtomicLoadStore64(t *testing.T)
```

Check that there is no deadlock when the program receives SIGPROF while in 64bit atomics' critical section. Used to happen on mips{,le}. See #20146. 

### <a id="TestBlockProfile" href="#TestBlockProfile">func TestBlockProfile(t *testing.T)</a>

```
searchKey: pprof.TestBlockProfile
tags: [method private test]
```

```Go
func TestBlockProfile(t *testing.T)
```

### <a id="TestBlockProfileBias" href="#TestBlockProfileBias">func TestBlockProfileBias(t *testing.T)</a>

```
searchKey: pprof.TestBlockProfileBias
tags: [method private test]
```

```Go
func TestBlockProfileBias(t *testing.T)
```

See [http://golang.org/cl/299991](http://golang.org/cl/299991). 

### <a id="TestCPUProfile" href="#TestCPUProfile">func TestCPUProfile(t *testing.T)</a>

```
searchKey: pprof.TestCPUProfile
tags: [method private test]
```

```Go
func TestCPUProfile(t *testing.T)
```

### <a id="TestCPUProfileInlining" href="#TestCPUProfileInlining">func TestCPUProfileInlining(t *testing.T)</a>

```
searchKey: pprof.TestCPUProfileInlining
tags: [method private test]
```

```Go
func TestCPUProfileInlining(t *testing.T)
```

### <a id="TestCPUProfileLabel" href="#TestCPUProfileLabel">func TestCPUProfileLabel(t *testing.T)</a>

```
searchKey: pprof.TestCPUProfileLabel
tags: [method private test]
```

```Go
func TestCPUProfileLabel(t *testing.T)
```

### <a id="TestCPUProfileMultithreaded" href="#TestCPUProfileMultithreaded">func TestCPUProfileMultithreaded(t *testing.T)</a>

```
searchKey: pprof.TestCPUProfileMultithreaded
tags: [method private test]
```

```Go
func TestCPUProfileMultithreaded(t *testing.T)
```

### <a id="TestCPUProfileRecursion" href="#TestCPUProfileRecursion">func TestCPUProfileRecursion(t *testing.T)</a>

```
searchKey: pprof.TestCPUProfileRecursion
tags: [method private test]
```

```Go
func TestCPUProfileRecursion(t *testing.T)
```

### <a id="TestCPUProfileWithFork" href="#TestCPUProfileWithFork">func TestCPUProfileWithFork(t *testing.T)</a>

```
searchKey: pprof.TestCPUProfileWithFork
tags: [method private test]
```

```Go
func TestCPUProfileWithFork(t *testing.T)
```

Fork can hang if preempted with signals frequently enough (see issue 5517). Ensure that we do not do this. 

### <a id="TestContextLabels" href="#TestContextLabels">func TestContextLabels(t *testing.T)</a>

```
searchKey: pprof.TestContextLabels
tags: [method private test]
```

```Go
func TestContextLabels(t *testing.T)
```

### <a id="TestConvertCPUProfile" href="#TestConvertCPUProfile">func TestConvertCPUProfile(t *testing.T)</a>

```
searchKey: pprof.TestConvertCPUProfile
tags: [method private test]
```

```Go
func TestConvertCPUProfile(t *testing.T)
```

### <a id="TestConvertCPUProfileEmpty" href="#TestConvertCPUProfileEmpty">func TestConvertCPUProfileEmpty(t *testing.T)</a>

```
searchKey: pprof.TestConvertCPUProfileEmpty
tags: [method private test]
```

```Go
func TestConvertCPUProfileEmpty(t *testing.T)
```

### <a id="TestConvertMemProfile" href="#TestConvertMemProfile">func TestConvertMemProfile(t *testing.T)</a>

```
searchKey: pprof.TestConvertMemProfile
tags: [method private test]
```

```Go
func TestConvertMemProfile(t *testing.T)
```

### <a id="TestDo" href="#TestDo">func TestDo(t *testing.T)</a>

```
searchKey: pprof.TestDo
tags: [method private test]
```

```Go
func TestDo(t *testing.T)
```

### <a id="TestEmptyCallStack" href="#TestEmptyCallStack">func TestEmptyCallStack(t *testing.T)</a>

```
searchKey: pprof.TestEmptyCallStack
tags: [method private test]
```

```Go
func TestEmptyCallStack(t *testing.T)
```

Issue 18836. 

### <a id="TestEmptyStack" href="#TestEmptyStack">func TestEmptyStack(t *testing.T)</a>

```
searchKey: pprof.TestEmptyStack
tags: [method private test]
```

```Go
func TestEmptyStack(t *testing.T)
```

Make sure the profiler can handle an empty stack trace. See issue 37967. 

### <a id="TestFakeMapping" href="#TestFakeMapping">func TestFakeMapping(t *testing.T)</a>

```
searchKey: pprof.TestFakeMapping
tags: [method private test]
```

```Go
func TestFakeMapping(t *testing.T)
```

TestFakeMapping tests if at least one mapping exists (including a fake mapping), and their HasFunctions bits are set correctly. 

### <a id="TestGoroutineCounts" href="#TestGoroutineCounts">func TestGoroutineCounts(t *testing.T)</a>

```
searchKey: pprof.TestGoroutineCounts
tags: [method private test]
```

```Go
func TestGoroutineCounts(t *testing.T)
```

### <a id="TestGoroutineSwitch" href="#TestGoroutineSwitch">func TestGoroutineSwitch(t *testing.T)</a>

```
searchKey: pprof.TestGoroutineSwitch
tags: [method private test]
```

```Go
func TestGoroutineSwitch(t *testing.T)
```

Test that profiler does not observe runtime.gogo as "user" goroutine execution. If it did, it would see inconsistent state and would either record an incorrect stack or crash because the stack was malformed. 

### <a id="TestLabelMapStringer" href="#TestLabelMapStringer">func TestLabelMapStringer(t *testing.T)</a>

```
searchKey: pprof.TestLabelMapStringer
tags: [method private test]
```

```Go
func TestLabelMapStringer(t *testing.T)
```

### <a id="TestLabelRace" href="#TestLabelRace">func TestLabelRace(t *testing.T)</a>

```
searchKey: pprof.TestLabelRace
tags: [method private test]
```

```Go
func TestLabelRace(t *testing.T)
```

### <a id="TestMapping" href="#TestMapping">func TestMapping(t *testing.T)</a>

```
searchKey: pprof.TestMapping
tags: [method private test]
```

```Go
func TestMapping(t *testing.T)
```

TestMapping checks the mapping section of CPU profiles has the HasFunctions field set correctly. If all PCs included in the samples are successfully symbolized, the corresponding mapping entry (in this test case, only one entry) should have its HasFunctions field set true. The test generates a CPU profile that includes PCs from C side that the runtime can't symbolize. See ./testdata/mappingtest. 

### <a id="TestMathBigDivide" href="#TestMathBigDivide">func TestMathBigDivide(t *testing.T)</a>

```
searchKey: pprof.TestMathBigDivide
tags: [method private test]
```

```Go
func TestMathBigDivide(t *testing.T)
```

Test that profiling of division operations is okay, especially on ARM. See issue 6681. 

### <a id="TestMemoryProfiler" href="#TestMemoryProfiler">func TestMemoryProfiler(t *testing.T)</a>

```
searchKey: pprof.TestMemoryProfiler
tags: [method private test]
```

```Go
func TestMemoryProfiler(t *testing.T)
```

### <a id="TestMorestack" href="#TestMorestack">func TestMorestack(t *testing.T)</a>

```
searchKey: pprof.TestMorestack
tags: [method private test]
```

```Go
func TestMorestack(t *testing.T)
```

### <a id="TestMutexProfile" href="#TestMutexProfile">func TestMutexProfile(t *testing.T)</a>

```
searchKey: pprof.TestMutexProfile
tags: [method private test]
```

```Go
func TestMutexProfile(t *testing.T)
```

### <a id="TestProcSelfMaps" href="#TestProcSelfMaps">func TestProcSelfMaps(t *testing.T)</a>

```
searchKey: pprof.TestProcSelfMaps
tags: [method private test]
```

```Go
func TestProcSelfMaps(t *testing.T)
```

### <a id="TestSetGoroutineLabels" href="#TestSetGoroutineLabels">func TestSetGoroutineLabels(t *testing.T)</a>

```
searchKey: pprof.TestSetGoroutineLabels
tags: [method private test]
```

```Go
func TestSetGoroutineLabels(t *testing.T)
```

### <a id="TestTracebackAll" href="#TestTracebackAll">func TestTracebackAll(t *testing.T)</a>

```
searchKey: pprof.TestTracebackAll
tags: [method private test]
```

```Go
func TestTracebackAll(t *testing.T)
```

### <a id="TestTryAdd" href="#TestTryAdd">func TestTryAdd(t *testing.T)</a>

```
searchKey: pprof.TestTryAdd
tags: [method private test]
```

```Go
func TestTryAdd(t *testing.T)
```

TestTryAdd tests the cases that are hard to test with real program execution. 

For example, the current go compilers may not always inline functions involved in recursion but that may not be true in the future compilers. This tests such cases by using fake call sequences and forcing the profile build utilizing translateCPUProfile defined in proto_test.go 

### <a id="WithLabels" href="#WithLabels">func WithLabels(ctx context.Context, labels LabelSet) context.Context</a>

```
searchKey: pprof.WithLabels
tags: [method]
```

```Go
func WithLabels(ctx context.Context, labels LabelSet) context.Context
```

WithLabels returns a new context.Context with the given labels added. A label overwrites a prior label with the same key. 

### <a id="WriteHeapProfile" href="#WriteHeapProfile">func WriteHeapProfile(w io.Writer) error</a>

```
searchKey: pprof.WriteHeapProfile
tags: [method]
```

```Go
func WriteHeapProfile(w io.Writer) error
```

WriteHeapProfile is shorthand for Lookup("heap").WriteTo(w, 0). It is preserved for backwards compatibility. 

### <a id="addMaxRSS" href="#addMaxRSS">func addMaxRSS(w io.Writer)</a>

```
searchKey: pprof.addMaxRSS
tags: [method private]
```

```Go
func addMaxRSS(w io.Writer)
```

Adds MaxRSS to platforms that are supported. 

### <a id="allocatePersistent1K" href="#allocatePersistent1K">func allocatePersistent1K()</a>

```
searchKey: pprof.allocatePersistent1K
tags: [function private]
```

```Go
func allocatePersistent1K()
```

### <a id="allocateReflect" href="#allocateReflect">func allocateReflect()</a>

```
searchKey: pprof.allocateReflect
tags: [function private]
```

```Go
func allocateReflect()
```

### <a id="allocateReflectTransient" href="#allocateReflectTransient">func allocateReflectTransient()</a>

```
searchKey: pprof.allocateReflectTransient
tags: [function private]
```

```Go
func allocateReflectTransient()
```

### <a id="allocateTransient1M" href="#allocateTransient1M">func allocateTransient1M()</a>

```
searchKey: pprof.allocateTransient1M
tags: [function private]
```

```Go
func allocateTransient1M()
```

### <a id="allocateTransient2M" href="#allocateTransient2M">func allocateTransient2M()</a>

```
searchKey: pprof.allocateTransient2M
tags: [function private]
```

```Go
func allocateTransient2M()
```

### <a id="allocateTransient2MInline" href="#allocateTransient2MInline">func allocateTransient2MInline()</a>

```
searchKey: pprof.allocateTransient2MInline
tags: [function private]
```

```Go
func allocateTransient2MInline()
```

### <a id="avoidFunctions" href="#avoidFunctions">func avoidFunctions() []string</a>

```
searchKey: pprof.avoidFunctions
tags: [function private]
```

```Go
func avoidFunctions() []string
```

Return a list of functions that we don't want to ever appear in CPU profiles. For gccgo, that list includes the sigprof handler itself. 

### <a id="blockChanClose" href="#blockChanClose">func blockChanClose()</a>

```
searchKey: pprof.blockChanClose
tags: [function private]
```

```Go
func blockChanClose()
```

### <a id="blockChanRecv" href="#blockChanRecv">func blockChanRecv()</a>

```
searchKey: pprof.blockChanRecv
tags: [function private]
```

```Go
func blockChanRecv()
```

### <a id="blockChanSend" href="#blockChanSend">func blockChanSend()</a>

```
searchKey: pprof.blockChanSend
tags: [function private]
```

```Go
func blockChanSend()
```

### <a id="blockCond" href="#blockCond">func blockCond()</a>

```
searchKey: pprof.blockCond
tags: [function private]
```

```Go
func blockCond()
```

### <a id="blockFrequentShort" href="#blockFrequentShort">func blockFrequentShort(rate int)</a>

```
searchKey: pprof.blockFrequentShort
tags: [method private]
```

```Go
func blockFrequentShort(rate int)
```

blockFrequentShort produces 100000 block events with an average duration of rate / 10. 

### <a id="blockInfrequentLong" href="#blockInfrequentLong">func blockInfrequentLong(rate int)</a>

```
searchKey: pprof.blockInfrequentLong
tags: [method private]
```

```Go
func blockInfrequentLong(rate int)
```

blockFrequentShort produces 10000 block events with an average duration of rate. 

### <a id="blockMutex" href="#blockMutex">func blockMutex()</a>

```
searchKey: pprof.blockMutex
tags: [function private]
```

```Go
func blockMutex()
```

### <a id="blockSelectRecvAsync" href="#blockSelectRecvAsync">func blockSelectRecvAsync()</a>

```
searchKey: pprof.blockSelectRecvAsync
tags: [function private]
```

```Go
func blockSelectRecvAsync()
```

### <a id="blockSelectSendSync" href="#blockSelectSendSync">func blockSelectSendSync()</a>

```
searchKey: pprof.blockSelectSendSync
tags: [function private]
```

```Go
func blockSelectSendSync()
```

### <a id="blockevent" href="#blockevent">func blockevent(cycles int64, skip int)</a>

```
searchKey: pprof.blockevent
tags: [method private]
```

```Go
func blockevent(cycles int64, skip int)
```

Used by TestBlockProfileBias. 

### <a id="checkProfile" href="#checkProfile">func checkProfile(t *testing.T, p *profile.Profile, period int64, periodType *profile.ValueType, sampleType []*profile.ValueType, samples []*profile.Sample, defaultSampleType string)</a>

```
searchKey: pprof.checkProfile
tags: [method private]
```

```Go
func checkProfile(t *testing.T, p *profile.Profile, period int64, periodType *profile.ValueType, sampleType []*profile.ValueType, samples []*profile.Sample, defaultSampleType string)
```

### <a id="contains" href="#contains">func contains(slice []string, s string) bool</a>

```
searchKey: pprof.contains
tags: [method private]
```

```Go
func contains(slice []string, s string) bool
```

### <a id="containsCountsLabels" href="#containsCountsLabels">func containsCountsLabels(prof *profile.Profile, countLabels map[int64]map[string]string) bool</a>

```
searchKey: pprof.containsCountsLabels
tags: [method private]
```

```Go
func containsCountsLabels(prof *profile.Profile, countLabels map[int64]map[string]string) bool
```

### <a id="containsInOrder" href="#containsInOrder">func containsInOrder(s string, all ...string) bool</a>

```
searchKey: pprof.containsInOrder
tags: [method private]
```

```Go
func containsInOrder(s string, all ...string) bool
```

### <a id="containsInlinedCall" href="#containsInlinedCall">func containsInlinedCall(f interface{}, maxBytes int) bool</a>

```
searchKey: pprof.containsInlinedCall
tags: [method private]
```

```Go
func containsInlinedCall(f interface{}, maxBytes int) bool
```

containsInlinedCall reports whether the function body for the function f is known to contain an inlined function call within the first maxBytes bytes. 

### <a id="containsStack" href="#containsStack">func containsStack(got [][]string, want []string) bool</a>

```
searchKey: pprof.containsStack
tags: [method private]
```

```Go
func containsStack(got [][]string, want []string) bool
```

### <a id="countBlock" href="#countBlock">func countBlock() int</a>

```
searchKey: pprof.countBlock
tags: [function private]
```

```Go
func countBlock() int
```

countBlock returns the number of records in the blocking profile. 

### <a id="countGoroutine" href="#countGoroutine">func countGoroutine() int</a>

```
searchKey: pprof.countGoroutine
tags: [function private]
```

```Go
func countGoroutine() int
```

countGoroutine returns the number of goroutines. 

### <a id="countHeap" href="#countHeap">func countHeap() int</a>

```
searchKey: pprof.countHeap
tags: [function private]
```

```Go
func countHeap() int
```

countHeap returns the number of records in the heap profile. 

### <a id="countMutex" href="#countMutex">func countMutex() int</a>

```
searchKey: pprof.countMutex
tags: [function private]
```

```Go
func countMutex() int
```

countMutex returns the number of records in the mutex profile. 

### <a id="countThreadCreate" href="#countThreadCreate">func countThreadCreate() int</a>

```
searchKey: pprof.countThreadCreate
tags: [function private]
```

```Go
func countThreadCreate() int
```

countThreadCreate returns the size of the current ThreadCreateProfile. 

### <a id="cpuHog0" href="#cpuHog0">func cpuHog0(x, n int) int</a>

```
searchKey: pprof.cpuHog0
tags: [method private]
```

```Go
func cpuHog0(x, n int) int
```

### <a id="cpuHog1" href="#cpuHog1">func cpuHog1(x int) int</a>

```
searchKey: pprof.cpuHog1
tags: [method private]
```

```Go
func cpuHog1(x int) int
```

The actual CPU hogging function. Must not call other functions nor access heap/globals in the loop, otherwise under race detector the samples will be in the race runtime. 

### <a id="cpuHog2" href="#cpuHog2">func cpuHog2(x int) int</a>

```
searchKey: pprof.cpuHog2
tags: [method private]
```

```Go
func cpuHog2(x int) int
```

### <a id="cpuHogger" href="#cpuHogger">func cpuHogger(f func(x int) int, y *int, dur time.Duration)</a>

```
searchKey: pprof.cpuHogger
tags: [method private]
```

```Go
func cpuHogger(f func(x int) int, y *int, dur time.Duration)
```

### <a id="cpuProfilingBroken" href="#cpuProfilingBroken">func cpuProfilingBroken() bool</a>

```
searchKey: pprof.cpuProfilingBroken
tags: [function private]
```

```Go
func cpuProfilingBroken() bool
```

### <a id="dumpCallers" href="#dumpCallers">func dumpCallers(pcs []uintptr)</a>

```
searchKey: pprof.dumpCallers
tags: [method private]
```

```Go
func dumpCallers(pcs []uintptr)
```

### <a id="elfBuildID" href="#elfBuildID">func elfBuildID(file string) (string, error)</a>

```
searchKey: pprof.elfBuildID
tags: [method private]
```

```Go
func elfBuildID(file string) (string, error)
```

elfBuildID returns the GNU build ID of the named ELF binary, without introducing a dependency on debug/elf and its dependencies. 

### <a id="f1" href="#f1">func f1()</a>

```
searchKey: pprof.f1
tags: [function private]
```

```Go
func f1()
```

### <a id="f2" href="#f2">func f2()</a>

```
searchKey: pprof.f2
tags: [function private]
```

```Go
func f2()
```

### <a id="findInlinedCall" href="#findInlinedCall">func findInlinedCall(f interface{}, maxBytes int) (pc uint64, found bool)</a>

```
searchKey: pprof.findInlinedCall
tags: [method private]
```

```Go
func findInlinedCall(f interface{}, maxBytes int) (pc uint64, found bool)
```

findInlinedCall returns the PC of an inlined function call within the function body for the function f if any. 

### <a id="fmtJSON" href="#fmtJSON">func fmtJSON(x interface{}) string</a>

```
searchKey: pprof.fmtJSON
tags: [method private]
```

```Go
func fmtJSON(x interface{}) string
```

fmtJSON returns a pretty-printed JSON form for x. It works reasonbly well for printing protocol-buffer data structures like profile.Profile. 

### <a id="fprintStack" href="#fprintStack">func fprintStack(w io.Writer, stk []*profile.Location)</a>

```
searchKey: pprof.fprintStack
tags: [method private]
```

```Go
func fprintStack(w io.Writer, stk []*profile.Location)
```

### <a id="func1" href="#func1">func func1(c chan int)</a>

```
searchKey: pprof.func1
tags: [method private]
```

```Go
func func1(c chan int)
```

### <a id="func2" href="#func2">func func2(c chan int)</a>

```
searchKey: pprof.func2
tags: [method private]
```

```Go
func func2(c chan int)
```

### <a id="func3" href="#func3">func func3(c chan int)</a>

```
searchKey: pprof.func3
tags: [method private]
```

```Go
func func3(c chan int)
```

### <a id="func4" href="#func4">func func4(c chan int)</a>

```
searchKey: pprof.func4
tags: [method private]
```

```Go
func func4(c chan int)
```

### <a id="funcPC" href="#funcPC">func funcPC(f interface{}) uintptr</a>

```
searchKey: pprof.funcPC
tags: [method private]
```

```Go
func funcPC(f interface{}) uintptr
```

funcPC returns the PC for the func value f. 

### <a id="getProfLabel" href="#getProfLabel">func getProfLabel() map[string]string</a>

```
searchKey: pprof.getProfLabel
tags: [function private]
```

```Go
func getProfLabel() map[string]string
```

### <a id="growstack" href="#growstack">func growstack(n int)</a>

```
searchKey: pprof.growstack
tags: [method private]
```

```Go
func growstack(n int)
```

### <a id="growstack1" href="#growstack1">func growstack1()</a>

```
searchKey: pprof.growstack1
tags: [function private]
```

```Go
func growstack1()
```

### <a id="inlinedCallee" href="#inlinedCallee">func inlinedCallee(x, n int) int</a>

```
searchKey: pprof.inlinedCallee
tags: [method private]
```

```Go
func inlinedCallee(x, n int) int
```

### <a id="inlinedCalleeDump" href="#inlinedCalleeDump">func inlinedCalleeDump(pcs []uintptr)</a>

```
searchKey: pprof.inlinedCalleeDump
tags: [method private]
```

```Go
func inlinedCalleeDump(pcs []uintptr)
```

### <a id="inlinedCaller" href="#inlinedCaller">func inlinedCaller(x int) int</a>

```
searchKey: pprof.inlinedCaller
tags: [method private]
```

```Go
func inlinedCaller(x int) int
```

### <a id="inlinedCallerDump" href="#inlinedCallerDump">func inlinedCallerDump(pcs []uintptr)</a>

```
searchKey: pprof.inlinedCallerDump
tags: [method private]
```

```Go
func inlinedCallerDump(pcs []uintptr)
```

### <a id="labelsSorted" href="#labelsSorted">func labelsSorted(ctx context.Context) []label</a>

```
searchKey: pprof.labelsSorted
tags: [method private]
```

```Go
func labelsSorted(ctx context.Context) []label
```

### <a id="lockProfiles" href="#lockProfiles">func lockProfiles()</a>

```
searchKey: pprof.lockProfiles
tags: [function private]
```

```Go
func lockProfiles()
```

### <a id="lostProfileEvent" href="#lostProfileEvent">func lostProfileEvent()</a>

```
searchKey: pprof.lostProfileEvent
tags: [function private]
```

```Go
func lostProfileEvent()
```

lostProfileEvent is the function to which lost profiling events are attributed. (The name shows up in the pprof graphs.) 

### <a id="parseProcSelfMaps" href="#parseProcSelfMaps">func parseProcSelfMaps(data []byte, addMapping func(lo, hi, offset uint64, file, buildID string))</a>

```
searchKey: pprof.parseProcSelfMaps
tags: [method private]
```

```Go
func parseProcSelfMaps(data []byte, addMapping func(lo, hi, offset uint64, file, buildID string))
```

### <a id="parseProfile" href="#parseProfile">func parseProfile(t *testing.T, valBytes []byte, f func(uintptr, []*profile.Location, map[string][]string)) *profile.Profile</a>

```
searchKey: pprof.parseProfile
tags: [method private]
```

```Go
func parseProfile(t *testing.T, valBytes []byte, f func(uintptr, []*profile.Location, map[string][]string)) *profile.Profile
```

### <a id="printCountCycleProfile" href="#printCountCycleProfile">func printCountCycleProfile(w io.Writer, countName, cycleName string, scaler func(int64, float64) (int64, float64), records []runtime.BlockProfileRecord) error</a>

```
searchKey: pprof.printCountCycleProfile
tags: [method private]
```

```Go
func printCountCycleProfile(w io.Writer, countName, cycleName string, scaler func(int64, float64) (int64, float64), records []runtime.BlockProfileRecord) error
```

printCountCycleProfile outputs block profile records (for block or mutex profiles) as the pprof-proto format output. Translations from cycle count to time duration are done because The proto expects count and time (nanoseconds) instead of count and the number of cycles for block, contention profiles. Possible 'scaler' functions are scaleBlockProfile and scaleMutexProfile. 

### <a id="printCountProfile" href="#printCountProfile">func printCountProfile(w io.Writer, debug int, name string, p countProfile) error</a>

```
searchKey: pprof.printCountProfile
tags: [method private]
```

```Go
func printCountProfile(w io.Writer, debug int, name string, p countProfile) error
```

printCountProfile prints a countProfile at the specified debug level. The profile will be in compressed proto format unless debug is nonzero. 

### <a id="printStackRecord" href="#printStackRecord">func printStackRecord(w io.Writer, stk []uintptr, allFrames bool)</a>

```
searchKey: pprof.printStackRecord
tags: [method private]
```

```Go
func printStackRecord(w io.Writer, stk []uintptr, allFrames bool)
```

printStackRecord prints the function + source line information for a single stack trace. 

### <a id="profileOk" href="#profileOk">func profileOk(t *testing.T, matches matchFunc, need []string, avoid []string, prof bytes.Buffer, duration time.Duration) (_ *profile.Profile, ok bool)</a>

```
searchKey: pprof.profileOk
tags: [method private]
```

```Go
func profileOk(t *testing.T, matches matchFunc, need []string, avoid []string, prof bytes.Buffer, duration time.Duration) (_ *profile.Profile, ok bool)
```

### <a id="profileWriter" href="#profileWriter">func profileWriter(w io.Writer)</a>

```
searchKey: pprof.profileWriter
tags: [method private]
```

```Go
func profileWriter(w io.Writer)
```

### <a id="readProfile" href="#readProfile">func readProfile() (data []uint64, tags []unsafe.Pointer, eof bool)</a>

```
searchKey: pprof.readProfile
tags: [function private]
```

```Go
func readProfile() (data []uint64, tags []unsafe.Pointer, eof bool)
```

readProfile, provided by the runtime, returns the next chunk of binary CPU profiling stack trace data, blocking until data is available. If profiling is turned off and all the profile data accumulated while it was on has been returned, readProfile returns eof=true. The caller must save the returned data and tags before calling readProfile again. 

### <a id="recursionCallee" href="#recursionCallee">func recursionCallee(n, x int) int</a>

```
searchKey: pprof.recursionCallee
tags: [method private]
```

```Go
func recursionCallee(n, x int) int
```

### <a id="recursionCaller" href="#recursionCaller">func recursionCaller(x int) int</a>

```
searchKey: pprof.recursionCaller
tags: [method private]
```

```Go
func recursionCaller(x int) int
```

### <a id="recursionChainBottom" href="#recursionChainBottom">func recursionChainBottom(x int, pcs []uintptr)</a>

```
searchKey: pprof.recursionChainBottom
tags: [method private]
```

```Go
func recursionChainBottom(x int, pcs []uintptr)
```

### <a id="recursionChainMiddle" href="#recursionChainMiddle">func recursionChainMiddle(x int, pcs []uintptr)</a>

```
searchKey: pprof.recursionChainMiddle
tags: [method private]
```

```Go
func recursionChainMiddle(x int, pcs []uintptr)
```

### <a id="recursionChainTop" href="#recursionChainTop">func recursionChainTop(x int, pcs []uintptr)</a>

```
searchKey: pprof.recursionChainTop
tags: [method private]
```

```Go
func recursionChainTop(x int, pcs []uintptr)
```

### <a id="runtime_cyclesPerSecond" href="#runtime_cyclesPerSecond">func runtime_cyclesPerSecond() int64</a>

```
searchKey: pprof.runtime_cyclesPerSecond
tags: [function private]
```

```Go
func runtime_cyclesPerSecond() int64
```

### <a id="runtime_expandFinalInlineFrame" href="#runtime_expandFinalInlineFrame">func runtime_expandFinalInlineFrame(stk []uintptr) []uintptr</a>

```
searchKey: pprof.runtime_expandFinalInlineFrame
tags: [method private]
```

```Go
func runtime_expandFinalInlineFrame(stk []uintptr) []uintptr
```

runtime_expandFinalInlineFrame is defined in runtime/symtab.go. 

### <a id="runtime_getProfLabel" href="#runtime_getProfLabel">func runtime_getProfLabel() unsafe.Pointer</a>

```
searchKey: pprof.runtime_getProfLabel
tags: [function private]
```

```Go
func runtime_getProfLabel() unsafe.Pointer
```

runtime_getProfLabel is defined in runtime/proflabel.go. 

### <a id="runtime_goroutineProfileWithLabels" href="#runtime_goroutineProfileWithLabels">func runtime_goroutineProfileWithLabels(p []runtime.StackRecord, labels []unsafe.Pointer) (n int, ok bool)</a>

```
searchKey: pprof.runtime_goroutineProfileWithLabels
tags: [method private]
```

```Go
func runtime_goroutineProfileWithLabels(p []runtime.StackRecord, labels []unsafe.Pointer) (n int, ok bool)
```

runtime_goroutineProfileWithLabels is defined in runtime/mprof.go 

### <a id="runtime_setProfLabel" href="#runtime_setProfLabel">func runtime_setProfLabel(labels unsafe.Pointer)</a>

```
searchKey: pprof.runtime_setProfLabel
tags: [method private]
```

```Go
func runtime_setProfLabel(labels unsafe.Pointer)
```

runtime_setProfLabel is defined in runtime/proflabel.go. 

### <a id="scaleBlockProfile" href="#scaleBlockProfile">func scaleBlockProfile(cnt int64, ns float64) (int64, float64)</a>

```
searchKey: pprof.scaleBlockProfile
tags: [method private]
```

```Go
func scaleBlockProfile(cnt int64, ns float64) (int64, float64)
```

### <a id="scaleHeapSample" href="#scaleHeapSample">func scaleHeapSample(count, size, rate int64) (int64, int64)</a>

```
searchKey: pprof.scaleHeapSample
tags: [method private]
```

```Go
func scaleHeapSample(count, size, rate int64) (int64, int64)
```

scaleHeapSample adjusts the data from a heap Sample to account for its probability of appearing in the collected data. heap profiles are a sampling of the memory allocations requests in a program. We estimate the unsampled value by dividing each collected sample by its probability of appearing in the profile. heap profiles rely on a poisson process to determine which samples to collect, based on the desired average collection rate R. The probability of a sample of size S to appear in that profile is 1-exp(-S/R). 

### <a id="scaleMutexProfile" href="#scaleMutexProfile">func scaleMutexProfile(cnt int64, ns float64) (int64, float64)</a>

```
searchKey: pprof.scaleMutexProfile
tags: [method private]
```

```Go
func scaleMutexProfile(cnt int64, ns float64) (int64, float64)
```

### <a id="stackContains" href="#stackContains">func stackContains(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool</a>

```
searchKey: pprof.stackContains
tags: [method private]
```

```Go
func stackContains(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool
```

stackContains matches if a function named spec appears anywhere in the stack trace. 

### <a id="stackContainsAll" href="#stackContainsAll">func stackContainsAll(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool</a>

```
searchKey: pprof.stackContainsAll
tags: [method private]
```

```Go
func stackContainsAll(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool
```

stackContainsAll matches if all functions in spec (comma-separated) appear somewhere in the stack trace. 

### <a id="stackContainsLabeled" href="#stackContainsLabeled">func stackContainsLabeled(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool</a>

```
searchKey: pprof.stackContainsLabeled
tags: [method private]
```

```Go
func stackContainsLabeled(spec string, count uintptr, stk []*profile.Location, labels map[string][]string) bool
```

stackContainsLabeled takes a spec like funcname;key=value and matches if the stack has that key and value and has funcname somewhere in the stack. 

### <a id="stacks" href="#stacks">func stacks(p *profile.Profile) (res [][]string)</a>

```
searchKey: pprof.stacks
tags: [method private]
```

```Go
func stacks(p *profile.Profile) (res [][]string)
```

### <a id="symbolized" href="#symbolized">func symbolized(loc *profile.Location) bool</a>

```
searchKey: pprof.symbolized
tags: [method private]
```

```Go
func symbolized(loc *profile.Location) bool
```

### <a id="testCPUProfile" href="#testCPUProfile">func testCPUProfile(t *testing.T, matches matchFunc, need []string, avoid []string, f func(dur time.Duration)) *profile.Profile</a>

```
searchKey: pprof.testCPUProfile
tags: [method private]
```

```Go
func testCPUProfile(t *testing.T, matches matchFunc, need []string, avoid []string, f func(dur time.Duration)) *profile.Profile
```

testCPUProfile runs f under the CPU profiler, checking for some conditions specified by need, as interpreted by matches, and returns the parsed profile. 

### <a id="testPCs" href="#testPCs">func testPCs(t *testing.T) (addr1, addr2 uint64, map1, map2 *profile.Mapping)</a>

```
searchKey: pprof.testPCs
tags: [method private]
```

```Go
func testPCs(t *testing.T) (addr1, addr2 uint64, map1, map2 *profile.Mapping)
```

testPCs returns two PCs and two corresponding memory mappings to use in test profiles. 

### <a id="translateCPUProfile" href="#translateCPUProfile">func translateCPUProfile(data []uint64) (*profile.Profile, error)</a>

```
searchKey: pprof.translateCPUProfile
tags: [method private]
```

```Go
func translateCPUProfile(data []uint64) (*profile.Profile, error)
```

translateCPUProfile parses binary CPU profiling stack trace data generated by runtime.CPUProfile() into a profile struct. This is only used for testing. Real conversions stream the data into the profileBuilder as it becomes available. 

### <a id="unlockProfiles" href="#unlockProfiles">func unlockProfiles()</a>

```
searchKey: pprof.unlockProfiles
tags: [function private]
```

```Go
func unlockProfiles()
```

### <a id="use" href="#use">func use(x [8 << 16]byte)</a>

```
searchKey: pprof.use
tags: [method private]
```

```Go
func use(x [8 << 16]byte)
```

### <a id="writeAlloc" href="#writeAlloc">func writeAlloc(w io.Writer, debug int) error</a>

```
searchKey: pprof.writeAlloc
tags: [method private]
```

```Go
func writeAlloc(w io.Writer, debug int) error
```

writeAlloc writes the current runtime heap profile to w with the total allocation space as the default sample type. 

### <a id="writeBlock" href="#writeBlock">func writeBlock(w io.Writer, debug int) error</a>

```
searchKey: pprof.writeBlock
tags: [method private]
```

```Go
func writeBlock(w io.Writer, debug int) error
```

writeBlock writes the current blocking profile to w. 

### <a id="writeGoroutine" href="#writeGoroutine">func writeGoroutine(w io.Writer, debug int) error</a>

```
searchKey: pprof.writeGoroutine
tags: [method private]
```

```Go
func writeGoroutine(w io.Writer, debug int) error
```

writeGoroutine writes the current runtime GoroutineProfile to w. 

### <a id="writeGoroutineStacks" href="#writeGoroutineStacks">func writeGoroutineStacks(w io.Writer) error</a>

```
searchKey: pprof.writeGoroutineStacks
tags: [method private]
```

```Go
func writeGoroutineStacks(w io.Writer) error
```

### <a id="writeHeap" href="#writeHeap">func writeHeap(w io.Writer, debug int) error</a>

```
searchKey: pprof.writeHeap
tags: [method private]
```

```Go
func writeHeap(w io.Writer, debug int) error
```

writeHeap writes the current runtime heap profile to w. 

### <a id="writeHeapInternal" href="#writeHeapInternal">func writeHeapInternal(w io.Writer, debug int, defaultSampleType string) error</a>

```
searchKey: pprof.writeHeapInternal
tags: [method private]
```

```Go
func writeHeapInternal(w io.Writer, debug int, defaultSampleType string) error
```

### <a id="writeHeapProto" href="#writeHeapProto">func writeHeapProto(w io.Writer, p []runtime.MemProfileRecord, rate int64, defaultSampleType string) error</a>

```
searchKey: pprof.writeHeapProto
tags: [method private]
```

```Go
func writeHeapProto(w io.Writer, p []runtime.MemProfileRecord, rate int64, defaultSampleType string) error
```

writeHeapProto writes the current heap profile in protobuf format to w. 

### <a id="writeMutex" href="#writeMutex">func writeMutex(w io.Writer, debug int) error</a>

```
searchKey: pprof.writeMutex
tags: [method private]
```

```Go
func writeMutex(w io.Writer, debug int) error
```

writeMutex writes the current mutex profile to w. 

### <a id="writeProfileInternal" href="#writeProfileInternal">func writeProfileInternal(w io.Writer, debug int, name string, runtimeProfile func([]runtime.BlockProfileRecord) (int, bool), scaleProfile func(int64, float64) (int64, float64)) error</a>

```
searchKey: pprof.writeProfileInternal
tags: [method private]
```

```Go
func writeProfileInternal(w io.Writer, debug int, name string, runtimeProfile func([]runtime.BlockProfileRecord) (int, bool), scaleProfile func(int64, float64) (int64, float64)) error
```

writeProfileInternal writes the current blocking or mutex profile depending on the passed parameters 

### <a id="writeRuntimeProfile" href="#writeRuntimeProfile">func writeRuntimeProfile(w io.Writer, debug int, name string, fetch func([]runtime.StackRecord, []unsafe.Pointer) (int, bool)) error</a>

```
searchKey: pprof.writeRuntimeProfile
tags: [method private]
```

```Go
func writeRuntimeProfile(w io.Writer, debug int, name string, fetch func([]runtime.StackRecord, []unsafe.Pointer) (int, bool)) error
```

### <a id="writeThreadCreate" href="#writeThreadCreate">func writeThreadCreate(w io.Writer, debug int) error</a>

```
searchKey: pprof.writeThreadCreate
tags: [method private]
```

```Go
func writeThreadCreate(w io.Writer, debug int) error
```

writeThreadCreate writes the current runtime ThreadCreateProfile to w. 

