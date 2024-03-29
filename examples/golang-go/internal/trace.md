# Package trace

## Index

* [Constants](#const)
    * [const EvBatch](#EvBatch)
    * [const EvCount](#EvCount)
    * [const EvFrequency](#EvFrequency)
    * [const EvFutileWakeup](#EvFutileWakeup)
    * [const EvGCDone](#EvGCDone)
    * [const EvGCMarkAssistDone](#EvGCMarkAssistDone)
    * [const EvGCMarkAssistStart](#EvGCMarkAssistStart)
    * [const EvGCSTWDone](#EvGCSTWDone)
    * [const EvGCSTWStart](#EvGCSTWStart)
    * [const EvGCStart](#EvGCStart)
    * [const EvGCSweepDone](#EvGCSweepDone)
    * [const EvGCSweepStart](#EvGCSweepStart)
    * [const EvGoBlock](#EvGoBlock)
    * [const EvGoBlockCond](#EvGoBlockCond)
    * [const EvGoBlockGC](#EvGoBlockGC)
    * [const EvGoBlockNet](#EvGoBlockNet)
    * [const EvGoBlockRecv](#EvGoBlockRecv)
    * [const EvGoBlockSelect](#EvGoBlockSelect)
    * [const EvGoBlockSend](#EvGoBlockSend)
    * [const EvGoBlockSync](#EvGoBlockSync)
    * [const EvGoCreate](#EvGoCreate)
    * [const EvGoEnd](#EvGoEnd)
    * [const EvGoInSyscall](#EvGoInSyscall)
    * [const EvGoPreempt](#EvGoPreempt)
    * [const EvGoSched](#EvGoSched)
    * [const EvGoSleep](#EvGoSleep)
    * [const EvGoStart](#EvGoStart)
    * [const EvGoStartLabel](#EvGoStartLabel)
    * [const EvGoStartLocal](#EvGoStartLocal)
    * [const EvGoStop](#EvGoStop)
    * [const EvGoSysBlock](#EvGoSysBlock)
    * [const EvGoSysCall](#EvGoSysCall)
    * [const EvGoSysExit](#EvGoSysExit)
    * [const EvGoSysExitLocal](#EvGoSysExitLocal)
    * [const EvGoUnblock](#EvGoUnblock)
    * [const EvGoUnblockLocal](#EvGoUnblockLocal)
    * [const EvGoWaiting](#EvGoWaiting)
    * [const EvGomaxprocs](#EvGomaxprocs)
    * [const EvHeapAlloc](#EvHeapAlloc)
    * [const EvHeapGoal](#EvHeapGoal)
    * [const EvNone](#EvNone)
    * [const EvProcStart](#EvProcStart)
    * [const EvProcStop](#EvProcStop)
    * [const EvStack](#EvStack)
    * [const EvString](#EvString)
    * [const EvTimerGoroutine](#EvTimerGoroutine)
    * [const EvUserLog](#EvUserLog)
    * [const EvUserRegion](#EvUserRegion)
    * [const EvUserTaskCreate](#EvUserTaskCreate)
    * [const EvUserTaskEnd](#EvUserTaskEnd)
    * [const FakeP](#FakeP)
    * [const GCP](#GCP)
    * [const NetpollP](#NetpollP)
    * [const SyscallP](#SyscallP)
    * [const TimerP](#TimerP)
    * [const UtilAssist](#UtilAssist)
    * [const UtilBackground](#UtilBackground)
    * [const UtilPerProc](#UtilPerProc)
    * [const UtilSTW](#UtilSTW)
    * [const UtilSweep](#UtilSweep)
    * [const gDead](#gDead)
    * [const gRunnable](#gRunnable)
    * [const gRunning](#gRunning)
    * [const gWaiting](#gWaiting)
    * [const garbage](#garbage)
    * [const mudDegree](#mudDegree)
    * [const noseq](#noseq)
    * [const seqinc](#seqinc)
    * [const unordered](#unordered)
* [Variables](#var)
    * [var BreakTimestampsForTesting](#BreakTimestampsForTesting)
    * [var ErrTimeOrder](#ErrTimeOrder)
    * [var EventDescriptions](#EventDescriptions)
    * [var bandsPerSeries](#bandsPerSeries)
* [Types](#type)
    * [type Event struct](#Event)
        * [func (ev *Event) String() string](#Event.String)
    * [type Frame struct](#Frame)
    * [type GDesc struct](#GDesc)
        * [func (g *GDesc) finalize(lastTs, activeGCStartTime int64, trigger *Event)](#GDesc.finalize)
        * [func (g *GDesc) snapshotStat(lastTs, activeGCStartTime int64) (ret GExecutionStat)](#GDesc.snapshotStat)
    * [type GExecutionStat struct](#GExecutionStat)
        * [func (s GExecutionStat) sub(v GExecutionStat) (r GExecutionStat)](#GExecutionStat.sub)
    * [type MMUCurve struct](#MMUCurve)
        * [func NewMMUCurve(utils [][]MutatorUtil) *MMUCurve](#NewMMUCurve)
        * [func (c *MMUCurve) Examples(window time.Duration, n int) (worst []UtilWindow)](#MMUCurve.Examples)
        * [func (c *MMUCurve) MMU(window time.Duration) (mmu float64)](#MMUCurve.MMU)
        * [func (c *MMUCurve) MUD(window time.Duration, quantiles []float64) []float64](#MMUCurve.MUD)
        * [func (c *MMUCurve) mmu(window time.Duration, acc *accumulator)](#MMUCurve.mmu)
    * [type MutatorUtil struct](#MutatorUtil)
    * [type ParseResult struct](#ParseResult)
        * [func Parse(r io.Reader, bin string) (ParseResult, error)](#Parse)
        * [func parse(r io.Reader, bin string) (int, ParseResult, error)](#parse)
    * [type UserRegionDesc struct](#UserRegionDesc)
    * [type UtilFlags int](#UtilFlags)
    * [type UtilWindow struct](#UtilWindow)
    * [type Writer struct](#Writer)
        * [func NewWriter() *Writer](#NewWriter)
        * [func (w *Writer) Emit(typ byte, args ...uint64)](#Writer.Emit)
    * [type accumulator struct](#accumulator)
        * [func (acc *accumulator) addMU(time int64, mu float64, window time.Duration) bool](#accumulator.addMU)
        * [func (acc *accumulator) resetTime()](#accumulator.resetTime)
    * [type bandUtil struct](#bandUtil)
    * [type bandUtilHeap []trace.bandUtil](#bandUtilHeap)
        * [func (h bandUtilHeap) Len() int](#bandUtilHeap.Len)
        * [func (h bandUtilHeap) Less(i, j int) bool](#bandUtilHeap.Less)
        * [func (h *bandUtilHeap) Pop() interface{}](#bandUtilHeap.Pop)
        * [func (h *bandUtilHeap) Push(x interface{})](#bandUtilHeap.Push)
        * [func (h bandUtilHeap) Swap(i, j int)](#bandUtilHeap.Swap)
    * [type edge struct](#edge)
    * [type eventBatch struct](#eventBatch)
    * [type eventList []*trace.Event](#eventList)
        * [func (l eventList) Len() int](#eventList.Len)
        * [func (l eventList) Less(i, j int) bool](#eventList.Less)
        * [func (l eventList) Swap(i, j int)](#eventList.Swap)
    * [type eventSeqList []*trace.Event](#eventSeqList)
        * [func (l eventSeqList) Len() int](#eventSeqList.Len)
        * [func (l eventSeqList) Less(i, j int) bool](#eventSeqList.Less)
        * [func (l eventSeqList) Swap(i, j int)](#eventSeqList.Swap)
    * [type gState struct](#gState)
        * [func stateTransition(ev *Event) (g uint64, init, next gState)](#stateTransition)
    * [type gStatus int](#gStatus)
    * [type gdesc struct](#gdesc)
    * [type integrator struct](#integrator)
        * [func (in *integrator) advance(time int64) totalUtil](#integrator.advance)
        * [func (in *integrator) next(time int64) int64](#integrator.next)
    * [type mmuBand struct](#mmuBand)
    * [type mmuSeries struct](#mmuSeries)
        * [func newMMUSeries(util []MutatorUtil) mmuSeries](#newMMUSeries)
        * [func (c *mmuSeries) bandMMU(bandIdx int, window time.Duration, acc *accumulator)](#mmuSeries.bandMMU)
        * [func (s *mmuSeries) bandTime(i int) (start, end int64)](#mmuSeries.bandTime)
        * [func (c *mmuSeries) mkBandUtil(series int, window time.Duration) []bandUtil](#mmuSeries.mkBandUtil)
    * [type mud struct](#mud)
        * [func (d *mud) add(l, r, area float64)](#mud.add)
        * [func (d *mud) approxInvCumulativeSum() (float64, float64, bool)](#mud.approxInvCumulativeSum)
        * [func (d *mud) invCumulativeSum(y float64) (float64, bool)](#mud.invCumulativeSum)
        * [func (d *mud) setTrackMass(mass float64)](#mud.setTrackMass)
    * [type orderEvent struct](#orderEvent)
    * [type orderEventList []trace.orderEvent](#orderEventList)
        * [func (l orderEventList) Len() int](#orderEventList.Len)
        * [func (l orderEventList) Less(i, j int) bool](#orderEventList.Less)
        * [func (l orderEventList) Swap(i, j int)](#orderEventList.Swap)
    * [type rawEvent struct](#rawEvent)
    * [type totalUtil float64](#totalUtil)
        * [func totalUtilOf(meanUtil float64, dur int64) totalUtil](#totalUtilOf)
        * [func (u totalUtil) mean(dur time.Duration) float64](#totalUtil.mean)
    * [type utilHeap []trace.UtilWindow](#utilHeap)
        * [func (h utilHeap) Len() int](#utilHeap.Len)
        * [func (h utilHeap) Less(i, j int) bool](#utilHeap.Less)
        * [func (h *utilHeap) Pop() interface{}](#utilHeap.Pop)
        * [func (h *utilHeap) Push(x interface{})](#utilHeap.Push)
        * [func (h utilHeap) Swap(i, j int)](#utilHeap.Swap)
* [Functions](#func)
    * [func BenchmarkMMU(b *testing.B)](#BenchmarkMMU)
    * [func GoroutineStats(events []*Event) map[uint64]*GDesc](#GoroutineStats)
    * [func MutatorUtilization(events []*Event, flags UtilFlags) [][]MutatorUtil](#MutatorUtilization)
    * [func Print(events []*Event)](#Print)
    * [func PrintEvent(ev *Event)](#PrintEvent)
    * [func RelatedGoroutines(events []*Event, goid uint64) map[uint64]bool](#RelatedGoroutines)
    * [func TestCorruptedInputs(t *testing.T)](#TestCorruptedInputs)
    * [func TestMMU(t *testing.T)](#TestMMU)
    * [func TestMMUTrace(t *testing.T)](#TestMMUTrace)
    * [func TestMUD(t *testing.T)](#TestMUD)
    * [func TestMUDTracking(t *testing.T)](#TestMUDTracking)
    * [func TestParseCanned(t *testing.T)](#TestParseCanned)
    * [func TestParseVersion(t *testing.T)](#TestParseVersion)
    * [func TestTimestampOverflow(t *testing.T)](#TestTimestampOverflow)
    * [func addUtil(util []MutatorUtil, mu MutatorUtil) []MutatorUtil](#addUtil)
    * [func aeq(x, y float64) bool](#aeq)
    * [func appendVarint(buf []byte, v uint64) []byte](#appendVarint)
    * [func argNum(raw rawEvent, ver int) int](#argNum)
    * [func goCmd() string](#goCmd)
    * [func mmuSlow(util []MutatorUtil, window time.Duration) (mmu float64)](#mmuSlow)
    * [func order1005(m map[int][]*Event) (events []*Event, err error)](#order1005)
    * [func order1007(m map[int][]*Event) (events []*Event, err error)](#order1007)
    * [func parseEvents(ver int, rawEvents []rawEvent, strings map[uint64]string) (events []*Event, stacks map[uint64][]*Frame, err error)](#parseEvents)
    * [func parseHeader(buf []byte) (int, error)](#parseHeader)
    * [func postProcessTrace(ver int, events []*Event) error](#postProcessTrace)
    * [func readStr(r io.Reader, off0 int) (s string, off int, err error)](#readStr)
    * [func readTrace(r io.Reader) (ver int, events []rawEvent, strings map[uint64]string, err error)](#readTrace)
    * [func readVal(r io.Reader, off0 int) (v uint64, off int, err error)](#readVal)
    * [func removeFutile(events []*Event) []*Event](#removeFutile)
    * [func symbolize(events []*Event, bin string) error](#symbolize)
    * [func transition(gs map[uint64]gState, g uint64, init, next gState)](#transition)
    * [func transitionReady(g uint64, curr, init gState) bool](#transitionReady)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="EvBatch" href="#EvBatch">const EvBatch</a>

```
searchKey: trace.EvBatch
tags: [constant number]
```

```Go
const EvBatch = 1 // start of per-P batch of events [pid, timestamp]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvCount" href="#EvCount">const EvCount</a>

```
searchKey: trace.EvCount
tags: [constant number]
```

```Go
const EvCount = 49
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvFrequency" href="#EvFrequency">const EvFrequency</a>

```
searchKey: trace.EvFrequency
tags: [constant number]
```

```Go
const EvFrequency = 2 // contains tracer timer frequency [frequency (ticks per second)]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvFutileWakeup" href="#EvFutileWakeup">const EvFutileWakeup</a>

```
searchKey: trace.EvFutileWakeup
tags: [constant number]
```

```Go
const EvFutileWakeup // denotes that the previous wakeup of this goroutine was futile [timestamp]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGCDone" href="#EvGCDone">const EvGCDone</a>

```
searchKey: trace.EvGCDone
tags: [constant number]
```

```Go
const EvGCDone = 8 // GC done [timestamp]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGCMarkAssistDone" href="#EvGCMarkAssistDone">const EvGCMarkAssistDone</a>

```
searchKey: trace.EvGCMarkAssistDone
tags: [constant number]
```

```Go
const EvGCMarkAssistDone = 44 // GC mark assist done [timestamp]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGCMarkAssistStart" href="#EvGCMarkAssistStart">const EvGCMarkAssistStart</a>

```
searchKey: trace.EvGCMarkAssistStart
tags: [constant number]
```

```Go
const EvGCMarkAssistStart = 43 // GC mark assist start [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGCSTWDone" href="#EvGCSTWDone">const EvGCSTWDone</a>

```
searchKey: trace.EvGCSTWDone
tags: [constant number]
```

```Go
const EvGCSTWDone = 10 // GC mark termination done [timestamp]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGCSTWStart" href="#EvGCSTWStart">const EvGCSTWStart</a>

```
searchKey: trace.EvGCSTWStart
tags: [constant number]
```

```Go
const EvGCSTWStart = 9 // GC mark termination start [timestamp, kind]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGCStart" href="#EvGCStart">const EvGCStart</a>

```
searchKey: trace.EvGCStart
tags: [constant number]
```

```Go
const EvGCStart = 7 // GC start [timestamp, seq, stack id]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGCSweepDone" href="#EvGCSweepDone">const EvGCSweepDone</a>

```
searchKey: trace.EvGCSweepDone
tags: [constant number]
```

```Go
const EvGCSweepDone = 12 // GC sweep done [timestamp, swept, reclaimed]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGCSweepStart" href="#EvGCSweepStart">const EvGCSweepStart</a>

```
searchKey: trace.EvGCSweepStart
tags: [constant number]
```

```Go
const EvGCSweepStart = 11 // GC sweep start [timestamp, stack id]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoBlock" href="#EvGoBlock">const EvGoBlock</a>

```
searchKey: trace.EvGoBlock
tags: [constant number]
```

```Go
const EvGoBlock = 20 // goroutine blocks [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoBlockCond" href="#EvGoBlockCond">const EvGoBlockCond</a>

```
searchKey: trace.EvGoBlockCond
tags: [constant number]
```

```Go
const EvGoBlockCond = 26 // goroutine blocks on Cond [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoBlockGC" href="#EvGoBlockGC">const EvGoBlockGC</a>

```
searchKey: trace.EvGoBlockGC
tags: [constant number]
```

```Go
const EvGoBlockGC = 42 // goroutine blocks on GC assist [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoBlockNet" href="#EvGoBlockNet">const EvGoBlockNet</a>

```
searchKey: trace.EvGoBlockNet
tags: [constant number]
```

```Go
const EvGoBlockNet = 27 // goroutine blocks on network [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoBlockRecv" href="#EvGoBlockRecv">const EvGoBlockRecv</a>

```
searchKey: trace.EvGoBlockRecv
tags: [constant number]
```

```Go
const EvGoBlockRecv = 23 // goroutine blocks on chan recv [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoBlockSelect" href="#EvGoBlockSelect">const EvGoBlockSelect</a>

```
searchKey: trace.EvGoBlockSelect
tags: [constant number]
```

```Go
const EvGoBlockSelect = 24 // goroutine blocks on select [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoBlockSend" href="#EvGoBlockSend">const EvGoBlockSend</a>

```
searchKey: trace.EvGoBlockSend
tags: [constant number]
```

```Go
const EvGoBlockSend = 22 // goroutine blocks on chan send [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoBlockSync" href="#EvGoBlockSync">const EvGoBlockSync</a>

```
searchKey: trace.EvGoBlockSync
tags: [constant number]
```

```Go
const EvGoBlockSync = 25 // goroutine blocks on Mutex/RWMutex [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoCreate" href="#EvGoCreate">const EvGoCreate</a>

```
searchKey: trace.EvGoCreate
tags: [constant number]
```

```Go
const EvGoCreate = 13 // goroutine creation [timestamp, new goroutine id, new stack id, stack id]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoEnd" href="#EvGoEnd">const EvGoEnd</a>

```
searchKey: trace.EvGoEnd
tags: [constant number]
```

```Go
const EvGoEnd = 15 // goroutine ends [timestamp]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoInSyscall" href="#EvGoInSyscall">const EvGoInSyscall</a>

```
searchKey: trace.EvGoInSyscall
tags: [constant number]
```

```Go
const EvGoInSyscall // denotes that goroutine is in syscall when tracing starts [timestamp, goroutine id]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoPreempt" href="#EvGoPreempt">const EvGoPreempt</a>

```
searchKey: trace.EvGoPreempt
tags: [constant number]
```

```Go
const EvGoPreempt = 18 // goroutine is preempted [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoSched" href="#EvGoSched">const EvGoSched</a>

```
searchKey: trace.EvGoSched
tags: [constant number]
```

```Go
const EvGoSched = 17 // goroutine calls Gosched [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoSleep" href="#EvGoSleep">const EvGoSleep</a>

```
searchKey: trace.EvGoSleep
tags: [constant number]
```

```Go
const EvGoSleep = 19 // goroutine calls Sleep [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoStart" href="#EvGoStart">const EvGoStart</a>

```
searchKey: trace.EvGoStart
tags: [constant number]
```

```Go
const EvGoStart = 14 // goroutine starts running [timestamp, goroutine id, seq]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoStartLabel" href="#EvGoStartLabel">const EvGoStartLabel</a>

```
searchKey: trace.EvGoStartLabel
tags: [constant number]
```

```Go
const EvGoStartLabel // goroutine starts running with label [timestamp, goroutine id, seq, label string id]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoStartLocal" href="#EvGoStartLocal">const EvGoStartLocal</a>

```
searchKey: trace.EvGoStartLocal
tags: [constant number]
```

```Go
const EvGoStartLocal // goroutine starts running on the same P as the last event [timestamp, goroutine id]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoStop" href="#EvGoStop">const EvGoStop</a>

```
searchKey: trace.EvGoStop
tags: [constant number]
```

```Go
const EvGoStop = 16 // goroutine stops (like in select{}) [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoSysBlock" href="#EvGoSysBlock">const EvGoSysBlock</a>

```
searchKey: trace.EvGoSysBlock
tags: [constant number]
```

```Go
const EvGoSysBlock = 30 // syscall blocks [timestamp]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoSysCall" href="#EvGoSysCall">const EvGoSysCall</a>

```
searchKey: trace.EvGoSysCall
tags: [constant number]
```

```Go
const EvGoSysCall = 28 // syscall enter [timestamp, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoSysExit" href="#EvGoSysExit">const EvGoSysExit</a>

```
searchKey: trace.EvGoSysExit
tags: [constant number]
```

```Go
const EvGoSysExit = 29 // syscall exit [timestamp, goroutine id, seq, real timestamp]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoSysExitLocal" href="#EvGoSysExitLocal">const EvGoSysExitLocal</a>

```
searchKey: trace.EvGoSysExitLocal
tags: [constant number]
```

```Go
const EvGoSysExitLocal // syscall exit on the same P as the last event [timestamp, goroutine id, real timestamp]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoUnblock" href="#EvGoUnblock">const EvGoUnblock</a>

```
searchKey: trace.EvGoUnblock
tags: [constant number]
```

```Go
const EvGoUnblock = 21 // goroutine is unblocked [timestamp, goroutine id, seq, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoUnblockLocal" href="#EvGoUnblockLocal">const EvGoUnblockLocal</a>

```
searchKey: trace.EvGoUnblockLocal
tags: [constant number]
```

```Go
const EvGoUnblockLocal // goroutine is unblocked on the same P as the last event [timestamp, goroutine id, stack]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGoWaiting" href="#EvGoWaiting">const EvGoWaiting</a>

```
searchKey: trace.EvGoWaiting
tags: [constant number]
```

```Go
const EvGoWaiting // denotes that goroutine is blocked when tracing starts [timestamp, goroutine id]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvGomaxprocs" href="#EvGomaxprocs">const EvGomaxprocs</a>

```
searchKey: trace.EvGomaxprocs
tags: [constant number]
```

```Go
const EvGomaxprocs = 4 // current value of GOMAXPROCS [timestamp, GOMAXPROCS, stack id]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvHeapAlloc" href="#EvHeapAlloc">const EvHeapAlloc</a>

```
searchKey: trace.EvHeapAlloc
tags: [constant number]
```

```Go
const EvHeapAlloc = 33 // gcController.heapLive change [timestamp, heap live bytes]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvHeapGoal" href="#EvHeapGoal">const EvHeapGoal</a>

```
searchKey: trace.EvHeapGoal
tags: [constant number]
```

```Go
const EvHeapGoal = 34 // gcController.heapGoal change [timestamp, heap goal bytes]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvNone" href="#EvNone">const EvNone</a>

```
searchKey: trace.EvNone
tags: [constant number]
```

```Go
const EvNone = 0 // unused

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvProcStart" href="#EvProcStart">const EvProcStart</a>

```
searchKey: trace.EvProcStart
tags: [constant number]
```

```Go
const EvProcStart = 5 // start of P [timestamp, thread id]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvProcStop" href="#EvProcStop">const EvProcStop</a>

```
searchKey: trace.EvProcStop
tags: [constant number]
```

```Go
const EvProcStop = 6 // stop of P [timestamp]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvStack" href="#EvStack">const EvStack</a>

```
searchKey: trace.EvStack
tags: [constant number]
```

```Go
const EvStack // stack [stack id, number of PCs, array of {PC, func string ID, file string ID, line}]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvString" href="#EvString">const EvString</a>

```
searchKey: trace.EvString
tags: [constant number]
```

```Go
const EvString = 37 // string dictionary entry [ID, length, string]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvTimerGoroutine" href="#EvTimerGoroutine">const EvTimerGoroutine</a>

```
searchKey: trace.EvTimerGoroutine
tags: [constant number]
```

```Go
const EvTimerGoroutine = 35 // denotes timer goroutine [timer goroutine id]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvUserLog" href="#EvUserLog">const EvUserLog</a>

```
searchKey: trace.EvUserLog
tags: [constant number]
```

```Go
const EvUserLog = 48 // trace.Log [timestamp, internal id, key string id, stack, value string]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvUserRegion" href="#EvUserRegion">const EvUserRegion</a>

```
searchKey: trace.EvUserRegion
tags: [constant number]
```

```Go
const EvUserRegion // trace.WithRegion [timestamp, internal task id, mode(0:start, 1:end), stack, name string]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvUserTaskCreate" href="#EvUserTaskCreate">const EvUserTaskCreate</a>

```
searchKey: trace.EvUserTaskCreate
tags: [constant number]
```

```Go
const EvUserTaskCreate // trace.NewContext [timestamp, internal task id, internal parent id, stack, name string]
 = ...
```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="EvUserTaskEnd" href="#EvUserTaskEnd">const EvUserTaskEnd</a>

```
searchKey: trace.EvUserTaskEnd
tags: [constant number]
```

```Go
const EvUserTaskEnd = 46 // end of task [timestamp, internal task id, stack]

```

Event types in the trace. Verbatim copy from src/runtime/trace.go with the "trace" prefix removed. 

### <a id="FakeP" href="#FakeP">const FakeP</a>

```
searchKey: trace.FakeP
tags: [constant number]
```

```Go
const FakeP = 1000000 + iota
```

Special P identifiers: 

### <a id="GCP" href="#GCP">const GCP</a>

```
searchKey: trace.GCP
tags: [constant number]
```

```Go
const GCP // depicts GC state

```

### <a id="NetpollP" href="#NetpollP">const NetpollP</a>

```
searchKey: trace.NetpollP
tags: [constant number]
```

```Go
const NetpollP // depicts network unblocks

```

### <a id="SyscallP" href="#SyscallP">const SyscallP</a>

```
searchKey: trace.SyscallP
tags: [constant number]
```

```Go
const SyscallP // depicts returns from syscalls

```

### <a id="TimerP" href="#TimerP">const TimerP</a>

```
searchKey: trace.TimerP
tags: [constant number]
```

```Go
const TimerP // depicts timer unblocks

```

### <a id="UtilAssist" href="#UtilAssist">const UtilAssist</a>

```
searchKey: trace.UtilAssist
tags: [constant number]
```

```Go
const UtilAssist
```

UtilAssist means utilization should account for mark assists. 

### <a id="UtilBackground" href="#UtilBackground">const UtilBackground</a>

```
searchKey: trace.UtilBackground
tags: [constant number]
```

```Go
const UtilBackground
```

UtilBackground means utilization should account for background mark workers. 

### <a id="UtilPerProc" href="#UtilPerProc">const UtilPerProc</a>

```
searchKey: trace.UtilPerProc
tags: [constant number]
```

```Go
const UtilPerProc
```

UtilPerProc means each P should be given a separate utilization function. Otherwise, there is a single function and each P is given a fraction of the utilization. 

### <a id="UtilSTW" href="#UtilSTW">const UtilSTW</a>

```
searchKey: trace.UtilSTW
tags: [constant number]
```

```Go
const UtilSTW UtilFlags = 1 << iota
```

UtilSTW means utilization should account for STW events. 

### <a id="UtilSweep" href="#UtilSweep">const UtilSweep</a>

```
searchKey: trace.UtilSweep
tags: [constant number]
```

```Go
const UtilSweep
```

UtilSweep means utilization should account for sweeping. 

### <a id="gDead" href="#gDead">const gDead</a>

```
searchKey: trace.gDead
tags: [constant number private]
```

```Go
const gDead gStatus = iota
```

### <a id="gRunnable" href="#gRunnable">const gRunnable</a>

```
searchKey: trace.gRunnable
tags: [constant number private]
```

```Go
const gRunnable
```

### <a id="gRunning" href="#gRunning">const gRunning</a>

```
searchKey: trace.gRunning
tags: [constant number private]
```

```Go
const gRunning
```

### <a id="gWaiting" href="#gWaiting">const gWaiting</a>

```
searchKey: trace.gWaiting
tags: [constant number private]
```

```Go
const gWaiting
```

### <a id="garbage" href="#garbage">const garbage</a>

```
searchKey: trace.garbage
tags: [constant number private]
```

```Go
const garbage = ^uint64(0) - 1
```

### <a id="mudDegree" href="#mudDegree">const mudDegree</a>

```
searchKey: trace.mudDegree
tags: [constant number private]
```

```Go
const mudDegree = 1024
```

mudDegree is the number of buckets in the MUD summary histogram. 

### <a id="noseq" href="#noseq">const noseq</a>

```
searchKey: trace.noseq
tags: [constant number private]
```

```Go
const noseq = ^uint64(0)
```

### <a id="seqinc" href="#seqinc">const seqinc</a>

```
searchKey: trace.seqinc
tags: [constant number private]
```

```Go
const seqinc = ^uint64(0) - 1
```

### <a id="unordered" href="#unordered">const unordered</a>

```
searchKey: trace.unordered
tags: [constant number private]
```

```Go
const unordered = ^uint64(0)
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="BreakTimestampsForTesting" href="#BreakTimestampsForTesting">var BreakTimestampsForTesting</a>

```
searchKey: trace.BreakTimestampsForTesting
tags: [variable boolean]
```

```Go
var BreakTimestampsForTesting bool
```

BreakTimestampsForTesting causes the parser to randomly alter timestamps (for testing of broken cputicks). 

### <a id="ErrTimeOrder" href="#ErrTimeOrder">var ErrTimeOrder</a>

```
searchKey: trace.ErrTimeOrder
tags: [variable interface]
```

```Go
var ErrTimeOrder = fmt.Errorf("time stamps out of order")
```

ErrTimeOrder is returned by Parse when the trace contains time stamps that do not respect actual event ordering. 

### <a id="EventDescriptions" href="#EventDescriptions">var EventDescriptions</a>

```
searchKey: trace.EventDescriptions
tags: [variable array struct]
```

```Go
var EventDescriptions = ...
```

### <a id="bandsPerSeries" href="#bandsPerSeries">var bandsPerSeries</a>

```
searchKey: trace.bandsPerSeries
tags: [variable number private]
```

```Go
var bandsPerSeries = 1000
```

bandsPerSeries is the number of bands to divide each series into. This is only changed by tests. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Event" href="#Event">type Event struct</a>

```
searchKey: trace.Event
tags: [struct]
```

```Go
type Event struct {
	Off   int       // offset in input file (for debugging and error reporting)
	Type  byte      // one of Ev*
	seq   int64     // sequence number
	Ts    int64     // timestamp in nanoseconds
	P     int       // P on which the event happened (can be one of TimerP, NetpollP, SyscallP)
	G     uint64    // G on which the event happened
	StkID uint64    // unique stack ID
	Stk   []*Frame  // stack trace (can be empty)
	Args  [3]uint64 // event-type-specific arguments
	SArgs []string  // event-type-specific string args
	// linked event (can be nil), depends on event type:
	// for GCStart: the GCStop
	// for GCSTWStart: the GCSTWDone
	// for GCSweepStart: the GCSweepDone
	// for GoCreate: first GoStart of the created goroutine
	// for GoStart/GoStartLabel: the associated GoEnd, GoBlock or other blocking event
	// for GoSched/GoPreempt: the next GoStart
	// for GoBlock and other blocking events: the unblock event
	// for GoUnblock: the associated GoStart
	// for blocking GoSysCall: the associated GoSysExit
	// for GoSysExit: the next GoStart
	// for GCMarkAssistStart: the associated GCMarkAssistDone
	// for UserTaskCreate: the UserTaskEnd
	// for UserRegion: if the start region, the corresponding UserRegion end event
	Link *Event
}
```

Event describes one event in the trace. 

#### <a id="Event.String" href="#Event.String">func (ev *Event) String() string</a>

```
searchKey: trace.Event.String
tags: [method]
```

```Go
func (ev *Event) String() string
```

### <a id="Frame" href="#Frame">type Frame struct</a>

```
searchKey: trace.Frame
tags: [struct]
```

```Go
type Frame struct {
	PC   uint64
	Fn   string
	File string
	Line int
}
```

Frame is a frame in stack traces. 

### <a id="GDesc" href="#GDesc">type GDesc struct</a>

```
searchKey: trace.GDesc
tags: [struct]
```

```Go
type GDesc struct {
	ID           uint64
	Name         string
	PC           uint64
	CreationTime int64
	StartTime    int64
	EndTime      int64

	// List of regions in the goroutine, sorted based on the start time.
	Regions []*UserRegionDesc

	// Statistics of execution time during the goroutine execution.
	GExecutionStat

	*gdesc // private part.
}
```

GDesc contains statistics and execution details of a single goroutine. 

#### <a id="GDesc.finalize" href="#GDesc.finalize">func (g *GDesc) finalize(lastTs, activeGCStartTime int64, trigger *Event)</a>

```
searchKey: trace.GDesc.finalize
tags: [method private]
```

```Go
func (g *GDesc) finalize(lastTs, activeGCStartTime int64, trigger *Event)
```

finalize is called when processing a goroutine end event or at the end of trace processing. This finalizes the execution stat and any active regions in the goroutine, in which case trigger is nil. 

#### <a id="GDesc.snapshotStat" href="#GDesc.snapshotStat">func (g *GDesc) snapshotStat(lastTs, activeGCStartTime int64) (ret GExecutionStat)</a>

```
searchKey: trace.GDesc.snapshotStat
tags: [method private]
```

```Go
func (g *GDesc) snapshotStat(lastTs, activeGCStartTime int64) (ret GExecutionStat)
```

snapshotStat returns the snapshot of the goroutine execution statistics. This is called as we process the ordered trace event stream. lastTs and activeGCStartTime are used to process pending statistics if this is called before any goroutine end event. 

### <a id="GExecutionStat" href="#GExecutionStat">type GExecutionStat struct</a>

```
searchKey: trace.GExecutionStat
tags: [struct]
```

```Go
type GExecutionStat struct {
	ExecTime      int64
	SchedWaitTime int64
	IOTime        int64
	BlockTime     int64
	SyscallTime   int64
	GCTime        int64
	SweepTime     int64
	TotalTime     int64
}
```

GExecutionStat contains statistics about a goroutine's execution during a period of time. 

#### <a id="GExecutionStat.sub" href="#GExecutionStat.sub">func (s GExecutionStat) sub(v GExecutionStat) (r GExecutionStat)</a>

```
searchKey: trace.GExecutionStat.sub
tags: [method private]
```

```Go
func (s GExecutionStat) sub(v GExecutionStat) (r GExecutionStat)
```

sub returns the stats v-s. 

### <a id="MMUCurve" href="#MMUCurve">type MMUCurve struct</a>

```
searchKey: trace.MMUCurve
tags: [struct]
```

```Go
type MMUCurve struct {
	series []mmuSeries
}
```

An MMUCurve is the minimum mutator utilization curve across multiple window sizes. 

#### <a id="NewMMUCurve" href="#NewMMUCurve">func NewMMUCurve(utils [][]MutatorUtil) *MMUCurve</a>

```
searchKey: trace.NewMMUCurve
tags: [function]
```

```Go
func NewMMUCurve(utils [][]MutatorUtil) *MMUCurve
```

NewMMUCurve returns an MMU curve for the given mutator utilization function. 

#### <a id="MMUCurve.Examples" href="#MMUCurve.Examples">func (c *MMUCurve) Examples(window time.Duration, n int) (worst []UtilWindow)</a>

```
searchKey: trace.MMUCurve.Examples
tags: [method]
```

```Go
func (c *MMUCurve) Examples(window time.Duration, n int) (worst []UtilWindow)
```

Examples returns n specific examples of the lowest mutator utilization for the given window size. The returned windows will be disjoint (otherwise there would be a huge number of mostly-overlapping windows at the single lowest point). There are no guarantees on which set of disjoint windows this returns. 

#### <a id="MMUCurve.MMU" href="#MMUCurve.MMU">func (c *MMUCurve) MMU(window time.Duration) (mmu float64)</a>

```
searchKey: trace.MMUCurve.MMU
tags: [method]
```

```Go
func (c *MMUCurve) MMU(window time.Duration) (mmu float64)
```

MMU returns the minimum mutator utilization for the given time window. This is the minimum utilization for all windows of this duration across the execution. The returned value is in the range [0, 1]. 

#### <a id="MMUCurve.MUD" href="#MMUCurve.MUD">func (c *MMUCurve) MUD(window time.Duration, quantiles []float64) []float64</a>

```
searchKey: trace.MMUCurve.MUD
tags: [method]
```

```Go
func (c *MMUCurve) MUD(window time.Duration, quantiles []float64) []float64
```

MUD returns mutator utilization distribution quantiles for the given window size. 

The mutator utilization distribution is the distribution of mean mutator utilization across all windows of the given window size in the trace. 

The minimum mutator utilization is the minimum (0th percentile) of this distribution. (However, if only the minimum is desired, it's more efficient to use the MMU method.) 

#### <a id="MMUCurve.mmu" href="#MMUCurve.mmu">func (c *MMUCurve) mmu(window time.Duration, acc *accumulator)</a>

```
searchKey: trace.MMUCurve.mmu
tags: [method private]
```

```Go
func (c *MMUCurve) mmu(window time.Duration, acc *accumulator)
```

### <a id="MutatorUtil" href="#MutatorUtil">type MutatorUtil struct</a>

```
searchKey: trace.MutatorUtil
tags: [struct]
```

```Go
type MutatorUtil struct {
	Time int64
	// Util is the mean mutator utilization starting at Time. This
	// is in the range [0, 1].
	Util float64
}
```

MutatorUtil is a change in mutator utilization at a particular time. Mutator utilization functions are represented as a time-ordered []MutatorUtil. 

### <a id="ParseResult" href="#ParseResult">type ParseResult struct</a>

```
searchKey: trace.ParseResult
tags: [struct]
```

```Go
type ParseResult struct {
	// Events is the sorted list of Events in the trace.
	Events []*Event
	// Stacks is the stack traces keyed by stack IDs from the trace.
	Stacks map[uint64][]*Frame
}
```

ParseResult is the result of Parse. 

#### <a id="Parse" href="#Parse">func Parse(r io.Reader, bin string) (ParseResult, error)</a>

```
searchKey: trace.Parse
tags: [function]
```

```Go
func Parse(r io.Reader, bin string) (ParseResult, error)
```

Parse parses, post-processes and verifies the trace. 

#### <a id="parse" href="#parse">func parse(r io.Reader, bin string) (int, ParseResult, error)</a>

```
searchKey: trace.parse
tags: [function private]
```

```Go
func parse(r io.Reader, bin string) (int, ParseResult, error)
```

parse parses, post-processes and verifies the trace. It returns the trace version and the list of events. 

### <a id="UserRegionDesc" href="#UserRegionDesc">type UserRegionDesc struct</a>

```
searchKey: trace.UserRegionDesc
tags: [struct]
```

```Go
type UserRegionDesc struct {
	TaskID uint64
	Name   string

	// Region start event. Normally EvUserRegion start event or nil,
	// but can be EvGoCreate event if the region is a synthetic
	// region representing task inheritance from the parent goroutine.
	Start *Event

	// Region end event. Normally EvUserRegion end event or nil,
	// but can be EvGoStop or EvGoEnd event if the goroutine
	// terminated without explicitly ending the region.
	End *Event

	GExecutionStat
}
```

UserRegionDesc represents a region and goroutine execution stats while the region was active. 

### <a id="UtilFlags" href="#UtilFlags">type UtilFlags int</a>

```
searchKey: trace.UtilFlags
tags: [number]
```

```Go
type UtilFlags int
```

UtilFlags controls the behavior of MutatorUtilization. 

### <a id="UtilWindow" href="#UtilWindow">type UtilWindow struct</a>

```
searchKey: trace.UtilWindow
tags: [struct]
```

```Go
type UtilWindow struct {
	Time int64
	// MutatorUtil is the mean mutator utilization in this window.
	MutatorUtil float64
}
```

UtilWindow is a specific window at Time. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: trace.Writer
tags: [struct]
```

```Go
type Writer struct {
	bytes.Buffer
}
```

Writer is a test trace writer. 

#### <a id="NewWriter" href="#NewWriter">func NewWriter() *Writer</a>

```
searchKey: trace.NewWriter
tags: [function]
```

```Go
func NewWriter() *Writer
```

#### <a id="Writer.Emit" href="#Writer.Emit">func (w *Writer) Emit(typ byte, args ...uint64)</a>

```
searchKey: trace.Writer.Emit
tags: [method]
```

```Go
func (w *Writer) Emit(typ byte, args ...uint64)
```

Emit writes an event record to the trace. See Event types for valid types and required arguments. 

### <a id="accumulator" href="#accumulator">type accumulator struct</a>

```
searchKey: trace.accumulator
tags: [struct private]
```

```Go
type accumulator struct {
	mmu float64

	// bound is the mutator utilization bound where adding any
	// mutator utilization above this bound cannot affect the
	// accumulated statistics.
	bound float64

	// Worst N window tracking
	nWorst int
	wHeap  utilHeap

	// Mutator utilization distribution tracking
	mud *mud
	// preciseMass is the distribution mass that must be precise
	// before accumulation is stopped.
	preciseMass float64
	// lastTime and lastMU are the previous point added to the
	// windowed mutator utilization function.
	lastTime int64
	lastMU   float64
}
```

An accumulator takes a windowed mutator utilization function and tracks various statistics for that function. 

#### <a id="accumulator.addMU" href="#accumulator.addMU">func (acc *accumulator) addMU(time int64, mu float64, window time.Duration) bool</a>

```
searchKey: trace.accumulator.addMU
tags: [method private]
```

```Go
func (acc *accumulator) addMU(time int64, mu float64, window time.Duration) bool
```

addMU adds a point to the windowed mutator utilization function at (time, mu). This must be called for monotonically increasing values of time. 

It returns true if further calls to addMU would be pointless. 

#### <a id="accumulator.resetTime" href="#accumulator.resetTime">func (acc *accumulator) resetTime()</a>

```
searchKey: trace.accumulator.resetTime
tags: [method private]
```

```Go
func (acc *accumulator) resetTime()
```

resetTime declares a discontinuity in the windowed mutator utilization function by resetting the current time. 

### <a id="bandUtil" href="#bandUtil">type bandUtil struct</a>

```
searchKey: trace.bandUtil
tags: [struct private]
```

```Go
type bandUtil struct {
	// Utilization series index
	series int
	// Band index
	i int
	// Lower bound of mutator utilization for all windows
	// with a left edge in this band.
	utilBound float64
}
```

### <a id="bandUtilHeap" href="#bandUtilHeap">type bandUtilHeap []trace.bandUtil</a>

```
searchKey: trace.bandUtilHeap
tags: [array struct private]
```

```Go
type bandUtilHeap []bandUtil
```

#### <a id="bandUtilHeap.Len" href="#bandUtilHeap.Len">func (h bandUtilHeap) Len() int</a>

```
searchKey: trace.bandUtilHeap.Len
tags: [method private]
```

```Go
func (h bandUtilHeap) Len() int
```

#### <a id="bandUtilHeap.Less" href="#bandUtilHeap.Less">func (h bandUtilHeap) Less(i, j int) bool</a>

```
searchKey: trace.bandUtilHeap.Less
tags: [method private]
```

```Go
func (h bandUtilHeap) Less(i, j int) bool
```

#### <a id="bandUtilHeap.Pop" href="#bandUtilHeap.Pop">func (h *bandUtilHeap) Pop() interface{}</a>

```
searchKey: trace.bandUtilHeap.Pop
tags: [method private]
```

```Go
func (h *bandUtilHeap) Pop() interface{}
```

#### <a id="bandUtilHeap.Push" href="#bandUtilHeap.Push">func (h *bandUtilHeap) Push(x interface{})</a>

```
searchKey: trace.bandUtilHeap.Push
tags: [method private]
```

```Go
func (h *bandUtilHeap) Push(x interface{})
```

#### <a id="bandUtilHeap.Swap" href="#bandUtilHeap.Swap">func (h bandUtilHeap) Swap(i, j int)</a>

```
searchKey: trace.bandUtilHeap.Swap
tags: [method private]
```

```Go
func (h bandUtilHeap) Swap(i, j int)
```

### <a id="edge" href="#edge">type edge struct</a>

```
searchKey: trace.edge
tags: [struct private]
```

```Go
type edge struct {
	// At x, the function increases by y.
	x, delta float64
	// Additionally at x is a Dirac delta function with area dirac.
	dirac float64
}
```

### <a id="eventBatch" href="#eventBatch">type eventBatch struct</a>

```
searchKey: trace.eventBatch
tags: [struct private]
```

```Go
type eventBatch struct {
	events   []*Event
	selected bool
}
```

### <a id="eventList" href="#eventList">type eventList []*trace.Event</a>

```
searchKey: trace.eventList
tags: [array struct private]
```

```Go
type eventList []*Event
```

#### <a id="eventList.Len" href="#eventList.Len">func (l eventList) Len() int</a>

```
searchKey: trace.eventList.Len
tags: [method private]
```

```Go
func (l eventList) Len() int
```

#### <a id="eventList.Less" href="#eventList.Less">func (l eventList) Less(i, j int) bool</a>

```
searchKey: trace.eventList.Less
tags: [method private]
```

```Go
func (l eventList) Less(i, j int) bool
```

#### <a id="eventList.Swap" href="#eventList.Swap">func (l eventList) Swap(i, j int)</a>

```
searchKey: trace.eventList.Swap
tags: [method private]
```

```Go
func (l eventList) Swap(i, j int)
```

### <a id="eventSeqList" href="#eventSeqList">type eventSeqList []*trace.Event</a>

```
searchKey: trace.eventSeqList
tags: [array struct private]
```

```Go
type eventSeqList []*Event
```

#### <a id="eventSeqList.Len" href="#eventSeqList.Len">func (l eventSeqList) Len() int</a>

```
searchKey: trace.eventSeqList.Len
tags: [method private]
```

```Go
func (l eventSeqList) Len() int
```

#### <a id="eventSeqList.Less" href="#eventSeqList.Less">func (l eventSeqList) Less(i, j int) bool</a>

```
searchKey: trace.eventSeqList.Less
tags: [method private]
```

```Go
func (l eventSeqList) Less(i, j int) bool
```

#### <a id="eventSeqList.Swap" href="#eventSeqList.Swap">func (l eventSeqList) Swap(i, j int)</a>

```
searchKey: trace.eventSeqList.Swap
tags: [method private]
```

```Go
func (l eventSeqList) Swap(i, j int)
```

### <a id="gState" href="#gState">type gState struct</a>

```
searchKey: trace.gState
tags: [struct private]
```

```Go
type gState struct {
	seq    uint64
	status gStatus
}
```

#### <a id="stateTransition" href="#stateTransition">func stateTransition(ev *Event) (g uint64, init, next gState)</a>

```
searchKey: trace.stateTransition
tags: [function private]
```

```Go
func stateTransition(ev *Event) (g uint64, init, next gState)
```

stateTransition returns goroutine state (sequence and status) when the event becomes ready for merging (init) and the goroutine state after the event (next). 

### <a id="gStatus" href="#gStatus">type gStatus int</a>

```
searchKey: trace.gStatus
tags: [number private]
```

```Go
type gStatus int
```

### <a id="gdesc" href="#gdesc">type gdesc struct</a>

```
searchKey: trace.gdesc
tags: [struct private]
```

```Go
type gdesc struct {
	lastStartTime    int64
	blockNetTime     int64
	blockSyncTime    int64
	blockSyscallTime int64
	blockSweepTime   int64
	blockGCTime      int64
	blockSchedTime   int64

	activeRegions []*UserRegionDesc // stack of active regions
}
```

gdesc is a private part of GDesc that is required only during analysis. 

### <a id="integrator" href="#integrator">type integrator struct</a>

```
searchKey: trace.integrator
tags: [struct private]
```

```Go
type integrator struct {
	u *mmuSeries
	// pos is the index in u.util of the current time's non-strict
	// predecessor.
	pos int
}
```

An integrator tracks a position in a utilization function and integrates it. 

#### <a id="integrator.advance" href="#integrator.advance">func (in *integrator) advance(time int64) totalUtil</a>

```
searchKey: trace.integrator.advance
tags: [method private]
```

```Go
func (in *integrator) advance(time int64) totalUtil
```

advance returns the integral of the utilization function from 0 to time. advance must be called on monotonically increasing values of times. 

#### <a id="integrator.next" href="#integrator.next">func (in *integrator) next(time int64) int64</a>

```
searchKey: trace.integrator.next
tags: [method private]
```

```Go
func (in *integrator) next(time int64) int64
```

next returns the smallest time t' > time of a change in the utilization function. 

### <a id="mmuBand" href="#mmuBand">type mmuBand struct</a>

```
searchKey: trace.mmuBand
tags: [struct private]
```

```Go
type mmuBand struct {
	// minUtil is the minimum instantaneous mutator utilization in
	// this band.
	minUtil float64
	// cumUtil is the cumulative total mutator utilization between
	// time 0 and the left edge of this band.
	cumUtil totalUtil

	// integrator is the integrator for the left edge of this
	// band.
	integrator integrator
}
```

### <a id="mmuSeries" href="#mmuSeries">type mmuSeries struct</a>

```
searchKey: trace.mmuSeries
tags: [struct private]
```

```Go
type mmuSeries struct {
	util []MutatorUtil
	// sums[j] is the cumulative sum of util[:j].
	sums []totalUtil
	// bands summarizes util in non-overlapping bands of duration
	// bandDur.
	bands []mmuBand
	// bandDur is the duration of each band.
	bandDur int64
}
```

#### <a id="newMMUSeries" href="#newMMUSeries">func newMMUSeries(util []MutatorUtil) mmuSeries</a>

```
searchKey: trace.newMMUSeries
tags: [function private]
```

```Go
func newMMUSeries(util []MutatorUtil) mmuSeries
```

#### <a id="mmuSeries.bandMMU" href="#mmuSeries.bandMMU">func (c *mmuSeries) bandMMU(bandIdx int, window time.Duration, acc *accumulator)</a>

```
searchKey: trace.mmuSeries.bandMMU
tags: [method private]
```

```Go
func (c *mmuSeries) bandMMU(bandIdx int, window time.Duration, acc *accumulator)
```

bandMMU computes the precise minimum mutator utilization for windows with a left edge in band bandIdx. 

#### <a id="mmuSeries.bandTime" href="#mmuSeries.bandTime">func (s *mmuSeries) bandTime(i int) (start, end int64)</a>

```
searchKey: trace.mmuSeries.bandTime
tags: [method private]
```

```Go
func (s *mmuSeries) bandTime(i int) (start, end int64)
```

#### <a id="mmuSeries.mkBandUtil" href="#mmuSeries.mkBandUtil">func (c *mmuSeries) mkBandUtil(series int, window time.Duration) []bandUtil</a>

```
searchKey: trace.mmuSeries.mkBandUtil
tags: [method private]
```

```Go
func (c *mmuSeries) mkBandUtil(series int, window time.Duration) []bandUtil
```

### <a id="mud" href="#mud">type mud struct</a>

```
searchKey: trace.mud
tags: [struct private]
```

```Go
type mud struct {
	sorted, unsorted []edge

	// trackMass is the inverse cumulative sum to track as the
	// distribution is updated.
	trackMass float64
	// trackBucket is the bucket in which trackMass falls. If the
	// total mass of the distribution is < trackMass, this is
	// len(hist).
	trackBucket int
	// trackSum is the cumulative sum of hist[:trackBucket]. Once
	// trackSum >= trackMass, trackBucket must be recomputed.
	trackSum float64

	// hist is a hierarchical histogram of distribution mass.
	hist [mudDegree]float64
}
```

mud is an updatable mutator utilization distribution. 

This is a continuous distribution of duration over mutator utilization. For example, the integral from mutator utilization a to b is the total duration during which the mutator utilization was in the range [a, b]. 

This distribution is *not* normalized (it is not a probability distribution). This makes it easier to work with as it's being updated. 

It is represented as the sum of scaled uniform distribution functions and Dirac delta functions (which are treated as degenerate uniform distributions). 

#### <a id="mud.add" href="#mud.add">func (d *mud) add(l, r, area float64)</a>

```
searchKey: trace.mud.add
tags: [method private]
```

```Go
func (d *mud) add(l, r, area float64)
```

add adds a uniform function over [l, r] scaled so the total weight of the uniform is area. If l==r, this adds a Dirac delta function. 

#### <a id="mud.approxInvCumulativeSum" href="#mud.approxInvCumulativeSum">func (d *mud) approxInvCumulativeSum() (float64, float64, bool)</a>

```
searchKey: trace.mud.approxInvCumulativeSum
tags: [method private]
```

```Go
func (d *mud) approxInvCumulativeSum() (float64, float64, bool)
```

approxInvCumulativeSum is like invCumulativeSum, but specifically operates on the tracked mass and returns an upper and lower bound approximation of the inverse cumulative sum. 

The true inverse cumulative sum will be in the range [lower, upper). 

#### <a id="mud.invCumulativeSum" href="#mud.invCumulativeSum">func (d *mud) invCumulativeSum(y float64) (float64, bool)</a>

```
searchKey: trace.mud.invCumulativeSum
tags: [method private]
```

```Go
func (d *mud) invCumulativeSum(y float64) (float64, bool)
```

invCumulativeSum returns x such that the integral of d from -∞ to x is y. If the total weight of d is less than y, it returns the maximum of the distribution and false. 

Specifically, y is a cumulative duration, and invCumulativeSum returns the mutator utilization x such that at least y time has been spent with mutator utilization <= x. 

#### <a id="mud.setTrackMass" href="#mud.setTrackMass">func (d *mud) setTrackMass(mass float64)</a>

```
searchKey: trace.mud.setTrackMass
tags: [method private]
```

```Go
func (d *mud) setTrackMass(mass float64)
```

setTrackMass sets the mass to track the inverse cumulative sum for. 

Specifically, mass is a cumulative duration, and the mutator utilization bounds for this duration can be queried using approxInvCumulativeSum. 

### <a id="orderEvent" href="#orderEvent">type orderEvent struct</a>

```
searchKey: trace.orderEvent
tags: [struct private]
```

```Go
type orderEvent struct {
	ev    *Event
	batch int
	g     uint64
	init  gState
	next  gState
}
```

### <a id="orderEventList" href="#orderEventList">type orderEventList []trace.orderEvent</a>

```
searchKey: trace.orderEventList
tags: [array struct private]
```

```Go
type orderEventList []orderEvent
```

#### <a id="orderEventList.Len" href="#orderEventList.Len">func (l orderEventList) Len() int</a>

```
searchKey: trace.orderEventList.Len
tags: [method private]
```

```Go
func (l orderEventList) Len() int
```

#### <a id="orderEventList.Less" href="#orderEventList.Less">func (l orderEventList) Less(i, j int) bool</a>

```
searchKey: trace.orderEventList.Less
tags: [method private]
```

```Go
func (l orderEventList) Less(i, j int) bool
```

#### <a id="orderEventList.Swap" href="#orderEventList.Swap">func (l orderEventList) Swap(i, j int)</a>

```
searchKey: trace.orderEventList.Swap
tags: [method private]
```

```Go
func (l orderEventList) Swap(i, j int)
```

### <a id="rawEvent" href="#rawEvent">type rawEvent struct</a>

```
searchKey: trace.rawEvent
tags: [struct private]
```

```Go
type rawEvent struct {
	off   int
	typ   byte
	args  []uint64
	sargs []string
}
```

rawEvent is a helper type used during parsing. 

### <a id="totalUtil" href="#totalUtil">type totalUtil float64</a>

```
searchKey: trace.totalUtil
tags: [number private]
```

```Go
type totalUtil float64
```

totalUtil is total utilization, measured in nanoseconds. This is a separate type primarily to distinguish it from mean utilization, which is also a float64. 

#### <a id="totalUtilOf" href="#totalUtilOf">func totalUtilOf(meanUtil float64, dur int64) totalUtil</a>

```
searchKey: trace.totalUtilOf
tags: [function private]
```

```Go
func totalUtilOf(meanUtil float64, dur int64) totalUtil
```

#### <a id="totalUtil.mean" href="#totalUtil.mean">func (u totalUtil) mean(dur time.Duration) float64</a>

```
searchKey: trace.totalUtil.mean
tags: [method private]
```

```Go
func (u totalUtil) mean(dur time.Duration) float64
```

mean returns the mean utilization over dur. 

### <a id="utilHeap" href="#utilHeap">type utilHeap []trace.UtilWindow</a>

```
searchKey: trace.utilHeap
tags: [array struct private]
```

```Go
type utilHeap []UtilWindow
```

#### <a id="utilHeap.Len" href="#utilHeap.Len">func (h utilHeap) Len() int</a>

```
searchKey: trace.utilHeap.Len
tags: [method private]
```

```Go
func (h utilHeap) Len() int
```

#### <a id="utilHeap.Less" href="#utilHeap.Less">func (h utilHeap) Less(i, j int) bool</a>

```
searchKey: trace.utilHeap.Less
tags: [method private]
```

```Go
func (h utilHeap) Less(i, j int) bool
```

#### <a id="utilHeap.Pop" href="#utilHeap.Pop">func (h *utilHeap) Pop() interface{}</a>

```
searchKey: trace.utilHeap.Pop
tags: [method private]
```

```Go
func (h *utilHeap) Pop() interface{}
```

#### <a id="utilHeap.Push" href="#utilHeap.Push">func (h *utilHeap) Push(x interface{})</a>

```
searchKey: trace.utilHeap.Push
tags: [method private]
```

```Go
func (h *utilHeap) Push(x interface{})
```

#### <a id="utilHeap.Swap" href="#utilHeap.Swap">func (h utilHeap) Swap(i, j int)</a>

```
searchKey: trace.utilHeap.Swap
tags: [method private]
```

```Go
func (h utilHeap) Swap(i, j int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkMMU" href="#BenchmarkMMU">func BenchmarkMMU(b *testing.B)</a>

```
searchKey: trace.BenchmarkMMU
tags: [function private benchmark]
```

```Go
func BenchmarkMMU(b *testing.B)
```

### <a id="GoroutineStats" href="#GoroutineStats">func GoroutineStats(events []*Event) map[uint64]*GDesc</a>

```
searchKey: trace.GoroutineStats
tags: [function]
```

```Go
func GoroutineStats(events []*Event) map[uint64]*GDesc
```

GoroutineStats generates statistics for all goroutines in the trace. 

### <a id="MutatorUtilization" href="#MutatorUtilization">func MutatorUtilization(events []*Event, flags UtilFlags) [][]MutatorUtil</a>

```
searchKey: trace.MutatorUtilization
tags: [function]
```

```Go
func MutatorUtilization(events []*Event, flags UtilFlags) [][]MutatorUtil
```

MutatorUtilization returns a set of mutator utilization functions for the given trace. Each function will always end with 0 utilization. The bounds of each function are implicit in the first and last event; outside of these bounds each function is undefined. 

If the UtilPerProc flag is not given, this always returns a single utilization function. Otherwise, it returns one function per P. 

### <a id="Print" href="#Print">func Print(events []*Event)</a>

```
searchKey: trace.Print
tags: [function]
```

```Go
func Print(events []*Event)
```

Print dumps events to stdout. For debugging. 

### <a id="PrintEvent" href="#PrintEvent">func PrintEvent(ev *Event)</a>

```
searchKey: trace.PrintEvent
tags: [function]
```

```Go
func PrintEvent(ev *Event)
```

PrintEvent dumps the event to stdout. For debugging. 

### <a id="RelatedGoroutines" href="#RelatedGoroutines">func RelatedGoroutines(events []*Event, goid uint64) map[uint64]bool</a>

```
searchKey: trace.RelatedGoroutines
tags: [function]
```

```Go
func RelatedGoroutines(events []*Event, goid uint64) map[uint64]bool
```

RelatedGoroutines finds a set of goroutines related to goroutine goid. 

### <a id="TestCorruptedInputs" href="#TestCorruptedInputs">func TestCorruptedInputs(t *testing.T)</a>

```
searchKey: trace.TestCorruptedInputs
tags: [function private test]
```

```Go
func TestCorruptedInputs(t *testing.T)
```

### <a id="TestMMU" href="#TestMMU">func TestMMU(t *testing.T)</a>

```
searchKey: trace.TestMMU
tags: [function private test]
```

```Go
func TestMMU(t *testing.T)
```

### <a id="TestMMUTrace" href="#TestMMUTrace">func TestMMUTrace(t *testing.T)</a>

```
searchKey: trace.TestMMUTrace
tags: [function private test]
```

```Go
func TestMMUTrace(t *testing.T)
```

### <a id="TestMUD" href="#TestMUD">func TestMUD(t *testing.T)</a>

```
searchKey: trace.TestMUD
tags: [function private test]
```

```Go
func TestMUD(t *testing.T)
```

### <a id="TestMUDTracking" href="#TestMUDTracking">func TestMUDTracking(t *testing.T)</a>

```
searchKey: trace.TestMUDTracking
tags: [function private test]
```

```Go
func TestMUDTracking(t *testing.T)
```

### <a id="TestParseCanned" href="#TestParseCanned">func TestParseCanned(t *testing.T)</a>

```
searchKey: trace.TestParseCanned
tags: [function private test]
```

```Go
func TestParseCanned(t *testing.T)
```

### <a id="TestParseVersion" href="#TestParseVersion">func TestParseVersion(t *testing.T)</a>

```
searchKey: trace.TestParseVersion
tags: [function private test]
```

```Go
func TestParseVersion(t *testing.T)
```

### <a id="TestTimestampOverflow" href="#TestTimestampOverflow">func TestTimestampOverflow(t *testing.T)</a>

```
searchKey: trace.TestTimestampOverflow
tags: [function private test]
```

```Go
func TestTimestampOverflow(t *testing.T)
```

### <a id="addUtil" href="#addUtil">func addUtil(util []MutatorUtil, mu MutatorUtil) []MutatorUtil</a>

```
searchKey: trace.addUtil
tags: [function private]
```

```Go
func addUtil(util []MutatorUtil, mu MutatorUtil) []MutatorUtil
```

### <a id="aeq" href="#aeq">func aeq(x, y float64) bool</a>

```
searchKey: trace.aeq
tags: [function private]
```

```Go
func aeq(x, y float64) bool
```

aeq returns true if x and y are equal up to 8 digits (1 part in 100 million). 

### <a id="appendVarint" href="#appendVarint">func appendVarint(buf []byte, v uint64) []byte</a>

```
searchKey: trace.appendVarint
tags: [function private]
```

```Go
func appendVarint(buf []byte, v uint64) []byte
```

### <a id="argNum" href="#argNum">func argNum(raw rawEvent, ver int) int</a>

```
searchKey: trace.argNum
tags: [function private]
```

```Go
func argNum(raw rawEvent, ver int) int
```

argNum returns total number of args for the event accounting for timestamps, sequence numbers and differences between trace format versions. 

### <a id="goCmd" href="#goCmd">func goCmd() string</a>

```
searchKey: trace.goCmd
tags: [function private]
```

```Go
func goCmd() string
```

### <a id="mmuSlow" href="#mmuSlow">func mmuSlow(util []MutatorUtil, window time.Duration) (mmu float64)</a>

```
searchKey: trace.mmuSlow
tags: [function private]
```

```Go
func mmuSlow(util []MutatorUtil, window time.Duration) (mmu float64)
```

### <a id="order1005" href="#order1005">func order1005(m map[int][]*Event) (events []*Event, err error)</a>

```
searchKey: trace.order1005
tags: [function private]
```

```Go
func order1005(m map[int][]*Event) (events []*Event, err error)
```

order1005 merges a set of per-P event batches into a single, consistent stream. 

### <a id="order1007" href="#order1007">func order1007(m map[int][]*Event) (events []*Event, err error)</a>

```
searchKey: trace.order1007
tags: [function private]
```

```Go
func order1007(m map[int][]*Event) (events []*Event, err error)
```

order1007 merges a set of per-P event batches into a single, consistent stream. The high level idea is as follows. Events within an individual batch are in correct order, because they are emitted by a single P. So we need to produce a correct interleaving of the batches. To do this we take first unmerged event from each batch (frontier). Then choose subset that is "ready" to be merged, that is, events for which all dependencies are already merged. Then we choose event with the lowest timestamp from the subset, merge it and repeat. This approach ensures that we form a consistent stream even if timestamps are incorrect (condition observed on some machines). 

### <a id="parseEvents" href="#parseEvents">func parseEvents(ver int, rawEvents []rawEvent, strings map[uint64]string) (events []*Event, stacks map[uint64][]*Frame, err error)</a>

```
searchKey: trace.parseEvents
tags: [function private]
```

```Go
func parseEvents(ver int, rawEvents []rawEvent, strings map[uint64]string) (events []*Event, stacks map[uint64][]*Frame, err error)
```

Parse events transforms raw events into events. It does analyze and verify per-event-type arguments. 

### <a id="parseHeader" href="#parseHeader">func parseHeader(buf []byte) (int, error)</a>

```
searchKey: trace.parseHeader
tags: [function private]
```

```Go
func parseHeader(buf []byte) (int, error)
```

parseHeader parses trace header of the form "go 1.7 trace\x00\x00\x00\x00" and returns parsed version as 1007. 

### <a id="postProcessTrace" href="#postProcessTrace">func postProcessTrace(ver int, events []*Event) error</a>

```
searchKey: trace.postProcessTrace
tags: [function private]
```

```Go
func postProcessTrace(ver int, events []*Event) error
```

postProcessTrace does inter-event verification and information restoration. The resulting trace is guaranteed to be consistent (for example, a P does not run two Gs at the same time, or a G is indeed blocked before an unblock event). 

### <a id="readStr" href="#readStr">func readStr(r io.Reader, off0 int) (s string, off int, err error)</a>

```
searchKey: trace.readStr
tags: [function private]
```

```Go
func readStr(r io.Reader, off0 int) (s string, off int, err error)
```

### <a id="readTrace" href="#readTrace">func readTrace(r io.Reader) (ver int, events []rawEvent, strings map[uint64]string, err error)</a>

```
searchKey: trace.readTrace
tags: [function private]
```

```Go
func readTrace(r io.Reader) (ver int, events []rawEvent, strings map[uint64]string, err error)
```

readTrace does wire-format parsing and verification. It does not care about specific event types and argument meaning. 

### <a id="readVal" href="#readVal">func readVal(r io.Reader, off0 int) (v uint64, off int, err error)</a>

```
searchKey: trace.readVal
tags: [function private]
```

```Go
func readVal(r io.Reader, off0 int) (v uint64, off int, err error)
```

readVal reads unsigned base-128 value from r. 

### <a id="removeFutile" href="#removeFutile">func removeFutile(events []*Event) []*Event</a>

```
searchKey: trace.removeFutile
tags: [function private]
```

```Go
func removeFutile(events []*Event) []*Event
```

removeFutile removes all constituents of futile wakeups (block, unblock, start). For example, a goroutine was unblocked on a mutex, but another goroutine got ahead and acquired the mutex before the first goroutine is scheduled, so the first goroutine has to block again. Such wakeups happen on buffered channels and sync.Mutex, but are generally not interesting for end user. 

### <a id="symbolize" href="#symbolize">func symbolize(events []*Event, bin string) error</a>

```
searchKey: trace.symbolize
tags: [function private]
```

```Go
func symbolize(events []*Event, bin string) error
```

symbolize attaches func/file/line info to stack traces. 

### <a id="transition" href="#transition">func transition(gs map[uint64]gState, g uint64, init, next gState)</a>

```
searchKey: trace.transition
tags: [function private]
```

```Go
func transition(gs map[uint64]gState, g uint64, init, next gState)
```

### <a id="transitionReady" href="#transitionReady">func transitionReady(g uint64, curr, init gState) bool</a>

```
searchKey: trace.transitionReady
tags: [function private]
```

```Go
func transitionReady(g uint64, curr, init gState) bool
```

