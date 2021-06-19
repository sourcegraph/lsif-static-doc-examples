# Package runtime_test

## Index

* [Constants](#const)
    * [const typeScalar](#typeScalar)
    * [const typePointer](#typePointer)
    * [const hashSize](#hashSize)
    * [const size](#size)
    * [const objsize](#objsize)
    * [const helloSource](#helloSource)
    * [const backtraceSource](#backtraceSource)
    * [const autotmpTypeSource](#autotmpTypeSource)
    * [const constsSource](#constsSource)
    * [const panicSource](#panicSource)
    * [const InfCallstackSource](#InfCallstackSource)
    * [const lldbHelloSource](#lldbHelloSource)
    * [const lldbScriptSource](#lldbScriptSource)
    * [const expectedLldbOutput](#expectedLldbOutput)
    * [const N](#N)
    * [const sizeNoStack](#sizeNoStack)
    * [const intSize](#intSize)
* [Variables](#var)
    * [var alwaysFalse](#alwaysFalse)
    * [var workSink](#workSink)
    * [var s](#s)
    * [var ss](#ss)
    * [var result](#result)
    * [var toRemove](#toRemove)
    * [var testprog](#testprog)
    * [var concurrentMapTest](#concurrentMapTest)
    * [var sigquit](#sigquit)
    * [var glob](#glob)
    * [var list](#list)
    * [var globint1](#globint1)
    * [var globint2](#globint2)
    * [var globint3](#globint3)
    * [var saveInt](#saveInt)
    * [var globstruct](#globstruct)
    * [var hugeSink](#hugeSink)
    * [var pointerClassSink](#pointerClassSink)
    * [var pointerClassData](#pointerClassData)
    * [var a](#a)
    * [var gcinfoSink](#gcinfoSink)
    * [var infoPtr](#infoPtr)
    * [var infoPtr10](#infoPtr10)
    * [var infoScalarPtr](#infoScalarPtr)
    * [var infoScalarPtr4](#infoScalarPtr4)
    * [var infoPtrScalar](#infoPtrScalar)
    * [var bssPtr](#bssPtr)
    * [var bssScalarPtr](#bssScalarPtr)
    * [var bssPtrScalar](#bssPtrScalar)
    * [var bssBigStruct](#bssBigStruct)
    * [var bssString](#bssString)
    * [var bssSlice](#bssSlice)
    * [var bssEface](#bssEface)
    * [var bssIface](#bssIface)
    * [var dataPtr](#dataPtr)
    * [var dataScalarPtr](#dataScalarPtr)
    * [var dataPtrScalar](#dataPtrScalar)
    * [var dataBigStruct](#dataBigStruct)
    * [var dataString](#dataString)
    * [var dataSlice](#dataSlice)
    * [var dataEface](#dataEface)
    * [var dataIface](#dataIface)
    * [var infoString](#infoString)
    * [var infoSlice](#infoSlice)
    * [var infoEface](#infoEface)
    * [var infoIface](#infoIface)
    * [var sink](#sink)
    * [var dummyTimeHistogram](#dummyTimeHistogram)
    * [var e](#e)
    * [var e_](#e_)
    * [var i1](#i1)
    * [var i2](#i2)
    * [var ts](#ts)
    * [var tm](#tm)
    * [var tl](#tl)
    * [var ok](#ok)
    * [var eight8](#eight8)
    * [var eight8I](#eight8I)
    * [var yes](#yes)
    * [var zero16](#zero16)
    * [var zero16I](#zero16I)
    * [var one16](#one16)
    * [var thousand16](#thousand16)
    * [var zero32](#zero32)
    * [var zero32I](#zero32I)
    * [var one32](#one32)
    * [var thousand32](#thousand32)
    * [var zero64](#zero64)
    * [var zero64I](#zero64I)
    * [var one64](#one64)
    * [var thousand64](#thousand64)
    * [var zerostr](#zerostr)
    * [var zerostrI](#zerostrI)
    * [var nzstr](#nzstr)
    * [var zeroslice](#zeroslice)
    * [var zerosliceI](#zerosliceI)
    * [var nzslice](#nzslice)
    * [var zerobig](#zerobig)
    * [var nzbig](#nzbig)
    * [var global](#global)
    * [var stress](#stress)
    * [var testMemStatsCount](#testMemStatsCount)
    * [var tinyByteSink](#tinyByteSink)
    * [var tinyUint32Sink](#tinyUint32Sink)
    * [var tinyObj12Sink](#tinyObj12Sink)
    * [var arenaCollisionSink](#arenaCollisionSink)
    * [var mallocSink](#mallocSink)
    * [var n](#n)
    * [var BoolSink](#BoolSink)
    * [var hintLessThan8](#hintLessThan8)
    * [var hintGreaterThan8](#hintGreaterThan8)
    * [var sinkAppend](#sinkAppend)
    * [var mapSink](#mapSink)
    * [var mapBucketTests](#mapBucketTests)
    * [var testNonEscapingMapVariable](#testNonEscapingMapVariable)
    * [var bufSizes](#bufSizes)
    * [var bufSizesOverlap](#bufSizesOverlap)
    * [var xsglobal](#xsglobal)
    * [var ssglobal](#ssglobal)
    * [var Foo2](#Foo2)
    * [var Foo1](#Foo1)
    * [var wg](#wg)
    * [var stop](#stop)
    * [var preempt](#preempt)
    * [var padData](#padData)
    * [var sysNanosleep](#sysNanosleep)
    * [var sink32](#sink32)
    * [var lldbPath](#lldbPath)
    * [var flagQuick](#flagQuick)
    * [var errf](#errf)
    * [var efaceCmp1](#efaceCmp1)
    * [var efaceCmp2](#efaceCmp2)
    * [var faultAddrs](#faultAddrs)
    * [var One](#One)
    * [var SinkIntSlice](#SinkIntSlice)
    * [var SinkIntPointerSlice](#SinkIntPointerSlice)
    * [var blackhole](#blackhole)
    * [var x](#x)
    * [var sByte](#sByte)
    * [var s1Ptr](#s1Ptr)
    * [var s2Ptr](#s2Ptr)
    * [var s3Ptr](#s3Ptr)
    * [var s4Ptr](#s4Ptr)
    * [var nerr](#nerr)
    * [var escapeMe](#escapeMe)
    * [var escapeString](#escapeString)
    * [var stringdata](#stringdata)
    * [var sinkInt](#sinkInt)
    * [var atoi64tests](#atoi64tests)
    * [var atoi32tests](#atoi32tests)
    * [var firstLine](#firstLine)
    * [var lineVar1](#lineVar1)
    * [var lineVar2a](#lineVar2a)
    * [var lineVar2b](#lineVar2b)
    * [var compLit](#compLit)
    * [var arrayLit](#arrayLit)
    * [var sliceLit](#sliceLit)
    * [var mapLit](#mapLit)
    * [var intLit](#intLit)
    * [var l38](#l38)
    * [var l39](#l39)
    * [var l40](#l40)
    * [var dummy](#dummy)
    * [var testTracebackArgsBuf](#testTracebackArgsBuf)
* [Types](#type)
    * [type struct0 struct{}](#struct0)
    * [type response struct{}](#response)
        * [func doRequest(useSelect bool) (*response, error)](#doRequest)
    * [type myError struct{}](#myError)
        * [func (myError) Error() string](#myError.Error)
    * [type buildexe struct](#buildexe)
    * [type point struct](#point)
        * [func (p *point) negate()](#point.negate)
    * [type nonSSAable [128]byte](#nonSSAable)
        * [func mknonSSAable() nonSSAable](#mknonSSAable)
    * [type bigStruct struct](#bigStruct)
    * [type containsBigStruct struct](#containsBigStruct)
        * [func sideeffect2(in containsBigStruct) containsBigStruct](#sideeffect2)
    * [type foo struct{}](#foo)
        * [func (f *foo) method1()](#foo.method1)
        * [func (f *foo) method2()](#foo.method2)
    * [type Node1 struct](#Node1)
    * [type Node8 struct](#Node8)
    * [type Node64 struct](#Node64)
    * [type Node64Dead struct](#Node64Dead)
    * [type Node124 struct](#Node124)
    * [type Node126 struct](#Node126)
    * [type Node128 struct](#Node128)
    * [type Node130 struct](#Node130)
    * [type Node1024 struct](#Node1024)
    * [type Ptr struct](#Ptr)
    * [type ScalarPtr struct](#ScalarPtr)
    * [type PtrScalar struct](#PtrScalar)
    * [type BigStruct struct](#BigStruct)
    * [type Iface interface](#Iface)
    * [type IfaceImpl int](#IfaceImpl)
        * [func (IfaceImpl) f()](#IfaceImpl.f)
    * [type HashSet struct](#HashSet)
        * [func newHashSet() *HashSet](#newHashSet)
        * [func (s *HashSet) add(h uintptr)](#HashSet.add)
        * [func (s *HashSet) addS(x string)](#HashSet.addS)
        * [func (s *HashSet) addB(x []byte)](#HashSet.addB)
        * [func (s *HashSet) addS_seed(x string, seed uintptr)](#HashSet.addS_seed)
        * [func (s *HashSet) check(t *testing.T)](#HashSet.check)
    * [type Key interface](#Key)
    * [type BytesKey struct](#BytesKey)
        * [func (k *BytesKey) clear()](#BytesKey.clear)
        * [func (k *BytesKey) random(r *rand.Rand)](#BytesKey.random)
        * [func (k *BytesKey) bits() int](#BytesKey.bits)
        * [func (k *BytesKey) flipBit(i int)](#BytesKey.flipBit)
        * [func (k *BytesKey) hash() uintptr](#BytesKey.hash)
        * [func (k *BytesKey) name() string](#BytesKey.name)
    * [type Int32Key struct](#Int32Key)
        * [func (k *Int32Key) clear()](#Int32Key.clear)
        * [func (k *Int32Key) random(r *rand.Rand)](#Int32Key.random)
        * [func (k *Int32Key) bits() int](#Int32Key.bits)
        * [func (k *Int32Key) flipBit(i int)](#Int32Key.flipBit)
        * [func (k *Int32Key) hash() uintptr](#Int32Key.hash)
        * [func (k *Int32Key) name() string](#Int32Key.name)
    * [type Int64Key struct](#Int64Key)
        * [func (k *Int64Key) clear()](#Int64Key.clear)
        * [func (k *Int64Key) random(r *rand.Rand)](#Int64Key.random)
        * [func (k *Int64Key) bits() int](#Int64Key.bits)
        * [func (k *Int64Key) flipBit(i int)](#Int64Key.flipBit)
        * [func (k *Int64Key) hash() uintptr](#Int64Key.hash)
        * [func (k *Int64Key) name() string](#Int64Key.name)
    * [type EfaceKey struct](#EfaceKey)
        * [func (k *EfaceKey) clear()](#EfaceKey.clear)
        * [func (k *EfaceKey) random(r *rand.Rand)](#EfaceKey.random)
        * [func (k *EfaceKey) bits() int](#EfaceKey.bits)
        * [func (k *EfaceKey) flipBit(i int)](#EfaceKey.flipBit)
        * [func (k *EfaceKey) hash() uintptr](#EfaceKey.hash)
        * [func (k *EfaceKey) name() string](#EfaceKey.name)
    * [type IfaceKey struct](#IfaceKey)
        * [func (k *IfaceKey) clear()](#IfaceKey.clear)
        * [func (k *IfaceKey) random(r *rand.Rand)](#IfaceKey.random)
        * [func (k *IfaceKey) bits() int](#IfaceKey.bits)
        * [func (k *IfaceKey) flipBit(i int)](#IfaceKey.flipBit)
        * [func (k *IfaceKey) hash() uintptr](#IfaceKey.hash)
        * [func (k *IfaceKey) name() string](#IfaceKey.name)
    * [type fInter uint64](#fInter)
        * [func (x fInter) F()](#fInter.F)
    * [type I1 interface](#I1)
    * [type I2 interface](#I2)
    * [type TS uint16](#TS)
        * [func (TS) Method1()](#TS.Method1)
        * [func (TS) Method2()](#TS.Method2)
    * [type TM uintptr](#TM)
        * [func (TM) Method1()](#TM.Method1)
        * [func (TM) Method2()](#TM.Method2)
    * [type TL [2]uintptr](#TL)
        * [func (TL) Method1()](#TL.Method1)
        * [func (TL) Method2()](#TL.Method2)
    * [type T8 uint8](#T8)
        * [func (T8) Method1()](#T8.Method1)
    * [type T16 uint16](#T16)
        * [func (T16) Method1()](#T16.Method1)
    * [type T32 uint32](#T32)
        * [func (T32) Method1()](#T32.Method1)
    * [type T64 uint64](#T64)
        * [func (T64) Method1()](#T64.Method1)
    * [type Tstr string](#Tstr)
        * [func (Tstr) Method1()](#Tstr.Method1)
    * [type Tslice []byte](#Tslice)
        * [func (Tslice) Method1()](#Tslice.Method1)
    * [type MyNode struct](#MyNode)
        * [func toMyNode(node *LFNode) *MyNode](#toMyNode)
    * [type obj12 struct](#obj12)
    * [type acLink struct](#acLink)
    * [type LargeStruct struct](#LargeStruct)
    * [type chunk [17]byte](#chunk)
    * [type BigKey [3]int64](#BigKey)
    * [type BigVal [3]int64](#BigVal)
    * [type ComplexAlgKey struct](#ComplexAlgKey)
    * [type FloatInt struct](#FloatInt)
    * [type empty struct{}](#empty)
    * [type canString int](#canString)
        * [func (c canString) String() string](#canString.String)
    * [type Tintptr *int](#Tintptr)
    * [type Tint int](#Tint)
        * [func (t *Tint) m()](#Tint.m)
    * [type Tinter interface](#Tinter)
    * [type bigValue struct](#bigValue)
    * [type objtype [320]byte](#objtype)
        * [func adjChunks() (*objtype, *objtype)](#adjChunks)
        * [func adjStringChunk() (string, *objtype)](#adjStringChunk)
    * [type Object1 struct](#Object1)
    * [type Object2 struct](#Object2)
    * [type Matrix [][]float64](#Matrix)
        * [func makeMatrix(n int) Matrix](#makeMatrix)
    * [type struct24 struct](#struct24)
    * [type struct32 struct](#struct32)
    * [type struct40 struct](#struct40)
    * [type bigBuf [4096]byte](#bigBuf)
    * [type xtreeNode struct](#xtreeNode)
        * [func makeTree(d int) *xtreeNode](#makeTree)
    * [type structWithMethod struct{}](#structWithMethod)
        * [func (s structWithMethod) caller() string](#structWithMethod.caller)
        * [func (s structWithMethod) callers() []uintptr](#structWithMethod.callers)
        * [func (s structWithMethod) stack() string](#structWithMethod.stack)
        * [func (s structWithMethod) nop()](#structWithMethod.nop)
    * [type I interface](#I)
    * [type atoi64Test struct](#atoi64Test)
    * [type atoi32Test struct](#atoi32Test)
    * [type fakeTimeFrame struct](#fakeTimeFrame)
* [Functions](#func)
    * [func f1(pan bool) []uintptr](#f1)
    * [func f2(pan bool) []uintptr](#f2)
    * [func f3(pan bool) []uintptr](#f3)
    * [func testCallers(t *testing.T, pcs []uintptr, pan bool)](#testCallers)
    * [func testCallersEqual(t *testing.T, pcs []uintptr, want []string)](#testCallersEqual)
    * [func TestCallers(t *testing.T)](#TestCallers)
    * [func TestCallersPanic(t *testing.T)](#TestCallersPanic)
    * [func TestCallersDoublePanic(t *testing.T)](#TestCallersDoublePanic)
    * [func TestCallersAfterRecovery(t *testing.T)](#TestCallersAfterRecovery)
    * [func TestCallersAbortedPanic(t *testing.T)](#TestCallersAbortedPanic)
    * [func TestCallersAbortedPanic2(t *testing.T)](#TestCallersAbortedPanic2)
    * [func TestCallersNilPointerPanic(t *testing.T)](#TestCallersNilPointerPanic)
    * [func TestCallersDivZeroPanic(t *testing.T)](#TestCallersDivZeroPanic)
    * [func TestCallersDeferNilFuncPanic(t *testing.T)](#TestCallersDeferNilFuncPanic)
    * [func TestCallersDeferNilFuncPanicWithLoop(t *testing.T)](#TestCallersDeferNilFuncPanicWithLoop)
    * [func TestChan(t *testing.T)](#TestChan)
    * [func TestNonblockRecvRace(t *testing.T)](#TestNonblockRecvRace)
    * [func TestNonblockSelectRace(t *testing.T)](#TestNonblockSelectRace)
    * [func TestNonblockSelectRace2(t *testing.T)](#TestNonblockSelectRace2)
    * [func TestSelfSelect(t *testing.T)](#TestSelfSelect)
    * [func TestSelectStress(t *testing.T)](#TestSelectStress)
    * [func TestSelectFairness(t *testing.T)](#TestSelectFairness)
    * [func TestChanSendInterface(t *testing.T)](#TestChanSendInterface)
    * [func TestPseudoRandomSend(t *testing.T)](#TestPseudoRandomSend)
    * [func TestMultiConsumer(t *testing.T)](#TestMultiConsumer)
    * [func TestShrinkStackDuringBlockedSend(t *testing.T)](#TestShrinkStackDuringBlockedSend)
    * [func TestNoShrinkStackWhileParking(t *testing.T)](#TestNoShrinkStackWhileParking)
    * [func TestSelectDuplicateChannel(t *testing.T)](#TestSelectDuplicateChannel)
    * [func TestSelectStackAdjust(t *testing.T)](#TestSelectStackAdjust)
    * [func BenchmarkMakeChan(b *testing.B)](#BenchmarkMakeChan)
    * [func BenchmarkChanNonblocking(b *testing.B)](#BenchmarkChanNonblocking)
    * [func BenchmarkSelectUncontended(b *testing.B)](#BenchmarkSelectUncontended)
    * [func BenchmarkSelectSyncContended(b *testing.B)](#BenchmarkSelectSyncContended)
    * [func BenchmarkSelectAsyncContended(b *testing.B)](#BenchmarkSelectAsyncContended)
    * [func BenchmarkSelectNonblock(b *testing.B)](#BenchmarkSelectNonblock)
    * [func BenchmarkChanUncontended(b *testing.B)](#BenchmarkChanUncontended)
    * [func BenchmarkChanContended(b *testing.B)](#BenchmarkChanContended)
    * [func benchmarkChanSync(b *testing.B, work int)](#benchmarkChanSync)
    * [func BenchmarkChanSync(b *testing.B)](#BenchmarkChanSync)
    * [func BenchmarkChanSyncWork(b *testing.B)](#BenchmarkChanSyncWork)
    * [func benchmarkChanProdCons(b *testing.B, chanSize, localWork int)](#benchmarkChanProdCons)
    * [func BenchmarkChanProdCons0(b *testing.B)](#BenchmarkChanProdCons0)
    * [func BenchmarkChanProdCons10(b *testing.B)](#BenchmarkChanProdCons10)
    * [func BenchmarkChanProdCons100(b *testing.B)](#BenchmarkChanProdCons100)
    * [func BenchmarkChanProdConsWork0(b *testing.B)](#BenchmarkChanProdConsWork0)
    * [func BenchmarkChanProdConsWork10(b *testing.B)](#BenchmarkChanProdConsWork10)
    * [func BenchmarkChanProdConsWork100(b *testing.B)](#BenchmarkChanProdConsWork100)
    * [func BenchmarkSelectProdCons(b *testing.B)](#BenchmarkSelectProdCons)
    * [func BenchmarkChanCreation(b *testing.B)](#BenchmarkChanCreation)
    * [func BenchmarkChanSem(b *testing.B)](#BenchmarkChanSem)
    * [func BenchmarkChanPopular(b *testing.B)](#BenchmarkChanPopular)
    * [func BenchmarkChanClosed(b *testing.B)](#BenchmarkChanClosed)
    * [func localWork(w int)](#localWork)
    * [func TestChanSendSelectBarrier(t *testing.T)](#TestChanSendSelectBarrier)
    * [func TestChanSendBarrier(t *testing.T)](#TestChanSendBarrier)
    * [func testChanSendBarrier(useSelect bool)](#testChanSendBarrier)
    * [func TestCheckPtr(t *testing.T)](#TestCheckPtr)
    * [func BenchmarkCallClosure(b *testing.B)](#BenchmarkCallClosure)
    * [func BenchmarkCallClosure1(b *testing.B)](#BenchmarkCallClosure1)
    * [func BenchmarkCallClosure2(b *testing.B)](#BenchmarkCallClosure2)
    * [func addr1(x int) *int](#addr1)
    * [func BenchmarkCallClosure3(b *testing.B)](#BenchmarkCallClosure3)
    * [func addr2() (x int, p *int)](#addr2)
    * [func BenchmarkCallClosure4(b *testing.B)](#BenchmarkCallClosure4)
    * [func BenchmarkComplex128DivNormal(b *testing.B)](#BenchmarkComplex128DivNormal)
    * [func BenchmarkComplex128DivNisNaN(b *testing.B)](#BenchmarkComplex128DivNisNaN)
    * [func BenchmarkComplex128DivDisNaN(b *testing.B)](#BenchmarkComplex128DivDisNaN)
    * [func BenchmarkComplex128DivNisInf(b *testing.B)](#BenchmarkComplex128DivNisInf)
    * [func BenchmarkComplex128DivDisInf(b *testing.B)](#BenchmarkComplex128DivDisInf)
    * [func TestCgoCrashHandler(t *testing.T)](#TestCgoCrashHandler)
    * [func TestCgoSignalDeadlock(t *testing.T)](#TestCgoSignalDeadlock)
    * [func TestCgoTraceback(t *testing.T)](#TestCgoTraceback)
    * [func TestCgoCallbackGC(t *testing.T)](#TestCgoCallbackGC)
    * [func TestCgoExternalThreadPanic(t *testing.T)](#TestCgoExternalThreadPanic)
    * [func TestCgoExternalThreadSIGPROF(t *testing.T)](#TestCgoExternalThreadSIGPROF)
    * [func TestCgoExternalThreadSignal(t *testing.T)](#TestCgoExternalThreadSignal)
    * [func TestCgoDLLImports(t *testing.T)](#TestCgoDLLImports)
    * [func TestCgoExecSignalMask(t *testing.T)](#TestCgoExecSignalMask)
    * [func TestEnsureDropM(t *testing.T)](#TestEnsureDropM)
    * [func TestCgoCheckBytes(t *testing.T)](#TestCgoCheckBytes)
    * [func TestCgoPanicDeadlock(t *testing.T)](#TestCgoPanicDeadlock)
    * [func TestCgoCCodeSIGPROF(t *testing.T)](#TestCgoCCodeSIGPROF)
    * [func TestCgoCrashTraceback(t *testing.T)](#TestCgoCrashTraceback)
    * [func TestCgoCrashTracebackGo(t *testing.T)](#TestCgoCrashTracebackGo)
    * [func TestCgoTracebackContext(t *testing.T)](#TestCgoTracebackContext)
    * [func testCgoPprof(t *testing.T, buildArg, runArg, top, bottom string)](#testCgoPprof)
    * [func TestCgoPprof(t *testing.T)](#TestCgoPprof)
    * [func TestCgoPprofPIE(t *testing.T)](#TestCgoPprofPIE)
    * [func TestCgoPprofThread(t *testing.T)](#TestCgoPprofThread)
    * [func TestCgoPprofThreadNoTraceback(t *testing.T)](#TestCgoPprofThreadNoTraceback)
    * [func TestRaceProf(t *testing.T)](#TestRaceProf)
    * [func TestRaceSignal(t *testing.T)](#TestRaceSignal)
    * [func TestCgoNumGoroutine(t *testing.T)](#TestCgoNumGoroutine)
    * [func TestCatchPanic(t *testing.T)](#TestCatchPanic)
    * [func TestCgoLockOSThreadExit(t *testing.T)](#TestCgoLockOSThreadExit)
    * [func TestWindowsStackMemoryCgo(t *testing.T)](#TestWindowsStackMemoryCgo)
    * [func TestSigStackSwapping(t *testing.T)](#TestSigStackSwapping)
    * [func TestCgoTracebackSigpanic(t *testing.T)](#TestCgoTracebackSigpanic)
    * [func TestBigStackCallbackCgo(t *testing.T)](#TestBigStackCallbackCgo)
    * [func nextTrace(lines []string) ([]string, []string)](#nextTrace)
    * [func findTrace(text, top string) []string](#findTrace)
    * [func TestSegv(t *testing.T)](#TestSegv)
    * [func TestEINTR(t *testing.T)](#TestEINTR)
    * [func TestNeedmDeadlock(t *testing.T)](#TestNeedmDeadlock)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func runTestProg(t *testing.T, binary, name string, env ...string) string](#runTestProg)
    * [func runBuiltTestProg(t *testing.T, exe, name string, env ...string) string](#runBuiltTestProg)
    * [func buildTestProg(t *testing.T, binary string, flags ...string) (string, error)](#buildTestProg)
    * [func TestVDSO(t *testing.T)](#TestVDSO)
    * [func testCrashHandler(t *testing.T, cgo bool)](#testCrashHandler)
    * [func TestCrashHandler(t *testing.T)](#TestCrashHandler)
    * [func testDeadlock(t *testing.T, name string)](#testDeadlock)
    * [func TestSimpleDeadlock(t *testing.T)](#TestSimpleDeadlock)
    * [func TestInitDeadlock(t *testing.T)](#TestInitDeadlock)
    * [func TestLockedDeadlock(t *testing.T)](#TestLockedDeadlock)
    * [func TestLockedDeadlock2(t *testing.T)](#TestLockedDeadlock2)
    * [func TestGoexitDeadlock(t *testing.T)](#TestGoexitDeadlock)
    * [func TestStackOverflow(t *testing.T)](#TestStackOverflow)
    * [func TestThreadExhaustion(t *testing.T)](#TestThreadExhaustion)
    * [func TestRecursivePanic(t *testing.T)](#TestRecursivePanic)
    * [func TestRecursivePanic2(t *testing.T)](#TestRecursivePanic2)
    * [func TestRecursivePanic3(t *testing.T)](#TestRecursivePanic3)
    * [func TestRecursivePanic4(t *testing.T)](#TestRecursivePanic4)
    * [func TestRecursivePanic5(t *testing.T)](#TestRecursivePanic5)
    * [func TestGoexitCrash(t *testing.T)](#TestGoexitCrash)
    * [func TestGoexitDefer(t *testing.T)](#TestGoexitDefer)
    * [func TestGoNil(t *testing.T)](#TestGoNil)
    * [func TestMainGoroutineID(t *testing.T)](#TestMainGoroutineID)
    * [func TestNoHelperGoroutines(t *testing.T)](#TestNoHelperGoroutines)
    * [func TestBreakpoint(t *testing.T)](#TestBreakpoint)
    * [func TestGoexitInPanic(t *testing.T)](#TestGoexitInPanic)
    * [func TestRuntimePanicWithRuntimeError(t *testing.T)](#TestRuntimePanicWithRuntimeError)
    * [func panicValue(fn func()) (recovered interface{})](#panicValue)
    * [func TestPanicAfterGoexit(t *testing.T)](#TestPanicAfterGoexit)
    * [func TestRecoveredPanicAfterGoexit(t *testing.T)](#TestRecoveredPanicAfterGoexit)
    * [func TestRecoverBeforePanicAfterGoexit(t *testing.T)](#TestRecoverBeforePanicAfterGoexit)
    * [func TestRecoverBeforePanicAfterGoexit2(t *testing.T)](#TestRecoverBeforePanicAfterGoexit2)
    * [func TestNetpollDeadlock(t *testing.T)](#TestNetpollDeadlock)
    * [func TestPanicTraceback(t *testing.T)](#TestPanicTraceback)
    * [func testPanicDeadlock(t *testing.T, name string, want string)](#testPanicDeadlock)
    * [func TestPanicDeadlockGosched(t *testing.T)](#TestPanicDeadlockGosched)
    * [func TestPanicDeadlockSyscall(t *testing.T)](#TestPanicDeadlockSyscall)
    * [func TestPanicLoop(t *testing.T)](#TestPanicLoop)
    * [func TestMemPprof(t *testing.T)](#TestMemPprof)
    * [func TestConcurrentMapWrites(t *testing.T)](#TestConcurrentMapWrites)
    * [func TestConcurrentMapReadWrite(t *testing.T)](#TestConcurrentMapReadWrite)
    * [func TestConcurrentMapIterateWrite(t *testing.T)](#TestConcurrentMapIterateWrite)
    * [func TestPanicInlined(t *testing.T)](#TestPanicInlined)
    * [func TestPanicRace(t *testing.T)](#TestPanicRace)
    * [func TestBadTraceback(t *testing.T)](#TestBadTraceback)
    * [func TestTimePprof(t *testing.T)](#TestTimePprof)
    * [func TestAbort(t *testing.T)](#TestAbort)
    * [func init()](#init)
    * [func TestRuntimePanic(t *testing.T)](#TestRuntimePanic)
    * [func TestG0StackOverflow(t *testing.T)](#TestG0StackOverflow)
    * [func TestDoublePanic(t *testing.T)](#TestDoublePanic)
    * [func init()](#init)
    * [func TestBadOpen(t *testing.T)](#TestBadOpen)
    * [func TestCrashDumpsAllThreads(t *testing.T)](#TestCrashDumpsAllThreads)
    * [func TestPanicSystemstack(t *testing.T)](#TestPanicSystemstack)
    * [func init()](#init)
    * [func testPanicSystemstackInternal()](#testPanicSystemstackInternal)
    * [func TestSignalExitStatus(t *testing.T)](#TestSignalExitStatus)
    * [func TestSignalIgnoreSIGTRAP(t *testing.T)](#TestSignalIgnoreSIGTRAP)
    * [func TestSignalDuringExec(t *testing.T)](#TestSignalDuringExec)
    * [func TestSignalM(t *testing.T)](#TestSignalM)
    * [func skipDebugLog(t *testing.T)](#skipDebugLog)
    * [func dlogCanonicalize(x string) string](#dlogCanonicalize)
    * [func TestDebugLog(t *testing.T)](#TestDebugLog)
    * [func TestDebugLogTypes(t *testing.T)](#TestDebugLogTypes)
    * [func TestDebugLogSym(t *testing.T)](#TestDebugLogSym)
    * [func TestDebugLogInterleaving(t *testing.T)](#TestDebugLogInterleaving)
    * [func TestDebugLogWraparound(t *testing.T)](#TestDebugLogWraparound)
    * [func TestDebugLogLongString(t *testing.T)](#TestDebugLogLongString)
    * [func TestUnconditionalPanic(t *testing.T)](#TestUnconditionalPanic)
    * [func TestOpenAndNonOpenDefers(t *testing.T)](#TestOpenAndNonOpenDefers)
    * [func testOpen(t *testing.T, arg int)](#testOpen)
    * [func TestNonOpenAndOpenDefers(t *testing.T)](#TestNonOpenAndOpenDefers)
    * [func TestConditionalDefers(t *testing.T)](#TestConditionalDefers)
    * [func testConditionalDefers(n int)](#testConditionalDefers)
    * [func TestDisappearingDefer(t *testing.T)](#TestDisappearingDefer)
    * [func TestAbortedPanic(t *testing.T)](#TestAbortedPanic)
    * [func TestRecoverMatching(t *testing.T)](#TestRecoverMatching)
    * [func sideeffect(n int64) int64](#sideeffect)
    * [func TestNonSSAableArgs(t *testing.T)](#TestNonSSAableArgs)
    * [func doPanic()](#doPanic)
    * [func TestDeferForFuncWithNoExit(t *testing.T)](#TestDeferForFuncWithNoExit)
    * [func TestDeferWithRepeatedRepanics(t *testing.T)](#TestDeferWithRepeatedRepanics)
    * [func interpreter(level int, maxlevel int, rec int)](#interpreter)
    * [func recurseFnPanicRec(level int, maxlevel int)](#recurseFnPanicRec)
    * [func recurseFn(level int, maxlevel int)](#recurseFn)
    * [func TestIssue37688(t *testing.T)](#TestIssue37688)
    * [func g2()](#g2)
    * [func g3()](#g3)
    * [func ff1(ap *foo, a, b, c, d, e, f, g, h, i int)](#ff1)
    * [func rec1(max int)](#rec1)
    * [func TestIssue43921(t *testing.T)](#TestIssue43921)
    * [func expect(t *testing.T, n int, err interface{})](#expect)
    * [func TestFixedGOROOT(t *testing.T)](#TestFixedGOROOT)
    * [func ExampleFrames()](#ExampleFrames)
    * [func TestFastLog2(t *testing.T)](#TestFastLog2)
    * [func TestGcSys(t *testing.T)](#TestGcSys)
    * [func TestGcDeepNesting(t *testing.T)](#TestGcDeepNesting)
    * [func TestGcMapIndirection(t *testing.T)](#TestGcMapIndirection)
    * [func TestGcArraySlice(t *testing.T)](#TestGcArraySlice)
    * [func TestGcRescan(t *testing.T)](#TestGcRescan)
    * [func TestGcLastTime(t *testing.T)](#TestGcLastTime)
    * [func TestHugeGCInfo(t *testing.T)](#TestHugeGCInfo)
    * [func TestPeriodicGC(t *testing.T)](#TestPeriodicGC)
    * [func TestGcZombieReporting(t *testing.T)](#TestGcZombieReporting)
    * [func TestGCTestMoveStackOnNextCall(t *testing.T)](#TestGCTestMoveStackOnNextCall)
    * [func moveStackCheck(t *testing.T, new *int, old uintptr) bool](#moveStackCheck)
    * [func TestGCTestMoveStackRepeatedly(t *testing.T)](#TestGCTestMoveStackRepeatedly)
    * [func moveStack1(x bool)](#moveStack1)
    * [func TestGCTestIsReachable(t *testing.T)](#TestGCTestIsReachable)
    * [func TestGCTestPointerClass(t *testing.T)](#TestGCTestPointerClass)
    * [func BenchmarkSetTypePtr(b *testing.B)](#BenchmarkSetTypePtr)
    * [func BenchmarkSetTypePtr8(b *testing.B)](#BenchmarkSetTypePtr8)
    * [func BenchmarkSetTypePtr16(b *testing.B)](#BenchmarkSetTypePtr16)
    * [func BenchmarkSetTypePtr32(b *testing.B)](#BenchmarkSetTypePtr32)
    * [func BenchmarkSetTypePtr64(b *testing.B)](#BenchmarkSetTypePtr64)
    * [func BenchmarkSetTypePtr126(b *testing.B)](#BenchmarkSetTypePtr126)
    * [func BenchmarkSetTypePtr128(b *testing.B)](#BenchmarkSetTypePtr128)
    * [func BenchmarkSetTypePtrSlice(b *testing.B)](#BenchmarkSetTypePtrSlice)
    * [func BenchmarkSetTypeNode1(b *testing.B)](#BenchmarkSetTypeNode1)
    * [func BenchmarkSetTypeNode1Slice(b *testing.B)](#BenchmarkSetTypeNode1Slice)
    * [func BenchmarkSetTypeNode8(b *testing.B)](#BenchmarkSetTypeNode8)
    * [func BenchmarkSetTypeNode8Slice(b *testing.B)](#BenchmarkSetTypeNode8Slice)
    * [func BenchmarkSetTypeNode64(b *testing.B)](#BenchmarkSetTypeNode64)
    * [func BenchmarkSetTypeNode64Slice(b *testing.B)](#BenchmarkSetTypeNode64Slice)
    * [func BenchmarkSetTypeNode64Dead(b *testing.B)](#BenchmarkSetTypeNode64Dead)
    * [func BenchmarkSetTypeNode64DeadSlice(b *testing.B)](#BenchmarkSetTypeNode64DeadSlice)
    * [func BenchmarkSetTypeNode124(b *testing.B)](#BenchmarkSetTypeNode124)
    * [func BenchmarkSetTypeNode124Slice(b *testing.B)](#BenchmarkSetTypeNode124Slice)
    * [func BenchmarkSetTypeNode126(b *testing.B)](#BenchmarkSetTypeNode126)
    * [func BenchmarkSetTypeNode126Slice(b *testing.B)](#BenchmarkSetTypeNode126Slice)
    * [func BenchmarkSetTypeNode128(b *testing.B)](#BenchmarkSetTypeNode128)
    * [func BenchmarkSetTypeNode128Slice(b *testing.B)](#BenchmarkSetTypeNode128Slice)
    * [func BenchmarkSetTypeNode130(b *testing.B)](#BenchmarkSetTypeNode130)
    * [func BenchmarkSetTypeNode130Slice(b *testing.B)](#BenchmarkSetTypeNode130Slice)
    * [func BenchmarkSetTypeNode1024(b *testing.B)](#BenchmarkSetTypeNode1024)
    * [func BenchmarkSetTypeNode1024Slice(b *testing.B)](#BenchmarkSetTypeNode1024Slice)
    * [func benchSetType(b *testing.B, x interface{})](#benchSetType)
    * [func BenchmarkAllocation(b *testing.B)](#BenchmarkAllocation)
    * [func TestPrintGC(t *testing.T)](#TestPrintGC)
    * [func testTypeSwitch(x interface{}) error](#testTypeSwitch)
    * [func testAssert(x interface{}) error](#testAssert)
    * [func testAssertVar(x interface{}) error](#testAssertVar)
    * [func testIfaceEqual(x interface{})](#testIfaceEqual)
    * [func TestPageAccounting(t *testing.T)](#TestPageAccounting)
    * [func TestReadMemStats(t *testing.T)](#TestReadMemStats)
    * [func logDiff(t *testing.T, prefix string, got, want reflect.Value)](#logDiff)
    * [func BenchmarkReadMemStats(b *testing.B)](#BenchmarkReadMemStats)
    * [func applyGCLoad(b *testing.B) func()](#applyGCLoad)
    * [func BenchmarkReadMemStatsLatency(b *testing.B)](#BenchmarkReadMemStatsLatency)
    * [func TestUserForcedGC(t *testing.T)](#TestUserForcedGC)
    * [func writeBarrierBenchmark(b *testing.B, f func())](#writeBarrierBenchmark)
    * [func BenchmarkWriteBarrier(b *testing.B)](#BenchmarkWriteBarrier)
    * [func BenchmarkBulkWriteBarrier(b *testing.B)](#BenchmarkBulkWriteBarrier)
    * [func BenchmarkScanStackNoLocals(b *testing.B)](#BenchmarkScanStackNoLocals)
    * [func BenchmarkMSpanCountAlloc(b *testing.B)](#BenchmarkMSpanCountAlloc)
    * [func countpwg(n *int, ready *sync.WaitGroup, teardown chan bool)](#countpwg)
    * [func TestGCInfo(t *testing.T)](#TestGCInfo)
    * [func verifyGCInfo(t *testing.T, name string, p interface{}, mask0 []byte)](#verifyGCInfo)
    * [func trimDead(mask []byte) []byte](#trimDead)
    * [func escape(p interface{}) interface{}](#escape)
    * [func infoBigStruct() []byte](#infoBigStruct)
    * [func TestMemHash32Equality(t *testing.T)](#TestMemHash32Equality)
    * [func TestMemHash64Equality(t *testing.T)](#TestMemHash64Equality)
    * [func TestSmhasherSanity(t *testing.T)](#TestSmhasherSanity)
    * [func TestSmhasherAppendedZeros(t *testing.T)](#TestSmhasherAppendedZeros)
    * [func TestSmhasherSmallKeys(t *testing.T)](#TestSmhasherSmallKeys)
    * [func TestSmhasherZeros(t *testing.T)](#TestSmhasherZeros)
    * [func TestSmhasherTwoNonzero(t *testing.T)](#TestSmhasherTwoNonzero)
    * [func twoNonZero(h *HashSet, n int)](#twoNonZero)
    * [func TestSmhasherCyclic(t *testing.T)](#TestSmhasherCyclic)
    * [func TestSmhasherSparse(t *testing.T)](#TestSmhasherSparse)
    * [func sparse(t *testing.T, n int, k int)](#sparse)
    * [func setbits(h *HashSet, b []byte, i int, k int)](#setbits)
    * [func TestSmhasherPermutation(t *testing.T)](#TestSmhasherPermutation)
    * [func permutation(t *testing.T, s []uint32, n int)](#permutation)
    * [func genPerm(h *HashSet, b []byte, s []uint32, n int)](#genPerm)
    * [func TestSmhasherAvalanche(t *testing.T)](#TestSmhasherAvalanche)
    * [func avalancheTest1(t *testing.T, k Key)](#avalancheTest1)
    * [func TestSmhasherWindowed(t *testing.T)](#TestSmhasherWindowed)
    * [func windowed(t *testing.T, k Key)](#windowed)
    * [func TestSmhasherText(t *testing.T)](#TestSmhasherText)
    * [func text(t *testing.T, prefix, suffix string)](#text)
    * [func TestSmhasherSeed(t *testing.T)](#TestSmhasherSeed)
    * [func randBytes(r *rand.Rand, b []byte)](#randBytes)
    * [func benchmarkHash(b *testing.B, n int)](#benchmarkHash)
    * [func BenchmarkHash5(b *testing.B)](#BenchmarkHash5)
    * [func BenchmarkHash16(b *testing.B)](#BenchmarkHash16)
    * [func BenchmarkHash64(b *testing.B)](#BenchmarkHash64)
    * [func BenchmarkHash1024(b *testing.B)](#BenchmarkHash1024)
    * [func BenchmarkHash65536(b *testing.B)](#BenchmarkHash65536)
    * [func TestArrayHash(t *testing.T)](#TestArrayHash)
    * [func TestStructHash(t *testing.T)](#TestStructHash)
    * [func BenchmarkAlignedLoad(b *testing.B)](#BenchmarkAlignedLoad)
    * [func BenchmarkUnalignedLoad(b *testing.B)](#BenchmarkUnalignedLoad)
    * [func TestCollisions(t *testing.T)](#TestCollisions)
    * [func TestTimeHistogram(t *testing.T)](#TestTimeHistogram)
    * [func TestCmpIfaceConcreteAlloc(t *testing.T)](#TestCmpIfaceConcreteAlloc)
    * [func BenchmarkEqEfaceConcrete(b *testing.B)](#BenchmarkEqEfaceConcrete)
    * [func BenchmarkEqIfaceConcrete(b *testing.B)](#BenchmarkEqIfaceConcrete)
    * [func BenchmarkNeEfaceConcrete(b *testing.B)](#BenchmarkNeEfaceConcrete)
    * [func BenchmarkNeIfaceConcrete(b *testing.B)](#BenchmarkNeIfaceConcrete)
    * [func BenchmarkConvT2EByteSized(b *testing.B)](#BenchmarkConvT2EByteSized)
    * [func BenchmarkConvT2ESmall(b *testing.B)](#BenchmarkConvT2ESmall)
    * [func BenchmarkConvT2EUintptr(b *testing.B)](#BenchmarkConvT2EUintptr)
    * [func BenchmarkConvT2ELarge(b *testing.B)](#BenchmarkConvT2ELarge)
    * [func BenchmarkConvT2ISmall(b *testing.B)](#BenchmarkConvT2ISmall)
    * [func BenchmarkConvT2IUintptr(b *testing.B)](#BenchmarkConvT2IUintptr)
    * [func BenchmarkConvT2ILarge(b *testing.B)](#BenchmarkConvT2ILarge)
    * [func BenchmarkConvI2E(b *testing.B)](#BenchmarkConvI2E)
    * [func BenchmarkConvI2I(b *testing.B)](#BenchmarkConvI2I)
    * [func BenchmarkAssertE2T(b *testing.B)](#BenchmarkAssertE2T)
    * [func BenchmarkAssertE2TLarge(b *testing.B)](#BenchmarkAssertE2TLarge)
    * [func BenchmarkAssertE2I(b *testing.B)](#BenchmarkAssertE2I)
    * [func BenchmarkAssertI2T(b *testing.B)](#BenchmarkAssertI2T)
    * [func BenchmarkAssertI2I(b *testing.B)](#BenchmarkAssertI2I)
    * [func BenchmarkAssertI2E(b *testing.B)](#BenchmarkAssertI2E)
    * [func BenchmarkAssertE2E(b *testing.B)](#BenchmarkAssertE2E)
    * [func BenchmarkAssertE2T2(b *testing.B)](#BenchmarkAssertE2T2)
    * [func BenchmarkAssertE2T2Blank(b *testing.B)](#BenchmarkAssertE2T2Blank)
    * [func BenchmarkAssertI2E2(b *testing.B)](#BenchmarkAssertI2E2)
    * [func BenchmarkAssertI2E2Blank(b *testing.B)](#BenchmarkAssertI2E2Blank)
    * [func BenchmarkAssertE2E2(b *testing.B)](#BenchmarkAssertE2E2)
    * [func BenchmarkAssertE2E2Blank(b *testing.B)](#BenchmarkAssertE2E2Blank)
    * [func TestNonEscapingConvT2E(t *testing.T)](#TestNonEscapingConvT2E)
    * [func TestNonEscapingConvT2I(t *testing.T)](#TestNonEscapingConvT2I)
    * [func TestZeroConvT2x(t *testing.T)](#TestZeroConvT2x)
    * [func BenchmarkConvT2Ezero(b *testing.B)](#BenchmarkConvT2Ezero)
    * [func fromMyNode(node *MyNode) *LFNode](#fromMyNode)
    * [func TestLFStack(t *testing.T)](#TestLFStack)
    * [func TestLFStackStress(t *testing.T)](#TestLFStackStress)
    * [func TestLockRankPartialOrder(t *testing.T)](#TestLockRankPartialOrder)
    * [func TestLockRankPartialOrderSortedEntries(t *testing.T)](#TestLockRankPartialOrderSortedEntries)
    * [func TestMemStats(t *testing.T)](#TestMemStats)
    * [func TestStringConcatenationAllocs(t *testing.T)](#TestStringConcatenationAllocs)
    * [func TestTinyAlloc(t *testing.T)](#TestTinyAlloc)
    * [func TestTinyAllocIssue37262(t *testing.T)](#TestTinyAllocIssue37262)
    * [func TestPageCacheLeak(t *testing.T)](#TestPageCacheLeak)
    * [func TestPhysicalMemoryUtilization(t *testing.T)](#TestPhysicalMemoryUtilization)
    * [func TestScavengedBitsCleared(t *testing.T)](#TestScavengedBitsCleared)
    * [func TestArenaCollision(t *testing.T)](#TestArenaCollision)
    * [func BenchmarkMalloc8(b *testing.B)](#BenchmarkMalloc8)
    * [func BenchmarkMalloc16(b *testing.B)](#BenchmarkMalloc16)
    * [func BenchmarkMallocTypeInfo8(b *testing.B)](#BenchmarkMallocTypeInfo8)
    * [func BenchmarkMallocTypeInfo16(b *testing.B)](#BenchmarkMallocTypeInfo16)
    * [func BenchmarkMallocLargeStruct(b *testing.B)](#BenchmarkMallocLargeStruct)
    * [func BenchmarkGoroutineSelect(b *testing.B)](#BenchmarkGoroutineSelect)
    * [func BenchmarkGoroutineBlocking(b *testing.B)](#BenchmarkGoroutineBlocking)
    * [func BenchmarkGoroutineForRange(b *testing.B)](#BenchmarkGoroutineForRange)
    * [func benchHelper(b *testing.B, n int, read func(chan struct{}))](#benchHelper)
    * [func BenchmarkGoroutineIdle(b *testing.B)](#BenchmarkGoroutineIdle)
    * [func BenchmarkHashStringSpeed(b *testing.B)](#BenchmarkHashStringSpeed)
    * [func BenchmarkHashBytesSpeed(b *testing.B)](#BenchmarkHashBytesSpeed)
    * [func BenchmarkHashInt32Speed(b *testing.B)](#BenchmarkHashInt32Speed)
    * [func BenchmarkHashInt64Speed(b *testing.B)](#BenchmarkHashInt64Speed)
    * [func BenchmarkHashStringArraySpeed(b *testing.B)](#BenchmarkHashStringArraySpeed)
    * [func BenchmarkMegMap(b *testing.B)](#BenchmarkMegMap)
    * [func BenchmarkMegOneMap(b *testing.B)](#BenchmarkMegOneMap)
    * [func BenchmarkMegEqMap(b *testing.B)](#BenchmarkMegEqMap)
    * [func BenchmarkMegEmptyMap(b *testing.B)](#BenchmarkMegEmptyMap)
    * [func BenchmarkSmallStrMap(b *testing.B)](#BenchmarkSmallStrMap)
    * [func BenchmarkMapStringKeysEight_16(b *testing.B)](#BenchmarkMapStringKeysEight_16)
    * [func BenchmarkMapStringKeysEight_32(b *testing.B)](#BenchmarkMapStringKeysEight_32)
    * [func BenchmarkMapStringKeysEight_64(b *testing.B)](#BenchmarkMapStringKeysEight_64)
    * [func BenchmarkMapStringKeysEight_1M(b *testing.B)](#BenchmarkMapStringKeysEight_1M)
    * [func benchmarkMapStringKeysEight(b *testing.B, keySize int)](#benchmarkMapStringKeysEight)
    * [func BenchmarkIntMap(b *testing.B)](#BenchmarkIntMap)
    * [func BenchmarkMapFirst(b *testing.B)](#BenchmarkMapFirst)
    * [func BenchmarkMapMid(b *testing.B)](#BenchmarkMapMid)
    * [func BenchmarkMapLast(b *testing.B)](#BenchmarkMapLast)
    * [func BenchmarkMapCycle(b *testing.B)](#BenchmarkMapCycle)
    * [func benchmarkRepeatedLookup(b *testing.B, lookupKeySize int)](#benchmarkRepeatedLookup)
    * [func BenchmarkRepeatedLookupStrMapKey32(b *testing.B)](#BenchmarkRepeatedLookupStrMapKey32)
    * [func BenchmarkRepeatedLookupStrMapKey1M(b *testing.B)](#BenchmarkRepeatedLookupStrMapKey1M)
    * [func BenchmarkMakeMap(b *testing.B)](#BenchmarkMakeMap)
    * [func BenchmarkNewEmptyMap(b *testing.B)](#BenchmarkNewEmptyMap)
    * [func BenchmarkNewSmallMap(b *testing.B)](#BenchmarkNewSmallMap)
    * [func BenchmarkMapIter(b *testing.B)](#BenchmarkMapIter)
    * [func BenchmarkMapIterEmpty(b *testing.B)](#BenchmarkMapIterEmpty)
    * [func BenchmarkSameLengthMap(b *testing.B)](#BenchmarkSameLengthMap)
    * [func BenchmarkBigKeyMap(b *testing.B)](#BenchmarkBigKeyMap)
    * [func BenchmarkBigValMap(b *testing.B)](#BenchmarkBigValMap)
    * [func BenchmarkSmallKeyMap(b *testing.B)](#BenchmarkSmallKeyMap)
    * [func BenchmarkMapPopulate(b *testing.B)](#BenchmarkMapPopulate)
    * [func BenchmarkComplexAlgMap(b *testing.B)](#BenchmarkComplexAlgMap)
    * [func BenchmarkGoMapClear(b *testing.B)](#BenchmarkGoMapClear)
    * [func BenchmarkMapStringConversion(b *testing.B)](#BenchmarkMapStringConversion)
    * [func BenchmarkMapInterfaceString(b *testing.B)](#BenchmarkMapInterfaceString)
    * [func BenchmarkMapInterfacePtr(b *testing.B)](#BenchmarkMapInterfacePtr)
    * [func BenchmarkNewEmptyMapHintLessThan8(b *testing.B)](#BenchmarkNewEmptyMapHintLessThan8)
    * [func BenchmarkNewEmptyMapHintGreaterThan8(b *testing.B)](#BenchmarkNewEmptyMapHintGreaterThan8)
    * [func TestHmapSize(t *testing.T)](#TestHmapSize)
    * [func TestNegativeZero(t *testing.T)](#TestNegativeZero)
    * [func testMapNan(t *testing.T, m map[float64]int)](#testMapNan)
    * [func TestMapAssignmentNan(t *testing.T)](#TestMapAssignmentNan)
    * [func TestMapOperatorAssignmentNan(t *testing.T)](#TestMapOperatorAssignmentNan)
    * [func TestMapOperatorAssignment(t *testing.T)](#TestMapOperatorAssignment)
    * [func TestMapAppendAssignment(t *testing.T)](#TestMapAppendAssignment)
    * [func TestAlias(t *testing.T)](#TestAlias)
    * [func TestGrowWithNaN(t *testing.T)](#TestGrowWithNaN)
    * [func TestGrowWithNegativeZero(t *testing.T)](#TestGrowWithNegativeZero)
    * [func TestIterGrowAndDelete(t *testing.T)](#TestIterGrowAndDelete)
    * [func TestIterGrowWithGC(t *testing.T)](#TestIterGrowWithGC)
    * [func testConcurrentReadsAfterGrowth(t *testing.T, useReflect bool)](#testConcurrentReadsAfterGrowth)
    * [func TestConcurrentReadsAfterGrowth(t *testing.T)](#TestConcurrentReadsAfterGrowth)
    * [func TestConcurrentReadsAfterGrowthReflect(t *testing.T)](#TestConcurrentReadsAfterGrowthReflect)
    * [func TestBigItems(t *testing.T)](#TestBigItems)
    * [func TestMapHugeZero(t *testing.T)](#TestMapHugeZero)
    * [func TestEmptyKeyAndValue(t *testing.T)](#TestEmptyKeyAndValue)
    * [func TestSingleBucketMapStringKeys_DupLen(t *testing.T)](#TestSingleBucketMapStringKeys_DupLen)
    * [func TestSingleBucketMapStringKeys_NoDupLen(t *testing.T)](#TestSingleBucketMapStringKeys_NoDupLen)
    * [func testMapLookups(t *testing.T, m map[string]string)](#testMapLookups)
    * [func TestMapNanGrowIterator(t *testing.T)](#TestMapNanGrowIterator)
    * [func TestMapIterOrder(t *testing.T)](#TestMapIterOrder)
    * [func TestMapSparseIterOrder(t *testing.T)](#TestMapSparseIterOrder)
    * [func TestMapStringBytesLookup(t *testing.T)](#TestMapStringBytesLookup)
    * [func TestMapLargeKeyNoPointer(t *testing.T)](#TestMapLargeKeyNoPointer)
    * [func TestMapLargeValNoPointer(t *testing.T)](#TestMapLargeValNoPointer)
    * [func TestIgnoreBogusMapHint(t *testing.T)](#TestIgnoreBogusMapHint)
    * [func TestMapBuckets(t *testing.T)](#TestMapBuckets)
    * [func benchmarkMapPop(b *testing.B, n int)](#benchmarkMapPop)
    * [func BenchmarkMapPop100(b *testing.B)](#BenchmarkMapPop100)
    * [func BenchmarkMapPop1000(b *testing.B)](#BenchmarkMapPop1000)
    * [func BenchmarkMapPop10000(b *testing.B)](#BenchmarkMapPop10000)
    * [func TestNonEscapingMap(t *testing.T)](#TestNonEscapingMap)
    * [func benchmarkMapAssignInt32(b *testing.B, n int)](#benchmarkMapAssignInt32)
    * [func benchmarkMapOperatorAssignInt32(b *testing.B, n int)](#benchmarkMapOperatorAssignInt32)
    * [func benchmarkMapAppendAssignInt32(b *testing.B, n int)](#benchmarkMapAppendAssignInt32)
    * [func benchmarkMapDeleteInt32(b *testing.B, n int)](#benchmarkMapDeleteInt32)
    * [func benchmarkMapAssignInt64(b *testing.B, n int)](#benchmarkMapAssignInt64)
    * [func benchmarkMapOperatorAssignInt64(b *testing.B, n int)](#benchmarkMapOperatorAssignInt64)
    * [func benchmarkMapAppendAssignInt64(b *testing.B, n int)](#benchmarkMapAppendAssignInt64)
    * [func benchmarkMapDeleteInt64(b *testing.B, n int)](#benchmarkMapDeleteInt64)
    * [func benchmarkMapAssignStr(b *testing.B, n int)](#benchmarkMapAssignStr)
    * [func benchmarkMapOperatorAssignStr(b *testing.B, n int)](#benchmarkMapOperatorAssignStr)
    * [func benchmarkMapAppendAssignStr(b *testing.B, n int)](#benchmarkMapAppendAssignStr)
    * [func benchmarkMapDeleteStr(b *testing.B, n int)](#benchmarkMapDeleteStr)
    * [func benchmarkMapDeletePointer(b *testing.B, n int)](#benchmarkMapDeletePointer)
    * [func runWith(f func(*testing.B, int), v ...int) func(*testing.B)](#runWith)
    * [func BenchmarkMapAssign(b *testing.B)](#BenchmarkMapAssign)
    * [func BenchmarkMapOperatorAssign(b *testing.B)](#BenchmarkMapOperatorAssign)
    * [func BenchmarkMapAppendAssign(b *testing.B)](#BenchmarkMapAppendAssign)
    * [func BenchmarkMapDelete(b *testing.B)](#BenchmarkMapDelete)
    * [func TestDeferDeleteSlow(t *testing.T)](#TestDeferDeleteSlow)
    * [func TestIncrementAfterDeleteValueInt(t *testing.T)](#TestIncrementAfterDeleteValueInt)
    * [func TestIncrementAfterDeleteValueInt32(t *testing.T)](#TestIncrementAfterDeleteValueInt32)
    * [func TestIncrementAfterDeleteValueInt64(t *testing.T)](#TestIncrementAfterDeleteValueInt64)
    * [func TestIncrementAfterDeleteKeyStringValueInt(t *testing.T)](#TestIncrementAfterDeleteKeyStringValueInt)
    * [func TestIncrementAfterDeleteKeyValueString(t *testing.T)](#TestIncrementAfterDeleteKeyValueString)
    * [func TestIncrementAfterBulkClearKeyStringValueInt(t *testing.T)](#TestIncrementAfterBulkClearKeyStringValueInt)
    * [func TestMapTombstones(t *testing.T)](#TestMapTombstones)
    * [func TestMapInterfaceKey(t *testing.T)](#TestMapInterfaceKey)
    * [func TestMemmove(t *testing.T)](#TestMemmove)
    * [func TestMemmoveAlias(t *testing.T)](#TestMemmoveAlias)
    * [func TestMemmoveLarge0x180000(t *testing.T)](#TestMemmoveLarge0x180000)
    * [func TestMemmoveOverlapLarge0x120000(t *testing.T)](#TestMemmoveOverlapLarge0x120000)
    * [func testSize(t *testing.T, size int)](#testSize)
    * [func testOverlap(t *testing.T, size int)](#testOverlap)
    * [func copyref(dst, src []byte)](#copyref)
    * [func copybw(dst, src []byte)](#copybw)
    * [func matchLen(a, b []byte, max int) int](#matchLen)
    * [func cmpb(a, b []byte) int](#cmpb)
    * [func TestMemmoveAtomicity(t *testing.T)](#TestMemmoveAtomicity)
    * [func benchmarkSizes(b *testing.B, sizes []int, fn func(b *testing.B, n int))](#benchmarkSizes)
    * [func BenchmarkMemmove(b *testing.B)](#BenchmarkMemmove)
    * [func BenchmarkMemmoveOverlap(b *testing.B)](#BenchmarkMemmoveOverlap)
    * [func BenchmarkMemmoveUnalignedDst(b *testing.B)](#BenchmarkMemmoveUnalignedDst)
    * [func BenchmarkMemmoveUnalignedDstOverlap(b *testing.B)](#BenchmarkMemmoveUnalignedDstOverlap)
    * [func BenchmarkMemmoveUnalignedSrc(b *testing.B)](#BenchmarkMemmoveUnalignedSrc)
    * [func BenchmarkMemmoveUnalignedSrcOverlap(b *testing.B)](#BenchmarkMemmoveUnalignedSrcOverlap)
    * [func TestMemclr(t *testing.T)](#TestMemclr)
    * [func BenchmarkMemclr(b *testing.B)](#BenchmarkMemclr)
    * [func BenchmarkGoMemclr(b *testing.B)](#BenchmarkGoMemclr)
    * [func BenchmarkClearFat8(b *testing.B)](#BenchmarkClearFat8)
    * [func BenchmarkClearFat12(b *testing.B)](#BenchmarkClearFat12)
    * [func BenchmarkClearFat16(b *testing.B)](#BenchmarkClearFat16)
    * [func BenchmarkClearFat24(b *testing.B)](#BenchmarkClearFat24)
    * [func BenchmarkClearFat32(b *testing.B)](#BenchmarkClearFat32)
    * [func BenchmarkClearFat40(b *testing.B)](#BenchmarkClearFat40)
    * [func BenchmarkClearFat48(b *testing.B)](#BenchmarkClearFat48)
    * [func BenchmarkClearFat56(b *testing.B)](#BenchmarkClearFat56)
    * [func BenchmarkClearFat64(b *testing.B)](#BenchmarkClearFat64)
    * [func BenchmarkClearFat128(b *testing.B)](#BenchmarkClearFat128)
    * [func BenchmarkClearFat256(b *testing.B)](#BenchmarkClearFat256)
    * [func BenchmarkClearFat512(b *testing.B)](#BenchmarkClearFat512)
    * [func BenchmarkClearFat1024(b *testing.B)](#BenchmarkClearFat1024)
    * [func BenchmarkCopyFat8(b *testing.B)](#BenchmarkCopyFat8)
    * [func BenchmarkCopyFat12(b *testing.B)](#BenchmarkCopyFat12)
    * [func BenchmarkCopyFat16(b *testing.B)](#BenchmarkCopyFat16)
    * [func BenchmarkCopyFat24(b *testing.B)](#BenchmarkCopyFat24)
    * [func BenchmarkCopyFat32(b *testing.B)](#BenchmarkCopyFat32)
    * [func BenchmarkCopyFat64(b *testing.B)](#BenchmarkCopyFat64)
    * [func BenchmarkCopyFat128(b *testing.B)](#BenchmarkCopyFat128)
    * [func BenchmarkCopyFat256(b *testing.B)](#BenchmarkCopyFat256)
    * [func BenchmarkCopyFat512(b *testing.B)](#BenchmarkCopyFat512)
    * [func BenchmarkCopyFat520(b *testing.B)](#BenchmarkCopyFat520)
    * [func BenchmarkCopyFat1024(b *testing.B)](#BenchmarkCopyFat1024)
    * [func BenchmarkIssue18740(b *testing.B)](#BenchmarkIssue18740)
    * [func prepareAllMetricsSamples() (map[string]metrics.Description, []metrics.Sample)](#prepareAllMetricsSamples)
    * [func TestReadMetrics(t *testing.T)](#TestReadMetrics)
    * [func TestReadMetricsConsistency(t *testing.T)](#TestReadMetricsConsistency)
    * [func BenchmarkReadMetricsLatency(b *testing.B)](#BenchmarkReadMetricsLatency)
    * [func TestFinalizerType(t *testing.T)](#TestFinalizerType)
    * [func TestFinalizerInterfaceBig(t *testing.T)](#TestFinalizerInterfaceBig)
    * [func fin(v *int)](#fin)
    * [func TestFinalizerZeroSizedStruct(t *testing.T)](#TestFinalizerZeroSizedStruct)
    * [func BenchmarkFinalizer(b *testing.B)](#BenchmarkFinalizer)
    * [func BenchmarkFinalizerRun(b *testing.B)](#BenchmarkFinalizerRun)
    * [func TestEmptySlice(t *testing.T)](#TestEmptySlice)
    * [func TestEmptyString(t *testing.T)](#TestEmptyString)
    * [func TestFinalizerOnGlobal(t *testing.T)](#TestFinalizerOnGlobal)
    * [func TestDeferKeepAlive(t *testing.T)](#TestDeferKeepAlive)
    * [func makePallocData(alloc, scavenged []BitRange) *PallocData](#makePallocData)
    * [func TestFillAligned(t *testing.T)](#TestFillAligned)
    * [func TestPallocDataFindScavengeCandidate(t *testing.T)](#TestPallocDataFindScavengeCandidate)
    * [func TestPageAllocScavenge(t *testing.T)](#TestPageAllocScavenge)
    * [func checkPageAlloc(t *testing.T, want, got *PageAlloc)](#checkPageAlloc)
    * [func TestPageAllocGrow(t *testing.T)](#TestPageAllocGrow)
    * [func TestPageAllocAlloc(t *testing.T)](#TestPageAllocAlloc)
    * [func TestPageAllocExhaust(t *testing.T)](#TestPageAllocExhaust)
    * [func TestPageAllocFree(t *testing.T)](#TestPageAllocFree)
    * [func TestPageAllocAllocAndFree(t *testing.T)](#TestPageAllocAllocAndFree)
    * [func checkPageCache(t *testing.T, got, want PageCache)](#checkPageCache)
    * [func TestPageCacheAlloc(t *testing.T)](#TestPageCacheAlloc)
    * [func TestPageCacheFlush(t *testing.T)](#TestPageCacheFlush)
    * [func TestPageAllocAllocToCache(t *testing.T)](#TestPageAllocAllocToCache)
    * [func checkPallocBits(t *testing.T, got, want *PallocBits) bool](#checkPallocBits)
    * [func makePallocBits(s []BitRange) *PallocBits](#makePallocBits)
    * [func TestPallocBitsAllocRange(t *testing.T)](#TestPallocBitsAllocRange)
    * [func invertPallocBits(b *PallocBits)](#invertPallocBits)
    * [func checkPallocSum(t testing.TB, got, want PallocSum)](#checkPallocSum)
    * [func TestMallocBitsPopcntRange(t *testing.T)](#TestMallocBitsPopcntRange)
    * [func TestPallocBitsSummarizeRandom(t *testing.T)](#TestPallocBitsSummarizeRandom)
    * [func TestPallocBitsSummarize(t *testing.T)](#TestPallocBitsSummarize)
    * [func BenchmarkPallocBitsSummarize(b *testing.B)](#BenchmarkPallocBitsSummarize)
    * [func TestPallocBitsAlloc(t *testing.T)](#TestPallocBitsAlloc)
    * [func TestPallocBitsFree(t *testing.T)](#TestPallocBitsFree)
    * [func TestFindBitRange64(t *testing.T)](#TestFindBitRange64)
    * [func BenchmarkFindBitRange64(b *testing.B)](#BenchmarkFindBitRange64)
    * [func validateAddrRanges(t *testing.T, a *AddrRanges, want ...AddrRange)](#validateAddrRanges)
    * [func TestAddrRangesAdd(t *testing.T)](#TestAddrRangesAdd)
    * [func TestAddrRangesFindSucc(t *testing.T)](#TestAddrRangesFindSucc)
    * [func fcntl(fd uintptr, cmd int, arg uintptr) (uintptr, syscall.Errno)](#fcntl)
    * [func TestNonblockingPipe(t *testing.T)](#TestNonblockingPipe)
    * [func checkIsPipe(t *testing.T, r, w int32)](#checkIsPipe)
    * [func checkNonblocking(t *testing.T, fd int32, name string)](#checkNonblocking)
    * [func checkCloseonexec(t *testing.T, fd int32, name string)](#checkCloseonexec)
    * [func TestSetNonblock(t *testing.T)](#TestSetNonblock)
    * [func init()](#init)
    * [func BenchmarkNetpollBreak(b *testing.B)](#BenchmarkNetpollBreak)
    * [func BenchmarkSyscall(b *testing.B)](#BenchmarkSyscall)
    * [func BenchmarkSyscallWork(b *testing.B)](#BenchmarkSyscallWork)
    * [func BenchmarkSyscallExcess(b *testing.B)](#BenchmarkSyscallExcess)
    * [func BenchmarkSyscallExcessWork(b *testing.B)](#BenchmarkSyscallExcessWork)
    * [func benchmarkSyscall(b *testing.B, work, excess int)](#benchmarkSyscall)
    * [func TestPanicWithDirectlyPrintableCustomTypes(t *testing.T)](#TestPanicWithDirectlyPrintableCustomTypes)
    * [func perpetuumMobile()](#perpetuumMobile)
    * [func TestStopTheWorldDeadlock(t *testing.T)](#TestStopTheWorldDeadlock)
    * [func TestYieldProgress(t *testing.T)](#TestYieldProgress)
    * [func TestYieldLockedProgress(t *testing.T)](#TestYieldLockedProgress)
    * [func testYieldProgress(locked bool)](#testYieldProgress)
    * [func TestYieldLocked(t *testing.T)](#TestYieldLocked)
    * [func TestGoroutineParallelism(t *testing.T)](#TestGoroutineParallelism)
    * [func TestGoroutineParallelism2(t *testing.T)](#TestGoroutineParallelism2)
    * [func testGoroutineParallelism2(t *testing.T, load, netpoll bool)](#testGoroutineParallelism2)
    * [func TestBlockLocked(t *testing.T)](#TestBlockLocked)
    * [func TestTimerFairness(t *testing.T)](#TestTimerFairness)
    * [func TestTimerFairness2(t *testing.T)](#TestTimerFairness2)
    * [func TestPreemption(t *testing.T)](#TestPreemption)
    * [func TestPreemptionGC(t *testing.T)](#TestPreemptionGC)
    * [func TestAsyncPreempt(t *testing.T)](#TestAsyncPreempt)
    * [func TestGCFairness(t *testing.T)](#TestGCFairness)
    * [func TestGCFairness2(t *testing.T)](#TestGCFairness2)
    * [func TestNumGoroutine(t *testing.T)](#TestNumGoroutine)
    * [func TestPingPongHog(t *testing.T)](#TestPingPongHog)
    * [func BenchmarkPingPongHog(b *testing.B)](#BenchmarkPingPongHog)
    * [func stackGrowthRecursive(i int)](#stackGrowthRecursive)
    * [func TestPreemptSplitBig(t *testing.T)](#TestPreemptSplitBig)
    * [func big(stop chan int) int](#big)
    * [func bigframe(stop chan int) int](#bigframe)
    * [func small(stop chan int, x *[8192]byte) int](#small)
    * [func nonleaf(stop chan int) bool](#nonleaf)
    * [func TestSchedLocalQueue(t *testing.T)](#TestSchedLocalQueue)
    * [func TestSchedLocalQueueSteal(t *testing.T)](#TestSchedLocalQueueSteal)
    * [func TestSchedLocalQueueEmpty(t *testing.T)](#TestSchedLocalQueueEmpty)
    * [func benchmarkStackGrowth(b *testing.B, rec int)](#benchmarkStackGrowth)
    * [func BenchmarkStackGrowth(b *testing.B)](#BenchmarkStackGrowth)
    * [func BenchmarkStackGrowthDeep(b *testing.B)](#BenchmarkStackGrowthDeep)
    * [func BenchmarkCreateGoroutines(b *testing.B)](#BenchmarkCreateGoroutines)
    * [func BenchmarkCreateGoroutinesParallel(b *testing.B)](#BenchmarkCreateGoroutinesParallel)
    * [func benchmarkCreateGoroutines(b *testing.B, procs int)](#benchmarkCreateGoroutines)
    * [func BenchmarkCreateGoroutinesCapture(b *testing.B)](#BenchmarkCreateGoroutinesCapture)
    * [func warmupScheduler(targetThreadCount int)](#warmupScheduler)
    * [func doWork(dur time.Duration)](#doWork)
    * [func BenchmarkCreateGoroutinesSingle(b *testing.B)](#BenchmarkCreateGoroutinesSingle)
    * [func BenchmarkClosureCall(b *testing.B)](#BenchmarkClosureCall)
    * [func benchmarkWakeupParallel(b *testing.B, spin func(time.Duration))](#benchmarkWakeupParallel)
    * [func BenchmarkWakeupParallelSpinning(b *testing.B)](#BenchmarkWakeupParallelSpinning)
    * [func BenchmarkWakeupParallelSyscall(b *testing.B)](#BenchmarkWakeupParallelSyscall)
    * [func BenchmarkMatmult(b *testing.B)](#BenchmarkMatmult)
    * [func matmult(done chan<- struct{}, A, B, C Matrix, i0, i1, j0, j1, k0, k1, threshold int)](#matmult)
    * [func TestStealOrder(t *testing.T)](#TestStealOrder)
    * [func TestLockOSThreadNesting(t *testing.T)](#TestLockOSThreadNesting)
    * [func TestLockOSThreadExit(t *testing.T)](#TestLockOSThreadExit)
    * [func testLockOSThreadExit(t *testing.T, prog string)](#testLockOSThreadExit)
    * [func TestLockOSThreadAvoidsStatePropagation(t *testing.T)](#TestLockOSThreadAvoidsStatePropagation)
    * [func TestLockOSThreadTemplateThreadRace(t *testing.T)](#TestLockOSThreadTemplateThreadRace)
    * [func fakeSyscall(duration time.Duration)](#fakeSyscall)
    * [func testPreemptionAfterSyscall(t *testing.T, syscallDuration time.Duration)](#testPreemptionAfterSyscall)
    * [func TestPreemptionAfterSyscall(t *testing.T)](#TestPreemptionAfterSyscall)
    * [func TestGetgThreadSwitch(t *testing.T)](#TestGetgThreadSwitch)
    * [func TestNetpollBreak(t *testing.T)](#TestNetpollBreak)
    * [func TestBigGOMAXPROCS(t *testing.T)](#TestBigGOMAXPROCS)
    * [func TestProfBuf(t *testing.T)](#TestProfBuf)
    * [func BenchmarkFastrand(b *testing.B)](#BenchmarkFastrand)
    * [func BenchmarkFastrandHashiter(b *testing.B)](#BenchmarkFastrandHashiter)
    * [func BenchmarkFastrandn(b *testing.B)](#BenchmarkFastrandn)
    * [func checkGdbEnvironment(t *testing.T)](#checkGdbEnvironment)
    * [func checkGdbVersion(t *testing.T)](#checkGdbVersion)
    * [func checkGdbPython(t *testing.T)](#checkGdbPython)
    * [func checkCleanBacktrace(t *testing.T, backtrace string)](#checkCleanBacktrace)
    * [func lastLine(src []byte) int](#lastLine)
    * [func TestGdbPython(t *testing.T)](#TestGdbPython)
    * [func TestGdbPythonCgo(t *testing.T)](#TestGdbPythonCgo)
    * [func testGdbPython(t *testing.T, cgo bool)](#testGdbPython)
    * [func TestGdbBacktrace(t *testing.T)](#TestGdbBacktrace)
    * [func TestGdbAutotmpTypes(t *testing.T)](#TestGdbAutotmpTypes)
    * [func TestGdbConst(t *testing.T)](#TestGdbConst)
    * [func TestGdbPanic(t *testing.T)](#TestGdbPanic)
    * [func TestGdbInfCallstack(t *testing.T)](#TestGdbInfCallstack)
    * [func checkLldbPython(t *testing.T)](#checkLldbPython)
    * [func TestLldbPython(t *testing.T)](#TestLldbPython)
    * [func TestMmapErrorSign(t *testing.T)](#TestMmapErrorSign)
    * [func TestPhysPageSize(t *testing.T)](#TestPhysPageSize)
    * [func init()](#init)
    * [func errfn() error](#errfn)
    * [func errfn1() error](#errfn1)
    * [func BenchmarkIfaceCmp100(b *testing.B)](#BenchmarkIfaceCmp100)
    * [func BenchmarkIfaceCmpNil100(b *testing.B)](#BenchmarkIfaceCmpNil100)
    * [func BenchmarkEfaceCmpDiff(b *testing.B)](#BenchmarkEfaceCmpDiff)
    * [func BenchmarkEfaceCmpDiffIndirect(b *testing.B)](#BenchmarkEfaceCmpDiffIndirect)
    * [func BenchmarkDefer(b *testing.B)](#BenchmarkDefer)
    * [func defer1()](#defer1)
    * [func BenchmarkDefer10(b *testing.B)](#BenchmarkDefer10)
    * [func defer2()](#defer2)
    * [func BenchmarkDeferMany(b *testing.B)](#BenchmarkDeferMany)
    * [func BenchmarkPanicRecover(b *testing.B)](#BenchmarkPanicRecover)
    * [func defer3()](#defer3)
    * [func TestStopCPUProfilingWithProfilerOff(t *testing.T)](#TestStopCPUProfilingWithProfilerOff)
    * [func TestSetPanicOnFault(t *testing.T)](#TestSetPanicOnFault)
    * [func testSetPanicOnFault(t *testing.T, addr uintptr, nfault *int)](#testSetPanicOnFault)
    * [func eqstring_generic(s1, s2 string) bool](#eqstring_generic)
    * [func TestEqString(t *testing.T)](#TestEqString)
    * [func TestTrailingZero(t *testing.T)](#TestTrailingZero)
    * [func TestAppendGrowth(t *testing.T)](#TestAppendGrowth)
    * [func TestAppendSliceGrowth(t *testing.T)](#TestAppendSliceGrowth)
    * [func TestGoroutineProfileTrivial(t *testing.T)](#TestGoroutineProfileTrivial)
    * [func TestVersion(t *testing.T)](#TestVersion)
    * [func TestGoroutineProfile(t *testing.T)](#TestGoroutineProfile)
    * [func parallelReader(m *RWMutex, clocked chan bool, cunlock *uint32, cdone chan bool)](#parallelReader)
    * [func doTestParallelReaders(numReaders int)](#doTestParallelReaders)
    * [func TestParallelRWMutexReaders(t *testing.T)](#TestParallelRWMutexReaders)
    * [func reader(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)](#reader)
    * [func writer(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)](#writer)
    * [func HammerRWMutex(gomaxprocs, numReaders, num_iterations int)](#HammerRWMutex)
    * [func TestRWMutex(t *testing.T)](#TestRWMutex)
    * [func BenchmarkRWMutexUncontended(b *testing.B)](#BenchmarkRWMutexUncontended)
    * [func benchmarkRWMutex(b *testing.B, localWork, writeRatio int)](#benchmarkRWMutex)
    * [func BenchmarkRWMutexWrite100(b *testing.B)](#BenchmarkRWMutexWrite100)
    * [func BenchmarkRWMutexWrite10(b *testing.B)](#BenchmarkRWMutexWrite10)
    * [func BenchmarkRWMutexWorkWrite100(b *testing.B)](#BenchmarkRWMutexWorkWrite100)
    * [func BenchmarkRWMutexWorkWrite10(b *testing.B)](#BenchmarkRWMutexWorkWrite10)
    * [func TestSemaHandoff(t *testing.T)](#TestSemaHandoff)
    * [func TestSemaHandoff1(t *testing.T)](#TestSemaHandoff1)
    * [func TestSemaHandoff2(t *testing.T)](#TestSemaHandoff2)
    * [func testSemaHandoff() bool](#testSemaHandoff)
    * [func TestSpuriousWakeupsNeverHangSemasleep(t *testing.T)](#TestSpuriousWakeupsNeverHangSemasleep)
    * [func TestSizeof(t *testing.T)](#TestSizeof)
    * [func BenchmarkMakeSliceCopy(b *testing.B)](#BenchmarkMakeSliceCopy)
    * [func BenchmarkMakeSlice(b *testing.B)](#BenchmarkMakeSlice)
    * [func BenchmarkGrowSlice(b *testing.B)](#BenchmarkGrowSlice)
    * [func BenchmarkExtendSlice(b *testing.B)](#BenchmarkExtendSlice)
    * [func BenchmarkAppend(b *testing.B)](#BenchmarkAppend)
    * [func BenchmarkAppendGrowByte(b *testing.B)](#BenchmarkAppendGrowByte)
    * [func BenchmarkAppendGrowString(b *testing.B)](#BenchmarkAppendGrowString)
    * [func BenchmarkAppendSlice(b *testing.B)](#BenchmarkAppendSlice)
    * [func BenchmarkAppendSliceLarge(b *testing.B)](#BenchmarkAppendSliceLarge)
    * [func BenchmarkAppendStr(b *testing.B)](#BenchmarkAppendStr)
    * [func BenchmarkAppendSpecialCase(b *testing.B)](#BenchmarkAppendSpecialCase)
    * [func f() int](#f)
    * [func TestSideEffectOrder(t *testing.T)](#TestSideEffectOrder)
    * [func TestAppendOverlap(t *testing.T)](#TestAppendOverlap)
    * [func BenchmarkCopy(b *testing.B)](#BenchmarkCopy)
    * [func BenchmarkAppendInPlace(b *testing.B)](#BenchmarkAppendInPlace)
    * [func fop(f func(x, y uint64) uint64) func(x, y float64) float64](#fop)
    * [func add(x, y float64) float64](#add)
    * [func sub(x, y float64) float64](#sub)
    * [func mul(x, y float64) float64](#mul)
    * [func div(x, y float64) float64](#div)
    * [func TestFloat64(t *testing.T)](#TestFloat64)
    * [func trunc32(f float64) float64](#trunc32)
    * [func to32sw(f float64) float64](#to32sw)
    * [func to64sw(f float64) float64](#to64sw)
    * [func hwint64(f float64) float64](#hwint64)
    * [func hwint32(f float64) float64](#hwint32)
    * [func toint64sw(f float64) float64](#toint64sw)
    * [func fromint64sw(f float64) float64](#fromint64sw)
    * [func err(t *testing.T, format string, args ...interface{})](#err)
    * [func test(t *testing.T, op string, hw, sw func(float64, float64) float64, all []float64)](#test)
    * [func testu(t *testing.T, op string, hw, sw func(float64) float64, v float64)](#testu)
    * [func hwcmp(f, g float64) (cmp int, isnan bool)](#hwcmp)
    * [func testcmp(t *testing.T, f, g float64)](#testcmp)
    * [func same(f, g float64) bool](#same)
    * [func TestStackMem(t *testing.T)](#TestStackMem)
    * [func TestStackGrowth(t *testing.T)](#TestStackGrowth)
    * [func growStack(progress *uint32)](#growStack)
    * [func growStackIter(p *int, n int)](#growStackIter)
    * [func TestStackGrowthCallback(t *testing.T)](#TestStackGrowthCallback)
    * [func growStackWithCallback(cb func())](#growStackWithCallback)
    * [func set(p *int, x int)](#set)
    * [func TestDeferPtrs(t *testing.T)](#TestDeferPtrs)
    * [func TestDeferPtrsGoexit(t *testing.T)](#TestDeferPtrsGoexit)
    * [func testDeferPtrsGoexit(c chan int, i int)](#testDeferPtrsGoexit)
    * [func setBig(p *int, x int, b bigBuf)](#setBig)
    * [func TestDeferPtrsPanic(t *testing.T)](#TestDeferPtrsPanic)
    * [func testDeferPtrsPanic(c chan int, i int)](#testDeferPtrsPanic)
    * [func testDeferLeafSigpanic1()](#testDeferLeafSigpanic1)
    * [func TestDeferLeafSigpanic(t *testing.T)](#TestDeferLeafSigpanic)
    * [func TestPanicUseStack(t *testing.T)](#TestPanicUseStack)
    * [func TestPanicFar(t *testing.T)](#TestPanicFar)
    * [func useStackAndCall(n int, f func())](#useStackAndCall)
    * [func useStack(n int)](#useStack)
    * [func growing(c chan int, done chan struct{})](#growing)
    * [func TestStackCache(t *testing.T)](#TestStackCache)
    * [func TestStackOutput(t *testing.T)](#TestStackOutput)
    * [func TestStackAllOutput(t *testing.T)](#TestStackAllOutput)
    * [func TestStackPanic(t *testing.T)](#TestStackPanic)
    * [func BenchmarkStackCopyPtr(b *testing.B)](#BenchmarkStackCopyPtr)
    * [func countp(n *int)](#countp)
    * [func BenchmarkStackCopy(b *testing.B)](#BenchmarkStackCopy)
    * [func count(n int) int](#count)
    * [func BenchmarkStackCopyNoCache(b *testing.B)](#BenchmarkStackCopyNoCache)
    * [func count1(n int) int](#count1)
    * [func count2(n int) int](#count2)
    * [func count3(n int) int](#count3)
    * [func count4(n int) int](#count4)
    * [func count5(n int) int](#count5)
    * [func count6(n int) int](#count6)
    * [func count7(n int) int](#count7)
    * [func count8(n int) int](#count8)
    * [func count9(n int) int](#count9)
    * [func count10(n int) int](#count10)
    * [func count11(n int) int](#count11)
    * [func count12(n int) int](#count12)
    * [func count13(n int) int](#count13)
    * [func count14(n int) int](#count14)
    * [func count15(n int) int](#count15)
    * [func count16(n int) int](#count16)
    * [func count17(n int) int](#count17)
    * [func count18(n int) int](#count18)
    * [func count19(n int) int](#count19)
    * [func count20(n int) int](#count20)
    * [func count21(n int) int](#count21)
    * [func count22(n int) int](#count22)
    * [func count23(n int) int](#count23)
    * [func TestStackWrapperCaller(t *testing.T)](#TestStackWrapperCaller)
    * [func TestStackWrapperCallers(t *testing.T)](#TestStackWrapperCallers)
    * [func TestStackWrapperStack(t *testing.T)](#TestStackWrapperStack)
    * [func TestStackWrapperStackPanic(t *testing.T)](#TestStackWrapperStackPanic)
    * [func testStackWrapperPanic(t *testing.T, cb func(), expect string)](#testStackWrapperPanic)
    * [func TestCallersFromWrapper(t *testing.T)](#TestCallersFromWrapper)
    * [func TestTracebackSystemstack(t *testing.T)](#TestTracebackSystemstack)
    * [func TestTracebackAncestors(t *testing.T)](#TestTracebackAncestors)
    * [func TestDeferLiveness(t *testing.T)](#TestDeferLiveness)
    * [func TestDeferHeapAndStack(t *testing.T)](#TestDeferHeapAndStack)
    * [func deferHeapAndStack(n int) (r int)](#deferHeapAndStack)
    * [func TestTracebackInlineExcluded(t *testing.T)](#TestTracebackInlineExcluded)
    * [func tracebackExcluded()](#tracebackExcluded)
    * [func tracebackNotExcluded()](#tracebackNotExcluded)
    * [func BenchmarkCompareStringEqual(b *testing.B)](#BenchmarkCompareStringEqual)
    * [func BenchmarkCompareStringIdentical(b *testing.B)](#BenchmarkCompareStringIdentical)
    * [func BenchmarkCompareStringSameLength(b *testing.B)](#BenchmarkCompareStringSameLength)
    * [func BenchmarkCompareStringDifferentLength(b *testing.B)](#BenchmarkCompareStringDifferentLength)
    * [func BenchmarkCompareStringBigUnaligned(b *testing.B)](#BenchmarkCompareStringBigUnaligned)
    * [func BenchmarkCompareStringBig(b *testing.B)](#BenchmarkCompareStringBig)
    * [func BenchmarkConcatStringAndBytes(b *testing.B)](#BenchmarkConcatStringAndBytes)
    * [func BenchmarkSliceByteToString(b *testing.B)](#BenchmarkSliceByteToString)
    * [func BenchmarkRuneCount(b *testing.B)](#BenchmarkRuneCount)
    * [func BenchmarkRuneIterate(b *testing.B)](#BenchmarkRuneIterate)
    * [func BenchmarkArrayEqual(b *testing.B)](#BenchmarkArrayEqual)
    * [func TestStringW(t *testing.T)](#TestStringW)
    * [func TestLargeStringConcat(t *testing.T)](#TestLargeStringConcat)
    * [func TestCompareTempString(t *testing.T)](#TestCompareTempString)
    * [func TestStringIndexHaystack(t *testing.T)](#TestStringIndexHaystack)
    * [func TestStringIndexNeedle(t *testing.T)](#TestStringIndexNeedle)
    * [func TestStringOnStack(t *testing.T)](#TestStringOnStack)
    * [func TestIntString(t *testing.T)](#TestIntString)
    * [func TestIntStringAllocs(t *testing.T)](#TestIntStringAllocs)
    * [func TestRangeStringCast(t *testing.T)](#TestRangeStringCast)
    * [func isZeroed(b []byte) bool](#isZeroed)
    * [func isZeroedR(r []rune) bool](#isZeroedR)
    * [func TestString2Slice(t *testing.T)](#TestString2Slice)
    * [func TestAtoi(t *testing.T)](#TestAtoi)
    * [func TestAtoi32(t *testing.T)](#TestAtoi32)
    * [func TestCaller(t *testing.T)](#TestCaller)
    * [func testCallerFoo(t *testing.T)](#testCallerFoo)
    * [func testCallerBar(t *testing.T)](#testCallerBar)
    * [func lineNumber() int](#lineNumber)
    * [func trythis()](#trythis)
    * [func recordLines(a, b, c int)](#recordLines)
    * [func TestLineNumber(t *testing.T)](#TestLineNumber)
    * [func TestNilName(t *testing.T)](#TestNilName)
    * [func inlined()](#inlined)
    * [func tracebackFunc(t *testing.T) uintptr](#tracebackFunc)
    * [func TestFunctionAlignmentTraceback(t *testing.T)](#TestFunctionAlignmentTraceback)
    * [func TestFakeTime(t *testing.T)](#TestFakeTime)
    * [func parseFakeTime(x []byte) ([]fakeTimeFrame, error)](#parseFakeTime)
    * [func TestTracebackArgs(t *testing.T)](#TestTracebackArgs)
    * [func testTracebackArgs1(a, b, c, d, e, f, g, h, i, j, k, l int) int](#testTracebackArgs1)
    * [func testTracebackArgs2(a bool, b struct {...](#testTracebackArgs2)
    * [func testTracebackArgs3(x [3]byte, a, b, c int, y [3]byte) int](#testTracebackArgs3)
    * [func testTracebackArgs4(a bool, x [1][1][1][1][1][1][1][1][1][1]int) int](#testTracebackArgs4)
    * [func testTracebackArgs5(a bool, x struct {...](#testTracebackArgs5)


## <a id="const" href="#const">Constants</a>

### <a id="typeScalar" href="#typeScalar">const typeScalar</a>

```
searchKey: runtime_test.typeScalar
```

```Go
const typeScalar = 0
```

### <a id="typePointer" href="#typePointer">const typePointer</a>

```
searchKey: runtime_test.typePointer
```

```Go
const typePointer = 1
```

### <a id="hashSize" href="#hashSize">const hashSize</a>

```
searchKey: runtime_test.hashSize
```

```Go
const hashSize = 32 + int(^uintptr(0)>>63<<5)
```

size of the hash output (32 or 64 bits) 

### <a id="size" href="#size">const size</a>

```
searchKey: runtime_test.size
```

```Go
const size = 10
```

### <a id="objsize" href="#objsize">const objsize</a>

```
searchKey: runtime_test.objsize
```

```Go
const objsize = 320
```

One chunk must be exactly one sizeclass in size. It should be a sizeclass not used much by others, so we have a greater chance of finding adjacent ones. size class 19: 320 byte objects, 25 per page, 1 page alloc at a time 

### <a id="helloSource" href="#helloSource">const helloSource</a>

```
searchKey: runtime_test.helloSource
```

```Go
const helloSource = ...
```

### <a id="backtraceSource" href="#backtraceSource">const backtraceSource</a>

```
searchKey: runtime_test.backtraceSource
```

```Go
const backtraceSource = ...
```

### <a id="autotmpTypeSource" href="#autotmpTypeSource">const autotmpTypeSource</a>

```
searchKey: runtime_test.autotmpTypeSource
```

```Go
const autotmpTypeSource = ...
```

### <a id="constsSource" href="#constsSource">const constsSource</a>

```
searchKey: runtime_test.constsSource
```

```Go
const constsSource = ...
```

### <a id="panicSource" href="#panicSource">const panicSource</a>

```
searchKey: runtime_test.panicSource
```

```Go
const panicSource = ...
```

### <a id="InfCallstackSource" href="#InfCallstackSource">const InfCallstackSource</a>

```
searchKey: runtime_test.InfCallstackSource
```

```Go
const InfCallstackSource = ...
```

### <a id="lldbHelloSource" href="#lldbHelloSource">const lldbHelloSource</a>

```
searchKey: runtime_test.lldbHelloSource
```

```Go
const lldbHelloSource = ...
```

### <a id="lldbScriptSource" href="#lldbScriptSource">const lldbScriptSource</a>

```
searchKey: runtime_test.lldbScriptSource
```

```Go
const lldbScriptSource = ...
```

### <a id="expectedLldbOutput" href="#expectedLldbOutput">const expectedLldbOutput</a>

```
searchKey: runtime_test.expectedLldbOutput
```

```Go
const expectedLldbOutput = ...
```

### <a id="N" href="#N">const N</a>

```
searchKey: runtime_test.N
```

```Go
const N = 20
```

### <a id="sizeNoStack" href="#sizeNoStack">const sizeNoStack</a>

```
searchKey: runtime_test.sizeNoStack
```

```Go
const sizeNoStack = 100
```

Strings and slices that don't escape and fit into tmpBuf are stack allocated, which defeats using AllocsPerRun to test other optimizations. 

### <a id="intSize" href="#intSize">const intSize</a>

```
searchKey: runtime_test.intSize
```

```Go
const intSize = 32 << (^uint(0) >> 63)
```

## <a id="var" href="#var">Variables</a>

### <a id="alwaysFalse" href="#alwaysFalse">var alwaysFalse</a>

```
searchKey: runtime_test.alwaysFalse
```

```Go
var alwaysFalse = false
```

### <a id="workSink" href="#workSink">var workSink</a>

```
searchKey: runtime_test.workSink
```

```Go
var workSink = 0
```

### <a id="s" href="#s">var s</a>

```
searchKey: runtime_test.s
```

```Go
var s int
```

### <a id="ss" href="#ss">var ss</a>

```
searchKey: runtime_test.ss
```

```Go
var ss *int
```

### <a id="result" href="#result">var result</a>

```
searchKey: runtime_test.result
```

```Go
var result complex128
```

### <a id="toRemove" href="#toRemove">var toRemove</a>

```
searchKey: runtime_test.toRemove
```

```Go
var toRemove []string
```

### <a id="testprog" href="#testprog">var testprog</a>

```
searchKey: runtime_test.testprog
```

```Go
var testprog struct {
	sync.Mutex
	dir    string
	target map[string]buildexe
}
```

### <a id="concurrentMapTest" href="#concurrentMapTest">var concurrentMapTest</a>

```
searchKey: runtime_test.concurrentMapTest
```

```Go
var concurrentMapTest = ...
```

### <a id="sigquit" href="#sigquit">var sigquit</a>

```
searchKey: runtime_test.sigquit
```

```Go
var sigquit = syscall.SIGQUIT
```

sigquit is the signal to send to kill a hanging testdata program. Send SIGQUIT to get a stack trace. 

### <a id="glob" href="#glob">var glob</a>

```
searchKey: runtime_test.glob
```

```Go
var glob int = 3
```

### <a id="list" href="#list">var list</a>

```
searchKey: runtime_test.list
```

```Go
var list []int
```

### <a id="globint1" href="#globint1">var globint1</a>

```
searchKey: runtime_test.globint1
```

```Go
var globint1, globint2, globint3 int
```

### <a id="globint2" href="#globint2">var globint2</a>

```
searchKey: runtime_test.globint2
```

```Go
var globint1, globint2, globint3 int
```

### <a id="globint3" href="#globint3">var globint3</a>

```
searchKey: runtime_test.globint3
```

```Go
var globint1, globint2, globint3 int
```

### <a id="saveInt" href="#saveInt">var saveInt</a>

```
searchKey: runtime_test.saveInt
```

```Go
var saveInt uint32
```

### <a id="globstruct" href="#globstruct">var globstruct</a>

```
searchKey: runtime_test.globstruct
```

```Go
var globstruct struct {
	a, b, c, d, e, f, g, h, i int
}
```

### <a id="hugeSink" href="#hugeSink">var hugeSink</a>

```
searchKey: runtime_test.hugeSink
```

```Go
var hugeSink interface{}
```

### <a id="pointerClassSink" href="#pointerClassSink">var pointerClassSink</a>

```
searchKey: runtime_test.pointerClassSink
```

```Go
var pointerClassSink *int
```

### <a id="pointerClassData" href="#pointerClassData">var pointerClassData</a>

```
searchKey: runtime_test.pointerClassData
```

```Go
var pointerClassData = 42
```

### <a id="a" href="#a">var a</a>

```
searchKey: runtime_test.a
```

```Go
var a bool
```

### <a id="gcinfoSink" href="#gcinfoSink">var gcinfoSink</a>

```
searchKey: runtime_test.gcinfoSink
```

```Go
var gcinfoSink interface{}
```

### <a id="infoPtr" href="#infoPtr">var infoPtr</a>

```
searchKey: runtime_test.infoPtr
```

```Go
var infoPtr = []byte{typePointer}
```

### <a id="infoPtr10" href="#infoPtr10">var infoPtr10</a>

```
searchKey: runtime_test.infoPtr10
```

```Go
var infoPtr10 = ...
```

### <a id="infoScalarPtr" href="#infoScalarPtr">var infoScalarPtr</a>

```
searchKey: runtime_test.infoScalarPtr
```

```Go
var infoScalarPtr = ...
```

### <a id="infoScalarPtr4" href="#infoScalarPtr4">var infoScalarPtr4</a>

```
searchKey: runtime_test.infoScalarPtr4
```

```Go
var infoScalarPtr4 = ...
```

### <a id="infoPtrScalar" href="#infoPtrScalar">var infoPtrScalar</a>

```
searchKey: runtime_test.infoPtrScalar
```

```Go
var infoPtrScalar = ...
```

### <a id="bssPtr" href="#bssPtr">var bssPtr</a>

```
searchKey: runtime_test.bssPtr
```

```Go
var bssPtr Ptr
```

BSS 

### <a id="bssScalarPtr" href="#bssScalarPtr">var bssScalarPtr</a>

```
searchKey: runtime_test.bssScalarPtr
```

```Go
var bssScalarPtr ScalarPtr
```

### <a id="bssPtrScalar" href="#bssPtrScalar">var bssPtrScalar</a>

```
searchKey: runtime_test.bssPtrScalar
```

```Go
var bssPtrScalar PtrScalar
```

### <a id="bssBigStruct" href="#bssBigStruct">var bssBigStruct</a>

```
searchKey: runtime_test.bssBigStruct
```

```Go
var bssBigStruct BigStruct
```

### <a id="bssString" href="#bssString">var bssString</a>

```
searchKey: runtime_test.bssString
```

```Go
var bssString string
```

### <a id="bssSlice" href="#bssSlice">var bssSlice</a>

```
searchKey: runtime_test.bssSlice
```

```Go
var bssSlice []string
```

### <a id="bssEface" href="#bssEface">var bssEface</a>

```
searchKey: runtime_test.bssEface
```

```Go
var bssEface interface{}
```

### <a id="bssIface" href="#bssIface">var bssIface</a>

```
searchKey: runtime_test.bssIface
```

```Go
var bssIface Iface
```

### <a id="dataPtr" href="#dataPtr">var dataPtr</a>

```
searchKey: runtime_test.dataPtr
```

```Go
var dataPtr = Ptr{new(byte)}
```

DATA 

### <a id="dataScalarPtr" href="#dataScalarPtr">var dataScalarPtr</a>

```
searchKey: runtime_test.dataScalarPtr
```

```Go
var dataScalarPtr = ScalarPtr{q: 1}
```

### <a id="dataPtrScalar" href="#dataPtrScalar">var dataPtrScalar</a>

```
searchKey: runtime_test.dataPtrScalar
```

```Go
var dataPtrScalar = PtrScalar{w: 1}
```

### <a id="dataBigStruct" href="#dataBigStruct">var dataBigStruct</a>

```
searchKey: runtime_test.dataBigStruct
```

```Go
var dataBigStruct = BigStruct{w: 1}
```

### <a id="dataString" href="#dataString">var dataString</a>

```
searchKey: runtime_test.dataString
```

```Go
var dataString = "foo"
```

### <a id="dataSlice" href="#dataSlice">var dataSlice</a>

```
searchKey: runtime_test.dataSlice
```

```Go
var dataSlice = []string{"foo"}
```

### <a id="dataEface" href="#dataEface">var dataEface</a>

```
searchKey: runtime_test.dataEface
```

```Go
var dataEface interface{} = 42
```

### <a id="dataIface" href="#dataIface">var dataIface</a>

```
searchKey: runtime_test.dataIface
```

```Go
var dataIface Iface = IfaceImpl(42)
```

### <a id="infoString" href="#infoString">var infoString</a>

```
searchKey: runtime_test.infoString
```

```Go
var infoString = []byte{typePointer, typeScalar}
```

### <a id="infoSlice" href="#infoSlice">var infoSlice</a>

```
searchKey: runtime_test.infoSlice
```

```Go
var infoSlice = []byte{typePointer, typeScalar, typeScalar}
```

### <a id="infoEface" href="#infoEface">var infoEface</a>

```
searchKey: runtime_test.infoEface
```

```Go
var infoEface = []byte{typeScalar, typePointer}
```

### <a id="infoIface" href="#infoIface">var infoIface</a>

```
searchKey: runtime_test.infoIface
```

```Go
var infoIface = []byte{typeScalar, typePointer}
```

### <a id="sink" href="#sink">var sink</a>

```
searchKey: runtime_test.sink
```

```Go
var sink uint64
```

### <a id="dummyTimeHistogram" href="#dummyTimeHistogram">var dummyTimeHistogram</a>

```
searchKey: runtime_test.dummyTimeHistogram
```

```Go
var dummyTimeHistogram TimeHistogram
```

### <a id="e" href="#e">var e</a>

```
searchKey: runtime_test.e
```

```Go
var e interface{}
```

### <a id="e_" href="#e_">var e_</a>

```
searchKey: runtime_test.e_
```

```Go
var e_ interface{}
```

### <a id="i1" href="#i1">var i1</a>

```
searchKey: runtime_test.i1
```

```Go
var i1 I1
```

### <a id="i2" href="#i2">var i2</a>

```
searchKey: runtime_test.i2
```

```Go
var i2 I2
```

### <a id="ts" href="#ts">var ts</a>

```
searchKey: runtime_test.ts
```

```Go
var ts TS
```

### <a id="tm" href="#tm">var tm</a>

```
searchKey: runtime_test.tm
```

```Go
var tm TM
```

### <a id="tl" href="#tl">var tl</a>

```
searchKey: runtime_test.tl
```

```Go
var tl TL
```

### <a id="ok" href="#ok">var ok</a>

```
searchKey: runtime_test.ok
```

```Go
var ok bool
```

### <a id="eight8" href="#eight8">var eight8</a>

```
searchKey: runtime_test.eight8
```

```Go
var eight8 uint8 = 8
```

### <a id="eight8I" href="#eight8I">var eight8I</a>

```
searchKey: runtime_test.eight8I
```

```Go
var eight8I T8 = 8
```

### <a id="yes" href="#yes">var yes</a>

```
searchKey: runtime_test.yes
```

```Go
var yes bool = true
```

### <a id="zero16" href="#zero16">var zero16</a>

```
searchKey: runtime_test.zero16
```

```Go
var zero16 uint16 = 0
```

### <a id="zero16I" href="#zero16I">var zero16I</a>

```
searchKey: runtime_test.zero16I
```

```Go
var zero16I T16 = 0
```

### <a id="one16" href="#one16">var one16</a>

```
searchKey: runtime_test.one16
```

```Go
var one16 uint16 = 1
```

### <a id="thousand16" href="#thousand16">var thousand16</a>

```
searchKey: runtime_test.thousand16
```

```Go
var thousand16 uint16 = 1000
```

### <a id="zero32" href="#zero32">var zero32</a>

```
searchKey: runtime_test.zero32
```

```Go
var zero32 uint32 = 0
```

### <a id="zero32I" href="#zero32I">var zero32I</a>

```
searchKey: runtime_test.zero32I
```

```Go
var zero32I T32 = 0
```

### <a id="one32" href="#one32">var one32</a>

```
searchKey: runtime_test.one32
```

```Go
var one32 uint32 = 1
```

### <a id="thousand32" href="#thousand32">var thousand32</a>

```
searchKey: runtime_test.thousand32
```

```Go
var thousand32 uint32 = 1000
```

### <a id="zero64" href="#zero64">var zero64</a>

```
searchKey: runtime_test.zero64
```

```Go
var zero64 uint64 = 0
```

### <a id="zero64I" href="#zero64I">var zero64I</a>

```
searchKey: runtime_test.zero64I
```

```Go
var zero64I T64 = 0
```

### <a id="one64" href="#one64">var one64</a>

```
searchKey: runtime_test.one64
```

```Go
var one64 uint64 = 1
```

### <a id="thousand64" href="#thousand64">var thousand64</a>

```
searchKey: runtime_test.thousand64
```

```Go
var thousand64 uint64 = 1000
```

### <a id="zerostr" href="#zerostr">var zerostr</a>

```
searchKey: runtime_test.zerostr
```

```Go
var zerostr string = ""
```

### <a id="zerostrI" href="#zerostrI">var zerostrI</a>

```
searchKey: runtime_test.zerostrI
```

```Go
var zerostrI Tstr = ""
```

### <a id="nzstr" href="#nzstr">var nzstr</a>

```
searchKey: runtime_test.nzstr
```

```Go
var nzstr string = "abc"
```

### <a id="zeroslice" href="#zeroslice">var zeroslice</a>

```
searchKey: runtime_test.zeroslice
```

```Go
var zeroslice []byte = nil
```

### <a id="zerosliceI" href="#zerosliceI">var zerosliceI</a>

```
searchKey: runtime_test.zerosliceI
```

```Go
var zerosliceI Tslice = nil
```

### <a id="nzslice" href="#nzslice">var nzslice</a>

```
searchKey: runtime_test.nzslice
```

```Go
var nzslice []byte = []byte("abc")
```

### <a id="zerobig" href="#zerobig">var zerobig</a>

```
searchKey: runtime_test.zerobig
```

```Go
var zerobig [512]byte
```

### <a id="nzbig" href="#nzbig">var nzbig</a>

```
searchKey: runtime_test.nzbig
```

```Go
var nzbig [512]byte = [512]byte{511: 1}
```

### <a id="global" href="#global">var global</a>

```
searchKey: runtime_test.global
```

```Go
var global interface{}
```

### <a id="stress" href="#stress">var stress</a>

```
searchKey: runtime_test.stress
```

```Go
var stress []*MyNode
```

### <a id="testMemStatsCount" href="#testMemStatsCount">var testMemStatsCount</a>

```
searchKey: runtime_test.testMemStatsCount
```

```Go
var testMemStatsCount int
```

### <a id="tinyByteSink" href="#tinyByteSink">var tinyByteSink</a>

```
searchKey: runtime_test.tinyByteSink
```

```Go
var tinyByteSink *byte
```

### <a id="tinyUint32Sink" href="#tinyUint32Sink">var tinyUint32Sink</a>

```
searchKey: runtime_test.tinyUint32Sink
```

```Go
var tinyUint32Sink *uint32
```

### <a id="tinyObj12Sink" href="#tinyObj12Sink">var tinyObj12Sink</a>

```
searchKey: runtime_test.tinyObj12Sink
```

```Go
var tinyObj12Sink *obj12
```

### <a id="arenaCollisionSink" href="#arenaCollisionSink">var arenaCollisionSink</a>

```
searchKey: runtime_test.arenaCollisionSink
```

```Go
var arenaCollisionSink []*acLink
```

### <a id="mallocSink" href="#mallocSink">var mallocSink</a>

```
searchKey: runtime_test.mallocSink
```

```Go
var mallocSink uintptr
```

### <a id="n" href="#n">var n</a>

```
searchKey: runtime_test.n
```

```Go
var n = flag.Int("n", 1000, "number of goroutines")
```

### <a id="BoolSink" href="#BoolSink">var BoolSink</a>

```
searchKey: runtime_test.BoolSink
```

```Go
var BoolSink bool
```

### <a id="hintLessThan8" href="#hintLessThan8">var hintLessThan8</a>

```
searchKey: runtime_test.hintLessThan8
```

```Go
var hintLessThan8 = 7
```

### <a id="hintGreaterThan8" href="#hintGreaterThan8">var hintGreaterThan8</a>

```
searchKey: runtime_test.hintGreaterThan8
```

```Go
var hintGreaterThan8 = 32
```

### <a id="sinkAppend" href="#sinkAppend">var sinkAppend</a>

```
searchKey: runtime_test.sinkAppend
```

```Go
var sinkAppend bool
```

### <a id="mapSink" href="#mapSink">var mapSink</a>

```
searchKey: runtime_test.mapSink
```

```Go
var mapSink map[int]int
```

### <a id="mapBucketTests" href="#mapBucketTests">var mapBucketTests</a>

```
searchKey: runtime_test.mapBucketTests
```

```Go
var mapBucketTests = ...
```

### <a id="testNonEscapingMapVariable" href="#testNonEscapingMapVariable">var testNonEscapingMapVariable</a>

```
searchKey: runtime_test.testNonEscapingMapVariable
```

```Go
var testNonEscapingMapVariable int = 8
```

### <a id="bufSizes" href="#bufSizes">var bufSizes</a>

```
searchKey: runtime_test.bufSizes
```

```Go
var bufSizes = ...
```

### <a id="bufSizesOverlap" href="#bufSizesOverlap">var bufSizesOverlap</a>

```
searchKey: runtime_test.bufSizesOverlap
```

```Go
var bufSizesOverlap = []int{
	32, 64, 128, 256, 512, 1024, 2048, 4096,
}
```

### <a id="xsglobal" href="#xsglobal">var xsglobal</a>

```
searchKey: runtime_test.xsglobal
```

```Go
var xsglobal []byte
```

### <a id="ssglobal" href="#ssglobal">var ssglobal</a>

```
searchKey: runtime_test.ssglobal
```

```Go
var ssglobal string
```

### <a id="Foo2" href="#Foo2">var Foo2</a>

```
searchKey: runtime_test.Foo2
```

```Go
var Foo2 = &Object2{}
```

### <a id="Foo1" href="#Foo1">var Foo1</a>

```
searchKey: runtime_test.Foo1
```

```Go
var Foo1 = &Object1{}
```

### <a id="wg" href="#wg">var wg</a>

```
searchKey: runtime_test.wg
```

```Go
var wg sync.WaitGroup
```

### <a id="stop" href="#stop">var stop</a>

```
searchKey: runtime_test.stop
```

```Go
var stop = make(chan bool, 1)
```

### <a id="preempt" href="#preempt">var preempt</a>

```
searchKey: runtime_test.preempt
```

```Go
var preempt = ...
```

The function is used to test preemption at split stack checks. Declaring a var avoids inlining at the call site. 

### <a id="padData" href="#padData">var padData</a>

```
searchKey: runtime_test.padData
```

```Go
var padData [128]uint64
```

### <a id="sysNanosleep" href="#sysNanosleep">var sysNanosleep</a>

```
searchKey: runtime_test.sysNanosleep
```

```Go
var sysNanosleep func(d time.Duration)
```

sysNanosleep is defined by OS-specific files (such as runtime_linux_test.go) to sleep for the given duration. If nil, dependent tests are skipped. The implementation should invoke a blocking system call and not call time.Sleep, which would deschedule the goroutine. 

### <a id="sink32" href="#sink32">var sink32</a>

```
searchKey: runtime_test.sink32
```

```Go
var sink32 uint32
```

### <a id="lldbPath" href="#lldbPath">var lldbPath</a>

```
searchKey: runtime_test.lldbPath
```

```Go
var lldbPath string
```

### <a id="flagQuick" href="#flagQuick">var flagQuick</a>

```
searchKey: runtime_test.flagQuick
```

```Go
var flagQuick = flag.Bool("quick", false, "skip slow tests, for second run in all.bash")
```

### <a id="errf" href="#errf">var errf</a>

```
searchKey: runtime_test.errf
```

```Go
var errf error
```

### <a id="efaceCmp1" href="#efaceCmp1">var efaceCmp1</a>

```
searchKey: runtime_test.efaceCmp1
```

```Go
var efaceCmp1 interface{}
```

### <a id="efaceCmp2" href="#efaceCmp2">var efaceCmp2</a>

```
searchKey: runtime_test.efaceCmp2
```

```Go
var efaceCmp2 interface{}
```

### <a id="faultAddrs" href="#faultAddrs">var faultAddrs</a>

```
searchKey: runtime_test.faultAddrs
```

```Go
var faultAddrs = ...
```

### <a id="One" href="#One">var One</a>

```
searchKey: runtime_test.One
```

```Go
var One = []int64{1}
```

### <a id="SinkIntSlice" href="#SinkIntSlice">var SinkIntSlice</a>

```
searchKey: runtime_test.SinkIntSlice
```

```Go
var SinkIntSlice []int
```

### <a id="SinkIntPointerSlice" href="#SinkIntPointerSlice">var SinkIntPointerSlice</a>

```
searchKey: runtime_test.SinkIntPointerSlice
```

```Go
var SinkIntPointerSlice []*int
```

### <a id="blackhole" href="#blackhole">var blackhole</a>

```
searchKey: runtime_test.blackhole
```

```Go
var blackhole []byte
```

### <a id="x" href="#x">var x</a>

```
searchKey: runtime_test.x
```

```Go
var x []int
```

### <a id="sByte" href="#sByte">var sByte</a>

```
searchKey: runtime_test.sByte
```

```Go
var sByte []byte
```

### <a id="s1Ptr" href="#s1Ptr">var s1Ptr</a>

```
searchKey: runtime_test.s1Ptr
```

```Go
var s1Ptr []uintptr
```

### <a id="s2Ptr" href="#s2Ptr">var s2Ptr</a>

```
searchKey: runtime_test.s2Ptr
```

```Go
var s2Ptr [][2]uintptr
```

### <a id="s3Ptr" href="#s3Ptr">var s3Ptr</a>

```
searchKey: runtime_test.s3Ptr
```

```Go
var s3Ptr [][3]uintptr
```

### <a id="s4Ptr" href="#s4Ptr">var s4Ptr</a>

```
searchKey: runtime_test.s4Ptr
```

```Go
var s4Ptr [][4]uintptr
```

### <a id="nerr" href="#nerr">var nerr</a>

```
searchKey: runtime_test.nerr
```

```Go
var nerr int
```

### <a id="escapeMe" href="#escapeMe">var escapeMe</a>

```
searchKey: runtime_test.escapeMe
```

```Go
var escapeMe = func(x interface{}) {}
```

Pass a value to escapeMe to force it to escape. 

### <a id="escapeString" href="#escapeString">var escapeString</a>

```
searchKey: runtime_test.escapeString
```

```Go
var escapeString string
```

### <a id="stringdata" href="#stringdata">var stringdata</a>

```
searchKey: runtime_test.stringdata
```

```Go
var stringdata = ...
```

### <a id="sinkInt" href="#sinkInt">var sinkInt</a>

```
searchKey: runtime_test.sinkInt
```

```Go
var sinkInt int
```

### <a id="atoi64tests" href="#atoi64tests">var atoi64tests</a>

```
searchKey: runtime_test.atoi64tests
```

```Go
var atoi64tests = ...
```

### <a id="atoi32tests" href="#atoi32tests">var atoi32tests</a>

```
searchKey: runtime_test.atoi32tests
```

```Go
var atoi32tests = ...
```

### <a id="firstLine" href="#firstLine">var firstLine</a>

```
searchKey: runtime_test.firstLine
```

```Go
var firstLine = lineNumber() // 0

```

Do not add/remove lines in this block without updating the line numbers. 

### <a id="lineVar1" href="#lineVar1">var lineVar1</a>

```
searchKey: runtime_test.lineVar1
```

```Go
var lineVar1 = lineNumber() // 2

```

### <a id="lineVar2a" href="#lineVar2a">var lineVar2a</a>

```
searchKey: runtime_test.lineVar2a
```

```Go
var lineVar2a, lineVar2b = lineNumber(), lineNumber() // 3

```

### <a id="lineVar2b" href="#lineVar2b">var lineVar2b</a>

```
searchKey: runtime_test.lineVar2b
```

```Go
var lineVar2a, lineVar2b = lineNumber(), lineNumber() // 3

```

### <a id="compLit" href="#compLit">var compLit</a>

```
searchKey: runtime_test.compLit
```

```Go
var compLit

// 19
 = ...
```

### <a id="arrayLit" href="#arrayLit">var arrayLit</a>

```
searchKey: runtime_test.arrayLit
```

```Go
var arrayLit = [...]int{lineNumber(),
	lineNumber(), lineNumber(),
	lineNumber(),
} // 23

```

### <a id="sliceLit" href="#sliceLit">var sliceLit</a>

```
searchKey: runtime_test.sliceLit
```

```Go
var sliceLit = []int{lineNumber(),
	lineNumber(), lineNumber(),
	lineNumber(),
} // 27

```

### <a id="mapLit" href="#mapLit">var mapLit</a>

```
searchKey: runtime_test.mapLit
```

```Go
var mapLit

// 33
 = ...
```

### <a id="intLit" href="#intLit">var intLit</a>

```
searchKey: runtime_test.intLit
```

```Go
var intLit = lineNumber() +
	lineNumber() +
	lineNumber() // 36

```

### <a id="l38" href="#l38">var l38</a>

```
searchKey: runtime_test.l38
```

```Go
var l38, l39, l40 int
```

### <a id="l39" href="#l39">var l39</a>

```
searchKey: runtime_test.l39
```

```Go
var l38, l39, l40 int
```

### <a id="l40" href="#l40">var l40</a>

```
searchKey: runtime_test.l40
```

```Go
var l38, l39, l40 int
```

### <a id="dummy" href="#dummy">var dummy</a>

```
searchKey: runtime_test.dummy
```

```Go
var dummy int
```

### <a id="testTracebackArgsBuf" href="#testTracebackArgsBuf">var testTracebackArgsBuf</a>

```
searchKey: runtime_test.testTracebackArgsBuf
```

```Go
var testTracebackArgsBuf [1000]byte
```

## <a id="type" href="#type">Types</a>

### <a id="struct0" href="#struct0">type struct0 struct{}</a>

```
searchKey: runtime_test.struct0
```

```Go
type struct0 struct{}
```

### <a id="response" href="#response">type response struct{}</a>

```
searchKey: runtime_test.response
```

```Go
type response struct {
}
```

#### <a id="doRequest" href="#doRequest">func doRequest(useSelect bool) (*response, error)</a>

```
searchKey: runtime_test.doRequest
```

```Go
func doRequest(useSelect bool) (*response, error)
```

### <a id="myError" href="#myError">type myError struct{}</a>

```
searchKey: runtime_test.myError
```

```Go
type myError struct {
}
```

#### <a id="myError.Error" href="#myError.Error">func (myError) Error() string</a>

```
searchKey: runtime_test.myError.Error
```

```Go
func (myError) Error() string
```

### <a id="buildexe" href="#buildexe">type buildexe struct</a>

```
searchKey: runtime_test.buildexe
```

```Go
type buildexe struct {
	exe string
	err error
}
```

### <a id="point" href="#point">type point struct</a>

```
searchKey: runtime_test.point
```

```Go
type point struct {
	x, y *int
}
```

#### <a id="point.negate" href="#point.negate">func (p *point) negate()</a>

```
searchKey: runtime_test.point.negate
```

```Go
func (p *point) negate()
```

### <a id="nonSSAable" href="#nonSSAable">type nonSSAable [128]byte</a>

```
searchKey: runtime_test.nonSSAable
```

```Go
type nonSSAable [128]byte
```

#### <a id="mknonSSAable" href="#mknonSSAable">func mknonSSAable() nonSSAable</a>

```
searchKey: runtime_test.mknonSSAable
```

```Go
func mknonSSAable() nonSSAable
```

### <a id="bigStruct" href="#bigStruct">type bigStruct struct</a>

```
searchKey: runtime_test.bigStruct
```

```Go
type bigStruct struct {
	x, y, z, w, p, q int64
}
```

### <a id="containsBigStruct" href="#containsBigStruct">type containsBigStruct struct</a>

```
searchKey: runtime_test.containsBigStruct
```

```Go
type containsBigStruct struct {
	element bigStruct
}
```

#### <a id="sideeffect2" href="#sideeffect2">func sideeffect2(in containsBigStruct) containsBigStruct</a>

```
searchKey: runtime_test.sideeffect2
```

```Go
func sideeffect2(in containsBigStruct) containsBigStruct
```

### <a id="foo" href="#foo">type foo struct{}</a>

```
searchKey: runtime_test.foo
```

```Go
type foo struct {
}
```

#### <a id="foo.method1" href="#foo.method1">func (f *foo) method1()</a>

```
searchKey: runtime_test.foo.method1
```

```Go
func (f *foo) method1()
```

#### <a id="foo.method2" href="#foo.method2">func (f *foo) method2()</a>

```
searchKey: runtime_test.foo.method2
```

```Go
func (f *foo) method2()
```

### <a id="Node1" href="#Node1">type Node1 struct</a>

```
searchKey: runtime_test.Node1
```

```Go
type Node1 struct {
	Value       [1]uintptr
	Left, Right *byte
}
```

### <a id="Node8" href="#Node8">type Node8 struct</a>

```
searchKey: runtime_test.Node8
```

```Go
type Node8 struct {
	Value       [8]uintptr
	Left, Right *byte
}
```

### <a id="Node64" href="#Node64">type Node64 struct</a>

```
searchKey: runtime_test.Node64
```

```Go
type Node64 struct {
	Value       [64]uintptr
	Left, Right *byte
}
```

### <a id="Node64Dead" href="#Node64Dead">type Node64Dead struct</a>

```
searchKey: runtime_test.Node64Dead
```

```Go
type Node64Dead struct {
	Left, Right *byte
	Value       [64]uintptr
}
```

### <a id="Node124" href="#Node124">type Node124 struct</a>

```
searchKey: runtime_test.Node124
```

```Go
type Node124 struct {
	Value       [124]uintptr
	Left, Right *byte
}
```

### <a id="Node126" href="#Node126">type Node126 struct</a>

```
searchKey: runtime_test.Node126
```

```Go
type Node126 struct {
	Value       [126]uintptr
	Left, Right *byte
}
```

### <a id="Node128" href="#Node128">type Node128 struct</a>

```
searchKey: runtime_test.Node128
```

```Go
type Node128 struct {
	Value       [128]uintptr
	Left, Right *byte
}
```

### <a id="Node130" href="#Node130">type Node130 struct</a>

```
searchKey: runtime_test.Node130
```

```Go
type Node130 struct {
	Value       [130]uintptr
	Left, Right *byte
}
```

### <a id="Node1024" href="#Node1024">type Node1024 struct</a>

```
searchKey: runtime_test.Node1024
```

```Go
type Node1024 struct {
	Value       [1024]uintptr
	Left, Right *byte
}
```

### <a id="Ptr" href="#Ptr">type Ptr struct</a>

```
searchKey: runtime_test.Ptr
```

```Go
type Ptr struct {
	*byte
}
```

### <a id="ScalarPtr" href="#ScalarPtr">type ScalarPtr struct</a>

```
searchKey: runtime_test.ScalarPtr
```

```Go
type ScalarPtr struct {
	q int
	w *int
	e int
	r *int
	t int
	y *int
}
```

### <a id="PtrScalar" href="#PtrScalar">type PtrScalar struct</a>

```
searchKey: runtime_test.PtrScalar
```

```Go
type PtrScalar struct {
	q *int
	w int
	e *int
	r int
	t *int
	y int
}
```

### <a id="BigStruct" href="#BigStruct">type BigStruct struct</a>

```
searchKey: runtime_test.BigStruct
```

```Go
type BigStruct struct {
	q *int
	w byte
	e [17]byte
	r []byte
	t int
	y uint16
	u uint64
	i string
}
```

### <a id="Iface" href="#Iface">type Iface interface</a>

```
searchKey: runtime_test.Iface
```

```Go
type Iface interface {
	f()
}
```

### <a id="IfaceImpl" href="#IfaceImpl">type IfaceImpl int</a>

```
searchKey: runtime_test.IfaceImpl
```

```Go
type IfaceImpl int
```

#### <a id="IfaceImpl.f" href="#IfaceImpl.f">func (IfaceImpl) f()</a>

```
searchKey: runtime_test.IfaceImpl.f
```

```Go
func (IfaceImpl) f()
```

### <a id="HashSet" href="#HashSet">type HashSet struct</a>

```
searchKey: runtime_test.HashSet
```

```Go
type HashSet struct {
	m map[uintptr]struct{} // set of hashes added
	n int                  // number of hashes added
}
```

#### <a id="newHashSet" href="#newHashSet">func newHashSet() *HashSet</a>

```
searchKey: runtime_test.newHashSet
```

```Go
func newHashSet() *HashSet
```

#### <a id="HashSet.add" href="#HashSet.add">func (s *HashSet) add(h uintptr)</a>

```
searchKey: runtime_test.HashSet.add
```

```Go
func (s *HashSet) add(h uintptr)
```

#### <a id="HashSet.addS" href="#HashSet.addS">func (s *HashSet) addS(x string)</a>

```
searchKey: runtime_test.HashSet.addS
```

```Go
func (s *HashSet) addS(x string)
```

#### <a id="HashSet.addB" href="#HashSet.addB">func (s *HashSet) addB(x []byte)</a>

```
searchKey: runtime_test.HashSet.addB
```

```Go
func (s *HashSet) addB(x []byte)
```

#### <a id="HashSet.addS_seed" href="#HashSet.addS_seed">func (s *HashSet) addS_seed(x string, seed uintptr)</a>

```
searchKey: runtime_test.HashSet.addS_seed
```

```Go
func (s *HashSet) addS_seed(x string, seed uintptr)
```

#### <a id="HashSet.check" href="#HashSet.check">func (s *HashSet) check(t *testing.T)</a>

```
searchKey: runtime_test.HashSet.check
```

```Go
func (s *HashSet) check(t *testing.T)
```

### <a id="Key" href="#Key">type Key interface</a>

```
searchKey: runtime_test.Key
```

```Go
type Key interface {
	clear()              // set bits all to 0
	random(r *rand.Rand) // set key to something random
	bits() int           // how many bits key has
	flipBit(i int)       // flip bit i of the key
	hash() uintptr       // hash the key
	name() string        // for error reporting
}
```

### <a id="BytesKey" href="#BytesKey">type BytesKey struct</a>

```
searchKey: runtime_test.BytesKey
```

```Go
type BytesKey struct {
	b []byte
}
```

#### <a id="BytesKey.clear" href="#BytesKey.clear">func (k *BytesKey) clear()</a>

```
searchKey: runtime_test.BytesKey.clear
```

```Go
func (k *BytesKey) clear()
```

#### <a id="BytesKey.random" href="#BytesKey.random">func (k *BytesKey) random(r *rand.Rand)</a>

```
searchKey: runtime_test.BytesKey.random
```

```Go
func (k *BytesKey) random(r *rand.Rand)
```

#### <a id="BytesKey.bits" href="#BytesKey.bits">func (k *BytesKey) bits() int</a>

```
searchKey: runtime_test.BytesKey.bits
```

```Go
func (k *BytesKey) bits() int
```

#### <a id="BytesKey.flipBit" href="#BytesKey.flipBit">func (k *BytesKey) flipBit(i int)</a>

```
searchKey: runtime_test.BytesKey.flipBit
```

```Go
func (k *BytesKey) flipBit(i int)
```

#### <a id="BytesKey.hash" href="#BytesKey.hash">func (k *BytesKey) hash() uintptr</a>

```
searchKey: runtime_test.BytesKey.hash
```

```Go
func (k *BytesKey) hash() uintptr
```

#### <a id="BytesKey.name" href="#BytesKey.name">func (k *BytesKey) name() string</a>

```
searchKey: runtime_test.BytesKey.name
```

```Go
func (k *BytesKey) name() string
```

### <a id="Int32Key" href="#Int32Key">type Int32Key struct</a>

```
searchKey: runtime_test.Int32Key
```

```Go
type Int32Key struct {
	i uint32
}
```

#### <a id="Int32Key.clear" href="#Int32Key.clear">func (k *Int32Key) clear()</a>

```
searchKey: runtime_test.Int32Key.clear
```

```Go
func (k *Int32Key) clear()
```

#### <a id="Int32Key.random" href="#Int32Key.random">func (k *Int32Key) random(r *rand.Rand)</a>

```
searchKey: runtime_test.Int32Key.random
```

```Go
func (k *Int32Key) random(r *rand.Rand)
```

#### <a id="Int32Key.bits" href="#Int32Key.bits">func (k *Int32Key) bits() int</a>

```
searchKey: runtime_test.Int32Key.bits
```

```Go
func (k *Int32Key) bits() int
```

#### <a id="Int32Key.flipBit" href="#Int32Key.flipBit">func (k *Int32Key) flipBit(i int)</a>

```
searchKey: runtime_test.Int32Key.flipBit
```

```Go
func (k *Int32Key) flipBit(i int)
```

#### <a id="Int32Key.hash" href="#Int32Key.hash">func (k *Int32Key) hash() uintptr</a>

```
searchKey: runtime_test.Int32Key.hash
```

```Go
func (k *Int32Key) hash() uintptr
```

#### <a id="Int32Key.name" href="#Int32Key.name">func (k *Int32Key) name() string</a>

```
searchKey: runtime_test.Int32Key.name
```

```Go
func (k *Int32Key) name() string
```

### <a id="Int64Key" href="#Int64Key">type Int64Key struct</a>

```
searchKey: runtime_test.Int64Key
```

```Go
type Int64Key struct {
	i uint64
}
```

#### <a id="Int64Key.clear" href="#Int64Key.clear">func (k *Int64Key) clear()</a>

```
searchKey: runtime_test.Int64Key.clear
```

```Go
func (k *Int64Key) clear()
```

#### <a id="Int64Key.random" href="#Int64Key.random">func (k *Int64Key) random(r *rand.Rand)</a>

```
searchKey: runtime_test.Int64Key.random
```

```Go
func (k *Int64Key) random(r *rand.Rand)
```

#### <a id="Int64Key.bits" href="#Int64Key.bits">func (k *Int64Key) bits() int</a>

```
searchKey: runtime_test.Int64Key.bits
```

```Go
func (k *Int64Key) bits() int
```

#### <a id="Int64Key.flipBit" href="#Int64Key.flipBit">func (k *Int64Key) flipBit(i int)</a>

```
searchKey: runtime_test.Int64Key.flipBit
```

```Go
func (k *Int64Key) flipBit(i int)
```

#### <a id="Int64Key.hash" href="#Int64Key.hash">func (k *Int64Key) hash() uintptr</a>

```
searchKey: runtime_test.Int64Key.hash
```

```Go
func (k *Int64Key) hash() uintptr
```

#### <a id="Int64Key.name" href="#Int64Key.name">func (k *Int64Key) name() string</a>

```
searchKey: runtime_test.Int64Key.name
```

```Go
func (k *Int64Key) name() string
```

### <a id="EfaceKey" href="#EfaceKey">type EfaceKey struct</a>

```
searchKey: runtime_test.EfaceKey
```

```Go
type EfaceKey struct {
	i interface{}
}
```

#### <a id="EfaceKey.clear" href="#EfaceKey.clear">func (k *EfaceKey) clear()</a>

```
searchKey: runtime_test.EfaceKey.clear
```

```Go
func (k *EfaceKey) clear()
```

#### <a id="EfaceKey.random" href="#EfaceKey.random">func (k *EfaceKey) random(r *rand.Rand)</a>

```
searchKey: runtime_test.EfaceKey.random
```

```Go
func (k *EfaceKey) random(r *rand.Rand)
```

#### <a id="EfaceKey.bits" href="#EfaceKey.bits">func (k *EfaceKey) bits() int</a>

```
searchKey: runtime_test.EfaceKey.bits
```

```Go
func (k *EfaceKey) bits() int
```

#### <a id="EfaceKey.flipBit" href="#EfaceKey.flipBit">func (k *EfaceKey) flipBit(i int)</a>

```
searchKey: runtime_test.EfaceKey.flipBit
```

```Go
func (k *EfaceKey) flipBit(i int)
```

#### <a id="EfaceKey.hash" href="#EfaceKey.hash">func (k *EfaceKey) hash() uintptr</a>

```
searchKey: runtime_test.EfaceKey.hash
```

```Go
func (k *EfaceKey) hash() uintptr
```

#### <a id="EfaceKey.name" href="#EfaceKey.name">func (k *EfaceKey) name() string</a>

```
searchKey: runtime_test.EfaceKey.name
```

```Go
func (k *EfaceKey) name() string
```

### <a id="IfaceKey" href="#IfaceKey">type IfaceKey struct</a>

```
searchKey: runtime_test.IfaceKey
```

```Go
type IfaceKey struct {
	i interface {
		F()
	}
}
```

#### <a id="IfaceKey.clear" href="#IfaceKey.clear">func (k *IfaceKey) clear()</a>

```
searchKey: runtime_test.IfaceKey.clear
```

```Go
func (k *IfaceKey) clear()
```

#### <a id="IfaceKey.random" href="#IfaceKey.random">func (k *IfaceKey) random(r *rand.Rand)</a>

```
searchKey: runtime_test.IfaceKey.random
```

```Go
func (k *IfaceKey) random(r *rand.Rand)
```

#### <a id="IfaceKey.bits" href="#IfaceKey.bits">func (k *IfaceKey) bits() int</a>

```
searchKey: runtime_test.IfaceKey.bits
```

```Go
func (k *IfaceKey) bits() int
```

#### <a id="IfaceKey.flipBit" href="#IfaceKey.flipBit">func (k *IfaceKey) flipBit(i int)</a>

```
searchKey: runtime_test.IfaceKey.flipBit
```

```Go
func (k *IfaceKey) flipBit(i int)
```

#### <a id="IfaceKey.hash" href="#IfaceKey.hash">func (k *IfaceKey) hash() uintptr</a>

```
searchKey: runtime_test.IfaceKey.hash
```

```Go
func (k *IfaceKey) hash() uintptr
```

#### <a id="IfaceKey.name" href="#IfaceKey.name">func (k *IfaceKey) name() string</a>

```
searchKey: runtime_test.IfaceKey.name
```

```Go
func (k *IfaceKey) name() string
```

### <a id="fInter" href="#fInter">type fInter uint64</a>

```
searchKey: runtime_test.fInter
```

```Go
type fInter uint64
```

#### <a id="fInter.F" href="#fInter.F">func (x fInter) F()</a>

```
searchKey: runtime_test.fInter.F
```

```Go
func (x fInter) F()
```

### <a id="I1" href="#I1">type I1 interface</a>

```
searchKey: runtime_test.I1
```

```Go
type I1 interface {
	Method1()
}
```

### <a id="I2" href="#I2">type I2 interface</a>

```
searchKey: runtime_test.I2
```

```Go
type I2 interface {
	Method1()
	Method2()
}
```

### <a id="TS" href="#TS">type TS uint16</a>

```
searchKey: runtime_test.TS
```

```Go
type TS uint16
```

#### <a id="TS.Method1" href="#TS.Method1">func (TS) Method1()</a>

```
searchKey: runtime_test.TS.Method1
```

```Go
func (TS) Method1()
```

#### <a id="TS.Method2" href="#TS.Method2">func (TS) Method2()</a>

```
searchKey: runtime_test.TS.Method2
```

```Go
func (TS) Method2()
```

### <a id="TM" href="#TM">type TM uintptr</a>

```
searchKey: runtime_test.TM
```

```Go
type TM uintptr
```

#### <a id="TM.Method1" href="#TM.Method1">func (TM) Method1()</a>

```
searchKey: runtime_test.TM.Method1
```

```Go
func (TM) Method1()
```

#### <a id="TM.Method2" href="#TM.Method2">func (TM) Method2()</a>

```
searchKey: runtime_test.TM.Method2
```

```Go
func (TM) Method2()
```

### <a id="TL" href="#TL">type TL [2]uintptr</a>

```
searchKey: runtime_test.TL
```

```Go
type TL [2]uintptr
```

#### <a id="TL.Method1" href="#TL.Method1">func (TL) Method1()</a>

```
searchKey: runtime_test.TL.Method1
```

```Go
func (TL) Method1()
```

#### <a id="TL.Method2" href="#TL.Method2">func (TL) Method2()</a>

```
searchKey: runtime_test.TL.Method2
```

```Go
func (TL) Method2()
```

### <a id="T8" href="#T8">type T8 uint8</a>

```
searchKey: runtime_test.T8
```

```Go
type T8 uint8
```

#### <a id="T8.Method1" href="#T8.Method1">func (T8) Method1()</a>

```
searchKey: runtime_test.T8.Method1
```

```Go
func (T8) Method1()
```

### <a id="T16" href="#T16">type T16 uint16</a>

```
searchKey: runtime_test.T16
```

```Go
type T16 uint16
```

#### <a id="T16.Method1" href="#T16.Method1">func (T16) Method1()</a>

```
searchKey: runtime_test.T16.Method1
```

```Go
func (T16) Method1()
```

### <a id="T32" href="#T32">type T32 uint32</a>

```
searchKey: runtime_test.T32
```

```Go
type T32 uint32
```

#### <a id="T32.Method1" href="#T32.Method1">func (T32) Method1()</a>

```
searchKey: runtime_test.T32.Method1
```

```Go
func (T32) Method1()
```

### <a id="T64" href="#T64">type T64 uint64</a>

```
searchKey: runtime_test.T64
```

```Go
type T64 uint64
```

#### <a id="T64.Method1" href="#T64.Method1">func (T64) Method1()</a>

```
searchKey: runtime_test.T64.Method1
```

```Go
func (T64) Method1()
```

### <a id="Tstr" href="#Tstr">type Tstr string</a>

```
searchKey: runtime_test.Tstr
```

```Go
type Tstr string
```

#### <a id="Tstr.Method1" href="#Tstr.Method1">func (Tstr) Method1()</a>

```
searchKey: runtime_test.Tstr.Method1
```

```Go
func (Tstr) Method1()
```

### <a id="Tslice" href="#Tslice">type Tslice []byte</a>

```
searchKey: runtime_test.Tslice
```

```Go
type Tslice []byte
```

#### <a id="Tslice.Method1" href="#Tslice.Method1">func (Tslice) Method1()</a>

```
searchKey: runtime_test.Tslice.Method1
```

```Go
func (Tslice) Method1()
```

### <a id="MyNode" href="#MyNode">type MyNode struct</a>

```
searchKey: runtime_test.MyNode
```

```Go
type MyNode struct {
	LFNode
	data int
}
```

#### <a id="toMyNode" href="#toMyNode">func toMyNode(node *LFNode) *MyNode</a>

```
searchKey: runtime_test.toMyNode
```

```Go
func toMyNode(node *LFNode) *MyNode
```

### <a id="obj12" href="#obj12">type obj12 struct</a>

```
searchKey: runtime_test.obj12
```

```Go
type obj12 struct {
	a uint64
	b uint32
}
```

### <a id="acLink" href="#acLink">type acLink struct</a>

```
searchKey: runtime_test.acLink
```

```Go
type acLink struct {
	x [1 << 20]byte
}
```

### <a id="LargeStruct" href="#LargeStruct">type LargeStruct struct</a>

```
searchKey: runtime_test.LargeStruct
```

```Go
type LargeStruct struct {
	x [16][]byte
}
```

### <a id="chunk" href="#chunk">type chunk [17]byte</a>

```
searchKey: runtime_test.chunk
```

```Go
type chunk [17]byte
```

### <a id="BigKey" href="#BigKey">type BigKey [3]int64</a>

```
searchKey: runtime_test.BigKey
```

```Go
type BigKey [3]int64
```

### <a id="BigVal" href="#BigVal">type BigVal [3]int64</a>

```
searchKey: runtime_test.BigVal
```

```Go
type BigVal [3]int64
```

### <a id="ComplexAlgKey" href="#ComplexAlgKey">type ComplexAlgKey struct</a>

```
searchKey: runtime_test.ComplexAlgKey
```

```Go
type ComplexAlgKey struct {
	a, b, c int64
	_       int
	d       int32
	_       int
	e       string
	_       int
	f, g, h int64
}
```

### <a id="FloatInt" href="#FloatInt">type FloatInt struct</a>

```
searchKey: runtime_test.FloatInt
```

```Go
type FloatInt struct {
	x float64
	y int
}
```

### <a id="empty" href="#empty">type empty struct{}</a>

```
searchKey: runtime_test.empty
```

```Go
type empty struct {
}
```

### <a id="canString" href="#canString">type canString int</a>

```
searchKey: runtime_test.canString
```

```Go
type canString int
```

#### <a id="canString.String" href="#canString.String">func (c canString) String() string</a>

```
searchKey: runtime_test.canString.String
```

```Go
func (c canString) String() string
```

### <a id="Tintptr" href="#Tintptr">type Tintptr *int</a>

```
searchKey: runtime_test.Tintptr
```

```Go
type Tintptr *int // assignable to *int

```

### <a id="Tint" href="#Tint">type Tint int</a>

```
searchKey: runtime_test.Tint
```

```Go
type Tint int // *Tint implements Tinter, interface{}

```

#### <a id="Tint.m" href="#Tint.m">func (t *Tint) m()</a>

```
searchKey: runtime_test.Tint.m
```

```Go
func (t *Tint) m()
```

### <a id="Tinter" href="#Tinter">type Tinter interface</a>

```
searchKey: runtime_test.Tinter
```

```Go
type Tinter interface {
	m()
}
```

### <a id="bigValue" href="#bigValue">type bigValue struct</a>

```
searchKey: runtime_test.bigValue
```

```Go
type bigValue struct {
	fill uint64
	it   bool
	up   string
}
```

### <a id="objtype" href="#objtype">type objtype [320]byte</a>

```
searchKey: runtime_test.objtype
```

```Go
type objtype [objsize]byte
```

#### <a id="adjChunks" href="#adjChunks">func adjChunks() (*objtype, *objtype)</a>

```
searchKey: runtime_test.adjChunks
```

```Go
func adjChunks() (*objtype, *objtype)
```

#### <a id="adjStringChunk" href="#adjStringChunk">func adjStringChunk() (string, *objtype)</a>

```
searchKey: runtime_test.adjStringChunk
```

```Go
func adjStringChunk() (string, *objtype)
```

### <a id="Object1" href="#Object1">type Object1 struct</a>

```
searchKey: runtime_test.Object1
```

```Go
type Object1 struct {
	Something []byte
}
```

### <a id="Object2" href="#Object2">type Object2 struct</a>

```
searchKey: runtime_test.Object2
```

```Go
type Object2 struct {
	Something byte
}
```

### <a id="Matrix" href="#Matrix">type Matrix [][]float64</a>

```
searchKey: runtime_test.Matrix
```

```Go
type Matrix [][]float64
```

#### <a id="makeMatrix" href="#makeMatrix">func makeMatrix(n int) Matrix</a>

```
searchKey: runtime_test.makeMatrix
```

```Go
func makeMatrix(n int) Matrix
```

### <a id="struct24" href="#struct24">type struct24 struct</a>

```
searchKey: runtime_test.struct24
```

```Go
type struct24 struct{ a, b, c int64 }
```

### <a id="struct32" href="#struct32">type struct32 struct</a>

```
searchKey: runtime_test.struct32
```

```Go
type struct32 struct{ a, b, c, d int64 }
```

### <a id="struct40" href="#struct40">type struct40 struct</a>

```
searchKey: runtime_test.struct40
```

```Go
type struct40 struct{ a, b, c, d, e int64 }
```

### <a id="bigBuf" href="#bigBuf">type bigBuf [4096]byte</a>

```
searchKey: runtime_test.bigBuf
```

```Go
type bigBuf [4 * 1024]byte
```

### <a id="xtreeNode" href="#xtreeNode">type xtreeNode struct</a>

```
searchKey: runtime_test.xtreeNode
```

```Go
type xtreeNode struct {
	l, r *xtreeNode
}
```

#### <a id="makeTree" href="#makeTree">func makeTree(d int) *xtreeNode</a>

```
searchKey: runtime_test.makeTree
```

```Go
func makeTree(d int) *xtreeNode
```

### <a id="structWithMethod" href="#structWithMethod">type structWithMethod struct{}</a>

```
searchKey: runtime_test.structWithMethod
```

```Go
type structWithMethod struct{}
```

#### <a id="structWithMethod.caller" href="#structWithMethod.caller">func (s structWithMethod) caller() string</a>

```
searchKey: runtime_test.structWithMethod.caller
```

```Go
func (s structWithMethod) caller() string
```

#### <a id="structWithMethod.callers" href="#structWithMethod.callers">func (s structWithMethod) callers() []uintptr</a>

```
searchKey: runtime_test.structWithMethod.callers
```

```Go
func (s structWithMethod) callers() []uintptr
```

#### <a id="structWithMethod.stack" href="#structWithMethod.stack">func (s structWithMethod) stack() string</a>

```
searchKey: runtime_test.structWithMethod.stack
```

```Go
func (s structWithMethod) stack() string
```

#### <a id="structWithMethod.nop" href="#structWithMethod.nop">func (s structWithMethod) nop()</a>

```
searchKey: runtime_test.structWithMethod.nop
```

```Go
func (s structWithMethod) nop()
```

### <a id="I" href="#I">type I interface</a>

```
searchKey: runtime_test.I
```

```Go
type I interface {
	M()
}
```

### <a id="atoi64Test" href="#atoi64Test">type atoi64Test struct</a>

```
searchKey: runtime_test.atoi64Test
```

```Go
type atoi64Test struct {
	in  string
	out int64
	ok  bool
}
```

### <a id="atoi32Test" href="#atoi32Test">type atoi32Test struct</a>

```
searchKey: runtime_test.atoi32Test
```

```Go
type atoi32Test struct {
	in  string
	out int32
	ok  bool
}
```

### <a id="fakeTimeFrame" href="#fakeTimeFrame">type fakeTimeFrame struct</a>

```
searchKey: runtime_test.fakeTimeFrame
```

```Go
type fakeTimeFrame struct {
	time uint64
	data string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="f1" href="#f1">func f1(pan bool) []uintptr</a>

```
searchKey: runtime_test.f1
```

```Go
func f1(pan bool) []uintptr
```

### <a id="f2" href="#f2">func f2(pan bool) []uintptr</a>

```
searchKey: runtime_test.f2
```

```Go
func f2(pan bool) []uintptr
```

### <a id="f3" href="#f3">func f3(pan bool) []uintptr</a>

```
searchKey: runtime_test.f3
```

```Go
func f3(pan bool) []uintptr
```

### <a id="testCallers" href="#testCallers">func testCallers(t *testing.T, pcs []uintptr, pan bool)</a>

```
searchKey: runtime_test.testCallers
```

```Go
func testCallers(t *testing.T, pcs []uintptr, pan bool)
```

### <a id="testCallersEqual" href="#testCallersEqual">func testCallersEqual(t *testing.T, pcs []uintptr, want []string)</a>

```
searchKey: runtime_test.testCallersEqual
```

```Go
func testCallersEqual(t *testing.T, pcs []uintptr, want []string)
```

### <a id="TestCallers" href="#TestCallers">func TestCallers(t *testing.T)</a>

```
searchKey: runtime_test.TestCallers
```

```Go
func TestCallers(t *testing.T)
```

### <a id="TestCallersPanic" href="#TestCallersPanic">func TestCallersPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersPanic
```

```Go
func TestCallersPanic(t *testing.T)
```

### <a id="TestCallersDoublePanic" href="#TestCallersDoublePanic">func TestCallersDoublePanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersDoublePanic
```

```Go
func TestCallersDoublePanic(t *testing.T)
```

### <a id="TestCallersAfterRecovery" href="#TestCallersAfterRecovery">func TestCallersAfterRecovery(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersAfterRecovery
```

```Go
func TestCallersAfterRecovery(t *testing.T)
```

Test that a defer after a successful recovery looks like it is called directly from the function with the defers. 

### <a id="TestCallersAbortedPanic" href="#TestCallersAbortedPanic">func TestCallersAbortedPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersAbortedPanic
```

```Go
func TestCallersAbortedPanic(t *testing.T)
```

### <a id="TestCallersAbortedPanic2" href="#TestCallersAbortedPanic2">func TestCallersAbortedPanic2(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersAbortedPanic2
```

```Go
func TestCallersAbortedPanic2(t *testing.T)
```

### <a id="TestCallersNilPointerPanic" href="#TestCallersNilPointerPanic">func TestCallersNilPointerPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersNilPointerPanic
```

```Go
func TestCallersNilPointerPanic(t *testing.T)
```

### <a id="TestCallersDivZeroPanic" href="#TestCallersDivZeroPanic">func TestCallersDivZeroPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersDivZeroPanic
```

```Go
func TestCallersDivZeroPanic(t *testing.T)
```

### <a id="TestCallersDeferNilFuncPanic" href="#TestCallersDeferNilFuncPanic">func TestCallersDeferNilFuncPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersDeferNilFuncPanic
```

```Go
func TestCallersDeferNilFuncPanic(t *testing.T)
```

### <a id="TestCallersDeferNilFuncPanicWithLoop" href="#TestCallersDeferNilFuncPanicWithLoop">func TestCallersDeferNilFuncPanicWithLoop(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersDeferNilFuncPanicWithLoop
```

```Go
func TestCallersDeferNilFuncPanicWithLoop(t *testing.T)
```

Same test, but forcing non-open-coded defer by putting the defer in a loop.  See issue #36050 

### <a id="TestChan" href="#TestChan">func TestChan(t *testing.T)</a>

```
searchKey: runtime_test.TestChan
```

```Go
func TestChan(t *testing.T)
```

### <a id="TestNonblockRecvRace" href="#TestNonblockRecvRace">func TestNonblockRecvRace(t *testing.T)</a>

```
searchKey: runtime_test.TestNonblockRecvRace
```

```Go
func TestNonblockRecvRace(t *testing.T)
```

### <a id="TestNonblockSelectRace" href="#TestNonblockSelectRace">func TestNonblockSelectRace(t *testing.T)</a>

```
searchKey: runtime_test.TestNonblockSelectRace
```

```Go
func TestNonblockSelectRace(t *testing.T)
```

This test checks that select acts on the state of the channels at one moment in the execution, not over a smeared time window. In the test, one goroutine does: 

```
create c1, c2
make c1 ready for receiving
create second goroutine
make c2 ready for receiving
make c1 no longer ready for receiving (if possible)

```
The second goroutine does a non-blocking select receiving from c1 and c2. From the time the second goroutine is created, at least one of c1 and c2 is always ready for receiving, so the select in the second goroutine must always receive from one or the other. It must never execute the default case. 

### <a id="TestNonblockSelectRace2" href="#TestNonblockSelectRace2">func TestNonblockSelectRace2(t *testing.T)</a>

```
searchKey: runtime_test.TestNonblockSelectRace2
```

```Go
func TestNonblockSelectRace2(t *testing.T)
```

Same as TestNonblockSelectRace, but close(c2) replaces c2 <- 1. 

### <a id="TestSelfSelect" href="#TestSelfSelect">func TestSelfSelect(t *testing.T)</a>

```
searchKey: runtime_test.TestSelfSelect
```

```Go
func TestSelfSelect(t *testing.T)
```

### <a id="TestSelectStress" href="#TestSelectStress">func TestSelectStress(t *testing.T)</a>

```
searchKey: runtime_test.TestSelectStress
```

```Go
func TestSelectStress(t *testing.T)
```

### <a id="TestSelectFairness" href="#TestSelectFairness">func TestSelectFairness(t *testing.T)</a>

```
searchKey: runtime_test.TestSelectFairness
```

```Go
func TestSelectFairness(t *testing.T)
```

### <a id="TestChanSendInterface" href="#TestChanSendInterface">func TestChanSendInterface(t *testing.T)</a>

```
searchKey: runtime_test.TestChanSendInterface
```

```Go
func TestChanSendInterface(t *testing.T)
```

### <a id="TestPseudoRandomSend" href="#TestPseudoRandomSend">func TestPseudoRandomSend(t *testing.T)</a>

```
searchKey: runtime_test.TestPseudoRandomSend
```

```Go
func TestPseudoRandomSend(t *testing.T)
```

### <a id="TestMultiConsumer" href="#TestMultiConsumer">func TestMultiConsumer(t *testing.T)</a>

```
searchKey: runtime_test.TestMultiConsumer
```

```Go
func TestMultiConsumer(t *testing.T)
```

### <a id="TestShrinkStackDuringBlockedSend" href="#TestShrinkStackDuringBlockedSend">func TestShrinkStackDuringBlockedSend(t *testing.T)</a>

```
searchKey: runtime_test.TestShrinkStackDuringBlockedSend
```

```Go
func TestShrinkStackDuringBlockedSend(t *testing.T)
```

### <a id="TestNoShrinkStackWhileParking" href="#TestNoShrinkStackWhileParking">func TestNoShrinkStackWhileParking(t *testing.T)</a>

```
searchKey: runtime_test.TestNoShrinkStackWhileParking
```

```Go
func TestNoShrinkStackWhileParking(t *testing.T)
```

### <a id="TestSelectDuplicateChannel" href="#TestSelectDuplicateChannel">func TestSelectDuplicateChannel(t *testing.T)</a>

```
searchKey: runtime_test.TestSelectDuplicateChannel
```

```Go
func TestSelectDuplicateChannel(t *testing.T)
```

### <a id="TestSelectStackAdjust" href="#TestSelectStackAdjust">func TestSelectStackAdjust(t *testing.T)</a>

```
searchKey: runtime_test.TestSelectStackAdjust
```

```Go
func TestSelectStackAdjust(t *testing.T)
```

### <a id="BenchmarkMakeChan" href="#BenchmarkMakeChan">func BenchmarkMakeChan(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMakeChan
```

```Go
func BenchmarkMakeChan(b *testing.B)
```

### <a id="BenchmarkChanNonblocking" href="#BenchmarkChanNonblocking">func BenchmarkChanNonblocking(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanNonblocking
```

```Go
func BenchmarkChanNonblocking(b *testing.B)
```

### <a id="BenchmarkSelectUncontended" href="#BenchmarkSelectUncontended">func BenchmarkSelectUncontended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectUncontended
```

```Go
func BenchmarkSelectUncontended(b *testing.B)
```

### <a id="BenchmarkSelectSyncContended" href="#BenchmarkSelectSyncContended">func BenchmarkSelectSyncContended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectSyncContended
```

```Go
func BenchmarkSelectSyncContended(b *testing.B)
```

### <a id="BenchmarkSelectAsyncContended" href="#BenchmarkSelectAsyncContended">func BenchmarkSelectAsyncContended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectAsyncContended
```

```Go
func BenchmarkSelectAsyncContended(b *testing.B)
```

### <a id="BenchmarkSelectNonblock" href="#BenchmarkSelectNonblock">func BenchmarkSelectNonblock(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectNonblock
```

```Go
func BenchmarkSelectNonblock(b *testing.B)
```

### <a id="BenchmarkChanUncontended" href="#BenchmarkChanUncontended">func BenchmarkChanUncontended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanUncontended
```

```Go
func BenchmarkChanUncontended(b *testing.B)
```

### <a id="BenchmarkChanContended" href="#BenchmarkChanContended">func BenchmarkChanContended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanContended
```

```Go
func BenchmarkChanContended(b *testing.B)
```

### <a id="benchmarkChanSync" href="#benchmarkChanSync">func benchmarkChanSync(b *testing.B, work int)</a>

```
searchKey: runtime_test.benchmarkChanSync
```

```Go
func benchmarkChanSync(b *testing.B, work int)
```

### <a id="BenchmarkChanSync" href="#BenchmarkChanSync">func BenchmarkChanSync(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanSync
```

```Go
func BenchmarkChanSync(b *testing.B)
```

### <a id="BenchmarkChanSyncWork" href="#BenchmarkChanSyncWork">func BenchmarkChanSyncWork(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanSyncWork
```

```Go
func BenchmarkChanSyncWork(b *testing.B)
```

### <a id="benchmarkChanProdCons" href="#benchmarkChanProdCons">func benchmarkChanProdCons(b *testing.B, chanSize, localWork int)</a>

```
searchKey: runtime_test.benchmarkChanProdCons
```

```Go
func benchmarkChanProdCons(b *testing.B, chanSize, localWork int)
```

### <a id="BenchmarkChanProdCons0" href="#BenchmarkChanProdCons0">func BenchmarkChanProdCons0(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdCons0
```

```Go
func BenchmarkChanProdCons0(b *testing.B)
```

### <a id="BenchmarkChanProdCons10" href="#BenchmarkChanProdCons10">func BenchmarkChanProdCons10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdCons10
```

```Go
func BenchmarkChanProdCons10(b *testing.B)
```

### <a id="BenchmarkChanProdCons100" href="#BenchmarkChanProdCons100">func BenchmarkChanProdCons100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdCons100
```

```Go
func BenchmarkChanProdCons100(b *testing.B)
```

### <a id="BenchmarkChanProdConsWork0" href="#BenchmarkChanProdConsWork0">func BenchmarkChanProdConsWork0(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdConsWork0
```

```Go
func BenchmarkChanProdConsWork0(b *testing.B)
```

### <a id="BenchmarkChanProdConsWork10" href="#BenchmarkChanProdConsWork10">func BenchmarkChanProdConsWork10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdConsWork10
```

```Go
func BenchmarkChanProdConsWork10(b *testing.B)
```

### <a id="BenchmarkChanProdConsWork100" href="#BenchmarkChanProdConsWork100">func BenchmarkChanProdConsWork100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanProdConsWork100
```

```Go
func BenchmarkChanProdConsWork100(b *testing.B)
```

### <a id="BenchmarkSelectProdCons" href="#BenchmarkSelectProdCons">func BenchmarkSelectProdCons(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSelectProdCons
```

```Go
func BenchmarkSelectProdCons(b *testing.B)
```

### <a id="BenchmarkChanCreation" href="#BenchmarkChanCreation">func BenchmarkChanCreation(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanCreation
```

```Go
func BenchmarkChanCreation(b *testing.B)
```

### <a id="BenchmarkChanSem" href="#BenchmarkChanSem">func BenchmarkChanSem(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanSem
```

```Go
func BenchmarkChanSem(b *testing.B)
```

### <a id="BenchmarkChanPopular" href="#BenchmarkChanPopular">func BenchmarkChanPopular(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanPopular
```

```Go
func BenchmarkChanPopular(b *testing.B)
```

### <a id="BenchmarkChanClosed" href="#BenchmarkChanClosed">func BenchmarkChanClosed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkChanClosed
```

```Go
func BenchmarkChanClosed(b *testing.B)
```

### <a id="localWork" href="#localWork">func localWork(w int)</a>

```
searchKey: runtime_test.localWork
```

```Go
func localWork(w int)
```

### <a id="TestChanSendSelectBarrier" href="#TestChanSendSelectBarrier">func TestChanSendSelectBarrier(t *testing.T)</a>

```
searchKey: runtime_test.TestChanSendSelectBarrier
```

```Go
func TestChanSendSelectBarrier(t *testing.T)
```

### <a id="TestChanSendBarrier" href="#TestChanSendBarrier">func TestChanSendBarrier(t *testing.T)</a>

```
searchKey: runtime_test.TestChanSendBarrier
```

```Go
func TestChanSendBarrier(t *testing.T)
```

### <a id="testChanSendBarrier" href="#testChanSendBarrier">func testChanSendBarrier(useSelect bool)</a>

```
searchKey: runtime_test.testChanSendBarrier
```

```Go
func testChanSendBarrier(useSelect bool)
```

### <a id="TestCheckPtr" href="#TestCheckPtr">func TestCheckPtr(t *testing.T)</a>

```
searchKey: runtime_test.TestCheckPtr
```

```Go
func TestCheckPtr(t *testing.T)
```

### <a id="BenchmarkCallClosure" href="#BenchmarkCallClosure">func BenchmarkCallClosure(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure
```

```Go
func BenchmarkCallClosure(b *testing.B)
```

### <a id="BenchmarkCallClosure1" href="#BenchmarkCallClosure1">func BenchmarkCallClosure1(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure1
```

```Go
func BenchmarkCallClosure1(b *testing.B)
```

### <a id="BenchmarkCallClosure2" href="#BenchmarkCallClosure2">func BenchmarkCallClosure2(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure2
```

```Go
func BenchmarkCallClosure2(b *testing.B)
```

### <a id="addr1" href="#addr1">func addr1(x int) *int</a>

```
searchKey: runtime_test.addr1
```

```Go
func addr1(x int) *int
```

### <a id="BenchmarkCallClosure3" href="#BenchmarkCallClosure3">func BenchmarkCallClosure3(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure3
```

```Go
func BenchmarkCallClosure3(b *testing.B)
```

### <a id="addr2" href="#addr2">func addr2() (x int, p *int)</a>

```
searchKey: runtime_test.addr2
```

```Go
func addr2() (x int, p *int)
```

### <a id="BenchmarkCallClosure4" href="#BenchmarkCallClosure4">func BenchmarkCallClosure4(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCallClosure4
```

```Go
func BenchmarkCallClosure4(b *testing.B)
```

### <a id="BenchmarkComplex128DivNormal" href="#BenchmarkComplex128DivNormal">func BenchmarkComplex128DivNormal(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivNormal
```

```Go
func BenchmarkComplex128DivNormal(b *testing.B)
```

### <a id="BenchmarkComplex128DivNisNaN" href="#BenchmarkComplex128DivNisNaN">func BenchmarkComplex128DivNisNaN(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivNisNaN
```

```Go
func BenchmarkComplex128DivNisNaN(b *testing.B)
```

### <a id="BenchmarkComplex128DivDisNaN" href="#BenchmarkComplex128DivDisNaN">func BenchmarkComplex128DivDisNaN(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivDisNaN
```

```Go
func BenchmarkComplex128DivDisNaN(b *testing.B)
```

### <a id="BenchmarkComplex128DivNisInf" href="#BenchmarkComplex128DivNisInf">func BenchmarkComplex128DivNisInf(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivNisInf
```

```Go
func BenchmarkComplex128DivNisInf(b *testing.B)
```

### <a id="BenchmarkComplex128DivDisInf" href="#BenchmarkComplex128DivDisInf">func BenchmarkComplex128DivDisInf(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplex128DivDisInf
```

```Go
func BenchmarkComplex128DivDisInf(b *testing.B)
```

### <a id="TestCgoCrashHandler" href="#TestCgoCrashHandler">func TestCgoCrashHandler(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCrashHandler
```

```Go
func TestCgoCrashHandler(t *testing.T)
```

### <a id="TestCgoSignalDeadlock" href="#TestCgoSignalDeadlock">func TestCgoSignalDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoSignalDeadlock
```

```Go
func TestCgoSignalDeadlock(t *testing.T)
```

### <a id="TestCgoTraceback" href="#TestCgoTraceback">func TestCgoTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoTraceback
```

```Go
func TestCgoTraceback(t *testing.T)
```

### <a id="TestCgoCallbackGC" href="#TestCgoCallbackGC">func TestCgoCallbackGC(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCallbackGC
```

```Go
func TestCgoCallbackGC(t *testing.T)
```

### <a id="TestCgoExternalThreadPanic" href="#TestCgoExternalThreadPanic">func TestCgoExternalThreadPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoExternalThreadPanic
```

```Go
func TestCgoExternalThreadPanic(t *testing.T)
```

### <a id="TestCgoExternalThreadSIGPROF" href="#TestCgoExternalThreadSIGPROF">func TestCgoExternalThreadSIGPROF(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoExternalThreadSIGPROF
```

```Go
func TestCgoExternalThreadSIGPROF(t *testing.T)
```

### <a id="TestCgoExternalThreadSignal" href="#TestCgoExternalThreadSignal">func TestCgoExternalThreadSignal(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoExternalThreadSignal
```

```Go
func TestCgoExternalThreadSignal(t *testing.T)
```

### <a id="TestCgoDLLImports" href="#TestCgoDLLImports">func TestCgoDLLImports(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoDLLImports
```

```Go
func TestCgoDLLImports(t *testing.T)
```

### <a id="TestCgoExecSignalMask" href="#TestCgoExecSignalMask">func TestCgoExecSignalMask(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoExecSignalMask
```

```Go
func TestCgoExecSignalMask(t *testing.T)
```

### <a id="TestEnsureDropM" href="#TestEnsureDropM">func TestEnsureDropM(t *testing.T)</a>

```
searchKey: runtime_test.TestEnsureDropM
```

```Go
func TestEnsureDropM(t *testing.T)
```

### <a id="TestCgoCheckBytes" href="#TestCgoCheckBytes">func TestCgoCheckBytes(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCheckBytes
```

```Go
func TestCgoCheckBytes(t *testing.T)
```

Test for issue 14387. Test that the program that doesn't need any cgo pointer checking takes about the same amount of time with it as without it. 

### <a id="TestCgoPanicDeadlock" href="#TestCgoPanicDeadlock">func TestCgoPanicDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPanicDeadlock
```

```Go
func TestCgoPanicDeadlock(t *testing.T)
```

### <a id="TestCgoCCodeSIGPROF" href="#TestCgoCCodeSIGPROF">func TestCgoCCodeSIGPROF(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCCodeSIGPROF
```

```Go
func TestCgoCCodeSIGPROF(t *testing.T)
```

### <a id="TestCgoCrashTraceback" href="#TestCgoCrashTraceback">func TestCgoCrashTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCrashTraceback
```

```Go
func TestCgoCrashTraceback(t *testing.T)
```

### <a id="TestCgoCrashTracebackGo" href="#TestCgoCrashTracebackGo">func TestCgoCrashTracebackGo(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoCrashTracebackGo
```

```Go
func TestCgoCrashTracebackGo(t *testing.T)
```

### <a id="TestCgoTracebackContext" href="#TestCgoTracebackContext">func TestCgoTracebackContext(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoTracebackContext
```

```Go
func TestCgoTracebackContext(t *testing.T)
```

### <a id="testCgoPprof" href="#testCgoPprof">func testCgoPprof(t *testing.T, buildArg, runArg, top, bottom string)</a>

```
searchKey: runtime_test.testCgoPprof
```

```Go
func testCgoPprof(t *testing.T, buildArg, runArg, top, bottom string)
```

### <a id="TestCgoPprof" href="#TestCgoPprof">func TestCgoPprof(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPprof
```

```Go
func TestCgoPprof(t *testing.T)
```

### <a id="TestCgoPprofPIE" href="#TestCgoPprofPIE">func TestCgoPprofPIE(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPprofPIE
```

```Go
func TestCgoPprofPIE(t *testing.T)
```

### <a id="TestCgoPprofThread" href="#TestCgoPprofThread">func TestCgoPprofThread(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPprofThread
```

```Go
func TestCgoPprofThread(t *testing.T)
```

### <a id="TestCgoPprofThreadNoTraceback" href="#TestCgoPprofThreadNoTraceback">func TestCgoPprofThreadNoTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoPprofThreadNoTraceback
```

```Go
func TestCgoPprofThreadNoTraceback(t *testing.T)
```

### <a id="TestRaceProf" href="#TestRaceProf">func TestRaceProf(t *testing.T)</a>

```
searchKey: runtime_test.TestRaceProf
```

```Go
func TestRaceProf(t *testing.T)
```

### <a id="TestRaceSignal" href="#TestRaceSignal">func TestRaceSignal(t *testing.T)</a>

```
searchKey: runtime_test.TestRaceSignal
```

```Go
func TestRaceSignal(t *testing.T)
```

### <a id="TestCgoNumGoroutine" href="#TestCgoNumGoroutine">func TestCgoNumGoroutine(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoNumGoroutine
```

```Go
func TestCgoNumGoroutine(t *testing.T)
```

### <a id="TestCatchPanic" href="#TestCatchPanic">func TestCatchPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCatchPanic
```

```Go
func TestCatchPanic(t *testing.T)
```

### <a id="TestCgoLockOSThreadExit" href="#TestCgoLockOSThreadExit">func TestCgoLockOSThreadExit(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoLockOSThreadExit
```

```Go
func TestCgoLockOSThreadExit(t *testing.T)
```

### <a id="TestWindowsStackMemoryCgo" href="#TestWindowsStackMemoryCgo">func TestWindowsStackMemoryCgo(t *testing.T)</a>

```
searchKey: runtime_test.TestWindowsStackMemoryCgo
```

```Go
func TestWindowsStackMemoryCgo(t *testing.T)
```

### <a id="TestSigStackSwapping" href="#TestSigStackSwapping">func TestSigStackSwapping(t *testing.T)</a>

```
searchKey: runtime_test.TestSigStackSwapping
```

```Go
func TestSigStackSwapping(t *testing.T)
```

### <a id="TestCgoTracebackSigpanic" href="#TestCgoTracebackSigpanic">func TestCgoTracebackSigpanic(t *testing.T)</a>

```
searchKey: runtime_test.TestCgoTracebackSigpanic
```

```Go
func TestCgoTracebackSigpanic(t *testing.T)
```

### <a id="TestBigStackCallbackCgo" href="#TestBigStackCallbackCgo">func TestBigStackCallbackCgo(t *testing.T)</a>

```
searchKey: runtime_test.TestBigStackCallbackCgo
```

```Go
func TestBigStackCallbackCgo(t *testing.T)
```

Test that C code called via cgo can use large Windows thread stacks and call back in to Go without crashing. See issue #20975. 

See also TestBigStackCallbackSyscall. 

### <a id="nextTrace" href="#nextTrace">func nextTrace(lines []string) ([]string, []string)</a>

```
searchKey: runtime_test.nextTrace
```

```Go
func nextTrace(lines []string) ([]string, []string)
```

### <a id="findTrace" href="#findTrace">func findTrace(text, top string) []string</a>

```
searchKey: runtime_test.findTrace
```

```Go
func findTrace(text, top string) []string
```

### <a id="TestSegv" href="#TestSegv">func TestSegv(t *testing.T)</a>

```
searchKey: runtime_test.TestSegv
```

```Go
func TestSegv(t *testing.T)
```

### <a id="TestEINTR" href="#TestEINTR">func TestEINTR(t *testing.T)</a>

```
searchKey: runtime_test.TestEINTR
```

```Go
func TestEINTR(t *testing.T)
```

TestEINTR tests that we handle EINTR correctly. See issue #20400 and friends. 

### <a id="TestNeedmDeadlock" href="#TestNeedmDeadlock">func TestNeedmDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestNeedmDeadlock
```

```Go
func TestNeedmDeadlock(t *testing.T)
```

Issue #42207. 

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: runtime_test.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="runTestProg" href="#runTestProg">func runTestProg(t *testing.T, binary, name string, env ...string) string</a>

```
searchKey: runtime_test.runTestProg
```

```Go
func runTestProg(t *testing.T, binary, name string, env ...string) string
```

### <a id="runBuiltTestProg" href="#runBuiltTestProg">func runBuiltTestProg(t *testing.T, exe, name string, env ...string) string</a>

```
searchKey: runtime_test.runBuiltTestProg
```

```Go
func runBuiltTestProg(t *testing.T, exe, name string, env ...string) string
```

### <a id="buildTestProg" href="#buildTestProg">func buildTestProg(t *testing.T, binary string, flags ...string) (string, error)</a>

```
searchKey: runtime_test.buildTestProg
```

```Go
func buildTestProg(t *testing.T, binary string, flags ...string) (string, error)
```

### <a id="TestVDSO" href="#TestVDSO">func TestVDSO(t *testing.T)</a>

```
searchKey: runtime_test.TestVDSO
```

```Go
func TestVDSO(t *testing.T)
```

### <a id="testCrashHandler" href="#testCrashHandler">func testCrashHandler(t *testing.T, cgo bool)</a>

```
searchKey: runtime_test.testCrashHandler
```

```Go
func testCrashHandler(t *testing.T, cgo bool)
```

### <a id="TestCrashHandler" href="#TestCrashHandler">func TestCrashHandler(t *testing.T)</a>

```
searchKey: runtime_test.TestCrashHandler
```

```Go
func TestCrashHandler(t *testing.T)
```

### <a id="testDeadlock" href="#testDeadlock">func testDeadlock(t *testing.T, name string)</a>

```
searchKey: runtime_test.testDeadlock
```

```Go
func testDeadlock(t *testing.T, name string)
```

### <a id="TestSimpleDeadlock" href="#TestSimpleDeadlock">func TestSimpleDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestSimpleDeadlock
```

```Go
func TestSimpleDeadlock(t *testing.T)
```

### <a id="TestInitDeadlock" href="#TestInitDeadlock">func TestInitDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestInitDeadlock
```

```Go
func TestInitDeadlock(t *testing.T)
```

### <a id="TestLockedDeadlock" href="#TestLockedDeadlock">func TestLockedDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestLockedDeadlock
```

```Go
func TestLockedDeadlock(t *testing.T)
```

### <a id="TestLockedDeadlock2" href="#TestLockedDeadlock2">func TestLockedDeadlock2(t *testing.T)</a>

```
searchKey: runtime_test.TestLockedDeadlock2
```

```Go
func TestLockedDeadlock2(t *testing.T)
```

### <a id="TestGoexitDeadlock" href="#TestGoexitDeadlock">func TestGoexitDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestGoexitDeadlock
```

```Go
func TestGoexitDeadlock(t *testing.T)
```

### <a id="TestStackOverflow" href="#TestStackOverflow">func TestStackOverflow(t *testing.T)</a>

```
searchKey: runtime_test.TestStackOverflow
```

```Go
func TestStackOverflow(t *testing.T)
```

### <a id="TestThreadExhaustion" href="#TestThreadExhaustion">func TestThreadExhaustion(t *testing.T)</a>

```
searchKey: runtime_test.TestThreadExhaustion
```

```Go
func TestThreadExhaustion(t *testing.T)
```

### <a id="TestRecursivePanic" href="#TestRecursivePanic">func TestRecursivePanic(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic
```

```Go
func TestRecursivePanic(t *testing.T)
```

### <a id="TestRecursivePanic2" href="#TestRecursivePanic2">func TestRecursivePanic2(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic2
```

```Go
func TestRecursivePanic2(t *testing.T)
```

### <a id="TestRecursivePanic3" href="#TestRecursivePanic3">func TestRecursivePanic3(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic3
```

```Go
func TestRecursivePanic3(t *testing.T)
```

### <a id="TestRecursivePanic4" href="#TestRecursivePanic4">func TestRecursivePanic4(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic4
```

```Go
func TestRecursivePanic4(t *testing.T)
```

### <a id="TestRecursivePanic5" href="#TestRecursivePanic5">func TestRecursivePanic5(t *testing.T)</a>

```
searchKey: runtime_test.TestRecursivePanic5
```

```Go
func TestRecursivePanic5(t *testing.T)
```

### <a id="TestGoexitCrash" href="#TestGoexitCrash">func TestGoexitCrash(t *testing.T)</a>

```
searchKey: runtime_test.TestGoexitCrash
```

```Go
func TestGoexitCrash(t *testing.T)
```

### <a id="TestGoexitDefer" href="#TestGoexitDefer">func TestGoexitDefer(t *testing.T)</a>

```
searchKey: runtime_test.TestGoexitDefer
```

```Go
func TestGoexitDefer(t *testing.T)
```

### <a id="TestGoNil" href="#TestGoNil">func TestGoNil(t *testing.T)</a>

```
searchKey: runtime_test.TestGoNil
```

```Go
func TestGoNil(t *testing.T)
```

### <a id="TestMainGoroutineID" href="#TestMainGoroutineID">func TestMainGoroutineID(t *testing.T)</a>

```
searchKey: runtime_test.TestMainGoroutineID
```

```Go
func TestMainGoroutineID(t *testing.T)
```

### <a id="TestNoHelperGoroutines" href="#TestNoHelperGoroutines">func TestNoHelperGoroutines(t *testing.T)</a>

```
searchKey: runtime_test.TestNoHelperGoroutines
```

```Go
func TestNoHelperGoroutines(t *testing.T)
```

### <a id="TestBreakpoint" href="#TestBreakpoint">func TestBreakpoint(t *testing.T)</a>

```
searchKey: runtime_test.TestBreakpoint
```

```Go
func TestBreakpoint(t *testing.T)
```

### <a id="TestGoexitInPanic" href="#TestGoexitInPanic">func TestGoexitInPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestGoexitInPanic
```

```Go
func TestGoexitInPanic(t *testing.T)
```

### <a id="TestRuntimePanicWithRuntimeError" href="#TestRuntimePanicWithRuntimeError">func TestRuntimePanicWithRuntimeError(t *testing.T)</a>

```
searchKey: runtime_test.TestRuntimePanicWithRuntimeError
```

```Go
func TestRuntimePanicWithRuntimeError(t *testing.T)
```

Issue 14965: Runtime panics should be of type runtime.Error 

### <a id="panicValue" href="#panicValue">func panicValue(fn func()) (recovered interface{})</a>

```
searchKey: runtime_test.panicValue
```

```Go
func panicValue(fn func()) (recovered interface{})
```

### <a id="TestPanicAfterGoexit" href="#TestPanicAfterGoexit">func TestPanicAfterGoexit(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicAfterGoexit
```

```Go
func TestPanicAfterGoexit(t *testing.T)
```

### <a id="TestRecoveredPanicAfterGoexit" href="#TestRecoveredPanicAfterGoexit">func TestRecoveredPanicAfterGoexit(t *testing.T)</a>

```
searchKey: runtime_test.TestRecoveredPanicAfterGoexit
```

```Go
func TestRecoveredPanicAfterGoexit(t *testing.T)
```

### <a id="TestRecoverBeforePanicAfterGoexit" href="#TestRecoverBeforePanicAfterGoexit">func TestRecoverBeforePanicAfterGoexit(t *testing.T)</a>

```
searchKey: runtime_test.TestRecoverBeforePanicAfterGoexit
```

```Go
func TestRecoverBeforePanicAfterGoexit(t *testing.T)
```

### <a id="TestRecoverBeforePanicAfterGoexit2" href="#TestRecoverBeforePanicAfterGoexit2">func TestRecoverBeforePanicAfterGoexit2(t *testing.T)</a>

```
searchKey: runtime_test.TestRecoverBeforePanicAfterGoexit2
```

```Go
func TestRecoverBeforePanicAfterGoexit2(t *testing.T)
```

### <a id="TestNetpollDeadlock" href="#TestNetpollDeadlock">func TestNetpollDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestNetpollDeadlock
```

```Go
func TestNetpollDeadlock(t *testing.T)
```

### <a id="TestPanicTraceback" href="#TestPanicTraceback">func TestPanicTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicTraceback
```

```Go
func TestPanicTraceback(t *testing.T)
```

### <a id="testPanicDeadlock" href="#testPanicDeadlock">func testPanicDeadlock(t *testing.T, name string, want string)</a>

```
searchKey: runtime_test.testPanicDeadlock
```

```Go
func testPanicDeadlock(t *testing.T, name string, want string)
```

### <a id="TestPanicDeadlockGosched" href="#TestPanicDeadlockGosched">func TestPanicDeadlockGosched(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicDeadlockGosched
```

```Go
func TestPanicDeadlockGosched(t *testing.T)
```

### <a id="TestPanicDeadlockSyscall" href="#TestPanicDeadlockSyscall">func TestPanicDeadlockSyscall(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicDeadlockSyscall
```

```Go
func TestPanicDeadlockSyscall(t *testing.T)
```

### <a id="TestPanicLoop" href="#TestPanicLoop">func TestPanicLoop(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicLoop
```

```Go
func TestPanicLoop(t *testing.T)
```

### <a id="TestMemPprof" href="#TestMemPprof">func TestMemPprof(t *testing.T)</a>

```
searchKey: runtime_test.TestMemPprof
```

```Go
func TestMemPprof(t *testing.T)
```

### <a id="TestConcurrentMapWrites" href="#TestConcurrentMapWrites">func TestConcurrentMapWrites(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentMapWrites
```

```Go
func TestConcurrentMapWrites(t *testing.T)
```

### <a id="TestConcurrentMapReadWrite" href="#TestConcurrentMapReadWrite">func TestConcurrentMapReadWrite(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentMapReadWrite
```

```Go
func TestConcurrentMapReadWrite(t *testing.T)
```

### <a id="TestConcurrentMapIterateWrite" href="#TestConcurrentMapIterateWrite">func TestConcurrentMapIterateWrite(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentMapIterateWrite
```

```Go
func TestConcurrentMapIterateWrite(t *testing.T)
```

### <a id="TestPanicInlined" href="#TestPanicInlined">func TestPanicInlined(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicInlined
```

```Go
func TestPanicInlined(t *testing.T)
```

Test for issue #10152. 

### <a id="TestPanicRace" href="#TestPanicRace">func TestPanicRace(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicRace
```

```Go
func TestPanicRace(t *testing.T)
```

Test for issues #3934 and #20018. We want to delay exiting until a panic print is complete. 

### <a id="TestBadTraceback" href="#TestBadTraceback">func TestBadTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestBadTraceback
```

```Go
func TestBadTraceback(t *testing.T)
```

### <a id="TestTimePprof" href="#TestTimePprof">func TestTimePprof(t *testing.T)</a>

```
searchKey: runtime_test.TestTimePprof
```

```Go
func TestTimePprof(t *testing.T)
```

### <a id="TestAbort" href="#TestAbort">func TestAbort(t *testing.T)</a>

```
searchKey: runtime_test.TestAbort
```

```Go
func TestAbort(t *testing.T)
```

Test that runtime.abort does so. 

### <a id="init" href="#init">func init()</a>

```
searchKey: runtime_test.init
```

```Go
func init()
```

For TestRuntimePanic: test a panic in the runtime package without involving the testing harness. 

### <a id="TestRuntimePanic" href="#TestRuntimePanic">func TestRuntimePanic(t *testing.T)</a>

```
searchKey: runtime_test.TestRuntimePanic
```

```Go
func TestRuntimePanic(t *testing.T)
```

### <a id="TestG0StackOverflow" href="#TestG0StackOverflow">func TestG0StackOverflow(t *testing.T)</a>

```
searchKey: runtime_test.TestG0StackOverflow
```

```Go
func TestG0StackOverflow(t *testing.T)
```

Test that g0 stack overflows are handled gracefully. 

### <a id="TestDoublePanic" href="#TestDoublePanic">func TestDoublePanic(t *testing.T)</a>

```
searchKey: runtime_test.TestDoublePanic
```

```Go
func TestDoublePanic(t *testing.T)
```

Test that panic message is not clobbered. See issue 30150. 

### <a id="init" href="#init">func init()</a>

```
searchKey: runtime_test.init
```

```Go
func init()
```

### <a id="TestBadOpen" href="#TestBadOpen">func TestBadOpen(t *testing.T)</a>

```
searchKey: runtime_test.TestBadOpen
```

```Go
func TestBadOpen(t *testing.T)
```

### <a id="TestCrashDumpsAllThreads" href="#TestCrashDumpsAllThreads">func TestCrashDumpsAllThreads(t *testing.T)</a>

```
searchKey: runtime_test.TestCrashDumpsAllThreads
```

```Go
func TestCrashDumpsAllThreads(t *testing.T)
```

### <a id="TestPanicSystemstack" href="#TestPanicSystemstack">func TestPanicSystemstack(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicSystemstack
```

```Go
func TestPanicSystemstack(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: runtime_test.init
```

```Go
func init()
```

### <a id="testPanicSystemstackInternal" href="#testPanicSystemstackInternal">func testPanicSystemstackInternal()</a>

```
searchKey: runtime_test.testPanicSystemstackInternal
```

```Go
func testPanicSystemstackInternal()
```

### <a id="TestSignalExitStatus" href="#TestSignalExitStatus">func TestSignalExitStatus(t *testing.T)</a>

```
searchKey: runtime_test.TestSignalExitStatus
```

```Go
func TestSignalExitStatus(t *testing.T)
```

### <a id="TestSignalIgnoreSIGTRAP" href="#TestSignalIgnoreSIGTRAP">func TestSignalIgnoreSIGTRAP(t *testing.T)</a>

```
searchKey: runtime_test.TestSignalIgnoreSIGTRAP
```

```Go
func TestSignalIgnoreSIGTRAP(t *testing.T)
```

### <a id="TestSignalDuringExec" href="#TestSignalDuringExec">func TestSignalDuringExec(t *testing.T)</a>

```
searchKey: runtime_test.TestSignalDuringExec
```

```Go
func TestSignalDuringExec(t *testing.T)
```

### <a id="TestSignalM" href="#TestSignalM">func TestSignalM(t *testing.T)</a>

```
searchKey: runtime_test.TestSignalM
```

```Go
func TestSignalM(t *testing.T)
```

### <a id="skipDebugLog" href="#skipDebugLog">func skipDebugLog(t *testing.T)</a>

```
searchKey: runtime_test.skipDebugLog
```

```Go
func skipDebugLog(t *testing.T)
```

### <a id="dlogCanonicalize" href="#dlogCanonicalize">func dlogCanonicalize(x string) string</a>

```
searchKey: runtime_test.dlogCanonicalize
```

```Go
func dlogCanonicalize(x string) string
```

### <a id="TestDebugLog" href="#TestDebugLog">func TestDebugLog(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLog
```

```Go
func TestDebugLog(t *testing.T)
```

### <a id="TestDebugLogTypes" href="#TestDebugLogTypes">func TestDebugLogTypes(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogTypes
```

```Go
func TestDebugLogTypes(t *testing.T)
```

### <a id="TestDebugLogSym" href="#TestDebugLogSym">func TestDebugLogSym(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogSym
```

```Go
func TestDebugLogSym(t *testing.T)
```

### <a id="TestDebugLogInterleaving" href="#TestDebugLogInterleaving">func TestDebugLogInterleaving(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogInterleaving
```

```Go
func TestDebugLogInterleaving(t *testing.T)
```

### <a id="TestDebugLogWraparound" href="#TestDebugLogWraparound">func TestDebugLogWraparound(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogWraparound
```

```Go
func TestDebugLogWraparound(t *testing.T)
```

### <a id="TestDebugLogLongString" href="#TestDebugLogLongString">func TestDebugLogLongString(t *testing.T)</a>

```
searchKey: runtime_test.TestDebugLogLongString
```

```Go
func TestDebugLogLongString(t *testing.T)
```

### <a id="TestUnconditionalPanic" href="#TestUnconditionalPanic">func TestUnconditionalPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestUnconditionalPanic
```

```Go
func TestUnconditionalPanic(t *testing.T)
```

Make sure open-coded defer exit code is not lost, even when there is an unconditional panic (hence no return from the function) 

### <a id="TestOpenAndNonOpenDefers" href="#TestOpenAndNonOpenDefers">func TestOpenAndNonOpenDefers(t *testing.T)</a>

```
searchKey: runtime_test.TestOpenAndNonOpenDefers
```

```Go
func TestOpenAndNonOpenDefers(t *testing.T)
```

Test an open-coded defer and non-open-coded defer - make sure both defers run and call recover() 

### <a id="testOpen" href="#testOpen">func testOpen(t *testing.T, arg int)</a>

```
searchKey: runtime_test.testOpen
```

```Go
func testOpen(t *testing.T, arg int)
```

### <a id="TestNonOpenAndOpenDefers" href="#TestNonOpenAndOpenDefers">func TestNonOpenAndOpenDefers(t *testing.T)</a>

```
searchKey: runtime_test.TestNonOpenAndOpenDefers
```

```Go
func TestNonOpenAndOpenDefers(t *testing.T)
```

Test a non-open-coded defer and an open-coded defer - make sure both defers run and call recover() 

### <a id="TestConditionalDefers" href="#TestConditionalDefers">func TestConditionalDefers(t *testing.T)</a>

```
searchKey: runtime_test.TestConditionalDefers
```

```Go
func TestConditionalDefers(t *testing.T)
```

Make sure that conditional open-coded defers are activated correctly and run in the correct order. 

### <a id="testConditionalDefers" href="#testConditionalDefers">func testConditionalDefers(n int)</a>

```
searchKey: runtime_test.testConditionalDefers
```

```Go
func testConditionalDefers(n int)
```

### <a id="TestDisappearingDefer" href="#TestDisappearingDefer">func TestDisappearingDefer(t *testing.T)</a>

```
searchKey: runtime_test.TestDisappearingDefer
```

```Go
func TestDisappearingDefer(t *testing.T)
```

Test that there is no compile-time or run-time error if an open-coded defer call is removed by constant propagation and dead-code elimination. 

### <a id="TestAbortedPanic" href="#TestAbortedPanic">func TestAbortedPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestAbortedPanic
```

```Go
func TestAbortedPanic(t *testing.T)
```

This tests an extra recursive panic behavior that is only specified in the code. Suppose a first panic P1 happens and starts processing defer calls. If a second panic P2 happens while processing defer call D in frame F, then defer call processing is restarted (with some potentially new defer calls created by D or its callees). If the defer processing reaches the started defer call D again in the defer stack, then the original panic P1 is aborted and cannot continue panic processing or be recovered. If the panic P2 does a recover at some point, it will naturally remove the original panic P1 from the stack (since the original panic had to be in frame F or a descendant of F). 

### <a id="TestRecoverMatching" href="#TestRecoverMatching">func TestRecoverMatching(t *testing.T)</a>

```
searchKey: runtime_test.TestRecoverMatching
```

```Go
func TestRecoverMatching(t *testing.T)
```

This tests that recover() does not succeed unless it is called directly from a defer function that is directly called by the panic.  Here, we first call it from a defer function that is created by the defer function called directly by the panic.  In 

### <a id="sideeffect" href="#sideeffect">func sideeffect(n int64) int64</a>

```
searchKey: runtime_test.sideeffect
```

```Go
func sideeffect(n int64) int64
```

### <a id="TestNonSSAableArgs" href="#TestNonSSAableArgs">func TestNonSSAableArgs(t *testing.T)</a>

```
searchKey: runtime_test.TestNonSSAableArgs
```

```Go
func TestNonSSAableArgs(t *testing.T)
```

Test that nonSSAable arguments to defer are handled correctly and only evaluated once. 

### <a id="doPanic" href="#doPanic">func doPanic()</a>

```
searchKey: runtime_test.doPanic
```

```Go
func doPanic()
```

### <a id="TestDeferForFuncWithNoExit" href="#TestDeferForFuncWithNoExit">func TestDeferForFuncWithNoExit(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferForFuncWithNoExit
```

```Go
func TestDeferForFuncWithNoExit(t *testing.T)
```

### <a id="TestDeferWithRepeatedRepanics" href="#TestDeferWithRepeatedRepanics">func TestDeferWithRepeatedRepanics(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferWithRepeatedRepanics
```

```Go
func TestDeferWithRepeatedRepanics(t *testing.T)
```

Test case approximating issue #37664, where a recursive function (interpreter) may do repeated recovers/re-panics until it reaches the frame where the panic can actually be handled. The recurseFnPanicRec() function is testing that there are no stale defer structs on the defer chain after the interpreter() sequence, by writing a bunch of 0xffffffffs into several recursive stack frames, and then doing a single panic-recover which would invoke any such stale defer structs. 

### <a id="interpreter" href="#interpreter">func interpreter(level int, maxlevel int, rec int)</a>

```
searchKey: runtime_test.interpreter
```

```Go
func interpreter(level int, maxlevel int, rec int)
```

### <a id="recurseFnPanicRec" href="#recurseFnPanicRec">func recurseFnPanicRec(level int, maxlevel int)</a>

```
searchKey: runtime_test.recurseFnPanicRec
```

```Go
func recurseFnPanicRec(level int, maxlevel int)
```

### <a id="recurseFn" href="#recurseFn">func recurseFn(level int, maxlevel int)</a>

```
searchKey: runtime_test.recurseFn
```

```Go
func recurseFn(level int, maxlevel int)
```

### <a id="TestIssue37688" href="#TestIssue37688">func TestIssue37688(t *testing.T)</a>

```
searchKey: runtime_test.TestIssue37688
```

```Go
func TestIssue37688(t *testing.T)
```

Try to reproduce issue #37688, where a pointer to an open-coded defer struct is mistakenly held, and that struct keeps a pointer to a stack-allocated defer struct, and that stack-allocated struct gets overwritten or the stack gets moved, so a memory error happens on GC. 

### <a id="g2" href="#g2">func g2()</a>

```
searchKey: runtime_test.g2
```

```Go
func g2()
```

### <a id="g3" href="#g3">func g3()</a>

```
searchKey: runtime_test.g3
```

```Go
func g3()
```

### <a id="ff1" href="#ff1">func ff1(ap *foo, a, b, c, d, e, f, g, h, i int)</a>

```
searchKey: runtime_test.ff1
```

```Go
func ff1(ap *foo, a, b, c, d, e, f, g, h, i int)
```

### <a id="rec1" href="#rec1">func rec1(max int)</a>

```
searchKey: runtime_test.rec1
```

```Go
func rec1(max int)
```

### <a id="TestIssue43921" href="#TestIssue43921">func TestIssue43921(t *testing.T)</a>

```
searchKey: runtime_test.TestIssue43921
```

```Go
func TestIssue43921(t *testing.T)
```

### <a id="expect" href="#expect">func expect(t *testing.T, n int, err interface{})</a>

```
searchKey: runtime_test.expect
```

```Go
func expect(t *testing.T, n int, err interface{})
```

### <a id="TestFixedGOROOT" href="#TestFixedGOROOT">func TestFixedGOROOT(t *testing.T)</a>

```
searchKey: runtime_test.TestFixedGOROOT
```

```Go
func TestFixedGOROOT(t *testing.T)
```

### <a id="ExampleFrames" href="#ExampleFrames">func ExampleFrames()</a>

```
searchKey: runtime_test.ExampleFrames
```

```Go
func ExampleFrames()
```

### <a id="TestFastLog2" href="#TestFastLog2">func TestFastLog2(t *testing.T)</a>

```
searchKey: runtime_test.TestFastLog2
```

```Go
func TestFastLog2(t *testing.T)
```

### <a id="TestGcSys" href="#TestGcSys">func TestGcSys(t *testing.T)</a>

```
searchKey: runtime_test.TestGcSys
```

```Go
func TestGcSys(t *testing.T)
```

### <a id="TestGcDeepNesting" href="#TestGcDeepNesting">func TestGcDeepNesting(t *testing.T)</a>

```
searchKey: runtime_test.TestGcDeepNesting
```

```Go
func TestGcDeepNesting(t *testing.T)
```

### <a id="TestGcMapIndirection" href="#TestGcMapIndirection">func TestGcMapIndirection(t *testing.T)</a>

```
searchKey: runtime_test.TestGcMapIndirection
```

```Go
func TestGcMapIndirection(t *testing.T)
```

### <a id="TestGcArraySlice" href="#TestGcArraySlice">func TestGcArraySlice(t *testing.T)</a>

```
searchKey: runtime_test.TestGcArraySlice
```

```Go
func TestGcArraySlice(t *testing.T)
```

### <a id="TestGcRescan" href="#TestGcRescan">func TestGcRescan(t *testing.T)</a>

```
searchKey: runtime_test.TestGcRescan
```

```Go
func TestGcRescan(t *testing.T)
```

### <a id="TestGcLastTime" href="#TestGcLastTime">func TestGcLastTime(t *testing.T)</a>

```
searchKey: runtime_test.TestGcLastTime
```

```Go
func TestGcLastTime(t *testing.T)
```

### <a id="TestHugeGCInfo" href="#TestHugeGCInfo">func TestHugeGCInfo(t *testing.T)</a>

```
searchKey: runtime_test.TestHugeGCInfo
```

```Go
func TestHugeGCInfo(t *testing.T)
```

### <a id="TestPeriodicGC" href="#TestPeriodicGC">func TestPeriodicGC(t *testing.T)</a>

```
searchKey: runtime_test.TestPeriodicGC
```

```Go
func TestPeriodicGC(t *testing.T)
```

### <a id="TestGcZombieReporting" href="#TestGcZombieReporting">func TestGcZombieReporting(t *testing.T)</a>

```
searchKey: runtime_test.TestGcZombieReporting
```

```Go
func TestGcZombieReporting(t *testing.T)
```

### <a id="TestGCTestMoveStackOnNextCall" href="#TestGCTestMoveStackOnNextCall">func TestGCTestMoveStackOnNextCall(t *testing.T)</a>

```
searchKey: runtime_test.TestGCTestMoveStackOnNextCall
```

```Go
func TestGCTestMoveStackOnNextCall(t *testing.T)
```

### <a id="moveStackCheck" href="#moveStackCheck">func moveStackCheck(t *testing.T, new *int, old uintptr) bool</a>

```
searchKey: runtime_test.moveStackCheck
```

```Go
func moveStackCheck(t *testing.T, new *int, old uintptr) bool
```

This must not be inlined because the point is to force a stack growth check and move the stack. 

### <a id="TestGCTestMoveStackRepeatedly" href="#TestGCTestMoveStackRepeatedly">func TestGCTestMoveStackRepeatedly(t *testing.T)</a>

```
searchKey: runtime_test.TestGCTestMoveStackRepeatedly
```

```Go
func TestGCTestMoveStackRepeatedly(t *testing.T)
```

### <a id="moveStack1" href="#moveStack1">func moveStack1(x bool)</a>

```
searchKey: runtime_test.moveStack1
```

```Go
func moveStack1(x bool)
```

### <a id="TestGCTestIsReachable" href="#TestGCTestIsReachable">func TestGCTestIsReachable(t *testing.T)</a>

```
searchKey: runtime_test.TestGCTestIsReachable
```

```Go
func TestGCTestIsReachable(t *testing.T)
```

### <a id="TestGCTestPointerClass" href="#TestGCTestPointerClass">func TestGCTestPointerClass(t *testing.T)</a>

```
searchKey: runtime_test.TestGCTestPointerClass
```

```Go
func TestGCTestPointerClass(t *testing.T)
```

### <a id="BenchmarkSetTypePtr" href="#BenchmarkSetTypePtr">func BenchmarkSetTypePtr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr
```

```Go
func BenchmarkSetTypePtr(b *testing.B)
```

### <a id="BenchmarkSetTypePtr8" href="#BenchmarkSetTypePtr8">func BenchmarkSetTypePtr8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr8
```

```Go
func BenchmarkSetTypePtr8(b *testing.B)
```

### <a id="BenchmarkSetTypePtr16" href="#BenchmarkSetTypePtr16">func BenchmarkSetTypePtr16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr16
```

```Go
func BenchmarkSetTypePtr16(b *testing.B)
```

### <a id="BenchmarkSetTypePtr32" href="#BenchmarkSetTypePtr32">func BenchmarkSetTypePtr32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr32
```

```Go
func BenchmarkSetTypePtr32(b *testing.B)
```

### <a id="BenchmarkSetTypePtr64" href="#BenchmarkSetTypePtr64">func BenchmarkSetTypePtr64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr64
```

```Go
func BenchmarkSetTypePtr64(b *testing.B)
```

### <a id="BenchmarkSetTypePtr126" href="#BenchmarkSetTypePtr126">func BenchmarkSetTypePtr126(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr126
```

```Go
func BenchmarkSetTypePtr126(b *testing.B)
```

### <a id="BenchmarkSetTypePtr128" href="#BenchmarkSetTypePtr128">func BenchmarkSetTypePtr128(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtr128
```

```Go
func BenchmarkSetTypePtr128(b *testing.B)
```

### <a id="BenchmarkSetTypePtrSlice" href="#BenchmarkSetTypePtrSlice">func BenchmarkSetTypePtrSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypePtrSlice
```

```Go
func BenchmarkSetTypePtrSlice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode1" href="#BenchmarkSetTypeNode1">func BenchmarkSetTypeNode1(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode1
```

```Go
func BenchmarkSetTypeNode1(b *testing.B)
```

### <a id="BenchmarkSetTypeNode1Slice" href="#BenchmarkSetTypeNode1Slice">func BenchmarkSetTypeNode1Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode1Slice
```

```Go
func BenchmarkSetTypeNode1Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode8" href="#BenchmarkSetTypeNode8">func BenchmarkSetTypeNode8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode8
```

```Go
func BenchmarkSetTypeNode8(b *testing.B)
```

### <a id="BenchmarkSetTypeNode8Slice" href="#BenchmarkSetTypeNode8Slice">func BenchmarkSetTypeNode8Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode8Slice
```

```Go
func BenchmarkSetTypeNode8Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode64" href="#BenchmarkSetTypeNode64">func BenchmarkSetTypeNode64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode64
```

```Go
func BenchmarkSetTypeNode64(b *testing.B)
```

### <a id="BenchmarkSetTypeNode64Slice" href="#BenchmarkSetTypeNode64Slice">func BenchmarkSetTypeNode64Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode64Slice
```

```Go
func BenchmarkSetTypeNode64Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode64Dead" href="#BenchmarkSetTypeNode64Dead">func BenchmarkSetTypeNode64Dead(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode64Dead
```

```Go
func BenchmarkSetTypeNode64Dead(b *testing.B)
```

### <a id="BenchmarkSetTypeNode64DeadSlice" href="#BenchmarkSetTypeNode64DeadSlice">func BenchmarkSetTypeNode64DeadSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode64DeadSlice
```

```Go
func BenchmarkSetTypeNode64DeadSlice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode124" href="#BenchmarkSetTypeNode124">func BenchmarkSetTypeNode124(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode124
```

```Go
func BenchmarkSetTypeNode124(b *testing.B)
```

### <a id="BenchmarkSetTypeNode124Slice" href="#BenchmarkSetTypeNode124Slice">func BenchmarkSetTypeNode124Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode124Slice
```

```Go
func BenchmarkSetTypeNode124Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode126" href="#BenchmarkSetTypeNode126">func BenchmarkSetTypeNode126(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode126
```

```Go
func BenchmarkSetTypeNode126(b *testing.B)
```

### <a id="BenchmarkSetTypeNode126Slice" href="#BenchmarkSetTypeNode126Slice">func BenchmarkSetTypeNode126Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode126Slice
```

```Go
func BenchmarkSetTypeNode126Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode128" href="#BenchmarkSetTypeNode128">func BenchmarkSetTypeNode128(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode128
```

```Go
func BenchmarkSetTypeNode128(b *testing.B)
```

### <a id="BenchmarkSetTypeNode128Slice" href="#BenchmarkSetTypeNode128Slice">func BenchmarkSetTypeNode128Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode128Slice
```

```Go
func BenchmarkSetTypeNode128Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode130" href="#BenchmarkSetTypeNode130">func BenchmarkSetTypeNode130(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode130
```

```Go
func BenchmarkSetTypeNode130(b *testing.B)
```

### <a id="BenchmarkSetTypeNode130Slice" href="#BenchmarkSetTypeNode130Slice">func BenchmarkSetTypeNode130Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode130Slice
```

```Go
func BenchmarkSetTypeNode130Slice(b *testing.B)
```

### <a id="BenchmarkSetTypeNode1024" href="#BenchmarkSetTypeNode1024">func BenchmarkSetTypeNode1024(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode1024
```

```Go
func BenchmarkSetTypeNode1024(b *testing.B)
```

### <a id="BenchmarkSetTypeNode1024Slice" href="#BenchmarkSetTypeNode1024Slice">func BenchmarkSetTypeNode1024Slice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSetTypeNode1024Slice
```

```Go
func BenchmarkSetTypeNode1024Slice(b *testing.B)
```

### <a id="benchSetType" href="#benchSetType">func benchSetType(b *testing.B, x interface{})</a>

```
searchKey: runtime_test.benchSetType
```

```Go
func benchSetType(b *testing.B, x interface{})
```

### <a id="BenchmarkAllocation" href="#BenchmarkAllocation">func BenchmarkAllocation(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAllocation
```

```Go
func BenchmarkAllocation(b *testing.B)
```

### <a id="TestPrintGC" href="#TestPrintGC">func TestPrintGC(t *testing.T)</a>

```
searchKey: runtime_test.TestPrintGC
```

```Go
func TestPrintGC(t *testing.T)
```

### <a id="testTypeSwitch" href="#testTypeSwitch">func testTypeSwitch(x interface{}) error</a>

```
searchKey: runtime_test.testTypeSwitch
```

```Go
func testTypeSwitch(x interface{}) error
```

### <a id="testAssert" href="#testAssert">func testAssert(x interface{}) error</a>

```
searchKey: runtime_test.testAssert
```

```Go
func testAssert(x interface{}) error
```

### <a id="testAssertVar" href="#testAssertVar">func testAssertVar(x interface{}) error</a>

```
searchKey: runtime_test.testAssertVar
```

```Go
func testAssertVar(x interface{}) error
```

### <a id="testIfaceEqual" href="#testIfaceEqual">func testIfaceEqual(x interface{})</a>

```
searchKey: runtime_test.testIfaceEqual
```

```Go
func testIfaceEqual(x interface{})
```

### <a id="TestPageAccounting" href="#TestPageAccounting">func TestPageAccounting(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAccounting
```

```Go
func TestPageAccounting(t *testing.T)
```

### <a id="TestReadMemStats" href="#TestReadMemStats">func TestReadMemStats(t *testing.T)</a>

```
searchKey: runtime_test.TestReadMemStats
```

```Go
func TestReadMemStats(t *testing.T)
```

### <a id="logDiff" href="#logDiff">func logDiff(t *testing.T, prefix string, got, want reflect.Value)</a>

```
searchKey: runtime_test.logDiff
```

```Go
func logDiff(t *testing.T, prefix string, got, want reflect.Value)
```

### <a id="BenchmarkReadMemStats" href="#BenchmarkReadMemStats">func BenchmarkReadMemStats(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkReadMemStats
```

```Go
func BenchmarkReadMemStats(b *testing.B)
```

### <a id="applyGCLoad" href="#applyGCLoad">func applyGCLoad(b *testing.B) func()</a>

```
searchKey: runtime_test.applyGCLoad
```

```Go
func applyGCLoad(b *testing.B) func()
```

### <a id="BenchmarkReadMemStatsLatency" href="#BenchmarkReadMemStatsLatency">func BenchmarkReadMemStatsLatency(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkReadMemStatsLatency
```

```Go
func BenchmarkReadMemStatsLatency(b *testing.B)
```

### <a id="TestUserForcedGC" href="#TestUserForcedGC">func TestUserForcedGC(t *testing.T)</a>

```
searchKey: runtime_test.TestUserForcedGC
```

```Go
func TestUserForcedGC(t *testing.T)
```

### <a id="writeBarrierBenchmark" href="#writeBarrierBenchmark">func writeBarrierBenchmark(b *testing.B, f func())</a>

```
searchKey: runtime_test.writeBarrierBenchmark
```

```Go
func writeBarrierBenchmark(b *testing.B, f func())
```

### <a id="BenchmarkWriteBarrier" href="#BenchmarkWriteBarrier">func BenchmarkWriteBarrier(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkWriteBarrier
```

```Go
func BenchmarkWriteBarrier(b *testing.B)
```

### <a id="BenchmarkBulkWriteBarrier" href="#BenchmarkBulkWriteBarrier">func BenchmarkBulkWriteBarrier(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkBulkWriteBarrier
```

```Go
func BenchmarkBulkWriteBarrier(b *testing.B)
```

### <a id="BenchmarkScanStackNoLocals" href="#BenchmarkScanStackNoLocals">func BenchmarkScanStackNoLocals(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkScanStackNoLocals
```

```Go
func BenchmarkScanStackNoLocals(b *testing.B)
```

### <a id="BenchmarkMSpanCountAlloc" href="#BenchmarkMSpanCountAlloc">func BenchmarkMSpanCountAlloc(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMSpanCountAlloc
```

```Go
func BenchmarkMSpanCountAlloc(b *testing.B)
```

### <a id="countpwg" href="#countpwg">func countpwg(n *int, ready *sync.WaitGroup, teardown chan bool)</a>

```
searchKey: runtime_test.countpwg
```

```Go
func countpwg(n *int, ready *sync.WaitGroup, teardown chan bool)
```

### <a id="TestGCInfo" href="#TestGCInfo">func TestGCInfo(t *testing.T)</a>

```
searchKey: runtime_test.TestGCInfo
```

```Go
func TestGCInfo(t *testing.T)
```

TestGCInfo tests that various objects in heap, data and bss receive correct GC pointer type info. 

### <a id="verifyGCInfo" href="#verifyGCInfo">func verifyGCInfo(t *testing.T, name string, p interface{}, mask0 []byte)</a>

```
searchKey: runtime_test.verifyGCInfo
```

```Go
func verifyGCInfo(t *testing.T, name string, p interface{}, mask0 []byte)
```

### <a id="trimDead" href="#trimDead">func trimDead(mask []byte) []byte</a>

```
searchKey: runtime_test.trimDead
```

```Go
func trimDead(mask []byte) []byte
```

### <a id="escape" href="#escape">func escape(p interface{}) interface{}</a>

```
searchKey: runtime_test.escape
```

```Go
func escape(p interface{}) interface{}
```

### <a id="infoBigStruct" href="#infoBigStruct">func infoBigStruct() []byte</a>

```
searchKey: runtime_test.infoBigStruct
```

```Go
func infoBigStruct() []byte
```

### <a id="TestMemHash32Equality" href="#TestMemHash32Equality">func TestMemHash32Equality(t *testing.T)</a>

```
searchKey: runtime_test.TestMemHash32Equality
```

```Go
func TestMemHash32Equality(t *testing.T)
```

### <a id="TestMemHash64Equality" href="#TestMemHash64Equality">func TestMemHash64Equality(t *testing.T)</a>

```
searchKey: runtime_test.TestMemHash64Equality
```

```Go
func TestMemHash64Equality(t *testing.T)
```

### <a id="TestSmhasherSanity" href="#TestSmhasherSanity">func TestSmhasherSanity(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherSanity
```

```Go
func TestSmhasherSanity(t *testing.T)
```

Sanity checks. hash should not depend on values outside key. hash should not depend on alignment. 

### <a id="TestSmhasherAppendedZeros" href="#TestSmhasherAppendedZeros">func TestSmhasherAppendedZeros(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherAppendedZeros
```

```Go
func TestSmhasherAppendedZeros(t *testing.T)
```

a string plus adding zeros must make distinct hashes 

### <a id="TestSmhasherSmallKeys" href="#TestSmhasherSmallKeys">func TestSmhasherSmallKeys(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherSmallKeys
```

```Go
func TestSmhasherSmallKeys(t *testing.T)
```

All 0-3 byte strings have distinct hashes. 

### <a id="TestSmhasherZeros" href="#TestSmhasherZeros">func TestSmhasherZeros(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherZeros
```

```Go
func TestSmhasherZeros(t *testing.T)
```

Different length strings of all zeros have distinct hashes. 

### <a id="TestSmhasherTwoNonzero" href="#TestSmhasherTwoNonzero">func TestSmhasherTwoNonzero(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherTwoNonzero
```

```Go
func TestSmhasherTwoNonzero(t *testing.T)
```

Strings with up to two nonzero bytes all have distinct hashes. 

### <a id="twoNonZero" href="#twoNonZero">func twoNonZero(h *HashSet, n int)</a>

```
searchKey: runtime_test.twoNonZero
```

```Go
func twoNonZero(h *HashSet, n int)
```

### <a id="TestSmhasherCyclic" href="#TestSmhasherCyclic">func TestSmhasherCyclic(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherCyclic
```

```Go
func TestSmhasherCyclic(t *testing.T)
```

Test strings with repeats, like "abcdabcdabcdabcd..." 

### <a id="TestSmhasherSparse" href="#TestSmhasherSparse">func TestSmhasherSparse(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherSparse
```

```Go
func TestSmhasherSparse(t *testing.T)
```

Test strings with only a few bits set 

### <a id="sparse" href="#sparse">func sparse(t *testing.T, n int, k int)</a>

```
searchKey: runtime_test.sparse
```

```Go
func sparse(t *testing.T, n int, k int)
```

### <a id="setbits" href="#setbits">func setbits(h *HashSet, b []byte, i int, k int)</a>

```
searchKey: runtime_test.setbits
```

```Go
func setbits(h *HashSet, b []byte, i int, k int)
```

set up to k bits at index i and greater 

### <a id="TestSmhasherPermutation" href="#TestSmhasherPermutation">func TestSmhasherPermutation(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherPermutation
```

```Go
func TestSmhasherPermutation(t *testing.T)
```

Test all possible combinations of n blocks from the set s. "permutation" is a bad name here, but it is what Smhasher uses. 

### <a id="permutation" href="#permutation">func permutation(t *testing.T, s []uint32, n int)</a>

```
searchKey: runtime_test.permutation
```

```Go
func permutation(t *testing.T, s []uint32, n int)
```

### <a id="genPerm" href="#genPerm">func genPerm(h *HashSet, b []byte, s []uint32, n int)</a>

```
searchKey: runtime_test.genPerm
```

```Go
func genPerm(h *HashSet, b []byte, s []uint32, n int)
```

### <a id="TestSmhasherAvalanche" href="#TestSmhasherAvalanche">func TestSmhasherAvalanche(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherAvalanche
```

```Go
func TestSmhasherAvalanche(t *testing.T)
```

Flipping a single bit of a key should flip each output bit with 50% probability. 

### <a id="avalancheTest1" href="#avalancheTest1">func avalancheTest1(t *testing.T, k Key)</a>

```
searchKey: runtime_test.avalancheTest1
```

```Go
func avalancheTest1(t *testing.T, k Key)
```

### <a id="TestSmhasherWindowed" href="#TestSmhasherWindowed">func TestSmhasherWindowed(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherWindowed
```

```Go
func TestSmhasherWindowed(t *testing.T)
```

All bit rotations of a set of distinct keys 

### <a id="windowed" href="#windowed">func windowed(t *testing.T, k Key)</a>

```
searchKey: runtime_test.windowed
```

```Go
func windowed(t *testing.T, k Key)
```

### <a id="TestSmhasherText" href="#TestSmhasherText">func TestSmhasherText(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherText
```

```Go
func TestSmhasherText(t *testing.T)
```

All keys of the form prefix + [A-Za-z0-9]*N + suffix. 

### <a id="text" href="#text">func text(t *testing.T, prefix, suffix string)</a>

```
searchKey: runtime_test.text
```

```Go
func text(t *testing.T, prefix, suffix string)
```

### <a id="TestSmhasherSeed" href="#TestSmhasherSeed">func TestSmhasherSeed(t *testing.T)</a>

```
searchKey: runtime_test.TestSmhasherSeed
```

```Go
func TestSmhasherSeed(t *testing.T)
```

Make sure different seed values generate different hashes. 

### <a id="randBytes" href="#randBytes">func randBytes(r *rand.Rand, b []byte)</a>

```
searchKey: runtime_test.randBytes
```

```Go
func randBytes(r *rand.Rand, b []byte)
```

### <a id="benchmarkHash" href="#benchmarkHash">func benchmarkHash(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkHash
```

```Go
func benchmarkHash(b *testing.B, n int)
```

### <a id="BenchmarkHash5" href="#BenchmarkHash5">func BenchmarkHash5(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash5
```

```Go
func BenchmarkHash5(b *testing.B)
```

### <a id="BenchmarkHash16" href="#BenchmarkHash16">func BenchmarkHash16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash16
```

```Go
func BenchmarkHash16(b *testing.B)
```

### <a id="BenchmarkHash64" href="#BenchmarkHash64">func BenchmarkHash64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash64
```

```Go
func BenchmarkHash64(b *testing.B)
```

### <a id="BenchmarkHash1024" href="#BenchmarkHash1024">func BenchmarkHash1024(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash1024
```

```Go
func BenchmarkHash1024(b *testing.B)
```

### <a id="BenchmarkHash65536" href="#BenchmarkHash65536">func BenchmarkHash65536(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHash65536
```

```Go
func BenchmarkHash65536(b *testing.B)
```

### <a id="TestArrayHash" href="#TestArrayHash">func TestArrayHash(t *testing.T)</a>

```
searchKey: runtime_test.TestArrayHash
```

```Go
func TestArrayHash(t *testing.T)
```

### <a id="TestStructHash" href="#TestStructHash">func TestStructHash(t *testing.T)</a>

```
searchKey: runtime_test.TestStructHash
```

```Go
func TestStructHash(t *testing.T)
```

### <a id="BenchmarkAlignedLoad" href="#BenchmarkAlignedLoad">func BenchmarkAlignedLoad(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAlignedLoad
```

```Go
func BenchmarkAlignedLoad(b *testing.B)
```

### <a id="BenchmarkUnalignedLoad" href="#BenchmarkUnalignedLoad">func BenchmarkUnalignedLoad(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkUnalignedLoad
```

```Go
func BenchmarkUnalignedLoad(b *testing.B)
```

### <a id="TestCollisions" href="#TestCollisions">func TestCollisions(t *testing.T)</a>

```
searchKey: runtime_test.TestCollisions
```

```Go
func TestCollisions(t *testing.T)
```

### <a id="TestTimeHistogram" href="#TestTimeHistogram">func TestTimeHistogram(t *testing.T)</a>

```
searchKey: runtime_test.TestTimeHistogram
```

```Go
func TestTimeHistogram(t *testing.T)
```

### <a id="TestCmpIfaceConcreteAlloc" href="#TestCmpIfaceConcreteAlloc">func TestCmpIfaceConcreteAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestCmpIfaceConcreteAlloc
```

```Go
func TestCmpIfaceConcreteAlloc(t *testing.T)
```

Issue 9370 

### <a id="BenchmarkEqEfaceConcrete" href="#BenchmarkEqEfaceConcrete">func BenchmarkEqEfaceConcrete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkEqEfaceConcrete
```

```Go
func BenchmarkEqEfaceConcrete(b *testing.B)
```

### <a id="BenchmarkEqIfaceConcrete" href="#BenchmarkEqIfaceConcrete">func BenchmarkEqIfaceConcrete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkEqIfaceConcrete
```

```Go
func BenchmarkEqIfaceConcrete(b *testing.B)
```

### <a id="BenchmarkNeEfaceConcrete" href="#BenchmarkNeEfaceConcrete">func BenchmarkNeEfaceConcrete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNeEfaceConcrete
```

```Go
func BenchmarkNeEfaceConcrete(b *testing.B)
```

### <a id="BenchmarkNeIfaceConcrete" href="#BenchmarkNeIfaceConcrete">func BenchmarkNeIfaceConcrete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNeIfaceConcrete
```

```Go
func BenchmarkNeIfaceConcrete(b *testing.B)
```

### <a id="BenchmarkConvT2EByteSized" href="#BenchmarkConvT2EByteSized">func BenchmarkConvT2EByteSized(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2EByteSized
```

```Go
func BenchmarkConvT2EByteSized(b *testing.B)
```

### <a id="BenchmarkConvT2ESmall" href="#BenchmarkConvT2ESmall">func BenchmarkConvT2ESmall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2ESmall
```

```Go
func BenchmarkConvT2ESmall(b *testing.B)
```

### <a id="BenchmarkConvT2EUintptr" href="#BenchmarkConvT2EUintptr">func BenchmarkConvT2EUintptr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2EUintptr
```

```Go
func BenchmarkConvT2EUintptr(b *testing.B)
```

### <a id="BenchmarkConvT2ELarge" href="#BenchmarkConvT2ELarge">func BenchmarkConvT2ELarge(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2ELarge
```

```Go
func BenchmarkConvT2ELarge(b *testing.B)
```

### <a id="BenchmarkConvT2ISmall" href="#BenchmarkConvT2ISmall">func BenchmarkConvT2ISmall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2ISmall
```

```Go
func BenchmarkConvT2ISmall(b *testing.B)
```

### <a id="BenchmarkConvT2IUintptr" href="#BenchmarkConvT2IUintptr">func BenchmarkConvT2IUintptr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2IUintptr
```

```Go
func BenchmarkConvT2IUintptr(b *testing.B)
```

### <a id="BenchmarkConvT2ILarge" href="#BenchmarkConvT2ILarge">func BenchmarkConvT2ILarge(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2ILarge
```

```Go
func BenchmarkConvT2ILarge(b *testing.B)
```

### <a id="BenchmarkConvI2E" href="#BenchmarkConvI2E">func BenchmarkConvI2E(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvI2E
```

```Go
func BenchmarkConvI2E(b *testing.B)
```

### <a id="BenchmarkConvI2I" href="#BenchmarkConvI2I">func BenchmarkConvI2I(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvI2I
```

```Go
func BenchmarkConvI2I(b *testing.B)
```

### <a id="BenchmarkAssertE2T" href="#BenchmarkAssertE2T">func BenchmarkAssertE2T(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2T
```

```Go
func BenchmarkAssertE2T(b *testing.B)
```

### <a id="BenchmarkAssertE2TLarge" href="#BenchmarkAssertE2TLarge">func BenchmarkAssertE2TLarge(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2TLarge
```

```Go
func BenchmarkAssertE2TLarge(b *testing.B)
```

### <a id="BenchmarkAssertE2I" href="#BenchmarkAssertE2I">func BenchmarkAssertE2I(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2I
```

```Go
func BenchmarkAssertE2I(b *testing.B)
```

### <a id="BenchmarkAssertI2T" href="#BenchmarkAssertI2T">func BenchmarkAssertI2T(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2T
```

```Go
func BenchmarkAssertI2T(b *testing.B)
```

### <a id="BenchmarkAssertI2I" href="#BenchmarkAssertI2I">func BenchmarkAssertI2I(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2I
```

```Go
func BenchmarkAssertI2I(b *testing.B)
```

### <a id="BenchmarkAssertI2E" href="#BenchmarkAssertI2E">func BenchmarkAssertI2E(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2E
```

```Go
func BenchmarkAssertI2E(b *testing.B)
```

### <a id="BenchmarkAssertE2E" href="#BenchmarkAssertE2E">func BenchmarkAssertE2E(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2E
```

```Go
func BenchmarkAssertE2E(b *testing.B)
```

### <a id="BenchmarkAssertE2T2" href="#BenchmarkAssertE2T2">func BenchmarkAssertE2T2(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2T2
```

```Go
func BenchmarkAssertE2T2(b *testing.B)
```

### <a id="BenchmarkAssertE2T2Blank" href="#BenchmarkAssertE2T2Blank">func BenchmarkAssertE2T2Blank(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2T2Blank
```

```Go
func BenchmarkAssertE2T2Blank(b *testing.B)
```

### <a id="BenchmarkAssertI2E2" href="#BenchmarkAssertI2E2">func BenchmarkAssertI2E2(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2E2
```

```Go
func BenchmarkAssertI2E2(b *testing.B)
```

### <a id="BenchmarkAssertI2E2Blank" href="#BenchmarkAssertI2E2Blank">func BenchmarkAssertI2E2Blank(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertI2E2Blank
```

```Go
func BenchmarkAssertI2E2Blank(b *testing.B)
```

### <a id="BenchmarkAssertE2E2" href="#BenchmarkAssertE2E2">func BenchmarkAssertE2E2(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2E2
```

```Go
func BenchmarkAssertE2E2(b *testing.B)
```

### <a id="BenchmarkAssertE2E2Blank" href="#BenchmarkAssertE2E2Blank">func BenchmarkAssertE2E2Blank(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAssertE2E2Blank
```

```Go
func BenchmarkAssertE2E2Blank(b *testing.B)
```

### <a id="TestNonEscapingConvT2E" href="#TestNonEscapingConvT2E">func TestNonEscapingConvT2E(t *testing.T)</a>

```
searchKey: runtime_test.TestNonEscapingConvT2E
```

```Go
func TestNonEscapingConvT2E(t *testing.T)
```

### <a id="TestNonEscapingConvT2I" href="#TestNonEscapingConvT2I">func TestNonEscapingConvT2I(t *testing.T)</a>

```
searchKey: runtime_test.TestNonEscapingConvT2I
```

```Go
func TestNonEscapingConvT2I(t *testing.T)
```

### <a id="TestZeroConvT2x" href="#TestZeroConvT2x">func TestZeroConvT2x(t *testing.T)</a>

```
searchKey: runtime_test.TestZeroConvT2x
```

```Go
func TestZeroConvT2x(t *testing.T)
```

### <a id="BenchmarkConvT2Ezero" href="#BenchmarkConvT2Ezero">func BenchmarkConvT2Ezero(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConvT2Ezero
```

```Go
func BenchmarkConvT2Ezero(b *testing.B)
```

### <a id="fromMyNode" href="#fromMyNode">func fromMyNode(node *MyNode) *LFNode</a>

```
searchKey: runtime_test.fromMyNode
```

```Go
func fromMyNode(node *MyNode) *LFNode
```

### <a id="TestLFStack" href="#TestLFStack">func TestLFStack(t *testing.T)</a>

```
searchKey: runtime_test.TestLFStack
```

```Go
func TestLFStack(t *testing.T)
```

### <a id="TestLFStackStress" href="#TestLFStackStress">func TestLFStackStress(t *testing.T)</a>

```
searchKey: runtime_test.TestLFStackStress
```

```Go
func TestLFStackStress(t *testing.T)
```

### <a id="TestLockRankPartialOrder" href="#TestLockRankPartialOrder">func TestLockRankPartialOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestLockRankPartialOrder
```

```Go
func TestLockRankPartialOrder(t *testing.T)
```

Check that the partial order in lockPartialOrder fits within the total order determined by the order of the lockRank constants. 

### <a id="TestLockRankPartialOrderSortedEntries" href="#TestLockRankPartialOrderSortedEntries">func TestLockRankPartialOrderSortedEntries(t *testing.T)</a>

```
searchKey: runtime_test.TestLockRankPartialOrderSortedEntries
```

```Go
func TestLockRankPartialOrderSortedEntries(t *testing.T)
```

Verify that partial order lists are kept sorted. This is a purely cosemetic check to make manual reviews simpler. It does not affect correctness, unlike the above test. 

### <a id="TestMemStats" href="#TestMemStats">func TestMemStats(t *testing.T)</a>

```
searchKey: runtime_test.TestMemStats
```

```Go
func TestMemStats(t *testing.T)
```

### <a id="TestStringConcatenationAllocs" href="#TestStringConcatenationAllocs">func TestStringConcatenationAllocs(t *testing.T)</a>

```
searchKey: runtime_test.TestStringConcatenationAllocs
```

```Go
func TestStringConcatenationAllocs(t *testing.T)
```

### <a id="TestTinyAlloc" href="#TestTinyAlloc">func TestTinyAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestTinyAlloc
```

```Go
func TestTinyAlloc(t *testing.T)
```

### <a id="TestTinyAllocIssue37262" href="#TestTinyAllocIssue37262">func TestTinyAllocIssue37262(t *testing.T)</a>

```
searchKey: runtime_test.TestTinyAllocIssue37262
```

```Go
func TestTinyAllocIssue37262(t *testing.T)
```

### <a id="TestPageCacheLeak" href="#TestPageCacheLeak">func TestPageCacheLeak(t *testing.T)</a>

```
searchKey: runtime_test.TestPageCacheLeak
```

```Go
func TestPageCacheLeak(t *testing.T)
```

### <a id="TestPhysicalMemoryUtilization" href="#TestPhysicalMemoryUtilization">func TestPhysicalMemoryUtilization(t *testing.T)</a>

```
searchKey: runtime_test.TestPhysicalMemoryUtilization
```

```Go
func TestPhysicalMemoryUtilization(t *testing.T)
```

### <a id="TestScavengedBitsCleared" href="#TestScavengedBitsCleared">func TestScavengedBitsCleared(t *testing.T)</a>

```
searchKey: runtime_test.TestScavengedBitsCleared
```

```Go
func TestScavengedBitsCleared(t *testing.T)
```

### <a id="TestArenaCollision" href="#TestArenaCollision">func TestArenaCollision(t *testing.T)</a>

```
searchKey: runtime_test.TestArenaCollision
```

```Go
func TestArenaCollision(t *testing.T)
```

### <a id="BenchmarkMalloc8" href="#BenchmarkMalloc8">func BenchmarkMalloc8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMalloc8
```

```Go
func BenchmarkMalloc8(b *testing.B)
```

### <a id="BenchmarkMalloc16" href="#BenchmarkMalloc16">func BenchmarkMalloc16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMalloc16
```

```Go
func BenchmarkMalloc16(b *testing.B)
```

### <a id="BenchmarkMallocTypeInfo8" href="#BenchmarkMallocTypeInfo8">func BenchmarkMallocTypeInfo8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMallocTypeInfo8
```

```Go
func BenchmarkMallocTypeInfo8(b *testing.B)
```

### <a id="BenchmarkMallocTypeInfo16" href="#BenchmarkMallocTypeInfo16">func BenchmarkMallocTypeInfo16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMallocTypeInfo16
```

```Go
func BenchmarkMallocTypeInfo16(b *testing.B)
```

### <a id="BenchmarkMallocLargeStruct" href="#BenchmarkMallocLargeStruct">func BenchmarkMallocLargeStruct(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMallocLargeStruct
```

```Go
func BenchmarkMallocLargeStruct(b *testing.B)
```

### <a id="BenchmarkGoroutineSelect" href="#BenchmarkGoroutineSelect">func BenchmarkGoroutineSelect(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoroutineSelect
```

```Go
func BenchmarkGoroutineSelect(b *testing.B)
```

### <a id="BenchmarkGoroutineBlocking" href="#BenchmarkGoroutineBlocking">func BenchmarkGoroutineBlocking(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoroutineBlocking
```

```Go
func BenchmarkGoroutineBlocking(b *testing.B)
```

### <a id="BenchmarkGoroutineForRange" href="#BenchmarkGoroutineForRange">func BenchmarkGoroutineForRange(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoroutineForRange
```

```Go
func BenchmarkGoroutineForRange(b *testing.B)
```

### <a id="benchHelper" href="#benchHelper">func benchHelper(b *testing.B, n int, read func(chan struct{}))</a>

```
searchKey: runtime_test.benchHelper
```

```Go
func benchHelper(b *testing.B, n int, read func(chan struct{}))
```

### <a id="BenchmarkGoroutineIdle" href="#BenchmarkGoroutineIdle">func BenchmarkGoroutineIdle(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoroutineIdle
```

```Go
func BenchmarkGoroutineIdle(b *testing.B)
```

### <a id="BenchmarkHashStringSpeed" href="#BenchmarkHashStringSpeed">func BenchmarkHashStringSpeed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashStringSpeed
```

```Go
func BenchmarkHashStringSpeed(b *testing.B)
```

### <a id="BenchmarkHashBytesSpeed" href="#BenchmarkHashBytesSpeed">func BenchmarkHashBytesSpeed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashBytesSpeed
```

```Go
func BenchmarkHashBytesSpeed(b *testing.B)
```

### <a id="BenchmarkHashInt32Speed" href="#BenchmarkHashInt32Speed">func BenchmarkHashInt32Speed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashInt32Speed
```

```Go
func BenchmarkHashInt32Speed(b *testing.B)
```

### <a id="BenchmarkHashInt64Speed" href="#BenchmarkHashInt64Speed">func BenchmarkHashInt64Speed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashInt64Speed
```

```Go
func BenchmarkHashInt64Speed(b *testing.B)
```

### <a id="BenchmarkHashStringArraySpeed" href="#BenchmarkHashStringArraySpeed">func BenchmarkHashStringArraySpeed(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkHashStringArraySpeed
```

```Go
func BenchmarkHashStringArraySpeed(b *testing.B)
```

### <a id="BenchmarkMegMap" href="#BenchmarkMegMap">func BenchmarkMegMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMegMap
```

```Go
func BenchmarkMegMap(b *testing.B)
```

### <a id="BenchmarkMegOneMap" href="#BenchmarkMegOneMap">func BenchmarkMegOneMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMegOneMap
```

```Go
func BenchmarkMegOneMap(b *testing.B)
```

### <a id="BenchmarkMegEqMap" href="#BenchmarkMegEqMap">func BenchmarkMegEqMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMegEqMap
```

```Go
func BenchmarkMegEqMap(b *testing.B)
```

### <a id="BenchmarkMegEmptyMap" href="#BenchmarkMegEmptyMap">func BenchmarkMegEmptyMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMegEmptyMap
```

```Go
func BenchmarkMegEmptyMap(b *testing.B)
```

### <a id="BenchmarkSmallStrMap" href="#BenchmarkSmallStrMap">func BenchmarkSmallStrMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSmallStrMap
```

```Go
func BenchmarkSmallStrMap(b *testing.B)
```

### <a id="BenchmarkMapStringKeysEight_16" href="#BenchmarkMapStringKeysEight_16">func BenchmarkMapStringKeysEight_16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringKeysEight_16
```

```Go
func BenchmarkMapStringKeysEight_16(b *testing.B)
```

### <a id="BenchmarkMapStringKeysEight_32" href="#BenchmarkMapStringKeysEight_32">func BenchmarkMapStringKeysEight_32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringKeysEight_32
```

```Go
func BenchmarkMapStringKeysEight_32(b *testing.B)
```

### <a id="BenchmarkMapStringKeysEight_64" href="#BenchmarkMapStringKeysEight_64">func BenchmarkMapStringKeysEight_64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringKeysEight_64
```

```Go
func BenchmarkMapStringKeysEight_64(b *testing.B)
```

### <a id="BenchmarkMapStringKeysEight_1M" href="#BenchmarkMapStringKeysEight_1M">func BenchmarkMapStringKeysEight_1M(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringKeysEight_1M
```

```Go
func BenchmarkMapStringKeysEight_1M(b *testing.B)
```

### <a id="benchmarkMapStringKeysEight" href="#benchmarkMapStringKeysEight">func benchmarkMapStringKeysEight(b *testing.B, keySize int)</a>

```
searchKey: runtime_test.benchmarkMapStringKeysEight
```

```Go
func benchmarkMapStringKeysEight(b *testing.B, keySize int)
```

### <a id="BenchmarkIntMap" href="#BenchmarkIntMap">func BenchmarkIntMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkIntMap
```

```Go
func BenchmarkIntMap(b *testing.B)
```

### <a id="BenchmarkMapFirst" href="#BenchmarkMapFirst">func BenchmarkMapFirst(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapFirst
```

```Go
func BenchmarkMapFirst(b *testing.B)
```

### <a id="BenchmarkMapMid" href="#BenchmarkMapMid">func BenchmarkMapMid(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapMid
```

```Go
func BenchmarkMapMid(b *testing.B)
```

### <a id="BenchmarkMapLast" href="#BenchmarkMapLast">func BenchmarkMapLast(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapLast
```

```Go
func BenchmarkMapLast(b *testing.B)
```

### <a id="BenchmarkMapCycle" href="#BenchmarkMapCycle">func BenchmarkMapCycle(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapCycle
```

```Go
func BenchmarkMapCycle(b *testing.B)
```

### <a id="benchmarkRepeatedLookup" href="#benchmarkRepeatedLookup">func benchmarkRepeatedLookup(b *testing.B, lookupKeySize int)</a>

```
searchKey: runtime_test.benchmarkRepeatedLookup
```

```Go
func benchmarkRepeatedLookup(b *testing.B, lookupKeySize int)
```

Accessing the same keys in a row. 

### <a id="BenchmarkRepeatedLookupStrMapKey32" href="#BenchmarkRepeatedLookupStrMapKey32">func BenchmarkRepeatedLookupStrMapKey32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRepeatedLookupStrMapKey32
```

```Go
func BenchmarkRepeatedLookupStrMapKey32(b *testing.B)
```

### <a id="BenchmarkRepeatedLookupStrMapKey1M" href="#BenchmarkRepeatedLookupStrMapKey1M">func BenchmarkRepeatedLookupStrMapKey1M(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRepeatedLookupStrMapKey1M
```

```Go
func BenchmarkRepeatedLookupStrMapKey1M(b *testing.B)
```

### <a id="BenchmarkMakeMap" href="#BenchmarkMakeMap">func BenchmarkMakeMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMakeMap
```

```Go
func BenchmarkMakeMap(b *testing.B)
```

### <a id="BenchmarkNewEmptyMap" href="#BenchmarkNewEmptyMap">func BenchmarkNewEmptyMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNewEmptyMap
```

```Go
func BenchmarkNewEmptyMap(b *testing.B)
```

### <a id="BenchmarkNewSmallMap" href="#BenchmarkNewSmallMap">func BenchmarkNewSmallMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNewSmallMap
```

```Go
func BenchmarkNewSmallMap(b *testing.B)
```

### <a id="BenchmarkMapIter" href="#BenchmarkMapIter">func BenchmarkMapIter(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapIter
```

```Go
func BenchmarkMapIter(b *testing.B)
```

### <a id="BenchmarkMapIterEmpty" href="#BenchmarkMapIterEmpty">func BenchmarkMapIterEmpty(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapIterEmpty
```

```Go
func BenchmarkMapIterEmpty(b *testing.B)
```

### <a id="BenchmarkSameLengthMap" href="#BenchmarkSameLengthMap">func BenchmarkSameLengthMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSameLengthMap
```

```Go
func BenchmarkSameLengthMap(b *testing.B)
```

### <a id="BenchmarkBigKeyMap" href="#BenchmarkBigKeyMap">func BenchmarkBigKeyMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkBigKeyMap
```

```Go
func BenchmarkBigKeyMap(b *testing.B)
```

### <a id="BenchmarkBigValMap" href="#BenchmarkBigValMap">func BenchmarkBigValMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkBigValMap
```

```Go
func BenchmarkBigValMap(b *testing.B)
```

### <a id="BenchmarkSmallKeyMap" href="#BenchmarkSmallKeyMap">func BenchmarkSmallKeyMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSmallKeyMap
```

```Go
func BenchmarkSmallKeyMap(b *testing.B)
```

### <a id="BenchmarkMapPopulate" href="#BenchmarkMapPopulate">func BenchmarkMapPopulate(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapPopulate
```

```Go
func BenchmarkMapPopulate(b *testing.B)
```

### <a id="BenchmarkComplexAlgMap" href="#BenchmarkComplexAlgMap">func BenchmarkComplexAlgMap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkComplexAlgMap
```

```Go
func BenchmarkComplexAlgMap(b *testing.B)
```

### <a id="BenchmarkGoMapClear" href="#BenchmarkGoMapClear">func BenchmarkGoMapClear(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoMapClear
```

```Go
func BenchmarkGoMapClear(b *testing.B)
```

### <a id="BenchmarkMapStringConversion" href="#BenchmarkMapStringConversion">func BenchmarkMapStringConversion(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapStringConversion
```

```Go
func BenchmarkMapStringConversion(b *testing.B)
```

### <a id="BenchmarkMapInterfaceString" href="#BenchmarkMapInterfaceString">func BenchmarkMapInterfaceString(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapInterfaceString
```

```Go
func BenchmarkMapInterfaceString(b *testing.B)
```

### <a id="BenchmarkMapInterfacePtr" href="#BenchmarkMapInterfacePtr">func BenchmarkMapInterfacePtr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapInterfacePtr
```

```Go
func BenchmarkMapInterfacePtr(b *testing.B)
```

### <a id="BenchmarkNewEmptyMapHintLessThan8" href="#BenchmarkNewEmptyMapHintLessThan8">func BenchmarkNewEmptyMapHintLessThan8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNewEmptyMapHintLessThan8
```

```Go
func BenchmarkNewEmptyMapHintLessThan8(b *testing.B)
```

### <a id="BenchmarkNewEmptyMapHintGreaterThan8" href="#BenchmarkNewEmptyMapHintGreaterThan8">func BenchmarkNewEmptyMapHintGreaterThan8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNewEmptyMapHintGreaterThan8
```

```Go
func BenchmarkNewEmptyMapHintGreaterThan8(b *testing.B)
```

### <a id="TestHmapSize" href="#TestHmapSize">func TestHmapSize(t *testing.T)</a>

```
searchKey: runtime_test.TestHmapSize
```

```Go
func TestHmapSize(t *testing.T)
```

### <a id="TestNegativeZero" href="#TestNegativeZero">func TestNegativeZero(t *testing.T)</a>

```
searchKey: runtime_test.TestNegativeZero
```

```Go
func TestNegativeZero(t *testing.T)
```

negative zero is a good test because: 

```
1) 0 and -0 are equal, yet have distinct representations.
2) 0 is represented as all zeros, -0 isn't.

```
I'm not sure the language spec actually requires this behavior, but it's what the current map implementation does. 

### <a id="testMapNan" href="#testMapNan">func testMapNan(t *testing.T, m map[float64]int)</a>

```
searchKey: runtime_test.testMapNan
```

```Go
func testMapNan(t *testing.T, m map[float64]int)
```

### <a id="TestMapAssignmentNan" href="#TestMapAssignmentNan">func TestMapAssignmentNan(t *testing.T)</a>

```
searchKey: runtime_test.TestMapAssignmentNan
```

```Go
func TestMapAssignmentNan(t *testing.T)
```

nan is a good test because nan != nan, and nan has a randomized hash value. 

### <a id="TestMapOperatorAssignmentNan" href="#TestMapOperatorAssignmentNan">func TestMapOperatorAssignmentNan(t *testing.T)</a>

```
searchKey: runtime_test.TestMapOperatorAssignmentNan
```

```Go
func TestMapOperatorAssignmentNan(t *testing.T)
```

nan is a good test because nan != nan, and nan has a randomized hash value. 

### <a id="TestMapOperatorAssignment" href="#TestMapOperatorAssignment">func TestMapOperatorAssignment(t *testing.T)</a>

```
searchKey: runtime_test.TestMapOperatorAssignment
```

```Go
func TestMapOperatorAssignment(t *testing.T)
```

### <a id="TestMapAppendAssignment" href="#TestMapAppendAssignment">func TestMapAppendAssignment(t *testing.T)</a>

```
searchKey: runtime_test.TestMapAppendAssignment
```

```Go
func TestMapAppendAssignment(t *testing.T)
```

### <a id="TestAlias" href="#TestAlias">func TestAlias(t *testing.T)</a>

```
searchKey: runtime_test.TestAlias
```

```Go
func TestAlias(t *testing.T)
```

Maps aren't actually copied on assignment. 

### <a id="TestGrowWithNaN" href="#TestGrowWithNaN">func TestGrowWithNaN(t *testing.T)</a>

```
searchKey: runtime_test.TestGrowWithNaN
```

```Go
func TestGrowWithNaN(t *testing.T)
```

### <a id="TestGrowWithNegativeZero" href="#TestGrowWithNegativeZero">func TestGrowWithNegativeZero(t *testing.T)</a>

```
searchKey: runtime_test.TestGrowWithNegativeZero
```

```Go
func TestGrowWithNegativeZero(t *testing.T)
```

### <a id="TestIterGrowAndDelete" href="#TestIterGrowAndDelete">func TestIterGrowAndDelete(t *testing.T)</a>

```
searchKey: runtime_test.TestIterGrowAndDelete
```

```Go
func TestIterGrowAndDelete(t *testing.T)
```

### <a id="TestIterGrowWithGC" href="#TestIterGrowWithGC">func TestIterGrowWithGC(t *testing.T)</a>

```
searchKey: runtime_test.TestIterGrowWithGC
```

```Go
func TestIterGrowWithGC(t *testing.T)
```

make sure old bucket arrays don't get GCd while an iterator is still using them. 

### <a id="testConcurrentReadsAfterGrowth" href="#testConcurrentReadsAfterGrowth">func testConcurrentReadsAfterGrowth(t *testing.T, useReflect bool)</a>

```
searchKey: runtime_test.testConcurrentReadsAfterGrowth
```

```Go
func testConcurrentReadsAfterGrowth(t *testing.T, useReflect bool)
```

### <a id="TestConcurrentReadsAfterGrowth" href="#TestConcurrentReadsAfterGrowth">func TestConcurrentReadsAfterGrowth(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentReadsAfterGrowth
```

```Go
func TestConcurrentReadsAfterGrowth(t *testing.T)
```

### <a id="TestConcurrentReadsAfterGrowthReflect" href="#TestConcurrentReadsAfterGrowthReflect">func TestConcurrentReadsAfterGrowthReflect(t *testing.T)</a>

```
searchKey: runtime_test.TestConcurrentReadsAfterGrowthReflect
```

```Go
func TestConcurrentReadsAfterGrowthReflect(t *testing.T)
```

### <a id="TestBigItems" href="#TestBigItems">func TestBigItems(t *testing.T)</a>

```
searchKey: runtime_test.TestBigItems
```

```Go
func TestBigItems(t *testing.T)
```

### <a id="TestMapHugeZero" href="#TestMapHugeZero">func TestMapHugeZero(t *testing.T)</a>

```
searchKey: runtime_test.TestMapHugeZero
```

```Go
func TestMapHugeZero(t *testing.T)
```

### <a id="TestEmptyKeyAndValue" href="#TestEmptyKeyAndValue">func TestEmptyKeyAndValue(t *testing.T)</a>

```
searchKey: runtime_test.TestEmptyKeyAndValue
```

```Go
func TestEmptyKeyAndValue(t *testing.T)
```

### <a id="TestSingleBucketMapStringKeys_DupLen" href="#TestSingleBucketMapStringKeys_DupLen">func TestSingleBucketMapStringKeys_DupLen(t *testing.T)</a>

```
searchKey: runtime_test.TestSingleBucketMapStringKeys_DupLen
```

```Go
func TestSingleBucketMapStringKeys_DupLen(t *testing.T)
```

Tests a map with a single bucket, with same-lengthed short keys ("quick keys") as well as long keys. 

### <a id="TestSingleBucketMapStringKeys_NoDupLen" href="#TestSingleBucketMapStringKeys_NoDupLen">func TestSingleBucketMapStringKeys_NoDupLen(t *testing.T)</a>

```
searchKey: runtime_test.TestSingleBucketMapStringKeys_NoDupLen
```

```Go
func TestSingleBucketMapStringKeys_NoDupLen(t *testing.T)
```

Tests a map with a single bucket, with all keys having different lengths. 

### <a id="testMapLookups" href="#testMapLookups">func testMapLookups(t *testing.T, m map[string]string)</a>

```
searchKey: runtime_test.testMapLookups
```

```Go
func testMapLookups(t *testing.T, m map[string]string)
```

### <a id="TestMapNanGrowIterator" href="#TestMapNanGrowIterator">func TestMapNanGrowIterator(t *testing.T)</a>

```
searchKey: runtime_test.TestMapNanGrowIterator
```

```Go
func TestMapNanGrowIterator(t *testing.T)
```

Tests whether the iterator returns the right elements when started in the middle of a grow, when the keys are NaNs. 

### <a id="TestMapIterOrder" href="#TestMapIterOrder">func TestMapIterOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestMapIterOrder
```

```Go
func TestMapIterOrder(t *testing.T)
```

### <a id="TestMapSparseIterOrder" href="#TestMapSparseIterOrder">func TestMapSparseIterOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestMapSparseIterOrder
```

```Go
func TestMapSparseIterOrder(t *testing.T)
```

Issue 8410 

### <a id="TestMapStringBytesLookup" href="#TestMapStringBytesLookup">func TestMapStringBytesLookup(t *testing.T)</a>

```
searchKey: runtime_test.TestMapStringBytesLookup
```

```Go
func TestMapStringBytesLookup(t *testing.T)
```

### <a id="TestMapLargeKeyNoPointer" href="#TestMapLargeKeyNoPointer">func TestMapLargeKeyNoPointer(t *testing.T)</a>

```
searchKey: runtime_test.TestMapLargeKeyNoPointer
```

```Go
func TestMapLargeKeyNoPointer(t *testing.T)
```

### <a id="TestMapLargeValNoPointer" href="#TestMapLargeValNoPointer">func TestMapLargeValNoPointer(t *testing.T)</a>

```
searchKey: runtime_test.TestMapLargeValNoPointer
```

```Go
func TestMapLargeValNoPointer(t *testing.T)
```

### <a id="TestIgnoreBogusMapHint" href="#TestIgnoreBogusMapHint">func TestIgnoreBogusMapHint(t *testing.T)</a>

```
searchKey: runtime_test.TestIgnoreBogusMapHint
```

```Go
func TestIgnoreBogusMapHint(t *testing.T)
```

Test that making a map with a large or invalid hint doesn't panic. (Issue 19926). 

### <a id="TestMapBuckets" href="#TestMapBuckets">func TestMapBuckets(t *testing.T)</a>

```
searchKey: runtime_test.TestMapBuckets
```

```Go
func TestMapBuckets(t *testing.T)
```

### <a id="benchmarkMapPop" href="#benchmarkMapPop">func benchmarkMapPop(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapPop
```

```Go
func benchmarkMapPop(b *testing.B, n int)
```

### <a id="BenchmarkMapPop100" href="#BenchmarkMapPop100">func BenchmarkMapPop100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapPop100
```

```Go
func BenchmarkMapPop100(b *testing.B)
```

### <a id="BenchmarkMapPop1000" href="#BenchmarkMapPop1000">func BenchmarkMapPop1000(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapPop1000
```

```Go
func BenchmarkMapPop1000(b *testing.B)
```

### <a id="BenchmarkMapPop10000" href="#BenchmarkMapPop10000">func BenchmarkMapPop10000(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapPop10000
```

```Go
func BenchmarkMapPop10000(b *testing.B)
```

### <a id="TestNonEscapingMap" href="#TestNonEscapingMap">func TestNonEscapingMap(t *testing.T)</a>

```
searchKey: runtime_test.TestNonEscapingMap
```

```Go
func TestNonEscapingMap(t *testing.T)
```

### <a id="benchmarkMapAssignInt32" href="#benchmarkMapAssignInt32">func benchmarkMapAssignInt32(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAssignInt32
```

```Go
func benchmarkMapAssignInt32(b *testing.B, n int)
```

### <a id="benchmarkMapOperatorAssignInt32" href="#benchmarkMapOperatorAssignInt32">func benchmarkMapOperatorAssignInt32(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapOperatorAssignInt32
```

```Go
func benchmarkMapOperatorAssignInt32(b *testing.B, n int)
```

### <a id="benchmarkMapAppendAssignInt32" href="#benchmarkMapAppendAssignInt32">func benchmarkMapAppendAssignInt32(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAppendAssignInt32
```

```Go
func benchmarkMapAppendAssignInt32(b *testing.B, n int)
```

### <a id="benchmarkMapDeleteInt32" href="#benchmarkMapDeleteInt32">func benchmarkMapDeleteInt32(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapDeleteInt32
```

```Go
func benchmarkMapDeleteInt32(b *testing.B, n int)
```

### <a id="benchmarkMapAssignInt64" href="#benchmarkMapAssignInt64">func benchmarkMapAssignInt64(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAssignInt64
```

```Go
func benchmarkMapAssignInt64(b *testing.B, n int)
```

### <a id="benchmarkMapOperatorAssignInt64" href="#benchmarkMapOperatorAssignInt64">func benchmarkMapOperatorAssignInt64(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapOperatorAssignInt64
```

```Go
func benchmarkMapOperatorAssignInt64(b *testing.B, n int)
```

### <a id="benchmarkMapAppendAssignInt64" href="#benchmarkMapAppendAssignInt64">func benchmarkMapAppendAssignInt64(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAppendAssignInt64
```

```Go
func benchmarkMapAppendAssignInt64(b *testing.B, n int)
```

### <a id="benchmarkMapDeleteInt64" href="#benchmarkMapDeleteInt64">func benchmarkMapDeleteInt64(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapDeleteInt64
```

```Go
func benchmarkMapDeleteInt64(b *testing.B, n int)
```

### <a id="benchmarkMapAssignStr" href="#benchmarkMapAssignStr">func benchmarkMapAssignStr(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAssignStr
```

```Go
func benchmarkMapAssignStr(b *testing.B, n int)
```

### <a id="benchmarkMapOperatorAssignStr" href="#benchmarkMapOperatorAssignStr">func benchmarkMapOperatorAssignStr(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapOperatorAssignStr
```

```Go
func benchmarkMapOperatorAssignStr(b *testing.B, n int)
```

### <a id="benchmarkMapAppendAssignStr" href="#benchmarkMapAppendAssignStr">func benchmarkMapAppendAssignStr(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapAppendAssignStr
```

```Go
func benchmarkMapAppendAssignStr(b *testing.B, n int)
```

### <a id="benchmarkMapDeleteStr" href="#benchmarkMapDeleteStr">func benchmarkMapDeleteStr(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapDeleteStr
```

```Go
func benchmarkMapDeleteStr(b *testing.B, n int)
```

### <a id="benchmarkMapDeletePointer" href="#benchmarkMapDeletePointer">func benchmarkMapDeletePointer(b *testing.B, n int)</a>

```
searchKey: runtime_test.benchmarkMapDeletePointer
```

```Go
func benchmarkMapDeletePointer(b *testing.B, n int)
```

### <a id="runWith" href="#runWith">func runWith(f func(*testing.B, int), v ...int) func(*testing.B)</a>

```
searchKey: runtime_test.runWith
```

```Go
func runWith(f func(*testing.B, int), v ...int) func(*testing.B)
```

### <a id="BenchmarkMapAssign" href="#BenchmarkMapAssign">func BenchmarkMapAssign(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapAssign
```

```Go
func BenchmarkMapAssign(b *testing.B)
```

### <a id="BenchmarkMapOperatorAssign" href="#BenchmarkMapOperatorAssign">func BenchmarkMapOperatorAssign(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapOperatorAssign
```

```Go
func BenchmarkMapOperatorAssign(b *testing.B)
```

### <a id="BenchmarkMapAppendAssign" href="#BenchmarkMapAppendAssign">func BenchmarkMapAppendAssign(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapAppendAssign
```

```Go
func BenchmarkMapAppendAssign(b *testing.B)
```

### <a id="BenchmarkMapDelete" href="#BenchmarkMapDelete">func BenchmarkMapDelete(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMapDelete
```

```Go
func BenchmarkMapDelete(b *testing.B)
```

### <a id="TestDeferDeleteSlow" href="#TestDeferDeleteSlow">func TestDeferDeleteSlow(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferDeleteSlow
```

```Go
func TestDeferDeleteSlow(t *testing.T)
```

### <a id="TestIncrementAfterDeleteValueInt" href="#TestIncrementAfterDeleteValueInt">func TestIncrementAfterDeleteValueInt(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteValueInt
```

```Go
func TestIncrementAfterDeleteValueInt(t *testing.T)
```

TestIncrementAfterDeleteValueInt and other test Issue 25936. Value types int, int32, int64 are affected. Value type string works as expected. 

### <a id="TestIncrementAfterDeleteValueInt32" href="#TestIncrementAfterDeleteValueInt32">func TestIncrementAfterDeleteValueInt32(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteValueInt32
```

```Go
func TestIncrementAfterDeleteValueInt32(t *testing.T)
```

### <a id="TestIncrementAfterDeleteValueInt64" href="#TestIncrementAfterDeleteValueInt64">func TestIncrementAfterDeleteValueInt64(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteValueInt64
```

```Go
func TestIncrementAfterDeleteValueInt64(t *testing.T)
```

### <a id="TestIncrementAfterDeleteKeyStringValueInt" href="#TestIncrementAfterDeleteKeyStringValueInt">func TestIncrementAfterDeleteKeyStringValueInt(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteKeyStringValueInt
```

```Go
func TestIncrementAfterDeleteKeyStringValueInt(t *testing.T)
```

### <a id="TestIncrementAfterDeleteKeyValueString" href="#TestIncrementAfterDeleteKeyValueString">func TestIncrementAfterDeleteKeyValueString(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterDeleteKeyValueString
```

```Go
func TestIncrementAfterDeleteKeyValueString(t *testing.T)
```

### <a id="TestIncrementAfterBulkClearKeyStringValueInt" href="#TestIncrementAfterBulkClearKeyStringValueInt">func TestIncrementAfterBulkClearKeyStringValueInt(t *testing.T)</a>

```
searchKey: runtime_test.TestIncrementAfterBulkClearKeyStringValueInt
```

```Go
func TestIncrementAfterBulkClearKeyStringValueInt(t *testing.T)
```

TestIncrementAfterBulkClearKeyStringValueInt tests that map bulk deletion (mapclear) still works as expected. Note that it was not affected by Issue 25936. 

### <a id="TestMapTombstones" href="#TestMapTombstones">func TestMapTombstones(t *testing.T)</a>

```
searchKey: runtime_test.TestMapTombstones
```

```Go
func TestMapTombstones(t *testing.T)
```

### <a id="TestMapInterfaceKey" href="#TestMapInterfaceKey">func TestMapInterfaceKey(t *testing.T)</a>

```
searchKey: runtime_test.TestMapInterfaceKey
```

```Go
func TestMapInterfaceKey(t *testing.T)
```

### <a id="TestMemmove" href="#TestMemmove">func TestMemmove(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmove
```

```Go
func TestMemmove(t *testing.T)
```

### <a id="TestMemmoveAlias" href="#TestMemmoveAlias">func TestMemmoveAlias(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmoveAlias
```

```Go
func TestMemmoveAlias(t *testing.T)
```

### <a id="TestMemmoveLarge0x180000" href="#TestMemmoveLarge0x180000">func TestMemmoveLarge0x180000(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmoveLarge0x180000
```

```Go
func TestMemmoveLarge0x180000(t *testing.T)
```

### <a id="TestMemmoveOverlapLarge0x120000" href="#TestMemmoveOverlapLarge0x120000">func TestMemmoveOverlapLarge0x120000(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmoveOverlapLarge0x120000
```

```Go
func TestMemmoveOverlapLarge0x120000(t *testing.T)
```

### <a id="testSize" href="#testSize">func testSize(t *testing.T, size int)</a>

```
searchKey: runtime_test.testSize
```

```Go
func testSize(t *testing.T, size int)
```

### <a id="testOverlap" href="#testOverlap">func testOverlap(t *testing.T, size int)</a>

```
searchKey: runtime_test.testOverlap
```

```Go
func testOverlap(t *testing.T, size int)
```

### <a id="copyref" href="#copyref">func copyref(dst, src []byte)</a>

```
searchKey: runtime_test.copyref
```

```Go
func copyref(dst, src []byte)
```

Forward copy. 

### <a id="copybw" href="#copybw">func copybw(dst, src []byte)</a>

```
searchKey: runtime_test.copybw
```

```Go
func copybw(dst, src []byte)
```

Backwards copy 

### <a id="matchLen" href="#matchLen">func matchLen(a, b []byte, max int) int</a>

```
searchKey: runtime_test.matchLen
```

```Go
func matchLen(a, b []byte, max int) int
```

Returns offset of difference 

### <a id="cmpb" href="#cmpb">func cmpb(a, b []byte) int</a>

```
searchKey: runtime_test.cmpb
```

```Go
func cmpb(a, b []byte) int
```

### <a id="TestMemmoveAtomicity" href="#TestMemmoveAtomicity">func TestMemmoveAtomicity(t *testing.T)</a>

```
searchKey: runtime_test.TestMemmoveAtomicity
```

```Go
func TestMemmoveAtomicity(t *testing.T)
```

Ensure that memmove writes pointers atomically, so the GC won't observe a partially updated pointer. 

### <a id="benchmarkSizes" href="#benchmarkSizes">func benchmarkSizes(b *testing.B, sizes []int, fn func(b *testing.B, n int))</a>

```
searchKey: runtime_test.benchmarkSizes
```

```Go
func benchmarkSizes(b *testing.B, sizes []int, fn func(b *testing.B, n int))
```

### <a id="BenchmarkMemmove" href="#BenchmarkMemmove">func BenchmarkMemmove(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmove
```

```Go
func BenchmarkMemmove(b *testing.B)
```

### <a id="BenchmarkMemmoveOverlap" href="#BenchmarkMemmoveOverlap">func BenchmarkMemmoveOverlap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveOverlap
```

```Go
func BenchmarkMemmoveOverlap(b *testing.B)
```

### <a id="BenchmarkMemmoveUnalignedDst" href="#BenchmarkMemmoveUnalignedDst">func BenchmarkMemmoveUnalignedDst(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveUnalignedDst
```

```Go
func BenchmarkMemmoveUnalignedDst(b *testing.B)
```

### <a id="BenchmarkMemmoveUnalignedDstOverlap" href="#BenchmarkMemmoveUnalignedDstOverlap">func BenchmarkMemmoveUnalignedDstOverlap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveUnalignedDstOverlap
```

```Go
func BenchmarkMemmoveUnalignedDstOverlap(b *testing.B)
```

### <a id="BenchmarkMemmoveUnalignedSrc" href="#BenchmarkMemmoveUnalignedSrc">func BenchmarkMemmoveUnalignedSrc(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveUnalignedSrc
```

```Go
func BenchmarkMemmoveUnalignedSrc(b *testing.B)
```

### <a id="BenchmarkMemmoveUnalignedSrcOverlap" href="#BenchmarkMemmoveUnalignedSrcOverlap">func BenchmarkMemmoveUnalignedSrcOverlap(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemmoveUnalignedSrcOverlap
```

```Go
func BenchmarkMemmoveUnalignedSrcOverlap(b *testing.B)
```

### <a id="TestMemclr" href="#TestMemclr">func TestMemclr(t *testing.T)</a>

```
searchKey: runtime_test.TestMemclr
```

```Go
func TestMemclr(t *testing.T)
```

### <a id="BenchmarkMemclr" href="#BenchmarkMemclr">func BenchmarkMemclr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMemclr
```

```Go
func BenchmarkMemclr(b *testing.B)
```

### <a id="BenchmarkGoMemclr" href="#BenchmarkGoMemclr">func BenchmarkGoMemclr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGoMemclr
```

```Go
func BenchmarkGoMemclr(b *testing.B)
```

### <a id="BenchmarkClearFat8" href="#BenchmarkClearFat8">func BenchmarkClearFat8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat8
```

```Go
func BenchmarkClearFat8(b *testing.B)
```

### <a id="BenchmarkClearFat12" href="#BenchmarkClearFat12">func BenchmarkClearFat12(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat12
```

```Go
func BenchmarkClearFat12(b *testing.B)
```

### <a id="BenchmarkClearFat16" href="#BenchmarkClearFat16">func BenchmarkClearFat16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat16
```

```Go
func BenchmarkClearFat16(b *testing.B)
```

### <a id="BenchmarkClearFat24" href="#BenchmarkClearFat24">func BenchmarkClearFat24(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat24
```

```Go
func BenchmarkClearFat24(b *testing.B)
```

### <a id="BenchmarkClearFat32" href="#BenchmarkClearFat32">func BenchmarkClearFat32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat32
```

```Go
func BenchmarkClearFat32(b *testing.B)
```

### <a id="BenchmarkClearFat40" href="#BenchmarkClearFat40">func BenchmarkClearFat40(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat40
```

```Go
func BenchmarkClearFat40(b *testing.B)
```

### <a id="BenchmarkClearFat48" href="#BenchmarkClearFat48">func BenchmarkClearFat48(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat48
```

```Go
func BenchmarkClearFat48(b *testing.B)
```

### <a id="BenchmarkClearFat56" href="#BenchmarkClearFat56">func BenchmarkClearFat56(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat56
```

```Go
func BenchmarkClearFat56(b *testing.B)
```

### <a id="BenchmarkClearFat64" href="#BenchmarkClearFat64">func BenchmarkClearFat64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat64
```

```Go
func BenchmarkClearFat64(b *testing.B)
```

### <a id="BenchmarkClearFat128" href="#BenchmarkClearFat128">func BenchmarkClearFat128(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat128
```

```Go
func BenchmarkClearFat128(b *testing.B)
```

### <a id="BenchmarkClearFat256" href="#BenchmarkClearFat256">func BenchmarkClearFat256(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat256
```

```Go
func BenchmarkClearFat256(b *testing.B)
```

### <a id="BenchmarkClearFat512" href="#BenchmarkClearFat512">func BenchmarkClearFat512(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat512
```

```Go
func BenchmarkClearFat512(b *testing.B)
```

### <a id="BenchmarkClearFat1024" href="#BenchmarkClearFat1024">func BenchmarkClearFat1024(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClearFat1024
```

```Go
func BenchmarkClearFat1024(b *testing.B)
```

### <a id="BenchmarkCopyFat8" href="#BenchmarkCopyFat8">func BenchmarkCopyFat8(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat8
```

```Go
func BenchmarkCopyFat8(b *testing.B)
```

### <a id="BenchmarkCopyFat12" href="#BenchmarkCopyFat12">func BenchmarkCopyFat12(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat12
```

```Go
func BenchmarkCopyFat12(b *testing.B)
```

### <a id="BenchmarkCopyFat16" href="#BenchmarkCopyFat16">func BenchmarkCopyFat16(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat16
```

```Go
func BenchmarkCopyFat16(b *testing.B)
```

### <a id="BenchmarkCopyFat24" href="#BenchmarkCopyFat24">func BenchmarkCopyFat24(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat24
```

```Go
func BenchmarkCopyFat24(b *testing.B)
```

### <a id="BenchmarkCopyFat32" href="#BenchmarkCopyFat32">func BenchmarkCopyFat32(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat32
```

```Go
func BenchmarkCopyFat32(b *testing.B)
```

### <a id="BenchmarkCopyFat64" href="#BenchmarkCopyFat64">func BenchmarkCopyFat64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat64
```

```Go
func BenchmarkCopyFat64(b *testing.B)
```

### <a id="BenchmarkCopyFat128" href="#BenchmarkCopyFat128">func BenchmarkCopyFat128(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat128
```

```Go
func BenchmarkCopyFat128(b *testing.B)
```

### <a id="BenchmarkCopyFat256" href="#BenchmarkCopyFat256">func BenchmarkCopyFat256(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat256
```

```Go
func BenchmarkCopyFat256(b *testing.B)
```

### <a id="BenchmarkCopyFat512" href="#BenchmarkCopyFat512">func BenchmarkCopyFat512(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat512
```

```Go
func BenchmarkCopyFat512(b *testing.B)
```

### <a id="BenchmarkCopyFat520" href="#BenchmarkCopyFat520">func BenchmarkCopyFat520(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat520
```

```Go
func BenchmarkCopyFat520(b *testing.B)
```

### <a id="BenchmarkCopyFat1024" href="#BenchmarkCopyFat1024">func BenchmarkCopyFat1024(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopyFat1024
```

```Go
func BenchmarkCopyFat1024(b *testing.B)
```

### <a id="BenchmarkIssue18740" href="#BenchmarkIssue18740">func BenchmarkIssue18740(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkIssue18740
```

```Go
func BenchmarkIssue18740(b *testing.B)
```

BenchmarkIssue18740 ensures that memmove uses 4 and 8 byte load/store to move 4 and 8 bytes. It used to do 2 2-byte load/stores, which leads to a pipeline stall when we try to read the result with one 4-byte load. 

### <a id="prepareAllMetricsSamples" href="#prepareAllMetricsSamples">func prepareAllMetricsSamples() (map[string]metrics.Description, []metrics.Sample)</a>

```
searchKey: runtime_test.prepareAllMetricsSamples
```

```Go
func prepareAllMetricsSamples() (map[string]metrics.Description, []metrics.Sample)
```

### <a id="TestReadMetrics" href="#TestReadMetrics">func TestReadMetrics(t *testing.T)</a>

```
searchKey: runtime_test.TestReadMetrics
```

```Go
func TestReadMetrics(t *testing.T)
```

### <a id="TestReadMetricsConsistency" href="#TestReadMetricsConsistency">func TestReadMetricsConsistency(t *testing.T)</a>

```
searchKey: runtime_test.TestReadMetricsConsistency
```

```Go
func TestReadMetricsConsistency(t *testing.T)
```

### <a id="BenchmarkReadMetricsLatency" href="#BenchmarkReadMetricsLatency">func BenchmarkReadMetricsLatency(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkReadMetricsLatency
```

```Go
func BenchmarkReadMetricsLatency(b *testing.B)
```

### <a id="TestFinalizerType" href="#TestFinalizerType">func TestFinalizerType(t *testing.T)</a>

```
searchKey: runtime_test.TestFinalizerType
```

```Go
func TestFinalizerType(t *testing.T)
```

### <a id="TestFinalizerInterfaceBig" href="#TestFinalizerInterfaceBig">func TestFinalizerInterfaceBig(t *testing.T)</a>

```
searchKey: runtime_test.TestFinalizerInterfaceBig
```

```Go
func TestFinalizerInterfaceBig(t *testing.T)
```

### <a id="fin" href="#fin">func fin(v *int)</a>

```
searchKey: runtime_test.fin
```

```Go
func fin(v *int)
```

### <a id="TestFinalizerZeroSizedStruct" href="#TestFinalizerZeroSizedStruct">func TestFinalizerZeroSizedStruct(t *testing.T)</a>

```
searchKey: runtime_test.TestFinalizerZeroSizedStruct
```

```Go
func TestFinalizerZeroSizedStruct(t *testing.T)
```

Verify we don't crash at least. golang.org/issue/6857 

### <a id="BenchmarkFinalizer" href="#BenchmarkFinalizer">func BenchmarkFinalizer(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFinalizer
```

```Go
func BenchmarkFinalizer(b *testing.B)
```

### <a id="BenchmarkFinalizerRun" href="#BenchmarkFinalizerRun">func BenchmarkFinalizerRun(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFinalizerRun
```

```Go
func BenchmarkFinalizerRun(b *testing.B)
```

### <a id="TestEmptySlice" href="#TestEmptySlice">func TestEmptySlice(t *testing.T)</a>

```
searchKey: runtime_test.TestEmptySlice
```

```Go
func TestEmptySlice(t *testing.T)
```

Make sure an empty slice on the stack doesn't pin the next object in memory. 

### <a id="TestEmptyString" href="#TestEmptyString">func TestEmptyString(t *testing.T)</a>

```
searchKey: runtime_test.TestEmptyString
```

```Go
func TestEmptyString(t *testing.T)
```

Make sure an empty string on the stack doesn't pin the next object in memory. 

### <a id="TestFinalizerOnGlobal" href="#TestFinalizerOnGlobal">func TestFinalizerOnGlobal(t *testing.T)</a>

```
searchKey: runtime_test.TestFinalizerOnGlobal
```

```Go
func TestFinalizerOnGlobal(t *testing.T)
```

Test for issue 7656. 

### <a id="TestDeferKeepAlive" href="#TestDeferKeepAlive">func TestDeferKeepAlive(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferKeepAlive
```

```Go
func TestDeferKeepAlive(t *testing.T)
```

### <a id="makePallocData" href="#makePallocData">func makePallocData(alloc, scavenged []BitRange) *PallocData</a>

```
searchKey: runtime_test.makePallocData
```

```Go
func makePallocData(alloc, scavenged []BitRange) *PallocData
```

makePallocData produces an initialized PallocData by setting the ranges of described in alloc and scavenge. 

### <a id="TestFillAligned" href="#TestFillAligned">func TestFillAligned(t *testing.T)</a>

```
searchKey: runtime_test.TestFillAligned
```

```Go
func TestFillAligned(t *testing.T)
```

### <a id="TestPallocDataFindScavengeCandidate" href="#TestPallocDataFindScavengeCandidate">func TestPallocDataFindScavengeCandidate(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocDataFindScavengeCandidate
```

```Go
func TestPallocDataFindScavengeCandidate(t *testing.T)
```

### <a id="TestPageAllocScavenge" href="#TestPageAllocScavenge">func TestPageAllocScavenge(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocScavenge
```

```Go
func TestPageAllocScavenge(t *testing.T)
```

Tests end-to-end scavenging on a pageAlloc. 

### <a id="checkPageAlloc" href="#checkPageAlloc">func checkPageAlloc(t *testing.T, want, got *PageAlloc)</a>

```
searchKey: runtime_test.checkPageAlloc
```

```Go
func checkPageAlloc(t *testing.T, want, got *PageAlloc)
```

### <a id="TestPageAllocGrow" href="#TestPageAllocGrow">func TestPageAllocGrow(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocGrow
```

```Go
func TestPageAllocGrow(t *testing.T)
```

### <a id="TestPageAllocAlloc" href="#TestPageAllocAlloc">func TestPageAllocAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocAlloc
```

```Go
func TestPageAllocAlloc(t *testing.T)
```

### <a id="TestPageAllocExhaust" href="#TestPageAllocExhaust">func TestPageAllocExhaust(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocExhaust
```

```Go
func TestPageAllocExhaust(t *testing.T)
```

### <a id="TestPageAllocFree" href="#TestPageAllocFree">func TestPageAllocFree(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocFree
```

```Go
func TestPageAllocFree(t *testing.T)
```

### <a id="TestPageAllocAllocAndFree" href="#TestPageAllocAllocAndFree">func TestPageAllocAllocAndFree(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocAllocAndFree
```

```Go
func TestPageAllocAllocAndFree(t *testing.T)
```

### <a id="checkPageCache" href="#checkPageCache">func checkPageCache(t *testing.T, got, want PageCache)</a>

```
searchKey: runtime_test.checkPageCache
```

```Go
func checkPageCache(t *testing.T, got, want PageCache)
```

### <a id="TestPageCacheAlloc" href="#TestPageCacheAlloc">func TestPageCacheAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestPageCacheAlloc
```

```Go
func TestPageCacheAlloc(t *testing.T)
```

### <a id="TestPageCacheFlush" href="#TestPageCacheFlush">func TestPageCacheFlush(t *testing.T)</a>

```
searchKey: runtime_test.TestPageCacheFlush
```

```Go
func TestPageCacheFlush(t *testing.T)
```

### <a id="TestPageAllocAllocToCache" href="#TestPageAllocAllocToCache">func TestPageAllocAllocToCache(t *testing.T)</a>

```
searchKey: runtime_test.TestPageAllocAllocToCache
```

```Go
func TestPageAllocAllocToCache(t *testing.T)
```

### <a id="checkPallocBits" href="#checkPallocBits">func checkPallocBits(t *testing.T, got, want *PallocBits) bool</a>

```
searchKey: runtime_test.checkPallocBits
```

```Go
func checkPallocBits(t *testing.T, got, want *PallocBits) bool
```

Ensures that got and want are the same, and if not, reports detailed diff information. 

### <a id="makePallocBits" href="#makePallocBits">func makePallocBits(s []BitRange) *PallocBits</a>

```
searchKey: runtime_test.makePallocBits
```

```Go
func makePallocBits(s []BitRange) *PallocBits
```

makePallocBits produces an initialized PallocBits by setting the ranges in s to 1 and the rest to zero. 

### <a id="TestPallocBitsAllocRange" href="#TestPallocBitsAllocRange">func TestPallocBitsAllocRange(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsAllocRange
```

```Go
func TestPallocBitsAllocRange(t *testing.T)
```

Ensures that PallocBits.AllocRange works, which is a fundamental method used for testing and initialization since it's used by makePallocBits. 

### <a id="invertPallocBits" href="#invertPallocBits">func invertPallocBits(b *PallocBits)</a>

```
searchKey: runtime_test.invertPallocBits
```

```Go
func invertPallocBits(b *PallocBits)
```

Inverts every bit in the PallocBits. 

### <a id="checkPallocSum" href="#checkPallocSum">func checkPallocSum(t testing.TB, got, want PallocSum)</a>

```
searchKey: runtime_test.checkPallocSum
```

```Go
func checkPallocSum(t testing.TB, got, want PallocSum)
```

Ensures two packed summaries are identical, and reports a detailed description of the difference if they're not. 

### <a id="TestMallocBitsPopcntRange" href="#TestMallocBitsPopcntRange">func TestMallocBitsPopcntRange(t *testing.T)</a>

```
searchKey: runtime_test.TestMallocBitsPopcntRange
```

```Go
func TestMallocBitsPopcntRange(t *testing.T)
```

### <a id="TestPallocBitsSummarizeRandom" href="#TestPallocBitsSummarizeRandom">func TestPallocBitsSummarizeRandom(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsSummarizeRandom
```

```Go
func TestPallocBitsSummarizeRandom(t *testing.T)
```

Ensures computing bit summaries works as expected by generating random bitmaps and checking against a reference implementation. 

### <a id="TestPallocBitsSummarize" href="#TestPallocBitsSummarize">func TestPallocBitsSummarize(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsSummarize
```

```Go
func TestPallocBitsSummarize(t *testing.T)
```

Ensures computing bit summaries works as expected. 

### <a id="BenchmarkPallocBitsSummarize" href="#BenchmarkPallocBitsSummarize">func BenchmarkPallocBitsSummarize(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkPallocBitsSummarize
```

```Go
func BenchmarkPallocBitsSummarize(b *testing.B)
```

Benchmarks how quickly we can summarize a PallocBits. 

### <a id="TestPallocBitsAlloc" href="#TestPallocBitsAlloc">func TestPallocBitsAlloc(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsAlloc
```

```Go
func TestPallocBitsAlloc(t *testing.T)
```

Ensures page allocation works. 

### <a id="TestPallocBitsFree" href="#TestPallocBitsFree">func TestPallocBitsFree(t *testing.T)</a>

```
searchKey: runtime_test.TestPallocBitsFree
```

```Go
func TestPallocBitsFree(t *testing.T)
```

Ensures page freeing works. 

### <a id="TestFindBitRange64" href="#TestFindBitRange64">func TestFindBitRange64(t *testing.T)</a>

```
searchKey: runtime_test.TestFindBitRange64
```

```Go
func TestFindBitRange64(t *testing.T)
```

### <a id="BenchmarkFindBitRange64" href="#BenchmarkFindBitRange64">func BenchmarkFindBitRange64(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFindBitRange64
```

```Go
func BenchmarkFindBitRange64(b *testing.B)
```

### <a id="validateAddrRanges" href="#validateAddrRanges">func validateAddrRanges(t *testing.T, a *AddrRanges, want ...AddrRange)</a>

```
searchKey: runtime_test.validateAddrRanges
```

```Go
func validateAddrRanges(t *testing.T, a *AddrRanges, want ...AddrRange)
```

### <a id="TestAddrRangesAdd" href="#TestAddrRangesAdd">func TestAddrRangesAdd(t *testing.T)</a>

```
searchKey: runtime_test.TestAddrRangesAdd
```

```Go
func TestAddrRangesAdd(t *testing.T)
```

### <a id="TestAddrRangesFindSucc" href="#TestAddrRangesFindSucc">func TestAddrRangesFindSucc(t *testing.T)</a>

```
searchKey: runtime_test.TestAddrRangesFindSucc
```

```Go
func TestAddrRangesFindSucc(t *testing.T)
```

### <a id="fcntl" href="#fcntl">func fcntl(fd uintptr, cmd int, arg uintptr) (uintptr, syscall.Errno)</a>

```
searchKey: runtime_test.fcntl
```

```Go
func fcntl(fd uintptr, cmd int, arg uintptr) (uintptr, syscall.Errno)
```

Call fcntl libc function rather than calling syscall. 

### <a id="TestNonblockingPipe" href="#TestNonblockingPipe">func TestNonblockingPipe(t *testing.T)</a>

```
searchKey: runtime_test.TestNonblockingPipe
```

```Go
func TestNonblockingPipe(t *testing.T)
```

### <a id="checkIsPipe" href="#checkIsPipe">func checkIsPipe(t *testing.T, r, w int32)</a>

```
searchKey: runtime_test.checkIsPipe
```

```Go
func checkIsPipe(t *testing.T, r, w int32)
```

### <a id="checkNonblocking" href="#checkNonblocking">func checkNonblocking(t *testing.T, fd int32, name string)</a>

```
searchKey: runtime_test.checkNonblocking
```

```Go
func checkNonblocking(t *testing.T, fd int32, name string)
```

### <a id="checkCloseonexec" href="#checkCloseonexec">func checkCloseonexec(t *testing.T, fd int32, name string)</a>

```
searchKey: runtime_test.checkCloseonexec
```

```Go
func checkCloseonexec(t *testing.T, fd int32, name string)
```

### <a id="TestSetNonblock" href="#TestSetNonblock">func TestSetNonblock(t *testing.T)</a>

```
searchKey: runtime_test.TestSetNonblock
```

```Go
func TestSetNonblock(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: runtime_test.init
```

```Go
func init()
```

### <a id="BenchmarkNetpollBreak" href="#BenchmarkNetpollBreak">func BenchmarkNetpollBreak(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkNetpollBreak
```

```Go
func BenchmarkNetpollBreak(b *testing.B)
```

### <a id="BenchmarkSyscall" href="#BenchmarkSyscall">func BenchmarkSyscall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSyscall
```

```Go
func BenchmarkSyscall(b *testing.B)
```

Syscall tests split stack between Entersyscall and Exitsyscall under race detector. 

### <a id="BenchmarkSyscallWork" href="#BenchmarkSyscallWork">func BenchmarkSyscallWork(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSyscallWork
```

```Go
func BenchmarkSyscallWork(b *testing.B)
```

### <a id="BenchmarkSyscallExcess" href="#BenchmarkSyscallExcess">func BenchmarkSyscallExcess(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSyscallExcess
```

```Go
func BenchmarkSyscallExcess(b *testing.B)
```

### <a id="BenchmarkSyscallExcessWork" href="#BenchmarkSyscallExcessWork">func BenchmarkSyscallExcessWork(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSyscallExcessWork
```

```Go
func BenchmarkSyscallExcessWork(b *testing.B)
```

### <a id="benchmarkSyscall" href="#benchmarkSyscall">func benchmarkSyscall(b *testing.B, work, excess int)</a>

```
searchKey: runtime_test.benchmarkSyscall
```

```Go
func benchmarkSyscall(b *testing.B, work, excess int)
```

### <a id="TestPanicWithDirectlyPrintableCustomTypes" href="#TestPanicWithDirectlyPrintableCustomTypes">func TestPanicWithDirectlyPrintableCustomTypes(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicWithDirectlyPrintableCustomTypes
```

```Go
func TestPanicWithDirectlyPrintableCustomTypes(t *testing.T)
```

Test that panics print out the underlying value when the underlying kind is directly printable. Issue: [https://golang.org/issues/37531](https://golang.org/issues/37531) 

### <a id="perpetuumMobile" href="#perpetuumMobile">func perpetuumMobile()</a>

```
searchKey: runtime_test.perpetuumMobile
```

```Go
func perpetuumMobile()
```

### <a id="TestStopTheWorldDeadlock" href="#TestStopTheWorldDeadlock">func TestStopTheWorldDeadlock(t *testing.T)</a>

```
searchKey: runtime_test.TestStopTheWorldDeadlock
```

```Go
func TestStopTheWorldDeadlock(t *testing.T)
```

### <a id="TestYieldProgress" href="#TestYieldProgress">func TestYieldProgress(t *testing.T)</a>

```
searchKey: runtime_test.TestYieldProgress
```

```Go
func TestYieldProgress(t *testing.T)
```

### <a id="TestYieldLockedProgress" href="#TestYieldLockedProgress">func TestYieldLockedProgress(t *testing.T)</a>

```
searchKey: runtime_test.TestYieldLockedProgress
```

```Go
func TestYieldLockedProgress(t *testing.T)
```

### <a id="testYieldProgress" href="#testYieldProgress">func testYieldProgress(locked bool)</a>

```
searchKey: runtime_test.testYieldProgress
```

```Go
func testYieldProgress(locked bool)
```

### <a id="TestYieldLocked" href="#TestYieldLocked">func TestYieldLocked(t *testing.T)</a>

```
searchKey: runtime_test.TestYieldLocked
```

```Go
func TestYieldLocked(t *testing.T)
```

### <a id="TestGoroutineParallelism" href="#TestGoroutineParallelism">func TestGoroutineParallelism(t *testing.T)</a>

```
searchKey: runtime_test.TestGoroutineParallelism
```

```Go
func TestGoroutineParallelism(t *testing.T)
```

### <a id="TestGoroutineParallelism2" href="#TestGoroutineParallelism2">func TestGoroutineParallelism2(t *testing.T)</a>

```
searchKey: runtime_test.TestGoroutineParallelism2
```

```Go
func TestGoroutineParallelism2(t *testing.T)
```

Test that all runnable goroutines are scheduled at the same time. 

### <a id="testGoroutineParallelism2" href="#testGoroutineParallelism2">func testGoroutineParallelism2(t *testing.T, load, netpoll bool)</a>

```
searchKey: runtime_test.testGoroutineParallelism2
```

```Go
func testGoroutineParallelism2(t *testing.T, load, netpoll bool)
```

### <a id="TestBlockLocked" href="#TestBlockLocked">func TestBlockLocked(t *testing.T)</a>

```
searchKey: runtime_test.TestBlockLocked
```

```Go
func TestBlockLocked(t *testing.T)
```

### <a id="TestTimerFairness" href="#TestTimerFairness">func TestTimerFairness(t *testing.T)</a>

```
searchKey: runtime_test.TestTimerFairness
```

```Go
func TestTimerFairness(t *testing.T)
```

### <a id="TestTimerFairness2" href="#TestTimerFairness2">func TestTimerFairness2(t *testing.T)</a>

```
searchKey: runtime_test.TestTimerFairness2
```

```Go
func TestTimerFairness2(t *testing.T)
```

### <a id="TestPreemption" href="#TestPreemption">func TestPreemption(t *testing.T)</a>

```
searchKey: runtime_test.TestPreemption
```

```Go
func TestPreemption(t *testing.T)
```

### <a id="TestPreemptionGC" href="#TestPreemptionGC">func TestPreemptionGC(t *testing.T)</a>

```
searchKey: runtime_test.TestPreemptionGC
```

```Go
func TestPreemptionGC(t *testing.T)
```

### <a id="TestAsyncPreempt" href="#TestAsyncPreempt">func TestAsyncPreempt(t *testing.T)</a>

```
searchKey: runtime_test.TestAsyncPreempt
```

```Go
func TestAsyncPreempt(t *testing.T)
```

### <a id="TestGCFairness" href="#TestGCFairness">func TestGCFairness(t *testing.T)</a>

```
searchKey: runtime_test.TestGCFairness
```

```Go
func TestGCFairness(t *testing.T)
```

### <a id="TestGCFairness2" href="#TestGCFairness2">func TestGCFairness2(t *testing.T)</a>

```
searchKey: runtime_test.TestGCFairness2
```

```Go
func TestGCFairness2(t *testing.T)
```

### <a id="TestNumGoroutine" href="#TestNumGoroutine">func TestNumGoroutine(t *testing.T)</a>

```
searchKey: runtime_test.TestNumGoroutine
```

```Go
func TestNumGoroutine(t *testing.T)
```

### <a id="TestPingPongHog" href="#TestPingPongHog">func TestPingPongHog(t *testing.T)</a>

```
searchKey: runtime_test.TestPingPongHog
```

```Go
func TestPingPongHog(t *testing.T)
```

### <a id="BenchmarkPingPongHog" href="#BenchmarkPingPongHog">func BenchmarkPingPongHog(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkPingPongHog
```

```Go
func BenchmarkPingPongHog(b *testing.B)
```

### <a id="stackGrowthRecursive" href="#stackGrowthRecursive">func stackGrowthRecursive(i int)</a>

```
searchKey: runtime_test.stackGrowthRecursive
```

```Go
func stackGrowthRecursive(i int)
```

### <a id="TestPreemptSplitBig" href="#TestPreemptSplitBig">func TestPreemptSplitBig(t *testing.T)</a>

```
searchKey: runtime_test.TestPreemptSplitBig
```

```Go
func TestPreemptSplitBig(t *testing.T)
```

### <a id="big" href="#big">func big(stop chan int) int</a>

```
searchKey: runtime_test.big
```

```Go
func big(stop chan int) int
```

### <a id="bigframe" href="#bigframe">func bigframe(stop chan int) int</a>

```
searchKey: runtime_test.bigframe
```

```Go
func bigframe(stop chan int) int
```

### <a id="small" href="#small">func small(stop chan int, x *[8192]byte) int</a>

```
searchKey: runtime_test.small
```

```Go
func small(stop chan int, x *[8192]byte) int
```

### <a id="nonleaf" href="#nonleaf">func nonleaf(stop chan int) bool</a>

```
searchKey: runtime_test.nonleaf
```

```Go
func nonleaf(stop chan int) bool
```

### <a id="TestSchedLocalQueue" href="#TestSchedLocalQueue">func TestSchedLocalQueue(t *testing.T)</a>

```
searchKey: runtime_test.TestSchedLocalQueue
```

```Go
func TestSchedLocalQueue(t *testing.T)
```

### <a id="TestSchedLocalQueueSteal" href="#TestSchedLocalQueueSteal">func TestSchedLocalQueueSteal(t *testing.T)</a>

```
searchKey: runtime_test.TestSchedLocalQueueSteal
```

```Go
func TestSchedLocalQueueSteal(t *testing.T)
```

### <a id="TestSchedLocalQueueEmpty" href="#TestSchedLocalQueueEmpty">func TestSchedLocalQueueEmpty(t *testing.T)</a>

```
searchKey: runtime_test.TestSchedLocalQueueEmpty
```

```Go
func TestSchedLocalQueueEmpty(t *testing.T)
```

### <a id="benchmarkStackGrowth" href="#benchmarkStackGrowth">func benchmarkStackGrowth(b *testing.B, rec int)</a>

```
searchKey: runtime_test.benchmarkStackGrowth
```

```Go
func benchmarkStackGrowth(b *testing.B, rec int)
```

### <a id="BenchmarkStackGrowth" href="#BenchmarkStackGrowth">func BenchmarkStackGrowth(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackGrowth
```

```Go
func BenchmarkStackGrowth(b *testing.B)
```

### <a id="BenchmarkStackGrowthDeep" href="#BenchmarkStackGrowthDeep">func BenchmarkStackGrowthDeep(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackGrowthDeep
```

```Go
func BenchmarkStackGrowthDeep(b *testing.B)
```

### <a id="BenchmarkCreateGoroutines" href="#BenchmarkCreateGoroutines">func BenchmarkCreateGoroutines(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCreateGoroutines
```

```Go
func BenchmarkCreateGoroutines(b *testing.B)
```

### <a id="BenchmarkCreateGoroutinesParallel" href="#BenchmarkCreateGoroutinesParallel">func BenchmarkCreateGoroutinesParallel(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCreateGoroutinesParallel
```

```Go
func BenchmarkCreateGoroutinesParallel(b *testing.B)
```

### <a id="benchmarkCreateGoroutines" href="#benchmarkCreateGoroutines">func benchmarkCreateGoroutines(b *testing.B, procs int)</a>

```
searchKey: runtime_test.benchmarkCreateGoroutines
```

```Go
func benchmarkCreateGoroutines(b *testing.B, procs int)
```

### <a id="BenchmarkCreateGoroutinesCapture" href="#BenchmarkCreateGoroutinesCapture">func BenchmarkCreateGoroutinesCapture(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCreateGoroutinesCapture
```

```Go
func BenchmarkCreateGoroutinesCapture(b *testing.B)
```

### <a id="warmupScheduler" href="#warmupScheduler">func warmupScheduler(targetThreadCount int)</a>

```
searchKey: runtime_test.warmupScheduler
```

```Go
func warmupScheduler(targetThreadCount int)
```

warmupScheduler ensures the scheduler has at least targetThreadCount threads in its thread pool. 

### <a id="doWork" href="#doWork">func doWork(dur time.Duration)</a>

```
searchKey: runtime_test.doWork
```

```Go
func doWork(dur time.Duration)
```

### <a id="BenchmarkCreateGoroutinesSingle" href="#BenchmarkCreateGoroutinesSingle">func BenchmarkCreateGoroutinesSingle(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCreateGoroutinesSingle
```

```Go
func BenchmarkCreateGoroutinesSingle(b *testing.B)
```

BenchmarkCreateGoroutinesSingle creates many goroutines, all from a single producer (the main benchmark goroutine). 

Compared to BenchmarkCreateGoroutines, this causes different behavior in the scheduler because Ms are much more likely to need to steal work from the main P rather than having work in the local run queue. 

### <a id="BenchmarkClosureCall" href="#BenchmarkClosureCall">func BenchmarkClosureCall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkClosureCall
```

```Go
func BenchmarkClosureCall(b *testing.B)
```

### <a id="benchmarkWakeupParallel" href="#benchmarkWakeupParallel">func benchmarkWakeupParallel(b *testing.B, spin func(time.Duration))</a>

```
searchKey: runtime_test.benchmarkWakeupParallel
```

```Go
func benchmarkWakeupParallel(b *testing.B, spin func(time.Duration))
```

### <a id="BenchmarkWakeupParallelSpinning" href="#BenchmarkWakeupParallelSpinning">func BenchmarkWakeupParallelSpinning(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkWakeupParallelSpinning
```

```Go
func BenchmarkWakeupParallelSpinning(b *testing.B)
```

### <a id="BenchmarkWakeupParallelSyscall" href="#BenchmarkWakeupParallelSyscall">func BenchmarkWakeupParallelSyscall(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkWakeupParallelSyscall
```

```Go
func BenchmarkWakeupParallelSyscall(b *testing.B)
```

### <a id="BenchmarkMatmult" href="#BenchmarkMatmult">func BenchmarkMatmult(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMatmult
```

```Go
func BenchmarkMatmult(b *testing.B)
```

### <a id="matmult" href="#matmult">func matmult(done chan<- struct{}, A, B, C Matrix, i0, i1, j0, j1, k0, k1, threshold int)</a>

```
searchKey: runtime_test.matmult
```

```Go
func matmult(done chan<- struct{}, A, B, C Matrix, i0, i1, j0, j1, k0, k1, threshold int)
```

### <a id="TestStealOrder" href="#TestStealOrder">func TestStealOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestStealOrder
```

```Go
func TestStealOrder(t *testing.T)
```

### <a id="TestLockOSThreadNesting" href="#TestLockOSThreadNesting">func TestLockOSThreadNesting(t *testing.T)</a>

```
searchKey: runtime_test.TestLockOSThreadNesting
```

```Go
func TestLockOSThreadNesting(t *testing.T)
```

### <a id="TestLockOSThreadExit" href="#TestLockOSThreadExit">func TestLockOSThreadExit(t *testing.T)</a>

```
searchKey: runtime_test.TestLockOSThreadExit
```

```Go
func TestLockOSThreadExit(t *testing.T)
```

### <a id="testLockOSThreadExit" href="#testLockOSThreadExit">func testLockOSThreadExit(t *testing.T, prog string)</a>

```
searchKey: runtime_test.testLockOSThreadExit
```

```Go
func testLockOSThreadExit(t *testing.T, prog string)
```

### <a id="TestLockOSThreadAvoidsStatePropagation" href="#TestLockOSThreadAvoidsStatePropagation">func TestLockOSThreadAvoidsStatePropagation(t *testing.T)</a>

```
searchKey: runtime_test.TestLockOSThreadAvoidsStatePropagation
```

```Go
func TestLockOSThreadAvoidsStatePropagation(t *testing.T)
```

### <a id="TestLockOSThreadTemplateThreadRace" href="#TestLockOSThreadTemplateThreadRace">func TestLockOSThreadTemplateThreadRace(t *testing.T)</a>

```
searchKey: runtime_test.TestLockOSThreadTemplateThreadRace
```

```Go
func TestLockOSThreadTemplateThreadRace(t *testing.T)
```

### <a id="fakeSyscall" href="#fakeSyscall">func fakeSyscall(duration time.Duration)</a>

```
searchKey: runtime_test.fakeSyscall
```

```Go
func fakeSyscall(duration time.Duration)
```

fakeSyscall emulates a system call. 

### <a id="testPreemptionAfterSyscall" href="#testPreemptionAfterSyscall">func testPreemptionAfterSyscall(t *testing.T, syscallDuration time.Duration)</a>

```
searchKey: runtime_test.testPreemptionAfterSyscall
```

```Go
func testPreemptionAfterSyscall(t *testing.T, syscallDuration time.Duration)
```

Check that a goroutine will be preempted if it is calling short system calls. 

### <a id="TestPreemptionAfterSyscall" href="#TestPreemptionAfterSyscall">func TestPreemptionAfterSyscall(t *testing.T)</a>

```
searchKey: runtime_test.TestPreemptionAfterSyscall
```

```Go
func TestPreemptionAfterSyscall(t *testing.T)
```

### <a id="TestGetgThreadSwitch" href="#TestGetgThreadSwitch">func TestGetgThreadSwitch(t *testing.T)</a>

```
searchKey: runtime_test.TestGetgThreadSwitch
```

```Go
func TestGetgThreadSwitch(t *testing.T)
```

### <a id="TestNetpollBreak" href="#TestNetpollBreak">func TestNetpollBreak(t *testing.T)</a>

```
searchKey: runtime_test.TestNetpollBreak
```

```Go
func TestNetpollBreak(t *testing.T)
```

TestNetpollBreak tests that netpollBreak can break a netpoll. This test is not particularly safe since the call to netpoll will pick up any stray files that are ready, but it should work OK as long it is not run in parallel. 

### <a id="TestBigGOMAXPROCS" href="#TestBigGOMAXPROCS">func TestBigGOMAXPROCS(t *testing.T)</a>

```
searchKey: runtime_test.TestBigGOMAXPROCS
```

```Go
func TestBigGOMAXPROCS(t *testing.T)
```

TestBigGOMAXPROCS tests that setting GOMAXPROCS to a large value doesn't cause a crash at startup. See issue 38474. 

### <a id="TestProfBuf" href="#TestProfBuf">func TestProfBuf(t *testing.T)</a>

```
searchKey: runtime_test.TestProfBuf
```

```Go
func TestProfBuf(t *testing.T)
```

### <a id="BenchmarkFastrand" href="#BenchmarkFastrand">func BenchmarkFastrand(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFastrand
```

```Go
func BenchmarkFastrand(b *testing.B)
```

### <a id="BenchmarkFastrandHashiter" href="#BenchmarkFastrandHashiter">func BenchmarkFastrandHashiter(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFastrandHashiter
```

```Go
func BenchmarkFastrandHashiter(b *testing.B)
```

### <a id="BenchmarkFastrandn" href="#BenchmarkFastrandn">func BenchmarkFastrandn(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkFastrandn
```

```Go
func BenchmarkFastrandn(b *testing.B)
```

### <a id="checkGdbEnvironment" href="#checkGdbEnvironment">func checkGdbEnvironment(t *testing.T)</a>

```
searchKey: runtime_test.checkGdbEnvironment
```

```Go
func checkGdbEnvironment(t *testing.T)
```

### <a id="checkGdbVersion" href="#checkGdbVersion">func checkGdbVersion(t *testing.T)</a>

```
searchKey: runtime_test.checkGdbVersion
```

```Go
func checkGdbVersion(t *testing.T)
```

### <a id="checkGdbPython" href="#checkGdbPython">func checkGdbPython(t *testing.T)</a>

```
searchKey: runtime_test.checkGdbPython
```

```Go
func checkGdbPython(t *testing.T)
```

### <a id="checkCleanBacktrace" href="#checkCleanBacktrace">func checkCleanBacktrace(t *testing.T, backtrace string)</a>

```
searchKey: runtime_test.checkCleanBacktrace
```

```Go
func checkCleanBacktrace(t *testing.T, backtrace string)
```

checkCleanBacktrace checks that the given backtrace is well formed and does not contain any error messages from GDB. 

### <a id="lastLine" href="#lastLine">func lastLine(src []byte) int</a>

```
searchKey: runtime_test.lastLine
```

```Go
func lastLine(src []byte) int
```

### <a id="TestGdbPython" href="#TestGdbPython">func TestGdbPython(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbPython
```

```Go
func TestGdbPython(t *testing.T)
```

### <a id="TestGdbPythonCgo" href="#TestGdbPythonCgo">func TestGdbPythonCgo(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbPythonCgo
```

```Go
func TestGdbPythonCgo(t *testing.T)
```

### <a id="testGdbPython" href="#testGdbPython">func testGdbPython(t *testing.T, cgo bool)</a>

```
searchKey: runtime_test.testGdbPython
```

```Go
func testGdbPython(t *testing.T, cgo bool)
```

### <a id="TestGdbBacktrace" href="#TestGdbBacktrace">func TestGdbBacktrace(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbBacktrace
```

```Go
func TestGdbBacktrace(t *testing.T)
```

TestGdbBacktrace tests that gdb can unwind the stack correctly using only the DWARF debug info. 

### <a id="TestGdbAutotmpTypes" href="#TestGdbAutotmpTypes">func TestGdbAutotmpTypes(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbAutotmpTypes
```

```Go
func TestGdbAutotmpTypes(t *testing.T)
```

TestGdbAutotmpTypes ensures that types of autotmp variables appear in .debug_info See bug #17830. 

### <a id="TestGdbConst" href="#TestGdbConst">func TestGdbConst(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbConst
```

```Go
func TestGdbConst(t *testing.T)
```

### <a id="TestGdbPanic" href="#TestGdbPanic">func TestGdbPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbPanic
```

```Go
func TestGdbPanic(t *testing.T)
```

TestGdbPanic tests that gdb can unwind the stack correctly from SIGABRTs from Go panics. 

### <a id="TestGdbInfCallstack" href="#TestGdbInfCallstack">func TestGdbInfCallstack(t *testing.T)</a>

```
searchKey: runtime_test.TestGdbInfCallstack
```

```Go
func TestGdbInfCallstack(t *testing.T)
```

TestGdbInfCallstack tests that gdb can unwind the callstack of cgo programs on arm64 platforms without endless frames of function 'crossfunc1'. [https://golang.org/issue/37238](https://golang.org/issue/37238) 

### <a id="checkLldbPython" href="#checkLldbPython">func checkLldbPython(t *testing.T)</a>

```
searchKey: runtime_test.checkLldbPython
```

```Go
func checkLldbPython(t *testing.T)
```

### <a id="TestLldbPython" href="#TestLldbPython">func TestLldbPython(t *testing.T)</a>

```
searchKey: runtime_test.TestLldbPython
```

```Go
func TestLldbPython(t *testing.T)
```

### <a id="TestMmapErrorSign" href="#TestMmapErrorSign">func TestMmapErrorSign(t *testing.T)</a>

```
searchKey: runtime_test.TestMmapErrorSign
```

```Go
func TestMmapErrorSign(t *testing.T)
```

Test that the error value returned by mmap is positive, as that is what the code in mem_bsd.go, mem_darwin.go, and mem_linux.go expects. See the uses of ENOMEM in sysMap in those files. 

### <a id="TestPhysPageSize" href="#TestPhysPageSize">func TestPhysPageSize(t *testing.T)</a>

```
searchKey: runtime_test.TestPhysPageSize
```

```Go
func TestPhysPageSize(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: runtime_test.init
```

```Go
func init()
```

### <a id="errfn" href="#errfn">func errfn() error</a>

```
searchKey: runtime_test.errfn
```

```Go
func errfn() error
```

### <a id="errfn1" href="#errfn1">func errfn1() error</a>

```
searchKey: runtime_test.errfn1
```

```Go
func errfn1() error
```

### <a id="BenchmarkIfaceCmp100" href="#BenchmarkIfaceCmp100">func BenchmarkIfaceCmp100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkIfaceCmp100
```

```Go
func BenchmarkIfaceCmp100(b *testing.B)
```

### <a id="BenchmarkIfaceCmpNil100" href="#BenchmarkIfaceCmpNil100">func BenchmarkIfaceCmpNil100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkIfaceCmpNil100
```

```Go
func BenchmarkIfaceCmpNil100(b *testing.B)
```

### <a id="BenchmarkEfaceCmpDiff" href="#BenchmarkEfaceCmpDiff">func BenchmarkEfaceCmpDiff(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkEfaceCmpDiff
```

```Go
func BenchmarkEfaceCmpDiff(b *testing.B)
```

### <a id="BenchmarkEfaceCmpDiffIndirect" href="#BenchmarkEfaceCmpDiffIndirect">func BenchmarkEfaceCmpDiffIndirect(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkEfaceCmpDiffIndirect
```

```Go
func BenchmarkEfaceCmpDiffIndirect(b *testing.B)
```

### <a id="BenchmarkDefer" href="#BenchmarkDefer">func BenchmarkDefer(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkDefer
```

```Go
func BenchmarkDefer(b *testing.B)
```

### <a id="defer1" href="#defer1">func defer1()</a>

```
searchKey: runtime_test.defer1
```

```Go
func defer1()
```

### <a id="BenchmarkDefer10" href="#BenchmarkDefer10">func BenchmarkDefer10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkDefer10
```

```Go
func BenchmarkDefer10(b *testing.B)
```

### <a id="defer2" href="#defer2">func defer2()</a>

```
searchKey: runtime_test.defer2
```

```Go
func defer2()
```

### <a id="BenchmarkDeferMany" href="#BenchmarkDeferMany">func BenchmarkDeferMany(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkDeferMany
```

```Go
func BenchmarkDeferMany(b *testing.B)
```

### <a id="BenchmarkPanicRecover" href="#BenchmarkPanicRecover">func BenchmarkPanicRecover(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkPanicRecover
```

```Go
func BenchmarkPanicRecover(b *testing.B)
```

### <a id="defer3" href="#defer3">func defer3()</a>

```
searchKey: runtime_test.defer3
```

```Go
func defer3()
```

### <a id="TestStopCPUProfilingWithProfilerOff" href="#TestStopCPUProfilingWithProfilerOff">func TestStopCPUProfilingWithProfilerOff(t *testing.T)</a>

```
searchKey: runtime_test.TestStopCPUProfilingWithProfilerOff
```

```Go
func TestStopCPUProfilingWithProfilerOff(t *testing.T)
```

golang.org/issue/7063 

### <a id="TestSetPanicOnFault" href="#TestSetPanicOnFault">func TestSetPanicOnFault(t *testing.T)</a>

```
searchKey: runtime_test.TestSetPanicOnFault
```

```Go
func TestSetPanicOnFault(t *testing.T)
```

### <a id="testSetPanicOnFault" href="#testSetPanicOnFault">func testSetPanicOnFault(t *testing.T, addr uintptr, nfault *int)</a>

```
searchKey: runtime_test.testSetPanicOnFault
```

```Go
func testSetPanicOnFault(t *testing.T, addr uintptr, nfault *int)
```

testSetPanicOnFault tests one potentially faulting address. It deliberately constructs and uses an invalid pointer, so mark it as nocheckptr. 

### <a id="eqstring_generic" href="#eqstring_generic">func eqstring_generic(s1, s2 string) bool</a>

```
searchKey: runtime_test.eqstring_generic
```

```Go
func eqstring_generic(s1, s2 string) bool
```

### <a id="TestEqString" href="#TestEqString">func TestEqString(t *testing.T)</a>

```
searchKey: runtime_test.TestEqString
```

```Go
func TestEqString(t *testing.T)
```

### <a id="TestTrailingZero" href="#TestTrailingZero">func TestTrailingZero(t *testing.T)</a>

```
searchKey: runtime_test.TestTrailingZero
```

```Go
func TestTrailingZero(t *testing.T)
```

### <a id="TestAppendGrowth" href="#TestAppendGrowth">func TestAppendGrowth(t *testing.T)</a>

```
searchKey: runtime_test.TestAppendGrowth
```

```Go
func TestAppendGrowth(t *testing.T)
```

### <a id="TestAppendSliceGrowth" href="#TestAppendSliceGrowth">func TestAppendSliceGrowth(t *testing.T)</a>

```
searchKey: runtime_test.TestAppendSliceGrowth
```

```Go
func TestAppendSliceGrowth(t *testing.T)
```

### <a id="TestGoroutineProfileTrivial" href="#TestGoroutineProfileTrivial">func TestGoroutineProfileTrivial(t *testing.T)</a>

```
searchKey: runtime_test.TestGoroutineProfileTrivial
```

```Go
func TestGoroutineProfileTrivial(t *testing.T)
```

### <a id="TestVersion" href="#TestVersion">func TestVersion(t *testing.T)</a>

```
searchKey: runtime_test.TestVersion
```

```Go
func TestVersion(t *testing.T)
```

### <a id="TestGoroutineProfile" href="#TestGoroutineProfile">func TestGoroutineProfile(t *testing.T)</a>

```
searchKey: runtime_test.TestGoroutineProfile
```

```Go
func TestGoroutineProfile(t *testing.T)
```

### <a id="parallelReader" href="#parallelReader">func parallelReader(m *RWMutex, clocked chan bool, cunlock *uint32, cdone chan bool)</a>

```
searchKey: runtime_test.parallelReader
```

```Go
func parallelReader(m *RWMutex, clocked chan bool, cunlock *uint32, cdone chan bool)
```

### <a id="doTestParallelReaders" href="#doTestParallelReaders">func doTestParallelReaders(numReaders int)</a>

```
searchKey: runtime_test.doTestParallelReaders
```

```Go
func doTestParallelReaders(numReaders int)
```

### <a id="TestParallelRWMutexReaders" href="#TestParallelRWMutexReaders">func TestParallelRWMutexReaders(t *testing.T)</a>

```
searchKey: runtime_test.TestParallelRWMutexReaders
```

```Go
func TestParallelRWMutexReaders(t *testing.T)
```

### <a id="reader" href="#reader">func reader(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)</a>

```
searchKey: runtime_test.reader
```

```Go
func reader(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)
```

### <a id="writer" href="#writer">func writer(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)</a>

```
searchKey: runtime_test.writer
```

```Go
func writer(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)
```

### <a id="HammerRWMutex" href="#HammerRWMutex">func HammerRWMutex(gomaxprocs, numReaders, num_iterations int)</a>

```
searchKey: runtime_test.HammerRWMutex
```

```Go
func HammerRWMutex(gomaxprocs, numReaders, num_iterations int)
```

### <a id="TestRWMutex" href="#TestRWMutex">func TestRWMutex(t *testing.T)</a>

```
searchKey: runtime_test.TestRWMutex
```

```Go
func TestRWMutex(t *testing.T)
```

### <a id="BenchmarkRWMutexUncontended" href="#BenchmarkRWMutexUncontended">func BenchmarkRWMutexUncontended(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexUncontended
```

```Go
func BenchmarkRWMutexUncontended(b *testing.B)
```

### <a id="benchmarkRWMutex" href="#benchmarkRWMutex">func benchmarkRWMutex(b *testing.B, localWork, writeRatio int)</a>

```
searchKey: runtime_test.benchmarkRWMutex
```

```Go
func benchmarkRWMutex(b *testing.B, localWork, writeRatio int)
```

### <a id="BenchmarkRWMutexWrite100" href="#BenchmarkRWMutexWrite100">func BenchmarkRWMutexWrite100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexWrite100
```

```Go
func BenchmarkRWMutexWrite100(b *testing.B)
```

### <a id="BenchmarkRWMutexWrite10" href="#BenchmarkRWMutexWrite10">func BenchmarkRWMutexWrite10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexWrite10
```

```Go
func BenchmarkRWMutexWrite10(b *testing.B)
```

### <a id="BenchmarkRWMutexWorkWrite100" href="#BenchmarkRWMutexWorkWrite100">func BenchmarkRWMutexWorkWrite100(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexWorkWrite100
```

```Go
func BenchmarkRWMutexWorkWrite100(b *testing.B)
```

### <a id="BenchmarkRWMutexWorkWrite10" href="#BenchmarkRWMutexWorkWrite10">func BenchmarkRWMutexWorkWrite10(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRWMutexWorkWrite10
```

```Go
func BenchmarkRWMutexWorkWrite10(b *testing.B)
```

### <a id="TestSemaHandoff" href="#TestSemaHandoff">func TestSemaHandoff(t *testing.T)</a>

```
searchKey: runtime_test.TestSemaHandoff
```

```Go
func TestSemaHandoff(t *testing.T)
```

TestSemaHandoff checks that when semrelease+handoff is requested, the G that releases the semaphore yields its P directly to the first waiter in line. See issue 33747 for discussion. 

### <a id="TestSemaHandoff1" href="#TestSemaHandoff1">func TestSemaHandoff1(t *testing.T)</a>

```
searchKey: runtime_test.TestSemaHandoff1
```

```Go
func TestSemaHandoff1(t *testing.T)
```

### <a id="TestSemaHandoff2" href="#TestSemaHandoff2">func TestSemaHandoff2(t *testing.T)</a>

```
searchKey: runtime_test.TestSemaHandoff2
```

```Go
func TestSemaHandoff2(t *testing.T)
```

### <a id="testSemaHandoff" href="#testSemaHandoff">func testSemaHandoff() bool</a>

```
searchKey: runtime_test.testSemaHandoff
```

```Go
func testSemaHandoff() bool
```

### <a id="TestSpuriousWakeupsNeverHangSemasleep" href="#TestSpuriousWakeupsNeverHangSemasleep">func TestSpuriousWakeupsNeverHangSemasleep(t *testing.T)</a>

```
searchKey: runtime_test.TestSpuriousWakeupsNeverHangSemasleep
```

```Go
func TestSpuriousWakeupsNeverHangSemasleep(t *testing.T)
```

Issue #27250. Spurious wakeups to pthread_cond_timedwait_relative_np shouldn't cause semasleep to retry with the same timeout which would cause indefinite spinning. 

### <a id="TestSizeof" href="#TestSizeof">func TestSizeof(t *testing.T)</a>

```
searchKey: runtime_test.TestSizeof
```

```Go
func TestSizeof(t *testing.T)
```

### <a id="BenchmarkMakeSliceCopy" href="#BenchmarkMakeSliceCopy">func BenchmarkMakeSliceCopy(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMakeSliceCopy
```

```Go
func BenchmarkMakeSliceCopy(b *testing.B)
```

### <a id="BenchmarkMakeSlice" href="#BenchmarkMakeSlice">func BenchmarkMakeSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkMakeSlice
```

```Go
func BenchmarkMakeSlice(b *testing.B)
```

### <a id="BenchmarkGrowSlice" href="#BenchmarkGrowSlice">func BenchmarkGrowSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkGrowSlice
```

```Go
func BenchmarkGrowSlice(b *testing.B)
```

### <a id="BenchmarkExtendSlice" href="#BenchmarkExtendSlice">func BenchmarkExtendSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkExtendSlice
```

```Go
func BenchmarkExtendSlice(b *testing.B)
```

### <a id="BenchmarkAppend" href="#BenchmarkAppend">func BenchmarkAppend(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppend
```

```Go
func BenchmarkAppend(b *testing.B)
```

### <a id="BenchmarkAppendGrowByte" href="#BenchmarkAppendGrowByte">func BenchmarkAppendGrowByte(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendGrowByte
```

```Go
func BenchmarkAppendGrowByte(b *testing.B)
```

### <a id="BenchmarkAppendGrowString" href="#BenchmarkAppendGrowString">func BenchmarkAppendGrowString(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendGrowString
```

```Go
func BenchmarkAppendGrowString(b *testing.B)
```

### <a id="BenchmarkAppendSlice" href="#BenchmarkAppendSlice">func BenchmarkAppendSlice(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendSlice
```

```Go
func BenchmarkAppendSlice(b *testing.B)
```

### <a id="BenchmarkAppendSliceLarge" href="#BenchmarkAppendSliceLarge">func BenchmarkAppendSliceLarge(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendSliceLarge
```

```Go
func BenchmarkAppendSliceLarge(b *testing.B)
```

### <a id="BenchmarkAppendStr" href="#BenchmarkAppendStr">func BenchmarkAppendStr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendStr
```

```Go
func BenchmarkAppendStr(b *testing.B)
```

### <a id="BenchmarkAppendSpecialCase" href="#BenchmarkAppendSpecialCase">func BenchmarkAppendSpecialCase(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendSpecialCase
```

```Go
func BenchmarkAppendSpecialCase(b *testing.B)
```

### <a id="f" href="#f">func f() int</a>

```
searchKey: runtime_test.f
```

```Go
func f() int
```

### <a id="TestSideEffectOrder" href="#TestSideEffectOrder">func TestSideEffectOrder(t *testing.T)</a>

```
searchKey: runtime_test.TestSideEffectOrder
```

```Go
func TestSideEffectOrder(t *testing.T)
```

### <a id="TestAppendOverlap" href="#TestAppendOverlap">func TestAppendOverlap(t *testing.T)</a>

```
searchKey: runtime_test.TestAppendOverlap
```

```Go
func TestAppendOverlap(t *testing.T)
```

### <a id="BenchmarkCopy" href="#BenchmarkCopy">func BenchmarkCopy(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCopy
```

```Go
func BenchmarkCopy(b *testing.B)
```

### <a id="BenchmarkAppendInPlace" href="#BenchmarkAppendInPlace">func BenchmarkAppendInPlace(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkAppendInPlace
```

```Go
func BenchmarkAppendInPlace(b *testing.B)
```

BenchmarkAppendInPlace tests the performance of append when the result is being written back to the same slice. In order for the in-place optimization to occur, the slice must be referred to by address; using a global is an easy way to trigger that. We test the "grow" and "no grow" paths separately, but not the "normal" (occasionally grow) path, because it is a blend of the other two. We use small numbers and small sizes in an attempt to avoid benchmarking memory allocation and copying. We use scalars instead of pointers in an attempt to avoid benchmarking the write barriers. We benchmark four common sizes (byte, pointer, string/interface, slice), and one larger size. 

### <a id="fop" href="#fop">func fop(f func(x, y uint64) uint64) func(x, y float64) float64</a>

```
searchKey: runtime_test.fop
```

```Go
func fop(f func(x, y uint64) uint64) func(x, y float64) float64
```

turn uint64 op into float64 op 

### <a id="add" href="#add">func add(x, y float64) float64</a>

```
searchKey: runtime_test.add
```

```Go
func add(x, y float64) float64
```

### <a id="sub" href="#sub">func sub(x, y float64) float64</a>

```
searchKey: runtime_test.sub
```

```Go
func sub(x, y float64) float64
```

### <a id="mul" href="#mul">func mul(x, y float64) float64</a>

```
searchKey: runtime_test.mul
```

```Go
func mul(x, y float64) float64
```

### <a id="div" href="#div">func div(x, y float64) float64</a>

```
searchKey: runtime_test.div
```

```Go
func div(x, y float64) float64
```

### <a id="TestFloat64" href="#TestFloat64">func TestFloat64(t *testing.T)</a>

```
searchKey: runtime_test.TestFloat64
```

```Go
func TestFloat64(t *testing.T)
```

### <a id="trunc32" href="#trunc32">func trunc32(f float64) float64</a>

```
searchKey: runtime_test.trunc32
```

```Go
func trunc32(f float64) float64
```

64 -hw-> 32 -hw-> 64 

### <a id="to32sw" href="#to32sw">func to32sw(f float64) float64</a>

```
searchKey: runtime_test.to32sw
```

```Go
func to32sw(f float64) float64
```

64 -sw->32 -hw-> 64 

### <a id="to64sw" href="#to64sw">func to64sw(f float64) float64</a>

```
searchKey: runtime_test.to64sw
```

```Go
func to64sw(f float64) float64
```

64 -hw->32 -sw-> 64 

### <a id="hwint64" href="#hwint64">func hwint64(f float64) float64</a>

```
searchKey: runtime_test.hwint64
```

```Go
func hwint64(f float64) float64
```

float64 -hw-> int64 -hw-> float64 

### <a id="hwint32" href="#hwint32">func hwint32(f float64) float64</a>

```
searchKey: runtime_test.hwint32
```

```Go
func hwint32(f float64) float64
```

float64 -hw-> int32 -hw-> float64 

### <a id="toint64sw" href="#toint64sw">func toint64sw(f float64) float64</a>

```
searchKey: runtime_test.toint64sw
```

```Go
func toint64sw(f float64) float64
```

float64 -sw-> int64 -hw-> float64 

### <a id="fromint64sw" href="#fromint64sw">func fromint64sw(f float64) float64</a>

```
searchKey: runtime_test.fromint64sw
```

```Go
func fromint64sw(f float64) float64
```

float64 -hw-> int64 -sw-> float64 

### <a id="err" href="#err">func err(t *testing.T, format string, args ...interface{})</a>

```
searchKey: runtime_test.err
```

```Go
func err(t *testing.T, format string, args ...interface{})
```

### <a id="test" href="#test">func test(t *testing.T, op string, hw, sw func(float64, float64) float64, all []float64)</a>

```
searchKey: runtime_test.test
```

```Go
func test(t *testing.T, op string, hw, sw func(float64, float64) float64, all []float64)
```

### <a id="testu" href="#testu">func testu(t *testing.T, op string, hw, sw func(float64) float64, v float64)</a>

```
searchKey: runtime_test.testu
```

```Go
func testu(t *testing.T, op string, hw, sw func(float64) float64, v float64)
```

### <a id="hwcmp" href="#hwcmp">func hwcmp(f, g float64) (cmp int, isnan bool)</a>

```
searchKey: runtime_test.hwcmp
```

```Go
func hwcmp(f, g float64) (cmp int, isnan bool)
```

### <a id="testcmp" href="#testcmp">func testcmp(t *testing.T, f, g float64)</a>

```
searchKey: runtime_test.testcmp
```

```Go
func testcmp(t *testing.T, f, g float64)
```

### <a id="same" href="#same">func same(f, g float64) bool</a>

```
searchKey: runtime_test.same
```

```Go
func same(f, g float64) bool
```

### <a id="TestStackMem" href="#TestStackMem">func TestStackMem(t *testing.T)</a>

```
searchKey: runtime_test.TestStackMem
```

```Go
func TestStackMem(t *testing.T)
```

TestStackMem measures per-thread stack segment cache behavior. The test consumed up to 500MB in the past. 

### <a id="TestStackGrowth" href="#TestStackGrowth">func TestStackGrowth(t *testing.T)</a>

```
searchKey: runtime_test.TestStackGrowth
```

```Go
func TestStackGrowth(t *testing.T)
```

Test stack growing in different contexts. 

### <a id="growStack" href="#growStack">func growStack(progress *uint32)</a>

```
searchKey: runtime_test.growStack
```

```Go
func growStack(progress *uint32)
```

### <a id="growStackIter" href="#growStackIter">func growStackIter(p *int, n int)</a>

```
searchKey: runtime_test.growStackIter
```

```Go
func growStackIter(p *int, n int)
```

This function is not an anonymous func, so that the compiler can do escape analysis and place x on stack (and subsequently stack growth update the pointer). 

### <a id="TestStackGrowthCallback" href="#TestStackGrowthCallback">func TestStackGrowthCallback(t *testing.T)</a>

```
searchKey: runtime_test.TestStackGrowthCallback
```

```Go
func TestStackGrowthCallback(t *testing.T)
```

### <a id="growStackWithCallback" href="#growStackWithCallback">func growStackWithCallback(cb func())</a>

```
searchKey: runtime_test.growStackWithCallback
```

```Go
func growStackWithCallback(cb func())
```

### <a id="set" href="#set">func set(p *int, x int)</a>

```
searchKey: runtime_test.set
```

```Go
func set(p *int, x int)
```

TestDeferPtrs tests the adjustment of Defer's argument pointers (p aka &y) during a stack copy. 

### <a id="TestDeferPtrs" href="#TestDeferPtrs">func TestDeferPtrs(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferPtrs
```

```Go
func TestDeferPtrs(t *testing.T)
```

### <a id="TestDeferPtrsGoexit" href="#TestDeferPtrsGoexit">func TestDeferPtrsGoexit(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferPtrsGoexit
```

```Go
func TestDeferPtrsGoexit(t *testing.T)
```

TestDeferPtrsGoexit is like TestDeferPtrs but exercises the possibility that the stack grows as part of starting the deferred function. It calls Goexit at various stack depths, forcing the deferred function (with >4kB of args) to be run at the bottom of the stack. The goal is to find a stack depth less than 4kB from the end of the stack. Each trial runs in a different goroutine so that an earlier stack growth does not invalidate a later attempt. 

### <a id="testDeferPtrsGoexit" href="#testDeferPtrsGoexit">func testDeferPtrsGoexit(c chan int, i int)</a>

```
searchKey: runtime_test.testDeferPtrsGoexit
```

```Go
func testDeferPtrsGoexit(c chan int, i int)
```

### <a id="setBig" href="#setBig">func setBig(p *int, x int, b bigBuf)</a>

```
searchKey: runtime_test.setBig
```

```Go
func setBig(p *int, x int, b bigBuf)
```

### <a id="TestDeferPtrsPanic" href="#TestDeferPtrsPanic">func TestDeferPtrsPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferPtrsPanic
```

```Go
func TestDeferPtrsPanic(t *testing.T)
```

TestDeferPtrsPanic is like TestDeferPtrsGoexit, but it's using panic instead of Goexit to run the Defers. Those two are different execution paths in the runtime. 

### <a id="testDeferPtrsPanic" href="#testDeferPtrsPanic">func testDeferPtrsPanic(c chan int, i int)</a>

```
searchKey: runtime_test.testDeferPtrsPanic
```

```Go
func testDeferPtrsPanic(c chan int, i int)
```

### <a id="testDeferLeafSigpanic1" href="#testDeferLeafSigpanic1">func testDeferLeafSigpanic1()</a>

```
searchKey: runtime_test.testDeferLeafSigpanic1
```

```Go
func testDeferLeafSigpanic1()
```

### <a id="TestDeferLeafSigpanic" href="#TestDeferLeafSigpanic">func TestDeferLeafSigpanic(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferLeafSigpanic
```

```Go
func TestDeferLeafSigpanic(t *testing.T)
```

TestDeferLeafSigpanic tests defer matching around leaf functions that sigpanic. This is tricky because on LR machines the outer function and the inner function have the same SP, but it's critical that we match up the defer correctly to get the right liveness map. See issue #25499. 

### <a id="TestPanicUseStack" href="#TestPanicUseStack">func TestPanicUseStack(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicUseStack
```

```Go
func TestPanicUseStack(t *testing.T)
```

TestPanicUseStack checks that a chain of Panic structs on the stack are updated correctly if the stack grows during the deferred execution that happens as a result of the panic. 

### <a id="TestPanicFar" href="#TestPanicFar">func TestPanicFar(t *testing.T)</a>

```
searchKey: runtime_test.TestPanicFar
```

```Go
func TestPanicFar(t *testing.T)
```

### <a id="useStackAndCall" href="#useStackAndCall">func useStackAndCall(n int, f func())</a>

```
searchKey: runtime_test.useStackAndCall
```

```Go
func useStackAndCall(n int, f func())
```

use about n KB of stack and call f 

### <a id="useStack" href="#useStack">func useStack(n int)</a>

```
searchKey: runtime_test.useStack
```

```Go
func useStack(n int)
```

### <a id="growing" href="#growing">func growing(c chan int, done chan struct{})</a>

```
searchKey: runtime_test.growing
```

```Go
func growing(c chan int, done chan struct{})
```

### <a id="TestStackCache" href="#TestStackCache">func TestStackCache(t *testing.T)</a>

```
searchKey: runtime_test.TestStackCache
```

```Go
func TestStackCache(t *testing.T)
```

### <a id="TestStackOutput" href="#TestStackOutput">func TestStackOutput(t *testing.T)</a>

```
searchKey: runtime_test.TestStackOutput
```

```Go
func TestStackOutput(t *testing.T)
```

### <a id="TestStackAllOutput" href="#TestStackAllOutput">func TestStackAllOutput(t *testing.T)</a>

```
searchKey: runtime_test.TestStackAllOutput
```

```Go
func TestStackAllOutput(t *testing.T)
```

### <a id="TestStackPanic" href="#TestStackPanic">func TestStackPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestStackPanic
```

```Go
func TestStackPanic(t *testing.T)
```

### <a id="BenchmarkStackCopyPtr" href="#BenchmarkStackCopyPtr">func BenchmarkStackCopyPtr(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackCopyPtr
```

```Go
func BenchmarkStackCopyPtr(b *testing.B)
```

### <a id="countp" href="#countp">func countp(n *int)</a>

```
searchKey: runtime_test.countp
```

```Go
func countp(n *int)
```

### <a id="BenchmarkStackCopy" href="#BenchmarkStackCopy">func BenchmarkStackCopy(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackCopy
```

```Go
func BenchmarkStackCopy(b *testing.B)
```

### <a id="count" href="#count">func count(n int) int</a>

```
searchKey: runtime_test.count
```

```Go
func count(n int) int
```

### <a id="BenchmarkStackCopyNoCache" href="#BenchmarkStackCopyNoCache">func BenchmarkStackCopyNoCache(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkStackCopyNoCache
```

```Go
func BenchmarkStackCopyNoCache(b *testing.B)
```

### <a id="count1" href="#count1">func count1(n int) int</a>

```
searchKey: runtime_test.count1
```

```Go
func count1(n int) int
```

### <a id="count2" href="#count2">func count2(n int) int</a>

```
searchKey: runtime_test.count2
```

```Go
func count2(n int) int
```

### <a id="count3" href="#count3">func count3(n int) int</a>

```
searchKey: runtime_test.count3
```

```Go
func count3(n int) int
```

### <a id="count4" href="#count4">func count4(n int) int</a>

```
searchKey: runtime_test.count4
```

```Go
func count4(n int) int
```

### <a id="count5" href="#count5">func count5(n int) int</a>

```
searchKey: runtime_test.count5
```

```Go
func count5(n int) int
```

### <a id="count6" href="#count6">func count6(n int) int</a>

```
searchKey: runtime_test.count6
```

```Go
func count6(n int) int
```

### <a id="count7" href="#count7">func count7(n int) int</a>

```
searchKey: runtime_test.count7
```

```Go
func count7(n int) int
```

### <a id="count8" href="#count8">func count8(n int) int</a>

```
searchKey: runtime_test.count8
```

```Go
func count8(n int) int
```

### <a id="count9" href="#count9">func count9(n int) int</a>

```
searchKey: runtime_test.count9
```

```Go
func count9(n int) int
```

### <a id="count10" href="#count10">func count10(n int) int</a>

```
searchKey: runtime_test.count10
```

```Go
func count10(n int) int
```

### <a id="count11" href="#count11">func count11(n int) int</a>

```
searchKey: runtime_test.count11
```

```Go
func count11(n int) int
```

### <a id="count12" href="#count12">func count12(n int) int</a>

```
searchKey: runtime_test.count12
```

```Go
func count12(n int) int
```

### <a id="count13" href="#count13">func count13(n int) int</a>

```
searchKey: runtime_test.count13
```

```Go
func count13(n int) int
```

### <a id="count14" href="#count14">func count14(n int) int</a>

```
searchKey: runtime_test.count14
```

```Go
func count14(n int) int
```

### <a id="count15" href="#count15">func count15(n int) int</a>

```
searchKey: runtime_test.count15
```

```Go
func count15(n int) int
```

### <a id="count16" href="#count16">func count16(n int) int</a>

```
searchKey: runtime_test.count16
```

```Go
func count16(n int) int
```

### <a id="count17" href="#count17">func count17(n int) int</a>

```
searchKey: runtime_test.count17
```

```Go
func count17(n int) int
```

### <a id="count18" href="#count18">func count18(n int) int</a>

```
searchKey: runtime_test.count18
```

```Go
func count18(n int) int
```

### <a id="count19" href="#count19">func count19(n int) int</a>

```
searchKey: runtime_test.count19
```

```Go
func count19(n int) int
```

### <a id="count20" href="#count20">func count20(n int) int</a>

```
searchKey: runtime_test.count20
```

```Go
func count20(n int) int
```

### <a id="count21" href="#count21">func count21(n int) int</a>

```
searchKey: runtime_test.count21
```

```Go
func count21(n int) int
```

### <a id="count22" href="#count22">func count22(n int) int</a>

```
searchKey: runtime_test.count22
```

```Go
func count22(n int) int
```

### <a id="count23" href="#count23">func count23(n int) int</a>

```
searchKey: runtime_test.count23
```

```Go
func count23(n int) int
```

### <a id="TestStackWrapperCaller" href="#TestStackWrapperCaller">func TestStackWrapperCaller(t *testing.T)</a>

```
searchKey: runtime_test.TestStackWrapperCaller
```

```Go
func TestStackWrapperCaller(t *testing.T)
```

### <a id="TestStackWrapperCallers" href="#TestStackWrapperCallers">func TestStackWrapperCallers(t *testing.T)</a>

```
searchKey: runtime_test.TestStackWrapperCallers
```

```Go
func TestStackWrapperCallers(t *testing.T)
```

### <a id="TestStackWrapperStack" href="#TestStackWrapperStack">func TestStackWrapperStack(t *testing.T)</a>

```
searchKey: runtime_test.TestStackWrapperStack
```

```Go
func TestStackWrapperStack(t *testing.T)
```

### <a id="TestStackWrapperStackPanic" href="#TestStackWrapperStackPanic">func TestStackWrapperStackPanic(t *testing.T)</a>

```
searchKey: runtime_test.TestStackWrapperStackPanic
```

```Go
func TestStackWrapperStackPanic(t *testing.T)
```

### <a id="testStackWrapperPanic" href="#testStackWrapperPanic">func testStackWrapperPanic(t *testing.T, cb func(), expect string)</a>

```
searchKey: runtime_test.testStackWrapperPanic
```

```Go
func testStackWrapperPanic(t *testing.T, cb func(), expect string)
```

### <a id="TestCallersFromWrapper" href="#TestCallersFromWrapper">func TestCallersFromWrapper(t *testing.T)</a>

```
searchKey: runtime_test.TestCallersFromWrapper
```

```Go
func TestCallersFromWrapper(t *testing.T)
```

### <a id="TestTracebackSystemstack" href="#TestTracebackSystemstack">func TestTracebackSystemstack(t *testing.T)</a>

```
searchKey: runtime_test.TestTracebackSystemstack
```

```Go
func TestTracebackSystemstack(t *testing.T)
```

### <a id="TestTracebackAncestors" href="#TestTracebackAncestors">func TestTracebackAncestors(t *testing.T)</a>

```
searchKey: runtime_test.TestTracebackAncestors
```

```Go
func TestTracebackAncestors(t *testing.T)
```

### <a id="TestDeferLiveness" href="#TestDeferLiveness">func TestDeferLiveness(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferLiveness
```

```Go
func TestDeferLiveness(t *testing.T)
```

Test that defer closure is correctly scanned when the stack is scanned. 

### <a id="TestDeferHeapAndStack" href="#TestDeferHeapAndStack">func TestDeferHeapAndStack(t *testing.T)</a>

```
searchKey: runtime_test.TestDeferHeapAndStack
```

```Go
func TestDeferHeapAndStack(t *testing.T)
```

### <a id="deferHeapAndStack" href="#deferHeapAndStack">func deferHeapAndStack(n int) (r int)</a>

```
searchKey: runtime_test.deferHeapAndStack
```

```Go
func deferHeapAndStack(n int) (r int)
```

deferHeapAndStack(n) computes 2*n 

### <a id="TestTracebackInlineExcluded" href="#TestTracebackInlineExcluded">func TestTracebackInlineExcluded(t *testing.T)</a>

```
searchKey: runtime_test.TestTracebackInlineExcluded
```

```Go
func TestTracebackInlineExcluded(t *testing.T)
```

Test that when F -> G is inlined and F is excluded from stack traces, G still appears. 

### <a id="tracebackExcluded" href="#tracebackExcluded">func tracebackExcluded()</a>

```
searchKey: runtime_test.tracebackExcluded
```

```Go
func tracebackExcluded()
```

tracebackExcluded should be excluded from tracebacks. There are various ways this could come up. Linking it to a "runtime." name is rather synthetic, but it's easy and reliable. See issue #42754 for one way this happened in real code. 

### <a id="tracebackNotExcluded" href="#tracebackNotExcluded">func tracebackNotExcluded()</a>

```
searchKey: runtime_test.tracebackNotExcluded
```

```Go
func tracebackNotExcluded()
```

tracebackNotExcluded should be inlined into tracebackExcluded, but should not itself be excluded from the traceback. 

### <a id="BenchmarkCompareStringEqual" href="#BenchmarkCompareStringEqual">func BenchmarkCompareStringEqual(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringEqual
```

```Go
func BenchmarkCompareStringEqual(b *testing.B)
```

### <a id="BenchmarkCompareStringIdentical" href="#BenchmarkCompareStringIdentical">func BenchmarkCompareStringIdentical(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringIdentical
```

```Go
func BenchmarkCompareStringIdentical(b *testing.B)
```

### <a id="BenchmarkCompareStringSameLength" href="#BenchmarkCompareStringSameLength">func BenchmarkCompareStringSameLength(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringSameLength
```

```Go
func BenchmarkCompareStringSameLength(b *testing.B)
```

### <a id="BenchmarkCompareStringDifferentLength" href="#BenchmarkCompareStringDifferentLength">func BenchmarkCompareStringDifferentLength(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringDifferentLength
```

```Go
func BenchmarkCompareStringDifferentLength(b *testing.B)
```

### <a id="BenchmarkCompareStringBigUnaligned" href="#BenchmarkCompareStringBigUnaligned">func BenchmarkCompareStringBigUnaligned(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringBigUnaligned
```

```Go
func BenchmarkCompareStringBigUnaligned(b *testing.B)
```

### <a id="BenchmarkCompareStringBig" href="#BenchmarkCompareStringBig">func BenchmarkCompareStringBig(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkCompareStringBig
```

```Go
func BenchmarkCompareStringBig(b *testing.B)
```

### <a id="BenchmarkConcatStringAndBytes" href="#BenchmarkConcatStringAndBytes">func BenchmarkConcatStringAndBytes(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkConcatStringAndBytes
```

```Go
func BenchmarkConcatStringAndBytes(b *testing.B)
```

### <a id="BenchmarkSliceByteToString" href="#BenchmarkSliceByteToString">func BenchmarkSliceByteToString(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkSliceByteToString
```

```Go
func BenchmarkSliceByteToString(b *testing.B)
```

### <a id="BenchmarkRuneCount" href="#BenchmarkRuneCount">func BenchmarkRuneCount(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRuneCount
```

```Go
func BenchmarkRuneCount(b *testing.B)
```

### <a id="BenchmarkRuneIterate" href="#BenchmarkRuneIterate">func BenchmarkRuneIterate(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkRuneIterate
```

```Go
func BenchmarkRuneIterate(b *testing.B)
```

### <a id="BenchmarkArrayEqual" href="#BenchmarkArrayEqual">func BenchmarkArrayEqual(b *testing.B)</a>

```
searchKey: runtime_test.BenchmarkArrayEqual
```

```Go
func BenchmarkArrayEqual(b *testing.B)
```

### <a id="TestStringW" href="#TestStringW">func TestStringW(t *testing.T)</a>

```
searchKey: runtime_test.TestStringW
```

```Go
func TestStringW(t *testing.T)
```

### <a id="TestLargeStringConcat" href="#TestLargeStringConcat">func TestLargeStringConcat(t *testing.T)</a>

```
searchKey: runtime_test.TestLargeStringConcat
```

```Go
func TestLargeStringConcat(t *testing.T)
```

### <a id="TestCompareTempString" href="#TestCompareTempString">func TestCompareTempString(t *testing.T)</a>

```
searchKey: runtime_test.TestCompareTempString
```

```Go
func TestCompareTempString(t *testing.T)
```

### <a id="TestStringIndexHaystack" href="#TestStringIndexHaystack">func TestStringIndexHaystack(t *testing.T)</a>

```
searchKey: runtime_test.TestStringIndexHaystack
```

```Go
func TestStringIndexHaystack(t *testing.T)
```

### <a id="TestStringIndexNeedle" href="#TestStringIndexNeedle">func TestStringIndexNeedle(t *testing.T)</a>

```
searchKey: runtime_test.TestStringIndexNeedle
```

```Go
func TestStringIndexNeedle(t *testing.T)
```

### <a id="TestStringOnStack" href="#TestStringOnStack">func TestStringOnStack(t *testing.T)</a>

```
searchKey: runtime_test.TestStringOnStack
```

```Go
func TestStringOnStack(t *testing.T)
```

### <a id="TestIntString" href="#TestIntString">func TestIntString(t *testing.T)</a>

```
searchKey: runtime_test.TestIntString
```

```Go
func TestIntString(t *testing.T)
```

### <a id="TestIntStringAllocs" href="#TestIntStringAllocs">func TestIntStringAllocs(t *testing.T)</a>

```
searchKey: runtime_test.TestIntStringAllocs
```

```Go
func TestIntStringAllocs(t *testing.T)
```

### <a id="TestRangeStringCast" href="#TestRangeStringCast">func TestRangeStringCast(t *testing.T)</a>

```
searchKey: runtime_test.TestRangeStringCast
```

```Go
func TestRangeStringCast(t *testing.T)
```

### <a id="isZeroed" href="#isZeroed">func isZeroed(b []byte) bool</a>

```
searchKey: runtime_test.isZeroed
```

```Go
func isZeroed(b []byte) bool
```

### <a id="isZeroedR" href="#isZeroedR">func isZeroedR(r []rune) bool</a>

```
searchKey: runtime_test.isZeroedR
```

```Go
func isZeroedR(r []rune) bool
```

### <a id="TestString2Slice" href="#TestString2Slice">func TestString2Slice(t *testing.T)</a>

```
searchKey: runtime_test.TestString2Slice
```

```Go
func TestString2Slice(t *testing.T)
```

### <a id="TestAtoi" href="#TestAtoi">func TestAtoi(t *testing.T)</a>

```
searchKey: runtime_test.TestAtoi
```

```Go
func TestAtoi(t *testing.T)
```

### <a id="TestAtoi32" href="#TestAtoi32">func TestAtoi32(t *testing.T)</a>

```
searchKey: runtime_test.TestAtoi32
```

```Go
func TestAtoi32(t *testing.T)
```

### <a id="TestCaller" href="#TestCaller">func TestCaller(t *testing.T)</a>

```
searchKey: runtime_test.TestCaller
```

```Go
func TestCaller(t *testing.T)
```

### <a id="testCallerFoo" href="#testCallerFoo">func testCallerFoo(t *testing.T)</a>

```
searchKey: runtime_test.testCallerFoo
```

```Go
func testCallerFoo(t *testing.T)
```

These are marked noinline so that we can use FuncForPC in testCallerBar. 

### <a id="testCallerBar" href="#testCallerBar">func testCallerBar(t *testing.T)</a>

```
searchKey: runtime_test.testCallerBar
```

```Go
func testCallerBar(t *testing.T)
```

### <a id="lineNumber" href="#lineNumber">func lineNumber() int</a>

```
searchKey: runtime_test.lineNumber
```

```Go
func lineNumber() int
```

### <a id="trythis" href="#trythis">func trythis()</a>

```
searchKey: runtime_test.trythis
```

```Go
func trythis()
```

### <a id="recordLines" href="#recordLines">func recordLines(a, b, c int)</a>

```
searchKey: runtime_test.recordLines
```

```Go
func recordLines(a, b, c int)
```

### <a id="TestLineNumber" href="#TestLineNumber">func TestLineNumber(t *testing.T)</a>

```
searchKey: runtime_test.TestLineNumber
```

```Go
func TestLineNumber(t *testing.T)
```

### <a id="TestNilName" href="#TestNilName">func TestNilName(t *testing.T)</a>

```
searchKey: runtime_test.TestNilName
```

```Go
func TestNilName(t *testing.T)
```

### <a id="inlined" href="#inlined">func inlined()</a>

```
searchKey: runtime_test.inlined
```

```Go
func inlined()
```

### <a id="tracebackFunc" href="#tracebackFunc">func tracebackFunc(t *testing.T) uintptr</a>

```
searchKey: runtime_test.tracebackFunc
```

```Go
func tracebackFunc(t *testing.T) uintptr
```

A function with an InlTree. Returns a PC within the function body. 

No inline to ensure this complete function appears in output. 

### <a id="TestFunctionAlignmentTraceback" href="#TestFunctionAlignmentTraceback">func TestFunctionAlignmentTraceback(t *testing.T)</a>

```
searchKey: runtime_test.TestFunctionAlignmentTraceback
```

```Go
func TestFunctionAlignmentTraceback(t *testing.T)
```

Test that CallersFrames handles PCs in the alignment region between functions (int 3 on amd64) without crashing. 

Go will never generate a stack trace containing such an address, as it is not a valid call site. However, the cgo traceback function passed to runtime.SetCgoTraceback may not be completely accurate and may incorrect provide PCs in Go code or the alignement region between functions. 

Go obviously doesn't easily expose the problematic PCs to running programs, so this test is a bit fragile. Some details: 

* tracebackFunc is our target function. We want to get a PC in the 

```
alignment region following this function. This function also has other
functions inlined into it to ensure it has an InlTree (this was the source
of the bug in issue 44971).

```
* We acquire a PC in tracebackFunc, walking forwards until FuncForPC says 

```
we're in a new function. The last PC of the function according to FuncForPC
should be in the alignment region (assuming the function isn't already
perfectly aligned).

```
This is a regression test for issue 44971. 

### <a id="TestFakeTime" href="#TestFakeTime">func TestFakeTime(t *testing.T)</a>

```
searchKey: runtime_test.TestFakeTime
```

```Go
func TestFakeTime(t *testing.T)
```

### <a id="parseFakeTime" href="#parseFakeTime">func parseFakeTime(x []byte) ([]fakeTimeFrame, error)</a>

```
searchKey: runtime_test.parseFakeTime
```

```Go
func parseFakeTime(x []byte) ([]fakeTimeFrame, error)
```

### <a id="TestTracebackArgs" href="#TestTracebackArgs">func TestTracebackArgs(t *testing.T)</a>

```
searchKey: runtime_test.TestTracebackArgs
```

```Go
func TestTracebackArgs(t *testing.T)
```

### <a id="testTracebackArgs1" href="#testTracebackArgs1">func testTracebackArgs1(a, b, c, d, e, f, g, h, i, j, k, l int) int</a>

```
searchKey: runtime_test.testTracebackArgs1
```

```Go
func testTracebackArgs1(a, b, c, d, e, f, g, h, i, j, k, l int) int
```

### <a id="testTracebackArgs2" href="#testTracebackArgs2">func testTracebackArgs2(a bool, b struct {...</a>

```
searchKey: runtime_test.testTracebackArgs2
```

```Go
func testTracebackArgs2(a bool, b struct {
	a, b, c int
	x       [2]int
}, _ [0]int, d [3]byte) int
```

### <a id="testTracebackArgs3" href="#testTracebackArgs3">func testTracebackArgs3(x [3]byte, a, b, c int, y [3]byte) int</a>

```
searchKey: runtime_test.testTracebackArgs3
```

```Go
func testTracebackArgs3(x [3]byte, a, b, c int, y [3]byte) int
```

### <a id="testTracebackArgs4" href="#testTracebackArgs4">func testTracebackArgs4(a bool, x [1][1][1][1][1][1][1][1][1][1]int) int</a>

```
searchKey: runtime_test.testTracebackArgs4
```

```Go
func testTracebackArgs4(a bool, x [1][1][1][1][1][1][1][1][1][1]int) int
```

### <a id="testTracebackArgs5" href="#testTracebackArgs5">func testTracebackArgs5(a bool, x struct {...</a>

```
searchKey: runtime_test.testTracebackArgs5
```

```Go
func testTracebackArgs5(a bool, x struct {
	x int
	y [0]int
	z [2][0]int
}, _, _, _, _, _, _, _, _, _, _, _, _ [0]int) int
```

